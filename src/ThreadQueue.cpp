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

int ThreadQueue::remove(TCB* tcb) {
    if (front == nullptr) return -1;
    Node* prev, * curr;
    for (prev = nullptr, curr = front; curr->data != tcb; prev = curr, curr = curr->next);
    if (curr->data != tcb) return -1;
    if (!prev) {
        front = curr->next;
    } else {
        prev->next = curr->next;
    }
    if (curr == back) {
        back = prev;
    }
    delete curr;
    return 0;
}
