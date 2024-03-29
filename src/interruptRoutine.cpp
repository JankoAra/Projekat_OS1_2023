//
// Created by os on 5/22/23.
//

#include "../lib/hw.h"
#include "../h/Riscv.hpp"
#include "../h/KMemory.hpp"
#include "../h/KSem.hpp"
#include "../h/KConsole.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

//#include "../test/printing.hpp"

int main();

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4;
    //uint64 a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");

    if (scause == 0x9 || scause == 0x8) {
        //prekid zbog poziva ecall
        switch (a0) {
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                KMemory::kmalloc((size_t)a1);
                __asm__ volatile("sd a0, 80(s0)");
                break;
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                KMemory::kfree((void*)a1);
                __asm__ volatile("sd a0, 80(s0)");
                break;
            case 0x11:
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
                if (*((thread_t*)a1) != nullptr) {
                    if ((TCB::Body)a2 != (TCB::Body)main) {
                        Scheduler::put(*((thread_t*)a1));
                    }
                    __asm__ volatile("li a0, 0");
                } else {
                    __asm__ volatile("li a0, -1");
                }
                __asm__ volatile("sd a0, 80(s0)");
                break;
            case 0x12:
                //thread_exit
                TCB::getRunning()->setStatus(TCB::FINISHED);
                TCB::releaseJoined(TCB::getRunning());
                __asm__ volatile("li a0, 0");
                __asm__ volatile("sd a0, 80(s0)");
                TCB::dispatch();
                break;
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
                break;
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
                TCB::dispatch();
                break;
            case 0x15:
                //destruktor klase Thread, brise nit ciji je handle prosledjen
                //a1 = rucka niti koja se brise
                if (TCB::getRunning() == (thread_t)a1) {
                    TCB::getRunning()->setStatus(TCB::FINISHED);
                    TCB::releaseJoined(TCB::getRunning());
                    TCB::dispatch();
                } else {
                    TCB::quitThread((thread_t)a1);
                    TCB::releaseJoined((thread_t)a1);
                }
                break;
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
                if (*((sem_t*)a1) != nullptr) {
                    __asm__ volatile("li a0, 0");
                } else {
                    __asm__ volatile("li a0, -1");
                }
                __asm__ volatile("sd a0, 80(s0)");
                break;
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
                __asm__ volatile("sd a0, 80(s0)");
                delete (sem_t)a1;
                break;
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
                __asm__ volatile("sd a0, 80(s0)");
                break;
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
                __asm__ volatile("sd a0, 80(s0)");
                break;
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
                    __asm__ volatile("li a0, 0");
                } else {
                    __asm__ volatile("li a0, -1");
                }
                __asm__ volatile("sd a0, 80(s0)");
                if ((time_t)a1 > 0) {
                    Scheduler::putToSleep(TCB::getRunning(), (time_t)a1);
                    TCB::dispatch();
                }
                break;
            case 0x41:
                //getc
                KConsole::kgetc();
                __asm__ volatile("sd a0, 80(s0)");
                break;
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
                break;
            case 0x43:
                //flush izlaznog bafera konzole
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
                    char c = KConsole::getFromOutput();
                    while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
                    KConsole::setDRvalue(c);
                    sem_signal(KConsole::getOutputBufferHasSpace());
                }
                break;
            case 0x80:
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
                if (*((thread_t*)a1) != nullptr) {
                    __asm__ volatile("li a0, 0");
                } else {
                    __asm__ volatile("li a0, -1");
                }
                __asm__ volatile("sd a0, 80(s0)");
                break;
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                if (((thread_t)a1)->getBody() != (TCB::Body)main) {
                    Scheduler::put((thread_t)a1);
                }
                break;
            default:
                //potreban printing.hpp
//                printString("\nNepostojeci op code: ");
//                printInt(a0);
//                printString("\nscause: ");
//                printInt(scause);
//                printString("\nsepc: ");
//                printInt(sepc);
                break;
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    } else if (scause == 0x8000000000000009) {
        //spoljasnji hardverski prekid (od konzole)
        uint64 irq = plic_claim();
        if (irq == CONSOLE_IRQ) {
            if (KConsole::getSRvalue() & CONSOLE_RX_STATUS_BIT) {
                //upisuje karakter sa ulaza(otkucani) u ulazni bafer KConsole
                KConsole::placeInInput(KConsole::getDRvalue());
            }
        }
        plic_complete(irq);
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
        Riscv::mc_sip(Riscv::SIP_SEIP);
    } else if (scause == 0x8000000000000001) {
        //prekid od tajmera
        Scheduler::wake();
        TCB::getRunningTimeSlice()++;
        Riscv::mc_sip(Riscv::SIP_SSIP);
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
            TCB::dispatch();
        }
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));

    } else {
        //potreban printing.hpp
//        printString("\nGreska u prekidnoj rutini\n");
//        printString("scause: ");
//        printInt(scause);
//        printString("\nsepc: ");
//        printInt(sepc);
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    }
}