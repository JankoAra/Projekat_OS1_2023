//
// Created by os on 5/17/23.
//

#ifndef PROJEKAT2023_RISCV_HPP
#define PROJEKAT2023_RISCV_HPP

#include "../lib/hw.h"

class Riscv {
public:

	static void returnFromInterrupt();

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

};

inline void Riscv::ms_sip(uint64 mask) {
	__asm__ volatile("csrs sip, %[mask]": :[mask] "r"(mask));
}

inline void Riscv::mc_sip(uint64 mask) {
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
}

#endif //PROJEKAT2023_RISCV_HPP
