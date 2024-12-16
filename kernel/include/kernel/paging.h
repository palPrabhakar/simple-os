#ifndef _KERNEL_PAGING_H
#define _KERNEL_PAGING_H

#include "multiboot.h"
#include <stdbool.h>
#include <stdint.h>

#define SIZE 1024

typedef struct page_table {
    uint32_t pages[SIZE];
} page_table_t;

typedef struct page_directory {
    uint32_t tables[SIZE];
} page_dir_t;

__attribute__((__always_inline__)) static inline void
switch_page_directory(void *dir) {
    asm volatile("mov %0, %%cr3" ::"r"((uint32_t)dir));
}

__attribute__((__always_inline__)) static inline void
invalidate_page_table(void *tbl) {
    asm volatile("invlpg (%0)" ::"r"((uint32_t)tbl) : "memory");
}

__attribute__((__always_inline__)) static inline void reload_cr3(void) {
    unsigned int cr3_value;
    asm volatile("movl %%cr3, %0" : "=r"(cr3_value) : :);
    asm volatile("mov %0, %%cr3" : : "r"(cr3_value) : "memory");
}

// Get the address of multiboot info
void fix_kpage_table(void);
void set_active_directory(page_dir_t *dir);
void map_paddr_to_vaddr(uint32_t paddr, uint32_t vaddr, bool user, bool rw);

#endif
