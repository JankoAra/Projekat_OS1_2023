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


extern "C" void interruptHandler();
//void userMain();

void testMemory();

void nit1f(void*);

void nit2f(void* arg2);

void nit3f(void*);

sem_t semA;

void idle(void*) {
	while (1) {}
}


#pragma GCC optimize("O0")

int main() {
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);

	sem_open(&semA, 0);




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
	thread_t nit3 = nullptr;
	thread_t idleNit = nullptr;
	thread_create(&glavnaNit, nullptr, nullptr);
	TCB::running = glavnaNit;
	uint64* arg = new uint64;
	*arg = 666;
	ThreadQueue* q = new ThreadQueue();
	q->putLast(nit3);
	q->putLast(nit2);
	q->putLast(nit1);
	thread_t nitred3 = q->getFirst();
	thread_t nitred2 = q->getFirst();
	thread_t nitred1 = q->getFirst();
	thread_create(&idleNit, idle, nullptr);
	thread_create(&nitred1, nit1f, nullptr);
	thread_create(&nitred2, nit2f, arg);
	thread_create(&nitred3, nit3f, nullptr);

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

//	while (!nitred1->isFinished() || !nitred2->isFinished()) {
//		thread_dispatch();
//	}
	thread_join(nitred1);
	thread_join(nitred2);
	thread_join(nitred3);

	printString("\nProsao while\n");
	delete q;
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