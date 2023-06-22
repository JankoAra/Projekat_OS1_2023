//
// Created by os on 5/25/23.
//

#include "../h/Scheduler.hpp"
#include "../h/TCB.hpp"

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    if (tail == nullptr) {
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
        tail = tcb;
    }
    tcb->setStatus(TCB::ACTIVE);
}

TCB* Scheduler::get() {
    TCB* firstThread = head;
    head = head->nextInScheduler;
    if (head == nullptr) {
        tail = head = nullptr;
    }
    firstThread->nextInScheduler = nullptr;
    return firstThread;
}

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    tcb->status = TCB::SLEEPING;
    if (sleepingHead == nullptr) {
        sleepingHead = tcb;
        tcb->timeToSleep = sleepTime;
        return;
    }
    TCB* prevSleeping = nullptr;
    time_t accumulated = 0;
    TCB* current = sleepingHead;
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
        accumulated += current->timeToSleep;
        prevSleeping = current;
    }
    if (!prevSleeping) {
        tcb->nextSleeping = sleepingHead;
        sleepingHead = tcb;
        tcb->timeToSleep = sleepTime;
        tcb->nextSleeping->timeToSleep -= sleepTime;
        return;
    }
    tcb->nextSleeping = current;
    prevSleeping->nextSleeping = tcb;
    tcb->timeToSleep = sleepTime - accumulated;
    if (current) current->timeToSleep -= sleepTime - accumulated;
}

void Scheduler::wake() {
    if (!sleepingHead) return;
    sleepingHead->timeToSleep--;
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
        TCB* thread = sleepingHead;
        sleepingHead = sleepingHead->nextSleeping;
        thread->nextSleeping = nullptr;
        Scheduler::put(thread);
    }
}
