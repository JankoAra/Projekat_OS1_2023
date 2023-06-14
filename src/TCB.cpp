//
// Created by os on 5/23/23.
//

#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../h/Scheduler.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"

TCB* TCB::running = nullptr;
uint64 TCB::runningTimeSlice = 0;

TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    //pravljenje niti
    TCB* newThread = new TCB(function, args, stack);

    //startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
    //if (functionToRun != nullptr) Scheduler::put(newThread);
    return newThread;
}

void kernelConsumerFunction(void*);

void idle(void*);

void userMain();

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

void TCB::yield() {
    Riscv::pushRegisters();
    TCB::dispatch();
    Riscv::popRegisters();
}

void TCB::wrapper() {
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
    Riscv::popSppSpie();
    //na dalje se izvrsavamo u user modu
    running->threadFunction(running->args);
    //running->finished = true;
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
}

void* TCB::operator new(size_t size) {
    return mem_alloc(size);
    //return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
}

void TCB::operator delete(void* ptr) {
    mem_free(ptr);
    //MemoryAllocator::kfree(ptr);
}

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED) return;
    TCB::running->status = JOINING;
    handle->waitingToJoin.putLast(TCB::running);
}

void TCB::releaseJoined() {
    while (!TCB::running->waitingToJoin.isEmpty()) {
        TCB* tcb = TCB::running->waitingToJoin.getFirst();
        tcb->status = ACTIVE;
        Scheduler::put(tcb);
    }
}

void TCB::start(TCB* newTcb) {
    //startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
    if (newTcb->threadFunction != nullptr) {
        Scheduler::put(newTcb);
        newTcb->status = ACTIVE;
    }
}


