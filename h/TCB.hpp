//
// Created by os on 5/23/23.
//

#ifndef PROJEKAT2023_TCB_HPP
#define PROJEKAT2023_TCB_HPP

#include "../lib/hw.h"
#include "../h/Scheduler.hpp"

class TCB {
public:
	using Body = void (*)(void*);

	static TCB* createThread(Body function, void* args, uint64* stack);

	bool isFinished() { return finished; }

	void setFinished(bool finish) { this->finished = finish; }

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64& getTimeSlice() { return timeSlice; }

	void setTimeSlice(uint64 value) { timeSlice = value; }

	static void threadSleep(time_t sleepTime);

	static void yield();

	static void dispatch();

	static void functionWrapper(void*);

	static TCB* running;
	static uint64 runningTimeSlice;

private:
	TCB(Body function, void* args, uint64* stack) {
		this->threadFunction = function;
		this->args = args;
		this->stack = stack;
		this->timeSlice = DEFAULT_TIME_SLICE;
		this->finished = false;
		this->blocked = false;
		this->context.ra = (uint64)&functionWrapper;
		this->context.sp = (uint64)&stack[DEFAULT_STACK_SIZE];

		Scheduler::put(this);
	}

	struct Context {
		uint64 sp;
		uint64 ra;
	} context;

	Body threadFunction;
	uint64* stack;
	void* args;
	uint64 timeSlice;
	bool finished;
	bool blocked;

	static void contextSwitch(Context* oldContext, Context* newContext);	//implementacija u asm
};


#endif //PROJEKAT2023_TCB_HPP
