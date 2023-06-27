
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	0a013103          	ld	sp,160(sp) # 8000d0a0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	351070ef          	jal	ra,80007b6c <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <interruptHandler>:
.extern interruptRoutine  #deklaracija imena interruptRoutine definisanog negde drugde
.align 4    #poravnanje adrese na 4 bajta, poslednja dva bita adrese su 00
.global interruptHandler #izvozi globalno ime interruptHandler
interruptHandler:
    #cuvanje svih registara na steku running niti
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001004:	00013023          	sd	zero,0(sp)
    80001008:	00113423          	sd	ra,8(sp)
    8000100c:	00213823          	sd	sp,16(sp)
    80001010:	00313c23          	sd	gp,24(sp)
    80001014:	02413023          	sd	tp,32(sp)
    80001018:	02513423          	sd	t0,40(sp)
    8000101c:	02613823          	sd	t1,48(sp)
    80001020:	02713c23          	sd	t2,56(sp)
    80001024:	04813023          	sd	s0,64(sp)
    80001028:	04913423          	sd	s1,72(sp)
    8000102c:	04a13823          	sd	a0,80(sp)
    80001030:	04b13c23          	sd	a1,88(sp)
    80001034:	06c13023          	sd	a2,96(sp)
    80001038:	06d13423          	sd	a3,104(sp)
    8000103c:	06e13823          	sd	a4,112(sp)
    80001040:	06f13c23          	sd	a5,120(sp)
    80001044:	09013023          	sd	a6,128(sp)
    80001048:	09113423          	sd	a7,136(sp)
    8000104c:	09213823          	sd	s2,144(sp)
    80001050:	09313c23          	sd	s3,152(sp)
    80001054:	0b413023          	sd	s4,160(sp)
    80001058:	0b513423          	sd	s5,168(sp)
    8000105c:	0b613823          	sd	s6,176(sp)
    80001060:	0b713c23          	sd	s7,184(sp)
    80001064:	0d813023          	sd	s8,192(sp)
    80001068:	0d913423          	sd	s9,200(sp)
    8000106c:	0da13823          	sd	s10,208(sp)
    80001070:	0db13c23          	sd	s11,216(sp)
    80001074:	0fc13023          	sd	t3,224(sp)
    80001078:	0fd13423          	sd	t4,232(sp)
    8000107c:	0fe13823          	sd	t5,240(sp)
    80001080:	0ff13c23          	sd	t6,248(sp)

    call interruptRoutine
    80001084:	6d0010ef          	jal	ra,80002754 <interruptRoutine>

    #ucitavanje svih registara iz running niti (moze biti druga nit od one koja je sacuvana pre call)
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    80001088:	00013003          	ld	zero,0(sp)
    8000108c:	00813083          	ld	ra,8(sp)
    80001090:	01013103          	ld	sp,16(sp)
    80001094:	01813183          	ld	gp,24(sp)
    80001098:	02013203          	ld	tp,32(sp)
    8000109c:	02813283          	ld	t0,40(sp)
    800010a0:	03013303          	ld	t1,48(sp)
    800010a4:	03813383          	ld	t2,56(sp)
    800010a8:	04013403          	ld	s0,64(sp)
    800010ac:	04813483          	ld	s1,72(sp)
    800010b0:	05013503          	ld	a0,80(sp)
    800010b4:	05813583          	ld	a1,88(sp)
    800010b8:	06013603          	ld	a2,96(sp)
    800010bc:	06813683          	ld	a3,104(sp)
    800010c0:	07013703          	ld	a4,112(sp)
    800010c4:	07813783          	ld	a5,120(sp)
    800010c8:	08013803          	ld	a6,128(sp)
    800010cc:	08813883          	ld	a7,136(sp)
    800010d0:	09013903          	ld	s2,144(sp)
    800010d4:	09813983          	ld	s3,152(sp)
    800010d8:	0a013a03          	ld	s4,160(sp)
    800010dc:	0a813a83          	ld	s5,168(sp)
    800010e0:	0b013b03          	ld	s6,176(sp)
    800010e4:	0b813b83          	ld	s7,184(sp)
    800010e8:	0c013c03          	ld	s8,192(sp)
    800010ec:	0c813c83          	ld	s9,200(sp)
    800010f0:	0d013d03          	ld	s10,208(sp)
    800010f4:	0d813d83          	ld	s11,216(sp)
    800010f8:	0e013e03          	ld	t3,224(sp)
    800010fc:	0e813e83          	ld	t4,232(sp)
    80001100:	0f013f03          	ld	t5,240(sp)
    80001104:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001108:	10010113          	addi	sp,sp,256

    8000110c:	10200073          	sret

0000000080001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
	# sp stare niti pokazuje na sacuvane podatke iz dispatch(ra,s0,s1),
	# iznad toga su registri x3-x31 sacuvani u yield-u i ra,s0 iz yielda

	# sp nove niti pokazuje na sacuvane podatke iz dispatch-a i yield-a ako se nit nekad izvrsavala,
	# odnosno adresu vrha steka alociranog za novu nit ako nije
	sd ra, 0 * 8(a0)
    80001110:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
	sd sp, 1 * 8(a0)
    80001114:	00253423          	sd	sp,8(a0)

	ld ra, 0 * 8(a1)
    80001118:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000111c:	0085b103          	ld	sp,8(a1)

    80001120:	00008067          	ret

0000000080001124 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001124:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001128:	00b29a63          	bne	t0,a1,8000113c <fail>
    sc.w t0, a2, (a0)      # Try to update.
    8000112c:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001130:	fe029ae3          	bnez	t0,80001124 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001134:	00000513          	li	a0,0
    jr ra                  # Return.
    80001138:	00008067          	ret

000000008000113c <fail>:
    fail:
    li a0, 1               # Set return to failure.
    8000113c:	00100513          	li	a0,1
    80001140:	00008067          	ret

0000000080001144 <_ZN5Riscv13pushRegistersEv>:
.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function
_ZN5Riscv13pushRegistersEv:
    addi sp, sp, -256
    80001144:	f0010113          	addi	sp,sp,-256
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001148:	00313c23          	sd	gp,24(sp)
    8000114c:	02413023          	sd	tp,32(sp)
    80001150:	02513423          	sd	t0,40(sp)
    80001154:	02613823          	sd	t1,48(sp)
    80001158:	02713c23          	sd	t2,56(sp)
    8000115c:	04813023          	sd	s0,64(sp)
    80001160:	04913423          	sd	s1,72(sp)
    80001164:	04a13823          	sd	a0,80(sp)
    80001168:	04b13c23          	sd	a1,88(sp)
    8000116c:	06c13023          	sd	a2,96(sp)
    80001170:	06d13423          	sd	a3,104(sp)
    80001174:	06e13823          	sd	a4,112(sp)
    80001178:	06f13c23          	sd	a5,120(sp)
    8000117c:	09013023          	sd	a6,128(sp)
    80001180:	09113423          	sd	a7,136(sp)
    80001184:	09213823          	sd	s2,144(sp)
    80001188:	09313c23          	sd	s3,152(sp)
    8000118c:	0b413023          	sd	s4,160(sp)
    80001190:	0b513423          	sd	s5,168(sp)
    80001194:	0b613823          	sd	s6,176(sp)
    80001198:	0b713c23          	sd	s7,184(sp)
    8000119c:	0d813023          	sd	s8,192(sp)
    800011a0:	0d913423          	sd	s9,200(sp)
    800011a4:	0da13823          	sd	s10,208(sp)
    800011a8:	0db13c23          	sd	s11,216(sp)
    800011ac:	0fc13023          	sd	t3,224(sp)
    800011b0:	0fd13423          	sd	t4,232(sp)
    800011b4:	0fe13823          	sd	t5,240(sp)
    800011b8:	0ff13c23          	sd	t6,248(sp)
    ret
    800011bc:	00008067          	ret

00000000800011c0 <_ZN5Riscv12popRegistersEv>:
.global _ZN5Riscv12popRegistersEv
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011c0:	01813183          	ld	gp,24(sp)
    800011c4:	02013203          	ld	tp,32(sp)
    800011c8:	02813283          	ld	t0,40(sp)
    800011cc:	03013303          	ld	t1,48(sp)
    800011d0:	03813383          	ld	t2,56(sp)
    800011d4:	04013403          	ld	s0,64(sp)
    800011d8:	04813483          	ld	s1,72(sp)
    800011dc:	05013503          	ld	a0,80(sp)
    800011e0:	05813583          	ld	a1,88(sp)
    800011e4:	06013603          	ld	a2,96(sp)
    800011e8:	06813683          	ld	a3,104(sp)
    800011ec:	07013703          	ld	a4,112(sp)
    800011f0:	07813783          	ld	a5,120(sp)
    800011f4:	08013803          	ld	a6,128(sp)
    800011f8:	08813883          	ld	a7,136(sp)
    800011fc:	09013903          	ld	s2,144(sp)
    80001200:	09813983          	ld	s3,152(sp)
    80001204:	0a013a03          	ld	s4,160(sp)
    80001208:	0a813a83          	ld	s5,168(sp)
    8000120c:	0b013b03          	ld	s6,176(sp)
    80001210:	0b813b83          	ld	s7,184(sp)
    80001214:	0c013c03          	ld	s8,192(sp)
    80001218:	0c813c83          	ld	s9,200(sp)
    8000121c:	0d013d03          	ld	s10,208(sp)
    80001220:	0d813d83          	ld	s11,216(sp)
    80001224:	0e013e03          	ld	t3,224(sp)
    80001228:	0e813e83          	ld	t4,232(sp)
    8000122c:	0f013f03          	ld	t5,240(sp)
    80001230:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001234:	10010113          	addi	sp,sp,256
    80001238:	00008067          	ret

000000008000123c <_ZN11ThreadQueue7putLastEP3TCB>:
// Created by os on 6/4/23.
//

#include "../h/ThreadQueue.hpp"

void ThreadQueue::putLast(TCB* tcb) {
    8000123c:	fe010113          	addi	sp,sp,-32
    80001240:	00113c23          	sd	ra,24(sp)
    80001244:	00813823          	sd	s0,16(sp)
    80001248:	00913423          	sd	s1,8(sp)
    8000124c:	01213023          	sd	s2,0(sp)
    80001250:	02010413          	addi	s0,sp,32
    80001254:	00050493          	mv	s1,a0
    80001258:	00058913          	mv	s2,a1
        Node* next;

        Node(TCB* d) : data(d), next(nullptr) {}

        static void* operator new(size_t size) {
            return mem_alloc(size);
    8000125c:	01000513          	li	a0,16
    80001260:	00000097          	auipc	ra,0x0
    80001264:	134080e7          	jalr	308(ra) # 80001394 <_Z9mem_allocm>
        Node(TCB* d) : data(d), next(nullptr) {}
    80001268:	01253023          	sd	s2,0(a0)
    8000126c:	00053423          	sd	zero,8(a0)
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    80001270:	0004b783          	ld	a5,0(s1)
    Node* newNode = new Node(tcb);
    if (isEmpty()) {
    80001274:	02078463          	beqz	a5,8000129c <_ZN11ThreadQueue7putLastEP3TCB+0x60>
        front = back = newNode;
    } else {
        back->next = newNode;
    80001278:	0084b783          	ld	a5,8(s1)
    8000127c:	00a7b423          	sd	a0,8(a5)
        back = newNode;
    80001280:	00a4b423          	sd	a0,8(s1)
    }
}
    80001284:	01813083          	ld	ra,24(sp)
    80001288:	01013403          	ld	s0,16(sp)
    8000128c:	00813483          	ld	s1,8(sp)
    80001290:	00013903          	ld	s2,0(sp)
    80001294:	02010113          	addi	sp,sp,32
    80001298:	00008067          	ret
        front = back = newNode;
    8000129c:	00a4b423          	sd	a0,8(s1)
    800012a0:	00a4b023          	sd	a0,0(s1)
    800012a4:	fe1ff06f          	j	80001284 <_ZN11ThreadQueue7putLastEP3TCB+0x48>

00000000800012a8 <_ZN11ThreadQueue8getFirstEv>:

TCB* ThreadQueue::getFirst() {
    800012a8:	fe010113          	addi	sp,sp,-32
    800012ac:	00113c23          	sd	ra,24(sp)
    800012b0:	00813823          	sd	s0,16(sp)
    800012b4:	00913423          	sd	s1,8(sp)
    800012b8:	02010413          	addi	s0,sp,32
    800012bc:	00050793          	mv	a5,a0
    800012c0:	00053503          	ld	a0,0(a0)
    if (isEmpty()) {
    800012c4:	02050e63          	beqz	a0,80001300 <_ZN11ThreadQueue8getFirstEv+0x58>
        return nullptr;
    }
    Node* node = front;
    TCB* tcb = node->data;
    800012c8:	00053483          	ld	s1,0(a0)
    front = front->next;
    800012cc:	00853703          	ld	a4,8(a0)
    800012d0:	00e7b023          	sd	a4,0(a5)
    if (front == nullptr) {
    800012d4:	02070263          	beqz	a4,800012f8 <_ZN11ThreadQueue8getFirstEv+0x50>
            mem_free(ptr);
    800012d8:	00000097          	auipc	ra,0x0
    800012dc:	0fc080e7          	jalr	252(ra) # 800013d4 <_Z8mem_freePv>
        back = nullptr;
    }
    delete node;
    return tcb;
}
    800012e0:	00048513          	mv	a0,s1
    800012e4:	01813083          	ld	ra,24(sp)
    800012e8:	01013403          	ld	s0,16(sp)
    800012ec:	00813483          	ld	s1,8(sp)
    800012f0:	02010113          	addi	sp,sp,32
    800012f4:	00008067          	ret
        back = nullptr;
    800012f8:	0007b423          	sd	zero,8(a5)
    800012fc:	fddff06f          	j	800012d8 <_ZN11ThreadQueue8getFirstEv+0x30>
        return nullptr;
    80001300:	00050493          	mv	s1,a0
    80001304:	fddff06f          	j	800012e0 <_ZN11ThreadQueue8getFirstEv+0x38>

0000000080001308 <_ZN11ThreadQueue6removeEP3TCB>:

int ThreadQueue::remove(TCB* tcb) {
    80001308:	00050693          	mv	a3,a0
    if (front == nullptr) return -1;
    8000130c:	00053503          	ld	a0,0(a0)
    80001310:	06050a63          	beqz	a0,80001384 <_ZN11ThreadQueue6removeEP3TCB+0x7c>
    Node* prev, * curr;
    for (prev = nullptr, curr = front; curr->data != tcb; prev = curr, curr = curr->next);
    80001314:	00000713          	li	a4,0
    80001318:	00053783          	ld	a5,0(a0)
    8000131c:	00b78863          	beq	a5,a1,8000132c <_ZN11ThreadQueue6removeEP3TCB+0x24>
    80001320:	00050713          	mv	a4,a0
    80001324:	00853503          	ld	a0,8(a0)
    80001328:	ff1ff06f          	j	80001318 <_ZN11ThreadQueue6removeEP3TCB+0x10>
    if (curr->data != tcb) return -1;
    if (!prev) {
    8000132c:	04070263          	beqz	a4,80001370 <_ZN11ThreadQueue6removeEP3TCB+0x68>
        front = curr->next;
    } else {
        prev->next = curr->next;
    80001330:	00853783          	ld	a5,8(a0)
    80001334:	00f73423          	sd	a5,8(a4)
    }
    if (curr == back) {
    80001338:	0086b783          	ld	a5,8(a3)
    8000133c:	04a78063          	beq	a5,a0,8000137c <_ZN11ThreadQueue6removeEP3TCB+0x74>
        back = prev;
    }
    delete curr;
    80001340:	04050663          	beqz	a0,8000138c <_ZN11ThreadQueue6removeEP3TCB+0x84>
int ThreadQueue::remove(TCB* tcb) {
    80001344:	ff010113          	addi	sp,sp,-16
    80001348:	00113423          	sd	ra,8(sp)
    8000134c:	00813023          	sd	s0,0(sp)
    80001350:	01010413          	addi	s0,sp,16
    80001354:	00000097          	auipc	ra,0x0
    80001358:	080080e7          	jalr	128(ra) # 800013d4 <_Z8mem_freePv>
    return 0;
    8000135c:	00000513          	li	a0,0
}
    80001360:	00813083          	ld	ra,8(sp)
    80001364:	00013403          	ld	s0,0(sp)
    80001368:	01010113          	addi	sp,sp,16
    8000136c:	00008067          	ret
        front = curr->next;
    80001370:	00853783          	ld	a5,8(a0)
    80001374:	00f6b023          	sd	a5,0(a3)
    80001378:	fc1ff06f          	j	80001338 <_ZN11ThreadQueue6removeEP3TCB+0x30>
        back = prev;
    8000137c:	00e6b423          	sd	a4,8(a3)
    80001380:	fc1ff06f          	j	80001340 <_ZN11ThreadQueue6removeEP3TCB+0x38>
    if (front == nullptr) return -1;
    80001384:	fff00513          	li	a0,-1
    80001388:	00008067          	ret
    return 0;
    8000138c:	00000513          	li	a0,0
}
    80001390:	00008067          	ret

0000000080001394 <_Z9mem_allocm>:
//poziv ecall, prelazak u sistemski rezim i odlazak u prekidnu rutinu
inline void scall() {
    __asm__ volatile("ecall");
}

void* mem_alloc(size_t size) {
    80001394:	ff010113          	addi	sp,sp,-16
    80001398:	00813423          	sd	s0,8(sp)
    8000139c:	01010413          	addi	s0,sp,16
    //na size se dodaje zaglavlje segmenta
    //size += sizeof(MemoryAllocator::UsedMemSegment);
    size += 2 * sizeof(uint64);
    800013a0:	01050513          	addi	a0,a0,16
    //size je u bajtovima, pretvara se u blokove
    size = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    800013a4:	00655313          	srli	t1,a0,0x6
    800013a8:	03f57513          	andi	a0,a0,63
    800013ac:	00050463          	beqz	a0,800013b4 <_Z9mem_allocm+0x20>
    800013b0:	00100513          	li	a0,1
    800013b4:	00a30333          	add	t1,t1,a0

    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[size]": :[size] "r"(size):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013b8:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x01");
    800013bc:	00100513          	li	a0,1
    __asm__ volatile("ecall");
    800013c0:	00000073          	ecall
    scall();

    //vraceni pokazivac pokazuje iza zaglavlja koriscenog segmenta,
    //na prvu adresu u koju korisnik sme nesto upisati
    void* ret;
    __asm__ volatile("mv %[ptr], a0":[ptr] "=r"(ret));
    800013c4:	00050513          	mv	a0,a0
    return ret;
}
    800013c8:	00813403          	ld	s0,8(sp)
    800013cc:	01010113          	addi	sp,sp,16
    800013d0:	00008067          	ret

00000000800013d4 <_Z8mem_freePv>:

int mem_free(void* ptr) {
    800013d4:	ff010113          	addi	sp,sp,-16
    800013d8:	00813423          	sd	s0,8(sp)
    800013dc:	01010413          	addi	s0,sp,16
    800013e0:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(ptr):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013e4:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x02");
    800013e8:	00200513          	li	a0,2
    __asm__ volatile("ecall");
    800013ec:	00000073          	ecall
    //a1 = pokazivac na memoriju koju treba dealocirati, dobijen pomocu mem_alloc

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800013f0:	00050513          	mv	a0,a0
    return status;
}
    800013f4:	0005051b          	sext.w	a0,a0
    800013f8:	00813403          	ld	s0,8(sp)
    800013fc:	01010113          	addi	sp,sp,16
    80001400:	00008067          	ret

0000000080001404 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void (* start_routine)(void*), void* arg) {
    80001404:	fd010113          	addi	sp,sp,-48
    80001408:	02113423          	sd	ra,40(sp)
    8000140c:	02813023          	sd	s0,32(sp)
    80001410:	00913c23          	sd	s1,24(sp)
    80001414:	01213823          	sd	s2,16(sp)
    80001418:	01313423          	sd	s3,8(sp)
    8000141c:	03010413          	addi	s0,sp,48
    80001420:	00050913          	mv	s2,a0
    80001424:	00058493          	mv	s1,a1
    80001428:	00060993          	mv	s3,a2
    //stvaranje steka ako se ne radi o main kernel niti, posto ona automatski ima stek
    uint64* stack = nullptr;
    if (start_routine != (TCB::Body)main) {
    8000142c:	0000c797          	auipc	a5,0xc
    80001430:	c8c7b783          	ld	a5,-884(a5) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001434:	04f58a63          	beq	a1,a5,80001488 <_Z13thread_createPP3TCBPFvPvES2_+0x84>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80001438:	00001537          	lui	a0,0x1
    8000143c:	00000097          	auipc	ra,0x0
    80001440:	f58080e7          	jalr	-168(ra) # 80001394 <_Z9mem_allocm>
    80001444:	00050313          	mv	t1,a0
        if(!stack) return -1;
    80001448:	04050463          	beqz	a0,80001490 <_Z13thread_createPP3TCBPFvPvES2_+0x8c>
    }
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000144c:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001450:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2, %[function]": :[function] "r"(
            start_routine):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001454:	00048613          	mv	a2,s1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001458:	00090593          	mv	a1,s2
    __asm__ volatile("li a0, 0x11");
    8000145c:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    80001460:	00000073          	ecall
    //a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001464:	00050513          	mv	a0,a0
    80001468:	0005051b          	sext.w	a0,a0
    return status;
}
    8000146c:	02813083          	ld	ra,40(sp)
    80001470:	02013403          	ld	s0,32(sp)
    80001474:	01813483          	ld	s1,24(sp)
    80001478:	01013903          	ld	s2,16(sp)
    8000147c:	00813983          	ld	s3,8(sp)
    80001480:	03010113          	addi	sp,sp,48
    80001484:	00008067          	ret
    uint64* stack = nullptr;
    80001488:	00000313          	li	t1,0
    8000148c:	fc1ff06f          	j	8000144c <_Z13thread_createPP3TCBPFvPvES2_+0x48>
        if(!stack) return -1;
    80001490:	fff00513          	li	a0,-1
    80001494:	fd9ff06f          	j	8000146c <_Z13thread_createPP3TCBPFvPvES2_+0x68>

0000000080001498 <_Z11thread_exitv>:

int thread_exit() {
    80001498:	ff010113          	addi	sp,sp,-16
    8000149c:	00813423          	sd	s0,8(sp)
    800014a0:	01010413          	addi	s0,sp,16
    //nema argumenata, samo kod sistemskog poziva
    __asm__ volatile("li a0, 0x12");
    800014a4:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    800014a8:	00000073          	ecall

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800014ac:	00050513          	mv	a0,a0
    return status;
}
    800014b0:	0005051b          	sext.w	a0,a0
    800014b4:	00813403          	ld	s0,8(sp)
    800014b8:	01010113          	addi	sp,sp,16
    800014bc:	00008067          	ret

00000000800014c0 <_Z15thread_dispatchv>:

void thread_dispatch() {
    800014c0:	ff010113          	addi	sp,sp,-16
    800014c4:	00813423          	sd	s0,8(sp)
    800014c8:	01010413          	addi	s0,sp,16
    //nema argumenata, samo kod sistemskog poziva
    __asm__ volatile("li a0, 0x13");
    800014cc:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    800014d0:	00000073          	ecall

    scall();
    //nema povratne vrednosti
}
    800014d4:	00813403          	ld	s0,8(sp)
    800014d8:	01010113          	addi	sp,sp,16
    800014dc:	00008067          	ret

00000000800014e0 <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle) {
    800014e0:	ff010113          	addi	sp,sp,-16
    800014e4:	00813423          	sd	s0,8(sp)
    800014e8:	01010413          	addi	s0,sp,16
    800014ec:	00050313          	mv	t1,a0
//stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800014f0:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x14");
    800014f4:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    800014f8:	00000073          	ecall
    //a0 = 0x14
    //a1 = rucka niti na koju se ceka

    scall();
}
    800014fc:	00813403          	ld	s0,8(sp)
    80001500:	01010113          	addi	sp,sp,16
    80001504:	00008067          	ret

0000000080001508 <_Z10time_sleepm>:

int time_sleep(time_t timerPeriods) {
    80001508:	ff010113          	addi	sp,sp,-16
    8000150c:	00813423          	sd	s0,8(sp)
    80001510:	01010413          	addi	s0,sp,16
    80001514:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[time]": :[time] "r"(timerPeriods):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001518:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x31");
    8000151c:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    80001520:	00000073          	ecall
    //a1 = broj perioda tajmera na koji se uspavljuje nit

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001524:	00050513          	mv	a0,a0
    return status;
}
    80001528:	0005051b          	sext.w	a0,a0
    8000152c:	00813403          	ld	s0,8(sp)
    80001530:	01010113          	addi	sp,sp,16
    80001534:	00008067          	ret

0000000080001538 <_Z8sem_openPP4KSemj>:

int sem_open(sem_t* handle, unsigned int init) {
    80001538:	ff010113          	addi	sp,sp,-16
    8000153c:	00813423          	sd	s0,8(sp)
    80001540:	01010413          	addi	s0,sp,16
    80001544:	00050313          	mv	t1,a0
    80001548:	00058e13          	mv	t3,a1
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a2, %[val]": :[val] "r"(init):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000154c:	000e0613          	mv	a2,t3
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001550:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x21");
    80001554:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    80001558:	00000073          	ecall

    scall();

    //status == 0 ako je uspesno kreiran semafor; status == -1 ako nije
    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    8000155c:	00050513          	mv	a0,a0
    return status;
}
    80001560:	0005051b          	sext.w	a0,a0
    80001564:	00813403          	ld	s0,8(sp)
    80001568:	01010113          	addi	sp,sp,16
    8000156c:	00008067          	ret

0000000080001570 <_Z9sem_closeP4KSem>:

int sem_close(sem_t handle) {
    80001570:	ff010113          	addi	sp,sp,-16
    80001574:	00813423          	sd	s0,8(sp)
    80001578:	01010413          	addi	s0,sp,16
    8000157c:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001580:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x22");
    80001584:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    80001588:	00000073          	ecall
    //a1 = rucka semafora (pokazivac na semafor u kernelu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    8000158c:	00050513          	mv	a0,a0
    return status;
}
    80001590:	0005051b          	sext.w	a0,a0
    80001594:	00813403          	ld	s0,8(sp)
    80001598:	01010113          	addi	sp,sp,16
    8000159c:	00008067          	ret

00000000800015a0 <_Z8sem_waitP4KSem>:

int sem_wait(sem_t id) {
    800015a0:	ff010113          	addi	sp,sp,-16
    800015a4:	00813423          	sd	s0,8(sp)
    800015a8:	01010413          	addi	s0,sp,16
    800015ac:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(id):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015b0:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x23");
    800015b4:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    800015b8:	00000073          	ecall
    //a1 = rucka semafora (pokazivac na semafor u kernelu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800015bc:	00050513          	mv	a0,a0
    return status;
}
    800015c0:	0005051b          	sext.w	a0,a0
    800015c4:	00813403          	ld	s0,8(sp)
    800015c8:	01010113          	addi	sp,sp,16
    800015cc:	00008067          	ret

00000000800015d0 <_Z10sem_signalP4KSem>:

int sem_signal(sem_t id) {
    800015d0:	ff010113          	addi	sp,sp,-16
    800015d4:	00813423          	sd	s0,8(sp)
    800015d8:	01010413          	addi	s0,sp,16
    800015dc:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(id):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015e0:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x24");
    800015e4:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    800015e8:	00000073          	ecall
    //a1 = rucka semafora (pokazivac na semafor u kernelu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800015ec:	00050513          	mv	a0,a0
    return status;
}
    800015f0:	0005051b          	sext.w	a0,a0
    800015f4:	00813403          	ld	s0,8(sp)
    800015f8:	01010113          	addi	sp,sp,16
    800015fc:	00008067          	ret

0000000080001600 <_Z4getcv>:

char getc() {
    80001600:	ff010113          	addi	sp,sp,-16
    80001604:	00813423          	sd	s0,8(sp)
    80001608:	01010413          	addi	s0,sp,16
    //nema argumenata
    __asm__ volatile("li a0, 0x41");
    8000160c:	04100513          	li	a0,65
    __asm__ volatile("ecall");
    80001610:	00000073          	ecall

    scall();

    char character;
    __asm__ volatile("mv %[c], a0":[c] "=r"(character));
    80001614:	00050513          	mv	a0,a0
    return character;
}
    80001618:	0ff57513          	andi	a0,a0,255
    8000161c:	00813403          	ld	s0,8(sp)
    80001620:	01010113          	addi	sp,sp,16
    80001624:	00008067          	ret

0000000080001628 <_Z4putcc>:

void putc(char c) {
    80001628:	ff010113          	addi	sp,sp,-16
    8000162c:	00813423          	sd	s0,8(sp)
    80001630:	01010413          	addi	s0,sp,16
    80001634:	00050313          	mv	t1,a0
    //stavljanje argumenata
    __asm__ volatile("mv a1, %[c]": :[c] "r"(c):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001638:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x42");
    8000163c:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    80001640:	00000073          	ecall

    scall();
    //nema povratne vrednosti
}
    80001644:	00813403          	ld	s0,8(sp)
    80001648:	01010113          	addi	sp,sp,16
    8000164c:	00008067          	ret

0000000080001650 <_Z12thread_allocPP3TCBPFvPvES2_>:

int thread_alloc(thread_t* handle, TCB::Body function, void* arg) {
    80001650:	fd010113          	addi	sp,sp,-48
    80001654:	02113423          	sd	ra,40(sp)
    80001658:	02813023          	sd	s0,32(sp)
    8000165c:	00913c23          	sd	s1,24(sp)
    80001660:	01213823          	sd	s2,16(sp)
    80001664:	01313423          	sd	s3,8(sp)
    80001668:	03010413          	addi	s0,sp,48
    8000166c:	00050913          	mv	s2,a0
    80001670:	00058493          	mv	s1,a1
    80001674:	00060993          	mv	s3,a2
    //stvaranje steka ako se ne radi o main kernel niti, posto ona automatski ima stek
    uint64* stack = nullptr;
    if (function != (TCB::Body)main) {
    80001678:	0000c797          	auipc	a5,0xc
    8000167c:	a407b783          	ld	a5,-1472(a5) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001680:	04f58a63          	beq	a1,a5,800016d4 <_Z12thread_allocPP3TCBPFvPvES2_+0x84>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80001684:	00001537          	lui	a0,0x1
    80001688:	00000097          	auipc	ra,0x0
    8000168c:	d0c080e7          	jalr	-756(ra) # 80001394 <_Z9mem_allocm>
    80001690:	00050313          	mv	t1,a0
        if(!stack) return -1;
    80001694:	04050463          	beqz	a0,800016dc <_Z12thread_allocPP3TCBPFvPvES2_+0x8c>
    }
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001698:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000169c:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2, %[function]": :[function] "r"(
            function):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800016a0:	00048613          	mv	a2,s1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800016a4:	00090593          	mv	a1,s2
    __asm__ volatile("li a0, 0x80");
    800016a8:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    800016ac:	00000073          	ecall
    //a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800016b0:	00050513          	mv	a0,a0
    800016b4:	0005051b          	sext.w	a0,a0
    return status;
}
    800016b8:	02813083          	ld	ra,40(sp)
    800016bc:	02013403          	ld	s0,32(sp)
    800016c0:	01813483          	ld	s1,24(sp)
    800016c4:	01013903          	ld	s2,16(sp)
    800016c8:	00813983          	ld	s3,8(sp)
    800016cc:	03010113          	addi	sp,sp,48
    800016d0:	00008067          	ret
    uint64* stack = nullptr;
    800016d4:	00000313          	li	t1,0
    800016d8:	fc1ff06f          	j	80001698 <_Z12thread_allocPP3TCBPFvPvES2_+0x48>
        if(!stack) return -1;
    800016dc:	fff00513          	li	a0,-1
    800016e0:	fd9ff06f          	j	800016b8 <_Z12thread_allocPP3TCBPFvPvES2_+0x68>

00000000800016e4 <_Z12thread_startP3TCB>:

void thread_start(thread_t handle) {
    800016e4:	ff010113          	addi	sp,sp,-16
    800016e8:	00813423          	sd	s0,8(sp)
    800016ec:	01010413          	addi	s0,sp,16
    800016f0:	00050313          	mv	t1,a0
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800016f4:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    800016f8:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    800016fc:	00000073          	ecall

    scall();
}
    80001700:	00813403          	ld	s0,8(sp)
    80001704:	01010113          	addi	sp,sp,16
    80001708:	00008067          	ret

000000008000170c <_ZN8KConsole12initKConsoleEv>:
int KConsole::inputBufferSize = 0;
char KConsole::inputBuffer[];
char KConsole::outputBuffer[];

void KConsole::initKConsole() {
	if (initialized) return;
    8000170c:	0000c797          	auipc	a5,0xc
    80001710:	a347c783          	lbu	a5,-1484(a5) # 8000d140 <_ZN8KConsole11initializedE>
    80001714:	00078463          	beqz	a5,8000171c <_ZN8KConsole12initKConsoleEv+0x10>
    80001718:	00008067          	ret
void KConsole::initKConsole() {
    8000171c:	fe010113          	addi	sp,sp,-32
    80001720:	00113c23          	sd	ra,24(sp)
    80001724:	00813823          	sd	s0,16(sp)
    80001728:	00913423          	sd	s1,8(sp)
    8000172c:	02010413          	addi	s0,sp,32
	dr = (char*)CONSOLE_RX_DATA;
    80001730:	0000c497          	auipc	s1,0xc
    80001734:	a1048493          	addi	s1,s1,-1520 # 8000d140 <_ZN8KConsole11initializedE>
    80001738:	0000c797          	auipc	a5,0xc
    8000173c:	9207b783          	ld	a5,-1760(a5) # 8000d058 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001740:	0007b783          	ld	a5,0(a5)
    80001744:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    80001748:	0000c797          	auipc	a5,0xc
    8000174c:	9207b783          	ld	a5,-1760(a5) # 8000d068 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001750:	0007b783          	ld	a5,0(a5)
    80001754:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    80001758:	03200593          	li	a1,50
    8000175c:	0000c517          	auipc	a0,0xc
    80001760:	9fc50513          	addi	a0,a0,-1540 # 8000d158 <_ZN8KConsole19inputBufferHasSpaceE>
    80001764:	00000097          	auipc	ra,0x0
    80001768:	dd4080e7          	jalr	-556(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    8000176c:	03200593          	li	a1,50
    80001770:	0000c517          	auipc	a0,0xc
    80001774:	9f050513          	addi	a0,a0,-1552 # 8000d160 <_ZN8KConsole20outputBufferHasSpaceE>
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	dc0080e7          	jalr	-576(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    80001780:	00000593          	li	a1,0
    80001784:	0000c517          	auipc	a0,0xc
    80001788:	9e450513          	addi	a0,a0,-1564 # 8000d168 <_ZN8KConsole12charsToInputE>
    8000178c:	00000097          	auipc	ra,0x0
    80001790:	dac080e7          	jalr	-596(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    80001794:	00000593          	li	a1,0
    80001798:	0000c517          	auipc	a0,0xc
    8000179c:	9d850513          	addi	a0,a0,-1576 # 8000d170 <_ZN8KConsole13charsToOutputE>
    800017a0:	00000097          	auipc	ra,0x0
    800017a4:	d98080e7          	jalr	-616(ra) # 80001538 <_Z8sem_openPP4KSemj>
	initialized = true;
    800017a8:	00100793          	li	a5,1
    800017ac:	00f48023          	sb	a5,0(s1)
}
    800017b0:	01813083          	ld	ra,24(sp)
    800017b4:	01013403          	ld	s0,16(sp)
    800017b8:	00813483          	ld	s1,8(sp)
    800017bc:	02010113          	addi	sp,sp,32
    800017c0:	00008067          	ret

00000000800017c4 <_ZN8KConsole13getFromOutputEv>:

char KConsole::getFromOutput() {
    800017c4:	fe010113          	addi	sp,sp,-32
    800017c8:	00113c23          	sd	ra,24(sp)
    800017cc:	00813823          	sd	s0,16(sp)
    800017d0:	00913423          	sd	s1,8(sp)
    800017d4:	02010413          	addi	s0,sp,32
	sem_wait(charsToOutput);
    800017d8:	0000c497          	auipc	s1,0xc
    800017dc:	96848493          	addi	s1,s1,-1688 # 8000d140 <_ZN8KConsole11initializedE>
    800017e0:	0304b503          	ld	a0,48(s1)
    800017e4:	00000097          	auipc	ra,0x0
    800017e8:	dbc080e7          	jalr	-580(ra) # 800015a0 <_Z8sem_waitP4KSem>
	char c = outputBuffer[outputHead];
    800017ec:	0384a783          	lw	a5,56(s1)
    800017f0:	00f48733          	add	a4,s1,a5
	outputHead = (outputHead + 1) % capacity;
    800017f4:	0017879b          	addiw	a5,a5,1
    800017f8:	03200693          	li	a3,50
    800017fc:	02d7e7bb          	remw	a5,a5,a3
    80001800:	02f4ac23          	sw	a5,56(s1)
	return c;
}
    80001804:	04074503          	lbu	a0,64(a4)
    80001808:	01813083          	ld	ra,24(sp)
    8000180c:	01013403          	ld	s0,16(sp)
    80001810:	00813483          	ld	s1,8(sp)
    80001814:	02010113          	addi	sp,sp,32
    80001818:	00008067          	ret

000000008000181c <_ZN8KConsole12placeInInputEc>:

void KConsole::placeInInput(char c) {
	if (inputBufferSize == capacity) return;
    8000181c:	0000c717          	auipc	a4,0xc
    80001820:	99872703          	lw	a4,-1640(a4) # 8000d1b4 <_ZN8KConsole15inputBufferSizeE>
    80001824:	03200793          	li	a5,50
    80001828:	04f70e63          	beq	a4,a5,80001884 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    8000182c:	ff010113          	addi	sp,sp,-16
    80001830:	00113423          	sd	ra,8(sp)
    80001834:	00813023          	sd	s0,0(sp)
    80001838:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    8000183c:	0000c697          	auipc	a3,0xc
    80001840:	90468693          	addi	a3,a3,-1788 # 8000d140 <_ZN8KConsole11initializedE>
    80001844:	0786a783          	lw	a5,120(a3)
    80001848:	00f68633          	add	a2,a3,a5
    8000184c:	08a60023          	sb	a0,128(a2)
	inputTail = (inputTail + 1) % capacity;
    80001850:	0017879b          	addiw	a5,a5,1
    80001854:	03200613          	li	a2,50
    80001858:	02c7e7bb          	remw	a5,a5,a2
    8000185c:	06f6ac23          	sw	a5,120(a3)
	inputBufferSize++;
    80001860:	0017071b          	addiw	a4,a4,1
    80001864:	06e6aa23          	sw	a4,116(a3)
	sem_signal(charsToInput);
    80001868:	0286b503          	ld	a0,40(a3)
    8000186c:	00000097          	auipc	ra,0x0
    80001870:	d64080e7          	jalr	-668(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80001874:	00813083          	ld	ra,8(sp)
    80001878:	00013403          	ld	s0,0(sp)
    8000187c:	01010113          	addi	sp,sp,16
    80001880:	00008067          	ret
    80001884:	00008067          	ret

0000000080001888 <_ZN8KConsole5kputcEc>:

void KConsole::kputc(char c) {
    80001888:	fe010113          	addi	sp,sp,-32
    8000188c:	00113c23          	sd	ra,24(sp)
    80001890:	00813823          	sd	s0,16(sp)
    80001894:	00913423          	sd	s1,8(sp)
    80001898:	01213023          	sd	s2,0(sp)
    8000189c:	02010413          	addi	s0,sp,32
    800018a0:	00050913          	mv	s2,a0
	sem_wait(outputBufferHasSpace);
    800018a4:	0000c497          	auipc	s1,0xc
    800018a8:	89c48493          	addi	s1,s1,-1892 # 8000d140 <_ZN8KConsole11initializedE>
    800018ac:	0204b503          	ld	a0,32(s1)
    800018b0:	00000097          	auipc	ra,0x0
    800018b4:	cf0080e7          	jalr	-784(ra) # 800015a0 <_Z8sem_waitP4KSem>
	outputBuffer[outputTail] = c;
    800018b8:	0b44a783          	lw	a5,180(s1)
    800018bc:	00f48733          	add	a4,s1,a5
    800018c0:	05270023          	sb	s2,64(a4)
	outputTail = (outputTail + 1) % capacity;
    800018c4:	0017879b          	addiw	a5,a5,1
    800018c8:	03200713          	li	a4,50
    800018cc:	02e7e7bb          	remw	a5,a5,a4
    800018d0:	0af4aa23          	sw	a5,180(s1)
	sem_signal(charsToOutput);
    800018d4:	0304b503          	ld	a0,48(s1)
    800018d8:	00000097          	auipc	ra,0x0
    800018dc:	cf8080e7          	jalr	-776(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    800018e0:	01813083          	ld	ra,24(sp)
    800018e4:	01013403          	ld	s0,16(sp)
    800018e8:	00813483          	ld	s1,8(sp)
    800018ec:	00013903          	ld	s2,0(sp)
    800018f0:	02010113          	addi	sp,sp,32
    800018f4:	00008067          	ret

00000000800018f8 <_ZN8KConsole5kgetcEv>:

char KConsole::kgetc() {
    800018f8:	fe010113          	addi	sp,sp,-32
    800018fc:	00113c23          	sd	ra,24(sp)
    80001900:	00813823          	sd	s0,16(sp)
    80001904:	00913423          	sd	s1,8(sp)
    80001908:	02010413          	addi	s0,sp,32
	sem_wait(charsToInput);
    8000190c:	0000c497          	auipc	s1,0xc
    80001910:	83448493          	addi	s1,s1,-1996 # 8000d140 <_ZN8KConsole11initializedE>
    80001914:	0284b503          	ld	a0,40(s1)
    80001918:	00000097          	auipc	ra,0x0
    8000191c:	c88080e7          	jalr	-888(ra) # 800015a0 <_Z8sem_waitP4KSem>
	char c = inputBuffer[inputHead];
    80001920:	0b84a783          	lw	a5,184(s1)
    80001924:	00f48733          	add	a4,s1,a5
	inputHead = (inputHead + 1) % capacity;
    80001928:	0017879b          	addiw	a5,a5,1
    8000192c:	03200693          	li	a3,50
    80001930:	02d7e7bb          	remw	a5,a5,a3
    80001934:	0af4ac23          	sw	a5,184(s1)
	inputBufferSize--;
    80001938:	0744a783          	lw	a5,116(s1)
    8000193c:	fff7879b          	addiw	a5,a5,-1
    80001940:	06f4aa23          	sw	a5,116(s1)
	return c;
}
    80001944:	08074503          	lbu	a0,128(a4)
    80001948:	01813083          	ld	ra,24(sp)
    8000194c:	01013403          	ld	s0,16(sp)
    80001950:	00813483          	ld	s1,8(sp)
    80001954:	02010113          	addi	sp,sp,32
    80001958:	00008067          	ret

000000008000195c <_Z2f1Pv>:

Semaphore* s12,*s23,*s31;
Thread* nit1, *nit2, *nit3;


void f1(void* end) {
    8000195c:	fe010113          	addi	sp,sp,-32
    80001960:	00113c23          	sd	ra,24(sp)
    80001964:	00813823          	sd	s0,16(sp)
    80001968:	00913423          	sd	s1,8(sp)
    8000196c:	02010413          	addi	s0,sp,32
    s31->wait();
    80001970:	0000c497          	auipc	s1,0xc
    80001974:	89048493          	addi	s1,s1,-1904 # 8000d200 <s31>
    80001978:	0004b503          	ld	a0,0(s1)
    8000197c:	00002097          	auipc	ra,0x2
    80001980:	b2c080e7          	jalr	-1236(ra) # 800034a8 <_ZN9Semaphore4waitEv>
    time_sleep(10);
    80001984:	00a00513          	li	a0,10
    80001988:	00000097          	auipc	ra,0x0
    8000198c:	b80080e7          	jalr	-1152(ra) # 80001508 <_Z10time_sleepm>
    delete nit2;
    80001990:	0084b503          	ld	a0,8(s1)
    80001994:	00050863          	beqz	a0,800019a4 <_Z2f1Pv+0x48>
    80001998:	00053783          	ld	a5,0(a0)
    8000199c:	0087b783          	ld	a5,8(a5)
    800019a0:	000780e7          	jalr	a5
    s31->wait();
    800019a4:	0000c517          	auipc	a0,0xc
    800019a8:	85c53503          	ld	a0,-1956(a0) # 8000d200 <s31>
    800019ac:	00002097          	auipc	ra,0x2
    800019b0:	afc080e7          	jalr	-1284(ra) # 800034a8 <_ZN9Semaphore4waitEv>


    printString("\nGotova nit 1\n");
    800019b4:	00008517          	auipc	a0,0x8
    800019b8:	66c50513          	addi	a0,a0,1644 # 8000a020 <CONSOLE_STATUS+0x10>
    800019bc:	00005097          	auipc	ra,0x5
    800019c0:	9c0080e7          	jalr	-1600(ra) # 8000637c <_Z11printStringPKc>
}
    800019c4:	01813083          	ld	ra,24(sp)
    800019c8:	01013403          	ld	s0,16(sp)
    800019cc:	00813483          	ld	s1,8(sp)
    800019d0:	02010113          	addi	sp,sp,32
    800019d4:	00008067          	ret

00000000800019d8 <_Z2f2Pv>:


void f2(void* end ) {
    800019d8:	ff010113          	addi	sp,sp,-16
    800019dc:	00113423          	sd	ra,8(sp)
    800019e0:	00813023          	sd	s0,0(sp)
    800019e4:	01010413          	addi	s0,sp,16
    time_sleep(5);
    800019e8:	00500513          	li	a0,5
    800019ec:	00000097          	auipc	ra,0x0
    800019f0:	b1c080e7          	jalr	-1252(ra) # 80001508 <_Z10time_sleepm>
    s31->wait();
    800019f4:	0000c517          	auipc	a0,0xc
    800019f8:	80c53503          	ld	a0,-2036(a0) # 8000d200 <s31>
    800019fc:	00002097          	auipc	ra,0x2
    80001a00:	aac080e7          	jalr	-1364(ra) # 800034a8 <_ZN9Semaphore4waitEv>


    printString("\nGotova nit 2\n");
    80001a04:	00008517          	auipc	a0,0x8
    80001a08:	62c50513          	addi	a0,a0,1580 # 8000a030 <CONSOLE_STATUS+0x20>
    80001a0c:	00005097          	auipc	ra,0x5
    80001a10:	970080e7          	jalr	-1680(ra) # 8000637c <_Z11printStringPKc>
}
    80001a14:	00813083          	ld	ra,8(sp)
    80001a18:	00013403          	ld	s0,0(sp)
    80001a1c:	01010113          	addi	sp,sp,16
    80001a20:	00008067          	ret

0000000080001a24 <_Z2f3Pv>:


void f3(void* end) {
    80001a24:	ff010113          	addi	sp,sp,-16
    80001a28:	00113423          	sd	ra,8(sp)
    80001a2c:	00813023          	sd	s0,0(sp)
    80001a30:	01010413          	addi	s0,sp,16
    time_sleep(30);
    80001a34:	01e00513          	li	a0,30
    80001a38:	00000097          	auipc	ra,0x0
    80001a3c:	ad0080e7          	jalr	-1328(ra) # 80001508 <_Z10time_sleepm>
    s31->signal();
    80001a40:	0000b517          	auipc	a0,0xb
    80001a44:	7c053503          	ld	a0,1984(a0) # 8000d200 <s31>
    80001a48:	00002097          	auipc	ra,0x2
    80001a4c:	a8c080e7          	jalr	-1396(ra) # 800034d4 <_ZN9Semaphore6signalEv>

    printString("\nGotova nit3\n");
    80001a50:	00008517          	auipc	a0,0x8
    80001a54:	5f050513          	addi	a0,a0,1520 # 8000a040 <CONSOLE_STATUS+0x30>
    80001a58:	00005097          	auipc	ra,0x5
    80001a5c:	924080e7          	jalr	-1756(ra) # 8000637c <_Z11printStringPKc>
}
    80001a60:	00813083          	ld	ra,8(sp)
    80001a64:	00013403          	ld	s0,0(sp)
    80001a68:	01010113          	addi	sp,sp,16
    80001a6c:	00008067          	ret

0000000080001a70 <_Z4userPv>:
        printString("Tajmer: ");
        printInt(counter++);
        printString("\n");
    }
};
void user(void*) {
    80001a70:	fc010113          	addi	sp,sp,-64
    80001a74:	02113c23          	sd	ra,56(sp)
    80001a78:	02813823          	sd	s0,48(sp)
    80001a7c:	02913423          	sd	s1,40(sp)
    80001a80:	03213023          	sd	s2,32(sp)
    80001a84:	01313c23          	sd	s3,24(sp)
    80001a88:	04010413          	addi	s0,sp,64
    int end = 0;
    80001a8c:	fc042623          	sw	zero,-52(s0)
    nit1 = new Thread(f1, &end);
    80001a90:	02000513          	li	a0,32
    80001a94:	00001097          	auipc	ra,0x1
    80001a98:	670080e7          	jalr	1648(ra) # 80003104 <_Znwm>
    80001a9c:	00050493          	mv	s1,a0
    80001aa0:	fcc40613          	addi	a2,s0,-52
    80001aa4:	00000597          	auipc	a1,0x0
    80001aa8:	eb858593          	addi	a1,a1,-328 # 8000195c <_Z2f1Pv>
    80001aac:	00001097          	auipc	ra,0x1
    80001ab0:	778080e7          	jalr	1912(ra) # 80003224 <_ZN6ThreadC1EPFvPvES0_>
    80001ab4:	0000b797          	auipc	a5,0xb
    80001ab8:	7497be23          	sd	s1,1884(a5) # 8000d210 <nit1>
    nit2 = new Thread(f2, &end);
    80001abc:	02000513          	li	a0,32
    80001ac0:	00001097          	auipc	ra,0x1
    80001ac4:	644080e7          	jalr	1604(ra) # 80003104 <_Znwm>
    80001ac8:	00050493          	mv	s1,a0
    80001acc:	fcc40613          	addi	a2,s0,-52
    80001ad0:	00000597          	auipc	a1,0x0
    80001ad4:	f0858593          	addi	a1,a1,-248 # 800019d8 <_Z2f2Pv>
    80001ad8:	00001097          	auipc	ra,0x1
    80001adc:	74c080e7          	jalr	1868(ra) # 80003224 <_ZN6ThreadC1EPFvPvES0_>
    80001ae0:	0000b797          	auipc	a5,0xb
    80001ae4:	7297b423          	sd	s1,1832(a5) # 8000d208 <nit2>
    nit3 = new Thread(f3, &end);
    80001ae8:	02000513          	li	a0,32
    80001aec:	00001097          	auipc	ra,0x1
    80001af0:	618080e7          	jalr	1560(ra) # 80003104 <_Znwm>
    80001af4:	00050493          	mv	s1,a0
    80001af8:	fcc40613          	addi	a2,s0,-52
    80001afc:	00000597          	auipc	a1,0x0
    80001b00:	f2858593          	addi	a1,a1,-216 # 80001a24 <_Z2f3Pv>
    80001b04:	00001097          	auipc	ra,0x1
    80001b08:	720080e7          	jalr	1824(ra) # 80003224 <_ZN6ThreadC1EPFvPvES0_>
    80001b0c:	0000b797          	auipc	a5,0xb
    80001b10:	7097b623          	sd	s1,1804(a5) # 8000d218 <nit3>
    PeriodicThread* per = new timer();
    80001b14:	03000513          	li	a0,48
    80001b18:	00001097          	auipc	ra,0x1
    80001b1c:	5ec080e7          	jalr	1516(ra) # 80003104 <_Znwm>
    80001b20:	00050913          	mv	s2,a0
    explicit timer(): PeriodicThread(1){}
    80001b24:	00100593          	li	a1,1
    80001b28:	00002097          	auipc	ra,0x2
    80001b2c:	9f8080e7          	jalr	-1544(ra) # 80003520 <_ZN14PeriodicThreadC1Em>
    80001b30:	0000b797          	auipc	a5,0xb
    80001b34:	28078793          	addi	a5,a5,640 # 8000cdb0 <_ZTV5timer+0x10>
    80001b38:	00f93023          	sd	a5,0(s2)
    80001b3c:	02092423          	sw	zero,40(s2)
    s12 = new Semaphore(0);
    80001b40:	01000513          	li	a0,16
    80001b44:	00001097          	auipc	ra,0x1
    80001b48:	5c0080e7          	jalr	1472(ra) # 80003104 <_Znwm>
    80001b4c:	00050493          	mv	s1,a0
    80001b50:	00000593          	li	a1,0
    80001b54:	00002097          	auipc	ra,0x2
    80001b58:	91c080e7          	jalr	-1764(ra) # 80003470 <_ZN9SemaphoreC1Ej>
    80001b5c:	0000b797          	auipc	a5,0xb
    80001b60:	6c97b223          	sd	s1,1732(a5) # 8000d220 <s12>
    s23 = new Semaphore(0);
    80001b64:	01000513          	li	a0,16
    80001b68:	00001097          	auipc	ra,0x1
    80001b6c:	59c080e7          	jalr	1436(ra) # 80003104 <_Znwm>
    80001b70:	00050493          	mv	s1,a0
    80001b74:	00000593          	li	a1,0
    80001b78:	00002097          	auipc	ra,0x2
    80001b7c:	8f8080e7          	jalr	-1800(ra) # 80003470 <_ZN9SemaphoreC1Ej>
    80001b80:	0000b797          	auipc	a5,0xb
    80001b84:	6a97b423          	sd	s1,1704(a5) # 8000d228 <s23>
    s31 = new Semaphore(1);
    80001b88:	01000513          	li	a0,16
    80001b8c:	00001097          	auipc	ra,0x1
    80001b90:	578080e7          	jalr	1400(ra) # 80003104 <_Znwm>
    80001b94:	00050993          	mv	s3,a0
    80001b98:	00100593          	li	a1,1
    80001b9c:	00002097          	auipc	ra,0x2
    80001ba0:	8d4080e7          	jalr	-1836(ra) # 80003470 <_ZN9SemaphoreC1Ej>
    80001ba4:	0000b497          	auipc	s1,0xb
    80001ba8:	65c48493          	addi	s1,s1,1628 # 8000d200 <s31>
    80001bac:	0134b023          	sd	s3,0(s1)
    nit1->start();
    80001bb0:	0104b503          	ld	a0,16(s1)
    80001bb4:	00001097          	auipc	ra,0x1
    80001bb8:	708080e7          	jalr	1800(ra) # 800032bc <_ZN6Thread5startEv>
    nit3->start();
    80001bbc:	0184b503          	ld	a0,24(s1)
    80001bc0:	00001097          	auipc	ra,0x1
    80001bc4:	6fc080e7          	jalr	1788(ra) # 800032bc <_ZN6Thread5startEv>
    nit2->start();
    80001bc8:	0084b503          	ld	a0,8(s1)
    80001bcc:	00001097          	auipc	ra,0x1
    80001bd0:	6f0080e7          	jalr	1776(ra) # 800032bc <_ZN6Thread5startEv>
    per->start();
    80001bd4:	00090513          	mv	a0,s2
    80001bd8:	00001097          	auipc	ra,0x1
    80001bdc:	6e4080e7          	jalr	1764(ra) # 800032bc <_ZN6Thread5startEv>

    time_sleep(50);
    80001be0:	03200513          	li	a0,50
    80001be4:	00000097          	auipc	ra,0x0
    80001be8:	924080e7          	jalr	-1756(ra) # 80001508 <_Z10time_sleepm>
    nit1->join();
    80001bec:	0104b503          	ld	a0,16(s1)
    80001bf0:	00001097          	auipc	ra,0x1
    80001bf4:	714080e7          	jalr	1812(ra) # 80003304 <_ZN6Thread4joinEv>
    nit2->join();
    80001bf8:	0084b503          	ld	a0,8(s1)
    80001bfc:	00001097          	auipc	ra,0x1
    80001c00:	708080e7          	jalr	1800(ra) # 80003304 <_ZN6Thread4joinEv>
    nit3->join();
    80001c04:	0184b503          	ld	a0,24(s1)
    80001c08:	00001097          	auipc	ra,0x1
    80001c0c:	6fc080e7          	jalr	1788(ra) # 80003304 <_ZN6Thread4joinEv>


    printString("\nGotove user niti\n");
    80001c10:	00008517          	auipc	a0,0x8
    80001c14:	44050513          	addi	a0,a0,1088 # 8000a050 <CONSOLE_STATUS+0x40>
    80001c18:	00004097          	auipc	ra,0x4
    80001c1c:	764080e7          	jalr	1892(ra) # 8000637c <_Z11printStringPKc>

    printString("\nSad cu da izadjem iz usera\n");
    80001c20:	00008517          	auipc	a0,0x8
    80001c24:	44850513          	addi	a0,a0,1096 # 8000a068 <CONSOLE_STATUS+0x58>
    80001c28:	00004097          	auipc	ra,0x4
    80001c2c:	754080e7          	jalr	1876(ra) # 8000637c <_Z11printStringPKc>
    time_sleep(10);
    80001c30:	00a00513          	li	a0,10
    80001c34:	00000097          	auipc	ra,0x0
    80001c38:	8d4080e7          	jalr	-1836(ra) # 80001508 <_Z10time_sleepm>
    per->terminate();
    80001c3c:	00090513          	mv	a0,s2
    80001c40:	00002097          	auipc	ra,0x2
    80001c44:	8c0080e7          	jalr	-1856(ra) # 80003500 <_ZN14PeriodicThread9terminateEv>
    80001c48:	03813083          	ld	ra,56(sp)
    80001c4c:	03013403          	ld	s0,48(sp)
    80001c50:	02813483          	ld	s1,40(sp)
    80001c54:	02013903          	ld	s2,32(sp)
    80001c58:	01813983          	ld	s3,24(sp)
    80001c5c:	04010113          	addi	sp,sp,64
    80001c60:	00008067          	ret
    80001c64:	00050913          	mv	s2,a0
    nit1 = new Thread(f1, &end);
    80001c68:	00048513          	mv	a0,s1
    80001c6c:	00001097          	auipc	ra,0x1
    80001c70:	4e8080e7          	jalr	1256(ra) # 80003154 <_ZdlPv>
    80001c74:	00090513          	mv	a0,s2
    80001c78:	0000c097          	auipc	ra,0xc
    80001c7c:	740080e7          	jalr	1856(ra) # 8000e3b8 <_Unwind_Resume>
    80001c80:	00050913          	mv	s2,a0
    nit2 = new Thread(f2, &end);
    80001c84:	00048513          	mv	a0,s1
    80001c88:	00001097          	auipc	ra,0x1
    80001c8c:	4cc080e7          	jalr	1228(ra) # 80003154 <_ZdlPv>
    80001c90:	00090513          	mv	a0,s2
    80001c94:	0000c097          	auipc	ra,0xc
    80001c98:	724080e7          	jalr	1828(ra) # 8000e3b8 <_Unwind_Resume>
    80001c9c:	00050913          	mv	s2,a0
    nit3 = new Thread(f3, &end);
    80001ca0:	00048513          	mv	a0,s1
    80001ca4:	00001097          	auipc	ra,0x1
    80001ca8:	4b0080e7          	jalr	1200(ra) # 80003154 <_ZdlPv>
    80001cac:	00090513          	mv	a0,s2
    80001cb0:	0000c097          	auipc	ra,0xc
    80001cb4:	708080e7          	jalr	1800(ra) # 8000e3b8 <_Unwind_Resume>
    80001cb8:	00050493          	mv	s1,a0
    PeriodicThread* per = new timer();
    80001cbc:	00090513          	mv	a0,s2
    80001cc0:	00001097          	auipc	ra,0x1
    80001cc4:	494080e7          	jalr	1172(ra) # 80003154 <_ZdlPv>
    80001cc8:	00048513          	mv	a0,s1
    80001ccc:	0000c097          	auipc	ra,0xc
    80001cd0:	6ec080e7          	jalr	1772(ra) # 8000e3b8 <_Unwind_Resume>
    80001cd4:	00050913          	mv	s2,a0
    s12 = new Semaphore(0);
    80001cd8:	00048513          	mv	a0,s1
    80001cdc:	00001097          	auipc	ra,0x1
    80001ce0:	478080e7          	jalr	1144(ra) # 80003154 <_ZdlPv>
    80001ce4:	00090513          	mv	a0,s2
    80001ce8:	0000c097          	auipc	ra,0xc
    80001cec:	6d0080e7          	jalr	1744(ra) # 8000e3b8 <_Unwind_Resume>
    80001cf0:	00050913          	mv	s2,a0
    s23 = new Semaphore(0);
    80001cf4:	00048513          	mv	a0,s1
    80001cf8:	00001097          	auipc	ra,0x1
    80001cfc:	45c080e7          	jalr	1116(ra) # 80003154 <_ZdlPv>
    80001d00:	00090513          	mv	a0,s2
    80001d04:	0000c097          	auipc	ra,0xc
    80001d08:	6b4080e7          	jalr	1716(ra) # 8000e3b8 <_Unwind_Resume>
    80001d0c:	00050493          	mv	s1,a0
    s31 = new Semaphore(1);
    80001d10:	00098513          	mv	a0,s3
    80001d14:	00001097          	auipc	ra,0x1
    80001d18:	440080e7          	jalr	1088(ra) # 80003154 <_ZdlPv>
    80001d1c:	00048513          	mv	a0,s1
    80001d20:	0000c097          	auipc	ra,0xc
    80001d24:	698080e7          	jalr	1688(ra) # 8000e3b8 <_Unwind_Resume>

0000000080001d28 <_ZN5timer18periodicActivationEv>:
    void periodicActivation() override{
    80001d28:	fe010113          	addi	sp,sp,-32
    80001d2c:	00113c23          	sd	ra,24(sp)
    80001d30:	00813823          	sd	s0,16(sp)
    80001d34:	00913423          	sd	s1,8(sp)
    80001d38:	02010413          	addi	s0,sp,32
    80001d3c:	00050493          	mv	s1,a0
        printString("Tajmer: ");
    80001d40:	00008517          	auipc	a0,0x8
    80001d44:	34850513          	addi	a0,a0,840 # 8000a088 <CONSOLE_STATUS+0x78>
    80001d48:	00004097          	auipc	ra,0x4
    80001d4c:	634080e7          	jalr	1588(ra) # 8000637c <_Z11printStringPKc>
        printInt(counter++);
    80001d50:	0284a503          	lw	a0,40(s1)
    80001d54:	0015079b          	addiw	a5,a0,1
    80001d58:	02f4a423          	sw	a5,40(s1)
    80001d5c:	00000613          	li	a2,0
    80001d60:	00a00593          	li	a1,10
    80001d64:	00004097          	auipc	ra,0x4
    80001d68:	7c8080e7          	jalr	1992(ra) # 8000652c <_Z8printIntiii>
        printString("\n");
    80001d6c:	00009517          	auipc	a0,0x9
    80001d70:	8f450513          	addi	a0,a0,-1804 # 8000a660 <CONSOLE_STATUS+0x650>
    80001d74:	00004097          	auipc	ra,0x4
    80001d78:	608080e7          	jalr	1544(ra) # 8000637c <_Z11printStringPKc>
    }
    80001d7c:	01813083          	ld	ra,24(sp)
    80001d80:	01013403          	ld	s0,16(sp)
    80001d84:	00813483          	ld	s1,8(sp)
    80001d88:	02010113          	addi	sp,sp,32
    80001d8c:	00008067          	ret

0000000080001d90 <_ZN5timerD1Ev>:
class timer:public PeriodicThread{
    80001d90:	ff010113          	addi	sp,sp,-16
    80001d94:	00113423          	sd	ra,8(sp)
    80001d98:	00813023          	sd	s0,0(sp)
    80001d9c:	01010413          	addi	s0,sp,16
private:
    sem_t myHandle;
};


class PeriodicThread : public Thread {
    80001da0:	0000b797          	auipc	a5,0xb
    80001da4:	2e07b783          	ld	a5,736(a5) # 8000d080 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001da8:	01078793          	addi	a5,a5,16
    80001dac:	00f53023          	sd	a5,0(a0)
    80001db0:	00001097          	auipc	ra,0x1
    80001db4:	274080e7          	jalr	628(ra) # 80003024 <_ZN6ThreadD1Ev>
    80001db8:	00813083          	ld	ra,8(sp)
    80001dbc:	00013403          	ld	s0,0(sp)
    80001dc0:	01010113          	addi	sp,sp,16
    80001dc4:	00008067          	ret

0000000080001dc8 <_ZN5timerD0Ev>:
    80001dc8:	fe010113          	addi	sp,sp,-32
    80001dcc:	00113c23          	sd	ra,24(sp)
    80001dd0:	00813823          	sd	s0,16(sp)
    80001dd4:	00913423          	sd	s1,8(sp)
    80001dd8:	02010413          	addi	s0,sp,32
    80001ddc:	00050493          	mv	s1,a0
    80001de0:	0000b797          	auipc	a5,0xb
    80001de4:	2a07b783          	ld	a5,672(a5) # 8000d080 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001de8:	01078793          	addi	a5,a5,16
    80001dec:	00f53023          	sd	a5,0(a0)
    80001df0:	00001097          	auipc	ra,0x1
    80001df4:	234080e7          	jalr	564(ra) # 80003024 <_ZN6ThreadD1Ev>
    80001df8:	00048513          	mv	a0,s1
    80001dfc:	00001097          	auipc	ra,0x1
    80001e00:	358080e7          	jalr	856(ra) # 80003154 <_ZdlPv>
    80001e04:	01813083          	ld	ra,24(sp)
    80001e08:	01013403          	ld	s0,16(sp)
    80001e0c:	00813483          	ld	s1,8(sp)
    80001e10:	02010113          	addi	sp,sp,32
    80001e14:	00008067          	ret

0000000080001e18 <_ZN9Scheduler3putEP3TCB>:

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    80001e18:	ff010113          	addi	sp,sp,-16
    80001e1c:	00813423          	sd	s0,8(sp)
    80001e20:	01010413          	addi	s0,sp,16
    if (tail == nullptr) {
    80001e24:	0000b797          	auipc	a5,0xb
    80001e28:	40c7b783          	ld	a5,1036(a5) # 8000d230 <_ZN9Scheduler4tailE>
    80001e2c:	02078263          	beqz	a5,80001e50 <_ZN9Scheduler3putEP3TCB+0x38>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    80001e30:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    80001e34:	0000b797          	auipc	a5,0xb
    80001e38:	3ea7be23          	sd	a0,1020(a5) # 8000d230 <_ZN9Scheduler4tailE>
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    static TCB* createThread(Body function, void* args, uint64* stack);

    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001e3c:	00100793          	li	a5,1
    80001e40:	04f52c23          	sw	a5,88(a0)
    }
    tcb->setStatus(TCB::ACTIVE);
}
    80001e44:	00813403          	ld	s0,8(sp)
    80001e48:	01010113          	addi	sp,sp,16
    80001e4c:	00008067          	ret
        head = tail = tcb;
    80001e50:	0000b797          	auipc	a5,0xb
    80001e54:	3e078793          	addi	a5,a5,992 # 8000d230 <_ZN9Scheduler4tailE>
    80001e58:	00a7b023          	sd	a0,0(a5)
    80001e5c:	00a7b423          	sd	a0,8(a5)
    80001e60:	fddff06f          	j	80001e3c <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001e64 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001e64:	ff010113          	addi	sp,sp,-16
    80001e68:	00813423          	sd	s0,8(sp)
    80001e6c:	01010413          	addi	s0,sp,16
    TCB* firstThread = head;
    80001e70:	0000b717          	auipc	a4,0xb
    80001e74:	3c070713          	addi	a4,a4,960 # 8000d230 <_ZN9Scheduler4tailE>
    80001e78:	00873503          	ld	a0,8(a4)
    head = head->nextInScheduler;
    80001e7c:	03053783          	ld	a5,48(a0)
    80001e80:	00f73423          	sd	a5,8(a4)
    if (head == nullptr) {
    80001e84:	00078a63          	beqz	a5,80001e98 <_ZN9Scheduler3getEv+0x34>
        tail = head = nullptr;
    }
    firstThread->nextInScheduler = nullptr;
    80001e88:	02053823          	sd	zero,48(a0)
    return firstThread;
}
    80001e8c:	00813403          	ld	s0,8(sp)
    80001e90:	01010113          	addi	sp,sp,16
    80001e94:	00008067          	ret
        tail = head = nullptr;
    80001e98:	00073423          	sd	zero,8(a4)
    80001e9c:	00073023          	sd	zero,0(a4)
    80001ea0:	fe9ff06f          	j	80001e88 <_ZN9Scheduler3getEv+0x24>

0000000080001ea4 <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    80001ea4:	ff010113          	addi	sp,sp,-16
    80001ea8:	00813423          	sd	s0,8(sp)
    80001eac:	01010413          	addi	s0,sp,16
    tcb->status = TCB::SLEEPING;
    80001eb0:	00400793          	li	a5,4
    80001eb4:	04f52c23          	sw	a5,88(a0)
    if (sleepingHead == nullptr) {
    80001eb8:	0000b817          	auipc	a6,0xb
    80001ebc:	38883803          	ld	a6,904(a6) # 8000d240 <_ZN9Scheduler12sleepingHeadE>
    80001ec0:	02080863          	beqz	a6,80001ef0 <_ZN9Scheduler10putToSleepEP3TCBm+0x4c>
        tcb->timeToSleep = sleepTime;
        return;
    }
    TCB* prevSleeping = nullptr;
    time_t accumulated = 0;
    TCB* current = sleepingHead;
    80001ec4:	00080793          	mv	a5,a6
    time_t accumulated = 0;
    80001ec8:	00000693          	li	a3,0
    TCB* prevSleeping = nullptr;
    80001ecc:	00000613          	li	a2,0
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001ed0:	02078863          	beqz	a5,80001f00 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
    80001ed4:	0387b703          	ld	a4,56(a5)
    80001ed8:	00d70733          	add	a4,a4,a3
    80001edc:	02b77263          	bgeu	a4,a1,80001f00 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
        accumulated += current->timeToSleep;
    80001ee0:	00070693          	mv	a3,a4
        prevSleeping = current;
    80001ee4:	00078613          	mv	a2,a5
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001ee8:	0407b783          	ld	a5,64(a5)
    80001eec:	fe5ff06f          	j	80001ed0 <_ZN9Scheduler10putToSleepEP3TCBm+0x2c>
        sleepingHead = tcb;
    80001ef0:	0000b797          	auipc	a5,0xb
    80001ef4:	34a7b823          	sd	a0,848(a5) # 8000d240 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80001ef8:	02b53c23          	sd	a1,56(a0)
        return;
    80001efc:	02c0006f          	j	80001f28 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    }
    if (!prevSleeping) {
    80001f00:	02060a63          	beqz	a2,80001f34 <_ZN9Scheduler10putToSleepEP3TCBm+0x90>
        sleepingHead = tcb;
        tcb->timeToSleep = sleepTime;
        tcb->nextSleeping->timeToSleep -= sleepTime;
        return;
    }
    tcb->nextSleeping = current;
    80001f04:	04f53023          	sd	a5,64(a0)
    prevSleeping->nextSleeping = tcb;
    80001f08:	04a63023          	sd	a0,64(a2)
    tcb->timeToSleep = sleepTime - accumulated;
    80001f0c:	40d58733          	sub	a4,a1,a3
    80001f10:	02e53c23          	sd	a4,56(a0)
    if (current) current->timeToSleep -= sleepTime - accumulated;
    80001f14:	00078a63          	beqz	a5,80001f28 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    80001f18:	40b686b3          	sub	a3,a3,a1
    80001f1c:	0387b703          	ld	a4,56(a5)
    80001f20:	00d706b3          	add	a3,a4,a3
    80001f24:	02d7bc23          	sd	a3,56(a5)
}
    80001f28:	00813403          	ld	s0,8(sp)
    80001f2c:	01010113          	addi	sp,sp,16
    80001f30:	00008067          	ret
        tcb->nextSleeping = sleepingHead;
    80001f34:	05053023          	sd	a6,64(a0)
        sleepingHead = tcb;
    80001f38:	0000b797          	auipc	a5,0xb
    80001f3c:	30a7b423          	sd	a0,776(a5) # 8000d240 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80001f40:	02b53c23          	sd	a1,56(a0)
        tcb->nextSleeping->timeToSleep -= sleepTime;
    80001f44:	03883683          	ld	a3,56(a6)
    80001f48:	40b686b3          	sub	a3,a3,a1
    80001f4c:	02d83c23          	sd	a3,56(a6)
        return;
    80001f50:	fd9ff06f          	j	80001f28 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>

0000000080001f54 <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
    if (!sleepingHead) return;
    80001f54:	0000b797          	auipc	a5,0xb
    80001f58:	2ec7b783          	ld	a5,748(a5) # 8000d240 <_ZN9Scheduler12sleepingHeadE>
    80001f5c:	06078a63          	beqz	a5,80001fd0 <_ZN9Scheduler4wakeEv+0x7c>
    sleepingHead->timeToSleep--;
    80001f60:	0387b703          	ld	a4,56(a5)
    80001f64:	fff70713          	addi	a4,a4,-1
    80001f68:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001f6c:	0000b517          	auipc	a0,0xb
    80001f70:	2d453503          	ld	a0,724(a0) # 8000d240 <_ZN9Scheduler12sleepingHeadE>
    80001f74:	04050e63          	beqz	a0,80001fd0 <_ZN9Scheduler4wakeEv+0x7c>
    80001f78:	03853783          	ld	a5,56(a0)
    80001f7c:	04079a63          	bnez	a5,80001fd0 <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    80001f80:	ff010113          	addi	sp,sp,-16
    80001f84:	00113423          	sd	ra,8(sp)
    80001f88:	00813023          	sd	s0,0(sp)
    80001f8c:	01010413          	addi	s0,sp,16
    80001f90:	00c0006f          	j	80001f9c <_ZN9Scheduler4wakeEv+0x48>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001f94:	03853783          	ld	a5,56(a0)
    80001f98:	02079463          	bnez	a5,80001fc0 <_ZN9Scheduler4wakeEv+0x6c>
        TCB* thread = sleepingHead;
        sleepingHead = sleepingHead->nextSleeping;
    80001f9c:	04053783          	ld	a5,64(a0)
    80001fa0:	0000b717          	auipc	a4,0xb
    80001fa4:	2af73023          	sd	a5,672(a4) # 8000d240 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    80001fa8:	04053023          	sd	zero,64(a0)
        Scheduler::put(thread);
    80001fac:	00000097          	auipc	ra,0x0
    80001fb0:	e6c080e7          	jalr	-404(ra) # 80001e18 <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001fb4:	0000b517          	auipc	a0,0xb
    80001fb8:	28c53503          	ld	a0,652(a0) # 8000d240 <_ZN9Scheduler12sleepingHeadE>
    80001fbc:	fc051ce3          	bnez	a0,80001f94 <_ZN9Scheduler4wakeEv+0x40>
    }
}
    80001fc0:	00813083          	ld	ra,8(sp)
    80001fc4:	00013403          	ld	s0,0(sp)
    80001fc8:	01010113          	addi	sp,sp,16
    80001fcc:	00008067          	ret
    80001fd0:	00008067          	ret

0000000080001fd4 <_ZN7KMemory7kmallocEm>:
    kmalloc(blocksForBitVector);

    initialized = true;
}

void* KMemory::kmalloc(size_t size) {
    80001fd4:	ff010113          	addi	sp,sp,-16
    80001fd8:	00813423          	sd	s0,8(sp)
    80001fdc:	01010413          	addi	s0,sp,16
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80001fe0:	16050063          	beqz	a0,80002140 <_ZN7KMemory7kmallocEm+0x16c>
    80001fe4:	0000b797          	auipc	a5,0xb
    80001fe8:	2647b783          	ld	a5,612(a5) # 8000d248 <_ZN7KMemory14freeBlocksLeftE>
    80001fec:	14a7ee63          	bltu	a5,a0,80002148 <_ZN7KMemory7kmallocEm+0x174>
    uint64 currentElem = 0;
    uint64 currentBit = 63;
    uint64 firstZeroElem = 0;
    uint64 firstZeroBit = 63;
    uint64 zerosFound = 0;
    bool zeroFound = false;
    80001ff0:	00000313          	li	t1,0
    uint64 zerosFound = 0;
    80001ff4:	00000713          	li	a4,0
    uint64 firstZeroBit = 63;
    80001ff8:	03f00813          	li	a6,63
    uint64 firstZeroElem = 0;
    80001ffc:	00000893          	li	a7,0
    uint64 currentBit = 63;
    80002000:	03f00793          	li	a5,63
    uint64 currentElem = 0;
    80002004:	00000593          	li	a1,0
    80002008:	0080006f          	j	80002010 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroElem = currentElem;
        } else {
            zerosFound++;
        }
        if (zerosFound == size) break;
        if (currentBit-- == 0) {
    8000200c:	00068793          	mv	a5,a3
    while (currentElem < sizeOfBitVectorInUint64) {
    80002010:	0000b697          	auipc	a3,0xb
    80002014:	2406b683          	ld	a3,576(a3) # 8000d250 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80002018:	08d5fa63          	bgeu	a1,a3,800020ac <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    8000201c:	03f00693          	li	a3,63
    80002020:	02d78a63          	beq	a5,a3,80002054 <_ZN7KMemory7kmallocEm+0x80>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    80002024:	00359693          	slli	a3,a1,0x3
    80002028:	0000b617          	auipc	a2,0xb
    8000202c:	23063603          	ld	a2,560(a2) # 8000d258 <_ZN7KMemory9bitVectorE>
    80002030:	00d606b3          	add	a3,a2,a3
    80002034:	0006b683          	ld	a3,0(a3)

    static uint64 freeBlocksLeft;

    //maska sa 1 na mestu bitPos i ostalim nulama (bitPos=0..63)
    inline static uint64 maskBit(uint64 bitPos) {
        return (uint64)1 << bitPos;
    80002038:	00100613          	li	a2,1
    8000203c:	00f61633          	sll	a2,a2,a5
    80002040:	00c6f6b3          	and	a3,a3,a2
        if (bit > 0) {
    80002044:	02069a63          	bnez	a3,80002078 <_ZN7KMemory7kmallocEm+0xa4>
        } else if (!zeroFound) {
    80002048:	04030863          	beqz	t1,80002098 <_ZN7KMemory7kmallocEm+0xc4>
            zerosFound++;
    8000204c:	00170713          	addi	a4,a4,1
    80002050:	0300006f          	j	80002080 <_ZN7KMemory7kmallocEm+0xac>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80002054:	00359693          	slli	a3,a1,0x3
    80002058:	0000b617          	auipc	a2,0xb
    8000205c:	20063603          	ld	a2,512(a2) # 8000d258 <_ZN7KMemory9bitVectorE>
    80002060:	00d606b3          	add	a3,a2,a3
    80002064:	0006b603          	ld	a2,0(a3)
    80002068:	fff00693          	li	a3,-1
    8000206c:	fad61ce3          	bne	a2,a3,80002024 <_ZN7KMemory7kmallocEm+0x50>
            currentElem++;
    80002070:	00158593          	addi	a1,a1,1
            continue;
    80002074:	f9dff06f          	j	80002010 <_ZN7KMemory7kmallocEm+0x3c>
            zeroFound = false;
    80002078:	00000313          	li	t1,0
            zerosFound = 0;
    8000207c:	00000713          	li	a4,0
        if (zerosFound == size) break;
    80002080:	02a70663          	beq	a4,a0,800020ac <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit-- == 0) {
    80002084:	fff78693          	addi	a3,a5,-1
    80002088:	f80792e3          	bnez	a5,8000200c <_ZN7KMemory7kmallocEm+0x38>
            currentBit = 63;
            currentElem++;
    8000208c:	00158593          	addi	a1,a1,1
            currentBit = 63;
    80002090:	03f00793          	li	a5,63
    80002094:	f7dff06f          	j	80002010 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroBit = currentBit;
    80002098:	00078813          	mv	a6,a5
            firstZeroElem = currentElem;
    8000209c:	00058893          	mv	a7,a1
            zeroFound = true;
    800020a0:	00100313          	li	t1,1
            zerosFound = 1;
    800020a4:	00100713          	li	a4,1
    800020a8:	fd9ff06f          	j	80002080 <_ZN7KMemory7kmallocEm+0xac>
        }
    }
    if (zerosFound != size) return nullptr;
    800020ac:	0aa71263          	bne	a4,a0,80002150 <_ZN7KMemory7kmallocEm+0x17c>

    //alociranje blokova
    uint64 blockNum = firstZeroElem * 64 + (63 - firstZeroBit);
    800020b0:	00689793          	slli	a5,a7,0x6
    800020b4:	410787b3          	sub	a5,a5,a6
    800020b8:	03f78793          	addi	a5,a5,63
    void* addr = (char*)HEAP_START_ADDR + blockNum * MEM_BLOCK_SIZE;
    800020bc:	0000b697          	auipc	a3,0xb
    800020c0:	fbc6b683          	ld	a3,-68(a3) # 8000d078 <_GLOBAL_OFFSET_TABLE_+0x30>
    800020c4:	0006b583          	ld	a1,0(a3)
    800020c8:	00679793          	slli	a5,a5,0x6
    800020cc:	00f585b3          	add	a1,a1,a5
    *(uint64*)addr = size;  //da znamo koliko blokova je alocirano zaredom
    800020d0:	00a5b023          	sd	a0,0(a1)

    //upisivanje 1 u bit vektor
    currentElem = firstZeroElem;
    currentBit = firstZeroBit;
    800020d4:	0080006f          	j	800020dc <_ZN7KMemory7kmallocEm+0x108>
    while (zerosFound > 0) {
        bitVector[currentElem] |= maskBit(currentBit);
        zerosFound--;
        if (currentBit-- == 0) {
            currentBit = 63;
    800020d8:	00078813          	mv	a6,a5
    while (zerosFound > 0) {
    800020dc:	04070063          	beqz	a4,8000211c <_ZN7KMemory7kmallocEm+0x148>
    800020e0:	00100693          	li	a3,1
    800020e4:	01069633          	sll	a2,a3,a6
        bitVector[currentElem] |= maskBit(currentBit);
    800020e8:	00389793          	slli	a5,a7,0x3
    800020ec:	0000b697          	auipc	a3,0xb
    800020f0:	16c6b683          	ld	a3,364(a3) # 8000d258 <_ZN7KMemory9bitVectorE>
    800020f4:	00f687b3          	add	a5,a3,a5
    800020f8:	0007b683          	ld	a3,0(a5)
    800020fc:	00c6e6b3          	or	a3,a3,a2
    80002100:	00d7b023          	sd	a3,0(a5)
        zerosFound--;
    80002104:	fff70713          	addi	a4,a4,-1
        if (currentBit-- == 0) {
    80002108:	fff80793          	addi	a5,a6,-1
    8000210c:	fc0816e3          	bnez	a6,800020d8 <_ZN7KMemory7kmallocEm+0x104>
            currentElem++;
    80002110:	00188893          	addi	a7,a7,1
            currentBit = 63;
    80002114:	03f00793          	li	a5,63
    80002118:	fc1ff06f          	j	800020d8 <_ZN7KMemory7kmallocEm+0x104>
        }
    }
    freeBlocksLeft -= size;
    8000211c:	0000b717          	auipc	a4,0xb
    80002120:	12c70713          	addi	a4,a4,300 # 8000d248 <_ZN7KMemory14freeBlocksLeftE>
    80002124:	00073783          	ld	a5,0(a4)
    80002128:	40a78533          	sub	a0,a5,a0
    8000212c:	00a73023          	sd	a0,0(a4)
    return (char*)addr + 2 * sizeof(uint64);    //offset 2 da bi bilo zaokruzeno na 16 zbog steka
    80002130:	01058513          	addi	a0,a1,16
}
    80002134:	00813403          	ld	s0,8(sp)
    80002138:	01010113          	addi	sp,sp,16
    8000213c:	00008067          	ret
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80002140:	00000513          	li	a0,0
    80002144:	ff1ff06f          	j	80002134 <_ZN7KMemory7kmallocEm+0x160>
    80002148:	00000513          	li	a0,0
    8000214c:	fe9ff06f          	j	80002134 <_ZN7KMemory7kmallocEm+0x160>
    if (zerosFound != size) return nullptr;
    80002150:	00000513          	li	a0,0
    80002154:	fe1ff06f          	j	80002134 <_ZN7KMemory7kmallocEm+0x160>

0000000080002158 <_ZN7KMemory16initializeMemoryEv>:
    if (initialized) return;
    80002158:	0000b797          	auipc	a5,0xb
    8000215c:	1087c783          	lbu	a5,264(a5) # 8000d260 <_ZN7KMemory11initializedE>
    80002160:	0a079863          	bnez	a5,80002210 <_ZN7KMemory16initializeMemoryEv+0xb8>
void KMemory::initializeMemory() {
    80002164:	ff010113          	addi	sp,sp,-16
    80002168:	00113423          	sd	ra,8(sp)
    8000216c:	00813023          	sd	s0,0(sp)
    80002170:	01010413          	addi	s0,sp,16
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80002174:	0000b797          	auipc	a5,0xb
    80002178:	f5c7b783          	ld	a5,-164(a5) # 8000d0d0 <_GLOBAL_OFFSET_TABLE_+0x88>
    8000217c:	0007b783          	ld	a5,0(a5)
    80002180:	0000b717          	auipc	a4,0xb
    80002184:	ef873703          	ld	a4,-264(a4) # 8000d078 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002188:	00073603          	ld	a2,0(a4)
    8000218c:	40c787b3          	sub	a5,a5,a2
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    80002190:	00c7d793          	srli	a5,a5,0xc
    80002194:	0000b717          	auipc	a4,0xb
    80002198:	0b470713          	addi	a4,a4,180 # 8000d248 <_ZN7KMemory14freeBlocksLeftE>
    8000219c:	00f73423          	sd	a5,8(a4)
    numOfBlocks = sizeOfBitVectorInUint64 * sizeof(uint64) * 8; //da se zaokruzi broj postojecih blokova na umnozak 64
    800021a0:	00679693          	slli	a3,a5,0x6
    800021a4:	02d73023          	sd	a3,32(a4)
    uint64 blocksForBitVector = (sizeOfBitVectorInUint64 * sizeof(uint64) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    800021a8:	00878513          	addi	a0,a5,8
    800021ac:	00351513          	slli	a0,a0,0x3
    800021b0:	fff50513          	addi	a0,a0,-1
    800021b4:	00655513          	srli	a0,a0,0x6
    bitVector = (uint64*)HEAP_START_ADDR;
    800021b8:	00c73823          	sd	a2,16(a4)
    freeBlocksLeft = numOfBlocks;
    800021bc:	00d73023          	sd	a3,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    800021c0:	00000793          	li	a5,0
    800021c4:	0000b717          	auipc	a4,0xb
    800021c8:	08c73703          	ld	a4,140(a4) # 8000d250 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    800021cc:	02e7f063          	bgeu	a5,a4,800021ec <_ZN7KMemory16initializeMemoryEv+0x94>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    800021d0:	00379693          	slli	a3,a5,0x3
    800021d4:	0000b717          	auipc	a4,0xb
    800021d8:	08473703          	ld	a4,132(a4) # 8000d258 <_ZN7KMemory9bitVectorE>
    800021dc:	00d70733          	add	a4,a4,a3
    800021e0:	00073023          	sd	zero,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    800021e4:	00178793          	addi	a5,a5,1
    800021e8:	fddff06f          	j	800021c4 <_ZN7KMemory16initializeMemoryEv+0x6c>
    kmalloc(blocksForBitVector);
    800021ec:	00000097          	auipc	ra,0x0
    800021f0:	de8080e7          	jalr	-536(ra) # 80001fd4 <_ZN7KMemory7kmallocEm>
    initialized = true;
    800021f4:	00100793          	li	a5,1
    800021f8:	0000b717          	auipc	a4,0xb
    800021fc:	06f70423          	sb	a5,104(a4) # 8000d260 <_ZN7KMemory11initializedE>
}
    80002200:	00813083          	ld	ra,8(sp)
    80002204:	00013403          	ld	s0,0(sp)
    80002208:	01010113          	addi	sp,sp,16
    8000220c:	00008067          	ret
    80002210:	00008067          	ret

0000000080002214 <_ZN7KMemory5kfreeEPv>:

int KMemory::kfree(void* ptr) {
    80002214:	ff010113          	addi	sp,sp,-16
    80002218:	00813423          	sd	s0,8(sp)
    8000221c:	01010413          	addi	s0,sp,16
    if (!ptr) return 0;
    80002220:	08050a63          	beqz	a0,800022b4 <_ZN7KMemory5kfreeEPv+0xa0>
    ptr = (char*)ptr - 2 * sizeof(uint64);
    80002224:	ff050793          	addi	a5,a0,-16
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80002228:	0000b717          	auipc	a4,0xb
    8000222c:	e5073703          	ld	a4,-432(a4) # 8000d078 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002230:	00073703          	ld	a4,0(a4)
    80002234:	40e787b3          	sub	a5,a5,a4
    80002238:	03f7f713          	andi	a4,a5,63
    8000223c:	08071063          	bnez	a4,800022bc <_ZN7KMemory5kfreeEPv+0xa8>
    uint64 blocksToFree = *(uint64*)ptr;
    80002240:	ff053583          	ld	a1,-16(a0)
    freeBlocksLeft += blocksToFree;
    80002244:	0000b697          	auipc	a3,0xb
    80002248:	00468693          	addi	a3,a3,4 # 8000d248 <_ZN7KMemory14freeBlocksLeftE>
    8000224c:	0006b703          	ld	a4,0(a3)
    80002250:	00b70733          	add	a4,a4,a1
    80002254:	00e6b023          	sd	a4,0(a3)
    uint64 blockNum = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    80002258:	0067d613          	srli	a2,a5,0x6
    uint64 currentElem = blockNum / 64;
    8000225c:	00c7d513          	srli	a0,a5,0xc
    uint64 currentBit = 63 - blockNum % 64;
    80002260:	fff64613          	not	a2,a2
    80002264:	03f67613          	andi	a2,a2,63
    80002268:	0080006f          	j	80002270 <_ZN7KMemory5kfreeEPv+0x5c>
    while (blocksToFree > 0) {
        bitVector[currentElem] &= ~maskBit(currentBit);
        blocksToFree--;
        if (currentBit-- == 0) {
            currentBit = 63;
    8000226c:	00078613          	mv	a2,a5
    while (blocksToFree > 0) {
    80002270:	04058a63          	beqz	a1,800022c4 <_ZN7KMemory5kfreeEPv+0xb0>
    80002274:	00100793          	li	a5,1
    80002278:	00c797b3          	sll	a5,a5,a2
        bitVector[currentElem] &= ~maskBit(currentBit);
    8000227c:	fff7c793          	not	a5,a5
    80002280:	00351713          	slli	a4,a0,0x3
    80002284:	0000b697          	auipc	a3,0xb
    80002288:	fd46b683          	ld	a3,-44(a3) # 8000d258 <_ZN7KMemory9bitVectorE>
    8000228c:	00e68733          	add	a4,a3,a4
    80002290:	00073683          	ld	a3,0(a4)
    80002294:	00f6f7b3          	and	a5,a3,a5
    80002298:	00f73023          	sd	a5,0(a4)
        blocksToFree--;
    8000229c:	fff58593          	addi	a1,a1,-1
        if (currentBit-- == 0) {
    800022a0:	fff60793          	addi	a5,a2,-1
    800022a4:	fc0614e3          	bnez	a2,8000226c <_ZN7KMemory5kfreeEPv+0x58>
            currentElem++;
    800022a8:	00150513          	addi	a0,a0,1
            currentBit = 63;
    800022ac:	03f00793          	li	a5,63
    800022b0:	fbdff06f          	j	8000226c <_ZN7KMemory5kfreeEPv+0x58>
    if (!ptr) return 0;
    800022b4:	00000513          	li	a0,0
    800022b8:	0100006f          	j	800022c8 <_ZN7KMemory5kfreeEPv+0xb4>
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    800022bc:	fff00513          	li	a0,-1
    800022c0:	0080006f          	j	800022c8 <_ZN7KMemory5kfreeEPv+0xb4>
        }
    }
    return 0;
    800022c4:	00000513          	li	a0,0
}
    800022c8:	00813403          	ld	s0,8(sp)
    800022cc:	01010113          	addi	sp,sp,16
    800022d0:	00008067          	ret

00000000800022d4 <main>:
extern "C" void interruptHandler();

void userMain();

void user(void*);
int main() {
    800022d4:	fc010113          	addi	sp,sp,-64
    800022d8:	02113c23          	sd	ra,56(sp)
    800022dc:	02813823          	sd	s0,48(sp)
    800022e0:	02913423          	sd	s1,40(sp)
    800022e4:	03213023          	sd	s2,32(sp)
    800022e8:	01313c23          	sd	s3,24(sp)
    800022ec:	04010413          	addi	s0,sp,64
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    800022f0:	0000b797          	auipc	a5,0xb
    800022f4:	de87b783          	ld	a5,-536(a5) # 8000d0d8 <_GLOBAL_OFFSET_TABLE_+0x90>
    800022f8:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    800022fc:	00000097          	auipc	ra,0x0
    80002300:	e5c080e7          	jalr	-420(ra) # 80002158 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80002304:	fffff097          	auipc	ra,0xfffff
    80002308:	408080e7          	jalr	1032(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>

    //pravljenje niti
    thread_t mainHandle;
    Thread* idleHandle = new IdleThread();
    8000230c:	02000513          	li	a0,32
    80002310:	00001097          	auipc	ra,0x1
    80002314:	df4080e7          	jalr	-524(ra) # 80003104 <_Znwm>
    80002318:	00050913          	mv	s2,a0
    8000231c:	00053023          	sd	zero,0(a0)
    80002320:	00053423          	sd	zero,8(a0)
    80002324:	00053823          	sd	zero,16(a0)
    80002328:	00053c23          	sd	zero,24(a0)
class IdleThread : public Thread {
    8000232c:	00001097          	auipc	ra,0x1
    80002330:	0c8080e7          	jalr	200(ra) # 800033f4 <_ZN6ThreadC1Ev>
    80002334:	0000b797          	auipc	a5,0xb
    80002338:	ab478793          	addi	a5,a5,-1356 # 8000cde8 <_ZTV10IdleThread+0x10>
    8000233c:	00f93023          	sd	a5,0(s2)
    Thread* consoleOutputHandle = new KernelConsumer();
    80002340:	02000513          	li	a0,32
    80002344:	00001097          	auipc	ra,0x1
    80002348:	dc0080e7          	jalr	-576(ra) # 80003104 <_Znwm>
    8000234c:	00050493          	mv	s1,a0
    80002350:	00053023          	sd	zero,0(a0)
    80002354:	00053423          	sd	zero,8(a0)
    80002358:	00053823          	sd	zero,16(a0)
    8000235c:	00053c23          	sd	zero,24(a0)
class KernelConsumer : public Thread {
    80002360:	00001097          	auipc	ra,0x1
    80002364:	094080e7          	jalr	148(ra) # 800033f4 <_ZN6ThreadC1Ev>
    80002368:	0000b797          	auipc	a5,0xb
    8000236c:	aa878793          	addi	a5,a5,-1368 # 8000ce10 <_ZTV14KernelConsumer+0x10>
    80002370:	00f4b023          	sd	a5,0(s1)
    //Thread* userThr = new Thread((TCB::Body)userMain, nullptr);
    Thread* userThr = new Thread(user, nullptr);
    80002374:	02000513          	li	a0,32
    80002378:	00001097          	auipc	ra,0x1
    8000237c:	d8c080e7          	jalr	-628(ra) # 80003104 <_Znwm>
    80002380:	00050993          	mv	s3,a0
    80002384:	00000613          	li	a2,0
    80002388:	0000b597          	auipc	a1,0xb
    8000238c:	d285b583          	ld	a1,-728(a1) # 8000d0b0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002390:	00001097          	auipc	ra,0x1
    80002394:	e94080e7          	jalr	-364(ra) # 80003224 <_ZN6ThreadC1EPFvPvES0_>
    80002398:	0580006f          	j	800023f0 <main+0x11c>
    8000239c:	00050493          	mv	s1,a0
    Thread* idleHandle = new IdleThread();
    800023a0:	00090513          	mv	a0,s2
    800023a4:	00001097          	auipc	ra,0x1
    800023a8:	db0080e7          	jalr	-592(ra) # 80003154 <_ZdlPv>
    800023ac:	00048513          	mv	a0,s1
    800023b0:	0000c097          	auipc	ra,0xc
    800023b4:	008080e7          	jalr	8(ra) # 8000e3b8 <_Unwind_Resume>
    800023b8:	00050913          	mv	s2,a0
    Thread* consoleOutputHandle = new KernelConsumer();
    800023bc:	00048513          	mv	a0,s1
    800023c0:	00001097          	auipc	ra,0x1
    800023c4:	d94080e7          	jalr	-620(ra) # 80003154 <_ZdlPv>
    800023c8:	00090513          	mv	a0,s2
    800023cc:	0000c097          	auipc	ra,0xc
    800023d0:	fec080e7          	jalr	-20(ra) # 8000e3b8 <_Unwind_Resume>
    800023d4:	00050493          	mv	s1,a0
    Thread* userThr = new Thread(user, nullptr);
    800023d8:	00098513          	mv	a0,s3
    800023dc:	00001097          	auipc	ra,0x1
    800023e0:	d78080e7          	jalr	-648(ra) # 80003154 <_ZdlPv>
    800023e4:	00048513          	mv	a0,s1
    800023e8:	0000c097          	auipc	ra,0xc
    800023ec:	fd0080e7          	jalr	-48(ra) # 8000e3b8 <_Unwind_Resume>
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    800023f0:	00000613          	li	a2,0
    800023f4:	00000597          	auipc	a1,0x0
    800023f8:	ee058593          	addi	a1,a1,-288 # 800022d4 <main>
    800023fc:	fc840513          	addi	a0,s0,-56
    80002400:	fffff097          	auipc	ra,0xfffff
    80002404:	004080e7          	jalr	4(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80002408:	fc843783          	ld	a5,-56(s0)

    ThreadQueue* getListOfJoiningThreads() { return &waitingToJoin; }

    void setMySemaphore(KSem* sem) { mySemaphore = sem; }

    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }
    8000240c:	0000b717          	auipc	a4,0xb
    80002410:	cbc73703          	ld	a4,-836(a4) # 8000d0c8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002414:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80002418:	00100713          	li	a4,1
    8000241c:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    idleHandle->start();
    80002420:	00090513          	mv	a0,s2
    80002424:	00001097          	auipc	ra,0x1
    80002428:	e98080e7          	jalr	-360(ra) # 800032bc <_ZN6Thread5startEv>
    consoleOutputHandle->start();
    8000242c:	00048513          	mv	a0,s1
    80002430:	00001097          	auipc	ra,0x1
    80002434:	e8c080e7          	jalr	-372(ra) # 800032bc <_ZN6Thread5startEv>
    userThr->start();
    80002438:	00098513          	mv	a0,s3
    8000243c:	00001097          	auipc	ra,0x1
    80002440:	e80080e7          	jalr	-384(ra) # 800032bc <_ZN6Thread5startEv>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002444:	00200493          	li	s1,2
    80002448:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    userThr->join();
    8000244c:	00098513          	mv	a0,s3
    80002450:	00001097          	auipc	ra,0x1
    80002454:	eb4080e7          	jalr	-332(ra) # 80003304 <_ZN6Thread4joinEv>
    //stavlja karakter u ulazni bafer; ako je bafer pun, ignorise se
    static void placeInInput(char c);

    //ispis svih preostalih karaktera u izlaznom baferu
    static void flush() {
        __asm__ volatile("li a0, 0x43");
    80002458:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    8000245c:	00000073          	ecall
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002460:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80002464:	00000513          	li	a0,0
    80002468:	03813083          	ld	ra,56(sp)
    8000246c:	03013403          	ld	s0,48(sp)
    80002470:	02813483          	ld	s1,40(sp)
    80002474:	02013903          	ld	s2,32(sp)
    80002478:	01813983          	ld	s3,24(sp)
    8000247c:	04010113          	addi	sp,sp,64
    80002480:	00008067          	ret

0000000080002484 <_ZN10IdleThread3runEv>:
    void run() override {
    80002484:	ff010113          	addi	sp,sp,-16
    80002488:	00113423          	sd	ra,8(sp)
    8000248c:	00813023          	sd	s0,0(sp)
    80002490:	01010413          	addi	s0,sp,16
        while (1) { thread_dispatch(); }
    80002494:	fffff097          	auipc	ra,0xfffff
    80002498:	02c080e7          	jalr	44(ra) # 800014c0 <_Z15thread_dispatchv>
    8000249c:	ff9ff06f          	j	80002494 <_ZN10IdleThread3runEv+0x10>

00000000800024a0 <_ZN10IdleThreadD1Ev>:
class IdleThread : public Thread {
    800024a0:	ff010113          	addi	sp,sp,-16
    800024a4:	00113423          	sd	ra,8(sp)
    800024a8:	00813023          	sd	s0,0(sp)
    800024ac:	01010413          	addi	s0,sp,16
    800024b0:	0000b797          	auipc	a5,0xb
    800024b4:	93878793          	addi	a5,a5,-1736 # 8000cde8 <_ZTV10IdleThread+0x10>
    800024b8:	00f53023          	sd	a5,0(a0)
    800024bc:	00001097          	auipc	ra,0x1
    800024c0:	b68080e7          	jalr	-1176(ra) # 80003024 <_ZN6ThreadD1Ev>
    800024c4:	00813083          	ld	ra,8(sp)
    800024c8:	00013403          	ld	s0,0(sp)
    800024cc:	01010113          	addi	sp,sp,16
    800024d0:	00008067          	ret

00000000800024d4 <_ZN10IdleThreadD0Ev>:
    800024d4:	fe010113          	addi	sp,sp,-32
    800024d8:	00113c23          	sd	ra,24(sp)
    800024dc:	00813823          	sd	s0,16(sp)
    800024e0:	00913423          	sd	s1,8(sp)
    800024e4:	02010413          	addi	s0,sp,32
    800024e8:	00050493          	mv	s1,a0
    800024ec:	0000b797          	auipc	a5,0xb
    800024f0:	8fc78793          	addi	a5,a5,-1796 # 8000cde8 <_ZTV10IdleThread+0x10>
    800024f4:	00f53023          	sd	a5,0(a0)
    800024f8:	00001097          	auipc	ra,0x1
    800024fc:	b2c080e7          	jalr	-1236(ra) # 80003024 <_ZN6ThreadD1Ev>
    80002500:	00048513          	mv	a0,s1
    80002504:	00001097          	auipc	ra,0x1
    80002508:	c50080e7          	jalr	-944(ra) # 80003154 <_ZdlPv>
    8000250c:	01813083          	ld	ra,24(sp)
    80002510:	01013403          	ld	s0,16(sp)
    80002514:	00813483          	ld	s1,8(sp)
    80002518:	02010113          	addi	sp,sp,32
    8000251c:	00008067          	ret

0000000080002520 <_ZN14KernelConsumerD1Ev>:
class KernelConsumer : public Thread {
    80002520:	ff010113          	addi	sp,sp,-16
    80002524:	00113423          	sd	ra,8(sp)
    80002528:	00813023          	sd	s0,0(sp)
    8000252c:	01010413          	addi	s0,sp,16
    80002530:	0000b797          	auipc	a5,0xb
    80002534:	8e078793          	addi	a5,a5,-1824 # 8000ce10 <_ZTV14KernelConsumer+0x10>
    80002538:	00f53023          	sd	a5,0(a0)
    8000253c:	00001097          	auipc	ra,0x1
    80002540:	ae8080e7          	jalr	-1304(ra) # 80003024 <_ZN6ThreadD1Ev>
    80002544:	00813083          	ld	ra,8(sp)
    80002548:	00013403          	ld	s0,0(sp)
    8000254c:	01010113          	addi	sp,sp,16
    80002550:	00008067          	ret

0000000080002554 <_ZN14KernelConsumerD0Ev>:
    80002554:	fe010113          	addi	sp,sp,-32
    80002558:	00113c23          	sd	ra,24(sp)
    8000255c:	00813823          	sd	s0,16(sp)
    80002560:	00913423          	sd	s1,8(sp)
    80002564:	02010413          	addi	s0,sp,32
    80002568:	00050493          	mv	s1,a0
    8000256c:	0000b797          	auipc	a5,0xb
    80002570:	8a478793          	addi	a5,a5,-1884 # 8000ce10 <_ZTV14KernelConsumer+0x10>
    80002574:	00f53023          	sd	a5,0(a0)
    80002578:	00001097          	auipc	ra,0x1
    8000257c:	aac080e7          	jalr	-1364(ra) # 80003024 <_ZN6ThreadD1Ev>
    80002580:	00048513          	mv	a0,s1
    80002584:	00001097          	auipc	ra,0x1
    80002588:	bd0080e7          	jalr	-1072(ra) # 80003154 <_ZdlPv>
    8000258c:	01813083          	ld	ra,24(sp)
    80002590:	01013403          	ld	s0,16(sp)
    80002594:	00813483          	ld	s1,8(sp)
    80002598:	02010113          	addi	sp,sp,32
    8000259c:	00008067          	ret

00000000800025a0 <_ZN14KernelConsumer3runEv>:
    void run() override {
    800025a0:	ff010113          	addi	sp,sp,-16
    800025a4:	00113423          	sd	ra,8(sp)
    800025a8:	00813023          	sd	s0,0(sp)
    800025ac:	01010413          	addi	s0,sp,16
    800025b0:	0280006f          	j	800025d8 <_ZN14KernelConsumer3runEv+0x38>

    static uint8 getSRvalue() { return *sr; }

    static uint8 getDRvalue() { return *dr; }

    static void setDRvalue(char c) { *dr = c; }
    800025b4:	0000b797          	auipc	a5,0xb
    800025b8:	af47b783          	ld	a5,-1292(a5) # 8000d0a8 <_GLOBAL_OFFSET_TABLE_+0x60>
    800025bc:	0007b783          	ld	a5,0(a5)
    800025c0:	00a78023          	sb	a0,0(a5)
            sem_signal(KConsole::getOutputBufferHasSpace());
    800025c4:	0000b797          	auipc	a5,0xb
    800025c8:	afc7b783          	ld	a5,-1284(a5) # 8000d0c0 <_GLOBAL_OFFSET_TABLE_+0x78>
    800025cc:	0007b503          	ld	a0,0(a5)
    800025d0:	fffff097          	auipc	ra,0xfffff
    800025d4:	000080e7          	jalr	ra # 800015d0 <_Z10sem_signalP4KSem>
            char c = KConsole::getFromOutput();
    800025d8:	fffff097          	auipc	ra,0xfffff
    800025dc:	1ec080e7          	jalr	492(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    800025e0:	0000b797          	auipc	a5,0xb
    800025e4:	b187b783          	ld	a5,-1256(a5) # 8000d0f8 <_GLOBAL_OFFSET_TABLE_+0xb0>
    800025e8:	0007b783          	ld	a5,0(a5)
    800025ec:	0007c783          	lbu	a5,0(a5)
            while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    800025f0:	0207f793          	andi	a5,a5,32
    800025f4:	fe0786e3          	beqz	a5,800025e0 <_ZN14KernelConsumer3runEv+0x40>
    800025f8:	fbdff06f          	j	800025b4 <_ZN14KernelConsumer3runEv+0x14>

00000000800025fc <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    800025fc:	ff010113          	addi	sp,sp,-16
    80002600:	00113423          	sd	ra,8(sp)
    80002604:	00813023          	sd	s0,0(sp)
    80002608:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    8000260c:	fffff097          	auipc	ra,0xfffff
    80002610:	eb4080e7          	jalr	-332(ra) # 800014c0 <_Z15thread_dispatchv>
    80002614:	ff9ff06f          	j	8000260c <_Z4idlePv+0x10>

0000000080002618 <_Z22kernelConsumerFunctionPv>:
}

//salje na izlaz karakter iz izlaznog bafera KConsole
void kernelConsumerFunction(void*) {
    80002618:	ff010113          	addi	sp,sp,-16
    8000261c:	00113423          	sd	ra,8(sp)
    80002620:	00813023          	sd	s0,0(sp)
    80002624:	01010413          	addi	s0,sp,16
    80002628:	0280006f          	j	80002650 <_Z22kernelConsumerFunctionPv+0x38>
    static void setDRvalue(char c) { *dr = c; }
    8000262c:	0000b797          	auipc	a5,0xb
    80002630:	a7c7b783          	ld	a5,-1412(a5) # 8000d0a8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002634:	0007b783          	ld	a5,0(a5)
    80002638:	00a78023          	sb	a0,0(a5)
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
        KConsole::setDRvalue(c);
        sem_signal(KConsole::getOutputBufferHasSpace());
    8000263c:	0000b797          	auipc	a5,0xb
    80002640:	a847b783          	ld	a5,-1404(a5) # 8000d0c0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80002644:	0007b503          	ld	a0,0(a5)
    80002648:	fffff097          	auipc	ra,0xfffff
    8000264c:	f88080e7          	jalr	-120(ra) # 800015d0 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80002650:	fffff097          	auipc	ra,0xfffff
    80002654:	174080e7          	jalr	372(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    80002658:	0000b797          	auipc	a5,0xb
    8000265c:	aa07b783          	ld	a5,-1376(a5) # 8000d0f8 <_GLOBAL_OFFSET_TABLE_+0xb0>
    80002660:	0007b783          	ld	a5,0(a5)
    80002664:	0007c783          	lbu	a5,0(a5)
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80002668:	0207f793          	andi	a5,a5,32
    8000266c:	fe0786e3          	beqz	a5,80002658 <_Z22kernelConsumerFunctionPv+0x40>
    80002670:	fbdff06f          	j	8000262c <_Z22kernelConsumerFunctionPv+0x14>

0000000080002674 <_Z5main1v>:
    }
}

int main1() {
    80002674:	fc010113          	addi	sp,sp,-64
    80002678:	02113c23          	sd	ra,56(sp)
    8000267c:	02813823          	sd	s0,48(sp)
    80002680:	02913423          	sd	s1,40(sp)
    80002684:	04010413          	addi	s0,sp,64
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80002688:	0000b797          	auipc	a5,0xb
    8000268c:	a507b783          	ld	a5,-1456(a5) # 8000d0d8 <_GLOBAL_OFFSET_TABLE_+0x90>
    80002690:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80002694:	00000097          	auipc	ra,0x0
    80002698:	ac4080e7          	jalr	-1340(ra) # 80002158 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    8000269c:	fffff097          	auipc	ra,0xfffff
    800026a0:	070080e7          	jalr	112(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    800026a4:	00000613          	li	a2,0
    800026a8:	0000b597          	auipc	a1,0xb
    800026ac:	a105b583          	ld	a1,-1520(a1) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x70>
    800026b0:	fd840513          	addi	a0,s0,-40
    800026b4:	fffff097          	auipc	ra,0xfffff
    800026b8:	d50080e7          	jalr	-688(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    800026bc:	fd843783          	ld	a5,-40(s0)
    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }
    800026c0:	0000b717          	auipc	a4,0xb
    800026c4:	a0873703          	ld	a4,-1528(a4) # 8000d0c8 <_GLOBAL_OFFSET_TABLE_+0x80>
    800026c8:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    800026cc:	00100713          	li	a4,1
    800026d0:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    800026d4:	00000613          	li	a2,0
    800026d8:	0000b597          	auipc	a1,0xb
    800026dc:	9785b583          	ld	a1,-1672(a1) # 8000d050 <_GLOBAL_OFFSET_TABLE_+0x8>
    800026e0:	fd040513          	addi	a0,s0,-48
    800026e4:	fffff097          	auipc	ra,0xfffff
    800026e8:	d20080e7          	jalr	-736(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    800026ec:	00000613          	li	a2,0
    800026f0:	00000597          	auipc	a1,0x0
    800026f4:	f2858593          	addi	a1,a1,-216 # 80002618 <_Z22kernelConsumerFunctionPv>
    800026f8:	fc040513          	addi	a0,s0,-64
    800026fc:	fffff097          	auipc	ra,0xfffff
    80002700:	d08080e7          	jalr	-760(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80002704:	00000613          	li	a2,0
    80002708:	00000597          	auipc	a1,0x0
    8000270c:	ef458593          	addi	a1,a1,-268 # 800025fc <_Z4idlePv>
    80002710:	fc840513          	addi	a0,s0,-56
    80002714:	fffff097          	auipc	ra,0xfffff
    80002718:	cf0080e7          	jalr	-784(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    8000271c:	00200493          	li	s1,2
    80002720:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80002724:	fd043503          	ld	a0,-48(s0)
    80002728:	fffff097          	auipc	ra,0xfffff
    8000272c:	db8080e7          	jalr	-584(ra) # 800014e0 <_Z11thread_joinP3TCB>
        __asm__ volatile("li a0, 0x43");
    80002730:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80002734:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002738:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    8000273c:	00000513          	li	a0,0
    80002740:	03813083          	ld	ra,56(sp)
    80002744:	03013403          	ld	s0,48(sp)
    80002748:	02813483          	ld	s1,40(sp)
    8000274c:	04010113          	addi	sp,sp,64
    80002750:	00008067          	ret

0000000080002754 <interruptRoutine>:
#include "../test/printing.hpp"

int main();

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80002754:	f9010113          	addi	sp,sp,-112
    80002758:	06113423          	sd	ra,104(sp)
    8000275c:	06813023          	sd	s0,96(sp)
    80002760:	04913c23          	sd	s1,88(sp)
    80002764:	07010413          	addi	s0,sp,112
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002768:	14202373          	csrr	t1,scause
    8000276c:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002770:	14102373          	csrr	t1,sepc
    80002774:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002778:	10002373          	csrr	t1,sstatus
    8000277c:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4;
    //uint64 a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002780:	00050313          	mv	t1,a0
    80002784:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002788:	00058313          	mv	t1,a1
    8000278c:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002790:	00060313          	mv	t1,a2
    80002794:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002798:	00068313          	mv	t1,a3
    8000279c:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027a0:	00070313          	mv	t1,a4
    800027a4:	fa643023          	sd	t1,-96(s0)
//    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");

    if (scause == 0x9 || scause == 0x8) {
    800027a8:	fd843703          	ld	a4,-40(s0)
    800027ac:	00900793          	li	a5,9
    800027b0:	00f70863          	beq	a4,a5,800027c0 <interruptRoutine+0x6c>
    800027b4:	fd843703          	ld	a4,-40(s0)
    800027b8:	00800793          	li	a5,8
    800027bc:	4cf71263          	bne	a4,a5,80002c80 <interruptRoutine+0x52c>
        //prekid zbog poziva ecall
        switch (a0) {
    800027c0:	fc043703          	ld	a4,-64(s0)
    800027c4:	08100793          	li	a5,129
    800027c8:	3ee7e863          	bltu	a5,a4,80002bb8 <interruptRoutine+0x464>
    800027cc:	fc043783          	ld	a5,-64(s0)
    800027d0:	00279713          	slli	a4,a5,0x2
    800027d4:	00008797          	auipc	a5,0x8
    800027d8:	92078793          	addi	a5,a5,-1760 # 8000a0f4 <CONSOLE_STATUS+0xe4>
    800027dc:	00f707b3          	add	a5,a4,a5
    800027e0:	0007a783          	lw	a5,0(a5)
    800027e4:	0007871b          	sext.w	a4,a5
    800027e8:	00008797          	auipc	a5,0x8
    800027ec:	90c78793          	addi	a5,a5,-1780 # 8000a0f4 <CONSOLE_STATUS+0xe4>
    800027f0:	00f707b3          	add	a5,a4,a5
    800027f4:	00078067          	jr	a5
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                KMemory::kmalloc((size_t)a1);
    800027f8:	fb843503          	ld	a0,-72(s0)
    800027fc:	fffff097          	auipc	ra,0xfffff
    80002800:	7d8080e7          	jalr	2008(ra) # 80001fd4 <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    80002804:	04a43823          	sd	a0,80(s0)
                break;
    80002808:	4540006f          	j	80002c5c <interruptRoutine+0x508>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                KMemory::kfree((void*)a1);
    8000280c:	fb843783          	ld	a5,-72(s0)
    80002810:	00078513          	mv	a0,a5
    80002814:	00000097          	auipc	ra,0x0
    80002818:	a00080e7          	jalr	-1536(ra) # 80002214 <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    8000281c:	04a43823          	sd	a0,80(s0)
                break;
    80002820:	43c0006f          	j	80002c5c <interruptRoutine+0x508>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002824:	fb043783          	ld	a5,-80(s0)
    80002828:	fa843703          	ld	a4,-88(s0)
    8000282c:	fa043683          	ld	a3,-96(s0)
    80002830:	fb843483          	ld	s1,-72(s0)
    80002834:	00068613          	mv	a2,a3
    80002838:	00070593          	mv	a1,a4
    8000283c:	00078513          	mv	a0,a5
    80002840:	00001097          	auipc	ra,0x1
    80002844:	f70080e7          	jalr	-144(ra) # 800037b0 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002848:	00050793          	mv	a5,a0
    8000284c:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80002850:	fb843783          	ld	a5,-72(s0)
    80002854:	0007b783          	ld	a5,0(a5)
    80002858:	02078863          	beqz	a5,80002888 <interruptRoutine+0x134>
                    if ((TCB::Body)a2 != (TCB::Body)main) {
    8000285c:	fb043703          	ld	a4,-80(s0)
    80002860:	0000b797          	auipc	a5,0xb
    80002864:	8587b783          	ld	a5,-1960(a5) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002868:	00f70c63          	beq	a4,a5,80002880 <interruptRoutine+0x12c>
                        Scheduler::put(*((thread_t*)a1));
    8000286c:	fb843783          	ld	a5,-72(s0)
    80002870:	0007b783          	ld	a5,0(a5)
    80002874:	00078513          	mv	a0,a5
    80002878:	fffff097          	auipc	ra,0xfffff
    8000287c:	5a0080e7          	jalr	1440(ra) # 80001e18 <_ZN9Scheduler3putEP3TCB>
                    }
                    __asm__ volatile("li a0, 0");
    80002880:	00000513          	li	a0,0
    80002884:	0080006f          	j	8000288c <interruptRoutine+0x138>
                } else {
                    __asm__ volatile("li a0, -1");
    80002888:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    8000288c:	04a43823          	sd	a0,80(s0)
                break;
    80002890:	3cc0006f          	j	80002c5c <interruptRoutine+0x508>
            case 0x12:
                //thread_exit
                TCB::getRunning()->setStatus(TCB::FINISHED);
    80002894:	00000097          	auipc	ra,0x0
    80002898:	74c080e7          	jalr	1868(ra) # 80002fe0 <_ZN3TCB10getRunningEv>
    8000289c:	00050793          	mv	a5,a0
    800028a0:	00500593          	li	a1,5
    800028a4:	00078513          	mv	a0,a5
    800028a8:	00000097          	auipc	ra,0x0
    800028ac:	6e4080e7          	jalr	1764(ra) # 80002f8c <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined(TCB::getRunning());
    800028b0:	00000097          	auipc	ra,0x0
    800028b4:	730080e7          	jalr	1840(ra) # 80002fe0 <_ZN3TCB10getRunningEv>
    800028b8:	00050793          	mv	a5,a0
    800028bc:	00078513          	mv	a0,a5
    800028c0:	00001097          	auipc	ra,0x1
    800028c4:	028080e7          	jalr	40(ra) # 800038e8 <_ZN3TCB13releaseJoinedEPS_>
                __asm__ volatile("li a0, 0");
    800028c8:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 80(s0)");
    800028cc:	04a43823          	sd	a0,80(s0)
                TCB::dispatch();
    800028d0:	00001097          	auipc	ra,0x1
    800028d4:	de4080e7          	jalr	-540(ra) # 800036b4 <_ZN3TCB8dispatchEv>
                break;
    800028d8:	3840006f          	j	80002c5c <interruptRoutine+0x508>
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
    800028dc:	00001097          	auipc	ra,0x1
    800028e0:	dd8080e7          	jalr	-552(ra) # 800036b4 <_ZN3TCB8dispatchEv>
                break;
    800028e4:	3780006f          	j	80002c5c <interruptRoutine+0x508>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    800028e8:	fb843783          	ld	a5,-72(s0)
    800028ec:	00078513          	mv	a0,a5
    800028f0:	00001097          	auipc	ra,0x1
    800028f4:	fa4080e7          	jalr	-92(ra) # 80003894 <_ZN3TCB10threadJoinEPS_>
                TCB::dispatch();
    800028f8:	00001097          	auipc	ra,0x1
    800028fc:	dbc080e7          	jalr	-580(ra) # 800036b4 <_ZN3TCB8dispatchEv>
                break;
    80002900:	35c0006f          	j	80002c5c <interruptRoutine+0x508>
            case 0x15:
                //destruktor klase Thread, brise nit ciji je handle prosledjen
                //a1 = rucka niti koja se brise
                if(TCB::getRunning()==(thread_t)a1){
    80002904:	00000097          	auipc	ra,0x0
    80002908:	6dc080e7          	jalr	1756(ra) # 80002fe0 <_ZN3TCB10getRunningEv>
    8000290c:	00050713          	mv	a4,a0
    80002910:	fb843783          	ld	a5,-72(s0)
    80002914:	40f707b3          	sub	a5,a4,a5
    80002918:	0017b793          	seqz	a5,a5
    8000291c:	0ff7f793          	andi	a5,a5,255
    80002920:	04078263          	beqz	a5,80002964 <interruptRoutine+0x210>
                    TCB::getRunning()->setStatus(TCB::FINISHED);
    80002924:	00000097          	auipc	ra,0x0
    80002928:	6bc080e7          	jalr	1724(ra) # 80002fe0 <_ZN3TCB10getRunningEv>
    8000292c:	00050793          	mv	a5,a0
    80002930:	00500593          	li	a1,5
    80002934:	00078513          	mv	a0,a5
    80002938:	00000097          	auipc	ra,0x0
    8000293c:	654080e7          	jalr	1620(ra) # 80002f8c <_ZN3TCB9setStatusENS_12ThreadStatusE>
                    TCB::releaseJoined(TCB::getRunning());
    80002940:	00000097          	auipc	ra,0x0
    80002944:	6a0080e7          	jalr	1696(ra) # 80002fe0 <_ZN3TCB10getRunningEv>
    80002948:	00050793          	mv	a5,a0
    8000294c:	00078513          	mv	a0,a5
    80002950:	00001097          	auipc	ra,0x1
    80002954:	f98080e7          	jalr	-104(ra) # 800038e8 <_ZN3TCB13releaseJoinedEPS_>
                    TCB::dispatch();
    80002958:	00001097          	auipc	ra,0x1
    8000295c:	d5c080e7          	jalr	-676(ra) # 800036b4 <_ZN3TCB8dispatchEv>
                }
                else{
                    TCB::quitThread((thread_t)a1);
                    TCB::releaseJoined((thread_t)a1);
                }
                break;
    80002960:	2fc0006f          	j	80002c5c <interruptRoutine+0x508>
                    TCB::quitThread((thread_t)a1);
    80002964:	fb843783          	ld	a5,-72(s0)
    80002968:	00078513          	mv	a0,a5
    8000296c:	00001097          	auipc	ra,0x1
    80002970:	fcc080e7          	jalr	-52(ra) # 80003938 <_ZN3TCB10quitThreadEPS_>
                    TCB::releaseJoined((thread_t)a1);
    80002974:	fb843783          	ld	a5,-72(s0)
    80002978:	00078513          	mv	a0,a5
    8000297c:	00001097          	auipc	ra,0x1
    80002980:	f6c080e7          	jalr	-148(ra) # 800038e8 <_ZN3TCB13releaseJoinedEPS_>
                break;
    80002984:	2d80006f          	j	80002c5c <interruptRoutine+0x508>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    80002988:	fb043783          	ld	a5,-80(s0)
    8000298c:	0007879b          	sext.w	a5,a5
    80002990:	fb843483          	ld	s1,-72(s0)
    80002994:	00078513          	mv	a0,a5
    80002998:	00001097          	auipc	ra,0x1
    8000299c:	194080e7          	jalr	404(ra) # 80003b2c <_ZN4KSem7initSemEj>
    800029a0:	00050793          	mv	a5,a0
    800029a4:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    800029a8:	fb843783          	ld	a5,-72(s0)
    800029ac:	0007b783          	ld	a5,0(a5)
    800029b0:	00078663          	beqz	a5,800029bc <interruptRoutine+0x268>
                    __asm__ volatile("li a0, 0");
    800029b4:	00000513          	li	a0,0
    800029b8:	0080006f          	j	800029c0 <interruptRoutine+0x26c>
                } else {
                    __asm__ volatile("li a0, -1");
    800029bc:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800029c0:	04a43823          	sd	a0,80(s0)
                break;
    800029c4:	2980006f          	j	80002c5c <interruptRoutine+0x508>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    800029c8:	fb843783          	ld	a5,-72(s0)
    800029cc:	00078513          	mv	a0,a5
    800029d0:	00001097          	auipc	ra,0x1
    800029d4:	2b0080e7          	jalr	688(ra) # 80003c80 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    800029d8:	04a43823          	sd	a0,80(s0)
                delete (sem_t)a1;
    800029dc:	fb843483          	ld	s1,-72(s0)
    800029e0:	26048063          	beqz	s1,80002c40 <interruptRoutine+0x4ec>
    800029e4:	00048513          	mv	a0,s1
    800029e8:	00000097          	auipc	ra,0x0
    800029ec:	458080e7          	jalr	1112(ra) # 80002e40 <_ZN4KSemD1Ev>
    800029f0:	00048513          	mv	a0,s1
    800029f4:	00001097          	auipc	ra,0x1
    800029f8:	110080e7          	jalr	272(ra) # 80003b04 <_ZN4KSemdlEPv>
                break;
    800029fc:	2440006f          	j	80002c40 <interruptRoutine+0x4ec>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80002a00:	fb843783          	ld	a5,-72(s0)
    80002a04:	00078513          	mv	a0,a5
    80002a08:	00001097          	auipc	ra,0x1
    80002a0c:	1b4080e7          	jalr	436(ra) # 80003bbc <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002a10:	04a43823          	sd	a0,80(s0)
                break;
    80002a14:	2480006f          	j	80002c5c <interruptRoutine+0x508>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    80002a18:	fb843783          	ld	a5,-72(s0)
    80002a1c:	00078513          	mv	a0,a5
    80002a20:	00001097          	auipc	ra,0x1
    80002a24:	21c080e7          	jalr	540(ra) # 80003c3c <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002a28:	04a43823          	sd	a0,80(s0)
                break;
    80002a2c:	2300006f          	j	80002c5c <interruptRoutine+0x508>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    80002a30:	fb843783          	ld	a5,-72(s0)
    80002a34:	00078663          	beqz	a5,80002a40 <interruptRoutine+0x2ec>
                    __asm__ volatile("li a0, 0");
    80002a38:	00000513          	li	a0,0
    80002a3c:	0080006f          	j	80002a44 <interruptRoutine+0x2f0>
                } else {
                    __asm__ volatile("li a0, -1");
    80002a40:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002a44:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    80002a48:	fb843783          	ld	a5,-72(s0)
    80002a4c:	1e078e63          	beqz	a5,80002c48 <interruptRoutine+0x4f4>
                    Scheduler::putToSleep(TCB::getRunning(), (time_t)a1);
    80002a50:	00000097          	auipc	ra,0x0
    80002a54:	590080e7          	jalr	1424(ra) # 80002fe0 <_ZN3TCB10getRunningEv>
    80002a58:	00050793          	mv	a5,a0
    80002a5c:	fb843583          	ld	a1,-72(s0)
    80002a60:	00078513          	mv	a0,a5
    80002a64:	fffff097          	auipc	ra,0xfffff
    80002a68:	440080e7          	jalr	1088(ra) # 80001ea4 <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::dispatch();
    80002a6c:	00001097          	auipc	ra,0x1
    80002a70:	c48080e7          	jalr	-952(ra) # 800036b4 <_ZN3TCB8dispatchEv>
                }
                break;
    80002a74:	1d40006f          	j	80002c48 <interruptRoutine+0x4f4>
            case 0x41:
                //getc
                KConsole::kgetc();
    80002a78:	fffff097          	auipc	ra,0xfffff
    80002a7c:	e80080e7          	jalr	-384(ra) # 800018f8 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002a80:	04a43823          	sd	a0,80(s0)
                break;
    80002a84:	1d80006f          	j	80002c5c <interruptRoutine+0x508>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    80002a88:	fb843783          	ld	a5,-72(s0)
    80002a8c:	0ff7f793          	andi	a5,a5,255
    80002a90:	00078513          	mv	a0,a5
    80002a94:	fffff097          	auipc	ra,0xfffff
    80002a98:	df4080e7          	jalr	-524(ra) # 80001888 <_ZN8KConsole5kputcEc>
                break;
    80002a9c:	1c00006f          	j	80002c5c <interruptRoutine+0x508>
            case 0x43:
                //flush izlaznog bafera konzole
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    80002aa0:	00000097          	auipc	ra,0x0
    80002aa4:	4a4080e7          	jalr	1188(ra) # 80002f44 <_ZN8KConsole13getOutputHeadEv>
    80002aa8:	00050793          	mv	a5,a0
    80002aac:	00078493          	mv	s1,a5
    80002ab0:	00000097          	auipc	ra,0x0
    80002ab4:	4b8080e7          	jalr	1208(ra) # 80002f68 <_ZN8KConsole13getOutputTailEv>
    80002ab8:	00050793          	mv	a5,a0
    80002abc:	00048713          	mv	a4,s1
    80002ac0:	40f707b3          	sub	a5,a4,a5
    80002ac4:	00f037b3          	snez	a5,a5
    80002ac8:	0ff7f793          	andi	a5,a5,255
    80002acc:	18078263          	beqz	a5,80002c50 <interruptRoutine+0x4fc>
                    char c = KConsole::getFromOutput();
    80002ad0:	fffff097          	auipc	ra,0xfffff
    80002ad4:	cf4080e7          	jalr	-780(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    80002ad8:	00050793          	mv	a5,a0
    80002adc:	f8f40ba3          	sb	a5,-105(s0)
                    while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80002ae0:	00000097          	auipc	ra,0x0
    80002ae4:	3c8080e7          	jalr	968(ra) # 80002ea8 <_ZN8KConsole10getSRvalueEv>
    80002ae8:	00050793          	mv	a5,a0
    80002aec:	0207f793          	andi	a5,a5,32
    80002af0:	0017b793          	seqz	a5,a5
    80002af4:	0ff7f793          	andi	a5,a5,255
    80002af8:	00078463          	beqz	a5,80002b00 <interruptRoutine+0x3ac>
    80002afc:	fe5ff06f          	j	80002ae0 <interruptRoutine+0x38c>
                    KConsole::setDRvalue(c);
    80002b00:	f9744783          	lbu	a5,-105(s0)
    80002b04:	00078513          	mv	a0,a5
    80002b08:	00000097          	auipc	ra,0x0
    80002b0c:	3f0080e7          	jalr	1008(ra) # 80002ef8 <_ZN8KConsole10setDRvalueEc>
                    sem_signal(KConsole::getOutputBufferHasSpace());
    80002b10:	00000097          	auipc	ra,0x0
    80002b14:	410080e7          	jalr	1040(ra) # 80002f20 <_ZN8KConsole23getOutputBufferHasSpaceEv>
    80002b18:	00050793          	mv	a5,a0
    80002b1c:	00078513          	mv	a0,a5
    80002b20:	fffff097          	auipc	ra,0xfffff
    80002b24:	ab0080e7          	jalr	-1360(ra) # 800015d0 <_Z10sem_signalP4KSem>
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    80002b28:	f79ff06f          	j	80002aa0 <interruptRoutine+0x34c>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002b2c:	fb043783          	ld	a5,-80(s0)
    80002b30:	fa843703          	ld	a4,-88(s0)
    80002b34:	fa043683          	ld	a3,-96(s0)
    80002b38:	fb843483          	ld	s1,-72(s0)
    80002b3c:	00068613          	mv	a2,a3
    80002b40:	00070593          	mv	a1,a4
    80002b44:	00078513          	mv	a0,a5
    80002b48:	00001097          	auipc	ra,0x1
    80002b4c:	c68080e7          	jalr	-920(ra) # 800037b0 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002b50:	00050793          	mv	a5,a0
    80002b54:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80002b58:	fb843783          	ld	a5,-72(s0)
    80002b5c:	0007b783          	ld	a5,0(a5)
    80002b60:	00078663          	beqz	a5,80002b6c <interruptRoutine+0x418>
                    __asm__ volatile("li a0, 0");
    80002b64:	00000513          	li	a0,0
    80002b68:	0080006f          	j	80002b70 <interruptRoutine+0x41c>
                } else {
                    __asm__ volatile("li a0, -1");
    80002b6c:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002b70:	04a43823          	sd	a0,80(s0)
                break;
    80002b74:	0e80006f          	j	80002c5c <interruptRoutine+0x508>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                if (((thread_t)a1)->getBody() != (TCB::Body)main) {
    80002b78:	fb843783          	ld	a5,-72(s0)
    80002b7c:	00078513          	mv	a0,a5
    80002b80:	00000097          	auipc	ra,0x0
    80002b84:	444080e7          	jalr	1092(ra) # 80002fc4 <_ZN3TCB7getBodyEv>
    80002b88:	00050713          	mv	a4,a0
    80002b8c:	0000a797          	auipc	a5,0xa
    80002b90:	52c7b783          	ld	a5,1324(a5) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002b94:	40f707b3          	sub	a5,a4,a5
    80002b98:	00f037b3          	snez	a5,a5
    80002b9c:	0ff7f793          	andi	a5,a5,255
    80002ba0:	0a078c63          	beqz	a5,80002c58 <interruptRoutine+0x504>
                    Scheduler::put((thread_t)a1);
    80002ba4:	fb843783          	ld	a5,-72(s0)
    80002ba8:	00078513          	mv	a0,a5
    80002bac:	fffff097          	auipc	ra,0xfffff
    80002bb0:	26c080e7          	jalr	620(ra) # 80001e18 <_ZN9Scheduler3putEP3TCB>
                }
                break;
    80002bb4:	0a40006f          	j	80002c58 <interruptRoutine+0x504>
            default:
                printString("\nNepostojeci op code: ");
    80002bb8:	00007517          	auipc	a0,0x7
    80002bbc:	4e050513          	addi	a0,a0,1248 # 8000a098 <CONSOLE_STATUS+0x88>
    80002bc0:	00003097          	auipc	ra,0x3
    80002bc4:	7bc080e7          	jalr	1980(ra) # 8000637c <_Z11printStringPKc>
                printInt(a0);
    80002bc8:	fc043783          	ld	a5,-64(s0)
    80002bcc:	0007879b          	sext.w	a5,a5
    80002bd0:	00000613          	li	a2,0
    80002bd4:	00a00593          	li	a1,10
    80002bd8:	00078513          	mv	a0,a5
    80002bdc:	00004097          	auipc	ra,0x4
    80002be0:	950080e7          	jalr	-1712(ra) # 8000652c <_Z8printIntiii>
                printString("\nscause: ");
    80002be4:	00007517          	auipc	a0,0x7
    80002be8:	4cc50513          	addi	a0,a0,1228 # 8000a0b0 <CONSOLE_STATUS+0xa0>
    80002bec:	00003097          	auipc	ra,0x3
    80002bf0:	790080e7          	jalr	1936(ra) # 8000637c <_Z11printStringPKc>
                printInt(scause);
    80002bf4:	fd843783          	ld	a5,-40(s0)
    80002bf8:	0007879b          	sext.w	a5,a5
    80002bfc:	00000613          	li	a2,0
    80002c00:	00a00593          	li	a1,10
    80002c04:	00078513          	mv	a0,a5
    80002c08:	00004097          	auipc	ra,0x4
    80002c0c:	924080e7          	jalr	-1756(ra) # 8000652c <_Z8printIntiii>
                printString("\nsepc: ");
    80002c10:	00007517          	auipc	a0,0x7
    80002c14:	4b050513          	addi	a0,a0,1200 # 8000a0c0 <CONSOLE_STATUS+0xb0>
    80002c18:	00003097          	auipc	ra,0x3
    80002c1c:	764080e7          	jalr	1892(ra) # 8000637c <_Z11printStringPKc>
                printInt(sepc);
    80002c20:	fd043783          	ld	a5,-48(s0)
    80002c24:	0007879b          	sext.w	a5,a5
    80002c28:	00000613          	li	a2,0
    80002c2c:	00a00593          	li	a1,10
    80002c30:	00078513          	mv	a0,a5
    80002c34:	00004097          	auipc	ra,0x4
    80002c38:	8f8080e7          	jalr	-1800(ra) # 8000652c <_Z8printIntiii>
                break;
    80002c3c:	0200006f          	j	80002c5c <interruptRoutine+0x508>
                break;
    80002c40:	00000013          	nop
    80002c44:	0180006f          	j	80002c5c <interruptRoutine+0x508>
                break;
    80002c48:	00000013          	nop
    80002c4c:	0100006f          	j	80002c5c <interruptRoutine+0x508>
                break;
    80002c50:	00000013          	nop
    80002c54:	0080006f          	j	80002c5c <interruptRoutine+0x508>
                break;
    80002c58:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    80002c5c:	fd043783          	ld	a5,-48(s0)
    80002c60:	00478793          	addi	a5,a5,4
    80002c64:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002c68:	fd043783          	ld	a5,-48(s0)
    80002c6c:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002c70:	fc843783          	ld	a5,-56(s0)
    80002c74:	10079073          	csrw	sstatus,a5
    80002c78:	00000013          	nop
        printString("\nsepc: ");
        printInt(sepc);
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    }
    80002c7c:	1ac0006f          	j	80002e28 <interruptRoutine+0x6d4>
    } else if (scause == 0x8000000000000009) {
    80002c80:	fd843703          	ld	a4,-40(s0)
    80002c84:	fff00793          	li	a5,-1
    80002c88:	03f79793          	slli	a5,a5,0x3f
    80002c8c:	00978793          	addi	a5,a5,9
    80002c90:	08f71463          	bne	a4,a5,80002d18 <interruptRoutine+0x5c4>
        uint64 irq = plic_claim();
    80002c94:	00005097          	auipc	ra,0x5
    80002c98:	730080e7          	jalr	1840(ra) # 800083c4 <plic_claim>
    80002c9c:	00050793          	mv	a5,a0
    80002ca0:	f8f43c23          	sd	a5,-104(s0)
        if (irq == CONSOLE_IRQ) {
    80002ca4:	f9843703          	ld	a4,-104(s0)
    80002ca8:	00a00793          	li	a5,10
    80002cac:	02f71c63          	bne	a4,a5,80002ce4 <interruptRoutine+0x590>
            if (KConsole::getSRvalue() & CONSOLE_RX_STATUS_BIT) {
    80002cb0:	00000097          	auipc	ra,0x0
    80002cb4:	1f8080e7          	jalr	504(ra) # 80002ea8 <_ZN8KConsole10getSRvalueEv>
    80002cb8:	00050793          	mv	a5,a0
    80002cbc:	0017f793          	andi	a5,a5,1
    80002cc0:	00f037b3          	snez	a5,a5
    80002cc4:	0ff7f793          	andi	a5,a5,255
    80002cc8:	00078e63          	beqz	a5,80002ce4 <interruptRoutine+0x590>
                KConsole::placeInInput(KConsole::getDRvalue());
    80002ccc:	00000097          	auipc	ra,0x0
    80002cd0:	204080e7          	jalr	516(ra) # 80002ed0 <_ZN8KConsole10getDRvalueEv>
    80002cd4:	00050793          	mv	a5,a0
    80002cd8:	00078513          	mv	a0,a5
    80002cdc:	fffff097          	auipc	ra,0xfffff
    80002ce0:	b40080e7          	jalr	-1216(ra) # 8000181c <_ZN8KConsole12placeInInputEc>
        plic_complete(irq);
    80002ce4:	f9843783          	ld	a5,-104(s0)
    80002ce8:	0007879b          	sext.w	a5,a5
    80002cec:	00078513          	mv	a0,a5
    80002cf0:	00005097          	auipc	ra,0x5
    80002cf4:	70c080e7          	jalr	1804(ra) # 800083fc <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002cf8:	fd043783          	ld	a5,-48(s0)
    80002cfc:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002d00:	fc843783          	ld	a5,-56(s0)
    80002d04:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    80002d08:	20000513          	li	a0,512
    80002d0c:	00000097          	auipc	ra,0x0
    80002d10:	180080e7          	jalr	384(ra) # 80002e8c <_ZN5Riscv6mc_sipEm>
    80002d14:	1140006f          	j	80002e28 <interruptRoutine+0x6d4>
    } else if (scause == 0x8000000000000001) {
    80002d18:	fd843703          	ld	a4,-40(s0)
    80002d1c:	fff00793          	li	a5,-1
    80002d20:	03f79793          	slli	a5,a5,0x3f
    80002d24:	00178793          	addi	a5,a5,1
    80002d28:	08f71463          	bne	a4,a5,80002db0 <interruptRoutine+0x65c>
        Scheduler::wake();
    80002d2c:	fffff097          	auipc	ra,0xfffff
    80002d30:	228080e7          	jalr	552(ra) # 80001f54 <_ZN9Scheduler4wakeEv>
        TCB::getRunningTimeSlice()++;
    80002d34:	00000097          	auipc	ra,0x0
    80002d38:	2d0080e7          	jalr	720(ra) # 80003004 <_ZN3TCB19getRunningTimeSliceEv>
    80002d3c:	00050793          	mv	a5,a0
    80002d40:	0007b703          	ld	a4,0(a5)
    80002d44:	00170713          	addi	a4,a4,1
    80002d48:	00e7b023          	sd	a4,0(a5)
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
    80002d4c:	00000097          	auipc	ra,0x0
    80002d50:	2b8080e7          	jalr	696(ra) # 80003004 <_ZN3TCB19getRunningTimeSliceEv>
    80002d54:	00050793          	mv	a5,a0
    80002d58:	0007b483          	ld	s1,0(a5)
    80002d5c:	00000097          	auipc	ra,0x0
    80002d60:	284080e7          	jalr	644(ra) # 80002fe0 <_ZN3TCB10getRunningEv>
    80002d64:	00050793          	mv	a5,a0
    80002d68:	00078513          	mv	a0,a5
    80002d6c:	00000097          	auipc	ra,0x0
    80002d70:	23c080e7          	jalr	572(ra) # 80002fa8 <_ZN3TCB12getTimeSliceEv>
    80002d74:	00050793          	mv	a5,a0
    80002d78:	00f4b7b3          	sltu	a5,s1,a5
    80002d7c:	0017c793          	xori	a5,a5,1
    80002d80:	0ff7f793          	andi	a5,a5,255
    80002d84:	00078663          	beqz	a5,80002d90 <interruptRoutine+0x63c>
            TCB::dispatch();
    80002d88:	00001097          	auipc	ra,0x1
    80002d8c:	92c080e7          	jalr	-1748(ra) # 800036b4 <_ZN3TCB8dispatchEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002d90:	fd043783          	ld	a5,-48(s0)
    80002d94:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002d98:	fc843783          	ld	a5,-56(s0)
    80002d9c:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    80002da0:	00200513          	li	a0,2
    80002da4:	00000097          	auipc	ra,0x0
    80002da8:	0e8080e7          	jalr	232(ra) # 80002e8c <_ZN5Riscv6mc_sipEm>
    80002dac:	07c0006f          	j	80002e28 <interruptRoutine+0x6d4>
        printString("\nGreska u prekidnoj rutini\n");
    80002db0:	00007517          	auipc	a0,0x7
    80002db4:	31850513          	addi	a0,a0,792 # 8000a0c8 <CONSOLE_STATUS+0xb8>
    80002db8:	00003097          	auipc	ra,0x3
    80002dbc:	5c4080e7          	jalr	1476(ra) # 8000637c <_Z11printStringPKc>
        printString("scause: ");
    80002dc0:	00007517          	auipc	a0,0x7
    80002dc4:	32850513          	addi	a0,a0,808 # 8000a0e8 <CONSOLE_STATUS+0xd8>
    80002dc8:	00003097          	auipc	ra,0x3
    80002dcc:	5b4080e7          	jalr	1460(ra) # 8000637c <_Z11printStringPKc>
        printInt(scause);
    80002dd0:	fd843783          	ld	a5,-40(s0)
    80002dd4:	0007879b          	sext.w	a5,a5
    80002dd8:	00000613          	li	a2,0
    80002ddc:	00a00593          	li	a1,10
    80002de0:	00078513          	mv	a0,a5
    80002de4:	00003097          	auipc	ra,0x3
    80002de8:	748080e7          	jalr	1864(ra) # 8000652c <_Z8printIntiii>
        printString("\nsepc: ");
    80002dec:	00007517          	auipc	a0,0x7
    80002df0:	2d450513          	addi	a0,a0,724 # 8000a0c0 <CONSOLE_STATUS+0xb0>
    80002df4:	00003097          	auipc	ra,0x3
    80002df8:	588080e7          	jalr	1416(ra) # 8000637c <_Z11printStringPKc>
        printInt(sepc);
    80002dfc:	fd043783          	ld	a5,-48(s0)
    80002e00:	0007879b          	sext.w	a5,a5
    80002e04:	00000613          	li	a2,0
    80002e08:	00a00593          	li	a1,10
    80002e0c:	00078513          	mv	a0,a5
    80002e10:	00003097          	auipc	ra,0x3
    80002e14:	71c080e7          	jalr	1820(ra) # 8000652c <_Z8printIntiii>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002e18:	fd043783          	ld	a5,-48(s0)
    80002e1c:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002e20:	fc843783          	ld	a5,-56(s0)
    80002e24:	10079073          	csrw	sstatus,a5
    80002e28:	00000013          	nop
    80002e2c:	06813083          	ld	ra,104(sp)
    80002e30:	06013403          	ld	s0,96(sp)
    80002e34:	05813483          	ld	s1,88(sp)
    80002e38:	07010113          	addi	sp,sp,112
    80002e3c:	00008067          	ret

0000000080002e40 <_ZN4KSemD1Ev>:
#define PROJEKAT2023_KSEM_HPP

#include "../h/ThreadQueue.hpp"

//klasa napravljena po uzoru na semafor u skolskom jezgru
class KSem {
    80002e40:	fe010113          	addi	sp,sp,-32
    80002e44:	00113c23          	sd	ra,24(sp)
    80002e48:	00813823          	sd	s0,16(sp)
    80002e4c:	00913423          	sd	s1,8(sp)
    80002e50:	02010413          	addi	s0,sp,32
    80002e54:	00050493          	mv	s1,a0
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    80002e58:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002e5c:	00050e63          	beqz	a0,80002e78 <_ZN4KSemD1Ev+0x38>
            front = front->next;
    80002e60:	00853783          	ld	a5,8(a0)
    80002e64:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002e68:	fe0508e3          	beqz	a0,80002e58 <_ZN4KSemD1Ev+0x18>
            mem_free(ptr);
    80002e6c:	ffffe097          	auipc	ra,0xffffe
    80002e70:	568080e7          	jalr	1384(ra) # 800013d4 <_Z8mem_freePv>
        }
    80002e74:	fe5ff06f          	j	80002e58 <_ZN4KSemD1Ev+0x18>
    80002e78:	01813083          	ld	ra,24(sp)
    80002e7c:	01013403          	ld	s0,16(sp)
    80002e80:	00813483          	ld	s1,8(sp)
    80002e84:	02010113          	addi	sp,sp,32
    80002e88:	00008067          	ret

0000000080002e8c <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002e8c:	ff010113          	addi	sp,sp,-16
    80002e90:	00813423          	sd	s0,8(sp)
    80002e94:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80002e98:	14453073          	csrc	sip,a0
}
    80002e9c:	00813403          	ld	s0,8(sp)
    80002ea0:	01010113          	addi	sp,sp,16
    80002ea4:	00008067          	ret

0000000080002ea8 <_ZN8KConsole10getSRvalueEv>:
    static uint8 getSRvalue() { return *sr; }
    80002ea8:	ff010113          	addi	sp,sp,-16
    80002eac:	00813423          	sd	s0,8(sp)
    80002eb0:	01010413          	addi	s0,sp,16
    80002eb4:	0000a797          	auipc	a5,0xa
    80002eb8:	2447b783          	ld	a5,580(a5) # 8000d0f8 <_GLOBAL_OFFSET_TABLE_+0xb0>
    80002ebc:	0007b783          	ld	a5,0(a5)
    80002ec0:	0007c503          	lbu	a0,0(a5)
    80002ec4:	00813403          	ld	s0,8(sp)
    80002ec8:	01010113          	addi	sp,sp,16
    80002ecc:	00008067          	ret

0000000080002ed0 <_ZN8KConsole10getDRvalueEv>:
    static uint8 getDRvalue() { return *dr; }
    80002ed0:	ff010113          	addi	sp,sp,-16
    80002ed4:	00813423          	sd	s0,8(sp)
    80002ed8:	01010413          	addi	s0,sp,16
    80002edc:	0000a797          	auipc	a5,0xa
    80002ee0:	1cc7b783          	ld	a5,460(a5) # 8000d0a8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002ee4:	0007b783          	ld	a5,0(a5)
    80002ee8:	0007c503          	lbu	a0,0(a5)
    80002eec:	00813403          	ld	s0,8(sp)
    80002ef0:	01010113          	addi	sp,sp,16
    80002ef4:	00008067          	ret

0000000080002ef8 <_ZN8KConsole10setDRvalueEc>:
    static void setDRvalue(char c) { *dr = c; }
    80002ef8:	ff010113          	addi	sp,sp,-16
    80002efc:	00813423          	sd	s0,8(sp)
    80002f00:	01010413          	addi	s0,sp,16
    80002f04:	0000a797          	auipc	a5,0xa
    80002f08:	1a47b783          	ld	a5,420(a5) # 8000d0a8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002f0c:	0007b783          	ld	a5,0(a5)
    80002f10:	00a78023          	sb	a0,0(a5)
    80002f14:	00813403          	ld	s0,8(sp)
    80002f18:	01010113          	addi	sp,sp,16
    80002f1c:	00008067          	ret

0000000080002f20 <_ZN8KConsole23getOutputBufferHasSpaceEv>:

    static sem_t getOutputBufferHasSpace() { return outputBufferHasSpace; }
    80002f20:	ff010113          	addi	sp,sp,-16
    80002f24:	00813423          	sd	s0,8(sp)
    80002f28:	01010413          	addi	s0,sp,16
    80002f2c:	0000a797          	auipc	a5,0xa
    80002f30:	1947b783          	ld	a5,404(a5) # 8000d0c0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80002f34:	0007b503          	ld	a0,0(a5)
    80002f38:	00813403          	ld	s0,8(sp)
    80002f3c:	01010113          	addi	sp,sp,16
    80002f40:	00008067          	ret

0000000080002f44 <_ZN8KConsole13getOutputHeadEv>:

    static int getOutputHead() { return outputHead; }
    80002f44:	ff010113          	addi	sp,sp,-16
    80002f48:	00813423          	sd	s0,8(sp)
    80002f4c:	01010413          	addi	s0,sp,16
    80002f50:	0000a797          	auipc	a5,0xa
    80002f54:	1487b783          	ld	a5,328(a5) # 8000d098 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002f58:	0007a503          	lw	a0,0(a5)
    80002f5c:	00813403          	ld	s0,8(sp)
    80002f60:	01010113          	addi	sp,sp,16
    80002f64:	00008067          	ret

0000000080002f68 <_ZN8KConsole13getOutputTailEv>:

    static int getOutputTail() { return outputTail; }
    80002f68:	ff010113          	addi	sp,sp,-16
    80002f6c:	00813423          	sd	s0,8(sp)
    80002f70:	01010413          	addi	s0,sp,16
    80002f74:	0000a797          	auipc	a5,0xa
    80002f78:	17c7b783          	ld	a5,380(a5) # 8000d0f0 <_GLOBAL_OFFSET_TABLE_+0xa8>
    80002f7c:	0007a503          	lw	a0,0(a5)
    80002f80:	00813403          	ld	s0,8(sp)
    80002f84:	01010113          	addi	sp,sp,16
    80002f88:	00008067          	ret

0000000080002f8c <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    80002f8c:	ff010113          	addi	sp,sp,-16
    80002f90:	00813423          	sd	s0,8(sp)
    80002f94:	01010413          	addi	s0,sp,16
    80002f98:	04b52c23          	sw	a1,88(a0)
    80002f9c:	00813403          	ld	s0,8(sp)
    80002fa0:	01010113          	addi	sp,sp,16
    80002fa4:	00008067          	ret

0000000080002fa8 <_ZN3TCB12getTimeSliceEv>:
    uint64 getTimeSlice() { return timeSlice; }
    80002fa8:	ff010113          	addi	sp,sp,-16
    80002fac:	00813423          	sd	s0,8(sp)
    80002fb0:	01010413          	addi	s0,sp,16
    80002fb4:	02853503          	ld	a0,40(a0)
    80002fb8:	00813403          	ld	s0,8(sp)
    80002fbc:	01010113          	addi	sp,sp,16
    80002fc0:	00008067          	ret

0000000080002fc4 <_ZN3TCB7getBodyEv>:
    Body getBody() { return threadFunction; }
    80002fc4:	ff010113          	addi	sp,sp,-16
    80002fc8:	00813423          	sd	s0,8(sp)
    80002fcc:	01010413          	addi	s0,sp,16
    80002fd0:	01053503          	ld	a0,16(a0)
    80002fd4:	00813403          	ld	s0,8(sp)
    80002fd8:	01010113          	addi	sp,sp,16
    80002fdc:	00008067          	ret

0000000080002fe0 <_ZN3TCB10getRunningEv>:
    void setMySemaphore(KSem* sem) { mySemaphore = sem; }
    80002fe0:	ff010113          	addi	sp,sp,-16
    80002fe4:	00813423          	sd	s0,8(sp)
    80002fe8:	01010413          	addi	s0,sp,16
    80002fec:	0000a797          	auipc	a5,0xa
    80002ff0:	0dc7b783          	ld	a5,220(a5) # 8000d0c8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002ff4:	0007b503          	ld	a0,0(a5)
    80002ff8:	00813403          	ld	s0,8(sp)
    80002ffc:	01010113          	addi	sp,sp,16
    80003000:	00008067          	ret

0000000080003004 <_ZN3TCB19getRunningTimeSliceEv>:

    static TCB* getRunning() { return running; }
    80003004:	ff010113          	addi	sp,sp,-16
    80003008:	00813423          	sd	s0,8(sp)
    8000300c:	01010413          	addi	s0,sp,16
    80003010:	0000a517          	auipc	a0,0xa
    80003014:	05053503          	ld	a0,80(a0) # 8000d060 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003018:	00813403          	ld	s0,8(sp)
    8000301c:	01010113          	addi	sp,sp,16
    80003020:	00008067          	ret

0000000080003024 <_ZN6ThreadD1Ev>:
    //a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

    __asm__ volatile("ecall");
}

Thread::~Thread() {
    80003024:	ff010113          	addi	sp,sp,-16
    80003028:	00813423          	sd	s0,8(sp)
    8000302c:	01010413          	addi	s0,sp,16
    80003030:	0000a797          	auipc	a5,0xa
    80003034:	e0878793          	addi	a5,a5,-504 # 8000ce38 <_ZTV6Thread+0x10>
    80003038:	00f53023          	sd	a5,0(a0)
    //ne treba da se gasi running nit, vec nit na koju pokazuje rucka od this
//    thread_join(this->myHandle);
//    delete myHandle;

    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000303c:	00853303          	ld	t1,8(a0)
    80003040:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x15");
    80003044:	01500513          	li	a0,21

    __asm__ volatile("ecall");
    80003048:	00000073          	ecall
}
    8000304c:	00813403          	ld	s0,8(sp)
    80003050:	01010113          	addi	sp,sp,16
    80003054:	00008067          	ret

0000000080003058 <_ZN6Thread7wrapperEPv>:

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
    80003058:	02050863          	beqz	a0,80003088 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    8000305c:	ff010113          	addi	sp,sp,-16
    80003060:	00113423          	sd	ra,8(sp)
    80003064:	00813023          	sd	s0,0(sp)
    80003068:	01010413          	addi	s0,sp,16
        ((Thread*)thread)->run();
    8000306c:	00053783          	ld	a5,0(a0)
    80003070:	0107b783          	ld	a5,16(a5)
    80003074:	000780e7          	jalr	a5
    }
}
    80003078:	00813083          	ld	ra,8(sp)
    8000307c:	00013403          	ld	s0,0(sp)
    80003080:	01010113          	addi	sp,sp,16
    80003084:	00008067          	ret
    80003088:	00008067          	ret

000000008000308c <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    8000308c:	fe010113          	addi	sp,sp,-32
    80003090:	00113c23          	sd	ra,24(sp)
    80003094:	00813823          	sd	s0,16(sp)
    80003098:	00913423          	sd	s1,8(sp)
    8000309c:	02010413          	addi	s0,sp,32
    800030a0:	00050493          	mv	s1,a0
    800030a4:	0000a797          	auipc	a5,0xa
    800030a8:	dbc78793          	addi	a5,a5,-580 # 8000ce60 <_ZTV9Semaphore+0x10>
    800030ac:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    800030b0:	00853503          	ld	a0,8(a0)
    800030b4:	ffffe097          	auipc	ra,0xffffe
    800030b8:	4bc080e7          	jalr	1212(ra) # 80001570 <_Z9sem_closeP4KSem>
    delete myHandle;
    800030bc:	0084b483          	ld	s1,8(s1)
    800030c0:	02048863          	beqz	s1,800030f0 <_ZN9SemaphoreD1Ev+0x64>
        return front == nullptr;
    800030c4:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    800030c8:	00050e63          	beqz	a0,800030e4 <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    800030cc:	00853783          	ld	a5,8(a0)
    800030d0:	00f4b423          	sd	a5,8(s1)
            delete node;
    800030d4:	fe0508e3          	beqz	a0,800030c4 <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    800030d8:	ffffe097          	auipc	ra,0xffffe
    800030dc:	2fc080e7          	jalr	764(ra) # 800013d4 <_Z8mem_freePv>
        }
    800030e0:	fe5ff06f          	j	800030c4 <_ZN9SemaphoreD1Ev+0x38>
    800030e4:	00048513          	mv	a0,s1
    800030e8:	00001097          	auipc	ra,0x1
    800030ec:	a1c080e7          	jalr	-1508(ra) # 80003b04 <_ZN4KSemdlEPv>
}
    800030f0:	01813083          	ld	ra,24(sp)
    800030f4:	01013403          	ld	s0,16(sp)
    800030f8:	00813483          	ld	s1,8(sp)
    800030fc:	02010113          	addi	sp,sp,32
    80003100:	00008067          	ret

0000000080003104 <_Znwm>:
void* operator new(size_t size) {
    80003104:	ff010113          	addi	sp,sp,-16
    80003108:	00113423          	sd	ra,8(sp)
    8000310c:	00813023          	sd	s0,0(sp)
    80003110:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003114:	ffffe097          	auipc	ra,0xffffe
    80003118:	280080e7          	jalr	640(ra) # 80001394 <_Z9mem_allocm>
}
    8000311c:	00813083          	ld	ra,8(sp)
    80003120:	00013403          	ld	s0,0(sp)
    80003124:	01010113          	addi	sp,sp,16
    80003128:	00008067          	ret

000000008000312c <_Znam>:
void* operator new[](size_t size) {
    8000312c:	ff010113          	addi	sp,sp,-16
    80003130:	00113423          	sd	ra,8(sp)
    80003134:	00813023          	sd	s0,0(sp)
    80003138:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    8000313c:	ffffe097          	auipc	ra,0xffffe
    80003140:	258080e7          	jalr	600(ra) # 80001394 <_Z9mem_allocm>
}
    80003144:	00813083          	ld	ra,8(sp)
    80003148:	00013403          	ld	s0,0(sp)
    8000314c:	01010113          	addi	sp,sp,16
    80003150:	00008067          	ret

0000000080003154 <_ZdlPv>:
noexcept {
    80003154:	ff010113          	addi	sp,sp,-16
    80003158:	00113423          	sd	ra,8(sp)
    8000315c:	00813023          	sd	s0,0(sp)
    80003160:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80003164:	ffffe097          	auipc	ra,0xffffe
    80003168:	270080e7          	jalr	624(ra) # 800013d4 <_Z8mem_freePv>
}
    8000316c:	00813083          	ld	ra,8(sp)
    80003170:	00013403          	ld	s0,0(sp)
    80003174:	01010113          	addi	sp,sp,16
    80003178:	00008067          	ret

000000008000317c <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    8000317c:	fe010113          	addi	sp,sp,-32
    80003180:	00113c23          	sd	ra,24(sp)
    80003184:	00813823          	sd	s0,16(sp)
    80003188:	00913423          	sd	s1,8(sp)
    8000318c:	02010413          	addi	s0,sp,32
    80003190:	00050493          	mv	s1,a0
}
    80003194:	00000097          	auipc	ra,0x0
    80003198:	e90080e7          	jalr	-368(ra) # 80003024 <_ZN6ThreadD1Ev>
    8000319c:	00048513          	mv	a0,s1
    800031a0:	00000097          	auipc	ra,0x0
    800031a4:	fb4080e7          	jalr	-76(ra) # 80003154 <_ZdlPv>
    800031a8:	01813083          	ld	ra,24(sp)
    800031ac:	01013403          	ld	s0,16(sp)
    800031b0:	00813483          	ld	s1,8(sp)
    800031b4:	02010113          	addi	sp,sp,32
    800031b8:	00008067          	ret

00000000800031bc <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800031bc:	fe010113          	addi	sp,sp,-32
    800031c0:	00113c23          	sd	ra,24(sp)
    800031c4:	00813823          	sd	s0,16(sp)
    800031c8:	00913423          	sd	s1,8(sp)
    800031cc:	02010413          	addi	s0,sp,32
    800031d0:	00050493          	mv	s1,a0
}
    800031d4:	00000097          	auipc	ra,0x0
    800031d8:	eb8080e7          	jalr	-328(ra) # 8000308c <_ZN9SemaphoreD1Ev>
    800031dc:	00048513          	mv	a0,s1
    800031e0:	00000097          	auipc	ra,0x0
    800031e4:	f74080e7          	jalr	-140(ra) # 80003154 <_ZdlPv>
    800031e8:	01813083          	ld	ra,24(sp)
    800031ec:	01013403          	ld	s0,16(sp)
    800031f0:	00813483          	ld	s1,8(sp)
    800031f4:	02010113          	addi	sp,sp,32
    800031f8:	00008067          	ret

00000000800031fc <_ZdaPv>:
noexcept {
    800031fc:	ff010113          	addi	sp,sp,-16
    80003200:	00113423          	sd	ra,8(sp)
    80003204:	00813023          	sd	s0,0(sp)
    80003208:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000320c:	ffffe097          	auipc	ra,0xffffe
    80003210:	1c8080e7          	jalr	456(ra) # 800013d4 <_Z8mem_freePv>
}
    80003214:	00813083          	ld	ra,8(sp)
    80003218:	00013403          	ld	s0,0(sp)
    8000321c:	01010113          	addi	sp,sp,16
    80003220:	00008067          	ret

0000000080003224 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80003224:	fd010113          	addi	sp,sp,-48
    80003228:	02113423          	sd	ra,40(sp)
    8000322c:	02813023          	sd	s0,32(sp)
    80003230:	00913c23          	sd	s1,24(sp)
    80003234:	01213823          	sd	s2,16(sp)
    80003238:	01313423          	sd	s3,8(sp)
    8000323c:	03010413          	addi	s0,sp,48
    80003240:	00050493          	mv	s1,a0
    80003244:	00058913          	mv	s2,a1
    80003248:	00060993          	mv	s3,a2
    8000324c:	0000a797          	auipc	a5,0xa
    80003250:	bec78793          	addi	a5,a5,-1044 # 8000ce38 <_ZTV6Thread+0x10>
    80003254:	00f53023          	sd	a5,0(a0)
    this->body = body;
    80003258:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    8000325c:	00c53c23          	sd	a2,24(a0)
    if (body != (TCB::Body)main) {
    80003260:	0000a797          	auipc	a5,0xa
    80003264:	e587b783          	ld	a5,-424(a5) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003268:	04f58663          	beq	a1,a5,800032b4 <_ZN6ThreadC1EPFvPvES0_+0x90>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    8000326c:	00001537          	lui	a0,0x1
    80003270:	ffffe097          	auipc	ra,0xffffe
    80003274:	124080e7          	jalr	292(ra) # 80001394 <_Z9mem_allocm>
    80003278:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000327c:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003280:	00098693          	mv	a3,s3
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003284:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003288:	00848493          	addi	s1,s1,8
    8000328c:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80003290:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80003294:	00000073          	ecall
}
    80003298:	02813083          	ld	ra,40(sp)
    8000329c:	02013403          	ld	s0,32(sp)
    800032a0:	01813483          	ld	s1,24(sp)
    800032a4:	01013903          	ld	s2,16(sp)
    800032a8:	00813983          	ld	s3,8(sp)
    800032ac:	03010113          	addi	sp,sp,48
    800032b0:	00008067          	ret
    uint64* stack = nullptr;
    800032b4:	00000313          	li	t1,0
    800032b8:	fc5ff06f          	j	8000327c <_ZN6ThreadC1EPFvPvES0_+0x58>

00000000800032bc <_ZN6Thread5startEv>:
int Thread::start() {
    800032bc:	ff010113          	addi	sp,sp,-16
    800032c0:	00813423          	sd	s0,8(sp)
    800032c4:	01010413          	addi	s0,sp,16
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    800032c8:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    800032cc:	02030463          	beqz	t1,800032f4 <_ZN6Thread5startEv+0x38>
    ThreadStatus getStatus() { return this->status; }
    800032d0:	05832783          	lw	a5,88(t1)
    800032d4:	02079463          	bnez	a5,800032fc <_ZN6Thread5startEv+0x40>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800032d8:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    800032dc:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    800032e0:	00000073          	ecall
    return 0;
    800032e4:	00000513          	li	a0,0
}
    800032e8:	00813403          	ld	s0,8(sp)
    800032ec:	01010113          	addi	sp,sp,16
    800032f0:	00008067          	ret
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    800032f4:	fff00513          	li	a0,-1
    800032f8:	ff1ff06f          	j	800032e8 <_ZN6Thread5startEv+0x2c>
    800032fc:	fff00513          	li	a0,-1
    80003300:	fe9ff06f          	j	800032e8 <_ZN6Thread5startEv+0x2c>

0000000080003304 <_ZN6Thread4joinEv>:
    if (myHandle) thread_join(myHandle);
    80003304:	00853503          	ld	a0,8(a0)
    80003308:	02050663          	beqz	a0,80003334 <_ZN6Thread4joinEv+0x30>
void Thread::join() {
    8000330c:	ff010113          	addi	sp,sp,-16
    80003310:	00113423          	sd	ra,8(sp)
    80003314:	00813023          	sd	s0,0(sp)
    80003318:	01010413          	addi	s0,sp,16
    if (myHandle) thread_join(myHandle);
    8000331c:	ffffe097          	auipc	ra,0xffffe
    80003320:	1c4080e7          	jalr	452(ra) # 800014e0 <_Z11thread_joinP3TCB>
}
    80003324:	00813083          	ld	ra,8(sp)
    80003328:	00013403          	ld	s0,0(sp)
    8000332c:	01010113          	addi	sp,sp,16
    80003330:	00008067          	ret
    80003334:	00008067          	ret

0000000080003338 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80003338:	ff010113          	addi	sp,sp,-16
    8000333c:	00113423          	sd	ra,8(sp)
    80003340:	00813023          	sd	s0,0(sp)
    80003344:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80003348:	ffffe097          	auipc	ra,0xffffe
    8000334c:	178080e7          	jalr	376(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80003350:	00813083          	ld	ra,8(sp)
    80003354:	00013403          	ld	s0,0(sp)
    80003358:	01010113          	addi	sp,sp,16
    8000335c:	00008067          	ret

0000000080003360 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80003360:	ff010113          	addi	sp,sp,-16
    80003364:	00113423          	sd	ra,8(sp)
    80003368:	00813023          	sd	s0,0(sp)
    8000336c:	01010413          	addi	s0,sp,16
    time_sleep(t);
    80003370:	ffffe097          	auipc	ra,0xffffe
    80003374:	198080e7          	jalr	408(ra) # 80001508 <_Z10time_sleepm>
}
    80003378:	00000513          	li	a0,0
    8000337c:	00813083          	ld	ra,8(sp)
    80003380:	00013403          	ld	s0,0(sp)
    80003384:	01010113          	addi	sp,sp,16
    80003388:	00008067          	ret

000000008000338c <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    8000338c:	fe010113          	addi	sp,sp,-32
    80003390:	00113c23          	sd	ra,24(sp)
    80003394:	00813823          	sd	s0,16(sp)
    80003398:	00913423          	sd	s1,8(sp)
    8000339c:	02010413          	addi	s0,sp,32
    800033a0:	00050493          	mv	s1,a0
    while (period != -1UL) {
    800033a4:	0204b703          	ld	a4,32(s1)
    800033a8:	fff00793          	li	a5,-1
    800033ac:	02f70663          	beq	a4,a5,800033d8 <_ZN14PeriodicThread3runEv+0x4c>
        periodicActivation();
    800033b0:	0004b783          	ld	a5,0(s1)
    800033b4:	0187b783          	ld	a5,24(a5)
    800033b8:	00048513          	mv	a0,s1
    800033bc:	000780e7          	jalr	a5
        if (period == -1UL) break;
    800033c0:	0204b503          	ld	a0,32(s1)
    800033c4:	fff00793          	li	a5,-1
    800033c8:	00f50863          	beq	a0,a5,800033d8 <_ZN14PeriodicThread3runEv+0x4c>
        sleep(period);
    800033cc:	00000097          	auipc	ra,0x0
    800033d0:	f94080e7          	jalr	-108(ra) # 80003360 <_ZN6Thread5sleepEm>
    while (period != -1UL) {
    800033d4:	fd1ff06f          	j	800033a4 <_ZN14PeriodicThread3runEv+0x18>
    }
    thread_exit();
    800033d8:	ffffe097          	auipc	ra,0xffffe
    800033dc:	0c0080e7          	jalr	192(ra) # 80001498 <_Z11thread_exitv>
}
    800033e0:	01813083          	ld	ra,24(sp)
    800033e4:	01013403          	ld	s0,16(sp)
    800033e8:	00813483          	ld	s1,8(sp)
    800033ec:	02010113          	addi	sp,sp,32
    800033f0:	00008067          	ret

00000000800033f4 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    800033f4:	fe010113          	addi	sp,sp,-32
    800033f8:	00113c23          	sd	ra,24(sp)
    800033fc:	00813823          	sd	s0,16(sp)
    80003400:	00913423          	sd	s1,8(sp)
    80003404:	02010413          	addi	s0,sp,32
    80003408:	00050493          	mv	s1,a0
    8000340c:	0000a797          	auipc	a5,0xa
    80003410:	a2c78793          	addi	a5,a5,-1492 # 8000ce38 <_ZTV6Thread+0x10>
    80003414:	00f53023          	sd	a5,0(a0)
    this->body = wrapper;
    80003418:	00000797          	auipc	a5,0x0
    8000341c:	c4078793          	addi	a5,a5,-960 # 80003058 <_ZN6Thread7wrapperEPv>
    80003420:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80003424:	00a53c23          	sd	a0,24(a0)
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80003428:	00001537          	lui	a0,0x1
    8000342c:	ffffe097          	auipc	ra,0xffffe
    80003430:	f68080e7          	jalr	-152(ra) # 80001394 <_Z9mem_allocm>
    80003434:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003438:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000343c:	0184b303          	ld	t1,24(s1)
    80003440:	00030693          	mv	a3,t1
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003444:	0104b303          	ld	t1,16(s1)
    80003448:	00030613          	mv	a2,t1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000344c:	00848493          	addi	s1,s1,8
    80003450:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80003454:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80003458:	00000073          	ecall
}
    8000345c:	01813083          	ld	ra,24(sp)
    80003460:	01013403          	ld	s0,16(sp)
    80003464:	00813483          	ld	s1,8(sp)
    80003468:	02010113          	addi	sp,sp,32
    8000346c:	00008067          	ret

0000000080003470 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80003470:	ff010113          	addi	sp,sp,-16
    80003474:	00113423          	sd	ra,8(sp)
    80003478:	00813023          	sd	s0,0(sp)
    8000347c:	01010413          	addi	s0,sp,16
    80003480:	0000a797          	auipc	a5,0xa
    80003484:	9e078793          	addi	a5,a5,-1568 # 8000ce60 <_ZTV9Semaphore+0x10>
    80003488:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle, init);
    8000348c:	00850513          	addi	a0,a0,8
    80003490:	ffffe097          	auipc	ra,0xffffe
    80003494:	0a8080e7          	jalr	168(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    80003498:	00813083          	ld	ra,8(sp)
    8000349c:	00013403          	ld	s0,0(sp)
    800034a0:	01010113          	addi	sp,sp,16
    800034a4:	00008067          	ret

00000000800034a8 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    800034a8:	ff010113          	addi	sp,sp,-16
    800034ac:	00113423          	sd	ra,8(sp)
    800034b0:	00813023          	sd	s0,0(sp)
    800034b4:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    800034b8:	00853503          	ld	a0,8(a0)
    800034bc:	ffffe097          	auipc	ra,0xffffe
    800034c0:	0e4080e7          	jalr	228(ra) # 800015a0 <_Z8sem_waitP4KSem>
}
    800034c4:	00813083          	ld	ra,8(sp)
    800034c8:	00013403          	ld	s0,0(sp)
    800034cc:	01010113          	addi	sp,sp,16
    800034d0:	00008067          	ret

00000000800034d4 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    800034d4:	ff010113          	addi	sp,sp,-16
    800034d8:	00113423          	sd	ra,8(sp)
    800034dc:	00813023          	sd	s0,0(sp)
    800034e0:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    800034e4:	00853503          	ld	a0,8(a0)
    800034e8:	ffffe097          	auipc	ra,0xffffe
    800034ec:	0e8080e7          	jalr	232(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    800034f0:	00813083          	ld	ra,8(sp)
    800034f4:	00013403          	ld	s0,0(sp)
    800034f8:	01010113          	addi	sp,sp,16
    800034fc:	00008067          	ret

0000000080003500 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80003500:	ff010113          	addi	sp,sp,-16
    80003504:	00813423          	sd	s0,8(sp)
    80003508:	01010413          	addi	s0,sp,16
    this->period = -1;
    8000350c:	fff00793          	li	a5,-1
    80003510:	02f53023          	sd	a5,32(a0)
}
    80003514:	00813403          	ld	s0,8(sp)
    80003518:	01010113          	addi	sp,sp,16
    8000351c:	00008067          	ret

0000000080003520 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    80003520:	fe010113          	addi	sp,sp,-32
    80003524:	00113c23          	sd	ra,24(sp)
    80003528:	00813823          	sd	s0,16(sp)
    8000352c:	00913423          	sd	s1,8(sp)
    80003530:	01213023          	sd	s2,0(sp)
    80003534:	02010413          	addi	s0,sp,32
    80003538:	00050493          	mv	s1,a0
    8000353c:	00058913          	mv	s2,a1
    80003540:	00000097          	auipc	ra,0x0
    80003544:	eb4080e7          	jalr	-332(ra) # 800033f4 <_ZN6ThreadC1Ev>
    80003548:	0000a797          	auipc	a5,0xa
    8000354c:	93878793          	addi	a5,a5,-1736 # 8000ce80 <_ZTV14PeriodicThread+0x10>
    80003550:	00f4b023          	sd	a5,0(s1)
    80003554:	0324b023          	sd	s2,32(s1)
}
    80003558:	01813083          	ld	ra,24(sp)
    8000355c:	01013403          	ld	s0,16(sp)
    80003560:	00813483          	ld	s1,8(sp)
    80003564:	00013903          	ld	s2,0(sp)
    80003568:	02010113          	addi	sp,sp,32
    8000356c:	00008067          	ret

0000000080003570 <_ZN7Console4getcEv>:

char Console::getc() {
    80003570:	ff010113          	addi	sp,sp,-16
    80003574:	00113423          	sd	ra,8(sp)
    80003578:	00813023          	sd	s0,0(sp)
    8000357c:	01010413          	addi	s0,sp,16
    return ::getc();
    80003580:	ffffe097          	auipc	ra,0xffffe
    80003584:	080080e7          	jalr	128(ra) # 80001600 <_Z4getcv>
}
    80003588:	00813083          	ld	ra,8(sp)
    8000358c:	00013403          	ld	s0,0(sp)
    80003590:	01010113          	addi	sp,sp,16
    80003594:	00008067          	ret

0000000080003598 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80003598:	ff010113          	addi	sp,sp,-16
    8000359c:	00113423          	sd	ra,8(sp)
    800035a0:	00813023          	sd	s0,0(sp)
    800035a4:	01010413          	addi	s0,sp,16
    ::putc(c);
    800035a8:	ffffe097          	auipc	ra,0xffffe
    800035ac:	080080e7          	jalr	128(ra) # 80001628 <_Z4putcc>
}
    800035b0:	00813083          	ld	ra,8(sp)
    800035b4:	00013403          	ld	s0,0(sp)
    800035b8:	01010113          	addi	sp,sp,16
    800035bc:	00008067          	ret

00000000800035c0 <_ZN6Thread3runEv>:
    virtual void run() {}
    800035c0:	ff010113          	addi	sp,sp,-16
    800035c4:	00813423          	sd	s0,8(sp)
    800035c8:	01010413          	addi	s0,sp,16
    800035cc:	00813403          	ld	s0,8(sp)
    800035d0:	01010113          	addi	sp,sp,16
    800035d4:	00008067          	ret

00000000800035d8 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    800035d8:	ff010113          	addi	sp,sp,-16
    800035dc:	00813423          	sd	s0,8(sp)
    800035e0:	01010413          	addi	s0,sp,16
    800035e4:	00813403          	ld	s0,8(sp)
    800035e8:	01010113          	addi	sp,sp,16
    800035ec:	00008067          	ret

00000000800035f0 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800035f0:	ff010113          	addi	sp,sp,-16
    800035f4:	00113423          	sd	ra,8(sp)
    800035f8:	00813023          	sd	s0,0(sp)
    800035fc:	01010413          	addi	s0,sp,16
    80003600:	0000a797          	auipc	a5,0xa
    80003604:	88078793          	addi	a5,a5,-1920 # 8000ce80 <_ZTV14PeriodicThread+0x10>
    80003608:	00f53023          	sd	a5,0(a0)
    8000360c:	00000097          	auipc	ra,0x0
    80003610:	a18080e7          	jalr	-1512(ra) # 80003024 <_ZN6ThreadD1Ev>
    80003614:	00813083          	ld	ra,8(sp)
    80003618:	00013403          	ld	s0,0(sp)
    8000361c:	01010113          	addi	sp,sp,16
    80003620:	00008067          	ret

0000000080003624 <_ZN14PeriodicThreadD0Ev>:
    80003624:	fe010113          	addi	sp,sp,-32
    80003628:	00113c23          	sd	ra,24(sp)
    8000362c:	00813823          	sd	s0,16(sp)
    80003630:	00913423          	sd	s1,8(sp)
    80003634:	02010413          	addi	s0,sp,32
    80003638:	00050493          	mv	s1,a0
    8000363c:	0000a797          	auipc	a5,0xa
    80003640:	84478793          	addi	a5,a5,-1980 # 8000ce80 <_ZTV14PeriodicThread+0x10>
    80003644:	00f53023          	sd	a5,0(a0)
    80003648:	00000097          	auipc	ra,0x0
    8000364c:	9dc080e7          	jalr	-1572(ra) # 80003024 <_ZN6ThreadD1Ev>
    80003650:	00048513          	mv	a0,s1
    80003654:	00000097          	auipc	ra,0x0
    80003658:	b00080e7          	jalr	-1280(ra) # 80003154 <_ZdlPv>
    8000365c:	01813083          	ld	ra,24(sp)
    80003660:	01013403          	ld	s0,16(sp)
    80003664:	00813483          	ld	s1,8(sp)
    80003668:	02010113          	addi	sp,sp,32
    8000366c:	00008067          	ret

0000000080003670 <_ZN3TCB7wrapperEv>:
    }

    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
}

void TCB::wrapper() {
    80003670:	ff010113          	addi	sp,sp,-16
    80003674:	00113423          	sd	ra,8(sp)
    80003678:	00813023          	sd	s0,0(sp)
    8000367c:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch)
    Riscv::returnFromInterrupt();
    80003680:	00000097          	auipc	ra,0x0
    80003684:	43c080e7          	jalr	1084(ra) # 80003abc <_ZN5Riscv19returnFromInterruptEv>
    //na dalje se izvrsavamo u user modu (osim za kernel funkcije)
    running->threadFunction(running->args);
    80003688:	0000a797          	auipc	a5,0xa
    8000368c:	be87b783          	ld	a5,-1048(a5) # 8000d270 <_ZN3TCB7runningE>
    80003690:	0107b703          	ld	a4,16(a5)
    80003694:	0207b503          	ld	a0,32(a5)
    80003698:	000700e7          	jalr	a4
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    8000369c:	ffffe097          	auipc	ra,0xffffe
    800036a0:	dfc080e7          	jalr	-516(ra) # 80001498 <_Z11thread_exitv>
}
    800036a4:	00813083          	ld	ra,8(sp)
    800036a8:	00013403          	ld	s0,0(sp)
    800036ac:	01010113          	addi	sp,sp,16
    800036b0:	00008067          	ret

00000000800036b4 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    800036b4:	fe010113          	addi	sp,sp,-32
    800036b8:	00113c23          	sd	ra,24(sp)
    800036bc:	00813823          	sd	s0,16(sp)
    800036c0:	00913423          	sd	s1,8(sp)
    800036c4:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    800036c8:	0000a497          	auipc	s1,0xa
    800036cc:	ba84b483          	ld	s1,-1112(s1) # 8000d270 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    800036d0:	0584a783          	lw	a5,88(s1)
    800036d4:	00100713          	li	a4,1
    800036d8:	04e78e63          	beq	a5,a4,80003734 <_ZN3TCB8dispatchEv+0x80>
    } else if (old->status == FINISHED) {
    800036dc:	00500713          	li	a4,5
    800036e0:	06e78263          	beq	a5,a4,80003744 <_ZN3TCB8dispatchEv+0x90>
    TCB::running = Scheduler::get();
    800036e4:	ffffe097          	auipc	ra,0xffffe
    800036e8:	780080e7          	jalr	1920(ra) # 80001e64 <_ZN9Scheduler3getEv>
    800036ec:	00050593          	mv	a1,a0
    800036f0:	0000a797          	auipc	a5,0xa
    800036f4:	b8078793          	addi	a5,a5,-1152 # 8000d270 <_ZN3TCB7runningE>
    800036f8:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    800036fc:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == (TCB::Body)main || TCB::running->threadFunction == kernelConsumerFunction ||
    80003700:	01053783          	ld	a5,16(a0)
    80003704:	0000a717          	auipc	a4,0xa
    80003708:	9b473703          	ld	a4,-1612(a4) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x70>
    8000370c:	04e78863          	beq	a5,a4,8000375c <_ZN3TCB8dispatchEv+0xa8>
    80003710:	0000a717          	auipc	a4,0xa
    80003714:	97873703          	ld	a4,-1672(a4) # 8000d088 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003718:	04e78263          	beq	a5,a4,8000375c <_ZN3TCB8dispatchEv+0xa8>
    8000371c:	0000a717          	auipc	a4,0xa
    80003720:	9cc73703          	ld	a4,-1588(a4) # 8000d0e8 <_GLOBAL_OFFSET_TABLE_+0xa0>
    80003724:	02e78c63          	beq	a5,a4,8000375c <_ZN3TCB8dispatchEv+0xa8>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003728:	10000793          	li	a5,256
    8000372c:	1007b073          	csrc	sstatus,a5
}
    80003730:	0340006f          	j	80003764 <_ZN3TCB8dispatchEv+0xb0>
        Scheduler::put(old);
    80003734:	00048513          	mv	a0,s1
    80003738:	ffffe097          	auipc	ra,0xffffe
    8000373c:	6e0080e7          	jalr	1760(ra) # 80001e18 <_ZN9Scheduler3putEP3TCB>
    80003740:	fa5ff06f          	j	800036e4 <_ZN3TCB8dispatchEv+0x30>
        delete old->stack;
    80003744:	0184b503          	ld	a0,24(s1)
    80003748:	00050663          	beqz	a0,80003754 <_ZN3TCB8dispatchEv+0xa0>
    8000374c:	00000097          	auipc	ra,0x0
    80003750:	a08080e7          	jalr	-1528(ra) # 80003154 <_ZdlPv>
        old->stack = nullptr;
    80003754:	0004bc23          	sd	zero,24(s1)
    80003758:	f8dff06f          	j	800036e4 <_ZN3TCB8dispatchEv+0x30>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    8000375c:	10000793          	li	a5,256
    80003760:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80003764:	00b48863          	beq	s1,a1,80003774 <_ZN3TCB8dispatchEv+0xc0>
    80003768:	00048513          	mv	a0,s1
    8000376c:	ffffe097          	auipc	ra,0xffffe
    80003770:	9a4080e7          	jalr	-1628(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80003774:	01813083          	ld	ra,24(sp)
    80003778:	01013403          	ld	s0,16(sp)
    8000377c:	00813483          	ld	s1,8(sp)
    80003780:	02010113          	addi	sp,sp,32
    80003784:	00008067          	ret

0000000080003788 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80003788:	ff010113          	addi	sp,sp,-16
    8000378c:	00113423          	sd	ra,8(sp)
    80003790:	00813023          	sd	s0,0(sp)
    80003794:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003798:	ffffe097          	auipc	ra,0xffffe
    8000379c:	bfc080e7          	jalr	-1028(ra) # 80001394 <_Z9mem_allocm>
}
    800037a0:	00813083          	ld	ra,8(sp)
    800037a4:	00013403          	ld	s0,0(sp)
    800037a8:	01010113          	addi	sp,sp,16
    800037ac:	00008067          	ret

00000000800037b0 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    800037b0:	fd010113          	addi	sp,sp,-48
    800037b4:	02113423          	sd	ra,40(sp)
    800037b8:	02813023          	sd	s0,32(sp)
    800037bc:	00913c23          	sd	s1,24(sp)
    800037c0:	01213823          	sd	s2,16(sp)
    800037c4:	01313423          	sd	s3,8(sp)
    800037c8:	03010413          	addi	s0,sp,48
    800037cc:	00050913          	mv	s2,a0
    800037d0:	00058993          	mv	s3,a1
    800037d4:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    800037d8:	07000513          	li	a0,112
    800037dc:	00000097          	auipc	ra,0x0
    800037e0:	fac080e7          	jalr	-84(ra) # 80003788 <_ZN3TCBnwEm>
private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED), mySemaphore(nullptr),
                                                    joiningWithTCB(nullptr) {
    800037e4:	01253823          	sd	s2,16(a0)
    800037e8:	00953c23          	sd	s1,24(a0)
    800037ec:	03353023          	sd	s3,32(a0)
    800037f0:	00200793          	li	a5,2
    800037f4:	02f53423          	sd	a5,40(a0)
    800037f8:	02053823          	sd	zero,48(a0)
    800037fc:	02053c23          	sd	zero,56(a0)
    80003800:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003804:	04053423          	sd	zero,72(a0)
    80003808:	04053823          	sd	zero,80(a0)
    8000380c:	04052c23          	sw	zero,88(a0)
    80003810:	06053023          	sd	zero,96(a0)
    80003814:	06053423          	sd	zero,104(a0)
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80003818:	0000a797          	auipc	a5,0xa
    8000381c:	8a07b783          	ld	a5,-1888(a5) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003820:	02f90e63          	beq	s2,a5,8000385c <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80003824:	00000797          	auipc	a5,0x0
    80003828:	e4c78793          	addi	a5,a5,-436 # 80003670 <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    8000382c:	02048c63          	beqz	s1,80003864 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb4>
    80003830:	00001637          	lui	a2,0x1
    80003834:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    80003838:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    8000383c:	00953423          	sd	s1,8(a0)
}
    80003840:	02813083          	ld	ra,40(sp)
    80003844:	02013403          	ld	s0,32(sp)
    80003848:	01813483          	ld	s1,24(sp)
    8000384c:	01013903          	ld	s2,16(sp)
    80003850:	00813983          	ld	s3,8(sp)
    80003854:	03010113          	addi	sp,sp,48
    80003858:	00008067          	ret
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    8000385c:	00000793          	li	a5,0
    80003860:	fcdff06f          	j	8000382c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x7c>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80003864:	00000493          	li	s1,0
    80003868:	fd1ff06f          	j	80003838 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x88>

000000008000386c <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    8000386c:	ff010113          	addi	sp,sp,-16
    80003870:	00113423          	sd	ra,8(sp)
    80003874:	00813023          	sd	s0,0(sp)
    80003878:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    8000387c:	ffffe097          	auipc	ra,0xffffe
    80003880:	b58080e7          	jalr	-1192(ra) # 800013d4 <_Z8mem_freePv>
}
    80003884:	00813083          	ld	ra,8(sp)
    80003888:	00013403          	ld	s0,0(sp)
    8000388c:	01010113          	addi	sp,sp,16
    80003890:	00008067          	ret

0000000080003894 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED || TCB::running == handle) return;
    80003894:	05852703          	lw	a4,88(a0)
    80003898:	00500793          	li	a5,5
    8000389c:	04f70463          	beq	a4,a5,800038e4 <_ZN3TCB10threadJoinEPS_+0x50>
    800038a0:	0000a597          	auipc	a1,0xa
    800038a4:	9d05b583          	ld	a1,-1584(a1) # 8000d270 <_ZN3TCB7runningE>
    800038a8:	02a58e63          	beq	a1,a0,800038e4 <_ZN3TCB10threadJoinEPS_+0x50>
void TCB::threadJoin(TCB* handle) {
    800038ac:	ff010113          	addi	sp,sp,-16
    800038b0:	00113423          	sd	ra,8(sp)
    800038b4:	00813023          	sd	s0,0(sp)
    800038b8:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    800038bc:	00300793          	li	a5,3
    800038c0:	04f5ac23          	sw	a5,88(a1)
    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }
    800038c4:	06a5b423          	sd	a0,104(a1)
    TCB::running->setJoiningWithTCB(handle);
    handle->waitingToJoin.putLast(TCB::running);
    800038c8:	04850513          	addi	a0,a0,72
    800038cc:	ffffe097          	auipc	ra,0xffffe
    800038d0:	970080e7          	jalr	-1680(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
}
    800038d4:	00813083          	ld	ra,8(sp)
    800038d8:	00013403          	ld	s0,0(sp)
    800038dc:	01010113          	addi	sp,sp,16
    800038e0:	00008067          	ret
    800038e4:	00008067          	ret

00000000800038e8 <_ZN3TCB13releaseJoinedEPS_>:

void TCB::releaseJoined(TCB* handle) {
    800038e8:	fe010113          	addi	sp,sp,-32
    800038ec:	00113c23          	sd	ra,24(sp)
    800038f0:	00813823          	sd	s0,16(sp)
    800038f4:	00913423          	sd	s1,8(sp)
    800038f8:	02010413          	addi	s0,sp,32
    800038fc:	00050493          	mv	s1,a0
        return front == nullptr;
    80003900:	0484b783          	ld	a5,72(s1)
    while (!handle->waitingToJoin.isEmpty()) {
    80003904:	02078063          	beqz	a5,80003924 <_ZN3TCB13releaseJoinedEPS_+0x3c>
        TCB* tcb = handle->waitingToJoin.getFirst();
    80003908:	04848513          	addi	a0,s1,72
    8000390c:	ffffe097          	auipc	ra,0xffffe
    80003910:	99c080e7          	jalr	-1636(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
    80003914:	06053423          	sd	zero,104(a0)
        tcb->setJoiningWithTCB(nullptr);
        Scheduler::put(tcb);
    80003918:	ffffe097          	auipc	ra,0xffffe
    8000391c:	500080e7          	jalr	1280(ra) # 80001e18 <_ZN9Scheduler3putEP3TCB>
    while (!handle->waitingToJoin.isEmpty()) {
    80003920:	fe1ff06f          	j	80003900 <_ZN3TCB13releaseJoinedEPS_+0x18>
    }
}
    80003924:	01813083          	ld	ra,24(sp)
    80003928:	01013403          	ld	s0,16(sp)
    8000392c:	00813483          	ld	s1,8(sp)
    80003930:	02010113          	addi	sp,sp,32
    80003934:	00008067          	ret

0000000080003938 <_ZN3TCB10quitThreadEPS_>:

void TCB::quitThread(TCB* handle) {
    80003938:	fe010113          	addi	sp,sp,-32
    8000393c:	00113c23          	sd	ra,24(sp)
    80003940:	00813823          	sd	s0,16(sp)
    80003944:	00913423          	sd	s1,8(sp)
    80003948:	02010413          	addi	s0,sp,32
    8000394c:	00050493          	mv	s1,a0
    TCB* prev, * curr;
    switch (handle->status) {
    80003950:	05852783          	lw	a5,88(a0)
    80003954:	00300713          	li	a4,3
    80003958:	10e78063          	beq	a5,a4,80003a58 <_ZN3TCB10quitThreadEPS_+0x120>
    8000395c:	04f76263          	bltu	a4,a5,800039a0 <_ZN3TCB10quitThreadEPS_+0x68>
    80003960:	00100713          	li	a4,1
    80003964:	06e78263          	beq	a5,a4,800039c8 <_ZN3TCB10quitThreadEPS_+0x90>
    80003968:	00200713          	li	a4,2
    8000396c:	08e79e63          	bne	a5,a4,80003a08 <_ZN3TCB10quitThreadEPS_+0xd0>
            }
            curr->nextInScheduler = nullptr;
            break;
        case BLOCKED:
            //nit blokirana na semaforu, treba da se izbaci iz reda blokiranih na semaforu
            if (handle->mySemaphore->getBlocked()->remove(handle) < 0) {
    80003970:	06053503          	ld	a0,96(a0)
    80003974:	00048593          	mv	a1,s1
    80003978:	00850513          	addi	a0,a0,8
    8000397c:	ffffe097          	auipc	ra,0xffffe
    80003980:	98c080e7          	jalr	-1652(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    80003984:	08054263          	bltz	a0,80003a08 <_ZN3TCB10quitThreadEPS_+0xd0>
                //greska
            } else {
                handle->mySemaphore->increaseVal(1);
    80003988:	0604b703          	ld	a4,96(s1)

    static void operator delete(void* ptr);

    ThreadQueue* getBlocked() { return &blocked; }

    void increaseVal(int add) { val += add; }
    8000398c:	00072783          	lw	a5,0(a4)
    80003990:	0017879b          	addiw	a5,a5,1
    80003994:	00f72023          	sw	a5,0(a4)
                handle->mySemaphore = nullptr;
    80003998:	0604b023          	sd	zero,96(s1)
    8000399c:	06c0006f          	j	80003a08 <_ZN3TCB10quitThreadEPS_+0xd0>
    switch (handle->status) {
    800039a0:	00400713          	li	a4,4
    800039a4:	06e79263          	bne	a5,a4,80003a08 <_ZN3TCB10quitThreadEPS_+0xd0>

    static TCB* getTail() { return tail; }

    static void setTail(TCB* tcb) { tail = tcb; }

    static TCB* getSleepingHead() { return sleepingHead; }
    800039a8:	00009797          	auipc	a5,0x9
    800039ac:	7387b783          	ld	a5,1848(a5) # 8000d0e0 <_GLOBAL_OFFSET_TABLE_+0x98>
    800039b0:	0007b783          	ld	a5,0(a5)
                handle->joiningWithTCB = nullptr;
            }
            break;
        case SLEEPING:
            //nit je u redu uspavanih, treba da se izbaci
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    800039b4:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextSleeping);
    800039b8:	0c978063          	beq	a5,s1,80003a78 <_ZN3TCB10quitThreadEPS_+0x140>
    800039bc:	00078713          	mv	a4,a5
    800039c0:	0407b783          	ld	a5,64(a5)
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    800039c4:	ff5ff06f          	j	800039b8 <_ZN3TCB10quitThreadEPS_+0x80>
    static TCB* getHead() { return head; }
    800039c8:	00009797          	auipc	a5,0x9
    800039cc:	6c87b783          	ld	a5,1736(a5) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x48>
    800039d0:	0007b783          	ld	a5,0(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    800039d4:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextInScheduler);
    800039d8:	00978863          	beq	a5,s1,800039e8 <_ZN3TCB10quitThreadEPS_+0xb0>
    800039dc:	00078713          	mv	a4,a5
    800039e0:	0307b783          	ld	a5,48(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    800039e4:	ff5ff06f          	j	800039d8 <_ZN3TCB10quitThreadEPS_+0xa0>
            if (!prev) {
    800039e8:	04070663          	beqz	a4,80003a34 <_ZN3TCB10quitThreadEPS_+0xfc>
                prev->nextInScheduler = curr->nextInScheduler;
    800039ec:	0307b683          	ld	a3,48(a5)
    800039f0:	02d73823          	sd	a3,48(a4)
    static TCB* getTail() { return tail; }
    800039f4:	00009697          	auipc	a3,0x9
    800039f8:	67c6b683          	ld	a3,1660(a3) # 8000d070 <_GLOBAL_OFFSET_TABLE_+0x28>
    800039fc:	0006b683          	ld	a3,0(a3)
            if (curr == Scheduler::getTail()) {
    80003a00:	04d78463          	beq	a5,a3,80003a48 <_ZN3TCB10quitThreadEPS_+0x110>
            curr->nextInScheduler = nullptr;
    80003a04:	0207b823          	sd	zero,48(a5)
        case FINISHED:
            break;
        default:
            break;
    }
    handle->status = FINISHED;
    80003a08:	00500793          	li	a5,5
    80003a0c:	04f4ac23          	sw	a5,88(s1)
    delete handle->stack;
    80003a10:	0184b503          	ld	a0,24(s1)
    80003a14:	00050663          	beqz	a0,80003a20 <_ZN3TCB10quitThreadEPS_+0xe8>
    80003a18:	fffff097          	auipc	ra,0xfffff
    80003a1c:	73c080e7          	jalr	1852(ra) # 80003154 <_ZdlPv>
}
    80003a20:	01813083          	ld	ra,24(sp)
    80003a24:	01013403          	ld	s0,16(sp)
    80003a28:	00813483          	ld	s1,8(sp)
    80003a2c:	02010113          	addi	sp,sp,32
    80003a30:	00008067          	ret
                Scheduler::setHead(curr->nextInScheduler);
    80003a34:	0307b603          	ld	a2,48(a5)
    static void setHead(TCB* tcb) { head = tcb; }
    80003a38:	00009697          	auipc	a3,0x9
    80003a3c:	6586b683          	ld	a3,1624(a3) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x48>
    80003a40:	00c6b023          	sd	a2,0(a3)
    80003a44:	fb1ff06f          	j	800039f4 <_ZN3TCB10quitThreadEPS_+0xbc>
    static void setTail(TCB* tcb) { tail = tcb; }
    80003a48:	00009697          	auipc	a3,0x9
    80003a4c:	6286b683          	ld	a3,1576(a3) # 8000d070 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003a50:	00e6b023          	sd	a4,0(a3)
    80003a54:	fb1ff06f          	j	80003a04 <_ZN3TCB10quitThreadEPS_+0xcc>
            if (handle->joiningWithTCB->getListOfJoiningThreads()->remove(handle) < 0) {
    80003a58:	06853503          	ld	a0,104(a0)
    80003a5c:	00048593          	mv	a1,s1
    80003a60:	04850513          	addi	a0,a0,72
    80003a64:	ffffe097          	auipc	ra,0xffffe
    80003a68:	8a4080e7          	jalr	-1884(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    80003a6c:	f8054ee3          	bltz	a0,80003a08 <_ZN3TCB10quitThreadEPS_+0xd0>
                handle->joiningWithTCB = nullptr;
    80003a70:	0604b423          	sd	zero,104(s1)
    80003a74:	f95ff06f          	j	80003a08 <_ZN3TCB10quitThreadEPS_+0xd0>
            if (!prev) {
    80003a78:	02070863          	beqz	a4,80003aa8 <_ZN3TCB10quitThreadEPS_+0x170>
                prev->nextSleeping = curr->nextSleeping;
    80003a7c:	0407b683          	ld	a3,64(a5)
    80003a80:	04d73023          	sd	a3,64(a4)
            if (curr->nextSleeping) {
    80003a84:	0407b703          	ld	a4,64(a5)
    80003a88:	00070a63          	beqz	a4,80003a9c <_ZN3TCB10quitThreadEPS_+0x164>
                curr->nextSleeping->timeToSleep += curr->timeToSleep;
    80003a8c:	0387b603          	ld	a2,56(a5)
    80003a90:	03873683          	ld	a3,56(a4)
    80003a94:	00c686b3          	add	a3,a3,a2
    80003a98:	02d73c23          	sd	a3,56(a4)
            curr->timeToSleep = 0;
    80003a9c:	0207bc23          	sd	zero,56(a5)
            curr->nextSleeping = nullptr;
    80003aa0:	0407b023          	sd	zero,64(a5)
            break;
    80003aa4:	f65ff06f          	j	80003a08 <_ZN3TCB10quitThreadEPS_+0xd0>
                Scheduler::setSleepingHead(curr->nextSleeping);
    80003aa8:	0407b683          	ld	a3,64(a5)

    static void setSleepingHead(TCB* tcb) { sleepingHead = tcb; }
    80003aac:	00009717          	auipc	a4,0x9
    80003ab0:	63473703          	ld	a4,1588(a4) # 8000d0e0 <_GLOBAL_OFFSET_TABLE_+0x98>
    80003ab4:	00d73023          	sd	a3,0(a4)
    80003ab8:	fcdff06f          	j	80003a84 <_ZN3TCB10quitThreadEPS_+0x14c>

0000000080003abc <_ZN5Riscv19returnFromInterruptEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::returnFromInterrupt() {
    80003abc:	ff010113          	addi	sp,sp,-16
    80003ac0:	00813423          	sd	s0,8(sp)
    80003ac4:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80003ac8:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80003acc:	10200073          	sret
    80003ad0:	00813403          	ld	s0,8(sp)
    80003ad4:	01010113          	addi	sp,sp,16
    80003ad8:	00008067          	ret

0000000080003adc <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80003adc:	ff010113          	addi	sp,sp,-16
    80003ae0:	00113423          	sd	ra,8(sp)
    80003ae4:	00813023          	sd	s0,0(sp)
    80003ae8:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003aec:	ffffe097          	auipc	ra,0xffffe
    80003af0:	8a8080e7          	jalr	-1880(ra) # 80001394 <_Z9mem_allocm>
}
    80003af4:	00813083          	ld	ra,8(sp)
    80003af8:	00013403          	ld	s0,0(sp)
    80003afc:	01010113          	addi	sp,sp,16
    80003b00:	00008067          	ret

0000000080003b04 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80003b04:	ff010113          	addi	sp,sp,-16
    80003b08:	00113423          	sd	ra,8(sp)
    80003b0c:	00813023          	sd	s0,0(sp)
    80003b10:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003b14:	ffffe097          	auipc	ra,0xffffe
    80003b18:	8c0080e7          	jalr	-1856(ra) # 800013d4 <_Z8mem_freePv>
}
    80003b1c:	00813083          	ld	ra,8(sp)
    80003b20:	00013403          	ld	s0,0(sp)
    80003b24:	01010113          	addi	sp,sp,16
    80003b28:	00008067          	ret

0000000080003b2c <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003b2c:	fe010113          	addi	sp,sp,-32
    80003b30:	00113c23          	sd	ra,24(sp)
    80003b34:	00813823          	sd	s0,16(sp)
    80003b38:	00913423          	sd	s1,8(sp)
    80003b3c:	02010413          	addi	s0,sp,32
    80003b40:	00050493          	mv	s1,a0
	return new KSem(val);
    80003b44:	01800513          	li	a0,24
    80003b48:	00000097          	auipc	ra,0x0
    80003b4c:	f94080e7          	jalr	-108(ra) # 80003adc <_ZN4KSemnwEm>
    void block();

    void unblock();

private:
    KSem(uint val) : val(val) {}
    80003b50:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003b54:	00053423          	sd	zero,8(a0)
    80003b58:	00053823          	sd	zero,16(a0)
}
    80003b5c:	01813083          	ld	ra,24(sp)
    80003b60:	01013403          	ld	s0,16(sp)
    80003b64:	00813483          	ld	s1,8(sp)
    80003b68:	02010113          	addi	sp,sp,32
    80003b6c:	00008067          	ret

0000000080003b70 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003b70:	ff010113          	addi	sp,sp,-16
    80003b74:	00113423          	sd	ra,8(sp)
    80003b78:	00813023          	sd	s0,0(sp)
    80003b7c:	01010413          	addi	s0,sp,16
    static TCB* getRunning() { return running; }
    80003b80:	00009797          	auipc	a5,0x9
    80003b84:	5487b783          	ld	a5,1352(a5) # 8000d0c8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80003b88:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80003b8c:	00200793          	li	a5,2
    80003b90:	04f5ac23          	sw	a5,88(a1)
    void setMySemaphore(KSem* sem) { mySemaphore = sem; }
    80003b94:	06a5b023          	sd	a0,96(a1)
    TCB::getRunning()->setStatus(TCB::BLOCKED);
    TCB::getRunning()->setMySemaphore(this);
	blocked.putLast(TCB::getRunning());
    80003b98:	00850513          	addi	a0,a0,8
    80003b9c:	ffffd097          	auipc	ra,0xffffd
    80003ba0:	6a0080e7          	jalr	1696(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::dispatch();
    80003ba4:	00000097          	auipc	ra,0x0
    80003ba8:	b10080e7          	jalr	-1264(ra) # 800036b4 <_ZN3TCB8dispatchEv>
}
    80003bac:	00813083          	ld	ra,8(sp)
    80003bb0:	00013403          	ld	s0,0(sp)
    80003bb4:	01010113          	addi	sp,sp,16
    80003bb8:	00008067          	ret

0000000080003bbc <_ZN4KSem4waitEv>:
	if (--val < 0) {
    80003bbc:	00052783          	lw	a5,0(a0)
    80003bc0:	fff7879b          	addiw	a5,a5,-1
    80003bc4:	00f52023          	sw	a5,0(a0)
    80003bc8:	02079713          	slli	a4,a5,0x20
    80003bcc:	00074663          	bltz	a4,80003bd8 <_ZN4KSem4waitEv+0x1c>
	return 0;
    80003bd0:	00000513          	li	a0,0
}
    80003bd4:	00008067          	ret
int KSem::wait() {
    80003bd8:	ff010113          	addi	sp,sp,-16
    80003bdc:	00113423          	sd	ra,8(sp)
    80003be0:	00813023          	sd	s0,0(sp)
    80003be4:	01010413          	addi	s0,sp,16
		block();
    80003be8:	00000097          	auipc	ra,0x0
    80003bec:	f88080e7          	jalr	-120(ra) # 80003b70 <_ZN4KSem5blockEv>
		return -1;
    80003bf0:	fff00513          	li	a0,-1
}
    80003bf4:	00813083          	ld	ra,8(sp)
    80003bf8:	00013403          	ld	s0,0(sp)
    80003bfc:	01010113          	addi	sp,sp,16
    80003c00:	00008067          	ret

0000000080003c04 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003c04:	ff010113          	addi	sp,sp,-16
    80003c08:	00113423          	sd	ra,8(sp)
    80003c0c:	00813023          	sd	s0,0(sp)
    80003c10:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003c14:	00850513          	addi	a0,a0,8
    80003c18:	ffffd097          	auipc	ra,0xffffd
    80003c1c:	690080e7          	jalr	1680(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
    80003c20:	06053023          	sd	zero,96(a0)
    tcb->setMySemaphore(nullptr);
	Scheduler::put(tcb);
    80003c24:	ffffe097          	auipc	ra,0xffffe
    80003c28:	1f4080e7          	jalr	500(ra) # 80001e18 <_ZN9Scheduler3putEP3TCB>
}
    80003c2c:	00813083          	ld	ra,8(sp)
    80003c30:	00013403          	ld	s0,0(sp)
    80003c34:	01010113          	addi	sp,sp,16
    80003c38:	00008067          	ret

0000000080003c3c <_ZN4KSem6signalEv>:
	if (val++ < 0) {
    80003c3c:	00052783          	lw	a5,0(a0)
    80003c40:	0017871b          	addiw	a4,a5,1
    80003c44:	00e52023          	sw	a4,0(a0)
    80003c48:	0007c663          	bltz	a5,80003c54 <_ZN4KSem6signalEv+0x18>
}
    80003c4c:	00000513          	li	a0,0
    80003c50:	00008067          	ret
int KSem::signal() {
    80003c54:	ff010113          	addi	sp,sp,-16
    80003c58:	00113423          	sd	ra,8(sp)
    80003c5c:	00813023          	sd	s0,0(sp)
    80003c60:	01010413          	addi	s0,sp,16
		unblock();
    80003c64:	00000097          	auipc	ra,0x0
    80003c68:	fa0080e7          	jalr	-96(ra) # 80003c04 <_ZN4KSem7unblockEv>
}
    80003c6c:	00000513          	li	a0,0
    80003c70:	00813083          	ld	ra,8(sp)
    80003c74:	00013403          	ld	s0,0(sp)
    80003c78:	01010113          	addi	sp,sp,16
    80003c7c:	00008067          	ret

0000000080003c80 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003c80:	fe010113          	addi	sp,sp,-32
    80003c84:	00113c23          	sd	ra,24(sp)
    80003c88:	00813823          	sd	s0,16(sp)
    80003c8c:	00913423          	sd	s1,8(sp)
    80003c90:	02010413          	addi	s0,sp,32
    80003c94:	00050493          	mv	s1,a0
        return front == nullptr;
    80003c98:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003c9c:	00078a63          	beqz	a5,80003cb0 <_ZN4KSem8closeSemEPS_+0x30>
		handle->unblock();
    80003ca0:	00048513          	mv	a0,s1
    80003ca4:	00000097          	auipc	ra,0x0
    80003ca8:	f60080e7          	jalr	-160(ra) # 80003c04 <_ZN4KSem7unblockEv>
	while (!handle->blocked.isEmpty()) {
    80003cac:	fedff06f          	j	80003c98 <_ZN4KSem8closeSemEPS_+0x18>
	}
	return 0;
}
    80003cb0:	00000513          	li	a0,0
    80003cb4:	01813083          	ld	ra,24(sp)
    80003cb8:	01013403          	ld	s0,16(sp)
    80003cbc:	00813483          	ld	s1,8(sp)
    80003cc0:	02010113          	addi	sp,sp,32
    80003cc4:	00008067          	ret

0000000080003cc8 <_Z13emptyFunctionPv>:
void idle(void*);

void kernelConsumerFunction(void*);


void emptyFunction(void*) {}
    80003cc8:	ff010113          	addi	sp,sp,-16
    80003ccc:	00813423          	sd	s0,8(sp)
    80003cd0:	01010413          	addi	s0,sp,16
    80003cd4:	00813403          	ld	s0,8(sp)
    80003cd8:	01010113          	addi	sp,sp,16
    80003cdc:	00008067          	ret

0000000080003ce0 <_Z5nit1fPv>:

void nit1f(void*) {
    80003ce0:	fe010113          	addi	sp,sp,-32
    80003ce4:	00113c23          	sd	ra,24(sp)
    80003ce8:	00813823          	sd	s0,16(sp)
    80003cec:	02010413          	addi	s0,sp,32
    while (true) {
        thread_t handle;
        thread_create(&handle, emptyFunction, nullptr);
    80003cf0:	00000613          	li	a2,0
    80003cf4:	00000597          	auipc	a1,0x0
    80003cf8:	fd458593          	addi	a1,a1,-44 # 80003cc8 <_Z13emptyFunctionPv>
    80003cfc:	fe840513          	addi	a0,s0,-24
    80003d00:	ffffd097          	auipc	ra,0xffffd
    80003d04:	704080e7          	jalr	1796(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    while (true) {
    80003d08:	fe9ff06f          	j	80003cf0 <_Z5nit1fPv+0x10>

0000000080003d0c <_Z5nit2fPv>:
    }

    printString("\nGotova nit 1\n");
}

void nit2f(void* arg2) {
    80003d0c:	ff010113          	addi	sp,sp,-16
    80003d10:	00113423          	sd	ra,8(sp)
    80003d14:	00813023          	sd	s0,0(sp)
    80003d18:	01010413          	addi	s0,sp,16
    printString("\nGotova nit 2\n");
    80003d1c:	00006517          	auipc	a0,0x6
    80003d20:	31450513          	addi	a0,a0,788 # 8000a030 <CONSOLE_STATUS+0x20>
    80003d24:	00002097          	auipc	ra,0x2
    80003d28:	658080e7          	jalr	1624(ra) # 8000637c <_Z11printStringPKc>
}
    80003d2c:	00813083          	ld	ra,8(sp)
    80003d30:	00013403          	ld	s0,0(sp)
    80003d34:	01010113          	addi	sp,sp,16
    80003d38:	00008067          	ret

0000000080003d3c <_Z5nit3fPv>:


void nit3f(void*) {
    80003d3c:	fe010113          	addi	sp,sp,-32
    80003d40:	00113c23          	sd	ra,24(sp)
    80003d44:	00813823          	sd	s0,16(sp)
    80003d48:	00913423          	sd	s1,8(sp)
    80003d4c:	02010413          	addi	s0,sp,32
    80003d50:	0180006f          	j	80003d68 <_Z5nit3fPv+0x2c>
    char slovo;
    do {
        slovo = getc();
        putc(slovo);
        if (slovo == '\r') putc('\n');
    80003d54:	00a00513          	li	a0,10
    80003d58:	ffffe097          	auipc	ra,0xffffe
    80003d5c:	8d0080e7          	jalr	-1840(ra) # 80001628 <_Z4putcc>
    } while (slovo != '0');
    80003d60:	03000793          	li	a5,48
    80003d64:	02f48263          	beq	s1,a5,80003d88 <_Z5nit3fPv+0x4c>
        slovo = getc();
    80003d68:	ffffe097          	auipc	ra,0xffffe
    80003d6c:	898080e7          	jalr	-1896(ra) # 80001600 <_Z4getcv>
    80003d70:	00050493          	mv	s1,a0
        putc(slovo);
    80003d74:	ffffe097          	auipc	ra,0xffffe
    80003d78:	8b4080e7          	jalr	-1868(ra) # 80001628 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    80003d7c:	00d00793          	li	a5,13
    80003d80:	fef490e3          	bne	s1,a5,80003d60 <_Z5nit3fPv+0x24>
    80003d84:	fd1ff06f          	j	80003d54 <_Z5nit3fPv+0x18>

    printString("\nGotova nit3\n");
    80003d88:	00006517          	auipc	a0,0x6
    80003d8c:	2b850513          	addi	a0,a0,696 # 8000a040 <CONSOLE_STATUS+0x30>
    80003d90:	00002097          	auipc	ra,0x2
    80003d94:	5ec080e7          	jalr	1516(ra) # 8000637c <_Z11printStringPKc>
}
    80003d98:	01813083          	ld	ra,24(sp)
    80003d9c:	01013403          	ld	s0,16(sp)
    80003da0:	00813483          	ld	s1,8(sp)
    80003da4:	02010113          	addi	sp,sp,32
    80003da8:	00008067          	ret

0000000080003dac <_Z5main5v>:


int main5() {
    80003dac:	fb010113          	addi	sp,sp,-80
    80003db0:	04113423          	sd	ra,72(sp)
    80003db4:	04813023          	sd	s0,64(sp)
    80003db8:	02913c23          	sd	s1,56(sp)
    80003dbc:	05010413          	addi	s0,sp,80
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80003dc0:	00009797          	auipc	a5,0x9
    80003dc4:	3187b783          	ld	a5,792(a5) # 8000d0d8 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003dc8:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80003dcc:	ffffe097          	auipc	ra,0xffffe
    80003dd0:	38c080e7          	jalr	908(ra) # 80002158 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80003dd4:	ffffe097          	auipc	ra,0xffffe
    80003dd8:	938080e7          	jalr	-1736(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>

    //testiranje kreiranja niti
    thread_t glavnaNit = nullptr;
    80003ddc:	fc043c23          	sd	zero,-40(s0)
    thread_t nit1 = nullptr;
    80003de0:	fc043823          	sd	zero,-48(s0)
    thread_t nit2 = nullptr;
    80003de4:	fc043423          	sd	zero,-56(s0)
    thread_t nit3 = nullptr;
    80003de8:	fc043023          	sd	zero,-64(s0)
    thread_t idleNit = nullptr;
    80003dec:	fa043c23          	sd	zero,-72(s0)
    thread_t kernelConsumerThread = nullptr;
    80003df0:	fa043823          	sd	zero,-80(s0)
    thread_create(&glavnaNit, (TCB::Body)main, nullptr);
    80003df4:	00000613          	li	a2,0
    80003df8:	00009597          	auipc	a1,0x9
    80003dfc:	2c05b583          	ld	a1,704(a1) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003e00:	fd840513          	addi	a0,s0,-40
    80003e04:	ffffd097          	auipc	ra,0xffffd
    80003e08:	600080e7          	jalr	1536(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }
    80003e0c:	fd843703          	ld	a4,-40(s0)
    80003e10:	00009797          	auipc	a5,0x9
    80003e14:	2b87b783          	ld	a5,696(a5) # 8000d0c8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80003e18:	00e7b023          	sd	a4,0(a5)
    TCB::setRunning(glavnaNit);
    thread_create(&idleNit, idle, nullptr);
    80003e1c:	00000613          	li	a2,0
    80003e20:	00009597          	auipc	a1,0x9
    80003e24:	2c85b583          	ld	a1,712(a1) # 8000d0e8 <_GLOBAL_OFFSET_TABLE_+0xa0>
    80003e28:	fb840513          	addi	a0,s0,-72
    80003e2c:	ffffd097          	auipc	ra,0xffffd
    80003e30:	5d8080e7          	jalr	1496(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    80003e34:	00000613          	li	a2,0
    80003e38:	00009597          	auipc	a1,0x9
    80003e3c:	2505b583          	ld	a1,592(a1) # 8000d088 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003e40:	fb040513          	addi	a0,s0,-80
    80003e44:	ffffd097          	auipc	ra,0xffffd
    80003e48:	5c0080e7          	jalr	1472(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>


    thread_create(&nit1, nit1f, nullptr);
    80003e4c:	00000613          	li	a2,0
    80003e50:	00000597          	auipc	a1,0x0
    80003e54:	e9058593          	addi	a1,a1,-368 # 80003ce0 <_Z5nit1fPv>
    80003e58:	fd040513          	addi	a0,s0,-48
    80003e5c:	ffffd097          	auipc	ra,0xffffd
    80003e60:	5a8080e7          	jalr	1448(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit2, nit2f, nullptr);
    80003e64:	00000613          	li	a2,0
    80003e68:	00000597          	auipc	a1,0x0
    80003e6c:	ea458593          	addi	a1,a1,-348 # 80003d0c <_Z5nit2fPv>
    80003e70:	fc840513          	addi	a0,s0,-56
    80003e74:	ffffd097          	auipc	ra,0xffffd
    80003e78:	590080e7          	jalr	1424(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit3, nit3f, nullptr);
    80003e7c:	00000613          	li	a2,0
    80003e80:	00000597          	auipc	a1,0x0
    80003e84:	ebc58593          	addi	a1,a1,-324 # 80003d3c <_Z5nit3fPv>
    80003e88:	fc040513          	addi	a0,s0,-64
    80003e8c:	ffffd097          	auipc	ra,0xffffd
    80003e90:	578080e7          	jalr	1400(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    80003e94:	00200493          	li	s1,2
    80003e98:	1004a073          	csrs	sstatus,s1

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    thread_join(nit1);
    80003e9c:	fd043503          	ld	a0,-48(s0)
    80003ea0:	ffffd097          	auipc	ra,0xffffd
    80003ea4:	640080e7          	jalr	1600(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit2);
    80003ea8:	fc843503          	ld	a0,-56(s0)
    80003eac:	ffffd097          	auipc	ra,0xffffd
    80003eb0:	634080e7          	jalr	1588(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit3);
    80003eb4:	fc043503          	ld	a0,-64(s0)
    80003eb8:	ffffd097          	auipc	ra,0xffffd
    80003ebc:	628080e7          	jalr	1576(ra) # 800014e0 <_Z11thread_joinP3TCB>
    //thread_join(idleNit);

    printString("\nGotove user niti\n");
    80003ec0:	00006517          	auipc	a0,0x6
    80003ec4:	19050513          	addi	a0,a0,400 # 8000a050 <CONSOLE_STATUS+0x40>
    80003ec8:	00002097          	auipc	ra,0x2
    80003ecc:	4b4080e7          	jalr	1204(ra) # 8000637c <_Z11printStringPKc>

    printString("\nSad cu da izadjem\n");
    80003ed0:	00006517          	auipc	a0,0x6
    80003ed4:	43050513          	addi	a0,a0,1072 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80003ed8:	00002097          	auipc	ra,0x2
    80003edc:	4a4080e7          	jalr	1188(ra) # 8000637c <_Z11printStringPKc>
        __asm__ volatile("li a0, 0x43");
    80003ee0:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80003ee4:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003ee8:	1004b073          	csrc	sstatus,s1
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);


    return 0;
    80003eec:	00000513          	li	a0,0
    80003ef0:	04813083          	ld	ra,72(sp)
    80003ef4:	04013403          	ld	s0,64(sp)
    80003ef8:	03813483          	ld	s1,56(sp)
    80003efc:	05010113          	addi	sp,sp,80
    80003f00:	00008067          	ret

0000000080003f04 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003f04:	fe010113          	addi	sp,sp,-32
    80003f08:	00113c23          	sd	ra,24(sp)
    80003f0c:	00813823          	sd	s0,16(sp)
    80003f10:	00913423          	sd	s1,8(sp)
    80003f14:	01213023          	sd	s2,0(sp)
    80003f18:	02010413          	addi	s0,sp,32
    80003f1c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003f20:	00000913          	li	s2,0
    80003f24:	00c0006f          	j	80003f30 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003f28:	ffffd097          	auipc	ra,0xffffd
    80003f2c:	598080e7          	jalr	1432(ra) # 800014c0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80003f30:	ffffd097          	auipc	ra,0xffffd
    80003f34:	6d0080e7          	jalr	1744(ra) # 80001600 <_Z4getcv>
    80003f38:	0005059b          	sext.w	a1,a0
    80003f3c:	02d00793          	li	a5,45
    80003f40:	02f58a63          	beq	a1,a5,80003f74 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003f44:	0084b503          	ld	a0,8(s1)
    80003f48:	00003097          	auipc	ra,0x3
    80003f4c:	400080e7          	jalr	1024(ra) # 80007348 <_ZN6Buffer3putEi>
        i++;
    80003f50:	0019071b          	addiw	a4,s2,1
    80003f54:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003f58:	0004a683          	lw	a3,0(s1)
    80003f5c:	0026979b          	slliw	a5,a3,0x2
    80003f60:	00d787bb          	addw	a5,a5,a3
    80003f64:	0017979b          	slliw	a5,a5,0x1
    80003f68:	02f767bb          	remw	a5,a4,a5
    80003f6c:	fc0792e3          	bnez	a5,80003f30 <_ZL16producerKeyboardPv+0x2c>
    80003f70:	fb9ff06f          	j	80003f28 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003f74:	00100793          	li	a5,1
    80003f78:	00009717          	auipc	a4,0x9
    80003f7c:	30f72423          	sw	a5,776(a4) # 8000d280 <_ZL9threadEnd>
    data->buffer->put('!');
    80003f80:	02100593          	li	a1,33
    80003f84:	0084b503          	ld	a0,8(s1)
    80003f88:	00003097          	auipc	ra,0x3
    80003f8c:	3c0080e7          	jalr	960(ra) # 80007348 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003f90:	0104b503          	ld	a0,16(s1)
    80003f94:	ffffd097          	auipc	ra,0xffffd
    80003f98:	63c080e7          	jalr	1596(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80003f9c:	01813083          	ld	ra,24(sp)
    80003fa0:	01013403          	ld	s0,16(sp)
    80003fa4:	00813483          	ld	s1,8(sp)
    80003fa8:	00013903          	ld	s2,0(sp)
    80003fac:	02010113          	addi	sp,sp,32
    80003fb0:	00008067          	ret

0000000080003fb4 <_ZL8producerPv>:

static void producer(void *arg) {
    80003fb4:	fe010113          	addi	sp,sp,-32
    80003fb8:	00113c23          	sd	ra,24(sp)
    80003fbc:	00813823          	sd	s0,16(sp)
    80003fc0:	00913423          	sd	s1,8(sp)
    80003fc4:	01213023          	sd	s2,0(sp)
    80003fc8:	02010413          	addi	s0,sp,32
    80003fcc:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003fd0:	00000913          	li	s2,0
    80003fd4:	00c0006f          	j	80003fe0 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003fd8:	ffffd097          	auipc	ra,0xffffd
    80003fdc:	4e8080e7          	jalr	1256(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003fe0:	00009797          	auipc	a5,0x9
    80003fe4:	2a07a783          	lw	a5,672(a5) # 8000d280 <_ZL9threadEnd>
    80003fe8:	02079e63          	bnez	a5,80004024 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003fec:	0004a583          	lw	a1,0(s1)
    80003ff0:	0305859b          	addiw	a1,a1,48
    80003ff4:	0084b503          	ld	a0,8(s1)
    80003ff8:	00003097          	auipc	ra,0x3
    80003ffc:	350080e7          	jalr	848(ra) # 80007348 <_ZN6Buffer3putEi>
        i++;
    80004000:	0019071b          	addiw	a4,s2,1
    80004004:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004008:	0004a683          	lw	a3,0(s1)
    8000400c:	0026979b          	slliw	a5,a3,0x2
    80004010:	00d787bb          	addw	a5,a5,a3
    80004014:	0017979b          	slliw	a5,a5,0x1
    80004018:	02f767bb          	remw	a5,a4,a5
    8000401c:	fc0792e3          	bnez	a5,80003fe0 <_ZL8producerPv+0x2c>
    80004020:	fb9ff06f          	j	80003fd8 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80004024:	0104b503          	ld	a0,16(s1)
    80004028:	ffffd097          	auipc	ra,0xffffd
    8000402c:	5a8080e7          	jalr	1448(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80004030:	01813083          	ld	ra,24(sp)
    80004034:	01013403          	ld	s0,16(sp)
    80004038:	00813483          	ld	s1,8(sp)
    8000403c:	00013903          	ld	s2,0(sp)
    80004040:	02010113          	addi	sp,sp,32
    80004044:	00008067          	ret

0000000080004048 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80004048:	fd010113          	addi	sp,sp,-48
    8000404c:	02113423          	sd	ra,40(sp)
    80004050:	02813023          	sd	s0,32(sp)
    80004054:	00913c23          	sd	s1,24(sp)
    80004058:	01213823          	sd	s2,16(sp)
    8000405c:	01313423          	sd	s3,8(sp)
    80004060:	03010413          	addi	s0,sp,48
    80004064:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004068:	00000993          	li	s3,0
    8000406c:	01c0006f          	j	80004088 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80004070:	ffffd097          	auipc	ra,0xffffd
    80004074:	450080e7          	jalr	1104(ra) # 800014c0 <_Z15thread_dispatchv>
    80004078:	0500006f          	j	800040c8 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    8000407c:	00a00513          	li	a0,10
    80004080:	ffffd097          	auipc	ra,0xffffd
    80004084:	5a8080e7          	jalr	1448(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    80004088:	00009797          	auipc	a5,0x9
    8000408c:	1f87a783          	lw	a5,504(a5) # 8000d280 <_ZL9threadEnd>
    80004090:	06079063          	bnez	a5,800040f0 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80004094:	00893503          	ld	a0,8(s2)
    80004098:	00003097          	auipc	ra,0x3
    8000409c:	340080e7          	jalr	832(ra) # 800073d8 <_ZN6Buffer3getEv>
        i++;
    800040a0:	0019849b          	addiw	s1,s3,1
    800040a4:	0004899b          	sext.w	s3,s1
        putc(key);
    800040a8:	0ff57513          	andi	a0,a0,255
    800040ac:	ffffd097          	auipc	ra,0xffffd
    800040b0:	57c080e7          	jalr	1404(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800040b4:	00092703          	lw	a4,0(s2)
    800040b8:	0027179b          	slliw	a5,a4,0x2
    800040bc:	00e787bb          	addw	a5,a5,a4
    800040c0:	02f4e7bb          	remw	a5,s1,a5
    800040c4:	fa0786e3          	beqz	a5,80004070 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800040c8:	05000793          	li	a5,80
    800040cc:	02f4e4bb          	remw	s1,s1,a5
    800040d0:	fa049ce3          	bnez	s1,80004088 <_ZL8consumerPv+0x40>
    800040d4:	fa9ff06f          	j	8000407c <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800040d8:	00893503          	ld	a0,8(s2)
    800040dc:	00003097          	auipc	ra,0x3
    800040e0:	2fc080e7          	jalr	764(ra) # 800073d8 <_ZN6Buffer3getEv>
        putc(key);
    800040e4:	0ff57513          	andi	a0,a0,255
    800040e8:	ffffd097          	auipc	ra,0xffffd
    800040ec:	540080e7          	jalr	1344(ra) # 80001628 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    800040f0:	00893503          	ld	a0,8(s2)
    800040f4:	00003097          	auipc	ra,0x3
    800040f8:	370080e7          	jalr	880(ra) # 80007464 <_ZN6Buffer6getCntEv>
    800040fc:	fca04ee3          	bgtz	a0,800040d8 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80004100:	01093503          	ld	a0,16(s2)
    80004104:	ffffd097          	auipc	ra,0xffffd
    80004108:	4cc080e7          	jalr	1228(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    8000410c:	02813083          	ld	ra,40(sp)
    80004110:	02013403          	ld	s0,32(sp)
    80004114:	01813483          	ld	s1,24(sp)
    80004118:	01013903          	ld	s2,16(sp)
    8000411c:	00813983          	ld	s3,8(sp)
    80004120:	03010113          	addi	sp,sp,48
    80004124:	00008067          	ret

0000000080004128 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80004128:	f9010113          	addi	sp,sp,-112
    8000412c:	06113423          	sd	ra,104(sp)
    80004130:	06813023          	sd	s0,96(sp)
    80004134:	04913c23          	sd	s1,88(sp)
    80004138:	05213823          	sd	s2,80(sp)
    8000413c:	05313423          	sd	s3,72(sp)
    80004140:	05413023          	sd	s4,64(sp)
    80004144:	03513c23          	sd	s5,56(sp)
    80004148:	03613823          	sd	s6,48(sp)
    8000414c:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80004150:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80004154:	00006517          	auipc	a0,0x6
    80004158:	1c450513          	addi	a0,a0,452 # 8000a318 <CONSOLE_STATUS+0x308>
    8000415c:	00002097          	auipc	ra,0x2
    80004160:	220080e7          	jalr	544(ra) # 8000637c <_Z11printStringPKc>
    getString(input, 30);
    80004164:	01e00593          	li	a1,30
    80004168:	fa040493          	addi	s1,s0,-96
    8000416c:	00048513          	mv	a0,s1
    80004170:	00002097          	auipc	ra,0x2
    80004174:	294080e7          	jalr	660(ra) # 80006404 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004178:	00048513          	mv	a0,s1
    8000417c:	00002097          	auipc	ra,0x2
    80004180:	360080e7          	jalr	864(ra) # 800064dc <_Z11stringToIntPKc>
    80004184:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80004188:	00006517          	auipc	a0,0x6
    8000418c:	1b050513          	addi	a0,a0,432 # 8000a338 <CONSOLE_STATUS+0x328>
    80004190:	00002097          	auipc	ra,0x2
    80004194:	1ec080e7          	jalr	492(ra) # 8000637c <_Z11printStringPKc>
    getString(input, 30);
    80004198:	01e00593          	li	a1,30
    8000419c:	00048513          	mv	a0,s1
    800041a0:	00002097          	auipc	ra,0x2
    800041a4:	264080e7          	jalr	612(ra) # 80006404 <_Z9getStringPci>
    n = stringToInt(input);
    800041a8:	00048513          	mv	a0,s1
    800041ac:	00002097          	auipc	ra,0x2
    800041b0:	330080e7          	jalr	816(ra) # 800064dc <_Z11stringToIntPKc>
    800041b4:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    800041b8:	00006517          	auipc	a0,0x6
    800041bc:	1a050513          	addi	a0,a0,416 # 8000a358 <CONSOLE_STATUS+0x348>
    800041c0:	00002097          	auipc	ra,0x2
    800041c4:	1bc080e7          	jalr	444(ra) # 8000637c <_Z11printStringPKc>
	printInt(threadNum);
    800041c8:	00000613          	li	a2,0
    800041cc:	00a00593          	li	a1,10
    800041d0:	00090513          	mv	a0,s2
    800041d4:	00002097          	auipc	ra,0x2
    800041d8:	358080e7          	jalr	856(ra) # 8000652c <_Z8printIntiii>
    printString(" i velicina bafera ");
    800041dc:	00006517          	auipc	a0,0x6
    800041e0:	19450513          	addi	a0,a0,404 # 8000a370 <CONSOLE_STATUS+0x360>
    800041e4:	00002097          	auipc	ra,0x2
    800041e8:	198080e7          	jalr	408(ra) # 8000637c <_Z11printStringPKc>
	printInt(n);
    800041ec:	00000613          	li	a2,0
    800041f0:	00a00593          	li	a1,10
    800041f4:	00048513          	mv	a0,s1
    800041f8:	00002097          	auipc	ra,0x2
    800041fc:	334080e7          	jalr	820(ra) # 8000652c <_Z8printIntiii>
    printString(".\n");
    80004200:	00006517          	auipc	a0,0x6
    80004204:	18850513          	addi	a0,a0,392 # 8000a388 <CONSOLE_STATUS+0x378>
    80004208:	00002097          	auipc	ra,0x2
    8000420c:	174080e7          	jalr	372(ra) # 8000637c <_Z11printStringPKc>
    if(threadNum > n) {
    80004210:	0324c463          	blt	s1,s2,80004238 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80004214:	03205c63          	blez	s2,8000424c <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80004218:	03800513          	li	a0,56
    8000421c:	fffff097          	auipc	ra,0xfffff
    80004220:	ee8080e7          	jalr	-280(ra) # 80003104 <_Znwm>
    80004224:	00050a13          	mv	s4,a0
    80004228:	00048593          	mv	a1,s1
    8000422c:	00003097          	auipc	ra,0x3
    80004230:	080080e7          	jalr	128(ra) # 800072ac <_ZN6BufferC1Ei>
    80004234:	0300006f          	j	80004264 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004238:	00006517          	auipc	a0,0x6
    8000423c:	15850513          	addi	a0,a0,344 # 8000a390 <CONSOLE_STATUS+0x380>
    80004240:	00002097          	auipc	ra,0x2
    80004244:	13c080e7          	jalr	316(ra) # 8000637c <_Z11printStringPKc>
        return;
    80004248:	0140006f          	j	8000425c <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    8000424c:	00006517          	auipc	a0,0x6
    80004250:	18450513          	addi	a0,a0,388 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80004254:	00002097          	auipc	ra,0x2
    80004258:	128080e7          	jalr	296(ra) # 8000637c <_Z11printStringPKc>
        return;
    8000425c:	000b0113          	mv	sp,s6
    80004260:	1500006f          	j	800043b0 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80004264:	00000593          	li	a1,0
    80004268:	00009517          	auipc	a0,0x9
    8000426c:	02050513          	addi	a0,a0,32 # 8000d288 <_ZL10waitForAll>
    80004270:	ffffd097          	auipc	ra,0xffffd
    80004274:	2c8080e7          	jalr	712(ra) # 80001538 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80004278:	00391793          	slli	a5,s2,0x3
    8000427c:	00f78793          	addi	a5,a5,15
    80004280:	ff07f793          	andi	a5,a5,-16
    80004284:	40f10133          	sub	sp,sp,a5
    80004288:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    8000428c:	0019071b          	addiw	a4,s2,1
    80004290:	00171793          	slli	a5,a4,0x1
    80004294:	00e787b3          	add	a5,a5,a4
    80004298:	00379793          	slli	a5,a5,0x3
    8000429c:	00f78793          	addi	a5,a5,15
    800042a0:	ff07f793          	andi	a5,a5,-16
    800042a4:	40f10133          	sub	sp,sp,a5
    800042a8:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800042ac:	00191613          	slli	a2,s2,0x1
    800042b0:	012607b3          	add	a5,a2,s2
    800042b4:	00379793          	slli	a5,a5,0x3
    800042b8:	00f987b3          	add	a5,s3,a5
    800042bc:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800042c0:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800042c4:	00009717          	auipc	a4,0x9
    800042c8:	fc473703          	ld	a4,-60(a4) # 8000d288 <_ZL10waitForAll>
    800042cc:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800042d0:	00078613          	mv	a2,a5
    800042d4:	00000597          	auipc	a1,0x0
    800042d8:	d7458593          	addi	a1,a1,-652 # 80004048 <_ZL8consumerPv>
    800042dc:	f9840513          	addi	a0,s0,-104
    800042e0:	ffffd097          	auipc	ra,0xffffd
    800042e4:	124080e7          	jalr	292(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800042e8:	00000493          	li	s1,0
    800042ec:	0280006f          	j	80004314 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    800042f0:	00000597          	auipc	a1,0x0
    800042f4:	c1458593          	addi	a1,a1,-1004 # 80003f04 <_ZL16producerKeyboardPv>
                      data + i);
    800042f8:	00179613          	slli	a2,a5,0x1
    800042fc:	00f60633          	add	a2,a2,a5
    80004300:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80004304:	00c98633          	add	a2,s3,a2
    80004308:	ffffd097          	auipc	ra,0xffffd
    8000430c:	0fc080e7          	jalr	252(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80004310:	0014849b          	addiw	s1,s1,1
    80004314:	0524d263          	bge	s1,s2,80004358 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80004318:	00149793          	slli	a5,s1,0x1
    8000431c:	009787b3          	add	a5,a5,s1
    80004320:	00379793          	slli	a5,a5,0x3
    80004324:	00f987b3          	add	a5,s3,a5
    80004328:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    8000432c:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80004330:	00009717          	auipc	a4,0x9
    80004334:	f5873703          	ld	a4,-168(a4) # 8000d288 <_ZL10waitForAll>
    80004338:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    8000433c:	00048793          	mv	a5,s1
    80004340:	00349513          	slli	a0,s1,0x3
    80004344:	00aa8533          	add	a0,s5,a0
    80004348:	fa9054e3          	blez	s1,800042f0 <_Z22producerConsumer_C_APIv+0x1c8>
    8000434c:	00000597          	auipc	a1,0x0
    80004350:	c6858593          	addi	a1,a1,-920 # 80003fb4 <_ZL8producerPv>
    80004354:	fa5ff06f          	j	800042f8 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80004358:	ffffd097          	auipc	ra,0xffffd
    8000435c:	168080e7          	jalr	360(ra) # 800014c0 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80004360:	00000493          	li	s1,0
    80004364:	00994e63          	blt	s2,s1,80004380 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80004368:	00009517          	auipc	a0,0x9
    8000436c:	f2053503          	ld	a0,-224(a0) # 8000d288 <_ZL10waitForAll>
    80004370:	ffffd097          	auipc	ra,0xffffd
    80004374:	230080e7          	jalr	560(ra) # 800015a0 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80004378:	0014849b          	addiw	s1,s1,1
    8000437c:	fe9ff06f          	j	80004364 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80004380:	00009517          	auipc	a0,0x9
    80004384:	f0853503          	ld	a0,-248(a0) # 8000d288 <_ZL10waitForAll>
    80004388:	ffffd097          	auipc	ra,0xffffd
    8000438c:	1e8080e7          	jalr	488(ra) # 80001570 <_Z9sem_closeP4KSem>
    delete buffer;
    80004390:	000a0e63          	beqz	s4,800043ac <_Z22producerConsumer_C_APIv+0x284>
    80004394:	000a0513          	mv	a0,s4
    80004398:	00003097          	auipc	ra,0x3
    8000439c:	154080e7          	jalr	340(ra) # 800074ec <_ZN6BufferD1Ev>
    800043a0:	000a0513          	mv	a0,s4
    800043a4:	fffff097          	auipc	ra,0xfffff
    800043a8:	db0080e7          	jalr	-592(ra) # 80003154 <_ZdlPv>
    800043ac:	000b0113          	mv	sp,s6

}
    800043b0:	f9040113          	addi	sp,s0,-112
    800043b4:	06813083          	ld	ra,104(sp)
    800043b8:	06013403          	ld	s0,96(sp)
    800043bc:	05813483          	ld	s1,88(sp)
    800043c0:	05013903          	ld	s2,80(sp)
    800043c4:	04813983          	ld	s3,72(sp)
    800043c8:	04013a03          	ld	s4,64(sp)
    800043cc:	03813a83          	ld	s5,56(sp)
    800043d0:	03013b03          	ld	s6,48(sp)
    800043d4:	07010113          	addi	sp,sp,112
    800043d8:	00008067          	ret
    800043dc:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800043e0:	000a0513          	mv	a0,s4
    800043e4:	fffff097          	auipc	ra,0xfffff
    800043e8:	d70080e7          	jalr	-656(ra) # 80003154 <_ZdlPv>
    800043ec:	00048513          	mv	a0,s1
    800043f0:	0000a097          	auipc	ra,0xa
    800043f4:	fc8080e7          	jalr	-56(ra) # 8000e3b8 <_Unwind_Resume>

00000000800043f8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800043f8:	fe010113          	addi	sp,sp,-32
    800043fc:	00113c23          	sd	ra,24(sp)
    80004400:	00813823          	sd	s0,16(sp)
    80004404:	00913423          	sd	s1,8(sp)
    80004408:	01213023          	sd	s2,0(sp)
    8000440c:	02010413          	addi	s0,sp,32
    80004410:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004414:	00100793          	li	a5,1
    80004418:	02a7f863          	bgeu	a5,a0,80004448 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000441c:	00a00793          	li	a5,10
    80004420:	02f577b3          	remu	a5,a0,a5
    80004424:	02078e63          	beqz	a5,80004460 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004428:	fff48513          	addi	a0,s1,-1
    8000442c:	00000097          	auipc	ra,0x0
    80004430:	fcc080e7          	jalr	-52(ra) # 800043f8 <_ZL9fibonaccim>
    80004434:	00050913          	mv	s2,a0
    80004438:	ffe48513          	addi	a0,s1,-2
    8000443c:	00000097          	auipc	ra,0x0
    80004440:	fbc080e7          	jalr	-68(ra) # 800043f8 <_ZL9fibonaccim>
    80004444:	00a90533          	add	a0,s2,a0
}
    80004448:	01813083          	ld	ra,24(sp)
    8000444c:	01013403          	ld	s0,16(sp)
    80004450:	00813483          	ld	s1,8(sp)
    80004454:	00013903          	ld	s2,0(sp)
    80004458:	02010113          	addi	sp,sp,32
    8000445c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004460:	ffffd097          	auipc	ra,0xffffd
    80004464:	060080e7          	jalr	96(ra) # 800014c0 <_Z15thread_dispatchv>
    80004468:	fc1ff06f          	j	80004428 <_ZL9fibonaccim+0x30>

000000008000446c <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    8000446c:	fe010113          	addi	sp,sp,-32
    80004470:	00113c23          	sd	ra,24(sp)
    80004474:	00813823          	sd	s0,16(sp)
    80004478:	00913423          	sd	s1,8(sp)
    8000447c:	01213023          	sd	s2,0(sp)
    80004480:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004484:	00000913          	li	s2,0
    80004488:	0380006f          	j	800044c0 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    8000448c:	ffffd097          	auipc	ra,0xffffd
    80004490:	034080e7          	jalr	52(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004494:	00148493          	addi	s1,s1,1
    80004498:	000027b7          	lui	a5,0x2
    8000449c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800044a0:	0097ee63          	bltu	a5,s1,800044bc <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800044a4:	00000713          	li	a4,0
    800044a8:	000077b7          	lui	a5,0x7
    800044ac:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800044b0:	fce7eee3          	bltu	a5,a4,8000448c <_ZN7WorkerA11workerBodyAEPv+0x20>
    800044b4:	00170713          	addi	a4,a4,1
    800044b8:	ff1ff06f          	j	800044a8 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800044bc:	00190913          	addi	s2,s2,1
    800044c0:	00900793          	li	a5,9
    800044c4:	0527e063          	bltu	a5,s2,80004504 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800044c8:	00006517          	auipc	a0,0x6
    800044cc:	f3850513          	addi	a0,a0,-200 # 8000a400 <CONSOLE_STATUS+0x3f0>
    800044d0:	00002097          	auipc	ra,0x2
    800044d4:	eac080e7          	jalr	-340(ra) # 8000637c <_Z11printStringPKc>
    800044d8:	00000613          	li	a2,0
    800044dc:	00a00593          	li	a1,10
    800044e0:	0009051b          	sext.w	a0,s2
    800044e4:	00002097          	auipc	ra,0x2
    800044e8:	048080e7          	jalr	72(ra) # 8000652c <_Z8printIntiii>
    800044ec:	00006517          	auipc	a0,0x6
    800044f0:	17450513          	addi	a0,a0,372 # 8000a660 <CONSOLE_STATUS+0x650>
    800044f4:	00002097          	auipc	ra,0x2
    800044f8:	e88080e7          	jalr	-376(ra) # 8000637c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800044fc:	00000493          	li	s1,0
    80004500:	f99ff06f          	j	80004498 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80004504:	00006517          	auipc	a0,0x6
    80004508:	f0450513          	addi	a0,a0,-252 # 8000a408 <CONSOLE_STATUS+0x3f8>
    8000450c:	00002097          	auipc	ra,0x2
    80004510:	e70080e7          	jalr	-400(ra) # 8000637c <_Z11printStringPKc>
    finishedA = true;
    80004514:	00100793          	li	a5,1
    80004518:	00009717          	auipc	a4,0x9
    8000451c:	d6f70c23          	sb	a5,-648(a4) # 8000d290 <_ZL9finishedA>
}
    80004520:	01813083          	ld	ra,24(sp)
    80004524:	01013403          	ld	s0,16(sp)
    80004528:	00813483          	ld	s1,8(sp)
    8000452c:	00013903          	ld	s2,0(sp)
    80004530:	02010113          	addi	sp,sp,32
    80004534:	00008067          	ret

0000000080004538 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80004538:	fe010113          	addi	sp,sp,-32
    8000453c:	00113c23          	sd	ra,24(sp)
    80004540:	00813823          	sd	s0,16(sp)
    80004544:	00913423          	sd	s1,8(sp)
    80004548:	01213023          	sd	s2,0(sp)
    8000454c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004550:	00000913          	li	s2,0
    80004554:	0380006f          	j	8000458c <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80004558:	ffffd097          	auipc	ra,0xffffd
    8000455c:	f68080e7          	jalr	-152(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004560:	00148493          	addi	s1,s1,1
    80004564:	000027b7          	lui	a5,0x2
    80004568:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000456c:	0097ee63          	bltu	a5,s1,80004588 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004570:	00000713          	li	a4,0
    80004574:	000077b7          	lui	a5,0x7
    80004578:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000457c:	fce7eee3          	bltu	a5,a4,80004558 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80004580:	00170713          	addi	a4,a4,1
    80004584:	ff1ff06f          	j	80004574 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004588:	00190913          	addi	s2,s2,1
    8000458c:	00f00793          	li	a5,15
    80004590:	0527e063          	bltu	a5,s2,800045d0 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004594:	00006517          	auipc	a0,0x6
    80004598:	e8450513          	addi	a0,a0,-380 # 8000a418 <CONSOLE_STATUS+0x408>
    8000459c:	00002097          	auipc	ra,0x2
    800045a0:	de0080e7          	jalr	-544(ra) # 8000637c <_Z11printStringPKc>
    800045a4:	00000613          	li	a2,0
    800045a8:	00a00593          	li	a1,10
    800045ac:	0009051b          	sext.w	a0,s2
    800045b0:	00002097          	auipc	ra,0x2
    800045b4:	f7c080e7          	jalr	-132(ra) # 8000652c <_Z8printIntiii>
    800045b8:	00006517          	auipc	a0,0x6
    800045bc:	0a850513          	addi	a0,a0,168 # 8000a660 <CONSOLE_STATUS+0x650>
    800045c0:	00002097          	auipc	ra,0x2
    800045c4:	dbc080e7          	jalr	-580(ra) # 8000637c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800045c8:	00000493          	li	s1,0
    800045cc:	f99ff06f          	j	80004564 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800045d0:	00006517          	auipc	a0,0x6
    800045d4:	e5050513          	addi	a0,a0,-432 # 8000a420 <CONSOLE_STATUS+0x410>
    800045d8:	00002097          	auipc	ra,0x2
    800045dc:	da4080e7          	jalr	-604(ra) # 8000637c <_Z11printStringPKc>
    finishedB = true;
    800045e0:	00100793          	li	a5,1
    800045e4:	00009717          	auipc	a4,0x9
    800045e8:	caf706a3          	sb	a5,-851(a4) # 8000d291 <_ZL9finishedB>
    thread_dispatch();
    800045ec:	ffffd097          	auipc	ra,0xffffd
    800045f0:	ed4080e7          	jalr	-300(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800045f4:	01813083          	ld	ra,24(sp)
    800045f8:	01013403          	ld	s0,16(sp)
    800045fc:	00813483          	ld	s1,8(sp)
    80004600:	00013903          	ld	s2,0(sp)
    80004604:	02010113          	addi	sp,sp,32
    80004608:	00008067          	ret

000000008000460c <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    8000460c:	fe010113          	addi	sp,sp,-32
    80004610:	00113c23          	sd	ra,24(sp)
    80004614:	00813823          	sd	s0,16(sp)
    80004618:	00913423          	sd	s1,8(sp)
    8000461c:	01213023          	sd	s2,0(sp)
    80004620:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004624:	00000493          	li	s1,0
    80004628:	0400006f          	j	80004668 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000462c:	00006517          	auipc	a0,0x6
    80004630:	e0450513          	addi	a0,a0,-508 # 8000a430 <CONSOLE_STATUS+0x420>
    80004634:	00002097          	auipc	ra,0x2
    80004638:	d48080e7          	jalr	-696(ra) # 8000637c <_Z11printStringPKc>
    8000463c:	00000613          	li	a2,0
    80004640:	00a00593          	li	a1,10
    80004644:	00048513          	mv	a0,s1
    80004648:	00002097          	auipc	ra,0x2
    8000464c:	ee4080e7          	jalr	-284(ra) # 8000652c <_Z8printIntiii>
    80004650:	00006517          	auipc	a0,0x6
    80004654:	01050513          	addi	a0,a0,16 # 8000a660 <CONSOLE_STATUS+0x650>
    80004658:	00002097          	auipc	ra,0x2
    8000465c:	d24080e7          	jalr	-732(ra) # 8000637c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004660:	0014849b          	addiw	s1,s1,1
    80004664:	0ff4f493          	andi	s1,s1,255
    80004668:	00200793          	li	a5,2
    8000466c:	fc97f0e3          	bgeu	a5,s1,8000462c <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80004670:	00006517          	auipc	a0,0x6
    80004674:	dc850513          	addi	a0,a0,-568 # 8000a438 <CONSOLE_STATUS+0x428>
    80004678:	00002097          	auipc	ra,0x2
    8000467c:	d04080e7          	jalr	-764(ra) # 8000637c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004680:	00700313          	li	t1,7
    thread_dispatch();
    80004684:	ffffd097          	auipc	ra,0xffffd
    80004688:	e3c080e7          	jalr	-452(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000468c:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80004690:	00006517          	auipc	a0,0x6
    80004694:	db850513          	addi	a0,a0,-584 # 8000a448 <CONSOLE_STATUS+0x438>
    80004698:	00002097          	auipc	ra,0x2
    8000469c:	ce4080e7          	jalr	-796(ra) # 8000637c <_Z11printStringPKc>
    800046a0:	00000613          	li	a2,0
    800046a4:	00a00593          	li	a1,10
    800046a8:	0009051b          	sext.w	a0,s2
    800046ac:	00002097          	auipc	ra,0x2
    800046b0:	e80080e7          	jalr	-384(ra) # 8000652c <_Z8printIntiii>
    800046b4:	00006517          	auipc	a0,0x6
    800046b8:	fac50513          	addi	a0,a0,-84 # 8000a660 <CONSOLE_STATUS+0x650>
    800046bc:	00002097          	auipc	ra,0x2
    800046c0:	cc0080e7          	jalr	-832(ra) # 8000637c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800046c4:	00c00513          	li	a0,12
    800046c8:	00000097          	auipc	ra,0x0
    800046cc:	d30080e7          	jalr	-720(ra) # 800043f8 <_ZL9fibonaccim>
    800046d0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800046d4:	00006517          	auipc	a0,0x6
    800046d8:	d7c50513          	addi	a0,a0,-644 # 8000a450 <CONSOLE_STATUS+0x440>
    800046dc:	00002097          	auipc	ra,0x2
    800046e0:	ca0080e7          	jalr	-864(ra) # 8000637c <_Z11printStringPKc>
    800046e4:	00000613          	li	a2,0
    800046e8:	00a00593          	li	a1,10
    800046ec:	0009051b          	sext.w	a0,s2
    800046f0:	00002097          	auipc	ra,0x2
    800046f4:	e3c080e7          	jalr	-452(ra) # 8000652c <_Z8printIntiii>
    800046f8:	00006517          	auipc	a0,0x6
    800046fc:	f6850513          	addi	a0,a0,-152 # 8000a660 <CONSOLE_STATUS+0x650>
    80004700:	00002097          	auipc	ra,0x2
    80004704:	c7c080e7          	jalr	-900(ra) # 8000637c <_Z11printStringPKc>
    80004708:	0400006f          	j	80004748 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000470c:	00006517          	auipc	a0,0x6
    80004710:	d2450513          	addi	a0,a0,-732 # 8000a430 <CONSOLE_STATUS+0x420>
    80004714:	00002097          	auipc	ra,0x2
    80004718:	c68080e7          	jalr	-920(ra) # 8000637c <_Z11printStringPKc>
    8000471c:	00000613          	li	a2,0
    80004720:	00a00593          	li	a1,10
    80004724:	00048513          	mv	a0,s1
    80004728:	00002097          	auipc	ra,0x2
    8000472c:	e04080e7          	jalr	-508(ra) # 8000652c <_Z8printIntiii>
    80004730:	00006517          	auipc	a0,0x6
    80004734:	f3050513          	addi	a0,a0,-208 # 8000a660 <CONSOLE_STATUS+0x650>
    80004738:	00002097          	auipc	ra,0x2
    8000473c:	c44080e7          	jalr	-956(ra) # 8000637c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004740:	0014849b          	addiw	s1,s1,1
    80004744:	0ff4f493          	andi	s1,s1,255
    80004748:	00500793          	li	a5,5
    8000474c:	fc97f0e3          	bgeu	a5,s1,8000470c <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80004750:	00006517          	auipc	a0,0x6
    80004754:	d1050513          	addi	a0,a0,-752 # 8000a460 <CONSOLE_STATUS+0x450>
    80004758:	00002097          	auipc	ra,0x2
    8000475c:	c24080e7          	jalr	-988(ra) # 8000637c <_Z11printStringPKc>
    finishedC = true;
    80004760:	00100793          	li	a5,1
    80004764:	00009717          	auipc	a4,0x9
    80004768:	b2f70723          	sb	a5,-1234(a4) # 8000d292 <_ZL9finishedC>
    thread_dispatch();
    8000476c:	ffffd097          	auipc	ra,0xffffd
    80004770:	d54080e7          	jalr	-684(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80004774:	01813083          	ld	ra,24(sp)
    80004778:	01013403          	ld	s0,16(sp)
    8000477c:	00813483          	ld	s1,8(sp)
    80004780:	00013903          	ld	s2,0(sp)
    80004784:	02010113          	addi	sp,sp,32
    80004788:	00008067          	ret

000000008000478c <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    8000478c:	fe010113          	addi	sp,sp,-32
    80004790:	00113c23          	sd	ra,24(sp)
    80004794:	00813823          	sd	s0,16(sp)
    80004798:	00913423          	sd	s1,8(sp)
    8000479c:	01213023          	sd	s2,0(sp)
    800047a0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800047a4:	00a00493          	li	s1,10
    800047a8:	0400006f          	j	800047e8 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800047ac:	00006517          	auipc	a0,0x6
    800047b0:	cc450513          	addi	a0,a0,-828 # 8000a470 <CONSOLE_STATUS+0x460>
    800047b4:	00002097          	auipc	ra,0x2
    800047b8:	bc8080e7          	jalr	-1080(ra) # 8000637c <_Z11printStringPKc>
    800047bc:	00000613          	li	a2,0
    800047c0:	00a00593          	li	a1,10
    800047c4:	00048513          	mv	a0,s1
    800047c8:	00002097          	auipc	ra,0x2
    800047cc:	d64080e7          	jalr	-668(ra) # 8000652c <_Z8printIntiii>
    800047d0:	00006517          	auipc	a0,0x6
    800047d4:	e9050513          	addi	a0,a0,-368 # 8000a660 <CONSOLE_STATUS+0x650>
    800047d8:	00002097          	auipc	ra,0x2
    800047dc:	ba4080e7          	jalr	-1116(ra) # 8000637c <_Z11printStringPKc>
    for (; i < 13; i++) {
    800047e0:	0014849b          	addiw	s1,s1,1
    800047e4:	0ff4f493          	andi	s1,s1,255
    800047e8:	00c00793          	li	a5,12
    800047ec:	fc97f0e3          	bgeu	a5,s1,800047ac <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800047f0:	00006517          	auipc	a0,0x6
    800047f4:	c8850513          	addi	a0,a0,-888 # 8000a478 <CONSOLE_STATUS+0x468>
    800047f8:	00002097          	auipc	ra,0x2
    800047fc:	b84080e7          	jalr	-1148(ra) # 8000637c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004800:	00500313          	li	t1,5
    thread_dispatch();
    80004804:	ffffd097          	auipc	ra,0xffffd
    80004808:	cbc080e7          	jalr	-836(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000480c:	01000513          	li	a0,16
    80004810:	00000097          	auipc	ra,0x0
    80004814:	be8080e7          	jalr	-1048(ra) # 800043f8 <_ZL9fibonaccim>
    80004818:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000481c:	00006517          	auipc	a0,0x6
    80004820:	c6c50513          	addi	a0,a0,-916 # 8000a488 <CONSOLE_STATUS+0x478>
    80004824:	00002097          	auipc	ra,0x2
    80004828:	b58080e7          	jalr	-1192(ra) # 8000637c <_Z11printStringPKc>
    8000482c:	00000613          	li	a2,0
    80004830:	00a00593          	li	a1,10
    80004834:	0009051b          	sext.w	a0,s2
    80004838:	00002097          	auipc	ra,0x2
    8000483c:	cf4080e7          	jalr	-780(ra) # 8000652c <_Z8printIntiii>
    80004840:	00006517          	auipc	a0,0x6
    80004844:	e2050513          	addi	a0,a0,-480 # 8000a660 <CONSOLE_STATUS+0x650>
    80004848:	00002097          	auipc	ra,0x2
    8000484c:	b34080e7          	jalr	-1228(ra) # 8000637c <_Z11printStringPKc>
    80004850:	0400006f          	j	80004890 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004854:	00006517          	auipc	a0,0x6
    80004858:	c1c50513          	addi	a0,a0,-996 # 8000a470 <CONSOLE_STATUS+0x460>
    8000485c:	00002097          	auipc	ra,0x2
    80004860:	b20080e7          	jalr	-1248(ra) # 8000637c <_Z11printStringPKc>
    80004864:	00000613          	li	a2,0
    80004868:	00a00593          	li	a1,10
    8000486c:	00048513          	mv	a0,s1
    80004870:	00002097          	auipc	ra,0x2
    80004874:	cbc080e7          	jalr	-836(ra) # 8000652c <_Z8printIntiii>
    80004878:	00006517          	auipc	a0,0x6
    8000487c:	de850513          	addi	a0,a0,-536 # 8000a660 <CONSOLE_STATUS+0x650>
    80004880:	00002097          	auipc	ra,0x2
    80004884:	afc080e7          	jalr	-1284(ra) # 8000637c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004888:	0014849b          	addiw	s1,s1,1
    8000488c:	0ff4f493          	andi	s1,s1,255
    80004890:	00f00793          	li	a5,15
    80004894:	fc97f0e3          	bgeu	a5,s1,80004854 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004898:	00006517          	auipc	a0,0x6
    8000489c:	c0050513          	addi	a0,a0,-1024 # 8000a498 <CONSOLE_STATUS+0x488>
    800048a0:	00002097          	auipc	ra,0x2
    800048a4:	adc080e7          	jalr	-1316(ra) # 8000637c <_Z11printStringPKc>
    finishedD = true;
    800048a8:	00100793          	li	a5,1
    800048ac:	00009717          	auipc	a4,0x9
    800048b0:	9ef703a3          	sb	a5,-1561(a4) # 8000d293 <_ZL9finishedD>
    thread_dispatch();
    800048b4:	ffffd097          	auipc	ra,0xffffd
    800048b8:	c0c080e7          	jalr	-1012(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800048bc:	01813083          	ld	ra,24(sp)
    800048c0:	01013403          	ld	s0,16(sp)
    800048c4:	00813483          	ld	s1,8(sp)
    800048c8:	00013903          	ld	s2,0(sp)
    800048cc:	02010113          	addi	sp,sp,32
    800048d0:	00008067          	ret

00000000800048d4 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800048d4:	fc010113          	addi	sp,sp,-64
    800048d8:	02113c23          	sd	ra,56(sp)
    800048dc:	02813823          	sd	s0,48(sp)
    800048e0:	02913423          	sd	s1,40(sp)
    800048e4:	03213023          	sd	s2,32(sp)
    800048e8:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800048ec:	02000513          	li	a0,32
    800048f0:	fffff097          	auipc	ra,0xfffff
    800048f4:	814080e7          	jalr	-2028(ra) # 80003104 <_Znwm>
    800048f8:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800048fc:	fffff097          	auipc	ra,0xfffff
    80004900:	af8080e7          	jalr	-1288(ra) # 800033f4 <_ZN6ThreadC1Ev>
    80004904:	00008797          	auipc	a5,0x8
    80004908:	5ac78793          	addi	a5,a5,1452 # 8000ceb0 <_ZTV7WorkerA+0x10>
    8000490c:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004910:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004914:	00006517          	auipc	a0,0x6
    80004918:	b9450513          	addi	a0,a0,-1132 # 8000a4a8 <CONSOLE_STATUS+0x498>
    8000491c:	00002097          	auipc	ra,0x2
    80004920:	a60080e7          	jalr	-1440(ra) # 8000637c <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004924:	02000513          	li	a0,32
    80004928:	ffffe097          	auipc	ra,0xffffe
    8000492c:	7dc080e7          	jalr	2012(ra) # 80003104 <_Znwm>
    80004930:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004934:	fffff097          	auipc	ra,0xfffff
    80004938:	ac0080e7          	jalr	-1344(ra) # 800033f4 <_ZN6ThreadC1Ev>
    8000493c:	00008797          	auipc	a5,0x8
    80004940:	59c78793          	addi	a5,a5,1436 # 8000ced8 <_ZTV7WorkerB+0x10>
    80004944:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004948:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    8000494c:	00006517          	auipc	a0,0x6
    80004950:	b7450513          	addi	a0,a0,-1164 # 8000a4c0 <CONSOLE_STATUS+0x4b0>
    80004954:	00002097          	auipc	ra,0x2
    80004958:	a28080e7          	jalr	-1496(ra) # 8000637c <_Z11printStringPKc>

    threads[2] = new WorkerC();
    8000495c:	02000513          	li	a0,32
    80004960:	ffffe097          	auipc	ra,0xffffe
    80004964:	7a4080e7          	jalr	1956(ra) # 80003104 <_Znwm>
    80004968:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    8000496c:	fffff097          	auipc	ra,0xfffff
    80004970:	a88080e7          	jalr	-1400(ra) # 800033f4 <_ZN6ThreadC1Ev>
    80004974:	00008797          	auipc	a5,0x8
    80004978:	58c78793          	addi	a5,a5,1420 # 8000cf00 <_ZTV7WorkerC+0x10>
    8000497c:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004980:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80004984:	00006517          	auipc	a0,0x6
    80004988:	b5450513          	addi	a0,a0,-1196 # 8000a4d8 <CONSOLE_STATUS+0x4c8>
    8000498c:	00002097          	auipc	ra,0x2
    80004990:	9f0080e7          	jalr	-1552(ra) # 8000637c <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004994:	02000513          	li	a0,32
    80004998:	ffffe097          	auipc	ra,0xffffe
    8000499c:	76c080e7          	jalr	1900(ra) # 80003104 <_Znwm>
    800049a0:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800049a4:	fffff097          	auipc	ra,0xfffff
    800049a8:	a50080e7          	jalr	-1456(ra) # 800033f4 <_ZN6ThreadC1Ev>
    800049ac:	00008797          	auipc	a5,0x8
    800049b0:	57c78793          	addi	a5,a5,1404 # 8000cf28 <_ZTV7WorkerD+0x10>
    800049b4:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800049b8:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800049bc:	00006517          	auipc	a0,0x6
    800049c0:	b3450513          	addi	a0,a0,-1228 # 8000a4f0 <CONSOLE_STATUS+0x4e0>
    800049c4:	00002097          	auipc	ra,0x2
    800049c8:	9b8080e7          	jalr	-1608(ra) # 8000637c <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800049cc:	00000493          	li	s1,0
    800049d0:	00300793          	li	a5,3
    800049d4:	0297c663          	blt	a5,s1,80004a00 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800049d8:	00349793          	slli	a5,s1,0x3
    800049dc:	fe040713          	addi	a4,s0,-32
    800049e0:	00f707b3          	add	a5,a4,a5
    800049e4:	fe07b503          	ld	a0,-32(a5)
    800049e8:	fffff097          	auipc	ra,0xfffff
    800049ec:	8d4080e7          	jalr	-1836(ra) # 800032bc <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800049f0:	0014849b          	addiw	s1,s1,1
    800049f4:	fddff06f          	j	800049d0 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800049f8:	fffff097          	auipc	ra,0xfffff
    800049fc:	940080e7          	jalr	-1728(ra) # 80003338 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004a00:	00009797          	auipc	a5,0x9
    80004a04:	8907c783          	lbu	a5,-1904(a5) # 8000d290 <_ZL9finishedA>
    80004a08:	fe0788e3          	beqz	a5,800049f8 <_Z20Threads_CPP_API_testv+0x124>
    80004a0c:	00009797          	auipc	a5,0x9
    80004a10:	8857c783          	lbu	a5,-1915(a5) # 8000d291 <_ZL9finishedB>
    80004a14:	fe0782e3          	beqz	a5,800049f8 <_Z20Threads_CPP_API_testv+0x124>
    80004a18:	00009797          	auipc	a5,0x9
    80004a1c:	87a7c783          	lbu	a5,-1926(a5) # 8000d292 <_ZL9finishedC>
    80004a20:	fc078ce3          	beqz	a5,800049f8 <_Z20Threads_CPP_API_testv+0x124>
    80004a24:	00009797          	auipc	a5,0x9
    80004a28:	86f7c783          	lbu	a5,-1937(a5) # 8000d293 <_ZL9finishedD>
    80004a2c:	fc0786e3          	beqz	a5,800049f8 <_Z20Threads_CPP_API_testv+0x124>
    80004a30:	fc040493          	addi	s1,s0,-64
    80004a34:	0080006f          	j	80004a3c <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    80004a38:	00848493          	addi	s1,s1,8
    80004a3c:	fe040793          	addi	a5,s0,-32
    80004a40:	08f48663          	beq	s1,a5,80004acc <_Z20Threads_CPP_API_testv+0x1f8>
    80004a44:	0004b503          	ld	a0,0(s1)
		delete thread;
    80004a48:	fe0508e3          	beqz	a0,80004a38 <_Z20Threads_CPP_API_testv+0x164>
    80004a4c:	00053783          	ld	a5,0(a0)
    80004a50:	0087b783          	ld	a5,8(a5)
    80004a54:	000780e7          	jalr	a5
    80004a58:	fe1ff06f          	j	80004a38 <_Z20Threads_CPP_API_testv+0x164>
    80004a5c:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004a60:	00048513          	mv	a0,s1
    80004a64:	ffffe097          	auipc	ra,0xffffe
    80004a68:	6f0080e7          	jalr	1776(ra) # 80003154 <_ZdlPv>
    80004a6c:	00090513          	mv	a0,s2
    80004a70:	0000a097          	auipc	ra,0xa
    80004a74:	948080e7          	jalr	-1720(ra) # 8000e3b8 <_Unwind_Resume>
    80004a78:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004a7c:	00048513          	mv	a0,s1
    80004a80:	ffffe097          	auipc	ra,0xffffe
    80004a84:	6d4080e7          	jalr	1748(ra) # 80003154 <_ZdlPv>
    80004a88:	00090513          	mv	a0,s2
    80004a8c:	0000a097          	auipc	ra,0xa
    80004a90:	92c080e7          	jalr	-1748(ra) # 8000e3b8 <_Unwind_Resume>
    80004a94:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004a98:	00048513          	mv	a0,s1
    80004a9c:	ffffe097          	auipc	ra,0xffffe
    80004aa0:	6b8080e7          	jalr	1720(ra) # 80003154 <_ZdlPv>
    80004aa4:	00090513          	mv	a0,s2
    80004aa8:	0000a097          	auipc	ra,0xa
    80004aac:	910080e7          	jalr	-1776(ra) # 8000e3b8 <_Unwind_Resume>
    80004ab0:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004ab4:	00048513          	mv	a0,s1
    80004ab8:	ffffe097          	auipc	ra,0xffffe
    80004abc:	69c080e7          	jalr	1692(ra) # 80003154 <_ZdlPv>
    80004ac0:	00090513          	mv	a0,s2
    80004ac4:	0000a097          	auipc	ra,0xa
    80004ac8:	8f4080e7          	jalr	-1804(ra) # 8000e3b8 <_Unwind_Resume>
	}
}
    80004acc:	03813083          	ld	ra,56(sp)
    80004ad0:	03013403          	ld	s0,48(sp)
    80004ad4:	02813483          	ld	s1,40(sp)
    80004ad8:	02013903          	ld	s2,32(sp)
    80004adc:	04010113          	addi	sp,sp,64
    80004ae0:	00008067          	ret

0000000080004ae4 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004ae4:	ff010113          	addi	sp,sp,-16
    80004ae8:	00113423          	sd	ra,8(sp)
    80004aec:	00813023          	sd	s0,0(sp)
    80004af0:	01010413          	addi	s0,sp,16
    80004af4:	00008797          	auipc	a5,0x8
    80004af8:	3bc78793          	addi	a5,a5,956 # 8000ceb0 <_ZTV7WorkerA+0x10>
    80004afc:	00f53023          	sd	a5,0(a0)
    80004b00:	ffffe097          	auipc	ra,0xffffe
    80004b04:	524080e7          	jalr	1316(ra) # 80003024 <_ZN6ThreadD1Ev>
    80004b08:	00813083          	ld	ra,8(sp)
    80004b0c:	00013403          	ld	s0,0(sp)
    80004b10:	01010113          	addi	sp,sp,16
    80004b14:	00008067          	ret

0000000080004b18 <_ZN7WorkerAD0Ev>:
    80004b18:	fe010113          	addi	sp,sp,-32
    80004b1c:	00113c23          	sd	ra,24(sp)
    80004b20:	00813823          	sd	s0,16(sp)
    80004b24:	00913423          	sd	s1,8(sp)
    80004b28:	02010413          	addi	s0,sp,32
    80004b2c:	00050493          	mv	s1,a0
    80004b30:	00008797          	auipc	a5,0x8
    80004b34:	38078793          	addi	a5,a5,896 # 8000ceb0 <_ZTV7WorkerA+0x10>
    80004b38:	00f53023          	sd	a5,0(a0)
    80004b3c:	ffffe097          	auipc	ra,0xffffe
    80004b40:	4e8080e7          	jalr	1256(ra) # 80003024 <_ZN6ThreadD1Ev>
    80004b44:	00048513          	mv	a0,s1
    80004b48:	ffffe097          	auipc	ra,0xffffe
    80004b4c:	60c080e7          	jalr	1548(ra) # 80003154 <_ZdlPv>
    80004b50:	01813083          	ld	ra,24(sp)
    80004b54:	01013403          	ld	s0,16(sp)
    80004b58:	00813483          	ld	s1,8(sp)
    80004b5c:	02010113          	addi	sp,sp,32
    80004b60:	00008067          	ret

0000000080004b64 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80004b64:	ff010113          	addi	sp,sp,-16
    80004b68:	00113423          	sd	ra,8(sp)
    80004b6c:	00813023          	sd	s0,0(sp)
    80004b70:	01010413          	addi	s0,sp,16
    80004b74:	00008797          	auipc	a5,0x8
    80004b78:	36478793          	addi	a5,a5,868 # 8000ced8 <_ZTV7WorkerB+0x10>
    80004b7c:	00f53023          	sd	a5,0(a0)
    80004b80:	ffffe097          	auipc	ra,0xffffe
    80004b84:	4a4080e7          	jalr	1188(ra) # 80003024 <_ZN6ThreadD1Ev>
    80004b88:	00813083          	ld	ra,8(sp)
    80004b8c:	00013403          	ld	s0,0(sp)
    80004b90:	01010113          	addi	sp,sp,16
    80004b94:	00008067          	ret

0000000080004b98 <_ZN7WorkerBD0Ev>:
    80004b98:	fe010113          	addi	sp,sp,-32
    80004b9c:	00113c23          	sd	ra,24(sp)
    80004ba0:	00813823          	sd	s0,16(sp)
    80004ba4:	00913423          	sd	s1,8(sp)
    80004ba8:	02010413          	addi	s0,sp,32
    80004bac:	00050493          	mv	s1,a0
    80004bb0:	00008797          	auipc	a5,0x8
    80004bb4:	32878793          	addi	a5,a5,808 # 8000ced8 <_ZTV7WorkerB+0x10>
    80004bb8:	00f53023          	sd	a5,0(a0)
    80004bbc:	ffffe097          	auipc	ra,0xffffe
    80004bc0:	468080e7          	jalr	1128(ra) # 80003024 <_ZN6ThreadD1Ev>
    80004bc4:	00048513          	mv	a0,s1
    80004bc8:	ffffe097          	auipc	ra,0xffffe
    80004bcc:	58c080e7          	jalr	1420(ra) # 80003154 <_ZdlPv>
    80004bd0:	01813083          	ld	ra,24(sp)
    80004bd4:	01013403          	ld	s0,16(sp)
    80004bd8:	00813483          	ld	s1,8(sp)
    80004bdc:	02010113          	addi	sp,sp,32
    80004be0:	00008067          	ret

0000000080004be4 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004be4:	ff010113          	addi	sp,sp,-16
    80004be8:	00113423          	sd	ra,8(sp)
    80004bec:	00813023          	sd	s0,0(sp)
    80004bf0:	01010413          	addi	s0,sp,16
    80004bf4:	00008797          	auipc	a5,0x8
    80004bf8:	30c78793          	addi	a5,a5,780 # 8000cf00 <_ZTV7WorkerC+0x10>
    80004bfc:	00f53023          	sd	a5,0(a0)
    80004c00:	ffffe097          	auipc	ra,0xffffe
    80004c04:	424080e7          	jalr	1060(ra) # 80003024 <_ZN6ThreadD1Ev>
    80004c08:	00813083          	ld	ra,8(sp)
    80004c0c:	00013403          	ld	s0,0(sp)
    80004c10:	01010113          	addi	sp,sp,16
    80004c14:	00008067          	ret

0000000080004c18 <_ZN7WorkerCD0Ev>:
    80004c18:	fe010113          	addi	sp,sp,-32
    80004c1c:	00113c23          	sd	ra,24(sp)
    80004c20:	00813823          	sd	s0,16(sp)
    80004c24:	00913423          	sd	s1,8(sp)
    80004c28:	02010413          	addi	s0,sp,32
    80004c2c:	00050493          	mv	s1,a0
    80004c30:	00008797          	auipc	a5,0x8
    80004c34:	2d078793          	addi	a5,a5,720 # 8000cf00 <_ZTV7WorkerC+0x10>
    80004c38:	00f53023          	sd	a5,0(a0)
    80004c3c:	ffffe097          	auipc	ra,0xffffe
    80004c40:	3e8080e7          	jalr	1000(ra) # 80003024 <_ZN6ThreadD1Ev>
    80004c44:	00048513          	mv	a0,s1
    80004c48:	ffffe097          	auipc	ra,0xffffe
    80004c4c:	50c080e7          	jalr	1292(ra) # 80003154 <_ZdlPv>
    80004c50:	01813083          	ld	ra,24(sp)
    80004c54:	01013403          	ld	s0,16(sp)
    80004c58:	00813483          	ld	s1,8(sp)
    80004c5c:	02010113          	addi	sp,sp,32
    80004c60:	00008067          	ret

0000000080004c64 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004c64:	ff010113          	addi	sp,sp,-16
    80004c68:	00113423          	sd	ra,8(sp)
    80004c6c:	00813023          	sd	s0,0(sp)
    80004c70:	01010413          	addi	s0,sp,16
    80004c74:	00008797          	auipc	a5,0x8
    80004c78:	2b478793          	addi	a5,a5,692 # 8000cf28 <_ZTV7WorkerD+0x10>
    80004c7c:	00f53023          	sd	a5,0(a0)
    80004c80:	ffffe097          	auipc	ra,0xffffe
    80004c84:	3a4080e7          	jalr	932(ra) # 80003024 <_ZN6ThreadD1Ev>
    80004c88:	00813083          	ld	ra,8(sp)
    80004c8c:	00013403          	ld	s0,0(sp)
    80004c90:	01010113          	addi	sp,sp,16
    80004c94:	00008067          	ret

0000000080004c98 <_ZN7WorkerDD0Ev>:
    80004c98:	fe010113          	addi	sp,sp,-32
    80004c9c:	00113c23          	sd	ra,24(sp)
    80004ca0:	00813823          	sd	s0,16(sp)
    80004ca4:	00913423          	sd	s1,8(sp)
    80004ca8:	02010413          	addi	s0,sp,32
    80004cac:	00050493          	mv	s1,a0
    80004cb0:	00008797          	auipc	a5,0x8
    80004cb4:	27878793          	addi	a5,a5,632 # 8000cf28 <_ZTV7WorkerD+0x10>
    80004cb8:	00f53023          	sd	a5,0(a0)
    80004cbc:	ffffe097          	auipc	ra,0xffffe
    80004cc0:	368080e7          	jalr	872(ra) # 80003024 <_ZN6ThreadD1Ev>
    80004cc4:	00048513          	mv	a0,s1
    80004cc8:	ffffe097          	auipc	ra,0xffffe
    80004ccc:	48c080e7          	jalr	1164(ra) # 80003154 <_ZdlPv>
    80004cd0:	01813083          	ld	ra,24(sp)
    80004cd4:	01013403          	ld	s0,16(sp)
    80004cd8:	00813483          	ld	s1,8(sp)
    80004cdc:	02010113          	addi	sp,sp,32
    80004ce0:	00008067          	ret

0000000080004ce4 <_ZN7WorkerA3runEv>:
    void run() override {
    80004ce4:	ff010113          	addi	sp,sp,-16
    80004ce8:	00113423          	sd	ra,8(sp)
    80004cec:	00813023          	sd	s0,0(sp)
    80004cf0:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004cf4:	00000593          	li	a1,0
    80004cf8:	fffff097          	auipc	ra,0xfffff
    80004cfc:	774080e7          	jalr	1908(ra) # 8000446c <_ZN7WorkerA11workerBodyAEPv>
    }
    80004d00:	00813083          	ld	ra,8(sp)
    80004d04:	00013403          	ld	s0,0(sp)
    80004d08:	01010113          	addi	sp,sp,16
    80004d0c:	00008067          	ret

0000000080004d10 <_ZN7WorkerB3runEv>:
    void run() override {
    80004d10:	ff010113          	addi	sp,sp,-16
    80004d14:	00113423          	sd	ra,8(sp)
    80004d18:	00813023          	sd	s0,0(sp)
    80004d1c:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004d20:	00000593          	li	a1,0
    80004d24:	00000097          	auipc	ra,0x0
    80004d28:	814080e7          	jalr	-2028(ra) # 80004538 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004d2c:	00813083          	ld	ra,8(sp)
    80004d30:	00013403          	ld	s0,0(sp)
    80004d34:	01010113          	addi	sp,sp,16
    80004d38:	00008067          	ret

0000000080004d3c <_ZN7WorkerC3runEv>:
    void run() override {
    80004d3c:	ff010113          	addi	sp,sp,-16
    80004d40:	00113423          	sd	ra,8(sp)
    80004d44:	00813023          	sd	s0,0(sp)
    80004d48:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004d4c:	00000593          	li	a1,0
    80004d50:	00000097          	auipc	ra,0x0
    80004d54:	8bc080e7          	jalr	-1860(ra) # 8000460c <_ZN7WorkerC11workerBodyCEPv>
    }
    80004d58:	00813083          	ld	ra,8(sp)
    80004d5c:	00013403          	ld	s0,0(sp)
    80004d60:	01010113          	addi	sp,sp,16
    80004d64:	00008067          	ret

0000000080004d68 <_ZN7WorkerD3runEv>:
    void run() override {
    80004d68:	ff010113          	addi	sp,sp,-16
    80004d6c:	00113423          	sd	ra,8(sp)
    80004d70:	00813023          	sd	s0,0(sp)
    80004d74:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004d78:	00000593          	li	a1,0
    80004d7c:	00000097          	auipc	ra,0x0
    80004d80:	a10080e7          	jalr	-1520(ra) # 8000478c <_ZN7WorkerD11workerBodyDEPv>
    }
    80004d84:	00813083          	ld	ra,8(sp)
    80004d88:	00013403          	ld	s0,0(sp)
    80004d8c:	01010113          	addi	sp,sp,16
    80004d90:	00008067          	ret

0000000080004d94 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004d94:	f8010113          	addi	sp,sp,-128
    80004d98:	06113c23          	sd	ra,120(sp)
    80004d9c:	06813823          	sd	s0,112(sp)
    80004da0:	06913423          	sd	s1,104(sp)
    80004da4:	07213023          	sd	s2,96(sp)
    80004da8:	05313c23          	sd	s3,88(sp)
    80004dac:	05413823          	sd	s4,80(sp)
    80004db0:	05513423          	sd	s5,72(sp)
    80004db4:	05613023          	sd	s6,64(sp)
    80004db8:	03713c23          	sd	s7,56(sp)
    80004dbc:	03813823          	sd	s8,48(sp)
    80004dc0:	03913423          	sd	s9,40(sp)
    80004dc4:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004dc8:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004dcc:	00005517          	auipc	a0,0x5
    80004dd0:	54c50513          	addi	a0,a0,1356 # 8000a318 <CONSOLE_STATUS+0x308>
    80004dd4:	00001097          	auipc	ra,0x1
    80004dd8:	5a8080e7          	jalr	1448(ra) # 8000637c <_Z11printStringPKc>
    getString(input, 30);
    80004ddc:	01e00593          	li	a1,30
    80004de0:	f8040493          	addi	s1,s0,-128
    80004de4:	00048513          	mv	a0,s1
    80004de8:	00001097          	auipc	ra,0x1
    80004dec:	61c080e7          	jalr	1564(ra) # 80006404 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004df0:	00048513          	mv	a0,s1
    80004df4:	00001097          	auipc	ra,0x1
    80004df8:	6e8080e7          	jalr	1768(ra) # 800064dc <_Z11stringToIntPKc>
    80004dfc:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004e00:	00005517          	auipc	a0,0x5
    80004e04:	53850513          	addi	a0,a0,1336 # 8000a338 <CONSOLE_STATUS+0x328>
    80004e08:	00001097          	auipc	ra,0x1
    80004e0c:	574080e7          	jalr	1396(ra) # 8000637c <_Z11printStringPKc>
    getString(input, 30);
    80004e10:	01e00593          	li	a1,30
    80004e14:	00048513          	mv	a0,s1
    80004e18:	00001097          	auipc	ra,0x1
    80004e1c:	5ec080e7          	jalr	1516(ra) # 80006404 <_Z9getStringPci>
    n = stringToInt(input);
    80004e20:	00048513          	mv	a0,s1
    80004e24:	00001097          	auipc	ra,0x1
    80004e28:	6b8080e7          	jalr	1720(ra) # 800064dc <_Z11stringToIntPKc>
    80004e2c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004e30:	00005517          	auipc	a0,0x5
    80004e34:	52850513          	addi	a0,a0,1320 # 8000a358 <CONSOLE_STATUS+0x348>
    80004e38:	00001097          	auipc	ra,0x1
    80004e3c:	544080e7          	jalr	1348(ra) # 8000637c <_Z11printStringPKc>
    printInt(threadNum);
    80004e40:	00000613          	li	a2,0
    80004e44:	00a00593          	li	a1,10
    80004e48:	00098513          	mv	a0,s3
    80004e4c:	00001097          	auipc	ra,0x1
    80004e50:	6e0080e7          	jalr	1760(ra) # 8000652c <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004e54:	00005517          	auipc	a0,0x5
    80004e58:	51c50513          	addi	a0,a0,1308 # 8000a370 <CONSOLE_STATUS+0x360>
    80004e5c:	00001097          	auipc	ra,0x1
    80004e60:	520080e7          	jalr	1312(ra) # 8000637c <_Z11printStringPKc>
    printInt(n);
    80004e64:	00000613          	li	a2,0
    80004e68:	00a00593          	li	a1,10
    80004e6c:	00048513          	mv	a0,s1
    80004e70:	00001097          	auipc	ra,0x1
    80004e74:	6bc080e7          	jalr	1724(ra) # 8000652c <_Z8printIntiii>
    printString(".\n");
    80004e78:	00005517          	auipc	a0,0x5
    80004e7c:	51050513          	addi	a0,a0,1296 # 8000a388 <CONSOLE_STATUS+0x378>
    80004e80:	00001097          	auipc	ra,0x1
    80004e84:	4fc080e7          	jalr	1276(ra) # 8000637c <_Z11printStringPKc>
    if (threadNum > n) {
    80004e88:	0334c463          	blt	s1,s3,80004eb0 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004e8c:	03305c63          	blez	s3,80004ec4 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004e90:	03800513          	li	a0,56
    80004e94:	ffffe097          	auipc	ra,0xffffe
    80004e98:	270080e7          	jalr	624(ra) # 80003104 <_Znwm>
    80004e9c:	00050a93          	mv	s5,a0
    80004ea0:	00048593          	mv	a1,s1
    80004ea4:	00001097          	auipc	ra,0x1
    80004ea8:	7a8080e7          	jalr	1960(ra) # 8000664c <_ZN9BufferCPPC1Ei>
    80004eac:	0300006f          	j	80004edc <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004eb0:	00005517          	auipc	a0,0x5
    80004eb4:	4e050513          	addi	a0,a0,1248 # 8000a390 <CONSOLE_STATUS+0x380>
    80004eb8:	00001097          	auipc	ra,0x1
    80004ebc:	4c4080e7          	jalr	1220(ra) # 8000637c <_Z11printStringPKc>
        return;
    80004ec0:	0140006f          	j	80004ed4 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004ec4:	00005517          	auipc	a0,0x5
    80004ec8:	50c50513          	addi	a0,a0,1292 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80004ecc:	00001097          	auipc	ra,0x1
    80004ed0:	4b0080e7          	jalr	1200(ra) # 8000637c <_Z11printStringPKc>
        return;
    80004ed4:	000c0113          	mv	sp,s8
    80004ed8:	2140006f          	j	800050ec <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004edc:	01000513          	li	a0,16
    80004ee0:	ffffe097          	auipc	ra,0xffffe
    80004ee4:	224080e7          	jalr	548(ra) # 80003104 <_Znwm>
    80004ee8:	00050913          	mv	s2,a0
    80004eec:	00000593          	li	a1,0
    80004ef0:	ffffe097          	auipc	ra,0xffffe
    80004ef4:	580080e7          	jalr	1408(ra) # 80003470 <_ZN9SemaphoreC1Ej>
    80004ef8:	00008797          	auipc	a5,0x8
    80004efc:	3b27b423          	sd	s2,936(a5) # 8000d2a0 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004f00:	00399793          	slli	a5,s3,0x3
    80004f04:	00f78793          	addi	a5,a5,15
    80004f08:	ff07f793          	andi	a5,a5,-16
    80004f0c:	40f10133          	sub	sp,sp,a5
    80004f10:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004f14:	0019871b          	addiw	a4,s3,1
    80004f18:	00171793          	slli	a5,a4,0x1
    80004f1c:	00e787b3          	add	a5,a5,a4
    80004f20:	00379793          	slli	a5,a5,0x3
    80004f24:	00f78793          	addi	a5,a5,15
    80004f28:	ff07f793          	andi	a5,a5,-16
    80004f2c:	40f10133          	sub	sp,sp,a5
    80004f30:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004f34:	00199493          	slli	s1,s3,0x1
    80004f38:	013484b3          	add	s1,s1,s3
    80004f3c:	00349493          	slli	s1,s1,0x3
    80004f40:	009b04b3          	add	s1,s6,s1
    80004f44:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004f48:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004f4c:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004f50:	02800513          	li	a0,40
    80004f54:	ffffe097          	auipc	ra,0xffffe
    80004f58:	1b0080e7          	jalr	432(ra) # 80003104 <_Znwm>
    80004f5c:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004f60:	ffffe097          	auipc	ra,0xffffe
    80004f64:	494080e7          	jalr	1172(ra) # 800033f4 <_ZN6ThreadC1Ev>
    80004f68:	00008797          	auipc	a5,0x8
    80004f6c:	03878793          	addi	a5,a5,56 # 8000cfa0 <_ZTV8Consumer+0x10>
    80004f70:	00fbb023          	sd	a5,0(s7)
    80004f74:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004f78:	000b8513          	mv	a0,s7
    80004f7c:	ffffe097          	auipc	ra,0xffffe
    80004f80:	340080e7          	jalr	832(ra) # 800032bc <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004f84:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004f88:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004f8c:	00008797          	auipc	a5,0x8
    80004f90:	3147b783          	ld	a5,788(a5) # 8000d2a0 <_ZL10waitForAll>
    80004f94:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004f98:	02800513          	li	a0,40
    80004f9c:	ffffe097          	auipc	ra,0xffffe
    80004fa0:	168080e7          	jalr	360(ra) # 80003104 <_Znwm>
    80004fa4:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004fa8:	ffffe097          	auipc	ra,0xffffe
    80004fac:	44c080e7          	jalr	1100(ra) # 800033f4 <_ZN6ThreadC1Ev>
    80004fb0:	00008797          	auipc	a5,0x8
    80004fb4:	fa078793          	addi	a5,a5,-96 # 8000cf50 <_ZTV16ProducerKeyborad+0x10>
    80004fb8:	00f4b023          	sd	a5,0(s1)
    80004fbc:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004fc0:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004fc4:	00048513          	mv	a0,s1
    80004fc8:	ffffe097          	auipc	ra,0xffffe
    80004fcc:	2f4080e7          	jalr	756(ra) # 800032bc <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004fd0:	00100913          	li	s2,1
    80004fd4:	0300006f          	j	80005004 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004fd8:	00008797          	auipc	a5,0x8
    80004fdc:	fa078793          	addi	a5,a5,-96 # 8000cf78 <_ZTV8Producer+0x10>
    80004fe0:	00fcb023          	sd	a5,0(s9)
    80004fe4:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004fe8:	00391793          	slli	a5,s2,0x3
    80004fec:	00fa07b3          	add	a5,s4,a5
    80004ff0:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004ff4:	000c8513          	mv	a0,s9
    80004ff8:	ffffe097          	auipc	ra,0xffffe
    80004ffc:	2c4080e7          	jalr	708(ra) # 800032bc <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80005000:	0019091b          	addiw	s2,s2,1
    80005004:	05395263          	bge	s2,s3,80005048 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80005008:	00191493          	slli	s1,s2,0x1
    8000500c:	012484b3          	add	s1,s1,s2
    80005010:	00349493          	slli	s1,s1,0x3
    80005014:	009b04b3          	add	s1,s6,s1
    80005018:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    8000501c:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80005020:	00008797          	auipc	a5,0x8
    80005024:	2807b783          	ld	a5,640(a5) # 8000d2a0 <_ZL10waitForAll>
    80005028:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    8000502c:	02800513          	li	a0,40
    80005030:	ffffe097          	auipc	ra,0xffffe
    80005034:	0d4080e7          	jalr	212(ra) # 80003104 <_Znwm>
    80005038:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    8000503c:	ffffe097          	auipc	ra,0xffffe
    80005040:	3b8080e7          	jalr	952(ra) # 800033f4 <_ZN6ThreadC1Ev>
    80005044:	f95ff06f          	j	80004fd8 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80005048:	ffffe097          	auipc	ra,0xffffe
    8000504c:	2f0080e7          	jalr	752(ra) # 80003338 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005050:	00000493          	li	s1,0
    80005054:	0099ce63          	blt	s3,s1,80005070 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80005058:	00008517          	auipc	a0,0x8
    8000505c:	24853503          	ld	a0,584(a0) # 8000d2a0 <_ZL10waitForAll>
    80005060:	ffffe097          	auipc	ra,0xffffe
    80005064:	448080e7          	jalr	1096(ra) # 800034a8 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005068:	0014849b          	addiw	s1,s1,1
    8000506c:	fe9ff06f          	j	80005054 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80005070:	00008517          	auipc	a0,0x8
    80005074:	23053503          	ld	a0,560(a0) # 8000d2a0 <_ZL10waitForAll>
    80005078:	00050863          	beqz	a0,80005088 <_Z20testConsumerProducerv+0x2f4>
    8000507c:	00053783          	ld	a5,0(a0)
    80005080:	0087b783          	ld	a5,8(a5)
    80005084:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80005088:	00000493          	li	s1,0
    8000508c:	0080006f          	j	80005094 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80005090:	0014849b          	addiw	s1,s1,1
    80005094:	0334d263          	bge	s1,s3,800050b8 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80005098:	00349793          	slli	a5,s1,0x3
    8000509c:	00fa07b3          	add	a5,s4,a5
    800050a0:	0007b503          	ld	a0,0(a5)
    800050a4:	fe0506e3          	beqz	a0,80005090 <_Z20testConsumerProducerv+0x2fc>
    800050a8:	00053783          	ld	a5,0(a0)
    800050ac:	0087b783          	ld	a5,8(a5)
    800050b0:	000780e7          	jalr	a5
    800050b4:	fddff06f          	j	80005090 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    800050b8:	000b8a63          	beqz	s7,800050cc <_Z20testConsumerProducerv+0x338>
    800050bc:	000bb783          	ld	a5,0(s7)
    800050c0:	0087b783          	ld	a5,8(a5)
    800050c4:	000b8513          	mv	a0,s7
    800050c8:	000780e7          	jalr	a5
    delete buffer;
    800050cc:	000a8e63          	beqz	s5,800050e8 <_Z20testConsumerProducerv+0x354>
    800050d0:	000a8513          	mv	a0,s5
    800050d4:	00002097          	auipc	ra,0x2
    800050d8:	870080e7          	jalr	-1936(ra) # 80006944 <_ZN9BufferCPPD1Ev>
    800050dc:	000a8513          	mv	a0,s5
    800050e0:	ffffe097          	auipc	ra,0xffffe
    800050e4:	074080e7          	jalr	116(ra) # 80003154 <_ZdlPv>
    800050e8:	000c0113          	mv	sp,s8
}
    800050ec:	f8040113          	addi	sp,s0,-128
    800050f0:	07813083          	ld	ra,120(sp)
    800050f4:	07013403          	ld	s0,112(sp)
    800050f8:	06813483          	ld	s1,104(sp)
    800050fc:	06013903          	ld	s2,96(sp)
    80005100:	05813983          	ld	s3,88(sp)
    80005104:	05013a03          	ld	s4,80(sp)
    80005108:	04813a83          	ld	s5,72(sp)
    8000510c:	04013b03          	ld	s6,64(sp)
    80005110:	03813b83          	ld	s7,56(sp)
    80005114:	03013c03          	ld	s8,48(sp)
    80005118:	02813c83          	ld	s9,40(sp)
    8000511c:	08010113          	addi	sp,sp,128
    80005120:	00008067          	ret
    80005124:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005128:	000a8513          	mv	a0,s5
    8000512c:	ffffe097          	auipc	ra,0xffffe
    80005130:	028080e7          	jalr	40(ra) # 80003154 <_ZdlPv>
    80005134:	00048513          	mv	a0,s1
    80005138:	00009097          	auipc	ra,0x9
    8000513c:	280080e7          	jalr	640(ra) # 8000e3b8 <_Unwind_Resume>
    80005140:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80005144:	00090513          	mv	a0,s2
    80005148:	ffffe097          	auipc	ra,0xffffe
    8000514c:	00c080e7          	jalr	12(ra) # 80003154 <_ZdlPv>
    80005150:	00048513          	mv	a0,s1
    80005154:	00009097          	auipc	ra,0x9
    80005158:	264080e7          	jalr	612(ra) # 8000e3b8 <_Unwind_Resume>
    8000515c:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80005160:	000b8513          	mv	a0,s7
    80005164:	ffffe097          	auipc	ra,0xffffe
    80005168:	ff0080e7          	jalr	-16(ra) # 80003154 <_ZdlPv>
    8000516c:	00048513          	mv	a0,s1
    80005170:	00009097          	auipc	ra,0x9
    80005174:	248080e7          	jalr	584(ra) # 8000e3b8 <_Unwind_Resume>
    80005178:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000517c:	00048513          	mv	a0,s1
    80005180:	ffffe097          	auipc	ra,0xffffe
    80005184:	fd4080e7          	jalr	-44(ra) # 80003154 <_ZdlPv>
    80005188:	00090513          	mv	a0,s2
    8000518c:	00009097          	auipc	ra,0x9
    80005190:	22c080e7          	jalr	556(ra) # 8000e3b8 <_Unwind_Resume>
    80005194:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80005198:	000c8513          	mv	a0,s9
    8000519c:	ffffe097          	auipc	ra,0xffffe
    800051a0:	fb8080e7          	jalr	-72(ra) # 80003154 <_ZdlPv>
    800051a4:	00048513          	mv	a0,s1
    800051a8:	00009097          	auipc	ra,0x9
    800051ac:	210080e7          	jalr	528(ra) # 8000e3b8 <_Unwind_Resume>

00000000800051b0 <_ZN8Consumer3runEv>:
    void run() override {
    800051b0:	fd010113          	addi	sp,sp,-48
    800051b4:	02113423          	sd	ra,40(sp)
    800051b8:	02813023          	sd	s0,32(sp)
    800051bc:	00913c23          	sd	s1,24(sp)
    800051c0:	01213823          	sd	s2,16(sp)
    800051c4:	01313423          	sd	s3,8(sp)
    800051c8:	03010413          	addi	s0,sp,48
    800051cc:	00050913          	mv	s2,a0
        int i = 0;
    800051d0:	00000993          	li	s3,0
    800051d4:	0100006f          	j	800051e4 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800051d8:	00a00513          	li	a0,10
    800051dc:	ffffe097          	auipc	ra,0xffffe
    800051e0:	3bc080e7          	jalr	956(ra) # 80003598 <_ZN7Console4putcEc>
        while (!threadEnd) {
    800051e4:	00008797          	auipc	a5,0x8
    800051e8:	0b47a783          	lw	a5,180(a5) # 8000d298 <_ZL9threadEnd>
    800051ec:	04079a63          	bnez	a5,80005240 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    800051f0:	02093783          	ld	a5,32(s2)
    800051f4:	0087b503          	ld	a0,8(a5)
    800051f8:	00001097          	auipc	ra,0x1
    800051fc:	638080e7          	jalr	1592(ra) # 80006830 <_ZN9BufferCPP3getEv>
            i++;
    80005200:	0019849b          	addiw	s1,s3,1
    80005204:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80005208:	0ff57513          	andi	a0,a0,255
    8000520c:	ffffe097          	auipc	ra,0xffffe
    80005210:	38c080e7          	jalr	908(ra) # 80003598 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80005214:	05000793          	li	a5,80
    80005218:	02f4e4bb          	remw	s1,s1,a5
    8000521c:	fc0494e3          	bnez	s1,800051e4 <_ZN8Consumer3runEv+0x34>
    80005220:	fb9ff06f          	j	800051d8 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80005224:	02093783          	ld	a5,32(s2)
    80005228:	0087b503          	ld	a0,8(a5)
    8000522c:	00001097          	auipc	ra,0x1
    80005230:	604080e7          	jalr	1540(ra) # 80006830 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80005234:	0ff57513          	andi	a0,a0,255
    80005238:	ffffe097          	auipc	ra,0xffffe
    8000523c:	360080e7          	jalr	864(ra) # 80003598 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80005240:	02093783          	ld	a5,32(s2)
    80005244:	0087b503          	ld	a0,8(a5)
    80005248:	00001097          	auipc	ra,0x1
    8000524c:	674080e7          	jalr	1652(ra) # 800068bc <_ZN9BufferCPP6getCntEv>
    80005250:	fca04ae3          	bgtz	a0,80005224 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80005254:	02093783          	ld	a5,32(s2)
    80005258:	0107b503          	ld	a0,16(a5)
    8000525c:	ffffe097          	auipc	ra,0xffffe
    80005260:	278080e7          	jalr	632(ra) # 800034d4 <_ZN9Semaphore6signalEv>
    }
    80005264:	02813083          	ld	ra,40(sp)
    80005268:	02013403          	ld	s0,32(sp)
    8000526c:	01813483          	ld	s1,24(sp)
    80005270:	01013903          	ld	s2,16(sp)
    80005274:	00813983          	ld	s3,8(sp)
    80005278:	03010113          	addi	sp,sp,48
    8000527c:	00008067          	ret

0000000080005280 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80005280:	ff010113          	addi	sp,sp,-16
    80005284:	00113423          	sd	ra,8(sp)
    80005288:	00813023          	sd	s0,0(sp)
    8000528c:	01010413          	addi	s0,sp,16
    80005290:	00008797          	auipc	a5,0x8
    80005294:	d1078793          	addi	a5,a5,-752 # 8000cfa0 <_ZTV8Consumer+0x10>
    80005298:	00f53023          	sd	a5,0(a0)
    8000529c:	ffffe097          	auipc	ra,0xffffe
    800052a0:	d88080e7          	jalr	-632(ra) # 80003024 <_ZN6ThreadD1Ev>
    800052a4:	00813083          	ld	ra,8(sp)
    800052a8:	00013403          	ld	s0,0(sp)
    800052ac:	01010113          	addi	sp,sp,16
    800052b0:	00008067          	ret

00000000800052b4 <_ZN8ConsumerD0Ev>:
    800052b4:	fe010113          	addi	sp,sp,-32
    800052b8:	00113c23          	sd	ra,24(sp)
    800052bc:	00813823          	sd	s0,16(sp)
    800052c0:	00913423          	sd	s1,8(sp)
    800052c4:	02010413          	addi	s0,sp,32
    800052c8:	00050493          	mv	s1,a0
    800052cc:	00008797          	auipc	a5,0x8
    800052d0:	cd478793          	addi	a5,a5,-812 # 8000cfa0 <_ZTV8Consumer+0x10>
    800052d4:	00f53023          	sd	a5,0(a0)
    800052d8:	ffffe097          	auipc	ra,0xffffe
    800052dc:	d4c080e7          	jalr	-692(ra) # 80003024 <_ZN6ThreadD1Ev>
    800052e0:	00048513          	mv	a0,s1
    800052e4:	ffffe097          	auipc	ra,0xffffe
    800052e8:	e70080e7          	jalr	-400(ra) # 80003154 <_ZdlPv>
    800052ec:	01813083          	ld	ra,24(sp)
    800052f0:	01013403          	ld	s0,16(sp)
    800052f4:	00813483          	ld	s1,8(sp)
    800052f8:	02010113          	addi	sp,sp,32
    800052fc:	00008067          	ret

0000000080005300 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80005300:	ff010113          	addi	sp,sp,-16
    80005304:	00113423          	sd	ra,8(sp)
    80005308:	00813023          	sd	s0,0(sp)
    8000530c:	01010413          	addi	s0,sp,16
    80005310:	00008797          	auipc	a5,0x8
    80005314:	c4078793          	addi	a5,a5,-960 # 8000cf50 <_ZTV16ProducerKeyborad+0x10>
    80005318:	00f53023          	sd	a5,0(a0)
    8000531c:	ffffe097          	auipc	ra,0xffffe
    80005320:	d08080e7          	jalr	-760(ra) # 80003024 <_ZN6ThreadD1Ev>
    80005324:	00813083          	ld	ra,8(sp)
    80005328:	00013403          	ld	s0,0(sp)
    8000532c:	01010113          	addi	sp,sp,16
    80005330:	00008067          	ret

0000000080005334 <_ZN16ProducerKeyboradD0Ev>:
    80005334:	fe010113          	addi	sp,sp,-32
    80005338:	00113c23          	sd	ra,24(sp)
    8000533c:	00813823          	sd	s0,16(sp)
    80005340:	00913423          	sd	s1,8(sp)
    80005344:	02010413          	addi	s0,sp,32
    80005348:	00050493          	mv	s1,a0
    8000534c:	00008797          	auipc	a5,0x8
    80005350:	c0478793          	addi	a5,a5,-1020 # 8000cf50 <_ZTV16ProducerKeyborad+0x10>
    80005354:	00f53023          	sd	a5,0(a0)
    80005358:	ffffe097          	auipc	ra,0xffffe
    8000535c:	ccc080e7          	jalr	-820(ra) # 80003024 <_ZN6ThreadD1Ev>
    80005360:	00048513          	mv	a0,s1
    80005364:	ffffe097          	auipc	ra,0xffffe
    80005368:	df0080e7          	jalr	-528(ra) # 80003154 <_ZdlPv>
    8000536c:	01813083          	ld	ra,24(sp)
    80005370:	01013403          	ld	s0,16(sp)
    80005374:	00813483          	ld	s1,8(sp)
    80005378:	02010113          	addi	sp,sp,32
    8000537c:	00008067          	ret

0000000080005380 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80005380:	ff010113          	addi	sp,sp,-16
    80005384:	00113423          	sd	ra,8(sp)
    80005388:	00813023          	sd	s0,0(sp)
    8000538c:	01010413          	addi	s0,sp,16
    80005390:	00008797          	auipc	a5,0x8
    80005394:	be878793          	addi	a5,a5,-1048 # 8000cf78 <_ZTV8Producer+0x10>
    80005398:	00f53023          	sd	a5,0(a0)
    8000539c:	ffffe097          	auipc	ra,0xffffe
    800053a0:	c88080e7          	jalr	-888(ra) # 80003024 <_ZN6ThreadD1Ev>
    800053a4:	00813083          	ld	ra,8(sp)
    800053a8:	00013403          	ld	s0,0(sp)
    800053ac:	01010113          	addi	sp,sp,16
    800053b0:	00008067          	ret

00000000800053b4 <_ZN8ProducerD0Ev>:
    800053b4:	fe010113          	addi	sp,sp,-32
    800053b8:	00113c23          	sd	ra,24(sp)
    800053bc:	00813823          	sd	s0,16(sp)
    800053c0:	00913423          	sd	s1,8(sp)
    800053c4:	02010413          	addi	s0,sp,32
    800053c8:	00050493          	mv	s1,a0
    800053cc:	00008797          	auipc	a5,0x8
    800053d0:	bac78793          	addi	a5,a5,-1108 # 8000cf78 <_ZTV8Producer+0x10>
    800053d4:	00f53023          	sd	a5,0(a0)
    800053d8:	ffffe097          	auipc	ra,0xffffe
    800053dc:	c4c080e7          	jalr	-948(ra) # 80003024 <_ZN6ThreadD1Ev>
    800053e0:	00048513          	mv	a0,s1
    800053e4:	ffffe097          	auipc	ra,0xffffe
    800053e8:	d70080e7          	jalr	-656(ra) # 80003154 <_ZdlPv>
    800053ec:	01813083          	ld	ra,24(sp)
    800053f0:	01013403          	ld	s0,16(sp)
    800053f4:	00813483          	ld	s1,8(sp)
    800053f8:	02010113          	addi	sp,sp,32
    800053fc:	00008067          	ret

0000000080005400 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80005400:	fe010113          	addi	sp,sp,-32
    80005404:	00113c23          	sd	ra,24(sp)
    80005408:	00813823          	sd	s0,16(sp)
    8000540c:	00913423          	sd	s1,8(sp)
    80005410:	02010413          	addi	s0,sp,32
    80005414:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80005418:	ffffc097          	auipc	ra,0xffffc
    8000541c:	1e8080e7          	jalr	488(ra) # 80001600 <_Z4getcv>
    80005420:	0005059b          	sext.w	a1,a0
    80005424:	01b00793          	li	a5,27
    80005428:	00f58c63          	beq	a1,a5,80005440 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    8000542c:	0204b783          	ld	a5,32(s1)
    80005430:	0087b503          	ld	a0,8(a5)
    80005434:	00001097          	auipc	ra,0x1
    80005438:	36c080e7          	jalr	876(ra) # 800067a0 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    8000543c:	fddff06f          	j	80005418 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80005440:	00100793          	li	a5,1
    80005444:	00008717          	auipc	a4,0x8
    80005448:	e4f72a23          	sw	a5,-428(a4) # 8000d298 <_ZL9threadEnd>
        td->buffer->put('!');
    8000544c:	0204b783          	ld	a5,32(s1)
    80005450:	02100593          	li	a1,33
    80005454:	0087b503          	ld	a0,8(a5)
    80005458:	00001097          	auipc	ra,0x1
    8000545c:	348080e7          	jalr	840(ra) # 800067a0 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80005460:	0204b783          	ld	a5,32(s1)
    80005464:	0107b503          	ld	a0,16(a5)
    80005468:	ffffe097          	auipc	ra,0xffffe
    8000546c:	06c080e7          	jalr	108(ra) # 800034d4 <_ZN9Semaphore6signalEv>
    }
    80005470:	01813083          	ld	ra,24(sp)
    80005474:	01013403          	ld	s0,16(sp)
    80005478:	00813483          	ld	s1,8(sp)
    8000547c:	02010113          	addi	sp,sp,32
    80005480:	00008067          	ret

0000000080005484 <_ZN8Producer3runEv>:
    void run() override {
    80005484:	fe010113          	addi	sp,sp,-32
    80005488:	00113c23          	sd	ra,24(sp)
    8000548c:	00813823          	sd	s0,16(sp)
    80005490:	00913423          	sd	s1,8(sp)
    80005494:	01213023          	sd	s2,0(sp)
    80005498:	02010413          	addi	s0,sp,32
    8000549c:	00050493          	mv	s1,a0
        int i = 0;
    800054a0:	00000913          	li	s2,0
        while (!threadEnd) {
    800054a4:	00008797          	auipc	a5,0x8
    800054a8:	df47a783          	lw	a5,-524(a5) # 8000d298 <_ZL9threadEnd>
    800054ac:	04079263          	bnez	a5,800054f0 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    800054b0:	0204b783          	ld	a5,32(s1)
    800054b4:	0007a583          	lw	a1,0(a5)
    800054b8:	0305859b          	addiw	a1,a1,48
    800054bc:	0087b503          	ld	a0,8(a5)
    800054c0:	00001097          	auipc	ra,0x1
    800054c4:	2e0080e7          	jalr	736(ra) # 800067a0 <_ZN9BufferCPP3putEi>
            i++;
    800054c8:	0019071b          	addiw	a4,s2,1
    800054cc:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    800054d0:	0204b783          	ld	a5,32(s1)
    800054d4:	0007a783          	lw	a5,0(a5)
    800054d8:	00e787bb          	addw	a5,a5,a4
    800054dc:	00500513          	li	a0,5
    800054e0:	02a7e53b          	remw	a0,a5,a0
    800054e4:	ffffe097          	auipc	ra,0xffffe
    800054e8:	e7c080e7          	jalr	-388(ra) # 80003360 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    800054ec:	fb9ff06f          	j	800054a4 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    800054f0:	0204b783          	ld	a5,32(s1)
    800054f4:	0107b503          	ld	a0,16(a5)
    800054f8:	ffffe097          	auipc	ra,0xffffe
    800054fc:	fdc080e7          	jalr	-36(ra) # 800034d4 <_ZN9Semaphore6signalEv>
    }
    80005500:	01813083          	ld	ra,24(sp)
    80005504:	01013403          	ld	s0,16(sp)
    80005508:	00813483          	ld	s1,8(sp)
    8000550c:	00013903          	ld	s2,0(sp)
    80005510:	02010113          	addi	sp,sp,32
    80005514:	00008067          	ret

0000000080005518 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005518:	fe010113          	addi	sp,sp,-32
    8000551c:	00113c23          	sd	ra,24(sp)
    80005520:	00813823          	sd	s0,16(sp)
    80005524:	00913423          	sd	s1,8(sp)
    80005528:	01213023          	sd	s2,0(sp)
    8000552c:	02010413          	addi	s0,sp,32
    80005530:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005534:	00100793          	li	a5,1
    80005538:	02a7f863          	bgeu	a5,a0,80005568 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000553c:	00a00793          	li	a5,10
    80005540:	02f577b3          	remu	a5,a0,a5
    80005544:	02078e63          	beqz	a5,80005580 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005548:	fff48513          	addi	a0,s1,-1
    8000554c:	00000097          	auipc	ra,0x0
    80005550:	fcc080e7          	jalr	-52(ra) # 80005518 <_ZL9fibonaccim>
    80005554:	00050913          	mv	s2,a0
    80005558:	ffe48513          	addi	a0,s1,-2
    8000555c:	00000097          	auipc	ra,0x0
    80005560:	fbc080e7          	jalr	-68(ra) # 80005518 <_ZL9fibonaccim>
    80005564:	00a90533          	add	a0,s2,a0
}
    80005568:	01813083          	ld	ra,24(sp)
    8000556c:	01013403          	ld	s0,16(sp)
    80005570:	00813483          	ld	s1,8(sp)
    80005574:	00013903          	ld	s2,0(sp)
    80005578:	02010113          	addi	sp,sp,32
    8000557c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005580:	ffffc097          	auipc	ra,0xffffc
    80005584:	f40080e7          	jalr	-192(ra) # 800014c0 <_Z15thread_dispatchv>
    80005588:	fc1ff06f          	j	80005548 <_ZL9fibonaccim+0x30>

000000008000558c <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    8000558c:	fe010113          	addi	sp,sp,-32
    80005590:	00113c23          	sd	ra,24(sp)
    80005594:	00813823          	sd	s0,16(sp)
    80005598:	00913423          	sd	s1,8(sp)
    8000559c:	01213023          	sd	s2,0(sp)
    800055a0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800055a4:	00a00493          	li	s1,10
    800055a8:	0400006f          	j	800055e8 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800055ac:	00005517          	auipc	a0,0x5
    800055b0:	ec450513          	addi	a0,a0,-316 # 8000a470 <CONSOLE_STATUS+0x460>
    800055b4:	00001097          	auipc	ra,0x1
    800055b8:	dc8080e7          	jalr	-568(ra) # 8000637c <_Z11printStringPKc>
    800055bc:	00000613          	li	a2,0
    800055c0:	00a00593          	li	a1,10
    800055c4:	00048513          	mv	a0,s1
    800055c8:	00001097          	auipc	ra,0x1
    800055cc:	f64080e7          	jalr	-156(ra) # 8000652c <_Z8printIntiii>
    800055d0:	00005517          	auipc	a0,0x5
    800055d4:	09050513          	addi	a0,a0,144 # 8000a660 <CONSOLE_STATUS+0x650>
    800055d8:	00001097          	auipc	ra,0x1
    800055dc:	da4080e7          	jalr	-604(ra) # 8000637c <_Z11printStringPKc>
    for (; i < 13; i++) {
    800055e0:	0014849b          	addiw	s1,s1,1
    800055e4:	0ff4f493          	andi	s1,s1,255
    800055e8:	00c00793          	li	a5,12
    800055ec:	fc97f0e3          	bgeu	a5,s1,800055ac <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800055f0:	00005517          	auipc	a0,0x5
    800055f4:	e8850513          	addi	a0,a0,-376 # 8000a478 <CONSOLE_STATUS+0x468>
    800055f8:	00001097          	auipc	ra,0x1
    800055fc:	d84080e7          	jalr	-636(ra) # 8000637c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005600:	00500313          	li	t1,5
    thread_dispatch();
    80005604:	ffffc097          	auipc	ra,0xffffc
    80005608:	ebc080e7          	jalr	-324(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000560c:	01000513          	li	a0,16
    80005610:	00000097          	auipc	ra,0x0
    80005614:	f08080e7          	jalr	-248(ra) # 80005518 <_ZL9fibonaccim>
    80005618:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000561c:	00005517          	auipc	a0,0x5
    80005620:	e6c50513          	addi	a0,a0,-404 # 8000a488 <CONSOLE_STATUS+0x478>
    80005624:	00001097          	auipc	ra,0x1
    80005628:	d58080e7          	jalr	-680(ra) # 8000637c <_Z11printStringPKc>
    8000562c:	00000613          	li	a2,0
    80005630:	00a00593          	li	a1,10
    80005634:	0009051b          	sext.w	a0,s2
    80005638:	00001097          	auipc	ra,0x1
    8000563c:	ef4080e7          	jalr	-268(ra) # 8000652c <_Z8printIntiii>
    80005640:	00005517          	auipc	a0,0x5
    80005644:	02050513          	addi	a0,a0,32 # 8000a660 <CONSOLE_STATUS+0x650>
    80005648:	00001097          	auipc	ra,0x1
    8000564c:	d34080e7          	jalr	-716(ra) # 8000637c <_Z11printStringPKc>
    80005650:	0400006f          	j	80005690 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005654:	00005517          	auipc	a0,0x5
    80005658:	e1c50513          	addi	a0,a0,-484 # 8000a470 <CONSOLE_STATUS+0x460>
    8000565c:	00001097          	auipc	ra,0x1
    80005660:	d20080e7          	jalr	-736(ra) # 8000637c <_Z11printStringPKc>
    80005664:	00000613          	li	a2,0
    80005668:	00a00593          	li	a1,10
    8000566c:	00048513          	mv	a0,s1
    80005670:	00001097          	auipc	ra,0x1
    80005674:	ebc080e7          	jalr	-324(ra) # 8000652c <_Z8printIntiii>
    80005678:	00005517          	auipc	a0,0x5
    8000567c:	fe850513          	addi	a0,a0,-24 # 8000a660 <CONSOLE_STATUS+0x650>
    80005680:	00001097          	auipc	ra,0x1
    80005684:	cfc080e7          	jalr	-772(ra) # 8000637c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005688:	0014849b          	addiw	s1,s1,1
    8000568c:	0ff4f493          	andi	s1,s1,255
    80005690:	00f00793          	li	a5,15
    80005694:	fc97f0e3          	bgeu	a5,s1,80005654 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005698:	00005517          	auipc	a0,0x5
    8000569c:	e0050513          	addi	a0,a0,-512 # 8000a498 <CONSOLE_STATUS+0x488>
    800056a0:	00001097          	auipc	ra,0x1
    800056a4:	cdc080e7          	jalr	-804(ra) # 8000637c <_Z11printStringPKc>
    finishedD = true;
    800056a8:	00100793          	li	a5,1
    800056ac:	00008717          	auipc	a4,0x8
    800056b0:	bef70e23          	sb	a5,-1028(a4) # 8000d2a8 <_ZL9finishedD>
    thread_dispatch();
    800056b4:	ffffc097          	auipc	ra,0xffffc
    800056b8:	e0c080e7          	jalr	-500(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800056bc:	01813083          	ld	ra,24(sp)
    800056c0:	01013403          	ld	s0,16(sp)
    800056c4:	00813483          	ld	s1,8(sp)
    800056c8:	00013903          	ld	s2,0(sp)
    800056cc:	02010113          	addi	sp,sp,32
    800056d0:	00008067          	ret

00000000800056d4 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800056d4:	fe010113          	addi	sp,sp,-32
    800056d8:	00113c23          	sd	ra,24(sp)
    800056dc:	00813823          	sd	s0,16(sp)
    800056e0:	00913423          	sd	s1,8(sp)
    800056e4:	01213023          	sd	s2,0(sp)
    800056e8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800056ec:	00000493          	li	s1,0
    800056f0:	0400006f          	j	80005730 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800056f4:	00005517          	auipc	a0,0x5
    800056f8:	d3c50513          	addi	a0,a0,-708 # 8000a430 <CONSOLE_STATUS+0x420>
    800056fc:	00001097          	auipc	ra,0x1
    80005700:	c80080e7          	jalr	-896(ra) # 8000637c <_Z11printStringPKc>
    80005704:	00000613          	li	a2,0
    80005708:	00a00593          	li	a1,10
    8000570c:	00048513          	mv	a0,s1
    80005710:	00001097          	auipc	ra,0x1
    80005714:	e1c080e7          	jalr	-484(ra) # 8000652c <_Z8printIntiii>
    80005718:	00005517          	auipc	a0,0x5
    8000571c:	f4850513          	addi	a0,a0,-184 # 8000a660 <CONSOLE_STATUS+0x650>
    80005720:	00001097          	auipc	ra,0x1
    80005724:	c5c080e7          	jalr	-932(ra) # 8000637c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005728:	0014849b          	addiw	s1,s1,1
    8000572c:	0ff4f493          	andi	s1,s1,255
    80005730:	00200793          	li	a5,2
    80005734:	fc97f0e3          	bgeu	a5,s1,800056f4 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005738:	00005517          	auipc	a0,0x5
    8000573c:	d0050513          	addi	a0,a0,-768 # 8000a438 <CONSOLE_STATUS+0x428>
    80005740:	00001097          	auipc	ra,0x1
    80005744:	c3c080e7          	jalr	-964(ra) # 8000637c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005748:	00700313          	li	t1,7
    thread_dispatch();
    8000574c:	ffffc097          	auipc	ra,0xffffc
    80005750:	d74080e7          	jalr	-652(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005754:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005758:	00005517          	auipc	a0,0x5
    8000575c:	cf050513          	addi	a0,a0,-784 # 8000a448 <CONSOLE_STATUS+0x438>
    80005760:	00001097          	auipc	ra,0x1
    80005764:	c1c080e7          	jalr	-996(ra) # 8000637c <_Z11printStringPKc>
    80005768:	00000613          	li	a2,0
    8000576c:	00a00593          	li	a1,10
    80005770:	0009051b          	sext.w	a0,s2
    80005774:	00001097          	auipc	ra,0x1
    80005778:	db8080e7          	jalr	-584(ra) # 8000652c <_Z8printIntiii>
    8000577c:	00005517          	auipc	a0,0x5
    80005780:	ee450513          	addi	a0,a0,-284 # 8000a660 <CONSOLE_STATUS+0x650>
    80005784:	00001097          	auipc	ra,0x1
    80005788:	bf8080e7          	jalr	-1032(ra) # 8000637c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    8000578c:	00c00513          	li	a0,12
    80005790:	00000097          	auipc	ra,0x0
    80005794:	d88080e7          	jalr	-632(ra) # 80005518 <_ZL9fibonaccim>
    80005798:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000579c:	00005517          	auipc	a0,0x5
    800057a0:	cb450513          	addi	a0,a0,-844 # 8000a450 <CONSOLE_STATUS+0x440>
    800057a4:	00001097          	auipc	ra,0x1
    800057a8:	bd8080e7          	jalr	-1064(ra) # 8000637c <_Z11printStringPKc>
    800057ac:	00000613          	li	a2,0
    800057b0:	00a00593          	li	a1,10
    800057b4:	0009051b          	sext.w	a0,s2
    800057b8:	00001097          	auipc	ra,0x1
    800057bc:	d74080e7          	jalr	-652(ra) # 8000652c <_Z8printIntiii>
    800057c0:	00005517          	auipc	a0,0x5
    800057c4:	ea050513          	addi	a0,a0,-352 # 8000a660 <CONSOLE_STATUS+0x650>
    800057c8:	00001097          	auipc	ra,0x1
    800057cc:	bb4080e7          	jalr	-1100(ra) # 8000637c <_Z11printStringPKc>
    800057d0:	0400006f          	j	80005810 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800057d4:	00005517          	auipc	a0,0x5
    800057d8:	c5c50513          	addi	a0,a0,-932 # 8000a430 <CONSOLE_STATUS+0x420>
    800057dc:	00001097          	auipc	ra,0x1
    800057e0:	ba0080e7          	jalr	-1120(ra) # 8000637c <_Z11printStringPKc>
    800057e4:	00000613          	li	a2,0
    800057e8:	00a00593          	li	a1,10
    800057ec:	00048513          	mv	a0,s1
    800057f0:	00001097          	auipc	ra,0x1
    800057f4:	d3c080e7          	jalr	-708(ra) # 8000652c <_Z8printIntiii>
    800057f8:	00005517          	auipc	a0,0x5
    800057fc:	e6850513          	addi	a0,a0,-408 # 8000a660 <CONSOLE_STATUS+0x650>
    80005800:	00001097          	auipc	ra,0x1
    80005804:	b7c080e7          	jalr	-1156(ra) # 8000637c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005808:	0014849b          	addiw	s1,s1,1
    8000580c:	0ff4f493          	andi	s1,s1,255
    80005810:	00500793          	li	a5,5
    80005814:	fc97f0e3          	bgeu	a5,s1,800057d4 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005818:	00005517          	auipc	a0,0x5
    8000581c:	c4850513          	addi	a0,a0,-952 # 8000a460 <CONSOLE_STATUS+0x450>
    80005820:	00001097          	auipc	ra,0x1
    80005824:	b5c080e7          	jalr	-1188(ra) # 8000637c <_Z11printStringPKc>
    finishedC = true;
    80005828:	00100793          	li	a5,1
    8000582c:	00008717          	auipc	a4,0x8
    80005830:	a6f70ea3          	sb	a5,-1411(a4) # 8000d2a9 <_ZL9finishedC>
    thread_dispatch();
    80005834:	ffffc097          	auipc	ra,0xffffc
    80005838:	c8c080e7          	jalr	-884(ra) # 800014c0 <_Z15thread_dispatchv>
}
    8000583c:	01813083          	ld	ra,24(sp)
    80005840:	01013403          	ld	s0,16(sp)
    80005844:	00813483          	ld	s1,8(sp)
    80005848:	00013903          	ld	s2,0(sp)
    8000584c:	02010113          	addi	sp,sp,32
    80005850:	00008067          	ret

0000000080005854 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005854:	fe010113          	addi	sp,sp,-32
    80005858:	00113c23          	sd	ra,24(sp)
    8000585c:	00813823          	sd	s0,16(sp)
    80005860:	00913423          	sd	s1,8(sp)
    80005864:	01213023          	sd	s2,0(sp)
    80005868:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000586c:	00000913          	li	s2,0
    80005870:	0380006f          	j	800058a8 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80005874:	ffffc097          	auipc	ra,0xffffc
    80005878:	c4c080e7          	jalr	-948(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000587c:	00148493          	addi	s1,s1,1
    80005880:	000027b7          	lui	a5,0x2
    80005884:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005888:	0097ee63          	bltu	a5,s1,800058a4 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000588c:	00000713          	li	a4,0
    80005890:	000077b7          	lui	a5,0x7
    80005894:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005898:	fce7eee3          	bltu	a5,a4,80005874 <_ZL11workerBodyBPv+0x20>
    8000589c:	00170713          	addi	a4,a4,1
    800058a0:	ff1ff06f          	j	80005890 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800058a4:	00190913          	addi	s2,s2,1
    800058a8:	00f00793          	li	a5,15
    800058ac:	0527e063          	bltu	a5,s2,800058ec <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800058b0:	00005517          	auipc	a0,0x5
    800058b4:	b6850513          	addi	a0,a0,-1176 # 8000a418 <CONSOLE_STATUS+0x408>
    800058b8:	00001097          	auipc	ra,0x1
    800058bc:	ac4080e7          	jalr	-1340(ra) # 8000637c <_Z11printStringPKc>
    800058c0:	00000613          	li	a2,0
    800058c4:	00a00593          	li	a1,10
    800058c8:	0009051b          	sext.w	a0,s2
    800058cc:	00001097          	auipc	ra,0x1
    800058d0:	c60080e7          	jalr	-928(ra) # 8000652c <_Z8printIntiii>
    800058d4:	00005517          	auipc	a0,0x5
    800058d8:	d8c50513          	addi	a0,a0,-628 # 8000a660 <CONSOLE_STATUS+0x650>
    800058dc:	00001097          	auipc	ra,0x1
    800058e0:	aa0080e7          	jalr	-1376(ra) # 8000637c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800058e4:	00000493          	li	s1,0
    800058e8:	f99ff06f          	j	80005880 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    800058ec:	00005517          	auipc	a0,0x5
    800058f0:	b3450513          	addi	a0,a0,-1228 # 8000a420 <CONSOLE_STATUS+0x410>
    800058f4:	00001097          	auipc	ra,0x1
    800058f8:	a88080e7          	jalr	-1400(ra) # 8000637c <_Z11printStringPKc>
    finishedB = true;
    800058fc:	00100793          	li	a5,1
    80005900:	00008717          	auipc	a4,0x8
    80005904:	9af70523          	sb	a5,-1622(a4) # 8000d2aa <_ZL9finishedB>
    thread_dispatch();
    80005908:	ffffc097          	auipc	ra,0xffffc
    8000590c:	bb8080e7          	jalr	-1096(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80005910:	01813083          	ld	ra,24(sp)
    80005914:	01013403          	ld	s0,16(sp)
    80005918:	00813483          	ld	s1,8(sp)
    8000591c:	00013903          	ld	s2,0(sp)
    80005920:	02010113          	addi	sp,sp,32
    80005924:	00008067          	ret

0000000080005928 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005928:	fe010113          	addi	sp,sp,-32
    8000592c:	00113c23          	sd	ra,24(sp)
    80005930:	00813823          	sd	s0,16(sp)
    80005934:	00913423          	sd	s1,8(sp)
    80005938:	01213023          	sd	s2,0(sp)
    8000593c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005940:	00000913          	li	s2,0
    80005944:	0380006f          	j	8000597c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005948:	ffffc097          	auipc	ra,0xffffc
    8000594c:	b78080e7          	jalr	-1160(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005950:	00148493          	addi	s1,s1,1
    80005954:	000027b7          	lui	a5,0x2
    80005958:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000595c:	0097ee63          	bltu	a5,s1,80005978 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005960:	00000713          	li	a4,0
    80005964:	000077b7          	lui	a5,0x7
    80005968:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000596c:	fce7eee3          	bltu	a5,a4,80005948 <_ZL11workerBodyAPv+0x20>
    80005970:	00170713          	addi	a4,a4,1
    80005974:	ff1ff06f          	j	80005964 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005978:	00190913          	addi	s2,s2,1
    8000597c:	00900793          	li	a5,9
    80005980:	0527e063          	bltu	a5,s2,800059c0 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005984:	00005517          	auipc	a0,0x5
    80005988:	a7c50513          	addi	a0,a0,-1412 # 8000a400 <CONSOLE_STATUS+0x3f0>
    8000598c:	00001097          	auipc	ra,0x1
    80005990:	9f0080e7          	jalr	-1552(ra) # 8000637c <_Z11printStringPKc>
    80005994:	00000613          	li	a2,0
    80005998:	00a00593          	li	a1,10
    8000599c:	0009051b          	sext.w	a0,s2
    800059a0:	00001097          	auipc	ra,0x1
    800059a4:	b8c080e7          	jalr	-1140(ra) # 8000652c <_Z8printIntiii>
    800059a8:	00005517          	auipc	a0,0x5
    800059ac:	cb850513          	addi	a0,a0,-840 # 8000a660 <CONSOLE_STATUS+0x650>
    800059b0:	00001097          	auipc	ra,0x1
    800059b4:	9cc080e7          	jalr	-1588(ra) # 8000637c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800059b8:	00000493          	li	s1,0
    800059bc:	f99ff06f          	j	80005954 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800059c0:	00005517          	auipc	a0,0x5
    800059c4:	a4850513          	addi	a0,a0,-1464 # 8000a408 <CONSOLE_STATUS+0x3f8>
    800059c8:	00001097          	auipc	ra,0x1
    800059cc:	9b4080e7          	jalr	-1612(ra) # 8000637c <_Z11printStringPKc>
    finishedA = true;
    800059d0:	00100793          	li	a5,1
    800059d4:	00008717          	auipc	a4,0x8
    800059d8:	8cf70ba3          	sb	a5,-1833(a4) # 8000d2ab <_ZL9finishedA>
}
    800059dc:	01813083          	ld	ra,24(sp)
    800059e0:	01013403          	ld	s0,16(sp)
    800059e4:	00813483          	ld	s1,8(sp)
    800059e8:	00013903          	ld	s2,0(sp)
    800059ec:	02010113          	addi	sp,sp,32
    800059f0:	00008067          	ret

00000000800059f4 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800059f4:	fd010113          	addi	sp,sp,-48
    800059f8:	02113423          	sd	ra,40(sp)
    800059fc:	02813023          	sd	s0,32(sp)
    80005a00:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005a04:	00000613          	li	a2,0
    80005a08:	00000597          	auipc	a1,0x0
    80005a0c:	f2058593          	addi	a1,a1,-224 # 80005928 <_ZL11workerBodyAPv>
    80005a10:	fd040513          	addi	a0,s0,-48
    80005a14:	ffffc097          	auipc	ra,0xffffc
    80005a18:	9f0080e7          	jalr	-1552(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005a1c:	00005517          	auipc	a0,0x5
    80005a20:	a8c50513          	addi	a0,a0,-1396 # 8000a4a8 <CONSOLE_STATUS+0x498>
    80005a24:	00001097          	auipc	ra,0x1
    80005a28:	958080e7          	jalr	-1704(ra) # 8000637c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005a2c:	00000613          	li	a2,0
    80005a30:	00000597          	auipc	a1,0x0
    80005a34:	e2458593          	addi	a1,a1,-476 # 80005854 <_ZL11workerBodyBPv>
    80005a38:	fd840513          	addi	a0,s0,-40
    80005a3c:	ffffc097          	auipc	ra,0xffffc
    80005a40:	9c8080e7          	jalr	-1592(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005a44:	00005517          	auipc	a0,0x5
    80005a48:	a7c50513          	addi	a0,a0,-1412 # 8000a4c0 <CONSOLE_STATUS+0x4b0>
    80005a4c:	00001097          	auipc	ra,0x1
    80005a50:	930080e7          	jalr	-1744(ra) # 8000637c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005a54:	00000613          	li	a2,0
    80005a58:	00000597          	auipc	a1,0x0
    80005a5c:	c7c58593          	addi	a1,a1,-900 # 800056d4 <_ZL11workerBodyCPv>
    80005a60:	fe040513          	addi	a0,s0,-32
    80005a64:	ffffc097          	auipc	ra,0xffffc
    80005a68:	9a0080e7          	jalr	-1632(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005a6c:	00005517          	auipc	a0,0x5
    80005a70:	a6c50513          	addi	a0,a0,-1428 # 8000a4d8 <CONSOLE_STATUS+0x4c8>
    80005a74:	00001097          	auipc	ra,0x1
    80005a78:	908080e7          	jalr	-1784(ra) # 8000637c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005a7c:	00000613          	li	a2,0
    80005a80:	00000597          	auipc	a1,0x0
    80005a84:	b0c58593          	addi	a1,a1,-1268 # 8000558c <_ZL11workerBodyDPv>
    80005a88:	fe840513          	addi	a0,s0,-24
    80005a8c:	ffffc097          	auipc	ra,0xffffc
    80005a90:	978080e7          	jalr	-1672(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005a94:	00005517          	auipc	a0,0x5
    80005a98:	a5c50513          	addi	a0,a0,-1444 # 8000a4f0 <CONSOLE_STATUS+0x4e0>
    80005a9c:	00001097          	auipc	ra,0x1
    80005aa0:	8e0080e7          	jalr	-1824(ra) # 8000637c <_Z11printStringPKc>
    80005aa4:	00c0006f          	j	80005ab0 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005aa8:	ffffc097          	auipc	ra,0xffffc
    80005aac:	a18080e7          	jalr	-1512(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005ab0:	00007797          	auipc	a5,0x7
    80005ab4:	7fb7c783          	lbu	a5,2043(a5) # 8000d2ab <_ZL9finishedA>
    80005ab8:	fe0788e3          	beqz	a5,80005aa8 <_Z18Threads_C_API_testv+0xb4>
    80005abc:	00007797          	auipc	a5,0x7
    80005ac0:	7ee7c783          	lbu	a5,2030(a5) # 8000d2aa <_ZL9finishedB>
    80005ac4:	fe0782e3          	beqz	a5,80005aa8 <_Z18Threads_C_API_testv+0xb4>
    80005ac8:	00007797          	auipc	a5,0x7
    80005acc:	7e17c783          	lbu	a5,2017(a5) # 8000d2a9 <_ZL9finishedC>
    80005ad0:	fc078ce3          	beqz	a5,80005aa8 <_Z18Threads_C_API_testv+0xb4>
    80005ad4:	00007797          	auipc	a5,0x7
    80005ad8:	7d47c783          	lbu	a5,2004(a5) # 8000d2a8 <_ZL9finishedD>
    80005adc:	fc0786e3          	beqz	a5,80005aa8 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80005ae0:	02813083          	ld	ra,40(sp)
    80005ae4:	02013403          	ld	s0,32(sp)
    80005ae8:	03010113          	addi	sp,sp,48
    80005aec:	00008067          	ret

0000000080005af0 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80005af0:	fd010113          	addi	sp,sp,-48
    80005af4:	02113423          	sd	ra,40(sp)
    80005af8:	02813023          	sd	s0,32(sp)
    80005afc:	00913c23          	sd	s1,24(sp)
    80005b00:	01213823          	sd	s2,16(sp)
    80005b04:	01313423          	sd	s3,8(sp)
    80005b08:	03010413          	addi	s0,sp,48
    80005b0c:	00050993          	mv	s3,a0
    80005b10:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005b14:	00000913          	li	s2,0
    80005b18:	00c0006f          	j	80005b24 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005b1c:	ffffe097          	auipc	ra,0xffffe
    80005b20:	81c080e7          	jalr	-2020(ra) # 80003338 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005b24:	ffffc097          	auipc	ra,0xffffc
    80005b28:	adc080e7          	jalr	-1316(ra) # 80001600 <_Z4getcv>
    80005b2c:	0005059b          	sext.w	a1,a0
    80005b30:	01b00793          	li	a5,27
    80005b34:	02f58a63          	beq	a1,a5,80005b68 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005b38:	0084b503          	ld	a0,8(s1)
    80005b3c:	00001097          	auipc	ra,0x1
    80005b40:	c64080e7          	jalr	-924(ra) # 800067a0 <_ZN9BufferCPP3putEi>
        i++;
    80005b44:	0019071b          	addiw	a4,s2,1
    80005b48:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005b4c:	0004a683          	lw	a3,0(s1)
    80005b50:	0026979b          	slliw	a5,a3,0x2
    80005b54:	00d787bb          	addw	a5,a5,a3
    80005b58:	0017979b          	slliw	a5,a5,0x1
    80005b5c:	02f767bb          	remw	a5,a4,a5
    80005b60:	fc0792e3          	bnez	a5,80005b24 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80005b64:	fb9ff06f          	j	80005b1c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005b68:	00100793          	li	a5,1
    80005b6c:	00007717          	auipc	a4,0x7
    80005b70:	74f72223          	sw	a5,1860(a4) # 8000d2b0 <_ZL9threadEnd>
    td->buffer->put('!');
    80005b74:	0209b783          	ld	a5,32(s3)
    80005b78:	02100593          	li	a1,33
    80005b7c:	0087b503          	ld	a0,8(a5)
    80005b80:	00001097          	auipc	ra,0x1
    80005b84:	c20080e7          	jalr	-992(ra) # 800067a0 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005b88:	0104b503          	ld	a0,16(s1)
    80005b8c:	ffffe097          	auipc	ra,0xffffe
    80005b90:	948080e7          	jalr	-1720(ra) # 800034d4 <_ZN9Semaphore6signalEv>
}
    80005b94:	02813083          	ld	ra,40(sp)
    80005b98:	02013403          	ld	s0,32(sp)
    80005b9c:	01813483          	ld	s1,24(sp)
    80005ba0:	01013903          	ld	s2,16(sp)
    80005ba4:	00813983          	ld	s3,8(sp)
    80005ba8:	03010113          	addi	sp,sp,48
    80005bac:	00008067          	ret

0000000080005bb0 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80005bb0:	fe010113          	addi	sp,sp,-32
    80005bb4:	00113c23          	sd	ra,24(sp)
    80005bb8:	00813823          	sd	s0,16(sp)
    80005bbc:	00913423          	sd	s1,8(sp)
    80005bc0:	01213023          	sd	s2,0(sp)
    80005bc4:	02010413          	addi	s0,sp,32
    80005bc8:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005bcc:	00000913          	li	s2,0
    80005bd0:	00c0006f          	j	80005bdc <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005bd4:	ffffd097          	auipc	ra,0xffffd
    80005bd8:	764080e7          	jalr	1892(ra) # 80003338 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005bdc:	00007797          	auipc	a5,0x7
    80005be0:	6d47a783          	lw	a5,1748(a5) # 8000d2b0 <_ZL9threadEnd>
    80005be4:	02079e63          	bnez	a5,80005c20 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005be8:	0004a583          	lw	a1,0(s1)
    80005bec:	0305859b          	addiw	a1,a1,48
    80005bf0:	0084b503          	ld	a0,8(s1)
    80005bf4:	00001097          	auipc	ra,0x1
    80005bf8:	bac080e7          	jalr	-1108(ra) # 800067a0 <_ZN9BufferCPP3putEi>
        i++;
    80005bfc:	0019071b          	addiw	a4,s2,1
    80005c00:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005c04:	0004a683          	lw	a3,0(s1)
    80005c08:	0026979b          	slliw	a5,a3,0x2
    80005c0c:	00d787bb          	addw	a5,a5,a3
    80005c10:	0017979b          	slliw	a5,a5,0x1
    80005c14:	02f767bb          	remw	a5,a4,a5
    80005c18:	fc0792e3          	bnez	a5,80005bdc <_ZN12ProducerSync8producerEPv+0x2c>
    80005c1c:	fb9ff06f          	j	80005bd4 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005c20:	0104b503          	ld	a0,16(s1)
    80005c24:	ffffe097          	auipc	ra,0xffffe
    80005c28:	8b0080e7          	jalr	-1872(ra) # 800034d4 <_ZN9Semaphore6signalEv>
}
    80005c2c:	01813083          	ld	ra,24(sp)
    80005c30:	01013403          	ld	s0,16(sp)
    80005c34:	00813483          	ld	s1,8(sp)
    80005c38:	00013903          	ld	s2,0(sp)
    80005c3c:	02010113          	addi	sp,sp,32
    80005c40:	00008067          	ret

0000000080005c44 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005c44:	fd010113          	addi	sp,sp,-48
    80005c48:	02113423          	sd	ra,40(sp)
    80005c4c:	02813023          	sd	s0,32(sp)
    80005c50:	00913c23          	sd	s1,24(sp)
    80005c54:	01213823          	sd	s2,16(sp)
    80005c58:	01313423          	sd	s3,8(sp)
    80005c5c:	01413023          	sd	s4,0(sp)
    80005c60:	03010413          	addi	s0,sp,48
    80005c64:	00050993          	mv	s3,a0
    80005c68:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005c6c:	00000a13          	li	s4,0
    80005c70:	01c0006f          	j	80005c8c <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005c74:	ffffd097          	auipc	ra,0xffffd
    80005c78:	6c4080e7          	jalr	1732(ra) # 80003338 <_ZN6Thread8dispatchEv>
    80005c7c:	0500006f          	j	80005ccc <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005c80:	00a00513          	li	a0,10
    80005c84:	ffffc097          	auipc	ra,0xffffc
    80005c88:	9a4080e7          	jalr	-1628(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    80005c8c:	00007797          	auipc	a5,0x7
    80005c90:	6247a783          	lw	a5,1572(a5) # 8000d2b0 <_ZL9threadEnd>
    80005c94:	06079263          	bnez	a5,80005cf8 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005c98:	00893503          	ld	a0,8(s2)
    80005c9c:	00001097          	auipc	ra,0x1
    80005ca0:	b94080e7          	jalr	-1132(ra) # 80006830 <_ZN9BufferCPP3getEv>
        i++;
    80005ca4:	001a049b          	addiw	s1,s4,1
    80005ca8:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005cac:	0ff57513          	andi	a0,a0,255
    80005cb0:	ffffc097          	auipc	ra,0xffffc
    80005cb4:	978080e7          	jalr	-1672(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005cb8:	00092703          	lw	a4,0(s2)
    80005cbc:	0027179b          	slliw	a5,a4,0x2
    80005cc0:	00e787bb          	addw	a5,a5,a4
    80005cc4:	02f4e7bb          	remw	a5,s1,a5
    80005cc8:	fa0786e3          	beqz	a5,80005c74 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005ccc:	05000793          	li	a5,80
    80005cd0:	02f4e4bb          	remw	s1,s1,a5
    80005cd4:	fa049ce3          	bnez	s1,80005c8c <_ZN12ConsumerSync8consumerEPv+0x48>
    80005cd8:	fa9ff06f          	j	80005c80 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005cdc:	0209b783          	ld	a5,32(s3)
    80005ce0:	0087b503          	ld	a0,8(a5)
    80005ce4:	00001097          	auipc	ra,0x1
    80005ce8:	b4c080e7          	jalr	-1204(ra) # 80006830 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005cec:	0ff57513          	andi	a0,a0,255
    80005cf0:	ffffe097          	auipc	ra,0xffffe
    80005cf4:	8a8080e7          	jalr	-1880(ra) # 80003598 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005cf8:	0209b783          	ld	a5,32(s3)
    80005cfc:	0087b503          	ld	a0,8(a5)
    80005d00:	00001097          	auipc	ra,0x1
    80005d04:	bbc080e7          	jalr	-1092(ra) # 800068bc <_ZN9BufferCPP6getCntEv>
    80005d08:	fca04ae3          	bgtz	a0,80005cdc <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005d0c:	01093503          	ld	a0,16(s2)
    80005d10:	ffffd097          	auipc	ra,0xffffd
    80005d14:	7c4080e7          	jalr	1988(ra) # 800034d4 <_ZN9Semaphore6signalEv>
}
    80005d18:	02813083          	ld	ra,40(sp)
    80005d1c:	02013403          	ld	s0,32(sp)
    80005d20:	01813483          	ld	s1,24(sp)
    80005d24:	01013903          	ld	s2,16(sp)
    80005d28:	00813983          	ld	s3,8(sp)
    80005d2c:	00013a03          	ld	s4,0(sp)
    80005d30:	03010113          	addi	sp,sp,48
    80005d34:	00008067          	ret

0000000080005d38 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005d38:	f8010113          	addi	sp,sp,-128
    80005d3c:	06113c23          	sd	ra,120(sp)
    80005d40:	06813823          	sd	s0,112(sp)
    80005d44:	06913423          	sd	s1,104(sp)
    80005d48:	07213023          	sd	s2,96(sp)
    80005d4c:	05313c23          	sd	s3,88(sp)
    80005d50:	05413823          	sd	s4,80(sp)
    80005d54:	05513423          	sd	s5,72(sp)
    80005d58:	05613023          	sd	s6,64(sp)
    80005d5c:	03713c23          	sd	s7,56(sp)
    80005d60:	03813823          	sd	s8,48(sp)
    80005d64:	03913423          	sd	s9,40(sp)
    80005d68:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005d6c:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005d70:	00004517          	auipc	a0,0x4
    80005d74:	5a850513          	addi	a0,a0,1448 # 8000a318 <CONSOLE_STATUS+0x308>
    80005d78:	00000097          	auipc	ra,0x0
    80005d7c:	604080e7          	jalr	1540(ra) # 8000637c <_Z11printStringPKc>
    getString(input, 30);
    80005d80:	01e00593          	li	a1,30
    80005d84:	f8040493          	addi	s1,s0,-128
    80005d88:	00048513          	mv	a0,s1
    80005d8c:	00000097          	auipc	ra,0x0
    80005d90:	678080e7          	jalr	1656(ra) # 80006404 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005d94:	00048513          	mv	a0,s1
    80005d98:	00000097          	auipc	ra,0x0
    80005d9c:	744080e7          	jalr	1860(ra) # 800064dc <_Z11stringToIntPKc>
    80005da0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005da4:	00004517          	auipc	a0,0x4
    80005da8:	59450513          	addi	a0,a0,1428 # 8000a338 <CONSOLE_STATUS+0x328>
    80005dac:	00000097          	auipc	ra,0x0
    80005db0:	5d0080e7          	jalr	1488(ra) # 8000637c <_Z11printStringPKc>
    getString(input, 30);
    80005db4:	01e00593          	li	a1,30
    80005db8:	00048513          	mv	a0,s1
    80005dbc:	00000097          	auipc	ra,0x0
    80005dc0:	648080e7          	jalr	1608(ra) # 80006404 <_Z9getStringPci>
    n = stringToInt(input);
    80005dc4:	00048513          	mv	a0,s1
    80005dc8:	00000097          	auipc	ra,0x0
    80005dcc:	714080e7          	jalr	1812(ra) # 800064dc <_Z11stringToIntPKc>
    80005dd0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005dd4:	00004517          	auipc	a0,0x4
    80005dd8:	58450513          	addi	a0,a0,1412 # 8000a358 <CONSOLE_STATUS+0x348>
    80005ddc:	00000097          	auipc	ra,0x0
    80005de0:	5a0080e7          	jalr	1440(ra) # 8000637c <_Z11printStringPKc>
    80005de4:	00000613          	li	a2,0
    80005de8:	00a00593          	li	a1,10
    80005dec:	00090513          	mv	a0,s2
    80005df0:	00000097          	auipc	ra,0x0
    80005df4:	73c080e7          	jalr	1852(ra) # 8000652c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005df8:	00004517          	auipc	a0,0x4
    80005dfc:	57850513          	addi	a0,a0,1400 # 8000a370 <CONSOLE_STATUS+0x360>
    80005e00:	00000097          	auipc	ra,0x0
    80005e04:	57c080e7          	jalr	1404(ra) # 8000637c <_Z11printStringPKc>
    80005e08:	00000613          	li	a2,0
    80005e0c:	00a00593          	li	a1,10
    80005e10:	00048513          	mv	a0,s1
    80005e14:	00000097          	auipc	ra,0x0
    80005e18:	718080e7          	jalr	1816(ra) # 8000652c <_Z8printIntiii>
    printString(".\n");
    80005e1c:	00004517          	auipc	a0,0x4
    80005e20:	56c50513          	addi	a0,a0,1388 # 8000a388 <CONSOLE_STATUS+0x378>
    80005e24:	00000097          	auipc	ra,0x0
    80005e28:	558080e7          	jalr	1368(ra) # 8000637c <_Z11printStringPKc>
    if(threadNum > n) {
    80005e2c:	0324c463          	blt	s1,s2,80005e54 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005e30:	03205c63          	blez	s2,80005e68 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005e34:	03800513          	li	a0,56
    80005e38:	ffffd097          	auipc	ra,0xffffd
    80005e3c:	2cc080e7          	jalr	716(ra) # 80003104 <_Znwm>
    80005e40:	00050a93          	mv	s5,a0
    80005e44:	00048593          	mv	a1,s1
    80005e48:	00001097          	auipc	ra,0x1
    80005e4c:	804080e7          	jalr	-2044(ra) # 8000664c <_ZN9BufferCPPC1Ei>
    80005e50:	0300006f          	j	80005e80 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005e54:	00004517          	auipc	a0,0x4
    80005e58:	53c50513          	addi	a0,a0,1340 # 8000a390 <CONSOLE_STATUS+0x380>
    80005e5c:	00000097          	auipc	ra,0x0
    80005e60:	520080e7          	jalr	1312(ra) # 8000637c <_Z11printStringPKc>
        return;
    80005e64:	0140006f          	j	80005e78 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005e68:	00004517          	auipc	a0,0x4
    80005e6c:	56850513          	addi	a0,a0,1384 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80005e70:	00000097          	auipc	ra,0x0
    80005e74:	50c080e7          	jalr	1292(ra) # 8000637c <_Z11printStringPKc>
        return;
    80005e78:	000b8113          	mv	sp,s7
    80005e7c:	2380006f          	j	800060b4 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005e80:	01000513          	li	a0,16
    80005e84:	ffffd097          	auipc	ra,0xffffd
    80005e88:	280080e7          	jalr	640(ra) # 80003104 <_Znwm>
    80005e8c:	00050493          	mv	s1,a0
    80005e90:	00000593          	li	a1,0
    80005e94:	ffffd097          	auipc	ra,0xffffd
    80005e98:	5dc080e7          	jalr	1500(ra) # 80003470 <_ZN9SemaphoreC1Ej>
    80005e9c:	00007797          	auipc	a5,0x7
    80005ea0:	4097be23          	sd	s1,1052(a5) # 8000d2b8 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005ea4:	00391793          	slli	a5,s2,0x3
    80005ea8:	00f78793          	addi	a5,a5,15
    80005eac:	ff07f793          	andi	a5,a5,-16
    80005eb0:	40f10133          	sub	sp,sp,a5
    80005eb4:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005eb8:	0019071b          	addiw	a4,s2,1
    80005ebc:	00171793          	slli	a5,a4,0x1
    80005ec0:	00e787b3          	add	a5,a5,a4
    80005ec4:	00379793          	slli	a5,a5,0x3
    80005ec8:	00f78793          	addi	a5,a5,15
    80005ecc:	ff07f793          	andi	a5,a5,-16
    80005ed0:	40f10133          	sub	sp,sp,a5
    80005ed4:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005ed8:	00191c13          	slli	s8,s2,0x1
    80005edc:	012c07b3          	add	a5,s8,s2
    80005ee0:	00379793          	slli	a5,a5,0x3
    80005ee4:	00fa07b3          	add	a5,s4,a5
    80005ee8:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005eec:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005ef0:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005ef4:	02800513          	li	a0,40
    80005ef8:	ffffd097          	auipc	ra,0xffffd
    80005efc:	20c080e7          	jalr	524(ra) # 80003104 <_Znwm>
    80005f00:	00050b13          	mv	s6,a0
    80005f04:	012c0c33          	add	s8,s8,s2
    80005f08:	003c1c13          	slli	s8,s8,0x3
    80005f0c:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005f10:	ffffd097          	auipc	ra,0xffffd
    80005f14:	4e4080e7          	jalr	1252(ra) # 800033f4 <_ZN6ThreadC1Ev>
    80005f18:	00007797          	auipc	a5,0x7
    80005f1c:	10078793          	addi	a5,a5,256 # 8000d018 <_ZTV12ConsumerSync+0x10>
    80005f20:	00fb3023          	sd	a5,0(s6)
    80005f24:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005f28:	000b0513          	mv	a0,s6
    80005f2c:	ffffd097          	auipc	ra,0xffffd
    80005f30:	390080e7          	jalr	912(ra) # 800032bc <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005f34:	00000493          	li	s1,0
    80005f38:	0380006f          	j	80005f70 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005f3c:	00007797          	auipc	a5,0x7
    80005f40:	0b478793          	addi	a5,a5,180 # 8000cff0 <_ZTV12ProducerSync+0x10>
    80005f44:	00fcb023          	sd	a5,0(s9)
    80005f48:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005f4c:	00349793          	slli	a5,s1,0x3
    80005f50:	00f987b3          	add	a5,s3,a5
    80005f54:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005f58:	00349793          	slli	a5,s1,0x3
    80005f5c:	00f987b3          	add	a5,s3,a5
    80005f60:	0007b503          	ld	a0,0(a5)
    80005f64:	ffffd097          	auipc	ra,0xffffd
    80005f68:	358080e7          	jalr	856(ra) # 800032bc <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005f6c:	0014849b          	addiw	s1,s1,1
    80005f70:	0b24d063          	bge	s1,s2,80006010 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005f74:	00149793          	slli	a5,s1,0x1
    80005f78:	009787b3          	add	a5,a5,s1
    80005f7c:	00379793          	slli	a5,a5,0x3
    80005f80:	00fa07b3          	add	a5,s4,a5
    80005f84:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005f88:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005f8c:	00007717          	auipc	a4,0x7
    80005f90:	32c73703          	ld	a4,812(a4) # 8000d2b8 <_ZL10waitForAll>
    80005f94:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005f98:	02905863          	blez	s1,80005fc8 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005f9c:	02800513          	li	a0,40
    80005fa0:	ffffd097          	auipc	ra,0xffffd
    80005fa4:	164080e7          	jalr	356(ra) # 80003104 <_Znwm>
    80005fa8:	00050c93          	mv	s9,a0
    80005fac:	00149c13          	slli	s8,s1,0x1
    80005fb0:	009c0c33          	add	s8,s8,s1
    80005fb4:	003c1c13          	slli	s8,s8,0x3
    80005fb8:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005fbc:	ffffd097          	auipc	ra,0xffffd
    80005fc0:	438080e7          	jalr	1080(ra) # 800033f4 <_ZN6ThreadC1Ev>
    80005fc4:	f79ff06f          	j	80005f3c <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005fc8:	02800513          	li	a0,40
    80005fcc:	ffffd097          	auipc	ra,0xffffd
    80005fd0:	138080e7          	jalr	312(ra) # 80003104 <_Znwm>
    80005fd4:	00050c93          	mv	s9,a0
    80005fd8:	00149c13          	slli	s8,s1,0x1
    80005fdc:	009c0c33          	add	s8,s8,s1
    80005fe0:	003c1c13          	slli	s8,s8,0x3
    80005fe4:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005fe8:	ffffd097          	auipc	ra,0xffffd
    80005fec:	40c080e7          	jalr	1036(ra) # 800033f4 <_ZN6ThreadC1Ev>
    80005ff0:	00007797          	auipc	a5,0x7
    80005ff4:	fd878793          	addi	a5,a5,-40 # 8000cfc8 <_ZTV16ProducerKeyboard+0x10>
    80005ff8:	00fcb023          	sd	a5,0(s9)
    80005ffc:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80006000:	00349793          	slli	a5,s1,0x3
    80006004:	00f987b3          	add	a5,s3,a5
    80006008:	0197b023          	sd	s9,0(a5)
    8000600c:	f4dff06f          	j	80005f58 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80006010:	ffffd097          	auipc	ra,0xffffd
    80006014:	328080e7          	jalr	808(ra) # 80003338 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80006018:	00000493          	li	s1,0
    8000601c:	00994e63          	blt	s2,s1,80006038 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80006020:	00007517          	auipc	a0,0x7
    80006024:	29853503          	ld	a0,664(a0) # 8000d2b8 <_ZL10waitForAll>
    80006028:	ffffd097          	auipc	ra,0xffffd
    8000602c:	480080e7          	jalr	1152(ra) # 800034a8 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80006030:	0014849b          	addiw	s1,s1,1
    80006034:	fe9ff06f          	j	8000601c <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80006038:	00000493          	li	s1,0
    8000603c:	0080006f          	j	80006044 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80006040:	0014849b          	addiw	s1,s1,1
    80006044:	0324d263          	bge	s1,s2,80006068 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80006048:	00349793          	slli	a5,s1,0x3
    8000604c:	00f987b3          	add	a5,s3,a5
    80006050:	0007b503          	ld	a0,0(a5)
    80006054:	fe0506e3          	beqz	a0,80006040 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80006058:	00053783          	ld	a5,0(a0)
    8000605c:	0087b783          	ld	a5,8(a5)
    80006060:	000780e7          	jalr	a5
    80006064:	fddff06f          	j	80006040 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80006068:	000b0a63          	beqz	s6,8000607c <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    8000606c:	000b3783          	ld	a5,0(s6)
    80006070:	0087b783          	ld	a5,8(a5)
    80006074:	000b0513          	mv	a0,s6
    80006078:	000780e7          	jalr	a5
    delete waitForAll;
    8000607c:	00007517          	auipc	a0,0x7
    80006080:	23c53503          	ld	a0,572(a0) # 8000d2b8 <_ZL10waitForAll>
    80006084:	00050863          	beqz	a0,80006094 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80006088:	00053783          	ld	a5,0(a0)
    8000608c:	0087b783          	ld	a5,8(a5)
    80006090:	000780e7          	jalr	a5
    delete buffer;
    80006094:	000a8e63          	beqz	s5,800060b0 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80006098:	000a8513          	mv	a0,s5
    8000609c:	00001097          	auipc	ra,0x1
    800060a0:	8a8080e7          	jalr	-1880(ra) # 80006944 <_ZN9BufferCPPD1Ev>
    800060a4:	000a8513          	mv	a0,s5
    800060a8:	ffffd097          	auipc	ra,0xffffd
    800060ac:	0ac080e7          	jalr	172(ra) # 80003154 <_ZdlPv>
    800060b0:	000b8113          	mv	sp,s7

}
    800060b4:	f8040113          	addi	sp,s0,-128
    800060b8:	07813083          	ld	ra,120(sp)
    800060bc:	07013403          	ld	s0,112(sp)
    800060c0:	06813483          	ld	s1,104(sp)
    800060c4:	06013903          	ld	s2,96(sp)
    800060c8:	05813983          	ld	s3,88(sp)
    800060cc:	05013a03          	ld	s4,80(sp)
    800060d0:	04813a83          	ld	s5,72(sp)
    800060d4:	04013b03          	ld	s6,64(sp)
    800060d8:	03813b83          	ld	s7,56(sp)
    800060dc:	03013c03          	ld	s8,48(sp)
    800060e0:	02813c83          	ld	s9,40(sp)
    800060e4:	08010113          	addi	sp,sp,128
    800060e8:	00008067          	ret
    800060ec:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800060f0:	000a8513          	mv	a0,s5
    800060f4:	ffffd097          	auipc	ra,0xffffd
    800060f8:	060080e7          	jalr	96(ra) # 80003154 <_ZdlPv>
    800060fc:	00048513          	mv	a0,s1
    80006100:	00008097          	auipc	ra,0x8
    80006104:	2b8080e7          	jalr	696(ra) # 8000e3b8 <_Unwind_Resume>
    80006108:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    8000610c:	00048513          	mv	a0,s1
    80006110:	ffffd097          	auipc	ra,0xffffd
    80006114:	044080e7          	jalr	68(ra) # 80003154 <_ZdlPv>
    80006118:	00090513          	mv	a0,s2
    8000611c:	00008097          	auipc	ra,0x8
    80006120:	29c080e7          	jalr	668(ra) # 8000e3b8 <_Unwind_Resume>
    80006124:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80006128:	000b0513          	mv	a0,s6
    8000612c:	ffffd097          	auipc	ra,0xffffd
    80006130:	028080e7          	jalr	40(ra) # 80003154 <_ZdlPv>
    80006134:	00048513          	mv	a0,s1
    80006138:	00008097          	auipc	ra,0x8
    8000613c:	280080e7          	jalr	640(ra) # 8000e3b8 <_Unwind_Resume>
    80006140:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80006144:	000c8513          	mv	a0,s9
    80006148:	ffffd097          	auipc	ra,0xffffd
    8000614c:	00c080e7          	jalr	12(ra) # 80003154 <_ZdlPv>
    80006150:	00048513          	mv	a0,s1
    80006154:	00008097          	auipc	ra,0x8
    80006158:	264080e7          	jalr	612(ra) # 8000e3b8 <_Unwind_Resume>
    8000615c:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80006160:	000c8513          	mv	a0,s9
    80006164:	ffffd097          	auipc	ra,0xffffd
    80006168:	ff0080e7          	jalr	-16(ra) # 80003154 <_ZdlPv>
    8000616c:	00048513          	mv	a0,s1
    80006170:	00008097          	auipc	ra,0x8
    80006174:	248080e7          	jalr	584(ra) # 8000e3b8 <_Unwind_Resume>

0000000080006178 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80006178:	ff010113          	addi	sp,sp,-16
    8000617c:	00113423          	sd	ra,8(sp)
    80006180:	00813023          	sd	s0,0(sp)
    80006184:	01010413          	addi	s0,sp,16
    80006188:	00007797          	auipc	a5,0x7
    8000618c:	e9078793          	addi	a5,a5,-368 # 8000d018 <_ZTV12ConsumerSync+0x10>
    80006190:	00f53023          	sd	a5,0(a0)
    80006194:	ffffd097          	auipc	ra,0xffffd
    80006198:	e90080e7          	jalr	-368(ra) # 80003024 <_ZN6ThreadD1Ev>
    8000619c:	00813083          	ld	ra,8(sp)
    800061a0:	00013403          	ld	s0,0(sp)
    800061a4:	01010113          	addi	sp,sp,16
    800061a8:	00008067          	ret

00000000800061ac <_ZN12ConsumerSyncD0Ev>:
    800061ac:	fe010113          	addi	sp,sp,-32
    800061b0:	00113c23          	sd	ra,24(sp)
    800061b4:	00813823          	sd	s0,16(sp)
    800061b8:	00913423          	sd	s1,8(sp)
    800061bc:	02010413          	addi	s0,sp,32
    800061c0:	00050493          	mv	s1,a0
    800061c4:	00007797          	auipc	a5,0x7
    800061c8:	e5478793          	addi	a5,a5,-428 # 8000d018 <_ZTV12ConsumerSync+0x10>
    800061cc:	00f53023          	sd	a5,0(a0)
    800061d0:	ffffd097          	auipc	ra,0xffffd
    800061d4:	e54080e7          	jalr	-428(ra) # 80003024 <_ZN6ThreadD1Ev>
    800061d8:	00048513          	mv	a0,s1
    800061dc:	ffffd097          	auipc	ra,0xffffd
    800061e0:	f78080e7          	jalr	-136(ra) # 80003154 <_ZdlPv>
    800061e4:	01813083          	ld	ra,24(sp)
    800061e8:	01013403          	ld	s0,16(sp)
    800061ec:	00813483          	ld	s1,8(sp)
    800061f0:	02010113          	addi	sp,sp,32
    800061f4:	00008067          	ret

00000000800061f8 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    800061f8:	ff010113          	addi	sp,sp,-16
    800061fc:	00113423          	sd	ra,8(sp)
    80006200:	00813023          	sd	s0,0(sp)
    80006204:	01010413          	addi	s0,sp,16
    80006208:	00007797          	auipc	a5,0x7
    8000620c:	de878793          	addi	a5,a5,-536 # 8000cff0 <_ZTV12ProducerSync+0x10>
    80006210:	00f53023          	sd	a5,0(a0)
    80006214:	ffffd097          	auipc	ra,0xffffd
    80006218:	e10080e7          	jalr	-496(ra) # 80003024 <_ZN6ThreadD1Ev>
    8000621c:	00813083          	ld	ra,8(sp)
    80006220:	00013403          	ld	s0,0(sp)
    80006224:	01010113          	addi	sp,sp,16
    80006228:	00008067          	ret

000000008000622c <_ZN12ProducerSyncD0Ev>:
    8000622c:	fe010113          	addi	sp,sp,-32
    80006230:	00113c23          	sd	ra,24(sp)
    80006234:	00813823          	sd	s0,16(sp)
    80006238:	00913423          	sd	s1,8(sp)
    8000623c:	02010413          	addi	s0,sp,32
    80006240:	00050493          	mv	s1,a0
    80006244:	00007797          	auipc	a5,0x7
    80006248:	dac78793          	addi	a5,a5,-596 # 8000cff0 <_ZTV12ProducerSync+0x10>
    8000624c:	00f53023          	sd	a5,0(a0)
    80006250:	ffffd097          	auipc	ra,0xffffd
    80006254:	dd4080e7          	jalr	-556(ra) # 80003024 <_ZN6ThreadD1Ev>
    80006258:	00048513          	mv	a0,s1
    8000625c:	ffffd097          	auipc	ra,0xffffd
    80006260:	ef8080e7          	jalr	-264(ra) # 80003154 <_ZdlPv>
    80006264:	01813083          	ld	ra,24(sp)
    80006268:	01013403          	ld	s0,16(sp)
    8000626c:	00813483          	ld	s1,8(sp)
    80006270:	02010113          	addi	sp,sp,32
    80006274:	00008067          	ret

0000000080006278 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80006278:	ff010113          	addi	sp,sp,-16
    8000627c:	00113423          	sd	ra,8(sp)
    80006280:	00813023          	sd	s0,0(sp)
    80006284:	01010413          	addi	s0,sp,16
    80006288:	00007797          	auipc	a5,0x7
    8000628c:	d4078793          	addi	a5,a5,-704 # 8000cfc8 <_ZTV16ProducerKeyboard+0x10>
    80006290:	00f53023          	sd	a5,0(a0)
    80006294:	ffffd097          	auipc	ra,0xffffd
    80006298:	d90080e7          	jalr	-624(ra) # 80003024 <_ZN6ThreadD1Ev>
    8000629c:	00813083          	ld	ra,8(sp)
    800062a0:	00013403          	ld	s0,0(sp)
    800062a4:	01010113          	addi	sp,sp,16
    800062a8:	00008067          	ret

00000000800062ac <_ZN16ProducerKeyboardD0Ev>:
    800062ac:	fe010113          	addi	sp,sp,-32
    800062b0:	00113c23          	sd	ra,24(sp)
    800062b4:	00813823          	sd	s0,16(sp)
    800062b8:	00913423          	sd	s1,8(sp)
    800062bc:	02010413          	addi	s0,sp,32
    800062c0:	00050493          	mv	s1,a0
    800062c4:	00007797          	auipc	a5,0x7
    800062c8:	d0478793          	addi	a5,a5,-764 # 8000cfc8 <_ZTV16ProducerKeyboard+0x10>
    800062cc:	00f53023          	sd	a5,0(a0)
    800062d0:	ffffd097          	auipc	ra,0xffffd
    800062d4:	d54080e7          	jalr	-684(ra) # 80003024 <_ZN6ThreadD1Ev>
    800062d8:	00048513          	mv	a0,s1
    800062dc:	ffffd097          	auipc	ra,0xffffd
    800062e0:	e78080e7          	jalr	-392(ra) # 80003154 <_ZdlPv>
    800062e4:	01813083          	ld	ra,24(sp)
    800062e8:	01013403          	ld	s0,16(sp)
    800062ec:	00813483          	ld	s1,8(sp)
    800062f0:	02010113          	addi	sp,sp,32
    800062f4:	00008067          	ret

00000000800062f8 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    800062f8:	ff010113          	addi	sp,sp,-16
    800062fc:	00113423          	sd	ra,8(sp)
    80006300:	00813023          	sd	s0,0(sp)
    80006304:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80006308:	02053583          	ld	a1,32(a0)
    8000630c:	fffff097          	auipc	ra,0xfffff
    80006310:	7e4080e7          	jalr	2020(ra) # 80005af0 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80006314:	00813083          	ld	ra,8(sp)
    80006318:	00013403          	ld	s0,0(sp)
    8000631c:	01010113          	addi	sp,sp,16
    80006320:	00008067          	ret

0000000080006324 <_ZN12ProducerSync3runEv>:
    void run() override {
    80006324:	ff010113          	addi	sp,sp,-16
    80006328:	00113423          	sd	ra,8(sp)
    8000632c:	00813023          	sd	s0,0(sp)
    80006330:	01010413          	addi	s0,sp,16
        producer(td);
    80006334:	02053583          	ld	a1,32(a0)
    80006338:	00000097          	auipc	ra,0x0
    8000633c:	878080e7          	jalr	-1928(ra) # 80005bb0 <_ZN12ProducerSync8producerEPv>
    }
    80006340:	00813083          	ld	ra,8(sp)
    80006344:	00013403          	ld	s0,0(sp)
    80006348:	01010113          	addi	sp,sp,16
    8000634c:	00008067          	ret

0000000080006350 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80006350:	ff010113          	addi	sp,sp,-16
    80006354:	00113423          	sd	ra,8(sp)
    80006358:	00813023          	sd	s0,0(sp)
    8000635c:	01010413          	addi	s0,sp,16
        consumer(td);
    80006360:	02053583          	ld	a1,32(a0)
    80006364:	00000097          	auipc	ra,0x0
    80006368:	8e0080e7          	jalr	-1824(ra) # 80005c44 <_ZN12ConsumerSync8consumerEPv>
    }
    8000636c:	00813083          	ld	ra,8(sp)
    80006370:	00013403          	ld	s0,0(sp)
    80006374:	01010113          	addi	sp,sp,16
    80006378:	00008067          	ret

000000008000637c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    8000637c:	fe010113          	addi	sp,sp,-32
    80006380:	00113c23          	sd	ra,24(sp)
    80006384:	00813823          	sd	s0,16(sp)
    80006388:	00913423          	sd	s1,8(sp)
    8000638c:	02010413          	addi	s0,sp,32
    80006390:	00050493          	mv	s1,a0
    LOCK();
    80006394:	00100613          	li	a2,1
    80006398:	00000593          	li	a1,0
    8000639c:	00007517          	auipc	a0,0x7
    800063a0:	f2450513          	addi	a0,a0,-220 # 8000d2c0 <lockPrint>
    800063a4:	ffffb097          	auipc	ra,0xffffb
    800063a8:	d80080e7          	jalr	-640(ra) # 80001124 <copy_and_swap>
    800063ac:	00050863          	beqz	a0,800063bc <_Z11printStringPKc+0x40>
    800063b0:	ffffb097          	auipc	ra,0xffffb
    800063b4:	110080e7          	jalr	272(ra) # 800014c0 <_Z15thread_dispatchv>
    800063b8:	fddff06f          	j	80006394 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800063bc:	0004c503          	lbu	a0,0(s1)
    800063c0:	00050a63          	beqz	a0,800063d4 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    800063c4:	ffffb097          	auipc	ra,0xffffb
    800063c8:	264080e7          	jalr	612(ra) # 80001628 <_Z4putcc>
        string++;
    800063cc:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800063d0:	fedff06f          	j	800063bc <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800063d4:	00000613          	li	a2,0
    800063d8:	00100593          	li	a1,1
    800063dc:	00007517          	auipc	a0,0x7
    800063e0:	ee450513          	addi	a0,a0,-284 # 8000d2c0 <lockPrint>
    800063e4:	ffffb097          	auipc	ra,0xffffb
    800063e8:	d40080e7          	jalr	-704(ra) # 80001124 <copy_and_swap>
    800063ec:	fe0514e3          	bnez	a0,800063d4 <_Z11printStringPKc+0x58>
}
    800063f0:	01813083          	ld	ra,24(sp)
    800063f4:	01013403          	ld	s0,16(sp)
    800063f8:	00813483          	ld	s1,8(sp)
    800063fc:	02010113          	addi	sp,sp,32
    80006400:	00008067          	ret

0000000080006404 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80006404:	fd010113          	addi	sp,sp,-48
    80006408:	02113423          	sd	ra,40(sp)
    8000640c:	02813023          	sd	s0,32(sp)
    80006410:	00913c23          	sd	s1,24(sp)
    80006414:	01213823          	sd	s2,16(sp)
    80006418:	01313423          	sd	s3,8(sp)
    8000641c:	01413023          	sd	s4,0(sp)
    80006420:	03010413          	addi	s0,sp,48
    80006424:	00050993          	mv	s3,a0
    80006428:	00058a13          	mv	s4,a1
    LOCK();
    8000642c:	00100613          	li	a2,1
    80006430:	00000593          	li	a1,0
    80006434:	00007517          	auipc	a0,0x7
    80006438:	e8c50513          	addi	a0,a0,-372 # 8000d2c0 <lockPrint>
    8000643c:	ffffb097          	auipc	ra,0xffffb
    80006440:	ce8080e7          	jalr	-792(ra) # 80001124 <copy_and_swap>
    80006444:	00050863          	beqz	a0,80006454 <_Z9getStringPci+0x50>
    80006448:	ffffb097          	auipc	ra,0xffffb
    8000644c:	078080e7          	jalr	120(ra) # 800014c0 <_Z15thread_dispatchv>
    80006450:	fddff06f          	j	8000642c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80006454:	00000913          	li	s2,0
    80006458:	00090493          	mv	s1,s2
    8000645c:	0019091b          	addiw	s2,s2,1
    80006460:	03495a63          	bge	s2,s4,80006494 <_Z9getStringPci+0x90>
        cc = getc();
    80006464:	ffffb097          	auipc	ra,0xffffb
    80006468:	19c080e7          	jalr	412(ra) # 80001600 <_Z4getcv>
        if(cc < 1)
    8000646c:	02050463          	beqz	a0,80006494 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80006470:	009984b3          	add	s1,s3,s1
    80006474:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80006478:	00a00793          	li	a5,10
    8000647c:	00f50a63          	beq	a0,a5,80006490 <_Z9getStringPci+0x8c>
    80006480:	00d00793          	li	a5,13
    80006484:	fcf51ae3          	bne	a0,a5,80006458 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80006488:	00090493          	mv	s1,s2
    8000648c:	0080006f          	j	80006494 <_Z9getStringPci+0x90>
    80006490:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80006494:	009984b3          	add	s1,s3,s1
    80006498:	00048023          	sb	zero,0(s1)

    UNLOCK();
    8000649c:	00000613          	li	a2,0
    800064a0:	00100593          	li	a1,1
    800064a4:	00007517          	auipc	a0,0x7
    800064a8:	e1c50513          	addi	a0,a0,-484 # 8000d2c0 <lockPrint>
    800064ac:	ffffb097          	auipc	ra,0xffffb
    800064b0:	c78080e7          	jalr	-904(ra) # 80001124 <copy_and_swap>
    800064b4:	fe0514e3          	bnez	a0,8000649c <_Z9getStringPci+0x98>
    return buf;
}
    800064b8:	00098513          	mv	a0,s3
    800064bc:	02813083          	ld	ra,40(sp)
    800064c0:	02013403          	ld	s0,32(sp)
    800064c4:	01813483          	ld	s1,24(sp)
    800064c8:	01013903          	ld	s2,16(sp)
    800064cc:	00813983          	ld	s3,8(sp)
    800064d0:	00013a03          	ld	s4,0(sp)
    800064d4:	03010113          	addi	sp,sp,48
    800064d8:	00008067          	ret

00000000800064dc <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800064dc:	ff010113          	addi	sp,sp,-16
    800064e0:	00813423          	sd	s0,8(sp)
    800064e4:	01010413          	addi	s0,sp,16
    800064e8:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800064ec:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800064f0:	0006c603          	lbu	a2,0(a3)
    800064f4:	fd06071b          	addiw	a4,a2,-48
    800064f8:	0ff77713          	andi	a4,a4,255
    800064fc:	00900793          	li	a5,9
    80006500:	02e7e063          	bltu	a5,a4,80006520 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80006504:	0025179b          	slliw	a5,a0,0x2
    80006508:	00a787bb          	addw	a5,a5,a0
    8000650c:	0017979b          	slliw	a5,a5,0x1
    80006510:	00168693          	addi	a3,a3,1
    80006514:	00c787bb          	addw	a5,a5,a2
    80006518:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    8000651c:	fd5ff06f          	j	800064f0 <_Z11stringToIntPKc+0x14>
    return n;
}
    80006520:	00813403          	ld	s0,8(sp)
    80006524:	01010113          	addi	sp,sp,16
    80006528:	00008067          	ret

000000008000652c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    8000652c:	fc010113          	addi	sp,sp,-64
    80006530:	02113c23          	sd	ra,56(sp)
    80006534:	02813823          	sd	s0,48(sp)
    80006538:	02913423          	sd	s1,40(sp)
    8000653c:	03213023          	sd	s2,32(sp)
    80006540:	01313c23          	sd	s3,24(sp)
    80006544:	04010413          	addi	s0,sp,64
    80006548:	00050493          	mv	s1,a0
    8000654c:	00058913          	mv	s2,a1
    80006550:	00060993          	mv	s3,a2
    LOCK();
    80006554:	00100613          	li	a2,1
    80006558:	00000593          	li	a1,0
    8000655c:	00007517          	auipc	a0,0x7
    80006560:	d6450513          	addi	a0,a0,-668 # 8000d2c0 <lockPrint>
    80006564:	ffffb097          	auipc	ra,0xffffb
    80006568:	bc0080e7          	jalr	-1088(ra) # 80001124 <copy_and_swap>
    8000656c:	00050863          	beqz	a0,8000657c <_Z8printIntiii+0x50>
    80006570:	ffffb097          	auipc	ra,0xffffb
    80006574:	f50080e7          	jalr	-176(ra) # 800014c0 <_Z15thread_dispatchv>
    80006578:	fddff06f          	j	80006554 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    8000657c:	00098463          	beqz	s3,80006584 <_Z8printIntiii+0x58>
    80006580:	0804c463          	bltz	s1,80006608 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80006584:	0004851b          	sext.w	a0,s1
    neg = 0;
    80006588:	00000593          	li	a1,0
    }

    i = 0;
    8000658c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80006590:	0009079b          	sext.w	a5,s2
    80006594:	0325773b          	remuw	a4,a0,s2
    80006598:	00048613          	mv	a2,s1
    8000659c:	0014849b          	addiw	s1,s1,1
    800065a0:	02071693          	slli	a3,a4,0x20
    800065a4:	0206d693          	srli	a3,a3,0x20
    800065a8:	00007717          	auipc	a4,0x7
    800065ac:	a8870713          	addi	a4,a4,-1400 # 8000d030 <digits>
    800065b0:	00d70733          	add	a4,a4,a3
    800065b4:	00074683          	lbu	a3,0(a4)
    800065b8:	fd040713          	addi	a4,s0,-48
    800065bc:	00c70733          	add	a4,a4,a2
    800065c0:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800065c4:	0005071b          	sext.w	a4,a0
    800065c8:	0325553b          	divuw	a0,a0,s2
    800065cc:	fcf772e3          	bgeu	a4,a5,80006590 <_Z8printIntiii+0x64>
    if(neg)
    800065d0:	00058c63          	beqz	a1,800065e8 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    800065d4:	fd040793          	addi	a5,s0,-48
    800065d8:	009784b3          	add	s1,a5,s1
    800065dc:	02d00793          	li	a5,45
    800065e0:	fef48823          	sb	a5,-16(s1)
    800065e4:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800065e8:	fff4849b          	addiw	s1,s1,-1
    800065ec:	0204c463          	bltz	s1,80006614 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    800065f0:	fd040793          	addi	a5,s0,-48
    800065f4:	009787b3          	add	a5,a5,s1
    800065f8:	ff07c503          	lbu	a0,-16(a5)
    800065fc:	ffffb097          	auipc	ra,0xffffb
    80006600:	02c080e7          	jalr	44(ra) # 80001628 <_Z4putcc>
    80006604:	fe5ff06f          	j	800065e8 <_Z8printIntiii+0xbc>
        x = -xx;
    80006608:	4090053b          	negw	a0,s1
        neg = 1;
    8000660c:	00100593          	li	a1,1
        x = -xx;
    80006610:	f7dff06f          	j	8000658c <_Z8printIntiii+0x60>

    UNLOCK();
    80006614:	00000613          	li	a2,0
    80006618:	00100593          	li	a1,1
    8000661c:	00007517          	auipc	a0,0x7
    80006620:	ca450513          	addi	a0,a0,-860 # 8000d2c0 <lockPrint>
    80006624:	ffffb097          	auipc	ra,0xffffb
    80006628:	b00080e7          	jalr	-1280(ra) # 80001124 <copy_and_swap>
    8000662c:	fe0514e3          	bnez	a0,80006614 <_Z8printIntiii+0xe8>
    80006630:	03813083          	ld	ra,56(sp)
    80006634:	03013403          	ld	s0,48(sp)
    80006638:	02813483          	ld	s1,40(sp)
    8000663c:	02013903          	ld	s2,32(sp)
    80006640:	01813983          	ld	s3,24(sp)
    80006644:	04010113          	addi	sp,sp,64
    80006648:	00008067          	ret

000000008000664c <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    8000664c:	fd010113          	addi	sp,sp,-48
    80006650:	02113423          	sd	ra,40(sp)
    80006654:	02813023          	sd	s0,32(sp)
    80006658:	00913c23          	sd	s1,24(sp)
    8000665c:	01213823          	sd	s2,16(sp)
    80006660:	01313423          	sd	s3,8(sp)
    80006664:	03010413          	addi	s0,sp,48
    80006668:	00050493          	mv	s1,a0
    8000666c:	00058913          	mv	s2,a1
    80006670:	0015879b          	addiw	a5,a1,1
    80006674:	0007851b          	sext.w	a0,a5
    80006678:	00f4a023          	sw	a5,0(s1)
    8000667c:	0004a823          	sw	zero,16(s1)
    80006680:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006684:	00251513          	slli	a0,a0,0x2
    80006688:	ffffb097          	auipc	ra,0xffffb
    8000668c:	d0c080e7          	jalr	-756(ra) # 80001394 <_Z9mem_allocm>
    80006690:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006694:	01000513          	li	a0,16
    80006698:	ffffd097          	auipc	ra,0xffffd
    8000669c:	a6c080e7          	jalr	-1428(ra) # 80003104 <_Znwm>
    800066a0:	00050993          	mv	s3,a0
    800066a4:	00000593          	li	a1,0
    800066a8:	ffffd097          	auipc	ra,0xffffd
    800066ac:	dc8080e7          	jalr	-568(ra) # 80003470 <_ZN9SemaphoreC1Ej>
    800066b0:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800066b4:	01000513          	li	a0,16
    800066b8:	ffffd097          	auipc	ra,0xffffd
    800066bc:	a4c080e7          	jalr	-1460(ra) # 80003104 <_Znwm>
    800066c0:	00050993          	mv	s3,a0
    800066c4:	00090593          	mv	a1,s2
    800066c8:	ffffd097          	auipc	ra,0xffffd
    800066cc:	da8080e7          	jalr	-600(ra) # 80003470 <_ZN9SemaphoreC1Ej>
    800066d0:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800066d4:	01000513          	li	a0,16
    800066d8:	ffffd097          	auipc	ra,0xffffd
    800066dc:	a2c080e7          	jalr	-1492(ra) # 80003104 <_Znwm>
    800066e0:	00050913          	mv	s2,a0
    800066e4:	00100593          	li	a1,1
    800066e8:	ffffd097          	auipc	ra,0xffffd
    800066ec:	d88080e7          	jalr	-632(ra) # 80003470 <_ZN9SemaphoreC1Ej>
    800066f0:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800066f4:	01000513          	li	a0,16
    800066f8:	ffffd097          	auipc	ra,0xffffd
    800066fc:	a0c080e7          	jalr	-1524(ra) # 80003104 <_Znwm>
    80006700:	00050913          	mv	s2,a0
    80006704:	00100593          	li	a1,1
    80006708:	ffffd097          	auipc	ra,0xffffd
    8000670c:	d68080e7          	jalr	-664(ra) # 80003470 <_ZN9SemaphoreC1Ej>
    80006710:	0324b823          	sd	s2,48(s1)
}
    80006714:	02813083          	ld	ra,40(sp)
    80006718:	02013403          	ld	s0,32(sp)
    8000671c:	01813483          	ld	s1,24(sp)
    80006720:	01013903          	ld	s2,16(sp)
    80006724:	00813983          	ld	s3,8(sp)
    80006728:	03010113          	addi	sp,sp,48
    8000672c:	00008067          	ret
    80006730:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006734:	00098513          	mv	a0,s3
    80006738:	ffffd097          	auipc	ra,0xffffd
    8000673c:	a1c080e7          	jalr	-1508(ra) # 80003154 <_ZdlPv>
    80006740:	00048513          	mv	a0,s1
    80006744:	00008097          	auipc	ra,0x8
    80006748:	c74080e7          	jalr	-908(ra) # 8000e3b8 <_Unwind_Resume>
    8000674c:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006750:	00098513          	mv	a0,s3
    80006754:	ffffd097          	auipc	ra,0xffffd
    80006758:	a00080e7          	jalr	-1536(ra) # 80003154 <_ZdlPv>
    8000675c:	00048513          	mv	a0,s1
    80006760:	00008097          	auipc	ra,0x8
    80006764:	c58080e7          	jalr	-936(ra) # 8000e3b8 <_Unwind_Resume>
    80006768:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    8000676c:	00090513          	mv	a0,s2
    80006770:	ffffd097          	auipc	ra,0xffffd
    80006774:	9e4080e7          	jalr	-1564(ra) # 80003154 <_ZdlPv>
    80006778:	00048513          	mv	a0,s1
    8000677c:	00008097          	auipc	ra,0x8
    80006780:	c3c080e7          	jalr	-964(ra) # 8000e3b8 <_Unwind_Resume>
    80006784:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006788:	00090513          	mv	a0,s2
    8000678c:	ffffd097          	auipc	ra,0xffffd
    80006790:	9c8080e7          	jalr	-1592(ra) # 80003154 <_ZdlPv>
    80006794:	00048513          	mv	a0,s1
    80006798:	00008097          	auipc	ra,0x8
    8000679c:	c20080e7          	jalr	-992(ra) # 8000e3b8 <_Unwind_Resume>

00000000800067a0 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800067a0:	fe010113          	addi	sp,sp,-32
    800067a4:	00113c23          	sd	ra,24(sp)
    800067a8:	00813823          	sd	s0,16(sp)
    800067ac:	00913423          	sd	s1,8(sp)
    800067b0:	01213023          	sd	s2,0(sp)
    800067b4:	02010413          	addi	s0,sp,32
    800067b8:	00050493          	mv	s1,a0
    800067bc:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800067c0:	01853503          	ld	a0,24(a0)
    800067c4:	ffffd097          	auipc	ra,0xffffd
    800067c8:	ce4080e7          	jalr	-796(ra) # 800034a8 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800067cc:	0304b503          	ld	a0,48(s1)
    800067d0:	ffffd097          	auipc	ra,0xffffd
    800067d4:	cd8080e7          	jalr	-808(ra) # 800034a8 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800067d8:	0084b783          	ld	a5,8(s1)
    800067dc:	0144a703          	lw	a4,20(s1)
    800067e0:	00271713          	slli	a4,a4,0x2
    800067e4:	00e787b3          	add	a5,a5,a4
    800067e8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800067ec:	0144a783          	lw	a5,20(s1)
    800067f0:	0017879b          	addiw	a5,a5,1
    800067f4:	0004a703          	lw	a4,0(s1)
    800067f8:	02e7e7bb          	remw	a5,a5,a4
    800067fc:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006800:	0304b503          	ld	a0,48(s1)
    80006804:	ffffd097          	auipc	ra,0xffffd
    80006808:	cd0080e7          	jalr	-816(ra) # 800034d4 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    8000680c:	0204b503          	ld	a0,32(s1)
    80006810:	ffffd097          	auipc	ra,0xffffd
    80006814:	cc4080e7          	jalr	-828(ra) # 800034d4 <_ZN9Semaphore6signalEv>

}
    80006818:	01813083          	ld	ra,24(sp)
    8000681c:	01013403          	ld	s0,16(sp)
    80006820:	00813483          	ld	s1,8(sp)
    80006824:	00013903          	ld	s2,0(sp)
    80006828:	02010113          	addi	sp,sp,32
    8000682c:	00008067          	ret

0000000080006830 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006830:	fe010113          	addi	sp,sp,-32
    80006834:	00113c23          	sd	ra,24(sp)
    80006838:	00813823          	sd	s0,16(sp)
    8000683c:	00913423          	sd	s1,8(sp)
    80006840:	01213023          	sd	s2,0(sp)
    80006844:	02010413          	addi	s0,sp,32
    80006848:	00050493          	mv	s1,a0
    itemAvailable->wait();
    8000684c:	02053503          	ld	a0,32(a0)
    80006850:	ffffd097          	auipc	ra,0xffffd
    80006854:	c58080e7          	jalr	-936(ra) # 800034a8 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006858:	0284b503          	ld	a0,40(s1)
    8000685c:	ffffd097          	auipc	ra,0xffffd
    80006860:	c4c080e7          	jalr	-948(ra) # 800034a8 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80006864:	0084b703          	ld	a4,8(s1)
    80006868:	0104a783          	lw	a5,16(s1)
    8000686c:	00279693          	slli	a3,a5,0x2
    80006870:	00d70733          	add	a4,a4,a3
    80006874:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006878:	0017879b          	addiw	a5,a5,1
    8000687c:	0004a703          	lw	a4,0(s1)
    80006880:	02e7e7bb          	remw	a5,a5,a4
    80006884:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006888:	0284b503          	ld	a0,40(s1)
    8000688c:	ffffd097          	auipc	ra,0xffffd
    80006890:	c48080e7          	jalr	-952(ra) # 800034d4 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006894:	0184b503          	ld	a0,24(s1)
    80006898:	ffffd097          	auipc	ra,0xffffd
    8000689c:	c3c080e7          	jalr	-964(ra) # 800034d4 <_ZN9Semaphore6signalEv>

    return ret;
}
    800068a0:	00090513          	mv	a0,s2
    800068a4:	01813083          	ld	ra,24(sp)
    800068a8:	01013403          	ld	s0,16(sp)
    800068ac:	00813483          	ld	s1,8(sp)
    800068b0:	00013903          	ld	s2,0(sp)
    800068b4:	02010113          	addi	sp,sp,32
    800068b8:	00008067          	ret

00000000800068bc <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800068bc:	fe010113          	addi	sp,sp,-32
    800068c0:	00113c23          	sd	ra,24(sp)
    800068c4:	00813823          	sd	s0,16(sp)
    800068c8:	00913423          	sd	s1,8(sp)
    800068cc:	01213023          	sd	s2,0(sp)
    800068d0:	02010413          	addi	s0,sp,32
    800068d4:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800068d8:	02853503          	ld	a0,40(a0)
    800068dc:	ffffd097          	auipc	ra,0xffffd
    800068e0:	bcc080e7          	jalr	-1076(ra) # 800034a8 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800068e4:	0304b503          	ld	a0,48(s1)
    800068e8:	ffffd097          	auipc	ra,0xffffd
    800068ec:	bc0080e7          	jalr	-1088(ra) # 800034a8 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800068f0:	0144a783          	lw	a5,20(s1)
    800068f4:	0104a903          	lw	s2,16(s1)
    800068f8:	0327ce63          	blt	a5,s2,80006934 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    800068fc:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006900:	0304b503          	ld	a0,48(s1)
    80006904:	ffffd097          	auipc	ra,0xffffd
    80006908:	bd0080e7          	jalr	-1072(ra) # 800034d4 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    8000690c:	0284b503          	ld	a0,40(s1)
    80006910:	ffffd097          	auipc	ra,0xffffd
    80006914:	bc4080e7          	jalr	-1084(ra) # 800034d4 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006918:	00090513          	mv	a0,s2
    8000691c:	01813083          	ld	ra,24(sp)
    80006920:	01013403          	ld	s0,16(sp)
    80006924:	00813483          	ld	s1,8(sp)
    80006928:	00013903          	ld	s2,0(sp)
    8000692c:	02010113          	addi	sp,sp,32
    80006930:	00008067          	ret
        ret = cap - head + tail;
    80006934:	0004a703          	lw	a4,0(s1)
    80006938:	4127093b          	subw	s2,a4,s2
    8000693c:	00f9093b          	addw	s2,s2,a5
    80006940:	fc1ff06f          	j	80006900 <_ZN9BufferCPP6getCntEv+0x44>

0000000080006944 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006944:	fe010113          	addi	sp,sp,-32
    80006948:	00113c23          	sd	ra,24(sp)
    8000694c:	00813823          	sd	s0,16(sp)
    80006950:	00913423          	sd	s1,8(sp)
    80006954:	02010413          	addi	s0,sp,32
    80006958:	00050493          	mv	s1,a0
    Console::putc('\n');
    8000695c:	00a00513          	li	a0,10
    80006960:	ffffd097          	auipc	ra,0xffffd
    80006964:	c38080e7          	jalr	-968(ra) # 80003598 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006968:	00004517          	auipc	a0,0x4
    8000696c:	ba050513          	addi	a0,a0,-1120 # 8000a508 <CONSOLE_STATUS+0x4f8>
    80006970:	00000097          	auipc	ra,0x0
    80006974:	a0c080e7          	jalr	-1524(ra) # 8000637c <_Z11printStringPKc>
    while (getCnt()) {
    80006978:	00048513          	mv	a0,s1
    8000697c:	00000097          	auipc	ra,0x0
    80006980:	f40080e7          	jalr	-192(ra) # 800068bc <_ZN9BufferCPP6getCntEv>
    80006984:	02050c63          	beqz	a0,800069bc <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006988:	0084b783          	ld	a5,8(s1)
    8000698c:	0104a703          	lw	a4,16(s1)
    80006990:	00271713          	slli	a4,a4,0x2
    80006994:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006998:	0007c503          	lbu	a0,0(a5)
    8000699c:	ffffd097          	auipc	ra,0xffffd
    800069a0:	bfc080e7          	jalr	-1028(ra) # 80003598 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800069a4:	0104a783          	lw	a5,16(s1)
    800069a8:	0017879b          	addiw	a5,a5,1
    800069ac:	0004a703          	lw	a4,0(s1)
    800069b0:	02e7e7bb          	remw	a5,a5,a4
    800069b4:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800069b8:	fc1ff06f          	j	80006978 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800069bc:	02100513          	li	a0,33
    800069c0:	ffffd097          	auipc	ra,0xffffd
    800069c4:	bd8080e7          	jalr	-1064(ra) # 80003598 <_ZN7Console4putcEc>
    Console::putc('\n');
    800069c8:	00a00513          	li	a0,10
    800069cc:	ffffd097          	auipc	ra,0xffffd
    800069d0:	bcc080e7          	jalr	-1076(ra) # 80003598 <_ZN7Console4putcEc>
    mem_free(buffer);
    800069d4:	0084b503          	ld	a0,8(s1)
    800069d8:	ffffb097          	auipc	ra,0xffffb
    800069dc:	9fc080e7          	jalr	-1540(ra) # 800013d4 <_Z8mem_freePv>
    delete itemAvailable;
    800069e0:	0204b503          	ld	a0,32(s1)
    800069e4:	00050863          	beqz	a0,800069f4 <_ZN9BufferCPPD1Ev+0xb0>
    800069e8:	00053783          	ld	a5,0(a0)
    800069ec:	0087b783          	ld	a5,8(a5)
    800069f0:	000780e7          	jalr	a5
    delete spaceAvailable;
    800069f4:	0184b503          	ld	a0,24(s1)
    800069f8:	00050863          	beqz	a0,80006a08 <_ZN9BufferCPPD1Ev+0xc4>
    800069fc:	00053783          	ld	a5,0(a0)
    80006a00:	0087b783          	ld	a5,8(a5)
    80006a04:	000780e7          	jalr	a5
    delete mutexTail;
    80006a08:	0304b503          	ld	a0,48(s1)
    80006a0c:	00050863          	beqz	a0,80006a1c <_ZN9BufferCPPD1Ev+0xd8>
    80006a10:	00053783          	ld	a5,0(a0)
    80006a14:	0087b783          	ld	a5,8(a5)
    80006a18:	000780e7          	jalr	a5
    delete mutexHead;
    80006a1c:	0284b503          	ld	a0,40(s1)
    80006a20:	00050863          	beqz	a0,80006a30 <_ZN9BufferCPPD1Ev+0xec>
    80006a24:	00053783          	ld	a5,0(a0)
    80006a28:	0087b783          	ld	a5,8(a5)
    80006a2c:	000780e7          	jalr	a5
}
    80006a30:	01813083          	ld	ra,24(sp)
    80006a34:	01013403          	ld	s0,16(sp)
    80006a38:	00813483          	ld	s1,8(sp)
    80006a3c:	02010113          	addi	sp,sp,32
    80006a40:	00008067          	ret

0000000080006a44 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80006a44:	fe010113          	addi	sp,sp,-32
    80006a48:	00113c23          	sd	ra,24(sp)
    80006a4c:	00813823          	sd	s0,16(sp)
    80006a50:	00913423          	sd	s1,8(sp)
    80006a54:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80006a58:	00004517          	auipc	a0,0x4
    80006a5c:	ac850513          	addi	a0,a0,-1336 # 8000a520 <CONSOLE_STATUS+0x510>
    80006a60:	00000097          	auipc	ra,0x0
    80006a64:	91c080e7          	jalr	-1764(ra) # 8000637c <_Z11printStringPKc>
    int test = getc() - '0';
    80006a68:	ffffb097          	auipc	ra,0xffffb
    80006a6c:	b98080e7          	jalr	-1128(ra) # 80001600 <_Z4getcv>
    80006a70:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80006a74:	ffffb097          	auipc	ra,0xffffb
    80006a78:	b8c080e7          	jalr	-1140(ra) # 80001600 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006a7c:	00700793          	li	a5,7
    80006a80:	1097e263          	bltu	a5,s1,80006b84 <_Z8userMainv+0x140>
    80006a84:	00249493          	slli	s1,s1,0x2
    80006a88:	00004717          	auipc	a4,0x4
    80006a8c:	cf070713          	addi	a4,a4,-784 # 8000a778 <CONSOLE_STATUS+0x768>
    80006a90:	00e484b3          	add	s1,s1,a4
    80006a94:	0004a783          	lw	a5,0(s1)
    80006a98:	00e787b3          	add	a5,a5,a4
    80006a9c:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80006aa0:	fffff097          	auipc	ra,0xfffff
    80006aa4:	f54080e7          	jalr	-172(ra) # 800059f4 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006aa8:	00004517          	auipc	a0,0x4
    80006aac:	a9850513          	addi	a0,a0,-1384 # 8000a540 <CONSOLE_STATUS+0x530>
    80006ab0:	00000097          	auipc	ra,0x0
    80006ab4:	8cc080e7          	jalr	-1844(ra) # 8000637c <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006ab8:	01813083          	ld	ra,24(sp)
    80006abc:	01013403          	ld	s0,16(sp)
    80006ac0:	00813483          	ld	s1,8(sp)
    80006ac4:	02010113          	addi	sp,sp,32
    80006ac8:	00008067          	ret
            Threads_CPP_API_test();
    80006acc:	ffffe097          	auipc	ra,0xffffe
    80006ad0:	e08080e7          	jalr	-504(ra) # 800048d4 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006ad4:	00004517          	auipc	a0,0x4
    80006ad8:	aac50513          	addi	a0,a0,-1364 # 8000a580 <CONSOLE_STATUS+0x570>
    80006adc:	00000097          	auipc	ra,0x0
    80006ae0:	8a0080e7          	jalr	-1888(ra) # 8000637c <_Z11printStringPKc>
            break;
    80006ae4:	fd5ff06f          	j	80006ab8 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006ae8:	ffffd097          	auipc	ra,0xffffd
    80006aec:	640080e7          	jalr	1600(ra) # 80004128 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006af0:	00004517          	auipc	a0,0x4
    80006af4:	ad050513          	addi	a0,a0,-1328 # 8000a5c0 <CONSOLE_STATUS+0x5b0>
    80006af8:	00000097          	auipc	ra,0x0
    80006afc:	884080e7          	jalr	-1916(ra) # 8000637c <_Z11printStringPKc>
            break;
    80006b00:	fb9ff06f          	j	80006ab8 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006b04:	fffff097          	auipc	ra,0xfffff
    80006b08:	234080e7          	jalr	564(ra) # 80005d38 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006b0c:	00004517          	auipc	a0,0x4
    80006b10:	b0450513          	addi	a0,a0,-1276 # 8000a610 <CONSOLE_STATUS+0x600>
    80006b14:	00000097          	auipc	ra,0x0
    80006b18:	868080e7          	jalr	-1944(ra) # 8000637c <_Z11printStringPKc>
            break;
    80006b1c:	f9dff06f          	j	80006ab8 <_Z8userMainv+0x74>
            testSleeping();
    80006b20:	00000097          	auipc	ra,0x0
    80006b24:	11c080e7          	jalr	284(ra) # 80006c3c <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006b28:	00004517          	auipc	a0,0x4
    80006b2c:	b4050513          	addi	a0,a0,-1216 # 8000a668 <CONSOLE_STATUS+0x658>
    80006b30:	00000097          	auipc	ra,0x0
    80006b34:	84c080e7          	jalr	-1972(ra) # 8000637c <_Z11printStringPKc>
            break;
    80006b38:	f81ff06f          	j	80006ab8 <_Z8userMainv+0x74>
            testConsumerProducer();
    80006b3c:	ffffe097          	auipc	ra,0xffffe
    80006b40:	258080e7          	jalr	600(ra) # 80004d94 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006b44:	00004517          	auipc	a0,0x4
    80006b48:	b5450513          	addi	a0,a0,-1196 # 8000a698 <CONSOLE_STATUS+0x688>
    80006b4c:	00000097          	auipc	ra,0x0
    80006b50:	830080e7          	jalr	-2000(ra) # 8000637c <_Z11printStringPKc>
            break;
    80006b54:	f65ff06f          	j	80006ab8 <_Z8userMainv+0x74>
            System_Mode_test();
    80006b58:	00000097          	auipc	ra,0x0
    80006b5c:	658080e7          	jalr	1624(ra) # 800071b0 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006b60:	00004517          	auipc	a0,0x4
    80006b64:	b7850513          	addi	a0,a0,-1160 # 8000a6d8 <CONSOLE_STATUS+0x6c8>
    80006b68:	00000097          	auipc	ra,0x0
    80006b6c:	814080e7          	jalr	-2028(ra) # 8000637c <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006b70:	00004517          	auipc	a0,0x4
    80006b74:	b8850513          	addi	a0,a0,-1144 # 8000a6f8 <CONSOLE_STATUS+0x6e8>
    80006b78:	00000097          	auipc	ra,0x0
    80006b7c:	804080e7          	jalr	-2044(ra) # 8000637c <_Z11printStringPKc>
            break;
    80006b80:	f39ff06f          	j	80006ab8 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80006b84:	00004517          	auipc	a0,0x4
    80006b88:	bcc50513          	addi	a0,a0,-1076 # 8000a750 <CONSOLE_STATUS+0x740>
    80006b8c:	fffff097          	auipc	ra,0xfffff
    80006b90:	7f0080e7          	jalr	2032(ra) # 8000637c <_Z11printStringPKc>
    80006b94:	f25ff06f          	j	80006ab8 <_Z8userMainv+0x74>

0000000080006b98 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006b98:	fe010113          	addi	sp,sp,-32
    80006b9c:	00113c23          	sd	ra,24(sp)
    80006ba0:	00813823          	sd	s0,16(sp)
    80006ba4:	00913423          	sd	s1,8(sp)
    80006ba8:	01213023          	sd	s2,0(sp)
    80006bac:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006bb0:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006bb4:	00600493          	li	s1,6
    while (--i > 0) {
    80006bb8:	fff4849b          	addiw	s1,s1,-1
    80006bbc:	04905463          	blez	s1,80006c04 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006bc0:	00004517          	auipc	a0,0x4
    80006bc4:	bd850513          	addi	a0,a0,-1064 # 8000a798 <CONSOLE_STATUS+0x788>
    80006bc8:	fffff097          	auipc	ra,0xfffff
    80006bcc:	7b4080e7          	jalr	1972(ra) # 8000637c <_Z11printStringPKc>
        printInt(sleep_time);
    80006bd0:	00000613          	li	a2,0
    80006bd4:	00a00593          	li	a1,10
    80006bd8:	0009051b          	sext.w	a0,s2
    80006bdc:	00000097          	auipc	ra,0x0
    80006be0:	950080e7          	jalr	-1712(ra) # 8000652c <_Z8printIntiii>
        printString(" !\n");
    80006be4:	00004517          	auipc	a0,0x4
    80006be8:	bbc50513          	addi	a0,a0,-1092 # 8000a7a0 <CONSOLE_STATUS+0x790>
    80006bec:	fffff097          	auipc	ra,0xfffff
    80006bf0:	790080e7          	jalr	1936(ra) # 8000637c <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006bf4:	00090513          	mv	a0,s2
    80006bf8:	ffffb097          	auipc	ra,0xffffb
    80006bfc:	910080e7          	jalr	-1776(ra) # 80001508 <_Z10time_sleepm>
    while (--i > 0) {
    80006c00:	fb9ff06f          	j	80006bb8 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006c04:	00a00793          	li	a5,10
    80006c08:	02f95933          	divu	s2,s2,a5
    80006c0c:	fff90913          	addi	s2,s2,-1
    80006c10:	00006797          	auipc	a5,0x6
    80006c14:	6b878793          	addi	a5,a5,1720 # 8000d2c8 <_ZL8finished>
    80006c18:	01278933          	add	s2,a5,s2
    80006c1c:	00100793          	li	a5,1
    80006c20:	00f90023          	sb	a5,0(s2)
}
    80006c24:	01813083          	ld	ra,24(sp)
    80006c28:	01013403          	ld	s0,16(sp)
    80006c2c:	00813483          	ld	s1,8(sp)
    80006c30:	00013903          	ld	s2,0(sp)
    80006c34:	02010113          	addi	sp,sp,32
    80006c38:	00008067          	ret

0000000080006c3c <_Z12testSleepingv>:

void testSleeping() {
    80006c3c:	fc010113          	addi	sp,sp,-64
    80006c40:	02113c23          	sd	ra,56(sp)
    80006c44:	02813823          	sd	s0,48(sp)
    80006c48:	02913423          	sd	s1,40(sp)
    80006c4c:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006c50:	00a00793          	li	a5,10
    80006c54:	fcf43823          	sd	a5,-48(s0)
    80006c58:	01400793          	li	a5,20
    80006c5c:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006c60:	00000493          	li	s1,0
    80006c64:	02c0006f          	j	80006c90 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006c68:	00349793          	slli	a5,s1,0x3
    80006c6c:	fd040613          	addi	a2,s0,-48
    80006c70:	00f60633          	add	a2,a2,a5
    80006c74:	00000597          	auipc	a1,0x0
    80006c78:	f2458593          	addi	a1,a1,-220 # 80006b98 <_ZL9sleepyRunPv>
    80006c7c:	fc040513          	addi	a0,s0,-64
    80006c80:	00f50533          	add	a0,a0,a5
    80006c84:	ffffa097          	auipc	ra,0xffffa
    80006c88:	780080e7          	jalr	1920(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006c8c:	0014849b          	addiw	s1,s1,1
    80006c90:	00100793          	li	a5,1
    80006c94:	fc97dae3          	bge	a5,s1,80006c68 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006c98:	00006797          	auipc	a5,0x6
    80006c9c:	6307c783          	lbu	a5,1584(a5) # 8000d2c8 <_ZL8finished>
    80006ca0:	fe078ce3          	beqz	a5,80006c98 <_Z12testSleepingv+0x5c>
    80006ca4:	00006797          	auipc	a5,0x6
    80006ca8:	6257c783          	lbu	a5,1573(a5) # 8000d2c9 <_ZL8finished+0x1>
    80006cac:	fe0786e3          	beqz	a5,80006c98 <_Z12testSleepingv+0x5c>
}
    80006cb0:	03813083          	ld	ra,56(sp)
    80006cb4:	03013403          	ld	s0,48(sp)
    80006cb8:	02813483          	ld	s1,40(sp)
    80006cbc:	04010113          	addi	sp,sp,64
    80006cc0:	00008067          	ret

0000000080006cc4 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006cc4:	fe010113          	addi	sp,sp,-32
    80006cc8:	00113c23          	sd	ra,24(sp)
    80006ccc:	00813823          	sd	s0,16(sp)
    80006cd0:	00913423          	sd	s1,8(sp)
    80006cd4:	01213023          	sd	s2,0(sp)
    80006cd8:	02010413          	addi	s0,sp,32
    80006cdc:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006ce0:	00100793          	li	a5,1
    80006ce4:	02a7f863          	bgeu	a5,a0,80006d14 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006ce8:	00a00793          	li	a5,10
    80006cec:	02f577b3          	remu	a5,a0,a5
    80006cf0:	02078e63          	beqz	a5,80006d2c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006cf4:	fff48513          	addi	a0,s1,-1
    80006cf8:	00000097          	auipc	ra,0x0
    80006cfc:	fcc080e7          	jalr	-52(ra) # 80006cc4 <_ZL9fibonaccim>
    80006d00:	00050913          	mv	s2,a0
    80006d04:	ffe48513          	addi	a0,s1,-2
    80006d08:	00000097          	auipc	ra,0x0
    80006d0c:	fbc080e7          	jalr	-68(ra) # 80006cc4 <_ZL9fibonaccim>
    80006d10:	00a90533          	add	a0,s2,a0
}
    80006d14:	01813083          	ld	ra,24(sp)
    80006d18:	01013403          	ld	s0,16(sp)
    80006d1c:	00813483          	ld	s1,8(sp)
    80006d20:	00013903          	ld	s2,0(sp)
    80006d24:	02010113          	addi	sp,sp,32
    80006d28:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006d2c:	ffffa097          	auipc	ra,0xffffa
    80006d30:	794080e7          	jalr	1940(ra) # 800014c0 <_Z15thread_dispatchv>
    80006d34:	fc1ff06f          	j	80006cf4 <_ZL9fibonaccim+0x30>

0000000080006d38 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006d38:	fe010113          	addi	sp,sp,-32
    80006d3c:	00113c23          	sd	ra,24(sp)
    80006d40:	00813823          	sd	s0,16(sp)
    80006d44:	00913423          	sd	s1,8(sp)
    80006d48:	01213023          	sd	s2,0(sp)
    80006d4c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006d50:	00a00493          	li	s1,10
    80006d54:	0400006f          	j	80006d94 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006d58:	00003517          	auipc	a0,0x3
    80006d5c:	71850513          	addi	a0,a0,1816 # 8000a470 <CONSOLE_STATUS+0x460>
    80006d60:	fffff097          	auipc	ra,0xfffff
    80006d64:	61c080e7          	jalr	1564(ra) # 8000637c <_Z11printStringPKc>
    80006d68:	00000613          	li	a2,0
    80006d6c:	00a00593          	li	a1,10
    80006d70:	00048513          	mv	a0,s1
    80006d74:	fffff097          	auipc	ra,0xfffff
    80006d78:	7b8080e7          	jalr	1976(ra) # 8000652c <_Z8printIntiii>
    80006d7c:	00004517          	auipc	a0,0x4
    80006d80:	8e450513          	addi	a0,a0,-1820 # 8000a660 <CONSOLE_STATUS+0x650>
    80006d84:	fffff097          	auipc	ra,0xfffff
    80006d88:	5f8080e7          	jalr	1528(ra) # 8000637c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006d8c:	0014849b          	addiw	s1,s1,1
    80006d90:	0ff4f493          	andi	s1,s1,255
    80006d94:	00c00793          	li	a5,12
    80006d98:	fc97f0e3          	bgeu	a5,s1,80006d58 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006d9c:	00003517          	auipc	a0,0x3
    80006da0:	6dc50513          	addi	a0,a0,1756 # 8000a478 <CONSOLE_STATUS+0x468>
    80006da4:	fffff097          	auipc	ra,0xfffff
    80006da8:	5d8080e7          	jalr	1496(ra) # 8000637c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006dac:	00500313          	li	t1,5
    thread_dispatch();
    80006db0:	ffffa097          	auipc	ra,0xffffa
    80006db4:	710080e7          	jalr	1808(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006db8:	01000513          	li	a0,16
    80006dbc:	00000097          	auipc	ra,0x0
    80006dc0:	f08080e7          	jalr	-248(ra) # 80006cc4 <_ZL9fibonaccim>
    80006dc4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006dc8:	00003517          	auipc	a0,0x3
    80006dcc:	6c050513          	addi	a0,a0,1728 # 8000a488 <CONSOLE_STATUS+0x478>
    80006dd0:	fffff097          	auipc	ra,0xfffff
    80006dd4:	5ac080e7          	jalr	1452(ra) # 8000637c <_Z11printStringPKc>
    80006dd8:	00000613          	li	a2,0
    80006ddc:	00a00593          	li	a1,10
    80006de0:	0009051b          	sext.w	a0,s2
    80006de4:	fffff097          	auipc	ra,0xfffff
    80006de8:	748080e7          	jalr	1864(ra) # 8000652c <_Z8printIntiii>
    80006dec:	00004517          	auipc	a0,0x4
    80006df0:	87450513          	addi	a0,a0,-1932 # 8000a660 <CONSOLE_STATUS+0x650>
    80006df4:	fffff097          	auipc	ra,0xfffff
    80006df8:	588080e7          	jalr	1416(ra) # 8000637c <_Z11printStringPKc>
    80006dfc:	0400006f          	j	80006e3c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006e00:	00003517          	auipc	a0,0x3
    80006e04:	67050513          	addi	a0,a0,1648 # 8000a470 <CONSOLE_STATUS+0x460>
    80006e08:	fffff097          	auipc	ra,0xfffff
    80006e0c:	574080e7          	jalr	1396(ra) # 8000637c <_Z11printStringPKc>
    80006e10:	00000613          	li	a2,0
    80006e14:	00a00593          	li	a1,10
    80006e18:	00048513          	mv	a0,s1
    80006e1c:	fffff097          	auipc	ra,0xfffff
    80006e20:	710080e7          	jalr	1808(ra) # 8000652c <_Z8printIntiii>
    80006e24:	00004517          	auipc	a0,0x4
    80006e28:	83c50513          	addi	a0,a0,-1988 # 8000a660 <CONSOLE_STATUS+0x650>
    80006e2c:	fffff097          	auipc	ra,0xfffff
    80006e30:	550080e7          	jalr	1360(ra) # 8000637c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006e34:	0014849b          	addiw	s1,s1,1
    80006e38:	0ff4f493          	andi	s1,s1,255
    80006e3c:	00f00793          	li	a5,15
    80006e40:	fc97f0e3          	bgeu	a5,s1,80006e00 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006e44:	00003517          	auipc	a0,0x3
    80006e48:	65450513          	addi	a0,a0,1620 # 8000a498 <CONSOLE_STATUS+0x488>
    80006e4c:	fffff097          	auipc	ra,0xfffff
    80006e50:	530080e7          	jalr	1328(ra) # 8000637c <_Z11printStringPKc>
    finishedD = true;
    80006e54:	00100793          	li	a5,1
    80006e58:	00006717          	auipc	a4,0x6
    80006e5c:	46f70923          	sb	a5,1138(a4) # 8000d2ca <_ZL9finishedD>
    thread_dispatch();
    80006e60:	ffffa097          	auipc	ra,0xffffa
    80006e64:	660080e7          	jalr	1632(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80006e68:	01813083          	ld	ra,24(sp)
    80006e6c:	01013403          	ld	s0,16(sp)
    80006e70:	00813483          	ld	s1,8(sp)
    80006e74:	00013903          	ld	s2,0(sp)
    80006e78:	02010113          	addi	sp,sp,32
    80006e7c:	00008067          	ret

0000000080006e80 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006e80:	fe010113          	addi	sp,sp,-32
    80006e84:	00113c23          	sd	ra,24(sp)
    80006e88:	00813823          	sd	s0,16(sp)
    80006e8c:	00913423          	sd	s1,8(sp)
    80006e90:	01213023          	sd	s2,0(sp)
    80006e94:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006e98:	00000493          	li	s1,0
    80006e9c:	0400006f          	j	80006edc <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006ea0:	00003517          	auipc	a0,0x3
    80006ea4:	59050513          	addi	a0,a0,1424 # 8000a430 <CONSOLE_STATUS+0x420>
    80006ea8:	fffff097          	auipc	ra,0xfffff
    80006eac:	4d4080e7          	jalr	1236(ra) # 8000637c <_Z11printStringPKc>
    80006eb0:	00000613          	li	a2,0
    80006eb4:	00a00593          	li	a1,10
    80006eb8:	00048513          	mv	a0,s1
    80006ebc:	fffff097          	auipc	ra,0xfffff
    80006ec0:	670080e7          	jalr	1648(ra) # 8000652c <_Z8printIntiii>
    80006ec4:	00003517          	auipc	a0,0x3
    80006ec8:	79c50513          	addi	a0,a0,1948 # 8000a660 <CONSOLE_STATUS+0x650>
    80006ecc:	fffff097          	auipc	ra,0xfffff
    80006ed0:	4b0080e7          	jalr	1200(ra) # 8000637c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006ed4:	0014849b          	addiw	s1,s1,1
    80006ed8:	0ff4f493          	andi	s1,s1,255
    80006edc:	00200793          	li	a5,2
    80006ee0:	fc97f0e3          	bgeu	a5,s1,80006ea0 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006ee4:	00003517          	auipc	a0,0x3
    80006ee8:	55450513          	addi	a0,a0,1364 # 8000a438 <CONSOLE_STATUS+0x428>
    80006eec:	fffff097          	auipc	ra,0xfffff
    80006ef0:	490080e7          	jalr	1168(ra) # 8000637c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006ef4:	00700313          	li	t1,7
    thread_dispatch();
    80006ef8:	ffffa097          	auipc	ra,0xffffa
    80006efc:	5c8080e7          	jalr	1480(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006f00:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006f04:	00003517          	auipc	a0,0x3
    80006f08:	54450513          	addi	a0,a0,1348 # 8000a448 <CONSOLE_STATUS+0x438>
    80006f0c:	fffff097          	auipc	ra,0xfffff
    80006f10:	470080e7          	jalr	1136(ra) # 8000637c <_Z11printStringPKc>
    80006f14:	00000613          	li	a2,0
    80006f18:	00a00593          	li	a1,10
    80006f1c:	0009051b          	sext.w	a0,s2
    80006f20:	fffff097          	auipc	ra,0xfffff
    80006f24:	60c080e7          	jalr	1548(ra) # 8000652c <_Z8printIntiii>
    80006f28:	00003517          	auipc	a0,0x3
    80006f2c:	73850513          	addi	a0,a0,1848 # 8000a660 <CONSOLE_STATUS+0x650>
    80006f30:	fffff097          	auipc	ra,0xfffff
    80006f34:	44c080e7          	jalr	1100(ra) # 8000637c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006f38:	00c00513          	li	a0,12
    80006f3c:	00000097          	auipc	ra,0x0
    80006f40:	d88080e7          	jalr	-632(ra) # 80006cc4 <_ZL9fibonaccim>
    80006f44:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006f48:	00003517          	auipc	a0,0x3
    80006f4c:	50850513          	addi	a0,a0,1288 # 8000a450 <CONSOLE_STATUS+0x440>
    80006f50:	fffff097          	auipc	ra,0xfffff
    80006f54:	42c080e7          	jalr	1068(ra) # 8000637c <_Z11printStringPKc>
    80006f58:	00000613          	li	a2,0
    80006f5c:	00a00593          	li	a1,10
    80006f60:	0009051b          	sext.w	a0,s2
    80006f64:	fffff097          	auipc	ra,0xfffff
    80006f68:	5c8080e7          	jalr	1480(ra) # 8000652c <_Z8printIntiii>
    80006f6c:	00003517          	auipc	a0,0x3
    80006f70:	6f450513          	addi	a0,a0,1780 # 8000a660 <CONSOLE_STATUS+0x650>
    80006f74:	fffff097          	auipc	ra,0xfffff
    80006f78:	408080e7          	jalr	1032(ra) # 8000637c <_Z11printStringPKc>
    80006f7c:	0400006f          	j	80006fbc <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006f80:	00003517          	auipc	a0,0x3
    80006f84:	4b050513          	addi	a0,a0,1200 # 8000a430 <CONSOLE_STATUS+0x420>
    80006f88:	fffff097          	auipc	ra,0xfffff
    80006f8c:	3f4080e7          	jalr	1012(ra) # 8000637c <_Z11printStringPKc>
    80006f90:	00000613          	li	a2,0
    80006f94:	00a00593          	li	a1,10
    80006f98:	00048513          	mv	a0,s1
    80006f9c:	fffff097          	auipc	ra,0xfffff
    80006fa0:	590080e7          	jalr	1424(ra) # 8000652c <_Z8printIntiii>
    80006fa4:	00003517          	auipc	a0,0x3
    80006fa8:	6bc50513          	addi	a0,a0,1724 # 8000a660 <CONSOLE_STATUS+0x650>
    80006fac:	fffff097          	auipc	ra,0xfffff
    80006fb0:	3d0080e7          	jalr	976(ra) # 8000637c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006fb4:	0014849b          	addiw	s1,s1,1
    80006fb8:	0ff4f493          	andi	s1,s1,255
    80006fbc:	00500793          	li	a5,5
    80006fc0:	fc97f0e3          	bgeu	a5,s1,80006f80 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006fc4:	00003517          	auipc	a0,0x3
    80006fc8:	44450513          	addi	a0,a0,1092 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80006fcc:	fffff097          	auipc	ra,0xfffff
    80006fd0:	3b0080e7          	jalr	944(ra) # 8000637c <_Z11printStringPKc>
    finishedC = true;
    80006fd4:	00100793          	li	a5,1
    80006fd8:	00006717          	auipc	a4,0x6
    80006fdc:	2ef709a3          	sb	a5,755(a4) # 8000d2cb <_ZL9finishedC>
    thread_dispatch();
    80006fe0:	ffffa097          	auipc	ra,0xffffa
    80006fe4:	4e0080e7          	jalr	1248(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80006fe8:	01813083          	ld	ra,24(sp)
    80006fec:	01013403          	ld	s0,16(sp)
    80006ff0:	00813483          	ld	s1,8(sp)
    80006ff4:	00013903          	ld	s2,0(sp)
    80006ff8:	02010113          	addi	sp,sp,32
    80006ffc:	00008067          	ret

0000000080007000 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80007000:	fe010113          	addi	sp,sp,-32
    80007004:	00113c23          	sd	ra,24(sp)
    80007008:	00813823          	sd	s0,16(sp)
    8000700c:	00913423          	sd	s1,8(sp)
    80007010:	01213023          	sd	s2,0(sp)
    80007014:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80007018:	00000913          	li	s2,0
    8000701c:	0400006f          	j	8000705c <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80007020:	ffffa097          	auipc	ra,0xffffa
    80007024:	4a0080e7          	jalr	1184(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80007028:	00148493          	addi	s1,s1,1
    8000702c:	000027b7          	lui	a5,0x2
    80007030:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80007034:	0097ee63          	bltu	a5,s1,80007050 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80007038:	00000713          	li	a4,0
    8000703c:	000077b7          	lui	a5,0x7
    80007040:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80007044:	fce7eee3          	bltu	a5,a4,80007020 <_ZL11workerBodyBPv+0x20>
    80007048:	00170713          	addi	a4,a4,1
    8000704c:	ff1ff06f          	j	8000703c <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80007050:	00a00793          	li	a5,10
    80007054:	04f90663          	beq	s2,a5,800070a0 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80007058:	00190913          	addi	s2,s2,1
    8000705c:	00f00793          	li	a5,15
    80007060:	0527e463          	bltu	a5,s2,800070a8 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80007064:	00003517          	auipc	a0,0x3
    80007068:	3b450513          	addi	a0,a0,948 # 8000a418 <CONSOLE_STATUS+0x408>
    8000706c:	fffff097          	auipc	ra,0xfffff
    80007070:	310080e7          	jalr	784(ra) # 8000637c <_Z11printStringPKc>
    80007074:	00000613          	li	a2,0
    80007078:	00a00593          	li	a1,10
    8000707c:	0009051b          	sext.w	a0,s2
    80007080:	fffff097          	auipc	ra,0xfffff
    80007084:	4ac080e7          	jalr	1196(ra) # 8000652c <_Z8printIntiii>
    80007088:	00003517          	auipc	a0,0x3
    8000708c:	5d850513          	addi	a0,a0,1496 # 8000a660 <CONSOLE_STATUS+0x650>
    80007090:	fffff097          	auipc	ra,0xfffff
    80007094:	2ec080e7          	jalr	748(ra) # 8000637c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80007098:	00000493          	li	s1,0
    8000709c:	f91ff06f          	j	8000702c <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800070a0:	14102ff3          	csrr	t6,sepc
    800070a4:	fb5ff06f          	j	80007058 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800070a8:	00003517          	auipc	a0,0x3
    800070ac:	37850513          	addi	a0,a0,888 # 8000a420 <CONSOLE_STATUS+0x410>
    800070b0:	fffff097          	auipc	ra,0xfffff
    800070b4:	2cc080e7          	jalr	716(ra) # 8000637c <_Z11printStringPKc>
    finishedB = true;
    800070b8:	00100793          	li	a5,1
    800070bc:	00006717          	auipc	a4,0x6
    800070c0:	20f70823          	sb	a5,528(a4) # 8000d2cc <_ZL9finishedB>
    thread_dispatch();
    800070c4:	ffffa097          	auipc	ra,0xffffa
    800070c8:	3fc080e7          	jalr	1020(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800070cc:	01813083          	ld	ra,24(sp)
    800070d0:	01013403          	ld	s0,16(sp)
    800070d4:	00813483          	ld	s1,8(sp)
    800070d8:	00013903          	ld	s2,0(sp)
    800070dc:	02010113          	addi	sp,sp,32
    800070e0:	00008067          	ret

00000000800070e4 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800070e4:	fe010113          	addi	sp,sp,-32
    800070e8:	00113c23          	sd	ra,24(sp)
    800070ec:	00813823          	sd	s0,16(sp)
    800070f0:	00913423          	sd	s1,8(sp)
    800070f4:	01213023          	sd	s2,0(sp)
    800070f8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800070fc:	00000913          	li	s2,0
    80007100:	0380006f          	j	80007138 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80007104:	ffffa097          	auipc	ra,0xffffa
    80007108:	3bc080e7          	jalr	956(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000710c:	00148493          	addi	s1,s1,1
    80007110:	000027b7          	lui	a5,0x2
    80007114:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80007118:	0097ee63          	bltu	a5,s1,80007134 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000711c:	00000713          	li	a4,0
    80007120:	000077b7          	lui	a5,0x7
    80007124:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80007128:	fce7eee3          	bltu	a5,a4,80007104 <_ZL11workerBodyAPv+0x20>
    8000712c:	00170713          	addi	a4,a4,1
    80007130:	ff1ff06f          	j	80007120 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80007134:	00190913          	addi	s2,s2,1
    80007138:	00900793          	li	a5,9
    8000713c:	0527e063          	bltu	a5,s2,8000717c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80007140:	00003517          	auipc	a0,0x3
    80007144:	2c050513          	addi	a0,a0,704 # 8000a400 <CONSOLE_STATUS+0x3f0>
    80007148:	fffff097          	auipc	ra,0xfffff
    8000714c:	234080e7          	jalr	564(ra) # 8000637c <_Z11printStringPKc>
    80007150:	00000613          	li	a2,0
    80007154:	00a00593          	li	a1,10
    80007158:	0009051b          	sext.w	a0,s2
    8000715c:	fffff097          	auipc	ra,0xfffff
    80007160:	3d0080e7          	jalr	976(ra) # 8000652c <_Z8printIntiii>
    80007164:	00003517          	auipc	a0,0x3
    80007168:	4fc50513          	addi	a0,a0,1276 # 8000a660 <CONSOLE_STATUS+0x650>
    8000716c:	fffff097          	auipc	ra,0xfffff
    80007170:	210080e7          	jalr	528(ra) # 8000637c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80007174:	00000493          	li	s1,0
    80007178:	f99ff06f          	j	80007110 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    8000717c:	00003517          	auipc	a0,0x3
    80007180:	28c50513          	addi	a0,a0,652 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80007184:	fffff097          	auipc	ra,0xfffff
    80007188:	1f8080e7          	jalr	504(ra) # 8000637c <_Z11printStringPKc>
    finishedA = true;
    8000718c:	00100793          	li	a5,1
    80007190:	00006717          	auipc	a4,0x6
    80007194:	12f70ea3          	sb	a5,317(a4) # 8000d2cd <_ZL9finishedA>
}
    80007198:	01813083          	ld	ra,24(sp)
    8000719c:	01013403          	ld	s0,16(sp)
    800071a0:	00813483          	ld	s1,8(sp)
    800071a4:	00013903          	ld	s2,0(sp)
    800071a8:	02010113          	addi	sp,sp,32
    800071ac:	00008067          	ret

00000000800071b0 <_Z16System_Mode_testv>:


void System_Mode_test() {
    800071b0:	fd010113          	addi	sp,sp,-48
    800071b4:	02113423          	sd	ra,40(sp)
    800071b8:	02813023          	sd	s0,32(sp)
    800071bc:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800071c0:	00000613          	li	a2,0
    800071c4:	00000597          	auipc	a1,0x0
    800071c8:	f2058593          	addi	a1,a1,-224 # 800070e4 <_ZL11workerBodyAPv>
    800071cc:	fd040513          	addi	a0,s0,-48
    800071d0:	ffffa097          	auipc	ra,0xffffa
    800071d4:	234080e7          	jalr	564(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800071d8:	00003517          	auipc	a0,0x3
    800071dc:	2d050513          	addi	a0,a0,720 # 8000a4a8 <CONSOLE_STATUS+0x498>
    800071e0:	fffff097          	auipc	ra,0xfffff
    800071e4:	19c080e7          	jalr	412(ra) # 8000637c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800071e8:	00000613          	li	a2,0
    800071ec:	00000597          	auipc	a1,0x0
    800071f0:	e1458593          	addi	a1,a1,-492 # 80007000 <_ZL11workerBodyBPv>
    800071f4:	fd840513          	addi	a0,s0,-40
    800071f8:	ffffa097          	auipc	ra,0xffffa
    800071fc:	20c080e7          	jalr	524(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80007200:	00003517          	auipc	a0,0x3
    80007204:	2c050513          	addi	a0,a0,704 # 8000a4c0 <CONSOLE_STATUS+0x4b0>
    80007208:	fffff097          	auipc	ra,0xfffff
    8000720c:	174080e7          	jalr	372(ra) # 8000637c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80007210:	00000613          	li	a2,0
    80007214:	00000597          	auipc	a1,0x0
    80007218:	c6c58593          	addi	a1,a1,-916 # 80006e80 <_ZL11workerBodyCPv>
    8000721c:	fe040513          	addi	a0,s0,-32
    80007220:	ffffa097          	auipc	ra,0xffffa
    80007224:	1e4080e7          	jalr	484(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80007228:	00003517          	auipc	a0,0x3
    8000722c:	2b050513          	addi	a0,a0,688 # 8000a4d8 <CONSOLE_STATUS+0x4c8>
    80007230:	fffff097          	auipc	ra,0xfffff
    80007234:	14c080e7          	jalr	332(ra) # 8000637c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80007238:	00000613          	li	a2,0
    8000723c:	00000597          	auipc	a1,0x0
    80007240:	afc58593          	addi	a1,a1,-1284 # 80006d38 <_ZL11workerBodyDPv>
    80007244:	fe840513          	addi	a0,s0,-24
    80007248:	ffffa097          	auipc	ra,0xffffa
    8000724c:	1bc080e7          	jalr	444(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80007250:	00003517          	auipc	a0,0x3
    80007254:	2a050513          	addi	a0,a0,672 # 8000a4f0 <CONSOLE_STATUS+0x4e0>
    80007258:	fffff097          	auipc	ra,0xfffff
    8000725c:	124080e7          	jalr	292(ra) # 8000637c <_Z11printStringPKc>
    80007260:	00c0006f          	j	8000726c <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80007264:	ffffa097          	auipc	ra,0xffffa
    80007268:	25c080e7          	jalr	604(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000726c:	00006797          	auipc	a5,0x6
    80007270:	0617c783          	lbu	a5,97(a5) # 8000d2cd <_ZL9finishedA>
    80007274:	fe0788e3          	beqz	a5,80007264 <_Z16System_Mode_testv+0xb4>
    80007278:	00006797          	auipc	a5,0x6
    8000727c:	0547c783          	lbu	a5,84(a5) # 8000d2cc <_ZL9finishedB>
    80007280:	fe0782e3          	beqz	a5,80007264 <_Z16System_Mode_testv+0xb4>
    80007284:	00006797          	auipc	a5,0x6
    80007288:	0477c783          	lbu	a5,71(a5) # 8000d2cb <_ZL9finishedC>
    8000728c:	fc078ce3          	beqz	a5,80007264 <_Z16System_Mode_testv+0xb4>
    80007290:	00006797          	auipc	a5,0x6
    80007294:	03a7c783          	lbu	a5,58(a5) # 8000d2ca <_ZL9finishedD>
    80007298:	fc0786e3          	beqz	a5,80007264 <_Z16System_Mode_testv+0xb4>
    }

}
    8000729c:	02813083          	ld	ra,40(sp)
    800072a0:	02013403          	ld	s0,32(sp)
    800072a4:	03010113          	addi	sp,sp,48
    800072a8:	00008067          	ret

00000000800072ac <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800072ac:	fe010113          	addi	sp,sp,-32
    800072b0:	00113c23          	sd	ra,24(sp)
    800072b4:	00813823          	sd	s0,16(sp)
    800072b8:	00913423          	sd	s1,8(sp)
    800072bc:	01213023          	sd	s2,0(sp)
    800072c0:	02010413          	addi	s0,sp,32
    800072c4:	00050493          	mv	s1,a0
    800072c8:	00058913          	mv	s2,a1
    800072cc:	0015879b          	addiw	a5,a1,1
    800072d0:	0007851b          	sext.w	a0,a5
    800072d4:	00f4a023          	sw	a5,0(s1)
    800072d8:	0004a823          	sw	zero,16(s1)
    800072dc:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800072e0:	00251513          	slli	a0,a0,0x2
    800072e4:	ffffa097          	auipc	ra,0xffffa
    800072e8:	0b0080e7          	jalr	176(ra) # 80001394 <_Z9mem_allocm>
    800072ec:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800072f0:	00000593          	li	a1,0
    800072f4:	02048513          	addi	a0,s1,32
    800072f8:	ffffa097          	auipc	ra,0xffffa
    800072fc:	240080e7          	jalr	576(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80007300:	00090593          	mv	a1,s2
    80007304:	01848513          	addi	a0,s1,24
    80007308:	ffffa097          	auipc	ra,0xffffa
    8000730c:	230080e7          	jalr	560(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80007310:	00100593          	li	a1,1
    80007314:	02848513          	addi	a0,s1,40
    80007318:	ffffa097          	auipc	ra,0xffffa
    8000731c:	220080e7          	jalr	544(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80007320:	00100593          	li	a1,1
    80007324:	03048513          	addi	a0,s1,48
    80007328:	ffffa097          	auipc	ra,0xffffa
    8000732c:	210080e7          	jalr	528(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    80007330:	01813083          	ld	ra,24(sp)
    80007334:	01013403          	ld	s0,16(sp)
    80007338:	00813483          	ld	s1,8(sp)
    8000733c:	00013903          	ld	s2,0(sp)
    80007340:	02010113          	addi	sp,sp,32
    80007344:	00008067          	ret

0000000080007348 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80007348:	fe010113          	addi	sp,sp,-32
    8000734c:	00113c23          	sd	ra,24(sp)
    80007350:	00813823          	sd	s0,16(sp)
    80007354:	00913423          	sd	s1,8(sp)
    80007358:	01213023          	sd	s2,0(sp)
    8000735c:	02010413          	addi	s0,sp,32
    80007360:	00050493          	mv	s1,a0
    80007364:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80007368:	01853503          	ld	a0,24(a0)
    8000736c:	ffffa097          	auipc	ra,0xffffa
    80007370:	234080e7          	jalr	564(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80007374:	0304b503          	ld	a0,48(s1)
    80007378:	ffffa097          	auipc	ra,0xffffa
    8000737c:	228080e7          	jalr	552(ra) # 800015a0 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80007380:	0084b783          	ld	a5,8(s1)
    80007384:	0144a703          	lw	a4,20(s1)
    80007388:	00271713          	slli	a4,a4,0x2
    8000738c:	00e787b3          	add	a5,a5,a4
    80007390:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80007394:	0144a783          	lw	a5,20(s1)
    80007398:	0017879b          	addiw	a5,a5,1
    8000739c:	0004a703          	lw	a4,0(s1)
    800073a0:	02e7e7bb          	remw	a5,a5,a4
    800073a4:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800073a8:	0304b503          	ld	a0,48(s1)
    800073ac:	ffffa097          	auipc	ra,0xffffa
    800073b0:	224080e7          	jalr	548(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    800073b4:	0204b503          	ld	a0,32(s1)
    800073b8:	ffffa097          	auipc	ra,0xffffa
    800073bc:	218080e7          	jalr	536(ra) # 800015d0 <_Z10sem_signalP4KSem>

}
    800073c0:	01813083          	ld	ra,24(sp)
    800073c4:	01013403          	ld	s0,16(sp)
    800073c8:	00813483          	ld	s1,8(sp)
    800073cc:	00013903          	ld	s2,0(sp)
    800073d0:	02010113          	addi	sp,sp,32
    800073d4:	00008067          	ret

00000000800073d8 <_ZN6Buffer3getEv>:

int Buffer::get() {
    800073d8:	fe010113          	addi	sp,sp,-32
    800073dc:	00113c23          	sd	ra,24(sp)
    800073e0:	00813823          	sd	s0,16(sp)
    800073e4:	00913423          	sd	s1,8(sp)
    800073e8:	01213023          	sd	s2,0(sp)
    800073ec:	02010413          	addi	s0,sp,32
    800073f0:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800073f4:	02053503          	ld	a0,32(a0)
    800073f8:	ffffa097          	auipc	ra,0xffffa
    800073fc:	1a8080e7          	jalr	424(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80007400:	0284b503          	ld	a0,40(s1)
    80007404:	ffffa097          	auipc	ra,0xffffa
    80007408:	19c080e7          	jalr	412(ra) # 800015a0 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    8000740c:	0084b703          	ld	a4,8(s1)
    80007410:	0104a783          	lw	a5,16(s1)
    80007414:	00279693          	slli	a3,a5,0x2
    80007418:	00d70733          	add	a4,a4,a3
    8000741c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80007420:	0017879b          	addiw	a5,a5,1
    80007424:	0004a703          	lw	a4,0(s1)
    80007428:	02e7e7bb          	remw	a5,a5,a4
    8000742c:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80007430:	0284b503          	ld	a0,40(s1)
    80007434:	ffffa097          	auipc	ra,0xffffa
    80007438:	19c080e7          	jalr	412(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    8000743c:	0184b503          	ld	a0,24(s1)
    80007440:	ffffa097          	auipc	ra,0xffffa
    80007444:	190080e7          	jalr	400(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    80007448:	00090513          	mv	a0,s2
    8000744c:	01813083          	ld	ra,24(sp)
    80007450:	01013403          	ld	s0,16(sp)
    80007454:	00813483          	ld	s1,8(sp)
    80007458:	00013903          	ld	s2,0(sp)
    8000745c:	02010113          	addi	sp,sp,32
    80007460:	00008067          	ret

0000000080007464 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80007464:	fe010113          	addi	sp,sp,-32
    80007468:	00113c23          	sd	ra,24(sp)
    8000746c:	00813823          	sd	s0,16(sp)
    80007470:	00913423          	sd	s1,8(sp)
    80007474:	01213023          	sd	s2,0(sp)
    80007478:	02010413          	addi	s0,sp,32
    8000747c:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80007480:	02853503          	ld	a0,40(a0)
    80007484:	ffffa097          	auipc	ra,0xffffa
    80007488:	11c080e7          	jalr	284(ra) # 800015a0 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    8000748c:	0304b503          	ld	a0,48(s1)
    80007490:	ffffa097          	auipc	ra,0xffffa
    80007494:	110080e7          	jalr	272(ra) # 800015a0 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80007498:	0144a783          	lw	a5,20(s1)
    8000749c:	0104a903          	lw	s2,16(s1)
    800074a0:	0327ce63          	blt	a5,s2,800074dc <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800074a4:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800074a8:	0304b503          	ld	a0,48(s1)
    800074ac:	ffffa097          	auipc	ra,0xffffa
    800074b0:	124080e7          	jalr	292(ra) # 800015d0 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    800074b4:	0284b503          	ld	a0,40(s1)
    800074b8:	ffffa097          	auipc	ra,0xffffa
    800074bc:	118080e7          	jalr	280(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    800074c0:	00090513          	mv	a0,s2
    800074c4:	01813083          	ld	ra,24(sp)
    800074c8:	01013403          	ld	s0,16(sp)
    800074cc:	00813483          	ld	s1,8(sp)
    800074d0:	00013903          	ld	s2,0(sp)
    800074d4:	02010113          	addi	sp,sp,32
    800074d8:	00008067          	ret
        ret = cap - head + tail;
    800074dc:	0004a703          	lw	a4,0(s1)
    800074e0:	4127093b          	subw	s2,a4,s2
    800074e4:	00f9093b          	addw	s2,s2,a5
    800074e8:	fc1ff06f          	j	800074a8 <_ZN6Buffer6getCntEv+0x44>

00000000800074ec <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    800074ec:	fe010113          	addi	sp,sp,-32
    800074f0:	00113c23          	sd	ra,24(sp)
    800074f4:	00813823          	sd	s0,16(sp)
    800074f8:	00913423          	sd	s1,8(sp)
    800074fc:	02010413          	addi	s0,sp,32
    80007500:	00050493          	mv	s1,a0
    putc('\n');
    80007504:	00a00513          	li	a0,10
    80007508:	ffffa097          	auipc	ra,0xffffa
    8000750c:	120080e7          	jalr	288(ra) # 80001628 <_Z4putcc>
    printString("Buffer deleted!\n");
    80007510:	00003517          	auipc	a0,0x3
    80007514:	ff850513          	addi	a0,a0,-8 # 8000a508 <CONSOLE_STATUS+0x4f8>
    80007518:	fffff097          	auipc	ra,0xfffff
    8000751c:	e64080e7          	jalr	-412(ra) # 8000637c <_Z11printStringPKc>
    while (getCnt() > 0) {
    80007520:	00048513          	mv	a0,s1
    80007524:	00000097          	auipc	ra,0x0
    80007528:	f40080e7          	jalr	-192(ra) # 80007464 <_ZN6Buffer6getCntEv>
    8000752c:	02a05c63          	blez	a0,80007564 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80007530:	0084b783          	ld	a5,8(s1)
    80007534:	0104a703          	lw	a4,16(s1)
    80007538:	00271713          	slli	a4,a4,0x2
    8000753c:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80007540:	0007c503          	lbu	a0,0(a5)
    80007544:	ffffa097          	auipc	ra,0xffffa
    80007548:	0e4080e7          	jalr	228(ra) # 80001628 <_Z4putcc>
        head = (head + 1) % cap;
    8000754c:	0104a783          	lw	a5,16(s1)
    80007550:	0017879b          	addiw	a5,a5,1
    80007554:	0004a703          	lw	a4,0(s1)
    80007558:	02e7e7bb          	remw	a5,a5,a4
    8000755c:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80007560:	fc1ff06f          	j	80007520 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80007564:	02100513          	li	a0,33
    80007568:	ffffa097          	auipc	ra,0xffffa
    8000756c:	0c0080e7          	jalr	192(ra) # 80001628 <_Z4putcc>
    putc('\n');
    80007570:	00a00513          	li	a0,10
    80007574:	ffffa097          	auipc	ra,0xffffa
    80007578:	0b4080e7          	jalr	180(ra) # 80001628 <_Z4putcc>
    mem_free(buffer);
    8000757c:	0084b503          	ld	a0,8(s1)
    80007580:	ffffa097          	auipc	ra,0xffffa
    80007584:	e54080e7          	jalr	-428(ra) # 800013d4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80007588:	0204b503          	ld	a0,32(s1)
    8000758c:	ffffa097          	auipc	ra,0xffffa
    80007590:	fe4080e7          	jalr	-28(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80007594:	0184b503          	ld	a0,24(s1)
    80007598:	ffffa097          	auipc	ra,0xffffa
    8000759c:	fd8080e7          	jalr	-40(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    800075a0:	0304b503          	ld	a0,48(s1)
    800075a4:	ffffa097          	auipc	ra,0xffffa
    800075a8:	fcc080e7          	jalr	-52(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    800075ac:	0284b503          	ld	a0,40(s1)
    800075b0:	ffffa097          	auipc	ra,0xffffa
    800075b4:	fc0080e7          	jalr	-64(ra) # 80001570 <_Z9sem_closeP4KSem>
}
    800075b8:	01813083          	ld	ra,24(sp)
    800075bc:	01013403          	ld	s0,16(sp)
    800075c0:	00813483          	ld	s1,8(sp)
    800075c4:	02010113          	addi	sp,sp,32
    800075c8:	00008067          	ret

00000000800075cc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    800075cc:	fa010113          	addi	sp,sp,-96
    800075d0:	04813c23          	sd	s0,88(sp)
    800075d4:	06010413          	addi	s0,sp,96
    800075d8:	faa43423          	sd	a0,-88(s0)
    800075dc:	00058793          	mv	a5,a1
    800075e0:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    800075e4:	fa843783          	ld	a5,-88(s0)
    800075e8:	00079663          	bnez	a5,800075f4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    800075ec:	00000793          	li	a5,0
    800075f0:	2040006f          	j	800077f4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    800075f4:	fa843783          	ld	a5,-88(s0)
    800075f8:	0067d713          	srli	a4,a5,0x6
    800075fc:	fa843783          	ld	a5,-88(s0)
    80007600:	03f7f793          	andi	a5,a5,63
    80007604:	00078663          	beqz	a5,80007610 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80007608:	00100793          	li	a5,1
    8000760c:	0080006f          	j	80007614 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80007610:	00000793          	li	a5,0
    80007614:	00e787b3          	add	a5,a5,a4
    80007618:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    8000761c:	fc843783          	ld	a5,-56(s0)
    80007620:	00679793          	slli	a5,a5,0x6
    80007624:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    80007628:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    8000762c:	00006797          	auipc	a5,0x6
    80007630:	cac78793          	addi	a5,a5,-852 # 8000d2d8 <_ZN15MemoryAllocator11freeMemHeadE>
    80007634:	0007b783          	ld	a5,0(a5)
    80007638:	fef43023          	sd	a5,-32(s0)
    8000763c:	fe043783          	ld	a5,-32(s0)
    80007640:	1a078863          	beqz	a5,800077f0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    80007644:	fe043783          	ld	a5,-32(s0)
    80007648:	0087b783          	ld	a5,8(a5)
    8000764c:	fa843703          	ld	a4,-88(s0)
    80007650:	18e7e263          	bltu	a5,a4,800077d4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    80007654:	fe043703          	ld	a4,-32(s0)
    80007658:	fa843783          	ld	a5,-88(s0)
    8000765c:	00f707b3          	add	a5,a4,a5
    80007660:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    80007664:	fe043783          	ld	a5,-32(s0)
    80007668:	0087b703          	ld	a4,8(a5)
    8000766c:	fa843783          	ld	a5,-88(s0)
    80007670:	40f707b3          	sub	a5,a4,a5
    80007674:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80007678:	fb843703          	ld	a4,-72(s0)
    8000767c:	02000793          	li	a5,32
    80007680:	04e7e463          	bltu	a5,a4,800076c8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    80007684:	fa843703          	ld	a4,-88(s0)
    80007688:	fb843783          	ld	a5,-72(s0)
    8000768c:	00f707b3          	add	a5,a4,a5
    80007690:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    80007694:	fe843783          	ld	a5,-24(s0)
    80007698:	00078c63          	beqz	a5,800076b0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    8000769c:	fe043783          	ld	a5,-32(s0)
    800076a0:	0007b703          	ld	a4,0(a5)
    800076a4:	fe843783          	ld	a5,-24(s0)
    800076a8:	00e7b023          	sd	a4,0(a5)
    800076ac:	0600006f          	j	8000770c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    800076b0:	fe043783          	ld	a5,-32(s0)
    800076b4:	0007b703          	ld	a4,0(a5)
    800076b8:	00006797          	auipc	a5,0x6
    800076bc:	c2078793          	addi	a5,a5,-992 # 8000d2d8 <_ZN15MemoryAllocator11freeMemHeadE>
    800076c0:	00e7b023          	sd	a4,0(a5)
    800076c4:	0480006f          	j	8000770c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    800076c8:	fc043783          	ld	a5,-64(s0)
    800076cc:	fb843703          	ld	a4,-72(s0)
    800076d0:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    800076d4:	fe043783          	ld	a5,-32(s0)
    800076d8:	0007b703          	ld	a4,0(a5)
    800076dc:	fc043783          	ld	a5,-64(s0)
    800076e0:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    800076e4:	fe843783          	ld	a5,-24(s0)
    800076e8:	00078a63          	beqz	a5,800076fc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    800076ec:	fe843783          	ld	a5,-24(s0)
    800076f0:	fc043703          	ld	a4,-64(s0)
    800076f4:	00e7b023          	sd	a4,0(a5)
    800076f8:	0140006f          	j	8000770c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    800076fc:	00006797          	auipc	a5,0x6
    80007700:	bdc78793          	addi	a5,a5,-1060 # 8000d2d8 <_ZN15MemoryAllocator11freeMemHeadE>
    80007704:	fc043703          	ld	a4,-64(s0)
    80007708:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    8000770c:	fe043783          	ld	a5,-32(s0)
    80007710:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    80007714:	fb043783          	ld	a5,-80(s0)
    80007718:	fa843703          	ld	a4,-88(s0)
    8000771c:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    80007720:	fb043783          	ld	a5,-80(s0)
    80007724:	fa442703          	lw	a4,-92(s0)
    80007728:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    8000772c:	fb043783          	ld	a5,-80(s0)
    80007730:	02078713          	addi	a4,a5,32
    80007734:	fb043783          	ld	a5,-80(s0)
    80007738:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    8000773c:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80007740:	00006797          	auipc	a5,0x6
    80007744:	b9078793          	addi	a5,a5,-1136 # 8000d2d0 <_ZN15MemoryAllocator11usedMemHeadE>
    80007748:	0007b783          	ld	a5,0(a5)
    8000774c:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80007750:	fd043783          	ld	a5,-48(s0)
    80007754:	02078463          	beqz	a5,8000777c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    80007758:	fd043703          	ld	a4,-48(s0)
    8000775c:	fb043783          	ld	a5,-80(s0)
    80007760:	00f77e63          	bgeu	a4,a5,8000777c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    80007764:	fd043783          	ld	a5,-48(s0)
    80007768:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    8000776c:	fd043783          	ld	a5,-48(s0)
    80007770:	0007b783          	ld	a5,0(a5)
    80007774:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80007778:	fd9ff06f          	j	80007750 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    8000777c:	fd843783          	ld	a5,-40(s0)
    80007780:	02079663          	bnez	a5,800077ac <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    80007784:	00006797          	auipc	a5,0x6
    80007788:	b4c78793          	addi	a5,a5,-1204 # 8000d2d0 <_ZN15MemoryAllocator11usedMemHeadE>
    8000778c:	0007b703          	ld	a4,0(a5)
    80007790:	fb043783          	ld	a5,-80(s0)
    80007794:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    80007798:	00006797          	auipc	a5,0x6
    8000779c:	b3878793          	addi	a5,a5,-1224 # 8000d2d0 <_ZN15MemoryAllocator11usedMemHeadE>
    800077a0:	fb043703          	ld	a4,-80(s0)
    800077a4:	00e7b023          	sd	a4,0(a5)
    800077a8:	0200006f          	j	800077c8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    800077ac:	fd843783          	ld	a5,-40(s0)
    800077b0:	0007b703          	ld	a4,0(a5)
    800077b4:	fb043783          	ld	a5,-80(s0)
    800077b8:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    800077bc:	fd843783          	ld	a5,-40(s0)
    800077c0:	fb043703          	ld	a4,-80(s0)
    800077c4:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    800077c8:	fb043783          	ld	a5,-80(s0)
    800077cc:	0187b783          	ld	a5,24(a5)
    800077d0:	0240006f          	j	800077f4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    800077d4:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    800077d8:	fe043783          	ld	a5,-32(s0)
    800077dc:	fef43423          	sd	a5,-24(s0)
    800077e0:	fe043783          	ld	a5,-32(s0)
    800077e4:	0007b783          	ld	a5,0(a5)
    800077e8:	fef43023          	sd	a5,-32(s0)
    800077ec:	e51ff06f          	j	8000763c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    800077f0:	00000793          	li	a5,0
}
    800077f4:	00078513          	mv	a0,a5
    800077f8:	05813403          	ld	s0,88(sp)
    800077fc:	06010113          	addi	sp,sp,96
    80007800:	00008067          	ret

0000000080007804 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80007804:	fb010113          	addi	sp,sp,-80
    80007808:	04113423          	sd	ra,72(sp)
    8000780c:	04813023          	sd	s0,64(sp)
    80007810:	05010413          	addi	s0,sp,80
    80007814:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    80007818:	fb843783          	ld	a5,-72(s0)
    8000781c:	00079663          	bnez	a5,80007828 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    80007820:	00000793          	li	a5,0
    80007824:	1740006f          	j	80007998 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    80007828:	00006797          	auipc	a5,0x6
    8000782c:	aa878793          	addi	a5,a5,-1368 # 8000d2d0 <_ZN15MemoryAllocator11usedMemHeadE>
    80007830:	0007b783          	ld	a5,0(a5)
    80007834:	00079663          	bnez	a5,80007840 <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    80007838:	fff00793          	li	a5,-1
    8000783c:	15c0006f          	j	80007998 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80007840:	fb843783          	ld	a5,-72(s0)
    80007844:	fe078793          	addi	a5,a5,-32
    80007848:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    8000784c:	00006797          	auipc	a5,0x6
    80007850:	a8478793          	addi	a5,a5,-1404 # 8000d2d0 <_ZN15MemoryAllocator11usedMemHeadE>
    80007854:	0007b783          	ld	a5,0(a5)
    80007858:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    8000785c:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80007860:	fe843783          	ld	a5,-24(s0)
    80007864:	02078463          	beqz	a5,8000788c <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80007868:	fe843703          	ld	a4,-24(s0)
    8000786c:	fb843783          	ld	a5,-72(s0)
    80007870:	00f70e63          	beq	a4,a5,8000788c <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    80007874:	fe843783          	ld	a5,-24(s0)
    80007878:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    8000787c:	fe843783          	ld	a5,-24(s0)
    80007880:	0007b783          	ld	a5,0(a5)
    80007884:	fef43423          	sd	a5,-24(s0)
    80007888:	fd9ff06f          	j	80007860 <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    8000788c:	fe843703          	ld	a4,-24(s0)
    80007890:	fb843783          	ld	a5,-72(s0)
    80007894:	00f70663          	beq	a4,a5,800078a0 <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80007898:	fff00793          	li	a5,-1
    8000789c:	0fc0006f          	j	80007998 <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    800078a0:	fe043783          	ld	a5,-32(s0)
    800078a4:	00078c63          	beqz	a5,800078bc <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    800078a8:	fe843783          	ld	a5,-24(s0)
    800078ac:	0007b703          	ld	a4,0(a5)
    800078b0:	fe043783          	ld	a5,-32(s0)
    800078b4:	00e7b023          	sd	a4,0(a5)
    800078b8:	0180006f          	j	800078d0 <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    800078bc:	fe843783          	ld	a5,-24(s0)
    800078c0:	0007b703          	ld	a4,0(a5)
    800078c4:	00006797          	auipc	a5,0x6
    800078c8:	a0c78793          	addi	a5,a5,-1524 # 8000d2d0 <_ZN15MemoryAllocator11usedMemHeadE>
    800078cc:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    800078d0:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    800078d4:	00006797          	auipc	a5,0x6
    800078d8:	a0478793          	addi	a5,a5,-1532 # 8000d2d8 <_ZN15MemoryAllocator11freeMemHeadE>
    800078dc:	0007b783          	ld	a5,0(a5)
    800078e0:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    800078e4:	fd043783          	ld	a5,-48(s0)
    800078e8:	02078463          	beqz	a5,80007910 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    800078ec:	fd043703          	ld	a4,-48(s0)
    800078f0:	fb843783          	ld	a5,-72(s0)
    800078f4:	00f77e63          	bgeu	a4,a5,80007910 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    800078f8:	fd043783          	ld	a5,-48(s0)
    800078fc:	fcf43c23          	sd	a5,-40(s0)
    80007900:	fd043783          	ld	a5,-48(s0)
    80007904:	0007b783          	ld	a5,0(a5)
    80007908:	fcf43823          	sd	a5,-48(s0)
    8000790c:	fd9ff06f          	j	800078e4 <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    80007910:	fb843783          	ld	a5,-72(s0)
    80007914:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    80007918:	fb843783          	ld	a5,-72(s0)
    8000791c:	0087b783          	ld	a5,8(a5)
    80007920:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    80007924:	fc843783          	ld	a5,-56(s0)
    80007928:	fc043703          	ld	a4,-64(s0)
    8000792c:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    80007930:	fd843783          	ld	a5,-40(s0)
    80007934:	02078263          	beqz	a5,80007958 <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    80007938:	fd843783          	ld	a5,-40(s0)
    8000793c:	0007b703          	ld	a4,0(a5)
    80007940:	fc843783          	ld	a5,-56(s0)
    80007944:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    80007948:	fd843783          	ld	a5,-40(s0)
    8000794c:	fc843703          	ld	a4,-56(s0)
    80007950:	00e7b023          	sd	a4,0(a5)
    80007954:	0280006f          	j	8000797c <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    80007958:	00006797          	auipc	a5,0x6
    8000795c:	98078793          	addi	a5,a5,-1664 # 8000d2d8 <_ZN15MemoryAllocator11freeMemHeadE>
    80007960:	0007b703          	ld	a4,0(a5)
    80007964:	fc843783          	ld	a5,-56(s0)
    80007968:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    8000796c:	00006797          	auipc	a5,0x6
    80007970:	96c78793          	addi	a5,a5,-1684 # 8000d2d8 <_ZN15MemoryAllocator11freeMemHeadE>
    80007974:	fc843703          	ld	a4,-56(s0)
    80007978:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    8000797c:	fc843503          	ld	a0,-56(s0)
    80007980:	00000097          	auipc	ra,0x0
    80007984:	02c080e7          	jalr	44(ra) # 800079ac <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    80007988:	fd843503          	ld	a0,-40(s0)
    8000798c:	00000097          	auipc	ra,0x0
    80007990:	020080e7          	jalr	32(ra) # 800079ac <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    80007994:	00000793          	li	a5,0
}
    80007998:	00078513          	mv	a0,a5
    8000799c:	04813083          	ld	ra,72(sp)
    800079a0:	04013403          	ld	s0,64(sp)
    800079a4:	05010113          	addi	sp,sp,80
    800079a8:	00008067          	ret

00000000800079ac <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    800079ac:	fc010113          	addi	sp,sp,-64
    800079b0:	02813c23          	sd	s0,56(sp)
    800079b4:	04010413          	addi	s0,sp,64
    800079b8:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    800079bc:	fc843783          	ld	a5,-56(s0)
    800079c0:	00079663          	bnez	a5,800079cc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    800079c4:	00000793          	li	a5,0
    800079c8:	0a00006f          	j	80007a68 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    800079cc:	fc843783          	ld	a5,-56(s0)
    800079d0:	0007b783          	ld	a5,0(a5)
    800079d4:	00f037b3          	snez	a5,a5
    800079d8:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    800079dc:	fc843783          	ld	a5,-56(s0)
    800079e0:	0087b783          	ld	a5,8(a5)
    800079e4:	fc843703          	ld	a4,-56(s0)
    800079e8:	00f707b3          	add	a5,a4,a5
    800079ec:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    800079f0:	fc843783          	ld	a5,-56(s0)
    800079f4:	0007b783          	ld	a5,0(a5)
    800079f8:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    800079fc:	fe043703          	ld	a4,-32(s0)
    80007a00:	fd843783          	ld	a5,-40(s0)
    80007a04:	40f707b3          	sub	a5,a4,a5
    80007a08:	0017b793          	seqz	a5,a5
    80007a0c:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    80007a10:	fef44783          	lbu	a5,-17(s0)
    80007a14:	0ff7f793          	andi	a5,a5,255
    80007a18:	04078663          	beqz	a5,80007a64 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    80007a1c:	fd744783          	lbu	a5,-41(s0)
    80007a20:	0ff7f793          	andi	a5,a5,255
    80007a24:	04078063          	beqz	a5,80007a64 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    80007a28:	fc843783          	ld	a5,-56(s0)
    80007a2c:	0087b703          	ld	a4,8(a5)
    80007a30:	fc843783          	ld	a5,-56(s0)
    80007a34:	0007b783          	ld	a5,0(a5)
    80007a38:	0087b783          	ld	a5,8(a5)
    80007a3c:	00f70733          	add	a4,a4,a5
    80007a40:	fc843783          	ld	a5,-56(s0)
    80007a44:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    80007a48:	fc843783          	ld	a5,-56(s0)
    80007a4c:	0007b783          	ld	a5,0(a5)
    80007a50:	0007b703          	ld	a4,0(a5)
    80007a54:	fc843783          	ld	a5,-56(s0)
    80007a58:	00e7b023          	sd	a4,0(a5)
        return 1;
    80007a5c:	00100793          	li	a5,1
    80007a60:	0080006f          	j	80007a68 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    80007a64:	00000793          	li	a5,0
}
    80007a68:	00078513          	mv	a0,a5
    80007a6c:	03813403          	ld	s0,56(sp)
    80007a70:	04010113          	addi	sp,sp,64
    80007a74:	00008067          	ret

0000000080007a78 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80007a78:	fe010113          	addi	sp,sp,-32
    80007a7c:	00813c23          	sd	s0,24(sp)
    80007a80:	02010413          	addi	s0,sp,32
    80007a84:	fea43423          	sd	a0,-24(s0)
    80007a88:	00058793          	mv	a5,a1
    80007a8c:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80007a90:	fe843783          	ld	a5,-24(s0)
    80007a94:	fe078793          	addi	a5,a5,-32
    80007a98:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    80007a9c:	fe843783          	ld	a5,-24(s0)
    80007aa0:	0107a703          	lw	a4,16(a5)
    80007aa4:	fe442783          	lw	a5,-28(s0)
    80007aa8:	0007879b          	sext.w	a5,a5
    80007aac:	40e787b3          	sub	a5,a5,a4
    80007ab0:	0017b793          	seqz	a5,a5
    80007ab4:	0ff7f793          	andi	a5,a5,255
}
    80007ab8:	00078513          	mv	a0,a5
    80007abc:	01813403          	ld	s0,24(sp)
    80007ac0:	02010113          	addi	sp,sp,32
    80007ac4:	00008067          	ret

0000000080007ac8 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    80007ac8:	ff010113          	addi	sp,sp,-16
    80007acc:	00813423          	sd	s0,8(sp)
    80007ad0:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    80007ad4:	00006797          	auipc	a5,0x6
    80007ad8:	80c78793          	addi	a5,a5,-2036 # 8000d2e0 <_ZN15MemoryAllocator11initializedE>
    80007adc:	0007c783          	lbu	a5,0(a5)
    80007ae0:	0017c793          	xori	a5,a5,1
    80007ae4:	0ff7f793          	andi	a5,a5,255
    80007ae8:	06078a63          	beqz	a5,80007b5c <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    80007aec:	00005797          	auipc	a5,0x5
    80007af0:	58c7b783          	ld	a5,1420(a5) # 8000d078 <_GLOBAL_OFFSET_TABLE_+0x30>
    80007af4:	0007b703          	ld	a4,0(a5)
    80007af8:	00005797          	auipc	a5,0x5
    80007afc:	7e078793          	addi	a5,a5,2016 # 8000d2d8 <_ZN15MemoryAllocator11freeMemHeadE>
    80007b00:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    80007b04:	00005797          	auipc	a5,0x5
    80007b08:	7d478793          	addi	a5,a5,2004 # 8000d2d8 <_ZN15MemoryAllocator11freeMemHeadE>
    80007b0c:	0007b783          	ld	a5,0(a5)
    80007b10:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    80007b14:	00005797          	auipc	a5,0x5
    80007b18:	5bc7b783          	ld	a5,1468(a5) # 8000d0d0 <_GLOBAL_OFFSET_TABLE_+0x88>
    80007b1c:	0007b703          	ld	a4,0(a5)
    80007b20:	00005797          	auipc	a5,0x5
    80007b24:	5587b783          	ld	a5,1368(a5) # 8000d078 <_GLOBAL_OFFSET_TABLE_+0x30>
    80007b28:	0007b783          	ld	a5,0(a5)
    80007b2c:	40f70733          	sub	a4,a4,a5
    80007b30:	00005797          	auipc	a5,0x5
    80007b34:	7a878793          	addi	a5,a5,1960 # 8000d2d8 <_ZN15MemoryAllocator11freeMemHeadE>
    80007b38:	0007b783          	ld	a5,0(a5)
    80007b3c:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    80007b40:	00005797          	auipc	a5,0x5
    80007b44:	79078793          	addi	a5,a5,1936 # 8000d2d0 <_ZN15MemoryAllocator11usedMemHeadE>
    80007b48:	0007b023          	sd	zero,0(a5)

        initialized = true;
    80007b4c:	00005797          	auipc	a5,0x5
    80007b50:	79478793          	addi	a5,a5,1940 # 8000d2e0 <_ZN15MemoryAllocator11initializedE>
    80007b54:	00100713          	li	a4,1
    80007b58:	00e78023          	sb	a4,0(a5)
    }
}
    80007b5c:	00000013          	nop
    80007b60:	00813403          	ld	s0,8(sp)
    80007b64:	01010113          	addi	sp,sp,16
    80007b68:	00008067          	ret

0000000080007b6c <start>:
    80007b6c:	ff010113          	addi	sp,sp,-16
    80007b70:	00813423          	sd	s0,8(sp)
    80007b74:	01010413          	addi	s0,sp,16
    80007b78:	300027f3          	csrr	a5,mstatus
    80007b7c:	ffffe737          	lui	a4,0xffffe
    80007b80:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff02af>
    80007b84:	00e7f7b3          	and	a5,a5,a4
    80007b88:	00001737          	lui	a4,0x1
    80007b8c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80007b90:	00e7e7b3          	or	a5,a5,a4
    80007b94:	30079073          	csrw	mstatus,a5
    80007b98:	00000797          	auipc	a5,0x0
    80007b9c:	16078793          	addi	a5,a5,352 # 80007cf8 <system_main>
    80007ba0:	34179073          	csrw	mepc,a5
    80007ba4:	00000793          	li	a5,0
    80007ba8:	18079073          	csrw	satp,a5
    80007bac:	000107b7          	lui	a5,0x10
    80007bb0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007bb4:	30279073          	csrw	medeleg,a5
    80007bb8:	30379073          	csrw	mideleg,a5
    80007bbc:	104027f3          	csrr	a5,sie
    80007bc0:	2227e793          	ori	a5,a5,546
    80007bc4:	10479073          	csrw	sie,a5
    80007bc8:	fff00793          	li	a5,-1
    80007bcc:	00a7d793          	srli	a5,a5,0xa
    80007bd0:	3b079073          	csrw	pmpaddr0,a5
    80007bd4:	00f00793          	li	a5,15
    80007bd8:	3a079073          	csrw	pmpcfg0,a5
    80007bdc:	f14027f3          	csrr	a5,mhartid
    80007be0:	0200c737          	lui	a4,0x200c
    80007be4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007be8:	0007869b          	sext.w	a3,a5
    80007bec:	00269713          	slli	a4,a3,0x2
    80007bf0:	000f4637          	lui	a2,0xf4
    80007bf4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007bf8:	00d70733          	add	a4,a4,a3
    80007bfc:	0037979b          	slliw	a5,a5,0x3
    80007c00:	020046b7          	lui	a3,0x2004
    80007c04:	00d787b3          	add	a5,a5,a3
    80007c08:	00c585b3          	add	a1,a1,a2
    80007c0c:	00371693          	slli	a3,a4,0x3
    80007c10:	00005717          	auipc	a4,0x5
    80007c14:	6e070713          	addi	a4,a4,1760 # 8000d2f0 <timer_scratch>
    80007c18:	00b7b023          	sd	a1,0(a5)
    80007c1c:	00d70733          	add	a4,a4,a3
    80007c20:	00f73c23          	sd	a5,24(a4)
    80007c24:	02c73023          	sd	a2,32(a4)
    80007c28:	34071073          	csrw	mscratch,a4
    80007c2c:	00000797          	auipc	a5,0x0
    80007c30:	6e478793          	addi	a5,a5,1764 # 80008310 <timervec>
    80007c34:	30579073          	csrw	mtvec,a5
    80007c38:	300027f3          	csrr	a5,mstatus
    80007c3c:	0087e793          	ori	a5,a5,8
    80007c40:	30079073          	csrw	mstatus,a5
    80007c44:	304027f3          	csrr	a5,mie
    80007c48:	0807e793          	ori	a5,a5,128
    80007c4c:	30479073          	csrw	mie,a5
    80007c50:	f14027f3          	csrr	a5,mhartid
    80007c54:	0007879b          	sext.w	a5,a5
    80007c58:	00078213          	mv	tp,a5
    80007c5c:	30200073          	mret
    80007c60:	00813403          	ld	s0,8(sp)
    80007c64:	01010113          	addi	sp,sp,16
    80007c68:	00008067          	ret

0000000080007c6c <timerinit>:
    80007c6c:	ff010113          	addi	sp,sp,-16
    80007c70:	00813423          	sd	s0,8(sp)
    80007c74:	01010413          	addi	s0,sp,16
    80007c78:	f14027f3          	csrr	a5,mhartid
    80007c7c:	0200c737          	lui	a4,0x200c
    80007c80:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007c84:	0007869b          	sext.w	a3,a5
    80007c88:	00269713          	slli	a4,a3,0x2
    80007c8c:	000f4637          	lui	a2,0xf4
    80007c90:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007c94:	00d70733          	add	a4,a4,a3
    80007c98:	0037979b          	slliw	a5,a5,0x3
    80007c9c:	020046b7          	lui	a3,0x2004
    80007ca0:	00d787b3          	add	a5,a5,a3
    80007ca4:	00c585b3          	add	a1,a1,a2
    80007ca8:	00371693          	slli	a3,a4,0x3
    80007cac:	00005717          	auipc	a4,0x5
    80007cb0:	64470713          	addi	a4,a4,1604 # 8000d2f0 <timer_scratch>
    80007cb4:	00b7b023          	sd	a1,0(a5)
    80007cb8:	00d70733          	add	a4,a4,a3
    80007cbc:	00f73c23          	sd	a5,24(a4)
    80007cc0:	02c73023          	sd	a2,32(a4)
    80007cc4:	34071073          	csrw	mscratch,a4
    80007cc8:	00000797          	auipc	a5,0x0
    80007ccc:	64878793          	addi	a5,a5,1608 # 80008310 <timervec>
    80007cd0:	30579073          	csrw	mtvec,a5
    80007cd4:	300027f3          	csrr	a5,mstatus
    80007cd8:	0087e793          	ori	a5,a5,8
    80007cdc:	30079073          	csrw	mstatus,a5
    80007ce0:	304027f3          	csrr	a5,mie
    80007ce4:	0807e793          	ori	a5,a5,128
    80007ce8:	30479073          	csrw	mie,a5
    80007cec:	00813403          	ld	s0,8(sp)
    80007cf0:	01010113          	addi	sp,sp,16
    80007cf4:	00008067          	ret

0000000080007cf8 <system_main>:
    80007cf8:	fe010113          	addi	sp,sp,-32
    80007cfc:	00813823          	sd	s0,16(sp)
    80007d00:	00913423          	sd	s1,8(sp)
    80007d04:	00113c23          	sd	ra,24(sp)
    80007d08:	02010413          	addi	s0,sp,32
    80007d0c:	00000097          	auipc	ra,0x0
    80007d10:	0c4080e7          	jalr	196(ra) # 80007dd0 <cpuid>
    80007d14:	00005497          	auipc	s1,0x5
    80007d18:	3fc48493          	addi	s1,s1,1020 # 8000d110 <started>
    80007d1c:	02050263          	beqz	a0,80007d40 <system_main+0x48>
    80007d20:	0004a783          	lw	a5,0(s1)
    80007d24:	0007879b          	sext.w	a5,a5
    80007d28:	fe078ce3          	beqz	a5,80007d20 <system_main+0x28>
    80007d2c:	0ff0000f          	fence
    80007d30:	00003517          	auipc	a0,0x3
    80007d34:	aa850513          	addi	a0,a0,-1368 # 8000a7d8 <CONSOLE_STATUS+0x7c8>
    80007d38:	00001097          	auipc	ra,0x1
    80007d3c:	a74080e7          	jalr	-1420(ra) # 800087ac <panic>
    80007d40:	00001097          	auipc	ra,0x1
    80007d44:	9c8080e7          	jalr	-1592(ra) # 80008708 <consoleinit>
    80007d48:	00001097          	auipc	ra,0x1
    80007d4c:	154080e7          	jalr	340(ra) # 80008e9c <printfinit>
    80007d50:	00003517          	auipc	a0,0x3
    80007d54:	91050513          	addi	a0,a0,-1776 # 8000a660 <CONSOLE_STATUS+0x650>
    80007d58:	00001097          	auipc	ra,0x1
    80007d5c:	ab0080e7          	jalr	-1360(ra) # 80008808 <__printf>
    80007d60:	00003517          	auipc	a0,0x3
    80007d64:	a4850513          	addi	a0,a0,-1464 # 8000a7a8 <CONSOLE_STATUS+0x798>
    80007d68:	00001097          	auipc	ra,0x1
    80007d6c:	aa0080e7          	jalr	-1376(ra) # 80008808 <__printf>
    80007d70:	00003517          	auipc	a0,0x3
    80007d74:	8f050513          	addi	a0,a0,-1808 # 8000a660 <CONSOLE_STATUS+0x650>
    80007d78:	00001097          	auipc	ra,0x1
    80007d7c:	a90080e7          	jalr	-1392(ra) # 80008808 <__printf>
    80007d80:	00001097          	auipc	ra,0x1
    80007d84:	4a8080e7          	jalr	1192(ra) # 80009228 <kinit>
    80007d88:	00000097          	auipc	ra,0x0
    80007d8c:	148080e7          	jalr	328(ra) # 80007ed0 <trapinit>
    80007d90:	00000097          	auipc	ra,0x0
    80007d94:	16c080e7          	jalr	364(ra) # 80007efc <trapinithart>
    80007d98:	00000097          	auipc	ra,0x0
    80007d9c:	5b8080e7          	jalr	1464(ra) # 80008350 <plicinit>
    80007da0:	00000097          	auipc	ra,0x0
    80007da4:	5d8080e7          	jalr	1496(ra) # 80008378 <plicinithart>
    80007da8:	00000097          	auipc	ra,0x0
    80007dac:	078080e7          	jalr	120(ra) # 80007e20 <userinit>
    80007db0:	0ff0000f          	fence
    80007db4:	00100793          	li	a5,1
    80007db8:	00003517          	auipc	a0,0x3
    80007dbc:	a0850513          	addi	a0,a0,-1528 # 8000a7c0 <CONSOLE_STATUS+0x7b0>
    80007dc0:	00f4a023          	sw	a5,0(s1)
    80007dc4:	00001097          	auipc	ra,0x1
    80007dc8:	a44080e7          	jalr	-1468(ra) # 80008808 <__printf>
    80007dcc:	0000006f          	j	80007dcc <system_main+0xd4>

0000000080007dd0 <cpuid>:
    80007dd0:	ff010113          	addi	sp,sp,-16
    80007dd4:	00813423          	sd	s0,8(sp)
    80007dd8:	01010413          	addi	s0,sp,16
    80007ddc:	00020513          	mv	a0,tp
    80007de0:	00813403          	ld	s0,8(sp)
    80007de4:	0005051b          	sext.w	a0,a0
    80007de8:	01010113          	addi	sp,sp,16
    80007dec:	00008067          	ret

0000000080007df0 <mycpu>:
    80007df0:	ff010113          	addi	sp,sp,-16
    80007df4:	00813423          	sd	s0,8(sp)
    80007df8:	01010413          	addi	s0,sp,16
    80007dfc:	00020793          	mv	a5,tp
    80007e00:	00813403          	ld	s0,8(sp)
    80007e04:	0007879b          	sext.w	a5,a5
    80007e08:	00779793          	slli	a5,a5,0x7
    80007e0c:	00006517          	auipc	a0,0x6
    80007e10:	51450513          	addi	a0,a0,1300 # 8000e320 <cpus>
    80007e14:	00f50533          	add	a0,a0,a5
    80007e18:	01010113          	addi	sp,sp,16
    80007e1c:	00008067          	ret

0000000080007e20 <userinit>:
    80007e20:	ff010113          	addi	sp,sp,-16
    80007e24:	00813423          	sd	s0,8(sp)
    80007e28:	01010413          	addi	s0,sp,16
    80007e2c:	00813403          	ld	s0,8(sp)
    80007e30:	01010113          	addi	sp,sp,16
    80007e34:	ffffa317          	auipc	t1,0xffffa
    80007e38:	4a030067          	jr	1184(t1) # 800022d4 <main>

0000000080007e3c <either_copyout>:
    80007e3c:	ff010113          	addi	sp,sp,-16
    80007e40:	00813023          	sd	s0,0(sp)
    80007e44:	00113423          	sd	ra,8(sp)
    80007e48:	01010413          	addi	s0,sp,16
    80007e4c:	02051663          	bnez	a0,80007e78 <either_copyout+0x3c>
    80007e50:	00058513          	mv	a0,a1
    80007e54:	00060593          	mv	a1,a2
    80007e58:	0006861b          	sext.w	a2,a3
    80007e5c:	00002097          	auipc	ra,0x2
    80007e60:	c58080e7          	jalr	-936(ra) # 80009ab4 <__memmove>
    80007e64:	00813083          	ld	ra,8(sp)
    80007e68:	00013403          	ld	s0,0(sp)
    80007e6c:	00000513          	li	a0,0
    80007e70:	01010113          	addi	sp,sp,16
    80007e74:	00008067          	ret
    80007e78:	00003517          	auipc	a0,0x3
    80007e7c:	98850513          	addi	a0,a0,-1656 # 8000a800 <CONSOLE_STATUS+0x7f0>
    80007e80:	00001097          	auipc	ra,0x1
    80007e84:	92c080e7          	jalr	-1748(ra) # 800087ac <panic>

0000000080007e88 <either_copyin>:
    80007e88:	ff010113          	addi	sp,sp,-16
    80007e8c:	00813023          	sd	s0,0(sp)
    80007e90:	00113423          	sd	ra,8(sp)
    80007e94:	01010413          	addi	s0,sp,16
    80007e98:	02059463          	bnez	a1,80007ec0 <either_copyin+0x38>
    80007e9c:	00060593          	mv	a1,a2
    80007ea0:	0006861b          	sext.w	a2,a3
    80007ea4:	00002097          	auipc	ra,0x2
    80007ea8:	c10080e7          	jalr	-1008(ra) # 80009ab4 <__memmove>
    80007eac:	00813083          	ld	ra,8(sp)
    80007eb0:	00013403          	ld	s0,0(sp)
    80007eb4:	00000513          	li	a0,0
    80007eb8:	01010113          	addi	sp,sp,16
    80007ebc:	00008067          	ret
    80007ec0:	00003517          	auipc	a0,0x3
    80007ec4:	96850513          	addi	a0,a0,-1688 # 8000a828 <CONSOLE_STATUS+0x818>
    80007ec8:	00001097          	auipc	ra,0x1
    80007ecc:	8e4080e7          	jalr	-1820(ra) # 800087ac <panic>

0000000080007ed0 <trapinit>:
    80007ed0:	ff010113          	addi	sp,sp,-16
    80007ed4:	00813423          	sd	s0,8(sp)
    80007ed8:	01010413          	addi	s0,sp,16
    80007edc:	00813403          	ld	s0,8(sp)
    80007ee0:	00003597          	auipc	a1,0x3
    80007ee4:	97058593          	addi	a1,a1,-1680 # 8000a850 <CONSOLE_STATUS+0x840>
    80007ee8:	00006517          	auipc	a0,0x6
    80007eec:	4b850513          	addi	a0,a0,1208 # 8000e3a0 <tickslock>
    80007ef0:	01010113          	addi	sp,sp,16
    80007ef4:	00001317          	auipc	t1,0x1
    80007ef8:	5c430067          	jr	1476(t1) # 800094b8 <initlock>

0000000080007efc <trapinithart>:
    80007efc:	ff010113          	addi	sp,sp,-16
    80007f00:	00813423          	sd	s0,8(sp)
    80007f04:	01010413          	addi	s0,sp,16
    80007f08:	00000797          	auipc	a5,0x0
    80007f0c:	2f878793          	addi	a5,a5,760 # 80008200 <kernelvec>
    80007f10:	10579073          	csrw	stvec,a5
    80007f14:	00813403          	ld	s0,8(sp)
    80007f18:	01010113          	addi	sp,sp,16
    80007f1c:	00008067          	ret

0000000080007f20 <usertrap>:
    80007f20:	ff010113          	addi	sp,sp,-16
    80007f24:	00813423          	sd	s0,8(sp)
    80007f28:	01010413          	addi	s0,sp,16
    80007f2c:	00813403          	ld	s0,8(sp)
    80007f30:	01010113          	addi	sp,sp,16
    80007f34:	00008067          	ret

0000000080007f38 <usertrapret>:
    80007f38:	ff010113          	addi	sp,sp,-16
    80007f3c:	00813423          	sd	s0,8(sp)
    80007f40:	01010413          	addi	s0,sp,16
    80007f44:	00813403          	ld	s0,8(sp)
    80007f48:	01010113          	addi	sp,sp,16
    80007f4c:	00008067          	ret

0000000080007f50 <kerneltrap>:
    80007f50:	fe010113          	addi	sp,sp,-32
    80007f54:	00813823          	sd	s0,16(sp)
    80007f58:	00113c23          	sd	ra,24(sp)
    80007f5c:	00913423          	sd	s1,8(sp)
    80007f60:	02010413          	addi	s0,sp,32
    80007f64:	142025f3          	csrr	a1,scause
    80007f68:	100027f3          	csrr	a5,sstatus
    80007f6c:	0027f793          	andi	a5,a5,2
    80007f70:	10079c63          	bnez	a5,80008088 <kerneltrap+0x138>
    80007f74:	142027f3          	csrr	a5,scause
    80007f78:	0207ce63          	bltz	a5,80007fb4 <kerneltrap+0x64>
    80007f7c:	00003517          	auipc	a0,0x3
    80007f80:	91c50513          	addi	a0,a0,-1764 # 8000a898 <CONSOLE_STATUS+0x888>
    80007f84:	00001097          	auipc	ra,0x1
    80007f88:	884080e7          	jalr	-1916(ra) # 80008808 <__printf>
    80007f8c:	141025f3          	csrr	a1,sepc
    80007f90:	14302673          	csrr	a2,stval
    80007f94:	00003517          	auipc	a0,0x3
    80007f98:	91450513          	addi	a0,a0,-1772 # 8000a8a8 <CONSOLE_STATUS+0x898>
    80007f9c:	00001097          	auipc	ra,0x1
    80007fa0:	86c080e7          	jalr	-1940(ra) # 80008808 <__printf>
    80007fa4:	00003517          	auipc	a0,0x3
    80007fa8:	91c50513          	addi	a0,a0,-1764 # 8000a8c0 <CONSOLE_STATUS+0x8b0>
    80007fac:	00001097          	auipc	ra,0x1
    80007fb0:	800080e7          	jalr	-2048(ra) # 800087ac <panic>
    80007fb4:	0ff7f713          	andi	a4,a5,255
    80007fb8:	00900693          	li	a3,9
    80007fbc:	04d70063          	beq	a4,a3,80007ffc <kerneltrap+0xac>
    80007fc0:	fff00713          	li	a4,-1
    80007fc4:	03f71713          	slli	a4,a4,0x3f
    80007fc8:	00170713          	addi	a4,a4,1
    80007fcc:	fae798e3          	bne	a5,a4,80007f7c <kerneltrap+0x2c>
    80007fd0:	00000097          	auipc	ra,0x0
    80007fd4:	e00080e7          	jalr	-512(ra) # 80007dd0 <cpuid>
    80007fd8:	06050663          	beqz	a0,80008044 <kerneltrap+0xf4>
    80007fdc:	144027f3          	csrr	a5,sip
    80007fe0:	ffd7f793          	andi	a5,a5,-3
    80007fe4:	14479073          	csrw	sip,a5
    80007fe8:	01813083          	ld	ra,24(sp)
    80007fec:	01013403          	ld	s0,16(sp)
    80007ff0:	00813483          	ld	s1,8(sp)
    80007ff4:	02010113          	addi	sp,sp,32
    80007ff8:	00008067          	ret
    80007ffc:	00000097          	auipc	ra,0x0
    80008000:	3c8080e7          	jalr	968(ra) # 800083c4 <plic_claim>
    80008004:	00a00793          	li	a5,10
    80008008:	00050493          	mv	s1,a0
    8000800c:	06f50863          	beq	a0,a5,8000807c <kerneltrap+0x12c>
    80008010:	fc050ce3          	beqz	a0,80007fe8 <kerneltrap+0x98>
    80008014:	00050593          	mv	a1,a0
    80008018:	00003517          	auipc	a0,0x3
    8000801c:	86050513          	addi	a0,a0,-1952 # 8000a878 <CONSOLE_STATUS+0x868>
    80008020:	00000097          	auipc	ra,0x0
    80008024:	7e8080e7          	jalr	2024(ra) # 80008808 <__printf>
    80008028:	01013403          	ld	s0,16(sp)
    8000802c:	01813083          	ld	ra,24(sp)
    80008030:	00048513          	mv	a0,s1
    80008034:	00813483          	ld	s1,8(sp)
    80008038:	02010113          	addi	sp,sp,32
    8000803c:	00000317          	auipc	t1,0x0
    80008040:	3c030067          	jr	960(t1) # 800083fc <plic_complete>
    80008044:	00006517          	auipc	a0,0x6
    80008048:	35c50513          	addi	a0,a0,860 # 8000e3a0 <tickslock>
    8000804c:	00001097          	auipc	ra,0x1
    80008050:	490080e7          	jalr	1168(ra) # 800094dc <acquire>
    80008054:	00005717          	auipc	a4,0x5
    80008058:	0c070713          	addi	a4,a4,192 # 8000d114 <ticks>
    8000805c:	00072783          	lw	a5,0(a4)
    80008060:	00006517          	auipc	a0,0x6
    80008064:	34050513          	addi	a0,a0,832 # 8000e3a0 <tickslock>
    80008068:	0017879b          	addiw	a5,a5,1
    8000806c:	00f72023          	sw	a5,0(a4)
    80008070:	00001097          	auipc	ra,0x1
    80008074:	538080e7          	jalr	1336(ra) # 800095a8 <release>
    80008078:	f65ff06f          	j	80007fdc <kerneltrap+0x8c>
    8000807c:	00001097          	auipc	ra,0x1
    80008080:	094080e7          	jalr	148(ra) # 80009110 <uartintr>
    80008084:	fa5ff06f          	j	80008028 <kerneltrap+0xd8>
    80008088:	00002517          	auipc	a0,0x2
    8000808c:	7d050513          	addi	a0,a0,2000 # 8000a858 <CONSOLE_STATUS+0x848>
    80008090:	00000097          	auipc	ra,0x0
    80008094:	71c080e7          	jalr	1820(ra) # 800087ac <panic>

0000000080008098 <clockintr>:
    80008098:	fe010113          	addi	sp,sp,-32
    8000809c:	00813823          	sd	s0,16(sp)
    800080a0:	00913423          	sd	s1,8(sp)
    800080a4:	00113c23          	sd	ra,24(sp)
    800080a8:	02010413          	addi	s0,sp,32
    800080ac:	00006497          	auipc	s1,0x6
    800080b0:	2f448493          	addi	s1,s1,756 # 8000e3a0 <tickslock>
    800080b4:	00048513          	mv	a0,s1
    800080b8:	00001097          	auipc	ra,0x1
    800080bc:	424080e7          	jalr	1060(ra) # 800094dc <acquire>
    800080c0:	00005717          	auipc	a4,0x5
    800080c4:	05470713          	addi	a4,a4,84 # 8000d114 <ticks>
    800080c8:	00072783          	lw	a5,0(a4)
    800080cc:	01013403          	ld	s0,16(sp)
    800080d0:	01813083          	ld	ra,24(sp)
    800080d4:	00048513          	mv	a0,s1
    800080d8:	0017879b          	addiw	a5,a5,1
    800080dc:	00813483          	ld	s1,8(sp)
    800080e0:	00f72023          	sw	a5,0(a4)
    800080e4:	02010113          	addi	sp,sp,32
    800080e8:	00001317          	auipc	t1,0x1
    800080ec:	4c030067          	jr	1216(t1) # 800095a8 <release>

00000000800080f0 <devintr>:
    800080f0:	142027f3          	csrr	a5,scause
    800080f4:	00000513          	li	a0,0
    800080f8:	0007c463          	bltz	a5,80008100 <devintr+0x10>
    800080fc:	00008067          	ret
    80008100:	fe010113          	addi	sp,sp,-32
    80008104:	00813823          	sd	s0,16(sp)
    80008108:	00113c23          	sd	ra,24(sp)
    8000810c:	00913423          	sd	s1,8(sp)
    80008110:	02010413          	addi	s0,sp,32
    80008114:	0ff7f713          	andi	a4,a5,255
    80008118:	00900693          	li	a3,9
    8000811c:	04d70c63          	beq	a4,a3,80008174 <devintr+0x84>
    80008120:	fff00713          	li	a4,-1
    80008124:	03f71713          	slli	a4,a4,0x3f
    80008128:	00170713          	addi	a4,a4,1
    8000812c:	00e78c63          	beq	a5,a4,80008144 <devintr+0x54>
    80008130:	01813083          	ld	ra,24(sp)
    80008134:	01013403          	ld	s0,16(sp)
    80008138:	00813483          	ld	s1,8(sp)
    8000813c:	02010113          	addi	sp,sp,32
    80008140:	00008067          	ret
    80008144:	00000097          	auipc	ra,0x0
    80008148:	c8c080e7          	jalr	-884(ra) # 80007dd0 <cpuid>
    8000814c:	06050663          	beqz	a0,800081b8 <devintr+0xc8>
    80008150:	144027f3          	csrr	a5,sip
    80008154:	ffd7f793          	andi	a5,a5,-3
    80008158:	14479073          	csrw	sip,a5
    8000815c:	01813083          	ld	ra,24(sp)
    80008160:	01013403          	ld	s0,16(sp)
    80008164:	00813483          	ld	s1,8(sp)
    80008168:	00200513          	li	a0,2
    8000816c:	02010113          	addi	sp,sp,32
    80008170:	00008067          	ret
    80008174:	00000097          	auipc	ra,0x0
    80008178:	250080e7          	jalr	592(ra) # 800083c4 <plic_claim>
    8000817c:	00a00793          	li	a5,10
    80008180:	00050493          	mv	s1,a0
    80008184:	06f50663          	beq	a0,a5,800081f0 <devintr+0x100>
    80008188:	00100513          	li	a0,1
    8000818c:	fa0482e3          	beqz	s1,80008130 <devintr+0x40>
    80008190:	00048593          	mv	a1,s1
    80008194:	00002517          	auipc	a0,0x2
    80008198:	6e450513          	addi	a0,a0,1764 # 8000a878 <CONSOLE_STATUS+0x868>
    8000819c:	00000097          	auipc	ra,0x0
    800081a0:	66c080e7          	jalr	1644(ra) # 80008808 <__printf>
    800081a4:	00048513          	mv	a0,s1
    800081a8:	00000097          	auipc	ra,0x0
    800081ac:	254080e7          	jalr	596(ra) # 800083fc <plic_complete>
    800081b0:	00100513          	li	a0,1
    800081b4:	f7dff06f          	j	80008130 <devintr+0x40>
    800081b8:	00006517          	auipc	a0,0x6
    800081bc:	1e850513          	addi	a0,a0,488 # 8000e3a0 <tickslock>
    800081c0:	00001097          	auipc	ra,0x1
    800081c4:	31c080e7          	jalr	796(ra) # 800094dc <acquire>
    800081c8:	00005717          	auipc	a4,0x5
    800081cc:	f4c70713          	addi	a4,a4,-180 # 8000d114 <ticks>
    800081d0:	00072783          	lw	a5,0(a4)
    800081d4:	00006517          	auipc	a0,0x6
    800081d8:	1cc50513          	addi	a0,a0,460 # 8000e3a0 <tickslock>
    800081dc:	0017879b          	addiw	a5,a5,1
    800081e0:	00f72023          	sw	a5,0(a4)
    800081e4:	00001097          	auipc	ra,0x1
    800081e8:	3c4080e7          	jalr	964(ra) # 800095a8 <release>
    800081ec:	f65ff06f          	j	80008150 <devintr+0x60>
    800081f0:	00001097          	auipc	ra,0x1
    800081f4:	f20080e7          	jalr	-224(ra) # 80009110 <uartintr>
    800081f8:	fadff06f          	j	800081a4 <devintr+0xb4>
    800081fc:	0000                	unimp
	...

0000000080008200 <kernelvec>:
    80008200:	f0010113          	addi	sp,sp,-256
    80008204:	00113023          	sd	ra,0(sp)
    80008208:	00213423          	sd	sp,8(sp)
    8000820c:	00313823          	sd	gp,16(sp)
    80008210:	00413c23          	sd	tp,24(sp)
    80008214:	02513023          	sd	t0,32(sp)
    80008218:	02613423          	sd	t1,40(sp)
    8000821c:	02713823          	sd	t2,48(sp)
    80008220:	02813c23          	sd	s0,56(sp)
    80008224:	04913023          	sd	s1,64(sp)
    80008228:	04a13423          	sd	a0,72(sp)
    8000822c:	04b13823          	sd	a1,80(sp)
    80008230:	04c13c23          	sd	a2,88(sp)
    80008234:	06d13023          	sd	a3,96(sp)
    80008238:	06e13423          	sd	a4,104(sp)
    8000823c:	06f13823          	sd	a5,112(sp)
    80008240:	07013c23          	sd	a6,120(sp)
    80008244:	09113023          	sd	a7,128(sp)
    80008248:	09213423          	sd	s2,136(sp)
    8000824c:	09313823          	sd	s3,144(sp)
    80008250:	09413c23          	sd	s4,152(sp)
    80008254:	0b513023          	sd	s5,160(sp)
    80008258:	0b613423          	sd	s6,168(sp)
    8000825c:	0b713823          	sd	s7,176(sp)
    80008260:	0b813c23          	sd	s8,184(sp)
    80008264:	0d913023          	sd	s9,192(sp)
    80008268:	0da13423          	sd	s10,200(sp)
    8000826c:	0db13823          	sd	s11,208(sp)
    80008270:	0dc13c23          	sd	t3,216(sp)
    80008274:	0fd13023          	sd	t4,224(sp)
    80008278:	0fe13423          	sd	t5,232(sp)
    8000827c:	0ff13823          	sd	t6,240(sp)
    80008280:	cd1ff0ef          	jal	ra,80007f50 <kerneltrap>
    80008284:	00013083          	ld	ra,0(sp)
    80008288:	00813103          	ld	sp,8(sp)
    8000828c:	01013183          	ld	gp,16(sp)
    80008290:	02013283          	ld	t0,32(sp)
    80008294:	02813303          	ld	t1,40(sp)
    80008298:	03013383          	ld	t2,48(sp)
    8000829c:	03813403          	ld	s0,56(sp)
    800082a0:	04013483          	ld	s1,64(sp)
    800082a4:	04813503          	ld	a0,72(sp)
    800082a8:	05013583          	ld	a1,80(sp)
    800082ac:	05813603          	ld	a2,88(sp)
    800082b0:	06013683          	ld	a3,96(sp)
    800082b4:	06813703          	ld	a4,104(sp)
    800082b8:	07013783          	ld	a5,112(sp)
    800082bc:	07813803          	ld	a6,120(sp)
    800082c0:	08013883          	ld	a7,128(sp)
    800082c4:	08813903          	ld	s2,136(sp)
    800082c8:	09013983          	ld	s3,144(sp)
    800082cc:	09813a03          	ld	s4,152(sp)
    800082d0:	0a013a83          	ld	s5,160(sp)
    800082d4:	0a813b03          	ld	s6,168(sp)
    800082d8:	0b013b83          	ld	s7,176(sp)
    800082dc:	0b813c03          	ld	s8,184(sp)
    800082e0:	0c013c83          	ld	s9,192(sp)
    800082e4:	0c813d03          	ld	s10,200(sp)
    800082e8:	0d013d83          	ld	s11,208(sp)
    800082ec:	0d813e03          	ld	t3,216(sp)
    800082f0:	0e013e83          	ld	t4,224(sp)
    800082f4:	0e813f03          	ld	t5,232(sp)
    800082f8:	0f013f83          	ld	t6,240(sp)
    800082fc:	10010113          	addi	sp,sp,256
    80008300:	10200073          	sret
    80008304:	00000013          	nop
    80008308:	00000013          	nop
    8000830c:	00000013          	nop

0000000080008310 <timervec>:
    80008310:	34051573          	csrrw	a0,mscratch,a0
    80008314:	00b53023          	sd	a1,0(a0)
    80008318:	00c53423          	sd	a2,8(a0)
    8000831c:	00d53823          	sd	a3,16(a0)
    80008320:	01853583          	ld	a1,24(a0)
    80008324:	02053603          	ld	a2,32(a0)
    80008328:	0005b683          	ld	a3,0(a1)
    8000832c:	00c686b3          	add	a3,a3,a2
    80008330:	00d5b023          	sd	a3,0(a1)
    80008334:	00200593          	li	a1,2
    80008338:	14459073          	csrw	sip,a1
    8000833c:	01053683          	ld	a3,16(a0)
    80008340:	00853603          	ld	a2,8(a0)
    80008344:	00053583          	ld	a1,0(a0)
    80008348:	34051573          	csrrw	a0,mscratch,a0
    8000834c:	30200073          	mret

0000000080008350 <plicinit>:
    80008350:	ff010113          	addi	sp,sp,-16
    80008354:	00813423          	sd	s0,8(sp)
    80008358:	01010413          	addi	s0,sp,16
    8000835c:	00813403          	ld	s0,8(sp)
    80008360:	0c0007b7          	lui	a5,0xc000
    80008364:	00100713          	li	a4,1
    80008368:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000836c:	00e7a223          	sw	a4,4(a5)
    80008370:	01010113          	addi	sp,sp,16
    80008374:	00008067          	ret

0000000080008378 <plicinithart>:
    80008378:	ff010113          	addi	sp,sp,-16
    8000837c:	00813023          	sd	s0,0(sp)
    80008380:	00113423          	sd	ra,8(sp)
    80008384:	01010413          	addi	s0,sp,16
    80008388:	00000097          	auipc	ra,0x0
    8000838c:	a48080e7          	jalr	-1464(ra) # 80007dd0 <cpuid>
    80008390:	0085171b          	slliw	a4,a0,0x8
    80008394:	0c0027b7          	lui	a5,0xc002
    80008398:	00e787b3          	add	a5,a5,a4
    8000839c:	40200713          	li	a4,1026
    800083a0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800083a4:	00813083          	ld	ra,8(sp)
    800083a8:	00013403          	ld	s0,0(sp)
    800083ac:	00d5151b          	slliw	a0,a0,0xd
    800083b0:	0c2017b7          	lui	a5,0xc201
    800083b4:	00a78533          	add	a0,a5,a0
    800083b8:	00052023          	sw	zero,0(a0)
    800083bc:	01010113          	addi	sp,sp,16
    800083c0:	00008067          	ret

00000000800083c4 <plic_claim>:
    800083c4:	ff010113          	addi	sp,sp,-16
    800083c8:	00813023          	sd	s0,0(sp)
    800083cc:	00113423          	sd	ra,8(sp)
    800083d0:	01010413          	addi	s0,sp,16
    800083d4:	00000097          	auipc	ra,0x0
    800083d8:	9fc080e7          	jalr	-1540(ra) # 80007dd0 <cpuid>
    800083dc:	00813083          	ld	ra,8(sp)
    800083e0:	00013403          	ld	s0,0(sp)
    800083e4:	00d5151b          	slliw	a0,a0,0xd
    800083e8:	0c2017b7          	lui	a5,0xc201
    800083ec:	00a78533          	add	a0,a5,a0
    800083f0:	00452503          	lw	a0,4(a0)
    800083f4:	01010113          	addi	sp,sp,16
    800083f8:	00008067          	ret

00000000800083fc <plic_complete>:
    800083fc:	fe010113          	addi	sp,sp,-32
    80008400:	00813823          	sd	s0,16(sp)
    80008404:	00913423          	sd	s1,8(sp)
    80008408:	00113c23          	sd	ra,24(sp)
    8000840c:	02010413          	addi	s0,sp,32
    80008410:	00050493          	mv	s1,a0
    80008414:	00000097          	auipc	ra,0x0
    80008418:	9bc080e7          	jalr	-1604(ra) # 80007dd0 <cpuid>
    8000841c:	01813083          	ld	ra,24(sp)
    80008420:	01013403          	ld	s0,16(sp)
    80008424:	00d5179b          	slliw	a5,a0,0xd
    80008428:	0c201737          	lui	a4,0xc201
    8000842c:	00f707b3          	add	a5,a4,a5
    80008430:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80008434:	00813483          	ld	s1,8(sp)
    80008438:	02010113          	addi	sp,sp,32
    8000843c:	00008067          	ret

0000000080008440 <consolewrite>:
    80008440:	fb010113          	addi	sp,sp,-80
    80008444:	04813023          	sd	s0,64(sp)
    80008448:	04113423          	sd	ra,72(sp)
    8000844c:	02913c23          	sd	s1,56(sp)
    80008450:	03213823          	sd	s2,48(sp)
    80008454:	03313423          	sd	s3,40(sp)
    80008458:	03413023          	sd	s4,32(sp)
    8000845c:	01513c23          	sd	s5,24(sp)
    80008460:	05010413          	addi	s0,sp,80
    80008464:	06c05c63          	blez	a2,800084dc <consolewrite+0x9c>
    80008468:	00060993          	mv	s3,a2
    8000846c:	00050a13          	mv	s4,a0
    80008470:	00058493          	mv	s1,a1
    80008474:	00000913          	li	s2,0
    80008478:	fff00a93          	li	s5,-1
    8000847c:	01c0006f          	j	80008498 <consolewrite+0x58>
    80008480:	fbf44503          	lbu	a0,-65(s0)
    80008484:	0019091b          	addiw	s2,s2,1
    80008488:	00148493          	addi	s1,s1,1
    8000848c:	00001097          	auipc	ra,0x1
    80008490:	a9c080e7          	jalr	-1380(ra) # 80008f28 <uartputc>
    80008494:	03298063          	beq	s3,s2,800084b4 <consolewrite+0x74>
    80008498:	00048613          	mv	a2,s1
    8000849c:	00100693          	li	a3,1
    800084a0:	000a0593          	mv	a1,s4
    800084a4:	fbf40513          	addi	a0,s0,-65
    800084a8:	00000097          	auipc	ra,0x0
    800084ac:	9e0080e7          	jalr	-1568(ra) # 80007e88 <either_copyin>
    800084b0:	fd5518e3          	bne	a0,s5,80008480 <consolewrite+0x40>
    800084b4:	04813083          	ld	ra,72(sp)
    800084b8:	04013403          	ld	s0,64(sp)
    800084bc:	03813483          	ld	s1,56(sp)
    800084c0:	02813983          	ld	s3,40(sp)
    800084c4:	02013a03          	ld	s4,32(sp)
    800084c8:	01813a83          	ld	s5,24(sp)
    800084cc:	00090513          	mv	a0,s2
    800084d0:	03013903          	ld	s2,48(sp)
    800084d4:	05010113          	addi	sp,sp,80
    800084d8:	00008067          	ret
    800084dc:	00000913          	li	s2,0
    800084e0:	fd5ff06f          	j	800084b4 <consolewrite+0x74>

00000000800084e4 <consoleread>:
    800084e4:	f9010113          	addi	sp,sp,-112
    800084e8:	06813023          	sd	s0,96(sp)
    800084ec:	04913c23          	sd	s1,88(sp)
    800084f0:	05213823          	sd	s2,80(sp)
    800084f4:	05313423          	sd	s3,72(sp)
    800084f8:	05413023          	sd	s4,64(sp)
    800084fc:	03513c23          	sd	s5,56(sp)
    80008500:	03613823          	sd	s6,48(sp)
    80008504:	03713423          	sd	s7,40(sp)
    80008508:	03813023          	sd	s8,32(sp)
    8000850c:	06113423          	sd	ra,104(sp)
    80008510:	01913c23          	sd	s9,24(sp)
    80008514:	07010413          	addi	s0,sp,112
    80008518:	00060b93          	mv	s7,a2
    8000851c:	00050913          	mv	s2,a0
    80008520:	00058c13          	mv	s8,a1
    80008524:	00060b1b          	sext.w	s6,a2
    80008528:	00006497          	auipc	s1,0x6
    8000852c:	ea048493          	addi	s1,s1,-352 # 8000e3c8 <cons>
    80008530:	00400993          	li	s3,4
    80008534:	fff00a13          	li	s4,-1
    80008538:	00a00a93          	li	s5,10
    8000853c:	05705e63          	blez	s7,80008598 <consoleread+0xb4>
    80008540:	09c4a703          	lw	a4,156(s1)
    80008544:	0984a783          	lw	a5,152(s1)
    80008548:	0007071b          	sext.w	a4,a4
    8000854c:	08e78463          	beq	a5,a4,800085d4 <consoleread+0xf0>
    80008550:	07f7f713          	andi	a4,a5,127
    80008554:	00e48733          	add	a4,s1,a4
    80008558:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000855c:	0017869b          	addiw	a3,a5,1
    80008560:	08d4ac23          	sw	a3,152(s1)
    80008564:	00070c9b          	sext.w	s9,a4
    80008568:	0b370663          	beq	a4,s3,80008614 <consoleread+0x130>
    8000856c:	00100693          	li	a3,1
    80008570:	f9f40613          	addi	a2,s0,-97
    80008574:	000c0593          	mv	a1,s8
    80008578:	00090513          	mv	a0,s2
    8000857c:	f8e40fa3          	sb	a4,-97(s0)
    80008580:	00000097          	auipc	ra,0x0
    80008584:	8bc080e7          	jalr	-1860(ra) # 80007e3c <either_copyout>
    80008588:	01450863          	beq	a0,s4,80008598 <consoleread+0xb4>
    8000858c:	001c0c13          	addi	s8,s8,1
    80008590:	fffb8b9b          	addiw	s7,s7,-1
    80008594:	fb5c94e3          	bne	s9,s5,8000853c <consoleread+0x58>
    80008598:	000b851b          	sext.w	a0,s7
    8000859c:	06813083          	ld	ra,104(sp)
    800085a0:	06013403          	ld	s0,96(sp)
    800085a4:	05813483          	ld	s1,88(sp)
    800085a8:	05013903          	ld	s2,80(sp)
    800085ac:	04813983          	ld	s3,72(sp)
    800085b0:	04013a03          	ld	s4,64(sp)
    800085b4:	03813a83          	ld	s5,56(sp)
    800085b8:	02813b83          	ld	s7,40(sp)
    800085bc:	02013c03          	ld	s8,32(sp)
    800085c0:	01813c83          	ld	s9,24(sp)
    800085c4:	40ab053b          	subw	a0,s6,a0
    800085c8:	03013b03          	ld	s6,48(sp)
    800085cc:	07010113          	addi	sp,sp,112
    800085d0:	00008067          	ret
    800085d4:	00001097          	auipc	ra,0x1
    800085d8:	1d8080e7          	jalr	472(ra) # 800097ac <push_on>
    800085dc:	0984a703          	lw	a4,152(s1)
    800085e0:	09c4a783          	lw	a5,156(s1)
    800085e4:	0007879b          	sext.w	a5,a5
    800085e8:	fef70ce3          	beq	a4,a5,800085e0 <consoleread+0xfc>
    800085ec:	00001097          	auipc	ra,0x1
    800085f0:	234080e7          	jalr	564(ra) # 80009820 <pop_on>
    800085f4:	0984a783          	lw	a5,152(s1)
    800085f8:	07f7f713          	andi	a4,a5,127
    800085fc:	00e48733          	add	a4,s1,a4
    80008600:	01874703          	lbu	a4,24(a4)
    80008604:	0017869b          	addiw	a3,a5,1
    80008608:	08d4ac23          	sw	a3,152(s1)
    8000860c:	00070c9b          	sext.w	s9,a4
    80008610:	f5371ee3          	bne	a4,s3,8000856c <consoleread+0x88>
    80008614:	000b851b          	sext.w	a0,s7
    80008618:	f96bf2e3          	bgeu	s7,s6,8000859c <consoleread+0xb8>
    8000861c:	08f4ac23          	sw	a5,152(s1)
    80008620:	f7dff06f          	j	8000859c <consoleread+0xb8>

0000000080008624 <consputc>:
    80008624:	10000793          	li	a5,256
    80008628:	00f50663          	beq	a0,a5,80008634 <consputc+0x10>
    8000862c:	00001317          	auipc	t1,0x1
    80008630:	9f430067          	jr	-1548(t1) # 80009020 <uartputc_sync>
    80008634:	ff010113          	addi	sp,sp,-16
    80008638:	00113423          	sd	ra,8(sp)
    8000863c:	00813023          	sd	s0,0(sp)
    80008640:	01010413          	addi	s0,sp,16
    80008644:	00800513          	li	a0,8
    80008648:	00001097          	auipc	ra,0x1
    8000864c:	9d8080e7          	jalr	-1576(ra) # 80009020 <uartputc_sync>
    80008650:	02000513          	li	a0,32
    80008654:	00001097          	auipc	ra,0x1
    80008658:	9cc080e7          	jalr	-1588(ra) # 80009020 <uartputc_sync>
    8000865c:	00013403          	ld	s0,0(sp)
    80008660:	00813083          	ld	ra,8(sp)
    80008664:	00800513          	li	a0,8
    80008668:	01010113          	addi	sp,sp,16
    8000866c:	00001317          	auipc	t1,0x1
    80008670:	9b430067          	jr	-1612(t1) # 80009020 <uartputc_sync>

0000000080008674 <consoleintr>:
    80008674:	fe010113          	addi	sp,sp,-32
    80008678:	00813823          	sd	s0,16(sp)
    8000867c:	00913423          	sd	s1,8(sp)
    80008680:	01213023          	sd	s2,0(sp)
    80008684:	00113c23          	sd	ra,24(sp)
    80008688:	02010413          	addi	s0,sp,32
    8000868c:	00006917          	auipc	s2,0x6
    80008690:	d3c90913          	addi	s2,s2,-708 # 8000e3c8 <cons>
    80008694:	00050493          	mv	s1,a0
    80008698:	00090513          	mv	a0,s2
    8000869c:	00001097          	auipc	ra,0x1
    800086a0:	e40080e7          	jalr	-448(ra) # 800094dc <acquire>
    800086a4:	02048c63          	beqz	s1,800086dc <consoleintr+0x68>
    800086a8:	0a092783          	lw	a5,160(s2)
    800086ac:	09892703          	lw	a4,152(s2)
    800086b0:	07f00693          	li	a3,127
    800086b4:	40e7873b          	subw	a4,a5,a4
    800086b8:	02e6e263          	bltu	a3,a4,800086dc <consoleintr+0x68>
    800086bc:	00d00713          	li	a4,13
    800086c0:	04e48063          	beq	s1,a4,80008700 <consoleintr+0x8c>
    800086c4:	07f7f713          	andi	a4,a5,127
    800086c8:	00e90733          	add	a4,s2,a4
    800086cc:	0017879b          	addiw	a5,a5,1
    800086d0:	0af92023          	sw	a5,160(s2)
    800086d4:	00970c23          	sb	s1,24(a4)
    800086d8:	08f92e23          	sw	a5,156(s2)
    800086dc:	01013403          	ld	s0,16(sp)
    800086e0:	01813083          	ld	ra,24(sp)
    800086e4:	00813483          	ld	s1,8(sp)
    800086e8:	00013903          	ld	s2,0(sp)
    800086ec:	00006517          	auipc	a0,0x6
    800086f0:	cdc50513          	addi	a0,a0,-804 # 8000e3c8 <cons>
    800086f4:	02010113          	addi	sp,sp,32
    800086f8:	00001317          	auipc	t1,0x1
    800086fc:	eb030067          	jr	-336(t1) # 800095a8 <release>
    80008700:	00a00493          	li	s1,10
    80008704:	fc1ff06f          	j	800086c4 <consoleintr+0x50>

0000000080008708 <consoleinit>:
    80008708:	fe010113          	addi	sp,sp,-32
    8000870c:	00113c23          	sd	ra,24(sp)
    80008710:	00813823          	sd	s0,16(sp)
    80008714:	00913423          	sd	s1,8(sp)
    80008718:	02010413          	addi	s0,sp,32
    8000871c:	00006497          	auipc	s1,0x6
    80008720:	cac48493          	addi	s1,s1,-852 # 8000e3c8 <cons>
    80008724:	00048513          	mv	a0,s1
    80008728:	00002597          	auipc	a1,0x2
    8000872c:	1a858593          	addi	a1,a1,424 # 8000a8d0 <CONSOLE_STATUS+0x8c0>
    80008730:	00001097          	auipc	ra,0x1
    80008734:	d88080e7          	jalr	-632(ra) # 800094b8 <initlock>
    80008738:	00000097          	auipc	ra,0x0
    8000873c:	7ac080e7          	jalr	1964(ra) # 80008ee4 <uartinit>
    80008740:	01813083          	ld	ra,24(sp)
    80008744:	01013403          	ld	s0,16(sp)
    80008748:	00000797          	auipc	a5,0x0
    8000874c:	d9c78793          	addi	a5,a5,-612 # 800084e4 <consoleread>
    80008750:	0af4bc23          	sd	a5,184(s1)
    80008754:	00000797          	auipc	a5,0x0
    80008758:	cec78793          	addi	a5,a5,-788 # 80008440 <consolewrite>
    8000875c:	0cf4b023          	sd	a5,192(s1)
    80008760:	00813483          	ld	s1,8(sp)
    80008764:	02010113          	addi	sp,sp,32
    80008768:	00008067          	ret

000000008000876c <console_read>:
    8000876c:	ff010113          	addi	sp,sp,-16
    80008770:	00813423          	sd	s0,8(sp)
    80008774:	01010413          	addi	s0,sp,16
    80008778:	00813403          	ld	s0,8(sp)
    8000877c:	00006317          	auipc	t1,0x6
    80008780:	d0433303          	ld	t1,-764(t1) # 8000e480 <devsw+0x10>
    80008784:	01010113          	addi	sp,sp,16
    80008788:	00030067          	jr	t1

000000008000878c <console_write>:
    8000878c:	ff010113          	addi	sp,sp,-16
    80008790:	00813423          	sd	s0,8(sp)
    80008794:	01010413          	addi	s0,sp,16
    80008798:	00813403          	ld	s0,8(sp)
    8000879c:	00006317          	auipc	t1,0x6
    800087a0:	cec33303          	ld	t1,-788(t1) # 8000e488 <devsw+0x18>
    800087a4:	01010113          	addi	sp,sp,16
    800087a8:	00030067          	jr	t1

00000000800087ac <panic>:
    800087ac:	fe010113          	addi	sp,sp,-32
    800087b0:	00113c23          	sd	ra,24(sp)
    800087b4:	00813823          	sd	s0,16(sp)
    800087b8:	00913423          	sd	s1,8(sp)
    800087bc:	02010413          	addi	s0,sp,32
    800087c0:	00050493          	mv	s1,a0
    800087c4:	00002517          	auipc	a0,0x2
    800087c8:	11450513          	addi	a0,a0,276 # 8000a8d8 <CONSOLE_STATUS+0x8c8>
    800087cc:	00006797          	auipc	a5,0x6
    800087d0:	d407ae23          	sw	zero,-676(a5) # 8000e528 <pr+0x18>
    800087d4:	00000097          	auipc	ra,0x0
    800087d8:	034080e7          	jalr	52(ra) # 80008808 <__printf>
    800087dc:	00048513          	mv	a0,s1
    800087e0:	00000097          	auipc	ra,0x0
    800087e4:	028080e7          	jalr	40(ra) # 80008808 <__printf>
    800087e8:	00002517          	auipc	a0,0x2
    800087ec:	e7850513          	addi	a0,a0,-392 # 8000a660 <CONSOLE_STATUS+0x650>
    800087f0:	00000097          	auipc	ra,0x0
    800087f4:	018080e7          	jalr	24(ra) # 80008808 <__printf>
    800087f8:	00100793          	li	a5,1
    800087fc:	00005717          	auipc	a4,0x5
    80008800:	90f72e23          	sw	a5,-1764(a4) # 8000d118 <panicked>
    80008804:	0000006f          	j	80008804 <panic+0x58>

0000000080008808 <__printf>:
    80008808:	f3010113          	addi	sp,sp,-208
    8000880c:	08813023          	sd	s0,128(sp)
    80008810:	07313423          	sd	s3,104(sp)
    80008814:	09010413          	addi	s0,sp,144
    80008818:	05813023          	sd	s8,64(sp)
    8000881c:	08113423          	sd	ra,136(sp)
    80008820:	06913c23          	sd	s1,120(sp)
    80008824:	07213823          	sd	s2,112(sp)
    80008828:	07413023          	sd	s4,96(sp)
    8000882c:	05513c23          	sd	s5,88(sp)
    80008830:	05613823          	sd	s6,80(sp)
    80008834:	05713423          	sd	s7,72(sp)
    80008838:	03913c23          	sd	s9,56(sp)
    8000883c:	03a13823          	sd	s10,48(sp)
    80008840:	03b13423          	sd	s11,40(sp)
    80008844:	00006317          	auipc	t1,0x6
    80008848:	ccc30313          	addi	t1,t1,-820 # 8000e510 <pr>
    8000884c:	01832c03          	lw	s8,24(t1)
    80008850:	00b43423          	sd	a1,8(s0)
    80008854:	00c43823          	sd	a2,16(s0)
    80008858:	00d43c23          	sd	a3,24(s0)
    8000885c:	02e43023          	sd	a4,32(s0)
    80008860:	02f43423          	sd	a5,40(s0)
    80008864:	03043823          	sd	a6,48(s0)
    80008868:	03143c23          	sd	a7,56(s0)
    8000886c:	00050993          	mv	s3,a0
    80008870:	4a0c1663          	bnez	s8,80008d1c <__printf+0x514>
    80008874:	60098c63          	beqz	s3,80008e8c <__printf+0x684>
    80008878:	0009c503          	lbu	a0,0(s3)
    8000887c:	00840793          	addi	a5,s0,8
    80008880:	f6f43c23          	sd	a5,-136(s0)
    80008884:	00000493          	li	s1,0
    80008888:	22050063          	beqz	a0,80008aa8 <__printf+0x2a0>
    8000888c:	00002a37          	lui	s4,0x2
    80008890:	00018ab7          	lui	s5,0x18
    80008894:	000f4b37          	lui	s6,0xf4
    80008898:	00989bb7          	lui	s7,0x989
    8000889c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800088a0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800088a4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800088a8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800088ac:	00148c9b          	addiw	s9,s1,1
    800088b0:	02500793          	li	a5,37
    800088b4:	01998933          	add	s2,s3,s9
    800088b8:	38f51263          	bne	a0,a5,80008c3c <__printf+0x434>
    800088bc:	00094783          	lbu	a5,0(s2)
    800088c0:	00078c9b          	sext.w	s9,a5
    800088c4:	1e078263          	beqz	a5,80008aa8 <__printf+0x2a0>
    800088c8:	0024849b          	addiw	s1,s1,2
    800088cc:	07000713          	li	a4,112
    800088d0:	00998933          	add	s2,s3,s1
    800088d4:	38e78a63          	beq	a5,a4,80008c68 <__printf+0x460>
    800088d8:	20f76863          	bltu	a4,a5,80008ae8 <__printf+0x2e0>
    800088dc:	42a78863          	beq	a5,a0,80008d0c <__printf+0x504>
    800088e0:	06400713          	li	a4,100
    800088e4:	40e79663          	bne	a5,a4,80008cf0 <__printf+0x4e8>
    800088e8:	f7843783          	ld	a5,-136(s0)
    800088ec:	0007a603          	lw	a2,0(a5)
    800088f0:	00878793          	addi	a5,a5,8
    800088f4:	f6f43c23          	sd	a5,-136(s0)
    800088f8:	42064a63          	bltz	a2,80008d2c <__printf+0x524>
    800088fc:	00a00713          	li	a4,10
    80008900:	02e677bb          	remuw	a5,a2,a4
    80008904:	00002d97          	auipc	s11,0x2
    80008908:	ffcd8d93          	addi	s11,s11,-4 # 8000a900 <digits>
    8000890c:	00900593          	li	a1,9
    80008910:	0006051b          	sext.w	a0,a2
    80008914:	00000c93          	li	s9,0
    80008918:	02079793          	slli	a5,a5,0x20
    8000891c:	0207d793          	srli	a5,a5,0x20
    80008920:	00fd87b3          	add	a5,s11,a5
    80008924:	0007c783          	lbu	a5,0(a5)
    80008928:	02e656bb          	divuw	a3,a2,a4
    8000892c:	f8f40023          	sb	a5,-128(s0)
    80008930:	14c5d863          	bge	a1,a2,80008a80 <__printf+0x278>
    80008934:	06300593          	li	a1,99
    80008938:	00100c93          	li	s9,1
    8000893c:	02e6f7bb          	remuw	a5,a3,a4
    80008940:	02079793          	slli	a5,a5,0x20
    80008944:	0207d793          	srli	a5,a5,0x20
    80008948:	00fd87b3          	add	a5,s11,a5
    8000894c:	0007c783          	lbu	a5,0(a5)
    80008950:	02e6d73b          	divuw	a4,a3,a4
    80008954:	f8f400a3          	sb	a5,-127(s0)
    80008958:	12a5f463          	bgeu	a1,a0,80008a80 <__printf+0x278>
    8000895c:	00a00693          	li	a3,10
    80008960:	00900593          	li	a1,9
    80008964:	02d777bb          	remuw	a5,a4,a3
    80008968:	02079793          	slli	a5,a5,0x20
    8000896c:	0207d793          	srli	a5,a5,0x20
    80008970:	00fd87b3          	add	a5,s11,a5
    80008974:	0007c503          	lbu	a0,0(a5)
    80008978:	02d757bb          	divuw	a5,a4,a3
    8000897c:	f8a40123          	sb	a0,-126(s0)
    80008980:	48e5f263          	bgeu	a1,a4,80008e04 <__printf+0x5fc>
    80008984:	06300513          	li	a0,99
    80008988:	02d7f5bb          	remuw	a1,a5,a3
    8000898c:	02059593          	slli	a1,a1,0x20
    80008990:	0205d593          	srli	a1,a1,0x20
    80008994:	00bd85b3          	add	a1,s11,a1
    80008998:	0005c583          	lbu	a1,0(a1)
    8000899c:	02d7d7bb          	divuw	a5,a5,a3
    800089a0:	f8b401a3          	sb	a1,-125(s0)
    800089a4:	48e57263          	bgeu	a0,a4,80008e28 <__printf+0x620>
    800089a8:	3e700513          	li	a0,999
    800089ac:	02d7f5bb          	remuw	a1,a5,a3
    800089b0:	02059593          	slli	a1,a1,0x20
    800089b4:	0205d593          	srli	a1,a1,0x20
    800089b8:	00bd85b3          	add	a1,s11,a1
    800089bc:	0005c583          	lbu	a1,0(a1)
    800089c0:	02d7d7bb          	divuw	a5,a5,a3
    800089c4:	f8b40223          	sb	a1,-124(s0)
    800089c8:	46e57663          	bgeu	a0,a4,80008e34 <__printf+0x62c>
    800089cc:	02d7f5bb          	remuw	a1,a5,a3
    800089d0:	02059593          	slli	a1,a1,0x20
    800089d4:	0205d593          	srli	a1,a1,0x20
    800089d8:	00bd85b3          	add	a1,s11,a1
    800089dc:	0005c583          	lbu	a1,0(a1)
    800089e0:	02d7d7bb          	divuw	a5,a5,a3
    800089e4:	f8b402a3          	sb	a1,-123(s0)
    800089e8:	46ea7863          	bgeu	s4,a4,80008e58 <__printf+0x650>
    800089ec:	02d7f5bb          	remuw	a1,a5,a3
    800089f0:	02059593          	slli	a1,a1,0x20
    800089f4:	0205d593          	srli	a1,a1,0x20
    800089f8:	00bd85b3          	add	a1,s11,a1
    800089fc:	0005c583          	lbu	a1,0(a1)
    80008a00:	02d7d7bb          	divuw	a5,a5,a3
    80008a04:	f8b40323          	sb	a1,-122(s0)
    80008a08:	3eeaf863          	bgeu	s5,a4,80008df8 <__printf+0x5f0>
    80008a0c:	02d7f5bb          	remuw	a1,a5,a3
    80008a10:	02059593          	slli	a1,a1,0x20
    80008a14:	0205d593          	srli	a1,a1,0x20
    80008a18:	00bd85b3          	add	a1,s11,a1
    80008a1c:	0005c583          	lbu	a1,0(a1)
    80008a20:	02d7d7bb          	divuw	a5,a5,a3
    80008a24:	f8b403a3          	sb	a1,-121(s0)
    80008a28:	42eb7e63          	bgeu	s6,a4,80008e64 <__printf+0x65c>
    80008a2c:	02d7f5bb          	remuw	a1,a5,a3
    80008a30:	02059593          	slli	a1,a1,0x20
    80008a34:	0205d593          	srli	a1,a1,0x20
    80008a38:	00bd85b3          	add	a1,s11,a1
    80008a3c:	0005c583          	lbu	a1,0(a1)
    80008a40:	02d7d7bb          	divuw	a5,a5,a3
    80008a44:	f8b40423          	sb	a1,-120(s0)
    80008a48:	42ebfc63          	bgeu	s7,a4,80008e80 <__printf+0x678>
    80008a4c:	02079793          	slli	a5,a5,0x20
    80008a50:	0207d793          	srli	a5,a5,0x20
    80008a54:	00fd8db3          	add	s11,s11,a5
    80008a58:	000dc703          	lbu	a4,0(s11)
    80008a5c:	00a00793          	li	a5,10
    80008a60:	00900c93          	li	s9,9
    80008a64:	f8e404a3          	sb	a4,-119(s0)
    80008a68:	00065c63          	bgez	a2,80008a80 <__printf+0x278>
    80008a6c:	f9040713          	addi	a4,s0,-112
    80008a70:	00f70733          	add	a4,a4,a5
    80008a74:	02d00693          	li	a3,45
    80008a78:	fed70823          	sb	a3,-16(a4)
    80008a7c:	00078c93          	mv	s9,a5
    80008a80:	f8040793          	addi	a5,s0,-128
    80008a84:	01978cb3          	add	s9,a5,s9
    80008a88:	f7f40d13          	addi	s10,s0,-129
    80008a8c:	000cc503          	lbu	a0,0(s9)
    80008a90:	fffc8c93          	addi	s9,s9,-1
    80008a94:	00000097          	auipc	ra,0x0
    80008a98:	b90080e7          	jalr	-1136(ra) # 80008624 <consputc>
    80008a9c:	ffac98e3          	bne	s9,s10,80008a8c <__printf+0x284>
    80008aa0:	00094503          	lbu	a0,0(s2)
    80008aa4:	e00514e3          	bnez	a0,800088ac <__printf+0xa4>
    80008aa8:	1a0c1663          	bnez	s8,80008c54 <__printf+0x44c>
    80008aac:	08813083          	ld	ra,136(sp)
    80008ab0:	08013403          	ld	s0,128(sp)
    80008ab4:	07813483          	ld	s1,120(sp)
    80008ab8:	07013903          	ld	s2,112(sp)
    80008abc:	06813983          	ld	s3,104(sp)
    80008ac0:	06013a03          	ld	s4,96(sp)
    80008ac4:	05813a83          	ld	s5,88(sp)
    80008ac8:	05013b03          	ld	s6,80(sp)
    80008acc:	04813b83          	ld	s7,72(sp)
    80008ad0:	04013c03          	ld	s8,64(sp)
    80008ad4:	03813c83          	ld	s9,56(sp)
    80008ad8:	03013d03          	ld	s10,48(sp)
    80008adc:	02813d83          	ld	s11,40(sp)
    80008ae0:	0d010113          	addi	sp,sp,208
    80008ae4:	00008067          	ret
    80008ae8:	07300713          	li	a4,115
    80008aec:	1ce78a63          	beq	a5,a4,80008cc0 <__printf+0x4b8>
    80008af0:	07800713          	li	a4,120
    80008af4:	1ee79e63          	bne	a5,a4,80008cf0 <__printf+0x4e8>
    80008af8:	f7843783          	ld	a5,-136(s0)
    80008afc:	0007a703          	lw	a4,0(a5)
    80008b00:	00878793          	addi	a5,a5,8
    80008b04:	f6f43c23          	sd	a5,-136(s0)
    80008b08:	28074263          	bltz	a4,80008d8c <__printf+0x584>
    80008b0c:	00002d97          	auipc	s11,0x2
    80008b10:	df4d8d93          	addi	s11,s11,-524 # 8000a900 <digits>
    80008b14:	00f77793          	andi	a5,a4,15
    80008b18:	00fd87b3          	add	a5,s11,a5
    80008b1c:	0007c683          	lbu	a3,0(a5)
    80008b20:	00f00613          	li	a2,15
    80008b24:	0007079b          	sext.w	a5,a4
    80008b28:	f8d40023          	sb	a3,-128(s0)
    80008b2c:	0047559b          	srliw	a1,a4,0x4
    80008b30:	0047569b          	srliw	a3,a4,0x4
    80008b34:	00000c93          	li	s9,0
    80008b38:	0ee65063          	bge	a2,a4,80008c18 <__printf+0x410>
    80008b3c:	00f6f693          	andi	a3,a3,15
    80008b40:	00dd86b3          	add	a3,s11,a3
    80008b44:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80008b48:	0087d79b          	srliw	a5,a5,0x8
    80008b4c:	00100c93          	li	s9,1
    80008b50:	f8d400a3          	sb	a3,-127(s0)
    80008b54:	0cb67263          	bgeu	a2,a1,80008c18 <__printf+0x410>
    80008b58:	00f7f693          	andi	a3,a5,15
    80008b5c:	00dd86b3          	add	a3,s11,a3
    80008b60:	0006c583          	lbu	a1,0(a3)
    80008b64:	00f00613          	li	a2,15
    80008b68:	0047d69b          	srliw	a3,a5,0x4
    80008b6c:	f8b40123          	sb	a1,-126(s0)
    80008b70:	0047d593          	srli	a1,a5,0x4
    80008b74:	28f67e63          	bgeu	a2,a5,80008e10 <__printf+0x608>
    80008b78:	00f6f693          	andi	a3,a3,15
    80008b7c:	00dd86b3          	add	a3,s11,a3
    80008b80:	0006c503          	lbu	a0,0(a3)
    80008b84:	0087d813          	srli	a6,a5,0x8
    80008b88:	0087d69b          	srliw	a3,a5,0x8
    80008b8c:	f8a401a3          	sb	a0,-125(s0)
    80008b90:	28b67663          	bgeu	a2,a1,80008e1c <__printf+0x614>
    80008b94:	00f6f693          	andi	a3,a3,15
    80008b98:	00dd86b3          	add	a3,s11,a3
    80008b9c:	0006c583          	lbu	a1,0(a3)
    80008ba0:	00c7d513          	srli	a0,a5,0xc
    80008ba4:	00c7d69b          	srliw	a3,a5,0xc
    80008ba8:	f8b40223          	sb	a1,-124(s0)
    80008bac:	29067a63          	bgeu	a2,a6,80008e40 <__printf+0x638>
    80008bb0:	00f6f693          	andi	a3,a3,15
    80008bb4:	00dd86b3          	add	a3,s11,a3
    80008bb8:	0006c583          	lbu	a1,0(a3)
    80008bbc:	0107d813          	srli	a6,a5,0x10
    80008bc0:	0107d69b          	srliw	a3,a5,0x10
    80008bc4:	f8b402a3          	sb	a1,-123(s0)
    80008bc8:	28a67263          	bgeu	a2,a0,80008e4c <__printf+0x644>
    80008bcc:	00f6f693          	andi	a3,a3,15
    80008bd0:	00dd86b3          	add	a3,s11,a3
    80008bd4:	0006c683          	lbu	a3,0(a3)
    80008bd8:	0147d79b          	srliw	a5,a5,0x14
    80008bdc:	f8d40323          	sb	a3,-122(s0)
    80008be0:	21067663          	bgeu	a2,a6,80008dec <__printf+0x5e4>
    80008be4:	02079793          	slli	a5,a5,0x20
    80008be8:	0207d793          	srli	a5,a5,0x20
    80008bec:	00fd8db3          	add	s11,s11,a5
    80008bf0:	000dc683          	lbu	a3,0(s11)
    80008bf4:	00800793          	li	a5,8
    80008bf8:	00700c93          	li	s9,7
    80008bfc:	f8d403a3          	sb	a3,-121(s0)
    80008c00:	00075c63          	bgez	a4,80008c18 <__printf+0x410>
    80008c04:	f9040713          	addi	a4,s0,-112
    80008c08:	00f70733          	add	a4,a4,a5
    80008c0c:	02d00693          	li	a3,45
    80008c10:	fed70823          	sb	a3,-16(a4)
    80008c14:	00078c93          	mv	s9,a5
    80008c18:	f8040793          	addi	a5,s0,-128
    80008c1c:	01978cb3          	add	s9,a5,s9
    80008c20:	f7f40d13          	addi	s10,s0,-129
    80008c24:	000cc503          	lbu	a0,0(s9)
    80008c28:	fffc8c93          	addi	s9,s9,-1
    80008c2c:	00000097          	auipc	ra,0x0
    80008c30:	9f8080e7          	jalr	-1544(ra) # 80008624 <consputc>
    80008c34:	ff9d18e3          	bne	s10,s9,80008c24 <__printf+0x41c>
    80008c38:	0100006f          	j	80008c48 <__printf+0x440>
    80008c3c:	00000097          	auipc	ra,0x0
    80008c40:	9e8080e7          	jalr	-1560(ra) # 80008624 <consputc>
    80008c44:	000c8493          	mv	s1,s9
    80008c48:	00094503          	lbu	a0,0(s2)
    80008c4c:	c60510e3          	bnez	a0,800088ac <__printf+0xa4>
    80008c50:	e40c0ee3          	beqz	s8,80008aac <__printf+0x2a4>
    80008c54:	00006517          	auipc	a0,0x6
    80008c58:	8bc50513          	addi	a0,a0,-1860 # 8000e510 <pr>
    80008c5c:	00001097          	auipc	ra,0x1
    80008c60:	94c080e7          	jalr	-1716(ra) # 800095a8 <release>
    80008c64:	e49ff06f          	j	80008aac <__printf+0x2a4>
    80008c68:	f7843783          	ld	a5,-136(s0)
    80008c6c:	03000513          	li	a0,48
    80008c70:	01000d13          	li	s10,16
    80008c74:	00878713          	addi	a4,a5,8
    80008c78:	0007bc83          	ld	s9,0(a5)
    80008c7c:	f6e43c23          	sd	a4,-136(s0)
    80008c80:	00000097          	auipc	ra,0x0
    80008c84:	9a4080e7          	jalr	-1628(ra) # 80008624 <consputc>
    80008c88:	07800513          	li	a0,120
    80008c8c:	00000097          	auipc	ra,0x0
    80008c90:	998080e7          	jalr	-1640(ra) # 80008624 <consputc>
    80008c94:	00002d97          	auipc	s11,0x2
    80008c98:	c6cd8d93          	addi	s11,s11,-916 # 8000a900 <digits>
    80008c9c:	03ccd793          	srli	a5,s9,0x3c
    80008ca0:	00fd87b3          	add	a5,s11,a5
    80008ca4:	0007c503          	lbu	a0,0(a5)
    80008ca8:	fffd0d1b          	addiw	s10,s10,-1
    80008cac:	004c9c93          	slli	s9,s9,0x4
    80008cb0:	00000097          	auipc	ra,0x0
    80008cb4:	974080e7          	jalr	-1676(ra) # 80008624 <consputc>
    80008cb8:	fe0d12e3          	bnez	s10,80008c9c <__printf+0x494>
    80008cbc:	f8dff06f          	j	80008c48 <__printf+0x440>
    80008cc0:	f7843783          	ld	a5,-136(s0)
    80008cc4:	0007bc83          	ld	s9,0(a5)
    80008cc8:	00878793          	addi	a5,a5,8
    80008ccc:	f6f43c23          	sd	a5,-136(s0)
    80008cd0:	000c9a63          	bnez	s9,80008ce4 <__printf+0x4dc>
    80008cd4:	1080006f          	j	80008ddc <__printf+0x5d4>
    80008cd8:	001c8c93          	addi	s9,s9,1
    80008cdc:	00000097          	auipc	ra,0x0
    80008ce0:	948080e7          	jalr	-1720(ra) # 80008624 <consputc>
    80008ce4:	000cc503          	lbu	a0,0(s9)
    80008ce8:	fe0518e3          	bnez	a0,80008cd8 <__printf+0x4d0>
    80008cec:	f5dff06f          	j	80008c48 <__printf+0x440>
    80008cf0:	02500513          	li	a0,37
    80008cf4:	00000097          	auipc	ra,0x0
    80008cf8:	930080e7          	jalr	-1744(ra) # 80008624 <consputc>
    80008cfc:	000c8513          	mv	a0,s9
    80008d00:	00000097          	auipc	ra,0x0
    80008d04:	924080e7          	jalr	-1756(ra) # 80008624 <consputc>
    80008d08:	f41ff06f          	j	80008c48 <__printf+0x440>
    80008d0c:	02500513          	li	a0,37
    80008d10:	00000097          	auipc	ra,0x0
    80008d14:	914080e7          	jalr	-1772(ra) # 80008624 <consputc>
    80008d18:	f31ff06f          	j	80008c48 <__printf+0x440>
    80008d1c:	00030513          	mv	a0,t1
    80008d20:	00000097          	auipc	ra,0x0
    80008d24:	7bc080e7          	jalr	1980(ra) # 800094dc <acquire>
    80008d28:	b4dff06f          	j	80008874 <__printf+0x6c>
    80008d2c:	40c0053b          	negw	a0,a2
    80008d30:	00a00713          	li	a4,10
    80008d34:	02e576bb          	remuw	a3,a0,a4
    80008d38:	00002d97          	auipc	s11,0x2
    80008d3c:	bc8d8d93          	addi	s11,s11,-1080 # 8000a900 <digits>
    80008d40:	ff700593          	li	a1,-9
    80008d44:	02069693          	slli	a3,a3,0x20
    80008d48:	0206d693          	srli	a3,a3,0x20
    80008d4c:	00dd86b3          	add	a3,s11,a3
    80008d50:	0006c683          	lbu	a3,0(a3)
    80008d54:	02e557bb          	divuw	a5,a0,a4
    80008d58:	f8d40023          	sb	a3,-128(s0)
    80008d5c:	10b65e63          	bge	a2,a1,80008e78 <__printf+0x670>
    80008d60:	06300593          	li	a1,99
    80008d64:	02e7f6bb          	remuw	a3,a5,a4
    80008d68:	02069693          	slli	a3,a3,0x20
    80008d6c:	0206d693          	srli	a3,a3,0x20
    80008d70:	00dd86b3          	add	a3,s11,a3
    80008d74:	0006c683          	lbu	a3,0(a3)
    80008d78:	02e7d73b          	divuw	a4,a5,a4
    80008d7c:	00200793          	li	a5,2
    80008d80:	f8d400a3          	sb	a3,-127(s0)
    80008d84:	bca5ece3          	bltu	a1,a0,8000895c <__printf+0x154>
    80008d88:	ce5ff06f          	j	80008a6c <__printf+0x264>
    80008d8c:	40e007bb          	negw	a5,a4
    80008d90:	00002d97          	auipc	s11,0x2
    80008d94:	b70d8d93          	addi	s11,s11,-1168 # 8000a900 <digits>
    80008d98:	00f7f693          	andi	a3,a5,15
    80008d9c:	00dd86b3          	add	a3,s11,a3
    80008da0:	0006c583          	lbu	a1,0(a3)
    80008da4:	ff100613          	li	a2,-15
    80008da8:	0047d69b          	srliw	a3,a5,0x4
    80008dac:	f8b40023          	sb	a1,-128(s0)
    80008db0:	0047d59b          	srliw	a1,a5,0x4
    80008db4:	0ac75e63          	bge	a4,a2,80008e70 <__printf+0x668>
    80008db8:	00f6f693          	andi	a3,a3,15
    80008dbc:	00dd86b3          	add	a3,s11,a3
    80008dc0:	0006c603          	lbu	a2,0(a3)
    80008dc4:	00f00693          	li	a3,15
    80008dc8:	0087d79b          	srliw	a5,a5,0x8
    80008dcc:	f8c400a3          	sb	a2,-127(s0)
    80008dd0:	d8b6e4e3          	bltu	a3,a1,80008b58 <__printf+0x350>
    80008dd4:	00200793          	li	a5,2
    80008dd8:	e2dff06f          	j	80008c04 <__printf+0x3fc>
    80008ddc:	00002c97          	auipc	s9,0x2
    80008de0:	b04c8c93          	addi	s9,s9,-1276 # 8000a8e0 <CONSOLE_STATUS+0x8d0>
    80008de4:	02800513          	li	a0,40
    80008de8:	ef1ff06f          	j	80008cd8 <__printf+0x4d0>
    80008dec:	00700793          	li	a5,7
    80008df0:	00600c93          	li	s9,6
    80008df4:	e0dff06f          	j	80008c00 <__printf+0x3f8>
    80008df8:	00700793          	li	a5,7
    80008dfc:	00600c93          	li	s9,6
    80008e00:	c69ff06f          	j	80008a68 <__printf+0x260>
    80008e04:	00300793          	li	a5,3
    80008e08:	00200c93          	li	s9,2
    80008e0c:	c5dff06f          	j	80008a68 <__printf+0x260>
    80008e10:	00300793          	li	a5,3
    80008e14:	00200c93          	li	s9,2
    80008e18:	de9ff06f          	j	80008c00 <__printf+0x3f8>
    80008e1c:	00400793          	li	a5,4
    80008e20:	00300c93          	li	s9,3
    80008e24:	dddff06f          	j	80008c00 <__printf+0x3f8>
    80008e28:	00400793          	li	a5,4
    80008e2c:	00300c93          	li	s9,3
    80008e30:	c39ff06f          	j	80008a68 <__printf+0x260>
    80008e34:	00500793          	li	a5,5
    80008e38:	00400c93          	li	s9,4
    80008e3c:	c2dff06f          	j	80008a68 <__printf+0x260>
    80008e40:	00500793          	li	a5,5
    80008e44:	00400c93          	li	s9,4
    80008e48:	db9ff06f          	j	80008c00 <__printf+0x3f8>
    80008e4c:	00600793          	li	a5,6
    80008e50:	00500c93          	li	s9,5
    80008e54:	dadff06f          	j	80008c00 <__printf+0x3f8>
    80008e58:	00600793          	li	a5,6
    80008e5c:	00500c93          	li	s9,5
    80008e60:	c09ff06f          	j	80008a68 <__printf+0x260>
    80008e64:	00800793          	li	a5,8
    80008e68:	00700c93          	li	s9,7
    80008e6c:	bfdff06f          	j	80008a68 <__printf+0x260>
    80008e70:	00100793          	li	a5,1
    80008e74:	d91ff06f          	j	80008c04 <__printf+0x3fc>
    80008e78:	00100793          	li	a5,1
    80008e7c:	bf1ff06f          	j	80008a6c <__printf+0x264>
    80008e80:	00900793          	li	a5,9
    80008e84:	00800c93          	li	s9,8
    80008e88:	be1ff06f          	j	80008a68 <__printf+0x260>
    80008e8c:	00002517          	auipc	a0,0x2
    80008e90:	a5c50513          	addi	a0,a0,-1444 # 8000a8e8 <CONSOLE_STATUS+0x8d8>
    80008e94:	00000097          	auipc	ra,0x0
    80008e98:	918080e7          	jalr	-1768(ra) # 800087ac <panic>

0000000080008e9c <printfinit>:
    80008e9c:	fe010113          	addi	sp,sp,-32
    80008ea0:	00813823          	sd	s0,16(sp)
    80008ea4:	00913423          	sd	s1,8(sp)
    80008ea8:	00113c23          	sd	ra,24(sp)
    80008eac:	02010413          	addi	s0,sp,32
    80008eb0:	00005497          	auipc	s1,0x5
    80008eb4:	66048493          	addi	s1,s1,1632 # 8000e510 <pr>
    80008eb8:	00048513          	mv	a0,s1
    80008ebc:	00002597          	auipc	a1,0x2
    80008ec0:	a3c58593          	addi	a1,a1,-1476 # 8000a8f8 <CONSOLE_STATUS+0x8e8>
    80008ec4:	00000097          	auipc	ra,0x0
    80008ec8:	5f4080e7          	jalr	1524(ra) # 800094b8 <initlock>
    80008ecc:	01813083          	ld	ra,24(sp)
    80008ed0:	01013403          	ld	s0,16(sp)
    80008ed4:	0004ac23          	sw	zero,24(s1)
    80008ed8:	00813483          	ld	s1,8(sp)
    80008edc:	02010113          	addi	sp,sp,32
    80008ee0:	00008067          	ret

0000000080008ee4 <uartinit>:
    80008ee4:	ff010113          	addi	sp,sp,-16
    80008ee8:	00813423          	sd	s0,8(sp)
    80008eec:	01010413          	addi	s0,sp,16
    80008ef0:	100007b7          	lui	a5,0x10000
    80008ef4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008ef8:	f8000713          	li	a4,-128
    80008efc:	00e781a3          	sb	a4,3(a5)
    80008f00:	00300713          	li	a4,3
    80008f04:	00e78023          	sb	a4,0(a5)
    80008f08:	000780a3          	sb	zero,1(a5)
    80008f0c:	00e781a3          	sb	a4,3(a5)
    80008f10:	00700693          	li	a3,7
    80008f14:	00d78123          	sb	a3,2(a5)
    80008f18:	00e780a3          	sb	a4,1(a5)
    80008f1c:	00813403          	ld	s0,8(sp)
    80008f20:	01010113          	addi	sp,sp,16
    80008f24:	00008067          	ret

0000000080008f28 <uartputc>:
    80008f28:	00004797          	auipc	a5,0x4
    80008f2c:	1f07a783          	lw	a5,496(a5) # 8000d118 <panicked>
    80008f30:	00078463          	beqz	a5,80008f38 <uartputc+0x10>
    80008f34:	0000006f          	j	80008f34 <uartputc+0xc>
    80008f38:	fd010113          	addi	sp,sp,-48
    80008f3c:	02813023          	sd	s0,32(sp)
    80008f40:	00913c23          	sd	s1,24(sp)
    80008f44:	01213823          	sd	s2,16(sp)
    80008f48:	01313423          	sd	s3,8(sp)
    80008f4c:	02113423          	sd	ra,40(sp)
    80008f50:	03010413          	addi	s0,sp,48
    80008f54:	00004917          	auipc	s2,0x4
    80008f58:	1cc90913          	addi	s2,s2,460 # 8000d120 <uart_tx_r>
    80008f5c:	00093783          	ld	a5,0(s2)
    80008f60:	00004497          	auipc	s1,0x4
    80008f64:	1c848493          	addi	s1,s1,456 # 8000d128 <uart_tx_w>
    80008f68:	0004b703          	ld	a4,0(s1)
    80008f6c:	02078693          	addi	a3,a5,32
    80008f70:	00050993          	mv	s3,a0
    80008f74:	02e69c63          	bne	a3,a4,80008fac <uartputc+0x84>
    80008f78:	00001097          	auipc	ra,0x1
    80008f7c:	834080e7          	jalr	-1996(ra) # 800097ac <push_on>
    80008f80:	00093783          	ld	a5,0(s2)
    80008f84:	0004b703          	ld	a4,0(s1)
    80008f88:	02078793          	addi	a5,a5,32
    80008f8c:	00e79463          	bne	a5,a4,80008f94 <uartputc+0x6c>
    80008f90:	0000006f          	j	80008f90 <uartputc+0x68>
    80008f94:	00001097          	auipc	ra,0x1
    80008f98:	88c080e7          	jalr	-1908(ra) # 80009820 <pop_on>
    80008f9c:	00093783          	ld	a5,0(s2)
    80008fa0:	0004b703          	ld	a4,0(s1)
    80008fa4:	02078693          	addi	a3,a5,32
    80008fa8:	fce688e3          	beq	a3,a4,80008f78 <uartputc+0x50>
    80008fac:	01f77693          	andi	a3,a4,31
    80008fb0:	00005597          	auipc	a1,0x5
    80008fb4:	58058593          	addi	a1,a1,1408 # 8000e530 <uart_tx_buf>
    80008fb8:	00d586b3          	add	a3,a1,a3
    80008fbc:	00170713          	addi	a4,a4,1
    80008fc0:	01368023          	sb	s3,0(a3)
    80008fc4:	00e4b023          	sd	a4,0(s1)
    80008fc8:	10000637          	lui	a2,0x10000
    80008fcc:	02f71063          	bne	a4,a5,80008fec <uartputc+0xc4>
    80008fd0:	0340006f          	j	80009004 <uartputc+0xdc>
    80008fd4:	00074703          	lbu	a4,0(a4)
    80008fd8:	00f93023          	sd	a5,0(s2)
    80008fdc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008fe0:	00093783          	ld	a5,0(s2)
    80008fe4:	0004b703          	ld	a4,0(s1)
    80008fe8:	00f70e63          	beq	a4,a5,80009004 <uartputc+0xdc>
    80008fec:	00564683          	lbu	a3,5(a2)
    80008ff0:	01f7f713          	andi	a4,a5,31
    80008ff4:	00e58733          	add	a4,a1,a4
    80008ff8:	0206f693          	andi	a3,a3,32
    80008ffc:	00178793          	addi	a5,a5,1
    80009000:	fc069ae3          	bnez	a3,80008fd4 <uartputc+0xac>
    80009004:	02813083          	ld	ra,40(sp)
    80009008:	02013403          	ld	s0,32(sp)
    8000900c:	01813483          	ld	s1,24(sp)
    80009010:	01013903          	ld	s2,16(sp)
    80009014:	00813983          	ld	s3,8(sp)
    80009018:	03010113          	addi	sp,sp,48
    8000901c:	00008067          	ret

0000000080009020 <uartputc_sync>:
    80009020:	ff010113          	addi	sp,sp,-16
    80009024:	00813423          	sd	s0,8(sp)
    80009028:	01010413          	addi	s0,sp,16
    8000902c:	00004717          	auipc	a4,0x4
    80009030:	0ec72703          	lw	a4,236(a4) # 8000d118 <panicked>
    80009034:	02071663          	bnez	a4,80009060 <uartputc_sync+0x40>
    80009038:	00050793          	mv	a5,a0
    8000903c:	100006b7          	lui	a3,0x10000
    80009040:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80009044:	02077713          	andi	a4,a4,32
    80009048:	fe070ce3          	beqz	a4,80009040 <uartputc_sync+0x20>
    8000904c:	0ff7f793          	andi	a5,a5,255
    80009050:	00f68023          	sb	a5,0(a3)
    80009054:	00813403          	ld	s0,8(sp)
    80009058:	01010113          	addi	sp,sp,16
    8000905c:	00008067          	ret
    80009060:	0000006f          	j	80009060 <uartputc_sync+0x40>

0000000080009064 <uartstart>:
    80009064:	ff010113          	addi	sp,sp,-16
    80009068:	00813423          	sd	s0,8(sp)
    8000906c:	01010413          	addi	s0,sp,16
    80009070:	00004617          	auipc	a2,0x4
    80009074:	0b060613          	addi	a2,a2,176 # 8000d120 <uart_tx_r>
    80009078:	00004517          	auipc	a0,0x4
    8000907c:	0b050513          	addi	a0,a0,176 # 8000d128 <uart_tx_w>
    80009080:	00063783          	ld	a5,0(a2)
    80009084:	00053703          	ld	a4,0(a0)
    80009088:	04f70263          	beq	a4,a5,800090cc <uartstart+0x68>
    8000908c:	100005b7          	lui	a1,0x10000
    80009090:	00005817          	auipc	a6,0x5
    80009094:	4a080813          	addi	a6,a6,1184 # 8000e530 <uart_tx_buf>
    80009098:	01c0006f          	j	800090b4 <uartstart+0x50>
    8000909c:	0006c703          	lbu	a4,0(a3)
    800090a0:	00f63023          	sd	a5,0(a2)
    800090a4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800090a8:	00063783          	ld	a5,0(a2)
    800090ac:	00053703          	ld	a4,0(a0)
    800090b0:	00f70e63          	beq	a4,a5,800090cc <uartstart+0x68>
    800090b4:	01f7f713          	andi	a4,a5,31
    800090b8:	00e806b3          	add	a3,a6,a4
    800090bc:	0055c703          	lbu	a4,5(a1)
    800090c0:	00178793          	addi	a5,a5,1
    800090c4:	02077713          	andi	a4,a4,32
    800090c8:	fc071ae3          	bnez	a4,8000909c <uartstart+0x38>
    800090cc:	00813403          	ld	s0,8(sp)
    800090d0:	01010113          	addi	sp,sp,16
    800090d4:	00008067          	ret

00000000800090d8 <uartgetc>:
    800090d8:	ff010113          	addi	sp,sp,-16
    800090dc:	00813423          	sd	s0,8(sp)
    800090e0:	01010413          	addi	s0,sp,16
    800090e4:	10000737          	lui	a4,0x10000
    800090e8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800090ec:	0017f793          	andi	a5,a5,1
    800090f0:	00078c63          	beqz	a5,80009108 <uartgetc+0x30>
    800090f4:	00074503          	lbu	a0,0(a4)
    800090f8:	0ff57513          	andi	a0,a0,255
    800090fc:	00813403          	ld	s0,8(sp)
    80009100:	01010113          	addi	sp,sp,16
    80009104:	00008067          	ret
    80009108:	fff00513          	li	a0,-1
    8000910c:	ff1ff06f          	j	800090fc <uartgetc+0x24>

0000000080009110 <uartintr>:
    80009110:	100007b7          	lui	a5,0x10000
    80009114:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80009118:	0017f793          	andi	a5,a5,1
    8000911c:	0a078463          	beqz	a5,800091c4 <uartintr+0xb4>
    80009120:	fe010113          	addi	sp,sp,-32
    80009124:	00813823          	sd	s0,16(sp)
    80009128:	00913423          	sd	s1,8(sp)
    8000912c:	00113c23          	sd	ra,24(sp)
    80009130:	02010413          	addi	s0,sp,32
    80009134:	100004b7          	lui	s1,0x10000
    80009138:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000913c:	0ff57513          	andi	a0,a0,255
    80009140:	fffff097          	auipc	ra,0xfffff
    80009144:	534080e7          	jalr	1332(ra) # 80008674 <consoleintr>
    80009148:	0054c783          	lbu	a5,5(s1)
    8000914c:	0017f793          	andi	a5,a5,1
    80009150:	fe0794e3          	bnez	a5,80009138 <uartintr+0x28>
    80009154:	00004617          	auipc	a2,0x4
    80009158:	fcc60613          	addi	a2,a2,-52 # 8000d120 <uart_tx_r>
    8000915c:	00004517          	auipc	a0,0x4
    80009160:	fcc50513          	addi	a0,a0,-52 # 8000d128 <uart_tx_w>
    80009164:	00063783          	ld	a5,0(a2)
    80009168:	00053703          	ld	a4,0(a0)
    8000916c:	04f70263          	beq	a4,a5,800091b0 <uartintr+0xa0>
    80009170:	100005b7          	lui	a1,0x10000
    80009174:	00005817          	auipc	a6,0x5
    80009178:	3bc80813          	addi	a6,a6,956 # 8000e530 <uart_tx_buf>
    8000917c:	01c0006f          	j	80009198 <uartintr+0x88>
    80009180:	0006c703          	lbu	a4,0(a3)
    80009184:	00f63023          	sd	a5,0(a2)
    80009188:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000918c:	00063783          	ld	a5,0(a2)
    80009190:	00053703          	ld	a4,0(a0)
    80009194:	00f70e63          	beq	a4,a5,800091b0 <uartintr+0xa0>
    80009198:	01f7f713          	andi	a4,a5,31
    8000919c:	00e806b3          	add	a3,a6,a4
    800091a0:	0055c703          	lbu	a4,5(a1)
    800091a4:	00178793          	addi	a5,a5,1
    800091a8:	02077713          	andi	a4,a4,32
    800091ac:	fc071ae3          	bnez	a4,80009180 <uartintr+0x70>
    800091b0:	01813083          	ld	ra,24(sp)
    800091b4:	01013403          	ld	s0,16(sp)
    800091b8:	00813483          	ld	s1,8(sp)
    800091bc:	02010113          	addi	sp,sp,32
    800091c0:	00008067          	ret
    800091c4:	00004617          	auipc	a2,0x4
    800091c8:	f5c60613          	addi	a2,a2,-164 # 8000d120 <uart_tx_r>
    800091cc:	00004517          	auipc	a0,0x4
    800091d0:	f5c50513          	addi	a0,a0,-164 # 8000d128 <uart_tx_w>
    800091d4:	00063783          	ld	a5,0(a2)
    800091d8:	00053703          	ld	a4,0(a0)
    800091dc:	04f70263          	beq	a4,a5,80009220 <uartintr+0x110>
    800091e0:	100005b7          	lui	a1,0x10000
    800091e4:	00005817          	auipc	a6,0x5
    800091e8:	34c80813          	addi	a6,a6,844 # 8000e530 <uart_tx_buf>
    800091ec:	01c0006f          	j	80009208 <uartintr+0xf8>
    800091f0:	0006c703          	lbu	a4,0(a3)
    800091f4:	00f63023          	sd	a5,0(a2)
    800091f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800091fc:	00063783          	ld	a5,0(a2)
    80009200:	00053703          	ld	a4,0(a0)
    80009204:	02f70063          	beq	a4,a5,80009224 <uartintr+0x114>
    80009208:	01f7f713          	andi	a4,a5,31
    8000920c:	00e806b3          	add	a3,a6,a4
    80009210:	0055c703          	lbu	a4,5(a1)
    80009214:	00178793          	addi	a5,a5,1
    80009218:	02077713          	andi	a4,a4,32
    8000921c:	fc071ae3          	bnez	a4,800091f0 <uartintr+0xe0>
    80009220:	00008067          	ret
    80009224:	00008067          	ret

0000000080009228 <kinit>:
    80009228:	fc010113          	addi	sp,sp,-64
    8000922c:	02913423          	sd	s1,40(sp)
    80009230:	fffff7b7          	lui	a5,0xfffff
    80009234:	00006497          	auipc	s1,0x6
    80009238:	31b48493          	addi	s1,s1,795 # 8000f54f <end+0xfff>
    8000923c:	02813823          	sd	s0,48(sp)
    80009240:	01313c23          	sd	s3,24(sp)
    80009244:	00f4f4b3          	and	s1,s1,a5
    80009248:	02113c23          	sd	ra,56(sp)
    8000924c:	03213023          	sd	s2,32(sp)
    80009250:	01413823          	sd	s4,16(sp)
    80009254:	01513423          	sd	s5,8(sp)
    80009258:	04010413          	addi	s0,sp,64
    8000925c:	000017b7          	lui	a5,0x1
    80009260:	01100993          	li	s3,17
    80009264:	00f487b3          	add	a5,s1,a5
    80009268:	01b99993          	slli	s3,s3,0x1b
    8000926c:	06f9e063          	bltu	s3,a5,800092cc <kinit+0xa4>
    80009270:	00005a97          	auipc	s5,0x5
    80009274:	2e0a8a93          	addi	s5,s5,736 # 8000e550 <end>
    80009278:	0754ec63          	bltu	s1,s5,800092f0 <kinit+0xc8>
    8000927c:	0734fa63          	bgeu	s1,s3,800092f0 <kinit+0xc8>
    80009280:	00088a37          	lui	s4,0x88
    80009284:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80009288:	00004917          	auipc	s2,0x4
    8000928c:	ea890913          	addi	s2,s2,-344 # 8000d130 <kmem>
    80009290:	00ca1a13          	slli	s4,s4,0xc
    80009294:	0140006f          	j	800092a8 <kinit+0x80>
    80009298:	000017b7          	lui	a5,0x1
    8000929c:	00f484b3          	add	s1,s1,a5
    800092a0:	0554e863          	bltu	s1,s5,800092f0 <kinit+0xc8>
    800092a4:	0534f663          	bgeu	s1,s3,800092f0 <kinit+0xc8>
    800092a8:	00001637          	lui	a2,0x1
    800092ac:	00100593          	li	a1,1
    800092b0:	00048513          	mv	a0,s1
    800092b4:	00000097          	auipc	ra,0x0
    800092b8:	5e4080e7          	jalr	1508(ra) # 80009898 <__memset>
    800092bc:	00093783          	ld	a5,0(s2)
    800092c0:	00f4b023          	sd	a5,0(s1)
    800092c4:	00993023          	sd	s1,0(s2)
    800092c8:	fd4498e3          	bne	s1,s4,80009298 <kinit+0x70>
    800092cc:	03813083          	ld	ra,56(sp)
    800092d0:	03013403          	ld	s0,48(sp)
    800092d4:	02813483          	ld	s1,40(sp)
    800092d8:	02013903          	ld	s2,32(sp)
    800092dc:	01813983          	ld	s3,24(sp)
    800092e0:	01013a03          	ld	s4,16(sp)
    800092e4:	00813a83          	ld	s5,8(sp)
    800092e8:	04010113          	addi	sp,sp,64
    800092ec:	00008067          	ret
    800092f0:	00001517          	auipc	a0,0x1
    800092f4:	62850513          	addi	a0,a0,1576 # 8000a918 <digits+0x18>
    800092f8:	fffff097          	auipc	ra,0xfffff
    800092fc:	4b4080e7          	jalr	1204(ra) # 800087ac <panic>

0000000080009300 <freerange>:
    80009300:	fc010113          	addi	sp,sp,-64
    80009304:	000017b7          	lui	a5,0x1
    80009308:	02913423          	sd	s1,40(sp)
    8000930c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80009310:	009504b3          	add	s1,a0,s1
    80009314:	fffff537          	lui	a0,0xfffff
    80009318:	02813823          	sd	s0,48(sp)
    8000931c:	02113c23          	sd	ra,56(sp)
    80009320:	03213023          	sd	s2,32(sp)
    80009324:	01313c23          	sd	s3,24(sp)
    80009328:	01413823          	sd	s4,16(sp)
    8000932c:	01513423          	sd	s5,8(sp)
    80009330:	01613023          	sd	s6,0(sp)
    80009334:	04010413          	addi	s0,sp,64
    80009338:	00a4f4b3          	and	s1,s1,a0
    8000933c:	00f487b3          	add	a5,s1,a5
    80009340:	06f5e463          	bltu	a1,a5,800093a8 <freerange+0xa8>
    80009344:	00005a97          	auipc	s5,0x5
    80009348:	20ca8a93          	addi	s5,s5,524 # 8000e550 <end>
    8000934c:	0954e263          	bltu	s1,s5,800093d0 <freerange+0xd0>
    80009350:	01100993          	li	s3,17
    80009354:	01b99993          	slli	s3,s3,0x1b
    80009358:	0734fc63          	bgeu	s1,s3,800093d0 <freerange+0xd0>
    8000935c:	00058a13          	mv	s4,a1
    80009360:	00004917          	auipc	s2,0x4
    80009364:	dd090913          	addi	s2,s2,-560 # 8000d130 <kmem>
    80009368:	00002b37          	lui	s6,0x2
    8000936c:	0140006f          	j	80009380 <freerange+0x80>
    80009370:	000017b7          	lui	a5,0x1
    80009374:	00f484b3          	add	s1,s1,a5
    80009378:	0554ec63          	bltu	s1,s5,800093d0 <freerange+0xd0>
    8000937c:	0534fa63          	bgeu	s1,s3,800093d0 <freerange+0xd0>
    80009380:	00001637          	lui	a2,0x1
    80009384:	00100593          	li	a1,1
    80009388:	00048513          	mv	a0,s1
    8000938c:	00000097          	auipc	ra,0x0
    80009390:	50c080e7          	jalr	1292(ra) # 80009898 <__memset>
    80009394:	00093703          	ld	a4,0(s2)
    80009398:	016487b3          	add	a5,s1,s6
    8000939c:	00e4b023          	sd	a4,0(s1)
    800093a0:	00993023          	sd	s1,0(s2)
    800093a4:	fcfa76e3          	bgeu	s4,a5,80009370 <freerange+0x70>
    800093a8:	03813083          	ld	ra,56(sp)
    800093ac:	03013403          	ld	s0,48(sp)
    800093b0:	02813483          	ld	s1,40(sp)
    800093b4:	02013903          	ld	s2,32(sp)
    800093b8:	01813983          	ld	s3,24(sp)
    800093bc:	01013a03          	ld	s4,16(sp)
    800093c0:	00813a83          	ld	s5,8(sp)
    800093c4:	00013b03          	ld	s6,0(sp)
    800093c8:	04010113          	addi	sp,sp,64
    800093cc:	00008067          	ret
    800093d0:	00001517          	auipc	a0,0x1
    800093d4:	54850513          	addi	a0,a0,1352 # 8000a918 <digits+0x18>
    800093d8:	fffff097          	auipc	ra,0xfffff
    800093dc:	3d4080e7          	jalr	980(ra) # 800087ac <panic>

00000000800093e0 <kfree>:
    800093e0:	fe010113          	addi	sp,sp,-32
    800093e4:	00813823          	sd	s0,16(sp)
    800093e8:	00113c23          	sd	ra,24(sp)
    800093ec:	00913423          	sd	s1,8(sp)
    800093f0:	02010413          	addi	s0,sp,32
    800093f4:	03451793          	slli	a5,a0,0x34
    800093f8:	04079c63          	bnez	a5,80009450 <kfree+0x70>
    800093fc:	00005797          	auipc	a5,0x5
    80009400:	15478793          	addi	a5,a5,340 # 8000e550 <end>
    80009404:	00050493          	mv	s1,a0
    80009408:	04f56463          	bltu	a0,a5,80009450 <kfree+0x70>
    8000940c:	01100793          	li	a5,17
    80009410:	01b79793          	slli	a5,a5,0x1b
    80009414:	02f57e63          	bgeu	a0,a5,80009450 <kfree+0x70>
    80009418:	00001637          	lui	a2,0x1
    8000941c:	00100593          	li	a1,1
    80009420:	00000097          	auipc	ra,0x0
    80009424:	478080e7          	jalr	1144(ra) # 80009898 <__memset>
    80009428:	00004797          	auipc	a5,0x4
    8000942c:	d0878793          	addi	a5,a5,-760 # 8000d130 <kmem>
    80009430:	0007b703          	ld	a4,0(a5)
    80009434:	01813083          	ld	ra,24(sp)
    80009438:	01013403          	ld	s0,16(sp)
    8000943c:	00e4b023          	sd	a4,0(s1)
    80009440:	0097b023          	sd	s1,0(a5)
    80009444:	00813483          	ld	s1,8(sp)
    80009448:	02010113          	addi	sp,sp,32
    8000944c:	00008067          	ret
    80009450:	00001517          	auipc	a0,0x1
    80009454:	4c850513          	addi	a0,a0,1224 # 8000a918 <digits+0x18>
    80009458:	fffff097          	auipc	ra,0xfffff
    8000945c:	354080e7          	jalr	852(ra) # 800087ac <panic>

0000000080009460 <kalloc>:
    80009460:	fe010113          	addi	sp,sp,-32
    80009464:	00813823          	sd	s0,16(sp)
    80009468:	00913423          	sd	s1,8(sp)
    8000946c:	00113c23          	sd	ra,24(sp)
    80009470:	02010413          	addi	s0,sp,32
    80009474:	00004797          	auipc	a5,0x4
    80009478:	cbc78793          	addi	a5,a5,-836 # 8000d130 <kmem>
    8000947c:	0007b483          	ld	s1,0(a5)
    80009480:	02048063          	beqz	s1,800094a0 <kalloc+0x40>
    80009484:	0004b703          	ld	a4,0(s1)
    80009488:	00001637          	lui	a2,0x1
    8000948c:	00500593          	li	a1,5
    80009490:	00048513          	mv	a0,s1
    80009494:	00e7b023          	sd	a4,0(a5)
    80009498:	00000097          	auipc	ra,0x0
    8000949c:	400080e7          	jalr	1024(ra) # 80009898 <__memset>
    800094a0:	01813083          	ld	ra,24(sp)
    800094a4:	01013403          	ld	s0,16(sp)
    800094a8:	00048513          	mv	a0,s1
    800094ac:	00813483          	ld	s1,8(sp)
    800094b0:	02010113          	addi	sp,sp,32
    800094b4:	00008067          	ret

00000000800094b8 <initlock>:
    800094b8:	ff010113          	addi	sp,sp,-16
    800094bc:	00813423          	sd	s0,8(sp)
    800094c0:	01010413          	addi	s0,sp,16
    800094c4:	00813403          	ld	s0,8(sp)
    800094c8:	00b53423          	sd	a1,8(a0)
    800094cc:	00052023          	sw	zero,0(a0)
    800094d0:	00053823          	sd	zero,16(a0)
    800094d4:	01010113          	addi	sp,sp,16
    800094d8:	00008067          	ret

00000000800094dc <acquire>:
    800094dc:	fe010113          	addi	sp,sp,-32
    800094e0:	00813823          	sd	s0,16(sp)
    800094e4:	00913423          	sd	s1,8(sp)
    800094e8:	00113c23          	sd	ra,24(sp)
    800094ec:	01213023          	sd	s2,0(sp)
    800094f0:	02010413          	addi	s0,sp,32
    800094f4:	00050493          	mv	s1,a0
    800094f8:	10002973          	csrr	s2,sstatus
    800094fc:	100027f3          	csrr	a5,sstatus
    80009500:	ffd7f793          	andi	a5,a5,-3
    80009504:	10079073          	csrw	sstatus,a5
    80009508:	fffff097          	auipc	ra,0xfffff
    8000950c:	8e8080e7          	jalr	-1816(ra) # 80007df0 <mycpu>
    80009510:	07852783          	lw	a5,120(a0)
    80009514:	06078e63          	beqz	a5,80009590 <acquire+0xb4>
    80009518:	fffff097          	auipc	ra,0xfffff
    8000951c:	8d8080e7          	jalr	-1832(ra) # 80007df0 <mycpu>
    80009520:	07852783          	lw	a5,120(a0)
    80009524:	0004a703          	lw	a4,0(s1)
    80009528:	0017879b          	addiw	a5,a5,1
    8000952c:	06f52c23          	sw	a5,120(a0)
    80009530:	04071063          	bnez	a4,80009570 <acquire+0x94>
    80009534:	00100713          	li	a4,1
    80009538:	00070793          	mv	a5,a4
    8000953c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80009540:	0007879b          	sext.w	a5,a5
    80009544:	fe079ae3          	bnez	a5,80009538 <acquire+0x5c>
    80009548:	0ff0000f          	fence
    8000954c:	fffff097          	auipc	ra,0xfffff
    80009550:	8a4080e7          	jalr	-1884(ra) # 80007df0 <mycpu>
    80009554:	01813083          	ld	ra,24(sp)
    80009558:	01013403          	ld	s0,16(sp)
    8000955c:	00a4b823          	sd	a0,16(s1)
    80009560:	00013903          	ld	s2,0(sp)
    80009564:	00813483          	ld	s1,8(sp)
    80009568:	02010113          	addi	sp,sp,32
    8000956c:	00008067          	ret
    80009570:	0104b903          	ld	s2,16(s1)
    80009574:	fffff097          	auipc	ra,0xfffff
    80009578:	87c080e7          	jalr	-1924(ra) # 80007df0 <mycpu>
    8000957c:	faa91ce3          	bne	s2,a0,80009534 <acquire+0x58>
    80009580:	00001517          	auipc	a0,0x1
    80009584:	3a050513          	addi	a0,a0,928 # 8000a920 <digits+0x20>
    80009588:	fffff097          	auipc	ra,0xfffff
    8000958c:	224080e7          	jalr	548(ra) # 800087ac <panic>
    80009590:	00195913          	srli	s2,s2,0x1
    80009594:	fffff097          	auipc	ra,0xfffff
    80009598:	85c080e7          	jalr	-1956(ra) # 80007df0 <mycpu>
    8000959c:	00197913          	andi	s2,s2,1
    800095a0:	07252e23          	sw	s2,124(a0)
    800095a4:	f75ff06f          	j	80009518 <acquire+0x3c>

00000000800095a8 <release>:
    800095a8:	fe010113          	addi	sp,sp,-32
    800095ac:	00813823          	sd	s0,16(sp)
    800095b0:	00113c23          	sd	ra,24(sp)
    800095b4:	00913423          	sd	s1,8(sp)
    800095b8:	01213023          	sd	s2,0(sp)
    800095bc:	02010413          	addi	s0,sp,32
    800095c0:	00052783          	lw	a5,0(a0)
    800095c4:	00079a63          	bnez	a5,800095d8 <release+0x30>
    800095c8:	00001517          	auipc	a0,0x1
    800095cc:	36050513          	addi	a0,a0,864 # 8000a928 <digits+0x28>
    800095d0:	fffff097          	auipc	ra,0xfffff
    800095d4:	1dc080e7          	jalr	476(ra) # 800087ac <panic>
    800095d8:	01053903          	ld	s2,16(a0)
    800095dc:	00050493          	mv	s1,a0
    800095e0:	fffff097          	auipc	ra,0xfffff
    800095e4:	810080e7          	jalr	-2032(ra) # 80007df0 <mycpu>
    800095e8:	fea910e3          	bne	s2,a0,800095c8 <release+0x20>
    800095ec:	0004b823          	sd	zero,16(s1)
    800095f0:	0ff0000f          	fence
    800095f4:	0f50000f          	fence	iorw,ow
    800095f8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800095fc:	ffffe097          	auipc	ra,0xffffe
    80009600:	7f4080e7          	jalr	2036(ra) # 80007df0 <mycpu>
    80009604:	100027f3          	csrr	a5,sstatus
    80009608:	0027f793          	andi	a5,a5,2
    8000960c:	04079a63          	bnez	a5,80009660 <release+0xb8>
    80009610:	07852783          	lw	a5,120(a0)
    80009614:	02f05e63          	blez	a5,80009650 <release+0xa8>
    80009618:	fff7871b          	addiw	a4,a5,-1
    8000961c:	06e52c23          	sw	a4,120(a0)
    80009620:	00071c63          	bnez	a4,80009638 <release+0x90>
    80009624:	07c52783          	lw	a5,124(a0)
    80009628:	00078863          	beqz	a5,80009638 <release+0x90>
    8000962c:	100027f3          	csrr	a5,sstatus
    80009630:	0027e793          	ori	a5,a5,2
    80009634:	10079073          	csrw	sstatus,a5
    80009638:	01813083          	ld	ra,24(sp)
    8000963c:	01013403          	ld	s0,16(sp)
    80009640:	00813483          	ld	s1,8(sp)
    80009644:	00013903          	ld	s2,0(sp)
    80009648:	02010113          	addi	sp,sp,32
    8000964c:	00008067          	ret
    80009650:	00001517          	auipc	a0,0x1
    80009654:	2f850513          	addi	a0,a0,760 # 8000a948 <digits+0x48>
    80009658:	fffff097          	auipc	ra,0xfffff
    8000965c:	154080e7          	jalr	340(ra) # 800087ac <panic>
    80009660:	00001517          	auipc	a0,0x1
    80009664:	2d050513          	addi	a0,a0,720 # 8000a930 <digits+0x30>
    80009668:	fffff097          	auipc	ra,0xfffff
    8000966c:	144080e7          	jalr	324(ra) # 800087ac <panic>

0000000080009670 <holding>:
    80009670:	00052783          	lw	a5,0(a0)
    80009674:	00079663          	bnez	a5,80009680 <holding+0x10>
    80009678:	00000513          	li	a0,0
    8000967c:	00008067          	ret
    80009680:	fe010113          	addi	sp,sp,-32
    80009684:	00813823          	sd	s0,16(sp)
    80009688:	00913423          	sd	s1,8(sp)
    8000968c:	00113c23          	sd	ra,24(sp)
    80009690:	02010413          	addi	s0,sp,32
    80009694:	01053483          	ld	s1,16(a0)
    80009698:	ffffe097          	auipc	ra,0xffffe
    8000969c:	758080e7          	jalr	1880(ra) # 80007df0 <mycpu>
    800096a0:	01813083          	ld	ra,24(sp)
    800096a4:	01013403          	ld	s0,16(sp)
    800096a8:	40a48533          	sub	a0,s1,a0
    800096ac:	00153513          	seqz	a0,a0
    800096b0:	00813483          	ld	s1,8(sp)
    800096b4:	02010113          	addi	sp,sp,32
    800096b8:	00008067          	ret

00000000800096bc <push_off>:
    800096bc:	fe010113          	addi	sp,sp,-32
    800096c0:	00813823          	sd	s0,16(sp)
    800096c4:	00113c23          	sd	ra,24(sp)
    800096c8:	00913423          	sd	s1,8(sp)
    800096cc:	02010413          	addi	s0,sp,32
    800096d0:	100024f3          	csrr	s1,sstatus
    800096d4:	100027f3          	csrr	a5,sstatus
    800096d8:	ffd7f793          	andi	a5,a5,-3
    800096dc:	10079073          	csrw	sstatus,a5
    800096e0:	ffffe097          	auipc	ra,0xffffe
    800096e4:	710080e7          	jalr	1808(ra) # 80007df0 <mycpu>
    800096e8:	07852783          	lw	a5,120(a0)
    800096ec:	02078663          	beqz	a5,80009718 <push_off+0x5c>
    800096f0:	ffffe097          	auipc	ra,0xffffe
    800096f4:	700080e7          	jalr	1792(ra) # 80007df0 <mycpu>
    800096f8:	07852783          	lw	a5,120(a0)
    800096fc:	01813083          	ld	ra,24(sp)
    80009700:	01013403          	ld	s0,16(sp)
    80009704:	0017879b          	addiw	a5,a5,1
    80009708:	06f52c23          	sw	a5,120(a0)
    8000970c:	00813483          	ld	s1,8(sp)
    80009710:	02010113          	addi	sp,sp,32
    80009714:	00008067          	ret
    80009718:	0014d493          	srli	s1,s1,0x1
    8000971c:	ffffe097          	auipc	ra,0xffffe
    80009720:	6d4080e7          	jalr	1748(ra) # 80007df0 <mycpu>
    80009724:	0014f493          	andi	s1,s1,1
    80009728:	06952e23          	sw	s1,124(a0)
    8000972c:	fc5ff06f          	j	800096f0 <push_off+0x34>

0000000080009730 <pop_off>:
    80009730:	ff010113          	addi	sp,sp,-16
    80009734:	00813023          	sd	s0,0(sp)
    80009738:	00113423          	sd	ra,8(sp)
    8000973c:	01010413          	addi	s0,sp,16
    80009740:	ffffe097          	auipc	ra,0xffffe
    80009744:	6b0080e7          	jalr	1712(ra) # 80007df0 <mycpu>
    80009748:	100027f3          	csrr	a5,sstatus
    8000974c:	0027f793          	andi	a5,a5,2
    80009750:	04079663          	bnez	a5,8000979c <pop_off+0x6c>
    80009754:	07852783          	lw	a5,120(a0)
    80009758:	02f05a63          	blez	a5,8000978c <pop_off+0x5c>
    8000975c:	fff7871b          	addiw	a4,a5,-1
    80009760:	06e52c23          	sw	a4,120(a0)
    80009764:	00071c63          	bnez	a4,8000977c <pop_off+0x4c>
    80009768:	07c52783          	lw	a5,124(a0)
    8000976c:	00078863          	beqz	a5,8000977c <pop_off+0x4c>
    80009770:	100027f3          	csrr	a5,sstatus
    80009774:	0027e793          	ori	a5,a5,2
    80009778:	10079073          	csrw	sstatus,a5
    8000977c:	00813083          	ld	ra,8(sp)
    80009780:	00013403          	ld	s0,0(sp)
    80009784:	01010113          	addi	sp,sp,16
    80009788:	00008067          	ret
    8000978c:	00001517          	auipc	a0,0x1
    80009790:	1bc50513          	addi	a0,a0,444 # 8000a948 <digits+0x48>
    80009794:	fffff097          	auipc	ra,0xfffff
    80009798:	018080e7          	jalr	24(ra) # 800087ac <panic>
    8000979c:	00001517          	auipc	a0,0x1
    800097a0:	19450513          	addi	a0,a0,404 # 8000a930 <digits+0x30>
    800097a4:	fffff097          	auipc	ra,0xfffff
    800097a8:	008080e7          	jalr	8(ra) # 800087ac <panic>

00000000800097ac <push_on>:
    800097ac:	fe010113          	addi	sp,sp,-32
    800097b0:	00813823          	sd	s0,16(sp)
    800097b4:	00113c23          	sd	ra,24(sp)
    800097b8:	00913423          	sd	s1,8(sp)
    800097bc:	02010413          	addi	s0,sp,32
    800097c0:	100024f3          	csrr	s1,sstatus
    800097c4:	100027f3          	csrr	a5,sstatus
    800097c8:	0027e793          	ori	a5,a5,2
    800097cc:	10079073          	csrw	sstatus,a5
    800097d0:	ffffe097          	auipc	ra,0xffffe
    800097d4:	620080e7          	jalr	1568(ra) # 80007df0 <mycpu>
    800097d8:	07852783          	lw	a5,120(a0)
    800097dc:	02078663          	beqz	a5,80009808 <push_on+0x5c>
    800097e0:	ffffe097          	auipc	ra,0xffffe
    800097e4:	610080e7          	jalr	1552(ra) # 80007df0 <mycpu>
    800097e8:	07852783          	lw	a5,120(a0)
    800097ec:	01813083          	ld	ra,24(sp)
    800097f0:	01013403          	ld	s0,16(sp)
    800097f4:	0017879b          	addiw	a5,a5,1
    800097f8:	06f52c23          	sw	a5,120(a0)
    800097fc:	00813483          	ld	s1,8(sp)
    80009800:	02010113          	addi	sp,sp,32
    80009804:	00008067          	ret
    80009808:	0014d493          	srli	s1,s1,0x1
    8000980c:	ffffe097          	auipc	ra,0xffffe
    80009810:	5e4080e7          	jalr	1508(ra) # 80007df0 <mycpu>
    80009814:	0014f493          	andi	s1,s1,1
    80009818:	06952e23          	sw	s1,124(a0)
    8000981c:	fc5ff06f          	j	800097e0 <push_on+0x34>

0000000080009820 <pop_on>:
    80009820:	ff010113          	addi	sp,sp,-16
    80009824:	00813023          	sd	s0,0(sp)
    80009828:	00113423          	sd	ra,8(sp)
    8000982c:	01010413          	addi	s0,sp,16
    80009830:	ffffe097          	auipc	ra,0xffffe
    80009834:	5c0080e7          	jalr	1472(ra) # 80007df0 <mycpu>
    80009838:	100027f3          	csrr	a5,sstatus
    8000983c:	0027f793          	andi	a5,a5,2
    80009840:	04078463          	beqz	a5,80009888 <pop_on+0x68>
    80009844:	07852783          	lw	a5,120(a0)
    80009848:	02f05863          	blez	a5,80009878 <pop_on+0x58>
    8000984c:	fff7879b          	addiw	a5,a5,-1
    80009850:	06f52c23          	sw	a5,120(a0)
    80009854:	07853783          	ld	a5,120(a0)
    80009858:	00079863          	bnez	a5,80009868 <pop_on+0x48>
    8000985c:	100027f3          	csrr	a5,sstatus
    80009860:	ffd7f793          	andi	a5,a5,-3
    80009864:	10079073          	csrw	sstatus,a5
    80009868:	00813083          	ld	ra,8(sp)
    8000986c:	00013403          	ld	s0,0(sp)
    80009870:	01010113          	addi	sp,sp,16
    80009874:	00008067          	ret
    80009878:	00001517          	auipc	a0,0x1
    8000987c:	0f850513          	addi	a0,a0,248 # 8000a970 <digits+0x70>
    80009880:	fffff097          	auipc	ra,0xfffff
    80009884:	f2c080e7          	jalr	-212(ra) # 800087ac <panic>
    80009888:	00001517          	auipc	a0,0x1
    8000988c:	0c850513          	addi	a0,a0,200 # 8000a950 <digits+0x50>
    80009890:	fffff097          	auipc	ra,0xfffff
    80009894:	f1c080e7          	jalr	-228(ra) # 800087ac <panic>

0000000080009898 <__memset>:
    80009898:	ff010113          	addi	sp,sp,-16
    8000989c:	00813423          	sd	s0,8(sp)
    800098a0:	01010413          	addi	s0,sp,16
    800098a4:	1a060e63          	beqz	a2,80009a60 <__memset+0x1c8>
    800098a8:	40a007b3          	neg	a5,a0
    800098ac:	0077f793          	andi	a5,a5,7
    800098b0:	00778693          	addi	a3,a5,7
    800098b4:	00b00813          	li	a6,11
    800098b8:	0ff5f593          	andi	a1,a1,255
    800098bc:	fff6071b          	addiw	a4,a2,-1
    800098c0:	1b06e663          	bltu	a3,a6,80009a6c <__memset+0x1d4>
    800098c4:	1cd76463          	bltu	a4,a3,80009a8c <__memset+0x1f4>
    800098c8:	1a078e63          	beqz	a5,80009a84 <__memset+0x1ec>
    800098cc:	00b50023          	sb	a1,0(a0)
    800098d0:	00100713          	li	a4,1
    800098d4:	1ae78463          	beq	a5,a4,80009a7c <__memset+0x1e4>
    800098d8:	00b500a3          	sb	a1,1(a0)
    800098dc:	00200713          	li	a4,2
    800098e0:	1ae78a63          	beq	a5,a4,80009a94 <__memset+0x1fc>
    800098e4:	00b50123          	sb	a1,2(a0)
    800098e8:	00300713          	li	a4,3
    800098ec:	18e78463          	beq	a5,a4,80009a74 <__memset+0x1dc>
    800098f0:	00b501a3          	sb	a1,3(a0)
    800098f4:	00400713          	li	a4,4
    800098f8:	1ae78263          	beq	a5,a4,80009a9c <__memset+0x204>
    800098fc:	00b50223          	sb	a1,4(a0)
    80009900:	00500713          	li	a4,5
    80009904:	1ae78063          	beq	a5,a4,80009aa4 <__memset+0x20c>
    80009908:	00b502a3          	sb	a1,5(a0)
    8000990c:	00700713          	li	a4,7
    80009910:	18e79e63          	bne	a5,a4,80009aac <__memset+0x214>
    80009914:	00b50323          	sb	a1,6(a0)
    80009918:	00700e93          	li	t4,7
    8000991c:	00859713          	slli	a4,a1,0x8
    80009920:	00e5e733          	or	a4,a1,a4
    80009924:	01059e13          	slli	t3,a1,0x10
    80009928:	01c76e33          	or	t3,a4,t3
    8000992c:	01859313          	slli	t1,a1,0x18
    80009930:	006e6333          	or	t1,t3,t1
    80009934:	02059893          	slli	a7,a1,0x20
    80009938:	40f60e3b          	subw	t3,a2,a5
    8000993c:	011368b3          	or	a7,t1,a7
    80009940:	02859813          	slli	a6,a1,0x28
    80009944:	0108e833          	or	a6,a7,a6
    80009948:	03059693          	slli	a3,a1,0x30
    8000994c:	003e589b          	srliw	a7,t3,0x3
    80009950:	00d866b3          	or	a3,a6,a3
    80009954:	03859713          	slli	a4,a1,0x38
    80009958:	00389813          	slli	a6,a7,0x3
    8000995c:	00f507b3          	add	a5,a0,a5
    80009960:	00e6e733          	or	a4,a3,a4
    80009964:	000e089b          	sext.w	a7,t3
    80009968:	00f806b3          	add	a3,a6,a5
    8000996c:	00e7b023          	sd	a4,0(a5)
    80009970:	00878793          	addi	a5,a5,8
    80009974:	fed79ce3          	bne	a5,a3,8000996c <__memset+0xd4>
    80009978:	ff8e7793          	andi	a5,t3,-8
    8000997c:	0007871b          	sext.w	a4,a5
    80009980:	01d787bb          	addw	a5,a5,t4
    80009984:	0ce88e63          	beq	a7,a4,80009a60 <__memset+0x1c8>
    80009988:	00f50733          	add	a4,a0,a5
    8000998c:	00b70023          	sb	a1,0(a4)
    80009990:	0017871b          	addiw	a4,a5,1
    80009994:	0cc77663          	bgeu	a4,a2,80009a60 <__memset+0x1c8>
    80009998:	00e50733          	add	a4,a0,a4
    8000999c:	00b70023          	sb	a1,0(a4)
    800099a0:	0027871b          	addiw	a4,a5,2
    800099a4:	0ac77e63          	bgeu	a4,a2,80009a60 <__memset+0x1c8>
    800099a8:	00e50733          	add	a4,a0,a4
    800099ac:	00b70023          	sb	a1,0(a4)
    800099b0:	0037871b          	addiw	a4,a5,3
    800099b4:	0ac77663          	bgeu	a4,a2,80009a60 <__memset+0x1c8>
    800099b8:	00e50733          	add	a4,a0,a4
    800099bc:	00b70023          	sb	a1,0(a4)
    800099c0:	0047871b          	addiw	a4,a5,4
    800099c4:	08c77e63          	bgeu	a4,a2,80009a60 <__memset+0x1c8>
    800099c8:	00e50733          	add	a4,a0,a4
    800099cc:	00b70023          	sb	a1,0(a4)
    800099d0:	0057871b          	addiw	a4,a5,5
    800099d4:	08c77663          	bgeu	a4,a2,80009a60 <__memset+0x1c8>
    800099d8:	00e50733          	add	a4,a0,a4
    800099dc:	00b70023          	sb	a1,0(a4)
    800099e0:	0067871b          	addiw	a4,a5,6
    800099e4:	06c77e63          	bgeu	a4,a2,80009a60 <__memset+0x1c8>
    800099e8:	00e50733          	add	a4,a0,a4
    800099ec:	00b70023          	sb	a1,0(a4)
    800099f0:	0077871b          	addiw	a4,a5,7
    800099f4:	06c77663          	bgeu	a4,a2,80009a60 <__memset+0x1c8>
    800099f8:	00e50733          	add	a4,a0,a4
    800099fc:	00b70023          	sb	a1,0(a4)
    80009a00:	0087871b          	addiw	a4,a5,8
    80009a04:	04c77e63          	bgeu	a4,a2,80009a60 <__memset+0x1c8>
    80009a08:	00e50733          	add	a4,a0,a4
    80009a0c:	00b70023          	sb	a1,0(a4)
    80009a10:	0097871b          	addiw	a4,a5,9
    80009a14:	04c77663          	bgeu	a4,a2,80009a60 <__memset+0x1c8>
    80009a18:	00e50733          	add	a4,a0,a4
    80009a1c:	00b70023          	sb	a1,0(a4)
    80009a20:	00a7871b          	addiw	a4,a5,10
    80009a24:	02c77e63          	bgeu	a4,a2,80009a60 <__memset+0x1c8>
    80009a28:	00e50733          	add	a4,a0,a4
    80009a2c:	00b70023          	sb	a1,0(a4)
    80009a30:	00b7871b          	addiw	a4,a5,11
    80009a34:	02c77663          	bgeu	a4,a2,80009a60 <__memset+0x1c8>
    80009a38:	00e50733          	add	a4,a0,a4
    80009a3c:	00b70023          	sb	a1,0(a4)
    80009a40:	00c7871b          	addiw	a4,a5,12
    80009a44:	00c77e63          	bgeu	a4,a2,80009a60 <__memset+0x1c8>
    80009a48:	00e50733          	add	a4,a0,a4
    80009a4c:	00b70023          	sb	a1,0(a4)
    80009a50:	00d7879b          	addiw	a5,a5,13
    80009a54:	00c7f663          	bgeu	a5,a2,80009a60 <__memset+0x1c8>
    80009a58:	00f507b3          	add	a5,a0,a5
    80009a5c:	00b78023          	sb	a1,0(a5)
    80009a60:	00813403          	ld	s0,8(sp)
    80009a64:	01010113          	addi	sp,sp,16
    80009a68:	00008067          	ret
    80009a6c:	00b00693          	li	a3,11
    80009a70:	e55ff06f          	j	800098c4 <__memset+0x2c>
    80009a74:	00300e93          	li	t4,3
    80009a78:	ea5ff06f          	j	8000991c <__memset+0x84>
    80009a7c:	00100e93          	li	t4,1
    80009a80:	e9dff06f          	j	8000991c <__memset+0x84>
    80009a84:	00000e93          	li	t4,0
    80009a88:	e95ff06f          	j	8000991c <__memset+0x84>
    80009a8c:	00000793          	li	a5,0
    80009a90:	ef9ff06f          	j	80009988 <__memset+0xf0>
    80009a94:	00200e93          	li	t4,2
    80009a98:	e85ff06f          	j	8000991c <__memset+0x84>
    80009a9c:	00400e93          	li	t4,4
    80009aa0:	e7dff06f          	j	8000991c <__memset+0x84>
    80009aa4:	00500e93          	li	t4,5
    80009aa8:	e75ff06f          	j	8000991c <__memset+0x84>
    80009aac:	00600e93          	li	t4,6
    80009ab0:	e6dff06f          	j	8000991c <__memset+0x84>

0000000080009ab4 <__memmove>:
    80009ab4:	ff010113          	addi	sp,sp,-16
    80009ab8:	00813423          	sd	s0,8(sp)
    80009abc:	01010413          	addi	s0,sp,16
    80009ac0:	0e060863          	beqz	a2,80009bb0 <__memmove+0xfc>
    80009ac4:	fff6069b          	addiw	a3,a2,-1
    80009ac8:	0006881b          	sext.w	a6,a3
    80009acc:	0ea5e863          	bltu	a1,a0,80009bbc <__memmove+0x108>
    80009ad0:	00758713          	addi	a4,a1,7
    80009ad4:	00a5e7b3          	or	a5,a1,a0
    80009ad8:	40a70733          	sub	a4,a4,a0
    80009adc:	0077f793          	andi	a5,a5,7
    80009ae0:	00f73713          	sltiu	a4,a4,15
    80009ae4:	00174713          	xori	a4,a4,1
    80009ae8:	0017b793          	seqz	a5,a5
    80009aec:	00e7f7b3          	and	a5,a5,a4
    80009af0:	10078863          	beqz	a5,80009c00 <__memmove+0x14c>
    80009af4:	00900793          	li	a5,9
    80009af8:	1107f463          	bgeu	a5,a6,80009c00 <__memmove+0x14c>
    80009afc:	0036581b          	srliw	a6,a2,0x3
    80009b00:	fff8081b          	addiw	a6,a6,-1
    80009b04:	02081813          	slli	a6,a6,0x20
    80009b08:	01d85893          	srli	a7,a6,0x1d
    80009b0c:	00858813          	addi	a6,a1,8
    80009b10:	00058793          	mv	a5,a1
    80009b14:	00050713          	mv	a4,a0
    80009b18:	01088833          	add	a6,a7,a6
    80009b1c:	0007b883          	ld	a7,0(a5)
    80009b20:	00878793          	addi	a5,a5,8
    80009b24:	00870713          	addi	a4,a4,8
    80009b28:	ff173c23          	sd	a7,-8(a4)
    80009b2c:	ff0798e3          	bne	a5,a6,80009b1c <__memmove+0x68>
    80009b30:	ff867713          	andi	a4,a2,-8
    80009b34:	02071793          	slli	a5,a4,0x20
    80009b38:	0207d793          	srli	a5,a5,0x20
    80009b3c:	00f585b3          	add	a1,a1,a5
    80009b40:	40e686bb          	subw	a3,a3,a4
    80009b44:	00f507b3          	add	a5,a0,a5
    80009b48:	06e60463          	beq	a2,a4,80009bb0 <__memmove+0xfc>
    80009b4c:	0005c703          	lbu	a4,0(a1)
    80009b50:	00e78023          	sb	a4,0(a5)
    80009b54:	04068e63          	beqz	a3,80009bb0 <__memmove+0xfc>
    80009b58:	0015c603          	lbu	a2,1(a1)
    80009b5c:	00100713          	li	a4,1
    80009b60:	00c780a3          	sb	a2,1(a5)
    80009b64:	04e68663          	beq	a3,a4,80009bb0 <__memmove+0xfc>
    80009b68:	0025c603          	lbu	a2,2(a1)
    80009b6c:	00200713          	li	a4,2
    80009b70:	00c78123          	sb	a2,2(a5)
    80009b74:	02e68e63          	beq	a3,a4,80009bb0 <__memmove+0xfc>
    80009b78:	0035c603          	lbu	a2,3(a1)
    80009b7c:	00300713          	li	a4,3
    80009b80:	00c781a3          	sb	a2,3(a5)
    80009b84:	02e68663          	beq	a3,a4,80009bb0 <__memmove+0xfc>
    80009b88:	0045c603          	lbu	a2,4(a1)
    80009b8c:	00400713          	li	a4,4
    80009b90:	00c78223          	sb	a2,4(a5)
    80009b94:	00e68e63          	beq	a3,a4,80009bb0 <__memmove+0xfc>
    80009b98:	0055c603          	lbu	a2,5(a1)
    80009b9c:	00500713          	li	a4,5
    80009ba0:	00c782a3          	sb	a2,5(a5)
    80009ba4:	00e68663          	beq	a3,a4,80009bb0 <__memmove+0xfc>
    80009ba8:	0065c703          	lbu	a4,6(a1)
    80009bac:	00e78323          	sb	a4,6(a5)
    80009bb0:	00813403          	ld	s0,8(sp)
    80009bb4:	01010113          	addi	sp,sp,16
    80009bb8:	00008067          	ret
    80009bbc:	02061713          	slli	a4,a2,0x20
    80009bc0:	02075713          	srli	a4,a4,0x20
    80009bc4:	00e587b3          	add	a5,a1,a4
    80009bc8:	f0f574e3          	bgeu	a0,a5,80009ad0 <__memmove+0x1c>
    80009bcc:	02069613          	slli	a2,a3,0x20
    80009bd0:	02065613          	srli	a2,a2,0x20
    80009bd4:	fff64613          	not	a2,a2
    80009bd8:	00e50733          	add	a4,a0,a4
    80009bdc:	00c78633          	add	a2,a5,a2
    80009be0:	fff7c683          	lbu	a3,-1(a5)
    80009be4:	fff78793          	addi	a5,a5,-1
    80009be8:	fff70713          	addi	a4,a4,-1
    80009bec:	00d70023          	sb	a3,0(a4)
    80009bf0:	fec798e3          	bne	a5,a2,80009be0 <__memmove+0x12c>
    80009bf4:	00813403          	ld	s0,8(sp)
    80009bf8:	01010113          	addi	sp,sp,16
    80009bfc:	00008067          	ret
    80009c00:	02069713          	slli	a4,a3,0x20
    80009c04:	02075713          	srli	a4,a4,0x20
    80009c08:	00170713          	addi	a4,a4,1
    80009c0c:	00e50733          	add	a4,a0,a4
    80009c10:	00050793          	mv	a5,a0
    80009c14:	0005c683          	lbu	a3,0(a1)
    80009c18:	00178793          	addi	a5,a5,1
    80009c1c:	00158593          	addi	a1,a1,1
    80009c20:	fed78fa3          	sb	a3,-1(a5)
    80009c24:	fee798e3          	bne	a5,a4,80009c14 <__memmove+0x160>
    80009c28:	f89ff06f          	j	80009bb0 <__memmove+0xfc>
	...
