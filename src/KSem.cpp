//
// Created by os on 6/4/23.
//

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment));
}

void KSem::operator delete(void* ptr) {
	MemoryAllocator::kfree(ptr);
}

KSem* KSem::initSem(uint val) {
	return new KSem(val);
}

void KSem::wait() {
	if(!working) return;
	if (--val < 0) block();
}

void KSem::signal() {
	if(!working) return;
	if (val++ < 0) unblock();
}

void KSem::block() {
	TCB::running->setBlocked(true);
	blocked.putLast(TCB::running);
	TCB::yield();
}

void KSem::unblock() {
	TCB* tcb = blocked.getFirst();
	tcb->setBlocked(false);
	Scheduler::put(tcb);
}

int KSem::closeSem(sem_t handle) {
	handle->working=false;
	while(!handle->blocked.isEmpty()){
		TCB* tcb = handle->blocked.getFirst();
		tcb->setBlocked(false);
		Scheduler::put(tcb);
	}
	return 0;
}
