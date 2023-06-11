//
// Created by os on 5/12/23.
//

#include "../h/MemoryAllocator.hpp"
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
//    uint64 status = Riscv::r_sstatus();
//    uint64 greska = status & Riscv::SSTATUS_SIE;
//    if(greska>0) {
//        printString("Greska");
//    }

    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    size = blocks * MEM_BLOCK_SIZE;

    //trazenje slobodnog segmenta po first-fit algoritmu
    for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
        if (current->size < size) continue;

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) current + size);
        size_t remainingSize = current->size - size;
        if (remainingSize <= sizeof(UsedMemSegment)) {
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom
            size += remainingSize;
            if (current->prev) current->prev->next = current->next;
            if (current->next) current->next->prev = current->prev;
            if (freeMemHead == current) { freeMemHead = current->next; }
        } else {
            remainderFree->size = remainingSize;
            remainderFree->prev = current->prev;
            if (current->prev) current->prev->next = remainderFree;
            remainderFree->next = current->next;
            if (current->next) current->next->prev = remainderFree;
            if (freeMemHead == current) { freeMemHead = remainderFree; }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newFragment = (UsedMemSegment*) current;
        newFragment->size = size;
        newFragment->purpose = pur;
        newFragment->usableFirstAddress = (char*) newFragment + sizeof(UsedMemSegment);
        UsedMemSegment* prevUsed = nullptr;
        for (UsedMemSegment* cur = usedMemHead;
             cur && ((char*) cur < (char*) newFragment); cur = cur->next) {
            prevUsed = cur;
        }
        if (!prevUsed) {
            newFragment->next = usedMemHead;
            usedMemHead = newFragment;
        } else {
            newFragment->next = prevUsed->next;
            prevUsed->next = newFragment;
        }
        //return (char*)newFragment + sizeof(UsedMemSegment);
        return newFragment->usableFirstAddress;
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

    //prevezivanje liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    else usedMemHead = currentUsed->next;

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    if (!freeMemHead || ((char*) ptr < (char*) freeMemHead)) {
        prevFree = nullptr;
    } else {
        for (prevFree = freeMemHead;
             prevFree->next && (char*) ptr > (char*) (prevFree->next); prevFree = prevFree->next);
    }
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    newFree->size = segmentSize;
    newFree->prev = prevFree;
    if (prevFree) newFree->next = prevFree->next;
    else newFree->next = freeMemHead;
    if (newFree->next) newFree->next->prev = newFree;
    if (prevFree) prevFree->next = newFree;
    else freeMemHead = newFree;

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
        if (current->next) current->next->prev = current;
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
        freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
        usedMemHead = nullptr;

        initialized = true;
    }
}
