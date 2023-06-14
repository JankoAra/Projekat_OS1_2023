//
// Created by os on 6/4/23.
//

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    return mem_alloc(size);
	//return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
}

void KSem::operator delete(void* ptr) {
    mem_free(ptr);
	//MemoryAllocator::kfree(ptr);
}

KSem* KSem::initSem(uint val) {
	return new KSem(val);
}

int KSem::wait() {
	//if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
	if (!working) return -3;
	if (--val < 0) {
		block();
		return -1;
	}
	return 0;
}

int KSem::signal() {
	//if (!MemoryAllocator::checkPurpose(this, MemoryAllocator::SEMAPHORE)) return -2;
	if (!working) return -3;
	if (val++ < 0) {
		unblock();
	}
	return 0;
}

void KSem::block() {
	//TCB::running->setBlocked(true);
    TCB::running->setStatus(TCB::BLOCKED);
	blocked.putLast(TCB::running);
	TCB::yield();
}

void KSem::unblock() {
	TCB* tcb = blocked.getFirst();
	//tcb->setBlocked(false);
    tcb->setStatus(TCB::ACTIVE);
	Scheduler::put(tcb);
}

int KSem::closeSem(sem_t handle) {
	//if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
	handle->working = false;
	while (!handle->blocked.isEmpty()) {
		TCB* tcb = handle->blocked.getFirst();
		//tcb->setBlocked(false);
        tcb->setStatus(TCB::ACTIVE);
		Scheduler::put(tcb);
	}
	return 0;
}
