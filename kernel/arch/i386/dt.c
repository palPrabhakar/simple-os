// 
// descriptor tables - Initialize GDT and IDT
//

#include <kernel/dt.h>
#include <stdio.h>

// access assembly function from c code
extern void set_gdt(uint32_t);

static void init_gdt();
static void gdt_set_descriptor(uint32_t, uint32_t, uint32_t, uint8_t, uint8_t);

gdt_entry_t gdt_entries[5];
gdt_ptr_t gdt_ptr;

void init_descriptor_tables(void) {
  init_gdt();
}

static void init_gdt() {
  gdt_ptr.limit = (sizeof(gdt_entry_t)*5) - 1;
  gdt_ptr.base = (uint32_t)&gdt_entries;

  gdt_set_descriptor(0, 0, 0, 0, 0); // null desc
  gdt_set_descriptor(1, 0, 0xFFFFFFFF,  0x9A, 0xCF); // kernel code segment
  gdt_set_descriptor(2, 0, 0xFFFFFFFF,  0x92, 0xCF); // kernel data segement
  gdt_set_descriptor(3, 0, 0xFFFFFFFF,  0xFA, 0xCF); // user mode code segment
  gdt_set_descriptor(4, 0, 0xFFFFFFFF,  0xF2, 0xCF); // user mode data segment
  
  set_gdt((uint32_t)&gdt_ptr);
}

static void gdt_set_descriptor(uint32_t num, uint32_t base, uint32_t limit, uint8_t access, uint8_t gran) {
  gdt_entries[num].base_low = (base & 0xFFFF);
  gdt_entries[num].base_middle = (base >> 16) & 0xFF;
  gdt_entries[num].base_high = (base >> 24) & 0xFF;

  gdt_entries[num].limit_low = (limit & 0xFFFF);
  gdt_entries[num].granularity = (limit >> 16) & 0x0F;

  gdt_entries[num].granularity |= gran & 0xF0;
  gdt_entries[num].access = access;
}



