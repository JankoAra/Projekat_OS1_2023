#ifndef _syscall_cpp
#define _syscall_cpp

#include "../lib/hw.h"

void* operator new(size_t);

void* operator new[](size_t);

void operator delete(void*)

noexcept;

void operator delete[](void*)

noexcept;

class TCB;

typedef TCB* thread_t;

class KSem;

typedef KSem* sem_t;

class Thread {
public:
	Thread(void (* body)(void*), void* arg);

	virtual ~Thread();

	int start();

	void join();

	static void dispatch();

	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}

private:
	thread_t myHandle;

	void (* body)(void*);

	void* arg;
};


class Semaphore {
public:

	Semaphore(unsigned init = 1);

	virtual ~Semaphore();

	int wait();

	int signal();

private:
	sem_t myHandle;

};


class PeriodicThread : public Thread {
public:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}

private:
	time_t period;
};


class Console {
public:
	static char getc();

	static void putc(char);
};

#endif