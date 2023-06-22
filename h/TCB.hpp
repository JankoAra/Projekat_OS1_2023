//
// Created by os on 5/23/23.
//

#ifndef PROJEKAT2023_TCB_HPP
#define PROJEKAT2023_TCB_HPP

#include "../lib/hw.h"
#include "../h/ThreadQueue.hpp"

class TCB {
public:
    friend class Scheduler;

    using Body = void (*)(void*);

    enum ThreadStatus {
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    void setStatus(ThreadStatus stat) { this->status = stat; }

    ThreadStatus getStatus() { return this->status; }

    static TCB* createThread(Body function, void* args, uint64* stack);

    static void start(TCB* newTcb);

    uint64 getTimeSlice() { return timeSlice; }

    void setTimeSlice(uint64 value) { timeSlice = value; }

    Body getBody() { return threadFunction; }

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }

    static uint64 &getRunningTimeSlice() { return runningTimeSlice; }

    static void threadJoin(TCB* handle);

    static void releaseJoined();

    static void dispatch();

    static void wrapper();


    static void* operator new(size_t size);

    static void operator delete(void* ptr);

private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED) {
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
        this->context.ra = startRa;
        this->context.sp = startSp;
    }

    //kontekst procesora za datu nit
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

    static TCB* running;
    static uint64 runningTimeSlice;

    static void contextSwitch(Context* oldContext, Context* newContext);    //implementacija u asm


};


#endif //PROJEKAT2023_TCB_HPP
