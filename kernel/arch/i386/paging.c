#include <kernel/paging.h>
#include <kernel/pfa.h>

page_directory_t *current_directory;

page_directory_t *get_page_directory(pageframe_t addr) {
  // printf("addr page_dir: %x\n", addr);
  return (page_directory_t *)addr;
}

page_table_t *get_page_table(uint32_t addr) {
  // printf("addr page_table: %x\n", addr);
  return (page_table_t *)(addr & 0xFFFFF000);
}

// void initialize_paging(void) {
//   // Get a frame for page directory
//   page_directory_t *kernel_directory = get_page_directory(kalloc_frame());
//
//   // set each entry to not present, supervisor, read-write
//   for (size_t i = 0; i < SIZE; ++i) {
//     kernel_directory->tables[i] = 0x00000002;
//   }
//
//   // Get a frame for the first page table
//   page_table_t *table = get_page_table(kalloc_frame());
//
//   // Identity map the first 4MB
//   // Map the kernel pages to page table
//   for (size_t i = 0; i < SIZE; ++i) {
//     table->pages[i] = i * 0x1000 | 0x3;
//   }
//
//   kernel_directory->tables[0] = (uint32_t)(table) | 0x3;
//
//   // Set page directory to cr3
//   switch_page_directory(kernel_directory);
// }

void switch_page_directory(page_directory_t *dir) {
  current_directory = dir;
  asm volatile("mov %0, %%cr3" ::"r"(&dir->tables));
  uint32_t cr0;
  asm volatile("mov %%cr0, %0" : "=r"(cr0));
  cr0 |= 0x80000000; // Enable paging!
  asm volatile("mov %0, %%cr0" ::"r"(cr0));
}
