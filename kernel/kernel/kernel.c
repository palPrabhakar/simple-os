#include <stdio.h>
#include <kernel/tty.h>
#include <kernel/pfa.h>
#include <stdint.h>
#include <stdlib.h>

#include "multiboot.h"

#define CHECK_FLAG(flags,bit)   ((flags) & (1 << (bit)))

extern uint32_t endkernel;

void kernel_main(uint32_t magic, uint32_t addr) {
  terminal_initialize();
  printf("Hello, Kernel World.\n");
  printf("%s", "Simple OS.\n");
  const uint32_t startframe = (uint32_t)&endkernel;
  printf("endkernel: %u\n", startframe);

  printf("magic: %u\n", magic);
  printf("addrs: %u\n", addr);

  multiboot_info_t *mbi;

  if(magic != MULTIBOOT_BOOTLOADER_MAGIC) {
    printf("Invalid magic number: %u\n", magic);
    abort();
  }

  mbi = (multiboot_info_t *)addr;

  printf("flags: %u\n", (unsigned) mbi->flags);

  if (CHECK_FLAG (mbi->flags, 0))
    printf ("mem_lower = %uKB, mem_upper = %uKB\n",
            (unsigned) mbi->mem_lower, (unsigned) mbi->mem_upper);

  // pageframe_t pframe = kalloc_frame();
  // printf("pframe: %u\n", pframe);
  // kfree_frame(pframe);
}
