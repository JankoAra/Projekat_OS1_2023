//
// Created by os on 5/25/23.
//

#include "../h/Scheduler.hpp"
#include "../h/TCB.hpp"

//Scheduler* Scheduler::singleton = nullptr;
TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;

void Scheduler::put(TCB* tcb) {
	if (tail == nullptr) {
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
		tail = tcb;
	}
}

TCB* Scheduler::get() {
	TCB* firstThread = head;
	head = head->nextInScheduler;
	return firstThread;
}