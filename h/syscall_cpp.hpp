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
    //konstruktor koji pravi nit koja izvrsava zadatu funkciju sa zadatim argumentima, ne pokrece nit
    Thread(void (* body)(void*), void* arg);

    virtual ~Thread();

    //stavlja nit u Scheduler
    int start();

    //pozivajuca (running) nit se suspenduje dok se nit ciji se metod poziva(this) ne zavrsi
    void join();

    //sinhrona promena konteksta
    static void dispatch();

    //uspavljuje tekucu nit na zadati period
    static int sleep(time_t);

protected:
    //konstruktor koji pravi nit koja izvrsava run metodu, ne stavlja je u Scheduler
    Thread();

    //funkcija koju nit izvrsava, samo ako je nit napravljena podrazumevanim konstruktorom
    virtual void run() {}

private:
    //pokazivac na TCB strukturu kernela
    thread_t myHandle;

    void (* body)(void*);

    void* arg;

    static void wrapper(void* thread);
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

    virtual void run() override;

private:
    time_t period;
};


class Console {
public:
    static char getc();

    static void putc(char);
};

#endif