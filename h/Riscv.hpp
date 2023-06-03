//
// Created by os on 5/17/23.
//

#ifndef PROJEKAT2023_RISCV_HPP
#define PROJEKAT2023_RISCV_HPP

#include "../lib/hw.h"

class Riscv {
public:

	static void popSppSpie();

	//stavljanje registara x3-x31 na stek
	static void pushRegisters();    //implementacija u asm

	//skidanje registara x3-x31 sa steka
	static void popRegisters();     //implementacija u asm

	//read scause
	static uint64 r_scause();

	//write scause
	static void w_scause(uint64 scause);

	//read sepc
	static uint64 r_sepc();

	//write sepc
	static void w_sepc(uint64 sepc);

	//read stvec
	static uint64 r_stvec();

	//write stvec
	static void w_stvec(uint64 stvec);

	enum BitMaskSip {
		//postoji zahtev za softverski prekid
		SIP_SSIP = (1 << 1),
		//postoji prekid od tajmera
		SIP_STIP = (1 << 5),
		//postoji zahtev za spoljasnji hardverski prekid
		SIP_SEIP = (1 << 9)
	};

	//mask set sip
	static void ms_sip(uint64 mask);

	//mask clear sip
	static void mc_sip(uint64 mask);

	//read sip
	static uint64 r_sip();

	//write sip
	static void w_sip(uint64 sip);

	//kada se pozove sret, SIE dobija vrednost SPIE, SPIE se postavlja na 1,
	//rezim se postavlja na osnovu SPP bita, SPP se postavlja na 0
	enum BitMaskSstatus {
		//1 - dozvoljeni prekidi; 0- nedozvoljeni prekidi; igonrise se u korisnickom rezimu
		SSTATUS_SIE = (1 << 1),
		//prethodna vrednost bita SIE
		SSTATUS_SPIE = (1 << 5),
		//iz kog rezima se desio skok; 0 - iz korisnickog; 1 - iz sistemskog
		SSTATUS_SPP = (1 << 8)
	};

	//mask set sstatus
	static void ms_sstatus(uint64 mask);

	//mask clear sstatus
	static void mc_sstatus(uint64 mask);

	//read sstatus
	static uint64 r_sstatus();

	//write sstatus
	static void w_sstatus(uint64 sstatus);

	//upisuje kod sistemskog poziva u registar a0
	static void loadOpCode(uint64 opCode);

};

inline uint64 Riscv::r_scause() {
	uint64 volatile scause;
	__asm__ volatile("csrr %[scause], scause": [scause] "=r"(scause));
	return scause;
}

inline void Riscv::w_scause(uint64 scause) {
	__asm__ volatile("csrw scause, %[scause]": :[scause] "r"(scause));
}

inline uint64 Riscv::r_sepc() {
	uint64 volatile sepc;
	__asm__ volatile("csrr %[sepc], sepc": [sepc] "=r"(sepc));
	return sepc;
}

inline void Riscv::w_sepc(uint64 sepc) {
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
}

inline uint64 Riscv::r_stvec() {
	uint64 volatile stvec;
	__asm__ volatile("csrr %[stvec], stvec": [stvec] "=r"(stvec));
	return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
}

inline void Riscv::ms_sip(uint64 mask) {
	__asm__ volatile("csrs sip, %[mask]": :[mask] "r"(mask));
}

inline void Riscv::mc_sip(uint64 mask) {
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
}

inline uint64 Riscv::r_sip() {
	uint64 volatile sip;
	__asm__ volatile("csrr %[sip], sip": [sip] "=r"(sip));
	return sip;
}

inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
	uint64 volatile sstatus;
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
	return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus) {
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
}

inline void Riscv::loadOpCode(uint64 opCode) {
	__asm__ volatile("mv a0, %[code]": :[code] "r"(opCode));
}



#endif //PROJEKAT2023_RISCV_HPP
