#ifndef _KERNEL_PAGING_H
#define _KERNEL_PAGING_H

#include <stdint.h>

#define SIZE 1024

// typedef struct page {
//   uint32_t present : 1;  // page present in mem
//   uint32_t rw : 1;       // 0 -> read only; 1 -> read/write
//   uint32_t user : 1;     // 0 -> supervisor; 1 -> user
//   uint32_t accessed : 1; // page accessed since last refresh?
//   uint32_t dirty : 1;    // has the page been written since last refresh?
//   uint32_t unused : 7;   // unused and reserved bits
//   uint32_t frame : 20;   // frame address
// } page_t;

// 4KB
typedef struct page_table {
  uint32_t pages[SIZE];
} page_table_t;

typedef struct page_directory {
  uint32_t tables[SIZE];
} page_directory_t;

void initialize_paging(void);
page_directory_t *get_page_directory(uint32_t);
page_table_t *get_page_table(uint32_t);
void switch_page_directory(page_directory_t *);

#endif
