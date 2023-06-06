//
// Created by os on 5/29/23.
//
#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"

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
	uint64* stack = nullptr;
	if (body != nullptr) {
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
	}
	myHandle = TCB::createThread(body,arg,stack);
}

Thread::~Thread() {

}

int Thread::start() {
	TCB::start(myHandle);
	return 0;
}

void Thread::join() {

}

void Thread::dispatch() {

}

int Thread::sleep(time_t) {
	return 0;
}

Thread::Thread() {

}

Semaphore::Semaphore(unsigned int init) {

}

Semaphore::~Semaphore() {

}

int Semaphore::wait() {
	return 0;
}

int Semaphore::signal() {
	return 0;
}

void PeriodicThread::terminate() {

}

PeriodicThread::PeriodicThread(time_t period) {

}

char Console::getc() {
	return 0;
}

void Console::putc(char) {

}
