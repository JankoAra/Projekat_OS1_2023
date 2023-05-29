#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/helper.hpp"
#include "../h/Riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/syscall_cpp.hpp"
#include "../h/List.hpp"
//#include "../h/MemoryAllocator.hpp"
#include "../h/TCB.hpp"

//#pragma GCC optimize("O0")

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
	TCB::dispatch();
	println("opet u niti 1");
}

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
	thread_t glavnaNit;
	thread_t nit1;
	thread_create(&glavnaNit, nullptr, nullptr);
	TCB::running = glavnaNit;
	thread_create(&nit1, nit1f, nullptr);
	while(!nit1->isFinished()){
		glavnaNit->dispatch();
	}
	println("");
	return 0;
}