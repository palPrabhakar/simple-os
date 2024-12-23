#include "alloc.h"
#include <stdlib.h>

void free(void *addr) {
#if defined(__is_libk)
    dealloc(addr);
#else
    // TODO: Implement
#endif
}
