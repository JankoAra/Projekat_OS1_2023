//
// Created by os on 5/23/23.
//

#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../h/Scheduler.hpp"
#include "../h/KSem.hpp"

void kernelConsumerFunction(void*);

void idle(void*);

void userMain();

int main();

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
    } else if (old->status == FINISHED) {
        //brisanje steka niti ako je zavrsena, objekat TCB ostaje zbog moguceg join-a
        delete old->stack;
        old->stack = nullptr;
    }
    TCB::running = Scheduler::get();
    TCB::runningTimeSlice = 0;

    //sada biramo u kom rezimu ce se izvrsavati nit, upisom bita SSTATUS_SPP
    //ako treba da se izvrsava kernel nit, povratak je u sistemski rezim, inace u korisnicki
    if (TCB::running->threadFunction == (TCB::Body)main || TCB::running->threadFunction == kernelConsumerFunction ||
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

void TCB::releaseJoined(TCB* handle) {
    while (!handle->waitingToJoin.isEmpty()) {
        TCB* tcb = handle->waitingToJoin.getFirst();
        Scheduler::put(tcb);
    }
}

void TCB::quitThread(TCB* handle) {
    TCB* prev, * curr;
    switch (handle->status) {
        case CREATED:
            break;
        case ACTIVE:
            //nit je u Scheduler-u, treba da se izbaci nit i preveze Scheduler
            for (prev = nullptr, curr = Scheduler::getHead();
                 curr != handle; prev = curr, curr = curr->nextInScheduler);
            if (!prev) {
                Scheduler::setHead(curr->nextInScheduler);
            } else {
                prev->nextInScheduler = curr->nextInScheduler;
            }
            if (curr == Scheduler::getTail()) {
                Scheduler::setTail(prev);
            }
            curr->nextInScheduler = nullptr;
            break;
        case BLOCKED:
            //nit blokirana na semaforu, treba da se izbaci iz reda blokiranih na semaforu
            if (handle->mySemaphore->getBlocked()->remove(handle) < 0) {
                //greska
            } else {
                handle->mySemaphore->increaseVal(1);
                handle->mySemaphore = nullptr;
            }
            break;
        case JOINING:
            //nit ceka da se neka druga nit zavrsi
            if (handle->joiningWithTCB->getListOfJoiningThreads()->remove(handle) < 0) {
                //greska
            } else {
                handle->joiningWithTCB = nullptr;
            }
            break;
        case SLEEPING:
            //nit je u redu uspavanih, treba da se izbaci
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
                 curr != handle; prev = curr, curr = curr->nextSleeping);
            if (!prev) {
                Scheduler::setSleepingHead(curr->nextSleeping);
            } else {
                prev->nextSleeping = curr->nextSleeping;
            }
            if (curr->nextSleeping) {
                curr->nextSleeping->timeToSleep += curr->timeToSleep;
            }
            curr->timeToSleep = 0;
            curr->nextSleeping = nullptr;
            break;
        case FINISHED:
            break;
        default:
            break;
    }
    handle->status = FINISHED;
    delete handle->stack;
}

