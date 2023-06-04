//
// Created by os on 6/4/23.
//

#include "../h/ThreadQueue.hpp"

void ThreadQueue::putLast(TCB* tcb) {
	Node* newNode = new Node(tcb);

	if (isEmpty()) {
		front = back = newNode;
	} else {
		back->next = newNode;
		back = newNode;
	}
}

TCB* ThreadQueue::getFirst() {
	if (isEmpty()) {
		return nullptr;
	}

	Node* node = front;
	TCB* tcb = node->data;
	front = front->next;

	if (front == nullptr) {
		back = nullptr;
	}

	delete node;
	return tcb;
}