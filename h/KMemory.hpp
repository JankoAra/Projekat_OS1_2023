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

    //broj celih blokova od MEM_BLOCK_SIZE bajta, ujedno i broj bitova u bit vektoru
    static uint64 numOfBlocks;

    //broj uint64 potrebnih da se smesti ceo bit vektor
    static uint64 sizeOfBitVectorInUint64;

    //adresa pocetka bit vektora (HEAP_START_ADDR)
    static uint64* bitVector;

    static uint64 freeBlocksLeft;

    //maska sa 1 na mestu bitPos i ostalim nulama (bitPos=0..63)
    inline static uint64 maskBit(uint64 bitPos) {
        return (uint64)1 << bitPos;
    }
};


#endif //PROJEKAT2023_KMEMORY_HPP
