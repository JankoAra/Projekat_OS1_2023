#pragma once

typedef unsigned int   uint;
typedef unsigned short ushort;
typedef unsigned char  uchar;

typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int  uint32;
typedef unsigned long uint64;

typedef uint64 size_t;
typedef uint64 time_t;

static const size_t DEFAULT_STACK_SIZE = 4096;
static const size_t DEFAULT_TIME_SLICE = 2;

extern const void* HEAP_START_ADDR;
extern const void* HEAP_END_ADDR;

static const size_t MEM_BLOCK_SIZE = 64;

//registri sirine 8 bita
extern const uint64 CONSOLE_STATUS;	//adresa statusnog registra 0x1000 0005
extern const uint64 CONSOLE_TX_DATA;	//adresa tx data registra 0x1000 0000
extern const uint64 CONSOLE_RX_DATA;	//adresa rx data registra 0x1000 0000

static const uint64 CONSOLE_IRQ = 10;
static const uint64 CONSOLE_TX_STATUS_BIT = 1 << 5;	//kontroler konzole moze da primi podatak koji ce poslati na konzolu
static const uint64 CONSOLE_RX_STATUS_BIT = 1;	//moze se procitati podatak pristigao od konzole

#ifdef __cplusplus
extern "C" {
#endif

    int plic_claim(void);

    void plic_complete(int irq);

#ifdef __cplusplus
}
#endif
