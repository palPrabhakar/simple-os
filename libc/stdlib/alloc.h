#ifndef _ALLOC_H
#define _ALLOC_H

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

#define block_ptr uint32_t
#define block_null -1UL

void *alloc(size_t);
void dealloc(void *);

#ifdef __cplusplus
}
#endif

#endif
