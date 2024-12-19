#include "kernel/defs.h"
#include <stdio.h>
#include <stdlib.h>

#include <kernel/vmm.h>
#include <kernel/pfa.h>
#include <kernel/paging.h>

extern uint32_t _kernel_start;

vm_node_t *head;

/*
 * The area after the kernel_end is going to waste for now!
 */
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
     */

    node->addr = KERNEL_VSTART;
    node->len = (VGA_BUFFER + KERNEL_VSTART) - node->addr;

    if (!((uint32_t)(node + 1) < ROUND_4K(kernel_end))) {
        printf("map_kernel_vm: Out of Memory\n");
        abort();
    }
    node->next = node + 1;

    node = node->next;
    node->addr = (VGA_BUFFER + KERNEL_VSTART) + PAGE_SIZE;
    node->len = (uint32_t)&_kernel_start + KERNEL_VSTART - node->addr;

    if (!((uint32_t)(node + 1) < ROUND_4K(kernel_end))) {
        printf("map_kernel_vm: Out of Memory\n");
        abort();
    }
    node->next = node + 1;

    node = node->next;
    node->addr = ROUND_4K(kernel_end);
    // 4GB = 0x100000000
    node->len = 0xFFFFFFFF - node->addr + 1;
    node->next = NULL;
};

/*
 * Allocate virtual memory in multiples of page size
 * How am I going to unmap memory??
 * Currently, no support for freeing actual physical pages
 *
 */
void *mmap(size_t size, bool user, bool rw) {
    size = ROUND_4K(size);
    size_t npages = size / PAGE_SIZE;

    vm_node_t *cur = head;
    while(cur->len < size) {
        cur = cur->next;
        if(cur == NULL) {
            printf("mmap: Out of virtual memory.\n");
            abort();
        }
    }


    cur->len -= size;

    size_t i = 0;
    while(i < npages) {
        pageframe_t page = kalloc_frame();
        map_paddr_to_vaddr(page, cur->addr + i*PAGE_SIZE, user, rw);
        ++i;
    }

    /*
     * If the size of the cur block becomes zero
     * then just the len is set to zero and nothing
     * else is done for now!
     */

    void *ret = (void *)cur->addr;
    cur->addr += size;

    return ret;
}
