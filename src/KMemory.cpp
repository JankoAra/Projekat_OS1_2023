//
// Created by os on 6/14/23.
//

#include "../h/KMemory.hpp"

bool KMemory::initialized = false;
uint64 KMemory::numOfBlocks = 0;
uint64 KMemory::sizeOfBitVectorInUint64 = 0;
uint64* KMemory::bitVector = nullptr;

void KMemory::initializeMemory() {
    if (initialized) return;
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    numOfBlocks = sizeInBytes / MEM_BLOCK_SIZE;
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    numOfBlocks = sizeOfBitVectorInUint64 * sizeof(uint64) * 8; //da se zaokruzi broj postojecih blokova na umnozak 64
    uint64 blocksForBitVector = (sizeOfBitVectorInUint64 * sizeof(uint64) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    bitVector = (uint64*)HEAP_START_ADDR;
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    }

    //zauzimanje blokova za bit vector
    kmalloc(blocksForBitVector);

    initialized = true;
}

void* KMemory::kmalloc(size_t size) {
    if (size <= 0) return nullptr;
    //size je broj blokova
    uint64 currentElem = 0;
    uint64 currentBit = 63;
    uint64 firstZeroElem = 0;
    uint64 firstZeroBit = 63;
    uint64 zerosFound = 0;
    bool zeroFound = false;
    //trazanje uzastopnih nula u bit vektoru
    while (currentElem < sizeOfBitVectorInUint64) {
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
            currentElem++;
            continue;
        }
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
        if (bit > 0) {
            zeroFound = false;
            zerosFound = 0;
        } else if (!zeroFound) {
            zeroFound = true;
            zerosFound = 1;
            firstZeroBit = currentBit;
            firstZeroElem = currentElem;
        } else {
            zerosFound++;
        }
        if (zerosFound == size) break;
        if (currentBit-- == 0) {
            currentBit = 63;
            currentElem++;
        }
    }
    if (zerosFound != size) return nullptr;

    //alociranje blokova
    uint64 blockNum = firstZeroElem * 64 + (63 - firstZeroBit);
    void* addr = (char*)HEAP_START_ADDR + blockNum * MEM_BLOCK_SIZE;
    *(uint64*)addr = size;  //da znamo koliko blokova je alocirano zaredom

    //upisivanje 1 u bit vektor
    currentElem = firstZeroElem;
    currentBit = firstZeroBit;
    while (zerosFound > 0) {
        bitVector[currentElem] |= maskBit(currentBit);
        zerosFound--;
        if (currentBit-- == 0) {
            currentBit = 63;
            currentElem++;
        }
    }
    return (char*)addr + 2 * sizeof(uint64);    //offset 2 da bi bilo zaokruzeno na 16 zbog steka
}

int KMemory::kfree(void* ptr) {
    if (!ptr) return 0;
    ptr = (char*)ptr - 2 * sizeof(uint64);
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    uint64 blocksToFree = *(uint64*)ptr;
    uint64 blockNum = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    uint64 currentElem = blockNum / 64;
    uint64 currentBit = 63 - blockNum % 64;
    while (blocksToFree > 0) {
        bitVector[currentElem] &= ~maskBit(currentBit);
        blocksToFree--;
        if (currentBit-- == 0) {
            currentBit = 63;
            currentElem++;
        }
    }
    return 0;
}
