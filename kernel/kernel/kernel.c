#include "kernel/defs.h"
#include "kernel/vmm.h"
#include "multiboot.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/io.h>

#include <kernel/dt.h>
#include <kernel/paging.h>
#include <kernel/pfa.h>
#include <kernel/timer.h>
#include <kernel/tty.h>
#include <kernel/vmm.h>

extern void boot_page_directory(void) asm("boot_page_directory");

void kernel_init(uint32_t magic, uint32_t addr) {
    terminal_initialize();
    init_descriptor_tables();
    init_timer(50);
    set_active_directory((page_dir_t *)&boot_page_directory);
    uint32_t kend =
        pfa_initialize(magic, (multiboot_info_t *)(addr + KERNEL_VSTART));
    map_kernel_vm(kend);
    fix_kpage_table();
}

void kernel_main(void) {
    printf("Hello, Kernel World.\n");
    printf("%s", "Simple OS.\n");

    // uint32_t *ptr = mmap(2122, 0, 1);
    // *ptr = 1;
    // ptr += 1;
    // *ptr = 2;
    // printf("ptr: %u, ptr+1: %u\n", *(ptr - 1), *ptr);

    unsigned int *iptr = malloc(sizeof(unsigned int));
    *iptr = 42;
    printf("malloced iptr: %u\n", *iptr);
    free(iptr);

    size_t len = 4;

    unsigned int *iarray = malloc(len * sizeof(unsigned int));
    for(size_t i = 0; i < len; ++i) {
        iarray[i] = i;
    }
    for(size_t i = 0; i < len; ++i) {
        printf("iarray[%u]: %u\n", i, iarray[i]);
    }
    free(iarray);

    // Do page fault
    // uint32_t *ptr = (uint32_t *)0xA0000000;
    // uint32_t do_page_fault = *ptr;

    // printf("\n");
    // pageframe_t frame0 = kalloc_frame();
    // pageframe_t frame1 = kalloc_frame();
    // printf("frame_start: %x, frame_end: %x\n", frame0, frame0 + PAGE_SIZE);
    // printf("frame_start: %x, frame_end: %x\n", frame1, frame1 + PAGE_SIZE);
    // kfree_frame(frame0);
    // kfree_frame(frame1);

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
    // outb(0x21, 0xFD);
    // outb(0xA1, 0xFF);

    for (;;) {
        asm("hlt");
    }
}
