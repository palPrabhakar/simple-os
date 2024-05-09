#include <kernel/pfa.h>
#include <stdio.h>
#include <stdlib.h>

#define CHECK_FLAG(flags, bit) ((flags) & (1 << (bit)))

extern uint32_t startkernel;
extern uint32_t endkernel;

static uint32_t npages = 0;
static uint32_t *frame_stack = &endkernel;

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
    printf("size = %u, addr_low = %u, addr_end = %u, len_low = %u, type = %u\n",
           (uint32_t)mmap->size, (uint32_t)mmap->addr_low,
           (uint32_t)mmap->addr_low + mmap->len_low, (uint32_t)mmap->len_low,
           (uint32_t)mmap->type);

    if (mmap->type == MULTIBOOT_MEMORY_AVAILABLE) {
      // check if addr_low is 4KB aligned
      int32_t rem = mmap->addr_low % PAGE_SIZE;
      if (rem) {
        mmap->addr_low += PAGE_SIZE - rem;
        mmap->len_low -= PAGE_SIZE - rem;
      }

      // check if the end is at 4KB boundary
      rem = (mmap->addr_low + mmap->len_low) % PAGE_SIZE;
      if (rem) {
        mmap->len_low -= rem;
      }

      npages += mmap->len_low / PAGE_SIZE;
    }
  }

  // In reality less bytes will be required
  // Worst case scenario 1 extra page is wasted
  uint32_t kernel_start = (uint32_t)&startkernel;
  uint32_t kernel_end = (uint32_t)&endkernel + npages * 4;
  kernel_end = kernel_end + (PAGE_SIZE - (kernel_end % PAGE_SIZE));

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

        *frame_stack = start;
        ++frame_stack;
        ++npages;
      }
    }
  }
}

pageframe_t kalloc_frame() {
  if(npages == 0) {
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
