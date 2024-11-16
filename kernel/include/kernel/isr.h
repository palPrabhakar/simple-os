#ifndef _KERNEL_ISR_H
#define _KERNEL_ISR_H

#include <stdint.h>

struct registers {
    uint32_t ds;                                     // data segment selector
    uint32_t edi, esi, ebp, esp, ebx, edx, ecx, eax; // pushed by pusha
    uint32_t int_no, err_code;             // interrupt number and error code
    uint32_t eip, cs, eflags, useresp, ss; // pushed by processor automatically
} __attribute__((packed));
typedef struct registers registers_t;

#endif
