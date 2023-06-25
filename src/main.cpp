#include "../lib/hw.h"
#include "../h/Riscv.hpp"
#include "../h/KMemory.hpp"
#include "../h/KConsole.hpp"
#include "../h/TCB.hpp"
#include "../h/syscall_c.hpp"
#include "../h/syscall_cpp.hpp"

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    while (1) { thread_dispatch(); }
}

//salje na izlaz karakter iz izlaznog bafera KConsole
void kernelConsumerFunction(void*) {
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
        KConsole::setDRvalue(c);
        sem_signal(KConsole::getOutputBufferHasSpace());
    }
}

int main() {
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();

    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    TCB::setRunning(mainHandle);
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    thread_create(&idleHandle, idle, nullptr);

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);

    //flush output bafera za konzolu
    KConsole::flush();

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
}