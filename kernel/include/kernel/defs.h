#ifndef _KERNEL_DEFS_H
#define _KERNEL_DEFS_H

#define PIC1 0x20 /* IO base address for master PIC */
#define PIC2 0xA0 /* IO base address for slave PIC */
#define PIC1_COMMAND PIC1
#define PIC1_DATA 0x21
#define PIC2_COMMAND PIC2
#define PIC2_DATA 0xA1
#define PIC1_START_INTERRUPT 0x20
#define PIC2_START_INTERRUPT 0x28
#define PIC_ACK 0x20


#endif
