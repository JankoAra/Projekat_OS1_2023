//
// Created by os on 5/29/23.
//
#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"

void testMemory() {
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
		allocations[i] = nullptr;

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize));
		if (allocations[i] == nullptr) {
//			printString("\nAllocation failed for index ");
//			printInteger(i);
			break;
		}
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
}