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

class IdleThread : public Thread {
    void run() override {
        while (1) { thread_dispatch(); }
    }
};

class KernelConsumer : public Thread {
    void run() override {
        while (1) {
            char c = KConsole::getFromOutput();
            while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
            KConsole::setDRvalue(c);
            sem_signal(KConsole::getOutputBufferHasSpace());
        }
    }
};

extern "C" void interruptHandler();

void userMain();

void user(void*);
void user2(void*);
int main() {
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();

    //pravljenje niti
    thread_t mainHandle;
    Thread* idleHandle = new IdleThread();
    Thread* consoleOutputHandle = new KernelConsumer();
    Thread* userThr = new Thread((TCB::Body)userMain, nullptr);
    //Thread* userThr = new Thread(user, nullptr);
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    TCB::setRunning(mainHandle);
    mainHandle->setStatus(TCB::ACTIVE);
    idleHandle->start();
    consoleOutputHandle->start();
    userThr->start();

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    userThr->join();

    //flush output bafera za konzolu
    KConsole::flush();

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
}