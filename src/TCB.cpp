//
// Created by os on 5/23/23.
//

#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../h/Scheduler.hpp"

void kernelConsumerFunction(void*);

void idle(void*);

void userMain();

TCB* TCB::running = nullptr;
uint64 TCB::runningTimeSlice = 0;

TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    TCB* newThread = new TCB(function, args, stack);
    return newThread;
}

void TCB::dispatch() {
    TCB* old = TCB::running;
    if (old->status == ACTIVE) {
        Scheduler::put(old);
    }
    TCB::running = Scheduler::get();
    TCB::runningTimeSlice = 0;

    //sada biramo u kom rezimu ce se izvrsavati nit, upisom bita SSTATUS_SPP
    //ako treba da se izvrsava kernel nit, povratak je u sistemski rezim, inace u korisnicki
    if (TCB::running->threadFunction == nullptr || TCB::running->threadFunction == kernelConsumerFunction ||
        TCB::running->threadFunction == idle) {
        Riscv::ms_sstatus(Riscv::SSTATUS_SPP);
    } else {
        Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    }

    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
}

void TCB::wrapper() {
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch)
    Riscv::returnFromInterrupt();
    //na dalje se izvrsavamo u user modu (osim za kernel funkcije)
    running->threadFunction(running->args);
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
}

void* TCB::operator new(size_t size) {
    return mem_alloc(size);
}

void TCB::operator delete(void* ptr) {
    mem_free(ptr);
}

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED || TCB::running == handle) return;
    TCB::running->status = JOINING;
    handle->waitingToJoin.putLast(TCB::running);
}

void TCB::releaseJoined() {
    while (!TCB::running->waitingToJoin.isEmpty()) {
        TCB* tcb = TCB::running->waitingToJoin.getFirst();
        Scheduler::put(tcb);
    }
}

void TCB::start(TCB* newTcb) {
    //startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
    if (newTcb->threadFunction != nullptr) {
        Scheduler::put(newTcb);
    }
}


