#ifndef _KERNEL_PAGING_H
#define _KERNEL_PAGING_H

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

void fix_kpaging_flags(void);
void reload_cr3(void);

#endif
