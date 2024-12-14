#include "multiboot.h"

#include <stdio.h>
#include <stdlib.h>

#include <kernel/paging.h>
#include <kernel/pfa.h>

#define CHECK_FLAG(flags, bit) ((flags) & (1 << (bit)))

extern uint32_t _kernel_start;
extern uint32_t _kernel_end;

static uint32_t npages = 0;
static uint32_t *frame_stack = &_kernel_end;

void pfa_initialize(uint32_t magic, uint32_t addr) {
    multiboot_info_t *mbi;

    if (magic != MULTIBOOT_BOOTLOADER_MAGIC) {
        printf("Failed to initialized page frame allocator.\n");
        abort();
    }

    mbi = (multiboot_info_t *)addr;

    if (!CHECK_FLAG(mbi->flags, 6)) {
        printf("Invalid memory map found.\n");
        abort();
    }

    // TODO
    // 1. sort mmap
    // 2. merge adjacent regions of same type
    // printf("mmap_addr = %x, mmap_length = %x\n", (unsigned)mbi->mmap_addr,
    //        (unsigned)mbi->mmap_length);
    multiboot_memory_map_t *mmap = (multiboot_memory_map_t *)mbi->mmap_addr;
    for (; (unsigned long)mmap < mbi->mmap_addr + mbi->mmap_length;
         mmap = (multiboot_memory_map_t *)((unsigned long)mmap + mmap->size +
                                           sizeof(mmap->size))) {
        // printf("size = %u, addr_low = %u, addr_end = %u, len_low = %u, type = "
        //        "%u\n",
        //        (uint32_t)mmap->size, (uint32_t)mmap->addr_low,
        //        (uint32_t)mmap->addr_low + mmap->len_low,
        //        (uint32_t)mmap->len_low, (uint32_t)mmap->type);

        if (mmap->type == MULTIBOOT_MEMORY_AVAILABLE) {
            // check if addr_low is 4KB aligned
            int32_t rem = mmap->addr_low & 0xFFF;
            if (rem) {
                mmap->addr_low += PAGE_SIZE - rem;
                mmap->len_low -= PAGE_SIZE - rem;
            }

            // check if the end is at 4KB boundary
            rem = (mmap->addr_low + mmap->len_low) & 0xFFF;
            if (rem) {
                mmap->len_low -= rem;
            }

            npages += mmap->len_low / PAGE_SIZE;
        }
    }

    uint32_t kernel_start = (uint32_t)&_kernel_start;
    uint32_t kernel_end = ROUND_4K((uint32_t)&_kernel_end);

    // map the pages/frame that will be used to store the page frame data. The
    // npages calculated above is an approx. since we don't need to map the
    // frames that will be used to store the page frame data. However, no extra
    // page/frame is wasted since the bytes required to map the page frame data
    // is less than 4K boundary.
    for (uint32_t start = kernel_end;
         start < kernel_end + npages * sizeof(uint32_t); start += PAGE_SIZE) {
        map_paddr_to_vaddr(start, start + 0xC0000000, 0, 1);
    }

    // extend the size of the kernel to include the page frame allocator data
    kernel_end += npages * sizeof(uint32_t);

    // map memory to pages
    mmap = (multiboot_memory_map_t *)mbi->mmap_addr;
    npages = 0;
    for (; (unsigned long)mmap < mbi->mmap_addr + mbi->mmap_length;
         mmap = (multiboot_memory_map_t *)((unsigned long)mmap + mmap->size +
                                           sizeof(mmap->size))) {

        if (mmap->type == MULTIBOOT_MEMORY_AVAILABLE) {

            for (uint32_t start = mmap->addr_low;
                 start < mmap->addr_low + mmap->len_low; start += PAGE_SIZE) {
                // since kernel start/end if 4KB aligned
                if (start >= (uint32_t)kernel_start && start < kernel_end)
                    continue;

                // Skip if VGA buffer
                // Not really needed!
                if((start <= 0x000B8000) && ((start + PAGE_SIZE) >= 0x000B8000))
                    continue;

                *frame_stack = start;
                ++frame_stack;
                ++npages;
            }
        }
    }

    // the kernel is loaded at 0xC0000000
    frame_stack += 0xC0000000 / sizeof(uint32_t);
}

pageframe_t kalloc_frame() {
    if (npages == 0) {
        printf("Kernel: Out of physical memory.\n");
        abort();
    }

    --npages;
    return *(--frame_stack);
}

void kfree_frame(pageframe_t a) {
    ++npages;
    *frame_stack = a;
    ++frame_stack;
}
