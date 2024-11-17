#include <kernel/paging.h>
#include <stddef.h>
#include <stdio.h>

// https://stackoverflow.com/questions/8045108/use-label-in-assembly-from-c
extern void boot_page_directory asm("boot_page_directory");

extern char _kernel_start;
extern char _data_sec;

__attribute__((__always_inline__)) static inline page_dir_t *
get_page_directory(uint32_t addr) {
    return (page_dir_t *)addr;
}

__attribute__((__always_inline__)) static inline page_table_t *
get_page_table(uint32_t addr) {
    return (page_table_t *)(addr << 12);
}

__attribute__((__always_inline__)) static inline void
switch_page_directory(void *dir) {
    asm volatile("mov %0, %%cr3" ::"r"((uint32_t)dir));
}

__attribute__((__always_inline__)) static inline void
invalidate_page_table(void *tbl) {
    asm volatile("invlpg (%0)" ::"r"((uint32_t)tbl) : "memory");
}

void fix_kpaging_flags(void) {
    printf("Calling fix_kpaging_flags\n");
    // get the virtual address
    page_dir_t *vdir = get_page_directory((uint32_t)&boot_page_directory);
    // get the physical address
    page_dir_t *pdir = get_page_directory(vdir->tables[1023].page << 12);
    printf("page_dir addr: %x\n", vdir);
    // printf("page_dir physical addr: %x\n", vdir->tables[1023].page << 12);
    printf("page_dir physical addr: %x\n", pdir);

    page_table_t *tbl = get_page_table(pdir->tables[768].page);
    printf("page_tbl physical addr: %x\n", tbl);

    /*
     * Do not unmap the first 1MB atleast at this point!
     * The VGA Buffer and the multiboot structure lies
     * in the first 1MB
     */
    for (uint32_t i = (uint32_t)&_kernel_start; i < (uint32_t)&_data_sec;
         i += 4096) {
        tbl->pages[i >> 12].rw = 0;
    }

    for (int i = 269; i < 301; ++i) {
        tbl->pages[i].frame = (0x10D000 + (i - 269) * 4096) >> 12;
        tbl->pages[i].user = 0;
        tbl->pages[i].rw = 1;
        tbl->pages[i].present = 1;
    }

    invalidate_page_table(tbl);
}

void reload_cr3(void) {
    unsigned int cr3_value;
    // Move the content of CR3 into cr3_value
    asm volatile("movl %%cr3, %0" : "=r"(cr3_value) : :);
    // Move the content of cr3_value into CR3
    asm volatile("mov %0, %%cr3" : : "r"(cr3_value) : "memory");
}
