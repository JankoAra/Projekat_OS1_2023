//
// Created by os on 5/12/23.
//

#ifndef PROJEKAT2023_MEMORYALLOCATOR_HPP
#define PROJEKAT2023_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"

class MemoryAllocator {
public:
	enum Purpose{STACK, SEMAPHORE, THREAD, MISC, LIST_NODE};
	struct FreeMemSegment {
		FreeMemSegment* next;
		FreeMemSegment* prev;
		size_t size;
	};

	struct UsedMemSegment {
		UsedMemSegment* next;
		size_t size;
		Purpose purpose;
		void* usableFirstAddress;
	};

	// alokacija 'size' bajtova
	static void* kmalloc(size_t size, Purpose pur = MISC);

	// oslobadjanje bloka alociranog sa kmalloc, vraca -1 ako je neuspesno
	static int kfree(void* ptr);

	static bool checkPurpose(void* ptr, Purpose p);

private:
	MemoryAllocator() {}

	static FreeMemSegment* freeMemHead;
	static UsedMemSegment* usedMemHead;

	static bool initialized;

	//spajanje current sa current->next; vraca 1 ako je uspesno, 0 ako nije uspesno
	static int tryToJoin(FreeMemSegment* current);
};


#endif //PROJEKAT2023_MEMORYALLOCATOR_HPP
