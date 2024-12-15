#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

#include <kernel/paging.h>

// https://stackoverflow.com/questions/8045108/use-label-in-assembly-from-c
// Defining the symbol as a void function prevents compiler warnings when
// taking address
extern void boot_page_directory(void) asm("boot_page_directory");

extern char _kernel_start;
extern char _data_sec;

static page_dir_t *active_page_dir;

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
    active_page_dir = (page_dir_t *)&boot_page_directory;

    page_dir_t *dir = GET_PHYSICAL_ADDR(active_page_dir);
    page_table_t *tbl = GET_PAGE_TABLE(dir, 768);

    // TODO:
    // Do not unmap the first 1MB atleast at this point!
    // The VGA Buffer and the multiboot structure might lie
    // in the first 1MB
    for (uint32_t i = (uint32_t)&_kernel_start; i < (uint32_t)&_data_sec;
         i += 4096) {
        tbl->pages[i >> 12] = SET_PAGE_TABLE_ENTRY(
            CLEAR_FLAGS(tbl->pages[i >> 12], 1, 1, 1), 0, 0, 1);
    }

    invalidate_page_table(tbl);
}

void map_paddr_to_vaddr(uint32_t paddr, uint32_t vaddr, bool user, bool rw) {
    if (paddr & 0x00000FFF) {
        printf("Physical address (%x) is not 4K aligned.\n");
        abort();
    }

    if (vaddr & 0x00000FFF) {
        printf("Virtual address (%x) is not 4K aligned.\n");
        abort();
    }

    uint16_t pd_idx = vaddr >> 22;
    uint16_t pt_idx = (vaddr << 10) >> 22;

    page_dir_t *dir = GET_PHYSICAL_ADDR(active_page_dir);
    page_table_t *tbl = GET_PAGE_TABLE(dir, pd_idx);

    tbl->pages[pt_idx] = SET_PAGE_TABLE_ENTRY(paddr, user, rw, 1);

    // Should reload cr3 since we don't know if we are touching the page which
    // is already in TLB cache or not!
    reload_cr3();
}
