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
	println("\nusao u nit 1");
	__asm__ volatile("li t1, 100");
	thread_dispatch();
	volatile uint64 t1;
	__asm__ volatile("mv %0, t1":"=r"(t1));
	println("\nopet u niti 1");
	printString("\nt1 = ");

	printInteger(t1);

	println("Gotova nit 1");
}
void nit2f(void* arg2) {
	println("\nusao u nit 2");

	printInteger(*(uint64*)arg2);
	*(uint64*)arg2+=10;
	__asm__ volatile("li t1, 200");
	thread_dispatch();
	volatile uint64 t1;
	__asm__ volatile("mv %0, t1":"=r"(t1));
	println("\nopet u niti 2");
	printString("\nt1 = ");
	printInteger(t1);
	println("");
	println("Pokusavam da ugasim nit 2");
	thread_exit();
	println("Nisam uspeo da ugasim nit 2");
	printInteger(*(uint64*)arg2);
	println("Gotova nit 2");
}
#pragma GCC optimize("O0")
int main() {

	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);


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
	while(!nit1->isFinished() && !nit2->isFinished()){
		thread_dispatch();
	}
	println("\nProsao while");

	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	println("\nSad cu da izadjem");
	return 0;
}