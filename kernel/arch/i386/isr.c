#include <stdio.h>
#include <kernel/isr.h>

void isr_handler(registers_t regs) 
{
  // printf("ds: %u\nedi: %u\nesi: %u\nebp: %u\nesp: %u\nebx: %u\nedx: %u\necx: %u\neax: %u\nint_no: %u\nerr_code: %x\neip: %u\ncs: %u\neflags: %u\nuseresp: %u\nss: %u\n", regs.ds, regs.edi, regs.esi, regs.ebp, regs.esp, regs.ebx, regs.edx, regs.ecx, regs.eax, regs.int_no, regs.err_code, regs.eip, regs.cs, regs.eflags, regs.useresp, regs.ss);
  printf("interrupt recieved.\n");
  // printf("ds: %u\n", regs.ds);
  printf("interrupt no: %u\n", regs.int_no);
  printf("interrupt error code: %u\n", regs.err_code);
}


