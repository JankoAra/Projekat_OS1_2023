//
// Created by os on 6/4/23.
//

#ifndef PROJEKAT2023_KSEM_HPP
#define PROJEKAT2023_KSEM_HPP

#include "../h/ThreadQueue.hpp"


class KSem {
public:
	static KSem* initSem(uint val);

	void wait();

	void signal();

	static int closeSem(sem_t handle);

protected:
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}

	KSem(const KSem&) = delete;

	KSem& operator=(const KSem&) = delete;

	int val;
	ThreadQueue blocked;

	//da li je semafor ugasen ili ne
	bool working;

	static void* operator new(size_t size);

	static void operator delete(void* ptr);
};


#endif //PROJEKAT2023_KSEM_HPP
