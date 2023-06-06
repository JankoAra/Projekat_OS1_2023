//
// Created by os on 6/7/23.
//

#ifndef PROJEKAT2023_KCONSOLE_HPP
#define PROJEKAT2023_KCONSOLE_HPP
#include "../lib/hw.h"
#include "../h/syscall_c.hpp"
#include "../test/printing.hpp"
#include "../h/helper.hpp"

class KConsole {
public:
	static void kputc(char c);
	static char kgetc();
	KConsole(){
		printString("CONSOLE_RX = ");
		printInteger(CONSOLE_RX_DATA);
		printString("\n");
		printString("CONSOLE_TX = ");
		printInteger(CONSOLE_TX_DATA);
		printString("\n");
		printString("CONSOLE_STATUS = ");
		printInteger(CONSOLE_STATUS);
		printString("\n");
		printString("*CONSOLE_RX = ");
		printInteger(*((uint8*)CONSOLE_RX_DATA));
		printString("\n");
		printString("*CONSOLE_STATUS = ");
		printInteger(*((uint8*)CONSOLE_STATUS));
		printString("\n");
	}

	static void initKConsole();

	static void printConsoleState();

//private:
	static sem_t inputSem;
	static sem_t outputSem;
	static char* dr;
	static uint8* sr;
	static bool initialized;
};


#endif //PROJEKAT2023_KCONSOLE_HPP
