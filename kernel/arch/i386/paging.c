#include <kernel/paging.h>
#include <stdio.h>

uint32_t page_directory[1024] __attribute__((aligned(4096)));
uint32_t page_table[1024] __attribute__((aligned(4096)));

void initialize_paging(void) {
  printf("page_directory: %u\n", &page_directory);
  printf("page_table: %u\n", &page_table);
}

// page_directory_t *get_page_directory(pageframe_t addr) {
//   // printf("addr page_dir: %x\n", addr);
//   return (page_directory_t *)addr;
// }
//
// page_table_t *get_page_table(uint32_t addr) {
//   // printf("addr page_table: %x\n", addr);
//   return (page_table_t *)(addr & 0xFFFFF000);
// }


// void switch_page_directory(page_directory_t *dir) {
//   current_directory = dir;
//   asm volatile("mov %0, %%cr3" ::"r"(&dir->tables));
//   uint32_t cr0;
//   asm volatile("mov %%cr0, %0" : "=r"(cr0));
//   cr0 |= 0x80000000; // Enable paging!
//   asm volatile("mov %0, %%cr0" ::"r"(cr0));
// }
