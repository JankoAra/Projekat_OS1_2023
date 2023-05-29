//
// Created by os on 5/29/23.
//
#include "../h/syscall_cpp.hpp"

//override globalnog new
void* operator new(size_t size) {
	return mem_alloc(size);
}

void* operator new[](size_t size) {
	return mem_alloc(size);
}

void operator delete(void* ptr)noexcept {
mem_free(ptr);
}

void operator delete[](void* ptr)noexcept {
mem_free(ptr);
}