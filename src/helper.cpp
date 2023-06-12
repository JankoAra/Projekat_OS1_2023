#include "../h/helper.hpp"
//#include "../lib/console.h"
#include "../h/Riscv.hpp"
#include "../h/syscall_c.hpp"

//void printString(char const* string) {
//
//	//stavljanje argumenata za sistemski poziv
//	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(string):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//	__asm__ volatile("li a0, 0x90");
//
//	__asm__ volatile("ecall");
//
//
//}

//void println(char const *string) {
//    printString(string);
//    __putc('\n');
//}

void printInteger(uint64 integer) {
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[i]": :[i] "r"(integer):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
	__asm__ volatile("li a0, 0x91");

	__asm__ volatile("ecall");
}

void kPrintInt(uint64 integer){
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
        putc(buf[i]);
    }
}
