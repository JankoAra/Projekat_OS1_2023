//
// Created by os on 5/25/23.
//

#include "../h/Scheduler.hpp"
List<TCB> Scheduler::readyThreads;

void Scheduler::put(TCB* thread) {
	readyThreads.addLast(thread);
}

TCB* Scheduler::get() {
	return readyThreads.removeFirst();
}
