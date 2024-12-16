#include "kernel/defs.h"
#include <stdlib.h>
#include <stdio.h>

#include <kernel/vmm.h>
#include <kernel/pfa.h>

extern uint32_t _kernel_start;

vm_node_t *head;

void map_kernel_vm(uint32_t kernel_end) {
    vm_node_t *node = (vm_node_t *)kernel_end;
    head = node;

    /* kernel virtual address space
     * starts at 0xC0000000 (3GB)
     * ends at   0xFFFFFFFF (4GB)
     *
     * -------------- 0xC0000000
     * |Free vspace |
     * -------------- 0xC00B8000
     * |VGA BUFFER  |
     * -------------- 0XC00B8000 + PAGE_SIZE
     * |Free vspace |
     * -------------- 0xC0000000 + 1M
     * |Kernel      |
     * -------------- ROUND_4K(kernel_end)
     * |Free vspace |
     * -------------- 4GB
     *
     */

    node->addr = KERNEL_VSTART;
    node->len = (VGA_BUFFER + KERNEL_VSTART) - node->addr;

    if(!((uint32_t)(node + 1) < ROUND_4K(kernel_end))) {
        printf("map_kernel_vm: Out of Memory\n");
        abort();
    }
    node->next = (uint32_t)(node + 1);
    // printf("0 node->addr: %x\n", node->addr);
    // printf("0 node->len: %u\n", node->len);
    // printf("0 node->next: %x\n\n", node->next);

    node = (vm_node_t *)node->next;
    node->addr = (VGA_BUFFER + KERNEL_VSTART) + 4096;
    node->len = (uint32_t)&_kernel_start + KERNEL_VSTART - node->addr;

    if(!((uint32_t)(node + 1) < ROUND_4K(kernel_end))) {
        printf("map_kernel_vm: Out of Memory\n");
        abort();
    }
    node->next = (uint32_t)(node + 1);
    // printf("1 node->addr: %x\n", node->addr);
    // printf("1 node->len: %u\n", node->len);
    // printf("1 node->next: %x\n\n", node->next);

    node = (vm_node_t *)node->next;
    node->addr = ROUND_4K(kernel_end);
    node->len = 0xFFFFFFFF - node->addr + 1;
    node->next = -1;
    // printf("2 node->addr: %x\n", node->addr);
    // printf("2 node->len: %u\n", node->len);
    // printf("2 node->next: %u\n\n", node->next);

    // printf("\nhead addr: %x\n", head->addr);
    // printf("head->next addr: %x\n", ((vm_node_t *)head->next)->addr);
    // printf("head->next->next addr: %x\n", ((vm_node_t *)((vm_node_t *)head->next)->next)->addr);
};

/*
 * Allocate virtual memory in multiples of page size
 */
void *mmap(size_t size) {
    if(size <= PAGE_SIZE) {
        printf("mmap: Size must be a greater than %u.\n", PAGE_SIZE);
        abort();
    }
    return NULL;
}
