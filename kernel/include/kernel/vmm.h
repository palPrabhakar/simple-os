#ifndef _KERNEL_VMM_H
#define _KERNEL_VMM_H

#include <stddef.h>
#include <stdint.h>

typedef struct vm_node {
    uint32_t addr;
    size_t len;
    uint32_t next;
} vm_node_t;

void map_kernel_vm(uint32_t kernel_end);
void *mmap(size_t size);

#endif
