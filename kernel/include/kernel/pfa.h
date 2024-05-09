#ifndef _KERNEL_PFA_H
#define _KERNEL_PFA_H
// page frame allocator

#include <stddef.h>
#include <stdint.h>

#include "multiboot.h"

#define PAGE_SIZE 4096
#define FREE 0x00
#define USED 0x01
#define ERROR UINT32_MAX
#define PRE 20

typedef uint32_t pageframe_t;

void pfa_initialize(uint32_t magic, uint32_t addr);
pageframe_t kalloc_frame();
void kfree_frame(pageframe_t a);

#endif
