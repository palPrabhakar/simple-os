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

  // printf("\n----Page Frame Allocator----\n");
  // printf("kernel_start: %u\n", (uint32_t)&startkernel);
  // printf("kernel_end: %u\n", (uint32_t)&endkernel);

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
  uint32_t total_mem = 0;
  uint32_t total_free_mem = 0;

  for (; (unsigned long)mmap < mbi->mmap_addr + mbi->mmap_length;
       mmap = (multiboot_memory_map_t *)((unsigned long)mmap + mmap->size +
                                         sizeof(mmap->size))) {
    // printf("size = %u, addr_low = %u, addr_end = %u, len_low = %u, type =
    // %u\n",
    //        (uint32_t)mmap->size, (uint32_t)mmap->addr_low,
    //        (uint32_t)mmap->addr_low + mmap->len_low, (uint32_t)mmap->len_low,
    //        (uint32_t)mmap->type);

    if (mmap->type == MULTIBOOT_MEMORY_AVAILABLE) {
      // check if addr_low is 4KB aligned
      int32_t rem = mmap->addr_low % PAGE_SIZE;
      if (rem) {
        // printf("Unaligned start addr: %u", mmap->addr_low);
        mmap->addr_low += PAGE_SIZE - rem;
        mmap->len_low -= PAGE_SIZE - rem;
        // printf(", new addr: %u\n", mmap->addr_low);
      }

      // check if the end is at 4KB boundary
      rem = (mmap->addr_low + mmap->len_low) % PAGE_SIZE;
      if (rem) {
        // printf("Unaligned end addr: %u", mmap->addr_low + mmap->len_low);
        mmap->len_low -= rem;
        // printf(", new end addr: %u\n", mmap->addr_low + mmap->len_low);
      }

      // total_free_mem += mmap->len_low;
      npages += mmap->len_low / PAGE_SIZE;
    }
  }

  // In reality less bytes will be required
  // Worst case scenario 1 extra page is wasted
  uint32_t page_tbl_size = npages * 4;
  uint32_t kernel_start = (uint32_t)&startkernel;
  uint32_t kernel_end = (uint32_t)&endkernel + page_tbl_size;
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

  // printf("total pages: %u\n", npages);
  // printf("\n");
}

// static pageframe_t kalloc_frame_int() {
//   uint32_t i = 0;
//   while (frame_map[i] != FREE) {
//     i++;
//     if (i == npages) {
//       return (ERROR);
//     }
//   }
//   frame_map[i] = USED;
//   return (startframe + (i * 0x1000)); // return the address of the page frame
//                                       // based on the location declared free
//   // in the array
// }
//
// pageframe_t kalloc_frame() {
//   static uint8_t allocate =
//       1; // whether or not we are going to allocate a new set of preframes
//   static uint8_t pframe = 0;
//   pageframe_t ret;
//
//   if (pframe == 20) {
//     allocate = 1;
//   }
//
//   if (allocate == 1) {
//     for (int i = 0; i < 20; i++) {
//       pre_frames[i] = kalloc_frame_int();
//     }
//     pframe = 0;
//     allocate = 0;
//   }
//   ret = pre_frames[pframe];
//   pframe++;
//   return (ret);
// }
//
// void kfree_frame(pageframe_t a) {
//   a = a - startframe; // get the offset from the first frame
//   if (a == 0)         // in case it is the first frame we are freeing
//   {
//     uint32_t index = (uint32_t)a;
//     frame_map[index] = FREE;
//   } else {
//     // a = a; // divide by 4kb to get the index to declare free
//     uint32_t index = ((uint32_t)a) / 0x1000;
//     frame_map[index] = FREE;
//   }
// }
