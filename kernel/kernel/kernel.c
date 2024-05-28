#include <kernel/paging.h>
#include <kernel/pfa.h>
#include <kernel/tty.h>
#include <kernel/dt.h>
#include <stdint.h>
#include <stdio.h>

void kernel_init(uint32_t magic, uint32_t addr) {
  terminal_initialize();
  // init_descriptor_tables();
  // pfa_initialize(magic, addr);
}

void kernel_main(void) {
  // initialize_paging();

  printf("\nHello, Kernel World.\n");
  printf("%s", "Simple OS.\n");

  // Do page fault
  // uint32_t *ptr = (uint32_t *)0xA0000000;
  // uint32_t do_page_fault = *ptr;

  // printf("\n");
  // pageframe_t frame0 = kalloc_frame();
  // printf("frame_start: %x, frame_end: %x\n", frame0, frame0 + PAGE_SIZE);
  // pageframe_t frame1 = kalloc_frame();
  // printf("frame_start: %x, frame_end: %x\n", frame1, frame1 + PAGE_SIZE);
  // kfree_frame(frame0);
  // kfree_frame(frame1);
  //
  // frame0 = kalloc_frame();
  // printf("frame_start: %u, frame_end: %u\n", frame0, frame0 + PAGE_SIZE);
  // frame1 = kalloc_frame();
  // printf("frame_start: %u, frame_end: %u\n", frame1, frame1 + PAGE_SIZE);
  // kfree_frame(frame0);
  // kfree_frame(frame1);

  // printf("interrupting...\n");
  // asm volatile("int $0x01");
  // asm volatile("int $0x02");
  // asm volatile("int $0x03");
  // printf("interrupt done\n");
}
