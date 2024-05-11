#include <stdio.h>
#include <kernel/tty.h>
#include <kernel/pfa.h>
#include <stdint.h>
#include <stdlib.h>

void kernel_main(void) {
  // terminal_initialize();
  printf("\nHello, Kernel World.\n");
  printf("%s", "Simple OS.\n");

  // printf("\n");
  // pageframe_t frame0 = kalloc_frame();
  // printf("frame_start: %u, frame_end: %u\n", frame0, frame0 + PAGE_SIZE);
  // pageframe_t frame1 = kalloc_frame();
  // printf("frame_start: %u, frame_end: %u\n", frame1, frame1 + PAGE_SIZE);
  // kfree_frame(frame0);
  // kfree_frame(frame1);
  //
  // frame0 = kalloc_frame();
  // printf("frame_start: %u, frame_end: %u\n", frame0, frame0 + PAGE_SIZE);
  // frame1 = kalloc_frame();
  // printf("frame_start: %u, frame_end: %u\n", frame1, frame1 + PAGE_SIZE);
  // kfree_frame(frame0);
  // kfree_frame(frame1);

  printf("interrupting...\n");
  // asm volatile("int $0x01");
  asm volatile("int $0x02");
  // asm volatile("int $0x03");
  printf("interrupt done\n");
}
