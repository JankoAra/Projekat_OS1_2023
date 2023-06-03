//
// Created by os on 5/29/23.
//
#include "../h/syscall_cpp.hpp"

//override globalnog new
void* operator new(size_t size) {
	return mem_alloc(size);
}

void* operator new[](size_t size) {
	return mem_alloc(size);
}

void operator delete(void* ptr)noexcept {
mem_free(ptr);
}

void operator delete[](void* ptr)noexcept {
mem_free(ptr);
}

Thread::Thread(void (* body)(void*), void* arg) {

}

Thread::~Thread() {

}

int Thread::start() {
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
