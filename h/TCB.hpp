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

	static TCB* createThread(Body function, void* args, uint64* stack);
	static void start(TCB* newTcb);

	bool isFinished() { return finished; }

	void setFinished(bool finish) { this->finished = finish; }

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64 getTimeSlice() { return timeSlice; }

	void setTimeSlice(uint64 value) { timeSlice = value; }

	//static void threadSleep(time_t sleepTime);

	static void threadJoin(TCB* handle);

	static void releaseJoined();

	static void yield();

	static void dispatch();

	static void wrapper();

	static TCB* running;
	static uint64 runningTimeSlice;

//	TCB* getNextInScheduler(){
//		return nextInScheduler;
//	}
//	void setNextInScheduler(TCB* tcb){
//		nextInScheduler = tcb;
//	}

private:
	//kontekst procesora za datu nit
	struct Context {
		uint64 ra;
		uint64 sp;
	} context;
	Body threadFunction;    //funkcija koja se izvrsava
	uint64* stack;            //najniza adresa steka; stek raste ka nizim adresama, pokazuje na poslednju zauzetu
	void* args;                //argumenti poziva funkcije
	uint64 timeSlice;        //vremenski odsecak dodeljen datoj niti
	bool finished;            //da li je nit zavrsila izvrsavanje funkcije
	bool blocked;            //da li je nit blokirana
	bool needToJoin;        //da li je nit pozvala join i ceka da se neka druga zavrsi
	TCB* nextInScheduler;    // pokazivac na sledecu nit u Scheduler-u
	time_t timeToSleep;        //vreme na koje je uspavana nit
	TCB* nextSleeping;        //sledeca nit u listi za spavanje u Scheduler-u
	ThreadQueue waitingToJoin;    //red niti koje su pozvale join nad ovom niti


	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													needToJoin(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
		this->context.ra = startRa;
		this->context.sp = startSp;
	}


	static void contextSwitch(Context* oldContext, Context* newContext);    //implementacija u asm

	static void* operator new(size_t size);

	static void operator delete(void* ptr);
};


#endif //PROJEKAT2023_TCB_HPP
