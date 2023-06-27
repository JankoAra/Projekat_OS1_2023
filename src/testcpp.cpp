//
// Created by os on 6/27/23.
//
#include "../lib/hw.h"
#include "../h/Riscv.hpp"
#include "../h/KMemory.hpp"
#include "../h/KConsole.hpp"
#include "../h/TCB.hpp"
#include "../h/syscall_c.hpp"
#include "../h/syscall_cpp.hpp"

#include "../test/printing.hpp"

extern "C" void interruptHandler();

void userMain();

void idle(void*);

void kernelConsumerFunction(void*);

sem_t s12, s23, s31;
bool end;

class idlethr : public Thread {
public:
    void run() override {
        thread_dispatch();
    }
};

class per : public PeriodicThread {
public:
    per(time_t period) : PeriodicThread(period), period(period) {}

    int period;

    void periodicActivation() override {
        printString("Janko ");
        printInt(period);
        printString("\n");
    }
};

void emptyFunction(void*);

void f1(void*) {
    int i = 0;
    while (!end) {
        sem_wait(s31);
        printString("nit 1\n");
        if (++i == 4) end = true;
        sem_signal(s12);
    }

    printString("\nGotova nit 1\n");
}


void f2(void*) {
    while (!end) {
        sem_wait(s12);
        printString("nit 2\n");
        sem_signal(s23);
    }


    printString("\nGotova nit 2\n");
}


void f3(void*) {
    while (!end) {
        sem_wait(s23);
        printString("nit 3\n");
        sem_signal(s31);
    }

    printString("\nGotova nit3\n");
}


int main4() {
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();


    //testiranje kreiranja niti
    thread_t glavnaNit = nullptr;
    thread_t idleNit = nullptr;
    thread_t kernelConsumerThread = nullptr;
    thread_create(&glavnaNit, (TCB::Body)main, nullptr);
    TCB::setRunning(glavnaNit);
    thread_create(&idleNit, idle, nullptr);
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);

    Thread* nit1 = new Thread(f1, nullptr);
    Thread* nit2 = new Thread(f2, nullptr);
    Thread* nit3 = new Thread(f3, nullptr);
    sem_open(&s12, 0);
    sem_open(&s23, 0);
    sem_open(&s31, 1);
    nit1->start();
    nit2->start();
    nit3->start();
    end = false;

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    nit1->join();
    nit2->join();
    nit3->join();


    printString("\nGotove user niti\n");

    printString("\nSad cu da izadjem\n");
    KConsole::flush();
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);


    return 0;
}