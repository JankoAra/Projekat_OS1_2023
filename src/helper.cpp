#include "../h/helper.hpp"
#include "../lib/console.h"
#include "../h/Riscv.hpp"

void printString(char const *string) {
    uint64 oldMask = Riscv::r_sstatus() & Riscv::SSTATUS_SIE;
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0') {
        __putc(*string);
        string++;
    }
    Riscv::ms_sstatus(oldMask);
}

void println(char const *string) {
    uint64 oldMask = Riscv::r_sstatus() & Riscv::SSTATUS_SIE;
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    printString(string);
    __putc('\n');
    Riscv::ms_sstatus(oldMask);
}

void printInteger(uint64 integer) {
    uint64 oldMask = Riscv::r_sstatus() & Riscv::SSTATUS_SIE;
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
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
    Riscv::ms_sstatus(oldMask);
}
