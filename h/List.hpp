#ifndef LIST_HPP
#define LIST_HPP

#include "../h/MemoryAllocator.hpp"
#include "../lib/hw.h"

template<typename T>
class List {
private:
	struct Elem {
		T* data;
		Elem* next;

		Elem(T* data, Elem* next) : data(data), next(next) {}
	};

	Elem* head, * tail;
	uint64 numOfElements;
public:
	List() : head(nullptr), tail(nullptr), numOfElements(0) {}

	List(const List<T>&) = delete;

	List<T>& operator=(const List<T>&) = delete;

	uint64 getNumOfElems() { return numOfElements; }

	void addFirst(T* data) {
		Elem* elem = new Elem(data, head);
		head = elem;
		if (!tail) { tail = head; }
		numOfElements++;
	}

	void addLast(T* data) {
		Elem* elem = new Elem(data, nullptr);
		if (tail) {
			tail->next = elem;
			tail = elem;
		} else {
			head = tail = elem;
		}
		numOfElements++;
	}

	T* removeFirst() {
		if (!head) { return nullptr; }

		Elem* elem = head;
		head = head->next;
		if (!head) { tail = nullptr; }

		T* ret = elem->data;
		delete elem;
		numOfElements--;
		return ret;
	}

	T* peekFirst() {
		if (!head) { return nullptr; }
		return head->data;
	}

	T* removeLast() {
		if (!head) { return nullptr; }

		Elem* prev = nullptr;
		for (Elem* curr = head; curr && curr != tail; curr = curr->next)
			prev = curr;

		Elem* elem = tail;
		if (prev) { prev->next = nullptr; }
		else { head = nullptr; }
		tail = prev;

		T* ret = elem->data;
		delete elem;
		numOfElements--;
		return ret;
	}

	T* peekLast() {
		if (!tail) { return nullptr; }
		return tail->data;
	}

	static void* operator new(size_t size) {
		return MemoryAllocator::kmalloc(size);
	}

	static void* operator new[](size_t size) {
		return MemoryAllocator::kmalloc(size);
	}

	static void operator delete(void* ptr) {
		MemoryAllocator::kfree(ptr);
	}

	static void operator delete[](void* ptr) {
		MemoryAllocator::kfree(ptr);
	}

};

#endif