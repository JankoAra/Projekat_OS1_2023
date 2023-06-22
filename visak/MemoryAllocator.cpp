//
// Created by os on 5/12/23.
//

#include "MemoryAllocator.hpp"
#include "../h/helper.hpp"
#include "../h/Riscv.hpp"
#include "../test/printing.hpp"

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    size = blocks * MEM_BLOCK_SIZE;

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
        if (firstFit->size < size) continue;

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
        size_t remainingSize = firstFit->size - size;
        if (remainingSize <= sizeof(UsedMemSegment)) {
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
            if (prevFree) {
                prevFree->next = firstFit->next;
            } else {
                freeMemHead = firstFit->next;
            }
        } else {
            remainderFree->size = remainingSize;
            remainderFree->next = firstFit->next;
            if (prevFree) {
                prevFree->next = remainderFree;
            } else {
                freeMemHead = remainderFree;
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
        newUsed->size = size;
        newUsed->purpose = pur;
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
        UsedMemSegment* prevUsed = nullptr;
        for (UsedMemSegment* cur = usedMemHead;
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
            prevUsed = cur;
        }
        if (!prevUsed) {
            newUsed->next = usedMemHead;
            usedMemHead = newUsed;
        } else {
            newUsed->next = prevUsed->next;
            prevUsed->next = newUsed;
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    }
    return nullptr;
}

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    if (!ptr) return 0;
    if (!usedMemHead) return -1;
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    UsedMemSegment* prevUsed = nullptr;
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
        prevUsed = currentUsed;
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    else usedMemHead = currentUsed->next;

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    FreeMemSegment* nextFree = freeMemHead;
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    newFree->size = segmentSize;
    if (prevFree) {
        newFree->next = prevFree->next;
        prevFree->next = newFree;
    } else {
        newFree->next = freeMemHead;
        freeMemHead = newFree;
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    tryToJoin(prevFree);
    return 0;
}

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    if (!current) return 0;
    bool nextExists = current->next != nullptr;
    char* nextAddr = (char*) current + current->size;
    char* cnext = (char*) current->next;
    bool nextIsConnected = (nextAddr == cnext);
    if (nextExists && nextIsConnected) {
        current->size += current->next->size;
        current->next = current->next->next;
        return 1;
    } else return 0;
}

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    return ((UsedMemSegment*) ptr)->purpose == p;
}

void MemoryAllocator::initMemoryAllocator() {
//pocetna inicijalizacija
    if (!initialized) {
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
        freeMemHead->next = nullptr;
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
        usedMemHead = nullptr;

        initialized = true;
    }
}
