//
// Created by os on 6/4/23.
//

#ifndef PROJEKAT2023_KSEM_HPP
#define PROJEKAT2023_KSEM_HPP

#include "../h/ThreadQueue.hpp"

//klasa napravljena po uzoru na semafor u skolskom jezgru
class KSem {
public:
	static KSem* initSem(uint val);

	int wait();

	int signal();

    //deaktiviranje semafora i oslobadjanje svih niti koje cekaju na njemu
	static int closeSem(sem_t handle);

	static void* operator new(size_t size);

	static void operator delete(void* ptr);

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


};


#endif //PROJEKAT2023_KSEM_HPP
