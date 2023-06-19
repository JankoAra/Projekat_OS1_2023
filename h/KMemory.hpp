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

    static int kfree(void* ptr);

private:
    static bool initialized;
    static uint64 numOfBlocks;
    static uint64 blocksForBitVector;
    static uint64 freeBlocksLeft;
    static uint64 firstFreeBlock;
    static uint64 sizeOfBitVectorInUint64;
    static uint64* bitVector;

    inline static uint64 maskBit(uint64 bitPos) {
        return (uint64)1 << bitPos;
    }
};


#endif //PROJEKAT2023_KMEMORY_HPP
