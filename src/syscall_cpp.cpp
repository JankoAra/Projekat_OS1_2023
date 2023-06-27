//
// Created by os on 5/29/23.
//
#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"
#include "../h/KSem.hpp"
#include "../h/Scheduler.hpp"

int main();

//override globalnog new
void* operator new(size_t size) {
    return mem_alloc(size);
}

void* operator new[](size_t size) {
    return mem_alloc(size);
}

void operator delete(void* ptr)

noexcept {
mem_free(ptr);
}

void operator delete[](void* ptr)

noexcept {
mem_free(ptr);
}

Thread::Thread(void (* body)(void*), void* arg) {
    this->body = body;
    this->arg = arg;
    //stvaranje steka ako se ne radi o main kernel niti, posto ona automatski ima stek
    uint64* stack = nullptr;
    if (body != (TCB::Body)main) {
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    }
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("mv a2, %[function]": :[function] "r"(
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("li a0, 0x80");
    //a0 = 0x80
    //a1 = adresa pokazivaca na rucku niti
    //a2 = prva adresa funkcije koju nit izvrsava
    //a3 = pokazivac na argumente funkcije
    //a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

    __asm__ volatile("ecall");
}

Thread::~Thread() {
    //ne treba da se gasi running nit, vec nit na koju pokazuje rucka od this
//    thread_join(this->myHandle);
//    delete myHandle;

    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("li a0, 0x15");

    __asm__ volatile("ecall");
}

int Thread::start() {
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("li a0, 0x81");

    __asm__ volatile("ecall");

    return 0;
}

void Thread::join() {
    thread_join(myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t t) {
    time_sleep(t);
    return 0;
}

Thread::Thread() {
    this->body = wrapper;
    this->arg = this;
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("mv a2, %[function]": :[function] "r"(
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    __asm__ volatile("li a0, 0x80");
    //a0 = 0x80
    //a1 = adresa pokazivaca na rucku niti
    //a2 = prva adresa funkcije koju nit izvrsava
    //a3 = pokazivac na argumente funkcije
    //a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
        ((Thread*)thread)->run();
    }
}

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
    delete myHandle;
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

void PeriodicThread::terminate() {
    this->period = -1;
}

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    while (period != -1UL) {
        periodicActivation();
        if (period == -1UL) break;
        sleep(period);
    }
    thread_exit();
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}
