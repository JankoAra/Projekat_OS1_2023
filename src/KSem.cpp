//
// Created by os on 6/4/23.
//

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    return mem_alloc(size);
}

void KSem::operator delete(void* ptr) {
    mem_free(ptr);
}

KSem* KSem::initSem(uint val) {
	return new KSem(val);
}

int KSem::wait() {
	if (!working) return -3;
	if (--val < 0) {
		block();
		return -1;
	}
	return 0;
}

int KSem::signal() {
	if (!working) return -3;
	if (val++ < 0) {
		unblock();
	}
	return 0;
}

void KSem::block() {
    TCB::getRunning()->setStatus(TCB::BLOCKED);
	blocked.putLast(TCB::getRunning());
	TCB::dispatch();
}

void KSem::unblock() {
	TCB* tcb = blocked.getFirst();
	Scheduler::put(tcb);
}

int KSem::closeSem(sem_t handle) {
	handle->working = false;
	while (!handle->blocked.isEmpty()) {
		TCB* tcb = handle->blocked.getFirst();
		Scheduler::put(tcb);
	}
	return 0;
}
