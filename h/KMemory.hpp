//
// Created by os on 6/14/23.
//

#ifndef PROJEKAT2023_KMEMORY_HPP
#define PROJEKAT2023_KMEMORY_HPP

#include "../lib/hw.h"

class KMemory {
public:
    static void initializeMemory();
    static void* kmalloc(size_t size);
    static void kfree(void* ptr);
private:
    static bool initialized;
    static uint64 numOfBlocks;
    static uint64 blocksForBitVector;
    static uint64 usableBlocks;
    static uint64 bitsInBitVector;
    static bool* bitVector;
};


#endif //PROJEKAT2023_KMEMORY_HPP
