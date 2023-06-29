//
// Created by os on 6/27/23.
//
#include "../h/syscall_c.hpp"
#include "../h/syscall_cpp.hpp"

#include "../test/printing.hpp"

//Semaphore* s12,*s23,*s31;
Thread* nit1, * nit2, * nit3;

uint64 fact(uint64 i) {
    if (i <= 1) return 1;
    if (i % 2) thread_dispatch();
    return i * fact(i - 1);
}

void f1(void* end) {
    uint64 i = fact(*(uint64*)end);
    printString("f1: i=");
    printInt(i);
    printString("\nGotova nit 1\n");
}


void f2(void* end) {
    uint64 i = fact(20);
    printString("f2: i=");
    printInt(i);

    printString("\nGotova nit 2\n");
}


static void f3(void* end) {
    time_t sleep_time = *((time_t*)end);
    int i = 6;
    while (--i > 0) {

        printString("Hello ");
        printInt(sleep_time);
        printString(" !\n");
        time_sleep(sleep_time);
    }
    //printString("\nGotova nit3\n");
}


class timer1 : public PeriodicThread {
public:
    int counter = 0;

    explicit timer1() : PeriodicThread(1) {}

    void periodicActivation() override {
        printString("Tajmer: ");
        printInt(counter++);
        printString("\n");
    }
};

struct rowdesc {
    uint64* row;
    int len;
    int num;
};

void sumRow(void* rowd) {
    if (!rowd) return;
    rowdesc rd = *(rowdesc*)rowd;
    uint64 sum = 0;
    for (int i = 0; i < rd.len; i++) {
        sum += rd.row[i];
    }
    printString("Suma reda ");
    printInt(rd.num);
    printString(". = ");
    printInt(sum);
    printString("\n");
}

void user(void*) {
    const int dim = 10;
    uint64 matrix[dim][dim];
    for (int i = 0; i < dim; i++) {
        for (int j = 0; j < dim; j++) {
            matrix[i][j] = ((i * 10 + j) * ((i+j) * j ^ i<<j)) % 100;
            printInt(matrix[i][j]);
            if (j == dim - 1) printString("\n");
            else printString(" ");
        }
    }
    thread_t handles[dim];
    rowdesc rds[dim];
    for (int i = 0; i < dim; i++) {

        rds[i].row = matrix[i];
        rds[i].len = dim;
        rds[i].num = i;
        thread_create(&handles[i], sumRow, &rds[i]);
    }
    for (int i = 0; i < dim; i++) {
        thread_join(handles[i]);
    }
}

void user2(void*) {
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    thread_t sleepyThread[sleepy_thread_count];
    timer1 t;
    t.start();
    for (int i = 0; i < sleepy_thread_count; i++) {
        thread_create(&sleepyThread[i], f3, sleep_times + i);
    }

    thread_join(sleepyThread[0]);
    thread_join(sleepyThread[1]);
    t.terminate();
    //t.join();
    printString("izlazim iz user 2\n");
}