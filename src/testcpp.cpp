//
// Created by os on 6/27/23.
//
#include "../h/syscall_c.hpp"
#include "../h/syscall_cpp.hpp"

#include "../test/printing.hpp"

sem_t s12,s23,s31;


void f1(void* end) {
    int i = 0;
    while (*(int*)end == 0) {
        sem_wait(s31);
        printString("nit 1\n");
        if (++i == 4) *(int*)end = 1;
        sem_signal(s12);
    }

    printString("\nGotova nit 1\n");
}


void f2(void* end ) {
    while (*(int*)end == 0) {
        sem_wait(s12);
        printString("nit 2\n");
        sem_signal(s23);
    }


    printString("\nGotova nit 2\n");
}


void f3(void* end) {
    while (*(int*)end == 0) {
        sem_wait(s23);
        printString("nit 3\n");
        sem_signal(s31);
    }

    printString("\nGotova nit3\n");
}

class pt:public PeriodicThread{
public:
    time_t period;
    int counter = 5;
    pt(time_t p): PeriodicThread(p),period(p){}
    void periodicActivation() override{
        printString("Janko ");
        printInt(period);
        printString("\n");
        if(--counter==0)terminate();
    }
};
void user(void*) {
    int end = 0;
    Thread* nit1 = new Thread(f1, &end);
    Thread* nit2 = new Thread(f2, &end);
    Thread* nit3 = new Thread(f3, &end);
    PeriodicThread* per = new pt(10);
    sem_open(&s12, 0);
    sem_open(&s23, 1);
    sem_open(&s31, 0);
    nit1->start();
    nit2->start();
    nit3->start();
    per->start();

    nit1->join();
    nit2->join();
    nit3->join();
    per->terminate();

    per->join();
    printString("\nGotove user niti\n");

    printString("\nSad cu da izadjem iz usera\n");
}