//
// Created by os on 5/29/23.
//
#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"
#include "../h/KSem.hpp"
#include "../h/Scheduler.hpp"

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

//konstruktor za Thread
Thread::Thread(void (* body)(void*), void* arg) {
	this->body = body;
	this->arg = arg;
	//stvaranje steka ako se ne radi o main kernel niti, posto ona automatski ima stek
	uint64* stack = nullptr;
	if (body != nullptr) {
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
	}
	//uint64* stack = (start_routine != nullptr ? (uint64*)MemoryAllocator::kmalloc(DEFAULT_STACK_SIZE) : nullptr);
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
	thread_join(this->myHandle);
	delete myHandle;

	//ovo nije dobro
	//thread_exit();
}

int Thread::start() {
	if (myHandle == nullptr) return -1;
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
	Scheduler::putToSleep(TCB::running, t);
	return 0;
}

Thread::Thread() {
	this->body = wrapper;
	this->arg = this;
	//stvaranje steka ako se ne radi o main kernel niti, posto ona automatski ima stek
	uint64* stack = nullptr;
	if (body != nullptr) {
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
	}
	//uint64* stack = (start_routine != nullptr ? (uint64*)MemoryAllocator::kmalloc(DEFAULT_STACK_SIZE) : nullptr);
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
}

PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
}

void PeriodicThread::periodicWrapper(void* pThread) {
	if (pThread != nullptr) {
		PeriodicThread* ptr = (PeriodicThread*)pThread;
		while (1) {
			ptr->periodicActivation();
			Thread::sleep(ptr->period);
		}
	}
}

char Console::getc() {
	return ::getc();
}

void Console::putc(char c) {
	::putc(c);
}
