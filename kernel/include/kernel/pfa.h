#ifndef _KERNEL_PFA_H
#define _KERNEL_PFA_H
// page frame allocator

#include "multiboot.h"
#include <stddef.h>
#include <stdint.h>

#include <kernel/defs.h>

#define FREE 0x00
#define USED 0x01
#define ERROR UINT32_MAX
#define PRE 20

#define ROUND_4K(x) ((x) & 0xFFF ? ((x) + (PAGE_SIZE - ((x) & 0xFFF))) : (x))
#define CHECK_4K(x) (!((x) & 0xFFF))

typedef uint32_t pageframe_t;

uint32_t pfa_initialize(uint32_t magic, multiboot_info_t *addr);
pageframe_t kalloc_frame();
void kfree_frame(pageframe_t a);

#endif
