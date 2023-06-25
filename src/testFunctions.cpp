//
// Created by os on 5/29/23.
//
#include "../lib/hw.h"
#include "../h/Riscv.hpp"
#include "../h/KMemory.hpp"
#include "../h/KConsole.hpp"
#include "../h/TCB.hpp"
#include "../h/syscall_c.hpp"
#include "../h/syscall_cpp.hpp"

extern "C" void interruptHandler();

void userMain();

void idle(void*);

void kernelConsumerFunction(void*);


class idlethr : public Thread {
public:
    void run() override {
        thread_dispatch();
    }
};

void emptyFunction(void*) {}

void nit1f(void*) {
    while (true) {
        thread_t handle;
        thread_create(&handle, emptyFunction, nullptr);
    }

    printString("\nGotova nit 1\n");
}

class per : public PeriodicThread {
public:
    per(time_t period) : PeriodicThread(period) {}

    void periodicActivation() override {
        printString("Janko\n");
    }
};

void nit2f(void* arg2) {
    PeriodicThread* pt = new per(10);
    pt->start();
    time_sleep(15);
    pt->terminate();
    printString("\nGotova nit 2\n");
}


void nit3f(void*) {
    char slovo;
    do {
        slovo = getc();
        putc(slovo);
        if (slovo == '\r') putc('\n');
    } while (slovo != '0');

    printString("\nGotova nit3\n");
}


int main2() {
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();

    //inicijalizacija komunikacije sa konzolom
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
    thread_create(&glavnaNit, (TCB::Body)main, nullptr);
    TCB::setRunning(glavnaNit);
    thread_create(&idleNit, idle, nullptr);
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);


    thread_create(&nit1, nit1f, nullptr);
    thread_create(&nit2, nit2f, nullptr);
    thread_create(&nit3, nit3f, nullptr);

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    thread_join(nit1);
    thread_join(nit2);
    thread_join(nit3);
    //thread_join(idleNit);

    printString("\nGotove user niti\n");

    printString("\nSad cu da izadjem\n");
    while (KConsole::getOutputHead() != KConsole::getOutputTail()) {}
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);


    return 0;
}