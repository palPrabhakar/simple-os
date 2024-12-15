DEFAULT_HOST!=../default-host.sh
HOST?=DEFAULT_HOST
HOSTARCH!=../target-triplet-to-arch.sh $(HOST)

CFLAGS?=
CPPFLAGS?=
LDFLAGS?=
LIBS?=

DESTDIR?=
PREFIX?=/usr/local
EXEC_PREFIX?=$(PREFIX)
BOOTDIR?=$(EXEC_PREFIX)/boot
INCLUDEDIR?=$(PREFIX)/include

BUILD_DIR?=build

CFLAGS:=$(CFLAGS) -ffreestanding -Wall -Wextra
CPPFLAGS:=$(CPPFLAGS) -D__is_kernel -Iinclude
LDFLAGS:=$(LDFLAGS)
LIBS:=$(LIBS) -nostdlib -lk -lgcc

ARCHDIR=arch/$(HOSTARCH)

include $(ARCHDIR)/make.config

CFLAGS:=$(CFLAGS) $(KERNEL_ARCH_CFLAGS)
CPPFLAGS:=$(CPPFLAGS) $(KERNEL_ARCH_CPPFLAGS)
LDFLAGS:=$(LDFLAGS) $(KERNEL_ARCH_LDFLAGS)
LIBS:=$(LIBS) $(KERNEL_ARCH_LIBS)

KERNEL_OBJS=\
			$(KERNEL_ARCH_OBJS) \
			$(BUILD_DIR)/devices/keyboard.o \
			$(BUILD_DIR)/kernel/vmm.o \
			$(BUILD_DIR)/kernel/kernel.o \
			$(BUILD_DIR)/utils/helper.o \

OBJS=\
	 $(BUILD_DIR)/$(ARCHDIR)/crti.o \
	 $(BUILD_DIR)/$(ARCHDIR)/crtbegin.o \
	 $(KERNEL_OBJS) \
	 $(BUILD_DIR)/$(ARCHDIR)/crtend.o \
	 $(BUILD_DIR)/$(ARCHDIR)/crtn.o

LINK_LIST=\
		  $(LDFLAGS) \
		  $(BUILD_DIR)/$(ARCHDIR)/crti.o \
		  $(BUILD_DIR)/$(ARCHDIR)/crtbegin.o \
		  $(KERNEL_OBJS) \
		  $(LIBS) \
		  $(BUILD_DIR)/$(ARCHDIR)/crtend.o \
		  $(BUILD_DIR)/$(ARCHDIR)/crtn.o \

.PHONY: all clean install install-headers install-kernel
.SUFFIXES: .o .c .s

all: $(BUILD_DIR)/myos.kernel

$(BUILD_DIR)/myos.kernel: $(OBJS) $(ARCHDIR)/linker.ld
	@mkdir -p $(BUILD_DIR)
	$(CC) -T $(ARCHDIR)/linker.ld -o $@ $(CFLAGS) $(LINK_LIST)
	grub2-file --is-x86-multiboot $(BUILD_DIR)/myos.kernel

$(BUILD_DIR)/$(ARCHDIR)/crtbegin.o $(BUILD_DIR)/$(ARCHDIR)/crtend.o:
	OBJ=`$(CC) $(CFLAGS) $(LDFLAGS) -print-file-name=$(@F)` && cp "$$OBJ" $@

$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) -MD -c $< -o $@ -std=gnu11 $(CFLAGS) $(CPPFLAGS)

$(BUILD_DIR)/%.o: %.s
	@mkdir -p $(dir $@)
	$(CC) -MD -c $< -o $@ $(CFLAGS) $(CPPFLAGS)

clean:
	rm -rf $(BUILD_DIR)

install: install-headers install-kernel

install-headers:
	mkdir -p $(DESTDIR)$(INCLUDEDIR)
	cp -R --preserve=timestamps include/. $(DESTDIR)$(INCLUDEDIR)/.

install-kernel: $(BUILD_DIR)/myos.kernel
	mkdir -p $(DESTDIR)$(BOOTDIR)
	cp $(BUILD_DIR)/myos.kernel $(DESTDIR)$(BOOTDIR)

-include $(OBJS:.o=.d)
