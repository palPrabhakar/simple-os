#ifndef _KERNEL_PAGING_H
#define _KERNEL_PAGING_H

#include <stdint.h>

#define SIZE 1024

typedef struct page {
    uint32_t present : 1;  // page present in mem
    uint32_t rw : 1;       // 0 -> read only; 1 -> read/write
    uint32_t user : 1;     // 0 -> supervisor; 1 -> user
    uint32_t reserved : 2; // reserved by intel
    uint32_t accessed : 1; // page accessed since last refresh?
    uint32_t dirty : 1;    // has the page been written since last refresh?
    uint32_t unused : 5;   // unused and reserved bits
    uint32_t frame : 20;   // frame address
} page_entry_t;

typedef struct directory {
    uint32_t present : 1;  // page present in mem
    uint32_t rw : 1;       // 0 -> read only; 1 -> read/write
    uint32_t user : 1;     // 0 -> supervisor; 1 -> user
    uint32_t reserved : 2; // reserved by intel
    uint32_t accessed : 1; // page accessed since last refresh?
    uint32_t unused : 6;   // unused and reserved bits
    uint32_t page : 20;    // frame address

} dir_entry_t;

// 4KB
typedef struct page_table {
    page_entry_t pages[SIZE];
} page_table_t;

typedef struct page_directory {
    dir_entry_t tables[SIZE];
} page_dir_t;


void fix_kpaging_flags(void);
void reload_cr3(void);

#endif
