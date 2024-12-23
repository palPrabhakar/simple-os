#include <stdlib.h>

#include "alloc.h"

void *malloc(size_t size) {
#if defined(__is_libk)
    return alloc(size);
#else
    // TODO: Implement
    return NULL
#endif
}
