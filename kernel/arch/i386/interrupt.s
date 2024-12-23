// not required; all undefined symbols are treated external
.extern isr_handler
.extern irq_handler

isr_common_stub:
	pushal

	mov %ds, %ax
	pushl %eax

	mov $0x10, %ax
	mov %ax, %ds
	mov %ax, %es
	mov %ax, %fs
	mov %ax, %gs

	call isr_handler

	popl %eax

	mov %ax, %ds
	mov %ax, %es
	mov %ax, %fs
	mov %ax, %gs

	popal
	add $8, %esp
	sti
	iret

irq_common_stub:
	pushal

	mov %ds, %ax
	pushl %eax

	mov $0x10, %ax
	mov %ax, %ds
	mov %ax, %es
	mov %ax, %fs
	mov %ax, %gs

	call irq_handler

	popl %eax

	mov %ax, %ds
	mov %ax, %es
	mov %ax, %fs
	mov %ax, %gs

	popal
	add $8, %esp
	sti
	iret

.macro no_error_code_interrupt_handler inum
.global isr\inum
.type isr\inum, @function
isr\inum:
	cli
	pushl $0x00
	pushl $\inum
	jmp isr_common_stub
.endm

.macro error_code_interrupt_handler inum
.global isr\inum
.type isr\inum, @function
isr\inum:
	cli
	pushl $\inum
	jmp isr_common_stub
.endm

.macro irq n1, n2
.global irq\n1
.type irq\n1, @function
irq\n1:
	cli
	pushl $0x00
	pushl $\n2
	jmp irq_common_stub
.endm

.section .text
.global load_gdt
.type load_gdt, @function
load_gdt:
    mov 4(%esp), %eax
    lgdt (%eax)
    mov $0x10, %ax
    mov %ax, %ds
    mov %ax, %es
    mov %ax, %fs
    mov %ax, %gs
    mov %ax, %ss
    ljmp $0x08, $flush
flush:
    ret

.global load_idt
.type load_idt, @function
load_idt:
    mov 4(%esp), %eax
    lidt (%eax)
    ret

no_error_code_interrupt_handler 0
no_error_code_interrupt_handler 1
no_error_code_interrupt_handler 2
no_error_code_interrupt_handler 3
no_error_code_interrupt_handler 4
no_error_code_interrupt_handler 5
no_error_code_interrupt_handler 6
error_code_interrupt_handler 7
no_error_code_interrupt_handler 8
error_code_interrupt_handler 9
error_code_interrupt_handler 10
error_code_interrupt_handler 11
error_code_interrupt_handler 12
error_code_interrupt_handler 13
no_error_code_interrupt_handler 14
no_error_code_interrupt_handler 15
no_error_code_interrupt_handler 16
no_error_code_interrupt_handler 17
no_error_code_interrupt_handler 18
no_error_code_interrupt_handler 19
no_error_code_interrupt_handler 20
no_error_code_interrupt_handler 21
no_error_code_interrupt_handler 22
no_error_code_interrupt_handler 23
no_error_code_interrupt_handler 24
no_error_code_interrupt_handler 25
no_error_code_interrupt_handler 26
no_error_code_interrupt_handler 27
no_error_code_interrupt_handler 28
no_error_code_interrupt_handler 29
no_error_code_interrupt_handler 30
no_error_code_interrupt_handler 31

irq 0, 32
irq 1, 33
irq 2, 34
irq 3, 35
irq 4, 36
irq 5, 37
irq 6, 38
irq 7, 39
irq 8, 40
irq 9, 41
irq 10, 42
irq 11, 43
irq 12, 44
irq 13, 45
irq 14, 46
irq 15, 47
