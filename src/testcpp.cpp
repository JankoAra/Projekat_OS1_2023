//
// Created by os on 6/27/23.
//
#include "../h/syscall_c.hpp"
#include "../h/syscall_cpp.hpp"

#include "../test/printing.hpp"

#include "../h/KMemory.hpp"

//Semaphore* s12,*s23,*s31;
Thread* nit1, * nit2, * nit3;


void f1(void* end) {

    time_sleep(10);
    printString("\nGotova nit 1\n");
}


void f2(void* end) {


    printString("\nGotova nit 2\n");
}


void f3(void* end) {

    printString("\nGotova nit3\n");
}

class pt : public PeriodicThread {
public:
    time_t period;
    int counter = 5;

    explicit pt(time_t p) : PeriodicThread(p), period(p) {}

    void periodicActivation() override {
        printString("Janko ");
        sleep(period);
        printInt(period);
        printString("\n");
        if (--counter == 0)terminate();
    }
};

class timer : public PeriodicThread {
public:
    int counter = 0;

    explicit timer() : PeriodicThread(1) {}

    void periodicActivation() override {
        printString("Tajmer: ");
        printInt(counter++);
        printString("\n");
    }
};

void user(void*) {
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    int end = 0;
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    nit1 = new Thread(f1, &end);
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    nit2 = new Thread(f2, &end);
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    nit3 = new Thread(f3, &end);
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    PeriodicThread* per = new timer();
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
//    s12 = new Semaphore(0);
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
//    s23 = new Semaphore(0);
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
//    s31 = new Semaphore(1);
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    nit1->start();
    nit3->start();
    nit2->start();
    per->start();

    nit1->join();
    nit2->join();
    nit3->join();


    //printString("\nGotove user niti\n");

    //printString("\nSad cu da izadjem iz usera\n");
    per->terminate();

//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    delete nit1;
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    delete nit2;
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    delete nit3;
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    per->join();
    delete per;
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");

//    delete s12;
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
//    delete s23;
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
//    delete s31;
//    printInt(KMemory::freeBlocksLeft);
    printString("\n");
}

void user2(void*) {
    Semaphore* s12, * s23, * s31;
    s12 = new Semaphore(0);
    s23 = new Semaphore(0);
    s31 = new Semaphore(1);
    delete s12;
    delete s23;
    delete s31;
    printString("\n");

    Thread t(f1, nullptr);
    t.start();
    time_sleep(20);
    Thread* t2 = new Thread(f2,nullptr);
    t2->start();
    t2->join();
    t.join();
    delete t2;
    printString("izlazim iz user 2\n");
}