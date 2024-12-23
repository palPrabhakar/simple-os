DEFAULT_HOST!=../default-host.sh
HOST?=DEFAULT_HOST
HOSTARCH!=../target-triplet-to-arch.sh $(HOST)

CFLAGS?=-O2 -g
CPPFLAGS?=
LDFLAGS?=
LIBS?=

DESTDIR?=
PREFIX?=/usr/local
EXEC_PREFIX?=$(PREFIX)
INCLUDEDIR?=$(PREFIX)/include
LIBDIR?=$(EXEC_PREFIX)/lib

BUILD_DIR?=build

CFLAGS:=$(CFLAGS) -ffreestanding -Wall -Wextra
CPPFLAGS:=$(CPPFLAGS) -D__is_libc -Iinclude
LIBK_CFLAGS:=$(CFLAGS)
LIBK_CPPFLAGS:=$(CPPFLAGS) -D__is_libk

ARCHDIR=arch/$(HOSTARCH)

include $(ARCHDIR)/make.config

CFLAGS:=$(CFLAGS) $(ARCH_CFLAGS)
CPPFLAGS:=$(CPPFLAGS) $(ARCH_CPPFLAGS)
LIBK_CFLAGS:=$(LIBK_CFLAGS) $(KERNEL_ARCH_CFLAGS)
LIBK_CPPFLAGS:=$(LIBK_CPPFLAGS) $(KERNEL_ARCH_CPPFLAGS)

FREEOBJS=\
		 $(ARCH_FREEOBJS) \
		 stdio/printf.o \
		 stdio/putchar.o \
		 stdio/puts.o \
		 stdlib/abort.o \
		 stdlib/alloc.o \
		 stdlib/malloc.o \
		 stdlib/free.o  \
		 string/memcmp.o \
		 string/memcpy.o \
		 string/memmove.o \
		 string/memset.o \
		 string/strlen.o \

HOSTEDOBJS=\
		   $(ARCH_HOSTEDOBJS) \

OBJS=\
	 $(FREEOBJS) \
	 $(HOSTEDOBJS) \

LIBK_OBJS=$(FREEOBJS:.o=.libk.o)

#BINARIES=libc.a libk.a # Not ready for libc yet.
BINARIES=$(BUILD_DIR)/libk.a

.PHONY: all clean install install-headers install-libs
.SUFFIXES: .o .libk.o .c .s

all: $(BINARIES)

$(BUILD_DIR)/libc.a: $(addprefix $(BUILD_DIR)/, $(OBJS))
	$(AR) rcs $@ $^

$(BUILD_DIR)/libk.a: $(addprefix $(BUILD_DIR)/, $(LIBK_OBJS))
	$(AR) rcs $@ $^

$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) -MD -c $< -o $@ -std=gnu11 $(CFLAGS) $(CPPFLAGS)

$(BUILD_DIR)/%.o: %.s
	@mkdir -p $(dir $@)
	$(CC) -MD -c $< -o $@ $(CFLAGS) $(CPPFLAGS)

$(BUILD_DIR)/%.libk.o: %.c
	@mkdir -p $(dir $@)
	$(CC) -MD -c $< -o $@ -std=gnu11 $(LIBK_CFLAGS) $(LIBK_CPPFLAGS)

$(BUILD_DIR)/%.libk.o: %.s
	@mkdir -p $(dir $@)
	$(CC) -MD -c $< -o $@ $(LIBK_CFLAGS) $(LIBK_CPPFLAGS)

clean:
	rm -rf $(BUILD_DIR)

install: install-headers install-libs

install-headers:
	mkdir -p $(DESTDIR)$(INCLUDEDIR)
	cp -R --preserve=timestamps include/. $(DESTDIR)$(INCLUDEDIR)/.

install-libs: $(BINARIES)
	mkdir -p $(DESTDIR)$(LIBDIR)
	cp $(BINARIES) $(DESTDIR)$(LIBDIR)

-include $(addprefix $(BUILD_DIR)/, $(OBJS:.o=.d))
-include $(addprefix $(BUILD_DIR)/, $(LIBK_OBJS:.o=.d))
