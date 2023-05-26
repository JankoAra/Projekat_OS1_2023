#include "../h/syscall_c.hpp"

inline void scall() {
	__asm__ volatile("ecall");
}

void* mem_alloc(size_t size) {
	size = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
	__asm__ volatile("mv a1, %[size]": :[size] "r"(size));
	__asm__ volatile("li a0, 0x01");    //op code = 0x01

	scall();

	void* ret;
	__asm__ volatile("mv %[ptr], a0":[ptr] "=r"(ret));
	return ret;
}

int mem_free(void* ptr) {
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(ptr));
	__asm__ volatile("li a0, 0x02");    //op code = 0x02

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
	return status;
}