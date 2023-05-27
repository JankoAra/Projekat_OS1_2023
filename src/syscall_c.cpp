#include "../h/syscall_c.hpp"
#include "../h/Riscv.hpp"

inline void scall() {
	__asm__ volatile("ecall");
}

void* mem_alloc(size_t size) {
	//size je u bajtovima, pretvara se u blokove
	size = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
	__asm__ volatile("mv a1, %[size]": :[size] "r"(size));
	Riscv::loadOpCode(0x01);

	scall();

	void* ret;
	__asm__ volatile("mv %[ptr], a0":[ptr] "=r"(ret));
	return ret;
}

int mem_free(void* ptr) {
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(ptr));
	Riscv::loadOpCode(0x02);

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
	return status;
}

int thread_create(thread_t* handle, void (* start_routine)(void*), void* arg) {
	return 0;
}

int thread_exit() {
	return 0;
}

void thread_dispatch() {

}

void thread_join(thread_t handle) {

}

int time_sleep(time_t) {
	return 0;
}

int sem_open(sem_t* handle, unsigned int init) {
	return 0;
}

int sem_close(sem_t handle) {
	return 0;
}

int sem_wait(sem_t id) {
	return 0;
}

int sem_signal(sem_t id) {
	return 0;
}

char getc() {
	return 0;
}

void putc(char) {

}
