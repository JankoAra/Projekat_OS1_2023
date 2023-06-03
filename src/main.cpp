#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/helper.hpp"
#include "../h/Riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/syscall_cpp.hpp"
#include "../h/List.hpp"
//#include "../h/MemoryAllocator.hpp"
#include "../h/TCB.hpp"


extern "C" void interruptHandler();
//void userMain();

void testMemory();
//uint64 temp;
//
//void f() {
//	__putc('a');
//	__putc('\n');
//	uint64 var = temp;
//	__asm__ volatile ("mv ra, %[savedPC]": : [savedPC] "r"(var));
//
//	__asm__ volatile ("sd ra, 8(sp)");
//}
//
//void dispatch() {
//	__asm__ volatile ("mv %[savedPC], ra":[savedPC] "=r"(temp));
//	__asm__ volatile("mv ra, %[fAddress]": : [fAddress] "r"(&f));
//}

void nit1f(void*) {
	printString("\nusao u nit 1\n");
	__asm__ volatile("li t1, 100");
	//thread_dispatch();
	volatile uint64 t1;
	__asm__ volatile("mv %0, t1":"=r"(t1));
	printString("\nopet u niti 1\n");
	printString("\nt1 = ");

	printInteger(t1);

	for(int i=0;i<1000000;i++){
		if(i%1200==0) {
			printString("Nit1: ");
			printInteger(i);
			printString("\n");
		}
		if(i%120203==0){
			//printString("\nyield n1\n");
			//thread_dispatch();
		}
	}

	printString("\nGotova nit 1\n");
}
void nit2f(void* arg2) {
	printString("\nusao u nit 2\n");

	printInteger(*(uint64*)arg2);
	*(uint64*)arg2+=10;
	__asm__ volatile("li t1, 200");
	//thread_dispatch();
	volatile uint64 t1;
	__asm__ volatile("mv %0, t1":"=r"(t1));
	printString("\nopet u niti 2\n");
	printString("\nt1 = ");
	printInteger(t1);
	printString("\n");
	for(int i=0;i<1000000;i++){
		if(i%3500==0) {
			printString("Nit2: ");
			printInteger(i);
			printString("\n");
		}
		if(i%54203==0){
			printString("\nyield n2\n");
			thread_dispatch();
		}
	}
	printString("\nPokusavam da ugasim nit 2\n");
	//thread_exit();
	printString("\nNisam uspeo da ugasim nit 2\n");
	printInteger(*(uint64*)arg2);
	printString("\nGotova nit 2\n");
}
#pragma GCC optimize("O0")

int main() {

	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);




	//testiranje alociranja memorije
	//testMemory();
//	uint64* ptr = new uint64;
//	*ptr = 6;
//	printInteger(*ptr);

	//testiranje liste
//	List<uint64>* lista = new List<uint64>();
//	uint64 num = 10;
//	lista->addFirst(&num);
//	println("");
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit = nullptr;
	thread_t nit1 = nullptr;
	thread_t nit2 = nullptr;
	thread_create(&glavnaNit, nullptr, nullptr);
	TCB::running = glavnaNit;
	uint64* arg = new uint64;
	*arg = 666;
	thread_create(&nit1, nit1f, nullptr);
	thread_create(&nit2, nit2f, arg);

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

	while(!nit1->isFinished() || !nit2->isFinished()){
		thread_dispatch();
	}
	printString("\nProsao while\n");

	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	printString("\nSad cu da izadjem\n");

//testiranje svega
//	thread_t mainHandle;
//	thread_t userHandle;
//	thread_create(&mainHandle, nullptr, nullptr);
//	TCB::running = mainHandle;
//	thread_create(&userHandle, (TCB::Body)userMain, nullptr);
//	while (!userHandle->isFinished()) {
//		thread_dispatch();
//	}
//	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	return 0;
}