//
// Created by os on 5/23/23.
//

#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"

TCB* TCB::running = nullptr;
uint64 TCB::runningTimeSlice = 0;

TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
	return new TCB(function, args, stack);
}

void TCB::dispatch() {
	TCB* old = TCB::running;
	if (!old->isFinished() && !old->isBlocked()) {
		Scheduler::put(old);
	}
	TCB::running = Scheduler::get();
	TCB::contextSwitch(&old->context, &running->context);
}

void TCB::yield() {
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::functionWrapper(void*) {

}

