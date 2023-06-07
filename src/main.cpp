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
#include "../h/KConsole.hpp"

#include "../test/printing.hpp"


extern "C" void interruptHandler();

void userMain();

void testMemory();

void nit1f(void*);

void nit2f(void* arg2);

void nit3f(void*);

Semaphore* semA;

void idle(void*) {
	while (1) {}
}

void kernelConsumerFunction(void*) {
	while (1) {
		char c = KConsole::getFromOutput();
		while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
		*KConsole::dr = c;
		sem_signal(KConsole::outputBufferHasSpace);
	}

}

#pragma GCC optimize("O0")

int main() {
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);

	//sem_open(&semA, 0);
	semA = new Semaphore(1);

	KConsole::initKConsole();




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
	thread_t kernelConsumerThread = nullptr;
	thread_create(&glavnaNit, nullptr, nullptr);
	TCB::running = glavnaNit;
	thread_create(&idleNit, idle, nullptr);
	thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);

//	ThreadQueue* q = new ThreadQueue();
//	q->putLast(nit3);
//	q->putLast(nit2);
//	q->putLast(nit1);
//	thread_t nitred3 = q->getFirst();
//	thread_t nitred2 = q->getFirst();
//	thread_t nitred1 = q->getFirst();

	thread_create(&nit1, nit1f, nullptr);
	thread_create(&nit2, nit2f, nullptr);
	thread_create(&nit3, nit3f, nullptr);

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);



//	while (!nitred1->isFinished() || !nitred2->isFinished()) {
//		thread_dispatch();
//	}
	thread_join(nit1);
	thread_join(nit2);
	thread_join(nit3);
	//thread_join(idleNit);

	printString("\nGotove user niti\n");
	//delete q;


	//KConsole::printConsoleState();
	//KConsole konzola;

	printString("\nSad cu da izadjem\n");
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);


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