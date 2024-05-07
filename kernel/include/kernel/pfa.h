#ifndef _KERNEL_PFA_H
#define _KERNEL_PFA_H

#include <stddef.h>
#include <stdint.h>

#define FREE 0x00
#define USED 0x01
#define ERROR UINT32_MAX
#define PRE 20

typedef uint32_t pageframe_t;

pageframe_t kalloc_frame();
void kfree_frame(pageframe_t a);

#endif
