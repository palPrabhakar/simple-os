#include <stdio.h>
#include <kernel/isr.h>

void isr_handler(registers_t regs) 
{
  printf("interrupt recieved.\n");
  printf("interrupt no: %u\n", regs.int_no);
  printf("interrupt error code: %u\n", regs.err_code);
  asm volatile("hlt");
}


