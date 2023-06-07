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

	static char getFromOutput();

	static void placeInInput(char c);



//private:
	static sem_t inputBufferHasSpace;
	static sem_t outputBufferHasSpace;
	static sem_t charsToOutput;
	static sem_t charsToInput;
	static char* dr;
	static uint8* sr;
	static bool initialized;
	static constexpr int capacity = 50;
	static char inputBuffer[capacity];
	static char outputBuffer[capacity];
	static int inputHead;
	static int inputTail;
	static int outputHead;
	static int outputTail;
	static int inputBufferSize;
};


#endif //PROJEKAT2023_KCONSOLE_HPP
