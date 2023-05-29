//
// Created by os on 5/25/23.
//

#ifndef PROJEKAT2023_SCHEDULER_HPP
#define PROJEKAT2023_SCHEDULER_HPP


#include "../h/List.hpp"

class TCB;

class Scheduler {
private:
	List<TCB> readyThreads;
	static Scheduler* singleton;

	Scheduler() {}

public:
	static Scheduler& getInstance() {
		if(singleton==nullptr){
			Scheduler* instance = new Scheduler();
			singleton = instance;
		}
		return *singleton;
	}

	void put(TCB* tcb) {
		readyThreads.addLast(tcb);
	}

	TCB* get() {
		if (readyThreads.isEmpty()) {
			return nullptr;
		}
		TCB* tcb = readyThreads.removeFirst();
		return tcb;
	}
};


#endif //PROJEKAT2023_SCHEDULER_HPP
