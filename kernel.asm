
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	0e013103          	ld	sp,224(sp) # 8000d0e0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	4b9070ef          	jal	ra,80007cd4 <start>

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
    80001084:	019010ef          	jal	ra,8000289c <interruptRoutine>

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
    80001430:	cc47b783          	ld	a5,-828(a5) # 8000d0f0 <_GLOBAL_OFFSET_TABLE_+0x68>
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
    8000167c:	a787b783          	ld	a5,-1416(a5) # 8000d0f0 <_GLOBAL_OFFSET_TABLE_+0x68>
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
    80001710:	a747c783          	lbu	a5,-1420(a5) # 8000d180 <_ZN8KConsole11initializedE>
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
    80001734:	a5048493          	addi	s1,s1,-1456 # 8000d180 <_ZN8KConsole11initializedE>
    80001738:	0000c797          	auipc	a5,0xc
    8000173c:	9607b783          	ld	a5,-1696(a5) # 8000d098 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001740:	0007b783          	ld	a5,0(a5)
    80001744:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    80001748:	0000c797          	auipc	a5,0xc
    8000174c:	9607b783          	ld	a5,-1696(a5) # 8000d0a8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001750:	0007b783          	ld	a5,0(a5)
    80001754:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    80001758:	03200593          	li	a1,50
    8000175c:	0000c517          	auipc	a0,0xc
    80001760:	a3c50513          	addi	a0,a0,-1476 # 8000d198 <_ZN8KConsole19inputBufferHasSpaceE>
    80001764:	00000097          	auipc	ra,0x0
    80001768:	dd4080e7          	jalr	-556(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    8000176c:	03200593          	li	a1,50
    80001770:	0000c517          	auipc	a0,0xc
    80001774:	a3050513          	addi	a0,a0,-1488 # 8000d1a0 <_ZN8KConsole20outputBufferHasSpaceE>
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	dc0080e7          	jalr	-576(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    80001780:	00000593          	li	a1,0
    80001784:	0000c517          	auipc	a0,0xc
    80001788:	a2450513          	addi	a0,a0,-1500 # 8000d1a8 <_ZN8KConsole12charsToInputE>
    8000178c:	00000097          	auipc	ra,0x0
    80001790:	dac080e7          	jalr	-596(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    80001794:	00000593          	li	a1,0
    80001798:	0000c517          	auipc	a0,0xc
    8000179c:	a1850513          	addi	a0,a0,-1512 # 8000d1b0 <_ZN8KConsole13charsToOutputE>
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
    800017dc:	9a848493          	addi	s1,s1,-1624 # 8000d180 <_ZN8KConsole11initializedE>
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
    80001820:	9d872703          	lw	a4,-1576(a4) # 8000d1f4 <_ZN8KConsole15inputBufferSizeE>
    80001824:	03200793          	li	a5,50
    80001828:	04f70e63          	beq	a4,a5,80001884 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    8000182c:	ff010113          	addi	sp,sp,-16
    80001830:	00113423          	sd	ra,8(sp)
    80001834:	00813023          	sd	s0,0(sp)
    80001838:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    8000183c:	0000c697          	auipc	a3,0xc
    80001840:	94468693          	addi	a3,a3,-1724 # 8000d180 <_ZN8KConsole11initializedE>
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
    800018a8:	8dc48493          	addi	s1,s1,-1828 # 8000d180 <_ZN8KConsole11initializedE>
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
    80001910:	87448493          	addi	s1,s1,-1932 # 8000d180 <_ZN8KConsole11initializedE>
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

000000008000195c <_Z6sumRowPv>:
    int len;
    int num;
};

void sumRow(void* rowd) {
    if (!rowd) return;
    8000195c:	0c050063          	beqz	a0,80001a1c <_Z6sumRowPv+0xc0>
void sumRow(void* rowd) {
    80001960:	fd010113          	addi	sp,sp,-48
    80001964:	02113423          	sd	ra,40(sp)
    80001968:	02813023          	sd	s0,32(sp)
    8000196c:	00913c23          	sd	s1,24(sp)
    80001970:	03010413          	addi	s0,sp,48
    rowdesc rd = *(rowdesc*)rowd;
    80001974:	00053783          	ld	a5,0(a0)
    80001978:	fcf43823          	sd	a5,-48(s0)
    8000197c:	00853783          	ld	a5,8(a0)
    80001980:	fcf43c23          	sd	a5,-40(s0)
    uint64 sum = 0;
    for (int i = 0; i < rd.len; i++) {
    80001984:	00000793          	li	a5,0
    uint64 sum = 0;
    80001988:	00000493          	li	s1,0
    for (int i = 0; i < rd.len; i++) {
    8000198c:	fd842703          	lw	a4,-40(s0)
    80001990:	02e7d063          	bge	a5,a4,800019b0 <_Z6sumRowPv+0x54>
        sum += rd.row[i];
    80001994:	00379693          	slli	a3,a5,0x3
    80001998:	fd043703          	ld	a4,-48(s0)
    8000199c:	00d70733          	add	a4,a4,a3
    800019a0:	00073703          	ld	a4,0(a4)
    800019a4:	00e484b3          	add	s1,s1,a4
    for (int i = 0; i < rd.len; i++) {
    800019a8:	0017879b          	addiw	a5,a5,1
    800019ac:	fe1ff06f          	j	8000198c <_Z6sumRowPv+0x30>
    }
    printString("Suma reda ");
    800019b0:	00008517          	auipc	a0,0x8
    800019b4:	67050513          	addi	a0,a0,1648 # 8000a020 <CONSOLE_STATUS+0x10>
    800019b8:	00005097          	auipc	ra,0x5
    800019bc:	b2c080e7          	jalr	-1236(ra) # 800064e4 <_Z11printStringPKc>
    printInt(rd.num);
    800019c0:	00000613          	li	a2,0
    800019c4:	00a00593          	li	a1,10
    800019c8:	fdc42503          	lw	a0,-36(s0)
    800019cc:	00005097          	auipc	ra,0x5
    800019d0:	cc8080e7          	jalr	-824(ra) # 80006694 <_Z8printIntiii>
    printString(". = ");
    800019d4:	00008517          	auipc	a0,0x8
    800019d8:	65c50513          	addi	a0,a0,1628 # 8000a030 <CONSOLE_STATUS+0x20>
    800019dc:	00005097          	auipc	ra,0x5
    800019e0:	b08080e7          	jalr	-1272(ra) # 800064e4 <_Z11printStringPKc>
    printInt(sum);
    800019e4:	00000613          	li	a2,0
    800019e8:	00a00593          	li	a1,10
    800019ec:	0004851b          	sext.w	a0,s1
    800019f0:	00005097          	auipc	ra,0x5
    800019f4:	ca4080e7          	jalr	-860(ra) # 80006694 <_Z8printIntiii>
    printString("\n");
    800019f8:	00009517          	auipc	a0,0x9
    800019fc:	ca050513          	addi	a0,a0,-864 # 8000a698 <CONSOLE_STATUS+0x688>
    80001a00:	00005097          	auipc	ra,0x5
    80001a04:	ae4080e7          	jalr	-1308(ra) # 800064e4 <_Z11printStringPKc>
}
    80001a08:	02813083          	ld	ra,40(sp)
    80001a0c:	02013403          	ld	s0,32(sp)
    80001a10:	01813483          	ld	s1,24(sp)
    80001a14:	03010113          	addi	sp,sp,48
    80001a18:	00008067          	ret
    80001a1c:	00008067          	ret

0000000080001a20 <_ZL2f3Pv>:
static void f3(void* end) {
    80001a20:	fe010113          	addi	sp,sp,-32
    80001a24:	00113c23          	sd	ra,24(sp)
    80001a28:	00813823          	sd	s0,16(sp)
    80001a2c:	00913423          	sd	s1,8(sp)
    80001a30:	01213023          	sd	s2,0(sp)
    80001a34:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t*)end);
    80001a38:	00053903          	ld	s2,0(a0)
    int i = 6;
    80001a3c:	00600493          	li	s1,6
    while (--i > 0) {
    80001a40:	fff4849b          	addiw	s1,s1,-1
    80001a44:	04905463          	blez	s1,80001a8c <_ZL2f3Pv+0x6c>
        printString("Hello ");
    80001a48:	00008517          	auipc	a0,0x8
    80001a4c:	5f050513          	addi	a0,a0,1520 # 8000a038 <CONSOLE_STATUS+0x28>
    80001a50:	00005097          	auipc	ra,0x5
    80001a54:	a94080e7          	jalr	-1388(ra) # 800064e4 <_Z11printStringPKc>
        printInt(sleep_time);
    80001a58:	00000613          	li	a2,0
    80001a5c:	00a00593          	li	a1,10
    80001a60:	0009051b          	sext.w	a0,s2
    80001a64:	00005097          	auipc	ra,0x5
    80001a68:	c30080e7          	jalr	-976(ra) # 80006694 <_Z8printIntiii>
        printString(" !\n");
    80001a6c:	00008517          	auipc	a0,0x8
    80001a70:	5d450513          	addi	a0,a0,1492 # 8000a040 <CONSOLE_STATUS+0x30>
    80001a74:	00005097          	auipc	ra,0x5
    80001a78:	a70080e7          	jalr	-1424(ra) # 800064e4 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80001a7c:	00090513          	mv	a0,s2
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	a88080e7          	jalr	-1400(ra) # 80001508 <_Z10time_sleepm>
    while (--i > 0) {
    80001a88:	fb9ff06f          	j	80001a40 <_ZL2f3Pv+0x20>
}
    80001a8c:	01813083          	ld	ra,24(sp)
    80001a90:	01013403          	ld	s0,16(sp)
    80001a94:	00813483          	ld	s1,8(sp)
    80001a98:	00013903          	ld	s2,0(sp)
    80001a9c:	02010113          	addi	sp,sp,32
    80001aa0:	00008067          	ret

0000000080001aa4 <_Z4factm>:
    if (i <= 1) return 1;
    80001aa4:	00100793          	li	a5,1
    80001aa8:	04a7fa63          	bgeu	a5,a0,80001afc <_Z4factm+0x58>
uint64 fact(uint64 i) {
    80001aac:	fe010113          	addi	sp,sp,-32
    80001ab0:	00113c23          	sd	ra,24(sp)
    80001ab4:	00813823          	sd	s0,16(sp)
    80001ab8:	00913423          	sd	s1,8(sp)
    80001abc:	02010413          	addi	s0,sp,32
    80001ac0:	00050493          	mv	s1,a0
    if (i % 2) thread_dispatch();
    80001ac4:	00157793          	andi	a5,a0,1
    80001ac8:	02079463          	bnez	a5,80001af0 <_Z4factm+0x4c>
    return i * fact(i - 1);
    80001acc:	fff48513          	addi	a0,s1,-1
    80001ad0:	00000097          	auipc	ra,0x0
    80001ad4:	fd4080e7          	jalr	-44(ra) # 80001aa4 <_Z4factm>
    80001ad8:	02a48533          	mul	a0,s1,a0
}
    80001adc:	01813083          	ld	ra,24(sp)
    80001ae0:	01013403          	ld	s0,16(sp)
    80001ae4:	00813483          	ld	s1,8(sp)
    80001ae8:	02010113          	addi	sp,sp,32
    80001aec:	00008067          	ret
    if (i % 2) thread_dispatch();
    80001af0:	00000097          	auipc	ra,0x0
    80001af4:	9d0080e7          	jalr	-1584(ra) # 800014c0 <_Z15thread_dispatchv>
    80001af8:	fd5ff06f          	j	80001acc <_Z4factm+0x28>
    if (i <= 1) return 1;
    80001afc:	00100513          	li	a0,1
}
    80001b00:	00008067          	ret

0000000080001b04 <_Z2f1Pv>:
void f1(void* end) {
    80001b04:	fe010113          	addi	sp,sp,-32
    80001b08:	00113c23          	sd	ra,24(sp)
    80001b0c:	00813823          	sd	s0,16(sp)
    80001b10:	00913423          	sd	s1,8(sp)
    80001b14:	02010413          	addi	s0,sp,32
    uint64 i = fact(*(uint64*)end);
    80001b18:	00053503          	ld	a0,0(a0)
    80001b1c:	00000097          	auipc	ra,0x0
    80001b20:	f88080e7          	jalr	-120(ra) # 80001aa4 <_Z4factm>
    80001b24:	00050493          	mv	s1,a0
    printString("f1: i=");
    80001b28:	00008517          	auipc	a0,0x8
    80001b2c:	52050513          	addi	a0,a0,1312 # 8000a048 <CONSOLE_STATUS+0x38>
    80001b30:	00005097          	auipc	ra,0x5
    80001b34:	9b4080e7          	jalr	-1612(ra) # 800064e4 <_Z11printStringPKc>
    printInt(i);
    80001b38:	00000613          	li	a2,0
    80001b3c:	00a00593          	li	a1,10
    80001b40:	0004851b          	sext.w	a0,s1
    80001b44:	00005097          	auipc	ra,0x5
    80001b48:	b50080e7          	jalr	-1200(ra) # 80006694 <_Z8printIntiii>
    printString("\nGotova nit 1\n");
    80001b4c:	00008517          	auipc	a0,0x8
    80001b50:	50450513          	addi	a0,a0,1284 # 8000a050 <CONSOLE_STATUS+0x40>
    80001b54:	00005097          	auipc	ra,0x5
    80001b58:	990080e7          	jalr	-1648(ra) # 800064e4 <_Z11printStringPKc>
}
    80001b5c:	01813083          	ld	ra,24(sp)
    80001b60:	01013403          	ld	s0,16(sp)
    80001b64:	00813483          	ld	s1,8(sp)
    80001b68:	02010113          	addi	sp,sp,32
    80001b6c:	00008067          	ret

0000000080001b70 <_Z2f2Pv>:
void f2(void* end) {
    80001b70:	fe010113          	addi	sp,sp,-32
    80001b74:	00113c23          	sd	ra,24(sp)
    80001b78:	00813823          	sd	s0,16(sp)
    80001b7c:	00913423          	sd	s1,8(sp)
    80001b80:	02010413          	addi	s0,sp,32
    uint64 i = fact(20);
    80001b84:	01400513          	li	a0,20
    80001b88:	00000097          	auipc	ra,0x0
    80001b8c:	f1c080e7          	jalr	-228(ra) # 80001aa4 <_Z4factm>
    80001b90:	00050493          	mv	s1,a0
    printString("f2: i=");
    80001b94:	00008517          	auipc	a0,0x8
    80001b98:	4cc50513          	addi	a0,a0,1228 # 8000a060 <CONSOLE_STATUS+0x50>
    80001b9c:	00005097          	auipc	ra,0x5
    80001ba0:	948080e7          	jalr	-1720(ra) # 800064e4 <_Z11printStringPKc>
    printInt(i);
    80001ba4:	00000613          	li	a2,0
    80001ba8:	00a00593          	li	a1,10
    80001bac:	0004851b          	sext.w	a0,s1
    80001bb0:	00005097          	auipc	ra,0x5
    80001bb4:	ae4080e7          	jalr	-1308(ra) # 80006694 <_Z8printIntiii>
    printString("\nGotova nit 2\n");
    80001bb8:	00008517          	auipc	a0,0x8
    80001bbc:	4b050513          	addi	a0,a0,1200 # 8000a068 <CONSOLE_STATUS+0x58>
    80001bc0:	00005097          	auipc	ra,0x5
    80001bc4:	924080e7          	jalr	-1756(ra) # 800064e4 <_Z11printStringPKc>
}
    80001bc8:	01813083          	ld	ra,24(sp)
    80001bcc:	01013403          	ld	s0,16(sp)
    80001bd0:	00813483          	ld	s1,8(sp)
    80001bd4:	02010113          	addi	sp,sp,32
    80001bd8:	00008067          	ret

0000000080001bdc <_Z4userPv>:

void user(void*) {
    80001bdc:	bd010113          	addi	sp,sp,-1072
    80001be0:	42113423          	sd	ra,1064(sp)
    80001be4:	42813023          	sd	s0,1056(sp)
    80001be8:	40913c23          	sd	s1,1048(sp)
    80001bec:	41213823          	sd	s2,1040(sp)
    80001bf0:	43010413          	addi	s0,sp,1072
    const int dim = 10;
    uint64 matrix[dim][dim];
    for (int i = 0; i < dim; i++) {
    80001bf4:	00000913          	li	s2,0
    80001bf8:	09c0006f          	j	80001c94 <_Z4userPv+0xb8>
        for (int j = 0; j < dim; j++) {
            matrix[i][j] = ((i * 10 + j) * ((i+j) * j ^ i<<j)) % 100;
            printInt(matrix[i][j]);
            if (j == dim - 1) printString("\n");
    80001bfc:	00009517          	auipc	a0,0x9
    80001c00:	a9c50513          	addi	a0,a0,-1380 # 8000a698 <CONSOLE_STATUS+0x688>
    80001c04:	00005097          	auipc	ra,0x5
    80001c08:	8e0080e7          	jalr	-1824(ra) # 800064e4 <_Z11printStringPKc>
        for (int j = 0; j < dim; j++) {
    80001c0c:	0014849b          	addiw	s1,s1,1
    80001c10:	00900793          	li	a5,9
    80001c14:	0697ce63          	blt	a5,s1,80001c90 <_Z4userPv+0xb4>
            matrix[i][j] = ((i * 10 + j) * ((i+j) * j ^ i<<j)) % 100;
    80001c18:	0029179b          	slliw	a5,s2,0x2
    80001c1c:	012787bb          	addw	a5,a5,s2
    80001c20:	0017951b          	slliw	a0,a5,0x1
    80001c24:	0095053b          	addw	a0,a0,s1
    80001c28:	009907bb          	addw	a5,s2,s1
    80001c2c:	029787bb          	mulw	a5,a5,s1
    80001c30:	0099173b          	sllw	a4,s2,s1
    80001c34:	00e7c7b3          	xor	a5,a5,a4
    80001c38:	02f5053b          	mulw	a0,a0,a5
    80001c3c:	06400793          	li	a5,100
    80001c40:	02f5653b          	remw	a0,a0,a5
    80001c44:	00291713          	slli	a4,s2,0x2
    80001c48:	01270733          	add	a4,a4,s2
    80001c4c:	00171793          	slli	a5,a4,0x1
    80001c50:	009787b3          	add	a5,a5,s1
    80001c54:	00379793          	slli	a5,a5,0x3
    80001c58:	fe040713          	addi	a4,s0,-32
    80001c5c:	00f707b3          	add	a5,a4,a5
    80001c60:	cea7b023          	sd	a0,-800(a5)
            printInt(matrix[i][j]);
    80001c64:	00000613          	li	a2,0
    80001c68:	00a00593          	li	a1,10
    80001c6c:	00005097          	auipc	ra,0x5
    80001c70:	a28080e7          	jalr	-1496(ra) # 80006694 <_Z8printIntiii>
            if (j == dim - 1) printString("\n");
    80001c74:	00900793          	li	a5,9
    80001c78:	f8f482e3          	beq	s1,a5,80001bfc <_Z4userPv+0x20>
            else printString(" ");
    80001c7c:	00008517          	auipc	a0,0x8
    80001c80:	3fc50513          	addi	a0,a0,1020 # 8000a078 <CONSOLE_STATUS+0x68>
    80001c84:	00005097          	auipc	ra,0x5
    80001c88:	860080e7          	jalr	-1952(ra) # 800064e4 <_Z11printStringPKc>
    80001c8c:	f81ff06f          	j	80001c0c <_Z4userPv+0x30>
    for (int i = 0; i < dim; i++) {
    80001c90:	0019091b          	addiw	s2,s2,1
    80001c94:	00900793          	li	a5,9
    80001c98:	0127c663          	blt	a5,s2,80001ca4 <_Z4userPv+0xc8>
        for (int j = 0; j < dim; j++) {
    80001c9c:	00000493          	li	s1,0
    80001ca0:	f71ff06f          	j	80001c10 <_Z4userPv+0x34>
        }
    }
    thread_t handles[dim];
    rowdesc rds[dim];
    for (int i = 0; i < dim; i++) {
    80001ca4:	00000493          	li	s1,0
    80001ca8:	00900793          	li	a5,9
    80001cac:	0697c063          	blt	a5,s1,80001d0c <_Z4userPv+0x130>

        rds[i].row = matrix[i];
    80001cb0:	00249793          	slli	a5,s1,0x2
    80001cb4:	009787b3          	add	a5,a5,s1
    80001cb8:	00479693          	slli	a3,a5,0x4
    80001cbc:	cc040713          	addi	a4,s0,-832
    80001cc0:	00d70733          	add	a4,a4,a3
    80001cc4:	00449693          	slli	a3,s1,0x4
    80001cc8:	fe040793          	addi	a5,s0,-32
    80001ccc:	00d787b3          	add	a5,a5,a3
    80001cd0:	bee7b823          	sd	a4,-1040(a5)
        rds[i].len = dim;
    80001cd4:	00a00713          	li	a4,10
    80001cd8:	bee7ac23          	sw	a4,-1032(a5)
        rds[i].num = i;
    80001cdc:	be97ae23          	sw	s1,-1028(a5)
        thread_create(&handles[i], sumRow, &rds[i]);
    80001ce0:	00349793          	slli	a5,s1,0x3
    80001ce4:	bd040613          	addi	a2,s0,-1072
    80001ce8:	00d60633          	add	a2,a2,a3
    80001cec:	00000597          	auipc	a1,0x0
    80001cf0:	c7058593          	addi	a1,a1,-912 # 8000195c <_Z6sumRowPv>
    80001cf4:	c7040513          	addi	a0,s0,-912
    80001cf8:	00f50533          	add	a0,a0,a5
    80001cfc:	fffff097          	auipc	ra,0xfffff
    80001d00:	708080e7          	jalr	1800(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < dim; i++) {
    80001d04:	0014849b          	addiw	s1,s1,1
    80001d08:	fa1ff06f          	j	80001ca8 <_Z4userPv+0xcc>
    }
    for (int i = 0; i < dim; i++) {
    80001d0c:	00000493          	li	s1,0
    80001d10:	00900793          	li	a5,9
    80001d14:	0297c263          	blt	a5,s1,80001d38 <_Z4userPv+0x15c>
        thread_join(handles[i]);
    80001d18:	00349793          	slli	a5,s1,0x3
    80001d1c:	fe040713          	addi	a4,s0,-32
    80001d20:	00f707b3          	add	a5,a4,a5
    80001d24:	c907b503          	ld	a0,-880(a5)
    80001d28:	fffff097          	auipc	ra,0xfffff
    80001d2c:	7b8080e7          	jalr	1976(ra) # 800014e0 <_Z11thread_joinP3TCB>
    for (int i = 0; i < dim; i++) {
    80001d30:	0014849b          	addiw	s1,s1,1
    80001d34:	fddff06f          	j	80001d10 <_Z4userPv+0x134>
    }
}
    80001d38:	42813083          	ld	ra,1064(sp)
    80001d3c:	42013403          	ld	s0,1056(sp)
    80001d40:	41813483          	ld	s1,1048(sp)
    80001d44:	41013903          	ld	s2,1040(sp)
    80001d48:	43010113          	addi	sp,sp,1072
    80001d4c:	00008067          	ret

0000000080001d50 <_Z5user2Pv>:

void user2(void*) {
    80001d50:	f9010113          	addi	sp,sp,-112
    80001d54:	06113423          	sd	ra,104(sp)
    80001d58:	06813023          	sd	s0,96(sp)
    80001d5c:	04913c23          	sd	s1,88(sp)
    80001d60:	07010413          	addi	s0,sp,112
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80001d64:	00a00793          	li	a5,10
    80001d68:	fcf43823          	sd	a5,-48(s0)
    80001d6c:	01400793          	li	a5,20
    80001d70:	fcf43c23          	sd	a5,-40(s0)
    explicit timer1() : PeriodicThread(1) {}
    80001d74:	00100593          	li	a1,1
    80001d78:	f9040493          	addi	s1,s0,-112
    80001d7c:	00048513          	mv	a0,s1
    80001d80:	00002097          	auipc	ra,0x2
    80001d84:	900080e7          	jalr	-1792(ra) # 80003680 <_ZN14PeriodicThreadC1Em>
    80001d88:	0000b797          	auipc	a5,0xb
    80001d8c:	06878793          	addi	a5,a5,104 # 8000cdf0 <_ZTV6timer1+0x10>
    80001d90:	f8f43823          	sd	a5,-112(s0)
    80001d94:	fa042c23          	sw	zero,-72(s0)
    thread_t sleepyThread[sleepy_thread_count];
    timer1 t;
    t.start();
    80001d98:	00048513          	mv	a0,s1
    80001d9c:	00001097          	auipc	ra,0x1
    80001da0:	670080e7          	jalr	1648(ra) # 8000340c <_ZN6Thread5startEv>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80001da4:	00000493          	li	s1,0
    80001da8:	0080006f          	j	80001db0 <_Z5user2Pv+0x60>
    80001dac:	0014849b          	addiw	s1,s1,1
    80001db0:	00100793          	li	a5,1
    80001db4:	0297c663          	blt	a5,s1,80001de0 <_Z5user2Pv+0x90>
        thread_create(&sleepyThread[i], f3, sleep_times + i);
    80001db8:	00349513          	slli	a0,s1,0x3
    80001dbc:	fd040613          	addi	a2,s0,-48
    80001dc0:	00a60633          	add	a2,a2,a0
    80001dc4:	00000597          	auipc	a1,0x0
    80001dc8:	c5c58593          	addi	a1,a1,-932 # 80001a20 <_ZL2f3Pv>
    80001dcc:	fc040793          	addi	a5,s0,-64
    80001dd0:	00a78533          	add	a0,a5,a0
    80001dd4:	fffff097          	auipc	ra,0xfffff
    80001dd8:	630080e7          	jalr	1584(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    80001ddc:	fd1ff06f          	j	80001dac <_Z5user2Pv+0x5c>
    }

    thread_join(sleepyThread[0]);
    80001de0:	fc043503          	ld	a0,-64(s0)
    80001de4:	fffff097          	auipc	ra,0xfffff
    80001de8:	6fc080e7          	jalr	1788(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(sleepyThread[1]);
    80001dec:	fc843503          	ld	a0,-56(s0)
    80001df0:	fffff097          	auipc	ra,0xfffff
    80001df4:	6f0080e7          	jalr	1776(ra) # 800014e0 <_Z11thread_joinP3TCB>
    t.terminate();
    80001df8:	f9040513          	addi	a0,s0,-112
    80001dfc:	00002097          	auipc	ra,0x2
    80001e00:	854080e7          	jalr	-1964(ra) # 80003650 <_ZN14PeriodicThread9terminateEv>
    //t.join();
    printString("izlazim iz user 2\n");
    80001e04:	00008517          	auipc	a0,0x8
    80001e08:	27c50513          	addi	a0,a0,636 # 8000a080 <CONSOLE_STATUS+0x70>
    80001e0c:	00004097          	auipc	ra,0x4
    80001e10:	6d8080e7          	jalr	1752(ra) # 800064e4 <_Z11printStringPKc>
private:
    sem_t myHandle;
};


class PeriodicThread : public Thread {
    80001e14:	0000b797          	auipc	a5,0xb
    80001e18:	2ac7b783          	ld	a5,684(a5) # 8000d0c0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001e1c:	01078793          	addi	a5,a5,16
    80001e20:	f8f43823          	sd	a5,-112(s0)
    80001e24:	f9040513          	addi	a0,s0,-112
    80001e28:	00001097          	auipc	ra,0x1
    80001e2c:	378080e7          	jalr	888(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80001e30:	06813083          	ld	ra,104(sp)
    80001e34:	06013403          	ld	s0,96(sp)
    80001e38:	05813483          	ld	s1,88(sp)
    80001e3c:	07010113          	addi	sp,sp,112
    80001e40:	00008067          	ret
    80001e44:	00050493          	mv	s1,a0
    80001e48:	0000b797          	auipc	a5,0xb
    80001e4c:	2787b783          	ld	a5,632(a5) # 8000d0c0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001e50:	01078793          	addi	a5,a5,16
    80001e54:	f8f43823          	sd	a5,-112(s0)
    80001e58:	f9040513          	addi	a0,s0,-112
    80001e5c:	00001097          	auipc	ra,0x1
    80001e60:	344080e7          	jalr	836(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80001e64:	00048513          	mv	a0,s1
    80001e68:	0000c097          	auipc	ra,0xc
    80001e6c:	570080e7          	jalr	1392(ra) # 8000e3d8 <_Unwind_Resume>

0000000080001e70 <_ZN6timer118periodicActivationEv>:
    void periodicActivation() override {
    80001e70:	fe010113          	addi	sp,sp,-32
    80001e74:	00113c23          	sd	ra,24(sp)
    80001e78:	00813823          	sd	s0,16(sp)
    80001e7c:	00913423          	sd	s1,8(sp)
    80001e80:	02010413          	addi	s0,sp,32
    80001e84:	00050493          	mv	s1,a0
        printString("Tajmer: ");
    80001e88:	00008517          	auipc	a0,0x8
    80001e8c:	21050513          	addi	a0,a0,528 # 8000a098 <CONSOLE_STATUS+0x88>
    80001e90:	00004097          	auipc	ra,0x4
    80001e94:	654080e7          	jalr	1620(ra) # 800064e4 <_Z11printStringPKc>
        printInt(counter++);
    80001e98:	0284a503          	lw	a0,40(s1)
    80001e9c:	0015079b          	addiw	a5,a0,1
    80001ea0:	02f4a423          	sw	a5,40(s1)
    80001ea4:	00000613          	li	a2,0
    80001ea8:	00a00593          	li	a1,10
    80001eac:	00004097          	auipc	ra,0x4
    80001eb0:	7e8080e7          	jalr	2024(ra) # 80006694 <_Z8printIntiii>
        printString("\n");
    80001eb4:	00008517          	auipc	a0,0x8
    80001eb8:	7e450513          	addi	a0,a0,2020 # 8000a698 <CONSOLE_STATUS+0x688>
    80001ebc:	00004097          	auipc	ra,0x4
    80001ec0:	628080e7          	jalr	1576(ra) # 800064e4 <_Z11printStringPKc>
    }
    80001ec4:	01813083          	ld	ra,24(sp)
    80001ec8:	01013403          	ld	s0,16(sp)
    80001ecc:	00813483          	ld	s1,8(sp)
    80001ed0:	02010113          	addi	sp,sp,32
    80001ed4:	00008067          	ret

0000000080001ed8 <_ZN6timer1D1Ev>:
class timer1 : public PeriodicThread {
    80001ed8:	ff010113          	addi	sp,sp,-16
    80001edc:	00113423          	sd	ra,8(sp)
    80001ee0:	00813023          	sd	s0,0(sp)
    80001ee4:	01010413          	addi	s0,sp,16
    80001ee8:	0000b797          	auipc	a5,0xb
    80001eec:	1d87b783          	ld	a5,472(a5) # 8000d0c0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001ef0:	01078793          	addi	a5,a5,16
    80001ef4:	00f53023          	sd	a5,0(a0)
    80001ef8:	00001097          	auipc	ra,0x1
    80001efc:	2a8080e7          	jalr	680(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80001f00:	00813083          	ld	ra,8(sp)
    80001f04:	00013403          	ld	s0,0(sp)
    80001f08:	01010113          	addi	sp,sp,16
    80001f0c:	00008067          	ret

0000000080001f10 <_ZN6timer1D0Ev>:
    80001f10:	fe010113          	addi	sp,sp,-32
    80001f14:	00113c23          	sd	ra,24(sp)
    80001f18:	00813823          	sd	s0,16(sp)
    80001f1c:	00913423          	sd	s1,8(sp)
    80001f20:	02010413          	addi	s0,sp,32
    80001f24:	00050493          	mv	s1,a0
    80001f28:	0000b797          	auipc	a5,0xb
    80001f2c:	1987b783          	ld	a5,408(a5) # 8000d0c0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001f30:	01078793          	addi	a5,a5,16
    80001f34:	00f53023          	sd	a5,0(a0)
    80001f38:	00001097          	auipc	ra,0x1
    80001f3c:	268080e7          	jalr	616(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80001f40:	00048513          	mv	a0,s1
    80001f44:	00001097          	auipc	ra,0x1
    80001f48:	360080e7          	jalr	864(ra) # 800032a4 <_ZdlPv>
    80001f4c:	01813083          	ld	ra,24(sp)
    80001f50:	01013403          	ld	s0,16(sp)
    80001f54:	00813483          	ld	s1,8(sp)
    80001f58:	02010113          	addi	sp,sp,32
    80001f5c:	00008067          	ret

0000000080001f60 <_ZN9Scheduler3putEP3TCB>:

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    80001f60:	ff010113          	addi	sp,sp,-16
    80001f64:	00813423          	sd	s0,8(sp)
    80001f68:	01010413          	addi	s0,sp,16
    if (tail == nullptr) {
    80001f6c:	0000b797          	auipc	a5,0xb
    80001f70:	2ec7b783          	ld	a5,748(a5) # 8000d258 <_ZN9Scheduler4tailE>
    80001f74:	02078263          	beqz	a5,80001f98 <_ZN9Scheduler3putEP3TCB+0x38>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    80001f78:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    80001f7c:	0000b797          	auipc	a5,0xb
    80001f80:	2ca7be23          	sd	a0,732(a5) # 8000d258 <_ZN9Scheduler4tailE>
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    static TCB* createThread(Body function, void* args, uint64* stack);

    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001f84:	00100793          	li	a5,1
    80001f88:	04f52c23          	sw	a5,88(a0)
    }
    tcb->setStatus(TCB::ACTIVE);
}
    80001f8c:	00813403          	ld	s0,8(sp)
    80001f90:	01010113          	addi	sp,sp,16
    80001f94:	00008067          	ret
        head = tail = tcb;
    80001f98:	0000b797          	auipc	a5,0xb
    80001f9c:	2c078793          	addi	a5,a5,704 # 8000d258 <_ZN9Scheduler4tailE>
    80001fa0:	00a7b023          	sd	a0,0(a5)
    80001fa4:	00a7b423          	sd	a0,8(a5)
    80001fa8:	fddff06f          	j	80001f84 <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001fac <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001fac:	ff010113          	addi	sp,sp,-16
    80001fb0:	00813423          	sd	s0,8(sp)
    80001fb4:	01010413          	addi	s0,sp,16
    TCB* firstThread = head;
    80001fb8:	0000b717          	auipc	a4,0xb
    80001fbc:	2a070713          	addi	a4,a4,672 # 8000d258 <_ZN9Scheduler4tailE>
    80001fc0:	00873503          	ld	a0,8(a4)
    head = head->nextInScheduler;
    80001fc4:	03053783          	ld	a5,48(a0)
    80001fc8:	00f73423          	sd	a5,8(a4)
    if (head == nullptr) {
    80001fcc:	00078a63          	beqz	a5,80001fe0 <_ZN9Scheduler3getEv+0x34>
        tail = head = nullptr;
    }
    firstThread->nextInScheduler = nullptr;
    80001fd0:	02053823          	sd	zero,48(a0)
    return firstThread;
}
    80001fd4:	00813403          	ld	s0,8(sp)
    80001fd8:	01010113          	addi	sp,sp,16
    80001fdc:	00008067          	ret
        tail = head = nullptr;
    80001fe0:	00073423          	sd	zero,8(a4)
    80001fe4:	00073023          	sd	zero,0(a4)
    80001fe8:	fe9ff06f          	j	80001fd0 <_ZN9Scheduler3getEv+0x24>

0000000080001fec <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    80001fec:	ff010113          	addi	sp,sp,-16
    80001ff0:	00813423          	sd	s0,8(sp)
    80001ff4:	01010413          	addi	s0,sp,16
    tcb->status = TCB::SLEEPING;
    80001ff8:	00400793          	li	a5,4
    80001ffc:	04f52c23          	sw	a5,88(a0)
    if (sleepingHead == nullptr) {
    80002000:	0000b817          	auipc	a6,0xb
    80002004:	26883803          	ld	a6,616(a6) # 8000d268 <_ZN9Scheduler12sleepingHeadE>
    80002008:	02080863          	beqz	a6,80002038 <_ZN9Scheduler10putToSleepEP3TCBm+0x4c>
        tcb->timeToSleep = sleepTime;
        return;
    }
    TCB* prevSleeping = nullptr;
    time_t accumulated = 0;
    TCB* current = sleepingHead;
    8000200c:	00080793          	mv	a5,a6
    time_t accumulated = 0;
    80002010:	00000693          	li	a3,0
    TCB* prevSleeping = nullptr;
    80002014:	00000613          	li	a2,0
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80002018:	02078863          	beqz	a5,80002048 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
    8000201c:	0387b703          	ld	a4,56(a5)
    80002020:	00d70733          	add	a4,a4,a3
    80002024:	02b77263          	bgeu	a4,a1,80002048 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
        accumulated += current->timeToSleep;
    80002028:	00070693          	mv	a3,a4
        prevSleeping = current;
    8000202c:	00078613          	mv	a2,a5
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80002030:	0407b783          	ld	a5,64(a5)
    80002034:	fe5ff06f          	j	80002018 <_ZN9Scheduler10putToSleepEP3TCBm+0x2c>
        sleepingHead = tcb;
    80002038:	0000b797          	auipc	a5,0xb
    8000203c:	22a7b823          	sd	a0,560(a5) # 8000d268 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80002040:	02b53c23          	sd	a1,56(a0)
        return;
    80002044:	02c0006f          	j	80002070 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    }
    if (!prevSleeping) {
    80002048:	02060a63          	beqz	a2,8000207c <_ZN9Scheduler10putToSleepEP3TCBm+0x90>
        sleepingHead = tcb;
        tcb->timeToSleep = sleepTime;
        tcb->nextSleeping->timeToSleep -= sleepTime;
        return;
    }
    tcb->nextSleeping = current;
    8000204c:	04f53023          	sd	a5,64(a0)
    prevSleeping->nextSleeping = tcb;
    80002050:	04a63023          	sd	a0,64(a2)
    tcb->timeToSleep = sleepTime - accumulated;
    80002054:	40d58733          	sub	a4,a1,a3
    80002058:	02e53c23          	sd	a4,56(a0)
    if (current) current->timeToSleep -= sleepTime - accumulated;
    8000205c:	00078a63          	beqz	a5,80002070 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    80002060:	40b686b3          	sub	a3,a3,a1
    80002064:	0387b703          	ld	a4,56(a5)
    80002068:	00d706b3          	add	a3,a4,a3
    8000206c:	02d7bc23          	sd	a3,56(a5)
}
    80002070:	00813403          	ld	s0,8(sp)
    80002074:	01010113          	addi	sp,sp,16
    80002078:	00008067          	ret
        tcb->nextSleeping = sleepingHead;
    8000207c:	05053023          	sd	a6,64(a0)
        sleepingHead = tcb;
    80002080:	0000b797          	auipc	a5,0xb
    80002084:	1ea7b423          	sd	a0,488(a5) # 8000d268 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80002088:	02b53c23          	sd	a1,56(a0)
        tcb->nextSleeping->timeToSleep -= sleepTime;
    8000208c:	03883683          	ld	a3,56(a6)
    80002090:	40b686b3          	sub	a3,a3,a1
    80002094:	02d83c23          	sd	a3,56(a6)
        return;
    80002098:	fd9ff06f          	j	80002070 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>

000000008000209c <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
    if (!sleepingHead) return;
    8000209c:	0000b797          	auipc	a5,0xb
    800020a0:	1cc7b783          	ld	a5,460(a5) # 8000d268 <_ZN9Scheduler12sleepingHeadE>
    800020a4:	06078a63          	beqz	a5,80002118 <_ZN9Scheduler4wakeEv+0x7c>
    sleepingHead->timeToSleep--;
    800020a8:	0387b703          	ld	a4,56(a5)
    800020ac:	fff70713          	addi	a4,a4,-1
    800020b0:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    800020b4:	0000b517          	auipc	a0,0xb
    800020b8:	1b453503          	ld	a0,436(a0) # 8000d268 <_ZN9Scheduler12sleepingHeadE>
    800020bc:	04050e63          	beqz	a0,80002118 <_ZN9Scheduler4wakeEv+0x7c>
    800020c0:	03853783          	ld	a5,56(a0)
    800020c4:	04079a63          	bnez	a5,80002118 <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    800020c8:	ff010113          	addi	sp,sp,-16
    800020cc:	00113423          	sd	ra,8(sp)
    800020d0:	00813023          	sd	s0,0(sp)
    800020d4:	01010413          	addi	s0,sp,16
    800020d8:	00c0006f          	j	800020e4 <_ZN9Scheduler4wakeEv+0x48>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    800020dc:	03853783          	ld	a5,56(a0)
    800020e0:	02079463          	bnez	a5,80002108 <_ZN9Scheduler4wakeEv+0x6c>
        TCB* thread = sleepingHead;
        sleepingHead = sleepingHead->nextSleeping;
    800020e4:	04053783          	ld	a5,64(a0)
    800020e8:	0000b717          	auipc	a4,0xb
    800020ec:	18f73023          	sd	a5,384(a4) # 8000d268 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    800020f0:	04053023          	sd	zero,64(a0)
        Scheduler::put(thread);
    800020f4:	00000097          	auipc	ra,0x0
    800020f8:	e6c080e7          	jalr	-404(ra) # 80001f60 <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    800020fc:	0000b517          	auipc	a0,0xb
    80002100:	16c53503          	ld	a0,364(a0) # 8000d268 <_ZN9Scheduler12sleepingHeadE>
    80002104:	fc051ce3          	bnez	a0,800020dc <_ZN9Scheduler4wakeEv+0x40>
    }
}
    80002108:	00813083          	ld	ra,8(sp)
    8000210c:	00013403          	ld	s0,0(sp)
    80002110:	01010113          	addi	sp,sp,16
    80002114:	00008067          	ret
    80002118:	00008067          	ret

000000008000211c <_ZN7KMemory7kmallocEm>:
    kmalloc(blocksForBitVector);

    initialized = true;
}

void* KMemory::kmalloc(size_t size) {
    8000211c:	ff010113          	addi	sp,sp,-16
    80002120:	00813423          	sd	s0,8(sp)
    80002124:	01010413          	addi	s0,sp,16
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80002128:	16050063          	beqz	a0,80002288 <_ZN7KMemory7kmallocEm+0x16c>
    8000212c:	0000b797          	auipc	a5,0xb
    80002130:	1447b783          	ld	a5,324(a5) # 8000d270 <_ZN7KMemory14freeBlocksLeftE>
    80002134:	14a7ee63          	bltu	a5,a0,80002290 <_ZN7KMemory7kmallocEm+0x174>
    uint64 currentElem = 0;
    uint64 currentBit = 63;
    uint64 firstZeroElem = 0;
    uint64 firstZeroBit = 63;
    uint64 zerosFound = 0;
    bool zeroFound = false;
    80002138:	00000313          	li	t1,0
    uint64 zerosFound = 0;
    8000213c:	00000713          	li	a4,0
    uint64 firstZeroBit = 63;
    80002140:	03f00813          	li	a6,63
    uint64 firstZeroElem = 0;
    80002144:	00000893          	li	a7,0
    uint64 currentBit = 63;
    80002148:	03f00793          	li	a5,63
    uint64 currentElem = 0;
    8000214c:	00000593          	li	a1,0
    80002150:	0080006f          	j	80002158 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroElem = currentElem;
        } else {
            zerosFound++;
        }
        if (zerosFound == size) break;
        if (currentBit-- == 0) {
    80002154:	00068793          	mv	a5,a3
    while (currentElem < sizeOfBitVectorInUint64) {
    80002158:	0000b697          	auipc	a3,0xb
    8000215c:	1206b683          	ld	a3,288(a3) # 8000d278 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80002160:	08d5fa63          	bgeu	a1,a3,800021f4 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80002164:	03f00693          	li	a3,63
    80002168:	02d78a63          	beq	a5,a3,8000219c <_ZN7KMemory7kmallocEm+0x80>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    8000216c:	00359693          	slli	a3,a1,0x3
    80002170:	0000b617          	auipc	a2,0xb
    80002174:	11063603          	ld	a2,272(a2) # 8000d280 <_ZN7KMemory9bitVectorE>
    80002178:	00d606b3          	add	a3,a2,a3
    8000217c:	0006b683          	ld	a3,0(a3)
    //adresa pocetka bit vektora (HEAP_START_ADDR)
    static uint64* bitVector;

    static uint64 freeBlocksLeft;

    //maska sa 1 na mestu bitPos i ostalim nulama (bitPos=0..63)
    80002180:	00100613          	li	a2,1
    80002184:	00f61633          	sll	a2,a2,a5
    80002188:	00c6f6b3          	and	a3,a3,a2
        if (bit > 0) {
    8000218c:	02069a63          	bnez	a3,800021c0 <_ZN7KMemory7kmallocEm+0xa4>
        } else if (!zeroFound) {
    80002190:	04030863          	beqz	t1,800021e0 <_ZN7KMemory7kmallocEm+0xc4>
            zerosFound++;
    80002194:	00170713          	addi	a4,a4,1
    80002198:	0300006f          	j	800021c8 <_ZN7KMemory7kmallocEm+0xac>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    8000219c:	00359693          	slli	a3,a1,0x3
    800021a0:	0000b617          	auipc	a2,0xb
    800021a4:	0e063603          	ld	a2,224(a2) # 8000d280 <_ZN7KMemory9bitVectorE>
    800021a8:	00d606b3          	add	a3,a2,a3
    800021ac:	0006b603          	ld	a2,0(a3)
    800021b0:	fff00693          	li	a3,-1
    800021b4:	fad61ce3          	bne	a2,a3,8000216c <_ZN7KMemory7kmallocEm+0x50>
            currentElem++;
    800021b8:	00158593          	addi	a1,a1,1
            continue;
    800021bc:	f9dff06f          	j	80002158 <_ZN7KMemory7kmallocEm+0x3c>
            zeroFound = false;
    800021c0:	00000313          	li	t1,0
            zerosFound = 0;
    800021c4:	00000713          	li	a4,0
        if (zerosFound == size) break;
    800021c8:	02a70663          	beq	a4,a0,800021f4 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit-- == 0) {
    800021cc:	fff78693          	addi	a3,a5,-1
    800021d0:	f80792e3          	bnez	a5,80002154 <_ZN7KMemory7kmallocEm+0x38>
            currentBit = 63;
            currentElem++;
    800021d4:	00158593          	addi	a1,a1,1
            currentBit = 63;
    800021d8:	03f00793          	li	a5,63
    800021dc:	f7dff06f          	j	80002158 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroBit = currentBit;
    800021e0:	00078813          	mv	a6,a5
            firstZeroElem = currentElem;
    800021e4:	00058893          	mv	a7,a1
            zeroFound = true;
    800021e8:	00100313          	li	t1,1
            zerosFound = 1;
    800021ec:	00100713          	li	a4,1
    800021f0:	fd9ff06f          	j	800021c8 <_ZN7KMemory7kmallocEm+0xac>
        }
    }
    if (zerosFound != size) return nullptr;
    800021f4:	0aa71263          	bne	a4,a0,80002298 <_ZN7KMemory7kmallocEm+0x17c>

    //alociranje blokova
    uint64 blockNum = firstZeroElem * 64 + (63 - firstZeroBit);
    800021f8:	00689793          	slli	a5,a7,0x6
    800021fc:	410787b3          	sub	a5,a5,a6
    80002200:	03f78793          	addi	a5,a5,63
    void* addr = (char*)HEAP_START_ADDR + blockNum * MEM_BLOCK_SIZE;
    80002204:	0000b697          	auipc	a3,0xb
    80002208:	eb46b683          	ld	a3,-332(a3) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000220c:	0006b583          	ld	a1,0(a3)
    80002210:	00679793          	slli	a5,a5,0x6
    80002214:	00f585b3          	add	a1,a1,a5
    *(uint64*)addr = size;  //da znamo koliko blokova je alocirano zaredom
    80002218:	00a5b023          	sd	a0,0(a1)

    //upisivanje 1 u bit vektor
    currentElem = firstZeroElem;
    currentBit = firstZeroBit;
    8000221c:	0080006f          	j	80002224 <_ZN7KMemory7kmallocEm+0x108>
    while (zerosFound > 0) {
        bitVector[currentElem] |= maskBit(currentBit);
        zerosFound--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80002220:	00078813          	mv	a6,a5
    while (zerosFound > 0) {
    80002224:	04070063          	beqz	a4,80002264 <_ZN7KMemory7kmallocEm+0x148>
    80002228:	00100693          	li	a3,1
    8000222c:	01069633          	sll	a2,a3,a6
        bitVector[currentElem] |= maskBit(currentBit);
    80002230:	00389793          	slli	a5,a7,0x3
    80002234:	0000b697          	auipc	a3,0xb
    80002238:	04c6b683          	ld	a3,76(a3) # 8000d280 <_ZN7KMemory9bitVectorE>
    8000223c:	00f687b3          	add	a5,a3,a5
    80002240:	0007b683          	ld	a3,0(a5)
    80002244:	00c6e6b3          	or	a3,a3,a2
    80002248:	00d7b023          	sd	a3,0(a5)
        zerosFound--;
    8000224c:	fff70713          	addi	a4,a4,-1
        if (currentBit-- == 0) {
    80002250:	fff80793          	addi	a5,a6,-1
    80002254:	fc0816e3          	bnez	a6,80002220 <_ZN7KMemory7kmallocEm+0x104>
            currentElem++;
    80002258:	00188893          	addi	a7,a7,1
            currentBit = 63;
    8000225c:	03f00793          	li	a5,63
    80002260:	fc1ff06f          	j	80002220 <_ZN7KMemory7kmallocEm+0x104>
        }
    }
    freeBlocksLeft -= size;
    80002264:	0000b717          	auipc	a4,0xb
    80002268:	00c70713          	addi	a4,a4,12 # 8000d270 <_ZN7KMemory14freeBlocksLeftE>
    8000226c:	00073783          	ld	a5,0(a4)
    80002270:	40a78533          	sub	a0,a5,a0
    80002274:	00a73023          	sd	a0,0(a4)
    return (char*)addr + 2 * sizeof(uint64);    //offset 2 da bi bilo zaokruzeno na 16 zbog steka
    80002278:	01058513          	addi	a0,a1,16
}
    8000227c:	00813403          	ld	s0,8(sp)
    80002280:	01010113          	addi	sp,sp,16
    80002284:	00008067          	ret
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80002288:	00000513          	li	a0,0
    8000228c:	ff1ff06f          	j	8000227c <_ZN7KMemory7kmallocEm+0x160>
    80002290:	00000513          	li	a0,0
    80002294:	fe9ff06f          	j	8000227c <_ZN7KMemory7kmallocEm+0x160>
    if (zerosFound != size) return nullptr;
    80002298:	00000513          	li	a0,0
    8000229c:	fe1ff06f          	j	8000227c <_ZN7KMemory7kmallocEm+0x160>

00000000800022a0 <_ZN7KMemory16initializeMemoryEv>:
    if (initialized) return;
    800022a0:	0000b797          	auipc	a5,0xb
    800022a4:	fe87c783          	lbu	a5,-24(a5) # 8000d288 <_ZN7KMemory11initializedE>
    800022a8:	0a079863          	bnez	a5,80002358 <_ZN7KMemory16initializeMemoryEv+0xb8>
void KMemory::initializeMemory() {
    800022ac:	ff010113          	addi	sp,sp,-16
    800022b0:	00113423          	sd	ra,8(sp)
    800022b4:	00813023          	sd	s0,0(sp)
    800022b8:	01010413          	addi	s0,sp,16
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    800022bc:	0000b797          	auipc	a5,0xb
    800022c0:	e4c7b783          	ld	a5,-436(a5) # 8000d108 <_GLOBAL_OFFSET_TABLE_+0x80>
    800022c4:	0007b783          	ld	a5,0(a5)
    800022c8:	0000b717          	auipc	a4,0xb
    800022cc:	df073703          	ld	a4,-528(a4) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800022d0:	00073603          	ld	a2,0(a4)
    800022d4:	40c787b3          	sub	a5,a5,a2
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    800022d8:	00c7d793          	srli	a5,a5,0xc
    800022dc:	0000b717          	auipc	a4,0xb
    800022e0:	f9470713          	addi	a4,a4,-108 # 8000d270 <_ZN7KMemory14freeBlocksLeftE>
    800022e4:	00f73423          	sd	a5,8(a4)
    numOfBlocks = sizeOfBitVectorInUint64 * sizeof(uint64) * 8; //da se zaokruzi broj postojecih blokova na umnozak 64
    800022e8:	00679693          	slli	a3,a5,0x6
    800022ec:	02d73023          	sd	a3,32(a4)
    uint64 blocksForBitVector = (sizeOfBitVectorInUint64 * sizeof(uint64) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    800022f0:	00878513          	addi	a0,a5,8
    800022f4:	00351513          	slli	a0,a0,0x3
    800022f8:	fff50513          	addi	a0,a0,-1
    800022fc:	00655513          	srli	a0,a0,0x6
    bitVector = (uint64*)HEAP_START_ADDR;
    80002300:	00c73823          	sd	a2,16(a4)
    freeBlocksLeft = numOfBlocks;
    80002304:	00d73023          	sd	a3,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80002308:	00000793          	li	a5,0
    8000230c:	0000b717          	auipc	a4,0xb
    80002310:	f6c73703          	ld	a4,-148(a4) # 8000d278 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80002314:	02e7f063          	bgeu	a5,a4,80002334 <_ZN7KMemory16initializeMemoryEv+0x94>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    80002318:	00379693          	slli	a3,a5,0x3
    8000231c:	0000b717          	auipc	a4,0xb
    80002320:	f6473703          	ld	a4,-156(a4) # 8000d280 <_ZN7KMemory9bitVectorE>
    80002324:	00d70733          	add	a4,a4,a3
    80002328:	00073023          	sd	zero,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    8000232c:	00178793          	addi	a5,a5,1
    80002330:	fddff06f          	j	8000230c <_ZN7KMemory16initializeMemoryEv+0x6c>
    kmalloc(blocksForBitVector);
    80002334:	00000097          	auipc	ra,0x0
    80002338:	de8080e7          	jalr	-536(ra) # 8000211c <_ZN7KMemory7kmallocEm>
    initialized = true;
    8000233c:	00100793          	li	a5,1
    80002340:	0000b717          	auipc	a4,0xb
    80002344:	f4f70423          	sb	a5,-184(a4) # 8000d288 <_ZN7KMemory11initializedE>
}
    80002348:	00813083          	ld	ra,8(sp)
    8000234c:	00013403          	ld	s0,0(sp)
    80002350:	01010113          	addi	sp,sp,16
    80002354:	00008067          	ret
    80002358:	00008067          	ret

000000008000235c <_ZN7KMemory5kfreeEPv>:

int KMemory::kfree(void* ptr) {
    8000235c:	ff010113          	addi	sp,sp,-16
    80002360:	00813423          	sd	s0,8(sp)
    80002364:	01010413          	addi	s0,sp,16
    if (!ptr) return 0;
    80002368:	08050a63          	beqz	a0,800023fc <_ZN7KMemory5kfreeEPv+0xa0>
    ptr = (char*)ptr - 2 * sizeof(uint64);
    8000236c:	ff050793          	addi	a5,a0,-16
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80002370:	0000b717          	auipc	a4,0xb
    80002374:	d4873703          	ld	a4,-696(a4) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002378:	00073703          	ld	a4,0(a4)
    8000237c:	40e787b3          	sub	a5,a5,a4
    80002380:	03f7f713          	andi	a4,a5,63
    80002384:	08071063          	bnez	a4,80002404 <_ZN7KMemory5kfreeEPv+0xa8>
    uint64 blocksToFree = *(uint64*)ptr;
    80002388:	ff053583          	ld	a1,-16(a0)
    freeBlocksLeft += blocksToFree;
    8000238c:	0000b697          	auipc	a3,0xb
    80002390:	ee468693          	addi	a3,a3,-284 # 8000d270 <_ZN7KMemory14freeBlocksLeftE>
    80002394:	0006b703          	ld	a4,0(a3)
    80002398:	00b70733          	add	a4,a4,a1
    8000239c:	00e6b023          	sd	a4,0(a3)
    uint64 blockNum = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    800023a0:	0067d613          	srli	a2,a5,0x6
    uint64 currentElem = blockNum / 64;
    800023a4:	00c7d513          	srli	a0,a5,0xc
    uint64 currentBit = 63 - blockNum % 64;
    800023a8:	fff64613          	not	a2,a2
    800023ac:	03f67613          	andi	a2,a2,63
    800023b0:	0080006f          	j	800023b8 <_ZN7KMemory5kfreeEPv+0x5c>
    while (blocksToFree > 0) {
        bitVector[currentElem] &= ~maskBit(currentBit);
        blocksToFree--;
        if (currentBit-- == 0) {
            currentBit = 63;
    800023b4:	00078613          	mv	a2,a5
    while (blocksToFree > 0) {
    800023b8:	04058a63          	beqz	a1,8000240c <_ZN7KMemory5kfreeEPv+0xb0>
    800023bc:	00100793          	li	a5,1
    800023c0:	00c797b3          	sll	a5,a5,a2
        bitVector[currentElem] &= ~maskBit(currentBit);
    800023c4:	fff7c793          	not	a5,a5
    800023c8:	00351713          	slli	a4,a0,0x3
    800023cc:	0000b697          	auipc	a3,0xb
    800023d0:	eb46b683          	ld	a3,-332(a3) # 8000d280 <_ZN7KMemory9bitVectorE>
    800023d4:	00e68733          	add	a4,a3,a4
    800023d8:	00073683          	ld	a3,0(a4)
    800023dc:	00f6f7b3          	and	a5,a3,a5
    800023e0:	00f73023          	sd	a5,0(a4)
        blocksToFree--;
    800023e4:	fff58593          	addi	a1,a1,-1
        if (currentBit-- == 0) {
    800023e8:	fff60793          	addi	a5,a2,-1
    800023ec:	fc0614e3          	bnez	a2,800023b4 <_ZN7KMemory5kfreeEPv+0x58>
            currentElem++;
    800023f0:	00150513          	addi	a0,a0,1
            currentBit = 63;
    800023f4:	03f00793          	li	a5,63
    800023f8:	fbdff06f          	j	800023b4 <_ZN7KMemory5kfreeEPv+0x58>
    if (!ptr) return 0;
    800023fc:	00000513          	li	a0,0
    80002400:	0100006f          	j	80002410 <_ZN7KMemory5kfreeEPv+0xb4>
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80002404:	fff00513          	li	a0,-1
    80002408:	0080006f          	j	80002410 <_ZN7KMemory5kfreeEPv+0xb4>
        }
    }
    return 0;
    8000240c:	00000513          	li	a0,0
}
    80002410:	00813403          	ld	s0,8(sp)
    80002414:	01010113          	addi	sp,sp,16
    80002418:	00008067          	ret

000000008000241c <main>:

void userMain();

void user(void*);
void user2(void*);
int main() {
    8000241c:	fc010113          	addi	sp,sp,-64
    80002420:	02113c23          	sd	ra,56(sp)
    80002424:	02813823          	sd	s0,48(sp)
    80002428:	02913423          	sd	s1,40(sp)
    8000242c:	03213023          	sd	s2,32(sp)
    80002430:	01313c23          	sd	s3,24(sp)
    80002434:	04010413          	addi	s0,sp,64
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80002438:	0000b797          	auipc	a5,0xb
    8000243c:	cd87b783          	ld	a5,-808(a5) # 8000d110 <_GLOBAL_OFFSET_TABLE_+0x88>
    80002440:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80002444:	00000097          	auipc	ra,0x0
    80002448:	e5c080e7          	jalr	-420(ra) # 800022a0 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    8000244c:	fffff097          	auipc	ra,0xfffff
    80002450:	2c0080e7          	jalr	704(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>

    //pravljenje niti
    thread_t mainHandle;
    Thread* idleHandle = new IdleThread();
    80002454:	02000513          	li	a0,32
    80002458:	00001097          	auipc	ra,0x1
    8000245c:	dfc080e7          	jalr	-516(ra) # 80003254 <_Znwm>
    80002460:	00050913          	mv	s2,a0
    80002464:	00053023          	sd	zero,0(a0)
    80002468:	00053423          	sd	zero,8(a0)
    8000246c:	00053823          	sd	zero,16(a0)
    80002470:	00053c23          	sd	zero,24(a0)
class IdleThread : public Thread {
    80002474:	00001097          	auipc	ra,0x1
    80002478:	0d0080e7          	jalr	208(ra) # 80003544 <_ZN6ThreadC1Ev>
    8000247c:	0000b797          	auipc	a5,0xb
    80002480:	9ac78793          	addi	a5,a5,-1620 # 8000ce28 <_ZTV10IdleThread+0x10>
    80002484:	00f93023          	sd	a5,0(s2)
    Thread* consoleOutputHandle = new KernelConsumer();
    80002488:	02000513          	li	a0,32
    8000248c:	00001097          	auipc	ra,0x1
    80002490:	dc8080e7          	jalr	-568(ra) # 80003254 <_Znwm>
    80002494:	00050493          	mv	s1,a0
    80002498:	00053023          	sd	zero,0(a0)
    8000249c:	00053423          	sd	zero,8(a0)
    800024a0:	00053823          	sd	zero,16(a0)
    800024a4:	00053c23          	sd	zero,24(a0)
class KernelConsumer : public Thread {
    800024a8:	00001097          	auipc	ra,0x1
    800024ac:	09c080e7          	jalr	156(ra) # 80003544 <_ZN6ThreadC1Ev>
    800024b0:	0000b797          	auipc	a5,0xb
    800024b4:	9a078793          	addi	a5,a5,-1632 # 8000ce50 <_ZTV14KernelConsumer+0x10>
    800024b8:	00f4b023          	sd	a5,0(s1)
    Thread* userThr = new Thread((TCB::Body)userMain, nullptr);
    800024bc:	02000513          	li	a0,32
    800024c0:	00001097          	auipc	ra,0x1
    800024c4:	d94080e7          	jalr	-620(ra) # 80003254 <_Znwm>
    800024c8:	00050993          	mv	s3,a0
    800024cc:	00000613          	li	a2,0
    800024d0:	0000b597          	auipc	a1,0xb
    800024d4:	bc05b583          	ld	a1,-1088(a1) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x8>
    800024d8:	00001097          	auipc	ra,0x1
    800024dc:	e9c080e7          	jalr	-356(ra) # 80003374 <_ZN6ThreadC1EPFvPvES0_>
    800024e0:	0580006f          	j	80002538 <main+0x11c>
    800024e4:	00050493          	mv	s1,a0
    Thread* idleHandle = new IdleThread();
    800024e8:	00090513          	mv	a0,s2
    800024ec:	00001097          	auipc	ra,0x1
    800024f0:	db8080e7          	jalr	-584(ra) # 800032a4 <_ZdlPv>
    800024f4:	00048513          	mv	a0,s1
    800024f8:	0000c097          	auipc	ra,0xc
    800024fc:	ee0080e7          	jalr	-288(ra) # 8000e3d8 <_Unwind_Resume>
    80002500:	00050913          	mv	s2,a0
    Thread* consoleOutputHandle = new KernelConsumer();
    80002504:	00048513          	mv	a0,s1
    80002508:	00001097          	auipc	ra,0x1
    8000250c:	d9c080e7          	jalr	-612(ra) # 800032a4 <_ZdlPv>
    80002510:	00090513          	mv	a0,s2
    80002514:	0000c097          	auipc	ra,0xc
    80002518:	ec4080e7          	jalr	-316(ra) # 8000e3d8 <_Unwind_Resume>
    8000251c:	00050493          	mv	s1,a0
    Thread* userThr = new Thread((TCB::Body)userMain, nullptr);
    80002520:	00098513          	mv	a0,s3
    80002524:	00001097          	auipc	ra,0x1
    80002528:	d80080e7          	jalr	-640(ra) # 800032a4 <_ZdlPv>
    8000252c:	00048513          	mv	a0,s1
    80002530:	0000c097          	auipc	ra,0xc
    80002534:	ea8080e7          	jalr	-344(ra) # 8000e3d8 <_Unwind_Resume>
    //Thread* userThr = new Thread(user, nullptr);
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    80002538:	00000613          	li	a2,0
    8000253c:	00000597          	auipc	a1,0x0
    80002540:	ee058593          	addi	a1,a1,-288 # 8000241c <main>
    80002544:	fc840513          	addi	a0,s0,-56
    80002548:	fffff097          	auipc	ra,0xfffff
    8000254c:	ebc080e7          	jalr	-324(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80002550:	fc843783          	ld	a5,-56(s0)

    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }
    80002554:	0000b717          	auipc	a4,0xb
    80002558:	bac73703          	ld	a4,-1108(a4) # 8000d100 <_GLOBAL_OFFSET_TABLE_+0x78>
    8000255c:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80002560:	00100713          	li	a4,1
    80002564:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    idleHandle->start();
    80002568:	00090513          	mv	a0,s2
    8000256c:	00001097          	auipc	ra,0x1
    80002570:	ea0080e7          	jalr	-352(ra) # 8000340c <_ZN6Thread5startEv>
    consoleOutputHandle->start();
    80002574:	00048513          	mv	a0,s1
    80002578:	00001097          	auipc	ra,0x1
    8000257c:	e94080e7          	jalr	-364(ra) # 8000340c <_ZN6Thread5startEv>
    userThr->start();
    80002580:	00098513          	mv	a0,s3
    80002584:	00001097          	auipc	ra,0x1
    80002588:	e88080e7          	jalr	-376(ra) # 8000340c <_ZN6Thread5startEv>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    8000258c:	00200493          	li	s1,2
    80002590:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    userThr->join();
    80002594:	00098513          	mv	a0,s3
    80002598:	00001097          	auipc	ra,0x1
    8000259c:	ebc080e7          	jalr	-324(ra) # 80003454 <_ZN6Thread4joinEv>
    //stavlja karakter u ulazni bafer; ako je bafer pun, ignorise se
    static void placeInInput(char c);

    //ispis svih preostalih karaktera u izlaznom baferu
    static void flush() {
        __asm__ volatile("li a0, 0x43");
    800025a0:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    800025a4:	00000073          	ecall
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800025a8:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    800025ac:	00000513          	li	a0,0
    800025b0:	03813083          	ld	ra,56(sp)
    800025b4:	03013403          	ld	s0,48(sp)
    800025b8:	02813483          	ld	s1,40(sp)
    800025bc:	02013903          	ld	s2,32(sp)
    800025c0:	01813983          	ld	s3,24(sp)
    800025c4:	04010113          	addi	sp,sp,64
    800025c8:	00008067          	ret

00000000800025cc <_ZN10IdleThread3runEv>:
    void run() override {
    800025cc:	ff010113          	addi	sp,sp,-16
    800025d0:	00113423          	sd	ra,8(sp)
    800025d4:	00813023          	sd	s0,0(sp)
    800025d8:	01010413          	addi	s0,sp,16
        while (1) { thread_dispatch(); }
    800025dc:	fffff097          	auipc	ra,0xfffff
    800025e0:	ee4080e7          	jalr	-284(ra) # 800014c0 <_Z15thread_dispatchv>
    800025e4:	ff9ff06f          	j	800025dc <_ZN10IdleThread3runEv+0x10>

00000000800025e8 <_ZN10IdleThreadD1Ev>:
class IdleThread : public Thread {
    800025e8:	ff010113          	addi	sp,sp,-16
    800025ec:	00113423          	sd	ra,8(sp)
    800025f0:	00813023          	sd	s0,0(sp)
    800025f4:	01010413          	addi	s0,sp,16
    800025f8:	0000b797          	auipc	a5,0xb
    800025fc:	83078793          	addi	a5,a5,-2000 # 8000ce28 <_ZTV10IdleThread+0x10>
    80002600:	00f53023          	sd	a5,0(a0)
    80002604:	00001097          	auipc	ra,0x1
    80002608:	b9c080e7          	jalr	-1124(ra) # 800031a0 <_ZN6ThreadD1Ev>
    8000260c:	00813083          	ld	ra,8(sp)
    80002610:	00013403          	ld	s0,0(sp)
    80002614:	01010113          	addi	sp,sp,16
    80002618:	00008067          	ret

000000008000261c <_ZN10IdleThreadD0Ev>:
    8000261c:	fe010113          	addi	sp,sp,-32
    80002620:	00113c23          	sd	ra,24(sp)
    80002624:	00813823          	sd	s0,16(sp)
    80002628:	00913423          	sd	s1,8(sp)
    8000262c:	02010413          	addi	s0,sp,32
    80002630:	00050493          	mv	s1,a0
    80002634:	0000a797          	auipc	a5,0xa
    80002638:	7f478793          	addi	a5,a5,2036 # 8000ce28 <_ZTV10IdleThread+0x10>
    8000263c:	00f53023          	sd	a5,0(a0)
    80002640:	00001097          	auipc	ra,0x1
    80002644:	b60080e7          	jalr	-1184(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80002648:	00048513          	mv	a0,s1
    8000264c:	00001097          	auipc	ra,0x1
    80002650:	c58080e7          	jalr	-936(ra) # 800032a4 <_ZdlPv>
    80002654:	01813083          	ld	ra,24(sp)
    80002658:	01013403          	ld	s0,16(sp)
    8000265c:	00813483          	ld	s1,8(sp)
    80002660:	02010113          	addi	sp,sp,32
    80002664:	00008067          	ret

0000000080002668 <_ZN14KernelConsumerD1Ev>:
class KernelConsumer : public Thread {
    80002668:	ff010113          	addi	sp,sp,-16
    8000266c:	00113423          	sd	ra,8(sp)
    80002670:	00813023          	sd	s0,0(sp)
    80002674:	01010413          	addi	s0,sp,16
    80002678:	0000a797          	auipc	a5,0xa
    8000267c:	7d878793          	addi	a5,a5,2008 # 8000ce50 <_ZTV14KernelConsumer+0x10>
    80002680:	00f53023          	sd	a5,0(a0)
    80002684:	00001097          	auipc	ra,0x1
    80002688:	b1c080e7          	jalr	-1252(ra) # 800031a0 <_ZN6ThreadD1Ev>
    8000268c:	00813083          	ld	ra,8(sp)
    80002690:	00013403          	ld	s0,0(sp)
    80002694:	01010113          	addi	sp,sp,16
    80002698:	00008067          	ret

000000008000269c <_ZN14KernelConsumerD0Ev>:
    8000269c:	fe010113          	addi	sp,sp,-32
    800026a0:	00113c23          	sd	ra,24(sp)
    800026a4:	00813823          	sd	s0,16(sp)
    800026a8:	00913423          	sd	s1,8(sp)
    800026ac:	02010413          	addi	s0,sp,32
    800026b0:	00050493          	mv	s1,a0
    800026b4:	0000a797          	auipc	a5,0xa
    800026b8:	79c78793          	addi	a5,a5,1948 # 8000ce50 <_ZTV14KernelConsumer+0x10>
    800026bc:	00f53023          	sd	a5,0(a0)
    800026c0:	00001097          	auipc	ra,0x1
    800026c4:	ae0080e7          	jalr	-1312(ra) # 800031a0 <_ZN6ThreadD1Ev>
    800026c8:	00048513          	mv	a0,s1
    800026cc:	00001097          	auipc	ra,0x1
    800026d0:	bd8080e7          	jalr	-1064(ra) # 800032a4 <_ZdlPv>
    800026d4:	01813083          	ld	ra,24(sp)
    800026d8:	01013403          	ld	s0,16(sp)
    800026dc:	00813483          	ld	s1,8(sp)
    800026e0:	02010113          	addi	sp,sp,32
    800026e4:	00008067          	ret

00000000800026e8 <_ZN14KernelConsumer3runEv>:
    void run() override {
    800026e8:	ff010113          	addi	sp,sp,-16
    800026ec:	00113423          	sd	ra,8(sp)
    800026f0:	00813023          	sd	s0,0(sp)
    800026f4:	01010413          	addi	s0,sp,16
    800026f8:	0280006f          	j	80002720 <_ZN14KernelConsumer3runEv+0x38>

    static uint8 getSRvalue() { return *sr; }

    static uint8 getDRvalue() { return *dr; }

    static void setDRvalue(char c) { *dr = c; }
    800026fc:	0000b797          	auipc	a5,0xb
    80002700:	9ec7b783          	ld	a5,-1556(a5) # 8000d0e8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002704:	0007b783          	ld	a5,0(a5)
    80002708:	00a78023          	sb	a0,0(a5)
            sem_signal(KConsole::getOutputBufferHasSpace());
    8000270c:	0000b797          	auipc	a5,0xb
    80002710:	9ec7b783          	ld	a5,-1556(a5) # 8000d0f8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002714:	0007b503          	ld	a0,0(a5)
    80002718:	fffff097          	auipc	ra,0xfffff
    8000271c:	eb8080e7          	jalr	-328(ra) # 800015d0 <_Z10sem_signalP4KSem>
            char c = KConsole::getFromOutput();
    80002720:	fffff097          	auipc	ra,0xfffff
    80002724:	0a4080e7          	jalr	164(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    80002728:	0000b797          	auipc	a5,0xb
    8000272c:	a087b783          	ld	a5,-1528(a5) # 8000d130 <_GLOBAL_OFFSET_TABLE_+0xa8>
    80002730:	0007b783          	ld	a5,0(a5)
    80002734:	0007c783          	lbu	a5,0(a5)
            while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80002738:	0207f793          	andi	a5,a5,32
    8000273c:	fe0786e3          	beqz	a5,80002728 <_ZN14KernelConsumer3runEv+0x40>
    80002740:	fbdff06f          	j	800026fc <_ZN14KernelConsumer3runEv+0x14>

0000000080002744 <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80002744:	ff010113          	addi	sp,sp,-16
    80002748:	00113423          	sd	ra,8(sp)
    8000274c:	00813023          	sd	s0,0(sp)
    80002750:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80002754:	fffff097          	auipc	ra,0xfffff
    80002758:	d6c080e7          	jalr	-660(ra) # 800014c0 <_Z15thread_dispatchv>
    8000275c:	ff9ff06f          	j	80002754 <_Z4idlePv+0x10>

0000000080002760 <_Z22kernelConsumerFunctionPv>:
}

//salje na izlaz karakter iz izlaznog bafera KConsole
void kernelConsumerFunction(void*) {
    80002760:	ff010113          	addi	sp,sp,-16
    80002764:	00113423          	sd	ra,8(sp)
    80002768:	00813023          	sd	s0,0(sp)
    8000276c:	01010413          	addi	s0,sp,16
    80002770:	0280006f          	j	80002798 <_Z22kernelConsumerFunctionPv+0x38>
    static void setDRvalue(char c) { *dr = c; }
    80002774:	0000b797          	auipc	a5,0xb
    80002778:	9747b783          	ld	a5,-1676(a5) # 8000d0e8 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000277c:	0007b783          	ld	a5,0(a5)
    80002780:	00a78023          	sb	a0,0(a5)
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
        KConsole::setDRvalue(c);
        sem_signal(KConsole::getOutputBufferHasSpace());
    80002784:	0000b797          	auipc	a5,0xb
    80002788:	9747b783          	ld	a5,-1676(a5) # 8000d0f8 <_GLOBAL_OFFSET_TABLE_+0x70>
    8000278c:	0007b503          	ld	a0,0(a5)
    80002790:	fffff097          	auipc	ra,0xfffff
    80002794:	e40080e7          	jalr	-448(ra) # 800015d0 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80002798:	fffff097          	auipc	ra,0xfffff
    8000279c:	02c080e7          	jalr	44(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    800027a0:	0000b797          	auipc	a5,0xb
    800027a4:	9907b783          	ld	a5,-1648(a5) # 8000d130 <_GLOBAL_OFFSET_TABLE_+0xa8>
    800027a8:	0007b783          	ld	a5,0(a5)
    800027ac:	0007c783          	lbu	a5,0(a5)
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    800027b0:	0207f793          	andi	a5,a5,32
    800027b4:	fe0786e3          	beqz	a5,800027a0 <_Z22kernelConsumerFunctionPv+0x40>
    800027b8:	fbdff06f          	j	80002774 <_Z22kernelConsumerFunctionPv+0x14>

00000000800027bc <_Z5main1v>:
    }
}

int main1() {
    800027bc:	fc010113          	addi	sp,sp,-64
    800027c0:	02113c23          	sd	ra,56(sp)
    800027c4:	02813823          	sd	s0,48(sp)
    800027c8:	02913423          	sd	s1,40(sp)
    800027cc:	04010413          	addi	s0,sp,64
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    800027d0:	0000b797          	auipc	a5,0xb
    800027d4:	9407b783          	ld	a5,-1728(a5) # 8000d110 <_GLOBAL_OFFSET_TABLE_+0x88>
    800027d8:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    800027dc:	00000097          	auipc	ra,0x0
    800027e0:	ac4080e7          	jalr	-1340(ra) # 800022a0 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    800027e4:	fffff097          	auipc	ra,0xfffff
    800027e8:	f28080e7          	jalr	-216(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    800027ec:	00000613          	li	a2,0
    800027f0:	0000b597          	auipc	a1,0xb
    800027f4:	9005b583          	ld	a1,-1792(a1) # 8000d0f0 <_GLOBAL_OFFSET_TABLE_+0x68>
    800027f8:	fd840513          	addi	a0,s0,-40
    800027fc:	fffff097          	auipc	ra,0xfffff
    80002800:	c08080e7          	jalr	-1016(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80002804:	fd843783          	ld	a5,-40(s0)
    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }
    80002808:	0000b717          	auipc	a4,0xb
    8000280c:	8f873703          	ld	a4,-1800(a4) # 8000d100 <_GLOBAL_OFFSET_TABLE_+0x78>
    80002810:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80002814:	00100713          	li	a4,1
    80002818:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    8000281c:	00000613          	li	a2,0
    80002820:	0000b597          	auipc	a1,0xb
    80002824:	8705b583          	ld	a1,-1936(a1) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002828:	fd040513          	addi	a0,s0,-48
    8000282c:	fffff097          	auipc	ra,0xfffff
    80002830:	bd8080e7          	jalr	-1064(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80002834:	00000613          	li	a2,0
    80002838:	00000597          	auipc	a1,0x0
    8000283c:	f2858593          	addi	a1,a1,-216 # 80002760 <_Z22kernelConsumerFunctionPv>
    80002840:	fc040513          	addi	a0,s0,-64
    80002844:	fffff097          	auipc	ra,0xfffff
    80002848:	bc0080e7          	jalr	-1088(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    8000284c:	00000613          	li	a2,0
    80002850:	00000597          	auipc	a1,0x0
    80002854:	ef458593          	addi	a1,a1,-268 # 80002744 <_Z4idlePv>
    80002858:	fc840513          	addi	a0,s0,-56
    8000285c:	fffff097          	auipc	ra,0xfffff
    80002860:	ba8080e7          	jalr	-1112(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002864:	00200493          	li	s1,2
    80002868:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    8000286c:	fd043503          	ld	a0,-48(s0)
    80002870:	fffff097          	auipc	ra,0xfffff
    80002874:	c70080e7          	jalr	-912(ra) # 800014e0 <_Z11thread_joinP3TCB>
        __asm__ volatile("li a0, 0x43");
    80002878:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    8000287c:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002880:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80002884:	00000513          	li	a0,0
    80002888:	03813083          	ld	ra,56(sp)
    8000288c:	03013403          	ld	s0,48(sp)
    80002890:	02813483          	ld	s1,40(sp)
    80002894:	04010113          	addi	sp,sp,64
    80002898:	00008067          	ret

000000008000289c <interruptRoutine>:
#include "../test/printing.hpp"

int main();

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    8000289c:	f9010113          	addi	sp,sp,-112
    800028a0:	06113423          	sd	ra,104(sp)
    800028a4:	06813023          	sd	s0,96(sp)
    800028a8:	04913c23          	sd	s1,88(sp)
    800028ac:	07010413          	addi	s0,sp,112
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028b0:	14202373          	csrr	t1,scause
    800028b4:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028b8:	14102373          	csrr	t1,sepc
    800028bc:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028c0:	10002373          	csrr	t1,sstatus
    800028c4:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4;
    //uint64 a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028c8:	00050313          	mv	t1,a0
    800028cc:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028d0:	00058313          	mv	t1,a1
    800028d4:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028d8:	00060313          	mv	t1,a2
    800028dc:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028e0:	00068313          	mv	t1,a3
    800028e4:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028e8:	00070313          	mv	t1,a4
    800028ec:	fa643023          	sd	t1,-96(s0)
//    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");

    if (scause == 0x9 || scause == 0x8) {
    800028f0:	fd843703          	ld	a4,-40(s0)
    800028f4:	00900793          	li	a5,9
    800028f8:	00f70863          	beq	a4,a5,80002908 <interruptRoutine+0x6c>
    800028fc:	fd843703          	ld	a4,-40(s0)
    80002900:	00800793          	li	a5,8
    80002904:	4cf71263          	bne	a4,a5,80002dc8 <interruptRoutine+0x52c>
        //prekid zbog poziva ecall
        switch (a0) {
    80002908:	fc043703          	ld	a4,-64(s0)
    8000290c:	08100793          	li	a5,129
    80002910:	3ee7e863          	bltu	a5,a4,80002d00 <interruptRoutine+0x464>
    80002914:	fc043783          	ld	a5,-64(s0)
    80002918:	00279713          	slli	a4,a5,0x2
    8000291c:	00007797          	auipc	a5,0x7
    80002920:	7e878793          	addi	a5,a5,2024 # 8000a104 <CONSOLE_STATUS+0xf4>
    80002924:	00f707b3          	add	a5,a4,a5
    80002928:	0007a783          	lw	a5,0(a5)
    8000292c:	0007871b          	sext.w	a4,a5
    80002930:	00007797          	auipc	a5,0x7
    80002934:	7d478793          	addi	a5,a5,2004 # 8000a104 <CONSOLE_STATUS+0xf4>
    80002938:	00f707b3          	add	a5,a4,a5
    8000293c:	00078067          	jr	a5
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                KMemory::kmalloc((size_t)a1);
    80002940:	fb843503          	ld	a0,-72(s0)
    80002944:	fffff097          	auipc	ra,0xfffff
    80002948:	7d8080e7          	jalr	2008(ra) # 8000211c <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    8000294c:	04a43823          	sd	a0,80(s0)
                break;
    80002950:	4540006f          	j	80002da4 <interruptRoutine+0x508>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                KMemory::kfree((void*)a1);
    80002954:	fb843783          	ld	a5,-72(s0)
    80002958:	00078513          	mv	a0,a5
    8000295c:	00000097          	auipc	ra,0x0
    80002960:	a00080e7          	jalr	-1536(ra) # 8000235c <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    80002964:	04a43823          	sd	a0,80(s0)
                break;
    80002968:	43c0006f          	j	80002da4 <interruptRoutine+0x508>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    8000296c:	fb043783          	ld	a5,-80(s0)
    80002970:	fa843703          	ld	a4,-88(s0)
    80002974:	fa043683          	ld	a3,-96(s0)
    80002978:	fb843483          	ld	s1,-72(s0)
    8000297c:	00068613          	mv	a2,a3
    80002980:	00070593          	mv	a1,a4
    80002984:	00078513          	mv	a0,a5
    80002988:	00001097          	auipc	ra,0x1
    8000298c:	f90080e7          	jalr	-112(ra) # 80003918 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002990:	00050793          	mv	a5,a0
    80002994:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80002998:	fb843783          	ld	a5,-72(s0)
    8000299c:	0007b783          	ld	a5,0(a5)
    800029a0:	02078863          	beqz	a5,800029d0 <interruptRoutine+0x134>
                    if ((TCB::Body)a2 != (TCB::Body)main) {
    800029a4:	fb043703          	ld	a4,-80(s0)
    800029a8:	0000a797          	auipc	a5,0xa
    800029ac:	7487b783          	ld	a5,1864(a5) # 8000d0f0 <_GLOBAL_OFFSET_TABLE_+0x68>
    800029b0:	00f70c63          	beq	a4,a5,800029c8 <interruptRoutine+0x12c>
                        Scheduler::put(*((thread_t*)a1));
    800029b4:	fb843783          	ld	a5,-72(s0)
    800029b8:	0007b783          	ld	a5,0(a5)
    800029bc:	00078513          	mv	a0,a5
    800029c0:	fffff097          	auipc	ra,0xfffff
    800029c4:	5a0080e7          	jalr	1440(ra) # 80001f60 <_ZN9Scheduler3putEP3TCB>
                    }
                    __asm__ volatile("li a0, 0");
    800029c8:	00000513          	li	a0,0
    800029cc:	0080006f          	j	800029d4 <interruptRoutine+0x138>
                } else {
                    __asm__ volatile("li a0, -1");
    800029d0:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800029d4:	04a43823          	sd	a0,80(s0)
                break;
    800029d8:	3cc0006f          	j	80002da4 <interruptRoutine+0x508>
            case 0x12:
                //thread_exit
                TCB::getRunning()->setStatus(TCB::FINISHED);
    800029dc:	00000097          	auipc	ra,0x0
    800029e0:	74c080e7          	jalr	1868(ra) # 80003128 <_ZN3TCB10getRunningEv>
    800029e4:	00050793          	mv	a5,a0
    800029e8:	00500593          	li	a1,5
    800029ec:	00078513          	mv	a0,a5
    800029f0:	00000097          	auipc	ra,0x0
    800029f4:	6e4080e7          	jalr	1764(ra) # 800030d4 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined(TCB::getRunning());
    800029f8:	00000097          	auipc	ra,0x0
    800029fc:	730080e7          	jalr	1840(ra) # 80003128 <_ZN3TCB10getRunningEv>
    80002a00:	00050793          	mv	a5,a0
    80002a04:	00078513          	mv	a0,a5
    80002a08:	00001097          	auipc	ra,0x1
    80002a0c:	048080e7          	jalr	72(ra) # 80003a50 <_ZN3TCB13releaseJoinedEPS_>
                __asm__ volatile("li a0, 0");
    80002a10:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 80(s0)");
    80002a14:	04a43823          	sd	a0,80(s0)
                TCB::dispatch();
    80002a18:	00001097          	auipc	ra,0x1
    80002a1c:	e40080e7          	jalr	-448(ra) # 80003858 <_ZN3TCB8dispatchEv>
                break;
    80002a20:	3840006f          	j	80002da4 <interruptRoutine+0x508>
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
    80002a24:	00001097          	auipc	ra,0x1
    80002a28:	e34080e7          	jalr	-460(ra) # 80003858 <_ZN3TCB8dispatchEv>
                break;
    80002a2c:	3780006f          	j	80002da4 <interruptRoutine+0x508>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    80002a30:	fb843783          	ld	a5,-72(s0)
    80002a34:	00078513          	mv	a0,a5
    80002a38:	00001097          	auipc	ra,0x1
    80002a3c:	fc4080e7          	jalr	-60(ra) # 800039fc <_ZN3TCB10threadJoinEPS_>
                TCB::dispatch();
    80002a40:	00001097          	auipc	ra,0x1
    80002a44:	e18080e7          	jalr	-488(ra) # 80003858 <_ZN3TCB8dispatchEv>
                break;
    80002a48:	35c0006f          	j	80002da4 <interruptRoutine+0x508>
            case 0x15:
                //destruktor klase Thread, brise nit ciji je handle prosledjen
                //a1 = rucka niti koja se brise
                if(TCB::getRunning()==(thread_t)a1){
    80002a4c:	00000097          	auipc	ra,0x0
    80002a50:	6dc080e7          	jalr	1756(ra) # 80003128 <_ZN3TCB10getRunningEv>
    80002a54:	00050713          	mv	a4,a0
    80002a58:	fb843783          	ld	a5,-72(s0)
    80002a5c:	40f707b3          	sub	a5,a4,a5
    80002a60:	0017b793          	seqz	a5,a5
    80002a64:	0ff7f793          	andi	a5,a5,255
    80002a68:	04078263          	beqz	a5,80002aac <interruptRoutine+0x210>
                    TCB::getRunning()->setStatus(TCB::FINISHED);
    80002a6c:	00000097          	auipc	ra,0x0
    80002a70:	6bc080e7          	jalr	1724(ra) # 80003128 <_ZN3TCB10getRunningEv>
    80002a74:	00050793          	mv	a5,a0
    80002a78:	00500593          	li	a1,5
    80002a7c:	00078513          	mv	a0,a5
    80002a80:	00000097          	auipc	ra,0x0
    80002a84:	654080e7          	jalr	1620(ra) # 800030d4 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                    TCB::releaseJoined(TCB::getRunning());
    80002a88:	00000097          	auipc	ra,0x0
    80002a8c:	6a0080e7          	jalr	1696(ra) # 80003128 <_ZN3TCB10getRunningEv>
    80002a90:	00050793          	mv	a5,a0
    80002a94:	00078513          	mv	a0,a5
    80002a98:	00001097          	auipc	ra,0x1
    80002a9c:	fb8080e7          	jalr	-72(ra) # 80003a50 <_ZN3TCB13releaseJoinedEPS_>
                    TCB::dispatch();
    80002aa0:	00001097          	auipc	ra,0x1
    80002aa4:	db8080e7          	jalr	-584(ra) # 80003858 <_ZN3TCB8dispatchEv>
                }
                else{
                    TCB::quitThread((thread_t)a1);
                    TCB::releaseJoined((thread_t)a1);
                }
                break;
    80002aa8:	2fc0006f          	j	80002da4 <interruptRoutine+0x508>
                    TCB::quitThread((thread_t)a1);
    80002aac:	fb843783          	ld	a5,-72(s0)
    80002ab0:	00078513          	mv	a0,a5
    80002ab4:	00001097          	auipc	ra,0x1
    80002ab8:	fec080e7          	jalr	-20(ra) # 80003aa0 <_ZN3TCB10quitThreadEPS_>
                    TCB::releaseJoined((thread_t)a1);
    80002abc:	fb843783          	ld	a5,-72(s0)
    80002ac0:	00078513          	mv	a0,a5
    80002ac4:	00001097          	auipc	ra,0x1
    80002ac8:	f8c080e7          	jalr	-116(ra) # 80003a50 <_ZN3TCB13releaseJoinedEPS_>
                break;
    80002acc:	2d80006f          	j	80002da4 <interruptRoutine+0x508>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    80002ad0:	fb043783          	ld	a5,-80(s0)
    80002ad4:	0007879b          	sext.w	a5,a5
    80002ad8:	fb843483          	ld	s1,-72(s0)
    80002adc:	00078513          	mv	a0,a5
    80002ae0:	00001097          	auipc	ra,0x1
    80002ae4:	1b4080e7          	jalr	436(ra) # 80003c94 <_ZN4KSem7initSemEj>
    80002ae8:	00050793          	mv	a5,a0
    80002aec:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    80002af0:	fb843783          	ld	a5,-72(s0)
    80002af4:	0007b783          	ld	a5,0(a5)
    80002af8:	00078663          	beqz	a5,80002b04 <interruptRoutine+0x268>
                    __asm__ volatile("li a0, 0");
    80002afc:	00000513          	li	a0,0
    80002b00:	0080006f          	j	80002b08 <interruptRoutine+0x26c>
                } else {
                    __asm__ volatile("li a0, -1");
    80002b04:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002b08:	04a43823          	sd	a0,80(s0)
                break;
    80002b0c:	2980006f          	j	80002da4 <interruptRoutine+0x508>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    80002b10:	fb843783          	ld	a5,-72(s0)
    80002b14:	00078513          	mv	a0,a5
    80002b18:	00001097          	auipc	ra,0x1
    80002b1c:	2d0080e7          	jalr	720(ra) # 80003de8 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    80002b20:	04a43823          	sd	a0,80(s0)
                delete (sem_t)a1;
    80002b24:	fb843483          	ld	s1,-72(s0)
    80002b28:	26048063          	beqz	s1,80002d88 <interruptRoutine+0x4ec>
    80002b2c:	00048513          	mv	a0,s1
    80002b30:	00000097          	auipc	ra,0x0
    80002b34:	458080e7          	jalr	1112(ra) # 80002f88 <_ZN4KSemD1Ev>
    80002b38:	00048513          	mv	a0,s1
    80002b3c:	00001097          	auipc	ra,0x1
    80002b40:	130080e7          	jalr	304(ra) # 80003c6c <_ZN4KSemdlEPv>
                break;
    80002b44:	2440006f          	j	80002d88 <interruptRoutine+0x4ec>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80002b48:	fb843783          	ld	a5,-72(s0)
    80002b4c:	00078513          	mv	a0,a5
    80002b50:	00001097          	auipc	ra,0x1
    80002b54:	1d4080e7          	jalr	468(ra) # 80003d24 <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002b58:	04a43823          	sd	a0,80(s0)
                break;
    80002b5c:	2480006f          	j	80002da4 <interruptRoutine+0x508>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    80002b60:	fb843783          	ld	a5,-72(s0)
    80002b64:	00078513          	mv	a0,a5
    80002b68:	00001097          	auipc	ra,0x1
    80002b6c:	23c080e7          	jalr	572(ra) # 80003da4 <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002b70:	04a43823          	sd	a0,80(s0)
                break;
    80002b74:	2300006f          	j	80002da4 <interruptRoutine+0x508>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    80002b78:	fb843783          	ld	a5,-72(s0)
    80002b7c:	00078663          	beqz	a5,80002b88 <interruptRoutine+0x2ec>
                    __asm__ volatile("li a0, 0");
    80002b80:	00000513          	li	a0,0
    80002b84:	0080006f          	j	80002b8c <interruptRoutine+0x2f0>
                } else {
                    __asm__ volatile("li a0, -1");
    80002b88:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002b8c:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    80002b90:	fb843783          	ld	a5,-72(s0)
    80002b94:	1e078e63          	beqz	a5,80002d90 <interruptRoutine+0x4f4>
                    Scheduler::putToSleep(TCB::getRunning(), (time_t)a1);
    80002b98:	00000097          	auipc	ra,0x0
    80002b9c:	590080e7          	jalr	1424(ra) # 80003128 <_ZN3TCB10getRunningEv>
    80002ba0:	00050793          	mv	a5,a0
    80002ba4:	fb843583          	ld	a1,-72(s0)
    80002ba8:	00078513          	mv	a0,a5
    80002bac:	fffff097          	auipc	ra,0xfffff
    80002bb0:	440080e7          	jalr	1088(ra) # 80001fec <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::dispatch();
    80002bb4:	00001097          	auipc	ra,0x1
    80002bb8:	ca4080e7          	jalr	-860(ra) # 80003858 <_ZN3TCB8dispatchEv>
                }
                break;
    80002bbc:	1d40006f          	j	80002d90 <interruptRoutine+0x4f4>
            case 0x41:
                //getc
                KConsole::kgetc();
    80002bc0:	fffff097          	auipc	ra,0xfffff
    80002bc4:	d38080e7          	jalr	-712(ra) # 800018f8 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002bc8:	04a43823          	sd	a0,80(s0)
                break;
    80002bcc:	1d80006f          	j	80002da4 <interruptRoutine+0x508>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    80002bd0:	fb843783          	ld	a5,-72(s0)
    80002bd4:	0ff7f793          	andi	a5,a5,255
    80002bd8:	00078513          	mv	a0,a5
    80002bdc:	fffff097          	auipc	ra,0xfffff
    80002be0:	cac080e7          	jalr	-852(ra) # 80001888 <_ZN8KConsole5kputcEc>
                break;
    80002be4:	1c00006f          	j	80002da4 <interruptRoutine+0x508>
            case 0x43:
                //flush izlaznog bafera konzole
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    80002be8:	00000097          	auipc	ra,0x0
    80002bec:	4a4080e7          	jalr	1188(ra) # 8000308c <_ZN8KConsole13getOutputHeadEv>
    80002bf0:	00050793          	mv	a5,a0
    80002bf4:	00078493          	mv	s1,a5
    80002bf8:	00000097          	auipc	ra,0x0
    80002bfc:	4b8080e7          	jalr	1208(ra) # 800030b0 <_ZN8KConsole13getOutputTailEv>
    80002c00:	00050793          	mv	a5,a0
    80002c04:	00048713          	mv	a4,s1
    80002c08:	40f707b3          	sub	a5,a4,a5
    80002c0c:	00f037b3          	snez	a5,a5
    80002c10:	0ff7f793          	andi	a5,a5,255
    80002c14:	18078263          	beqz	a5,80002d98 <interruptRoutine+0x4fc>
                    char c = KConsole::getFromOutput();
    80002c18:	fffff097          	auipc	ra,0xfffff
    80002c1c:	bac080e7          	jalr	-1108(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    80002c20:	00050793          	mv	a5,a0
    80002c24:	f8f40ba3          	sb	a5,-105(s0)
                    while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80002c28:	00000097          	auipc	ra,0x0
    80002c2c:	3c8080e7          	jalr	968(ra) # 80002ff0 <_ZN8KConsole10getSRvalueEv>
    80002c30:	00050793          	mv	a5,a0
    80002c34:	0207f793          	andi	a5,a5,32
    80002c38:	0017b793          	seqz	a5,a5
    80002c3c:	0ff7f793          	andi	a5,a5,255
    80002c40:	00078463          	beqz	a5,80002c48 <interruptRoutine+0x3ac>
    80002c44:	fe5ff06f          	j	80002c28 <interruptRoutine+0x38c>
                    KConsole::setDRvalue(c);
    80002c48:	f9744783          	lbu	a5,-105(s0)
    80002c4c:	00078513          	mv	a0,a5
    80002c50:	00000097          	auipc	ra,0x0
    80002c54:	3f0080e7          	jalr	1008(ra) # 80003040 <_ZN8KConsole10setDRvalueEc>
                    sem_signal(KConsole::getOutputBufferHasSpace());
    80002c58:	00000097          	auipc	ra,0x0
    80002c5c:	410080e7          	jalr	1040(ra) # 80003068 <_ZN8KConsole23getOutputBufferHasSpaceEv>
    80002c60:	00050793          	mv	a5,a0
    80002c64:	00078513          	mv	a0,a5
    80002c68:	fffff097          	auipc	ra,0xfffff
    80002c6c:	968080e7          	jalr	-1688(ra) # 800015d0 <_Z10sem_signalP4KSem>
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    80002c70:	f79ff06f          	j	80002be8 <interruptRoutine+0x34c>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002c74:	fb043783          	ld	a5,-80(s0)
    80002c78:	fa843703          	ld	a4,-88(s0)
    80002c7c:	fa043683          	ld	a3,-96(s0)
    80002c80:	fb843483          	ld	s1,-72(s0)
    80002c84:	00068613          	mv	a2,a3
    80002c88:	00070593          	mv	a1,a4
    80002c8c:	00078513          	mv	a0,a5
    80002c90:	00001097          	auipc	ra,0x1
    80002c94:	c88080e7          	jalr	-888(ra) # 80003918 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002c98:	00050793          	mv	a5,a0
    80002c9c:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80002ca0:	fb843783          	ld	a5,-72(s0)
    80002ca4:	0007b783          	ld	a5,0(a5)
    80002ca8:	00078663          	beqz	a5,80002cb4 <interruptRoutine+0x418>
                    __asm__ volatile("li a0, 0");
    80002cac:	00000513          	li	a0,0
    80002cb0:	0080006f          	j	80002cb8 <interruptRoutine+0x41c>
                } else {
                    __asm__ volatile("li a0, -1");
    80002cb4:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002cb8:	04a43823          	sd	a0,80(s0)
                break;
    80002cbc:	0e80006f          	j	80002da4 <interruptRoutine+0x508>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                if (((thread_t)a1)->getBody() != (TCB::Body)main) {
    80002cc0:	fb843783          	ld	a5,-72(s0)
    80002cc4:	00078513          	mv	a0,a5
    80002cc8:	00000097          	auipc	ra,0x0
    80002ccc:	444080e7          	jalr	1092(ra) # 8000310c <_ZN3TCB7getBodyEv>
    80002cd0:	00050713          	mv	a4,a0
    80002cd4:	0000a797          	auipc	a5,0xa
    80002cd8:	41c7b783          	ld	a5,1052(a5) # 8000d0f0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002cdc:	40f707b3          	sub	a5,a4,a5
    80002ce0:	00f037b3          	snez	a5,a5
    80002ce4:	0ff7f793          	andi	a5,a5,255
    80002ce8:	0a078c63          	beqz	a5,80002da0 <interruptRoutine+0x504>
                    Scheduler::put((thread_t)a1);
    80002cec:	fb843783          	ld	a5,-72(s0)
    80002cf0:	00078513          	mv	a0,a5
    80002cf4:	fffff097          	auipc	ra,0xfffff
    80002cf8:	26c080e7          	jalr	620(ra) # 80001f60 <_ZN9Scheduler3putEP3TCB>
                }
                break;
    80002cfc:	0a40006f          	j	80002da0 <interruptRoutine+0x504>
            default:
                printString("\nNepostojeci op code: ");
    80002d00:	00007517          	auipc	a0,0x7
    80002d04:	3a850513          	addi	a0,a0,936 # 8000a0a8 <CONSOLE_STATUS+0x98>
    80002d08:	00003097          	auipc	ra,0x3
    80002d0c:	7dc080e7          	jalr	2012(ra) # 800064e4 <_Z11printStringPKc>
                printInt(a0);
    80002d10:	fc043783          	ld	a5,-64(s0)
    80002d14:	0007879b          	sext.w	a5,a5
    80002d18:	00000613          	li	a2,0
    80002d1c:	00a00593          	li	a1,10
    80002d20:	00078513          	mv	a0,a5
    80002d24:	00004097          	auipc	ra,0x4
    80002d28:	970080e7          	jalr	-1680(ra) # 80006694 <_Z8printIntiii>
                printString("\nscause: ");
    80002d2c:	00007517          	auipc	a0,0x7
    80002d30:	39450513          	addi	a0,a0,916 # 8000a0c0 <CONSOLE_STATUS+0xb0>
    80002d34:	00003097          	auipc	ra,0x3
    80002d38:	7b0080e7          	jalr	1968(ra) # 800064e4 <_Z11printStringPKc>
                printInt(scause);
    80002d3c:	fd843783          	ld	a5,-40(s0)
    80002d40:	0007879b          	sext.w	a5,a5
    80002d44:	00000613          	li	a2,0
    80002d48:	00a00593          	li	a1,10
    80002d4c:	00078513          	mv	a0,a5
    80002d50:	00004097          	auipc	ra,0x4
    80002d54:	944080e7          	jalr	-1724(ra) # 80006694 <_Z8printIntiii>
                printString("\nsepc: ");
    80002d58:	00007517          	auipc	a0,0x7
    80002d5c:	37850513          	addi	a0,a0,888 # 8000a0d0 <CONSOLE_STATUS+0xc0>
    80002d60:	00003097          	auipc	ra,0x3
    80002d64:	784080e7          	jalr	1924(ra) # 800064e4 <_Z11printStringPKc>
                printInt(sepc);
    80002d68:	fd043783          	ld	a5,-48(s0)
    80002d6c:	0007879b          	sext.w	a5,a5
    80002d70:	00000613          	li	a2,0
    80002d74:	00a00593          	li	a1,10
    80002d78:	00078513          	mv	a0,a5
    80002d7c:	00004097          	auipc	ra,0x4
    80002d80:	918080e7          	jalr	-1768(ra) # 80006694 <_Z8printIntiii>
                break;
    80002d84:	0200006f          	j	80002da4 <interruptRoutine+0x508>
                break;
    80002d88:	00000013          	nop
    80002d8c:	0180006f          	j	80002da4 <interruptRoutine+0x508>
                break;
    80002d90:	00000013          	nop
    80002d94:	0100006f          	j	80002da4 <interruptRoutine+0x508>
                break;
    80002d98:	00000013          	nop
    80002d9c:	0080006f          	j	80002da4 <interruptRoutine+0x508>
                break;
    80002da0:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    80002da4:	fd043783          	ld	a5,-48(s0)
    80002da8:	00478793          	addi	a5,a5,4
    80002dac:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002db0:	fd043783          	ld	a5,-48(s0)
    80002db4:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002db8:	fc843783          	ld	a5,-56(s0)
    80002dbc:	10079073          	csrw	sstatus,a5
    80002dc0:	00000013          	nop
        printString("\nsepc: ");
        printInt(sepc);
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    }
    80002dc4:	1ac0006f          	j	80002f70 <interruptRoutine+0x6d4>
    } else if (scause == 0x8000000000000009) {
    80002dc8:	fd843703          	ld	a4,-40(s0)
    80002dcc:	fff00793          	li	a5,-1
    80002dd0:	03f79793          	slli	a5,a5,0x3f
    80002dd4:	00978793          	addi	a5,a5,9
    80002dd8:	08f71463          	bne	a4,a5,80002e60 <interruptRoutine+0x5c4>
        uint64 irq = plic_claim();
    80002ddc:	00005097          	auipc	ra,0x5
    80002de0:	758080e7          	jalr	1880(ra) # 80008534 <plic_claim>
    80002de4:	00050793          	mv	a5,a0
    80002de8:	f8f43c23          	sd	a5,-104(s0)
        if (irq == CONSOLE_IRQ) {
    80002dec:	f9843703          	ld	a4,-104(s0)
    80002df0:	00a00793          	li	a5,10
    80002df4:	02f71c63          	bne	a4,a5,80002e2c <interruptRoutine+0x590>
            if (KConsole::getSRvalue() & CONSOLE_RX_STATUS_BIT) {
    80002df8:	00000097          	auipc	ra,0x0
    80002dfc:	1f8080e7          	jalr	504(ra) # 80002ff0 <_ZN8KConsole10getSRvalueEv>
    80002e00:	00050793          	mv	a5,a0
    80002e04:	0017f793          	andi	a5,a5,1
    80002e08:	00f037b3          	snez	a5,a5
    80002e0c:	0ff7f793          	andi	a5,a5,255
    80002e10:	00078e63          	beqz	a5,80002e2c <interruptRoutine+0x590>
                KConsole::placeInInput(KConsole::getDRvalue());
    80002e14:	00000097          	auipc	ra,0x0
    80002e18:	204080e7          	jalr	516(ra) # 80003018 <_ZN8KConsole10getDRvalueEv>
    80002e1c:	00050793          	mv	a5,a0
    80002e20:	00078513          	mv	a0,a5
    80002e24:	fffff097          	auipc	ra,0xfffff
    80002e28:	9f8080e7          	jalr	-1544(ra) # 8000181c <_ZN8KConsole12placeInInputEc>
        plic_complete(irq);
    80002e2c:	f9843783          	ld	a5,-104(s0)
    80002e30:	0007879b          	sext.w	a5,a5
    80002e34:	00078513          	mv	a0,a5
    80002e38:	00005097          	auipc	ra,0x5
    80002e3c:	734080e7          	jalr	1844(ra) # 8000856c <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002e40:	fd043783          	ld	a5,-48(s0)
    80002e44:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002e48:	fc843783          	ld	a5,-56(s0)
    80002e4c:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    80002e50:	20000513          	li	a0,512
    80002e54:	00000097          	auipc	ra,0x0
    80002e58:	180080e7          	jalr	384(ra) # 80002fd4 <_ZN5Riscv6mc_sipEm>
    80002e5c:	1140006f          	j	80002f70 <interruptRoutine+0x6d4>
    } else if (scause == 0x8000000000000001) {
    80002e60:	fd843703          	ld	a4,-40(s0)
    80002e64:	fff00793          	li	a5,-1
    80002e68:	03f79793          	slli	a5,a5,0x3f
    80002e6c:	00178793          	addi	a5,a5,1
    80002e70:	08f71463          	bne	a4,a5,80002ef8 <interruptRoutine+0x65c>
        Scheduler::wake();
    80002e74:	fffff097          	auipc	ra,0xfffff
    80002e78:	228080e7          	jalr	552(ra) # 8000209c <_ZN9Scheduler4wakeEv>
        TCB::getRunningTimeSlice()++;
    80002e7c:	00000097          	auipc	ra,0x0
    80002e80:	2d0080e7          	jalr	720(ra) # 8000314c <_ZN3TCB19getRunningTimeSliceEv>
    80002e84:	00050793          	mv	a5,a0
    80002e88:	0007b703          	ld	a4,0(a5)
    80002e8c:	00170713          	addi	a4,a4,1
    80002e90:	00e7b023          	sd	a4,0(a5)
        Riscv::mc_sip(Riscv::SIP_SSIP);
    80002e94:	00200513          	li	a0,2
    80002e98:	00000097          	auipc	ra,0x0
    80002e9c:	13c080e7          	jalr	316(ra) # 80002fd4 <_ZN5Riscv6mc_sipEm>
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
    80002ea0:	00000097          	auipc	ra,0x0
    80002ea4:	2ac080e7          	jalr	684(ra) # 8000314c <_ZN3TCB19getRunningTimeSliceEv>
    80002ea8:	00050793          	mv	a5,a0
    80002eac:	0007b483          	ld	s1,0(a5)
    80002eb0:	00000097          	auipc	ra,0x0
    80002eb4:	278080e7          	jalr	632(ra) # 80003128 <_ZN3TCB10getRunningEv>
    80002eb8:	00050793          	mv	a5,a0
    80002ebc:	00078513          	mv	a0,a5
    80002ec0:	00000097          	auipc	ra,0x0
    80002ec4:	230080e7          	jalr	560(ra) # 800030f0 <_ZN3TCB12getTimeSliceEv>
    80002ec8:	00050793          	mv	a5,a0
    80002ecc:	00f4b7b3          	sltu	a5,s1,a5
    80002ed0:	0017c793          	xori	a5,a5,1
    80002ed4:	0ff7f793          	andi	a5,a5,255
    80002ed8:	00078663          	beqz	a5,80002ee4 <interruptRoutine+0x648>
            TCB::dispatch();
    80002edc:	00001097          	auipc	ra,0x1
    80002ee0:	97c080e7          	jalr	-1668(ra) # 80003858 <_ZN3TCB8dispatchEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002ee4:	fd043783          	ld	a5,-48(s0)
    80002ee8:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002eec:	fc843783          	ld	a5,-56(s0)
    80002ef0:	10079073          	csrw	sstatus,a5
    80002ef4:	07c0006f          	j	80002f70 <interruptRoutine+0x6d4>
        printString("\nGreska u prekidnoj rutini\n");
    80002ef8:	00007517          	auipc	a0,0x7
    80002efc:	1e050513          	addi	a0,a0,480 # 8000a0d8 <CONSOLE_STATUS+0xc8>
    80002f00:	00003097          	auipc	ra,0x3
    80002f04:	5e4080e7          	jalr	1508(ra) # 800064e4 <_Z11printStringPKc>
        printString("scause: ");
    80002f08:	00007517          	auipc	a0,0x7
    80002f0c:	1f050513          	addi	a0,a0,496 # 8000a0f8 <CONSOLE_STATUS+0xe8>
    80002f10:	00003097          	auipc	ra,0x3
    80002f14:	5d4080e7          	jalr	1492(ra) # 800064e4 <_Z11printStringPKc>
        printInt(scause);
    80002f18:	fd843783          	ld	a5,-40(s0)
    80002f1c:	0007879b          	sext.w	a5,a5
    80002f20:	00000613          	li	a2,0
    80002f24:	00a00593          	li	a1,10
    80002f28:	00078513          	mv	a0,a5
    80002f2c:	00003097          	auipc	ra,0x3
    80002f30:	768080e7          	jalr	1896(ra) # 80006694 <_Z8printIntiii>
        printString("\nsepc: ");
    80002f34:	00007517          	auipc	a0,0x7
    80002f38:	19c50513          	addi	a0,a0,412 # 8000a0d0 <CONSOLE_STATUS+0xc0>
    80002f3c:	00003097          	auipc	ra,0x3
    80002f40:	5a8080e7          	jalr	1448(ra) # 800064e4 <_Z11printStringPKc>
        printInt(sepc);
    80002f44:	fd043783          	ld	a5,-48(s0)
    80002f48:	0007879b          	sext.w	a5,a5
    80002f4c:	00000613          	li	a2,0
    80002f50:	00a00593          	li	a1,10
    80002f54:	00078513          	mv	a0,a5
    80002f58:	00003097          	auipc	ra,0x3
    80002f5c:	73c080e7          	jalr	1852(ra) # 80006694 <_Z8printIntiii>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002f60:	fd043783          	ld	a5,-48(s0)
    80002f64:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002f68:	fc843783          	ld	a5,-56(s0)
    80002f6c:	10079073          	csrw	sstatus,a5
    80002f70:	00000013          	nop
    80002f74:	06813083          	ld	ra,104(sp)
    80002f78:	06013403          	ld	s0,96(sp)
    80002f7c:	05813483          	ld	s1,88(sp)
    80002f80:	07010113          	addi	sp,sp,112
    80002f84:	00008067          	ret

0000000080002f88 <_ZN4KSemD1Ev>:
#define PROJEKAT2023_KSEM_HPP

#include "../h/ThreadQueue.hpp"

//klasa napravljena po uzoru na semafor u skolskom jezgru
class KSem {
    80002f88:	fe010113          	addi	sp,sp,-32
    80002f8c:	00113c23          	sd	ra,24(sp)
    80002f90:	00813823          	sd	s0,16(sp)
    80002f94:	00913423          	sd	s1,8(sp)
    80002f98:	02010413          	addi	s0,sp,32
    80002f9c:	00050493          	mv	s1,a0
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    80002fa0:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002fa4:	00050e63          	beqz	a0,80002fc0 <_ZN4KSemD1Ev+0x38>
            front = front->next;
    80002fa8:	00853783          	ld	a5,8(a0)
    80002fac:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002fb0:	fe0508e3          	beqz	a0,80002fa0 <_ZN4KSemD1Ev+0x18>
            mem_free(ptr);
    80002fb4:	ffffe097          	auipc	ra,0xffffe
    80002fb8:	420080e7          	jalr	1056(ra) # 800013d4 <_Z8mem_freePv>
        }
    80002fbc:	fe5ff06f          	j	80002fa0 <_ZN4KSemD1Ev+0x18>
    80002fc0:	01813083          	ld	ra,24(sp)
    80002fc4:	01013403          	ld	s0,16(sp)
    80002fc8:	00813483          	ld	s1,8(sp)
    80002fcc:	02010113          	addi	sp,sp,32
    80002fd0:	00008067          	ret

0000000080002fd4 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002fd4:	ff010113          	addi	sp,sp,-16
    80002fd8:	00813423          	sd	s0,8(sp)
    80002fdc:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80002fe0:	14453073          	csrc	sip,a0
}
    80002fe4:	00813403          	ld	s0,8(sp)
    80002fe8:	01010113          	addi	sp,sp,16
    80002fec:	00008067          	ret

0000000080002ff0 <_ZN8KConsole10getSRvalueEv>:
    static uint8 getSRvalue() { return *sr; }
    80002ff0:	ff010113          	addi	sp,sp,-16
    80002ff4:	00813423          	sd	s0,8(sp)
    80002ff8:	01010413          	addi	s0,sp,16
    80002ffc:	0000a797          	auipc	a5,0xa
    80003000:	1347b783          	ld	a5,308(a5) # 8000d130 <_GLOBAL_OFFSET_TABLE_+0xa8>
    80003004:	0007b783          	ld	a5,0(a5)
    80003008:	0007c503          	lbu	a0,0(a5)
    8000300c:	00813403          	ld	s0,8(sp)
    80003010:	01010113          	addi	sp,sp,16
    80003014:	00008067          	ret

0000000080003018 <_ZN8KConsole10getDRvalueEv>:
    static uint8 getDRvalue() { return *dr; }
    80003018:	ff010113          	addi	sp,sp,-16
    8000301c:	00813423          	sd	s0,8(sp)
    80003020:	01010413          	addi	s0,sp,16
    80003024:	0000a797          	auipc	a5,0xa
    80003028:	0c47b783          	ld	a5,196(a5) # 8000d0e8 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000302c:	0007b783          	ld	a5,0(a5)
    80003030:	0007c503          	lbu	a0,0(a5)
    80003034:	00813403          	ld	s0,8(sp)
    80003038:	01010113          	addi	sp,sp,16
    8000303c:	00008067          	ret

0000000080003040 <_ZN8KConsole10setDRvalueEc>:
    static void setDRvalue(char c) { *dr = c; }
    80003040:	ff010113          	addi	sp,sp,-16
    80003044:	00813423          	sd	s0,8(sp)
    80003048:	01010413          	addi	s0,sp,16
    8000304c:	0000a797          	auipc	a5,0xa
    80003050:	09c7b783          	ld	a5,156(a5) # 8000d0e8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003054:	0007b783          	ld	a5,0(a5)
    80003058:	00a78023          	sb	a0,0(a5)
    8000305c:	00813403          	ld	s0,8(sp)
    80003060:	01010113          	addi	sp,sp,16
    80003064:	00008067          	ret

0000000080003068 <_ZN8KConsole23getOutputBufferHasSpaceEv>:

    static sem_t getOutputBufferHasSpace() { return outputBufferHasSpace; }
    80003068:	ff010113          	addi	sp,sp,-16
    8000306c:	00813423          	sd	s0,8(sp)
    80003070:	01010413          	addi	s0,sp,16
    80003074:	0000a797          	auipc	a5,0xa
    80003078:	0847b783          	ld	a5,132(a5) # 8000d0f8 <_GLOBAL_OFFSET_TABLE_+0x70>
    8000307c:	0007b503          	ld	a0,0(a5)
    80003080:	00813403          	ld	s0,8(sp)
    80003084:	01010113          	addi	sp,sp,16
    80003088:	00008067          	ret

000000008000308c <_ZN8KConsole13getOutputHeadEv>:

    static int getOutputHead() { return outputHead; }
    8000308c:	ff010113          	addi	sp,sp,-16
    80003090:	00813423          	sd	s0,8(sp)
    80003094:	01010413          	addi	s0,sp,16
    80003098:	0000a797          	auipc	a5,0xa
    8000309c:	0407b783          	ld	a5,64(a5) # 8000d0d8 <_GLOBAL_OFFSET_TABLE_+0x50>
    800030a0:	0007a503          	lw	a0,0(a5)
    800030a4:	00813403          	ld	s0,8(sp)
    800030a8:	01010113          	addi	sp,sp,16
    800030ac:	00008067          	ret

00000000800030b0 <_ZN8KConsole13getOutputTailEv>:

    static int getOutputTail() { return outputTail; }
    800030b0:	ff010113          	addi	sp,sp,-16
    800030b4:	00813423          	sd	s0,8(sp)
    800030b8:	01010413          	addi	s0,sp,16
    800030bc:	0000a797          	auipc	a5,0xa
    800030c0:	06c7b783          	ld	a5,108(a5) # 8000d128 <_GLOBAL_OFFSET_TABLE_+0xa0>
    800030c4:	0007a503          	lw	a0,0(a5)
    800030c8:	00813403          	ld	s0,8(sp)
    800030cc:	01010113          	addi	sp,sp,16
    800030d0:	00008067          	ret

00000000800030d4 <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    800030d4:	ff010113          	addi	sp,sp,-16
    800030d8:	00813423          	sd	s0,8(sp)
    800030dc:	01010413          	addi	s0,sp,16
    800030e0:	04b52c23          	sw	a1,88(a0)
    800030e4:	00813403          	ld	s0,8(sp)
    800030e8:	01010113          	addi	sp,sp,16
    800030ec:	00008067          	ret

00000000800030f0 <_ZN3TCB12getTimeSliceEv>:
    uint64 getTimeSlice() { return timeSlice; }
    800030f0:	ff010113          	addi	sp,sp,-16
    800030f4:	00813423          	sd	s0,8(sp)
    800030f8:	01010413          	addi	s0,sp,16
    800030fc:	02853503          	ld	a0,40(a0)
    80003100:	00813403          	ld	s0,8(sp)
    80003104:	01010113          	addi	sp,sp,16
    80003108:	00008067          	ret

000000008000310c <_ZN3TCB7getBodyEv>:
    Body getBody() { return threadFunction; }
    8000310c:	ff010113          	addi	sp,sp,-16
    80003110:	00813423          	sd	s0,8(sp)
    80003114:	01010413          	addi	s0,sp,16
    80003118:	01053503          	ld	a0,16(a0)
    8000311c:	00813403          	ld	s0,8(sp)
    80003120:	01010113          	addi	sp,sp,16
    80003124:	00008067          	ret

0000000080003128 <_ZN3TCB10getRunningEv>:
    static TCB* getRunning() { return running; }
    80003128:	ff010113          	addi	sp,sp,-16
    8000312c:	00813423          	sd	s0,8(sp)
    80003130:	01010413          	addi	s0,sp,16
    80003134:	0000a797          	auipc	a5,0xa
    80003138:	fcc7b783          	ld	a5,-52(a5) # 8000d100 <_GLOBAL_OFFSET_TABLE_+0x78>
    8000313c:	0007b503          	ld	a0,0(a5)
    80003140:	00813403          	ld	s0,8(sp)
    80003144:	01010113          	addi	sp,sp,16
    80003148:	00008067          	ret

000000008000314c <_ZN3TCB19getRunningTimeSliceEv>:

    static uint64 &getRunningTimeSlice() { return runningTimeSlice; }
    8000314c:	ff010113          	addi	sp,sp,-16
    80003150:	00813423          	sd	s0,8(sp)
    80003154:	01010413          	addi	s0,sp,16
    80003158:	0000a517          	auipc	a0,0xa
    8000315c:	f4853503          	ld	a0,-184(a0) # 8000d0a0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003160:	00813403          	ld	s0,8(sp)
    80003164:	01010113          	addi	sp,sp,16
    80003168:	00008067          	ret

000000008000316c <_ZN6Thread7wrapperEPv>:

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
    8000316c:	02050863          	beqz	a0,8000319c <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80003170:	ff010113          	addi	sp,sp,-16
    80003174:	00113423          	sd	ra,8(sp)
    80003178:	00813023          	sd	s0,0(sp)
    8000317c:	01010413          	addi	s0,sp,16
        ((Thread*)thread)->run();
    80003180:	00053783          	ld	a5,0(a0)
    80003184:	0107b783          	ld	a5,16(a5)
    80003188:	000780e7          	jalr	a5
    }
}
    8000318c:	00813083          	ld	ra,8(sp)
    80003190:	00013403          	ld	s0,0(sp)
    80003194:	01010113          	addi	sp,sp,16
    80003198:	00008067          	ret
    8000319c:	00008067          	ret

00000000800031a0 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800031a0:	fe010113          	addi	sp,sp,-32
    800031a4:	00113c23          	sd	ra,24(sp)
    800031a8:	00813823          	sd	s0,16(sp)
    800031ac:	00913423          	sd	s1,8(sp)
    800031b0:	02010413          	addi	s0,sp,32
    800031b4:	00050313          	mv	t1,a0
    800031b8:	0000a797          	auipc	a5,0xa
    800031bc:	cc078793          	addi	a5,a5,-832 # 8000ce78 <_ZTV6Thread+0x10>
    800031c0:	00f53023          	sd	a5,0(a0)
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800031c4:	00853e03          	ld	t3,8(a0)
    800031c8:	000e0593          	mv	a1,t3
    __asm__ volatile("li a0, 0x15");
    800031cc:	01500513          	li	a0,21
    __asm__ volatile("ecall");
    800031d0:	00000073          	ecall
    delete myHandle;
    800031d4:	00833483          	ld	s1,8(t1)
    800031d8:	02048863          	beqz	s1,80003208 <_ZN6ThreadD1Ev+0x68>
        return front == nullptr;
    800031dc:	0484b503          	ld	a0,72(s1)
        while (!isEmpty()) {
    800031e0:	00050e63          	beqz	a0,800031fc <_ZN6ThreadD1Ev+0x5c>
            front = front->next;
    800031e4:	00853783          	ld	a5,8(a0)
    800031e8:	04f4b423          	sd	a5,72(s1)
            delete node;
    800031ec:	fe0508e3          	beqz	a0,800031dc <_ZN6ThreadD1Ev+0x3c>
            mem_free(ptr);
    800031f0:	ffffe097          	auipc	ra,0xffffe
    800031f4:	1e4080e7          	jalr	484(ra) # 800013d4 <_Z8mem_freePv>
        }
    800031f8:	fe5ff06f          	j	800031dc <_ZN6ThreadD1Ev+0x3c>
    800031fc:	00048513          	mv	a0,s1
    80003200:	00000097          	auipc	ra,0x0
    80003204:	7d4080e7          	jalr	2004(ra) # 800039d4 <_ZN3TCBdlEPv>
}
    80003208:	01813083          	ld	ra,24(sp)
    8000320c:	01013403          	ld	s0,16(sp)
    80003210:	00813483          	ld	s1,8(sp)
    80003214:	02010113          	addi	sp,sp,32
    80003218:	00008067          	ret

000000008000321c <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    8000321c:	ff010113          	addi	sp,sp,-16
    80003220:	00113423          	sd	ra,8(sp)
    80003224:	00813023          	sd	s0,0(sp)
    80003228:	01010413          	addi	s0,sp,16
    8000322c:	0000a797          	auipc	a5,0xa
    80003230:	c7478793          	addi	a5,a5,-908 # 8000cea0 <_ZTV9Semaphore+0x10>
    80003234:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80003238:	00853503          	ld	a0,8(a0)
    8000323c:	ffffe097          	auipc	ra,0xffffe
    80003240:	334080e7          	jalr	820(ra) # 80001570 <_Z9sem_closeP4KSem>
}
    80003244:	00813083          	ld	ra,8(sp)
    80003248:	00013403          	ld	s0,0(sp)
    8000324c:	01010113          	addi	sp,sp,16
    80003250:	00008067          	ret

0000000080003254 <_Znwm>:
void* operator new(size_t size) {
    80003254:	ff010113          	addi	sp,sp,-16
    80003258:	00113423          	sd	ra,8(sp)
    8000325c:	00813023          	sd	s0,0(sp)
    80003260:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003264:	ffffe097          	auipc	ra,0xffffe
    80003268:	130080e7          	jalr	304(ra) # 80001394 <_Z9mem_allocm>
}
    8000326c:	00813083          	ld	ra,8(sp)
    80003270:	00013403          	ld	s0,0(sp)
    80003274:	01010113          	addi	sp,sp,16
    80003278:	00008067          	ret

000000008000327c <_Znam>:
void* operator new[](size_t size) {
    8000327c:	ff010113          	addi	sp,sp,-16
    80003280:	00113423          	sd	ra,8(sp)
    80003284:	00813023          	sd	s0,0(sp)
    80003288:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    8000328c:	ffffe097          	auipc	ra,0xffffe
    80003290:	108080e7          	jalr	264(ra) # 80001394 <_Z9mem_allocm>
}
    80003294:	00813083          	ld	ra,8(sp)
    80003298:	00013403          	ld	s0,0(sp)
    8000329c:	01010113          	addi	sp,sp,16
    800032a0:	00008067          	ret

00000000800032a4 <_ZdlPv>:
noexcept {
    800032a4:	ff010113          	addi	sp,sp,-16
    800032a8:	00113423          	sd	ra,8(sp)
    800032ac:	00813023          	sd	s0,0(sp)
    800032b0:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800032b4:	ffffe097          	auipc	ra,0xffffe
    800032b8:	120080e7          	jalr	288(ra) # 800013d4 <_Z8mem_freePv>
}
    800032bc:	00813083          	ld	ra,8(sp)
    800032c0:	00013403          	ld	s0,0(sp)
    800032c4:	01010113          	addi	sp,sp,16
    800032c8:	00008067          	ret

00000000800032cc <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800032cc:	fe010113          	addi	sp,sp,-32
    800032d0:	00113c23          	sd	ra,24(sp)
    800032d4:	00813823          	sd	s0,16(sp)
    800032d8:	00913423          	sd	s1,8(sp)
    800032dc:	02010413          	addi	s0,sp,32
    800032e0:	00050493          	mv	s1,a0
}
    800032e4:	00000097          	auipc	ra,0x0
    800032e8:	f38080e7          	jalr	-200(ra) # 8000321c <_ZN9SemaphoreD1Ev>
    800032ec:	00048513          	mv	a0,s1
    800032f0:	00000097          	auipc	ra,0x0
    800032f4:	fb4080e7          	jalr	-76(ra) # 800032a4 <_ZdlPv>
    800032f8:	01813083          	ld	ra,24(sp)
    800032fc:	01013403          	ld	s0,16(sp)
    80003300:	00813483          	ld	s1,8(sp)
    80003304:	02010113          	addi	sp,sp,32
    80003308:	00008067          	ret

000000008000330c <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    8000330c:	fe010113          	addi	sp,sp,-32
    80003310:	00113c23          	sd	ra,24(sp)
    80003314:	00813823          	sd	s0,16(sp)
    80003318:	00913423          	sd	s1,8(sp)
    8000331c:	02010413          	addi	s0,sp,32
    80003320:	00050493          	mv	s1,a0
}
    80003324:	00000097          	auipc	ra,0x0
    80003328:	e7c080e7          	jalr	-388(ra) # 800031a0 <_ZN6ThreadD1Ev>
    8000332c:	00048513          	mv	a0,s1
    80003330:	00000097          	auipc	ra,0x0
    80003334:	f74080e7          	jalr	-140(ra) # 800032a4 <_ZdlPv>
    80003338:	01813083          	ld	ra,24(sp)
    8000333c:	01013403          	ld	s0,16(sp)
    80003340:	00813483          	ld	s1,8(sp)
    80003344:	02010113          	addi	sp,sp,32
    80003348:	00008067          	ret

000000008000334c <_ZdaPv>:
noexcept {
    8000334c:	ff010113          	addi	sp,sp,-16
    80003350:	00113423          	sd	ra,8(sp)
    80003354:	00813023          	sd	s0,0(sp)
    80003358:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000335c:	ffffe097          	auipc	ra,0xffffe
    80003360:	078080e7          	jalr	120(ra) # 800013d4 <_Z8mem_freePv>
}
    80003364:	00813083          	ld	ra,8(sp)
    80003368:	00013403          	ld	s0,0(sp)
    8000336c:	01010113          	addi	sp,sp,16
    80003370:	00008067          	ret

0000000080003374 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80003374:	fd010113          	addi	sp,sp,-48
    80003378:	02113423          	sd	ra,40(sp)
    8000337c:	02813023          	sd	s0,32(sp)
    80003380:	00913c23          	sd	s1,24(sp)
    80003384:	01213823          	sd	s2,16(sp)
    80003388:	01313423          	sd	s3,8(sp)
    8000338c:	03010413          	addi	s0,sp,48
    80003390:	00050493          	mv	s1,a0
    80003394:	00058913          	mv	s2,a1
    80003398:	00060993          	mv	s3,a2
    8000339c:	0000a797          	auipc	a5,0xa
    800033a0:	adc78793          	addi	a5,a5,-1316 # 8000ce78 <_ZTV6Thread+0x10>
    800033a4:	00f53023          	sd	a5,0(a0)
    this->body = body;
    800033a8:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    800033ac:	00c53c23          	sd	a2,24(a0)
    if (body != (TCB::Body)main) {
    800033b0:	0000a797          	auipc	a5,0xa
    800033b4:	d407b783          	ld	a5,-704(a5) # 8000d0f0 <_GLOBAL_OFFSET_TABLE_+0x68>
    800033b8:	04f58663          	beq	a1,a5,80003404 <_ZN6ThreadC1EPFvPvES0_+0x90>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800033bc:	00001537          	lui	a0,0x1
    800033c0:	ffffe097          	auipc	ra,0xffffe
    800033c4:	fd4080e7          	jalr	-44(ra) # 80001394 <_Z9mem_allocm>
    800033c8:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800033cc:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800033d0:	00098693          	mv	a3,s3
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800033d4:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800033d8:	00848493          	addi	s1,s1,8
    800033dc:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    800033e0:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    800033e4:	00000073          	ecall
}
    800033e8:	02813083          	ld	ra,40(sp)
    800033ec:	02013403          	ld	s0,32(sp)
    800033f0:	01813483          	ld	s1,24(sp)
    800033f4:	01013903          	ld	s2,16(sp)
    800033f8:	00813983          	ld	s3,8(sp)
    800033fc:	03010113          	addi	sp,sp,48
    80003400:	00008067          	ret
    uint64* stack = nullptr;
    80003404:	00000313          	li	t1,0
    80003408:	fc5ff06f          	j	800033cc <_ZN6ThreadC1EPFvPvES0_+0x58>

000000008000340c <_ZN6Thread5startEv>:
int Thread::start() {
    8000340c:	ff010113          	addi	sp,sp,-16
    80003410:	00813423          	sd	s0,8(sp)
    80003414:	01010413          	addi	s0,sp,16
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    80003418:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    8000341c:	02030463          	beqz	t1,80003444 <_ZN6Thread5startEv+0x38>
    ThreadStatus getStatus() { return this->status; }
    80003420:	05832783          	lw	a5,88(t1)
    80003424:	02079463          	bnez	a5,8000344c <_ZN6Thread5startEv+0x40>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003428:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    8000342c:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    80003430:	00000073          	ecall
    return 0;
    80003434:	00000513          	li	a0,0
}
    80003438:	00813403          	ld	s0,8(sp)
    8000343c:	01010113          	addi	sp,sp,16
    80003440:	00008067          	ret
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    80003444:	fff00513          	li	a0,-1
    80003448:	ff1ff06f          	j	80003438 <_ZN6Thread5startEv+0x2c>
    8000344c:	fff00513          	li	a0,-1
    80003450:	fe9ff06f          	j	80003438 <_ZN6Thread5startEv+0x2c>

0000000080003454 <_ZN6Thread4joinEv>:
    if (myHandle) thread_join(myHandle);
    80003454:	00853503          	ld	a0,8(a0)
    80003458:	02050663          	beqz	a0,80003484 <_ZN6Thread4joinEv+0x30>
void Thread::join() {
    8000345c:	ff010113          	addi	sp,sp,-16
    80003460:	00113423          	sd	ra,8(sp)
    80003464:	00813023          	sd	s0,0(sp)
    80003468:	01010413          	addi	s0,sp,16
    if (myHandle) thread_join(myHandle);
    8000346c:	ffffe097          	auipc	ra,0xffffe
    80003470:	074080e7          	jalr	116(ra) # 800014e0 <_Z11thread_joinP3TCB>
}
    80003474:	00813083          	ld	ra,8(sp)
    80003478:	00013403          	ld	s0,0(sp)
    8000347c:	01010113          	addi	sp,sp,16
    80003480:	00008067          	ret
    80003484:	00008067          	ret

0000000080003488 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80003488:	ff010113          	addi	sp,sp,-16
    8000348c:	00113423          	sd	ra,8(sp)
    80003490:	00813023          	sd	s0,0(sp)
    80003494:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80003498:	ffffe097          	auipc	ra,0xffffe
    8000349c:	028080e7          	jalr	40(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800034a0:	00813083          	ld	ra,8(sp)
    800034a4:	00013403          	ld	s0,0(sp)
    800034a8:	01010113          	addi	sp,sp,16
    800034ac:	00008067          	ret

00000000800034b0 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    800034b0:	ff010113          	addi	sp,sp,-16
    800034b4:	00113423          	sd	ra,8(sp)
    800034b8:	00813023          	sd	s0,0(sp)
    800034bc:	01010413          	addi	s0,sp,16
    time_sleep(t);
    800034c0:	ffffe097          	auipc	ra,0xffffe
    800034c4:	048080e7          	jalr	72(ra) # 80001508 <_Z10time_sleepm>
}
    800034c8:	00000513          	li	a0,0
    800034cc:	00813083          	ld	ra,8(sp)
    800034d0:	00013403          	ld	s0,0(sp)
    800034d4:	01010113          	addi	sp,sp,16
    800034d8:	00008067          	ret

00000000800034dc <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    800034dc:	fe010113          	addi	sp,sp,-32
    800034e0:	00113c23          	sd	ra,24(sp)
    800034e4:	00813823          	sd	s0,16(sp)
    800034e8:	00913423          	sd	s1,8(sp)
    800034ec:	02010413          	addi	s0,sp,32
    800034f0:	00050493          	mv	s1,a0
    while (period != -1UL) {
    800034f4:	0204b703          	ld	a4,32(s1)
    800034f8:	fff00793          	li	a5,-1
    800034fc:	02f70663          	beq	a4,a5,80003528 <_ZN14PeriodicThread3runEv+0x4c>
        periodicActivation();
    80003500:	0004b783          	ld	a5,0(s1)
    80003504:	0187b783          	ld	a5,24(a5)
    80003508:	00048513          	mv	a0,s1
    8000350c:	000780e7          	jalr	a5
        if (period == -1UL) break;
    80003510:	0204b503          	ld	a0,32(s1)
    80003514:	fff00793          	li	a5,-1
    80003518:	00f50863          	beq	a0,a5,80003528 <_ZN14PeriodicThread3runEv+0x4c>
        sleep(period);
    8000351c:	00000097          	auipc	ra,0x0
    80003520:	f94080e7          	jalr	-108(ra) # 800034b0 <_ZN6Thread5sleepEm>
    while (period != -1UL) {
    80003524:	fd1ff06f          	j	800034f4 <_ZN14PeriodicThread3runEv+0x18>
    }
    thread_exit();
    80003528:	ffffe097          	auipc	ra,0xffffe
    8000352c:	f70080e7          	jalr	-144(ra) # 80001498 <_Z11thread_exitv>
}
    80003530:	01813083          	ld	ra,24(sp)
    80003534:	01013403          	ld	s0,16(sp)
    80003538:	00813483          	ld	s1,8(sp)
    8000353c:	02010113          	addi	sp,sp,32
    80003540:	00008067          	ret

0000000080003544 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80003544:	fe010113          	addi	sp,sp,-32
    80003548:	00113c23          	sd	ra,24(sp)
    8000354c:	00813823          	sd	s0,16(sp)
    80003550:	00913423          	sd	s1,8(sp)
    80003554:	02010413          	addi	s0,sp,32
    80003558:	00050493          	mv	s1,a0
    8000355c:	0000a797          	auipc	a5,0xa
    80003560:	91c78793          	addi	a5,a5,-1764 # 8000ce78 <_ZTV6Thread+0x10>
    80003564:	00f53023          	sd	a5,0(a0)
    this->body = wrapper;
    80003568:	00000797          	auipc	a5,0x0
    8000356c:	c0478793          	addi	a5,a5,-1020 # 8000316c <_ZN6Thread7wrapperEPv>
    80003570:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80003574:	00a53c23          	sd	a0,24(a0)
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80003578:	00001537          	lui	a0,0x1
    8000357c:	ffffe097          	auipc	ra,0xffffe
    80003580:	e18080e7          	jalr	-488(ra) # 80001394 <_Z9mem_allocm>
    80003584:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003588:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000358c:	0184b303          	ld	t1,24(s1)
    80003590:	00030693          	mv	a3,t1
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003594:	0104b303          	ld	t1,16(s1)
    80003598:	00030613          	mv	a2,t1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000359c:	00848493          	addi	s1,s1,8
    800035a0:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    800035a4:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    800035a8:	00000073          	ecall
}
    800035ac:	01813083          	ld	ra,24(sp)
    800035b0:	01013403          	ld	s0,16(sp)
    800035b4:	00813483          	ld	s1,8(sp)
    800035b8:	02010113          	addi	sp,sp,32
    800035bc:	00008067          	ret

00000000800035c0 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800035c0:	ff010113          	addi	sp,sp,-16
    800035c4:	00113423          	sd	ra,8(sp)
    800035c8:	00813023          	sd	s0,0(sp)
    800035cc:	01010413          	addi	s0,sp,16
    800035d0:	0000a797          	auipc	a5,0xa
    800035d4:	8d078793          	addi	a5,a5,-1840 # 8000cea0 <_ZTV9Semaphore+0x10>
    800035d8:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle, init);
    800035dc:	00850513          	addi	a0,a0,8
    800035e0:	ffffe097          	auipc	ra,0xffffe
    800035e4:	f58080e7          	jalr	-168(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    800035e8:	00813083          	ld	ra,8(sp)
    800035ec:	00013403          	ld	s0,0(sp)
    800035f0:	01010113          	addi	sp,sp,16
    800035f4:	00008067          	ret

00000000800035f8 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    800035f8:	ff010113          	addi	sp,sp,-16
    800035fc:	00113423          	sd	ra,8(sp)
    80003600:	00813023          	sd	s0,0(sp)
    80003604:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80003608:	00853503          	ld	a0,8(a0)
    8000360c:	ffffe097          	auipc	ra,0xffffe
    80003610:	f94080e7          	jalr	-108(ra) # 800015a0 <_Z8sem_waitP4KSem>
}
    80003614:	00813083          	ld	ra,8(sp)
    80003618:	00013403          	ld	s0,0(sp)
    8000361c:	01010113          	addi	sp,sp,16
    80003620:	00008067          	ret

0000000080003624 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80003624:	ff010113          	addi	sp,sp,-16
    80003628:	00113423          	sd	ra,8(sp)
    8000362c:	00813023          	sd	s0,0(sp)
    80003630:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80003634:	00853503          	ld	a0,8(a0)
    80003638:	ffffe097          	auipc	ra,0xffffe
    8000363c:	f98080e7          	jalr	-104(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80003640:	00813083          	ld	ra,8(sp)
    80003644:	00013403          	ld	s0,0(sp)
    80003648:	01010113          	addi	sp,sp,16
    8000364c:	00008067          	ret

0000000080003650 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80003650:	ff010113          	addi	sp,sp,-16
    80003654:	00113423          	sd	ra,8(sp)
    80003658:	00813023          	sd	s0,0(sp)
    8000365c:	01010413          	addi	s0,sp,16
    this->period = -1;
    80003660:	fff00793          	li	a5,-1
    80003664:	02f53023          	sd	a5,32(a0)
    join();
    80003668:	00000097          	auipc	ra,0x0
    8000366c:	dec080e7          	jalr	-532(ra) # 80003454 <_ZN6Thread4joinEv>
}
    80003670:	00813083          	ld	ra,8(sp)
    80003674:	00013403          	ld	s0,0(sp)
    80003678:	01010113          	addi	sp,sp,16
    8000367c:	00008067          	ret

0000000080003680 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    80003680:	fe010113          	addi	sp,sp,-32
    80003684:	00113c23          	sd	ra,24(sp)
    80003688:	00813823          	sd	s0,16(sp)
    8000368c:	00913423          	sd	s1,8(sp)
    80003690:	01213023          	sd	s2,0(sp)
    80003694:	02010413          	addi	s0,sp,32
    80003698:	00050493          	mv	s1,a0
    8000369c:	00058913          	mv	s2,a1
    800036a0:	00000097          	auipc	ra,0x0
    800036a4:	ea4080e7          	jalr	-348(ra) # 80003544 <_ZN6ThreadC1Ev>
    800036a8:	0000a797          	auipc	a5,0xa
    800036ac:	81878793          	addi	a5,a5,-2024 # 8000cec0 <_ZTV14PeriodicThread+0x10>
    800036b0:	00f4b023          	sd	a5,0(s1)
    800036b4:	0324b023          	sd	s2,32(s1)
}
    800036b8:	01813083          	ld	ra,24(sp)
    800036bc:	01013403          	ld	s0,16(sp)
    800036c0:	00813483          	ld	s1,8(sp)
    800036c4:	00013903          	ld	s2,0(sp)
    800036c8:	02010113          	addi	sp,sp,32
    800036cc:	00008067          	ret

00000000800036d0 <_ZN7Console4getcEv>:

char Console::getc() {
    800036d0:	ff010113          	addi	sp,sp,-16
    800036d4:	00113423          	sd	ra,8(sp)
    800036d8:	00813023          	sd	s0,0(sp)
    800036dc:	01010413          	addi	s0,sp,16
    return ::getc();
    800036e0:	ffffe097          	auipc	ra,0xffffe
    800036e4:	f20080e7          	jalr	-224(ra) # 80001600 <_Z4getcv>
}
    800036e8:	00813083          	ld	ra,8(sp)
    800036ec:	00013403          	ld	s0,0(sp)
    800036f0:	01010113          	addi	sp,sp,16
    800036f4:	00008067          	ret

00000000800036f8 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    800036f8:	ff010113          	addi	sp,sp,-16
    800036fc:	00113423          	sd	ra,8(sp)
    80003700:	00813023          	sd	s0,0(sp)
    80003704:	01010413          	addi	s0,sp,16
    ::putc(c);
    80003708:	ffffe097          	auipc	ra,0xffffe
    8000370c:	f20080e7          	jalr	-224(ra) # 80001628 <_Z4putcc>
}
    80003710:	00813083          	ld	ra,8(sp)
    80003714:	00013403          	ld	s0,0(sp)
    80003718:	01010113          	addi	sp,sp,16
    8000371c:	00008067          	ret

0000000080003720 <_ZN6Thread3runEv>:
    virtual void run() {}
    80003720:	ff010113          	addi	sp,sp,-16
    80003724:	00813423          	sd	s0,8(sp)
    80003728:	01010413          	addi	s0,sp,16
    8000372c:	00813403          	ld	s0,8(sp)
    80003730:	01010113          	addi	sp,sp,16
    80003734:	00008067          	ret

0000000080003738 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    80003738:	ff010113          	addi	sp,sp,-16
    8000373c:	00813423          	sd	s0,8(sp)
    80003740:	01010413          	addi	s0,sp,16
    80003744:	00813403          	ld	s0,8(sp)
    80003748:	01010113          	addi	sp,sp,16
    8000374c:	00008067          	ret

0000000080003750 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80003750:	ff010113          	addi	sp,sp,-16
    80003754:	00113423          	sd	ra,8(sp)
    80003758:	00813023          	sd	s0,0(sp)
    8000375c:	01010413          	addi	s0,sp,16
    80003760:	00009797          	auipc	a5,0x9
    80003764:	76078793          	addi	a5,a5,1888 # 8000cec0 <_ZTV14PeriodicThread+0x10>
    80003768:	00f53023          	sd	a5,0(a0)
    8000376c:	00000097          	auipc	ra,0x0
    80003770:	a34080e7          	jalr	-1484(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80003774:	00813083          	ld	ra,8(sp)
    80003778:	00013403          	ld	s0,0(sp)
    8000377c:	01010113          	addi	sp,sp,16
    80003780:	00008067          	ret

0000000080003784 <_ZN14PeriodicThreadD0Ev>:
    80003784:	fe010113          	addi	sp,sp,-32
    80003788:	00113c23          	sd	ra,24(sp)
    8000378c:	00813823          	sd	s0,16(sp)
    80003790:	00913423          	sd	s1,8(sp)
    80003794:	02010413          	addi	s0,sp,32
    80003798:	00050493          	mv	s1,a0
    8000379c:	00009797          	auipc	a5,0x9
    800037a0:	72478793          	addi	a5,a5,1828 # 8000cec0 <_ZTV14PeriodicThread+0x10>
    800037a4:	00f53023          	sd	a5,0(a0)
    800037a8:	00000097          	auipc	ra,0x0
    800037ac:	9f8080e7          	jalr	-1544(ra) # 800031a0 <_ZN6ThreadD1Ev>
    800037b0:	00048513          	mv	a0,s1
    800037b4:	00000097          	auipc	ra,0x0
    800037b8:	af0080e7          	jalr	-1296(ra) # 800032a4 <_ZdlPv>
    800037bc:	01813083          	ld	ra,24(sp)
    800037c0:	01013403          	ld	s0,16(sp)
    800037c4:	00813483          	ld	s1,8(sp)
    800037c8:	02010113          	addi	sp,sp,32
    800037cc:	00008067          	ret

00000000800037d0 <_ZN3TCB7wrapperEv>:


    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
}

void TCB::wrapper() {
    800037d0:	ff010113          	addi	sp,sp,-16
    800037d4:	00113423          	sd	ra,8(sp)
    800037d8:	00813023          	sd	s0,0(sp)
    800037dc:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch)

    //sada biramo u kom rezimu ce se izvrsavati nit, upisom bita SSTATUS_SPP
    //ako treba da se izvrsava kernel nit, povratak je u sistemski rezim, inace u korisnicki
    if (TCB::running->threadFunction == (TCB::Body)main || TCB::running->threadFunction == kernelConsumerFunction ||
    800037e0:	0000a797          	auipc	a5,0xa
    800037e4:	ab87b783          	ld	a5,-1352(a5) # 8000d298 <_ZN3TCB7runningE>
    800037e8:	0107b783          	ld	a5,16(a5)
    800037ec:	0000a717          	auipc	a4,0xa
    800037f0:	90473703          	ld	a4,-1788(a4) # 8000d0f0 <_GLOBAL_OFFSET_TABLE_+0x68>
    800037f4:	02e78463          	beq	a5,a4,8000381c <_ZN3TCB7wrapperEv+0x4c>
    800037f8:	0000a717          	auipc	a4,0xa
    800037fc:	8d073703          	ld	a4,-1840(a4) # 8000d0c8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003800:	00e78e63          	beq	a5,a4,8000381c <_ZN3TCB7wrapperEv+0x4c>
    80003804:	0000a717          	auipc	a4,0xa
    80003808:	91c73703          	ld	a4,-1764(a4) # 8000d120 <_GLOBAL_OFFSET_TABLE_+0x98>
    8000380c:	00e78863          	beq	a5,a4,8000381c <_ZN3TCB7wrapperEv+0x4c>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003810:	10000793          	li	a5,256
    80003814:	1007b073          	csrc	sstatus,a5
}
    80003818:	00c0006f          	j	80003824 <_ZN3TCB7wrapperEv+0x54>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    8000381c:	10000793          	li	a5,256
    80003820:	1007a073          	csrs	sstatus,a5
        TCB::running->threadFunction == idle) {
        Riscv::ms_sstatus(Riscv::SSTATUS_SPP);
    } else {
        Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    }
    Riscv::returnFromInterrupt();
    80003824:	00000097          	auipc	ra,0x0
    80003828:	400080e7          	jalr	1024(ra) # 80003c24 <_ZN5Riscv19returnFromInterruptEv>
    //na dalje se izvrsavamo u user modu (osim za kernel funkcije)
    running->threadFunction(running->args);
    8000382c:	0000a797          	auipc	a5,0xa
    80003830:	a6c7b783          	ld	a5,-1428(a5) # 8000d298 <_ZN3TCB7runningE>
    80003834:	0107b703          	ld	a4,16(a5)
    80003838:	0207b503          	ld	a0,32(a5)
    8000383c:	000700e7          	jalr	a4
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    80003840:	ffffe097          	auipc	ra,0xffffe
    80003844:	c58080e7          	jalr	-936(ra) # 80001498 <_Z11thread_exitv>
}
    80003848:	00813083          	ld	ra,8(sp)
    8000384c:	00013403          	ld	s0,0(sp)
    80003850:	01010113          	addi	sp,sp,16
    80003854:	00008067          	ret

0000000080003858 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80003858:	fe010113          	addi	sp,sp,-32
    8000385c:	00113c23          	sd	ra,24(sp)
    80003860:	00813823          	sd	s0,16(sp)
    80003864:	00913423          	sd	s1,8(sp)
    80003868:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    8000386c:	0000a497          	auipc	s1,0xa
    80003870:	a2c4b483          	ld	s1,-1492(s1) # 8000d298 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    80003874:	0584a783          	lw	a5,88(s1)
    80003878:	00100713          	li	a4,1
    8000387c:	04e78663          	beq	a5,a4,800038c8 <_ZN3TCB8dispatchEv+0x70>
    } else if (old->status == FINISHED) {
    80003880:	00500713          	li	a4,5
    80003884:	04e78a63          	beq	a5,a4,800038d8 <_ZN3TCB8dispatchEv+0x80>
    TCB::running = Scheduler::get();
    80003888:	ffffe097          	auipc	ra,0xffffe
    8000388c:	724080e7          	jalr	1828(ra) # 80001fac <_ZN9Scheduler3getEv>
    80003890:	00050593          	mv	a1,a0
    80003894:	0000a797          	auipc	a5,0xa
    80003898:	a0478793          	addi	a5,a5,-1532 # 8000d298 <_ZN3TCB7runningE>
    8000389c:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    800038a0:	0007b423          	sd	zero,8(a5)
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    800038a4:	00a48863          	beq	s1,a0,800038b4 <_ZN3TCB8dispatchEv+0x5c>
    800038a8:	00048513          	mv	a0,s1
    800038ac:	ffffe097          	auipc	ra,0xffffe
    800038b0:	864080e7          	jalr	-1948(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800038b4:	01813083          	ld	ra,24(sp)
    800038b8:	01013403          	ld	s0,16(sp)
    800038bc:	00813483          	ld	s1,8(sp)
    800038c0:	02010113          	addi	sp,sp,32
    800038c4:	00008067          	ret
        Scheduler::put(old);
    800038c8:	00048513          	mv	a0,s1
    800038cc:	ffffe097          	auipc	ra,0xffffe
    800038d0:	694080e7          	jalr	1684(ra) # 80001f60 <_ZN9Scheduler3putEP3TCB>
    800038d4:	fb5ff06f          	j	80003888 <_ZN3TCB8dispatchEv+0x30>
        delete old->stack;
    800038d8:	0184b503          	ld	a0,24(s1)
    800038dc:	00050663          	beqz	a0,800038e8 <_ZN3TCB8dispatchEv+0x90>
    800038e0:	00000097          	auipc	ra,0x0
    800038e4:	9c4080e7          	jalr	-1596(ra) # 800032a4 <_ZdlPv>
        old->stack = nullptr;
    800038e8:	0004bc23          	sd	zero,24(s1)
    800038ec:	f9dff06f          	j	80003888 <_ZN3TCB8dispatchEv+0x30>

00000000800038f0 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    800038f0:	ff010113          	addi	sp,sp,-16
    800038f4:	00113423          	sd	ra,8(sp)
    800038f8:	00813023          	sd	s0,0(sp)
    800038fc:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003900:	ffffe097          	auipc	ra,0xffffe
    80003904:	a94080e7          	jalr	-1388(ra) # 80001394 <_Z9mem_allocm>
}
    80003908:	00813083          	ld	ra,8(sp)
    8000390c:	00013403          	ld	s0,0(sp)
    80003910:	01010113          	addi	sp,sp,16
    80003914:	00008067          	ret

0000000080003918 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80003918:	fd010113          	addi	sp,sp,-48
    8000391c:	02113423          	sd	ra,40(sp)
    80003920:	02813023          	sd	s0,32(sp)
    80003924:	00913c23          	sd	s1,24(sp)
    80003928:	01213823          	sd	s2,16(sp)
    8000392c:	01313423          	sd	s3,8(sp)
    80003930:	03010413          	addi	s0,sp,48
    80003934:	00050913          	mv	s2,a0
    80003938:	00058993          	mv	s3,a1
    8000393c:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    80003940:	07000513          	li	a0,112
    80003944:	00000097          	auipc	ra,0x0
    80003948:	fac080e7          	jalr	-84(ra) # 800038f0 <_ZN3TCBnwEm>
private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED), mySemaphore(nullptr),
                                                    joiningWithTCB(nullptr) {
    8000394c:	01253823          	sd	s2,16(a0)
    80003950:	00953c23          	sd	s1,24(a0)
    80003954:	03353023          	sd	s3,32(a0)
    80003958:	00200793          	li	a5,2
    8000395c:	02f53423          	sd	a5,40(a0)
    80003960:	02053823          	sd	zero,48(a0)
    80003964:	02053c23          	sd	zero,56(a0)
    80003968:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    8000396c:	04053423          	sd	zero,72(a0)
    80003970:	04053823          	sd	zero,80(a0)
    80003974:	04052c23          	sw	zero,88(a0)
    80003978:	06053023          	sd	zero,96(a0)
    8000397c:	06053423          	sd	zero,104(a0)
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80003980:	00009797          	auipc	a5,0x9
    80003984:	7707b783          	ld	a5,1904(a5) # 8000d0f0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003988:	02f90e63          	beq	s2,a5,800039c4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    8000398c:	00000797          	auipc	a5,0x0
    80003990:	e4478793          	addi	a5,a5,-444 # 800037d0 <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80003994:	02048c63          	beqz	s1,800039cc <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb4>
    80003998:	00001637          	lui	a2,0x1
    8000399c:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    800039a0:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    800039a4:	00953423          	sd	s1,8(a0)
}
    800039a8:	02813083          	ld	ra,40(sp)
    800039ac:	02013403          	ld	s0,32(sp)
    800039b0:	01813483          	ld	s1,24(sp)
    800039b4:	01013903          	ld	s2,16(sp)
    800039b8:	00813983          	ld	s3,8(sp)
    800039bc:	03010113          	addi	sp,sp,48
    800039c0:	00008067          	ret
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    800039c4:	00000793          	li	a5,0
    800039c8:	fcdff06f          	j	80003994 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x7c>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    800039cc:	00000493          	li	s1,0
    800039d0:	fd1ff06f          	j	800039a0 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x88>

00000000800039d4 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    800039d4:	ff010113          	addi	sp,sp,-16
    800039d8:	00113423          	sd	ra,8(sp)
    800039dc:	00813023          	sd	s0,0(sp)
    800039e0:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    800039e4:	ffffe097          	auipc	ra,0xffffe
    800039e8:	9f0080e7          	jalr	-1552(ra) # 800013d4 <_Z8mem_freePv>
}
    800039ec:	00813083          	ld	ra,8(sp)
    800039f0:	00013403          	ld	s0,0(sp)
    800039f4:	01010113          	addi	sp,sp,16
    800039f8:	00008067          	ret

00000000800039fc <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED || TCB::running == handle) return;
    800039fc:	05852703          	lw	a4,88(a0)
    80003a00:	00500793          	li	a5,5
    80003a04:	04f70463          	beq	a4,a5,80003a4c <_ZN3TCB10threadJoinEPS_+0x50>
    80003a08:	0000a597          	auipc	a1,0xa
    80003a0c:	8905b583          	ld	a1,-1904(a1) # 8000d298 <_ZN3TCB7runningE>
    80003a10:	02a58e63          	beq	a1,a0,80003a4c <_ZN3TCB10threadJoinEPS_+0x50>
void TCB::threadJoin(TCB* handle) {
    80003a14:	ff010113          	addi	sp,sp,-16
    80003a18:	00113423          	sd	ra,8(sp)
    80003a1c:	00813023          	sd	s0,0(sp)
    80003a20:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    80003a24:	00300793          	li	a5,3
    80003a28:	04f5ac23          	sw	a5,88(a1)
    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }
    80003a2c:	06a5b423          	sd	a0,104(a1)
    TCB::running->setJoiningWithTCB(handle);
    handle->waitingToJoin.putLast(TCB::running);
    80003a30:	04850513          	addi	a0,a0,72
    80003a34:	ffffe097          	auipc	ra,0xffffe
    80003a38:	808080e7          	jalr	-2040(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
}
    80003a3c:	00813083          	ld	ra,8(sp)
    80003a40:	00013403          	ld	s0,0(sp)
    80003a44:	01010113          	addi	sp,sp,16
    80003a48:	00008067          	ret
    80003a4c:	00008067          	ret

0000000080003a50 <_ZN3TCB13releaseJoinedEPS_>:

void TCB::releaseJoined(TCB* handle) {
    80003a50:	fe010113          	addi	sp,sp,-32
    80003a54:	00113c23          	sd	ra,24(sp)
    80003a58:	00813823          	sd	s0,16(sp)
    80003a5c:	00913423          	sd	s1,8(sp)
    80003a60:	02010413          	addi	s0,sp,32
    80003a64:	00050493          	mv	s1,a0
        return front == nullptr;
    80003a68:	0484b783          	ld	a5,72(s1)
    while (!handle->waitingToJoin.isEmpty()) {
    80003a6c:	02078063          	beqz	a5,80003a8c <_ZN3TCB13releaseJoinedEPS_+0x3c>
        TCB* tcb = handle->waitingToJoin.getFirst();
    80003a70:	04848513          	addi	a0,s1,72
    80003a74:	ffffe097          	auipc	ra,0xffffe
    80003a78:	834080e7          	jalr	-1996(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
    80003a7c:	06053423          	sd	zero,104(a0)
        tcb->setJoiningWithTCB(nullptr);
        Scheduler::put(tcb);
    80003a80:	ffffe097          	auipc	ra,0xffffe
    80003a84:	4e0080e7          	jalr	1248(ra) # 80001f60 <_ZN9Scheduler3putEP3TCB>
    while (!handle->waitingToJoin.isEmpty()) {
    80003a88:	fe1ff06f          	j	80003a68 <_ZN3TCB13releaseJoinedEPS_+0x18>
    }
}
    80003a8c:	01813083          	ld	ra,24(sp)
    80003a90:	01013403          	ld	s0,16(sp)
    80003a94:	00813483          	ld	s1,8(sp)
    80003a98:	02010113          	addi	sp,sp,32
    80003a9c:	00008067          	ret

0000000080003aa0 <_ZN3TCB10quitThreadEPS_>:

void TCB::quitThread(TCB* handle) {
    80003aa0:	fe010113          	addi	sp,sp,-32
    80003aa4:	00113c23          	sd	ra,24(sp)
    80003aa8:	00813823          	sd	s0,16(sp)
    80003aac:	00913423          	sd	s1,8(sp)
    80003ab0:	02010413          	addi	s0,sp,32
    80003ab4:	00050493          	mv	s1,a0
    TCB* prev, * curr;
    switch (handle->status) {
    80003ab8:	05852783          	lw	a5,88(a0)
    80003abc:	00300713          	li	a4,3
    80003ac0:	10e78063          	beq	a5,a4,80003bc0 <_ZN3TCB10quitThreadEPS_+0x120>
    80003ac4:	04f76263          	bltu	a4,a5,80003b08 <_ZN3TCB10quitThreadEPS_+0x68>
    80003ac8:	00100713          	li	a4,1
    80003acc:	06e78263          	beq	a5,a4,80003b30 <_ZN3TCB10quitThreadEPS_+0x90>
    80003ad0:	00200713          	li	a4,2
    80003ad4:	08e79e63          	bne	a5,a4,80003b70 <_ZN3TCB10quitThreadEPS_+0xd0>
            }
            curr->nextInScheduler = nullptr;
            break;
        case BLOCKED:
            //nit blokirana na semaforu, treba da se izbaci iz reda blokiranih na semaforu
            if (handle->mySemaphore->getBlocked()->remove(handle) < 0) {
    80003ad8:	06053503          	ld	a0,96(a0)
    80003adc:	00048593          	mv	a1,s1
    80003ae0:	00850513          	addi	a0,a0,8
    80003ae4:	ffffe097          	auipc	ra,0xffffe
    80003ae8:	824080e7          	jalr	-2012(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    80003aec:	08054263          	bltz	a0,80003b70 <_ZN3TCB10quitThreadEPS_+0xd0>
                //greska
            } else {
                handle->mySemaphore->increaseVal(1);
    80003af0:	0604b703          	ld	a4,96(s1)

    static void operator delete(void* ptr);

    ThreadQueue* getBlocked() { return &blocked; }

    void increaseVal(int add) { val += add; }
    80003af4:	00072783          	lw	a5,0(a4)
    80003af8:	0017879b          	addiw	a5,a5,1
    80003afc:	00f72023          	sw	a5,0(a4)
                handle->mySemaphore = nullptr;
    80003b00:	0604b023          	sd	zero,96(s1)
    80003b04:	06c0006f          	j	80003b70 <_ZN3TCB10quitThreadEPS_+0xd0>
    switch (handle->status) {
    80003b08:	00400713          	li	a4,4
    80003b0c:	06e79263          	bne	a5,a4,80003b70 <_ZN3TCB10quitThreadEPS_+0xd0>

    static TCB* getTail() { return tail; }

    static void setTail(TCB* tcb) { tail = tcb; }

    static TCB* getSleepingHead() { return sleepingHead; }
    80003b10:	00009797          	auipc	a5,0x9
    80003b14:	6087b783          	ld	a5,1544(a5) # 8000d118 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003b18:	0007b783          	ld	a5,0(a5)
                handle->joiningWithTCB = nullptr;
            }
            break;
        case SLEEPING:
            //nit je u redu uspavanih, treba da se izbaci
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    80003b1c:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextSleeping);
    80003b20:	0c978063          	beq	a5,s1,80003be0 <_ZN3TCB10quitThreadEPS_+0x140>
    80003b24:	00078713          	mv	a4,a5
    80003b28:	0407b783          	ld	a5,64(a5)
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    80003b2c:	ff5ff06f          	j	80003b20 <_ZN3TCB10quitThreadEPS_+0x80>
    static TCB* getHead() { return head; }
    80003b30:	00009797          	auipc	a5,0x9
    80003b34:	5a07b783          	ld	a5,1440(a5) # 8000d0d0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80003b38:	0007b783          	ld	a5,0(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    80003b3c:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextInScheduler);
    80003b40:	00978863          	beq	a5,s1,80003b50 <_ZN3TCB10quitThreadEPS_+0xb0>
    80003b44:	00078713          	mv	a4,a5
    80003b48:	0307b783          	ld	a5,48(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    80003b4c:	ff5ff06f          	j	80003b40 <_ZN3TCB10quitThreadEPS_+0xa0>
            if (!prev) {
    80003b50:	04070663          	beqz	a4,80003b9c <_ZN3TCB10quitThreadEPS_+0xfc>
                prev->nextInScheduler = curr->nextInScheduler;
    80003b54:	0307b683          	ld	a3,48(a5)
    80003b58:	02d73823          	sd	a3,48(a4)
    static TCB* getTail() { return tail; }
    80003b5c:	00009697          	auipc	a3,0x9
    80003b60:	5546b683          	ld	a3,1364(a3) # 8000d0b0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003b64:	0006b683          	ld	a3,0(a3)
            if (curr == Scheduler::getTail()) {
    80003b68:	04d78463          	beq	a5,a3,80003bb0 <_ZN3TCB10quitThreadEPS_+0x110>
            curr->nextInScheduler = nullptr;
    80003b6c:	0207b823          	sd	zero,48(a5)
        case FINISHED:
            break;
        default:
            break;
    }
    handle->status = FINISHED;
    80003b70:	00500793          	li	a5,5
    80003b74:	04f4ac23          	sw	a5,88(s1)
    delete handle->stack;
    80003b78:	0184b503          	ld	a0,24(s1)
    80003b7c:	00050663          	beqz	a0,80003b88 <_ZN3TCB10quitThreadEPS_+0xe8>
    80003b80:	fffff097          	auipc	ra,0xfffff
    80003b84:	724080e7          	jalr	1828(ra) # 800032a4 <_ZdlPv>
}
    80003b88:	01813083          	ld	ra,24(sp)
    80003b8c:	01013403          	ld	s0,16(sp)
    80003b90:	00813483          	ld	s1,8(sp)
    80003b94:	02010113          	addi	sp,sp,32
    80003b98:	00008067          	ret
                Scheduler::setHead(curr->nextInScheduler);
    80003b9c:	0307b603          	ld	a2,48(a5)
    static void setHead(TCB* tcb) { head = tcb; }
    80003ba0:	00009697          	auipc	a3,0x9
    80003ba4:	5306b683          	ld	a3,1328(a3) # 8000d0d0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80003ba8:	00c6b023          	sd	a2,0(a3)
    80003bac:	fb1ff06f          	j	80003b5c <_ZN3TCB10quitThreadEPS_+0xbc>
    static void setTail(TCB* tcb) { tail = tcb; }
    80003bb0:	00009697          	auipc	a3,0x9
    80003bb4:	5006b683          	ld	a3,1280(a3) # 8000d0b0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003bb8:	00e6b023          	sd	a4,0(a3)
    80003bbc:	fb1ff06f          	j	80003b6c <_ZN3TCB10quitThreadEPS_+0xcc>
            if (handle->joiningWithTCB->getListOfJoiningThreads()->remove(handle) < 0) {
    80003bc0:	06853503          	ld	a0,104(a0)
    80003bc4:	00048593          	mv	a1,s1
    80003bc8:	04850513          	addi	a0,a0,72
    80003bcc:	ffffd097          	auipc	ra,0xffffd
    80003bd0:	73c080e7          	jalr	1852(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    80003bd4:	f8054ee3          	bltz	a0,80003b70 <_ZN3TCB10quitThreadEPS_+0xd0>
                handle->joiningWithTCB = nullptr;
    80003bd8:	0604b423          	sd	zero,104(s1)
    80003bdc:	f95ff06f          	j	80003b70 <_ZN3TCB10quitThreadEPS_+0xd0>
            if (!prev) {
    80003be0:	02070863          	beqz	a4,80003c10 <_ZN3TCB10quitThreadEPS_+0x170>
                prev->nextSleeping = curr->nextSleeping;
    80003be4:	0407b683          	ld	a3,64(a5)
    80003be8:	04d73023          	sd	a3,64(a4)
            if (curr->nextSleeping) {
    80003bec:	0407b703          	ld	a4,64(a5)
    80003bf0:	00070a63          	beqz	a4,80003c04 <_ZN3TCB10quitThreadEPS_+0x164>
                curr->nextSleeping->timeToSleep += curr->timeToSleep;
    80003bf4:	0387b603          	ld	a2,56(a5)
    80003bf8:	03873683          	ld	a3,56(a4)
    80003bfc:	00c686b3          	add	a3,a3,a2
    80003c00:	02d73c23          	sd	a3,56(a4)
            curr->timeToSleep = 0;
    80003c04:	0207bc23          	sd	zero,56(a5)
            curr->nextSleeping = nullptr;
    80003c08:	0407b023          	sd	zero,64(a5)
            break;
    80003c0c:	f65ff06f          	j	80003b70 <_ZN3TCB10quitThreadEPS_+0xd0>
                Scheduler::setSleepingHead(curr->nextSleeping);
    80003c10:	0407b683          	ld	a3,64(a5)

    static void setSleepingHead(TCB* tcb) { sleepingHead = tcb; }
    80003c14:	00009717          	auipc	a4,0x9
    80003c18:	50473703          	ld	a4,1284(a4) # 8000d118 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003c1c:	00d73023          	sd	a3,0(a4)
    80003c20:	fcdff06f          	j	80003bec <_ZN3TCB10quitThreadEPS_+0x14c>

0000000080003c24 <_ZN5Riscv19returnFromInterruptEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::returnFromInterrupt() {
    80003c24:	ff010113          	addi	sp,sp,-16
    80003c28:	00813423          	sd	s0,8(sp)
    80003c2c:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80003c30:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80003c34:	10200073          	sret
    80003c38:	00813403          	ld	s0,8(sp)
    80003c3c:	01010113          	addi	sp,sp,16
    80003c40:	00008067          	ret

0000000080003c44 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80003c44:	ff010113          	addi	sp,sp,-16
    80003c48:	00113423          	sd	ra,8(sp)
    80003c4c:	00813023          	sd	s0,0(sp)
    80003c50:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003c54:	ffffd097          	auipc	ra,0xffffd
    80003c58:	740080e7          	jalr	1856(ra) # 80001394 <_Z9mem_allocm>
}
    80003c5c:	00813083          	ld	ra,8(sp)
    80003c60:	00013403          	ld	s0,0(sp)
    80003c64:	01010113          	addi	sp,sp,16
    80003c68:	00008067          	ret

0000000080003c6c <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80003c6c:	ff010113          	addi	sp,sp,-16
    80003c70:	00113423          	sd	ra,8(sp)
    80003c74:	00813023          	sd	s0,0(sp)
    80003c78:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003c7c:	ffffd097          	auipc	ra,0xffffd
    80003c80:	758080e7          	jalr	1880(ra) # 800013d4 <_Z8mem_freePv>
}
    80003c84:	00813083          	ld	ra,8(sp)
    80003c88:	00013403          	ld	s0,0(sp)
    80003c8c:	01010113          	addi	sp,sp,16
    80003c90:	00008067          	ret

0000000080003c94 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003c94:	fe010113          	addi	sp,sp,-32
    80003c98:	00113c23          	sd	ra,24(sp)
    80003c9c:	00813823          	sd	s0,16(sp)
    80003ca0:	00913423          	sd	s1,8(sp)
    80003ca4:	02010413          	addi	s0,sp,32
    80003ca8:	00050493          	mv	s1,a0
	return new KSem(val);
    80003cac:	01800513          	li	a0,24
    80003cb0:	00000097          	auipc	ra,0x0
    80003cb4:	f94080e7          	jalr	-108(ra) # 80003c44 <_ZN4KSemnwEm>
    void block();

    void unblock();

private:
    KSem(uint val) : val(val) {}
    80003cb8:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003cbc:	00053423          	sd	zero,8(a0)
    80003cc0:	00053823          	sd	zero,16(a0)
}
    80003cc4:	01813083          	ld	ra,24(sp)
    80003cc8:	01013403          	ld	s0,16(sp)
    80003ccc:	00813483          	ld	s1,8(sp)
    80003cd0:	02010113          	addi	sp,sp,32
    80003cd4:	00008067          	ret

0000000080003cd8 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003cd8:	ff010113          	addi	sp,sp,-16
    80003cdc:	00113423          	sd	ra,8(sp)
    80003ce0:	00813023          	sd	s0,0(sp)
    80003ce4:	01010413          	addi	s0,sp,16
    static TCB* getRunning() { return running; }
    80003ce8:	00009797          	auipc	a5,0x9
    80003cec:	4187b783          	ld	a5,1048(a5) # 8000d100 <_GLOBAL_OFFSET_TABLE_+0x78>
    80003cf0:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80003cf4:	00200793          	li	a5,2
    80003cf8:	04f5ac23          	sw	a5,88(a1)
    void setMySemaphore(KSem* sem) { mySemaphore = sem; }
    80003cfc:	06a5b023          	sd	a0,96(a1)
    TCB::getRunning()->setStatus(TCB::BLOCKED);
    TCB::getRunning()->setMySemaphore(this);
	blocked.putLast(TCB::getRunning());
    80003d00:	00850513          	addi	a0,a0,8
    80003d04:	ffffd097          	auipc	ra,0xffffd
    80003d08:	538080e7          	jalr	1336(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::dispatch();
    80003d0c:	00000097          	auipc	ra,0x0
    80003d10:	b4c080e7          	jalr	-1204(ra) # 80003858 <_ZN3TCB8dispatchEv>
}
    80003d14:	00813083          	ld	ra,8(sp)
    80003d18:	00013403          	ld	s0,0(sp)
    80003d1c:	01010113          	addi	sp,sp,16
    80003d20:	00008067          	ret

0000000080003d24 <_ZN4KSem4waitEv>:
	if (--val < 0) {
    80003d24:	00052783          	lw	a5,0(a0)
    80003d28:	fff7879b          	addiw	a5,a5,-1
    80003d2c:	00f52023          	sw	a5,0(a0)
    80003d30:	02079713          	slli	a4,a5,0x20
    80003d34:	00074663          	bltz	a4,80003d40 <_ZN4KSem4waitEv+0x1c>
	return 0;
    80003d38:	00000513          	li	a0,0
}
    80003d3c:	00008067          	ret
int KSem::wait() {
    80003d40:	ff010113          	addi	sp,sp,-16
    80003d44:	00113423          	sd	ra,8(sp)
    80003d48:	00813023          	sd	s0,0(sp)
    80003d4c:	01010413          	addi	s0,sp,16
		block();
    80003d50:	00000097          	auipc	ra,0x0
    80003d54:	f88080e7          	jalr	-120(ra) # 80003cd8 <_ZN4KSem5blockEv>
		return -1;
    80003d58:	fff00513          	li	a0,-1
}
    80003d5c:	00813083          	ld	ra,8(sp)
    80003d60:	00013403          	ld	s0,0(sp)
    80003d64:	01010113          	addi	sp,sp,16
    80003d68:	00008067          	ret

0000000080003d6c <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003d6c:	ff010113          	addi	sp,sp,-16
    80003d70:	00113423          	sd	ra,8(sp)
    80003d74:	00813023          	sd	s0,0(sp)
    80003d78:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003d7c:	00850513          	addi	a0,a0,8
    80003d80:	ffffd097          	auipc	ra,0xffffd
    80003d84:	528080e7          	jalr	1320(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
    80003d88:	06053023          	sd	zero,96(a0)
    tcb->setMySemaphore(nullptr);
	Scheduler::put(tcb);
    80003d8c:	ffffe097          	auipc	ra,0xffffe
    80003d90:	1d4080e7          	jalr	468(ra) # 80001f60 <_ZN9Scheduler3putEP3TCB>
}
    80003d94:	00813083          	ld	ra,8(sp)
    80003d98:	00013403          	ld	s0,0(sp)
    80003d9c:	01010113          	addi	sp,sp,16
    80003da0:	00008067          	ret

0000000080003da4 <_ZN4KSem6signalEv>:
	if (val++ < 0) {
    80003da4:	00052783          	lw	a5,0(a0)
    80003da8:	0017871b          	addiw	a4,a5,1
    80003dac:	00e52023          	sw	a4,0(a0)
    80003db0:	0007c663          	bltz	a5,80003dbc <_ZN4KSem6signalEv+0x18>
}
    80003db4:	00000513          	li	a0,0
    80003db8:	00008067          	ret
int KSem::signal() {
    80003dbc:	ff010113          	addi	sp,sp,-16
    80003dc0:	00113423          	sd	ra,8(sp)
    80003dc4:	00813023          	sd	s0,0(sp)
    80003dc8:	01010413          	addi	s0,sp,16
		unblock();
    80003dcc:	00000097          	auipc	ra,0x0
    80003dd0:	fa0080e7          	jalr	-96(ra) # 80003d6c <_ZN4KSem7unblockEv>
}
    80003dd4:	00000513          	li	a0,0
    80003dd8:	00813083          	ld	ra,8(sp)
    80003ddc:	00013403          	ld	s0,0(sp)
    80003de0:	01010113          	addi	sp,sp,16
    80003de4:	00008067          	ret

0000000080003de8 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003de8:	fe010113          	addi	sp,sp,-32
    80003dec:	00113c23          	sd	ra,24(sp)
    80003df0:	00813823          	sd	s0,16(sp)
    80003df4:	00913423          	sd	s1,8(sp)
    80003df8:	02010413          	addi	s0,sp,32
    80003dfc:	00050493          	mv	s1,a0
        return front == nullptr;
    80003e00:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003e04:	00078a63          	beqz	a5,80003e18 <_ZN4KSem8closeSemEPS_+0x30>
		handle->unblock();
    80003e08:	00048513          	mv	a0,s1
    80003e0c:	00000097          	auipc	ra,0x0
    80003e10:	f60080e7          	jalr	-160(ra) # 80003d6c <_ZN4KSem7unblockEv>
	while (!handle->blocked.isEmpty()) {
    80003e14:	fedff06f          	j	80003e00 <_ZN4KSem8closeSemEPS_+0x18>
	}
	return 0;
}
    80003e18:	00000513          	li	a0,0
    80003e1c:	01813083          	ld	ra,24(sp)
    80003e20:	01013403          	ld	s0,16(sp)
    80003e24:	00813483          	ld	s1,8(sp)
    80003e28:	02010113          	addi	sp,sp,32
    80003e2c:	00008067          	ret

0000000080003e30 <_Z13emptyFunctionPv>:
void idle(void*);

void kernelConsumerFunction(void*);


void emptyFunction(void*) {}
    80003e30:	ff010113          	addi	sp,sp,-16
    80003e34:	00813423          	sd	s0,8(sp)
    80003e38:	01010413          	addi	s0,sp,16
    80003e3c:	00813403          	ld	s0,8(sp)
    80003e40:	01010113          	addi	sp,sp,16
    80003e44:	00008067          	ret

0000000080003e48 <_Z5nit1fPv>:

void nit1f(void*) {
    80003e48:	fe010113          	addi	sp,sp,-32
    80003e4c:	00113c23          	sd	ra,24(sp)
    80003e50:	00813823          	sd	s0,16(sp)
    80003e54:	02010413          	addi	s0,sp,32
    while (true) {
        thread_t handle;
        thread_create(&handle, emptyFunction, nullptr);
    80003e58:	00000613          	li	a2,0
    80003e5c:	00000597          	auipc	a1,0x0
    80003e60:	fd458593          	addi	a1,a1,-44 # 80003e30 <_Z13emptyFunctionPv>
    80003e64:	fe840513          	addi	a0,s0,-24
    80003e68:	ffffd097          	auipc	ra,0xffffd
    80003e6c:	59c080e7          	jalr	1436(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    while (true) {
    80003e70:	fe9ff06f          	j	80003e58 <_Z5nit1fPv+0x10>

0000000080003e74 <_Z5nit2fPv>:
    }

    printString("\nGotova nit 1\n");
}

void nit2f(void* arg2) {
    80003e74:	ff010113          	addi	sp,sp,-16
    80003e78:	00113423          	sd	ra,8(sp)
    80003e7c:	00813023          	sd	s0,0(sp)
    80003e80:	01010413          	addi	s0,sp,16
    printString("\nGotova nit 2\n");
    80003e84:	00006517          	auipc	a0,0x6
    80003e88:	1e450513          	addi	a0,a0,484 # 8000a068 <CONSOLE_STATUS+0x58>
    80003e8c:	00002097          	auipc	ra,0x2
    80003e90:	658080e7          	jalr	1624(ra) # 800064e4 <_Z11printStringPKc>
}
    80003e94:	00813083          	ld	ra,8(sp)
    80003e98:	00013403          	ld	s0,0(sp)
    80003e9c:	01010113          	addi	sp,sp,16
    80003ea0:	00008067          	ret

0000000080003ea4 <_Z5nit3fPv>:


void nit3f(void*) {
    80003ea4:	fe010113          	addi	sp,sp,-32
    80003ea8:	00113c23          	sd	ra,24(sp)
    80003eac:	00813823          	sd	s0,16(sp)
    80003eb0:	00913423          	sd	s1,8(sp)
    80003eb4:	02010413          	addi	s0,sp,32
    80003eb8:	0180006f          	j	80003ed0 <_Z5nit3fPv+0x2c>
    char slovo;
    do {
        slovo = getc();
        putc(slovo);
        if (slovo == '\r') putc('\n');
    80003ebc:	00a00513          	li	a0,10
    80003ec0:	ffffd097          	auipc	ra,0xffffd
    80003ec4:	768080e7          	jalr	1896(ra) # 80001628 <_Z4putcc>
    } while (slovo != '0');
    80003ec8:	03000793          	li	a5,48
    80003ecc:	02f48263          	beq	s1,a5,80003ef0 <_Z5nit3fPv+0x4c>
        slovo = getc();
    80003ed0:	ffffd097          	auipc	ra,0xffffd
    80003ed4:	730080e7          	jalr	1840(ra) # 80001600 <_Z4getcv>
    80003ed8:	00050493          	mv	s1,a0
        putc(slovo);
    80003edc:	ffffd097          	auipc	ra,0xffffd
    80003ee0:	74c080e7          	jalr	1868(ra) # 80001628 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    80003ee4:	00d00793          	li	a5,13
    80003ee8:	fef490e3          	bne	s1,a5,80003ec8 <_Z5nit3fPv+0x24>
    80003eec:	fd1ff06f          	j	80003ebc <_Z5nit3fPv+0x18>

    printString("\nGotova nit3\n");
    80003ef0:	00006517          	auipc	a0,0x6
    80003ef4:	42050513          	addi	a0,a0,1056 # 8000a310 <CONSOLE_STATUS+0x300>
    80003ef8:	00002097          	auipc	ra,0x2
    80003efc:	5ec080e7          	jalr	1516(ra) # 800064e4 <_Z11printStringPKc>
}
    80003f00:	01813083          	ld	ra,24(sp)
    80003f04:	01013403          	ld	s0,16(sp)
    80003f08:	00813483          	ld	s1,8(sp)
    80003f0c:	02010113          	addi	sp,sp,32
    80003f10:	00008067          	ret

0000000080003f14 <_Z5main5v>:


int main5() {
    80003f14:	fb010113          	addi	sp,sp,-80
    80003f18:	04113423          	sd	ra,72(sp)
    80003f1c:	04813023          	sd	s0,64(sp)
    80003f20:	02913c23          	sd	s1,56(sp)
    80003f24:	05010413          	addi	s0,sp,80
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80003f28:	00009797          	auipc	a5,0x9
    80003f2c:	1e87b783          	ld	a5,488(a5) # 8000d110 <_GLOBAL_OFFSET_TABLE_+0x88>
    80003f30:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80003f34:	ffffe097          	auipc	ra,0xffffe
    80003f38:	36c080e7          	jalr	876(ra) # 800022a0 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80003f3c:	ffffd097          	auipc	ra,0xffffd
    80003f40:	7d0080e7          	jalr	2000(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>

    //testiranje kreiranja niti
    thread_t glavnaNit = nullptr;
    80003f44:	fc043c23          	sd	zero,-40(s0)
    thread_t nit1 = nullptr;
    80003f48:	fc043823          	sd	zero,-48(s0)
    thread_t nit2 = nullptr;
    80003f4c:	fc043423          	sd	zero,-56(s0)
    thread_t nit3 = nullptr;
    80003f50:	fc043023          	sd	zero,-64(s0)
    thread_t idleNit = nullptr;
    80003f54:	fa043c23          	sd	zero,-72(s0)
    thread_t kernelConsumerThread = nullptr;
    80003f58:	fa043823          	sd	zero,-80(s0)
    thread_create(&glavnaNit, (TCB::Body)main, nullptr);
    80003f5c:	00000613          	li	a2,0
    80003f60:	00009597          	auipc	a1,0x9
    80003f64:	1905b583          	ld	a1,400(a1) # 8000d0f0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003f68:	fd840513          	addi	a0,s0,-40
    80003f6c:	ffffd097          	auipc	ra,0xffffd
    80003f70:	498080e7          	jalr	1176(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }
    80003f74:	fd843703          	ld	a4,-40(s0)
    80003f78:	00009797          	auipc	a5,0x9
    80003f7c:	1887b783          	ld	a5,392(a5) # 8000d100 <_GLOBAL_OFFSET_TABLE_+0x78>
    80003f80:	00e7b023          	sd	a4,0(a5)
    TCB::setRunning(glavnaNit);
    thread_create(&idleNit, idle, nullptr);
    80003f84:	00000613          	li	a2,0
    80003f88:	00009597          	auipc	a1,0x9
    80003f8c:	1985b583          	ld	a1,408(a1) # 8000d120 <_GLOBAL_OFFSET_TABLE_+0x98>
    80003f90:	fb840513          	addi	a0,s0,-72
    80003f94:	ffffd097          	auipc	ra,0xffffd
    80003f98:	470080e7          	jalr	1136(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    80003f9c:	00000613          	li	a2,0
    80003fa0:	00009597          	auipc	a1,0x9
    80003fa4:	1285b583          	ld	a1,296(a1) # 8000d0c8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003fa8:	fb040513          	addi	a0,s0,-80
    80003fac:	ffffd097          	auipc	ra,0xffffd
    80003fb0:	458080e7          	jalr	1112(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>


    thread_create(&nit1, nit1f, nullptr);
    80003fb4:	00000613          	li	a2,0
    80003fb8:	00000597          	auipc	a1,0x0
    80003fbc:	e9058593          	addi	a1,a1,-368 # 80003e48 <_Z5nit1fPv>
    80003fc0:	fd040513          	addi	a0,s0,-48
    80003fc4:	ffffd097          	auipc	ra,0xffffd
    80003fc8:	440080e7          	jalr	1088(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit2, nit2f, nullptr);
    80003fcc:	00000613          	li	a2,0
    80003fd0:	00000597          	auipc	a1,0x0
    80003fd4:	ea458593          	addi	a1,a1,-348 # 80003e74 <_Z5nit2fPv>
    80003fd8:	fc840513          	addi	a0,s0,-56
    80003fdc:	ffffd097          	auipc	ra,0xffffd
    80003fe0:	428080e7          	jalr	1064(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit3, nit3f, nullptr);
    80003fe4:	00000613          	li	a2,0
    80003fe8:	00000597          	auipc	a1,0x0
    80003fec:	ebc58593          	addi	a1,a1,-324 # 80003ea4 <_Z5nit3fPv>
    80003ff0:	fc040513          	addi	a0,s0,-64
    80003ff4:	ffffd097          	auipc	ra,0xffffd
    80003ff8:	410080e7          	jalr	1040(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    80003ffc:	00200493          	li	s1,2
    80004000:	1004a073          	csrs	sstatus,s1

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    thread_join(nit1);
    80004004:	fd043503          	ld	a0,-48(s0)
    80004008:	ffffd097          	auipc	ra,0xffffd
    8000400c:	4d8080e7          	jalr	1240(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit2);
    80004010:	fc843503          	ld	a0,-56(s0)
    80004014:	ffffd097          	auipc	ra,0xffffd
    80004018:	4cc080e7          	jalr	1228(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit3);
    8000401c:	fc043503          	ld	a0,-64(s0)
    80004020:	ffffd097          	auipc	ra,0xffffd
    80004024:	4c0080e7          	jalr	1216(ra) # 800014e0 <_Z11thread_joinP3TCB>
    //thread_join(idleNit);

    printString("\nGotove user niti\n");
    80004028:	00006517          	auipc	a0,0x6
    8000402c:	2f850513          	addi	a0,a0,760 # 8000a320 <CONSOLE_STATUS+0x310>
    80004030:	00002097          	auipc	ra,0x2
    80004034:	4b4080e7          	jalr	1204(ra) # 800064e4 <_Z11printStringPKc>

    printString("\nSad cu da izadjem\n");
    80004038:	00006517          	auipc	a0,0x6
    8000403c:	30050513          	addi	a0,a0,768 # 8000a338 <CONSOLE_STATUS+0x328>
    80004040:	00002097          	auipc	ra,0x2
    80004044:	4a4080e7          	jalr	1188(ra) # 800064e4 <_Z11printStringPKc>
        __asm__ volatile("li a0, 0x43");
    80004048:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    8000404c:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80004050:	1004b073          	csrc	sstatus,s1
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);


    return 0;
    80004054:	00000513          	li	a0,0
    80004058:	04813083          	ld	ra,72(sp)
    8000405c:	04013403          	ld	s0,64(sp)
    80004060:	03813483          	ld	s1,56(sp)
    80004064:	05010113          	addi	sp,sp,80
    80004068:	00008067          	ret

000000008000406c <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    8000406c:	fe010113          	addi	sp,sp,-32
    80004070:	00113c23          	sd	ra,24(sp)
    80004074:	00813823          	sd	s0,16(sp)
    80004078:	00913423          	sd	s1,8(sp)
    8000407c:	01213023          	sd	s2,0(sp)
    80004080:	02010413          	addi	s0,sp,32
    80004084:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004088:	00000913          	li	s2,0
    8000408c:	00c0006f          	j	80004098 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80004090:	ffffd097          	auipc	ra,0xffffd
    80004094:	430080e7          	jalr	1072(ra) # 800014c0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80004098:	ffffd097          	auipc	ra,0xffffd
    8000409c:	568080e7          	jalr	1384(ra) # 80001600 <_Z4getcv>
    800040a0:	0005059b          	sext.w	a1,a0
    800040a4:	02d00793          	li	a5,45
    800040a8:	02f58a63          	beq	a1,a5,800040dc <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800040ac:	0084b503          	ld	a0,8(s1)
    800040b0:	00003097          	auipc	ra,0x3
    800040b4:	400080e7          	jalr	1024(ra) # 800074b0 <_ZN6Buffer3putEi>
        i++;
    800040b8:	0019071b          	addiw	a4,s2,1
    800040bc:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800040c0:	0004a683          	lw	a3,0(s1)
    800040c4:	0026979b          	slliw	a5,a3,0x2
    800040c8:	00d787bb          	addw	a5,a5,a3
    800040cc:	0017979b          	slliw	a5,a5,0x1
    800040d0:	02f767bb          	remw	a5,a4,a5
    800040d4:	fc0792e3          	bnez	a5,80004098 <_ZL16producerKeyboardPv+0x2c>
    800040d8:	fb9ff06f          	j	80004090 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800040dc:	00100793          	li	a5,1
    800040e0:	00009717          	auipc	a4,0x9
    800040e4:	1cf72423          	sw	a5,456(a4) # 8000d2a8 <_ZL9threadEnd>
    data->buffer->put('!');
    800040e8:	02100593          	li	a1,33
    800040ec:	0084b503          	ld	a0,8(s1)
    800040f0:	00003097          	auipc	ra,0x3
    800040f4:	3c0080e7          	jalr	960(ra) # 800074b0 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800040f8:	0104b503          	ld	a0,16(s1)
    800040fc:	ffffd097          	auipc	ra,0xffffd
    80004100:	4d4080e7          	jalr	1236(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80004104:	01813083          	ld	ra,24(sp)
    80004108:	01013403          	ld	s0,16(sp)
    8000410c:	00813483          	ld	s1,8(sp)
    80004110:	00013903          	ld	s2,0(sp)
    80004114:	02010113          	addi	sp,sp,32
    80004118:	00008067          	ret

000000008000411c <_ZL8producerPv>:

static void producer(void *arg) {
    8000411c:	fe010113          	addi	sp,sp,-32
    80004120:	00113c23          	sd	ra,24(sp)
    80004124:	00813823          	sd	s0,16(sp)
    80004128:	00913423          	sd	s1,8(sp)
    8000412c:	01213023          	sd	s2,0(sp)
    80004130:	02010413          	addi	s0,sp,32
    80004134:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004138:	00000913          	li	s2,0
    8000413c:	00c0006f          	j	80004148 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80004140:	ffffd097          	auipc	ra,0xffffd
    80004144:	380080e7          	jalr	896(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80004148:	00009797          	auipc	a5,0x9
    8000414c:	1607a783          	lw	a5,352(a5) # 8000d2a8 <_ZL9threadEnd>
    80004150:	02079e63          	bnez	a5,8000418c <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80004154:	0004a583          	lw	a1,0(s1)
    80004158:	0305859b          	addiw	a1,a1,48
    8000415c:	0084b503          	ld	a0,8(s1)
    80004160:	00003097          	auipc	ra,0x3
    80004164:	350080e7          	jalr	848(ra) # 800074b0 <_ZN6Buffer3putEi>
        i++;
    80004168:	0019071b          	addiw	a4,s2,1
    8000416c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004170:	0004a683          	lw	a3,0(s1)
    80004174:	0026979b          	slliw	a5,a3,0x2
    80004178:	00d787bb          	addw	a5,a5,a3
    8000417c:	0017979b          	slliw	a5,a5,0x1
    80004180:	02f767bb          	remw	a5,a4,a5
    80004184:	fc0792e3          	bnez	a5,80004148 <_ZL8producerPv+0x2c>
    80004188:	fb9ff06f          	j	80004140 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    8000418c:	0104b503          	ld	a0,16(s1)
    80004190:	ffffd097          	auipc	ra,0xffffd
    80004194:	440080e7          	jalr	1088(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80004198:	01813083          	ld	ra,24(sp)
    8000419c:	01013403          	ld	s0,16(sp)
    800041a0:	00813483          	ld	s1,8(sp)
    800041a4:	00013903          	ld	s2,0(sp)
    800041a8:	02010113          	addi	sp,sp,32
    800041ac:	00008067          	ret

00000000800041b0 <_ZL8consumerPv>:

static void consumer(void *arg) {
    800041b0:	fd010113          	addi	sp,sp,-48
    800041b4:	02113423          	sd	ra,40(sp)
    800041b8:	02813023          	sd	s0,32(sp)
    800041bc:	00913c23          	sd	s1,24(sp)
    800041c0:	01213823          	sd	s2,16(sp)
    800041c4:	01313423          	sd	s3,8(sp)
    800041c8:	03010413          	addi	s0,sp,48
    800041cc:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800041d0:	00000993          	li	s3,0
    800041d4:	01c0006f          	j	800041f0 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800041d8:	ffffd097          	auipc	ra,0xffffd
    800041dc:	2e8080e7          	jalr	744(ra) # 800014c0 <_Z15thread_dispatchv>
    800041e0:	0500006f          	j	80004230 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800041e4:	00a00513          	li	a0,10
    800041e8:	ffffd097          	auipc	ra,0xffffd
    800041ec:	440080e7          	jalr	1088(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    800041f0:	00009797          	auipc	a5,0x9
    800041f4:	0b87a783          	lw	a5,184(a5) # 8000d2a8 <_ZL9threadEnd>
    800041f8:	06079063          	bnez	a5,80004258 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800041fc:	00893503          	ld	a0,8(s2)
    80004200:	00003097          	auipc	ra,0x3
    80004204:	340080e7          	jalr	832(ra) # 80007540 <_ZN6Buffer3getEv>
        i++;
    80004208:	0019849b          	addiw	s1,s3,1
    8000420c:	0004899b          	sext.w	s3,s1
        putc(key);
    80004210:	0ff57513          	andi	a0,a0,255
    80004214:	ffffd097          	auipc	ra,0xffffd
    80004218:	414080e7          	jalr	1044(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    8000421c:	00092703          	lw	a4,0(s2)
    80004220:	0027179b          	slliw	a5,a4,0x2
    80004224:	00e787bb          	addw	a5,a5,a4
    80004228:	02f4e7bb          	remw	a5,s1,a5
    8000422c:	fa0786e3          	beqz	a5,800041d8 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80004230:	05000793          	li	a5,80
    80004234:	02f4e4bb          	remw	s1,s1,a5
    80004238:	fa049ce3          	bnez	s1,800041f0 <_ZL8consumerPv+0x40>
    8000423c:	fa9ff06f          	j	800041e4 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80004240:	00893503          	ld	a0,8(s2)
    80004244:	00003097          	auipc	ra,0x3
    80004248:	2fc080e7          	jalr	764(ra) # 80007540 <_ZN6Buffer3getEv>
        putc(key);
    8000424c:	0ff57513          	andi	a0,a0,255
    80004250:	ffffd097          	auipc	ra,0xffffd
    80004254:	3d8080e7          	jalr	984(ra) # 80001628 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80004258:	00893503          	ld	a0,8(s2)
    8000425c:	00003097          	auipc	ra,0x3
    80004260:	370080e7          	jalr	880(ra) # 800075cc <_ZN6Buffer6getCntEv>
    80004264:	fca04ee3          	bgtz	a0,80004240 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80004268:	01093503          	ld	a0,16(s2)
    8000426c:	ffffd097          	auipc	ra,0xffffd
    80004270:	364080e7          	jalr	868(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80004274:	02813083          	ld	ra,40(sp)
    80004278:	02013403          	ld	s0,32(sp)
    8000427c:	01813483          	ld	s1,24(sp)
    80004280:	01013903          	ld	s2,16(sp)
    80004284:	00813983          	ld	s3,8(sp)
    80004288:	03010113          	addi	sp,sp,48
    8000428c:	00008067          	ret

0000000080004290 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80004290:	f9010113          	addi	sp,sp,-112
    80004294:	06113423          	sd	ra,104(sp)
    80004298:	06813023          	sd	s0,96(sp)
    8000429c:	04913c23          	sd	s1,88(sp)
    800042a0:	05213823          	sd	s2,80(sp)
    800042a4:	05313423          	sd	s3,72(sp)
    800042a8:	05413023          	sd	s4,64(sp)
    800042ac:	03513c23          	sd	s5,56(sp)
    800042b0:	03613823          	sd	s6,48(sp)
    800042b4:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800042b8:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800042bc:	00006517          	auipc	a0,0x6
    800042c0:	09450513          	addi	a0,a0,148 # 8000a350 <CONSOLE_STATUS+0x340>
    800042c4:	00002097          	auipc	ra,0x2
    800042c8:	220080e7          	jalr	544(ra) # 800064e4 <_Z11printStringPKc>
    getString(input, 30);
    800042cc:	01e00593          	li	a1,30
    800042d0:	fa040493          	addi	s1,s0,-96
    800042d4:	00048513          	mv	a0,s1
    800042d8:	00002097          	auipc	ra,0x2
    800042dc:	294080e7          	jalr	660(ra) # 8000656c <_Z9getStringPci>
    threadNum = stringToInt(input);
    800042e0:	00048513          	mv	a0,s1
    800042e4:	00002097          	auipc	ra,0x2
    800042e8:	360080e7          	jalr	864(ra) # 80006644 <_Z11stringToIntPKc>
    800042ec:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800042f0:	00006517          	auipc	a0,0x6
    800042f4:	08050513          	addi	a0,a0,128 # 8000a370 <CONSOLE_STATUS+0x360>
    800042f8:	00002097          	auipc	ra,0x2
    800042fc:	1ec080e7          	jalr	492(ra) # 800064e4 <_Z11printStringPKc>
    getString(input, 30);
    80004300:	01e00593          	li	a1,30
    80004304:	00048513          	mv	a0,s1
    80004308:	00002097          	auipc	ra,0x2
    8000430c:	264080e7          	jalr	612(ra) # 8000656c <_Z9getStringPci>
    n = stringToInt(input);
    80004310:	00048513          	mv	a0,s1
    80004314:	00002097          	auipc	ra,0x2
    80004318:	330080e7          	jalr	816(ra) # 80006644 <_Z11stringToIntPKc>
    8000431c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004320:	00006517          	auipc	a0,0x6
    80004324:	07050513          	addi	a0,a0,112 # 8000a390 <CONSOLE_STATUS+0x380>
    80004328:	00002097          	auipc	ra,0x2
    8000432c:	1bc080e7          	jalr	444(ra) # 800064e4 <_Z11printStringPKc>
	printInt(threadNum);
    80004330:	00000613          	li	a2,0
    80004334:	00a00593          	li	a1,10
    80004338:	00090513          	mv	a0,s2
    8000433c:	00002097          	auipc	ra,0x2
    80004340:	358080e7          	jalr	856(ra) # 80006694 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004344:	00006517          	auipc	a0,0x6
    80004348:	06450513          	addi	a0,a0,100 # 8000a3a8 <CONSOLE_STATUS+0x398>
    8000434c:	00002097          	auipc	ra,0x2
    80004350:	198080e7          	jalr	408(ra) # 800064e4 <_Z11printStringPKc>
	printInt(n);
    80004354:	00000613          	li	a2,0
    80004358:	00a00593          	li	a1,10
    8000435c:	00048513          	mv	a0,s1
    80004360:	00002097          	auipc	ra,0x2
    80004364:	334080e7          	jalr	820(ra) # 80006694 <_Z8printIntiii>
    printString(".\n");
    80004368:	00006517          	auipc	a0,0x6
    8000436c:	05850513          	addi	a0,a0,88 # 8000a3c0 <CONSOLE_STATUS+0x3b0>
    80004370:	00002097          	auipc	ra,0x2
    80004374:	174080e7          	jalr	372(ra) # 800064e4 <_Z11printStringPKc>
    if(threadNum > n) {
    80004378:	0324c463          	blt	s1,s2,800043a0 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    8000437c:	03205c63          	blez	s2,800043b4 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80004380:	03800513          	li	a0,56
    80004384:	fffff097          	auipc	ra,0xfffff
    80004388:	ed0080e7          	jalr	-304(ra) # 80003254 <_Znwm>
    8000438c:	00050a13          	mv	s4,a0
    80004390:	00048593          	mv	a1,s1
    80004394:	00003097          	auipc	ra,0x3
    80004398:	080080e7          	jalr	128(ra) # 80007414 <_ZN6BufferC1Ei>
    8000439c:	0300006f          	j	800043cc <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800043a0:	00006517          	auipc	a0,0x6
    800043a4:	02850513          	addi	a0,a0,40 # 8000a3c8 <CONSOLE_STATUS+0x3b8>
    800043a8:	00002097          	auipc	ra,0x2
    800043ac:	13c080e7          	jalr	316(ra) # 800064e4 <_Z11printStringPKc>
        return;
    800043b0:	0140006f          	j	800043c4 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800043b4:	00006517          	auipc	a0,0x6
    800043b8:	05450513          	addi	a0,a0,84 # 8000a408 <CONSOLE_STATUS+0x3f8>
    800043bc:	00002097          	auipc	ra,0x2
    800043c0:	128080e7          	jalr	296(ra) # 800064e4 <_Z11printStringPKc>
        return;
    800043c4:	000b0113          	mv	sp,s6
    800043c8:	1500006f          	j	80004518 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    800043cc:	00000593          	li	a1,0
    800043d0:	00009517          	auipc	a0,0x9
    800043d4:	ee050513          	addi	a0,a0,-288 # 8000d2b0 <_ZL10waitForAll>
    800043d8:	ffffd097          	auipc	ra,0xffffd
    800043dc:	160080e7          	jalr	352(ra) # 80001538 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    800043e0:	00391793          	slli	a5,s2,0x3
    800043e4:	00f78793          	addi	a5,a5,15
    800043e8:	ff07f793          	andi	a5,a5,-16
    800043ec:	40f10133          	sub	sp,sp,a5
    800043f0:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800043f4:	0019071b          	addiw	a4,s2,1
    800043f8:	00171793          	slli	a5,a4,0x1
    800043fc:	00e787b3          	add	a5,a5,a4
    80004400:	00379793          	slli	a5,a5,0x3
    80004404:	00f78793          	addi	a5,a5,15
    80004408:	ff07f793          	andi	a5,a5,-16
    8000440c:	40f10133          	sub	sp,sp,a5
    80004410:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80004414:	00191613          	slli	a2,s2,0x1
    80004418:	012607b3          	add	a5,a2,s2
    8000441c:	00379793          	slli	a5,a5,0x3
    80004420:	00f987b3          	add	a5,s3,a5
    80004424:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80004428:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    8000442c:	00009717          	auipc	a4,0x9
    80004430:	e8473703          	ld	a4,-380(a4) # 8000d2b0 <_ZL10waitForAll>
    80004434:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80004438:	00078613          	mv	a2,a5
    8000443c:	00000597          	auipc	a1,0x0
    80004440:	d7458593          	addi	a1,a1,-652 # 800041b0 <_ZL8consumerPv>
    80004444:	f9840513          	addi	a0,s0,-104
    80004448:	ffffd097          	auipc	ra,0xffffd
    8000444c:	fbc080e7          	jalr	-68(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80004450:	00000493          	li	s1,0
    80004454:	0280006f          	j	8000447c <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80004458:	00000597          	auipc	a1,0x0
    8000445c:	c1458593          	addi	a1,a1,-1004 # 8000406c <_ZL16producerKeyboardPv>
                      data + i);
    80004460:	00179613          	slli	a2,a5,0x1
    80004464:	00f60633          	add	a2,a2,a5
    80004468:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    8000446c:	00c98633          	add	a2,s3,a2
    80004470:	ffffd097          	auipc	ra,0xffffd
    80004474:	f94080e7          	jalr	-108(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80004478:	0014849b          	addiw	s1,s1,1
    8000447c:	0524d263          	bge	s1,s2,800044c0 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80004480:	00149793          	slli	a5,s1,0x1
    80004484:	009787b3          	add	a5,a5,s1
    80004488:	00379793          	slli	a5,a5,0x3
    8000448c:	00f987b3          	add	a5,s3,a5
    80004490:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80004494:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80004498:	00009717          	auipc	a4,0x9
    8000449c:	e1873703          	ld	a4,-488(a4) # 8000d2b0 <_ZL10waitForAll>
    800044a0:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    800044a4:	00048793          	mv	a5,s1
    800044a8:	00349513          	slli	a0,s1,0x3
    800044ac:	00aa8533          	add	a0,s5,a0
    800044b0:	fa9054e3          	blez	s1,80004458 <_Z22producerConsumer_C_APIv+0x1c8>
    800044b4:	00000597          	auipc	a1,0x0
    800044b8:	c6858593          	addi	a1,a1,-920 # 8000411c <_ZL8producerPv>
    800044bc:	fa5ff06f          	j	80004460 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800044c0:	ffffd097          	auipc	ra,0xffffd
    800044c4:	000080e7          	jalr	ra # 800014c0 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    800044c8:	00000493          	li	s1,0
    800044cc:	00994e63          	blt	s2,s1,800044e8 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    800044d0:	00009517          	auipc	a0,0x9
    800044d4:	de053503          	ld	a0,-544(a0) # 8000d2b0 <_ZL10waitForAll>
    800044d8:	ffffd097          	auipc	ra,0xffffd
    800044dc:	0c8080e7          	jalr	200(ra) # 800015a0 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    800044e0:	0014849b          	addiw	s1,s1,1
    800044e4:	fe9ff06f          	j	800044cc <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    800044e8:	00009517          	auipc	a0,0x9
    800044ec:	dc853503          	ld	a0,-568(a0) # 8000d2b0 <_ZL10waitForAll>
    800044f0:	ffffd097          	auipc	ra,0xffffd
    800044f4:	080080e7          	jalr	128(ra) # 80001570 <_Z9sem_closeP4KSem>
    delete buffer;
    800044f8:	000a0e63          	beqz	s4,80004514 <_Z22producerConsumer_C_APIv+0x284>
    800044fc:	000a0513          	mv	a0,s4
    80004500:	00003097          	auipc	ra,0x3
    80004504:	154080e7          	jalr	340(ra) # 80007654 <_ZN6BufferD1Ev>
    80004508:	000a0513          	mv	a0,s4
    8000450c:	fffff097          	auipc	ra,0xfffff
    80004510:	d98080e7          	jalr	-616(ra) # 800032a4 <_ZdlPv>
    80004514:	000b0113          	mv	sp,s6

}
    80004518:	f9040113          	addi	sp,s0,-112
    8000451c:	06813083          	ld	ra,104(sp)
    80004520:	06013403          	ld	s0,96(sp)
    80004524:	05813483          	ld	s1,88(sp)
    80004528:	05013903          	ld	s2,80(sp)
    8000452c:	04813983          	ld	s3,72(sp)
    80004530:	04013a03          	ld	s4,64(sp)
    80004534:	03813a83          	ld	s5,56(sp)
    80004538:	03013b03          	ld	s6,48(sp)
    8000453c:	07010113          	addi	sp,sp,112
    80004540:	00008067          	ret
    80004544:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80004548:	000a0513          	mv	a0,s4
    8000454c:	fffff097          	auipc	ra,0xfffff
    80004550:	d58080e7          	jalr	-680(ra) # 800032a4 <_ZdlPv>
    80004554:	00048513          	mv	a0,s1
    80004558:	0000a097          	auipc	ra,0xa
    8000455c:	e80080e7          	jalr	-384(ra) # 8000e3d8 <_Unwind_Resume>

0000000080004560 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004560:	fe010113          	addi	sp,sp,-32
    80004564:	00113c23          	sd	ra,24(sp)
    80004568:	00813823          	sd	s0,16(sp)
    8000456c:	00913423          	sd	s1,8(sp)
    80004570:	01213023          	sd	s2,0(sp)
    80004574:	02010413          	addi	s0,sp,32
    80004578:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000457c:	00100793          	li	a5,1
    80004580:	02a7f863          	bgeu	a5,a0,800045b0 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004584:	00a00793          	li	a5,10
    80004588:	02f577b3          	remu	a5,a0,a5
    8000458c:	02078e63          	beqz	a5,800045c8 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004590:	fff48513          	addi	a0,s1,-1
    80004594:	00000097          	auipc	ra,0x0
    80004598:	fcc080e7          	jalr	-52(ra) # 80004560 <_ZL9fibonaccim>
    8000459c:	00050913          	mv	s2,a0
    800045a0:	ffe48513          	addi	a0,s1,-2
    800045a4:	00000097          	auipc	ra,0x0
    800045a8:	fbc080e7          	jalr	-68(ra) # 80004560 <_ZL9fibonaccim>
    800045ac:	00a90533          	add	a0,s2,a0
}
    800045b0:	01813083          	ld	ra,24(sp)
    800045b4:	01013403          	ld	s0,16(sp)
    800045b8:	00813483          	ld	s1,8(sp)
    800045bc:	00013903          	ld	s2,0(sp)
    800045c0:	02010113          	addi	sp,sp,32
    800045c4:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800045c8:	ffffd097          	auipc	ra,0xffffd
    800045cc:	ef8080e7          	jalr	-264(ra) # 800014c0 <_Z15thread_dispatchv>
    800045d0:	fc1ff06f          	j	80004590 <_ZL9fibonaccim+0x30>

00000000800045d4 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    800045d4:	fe010113          	addi	sp,sp,-32
    800045d8:	00113c23          	sd	ra,24(sp)
    800045dc:	00813823          	sd	s0,16(sp)
    800045e0:	00913423          	sd	s1,8(sp)
    800045e4:	01213023          	sd	s2,0(sp)
    800045e8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800045ec:	00000913          	li	s2,0
    800045f0:	0380006f          	j	80004628 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800045f4:	ffffd097          	auipc	ra,0xffffd
    800045f8:	ecc080e7          	jalr	-308(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800045fc:	00148493          	addi	s1,s1,1
    80004600:	000027b7          	lui	a5,0x2
    80004604:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004608:	0097ee63          	bltu	a5,s1,80004624 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000460c:	00000713          	li	a4,0
    80004610:	000077b7          	lui	a5,0x7
    80004614:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004618:	fce7eee3          	bltu	a5,a4,800045f4 <_ZN7WorkerA11workerBodyAEPv+0x20>
    8000461c:	00170713          	addi	a4,a4,1
    80004620:	ff1ff06f          	j	80004610 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004624:	00190913          	addi	s2,s2,1
    80004628:	00900793          	li	a5,9
    8000462c:	0527e063          	bltu	a5,s2,8000466c <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004630:	00006517          	auipc	a0,0x6
    80004634:	e0850513          	addi	a0,a0,-504 # 8000a438 <CONSOLE_STATUS+0x428>
    80004638:	00002097          	auipc	ra,0x2
    8000463c:	eac080e7          	jalr	-340(ra) # 800064e4 <_Z11printStringPKc>
    80004640:	00000613          	li	a2,0
    80004644:	00a00593          	li	a1,10
    80004648:	0009051b          	sext.w	a0,s2
    8000464c:	00002097          	auipc	ra,0x2
    80004650:	048080e7          	jalr	72(ra) # 80006694 <_Z8printIntiii>
    80004654:	00006517          	auipc	a0,0x6
    80004658:	04450513          	addi	a0,a0,68 # 8000a698 <CONSOLE_STATUS+0x688>
    8000465c:	00002097          	auipc	ra,0x2
    80004660:	e88080e7          	jalr	-376(ra) # 800064e4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004664:	00000493          	li	s1,0
    80004668:	f99ff06f          	j	80004600 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    8000466c:	00006517          	auipc	a0,0x6
    80004670:	dd450513          	addi	a0,a0,-556 # 8000a440 <CONSOLE_STATUS+0x430>
    80004674:	00002097          	auipc	ra,0x2
    80004678:	e70080e7          	jalr	-400(ra) # 800064e4 <_Z11printStringPKc>
    finishedA = true;
    8000467c:	00100793          	li	a5,1
    80004680:	00009717          	auipc	a4,0x9
    80004684:	c2f70c23          	sb	a5,-968(a4) # 8000d2b8 <_ZL9finishedA>
}
    80004688:	01813083          	ld	ra,24(sp)
    8000468c:	01013403          	ld	s0,16(sp)
    80004690:	00813483          	ld	s1,8(sp)
    80004694:	00013903          	ld	s2,0(sp)
    80004698:	02010113          	addi	sp,sp,32
    8000469c:	00008067          	ret

00000000800046a0 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    800046a0:	fe010113          	addi	sp,sp,-32
    800046a4:	00113c23          	sd	ra,24(sp)
    800046a8:	00813823          	sd	s0,16(sp)
    800046ac:	00913423          	sd	s1,8(sp)
    800046b0:	01213023          	sd	s2,0(sp)
    800046b4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800046b8:	00000913          	li	s2,0
    800046bc:	0380006f          	j	800046f4 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800046c0:	ffffd097          	auipc	ra,0xffffd
    800046c4:	e00080e7          	jalr	-512(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800046c8:	00148493          	addi	s1,s1,1
    800046cc:	000027b7          	lui	a5,0x2
    800046d0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800046d4:	0097ee63          	bltu	a5,s1,800046f0 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800046d8:	00000713          	li	a4,0
    800046dc:	000077b7          	lui	a5,0x7
    800046e0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800046e4:	fce7eee3          	bltu	a5,a4,800046c0 <_ZN7WorkerB11workerBodyBEPv+0x20>
    800046e8:	00170713          	addi	a4,a4,1
    800046ec:	ff1ff06f          	j	800046dc <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800046f0:	00190913          	addi	s2,s2,1
    800046f4:	00f00793          	li	a5,15
    800046f8:	0527e063          	bltu	a5,s2,80004738 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800046fc:	00006517          	auipc	a0,0x6
    80004700:	d5450513          	addi	a0,a0,-684 # 8000a450 <CONSOLE_STATUS+0x440>
    80004704:	00002097          	auipc	ra,0x2
    80004708:	de0080e7          	jalr	-544(ra) # 800064e4 <_Z11printStringPKc>
    8000470c:	00000613          	li	a2,0
    80004710:	00a00593          	li	a1,10
    80004714:	0009051b          	sext.w	a0,s2
    80004718:	00002097          	auipc	ra,0x2
    8000471c:	f7c080e7          	jalr	-132(ra) # 80006694 <_Z8printIntiii>
    80004720:	00006517          	auipc	a0,0x6
    80004724:	f7850513          	addi	a0,a0,-136 # 8000a698 <CONSOLE_STATUS+0x688>
    80004728:	00002097          	auipc	ra,0x2
    8000472c:	dbc080e7          	jalr	-580(ra) # 800064e4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004730:	00000493          	li	s1,0
    80004734:	f99ff06f          	j	800046cc <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80004738:	00006517          	auipc	a0,0x6
    8000473c:	d2050513          	addi	a0,a0,-736 # 8000a458 <CONSOLE_STATUS+0x448>
    80004740:	00002097          	auipc	ra,0x2
    80004744:	da4080e7          	jalr	-604(ra) # 800064e4 <_Z11printStringPKc>
    finishedB = true;
    80004748:	00100793          	li	a5,1
    8000474c:	00009717          	auipc	a4,0x9
    80004750:	b6f706a3          	sb	a5,-1171(a4) # 8000d2b9 <_ZL9finishedB>
    thread_dispatch();
    80004754:	ffffd097          	auipc	ra,0xffffd
    80004758:	d6c080e7          	jalr	-660(ra) # 800014c0 <_Z15thread_dispatchv>
}
    8000475c:	01813083          	ld	ra,24(sp)
    80004760:	01013403          	ld	s0,16(sp)
    80004764:	00813483          	ld	s1,8(sp)
    80004768:	00013903          	ld	s2,0(sp)
    8000476c:	02010113          	addi	sp,sp,32
    80004770:	00008067          	ret

0000000080004774 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80004774:	fe010113          	addi	sp,sp,-32
    80004778:	00113c23          	sd	ra,24(sp)
    8000477c:	00813823          	sd	s0,16(sp)
    80004780:	00913423          	sd	s1,8(sp)
    80004784:	01213023          	sd	s2,0(sp)
    80004788:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000478c:	00000493          	li	s1,0
    80004790:	0400006f          	j	800047d0 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004794:	00006517          	auipc	a0,0x6
    80004798:	cd450513          	addi	a0,a0,-812 # 8000a468 <CONSOLE_STATUS+0x458>
    8000479c:	00002097          	auipc	ra,0x2
    800047a0:	d48080e7          	jalr	-696(ra) # 800064e4 <_Z11printStringPKc>
    800047a4:	00000613          	li	a2,0
    800047a8:	00a00593          	li	a1,10
    800047ac:	00048513          	mv	a0,s1
    800047b0:	00002097          	auipc	ra,0x2
    800047b4:	ee4080e7          	jalr	-284(ra) # 80006694 <_Z8printIntiii>
    800047b8:	00006517          	auipc	a0,0x6
    800047bc:	ee050513          	addi	a0,a0,-288 # 8000a698 <CONSOLE_STATUS+0x688>
    800047c0:	00002097          	auipc	ra,0x2
    800047c4:	d24080e7          	jalr	-732(ra) # 800064e4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800047c8:	0014849b          	addiw	s1,s1,1
    800047cc:	0ff4f493          	andi	s1,s1,255
    800047d0:	00200793          	li	a5,2
    800047d4:	fc97f0e3          	bgeu	a5,s1,80004794 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    800047d8:	00006517          	auipc	a0,0x6
    800047dc:	c9850513          	addi	a0,a0,-872 # 8000a470 <CONSOLE_STATUS+0x460>
    800047e0:	00002097          	auipc	ra,0x2
    800047e4:	d04080e7          	jalr	-764(ra) # 800064e4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800047e8:	00700313          	li	t1,7
    thread_dispatch();
    800047ec:	ffffd097          	auipc	ra,0xffffd
    800047f0:	cd4080e7          	jalr	-812(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800047f4:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800047f8:	00006517          	auipc	a0,0x6
    800047fc:	c8850513          	addi	a0,a0,-888 # 8000a480 <CONSOLE_STATUS+0x470>
    80004800:	00002097          	auipc	ra,0x2
    80004804:	ce4080e7          	jalr	-796(ra) # 800064e4 <_Z11printStringPKc>
    80004808:	00000613          	li	a2,0
    8000480c:	00a00593          	li	a1,10
    80004810:	0009051b          	sext.w	a0,s2
    80004814:	00002097          	auipc	ra,0x2
    80004818:	e80080e7          	jalr	-384(ra) # 80006694 <_Z8printIntiii>
    8000481c:	00006517          	auipc	a0,0x6
    80004820:	e7c50513          	addi	a0,a0,-388 # 8000a698 <CONSOLE_STATUS+0x688>
    80004824:	00002097          	auipc	ra,0x2
    80004828:	cc0080e7          	jalr	-832(ra) # 800064e4 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    8000482c:	00c00513          	li	a0,12
    80004830:	00000097          	auipc	ra,0x0
    80004834:	d30080e7          	jalr	-720(ra) # 80004560 <_ZL9fibonaccim>
    80004838:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000483c:	00006517          	auipc	a0,0x6
    80004840:	c4c50513          	addi	a0,a0,-948 # 8000a488 <CONSOLE_STATUS+0x478>
    80004844:	00002097          	auipc	ra,0x2
    80004848:	ca0080e7          	jalr	-864(ra) # 800064e4 <_Z11printStringPKc>
    8000484c:	00000613          	li	a2,0
    80004850:	00a00593          	li	a1,10
    80004854:	0009051b          	sext.w	a0,s2
    80004858:	00002097          	auipc	ra,0x2
    8000485c:	e3c080e7          	jalr	-452(ra) # 80006694 <_Z8printIntiii>
    80004860:	00006517          	auipc	a0,0x6
    80004864:	e3850513          	addi	a0,a0,-456 # 8000a698 <CONSOLE_STATUS+0x688>
    80004868:	00002097          	auipc	ra,0x2
    8000486c:	c7c080e7          	jalr	-900(ra) # 800064e4 <_Z11printStringPKc>
    80004870:	0400006f          	j	800048b0 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004874:	00006517          	auipc	a0,0x6
    80004878:	bf450513          	addi	a0,a0,-1036 # 8000a468 <CONSOLE_STATUS+0x458>
    8000487c:	00002097          	auipc	ra,0x2
    80004880:	c68080e7          	jalr	-920(ra) # 800064e4 <_Z11printStringPKc>
    80004884:	00000613          	li	a2,0
    80004888:	00a00593          	li	a1,10
    8000488c:	00048513          	mv	a0,s1
    80004890:	00002097          	auipc	ra,0x2
    80004894:	e04080e7          	jalr	-508(ra) # 80006694 <_Z8printIntiii>
    80004898:	00006517          	auipc	a0,0x6
    8000489c:	e0050513          	addi	a0,a0,-512 # 8000a698 <CONSOLE_STATUS+0x688>
    800048a0:	00002097          	auipc	ra,0x2
    800048a4:	c44080e7          	jalr	-956(ra) # 800064e4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800048a8:	0014849b          	addiw	s1,s1,1
    800048ac:	0ff4f493          	andi	s1,s1,255
    800048b0:	00500793          	li	a5,5
    800048b4:	fc97f0e3          	bgeu	a5,s1,80004874 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    800048b8:	00006517          	auipc	a0,0x6
    800048bc:	be050513          	addi	a0,a0,-1056 # 8000a498 <CONSOLE_STATUS+0x488>
    800048c0:	00002097          	auipc	ra,0x2
    800048c4:	c24080e7          	jalr	-988(ra) # 800064e4 <_Z11printStringPKc>
    finishedC = true;
    800048c8:	00100793          	li	a5,1
    800048cc:	00009717          	auipc	a4,0x9
    800048d0:	9ef70723          	sb	a5,-1554(a4) # 8000d2ba <_ZL9finishedC>
    thread_dispatch();
    800048d4:	ffffd097          	auipc	ra,0xffffd
    800048d8:	bec080e7          	jalr	-1044(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800048dc:	01813083          	ld	ra,24(sp)
    800048e0:	01013403          	ld	s0,16(sp)
    800048e4:	00813483          	ld	s1,8(sp)
    800048e8:	00013903          	ld	s2,0(sp)
    800048ec:	02010113          	addi	sp,sp,32
    800048f0:	00008067          	ret

00000000800048f4 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800048f4:	fe010113          	addi	sp,sp,-32
    800048f8:	00113c23          	sd	ra,24(sp)
    800048fc:	00813823          	sd	s0,16(sp)
    80004900:	00913423          	sd	s1,8(sp)
    80004904:	01213023          	sd	s2,0(sp)
    80004908:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000490c:	00a00493          	li	s1,10
    80004910:	0400006f          	j	80004950 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004914:	00006517          	auipc	a0,0x6
    80004918:	b9450513          	addi	a0,a0,-1132 # 8000a4a8 <CONSOLE_STATUS+0x498>
    8000491c:	00002097          	auipc	ra,0x2
    80004920:	bc8080e7          	jalr	-1080(ra) # 800064e4 <_Z11printStringPKc>
    80004924:	00000613          	li	a2,0
    80004928:	00a00593          	li	a1,10
    8000492c:	00048513          	mv	a0,s1
    80004930:	00002097          	auipc	ra,0x2
    80004934:	d64080e7          	jalr	-668(ra) # 80006694 <_Z8printIntiii>
    80004938:	00006517          	auipc	a0,0x6
    8000493c:	d6050513          	addi	a0,a0,-672 # 8000a698 <CONSOLE_STATUS+0x688>
    80004940:	00002097          	auipc	ra,0x2
    80004944:	ba4080e7          	jalr	-1116(ra) # 800064e4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004948:	0014849b          	addiw	s1,s1,1
    8000494c:	0ff4f493          	andi	s1,s1,255
    80004950:	00c00793          	li	a5,12
    80004954:	fc97f0e3          	bgeu	a5,s1,80004914 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80004958:	00006517          	auipc	a0,0x6
    8000495c:	b5850513          	addi	a0,a0,-1192 # 8000a4b0 <CONSOLE_STATUS+0x4a0>
    80004960:	00002097          	auipc	ra,0x2
    80004964:	b84080e7          	jalr	-1148(ra) # 800064e4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004968:	00500313          	li	t1,5
    thread_dispatch();
    8000496c:	ffffd097          	auipc	ra,0xffffd
    80004970:	b54080e7          	jalr	-1196(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004974:	01000513          	li	a0,16
    80004978:	00000097          	auipc	ra,0x0
    8000497c:	be8080e7          	jalr	-1048(ra) # 80004560 <_ZL9fibonaccim>
    80004980:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004984:	00006517          	auipc	a0,0x6
    80004988:	b3c50513          	addi	a0,a0,-1220 # 8000a4c0 <CONSOLE_STATUS+0x4b0>
    8000498c:	00002097          	auipc	ra,0x2
    80004990:	b58080e7          	jalr	-1192(ra) # 800064e4 <_Z11printStringPKc>
    80004994:	00000613          	li	a2,0
    80004998:	00a00593          	li	a1,10
    8000499c:	0009051b          	sext.w	a0,s2
    800049a0:	00002097          	auipc	ra,0x2
    800049a4:	cf4080e7          	jalr	-780(ra) # 80006694 <_Z8printIntiii>
    800049a8:	00006517          	auipc	a0,0x6
    800049ac:	cf050513          	addi	a0,a0,-784 # 8000a698 <CONSOLE_STATUS+0x688>
    800049b0:	00002097          	auipc	ra,0x2
    800049b4:	b34080e7          	jalr	-1228(ra) # 800064e4 <_Z11printStringPKc>
    800049b8:	0400006f          	j	800049f8 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800049bc:	00006517          	auipc	a0,0x6
    800049c0:	aec50513          	addi	a0,a0,-1300 # 8000a4a8 <CONSOLE_STATUS+0x498>
    800049c4:	00002097          	auipc	ra,0x2
    800049c8:	b20080e7          	jalr	-1248(ra) # 800064e4 <_Z11printStringPKc>
    800049cc:	00000613          	li	a2,0
    800049d0:	00a00593          	li	a1,10
    800049d4:	00048513          	mv	a0,s1
    800049d8:	00002097          	auipc	ra,0x2
    800049dc:	cbc080e7          	jalr	-836(ra) # 80006694 <_Z8printIntiii>
    800049e0:	00006517          	auipc	a0,0x6
    800049e4:	cb850513          	addi	a0,a0,-840 # 8000a698 <CONSOLE_STATUS+0x688>
    800049e8:	00002097          	auipc	ra,0x2
    800049ec:	afc080e7          	jalr	-1284(ra) # 800064e4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800049f0:	0014849b          	addiw	s1,s1,1
    800049f4:	0ff4f493          	andi	s1,s1,255
    800049f8:	00f00793          	li	a5,15
    800049fc:	fc97f0e3          	bgeu	a5,s1,800049bc <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004a00:	00006517          	auipc	a0,0x6
    80004a04:	ad050513          	addi	a0,a0,-1328 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80004a08:	00002097          	auipc	ra,0x2
    80004a0c:	adc080e7          	jalr	-1316(ra) # 800064e4 <_Z11printStringPKc>
    finishedD = true;
    80004a10:	00100793          	li	a5,1
    80004a14:	00009717          	auipc	a4,0x9
    80004a18:	8af703a3          	sb	a5,-1881(a4) # 8000d2bb <_ZL9finishedD>
    thread_dispatch();
    80004a1c:	ffffd097          	auipc	ra,0xffffd
    80004a20:	aa4080e7          	jalr	-1372(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80004a24:	01813083          	ld	ra,24(sp)
    80004a28:	01013403          	ld	s0,16(sp)
    80004a2c:	00813483          	ld	s1,8(sp)
    80004a30:	00013903          	ld	s2,0(sp)
    80004a34:	02010113          	addi	sp,sp,32
    80004a38:	00008067          	ret

0000000080004a3c <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80004a3c:	fc010113          	addi	sp,sp,-64
    80004a40:	02113c23          	sd	ra,56(sp)
    80004a44:	02813823          	sd	s0,48(sp)
    80004a48:	02913423          	sd	s1,40(sp)
    80004a4c:	03213023          	sd	s2,32(sp)
    80004a50:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80004a54:	02000513          	li	a0,32
    80004a58:	ffffe097          	auipc	ra,0xffffe
    80004a5c:	7fc080e7          	jalr	2044(ra) # 80003254 <_Znwm>
    80004a60:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004a64:	fffff097          	auipc	ra,0xfffff
    80004a68:	ae0080e7          	jalr	-1312(ra) # 80003544 <_ZN6ThreadC1Ev>
    80004a6c:	00008797          	auipc	a5,0x8
    80004a70:	48478793          	addi	a5,a5,1156 # 8000cef0 <_ZTV7WorkerA+0x10>
    80004a74:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004a78:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004a7c:	00006517          	auipc	a0,0x6
    80004a80:	a6450513          	addi	a0,a0,-1436 # 8000a4e0 <CONSOLE_STATUS+0x4d0>
    80004a84:	00002097          	auipc	ra,0x2
    80004a88:	a60080e7          	jalr	-1440(ra) # 800064e4 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004a8c:	02000513          	li	a0,32
    80004a90:	ffffe097          	auipc	ra,0xffffe
    80004a94:	7c4080e7          	jalr	1988(ra) # 80003254 <_Znwm>
    80004a98:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004a9c:	fffff097          	auipc	ra,0xfffff
    80004aa0:	aa8080e7          	jalr	-1368(ra) # 80003544 <_ZN6ThreadC1Ev>
    80004aa4:	00008797          	auipc	a5,0x8
    80004aa8:	47478793          	addi	a5,a5,1140 # 8000cf18 <_ZTV7WorkerB+0x10>
    80004aac:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004ab0:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004ab4:	00006517          	auipc	a0,0x6
    80004ab8:	a4450513          	addi	a0,a0,-1468 # 8000a4f8 <CONSOLE_STATUS+0x4e8>
    80004abc:	00002097          	auipc	ra,0x2
    80004ac0:	a28080e7          	jalr	-1496(ra) # 800064e4 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004ac4:	02000513          	li	a0,32
    80004ac8:	ffffe097          	auipc	ra,0xffffe
    80004acc:	78c080e7          	jalr	1932(ra) # 80003254 <_Znwm>
    80004ad0:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004ad4:	fffff097          	auipc	ra,0xfffff
    80004ad8:	a70080e7          	jalr	-1424(ra) # 80003544 <_ZN6ThreadC1Ev>
    80004adc:	00008797          	auipc	a5,0x8
    80004ae0:	46478793          	addi	a5,a5,1124 # 8000cf40 <_ZTV7WorkerC+0x10>
    80004ae4:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004ae8:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80004aec:	00006517          	auipc	a0,0x6
    80004af0:	a2450513          	addi	a0,a0,-1500 # 8000a510 <CONSOLE_STATUS+0x500>
    80004af4:	00002097          	auipc	ra,0x2
    80004af8:	9f0080e7          	jalr	-1552(ra) # 800064e4 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004afc:	02000513          	li	a0,32
    80004b00:	ffffe097          	auipc	ra,0xffffe
    80004b04:	754080e7          	jalr	1876(ra) # 80003254 <_Znwm>
    80004b08:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004b0c:	fffff097          	auipc	ra,0xfffff
    80004b10:	a38080e7          	jalr	-1480(ra) # 80003544 <_ZN6ThreadC1Ev>
    80004b14:	00008797          	auipc	a5,0x8
    80004b18:	45478793          	addi	a5,a5,1108 # 8000cf68 <_ZTV7WorkerD+0x10>
    80004b1c:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004b20:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004b24:	00006517          	auipc	a0,0x6
    80004b28:	a0450513          	addi	a0,a0,-1532 # 8000a528 <CONSOLE_STATUS+0x518>
    80004b2c:	00002097          	auipc	ra,0x2
    80004b30:	9b8080e7          	jalr	-1608(ra) # 800064e4 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004b34:	00000493          	li	s1,0
    80004b38:	00300793          	li	a5,3
    80004b3c:	0297c663          	blt	a5,s1,80004b68 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004b40:	00349793          	slli	a5,s1,0x3
    80004b44:	fe040713          	addi	a4,s0,-32
    80004b48:	00f707b3          	add	a5,a4,a5
    80004b4c:	fe07b503          	ld	a0,-32(a5)
    80004b50:	fffff097          	auipc	ra,0xfffff
    80004b54:	8bc080e7          	jalr	-1860(ra) # 8000340c <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80004b58:	0014849b          	addiw	s1,s1,1
    80004b5c:	fddff06f          	j	80004b38 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004b60:	fffff097          	auipc	ra,0xfffff
    80004b64:	928080e7          	jalr	-1752(ra) # 80003488 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004b68:	00008797          	auipc	a5,0x8
    80004b6c:	7507c783          	lbu	a5,1872(a5) # 8000d2b8 <_ZL9finishedA>
    80004b70:	fe0788e3          	beqz	a5,80004b60 <_Z20Threads_CPP_API_testv+0x124>
    80004b74:	00008797          	auipc	a5,0x8
    80004b78:	7457c783          	lbu	a5,1861(a5) # 8000d2b9 <_ZL9finishedB>
    80004b7c:	fe0782e3          	beqz	a5,80004b60 <_Z20Threads_CPP_API_testv+0x124>
    80004b80:	00008797          	auipc	a5,0x8
    80004b84:	73a7c783          	lbu	a5,1850(a5) # 8000d2ba <_ZL9finishedC>
    80004b88:	fc078ce3          	beqz	a5,80004b60 <_Z20Threads_CPP_API_testv+0x124>
    80004b8c:	00008797          	auipc	a5,0x8
    80004b90:	72f7c783          	lbu	a5,1839(a5) # 8000d2bb <_ZL9finishedD>
    80004b94:	fc0786e3          	beqz	a5,80004b60 <_Z20Threads_CPP_API_testv+0x124>
    80004b98:	fc040493          	addi	s1,s0,-64
    80004b9c:	0080006f          	j	80004ba4 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    80004ba0:	00848493          	addi	s1,s1,8
    80004ba4:	fe040793          	addi	a5,s0,-32
    80004ba8:	08f48663          	beq	s1,a5,80004c34 <_Z20Threads_CPP_API_testv+0x1f8>
    80004bac:	0004b503          	ld	a0,0(s1)
		delete thread;
    80004bb0:	fe0508e3          	beqz	a0,80004ba0 <_Z20Threads_CPP_API_testv+0x164>
    80004bb4:	00053783          	ld	a5,0(a0)
    80004bb8:	0087b783          	ld	a5,8(a5)
    80004bbc:	000780e7          	jalr	a5
    80004bc0:	fe1ff06f          	j	80004ba0 <_Z20Threads_CPP_API_testv+0x164>
    80004bc4:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004bc8:	00048513          	mv	a0,s1
    80004bcc:	ffffe097          	auipc	ra,0xffffe
    80004bd0:	6d8080e7          	jalr	1752(ra) # 800032a4 <_ZdlPv>
    80004bd4:	00090513          	mv	a0,s2
    80004bd8:	0000a097          	auipc	ra,0xa
    80004bdc:	800080e7          	jalr	-2048(ra) # 8000e3d8 <_Unwind_Resume>
    80004be0:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004be4:	00048513          	mv	a0,s1
    80004be8:	ffffe097          	auipc	ra,0xffffe
    80004bec:	6bc080e7          	jalr	1724(ra) # 800032a4 <_ZdlPv>
    80004bf0:	00090513          	mv	a0,s2
    80004bf4:	00009097          	auipc	ra,0x9
    80004bf8:	7e4080e7          	jalr	2020(ra) # 8000e3d8 <_Unwind_Resume>
    80004bfc:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004c00:	00048513          	mv	a0,s1
    80004c04:	ffffe097          	auipc	ra,0xffffe
    80004c08:	6a0080e7          	jalr	1696(ra) # 800032a4 <_ZdlPv>
    80004c0c:	00090513          	mv	a0,s2
    80004c10:	00009097          	auipc	ra,0x9
    80004c14:	7c8080e7          	jalr	1992(ra) # 8000e3d8 <_Unwind_Resume>
    80004c18:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004c1c:	00048513          	mv	a0,s1
    80004c20:	ffffe097          	auipc	ra,0xffffe
    80004c24:	684080e7          	jalr	1668(ra) # 800032a4 <_ZdlPv>
    80004c28:	00090513          	mv	a0,s2
    80004c2c:	00009097          	auipc	ra,0x9
    80004c30:	7ac080e7          	jalr	1964(ra) # 8000e3d8 <_Unwind_Resume>
	}
}
    80004c34:	03813083          	ld	ra,56(sp)
    80004c38:	03013403          	ld	s0,48(sp)
    80004c3c:	02813483          	ld	s1,40(sp)
    80004c40:	02013903          	ld	s2,32(sp)
    80004c44:	04010113          	addi	sp,sp,64
    80004c48:	00008067          	ret

0000000080004c4c <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004c4c:	ff010113          	addi	sp,sp,-16
    80004c50:	00113423          	sd	ra,8(sp)
    80004c54:	00813023          	sd	s0,0(sp)
    80004c58:	01010413          	addi	s0,sp,16
    80004c5c:	00008797          	auipc	a5,0x8
    80004c60:	29478793          	addi	a5,a5,660 # 8000cef0 <_ZTV7WorkerA+0x10>
    80004c64:	00f53023          	sd	a5,0(a0)
    80004c68:	ffffe097          	auipc	ra,0xffffe
    80004c6c:	538080e7          	jalr	1336(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80004c70:	00813083          	ld	ra,8(sp)
    80004c74:	00013403          	ld	s0,0(sp)
    80004c78:	01010113          	addi	sp,sp,16
    80004c7c:	00008067          	ret

0000000080004c80 <_ZN7WorkerAD0Ev>:
    80004c80:	fe010113          	addi	sp,sp,-32
    80004c84:	00113c23          	sd	ra,24(sp)
    80004c88:	00813823          	sd	s0,16(sp)
    80004c8c:	00913423          	sd	s1,8(sp)
    80004c90:	02010413          	addi	s0,sp,32
    80004c94:	00050493          	mv	s1,a0
    80004c98:	00008797          	auipc	a5,0x8
    80004c9c:	25878793          	addi	a5,a5,600 # 8000cef0 <_ZTV7WorkerA+0x10>
    80004ca0:	00f53023          	sd	a5,0(a0)
    80004ca4:	ffffe097          	auipc	ra,0xffffe
    80004ca8:	4fc080e7          	jalr	1276(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80004cac:	00048513          	mv	a0,s1
    80004cb0:	ffffe097          	auipc	ra,0xffffe
    80004cb4:	5f4080e7          	jalr	1524(ra) # 800032a4 <_ZdlPv>
    80004cb8:	01813083          	ld	ra,24(sp)
    80004cbc:	01013403          	ld	s0,16(sp)
    80004cc0:	00813483          	ld	s1,8(sp)
    80004cc4:	02010113          	addi	sp,sp,32
    80004cc8:	00008067          	ret

0000000080004ccc <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80004ccc:	ff010113          	addi	sp,sp,-16
    80004cd0:	00113423          	sd	ra,8(sp)
    80004cd4:	00813023          	sd	s0,0(sp)
    80004cd8:	01010413          	addi	s0,sp,16
    80004cdc:	00008797          	auipc	a5,0x8
    80004ce0:	23c78793          	addi	a5,a5,572 # 8000cf18 <_ZTV7WorkerB+0x10>
    80004ce4:	00f53023          	sd	a5,0(a0)
    80004ce8:	ffffe097          	auipc	ra,0xffffe
    80004cec:	4b8080e7          	jalr	1208(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80004cf0:	00813083          	ld	ra,8(sp)
    80004cf4:	00013403          	ld	s0,0(sp)
    80004cf8:	01010113          	addi	sp,sp,16
    80004cfc:	00008067          	ret

0000000080004d00 <_ZN7WorkerBD0Ev>:
    80004d00:	fe010113          	addi	sp,sp,-32
    80004d04:	00113c23          	sd	ra,24(sp)
    80004d08:	00813823          	sd	s0,16(sp)
    80004d0c:	00913423          	sd	s1,8(sp)
    80004d10:	02010413          	addi	s0,sp,32
    80004d14:	00050493          	mv	s1,a0
    80004d18:	00008797          	auipc	a5,0x8
    80004d1c:	20078793          	addi	a5,a5,512 # 8000cf18 <_ZTV7WorkerB+0x10>
    80004d20:	00f53023          	sd	a5,0(a0)
    80004d24:	ffffe097          	auipc	ra,0xffffe
    80004d28:	47c080e7          	jalr	1148(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80004d2c:	00048513          	mv	a0,s1
    80004d30:	ffffe097          	auipc	ra,0xffffe
    80004d34:	574080e7          	jalr	1396(ra) # 800032a4 <_ZdlPv>
    80004d38:	01813083          	ld	ra,24(sp)
    80004d3c:	01013403          	ld	s0,16(sp)
    80004d40:	00813483          	ld	s1,8(sp)
    80004d44:	02010113          	addi	sp,sp,32
    80004d48:	00008067          	ret

0000000080004d4c <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004d4c:	ff010113          	addi	sp,sp,-16
    80004d50:	00113423          	sd	ra,8(sp)
    80004d54:	00813023          	sd	s0,0(sp)
    80004d58:	01010413          	addi	s0,sp,16
    80004d5c:	00008797          	auipc	a5,0x8
    80004d60:	1e478793          	addi	a5,a5,484 # 8000cf40 <_ZTV7WorkerC+0x10>
    80004d64:	00f53023          	sd	a5,0(a0)
    80004d68:	ffffe097          	auipc	ra,0xffffe
    80004d6c:	438080e7          	jalr	1080(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80004d70:	00813083          	ld	ra,8(sp)
    80004d74:	00013403          	ld	s0,0(sp)
    80004d78:	01010113          	addi	sp,sp,16
    80004d7c:	00008067          	ret

0000000080004d80 <_ZN7WorkerCD0Ev>:
    80004d80:	fe010113          	addi	sp,sp,-32
    80004d84:	00113c23          	sd	ra,24(sp)
    80004d88:	00813823          	sd	s0,16(sp)
    80004d8c:	00913423          	sd	s1,8(sp)
    80004d90:	02010413          	addi	s0,sp,32
    80004d94:	00050493          	mv	s1,a0
    80004d98:	00008797          	auipc	a5,0x8
    80004d9c:	1a878793          	addi	a5,a5,424 # 8000cf40 <_ZTV7WorkerC+0x10>
    80004da0:	00f53023          	sd	a5,0(a0)
    80004da4:	ffffe097          	auipc	ra,0xffffe
    80004da8:	3fc080e7          	jalr	1020(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80004dac:	00048513          	mv	a0,s1
    80004db0:	ffffe097          	auipc	ra,0xffffe
    80004db4:	4f4080e7          	jalr	1268(ra) # 800032a4 <_ZdlPv>
    80004db8:	01813083          	ld	ra,24(sp)
    80004dbc:	01013403          	ld	s0,16(sp)
    80004dc0:	00813483          	ld	s1,8(sp)
    80004dc4:	02010113          	addi	sp,sp,32
    80004dc8:	00008067          	ret

0000000080004dcc <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004dcc:	ff010113          	addi	sp,sp,-16
    80004dd0:	00113423          	sd	ra,8(sp)
    80004dd4:	00813023          	sd	s0,0(sp)
    80004dd8:	01010413          	addi	s0,sp,16
    80004ddc:	00008797          	auipc	a5,0x8
    80004de0:	18c78793          	addi	a5,a5,396 # 8000cf68 <_ZTV7WorkerD+0x10>
    80004de4:	00f53023          	sd	a5,0(a0)
    80004de8:	ffffe097          	auipc	ra,0xffffe
    80004dec:	3b8080e7          	jalr	952(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80004df0:	00813083          	ld	ra,8(sp)
    80004df4:	00013403          	ld	s0,0(sp)
    80004df8:	01010113          	addi	sp,sp,16
    80004dfc:	00008067          	ret

0000000080004e00 <_ZN7WorkerDD0Ev>:
    80004e00:	fe010113          	addi	sp,sp,-32
    80004e04:	00113c23          	sd	ra,24(sp)
    80004e08:	00813823          	sd	s0,16(sp)
    80004e0c:	00913423          	sd	s1,8(sp)
    80004e10:	02010413          	addi	s0,sp,32
    80004e14:	00050493          	mv	s1,a0
    80004e18:	00008797          	auipc	a5,0x8
    80004e1c:	15078793          	addi	a5,a5,336 # 8000cf68 <_ZTV7WorkerD+0x10>
    80004e20:	00f53023          	sd	a5,0(a0)
    80004e24:	ffffe097          	auipc	ra,0xffffe
    80004e28:	37c080e7          	jalr	892(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80004e2c:	00048513          	mv	a0,s1
    80004e30:	ffffe097          	auipc	ra,0xffffe
    80004e34:	474080e7          	jalr	1140(ra) # 800032a4 <_ZdlPv>
    80004e38:	01813083          	ld	ra,24(sp)
    80004e3c:	01013403          	ld	s0,16(sp)
    80004e40:	00813483          	ld	s1,8(sp)
    80004e44:	02010113          	addi	sp,sp,32
    80004e48:	00008067          	ret

0000000080004e4c <_ZN7WorkerA3runEv>:
    void run() override {
    80004e4c:	ff010113          	addi	sp,sp,-16
    80004e50:	00113423          	sd	ra,8(sp)
    80004e54:	00813023          	sd	s0,0(sp)
    80004e58:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004e5c:	00000593          	li	a1,0
    80004e60:	fffff097          	auipc	ra,0xfffff
    80004e64:	774080e7          	jalr	1908(ra) # 800045d4 <_ZN7WorkerA11workerBodyAEPv>
    }
    80004e68:	00813083          	ld	ra,8(sp)
    80004e6c:	00013403          	ld	s0,0(sp)
    80004e70:	01010113          	addi	sp,sp,16
    80004e74:	00008067          	ret

0000000080004e78 <_ZN7WorkerB3runEv>:
    void run() override {
    80004e78:	ff010113          	addi	sp,sp,-16
    80004e7c:	00113423          	sd	ra,8(sp)
    80004e80:	00813023          	sd	s0,0(sp)
    80004e84:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004e88:	00000593          	li	a1,0
    80004e8c:	00000097          	auipc	ra,0x0
    80004e90:	814080e7          	jalr	-2028(ra) # 800046a0 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004e94:	00813083          	ld	ra,8(sp)
    80004e98:	00013403          	ld	s0,0(sp)
    80004e9c:	01010113          	addi	sp,sp,16
    80004ea0:	00008067          	ret

0000000080004ea4 <_ZN7WorkerC3runEv>:
    void run() override {
    80004ea4:	ff010113          	addi	sp,sp,-16
    80004ea8:	00113423          	sd	ra,8(sp)
    80004eac:	00813023          	sd	s0,0(sp)
    80004eb0:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004eb4:	00000593          	li	a1,0
    80004eb8:	00000097          	auipc	ra,0x0
    80004ebc:	8bc080e7          	jalr	-1860(ra) # 80004774 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004ec0:	00813083          	ld	ra,8(sp)
    80004ec4:	00013403          	ld	s0,0(sp)
    80004ec8:	01010113          	addi	sp,sp,16
    80004ecc:	00008067          	ret

0000000080004ed0 <_ZN7WorkerD3runEv>:
    void run() override {
    80004ed0:	ff010113          	addi	sp,sp,-16
    80004ed4:	00113423          	sd	ra,8(sp)
    80004ed8:	00813023          	sd	s0,0(sp)
    80004edc:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004ee0:	00000593          	li	a1,0
    80004ee4:	00000097          	auipc	ra,0x0
    80004ee8:	a10080e7          	jalr	-1520(ra) # 800048f4 <_ZN7WorkerD11workerBodyDEPv>
    }
    80004eec:	00813083          	ld	ra,8(sp)
    80004ef0:	00013403          	ld	s0,0(sp)
    80004ef4:	01010113          	addi	sp,sp,16
    80004ef8:	00008067          	ret

0000000080004efc <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004efc:	f8010113          	addi	sp,sp,-128
    80004f00:	06113c23          	sd	ra,120(sp)
    80004f04:	06813823          	sd	s0,112(sp)
    80004f08:	06913423          	sd	s1,104(sp)
    80004f0c:	07213023          	sd	s2,96(sp)
    80004f10:	05313c23          	sd	s3,88(sp)
    80004f14:	05413823          	sd	s4,80(sp)
    80004f18:	05513423          	sd	s5,72(sp)
    80004f1c:	05613023          	sd	s6,64(sp)
    80004f20:	03713c23          	sd	s7,56(sp)
    80004f24:	03813823          	sd	s8,48(sp)
    80004f28:	03913423          	sd	s9,40(sp)
    80004f2c:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004f30:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004f34:	00005517          	auipc	a0,0x5
    80004f38:	41c50513          	addi	a0,a0,1052 # 8000a350 <CONSOLE_STATUS+0x340>
    80004f3c:	00001097          	auipc	ra,0x1
    80004f40:	5a8080e7          	jalr	1448(ra) # 800064e4 <_Z11printStringPKc>
    getString(input, 30);
    80004f44:	01e00593          	li	a1,30
    80004f48:	f8040493          	addi	s1,s0,-128
    80004f4c:	00048513          	mv	a0,s1
    80004f50:	00001097          	auipc	ra,0x1
    80004f54:	61c080e7          	jalr	1564(ra) # 8000656c <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004f58:	00048513          	mv	a0,s1
    80004f5c:	00001097          	auipc	ra,0x1
    80004f60:	6e8080e7          	jalr	1768(ra) # 80006644 <_Z11stringToIntPKc>
    80004f64:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004f68:	00005517          	auipc	a0,0x5
    80004f6c:	40850513          	addi	a0,a0,1032 # 8000a370 <CONSOLE_STATUS+0x360>
    80004f70:	00001097          	auipc	ra,0x1
    80004f74:	574080e7          	jalr	1396(ra) # 800064e4 <_Z11printStringPKc>
    getString(input, 30);
    80004f78:	01e00593          	li	a1,30
    80004f7c:	00048513          	mv	a0,s1
    80004f80:	00001097          	auipc	ra,0x1
    80004f84:	5ec080e7          	jalr	1516(ra) # 8000656c <_Z9getStringPci>
    n = stringToInt(input);
    80004f88:	00048513          	mv	a0,s1
    80004f8c:	00001097          	auipc	ra,0x1
    80004f90:	6b8080e7          	jalr	1720(ra) # 80006644 <_Z11stringToIntPKc>
    80004f94:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004f98:	00005517          	auipc	a0,0x5
    80004f9c:	3f850513          	addi	a0,a0,1016 # 8000a390 <CONSOLE_STATUS+0x380>
    80004fa0:	00001097          	auipc	ra,0x1
    80004fa4:	544080e7          	jalr	1348(ra) # 800064e4 <_Z11printStringPKc>
    printInt(threadNum);
    80004fa8:	00000613          	li	a2,0
    80004fac:	00a00593          	li	a1,10
    80004fb0:	00098513          	mv	a0,s3
    80004fb4:	00001097          	auipc	ra,0x1
    80004fb8:	6e0080e7          	jalr	1760(ra) # 80006694 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004fbc:	00005517          	auipc	a0,0x5
    80004fc0:	3ec50513          	addi	a0,a0,1004 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80004fc4:	00001097          	auipc	ra,0x1
    80004fc8:	520080e7          	jalr	1312(ra) # 800064e4 <_Z11printStringPKc>
    printInt(n);
    80004fcc:	00000613          	li	a2,0
    80004fd0:	00a00593          	li	a1,10
    80004fd4:	00048513          	mv	a0,s1
    80004fd8:	00001097          	auipc	ra,0x1
    80004fdc:	6bc080e7          	jalr	1724(ra) # 80006694 <_Z8printIntiii>
    printString(".\n");
    80004fe0:	00005517          	auipc	a0,0x5
    80004fe4:	3e050513          	addi	a0,a0,992 # 8000a3c0 <CONSOLE_STATUS+0x3b0>
    80004fe8:	00001097          	auipc	ra,0x1
    80004fec:	4fc080e7          	jalr	1276(ra) # 800064e4 <_Z11printStringPKc>
    if (threadNum > n) {
    80004ff0:	0334c463          	blt	s1,s3,80005018 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004ff4:	03305c63          	blez	s3,8000502c <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004ff8:	03800513          	li	a0,56
    80004ffc:	ffffe097          	auipc	ra,0xffffe
    80005000:	258080e7          	jalr	600(ra) # 80003254 <_Znwm>
    80005004:	00050a93          	mv	s5,a0
    80005008:	00048593          	mv	a1,s1
    8000500c:	00001097          	auipc	ra,0x1
    80005010:	7a8080e7          	jalr	1960(ra) # 800067b4 <_ZN9BufferCPPC1Ei>
    80005014:	0300006f          	j	80005044 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005018:	00005517          	auipc	a0,0x5
    8000501c:	3b050513          	addi	a0,a0,944 # 8000a3c8 <CONSOLE_STATUS+0x3b8>
    80005020:	00001097          	auipc	ra,0x1
    80005024:	4c4080e7          	jalr	1220(ra) # 800064e4 <_Z11printStringPKc>
        return;
    80005028:	0140006f          	j	8000503c <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    8000502c:	00005517          	auipc	a0,0x5
    80005030:	3dc50513          	addi	a0,a0,988 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80005034:	00001097          	auipc	ra,0x1
    80005038:	4b0080e7          	jalr	1200(ra) # 800064e4 <_Z11printStringPKc>
        return;
    8000503c:	000c0113          	mv	sp,s8
    80005040:	2140006f          	j	80005254 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80005044:	01000513          	li	a0,16
    80005048:	ffffe097          	auipc	ra,0xffffe
    8000504c:	20c080e7          	jalr	524(ra) # 80003254 <_Znwm>
    80005050:	00050913          	mv	s2,a0
    80005054:	00000593          	li	a1,0
    80005058:	ffffe097          	auipc	ra,0xffffe
    8000505c:	568080e7          	jalr	1384(ra) # 800035c0 <_ZN9SemaphoreC1Ej>
    80005060:	00008797          	auipc	a5,0x8
    80005064:	2727b423          	sd	s2,616(a5) # 8000d2c8 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80005068:	00399793          	slli	a5,s3,0x3
    8000506c:	00f78793          	addi	a5,a5,15
    80005070:	ff07f793          	andi	a5,a5,-16
    80005074:	40f10133          	sub	sp,sp,a5
    80005078:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    8000507c:	0019871b          	addiw	a4,s3,1
    80005080:	00171793          	slli	a5,a4,0x1
    80005084:	00e787b3          	add	a5,a5,a4
    80005088:	00379793          	slli	a5,a5,0x3
    8000508c:	00f78793          	addi	a5,a5,15
    80005090:	ff07f793          	andi	a5,a5,-16
    80005094:	40f10133          	sub	sp,sp,a5
    80005098:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    8000509c:	00199493          	slli	s1,s3,0x1
    800050a0:	013484b3          	add	s1,s1,s3
    800050a4:	00349493          	slli	s1,s1,0x3
    800050a8:	009b04b3          	add	s1,s6,s1
    800050ac:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    800050b0:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    800050b4:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800050b8:	02800513          	li	a0,40
    800050bc:	ffffe097          	auipc	ra,0xffffe
    800050c0:	198080e7          	jalr	408(ra) # 80003254 <_Znwm>
    800050c4:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    800050c8:	ffffe097          	auipc	ra,0xffffe
    800050cc:	47c080e7          	jalr	1148(ra) # 80003544 <_ZN6ThreadC1Ev>
    800050d0:	00008797          	auipc	a5,0x8
    800050d4:	f1078793          	addi	a5,a5,-240 # 8000cfe0 <_ZTV8Consumer+0x10>
    800050d8:	00fbb023          	sd	a5,0(s7)
    800050dc:	029bb023          	sd	s1,32(s7)
    consumer->start();
    800050e0:	000b8513          	mv	a0,s7
    800050e4:	ffffe097          	auipc	ra,0xffffe
    800050e8:	328080e7          	jalr	808(ra) # 8000340c <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800050ec:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800050f0:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800050f4:	00008797          	auipc	a5,0x8
    800050f8:	1d47b783          	ld	a5,468(a5) # 8000d2c8 <_ZL10waitForAll>
    800050fc:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80005100:	02800513          	li	a0,40
    80005104:	ffffe097          	auipc	ra,0xffffe
    80005108:	150080e7          	jalr	336(ra) # 80003254 <_Znwm>
    8000510c:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80005110:	ffffe097          	auipc	ra,0xffffe
    80005114:	434080e7          	jalr	1076(ra) # 80003544 <_ZN6ThreadC1Ev>
    80005118:	00008797          	auipc	a5,0x8
    8000511c:	e7878793          	addi	a5,a5,-392 # 8000cf90 <_ZTV16ProducerKeyborad+0x10>
    80005120:	00f4b023          	sd	a5,0(s1)
    80005124:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80005128:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    8000512c:	00048513          	mv	a0,s1
    80005130:	ffffe097          	auipc	ra,0xffffe
    80005134:	2dc080e7          	jalr	732(ra) # 8000340c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80005138:	00100913          	li	s2,1
    8000513c:	0300006f          	j	8000516c <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80005140:	00008797          	auipc	a5,0x8
    80005144:	e7878793          	addi	a5,a5,-392 # 8000cfb8 <_ZTV8Producer+0x10>
    80005148:	00fcb023          	sd	a5,0(s9)
    8000514c:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80005150:	00391793          	slli	a5,s2,0x3
    80005154:	00fa07b3          	add	a5,s4,a5
    80005158:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    8000515c:	000c8513          	mv	a0,s9
    80005160:	ffffe097          	auipc	ra,0xffffe
    80005164:	2ac080e7          	jalr	684(ra) # 8000340c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80005168:	0019091b          	addiw	s2,s2,1
    8000516c:	05395263          	bge	s2,s3,800051b0 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80005170:	00191493          	slli	s1,s2,0x1
    80005174:	012484b3          	add	s1,s1,s2
    80005178:	00349493          	slli	s1,s1,0x3
    8000517c:	009b04b3          	add	s1,s6,s1
    80005180:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80005184:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80005188:	00008797          	auipc	a5,0x8
    8000518c:	1407b783          	ld	a5,320(a5) # 8000d2c8 <_ZL10waitForAll>
    80005190:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80005194:	02800513          	li	a0,40
    80005198:	ffffe097          	auipc	ra,0xffffe
    8000519c:	0bc080e7          	jalr	188(ra) # 80003254 <_Znwm>
    800051a0:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800051a4:	ffffe097          	auipc	ra,0xffffe
    800051a8:	3a0080e7          	jalr	928(ra) # 80003544 <_ZN6ThreadC1Ev>
    800051ac:	f95ff06f          	j	80005140 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    800051b0:	ffffe097          	auipc	ra,0xffffe
    800051b4:	2d8080e7          	jalr	728(ra) # 80003488 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800051b8:	00000493          	li	s1,0
    800051bc:	0099ce63          	blt	s3,s1,800051d8 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    800051c0:	00008517          	auipc	a0,0x8
    800051c4:	10853503          	ld	a0,264(a0) # 8000d2c8 <_ZL10waitForAll>
    800051c8:	ffffe097          	auipc	ra,0xffffe
    800051cc:	430080e7          	jalr	1072(ra) # 800035f8 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800051d0:	0014849b          	addiw	s1,s1,1
    800051d4:	fe9ff06f          	j	800051bc <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    800051d8:	00008517          	auipc	a0,0x8
    800051dc:	0f053503          	ld	a0,240(a0) # 8000d2c8 <_ZL10waitForAll>
    800051e0:	00050863          	beqz	a0,800051f0 <_Z20testConsumerProducerv+0x2f4>
    800051e4:	00053783          	ld	a5,0(a0)
    800051e8:	0087b783          	ld	a5,8(a5)
    800051ec:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800051f0:	00000493          	li	s1,0
    800051f4:	0080006f          	j	800051fc <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800051f8:	0014849b          	addiw	s1,s1,1
    800051fc:	0334d263          	bge	s1,s3,80005220 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80005200:	00349793          	slli	a5,s1,0x3
    80005204:	00fa07b3          	add	a5,s4,a5
    80005208:	0007b503          	ld	a0,0(a5)
    8000520c:	fe0506e3          	beqz	a0,800051f8 <_Z20testConsumerProducerv+0x2fc>
    80005210:	00053783          	ld	a5,0(a0)
    80005214:	0087b783          	ld	a5,8(a5)
    80005218:	000780e7          	jalr	a5
    8000521c:	fddff06f          	j	800051f8 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80005220:	000b8a63          	beqz	s7,80005234 <_Z20testConsumerProducerv+0x338>
    80005224:	000bb783          	ld	a5,0(s7)
    80005228:	0087b783          	ld	a5,8(a5)
    8000522c:	000b8513          	mv	a0,s7
    80005230:	000780e7          	jalr	a5
    delete buffer;
    80005234:	000a8e63          	beqz	s5,80005250 <_Z20testConsumerProducerv+0x354>
    80005238:	000a8513          	mv	a0,s5
    8000523c:	00002097          	auipc	ra,0x2
    80005240:	870080e7          	jalr	-1936(ra) # 80006aac <_ZN9BufferCPPD1Ev>
    80005244:	000a8513          	mv	a0,s5
    80005248:	ffffe097          	auipc	ra,0xffffe
    8000524c:	05c080e7          	jalr	92(ra) # 800032a4 <_ZdlPv>
    80005250:	000c0113          	mv	sp,s8
}
    80005254:	f8040113          	addi	sp,s0,-128
    80005258:	07813083          	ld	ra,120(sp)
    8000525c:	07013403          	ld	s0,112(sp)
    80005260:	06813483          	ld	s1,104(sp)
    80005264:	06013903          	ld	s2,96(sp)
    80005268:	05813983          	ld	s3,88(sp)
    8000526c:	05013a03          	ld	s4,80(sp)
    80005270:	04813a83          	ld	s5,72(sp)
    80005274:	04013b03          	ld	s6,64(sp)
    80005278:	03813b83          	ld	s7,56(sp)
    8000527c:	03013c03          	ld	s8,48(sp)
    80005280:	02813c83          	ld	s9,40(sp)
    80005284:	08010113          	addi	sp,sp,128
    80005288:	00008067          	ret
    8000528c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005290:	000a8513          	mv	a0,s5
    80005294:	ffffe097          	auipc	ra,0xffffe
    80005298:	010080e7          	jalr	16(ra) # 800032a4 <_ZdlPv>
    8000529c:	00048513          	mv	a0,s1
    800052a0:	00009097          	auipc	ra,0x9
    800052a4:	138080e7          	jalr	312(ra) # 8000e3d8 <_Unwind_Resume>
    800052a8:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    800052ac:	00090513          	mv	a0,s2
    800052b0:	ffffe097          	auipc	ra,0xffffe
    800052b4:	ff4080e7          	jalr	-12(ra) # 800032a4 <_ZdlPv>
    800052b8:	00048513          	mv	a0,s1
    800052bc:	00009097          	auipc	ra,0x9
    800052c0:	11c080e7          	jalr	284(ra) # 8000e3d8 <_Unwind_Resume>
    800052c4:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800052c8:	000b8513          	mv	a0,s7
    800052cc:	ffffe097          	auipc	ra,0xffffe
    800052d0:	fd8080e7          	jalr	-40(ra) # 800032a4 <_ZdlPv>
    800052d4:	00048513          	mv	a0,s1
    800052d8:	00009097          	auipc	ra,0x9
    800052dc:	100080e7          	jalr	256(ra) # 8000e3d8 <_Unwind_Resume>
    800052e0:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800052e4:	00048513          	mv	a0,s1
    800052e8:	ffffe097          	auipc	ra,0xffffe
    800052ec:	fbc080e7          	jalr	-68(ra) # 800032a4 <_ZdlPv>
    800052f0:	00090513          	mv	a0,s2
    800052f4:	00009097          	auipc	ra,0x9
    800052f8:	0e4080e7          	jalr	228(ra) # 8000e3d8 <_Unwind_Resume>
    800052fc:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80005300:	000c8513          	mv	a0,s9
    80005304:	ffffe097          	auipc	ra,0xffffe
    80005308:	fa0080e7          	jalr	-96(ra) # 800032a4 <_ZdlPv>
    8000530c:	00048513          	mv	a0,s1
    80005310:	00009097          	auipc	ra,0x9
    80005314:	0c8080e7          	jalr	200(ra) # 8000e3d8 <_Unwind_Resume>

0000000080005318 <_ZN8Consumer3runEv>:
    void run() override {
    80005318:	fd010113          	addi	sp,sp,-48
    8000531c:	02113423          	sd	ra,40(sp)
    80005320:	02813023          	sd	s0,32(sp)
    80005324:	00913c23          	sd	s1,24(sp)
    80005328:	01213823          	sd	s2,16(sp)
    8000532c:	01313423          	sd	s3,8(sp)
    80005330:	03010413          	addi	s0,sp,48
    80005334:	00050913          	mv	s2,a0
        int i = 0;
    80005338:	00000993          	li	s3,0
    8000533c:	0100006f          	j	8000534c <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80005340:	00a00513          	li	a0,10
    80005344:	ffffe097          	auipc	ra,0xffffe
    80005348:	3b4080e7          	jalr	948(ra) # 800036f8 <_ZN7Console4putcEc>
        while (!threadEnd) {
    8000534c:	00008797          	auipc	a5,0x8
    80005350:	f747a783          	lw	a5,-140(a5) # 8000d2c0 <_ZL9threadEnd>
    80005354:	04079a63          	bnez	a5,800053a8 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80005358:	02093783          	ld	a5,32(s2)
    8000535c:	0087b503          	ld	a0,8(a5)
    80005360:	00001097          	auipc	ra,0x1
    80005364:	638080e7          	jalr	1592(ra) # 80006998 <_ZN9BufferCPP3getEv>
            i++;
    80005368:	0019849b          	addiw	s1,s3,1
    8000536c:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80005370:	0ff57513          	andi	a0,a0,255
    80005374:	ffffe097          	auipc	ra,0xffffe
    80005378:	384080e7          	jalr	900(ra) # 800036f8 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    8000537c:	05000793          	li	a5,80
    80005380:	02f4e4bb          	remw	s1,s1,a5
    80005384:	fc0494e3          	bnez	s1,8000534c <_ZN8Consumer3runEv+0x34>
    80005388:	fb9ff06f          	j	80005340 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    8000538c:	02093783          	ld	a5,32(s2)
    80005390:	0087b503          	ld	a0,8(a5)
    80005394:	00001097          	auipc	ra,0x1
    80005398:	604080e7          	jalr	1540(ra) # 80006998 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    8000539c:	0ff57513          	andi	a0,a0,255
    800053a0:	ffffe097          	auipc	ra,0xffffe
    800053a4:	358080e7          	jalr	856(ra) # 800036f8 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    800053a8:	02093783          	ld	a5,32(s2)
    800053ac:	0087b503          	ld	a0,8(a5)
    800053b0:	00001097          	auipc	ra,0x1
    800053b4:	674080e7          	jalr	1652(ra) # 80006a24 <_ZN9BufferCPP6getCntEv>
    800053b8:	fca04ae3          	bgtz	a0,8000538c <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    800053bc:	02093783          	ld	a5,32(s2)
    800053c0:	0107b503          	ld	a0,16(a5)
    800053c4:	ffffe097          	auipc	ra,0xffffe
    800053c8:	260080e7          	jalr	608(ra) # 80003624 <_ZN9Semaphore6signalEv>
    }
    800053cc:	02813083          	ld	ra,40(sp)
    800053d0:	02013403          	ld	s0,32(sp)
    800053d4:	01813483          	ld	s1,24(sp)
    800053d8:	01013903          	ld	s2,16(sp)
    800053dc:	00813983          	ld	s3,8(sp)
    800053e0:	03010113          	addi	sp,sp,48
    800053e4:	00008067          	ret

00000000800053e8 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    800053e8:	ff010113          	addi	sp,sp,-16
    800053ec:	00113423          	sd	ra,8(sp)
    800053f0:	00813023          	sd	s0,0(sp)
    800053f4:	01010413          	addi	s0,sp,16
    800053f8:	00008797          	auipc	a5,0x8
    800053fc:	be878793          	addi	a5,a5,-1048 # 8000cfe0 <_ZTV8Consumer+0x10>
    80005400:	00f53023          	sd	a5,0(a0)
    80005404:	ffffe097          	auipc	ra,0xffffe
    80005408:	d9c080e7          	jalr	-612(ra) # 800031a0 <_ZN6ThreadD1Ev>
    8000540c:	00813083          	ld	ra,8(sp)
    80005410:	00013403          	ld	s0,0(sp)
    80005414:	01010113          	addi	sp,sp,16
    80005418:	00008067          	ret

000000008000541c <_ZN8ConsumerD0Ev>:
    8000541c:	fe010113          	addi	sp,sp,-32
    80005420:	00113c23          	sd	ra,24(sp)
    80005424:	00813823          	sd	s0,16(sp)
    80005428:	00913423          	sd	s1,8(sp)
    8000542c:	02010413          	addi	s0,sp,32
    80005430:	00050493          	mv	s1,a0
    80005434:	00008797          	auipc	a5,0x8
    80005438:	bac78793          	addi	a5,a5,-1108 # 8000cfe0 <_ZTV8Consumer+0x10>
    8000543c:	00f53023          	sd	a5,0(a0)
    80005440:	ffffe097          	auipc	ra,0xffffe
    80005444:	d60080e7          	jalr	-672(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80005448:	00048513          	mv	a0,s1
    8000544c:	ffffe097          	auipc	ra,0xffffe
    80005450:	e58080e7          	jalr	-424(ra) # 800032a4 <_ZdlPv>
    80005454:	01813083          	ld	ra,24(sp)
    80005458:	01013403          	ld	s0,16(sp)
    8000545c:	00813483          	ld	s1,8(sp)
    80005460:	02010113          	addi	sp,sp,32
    80005464:	00008067          	ret

0000000080005468 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80005468:	ff010113          	addi	sp,sp,-16
    8000546c:	00113423          	sd	ra,8(sp)
    80005470:	00813023          	sd	s0,0(sp)
    80005474:	01010413          	addi	s0,sp,16
    80005478:	00008797          	auipc	a5,0x8
    8000547c:	b1878793          	addi	a5,a5,-1256 # 8000cf90 <_ZTV16ProducerKeyborad+0x10>
    80005480:	00f53023          	sd	a5,0(a0)
    80005484:	ffffe097          	auipc	ra,0xffffe
    80005488:	d1c080e7          	jalr	-740(ra) # 800031a0 <_ZN6ThreadD1Ev>
    8000548c:	00813083          	ld	ra,8(sp)
    80005490:	00013403          	ld	s0,0(sp)
    80005494:	01010113          	addi	sp,sp,16
    80005498:	00008067          	ret

000000008000549c <_ZN16ProducerKeyboradD0Ev>:
    8000549c:	fe010113          	addi	sp,sp,-32
    800054a0:	00113c23          	sd	ra,24(sp)
    800054a4:	00813823          	sd	s0,16(sp)
    800054a8:	00913423          	sd	s1,8(sp)
    800054ac:	02010413          	addi	s0,sp,32
    800054b0:	00050493          	mv	s1,a0
    800054b4:	00008797          	auipc	a5,0x8
    800054b8:	adc78793          	addi	a5,a5,-1316 # 8000cf90 <_ZTV16ProducerKeyborad+0x10>
    800054bc:	00f53023          	sd	a5,0(a0)
    800054c0:	ffffe097          	auipc	ra,0xffffe
    800054c4:	ce0080e7          	jalr	-800(ra) # 800031a0 <_ZN6ThreadD1Ev>
    800054c8:	00048513          	mv	a0,s1
    800054cc:	ffffe097          	auipc	ra,0xffffe
    800054d0:	dd8080e7          	jalr	-552(ra) # 800032a4 <_ZdlPv>
    800054d4:	01813083          	ld	ra,24(sp)
    800054d8:	01013403          	ld	s0,16(sp)
    800054dc:	00813483          	ld	s1,8(sp)
    800054e0:	02010113          	addi	sp,sp,32
    800054e4:	00008067          	ret

00000000800054e8 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    800054e8:	ff010113          	addi	sp,sp,-16
    800054ec:	00113423          	sd	ra,8(sp)
    800054f0:	00813023          	sd	s0,0(sp)
    800054f4:	01010413          	addi	s0,sp,16
    800054f8:	00008797          	auipc	a5,0x8
    800054fc:	ac078793          	addi	a5,a5,-1344 # 8000cfb8 <_ZTV8Producer+0x10>
    80005500:	00f53023          	sd	a5,0(a0)
    80005504:	ffffe097          	auipc	ra,0xffffe
    80005508:	c9c080e7          	jalr	-868(ra) # 800031a0 <_ZN6ThreadD1Ev>
    8000550c:	00813083          	ld	ra,8(sp)
    80005510:	00013403          	ld	s0,0(sp)
    80005514:	01010113          	addi	sp,sp,16
    80005518:	00008067          	ret

000000008000551c <_ZN8ProducerD0Ev>:
    8000551c:	fe010113          	addi	sp,sp,-32
    80005520:	00113c23          	sd	ra,24(sp)
    80005524:	00813823          	sd	s0,16(sp)
    80005528:	00913423          	sd	s1,8(sp)
    8000552c:	02010413          	addi	s0,sp,32
    80005530:	00050493          	mv	s1,a0
    80005534:	00008797          	auipc	a5,0x8
    80005538:	a8478793          	addi	a5,a5,-1404 # 8000cfb8 <_ZTV8Producer+0x10>
    8000553c:	00f53023          	sd	a5,0(a0)
    80005540:	ffffe097          	auipc	ra,0xffffe
    80005544:	c60080e7          	jalr	-928(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80005548:	00048513          	mv	a0,s1
    8000554c:	ffffe097          	auipc	ra,0xffffe
    80005550:	d58080e7          	jalr	-680(ra) # 800032a4 <_ZdlPv>
    80005554:	01813083          	ld	ra,24(sp)
    80005558:	01013403          	ld	s0,16(sp)
    8000555c:	00813483          	ld	s1,8(sp)
    80005560:	02010113          	addi	sp,sp,32
    80005564:	00008067          	ret

0000000080005568 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80005568:	fe010113          	addi	sp,sp,-32
    8000556c:	00113c23          	sd	ra,24(sp)
    80005570:	00813823          	sd	s0,16(sp)
    80005574:	00913423          	sd	s1,8(sp)
    80005578:	02010413          	addi	s0,sp,32
    8000557c:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80005580:	ffffc097          	auipc	ra,0xffffc
    80005584:	080080e7          	jalr	128(ra) # 80001600 <_Z4getcv>
    80005588:	0005059b          	sext.w	a1,a0
    8000558c:	01b00793          	li	a5,27
    80005590:	00f58c63          	beq	a1,a5,800055a8 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80005594:	0204b783          	ld	a5,32(s1)
    80005598:	0087b503          	ld	a0,8(a5)
    8000559c:	00001097          	auipc	ra,0x1
    800055a0:	36c080e7          	jalr	876(ra) # 80006908 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    800055a4:	fddff06f          	j	80005580 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    800055a8:	00100793          	li	a5,1
    800055ac:	00008717          	auipc	a4,0x8
    800055b0:	d0f72a23          	sw	a5,-748(a4) # 8000d2c0 <_ZL9threadEnd>
        td->buffer->put('!');
    800055b4:	0204b783          	ld	a5,32(s1)
    800055b8:	02100593          	li	a1,33
    800055bc:	0087b503          	ld	a0,8(a5)
    800055c0:	00001097          	auipc	ra,0x1
    800055c4:	348080e7          	jalr	840(ra) # 80006908 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    800055c8:	0204b783          	ld	a5,32(s1)
    800055cc:	0107b503          	ld	a0,16(a5)
    800055d0:	ffffe097          	auipc	ra,0xffffe
    800055d4:	054080e7          	jalr	84(ra) # 80003624 <_ZN9Semaphore6signalEv>
    }
    800055d8:	01813083          	ld	ra,24(sp)
    800055dc:	01013403          	ld	s0,16(sp)
    800055e0:	00813483          	ld	s1,8(sp)
    800055e4:	02010113          	addi	sp,sp,32
    800055e8:	00008067          	ret

00000000800055ec <_ZN8Producer3runEv>:
    void run() override {
    800055ec:	fe010113          	addi	sp,sp,-32
    800055f0:	00113c23          	sd	ra,24(sp)
    800055f4:	00813823          	sd	s0,16(sp)
    800055f8:	00913423          	sd	s1,8(sp)
    800055fc:	01213023          	sd	s2,0(sp)
    80005600:	02010413          	addi	s0,sp,32
    80005604:	00050493          	mv	s1,a0
        int i = 0;
    80005608:	00000913          	li	s2,0
        while (!threadEnd) {
    8000560c:	00008797          	auipc	a5,0x8
    80005610:	cb47a783          	lw	a5,-844(a5) # 8000d2c0 <_ZL9threadEnd>
    80005614:	04079263          	bnez	a5,80005658 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80005618:	0204b783          	ld	a5,32(s1)
    8000561c:	0007a583          	lw	a1,0(a5)
    80005620:	0305859b          	addiw	a1,a1,48
    80005624:	0087b503          	ld	a0,8(a5)
    80005628:	00001097          	auipc	ra,0x1
    8000562c:	2e0080e7          	jalr	736(ra) # 80006908 <_ZN9BufferCPP3putEi>
            i++;
    80005630:	0019071b          	addiw	a4,s2,1
    80005634:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80005638:	0204b783          	ld	a5,32(s1)
    8000563c:	0007a783          	lw	a5,0(a5)
    80005640:	00e787bb          	addw	a5,a5,a4
    80005644:	00500513          	li	a0,5
    80005648:	02a7e53b          	remw	a0,a5,a0
    8000564c:	ffffe097          	auipc	ra,0xffffe
    80005650:	e64080e7          	jalr	-412(ra) # 800034b0 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80005654:	fb9ff06f          	j	8000560c <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80005658:	0204b783          	ld	a5,32(s1)
    8000565c:	0107b503          	ld	a0,16(a5)
    80005660:	ffffe097          	auipc	ra,0xffffe
    80005664:	fc4080e7          	jalr	-60(ra) # 80003624 <_ZN9Semaphore6signalEv>
    }
    80005668:	01813083          	ld	ra,24(sp)
    8000566c:	01013403          	ld	s0,16(sp)
    80005670:	00813483          	ld	s1,8(sp)
    80005674:	00013903          	ld	s2,0(sp)
    80005678:	02010113          	addi	sp,sp,32
    8000567c:	00008067          	ret

0000000080005680 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005680:	fe010113          	addi	sp,sp,-32
    80005684:	00113c23          	sd	ra,24(sp)
    80005688:	00813823          	sd	s0,16(sp)
    8000568c:	00913423          	sd	s1,8(sp)
    80005690:	01213023          	sd	s2,0(sp)
    80005694:	02010413          	addi	s0,sp,32
    80005698:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000569c:	00100793          	li	a5,1
    800056a0:	02a7f863          	bgeu	a5,a0,800056d0 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800056a4:	00a00793          	li	a5,10
    800056a8:	02f577b3          	remu	a5,a0,a5
    800056ac:	02078e63          	beqz	a5,800056e8 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800056b0:	fff48513          	addi	a0,s1,-1
    800056b4:	00000097          	auipc	ra,0x0
    800056b8:	fcc080e7          	jalr	-52(ra) # 80005680 <_ZL9fibonaccim>
    800056bc:	00050913          	mv	s2,a0
    800056c0:	ffe48513          	addi	a0,s1,-2
    800056c4:	00000097          	auipc	ra,0x0
    800056c8:	fbc080e7          	jalr	-68(ra) # 80005680 <_ZL9fibonaccim>
    800056cc:	00a90533          	add	a0,s2,a0
}
    800056d0:	01813083          	ld	ra,24(sp)
    800056d4:	01013403          	ld	s0,16(sp)
    800056d8:	00813483          	ld	s1,8(sp)
    800056dc:	00013903          	ld	s2,0(sp)
    800056e0:	02010113          	addi	sp,sp,32
    800056e4:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800056e8:	ffffc097          	auipc	ra,0xffffc
    800056ec:	dd8080e7          	jalr	-552(ra) # 800014c0 <_Z15thread_dispatchv>
    800056f0:	fc1ff06f          	j	800056b0 <_ZL9fibonaccim+0x30>

00000000800056f4 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800056f4:	fe010113          	addi	sp,sp,-32
    800056f8:	00113c23          	sd	ra,24(sp)
    800056fc:	00813823          	sd	s0,16(sp)
    80005700:	00913423          	sd	s1,8(sp)
    80005704:	01213023          	sd	s2,0(sp)
    80005708:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000570c:	00a00493          	li	s1,10
    80005710:	0400006f          	j	80005750 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005714:	00005517          	auipc	a0,0x5
    80005718:	d9450513          	addi	a0,a0,-620 # 8000a4a8 <CONSOLE_STATUS+0x498>
    8000571c:	00001097          	auipc	ra,0x1
    80005720:	dc8080e7          	jalr	-568(ra) # 800064e4 <_Z11printStringPKc>
    80005724:	00000613          	li	a2,0
    80005728:	00a00593          	li	a1,10
    8000572c:	00048513          	mv	a0,s1
    80005730:	00001097          	auipc	ra,0x1
    80005734:	f64080e7          	jalr	-156(ra) # 80006694 <_Z8printIntiii>
    80005738:	00005517          	auipc	a0,0x5
    8000573c:	f6050513          	addi	a0,a0,-160 # 8000a698 <CONSOLE_STATUS+0x688>
    80005740:	00001097          	auipc	ra,0x1
    80005744:	da4080e7          	jalr	-604(ra) # 800064e4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005748:	0014849b          	addiw	s1,s1,1
    8000574c:	0ff4f493          	andi	s1,s1,255
    80005750:	00c00793          	li	a5,12
    80005754:	fc97f0e3          	bgeu	a5,s1,80005714 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005758:	00005517          	auipc	a0,0x5
    8000575c:	d5850513          	addi	a0,a0,-680 # 8000a4b0 <CONSOLE_STATUS+0x4a0>
    80005760:	00001097          	auipc	ra,0x1
    80005764:	d84080e7          	jalr	-636(ra) # 800064e4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005768:	00500313          	li	t1,5
    thread_dispatch();
    8000576c:	ffffc097          	auipc	ra,0xffffc
    80005770:	d54080e7          	jalr	-684(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005774:	01000513          	li	a0,16
    80005778:	00000097          	auipc	ra,0x0
    8000577c:	f08080e7          	jalr	-248(ra) # 80005680 <_ZL9fibonaccim>
    80005780:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005784:	00005517          	auipc	a0,0x5
    80005788:	d3c50513          	addi	a0,a0,-708 # 8000a4c0 <CONSOLE_STATUS+0x4b0>
    8000578c:	00001097          	auipc	ra,0x1
    80005790:	d58080e7          	jalr	-680(ra) # 800064e4 <_Z11printStringPKc>
    80005794:	00000613          	li	a2,0
    80005798:	00a00593          	li	a1,10
    8000579c:	0009051b          	sext.w	a0,s2
    800057a0:	00001097          	auipc	ra,0x1
    800057a4:	ef4080e7          	jalr	-268(ra) # 80006694 <_Z8printIntiii>
    800057a8:	00005517          	auipc	a0,0x5
    800057ac:	ef050513          	addi	a0,a0,-272 # 8000a698 <CONSOLE_STATUS+0x688>
    800057b0:	00001097          	auipc	ra,0x1
    800057b4:	d34080e7          	jalr	-716(ra) # 800064e4 <_Z11printStringPKc>
    800057b8:	0400006f          	j	800057f8 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800057bc:	00005517          	auipc	a0,0x5
    800057c0:	cec50513          	addi	a0,a0,-788 # 8000a4a8 <CONSOLE_STATUS+0x498>
    800057c4:	00001097          	auipc	ra,0x1
    800057c8:	d20080e7          	jalr	-736(ra) # 800064e4 <_Z11printStringPKc>
    800057cc:	00000613          	li	a2,0
    800057d0:	00a00593          	li	a1,10
    800057d4:	00048513          	mv	a0,s1
    800057d8:	00001097          	auipc	ra,0x1
    800057dc:	ebc080e7          	jalr	-324(ra) # 80006694 <_Z8printIntiii>
    800057e0:	00005517          	auipc	a0,0x5
    800057e4:	eb850513          	addi	a0,a0,-328 # 8000a698 <CONSOLE_STATUS+0x688>
    800057e8:	00001097          	auipc	ra,0x1
    800057ec:	cfc080e7          	jalr	-772(ra) # 800064e4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800057f0:	0014849b          	addiw	s1,s1,1
    800057f4:	0ff4f493          	andi	s1,s1,255
    800057f8:	00f00793          	li	a5,15
    800057fc:	fc97f0e3          	bgeu	a5,s1,800057bc <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005800:	00005517          	auipc	a0,0x5
    80005804:	cd050513          	addi	a0,a0,-816 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80005808:	00001097          	auipc	ra,0x1
    8000580c:	cdc080e7          	jalr	-804(ra) # 800064e4 <_Z11printStringPKc>
    finishedD = true;
    80005810:	00100793          	li	a5,1
    80005814:	00008717          	auipc	a4,0x8
    80005818:	aaf70e23          	sb	a5,-1348(a4) # 8000d2d0 <_ZL9finishedD>
    thread_dispatch();
    8000581c:	ffffc097          	auipc	ra,0xffffc
    80005820:	ca4080e7          	jalr	-860(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80005824:	01813083          	ld	ra,24(sp)
    80005828:	01013403          	ld	s0,16(sp)
    8000582c:	00813483          	ld	s1,8(sp)
    80005830:	00013903          	ld	s2,0(sp)
    80005834:	02010113          	addi	sp,sp,32
    80005838:	00008067          	ret

000000008000583c <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    8000583c:	fe010113          	addi	sp,sp,-32
    80005840:	00113c23          	sd	ra,24(sp)
    80005844:	00813823          	sd	s0,16(sp)
    80005848:	00913423          	sd	s1,8(sp)
    8000584c:	01213023          	sd	s2,0(sp)
    80005850:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005854:	00000493          	li	s1,0
    80005858:	0400006f          	j	80005898 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    8000585c:	00005517          	auipc	a0,0x5
    80005860:	c0c50513          	addi	a0,a0,-1012 # 8000a468 <CONSOLE_STATUS+0x458>
    80005864:	00001097          	auipc	ra,0x1
    80005868:	c80080e7          	jalr	-896(ra) # 800064e4 <_Z11printStringPKc>
    8000586c:	00000613          	li	a2,0
    80005870:	00a00593          	li	a1,10
    80005874:	00048513          	mv	a0,s1
    80005878:	00001097          	auipc	ra,0x1
    8000587c:	e1c080e7          	jalr	-484(ra) # 80006694 <_Z8printIntiii>
    80005880:	00005517          	auipc	a0,0x5
    80005884:	e1850513          	addi	a0,a0,-488 # 8000a698 <CONSOLE_STATUS+0x688>
    80005888:	00001097          	auipc	ra,0x1
    8000588c:	c5c080e7          	jalr	-932(ra) # 800064e4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005890:	0014849b          	addiw	s1,s1,1
    80005894:	0ff4f493          	andi	s1,s1,255
    80005898:	00200793          	li	a5,2
    8000589c:	fc97f0e3          	bgeu	a5,s1,8000585c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800058a0:	00005517          	auipc	a0,0x5
    800058a4:	bd050513          	addi	a0,a0,-1072 # 8000a470 <CONSOLE_STATUS+0x460>
    800058a8:	00001097          	auipc	ra,0x1
    800058ac:	c3c080e7          	jalr	-964(ra) # 800064e4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800058b0:	00700313          	li	t1,7
    thread_dispatch();
    800058b4:	ffffc097          	auipc	ra,0xffffc
    800058b8:	c0c080e7          	jalr	-1012(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800058bc:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800058c0:	00005517          	auipc	a0,0x5
    800058c4:	bc050513          	addi	a0,a0,-1088 # 8000a480 <CONSOLE_STATUS+0x470>
    800058c8:	00001097          	auipc	ra,0x1
    800058cc:	c1c080e7          	jalr	-996(ra) # 800064e4 <_Z11printStringPKc>
    800058d0:	00000613          	li	a2,0
    800058d4:	00a00593          	li	a1,10
    800058d8:	0009051b          	sext.w	a0,s2
    800058dc:	00001097          	auipc	ra,0x1
    800058e0:	db8080e7          	jalr	-584(ra) # 80006694 <_Z8printIntiii>
    800058e4:	00005517          	auipc	a0,0x5
    800058e8:	db450513          	addi	a0,a0,-588 # 8000a698 <CONSOLE_STATUS+0x688>
    800058ec:	00001097          	auipc	ra,0x1
    800058f0:	bf8080e7          	jalr	-1032(ra) # 800064e4 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800058f4:	00c00513          	li	a0,12
    800058f8:	00000097          	auipc	ra,0x0
    800058fc:	d88080e7          	jalr	-632(ra) # 80005680 <_ZL9fibonaccim>
    80005900:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005904:	00005517          	auipc	a0,0x5
    80005908:	b8450513          	addi	a0,a0,-1148 # 8000a488 <CONSOLE_STATUS+0x478>
    8000590c:	00001097          	auipc	ra,0x1
    80005910:	bd8080e7          	jalr	-1064(ra) # 800064e4 <_Z11printStringPKc>
    80005914:	00000613          	li	a2,0
    80005918:	00a00593          	li	a1,10
    8000591c:	0009051b          	sext.w	a0,s2
    80005920:	00001097          	auipc	ra,0x1
    80005924:	d74080e7          	jalr	-652(ra) # 80006694 <_Z8printIntiii>
    80005928:	00005517          	auipc	a0,0x5
    8000592c:	d7050513          	addi	a0,a0,-656 # 8000a698 <CONSOLE_STATUS+0x688>
    80005930:	00001097          	auipc	ra,0x1
    80005934:	bb4080e7          	jalr	-1100(ra) # 800064e4 <_Z11printStringPKc>
    80005938:	0400006f          	j	80005978 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    8000593c:	00005517          	auipc	a0,0x5
    80005940:	b2c50513          	addi	a0,a0,-1236 # 8000a468 <CONSOLE_STATUS+0x458>
    80005944:	00001097          	auipc	ra,0x1
    80005948:	ba0080e7          	jalr	-1120(ra) # 800064e4 <_Z11printStringPKc>
    8000594c:	00000613          	li	a2,0
    80005950:	00a00593          	li	a1,10
    80005954:	00048513          	mv	a0,s1
    80005958:	00001097          	auipc	ra,0x1
    8000595c:	d3c080e7          	jalr	-708(ra) # 80006694 <_Z8printIntiii>
    80005960:	00005517          	auipc	a0,0x5
    80005964:	d3850513          	addi	a0,a0,-712 # 8000a698 <CONSOLE_STATUS+0x688>
    80005968:	00001097          	auipc	ra,0x1
    8000596c:	b7c080e7          	jalr	-1156(ra) # 800064e4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005970:	0014849b          	addiw	s1,s1,1
    80005974:	0ff4f493          	andi	s1,s1,255
    80005978:	00500793          	li	a5,5
    8000597c:	fc97f0e3          	bgeu	a5,s1,8000593c <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005980:	00005517          	auipc	a0,0x5
    80005984:	b1850513          	addi	a0,a0,-1256 # 8000a498 <CONSOLE_STATUS+0x488>
    80005988:	00001097          	auipc	ra,0x1
    8000598c:	b5c080e7          	jalr	-1188(ra) # 800064e4 <_Z11printStringPKc>
    finishedC = true;
    80005990:	00100793          	li	a5,1
    80005994:	00008717          	auipc	a4,0x8
    80005998:	92f70ea3          	sb	a5,-1731(a4) # 8000d2d1 <_ZL9finishedC>
    thread_dispatch();
    8000599c:	ffffc097          	auipc	ra,0xffffc
    800059a0:	b24080e7          	jalr	-1244(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800059a4:	01813083          	ld	ra,24(sp)
    800059a8:	01013403          	ld	s0,16(sp)
    800059ac:	00813483          	ld	s1,8(sp)
    800059b0:	00013903          	ld	s2,0(sp)
    800059b4:	02010113          	addi	sp,sp,32
    800059b8:	00008067          	ret

00000000800059bc <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800059bc:	fe010113          	addi	sp,sp,-32
    800059c0:	00113c23          	sd	ra,24(sp)
    800059c4:	00813823          	sd	s0,16(sp)
    800059c8:	00913423          	sd	s1,8(sp)
    800059cc:	01213023          	sd	s2,0(sp)
    800059d0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800059d4:	00000913          	li	s2,0
    800059d8:	0380006f          	j	80005a10 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    800059dc:	ffffc097          	auipc	ra,0xffffc
    800059e0:	ae4080e7          	jalr	-1308(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800059e4:	00148493          	addi	s1,s1,1
    800059e8:	000027b7          	lui	a5,0x2
    800059ec:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800059f0:	0097ee63          	bltu	a5,s1,80005a0c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800059f4:	00000713          	li	a4,0
    800059f8:	000077b7          	lui	a5,0x7
    800059fc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005a00:	fce7eee3          	bltu	a5,a4,800059dc <_ZL11workerBodyBPv+0x20>
    80005a04:	00170713          	addi	a4,a4,1
    80005a08:	ff1ff06f          	j	800059f8 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80005a0c:	00190913          	addi	s2,s2,1
    80005a10:	00f00793          	li	a5,15
    80005a14:	0527e063          	bltu	a5,s2,80005a54 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80005a18:	00005517          	auipc	a0,0x5
    80005a1c:	a3850513          	addi	a0,a0,-1480 # 8000a450 <CONSOLE_STATUS+0x440>
    80005a20:	00001097          	auipc	ra,0x1
    80005a24:	ac4080e7          	jalr	-1340(ra) # 800064e4 <_Z11printStringPKc>
    80005a28:	00000613          	li	a2,0
    80005a2c:	00a00593          	li	a1,10
    80005a30:	0009051b          	sext.w	a0,s2
    80005a34:	00001097          	auipc	ra,0x1
    80005a38:	c60080e7          	jalr	-928(ra) # 80006694 <_Z8printIntiii>
    80005a3c:	00005517          	auipc	a0,0x5
    80005a40:	c5c50513          	addi	a0,a0,-932 # 8000a698 <CONSOLE_STATUS+0x688>
    80005a44:	00001097          	auipc	ra,0x1
    80005a48:	aa0080e7          	jalr	-1376(ra) # 800064e4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005a4c:	00000493          	li	s1,0
    80005a50:	f99ff06f          	j	800059e8 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80005a54:	00005517          	auipc	a0,0x5
    80005a58:	a0450513          	addi	a0,a0,-1532 # 8000a458 <CONSOLE_STATUS+0x448>
    80005a5c:	00001097          	auipc	ra,0x1
    80005a60:	a88080e7          	jalr	-1400(ra) # 800064e4 <_Z11printStringPKc>
    finishedB = true;
    80005a64:	00100793          	li	a5,1
    80005a68:	00008717          	auipc	a4,0x8
    80005a6c:	86f70523          	sb	a5,-1942(a4) # 8000d2d2 <_ZL9finishedB>
    thread_dispatch();
    80005a70:	ffffc097          	auipc	ra,0xffffc
    80005a74:	a50080e7          	jalr	-1456(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80005a78:	01813083          	ld	ra,24(sp)
    80005a7c:	01013403          	ld	s0,16(sp)
    80005a80:	00813483          	ld	s1,8(sp)
    80005a84:	00013903          	ld	s2,0(sp)
    80005a88:	02010113          	addi	sp,sp,32
    80005a8c:	00008067          	ret

0000000080005a90 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005a90:	fe010113          	addi	sp,sp,-32
    80005a94:	00113c23          	sd	ra,24(sp)
    80005a98:	00813823          	sd	s0,16(sp)
    80005a9c:	00913423          	sd	s1,8(sp)
    80005aa0:	01213023          	sd	s2,0(sp)
    80005aa4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005aa8:	00000913          	li	s2,0
    80005aac:	0380006f          	j	80005ae4 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005ab0:	ffffc097          	auipc	ra,0xffffc
    80005ab4:	a10080e7          	jalr	-1520(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005ab8:	00148493          	addi	s1,s1,1
    80005abc:	000027b7          	lui	a5,0x2
    80005ac0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005ac4:	0097ee63          	bltu	a5,s1,80005ae0 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005ac8:	00000713          	li	a4,0
    80005acc:	000077b7          	lui	a5,0x7
    80005ad0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005ad4:	fce7eee3          	bltu	a5,a4,80005ab0 <_ZL11workerBodyAPv+0x20>
    80005ad8:	00170713          	addi	a4,a4,1
    80005adc:	ff1ff06f          	j	80005acc <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005ae0:	00190913          	addi	s2,s2,1
    80005ae4:	00900793          	li	a5,9
    80005ae8:	0527e063          	bltu	a5,s2,80005b28 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005aec:	00005517          	auipc	a0,0x5
    80005af0:	94c50513          	addi	a0,a0,-1716 # 8000a438 <CONSOLE_STATUS+0x428>
    80005af4:	00001097          	auipc	ra,0x1
    80005af8:	9f0080e7          	jalr	-1552(ra) # 800064e4 <_Z11printStringPKc>
    80005afc:	00000613          	li	a2,0
    80005b00:	00a00593          	li	a1,10
    80005b04:	0009051b          	sext.w	a0,s2
    80005b08:	00001097          	auipc	ra,0x1
    80005b0c:	b8c080e7          	jalr	-1140(ra) # 80006694 <_Z8printIntiii>
    80005b10:	00005517          	auipc	a0,0x5
    80005b14:	b8850513          	addi	a0,a0,-1144 # 8000a698 <CONSOLE_STATUS+0x688>
    80005b18:	00001097          	auipc	ra,0x1
    80005b1c:	9cc080e7          	jalr	-1588(ra) # 800064e4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005b20:	00000493          	li	s1,0
    80005b24:	f99ff06f          	j	80005abc <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005b28:	00005517          	auipc	a0,0x5
    80005b2c:	91850513          	addi	a0,a0,-1768 # 8000a440 <CONSOLE_STATUS+0x430>
    80005b30:	00001097          	auipc	ra,0x1
    80005b34:	9b4080e7          	jalr	-1612(ra) # 800064e4 <_Z11printStringPKc>
    finishedA = true;
    80005b38:	00100793          	li	a5,1
    80005b3c:	00007717          	auipc	a4,0x7
    80005b40:	78f70ba3          	sb	a5,1943(a4) # 8000d2d3 <_ZL9finishedA>
}
    80005b44:	01813083          	ld	ra,24(sp)
    80005b48:	01013403          	ld	s0,16(sp)
    80005b4c:	00813483          	ld	s1,8(sp)
    80005b50:	00013903          	ld	s2,0(sp)
    80005b54:	02010113          	addi	sp,sp,32
    80005b58:	00008067          	ret

0000000080005b5c <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005b5c:	fd010113          	addi	sp,sp,-48
    80005b60:	02113423          	sd	ra,40(sp)
    80005b64:	02813023          	sd	s0,32(sp)
    80005b68:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005b6c:	00000613          	li	a2,0
    80005b70:	00000597          	auipc	a1,0x0
    80005b74:	f2058593          	addi	a1,a1,-224 # 80005a90 <_ZL11workerBodyAPv>
    80005b78:	fd040513          	addi	a0,s0,-48
    80005b7c:	ffffc097          	auipc	ra,0xffffc
    80005b80:	888080e7          	jalr	-1912(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005b84:	00005517          	auipc	a0,0x5
    80005b88:	95c50513          	addi	a0,a0,-1700 # 8000a4e0 <CONSOLE_STATUS+0x4d0>
    80005b8c:	00001097          	auipc	ra,0x1
    80005b90:	958080e7          	jalr	-1704(ra) # 800064e4 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005b94:	00000613          	li	a2,0
    80005b98:	00000597          	auipc	a1,0x0
    80005b9c:	e2458593          	addi	a1,a1,-476 # 800059bc <_ZL11workerBodyBPv>
    80005ba0:	fd840513          	addi	a0,s0,-40
    80005ba4:	ffffc097          	auipc	ra,0xffffc
    80005ba8:	860080e7          	jalr	-1952(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005bac:	00005517          	auipc	a0,0x5
    80005bb0:	94c50513          	addi	a0,a0,-1716 # 8000a4f8 <CONSOLE_STATUS+0x4e8>
    80005bb4:	00001097          	auipc	ra,0x1
    80005bb8:	930080e7          	jalr	-1744(ra) # 800064e4 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005bbc:	00000613          	li	a2,0
    80005bc0:	00000597          	auipc	a1,0x0
    80005bc4:	c7c58593          	addi	a1,a1,-900 # 8000583c <_ZL11workerBodyCPv>
    80005bc8:	fe040513          	addi	a0,s0,-32
    80005bcc:	ffffc097          	auipc	ra,0xffffc
    80005bd0:	838080e7          	jalr	-1992(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005bd4:	00005517          	auipc	a0,0x5
    80005bd8:	93c50513          	addi	a0,a0,-1732 # 8000a510 <CONSOLE_STATUS+0x500>
    80005bdc:	00001097          	auipc	ra,0x1
    80005be0:	908080e7          	jalr	-1784(ra) # 800064e4 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005be4:	00000613          	li	a2,0
    80005be8:	00000597          	auipc	a1,0x0
    80005bec:	b0c58593          	addi	a1,a1,-1268 # 800056f4 <_ZL11workerBodyDPv>
    80005bf0:	fe840513          	addi	a0,s0,-24
    80005bf4:	ffffc097          	auipc	ra,0xffffc
    80005bf8:	810080e7          	jalr	-2032(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005bfc:	00005517          	auipc	a0,0x5
    80005c00:	92c50513          	addi	a0,a0,-1748 # 8000a528 <CONSOLE_STATUS+0x518>
    80005c04:	00001097          	auipc	ra,0x1
    80005c08:	8e0080e7          	jalr	-1824(ra) # 800064e4 <_Z11printStringPKc>
    80005c0c:	00c0006f          	j	80005c18 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005c10:	ffffc097          	auipc	ra,0xffffc
    80005c14:	8b0080e7          	jalr	-1872(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005c18:	00007797          	auipc	a5,0x7
    80005c1c:	6bb7c783          	lbu	a5,1723(a5) # 8000d2d3 <_ZL9finishedA>
    80005c20:	fe0788e3          	beqz	a5,80005c10 <_Z18Threads_C_API_testv+0xb4>
    80005c24:	00007797          	auipc	a5,0x7
    80005c28:	6ae7c783          	lbu	a5,1710(a5) # 8000d2d2 <_ZL9finishedB>
    80005c2c:	fe0782e3          	beqz	a5,80005c10 <_Z18Threads_C_API_testv+0xb4>
    80005c30:	00007797          	auipc	a5,0x7
    80005c34:	6a17c783          	lbu	a5,1697(a5) # 8000d2d1 <_ZL9finishedC>
    80005c38:	fc078ce3          	beqz	a5,80005c10 <_Z18Threads_C_API_testv+0xb4>
    80005c3c:	00007797          	auipc	a5,0x7
    80005c40:	6947c783          	lbu	a5,1684(a5) # 8000d2d0 <_ZL9finishedD>
    80005c44:	fc0786e3          	beqz	a5,80005c10 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80005c48:	02813083          	ld	ra,40(sp)
    80005c4c:	02013403          	ld	s0,32(sp)
    80005c50:	03010113          	addi	sp,sp,48
    80005c54:	00008067          	ret

0000000080005c58 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80005c58:	fd010113          	addi	sp,sp,-48
    80005c5c:	02113423          	sd	ra,40(sp)
    80005c60:	02813023          	sd	s0,32(sp)
    80005c64:	00913c23          	sd	s1,24(sp)
    80005c68:	01213823          	sd	s2,16(sp)
    80005c6c:	01313423          	sd	s3,8(sp)
    80005c70:	03010413          	addi	s0,sp,48
    80005c74:	00050993          	mv	s3,a0
    80005c78:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005c7c:	00000913          	li	s2,0
    80005c80:	00c0006f          	j	80005c8c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005c84:	ffffe097          	auipc	ra,0xffffe
    80005c88:	804080e7          	jalr	-2044(ra) # 80003488 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005c8c:	ffffc097          	auipc	ra,0xffffc
    80005c90:	974080e7          	jalr	-1676(ra) # 80001600 <_Z4getcv>
    80005c94:	0005059b          	sext.w	a1,a0
    80005c98:	01b00793          	li	a5,27
    80005c9c:	02f58a63          	beq	a1,a5,80005cd0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005ca0:	0084b503          	ld	a0,8(s1)
    80005ca4:	00001097          	auipc	ra,0x1
    80005ca8:	c64080e7          	jalr	-924(ra) # 80006908 <_ZN9BufferCPP3putEi>
        i++;
    80005cac:	0019071b          	addiw	a4,s2,1
    80005cb0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005cb4:	0004a683          	lw	a3,0(s1)
    80005cb8:	0026979b          	slliw	a5,a3,0x2
    80005cbc:	00d787bb          	addw	a5,a5,a3
    80005cc0:	0017979b          	slliw	a5,a5,0x1
    80005cc4:	02f767bb          	remw	a5,a4,a5
    80005cc8:	fc0792e3          	bnez	a5,80005c8c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80005ccc:	fb9ff06f          	j	80005c84 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005cd0:	00100793          	li	a5,1
    80005cd4:	00007717          	auipc	a4,0x7
    80005cd8:	60f72223          	sw	a5,1540(a4) # 8000d2d8 <_ZL9threadEnd>
    td->buffer->put('!');
    80005cdc:	0209b783          	ld	a5,32(s3)
    80005ce0:	02100593          	li	a1,33
    80005ce4:	0087b503          	ld	a0,8(a5)
    80005ce8:	00001097          	auipc	ra,0x1
    80005cec:	c20080e7          	jalr	-992(ra) # 80006908 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005cf0:	0104b503          	ld	a0,16(s1)
    80005cf4:	ffffe097          	auipc	ra,0xffffe
    80005cf8:	930080e7          	jalr	-1744(ra) # 80003624 <_ZN9Semaphore6signalEv>
}
    80005cfc:	02813083          	ld	ra,40(sp)
    80005d00:	02013403          	ld	s0,32(sp)
    80005d04:	01813483          	ld	s1,24(sp)
    80005d08:	01013903          	ld	s2,16(sp)
    80005d0c:	00813983          	ld	s3,8(sp)
    80005d10:	03010113          	addi	sp,sp,48
    80005d14:	00008067          	ret

0000000080005d18 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80005d18:	fe010113          	addi	sp,sp,-32
    80005d1c:	00113c23          	sd	ra,24(sp)
    80005d20:	00813823          	sd	s0,16(sp)
    80005d24:	00913423          	sd	s1,8(sp)
    80005d28:	01213023          	sd	s2,0(sp)
    80005d2c:	02010413          	addi	s0,sp,32
    80005d30:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005d34:	00000913          	li	s2,0
    80005d38:	00c0006f          	j	80005d44 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005d3c:	ffffd097          	auipc	ra,0xffffd
    80005d40:	74c080e7          	jalr	1868(ra) # 80003488 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005d44:	00007797          	auipc	a5,0x7
    80005d48:	5947a783          	lw	a5,1428(a5) # 8000d2d8 <_ZL9threadEnd>
    80005d4c:	02079e63          	bnez	a5,80005d88 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005d50:	0004a583          	lw	a1,0(s1)
    80005d54:	0305859b          	addiw	a1,a1,48
    80005d58:	0084b503          	ld	a0,8(s1)
    80005d5c:	00001097          	auipc	ra,0x1
    80005d60:	bac080e7          	jalr	-1108(ra) # 80006908 <_ZN9BufferCPP3putEi>
        i++;
    80005d64:	0019071b          	addiw	a4,s2,1
    80005d68:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005d6c:	0004a683          	lw	a3,0(s1)
    80005d70:	0026979b          	slliw	a5,a3,0x2
    80005d74:	00d787bb          	addw	a5,a5,a3
    80005d78:	0017979b          	slliw	a5,a5,0x1
    80005d7c:	02f767bb          	remw	a5,a4,a5
    80005d80:	fc0792e3          	bnez	a5,80005d44 <_ZN12ProducerSync8producerEPv+0x2c>
    80005d84:	fb9ff06f          	j	80005d3c <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005d88:	0104b503          	ld	a0,16(s1)
    80005d8c:	ffffe097          	auipc	ra,0xffffe
    80005d90:	898080e7          	jalr	-1896(ra) # 80003624 <_ZN9Semaphore6signalEv>
}
    80005d94:	01813083          	ld	ra,24(sp)
    80005d98:	01013403          	ld	s0,16(sp)
    80005d9c:	00813483          	ld	s1,8(sp)
    80005da0:	00013903          	ld	s2,0(sp)
    80005da4:	02010113          	addi	sp,sp,32
    80005da8:	00008067          	ret

0000000080005dac <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005dac:	fd010113          	addi	sp,sp,-48
    80005db0:	02113423          	sd	ra,40(sp)
    80005db4:	02813023          	sd	s0,32(sp)
    80005db8:	00913c23          	sd	s1,24(sp)
    80005dbc:	01213823          	sd	s2,16(sp)
    80005dc0:	01313423          	sd	s3,8(sp)
    80005dc4:	01413023          	sd	s4,0(sp)
    80005dc8:	03010413          	addi	s0,sp,48
    80005dcc:	00050993          	mv	s3,a0
    80005dd0:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005dd4:	00000a13          	li	s4,0
    80005dd8:	01c0006f          	j	80005df4 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005ddc:	ffffd097          	auipc	ra,0xffffd
    80005de0:	6ac080e7          	jalr	1708(ra) # 80003488 <_ZN6Thread8dispatchEv>
    80005de4:	0500006f          	j	80005e34 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005de8:	00a00513          	li	a0,10
    80005dec:	ffffc097          	auipc	ra,0xffffc
    80005df0:	83c080e7          	jalr	-1988(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    80005df4:	00007797          	auipc	a5,0x7
    80005df8:	4e47a783          	lw	a5,1252(a5) # 8000d2d8 <_ZL9threadEnd>
    80005dfc:	06079263          	bnez	a5,80005e60 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005e00:	00893503          	ld	a0,8(s2)
    80005e04:	00001097          	auipc	ra,0x1
    80005e08:	b94080e7          	jalr	-1132(ra) # 80006998 <_ZN9BufferCPP3getEv>
        i++;
    80005e0c:	001a049b          	addiw	s1,s4,1
    80005e10:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005e14:	0ff57513          	andi	a0,a0,255
    80005e18:	ffffc097          	auipc	ra,0xffffc
    80005e1c:	810080e7          	jalr	-2032(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005e20:	00092703          	lw	a4,0(s2)
    80005e24:	0027179b          	slliw	a5,a4,0x2
    80005e28:	00e787bb          	addw	a5,a5,a4
    80005e2c:	02f4e7bb          	remw	a5,s1,a5
    80005e30:	fa0786e3          	beqz	a5,80005ddc <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005e34:	05000793          	li	a5,80
    80005e38:	02f4e4bb          	remw	s1,s1,a5
    80005e3c:	fa049ce3          	bnez	s1,80005df4 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005e40:	fa9ff06f          	j	80005de8 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005e44:	0209b783          	ld	a5,32(s3)
    80005e48:	0087b503          	ld	a0,8(a5)
    80005e4c:	00001097          	auipc	ra,0x1
    80005e50:	b4c080e7          	jalr	-1204(ra) # 80006998 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005e54:	0ff57513          	andi	a0,a0,255
    80005e58:	ffffe097          	auipc	ra,0xffffe
    80005e5c:	8a0080e7          	jalr	-1888(ra) # 800036f8 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005e60:	0209b783          	ld	a5,32(s3)
    80005e64:	0087b503          	ld	a0,8(a5)
    80005e68:	00001097          	auipc	ra,0x1
    80005e6c:	bbc080e7          	jalr	-1092(ra) # 80006a24 <_ZN9BufferCPP6getCntEv>
    80005e70:	fca04ae3          	bgtz	a0,80005e44 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005e74:	01093503          	ld	a0,16(s2)
    80005e78:	ffffd097          	auipc	ra,0xffffd
    80005e7c:	7ac080e7          	jalr	1964(ra) # 80003624 <_ZN9Semaphore6signalEv>
}
    80005e80:	02813083          	ld	ra,40(sp)
    80005e84:	02013403          	ld	s0,32(sp)
    80005e88:	01813483          	ld	s1,24(sp)
    80005e8c:	01013903          	ld	s2,16(sp)
    80005e90:	00813983          	ld	s3,8(sp)
    80005e94:	00013a03          	ld	s4,0(sp)
    80005e98:	03010113          	addi	sp,sp,48
    80005e9c:	00008067          	ret

0000000080005ea0 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005ea0:	f8010113          	addi	sp,sp,-128
    80005ea4:	06113c23          	sd	ra,120(sp)
    80005ea8:	06813823          	sd	s0,112(sp)
    80005eac:	06913423          	sd	s1,104(sp)
    80005eb0:	07213023          	sd	s2,96(sp)
    80005eb4:	05313c23          	sd	s3,88(sp)
    80005eb8:	05413823          	sd	s4,80(sp)
    80005ebc:	05513423          	sd	s5,72(sp)
    80005ec0:	05613023          	sd	s6,64(sp)
    80005ec4:	03713c23          	sd	s7,56(sp)
    80005ec8:	03813823          	sd	s8,48(sp)
    80005ecc:	03913423          	sd	s9,40(sp)
    80005ed0:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005ed4:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005ed8:	00004517          	auipc	a0,0x4
    80005edc:	47850513          	addi	a0,a0,1144 # 8000a350 <CONSOLE_STATUS+0x340>
    80005ee0:	00000097          	auipc	ra,0x0
    80005ee4:	604080e7          	jalr	1540(ra) # 800064e4 <_Z11printStringPKc>
    getString(input, 30);
    80005ee8:	01e00593          	li	a1,30
    80005eec:	f8040493          	addi	s1,s0,-128
    80005ef0:	00048513          	mv	a0,s1
    80005ef4:	00000097          	auipc	ra,0x0
    80005ef8:	678080e7          	jalr	1656(ra) # 8000656c <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005efc:	00048513          	mv	a0,s1
    80005f00:	00000097          	auipc	ra,0x0
    80005f04:	744080e7          	jalr	1860(ra) # 80006644 <_Z11stringToIntPKc>
    80005f08:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005f0c:	00004517          	auipc	a0,0x4
    80005f10:	46450513          	addi	a0,a0,1124 # 8000a370 <CONSOLE_STATUS+0x360>
    80005f14:	00000097          	auipc	ra,0x0
    80005f18:	5d0080e7          	jalr	1488(ra) # 800064e4 <_Z11printStringPKc>
    getString(input, 30);
    80005f1c:	01e00593          	li	a1,30
    80005f20:	00048513          	mv	a0,s1
    80005f24:	00000097          	auipc	ra,0x0
    80005f28:	648080e7          	jalr	1608(ra) # 8000656c <_Z9getStringPci>
    n = stringToInt(input);
    80005f2c:	00048513          	mv	a0,s1
    80005f30:	00000097          	auipc	ra,0x0
    80005f34:	714080e7          	jalr	1812(ra) # 80006644 <_Z11stringToIntPKc>
    80005f38:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005f3c:	00004517          	auipc	a0,0x4
    80005f40:	45450513          	addi	a0,a0,1108 # 8000a390 <CONSOLE_STATUS+0x380>
    80005f44:	00000097          	auipc	ra,0x0
    80005f48:	5a0080e7          	jalr	1440(ra) # 800064e4 <_Z11printStringPKc>
    80005f4c:	00000613          	li	a2,0
    80005f50:	00a00593          	li	a1,10
    80005f54:	00090513          	mv	a0,s2
    80005f58:	00000097          	auipc	ra,0x0
    80005f5c:	73c080e7          	jalr	1852(ra) # 80006694 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005f60:	00004517          	auipc	a0,0x4
    80005f64:	44850513          	addi	a0,a0,1096 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80005f68:	00000097          	auipc	ra,0x0
    80005f6c:	57c080e7          	jalr	1404(ra) # 800064e4 <_Z11printStringPKc>
    80005f70:	00000613          	li	a2,0
    80005f74:	00a00593          	li	a1,10
    80005f78:	00048513          	mv	a0,s1
    80005f7c:	00000097          	auipc	ra,0x0
    80005f80:	718080e7          	jalr	1816(ra) # 80006694 <_Z8printIntiii>
    printString(".\n");
    80005f84:	00004517          	auipc	a0,0x4
    80005f88:	43c50513          	addi	a0,a0,1084 # 8000a3c0 <CONSOLE_STATUS+0x3b0>
    80005f8c:	00000097          	auipc	ra,0x0
    80005f90:	558080e7          	jalr	1368(ra) # 800064e4 <_Z11printStringPKc>
    if(threadNum > n) {
    80005f94:	0324c463          	blt	s1,s2,80005fbc <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005f98:	03205c63          	blez	s2,80005fd0 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005f9c:	03800513          	li	a0,56
    80005fa0:	ffffd097          	auipc	ra,0xffffd
    80005fa4:	2b4080e7          	jalr	692(ra) # 80003254 <_Znwm>
    80005fa8:	00050a93          	mv	s5,a0
    80005fac:	00048593          	mv	a1,s1
    80005fb0:	00001097          	auipc	ra,0x1
    80005fb4:	804080e7          	jalr	-2044(ra) # 800067b4 <_ZN9BufferCPPC1Ei>
    80005fb8:	0300006f          	j	80005fe8 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005fbc:	00004517          	auipc	a0,0x4
    80005fc0:	40c50513          	addi	a0,a0,1036 # 8000a3c8 <CONSOLE_STATUS+0x3b8>
    80005fc4:	00000097          	auipc	ra,0x0
    80005fc8:	520080e7          	jalr	1312(ra) # 800064e4 <_Z11printStringPKc>
        return;
    80005fcc:	0140006f          	j	80005fe0 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005fd0:	00004517          	auipc	a0,0x4
    80005fd4:	43850513          	addi	a0,a0,1080 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80005fd8:	00000097          	auipc	ra,0x0
    80005fdc:	50c080e7          	jalr	1292(ra) # 800064e4 <_Z11printStringPKc>
        return;
    80005fe0:	000b8113          	mv	sp,s7
    80005fe4:	2380006f          	j	8000621c <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005fe8:	01000513          	li	a0,16
    80005fec:	ffffd097          	auipc	ra,0xffffd
    80005ff0:	268080e7          	jalr	616(ra) # 80003254 <_Znwm>
    80005ff4:	00050493          	mv	s1,a0
    80005ff8:	00000593          	li	a1,0
    80005ffc:	ffffd097          	auipc	ra,0xffffd
    80006000:	5c4080e7          	jalr	1476(ra) # 800035c0 <_ZN9SemaphoreC1Ej>
    80006004:	00007797          	auipc	a5,0x7
    80006008:	2c97be23          	sd	s1,732(a5) # 8000d2e0 <_ZL10waitForAll>
    Thread* threads[threadNum];
    8000600c:	00391793          	slli	a5,s2,0x3
    80006010:	00f78793          	addi	a5,a5,15
    80006014:	ff07f793          	andi	a5,a5,-16
    80006018:	40f10133          	sub	sp,sp,a5
    8000601c:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80006020:	0019071b          	addiw	a4,s2,1
    80006024:	00171793          	slli	a5,a4,0x1
    80006028:	00e787b3          	add	a5,a5,a4
    8000602c:	00379793          	slli	a5,a5,0x3
    80006030:	00f78793          	addi	a5,a5,15
    80006034:	ff07f793          	andi	a5,a5,-16
    80006038:	40f10133          	sub	sp,sp,a5
    8000603c:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80006040:	00191c13          	slli	s8,s2,0x1
    80006044:	012c07b3          	add	a5,s8,s2
    80006048:	00379793          	slli	a5,a5,0x3
    8000604c:	00fa07b3          	add	a5,s4,a5
    80006050:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80006054:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80006058:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    8000605c:	02800513          	li	a0,40
    80006060:	ffffd097          	auipc	ra,0xffffd
    80006064:	1f4080e7          	jalr	500(ra) # 80003254 <_Znwm>
    80006068:	00050b13          	mv	s6,a0
    8000606c:	012c0c33          	add	s8,s8,s2
    80006070:	003c1c13          	slli	s8,s8,0x3
    80006074:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80006078:	ffffd097          	auipc	ra,0xffffd
    8000607c:	4cc080e7          	jalr	1228(ra) # 80003544 <_ZN6ThreadC1Ev>
    80006080:	00007797          	auipc	a5,0x7
    80006084:	fd878793          	addi	a5,a5,-40 # 8000d058 <_ZTV12ConsumerSync+0x10>
    80006088:	00fb3023          	sd	a5,0(s6)
    8000608c:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80006090:	000b0513          	mv	a0,s6
    80006094:	ffffd097          	auipc	ra,0xffffd
    80006098:	378080e7          	jalr	888(ra) # 8000340c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000609c:	00000493          	li	s1,0
    800060a0:	0380006f          	j	800060d8 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800060a4:	00007797          	auipc	a5,0x7
    800060a8:	f8c78793          	addi	a5,a5,-116 # 8000d030 <_ZTV12ProducerSync+0x10>
    800060ac:	00fcb023          	sd	a5,0(s9)
    800060b0:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    800060b4:	00349793          	slli	a5,s1,0x3
    800060b8:	00f987b3          	add	a5,s3,a5
    800060bc:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800060c0:	00349793          	slli	a5,s1,0x3
    800060c4:	00f987b3          	add	a5,s3,a5
    800060c8:	0007b503          	ld	a0,0(a5)
    800060cc:	ffffd097          	auipc	ra,0xffffd
    800060d0:	340080e7          	jalr	832(ra) # 8000340c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800060d4:	0014849b          	addiw	s1,s1,1
    800060d8:	0b24d063          	bge	s1,s2,80006178 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800060dc:	00149793          	slli	a5,s1,0x1
    800060e0:	009787b3          	add	a5,a5,s1
    800060e4:	00379793          	slli	a5,a5,0x3
    800060e8:	00fa07b3          	add	a5,s4,a5
    800060ec:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800060f0:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800060f4:	00007717          	auipc	a4,0x7
    800060f8:	1ec73703          	ld	a4,492(a4) # 8000d2e0 <_ZL10waitForAll>
    800060fc:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80006100:	02905863          	blez	s1,80006130 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80006104:	02800513          	li	a0,40
    80006108:	ffffd097          	auipc	ra,0xffffd
    8000610c:	14c080e7          	jalr	332(ra) # 80003254 <_Znwm>
    80006110:	00050c93          	mv	s9,a0
    80006114:	00149c13          	slli	s8,s1,0x1
    80006118:	009c0c33          	add	s8,s8,s1
    8000611c:	003c1c13          	slli	s8,s8,0x3
    80006120:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80006124:	ffffd097          	auipc	ra,0xffffd
    80006128:	420080e7          	jalr	1056(ra) # 80003544 <_ZN6ThreadC1Ev>
    8000612c:	f79ff06f          	j	800060a4 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80006130:	02800513          	li	a0,40
    80006134:	ffffd097          	auipc	ra,0xffffd
    80006138:	120080e7          	jalr	288(ra) # 80003254 <_Znwm>
    8000613c:	00050c93          	mv	s9,a0
    80006140:	00149c13          	slli	s8,s1,0x1
    80006144:	009c0c33          	add	s8,s8,s1
    80006148:	003c1c13          	slli	s8,s8,0x3
    8000614c:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80006150:	ffffd097          	auipc	ra,0xffffd
    80006154:	3f4080e7          	jalr	1012(ra) # 80003544 <_ZN6ThreadC1Ev>
    80006158:	00007797          	auipc	a5,0x7
    8000615c:	eb078793          	addi	a5,a5,-336 # 8000d008 <_ZTV16ProducerKeyboard+0x10>
    80006160:	00fcb023          	sd	a5,0(s9)
    80006164:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80006168:	00349793          	slli	a5,s1,0x3
    8000616c:	00f987b3          	add	a5,s3,a5
    80006170:	0197b023          	sd	s9,0(a5)
    80006174:	f4dff06f          	j	800060c0 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80006178:	ffffd097          	auipc	ra,0xffffd
    8000617c:	310080e7          	jalr	784(ra) # 80003488 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80006180:	00000493          	li	s1,0
    80006184:	00994e63          	blt	s2,s1,800061a0 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80006188:	00007517          	auipc	a0,0x7
    8000618c:	15853503          	ld	a0,344(a0) # 8000d2e0 <_ZL10waitForAll>
    80006190:	ffffd097          	auipc	ra,0xffffd
    80006194:	468080e7          	jalr	1128(ra) # 800035f8 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80006198:	0014849b          	addiw	s1,s1,1
    8000619c:	fe9ff06f          	j	80006184 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    800061a0:	00000493          	li	s1,0
    800061a4:	0080006f          	j	800061ac <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    800061a8:	0014849b          	addiw	s1,s1,1
    800061ac:	0324d263          	bge	s1,s2,800061d0 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    800061b0:	00349793          	slli	a5,s1,0x3
    800061b4:	00f987b3          	add	a5,s3,a5
    800061b8:	0007b503          	ld	a0,0(a5)
    800061bc:	fe0506e3          	beqz	a0,800061a8 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800061c0:	00053783          	ld	a5,0(a0)
    800061c4:	0087b783          	ld	a5,8(a5)
    800061c8:	000780e7          	jalr	a5
    800061cc:	fddff06f          	j	800061a8 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800061d0:	000b0a63          	beqz	s6,800061e4 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800061d4:	000b3783          	ld	a5,0(s6)
    800061d8:	0087b783          	ld	a5,8(a5)
    800061dc:	000b0513          	mv	a0,s6
    800061e0:	000780e7          	jalr	a5
    delete waitForAll;
    800061e4:	00007517          	auipc	a0,0x7
    800061e8:	0fc53503          	ld	a0,252(a0) # 8000d2e0 <_ZL10waitForAll>
    800061ec:	00050863          	beqz	a0,800061fc <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800061f0:	00053783          	ld	a5,0(a0)
    800061f4:	0087b783          	ld	a5,8(a5)
    800061f8:	000780e7          	jalr	a5
    delete buffer;
    800061fc:	000a8e63          	beqz	s5,80006218 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80006200:	000a8513          	mv	a0,s5
    80006204:	00001097          	auipc	ra,0x1
    80006208:	8a8080e7          	jalr	-1880(ra) # 80006aac <_ZN9BufferCPPD1Ev>
    8000620c:	000a8513          	mv	a0,s5
    80006210:	ffffd097          	auipc	ra,0xffffd
    80006214:	094080e7          	jalr	148(ra) # 800032a4 <_ZdlPv>
    80006218:	000b8113          	mv	sp,s7

}
    8000621c:	f8040113          	addi	sp,s0,-128
    80006220:	07813083          	ld	ra,120(sp)
    80006224:	07013403          	ld	s0,112(sp)
    80006228:	06813483          	ld	s1,104(sp)
    8000622c:	06013903          	ld	s2,96(sp)
    80006230:	05813983          	ld	s3,88(sp)
    80006234:	05013a03          	ld	s4,80(sp)
    80006238:	04813a83          	ld	s5,72(sp)
    8000623c:	04013b03          	ld	s6,64(sp)
    80006240:	03813b83          	ld	s7,56(sp)
    80006244:	03013c03          	ld	s8,48(sp)
    80006248:	02813c83          	ld	s9,40(sp)
    8000624c:	08010113          	addi	sp,sp,128
    80006250:	00008067          	ret
    80006254:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80006258:	000a8513          	mv	a0,s5
    8000625c:	ffffd097          	auipc	ra,0xffffd
    80006260:	048080e7          	jalr	72(ra) # 800032a4 <_ZdlPv>
    80006264:	00048513          	mv	a0,s1
    80006268:	00008097          	auipc	ra,0x8
    8000626c:	170080e7          	jalr	368(ra) # 8000e3d8 <_Unwind_Resume>
    80006270:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80006274:	00048513          	mv	a0,s1
    80006278:	ffffd097          	auipc	ra,0xffffd
    8000627c:	02c080e7          	jalr	44(ra) # 800032a4 <_ZdlPv>
    80006280:	00090513          	mv	a0,s2
    80006284:	00008097          	auipc	ra,0x8
    80006288:	154080e7          	jalr	340(ra) # 8000e3d8 <_Unwind_Resume>
    8000628c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80006290:	000b0513          	mv	a0,s6
    80006294:	ffffd097          	auipc	ra,0xffffd
    80006298:	010080e7          	jalr	16(ra) # 800032a4 <_ZdlPv>
    8000629c:	00048513          	mv	a0,s1
    800062a0:	00008097          	auipc	ra,0x8
    800062a4:	138080e7          	jalr	312(ra) # 8000e3d8 <_Unwind_Resume>
    800062a8:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    800062ac:	000c8513          	mv	a0,s9
    800062b0:	ffffd097          	auipc	ra,0xffffd
    800062b4:	ff4080e7          	jalr	-12(ra) # 800032a4 <_ZdlPv>
    800062b8:	00048513          	mv	a0,s1
    800062bc:	00008097          	auipc	ra,0x8
    800062c0:	11c080e7          	jalr	284(ra) # 8000e3d8 <_Unwind_Resume>
    800062c4:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800062c8:	000c8513          	mv	a0,s9
    800062cc:	ffffd097          	auipc	ra,0xffffd
    800062d0:	fd8080e7          	jalr	-40(ra) # 800032a4 <_ZdlPv>
    800062d4:	00048513          	mv	a0,s1
    800062d8:	00008097          	auipc	ra,0x8
    800062dc:	100080e7          	jalr	256(ra) # 8000e3d8 <_Unwind_Resume>

00000000800062e0 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800062e0:	ff010113          	addi	sp,sp,-16
    800062e4:	00113423          	sd	ra,8(sp)
    800062e8:	00813023          	sd	s0,0(sp)
    800062ec:	01010413          	addi	s0,sp,16
    800062f0:	00007797          	auipc	a5,0x7
    800062f4:	d6878793          	addi	a5,a5,-664 # 8000d058 <_ZTV12ConsumerSync+0x10>
    800062f8:	00f53023          	sd	a5,0(a0)
    800062fc:	ffffd097          	auipc	ra,0xffffd
    80006300:	ea4080e7          	jalr	-348(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80006304:	00813083          	ld	ra,8(sp)
    80006308:	00013403          	ld	s0,0(sp)
    8000630c:	01010113          	addi	sp,sp,16
    80006310:	00008067          	ret

0000000080006314 <_ZN12ConsumerSyncD0Ev>:
    80006314:	fe010113          	addi	sp,sp,-32
    80006318:	00113c23          	sd	ra,24(sp)
    8000631c:	00813823          	sd	s0,16(sp)
    80006320:	00913423          	sd	s1,8(sp)
    80006324:	02010413          	addi	s0,sp,32
    80006328:	00050493          	mv	s1,a0
    8000632c:	00007797          	auipc	a5,0x7
    80006330:	d2c78793          	addi	a5,a5,-724 # 8000d058 <_ZTV12ConsumerSync+0x10>
    80006334:	00f53023          	sd	a5,0(a0)
    80006338:	ffffd097          	auipc	ra,0xffffd
    8000633c:	e68080e7          	jalr	-408(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80006340:	00048513          	mv	a0,s1
    80006344:	ffffd097          	auipc	ra,0xffffd
    80006348:	f60080e7          	jalr	-160(ra) # 800032a4 <_ZdlPv>
    8000634c:	01813083          	ld	ra,24(sp)
    80006350:	01013403          	ld	s0,16(sp)
    80006354:	00813483          	ld	s1,8(sp)
    80006358:	02010113          	addi	sp,sp,32
    8000635c:	00008067          	ret

0000000080006360 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80006360:	ff010113          	addi	sp,sp,-16
    80006364:	00113423          	sd	ra,8(sp)
    80006368:	00813023          	sd	s0,0(sp)
    8000636c:	01010413          	addi	s0,sp,16
    80006370:	00007797          	auipc	a5,0x7
    80006374:	cc078793          	addi	a5,a5,-832 # 8000d030 <_ZTV12ProducerSync+0x10>
    80006378:	00f53023          	sd	a5,0(a0)
    8000637c:	ffffd097          	auipc	ra,0xffffd
    80006380:	e24080e7          	jalr	-476(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80006384:	00813083          	ld	ra,8(sp)
    80006388:	00013403          	ld	s0,0(sp)
    8000638c:	01010113          	addi	sp,sp,16
    80006390:	00008067          	ret

0000000080006394 <_ZN12ProducerSyncD0Ev>:
    80006394:	fe010113          	addi	sp,sp,-32
    80006398:	00113c23          	sd	ra,24(sp)
    8000639c:	00813823          	sd	s0,16(sp)
    800063a0:	00913423          	sd	s1,8(sp)
    800063a4:	02010413          	addi	s0,sp,32
    800063a8:	00050493          	mv	s1,a0
    800063ac:	00007797          	auipc	a5,0x7
    800063b0:	c8478793          	addi	a5,a5,-892 # 8000d030 <_ZTV12ProducerSync+0x10>
    800063b4:	00f53023          	sd	a5,0(a0)
    800063b8:	ffffd097          	auipc	ra,0xffffd
    800063bc:	de8080e7          	jalr	-536(ra) # 800031a0 <_ZN6ThreadD1Ev>
    800063c0:	00048513          	mv	a0,s1
    800063c4:	ffffd097          	auipc	ra,0xffffd
    800063c8:	ee0080e7          	jalr	-288(ra) # 800032a4 <_ZdlPv>
    800063cc:	01813083          	ld	ra,24(sp)
    800063d0:	01013403          	ld	s0,16(sp)
    800063d4:	00813483          	ld	s1,8(sp)
    800063d8:	02010113          	addi	sp,sp,32
    800063dc:	00008067          	ret

00000000800063e0 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800063e0:	ff010113          	addi	sp,sp,-16
    800063e4:	00113423          	sd	ra,8(sp)
    800063e8:	00813023          	sd	s0,0(sp)
    800063ec:	01010413          	addi	s0,sp,16
    800063f0:	00007797          	auipc	a5,0x7
    800063f4:	c1878793          	addi	a5,a5,-1000 # 8000d008 <_ZTV16ProducerKeyboard+0x10>
    800063f8:	00f53023          	sd	a5,0(a0)
    800063fc:	ffffd097          	auipc	ra,0xffffd
    80006400:	da4080e7          	jalr	-604(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80006404:	00813083          	ld	ra,8(sp)
    80006408:	00013403          	ld	s0,0(sp)
    8000640c:	01010113          	addi	sp,sp,16
    80006410:	00008067          	ret

0000000080006414 <_ZN16ProducerKeyboardD0Ev>:
    80006414:	fe010113          	addi	sp,sp,-32
    80006418:	00113c23          	sd	ra,24(sp)
    8000641c:	00813823          	sd	s0,16(sp)
    80006420:	00913423          	sd	s1,8(sp)
    80006424:	02010413          	addi	s0,sp,32
    80006428:	00050493          	mv	s1,a0
    8000642c:	00007797          	auipc	a5,0x7
    80006430:	bdc78793          	addi	a5,a5,-1060 # 8000d008 <_ZTV16ProducerKeyboard+0x10>
    80006434:	00f53023          	sd	a5,0(a0)
    80006438:	ffffd097          	auipc	ra,0xffffd
    8000643c:	d68080e7          	jalr	-664(ra) # 800031a0 <_ZN6ThreadD1Ev>
    80006440:	00048513          	mv	a0,s1
    80006444:	ffffd097          	auipc	ra,0xffffd
    80006448:	e60080e7          	jalr	-416(ra) # 800032a4 <_ZdlPv>
    8000644c:	01813083          	ld	ra,24(sp)
    80006450:	01013403          	ld	s0,16(sp)
    80006454:	00813483          	ld	s1,8(sp)
    80006458:	02010113          	addi	sp,sp,32
    8000645c:	00008067          	ret

0000000080006460 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80006460:	ff010113          	addi	sp,sp,-16
    80006464:	00113423          	sd	ra,8(sp)
    80006468:	00813023          	sd	s0,0(sp)
    8000646c:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80006470:	02053583          	ld	a1,32(a0)
    80006474:	fffff097          	auipc	ra,0xfffff
    80006478:	7e4080e7          	jalr	2020(ra) # 80005c58 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    8000647c:	00813083          	ld	ra,8(sp)
    80006480:	00013403          	ld	s0,0(sp)
    80006484:	01010113          	addi	sp,sp,16
    80006488:	00008067          	ret

000000008000648c <_ZN12ProducerSync3runEv>:
    void run() override {
    8000648c:	ff010113          	addi	sp,sp,-16
    80006490:	00113423          	sd	ra,8(sp)
    80006494:	00813023          	sd	s0,0(sp)
    80006498:	01010413          	addi	s0,sp,16
        producer(td);
    8000649c:	02053583          	ld	a1,32(a0)
    800064a0:	00000097          	auipc	ra,0x0
    800064a4:	878080e7          	jalr	-1928(ra) # 80005d18 <_ZN12ProducerSync8producerEPv>
    }
    800064a8:	00813083          	ld	ra,8(sp)
    800064ac:	00013403          	ld	s0,0(sp)
    800064b0:	01010113          	addi	sp,sp,16
    800064b4:	00008067          	ret

00000000800064b8 <_ZN12ConsumerSync3runEv>:
    void run() override {
    800064b8:	ff010113          	addi	sp,sp,-16
    800064bc:	00113423          	sd	ra,8(sp)
    800064c0:	00813023          	sd	s0,0(sp)
    800064c4:	01010413          	addi	s0,sp,16
        consumer(td);
    800064c8:	02053583          	ld	a1,32(a0)
    800064cc:	00000097          	auipc	ra,0x0
    800064d0:	8e0080e7          	jalr	-1824(ra) # 80005dac <_ZN12ConsumerSync8consumerEPv>
    }
    800064d4:	00813083          	ld	ra,8(sp)
    800064d8:	00013403          	ld	s0,0(sp)
    800064dc:	01010113          	addi	sp,sp,16
    800064e0:	00008067          	ret

00000000800064e4 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800064e4:	fe010113          	addi	sp,sp,-32
    800064e8:	00113c23          	sd	ra,24(sp)
    800064ec:	00813823          	sd	s0,16(sp)
    800064f0:	00913423          	sd	s1,8(sp)
    800064f4:	02010413          	addi	s0,sp,32
    800064f8:	00050493          	mv	s1,a0
    LOCK();
    800064fc:	00100613          	li	a2,1
    80006500:	00000593          	li	a1,0
    80006504:	00007517          	auipc	a0,0x7
    80006508:	de450513          	addi	a0,a0,-540 # 8000d2e8 <lockPrint>
    8000650c:	ffffb097          	auipc	ra,0xffffb
    80006510:	c18080e7          	jalr	-1000(ra) # 80001124 <copy_and_swap>
    80006514:	00050863          	beqz	a0,80006524 <_Z11printStringPKc+0x40>
    80006518:	ffffb097          	auipc	ra,0xffffb
    8000651c:	fa8080e7          	jalr	-88(ra) # 800014c0 <_Z15thread_dispatchv>
    80006520:	fddff06f          	j	800064fc <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80006524:	0004c503          	lbu	a0,0(s1)
    80006528:	00050a63          	beqz	a0,8000653c <_Z11printStringPKc+0x58>
    {
        putc(*string);
    8000652c:	ffffb097          	auipc	ra,0xffffb
    80006530:	0fc080e7          	jalr	252(ra) # 80001628 <_Z4putcc>
        string++;
    80006534:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80006538:	fedff06f          	j	80006524 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    8000653c:	00000613          	li	a2,0
    80006540:	00100593          	li	a1,1
    80006544:	00007517          	auipc	a0,0x7
    80006548:	da450513          	addi	a0,a0,-604 # 8000d2e8 <lockPrint>
    8000654c:	ffffb097          	auipc	ra,0xffffb
    80006550:	bd8080e7          	jalr	-1064(ra) # 80001124 <copy_and_swap>
    80006554:	fe0514e3          	bnez	a0,8000653c <_Z11printStringPKc+0x58>
}
    80006558:	01813083          	ld	ra,24(sp)
    8000655c:	01013403          	ld	s0,16(sp)
    80006560:	00813483          	ld	s1,8(sp)
    80006564:	02010113          	addi	sp,sp,32
    80006568:	00008067          	ret

000000008000656c <_Z9getStringPci>:

char* getString(char *buf, int max) {
    8000656c:	fd010113          	addi	sp,sp,-48
    80006570:	02113423          	sd	ra,40(sp)
    80006574:	02813023          	sd	s0,32(sp)
    80006578:	00913c23          	sd	s1,24(sp)
    8000657c:	01213823          	sd	s2,16(sp)
    80006580:	01313423          	sd	s3,8(sp)
    80006584:	01413023          	sd	s4,0(sp)
    80006588:	03010413          	addi	s0,sp,48
    8000658c:	00050993          	mv	s3,a0
    80006590:	00058a13          	mv	s4,a1
    LOCK();
    80006594:	00100613          	li	a2,1
    80006598:	00000593          	li	a1,0
    8000659c:	00007517          	auipc	a0,0x7
    800065a0:	d4c50513          	addi	a0,a0,-692 # 8000d2e8 <lockPrint>
    800065a4:	ffffb097          	auipc	ra,0xffffb
    800065a8:	b80080e7          	jalr	-1152(ra) # 80001124 <copy_and_swap>
    800065ac:	00050863          	beqz	a0,800065bc <_Z9getStringPci+0x50>
    800065b0:	ffffb097          	auipc	ra,0xffffb
    800065b4:	f10080e7          	jalr	-240(ra) # 800014c0 <_Z15thread_dispatchv>
    800065b8:	fddff06f          	j	80006594 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800065bc:	00000913          	li	s2,0
    800065c0:	00090493          	mv	s1,s2
    800065c4:	0019091b          	addiw	s2,s2,1
    800065c8:	03495a63          	bge	s2,s4,800065fc <_Z9getStringPci+0x90>
        cc = getc();
    800065cc:	ffffb097          	auipc	ra,0xffffb
    800065d0:	034080e7          	jalr	52(ra) # 80001600 <_Z4getcv>
        if(cc < 1)
    800065d4:	02050463          	beqz	a0,800065fc <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    800065d8:	009984b3          	add	s1,s3,s1
    800065dc:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800065e0:	00a00793          	li	a5,10
    800065e4:	00f50a63          	beq	a0,a5,800065f8 <_Z9getStringPci+0x8c>
    800065e8:	00d00793          	li	a5,13
    800065ec:	fcf51ae3          	bne	a0,a5,800065c0 <_Z9getStringPci+0x54>
        buf[i++] = c;
    800065f0:	00090493          	mv	s1,s2
    800065f4:	0080006f          	j	800065fc <_Z9getStringPci+0x90>
    800065f8:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800065fc:	009984b3          	add	s1,s3,s1
    80006600:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80006604:	00000613          	li	a2,0
    80006608:	00100593          	li	a1,1
    8000660c:	00007517          	auipc	a0,0x7
    80006610:	cdc50513          	addi	a0,a0,-804 # 8000d2e8 <lockPrint>
    80006614:	ffffb097          	auipc	ra,0xffffb
    80006618:	b10080e7          	jalr	-1264(ra) # 80001124 <copy_and_swap>
    8000661c:	fe0514e3          	bnez	a0,80006604 <_Z9getStringPci+0x98>
    return buf;
}
    80006620:	00098513          	mv	a0,s3
    80006624:	02813083          	ld	ra,40(sp)
    80006628:	02013403          	ld	s0,32(sp)
    8000662c:	01813483          	ld	s1,24(sp)
    80006630:	01013903          	ld	s2,16(sp)
    80006634:	00813983          	ld	s3,8(sp)
    80006638:	00013a03          	ld	s4,0(sp)
    8000663c:	03010113          	addi	sp,sp,48
    80006640:	00008067          	ret

0000000080006644 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80006644:	ff010113          	addi	sp,sp,-16
    80006648:	00813423          	sd	s0,8(sp)
    8000664c:	01010413          	addi	s0,sp,16
    80006650:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80006654:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80006658:	0006c603          	lbu	a2,0(a3)
    8000665c:	fd06071b          	addiw	a4,a2,-48
    80006660:	0ff77713          	andi	a4,a4,255
    80006664:	00900793          	li	a5,9
    80006668:	02e7e063          	bltu	a5,a4,80006688 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    8000666c:	0025179b          	slliw	a5,a0,0x2
    80006670:	00a787bb          	addw	a5,a5,a0
    80006674:	0017979b          	slliw	a5,a5,0x1
    80006678:	00168693          	addi	a3,a3,1
    8000667c:	00c787bb          	addw	a5,a5,a2
    80006680:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80006684:	fd5ff06f          	j	80006658 <_Z11stringToIntPKc+0x14>
    return n;
}
    80006688:	00813403          	ld	s0,8(sp)
    8000668c:	01010113          	addi	sp,sp,16
    80006690:	00008067          	ret

0000000080006694 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80006694:	fc010113          	addi	sp,sp,-64
    80006698:	02113c23          	sd	ra,56(sp)
    8000669c:	02813823          	sd	s0,48(sp)
    800066a0:	02913423          	sd	s1,40(sp)
    800066a4:	03213023          	sd	s2,32(sp)
    800066a8:	01313c23          	sd	s3,24(sp)
    800066ac:	04010413          	addi	s0,sp,64
    800066b0:	00050493          	mv	s1,a0
    800066b4:	00058913          	mv	s2,a1
    800066b8:	00060993          	mv	s3,a2
    LOCK();
    800066bc:	00100613          	li	a2,1
    800066c0:	00000593          	li	a1,0
    800066c4:	00007517          	auipc	a0,0x7
    800066c8:	c2450513          	addi	a0,a0,-988 # 8000d2e8 <lockPrint>
    800066cc:	ffffb097          	auipc	ra,0xffffb
    800066d0:	a58080e7          	jalr	-1448(ra) # 80001124 <copy_and_swap>
    800066d4:	00050863          	beqz	a0,800066e4 <_Z8printIntiii+0x50>
    800066d8:	ffffb097          	auipc	ra,0xffffb
    800066dc:	de8080e7          	jalr	-536(ra) # 800014c0 <_Z15thread_dispatchv>
    800066e0:	fddff06f          	j	800066bc <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800066e4:	00098463          	beqz	s3,800066ec <_Z8printIntiii+0x58>
    800066e8:	0804c463          	bltz	s1,80006770 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800066ec:	0004851b          	sext.w	a0,s1
    neg = 0;
    800066f0:	00000593          	li	a1,0
    }

    i = 0;
    800066f4:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800066f8:	0009079b          	sext.w	a5,s2
    800066fc:	0325773b          	remuw	a4,a0,s2
    80006700:	00048613          	mv	a2,s1
    80006704:	0014849b          	addiw	s1,s1,1
    80006708:	02071693          	slli	a3,a4,0x20
    8000670c:	0206d693          	srli	a3,a3,0x20
    80006710:	00007717          	auipc	a4,0x7
    80006714:	96070713          	addi	a4,a4,-1696 # 8000d070 <digits>
    80006718:	00d70733          	add	a4,a4,a3
    8000671c:	00074683          	lbu	a3,0(a4)
    80006720:	fd040713          	addi	a4,s0,-48
    80006724:	00c70733          	add	a4,a4,a2
    80006728:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    8000672c:	0005071b          	sext.w	a4,a0
    80006730:	0325553b          	divuw	a0,a0,s2
    80006734:	fcf772e3          	bgeu	a4,a5,800066f8 <_Z8printIntiii+0x64>
    if(neg)
    80006738:	00058c63          	beqz	a1,80006750 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    8000673c:	fd040793          	addi	a5,s0,-48
    80006740:	009784b3          	add	s1,a5,s1
    80006744:	02d00793          	li	a5,45
    80006748:	fef48823          	sb	a5,-16(s1)
    8000674c:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80006750:	fff4849b          	addiw	s1,s1,-1
    80006754:	0204c463          	bltz	s1,8000677c <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80006758:	fd040793          	addi	a5,s0,-48
    8000675c:	009787b3          	add	a5,a5,s1
    80006760:	ff07c503          	lbu	a0,-16(a5)
    80006764:	ffffb097          	auipc	ra,0xffffb
    80006768:	ec4080e7          	jalr	-316(ra) # 80001628 <_Z4putcc>
    8000676c:	fe5ff06f          	j	80006750 <_Z8printIntiii+0xbc>
        x = -xx;
    80006770:	4090053b          	negw	a0,s1
        neg = 1;
    80006774:	00100593          	li	a1,1
        x = -xx;
    80006778:	f7dff06f          	j	800066f4 <_Z8printIntiii+0x60>

    UNLOCK();
    8000677c:	00000613          	li	a2,0
    80006780:	00100593          	li	a1,1
    80006784:	00007517          	auipc	a0,0x7
    80006788:	b6450513          	addi	a0,a0,-1180 # 8000d2e8 <lockPrint>
    8000678c:	ffffb097          	auipc	ra,0xffffb
    80006790:	998080e7          	jalr	-1640(ra) # 80001124 <copy_and_swap>
    80006794:	fe0514e3          	bnez	a0,8000677c <_Z8printIntiii+0xe8>
    80006798:	03813083          	ld	ra,56(sp)
    8000679c:	03013403          	ld	s0,48(sp)
    800067a0:	02813483          	ld	s1,40(sp)
    800067a4:	02013903          	ld	s2,32(sp)
    800067a8:	01813983          	ld	s3,24(sp)
    800067ac:	04010113          	addi	sp,sp,64
    800067b0:	00008067          	ret

00000000800067b4 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800067b4:	fd010113          	addi	sp,sp,-48
    800067b8:	02113423          	sd	ra,40(sp)
    800067bc:	02813023          	sd	s0,32(sp)
    800067c0:	00913c23          	sd	s1,24(sp)
    800067c4:	01213823          	sd	s2,16(sp)
    800067c8:	01313423          	sd	s3,8(sp)
    800067cc:	03010413          	addi	s0,sp,48
    800067d0:	00050493          	mv	s1,a0
    800067d4:	00058913          	mv	s2,a1
    800067d8:	0015879b          	addiw	a5,a1,1
    800067dc:	0007851b          	sext.w	a0,a5
    800067e0:	00f4a023          	sw	a5,0(s1)
    800067e4:	0004a823          	sw	zero,16(s1)
    800067e8:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800067ec:	00251513          	slli	a0,a0,0x2
    800067f0:	ffffb097          	auipc	ra,0xffffb
    800067f4:	ba4080e7          	jalr	-1116(ra) # 80001394 <_Z9mem_allocm>
    800067f8:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800067fc:	01000513          	li	a0,16
    80006800:	ffffd097          	auipc	ra,0xffffd
    80006804:	a54080e7          	jalr	-1452(ra) # 80003254 <_Znwm>
    80006808:	00050993          	mv	s3,a0
    8000680c:	00000593          	li	a1,0
    80006810:	ffffd097          	auipc	ra,0xffffd
    80006814:	db0080e7          	jalr	-592(ra) # 800035c0 <_ZN9SemaphoreC1Ej>
    80006818:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    8000681c:	01000513          	li	a0,16
    80006820:	ffffd097          	auipc	ra,0xffffd
    80006824:	a34080e7          	jalr	-1484(ra) # 80003254 <_Znwm>
    80006828:	00050993          	mv	s3,a0
    8000682c:	00090593          	mv	a1,s2
    80006830:	ffffd097          	auipc	ra,0xffffd
    80006834:	d90080e7          	jalr	-624(ra) # 800035c0 <_ZN9SemaphoreC1Ej>
    80006838:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    8000683c:	01000513          	li	a0,16
    80006840:	ffffd097          	auipc	ra,0xffffd
    80006844:	a14080e7          	jalr	-1516(ra) # 80003254 <_Znwm>
    80006848:	00050913          	mv	s2,a0
    8000684c:	00100593          	li	a1,1
    80006850:	ffffd097          	auipc	ra,0xffffd
    80006854:	d70080e7          	jalr	-656(ra) # 800035c0 <_ZN9SemaphoreC1Ej>
    80006858:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    8000685c:	01000513          	li	a0,16
    80006860:	ffffd097          	auipc	ra,0xffffd
    80006864:	9f4080e7          	jalr	-1548(ra) # 80003254 <_Znwm>
    80006868:	00050913          	mv	s2,a0
    8000686c:	00100593          	li	a1,1
    80006870:	ffffd097          	auipc	ra,0xffffd
    80006874:	d50080e7          	jalr	-688(ra) # 800035c0 <_ZN9SemaphoreC1Ej>
    80006878:	0324b823          	sd	s2,48(s1)
}
    8000687c:	02813083          	ld	ra,40(sp)
    80006880:	02013403          	ld	s0,32(sp)
    80006884:	01813483          	ld	s1,24(sp)
    80006888:	01013903          	ld	s2,16(sp)
    8000688c:	00813983          	ld	s3,8(sp)
    80006890:	03010113          	addi	sp,sp,48
    80006894:	00008067          	ret
    80006898:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    8000689c:	00098513          	mv	a0,s3
    800068a0:	ffffd097          	auipc	ra,0xffffd
    800068a4:	a04080e7          	jalr	-1532(ra) # 800032a4 <_ZdlPv>
    800068a8:	00048513          	mv	a0,s1
    800068ac:	00008097          	auipc	ra,0x8
    800068b0:	b2c080e7          	jalr	-1236(ra) # 8000e3d8 <_Unwind_Resume>
    800068b4:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800068b8:	00098513          	mv	a0,s3
    800068bc:	ffffd097          	auipc	ra,0xffffd
    800068c0:	9e8080e7          	jalr	-1560(ra) # 800032a4 <_ZdlPv>
    800068c4:	00048513          	mv	a0,s1
    800068c8:	00008097          	auipc	ra,0x8
    800068cc:	b10080e7          	jalr	-1264(ra) # 8000e3d8 <_Unwind_Resume>
    800068d0:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800068d4:	00090513          	mv	a0,s2
    800068d8:	ffffd097          	auipc	ra,0xffffd
    800068dc:	9cc080e7          	jalr	-1588(ra) # 800032a4 <_ZdlPv>
    800068e0:	00048513          	mv	a0,s1
    800068e4:	00008097          	auipc	ra,0x8
    800068e8:	af4080e7          	jalr	-1292(ra) # 8000e3d8 <_Unwind_Resume>
    800068ec:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800068f0:	00090513          	mv	a0,s2
    800068f4:	ffffd097          	auipc	ra,0xffffd
    800068f8:	9b0080e7          	jalr	-1616(ra) # 800032a4 <_ZdlPv>
    800068fc:	00048513          	mv	a0,s1
    80006900:	00008097          	auipc	ra,0x8
    80006904:	ad8080e7          	jalr	-1320(ra) # 8000e3d8 <_Unwind_Resume>

0000000080006908 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80006908:	fe010113          	addi	sp,sp,-32
    8000690c:	00113c23          	sd	ra,24(sp)
    80006910:	00813823          	sd	s0,16(sp)
    80006914:	00913423          	sd	s1,8(sp)
    80006918:	01213023          	sd	s2,0(sp)
    8000691c:	02010413          	addi	s0,sp,32
    80006920:	00050493          	mv	s1,a0
    80006924:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80006928:	01853503          	ld	a0,24(a0)
    8000692c:	ffffd097          	auipc	ra,0xffffd
    80006930:	ccc080e7          	jalr	-820(ra) # 800035f8 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80006934:	0304b503          	ld	a0,48(s1)
    80006938:	ffffd097          	auipc	ra,0xffffd
    8000693c:	cc0080e7          	jalr	-832(ra) # 800035f8 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80006940:	0084b783          	ld	a5,8(s1)
    80006944:	0144a703          	lw	a4,20(s1)
    80006948:	00271713          	slli	a4,a4,0x2
    8000694c:	00e787b3          	add	a5,a5,a4
    80006950:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006954:	0144a783          	lw	a5,20(s1)
    80006958:	0017879b          	addiw	a5,a5,1
    8000695c:	0004a703          	lw	a4,0(s1)
    80006960:	02e7e7bb          	remw	a5,a5,a4
    80006964:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006968:	0304b503          	ld	a0,48(s1)
    8000696c:	ffffd097          	auipc	ra,0xffffd
    80006970:	cb8080e7          	jalr	-840(ra) # 80003624 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006974:	0204b503          	ld	a0,32(s1)
    80006978:	ffffd097          	auipc	ra,0xffffd
    8000697c:	cac080e7          	jalr	-852(ra) # 80003624 <_ZN9Semaphore6signalEv>

}
    80006980:	01813083          	ld	ra,24(sp)
    80006984:	01013403          	ld	s0,16(sp)
    80006988:	00813483          	ld	s1,8(sp)
    8000698c:	00013903          	ld	s2,0(sp)
    80006990:	02010113          	addi	sp,sp,32
    80006994:	00008067          	ret

0000000080006998 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006998:	fe010113          	addi	sp,sp,-32
    8000699c:	00113c23          	sd	ra,24(sp)
    800069a0:	00813823          	sd	s0,16(sp)
    800069a4:	00913423          	sd	s1,8(sp)
    800069a8:	01213023          	sd	s2,0(sp)
    800069ac:	02010413          	addi	s0,sp,32
    800069b0:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800069b4:	02053503          	ld	a0,32(a0)
    800069b8:	ffffd097          	auipc	ra,0xffffd
    800069bc:	c40080e7          	jalr	-960(ra) # 800035f8 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    800069c0:	0284b503          	ld	a0,40(s1)
    800069c4:	ffffd097          	auipc	ra,0xffffd
    800069c8:	c34080e7          	jalr	-972(ra) # 800035f8 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    800069cc:	0084b703          	ld	a4,8(s1)
    800069d0:	0104a783          	lw	a5,16(s1)
    800069d4:	00279693          	slli	a3,a5,0x2
    800069d8:	00d70733          	add	a4,a4,a3
    800069dc:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800069e0:	0017879b          	addiw	a5,a5,1
    800069e4:	0004a703          	lw	a4,0(s1)
    800069e8:	02e7e7bb          	remw	a5,a5,a4
    800069ec:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800069f0:	0284b503          	ld	a0,40(s1)
    800069f4:	ffffd097          	auipc	ra,0xffffd
    800069f8:	c30080e7          	jalr	-976(ra) # 80003624 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800069fc:	0184b503          	ld	a0,24(s1)
    80006a00:	ffffd097          	auipc	ra,0xffffd
    80006a04:	c24080e7          	jalr	-988(ra) # 80003624 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006a08:	00090513          	mv	a0,s2
    80006a0c:	01813083          	ld	ra,24(sp)
    80006a10:	01013403          	ld	s0,16(sp)
    80006a14:	00813483          	ld	s1,8(sp)
    80006a18:	00013903          	ld	s2,0(sp)
    80006a1c:	02010113          	addi	sp,sp,32
    80006a20:	00008067          	ret

0000000080006a24 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006a24:	fe010113          	addi	sp,sp,-32
    80006a28:	00113c23          	sd	ra,24(sp)
    80006a2c:	00813823          	sd	s0,16(sp)
    80006a30:	00913423          	sd	s1,8(sp)
    80006a34:	01213023          	sd	s2,0(sp)
    80006a38:	02010413          	addi	s0,sp,32
    80006a3c:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006a40:	02853503          	ld	a0,40(a0)
    80006a44:	ffffd097          	auipc	ra,0xffffd
    80006a48:	bb4080e7          	jalr	-1100(ra) # 800035f8 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006a4c:	0304b503          	ld	a0,48(s1)
    80006a50:	ffffd097          	auipc	ra,0xffffd
    80006a54:	ba8080e7          	jalr	-1112(ra) # 800035f8 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006a58:	0144a783          	lw	a5,20(s1)
    80006a5c:	0104a903          	lw	s2,16(s1)
    80006a60:	0327ce63          	blt	a5,s2,80006a9c <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006a64:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006a68:	0304b503          	ld	a0,48(s1)
    80006a6c:	ffffd097          	auipc	ra,0xffffd
    80006a70:	bb8080e7          	jalr	-1096(ra) # 80003624 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006a74:	0284b503          	ld	a0,40(s1)
    80006a78:	ffffd097          	auipc	ra,0xffffd
    80006a7c:	bac080e7          	jalr	-1108(ra) # 80003624 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006a80:	00090513          	mv	a0,s2
    80006a84:	01813083          	ld	ra,24(sp)
    80006a88:	01013403          	ld	s0,16(sp)
    80006a8c:	00813483          	ld	s1,8(sp)
    80006a90:	00013903          	ld	s2,0(sp)
    80006a94:	02010113          	addi	sp,sp,32
    80006a98:	00008067          	ret
        ret = cap - head + tail;
    80006a9c:	0004a703          	lw	a4,0(s1)
    80006aa0:	4127093b          	subw	s2,a4,s2
    80006aa4:	00f9093b          	addw	s2,s2,a5
    80006aa8:	fc1ff06f          	j	80006a68 <_ZN9BufferCPP6getCntEv+0x44>

0000000080006aac <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006aac:	fe010113          	addi	sp,sp,-32
    80006ab0:	00113c23          	sd	ra,24(sp)
    80006ab4:	00813823          	sd	s0,16(sp)
    80006ab8:	00913423          	sd	s1,8(sp)
    80006abc:	02010413          	addi	s0,sp,32
    80006ac0:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006ac4:	00a00513          	li	a0,10
    80006ac8:	ffffd097          	auipc	ra,0xffffd
    80006acc:	c30080e7          	jalr	-976(ra) # 800036f8 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006ad0:	00004517          	auipc	a0,0x4
    80006ad4:	a7050513          	addi	a0,a0,-1424 # 8000a540 <CONSOLE_STATUS+0x530>
    80006ad8:	00000097          	auipc	ra,0x0
    80006adc:	a0c080e7          	jalr	-1524(ra) # 800064e4 <_Z11printStringPKc>
    while (getCnt()) {
    80006ae0:	00048513          	mv	a0,s1
    80006ae4:	00000097          	auipc	ra,0x0
    80006ae8:	f40080e7          	jalr	-192(ra) # 80006a24 <_ZN9BufferCPP6getCntEv>
    80006aec:	02050c63          	beqz	a0,80006b24 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006af0:	0084b783          	ld	a5,8(s1)
    80006af4:	0104a703          	lw	a4,16(s1)
    80006af8:	00271713          	slli	a4,a4,0x2
    80006afc:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006b00:	0007c503          	lbu	a0,0(a5)
    80006b04:	ffffd097          	auipc	ra,0xffffd
    80006b08:	bf4080e7          	jalr	-1036(ra) # 800036f8 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006b0c:	0104a783          	lw	a5,16(s1)
    80006b10:	0017879b          	addiw	a5,a5,1
    80006b14:	0004a703          	lw	a4,0(s1)
    80006b18:	02e7e7bb          	remw	a5,a5,a4
    80006b1c:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006b20:	fc1ff06f          	j	80006ae0 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006b24:	02100513          	li	a0,33
    80006b28:	ffffd097          	auipc	ra,0xffffd
    80006b2c:	bd0080e7          	jalr	-1072(ra) # 800036f8 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006b30:	00a00513          	li	a0,10
    80006b34:	ffffd097          	auipc	ra,0xffffd
    80006b38:	bc4080e7          	jalr	-1084(ra) # 800036f8 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006b3c:	0084b503          	ld	a0,8(s1)
    80006b40:	ffffb097          	auipc	ra,0xffffb
    80006b44:	894080e7          	jalr	-1900(ra) # 800013d4 <_Z8mem_freePv>
    delete itemAvailable;
    80006b48:	0204b503          	ld	a0,32(s1)
    80006b4c:	00050863          	beqz	a0,80006b5c <_ZN9BufferCPPD1Ev+0xb0>
    80006b50:	00053783          	ld	a5,0(a0)
    80006b54:	0087b783          	ld	a5,8(a5)
    80006b58:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006b5c:	0184b503          	ld	a0,24(s1)
    80006b60:	00050863          	beqz	a0,80006b70 <_ZN9BufferCPPD1Ev+0xc4>
    80006b64:	00053783          	ld	a5,0(a0)
    80006b68:	0087b783          	ld	a5,8(a5)
    80006b6c:	000780e7          	jalr	a5
    delete mutexTail;
    80006b70:	0304b503          	ld	a0,48(s1)
    80006b74:	00050863          	beqz	a0,80006b84 <_ZN9BufferCPPD1Ev+0xd8>
    80006b78:	00053783          	ld	a5,0(a0)
    80006b7c:	0087b783          	ld	a5,8(a5)
    80006b80:	000780e7          	jalr	a5
    delete mutexHead;
    80006b84:	0284b503          	ld	a0,40(s1)
    80006b88:	00050863          	beqz	a0,80006b98 <_ZN9BufferCPPD1Ev+0xec>
    80006b8c:	00053783          	ld	a5,0(a0)
    80006b90:	0087b783          	ld	a5,8(a5)
    80006b94:	000780e7          	jalr	a5
}
    80006b98:	01813083          	ld	ra,24(sp)
    80006b9c:	01013403          	ld	s0,16(sp)
    80006ba0:	00813483          	ld	s1,8(sp)
    80006ba4:	02010113          	addi	sp,sp,32
    80006ba8:	00008067          	ret

0000000080006bac <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80006bac:	fe010113          	addi	sp,sp,-32
    80006bb0:	00113c23          	sd	ra,24(sp)
    80006bb4:	00813823          	sd	s0,16(sp)
    80006bb8:	00913423          	sd	s1,8(sp)
    80006bbc:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80006bc0:	00004517          	auipc	a0,0x4
    80006bc4:	99850513          	addi	a0,a0,-1640 # 8000a558 <CONSOLE_STATUS+0x548>
    80006bc8:	00000097          	auipc	ra,0x0
    80006bcc:	91c080e7          	jalr	-1764(ra) # 800064e4 <_Z11printStringPKc>
    int test = getc() - '0';
    80006bd0:	ffffb097          	auipc	ra,0xffffb
    80006bd4:	a30080e7          	jalr	-1488(ra) # 80001600 <_Z4getcv>
    80006bd8:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80006bdc:	ffffb097          	auipc	ra,0xffffb
    80006be0:	a24080e7          	jalr	-1500(ra) # 80001600 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006be4:	00700793          	li	a5,7
    80006be8:	1097e263          	bltu	a5,s1,80006cec <_Z8userMainv+0x140>
    80006bec:	00249493          	slli	s1,s1,0x2
    80006bf0:	00004717          	auipc	a4,0x4
    80006bf4:	bc070713          	addi	a4,a4,-1088 # 8000a7b0 <CONSOLE_STATUS+0x7a0>
    80006bf8:	00e484b3          	add	s1,s1,a4
    80006bfc:	0004a783          	lw	a5,0(s1)
    80006c00:	00e787b3          	add	a5,a5,a4
    80006c04:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80006c08:	fffff097          	auipc	ra,0xfffff
    80006c0c:	f54080e7          	jalr	-172(ra) # 80005b5c <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006c10:	00004517          	auipc	a0,0x4
    80006c14:	96850513          	addi	a0,a0,-1688 # 8000a578 <CONSOLE_STATUS+0x568>
    80006c18:	00000097          	auipc	ra,0x0
    80006c1c:	8cc080e7          	jalr	-1844(ra) # 800064e4 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006c20:	01813083          	ld	ra,24(sp)
    80006c24:	01013403          	ld	s0,16(sp)
    80006c28:	00813483          	ld	s1,8(sp)
    80006c2c:	02010113          	addi	sp,sp,32
    80006c30:	00008067          	ret
            Threads_CPP_API_test();
    80006c34:	ffffe097          	auipc	ra,0xffffe
    80006c38:	e08080e7          	jalr	-504(ra) # 80004a3c <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006c3c:	00004517          	auipc	a0,0x4
    80006c40:	97c50513          	addi	a0,a0,-1668 # 8000a5b8 <CONSOLE_STATUS+0x5a8>
    80006c44:	00000097          	auipc	ra,0x0
    80006c48:	8a0080e7          	jalr	-1888(ra) # 800064e4 <_Z11printStringPKc>
            break;
    80006c4c:	fd5ff06f          	j	80006c20 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006c50:	ffffd097          	auipc	ra,0xffffd
    80006c54:	640080e7          	jalr	1600(ra) # 80004290 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006c58:	00004517          	auipc	a0,0x4
    80006c5c:	9a050513          	addi	a0,a0,-1632 # 8000a5f8 <CONSOLE_STATUS+0x5e8>
    80006c60:	00000097          	auipc	ra,0x0
    80006c64:	884080e7          	jalr	-1916(ra) # 800064e4 <_Z11printStringPKc>
            break;
    80006c68:	fb9ff06f          	j	80006c20 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006c6c:	fffff097          	auipc	ra,0xfffff
    80006c70:	234080e7          	jalr	564(ra) # 80005ea0 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006c74:	00004517          	auipc	a0,0x4
    80006c78:	9d450513          	addi	a0,a0,-1580 # 8000a648 <CONSOLE_STATUS+0x638>
    80006c7c:	00000097          	auipc	ra,0x0
    80006c80:	868080e7          	jalr	-1944(ra) # 800064e4 <_Z11printStringPKc>
            break;
    80006c84:	f9dff06f          	j	80006c20 <_Z8userMainv+0x74>
            testSleeping();
    80006c88:	00000097          	auipc	ra,0x0
    80006c8c:	11c080e7          	jalr	284(ra) # 80006da4 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006c90:	00004517          	auipc	a0,0x4
    80006c94:	a1050513          	addi	a0,a0,-1520 # 8000a6a0 <CONSOLE_STATUS+0x690>
    80006c98:	00000097          	auipc	ra,0x0
    80006c9c:	84c080e7          	jalr	-1972(ra) # 800064e4 <_Z11printStringPKc>
            break;
    80006ca0:	f81ff06f          	j	80006c20 <_Z8userMainv+0x74>
            testConsumerProducer();
    80006ca4:	ffffe097          	auipc	ra,0xffffe
    80006ca8:	258080e7          	jalr	600(ra) # 80004efc <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006cac:	00004517          	auipc	a0,0x4
    80006cb0:	a2450513          	addi	a0,a0,-1500 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80006cb4:	00000097          	auipc	ra,0x0
    80006cb8:	830080e7          	jalr	-2000(ra) # 800064e4 <_Z11printStringPKc>
            break;
    80006cbc:	f65ff06f          	j	80006c20 <_Z8userMainv+0x74>
            System_Mode_test();
    80006cc0:	00000097          	auipc	ra,0x0
    80006cc4:	658080e7          	jalr	1624(ra) # 80007318 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006cc8:	00004517          	auipc	a0,0x4
    80006ccc:	a4850513          	addi	a0,a0,-1464 # 8000a710 <CONSOLE_STATUS+0x700>
    80006cd0:	00000097          	auipc	ra,0x0
    80006cd4:	814080e7          	jalr	-2028(ra) # 800064e4 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006cd8:	00004517          	auipc	a0,0x4
    80006cdc:	a5850513          	addi	a0,a0,-1448 # 8000a730 <CONSOLE_STATUS+0x720>
    80006ce0:	00000097          	auipc	ra,0x0
    80006ce4:	804080e7          	jalr	-2044(ra) # 800064e4 <_Z11printStringPKc>
            break;
    80006ce8:	f39ff06f          	j	80006c20 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80006cec:	00004517          	auipc	a0,0x4
    80006cf0:	a9c50513          	addi	a0,a0,-1380 # 8000a788 <CONSOLE_STATUS+0x778>
    80006cf4:	fffff097          	auipc	ra,0xfffff
    80006cf8:	7f0080e7          	jalr	2032(ra) # 800064e4 <_Z11printStringPKc>
    80006cfc:	f25ff06f          	j	80006c20 <_Z8userMainv+0x74>

0000000080006d00 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void* arg) {
    80006d00:	fe010113          	addi	sp,sp,-32
    80006d04:	00113c23          	sd	ra,24(sp)
    80006d08:	00813823          	sd	s0,16(sp)
    80006d0c:	00913423          	sd	s1,8(sp)
    80006d10:	01213023          	sd	s2,0(sp)
    80006d14:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t*)arg);
    80006d18:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006d1c:	00600493          	li	s1,6
    while (--i > 0) {
    80006d20:	fff4849b          	addiw	s1,s1,-1
    80006d24:	04905463          	blez	s1,80006d6c <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006d28:	00003517          	auipc	a0,0x3
    80006d2c:	31050513          	addi	a0,a0,784 # 8000a038 <CONSOLE_STATUS+0x28>
    80006d30:	fffff097          	auipc	ra,0xfffff
    80006d34:	7b4080e7          	jalr	1972(ra) # 800064e4 <_Z11printStringPKc>
        printInt(sleep_time);
    80006d38:	00000613          	li	a2,0
    80006d3c:	00a00593          	li	a1,10
    80006d40:	0009051b          	sext.w	a0,s2
    80006d44:	00000097          	auipc	ra,0x0
    80006d48:	950080e7          	jalr	-1712(ra) # 80006694 <_Z8printIntiii>
        printString(" !\n");
    80006d4c:	00003517          	auipc	a0,0x3
    80006d50:	2f450513          	addi	a0,a0,756 # 8000a040 <CONSOLE_STATUS+0x30>
    80006d54:	fffff097          	auipc	ra,0xfffff
    80006d58:	790080e7          	jalr	1936(ra) # 800064e4 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006d5c:	00090513          	mv	a0,s2
    80006d60:	ffffa097          	auipc	ra,0xffffa
    80006d64:	7a8080e7          	jalr	1960(ra) # 80001508 <_Z10time_sleepm>
    while (--i > 0) {
    80006d68:	fb9ff06f          	j	80006d20 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time / 10 - 1] = true;
    80006d6c:	00a00793          	li	a5,10
    80006d70:	02f95933          	divu	s2,s2,a5
    80006d74:	fff90913          	addi	s2,s2,-1
    80006d78:	00006797          	auipc	a5,0x6
    80006d7c:	57878793          	addi	a5,a5,1400 # 8000d2f0 <_ZL8finished>
    80006d80:	01278933          	add	s2,a5,s2
    80006d84:	00100793          	li	a5,1
    80006d88:	00f90023          	sb	a5,0(s2)
}
    80006d8c:	01813083          	ld	ra,24(sp)
    80006d90:	01013403          	ld	s0,16(sp)
    80006d94:	00813483          	ld	s1,8(sp)
    80006d98:	00013903          	ld	s2,0(sp)
    80006d9c:	02010113          	addi	sp,sp,32
    80006da0:	00008067          	ret

0000000080006da4 <_Z12testSleepingv>:
        printInt(counter++);
        printString("\n");
    }
};

void testSleeping() {
    80006da4:	fc010113          	addi	sp,sp,-64
    80006da8:	02113c23          	sd	ra,56(sp)
    80006dac:	02813823          	sd	s0,48(sp)
    80006db0:	02913423          	sd	s1,40(sp)
    80006db4:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006db8:	00a00793          	li	a5,10
    80006dbc:	fcf43823          	sd	a5,-48(s0)
    80006dc0:	01400793          	li	a5,20
    80006dc4:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];
    //timer t;
    //t.start();
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006dc8:	00000493          	li	s1,0
    80006dcc:	02c0006f          	j	80006df8 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006dd0:	00349793          	slli	a5,s1,0x3
    80006dd4:	fd040613          	addi	a2,s0,-48
    80006dd8:	00f60633          	add	a2,a2,a5
    80006ddc:	00000597          	auipc	a1,0x0
    80006de0:	f2458593          	addi	a1,a1,-220 # 80006d00 <_ZL9sleepyRunPv>
    80006de4:	fc040513          	addi	a0,s0,-64
    80006de8:	00f50533          	add	a0,a0,a5
    80006dec:	ffffa097          	auipc	ra,0xffffa
    80006df0:	618080e7          	jalr	1560(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006df4:	0014849b          	addiw	s1,s1,1
    80006df8:	00100793          	li	a5,1
    80006dfc:	fc97dae3          	bge	a5,s1,80006dd0 <_Z12testSleepingv+0x2c>
    }
    while (!(finished[0] && finished[1])) {}
    80006e00:	00006797          	auipc	a5,0x6
    80006e04:	4f07c783          	lbu	a5,1264(a5) # 8000d2f0 <_ZL8finished>
    80006e08:	fe078ce3          	beqz	a5,80006e00 <_Z12testSleepingv+0x5c>
    80006e0c:	00006797          	auipc	a5,0x6
    80006e10:	4e57c783          	lbu	a5,1253(a5) # 8000d2f1 <_ZL8finished+0x1>
    80006e14:	fe0786e3          	beqz	a5,80006e00 <_Z12testSleepingv+0x5c>
    //t.terminate();
    //t.join();
}
    80006e18:	03813083          	ld	ra,56(sp)
    80006e1c:	03013403          	ld	s0,48(sp)
    80006e20:	02813483          	ld	s1,40(sp)
    80006e24:	04010113          	addi	sp,sp,64
    80006e28:	00008067          	ret

0000000080006e2c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006e2c:	fe010113          	addi	sp,sp,-32
    80006e30:	00113c23          	sd	ra,24(sp)
    80006e34:	00813823          	sd	s0,16(sp)
    80006e38:	00913423          	sd	s1,8(sp)
    80006e3c:	01213023          	sd	s2,0(sp)
    80006e40:	02010413          	addi	s0,sp,32
    80006e44:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006e48:	00100793          	li	a5,1
    80006e4c:	02a7f863          	bgeu	a5,a0,80006e7c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006e50:	00a00793          	li	a5,10
    80006e54:	02f577b3          	remu	a5,a0,a5
    80006e58:	02078e63          	beqz	a5,80006e94 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006e5c:	fff48513          	addi	a0,s1,-1
    80006e60:	00000097          	auipc	ra,0x0
    80006e64:	fcc080e7          	jalr	-52(ra) # 80006e2c <_ZL9fibonaccim>
    80006e68:	00050913          	mv	s2,a0
    80006e6c:	ffe48513          	addi	a0,s1,-2
    80006e70:	00000097          	auipc	ra,0x0
    80006e74:	fbc080e7          	jalr	-68(ra) # 80006e2c <_ZL9fibonaccim>
    80006e78:	00a90533          	add	a0,s2,a0
}
    80006e7c:	01813083          	ld	ra,24(sp)
    80006e80:	01013403          	ld	s0,16(sp)
    80006e84:	00813483          	ld	s1,8(sp)
    80006e88:	00013903          	ld	s2,0(sp)
    80006e8c:	02010113          	addi	sp,sp,32
    80006e90:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006e94:	ffffa097          	auipc	ra,0xffffa
    80006e98:	62c080e7          	jalr	1580(ra) # 800014c0 <_Z15thread_dispatchv>
    80006e9c:	fc1ff06f          	j	80006e5c <_ZL9fibonaccim+0x30>

0000000080006ea0 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006ea0:	fe010113          	addi	sp,sp,-32
    80006ea4:	00113c23          	sd	ra,24(sp)
    80006ea8:	00813823          	sd	s0,16(sp)
    80006eac:	00913423          	sd	s1,8(sp)
    80006eb0:	01213023          	sd	s2,0(sp)
    80006eb4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006eb8:	00a00493          	li	s1,10
    80006ebc:	0400006f          	j	80006efc <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006ec0:	00003517          	auipc	a0,0x3
    80006ec4:	5e850513          	addi	a0,a0,1512 # 8000a4a8 <CONSOLE_STATUS+0x498>
    80006ec8:	fffff097          	auipc	ra,0xfffff
    80006ecc:	61c080e7          	jalr	1564(ra) # 800064e4 <_Z11printStringPKc>
    80006ed0:	00000613          	li	a2,0
    80006ed4:	00a00593          	li	a1,10
    80006ed8:	00048513          	mv	a0,s1
    80006edc:	fffff097          	auipc	ra,0xfffff
    80006ee0:	7b8080e7          	jalr	1976(ra) # 80006694 <_Z8printIntiii>
    80006ee4:	00003517          	auipc	a0,0x3
    80006ee8:	7b450513          	addi	a0,a0,1972 # 8000a698 <CONSOLE_STATUS+0x688>
    80006eec:	fffff097          	auipc	ra,0xfffff
    80006ef0:	5f8080e7          	jalr	1528(ra) # 800064e4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006ef4:	0014849b          	addiw	s1,s1,1
    80006ef8:	0ff4f493          	andi	s1,s1,255
    80006efc:	00c00793          	li	a5,12
    80006f00:	fc97f0e3          	bgeu	a5,s1,80006ec0 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006f04:	00003517          	auipc	a0,0x3
    80006f08:	5ac50513          	addi	a0,a0,1452 # 8000a4b0 <CONSOLE_STATUS+0x4a0>
    80006f0c:	fffff097          	auipc	ra,0xfffff
    80006f10:	5d8080e7          	jalr	1496(ra) # 800064e4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006f14:	00500313          	li	t1,5
    thread_dispatch();
    80006f18:	ffffa097          	auipc	ra,0xffffa
    80006f1c:	5a8080e7          	jalr	1448(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006f20:	01000513          	li	a0,16
    80006f24:	00000097          	auipc	ra,0x0
    80006f28:	f08080e7          	jalr	-248(ra) # 80006e2c <_ZL9fibonaccim>
    80006f2c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006f30:	00003517          	auipc	a0,0x3
    80006f34:	59050513          	addi	a0,a0,1424 # 8000a4c0 <CONSOLE_STATUS+0x4b0>
    80006f38:	fffff097          	auipc	ra,0xfffff
    80006f3c:	5ac080e7          	jalr	1452(ra) # 800064e4 <_Z11printStringPKc>
    80006f40:	00000613          	li	a2,0
    80006f44:	00a00593          	li	a1,10
    80006f48:	0009051b          	sext.w	a0,s2
    80006f4c:	fffff097          	auipc	ra,0xfffff
    80006f50:	748080e7          	jalr	1864(ra) # 80006694 <_Z8printIntiii>
    80006f54:	00003517          	auipc	a0,0x3
    80006f58:	74450513          	addi	a0,a0,1860 # 8000a698 <CONSOLE_STATUS+0x688>
    80006f5c:	fffff097          	auipc	ra,0xfffff
    80006f60:	588080e7          	jalr	1416(ra) # 800064e4 <_Z11printStringPKc>
    80006f64:	0400006f          	j	80006fa4 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006f68:	00003517          	auipc	a0,0x3
    80006f6c:	54050513          	addi	a0,a0,1344 # 8000a4a8 <CONSOLE_STATUS+0x498>
    80006f70:	fffff097          	auipc	ra,0xfffff
    80006f74:	574080e7          	jalr	1396(ra) # 800064e4 <_Z11printStringPKc>
    80006f78:	00000613          	li	a2,0
    80006f7c:	00a00593          	li	a1,10
    80006f80:	00048513          	mv	a0,s1
    80006f84:	fffff097          	auipc	ra,0xfffff
    80006f88:	710080e7          	jalr	1808(ra) # 80006694 <_Z8printIntiii>
    80006f8c:	00003517          	auipc	a0,0x3
    80006f90:	70c50513          	addi	a0,a0,1804 # 8000a698 <CONSOLE_STATUS+0x688>
    80006f94:	fffff097          	auipc	ra,0xfffff
    80006f98:	550080e7          	jalr	1360(ra) # 800064e4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006f9c:	0014849b          	addiw	s1,s1,1
    80006fa0:	0ff4f493          	andi	s1,s1,255
    80006fa4:	00f00793          	li	a5,15
    80006fa8:	fc97f0e3          	bgeu	a5,s1,80006f68 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006fac:	00003517          	auipc	a0,0x3
    80006fb0:	52450513          	addi	a0,a0,1316 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80006fb4:	fffff097          	auipc	ra,0xfffff
    80006fb8:	530080e7          	jalr	1328(ra) # 800064e4 <_Z11printStringPKc>
    finishedD = true;
    80006fbc:	00100793          	li	a5,1
    80006fc0:	00006717          	auipc	a4,0x6
    80006fc4:	32f70923          	sb	a5,818(a4) # 8000d2f2 <_ZL9finishedD>
    thread_dispatch();
    80006fc8:	ffffa097          	auipc	ra,0xffffa
    80006fcc:	4f8080e7          	jalr	1272(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80006fd0:	01813083          	ld	ra,24(sp)
    80006fd4:	01013403          	ld	s0,16(sp)
    80006fd8:	00813483          	ld	s1,8(sp)
    80006fdc:	00013903          	ld	s2,0(sp)
    80006fe0:	02010113          	addi	sp,sp,32
    80006fe4:	00008067          	ret

0000000080006fe8 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006fe8:	fe010113          	addi	sp,sp,-32
    80006fec:	00113c23          	sd	ra,24(sp)
    80006ff0:	00813823          	sd	s0,16(sp)
    80006ff4:	00913423          	sd	s1,8(sp)
    80006ff8:	01213023          	sd	s2,0(sp)
    80006ffc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80007000:	00000493          	li	s1,0
    80007004:	0400006f          	j	80007044 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80007008:	00003517          	auipc	a0,0x3
    8000700c:	46050513          	addi	a0,a0,1120 # 8000a468 <CONSOLE_STATUS+0x458>
    80007010:	fffff097          	auipc	ra,0xfffff
    80007014:	4d4080e7          	jalr	1236(ra) # 800064e4 <_Z11printStringPKc>
    80007018:	00000613          	li	a2,0
    8000701c:	00a00593          	li	a1,10
    80007020:	00048513          	mv	a0,s1
    80007024:	fffff097          	auipc	ra,0xfffff
    80007028:	670080e7          	jalr	1648(ra) # 80006694 <_Z8printIntiii>
    8000702c:	00003517          	auipc	a0,0x3
    80007030:	66c50513          	addi	a0,a0,1644 # 8000a698 <CONSOLE_STATUS+0x688>
    80007034:	fffff097          	auipc	ra,0xfffff
    80007038:	4b0080e7          	jalr	1200(ra) # 800064e4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000703c:	0014849b          	addiw	s1,s1,1
    80007040:	0ff4f493          	andi	s1,s1,255
    80007044:	00200793          	li	a5,2
    80007048:	fc97f0e3          	bgeu	a5,s1,80007008 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    8000704c:	00003517          	auipc	a0,0x3
    80007050:	42450513          	addi	a0,a0,1060 # 8000a470 <CONSOLE_STATUS+0x460>
    80007054:	fffff097          	auipc	ra,0xfffff
    80007058:	490080e7          	jalr	1168(ra) # 800064e4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000705c:	00700313          	li	t1,7
    thread_dispatch();
    80007060:	ffffa097          	auipc	ra,0xffffa
    80007064:	460080e7          	jalr	1120(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80007068:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    8000706c:	00003517          	auipc	a0,0x3
    80007070:	41450513          	addi	a0,a0,1044 # 8000a480 <CONSOLE_STATUS+0x470>
    80007074:	fffff097          	auipc	ra,0xfffff
    80007078:	470080e7          	jalr	1136(ra) # 800064e4 <_Z11printStringPKc>
    8000707c:	00000613          	li	a2,0
    80007080:	00a00593          	li	a1,10
    80007084:	0009051b          	sext.w	a0,s2
    80007088:	fffff097          	auipc	ra,0xfffff
    8000708c:	60c080e7          	jalr	1548(ra) # 80006694 <_Z8printIntiii>
    80007090:	00003517          	auipc	a0,0x3
    80007094:	60850513          	addi	a0,a0,1544 # 8000a698 <CONSOLE_STATUS+0x688>
    80007098:	fffff097          	auipc	ra,0xfffff
    8000709c:	44c080e7          	jalr	1100(ra) # 800064e4 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800070a0:	00c00513          	li	a0,12
    800070a4:	00000097          	auipc	ra,0x0
    800070a8:	d88080e7          	jalr	-632(ra) # 80006e2c <_ZL9fibonaccim>
    800070ac:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800070b0:	00003517          	auipc	a0,0x3
    800070b4:	3d850513          	addi	a0,a0,984 # 8000a488 <CONSOLE_STATUS+0x478>
    800070b8:	fffff097          	auipc	ra,0xfffff
    800070bc:	42c080e7          	jalr	1068(ra) # 800064e4 <_Z11printStringPKc>
    800070c0:	00000613          	li	a2,0
    800070c4:	00a00593          	li	a1,10
    800070c8:	0009051b          	sext.w	a0,s2
    800070cc:	fffff097          	auipc	ra,0xfffff
    800070d0:	5c8080e7          	jalr	1480(ra) # 80006694 <_Z8printIntiii>
    800070d4:	00003517          	auipc	a0,0x3
    800070d8:	5c450513          	addi	a0,a0,1476 # 8000a698 <CONSOLE_STATUS+0x688>
    800070dc:	fffff097          	auipc	ra,0xfffff
    800070e0:	408080e7          	jalr	1032(ra) # 800064e4 <_Z11printStringPKc>
    800070e4:	0400006f          	j	80007124 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800070e8:	00003517          	auipc	a0,0x3
    800070ec:	38050513          	addi	a0,a0,896 # 8000a468 <CONSOLE_STATUS+0x458>
    800070f0:	fffff097          	auipc	ra,0xfffff
    800070f4:	3f4080e7          	jalr	1012(ra) # 800064e4 <_Z11printStringPKc>
    800070f8:	00000613          	li	a2,0
    800070fc:	00a00593          	li	a1,10
    80007100:	00048513          	mv	a0,s1
    80007104:	fffff097          	auipc	ra,0xfffff
    80007108:	590080e7          	jalr	1424(ra) # 80006694 <_Z8printIntiii>
    8000710c:	00003517          	auipc	a0,0x3
    80007110:	58c50513          	addi	a0,a0,1420 # 8000a698 <CONSOLE_STATUS+0x688>
    80007114:	fffff097          	auipc	ra,0xfffff
    80007118:	3d0080e7          	jalr	976(ra) # 800064e4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000711c:	0014849b          	addiw	s1,s1,1
    80007120:	0ff4f493          	andi	s1,s1,255
    80007124:	00500793          	li	a5,5
    80007128:	fc97f0e3          	bgeu	a5,s1,800070e8 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    8000712c:	00003517          	auipc	a0,0x3
    80007130:	31450513          	addi	a0,a0,788 # 8000a440 <CONSOLE_STATUS+0x430>
    80007134:	fffff097          	auipc	ra,0xfffff
    80007138:	3b0080e7          	jalr	944(ra) # 800064e4 <_Z11printStringPKc>
    finishedC = true;
    8000713c:	00100793          	li	a5,1
    80007140:	00006717          	auipc	a4,0x6
    80007144:	1af709a3          	sb	a5,435(a4) # 8000d2f3 <_ZL9finishedC>
    thread_dispatch();
    80007148:	ffffa097          	auipc	ra,0xffffa
    8000714c:	378080e7          	jalr	888(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80007150:	01813083          	ld	ra,24(sp)
    80007154:	01013403          	ld	s0,16(sp)
    80007158:	00813483          	ld	s1,8(sp)
    8000715c:	00013903          	ld	s2,0(sp)
    80007160:	02010113          	addi	sp,sp,32
    80007164:	00008067          	ret

0000000080007168 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80007168:	fe010113          	addi	sp,sp,-32
    8000716c:	00113c23          	sd	ra,24(sp)
    80007170:	00813823          	sd	s0,16(sp)
    80007174:	00913423          	sd	s1,8(sp)
    80007178:	01213023          	sd	s2,0(sp)
    8000717c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80007180:	00000913          	li	s2,0
    80007184:	0400006f          	j	800071c4 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80007188:	ffffa097          	auipc	ra,0xffffa
    8000718c:	338080e7          	jalr	824(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80007190:	00148493          	addi	s1,s1,1
    80007194:	000027b7          	lui	a5,0x2
    80007198:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000719c:	0097ee63          	bltu	a5,s1,800071b8 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800071a0:	00000713          	li	a4,0
    800071a4:	000077b7          	lui	a5,0x7
    800071a8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800071ac:	fce7eee3          	bltu	a5,a4,80007188 <_ZL11workerBodyBPv+0x20>
    800071b0:	00170713          	addi	a4,a4,1
    800071b4:	ff1ff06f          	j	800071a4 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    800071b8:	00a00793          	li	a5,10
    800071bc:	04f90663          	beq	s2,a5,80007208 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    800071c0:	00190913          	addi	s2,s2,1
    800071c4:	00f00793          	li	a5,15
    800071c8:	0527e463          	bltu	a5,s2,80007210 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    800071cc:	00003517          	auipc	a0,0x3
    800071d0:	28450513          	addi	a0,a0,644 # 8000a450 <CONSOLE_STATUS+0x440>
    800071d4:	fffff097          	auipc	ra,0xfffff
    800071d8:	310080e7          	jalr	784(ra) # 800064e4 <_Z11printStringPKc>
    800071dc:	00000613          	li	a2,0
    800071e0:	00a00593          	li	a1,10
    800071e4:	0009051b          	sext.w	a0,s2
    800071e8:	fffff097          	auipc	ra,0xfffff
    800071ec:	4ac080e7          	jalr	1196(ra) # 80006694 <_Z8printIntiii>
    800071f0:	00003517          	auipc	a0,0x3
    800071f4:	4a850513          	addi	a0,a0,1192 # 8000a698 <CONSOLE_STATUS+0x688>
    800071f8:	fffff097          	auipc	ra,0xfffff
    800071fc:	2ec080e7          	jalr	748(ra) # 800064e4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80007200:	00000493          	li	s1,0
    80007204:	f91ff06f          	j	80007194 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80007208:	14102ff3          	csrr	t6,sepc
    8000720c:	fb5ff06f          	j	800071c0 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80007210:	00003517          	auipc	a0,0x3
    80007214:	24850513          	addi	a0,a0,584 # 8000a458 <CONSOLE_STATUS+0x448>
    80007218:	fffff097          	auipc	ra,0xfffff
    8000721c:	2cc080e7          	jalr	716(ra) # 800064e4 <_Z11printStringPKc>
    finishedB = true;
    80007220:	00100793          	li	a5,1
    80007224:	00006717          	auipc	a4,0x6
    80007228:	0cf70823          	sb	a5,208(a4) # 8000d2f4 <_ZL9finishedB>
    thread_dispatch();
    8000722c:	ffffa097          	auipc	ra,0xffffa
    80007230:	294080e7          	jalr	660(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80007234:	01813083          	ld	ra,24(sp)
    80007238:	01013403          	ld	s0,16(sp)
    8000723c:	00813483          	ld	s1,8(sp)
    80007240:	00013903          	ld	s2,0(sp)
    80007244:	02010113          	addi	sp,sp,32
    80007248:	00008067          	ret

000000008000724c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    8000724c:	fe010113          	addi	sp,sp,-32
    80007250:	00113c23          	sd	ra,24(sp)
    80007254:	00813823          	sd	s0,16(sp)
    80007258:	00913423          	sd	s1,8(sp)
    8000725c:	01213023          	sd	s2,0(sp)
    80007260:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80007264:	00000913          	li	s2,0
    80007268:	0380006f          	j	800072a0 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    8000726c:	ffffa097          	auipc	ra,0xffffa
    80007270:	254080e7          	jalr	596(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80007274:	00148493          	addi	s1,s1,1
    80007278:	000027b7          	lui	a5,0x2
    8000727c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80007280:	0097ee63          	bltu	a5,s1,8000729c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80007284:	00000713          	li	a4,0
    80007288:	000077b7          	lui	a5,0x7
    8000728c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80007290:	fce7eee3          	bltu	a5,a4,8000726c <_ZL11workerBodyAPv+0x20>
    80007294:	00170713          	addi	a4,a4,1
    80007298:	ff1ff06f          	j	80007288 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000729c:	00190913          	addi	s2,s2,1
    800072a0:	00900793          	li	a5,9
    800072a4:	0527e063          	bltu	a5,s2,800072e4 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800072a8:	00003517          	auipc	a0,0x3
    800072ac:	19050513          	addi	a0,a0,400 # 8000a438 <CONSOLE_STATUS+0x428>
    800072b0:	fffff097          	auipc	ra,0xfffff
    800072b4:	234080e7          	jalr	564(ra) # 800064e4 <_Z11printStringPKc>
    800072b8:	00000613          	li	a2,0
    800072bc:	00a00593          	li	a1,10
    800072c0:	0009051b          	sext.w	a0,s2
    800072c4:	fffff097          	auipc	ra,0xfffff
    800072c8:	3d0080e7          	jalr	976(ra) # 80006694 <_Z8printIntiii>
    800072cc:	00003517          	auipc	a0,0x3
    800072d0:	3cc50513          	addi	a0,a0,972 # 8000a698 <CONSOLE_STATUS+0x688>
    800072d4:	fffff097          	auipc	ra,0xfffff
    800072d8:	210080e7          	jalr	528(ra) # 800064e4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800072dc:	00000493          	li	s1,0
    800072e0:	f99ff06f          	j	80007278 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800072e4:	00003517          	auipc	a0,0x3
    800072e8:	15c50513          	addi	a0,a0,348 # 8000a440 <CONSOLE_STATUS+0x430>
    800072ec:	fffff097          	auipc	ra,0xfffff
    800072f0:	1f8080e7          	jalr	504(ra) # 800064e4 <_Z11printStringPKc>
    finishedA = true;
    800072f4:	00100793          	li	a5,1
    800072f8:	00006717          	auipc	a4,0x6
    800072fc:	fef70ea3          	sb	a5,-3(a4) # 8000d2f5 <_ZL9finishedA>
}
    80007300:	01813083          	ld	ra,24(sp)
    80007304:	01013403          	ld	s0,16(sp)
    80007308:	00813483          	ld	s1,8(sp)
    8000730c:	00013903          	ld	s2,0(sp)
    80007310:	02010113          	addi	sp,sp,32
    80007314:	00008067          	ret

0000000080007318 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80007318:	fd010113          	addi	sp,sp,-48
    8000731c:	02113423          	sd	ra,40(sp)
    80007320:	02813023          	sd	s0,32(sp)
    80007324:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80007328:	00000613          	li	a2,0
    8000732c:	00000597          	auipc	a1,0x0
    80007330:	f2058593          	addi	a1,a1,-224 # 8000724c <_ZL11workerBodyAPv>
    80007334:	fd040513          	addi	a0,s0,-48
    80007338:	ffffa097          	auipc	ra,0xffffa
    8000733c:	0cc080e7          	jalr	204(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80007340:	00003517          	auipc	a0,0x3
    80007344:	1a050513          	addi	a0,a0,416 # 8000a4e0 <CONSOLE_STATUS+0x4d0>
    80007348:	fffff097          	auipc	ra,0xfffff
    8000734c:	19c080e7          	jalr	412(ra) # 800064e4 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80007350:	00000613          	li	a2,0
    80007354:	00000597          	auipc	a1,0x0
    80007358:	e1458593          	addi	a1,a1,-492 # 80007168 <_ZL11workerBodyBPv>
    8000735c:	fd840513          	addi	a0,s0,-40
    80007360:	ffffa097          	auipc	ra,0xffffa
    80007364:	0a4080e7          	jalr	164(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80007368:	00003517          	auipc	a0,0x3
    8000736c:	19050513          	addi	a0,a0,400 # 8000a4f8 <CONSOLE_STATUS+0x4e8>
    80007370:	fffff097          	auipc	ra,0xfffff
    80007374:	174080e7          	jalr	372(ra) # 800064e4 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80007378:	00000613          	li	a2,0
    8000737c:	00000597          	auipc	a1,0x0
    80007380:	c6c58593          	addi	a1,a1,-916 # 80006fe8 <_ZL11workerBodyCPv>
    80007384:	fe040513          	addi	a0,s0,-32
    80007388:	ffffa097          	auipc	ra,0xffffa
    8000738c:	07c080e7          	jalr	124(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80007390:	00003517          	auipc	a0,0x3
    80007394:	18050513          	addi	a0,a0,384 # 8000a510 <CONSOLE_STATUS+0x500>
    80007398:	fffff097          	auipc	ra,0xfffff
    8000739c:	14c080e7          	jalr	332(ra) # 800064e4 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800073a0:	00000613          	li	a2,0
    800073a4:	00000597          	auipc	a1,0x0
    800073a8:	afc58593          	addi	a1,a1,-1284 # 80006ea0 <_ZL11workerBodyDPv>
    800073ac:	fe840513          	addi	a0,s0,-24
    800073b0:	ffffa097          	auipc	ra,0xffffa
    800073b4:	054080e7          	jalr	84(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800073b8:	00003517          	auipc	a0,0x3
    800073bc:	17050513          	addi	a0,a0,368 # 8000a528 <CONSOLE_STATUS+0x518>
    800073c0:	fffff097          	auipc	ra,0xfffff
    800073c4:	124080e7          	jalr	292(ra) # 800064e4 <_Z11printStringPKc>
    800073c8:	00c0006f          	j	800073d4 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800073cc:	ffffa097          	auipc	ra,0xffffa
    800073d0:	0f4080e7          	jalr	244(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800073d4:	00006797          	auipc	a5,0x6
    800073d8:	f217c783          	lbu	a5,-223(a5) # 8000d2f5 <_ZL9finishedA>
    800073dc:	fe0788e3          	beqz	a5,800073cc <_Z16System_Mode_testv+0xb4>
    800073e0:	00006797          	auipc	a5,0x6
    800073e4:	f147c783          	lbu	a5,-236(a5) # 8000d2f4 <_ZL9finishedB>
    800073e8:	fe0782e3          	beqz	a5,800073cc <_Z16System_Mode_testv+0xb4>
    800073ec:	00006797          	auipc	a5,0x6
    800073f0:	f077c783          	lbu	a5,-249(a5) # 8000d2f3 <_ZL9finishedC>
    800073f4:	fc078ce3          	beqz	a5,800073cc <_Z16System_Mode_testv+0xb4>
    800073f8:	00006797          	auipc	a5,0x6
    800073fc:	efa7c783          	lbu	a5,-262(a5) # 8000d2f2 <_ZL9finishedD>
    80007400:	fc0786e3          	beqz	a5,800073cc <_Z16System_Mode_testv+0xb4>
    }

}
    80007404:	02813083          	ld	ra,40(sp)
    80007408:	02013403          	ld	s0,32(sp)
    8000740c:	03010113          	addi	sp,sp,48
    80007410:	00008067          	ret

0000000080007414 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80007414:	fe010113          	addi	sp,sp,-32
    80007418:	00113c23          	sd	ra,24(sp)
    8000741c:	00813823          	sd	s0,16(sp)
    80007420:	00913423          	sd	s1,8(sp)
    80007424:	01213023          	sd	s2,0(sp)
    80007428:	02010413          	addi	s0,sp,32
    8000742c:	00050493          	mv	s1,a0
    80007430:	00058913          	mv	s2,a1
    80007434:	0015879b          	addiw	a5,a1,1
    80007438:	0007851b          	sext.w	a0,a5
    8000743c:	00f4a023          	sw	a5,0(s1)
    80007440:	0004a823          	sw	zero,16(s1)
    80007444:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80007448:	00251513          	slli	a0,a0,0x2
    8000744c:	ffffa097          	auipc	ra,0xffffa
    80007450:	f48080e7          	jalr	-184(ra) # 80001394 <_Z9mem_allocm>
    80007454:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80007458:	00000593          	li	a1,0
    8000745c:	02048513          	addi	a0,s1,32
    80007460:	ffffa097          	auipc	ra,0xffffa
    80007464:	0d8080e7          	jalr	216(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80007468:	00090593          	mv	a1,s2
    8000746c:	01848513          	addi	a0,s1,24
    80007470:	ffffa097          	auipc	ra,0xffffa
    80007474:	0c8080e7          	jalr	200(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80007478:	00100593          	li	a1,1
    8000747c:	02848513          	addi	a0,s1,40
    80007480:	ffffa097          	auipc	ra,0xffffa
    80007484:	0b8080e7          	jalr	184(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80007488:	00100593          	li	a1,1
    8000748c:	03048513          	addi	a0,s1,48
    80007490:	ffffa097          	auipc	ra,0xffffa
    80007494:	0a8080e7          	jalr	168(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    80007498:	01813083          	ld	ra,24(sp)
    8000749c:	01013403          	ld	s0,16(sp)
    800074a0:	00813483          	ld	s1,8(sp)
    800074a4:	00013903          	ld	s2,0(sp)
    800074a8:	02010113          	addi	sp,sp,32
    800074ac:	00008067          	ret

00000000800074b0 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800074b0:	fe010113          	addi	sp,sp,-32
    800074b4:	00113c23          	sd	ra,24(sp)
    800074b8:	00813823          	sd	s0,16(sp)
    800074bc:	00913423          	sd	s1,8(sp)
    800074c0:	01213023          	sd	s2,0(sp)
    800074c4:	02010413          	addi	s0,sp,32
    800074c8:	00050493          	mv	s1,a0
    800074cc:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800074d0:	01853503          	ld	a0,24(a0)
    800074d4:	ffffa097          	auipc	ra,0xffffa
    800074d8:	0cc080e7          	jalr	204(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    800074dc:	0304b503          	ld	a0,48(s1)
    800074e0:	ffffa097          	auipc	ra,0xffffa
    800074e4:	0c0080e7          	jalr	192(ra) # 800015a0 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    800074e8:	0084b783          	ld	a5,8(s1)
    800074ec:	0144a703          	lw	a4,20(s1)
    800074f0:	00271713          	slli	a4,a4,0x2
    800074f4:	00e787b3          	add	a5,a5,a4
    800074f8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800074fc:	0144a783          	lw	a5,20(s1)
    80007500:	0017879b          	addiw	a5,a5,1
    80007504:	0004a703          	lw	a4,0(s1)
    80007508:	02e7e7bb          	remw	a5,a5,a4
    8000750c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80007510:	0304b503          	ld	a0,48(s1)
    80007514:	ffffa097          	auipc	ra,0xffffa
    80007518:	0bc080e7          	jalr	188(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    8000751c:	0204b503          	ld	a0,32(s1)
    80007520:	ffffa097          	auipc	ra,0xffffa
    80007524:	0b0080e7          	jalr	176(ra) # 800015d0 <_Z10sem_signalP4KSem>

}
    80007528:	01813083          	ld	ra,24(sp)
    8000752c:	01013403          	ld	s0,16(sp)
    80007530:	00813483          	ld	s1,8(sp)
    80007534:	00013903          	ld	s2,0(sp)
    80007538:	02010113          	addi	sp,sp,32
    8000753c:	00008067          	ret

0000000080007540 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80007540:	fe010113          	addi	sp,sp,-32
    80007544:	00113c23          	sd	ra,24(sp)
    80007548:	00813823          	sd	s0,16(sp)
    8000754c:	00913423          	sd	s1,8(sp)
    80007550:	01213023          	sd	s2,0(sp)
    80007554:	02010413          	addi	s0,sp,32
    80007558:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    8000755c:	02053503          	ld	a0,32(a0)
    80007560:	ffffa097          	auipc	ra,0xffffa
    80007564:	040080e7          	jalr	64(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80007568:	0284b503          	ld	a0,40(s1)
    8000756c:	ffffa097          	auipc	ra,0xffffa
    80007570:	034080e7          	jalr	52(ra) # 800015a0 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80007574:	0084b703          	ld	a4,8(s1)
    80007578:	0104a783          	lw	a5,16(s1)
    8000757c:	00279693          	slli	a3,a5,0x2
    80007580:	00d70733          	add	a4,a4,a3
    80007584:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80007588:	0017879b          	addiw	a5,a5,1
    8000758c:	0004a703          	lw	a4,0(s1)
    80007590:	02e7e7bb          	remw	a5,a5,a4
    80007594:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80007598:	0284b503          	ld	a0,40(s1)
    8000759c:	ffffa097          	auipc	ra,0xffffa
    800075a0:	034080e7          	jalr	52(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    800075a4:	0184b503          	ld	a0,24(s1)
    800075a8:	ffffa097          	auipc	ra,0xffffa
    800075ac:	028080e7          	jalr	40(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    800075b0:	00090513          	mv	a0,s2
    800075b4:	01813083          	ld	ra,24(sp)
    800075b8:	01013403          	ld	s0,16(sp)
    800075bc:	00813483          	ld	s1,8(sp)
    800075c0:	00013903          	ld	s2,0(sp)
    800075c4:	02010113          	addi	sp,sp,32
    800075c8:	00008067          	ret

00000000800075cc <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800075cc:	fe010113          	addi	sp,sp,-32
    800075d0:	00113c23          	sd	ra,24(sp)
    800075d4:	00813823          	sd	s0,16(sp)
    800075d8:	00913423          	sd	s1,8(sp)
    800075dc:	01213023          	sd	s2,0(sp)
    800075e0:	02010413          	addi	s0,sp,32
    800075e4:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800075e8:	02853503          	ld	a0,40(a0)
    800075ec:	ffffa097          	auipc	ra,0xffffa
    800075f0:	fb4080e7          	jalr	-76(ra) # 800015a0 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    800075f4:	0304b503          	ld	a0,48(s1)
    800075f8:	ffffa097          	auipc	ra,0xffffa
    800075fc:	fa8080e7          	jalr	-88(ra) # 800015a0 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80007600:	0144a783          	lw	a5,20(s1)
    80007604:	0104a903          	lw	s2,16(s1)
    80007608:	0327ce63          	blt	a5,s2,80007644 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    8000760c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80007610:	0304b503          	ld	a0,48(s1)
    80007614:	ffffa097          	auipc	ra,0xffffa
    80007618:	fbc080e7          	jalr	-68(ra) # 800015d0 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    8000761c:	0284b503          	ld	a0,40(s1)
    80007620:	ffffa097          	auipc	ra,0xffffa
    80007624:	fb0080e7          	jalr	-80(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    80007628:	00090513          	mv	a0,s2
    8000762c:	01813083          	ld	ra,24(sp)
    80007630:	01013403          	ld	s0,16(sp)
    80007634:	00813483          	ld	s1,8(sp)
    80007638:	00013903          	ld	s2,0(sp)
    8000763c:	02010113          	addi	sp,sp,32
    80007640:	00008067          	ret
        ret = cap - head + tail;
    80007644:	0004a703          	lw	a4,0(s1)
    80007648:	4127093b          	subw	s2,a4,s2
    8000764c:	00f9093b          	addw	s2,s2,a5
    80007650:	fc1ff06f          	j	80007610 <_ZN6Buffer6getCntEv+0x44>

0000000080007654 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80007654:	fe010113          	addi	sp,sp,-32
    80007658:	00113c23          	sd	ra,24(sp)
    8000765c:	00813823          	sd	s0,16(sp)
    80007660:	00913423          	sd	s1,8(sp)
    80007664:	02010413          	addi	s0,sp,32
    80007668:	00050493          	mv	s1,a0
    putc('\n');
    8000766c:	00a00513          	li	a0,10
    80007670:	ffffa097          	auipc	ra,0xffffa
    80007674:	fb8080e7          	jalr	-72(ra) # 80001628 <_Z4putcc>
    printString("Buffer deleted!\n");
    80007678:	00003517          	auipc	a0,0x3
    8000767c:	ec850513          	addi	a0,a0,-312 # 8000a540 <CONSOLE_STATUS+0x530>
    80007680:	fffff097          	auipc	ra,0xfffff
    80007684:	e64080e7          	jalr	-412(ra) # 800064e4 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80007688:	00048513          	mv	a0,s1
    8000768c:	00000097          	auipc	ra,0x0
    80007690:	f40080e7          	jalr	-192(ra) # 800075cc <_ZN6Buffer6getCntEv>
    80007694:	02a05c63          	blez	a0,800076cc <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80007698:	0084b783          	ld	a5,8(s1)
    8000769c:	0104a703          	lw	a4,16(s1)
    800076a0:	00271713          	slli	a4,a4,0x2
    800076a4:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800076a8:	0007c503          	lbu	a0,0(a5)
    800076ac:	ffffa097          	auipc	ra,0xffffa
    800076b0:	f7c080e7          	jalr	-132(ra) # 80001628 <_Z4putcc>
        head = (head + 1) % cap;
    800076b4:	0104a783          	lw	a5,16(s1)
    800076b8:	0017879b          	addiw	a5,a5,1
    800076bc:	0004a703          	lw	a4,0(s1)
    800076c0:	02e7e7bb          	remw	a5,a5,a4
    800076c4:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800076c8:	fc1ff06f          	j	80007688 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800076cc:	02100513          	li	a0,33
    800076d0:	ffffa097          	auipc	ra,0xffffa
    800076d4:	f58080e7          	jalr	-168(ra) # 80001628 <_Z4putcc>
    putc('\n');
    800076d8:	00a00513          	li	a0,10
    800076dc:	ffffa097          	auipc	ra,0xffffa
    800076e0:	f4c080e7          	jalr	-180(ra) # 80001628 <_Z4putcc>
    mem_free(buffer);
    800076e4:	0084b503          	ld	a0,8(s1)
    800076e8:	ffffa097          	auipc	ra,0xffffa
    800076ec:	cec080e7          	jalr	-788(ra) # 800013d4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800076f0:	0204b503          	ld	a0,32(s1)
    800076f4:	ffffa097          	auipc	ra,0xffffa
    800076f8:	e7c080e7          	jalr	-388(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    800076fc:	0184b503          	ld	a0,24(s1)
    80007700:	ffffa097          	auipc	ra,0xffffa
    80007704:	e70080e7          	jalr	-400(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80007708:	0304b503          	ld	a0,48(s1)
    8000770c:	ffffa097          	auipc	ra,0xffffa
    80007710:	e64080e7          	jalr	-412(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80007714:	0284b503          	ld	a0,40(s1)
    80007718:	ffffa097          	auipc	ra,0xffffa
    8000771c:	e58080e7          	jalr	-424(ra) # 80001570 <_Z9sem_closeP4KSem>
}
    80007720:	01813083          	ld	ra,24(sp)
    80007724:	01013403          	ld	s0,16(sp)
    80007728:	00813483          	ld	s1,8(sp)
    8000772c:	02010113          	addi	sp,sp,32
    80007730:	00008067          	ret

0000000080007734 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80007734:	fa010113          	addi	sp,sp,-96
    80007738:	04813c23          	sd	s0,88(sp)
    8000773c:	06010413          	addi	s0,sp,96
    80007740:	faa43423          	sd	a0,-88(s0)
    80007744:	00058793          	mv	a5,a1
    80007748:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    8000774c:	fa843783          	ld	a5,-88(s0)
    80007750:	00079663          	bnez	a5,8000775c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80007754:	00000793          	li	a5,0
    80007758:	2040006f          	j	8000795c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    8000775c:	fa843783          	ld	a5,-88(s0)
    80007760:	0067d713          	srli	a4,a5,0x6
    80007764:	fa843783          	ld	a5,-88(s0)
    80007768:	03f7f793          	andi	a5,a5,63
    8000776c:	00078663          	beqz	a5,80007778 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80007770:	00100793          	li	a5,1
    80007774:	0080006f          	j	8000777c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80007778:	00000793          	li	a5,0
    8000777c:	00e787b3          	add	a5,a5,a4
    80007780:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80007784:	fc843783          	ld	a5,-56(s0)
    80007788:	00679793          	slli	a5,a5,0x6
    8000778c:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    80007790:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80007794:	00006797          	auipc	a5,0x6
    80007798:	b6c78793          	addi	a5,a5,-1172 # 8000d300 <_ZN15MemoryAllocator11freeMemHeadE>
    8000779c:	0007b783          	ld	a5,0(a5)
    800077a0:	fef43023          	sd	a5,-32(s0)
    800077a4:	fe043783          	ld	a5,-32(s0)
    800077a8:	1a078863          	beqz	a5,80007958 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    800077ac:	fe043783          	ld	a5,-32(s0)
    800077b0:	0087b783          	ld	a5,8(a5)
    800077b4:	fa843703          	ld	a4,-88(s0)
    800077b8:	18e7e263          	bltu	a5,a4,8000793c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    800077bc:	fe043703          	ld	a4,-32(s0)
    800077c0:	fa843783          	ld	a5,-88(s0)
    800077c4:	00f707b3          	add	a5,a4,a5
    800077c8:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    800077cc:	fe043783          	ld	a5,-32(s0)
    800077d0:	0087b703          	ld	a4,8(a5)
    800077d4:	fa843783          	ld	a5,-88(s0)
    800077d8:	40f707b3          	sub	a5,a4,a5
    800077dc:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    800077e0:	fb843703          	ld	a4,-72(s0)
    800077e4:	02000793          	li	a5,32
    800077e8:	04e7e463          	bltu	a5,a4,80007830 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    800077ec:	fa843703          	ld	a4,-88(s0)
    800077f0:	fb843783          	ld	a5,-72(s0)
    800077f4:	00f707b3          	add	a5,a4,a5
    800077f8:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    800077fc:	fe843783          	ld	a5,-24(s0)
    80007800:	00078c63          	beqz	a5,80007818 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    80007804:	fe043783          	ld	a5,-32(s0)
    80007808:	0007b703          	ld	a4,0(a5)
    8000780c:	fe843783          	ld	a5,-24(s0)
    80007810:	00e7b023          	sd	a4,0(a5)
    80007814:	0600006f          	j	80007874 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    80007818:	fe043783          	ld	a5,-32(s0)
    8000781c:	0007b703          	ld	a4,0(a5)
    80007820:	00006797          	auipc	a5,0x6
    80007824:	ae078793          	addi	a5,a5,-1312 # 8000d300 <_ZN15MemoryAllocator11freeMemHeadE>
    80007828:	00e7b023          	sd	a4,0(a5)
    8000782c:	0480006f          	j	80007874 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    80007830:	fc043783          	ld	a5,-64(s0)
    80007834:	fb843703          	ld	a4,-72(s0)
    80007838:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    8000783c:	fe043783          	ld	a5,-32(s0)
    80007840:	0007b703          	ld	a4,0(a5)
    80007844:	fc043783          	ld	a5,-64(s0)
    80007848:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    8000784c:	fe843783          	ld	a5,-24(s0)
    80007850:	00078a63          	beqz	a5,80007864 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    80007854:	fe843783          	ld	a5,-24(s0)
    80007858:	fc043703          	ld	a4,-64(s0)
    8000785c:	00e7b023          	sd	a4,0(a5)
    80007860:	0140006f          	j	80007874 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    80007864:	00006797          	auipc	a5,0x6
    80007868:	a9c78793          	addi	a5,a5,-1380 # 8000d300 <_ZN15MemoryAllocator11freeMemHeadE>
    8000786c:	fc043703          	ld	a4,-64(s0)
    80007870:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    80007874:	fe043783          	ld	a5,-32(s0)
    80007878:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    8000787c:	fb043783          	ld	a5,-80(s0)
    80007880:	fa843703          	ld	a4,-88(s0)
    80007884:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    80007888:	fb043783          	ld	a5,-80(s0)
    8000788c:	fa442703          	lw	a4,-92(s0)
    80007890:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    80007894:	fb043783          	ld	a5,-80(s0)
    80007898:	02078713          	addi	a4,a5,32
    8000789c:	fb043783          	ld	a5,-80(s0)
    800078a0:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    800078a4:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    800078a8:	00006797          	auipc	a5,0x6
    800078ac:	a5078793          	addi	a5,a5,-1456 # 8000d2f8 <_ZN15MemoryAllocator11usedMemHeadE>
    800078b0:	0007b783          	ld	a5,0(a5)
    800078b4:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    800078b8:	fd043783          	ld	a5,-48(s0)
    800078bc:	02078463          	beqz	a5,800078e4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    800078c0:	fd043703          	ld	a4,-48(s0)
    800078c4:	fb043783          	ld	a5,-80(s0)
    800078c8:	00f77e63          	bgeu	a4,a5,800078e4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    800078cc:	fd043783          	ld	a5,-48(s0)
    800078d0:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    800078d4:	fd043783          	ld	a5,-48(s0)
    800078d8:	0007b783          	ld	a5,0(a5)
    800078dc:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    800078e0:	fd9ff06f          	j	800078b8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    800078e4:	fd843783          	ld	a5,-40(s0)
    800078e8:	02079663          	bnez	a5,80007914 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    800078ec:	00006797          	auipc	a5,0x6
    800078f0:	a0c78793          	addi	a5,a5,-1524 # 8000d2f8 <_ZN15MemoryAllocator11usedMemHeadE>
    800078f4:	0007b703          	ld	a4,0(a5)
    800078f8:	fb043783          	ld	a5,-80(s0)
    800078fc:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    80007900:	00006797          	auipc	a5,0x6
    80007904:	9f878793          	addi	a5,a5,-1544 # 8000d2f8 <_ZN15MemoryAllocator11usedMemHeadE>
    80007908:	fb043703          	ld	a4,-80(s0)
    8000790c:	00e7b023          	sd	a4,0(a5)
    80007910:	0200006f          	j	80007930 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    80007914:	fd843783          	ld	a5,-40(s0)
    80007918:	0007b703          	ld	a4,0(a5)
    8000791c:	fb043783          	ld	a5,-80(s0)
    80007920:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    80007924:	fd843783          	ld	a5,-40(s0)
    80007928:	fb043703          	ld	a4,-80(s0)
    8000792c:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    80007930:	fb043783          	ld	a5,-80(s0)
    80007934:	0187b783          	ld	a5,24(a5)
    80007938:	0240006f          	j	8000795c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    8000793c:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80007940:	fe043783          	ld	a5,-32(s0)
    80007944:	fef43423          	sd	a5,-24(s0)
    80007948:	fe043783          	ld	a5,-32(s0)
    8000794c:	0007b783          	ld	a5,0(a5)
    80007950:	fef43023          	sd	a5,-32(s0)
    80007954:	e51ff06f          	j	800077a4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    80007958:	00000793          	li	a5,0
}
    8000795c:	00078513          	mv	a0,a5
    80007960:	05813403          	ld	s0,88(sp)
    80007964:	06010113          	addi	sp,sp,96
    80007968:	00008067          	ret

000000008000796c <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    8000796c:	fb010113          	addi	sp,sp,-80
    80007970:	04113423          	sd	ra,72(sp)
    80007974:	04813023          	sd	s0,64(sp)
    80007978:	05010413          	addi	s0,sp,80
    8000797c:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    80007980:	fb843783          	ld	a5,-72(s0)
    80007984:	00079663          	bnez	a5,80007990 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    80007988:	00000793          	li	a5,0
    8000798c:	1740006f          	j	80007b00 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    80007990:	00006797          	auipc	a5,0x6
    80007994:	96878793          	addi	a5,a5,-1688 # 8000d2f8 <_ZN15MemoryAllocator11usedMemHeadE>
    80007998:	0007b783          	ld	a5,0(a5)
    8000799c:	00079663          	bnez	a5,800079a8 <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    800079a0:	fff00793          	li	a5,-1
    800079a4:	15c0006f          	j	80007b00 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    800079a8:	fb843783          	ld	a5,-72(s0)
    800079ac:	fe078793          	addi	a5,a5,-32
    800079b0:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    800079b4:	00006797          	auipc	a5,0x6
    800079b8:	94478793          	addi	a5,a5,-1724 # 8000d2f8 <_ZN15MemoryAllocator11usedMemHeadE>
    800079bc:	0007b783          	ld	a5,0(a5)
    800079c0:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    800079c4:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    800079c8:	fe843783          	ld	a5,-24(s0)
    800079cc:	02078463          	beqz	a5,800079f4 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    800079d0:	fe843703          	ld	a4,-24(s0)
    800079d4:	fb843783          	ld	a5,-72(s0)
    800079d8:	00f70e63          	beq	a4,a5,800079f4 <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    800079dc:	fe843783          	ld	a5,-24(s0)
    800079e0:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    800079e4:	fe843783          	ld	a5,-24(s0)
    800079e8:	0007b783          	ld	a5,0(a5)
    800079ec:	fef43423          	sd	a5,-24(s0)
    800079f0:	fd9ff06f          	j	800079c8 <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    800079f4:	fe843703          	ld	a4,-24(s0)
    800079f8:	fb843783          	ld	a5,-72(s0)
    800079fc:	00f70663          	beq	a4,a5,80007a08 <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80007a00:	fff00793          	li	a5,-1
    80007a04:	0fc0006f          	j	80007b00 <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    80007a08:	fe043783          	ld	a5,-32(s0)
    80007a0c:	00078c63          	beqz	a5,80007a24 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80007a10:	fe843783          	ld	a5,-24(s0)
    80007a14:	0007b703          	ld	a4,0(a5)
    80007a18:	fe043783          	ld	a5,-32(s0)
    80007a1c:	00e7b023          	sd	a4,0(a5)
    80007a20:	0180006f          	j	80007a38 <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    80007a24:	fe843783          	ld	a5,-24(s0)
    80007a28:	0007b703          	ld	a4,0(a5)
    80007a2c:	00006797          	auipc	a5,0x6
    80007a30:	8cc78793          	addi	a5,a5,-1844 # 8000d2f8 <_ZN15MemoryAllocator11usedMemHeadE>
    80007a34:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    80007a38:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    80007a3c:	00006797          	auipc	a5,0x6
    80007a40:	8c478793          	addi	a5,a5,-1852 # 8000d300 <_ZN15MemoryAllocator11freeMemHeadE>
    80007a44:	0007b783          	ld	a5,0(a5)
    80007a48:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    80007a4c:	fd043783          	ld	a5,-48(s0)
    80007a50:	02078463          	beqz	a5,80007a78 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80007a54:	fd043703          	ld	a4,-48(s0)
    80007a58:	fb843783          	ld	a5,-72(s0)
    80007a5c:	00f77e63          	bgeu	a4,a5,80007a78 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80007a60:	fd043783          	ld	a5,-48(s0)
    80007a64:	fcf43c23          	sd	a5,-40(s0)
    80007a68:	fd043783          	ld	a5,-48(s0)
    80007a6c:	0007b783          	ld	a5,0(a5)
    80007a70:	fcf43823          	sd	a5,-48(s0)
    80007a74:	fd9ff06f          	j	80007a4c <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    80007a78:	fb843783          	ld	a5,-72(s0)
    80007a7c:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    80007a80:	fb843783          	ld	a5,-72(s0)
    80007a84:	0087b783          	ld	a5,8(a5)
    80007a88:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    80007a8c:	fc843783          	ld	a5,-56(s0)
    80007a90:	fc043703          	ld	a4,-64(s0)
    80007a94:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    80007a98:	fd843783          	ld	a5,-40(s0)
    80007a9c:	02078263          	beqz	a5,80007ac0 <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    80007aa0:	fd843783          	ld	a5,-40(s0)
    80007aa4:	0007b703          	ld	a4,0(a5)
    80007aa8:	fc843783          	ld	a5,-56(s0)
    80007aac:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    80007ab0:	fd843783          	ld	a5,-40(s0)
    80007ab4:	fc843703          	ld	a4,-56(s0)
    80007ab8:	00e7b023          	sd	a4,0(a5)
    80007abc:	0280006f          	j	80007ae4 <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    80007ac0:	00006797          	auipc	a5,0x6
    80007ac4:	84078793          	addi	a5,a5,-1984 # 8000d300 <_ZN15MemoryAllocator11freeMemHeadE>
    80007ac8:	0007b703          	ld	a4,0(a5)
    80007acc:	fc843783          	ld	a5,-56(s0)
    80007ad0:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    80007ad4:	00006797          	auipc	a5,0x6
    80007ad8:	82c78793          	addi	a5,a5,-2004 # 8000d300 <_ZN15MemoryAllocator11freeMemHeadE>
    80007adc:	fc843703          	ld	a4,-56(s0)
    80007ae0:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    80007ae4:	fc843503          	ld	a0,-56(s0)
    80007ae8:	00000097          	auipc	ra,0x0
    80007aec:	02c080e7          	jalr	44(ra) # 80007b14 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    80007af0:	fd843503          	ld	a0,-40(s0)
    80007af4:	00000097          	auipc	ra,0x0
    80007af8:	020080e7          	jalr	32(ra) # 80007b14 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    80007afc:	00000793          	li	a5,0
}
    80007b00:	00078513          	mv	a0,a5
    80007b04:	04813083          	ld	ra,72(sp)
    80007b08:	04013403          	ld	s0,64(sp)
    80007b0c:	05010113          	addi	sp,sp,80
    80007b10:	00008067          	ret

0000000080007b14 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80007b14:	fc010113          	addi	sp,sp,-64
    80007b18:	02813c23          	sd	s0,56(sp)
    80007b1c:	04010413          	addi	s0,sp,64
    80007b20:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    80007b24:	fc843783          	ld	a5,-56(s0)
    80007b28:	00079663          	bnez	a5,80007b34 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    80007b2c:	00000793          	li	a5,0
    80007b30:	0a00006f          	j	80007bd0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    80007b34:	fc843783          	ld	a5,-56(s0)
    80007b38:	0007b783          	ld	a5,0(a5)
    80007b3c:	00f037b3          	snez	a5,a5
    80007b40:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    80007b44:	fc843783          	ld	a5,-56(s0)
    80007b48:	0087b783          	ld	a5,8(a5)
    80007b4c:	fc843703          	ld	a4,-56(s0)
    80007b50:	00f707b3          	add	a5,a4,a5
    80007b54:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    80007b58:	fc843783          	ld	a5,-56(s0)
    80007b5c:	0007b783          	ld	a5,0(a5)
    80007b60:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    80007b64:	fe043703          	ld	a4,-32(s0)
    80007b68:	fd843783          	ld	a5,-40(s0)
    80007b6c:	40f707b3          	sub	a5,a4,a5
    80007b70:	0017b793          	seqz	a5,a5
    80007b74:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    80007b78:	fef44783          	lbu	a5,-17(s0)
    80007b7c:	0ff7f793          	andi	a5,a5,255
    80007b80:	04078663          	beqz	a5,80007bcc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    80007b84:	fd744783          	lbu	a5,-41(s0)
    80007b88:	0ff7f793          	andi	a5,a5,255
    80007b8c:	04078063          	beqz	a5,80007bcc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    80007b90:	fc843783          	ld	a5,-56(s0)
    80007b94:	0087b703          	ld	a4,8(a5)
    80007b98:	fc843783          	ld	a5,-56(s0)
    80007b9c:	0007b783          	ld	a5,0(a5)
    80007ba0:	0087b783          	ld	a5,8(a5)
    80007ba4:	00f70733          	add	a4,a4,a5
    80007ba8:	fc843783          	ld	a5,-56(s0)
    80007bac:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    80007bb0:	fc843783          	ld	a5,-56(s0)
    80007bb4:	0007b783          	ld	a5,0(a5)
    80007bb8:	0007b703          	ld	a4,0(a5)
    80007bbc:	fc843783          	ld	a5,-56(s0)
    80007bc0:	00e7b023          	sd	a4,0(a5)
        return 1;
    80007bc4:	00100793          	li	a5,1
    80007bc8:	0080006f          	j	80007bd0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    80007bcc:	00000793          	li	a5,0
}
    80007bd0:	00078513          	mv	a0,a5
    80007bd4:	03813403          	ld	s0,56(sp)
    80007bd8:	04010113          	addi	sp,sp,64
    80007bdc:	00008067          	ret

0000000080007be0 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80007be0:	fe010113          	addi	sp,sp,-32
    80007be4:	00813c23          	sd	s0,24(sp)
    80007be8:	02010413          	addi	s0,sp,32
    80007bec:	fea43423          	sd	a0,-24(s0)
    80007bf0:	00058793          	mv	a5,a1
    80007bf4:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80007bf8:	fe843783          	ld	a5,-24(s0)
    80007bfc:	fe078793          	addi	a5,a5,-32
    80007c00:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    80007c04:	fe843783          	ld	a5,-24(s0)
    80007c08:	0107a703          	lw	a4,16(a5)
    80007c0c:	fe442783          	lw	a5,-28(s0)
    80007c10:	0007879b          	sext.w	a5,a5
    80007c14:	40e787b3          	sub	a5,a5,a4
    80007c18:	0017b793          	seqz	a5,a5
    80007c1c:	0ff7f793          	andi	a5,a5,255
}
    80007c20:	00078513          	mv	a0,a5
    80007c24:	01813403          	ld	s0,24(sp)
    80007c28:	02010113          	addi	sp,sp,32
    80007c2c:	00008067          	ret

0000000080007c30 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    80007c30:	ff010113          	addi	sp,sp,-16
    80007c34:	00813423          	sd	s0,8(sp)
    80007c38:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    80007c3c:	00005797          	auipc	a5,0x5
    80007c40:	6cc78793          	addi	a5,a5,1740 # 8000d308 <_ZN15MemoryAllocator11initializedE>
    80007c44:	0007c783          	lbu	a5,0(a5)
    80007c48:	0017c793          	xori	a5,a5,1
    80007c4c:	0ff7f793          	andi	a5,a5,255
    80007c50:	06078a63          	beqz	a5,80007cc4 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    80007c54:	00005797          	auipc	a5,0x5
    80007c58:	4647b783          	ld	a5,1124(a5) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80007c5c:	0007b703          	ld	a4,0(a5)
    80007c60:	00005797          	auipc	a5,0x5
    80007c64:	6a078793          	addi	a5,a5,1696 # 8000d300 <_ZN15MemoryAllocator11freeMemHeadE>
    80007c68:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    80007c6c:	00005797          	auipc	a5,0x5
    80007c70:	69478793          	addi	a5,a5,1684 # 8000d300 <_ZN15MemoryAllocator11freeMemHeadE>
    80007c74:	0007b783          	ld	a5,0(a5)
    80007c78:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    80007c7c:	00005797          	auipc	a5,0x5
    80007c80:	48c7b783          	ld	a5,1164(a5) # 8000d108 <_GLOBAL_OFFSET_TABLE_+0x80>
    80007c84:	0007b703          	ld	a4,0(a5)
    80007c88:	00005797          	auipc	a5,0x5
    80007c8c:	4307b783          	ld	a5,1072(a5) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80007c90:	0007b783          	ld	a5,0(a5)
    80007c94:	40f70733          	sub	a4,a4,a5
    80007c98:	00005797          	auipc	a5,0x5
    80007c9c:	66878793          	addi	a5,a5,1640 # 8000d300 <_ZN15MemoryAllocator11freeMemHeadE>
    80007ca0:	0007b783          	ld	a5,0(a5)
    80007ca4:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    80007ca8:	00005797          	auipc	a5,0x5
    80007cac:	65078793          	addi	a5,a5,1616 # 8000d2f8 <_ZN15MemoryAllocator11usedMemHeadE>
    80007cb0:	0007b023          	sd	zero,0(a5)

        initialized = true;
    80007cb4:	00005797          	auipc	a5,0x5
    80007cb8:	65478793          	addi	a5,a5,1620 # 8000d308 <_ZN15MemoryAllocator11initializedE>
    80007cbc:	00100713          	li	a4,1
    80007cc0:	00e78023          	sb	a4,0(a5)
    }
}
    80007cc4:	00000013          	nop
    80007cc8:	00813403          	ld	s0,8(sp)
    80007ccc:	01010113          	addi	sp,sp,16
    80007cd0:	00008067          	ret

0000000080007cd4 <start>:
    80007cd4:	ff010113          	addi	sp,sp,-16
    80007cd8:	00813423          	sd	s0,8(sp)
    80007cdc:	01010413          	addi	s0,sp,16
    80007ce0:	300027f3          	csrr	a5,mstatus
    80007ce4:	ffffe737          	lui	a4,0xffffe
    80007ce8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff028f>
    80007cec:	00e7f7b3          	and	a5,a5,a4
    80007cf0:	00001737          	lui	a4,0x1
    80007cf4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80007cf8:	00e7e7b3          	or	a5,a5,a4
    80007cfc:	30079073          	csrw	mstatus,a5
    80007d00:	00000797          	auipc	a5,0x0
    80007d04:	16078793          	addi	a5,a5,352 # 80007e60 <system_main>
    80007d08:	34179073          	csrw	mepc,a5
    80007d0c:	00000793          	li	a5,0
    80007d10:	18079073          	csrw	satp,a5
    80007d14:	000107b7          	lui	a5,0x10
    80007d18:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007d1c:	30279073          	csrw	medeleg,a5
    80007d20:	30379073          	csrw	mideleg,a5
    80007d24:	104027f3          	csrr	a5,sie
    80007d28:	2227e793          	ori	a5,a5,546
    80007d2c:	10479073          	csrw	sie,a5
    80007d30:	fff00793          	li	a5,-1
    80007d34:	00a7d793          	srli	a5,a5,0xa
    80007d38:	3b079073          	csrw	pmpaddr0,a5
    80007d3c:	00f00793          	li	a5,15
    80007d40:	3a079073          	csrw	pmpcfg0,a5
    80007d44:	f14027f3          	csrr	a5,mhartid
    80007d48:	0200c737          	lui	a4,0x200c
    80007d4c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007d50:	0007869b          	sext.w	a3,a5
    80007d54:	00269713          	slli	a4,a3,0x2
    80007d58:	000f4637          	lui	a2,0xf4
    80007d5c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007d60:	00d70733          	add	a4,a4,a3
    80007d64:	0037979b          	slliw	a5,a5,0x3
    80007d68:	020046b7          	lui	a3,0x2004
    80007d6c:	00d787b3          	add	a5,a5,a3
    80007d70:	00c585b3          	add	a1,a1,a2
    80007d74:	00371693          	slli	a3,a4,0x3
    80007d78:	00005717          	auipc	a4,0x5
    80007d7c:	59870713          	addi	a4,a4,1432 # 8000d310 <timer_scratch>
    80007d80:	00b7b023          	sd	a1,0(a5)
    80007d84:	00d70733          	add	a4,a4,a3
    80007d88:	00f73c23          	sd	a5,24(a4)
    80007d8c:	02c73023          	sd	a2,32(a4)
    80007d90:	34071073          	csrw	mscratch,a4
    80007d94:	00000797          	auipc	a5,0x0
    80007d98:	6ec78793          	addi	a5,a5,1772 # 80008480 <timervec>
    80007d9c:	30579073          	csrw	mtvec,a5
    80007da0:	300027f3          	csrr	a5,mstatus
    80007da4:	0087e793          	ori	a5,a5,8
    80007da8:	30079073          	csrw	mstatus,a5
    80007dac:	304027f3          	csrr	a5,mie
    80007db0:	0807e793          	ori	a5,a5,128
    80007db4:	30479073          	csrw	mie,a5
    80007db8:	f14027f3          	csrr	a5,mhartid
    80007dbc:	0007879b          	sext.w	a5,a5
    80007dc0:	00078213          	mv	tp,a5
    80007dc4:	30200073          	mret
    80007dc8:	00813403          	ld	s0,8(sp)
    80007dcc:	01010113          	addi	sp,sp,16
    80007dd0:	00008067          	ret

0000000080007dd4 <timerinit>:
    80007dd4:	ff010113          	addi	sp,sp,-16
    80007dd8:	00813423          	sd	s0,8(sp)
    80007ddc:	01010413          	addi	s0,sp,16
    80007de0:	f14027f3          	csrr	a5,mhartid
    80007de4:	0200c737          	lui	a4,0x200c
    80007de8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007dec:	0007869b          	sext.w	a3,a5
    80007df0:	00269713          	slli	a4,a3,0x2
    80007df4:	000f4637          	lui	a2,0xf4
    80007df8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007dfc:	00d70733          	add	a4,a4,a3
    80007e00:	0037979b          	slliw	a5,a5,0x3
    80007e04:	020046b7          	lui	a3,0x2004
    80007e08:	00d787b3          	add	a5,a5,a3
    80007e0c:	00c585b3          	add	a1,a1,a2
    80007e10:	00371693          	slli	a3,a4,0x3
    80007e14:	00005717          	auipc	a4,0x5
    80007e18:	4fc70713          	addi	a4,a4,1276 # 8000d310 <timer_scratch>
    80007e1c:	00b7b023          	sd	a1,0(a5)
    80007e20:	00d70733          	add	a4,a4,a3
    80007e24:	00f73c23          	sd	a5,24(a4)
    80007e28:	02c73023          	sd	a2,32(a4)
    80007e2c:	34071073          	csrw	mscratch,a4
    80007e30:	00000797          	auipc	a5,0x0
    80007e34:	65078793          	addi	a5,a5,1616 # 80008480 <timervec>
    80007e38:	30579073          	csrw	mtvec,a5
    80007e3c:	300027f3          	csrr	a5,mstatus
    80007e40:	0087e793          	ori	a5,a5,8
    80007e44:	30079073          	csrw	mstatus,a5
    80007e48:	304027f3          	csrr	a5,mie
    80007e4c:	0807e793          	ori	a5,a5,128
    80007e50:	30479073          	csrw	mie,a5
    80007e54:	00813403          	ld	s0,8(sp)
    80007e58:	01010113          	addi	sp,sp,16
    80007e5c:	00008067          	ret

0000000080007e60 <system_main>:
    80007e60:	fe010113          	addi	sp,sp,-32
    80007e64:	00813823          	sd	s0,16(sp)
    80007e68:	00913423          	sd	s1,8(sp)
    80007e6c:	00113c23          	sd	ra,24(sp)
    80007e70:	02010413          	addi	s0,sp,32
    80007e74:	00000097          	auipc	ra,0x0
    80007e78:	0c4080e7          	jalr	196(ra) # 80007f38 <cpuid>
    80007e7c:	00005497          	auipc	s1,0x5
    80007e80:	2d448493          	addi	s1,s1,724 # 8000d150 <started>
    80007e84:	02050263          	beqz	a0,80007ea8 <system_main+0x48>
    80007e88:	0004a783          	lw	a5,0(s1)
    80007e8c:	0007879b          	sext.w	a5,a5
    80007e90:	fe078ce3          	beqz	a5,80007e88 <system_main+0x28>
    80007e94:	0ff0000f          	fence
    80007e98:	00003517          	auipc	a0,0x3
    80007e9c:	96850513          	addi	a0,a0,-1688 # 8000a800 <CONSOLE_STATUS+0x7f0>
    80007ea0:	00001097          	auipc	ra,0x1
    80007ea4:	a7c080e7          	jalr	-1412(ra) # 8000891c <panic>
    80007ea8:	00001097          	auipc	ra,0x1
    80007eac:	9d0080e7          	jalr	-1584(ra) # 80008878 <consoleinit>
    80007eb0:	00001097          	auipc	ra,0x1
    80007eb4:	15c080e7          	jalr	348(ra) # 8000900c <printfinit>
    80007eb8:	00002517          	auipc	a0,0x2
    80007ebc:	7e050513          	addi	a0,a0,2016 # 8000a698 <CONSOLE_STATUS+0x688>
    80007ec0:	00001097          	auipc	ra,0x1
    80007ec4:	ab8080e7          	jalr	-1352(ra) # 80008978 <__printf>
    80007ec8:	00003517          	auipc	a0,0x3
    80007ecc:	90850513          	addi	a0,a0,-1784 # 8000a7d0 <CONSOLE_STATUS+0x7c0>
    80007ed0:	00001097          	auipc	ra,0x1
    80007ed4:	aa8080e7          	jalr	-1368(ra) # 80008978 <__printf>
    80007ed8:	00002517          	auipc	a0,0x2
    80007edc:	7c050513          	addi	a0,a0,1984 # 8000a698 <CONSOLE_STATUS+0x688>
    80007ee0:	00001097          	auipc	ra,0x1
    80007ee4:	a98080e7          	jalr	-1384(ra) # 80008978 <__printf>
    80007ee8:	00001097          	auipc	ra,0x1
    80007eec:	4b0080e7          	jalr	1200(ra) # 80009398 <kinit>
    80007ef0:	00000097          	auipc	ra,0x0
    80007ef4:	148080e7          	jalr	328(ra) # 80008038 <trapinit>
    80007ef8:	00000097          	auipc	ra,0x0
    80007efc:	16c080e7          	jalr	364(ra) # 80008064 <trapinithart>
    80007f00:	00000097          	auipc	ra,0x0
    80007f04:	5c0080e7          	jalr	1472(ra) # 800084c0 <plicinit>
    80007f08:	00000097          	auipc	ra,0x0
    80007f0c:	5e0080e7          	jalr	1504(ra) # 800084e8 <plicinithart>
    80007f10:	00000097          	auipc	ra,0x0
    80007f14:	078080e7          	jalr	120(ra) # 80007f88 <userinit>
    80007f18:	0ff0000f          	fence
    80007f1c:	00100793          	li	a5,1
    80007f20:	00003517          	auipc	a0,0x3
    80007f24:	8c850513          	addi	a0,a0,-1848 # 8000a7e8 <CONSOLE_STATUS+0x7d8>
    80007f28:	00f4a023          	sw	a5,0(s1)
    80007f2c:	00001097          	auipc	ra,0x1
    80007f30:	a4c080e7          	jalr	-1460(ra) # 80008978 <__printf>
    80007f34:	0000006f          	j	80007f34 <system_main+0xd4>

0000000080007f38 <cpuid>:
    80007f38:	ff010113          	addi	sp,sp,-16
    80007f3c:	00813423          	sd	s0,8(sp)
    80007f40:	01010413          	addi	s0,sp,16
    80007f44:	00020513          	mv	a0,tp
    80007f48:	00813403          	ld	s0,8(sp)
    80007f4c:	0005051b          	sext.w	a0,a0
    80007f50:	01010113          	addi	sp,sp,16
    80007f54:	00008067          	ret

0000000080007f58 <mycpu>:
    80007f58:	ff010113          	addi	sp,sp,-16
    80007f5c:	00813423          	sd	s0,8(sp)
    80007f60:	01010413          	addi	s0,sp,16
    80007f64:	00020793          	mv	a5,tp
    80007f68:	00813403          	ld	s0,8(sp)
    80007f6c:	0007879b          	sext.w	a5,a5
    80007f70:	00779793          	slli	a5,a5,0x7
    80007f74:	00006517          	auipc	a0,0x6
    80007f78:	3cc50513          	addi	a0,a0,972 # 8000e340 <cpus>
    80007f7c:	00f50533          	add	a0,a0,a5
    80007f80:	01010113          	addi	sp,sp,16
    80007f84:	00008067          	ret

0000000080007f88 <userinit>:
    80007f88:	ff010113          	addi	sp,sp,-16
    80007f8c:	00813423          	sd	s0,8(sp)
    80007f90:	01010413          	addi	s0,sp,16
    80007f94:	00813403          	ld	s0,8(sp)
    80007f98:	01010113          	addi	sp,sp,16
    80007f9c:	ffffa317          	auipc	t1,0xffffa
    80007fa0:	48030067          	jr	1152(t1) # 8000241c <main>

0000000080007fa4 <either_copyout>:
    80007fa4:	ff010113          	addi	sp,sp,-16
    80007fa8:	00813023          	sd	s0,0(sp)
    80007fac:	00113423          	sd	ra,8(sp)
    80007fb0:	01010413          	addi	s0,sp,16
    80007fb4:	02051663          	bnez	a0,80007fe0 <either_copyout+0x3c>
    80007fb8:	00058513          	mv	a0,a1
    80007fbc:	00060593          	mv	a1,a2
    80007fc0:	0006861b          	sext.w	a2,a3
    80007fc4:	00002097          	auipc	ra,0x2
    80007fc8:	c60080e7          	jalr	-928(ra) # 80009c24 <__memmove>
    80007fcc:	00813083          	ld	ra,8(sp)
    80007fd0:	00013403          	ld	s0,0(sp)
    80007fd4:	00000513          	li	a0,0
    80007fd8:	01010113          	addi	sp,sp,16
    80007fdc:	00008067          	ret
    80007fe0:	00003517          	auipc	a0,0x3
    80007fe4:	84850513          	addi	a0,a0,-1976 # 8000a828 <CONSOLE_STATUS+0x818>
    80007fe8:	00001097          	auipc	ra,0x1
    80007fec:	934080e7          	jalr	-1740(ra) # 8000891c <panic>

0000000080007ff0 <either_copyin>:
    80007ff0:	ff010113          	addi	sp,sp,-16
    80007ff4:	00813023          	sd	s0,0(sp)
    80007ff8:	00113423          	sd	ra,8(sp)
    80007ffc:	01010413          	addi	s0,sp,16
    80008000:	02059463          	bnez	a1,80008028 <either_copyin+0x38>
    80008004:	00060593          	mv	a1,a2
    80008008:	0006861b          	sext.w	a2,a3
    8000800c:	00002097          	auipc	ra,0x2
    80008010:	c18080e7          	jalr	-1000(ra) # 80009c24 <__memmove>
    80008014:	00813083          	ld	ra,8(sp)
    80008018:	00013403          	ld	s0,0(sp)
    8000801c:	00000513          	li	a0,0
    80008020:	01010113          	addi	sp,sp,16
    80008024:	00008067          	ret
    80008028:	00003517          	auipc	a0,0x3
    8000802c:	82850513          	addi	a0,a0,-2008 # 8000a850 <CONSOLE_STATUS+0x840>
    80008030:	00001097          	auipc	ra,0x1
    80008034:	8ec080e7          	jalr	-1812(ra) # 8000891c <panic>

0000000080008038 <trapinit>:
    80008038:	ff010113          	addi	sp,sp,-16
    8000803c:	00813423          	sd	s0,8(sp)
    80008040:	01010413          	addi	s0,sp,16
    80008044:	00813403          	ld	s0,8(sp)
    80008048:	00003597          	auipc	a1,0x3
    8000804c:	83058593          	addi	a1,a1,-2000 # 8000a878 <CONSOLE_STATUS+0x868>
    80008050:	00006517          	auipc	a0,0x6
    80008054:	37050513          	addi	a0,a0,880 # 8000e3c0 <tickslock>
    80008058:	01010113          	addi	sp,sp,16
    8000805c:	00001317          	auipc	t1,0x1
    80008060:	5cc30067          	jr	1484(t1) # 80009628 <initlock>

0000000080008064 <trapinithart>:
    80008064:	ff010113          	addi	sp,sp,-16
    80008068:	00813423          	sd	s0,8(sp)
    8000806c:	01010413          	addi	s0,sp,16
    80008070:	00000797          	auipc	a5,0x0
    80008074:	30078793          	addi	a5,a5,768 # 80008370 <kernelvec>
    80008078:	10579073          	csrw	stvec,a5
    8000807c:	00813403          	ld	s0,8(sp)
    80008080:	01010113          	addi	sp,sp,16
    80008084:	00008067          	ret

0000000080008088 <usertrap>:
    80008088:	ff010113          	addi	sp,sp,-16
    8000808c:	00813423          	sd	s0,8(sp)
    80008090:	01010413          	addi	s0,sp,16
    80008094:	00813403          	ld	s0,8(sp)
    80008098:	01010113          	addi	sp,sp,16
    8000809c:	00008067          	ret

00000000800080a0 <usertrapret>:
    800080a0:	ff010113          	addi	sp,sp,-16
    800080a4:	00813423          	sd	s0,8(sp)
    800080a8:	01010413          	addi	s0,sp,16
    800080ac:	00813403          	ld	s0,8(sp)
    800080b0:	01010113          	addi	sp,sp,16
    800080b4:	00008067          	ret

00000000800080b8 <kerneltrap>:
    800080b8:	fe010113          	addi	sp,sp,-32
    800080bc:	00813823          	sd	s0,16(sp)
    800080c0:	00113c23          	sd	ra,24(sp)
    800080c4:	00913423          	sd	s1,8(sp)
    800080c8:	02010413          	addi	s0,sp,32
    800080cc:	142025f3          	csrr	a1,scause
    800080d0:	100027f3          	csrr	a5,sstatus
    800080d4:	0027f793          	andi	a5,a5,2
    800080d8:	10079c63          	bnez	a5,800081f0 <kerneltrap+0x138>
    800080dc:	142027f3          	csrr	a5,scause
    800080e0:	0207ce63          	bltz	a5,8000811c <kerneltrap+0x64>
    800080e4:	00002517          	auipc	a0,0x2
    800080e8:	7dc50513          	addi	a0,a0,2012 # 8000a8c0 <CONSOLE_STATUS+0x8b0>
    800080ec:	00001097          	auipc	ra,0x1
    800080f0:	88c080e7          	jalr	-1908(ra) # 80008978 <__printf>
    800080f4:	141025f3          	csrr	a1,sepc
    800080f8:	14302673          	csrr	a2,stval
    800080fc:	00002517          	auipc	a0,0x2
    80008100:	7d450513          	addi	a0,a0,2004 # 8000a8d0 <CONSOLE_STATUS+0x8c0>
    80008104:	00001097          	auipc	ra,0x1
    80008108:	874080e7          	jalr	-1932(ra) # 80008978 <__printf>
    8000810c:	00002517          	auipc	a0,0x2
    80008110:	7dc50513          	addi	a0,a0,2012 # 8000a8e8 <CONSOLE_STATUS+0x8d8>
    80008114:	00001097          	auipc	ra,0x1
    80008118:	808080e7          	jalr	-2040(ra) # 8000891c <panic>
    8000811c:	0ff7f713          	andi	a4,a5,255
    80008120:	00900693          	li	a3,9
    80008124:	04d70063          	beq	a4,a3,80008164 <kerneltrap+0xac>
    80008128:	fff00713          	li	a4,-1
    8000812c:	03f71713          	slli	a4,a4,0x3f
    80008130:	00170713          	addi	a4,a4,1
    80008134:	fae798e3          	bne	a5,a4,800080e4 <kerneltrap+0x2c>
    80008138:	00000097          	auipc	ra,0x0
    8000813c:	e00080e7          	jalr	-512(ra) # 80007f38 <cpuid>
    80008140:	06050663          	beqz	a0,800081ac <kerneltrap+0xf4>
    80008144:	144027f3          	csrr	a5,sip
    80008148:	ffd7f793          	andi	a5,a5,-3
    8000814c:	14479073          	csrw	sip,a5
    80008150:	01813083          	ld	ra,24(sp)
    80008154:	01013403          	ld	s0,16(sp)
    80008158:	00813483          	ld	s1,8(sp)
    8000815c:	02010113          	addi	sp,sp,32
    80008160:	00008067          	ret
    80008164:	00000097          	auipc	ra,0x0
    80008168:	3d0080e7          	jalr	976(ra) # 80008534 <plic_claim>
    8000816c:	00a00793          	li	a5,10
    80008170:	00050493          	mv	s1,a0
    80008174:	06f50863          	beq	a0,a5,800081e4 <kerneltrap+0x12c>
    80008178:	fc050ce3          	beqz	a0,80008150 <kerneltrap+0x98>
    8000817c:	00050593          	mv	a1,a0
    80008180:	00002517          	auipc	a0,0x2
    80008184:	72050513          	addi	a0,a0,1824 # 8000a8a0 <CONSOLE_STATUS+0x890>
    80008188:	00000097          	auipc	ra,0x0
    8000818c:	7f0080e7          	jalr	2032(ra) # 80008978 <__printf>
    80008190:	01013403          	ld	s0,16(sp)
    80008194:	01813083          	ld	ra,24(sp)
    80008198:	00048513          	mv	a0,s1
    8000819c:	00813483          	ld	s1,8(sp)
    800081a0:	02010113          	addi	sp,sp,32
    800081a4:	00000317          	auipc	t1,0x0
    800081a8:	3c830067          	jr	968(t1) # 8000856c <plic_complete>
    800081ac:	00006517          	auipc	a0,0x6
    800081b0:	21450513          	addi	a0,a0,532 # 8000e3c0 <tickslock>
    800081b4:	00001097          	auipc	ra,0x1
    800081b8:	498080e7          	jalr	1176(ra) # 8000964c <acquire>
    800081bc:	00005717          	auipc	a4,0x5
    800081c0:	f9870713          	addi	a4,a4,-104 # 8000d154 <ticks>
    800081c4:	00072783          	lw	a5,0(a4)
    800081c8:	00006517          	auipc	a0,0x6
    800081cc:	1f850513          	addi	a0,a0,504 # 8000e3c0 <tickslock>
    800081d0:	0017879b          	addiw	a5,a5,1
    800081d4:	00f72023          	sw	a5,0(a4)
    800081d8:	00001097          	auipc	ra,0x1
    800081dc:	540080e7          	jalr	1344(ra) # 80009718 <release>
    800081e0:	f65ff06f          	j	80008144 <kerneltrap+0x8c>
    800081e4:	00001097          	auipc	ra,0x1
    800081e8:	09c080e7          	jalr	156(ra) # 80009280 <uartintr>
    800081ec:	fa5ff06f          	j	80008190 <kerneltrap+0xd8>
    800081f0:	00002517          	auipc	a0,0x2
    800081f4:	69050513          	addi	a0,a0,1680 # 8000a880 <CONSOLE_STATUS+0x870>
    800081f8:	00000097          	auipc	ra,0x0
    800081fc:	724080e7          	jalr	1828(ra) # 8000891c <panic>

0000000080008200 <clockintr>:
    80008200:	fe010113          	addi	sp,sp,-32
    80008204:	00813823          	sd	s0,16(sp)
    80008208:	00913423          	sd	s1,8(sp)
    8000820c:	00113c23          	sd	ra,24(sp)
    80008210:	02010413          	addi	s0,sp,32
    80008214:	00006497          	auipc	s1,0x6
    80008218:	1ac48493          	addi	s1,s1,428 # 8000e3c0 <tickslock>
    8000821c:	00048513          	mv	a0,s1
    80008220:	00001097          	auipc	ra,0x1
    80008224:	42c080e7          	jalr	1068(ra) # 8000964c <acquire>
    80008228:	00005717          	auipc	a4,0x5
    8000822c:	f2c70713          	addi	a4,a4,-212 # 8000d154 <ticks>
    80008230:	00072783          	lw	a5,0(a4)
    80008234:	01013403          	ld	s0,16(sp)
    80008238:	01813083          	ld	ra,24(sp)
    8000823c:	00048513          	mv	a0,s1
    80008240:	0017879b          	addiw	a5,a5,1
    80008244:	00813483          	ld	s1,8(sp)
    80008248:	00f72023          	sw	a5,0(a4)
    8000824c:	02010113          	addi	sp,sp,32
    80008250:	00001317          	auipc	t1,0x1
    80008254:	4c830067          	jr	1224(t1) # 80009718 <release>

0000000080008258 <devintr>:
    80008258:	142027f3          	csrr	a5,scause
    8000825c:	00000513          	li	a0,0
    80008260:	0007c463          	bltz	a5,80008268 <devintr+0x10>
    80008264:	00008067          	ret
    80008268:	fe010113          	addi	sp,sp,-32
    8000826c:	00813823          	sd	s0,16(sp)
    80008270:	00113c23          	sd	ra,24(sp)
    80008274:	00913423          	sd	s1,8(sp)
    80008278:	02010413          	addi	s0,sp,32
    8000827c:	0ff7f713          	andi	a4,a5,255
    80008280:	00900693          	li	a3,9
    80008284:	04d70c63          	beq	a4,a3,800082dc <devintr+0x84>
    80008288:	fff00713          	li	a4,-1
    8000828c:	03f71713          	slli	a4,a4,0x3f
    80008290:	00170713          	addi	a4,a4,1
    80008294:	00e78c63          	beq	a5,a4,800082ac <devintr+0x54>
    80008298:	01813083          	ld	ra,24(sp)
    8000829c:	01013403          	ld	s0,16(sp)
    800082a0:	00813483          	ld	s1,8(sp)
    800082a4:	02010113          	addi	sp,sp,32
    800082a8:	00008067          	ret
    800082ac:	00000097          	auipc	ra,0x0
    800082b0:	c8c080e7          	jalr	-884(ra) # 80007f38 <cpuid>
    800082b4:	06050663          	beqz	a0,80008320 <devintr+0xc8>
    800082b8:	144027f3          	csrr	a5,sip
    800082bc:	ffd7f793          	andi	a5,a5,-3
    800082c0:	14479073          	csrw	sip,a5
    800082c4:	01813083          	ld	ra,24(sp)
    800082c8:	01013403          	ld	s0,16(sp)
    800082cc:	00813483          	ld	s1,8(sp)
    800082d0:	00200513          	li	a0,2
    800082d4:	02010113          	addi	sp,sp,32
    800082d8:	00008067          	ret
    800082dc:	00000097          	auipc	ra,0x0
    800082e0:	258080e7          	jalr	600(ra) # 80008534 <plic_claim>
    800082e4:	00a00793          	li	a5,10
    800082e8:	00050493          	mv	s1,a0
    800082ec:	06f50663          	beq	a0,a5,80008358 <devintr+0x100>
    800082f0:	00100513          	li	a0,1
    800082f4:	fa0482e3          	beqz	s1,80008298 <devintr+0x40>
    800082f8:	00048593          	mv	a1,s1
    800082fc:	00002517          	auipc	a0,0x2
    80008300:	5a450513          	addi	a0,a0,1444 # 8000a8a0 <CONSOLE_STATUS+0x890>
    80008304:	00000097          	auipc	ra,0x0
    80008308:	674080e7          	jalr	1652(ra) # 80008978 <__printf>
    8000830c:	00048513          	mv	a0,s1
    80008310:	00000097          	auipc	ra,0x0
    80008314:	25c080e7          	jalr	604(ra) # 8000856c <plic_complete>
    80008318:	00100513          	li	a0,1
    8000831c:	f7dff06f          	j	80008298 <devintr+0x40>
    80008320:	00006517          	auipc	a0,0x6
    80008324:	0a050513          	addi	a0,a0,160 # 8000e3c0 <tickslock>
    80008328:	00001097          	auipc	ra,0x1
    8000832c:	324080e7          	jalr	804(ra) # 8000964c <acquire>
    80008330:	00005717          	auipc	a4,0x5
    80008334:	e2470713          	addi	a4,a4,-476 # 8000d154 <ticks>
    80008338:	00072783          	lw	a5,0(a4)
    8000833c:	00006517          	auipc	a0,0x6
    80008340:	08450513          	addi	a0,a0,132 # 8000e3c0 <tickslock>
    80008344:	0017879b          	addiw	a5,a5,1
    80008348:	00f72023          	sw	a5,0(a4)
    8000834c:	00001097          	auipc	ra,0x1
    80008350:	3cc080e7          	jalr	972(ra) # 80009718 <release>
    80008354:	f65ff06f          	j	800082b8 <devintr+0x60>
    80008358:	00001097          	auipc	ra,0x1
    8000835c:	f28080e7          	jalr	-216(ra) # 80009280 <uartintr>
    80008360:	fadff06f          	j	8000830c <devintr+0xb4>
	...

0000000080008370 <kernelvec>:
    80008370:	f0010113          	addi	sp,sp,-256
    80008374:	00113023          	sd	ra,0(sp)
    80008378:	00213423          	sd	sp,8(sp)
    8000837c:	00313823          	sd	gp,16(sp)
    80008380:	00413c23          	sd	tp,24(sp)
    80008384:	02513023          	sd	t0,32(sp)
    80008388:	02613423          	sd	t1,40(sp)
    8000838c:	02713823          	sd	t2,48(sp)
    80008390:	02813c23          	sd	s0,56(sp)
    80008394:	04913023          	sd	s1,64(sp)
    80008398:	04a13423          	sd	a0,72(sp)
    8000839c:	04b13823          	sd	a1,80(sp)
    800083a0:	04c13c23          	sd	a2,88(sp)
    800083a4:	06d13023          	sd	a3,96(sp)
    800083a8:	06e13423          	sd	a4,104(sp)
    800083ac:	06f13823          	sd	a5,112(sp)
    800083b0:	07013c23          	sd	a6,120(sp)
    800083b4:	09113023          	sd	a7,128(sp)
    800083b8:	09213423          	sd	s2,136(sp)
    800083bc:	09313823          	sd	s3,144(sp)
    800083c0:	09413c23          	sd	s4,152(sp)
    800083c4:	0b513023          	sd	s5,160(sp)
    800083c8:	0b613423          	sd	s6,168(sp)
    800083cc:	0b713823          	sd	s7,176(sp)
    800083d0:	0b813c23          	sd	s8,184(sp)
    800083d4:	0d913023          	sd	s9,192(sp)
    800083d8:	0da13423          	sd	s10,200(sp)
    800083dc:	0db13823          	sd	s11,208(sp)
    800083e0:	0dc13c23          	sd	t3,216(sp)
    800083e4:	0fd13023          	sd	t4,224(sp)
    800083e8:	0fe13423          	sd	t5,232(sp)
    800083ec:	0ff13823          	sd	t6,240(sp)
    800083f0:	cc9ff0ef          	jal	ra,800080b8 <kerneltrap>
    800083f4:	00013083          	ld	ra,0(sp)
    800083f8:	00813103          	ld	sp,8(sp)
    800083fc:	01013183          	ld	gp,16(sp)
    80008400:	02013283          	ld	t0,32(sp)
    80008404:	02813303          	ld	t1,40(sp)
    80008408:	03013383          	ld	t2,48(sp)
    8000840c:	03813403          	ld	s0,56(sp)
    80008410:	04013483          	ld	s1,64(sp)
    80008414:	04813503          	ld	a0,72(sp)
    80008418:	05013583          	ld	a1,80(sp)
    8000841c:	05813603          	ld	a2,88(sp)
    80008420:	06013683          	ld	a3,96(sp)
    80008424:	06813703          	ld	a4,104(sp)
    80008428:	07013783          	ld	a5,112(sp)
    8000842c:	07813803          	ld	a6,120(sp)
    80008430:	08013883          	ld	a7,128(sp)
    80008434:	08813903          	ld	s2,136(sp)
    80008438:	09013983          	ld	s3,144(sp)
    8000843c:	09813a03          	ld	s4,152(sp)
    80008440:	0a013a83          	ld	s5,160(sp)
    80008444:	0a813b03          	ld	s6,168(sp)
    80008448:	0b013b83          	ld	s7,176(sp)
    8000844c:	0b813c03          	ld	s8,184(sp)
    80008450:	0c013c83          	ld	s9,192(sp)
    80008454:	0c813d03          	ld	s10,200(sp)
    80008458:	0d013d83          	ld	s11,208(sp)
    8000845c:	0d813e03          	ld	t3,216(sp)
    80008460:	0e013e83          	ld	t4,224(sp)
    80008464:	0e813f03          	ld	t5,232(sp)
    80008468:	0f013f83          	ld	t6,240(sp)
    8000846c:	10010113          	addi	sp,sp,256
    80008470:	10200073          	sret
    80008474:	00000013          	nop
    80008478:	00000013          	nop
    8000847c:	00000013          	nop

0000000080008480 <timervec>:
    80008480:	34051573          	csrrw	a0,mscratch,a0
    80008484:	00b53023          	sd	a1,0(a0)
    80008488:	00c53423          	sd	a2,8(a0)
    8000848c:	00d53823          	sd	a3,16(a0)
    80008490:	01853583          	ld	a1,24(a0)
    80008494:	02053603          	ld	a2,32(a0)
    80008498:	0005b683          	ld	a3,0(a1)
    8000849c:	00c686b3          	add	a3,a3,a2
    800084a0:	00d5b023          	sd	a3,0(a1)
    800084a4:	00200593          	li	a1,2
    800084a8:	14459073          	csrw	sip,a1
    800084ac:	01053683          	ld	a3,16(a0)
    800084b0:	00853603          	ld	a2,8(a0)
    800084b4:	00053583          	ld	a1,0(a0)
    800084b8:	34051573          	csrrw	a0,mscratch,a0
    800084bc:	30200073          	mret

00000000800084c0 <plicinit>:
    800084c0:	ff010113          	addi	sp,sp,-16
    800084c4:	00813423          	sd	s0,8(sp)
    800084c8:	01010413          	addi	s0,sp,16
    800084cc:	00813403          	ld	s0,8(sp)
    800084d0:	0c0007b7          	lui	a5,0xc000
    800084d4:	00100713          	li	a4,1
    800084d8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800084dc:	00e7a223          	sw	a4,4(a5)
    800084e0:	01010113          	addi	sp,sp,16
    800084e4:	00008067          	ret

00000000800084e8 <plicinithart>:
    800084e8:	ff010113          	addi	sp,sp,-16
    800084ec:	00813023          	sd	s0,0(sp)
    800084f0:	00113423          	sd	ra,8(sp)
    800084f4:	01010413          	addi	s0,sp,16
    800084f8:	00000097          	auipc	ra,0x0
    800084fc:	a40080e7          	jalr	-1472(ra) # 80007f38 <cpuid>
    80008500:	0085171b          	slliw	a4,a0,0x8
    80008504:	0c0027b7          	lui	a5,0xc002
    80008508:	00e787b3          	add	a5,a5,a4
    8000850c:	40200713          	li	a4,1026
    80008510:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80008514:	00813083          	ld	ra,8(sp)
    80008518:	00013403          	ld	s0,0(sp)
    8000851c:	00d5151b          	slliw	a0,a0,0xd
    80008520:	0c2017b7          	lui	a5,0xc201
    80008524:	00a78533          	add	a0,a5,a0
    80008528:	00052023          	sw	zero,0(a0)
    8000852c:	01010113          	addi	sp,sp,16
    80008530:	00008067          	ret

0000000080008534 <plic_claim>:
    80008534:	ff010113          	addi	sp,sp,-16
    80008538:	00813023          	sd	s0,0(sp)
    8000853c:	00113423          	sd	ra,8(sp)
    80008540:	01010413          	addi	s0,sp,16
    80008544:	00000097          	auipc	ra,0x0
    80008548:	9f4080e7          	jalr	-1548(ra) # 80007f38 <cpuid>
    8000854c:	00813083          	ld	ra,8(sp)
    80008550:	00013403          	ld	s0,0(sp)
    80008554:	00d5151b          	slliw	a0,a0,0xd
    80008558:	0c2017b7          	lui	a5,0xc201
    8000855c:	00a78533          	add	a0,a5,a0
    80008560:	00452503          	lw	a0,4(a0)
    80008564:	01010113          	addi	sp,sp,16
    80008568:	00008067          	ret

000000008000856c <plic_complete>:
    8000856c:	fe010113          	addi	sp,sp,-32
    80008570:	00813823          	sd	s0,16(sp)
    80008574:	00913423          	sd	s1,8(sp)
    80008578:	00113c23          	sd	ra,24(sp)
    8000857c:	02010413          	addi	s0,sp,32
    80008580:	00050493          	mv	s1,a0
    80008584:	00000097          	auipc	ra,0x0
    80008588:	9b4080e7          	jalr	-1612(ra) # 80007f38 <cpuid>
    8000858c:	01813083          	ld	ra,24(sp)
    80008590:	01013403          	ld	s0,16(sp)
    80008594:	00d5179b          	slliw	a5,a0,0xd
    80008598:	0c201737          	lui	a4,0xc201
    8000859c:	00f707b3          	add	a5,a4,a5
    800085a0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800085a4:	00813483          	ld	s1,8(sp)
    800085a8:	02010113          	addi	sp,sp,32
    800085ac:	00008067          	ret

00000000800085b0 <consolewrite>:
    800085b0:	fb010113          	addi	sp,sp,-80
    800085b4:	04813023          	sd	s0,64(sp)
    800085b8:	04113423          	sd	ra,72(sp)
    800085bc:	02913c23          	sd	s1,56(sp)
    800085c0:	03213823          	sd	s2,48(sp)
    800085c4:	03313423          	sd	s3,40(sp)
    800085c8:	03413023          	sd	s4,32(sp)
    800085cc:	01513c23          	sd	s5,24(sp)
    800085d0:	05010413          	addi	s0,sp,80
    800085d4:	06c05c63          	blez	a2,8000864c <consolewrite+0x9c>
    800085d8:	00060993          	mv	s3,a2
    800085dc:	00050a13          	mv	s4,a0
    800085e0:	00058493          	mv	s1,a1
    800085e4:	00000913          	li	s2,0
    800085e8:	fff00a93          	li	s5,-1
    800085ec:	01c0006f          	j	80008608 <consolewrite+0x58>
    800085f0:	fbf44503          	lbu	a0,-65(s0)
    800085f4:	0019091b          	addiw	s2,s2,1
    800085f8:	00148493          	addi	s1,s1,1
    800085fc:	00001097          	auipc	ra,0x1
    80008600:	a9c080e7          	jalr	-1380(ra) # 80009098 <uartputc>
    80008604:	03298063          	beq	s3,s2,80008624 <consolewrite+0x74>
    80008608:	00048613          	mv	a2,s1
    8000860c:	00100693          	li	a3,1
    80008610:	000a0593          	mv	a1,s4
    80008614:	fbf40513          	addi	a0,s0,-65
    80008618:	00000097          	auipc	ra,0x0
    8000861c:	9d8080e7          	jalr	-1576(ra) # 80007ff0 <either_copyin>
    80008620:	fd5518e3          	bne	a0,s5,800085f0 <consolewrite+0x40>
    80008624:	04813083          	ld	ra,72(sp)
    80008628:	04013403          	ld	s0,64(sp)
    8000862c:	03813483          	ld	s1,56(sp)
    80008630:	02813983          	ld	s3,40(sp)
    80008634:	02013a03          	ld	s4,32(sp)
    80008638:	01813a83          	ld	s5,24(sp)
    8000863c:	00090513          	mv	a0,s2
    80008640:	03013903          	ld	s2,48(sp)
    80008644:	05010113          	addi	sp,sp,80
    80008648:	00008067          	ret
    8000864c:	00000913          	li	s2,0
    80008650:	fd5ff06f          	j	80008624 <consolewrite+0x74>

0000000080008654 <consoleread>:
    80008654:	f9010113          	addi	sp,sp,-112
    80008658:	06813023          	sd	s0,96(sp)
    8000865c:	04913c23          	sd	s1,88(sp)
    80008660:	05213823          	sd	s2,80(sp)
    80008664:	05313423          	sd	s3,72(sp)
    80008668:	05413023          	sd	s4,64(sp)
    8000866c:	03513c23          	sd	s5,56(sp)
    80008670:	03613823          	sd	s6,48(sp)
    80008674:	03713423          	sd	s7,40(sp)
    80008678:	03813023          	sd	s8,32(sp)
    8000867c:	06113423          	sd	ra,104(sp)
    80008680:	01913c23          	sd	s9,24(sp)
    80008684:	07010413          	addi	s0,sp,112
    80008688:	00060b93          	mv	s7,a2
    8000868c:	00050913          	mv	s2,a0
    80008690:	00058c13          	mv	s8,a1
    80008694:	00060b1b          	sext.w	s6,a2
    80008698:	00006497          	auipc	s1,0x6
    8000869c:	d5048493          	addi	s1,s1,-688 # 8000e3e8 <cons>
    800086a0:	00400993          	li	s3,4
    800086a4:	fff00a13          	li	s4,-1
    800086a8:	00a00a93          	li	s5,10
    800086ac:	05705e63          	blez	s7,80008708 <consoleread+0xb4>
    800086b0:	09c4a703          	lw	a4,156(s1)
    800086b4:	0984a783          	lw	a5,152(s1)
    800086b8:	0007071b          	sext.w	a4,a4
    800086bc:	08e78463          	beq	a5,a4,80008744 <consoleread+0xf0>
    800086c0:	07f7f713          	andi	a4,a5,127
    800086c4:	00e48733          	add	a4,s1,a4
    800086c8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800086cc:	0017869b          	addiw	a3,a5,1
    800086d0:	08d4ac23          	sw	a3,152(s1)
    800086d4:	00070c9b          	sext.w	s9,a4
    800086d8:	0b370663          	beq	a4,s3,80008784 <consoleread+0x130>
    800086dc:	00100693          	li	a3,1
    800086e0:	f9f40613          	addi	a2,s0,-97
    800086e4:	000c0593          	mv	a1,s8
    800086e8:	00090513          	mv	a0,s2
    800086ec:	f8e40fa3          	sb	a4,-97(s0)
    800086f0:	00000097          	auipc	ra,0x0
    800086f4:	8b4080e7          	jalr	-1868(ra) # 80007fa4 <either_copyout>
    800086f8:	01450863          	beq	a0,s4,80008708 <consoleread+0xb4>
    800086fc:	001c0c13          	addi	s8,s8,1
    80008700:	fffb8b9b          	addiw	s7,s7,-1
    80008704:	fb5c94e3          	bne	s9,s5,800086ac <consoleread+0x58>
    80008708:	000b851b          	sext.w	a0,s7
    8000870c:	06813083          	ld	ra,104(sp)
    80008710:	06013403          	ld	s0,96(sp)
    80008714:	05813483          	ld	s1,88(sp)
    80008718:	05013903          	ld	s2,80(sp)
    8000871c:	04813983          	ld	s3,72(sp)
    80008720:	04013a03          	ld	s4,64(sp)
    80008724:	03813a83          	ld	s5,56(sp)
    80008728:	02813b83          	ld	s7,40(sp)
    8000872c:	02013c03          	ld	s8,32(sp)
    80008730:	01813c83          	ld	s9,24(sp)
    80008734:	40ab053b          	subw	a0,s6,a0
    80008738:	03013b03          	ld	s6,48(sp)
    8000873c:	07010113          	addi	sp,sp,112
    80008740:	00008067          	ret
    80008744:	00001097          	auipc	ra,0x1
    80008748:	1d8080e7          	jalr	472(ra) # 8000991c <push_on>
    8000874c:	0984a703          	lw	a4,152(s1)
    80008750:	09c4a783          	lw	a5,156(s1)
    80008754:	0007879b          	sext.w	a5,a5
    80008758:	fef70ce3          	beq	a4,a5,80008750 <consoleread+0xfc>
    8000875c:	00001097          	auipc	ra,0x1
    80008760:	234080e7          	jalr	564(ra) # 80009990 <pop_on>
    80008764:	0984a783          	lw	a5,152(s1)
    80008768:	07f7f713          	andi	a4,a5,127
    8000876c:	00e48733          	add	a4,s1,a4
    80008770:	01874703          	lbu	a4,24(a4)
    80008774:	0017869b          	addiw	a3,a5,1
    80008778:	08d4ac23          	sw	a3,152(s1)
    8000877c:	00070c9b          	sext.w	s9,a4
    80008780:	f5371ee3          	bne	a4,s3,800086dc <consoleread+0x88>
    80008784:	000b851b          	sext.w	a0,s7
    80008788:	f96bf2e3          	bgeu	s7,s6,8000870c <consoleread+0xb8>
    8000878c:	08f4ac23          	sw	a5,152(s1)
    80008790:	f7dff06f          	j	8000870c <consoleread+0xb8>

0000000080008794 <consputc>:
    80008794:	10000793          	li	a5,256
    80008798:	00f50663          	beq	a0,a5,800087a4 <consputc+0x10>
    8000879c:	00001317          	auipc	t1,0x1
    800087a0:	9f430067          	jr	-1548(t1) # 80009190 <uartputc_sync>
    800087a4:	ff010113          	addi	sp,sp,-16
    800087a8:	00113423          	sd	ra,8(sp)
    800087ac:	00813023          	sd	s0,0(sp)
    800087b0:	01010413          	addi	s0,sp,16
    800087b4:	00800513          	li	a0,8
    800087b8:	00001097          	auipc	ra,0x1
    800087bc:	9d8080e7          	jalr	-1576(ra) # 80009190 <uartputc_sync>
    800087c0:	02000513          	li	a0,32
    800087c4:	00001097          	auipc	ra,0x1
    800087c8:	9cc080e7          	jalr	-1588(ra) # 80009190 <uartputc_sync>
    800087cc:	00013403          	ld	s0,0(sp)
    800087d0:	00813083          	ld	ra,8(sp)
    800087d4:	00800513          	li	a0,8
    800087d8:	01010113          	addi	sp,sp,16
    800087dc:	00001317          	auipc	t1,0x1
    800087e0:	9b430067          	jr	-1612(t1) # 80009190 <uartputc_sync>

00000000800087e4 <consoleintr>:
    800087e4:	fe010113          	addi	sp,sp,-32
    800087e8:	00813823          	sd	s0,16(sp)
    800087ec:	00913423          	sd	s1,8(sp)
    800087f0:	01213023          	sd	s2,0(sp)
    800087f4:	00113c23          	sd	ra,24(sp)
    800087f8:	02010413          	addi	s0,sp,32
    800087fc:	00006917          	auipc	s2,0x6
    80008800:	bec90913          	addi	s2,s2,-1044 # 8000e3e8 <cons>
    80008804:	00050493          	mv	s1,a0
    80008808:	00090513          	mv	a0,s2
    8000880c:	00001097          	auipc	ra,0x1
    80008810:	e40080e7          	jalr	-448(ra) # 8000964c <acquire>
    80008814:	02048c63          	beqz	s1,8000884c <consoleintr+0x68>
    80008818:	0a092783          	lw	a5,160(s2)
    8000881c:	09892703          	lw	a4,152(s2)
    80008820:	07f00693          	li	a3,127
    80008824:	40e7873b          	subw	a4,a5,a4
    80008828:	02e6e263          	bltu	a3,a4,8000884c <consoleintr+0x68>
    8000882c:	00d00713          	li	a4,13
    80008830:	04e48063          	beq	s1,a4,80008870 <consoleintr+0x8c>
    80008834:	07f7f713          	andi	a4,a5,127
    80008838:	00e90733          	add	a4,s2,a4
    8000883c:	0017879b          	addiw	a5,a5,1
    80008840:	0af92023          	sw	a5,160(s2)
    80008844:	00970c23          	sb	s1,24(a4)
    80008848:	08f92e23          	sw	a5,156(s2)
    8000884c:	01013403          	ld	s0,16(sp)
    80008850:	01813083          	ld	ra,24(sp)
    80008854:	00813483          	ld	s1,8(sp)
    80008858:	00013903          	ld	s2,0(sp)
    8000885c:	00006517          	auipc	a0,0x6
    80008860:	b8c50513          	addi	a0,a0,-1140 # 8000e3e8 <cons>
    80008864:	02010113          	addi	sp,sp,32
    80008868:	00001317          	auipc	t1,0x1
    8000886c:	eb030067          	jr	-336(t1) # 80009718 <release>
    80008870:	00a00493          	li	s1,10
    80008874:	fc1ff06f          	j	80008834 <consoleintr+0x50>

0000000080008878 <consoleinit>:
    80008878:	fe010113          	addi	sp,sp,-32
    8000887c:	00113c23          	sd	ra,24(sp)
    80008880:	00813823          	sd	s0,16(sp)
    80008884:	00913423          	sd	s1,8(sp)
    80008888:	02010413          	addi	s0,sp,32
    8000888c:	00006497          	auipc	s1,0x6
    80008890:	b5c48493          	addi	s1,s1,-1188 # 8000e3e8 <cons>
    80008894:	00048513          	mv	a0,s1
    80008898:	00002597          	auipc	a1,0x2
    8000889c:	06058593          	addi	a1,a1,96 # 8000a8f8 <CONSOLE_STATUS+0x8e8>
    800088a0:	00001097          	auipc	ra,0x1
    800088a4:	d88080e7          	jalr	-632(ra) # 80009628 <initlock>
    800088a8:	00000097          	auipc	ra,0x0
    800088ac:	7ac080e7          	jalr	1964(ra) # 80009054 <uartinit>
    800088b0:	01813083          	ld	ra,24(sp)
    800088b4:	01013403          	ld	s0,16(sp)
    800088b8:	00000797          	auipc	a5,0x0
    800088bc:	d9c78793          	addi	a5,a5,-612 # 80008654 <consoleread>
    800088c0:	0af4bc23          	sd	a5,184(s1)
    800088c4:	00000797          	auipc	a5,0x0
    800088c8:	cec78793          	addi	a5,a5,-788 # 800085b0 <consolewrite>
    800088cc:	0cf4b023          	sd	a5,192(s1)
    800088d0:	00813483          	ld	s1,8(sp)
    800088d4:	02010113          	addi	sp,sp,32
    800088d8:	00008067          	ret

00000000800088dc <console_read>:
    800088dc:	ff010113          	addi	sp,sp,-16
    800088e0:	00813423          	sd	s0,8(sp)
    800088e4:	01010413          	addi	s0,sp,16
    800088e8:	00813403          	ld	s0,8(sp)
    800088ec:	00006317          	auipc	t1,0x6
    800088f0:	bb433303          	ld	t1,-1100(t1) # 8000e4a0 <devsw+0x10>
    800088f4:	01010113          	addi	sp,sp,16
    800088f8:	00030067          	jr	t1

00000000800088fc <console_write>:
    800088fc:	ff010113          	addi	sp,sp,-16
    80008900:	00813423          	sd	s0,8(sp)
    80008904:	01010413          	addi	s0,sp,16
    80008908:	00813403          	ld	s0,8(sp)
    8000890c:	00006317          	auipc	t1,0x6
    80008910:	b9c33303          	ld	t1,-1124(t1) # 8000e4a8 <devsw+0x18>
    80008914:	01010113          	addi	sp,sp,16
    80008918:	00030067          	jr	t1

000000008000891c <panic>:
    8000891c:	fe010113          	addi	sp,sp,-32
    80008920:	00113c23          	sd	ra,24(sp)
    80008924:	00813823          	sd	s0,16(sp)
    80008928:	00913423          	sd	s1,8(sp)
    8000892c:	02010413          	addi	s0,sp,32
    80008930:	00050493          	mv	s1,a0
    80008934:	00002517          	auipc	a0,0x2
    80008938:	fcc50513          	addi	a0,a0,-52 # 8000a900 <CONSOLE_STATUS+0x8f0>
    8000893c:	00006797          	auipc	a5,0x6
    80008940:	c007a623          	sw	zero,-1012(a5) # 8000e548 <pr+0x18>
    80008944:	00000097          	auipc	ra,0x0
    80008948:	034080e7          	jalr	52(ra) # 80008978 <__printf>
    8000894c:	00048513          	mv	a0,s1
    80008950:	00000097          	auipc	ra,0x0
    80008954:	028080e7          	jalr	40(ra) # 80008978 <__printf>
    80008958:	00002517          	auipc	a0,0x2
    8000895c:	d4050513          	addi	a0,a0,-704 # 8000a698 <CONSOLE_STATUS+0x688>
    80008960:	00000097          	auipc	ra,0x0
    80008964:	018080e7          	jalr	24(ra) # 80008978 <__printf>
    80008968:	00100793          	li	a5,1
    8000896c:	00004717          	auipc	a4,0x4
    80008970:	7ef72623          	sw	a5,2028(a4) # 8000d158 <panicked>
    80008974:	0000006f          	j	80008974 <panic+0x58>

0000000080008978 <__printf>:
    80008978:	f3010113          	addi	sp,sp,-208
    8000897c:	08813023          	sd	s0,128(sp)
    80008980:	07313423          	sd	s3,104(sp)
    80008984:	09010413          	addi	s0,sp,144
    80008988:	05813023          	sd	s8,64(sp)
    8000898c:	08113423          	sd	ra,136(sp)
    80008990:	06913c23          	sd	s1,120(sp)
    80008994:	07213823          	sd	s2,112(sp)
    80008998:	07413023          	sd	s4,96(sp)
    8000899c:	05513c23          	sd	s5,88(sp)
    800089a0:	05613823          	sd	s6,80(sp)
    800089a4:	05713423          	sd	s7,72(sp)
    800089a8:	03913c23          	sd	s9,56(sp)
    800089ac:	03a13823          	sd	s10,48(sp)
    800089b0:	03b13423          	sd	s11,40(sp)
    800089b4:	00006317          	auipc	t1,0x6
    800089b8:	b7c30313          	addi	t1,t1,-1156 # 8000e530 <pr>
    800089bc:	01832c03          	lw	s8,24(t1)
    800089c0:	00b43423          	sd	a1,8(s0)
    800089c4:	00c43823          	sd	a2,16(s0)
    800089c8:	00d43c23          	sd	a3,24(s0)
    800089cc:	02e43023          	sd	a4,32(s0)
    800089d0:	02f43423          	sd	a5,40(s0)
    800089d4:	03043823          	sd	a6,48(s0)
    800089d8:	03143c23          	sd	a7,56(s0)
    800089dc:	00050993          	mv	s3,a0
    800089e0:	4a0c1663          	bnez	s8,80008e8c <__printf+0x514>
    800089e4:	60098c63          	beqz	s3,80008ffc <__printf+0x684>
    800089e8:	0009c503          	lbu	a0,0(s3)
    800089ec:	00840793          	addi	a5,s0,8
    800089f0:	f6f43c23          	sd	a5,-136(s0)
    800089f4:	00000493          	li	s1,0
    800089f8:	22050063          	beqz	a0,80008c18 <__printf+0x2a0>
    800089fc:	00002a37          	lui	s4,0x2
    80008a00:	00018ab7          	lui	s5,0x18
    80008a04:	000f4b37          	lui	s6,0xf4
    80008a08:	00989bb7          	lui	s7,0x989
    80008a0c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80008a10:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80008a14:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80008a18:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80008a1c:	00148c9b          	addiw	s9,s1,1
    80008a20:	02500793          	li	a5,37
    80008a24:	01998933          	add	s2,s3,s9
    80008a28:	38f51263          	bne	a0,a5,80008dac <__printf+0x434>
    80008a2c:	00094783          	lbu	a5,0(s2)
    80008a30:	00078c9b          	sext.w	s9,a5
    80008a34:	1e078263          	beqz	a5,80008c18 <__printf+0x2a0>
    80008a38:	0024849b          	addiw	s1,s1,2
    80008a3c:	07000713          	li	a4,112
    80008a40:	00998933          	add	s2,s3,s1
    80008a44:	38e78a63          	beq	a5,a4,80008dd8 <__printf+0x460>
    80008a48:	20f76863          	bltu	a4,a5,80008c58 <__printf+0x2e0>
    80008a4c:	42a78863          	beq	a5,a0,80008e7c <__printf+0x504>
    80008a50:	06400713          	li	a4,100
    80008a54:	40e79663          	bne	a5,a4,80008e60 <__printf+0x4e8>
    80008a58:	f7843783          	ld	a5,-136(s0)
    80008a5c:	0007a603          	lw	a2,0(a5)
    80008a60:	00878793          	addi	a5,a5,8
    80008a64:	f6f43c23          	sd	a5,-136(s0)
    80008a68:	42064a63          	bltz	a2,80008e9c <__printf+0x524>
    80008a6c:	00a00713          	li	a4,10
    80008a70:	02e677bb          	remuw	a5,a2,a4
    80008a74:	00002d97          	auipc	s11,0x2
    80008a78:	eb4d8d93          	addi	s11,s11,-332 # 8000a928 <digits>
    80008a7c:	00900593          	li	a1,9
    80008a80:	0006051b          	sext.w	a0,a2
    80008a84:	00000c93          	li	s9,0
    80008a88:	02079793          	slli	a5,a5,0x20
    80008a8c:	0207d793          	srli	a5,a5,0x20
    80008a90:	00fd87b3          	add	a5,s11,a5
    80008a94:	0007c783          	lbu	a5,0(a5)
    80008a98:	02e656bb          	divuw	a3,a2,a4
    80008a9c:	f8f40023          	sb	a5,-128(s0)
    80008aa0:	14c5d863          	bge	a1,a2,80008bf0 <__printf+0x278>
    80008aa4:	06300593          	li	a1,99
    80008aa8:	00100c93          	li	s9,1
    80008aac:	02e6f7bb          	remuw	a5,a3,a4
    80008ab0:	02079793          	slli	a5,a5,0x20
    80008ab4:	0207d793          	srli	a5,a5,0x20
    80008ab8:	00fd87b3          	add	a5,s11,a5
    80008abc:	0007c783          	lbu	a5,0(a5)
    80008ac0:	02e6d73b          	divuw	a4,a3,a4
    80008ac4:	f8f400a3          	sb	a5,-127(s0)
    80008ac8:	12a5f463          	bgeu	a1,a0,80008bf0 <__printf+0x278>
    80008acc:	00a00693          	li	a3,10
    80008ad0:	00900593          	li	a1,9
    80008ad4:	02d777bb          	remuw	a5,a4,a3
    80008ad8:	02079793          	slli	a5,a5,0x20
    80008adc:	0207d793          	srli	a5,a5,0x20
    80008ae0:	00fd87b3          	add	a5,s11,a5
    80008ae4:	0007c503          	lbu	a0,0(a5)
    80008ae8:	02d757bb          	divuw	a5,a4,a3
    80008aec:	f8a40123          	sb	a0,-126(s0)
    80008af0:	48e5f263          	bgeu	a1,a4,80008f74 <__printf+0x5fc>
    80008af4:	06300513          	li	a0,99
    80008af8:	02d7f5bb          	remuw	a1,a5,a3
    80008afc:	02059593          	slli	a1,a1,0x20
    80008b00:	0205d593          	srli	a1,a1,0x20
    80008b04:	00bd85b3          	add	a1,s11,a1
    80008b08:	0005c583          	lbu	a1,0(a1)
    80008b0c:	02d7d7bb          	divuw	a5,a5,a3
    80008b10:	f8b401a3          	sb	a1,-125(s0)
    80008b14:	48e57263          	bgeu	a0,a4,80008f98 <__printf+0x620>
    80008b18:	3e700513          	li	a0,999
    80008b1c:	02d7f5bb          	remuw	a1,a5,a3
    80008b20:	02059593          	slli	a1,a1,0x20
    80008b24:	0205d593          	srli	a1,a1,0x20
    80008b28:	00bd85b3          	add	a1,s11,a1
    80008b2c:	0005c583          	lbu	a1,0(a1)
    80008b30:	02d7d7bb          	divuw	a5,a5,a3
    80008b34:	f8b40223          	sb	a1,-124(s0)
    80008b38:	46e57663          	bgeu	a0,a4,80008fa4 <__printf+0x62c>
    80008b3c:	02d7f5bb          	remuw	a1,a5,a3
    80008b40:	02059593          	slli	a1,a1,0x20
    80008b44:	0205d593          	srli	a1,a1,0x20
    80008b48:	00bd85b3          	add	a1,s11,a1
    80008b4c:	0005c583          	lbu	a1,0(a1)
    80008b50:	02d7d7bb          	divuw	a5,a5,a3
    80008b54:	f8b402a3          	sb	a1,-123(s0)
    80008b58:	46ea7863          	bgeu	s4,a4,80008fc8 <__printf+0x650>
    80008b5c:	02d7f5bb          	remuw	a1,a5,a3
    80008b60:	02059593          	slli	a1,a1,0x20
    80008b64:	0205d593          	srli	a1,a1,0x20
    80008b68:	00bd85b3          	add	a1,s11,a1
    80008b6c:	0005c583          	lbu	a1,0(a1)
    80008b70:	02d7d7bb          	divuw	a5,a5,a3
    80008b74:	f8b40323          	sb	a1,-122(s0)
    80008b78:	3eeaf863          	bgeu	s5,a4,80008f68 <__printf+0x5f0>
    80008b7c:	02d7f5bb          	remuw	a1,a5,a3
    80008b80:	02059593          	slli	a1,a1,0x20
    80008b84:	0205d593          	srli	a1,a1,0x20
    80008b88:	00bd85b3          	add	a1,s11,a1
    80008b8c:	0005c583          	lbu	a1,0(a1)
    80008b90:	02d7d7bb          	divuw	a5,a5,a3
    80008b94:	f8b403a3          	sb	a1,-121(s0)
    80008b98:	42eb7e63          	bgeu	s6,a4,80008fd4 <__printf+0x65c>
    80008b9c:	02d7f5bb          	remuw	a1,a5,a3
    80008ba0:	02059593          	slli	a1,a1,0x20
    80008ba4:	0205d593          	srli	a1,a1,0x20
    80008ba8:	00bd85b3          	add	a1,s11,a1
    80008bac:	0005c583          	lbu	a1,0(a1)
    80008bb0:	02d7d7bb          	divuw	a5,a5,a3
    80008bb4:	f8b40423          	sb	a1,-120(s0)
    80008bb8:	42ebfc63          	bgeu	s7,a4,80008ff0 <__printf+0x678>
    80008bbc:	02079793          	slli	a5,a5,0x20
    80008bc0:	0207d793          	srli	a5,a5,0x20
    80008bc4:	00fd8db3          	add	s11,s11,a5
    80008bc8:	000dc703          	lbu	a4,0(s11)
    80008bcc:	00a00793          	li	a5,10
    80008bd0:	00900c93          	li	s9,9
    80008bd4:	f8e404a3          	sb	a4,-119(s0)
    80008bd8:	00065c63          	bgez	a2,80008bf0 <__printf+0x278>
    80008bdc:	f9040713          	addi	a4,s0,-112
    80008be0:	00f70733          	add	a4,a4,a5
    80008be4:	02d00693          	li	a3,45
    80008be8:	fed70823          	sb	a3,-16(a4)
    80008bec:	00078c93          	mv	s9,a5
    80008bf0:	f8040793          	addi	a5,s0,-128
    80008bf4:	01978cb3          	add	s9,a5,s9
    80008bf8:	f7f40d13          	addi	s10,s0,-129
    80008bfc:	000cc503          	lbu	a0,0(s9)
    80008c00:	fffc8c93          	addi	s9,s9,-1
    80008c04:	00000097          	auipc	ra,0x0
    80008c08:	b90080e7          	jalr	-1136(ra) # 80008794 <consputc>
    80008c0c:	ffac98e3          	bne	s9,s10,80008bfc <__printf+0x284>
    80008c10:	00094503          	lbu	a0,0(s2)
    80008c14:	e00514e3          	bnez	a0,80008a1c <__printf+0xa4>
    80008c18:	1a0c1663          	bnez	s8,80008dc4 <__printf+0x44c>
    80008c1c:	08813083          	ld	ra,136(sp)
    80008c20:	08013403          	ld	s0,128(sp)
    80008c24:	07813483          	ld	s1,120(sp)
    80008c28:	07013903          	ld	s2,112(sp)
    80008c2c:	06813983          	ld	s3,104(sp)
    80008c30:	06013a03          	ld	s4,96(sp)
    80008c34:	05813a83          	ld	s5,88(sp)
    80008c38:	05013b03          	ld	s6,80(sp)
    80008c3c:	04813b83          	ld	s7,72(sp)
    80008c40:	04013c03          	ld	s8,64(sp)
    80008c44:	03813c83          	ld	s9,56(sp)
    80008c48:	03013d03          	ld	s10,48(sp)
    80008c4c:	02813d83          	ld	s11,40(sp)
    80008c50:	0d010113          	addi	sp,sp,208
    80008c54:	00008067          	ret
    80008c58:	07300713          	li	a4,115
    80008c5c:	1ce78a63          	beq	a5,a4,80008e30 <__printf+0x4b8>
    80008c60:	07800713          	li	a4,120
    80008c64:	1ee79e63          	bne	a5,a4,80008e60 <__printf+0x4e8>
    80008c68:	f7843783          	ld	a5,-136(s0)
    80008c6c:	0007a703          	lw	a4,0(a5)
    80008c70:	00878793          	addi	a5,a5,8
    80008c74:	f6f43c23          	sd	a5,-136(s0)
    80008c78:	28074263          	bltz	a4,80008efc <__printf+0x584>
    80008c7c:	00002d97          	auipc	s11,0x2
    80008c80:	cacd8d93          	addi	s11,s11,-852 # 8000a928 <digits>
    80008c84:	00f77793          	andi	a5,a4,15
    80008c88:	00fd87b3          	add	a5,s11,a5
    80008c8c:	0007c683          	lbu	a3,0(a5)
    80008c90:	00f00613          	li	a2,15
    80008c94:	0007079b          	sext.w	a5,a4
    80008c98:	f8d40023          	sb	a3,-128(s0)
    80008c9c:	0047559b          	srliw	a1,a4,0x4
    80008ca0:	0047569b          	srliw	a3,a4,0x4
    80008ca4:	00000c93          	li	s9,0
    80008ca8:	0ee65063          	bge	a2,a4,80008d88 <__printf+0x410>
    80008cac:	00f6f693          	andi	a3,a3,15
    80008cb0:	00dd86b3          	add	a3,s11,a3
    80008cb4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80008cb8:	0087d79b          	srliw	a5,a5,0x8
    80008cbc:	00100c93          	li	s9,1
    80008cc0:	f8d400a3          	sb	a3,-127(s0)
    80008cc4:	0cb67263          	bgeu	a2,a1,80008d88 <__printf+0x410>
    80008cc8:	00f7f693          	andi	a3,a5,15
    80008ccc:	00dd86b3          	add	a3,s11,a3
    80008cd0:	0006c583          	lbu	a1,0(a3)
    80008cd4:	00f00613          	li	a2,15
    80008cd8:	0047d69b          	srliw	a3,a5,0x4
    80008cdc:	f8b40123          	sb	a1,-126(s0)
    80008ce0:	0047d593          	srli	a1,a5,0x4
    80008ce4:	28f67e63          	bgeu	a2,a5,80008f80 <__printf+0x608>
    80008ce8:	00f6f693          	andi	a3,a3,15
    80008cec:	00dd86b3          	add	a3,s11,a3
    80008cf0:	0006c503          	lbu	a0,0(a3)
    80008cf4:	0087d813          	srli	a6,a5,0x8
    80008cf8:	0087d69b          	srliw	a3,a5,0x8
    80008cfc:	f8a401a3          	sb	a0,-125(s0)
    80008d00:	28b67663          	bgeu	a2,a1,80008f8c <__printf+0x614>
    80008d04:	00f6f693          	andi	a3,a3,15
    80008d08:	00dd86b3          	add	a3,s11,a3
    80008d0c:	0006c583          	lbu	a1,0(a3)
    80008d10:	00c7d513          	srli	a0,a5,0xc
    80008d14:	00c7d69b          	srliw	a3,a5,0xc
    80008d18:	f8b40223          	sb	a1,-124(s0)
    80008d1c:	29067a63          	bgeu	a2,a6,80008fb0 <__printf+0x638>
    80008d20:	00f6f693          	andi	a3,a3,15
    80008d24:	00dd86b3          	add	a3,s11,a3
    80008d28:	0006c583          	lbu	a1,0(a3)
    80008d2c:	0107d813          	srli	a6,a5,0x10
    80008d30:	0107d69b          	srliw	a3,a5,0x10
    80008d34:	f8b402a3          	sb	a1,-123(s0)
    80008d38:	28a67263          	bgeu	a2,a0,80008fbc <__printf+0x644>
    80008d3c:	00f6f693          	andi	a3,a3,15
    80008d40:	00dd86b3          	add	a3,s11,a3
    80008d44:	0006c683          	lbu	a3,0(a3)
    80008d48:	0147d79b          	srliw	a5,a5,0x14
    80008d4c:	f8d40323          	sb	a3,-122(s0)
    80008d50:	21067663          	bgeu	a2,a6,80008f5c <__printf+0x5e4>
    80008d54:	02079793          	slli	a5,a5,0x20
    80008d58:	0207d793          	srli	a5,a5,0x20
    80008d5c:	00fd8db3          	add	s11,s11,a5
    80008d60:	000dc683          	lbu	a3,0(s11)
    80008d64:	00800793          	li	a5,8
    80008d68:	00700c93          	li	s9,7
    80008d6c:	f8d403a3          	sb	a3,-121(s0)
    80008d70:	00075c63          	bgez	a4,80008d88 <__printf+0x410>
    80008d74:	f9040713          	addi	a4,s0,-112
    80008d78:	00f70733          	add	a4,a4,a5
    80008d7c:	02d00693          	li	a3,45
    80008d80:	fed70823          	sb	a3,-16(a4)
    80008d84:	00078c93          	mv	s9,a5
    80008d88:	f8040793          	addi	a5,s0,-128
    80008d8c:	01978cb3          	add	s9,a5,s9
    80008d90:	f7f40d13          	addi	s10,s0,-129
    80008d94:	000cc503          	lbu	a0,0(s9)
    80008d98:	fffc8c93          	addi	s9,s9,-1
    80008d9c:	00000097          	auipc	ra,0x0
    80008da0:	9f8080e7          	jalr	-1544(ra) # 80008794 <consputc>
    80008da4:	ff9d18e3          	bne	s10,s9,80008d94 <__printf+0x41c>
    80008da8:	0100006f          	j	80008db8 <__printf+0x440>
    80008dac:	00000097          	auipc	ra,0x0
    80008db0:	9e8080e7          	jalr	-1560(ra) # 80008794 <consputc>
    80008db4:	000c8493          	mv	s1,s9
    80008db8:	00094503          	lbu	a0,0(s2)
    80008dbc:	c60510e3          	bnez	a0,80008a1c <__printf+0xa4>
    80008dc0:	e40c0ee3          	beqz	s8,80008c1c <__printf+0x2a4>
    80008dc4:	00005517          	auipc	a0,0x5
    80008dc8:	76c50513          	addi	a0,a0,1900 # 8000e530 <pr>
    80008dcc:	00001097          	auipc	ra,0x1
    80008dd0:	94c080e7          	jalr	-1716(ra) # 80009718 <release>
    80008dd4:	e49ff06f          	j	80008c1c <__printf+0x2a4>
    80008dd8:	f7843783          	ld	a5,-136(s0)
    80008ddc:	03000513          	li	a0,48
    80008de0:	01000d13          	li	s10,16
    80008de4:	00878713          	addi	a4,a5,8
    80008de8:	0007bc83          	ld	s9,0(a5)
    80008dec:	f6e43c23          	sd	a4,-136(s0)
    80008df0:	00000097          	auipc	ra,0x0
    80008df4:	9a4080e7          	jalr	-1628(ra) # 80008794 <consputc>
    80008df8:	07800513          	li	a0,120
    80008dfc:	00000097          	auipc	ra,0x0
    80008e00:	998080e7          	jalr	-1640(ra) # 80008794 <consputc>
    80008e04:	00002d97          	auipc	s11,0x2
    80008e08:	b24d8d93          	addi	s11,s11,-1244 # 8000a928 <digits>
    80008e0c:	03ccd793          	srli	a5,s9,0x3c
    80008e10:	00fd87b3          	add	a5,s11,a5
    80008e14:	0007c503          	lbu	a0,0(a5)
    80008e18:	fffd0d1b          	addiw	s10,s10,-1
    80008e1c:	004c9c93          	slli	s9,s9,0x4
    80008e20:	00000097          	auipc	ra,0x0
    80008e24:	974080e7          	jalr	-1676(ra) # 80008794 <consputc>
    80008e28:	fe0d12e3          	bnez	s10,80008e0c <__printf+0x494>
    80008e2c:	f8dff06f          	j	80008db8 <__printf+0x440>
    80008e30:	f7843783          	ld	a5,-136(s0)
    80008e34:	0007bc83          	ld	s9,0(a5)
    80008e38:	00878793          	addi	a5,a5,8
    80008e3c:	f6f43c23          	sd	a5,-136(s0)
    80008e40:	000c9a63          	bnez	s9,80008e54 <__printf+0x4dc>
    80008e44:	1080006f          	j	80008f4c <__printf+0x5d4>
    80008e48:	001c8c93          	addi	s9,s9,1
    80008e4c:	00000097          	auipc	ra,0x0
    80008e50:	948080e7          	jalr	-1720(ra) # 80008794 <consputc>
    80008e54:	000cc503          	lbu	a0,0(s9)
    80008e58:	fe0518e3          	bnez	a0,80008e48 <__printf+0x4d0>
    80008e5c:	f5dff06f          	j	80008db8 <__printf+0x440>
    80008e60:	02500513          	li	a0,37
    80008e64:	00000097          	auipc	ra,0x0
    80008e68:	930080e7          	jalr	-1744(ra) # 80008794 <consputc>
    80008e6c:	000c8513          	mv	a0,s9
    80008e70:	00000097          	auipc	ra,0x0
    80008e74:	924080e7          	jalr	-1756(ra) # 80008794 <consputc>
    80008e78:	f41ff06f          	j	80008db8 <__printf+0x440>
    80008e7c:	02500513          	li	a0,37
    80008e80:	00000097          	auipc	ra,0x0
    80008e84:	914080e7          	jalr	-1772(ra) # 80008794 <consputc>
    80008e88:	f31ff06f          	j	80008db8 <__printf+0x440>
    80008e8c:	00030513          	mv	a0,t1
    80008e90:	00000097          	auipc	ra,0x0
    80008e94:	7bc080e7          	jalr	1980(ra) # 8000964c <acquire>
    80008e98:	b4dff06f          	j	800089e4 <__printf+0x6c>
    80008e9c:	40c0053b          	negw	a0,a2
    80008ea0:	00a00713          	li	a4,10
    80008ea4:	02e576bb          	remuw	a3,a0,a4
    80008ea8:	00002d97          	auipc	s11,0x2
    80008eac:	a80d8d93          	addi	s11,s11,-1408 # 8000a928 <digits>
    80008eb0:	ff700593          	li	a1,-9
    80008eb4:	02069693          	slli	a3,a3,0x20
    80008eb8:	0206d693          	srli	a3,a3,0x20
    80008ebc:	00dd86b3          	add	a3,s11,a3
    80008ec0:	0006c683          	lbu	a3,0(a3)
    80008ec4:	02e557bb          	divuw	a5,a0,a4
    80008ec8:	f8d40023          	sb	a3,-128(s0)
    80008ecc:	10b65e63          	bge	a2,a1,80008fe8 <__printf+0x670>
    80008ed0:	06300593          	li	a1,99
    80008ed4:	02e7f6bb          	remuw	a3,a5,a4
    80008ed8:	02069693          	slli	a3,a3,0x20
    80008edc:	0206d693          	srli	a3,a3,0x20
    80008ee0:	00dd86b3          	add	a3,s11,a3
    80008ee4:	0006c683          	lbu	a3,0(a3)
    80008ee8:	02e7d73b          	divuw	a4,a5,a4
    80008eec:	00200793          	li	a5,2
    80008ef0:	f8d400a3          	sb	a3,-127(s0)
    80008ef4:	bca5ece3          	bltu	a1,a0,80008acc <__printf+0x154>
    80008ef8:	ce5ff06f          	j	80008bdc <__printf+0x264>
    80008efc:	40e007bb          	negw	a5,a4
    80008f00:	00002d97          	auipc	s11,0x2
    80008f04:	a28d8d93          	addi	s11,s11,-1496 # 8000a928 <digits>
    80008f08:	00f7f693          	andi	a3,a5,15
    80008f0c:	00dd86b3          	add	a3,s11,a3
    80008f10:	0006c583          	lbu	a1,0(a3)
    80008f14:	ff100613          	li	a2,-15
    80008f18:	0047d69b          	srliw	a3,a5,0x4
    80008f1c:	f8b40023          	sb	a1,-128(s0)
    80008f20:	0047d59b          	srliw	a1,a5,0x4
    80008f24:	0ac75e63          	bge	a4,a2,80008fe0 <__printf+0x668>
    80008f28:	00f6f693          	andi	a3,a3,15
    80008f2c:	00dd86b3          	add	a3,s11,a3
    80008f30:	0006c603          	lbu	a2,0(a3)
    80008f34:	00f00693          	li	a3,15
    80008f38:	0087d79b          	srliw	a5,a5,0x8
    80008f3c:	f8c400a3          	sb	a2,-127(s0)
    80008f40:	d8b6e4e3          	bltu	a3,a1,80008cc8 <__printf+0x350>
    80008f44:	00200793          	li	a5,2
    80008f48:	e2dff06f          	j	80008d74 <__printf+0x3fc>
    80008f4c:	00002c97          	auipc	s9,0x2
    80008f50:	9bcc8c93          	addi	s9,s9,-1604 # 8000a908 <CONSOLE_STATUS+0x8f8>
    80008f54:	02800513          	li	a0,40
    80008f58:	ef1ff06f          	j	80008e48 <__printf+0x4d0>
    80008f5c:	00700793          	li	a5,7
    80008f60:	00600c93          	li	s9,6
    80008f64:	e0dff06f          	j	80008d70 <__printf+0x3f8>
    80008f68:	00700793          	li	a5,7
    80008f6c:	00600c93          	li	s9,6
    80008f70:	c69ff06f          	j	80008bd8 <__printf+0x260>
    80008f74:	00300793          	li	a5,3
    80008f78:	00200c93          	li	s9,2
    80008f7c:	c5dff06f          	j	80008bd8 <__printf+0x260>
    80008f80:	00300793          	li	a5,3
    80008f84:	00200c93          	li	s9,2
    80008f88:	de9ff06f          	j	80008d70 <__printf+0x3f8>
    80008f8c:	00400793          	li	a5,4
    80008f90:	00300c93          	li	s9,3
    80008f94:	dddff06f          	j	80008d70 <__printf+0x3f8>
    80008f98:	00400793          	li	a5,4
    80008f9c:	00300c93          	li	s9,3
    80008fa0:	c39ff06f          	j	80008bd8 <__printf+0x260>
    80008fa4:	00500793          	li	a5,5
    80008fa8:	00400c93          	li	s9,4
    80008fac:	c2dff06f          	j	80008bd8 <__printf+0x260>
    80008fb0:	00500793          	li	a5,5
    80008fb4:	00400c93          	li	s9,4
    80008fb8:	db9ff06f          	j	80008d70 <__printf+0x3f8>
    80008fbc:	00600793          	li	a5,6
    80008fc0:	00500c93          	li	s9,5
    80008fc4:	dadff06f          	j	80008d70 <__printf+0x3f8>
    80008fc8:	00600793          	li	a5,6
    80008fcc:	00500c93          	li	s9,5
    80008fd0:	c09ff06f          	j	80008bd8 <__printf+0x260>
    80008fd4:	00800793          	li	a5,8
    80008fd8:	00700c93          	li	s9,7
    80008fdc:	bfdff06f          	j	80008bd8 <__printf+0x260>
    80008fe0:	00100793          	li	a5,1
    80008fe4:	d91ff06f          	j	80008d74 <__printf+0x3fc>
    80008fe8:	00100793          	li	a5,1
    80008fec:	bf1ff06f          	j	80008bdc <__printf+0x264>
    80008ff0:	00900793          	li	a5,9
    80008ff4:	00800c93          	li	s9,8
    80008ff8:	be1ff06f          	j	80008bd8 <__printf+0x260>
    80008ffc:	00002517          	auipc	a0,0x2
    80009000:	91450513          	addi	a0,a0,-1772 # 8000a910 <CONSOLE_STATUS+0x900>
    80009004:	00000097          	auipc	ra,0x0
    80009008:	918080e7          	jalr	-1768(ra) # 8000891c <panic>

000000008000900c <printfinit>:
    8000900c:	fe010113          	addi	sp,sp,-32
    80009010:	00813823          	sd	s0,16(sp)
    80009014:	00913423          	sd	s1,8(sp)
    80009018:	00113c23          	sd	ra,24(sp)
    8000901c:	02010413          	addi	s0,sp,32
    80009020:	00005497          	auipc	s1,0x5
    80009024:	51048493          	addi	s1,s1,1296 # 8000e530 <pr>
    80009028:	00048513          	mv	a0,s1
    8000902c:	00002597          	auipc	a1,0x2
    80009030:	8f458593          	addi	a1,a1,-1804 # 8000a920 <CONSOLE_STATUS+0x910>
    80009034:	00000097          	auipc	ra,0x0
    80009038:	5f4080e7          	jalr	1524(ra) # 80009628 <initlock>
    8000903c:	01813083          	ld	ra,24(sp)
    80009040:	01013403          	ld	s0,16(sp)
    80009044:	0004ac23          	sw	zero,24(s1)
    80009048:	00813483          	ld	s1,8(sp)
    8000904c:	02010113          	addi	sp,sp,32
    80009050:	00008067          	ret

0000000080009054 <uartinit>:
    80009054:	ff010113          	addi	sp,sp,-16
    80009058:	00813423          	sd	s0,8(sp)
    8000905c:	01010413          	addi	s0,sp,16
    80009060:	100007b7          	lui	a5,0x10000
    80009064:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80009068:	f8000713          	li	a4,-128
    8000906c:	00e781a3          	sb	a4,3(a5)
    80009070:	00300713          	li	a4,3
    80009074:	00e78023          	sb	a4,0(a5)
    80009078:	000780a3          	sb	zero,1(a5)
    8000907c:	00e781a3          	sb	a4,3(a5)
    80009080:	00700693          	li	a3,7
    80009084:	00d78123          	sb	a3,2(a5)
    80009088:	00e780a3          	sb	a4,1(a5)
    8000908c:	00813403          	ld	s0,8(sp)
    80009090:	01010113          	addi	sp,sp,16
    80009094:	00008067          	ret

0000000080009098 <uartputc>:
    80009098:	00004797          	auipc	a5,0x4
    8000909c:	0c07a783          	lw	a5,192(a5) # 8000d158 <panicked>
    800090a0:	00078463          	beqz	a5,800090a8 <uartputc+0x10>
    800090a4:	0000006f          	j	800090a4 <uartputc+0xc>
    800090a8:	fd010113          	addi	sp,sp,-48
    800090ac:	02813023          	sd	s0,32(sp)
    800090b0:	00913c23          	sd	s1,24(sp)
    800090b4:	01213823          	sd	s2,16(sp)
    800090b8:	01313423          	sd	s3,8(sp)
    800090bc:	02113423          	sd	ra,40(sp)
    800090c0:	03010413          	addi	s0,sp,48
    800090c4:	00004917          	auipc	s2,0x4
    800090c8:	09c90913          	addi	s2,s2,156 # 8000d160 <uart_tx_r>
    800090cc:	00093783          	ld	a5,0(s2)
    800090d0:	00004497          	auipc	s1,0x4
    800090d4:	09848493          	addi	s1,s1,152 # 8000d168 <uart_tx_w>
    800090d8:	0004b703          	ld	a4,0(s1)
    800090dc:	02078693          	addi	a3,a5,32
    800090e0:	00050993          	mv	s3,a0
    800090e4:	02e69c63          	bne	a3,a4,8000911c <uartputc+0x84>
    800090e8:	00001097          	auipc	ra,0x1
    800090ec:	834080e7          	jalr	-1996(ra) # 8000991c <push_on>
    800090f0:	00093783          	ld	a5,0(s2)
    800090f4:	0004b703          	ld	a4,0(s1)
    800090f8:	02078793          	addi	a5,a5,32
    800090fc:	00e79463          	bne	a5,a4,80009104 <uartputc+0x6c>
    80009100:	0000006f          	j	80009100 <uartputc+0x68>
    80009104:	00001097          	auipc	ra,0x1
    80009108:	88c080e7          	jalr	-1908(ra) # 80009990 <pop_on>
    8000910c:	00093783          	ld	a5,0(s2)
    80009110:	0004b703          	ld	a4,0(s1)
    80009114:	02078693          	addi	a3,a5,32
    80009118:	fce688e3          	beq	a3,a4,800090e8 <uartputc+0x50>
    8000911c:	01f77693          	andi	a3,a4,31
    80009120:	00005597          	auipc	a1,0x5
    80009124:	43058593          	addi	a1,a1,1072 # 8000e550 <uart_tx_buf>
    80009128:	00d586b3          	add	a3,a1,a3
    8000912c:	00170713          	addi	a4,a4,1
    80009130:	01368023          	sb	s3,0(a3)
    80009134:	00e4b023          	sd	a4,0(s1)
    80009138:	10000637          	lui	a2,0x10000
    8000913c:	02f71063          	bne	a4,a5,8000915c <uartputc+0xc4>
    80009140:	0340006f          	j	80009174 <uartputc+0xdc>
    80009144:	00074703          	lbu	a4,0(a4)
    80009148:	00f93023          	sd	a5,0(s2)
    8000914c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80009150:	00093783          	ld	a5,0(s2)
    80009154:	0004b703          	ld	a4,0(s1)
    80009158:	00f70e63          	beq	a4,a5,80009174 <uartputc+0xdc>
    8000915c:	00564683          	lbu	a3,5(a2)
    80009160:	01f7f713          	andi	a4,a5,31
    80009164:	00e58733          	add	a4,a1,a4
    80009168:	0206f693          	andi	a3,a3,32
    8000916c:	00178793          	addi	a5,a5,1
    80009170:	fc069ae3          	bnez	a3,80009144 <uartputc+0xac>
    80009174:	02813083          	ld	ra,40(sp)
    80009178:	02013403          	ld	s0,32(sp)
    8000917c:	01813483          	ld	s1,24(sp)
    80009180:	01013903          	ld	s2,16(sp)
    80009184:	00813983          	ld	s3,8(sp)
    80009188:	03010113          	addi	sp,sp,48
    8000918c:	00008067          	ret

0000000080009190 <uartputc_sync>:
    80009190:	ff010113          	addi	sp,sp,-16
    80009194:	00813423          	sd	s0,8(sp)
    80009198:	01010413          	addi	s0,sp,16
    8000919c:	00004717          	auipc	a4,0x4
    800091a0:	fbc72703          	lw	a4,-68(a4) # 8000d158 <panicked>
    800091a4:	02071663          	bnez	a4,800091d0 <uartputc_sync+0x40>
    800091a8:	00050793          	mv	a5,a0
    800091ac:	100006b7          	lui	a3,0x10000
    800091b0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800091b4:	02077713          	andi	a4,a4,32
    800091b8:	fe070ce3          	beqz	a4,800091b0 <uartputc_sync+0x20>
    800091bc:	0ff7f793          	andi	a5,a5,255
    800091c0:	00f68023          	sb	a5,0(a3)
    800091c4:	00813403          	ld	s0,8(sp)
    800091c8:	01010113          	addi	sp,sp,16
    800091cc:	00008067          	ret
    800091d0:	0000006f          	j	800091d0 <uartputc_sync+0x40>

00000000800091d4 <uartstart>:
    800091d4:	ff010113          	addi	sp,sp,-16
    800091d8:	00813423          	sd	s0,8(sp)
    800091dc:	01010413          	addi	s0,sp,16
    800091e0:	00004617          	auipc	a2,0x4
    800091e4:	f8060613          	addi	a2,a2,-128 # 8000d160 <uart_tx_r>
    800091e8:	00004517          	auipc	a0,0x4
    800091ec:	f8050513          	addi	a0,a0,-128 # 8000d168 <uart_tx_w>
    800091f0:	00063783          	ld	a5,0(a2)
    800091f4:	00053703          	ld	a4,0(a0)
    800091f8:	04f70263          	beq	a4,a5,8000923c <uartstart+0x68>
    800091fc:	100005b7          	lui	a1,0x10000
    80009200:	00005817          	auipc	a6,0x5
    80009204:	35080813          	addi	a6,a6,848 # 8000e550 <uart_tx_buf>
    80009208:	01c0006f          	j	80009224 <uartstart+0x50>
    8000920c:	0006c703          	lbu	a4,0(a3)
    80009210:	00f63023          	sd	a5,0(a2)
    80009214:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80009218:	00063783          	ld	a5,0(a2)
    8000921c:	00053703          	ld	a4,0(a0)
    80009220:	00f70e63          	beq	a4,a5,8000923c <uartstart+0x68>
    80009224:	01f7f713          	andi	a4,a5,31
    80009228:	00e806b3          	add	a3,a6,a4
    8000922c:	0055c703          	lbu	a4,5(a1)
    80009230:	00178793          	addi	a5,a5,1
    80009234:	02077713          	andi	a4,a4,32
    80009238:	fc071ae3          	bnez	a4,8000920c <uartstart+0x38>
    8000923c:	00813403          	ld	s0,8(sp)
    80009240:	01010113          	addi	sp,sp,16
    80009244:	00008067          	ret

0000000080009248 <uartgetc>:
    80009248:	ff010113          	addi	sp,sp,-16
    8000924c:	00813423          	sd	s0,8(sp)
    80009250:	01010413          	addi	s0,sp,16
    80009254:	10000737          	lui	a4,0x10000
    80009258:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000925c:	0017f793          	andi	a5,a5,1
    80009260:	00078c63          	beqz	a5,80009278 <uartgetc+0x30>
    80009264:	00074503          	lbu	a0,0(a4)
    80009268:	0ff57513          	andi	a0,a0,255
    8000926c:	00813403          	ld	s0,8(sp)
    80009270:	01010113          	addi	sp,sp,16
    80009274:	00008067          	ret
    80009278:	fff00513          	li	a0,-1
    8000927c:	ff1ff06f          	j	8000926c <uartgetc+0x24>

0000000080009280 <uartintr>:
    80009280:	100007b7          	lui	a5,0x10000
    80009284:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80009288:	0017f793          	andi	a5,a5,1
    8000928c:	0a078463          	beqz	a5,80009334 <uartintr+0xb4>
    80009290:	fe010113          	addi	sp,sp,-32
    80009294:	00813823          	sd	s0,16(sp)
    80009298:	00913423          	sd	s1,8(sp)
    8000929c:	00113c23          	sd	ra,24(sp)
    800092a0:	02010413          	addi	s0,sp,32
    800092a4:	100004b7          	lui	s1,0x10000
    800092a8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800092ac:	0ff57513          	andi	a0,a0,255
    800092b0:	fffff097          	auipc	ra,0xfffff
    800092b4:	534080e7          	jalr	1332(ra) # 800087e4 <consoleintr>
    800092b8:	0054c783          	lbu	a5,5(s1)
    800092bc:	0017f793          	andi	a5,a5,1
    800092c0:	fe0794e3          	bnez	a5,800092a8 <uartintr+0x28>
    800092c4:	00004617          	auipc	a2,0x4
    800092c8:	e9c60613          	addi	a2,a2,-356 # 8000d160 <uart_tx_r>
    800092cc:	00004517          	auipc	a0,0x4
    800092d0:	e9c50513          	addi	a0,a0,-356 # 8000d168 <uart_tx_w>
    800092d4:	00063783          	ld	a5,0(a2)
    800092d8:	00053703          	ld	a4,0(a0)
    800092dc:	04f70263          	beq	a4,a5,80009320 <uartintr+0xa0>
    800092e0:	100005b7          	lui	a1,0x10000
    800092e4:	00005817          	auipc	a6,0x5
    800092e8:	26c80813          	addi	a6,a6,620 # 8000e550 <uart_tx_buf>
    800092ec:	01c0006f          	j	80009308 <uartintr+0x88>
    800092f0:	0006c703          	lbu	a4,0(a3)
    800092f4:	00f63023          	sd	a5,0(a2)
    800092f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800092fc:	00063783          	ld	a5,0(a2)
    80009300:	00053703          	ld	a4,0(a0)
    80009304:	00f70e63          	beq	a4,a5,80009320 <uartintr+0xa0>
    80009308:	01f7f713          	andi	a4,a5,31
    8000930c:	00e806b3          	add	a3,a6,a4
    80009310:	0055c703          	lbu	a4,5(a1)
    80009314:	00178793          	addi	a5,a5,1
    80009318:	02077713          	andi	a4,a4,32
    8000931c:	fc071ae3          	bnez	a4,800092f0 <uartintr+0x70>
    80009320:	01813083          	ld	ra,24(sp)
    80009324:	01013403          	ld	s0,16(sp)
    80009328:	00813483          	ld	s1,8(sp)
    8000932c:	02010113          	addi	sp,sp,32
    80009330:	00008067          	ret
    80009334:	00004617          	auipc	a2,0x4
    80009338:	e2c60613          	addi	a2,a2,-468 # 8000d160 <uart_tx_r>
    8000933c:	00004517          	auipc	a0,0x4
    80009340:	e2c50513          	addi	a0,a0,-468 # 8000d168 <uart_tx_w>
    80009344:	00063783          	ld	a5,0(a2)
    80009348:	00053703          	ld	a4,0(a0)
    8000934c:	04f70263          	beq	a4,a5,80009390 <uartintr+0x110>
    80009350:	100005b7          	lui	a1,0x10000
    80009354:	00005817          	auipc	a6,0x5
    80009358:	1fc80813          	addi	a6,a6,508 # 8000e550 <uart_tx_buf>
    8000935c:	01c0006f          	j	80009378 <uartintr+0xf8>
    80009360:	0006c703          	lbu	a4,0(a3)
    80009364:	00f63023          	sd	a5,0(a2)
    80009368:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000936c:	00063783          	ld	a5,0(a2)
    80009370:	00053703          	ld	a4,0(a0)
    80009374:	02f70063          	beq	a4,a5,80009394 <uartintr+0x114>
    80009378:	01f7f713          	andi	a4,a5,31
    8000937c:	00e806b3          	add	a3,a6,a4
    80009380:	0055c703          	lbu	a4,5(a1)
    80009384:	00178793          	addi	a5,a5,1
    80009388:	02077713          	andi	a4,a4,32
    8000938c:	fc071ae3          	bnez	a4,80009360 <uartintr+0xe0>
    80009390:	00008067          	ret
    80009394:	00008067          	ret

0000000080009398 <kinit>:
    80009398:	fc010113          	addi	sp,sp,-64
    8000939c:	02913423          	sd	s1,40(sp)
    800093a0:	fffff7b7          	lui	a5,0xfffff
    800093a4:	00006497          	auipc	s1,0x6
    800093a8:	1cb48493          	addi	s1,s1,459 # 8000f56f <end+0xfff>
    800093ac:	02813823          	sd	s0,48(sp)
    800093b0:	01313c23          	sd	s3,24(sp)
    800093b4:	00f4f4b3          	and	s1,s1,a5
    800093b8:	02113c23          	sd	ra,56(sp)
    800093bc:	03213023          	sd	s2,32(sp)
    800093c0:	01413823          	sd	s4,16(sp)
    800093c4:	01513423          	sd	s5,8(sp)
    800093c8:	04010413          	addi	s0,sp,64
    800093cc:	000017b7          	lui	a5,0x1
    800093d0:	01100993          	li	s3,17
    800093d4:	00f487b3          	add	a5,s1,a5
    800093d8:	01b99993          	slli	s3,s3,0x1b
    800093dc:	06f9e063          	bltu	s3,a5,8000943c <kinit+0xa4>
    800093e0:	00005a97          	auipc	s5,0x5
    800093e4:	190a8a93          	addi	s5,s5,400 # 8000e570 <end>
    800093e8:	0754ec63          	bltu	s1,s5,80009460 <kinit+0xc8>
    800093ec:	0734fa63          	bgeu	s1,s3,80009460 <kinit+0xc8>
    800093f0:	00088a37          	lui	s4,0x88
    800093f4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800093f8:	00004917          	auipc	s2,0x4
    800093fc:	d7890913          	addi	s2,s2,-648 # 8000d170 <kmem>
    80009400:	00ca1a13          	slli	s4,s4,0xc
    80009404:	0140006f          	j	80009418 <kinit+0x80>
    80009408:	000017b7          	lui	a5,0x1
    8000940c:	00f484b3          	add	s1,s1,a5
    80009410:	0554e863          	bltu	s1,s5,80009460 <kinit+0xc8>
    80009414:	0534f663          	bgeu	s1,s3,80009460 <kinit+0xc8>
    80009418:	00001637          	lui	a2,0x1
    8000941c:	00100593          	li	a1,1
    80009420:	00048513          	mv	a0,s1
    80009424:	00000097          	auipc	ra,0x0
    80009428:	5e4080e7          	jalr	1508(ra) # 80009a08 <__memset>
    8000942c:	00093783          	ld	a5,0(s2)
    80009430:	00f4b023          	sd	a5,0(s1)
    80009434:	00993023          	sd	s1,0(s2)
    80009438:	fd4498e3          	bne	s1,s4,80009408 <kinit+0x70>
    8000943c:	03813083          	ld	ra,56(sp)
    80009440:	03013403          	ld	s0,48(sp)
    80009444:	02813483          	ld	s1,40(sp)
    80009448:	02013903          	ld	s2,32(sp)
    8000944c:	01813983          	ld	s3,24(sp)
    80009450:	01013a03          	ld	s4,16(sp)
    80009454:	00813a83          	ld	s5,8(sp)
    80009458:	04010113          	addi	sp,sp,64
    8000945c:	00008067          	ret
    80009460:	00001517          	auipc	a0,0x1
    80009464:	4e050513          	addi	a0,a0,1248 # 8000a940 <digits+0x18>
    80009468:	fffff097          	auipc	ra,0xfffff
    8000946c:	4b4080e7          	jalr	1204(ra) # 8000891c <panic>

0000000080009470 <freerange>:
    80009470:	fc010113          	addi	sp,sp,-64
    80009474:	000017b7          	lui	a5,0x1
    80009478:	02913423          	sd	s1,40(sp)
    8000947c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80009480:	009504b3          	add	s1,a0,s1
    80009484:	fffff537          	lui	a0,0xfffff
    80009488:	02813823          	sd	s0,48(sp)
    8000948c:	02113c23          	sd	ra,56(sp)
    80009490:	03213023          	sd	s2,32(sp)
    80009494:	01313c23          	sd	s3,24(sp)
    80009498:	01413823          	sd	s4,16(sp)
    8000949c:	01513423          	sd	s5,8(sp)
    800094a0:	01613023          	sd	s6,0(sp)
    800094a4:	04010413          	addi	s0,sp,64
    800094a8:	00a4f4b3          	and	s1,s1,a0
    800094ac:	00f487b3          	add	a5,s1,a5
    800094b0:	06f5e463          	bltu	a1,a5,80009518 <freerange+0xa8>
    800094b4:	00005a97          	auipc	s5,0x5
    800094b8:	0bca8a93          	addi	s5,s5,188 # 8000e570 <end>
    800094bc:	0954e263          	bltu	s1,s5,80009540 <freerange+0xd0>
    800094c0:	01100993          	li	s3,17
    800094c4:	01b99993          	slli	s3,s3,0x1b
    800094c8:	0734fc63          	bgeu	s1,s3,80009540 <freerange+0xd0>
    800094cc:	00058a13          	mv	s4,a1
    800094d0:	00004917          	auipc	s2,0x4
    800094d4:	ca090913          	addi	s2,s2,-864 # 8000d170 <kmem>
    800094d8:	00002b37          	lui	s6,0x2
    800094dc:	0140006f          	j	800094f0 <freerange+0x80>
    800094e0:	000017b7          	lui	a5,0x1
    800094e4:	00f484b3          	add	s1,s1,a5
    800094e8:	0554ec63          	bltu	s1,s5,80009540 <freerange+0xd0>
    800094ec:	0534fa63          	bgeu	s1,s3,80009540 <freerange+0xd0>
    800094f0:	00001637          	lui	a2,0x1
    800094f4:	00100593          	li	a1,1
    800094f8:	00048513          	mv	a0,s1
    800094fc:	00000097          	auipc	ra,0x0
    80009500:	50c080e7          	jalr	1292(ra) # 80009a08 <__memset>
    80009504:	00093703          	ld	a4,0(s2)
    80009508:	016487b3          	add	a5,s1,s6
    8000950c:	00e4b023          	sd	a4,0(s1)
    80009510:	00993023          	sd	s1,0(s2)
    80009514:	fcfa76e3          	bgeu	s4,a5,800094e0 <freerange+0x70>
    80009518:	03813083          	ld	ra,56(sp)
    8000951c:	03013403          	ld	s0,48(sp)
    80009520:	02813483          	ld	s1,40(sp)
    80009524:	02013903          	ld	s2,32(sp)
    80009528:	01813983          	ld	s3,24(sp)
    8000952c:	01013a03          	ld	s4,16(sp)
    80009530:	00813a83          	ld	s5,8(sp)
    80009534:	00013b03          	ld	s6,0(sp)
    80009538:	04010113          	addi	sp,sp,64
    8000953c:	00008067          	ret
    80009540:	00001517          	auipc	a0,0x1
    80009544:	40050513          	addi	a0,a0,1024 # 8000a940 <digits+0x18>
    80009548:	fffff097          	auipc	ra,0xfffff
    8000954c:	3d4080e7          	jalr	980(ra) # 8000891c <panic>

0000000080009550 <kfree>:
    80009550:	fe010113          	addi	sp,sp,-32
    80009554:	00813823          	sd	s0,16(sp)
    80009558:	00113c23          	sd	ra,24(sp)
    8000955c:	00913423          	sd	s1,8(sp)
    80009560:	02010413          	addi	s0,sp,32
    80009564:	03451793          	slli	a5,a0,0x34
    80009568:	04079c63          	bnez	a5,800095c0 <kfree+0x70>
    8000956c:	00005797          	auipc	a5,0x5
    80009570:	00478793          	addi	a5,a5,4 # 8000e570 <end>
    80009574:	00050493          	mv	s1,a0
    80009578:	04f56463          	bltu	a0,a5,800095c0 <kfree+0x70>
    8000957c:	01100793          	li	a5,17
    80009580:	01b79793          	slli	a5,a5,0x1b
    80009584:	02f57e63          	bgeu	a0,a5,800095c0 <kfree+0x70>
    80009588:	00001637          	lui	a2,0x1
    8000958c:	00100593          	li	a1,1
    80009590:	00000097          	auipc	ra,0x0
    80009594:	478080e7          	jalr	1144(ra) # 80009a08 <__memset>
    80009598:	00004797          	auipc	a5,0x4
    8000959c:	bd878793          	addi	a5,a5,-1064 # 8000d170 <kmem>
    800095a0:	0007b703          	ld	a4,0(a5)
    800095a4:	01813083          	ld	ra,24(sp)
    800095a8:	01013403          	ld	s0,16(sp)
    800095ac:	00e4b023          	sd	a4,0(s1)
    800095b0:	0097b023          	sd	s1,0(a5)
    800095b4:	00813483          	ld	s1,8(sp)
    800095b8:	02010113          	addi	sp,sp,32
    800095bc:	00008067          	ret
    800095c0:	00001517          	auipc	a0,0x1
    800095c4:	38050513          	addi	a0,a0,896 # 8000a940 <digits+0x18>
    800095c8:	fffff097          	auipc	ra,0xfffff
    800095cc:	354080e7          	jalr	852(ra) # 8000891c <panic>

00000000800095d0 <kalloc>:
    800095d0:	fe010113          	addi	sp,sp,-32
    800095d4:	00813823          	sd	s0,16(sp)
    800095d8:	00913423          	sd	s1,8(sp)
    800095dc:	00113c23          	sd	ra,24(sp)
    800095e0:	02010413          	addi	s0,sp,32
    800095e4:	00004797          	auipc	a5,0x4
    800095e8:	b8c78793          	addi	a5,a5,-1140 # 8000d170 <kmem>
    800095ec:	0007b483          	ld	s1,0(a5)
    800095f0:	02048063          	beqz	s1,80009610 <kalloc+0x40>
    800095f4:	0004b703          	ld	a4,0(s1)
    800095f8:	00001637          	lui	a2,0x1
    800095fc:	00500593          	li	a1,5
    80009600:	00048513          	mv	a0,s1
    80009604:	00e7b023          	sd	a4,0(a5)
    80009608:	00000097          	auipc	ra,0x0
    8000960c:	400080e7          	jalr	1024(ra) # 80009a08 <__memset>
    80009610:	01813083          	ld	ra,24(sp)
    80009614:	01013403          	ld	s0,16(sp)
    80009618:	00048513          	mv	a0,s1
    8000961c:	00813483          	ld	s1,8(sp)
    80009620:	02010113          	addi	sp,sp,32
    80009624:	00008067          	ret

0000000080009628 <initlock>:
    80009628:	ff010113          	addi	sp,sp,-16
    8000962c:	00813423          	sd	s0,8(sp)
    80009630:	01010413          	addi	s0,sp,16
    80009634:	00813403          	ld	s0,8(sp)
    80009638:	00b53423          	sd	a1,8(a0)
    8000963c:	00052023          	sw	zero,0(a0)
    80009640:	00053823          	sd	zero,16(a0)
    80009644:	01010113          	addi	sp,sp,16
    80009648:	00008067          	ret

000000008000964c <acquire>:
    8000964c:	fe010113          	addi	sp,sp,-32
    80009650:	00813823          	sd	s0,16(sp)
    80009654:	00913423          	sd	s1,8(sp)
    80009658:	00113c23          	sd	ra,24(sp)
    8000965c:	01213023          	sd	s2,0(sp)
    80009660:	02010413          	addi	s0,sp,32
    80009664:	00050493          	mv	s1,a0
    80009668:	10002973          	csrr	s2,sstatus
    8000966c:	100027f3          	csrr	a5,sstatus
    80009670:	ffd7f793          	andi	a5,a5,-3
    80009674:	10079073          	csrw	sstatus,a5
    80009678:	fffff097          	auipc	ra,0xfffff
    8000967c:	8e0080e7          	jalr	-1824(ra) # 80007f58 <mycpu>
    80009680:	07852783          	lw	a5,120(a0)
    80009684:	06078e63          	beqz	a5,80009700 <acquire+0xb4>
    80009688:	fffff097          	auipc	ra,0xfffff
    8000968c:	8d0080e7          	jalr	-1840(ra) # 80007f58 <mycpu>
    80009690:	07852783          	lw	a5,120(a0)
    80009694:	0004a703          	lw	a4,0(s1)
    80009698:	0017879b          	addiw	a5,a5,1
    8000969c:	06f52c23          	sw	a5,120(a0)
    800096a0:	04071063          	bnez	a4,800096e0 <acquire+0x94>
    800096a4:	00100713          	li	a4,1
    800096a8:	00070793          	mv	a5,a4
    800096ac:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800096b0:	0007879b          	sext.w	a5,a5
    800096b4:	fe079ae3          	bnez	a5,800096a8 <acquire+0x5c>
    800096b8:	0ff0000f          	fence
    800096bc:	fffff097          	auipc	ra,0xfffff
    800096c0:	89c080e7          	jalr	-1892(ra) # 80007f58 <mycpu>
    800096c4:	01813083          	ld	ra,24(sp)
    800096c8:	01013403          	ld	s0,16(sp)
    800096cc:	00a4b823          	sd	a0,16(s1)
    800096d0:	00013903          	ld	s2,0(sp)
    800096d4:	00813483          	ld	s1,8(sp)
    800096d8:	02010113          	addi	sp,sp,32
    800096dc:	00008067          	ret
    800096e0:	0104b903          	ld	s2,16(s1)
    800096e4:	fffff097          	auipc	ra,0xfffff
    800096e8:	874080e7          	jalr	-1932(ra) # 80007f58 <mycpu>
    800096ec:	faa91ce3          	bne	s2,a0,800096a4 <acquire+0x58>
    800096f0:	00001517          	auipc	a0,0x1
    800096f4:	25850513          	addi	a0,a0,600 # 8000a948 <digits+0x20>
    800096f8:	fffff097          	auipc	ra,0xfffff
    800096fc:	224080e7          	jalr	548(ra) # 8000891c <panic>
    80009700:	00195913          	srli	s2,s2,0x1
    80009704:	fffff097          	auipc	ra,0xfffff
    80009708:	854080e7          	jalr	-1964(ra) # 80007f58 <mycpu>
    8000970c:	00197913          	andi	s2,s2,1
    80009710:	07252e23          	sw	s2,124(a0)
    80009714:	f75ff06f          	j	80009688 <acquire+0x3c>

0000000080009718 <release>:
    80009718:	fe010113          	addi	sp,sp,-32
    8000971c:	00813823          	sd	s0,16(sp)
    80009720:	00113c23          	sd	ra,24(sp)
    80009724:	00913423          	sd	s1,8(sp)
    80009728:	01213023          	sd	s2,0(sp)
    8000972c:	02010413          	addi	s0,sp,32
    80009730:	00052783          	lw	a5,0(a0)
    80009734:	00079a63          	bnez	a5,80009748 <release+0x30>
    80009738:	00001517          	auipc	a0,0x1
    8000973c:	21850513          	addi	a0,a0,536 # 8000a950 <digits+0x28>
    80009740:	fffff097          	auipc	ra,0xfffff
    80009744:	1dc080e7          	jalr	476(ra) # 8000891c <panic>
    80009748:	01053903          	ld	s2,16(a0)
    8000974c:	00050493          	mv	s1,a0
    80009750:	fffff097          	auipc	ra,0xfffff
    80009754:	808080e7          	jalr	-2040(ra) # 80007f58 <mycpu>
    80009758:	fea910e3          	bne	s2,a0,80009738 <release+0x20>
    8000975c:	0004b823          	sd	zero,16(s1)
    80009760:	0ff0000f          	fence
    80009764:	0f50000f          	fence	iorw,ow
    80009768:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000976c:	ffffe097          	auipc	ra,0xffffe
    80009770:	7ec080e7          	jalr	2028(ra) # 80007f58 <mycpu>
    80009774:	100027f3          	csrr	a5,sstatus
    80009778:	0027f793          	andi	a5,a5,2
    8000977c:	04079a63          	bnez	a5,800097d0 <release+0xb8>
    80009780:	07852783          	lw	a5,120(a0)
    80009784:	02f05e63          	blez	a5,800097c0 <release+0xa8>
    80009788:	fff7871b          	addiw	a4,a5,-1
    8000978c:	06e52c23          	sw	a4,120(a0)
    80009790:	00071c63          	bnez	a4,800097a8 <release+0x90>
    80009794:	07c52783          	lw	a5,124(a0)
    80009798:	00078863          	beqz	a5,800097a8 <release+0x90>
    8000979c:	100027f3          	csrr	a5,sstatus
    800097a0:	0027e793          	ori	a5,a5,2
    800097a4:	10079073          	csrw	sstatus,a5
    800097a8:	01813083          	ld	ra,24(sp)
    800097ac:	01013403          	ld	s0,16(sp)
    800097b0:	00813483          	ld	s1,8(sp)
    800097b4:	00013903          	ld	s2,0(sp)
    800097b8:	02010113          	addi	sp,sp,32
    800097bc:	00008067          	ret
    800097c0:	00001517          	auipc	a0,0x1
    800097c4:	1b050513          	addi	a0,a0,432 # 8000a970 <digits+0x48>
    800097c8:	fffff097          	auipc	ra,0xfffff
    800097cc:	154080e7          	jalr	340(ra) # 8000891c <panic>
    800097d0:	00001517          	auipc	a0,0x1
    800097d4:	18850513          	addi	a0,a0,392 # 8000a958 <digits+0x30>
    800097d8:	fffff097          	auipc	ra,0xfffff
    800097dc:	144080e7          	jalr	324(ra) # 8000891c <panic>

00000000800097e0 <holding>:
    800097e0:	00052783          	lw	a5,0(a0)
    800097e4:	00079663          	bnez	a5,800097f0 <holding+0x10>
    800097e8:	00000513          	li	a0,0
    800097ec:	00008067          	ret
    800097f0:	fe010113          	addi	sp,sp,-32
    800097f4:	00813823          	sd	s0,16(sp)
    800097f8:	00913423          	sd	s1,8(sp)
    800097fc:	00113c23          	sd	ra,24(sp)
    80009800:	02010413          	addi	s0,sp,32
    80009804:	01053483          	ld	s1,16(a0)
    80009808:	ffffe097          	auipc	ra,0xffffe
    8000980c:	750080e7          	jalr	1872(ra) # 80007f58 <mycpu>
    80009810:	01813083          	ld	ra,24(sp)
    80009814:	01013403          	ld	s0,16(sp)
    80009818:	40a48533          	sub	a0,s1,a0
    8000981c:	00153513          	seqz	a0,a0
    80009820:	00813483          	ld	s1,8(sp)
    80009824:	02010113          	addi	sp,sp,32
    80009828:	00008067          	ret

000000008000982c <push_off>:
    8000982c:	fe010113          	addi	sp,sp,-32
    80009830:	00813823          	sd	s0,16(sp)
    80009834:	00113c23          	sd	ra,24(sp)
    80009838:	00913423          	sd	s1,8(sp)
    8000983c:	02010413          	addi	s0,sp,32
    80009840:	100024f3          	csrr	s1,sstatus
    80009844:	100027f3          	csrr	a5,sstatus
    80009848:	ffd7f793          	andi	a5,a5,-3
    8000984c:	10079073          	csrw	sstatus,a5
    80009850:	ffffe097          	auipc	ra,0xffffe
    80009854:	708080e7          	jalr	1800(ra) # 80007f58 <mycpu>
    80009858:	07852783          	lw	a5,120(a0)
    8000985c:	02078663          	beqz	a5,80009888 <push_off+0x5c>
    80009860:	ffffe097          	auipc	ra,0xffffe
    80009864:	6f8080e7          	jalr	1784(ra) # 80007f58 <mycpu>
    80009868:	07852783          	lw	a5,120(a0)
    8000986c:	01813083          	ld	ra,24(sp)
    80009870:	01013403          	ld	s0,16(sp)
    80009874:	0017879b          	addiw	a5,a5,1
    80009878:	06f52c23          	sw	a5,120(a0)
    8000987c:	00813483          	ld	s1,8(sp)
    80009880:	02010113          	addi	sp,sp,32
    80009884:	00008067          	ret
    80009888:	0014d493          	srli	s1,s1,0x1
    8000988c:	ffffe097          	auipc	ra,0xffffe
    80009890:	6cc080e7          	jalr	1740(ra) # 80007f58 <mycpu>
    80009894:	0014f493          	andi	s1,s1,1
    80009898:	06952e23          	sw	s1,124(a0)
    8000989c:	fc5ff06f          	j	80009860 <push_off+0x34>

00000000800098a0 <pop_off>:
    800098a0:	ff010113          	addi	sp,sp,-16
    800098a4:	00813023          	sd	s0,0(sp)
    800098a8:	00113423          	sd	ra,8(sp)
    800098ac:	01010413          	addi	s0,sp,16
    800098b0:	ffffe097          	auipc	ra,0xffffe
    800098b4:	6a8080e7          	jalr	1704(ra) # 80007f58 <mycpu>
    800098b8:	100027f3          	csrr	a5,sstatus
    800098bc:	0027f793          	andi	a5,a5,2
    800098c0:	04079663          	bnez	a5,8000990c <pop_off+0x6c>
    800098c4:	07852783          	lw	a5,120(a0)
    800098c8:	02f05a63          	blez	a5,800098fc <pop_off+0x5c>
    800098cc:	fff7871b          	addiw	a4,a5,-1
    800098d0:	06e52c23          	sw	a4,120(a0)
    800098d4:	00071c63          	bnez	a4,800098ec <pop_off+0x4c>
    800098d8:	07c52783          	lw	a5,124(a0)
    800098dc:	00078863          	beqz	a5,800098ec <pop_off+0x4c>
    800098e0:	100027f3          	csrr	a5,sstatus
    800098e4:	0027e793          	ori	a5,a5,2
    800098e8:	10079073          	csrw	sstatus,a5
    800098ec:	00813083          	ld	ra,8(sp)
    800098f0:	00013403          	ld	s0,0(sp)
    800098f4:	01010113          	addi	sp,sp,16
    800098f8:	00008067          	ret
    800098fc:	00001517          	auipc	a0,0x1
    80009900:	07450513          	addi	a0,a0,116 # 8000a970 <digits+0x48>
    80009904:	fffff097          	auipc	ra,0xfffff
    80009908:	018080e7          	jalr	24(ra) # 8000891c <panic>
    8000990c:	00001517          	auipc	a0,0x1
    80009910:	04c50513          	addi	a0,a0,76 # 8000a958 <digits+0x30>
    80009914:	fffff097          	auipc	ra,0xfffff
    80009918:	008080e7          	jalr	8(ra) # 8000891c <panic>

000000008000991c <push_on>:
    8000991c:	fe010113          	addi	sp,sp,-32
    80009920:	00813823          	sd	s0,16(sp)
    80009924:	00113c23          	sd	ra,24(sp)
    80009928:	00913423          	sd	s1,8(sp)
    8000992c:	02010413          	addi	s0,sp,32
    80009930:	100024f3          	csrr	s1,sstatus
    80009934:	100027f3          	csrr	a5,sstatus
    80009938:	0027e793          	ori	a5,a5,2
    8000993c:	10079073          	csrw	sstatus,a5
    80009940:	ffffe097          	auipc	ra,0xffffe
    80009944:	618080e7          	jalr	1560(ra) # 80007f58 <mycpu>
    80009948:	07852783          	lw	a5,120(a0)
    8000994c:	02078663          	beqz	a5,80009978 <push_on+0x5c>
    80009950:	ffffe097          	auipc	ra,0xffffe
    80009954:	608080e7          	jalr	1544(ra) # 80007f58 <mycpu>
    80009958:	07852783          	lw	a5,120(a0)
    8000995c:	01813083          	ld	ra,24(sp)
    80009960:	01013403          	ld	s0,16(sp)
    80009964:	0017879b          	addiw	a5,a5,1
    80009968:	06f52c23          	sw	a5,120(a0)
    8000996c:	00813483          	ld	s1,8(sp)
    80009970:	02010113          	addi	sp,sp,32
    80009974:	00008067          	ret
    80009978:	0014d493          	srli	s1,s1,0x1
    8000997c:	ffffe097          	auipc	ra,0xffffe
    80009980:	5dc080e7          	jalr	1500(ra) # 80007f58 <mycpu>
    80009984:	0014f493          	andi	s1,s1,1
    80009988:	06952e23          	sw	s1,124(a0)
    8000998c:	fc5ff06f          	j	80009950 <push_on+0x34>

0000000080009990 <pop_on>:
    80009990:	ff010113          	addi	sp,sp,-16
    80009994:	00813023          	sd	s0,0(sp)
    80009998:	00113423          	sd	ra,8(sp)
    8000999c:	01010413          	addi	s0,sp,16
    800099a0:	ffffe097          	auipc	ra,0xffffe
    800099a4:	5b8080e7          	jalr	1464(ra) # 80007f58 <mycpu>
    800099a8:	100027f3          	csrr	a5,sstatus
    800099ac:	0027f793          	andi	a5,a5,2
    800099b0:	04078463          	beqz	a5,800099f8 <pop_on+0x68>
    800099b4:	07852783          	lw	a5,120(a0)
    800099b8:	02f05863          	blez	a5,800099e8 <pop_on+0x58>
    800099bc:	fff7879b          	addiw	a5,a5,-1
    800099c0:	06f52c23          	sw	a5,120(a0)
    800099c4:	07853783          	ld	a5,120(a0)
    800099c8:	00079863          	bnez	a5,800099d8 <pop_on+0x48>
    800099cc:	100027f3          	csrr	a5,sstatus
    800099d0:	ffd7f793          	andi	a5,a5,-3
    800099d4:	10079073          	csrw	sstatus,a5
    800099d8:	00813083          	ld	ra,8(sp)
    800099dc:	00013403          	ld	s0,0(sp)
    800099e0:	01010113          	addi	sp,sp,16
    800099e4:	00008067          	ret
    800099e8:	00001517          	auipc	a0,0x1
    800099ec:	fb050513          	addi	a0,a0,-80 # 8000a998 <digits+0x70>
    800099f0:	fffff097          	auipc	ra,0xfffff
    800099f4:	f2c080e7          	jalr	-212(ra) # 8000891c <panic>
    800099f8:	00001517          	auipc	a0,0x1
    800099fc:	f8050513          	addi	a0,a0,-128 # 8000a978 <digits+0x50>
    80009a00:	fffff097          	auipc	ra,0xfffff
    80009a04:	f1c080e7          	jalr	-228(ra) # 8000891c <panic>

0000000080009a08 <__memset>:
    80009a08:	ff010113          	addi	sp,sp,-16
    80009a0c:	00813423          	sd	s0,8(sp)
    80009a10:	01010413          	addi	s0,sp,16
    80009a14:	1a060e63          	beqz	a2,80009bd0 <__memset+0x1c8>
    80009a18:	40a007b3          	neg	a5,a0
    80009a1c:	0077f793          	andi	a5,a5,7
    80009a20:	00778693          	addi	a3,a5,7
    80009a24:	00b00813          	li	a6,11
    80009a28:	0ff5f593          	andi	a1,a1,255
    80009a2c:	fff6071b          	addiw	a4,a2,-1
    80009a30:	1b06e663          	bltu	a3,a6,80009bdc <__memset+0x1d4>
    80009a34:	1cd76463          	bltu	a4,a3,80009bfc <__memset+0x1f4>
    80009a38:	1a078e63          	beqz	a5,80009bf4 <__memset+0x1ec>
    80009a3c:	00b50023          	sb	a1,0(a0)
    80009a40:	00100713          	li	a4,1
    80009a44:	1ae78463          	beq	a5,a4,80009bec <__memset+0x1e4>
    80009a48:	00b500a3          	sb	a1,1(a0)
    80009a4c:	00200713          	li	a4,2
    80009a50:	1ae78a63          	beq	a5,a4,80009c04 <__memset+0x1fc>
    80009a54:	00b50123          	sb	a1,2(a0)
    80009a58:	00300713          	li	a4,3
    80009a5c:	18e78463          	beq	a5,a4,80009be4 <__memset+0x1dc>
    80009a60:	00b501a3          	sb	a1,3(a0)
    80009a64:	00400713          	li	a4,4
    80009a68:	1ae78263          	beq	a5,a4,80009c0c <__memset+0x204>
    80009a6c:	00b50223          	sb	a1,4(a0)
    80009a70:	00500713          	li	a4,5
    80009a74:	1ae78063          	beq	a5,a4,80009c14 <__memset+0x20c>
    80009a78:	00b502a3          	sb	a1,5(a0)
    80009a7c:	00700713          	li	a4,7
    80009a80:	18e79e63          	bne	a5,a4,80009c1c <__memset+0x214>
    80009a84:	00b50323          	sb	a1,6(a0)
    80009a88:	00700e93          	li	t4,7
    80009a8c:	00859713          	slli	a4,a1,0x8
    80009a90:	00e5e733          	or	a4,a1,a4
    80009a94:	01059e13          	slli	t3,a1,0x10
    80009a98:	01c76e33          	or	t3,a4,t3
    80009a9c:	01859313          	slli	t1,a1,0x18
    80009aa0:	006e6333          	or	t1,t3,t1
    80009aa4:	02059893          	slli	a7,a1,0x20
    80009aa8:	40f60e3b          	subw	t3,a2,a5
    80009aac:	011368b3          	or	a7,t1,a7
    80009ab0:	02859813          	slli	a6,a1,0x28
    80009ab4:	0108e833          	or	a6,a7,a6
    80009ab8:	03059693          	slli	a3,a1,0x30
    80009abc:	003e589b          	srliw	a7,t3,0x3
    80009ac0:	00d866b3          	or	a3,a6,a3
    80009ac4:	03859713          	slli	a4,a1,0x38
    80009ac8:	00389813          	slli	a6,a7,0x3
    80009acc:	00f507b3          	add	a5,a0,a5
    80009ad0:	00e6e733          	or	a4,a3,a4
    80009ad4:	000e089b          	sext.w	a7,t3
    80009ad8:	00f806b3          	add	a3,a6,a5
    80009adc:	00e7b023          	sd	a4,0(a5)
    80009ae0:	00878793          	addi	a5,a5,8
    80009ae4:	fed79ce3          	bne	a5,a3,80009adc <__memset+0xd4>
    80009ae8:	ff8e7793          	andi	a5,t3,-8
    80009aec:	0007871b          	sext.w	a4,a5
    80009af0:	01d787bb          	addw	a5,a5,t4
    80009af4:	0ce88e63          	beq	a7,a4,80009bd0 <__memset+0x1c8>
    80009af8:	00f50733          	add	a4,a0,a5
    80009afc:	00b70023          	sb	a1,0(a4)
    80009b00:	0017871b          	addiw	a4,a5,1
    80009b04:	0cc77663          	bgeu	a4,a2,80009bd0 <__memset+0x1c8>
    80009b08:	00e50733          	add	a4,a0,a4
    80009b0c:	00b70023          	sb	a1,0(a4)
    80009b10:	0027871b          	addiw	a4,a5,2
    80009b14:	0ac77e63          	bgeu	a4,a2,80009bd0 <__memset+0x1c8>
    80009b18:	00e50733          	add	a4,a0,a4
    80009b1c:	00b70023          	sb	a1,0(a4)
    80009b20:	0037871b          	addiw	a4,a5,3
    80009b24:	0ac77663          	bgeu	a4,a2,80009bd0 <__memset+0x1c8>
    80009b28:	00e50733          	add	a4,a0,a4
    80009b2c:	00b70023          	sb	a1,0(a4)
    80009b30:	0047871b          	addiw	a4,a5,4
    80009b34:	08c77e63          	bgeu	a4,a2,80009bd0 <__memset+0x1c8>
    80009b38:	00e50733          	add	a4,a0,a4
    80009b3c:	00b70023          	sb	a1,0(a4)
    80009b40:	0057871b          	addiw	a4,a5,5
    80009b44:	08c77663          	bgeu	a4,a2,80009bd0 <__memset+0x1c8>
    80009b48:	00e50733          	add	a4,a0,a4
    80009b4c:	00b70023          	sb	a1,0(a4)
    80009b50:	0067871b          	addiw	a4,a5,6
    80009b54:	06c77e63          	bgeu	a4,a2,80009bd0 <__memset+0x1c8>
    80009b58:	00e50733          	add	a4,a0,a4
    80009b5c:	00b70023          	sb	a1,0(a4)
    80009b60:	0077871b          	addiw	a4,a5,7
    80009b64:	06c77663          	bgeu	a4,a2,80009bd0 <__memset+0x1c8>
    80009b68:	00e50733          	add	a4,a0,a4
    80009b6c:	00b70023          	sb	a1,0(a4)
    80009b70:	0087871b          	addiw	a4,a5,8
    80009b74:	04c77e63          	bgeu	a4,a2,80009bd0 <__memset+0x1c8>
    80009b78:	00e50733          	add	a4,a0,a4
    80009b7c:	00b70023          	sb	a1,0(a4)
    80009b80:	0097871b          	addiw	a4,a5,9
    80009b84:	04c77663          	bgeu	a4,a2,80009bd0 <__memset+0x1c8>
    80009b88:	00e50733          	add	a4,a0,a4
    80009b8c:	00b70023          	sb	a1,0(a4)
    80009b90:	00a7871b          	addiw	a4,a5,10
    80009b94:	02c77e63          	bgeu	a4,a2,80009bd0 <__memset+0x1c8>
    80009b98:	00e50733          	add	a4,a0,a4
    80009b9c:	00b70023          	sb	a1,0(a4)
    80009ba0:	00b7871b          	addiw	a4,a5,11
    80009ba4:	02c77663          	bgeu	a4,a2,80009bd0 <__memset+0x1c8>
    80009ba8:	00e50733          	add	a4,a0,a4
    80009bac:	00b70023          	sb	a1,0(a4)
    80009bb0:	00c7871b          	addiw	a4,a5,12
    80009bb4:	00c77e63          	bgeu	a4,a2,80009bd0 <__memset+0x1c8>
    80009bb8:	00e50733          	add	a4,a0,a4
    80009bbc:	00b70023          	sb	a1,0(a4)
    80009bc0:	00d7879b          	addiw	a5,a5,13
    80009bc4:	00c7f663          	bgeu	a5,a2,80009bd0 <__memset+0x1c8>
    80009bc8:	00f507b3          	add	a5,a0,a5
    80009bcc:	00b78023          	sb	a1,0(a5)
    80009bd0:	00813403          	ld	s0,8(sp)
    80009bd4:	01010113          	addi	sp,sp,16
    80009bd8:	00008067          	ret
    80009bdc:	00b00693          	li	a3,11
    80009be0:	e55ff06f          	j	80009a34 <__memset+0x2c>
    80009be4:	00300e93          	li	t4,3
    80009be8:	ea5ff06f          	j	80009a8c <__memset+0x84>
    80009bec:	00100e93          	li	t4,1
    80009bf0:	e9dff06f          	j	80009a8c <__memset+0x84>
    80009bf4:	00000e93          	li	t4,0
    80009bf8:	e95ff06f          	j	80009a8c <__memset+0x84>
    80009bfc:	00000793          	li	a5,0
    80009c00:	ef9ff06f          	j	80009af8 <__memset+0xf0>
    80009c04:	00200e93          	li	t4,2
    80009c08:	e85ff06f          	j	80009a8c <__memset+0x84>
    80009c0c:	00400e93          	li	t4,4
    80009c10:	e7dff06f          	j	80009a8c <__memset+0x84>
    80009c14:	00500e93          	li	t4,5
    80009c18:	e75ff06f          	j	80009a8c <__memset+0x84>
    80009c1c:	00600e93          	li	t4,6
    80009c20:	e6dff06f          	j	80009a8c <__memset+0x84>

0000000080009c24 <__memmove>:
    80009c24:	ff010113          	addi	sp,sp,-16
    80009c28:	00813423          	sd	s0,8(sp)
    80009c2c:	01010413          	addi	s0,sp,16
    80009c30:	0e060863          	beqz	a2,80009d20 <__memmove+0xfc>
    80009c34:	fff6069b          	addiw	a3,a2,-1
    80009c38:	0006881b          	sext.w	a6,a3
    80009c3c:	0ea5e863          	bltu	a1,a0,80009d2c <__memmove+0x108>
    80009c40:	00758713          	addi	a4,a1,7
    80009c44:	00a5e7b3          	or	a5,a1,a0
    80009c48:	40a70733          	sub	a4,a4,a0
    80009c4c:	0077f793          	andi	a5,a5,7
    80009c50:	00f73713          	sltiu	a4,a4,15
    80009c54:	00174713          	xori	a4,a4,1
    80009c58:	0017b793          	seqz	a5,a5
    80009c5c:	00e7f7b3          	and	a5,a5,a4
    80009c60:	10078863          	beqz	a5,80009d70 <__memmove+0x14c>
    80009c64:	00900793          	li	a5,9
    80009c68:	1107f463          	bgeu	a5,a6,80009d70 <__memmove+0x14c>
    80009c6c:	0036581b          	srliw	a6,a2,0x3
    80009c70:	fff8081b          	addiw	a6,a6,-1
    80009c74:	02081813          	slli	a6,a6,0x20
    80009c78:	01d85893          	srli	a7,a6,0x1d
    80009c7c:	00858813          	addi	a6,a1,8
    80009c80:	00058793          	mv	a5,a1
    80009c84:	00050713          	mv	a4,a0
    80009c88:	01088833          	add	a6,a7,a6
    80009c8c:	0007b883          	ld	a7,0(a5)
    80009c90:	00878793          	addi	a5,a5,8
    80009c94:	00870713          	addi	a4,a4,8
    80009c98:	ff173c23          	sd	a7,-8(a4)
    80009c9c:	ff0798e3          	bne	a5,a6,80009c8c <__memmove+0x68>
    80009ca0:	ff867713          	andi	a4,a2,-8
    80009ca4:	02071793          	slli	a5,a4,0x20
    80009ca8:	0207d793          	srli	a5,a5,0x20
    80009cac:	00f585b3          	add	a1,a1,a5
    80009cb0:	40e686bb          	subw	a3,a3,a4
    80009cb4:	00f507b3          	add	a5,a0,a5
    80009cb8:	06e60463          	beq	a2,a4,80009d20 <__memmove+0xfc>
    80009cbc:	0005c703          	lbu	a4,0(a1)
    80009cc0:	00e78023          	sb	a4,0(a5)
    80009cc4:	04068e63          	beqz	a3,80009d20 <__memmove+0xfc>
    80009cc8:	0015c603          	lbu	a2,1(a1)
    80009ccc:	00100713          	li	a4,1
    80009cd0:	00c780a3          	sb	a2,1(a5)
    80009cd4:	04e68663          	beq	a3,a4,80009d20 <__memmove+0xfc>
    80009cd8:	0025c603          	lbu	a2,2(a1)
    80009cdc:	00200713          	li	a4,2
    80009ce0:	00c78123          	sb	a2,2(a5)
    80009ce4:	02e68e63          	beq	a3,a4,80009d20 <__memmove+0xfc>
    80009ce8:	0035c603          	lbu	a2,3(a1)
    80009cec:	00300713          	li	a4,3
    80009cf0:	00c781a3          	sb	a2,3(a5)
    80009cf4:	02e68663          	beq	a3,a4,80009d20 <__memmove+0xfc>
    80009cf8:	0045c603          	lbu	a2,4(a1)
    80009cfc:	00400713          	li	a4,4
    80009d00:	00c78223          	sb	a2,4(a5)
    80009d04:	00e68e63          	beq	a3,a4,80009d20 <__memmove+0xfc>
    80009d08:	0055c603          	lbu	a2,5(a1)
    80009d0c:	00500713          	li	a4,5
    80009d10:	00c782a3          	sb	a2,5(a5)
    80009d14:	00e68663          	beq	a3,a4,80009d20 <__memmove+0xfc>
    80009d18:	0065c703          	lbu	a4,6(a1)
    80009d1c:	00e78323          	sb	a4,6(a5)
    80009d20:	00813403          	ld	s0,8(sp)
    80009d24:	01010113          	addi	sp,sp,16
    80009d28:	00008067          	ret
    80009d2c:	02061713          	slli	a4,a2,0x20
    80009d30:	02075713          	srli	a4,a4,0x20
    80009d34:	00e587b3          	add	a5,a1,a4
    80009d38:	f0f574e3          	bgeu	a0,a5,80009c40 <__memmove+0x1c>
    80009d3c:	02069613          	slli	a2,a3,0x20
    80009d40:	02065613          	srli	a2,a2,0x20
    80009d44:	fff64613          	not	a2,a2
    80009d48:	00e50733          	add	a4,a0,a4
    80009d4c:	00c78633          	add	a2,a5,a2
    80009d50:	fff7c683          	lbu	a3,-1(a5)
    80009d54:	fff78793          	addi	a5,a5,-1
    80009d58:	fff70713          	addi	a4,a4,-1
    80009d5c:	00d70023          	sb	a3,0(a4)
    80009d60:	fec798e3          	bne	a5,a2,80009d50 <__memmove+0x12c>
    80009d64:	00813403          	ld	s0,8(sp)
    80009d68:	01010113          	addi	sp,sp,16
    80009d6c:	00008067          	ret
    80009d70:	02069713          	slli	a4,a3,0x20
    80009d74:	02075713          	srli	a4,a4,0x20
    80009d78:	00170713          	addi	a4,a4,1
    80009d7c:	00e50733          	add	a4,a0,a4
    80009d80:	00050793          	mv	a5,a0
    80009d84:	0005c683          	lbu	a3,0(a1)
    80009d88:	00178793          	addi	a5,a5,1
    80009d8c:	00158593          	addi	a1,a1,1
    80009d90:	fed78fa3          	sb	a3,-1(a5)
    80009d94:	fee798e3          	bne	a5,a4,80009d84 <__memmove+0x160>
    80009d98:	f89ff06f          	j	80009d20 <__memmove+0xfc>
	...
