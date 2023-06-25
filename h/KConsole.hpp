//
// Created by os on 6/7/23.
//

#ifndef PROJEKAT2023_KCONSOLE_HPP
#define PROJEKAT2023_KCONSOLE_HPP

#include "../lib/hw.h"
#include "../h/syscall_c.hpp"
#include "../test/printing.hpp"
#include "../visak/helper.hpp"

class KConsole {
public:
    static void initKConsole();

    //stavlja karakter u izlazni bafer konzole
    static void kputc(char c);

    //uzima karakter iz ulaznog bafera konzole
    static char kgetc();

    //vraca karakter iz izlaznog bafera; ako je bafer prazan, blokira se dok se ne napuni
    static char getFromOutput();

    //stavlja karakter u ulazni bafer; ako je bafer pun, ignorise se
    static void placeInInput(char c);

    //ispis svih preostalih karaktera u izlaznom baferu
    static void flush(){
        __asm__ volatile("li a0, 0x43");
        __asm__ volatile("ecall");
    }

    static uint8 getSRvalue() { return *sr; }

    static uint8 getDRvalue() { return *dr; }

    static void setDRvalue(char c) { *dr = c; }

    static sem_t getOutputBufferHasSpace() { return outputBufferHasSpace; }

    static int getOutputHead() { return outputHead; }

    static int getOutputTail() { return outputTail; }


private:
    KConsole() {}

    //broj preostalih mesta u ulaznom baferu
    static sem_t inputBufferHasSpace;

    //broj preostalih mesta u izlaznom baferu
    static sem_t outputBufferHasSpace;

    //broj zauzetih mesta u ulaznom baferu
    static sem_t charsToInput;

    //broj zauzetih mesta u izlaznom baferu
    static sem_t charsToOutput;

    //adresa registra podataka konzole
    static char* dr;

    //adresa statusnog registra konzole
    static uint8* sr;

    static bool initialized;

    //velicina internih bafera
    static constexpr int capacity = 100;

    //bafer u koji se smestaju upisani otkucani karakteri
    static char inputBuffer[capacity];

    //bafer u koji se smestaju karakteri koji treba da se ispisu na konzoli
    static char outputBuffer[capacity];

    //indeksi u kruznim baferima
    static int inputHead;
    static int inputTail;
    static int outputHead;
    static int outputTail;

    //broj zauzetih mesta u ulaznom baferu
    static int inputBufferSize;
};


#endif //PROJEKAT2023_KCONSOLE_HPP
