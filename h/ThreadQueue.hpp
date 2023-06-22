//
// Created by os on 6/4/23.
//

#ifndef PROJEKAT2023_THREADQUEUE_HPP
#define PROJEKAT2023_THREADQUEUE_HPP

#include "../visak/MemoryAllocator.hpp"
#include "../h/syscall_c.hpp"

class TCB;

class ThreadQueue {
private:
    struct Node {
        TCB *data;
        Node *next;

        Node(TCB *d) : data(d), next(nullptr) {}

        static void *operator new(size_t size) {
            return mem_alloc(size);
        }

        static void operator delete(void *ptr) {
            mem_free(ptr);
        }
    };

    Node *front;
    Node *back;

public:
    ThreadQueue() : front(nullptr), back(nullptr) {}

    ThreadQueue(const ThreadQueue &) = delete;

    ThreadQueue &operator=(const ThreadQueue &) = delete;

    ~ThreadQueue() {
        while (!isEmpty()) {
            Node *node = front;
            front = front->next;
            delete node;
        }
    }

    bool isEmpty() const {
        bool ret = front == nullptr;
        return ret;
    }

    void putLast(TCB *tcb);

    TCB *getFirst();

    static void *operator new(size_t size) {
        return mem_alloc(size);
    }

    static void operator delete(void *ptr) {
        mem_free(ptr);
    }
};


#endif //PROJEKAT2023_THREADQUEUE_HPP
