#include <kernel/paging.h>
#include <stddef.h>
#include <stdio.h>

// https://stackoverflow.com/questions/8045108/use-label-in-assembly-from-c
// Defining the symbol as a void function prevents compiler when taking address
extern void boot_page_directory(void) asm("boot_page_directory");

extern char _kernel_start;
extern char _data_sec;

#define CLEAR_FLAGS(addr, user, rw, present)                                   \
    ((addr) & (0xFFFFFFFF ^ ((user << 2) | (rw << 1) | (present << 0))))

#define SET_PAGE_TABLE_ENTRY(addr, user, rw, present)                          \
    ((addr) | (user << 2) | (rw << 1) | (present << 0))

#define SET_PAGE_DIR_ENTRY(addr, user, rw, present)                            \
    ((addr) | (user << 2) | (rw << 1) | (present << 0))

#define GET_PHYSICAL_ADDR(dir)                                                 \
    (page_dir_t *)(((page_dir_t *)dir)->tables[1023] & 0xFFFFF000)

#define GET_PAGE_TABLE(dir, idx) (page_table_t *)(dir->tables[idx] & 0xFFFFF000)

void fix_kpaging_flags(void) {
    page_dir_t *dir = GET_PHYSICAL_ADDR(&boot_page_directory);
    page_table_t *tbl = GET_PAGE_TABLE(dir, 768);

    // Do not unmap the first 1MB atleast at this point!
    // The VGA Buffer and the multiboot structure lies
    // in the first 1MB
    for (uint32_t i = (uint32_t)&_kernel_start; i < (uint32_t)&_data_sec;
         i += 4096) {
        tbl->pages[i >> 12] = SET_PAGE_TABLE_ENTRY(
            CLEAR_FLAGS(tbl->pages[i >> 12], 1, 1, 1), 0, 0, 1);
    }

    for (int i = 269; i < 301; ++i) {
        tbl->pages[i] =
            SET_PAGE_TABLE_ENTRY(0x0010D000 + (i - 269) * 4096, 0, 1, 1);
    }

    invalidate_page_table(tbl);
}

void reload_cr3(void) {
    unsigned int cr3_value;
    asm volatile("movl %%cr3, %0" : "=r"(cr3_value) : :);
    asm volatile("mov %0, %%cr3" : : "r"(cr3_value) : "memory");
}
