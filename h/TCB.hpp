//
// Created by os on 5/23/23.
//

#ifndef PROJEKAT2023_TCB_HPP
#define PROJEKAT2023_TCB_HPP

#include "../lib/hw.h"
#include "../h/ThreadQueue.hpp"

int main();

class TCB {
public:
    friend class Scheduler;

    using Body = void (*)(void*);

    enum ThreadStatus {
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    static TCB* createThread(Body function, void* args, uint64* stack);

    void setStatus(ThreadStatus stat) { this->status = stat; }

    ThreadStatus getStatus() { return this->status; }

    uint64 getTimeSlice() { return timeSlice; }

    Body getBody() { return threadFunction; }

    ThreadQueue* getListOfJoiningThreads(){return &waitingToJoin;}

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }

    static uint64 &getRunningTimeSlice() { return runningTimeSlice; }

    static void threadJoin(TCB* handle);

    static void releaseJoined(TCB* handle);

    static void dispatch();

    static void wrapper();

    static void quitThread(TCB* handle);

    static void* operator new(size_t size);

    static void operator delete(void* ptr);

private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED), mySemaphore(nullptr),
                                                    joiningWithTCB(nullptr) {
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
        this->context.ra = startRa;
        this->context.sp = startSp;
    }

    //kontekst procesora za datu nit, ostali registri se cuvaju na steku
    struct Context {
        uint64 ra;
        uint64 sp;
    } context;
    Body threadFunction;    //funkcija koja se izvrsava
    uint64* stack;            //najniza adresa steka; stek raste ka nizim adresama, pokazuje na poslednju zauzetu
    void* args;                //argumenti poziva funkcije
    uint64 timeSlice;        //vremenski odsecak dodeljen datoj niti
    TCB* nextInScheduler;    // pokazivac na sledecu nit u Scheduler-u
    time_t timeToSleep;        //vreme na koje je uspavana nit
    TCB* nextSleeping;        //sledeca nit u listi za spavanje u Scheduler-u
    ThreadQueue waitingToJoin;    //red niti koje su pozvale join nad ovom niti
    ThreadStatus status;    //status niti
    KSem* mySemaphore;  //semafor na kom je nit blokirana
    TCB* joiningWithTCB;    //nit za koju je ova nit pozvala join

    static TCB* running;    //pokazivac na tekucu nit
    static uint64 runningTimeSlice; //proteklo vreme od poslednje promene konteksta

    static void contextSwitch(Context* oldContext, Context* newContext);    //implementacija u asm
};


#endif //PROJEKAT2023_TCB_HPP
