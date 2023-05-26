//
// Created by os on 5/25/23.
//

#ifndef PROJEKAT2023_SCHEDULER_HPP
#define PROJEKAT2023_SCHEDULER_HPP


#include "../h/List.hpp"

class TCB;

class Scheduler {
public:
	static void put(TCB*);

	static TCB* get();

private:
	static List<TCB> readyThreads;

	Scheduler() {}
};


#endif //PROJEKAT2023_SCHEDULER_HPP
