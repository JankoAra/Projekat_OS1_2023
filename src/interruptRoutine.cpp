//
// Created by os on 5/22/23.
//

#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"
#include "../h/Riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");

	if (scause == 0x09 || scause == 0x08) {
		//prekid zbog poziva ecall
		uint64 opCode = a0;
		switch (opCode) {
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
				MemoryAllocator::kmalloc(size);
				__asm__ volatile("sd a0, 80(s0)");
				break;
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
				__asm__ volatile("sd a0, 80(s0)");
				break;
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
				void (* function)(void*);
				function = (void (*)(void*))a2;
				void* args;
				args = (void*)a3;
				uint64* sp;
				sp = (uint64*)a4;

				*handle = TCB::createThread(function, args, sp);
				if (*handle != nullptr) {
					__asm__ volatile("li a0, 0");
				} else {
					__asm__ volatile("li a0, -1");
				}
				__asm__ volatile("sd a0, 80(s0)");
				break;
			case 0x12:
				//thread_exit
				TCB::running->setFinished(true);
				TCB::releaseJoined();
				TCB::yield();
				break;
			case 0x13:
				//thread_dispatch
				TCB::yield();
				break;
			case 0x14:
				//thread_join
				thread_t handleToJoin;
				handleToJoin = (thread_t)a1;
				TCB::threadJoin(handleToJoin);
				TCB::yield();
				break;
			case 0x21:
				//sem_open
				break;
			case 0x22:
				//sem_close
				break;
			case 0x23:
				//sem_wait
				break;
			case 0x24:
				//sem_signal
				break;
			case 0x31:
				//time_sleep
				time_t timerPeriods;
				timerPeriods = (time_t)a1;
				if (timerPeriods>0) {
					__asm__ volatile("li a0, 0");
				} else {
					__asm__ volatile("li a0, -1");
				}
				__asm__ volatile("sd a0, 80(s0)");
				if(timerPeriods>0) {
					Scheduler::putToSleep(TCB::running, timerPeriods);
					TCB::yield();
				}
				break;
			case 0x41:
				//getc
				break;
			case 0x42:
				//putc
				break;
			case 0x90:
				//printString
				const char* string;
				string = (const char*)a1;
				while (*string != '\0') {
					__putc(*string);
					string++;
				}
				break;
			case 0x91:
				//printInteger
				uint64 integer;
				integer = a1;
				static char digits[] = "0123456789";
				char buf[16];
				int i, neg;
				uint x;

				neg = 0;
				if (integer < 0) {
					neg = 1;
					x = -integer;
				} else {
					x = integer;
				}

				i = 0;
				do {
					buf[i++] = digits[x % 10];
				} while ((x /= 10) != 0);
				if (neg) buf[i++] = '-';

				while (--i >= 0) {
					__putc(buf[i]);
				}
				break;
			default:
//				printString("\nNepostojeci op code: ");
//				printInteger(opCode);
//				printString("\nscause: ");
//				printInteger(scause);
//				printString("\nsepc: ");
//				printInteger(sepc);
				break;
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
		//Riscv::w_sepc(sepc + 4);
	} else if (scause == (1UL << 63 | 9)) {
		//spoljasnji hardverski prekid (od konzole)
		console_handler();
	} else if (scause == (1UL << 63 | 1)) {
		//prekid od tajmera
		//printString("\nPrekid od tajmera\n");
		Scheduler::wake();
		TCB::runningTimeSlice++;
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
			//printString("\nMenjam kontekst\n");
			TCB::yield();
			TCB::runningTimeSlice = 0;
		}

		Riscv::w_sepc(sepc);
		Riscv::w_sstatus(sstatus);
		Riscv::mc_sip(Riscv::SIP_SSIP);
	} else {
//		println("\nGreska u prekidnoj rutini");
//		printString("scause: ");
//		printInteger(scause);
//		printString("\nsepc: ");
//		printInteger(sepc);
	}
}

//stara verzija
//extern "C" void interruptRoutine() {
//	uint64 scause = Riscv::r_scause();
//
//	static uint64 timerCount = 0;
//	if (scause == (0x01UL << 63 | 0x01)) {
//		//prekid od tajmera
//		timerCount++;
//		if (timerCount >= 20) {
//			println("tajmer");
//			timerCount = 0;
//		}
//		Riscv::mc_sip(Riscv::SIP_SSIP); //ocisti softverski zahtev za prekid (tajmer)
//	} else if (scause == 0x09) {
//		println("ecall iz sistema");
//		uint64 sepc = Riscv::r_sepc();
//		printString("Vrednost sepc pre promene: ");
//		printInteger(sepc);
//		println("");
//		Riscv::w_sepc(Riscv::r_sepc() + 4);
//		sepc = Riscv::r_sepc();
//		printString("\nVrednost sepc posle promene: ");
//		printInteger(sepc);
//		println("");
//	}
////    else if(scause == (0x01UL<<63 | 0x09)){
////        //spoljasnji hardverski prekid
////        println("Spoljasnji hardverski prekid");
////        Riscv::mc_sip(Riscv::SIP_SEIP);
////    }
//	printInteger(Riscv::r_sip());
//	println("");
//	console_handler();
//	Riscv::mc_sip(Riscv::SIP_SEIP);
////    else{
////        Test::println(text);
////        __asm__ volatile ("csrc sip, 0x02");
////    }
//
//}