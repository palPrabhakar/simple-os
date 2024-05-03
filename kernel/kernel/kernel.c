#include <stdio.h>
#include <kernel/tty.h>

void kernel_main(void) {
  terminal_initialize();
  printf("Hello, Kernel World.\n");
  printf("%s", "Simple OS.\n");
}
