#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/helper.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/List.hpp"
//#include "../h/MemoryAllocator.hpp"

extern "C" void interruptHandler();

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

//uint64 temp;
//
//void f() {
//	__putc('a');
//	__putc('\n');
//	uint64 var = temp;
//	__asm__ volatile ("mv ra, %[savedPC]": : [savedPC] "r"(var));
//
//	__asm__ volatile ("sd ra, 8(sp)");
//}
//
//void dispatch() {
//	__asm__ volatile ("mv %[savedPC], ra":[savedPC] "=r"(temp));
//	__asm__ volatile("mv ra, %[fAddress]": : [fAddress] "r"(&f));
//}

int main() {
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
	//omoguci prekide
	//Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
//	uint64 i = 0;
//	for (; i < 10000; i++) {
//		void* ptr = mem_alloc(0xffffff);
//		if (ptr == nullptr) break;
//		if (mem_free(ptr) == -1) {
//			i = 11111111;
//		}
//	}
//	printInteger(i);

	List<uint64> lista;
	uint64 num = 10;
	lista.addFirst(&num);
	println("");
	printInteger(*lista.peekFirst());
	println("");
	/*
    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    scall();
    println("\nprosao ecall");
    //while (1) {}

    //maskiraj prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    */
	return 0;
}