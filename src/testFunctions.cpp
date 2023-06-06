//
// Created by os on 5/29/23.
//
#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"
#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/helper.hpp"
#include "../h/Riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/syscall_cpp.hpp"
#include "../h/List.hpp"
//#include "../h/MemoryAllocator.hpp"
#include "../h/TCB.hpp"
#include "../h/ThreadQueue.hpp"
//#include "../h/KSem.hpp"

#include "../test/printing.hpp"
void printInteger(int i){
	printInt(i);
}
extern Semaphore* semA;

void testMemory() {
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
		allocations[i] = nullptr;

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize, MemoryAllocator::MISC));
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

void nit1f(void*) {
	for(int i=0;i<3;i++){
		printString("\nNit 1 dolazi na semafor\n");
		//int res = sem_wait(semA);
		int res = (*semA).wait();
		if(res){
			printString("\nNit 1 cekala na semaforu\n");
		}
		else{
			printString("\nNit 1 nije cekala\n");
		}
		printString("\nsem_wait za nit 1 vratio ");
		printInteger(res);
		printString("\n");
	}

	printString("\nGotova nit 1\n");
}

void nit2f(void* arg2) {
	for(int i=0;i<3;i++){
		printString("\nNit 2 daje signal\n");
		//sem_signal(semA);
		int res = (*semA).signal();
		printString("\nPovratna vrednost signala je ");
		printInteger(res);
		printString("\n");
		//sem_close(semA);
		printString("\nNit 2 ubija semafor\n");
		delete semA;

	}
	printString("\nGotova nit 2\n");
}


void nit3f(void*) {
//	for (int i = 0; i < 20; i++) {
//		printInteger(i);
//		printString("\n");
//		sem_wait(semA);
//		printString("Nit 3 prosla semafor\n");
//		time_sleep(10);
//	}
	printString("\nGotova nit3\n");
}