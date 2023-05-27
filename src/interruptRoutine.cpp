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

extern "C" void interruptRoutine() {
	uint64 scause = Riscv::r_scause();
	uint64 sepc = Riscv::r_sepc();

	if (scause == 0x09 || scause == 0x08) {
		//prekid zbog poziva ecall
		uint64 opCode;
		__asm__ volatile("mv %[op], a0":[op] "=r"(opCode));

		switch (opCode) {
			case 0x01:
				//mem_alloc
				size_t size;
				__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
				MemoryAllocator::kmalloc(size);
				break;
			case 0x02:
				//mem_free
				void* ptr;
				__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
				break;
			case 0x11:
				//thread_create
				thread_t* handle;
				void (* function)(void*);
				void* args;
				uint64* sp;
				__asm__ volatile("mv %[sp], a4":[sp]"=r"(sp));
				__asm__ volatile("mv %[args], a3":[args]"=r"(args));
				__asm__ volatile("mv %[f], a2":[f]"=r"(function));
				__asm__ volatile("mv %[handle], a1":[handle]"=r"(handle));
				*handle = TCB::createThread(function, args, sp);
				if(*handle!=nullptr){
					__asm__ volatile("li a0, 0");
				}
				else{
					__asm__ volatile("li a0, -1");
				}
				break;
			case 0x12:
				//thread_exit
				break;
			case 0x13:
				//thread_dispatch
				break;
			case 0x14:
				//thread_join
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
				break;
			case 0x41:
				//getc
				break;
			case 0x42:
				//putc
				break;
			default:
				printString("Nepostojeci op code: ");
				printInteger(opCode);
				printString("\nscause: ");
				printInteger(scause);
				printString("\nsepc: ");
				printInteger(sepc);
				break;
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		Riscv::w_sepc(sepc + 4);
	} else if (scause == (1UL << 63 | 9)) {
		//spoljasnji hardverski prekid
		console_handler();
	} else if (scause == (1UL << 63 | 1)) {
		//prekid od tajmera
		Riscv::mc_sip(Riscv::SIP_SSIP);
	} else {
		println("Greska u prekidnoj rutini");
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
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