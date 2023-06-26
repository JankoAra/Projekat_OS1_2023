//
// Created by os on 6/7/23.
//

#include "../h/KConsole.hpp"
#include "../h/syscall_c.hpp"

bool KConsole::initialized = false;
sem_t KConsole::inputBufferHasSpace = nullptr;
sem_t KConsole::outputBufferHasSpace = nullptr;
sem_t KConsole::charsToOutput = nullptr;
sem_t KConsole::charsToInput = nullptr;
char* KConsole::dr = nullptr;
uint8* KConsole::sr = nullptr;
int KConsole::inputHead = 0;
int KConsole::outputHead = 0;
int KConsole::outputTail = 0;
int KConsole::inputTail = 0;
int KConsole::inputBufferSize = 0;
char KConsole::inputBuffer[];
char KConsole::outputBuffer[];

void KConsole::initKConsole() {
	if (initialized) return;
	dr = (char*)CONSOLE_RX_DATA;
	sr = (uint8*)CONSOLE_STATUS;
	sem_open(&inputBufferHasSpace, capacity);
	sem_open(&outputBufferHasSpace, capacity);
	sem_open(&charsToInput, 0);
	sem_open(&charsToOutput, 0);
	initialized = true;
}

char KConsole::getFromOutput() {
	sem_wait(charsToOutput);
	char c = outputBuffer[outputHead];
	outputHead = (outputHead + 1) % capacity;
	return c;
}

void KConsole::placeInInput(char c) {
	if (inputBufferSize == capacity) return;
	inputBuffer[inputTail] = c;
	inputTail = (inputTail + 1) % capacity;
	inputBufferSize++;
	sem_signal(charsToInput);
}

void KConsole::kputc(char c) {
	sem_wait(outputBufferHasSpace);
	outputBuffer[outputTail] = c;
	outputTail = (outputTail + 1) % capacity;
	sem_signal(charsToOutput);
}

char KConsole::kgetc() {
	sem_wait(charsToInput);
	char c = inputBuffer[inputHead];
	inputHead = (inputHead + 1) % capacity;
	inputBufferSize--;
	return c;
}


