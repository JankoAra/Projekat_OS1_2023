//
// Created by os on 6/14/23.
//

#include "../h/KMemory.hpp"

bool KMemory::initialized = false;
uint64 KMemory::numOfBlocks = 0;
uint64 KMemory::blocksForBitVector = 0;
uint64 KMemory::usableBlocks = 0;
uint64 KMemory::bitsInBitVector = 0;
bool* KMemory::bitVector = nullptr;

void KMemory::initializeMemory() {
    if (initialized) return;

    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    numOfBlocks = sizeInBytes / MEM_BLOCK_SIZE;
    blocksForBitVector = numOfBlocks / (8 * MEM_BLOCK_SIZE) + (numOfBlocks % (8 * MEM_BLOCK_SIZE) ? 1 : 0);
    //usableBlocks = numOfBlocks - blocksForBitVector;
    bitsInBitVector = numOfBlocks * MEM_BLOCK_SIZE * 8;
    uint64 uint64InBitVector = bitsInBitVector / 64;
    bitVector = (bool*)HEAP_START_ADDR;
    uint64* temp = (uint64*)HEAP_START_ADDR;
    for (uint64 i = 0; i < uint64InBitVector; i++) {
        if (i < blocksForBitVector * MEM_BLOCK_SIZE * 8 / 64) {
            temp[i] = 0xffffffffffffffff;
        } else {
            temp[i] = 0;
        }
    }
    initialized = true;
}

void* KMemory::kmalloc(size_t size) {
    //size je broj blokova
    uint64 found = 0;
    for (uint64 i = blocksForBitVector * MEM_BLOCK_SIZE * 8; i < bitsInBitVector; i++) {
        if (bitVector[i]) {
            found = 0;
        } else if (++found == size) {
            uint64 firstBlockIndex = i - found + 1;
            for (uint64 j = firstBlockIndex; j <= i; j++) {
                bitVector[j] = true;
            }
            void* ret = firstBlockIndex * MEM_BLOCK_SIZE + (char*)HEAP_START_ADDR;
            *(uint64*)ret = size;
            return (char*)ret + sizeof(uint64);
        }
    }
    return nullptr;
}

void KMemory::kfree(void* ptr) {
    ptr = (char*)ptr - sizeof(uint64);
    uint64 blockToFree = *(uint64*)ptr;
    uint64 firstBlockIndex = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    for(uint64 i=firstBlockIndex;i<firstBlockIndex+blockToFree;i++){
        bitVector[i] = false;
    }
}
