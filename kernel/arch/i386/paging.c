#include <kernel/paging.h>
#include <stddef.h>
#include <stdio.h>

// https://stackoverflow.com/questions/8045108/use-label-in-assembly-from-c
extern void boot_page_directory asm("boot_page_directory");
extern void boot_page_table asm("boot_page_table");

extern char _kernel_start;
extern char _kernel_start;
extern char _entry_sec;
extern char _text_sec;
extern char _rodata_sec;
extern char _data_sec;
extern char _bss_sec;
extern char _kernel_end;

__attribute__((__always_inline__)) static inline page_dir_t *
get_page_directory(uint32_t addr) {
    return (page_dir_t *)addr;
}

__attribute__((__always_inline__)) static inline page_table_t *
get_page_table(uint32_t addr) {
    return (page_table_t *)(addr << 12);
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

    unsigned int cr3_value;

    // Inline assembly to move the content of CR3 into a C variable
    asm volatile("movl %%cr3, %0"
                 : "=r"(cr3_value) // Output operand
                 :                 // No input operands
                 :                 // No clobbers needed for CR3
    );

    // Inline assembly to move the content of ECX into CR3
    asm volatile(
        "mov %0, %%cr3"
        :                // No output operands
        : "r"(cr3_value) // Input operand: register or memory holding the value
        : "memory" // Clobber memory to inform the compiler of dependencies
    );
}

// void switch_page_directory(page_directory_t *dir) {
//   current_directory = dir;
//   asm volatile("mov %0, %%cr3" ::"r"(&dir->tables));
//   uint32_t cr0;
//   asm volatile("mov %%cr0, %0" : "=r"(cr0));
//   cr0 |= 0x80000000; // Enable paging!
//   asm volatile("mov %0, %%cr0" ::"r"(cr0));
// }
