/* The bootloader will look at this image and start execution at the symbol
   designated at the entry point. */
ENTRY(_start)

/* Tell where the various sections of the object files will be put in the final
   kernel image. */
SECTIONS
{
	/* Begin putting sections at 1 MiB, a conventional place for kernels to be
	   loaded at by the bootloader. */
	. = 1M;

	_kernel_start = .;

	/* multiboot header
     * initial bootstrapping code for paging
     * Thoughts: Perhaps the more elegant solution would
     * be to link the entire code at 3GB and use segment registers
     * to get the right address before enabling paging */
	.entry ALIGN(4k) : AT(ADDR(.entry)) {
        _entry_sec = .;
		*(.multiboot)
		*(.entry)
	}

	. += 0xC0000000;
	_kernel_vstart = .;

    /* executable code */
	.text ALIGN(4K) : AT(ADDR(.text) - 0xC0000000)
	{
        _text_sec = . - 0xC0000000;
		*(.text)
	}

	/* Read-only data. */
	.rodata ALIGN(4K) : AT(ADDR(.rodata) - 0xC0000000)
	{
        _rodata_sec = . - 0xC0000000;
		*(.rodata)
	}

	/* Read-write data (initialized) */
	.data ALIGN(4K) : AT(ADDR(.data) - 0xC0000000)
	{
        _data_sec = . - 0xC0000000;
		*(.data)
	}

	/* Read-write data (uninitialized) and stack */
	.bss ALIGN(4K) : AT(ADDR(.bss) - 0xC0000000)
	{
        _bss_sec = . - 0xC0000000;
		*(COMMON)
		*(.bss)
	}

	_kernel_end = . - 0xC0000000;
	_kernel_vend = .;

	/* The compiler may produce other sections, put them in the proper place in
	   in this file, if you'd like to include them in the final kernel. */
}

