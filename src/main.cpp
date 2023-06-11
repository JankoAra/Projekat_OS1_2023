#include "../lib/hw.h"
#include "../h/helper.hpp"
#include "../h/Riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/syscall_cpp.hpp"
//#include "../h/MemoryAllocator.hpp"
#include "../h/TCB.hpp"
#include "../h/ThreadQueue.hpp"
//#include "../h/KSem.hpp"
#include "../h/KConsole.hpp"

#include "../test/printing.hpp"


extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    while (1) { thread_dispatch(); }
}

void kernelConsumerFunction(void*) {
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
        *KConsole::dr = c;
        sem_signal(KConsole::outputBufferHasSpace);
    }

}

int main() {
    //postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));

    //inicijalizacija alokatora memorije
    MemoryAllocator::initMemoryAllocator();

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();

    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, nullptr, nullptr);
    TCB::running = mainHandle;
    thread_create(&userHandle, (TCB::Body) userMain, nullptr);
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    thread_create(&idleHandle, idle, nullptr);

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);


    //printString("\nSad cu da izadjem\n");

    //flush output bafera za konzolu
    while (KConsole::outputHead != KConsole::outputTail) {}

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;


}