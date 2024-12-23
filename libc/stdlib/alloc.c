#include "alloc.h"

#include <kernel/pfa.h>
#include <kernel/vmm.h>

//===========================
//    Start of free list
// --------------------------
// |size|next|00000000000000|
// |0000|xxxxxx-used-xxxxxxx|
// |xxxx|size|NULL|000000000|
// |000000000000000000000000|
//===========================
// free list needs to be maintained
// in sorted order, otherwise merging
// adjacent blocks would be highly
// difficult!
//==========================

#define BLK_SIZE(x) *(size_t *)((x) - 4)
#define NEXT_BLK(x) *(uint32_t *)((x) + BLK_SIZE(x) - 4)

typedef struct block {
    size_t size;
    struct block *next;
} block_t;

static block_t *head = NULL;

block_t *find_block(size_t size, block_t **prev) {
    // finds a block of a given size
    // if block found returns the block and prev block
    // else returns NULL
    block_t *cur = head;
    *prev = head;
    if (cur != NULL && cur->size < size) {
        *prev = cur;
        cur = cur->next;
    }
    return cur;
}

void split_block(block_t *blk, block_t *prev, size_t size) {
    // |size|ptr|xxxxxxxxxxxxxxx|
    // |size|----req---|size|ptr|
    // --------------------------
    // |size|ptr|xxxxxxxxxxxxxxx|
    // |size|----req------|zzzzz| <--- can't create a new block
    // --------------------------
    //  min 8 bytes required to create a new block
    //  4 bytes for storing the size
    //  4 bytes for storing the next ptr

    if (size + sizeof(block_t) <= blk->size) {
        // split
        size_t new_sz = blk->size - size - sizeof(size_t);

        block_t *new_blk = (void *)blk + size;
        new_blk->size = new_sz;
        new_blk->next = blk->next;
        // Change the next ptr of prev blk
        if (prev == NULL) {
            head = new_blk;
        } else {
            prev->next = new_blk;
        }

        // store the size of the req. chunk
        blk->size = size;

    } else {
        // can't split in this case
        if (prev == NULL) {
            head = blk->next;
        } else {
            prev->next = blk->next;
        }
    }
}

// find the position in the free list where
// the new block can be added. List is sorted
// by address!
void merge_block(block_t *blk, block_t **prev) {
    // TODO:
    // check if can merge with prev block to make super block
    // check if can merge with next block to make super block
    block_t *cur = head;
    // block_t *prev = NULL;
    while (cur != NULL && cur < blk) {
        *prev = cur;
        cur = cur->next;
    }

    blk->next = cur;
    if (*prev == NULL) {
        head = blk;
    } else {
        (*prev)->next = blk;
    }
}

// blocks in multiple of 4k size
// but blocks can be much larger than 4K
// blocks are chunks of virtual memory
block_t *get_new_block(size_t size) {
    block_t *blk = (block_t *)mmap(size, 0, 1);
    blk->size = ROUND_4K(size) - sizeof(size_t);
    blk->next = NULL;
    return blk;
}

void *alloc(size_t size) {
    block_t *prev;
    block_t *blk = find_block(size, &prev);
    if (blk == NULL) {
        blk = get_new_block(size);
        merge_block(blk, &prev);
        split_block(blk, prev, size);
    } else {
        split_block(blk, prev, size);
    }
    return (void *)blk + sizeof(size_t);
}

void dealloc(void *blk) {
    block_t *prev = NULL;
    merge_block(blk - sizeof(size_t), &prev);
}
