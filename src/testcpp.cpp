//
// Created by os on 6/27/23.
//
#include "../h/syscall_c.hpp"
#include "../h/syscall_cpp.hpp"

#include "../test/printing.hpp"

Semaphore* s12,*s23,*s31;
Thread* nit1, *nit2, *nit3;


void f1(void* end) {
    s31->wait();
    time_sleep(10);
    delete nit2;
    s31->wait();


    printString("\nGotova nit 1\n");
}


void f2(void* end ) {
    time_sleep(5);
    s31->wait();


    printString("\nGotova nit 2\n");
}


void f3(void* end) {
    time_sleep(30);
    s31->signal();

    printString("\nGotova nit3\n");
}

class pt:public PeriodicThread{
public:
    time_t period;
    int counter = 5;
    explicit pt(time_t p): PeriodicThread(p),period(p){}
    void periodicActivation() override{
        printString("Janko ");
        sleep(period);
        printInt(period);
        printString("\n");
        if(--counter==0)terminate();
    }
};
class timer:public PeriodicThread{
public:
    int counter = 0;
    explicit timer(): PeriodicThread(1){}
    void periodicActivation() override{
        printString("Tajmer: ");
        printInt(counter++);
        printString("\n");
    }
};
void user(void*) {
    int end = 0;
    nit1 = new Thread(f1, &end);
    nit2 = new Thread(f2, &end);
    nit3 = new Thread(f3, &end);
    PeriodicThread* per = new timer();
    s12 = new Semaphore(0);
    s23 = new Semaphore(0);
    s31 = new Semaphore(1);
    nit1->start();
    nit3->start();
    nit2->start();
    per->start();

    time_sleep(50);
    nit1->join();
    nit2->join();
    nit3->join();


    printString("\nGotove user niti\n");

    printString("\nSad cu da izadjem iz usera\n");
    time_sleep(10);
    per->terminate();
}