#include "../h/syscall_c.hpp"

#include "../h/syscall_cpp.hpp"

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void* arg) {
    time_t sleep_time = *((time_t*)arg);
    int i = 6;
    while (--i > 0) {

        printString("Hello ");
        printInt(sleep_time);
        printString(" !\n");
        time_sleep(sleep_time);
    }
    finished[sleep_time / 10 - 1] = true;
}

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

void testSleeping() {
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    thread_t sleepyThread[sleepy_thread_count];
    //timer t;
    //t.start();
    for (int i = 0; i < sleepy_thread_count; i++) {
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    }
    while (!(finished[0] && finished[1])) {}
    //t.terminate();
    //t.join();
}
