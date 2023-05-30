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
	println("usao u nit 1");
	TCB::yield();
	println("opet u niti 1");
}
uint64 sstatus;
#pragma GCC optimize("O0")
int main() {

	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");


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
	thread_create(&glavnaNit, nullptr, nullptr);
	TCB::running = glavnaNit;
	thread_create(&nit1, nit1f, nullptr);
	while(!nit1->isFinished()){
		TCB::yield();
	}
	println("\nProsao while");

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
	return 0;
}