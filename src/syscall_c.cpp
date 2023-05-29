#include "../h/syscall_c.hpp"
#include "../h/Riscv.hpp"
#include "../h/MemoryAllocator.hpp"

inline void scall() {
	__asm__ volatile("ecall");
}

void* mem_alloc(size_t size) {
	//na size moramo dodati zaglavlje segmenta
	size += sizeof(MemoryAllocator::UsedMemSegment);
	//size je u bajtovima, pretvara se u blokove
	size = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);

	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[size]": :[size] "r"(size):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("li a0, 0x01");
	//a0 = 0x01
	//a1 = broj blokova velicine MEM_BLOCK_SIZE za alokaciju

	scall();

	void* ret;
	__asm__ volatile("mv %[ptr], a0":[ptr] "=r"(ret));
	return ret;
}

int mem_free(void* ptr) {
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(ptr):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("li a0, 0x02");
	//a0 = 0x02
	//a1 = pokazivac na memoriju koju treba dealocirati

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
	return status;
}

int thread_create(thread_t* handle, void (* start_routine)(void*), void* arg) {
	//stvaranje steka ako se ne radi o main kernel niti, posto ona automatski ima stek
	uint64* stack = (start_routine != nullptr ? (uint64*)MemoryAllocator::kmalloc(DEFAULT_STACK_SIZE) : nullptr);
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("mv a2, %[function]": :[function] "r"(
			start_routine):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("li a0, 0x11");
	//a0 = 0x11
	//a1 = adresa pokazivaca na rucku niti
	//a2 = prva adresa funkcije koju nit izvrsava
	//a3 = pokazivac na argumente funkcije
	//a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
	return status;
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
