#include <kernel/pfa.h>
#include <stdio.h>
#include <stdlib.h>

#define CHECK_FLAG(flags, bit) ((flags) & (1 << (bit)))

// extern uint32_t endkernel;
// static pageframe_t startframe = (pageframe_t)&endkernel;
// // Assuming the memory is always 4GB
// static uint32_t npages = 1024;
// // static uint8_t frame_map[npages] = {FREE};
// static pageframe_t pre_frames[PRE];

void pfa_initialize(uint32_t magic, uint32_t addr) {
  multiboot_info_t *mbi;

  if (magic != MULTIBOOT_BOOTLOADER_MAGIC) {
    printf("Failed to initialized page frame allocator.\n");
    abort();
  }

  mbi = (multiboot_info_t *)addr;

  printf("flags: %u\n", (unsigned)mbi->flags);

  if (CHECK_FLAG(mbi->flags, 0)) {
    printf("mem_lower = %uKB, mem_upper = %uKB\n", (unsigned)mbi->mem_lower,
           (unsigned)mbi->mem_upper);
  }

  if (!CHECK_FLAG(mbi->flags, 6)) {
    printf("Invalid memory map found.\n");
    abort();
  }

  multiboot_memory_map_t *mmap;
  printf("mmap_addr = %x, mmap_length = %x\n", (unsigned)mbi->mmap_addr,
         (unsigned)mbi->mmap_length);

  for (mmap = (multiboot_memory_map_t *)mbi->mmap_addr;
       (unsigned long)mmap < mbi->mmap_addr + mbi->mmap_length;
       mmap = (multiboot_memory_map_t *)((unsigned long)mmap + mmap->size +
                                         sizeof(mmap->size))) {
    // printf(" size = %x, base_addr = %x - %x,"
    //        " length = %x - %x, type = %x\n",
    //        (unsigned)mmap->size, (unsigned)(mmap->addr >> 32),
    //        (unsigned)(mmap->addr & 0xffffffff), (unsigned)(mmap->len >> 32),
    //        (unsigned)(mmap->len & 0xffffffff), (unsigned)mmap->type);

    printf("size = %x, addr_low = %u, addr_end = %u, len_low = %u, type = %u\n", (uint32_t)mmap->size, (uint32_t)mmap->addr_low, (uint32_t)mmap->addr_low + mmap->len_low, (uint32_t)mmap->len_low, (uint32_t)mmap->type);
  }
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
