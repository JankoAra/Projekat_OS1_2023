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
	static void put(TCB* tcb);

	static TCB* get();

	static TCB* getSleepingHead() { return sleepingHead; }

	static void putToSleep(TCB* tcb, time_t sleepTime);

	static void wake();
};


#endif //PROJEKAT2023_SCHEDULER_HPP
