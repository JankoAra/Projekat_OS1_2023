#include "../h/helper.hpp"
#include "../lib/console.h"
#include "../h/Riscv.hpp"

void printString(char const *string) {
    while (*string != '\0') {
        __putc(*string);
        string++;
    }
}

void println(char const *string) {
    printString(string);
    __putc('\n');
}

void printInteger(uint64 integer) {
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
}
