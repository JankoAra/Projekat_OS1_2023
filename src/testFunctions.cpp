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

extern sem_t semA;

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
	for (int i = 0; i < 8; i++) {
		printInteger(5);
		printString("\n");
		time_sleep(50);
	}
	printString("\nKraj niti 1\n");
	thread_exit();
	printString("\nusao u nit 1\n");
	__asm__ volatile("li t1, 100");
	//thread_dispatch();
	volatile uint64 t1;
	__asm__ volatile("mv %0, t1":"=r"(t1));
	printString("\nopet u niti 1\n");
	printString("\nt1 = ");

	printInteger(t1);

	for (int i = 0; i < 1000000; i++) {
		if (i % 1200 == 0) {
			printString("Nit1: ");
			printInteger(i);
			printString("\n");
		}
		if (i % 120203 == 0) {
			//printString("\nyield n1\n");
			//thread_dispatch();
		}
	}

	printString("\nGotova nit 1\n");
}

void nit2f(void* arg2) {
	for (int i = 0; i < 10; i++) {
		printInteger(3);
		printString("\n");
		sem_signal(semA);
		printString("Nit 2 salje signal semaforu\n");
		time_sleep(30);
	}
	sem_close(semA);
	printString("\nKraj niti 2\n");
	thread_exit();
	printString("\nusao u nit 2\n");

	printInteger(*(uint64*)arg2);
	*(uint64*)arg2 += 10;
	__asm__ volatile("li t1, 200");
	//thread_dispatch();
	volatile uint64 t1;
	__asm__ volatile("mv %0, t1":"=r"(t1));
	printString("\nopet u niti 2\n");
	printString("\nt1 = ");
	printInteger(t1);
	printString("\n");
	for (int i = 0; i < 1000000; i++) {
		if (i % 100000 == 0) {
			printString("Nit2: ");
			printInteger(i);
			printString("\n");
			time_sleep(20);
		}
//		if (i % 54203 == 0) {
//			printString("\nyield n2\n");
//			thread_dispatch();
//		}
	}
	printString("\nPokusavam da ugasim nit 2\n");
	//thread_exit();
	printString("\nNisam uspeo da ugasim nit 2\n");
	printInteger(*(uint64*)arg2);
	printString("\nGotova nit 2\n");
}


void nit3f(void*) {
	for (int i = 0; i < 20; i++) {
		printInteger(i);
		printString("\n");
		sem_wait(semA);
		printString("Nit 3 prosla semafor\n");
		time_sleep(10);
	}
	printString("\nGotova nit3\n");
}