//
// Created by os on 5/12/23.
//

#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
	if (size <= 0) return nullptr;

	//pocetna inicijalizacija
	if (!initialized) {
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
		freeMemHead->next = nullptr;
		freeMemHead->prev = nullptr;
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
		usedMemHead = nullptr;

		initialized = true;
	}

	//alokacija uvek zaokruzena na blokove
	size += sizeof(UsedMemSegment);
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
	size = blocks * MEM_BLOCK_SIZE;

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
		if (current->size < size) continue;

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
		remainderFree->size = current->size - size;
		remainderFree->prev = current->prev;
		if (current->prev) current->prev->next = remainderFree;
		remainderFree->next = current->next;
		if (current->next) current->next->prev = remainderFree;
		if (freeMemHead == current) freeMemHead = remainderFree;

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
		if (!prevUsed) {
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
			prevUsed->next = newFragment;
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
	}
	return nullptr;
}

int MemoryAllocator::kfree(void* ptr) {
	if (!ptr) return 0;
	if (!usedMemHead) return -1;
	ptr = (char*)ptr - sizeof(UsedMemSegment);
	//trazenje adrese ptr u listi zauzetih segmenata
	UsedMemSegment* currentUsed = usedMemHead;
	UsedMemSegment* prevUsed = nullptr;
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc

	//prevezivanje liste zauzetih segmenata
	if (prevUsed) prevUsed->next = currentUsed->next;
	else usedMemHead = currentUsed->next;

	//oslobadjanje segmenta i ubacivanje u listu slobodnih
	FreeMemSegment* prevFree = nullptr;
	if (!freeMemHead || ptr < (char*)freeMemHead) {
		prevFree = nullptr;
	} else {
		for (prevFree = freeMemHead;
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
	}
	FreeMemSegment* newFree = (FreeMemSegment*)ptr;
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
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

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
	if (!current) return 0;
	bool nextExists = current->next != nullptr;
	char* nextAddr = (char*)current + current->size;
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
}
