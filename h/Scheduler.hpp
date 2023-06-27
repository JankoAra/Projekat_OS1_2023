//
// Created by os on 5/25/23.
//

#ifndef PROJEKAT2023_SCHEDULER_HPP
#define PROJEKAT2023_SCHEDULER_HPP

class TCB;

typedef unsigned long time_t;

class Scheduler {
private:
    static TCB* head, * tail;
    static TCB* sleepingHead;

    Scheduler() {}

public:
    //stavljanje na kraj reda aktivnih niti
    static void put(TCB* tcb);

    //uzimanje sa pocetka reda aktivnih niti
    static TCB* get();

    //stavljanje u red uspavanih niti
    static void putToSleep(TCB* tcb, time_t sleepTime);

    //azuriranje vrednosti u redu uspavanih niti, budjenje niti po potrebi
    static void wake();

    static TCB* getHead() { return head; }

    static void setHead(TCB* tcb) { head = tcb; }

    static TCB* getTail() { return tail; }

    static void setTail(TCB* tcb) { tail = tcb; }

    static TCB* getSleepingHead() { return sleepingHead; }

    static void setSleepingHead(TCB* tcb) { sleepingHead = tcb; }

};


#endif //PROJEKAT2023_SCHEDULER_HPP
