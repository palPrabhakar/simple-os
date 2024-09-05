#include <kernel/defs.h>
#include <kernel/isr.h>
#include <stdio.h>
#include <sys/io.h>

void isr_handler(registers_t regs) {
  printf("interrupt received.\n");
  printf("interrupt no: %u\n", regs.int_no);
  printf("interrupt error code: %u\n", regs.err_code);
  // asm volatile("hlt");
}

void irq_handler(registers_t regs) {
  // Send an EOI (end of interrupt) signal to the PICs.
  // If this interrupt involved the slave.
  if (regs.int_no >= PIC2_START_INTERRUPT) {
    // Send reset signal to slave.
    outb(PIC2, PIC_ACK);
  }
  // Send reset signal to master. (As well as slave, if necessary).
  outb(PIC1, PIC_ACK);
}
