#include <kernel/dt.h>
#include <kernel/paging.h>
#include <kernel/pfa.h>
#include <kernel/timer.h>
#include <kernel/tty.h>
#include <stdint.h>
#include <stdio.h>
#include <sys/io.h>

extern void boot_page_directory asm("boot_page_directory");
extern void boot_page_table asm("boot_page_table");

extern char _kernel_start;
extern char _entry_sec;
extern char _text_sec;
extern char _rodata_sec;
extern char _data_sec;
extern char _bss_sec;
extern char _kernel_end;

void kernel_init(uint32_t magic, uint32_t addr) {
  terminal_initialize();
  fix_kpaging_flags();
  init_descriptor_tables();
  init_timer(50);

  // map the pfa region
  // uint32_t *dir = &boot_page_directory;
  // dir += 1023;
  // uint32_t *tbl = (uint32_t *)(*(uint32_t *)((*dir & 0xFFFFF000) + 768*4) & 0xFFFFF000);
  // for(int i = 269; i < 301; ++i) {
  //     tbl[i] = 0x10D003 + (i - 269)*4096;
  // }

  // unsigned int cr3_value;

  // // Inline assembly to move the content of CR3 into a C variable
  // asm volatile("movl %%cr3, %0"
  //              : "=r"(cr3_value) // Output operand
  //              :                 // No input operands
  //              :                 // No clobbers needed for CR3
  // );

  // // Inline assembly to move the content of ECX into CR3
  // asm volatile(
  //     "mov %0, %%cr3"
  //     :                // No output operands
  //     : "r"(cr3_value) // Input operand: register or memory holding the value
  //     : "memory"       // Clobber memory to inform the compiler of dependencies
  // );

  printf("initializing page frame allocator\n");
  pfa_initialize(magic, addr);
}

void kernel_main(void) {
  printf("\nHello, Kernel World.\n");
  printf("%s", "Simple OS.\n");

  // printf("\nboot_page_directory: %x\n", &boot_page_directory);
  // printf("\nboot_page_table: %x\n", &boot_page_table);

  // printf("\n======================\n");
  // printf("_kernel_start: %x\n", &_kernel_start);
  // printf("_entry_sec: %x\n", &_entry_sec);
  // printf("_text_sec: %x\n", &_text_sec);
  // printf("_rodata_sec: %x\n", &_rodata_sec);
  // printf("_data_sec: %x\n", &_data_sec);
  // printf("_bss_sec: %x\n", &_bss_sec);
  // printf("_kernel_end: %x\n", &_kernel_end);
  // printf("======================\n");


  // Do page fault
  // uint32_t *ptr = (uint32_t *)0xA0000000;
  // uint32_t do_page_fault = *ptr;

  printf("\n");
  pageframe_t frame0 = kalloc_frame();
  printf("frame_start: %x, frame_end: %x\n", frame0, frame0 + PAGE_SIZE);
  printf("\n");
  pageframe_t frame1 = kalloc_frame();
  printf("frame_start: %x, frame_end: %x\n", frame1, frame1 + PAGE_SIZE);
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
  // asm volatile("int $0x21");
  // asm volatile("int $0x22");
  // printf("interrupt done\n");

  // enable the keyboard interrupt
  outb(0x21, 0xFD);
  // outb(0xA1, 0xFF);

  for (;;) {
    asm("hlt");
  }
}
