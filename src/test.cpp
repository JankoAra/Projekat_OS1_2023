#include "../lib/console.h"
#include "../lib/hw.h"
//using namespace aj210328;
/*
uint64 temp;
void f(){
    __putc('a');
    __putc('\n');
    uint64 var = temp;
    __asm__ volatile ("mv ra, %[savedPC]": : [savedPC] "r" (var));

    __asm__ volatile ("sd ra, 8(sp)");
}

void dispatch(){
    __asm__ volatile ("mv %[savedPC], ra":[savedPC] "=r" (temp));
    __asm__ volatile("mv ra, %[fAddress]": : [fAddress] "r" (&f));
}
int main2(){
    char c = __getc();
    c = inc(c);
    __putc(c);
    __putc(inc(c));

    //aj210328::MemoryAllocator ma;
    dispatch();
    return 0;
}
*/