//
// Created by os on 5/23/23.
//

#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../h/Scheduler.hpp"

TCB* TCB::running = nullptr;
uint64 TCB::runningTimeSlice = 0;

TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
	TCB* newThread = new TCB(function, args, stack);
	Scheduler::getInstance().put(newThread);
	return newThread;
}

void TCB::dispatch() {
	TCB* old = TCB::running;
	if (!old->isFinished() && !old->isBlocked()) {
		Scheduler::getInstance().put(old);
	}
	TCB::running = Scheduler::getInstance().get();
	TCB::contextSwitch(&old->context, &running->context);
}

void TCB::yield() {
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
	running->threadFunction(running->args);
	running->finished = true;
	TCB::yield();
}

