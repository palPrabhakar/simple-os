# Declare constants for the multiboot header.
.set ALIGN,    1<<0             # align loaded modules on page boundaries
.set MEMINFO,  1<<1             # provide memory map
.set FLAGS,    ALIGN | MEMINFO  # this is the Multiboot 'flag' field
.set MAGIC,    0x1BADB002       # 'magic number' lets bootloader find the header
.set CHECKSUM, -(MAGIC + FLAGS) # checksum of above, to prove we are multiboot

# Declare a header as in the Multiboot Standard.
.section .multiboot.data, "aw"
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

# Reserve a stack for the initial thread.
.section .bss, "aw", @nobits
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top:

.section .bss, "aw", @nobits
.align 4096
boot_page_directory:
.skip 4096
boot_page_table:
.skip 4096

# The kernel entry point.
.section .multiboot.text, "a"
.global _start
.type _start, @function
_start:
	# edi = addr of boot_page_table
	movl $(boot_page_table - 0xC0000000), %edi

	movl $0, %esi    # esi = 0
	movl $1024, %ecx # ecx = 1024

1:
	# Map everything including the first 1M
	cmpl $(_kernel_end - 0xC0000000), %esi
	jge 3f

	# Map physical address as "present, writable"
	# TODO: 
	# Map .text and .rodata an readonly
	movl %esi, %edx
	orl $0x003, %edx
	movl %edx, (%edi)

2:
	addl $4096, %esi
	addl $4, %edi
	loop 1b

3:
	# Identity map the page table
	movl $(boot_page_table - 0xC0000000 + 0x003), boot_page_directory - 0xC0000000 + 0
	# Map the page table to the higher half
	movl $(boot_page_table - 0xC0000000 + 0x003), boot_page_directory - 0xC0000000 + 768*4

	# Set cr3 to the address of boot_page_directory
	movl $(boot_page_directory - 0xC0000000), %ecx 
	movl %ecx, %cr3

	# Enable paging and write-protect bit 
	movl %cr0, %ecx
	orl $0x80010000, %ecx
	movl %ecx, %cr0

	# Jump to higher half with absolute jump
	lea 4f, %ecx
	jmp *%ecx

.section .text

4:
	# setup the stack
	# stack is located after 0xC0000000
	movl $stack_top, %esp

	/* Push the pointer to the Multiboot information structure. */
        pushl %ebx
        /* Push the magic value. */
        pushl %eax

	# Setup PFA using identity mapping (IM)
	# Easiest to access the multiboot info using IM
	call kernel_init

	# Unmap the identity mapping
	movl $0, boot_page_directory + 0

	# Reload the cr3 to force TLB flush
	movl %cr3, %ecx
	movl %ecx, %cr3

	# Call the global constructors.
	call _init

	# Transfer control to the main kernel.
	call kernel_main

	# Hang if kernel_main unexpectedly returns.
	cli
1:	hlt
	jmp 1b

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

.section .text
.global load_idt
.type load_idt, @function
load_idt:
	mov 4(%esp), %eax
	lidt (%eax)
	ret
