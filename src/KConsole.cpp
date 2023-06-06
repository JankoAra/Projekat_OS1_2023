//
// Created by os on 6/7/23.
//

#include "../h/KConsole.hpp"

bool KConsole::initialized = false;
sem_t KConsole::inputSem = nullptr;
sem_t KConsole::outputSem = nullptr;
char* KConsole::dr = nullptr;
uint8* KConsole::sr = nullptr;

void KConsole::initKConsole() {
	if(initialized) return;
	dr = (char*)CONSOLE_RX_DATA;
	sr = (uint8*)CONSOLE_STATUS;
	sem_open(&inputSem, 100);
	sem_open(&outputSem, 0);
	initialized = true;
}

void KConsole::printConsoleState() {
	printString("CONSOLE_RX = ");
	printInteger((uint64)dr);
	printString("\n");
	printString("CONSOLE_STATUS = ");
	printInteger((uint64)sr);
	printString("\n");
	printString("*CONSOLE_RX = ");
	printInteger(*dr);
	printString("\n");
	printString("*CONSOLE_STATUS = ");
	printInteger(*sr);
	printString("\n");
}
