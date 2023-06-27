
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	07013103          	ld	sp,112(sp) # 8000d070 <_GLOBAL_OFFSET_TABLE_+0x58>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	34d070ef          	jal	ra,80007b68 <start>

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
    80001084:	6dc010ef          	jal	ra,80002760 <interruptRoutine>

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
    80001430:	c5c7b783          	ld	a5,-932(a5) # 8000d088 <_GLOBAL_OFFSET_TABLE_+0x70>
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
    8000167c:	a107b783          	ld	a5,-1520(a5) # 8000d088 <_GLOBAL_OFFSET_TABLE_+0x70>
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
    80001710:	a047c783          	lbu	a5,-1532(a5) # 8000d110 <_ZN8KConsole11initializedE>
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
    80001734:	9e048493          	addi	s1,s1,-1568 # 8000d110 <_ZN8KConsole11initializedE>
    80001738:	0000c797          	auipc	a5,0xc
    8000173c:	8f07b783          	ld	a5,-1808(a5) # 8000d028 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001740:	0007b783          	ld	a5,0(a5)
    80001744:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    80001748:	0000c797          	auipc	a5,0xc
    8000174c:	8f07b783          	ld	a5,-1808(a5) # 8000d038 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001750:	0007b783          	ld	a5,0(a5)
    80001754:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    80001758:	03200593          	li	a1,50
    8000175c:	0000c517          	auipc	a0,0xc
    80001760:	9cc50513          	addi	a0,a0,-1588 # 8000d128 <_ZN8KConsole19inputBufferHasSpaceE>
    80001764:	00000097          	auipc	ra,0x0
    80001768:	dd4080e7          	jalr	-556(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    8000176c:	03200593          	li	a1,50
    80001770:	0000c517          	auipc	a0,0xc
    80001774:	9c050513          	addi	a0,a0,-1600 # 8000d130 <_ZN8KConsole20outputBufferHasSpaceE>
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	dc0080e7          	jalr	-576(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    80001780:	00000593          	li	a1,0
    80001784:	0000c517          	auipc	a0,0xc
    80001788:	9b450513          	addi	a0,a0,-1612 # 8000d138 <_ZN8KConsole12charsToInputE>
    8000178c:	00000097          	auipc	ra,0x0
    80001790:	dac080e7          	jalr	-596(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    80001794:	00000593          	li	a1,0
    80001798:	0000c517          	auipc	a0,0xc
    8000179c:	9a850513          	addi	a0,a0,-1624 # 8000d140 <_ZN8KConsole13charsToOutputE>
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
    800017dc:	93848493          	addi	s1,s1,-1736 # 8000d110 <_ZN8KConsole11initializedE>
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
    80001820:	96872703          	lw	a4,-1688(a4) # 8000d184 <_ZN8KConsole15inputBufferSizeE>
    80001824:	03200793          	li	a5,50
    80001828:	04f70e63          	beq	a4,a5,80001884 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    8000182c:	ff010113          	addi	sp,sp,-16
    80001830:	00113423          	sd	ra,8(sp)
    80001834:	00813023          	sd	s0,0(sp)
    80001838:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    8000183c:	0000c697          	auipc	a3,0xc
    80001840:	8d468693          	addi	a3,a3,-1836 # 8000d110 <_ZN8KConsole11initializedE>
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
    800018a8:	86c48493          	addi	s1,s1,-1940 # 8000d110 <_ZN8KConsole11initializedE>
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
    80001910:	80448493          	addi	s1,s1,-2044 # 8000d110 <_ZN8KConsole11initializedE>
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
#include "../test/printing.hpp"

sem_t s12,s23,s31;


void f1(void* end) {
    8000195c:	fe010113          	addi	sp,sp,-32
    80001960:	00113c23          	sd	ra,24(sp)
    80001964:	00813823          	sd	s0,16(sp)
    80001968:	00913423          	sd	s1,8(sp)
    8000196c:	01213023          	sd	s2,0(sp)
    80001970:	02010413          	addi	s0,sp,32
    80001974:	00050913          	mv	s2,a0
    int i = 0;
    80001978:	00000493          	li	s1,0
    8000197c:	0140006f          	j	80001990 <_Z2f1Pv+0x34>
    while (*(int*)end == 0) {
        sem_wait(s31);
        printString("nit 1\n");
        if (++i == 4) *(int*)end = 1;
        sem_signal(s12);
    80001980:	0000c517          	auipc	a0,0xc
    80001984:	85853503          	ld	a0,-1960(a0) # 8000d1d8 <s12>
    80001988:	00000097          	auipc	ra,0x0
    8000198c:	c48080e7          	jalr	-952(ra) # 800015d0 <_Z10sem_signalP4KSem>
    while (*(int*)end == 0) {
    80001990:	00092783          	lw	a5,0(s2)
    80001994:	02079e63          	bnez	a5,800019d0 <_Z2f1Pv+0x74>
        sem_wait(s31);
    80001998:	0000c517          	auipc	a0,0xc
    8000199c:	83853503          	ld	a0,-1992(a0) # 8000d1d0 <s31>
    800019a0:	00000097          	auipc	ra,0x0
    800019a4:	c00080e7          	jalr	-1024(ra) # 800015a0 <_Z8sem_waitP4KSem>
        printString("nit 1\n");
    800019a8:	00008517          	auipc	a0,0x8
    800019ac:	68050513          	addi	a0,a0,1664 # 8000a028 <CONSOLE_STATUS+0x18>
    800019b0:	00005097          	auipc	ra,0x5
    800019b4:	9c8080e7          	jalr	-1592(ra) # 80006378 <_Z11printStringPKc>
        if (++i == 4) *(int*)end = 1;
    800019b8:	0014849b          	addiw	s1,s1,1
    800019bc:	00400793          	li	a5,4
    800019c0:	fcf490e3          	bne	s1,a5,80001980 <_Z2f1Pv+0x24>
    800019c4:	00100793          	li	a5,1
    800019c8:	00f92023          	sw	a5,0(s2)
    800019cc:	fb5ff06f          	j	80001980 <_Z2f1Pv+0x24>
    }

    printString("\nGotova nit 1\n");
    800019d0:	00008517          	auipc	a0,0x8
    800019d4:	65050513          	addi	a0,a0,1616 # 8000a020 <CONSOLE_STATUS+0x10>
    800019d8:	00005097          	auipc	ra,0x5
    800019dc:	9a0080e7          	jalr	-1632(ra) # 80006378 <_Z11printStringPKc>
}
    800019e0:	01813083          	ld	ra,24(sp)
    800019e4:	01013403          	ld	s0,16(sp)
    800019e8:	00813483          	ld	s1,8(sp)
    800019ec:	00013903          	ld	s2,0(sp)
    800019f0:	02010113          	addi	sp,sp,32
    800019f4:	00008067          	ret

00000000800019f8 <_Z2f2Pv>:


void f2(void* end ) {
    800019f8:	fe010113          	addi	sp,sp,-32
    800019fc:	00113c23          	sd	ra,24(sp)
    80001a00:	00813823          	sd	s0,16(sp)
    80001a04:	00913423          	sd	s1,8(sp)
    80001a08:	01213023          	sd	s2,0(sp)
    80001a0c:	02010413          	addi	s0,sp,32
    80001a10:	00050913          	mv	s2,a0
    while (*(int*)end == 0) {
    80001a14:	00092783          	lw	a5,0(s2)
    80001a18:	02079c63          	bnez	a5,80001a50 <_Z2f2Pv+0x58>
        sem_wait(s12);
    80001a1c:	0000b497          	auipc	s1,0xb
    80001a20:	7b448493          	addi	s1,s1,1972 # 8000d1d0 <s31>
    80001a24:	0084b503          	ld	a0,8(s1)
    80001a28:	00000097          	auipc	ra,0x0
    80001a2c:	b78080e7          	jalr	-1160(ra) # 800015a0 <_Z8sem_waitP4KSem>
        printString("nit 2\n");
    80001a30:	00008517          	auipc	a0,0x8
    80001a34:	60850513          	addi	a0,a0,1544 # 8000a038 <CONSOLE_STATUS+0x28>
    80001a38:	00005097          	auipc	ra,0x5
    80001a3c:	940080e7          	jalr	-1728(ra) # 80006378 <_Z11printStringPKc>
        sem_signal(s23);
    80001a40:	0104b503          	ld	a0,16(s1)
    80001a44:	00000097          	auipc	ra,0x0
    80001a48:	b8c080e7          	jalr	-1140(ra) # 800015d0 <_Z10sem_signalP4KSem>
    while (*(int*)end == 0) {
    80001a4c:	fc9ff06f          	j	80001a14 <_Z2f2Pv+0x1c>
    }


    printString("\nGotova nit 2\n");
    80001a50:	00008517          	auipc	a0,0x8
    80001a54:	5e050513          	addi	a0,a0,1504 # 8000a030 <CONSOLE_STATUS+0x20>
    80001a58:	00005097          	auipc	ra,0x5
    80001a5c:	920080e7          	jalr	-1760(ra) # 80006378 <_Z11printStringPKc>
}
    80001a60:	01813083          	ld	ra,24(sp)
    80001a64:	01013403          	ld	s0,16(sp)
    80001a68:	00813483          	ld	s1,8(sp)
    80001a6c:	00013903          	ld	s2,0(sp)
    80001a70:	02010113          	addi	sp,sp,32
    80001a74:	00008067          	ret

0000000080001a78 <_Z2f3Pv>:


void f3(void* end) {
    80001a78:	fe010113          	addi	sp,sp,-32
    80001a7c:	00113c23          	sd	ra,24(sp)
    80001a80:	00813823          	sd	s0,16(sp)
    80001a84:	00913423          	sd	s1,8(sp)
    80001a88:	01213023          	sd	s2,0(sp)
    80001a8c:	02010413          	addi	s0,sp,32
    80001a90:	00050913          	mv	s2,a0
    while (*(int*)end == 0) {
    80001a94:	00092783          	lw	a5,0(s2)
    80001a98:	02079c63          	bnez	a5,80001ad0 <_Z2f3Pv+0x58>
        sem_wait(s23);
    80001a9c:	0000b497          	auipc	s1,0xb
    80001aa0:	73448493          	addi	s1,s1,1844 # 8000d1d0 <s31>
    80001aa4:	0104b503          	ld	a0,16(s1)
    80001aa8:	00000097          	auipc	ra,0x0
    80001aac:	af8080e7          	jalr	-1288(ra) # 800015a0 <_Z8sem_waitP4KSem>
        printString("nit 3\n");
    80001ab0:	00008517          	auipc	a0,0x8
    80001ab4:	59050513          	addi	a0,a0,1424 # 8000a040 <CONSOLE_STATUS+0x30>
    80001ab8:	00005097          	auipc	ra,0x5
    80001abc:	8c0080e7          	jalr	-1856(ra) # 80006378 <_Z11printStringPKc>
        sem_signal(s31);
    80001ac0:	0004b503          	ld	a0,0(s1)
    80001ac4:	00000097          	auipc	ra,0x0
    80001ac8:	b0c080e7          	jalr	-1268(ra) # 800015d0 <_Z10sem_signalP4KSem>
    while (*(int*)end == 0) {
    80001acc:	fc9ff06f          	j	80001a94 <_Z2f3Pv+0x1c>
    }

    printString("\nGotova nit3\n");
    80001ad0:	00008517          	auipc	a0,0x8
    80001ad4:	57850513          	addi	a0,a0,1400 # 8000a048 <CONSOLE_STATUS+0x38>
    80001ad8:	00005097          	auipc	ra,0x5
    80001adc:	8a0080e7          	jalr	-1888(ra) # 80006378 <_Z11printStringPKc>
}
    80001ae0:	01813083          	ld	ra,24(sp)
    80001ae4:	01013403          	ld	s0,16(sp)
    80001ae8:	00813483          	ld	s1,8(sp)
    80001aec:	00013903          	ld	s2,0(sp)
    80001af0:	02010113          	addi	sp,sp,32
    80001af4:	00008067          	ret

0000000080001af8 <_Z4userPv>:
        printInt(period);
        printString("\n");
        if(--counter==0)terminate();
    }
};
void user(void*) {
    80001af8:	fc010113          	addi	sp,sp,-64
    80001afc:	02113c23          	sd	ra,56(sp)
    80001b00:	02813823          	sd	s0,48(sp)
    80001b04:	02913423          	sd	s1,40(sp)
    80001b08:	03213023          	sd	s2,32(sp)
    80001b0c:	01313c23          	sd	s3,24(sp)
    80001b10:	01413823          	sd	s4,16(sp)
    80001b14:	04010413          	addi	s0,sp,64
    int end = 0;
    80001b18:	fc042623          	sw	zero,-52(s0)
    Thread* nit1 = new Thread(f1, &end);
    80001b1c:	02000513          	li	a0,32
    80001b20:	00001097          	auipc	ra,0x1
    80001b24:	5f0080e7          	jalr	1520(ra) # 80003110 <_Znwm>
    80001b28:	00050a13          	mv	s4,a0
    80001b2c:	fcc40613          	addi	a2,s0,-52
    80001b30:	00000597          	auipc	a1,0x0
    80001b34:	e2c58593          	addi	a1,a1,-468 # 8000195c <_Z2f1Pv>
    80001b38:	00001097          	auipc	ra,0x1
    80001b3c:	6f8080e7          	jalr	1784(ra) # 80003230 <_ZN6ThreadC1EPFvPvES0_>
    Thread* nit2 = new Thread(f2, &end);
    80001b40:	02000513          	li	a0,32
    80001b44:	00001097          	auipc	ra,0x1
    80001b48:	5cc080e7          	jalr	1484(ra) # 80003110 <_Znwm>
    80001b4c:	00050993          	mv	s3,a0
    80001b50:	fcc40613          	addi	a2,s0,-52
    80001b54:	00000597          	auipc	a1,0x0
    80001b58:	ea458593          	addi	a1,a1,-348 # 800019f8 <_Z2f2Pv>
    80001b5c:	00001097          	auipc	ra,0x1
    80001b60:	6d4080e7          	jalr	1748(ra) # 80003230 <_ZN6ThreadC1EPFvPvES0_>
    Thread* nit3 = new Thread(f3, &end);
    80001b64:	02000513          	li	a0,32
    80001b68:	00001097          	auipc	ra,0x1
    80001b6c:	5a8080e7          	jalr	1448(ra) # 80003110 <_Znwm>
    80001b70:	00050913          	mv	s2,a0
    80001b74:	fcc40613          	addi	a2,s0,-52
    80001b78:	00000597          	auipc	a1,0x0
    80001b7c:	f0058593          	addi	a1,a1,-256 # 80001a78 <_Z2f3Pv>
    80001b80:	00001097          	auipc	ra,0x1
    80001b84:	6b0080e7          	jalr	1712(ra) # 80003230 <_ZN6ThreadC1EPFvPvES0_>
    PeriodicThread* per = new pt(10);
    80001b88:	03800513          	li	a0,56
    80001b8c:	00001097          	auipc	ra,0x1
    80001b90:	584080e7          	jalr	1412(ra) # 80003110 <_Znwm>
    80001b94:	00050493          	mv	s1,a0
    pt(time_t p): PeriodicThread(p),period(p){}
    80001b98:	00a00593          	li	a1,10
    80001b9c:	00002097          	auipc	ra,0x2
    80001ba0:	988080e7          	jalr	-1656(ra) # 80003524 <_ZN14PeriodicThreadC1Em>
    80001ba4:	0000b797          	auipc	a5,0xb
    80001ba8:	1dc78793          	addi	a5,a5,476 # 8000cd80 <_ZTV2pt+0x10>
    80001bac:	00f4b023          	sd	a5,0(s1)
    80001bb0:	00a00793          	li	a5,10
    80001bb4:	02f4b423          	sd	a5,40(s1)
    80001bb8:	00500793          	li	a5,5
    80001bbc:	02f4a823          	sw	a5,48(s1)
    sem_open(&s12, 0);
    80001bc0:	00000593          	li	a1,0
    80001bc4:	0000b517          	auipc	a0,0xb
    80001bc8:	61450513          	addi	a0,a0,1556 # 8000d1d8 <s12>
    80001bcc:	00000097          	auipc	ra,0x0
    80001bd0:	96c080e7          	jalr	-1684(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&s23, 1);
    80001bd4:	00100593          	li	a1,1
    80001bd8:	0000b517          	auipc	a0,0xb
    80001bdc:	60850513          	addi	a0,a0,1544 # 8000d1e0 <s23>
    80001be0:	00000097          	auipc	ra,0x0
    80001be4:	958080e7          	jalr	-1704(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&s31, 0);
    80001be8:	00000593          	li	a1,0
    80001bec:	0000b517          	auipc	a0,0xb
    80001bf0:	5e450513          	addi	a0,a0,1508 # 8000d1d0 <s31>
    80001bf4:	00000097          	auipc	ra,0x0
    80001bf8:	944080e7          	jalr	-1724(ra) # 80001538 <_Z8sem_openPP4KSemj>
    nit1->start();
    80001bfc:	000a0513          	mv	a0,s4
    80001c00:	00001097          	auipc	ra,0x1
    80001c04:	6c8080e7          	jalr	1736(ra) # 800032c8 <_ZN6Thread5startEv>
    nit2->start();
    80001c08:	00098513          	mv	a0,s3
    80001c0c:	00001097          	auipc	ra,0x1
    80001c10:	6bc080e7          	jalr	1724(ra) # 800032c8 <_ZN6Thread5startEv>
    nit3->start();
    80001c14:	00090513          	mv	a0,s2
    80001c18:	00001097          	auipc	ra,0x1
    80001c1c:	6b0080e7          	jalr	1712(ra) # 800032c8 <_ZN6Thread5startEv>
    per->start();
    80001c20:	00048513          	mv	a0,s1
    80001c24:	00001097          	auipc	ra,0x1
    80001c28:	6a4080e7          	jalr	1700(ra) # 800032c8 <_ZN6Thread5startEv>

    nit1->join();
    80001c2c:	000a0513          	mv	a0,s4
    80001c30:	00001097          	auipc	ra,0x1
    80001c34:	6e0080e7          	jalr	1760(ra) # 80003310 <_ZN6Thread4joinEv>
    nit2->join();
    80001c38:	00098513          	mv	a0,s3
    80001c3c:	00001097          	auipc	ra,0x1
    80001c40:	6d4080e7          	jalr	1748(ra) # 80003310 <_ZN6Thread4joinEv>
    nit3->join();
    80001c44:	00090513          	mv	a0,s2
    80001c48:	00001097          	auipc	ra,0x1
    80001c4c:	6c8080e7          	jalr	1736(ra) # 80003310 <_ZN6Thread4joinEv>
    per->terminate();
    80001c50:	00048513          	mv	a0,s1
    80001c54:	00002097          	auipc	ra,0x2
    80001c58:	8b0080e7          	jalr	-1872(ra) # 80003504 <_ZN14PeriodicThread9terminateEv>

    per->join();
    80001c5c:	00048513          	mv	a0,s1
    80001c60:	00001097          	auipc	ra,0x1
    80001c64:	6b0080e7          	jalr	1712(ra) # 80003310 <_ZN6Thread4joinEv>
    printString("\nGotove user niti\n");
    80001c68:	00008517          	auipc	a0,0x8
    80001c6c:	3f050513          	addi	a0,a0,1008 # 8000a058 <CONSOLE_STATUS+0x48>
    80001c70:	00004097          	auipc	ra,0x4
    80001c74:	708080e7          	jalr	1800(ra) # 80006378 <_Z11printStringPKc>

    printString("\nSad cu da izadjem iz usera\n");
    80001c78:	00008517          	auipc	a0,0x8
    80001c7c:	3f850513          	addi	a0,a0,1016 # 8000a070 <CONSOLE_STATUS+0x60>
    80001c80:	00004097          	auipc	ra,0x4
    80001c84:	6f8080e7          	jalr	1784(ra) # 80006378 <_Z11printStringPKc>
    80001c88:	03813083          	ld	ra,56(sp)
    80001c8c:	03013403          	ld	s0,48(sp)
    80001c90:	02813483          	ld	s1,40(sp)
    80001c94:	02013903          	ld	s2,32(sp)
    80001c98:	01813983          	ld	s3,24(sp)
    80001c9c:	01013a03          	ld	s4,16(sp)
    80001ca0:	04010113          	addi	sp,sp,64
    80001ca4:	00008067          	ret
    80001ca8:	00050493          	mv	s1,a0
    Thread* nit1 = new Thread(f1, &end);
    80001cac:	000a0513          	mv	a0,s4
    80001cb0:	00001097          	auipc	ra,0x1
    80001cb4:	4b0080e7          	jalr	1200(ra) # 80003160 <_ZdlPv>
    80001cb8:	00048513          	mv	a0,s1
    80001cbc:	0000c097          	auipc	ra,0xc
    80001cc0:	6ac080e7          	jalr	1708(ra) # 8000e368 <_Unwind_Resume>
    80001cc4:	00050493          	mv	s1,a0
    Thread* nit2 = new Thread(f2, &end);
    80001cc8:	00098513          	mv	a0,s3
    80001ccc:	00001097          	auipc	ra,0x1
    80001cd0:	494080e7          	jalr	1172(ra) # 80003160 <_ZdlPv>
    80001cd4:	00048513          	mv	a0,s1
    80001cd8:	0000c097          	auipc	ra,0xc
    80001cdc:	690080e7          	jalr	1680(ra) # 8000e368 <_Unwind_Resume>
    80001ce0:	00050493          	mv	s1,a0
    Thread* nit3 = new Thread(f3, &end);
    80001ce4:	00090513          	mv	a0,s2
    80001ce8:	00001097          	auipc	ra,0x1
    80001cec:	478080e7          	jalr	1144(ra) # 80003160 <_ZdlPv>
    80001cf0:	00048513          	mv	a0,s1
    80001cf4:	0000c097          	auipc	ra,0xc
    80001cf8:	674080e7          	jalr	1652(ra) # 8000e368 <_Unwind_Resume>
    80001cfc:	00050913          	mv	s2,a0
    PeriodicThread* per = new pt(10);
    80001d00:	00048513          	mv	a0,s1
    80001d04:	00001097          	auipc	ra,0x1
    80001d08:	45c080e7          	jalr	1116(ra) # 80003160 <_ZdlPv>
    80001d0c:	00090513          	mv	a0,s2
    80001d10:	0000c097          	auipc	ra,0xc
    80001d14:	658080e7          	jalr	1624(ra) # 8000e368 <_Unwind_Resume>

0000000080001d18 <_ZN2pt18periodicActivationEv>:
    void periodicActivation() override{
    80001d18:	fe010113          	addi	sp,sp,-32
    80001d1c:	00113c23          	sd	ra,24(sp)
    80001d20:	00813823          	sd	s0,16(sp)
    80001d24:	00913423          	sd	s1,8(sp)
    80001d28:	02010413          	addi	s0,sp,32
    80001d2c:	00050493          	mv	s1,a0
        printString("Janko ");
    80001d30:	00008517          	auipc	a0,0x8
    80001d34:	36050513          	addi	a0,a0,864 # 8000a090 <CONSOLE_STATUS+0x80>
    80001d38:	00004097          	auipc	ra,0x4
    80001d3c:	640080e7          	jalr	1600(ra) # 80006378 <_Z11printStringPKc>
        printInt(period);
    80001d40:	00000613          	li	a2,0
    80001d44:	00a00593          	li	a1,10
    80001d48:	0284a503          	lw	a0,40(s1)
    80001d4c:	00004097          	auipc	ra,0x4
    80001d50:	7dc080e7          	jalr	2012(ra) # 80006528 <_Z8printIntiii>
        printString("\n");
    80001d54:	00009517          	auipc	a0,0x9
    80001d58:	90c50513          	addi	a0,a0,-1780 # 8000a660 <CONSOLE_STATUS+0x650>
    80001d5c:	00004097          	auipc	ra,0x4
    80001d60:	61c080e7          	jalr	1564(ra) # 80006378 <_Z11printStringPKc>
        if(--counter==0)terminate();
    80001d64:	0304a783          	lw	a5,48(s1)
    80001d68:	fff7879b          	addiw	a5,a5,-1
    80001d6c:	0007871b          	sext.w	a4,a5
    80001d70:	02f4a823          	sw	a5,48(s1)
    80001d74:	00070c63          	beqz	a4,80001d8c <_ZN2pt18periodicActivationEv+0x74>
    }
    80001d78:	01813083          	ld	ra,24(sp)
    80001d7c:	01013403          	ld	s0,16(sp)
    80001d80:	00813483          	ld	s1,8(sp)
    80001d84:	02010113          	addi	sp,sp,32
    80001d88:	00008067          	ret
        if(--counter==0)terminate();
    80001d8c:	00048513          	mv	a0,s1
    80001d90:	00001097          	auipc	ra,0x1
    80001d94:	774080e7          	jalr	1908(ra) # 80003504 <_ZN14PeriodicThread9terminateEv>
    }
    80001d98:	fe1ff06f          	j	80001d78 <_ZN2pt18periodicActivationEv+0x60>

0000000080001d9c <_ZN2ptD1Ev>:
class pt:public PeriodicThread{
    80001d9c:	ff010113          	addi	sp,sp,-16
    80001da0:	00113423          	sd	ra,8(sp)
    80001da4:	00813023          	sd	s0,0(sp)
    80001da8:	01010413          	addi	s0,sp,16
private:
    sem_t myHandle;
};


class PeriodicThread : public Thread {
    80001dac:	0000b797          	auipc	a5,0xb
    80001db0:	2a47b783          	ld	a5,676(a5) # 8000d050 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001db4:	01078793          	addi	a5,a5,16
    80001db8:	00f53023          	sd	a5,0(a0)
    80001dbc:	00001097          	auipc	ra,0x1
    80001dc0:	274080e7          	jalr	628(ra) # 80003030 <_ZN6ThreadD1Ev>
    80001dc4:	00813083          	ld	ra,8(sp)
    80001dc8:	00013403          	ld	s0,0(sp)
    80001dcc:	01010113          	addi	sp,sp,16
    80001dd0:	00008067          	ret

0000000080001dd4 <_ZN2ptD0Ev>:
    80001dd4:	fe010113          	addi	sp,sp,-32
    80001dd8:	00113c23          	sd	ra,24(sp)
    80001ddc:	00813823          	sd	s0,16(sp)
    80001de0:	00913423          	sd	s1,8(sp)
    80001de4:	02010413          	addi	s0,sp,32
    80001de8:	00050493          	mv	s1,a0
    80001dec:	0000b797          	auipc	a5,0xb
    80001df0:	2647b783          	ld	a5,612(a5) # 8000d050 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001df4:	01078793          	addi	a5,a5,16
    80001df8:	00f53023          	sd	a5,0(a0)
    80001dfc:	00001097          	auipc	ra,0x1
    80001e00:	234080e7          	jalr	564(ra) # 80003030 <_ZN6ThreadD1Ev>
    80001e04:	00048513          	mv	a0,s1
    80001e08:	00001097          	auipc	ra,0x1
    80001e0c:	358080e7          	jalr	856(ra) # 80003160 <_ZdlPv>
    80001e10:	01813083          	ld	ra,24(sp)
    80001e14:	01013403          	ld	s0,16(sp)
    80001e18:	00813483          	ld	s1,8(sp)
    80001e1c:	02010113          	addi	sp,sp,32
    80001e20:	00008067          	ret

0000000080001e24 <_ZN9Scheduler3putEP3TCB>:

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    80001e24:	ff010113          	addi	sp,sp,-16
    80001e28:	00813423          	sd	s0,8(sp)
    80001e2c:	01010413          	addi	s0,sp,16
    if (tail == nullptr) {
    80001e30:	0000b797          	auipc	a5,0xb
    80001e34:	3b87b783          	ld	a5,952(a5) # 8000d1e8 <_ZN9Scheduler4tailE>
    80001e38:	02078263          	beqz	a5,80001e5c <_ZN9Scheduler3putEP3TCB+0x38>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    80001e3c:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    80001e40:	0000b797          	auipc	a5,0xb
    80001e44:	3aa7b423          	sd	a0,936(a5) # 8000d1e8 <_ZN9Scheduler4tailE>
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    static TCB* createThread(Body function, void* args, uint64* stack);

    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001e48:	00100793          	li	a5,1
    80001e4c:	04f52c23          	sw	a5,88(a0)
    }
    tcb->setStatus(TCB::ACTIVE);
}
    80001e50:	00813403          	ld	s0,8(sp)
    80001e54:	01010113          	addi	sp,sp,16
    80001e58:	00008067          	ret
        head = tail = tcb;
    80001e5c:	0000b797          	auipc	a5,0xb
    80001e60:	38c78793          	addi	a5,a5,908 # 8000d1e8 <_ZN9Scheduler4tailE>
    80001e64:	00a7b023          	sd	a0,0(a5)
    80001e68:	00a7b423          	sd	a0,8(a5)
    80001e6c:	fddff06f          	j	80001e48 <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001e70 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001e70:	ff010113          	addi	sp,sp,-16
    80001e74:	00813423          	sd	s0,8(sp)
    80001e78:	01010413          	addi	s0,sp,16
    TCB* firstThread = head;
    80001e7c:	0000b717          	auipc	a4,0xb
    80001e80:	36c70713          	addi	a4,a4,876 # 8000d1e8 <_ZN9Scheduler4tailE>
    80001e84:	00873503          	ld	a0,8(a4)
    head = head->nextInScheduler;
    80001e88:	03053783          	ld	a5,48(a0)
    80001e8c:	00f73423          	sd	a5,8(a4)
    if (head == nullptr) {
    80001e90:	00078a63          	beqz	a5,80001ea4 <_ZN9Scheduler3getEv+0x34>
        tail = head = nullptr;
    }
    firstThread->nextInScheduler = nullptr;
    80001e94:	02053823          	sd	zero,48(a0)
    return firstThread;
}
    80001e98:	00813403          	ld	s0,8(sp)
    80001e9c:	01010113          	addi	sp,sp,16
    80001ea0:	00008067          	ret
        tail = head = nullptr;
    80001ea4:	00073423          	sd	zero,8(a4)
    80001ea8:	00073023          	sd	zero,0(a4)
    80001eac:	fe9ff06f          	j	80001e94 <_ZN9Scheduler3getEv+0x24>

0000000080001eb0 <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    80001eb0:	ff010113          	addi	sp,sp,-16
    80001eb4:	00813423          	sd	s0,8(sp)
    80001eb8:	01010413          	addi	s0,sp,16
    tcb->status = TCB::SLEEPING;
    80001ebc:	00400793          	li	a5,4
    80001ec0:	04f52c23          	sw	a5,88(a0)
    if (sleepingHead == nullptr) {
    80001ec4:	0000b817          	auipc	a6,0xb
    80001ec8:	33483803          	ld	a6,820(a6) # 8000d1f8 <_ZN9Scheduler12sleepingHeadE>
    80001ecc:	02080863          	beqz	a6,80001efc <_ZN9Scheduler10putToSleepEP3TCBm+0x4c>
        tcb->timeToSleep = sleepTime;
        return;
    }
    TCB* prevSleeping = nullptr;
    time_t accumulated = 0;
    TCB* current = sleepingHead;
    80001ed0:	00080793          	mv	a5,a6
    time_t accumulated = 0;
    80001ed4:	00000693          	li	a3,0
    TCB* prevSleeping = nullptr;
    80001ed8:	00000613          	li	a2,0
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001edc:	02078863          	beqz	a5,80001f0c <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
    80001ee0:	0387b703          	ld	a4,56(a5)
    80001ee4:	00d70733          	add	a4,a4,a3
    80001ee8:	02b77263          	bgeu	a4,a1,80001f0c <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
        accumulated += current->timeToSleep;
    80001eec:	00070693          	mv	a3,a4
        prevSleeping = current;
    80001ef0:	00078613          	mv	a2,a5
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001ef4:	0407b783          	ld	a5,64(a5)
    80001ef8:	fe5ff06f          	j	80001edc <_ZN9Scheduler10putToSleepEP3TCBm+0x2c>
        sleepingHead = tcb;
    80001efc:	0000b797          	auipc	a5,0xb
    80001f00:	2ea7be23          	sd	a0,764(a5) # 8000d1f8 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80001f04:	02b53c23          	sd	a1,56(a0)
        return;
    80001f08:	02c0006f          	j	80001f34 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    }
    if (!prevSleeping) {
    80001f0c:	02060a63          	beqz	a2,80001f40 <_ZN9Scheduler10putToSleepEP3TCBm+0x90>
        sleepingHead = tcb;
        tcb->timeToSleep = sleepTime;
        tcb->nextSleeping->timeToSleep -= sleepTime;
        return;
    }
    tcb->nextSleeping = current;
    80001f10:	04f53023          	sd	a5,64(a0)
    prevSleeping->nextSleeping = tcb;
    80001f14:	04a63023          	sd	a0,64(a2)
    tcb->timeToSleep = sleepTime - accumulated;
    80001f18:	40d58733          	sub	a4,a1,a3
    80001f1c:	02e53c23          	sd	a4,56(a0)
    if (current) current->timeToSleep -= sleepTime - accumulated;
    80001f20:	00078a63          	beqz	a5,80001f34 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    80001f24:	40b686b3          	sub	a3,a3,a1
    80001f28:	0387b703          	ld	a4,56(a5)
    80001f2c:	00d706b3          	add	a3,a4,a3
    80001f30:	02d7bc23          	sd	a3,56(a5)
}
    80001f34:	00813403          	ld	s0,8(sp)
    80001f38:	01010113          	addi	sp,sp,16
    80001f3c:	00008067          	ret
        tcb->nextSleeping = sleepingHead;
    80001f40:	05053023          	sd	a6,64(a0)
        sleepingHead = tcb;
    80001f44:	0000b797          	auipc	a5,0xb
    80001f48:	2aa7ba23          	sd	a0,692(a5) # 8000d1f8 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80001f4c:	02b53c23          	sd	a1,56(a0)
        tcb->nextSleeping->timeToSleep -= sleepTime;
    80001f50:	03883683          	ld	a3,56(a6)
    80001f54:	40b686b3          	sub	a3,a3,a1
    80001f58:	02d83c23          	sd	a3,56(a6)
        return;
    80001f5c:	fd9ff06f          	j	80001f34 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>

0000000080001f60 <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
    if (!sleepingHead) return;
    80001f60:	0000b797          	auipc	a5,0xb
    80001f64:	2987b783          	ld	a5,664(a5) # 8000d1f8 <_ZN9Scheduler12sleepingHeadE>
    80001f68:	06078a63          	beqz	a5,80001fdc <_ZN9Scheduler4wakeEv+0x7c>
    sleepingHead->timeToSleep--;
    80001f6c:	0387b703          	ld	a4,56(a5)
    80001f70:	fff70713          	addi	a4,a4,-1
    80001f74:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001f78:	0000b517          	auipc	a0,0xb
    80001f7c:	28053503          	ld	a0,640(a0) # 8000d1f8 <_ZN9Scheduler12sleepingHeadE>
    80001f80:	04050e63          	beqz	a0,80001fdc <_ZN9Scheduler4wakeEv+0x7c>
    80001f84:	03853783          	ld	a5,56(a0)
    80001f88:	04079a63          	bnez	a5,80001fdc <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    80001f8c:	ff010113          	addi	sp,sp,-16
    80001f90:	00113423          	sd	ra,8(sp)
    80001f94:	00813023          	sd	s0,0(sp)
    80001f98:	01010413          	addi	s0,sp,16
    80001f9c:	00c0006f          	j	80001fa8 <_ZN9Scheduler4wakeEv+0x48>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001fa0:	03853783          	ld	a5,56(a0)
    80001fa4:	02079463          	bnez	a5,80001fcc <_ZN9Scheduler4wakeEv+0x6c>
        TCB* thread = sleepingHead;
        sleepingHead = sleepingHead->nextSleeping;
    80001fa8:	04053783          	ld	a5,64(a0)
    80001fac:	0000b717          	auipc	a4,0xb
    80001fb0:	24f73623          	sd	a5,588(a4) # 8000d1f8 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    80001fb4:	04053023          	sd	zero,64(a0)
        Scheduler::put(thread);
    80001fb8:	00000097          	auipc	ra,0x0
    80001fbc:	e6c080e7          	jalr	-404(ra) # 80001e24 <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001fc0:	0000b517          	auipc	a0,0xb
    80001fc4:	23853503          	ld	a0,568(a0) # 8000d1f8 <_ZN9Scheduler12sleepingHeadE>
    80001fc8:	fc051ce3          	bnez	a0,80001fa0 <_ZN9Scheduler4wakeEv+0x40>
    }
}
    80001fcc:	00813083          	ld	ra,8(sp)
    80001fd0:	00013403          	ld	s0,0(sp)
    80001fd4:	01010113          	addi	sp,sp,16
    80001fd8:	00008067          	ret
    80001fdc:	00008067          	ret

0000000080001fe0 <_ZN7KMemory7kmallocEm>:
    kmalloc(blocksForBitVector);

    initialized = true;
}

void* KMemory::kmalloc(size_t size) {
    80001fe0:	ff010113          	addi	sp,sp,-16
    80001fe4:	00813423          	sd	s0,8(sp)
    80001fe8:	01010413          	addi	s0,sp,16
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80001fec:	16050063          	beqz	a0,8000214c <_ZN7KMemory7kmallocEm+0x16c>
    80001ff0:	0000b797          	auipc	a5,0xb
    80001ff4:	2107b783          	ld	a5,528(a5) # 8000d200 <_ZN7KMemory14freeBlocksLeftE>
    80001ff8:	14a7ee63          	bltu	a5,a0,80002154 <_ZN7KMemory7kmallocEm+0x174>
    uint64 currentElem = 0;
    uint64 currentBit = 63;
    uint64 firstZeroElem = 0;
    uint64 firstZeroBit = 63;
    uint64 zerosFound = 0;
    bool zeroFound = false;
    80001ffc:	00000313          	li	t1,0
    uint64 zerosFound = 0;
    80002000:	00000713          	li	a4,0
    uint64 firstZeroBit = 63;
    80002004:	03f00813          	li	a6,63
    uint64 firstZeroElem = 0;
    80002008:	00000893          	li	a7,0
    uint64 currentBit = 63;
    8000200c:	03f00793          	li	a5,63
    uint64 currentElem = 0;
    80002010:	00000593          	li	a1,0
    80002014:	0080006f          	j	8000201c <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroElem = currentElem;
        } else {
            zerosFound++;
        }
        if (zerosFound == size) break;
        if (currentBit-- == 0) {
    80002018:	00068793          	mv	a5,a3
    while (currentElem < sizeOfBitVectorInUint64) {
    8000201c:	0000b697          	auipc	a3,0xb
    80002020:	1ec6b683          	ld	a3,492(a3) # 8000d208 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80002024:	08d5fa63          	bgeu	a1,a3,800020b8 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80002028:	03f00693          	li	a3,63
    8000202c:	02d78a63          	beq	a5,a3,80002060 <_ZN7KMemory7kmallocEm+0x80>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    80002030:	00359693          	slli	a3,a1,0x3
    80002034:	0000b617          	auipc	a2,0xb
    80002038:	1dc63603          	ld	a2,476(a2) # 8000d210 <_ZN7KMemory9bitVectorE>
    8000203c:	00d606b3          	add	a3,a2,a3
    80002040:	0006b683          	ld	a3,0(a3)

    static uint64 freeBlocksLeft;

    //maska sa 1 na mestu bitPos i ostalim nulama (bitPos=0..63)
    inline static uint64 maskBit(uint64 bitPos) {
        return (uint64)1 << bitPos;
    80002044:	00100613          	li	a2,1
    80002048:	00f61633          	sll	a2,a2,a5
    8000204c:	00c6f6b3          	and	a3,a3,a2
        if (bit > 0) {
    80002050:	02069a63          	bnez	a3,80002084 <_ZN7KMemory7kmallocEm+0xa4>
        } else if (!zeroFound) {
    80002054:	04030863          	beqz	t1,800020a4 <_ZN7KMemory7kmallocEm+0xc4>
            zerosFound++;
    80002058:	00170713          	addi	a4,a4,1
    8000205c:	0300006f          	j	8000208c <_ZN7KMemory7kmallocEm+0xac>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80002060:	00359693          	slli	a3,a1,0x3
    80002064:	0000b617          	auipc	a2,0xb
    80002068:	1ac63603          	ld	a2,428(a2) # 8000d210 <_ZN7KMemory9bitVectorE>
    8000206c:	00d606b3          	add	a3,a2,a3
    80002070:	0006b603          	ld	a2,0(a3)
    80002074:	fff00693          	li	a3,-1
    80002078:	fad61ce3          	bne	a2,a3,80002030 <_ZN7KMemory7kmallocEm+0x50>
            currentElem++;
    8000207c:	00158593          	addi	a1,a1,1
            continue;
    80002080:	f9dff06f          	j	8000201c <_ZN7KMemory7kmallocEm+0x3c>
            zeroFound = false;
    80002084:	00000313          	li	t1,0
            zerosFound = 0;
    80002088:	00000713          	li	a4,0
        if (zerosFound == size) break;
    8000208c:	02a70663          	beq	a4,a0,800020b8 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit-- == 0) {
    80002090:	fff78693          	addi	a3,a5,-1
    80002094:	f80792e3          	bnez	a5,80002018 <_ZN7KMemory7kmallocEm+0x38>
            currentBit = 63;
            currentElem++;
    80002098:	00158593          	addi	a1,a1,1
            currentBit = 63;
    8000209c:	03f00793          	li	a5,63
    800020a0:	f7dff06f          	j	8000201c <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroBit = currentBit;
    800020a4:	00078813          	mv	a6,a5
            firstZeroElem = currentElem;
    800020a8:	00058893          	mv	a7,a1
            zeroFound = true;
    800020ac:	00100313          	li	t1,1
            zerosFound = 1;
    800020b0:	00100713          	li	a4,1
    800020b4:	fd9ff06f          	j	8000208c <_ZN7KMemory7kmallocEm+0xac>
        }
    }
    if (zerosFound != size) return nullptr;
    800020b8:	0aa71263          	bne	a4,a0,8000215c <_ZN7KMemory7kmallocEm+0x17c>

    //alociranje blokova
    uint64 blockNum = firstZeroElem * 64 + (63 - firstZeroBit);
    800020bc:	00689793          	slli	a5,a7,0x6
    800020c0:	410787b3          	sub	a5,a5,a6
    800020c4:	03f78793          	addi	a5,a5,63
    void* addr = (char*)HEAP_START_ADDR + blockNum * MEM_BLOCK_SIZE;
    800020c8:	0000b697          	auipc	a3,0xb
    800020cc:	f806b683          	ld	a3,-128(a3) # 8000d048 <_GLOBAL_OFFSET_TABLE_+0x30>
    800020d0:	0006b583          	ld	a1,0(a3)
    800020d4:	00679793          	slli	a5,a5,0x6
    800020d8:	00f585b3          	add	a1,a1,a5
    *(uint64*)addr = size;  //da znamo koliko blokova je alocirano zaredom
    800020dc:	00a5b023          	sd	a0,0(a1)

    //upisivanje 1 u bit vektor
    currentElem = firstZeroElem;
    currentBit = firstZeroBit;
    800020e0:	0080006f          	j	800020e8 <_ZN7KMemory7kmallocEm+0x108>
    while (zerosFound > 0) {
        bitVector[currentElem] |= maskBit(currentBit);
        zerosFound--;
        if (currentBit-- == 0) {
            currentBit = 63;
    800020e4:	00078813          	mv	a6,a5
    while (zerosFound > 0) {
    800020e8:	04070063          	beqz	a4,80002128 <_ZN7KMemory7kmallocEm+0x148>
    800020ec:	00100693          	li	a3,1
    800020f0:	01069633          	sll	a2,a3,a6
        bitVector[currentElem] |= maskBit(currentBit);
    800020f4:	00389793          	slli	a5,a7,0x3
    800020f8:	0000b697          	auipc	a3,0xb
    800020fc:	1186b683          	ld	a3,280(a3) # 8000d210 <_ZN7KMemory9bitVectorE>
    80002100:	00f687b3          	add	a5,a3,a5
    80002104:	0007b683          	ld	a3,0(a5)
    80002108:	00c6e6b3          	or	a3,a3,a2
    8000210c:	00d7b023          	sd	a3,0(a5)
        zerosFound--;
    80002110:	fff70713          	addi	a4,a4,-1
        if (currentBit-- == 0) {
    80002114:	fff80793          	addi	a5,a6,-1
    80002118:	fc0816e3          	bnez	a6,800020e4 <_ZN7KMemory7kmallocEm+0x104>
            currentElem++;
    8000211c:	00188893          	addi	a7,a7,1
            currentBit = 63;
    80002120:	03f00793          	li	a5,63
    80002124:	fc1ff06f          	j	800020e4 <_ZN7KMemory7kmallocEm+0x104>
        }
    }
    freeBlocksLeft -= size;
    80002128:	0000b717          	auipc	a4,0xb
    8000212c:	0d870713          	addi	a4,a4,216 # 8000d200 <_ZN7KMemory14freeBlocksLeftE>
    80002130:	00073783          	ld	a5,0(a4)
    80002134:	40a78533          	sub	a0,a5,a0
    80002138:	00a73023          	sd	a0,0(a4)
    return (char*)addr + 2 * sizeof(uint64);    //offset 2 da bi bilo zaokruzeno na 16 zbog steka
    8000213c:	01058513          	addi	a0,a1,16
}
    80002140:	00813403          	ld	s0,8(sp)
    80002144:	01010113          	addi	sp,sp,16
    80002148:	00008067          	ret
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    8000214c:	00000513          	li	a0,0
    80002150:	ff1ff06f          	j	80002140 <_ZN7KMemory7kmallocEm+0x160>
    80002154:	00000513          	li	a0,0
    80002158:	fe9ff06f          	j	80002140 <_ZN7KMemory7kmallocEm+0x160>
    if (zerosFound != size) return nullptr;
    8000215c:	00000513          	li	a0,0
    80002160:	fe1ff06f          	j	80002140 <_ZN7KMemory7kmallocEm+0x160>

0000000080002164 <_ZN7KMemory16initializeMemoryEv>:
    if (initialized) return;
    80002164:	0000b797          	auipc	a5,0xb
    80002168:	0b47c783          	lbu	a5,180(a5) # 8000d218 <_ZN7KMemory11initializedE>
    8000216c:	0a079863          	bnez	a5,8000221c <_ZN7KMemory16initializeMemoryEv+0xb8>
void KMemory::initializeMemory() {
    80002170:	ff010113          	addi	sp,sp,-16
    80002174:	00113423          	sd	ra,8(sp)
    80002178:	00813023          	sd	s0,0(sp)
    8000217c:	01010413          	addi	s0,sp,16
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80002180:	0000b797          	auipc	a5,0xb
    80002184:	f207b783          	ld	a5,-224(a5) # 8000d0a0 <_GLOBAL_OFFSET_TABLE_+0x88>
    80002188:	0007b783          	ld	a5,0(a5)
    8000218c:	0000b717          	auipc	a4,0xb
    80002190:	ebc73703          	ld	a4,-324(a4) # 8000d048 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002194:	00073603          	ld	a2,0(a4)
    80002198:	40c787b3          	sub	a5,a5,a2
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    8000219c:	00c7d793          	srli	a5,a5,0xc
    800021a0:	0000b717          	auipc	a4,0xb
    800021a4:	06070713          	addi	a4,a4,96 # 8000d200 <_ZN7KMemory14freeBlocksLeftE>
    800021a8:	00f73423          	sd	a5,8(a4)
    numOfBlocks = sizeOfBitVectorInUint64 * sizeof(uint64) * 8; //da se zaokruzi broj postojecih blokova na umnozak 64
    800021ac:	00679693          	slli	a3,a5,0x6
    800021b0:	02d73023          	sd	a3,32(a4)
    uint64 blocksForBitVector = (sizeOfBitVectorInUint64 * sizeof(uint64) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    800021b4:	00878513          	addi	a0,a5,8
    800021b8:	00351513          	slli	a0,a0,0x3
    800021bc:	fff50513          	addi	a0,a0,-1
    800021c0:	00655513          	srli	a0,a0,0x6
    bitVector = (uint64*)HEAP_START_ADDR;
    800021c4:	00c73823          	sd	a2,16(a4)
    freeBlocksLeft = numOfBlocks;
    800021c8:	00d73023          	sd	a3,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    800021cc:	00000793          	li	a5,0
    800021d0:	0000b717          	auipc	a4,0xb
    800021d4:	03873703          	ld	a4,56(a4) # 8000d208 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    800021d8:	02e7f063          	bgeu	a5,a4,800021f8 <_ZN7KMemory16initializeMemoryEv+0x94>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    800021dc:	00379693          	slli	a3,a5,0x3
    800021e0:	0000b717          	auipc	a4,0xb
    800021e4:	03073703          	ld	a4,48(a4) # 8000d210 <_ZN7KMemory9bitVectorE>
    800021e8:	00d70733          	add	a4,a4,a3
    800021ec:	00073023          	sd	zero,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    800021f0:	00178793          	addi	a5,a5,1
    800021f4:	fddff06f          	j	800021d0 <_ZN7KMemory16initializeMemoryEv+0x6c>
    kmalloc(blocksForBitVector);
    800021f8:	00000097          	auipc	ra,0x0
    800021fc:	de8080e7          	jalr	-536(ra) # 80001fe0 <_ZN7KMemory7kmallocEm>
    initialized = true;
    80002200:	00100793          	li	a5,1
    80002204:	0000b717          	auipc	a4,0xb
    80002208:	00f70a23          	sb	a5,20(a4) # 8000d218 <_ZN7KMemory11initializedE>
}
    8000220c:	00813083          	ld	ra,8(sp)
    80002210:	00013403          	ld	s0,0(sp)
    80002214:	01010113          	addi	sp,sp,16
    80002218:	00008067          	ret
    8000221c:	00008067          	ret

0000000080002220 <_ZN7KMemory5kfreeEPv>:

int KMemory::kfree(void* ptr) {
    80002220:	ff010113          	addi	sp,sp,-16
    80002224:	00813423          	sd	s0,8(sp)
    80002228:	01010413          	addi	s0,sp,16
    if (!ptr) return 0;
    8000222c:	08050a63          	beqz	a0,800022c0 <_ZN7KMemory5kfreeEPv+0xa0>
    ptr = (char*)ptr - 2 * sizeof(uint64);
    80002230:	ff050793          	addi	a5,a0,-16
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80002234:	0000b717          	auipc	a4,0xb
    80002238:	e1473703          	ld	a4,-492(a4) # 8000d048 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000223c:	00073703          	ld	a4,0(a4)
    80002240:	40e787b3          	sub	a5,a5,a4
    80002244:	03f7f713          	andi	a4,a5,63
    80002248:	08071063          	bnez	a4,800022c8 <_ZN7KMemory5kfreeEPv+0xa8>
    uint64 blocksToFree = *(uint64*)ptr;
    8000224c:	ff053583          	ld	a1,-16(a0)
    freeBlocksLeft += blocksToFree;
    80002250:	0000b697          	auipc	a3,0xb
    80002254:	fb068693          	addi	a3,a3,-80 # 8000d200 <_ZN7KMemory14freeBlocksLeftE>
    80002258:	0006b703          	ld	a4,0(a3)
    8000225c:	00b70733          	add	a4,a4,a1
    80002260:	00e6b023          	sd	a4,0(a3)
    uint64 blockNum = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    80002264:	0067d613          	srli	a2,a5,0x6
    uint64 currentElem = blockNum / 64;
    80002268:	00c7d513          	srli	a0,a5,0xc
    uint64 currentBit = 63 - blockNum % 64;
    8000226c:	fff64613          	not	a2,a2
    80002270:	03f67613          	andi	a2,a2,63
    80002274:	0080006f          	j	8000227c <_ZN7KMemory5kfreeEPv+0x5c>
    while (blocksToFree > 0) {
        bitVector[currentElem] &= ~maskBit(currentBit);
        blocksToFree--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80002278:	00078613          	mv	a2,a5
    while (blocksToFree > 0) {
    8000227c:	04058a63          	beqz	a1,800022d0 <_ZN7KMemory5kfreeEPv+0xb0>
    80002280:	00100793          	li	a5,1
    80002284:	00c797b3          	sll	a5,a5,a2
        bitVector[currentElem] &= ~maskBit(currentBit);
    80002288:	fff7c793          	not	a5,a5
    8000228c:	00351713          	slli	a4,a0,0x3
    80002290:	0000b697          	auipc	a3,0xb
    80002294:	f806b683          	ld	a3,-128(a3) # 8000d210 <_ZN7KMemory9bitVectorE>
    80002298:	00e68733          	add	a4,a3,a4
    8000229c:	00073683          	ld	a3,0(a4)
    800022a0:	00f6f7b3          	and	a5,a3,a5
    800022a4:	00f73023          	sd	a5,0(a4)
        blocksToFree--;
    800022a8:	fff58593          	addi	a1,a1,-1
        if (currentBit-- == 0) {
    800022ac:	fff60793          	addi	a5,a2,-1
    800022b0:	fc0614e3          	bnez	a2,80002278 <_ZN7KMemory5kfreeEPv+0x58>
            currentElem++;
    800022b4:	00150513          	addi	a0,a0,1
            currentBit = 63;
    800022b8:	03f00793          	li	a5,63
    800022bc:	fbdff06f          	j	80002278 <_ZN7KMemory5kfreeEPv+0x58>
    if (!ptr) return 0;
    800022c0:	00000513          	li	a0,0
    800022c4:	0100006f          	j	800022d4 <_ZN7KMemory5kfreeEPv+0xb4>
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    800022c8:	fff00513          	li	a0,-1
    800022cc:	0080006f          	j	800022d4 <_ZN7KMemory5kfreeEPv+0xb4>
        }
    }
    return 0;
    800022d0:	00000513          	li	a0,0
}
    800022d4:	00813403          	ld	s0,8(sp)
    800022d8:	01010113          	addi	sp,sp,16
    800022dc:	00008067          	ret

00000000800022e0 <main>:
extern "C" void interruptHandler();

void userMain();

void user(void*);
int main() {
    800022e0:	fc010113          	addi	sp,sp,-64
    800022e4:	02113c23          	sd	ra,56(sp)
    800022e8:	02813823          	sd	s0,48(sp)
    800022ec:	02913423          	sd	s1,40(sp)
    800022f0:	03213023          	sd	s2,32(sp)
    800022f4:	01313c23          	sd	s3,24(sp)
    800022f8:	04010413          	addi	s0,sp,64
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    800022fc:	0000b797          	auipc	a5,0xb
    80002300:	dac7b783          	ld	a5,-596(a5) # 8000d0a8 <_GLOBAL_OFFSET_TABLE_+0x90>
    80002304:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80002308:	00000097          	auipc	ra,0x0
    8000230c:	e5c080e7          	jalr	-420(ra) # 80002164 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80002310:	fffff097          	auipc	ra,0xfffff
    80002314:	3fc080e7          	jalr	1020(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>

    //pravljenje niti
    thread_t mainHandle;
    Thread* idleHandle = new IdleThread();
    80002318:	02000513          	li	a0,32
    8000231c:	00001097          	auipc	ra,0x1
    80002320:	df4080e7          	jalr	-524(ra) # 80003110 <_Znwm>
    80002324:	00050913          	mv	s2,a0
    80002328:	00053023          	sd	zero,0(a0)
    8000232c:	00053423          	sd	zero,8(a0)
    80002330:	00053823          	sd	zero,16(a0)
    80002334:	00053c23          	sd	zero,24(a0)
class IdleThread : public Thread {
    80002338:	00001097          	auipc	ra,0x1
    8000233c:	0c0080e7          	jalr	192(ra) # 800033f8 <_ZN6ThreadC1Ev>
    80002340:	0000b797          	auipc	a5,0xb
    80002344:	a7878793          	addi	a5,a5,-1416 # 8000cdb8 <_ZTV10IdleThread+0x10>
    80002348:	00f93023          	sd	a5,0(s2)
    Thread* consoleOutputHandle = new KernelConsumer();
    8000234c:	02000513          	li	a0,32
    80002350:	00001097          	auipc	ra,0x1
    80002354:	dc0080e7          	jalr	-576(ra) # 80003110 <_Znwm>
    80002358:	00050493          	mv	s1,a0
    8000235c:	00053023          	sd	zero,0(a0)
    80002360:	00053423          	sd	zero,8(a0)
    80002364:	00053823          	sd	zero,16(a0)
    80002368:	00053c23          	sd	zero,24(a0)
class KernelConsumer : public Thread {
    8000236c:	00001097          	auipc	ra,0x1
    80002370:	08c080e7          	jalr	140(ra) # 800033f8 <_ZN6ThreadC1Ev>
    80002374:	0000b797          	auipc	a5,0xb
    80002378:	a6c78793          	addi	a5,a5,-1428 # 8000cde0 <_ZTV14KernelConsumer+0x10>
    8000237c:	00f4b023          	sd	a5,0(s1)
    //Thread* userThr = new Thread((TCB::Body)userMain, nullptr);
    Thread* userThr = new Thread(user, nullptr);
    80002380:	02000513          	li	a0,32
    80002384:	00001097          	auipc	ra,0x1
    80002388:	d8c080e7          	jalr	-628(ra) # 80003110 <_Znwm>
    8000238c:	00050993          	mv	s3,a0
    80002390:	00000613          	li	a2,0
    80002394:	0000b597          	auipc	a1,0xb
    80002398:	cec5b583          	ld	a1,-788(a1) # 8000d080 <_GLOBAL_OFFSET_TABLE_+0x68>
    8000239c:	00001097          	auipc	ra,0x1
    800023a0:	e94080e7          	jalr	-364(ra) # 80003230 <_ZN6ThreadC1EPFvPvES0_>
    800023a4:	0580006f          	j	800023fc <main+0x11c>
    800023a8:	00050493          	mv	s1,a0
    Thread* idleHandle = new IdleThread();
    800023ac:	00090513          	mv	a0,s2
    800023b0:	00001097          	auipc	ra,0x1
    800023b4:	db0080e7          	jalr	-592(ra) # 80003160 <_ZdlPv>
    800023b8:	00048513          	mv	a0,s1
    800023bc:	0000c097          	auipc	ra,0xc
    800023c0:	fac080e7          	jalr	-84(ra) # 8000e368 <_Unwind_Resume>
    800023c4:	00050913          	mv	s2,a0
    Thread* consoleOutputHandle = new KernelConsumer();
    800023c8:	00048513          	mv	a0,s1
    800023cc:	00001097          	auipc	ra,0x1
    800023d0:	d94080e7          	jalr	-620(ra) # 80003160 <_ZdlPv>
    800023d4:	00090513          	mv	a0,s2
    800023d8:	0000c097          	auipc	ra,0xc
    800023dc:	f90080e7          	jalr	-112(ra) # 8000e368 <_Unwind_Resume>
    800023e0:	00050493          	mv	s1,a0
    Thread* userThr = new Thread(user, nullptr);
    800023e4:	00098513          	mv	a0,s3
    800023e8:	00001097          	auipc	ra,0x1
    800023ec:	d78080e7          	jalr	-648(ra) # 80003160 <_ZdlPv>
    800023f0:	00048513          	mv	a0,s1
    800023f4:	0000c097          	auipc	ra,0xc
    800023f8:	f74080e7          	jalr	-140(ra) # 8000e368 <_Unwind_Resume>
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    800023fc:	00000613          	li	a2,0
    80002400:	00000597          	auipc	a1,0x0
    80002404:	ee058593          	addi	a1,a1,-288 # 800022e0 <main>
    80002408:	fc840513          	addi	a0,s0,-56
    8000240c:	fffff097          	auipc	ra,0xfffff
    80002410:	ff8080e7          	jalr	-8(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80002414:	fc843783          	ld	a5,-56(s0)

    ThreadQueue* getListOfJoiningThreads(){return &waitingToJoin;}

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }
    80002418:	0000b717          	auipc	a4,0xb
    8000241c:	c8073703          	ld	a4,-896(a4) # 8000d098 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002420:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80002424:	00100713          	li	a4,1
    80002428:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    idleHandle->start();
    8000242c:	00090513          	mv	a0,s2
    80002430:	00001097          	auipc	ra,0x1
    80002434:	e98080e7          	jalr	-360(ra) # 800032c8 <_ZN6Thread5startEv>
    consoleOutputHandle->start();
    80002438:	00048513          	mv	a0,s1
    8000243c:	00001097          	auipc	ra,0x1
    80002440:	e8c080e7          	jalr	-372(ra) # 800032c8 <_ZN6Thread5startEv>
    userThr->start();
    80002444:	00098513          	mv	a0,s3
    80002448:	00001097          	auipc	ra,0x1
    8000244c:	e80080e7          	jalr	-384(ra) # 800032c8 <_ZN6Thread5startEv>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002450:	00200493          	li	s1,2
    80002454:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    userThr->join();
    80002458:	00098513          	mv	a0,s3
    8000245c:	00001097          	auipc	ra,0x1
    80002460:	eb4080e7          	jalr	-332(ra) # 80003310 <_ZN6Thread4joinEv>
    //stavlja karakter u ulazni bafer; ako je bafer pun, ignorise se
    static void placeInInput(char c);

    //ispis svih preostalih karaktera u izlaznom baferu
    static void flush() {
        __asm__ volatile("li a0, 0x43");
    80002464:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80002468:	00000073          	ecall
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    8000246c:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80002470:	00000513          	li	a0,0
    80002474:	03813083          	ld	ra,56(sp)
    80002478:	03013403          	ld	s0,48(sp)
    8000247c:	02813483          	ld	s1,40(sp)
    80002480:	02013903          	ld	s2,32(sp)
    80002484:	01813983          	ld	s3,24(sp)
    80002488:	04010113          	addi	sp,sp,64
    8000248c:	00008067          	ret

0000000080002490 <_ZN10IdleThread3runEv>:
    void run() override {
    80002490:	ff010113          	addi	sp,sp,-16
    80002494:	00113423          	sd	ra,8(sp)
    80002498:	00813023          	sd	s0,0(sp)
    8000249c:	01010413          	addi	s0,sp,16
        while (1) { thread_dispatch(); }
    800024a0:	fffff097          	auipc	ra,0xfffff
    800024a4:	020080e7          	jalr	32(ra) # 800014c0 <_Z15thread_dispatchv>
    800024a8:	ff9ff06f          	j	800024a0 <_ZN10IdleThread3runEv+0x10>

00000000800024ac <_ZN10IdleThreadD1Ev>:
class IdleThread : public Thread {
    800024ac:	ff010113          	addi	sp,sp,-16
    800024b0:	00113423          	sd	ra,8(sp)
    800024b4:	00813023          	sd	s0,0(sp)
    800024b8:	01010413          	addi	s0,sp,16
    800024bc:	0000b797          	auipc	a5,0xb
    800024c0:	8fc78793          	addi	a5,a5,-1796 # 8000cdb8 <_ZTV10IdleThread+0x10>
    800024c4:	00f53023          	sd	a5,0(a0)
    800024c8:	00001097          	auipc	ra,0x1
    800024cc:	b68080e7          	jalr	-1176(ra) # 80003030 <_ZN6ThreadD1Ev>
    800024d0:	00813083          	ld	ra,8(sp)
    800024d4:	00013403          	ld	s0,0(sp)
    800024d8:	01010113          	addi	sp,sp,16
    800024dc:	00008067          	ret

00000000800024e0 <_ZN10IdleThreadD0Ev>:
    800024e0:	fe010113          	addi	sp,sp,-32
    800024e4:	00113c23          	sd	ra,24(sp)
    800024e8:	00813823          	sd	s0,16(sp)
    800024ec:	00913423          	sd	s1,8(sp)
    800024f0:	02010413          	addi	s0,sp,32
    800024f4:	00050493          	mv	s1,a0
    800024f8:	0000b797          	auipc	a5,0xb
    800024fc:	8c078793          	addi	a5,a5,-1856 # 8000cdb8 <_ZTV10IdleThread+0x10>
    80002500:	00f53023          	sd	a5,0(a0)
    80002504:	00001097          	auipc	ra,0x1
    80002508:	b2c080e7          	jalr	-1236(ra) # 80003030 <_ZN6ThreadD1Ev>
    8000250c:	00048513          	mv	a0,s1
    80002510:	00001097          	auipc	ra,0x1
    80002514:	c50080e7          	jalr	-944(ra) # 80003160 <_ZdlPv>
    80002518:	01813083          	ld	ra,24(sp)
    8000251c:	01013403          	ld	s0,16(sp)
    80002520:	00813483          	ld	s1,8(sp)
    80002524:	02010113          	addi	sp,sp,32
    80002528:	00008067          	ret

000000008000252c <_ZN14KernelConsumerD1Ev>:
class KernelConsumer : public Thread {
    8000252c:	ff010113          	addi	sp,sp,-16
    80002530:	00113423          	sd	ra,8(sp)
    80002534:	00813023          	sd	s0,0(sp)
    80002538:	01010413          	addi	s0,sp,16
    8000253c:	0000b797          	auipc	a5,0xb
    80002540:	8a478793          	addi	a5,a5,-1884 # 8000cde0 <_ZTV14KernelConsumer+0x10>
    80002544:	00f53023          	sd	a5,0(a0)
    80002548:	00001097          	auipc	ra,0x1
    8000254c:	ae8080e7          	jalr	-1304(ra) # 80003030 <_ZN6ThreadD1Ev>
    80002550:	00813083          	ld	ra,8(sp)
    80002554:	00013403          	ld	s0,0(sp)
    80002558:	01010113          	addi	sp,sp,16
    8000255c:	00008067          	ret

0000000080002560 <_ZN14KernelConsumerD0Ev>:
    80002560:	fe010113          	addi	sp,sp,-32
    80002564:	00113c23          	sd	ra,24(sp)
    80002568:	00813823          	sd	s0,16(sp)
    8000256c:	00913423          	sd	s1,8(sp)
    80002570:	02010413          	addi	s0,sp,32
    80002574:	00050493          	mv	s1,a0
    80002578:	0000b797          	auipc	a5,0xb
    8000257c:	86878793          	addi	a5,a5,-1944 # 8000cde0 <_ZTV14KernelConsumer+0x10>
    80002580:	00f53023          	sd	a5,0(a0)
    80002584:	00001097          	auipc	ra,0x1
    80002588:	aac080e7          	jalr	-1364(ra) # 80003030 <_ZN6ThreadD1Ev>
    8000258c:	00048513          	mv	a0,s1
    80002590:	00001097          	auipc	ra,0x1
    80002594:	bd0080e7          	jalr	-1072(ra) # 80003160 <_ZdlPv>
    80002598:	01813083          	ld	ra,24(sp)
    8000259c:	01013403          	ld	s0,16(sp)
    800025a0:	00813483          	ld	s1,8(sp)
    800025a4:	02010113          	addi	sp,sp,32
    800025a8:	00008067          	ret

00000000800025ac <_ZN14KernelConsumer3runEv>:
    void run() override {
    800025ac:	ff010113          	addi	sp,sp,-16
    800025b0:	00113423          	sd	ra,8(sp)
    800025b4:	00813023          	sd	s0,0(sp)
    800025b8:	01010413          	addi	s0,sp,16
    800025bc:	0280006f          	j	800025e4 <_ZN14KernelConsumer3runEv+0x38>

    static uint8 getSRvalue() { return *sr; }

    static uint8 getDRvalue() { return *dr; }

    static void setDRvalue(char c) { *dr = c; }
    800025c0:	0000b797          	auipc	a5,0xb
    800025c4:	ab87b783          	ld	a5,-1352(a5) # 8000d078 <_GLOBAL_OFFSET_TABLE_+0x60>
    800025c8:	0007b783          	ld	a5,0(a5)
    800025cc:	00a78023          	sb	a0,0(a5)
            sem_signal(KConsole::getOutputBufferHasSpace());
    800025d0:	0000b797          	auipc	a5,0xb
    800025d4:	ac07b783          	ld	a5,-1344(a5) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x78>
    800025d8:	0007b503          	ld	a0,0(a5)
    800025dc:	fffff097          	auipc	ra,0xfffff
    800025e0:	ff4080e7          	jalr	-12(ra) # 800015d0 <_Z10sem_signalP4KSem>
            char c = KConsole::getFromOutput();
    800025e4:	fffff097          	auipc	ra,0xfffff
    800025e8:	1e0080e7          	jalr	480(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    800025ec:	0000b797          	auipc	a5,0xb
    800025f0:	adc7b783          	ld	a5,-1316(a5) # 8000d0c8 <_GLOBAL_OFFSET_TABLE_+0xb0>
    800025f4:	0007b783          	ld	a5,0(a5)
    800025f8:	0007c783          	lbu	a5,0(a5)
            while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    800025fc:	0207f793          	andi	a5,a5,32
    80002600:	fe0786e3          	beqz	a5,800025ec <_ZN14KernelConsumer3runEv+0x40>
    80002604:	fbdff06f          	j	800025c0 <_ZN14KernelConsumer3runEv+0x14>

0000000080002608 <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80002608:	ff010113          	addi	sp,sp,-16
    8000260c:	00113423          	sd	ra,8(sp)
    80002610:	00813023          	sd	s0,0(sp)
    80002614:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80002618:	fffff097          	auipc	ra,0xfffff
    8000261c:	ea8080e7          	jalr	-344(ra) # 800014c0 <_Z15thread_dispatchv>
    80002620:	ff9ff06f          	j	80002618 <_Z4idlePv+0x10>

0000000080002624 <_Z22kernelConsumerFunctionPv>:
}

//salje na izlaz karakter iz izlaznog bafera KConsole
void kernelConsumerFunction(void*) {
    80002624:	ff010113          	addi	sp,sp,-16
    80002628:	00113423          	sd	ra,8(sp)
    8000262c:	00813023          	sd	s0,0(sp)
    80002630:	01010413          	addi	s0,sp,16
    80002634:	0280006f          	j	8000265c <_Z22kernelConsumerFunctionPv+0x38>
    static void setDRvalue(char c) { *dr = c; }
    80002638:	0000b797          	auipc	a5,0xb
    8000263c:	a407b783          	ld	a5,-1472(a5) # 8000d078 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002640:	0007b783          	ld	a5,0(a5)
    80002644:	00a78023          	sb	a0,0(a5)
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
        KConsole::setDRvalue(c);
        sem_signal(KConsole::getOutputBufferHasSpace());
    80002648:	0000b797          	auipc	a5,0xb
    8000264c:	a487b783          	ld	a5,-1464(a5) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x78>
    80002650:	0007b503          	ld	a0,0(a5)
    80002654:	fffff097          	auipc	ra,0xfffff
    80002658:	f7c080e7          	jalr	-132(ra) # 800015d0 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    8000265c:	fffff097          	auipc	ra,0xfffff
    80002660:	168080e7          	jalr	360(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    80002664:	0000b797          	auipc	a5,0xb
    80002668:	a647b783          	ld	a5,-1436(a5) # 8000d0c8 <_GLOBAL_OFFSET_TABLE_+0xb0>
    8000266c:	0007b783          	ld	a5,0(a5)
    80002670:	0007c783          	lbu	a5,0(a5)
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80002674:	0207f793          	andi	a5,a5,32
    80002678:	fe0786e3          	beqz	a5,80002664 <_Z22kernelConsumerFunctionPv+0x40>
    8000267c:	fbdff06f          	j	80002638 <_Z22kernelConsumerFunctionPv+0x14>

0000000080002680 <_Z5main1v>:
    }
}

int main1() {
    80002680:	fc010113          	addi	sp,sp,-64
    80002684:	02113c23          	sd	ra,56(sp)
    80002688:	02813823          	sd	s0,48(sp)
    8000268c:	02913423          	sd	s1,40(sp)
    80002690:	04010413          	addi	s0,sp,64
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80002694:	0000b797          	auipc	a5,0xb
    80002698:	a147b783          	ld	a5,-1516(a5) # 8000d0a8 <_GLOBAL_OFFSET_TABLE_+0x90>
    8000269c:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    800026a0:	00000097          	auipc	ra,0x0
    800026a4:	ac4080e7          	jalr	-1340(ra) # 80002164 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    800026a8:	fffff097          	auipc	ra,0xfffff
    800026ac:	064080e7          	jalr	100(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    800026b0:	00000613          	li	a2,0
    800026b4:	0000b597          	auipc	a1,0xb
    800026b8:	9d45b583          	ld	a1,-1580(a1) # 8000d088 <_GLOBAL_OFFSET_TABLE_+0x70>
    800026bc:	fd840513          	addi	a0,s0,-40
    800026c0:	fffff097          	auipc	ra,0xfffff
    800026c4:	d44080e7          	jalr	-700(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    800026c8:	fd843783          	ld	a5,-40(s0)
    static void setRunning(TCB* newRunning) { running = newRunning; }
    800026cc:	0000b717          	auipc	a4,0xb
    800026d0:	9cc73703          	ld	a4,-1588(a4) # 8000d098 <_GLOBAL_OFFSET_TABLE_+0x80>
    800026d4:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    800026d8:	00100713          	li	a4,1
    800026dc:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    800026e0:	00000613          	li	a2,0
    800026e4:	0000b597          	auipc	a1,0xb
    800026e8:	93c5b583          	ld	a1,-1732(a1) # 8000d020 <_GLOBAL_OFFSET_TABLE_+0x8>
    800026ec:	fd040513          	addi	a0,s0,-48
    800026f0:	fffff097          	auipc	ra,0xfffff
    800026f4:	d14080e7          	jalr	-748(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    800026f8:	00000613          	li	a2,0
    800026fc:	00000597          	auipc	a1,0x0
    80002700:	f2858593          	addi	a1,a1,-216 # 80002624 <_Z22kernelConsumerFunctionPv>
    80002704:	fc040513          	addi	a0,s0,-64
    80002708:	fffff097          	auipc	ra,0xfffff
    8000270c:	cfc080e7          	jalr	-772(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80002710:	00000613          	li	a2,0
    80002714:	00000597          	auipc	a1,0x0
    80002718:	ef458593          	addi	a1,a1,-268 # 80002608 <_Z4idlePv>
    8000271c:	fc840513          	addi	a0,s0,-56
    80002720:	fffff097          	auipc	ra,0xfffff
    80002724:	ce4080e7          	jalr	-796(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002728:	00200493          	li	s1,2
    8000272c:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80002730:	fd043503          	ld	a0,-48(s0)
    80002734:	fffff097          	auipc	ra,0xfffff
    80002738:	dac080e7          	jalr	-596(ra) # 800014e0 <_Z11thread_joinP3TCB>
        __asm__ volatile("li a0, 0x43");
    8000273c:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80002740:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002744:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80002748:	00000513          	li	a0,0
    8000274c:	03813083          	ld	ra,56(sp)
    80002750:	03013403          	ld	s0,48(sp)
    80002754:	02813483          	ld	s1,40(sp)
    80002758:	04010113          	addi	sp,sp,64
    8000275c:	00008067          	ret

0000000080002760 <interruptRoutine>:
#include "../test/printing.hpp"

int main();

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80002760:	f9010113          	addi	sp,sp,-112
    80002764:	06113423          	sd	ra,104(sp)
    80002768:	06813023          	sd	s0,96(sp)
    8000276c:	04913c23          	sd	s1,88(sp)
    80002770:	07010413          	addi	s0,sp,112
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002774:	14202373          	csrr	t1,scause
    80002778:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000277c:	14102373          	csrr	t1,sepc
    80002780:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002784:	10002373          	csrr	t1,sstatus
    80002788:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4;
    //uint64 a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000278c:	00050313          	mv	t1,a0
    80002790:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002794:	00058313          	mv	t1,a1
    80002798:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000279c:	00060313          	mv	t1,a2
    800027a0:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027a4:	00068313          	mv	t1,a3
    800027a8:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027ac:	00070313          	mv	t1,a4
    800027b0:	fa643023          	sd	t1,-96(s0)
//    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");

    if (scause == 0x9 || scause == 0x8) {
    800027b4:	fd843703          	ld	a4,-40(s0)
    800027b8:	00900793          	li	a5,9
    800027bc:	00f70863          	beq	a4,a5,800027cc <interruptRoutine+0x6c>
    800027c0:	fd843703          	ld	a4,-40(s0)
    800027c4:	00800793          	li	a5,8
    800027c8:	4cf71263          	bne	a4,a5,80002c8c <interruptRoutine+0x52c>
        //prekid zbog poziva ecall
        switch (a0) {
    800027cc:	fc043703          	ld	a4,-64(s0)
    800027d0:	08100793          	li	a5,129
    800027d4:	3ee7e863          	bltu	a5,a4,80002bc4 <interruptRoutine+0x464>
    800027d8:	fc043783          	ld	a5,-64(s0)
    800027dc:	00279713          	slli	a4,a5,0x2
    800027e0:	00008797          	auipc	a5,0x8
    800027e4:	91478793          	addi	a5,a5,-1772 # 8000a0f4 <CONSOLE_STATUS+0xe4>
    800027e8:	00f707b3          	add	a5,a4,a5
    800027ec:	0007a783          	lw	a5,0(a5)
    800027f0:	0007871b          	sext.w	a4,a5
    800027f4:	00008797          	auipc	a5,0x8
    800027f8:	90078793          	addi	a5,a5,-1792 # 8000a0f4 <CONSOLE_STATUS+0xe4>
    800027fc:	00f707b3          	add	a5,a4,a5
    80002800:	00078067          	jr	a5
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                KMemory::kmalloc((size_t)a1);
    80002804:	fb843503          	ld	a0,-72(s0)
    80002808:	fffff097          	auipc	ra,0xfffff
    8000280c:	7d8080e7          	jalr	2008(ra) # 80001fe0 <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    80002810:	04a43823          	sd	a0,80(s0)
                break;
    80002814:	4540006f          	j	80002c68 <interruptRoutine+0x508>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                KMemory::kfree((void*)a1);
    80002818:	fb843783          	ld	a5,-72(s0)
    8000281c:	00078513          	mv	a0,a5
    80002820:	00000097          	auipc	ra,0x0
    80002824:	a00080e7          	jalr	-1536(ra) # 80002220 <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    80002828:	04a43823          	sd	a0,80(s0)
                break;
    8000282c:	43c0006f          	j	80002c68 <interruptRoutine+0x508>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002830:	fb043783          	ld	a5,-80(s0)
    80002834:	fa843703          	ld	a4,-88(s0)
    80002838:	fa043683          	ld	a3,-96(s0)
    8000283c:	fb843483          	ld	s1,-72(s0)
    80002840:	00068613          	mv	a2,a3
    80002844:	00070593          	mv	a1,a4
    80002848:	00078513          	mv	a0,a5
    8000284c:	00001097          	auipc	ra,0x1
    80002850:	f68080e7          	jalr	-152(ra) # 800037b4 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002854:	00050793          	mv	a5,a0
    80002858:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    8000285c:	fb843783          	ld	a5,-72(s0)
    80002860:	0007b783          	ld	a5,0(a5)
    80002864:	02078863          	beqz	a5,80002894 <interruptRoutine+0x134>
                    if ((TCB::Body)a2 != (TCB::Body)main) {
    80002868:	fb043703          	ld	a4,-80(s0)
    8000286c:	0000b797          	auipc	a5,0xb
    80002870:	81c7b783          	ld	a5,-2020(a5) # 8000d088 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002874:	00f70c63          	beq	a4,a5,8000288c <interruptRoutine+0x12c>
                        Scheduler::put(*((thread_t*)a1));
    80002878:	fb843783          	ld	a5,-72(s0)
    8000287c:	0007b783          	ld	a5,0(a5)
    80002880:	00078513          	mv	a0,a5
    80002884:	fffff097          	auipc	ra,0xfffff
    80002888:	5a0080e7          	jalr	1440(ra) # 80001e24 <_ZN9Scheduler3putEP3TCB>
                    }
                    __asm__ volatile("li a0, 0");
    8000288c:	00000513          	li	a0,0
    80002890:	0080006f          	j	80002898 <interruptRoutine+0x138>
                } else {
                    __asm__ volatile("li a0, -1");
    80002894:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002898:	04a43823          	sd	a0,80(s0)
                break;
    8000289c:	3cc0006f          	j	80002c68 <interruptRoutine+0x508>
            case 0x12:
                //thread_exit
                TCB::getRunning()->setStatus(TCB::FINISHED);
    800028a0:	00000097          	auipc	ra,0x0
    800028a4:	74c080e7          	jalr	1868(ra) # 80002fec <_ZN3TCB10getRunningEv>
    800028a8:	00050793          	mv	a5,a0
    800028ac:	00500593          	li	a1,5
    800028b0:	00078513          	mv	a0,a5
    800028b4:	00000097          	auipc	ra,0x0
    800028b8:	6e4080e7          	jalr	1764(ra) # 80002f98 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined(TCB::getRunning());
    800028bc:	00000097          	auipc	ra,0x0
    800028c0:	730080e7          	jalr	1840(ra) # 80002fec <_ZN3TCB10getRunningEv>
    800028c4:	00050793          	mv	a5,a0
    800028c8:	00078513          	mv	a0,a5
    800028cc:	00001097          	auipc	ra,0x1
    800028d0:	01c080e7          	jalr	28(ra) # 800038e8 <_ZN3TCB13releaseJoinedEPS_>
                __asm__ volatile("li a0, 0");
    800028d4:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 80(s0)");
    800028d8:	04a43823          	sd	a0,80(s0)
                TCB::dispatch();
    800028dc:	00001097          	auipc	ra,0x1
    800028e0:	ddc080e7          	jalr	-548(ra) # 800036b8 <_ZN3TCB8dispatchEv>
                break;
    800028e4:	3840006f          	j	80002c68 <interruptRoutine+0x508>
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
    800028e8:	00001097          	auipc	ra,0x1
    800028ec:	dd0080e7          	jalr	-560(ra) # 800036b8 <_ZN3TCB8dispatchEv>
                break;
    800028f0:	3780006f          	j	80002c68 <interruptRoutine+0x508>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    800028f4:	fb843783          	ld	a5,-72(s0)
    800028f8:	00078513          	mv	a0,a5
    800028fc:	00001097          	auipc	ra,0x1
    80002900:	f9c080e7          	jalr	-100(ra) # 80003898 <_ZN3TCB10threadJoinEPS_>
                TCB::dispatch();
    80002904:	00001097          	auipc	ra,0x1
    80002908:	db4080e7          	jalr	-588(ra) # 800036b8 <_ZN3TCB8dispatchEv>
                break;
    8000290c:	35c0006f          	j	80002c68 <interruptRoutine+0x508>
            case 0x15:
                //destruktor klase Thread, brise nit ciji je handle prosledjen
                //a1 = rucka niti koja se brise
                if(TCB::getRunning()==(thread_t)a1){
    80002910:	00000097          	auipc	ra,0x0
    80002914:	6dc080e7          	jalr	1756(ra) # 80002fec <_ZN3TCB10getRunningEv>
    80002918:	00050713          	mv	a4,a0
    8000291c:	fb843783          	ld	a5,-72(s0)
    80002920:	40f707b3          	sub	a5,a4,a5
    80002924:	0017b793          	seqz	a5,a5
    80002928:	0ff7f793          	andi	a5,a5,255
    8000292c:	04078263          	beqz	a5,80002970 <interruptRoutine+0x210>
                    TCB::getRunning()->setStatus(TCB::FINISHED);
    80002930:	00000097          	auipc	ra,0x0
    80002934:	6bc080e7          	jalr	1724(ra) # 80002fec <_ZN3TCB10getRunningEv>
    80002938:	00050793          	mv	a5,a0
    8000293c:	00500593          	li	a1,5
    80002940:	00078513          	mv	a0,a5
    80002944:	00000097          	auipc	ra,0x0
    80002948:	654080e7          	jalr	1620(ra) # 80002f98 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                    TCB::releaseJoined(TCB::getRunning());
    8000294c:	00000097          	auipc	ra,0x0
    80002950:	6a0080e7          	jalr	1696(ra) # 80002fec <_ZN3TCB10getRunningEv>
    80002954:	00050793          	mv	a5,a0
    80002958:	00078513          	mv	a0,a5
    8000295c:	00001097          	auipc	ra,0x1
    80002960:	f8c080e7          	jalr	-116(ra) # 800038e8 <_ZN3TCB13releaseJoinedEPS_>
                    TCB::dispatch();
    80002964:	00001097          	auipc	ra,0x1
    80002968:	d54080e7          	jalr	-684(ra) # 800036b8 <_ZN3TCB8dispatchEv>
                }
                else{
                    TCB::quitThread((thread_t)a1);
                    TCB::releaseJoined((thread_t)a1);
                }
                break;
    8000296c:	2fc0006f          	j	80002c68 <interruptRoutine+0x508>
                    TCB::quitThread((thread_t)a1);
    80002970:	fb843783          	ld	a5,-72(s0)
    80002974:	00078513          	mv	a0,a5
    80002978:	00001097          	auipc	ra,0x1
    8000297c:	fbc080e7          	jalr	-68(ra) # 80003934 <_ZN3TCB10quitThreadEPS_>
                    TCB::releaseJoined((thread_t)a1);
    80002980:	fb843783          	ld	a5,-72(s0)
    80002984:	00078513          	mv	a0,a5
    80002988:	00001097          	auipc	ra,0x1
    8000298c:	f60080e7          	jalr	-160(ra) # 800038e8 <_ZN3TCB13releaseJoinedEPS_>
                break;
    80002990:	2d80006f          	j	80002c68 <interruptRoutine+0x508>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    80002994:	fb043783          	ld	a5,-80(s0)
    80002998:	0007879b          	sext.w	a5,a5
    8000299c:	fb843483          	ld	s1,-72(s0)
    800029a0:	00078513          	mv	a0,a5
    800029a4:	00001097          	auipc	ra,0x1
    800029a8:	184080e7          	jalr	388(ra) # 80003b28 <_ZN4KSem7initSemEj>
    800029ac:	00050793          	mv	a5,a0
    800029b0:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    800029b4:	fb843783          	ld	a5,-72(s0)
    800029b8:	0007b783          	ld	a5,0(a5)
    800029bc:	00078663          	beqz	a5,800029c8 <interruptRoutine+0x268>
                    __asm__ volatile("li a0, 0");
    800029c0:	00000513          	li	a0,0
    800029c4:	0080006f          	j	800029cc <interruptRoutine+0x26c>
                } else {
                    __asm__ volatile("li a0, -1");
    800029c8:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800029cc:	04a43823          	sd	a0,80(s0)
                break;
    800029d0:	2980006f          	j	80002c68 <interruptRoutine+0x508>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    800029d4:	fb843783          	ld	a5,-72(s0)
    800029d8:	00078513          	mv	a0,a5
    800029dc:	00001097          	auipc	ra,0x1
    800029e0:	298080e7          	jalr	664(ra) # 80003c74 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    800029e4:	04a43823          	sd	a0,80(s0)
                delete (sem_t)a1;
    800029e8:	fb843483          	ld	s1,-72(s0)
    800029ec:	26048063          	beqz	s1,80002c4c <interruptRoutine+0x4ec>
    800029f0:	00048513          	mv	a0,s1
    800029f4:	00000097          	auipc	ra,0x0
    800029f8:	458080e7          	jalr	1112(ra) # 80002e4c <_ZN4KSemD1Ev>
    800029fc:	00048513          	mv	a0,s1
    80002a00:	00001097          	auipc	ra,0x1
    80002a04:	100080e7          	jalr	256(ra) # 80003b00 <_ZN4KSemdlEPv>
                break;
    80002a08:	2440006f          	j	80002c4c <interruptRoutine+0x4ec>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80002a0c:	fb843783          	ld	a5,-72(s0)
    80002a10:	00078513          	mv	a0,a5
    80002a14:	00001097          	auipc	ra,0x1
    80002a18:	1a0080e7          	jalr	416(ra) # 80003bb4 <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002a1c:	04a43823          	sd	a0,80(s0)
                break;
    80002a20:	2480006f          	j	80002c68 <interruptRoutine+0x508>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    80002a24:	fb843783          	ld	a5,-72(s0)
    80002a28:	00078513          	mv	a0,a5
    80002a2c:	00001097          	auipc	ra,0x1
    80002a30:	204080e7          	jalr	516(ra) # 80003c30 <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002a34:	04a43823          	sd	a0,80(s0)
                break;
    80002a38:	2300006f          	j	80002c68 <interruptRoutine+0x508>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    80002a3c:	fb843783          	ld	a5,-72(s0)
    80002a40:	00078663          	beqz	a5,80002a4c <interruptRoutine+0x2ec>
                    __asm__ volatile("li a0, 0");
    80002a44:	00000513          	li	a0,0
    80002a48:	0080006f          	j	80002a50 <interruptRoutine+0x2f0>
                } else {
                    __asm__ volatile("li a0, -1");
    80002a4c:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002a50:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    80002a54:	fb843783          	ld	a5,-72(s0)
    80002a58:	1e078e63          	beqz	a5,80002c54 <interruptRoutine+0x4f4>
                    Scheduler::putToSleep(TCB::getRunning(), (time_t)a1);
    80002a5c:	00000097          	auipc	ra,0x0
    80002a60:	590080e7          	jalr	1424(ra) # 80002fec <_ZN3TCB10getRunningEv>
    80002a64:	00050793          	mv	a5,a0
    80002a68:	fb843583          	ld	a1,-72(s0)
    80002a6c:	00078513          	mv	a0,a5
    80002a70:	fffff097          	auipc	ra,0xfffff
    80002a74:	440080e7          	jalr	1088(ra) # 80001eb0 <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::dispatch();
    80002a78:	00001097          	auipc	ra,0x1
    80002a7c:	c40080e7          	jalr	-960(ra) # 800036b8 <_ZN3TCB8dispatchEv>
                }
                break;
    80002a80:	1d40006f          	j	80002c54 <interruptRoutine+0x4f4>
            case 0x41:
                //getc
                KConsole::kgetc();
    80002a84:	fffff097          	auipc	ra,0xfffff
    80002a88:	e74080e7          	jalr	-396(ra) # 800018f8 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002a8c:	04a43823          	sd	a0,80(s0)
                break;
    80002a90:	1d80006f          	j	80002c68 <interruptRoutine+0x508>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    80002a94:	fb843783          	ld	a5,-72(s0)
    80002a98:	0ff7f793          	andi	a5,a5,255
    80002a9c:	00078513          	mv	a0,a5
    80002aa0:	fffff097          	auipc	ra,0xfffff
    80002aa4:	de8080e7          	jalr	-536(ra) # 80001888 <_ZN8KConsole5kputcEc>
                break;
    80002aa8:	1c00006f          	j	80002c68 <interruptRoutine+0x508>
            case 0x43:
                //flush izlaznog bafera konzole
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    80002aac:	00000097          	auipc	ra,0x0
    80002ab0:	4a4080e7          	jalr	1188(ra) # 80002f50 <_ZN8KConsole13getOutputHeadEv>
    80002ab4:	00050793          	mv	a5,a0
    80002ab8:	00078493          	mv	s1,a5
    80002abc:	00000097          	auipc	ra,0x0
    80002ac0:	4b8080e7          	jalr	1208(ra) # 80002f74 <_ZN8KConsole13getOutputTailEv>
    80002ac4:	00050793          	mv	a5,a0
    80002ac8:	00048713          	mv	a4,s1
    80002acc:	40f707b3          	sub	a5,a4,a5
    80002ad0:	00f037b3          	snez	a5,a5
    80002ad4:	0ff7f793          	andi	a5,a5,255
    80002ad8:	18078263          	beqz	a5,80002c5c <interruptRoutine+0x4fc>
                    char c = KConsole::getFromOutput();
    80002adc:	fffff097          	auipc	ra,0xfffff
    80002ae0:	ce8080e7          	jalr	-792(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    80002ae4:	00050793          	mv	a5,a0
    80002ae8:	f8f40ba3          	sb	a5,-105(s0)
                    while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80002aec:	00000097          	auipc	ra,0x0
    80002af0:	3c8080e7          	jalr	968(ra) # 80002eb4 <_ZN8KConsole10getSRvalueEv>
    80002af4:	00050793          	mv	a5,a0
    80002af8:	0207f793          	andi	a5,a5,32
    80002afc:	0017b793          	seqz	a5,a5
    80002b00:	0ff7f793          	andi	a5,a5,255
    80002b04:	00078463          	beqz	a5,80002b0c <interruptRoutine+0x3ac>
    80002b08:	fe5ff06f          	j	80002aec <interruptRoutine+0x38c>
                    KConsole::setDRvalue(c);
    80002b0c:	f9744783          	lbu	a5,-105(s0)
    80002b10:	00078513          	mv	a0,a5
    80002b14:	00000097          	auipc	ra,0x0
    80002b18:	3f0080e7          	jalr	1008(ra) # 80002f04 <_ZN8KConsole10setDRvalueEc>
                    sem_signal(KConsole::getOutputBufferHasSpace());
    80002b1c:	00000097          	auipc	ra,0x0
    80002b20:	410080e7          	jalr	1040(ra) # 80002f2c <_ZN8KConsole23getOutputBufferHasSpaceEv>
    80002b24:	00050793          	mv	a5,a0
    80002b28:	00078513          	mv	a0,a5
    80002b2c:	fffff097          	auipc	ra,0xfffff
    80002b30:	aa4080e7          	jalr	-1372(ra) # 800015d0 <_Z10sem_signalP4KSem>
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    80002b34:	f79ff06f          	j	80002aac <interruptRoutine+0x34c>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002b38:	fb043783          	ld	a5,-80(s0)
    80002b3c:	fa843703          	ld	a4,-88(s0)
    80002b40:	fa043683          	ld	a3,-96(s0)
    80002b44:	fb843483          	ld	s1,-72(s0)
    80002b48:	00068613          	mv	a2,a3
    80002b4c:	00070593          	mv	a1,a4
    80002b50:	00078513          	mv	a0,a5
    80002b54:	00001097          	auipc	ra,0x1
    80002b58:	c60080e7          	jalr	-928(ra) # 800037b4 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002b5c:	00050793          	mv	a5,a0
    80002b60:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80002b64:	fb843783          	ld	a5,-72(s0)
    80002b68:	0007b783          	ld	a5,0(a5)
    80002b6c:	00078663          	beqz	a5,80002b78 <interruptRoutine+0x418>
                    __asm__ volatile("li a0, 0");
    80002b70:	00000513          	li	a0,0
    80002b74:	0080006f          	j	80002b7c <interruptRoutine+0x41c>
                } else {
                    __asm__ volatile("li a0, -1");
    80002b78:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002b7c:	04a43823          	sd	a0,80(s0)
                break;
    80002b80:	0e80006f          	j	80002c68 <interruptRoutine+0x508>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                if (((thread_t)a1)->getBody() != (TCB::Body)main) {
    80002b84:	fb843783          	ld	a5,-72(s0)
    80002b88:	00078513          	mv	a0,a5
    80002b8c:	00000097          	auipc	ra,0x0
    80002b90:	444080e7          	jalr	1092(ra) # 80002fd0 <_ZN3TCB7getBodyEv>
    80002b94:	00050713          	mv	a4,a0
    80002b98:	0000a797          	auipc	a5,0xa
    80002b9c:	4f07b783          	ld	a5,1264(a5) # 8000d088 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002ba0:	40f707b3          	sub	a5,a4,a5
    80002ba4:	00f037b3          	snez	a5,a5
    80002ba8:	0ff7f793          	andi	a5,a5,255
    80002bac:	0a078c63          	beqz	a5,80002c64 <interruptRoutine+0x504>
                    Scheduler::put((thread_t)a1);
    80002bb0:	fb843783          	ld	a5,-72(s0)
    80002bb4:	00078513          	mv	a0,a5
    80002bb8:	fffff097          	auipc	ra,0xfffff
    80002bbc:	26c080e7          	jalr	620(ra) # 80001e24 <_ZN9Scheduler3putEP3TCB>
                }
                break;
    80002bc0:	0a40006f          	j	80002c64 <interruptRoutine+0x504>
            default:
                printString("\nNepostojeci op code: ");
    80002bc4:	00007517          	auipc	a0,0x7
    80002bc8:	4d450513          	addi	a0,a0,1236 # 8000a098 <CONSOLE_STATUS+0x88>
    80002bcc:	00003097          	auipc	ra,0x3
    80002bd0:	7ac080e7          	jalr	1964(ra) # 80006378 <_Z11printStringPKc>
                printInt(a0);
    80002bd4:	fc043783          	ld	a5,-64(s0)
    80002bd8:	0007879b          	sext.w	a5,a5
    80002bdc:	00000613          	li	a2,0
    80002be0:	00a00593          	li	a1,10
    80002be4:	00078513          	mv	a0,a5
    80002be8:	00004097          	auipc	ra,0x4
    80002bec:	940080e7          	jalr	-1728(ra) # 80006528 <_Z8printIntiii>
                printString("\nscause: ");
    80002bf0:	00007517          	auipc	a0,0x7
    80002bf4:	4c050513          	addi	a0,a0,1216 # 8000a0b0 <CONSOLE_STATUS+0xa0>
    80002bf8:	00003097          	auipc	ra,0x3
    80002bfc:	780080e7          	jalr	1920(ra) # 80006378 <_Z11printStringPKc>
                printInt(scause);
    80002c00:	fd843783          	ld	a5,-40(s0)
    80002c04:	0007879b          	sext.w	a5,a5
    80002c08:	00000613          	li	a2,0
    80002c0c:	00a00593          	li	a1,10
    80002c10:	00078513          	mv	a0,a5
    80002c14:	00004097          	auipc	ra,0x4
    80002c18:	914080e7          	jalr	-1772(ra) # 80006528 <_Z8printIntiii>
                printString("\nsepc: ");
    80002c1c:	00007517          	auipc	a0,0x7
    80002c20:	4a450513          	addi	a0,a0,1188 # 8000a0c0 <CONSOLE_STATUS+0xb0>
    80002c24:	00003097          	auipc	ra,0x3
    80002c28:	754080e7          	jalr	1876(ra) # 80006378 <_Z11printStringPKc>
                printInt(sepc);
    80002c2c:	fd043783          	ld	a5,-48(s0)
    80002c30:	0007879b          	sext.w	a5,a5
    80002c34:	00000613          	li	a2,0
    80002c38:	00a00593          	li	a1,10
    80002c3c:	00078513          	mv	a0,a5
    80002c40:	00004097          	auipc	ra,0x4
    80002c44:	8e8080e7          	jalr	-1816(ra) # 80006528 <_Z8printIntiii>
                break;
    80002c48:	0200006f          	j	80002c68 <interruptRoutine+0x508>
                break;
    80002c4c:	00000013          	nop
    80002c50:	0180006f          	j	80002c68 <interruptRoutine+0x508>
                break;
    80002c54:	00000013          	nop
    80002c58:	0100006f          	j	80002c68 <interruptRoutine+0x508>
                break;
    80002c5c:	00000013          	nop
    80002c60:	0080006f          	j	80002c68 <interruptRoutine+0x508>
                break;
    80002c64:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    80002c68:	fd043783          	ld	a5,-48(s0)
    80002c6c:	00478793          	addi	a5,a5,4
    80002c70:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002c74:	fd043783          	ld	a5,-48(s0)
    80002c78:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002c7c:	fc843783          	ld	a5,-56(s0)
    80002c80:	10079073          	csrw	sstatus,a5
    80002c84:	00000013          	nop
        printString("\nsepc: ");
        printInt(sepc);
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    }
    80002c88:	1ac0006f          	j	80002e34 <interruptRoutine+0x6d4>
    } else if (scause == 0x8000000000000009) {
    80002c8c:	fd843703          	ld	a4,-40(s0)
    80002c90:	fff00793          	li	a5,-1
    80002c94:	03f79793          	slli	a5,a5,0x3f
    80002c98:	00978793          	addi	a5,a5,9
    80002c9c:	08f71463          	bne	a4,a5,80002d24 <interruptRoutine+0x5c4>
        uint64 irq = plic_claim();
    80002ca0:	00005097          	auipc	ra,0x5
    80002ca4:	724080e7          	jalr	1828(ra) # 800083c4 <plic_claim>
    80002ca8:	00050793          	mv	a5,a0
    80002cac:	f8f43c23          	sd	a5,-104(s0)
        if (irq == CONSOLE_IRQ) {
    80002cb0:	f9843703          	ld	a4,-104(s0)
    80002cb4:	00a00793          	li	a5,10
    80002cb8:	02f71c63          	bne	a4,a5,80002cf0 <interruptRoutine+0x590>
            if (KConsole::getSRvalue() & CONSOLE_RX_STATUS_BIT) {
    80002cbc:	00000097          	auipc	ra,0x0
    80002cc0:	1f8080e7          	jalr	504(ra) # 80002eb4 <_ZN8KConsole10getSRvalueEv>
    80002cc4:	00050793          	mv	a5,a0
    80002cc8:	0017f793          	andi	a5,a5,1
    80002ccc:	00f037b3          	snez	a5,a5
    80002cd0:	0ff7f793          	andi	a5,a5,255
    80002cd4:	00078e63          	beqz	a5,80002cf0 <interruptRoutine+0x590>
                KConsole::placeInInput(KConsole::getDRvalue());
    80002cd8:	00000097          	auipc	ra,0x0
    80002cdc:	204080e7          	jalr	516(ra) # 80002edc <_ZN8KConsole10getDRvalueEv>
    80002ce0:	00050793          	mv	a5,a0
    80002ce4:	00078513          	mv	a0,a5
    80002ce8:	fffff097          	auipc	ra,0xfffff
    80002cec:	b34080e7          	jalr	-1228(ra) # 8000181c <_ZN8KConsole12placeInInputEc>
        plic_complete(irq);
    80002cf0:	f9843783          	ld	a5,-104(s0)
    80002cf4:	0007879b          	sext.w	a5,a5
    80002cf8:	00078513          	mv	a0,a5
    80002cfc:	00005097          	auipc	ra,0x5
    80002d00:	700080e7          	jalr	1792(ra) # 800083fc <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002d04:	fd043783          	ld	a5,-48(s0)
    80002d08:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002d0c:	fc843783          	ld	a5,-56(s0)
    80002d10:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    80002d14:	20000513          	li	a0,512
    80002d18:	00000097          	auipc	ra,0x0
    80002d1c:	180080e7          	jalr	384(ra) # 80002e98 <_ZN5Riscv6mc_sipEm>
    80002d20:	1140006f          	j	80002e34 <interruptRoutine+0x6d4>
    } else if (scause == 0x8000000000000001) {
    80002d24:	fd843703          	ld	a4,-40(s0)
    80002d28:	fff00793          	li	a5,-1
    80002d2c:	03f79793          	slli	a5,a5,0x3f
    80002d30:	00178793          	addi	a5,a5,1
    80002d34:	08f71463          	bne	a4,a5,80002dbc <interruptRoutine+0x65c>
        Scheduler::wake();
    80002d38:	fffff097          	auipc	ra,0xfffff
    80002d3c:	228080e7          	jalr	552(ra) # 80001f60 <_ZN9Scheduler4wakeEv>
        TCB::getRunningTimeSlice()++;
    80002d40:	00000097          	auipc	ra,0x0
    80002d44:	2d0080e7          	jalr	720(ra) # 80003010 <_ZN3TCB19getRunningTimeSliceEv>
    80002d48:	00050793          	mv	a5,a0
    80002d4c:	0007b703          	ld	a4,0(a5)
    80002d50:	00170713          	addi	a4,a4,1
    80002d54:	00e7b023          	sd	a4,0(a5)
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
    80002d58:	00000097          	auipc	ra,0x0
    80002d5c:	2b8080e7          	jalr	696(ra) # 80003010 <_ZN3TCB19getRunningTimeSliceEv>
    80002d60:	00050793          	mv	a5,a0
    80002d64:	0007b483          	ld	s1,0(a5)
    80002d68:	00000097          	auipc	ra,0x0
    80002d6c:	284080e7          	jalr	644(ra) # 80002fec <_ZN3TCB10getRunningEv>
    80002d70:	00050793          	mv	a5,a0
    80002d74:	00078513          	mv	a0,a5
    80002d78:	00000097          	auipc	ra,0x0
    80002d7c:	23c080e7          	jalr	572(ra) # 80002fb4 <_ZN3TCB12getTimeSliceEv>
    80002d80:	00050793          	mv	a5,a0
    80002d84:	00f4b7b3          	sltu	a5,s1,a5
    80002d88:	0017c793          	xori	a5,a5,1
    80002d8c:	0ff7f793          	andi	a5,a5,255
    80002d90:	00078663          	beqz	a5,80002d9c <interruptRoutine+0x63c>
            TCB::dispatch();
    80002d94:	00001097          	auipc	ra,0x1
    80002d98:	924080e7          	jalr	-1756(ra) # 800036b8 <_ZN3TCB8dispatchEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002d9c:	fd043783          	ld	a5,-48(s0)
    80002da0:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002da4:	fc843783          	ld	a5,-56(s0)
    80002da8:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    80002dac:	00200513          	li	a0,2
    80002db0:	00000097          	auipc	ra,0x0
    80002db4:	0e8080e7          	jalr	232(ra) # 80002e98 <_ZN5Riscv6mc_sipEm>
    80002db8:	07c0006f          	j	80002e34 <interruptRoutine+0x6d4>
        printString("\nGreska u prekidnoj rutini\n");
    80002dbc:	00007517          	auipc	a0,0x7
    80002dc0:	30c50513          	addi	a0,a0,780 # 8000a0c8 <CONSOLE_STATUS+0xb8>
    80002dc4:	00003097          	auipc	ra,0x3
    80002dc8:	5b4080e7          	jalr	1460(ra) # 80006378 <_Z11printStringPKc>
        printString("scause: ");
    80002dcc:	00007517          	auipc	a0,0x7
    80002dd0:	31c50513          	addi	a0,a0,796 # 8000a0e8 <CONSOLE_STATUS+0xd8>
    80002dd4:	00003097          	auipc	ra,0x3
    80002dd8:	5a4080e7          	jalr	1444(ra) # 80006378 <_Z11printStringPKc>
        printInt(scause);
    80002ddc:	fd843783          	ld	a5,-40(s0)
    80002de0:	0007879b          	sext.w	a5,a5
    80002de4:	00000613          	li	a2,0
    80002de8:	00a00593          	li	a1,10
    80002dec:	00078513          	mv	a0,a5
    80002df0:	00003097          	auipc	ra,0x3
    80002df4:	738080e7          	jalr	1848(ra) # 80006528 <_Z8printIntiii>
        printString("\nsepc: ");
    80002df8:	00007517          	auipc	a0,0x7
    80002dfc:	2c850513          	addi	a0,a0,712 # 8000a0c0 <CONSOLE_STATUS+0xb0>
    80002e00:	00003097          	auipc	ra,0x3
    80002e04:	578080e7          	jalr	1400(ra) # 80006378 <_Z11printStringPKc>
        printInt(sepc);
    80002e08:	fd043783          	ld	a5,-48(s0)
    80002e0c:	0007879b          	sext.w	a5,a5
    80002e10:	00000613          	li	a2,0
    80002e14:	00a00593          	li	a1,10
    80002e18:	00078513          	mv	a0,a5
    80002e1c:	00003097          	auipc	ra,0x3
    80002e20:	70c080e7          	jalr	1804(ra) # 80006528 <_Z8printIntiii>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002e24:	fd043783          	ld	a5,-48(s0)
    80002e28:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002e2c:	fc843783          	ld	a5,-56(s0)
    80002e30:	10079073          	csrw	sstatus,a5
    80002e34:	00000013          	nop
    80002e38:	06813083          	ld	ra,104(sp)
    80002e3c:	06013403          	ld	s0,96(sp)
    80002e40:	05813483          	ld	s1,88(sp)
    80002e44:	07010113          	addi	sp,sp,112
    80002e48:	00008067          	ret

0000000080002e4c <_ZN4KSemD1Ev>:
#define PROJEKAT2023_KSEM_HPP

#include "../h/ThreadQueue.hpp"

//klasa napravljena po uzoru na semafor u skolskom jezgru
class KSem {
    80002e4c:	fe010113          	addi	sp,sp,-32
    80002e50:	00113c23          	sd	ra,24(sp)
    80002e54:	00813823          	sd	s0,16(sp)
    80002e58:	00913423          	sd	s1,8(sp)
    80002e5c:	02010413          	addi	s0,sp,32
    80002e60:	00050493          	mv	s1,a0
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    80002e64:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002e68:	00050e63          	beqz	a0,80002e84 <_ZN4KSemD1Ev+0x38>
            front = front->next;
    80002e6c:	00853783          	ld	a5,8(a0)
    80002e70:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002e74:	fe0508e3          	beqz	a0,80002e64 <_ZN4KSemD1Ev+0x18>
            mem_free(ptr);
    80002e78:	ffffe097          	auipc	ra,0xffffe
    80002e7c:	55c080e7          	jalr	1372(ra) # 800013d4 <_Z8mem_freePv>
        }
    80002e80:	fe5ff06f          	j	80002e64 <_ZN4KSemD1Ev+0x18>
    80002e84:	01813083          	ld	ra,24(sp)
    80002e88:	01013403          	ld	s0,16(sp)
    80002e8c:	00813483          	ld	s1,8(sp)
    80002e90:	02010113          	addi	sp,sp,32
    80002e94:	00008067          	ret

0000000080002e98 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002e98:	ff010113          	addi	sp,sp,-16
    80002e9c:	00813423          	sd	s0,8(sp)
    80002ea0:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80002ea4:	14453073          	csrc	sip,a0
}
    80002ea8:	00813403          	ld	s0,8(sp)
    80002eac:	01010113          	addi	sp,sp,16
    80002eb0:	00008067          	ret

0000000080002eb4 <_ZN8KConsole10getSRvalueEv>:
    static uint8 getSRvalue() { return *sr; }
    80002eb4:	ff010113          	addi	sp,sp,-16
    80002eb8:	00813423          	sd	s0,8(sp)
    80002ebc:	01010413          	addi	s0,sp,16
    80002ec0:	0000a797          	auipc	a5,0xa
    80002ec4:	2087b783          	ld	a5,520(a5) # 8000d0c8 <_GLOBAL_OFFSET_TABLE_+0xb0>
    80002ec8:	0007b783          	ld	a5,0(a5)
    80002ecc:	0007c503          	lbu	a0,0(a5)
    80002ed0:	00813403          	ld	s0,8(sp)
    80002ed4:	01010113          	addi	sp,sp,16
    80002ed8:	00008067          	ret

0000000080002edc <_ZN8KConsole10getDRvalueEv>:
    static uint8 getDRvalue() { return *dr; }
    80002edc:	ff010113          	addi	sp,sp,-16
    80002ee0:	00813423          	sd	s0,8(sp)
    80002ee4:	01010413          	addi	s0,sp,16
    80002ee8:	0000a797          	auipc	a5,0xa
    80002eec:	1907b783          	ld	a5,400(a5) # 8000d078 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002ef0:	0007b783          	ld	a5,0(a5)
    80002ef4:	0007c503          	lbu	a0,0(a5)
    80002ef8:	00813403          	ld	s0,8(sp)
    80002efc:	01010113          	addi	sp,sp,16
    80002f00:	00008067          	ret

0000000080002f04 <_ZN8KConsole10setDRvalueEc>:
    static void setDRvalue(char c) { *dr = c; }
    80002f04:	ff010113          	addi	sp,sp,-16
    80002f08:	00813423          	sd	s0,8(sp)
    80002f0c:	01010413          	addi	s0,sp,16
    80002f10:	0000a797          	auipc	a5,0xa
    80002f14:	1687b783          	ld	a5,360(a5) # 8000d078 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002f18:	0007b783          	ld	a5,0(a5)
    80002f1c:	00a78023          	sb	a0,0(a5)
    80002f20:	00813403          	ld	s0,8(sp)
    80002f24:	01010113          	addi	sp,sp,16
    80002f28:	00008067          	ret

0000000080002f2c <_ZN8KConsole23getOutputBufferHasSpaceEv>:

    static sem_t getOutputBufferHasSpace() { return outputBufferHasSpace; }
    80002f2c:	ff010113          	addi	sp,sp,-16
    80002f30:	00813423          	sd	s0,8(sp)
    80002f34:	01010413          	addi	s0,sp,16
    80002f38:	0000a797          	auipc	a5,0xa
    80002f3c:	1587b783          	ld	a5,344(a5) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x78>
    80002f40:	0007b503          	ld	a0,0(a5)
    80002f44:	00813403          	ld	s0,8(sp)
    80002f48:	01010113          	addi	sp,sp,16
    80002f4c:	00008067          	ret

0000000080002f50 <_ZN8KConsole13getOutputHeadEv>:

    static int getOutputHead() { return outputHead; }
    80002f50:	ff010113          	addi	sp,sp,-16
    80002f54:	00813423          	sd	s0,8(sp)
    80002f58:	01010413          	addi	s0,sp,16
    80002f5c:	0000a797          	auipc	a5,0xa
    80002f60:	10c7b783          	ld	a5,268(a5) # 8000d068 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002f64:	0007a503          	lw	a0,0(a5)
    80002f68:	00813403          	ld	s0,8(sp)
    80002f6c:	01010113          	addi	sp,sp,16
    80002f70:	00008067          	ret

0000000080002f74 <_ZN8KConsole13getOutputTailEv>:

    static int getOutputTail() { return outputTail; }
    80002f74:	ff010113          	addi	sp,sp,-16
    80002f78:	00813423          	sd	s0,8(sp)
    80002f7c:	01010413          	addi	s0,sp,16
    80002f80:	0000a797          	auipc	a5,0xa
    80002f84:	1407b783          	ld	a5,320(a5) # 8000d0c0 <_GLOBAL_OFFSET_TABLE_+0xa8>
    80002f88:	0007a503          	lw	a0,0(a5)
    80002f8c:	00813403          	ld	s0,8(sp)
    80002f90:	01010113          	addi	sp,sp,16
    80002f94:	00008067          	ret

0000000080002f98 <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    80002f98:	ff010113          	addi	sp,sp,-16
    80002f9c:	00813423          	sd	s0,8(sp)
    80002fa0:	01010413          	addi	s0,sp,16
    80002fa4:	04b52c23          	sw	a1,88(a0)
    80002fa8:	00813403          	ld	s0,8(sp)
    80002fac:	01010113          	addi	sp,sp,16
    80002fb0:	00008067          	ret

0000000080002fb4 <_ZN3TCB12getTimeSliceEv>:
    uint64 getTimeSlice() { return timeSlice; }
    80002fb4:	ff010113          	addi	sp,sp,-16
    80002fb8:	00813423          	sd	s0,8(sp)
    80002fbc:	01010413          	addi	s0,sp,16
    80002fc0:	02853503          	ld	a0,40(a0)
    80002fc4:	00813403          	ld	s0,8(sp)
    80002fc8:	01010113          	addi	sp,sp,16
    80002fcc:	00008067          	ret

0000000080002fd0 <_ZN3TCB7getBodyEv>:
    Body getBody() { return threadFunction; }
    80002fd0:	ff010113          	addi	sp,sp,-16
    80002fd4:	00813423          	sd	s0,8(sp)
    80002fd8:	01010413          	addi	s0,sp,16
    80002fdc:	01053503          	ld	a0,16(a0)
    80002fe0:	00813403          	ld	s0,8(sp)
    80002fe4:	01010113          	addi	sp,sp,16
    80002fe8:	00008067          	ret

0000000080002fec <_ZN3TCB10getRunningEv>:
    static TCB* getRunning() { return running; }
    80002fec:	ff010113          	addi	sp,sp,-16
    80002ff0:	00813423          	sd	s0,8(sp)
    80002ff4:	01010413          	addi	s0,sp,16
    80002ff8:	0000a797          	auipc	a5,0xa
    80002ffc:	0a07b783          	ld	a5,160(a5) # 8000d098 <_GLOBAL_OFFSET_TABLE_+0x80>
    80003000:	0007b503          	ld	a0,0(a5)
    80003004:	00813403          	ld	s0,8(sp)
    80003008:	01010113          	addi	sp,sp,16
    8000300c:	00008067          	ret

0000000080003010 <_ZN3TCB19getRunningTimeSliceEv>:

    static uint64 &getRunningTimeSlice() { return runningTimeSlice; }
    80003010:	ff010113          	addi	sp,sp,-16
    80003014:	00813423          	sd	s0,8(sp)
    80003018:	01010413          	addi	s0,sp,16
    8000301c:	0000a517          	auipc	a0,0xa
    80003020:	01453503          	ld	a0,20(a0) # 8000d030 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003024:	00813403          	ld	s0,8(sp)
    80003028:	01010113          	addi	sp,sp,16
    8000302c:	00008067          	ret

0000000080003030 <_ZN6ThreadD1Ev>:
    //a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

    __asm__ volatile("ecall");
}

Thread::~Thread() {
    80003030:	ff010113          	addi	sp,sp,-16
    80003034:	00813423          	sd	s0,8(sp)
    80003038:	01010413          	addi	s0,sp,16
    8000303c:	0000a797          	auipc	a5,0xa
    80003040:	dcc78793          	addi	a5,a5,-564 # 8000ce08 <_ZTV6Thread+0x10>
    80003044:	00f53023          	sd	a5,0(a0)
    //ne treba da se gasi running nit, vec nit na koju pokazuje rucka od this
//    thread_join(this->myHandle);
//    delete myHandle;

    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003048:	00853303          	ld	t1,8(a0)
    8000304c:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x15");
    80003050:	01500513          	li	a0,21

    __asm__ volatile("ecall");
    80003054:	00000073          	ecall
}
    80003058:	00813403          	ld	s0,8(sp)
    8000305c:	01010113          	addi	sp,sp,16
    80003060:	00008067          	ret

0000000080003064 <_ZN6Thread7wrapperEPv>:

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
    80003064:	02050863          	beqz	a0,80003094 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80003068:	ff010113          	addi	sp,sp,-16
    8000306c:	00113423          	sd	ra,8(sp)
    80003070:	00813023          	sd	s0,0(sp)
    80003074:	01010413          	addi	s0,sp,16
        ((Thread*)thread)->run();
    80003078:	00053783          	ld	a5,0(a0)
    8000307c:	0107b783          	ld	a5,16(a5)
    80003080:	000780e7          	jalr	a5
    }
}
    80003084:	00813083          	ld	ra,8(sp)
    80003088:	00013403          	ld	s0,0(sp)
    8000308c:	01010113          	addi	sp,sp,16
    80003090:	00008067          	ret
    80003094:	00008067          	ret

0000000080003098 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80003098:	fe010113          	addi	sp,sp,-32
    8000309c:	00113c23          	sd	ra,24(sp)
    800030a0:	00813823          	sd	s0,16(sp)
    800030a4:	00913423          	sd	s1,8(sp)
    800030a8:	02010413          	addi	s0,sp,32
    800030ac:	00050493          	mv	s1,a0
    800030b0:	0000a797          	auipc	a5,0xa
    800030b4:	d8078793          	addi	a5,a5,-640 # 8000ce30 <_ZTV9Semaphore+0x10>
    800030b8:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    800030bc:	00853503          	ld	a0,8(a0)
    800030c0:	ffffe097          	auipc	ra,0xffffe
    800030c4:	4b0080e7          	jalr	1200(ra) # 80001570 <_Z9sem_closeP4KSem>
    delete myHandle;
    800030c8:	0084b483          	ld	s1,8(s1)
    800030cc:	02048863          	beqz	s1,800030fc <_ZN9SemaphoreD1Ev+0x64>
        return front == nullptr;
    800030d0:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    800030d4:	00050e63          	beqz	a0,800030f0 <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    800030d8:	00853783          	ld	a5,8(a0)
    800030dc:	00f4b423          	sd	a5,8(s1)
            delete node;
    800030e0:	fe0508e3          	beqz	a0,800030d0 <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    800030e4:	ffffe097          	auipc	ra,0xffffe
    800030e8:	2f0080e7          	jalr	752(ra) # 800013d4 <_Z8mem_freePv>
        }
    800030ec:	fe5ff06f          	j	800030d0 <_ZN9SemaphoreD1Ev+0x38>
    800030f0:	00048513          	mv	a0,s1
    800030f4:	00001097          	auipc	ra,0x1
    800030f8:	a0c080e7          	jalr	-1524(ra) # 80003b00 <_ZN4KSemdlEPv>
}
    800030fc:	01813083          	ld	ra,24(sp)
    80003100:	01013403          	ld	s0,16(sp)
    80003104:	00813483          	ld	s1,8(sp)
    80003108:	02010113          	addi	sp,sp,32
    8000310c:	00008067          	ret

0000000080003110 <_Znwm>:
void* operator new(size_t size) {
    80003110:	ff010113          	addi	sp,sp,-16
    80003114:	00113423          	sd	ra,8(sp)
    80003118:	00813023          	sd	s0,0(sp)
    8000311c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003120:	ffffe097          	auipc	ra,0xffffe
    80003124:	274080e7          	jalr	628(ra) # 80001394 <_Z9mem_allocm>
}
    80003128:	00813083          	ld	ra,8(sp)
    8000312c:	00013403          	ld	s0,0(sp)
    80003130:	01010113          	addi	sp,sp,16
    80003134:	00008067          	ret

0000000080003138 <_Znam>:
void* operator new[](size_t size) {
    80003138:	ff010113          	addi	sp,sp,-16
    8000313c:	00113423          	sd	ra,8(sp)
    80003140:	00813023          	sd	s0,0(sp)
    80003144:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003148:	ffffe097          	auipc	ra,0xffffe
    8000314c:	24c080e7          	jalr	588(ra) # 80001394 <_Z9mem_allocm>
}
    80003150:	00813083          	ld	ra,8(sp)
    80003154:	00013403          	ld	s0,0(sp)
    80003158:	01010113          	addi	sp,sp,16
    8000315c:	00008067          	ret

0000000080003160 <_ZdlPv>:
noexcept {
    80003160:	ff010113          	addi	sp,sp,-16
    80003164:	00113423          	sd	ra,8(sp)
    80003168:	00813023          	sd	s0,0(sp)
    8000316c:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80003170:	ffffe097          	auipc	ra,0xffffe
    80003174:	264080e7          	jalr	612(ra) # 800013d4 <_Z8mem_freePv>
}
    80003178:	00813083          	ld	ra,8(sp)
    8000317c:	00013403          	ld	s0,0(sp)
    80003180:	01010113          	addi	sp,sp,16
    80003184:	00008067          	ret

0000000080003188 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80003188:	fe010113          	addi	sp,sp,-32
    8000318c:	00113c23          	sd	ra,24(sp)
    80003190:	00813823          	sd	s0,16(sp)
    80003194:	00913423          	sd	s1,8(sp)
    80003198:	02010413          	addi	s0,sp,32
    8000319c:	00050493          	mv	s1,a0
}
    800031a0:	00000097          	auipc	ra,0x0
    800031a4:	e90080e7          	jalr	-368(ra) # 80003030 <_ZN6ThreadD1Ev>
    800031a8:	00048513          	mv	a0,s1
    800031ac:	00000097          	auipc	ra,0x0
    800031b0:	fb4080e7          	jalr	-76(ra) # 80003160 <_ZdlPv>
    800031b4:	01813083          	ld	ra,24(sp)
    800031b8:	01013403          	ld	s0,16(sp)
    800031bc:	00813483          	ld	s1,8(sp)
    800031c0:	02010113          	addi	sp,sp,32
    800031c4:	00008067          	ret

00000000800031c8 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800031c8:	fe010113          	addi	sp,sp,-32
    800031cc:	00113c23          	sd	ra,24(sp)
    800031d0:	00813823          	sd	s0,16(sp)
    800031d4:	00913423          	sd	s1,8(sp)
    800031d8:	02010413          	addi	s0,sp,32
    800031dc:	00050493          	mv	s1,a0
}
    800031e0:	00000097          	auipc	ra,0x0
    800031e4:	eb8080e7          	jalr	-328(ra) # 80003098 <_ZN9SemaphoreD1Ev>
    800031e8:	00048513          	mv	a0,s1
    800031ec:	00000097          	auipc	ra,0x0
    800031f0:	f74080e7          	jalr	-140(ra) # 80003160 <_ZdlPv>
    800031f4:	01813083          	ld	ra,24(sp)
    800031f8:	01013403          	ld	s0,16(sp)
    800031fc:	00813483          	ld	s1,8(sp)
    80003200:	02010113          	addi	sp,sp,32
    80003204:	00008067          	ret

0000000080003208 <_ZdaPv>:
noexcept {
    80003208:	ff010113          	addi	sp,sp,-16
    8000320c:	00113423          	sd	ra,8(sp)
    80003210:	00813023          	sd	s0,0(sp)
    80003214:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80003218:	ffffe097          	auipc	ra,0xffffe
    8000321c:	1bc080e7          	jalr	444(ra) # 800013d4 <_Z8mem_freePv>
}
    80003220:	00813083          	ld	ra,8(sp)
    80003224:	00013403          	ld	s0,0(sp)
    80003228:	01010113          	addi	sp,sp,16
    8000322c:	00008067          	ret

0000000080003230 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80003230:	fd010113          	addi	sp,sp,-48
    80003234:	02113423          	sd	ra,40(sp)
    80003238:	02813023          	sd	s0,32(sp)
    8000323c:	00913c23          	sd	s1,24(sp)
    80003240:	01213823          	sd	s2,16(sp)
    80003244:	01313423          	sd	s3,8(sp)
    80003248:	03010413          	addi	s0,sp,48
    8000324c:	00050493          	mv	s1,a0
    80003250:	00058913          	mv	s2,a1
    80003254:	00060993          	mv	s3,a2
    80003258:	0000a797          	auipc	a5,0xa
    8000325c:	bb078793          	addi	a5,a5,-1104 # 8000ce08 <_ZTV6Thread+0x10>
    80003260:	00f53023          	sd	a5,0(a0)
    this->body = body;
    80003264:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    80003268:	00c53c23          	sd	a2,24(a0)
    if (body != (TCB::Body)main) {
    8000326c:	0000a797          	auipc	a5,0xa
    80003270:	e1c7b783          	ld	a5,-484(a5) # 8000d088 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003274:	04f58663          	beq	a1,a5,800032c0 <_ZN6ThreadC1EPFvPvES0_+0x90>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80003278:	00001537          	lui	a0,0x1
    8000327c:	ffffe097          	auipc	ra,0xffffe
    80003280:	118080e7          	jalr	280(ra) # 80001394 <_Z9mem_allocm>
    80003284:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003288:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000328c:	00098693          	mv	a3,s3
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003290:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003294:	00848493          	addi	s1,s1,8
    80003298:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    8000329c:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    800032a0:	00000073          	ecall
}
    800032a4:	02813083          	ld	ra,40(sp)
    800032a8:	02013403          	ld	s0,32(sp)
    800032ac:	01813483          	ld	s1,24(sp)
    800032b0:	01013903          	ld	s2,16(sp)
    800032b4:	00813983          	ld	s3,8(sp)
    800032b8:	03010113          	addi	sp,sp,48
    800032bc:	00008067          	ret
    uint64* stack = nullptr;
    800032c0:	00000313          	li	t1,0
    800032c4:	fc5ff06f          	j	80003288 <_ZN6ThreadC1EPFvPvES0_+0x58>

00000000800032c8 <_ZN6Thread5startEv>:
int Thread::start() {
    800032c8:	ff010113          	addi	sp,sp,-16
    800032cc:	00813423          	sd	s0,8(sp)
    800032d0:	01010413          	addi	s0,sp,16
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    800032d4:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    800032d8:	02030463          	beqz	t1,80003300 <_ZN6Thread5startEv+0x38>
    ThreadStatus getStatus() { return this->status; }
    800032dc:	05832783          	lw	a5,88(t1)
    800032e0:	02079463          	bnez	a5,80003308 <_ZN6Thread5startEv+0x40>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800032e4:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    800032e8:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    800032ec:	00000073          	ecall
    return 0;
    800032f0:	00000513          	li	a0,0
}
    800032f4:	00813403          	ld	s0,8(sp)
    800032f8:	01010113          	addi	sp,sp,16
    800032fc:	00008067          	ret
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    80003300:	fff00513          	li	a0,-1
    80003304:	ff1ff06f          	j	800032f4 <_ZN6Thread5startEv+0x2c>
    80003308:	fff00513          	li	a0,-1
    8000330c:	fe9ff06f          	j	800032f4 <_ZN6Thread5startEv+0x2c>

0000000080003310 <_ZN6Thread4joinEv>:
void Thread::join() {
    80003310:	ff010113          	addi	sp,sp,-16
    80003314:	00113423          	sd	ra,8(sp)
    80003318:	00813023          	sd	s0,0(sp)
    8000331c:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80003320:	00853503          	ld	a0,8(a0)
    80003324:	ffffe097          	auipc	ra,0xffffe
    80003328:	1bc080e7          	jalr	444(ra) # 800014e0 <_Z11thread_joinP3TCB>
}
    8000332c:	00813083          	ld	ra,8(sp)
    80003330:	00013403          	ld	s0,0(sp)
    80003334:	01010113          	addi	sp,sp,16
    80003338:	00008067          	ret

000000008000333c <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    8000333c:	ff010113          	addi	sp,sp,-16
    80003340:	00113423          	sd	ra,8(sp)
    80003344:	00813023          	sd	s0,0(sp)
    80003348:	01010413          	addi	s0,sp,16
    thread_dispatch();
    8000334c:	ffffe097          	auipc	ra,0xffffe
    80003350:	174080e7          	jalr	372(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80003354:	00813083          	ld	ra,8(sp)
    80003358:	00013403          	ld	s0,0(sp)
    8000335c:	01010113          	addi	sp,sp,16
    80003360:	00008067          	ret

0000000080003364 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80003364:	ff010113          	addi	sp,sp,-16
    80003368:	00113423          	sd	ra,8(sp)
    8000336c:	00813023          	sd	s0,0(sp)
    80003370:	01010413          	addi	s0,sp,16
    time_sleep(t);
    80003374:	ffffe097          	auipc	ra,0xffffe
    80003378:	194080e7          	jalr	404(ra) # 80001508 <_Z10time_sleepm>
}
    8000337c:	00000513          	li	a0,0
    80003380:	00813083          	ld	ra,8(sp)
    80003384:	00013403          	ld	s0,0(sp)
    80003388:	01010113          	addi	sp,sp,16
    8000338c:	00008067          	ret

0000000080003390 <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    80003390:	fe010113          	addi	sp,sp,-32
    80003394:	00113c23          	sd	ra,24(sp)
    80003398:	00813823          	sd	s0,16(sp)
    8000339c:	00913423          	sd	s1,8(sp)
    800033a0:	02010413          	addi	s0,sp,32
    800033a4:	00050493          	mv	s1,a0
    while (period != -1UL) {
    800033a8:	0204b703          	ld	a4,32(s1)
    800033ac:	fff00793          	li	a5,-1
    800033b0:	02f70663          	beq	a4,a5,800033dc <_ZN14PeriodicThread3runEv+0x4c>
        periodicActivation();
    800033b4:	0004b783          	ld	a5,0(s1)
    800033b8:	0187b783          	ld	a5,24(a5)
    800033bc:	00048513          	mv	a0,s1
    800033c0:	000780e7          	jalr	a5
        if (period == -1UL) break;
    800033c4:	0204b503          	ld	a0,32(s1)
    800033c8:	fff00793          	li	a5,-1
    800033cc:	00f50863          	beq	a0,a5,800033dc <_ZN14PeriodicThread3runEv+0x4c>
        sleep(period);
    800033d0:	00000097          	auipc	ra,0x0
    800033d4:	f94080e7          	jalr	-108(ra) # 80003364 <_ZN6Thread5sleepEm>
    while (period != -1UL) {
    800033d8:	fd1ff06f          	j	800033a8 <_ZN14PeriodicThread3runEv+0x18>
    }
    thread_exit();
    800033dc:	ffffe097          	auipc	ra,0xffffe
    800033e0:	0bc080e7          	jalr	188(ra) # 80001498 <_Z11thread_exitv>
}
    800033e4:	01813083          	ld	ra,24(sp)
    800033e8:	01013403          	ld	s0,16(sp)
    800033ec:	00813483          	ld	s1,8(sp)
    800033f0:	02010113          	addi	sp,sp,32
    800033f4:	00008067          	ret

00000000800033f8 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    800033f8:	fe010113          	addi	sp,sp,-32
    800033fc:	00113c23          	sd	ra,24(sp)
    80003400:	00813823          	sd	s0,16(sp)
    80003404:	00913423          	sd	s1,8(sp)
    80003408:	02010413          	addi	s0,sp,32
    8000340c:	00050493          	mv	s1,a0
    80003410:	0000a797          	auipc	a5,0xa
    80003414:	9f878793          	addi	a5,a5,-1544 # 8000ce08 <_ZTV6Thread+0x10>
    80003418:	00f53023          	sd	a5,0(a0)
    this->body = wrapper;
    8000341c:	00000797          	auipc	a5,0x0
    80003420:	c4878793          	addi	a5,a5,-952 # 80003064 <_ZN6Thread7wrapperEPv>
    80003424:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80003428:	00a53c23          	sd	a0,24(a0)
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    8000342c:	00001537          	lui	a0,0x1
    80003430:	ffffe097          	auipc	ra,0xffffe
    80003434:	f64080e7          	jalr	-156(ra) # 80001394 <_Z9mem_allocm>
    80003438:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000343c:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003440:	0184b303          	ld	t1,24(s1)
    80003444:	00030693          	mv	a3,t1
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003448:	0104b303          	ld	t1,16(s1)
    8000344c:	00030613          	mv	a2,t1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003450:	00848493          	addi	s1,s1,8
    80003454:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80003458:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    8000345c:	00000073          	ecall
}
    80003460:	01813083          	ld	ra,24(sp)
    80003464:	01013403          	ld	s0,16(sp)
    80003468:	00813483          	ld	s1,8(sp)
    8000346c:	02010113          	addi	sp,sp,32
    80003470:	00008067          	ret

0000000080003474 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80003474:	ff010113          	addi	sp,sp,-16
    80003478:	00113423          	sd	ra,8(sp)
    8000347c:	00813023          	sd	s0,0(sp)
    80003480:	01010413          	addi	s0,sp,16
    80003484:	0000a797          	auipc	a5,0xa
    80003488:	9ac78793          	addi	a5,a5,-1620 # 8000ce30 <_ZTV9Semaphore+0x10>
    8000348c:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle, init);
    80003490:	00850513          	addi	a0,a0,8
    80003494:	ffffe097          	auipc	ra,0xffffe
    80003498:	0a4080e7          	jalr	164(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    8000349c:	00813083          	ld	ra,8(sp)
    800034a0:	00013403          	ld	s0,0(sp)
    800034a4:	01010113          	addi	sp,sp,16
    800034a8:	00008067          	ret

00000000800034ac <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    800034ac:	ff010113          	addi	sp,sp,-16
    800034b0:	00113423          	sd	ra,8(sp)
    800034b4:	00813023          	sd	s0,0(sp)
    800034b8:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    800034bc:	00853503          	ld	a0,8(a0)
    800034c0:	ffffe097          	auipc	ra,0xffffe
    800034c4:	0e0080e7          	jalr	224(ra) # 800015a0 <_Z8sem_waitP4KSem>
}
    800034c8:	00813083          	ld	ra,8(sp)
    800034cc:	00013403          	ld	s0,0(sp)
    800034d0:	01010113          	addi	sp,sp,16
    800034d4:	00008067          	ret

00000000800034d8 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    800034d8:	ff010113          	addi	sp,sp,-16
    800034dc:	00113423          	sd	ra,8(sp)
    800034e0:	00813023          	sd	s0,0(sp)
    800034e4:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    800034e8:	00853503          	ld	a0,8(a0)
    800034ec:	ffffe097          	auipc	ra,0xffffe
    800034f0:	0e4080e7          	jalr	228(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    800034f4:	00813083          	ld	ra,8(sp)
    800034f8:	00013403          	ld	s0,0(sp)
    800034fc:	01010113          	addi	sp,sp,16
    80003500:	00008067          	ret

0000000080003504 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80003504:	ff010113          	addi	sp,sp,-16
    80003508:	00813423          	sd	s0,8(sp)
    8000350c:	01010413          	addi	s0,sp,16
    this->period = -1;
    80003510:	fff00793          	li	a5,-1
    80003514:	02f53023          	sd	a5,32(a0)
}
    80003518:	00813403          	ld	s0,8(sp)
    8000351c:	01010113          	addi	sp,sp,16
    80003520:	00008067          	ret

0000000080003524 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    80003524:	fe010113          	addi	sp,sp,-32
    80003528:	00113c23          	sd	ra,24(sp)
    8000352c:	00813823          	sd	s0,16(sp)
    80003530:	00913423          	sd	s1,8(sp)
    80003534:	01213023          	sd	s2,0(sp)
    80003538:	02010413          	addi	s0,sp,32
    8000353c:	00050493          	mv	s1,a0
    80003540:	00058913          	mv	s2,a1
    80003544:	00000097          	auipc	ra,0x0
    80003548:	eb4080e7          	jalr	-332(ra) # 800033f8 <_ZN6ThreadC1Ev>
    8000354c:	0000a797          	auipc	a5,0xa
    80003550:	90478793          	addi	a5,a5,-1788 # 8000ce50 <_ZTV14PeriodicThread+0x10>
    80003554:	00f4b023          	sd	a5,0(s1)
    80003558:	0324b023          	sd	s2,32(s1)
}
    8000355c:	01813083          	ld	ra,24(sp)
    80003560:	01013403          	ld	s0,16(sp)
    80003564:	00813483          	ld	s1,8(sp)
    80003568:	00013903          	ld	s2,0(sp)
    8000356c:	02010113          	addi	sp,sp,32
    80003570:	00008067          	ret

0000000080003574 <_ZN7Console4getcEv>:

char Console::getc() {
    80003574:	ff010113          	addi	sp,sp,-16
    80003578:	00113423          	sd	ra,8(sp)
    8000357c:	00813023          	sd	s0,0(sp)
    80003580:	01010413          	addi	s0,sp,16
    return ::getc();
    80003584:	ffffe097          	auipc	ra,0xffffe
    80003588:	07c080e7          	jalr	124(ra) # 80001600 <_Z4getcv>
}
    8000358c:	00813083          	ld	ra,8(sp)
    80003590:	00013403          	ld	s0,0(sp)
    80003594:	01010113          	addi	sp,sp,16
    80003598:	00008067          	ret

000000008000359c <_ZN7Console4putcEc>:

void Console::putc(char c) {
    8000359c:	ff010113          	addi	sp,sp,-16
    800035a0:	00113423          	sd	ra,8(sp)
    800035a4:	00813023          	sd	s0,0(sp)
    800035a8:	01010413          	addi	s0,sp,16
    ::putc(c);
    800035ac:	ffffe097          	auipc	ra,0xffffe
    800035b0:	07c080e7          	jalr	124(ra) # 80001628 <_Z4putcc>
}
    800035b4:	00813083          	ld	ra,8(sp)
    800035b8:	00013403          	ld	s0,0(sp)
    800035bc:	01010113          	addi	sp,sp,16
    800035c0:	00008067          	ret

00000000800035c4 <_ZN6Thread3runEv>:
    virtual void run() {}
    800035c4:	ff010113          	addi	sp,sp,-16
    800035c8:	00813423          	sd	s0,8(sp)
    800035cc:	01010413          	addi	s0,sp,16
    800035d0:	00813403          	ld	s0,8(sp)
    800035d4:	01010113          	addi	sp,sp,16
    800035d8:	00008067          	ret

00000000800035dc <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    800035dc:	ff010113          	addi	sp,sp,-16
    800035e0:	00813423          	sd	s0,8(sp)
    800035e4:	01010413          	addi	s0,sp,16
    800035e8:	00813403          	ld	s0,8(sp)
    800035ec:	01010113          	addi	sp,sp,16
    800035f0:	00008067          	ret

00000000800035f4 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800035f4:	ff010113          	addi	sp,sp,-16
    800035f8:	00113423          	sd	ra,8(sp)
    800035fc:	00813023          	sd	s0,0(sp)
    80003600:	01010413          	addi	s0,sp,16
    80003604:	0000a797          	auipc	a5,0xa
    80003608:	84c78793          	addi	a5,a5,-1972 # 8000ce50 <_ZTV14PeriodicThread+0x10>
    8000360c:	00f53023          	sd	a5,0(a0)
    80003610:	00000097          	auipc	ra,0x0
    80003614:	a20080e7          	jalr	-1504(ra) # 80003030 <_ZN6ThreadD1Ev>
    80003618:	00813083          	ld	ra,8(sp)
    8000361c:	00013403          	ld	s0,0(sp)
    80003620:	01010113          	addi	sp,sp,16
    80003624:	00008067          	ret

0000000080003628 <_ZN14PeriodicThreadD0Ev>:
    80003628:	fe010113          	addi	sp,sp,-32
    8000362c:	00113c23          	sd	ra,24(sp)
    80003630:	00813823          	sd	s0,16(sp)
    80003634:	00913423          	sd	s1,8(sp)
    80003638:	02010413          	addi	s0,sp,32
    8000363c:	00050493          	mv	s1,a0
    80003640:	0000a797          	auipc	a5,0xa
    80003644:	81078793          	addi	a5,a5,-2032 # 8000ce50 <_ZTV14PeriodicThread+0x10>
    80003648:	00f53023          	sd	a5,0(a0)
    8000364c:	00000097          	auipc	ra,0x0
    80003650:	9e4080e7          	jalr	-1564(ra) # 80003030 <_ZN6ThreadD1Ev>
    80003654:	00048513          	mv	a0,s1
    80003658:	00000097          	auipc	ra,0x0
    8000365c:	b08080e7          	jalr	-1272(ra) # 80003160 <_ZdlPv>
    80003660:	01813083          	ld	ra,24(sp)
    80003664:	01013403          	ld	s0,16(sp)
    80003668:	00813483          	ld	s1,8(sp)
    8000366c:	02010113          	addi	sp,sp,32
    80003670:	00008067          	ret

0000000080003674 <_ZN3TCB7wrapperEv>:
    }

    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
}

void TCB::wrapper() {
    80003674:	ff010113          	addi	sp,sp,-16
    80003678:	00113423          	sd	ra,8(sp)
    8000367c:	00813023          	sd	s0,0(sp)
    80003680:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch)
    Riscv::returnFromInterrupt();
    80003684:	00000097          	auipc	ra,0x0
    80003688:	434080e7          	jalr	1076(ra) # 80003ab8 <_ZN5Riscv19returnFromInterruptEv>
    //na dalje se izvrsavamo u user modu (osim za kernel funkcije)
    running->threadFunction(running->args);
    8000368c:	0000a797          	auipc	a5,0xa
    80003690:	b9c7b783          	ld	a5,-1124(a5) # 8000d228 <_ZN3TCB7runningE>
    80003694:	0107b703          	ld	a4,16(a5)
    80003698:	0207b503          	ld	a0,32(a5)
    8000369c:	000700e7          	jalr	a4
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    800036a0:	ffffe097          	auipc	ra,0xffffe
    800036a4:	df8080e7          	jalr	-520(ra) # 80001498 <_Z11thread_exitv>
}
    800036a8:	00813083          	ld	ra,8(sp)
    800036ac:	00013403          	ld	s0,0(sp)
    800036b0:	01010113          	addi	sp,sp,16
    800036b4:	00008067          	ret

00000000800036b8 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    800036b8:	fe010113          	addi	sp,sp,-32
    800036bc:	00113c23          	sd	ra,24(sp)
    800036c0:	00813823          	sd	s0,16(sp)
    800036c4:	00913423          	sd	s1,8(sp)
    800036c8:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    800036cc:	0000a497          	auipc	s1,0xa
    800036d0:	b5c4b483          	ld	s1,-1188(s1) # 8000d228 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    800036d4:	0584a783          	lw	a5,88(s1)
    800036d8:	00100713          	li	a4,1
    800036dc:	04e78e63          	beq	a5,a4,80003738 <_ZN3TCB8dispatchEv+0x80>
    } else if (old->status == FINISHED) {
    800036e0:	00500713          	li	a4,5
    800036e4:	06e78263          	beq	a5,a4,80003748 <_ZN3TCB8dispatchEv+0x90>
    TCB::running = Scheduler::get();
    800036e8:	ffffe097          	auipc	ra,0xffffe
    800036ec:	788080e7          	jalr	1928(ra) # 80001e70 <_ZN9Scheduler3getEv>
    800036f0:	00050593          	mv	a1,a0
    800036f4:	0000a797          	auipc	a5,0xa
    800036f8:	b3478793          	addi	a5,a5,-1228 # 8000d228 <_ZN3TCB7runningE>
    800036fc:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80003700:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == (TCB::Body)main || TCB::running->threadFunction == kernelConsumerFunction ||
    80003704:	01053783          	ld	a5,16(a0)
    80003708:	0000a717          	auipc	a4,0xa
    8000370c:	98073703          	ld	a4,-1664(a4) # 8000d088 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003710:	04e78863          	beq	a5,a4,80003760 <_ZN3TCB8dispatchEv+0xa8>
    80003714:	0000a717          	auipc	a4,0xa
    80003718:	94473703          	ld	a4,-1724(a4) # 8000d058 <_GLOBAL_OFFSET_TABLE_+0x40>
    8000371c:	04e78263          	beq	a5,a4,80003760 <_ZN3TCB8dispatchEv+0xa8>
    80003720:	0000a717          	auipc	a4,0xa
    80003724:	99873703          	ld	a4,-1640(a4) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0xa0>
    80003728:	02e78c63          	beq	a5,a4,80003760 <_ZN3TCB8dispatchEv+0xa8>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    8000372c:	10000793          	li	a5,256
    80003730:	1007b073          	csrc	sstatus,a5
}
    80003734:	0340006f          	j	80003768 <_ZN3TCB8dispatchEv+0xb0>
        Scheduler::put(old);
    80003738:	00048513          	mv	a0,s1
    8000373c:	ffffe097          	auipc	ra,0xffffe
    80003740:	6e8080e7          	jalr	1768(ra) # 80001e24 <_ZN9Scheduler3putEP3TCB>
    80003744:	fa5ff06f          	j	800036e8 <_ZN3TCB8dispatchEv+0x30>
        delete old->stack;
    80003748:	0184b503          	ld	a0,24(s1)
    8000374c:	00050663          	beqz	a0,80003758 <_ZN3TCB8dispatchEv+0xa0>
    80003750:	00000097          	auipc	ra,0x0
    80003754:	a10080e7          	jalr	-1520(ra) # 80003160 <_ZdlPv>
        old->stack = nullptr;
    80003758:	0004bc23          	sd	zero,24(s1)
    8000375c:	f8dff06f          	j	800036e8 <_ZN3TCB8dispatchEv+0x30>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80003760:	10000793          	li	a5,256
    80003764:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80003768:	00b48863          	beq	s1,a1,80003778 <_ZN3TCB8dispatchEv+0xc0>
    8000376c:	00048513          	mv	a0,s1
    80003770:	ffffe097          	auipc	ra,0xffffe
    80003774:	9a0080e7          	jalr	-1632(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80003778:	01813083          	ld	ra,24(sp)
    8000377c:	01013403          	ld	s0,16(sp)
    80003780:	00813483          	ld	s1,8(sp)
    80003784:	02010113          	addi	sp,sp,32
    80003788:	00008067          	ret

000000008000378c <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    8000378c:	ff010113          	addi	sp,sp,-16
    80003790:	00113423          	sd	ra,8(sp)
    80003794:	00813023          	sd	s0,0(sp)
    80003798:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    8000379c:	ffffe097          	auipc	ra,0xffffe
    800037a0:	bf8080e7          	jalr	-1032(ra) # 80001394 <_Z9mem_allocm>
}
    800037a4:	00813083          	ld	ra,8(sp)
    800037a8:	00013403          	ld	s0,0(sp)
    800037ac:	01010113          	addi	sp,sp,16
    800037b0:	00008067          	ret

00000000800037b4 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    800037b4:	fd010113          	addi	sp,sp,-48
    800037b8:	02113423          	sd	ra,40(sp)
    800037bc:	02813023          	sd	s0,32(sp)
    800037c0:	00913c23          	sd	s1,24(sp)
    800037c4:	01213823          	sd	s2,16(sp)
    800037c8:	01313423          	sd	s3,8(sp)
    800037cc:	03010413          	addi	s0,sp,48
    800037d0:	00050913          	mv	s2,a0
    800037d4:	00058993          	mv	s3,a1
    800037d8:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    800037dc:	07000513          	li	a0,112
    800037e0:	00000097          	auipc	ra,0x0
    800037e4:	fac080e7          	jalr	-84(ra) # 8000378c <_ZN3TCBnwEm>
private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED), mySemaphore(nullptr),
                                                    joiningWithTCB(nullptr) {
    800037e8:	01253823          	sd	s2,16(a0)
    800037ec:	00953c23          	sd	s1,24(a0)
    800037f0:	03353023          	sd	s3,32(a0)
    800037f4:	00200793          	li	a5,2
    800037f8:	02f53423          	sd	a5,40(a0)
    800037fc:	02053823          	sd	zero,48(a0)
    80003800:	02053c23          	sd	zero,56(a0)
    80003804:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003808:	04053423          	sd	zero,72(a0)
    8000380c:	04053823          	sd	zero,80(a0)
    80003810:	04052c23          	sw	zero,88(a0)
    80003814:	06053023          	sd	zero,96(a0)
    80003818:	06053423          	sd	zero,104(a0)
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    8000381c:	0000a797          	auipc	a5,0xa
    80003820:	86c7b783          	ld	a5,-1940(a5) # 8000d088 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003824:	02f90e63          	beq	s2,a5,80003860 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80003828:	00000797          	auipc	a5,0x0
    8000382c:	e4c78793          	addi	a5,a5,-436 # 80003674 <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80003830:	02048c63          	beqz	s1,80003868 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb4>
    80003834:	00001637          	lui	a2,0x1
    80003838:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    8000383c:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    80003840:	00953423          	sd	s1,8(a0)
}
    80003844:	02813083          	ld	ra,40(sp)
    80003848:	02013403          	ld	s0,32(sp)
    8000384c:	01813483          	ld	s1,24(sp)
    80003850:	01013903          	ld	s2,16(sp)
    80003854:	00813983          	ld	s3,8(sp)
    80003858:	03010113          	addi	sp,sp,48
    8000385c:	00008067          	ret
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80003860:	00000793          	li	a5,0
    80003864:	fcdff06f          	j	80003830 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x7c>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80003868:	00000493          	li	s1,0
    8000386c:	fd1ff06f          	j	8000383c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x88>

0000000080003870 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80003870:	ff010113          	addi	sp,sp,-16
    80003874:	00113423          	sd	ra,8(sp)
    80003878:	00813023          	sd	s0,0(sp)
    8000387c:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003880:	ffffe097          	auipc	ra,0xffffe
    80003884:	b54080e7          	jalr	-1196(ra) # 800013d4 <_Z8mem_freePv>
}
    80003888:	00813083          	ld	ra,8(sp)
    8000388c:	00013403          	ld	s0,0(sp)
    80003890:	01010113          	addi	sp,sp,16
    80003894:	00008067          	ret

0000000080003898 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED || TCB::running == handle) return;
    80003898:	05852703          	lw	a4,88(a0)
    8000389c:	00500793          	li	a5,5
    800038a0:	04f70263          	beq	a4,a5,800038e4 <_ZN3TCB10threadJoinEPS_+0x4c>
    800038a4:	0000a597          	auipc	a1,0xa
    800038a8:	9845b583          	ld	a1,-1660(a1) # 8000d228 <_ZN3TCB7runningE>
    800038ac:	02a58c63          	beq	a1,a0,800038e4 <_ZN3TCB10threadJoinEPS_+0x4c>
void TCB::threadJoin(TCB* handle) {
    800038b0:	ff010113          	addi	sp,sp,-16
    800038b4:	00113423          	sd	ra,8(sp)
    800038b8:	00813023          	sd	s0,0(sp)
    800038bc:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    800038c0:	00300793          	li	a5,3
    800038c4:	04f5ac23          	sw	a5,88(a1)
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
    80003904:	00078e63          	beqz	a5,80003920 <_ZN3TCB13releaseJoinedEPS_+0x38>
        TCB* tcb = handle->waitingToJoin.getFirst();
    80003908:	04848513          	addi	a0,s1,72
    8000390c:	ffffe097          	auipc	ra,0xffffe
    80003910:	99c080e7          	jalr	-1636(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
        Scheduler::put(tcb);
    80003914:	ffffe097          	auipc	ra,0xffffe
    80003918:	510080e7          	jalr	1296(ra) # 80001e24 <_ZN9Scheduler3putEP3TCB>
    while (!handle->waitingToJoin.isEmpty()) {
    8000391c:	fe5ff06f          	j	80003900 <_ZN3TCB13releaseJoinedEPS_+0x18>
    }
}
    80003920:	01813083          	ld	ra,24(sp)
    80003924:	01013403          	ld	s0,16(sp)
    80003928:	00813483          	ld	s1,8(sp)
    8000392c:	02010113          	addi	sp,sp,32
    80003930:	00008067          	ret

0000000080003934 <_ZN3TCB10quitThreadEPS_>:

void TCB::quitThread(TCB* handle) {
    80003934:	fe010113          	addi	sp,sp,-32
    80003938:	00113c23          	sd	ra,24(sp)
    8000393c:	00813823          	sd	s0,16(sp)
    80003940:	00913423          	sd	s1,8(sp)
    80003944:	02010413          	addi	s0,sp,32
    80003948:	00050493          	mv	s1,a0
    TCB* prev, * curr;
    switch (handle->status) {
    8000394c:	05852783          	lw	a5,88(a0)
    80003950:	00300713          	li	a4,3
    80003954:	10e78063          	beq	a5,a4,80003a54 <_ZN3TCB10quitThreadEPS_+0x120>
    80003958:	04f76263          	bltu	a4,a5,8000399c <_ZN3TCB10quitThreadEPS_+0x68>
    8000395c:	00100713          	li	a4,1
    80003960:	06e78263          	beq	a5,a4,800039c4 <_ZN3TCB10quitThreadEPS_+0x90>
    80003964:	00200713          	li	a4,2
    80003968:	08e79e63          	bne	a5,a4,80003a04 <_ZN3TCB10quitThreadEPS_+0xd0>
            }
            curr->nextInScheduler = nullptr;
            break;
        case BLOCKED:
            //nit blokirana na semaforu, treba da se izbaci iz reda blokiranih na semaforu
            if (handle->mySemaphore->getBlocked()->remove(handle) < 0) {
    8000396c:	06053503          	ld	a0,96(a0)
    80003970:	00048593          	mv	a1,s1
    80003974:	00850513          	addi	a0,a0,8
    80003978:	ffffe097          	auipc	ra,0xffffe
    8000397c:	990080e7          	jalr	-1648(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    80003980:	08054263          	bltz	a0,80003a04 <_ZN3TCB10quitThreadEPS_+0xd0>
                //greska
            } else {
                handle->mySemaphore->increaseVal(1);
    80003984:	0604b703          	ld	a4,96(s1)

    static void operator delete(void* ptr);

    ThreadQueue* getBlocked() { return &blocked; }

    void increaseVal(int add) { val += add; }
    80003988:	00072783          	lw	a5,0(a4)
    8000398c:	0017879b          	addiw	a5,a5,1
    80003990:	00f72023          	sw	a5,0(a4)
                handle->mySemaphore = nullptr;
    80003994:	0604b023          	sd	zero,96(s1)
    80003998:	06c0006f          	j	80003a04 <_ZN3TCB10quitThreadEPS_+0xd0>
    switch (handle->status) {
    8000399c:	00400713          	li	a4,4
    800039a0:	06e79263          	bne	a5,a4,80003a04 <_ZN3TCB10quitThreadEPS_+0xd0>

    static TCB* getTail() { return tail; }

    static void setTail(TCB* tcb) { tail = tcb; }

    static TCB* getSleepingHead() { return sleepingHead; }
    800039a4:	00009797          	auipc	a5,0x9
    800039a8:	70c7b783          	ld	a5,1804(a5) # 8000d0b0 <_GLOBAL_OFFSET_TABLE_+0x98>
    800039ac:	0007b783          	ld	a5,0(a5)
                handle->joiningWithTCB = nullptr;
            }
            break;
        case SLEEPING:
            //nit je u redu uspavanih, treba da se izbaci
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    800039b0:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextSleeping);
    800039b4:	0c978063          	beq	a5,s1,80003a74 <_ZN3TCB10quitThreadEPS_+0x140>
    800039b8:	00078713          	mv	a4,a5
    800039bc:	0407b783          	ld	a5,64(a5)
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    800039c0:	ff5ff06f          	j	800039b4 <_ZN3TCB10quitThreadEPS_+0x80>
    static TCB* getHead() { return head; }
    800039c4:	00009797          	auipc	a5,0x9
    800039c8:	69c7b783          	ld	a5,1692(a5) # 8000d060 <_GLOBAL_OFFSET_TABLE_+0x48>
    800039cc:	0007b783          	ld	a5,0(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    800039d0:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextInScheduler);
    800039d4:	00978863          	beq	a5,s1,800039e4 <_ZN3TCB10quitThreadEPS_+0xb0>
    800039d8:	00078713          	mv	a4,a5
    800039dc:	0307b783          	ld	a5,48(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    800039e0:	ff5ff06f          	j	800039d4 <_ZN3TCB10quitThreadEPS_+0xa0>
            if (!prev) {
    800039e4:	04070663          	beqz	a4,80003a30 <_ZN3TCB10quitThreadEPS_+0xfc>
                prev->nextInScheduler = curr->nextInScheduler;
    800039e8:	0307b683          	ld	a3,48(a5)
    800039ec:	02d73823          	sd	a3,48(a4)
    static TCB* getTail() { return tail; }
    800039f0:	00009697          	auipc	a3,0x9
    800039f4:	6506b683          	ld	a3,1616(a3) # 8000d040 <_GLOBAL_OFFSET_TABLE_+0x28>
    800039f8:	0006b683          	ld	a3,0(a3)
            if (curr == Scheduler::getTail()) {
    800039fc:	04d78463          	beq	a5,a3,80003a44 <_ZN3TCB10quitThreadEPS_+0x110>
            curr->nextInScheduler = nullptr;
    80003a00:	0207b823          	sd	zero,48(a5)
        case FINISHED:
            break;
        default:
            break;
    }
    handle->status = FINISHED;
    80003a04:	00500793          	li	a5,5
    80003a08:	04f4ac23          	sw	a5,88(s1)
    delete handle->stack;
    80003a0c:	0184b503          	ld	a0,24(s1)
    80003a10:	00050663          	beqz	a0,80003a1c <_ZN3TCB10quitThreadEPS_+0xe8>
    80003a14:	fffff097          	auipc	ra,0xfffff
    80003a18:	74c080e7          	jalr	1868(ra) # 80003160 <_ZdlPv>
}
    80003a1c:	01813083          	ld	ra,24(sp)
    80003a20:	01013403          	ld	s0,16(sp)
    80003a24:	00813483          	ld	s1,8(sp)
    80003a28:	02010113          	addi	sp,sp,32
    80003a2c:	00008067          	ret
                Scheduler::setHead(curr->nextInScheduler);
    80003a30:	0307b603          	ld	a2,48(a5)
    static void setHead(TCB* tcb) { head = tcb; }
    80003a34:	00009697          	auipc	a3,0x9
    80003a38:	62c6b683          	ld	a3,1580(a3) # 8000d060 <_GLOBAL_OFFSET_TABLE_+0x48>
    80003a3c:	00c6b023          	sd	a2,0(a3)
    80003a40:	fb1ff06f          	j	800039f0 <_ZN3TCB10quitThreadEPS_+0xbc>
    static void setTail(TCB* tcb) { tail = tcb; }
    80003a44:	00009697          	auipc	a3,0x9
    80003a48:	5fc6b683          	ld	a3,1532(a3) # 8000d040 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003a4c:	00e6b023          	sd	a4,0(a3)
    80003a50:	fb1ff06f          	j	80003a00 <_ZN3TCB10quitThreadEPS_+0xcc>
            if (handle->joiningWithTCB->getListOfJoiningThreads()->remove(handle) < 0) {
    80003a54:	06853503          	ld	a0,104(a0)
    80003a58:	00048593          	mv	a1,s1
    80003a5c:	04850513          	addi	a0,a0,72
    80003a60:	ffffe097          	auipc	ra,0xffffe
    80003a64:	8a8080e7          	jalr	-1880(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    80003a68:	f8054ee3          	bltz	a0,80003a04 <_ZN3TCB10quitThreadEPS_+0xd0>
                handle->joiningWithTCB = nullptr;
    80003a6c:	0604b423          	sd	zero,104(s1)
    80003a70:	f95ff06f          	j	80003a04 <_ZN3TCB10quitThreadEPS_+0xd0>
            if (!prev) {
    80003a74:	02070863          	beqz	a4,80003aa4 <_ZN3TCB10quitThreadEPS_+0x170>
                prev->nextSleeping = curr->nextSleeping;
    80003a78:	0407b683          	ld	a3,64(a5)
    80003a7c:	04d73023          	sd	a3,64(a4)
            if (curr->nextSleeping) {
    80003a80:	0407b703          	ld	a4,64(a5)
    80003a84:	00070a63          	beqz	a4,80003a98 <_ZN3TCB10quitThreadEPS_+0x164>
                curr->nextSleeping->timeToSleep += curr->timeToSleep;
    80003a88:	0387b603          	ld	a2,56(a5)
    80003a8c:	03873683          	ld	a3,56(a4)
    80003a90:	00c686b3          	add	a3,a3,a2
    80003a94:	02d73c23          	sd	a3,56(a4)
            curr->timeToSleep = 0;
    80003a98:	0207bc23          	sd	zero,56(a5)
            curr->nextSleeping = nullptr;
    80003a9c:	0407b023          	sd	zero,64(a5)
            break;
    80003aa0:	f65ff06f          	j	80003a04 <_ZN3TCB10quitThreadEPS_+0xd0>
                Scheduler::setSleepingHead(curr->nextSleeping);
    80003aa4:	0407b683          	ld	a3,64(a5)

    static void setSleepingHead(TCB* tcb) { sleepingHead = tcb; }
    80003aa8:	00009717          	auipc	a4,0x9
    80003aac:	60873703          	ld	a4,1544(a4) # 8000d0b0 <_GLOBAL_OFFSET_TABLE_+0x98>
    80003ab0:	00d73023          	sd	a3,0(a4)
    80003ab4:	fcdff06f          	j	80003a80 <_ZN3TCB10quitThreadEPS_+0x14c>

0000000080003ab8 <_ZN5Riscv19returnFromInterruptEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::returnFromInterrupt() {
    80003ab8:	ff010113          	addi	sp,sp,-16
    80003abc:	00813423          	sd	s0,8(sp)
    80003ac0:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80003ac4:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80003ac8:	10200073          	sret
    80003acc:	00813403          	ld	s0,8(sp)
    80003ad0:	01010113          	addi	sp,sp,16
    80003ad4:	00008067          	ret

0000000080003ad8 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80003ad8:	ff010113          	addi	sp,sp,-16
    80003adc:	00113423          	sd	ra,8(sp)
    80003ae0:	00813023          	sd	s0,0(sp)
    80003ae4:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003ae8:	ffffe097          	auipc	ra,0xffffe
    80003aec:	8ac080e7          	jalr	-1876(ra) # 80001394 <_Z9mem_allocm>
}
    80003af0:	00813083          	ld	ra,8(sp)
    80003af4:	00013403          	ld	s0,0(sp)
    80003af8:	01010113          	addi	sp,sp,16
    80003afc:	00008067          	ret

0000000080003b00 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80003b00:	ff010113          	addi	sp,sp,-16
    80003b04:	00113423          	sd	ra,8(sp)
    80003b08:	00813023          	sd	s0,0(sp)
    80003b0c:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003b10:	ffffe097          	auipc	ra,0xffffe
    80003b14:	8c4080e7          	jalr	-1852(ra) # 800013d4 <_Z8mem_freePv>
}
    80003b18:	00813083          	ld	ra,8(sp)
    80003b1c:	00013403          	ld	s0,0(sp)
    80003b20:	01010113          	addi	sp,sp,16
    80003b24:	00008067          	ret

0000000080003b28 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003b28:	fe010113          	addi	sp,sp,-32
    80003b2c:	00113c23          	sd	ra,24(sp)
    80003b30:	00813823          	sd	s0,16(sp)
    80003b34:	00913423          	sd	s1,8(sp)
    80003b38:	02010413          	addi	s0,sp,32
    80003b3c:	00050493          	mv	s1,a0
	return new KSem(val);
    80003b40:	01800513          	li	a0,24
    80003b44:	00000097          	auipc	ra,0x0
    80003b48:	f94080e7          	jalr	-108(ra) # 80003ad8 <_ZN4KSemnwEm>
    void block();

    void unblock();

private:
    KSem(uint val) : val(val) {}
    80003b4c:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003b50:	00053423          	sd	zero,8(a0)
    80003b54:	00053823          	sd	zero,16(a0)
}
    80003b58:	01813083          	ld	ra,24(sp)
    80003b5c:	01013403          	ld	s0,16(sp)
    80003b60:	00813483          	ld	s1,8(sp)
    80003b64:	02010113          	addi	sp,sp,32
    80003b68:	00008067          	ret

0000000080003b6c <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003b6c:	ff010113          	addi	sp,sp,-16
    80003b70:	00113423          	sd	ra,8(sp)
    80003b74:	00813023          	sd	s0,0(sp)
    80003b78:	01010413          	addi	s0,sp,16
    static TCB* getRunning() { return running; }
    80003b7c:	00009797          	auipc	a5,0x9
    80003b80:	51c7b783          	ld	a5,1308(a5) # 8000d098 <_GLOBAL_OFFSET_TABLE_+0x80>
    80003b84:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80003b88:	00200793          	li	a5,2
    80003b8c:	04f5ac23          	sw	a5,88(a1)
    TCB::getRunning()->setStatus(TCB::BLOCKED);
	blocked.putLast(TCB::getRunning());
    80003b90:	00850513          	addi	a0,a0,8
    80003b94:	ffffd097          	auipc	ra,0xffffd
    80003b98:	6a8080e7          	jalr	1704(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::dispatch();
    80003b9c:	00000097          	auipc	ra,0x0
    80003ba0:	b1c080e7          	jalr	-1252(ra) # 800036b8 <_ZN3TCB8dispatchEv>
}
    80003ba4:	00813083          	ld	ra,8(sp)
    80003ba8:	00013403          	ld	s0,0(sp)
    80003bac:	01010113          	addi	sp,sp,16
    80003bb0:	00008067          	ret

0000000080003bb4 <_ZN4KSem4waitEv>:
	if (--val < 0) {
    80003bb4:	00052783          	lw	a5,0(a0)
    80003bb8:	fff7879b          	addiw	a5,a5,-1
    80003bbc:	00f52023          	sw	a5,0(a0)
    80003bc0:	02079713          	slli	a4,a5,0x20
    80003bc4:	00074663          	bltz	a4,80003bd0 <_ZN4KSem4waitEv+0x1c>
	return 0;
    80003bc8:	00000513          	li	a0,0
}
    80003bcc:	00008067          	ret
int KSem::wait() {
    80003bd0:	ff010113          	addi	sp,sp,-16
    80003bd4:	00113423          	sd	ra,8(sp)
    80003bd8:	00813023          	sd	s0,0(sp)
    80003bdc:	01010413          	addi	s0,sp,16
		block();
    80003be0:	00000097          	auipc	ra,0x0
    80003be4:	f8c080e7          	jalr	-116(ra) # 80003b6c <_ZN4KSem5blockEv>
		return -1;
    80003be8:	fff00513          	li	a0,-1
}
    80003bec:	00813083          	ld	ra,8(sp)
    80003bf0:	00013403          	ld	s0,0(sp)
    80003bf4:	01010113          	addi	sp,sp,16
    80003bf8:	00008067          	ret

0000000080003bfc <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003bfc:	ff010113          	addi	sp,sp,-16
    80003c00:	00113423          	sd	ra,8(sp)
    80003c04:	00813023          	sd	s0,0(sp)
    80003c08:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003c0c:	00850513          	addi	a0,a0,8
    80003c10:	ffffd097          	auipc	ra,0xffffd
    80003c14:	698080e7          	jalr	1688(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
	Scheduler::put(tcb);
    80003c18:	ffffe097          	auipc	ra,0xffffe
    80003c1c:	20c080e7          	jalr	524(ra) # 80001e24 <_ZN9Scheduler3putEP3TCB>
}
    80003c20:	00813083          	ld	ra,8(sp)
    80003c24:	00013403          	ld	s0,0(sp)
    80003c28:	01010113          	addi	sp,sp,16
    80003c2c:	00008067          	ret

0000000080003c30 <_ZN4KSem6signalEv>:
	if (val++ < 0) {
    80003c30:	00052783          	lw	a5,0(a0)
    80003c34:	0017871b          	addiw	a4,a5,1
    80003c38:	00e52023          	sw	a4,0(a0)
    80003c3c:	0007c663          	bltz	a5,80003c48 <_ZN4KSem6signalEv+0x18>
}
    80003c40:	00000513          	li	a0,0
    80003c44:	00008067          	ret
int KSem::signal() {
    80003c48:	ff010113          	addi	sp,sp,-16
    80003c4c:	00113423          	sd	ra,8(sp)
    80003c50:	00813023          	sd	s0,0(sp)
    80003c54:	01010413          	addi	s0,sp,16
		unblock();
    80003c58:	00000097          	auipc	ra,0x0
    80003c5c:	fa4080e7          	jalr	-92(ra) # 80003bfc <_ZN4KSem7unblockEv>
}
    80003c60:	00000513          	li	a0,0
    80003c64:	00813083          	ld	ra,8(sp)
    80003c68:	00013403          	ld	s0,0(sp)
    80003c6c:	01010113          	addi	sp,sp,16
    80003c70:	00008067          	ret

0000000080003c74 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003c74:	fe010113          	addi	sp,sp,-32
    80003c78:	00113c23          	sd	ra,24(sp)
    80003c7c:	00813823          	sd	s0,16(sp)
    80003c80:	00913423          	sd	s1,8(sp)
    80003c84:	02010413          	addi	s0,sp,32
    80003c88:	00050493          	mv	s1,a0
        return front == nullptr;
    80003c8c:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003c90:	00078e63          	beqz	a5,80003cac <_ZN4KSem8closeSemEPS_+0x38>
		TCB* tcb = handle->blocked.getFirst();
    80003c94:	00848513          	addi	a0,s1,8
    80003c98:	ffffd097          	auipc	ra,0xffffd
    80003c9c:	610080e7          	jalr	1552(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
		Scheduler::put(tcb);
    80003ca0:	ffffe097          	auipc	ra,0xffffe
    80003ca4:	184080e7          	jalr	388(ra) # 80001e24 <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    80003ca8:	fe5ff06f          	j	80003c8c <_ZN4KSem8closeSemEPS_+0x18>
	}
	return 0;
}
    80003cac:	00000513          	li	a0,0
    80003cb0:	01813083          	ld	ra,24(sp)
    80003cb4:	01013403          	ld	s0,16(sp)
    80003cb8:	00813483          	ld	s1,8(sp)
    80003cbc:	02010113          	addi	sp,sp,32
    80003cc0:	00008067          	ret

0000000080003cc4 <_Z13emptyFunctionPv>:
void idle(void*);

void kernelConsumerFunction(void*);


void emptyFunction(void*) {}
    80003cc4:	ff010113          	addi	sp,sp,-16
    80003cc8:	00813423          	sd	s0,8(sp)
    80003ccc:	01010413          	addi	s0,sp,16
    80003cd0:	00813403          	ld	s0,8(sp)
    80003cd4:	01010113          	addi	sp,sp,16
    80003cd8:	00008067          	ret

0000000080003cdc <_Z5nit1fPv>:

void nit1f(void*) {
    80003cdc:	fe010113          	addi	sp,sp,-32
    80003ce0:	00113c23          	sd	ra,24(sp)
    80003ce4:	00813823          	sd	s0,16(sp)
    80003ce8:	02010413          	addi	s0,sp,32
    while (true) {
        thread_t handle;
        thread_create(&handle, emptyFunction, nullptr);
    80003cec:	00000613          	li	a2,0
    80003cf0:	00000597          	auipc	a1,0x0
    80003cf4:	fd458593          	addi	a1,a1,-44 # 80003cc4 <_Z13emptyFunctionPv>
    80003cf8:	fe840513          	addi	a0,s0,-24
    80003cfc:	ffffd097          	auipc	ra,0xffffd
    80003d00:	708080e7          	jalr	1800(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    while (true) {
    80003d04:	fe9ff06f          	j	80003cec <_Z5nit1fPv+0x10>

0000000080003d08 <_Z5nit2fPv>:
    }

    printString("\nGotova nit 1\n");
}

void nit2f(void* arg2) {
    80003d08:	ff010113          	addi	sp,sp,-16
    80003d0c:	00113423          	sd	ra,8(sp)
    80003d10:	00813023          	sd	s0,0(sp)
    80003d14:	01010413          	addi	s0,sp,16
    printString("\nGotova nit 2\n");
    80003d18:	00006517          	auipc	a0,0x6
    80003d1c:	31850513          	addi	a0,a0,792 # 8000a030 <CONSOLE_STATUS+0x20>
    80003d20:	00002097          	auipc	ra,0x2
    80003d24:	658080e7          	jalr	1624(ra) # 80006378 <_Z11printStringPKc>
}
    80003d28:	00813083          	ld	ra,8(sp)
    80003d2c:	00013403          	ld	s0,0(sp)
    80003d30:	01010113          	addi	sp,sp,16
    80003d34:	00008067          	ret

0000000080003d38 <_Z5nit3fPv>:


void nit3f(void*) {
    80003d38:	fe010113          	addi	sp,sp,-32
    80003d3c:	00113c23          	sd	ra,24(sp)
    80003d40:	00813823          	sd	s0,16(sp)
    80003d44:	00913423          	sd	s1,8(sp)
    80003d48:	02010413          	addi	s0,sp,32
    80003d4c:	0180006f          	j	80003d64 <_Z5nit3fPv+0x2c>
    char slovo;
    do {
        slovo = getc();
        putc(slovo);
        if (slovo == '\r') putc('\n');
    80003d50:	00a00513          	li	a0,10
    80003d54:	ffffe097          	auipc	ra,0xffffe
    80003d58:	8d4080e7          	jalr	-1836(ra) # 80001628 <_Z4putcc>
    } while (slovo != '0');
    80003d5c:	03000793          	li	a5,48
    80003d60:	02f48263          	beq	s1,a5,80003d84 <_Z5nit3fPv+0x4c>
        slovo = getc();
    80003d64:	ffffe097          	auipc	ra,0xffffe
    80003d68:	89c080e7          	jalr	-1892(ra) # 80001600 <_Z4getcv>
    80003d6c:	00050493          	mv	s1,a0
        putc(slovo);
    80003d70:	ffffe097          	auipc	ra,0xffffe
    80003d74:	8b8080e7          	jalr	-1864(ra) # 80001628 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    80003d78:	00d00793          	li	a5,13
    80003d7c:	fef490e3          	bne	s1,a5,80003d5c <_Z5nit3fPv+0x24>
    80003d80:	fd1ff06f          	j	80003d50 <_Z5nit3fPv+0x18>

    printString("\nGotova nit3\n");
    80003d84:	00006517          	auipc	a0,0x6
    80003d88:	2c450513          	addi	a0,a0,708 # 8000a048 <CONSOLE_STATUS+0x38>
    80003d8c:	00002097          	auipc	ra,0x2
    80003d90:	5ec080e7          	jalr	1516(ra) # 80006378 <_Z11printStringPKc>
}
    80003d94:	01813083          	ld	ra,24(sp)
    80003d98:	01013403          	ld	s0,16(sp)
    80003d9c:	00813483          	ld	s1,8(sp)
    80003da0:	02010113          	addi	sp,sp,32
    80003da4:	00008067          	ret

0000000080003da8 <_Z5main5v>:


int main5() {
    80003da8:	fb010113          	addi	sp,sp,-80
    80003dac:	04113423          	sd	ra,72(sp)
    80003db0:	04813023          	sd	s0,64(sp)
    80003db4:	02913c23          	sd	s1,56(sp)
    80003db8:	05010413          	addi	s0,sp,80
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80003dbc:	00009797          	auipc	a5,0x9
    80003dc0:	2ec7b783          	ld	a5,748(a5) # 8000d0a8 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003dc4:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80003dc8:	ffffe097          	auipc	ra,0xffffe
    80003dcc:	39c080e7          	jalr	924(ra) # 80002164 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80003dd0:	ffffe097          	auipc	ra,0xffffe
    80003dd4:	93c080e7          	jalr	-1732(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>

    //testiranje kreiranja niti
    thread_t glavnaNit = nullptr;
    80003dd8:	fc043c23          	sd	zero,-40(s0)
    thread_t nit1 = nullptr;
    80003ddc:	fc043823          	sd	zero,-48(s0)
    thread_t nit2 = nullptr;
    80003de0:	fc043423          	sd	zero,-56(s0)
    thread_t nit3 = nullptr;
    80003de4:	fc043023          	sd	zero,-64(s0)
    thread_t idleNit = nullptr;
    80003de8:	fa043c23          	sd	zero,-72(s0)
    thread_t kernelConsumerThread = nullptr;
    80003dec:	fa043823          	sd	zero,-80(s0)
    thread_create(&glavnaNit, (TCB::Body)main, nullptr);
    80003df0:	00000613          	li	a2,0
    80003df4:	00009597          	auipc	a1,0x9
    80003df8:	2945b583          	ld	a1,660(a1) # 8000d088 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003dfc:	fd840513          	addi	a0,s0,-40
    80003e00:	ffffd097          	auipc	ra,0xffffd
    80003e04:	604080e7          	jalr	1540(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    static void setRunning(TCB* newRunning) { running = newRunning; }
    80003e08:	fd843703          	ld	a4,-40(s0)
    80003e0c:	00009797          	auipc	a5,0x9
    80003e10:	28c7b783          	ld	a5,652(a5) # 8000d098 <_GLOBAL_OFFSET_TABLE_+0x80>
    80003e14:	00e7b023          	sd	a4,0(a5)
    TCB::setRunning(glavnaNit);
    thread_create(&idleNit, idle, nullptr);
    80003e18:	00000613          	li	a2,0
    80003e1c:	00009597          	auipc	a1,0x9
    80003e20:	29c5b583          	ld	a1,668(a1) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0xa0>
    80003e24:	fb840513          	addi	a0,s0,-72
    80003e28:	ffffd097          	auipc	ra,0xffffd
    80003e2c:	5dc080e7          	jalr	1500(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    80003e30:	00000613          	li	a2,0
    80003e34:	00009597          	auipc	a1,0x9
    80003e38:	2245b583          	ld	a1,548(a1) # 8000d058 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003e3c:	fb040513          	addi	a0,s0,-80
    80003e40:	ffffd097          	auipc	ra,0xffffd
    80003e44:	5c4080e7          	jalr	1476(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>


    thread_create(&nit1, nit1f, nullptr);
    80003e48:	00000613          	li	a2,0
    80003e4c:	00000597          	auipc	a1,0x0
    80003e50:	e9058593          	addi	a1,a1,-368 # 80003cdc <_Z5nit1fPv>
    80003e54:	fd040513          	addi	a0,s0,-48
    80003e58:	ffffd097          	auipc	ra,0xffffd
    80003e5c:	5ac080e7          	jalr	1452(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit2, nit2f, nullptr);
    80003e60:	00000613          	li	a2,0
    80003e64:	00000597          	auipc	a1,0x0
    80003e68:	ea458593          	addi	a1,a1,-348 # 80003d08 <_Z5nit2fPv>
    80003e6c:	fc840513          	addi	a0,s0,-56
    80003e70:	ffffd097          	auipc	ra,0xffffd
    80003e74:	594080e7          	jalr	1428(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit3, nit3f, nullptr);
    80003e78:	00000613          	li	a2,0
    80003e7c:	00000597          	auipc	a1,0x0
    80003e80:	ebc58593          	addi	a1,a1,-324 # 80003d38 <_Z5nit3fPv>
    80003e84:	fc040513          	addi	a0,s0,-64
    80003e88:	ffffd097          	auipc	ra,0xffffd
    80003e8c:	57c080e7          	jalr	1404(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    80003e90:	00200493          	li	s1,2
    80003e94:	1004a073          	csrs	sstatus,s1

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    thread_join(nit1);
    80003e98:	fd043503          	ld	a0,-48(s0)
    80003e9c:	ffffd097          	auipc	ra,0xffffd
    80003ea0:	644080e7          	jalr	1604(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit2);
    80003ea4:	fc843503          	ld	a0,-56(s0)
    80003ea8:	ffffd097          	auipc	ra,0xffffd
    80003eac:	638080e7          	jalr	1592(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit3);
    80003eb0:	fc043503          	ld	a0,-64(s0)
    80003eb4:	ffffd097          	auipc	ra,0xffffd
    80003eb8:	62c080e7          	jalr	1580(ra) # 800014e0 <_Z11thread_joinP3TCB>
    //thread_join(idleNit);

    printString("\nGotove user niti\n");
    80003ebc:	00006517          	auipc	a0,0x6
    80003ec0:	19c50513          	addi	a0,a0,412 # 8000a058 <CONSOLE_STATUS+0x48>
    80003ec4:	00002097          	auipc	ra,0x2
    80003ec8:	4b4080e7          	jalr	1204(ra) # 80006378 <_Z11printStringPKc>

    printString("\nSad cu da izadjem\n");
    80003ecc:	00006517          	auipc	a0,0x6
    80003ed0:	43450513          	addi	a0,a0,1076 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80003ed4:	00002097          	auipc	ra,0x2
    80003ed8:	4a4080e7          	jalr	1188(ra) # 80006378 <_Z11printStringPKc>
        __asm__ volatile("li a0, 0x43");
    80003edc:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80003ee0:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003ee4:	1004b073          	csrc	sstatus,s1
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);


    return 0;
    80003ee8:	00000513          	li	a0,0
    80003eec:	04813083          	ld	ra,72(sp)
    80003ef0:	04013403          	ld	s0,64(sp)
    80003ef4:	03813483          	ld	s1,56(sp)
    80003ef8:	05010113          	addi	sp,sp,80
    80003efc:	00008067          	ret

0000000080003f00 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003f00:	fe010113          	addi	sp,sp,-32
    80003f04:	00113c23          	sd	ra,24(sp)
    80003f08:	00813823          	sd	s0,16(sp)
    80003f0c:	00913423          	sd	s1,8(sp)
    80003f10:	01213023          	sd	s2,0(sp)
    80003f14:	02010413          	addi	s0,sp,32
    80003f18:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003f1c:	00000913          	li	s2,0
    80003f20:	00c0006f          	j	80003f2c <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003f24:	ffffd097          	auipc	ra,0xffffd
    80003f28:	59c080e7          	jalr	1436(ra) # 800014c0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80003f2c:	ffffd097          	auipc	ra,0xffffd
    80003f30:	6d4080e7          	jalr	1748(ra) # 80001600 <_Z4getcv>
    80003f34:	0005059b          	sext.w	a1,a0
    80003f38:	02d00793          	li	a5,45
    80003f3c:	02f58a63          	beq	a1,a5,80003f70 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003f40:	0084b503          	ld	a0,8(s1)
    80003f44:	00003097          	auipc	ra,0x3
    80003f48:	400080e7          	jalr	1024(ra) # 80007344 <_ZN6Buffer3putEi>
        i++;
    80003f4c:	0019071b          	addiw	a4,s2,1
    80003f50:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003f54:	0004a683          	lw	a3,0(s1)
    80003f58:	0026979b          	slliw	a5,a3,0x2
    80003f5c:	00d787bb          	addw	a5,a5,a3
    80003f60:	0017979b          	slliw	a5,a5,0x1
    80003f64:	02f767bb          	remw	a5,a4,a5
    80003f68:	fc0792e3          	bnez	a5,80003f2c <_ZL16producerKeyboardPv+0x2c>
    80003f6c:	fb9ff06f          	j	80003f24 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003f70:	00100793          	li	a5,1
    80003f74:	00009717          	auipc	a4,0x9
    80003f78:	2cf72223          	sw	a5,708(a4) # 8000d238 <_ZL9threadEnd>
    data->buffer->put('!');
    80003f7c:	02100593          	li	a1,33
    80003f80:	0084b503          	ld	a0,8(s1)
    80003f84:	00003097          	auipc	ra,0x3
    80003f88:	3c0080e7          	jalr	960(ra) # 80007344 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003f8c:	0104b503          	ld	a0,16(s1)
    80003f90:	ffffd097          	auipc	ra,0xffffd
    80003f94:	640080e7          	jalr	1600(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80003f98:	01813083          	ld	ra,24(sp)
    80003f9c:	01013403          	ld	s0,16(sp)
    80003fa0:	00813483          	ld	s1,8(sp)
    80003fa4:	00013903          	ld	s2,0(sp)
    80003fa8:	02010113          	addi	sp,sp,32
    80003fac:	00008067          	ret

0000000080003fb0 <_ZL8producerPv>:

static void producer(void *arg) {
    80003fb0:	fe010113          	addi	sp,sp,-32
    80003fb4:	00113c23          	sd	ra,24(sp)
    80003fb8:	00813823          	sd	s0,16(sp)
    80003fbc:	00913423          	sd	s1,8(sp)
    80003fc0:	01213023          	sd	s2,0(sp)
    80003fc4:	02010413          	addi	s0,sp,32
    80003fc8:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003fcc:	00000913          	li	s2,0
    80003fd0:	00c0006f          	j	80003fdc <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003fd4:	ffffd097          	auipc	ra,0xffffd
    80003fd8:	4ec080e7          	jalr	1260(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003fdc:	00009797          	auipc	a5,0x9
    80003fe0:	25c7a783          	lw	a5,604(a5) # 8000d238 <_ZL9threadEnd>
    80003fe4:	02079e63          	bnez	a5,80004020 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003fe8:	0004a583          	lw	a1,0(s1)
    80003fec:	0305859b          	addiw	a1,a1,48
    80003ff0:	0084b503          	ld	a0,8(s1)
    80003ff4:	00003097          	auipc	ra,0x3
    80003ff8:	350080e7          	jalr	848(ra) # 80007344 <_ZN6Buffer3putEi>
        i++;
    80003ffc:	0019071b          	addiw	a4,s2,1
    80004000:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004004:	0004a683          	lw	a3,0(s1)
    80004008:	0026979b          	slliw	a5,a3,0x2
    8000400c:	00d787bb          	addw	a5,a5,a3
    80004010:	0017979b          	slliw	a5,a5,0x1
    80004014:	02f767bb          	remw	a5,a4,a5
    80004018:	fc0792e3          	bnez	a5,80003fdc <_ZL8producerPv+0x2c>
    8000401c:	fb9ff06f          	j	80003fd4 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80004020:	0104b503          	ld	a0,16(s1)
    80004024:	ffffd097          	auipc	ra,0xffffd
    80004028:	5ac080e7          	jalr	1452(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    8000402c:	01813083          	ld	ra,24(sp)
    80004030:	01013403          	ld	s0,16(sp)
    80004034:	00813483          	ld	s1,8(sp)
    80004038:	00013903          	ld	s2,0(sp)
    8000403c:	02010113          	addi	sp,sp,32
    80004040:	00008067          	ret

0000000080004044 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80004044:	fd010113          	addi	sp,sp,-48
    80004048:	02113423          	sd	ra,40(sp)
    8000404c:	02813023          	sd	s0,32(sp)
    80004050:	00913c23          	sd	s1,24(sp)
    80004054:	01213823          	sd	s2,16(sp)
    80004058:	01313423          	sd	s3,8(sp)
    8000405c:	03010413          	addi	s0,sp,48
    80004060:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004064:	00000993          	li	s3,0
    80004068:	01c0006f          	j	80004084 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    8000406c:	ffffd097          	auipc	ra,0xffffd
    80004070:	454080e7          	jalr	1108(ra) # 800014c0 <_Z15thread_dispatchv>
    80004074:	0500006f          	j	800040c4 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80004078:	00a00513          	li	a0,10
    8000407c:	ffffd097          	auipc	ra,0xffffd
    80004080:	5ac080e7          	jalr	1452(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    80004084:	00009797          	auipc	a5,0x9
    80004088:	1b47a783          	lw	a5,436(a5) # 8000d238 <_ZL9threadEnd>
    8000408c:	06079063          	bnez	a5,800040ec <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80004090:	00893503          	ld	a0,8(s2)
    80004094:	00003097          	auipc	ra,0x3
    80004098:	340080e7          	jalr	832(ra) # 800073d4 <_ZN6Buffer3getEv>
        i++;
    8000409c:	0019849b          	addiw	s1,s3,1
    800040a0:	0004899b          	sext.w	s3,s1
        putc(key);
    800040a4:	0ff57513          	andi	a0,a0,255
    800040a8:	ffffd097          	auipc	ra,0xffffd
    800040ac:	580080e7          	jalr	1408(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800040b0:	00092703          	lw	a4,0(s2)
    800040b4:	0027179b          	slliw	a5,a4,0x2
    800040b8:	00e787bb          	addw	a5,a5,a4
    800040bc:	02f4e7bb          	remw	a5,s1,a5
    800040c0:	fa0786e3          	beqz	a5,8000406c <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800040c4:	05000793          	li	a5,80
    800040c8:	02f4e4bb          	remw	s1,s1,a5
    800040cc:	fa049ce3          	bnez	s1,80004084 <_ZL8consumerPv+0x40>
    800040d0:	fa9ff06f          	j	80004078 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800040d4:	00893503          	ld	a0,8(s2)
    800040d8:	00003097          	auipc	ra,0x3
    800040dc:	2fc080e7          	jalr	764(ra) # 800073d4 <_ZN6Buffer3getEv>
        putc(key);
    800040e0:	0ff57513          	andi	a0,a0,255
    800040e4:	ffffd097          	auipc	ra,0xffffd
    800040e8:	544080e7          	jalr	1348(ra) # 80001628 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    800040ec:	00893503          	ld	a0,8(s2)
    800040f0:	00003097          	auipc	ra,0x3
    800040f4:	370080e7          	jalr	880(ra) # 80007460 <_ZN6Buffer6getCntEv>
    800040f8:	fca04ee3          	bgtz	a0,800040d4 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    800040fc:	01093503          	ld	a0,16(s2)
    80004100:	ffffd097          	auipc	ra,0xffffd
    80004104:	4d0080e7          	jalr	1232(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80004108:	02813083          	ld	ra,40(sp)
    8000410c:	02013403          	ld	s0,32(sp)
    80004110:	01813483          	ld	s1,24(sp)
    80004114:	01013903          	ld	s2,16(sp)
    80004118:	00813983          	ld	s3,8(sp)
    8000411c:	03010113          	addi	sp,sp,48
    80004120:	00008067          	ret

0000000080004124 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80004124:	f9010113          	addi	sp,sp,-112
    80004128:	06113423          	sd	ra,104(sp)
    8000412c:	06813023          	sd	s0,96(sp)
    80004130:	04913c23          	sd	s1,88(sp)
    80004134:	05213823          	sd	s2,80(sp)
    80004138:	05313423          	sd	s3,72(sp)
    8000413c:	05413023          	sd	s4,64(sp)
    80004140:	03513c23          	sd	s5,56(sp)
    80004144:	03613823          	sd	s6,48(sp)
    80004148:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    8000414c:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80004150:	00006517          	auipc	a0,0x6
    80004154:	1c850513          	addi	a0,a0,456 # 8000a318 <CONSOLE_STATUS+0x308>
    80004158:	00002097          	auipc	ra,0x2
    8000415c:	220080e7          	jalr	544(ra) # 80006378 <_Z11printStringPKc>
    getString(input, 30);
    80004160:	01e00593          	li	a1,30
    80004164:	fa040493          	addi	s1,s0,-96
    80004168:	00048513          	mv	a0,s1
    8000416c:	00002097          	auipc	ra,0x2
    80004170:	294080e7          	jalr	660(ra) # 80006400 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004174:	00048513          	mv	a0,s1
    80004178:	00002097          	auipc	ra,0x2
    8000417c:	360080e7          	jalr	864(ra) # 800064d8 <_Z11stringToIntPKc>
    80004180:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80004184:	00006517          	auipc	a0,0x6
    80004188:	1b450513          	addi	a0,a0,436 # 8000a338 <CONSOLE_STATUS+0x328>
    8000418c:	00002097          	auipc	ra,0x2
    80004190:	1ec080e7          	jalr	492(ra) # 80006378 <_Z11printStringPKc>
    getString(input, 30);
    80004194:	01e00593          	li	a1,30
    80004198:	00048513          	mv	a0,s1
    8000419c:	00002097          	auipc	ra,0x2
    800041a0:	264080e7          	jalr	612(ra) # 80006400 <_Z9getStringPci>
    n = stringToInt(input);
    800041a4:	00048513          	mv	a0,s1
    800041a8:	00002097          	auipc	ra,0x2
    800041ac:	330080e7          	jalr	816(ra) # 800064d8 <_Z11stringToIntPKc>
    800041b0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    800041b4:	00006517          	auipc	a0,0x6
    800041b8:	1a450513          	addi	a0,a0,420 # 8000a358 <CONSOLE_STATUS+0x348>
    800041bc:	00002097          	auipc	ra,0x2
    800041c0:	1bc080e7          	jalr	444(ra) # 80006378 <_Z11printStringPKc>
	printInt(threadNum);
    800041c4:	00000613          	li	a2,0
    800041c8:	00a00593          	li	a1,10
    800041cc:	00090513          	mv	a0,s2
    800041d0:	00002097          	auipc	ra,0x2
    800041d4:	358080e7          	jalr	856(ra) # 80006528 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800041d8:	00006517          	auipc	a0,0x6
    800041dc:	19850513          	addi	a0,a0,408 # 8000a370 <CONSOLE_STATUS+0x360>
    800041e0:	00002097          	auipc	ra,0x2
    800041e4:	198080e7          	jalr	408(ra) # 80006378 <_Z11printStringPKc>
	printInt(n);
    800041e8:	00000613          	li	a2,0
    800041ec:	00a00593          	li	a1,10
    800041f0:	00048513          	mv	a0,s1
    800041f4:	00002097          	auipc	ra,0x2
    800041f8:	334080e7          	jalr	820(ra) # 80006528 <_Z8printIntiii>
    printString(".\n");
    800041fc:	00006517          	auipc	a0,0x6
    80004200:	18c50513          	addi	a0,a0,396 # 8000a388 <CONSOLE_STATUS+0x378>
    80004204:	00002097          	auipc	ra,0x2
    80004208:	174080e7          	jalr	372(ra) # 80006378 <_Z11printStringPKc>
    if(threadNum > n) {
    8000420c:	0324c463          	blt	s1,s2,80004234 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80004210:	03205c63          	blez	s2,80004248 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80004214:	03800513          	li	a0,56
    80004218:	fffff097          	auipc	ra,0xfffff
    8000421c:	ef8080e7          	jalr	-264(ra) # 80003110 <_Znwm>
    80004220:	00050a13          	mv	s4,a0
    80004224:	00048593          	mv	a1,s1
    80004228:	00003097          	auipc	ra,0x3
    8000422c:	080080e7          	jalr	128(ra) # 800072a8 <_ZN6BufferC1Ei>
    80004230:	0300006f          	j	80004260 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004234:	00006517          	auipc	a0,0x6
    80004238:	15c50513          	addi	a0,a0,348 # 8000a390 <CONSOLE_STATUS+0x380>
    8000423c:	00002097          	auipc	ra,0x2
    80004240:	13c080e7          	jalr	316(ra) # 80006378 <_Z11printStringPKc>
        return;
    80004244:	0140006f          	j	80004258 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004248:	00006517          	auipc	a0,0x6
    8000424c:	18850513          	addi	a0,a0,392 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80004250:	00002097          	auipc	ra,0x2
    80004254:	128080e7          	jalr	296(ra) # 80006378 <_Z11printStringPKc>
        return;
    80004258:	000b0113          	mv	sp,s6
    8000425c:	1500006f          	j	800043ac <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80004260:	00000593          	li	a1,0
    80004264:	00009517          	auipc	a0,0x9
    80004268:	fdc50513          	addi	a0,a0,-36 # 8000d240 <_ZL10waitForAll>
    8000426c:	ffffd097          	auipc	ra,0xffffd
    80004270:	2cc080e7          	jalr	716(ra) # 80001538 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80004274:	00391793          	slli	a5,s2,0x3
    80004278:	00f78793          	addi	a5,a5,15
    8000427c:	ff07f793          	andi	a5,a5,-16
    80004280:	40f10133          	sub	sp,sp,a5
    80004284:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80004288:	0019071b          	addiw	a4,s2,1
    8000428c:	00171793          	slli	a5,a4,0x1
    80004290:	00e787b3          	add	a5,a5,a4
    80004294:	00379793          	slli	a5,a5,0x3
    80004298:	00f78793          	addi	a5,a5,15
    8000429c:	ff07f793          	andi	a5,a5,-16
    800042a0:	40f10133          	sub	sp,sp,a5
    800042a4:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800042a8:	00191613          	slli	a2,s2,0x1
    800042ac:	012607b3          	add	a5,a2,s2
    800042b0:	00379793          	slli	a5,a5,0x3
    800042b4:	00f987b3          	add	a5,s3,a5
    800042b8:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800042bc:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800042c0:	00009717          	auipc	a4,0x9
    800042c4:	f8073703          	ld	a4,-128(a4) # 8000d240 <_ZL10waitForAll>
    800042c8:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800042cc:	00078613          	mv	a2,a5
    800042d0:	00000597          	auipc	a1,0x0
    800042d4:	d7458593          	addi	a1,a1,-652 # 80004044 <_ZL8consumerPv>
    800042d8:	f9840513          	addi	a0,s0,-104
    800042dc:	ffffd097          	auipc	ra,0xffffd
    800042e0:	128080e7          	jalr	296(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800042e4:	00000493          	li	s1,0
    800042e8:	0280006f          	j	80004310 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    800042ec:	00000597          	auipc	a1,0x0
    800042f0:	c1458593          	addi	a1,a1,-1004 # 80003f00 <_ZL16producerKeyboardPv>
                      data + i);
    800042f4:	00179613          	slli	a2,a5,0x1
    800042f8:	00f60633          	add	a2,a2,a5
    800042fc:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80004300:	00c98633          	add	a2,s3,a2
    80004304:	ffffd097          	auipc	ra,0xffffd
    80004308:	100080e7          	jalr	256(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000430c:	0014849b          	addiw	s1,s1,1
    80004310:	0524d263          	bge	s1,s2,80004354 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80004314:	00149793          	slli	a5,s1,0x1
    80004318:	009787b3          	add	a5,a5,s1
    8000431c:	00379793          	slli	a5,a5,0x3
    80004320:	00f987b3          	add	a5,s3,a5
    80004324:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80004328:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    8000432c:	00009717          	auipc	a4,0x9
    80004330:	f1473703          	ld	a4,-236(a4) # 8000d240 <_ZL10waitForAll>
    80004334:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80004338:	00048793          	mv	a5,s1
    8000433c:	00349513          	slli	a0,s1,0x3
    80004340:	00aa8533          	add	a0,s5,a0
    80004344:	fa9054e3          	blez	s1,800042ec <_Z22producerConsumer_C_APIv+0x1c8>
    80004348:	00000597          	auipc	a1,0x0
    8000434c:	c6858593          	addi	a1,a1,-920 # 80003fb0 <_ZL8producerPv>
    80004350:	fa5ff06f          	j	800042f4 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80004354:	ffffd097          	auipc	ra,0xffffd
    80004358:	16c080e7          	jalr	364(ra) # 800014c0 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    8000435c:	00000493          	li	s1,0
    80004360:	00994e63          	blt	s2,s1,8000437c <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80004364:	00009517          	auipc	a0,0x9
    80004368:	edc53503          	ld	a0,-292(a0) # 8000d240 <_ZL10waitForAll>
    8000436c:	ffffd097          	auipc	ra,0xffffd
    80004370:	234080e7          	jalr	564(ra) # 800015a0 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80004374:	0014849b          	addiw	s1,s1,1
    80004378:	fe9ff06f          	j	80004360 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    8000437c:	00009517          	auipc	a0,0x9
    80004380:	ec453503          	ld	a0,-316(a0) # 8000d240 <_ZL10waitForAll>
    80004384:	ffffd097          	auipc	ra,0xffffd
    80004388:	1ec080e7          	jalr	492(ra) # 80001570 <_Z9sem_closeP4KSem>
    delete buffer;
    8000438c:	000a0e63          	beqz	s4,800043a8 <_Z22producerConsumer_C_APIv+0x284>
    80004390:	000a0513          	mv	a0,s4
    80004394:	00003097          	auipc	ra,0x3
    80004398:	154080e7          	jalr	340(ra) # 800074e8 <_ZN6BufferD1Ev>
    8000439c:	000a0513          	mv	a0,s4
    800043a0:	fffff097          	auipc	ra,0xfffff
    800043a4:	dc0080e7          	jalr	-576(ra) # 80003160 <_ZdlPv>
    800043a8:	000b0113          	mv	sp,s6

}
    800043ac:	f9040113          	addi	sp,s0,-112
    800043b0:	06813083          	ld	ra,104(sp)
    800043b4:	06013403          	ld	s0,96(sp)
    800043b8:	05813483          	ld	s1,88(sp)
    800043bc:	05013903          	ld	s2,80(sp)
    800043c0:	04813983          	ld	s3,72(sp)
    800043c4:	04013a03          	ld	s4,64(sp)
    800043c8:	03813a83          	ld	s5,56(sp)
    800043cc:	03013b03          	ld	s6,48(sp)
    800043d0:	07010113          	addi	sp,sp,112
    800043d4:	00008067          	ret
    800043d8:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800043dc:	000a0513          	mv	a0,s4
    800043e0:	fffff097          	auipc	ra,0xfffff
    800043e4:	d80080e7          	jalr	-640(ra) # 80003160 <_ZdlPv>
    800043e8:	00048513          	mv	a0,s1
    800043ec:	0000a097          	auipc	ra,0xa
    800043f0:	f7c080e7          	jalr	-132(ra) # 8000e368 <_Unwind_Resume>

00000000800043f4 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800043f4:	fe010113          	addi	sp,sp,-32
    800043f8:	00113c23          	sd	ra,24(sp)
    800043fc:	00813823          	sd	s0,16(sp)
    80004400:	00913423          	sd	s1,8(sp)
    80004404:	01213023          	sd	s2,0(sp)
    80004408:	02010413          	addi	s0,sp,32
    8000440c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004410:	00100793          	li	a5,1
    80004414:	02a7f863          	bgeu	a5,a0,80004444 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004418:	00a00793          	li	a5,10
    8000441c:	02f577b3          	remu	a5,a0,a5
    80004420:	02078e63          	beqz	a5,8000445c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004424:	fff48513          	addi	a0,s1,-1
    80004428:	00000097          	auipc	ra,0x0
    8000442c:	fcc080e7          	jalr	-52(ra) # 800043f4 <_ZL9fibonaccim>
    80004430:	00050913          	mv	s2,a0
    80004434:	ffe48513          	addi	a0,s1,-2
    80004438:	00000097          	auipc	ra,0x0
    8000443c:	fbc080e7          	jalr	-68(ra) # 800043f4 <_ZL9fibonaccim>
    80004440:	00a90533          	add	a0,s2,a0
}
    80004444:	01813083          	ld	ra,24(sp)
    80004448:	01013403          	ld	s0,16(sp)
    8000444c:	00813483          	ld	s1,8(sp)
    80004450:	00013903          	ld	s2,0(sp)
    80004454:	02010113          	addi	sp,sp,32
    80004458:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000445c:	ffffd097          	auipc	ra,0xffffd
    80004460:	064080e7          	jalr	100(ra) # 800014c0 <_Z15thread_dispatchv>
    80004464:	fc1ff06f          	j	80004424 <_ZL9fibonaccim+0x30>

0000000080004468 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80004468:	fe010113          	addi	sp,sp,-32
    8000446c:	00113c23          	sd	ra,24(sp)
    80004470:	00813823          	sd	s0,16(sp)
    80004474:	00913423          	sd	s1,8(sp)
    80004478:	01213023          	sd	s2,0(sp)
    8000447c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004480:	00000913          	li	s2,0
    80004484:	0380006f          	j	800044bc <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80004488:	ffffd097          	auipc	ra,0xffffd
    8000448c:	038080e7          	jalr	56(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004490:	00148493          	addi	s1,s1,1
    80004494:	000027b7          	lui	a5,0x2
    80004498:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000449c:	0097ee63          	bltu	a5,s1,800044b8 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800044a0:	00000713          	li	a4,0
    800044a4:	000077b7          	lui	a5,0x7
    800044a8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800044ac:	fce7eee3          	bltu	a5,a4,80004488 <_ZN7WorkerA11workerBodyAEPv+0x20>
    800044b0:	00170713          	addi	a4,a4,1
    800044b4:	ff1ff06f          	j	800044a4 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800044b8:	00190913          	addi	s2,s2,1
    800044bc:	00900793          	li	a5,9
    800044c0:	0527e063          	bltu	a5,s2,80004500 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800044c4:	00006517          	auipc	a0,0x6
    800044c8:	f3c50513          	addi	a0,a0,-196 # 8000a400 <CONSOLE_STATUS+0x3f0>
    800044cc:	00002097          	auipc	ra,0x2
    800044d0:	eac080e7          	jalr	-340(ra) # 80006378 <_Z11printStringPKc>
    800044d4:	00000613          	li	a2,0
    800044d8:	00a00593          	li	a1,10
    800044dc:	0009051b          	sext.w	a0,s2
    800044e0:	00002097          	auipc	ra,0x2
    800044e4:	048080e7          	jalr	72(ra) # 80006528 <_Z8printIntiii>
    800044e8:	00006517          	auipc	a0,0x6
    800044ec:	17850513          	addi	a0,a0,376 # 8000a660 <CONSOLE_STATUS+0x650>
    800044f0:	00002097          	auipc	ra,0x2
    800044f4:	e88080e7          	jalr	-376(ra) # 80006378 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800044f8:	00000493          	li	s1,0
    800044fc:	f99ff06f          	j	80004494 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80004500:	00006517          	auipc	a0,0x6
    80004504:	f0850513          	addi	a0,a0,-248 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80004508:	00002097          	auipc	ra,0x2
    8000450c:	e70080e7          	jalr	-400(ra) # 80006378 <_Z11printStringPKc>
    finishedA = true;
    80004510:	00100793          	li	a5,1
    80004514:	00009717          	auipc	a4,0x9
    80004518:	d2f70a23          	sb	a5,-716(a4) # 8000d248 <_ZL9finishedA>
}
    8000451c:	01813083          	ld	ra,24(sp)
    80004520:	01013403          	ld	s0,16(sp)
    80004524:	00813483          	ld	s1,8(sp)
    80004528:	00013903          	ld	s2,0(sp)
    8000452c:	02010113          	addi	sp,sp,32
    80004530:	00008067          	ret

0000000080004534 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80004534:	fe010113          	addi	sp,sp,-32
    80004538:	00113c23          	sd	ra,24(sp)
    8000453c:	00813823          	sd	s0,16(sp)
    80004540:	00913423          	sd	s1,8(sp)
    80004544:	01213023          	sd	s2,0(sp)
    80004548:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000454c:	00000913          	li	s2,0
    80004550:	0380006f          	j	80004588 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80004554:	ffffd097          	auipc	ra,0xffffd
    80004558:	f6c080e7          	jalr	-148(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000455c:	00148493          	addi	s1,s1,1
    80004560:	000027b7          	lui	a5,0x2
    80004564:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004568:	0097ee63          	bltu	a5,s1,80004584 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000456c:	00000713          	li	a4,0
    80004570:	000077b7          	lui	a5,0x7
    80004574:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004578:	fce7eee3          	bltu	a5,a4,80004554 <_ZN7WorkerB11workerBodyBEPv+0x20>
    8000457c:	00170713          	addi	a4,a4,1
    80004580:	ff1ff06f          	j	80004570 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004584:	00190913          	addi	s2,s2,1
    80004588:	00f00793          	li	a5,15
    8000458c:	0527e063          	bltu	a5,s2,800045cc <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004590:	00006517          	auipc	a0,0x6
    80004594:	e8850513          	addi	a0,a0,-376 # 8000a418 <CONSOLE_STATUS+0x408>
    80004598:	00002097          	auipc	ra,0x2
    8000459c:	de0080e7          	jalr	-544(ra) # 80006378 <_Z11printStringPKc>
    800045a0:	00000613          	li	a2,0
    800045a4:	00a00593          	li	a1,10
    800045a8:	0009051b          	sext.w	a0,s2
    800045ac:	00002097          	auipc	ra,0x2
    800045b0:	f7c080e7          	jalr	-132(ra) # 80006528 <_Z8printIntiii>
    800045b4:	00006517          	auipc	a0,0x6
    800045b8:	0ac50513          	addi	a0,a0,172 # 8000a660 <CONSOLE_STATUS+0x650>
    800045bc:	00002097          	auipc	ra,0x2
    800045c0:	dbc080e7          	jalr	-580(ra) # 80006378 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800045c4:	00000493          	li	s1,0
    800045c8:	f99ff06f          	j	80004560 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800045cc:	00006517          	auipc	a0,0x6
    800045d0:	e5450513          	addi	a0,a0,-428 # 8000a420 <CONSOLE_STATUS+0x410>
    800045d4:	00002097          	auipc	ra,0x2
    800045d8:	da4080e7          	jalr	-604(ra) # 80006378 <_Z11printStringPKc>
    finishedB = true;
    800045dc:	00100793          	li	a5,1
    800045e0:	00009717          	auipc	a4,0x9
    800045e4:	c6f704a3          	sb	a5,-919(a4) # 8000d249 <_ZL9finishedB>
    thread_dispatch();
    800045e8:	ffffd097          	auipc	ra,0xffffd
    800045ec:	ed8080e7          	jalr	-296(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800045f0:	01813083          	ld	ra,24(sp)
    800045f4:	01013403          	ld	s0,16(sp)
    800045f8:	00813483          	ld	s1,8(sp)
    800045fc:	00013903          	ld	s2,0(sp)
    80004600:	02010113          	addi	sp,sp,32
    80004604:	00008067          	ret

0000000080004608 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80004608:	fe010113          	addi	sp,sp,-32
    8000460c:	00113c23          	sd	ra,24(sp)
    80004610:	00813823          	sd	s0,16(sp)
    80004614:	00913423          	sd	s1,8(sp)
    80004618:	01213023          	sd	s2,0(sp)
    8000461c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004620:	00000493          	li	s1,0
    80004624:	0400006f          	j	80004664 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004628:	00006517          	auipc	a0,0x6
    8000462c:	e0850513          	addi	a0,a0,-504 # 8000a430 <CONSOLE_STATUS+0x420>
    80004630:	00002097          	auipc	ra,0x2
    80004634:	d48080e7          	jalr	-696(ra) # 80006378 <_Z11printStringPKc>
    80004638:	00000613          	li	a2,0
    8000463c:	00a00593          	li	a1,10
    80004640:	00048513          	mv	a0,s1
    80004644:	00002097          	auipc	ra,0x2
    80004648:	ee4080e7          	jalr	-284(ra) # 80006528 <_Z8printIntiii>
    8000464c:	00006517          	auipc	a0,0x6
    80004650:	01450513          	addi	a0,a0,20 # 8000a660 <CONSOLE_STATUS+0x650>
    80004654:	00002097          	auipc	ra,0x2
    80004658:	d24080e7          	jalr	-732(ra) # 80006378 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000465c:	0014849b          	addiw	s1,s1,1
    80004660:	0ff4f493          	andi	s1,s1,255
    80004664:	00200793          	li	a5,2
    80004668:	fc97f0e3          	bgeu	a5,s1,80004628 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    8000466c:	00006517          	auipc	a0,0x6
    80004670:	dcc50513          	addi	a0,a0,-564 # 8000a438 <CONSOLE_STATUS+0x428>
    80004674:	00002097          	auipc	ra,0x2
    80004678:	d04080e7          	jalr	-764(ra) # 80006378 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000467c:	00700313          	li	t1,7
    thread_dispatch();
    80004680:	ffffd097          	auipc	ra,0xffffd
    80004684:	e40080e7          	jalr	-448(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004688:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    8000468c:	00006517          	auipc	a0,0x6
    80004690:	dbc50513          	addi	a0,a0,-580 # 8000a448 <CONSOLE_STATUS+0x438>
    80004694:	00002097          	auipc	ra,0x2
    80004698:	ce4080e7          	jalr	-796(ra) # 80006378 <_Z11printStringPKc>
    8000469c:	00000613          	li	a2,0
    800046a0:	00a00593          	li	a1,10
    800046a4:	0009051b          	sext.w	a0,s2
    800046a8:	00002097          	auipc	ra,0x2
    800046ac:	e80080e7          	jalr	-384(ra) # 80006528 <_Z8printIntiii>
    800046b0:	00006517          	auipc	a0,0x6
    800046b4:	fb050513          	addi	a0,a0,-80 # 8000a660 <CONSOLE_STATUS+0x650>
    800046b8:	00002097          	auipc	ra,0x2
    800046bc:	cc0080e7          	jalr	-832(ra) # 80006378 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800046c0:	00c00513          	li	a0,12
    800046c4:	00000097          	auipc	ra,0x0
    800046c8:	d30080e7          	jalr	-720(ra) # 800043f4 <_ZL9fibonaccim>
    800046cc:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800046d0:	00006517          	auipc	a0,0x6
    800046d4:	d8050513          	addi	a0,a0,-640 # 8000a450 <CONSOLE_STATUS+0x440>
    800046d8:	00002097          	auipc	ra,0x2
    800046dc:	ca0080e7          	jalr	-864(ra) # 80006378 <_Z11printStringPKc>
    800046e0:	00000613          	li	a2,0
    800046e4:	00a00593          	li	a1,10
    800046e8:	0009051b          	sext.w	a0,s2
    800046ec:	00002097          	auipc	ra,0x2
    800046f0:	e3c080e7          	jalr	-452(ra) # 80006528 <_Z8printIntiii>
    800046f4:	00006517          	auipc	a0,0x6
    800046f8:	f6c50513          	addi	a0,a0,-148 # 8000a660 <CONSOLE_STATUS+0x650>
    800046fc:	00002097          	auipc	ra,0x2
    80004700:	c7c080e7          	jalr	-900(ra) # 80006378 <_Z11printStringPKc>
    80004704:	0400006f          	j	80004744 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004708:	00006517          	auipc	a0,0x6
    8000470c:	d2850513          	addi	a0,a0,-728 # 8000a430 <CONSOLE_STATUS+0x420>
    80004710:	00002097          	auipc	ra,0x2
    80004714:	c68080e7          	jalr	-920(ra) # 80006378 <_Z11printStringPKc>
    80004718:	00000613          	li	a2,0
    8000471c:	00a00593          	li	a1,10
    80004720:	00048513          	mv	a0,s1
    80004724:	00002097          	auipc	ra,0x2
    80004728:	e04080e7          	jalr	-508(ra) # 80006528 <_Z8printIntiii>
    8000472c:	00006517          	auipc	a0,0x6
    80004730:	f3450513          	addi	a0,a0,-204 # 8000a660 <CONSOLE_STATUS+0x650>
    80004734:	00002097          	auipc	ra,0x2
    80004738:	c44080e7          	jalr	-956(ra) # 80006378 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000473c:	0014849b          	addiw	s1,s1,1
    80004740:	0ff4f493          	andi	s1,s1,255
    80004744:	00500793          	li	a5,5
    80004748:	fc97f0e3          	bgeu	a5,s1,80004708 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    8000474c:	00006517          	auipc	a0,0x6
    80004750:	d1450513          	addi	a0,a0,-748 # 8000a460 <CONSOLE_STATUS+0x450>
    80004754:	00002097          	auipc	ra,0x2
    80004758:	c24080e7          	jalr	-988(ra) # 80006378 <_Z11printStringPKc>
    finishedC = true;
    8000475c:	00100793          	li	a5,1
    80004760:	00009717          	auipc	a4,0x9
    80004764:	aef70523          	sb	a5,-1302(a4) # 8000d24a <_ZL9finishedC>
    thread_dispatch();
    80004768:	ffffd097          	auipc	ra,0xffffd
    8000476c:	d58080e7          	jalr	-680(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80004770:	01813083          	ld	ra,24(sp)
    80004774:	01013403          	ld	s0,16(sp)
    80004778:	00813483          	ld	s1,8(sp)
    8000477c:	00013903          	ld	s2,0(sp)
    80004780:	02010113          	addi	sp,sp,32
    80004784:	00008067          	ret

0000000080004788 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80004788:	fe010113          	addi	sp,sp,-32
    8000478c:	00113c23          	sd	ra,24(sp)
    80004790:	00813823          	sd	s0,16(sp)
    80004794:	00913423          	sd	s1,8(sp)
    80004798:	01213023          	sd	s2,0(sp)
    8000479c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800047a0:	00a00493          	li	s1,10
    800047a4:	0400006f          	j	800047e4 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800047a8:	00006517          	auipc	a0,0x6
    800047ac:	cc850513          	addi	a0,a0,-824 # 8000a470 <CONSOLE_STATUS+0x460>
    800047b0:	00002097          	auipc	ra,0x2
    800047b4:	bc8080e7          	jalr	-1080(ra) # 80006378 <_Z11printStringPKc>
    800047b8:	00000613          	li	a2,0
    800047bc:	00a00593          	li	a1,10
    800047c0:	00048513          	mv	a0,s1
    800047c4:	00002097          	auipc	ra,0x2
    800047c8:	d64080e7          	jalr	-668(ra) # 80006528 <_Z8printIntiii>
    800047cc:	00006517          	auipc	a0,0x6
    800047d0:	e9450513          	addi	a0,a0,-364 # 8000a660 <CONSOLE_STATUS+0x650>
    800047d4:	00002097          	auipc	ra,0x2
    800047d8:	ba4080e7          	jalr	-1116(ra) # 80006378 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800047dc:	0014849b          	addiw	s1,s1,1
    800047e0:	0ff4f493          	andi	s1,s1,255
    800047e4:	00c00793          	li	a5,12
    800047e8:	fc97f0e3          	bgeu	a5,s1,800047a8 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800047ec:	00006517          	auipc	a0,0x6
    800047f0:	c8c50513          	addi	a0,a0,-884 # 8000a478 <CONSOLE_STATUS+0x468>
    800047f4:	00002097          	auipc	ra,0x2
    800047f8:	b84080e7          	jalr	-1148(ra) # 80006378 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800047fc:	00500313          	li	t1,5
    thread_dispatch();
    80004800:	ffffd097          	auipc	ra,0xffffd
    80004804:	cc0080e7          	jalr	-832(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004808:	01000513          	li	a0,16
    8000480c:	00000097          	auipc	ra,0x0
    80004810:	be8080e7          	jalr	-1048(ra) # 800043f4 <_ZL9fibonaccim>
    80004814:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004818:	00006517          	auipc	a0,0x6
    8000481c:	c7050513          	addi	a0,a0,-912 # 8000a488 <CONSOLE_STATUS+0x478>
    80004820:	00002097          	auipc	ra,0x2
    80004824:	b58080e7          	jalr	-1192(ra) # 80006378 <_Z11printStringPKc>
    80004828:	00000613          	li	a2,0
    8000482c:	00a00593          	li	a1,10
    80004830:	0009051b          	sext.w	a0,s2
    80004834:	00002097          	auipc	ra,0x2
    80004838:	cf4080e7          	jalr	-780(ra) # 80006528 <_Z8printIntiii>
    8000483c:	00006517          	auipc	a0,0x6
    80004840:	e2450513          	addi	a0,a0,-476 # 8000a660 <CONSOLE_STATUS+0x650>
    80004844:	00002097          	auipc	ra,0x2
    80004848:	b34080e7          	jalr	-1228(ra) # 80006378 <_Z11printStringPKc>
    8000484c:	0400006f          	j	8000488c <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004850:	00006517          	auipc	a0,0x6
    80004854:	c2050513          	addi	a0,a0,-992 # 8000a470 <CONSOLE_STATUS+0x460>
    80004858:	00002097          	auipc	ra,0x2
    8000485c:	b20080e7          	jalr	-1248(ra) # 80006378 <_Z11printStringPKc>
    80004860:	00000613          	li	a2,0
    80004864:	00a00593          	li	a1,10
    80004868:	00048513          	mv	a0,s1
    8000486c:	00002097          	auipc	ra,0x2
    80004870:	cbc080e7          	jalr	-836(ra) # 80006528 <_Z8printIntiii>
    80004874:	00006517          	auipc	a0,0x6
    80004878:	dec50513          	addi	a0,a0,-532 # 8000a660 <CONSOLE_STATUS+0x650>
    8000487c:	00002097          	auipc	ra,0x2
    80004880:	afc080e7          	jalr	-1284(ra) # 80006378 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004884:	0014849b          	addiw	s1,s1,1
    80004888:	0ff4f493          	andi	s1,s1,255
    8000488c:	00f00793          	li	a5,15
    80004890:	fc97f0e3          	bgeu	a5,s1,80004850 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004894:	00006517          	auipc	a0,0x6
    80004898:	c0450513          	addi	a0,a0,-1020 # 8000a498 <CONSOLE_STATUS+0x488>
    8000489c:	00002097          	auipc	ra,0x2
    800048a0:	adc080e7          	jalr	-1316(ra) # 80006378 <_Z11printStringPKc>
    finishedD = true;
    800048a4:	00100793          	li	a5,1
    800048a8:	00009717          	auipc	a4,0x9
    800048ac:	9af701a3          	sb	a5,-1629(a4) # 8000d24b <_ZL9finishedD>
    thread_dispatch();
    800048b0:	ffffd097          	auipc	ra,0xffffd
    800048b4:	c10080e7          	jalr	-1008(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800048b8:	01813083          	ld	ra,24(sp)
    800048bc:	01013403          	ld	s0,16(sp)
    800048c0:	00813483          	ld	s1,8(sp)
    800048c4:	00013903          	ld	s2,0(sp)
    800048c8:	02010113          	addi	sp,sp,32
    800048cc:	00008067          	ret

00000000800048d0 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800048d0:	fc010113          	addi	sp,sp,-64
    800048d4:	02113c23          	sd	ra,56(sp)
    800048d8:	02813823          	sd	s0,48(sp)
    800048dc:	02913423          	sd	s1,40(sp)
    800048e0:	03213023          	sd	s2,32(sp)
    800048e4:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800048e8:	02000513          	li	a0,32
    800048ec:	fffff097          	auipc	ra,0xfffff
    800048f0:	824080e7          	jalr	-2012(ra) # 80003110 <_Znwm>
    800048f4:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800048f8:	fffff097          	auipc	ra,0xfffff
    800048fc:	b00080e7          	jalr	-1280(ra) # 800033f8 <_ZN6ThreadC1Ev>
    80004900:	00008797          	auipc	a5,0x8
    80004904:	58078793          	addi	a5,a5,1408 # 8000ce80 <_ZTV7WorkerA+0x10>
    80004908:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    8000490c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004910:	00006517          	auipc	a0,0x6
    80004914:	b9850513          	addi	a0,a0,-1128 # 8000a4a8 <CONSOLE_STATUS+0x498>
    80004918:	00002097          	auipc	ra,0x2
    8000491c:	a60080e7          	jalr	-1440(ra) # 80006378 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004920:	02000513          	li	a0,32
    80004924:	ffffe097          	auipc	ra,0xffffe
    80004928:	7ec080e7          	jalr	2028(ra) # 80003110 <_Znwm>
    8000492c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004930:	fffff097          	auipc	ra,0xfffff
    80004934:	ac8080e7          	jalr	-1336(ra) # 800033f8 <_ZN6ThreadC1Ev>
    80004938:	00008797          	auipc	a5,0x8
    8000493c:	57078793          	addi	a5,a5,1392 # 8000cea8 <_ZTV7WorkerB+0x10>
    80004940:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004944:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004948:	00006517          	auipc	a0,0x6
    8000494c:	b7850513          	addi	a0,a0,-1160 # 8000a4c0 <CONSOLE_STATUS+0x4b0>
    80004950:	00002097          	auipc	ra,0x2
    80004954:	a28080e7          	jalr	-1496(ra) # 80006378 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004958:	02000513          	li	a0,32
    8000495c:	ffffe097          	auipc	ra,0xffffe
    80004960:	7b4080e7          	jalr	1972(ra) # 80003110 <_Znwm>
    80004964:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004968:	fffff097          	auipc	ra,0xfffff
    8000496c:	a90080e7          	jalr	-1392(ra) # 800033f8 <_ZN6ThreadC1Ev>
    80004970:	00008797          	auipc	a5,0x8
    80004974:	56078793          	addi	a5,a5,1376 # 8000ced0 <_ZTV7WorkerC+0x10>
    80004978:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    8000497c:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80004980:	00006517          	auipc	a0,0x6
    80004984:	b5850513          	addi	a0,a0,-1192 # 8000a4d8 <CONSOLE_STATUS+0x4c8>
    80004988:	00002097          	auipc	ra,0x2
    8000498c:	9f0080e7          	jalr	-1552(ra) # 80006378 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004990:	02000513          	li	a0,32
    80004994:	ffffe097          	auipc	ra,0xffffe
    80004998:	77c080e7          	jalr	1916(ra) # 80003110 <_Znwm>
    8000499c:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800049a0:	fffff097          	auipc	ra,0xfffff
    800049a4:	a58080e7          	jalr	-1448(ra) # 800033f8 <_ZN6ThreadC1Ev>
    800049a8:	00008797          	auipc	a5,0x8
    800049ac:	55078793          	addi	a5,a5,1360 # 8000cef8 <_ZTV7WorkerD+0x10>
    800049b0:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800049b4:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800049b8:	00006517          	auipc	a0,0x6
    800049bc:	b3850513          	addi	a0,a0,-1224 # 8000a4f0 <CONSOLE_STATUS+0x4e0>
    800049c0:	00002097          	auipc	ra,0x2
    800049c4:	9b8080e7          	jalr	-1608(ra) # 80006378 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800049c8:	00000493          	li	s1,0
    800049cc:	00300793          	li	a5,3
    800049d0:	0297c663          	blt	a5,s1,800049fc <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800049d4:	00349793          	slli	a5,s1,0x3
    800049d8:	fe040713          	addi	a4,s0,-32
    800049dc:	00f707b3          	add	a5,a4,a5
    800049e0:	fe07b503          	ld	a0,-32(a5)
    800049e4:	fffff097          	auipc	ra,0xfffff
    800049e8:	8e4080e7          	jalr	-1820(ra) # 800032c8 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800049ec:	0014849b          	addiw	s1,s1,1
    800049f0:	fddff06f          	j	800049cc <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800049f4:	fffff097          	auipc	ra,0xfffff
    800049f8:	948080e7          	jalr	-1720(ra) # 8000333c <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800049fc:	00009797          	auipc	a5,0x9
    80004a00:	84c7c783          	lbu	a5,-1972(a5) # 8000d248 <_ZL9finishedA>
    80004a04:	fe0788e3          	beqz	a5,800049f4 <_Z20Threads_CPP_API_testv+0x124>
    80004a08:	00009797          	auipc	a5,0x9
    80004a0c:	8417c783          	lbu	a5,-1983(a5) # 8000d249 <_ZL9finishedB>
    80004a10:	fe0782e3          	beqz	a5,800049f4 <_Z20Threads_CPP_API_testv+0x124>
    80004a14:	00009797          	auipc	a5,0x9
    80004a18:	8367c783          	lbu	a5,-1994(a5) # 8000d24a <_ZL9finishedC>
    80004a1c:	fc078ce3          	beqz	a5,800049f4 <_Z20Threads_CPP_API_testv+0x124>
    80004a20:	00009797          	auipc	a5,0x9
    80004a24:	82b7c783          	lbu	a5,-2005(a5) # 8000d24b <_ZL9finishedD>
    80004a28:	fc0786e3          	beqz	a5,800049f4 <_Z20Threads_CPP_API_testv+0x124>
    80004a2c:	fc040493          	addi	s1,s0,-64
    80004a30:	0080006f          	j	80004a38 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    80004a34:	00848493          	addi	s1,s1,8
    80004a38:	fe040793          	addi	a5,s0,-32
    80004a3c:	08f48663          	beq	s1,a5,80004ac8 <_Z20Threads_CPP_API_testv+0x1f8>
    80004a40:	0004b503          	ld	a0,0(s1)
		delete thread;
    80004a44:	fe0508e3          	beqz	a0,80004a34 <_Z20Threads_CPP_API_testv+0x164>
    80004a48:	00053783          	ld	a5,0(a0)
    80004a4c:	0087b783          	ld	a5,8(a5)
    80004a50:	000780e7          	jalr	a5
    80004a54:	fe1ff06f          	j	80004a34 <_Z20Threads_CPP_API_testv+0x164>
    80004a58:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004a5c:	00048513          	mv	a0,s1
    80004a60:	ffffe097          	auipc	ra,0xffffe
    80004a64:	700080e7          	jalr	1792(ra) # 80003160 <_ZdlPv>
    80004a68:	00090513          	mv	a0,s2
    80004a6c:	0000a097          	auipc	ra,0xa
    80004a70:	8fc080e7          	jalr	-1796(ra) # 8000e368 <_Unwind_Resume>
    80004a74:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004a78:	00048513          	mv	a0,s1
    80004a7c:	ffffe097          	auipc	ra,0xffffe
    80004a80:	6e4080e7          	jalr	1764(ra) # 80003160 <_ZdlPv>
    80004a84:	00090513          	mv	a0,s2
    80004a88:	0000a097          	auipc	ra,0xa
    80004a8c:	8e0080e7          	jalr	-1824(ra) # 8000e368 <_Unwind_Resume>
    80004a90:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004a94:	00048513          	mv	a0,s1
    80004a98:	ffffe097          	auipc	ra,0xffffe
    80004a9c:	6c8080e7          	jalr	1736(ra) # 80003160 <_ZdlPv>
    80004aa0:	00090513          	mv	a0,s2
    80004aa4:	0000a097          	auipc	ra,0xa
    80004aa8:	8c4080e7          	jalr	-1852(ra) # 8000e368 <_Unwind_Resume>
    80004aac:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004ab0:	00048513          	mv	a0,s1
    80004ab4:	ffffe097          	auipc	ra,0xffffe
    80004ab8:	6ac080e7          	jalr	1708(ra) # 80003160 <_ZdlPv>
    80004abc:	00090513          	mv	a0,s2
    80004ac0:	0000a097          	auipc	ra,0xa
    80004ac4:	8a8080e7          	jalr	-1880(ra) # 8000e368 <_Unwind_Resume>
	}
}
    80004ac8:	03813083          	ld	ra,56(sp)
    80004acc:	03013403          	ld	s0,48(sp)
    80004ad0:	02813483          	ld	s1,40(sp)
    80004ad4:	02013903          	ld	s2,32(sp)
    80004ad8:	04010113          	addi	sp,sp,64
    80004adc:	00008067          	ret

0000000080004ae0 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004ae0:	ff010113          	addi	sp,sp,-16
    80004ae4:	00113423          	sd	ra,8(sp)
    80004ae8:	00813023          	sd	s0,0(sp)
    80004aec:	01010413          	addi	s0,sp,16
    80004af0:	00008797          	auipc	a5,0x8
    80004af4:	39078793          	addi	a5,a5,912 # 8000ce80 <_ZTV7WorkerA+0x10>
    80004af8:	00f53023          	sd	a5,0(a0)
    80004afc:	ffffe097          	auipc	ra,0xffffe
    80004b00:	534080e7          	jalr	1332(ra) # 80003030 <_ZN6ThreadD1Ev>
    80004b04:	00813083          	ld	ra,8(sp)
    80004b08:	00013403          	ld	s0,0(sp)
    80004b0c:	01010113          	addi	sp,sp,16
    80004b10:	00008067          	ret

0000000080004b14 <_ZN7WorkerAD0Ev>:
    80004b14:	fe010113          	addi	sp,sp,-32
    80004b18:	00113c23          	sd	ra,24(sp)
    80004b1c:	00813823          	sd	s0,16(sp)
    80004b20:	00913423          	sd	s1,8(sp)
    80004b24:	02010413          	addi	s0,sp,32
    80004b28:	00050493          	mv	s1,a0
    80004b2c:	00008797          	auipc	a5,0x8
    80004b30:	35478793          	addi	a5,a5,852 # 8000ce80 <_ZTV7WorkerA+0x10>
    80004b34:	00f53023          	sd	a5,0(a0)
    80004b38:	ffffe097          	auipc	ra,0xffffe
    80004b3c:	4f8080e7          	jalr	1272(ra) # 80003030 <_ZN6ThreadD1Ev>
    80004b40:	00048513          	mv	a0,s1
    80004b44:	ffffe097          	auipc	ra,0xffffe
    80004b48:	61c080e7          	jalr	1564(ra) # 80003160 <_ZdlPv>
    80004b4c:	01813083          	ld	ra,24(sp)
    80004b50:	01013403          	ld	s0,16(sp)
    80004b54:	00813483          	ld	s1,8(sp)
    80004b58:	02010113          	addi	sp,sp,32
    80004b5c:	00008067          	ret

0000000080004b60 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80004b60:	ff010113          	addi	sp,sp,-16
    80004b64:	00113423          	sd	ra,8(sp)
    80004b68:	00813023          	sd	s0,0(sp)
    80004b6c:	01010413          	addi	s0,sp,16
    80004b70:	00008797          	auipc	a5,0x8
    80004b74:	33878793          	addi	a5,a5,824 # 8000cea8 <_ZTV7WorkerB+0x10>
    80004b78:	00f53023          	sd	a5,0(a0)
    80004b7c:	ffffe097          	auipc	ra,0xffffe
    80004b80:	4b4080e7          	jalr	1204(ra) # 80003030 <_ZN6ThreadD1Ev>
    80004b84:	00813083          	ld	ra,8(sp)
    80004b88:	00013403          	ld	s0,0(sp)
    80004b8c:	01010113          	addi	sp,sp,16
    80004b90:	00008067          	ret

0000000080004b94 <_ZN7WorkerBD0Ev>:
    80004b94:	fe010113          	addi	sp,sp,-32
    80004b98:	00113c23          	sd	ra,24(sp)
    80004b9c:	00813823          	sd	s0,16(sp)
    80004ba0:	00913423          	sd	s1,8(sp)
    80004ba4:	02010413          	addi	s0,sp,32
    80004ba8:	00050493          	mv	s1,a0
    80004bac:	00008797          	auipc	a5,0x8
    80004bb0:	2fc78793          	addi	a5,a5,764 # 8000cea8 <_ZTV7WorkerB+0x10>
    80004bb4:	00f53023          	sd	a5,0(a0)
    80004bb8:	ffffe097          	auipc	ra,0xffffe
    80004bbc:	478080e7          	jalr	1144(ra) # 80003030 <_ZN6ThreadD1Ev>
    80004bc0:	00048513          	mv	a0,s1
    80004bc4:	ffffe097          	auipc	ra,0xffffe
    80004bc8:	59c080e7          	jalr	1436(ra) # 80003160 <_ZdlPv>
    80004bcc:	01813083          	ld	ra,24(sp)
    80004bd0:	01013403          	ld	s0,16(sp)
    80004bd4:	00813483          	ld	s1,8(sp)
    80004bd8:	02010113          	addi	sp,sp,32
    80004bdc:	00008067          	ret

0000000080004be0 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004be0:	ff010113          	addi	sp,sp,-16
    80004be4:	00113423          	sd	ra,8(sp)
    80004be8:	00813023          	sd	s0,0(sp)
    80004bec:	01010413          	addi	s0,sp,16
    80004bf0:	00008797          	auipc	a5,0x8
    80004bf4:	2e078793          	addi	a5,a5,736 # 8000ced0 <_ZTV7WorkerC+0x10>
    80004bf8:	00f53023          	sd	a5,0(a0)
    80004bfc:	ffffe097          	auipc	ra,0xffffe
    80004c00:	434080e7          	jalr	1076(ra) # 80003030 <_ZN6ThreadD1Ev>
    80004c04:	00813083          	ld	ra,8(sp)
    80004c08:	00013403          	ld	s0,0(sp)
    80004c0c:	01010113          	addi	sp,sp,16
    80004c10:	00008067          	ret

0000000080004c14 <_ZN7WorkerCD0Ev>:
    80004c14:	fe010113          	addi	sp,sp,-32
    80004c18:	00113c23          	sd	ra,24(sp)
    80004c1c:	00813823          	sd	s0,16(sp)
    80004c20:	00913423          	sd	s1,8(sp)
    80004c24:	02010413          	addi	s0,sp,32
    80004c28:	00050493          	mv	s1,a0
    80004c2c:	00008797          	auipc	a5,0x8
    80004c30:	2a478793          	addi	a5,a5,676 # 8000ced0 <_ZTV7WorkerC+0x10>
    80004c34:	00f53023          	sd	a5,0(a0)
    80004c38:	ffffe097          	auipc	ra,0xffffe
    80004c3c:	3f8080e7          	jalr	1016(ra) # 80003030 <_ZN6ThreadD1Ev>
    80004c40:	00048513          	mv	a0,s1
    80004c44:	ffffe097          	auipc	ra,0xffffe
    80004c48:	51c080e7          	jalr	1308(ra) # 80003160 <_ZdlPv>
    80004c4c:	01813083          	ld	ra,24(sp)
    80004c50:	01013403          	ld	s0,16(sp)
    80004c54:	00813483          	ld	s1,8(sp)
    80004c58:	02010113          	addi	sp,sp,32
    80004c5c:	00008067          	ret

0000000080004c60 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004c60:	ff010113          	addi	sp,sp,-16
    80004c64:	00113423          	sd	ra,8(sp)
    80004c68:	00813023          	sd	s0,0(sp)
    80004c6c:	01010413          	addi	s0,sp,16
    80004c70:	00008797          	auipc	a5,0x8
    80004c74:	28878793          	addi	a5,a5,648 # 8000cef8 <_ZTV7WorkerD+0x10>
    80004c78:	00f53023          	sd	a5,0(a0)
    80004c7c:	ffffe097          	auipc	ra,0xffffe
    80004c80:	3b4080e7          	jalr	948(ra) # 80003030 <_ZN6ThreadD1Ev>
    80004c84:	00813083          	ld	ra,8(sp)
    80004c88:	00013403          	ld	s0,0(sp)
    80004c8c:	01010113          	addi	sp,sp,16
    80004c90:	00008067          	ret

0000000080004c94 <_ZN7WorkerDD0Ev>:
    80004c94:	fe010113          	addi	sp,sp,-32
    80004c98:	00113c23          	sd	ra,24(sp)
    80004c9c:	00813823          	sd	s0,16(sp)
    80004ca0:	00913423          	sd	s1,8(sp)
    80004ca4:	02010413          	addi	s0,sp,32
    80004ca8:	00050493          	mv	s1,a0
    80004cac:	00008797          	auipc	a5,0x8
    80004cb0:	24c78793          	addi	a5,a5,588 # 8000cef8 <_ZTV7WorkerD+0x10>
    80004cb4:	00f53023          	sd	a5,0(a0)
    80004cb8:	ffffe097          	auipc	ra,0xffffe
    80004cbc:	378080e7          	jalr	888(ra) # 80003030 <_ZN6ThreadD1Ev>
    80004cc0:	00048513          	mv	a0,s1
    80004cc4:	ffffe097          	auipc	ra,0xffffe
    80004cc8:	49c080e7          	jalr	1180(ra) # 80003160 <_ZdlPv>
    80004ccc:	01813083          	ld	ra,24(sp)
    80004cd0:	01013403          	ld	s0,16(sp)
    80004cd4:	00813483          	ld	s1,8(sp)
    80004cd8:	02010113          	addi	sp,sp,32
    80004cdc:	00008067          	ret

0000000080004ce0 <_ZN7WorkerA3runEv>:
    void run() override {
    80004ce0:	ff010113          	addi	sp,sp,-16
    80004ce4:	00113423          	sd	ra,8(sp)
    80004ce8:	00813023          	sd	s0,0(sp)
    80004cec:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004cf0:	00000593          	li	a1,0
    80004cf4:	fffff097          	auipc	ra,0xfffff
    80004cf8:	774080e7          	jalr	1908(ra) # 80004468 <_ZN7WorkerA11workerBodyAEPv>
    }
    80004cfc:	00813083          	ld	ra,8(sp)
    80004d00:	00013403          	ld	s0,0(sp)
    80004d04:	01010113          	addi	sp,sp,16
    80004d08:	00008067          	ret

0000000080004d0c <_ZN7WorkerB3runEv>:
    void run() override {
    80004d0c:	ff010113          	addi	sp,sp,-16
    80004d10:	00113423          	sd	ra,8(sp)
    80004d14:	00813023          	sd	s0,0(sp)
    80004d18:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004d1c:	00000593          	li	a1,0
    80004d20:	00000097          	auipc	ra,0x0
    80004d24:	814080e7          	jalr	-2028(ra) # 80004534 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004d28:	00813083          	ld	ra,8(sp)
    80004d2c:	00013403          	ld	s0,0(sp)
    80004d30:	01010113          	addi	sp,sp,16
    80004d34:	00008067          	ret

0000000080004d38 <_ZN7WorkerC3runEv>:
    void run() override {
    80004d38:	ff010113          	addi	sp,sp,-16
    80004d3c:	00113423          	sd	ra,8(sp)
    80004d40:	00813023          	sd	s0,0(sp)
    80004d44:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004d48:	00000593          	li	a1,0
    80004d4c:	00000097          	auipc	ra,0x0
    80004d50:	8bc080e7          	jalr	-1860(ra) # 80004608 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004d54:	00813083          	ld	ra,8(sp)
    80004d58:	00013403          	ld	s0,0(sp)
    80004d5c:	01010113          	addi	sp,sp,16
    80004d60:	00008067          	ret

0000000080004d64 <_ZN7WorkerD3runEv>:
    void run() override {
    80004d64:	ff010113          	addi	sp,sp,-16
    80004d68:	00113423          	sd	ra,8(sp)
    80004d6c:	00813023          	sd	s0,0(sp)
    80004d70:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004d74:	00000593          	li	a1,0
    80004d78:	00000097          	auipc	ra,0x0
    80004d7c:	a10080e7          	jalr	-1520(ra) # 80004788 <_ZN7WorkerD11workerBodyDEPv>
    }
    80004d80:	00813083          	ld	ra,8(sp)
    80004d84:	00013403          	ld	s0,0(sp)
    80004d88:	01010113          	addi	sp,sp,16
    80004d8c:	00008067          	ret

0000000080004d90 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004d90:	f8010113          	addi	sp,sp,-128
    80004d94:	06113c23          	sd	ra,120(sp)
    80004d98:	06813823          	sd	s0,112(sp)
    80004d9c:	06913423          	sd	s1,104(sp)
    80004da0:	07213023          	sd	s2,96(sp)
    80004da4:	05313c23          	sd	s3,88(sp)
    80004da8:	05413823          	sd	s4,80(sp)
    80004dac:	05513423          	sd	s5,72(sp)
    80004db0:	05613023          	sd	s6,64(sp)
    80004db4:	03713c23          	sd	s7,56(sp)
    80004db8:	03813823          	sd	s8,48(sp)
    80004dbc:	03913423          	sd	s9,40(sp)
    80004dc0:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004dc4:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004dc8:	00005517          	auipc	a0,0x5
    80004dcc:	55050513          	addi	a0,a0,1360 # 8000a318 <CONSOLE_STATUS+0x308>
    80004dd0:	00001097          	auipc	ra,0x1
    80004dd4:	5a8080e7          	jalr	1448(ra) # 80006378 <_Z11printStringPKc>
    getString(input, 30);
    80004dd8:	01e00593          	li	a1,30
    80004ddc:	f8040493          	addi	s1,s0,-128
    80004de0:	00048513          	mv	a0,s1
    80004de4:	00001097          	auipc	ra,0x1
    80004de8:	61c080e7          	jalr	1564(ra) # 80006400 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004dec:	00048513          	mv	a0,s1
    80004df0:	00001097          	auipc	ra,0x1
    80004df4:	6e8080e7          	jalr	1768(ra) # 800064d8 <_Z11stringToIntPKc>
    80004df8:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004dfc:	00005517          	auipc	a0,0x5
    80004e00:	53c50513          	addi	a0,a0,1340 # 8000a338 <CONSOLE_STATUS+0x328>
    80004e04:	00001097          	auipc	ra,0x1
    80004e08:	574080e7          	jalr	1396(ra) # 80006378 <_Z11printStringPKc>
    getString(input, 30);
    80004e0c:	01e00593          	li	a1,30
    80004e10:	00048513          	mv	a0,s1
    80004e14:	00001097          	auipc	ra,0x1
    80004e18:	5ec080e7          	jalr	1516(ra) # 80006400 <_Z9getStringPci>
    n = stringToInt(input);
    80004e1c:	00048513          	mv	a0,s1
    80004e20:	00001097          	auipc	ra,0x1
    80004e24:	6b8080e7          	jalr	1720(ra) # 800064d8 <_Z11stringToIntPKc>
    80004e28:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004e2c:	00005517          	auipc	a0,0x5
    80004e30:	52c50513          	addi	a0,a0,1324 # 8000a358 <CONSOLE_STATUS+0x348>
    80004e34:	00001097          	auipc	ra,0x1
    80004e38:	544080e7          	jalr	1348(ra) # 80006378 <_Z11printStringPKc>
    printInt(threadNum);
    80004e3c:	00000613          	li	a2,0
    80004e40:	00a00593          	li	a1,10
    80004e44:	00098513          	mv	a0,s3
    80004e48:	00001097          	auipc	ra,0x1
    80004e4c:	6e0080e7          	jalr	1760(ra) # 80006528 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004e50:	00005517          	auipc	a0,0x5
    80004e54:	52050513          	addi	a0,a0,1312 # 8000a370 <CONSOLE_STATUS+0x360>
    80004e58:	00001097          	auipc	ra,0x1
    80004e5c:	520080e7          	jalr	1312(ra) # 80006378 <_Z11printStringPKc>
    printInt(n);
    80004e60:	00000613          	li	a2,0
    80004e64:	00a00593          	li	a1,10
    80004e68:	00048513          	mv	a0,s1
    80004e6c:	00001097          	auipc	ra,0x1
    80004e70:	6bc080e7          	jalr	1724(ra) # 80006528 <_Z8printIntiii>
    printString(".\n");
    80004e74:	00005517          	auipc	a0,0x5
    80004e78:	51450513          	addi	a0,a0,1300 # 8000a388 <CONSOLE_STATUS+0x378>
    80004e7c:	00001097          	auipc	ra,0x1
    80004e80:	4fc080e7          	jalr	1276(ra) # 80006378 <_Z11printStringPKc>
    if (threadNum > n) {
    80004e84:	0334c463          	blt	s1,s3,80004eac <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004e88:	03305c63          	blez	s3,80004ec0 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004e8c:	03800513          	li	a0,56
    80004e90:	ffffe097          	auipc	ra,0xffffe
    80004e94:	280080e7          	jalr	640(ra) # 80003110 <_Znwm>
    80004e98:	00050a93          	mv	s5,a0
    80004e9c:	00048593          	mv	a1,s1
    80004ea0:	00001097          	auipc	ra,0x1
    80004ea4:	7a8080e7          	jalr	1960(ra) # 80006648 <_ZN9BufferCPPC1Ei>
    80004ea8:	0300006f          	j	80004ed8 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004eac:	00005517          	auipc	a0,0x5
    80004eb0:	4e450513          	addi	a0,a0,1252 # 8000a390 <CONSOLE_STATUS+0x380>
    80004eb4:	00001097          	auipc	ra,0x1
    80004eb8:	4c4080e7          	jalr	1220(ra) # 80006378 <_Z11printStringPKc>
        return;
    80004ebc:	0140006f          	j	80004ed0 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004ec0:	00005517          	auipc	a0,0x5
    80004ec4:	51050513          	addi	a0,a0,1296 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80004ec8:	00001097          	auipc	ra,0x1
    80004ecc:	4b0080e7          	jalr	1200(ra) # 80006378 <_Z11printStringPKc>
        return;
    80004ed0:	000c0113          	mv	sp,s8
    80004ed4:	2140006f          	j	800050e8 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004ed8:	01000513          	li	a0,16
    80004edc:	ffffe097          	auipc	ra,0xffffe
    80004ee0:	234080e7          	jalr	564(ra) # 80003110 <_Znwm>
    80004ee4:	00050913          	mv	s2,a0
    80004ee8:	00000593          	li	a1,0
    80004eec:	ffffe097          	auipc	ra,0xffffe
    80004ef0:	588080e7          	jalr	1416(ra) # 80003474 <_ZN9SemaphoreC1Ej>
    80004ef4:	00008797          	auipc	a5,0x8
    80004ef8:	3727b223          	sd	s2,868(a5) # 8000d258 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004efc:	00399793          	slli	a5,s3,0x3
    80004f00:	00f78793          	addi	a5,a5,15
    80004f04:	ff07f793          	andi	a5,a5,-16
    80004f08:	40f10133          	sub	sp,sp,a5
    80004f0c:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004f10:	0019871b          	addiw	a4,s3,1
    80004f14:	00171793          	slli	a5,a4,0x1
    80004f18:	00e787b3          	add	a5,a5,a4
    80004f1c:	00379793          	slli	a5,a5,0x3
    80004f20:	00f78793          	addi	a5,a5,15
    80004f24:	ff07f793          	andi	a5,a5,-16
    80004f28:	40f10133          	sub	sp,sp,a5
    80004f2c:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004f30:	00199493          	slli	s1,s3,0x1
    80004f34:	013484b3          	add	s1,s1,s3
    80004f38:	00349493          	slli	s1,s1,0x3
    80004f3c:	009b04b3          	add	s1,s6,s1
    80004f40:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004f44:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004f48:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004f4c:	02800513          	li	a0,40
    80004f50:	ffffe097          	auipc	ra,0xffffe
    80004f54:	1c0080e7          	jalr	448(ra) # 80003110 <_Znwm>
    80004f58:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004f5c:	ffffe097          	auipc	ra,0xffffe
    80004f60:	49c080e7          	jalr	1180(ra) # 800033f8 <_ZN6ThreadC1Ev>
    80004f64:	00008797          	auipc	a5,0x8
    80004f68:	00c78793          	addi	a5,a5,12 # 8000cf70 <_ZTV8Consumer+0x10>
    80004f6c:	00fbb023          	sd	a5,0(s7)
    80004f70:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004f74:	000b8513          	mv	a0,s7
    80004f78:	ffffe097          	auipc	ra,0xffffe
    80004f7c:	350080e7          	jalr	848(ra) # 800032c8 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004f80:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004f84:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004f88:	00008797          	auipc	a5,0x8
    80004f8c:	2d07b783          	ld	a5,720(a5) # 8000d258 <_ZL10waitForAll>
    80004f90:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004f94:	02800513          	li	a0,40
    80004f98:	ffffe097          	auipc	ra,0xffffe
    80004f9c:	178080e7          	jalr	376(ra) # 80003110 <_Znwm>
    80004fa0:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004fa4:	ffffe097          	auipc	ra,0xffffe
    80004fa8:	454080e7          	jalr	1108(ra) # 800033f8 <_ZN6ThreadC1Ev>
    80004fac:	00008797          	auipc	a5,0x8
    80004fb0:	f7478793          	addi	a5,a5,-140 # 8000cf20 <_ZTV16ProducerKeyborad+0x10>
    80004fb4:	00f4b023          	sd	a5,0(s1)
    80004fb8:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004fbc:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004fc0:	00048513          	mv	a0,s1
    80004fc4:	ffffe097          	auipc	ra,0xffffe
    80004fc8:	304080e7          	jalr	772(ra) # 800032c8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004fcc:	00100913          	li	s2,1
    80004fd0:	0300006f          	j	80005000 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004fd4:	00008797          	auipc	a5,0x8
    80004fd8:	f7478793          	addi	a5,a5,-140 # 8000cf48 <_ZTV8Producer+0x10>
    80004fdc:	00fcb023          	sd	a5,0(s9)
    80004fe0:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004fe4:	00391793          	slli	a5,s2,0x3
    80004fe8:	00fa07b3          	add	a5,s4,a5
    80004fec:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004ff0:	000c8513          	mv	a0,s9
    80004ff4:	ffffe097          	auipc	ra,0xffffe
    80004ff8:	2d4080e7          	jalr	724(ra) # 800032c8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004ffc:	0019091b          	addiw	s2,s2,1
    80005000:	05395263          	bge	s2,s3,80005044 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80005004:	00191493          	slli	s1,s2,0x1
    80005008:	012484b3          	add	s1,s1,s2
    8000500c:	00349493          	slli	s1,s1,0x3
    80005010:	009b04b3          	add	s1,s6,s1
    80005014:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80005018:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    8000501c:	00008797          	auipc	a5,0x8
    80005020:	23c7b783          	ld	a5,572(a5) # 8000d258 <_ZL10waitForAll>
    80005024:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80005028:	02800513          	li	a0,40
    8000502c:	ffffe097          	auipc	ra,0xffffe
    80005030:	0e4080e7          	jalr	228(ra) # 80003110 <_Znwm>
    80005034:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80005038:	ffffe097          	auipc	ra,0xffffe
    8000503c:	3c0080e7          	jalr	960(ra) # 800033f8 <_ZN6ThreadC1Ev>
    80005040:	f95ff06f          	j	80004fd4 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80005044:	ffffe097          	auipc	ra,0xffffe
    80005048:	2f8080e7          	jalr	760(ra) # 8000333c <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    8000504c:	00000493          	li	s1,0
    80005050:	0099ce63          	blt	s3,s1,8000506c <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80005054:	00008517          	auipc	a0,0x8
    80005058:	20453503          	ld	a0,516(a0) # 8000d258 <_ZL10waitForAll>
    8000505c:	ffffe097          	auipc	ra,0xffffe
    80005060:	450080e7          	jalr	1104(ra) # 800034ac <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005064:	0014849b          	addiw	s1,s1,1
    80005068:	fe9ff06f          	j	80005050 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    8000506c:	00008517          	auipc	a0,0x8
    80005070:	1ec53503          	ld	a0,492(a0) # 8000d258 <_ZL10waitForAll>
    80005074:	00050863          	beqz	a0,80005084 <_Z20testConsumerProducerv+0x2f4>
    80005078:	00053783          	ld	a5,0(a0)
    8000507c:	0087b783          	ld	a5,8(a5)
    80005080:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80005084:	00000493          	li	s1,0
    80005088:	0080006f          	j	80005090 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    8000508c:	0014849b          	addiw	s1,s1,1
    80005090:	0334d263          	bge	s1,s3,800050b4 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80005094:	00349793          	slli	a5,s1,0x3
    80005098:	00fa07b3          	add	a5,s4,a5
    8000509c:	0007b503          	ld	a0,0(a5)
    800050a0:	fe0506e3          	beqz	a0,8000508c <_Z20testConsumerProducerv+0x2fc>
    800050a4:	00053783          	ld	a5,0(a0)
    800050a8:	0087b783          	ld	a5,8(a5)
    800050ac:	000780e7          	jalr	a5
    800050b0:	fddff06f          	j	8000508c <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    800050b4:	000b8a63          	beqz	s7,800050c8 <_Z20testConsumerProducerv+0x338>
    800050b8:	000bb783          	ld	a5,0(s7)
    800050bc:	0087b783          	ld	a5,8(a5)
    800050c0:	000b8513          	mv	a0,s7
    800050c4:	000780e7          	jalr	a5
    delete buffer;
    800050c8:	000a8e63          	beqz	s5,800050e4 <_Z20testConsumerProducerv+0x354>
    800050cc:	000a8513          	mv	a0,s5
    800050d0:	00002097          	auipc	ra,0x2
    800050d4:	870080e7          	jalr	-1936(ra) # 80006940 <_ZN9BufferCPPD1Ev>
    800050d8:	000a8513          	mv	a0,s5
    800050dc:	ffffe097          	auipc	ra,0xffffe
    800050e0:	084080e7          	jalr	132(ra) # 80003160 <_ZdlPv>
    800050e4:	000c0113          	mv	sp,s8
}
    800050e8:	f8040113          	addi	sp,s0,-128
    800050ec:	07813083          	ld	ra,120(sp)
    800050f0:	07013403          	ld	s0,112(sp)
    800050f4:	06813483          	ld	s1,104(sp)
    800050f8:	06013903          	ld	s2,96(sp)
    800050fc:	05813983          	ld	s3,88(sp)
    80005100:	05013a03          	ld	s4,80(sp)
    80005104:	04813a83          	ld	s5,72(sp)
    80005108:	04013b03          	ld	s6,64(sp)
    8000510c:	03813b83          	ld	s7,56(sp)
    80005110:	03013c03          	ld	s8,48(sp)
    80005114:	02813c83          	ld	s9,40(sp)
    80005118:	08010113          	addi	sp,sp,128
    8000511c:	00008067          	ret
    80005120:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005124:	000a8513          	mv	a0,s5
    80005128:	ffffe097          	auipc	ra,0xffffe
    8000512c:	038080e7          	jalr	56(ra) # 80003160 <_ZdlPv>
    80005130:	00048513          	mv	a0,s1
    80005134:	00009097          	auipc	ra,0x9
    80005138:	234080e7          	jalr	564(ra) # 8000e368 <_Unwind_Resume>
    8000513c:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80005140:	00090513          	mv	a0,s2
    80005144:	ffffe097          	auipc	ra,0xffffe
    80005148:	01c080e7          	jalr	28(ra) # 80003160 <_ZdlPv>
    8000514c:	00048513          	mv	a0,s1
    80005150:	00009097          	auipc	ra,0x9
    80005154:	218080e7          	jalr	536(ra) # 8000e368 <_Unwind_Resume>
    80005158:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    8000515c:	000b8513          	mv	a0,s7
    80005160:	ffffe097          	auipc	ra,0xffffe
    80005164:	000080e7          	jalr	ra # 80003160 <_ZdlPv>
    80005168:	00048513          	mv	a0,s1
    8000516c:	00009097          	auipc	ra,0x9
    80005170:	1fc080e7          	jalr	508(ra) # 8000e368 <_Unwind_Resume>
    80005174:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80005178:	00048513          	mv	a0,s1
    8000517c:	ffffe097          	auipc	ra,0xffffe
    80005180:	fe4080e7          	jalr	-28(ra) # 80003160 <_ZdlPv>
    80005184:	00090513          	mv	a0,s2
    80005188:	00009097          	auipc	ra,0x9
    8000518c:	1e0080e7          	jalr	480(ra) # 8000e368 <_Unwind_Resume>
    80005190:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80005194:	000c8513          	mv	a0,s9
    80005198:	ffffe097          	auipc	ra,0xffffe
    8000519c:	fc8080e7          	jalr	-56(ra) # 80003160 <_ZdlPv>
    800051a0:	00048513          	mv	a0,s1
    800051a4:	00009097          	auipc	ra,0x9
    800051a8:	1c4080e7          	jalr	452(ra) # 8000e368 <_Unwind_Resume>

00000000800051ac <_ZN8Consumer3runEv>:
    void run() override {
    800051ac:	fd010113          	addi	sp,sp,-48
    800051b0:	02113423          	sd	ra,40(sp)
    800051b4:	02813023          	sd	s0,32(sp)
    800051b8:	00913c23          	sd	s1,24(sp)
    800051bc:	01213823          	sd	s2,16(sp)
    800051c0:	01313423          	sd	s3,8(sp)
    800051c4:	03010413          	addi	s0,sp,48
    800051c8:	00050913          	mv	s2,a0
        int i = 0;
    800051cc:	00000993          	li	s3,0
    800051d0:	0100006f          	j	800051e0 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800051d4:	00a00513          	li	a0,10
    800051d8:	ffffe097          	auipc	ra,0xffffe
    800051dc:	3c4080e7          	jalr	964(ra) # 8000359c <_ZN7Console4putcEc>
        while (!threadEnd) {
    800051e0:	00008797          	auipc	a5,0x8
    800051e4:	0707a783          	lw	a5,112(a5) # 8000d250 <_ZL9threadEnd>
    800051e8:	04079a63          	bnez	a5,8000523c <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    800051ec:	02093783          	ld	a5,32(s2)
    800051f0:	0087b503          	ld	a0,8(a5)
    800051f4:	00001097          	auipc	ra,0x1
    800051f8:	638080e7          	jalr	1592(ra) # 8000682c <_ZN9BufferCPP3getEv>
            i++;
    800051fc:	0019849b          	addiw	s1,s3,1
    80005200:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80005204:	0ff57513          	andi	a0,a0,255
    80005208:	ffffe097          	auipc	ra,0xffffe
    8000520c:	394080e7          	jalr	916(ra) # 8000359c <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80005210:	05000793          	li	a5,80
    80005214:	02f4e4bb          	remw	s1,s1,a5
    80005218:	fc0494e3          	bnez	s1,800051e0 <_ZN8Consumer3runEv+0x34>
    8000521c:	fb9ff06f          	j	800051d4 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80005220:	02093783          	ld	a5,32(s2)
    80005224:	0087b503          	ld	a0,8(a5)
    80005228:	00001097          	auipc	ra,0x1
    8000522c:	604080e7          	jalr	1540(ra) # 8000682c <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80005230:	0ff57513          	andi	a0,a0,255
    80005234:	ffffe097          	auipc	ra,0xffffe
    80005238:	368080e7          	jalr	872(ra) # 8000359c <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    8000523c:	02093783          	ld	a5,32(s2)
    80005240:	0087b503          	ld	a0,8(a5)
    80005244:	00001097          	auipc	ra,0x1
    80005248:	674080e7          	jalr	1652(ra) # 800068b8 <_ZN9BufferCPP6getCntEv>
    8000524c:	fca04ae3          	bgtz	a0,80005220 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80005250:	02093783          	ld	a5,32(s2)
    80005254:	0107b503          	ld	a0,16(a5)
    80005258:	ffffe097          	auipc	ra,0xffffe
    8000525c:	280080e7          	jalr	640(ra) # 800034d8 <_ZN9Semaphore6signalEv>
    }
    80005260:	02813083          	ld	ra,40(sp)
    80005264:	02013403          	ld	s0,32(sp)
    80005268:	01813483          	ld	s1,24(sp)
    8000526c:	01013903          	ld	s2,16(sp)
    80005270:	00813983          	ld	s3,8(sp)
    80005274:	03010113          	addi	sp,sp,48
    80005278:	00008067          	ret

000000008000527c <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    8000527c:	ff010113          	addi	sp,sp,-16
    80005280:	00113423          	sd	ra,8(sp)
    80005284:	00813023          	sd	s0,0(sp)
    80005288:	01010413          	addi	s0,sp,16
    8000528c:	00008797          	auipc	a5,0x8
    80005290:	ce478793          	addi	a5,a5,-796 # 8000cf70 <_ZTV8Consumer+0x10>
    80005294:	00f53023          	sd	a5,0(a0)
    80005298:	ffffe097          	auipc	ra,0xffffe
    8000529c:	d98080e7          	jalr	-616(ra) # 80003030 <_ZN6ThreadD1Ev>
    800052a0:	00813083          	ld	ra,8(sp)
    800052a4:	00013403          	ld	s0,0(sp)
    800052a8:	01010113          	addi	sp,sp,16
    800052ac:	00008067          	ret

00000000800052b0 <_ZN8ConsumerD0Ev>:
    800052b0:	fe010113          	addi	sp,sp,-32
    800052b4:	00113c23          	sd	ra,24(sp)
    800052b8:	00813823          	sd	s0,16(sp)
    800052bc:	00913423          	sd	s1,8(sp)
    800052c0:	02010413          	addi	s0,sp,32
    800052c4:	00050493          	mv	s1,a0
    800052c8:	00008797          	auipc	a5,0x8
    800052cc:	ca878793          	addi	a5,a5,-856 # 8000cf70 <_ZTV8Consumer+0x10>
    800052d0:	00f53023          	sd	a5,0(a0)
    800052d4:	ffffe097          	auipc	ra,0xffffe
    800052d8:	d5c080e7          	jalr	-676(ra) # 80003030 <_ZN6ThreadD1Ev>
    800052dc:	00048513          	mv	a0,s1
    800052e0:	ffffe097          	auipc	ra,0xffffe
    800052e4:	e80080e7          	jalr	-384(ra) # 80003160 <_ZdlPv>
    800052e8:	01813083          	ld	ra,24(sp)
    800052ec:	01013403          	ld	s0,16(sp)
    800052f0:	00813483          	ld	s1,8(sp)
    800052f4:	02010113          	addi	sp,sp,32
    800052f8:	00008067          	ret

00000000800052fc <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    800052fc:	ff010113          	addi	sp,sp,-16
    80005300:	00113423          	sd	ra,8(sp)
    80005304:	00813023          	sd	s0,0(sp)
    80005308:	01010413          	addi	s0,sp,16
    8000530c:	00008797          	auipc	a5,0x8
    80005310:	c1478793          	addi	a5,a5,-1004 # 8000cf20 <_ZTV16ProducerKeyborad+0x10>
    80005314:	00f53023          	sd	a5,0(a0)
    80005318:	ffffe097          	auipc	ra,0xffffe
    8000531c:	d18080e7          	jalr	-744(ra) # 80003030 <_ZN6ThreadD1Ev>
    80005320:	00813083          	ld	ra,8(sp)
    80005324:	00013403          	ld	s0,0(sp)
    80005328:	01010113          	addi	sp,sp,16
    8000532c:	00008067          	ret

0000000080005330 <_ZN16ProducerKeyboradD0Ev>:
    80005330:	fe010113          	addi	sp,sp,-32
    80005334:	00113c23          	sd	ra,24(sp)
    80005338:	00813823          	sd	s0,16(sp)
    8000533c:	00913423          	sd	s1,8(sp)
    80005340:	02010413          	addi	s0,sp,32
    80005344:	00050493          	mv	s1,a0
    80005348:	00008797          	auipc	a5,0x8
    8000534c:	bd878793          	addi	a5,a5,-1064 # 8000cf20 <_ZTV16ProducerKeyborad+0x10>
    80005350:	00f53023          	sd	a5,0(a0)
    80005354:	ffffe097          	auipc	ra,0xffffe
    80005358:	cdc080e7          	jalr	-804(ra) # 80003030 <_ZN6ThreadD1Ev>
    8000535c:	00048513          	mv	a0,s1
    80005360:	ffffe097          	auipc	ra,0xffffe
    80005364:	e00080e7          	jalr	-512(ra) # 80003160 <_ZdlPv>
    80005368:	01813083          	ld	ra,24(sp)
    8000536c:	01013403          	ld	s0,16(sp)
    80005370:	00813483          	ld	s1,8(sp)
    80005374:	02010113          	addi	sp,sp,32
    80005378:	00008067          	ret

000000008000537c <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    8000537c:	ff010113          	addi	sp,sp,-16
    80005380:	00113423          	sd	ra,8(sp)
    80005384:	00813023          	sd	s0,0(sp)
    80005388:	01010413          	addi	s0,sp,16
    8000538c:	00008797          	auipc	a5,0x8
    80005390:	bbc78793          	addi	a5,a5,-1092 # 8000cf48 <_ZTV8Producer+0x10>
    80005394:	00f53023          	sd	a5,0(a0)
    80005398:	ffffe097          	auipc	ra,0xffffe
    8000539c:	c98080e7          	jalr	-872(ra) # 80003030 <_ZN6ThreadD1Ev>
    800053a0:	00813083          	ld	ra,8(sp)
    800053a4:	00013403          	ld	s0,0(sp)
    800053a8:	01010113          	addi	sp,sp,16
    800053ac:	00008067          	ret

00000000800053b0 <_ZN8ProducerD0Ev>:
    800053b0:	fe010113          	addi	sp,sp,-32
    800053b4:	00113c23          	sd	ra,24(sp)
    800053b8:	00813823          	sd	s0,16(sp)
    800053bc:	00913423          	sd	s1,8(sp)
    800053c0:	02010413          	addi	s0,sp,32
    800053c4:	00050493          	mv	s1,a0
    800053c8:	00008797          	auipc	a5,0x8
    800053cc:	b8078793          	addi	a5,a5,-1152 # 8000cf48 <_ZTV8Producer+0x10>
    800053d0:	00f53023          	sd	a5,0(a0)
    800053d4:	ffffe097          	auipc	ra,0xffffe
    800053d8:	c5c080e7          	jalr	-932(ra) # 80003030 <_ZN6ThreadD1Ev>
    800053dc:	00048513          	mv	a0,s1
    800053e0:	ffffe097          	auipc	ra,0xffffe
    800053e4:	d80080e7          	jalr	-640(ra) # 80003160 <_ZdlPv>
    800053e8:	01813083          	ld	ra,24(sp)
    800053ec:	01013403          	ld	s0,16(sp)
    800053f0:	00813483          	ld	s1,8(sp)
    800053f4:	02010113          	addi	sp,sp,32
    800053f8:	00008067          	ret

00000000800053fc <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    800053fc:	fe010113          	addi	sp,sp,-32
    80005400:	00113c23          	sd	ra,24(sp)
    80005404:	00813823          	sd	s0,16(sp)
    80005408:	00913423          	sd	s1,8(sp)
    8000540c:	02010413          	addi	s0,sp,32
    80005410:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80005414:	ffffc097          	auipc	ra,0xffffc
    80005418:	1ec080e7          	jalr	492(ra) # 80001600 <_Z4getcv>
    8000541c:	0005059b          	sext.w	a1,a0
    80005420:	01b00793          	li	a5,27
    80005424:	00f58c63          	beq	a1,a5,8000543c <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80005428:	0204b783          	ld	a5,32(s1)
    8000542c:	0087b503          	ld	a0,8(a5)
    80005430:	00001097          	auipc	ra,0x1
    80005434:	36c080e7          	jalr	876(ra) # 8000679c <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80005438:	fddff06f          	j	80005414 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    8000543c:	00100793          	li	a5,1
    80005440:	00008717          	auipc	a4,0x8
    80005444:	e0f72823          	sw	a5,-496(a4) # 8000d250 <_ZL9threadEnd>
        td->buffer->put('!');
    80005448:	0204b783          	ld	a5,32(s1)
    8000544c:	02100593          	li	a1,33
    80005450:	0087b503          	ld	a0,8(a5)
    80005454:	00001097          	auipc	ra,0x1
    80005458:	348080e7          	jalr	840(ra) # 8000679c <_ZN9BufferCPP3putEi>
        td->sem->signal();
    8000545c:	0204b783          	ld	a5,32(s1)
    80005460:	0107b503          	ld	a0,16(a5)
    80005464:	ffffe097          	auipc	ra,0xffffe
    80005468:	074080e7          	jalr	116(ra) # 800034d8 <_ZN9Semaphore6signalEv>
    }
    8000546c:	01813083          	ld	ra,24(sp)
    80005470:	01013403          	ld	s0,16(sp)
    80005474:	00813483          	ld	s1,8(sp)
    80005478:	02010113          	addi	sp,sp,32
    8000547c:	00008067          	ret

0000000080005480 <_ZN8Producer3runEv>:
    void run() override {
    80005480:	fe010113          	addi	sp,sp,-32
    80005484:	00113c23          	sd	ra,24(sp)
    80005488:	00813823          	sd	s0,16(sp)
    8000548c:	00913423          	sd	s1,8(sp)
    80005490:	01213023          	sd	s2,0(sp)
    80005494:	02010413          	addi	s0,sp,32
    80005498:	00050493          	mv	s1,a0
        int i = 0;
    8000549c:	00000913          	li	s2,0
        while (!threadEnd) {
    800054a0:	00008797          	auipc	a5,0x8
    800054a4:	db07a783          	lw	a5,-592(a5) # 8000d250 <_ZL9threadEnd>
    800054a8:	04079263          	bnez	a5,800054ec <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    800054ac:	0204b783          	ld	a5,32(s1)
    800054b0:	0007a583          	lw	a1,0(a5)
    800054b4:	0305859b          	addiw	a1,a1,48
    800054b8:	0087b503          	ld	a0,8(a5)
    800054bc:	00001097          	auipc	ra,0x1
    800054c0:	2e0080e7          	jalr	736(ra) # 8000679c <_ZN9BufferCPP3putEi>
            i++;
    800054c4:	0019071b          	addiw	a4,s2,1
    800054c8:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    800054cc:	0204b783          	ld	a5,32(s1)
    800054d0:	0007a783          	lw	a5,0(a5)
    800054d4:	00e787bb          	addw	a5,a5,a4
    800054d8:	00500513          	li	a0,5
    800054dc:	02a7e53b          	remw	a0,a5,a0
    800054e0:	ffffe097          	auipc	ra,0xffffe
    800054e4:	e84080e7          	jalr	-380(ra) # 80003364 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    800054e8:	fb9ff06f          	j	800054a0 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    800054ec:	0204b783          	ld	a5,32(s1)
    800054f0:	0107b503          	ld	a0,16(a5)
    800054f4:	ffffe097          	auipc	ra,0xffffe
    800054f8:	fe4080e7          	jalr	-28(ra) # 800034d8 <_ZN9Semaphore6signalEv>
    }
    800054fc:	01813083          	ld	ra,24(sp)
    80005500:	01013403          	ld	s0,16(sp)
    80005504:	00813483          	ld	s1,8(sp)
    80005508:	00013903          	ld	s2,0(sp)
    8000550c:	02010113          	addi	sp,sp,32
    80005510:	00008067          	ret

0000000080005514 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005514:	fe010113          	addi	sp,sp,-32
    80005518:	00113c23          	sd	ra,24(sp)
    8000551c:	00813823          	sd	s0,16(sp)
    80005520:	00913423          	sd	s1,8(sp)
    80005524:	01213023          	sd	s2,0(sp)
    80005528:	02010413          	addi	s0,sp,32
    8000552c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005530:	00100793          	li	a5,1
    80005534:	02a7f863          	bgeu	a5,a0,80005564 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005538:	00a00793          	li	a5,10
    8000553c:	02f577b3          	remu	a5,a0,a5
    80005540:	02078e63          	beqz	a5,8000557c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005544:	fff48513          	addi	a0,s1,-1
    80005548:	00000097          	auipc	ra,0x0
    8000554c:	fcc080e7          	jalr	-52(ra) # 80005514 <_ZL9fibonaccim>
    80005550:	00050913          	mv	s2,a0
    80005554:	ffe48513          	addi	a0,s1,-2
    80005558:	00000097          	auipc	ra,0x0
    8000555c:	fbc080e7          	jalr	-68(ra) # 80005514 <_ZL9fibonaccim>
    80005560:	00a90533          	add	a0,s2,a0
}
    80005564:	01813083          	ld	ra,24(sp)
    80005568:	01013403          	ld	s0,16(sp)
    8000556c:	00813483          	ld	s1,8(sp)
    80005570:	00013903          	ld	s2,0(sp)
    80005574:	02010113          	addi	sp,sp,32
    80005578:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000557c:	ffffc097          	auipc	ra,0xffffc
    80005580:	f44080e7          	jalr	-188(ra) # 800014c0 <_Z15thread_dispatchv>
    80005584:	fc1ff06f          	j	80005544 <_ZL9fibonaccim+0x30>

0000000080005588 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005588:	fe010113          	addi	sp,sp,-32
    8000558c:	00113c23          	sd	ra,24(sp)
    80005590:	00813823          	sd	s0,16(sp)
    80005594:	00913423          	sd	s1,8(sp)
    80005598:	01213023          	sd	s2,0(sp)
    8000559c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800055a0:	00a00493          	li	s1,10
    800055a4:	0400006f          	j	800055e4 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800055a8:	00005517          	auipc	a0,0x5
    800055ac:	ec850513          	addi	a0,a0,-312 # 8000a470 <CONSOLE_STATUS+0x460>
    800055b0:	00001097          	auipc	ra,0x1
    800055b4:	dc8080e7          	jalr	-568(ra) # 80006378 <_Z11printStringPKc>
    800055b8:	00000613          	li	a2,0
    800055bc:	00a00593          	li	a1,10
    800055c0:	00048513          	mv	a0,s1
    800055c4:	00001097          	auipc	ra,0x1
    800055c8:	f64080e7          	jalr	-156(ra) # 80006528 <_Z8printIntiii>
    800055cc:	00005517          	auipc	a0,0x5
    800055d0:	09450513          	addi	a0,a0,148 # 8000a660 <CONSOLE_STATUS+0x650>
    800055d4:	00001097          	auipc	ra,0x1
    800055d8:	da4080e7          	jalr	-604(ra) # 80006378 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800055dc:	0014849b          	addiw	s1,s1,1
    800055e0:	0ff4f493          	andi	s1,s1,255
    800055e4:	00c00793          	li	a5,12
    800055e8:	fc97f0e3          	bgeu	a5,s1,800055a8 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800055ec:	00005517          	auipc	a0,0x5
    800055f0:	e8c50513          	addi	a0,a0,-372 # 8000a478 <CONSOLE_STATUS+0x468>
    800055f4:	00001097          	auipc	ra,0x1
    800055f8:	d84080e7          	jalr	-636(ra) # 80006378 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800055fc:	00500313          	li	t1,5
    thread_dispatch();
    80005600:	ffffc097          	auipc	ra,0xffffc
    80005604:	ec0080e7          	jalr	-320(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005608:	01000513          	li	a0,16
    8000560c:	00000097          	auipc	ra,0x0
    80005610:	f08080e7          	jalr	-248(ra) # 80005514 <_ZL9fibonaccim>
    80005614:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005618:	00005517          	auipc	a0,0x5
    8000561c:	e7050513          	addi	a0,a0,-400 # 8000a488 <CONSOLE_STATUS+0x478>
    80005620:	00001097          	auipc	ra,0x1
    80005624:	d58080e7          	jalr	-680(ra) # 80006378 <_Z11printStringPKc>
    80005628:	00000613          	li	a2,0
    8000562c:	00a00593          	li	a1,10
    80005630:	0009051b          	sext.w	a0,s2
    80005634:	00001097          	auipc	ra,0x1
    80005638:	ef4080e7          	jalr	-268(ra) # 80006528 <_Z8printIntiii>
    8000563c:	00005517          	auipc	a0,0x5
    80005640:	02450513          	addi	a0,a0,36 # 8000a660 <CONSOLE_STATUS+0x650>
    80005644:	00001097          	auipc	ra,0x1
    80005648:	d34080e7          	jalr	-716(ra) # 80006378 <_Z11printStringPKc>
    8000564c:	0400006f          	j	8000568c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005650:	00005517          	auipc	a0,0x5
    80005654:	e2050513          	addi	a0,a0,-480 # 8000a470 <CONSOLE_STATUS+0x460>
    80005658:	00001097          	auipc	ra,0x1
    8000565c:	d20080e7          	jalr	-736(ra) # 80006378 <_Z11printStringPKc>
    80005660:	00000613          	li	a2,0
    80005664:	00a00593          	li	a1,10
    80005668:	00048513          	mv	a0,s1
    8000566c:	00001097          	auipc	ra,0x1
    80005670:	ebc080e7          	jalr	-324(ra) # 80006528 <_Z8printIntiii>
    80005674:	00005517          	auipc	a0,0x5
    80005678:	fec50513          	addi	a0,a0,-20 # 8000a660 <CONSOLE_STATUS+0x650>
    8000567c:	00001097          	auipc	ra,0x1
    80005680:	cfc080e7          	jalr	-772(ra) # 80006378 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005684:	0014849b          	addiw	s1,s1,1
    80005688:	0ff4f493          	andi	s1,s1,255
    8000568c:	00f00793          	li	a5,15
    80005690:	fc97f0e3          	bgeu	a5,s1,80005650 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005694:	00005517          	auipc	a0,0x5
    80005698:	e0450513          	addi	a0,a0,-508 # 8000a498 <CONSOLE_STATUS+0x488>
    8000569c:	00001097          	auipc	ra,0x1
    800056a0:	cdc080e7          	jalr	-804(ra) # 80006378 <_Z11printStringPKc>
    finishedD = true;
    800056a4:	00100793          	li	a5,1
    800056a8:	00008717          	auipc	a4,0x8
    800056ac:	baf70c23          	sb	a5,-1096(a4) # 8000d260 <_ZL9finishedD>
    thread_dispatch();
    800056b0:	ffffc097          	auipc	ra,0xffffc
    800056b4:	e10080e7          	jalr	-496(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800056b8:	01813083          	ld	ra,24(sp)
    800056bc:	01013403          	ld	s0,16(sp)
    800056c0:	00813483          	ld	s1,8(sp)
    800056c4:	00013903          	ld	s2,0(sp)
    800056c8:	02010113          	addi	sp,sp,32
    800056cc:	00008067          	ret

00000000800056d0 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800056d0:	fe010113          	addi	sp,sp,-32
    800056d4:	00113c23          	sd	ra,24(sp)
    800056d8:	00813823          	sd	s0,16(sp)
    800056dc:	00913423          	sd	s1,8(sp)
    800056e0:	01213023          	sd	s2,0(sp)
    800056e4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800056e8:	00000493          	li	s1,0
    800056ec:	0400006f          	j	8000572c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800056f0:	00005517          	auipc	a0,0x5
    800056f4:	d4050513          	addi	a0,a0,-704 # 8000a430 <CONSOLE_STATUS+0x420>
    800056f8:	00001097          	auipc	ra,0x1
    800056fc:	c80080e7          	jalr	-896(ra) # 80006378 <_Z11printStringPKc>
    80005700:	00000613          	li	a2,0
    80005704:	00a00593          	li	a1,10
    80005708:	00048513          	mv	a0,s1
    8000570c:	00001097          	auipc	ra,0x1
    80005710:	e1c080e7          	jalr	-484(ra) # 80006528 <_Z8printIntiii>
    80005714:	00005517          	auipc	a0,0x5
    80005718:	f4c50513          	addi	a0,a0,-180 # 8000a660 <CONSOLE_STATUS+0x650>
    8000571c:	00001097          	auipc	ra,0x1
    80005720:	c5c080e7          	jalr	-932(ra) # 80006378 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005724:	0014849b          	addiw	s1,s1,1
    80005728:	0ff4f493          	andi	s1,s1,255
    8000572c:	00200793          	li	a5,2
    80005730:	fc97f0e3          	bgeu	a5,s1,800056f0 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005734:	00005517          	auipc	a0,0x5
    80005738:	d0450513          	addi	a0,a0,-764 # 8000a438 <CONSOLE_STATUS+0x428>
    8000573c:	00001097          	auipc	ra,0x1
    80005740:	c3c080e7          	jalr	-964(ra) # 80006378 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005744:	00700313          	li	t1,7
    thread_dispatch();
    80005748:	ffffc097          	auipc	ra,0xffffc
    8000574c:	d78080e7          	jalr	-648(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005750:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005754:	00005517          	auipc	a0,0x5
    80005758:	cf450513          	addi	a0,a0,-780 # 8000a448 <CONSOLE_STATUS+0x438>
    8000575c:	00001097          	auipc	ra,0x1
    80005760:	c1c080e7          	jalr	-996(ra) # 80006378 <_Z11printStringPKc>
    80005764:	00000613          	li	a2,0
    80005768:	00a00593          	li	a1,10
    8000576c:	0009051b          	sext.w	a0,s2
    80005770:	00001097          	auipc	ra,0x1
    80005774:	db8080e7          	jalr	-584(ra) # 80006528 <_Z8printIntiii>
    80005778:	00005517          	auipc	a0,0x5
    8000577c:	ee850513          	addi	a0,a0,-280 # 8000a660 <CONSOLE_STATUS+0x650>
    80005780:	00001097          	auipc	ra,0x1
    80005784:	bf8080e7          	jalr	-1032(ra) # 80006378 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005788:	00c00513          	li	a0,12
    8000578c:	00000097          	auipc	ra,0x0
    80005790:	d88080e7          	jalr	-632(ra) # 80005514 <_ZL9fibonaccim>
    80005794:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005798:	00005517          	auipc	a0,0x5
    8000579c:	cb850513          	addi	a0,a0,-840 # 8000a450 <CONSOLE_STATUS+0x440>
    800057a0:	00001097          	auipc	ra,0x1
    800057a4:	bd8080e7          	jalr	-1064(ra) # 80006378 <_Z11printStringPKc>
    800057a8:	00000613          	li	a2,0
    800057ac:	00a00593          	li	a1,10
    800057b0:	0009051b          	sext.w	a0,s2
    800057b4:	00001097          	auipc	ra,0x1
    800057b8:	d74080e7          	jalr	-652(ra) # 80006528 <_Z8printIntiii>
    800057bc:	00005517          	auipc	a0,0x5
    800057c0:	ea450513          	addi	a0,a0,-348 # 8000a660 <CONSOLE_STATUS+0x650>
    800057c4:	00001097          	auipc	ra,0x1
    800057c8:	bb4080e7          	jalr	-1100(ra) # 80006378 <_Z11printStringPKc>
    800057cc:	0400006f          	j	8000580c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800057d0:	00005517          	auipc	a0,0x5
    800057d4:	c6050513          	addi	a0,a0,-928 # 8000a430 <CONSOLE_STATUS+0x420>
    800057d8:	00001097          	auipc	ra,0x1
    800057dc:	ba0080e7          	jalr	-1120(ra) # 80006378 <_Z11printStringPKc>
    800057e0:	00000613          	li	a2,0
    800057e4:	00a00593          	li	a1,10
    800057e8:	00048513          	mv	a0,s1
    800057ec:	00001097          	auipc	ra,0x1
    800057f0:	d3c080e7          	jalr	-708(ra) # 80006528 <_Z8printIntiii>
    800057f4:	00005517          	auipc	a0,0x5
    800057f8:	e6c50513          	addi	a0,a0,-404 # 8000a660 <CONSOLE_STATUS+0x650>
    800057fc:	00001097          	auipc	ra,0x1
    80005800:	b7c080e7          	jalr	-1156(ra) # 80006378 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005804:	0014849b          	addiw	s1,s1,1
    80005808:	0ff4f493          	andi	s1,s1,255
    8000580c:	00500793          	li	a5,5
    80005810:	fc97f0e3          	bgeu	a5,s1,800057d0 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005814:	00005517          	auipc	a0,0x5
    80005818:	c4c50513          	addi	a0,a0,-948 # 8000a460 <CONSOLE_STATUS+0x450>
    8000581c:	00001097          	auipc	ra,0x1
    80005820:	b5c080e7          	jalr	-1188(ra) # 80006378 <_Z11printStringPKc>
    finishedC = true;
    80005824:	00100793          	li	a5,1
    80005828:	00008717          	auipc	a4,0x8
    8000582c:	a2f70ca3          	sb	a5,-1479(a4) # 8000d261 <_ZL9finishedC>
    thread_dispatch();
    80005830:	ffffc097          	auipc	ra,0xffffc
    80005834:	c90080e7          	jalr	-880(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80005838:	01813083          	ld	ra,24(sp)
    8000583c:	01013403          	ld	s0,16(sp)
    80005840:	00813483          	ld	s1,8(sp)
    80005844:	00013903          	ld	s2,0(sp)
    80005848:	02010113          	addi	sp,sp,32
    8000584c:	00008067          	ret

0000000080005850 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005850:	fe010113          	addi	sp,sp,-32
    80005854:	00113c23          	sd	ra,24(sp)
    80005858:	00813823          	sd	s0,16(sp)
    8000585c:	00913423          	sd	s1,8(sp)
    80005860:	01213023          	sd	s2,0(sp)
    80005864:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005868:	00000913          	li	s2,0
    8000586c:	0380006f          	j	800058a4 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80005870:	ffffc097          	auipc	ra,0xffffc
    80005874:	c50080e7          	jalr	-944(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005878:	00148493          	addi	s1,s1,1
    8000587c:	000027b7          	lui	a5,0x2
    80005880:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005884:	0097ee63          	bltu	a5,s1,800058a0 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005888:	00000713          	li	a4,0
    8000588c:	000077b7          	lui	a5,0x7
    80005890:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005894:	fce7eee3          	bltu	a5,a4,80005870 <_ZL11workerBodyBPv+0x20>
    80005898:	00170713          	addi	a4,a4,1
    8000589c:	ff1ff06f          	j	8000588c <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800058a0:	00190913          	addi	s2,s2,1
    800058a4:	00f00793          	li	a5,15
    800058a8:	0527e063          	bltu	a5,s2,800058e8 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800058ac:	00005517          	auipc	a0,0x5
    800058b0:	b6c50513          	addi	a0,a0,-1172 # 8000a418 <CONSOLE_STATUS+0x408>
    800058b4:	00001097          	auipc	ra,0x1
    800058b8:	ac4080e7          	jalr	-1340(ra) # 80006378 <_Z11printStringPKc>
    800058bc:	00000613          	li	a2,0
    800058c0:	00a00593          	li	a1,10
    800058c4:	0009051b          	sext.w	a0,s2
    800058c8:	00001097          	auipc	ra,0x1
    800058cc:	c60080e7          	jalr	-928(ra) # 80006528 <_Z8printIntiii>
    800058d0:	00005517          	auipc	a0,0x5
    800058d4:	d9050513          	addi	a0,a0,-624 # 8000a660 <CONSOLE_STATUS+0x650>
    800058d8:	00001097          	auipc	ra,0x1
    800058dc:	aa0080e7          	jalr	-1376(ra) # 80006378 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800058e0:	00000493          	li	s1,0
    800058e4:	f99ff06f          	j	8000587c <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    800058e8:	00005517          	auipc	a0,0x5
    800058ec:	b3850513          	addi	a0,a0,-1224 # 8000a420 <CONSOLE_STATUS+0x410>
    800058f0:	00001097          	auipc	ra,0x1
    800058f4:	a88080e7          	jalr	-1400(ra) # 80006378 <_Z11printStringPKc>
    finishedB = true;
    800058f8:	00100793          	li	a5,1
    800058fc:	00008717          	auipc	a4,0x8
    80005900:	96f70323          	sb	a5,-1690(a4) # 8000d262 <_ZL9finishedB>
    thread_dispatch();
    80005904:	ffffc097          	auipc	ra,0xffffc
    80005908:	bbc080e7          	jalr	-1092(ra) # 800014c0 <_Z15thread_dispatchv>
}
    8000590c:	01813083          	ld	ra,24(sp)
    80005910:	01013403          	ld	s0,16(sp)
    80005914:	00813483          	ld	s1,8(sp)
    80005918:	00013903          	ld	s2,0(sp)
    8000591c:	02010113          	addi	sp,sp,32
    80005920:	00008067          	ret

0000000080005924 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005924:	fe010113          	addi	sp,sp,-32
    80005928:	00113c23          	sd	ra,24(sp)
    8000592c:	00813823          	sd	s0,16(sp)
    80005930:	00913423          	sd	s1,8(sp)
    80005934:	01213023          	sd	s2,0(sp)
    80005938:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000593c:	00000913          	li	s2,0
    80005940:	0380006f          	j	80005978 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005944:	ffffc097          	auipc	ra,0xffffc
    80005948:	b7c080e7          	jalr	-1156(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000594c:	00148493          	addi	s1,s1,1
    80005950:	000027b7          	lui	a5,0x2
    80005954:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005958:	0097ee63          	bltu	a5,s1,80005974 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000595c:	00000713          	li	a4,0
    80005960:	000077b7          	lui	a5,0x7
    80005964:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005968:	fce7eee3          	bltu	a5,a4,80005944 <_ZL11workerBodyAPv+0x20>
    8000596c:	00170713          	addi	a4,a4,1
    80005970:	ff1ff06f          	j	80005960 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005974:	00190913          	addi	s2,s2,1
    80005978:	00900793          	li	a5,9
    8000597c:	0527e063          	bltu	a5,s2,800059bc <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005980:	00005517          	auipc	a0,0x5
    80005984:	a8050513          	addi	a0,a0,-1408 # 8000a400 <CONSOLE_STATUS+0x3f0>
    80005988:	00001097          	auipc	ra,0x1
    8000598c:	9f0080e7          	jalr	-1552(ra) # 80006378 <_Z11printStringPKc>
    80005990:	00000613          	li	a2,0
    80005994:	00a00593          	li	a1,10
    80005998:	0009051b          	sext.w	a0,s2
    8000599c:	00001097          	auipc	ra,0x1
    800059a0:	b8c080e7          	jalr	-1140(ra) # 80006528 <_Z8printIntiii>
    800059a4:	00005517          	auipc	a0,0x5
    800059a8:	cbc50513          	addi	a0,a0,-836 # 8000a660 <CONSOLE_STATUS+0x650>
    800059ac:	00001097          	auipc	ra,0x1
    800059b0:	9cc080e7          	jalr	-1588(ra) # 80006378 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800059b4:	00000493          	li	s1,0
    800059b8:	f99ff06f          	j	80005950 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800059bc:	00005517          	auipc	a0,0x5
    800059c0:	a4c50513          	addi	a0,a0,-1460 # 8000a408 <CONSOLE_STATUS+0x3f8>
    800059c4:	00001097          	auipc	ra,0x1
    800059c8:	9b4080e7          	jalr	-1612(ra) # 80006378 <_Z11printStringPKc>
    finishedA = true;
    800059cc:	00100793          	li	a5,1
    800059d0:	00008717          	auipc	a4,0x8
    800059d4:	88f709a3          	sb	a5,-1901(a4) # 8000d263 <_ZL9finishedA>
}
    800059d8:	01813083          	ld	ra,24(sp)
    800059dc:	01013403          	ld	s0,16(sp)
    800059e0:	00813483          	ld	s1,8(sp)
    800059e4:	00013903          	ld	s2,0(sp)
    800059e8:	02010113          	addi	sp,sp,32
    800059ec:	00008067          	ret

00000000800059f0 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800059f0:	fd010113          	addi	sp,sp,-48
    800059f4:	02113423          	sd	ra,40(sp)
    800059f8:	02813023          	sd	s0,32(sp)
    800059fc:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005a00:	00000613          	li	a2,0
    80005a04:	00000597          	auipc	a1,0x0
    80005a08:	f2058593          	addi	a1,a1,-224 # 80005924 <_ZL11workerBodyAPv>
    80005a0c:	fd040513          	addi	a0,s0,-48
    80005a10:	ffffc097          	auipc	ra,0xffffc
    80005a14:	9f4080e7          	jalr	-1548(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005a18:	00005517          	auipc	a0,0x5
    80005a1c:	a9050513          	addi	a0,a0,-1392 # 8000a4a8 <CONSOLE_STATUS+0x498>
    80005a20:	00001097          	auipc	ra,0x1
    80005a24:	958080e7          	jalr	-1704(ra) # 80006378 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005a28:	00000613          	li	a2,0
    80005a2c:	00000597          	auipc	a1,0x0
    80005a30:	e2458593          	addi	a1,a1,-476 # 80005850 <_ZL11workerBodyBPv>
    80005a34:	fd840513          	addi	a0,s0,-40
    80005a38:	ffffc097          	auipc	ra,0xffffc
    80005a3c:	9cc080e7          	jalr	-1588(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005a40:	00005517          	auipc	a0,0x5
    80005a44:	a8050513          	addi	a0,a0,-1408 # 8000a4c0 <CONSOLE_STATUS+0x4b0>
    80005a48:	00001097          	auipc	ra,0x1
    80005a4c:	930080e7          	jalr	-1744(ra) # 80006378 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005a50:	00000613          	li	a2,0
    80005a54:	00000597          	auipc	a1,0x0
    80005a58:	c7c58593          	addi	a1,a1,-900 # 800056d0 <_ZL11workerBodyCPv>
    80005a5c:	fe040513          	addi	a0,s0,-32
    80005a60:	ffffc097          	auipc	ra,0xffffc
    80005a64:	9a4080e7          	jalr	-1628(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005a68:	00005517          	auipc	a0,0x5
    80005a6c:	a7050513          	addi	a0,a0,-1424 # 8000a4d8 <CONSOLE_STATUS+0x4c8>
    80005a70:	00001097          	auipc	ra,0x1
    80005a74:	908080e7          	jalr	-1784(ra) # 80006378 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005a78:	00000613          	li	a2,0
    80005a7c:	00000597          	auipc	a1,0x0
    80005a80:	b0c58593          	addi	a1,a1,-1268 # 80005588 <_ZL11workerBodyDPv>
    80005a84:	fe840513          	addi	a0,s0,-24
    80005a88:	ffffc097          	auipc	ra,0xffffc
    80005a8c:	97c080e7          	jalr	-1668(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005a90:	00005517          	auipc	a0,0x5
    80005a94:	a6050513          	addi	a0,a0,-1440 # 8000a4f0 <CONSOLE_STATUS+0x4e0>
    80005a98:	00001097          	auipc	ra,0x1
    80005a9c:	8e0080e7          	jalr	-1824(ra) # 80006378 <_Z11printStringPKc>
    80005aa0:	00c0006f          	j	80005aac <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005aa4:	ffffc097          	auipc	ra,0xffffc
    80005aa8:	a1c080e7          	jalr	-1508(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005aac:	00007797          	auipc	a5,0x7
    80005ab0:	7b77c783          	lbu	a5,1975(a5) # 8000d263 <_ZL9finishedA>
    80005ab4:	fe0788e3          	beqz	a5,80005aa4 <_Z18Threads_C_API_testv+0xb4>
    80005ab8:	00007797          	auipc	a5,0x7
    80005abc:	7aa7c783          	lbu	a5,1962(a5) # 8000d262 <_ZL9finishedB>
    80005ac0:	fe0782e3          	beqz	a5,80005aa4 <_Z18Threads_C_API_testv+0xb4>
    80005ac4:	00007797          	auipc	a5,0x7
    80005ac8:	79d7c783          	lbu	a5,1949(a5) # 8000d261 <_ZL9finishedC>
    80005acc:	fc078ce3          	beqz	a5,80005aa4 <_Z18Threads_C_API_testv+0xb4>
    80005ad0:	00007797          	auipc	a5,0x7
    80005ad4:	7907c783          	lbu	a5,1936(a5) # 8000d260 <_ZL9finishedD>
    80005ad8:	fc0786e3          	beqz	a5,80005aa4 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80005adc:	02813083          	ld	ra,40(sp)
    80005ae0:	02013403          	ld	s0,32(sp)
    80005ae4:	03010113          	addi	sp,sp,48
    80005ae8:	00008067          	ret

0000000080005aec <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80005aec:	fd010113          	addi	sp,sp,-48
    80005af0:	02113423          	sd	ra,40(sp)
    80005af4:	02813023          	sd	s0,32(sp)
    80005af8:	00913c23          	sd	s1,24(sp)
    80005afc:	01213823          	sd	s2,16(sp)
    80005b00:	01313423          	sd	s3,8(sp)
    80005b04:	03010413          	addi	s0,sp,48
    80005b08:	00050993          	mv	s3,a0
    80005b0c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005b10:	00000913          	li	s2,0
    80005b14:	00c0006f          	j	80005b20 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005b18:	ffffe097          	auipc	ra,0xffffe
    80005b1c:	824080e7          	jalr	-2012(ra) # 8000333c <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005b20:	ffffc097          	auipc	ra,0xffffc
    80005b24:	ae0080e7          	jalr	-1312(ra) # 80001600 <_Z4getcv>
    80005b28:	0005059b          	sext.w	a1,a0
    80005b2c:	01b00793          	li	a5,27
    80005b30:	02f58a63          	beq	a1,a5,80005b64 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005b34:	0084b503          	ld	a0,8(s1)
    80005b38:	00001097          	auipc	ra,0x1
    80005b3c:	c64080e7          	jalr	-924(ra) # 8000679c <_ZN9BufferCPP3putEi>
        i++;
    80005b40:	0019071b          	addiw	a4,s2,1
    80005b44:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005b48:	0004a683          	lw	a3,0(s1)
    80005b4c:	0026979b          	slliw	a5,a3,0x2
    80005b50:	00d787bb          	addw	a5,a5,a3
    80005b54:	0017979b          	slliw	a5,a5,0x1
    80005b58:	02f767bb          	remw	a5,a4,a5
    80005b5c:	fc0792e3          	bnez	a5,80005b20 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80005b60:	fb9ff06f          	j	80005b18 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005b64:	00100793          	li	a5,1
    80005b68:	00007717          	auipc	a4,0x7
    80005b6c:	70f72023          	sw	a5,1792(a4) # 8000d268 <_ZL9threadEnd>
    td->buffer->put('!');
    80005b70:	0209b783          	ld	a5,32(s3)
    80005b74:	02100593          	li	a1,33
    80005b78:	0087b503          	ld	a0,8(a5)
    80005b7c:	00001097          	auipc	ra,0x1
    80005b80:	c20080e7          	jalr	-992(ra) # 8000679c <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005b84:	0104b503          	ld	a0,16(s1)
    80005b88:	ffffe097          	auipc	ra,0xffffe
    80005b8c:	950080e7          	jalr	-1712(ra) # 800034d8 <_ZN9Semaphore6signalEv>
}
    80005b90:	02813083          	ld	ra,40(sp)
    80005b94:	02013403          	ld	s0,32(sp)
    80005b98:	01813483          	ld	s1,24(sp)
    80005b9c:	01013903          	ld	s2,16(sp)
    80005ba0:	00813983          	ld	s3,8(sp)
    80005ba4:	03010113          	addi	sp,sp,48
    80005ba8:	00008067          	ret

0000000080005bac <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80005bac:	fe010113          	addi	sp,sp,-32
    80005bb0:	00113c23          	sd	ra,24(sp)
    80005bb4:	00813823          	sd	s0,16(sp)
    80005bb8:	00913423          	sd	s1,8(sp)
    80005bbc:	01213023          	sd	s2,0(sp)
    80005bc0:	02010413          	addi	s0,sp,32
    80005bc4:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005bc8:	00000913          	li	s2,0
    80005bcc:	00c0006f          	j	80005bd8 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005bd0:	ffffd097          	auipc	ra,0xffffd
    80005bd4:	76c080e7          	jalr	1900(ra) # 8000333c <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005bd8:	00007797          	auipc	a5,0x7
    80005bdc:	6907a783          	lw	a5,1680(a5) # 8000d268 <_ZL9threadEnd>
    80005be0:	02079e63          	bnez	a5,80005c1c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005be4:	0004a583          	lw	a1,0(s1)
    80005be8:	0305859b          	addiw	a1,a1,48
    80005bec:	0084b503          	ld	a0,8(s1)
    80005bf0:	00001097          	auipc	ra,0x1
    80005bf4:	bac080e7          	jalr	-1108(ra) # 8000679c <_ZN9BufferCPP3putEi>
        i++;
    80005bf8:	0019071b          	addiw	a4,s2,1
    80005bfc:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005c00:	0004a683          	lw	a3,0(s1)
    80005c04:	0026979b          	slliw	a5,a3,0x2
    80005c08:	00d787bb          	addw	a5,a5,a3
    80005c0c:	0017979b          	slliw	a5,a5,0x1
    80005c10:	02f767bb          	remw	a5,a4,a5
    80005c14:	fc0792e3          	bnez	a5,80005bd8 <_ZN12ProducerSync8producerEPv+0x2c>
    80005c18:	fb9ff06f          	j	80005bd0 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005c1c:	0104b503          	ld	a0,16(s1)
    80005c20:	ffffe097          	auipc	ra,0xffffe
    80005c24:	8b8080e7          	jalr	-1864(ra) # 800034d8 <_ZN9Semaphore6signalEv>
}
    80005c28:	01813083          	ld	ra,24(sp)
    80005c2c:	01013403          	ld	s0,16(sp)
    80005c30:	00813483          	ld	s1,8(sp)
    80005c34:	00013903          	ld	s2,0(sp)
    80005c38:	02010113          	addi	sp,sp,32
    80005c3c:	00008067          	ret

0000000080005c40 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005c40:	fd010113          	addi	sp,sp,-48
    80005c44:	02113423          	sd	ra,40(sp)
    80005c48:	02813023          	sd	s0,32(sp)
    80005c4c:	00913c23          	sd	s1,24(sp)
    80005c50:	01213823          	sd	s2,16(sp)
    80005c54:	01313423          	sd	s3,8(sp)
    80005c58:	01413023          	sd	s4,0(sp)
    80005c5c:	03010413          	addi	s0,sp,48
    80005c60:	00050993          	mv	s3,a0
    80005c64:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005c68:	00000a13          	li	s4,0
    80005c6c:	01c0006f          	j	80005c88 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005c70:	ffffd097          	auipc	ra,0xffffd
    80005c74:	6cc080e7          	jalr	1740(ra) # 8000333c <_ZN6Thread8dispatchEv>
    80005c78:	0500006f          	j	80005cc8 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005c7c:	00a00513          	li	a0,10
    80005c80:	ffffc097          	auipc	ra,0xffffc
    80005c84:	9a8080e7          	jalr	-1624(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    80005c88:	00007797          	auipc	a5,0x7
    80005c8c:	5e07a783          	lw	a5,1504(a5) # 8000d268 <_ZL9threadEnd>
    80005c90:	06079263          	bnez	a5,80005cf4 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005c94:	00893503          	ld	a0,8(s2)
    80005c98:	00001097          	auipc	ra,0x1
    80005c9c:	b94080e7          	jalr	-1132(ra) # 8000682c <_ZN9BufferCPP3getEv>
        i++;
    80005ca0:	001a049b          	addiw	s1,s4,1
    80005ca4:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005ca8:	0ff57513          	andi	a0,a0,255
    80005cac:	ffffc097          	auipc	ra,0xffffc
    80005cb0:	97c080e7          	jalr	-1668(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005cb4:	00092703          	lw	a4,0(s2)
    80005cb8:	0027179b          	slliw	a5,a4,0x2
    80005cbc:	00e787bb          	addw	a5,a5,a4
    80005cc0:	02f4e7bb          	remw	a5,s1,a5
    80005cc4:	fa0786e3          	beqz	a5,80005c70 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005cc8:	05000793          	li	a5,80
    80005ccc:	02f4e4bb          	remw	s1,s1,a5
    80005cd0:	fa049ce3          	bnez	s1,80005c88 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005cd4:	fa9ff06f          	j	80005c7c <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005cd8:	0209b783          	ld	a5,32(s3)
    80005cdc:	0087b503          	ld	a0,8(a5)
    80005ce0:	00001097          	auipc	ra,0x1
    80005ce4:	b4c080e7          	jalr	-1204(ra) # 8000682c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005ce8:	0ff57513          	andi	a0,a0,255
    80005cec:	ffffe097          	auipc	ra,0xffffe
    80005cf0:	8b0080e7          	jalr	-1872(ra) # 8000359c <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005cf4:	0209b783          	ld	a5,32(s3)
    80005cf8:	0087b503          	ld	a0,8(a5)
    80005cfc:	00001097          	auipc	ra,0x1
    80005d00:	bbc080e7          	jalr	-1092(ra) # 800068b8 <_ZN9BufferCPP6getCntEv>
    80005d04:	fca04ae3          	bgtz	a0,80005cd8 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005d08:	01093503          	ld	a0,16(s2)
    80005d0c:	ffffd097          	auipc	ra,0xffffd
    80005d10:	7cc080e7          	jalr	1996(ra) # 800034d8 <_ZN9Semaphore6signalEv>
}
    80005d14:	02813083          	ld	ra,40(sp)
    80005d18:	02013403          	ld	s0,32(sp)
    80005d1c:	01813483          	ld	s1,24(sp)
    80005d20:	01013903          	ld	s2,16(sp)
    80005d24:	00813983          	ld	s3,8(sp)
    80005d28:	00013a03          	ld	s4,0(sp)
    80005d2c:	03010113          	addi	sp,sp,48
    80005d30:	00008067          	ret

0000000080005d34 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005d34:	f8010113          	addi	sp,sp,-128
    80005d38:	06113c23          	sd	ra,120(sp)
    80005d3c:	06813823          	sd	s0,112(sp)
    80005d40:	06913423          	sd	s1,104(sp)
    80005d44:	07213023          	sd	s2,96(sp)
    80005d48:	05313c23          	sd	s3,88(sp)
    80005d4c:	05413823          	sd	s4,80(sp)
    80005d50:	05513423          	sd	s5,72(sp)
    80005d54:	05613023          	sd	s6,64(sp)
    80005d58:	03713c23          	sd	s7,56(sp)
    80005d5c:	03813823          	sd	s8,48(sp)
    80005d60:	03913423          	sd	s9,40(sp)
    80005d64:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005d68:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005d6c:	00004517          	auipc	a0,0x4
    80005d70:	5ac50513          	addi	a0,a0,1452 # 8000a318 <CONSOLE_STATUS+0x308>
    80005d74:	00000097          	auipc	ra,0x0
    80005d78:	604080e7          	jalr	1540(ra) # 80006378 <_Z11printStringPKc>
    getString(input, 30);
    80005d7c:	01e00593          	li	a1,30
    80005d80:	f8040493          	addi	s1,s0,-128
    80005d84:	00048513          	mv	a0,s1
    80005d88:	00000097          	auipc	ra,0x0
    80005d8c:	678080e7          	jalr	1656(ra) # 80006400 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005d90:	00048513          	mv	a0,s1
    80005d94:	00000097          	auipc	ra,0x0
    80005d98:	744080e7          	jalr	1860(ra) # 800064d8 <_Z11stringToIntPKc>
    80005d9c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005da0:	00004517          	auipc	a0,0x4
    80005da4:	59850513          	addi	a0,a0,1432 # 8000a338 <CONSOLE_STATUS+0x328>
    80005da8:	00000097          	auipc	ra,0x0
    80005dac:	5d0080e7          	jalr	1488(ra) # 80006378 <_Z11printStringPKc>
    getString(input, 30);
    80005db0:	01e00593          	li	a1,30
    80005db4:	00048513          	mv	a0,s1
    80005db8:	00000097          	auipc	ra,0x0
    80005dbc:	648080e7          	jalr	1608(ra) # 80006400 <_Z9getStringPci>
    n = stringToInt(input);
    80005dc0:	00048513          	mv	a0,s1
    80005dc4:	00000097          	auipc	ra,0x0
    80005dc8:	714080e7          	jalr	1812(ra) # 800064d8 <_Z11stringToIntPKc>
    80005dcc:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005dd0:	00004517          	auipc	a0,0x4
    80005dd4:	58850513          	addi	a0,a0,1416 # 8000a358 <CONSOLE_STATUS+0x348>
    80005dd8:	00000097          	auipc	ra,0x0
    80005ddc:	5a0080e7          	jalr	1440(ra) # 80006378 <_Z11printStringPKc>
    80005de0:	00000613          	li	a2,0
    80005de4:	00a00593          	li	a1,10
    80005de8:	00090513          	mv	a0,s2
    80005dec:	00000097          	auipc	ra,0x0
    80005df0:	73c080e7          	jalr	1852(ra) # 80006528 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005df4:	00004517          	auipc	a0,0x4
    80005df8:	57c50513          	addi	a0,a0,1404 # 8000a370 <CONSOLE_STATUS+0x360>
    80005dfc:	00000097          	auipc	ra,0x0
    80005e00:	57c080e7          	jalr	1404(ra) # 80006378 <_Z11printStringPKc>
    80005e04:	00000613          	li	a2,0
    80005e08:	00a00593          	li	a1,10
    80005e0c:	00048513          	mv	a0,s1
    80005e10:	00000097          	auipc	ra,0x0
    80005e14:	718080e7          	jalr	1816(ra) # 80006528 <_Z8printIntiii>
    printString(".\n");
    80005e18:	00004517          	auipc	a0,0x4
    80005e1c:	57050513          	addi	a0,a0,1392 # 8000a388 <CONSOLE_STATUS+0x378>
    80005e20:	00000097          	auipc	ra,0x0
    80005e24:	558080e7          	jalr	1368(ra) # 80006378 <_Z11printStringPKc>
    if(threadNum > n) {
    80005e28:	0324c463          	blt	s1,s2,80005e50 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005e2c:	03205c63          	blez	s2,80005e64 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005e30:	03800513          	li	a0,56
    80005e34:	ffffd097          	auipc	ra,0xffffd
    80005e38:	2dc080e7          	jalr	732(ra) # 80003110 <_Znwm>
    80005e3c:	00050a93          	mv	s5,a0
    80005e40:	00048593          	mv	a1,s1
    80005e44:	00001097          	auipc	ra,0x1
    80005e48:	804080e7          	jalr	-2044(ra) # 80006648 <_ZN9BufferCPPC1Ei>
    80005e4c:	0300006f          	j	80005e7c <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005e50:	00004517          	auipc	a0,0x4
    80005e54:	54050513          	addi	a0,a0,1344 # 8000a390 <CONSOLE_STATUS+0x380>
    80005e58:	00000097          	auipc	ra,0x0
    80005e5c:	520080e7          	jalr	1312(ra) # 80006378 <_Z11printStringPKc>
        return;
    80005e60:	0140006f          	j	80005e74 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005e64:	00004517          	auipc	a0,0x4
    80005e68:	56c50513          	addi	a0,a0,1388 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80005e6c:	00000097          	auipc	ra,0x0
    80005e70:	50c080e7          	jalr	1292(ra) # 80006378 <_Z11printStringPKc>
        return;
    80005e74:	000b8113          	mv	sp,s7
    80005e78:	2380006f          	j	800060b0 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005e7c:	01000513          	li	a0,16
    80005e80:	ffffd097          	auipc	ra,0xffffd
    80005e84:	290080e7          	jalr	656(ra) # 80003110 <_Znwm>
    80005e88:	00050493          	mv	s1,a0
    80005e8c:	00000593          	li	a1,0
    80005e90:	ffffd097          	auipc	ra,0xffffd
    80005e94:	5e4080e7          	jalr	1508(ra) # 80003474 <_ZN9SemaphoreC1Ej>
    80005e98:	00007797          	auipc	a5,0x7
    80005e9c:	3c97bc23          	sd	s1,984(a5) # 8000d270 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005ea0:	00391793          	slli	a5,s2,0x3
    80005ea4:	00f78793          	addi	a5,a5,15
    80005ea8:	ff07f793          	andi	a5,a5,-16
    80005eac:	40f10133          	sub	sp,sp,a5
    80005eb0:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005eb4:	0019071b          	addiw	a4,s2,1
    80005eb8:	00171793          	slli	a5,a4,0x1
    80005ebc:	00e787b3          	add	a5,a5,a4
    80005ec0:	00379793          	slli	a5,a5,0x3
    80005ec4:	00f78793          	addi	a5,a5,15
    80005ec8:	ff07f793          	andi	a5,a5,-16
    80005ecc:	40f10133          	sub	sp,sp,a5
    80005ed0:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005ed4:	00191c13          	slli	s8,s2,0x1
    80005ed8:	012c07b3          	add	a5,s8,s2
    80005edc:	00379793          	slli	a5,a5,0x3
    80005ee0:	00fa07b3          	add	a5,s4,a5
    80005ee4:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005ee8:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005eec:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005ef0:	02800513          	li	a0,40
    80005ef4:	ffffd097          	auipc	ra,0xffffd
    80005ef8:	21c080e7          	jalr	540(ra) # 80003110 <_Znwm>
    80005efc:	00050b13          	mv	s6,a0
    80005f00:	012c0c33          	add	s8,s8,s2
    80005f04:	003c1c13          	slli	s8,s8,0x3
    80005f08:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005f0c:	ffffd097          	auipc	ra,0xffffd
    80005f10:	4ec080e7          	jalr	1260(ra) # 800033f8 <_ZN6ThreadC1Ev>
    80005f14:	00007797          	auipc	a5,0x7
    80005f18:	0d478793          	addi	a5,a5,212 # 8000cfe8 <_ZTV12ConsumerSync+0x10>
    80005f1c:	00fb3023          	sd	a5,0(s6)
    80005f20:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005f24:	000b0513          	mv	a0,s6
    80005f28:	ffffd097          	auipc	ra,0xffffd
    80005f2c:	3a0080e7          	jalr	928(ra) # 800032c8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005f30:	00000493          	li	s1,0
    80005f34:	0380006f          	j	80005f6c <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005f38:	00007797          	auipc	a5,0x7
    80005f3c:	08878793          	addi	a5,a5,136 # 8000cfc0 <_ZTV12ProducerSync+0x10>
    80005f40:	00fcb023          	sd	a5,0(s9)
    80005f44:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005f48:	00349793          	slli	a5,s1,0x3
    80005f4c:	00f987b3          	add	a5,s3,a5
    80005f50:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005f54:	00349793          	slli	a5,s1,0x3
    80005f58:	00f987b3          	add	a5,s3,a5
    80005f5c:	0007b503          	ld	a0,0(a5)
    80005f60:	ffffd097          	auipc	ra,0xffffd
    80005f64:	368080e7          	jalr	872(ra) # 800032c8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005f68:	0014849b          	addiw	s1,s1,1
    80005f6c:	0b24d063          	bge	s1,s2,8000600c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005f70:	00149793          	slli	a5,s1,0x1
    80005f74:	009787b3          	add	a5,a5,s1
    80005f78:	00379793          	slli	a5,a5,0x3
    80005f7c:	00fa07b3          	add	a5,s4,a5
    80005f80:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005f84:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005f88:	00007717          	auipc	a4,0x7
    80005f8c:	2e873703          	ld	a4,744(a4) # 8000d270 <_ZL10waitForAll>
    80005f90:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005f94:	02905863          	blez	s1,80005fc4 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005f98:	02800513          	li	a0,40
    80005f9c:	ffffd097          	auipc	ra,0xffffd
    80005fa0:	174080e7          	jalr	372(ra) # 80003110 <_Znwm>
    80005fa4:	00050c93          	mv	s9,a0
    80005fa8:	00149c13          	slli	s8,s1,0x1
    80005fac:	009c0c33          	add	s8,s8,s1
    80005fb0:	003c1c13          	slli	s8,s8,0x3
    80005fb4:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005fb8:	ffffd097          	auipc	ra,0xffffd
    80005fbc:	440080e7          	jalr	1088(ra) # 800033f8 <_ZN6ThreadC1Ev>
    80005fc0:	f79ff06f          	j	80005f38 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005fc4:	02800513          	li	a0,40
    80005fc8:	ffffd097          	auipc	ra,0xffffd
    80005fcc:	148080e7          	jalr	328(ra) # 80003110 <_Znwm>
    80005fd0:	00050c93          	mv	s9,a0
    80005fd4:	00149c13          	slli	s8,s1,0x1
    80005fd8:	009c0c33          	add	s8,s8,s1
    80005fdc:	003c1c13          	slli	s8,s8,0x3
    80005fe0:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005fe4:	ffffd097          	auipc	ra,0xffffd
    80005fe8:	414080e7          	jalr	1044(ra) # 800033f8 <_ZN6ThreadC1Ev>
    80005fec:	00007797          	auipc	a5,0x7
    80005ff0:	fac78793          	addi	a5,a5,-84 # 8000cf98 <_ZTV16ProducerKeyboard+0x10>
    80005ff4:	00fcb023          	sd	a5,0(s9)
    80005ff8:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005ffc:	00349793          	slli	a5,s1,0x3
    80006000:	00f987b3          	add	a5,s3,a5
    80006004:	0197b023          	sd	s9,0(a5)
    80006008:	f4dff06f          	j	80005f54 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    8000600c:	ffffd097          	auipc	ra,0xffffd
    80006010:	330080e7          	jalr	816(ra) # 8000333c <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80006014:	00000493          	li	s1,0
    80006018:	00994e63          	blt	s2,s1,80006034 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    8000601c:	00007517          	auipc	a0,0x7
    80006020:	25453503          	ld	a0,596(a0) # 8000d270 <_ZL10waitForAll>
    80006024:	ffffd097          	auipc	ra,0xffffd
    80006028:	488080e7          	jalr	1160(ra) # 800034ac <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000602c:	0014849b          	addiw	s1,s1,1
    80006030:	fe9ff06f          	j	80006018 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80006034:	00000493          	li	s1,0
    80006038:	0080006f          	j	80006040 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    8000603c:	0014849b          	addiw	s1,s1,1
    80006040:	0324d263          	bge	s1,s2,80006064 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80006044:	00349793          	slli	a5,s1,0x3
    80006048:	00f987b3          	add	a5,s3,a5
    8000604c:	0007b503          	ld	a0,0(a5)
    80006050:	fe0506e3          	beqz	a0,8000603c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80006054:	00053783          	ld	a5,0(a0)
    80006058:	0087b783          	ld	a5,8(a5)
    8000605c:	000780e7          	jalr	a5
    80006060:	fddff06f          	j	8000603c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80006064:	000b0a63          	beqz	s6,80006078 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80006068:	000b3783          	ld	a5,0(s6)
    8000606c:	0087b783          	ld	a5,8(a5)
    80006070:	000b0513          	mv	a0,s6
    80006074:	000780e7          	jalr	a5
    delete waitForAll;
    80006078:	00007517          	auipc	a0,0x7
    8000607c:	1f853503          	ld	a0,504(a0) # 8000d270 <_ZL10waitForAll>
    80006080:	00050863          	beqz	a0,80006090 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80006084:	00053783          	ld	a5,0(a0)
    80006088:	0087b783          	ld	a5,8(a5)
    8000608c:	000780e7          	jalr	a5
    delete buffer;
    80006090:	000a8e63          	beqz	s5,800060ac <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80006094:	000a8513          	mv	a0,s5
    80006098:	00001097          	auipc	ra,0x1
    8000609c:	8a8080e7          	jalr	-1880(ra) # 80006940 <_ZN9BufferCPPD1Ev>
    800060a0:	000a8513          	mv	a0,s5
    800060a4:	ffffd097          	auipc	ra,0xffffd
    800060a8:	0bc080e7          	jalr	188(ra) # 80003160 <_ZdlPv>
    800060ac:	000b8113          	mv	sp,s7

}
    800060b0:	f8040113          	addi	sp,s0,-128
    800060b4:	07813083          	ld	ra,120(sp)
    800060b8:	07013403          	ld	s0,112(sp)
    800060bc:	06813483          	ld	s1,104(sp)
    800060c0:	06013903          	ld	s2,96(sp)
    800060c4:	05813983          	ld	s3,88(sp)
    800060c8:	05013a03          	ld	s4,80(sp)
    800060cc:	04813a83          	ld	s5,72(sp)
    800060d0:	04013b03          	ld	s6,64(sp)
    800060d4:	03813b83          	ld	s7,56(sp)
    800060d8:	03013c03          	ld	s8,48(sp)
    800060dc:	02813c83          	ld	s9,40(sp)
    800060e0:	08010113          	addi	sp,sp,128
    800060e4:	00008067          	ret
    800060e8:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800060ec:	000a8513          	mv	a0,s5
    800060f0:	ffffd097          	auipc	ra,0xffffd
    800060f4:	070080e7          	jalr	112(ra) # 80003160 <_ZdlPv>
    800060f8:	00048513          	mv	a0,s1
    800060fc:	00008097          	auipc	ra,0x8
    80006100:	26c080e7          	jalr	620(ra) # 8000e368 <_Unwind_Resume>
    80006104:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80006108:	00048513          	mv	a0,s1
    8000610c:	ffffd097          	auipc	ra,0xffffd
    80006110:	054080e7          	jalr	84(ra) # 80003160 <_ZdlPv>
    80006114:	00090513          	mv	a0,s2
    80006118:	00008097          	auipc	ra,0x8
    8000611c:	250080e7          	jalr	592(ra) # 8000e368 <_Unwind_Resume>
    80006120:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80006124:	000b0513          	mv	a0,s6
    80006128:	ffffd097          	auipc	ra,0xffffd
    8000612c:	038080e7          	jalr	56(ra) # 80003160 <_ZdlPv>
    80006130:	00048513          	mv	a0,s1
    80006134:	00008097          	auipc	ra,0x8
    80006138:	234080e7          	jalr	564(ra) # 8000e368 <_Unwind_Resume>
    8000613c:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80006140:	000c8513          	mv	a0,s9
    80006144:	ffffd097          	auipc	ra,0xffffd
    80006148:	01c080e7          	jalr	28(ra) # 80003160 <_ZdlPv>
    8000614c:	00048513          	mv	a0,s1
    80006150:	00008097          	auipc	ra,0x8
    80006154:	218080e7          	jalr	536(ra) # 8000e368 <_Unwind_Resume>
    80006158:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    8000615c:	000c8513          	mv	a0,s9
    80006160:	ffffd097          	auipc	ra,0xffffd
    80006164:	000080e7          	jalr	ra # 80003160 <_ZdlPv>
    80006168:	00048513          	mv	a0,s1
    8000616c:	00008097          	auipc	ra,0x8
    80006170:	1fc080e7          	jalr	508(ra) # 8000e368 <_Unwind_Resume>

0000000080006174 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80006174:	ff010113          	addi	sp,sp,-16
    80006178:	00113423          	sd	ra,8(sp)
    8000617c:	00813023          	sd	s0,0(sp)
    80006180:	01010413          	addi	s0,sp,16
    80006184:	00007797          	auipc	a5,0x7
    80006188:	e6478793          	addi	a5,a5,-412 # 8000cfe8 <_ZTV12ConsumerSync+0x10>
    8000618c:	00f53023          	sd	a5,0(a0)
    80006190:	ffffd097          	auipc	ra,0xffffd
    80006194:	ea0080e7          	jalr	-352(ra) # 80003030 <_ZN6ThreadD1Ev>
    80006198:	00813083          	ld	ra,8(sp)
    8000619c:	00013403          	ld	s0,0(sp)
    800061a0:	01010113          	addi	sp,sp,16
    800061a4:	00008067          	ret

00000000800061a8 <_ZN12ConsumerSyncD0Ev>:
    800061a8:	fe010113          	addi	sp,sp,-32
    800061ac:	00113c23          	sd	ra,24(sp)
    800061b0:	00813823          	sd	s0,16(sp)
    800061b4:	00913423          	sd	s1,8(sp)
    800061b8:	02010413          	addi	s0,sp,32
    800061bc:	00050493          	mv	s1,a0
    800061c0:	00007797          	auipc	a5,0x7
    800061c4:	e2878793          	addi	a5,a5,-472 # 8000cfe8 <_ZTV12ConsumerSync+0x10>
    800061c8:	00f53023          	sd	a5,0(a0)
    800061cc:	ffffd097          	auipc	ra,0xffffd
    800061d0:	e64080e7          	jalr	-412(ra) # 80003030 <_ZN6ThreadD1Ev>
    800061d4:	00048513          	mv	a0,s1
    800061d8:	ffffd097          	auipc	ra,0xffffd
    800061dc:	f88080e7          	jalr	-120(ra) # 80003160 <_ZdlPv>
    800061e0:	01813083          	ld	ra,24(sp)
    800061e4:	01013403          	ld	s0,16(sp)
    800061e8:	00813483          	ld	s1,8(sp)
    800061ec:	02010113          	addi	sp,sp,32
    800061f0:	00008067          	ret

00000000800061f4 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    800061f4:	ff010113          	addi	sp,sp,-16
    800061f8:	00113423          	sd	ra,8(sp)
    800061fc:	00813023          	sd	s0,0(sp)
    80006200:	01010413          	addi	s0,sp,16
    80006204:	00007797          	auipc	a5,0x7
    80006208:	dbc78793          	addi	a5,a5,-580 # 8000cfc0 <_ZTV12ProducerSync+0x10>
    8000620c:	00f53023          	sd	a5,0(a0)
    80006210:	ffffd097          	auipc	ra,0xffffd
    80006214:	e20080e7          	jalr	-480(ra) # 80003030 <_ZN6ThreadD1Ev>
    80006218:	00813083          	ld	ra,8(sp)
    8000621c:	00013403          	ld	s0,0(sp)
    80006220:	01010113          	addi	sp,sp,16
    80006224:	00008067          	ret

0000000080006228 <_ZN12ProducerSyncD0Ev>:
    80006228:	fe010113          	addi	sp,sp,-32
    8000622c:	00113c23          	sd	ra,24(sp)
    80006230:	00813823          	sd	s0,16(sp)
    80006234:	00913423          	sd	s1,8(sp)
    80006238:	02010413          	addi	s0,sp,32
    8000623c:	00050493          	mv	s1,a0
    80006240:	00007797          	auipc	a5,0x7
    80006244:	d8078793          	addi	a5,a5,-640 # 8000cfc0 <_ZTV12ProducerSync+0x10>
    80006248:	00f53023          	sd	a5,0(a0)
    8000624c:	ffffd097          	auipc	ra,0xffffd
    80006250:	de4080e7          	jalr	-540(ra) # 80003030 <_ZN6ThreadD1Ev>
    80006254:	00048513          	mv	a0,s1
    80006258:	ffffd097          	auipc	ra,0xffffd
    8000625c:	f08080e7          	jalr	-248(ra) # 80003160 <_ZdlPv>
    80006260:	01813083          	ld	ra,24(sp)
    80006264:	01013403          	ld	s0,16(sp)
    80006268:	00813483          	ld	s1,8(sp)
    8000626c:	02010113          	addi	sp,sp,32
    80006270:	00008067          	ret

0000000080006274 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80006274:	ff010113          	addi	sp,sp,-16
    80006278:	00113423          	sd	ra,8(sp)
    8000627c:	00813023          	sd	s0,0(sp)
    80006280:	01010413          	addi	s0,sp,16
    80006284:	00007797          	auipc	a5,0x7
    80006288:	d1478793          	addi	a5,a5,-748 # 8000cf98 <_ZTV16ProducerKeyboard+0x10>
    8000628c:	00f53023          	sd	a5,0(a0)
    80006290:	ffffd097          	auipc	ra,0xffffd
    80006294:	da0080e7          	jalr	-608(ra) # 80003030 <_ZN6ThreadD1Ev>
    80006298:	00813083          	ld	ra,8(sp)
    8000629c:	00013403          	ld	s0,0(sp)
    800062a0:	01010113          	addi	sp,sp,16
    800062a4:	00008067          	ret

00000000800062a8 <_ZN16ProducerKeyboardD0Ev>:
    800062a8:	fe010113          	addi	sp,sp,-32
    800062ac:	00113c23          	sd	ra,24(sp)
    800062b0:	00813823          	sd	s0,16(sp)
    800062b4:	00913423          	sd	s1,8(sp)
    800062b8:	02010413          	addi	s0,sp,32
    800062bc:	00050493          	mv	s1,a0
    800062c0:	00007797          	auipc	a5,0x7
    800062c4:	cd878793          	addi	a5,a5,-808 # 8000cf98 <_ZTV16ProducerKeyboard+0x10>
    800062c8:	00f53023          	sd	a5,0(a0)
    800062cc:	ffffd097          	auipc	ra,0xffffd
    800062d0:	d64080e7          	jalr	-668(ra) # 80003030 <_ZN6ThreadD1Ev>
    800062d4:	00048513          	mv	a0,s1
    800062d8:	ffffd097          	auipc	ra,0xffffd
    800062dc:	e88080e7          	jalr	-376(ra) # 80003160 <_ZdlPv>
    800062e0:	01813083          	ld	ra,24(sp)
    800062e4:	01013403          	ld	s0,16(sp)
    800062e8:	00813483          	ld	s1,8(sp)
    800062ec:	02010113          	addi	sp,sp,32
    800062f0:	00008067          	ret

00000000800062f4 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    800062f4:	ff010113          	addi	sp,sp,-16
    800062f8:	00113423          	sd	ra,8(sp)
    800062fc:	00813023          	sd	s0,0(sp)
    80006300:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80006304:	02053583          	ld	a1,32(a0)
    80006308:	fffff097          	auipc	ra,0xfffff
    8000630c:	7e4080e7          	jalr	2020(ra) # 80005aec <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80006310:	00813083          	ld	ra,8(sp)
    80006314:	00013403          	ld	s0,0(sp)
    80006318:	01010113          	addi	sp,sp,16
    8000631c:	00008067          	ret

0000000080006320 <_ZN12ProducerSync3runEv>:
    void run() override {
    80006320:	ff010113          	addi	sp,sp,-16
    80006324:	00113423          	sd	ra,8(sp)
    80006328:	00813023          	sd	s0,0(sp)
    8000632c:	01010413          	addi	s0,sp,16
        producer(td);
    80006330:	02053583          	ld	a1,32(a0)
    80006334:	00000097          	auipc	ra,0x0
    80006338:	878080e7          	jalr	-1928(ra) # 80005bac <_ZN12ProducerSync8producerEPv>
    }
    8000633c:	00813083          	ld	ra,8(sp)
    80006340:	00013403          	ld	s0,0(sp)
    80006344:	01010113          	addi	sp,sp,16
    80006348:	00008067          	ret

000000008000634c <_ZN12ConsumerSync3runEv>:
    void run() override {
    8000634c:	ff010113          	addi	sp,sp,-16
    80006350:	00113423          	sd	ra,8(sp)
    80006354:	00813023          	sd	s0,0(sp)
    80006358:	01010413          	addi	s0,sp,16
        consumer(td);
    8000635c:	02053583          	ld	a1,32(a0)
    80006360:	00000097          	auipc	ra,0x0
    80006364:	8e0080e7          	jalr	-1824(ra) # 80005c40 <_ZN12ConsumerSync8consumerEPv>
    }
    80006368:	00813083          	ld	ra,8(sp)
    8000636c:	00013403          	ld	s0,0(sp)
    80006370:	01010113          	addi	sp,sp,16
    80006374:	00008067          	ret

0000000080006378 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80006378:	fe010113          	addi	sp,sp,-32
    8000637c:	00113c23          	sd	ra,24(sp)
    80006380:	00813823          	sd	s0,16(sp)
    80006384:	00913423          	sd	s1,8(sp)
    80006388:	02010413          	addi	s0,sp,32
    8000638c:	00050493          	mv	s1,a0
    LOCK();
    80006390:	00100613          	li	a2,1
    80006394:	00000593          	li	a1,0
    80006398:	00007517          	auipc	a0,0x7
    8000639c:	ee050513          	addi	a0,a0,-288 # 8000d278 <lockPrint>
    800063a0:	ffffb097          	auipc	ra,0xffffb
    800063a4:	d84080e7          	jalr	-636(ra) # 80001124 <copy_and_swap>
    800063a8:	00050863          	beqz	a0,800063b8 <_Z11printStringPKc+0x40>
    800063ac:	ffffb097          	auipc	ra,0xffffb
    800063b0:	114080e7          	jalr	276(ra) # 800014c0 <_Z15thread_dispatchv>
    800063b4:	fddff06f          	j	80006390 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800063b8:	0004c503          	lbu	a0,0(s1)
    800063bc:	00050a63          	beqz	a0,800063d0 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    800063c0:	ffffb097          	auipc	ra,0xffffb
    800063c4:	268080e7          	jalr	616(ra) # 80001628 <_Z4putcc>
        string++;
    800063c8:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800063cc:	fedff06f          	j	800063b8 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800063d0:	00000613          	li	a2,0
    800063d4:	00100593          	li	a1,1
    800063d8:	00007517          	auipc	a0,0x7
    800063dc:	ea050513          	addi	a0,a0,-352 # 8000d278 <lockPrint>
    800063e0:	ffffb097          	auipc	ra,0xffffb
    800063e4:	d44080e7          	jalr	-700(ra) # 80001124 <copy_and_swap>
    800063e8:	fe0514e3          	bnez	a0,800063d0 <_Z11printStringPKc+0x58>
}
    800063ec:	01813083          	ld	ra,24(sp)
    800063f0:	01013403          	ld	s0,16(sp)
    800063f4:	00813483          	ld	s1,8(sp)
    800063f8:	02010113          	addi	sp,sp,32
    800063fc:	00008067          	ret

0000000080006400 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80006400:	fd010113          	addi	sp,sp,-48
    80006404:	02113423          	sd	ra,40(sp)
    80006408:	02813023          	sd	s0,32(sp)
    8000640c:	00913c23          	sd	s1,24(sp)
    80006410:	01213823          	sd	s2,16(sp)
    80006414:	01313423          	sd	s3,8(sp)
    80006418:	01413023          	sd	s4,0(sp)
    8000641c:	03010413          	addi	s0,sp,48
    80006420:	00050993          	mv	s3,a0
    80006424:	00058a13          	mv	s4,a1
    LOCK();
    80006428:	00100613          	li	a2,1
    8000642c:	00000593          	li	a1,0
    80006430:	00007517          	auipc	a0,0x7
    80006434:	e4850513          	addi	a0,a0,-440 # 8000d278 <lockPrint>
    80006438:	ffffb097          	auipc	ra,0xffffb
    8000643c:	cec080e7          	jalr	-788(ra) # 80001124 <copy_and_swap>
    80006440:	00050863          	beqz	a0,80006450 <_Z9getStringPci+0x50>
    80006444:	ffffb097          	auipc	ra,0xffffb
    80006448:	07c080e7          	jalr	124(ra) # 800014c0 <_Z15thread_dispatchv>
    8000644c:	fddff06f          	j	80006428 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80006450:	00000913          	li	s2,0
    80006454:	00090493          	mv	s1,s2
    80006458:	0019091b          	addiw	s2,s2,1
    8000645c:	03495a63          	bge	s2,s4,80006490 <_Z9getStringPci+0x90>
        cc = getc();
    80006460:	ffffb097          	auipc	ra,0xffffb
    80006464:	1a0080e7          	jalr	416(ra) # 80001600 <_Z4getcv>
        if(cc < 1)
    80006468:	02050463          	beqz	a0,80006490 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    8000646c:	009984b3          	add	s1,s3,s1
    80006470:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80006474:	00a00793          	li	a5,10
    80006478:	00f50a63          	beq	a0,a5,8000648c <_Z9getStringPci+0x8c>
    8000647c:	00d00793          	li	a5,13
    80006480:	fcf51ae3          	bne	a0,a5,80006454 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80006484:	00090493          	mv	s1,s2
    80006488:	0080006f          	j	80006490 <_Z9getStringPci+0x90>
    8000648c:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80006490:	009984b3          	add	s1,s3,s1
    80006494:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80006498:	00000613          	li	a2,0
    8000649c:	00100593          	li	a1,1
    800064a0:	00007517          	auipc	a0,0x7
    800064a4:	dd850513          	addi	a0,a0,-552 # 8000d278 <lockPrint>
    800064a8:	ffffb097          	auipc	ra,0xffffb
    800064ac:	c7c080e7          	jalr	-900(ra) # 80001124 <copy_and_swap>
    800064b0:	fe0514e3          	bnez	a0,80006498 <_Z9getStringPci+0x98>
    return buf;
}
    800064b4:	00098513          	mv	a0,s3
    800064b8:	02813083          	ld	ra,40(sp)
    800064bc:	02013403          	ld	s0,32(sp)
    800064c0:	01813483          	ld	s1,24(sp)
    800064c4:	01013903          	ld	s2,16(sp)
    800064c8:	00813983          	ld	s3,8(sp)
    800064cc:	00013a03          	ld	s4,0(sp)
    800064d0:	03010113          	addi	sp,sp,48
    800064d4:	00008067          	ret

00000000800064d8 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800064d8:	ff010113          	addi	sp,sp,-16
    800064dc:	00813423          	sd	s0,8(sp)
    800064e0:	01010413          	addi	s0,sp,16
    800064e4:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800064e8:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800064ec:	0006c603          	lbu	a2,0(a3)
    800064f0:	fd06071b          	addiw	a4,a2,-48
    800064f4:	0ff77713          	andi	a4,a4,255
    800064f8:	00900793          	li	a5,9
    800064fc:	02e7e063          	bltu	a5,a4,8000651c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80006500:	0025179b          	slliw	a5,a0,0x2
    80006504:	00a787bb          	addw	a5,a5,a0
    80006508:	0017979b          	slliw	a5,a5,0x1
    8000650c:	00168693          	addi	a3,a3,1
    80006510:	00c787bb          	addw	a5,a5,a2
    80006514:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80006518:	fd5ff06f          	j	800064ec <_Z11stringToIntPKc+0x14>
    return n;
}
    8000651c:	00813403          	ld	s0,8(sp)
    80006520:	01010113          	addi	sp,sp,16
    80006524:	00008067          	ret

0000000080006528 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80006528:	fc010113          	addi	sp,sp,-64
    8000652c:	02113c23          	sd	ra,56(sp)
    80006530:	02813823          	sd	s0,48(sp)
    80006534:	02913423          	sd	s1,40(sp)
    80006538:	03213023          	sd	s2,32(sp)
    8000653c:	01313c23          	sd	s3,24(sp)
    80006540:	04010413          	addi	s0,sp,64
    80006544:	00050493          	mv	s1,a0
    80006548:	00058913          	mv	s2,a1
    8000654c:	00060993          	mv	s3,a2
    LOCK();
    80006550:	00100613          	li	a2,1
    80006554:	00000593          	li	a1,0
    80006558:	00007517          	auipc	a0,0x7
    8000655c:	d2050513          	addi	a0,a0,-736 # 8000d278 <lockPrint>
    80006560:	ffffb097          	auipc	ra,0xffffb
    80006564:	bc4080e7          	jalr	-1084(ra) # 80001124 <copy_and_swap>
    80006568:	00050863          	beqz	a0,80006578 <_Z8printIntiii+0x50>
    8000656c:	ffffb097          	auipc	ra,0xffffb
    80006570:	f54080e7          	jalr	-172(ra) # 800014c0 <_Z15thread_dispatchv>
    80006574:	fddff06f          	j	80006550 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80006578:	00098463          	beqz	s3,80006580 <_Z8printIntiii+0x58>
    8000657c:	0804c463          	bltz	s1,80006604 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80006580:	0004851b          	sext.w	a0,s1
    neg = 0;
    80006584:	00000593          	li	a1,0
    }

    i = 0;
    80006588:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    8000658c:	0009079b          	sext.w	a5,s2
    80006590:	0325773b          	remuw	a4,a0,s2
    80006594:	00048613          	mv	a2,s1
    80006598:	0014849b          	addiw	s1,s1,1
    8000659c:	02071693          	slli	a3,a4,0x20
    800065a0:	0206d693          	srli	a3,a3,0x20
    800065a4:	00007717          	auipc	a4,0x7
    800065a8:	a5c70713          	addi	a4,a4,-1444 # 8000d000 <digits>
    800065ac:	00d70733          	add	a4,a4,a3
    800065b0:	00074683          	lbu	a3,0(a4)
    800065b4:	fd040713          	addi	a4,s0,-48
    800065b8:	00c70733          	add	a4,a4,a2
    800065bc:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800065c0:	0005071b          	sext.w	a4,a0
    800065c4:	0325553b          	divuw	a0,a0,s2
    800065c8:	fcf772e3          	bgeu	a4,a5,8000658c <_Z8printIntiii+0x64>
    if(neg)
    800065cc:	00058c63          	beqz	a1,800065e4 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    800065d0:	fd040793          	addi	a5,s0,-48
    800065d4:	009784b3          	add	s1,a5,s1
    800065d8:	02d00793          	li	a5,45
    800065dc:	fef48823          	sb	a5,-16(s1)
    800065e0:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800065e4:	fff4849b          	addiw	s1,s1,-1
    800065e8:	0204c463          	bltz	s1,80006610 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    800065ec:	fd040793          	addi	a5,s0,-48
    800065f0:	009787b3          	add	a5,a5,s1
    800065f4:	ff07c503          	lbu	a0,-16(a5)
    800065f8:	ffffb097          	auipc	ra,0xffffb
    800065fc:	030080e7          	jalr	48(ra) # 80001628 <_Z4putcc>
    80006600:	fe5ff06f          	j	800065e4 <_Z8printIntiii+0xbc>
        x = -xx;
    80006604:	4090053b          	negw	a0,s1
        neg = 1;
    80006608:	00100593          	li	a1,1
        x = -xx;
    8000660c:	f7dff06f          	j	80006588 <_Z8printIntiii+0x60>

    UNLOCK();
    80006610:	00000613          	li	a2,0
    80006614:	00100593          	li	a1,1
    80006618:	00007517          	auipc	a0,0x7
    8000661c:	c6050513          	addi	a0,a0,-928 # 8000d278 <lockPrint>
    80006620:	ffffb097          	auipc	ra,0xffffb
    80006624:	b04080e7          	jalr	-1276(ra) # 80001124 <copy_and_swap>
    80006628:	fe0514e3          	bnez	a0,80006610 <_Z8printIntiii+0xe8>
    8000662c:	03813083          	ld	ra,56(sp)
    80006630:	03013403          	ld	s0,48(sp)
    80006634:	02813483          	ld	s1,40(sp)
    80006638:	02013903          	ld	s2,32(sp)
    8000663c:	01813983          	ld	s3,24(sp)
    80006640:	04010113          	addi	sp,sp,64
    80006644:	00008067          	ret

0000000080006648 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006648:	fd010113          	addi	sp,sp,-48
    8000664c:	02113423          	sd	ra,40(sp)
    80006650:	02813023          	sd	s0,32(sp)
    80006654:	00913c23          	sd	s1,24(sp)
    80006658:	01213823          	sd	s2,16(sp)
    8000665c:	01313423          	sd	s3,8(sp)
    80006660:	03010413          	addi	s0,sp,48
    80006664:	00050493          	mv	s1,a0
    80006668:	00058913          	mv	s2,a1
    8000666c:	0015879b          	addiw	a5,a1,1
    80006670:	0007851b          	sext.w	a0,a5
    80006674:	00f4a023          	sw	a5,0(s1)
    80006678:	0004a823          	sw	zero,16(s1)
    8000667c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006680:	00251513          	slli	a0,a0,0x2
    80006684:	ffffb097          	auipc	ra,0xffffb
    80006688:	d10080e7          	jalr	-752(ra) # 80001394 <_Z9mem_allocm>
    8000668c:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006690:	01000513          	li	a0,16
    80006694:	ffffd097          	auipc	ra,0xffffd
    80006698:	a7c080e7          	jalr	-1412(ra) # 80003110 <_Znwm>
    8000669c:	00050993          	mv	s3,a0
    800066a0:	00000593          	li	a1,0
    800066a4:	ffffd097          	auipc	ra,0xffffd
    800066a8:	dd0080e7          	jalr	-560(ra) # 80003474 <_ZN9SemaphoreC1Ej>
    800066ac:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800066b0:	01000513          	li	a0,16
    800066b4:	ffffd097          	auipc	ra,0xffffd
    800066b8:	a5c080e7          	jalr	-1444(ra) # 80003110 <_Znwm>
    800066bc:	00050993          	mv	s3,a0
    800066c0:	00090593          	mv	a1,s2
    800066c4:	ffffd097          	auipc	ra,0xffffd
    800066c8:	db0080e7          	jalr	-592(ra) # 80003474 <_ZN9SemaphoreC1Ej>
    800066cc:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800066d0:	01000513          	li	a0,16
    800066d4:	ffffd097          	auipc	ra,0xffffd
    800066d8:	a3c080e7          	jalr	-1476(ra) # 80003110 <_Znwm>
    800066dc:	00050913          	mv	s2,a0
    800066e0:	00100593          	li	a1,1
    800066e4:	ffffd097          	auipc	ra,0xffffd
    800066e8:	d90080e7          	jalr	-624(ra) # 80003474 <_ZN9SemaphoreC1Ej>
    800066ec:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800066f0:	01000513          	li	a0,16
    800066f4:	ffffd097          	auipc	ra,0xffffd
    800066f8:	a1c080e7          	jalr	-1508(ra) # 80003110 <_Znwm>
    800066fc:	00050913          	mv	s2,a0
    80006700:	00100593          	li	a1,1
    80006704:	ffffd097          	auipc	ra,0xffffd
    80006708:	d70080e7          	jalr	-656(ra) # 80003474 <_ZN9SemaphoreC1Ej>
    8000670c:	0324b823          	sd	s2,48(s1)
}
    80006710:	02813083          	ld	ra,40(sp)
    80006714:	02013403          	ld	s0,32(sp)
    80006718:	01813483          	ld	s1,24(sp)
    8000671c:	01013903          	ld	s2,16(sp)
    80006720:	00813983          	ld	s3,8(sp)
    80006724:	03010113          	addi	sp,sp,48
    80006728:	00008067          	ret
    8000672c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006730:	00098513          	mv	a0,s3
    80006734:	ffffd097          	auipc	ra,0xffffd
    80006738:	a2c080e7          	jalr	-1492(ra) # 80003160 <_ZdlPv>
    8000673c:	00048513          	mv	a0,s1
    80006740:	00008097          	auipc	ra,0x8
    80006744:	c28080e7          	jalr	-984(ra) # 8000e368 <_Unwind_Resume>
    80006748:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    8000674c:	00098513          	mv	a0,s3
    80006750:	ffffd097          	auipc	ra,0xffffd
    80006754:	a10080e7          	jalr	-1520(ra) # 80003160 <_ZdlPv>
    80006758:	00048513          	mv	a0,s1
    8000675c:	00008097          	auipc	ra,0x8
    80006760:	c0c080e7          	jalr	-1012(ra) # 8000e368 <_Unwind_Resume>
    80006764:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006768:	00090513          	mv	a0,s2
    8000676c:	ffffd097          	auipc	ra,0xffffd
    80006770:	9f4080e7          	jalr	-1548(ra) # 80003160 <_ZdlPv>
    80006774:	00048513          	mv	a0,s1
    80006778:	00008097          	auipc	ra,0x8
    8000677c:	bf0080e7          	jalr	-1040(ra) # 8000e368 <_Unwind_Resume>
    80006780:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006784:	00090513          	mv	a0,s2
    80006788:	ffffd097          	auipc	ra,0xffffd
    8000678c:	9d8080e7          	jalr	-1576(ra) # 80003160 <_ZdlPv>
    80006790:	00048513          	mv	a0,s1
    80006794:	00008097          	auipc	ra,0x8
    80006798:	bd4080e7          	jalr	-1068(ra) # 8000e368 <_Unwind_Resume>

000000008000679c <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    8000679c:	fe010113          	addi	sp,sp,-32
    800067a0:	00113c23          	sd	ra,24(sp)
    800067a4:	00813823          	sd	s0,16(sp)
    800067a8:	00913423          	sd	s1,8(sp)
    800067ac:	01213023          	sd	s2,0(sp)
    800067b0:	02010413          	addi	s0,sp,32
    800067b4:	00050493          	mv	s1,a0
    800067b8:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800067bc:	01853503          	ld	a0,24(a0)
    800067c0:	ffffd097          	auipc	ra,0xffffd
    800067c4:	cec080e7          	jalr	-788(ra) # 800034ac <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800067c8:	0304b503          	ld	a0,48(s1)
    800067cc:	ffffd097          	auipc	ra,0xffffd
    800067d0:	ce0080e7          	jalr	-800(ra) # 800034ac <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800067d4:	0084b783          	ld	a5,8(s1)
    800067d8:	0144a703          	lw	a4,20(s1)
    800067dc:	00271713          	slli	a4,a4,0x2
    800067e0:	00e787b3          	add	a5,a5,a4
    800067e4:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800067e8:	0144a783          	lw	a5,20(s1)
    800067ec:	0017879b          	addiw	a5,a5,1
    800067f0:	0004a703          	lw	a4,0(s1)
    800067f4:	02e7e7bb          	remw	a5,a5,a4
    800067f8:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    800067fc:	0304b503          	ld	a0,48(s1)
    80006800:	ffffd097          	auipc	ra,0xffffd
    80006804:	cd8080e7          	jalr	-808(ra) # 800034d8 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006808:	0204b503          	ld	a0,32(s1)
    8000680c:	ffffd097          	auipc	ra,0xffffd
    80006810:	ccc080e7          	jalr	-820(ra) # 800034d8 <_ZN9Semaphore6signalEv>

}
    80006814:	01813083          	ld	ra,24(sp)
    80006818:	01013403          	ld	s0,16(sp)
    8000681c:	00813483          	ld	s1,8(sp)
    80006820:	00013903          	ld	s2,0(sp)
    80006824:	02010113          	addi	sp,sp,32
    80006828:	00008067          	ret

000000008000682c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    8000682c:	fe010113          	addi	sp,sp,-32
    80006830:	00113c23          	sd	ra,24(sp)
    80006834:	00813823          	sd	s0,16(sp)
    80006838:	00913423          	sd	s1,8(sp)
    8000683c:	01213023          	sd	s2,0(sp)
    80006840:	02010413          	addi	s0,sp,32
    80006844:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006848:	02053503          	ld	a0,32(a0)
    8000684c:	ffffd097          	auipc	ra,0xffffd
    80006850:	c60080e7          	jalr	-928(ra) # 800034ac <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006854:	0284b503          	ld	a0,40(s1)
    80006858:	ffffd097          	auipc	ra,0xffffd
    8000685c:	c54080e7          	jalr	-940(ra) # 800034ac <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80006860:	0084b703          	ld	a4,8(s1)
    80006864:	0104a783          	lw	a5,16(s1)
    80006868:	00279693          	slli	a3,a5,0x2
    8000686c:	00d70733          	add	a4,a4,a3
    80006870:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006874:	0017879b          	addiw	a5,a5,1
    80006878:	0004a703          	lw	a4,0(s1)
    8000687c:	02e7e7bb          	remw	a5,a5,a4
    80006880:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006884:	0284b503          	ld	a0,40(s1)
    80006888:	ffffd097          	auipc	ra,0xffffd
    8000688c:	c50080e7          	jalr	-944(ra) # 800034d8 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006890:	0184b503          	ld	a0,24(s1)
    80006894:	ffffd097          	auipc	ra,0xffffd
    80006898:	c44080e7          	jalr	-956(ra) # 800034d8 <_ZN9Semaphore6signalEv>

    return ret;
}
    8000689c:	00090513          	mv	a0,s2
    800068a0:	01813083          	ld	ra,24(sp)
    800068a4:	01013403          	ld	s0,16(sp)
    800068a8:	00813483          	ld	s1,8(sp)
    800068ac:	00013903          	ld	s2,0(sp)
    800068b0:	02010113          	addi	sp,sp,32
    800068b4:	00008067          	ret

00000000800068b8 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800068b8:	fe010113          	addi	sp,sp,-32
    800068bc:	00113c23          	sd	ra,24(sp)
    800068c0:	00813823          	sd	s0,16(sp)
    800068c4:	00913423          	sd	s1,8(sp)
    800068c8:	01213023          	sd	s2,0(sp)
    800068cc:	02010413          	addi	s0,sp,32
    800068d0:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800068d4:	02853503          	ld	a0,40(a0)
    800068d8:	ffffd097          	auipc	ra,0xffffd
    800068dc:	bd4080e7          	jalr	-1068(ra) # 800034ac <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800068e0:	0304b503          	ld	a0,48(s1)
    800068e4:	ffffd097          	auipc	ra,0xffffd
    800068e8:	bc8080e7          	jalr	-1080(ra) # 800034ac <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800068ec:	0144a783          	lw	a5,20(s1)
    800068f0:	0104a903          	lw	s2,16(s1)
    800068f4:	0327ce63          	blt	a5,s2,80006930 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    800068f8:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    800068fc:	0304b503          	ld	a0,48(s1)
    80006900:	ffffd097          	auipc	ra,0xffffd
    80006904:	bd8080e7          	jalr	-1064(ra) # 800034d8 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006908:	0284b503          	ld	a0,40(s1)
    8000690c:	ffffd097          	auipc	ra,0xffffd
    80006910:	bcc080e7          	jalr	-1076(ra) # 800034d8 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006914:	00090513          	mv	a0,s2
    80006918:	01813083          	ld	ra,24(sp)
    8000691c:	01013403          	ld	s0,16(sp)
    80006920:	00813483          	ld	s1,8(sp)
    80006924:	00013903          	ld	s2,0(sp)
    80006928:	02010113          	addi	sp,sp,32
    8000692c:	00008067          	ret
        ret = cap - head + tail;
    80006930:	0004a703          	lw	a4,0(s1)
    80006934:	4127093b          	subw	s2,a4,s2
    80006938:	00f9093b          	addw	s2,s2,a5
    8000693c:	fc1ff06f          	j	800068fc <_ZN9BufferCPP6getCntEv+0x44>

0000000080006940 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006940:	fe010113          	addi	sp,sp,-32
    80006944:	00113c23          	sd	ra,24(sp)
    80006948:	00813823          	sd	s0,16(sp)
    8000694c:	00913423          	sd	s1,8(sp)
    80006950:	02010413          	addi	s0,sp,32
    80006954:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006958:	00a00513          	li	a0,10
    8000695c:	ffffd097          	auipc	ra,0xffffd
    80006960:	c40080e7          	jalr	-960(ra) # 8000359c <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006964:	00004517          	auipc	a0,0x4
    80006968:	ba450513          	addi	a0,a0,-1116 # 8000a508 <CONSOLE_STATUS+0x4f8>
    8000696c:	00000097          	auipc	ra,0x0
    80006970:	a0c080e7          	jalr	-1524(ra) # 80006378 <_Z11printStringPKc>
    while (getCnt()) {
    80006974:	00048513          	mv	a0,s1
    80006978:	00000097          	auipc	ra,0x0
    8000697c:	f40080e7          	jalr	-192(ra) # 800068b8 <_ZN9BufferCPP6getCntEv>
    80006980:	02050c63          	beqz	a0,800069b8 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006984:	0084b783          	ld	a5,8(s1)
    80006988:	0104a703          	lw	a4,16(s1)
    8000698c:	00271713          	slli	a4,a4,0x2
    80006990:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006994:	0007c503          	lbu	a0,0(a5)
    80006998:	ffffd097          	auipc	ra,0xffffd
    8000699c:	c04080e7          	jalr	-1020(ra) # 8000359c <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800069a0:	0104a783          	lw	a5,16(s1)
    800069a4:	0017879b          	addiw	a5,a5,1
    800069a8:	0004a703          	lw	a4,0(s1)
    800069ac:	02e7e7bb          	remw	a5,a5,a4
    800069b0:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800069b4:	fc1ff06f          	j	80006974 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800069b8:	02100513          	li	a0,33
    800069bc:	ffffd097          	auipc	ra,0xffffd
    800069c0:	be0080e7          	jalr	-1056(ra) # 8000359c <_ZN7Console4putcEc>
    Console::putc('\n');
    800069c4:	00a00513          	li	a0,10
    800069c8:	ffffd097          	auipc	ra,0xffffd
    800069cc:	bd4080e7          	jalr	-1068(ra) # 8000359c <_ZN7Console4putcEc>
    mem_free(buffer);
    800069d0:	0084b503          	ld	a0,8(s1)
    800069d4:	ffffb097          	auipc	ra,0xffffb
    800069d8:	a00080e7          	jalr	-1536(ra) # 800013d4 <_Z8mem_freePv>
    delete itemAvailable;
    800069dc:	0204b503          	ld	a0,32(s1)
    800069e0:	00050863          	beqz	a0,800069f0 <_ZN9BufferCPPD1Ev+0xb0>
    800069e4:	00053783          	ld	a5,0(a0)
    800069e8:	0087b783          	ld	a5,8(a5)
    800069ec:	000780e7          	jalr	a5
    delete spaceAvailable;
    800069f0:	0184b503          	ld	a0,24(s1)
    800069f4:	00050863          	beqz	a0,80006a04 <_ZN9BufferCPPD1Ev+0xc4>
    800069f8:	00053783          	ld	a5,0(a0)
    800069fc:	0087b783          	ld	a5,8(a5)
    80006a00:	000780e7          	jalr	a5
    delete mutexTail;
    80006a04:	0304b503          	ld	a0,48(s1)
    80006a08:	00050863          	beqz	a0,80006a18 <_ZN9BufferCPPD1Ev+0xd8>
    80006a0c:	00053783          	ld	a5,0(a0)
    80006a10:	0087b783          	ld	a5,8(a5)
    80006a14:	000780e7          	jalr	a5
    delete mutexHead;
    80006a18:	0284b503          	ld	a0,40(s1)
    80006a1c:	00050863          	beqz	a0,80006a2c <_ZN9BufferCPPD1Ev+0xec>
    80006a20:	00053783          	ld	a5,0(a0)
    80006a24:	0087b783          	ld	a5,8(a5)
    80006a28:	000780e7          	jalr	a5
}
    80006a2c:	01813083          	ld	ra,24(sp)
    80006a30:	01013403          	ld	s0,16(sp)
    80006a34:	00813483          	ld	s1,8(sp)
    80006a38:	02010113          	addi	sp,sp,32
    80006a3c:	00008067          	ret

0000000080006a40 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80006a40:	fe010113          	addi	sp,sp,-32
    80006a44:	00113c23          	sd	ra,24(sp)
    80006a48:	00813823          	sd	s0,16(sp)
    80006a4c:	00913423          	sd	s1,8(sp)
    80006a50:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80006a54:	00004517          	auipc	a0,0x4
    80006a58:	acc50513          	addi	a0,a0,-1332 # 8000a520 <CONSOLE_STATUS+0x510>
    80006a5c:	00000097          	auipc	ra,0x0
    80006a60:	91c080e7          	jalr	-1764(ra) # 80006378 <_Z11printStringPKc>
    int test = getc() - '0';
    80006a64:	ffffb097          	auipc	ra,0xffffb
    80006a68:	b9c080e7          	jalr	-1124(ra) # 80001600 <_Z4getcv>
    80006a6c:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80006a70:	ffffb097          	auipc	ra,0xffffb
    80006a74:	b90080e7          	jalr	-1136(ra) # 80001600 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006a78:	00700793          	li	a5,7
    80006a7c:	1097e263          	bltu	a5,s1,80006b80 <_Z8userMainv+0x140>
    80006a80:	00249493          	slli	s1,s1,0x2
    80006a84:	00004717          	auipc	a4,0x4
    80006a88:	cf470713          	addi	a4,a4,-780 # 8000a778 <CONSOLE_STATUS+0x768>
    80006a8c:	00e484b3          	add	s1,s1,a4
    80006a90:	0004a783          	lw	a5,0(s1)
    80006a94:	00e787b3          	add	a5,a5,a4
    80006a98:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80006a9c:	fffff097          	auipc	ra,0xfffff
    80006aa0:	f54080e7          	jalr	-172(ra) # 800059f0 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006aa4:	00004517          	auipc	a0,0x4
    80006aa8:	a9c50513          	addi	a0,a0,-1380 # 8000a540 <CONSOLE_STATUS+0x530>
    80006aac:	00000097          	auipc	ra,0x0
    80006ab0:	8cc080e7          	jalr	-1844(ra) # 80006378 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006ab4:	01813083          	ld	ra,24(sp)
    80006ab8:	01013403          	ld	s0,16(sp)
    80006abc:	00813483          	ld	s1,8(sp)
    80006ac0:	02010113          	addi	sp,sp,32
    80006ac4:	00008067          	ret
            Threads_CPP_API_test();
    80006ac8:	ffffe097          	auipc	ra,0xffffe
    80006acc:	e08080e7          	jalr	-504(ra) # 800048d0 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006ad0:	00004517          	auipc	a0,0x4
    80006ad4:	ab050513          	addi	a0,a0,-1360 # 8000a580 <CONSOLE_STATUS+0x570>
    80006ad8:	00000097          	auipc	ra,0x0
    80006adc:	8a0080e7          	jalr	-1888(ra) # 80006378 <_Z11printStringPKc>
            break;
    80006ae0:	fd5ff06f          	j	80006ab4 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006ae4:	ffffd097          	auipc	ra,0xffffd
    80006ae8:	640080e7          	jalr	1600(ra) # 80004124 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006aec:	00004517          	auipc	a0,0x4
    80006af0:	ad450513          	addi	a0,a0,-1324 # 8000a5c0 <CONSOLE_STATUS+0x5b0>
    80006af4:	00000097          	auipc	ra,0x0
    80006af8:	884080e7          	jalr	-1916(ra) # 80006378 <_Z11printStringPKc>
            break;
    80006afc:	fb9ff06f          	j	80006ab4 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006b00:	fffff097          	auipc	ra,0xfffff
    80006b04:	234080e7          	jalr	564(ra) # 80005d34 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006b08:	00004517          	auipc	a0,0x4
    80006b0c:	b0850513          	addi	a0,a0,-1272 # 8000a610 <CONSOLE_STATUS+0x600>
    80006b10:	00000097          	auipc	ra,0x0
    80006b14:	868080e7          	jalr	-1944(ra) # 80006378 <_Z11printStringPKc>
            break;
    80006b18:	f9dff06f          	j	80006ab4 <_Z8userMainv+0x74>
            testSleeping();
    80006b1c:	00000097          	auipc	ra,0x0
    80006b20:	11c080e7          	jalr	284(ra) # 80006c38 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006b24:	00004517          	auipc	a0,0x4
    80006b28:	b4450513          	addi	a0,a0,-1212 # 8000a668 <CONSOLE_STATUS+0x658>
    80006b2c:	00000097          	auipc	ra,0x0
    80006b30:	84c080e7          	jalr	-1972(ra) # 80006378 <_Z11printStringPKc>
            break;
    80006b34:	f81ff06f          	j	80006ab4 <_Z8userMainv+0x74>
            testConsumerProducer();
    80006b38:	ffffe097          	auipc	ra,0xffffe
    80006b3c:	258080e7          	jalr	600(ra) # 80004d90 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006b40:	00004517          	auipc	a0,0x4
    80006b44:	b5850513          	addi	a0,a0,-1192 # 8000a698 <CONSOLE_STATUS+0x688>
    80006b48:	00000097          	auipc	ra,0x0
    80006b4c:	830080e7          	jalr	-2000(ra) # 80006378 <_Z11printStringPKc>
            break;
    80006b50:	f65ff06f          	j	80006ab4 <_Z8userMainv+0x74>
            System_Mode_test();
    80006b54:	00000097          	auipc	ra,0x0
    80006b58:	658080e7          	jalr	1624(ra) # 800071ac <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006b5c:	00004517          	auipc	a0,0x4
    80006b60:	b7c50513          	addi	a0,a0,-1156 # 8000a6d8 <CONSOLE_STATUS+0x6c8>
    80006b64:	00000097          	auipc	ra,0x0
    80006b68:	814080e7          	jalr	-2028(ra) # 80006378 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006b6c:	00004517          	auipc	a0,0x4
    80006b70:	b8c50513          	addi	a0,a0,-1140 # 8000a6f8 <CONSOLE_STATUS+0x6e8>
    80006b74:	00000097          	auipc	ra,0x0
    80006b78:	804080e7          	jalr	-2044(ra) # 80006378 <_Z11printStringPKc>
            break;
    80006b7c:	f39ff06f          	j	80006ab4 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80006b80:	00004517          	auipc	a0,0x4
    80006b84:	bd050513          	addi	a0,a0,-1072 # 8000a750 <CONSOLE_STATUS+0x740>
    80006b88:	fffff097          	auipc	ra,0xfffff
    80006b8c:	7f0080e7          	jalr	2032(ra) # 80006378 <_Z11printStringPKc>
    80006b90:	f25ff06f          	j	80006ab4 <_Z8userMainv+0x74>

0000000080006b94 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006b94:	fe010113          	addi	sp,sp,-32
    80006b98:	00113c23          	sd	ra,24(sp)
    80006b9c:	00813823          	sd	s0,16(sp)
    80006ba0:	00913423          	sd	s1,8(sp)
    80006ba4:	01213023          	sd	s2,0(sp)
    80006ba8:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006bac:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006bb0:	00600493          	li	s1,6
    while (--i > 0) {
    80006bb4:	fff4849b          	addiw	s1,s1,-1
    80006bb8:	04905463          	blez	s1,80006c00 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006bbc:	00004517          	auipc	a0,0x4
    80006bc0:	bdc50513          	addi	a0,a0,-1060 # 8000a798 <CONSOLE_STATUS+0x788>
    80006bc4:	fffff097          	auipc	ra,0xfffff
    80006bc8:	7b4080e7          	jalr	1972(ra) # 80006378 <_Z11printStringPKc>
        printInt(sleep_time);
    80006bcc:	00000613          	li	a2,0
    80006bd0:	00a00593          	li	a1,10
    80006bd4:	0009051b          	sext.w	a0,s2
    80006bd8:	00000097          	auipc	ra,0x0
    80006bdc:	950080e7          	jalr	-1712(ra) # 80006528 <_Z8printIntiii>
        printString(" !\n");
    80006be0:	00004517          	auipc	a0,0x4
    80006be4:	bc050513          	addi	a0,a0,-1088 # 8000a7a0 <CONSOLE_STATUS+0x790>
    80006be8:	fffff097          	auipc	ra,0xfffff
    80006bec:	790080e7          	jalr	1936(ra) # 80006378 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006bf0:	00090513          	mv	a0,s2
    80006bf4:	ffffb097          	auipc	ra,0xffffb
    80006bf8:	914080e7          	jalr	-1772(ra) # 80001508 <_Z10time_sleepm>
    while (--i > 0) {
    80006bfc:	fb9ff06f          	j	80006bb4 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006c00:	00a00793          	li	a5,10
    80006c04:	02f95933          	divu	s2,s2,a5
    80006c08:	fff90913          	addi	s2,s2,-1
    80006c0c:	00006797          	auipc	a5,0x6
    80006c10:	67478793          	addi	a5,a5,1652 # 8000d280 <_ZL8finished>
    80006c14:	01278933          	add	s2,a5,s2
    80006c18:	00100793          	li	a5,1
    80006c1c:	00f90023          	sb	a5,0(s2)
}
    80006c20:	01813083          	ld	ra,24(sp)
    80006c24:	01013403          	ld	s0,16(sp)
    80006c28:	00813483          	ld	s1,8(sp)
    80006c2c:	00013903          	ld	s2,0(sp)
    80006c30:	02010113          	addi	sp,sp,32
    80006c34:	00008067          	ret

0000000080006c38 <_Z12testSleepingv>:

void testSleeping() {
    80006c38:	fc010113          	addi	sp,sp,-64
    80006c3c:	02113c23          	sd	ra,56(sp)
    80006c40:	02813823          	sd	s0,48(sp)
    80006c44:	02913423          	sd	s1,40(sp)
    80006c48:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006c4c:	00a00793          	li	a5,10
    80006c50:	fcf43823          	sd	a5,-48(s0)
    80006c54:	01400793          	li	a5,20
    80006c58:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006c5c:	00000493          	li	s1,0
    80006c60:	02c0006f          	j	80006c8c <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006c64:	00349793          	slli	a5,s1,0x3
    80006c68:	fd040613          	addi	a2,s0,-48
    80006c6c:	00f60633          	add	a2,a2,a5
    80006c70:	00000597          	auipc	a1,0x0
    80006c74:	f2458593          	addi	a1,a1,-220 # 80006b94 <_ZL9sleepyRunPv>
    80006c78:	fc040513          	addi	a0,s0,-64
    80006c7c:	00f50533          	add	a0,a0,a5
    80006c80:	ffffa097          	auipc	ra,0xffffa
    80006c84:	784080e7          	jalr	1924(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006c88:	0014849b          	addiw	s1,s1,1
    80006c8c:	00100793          	li	a5,1
    80006c90:	fc97dae3          	bge	a5,s1,80006c64 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006c94:	00006797          	auipc	a5,0x6
    80006c98:	5ec7c783          	lbu	a5,1516(a5) # 8000d280 <_ZL8finished>
    80006c9c:	fe078ce3          	beqz	a5,80006c94 <_Z12testSleepingv+0x5c>
    80006ca0:	00006797          	auipc	a5,0x6
    80006ca4:	5e17c783          	lbu	a5,1505(a5) # 8000d281 <_ZL8finished+0x1>
    80006ca8:	fe0786e3          	beqz	a5,80006c94 <_Z12testSleepingv+0x5c>
}
    80006cac:	03813083          	ld	ra,56(sp)
    80006cb0:	03013403          	ld	s0,48(sp)
    80006cb4:	02813483          	ld	s1,40(sp)
    80006cb8:	04010113          	addi	sp,sp,64
    80006cbc:	00008067          	ret

0000000080006cc0 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006cc0:	fe010113          	addi	sp,sp,-32
    80006cc4:	00113c23          	sd	ra,24(sp)
    80006cc8:	00813823          	sd	s0,16(sp)
    80006ccc:	00913423          	sd	s1,8(sp)
    80006cd0:	01213023          	sd	s2,0(sp)
    80006cd4:	02010413          	addi	s0,sp,32
    80006cd8:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006cdc:	00100793          	li	a5,1
    80006ce0:	02a7f863          	bgeu	a5,a0,80006d10 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006ce4:	00a00793          	li	a5,10
    80006ce8:	02f577b3          	remu	a5,a0,a5
    80006cec:	02078e63          	beqz	a5,80006d28 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006cf0:	fff48513          	addi	a0,s1,-1
    80006cf4:	00000097          	auipc	ra,0x0
    80006cf8:	fcc080e7          	jalr	-52(ra) # 80006cc0 <_ZL9fibonaccim>
    80006cfc:	00050913          	mv	s2,a0
    80006d00:	ffe48513          	addi	a0,s1,-2
    80006d04:	00000097          	auipc	ra,0x0
    80006d08:	fbc080e7          	jalr	-68(ra) # 80006cc0 <_ZL9fibonaccim>
    80006d0c:	00a90533          	add	a0,s2,a0
}
    80006d10:	01813083          	ld	ra,24(sp)
    80006d14:	01013403          	ld	s0,16(sp)
    80006d18:	00813483          	ld	s1,8(sp)
    80006d1c:	00013903          	ld	s2,0(sp)
    80006d20:	02010113          	addi	sp,sp,32
    80006d24:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006d28:	ffffa097          	auipc	ra,0xffffa
    80006d2c:	798080e7          	jalr	1944(ra) # 800014c0 <_Z15thread_dispatchv>
    80006d30:	fc1ff06f          	j	80006cf0 <_ZL9fibonaccim+0x30>

0000000080006d34 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006d34:	fe010113          	addi	sp,sp,-32
    80006d38:	00113c23          	sd	ra,24(sp)
    80006d3c:	00813823          	sd	s0,16(sp)
    80006d40:	00913423          	sd	s1,8(sp)
    80006d44:	01213023          	sd	s2,0(sp)
    80006d48:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006d4c:	00a00493          	li	s1,10
    80006d50:	0400006f          	j	80006d90 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006d54:	00003517          	auipc	a0,0x3
    80006d58:	71c50513          	addi	a0,a0,1820 # 8000a470 <CONSOLE_STATUS+0x460>
    80006d5c:	fffff097          	auipc	ra,0xfffff
    80006d60:	61c080e7          	jalr	1564(ra) # 80006378 <_Z11printStringPKc>
    80006d64:	00000613          	li	a2,0
    80006d68:	00a00593          	li	a1,10
    80006d6c:	00048513          	mv	a0,s1
    80006d70:	fffff097          	auipc	ra,0xfffff
    80006d74:	7b8080e7          	jalr	1976(ra) # 80006528 <_Z8printIntiii>
    80006d78:	00004517          	auipc	a0,0x4
    80006d7c:	8e850513          	addi	a0,a0,-1816 # 8000a660 <CONSOLE_STATUS+0x650>
    80006d80:	fffff097          	auipc	ra,0xfffff
    80006d84:	5f8080e7          	jalr	1528(ra) # 80006378 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006d88:	0014849b          	addiw	s1,s1,1
    80006d8c:	0ff4f493          	andi	s1,s1,255
    80006d90:	00c00793          	li	a5,12
    80006d94:	fc97f0e3          	bgeu	a5,s1,80006d54 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006d98:	00003517          	auipc	a0,0x3
    80006d9c:	6e050513          	addi	a0,a0,1760 # 8000a478 <CONSOLE_STATUS+0x468>
    80006da0:	fffff097          	auipc	ra,0xfffff
    80006da4:	5d8080e7          	jalr	1496(ra) # 80006378 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006da8:	00500313          	li	t1,5
    thread_dispatch();
    80006dac:	ffffa097          	auipc	ra,0xffffa
    80006db0:	714080e7          	jalr	1812(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006db4:	01000513          	li	a0,16
    80006db8:	00000097          	auipc	ra,0x0
    80006dbc:	f08080e7          	jalr	-248(ra) # 80006cc0 <_ZL9fibonaccim>
    80006dc0:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006dc4:	00003517          	auipc	a0,0x3
    80006dc8:	6c450513          	addi	a0,a0,1732 # 8000a488 <CONSOLE_STATUS+0x478>
    80006dcc:	fffff097          	auipc	ra,0xfffff
    80006dd0:	5ac080e7          	jalr	1452(ra) # 80006378 <_Z11printStringPKc>
    80006dd4:	00000613          	li	a2,0
    80006dd8:	00a00593          	li	a1,10
    80006ddc:	0009051b          	sext.w	a0,s2
    80006de0:	fffff097          	auipc	ra,0xfffff
    80006de4:	748080e7          	jalr	1864(ra) # 80006528 <_Z8printIntiii>
    80006de8:	00004517          	auipc	a0,0x4
    80006dec:	87850513          	addi	a0,a0,-1928 # 8000a660 <CONSOLE_STATUS+0x650>
    80006df0:	fffff097          	auipc	ra,0xfffff
    80006df4:	588080e7          	jalr	1416(ra) # 80006378 <_Z11printStringPKc>
    80006df8:	0400006f          	j	80006e38 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006dfc:	00003517          	auipc	a0,0x3
    80006e00:	67450513          	addi	a0,a0,1652 # 8000a470 <CONSOLE_STATUS+0x460>
    80006e04:	fffff097          	auipc	ra,0xfffff
    80006e08:	574080e7          	jalr	1396(ra) # 80006378 <_Z11printStringPKc>
    80006e0c:	00000613          	li	a2,0
    80006e10:	00a00593          	li	a1,10
    80006e14:	00048513          	mv	a0,s1
    80006e18:	fffff097          	auipc	ra,0xfffff
    80006e1c:	710080e7          	jalr	1808(ra) # 80006528 <_Z8printIntiii>
    80006e20:	00004517          	auipc	a0,0x4
    80006e24:	84050513          	addi	a0,a0,-1984 # 8000a660 <CONSOLE_STATUS+0x650>
    80006e28:	fffff097          	auipc	ra,0xfffff
    80006e2c:	550080e7          	jalr	1360(ra) # 80006378 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006e30:	0014849b          	addiw	s1,s1,1
    80006e34:	0ff4f493          	andi	s1,s1,255
    80006e38:	00f00793          	li	a5,15
    80006e3c:	fc97f0e3          	bgeu	a5,s1,80006dfc <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006e40:	00003517          	auipc	a0,0x3
    80006e44:	65850513          	addi	a0,a0,1624 # 8000a498 <CONSOLE_STATUS+0x488>
    80006e48:	fffff097          	auipc	ra,0xfffff
    80006e4c:	530080e7          	jalr	1328(ra) # 80006378 <_Z11printStringPKc>
    finishedD = true;
    80006e50:	00100793          	li	a5,1
    80006e54:	00006717          	auipc	a4,0x6
    80006e58:	42f70723          	sb	a5,1070(a4) # 8000d282 <_ZL9finishedD>
    thread_dispatch();
    80006e5c:	ffffa097          	auipc	ra,0xffffa
    80006e60:	664080e7          	jalr	1636(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80006e64:	01813083          	ld	ra,24(sp)
    80006e68:	01013403          	ld	s0,16(sp)
    80006e6c:	00813483          	ld	s1,8(sp)
    80006e70:	00013903          	ld	s2,0(sp)
    80006e74:	02010113          	addi	sp,sp,32
    80006e78:	00008067          	ret

0000000080006e7c <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006e7c:	fe010113          	addi	sp,sp,-32
    80006e80:	00113c23          	sd	ra,24(sp)
    80006e84:	00813823          	sd	s0,16(sp)
    80006e88:	00913423          	sd	s1,8(sp)
    80006e8c:	01213023          	sd	s2,0(sp)
    80006e90:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006e94:	00000493          	li	s1,0
    80006e98:	0400006f          	j	80006ed8 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006e9c:	00003517          	auipc	a0,0x3
    80006ea0:	59450513          	addi	a0,a0,1428 # 8000a430 <CONSOLE_STATUS+0x420>
    80006ea4:	fffff097          	auipc	ra,0xfffff
    80006ea8:	4d4080e7          	jalr	1236(ra) # 80006378 <_Z11printStringPKc>
    80006eac:	00000613          	li	a2,0
    80006eb0:	00a00593          	li	a1,10
    80006eb4:	00048513          	mv	a0,s1
    80006eb8:	fffff097          	auipc	ra,0xfffff
    80006ebc:	670080e7          	jalr	1648(ra) # 80006528 <_Z8printIntiii>
    80006ec0:	00003517          	auipc	a0,0x3
    80006ec4:	7a050513          	addi	a0,a0,1952 # 8000a660 <CONSOLE_STATUS+0x650>
    80006ec8:	fffff097          	auipc	ra,0xfffff
    80006ecc:	4b0080e7          	jalr	1200(ra) # 80006378 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006ed0:	0014849b          	addiw	s1,s1,1
    80006ed4:	0ff4f493          	andi	s1,s1,255
    80006ed8:	00200793          	li	a5,2
    80006edc:	fc97f0e3          	bgeu	a5,s1,80006e9c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006ee0:	00003517          	auipc	a0,0x3
    80006ee4:	55850513          	addi	a0,a0,1368 # 8000a438 <CONSOLE_STATUS+0x428>
    80006ee8:	fffff097          	auipc	ra,0xfffff
    80006eec:	490080e7          	jalr	1168(ra) # 80006378 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006ef0:	00700313          	li	t1,7
    thread_dispatch();
    80006ef4:	ffffa097          	auipc	ra,0xffffa
    80006ef8:	5cc080e7          	jalr	1484(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006efc:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006f00:	00003517          	auipc	a0,0x3
    80006f04:	54850513          	addi	a0,a0,1352 # 8000a448 <CONSOLE_STATUS+0x438>
    80006f08:	fffff097          	auipc	ra,0xfffff
    80006f0c:	470080e7          	jalr	1136(ra) # 80006378 <_Z11printStringPKc>
    80006f10:	00000613          	li	a2,0
    80006f14:	00a00593          	li	a1,10
    80006f18:	0009051b          	sext.w	a0,s2
    80006f1c:	fffff097          	auipc	ra,0xfffff
    80006f20:	60c080e7          	jalr	1548(ra) # 80006528 <_Z8printIntiii>
    80006f24:	00003517          	auipc	a0,0x3
    80006f28:	73c50513          	addi	a0,a0,1852 # 8000a660 <CONSOLE_STATUS+0x650>
    80006f2c:	fffff097          	auipc	ra,0xfffff
    80006f30:	44c080e7          	jalr	1100(ra) # 80006378 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006f34:	00c00513          	li	a0,12
    80006f38:	00000097          	auipc	ra,0x0
    80006f3c:	d88080e7          	jalr	-632(ra) # 80006cc0 <_ZL9fibonaccim>
    80006f40:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006f44:	00003517          	auipc	a0,0x3
    80006f48:	50c50513          	addi	a0,a0,1292 # 8000a450 <CONSOLE_STATUS+0x440>
    80006f4c:	fffff097          	auipc	ra,0xfffff
    80006f50:	42c080e7          	jalr	1068(ra) # 80006378 <_Z11printStringPKc>
    80006f54:	00000613          	li	a2,0
    80006f58:	00a00593          	li	a1,10
    80006f5c:	0009051b          	sext.w	a0,s2
    80006f60:	fffff097          	auipc	ra,0xfffff
    80006f64:	5c8080e7          	jalr	1480(ra) # 80006528 <_Z8printIntiii>
    80006f68:	00003517          	auipc	a0,0x3
    80006f6c:	6f850513          	addi	a0,a0,1784 # 8000a660 <CONSOLE_STATUS+0x650>
    80006f70:	fffff097          	auipc	ra,0xfffff
    80006f74:	408080e7          	jalr	1032(ra) # 80006378 <_Z11printStringPKc>
    80006f78:	0400006f          	j	80006fb8 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006f7c:	00003517          	auipc	a0,0x3
    80006f80:	4b450513          	addi	a0,a0,1204 # 8000a430 <CONSOLE_STATUS+0x420>
    80006f84:	fffff097          	auipc	ra,0xfffff
    80006f88:	3f4080e7          	jalr	1012(ra) # 80006378 <_Z11printStringPKc>
    80006f8c:	00000613          	li	a2,0
    80006f90:	00a00593          	li	a1,10
    80006f94:	00048513          	mv	a0,s1
    80006f98:	fffff097          	auipc	ra,0xfffff
    80006f9c:	590080e7          	jalr	1424(ra) # 80006528 <_Z8printIntiii>
    80006fa0:	00003517          	auipc	a0,0x3
    80006fa4:	6c050513          	addi	a0,a0,1728 # 8000a660 <CONSOLE_STATUS+0x650>
    80006fa8:	fffff097          	auipc	ra,0xfffff
    80006fac:	3d0080e7          	jalr	976(ra) # 80006378 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006fb0:	0014849b          	addiw	s1,s1,1
    80006fb4:	0ff4f493          	andi	s1,s1,255
    80006fb8:	00500793          	li	a5,5
    80006fbc:	fc97f0e3          	bgeu	a5,s1,80006f7c <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006fc0:	00003517          	auipc	a0,0x3
    80006fc4:	44850513          	addi	a0,a0,1096 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80006fc8:	fffff097          	auipc	ra,0xfffff
    80006fcc:	3b0080e7          	jalr	944(ra) # 80006378 <_Z11printStringPKc>
    finishedC = true;
    80006fd0:	00100793          	li	a5,1
    80006fd4:	00006717          	auipc	a4,0x6
    80006fd8:	2af707a3          	sb	a5,687(a4) # 8000d283 <_ZL9finishedC>
    thread_dispatch();
    80006fdc:	ffffa097          	auipc	ra,0xffffa
    80006fe0:	4e4080e7          	jalr	1252(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80006fe4:	01813083          	ld	ra,24(sp)
    80006fe8:	01013403          	ld	s0,16(sp)
    80006fec:	00813483          	ld	s1,8(sp)
    80006ff0:	00013903          	ld	s2,0(sp)
    80006ff4:	02010113          	addi	sp,sp,32
    80006ff8:	00008067          	ret

0000000080006ffc <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006ffc:	fe010113          	addi	sp,sp,-32
    80007000:	00113c23          	sd	ra,24(sp)
    80007004:	00813823          	sd	s0,16(sp)
    80007008:	00913423          	sd	s1,8(sp)
    8000700c:	01213023          	sd	s2,0(sp)
    80007010:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80007014:	00000913          	li	s2,0
    80007018:	0400006f          	j	80007058 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    8000701c:	ffffa097          	auipc	ra,0xffffa
    80007020:	4a4080e7          	jalr	1188(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80007024:	00148493          	addi	s1,s1,1
    80007028:	000027b7          	lui	a5,0x2
    8000702c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80007030:	0097ee63          	bltu	a5,s1,8000704c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80007034:	00000713          	li	a4,0
    80007038:	000077b7          	lui	a5,0x7
    8000703c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80007040:	fce7eee3          	bltu	a5,a4,8000701c <_ZL11workerBodyBPv+0x20>
    80007044:	00170713          	addi	a4,a4,1
    80007048:	ff1ff06f          	j	80007038 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    8000704c:	00a00793          	li	a5,10
    80007050:	04f90663          	beq	s2,a5,8000709c <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80007054:	00190913          	addi	s2,s2,1
    80007058:	00f00793          	li	a5,15
    8000705c:	0527e463          	bltu	a5,s2,800070a4 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80007060:	00003517          	auipc	a0,0x3
    80007064:	3b850513          	addi	a0,a0,952 # 8000a418 <CONSOLE_STATUS+0x408>
    80007068:	fffff097          	auipc	ra,0xfffff
    8000706c:	310080e7          	jalr	784(ra) # 80006378 <_Z11printStringPKc>
    80007070:	00000613          	li	a2,0
    80007074:	00a00593          	li	a1,10
    80007078:	0009051b          	sext.w	a0,s2
    8000707c:	fffff097          	auipc	ra,0xfffff
    80007080:	4ac080e7          	jalr	1196(ra) # 80006528 <_Z8printIntiii>
    80007084:	00003517          	auipc	a0,0x3
    80007088:	5dc50513          	addi	a0,a0,1500 # 8000a660 <CONSOLE_STATUS+0x650>
    8000708c:	fffff097          	auipc	ra,0xfffff
    80007090:	2ec080e7          	jalr	748(ra) # 80006378 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80007094:	00000493          	li	s1,0
    80007098:	f91ff06f          	j	80007028 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    8000709c:	14102ff3          	csrr	t6,sepc
    800070a0:	fb5ff06f          	j	80007054 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800070a4:	00003517          	auipc	a0,0x3
    800070a8:	37c50513          	addi	a0,a0,892 # 8000a420 <CONSOLE_STATUS+0x410>
    800070ac:	fffff097          	auipc	ra,0xfffff
    800070b0:	2cc080e7          	jalr	716(ra) # 80006378 <_Z11printStringPKc>
    finishedB = true;
    800070b4:	00100793          	li	a5,1
    800070b8:	00006717          	auipc	a4,0x6
    800070bc:	1cf70623          	sb	a5,460(a4) # 8000d284 <_ZL9finishedB>
    thread_dispatch();
    800070c0:	ffffa097          	auipc	ra,0xffffa
    800070c4:	400080e7          	jalr	1024(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800070c8:	01813083          	ld	ra,24(sp)
    800070cc:	01013403          	ld	s0,16(sp)
    800070d0:	00813483          	ld	s1,8(sp)
    800070d4:	00013903          	ld	s2,0(sp)
    800070d8:	02010113          	addi	sp,sp,32
    800070dc:	00008067          	ret

00000000800070e0 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800070e0:	fe010113          	addi	sp,sp,-32
    800070e4:	00113c23          	sd	ra,24(sp)
    800070e8:	00813823          	sd	s0,16(sp)
    800070ec:	00913423          	sd	s1,8(sp)
    800070f0:	01213023          	sd	s2,0(sp)
    800070f4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800070f8:	00000913          	li	s2,0
    800070fc:	0380006f          	j	80007134 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80007100:	ffffa097          	auipc	ra,0xffffa
    80007104:	3c0080e7          	jalr	960(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80007108:	00148493          	addi	s1,s1,1
    8000710c:	000027b7          	lui	a5,0x2
    80007110:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80007114:	0097ee63          	bltu	a5,s1,80007130 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80007118:	00000713          	li	a4,0
    8000711c:	000077b7          	lui	a5,0x7
    80007120:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80007124:	fce7eee3          	bltu	a5,a4,80007100 <_ZL11workerBodyAPv+0x20>
    80007128:	00170713          	addi	a4,a4,1
    8000712c:	ff1ff06f          	j	8000711c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80007130:	00190913          	addi	s2,s2,1
    80007134:	00900793          	li	a5,9
    80007138:	0527e063          	bltu	a5,s2,80007178 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000713c:	00003517          	auipc	a0,0x3
    80007140:	2c450513          	addi	a0,a0,708 # 8000a400 <CONSOLE_STATUS+0x3f0>
    80007144:	fffff097          	auipc	ra,0xfffff
    80007148:	234080e7          	jalr	564(ra) # 80006378 <_Z11printStringPKc>
    8000714c:	00000613          	li	a2,0
    80007150:	00a00593          	li	a1,10
    80007154:	0009051b          	sext.w	a0,s2
    80007158:	fffff097          	auipc	ra,0xfffff
    8000715c:	3d0080e7          	jalr	976(ra) # 80006528 <_Z8printIntiii>
    80007160:	00003517          	auipc	a0,0x3
    80007164:	50050513          	addi	a0,a0,1280 # 8000a660 <CONSOLE_STATUS+0x650>
    80007168:	fffff097          	auipc	ra,0xfffff
    8000716c:	210080e7          	jalr	528(ra) # 80006378 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80007170:	00000493          	li	s1,0
    80007174:	f99ff06f          	j	8000710c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80007178:	00003517          	auipc	a0,0x3
    8000717c:	29050513          	addi	a0,a0,656 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80007180:	fffff097          	auipc	ra,0xfffff
    80007184:	1f8080e7          	jalr	504(ra) # 80006378 <_Z11printStringPKc>
    finishedA = true;
    80007188:	00100793          	li	a5,1
    8000718c:	00006717          	auipc	a4,0x6
    80007190:	0ef70ca3          	sb	a5,249(a4) # 8000d285 <_ZL9finishedA>
}
    80007194:	01813083          	ld	ra,24(sp)
    80007198:	01013403          	ld	s0,16(sp)
    8000719c:	00813483          	ld	s1,8(sp)
    800071a0:	00013903          	ld	s2,0(sp)
    800071a4:	02010113          	addi	sp,sp,32
    800071a8:	00008067          	ret

00000000800071ac <_Z16System_Mode_testv>:


void System_Mode_test() {
    800071ac:	fd010113          	addi	sp,sp,-48
    800071b0:	02113423          	sd	ra,40(sp)
    800071b4:	02813023          	sd	s0,32(sp)
    800071b8:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800071bc:	00000613          	li	a2,0
    800071c0:	00000597          	auipc	a1,0x0
    800071c4:	f2058593          	addi	a1,a1,-224 # 800070e0 <_ZL11workerBodyAPv>
    800071c8:	fd040513          	addi	a0,s0,-48
    800071cc:	ffffa097          	auipc	ra,0xffffa
    800071d0:	238080e7          	jalr	568(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800071d4:	00003517          	auipc	a0,0x3
    800071d8:	2d450513          	addi	a0,a0,724 # 8000a4a8 <CONSOLE_STATUS+0x498>
    800071dc:	fffff097          	auipc	ra,0xfffff
    800071e0:	19c080e7          	jalr	412(ra) # 80006378 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800071e4:	00000613          	li	a2,0
    800071e8:	00000597          	auipc	a1,0x0
    800071ec:	e1458593          	addi	a1,a1,-492 # 80006ffc <_ZL11workerBodyBPv>
    800071f0:	fd840513          	addi	a0,s0,-40
    800071f4:	ffffa097          	auipc	ra,0xffffa
    800071f8:	210080e7          	jalr	528(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800071fc:	00003517          	auipc	a0,0x3
    80007200:	2c450513          	addi	a0,a0,708 # 8000a4c0 <CONSOLE_STATUS+0x4b0>
    80007204:	fffff097          	auipc	ra,0xfffff
    80007208:	174080e7          	jalr	372(ra) # 80006378 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000720c:	00000613          	li	a2,0
    80007210:	00000597          	auipc	a1,0x0
    80007214:	c6c58593          	addi	a1,a1,-916 # 80006e7c <_ZL11workerBodyCPv>
    80007218:	fe040513          	addi	a0,s0,-32
    8000721c:	ffffa097          	auipc	ra,0xffffa
    80007220:	1e8080e7          	jalr	488(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80007224:	00003517          	auipc	a0,0x3
    80007228:	2b450513          	addi	a0,a0,692 # 8000a4d8 <CONSOLE_STATUS+0x4c8>
    8000722c:	fffff097          	auipc	ra,0xfffff
    80007230:	14c080e7          	jalr	332(ra) # 80006378 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80007234:	00000613          	li	a2,0
    80007238:	00000597          	auipc	a1,0x0
    8000723c:	afc58593          	addi	a1,a1,-1284 # 80006d34 <_ZL11workerBodyDPv>
    80007240:	fe840513          	addi	a0,s0,-24
    80007244:	ffffa097          	auipc	ra,0xffffa
    80007248:	1c0080e7          	jalr	448(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    8000724c:	00003517          	auipc	a0,0x3
    80007250:	2a450513          	addi	a0,a0,676 # 8000a4f0 <CONSOLE_STATUS+0x4e0>
    80007254:	fffff097          	auipc	ra,0xfffff
    80007258:	124080e7          	jalr	292(ra) # 80006378 <_Z11printStringPKc>
    8000725c:	00c0006f          	j	80007268 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80007260:	ffffa097          	auipc	ra,0xffffa
    80007264:	260080e7          	jalr	608(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80007268:	00006797          	auipc	a5,0x6
    8000726c:	01d7c783          	lbu	a5,29(a5) # 8000d285 <_ZL9finishedA>
    80007270:	fe0788e3          	beqz	a5,80007260 <_Z16System_Mode_testv+0xb4>
    80007274:	00006797          	auipc	a5,0x6
    80007278:	0107c783          	lbu	a5,16(a5) # 8000d284 <_ZL9finishedB>
    8000727c:	fe0782e3          	beqz	a5,80007260 <_Z16System_Mode_testv+0xb4>
    80007280:	00006797          	auipc	a5,0x6
    80007284:	0037c783          	lbu	a5,3(a5) # 8000d283 <_ZL9finishedC>
    80007288:	fc078ce3          	beqz	a5,80007260 <_Z16System_Mode_testv+0xb4>
    8000728c:	00006797          	auipc	a5,0x6
    80007290:	ff67c783          	lbu	a5,-10(a5) # 8000d282 <_ZL9finishedD>
    80007294:	fc0786e3          	beqz	a5,80007260 <_Z16System_Mode_testv+0xb4>
    }

}
    80007298:	02813083          	ld	ra,40(sp)
    8000729c:	02013403          	ld	s0,32(sp)
    800072a0:	03010113          	addi	sp,sp,48
    800072a4:	00008067          	ret

00000000800072a8 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800072a8:	fe010113          	addi	sp,sp,-32
    800072ac:	00113c23          	sd	ra,24(sp)
    800072b0:	00813823          	sd	s0,16(sp)
    800072b4:	00913423          	sd	s1,8(sp)
    800072b8:	01213023          	sd	s2,0(sp)
    800072bc:	02010413          	addi	s0,sp,32
    800072c0:	00050493          	mv	s1,a0
    800072c4:	00058913          	mv	s2,a1
    800072c8:	0015879b          	addiw	a5,a1,1
    800072cc:	0007851b          	sext.w	a0,a5
    800072d0:	00f4a023          	sw	a5,0(s1)
    800072d4:	0004a823          	sw	zero,16(s1)
    800072d8:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800072dc:	00251513          	slli	a0,a0,0x2
    800072e0:	ffffa097          	auipc	ra,0xffffa
    800072e4:	0b4080e7          	jalr	180(ra) # 80001394 <_Z9mem_allocm>
    800072e8:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800072ec:	00000593          	li	a1,0
    800072f0:	02048513          	addi	a0,s1,32
    800072f4:	ffffa097          	auipc	ra,0xffffa
    800072f8:	244080e7          	jalr	580(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    800072fc:	00090593          	mv	a1,s2
    80007300:	01848513          	addi	a0,s1,24
    80007304:	ffffa097          	auipc	ra,0xffffa
    80007308:	234080e7          	jalr	564(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    8000730c:	00100593          	li	a1,1
    80007310:	02848513          	addi	a0,s1,40
    80007314:	ffffa097          	auipc	ra,0xffffa
    80007318:	224080e7          	jalr	548(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    8000731c:	00100593          	li	a1,1
    80007320:	03048513          	addi	a0,s1,48
    80007324:	ffffa097          	auipc	ra,0xffffa
    80007328:	214080e7          	jalr	532(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    8000732c:	01813083          	ld	ra,24(sp)
    80007330:	01013403          	ld	s0,16(sp)
    80007334:	00813483          	ld	s1,8(sp)
    80007338:	00013903          	ld	s2,0(sp)
    8000733c:	02010113          	addi	sp,sp,32
    80007340:	00008067          	ret

0000000080007344 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80007344:	fe010113          	addi	sp,sp,-32
    80007348:	00113c23          	sd	ra,24(sp)
    8000734c:	00813823          	sd	s0,16(sp)
    80007350:	00913423          	sd	s1,8(sp)
    80007354:	01213023          	sd	s2,0(sp)
    80007358:	02010413          	addi	s0,sp,32
    8000735c:	00050493          	mv	s1,a0
    80007360:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80007364:	01853503          	ld	a0,24(a0)
    80007368:	ffffa097          	auipc	ra,0xffffa
    8000736c:	238080e7          	jalr	568(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80007370:	0304b503          	ld	a0,48(s1)
    80007374:	ffffa097          	auipc	ra,0xffffa
    80007378:	22c080e7          	jalr	556(ra) # 800015a0 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    8000737c:	0084b783          	ld	a5,8(s1)
    80007380:	0144a703          	lw	a4,20(s1)
    80007384:	00271713          	slli	a4,a4,0x2
    80007388:	00e787b3          	add	a5,a5,a4
    8000738c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80007390:	0144a783          	lw	a5,20(s1)
    80007394:	0017879b          	addiw	a5,a5,1
    80007398:	0004a703          	lw	a4,0(s1)
    8000739c:	02e7e7bb          	remw	a5,a5,a4
    800073a0:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800073a4:	0304b503          	ld	a0,48(s1)
    800073a8:	ffffa097          	auipc	ra,0xffffa
    800073ac:	228080e7          	jalr	552(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    800073b0:	0204b503          	ld	a0,32(s1)
    800073b4:	ffffa097          	auipc	ra,0xffffa
    800073b8:	21c080e7          	jalr	540(ra) # 800015d0 <_Z10sem_signalP4KSem>

}
    800073bc:	01813083          	ld	ra,24(sp)
    800073c0:	01013403          	ld	s0,16(sp)
    800073c4:	00813483          	ld	s1,8(sp)
    800073c8:	00013903          	ld	s2,0(sp)
    800073cc:	02010113          	addi	sp,sp,32
    800073d0:	00008067          	ret

00000000800073d4 <_ZN6Buffer3getEv>:

int Buffer::get() {
    800073d4:	fe010113          	addi	sp,sp,-32
    800073d8:	00113c23          	sd	ra,24(sp)
    800073dc:	00813823          	sd	s0,16(sp)
    800073e0:	00913423          	sd	s1,8(sp)
    800073e4:	01213023          	sd	s2,0(sp)
    800073e8:	02010413          	addi	s0,sp,32
    800073ec:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800073f0:	02053503          	ld	a0,32(a0)
    800073f4:	ffffa097          	auipc	ra,0xffffa
    800073f8:	1ac080e7          	jalr	428(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    800073fc:	0284b503          	ld	a0,40(s1)
    80007400:	ffffa097          	auipc	ra,0xffffa
    80007404:	1a0080e7          	jalr	416(ra) # 800015a0 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80007408:	0084b703          	ld	a4,8(s1)
    8000740c:	0104a783          	lw	a5,16(s1)
    80007410:	00279693          	slli	a3,a5,0x2
    80007414:	00d70733          	add	a4,a4,a3
    80007418:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000741c:	0017879b          	addiw	a5,a5,1
    80007420:	0004a703          	lw	a4,0(s1)
    80007424:	02e7e7bb          	remw	a5,a5,a4
    80007428:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    8000742c:	0284b503          	ld	a0,40(s1)
    80007430:	ffffa097          	auipc	ra,0xffffa
    80007434:	1a0080e7          	jalr	416(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80007438:	0184b503          	ld	a0,24(s1)
    8000743c:	ffffa097          	auipc	ra,0xffffa
    80007440:	194080e7          	jalr	404(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    80007444:	00090513          	mv	a0,s2
    80007448:	01813083          	ld	ra,24(sp)
    8000744c:	01013403          	ld	s0,16(sp)
    80007450:	00813483          	ld	s1,8(sp)
    80007454:	00013903          	ld	s2,0(sp)
    80007458:	02010113          	addi	sp,sp,32
    8000745c:	00008067          	ret

0000000080007460 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80007460:	fe010113          	addi	sp,sp,-32
    80007464:	00113c23          	sd	ra,24(sp)
    80007468:	00813823          	sd	s0,16(sp)
    8000746c:	00913423          	sd	s1,8(sp)
    80007470:	01213023          	sd	s2,0(sp)
    80007474:	02010413          	addi	s0,sp,32
    80007478:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    8000747c:	02853503          	ld	a0,40(a0)
    80007480:	ffffa097          	auipc	ra,0xffffa
    80007484:	120080e7          	jalr	288(ra) # 800015a0 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80007488:	0304b503          	ld	a0,48(s1)
    8000748c:	ffffa097          	auipc	ra,0xffffa
    80007490:	114080e7          	jalr	276(ra) # 800015a0 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80007494:	0144a783          	lw	a5,20(s1)
    80007498:	0104a903          	lw	s2,16(s1)
    8000749c:	0327ce63          	blt	a5,s2,800074d8 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800074a0:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800074a4:	0304b503          	ld	a0,48(s1)
    800074a8:	ffffa097          	auipc	ra,0xffffa
    800074ac:	128080e7          	jalr	296(ra) # 800015d0 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    800074b0:	0284b503          	ld	a0,40(s1)
    800074b4:	ffffa097          	auipc	ra,0xffffa
    800074b8:	11c080e7          	jalr	284(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    800074bc:	00090513          	mv	a0,s2
    800074c0:	01813083          	ld	ra,24(sp)
    800074c4:	01013403          	ld	s0,16(sp)
    800074c8:	00813483          	ld	s1,8(sp)
    800074cc:	00013903          	ld	s2,0(sp)
    800074d0:	02010113          	addi	sp,sp,32
    800074d4:	00008067          	ret
        ret = cap - head + tail;
    800074d8:	0004a703          	lw	a4,0(s1)
    800074dc:	4127093b          	subw	s2,a4,s2
    800074e0:	00f9093b          	addw	s2,s2,a5
    800074e4:	fc1ff06f          	j	800074a4 <_ZN6Buffer6getCntEv+0x44>

00000000800074e8 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    800074e8:	fe010113          	addi	sp,sp,-32
    800074ec:	00113c23          	sd	ra,24(sp)
    800074f0:	00813823          	sd	s0,16(sp)
    800074f4:	00913423          	sd	s1,8(sp)
    800074f8:	02010413          	addi	s0,sp,32
    800074fc:	00050493          	mv	s1,a0
    putc('\n');
    80007500:	00a00513          	li	a0,10
    80007504:	ffffa097          	auipc	ra,0xffffa
    80007508:	124080e7          	jalr	292(ra) # 80001628 <_Z4putcc>
    printString("Buffer deleted!\n");
    8000750c:	00003517          	auipc	a0,0x3
    80007510:	ffc50513          	addi	a0,a0,-4 # 8000a508 <CONSOLE_STATUS+0x4f8>
    80007514:	fffff097          	auipc	ra,0xfffff
    80007518:	e64080e7          	jalr	-412(ra) # 80006378 <_Z11printStringPKc>
    while (getCnt() > 0) {
    8000751c:	00048513          	mv	a0,s1
    80007520:	00000097          	auipc	ra,0x0
    80007524:	f40080e7          	jalr	-192(ra) # 80007460 <_ZN6Buffer6getCntEv>
    80007528:	02a05c63          	blez	a0,80007560 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    8000752c:	0084b783          	ld	a5,8(s1)
    80007530:	0104a703          	lw	a4,16(s1)
    80007534:	00271713          	slli	a4,a4,0x2
    80007538:	00e787b3          	add	a5,a5,a4
        putc(ch);
    8000753c:	0007c503          	lbu	a0,0(a5)
    80007540:	ffffa097          	auipc	ra,0xffffa
    80007544:	0e8080e7          	jalr	232(ra) # 80001628 <_Z4putcc>
        head = (head + 1) % cap;
    80007548:	0104a783          	lw	a5,16(s1)
    8000754c:	0017879b          	addiw	a5,a5,1
    80007550:	0004a703          	lw	a4,0(s1)
    80007554:	02e7e7bb          	remw	a5,a5,a4
    80007558:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    8000755c:	fc1ff06f          	j	8000751c <_ZN6BufferD1Ev+0x34>
    putc('!');
    80007560:	02100513          	li	a0,33
    80007564:	ffffa097          	auipc	ra,0xffffa
    80007568:	0c4080e7          	jalr	196(ra) # 80001628 <_Z4putcc>
    putc('\n');
    8000756c:	00a00513          	li	a0,10
    80007570:	ffffa097          	auipc	ra,0xffffa
    80007574:	0b8080e7          	jalr	184(ra) # 80001628 <_Z4putcc>
    mem_free(buffer);
    80007578:	0084b503          	ld	a0,8(s1)
    8000757c:	ffffa097          	auipc	ra,0xffffa
    80007580:	e58080e7          	jalr	-424(ra) # 800013d4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80007584:	0204b503          	ld	a0,32(s1)
    80007588:	ffffa097          	auipc	ra,0xffffa
    8000758c:	fe8080e7          	jalr	-24(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80007590:	0184b503          	ld	a0,24(s1)
    80007594:	ffffa097          	auipc	ra,0xffffa
    80007598:	fdc080e7          	jalr	-36(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    8000759c:	0304b503          	ld	a0,48(s1)
    800075a0:	ffffa097          	auipc	ra,0xffffa
    800075a4:	fd0080e7          	jalr	-48(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    800075a8:	0284b503          	ld	a0,40(s1)
    800075ac:	ffffa097          	auipc	ra,0xffffa
    800075b0:	fc4080e7          	jalr	-60(ra) # 80001570 <_Z9sem_closeP4KSem>
}
    800075b4:	01813083          	ld	ra,24(sp)
    800075b8:	01013403          	ld	s0,16(sp)
    800075bc:	00813483          	ld	s1,8(sp)
    800075c0:	02010113          	addi	sp,sp,32
    800075c4:	00008067          	ret

00000000800075c8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    800075c8:	fa010113          	addi	sp,sp,-96
    800075cc:	04813c23          	sd	s0,88(sp)
    800075d0:	06010413          	addi	s0,sp,96
    800075d4:	faa43423          	sd	a0,-88(s0)
    800075d8:	00058793          	mv	a5,a1
    800075dc:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    800075e0:	fa843783          	ld	a5,-88(s0)
    800075e4:	00079663          	bnez	a5,800075f0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    800075e8:	00000793          	li	a5,0
    800075ec:	2040006f          	j	800077f0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    800075f0:	fa843783          	ld	a5,-88(s0)
    800075f4:	0067d713          	srli	a4,a5,0x6
    800075f8:	fa843783          	ld	a5,-88(s0)
    800075fc:	03f7f793          	andi	a5,a5,63
    80007600:	00078663          	beqz	a5,8000760c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80007604:	00100793          	li	a5,1
    80007608:	0080006f          	j	80007610 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    8000760c:	00000793          	li	a5,0
    80007610:	00e787b3          	add	a5,a5,a4
    80007614:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80007618:	fc843783          	ld	a5,-56(s0)
    8000761c:	00679793          	slli	a5,a5,0x6
    80007620:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    80007624:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80007628:	00006797          	auipc	a5,0x6
    8000762c:	c6878793          	addi	a5,a5,-920 # 8000d290 <_ZN15MemoryAllocator11freeMemHeadE>
    80007630:	0007b783          	ld	a5,0(a5)
    80007634:	fef43023          	sd	a5,-32(s0)
    80007638:	fe043783          	ld	a5,-32(s0)
    8000763c:	1a078863          	beqz	a5,800077ec <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    80007640:	fe043783          	ld	a5,-32(s0)
    80007644:	0087b783          	ld	a5,8(a5)
    80007648:	fa843703          	ld	a4,-88(s0)
    8000764c:	18e7e263          	bltu	a5,a4,800077d0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    80007650:	fe043703          	ld	a4,-32(s0)
    80007654:	fa843783          	ld	a5,-88(s0)
    80007658:	00f707b3          	add	a5,a4,a5
    8000765c:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    80007660:	fe043783          	ld	a5,-32(s0)
    80007664:	0087b703          	ld	a4,8(a5)
    80007668:	fa843783          	ld	a5,-88(s0)
    8000766c:	40f707b3          	sub	a5,a4,a5
    80007670:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80007674:	fb843703          	ld	a4,-72(s0)
    80007678:	02000793          	li	a5,32
    8000767c:	04e7e463          	bltu	a5,a4,800076c4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    80007680:	fa843703          	ld	a4,-88(s0)
    80007684:	fb843783          	ld	a5,-72(s0)
    80007688:	00f707b3          	add	a5,a4,a5
    8000768c:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    80007690:	fe843783          	ld	a5,-24(s0)
    80007694:	00078c63          	beqz	a5,800076ac <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    80007698:	fe043783          	ld	a5,-32(s0)
    8000769c:	0007b703          	ld	a4,0(a5)
    800076a0:	fe843783          	ld	a5,-24(s0)
    800076a4:	00e7b023          	sd	a4,0(a5)
    800076a8:	0600006f          	j	80007708 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    800076ac:	fe043783          	ld	a5,-32(s0)
    800076b0:	0007b703          	ld	a4,0(a5)
    800076b4:	00006797          	auipc	a5,0x6
    800076b8:	bdc78793          	addi	a5,a5,-1060 # 8000d290 <_ZN15MemoryAllocator11freeMemHeadE>
    800076bc:	00e7b023          	sd	a4,0(a5)
    800076c0:	0480006f          	j	80007708 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    800076c4:	fc043783          	ld	a5,-64(s0)
    800076c8:	fb843703          	ld	a4,-72(s0)
    800076cc:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    800076d0:	fe043783          	ld	a5,-32(s0)
    800076d4:	0007b703          	ld	a4,0(a5)
    800076d8:	fc043783          	ld	a5,-64(s0)
    800076dc:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    800076e0:	fe843783          	ld	a5,-24(s0)
    800076e4:	00078a63          	beqz	a5,800076f8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    800076e8:	fe843783          	ld	a5,-24(s0)
    800076ec:	fc043703          	ld	a4,-64(s0)
    800076f0:	00e7b023          	sd	a4,0(a5)
    800076f4:	0140006f          	j	80007708 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    800076f8:	00006797          	auipc	a5,0x6
    800076fc:	b9878793          	addi	a5,a5,-1128 # 8000d290 <_ZN15MemoryAllocator11freeMemHeadE>
    80007700:	fc043703          	ld	a4,-64(s0)
    80007704:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    80007708:	fe043783          	ld	a5,-32(s0)
    8000770c:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    80007710:	fb043783          	ld	a5,-80(s0)
    80007714:	fa843703          	ld	a4,-88(s0)
    80007718:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    8000771c:	fb043783          	ld	a5,-80(s0)
    80007720:	fa442703          	lw	a4,-92(s0)
    80007724:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    80007728:	fb043783          	ld	a5,-80(s0)
    8000772c:	02078713          	addi	a4,a5,32
    80007730:	fb043783          	ld	a5,-80(s0)
    80007734:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    80007738:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    8000773c:	00006797          	auipc	a5,0x6
    80007740:	b4c78793          	addi	a5,a5,-1204 # 8000d288 <_ZN15MemoryAllocator11usedMemHeadE>
    80007744:	0007b783          	ld	a5,0(a5)
    80007748:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    8000774c:	fd043783          	ld	a5,-48(s0)
    80007750:	02078463          	beqz	a5,80007778 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    80007754:	fd043703          	ld	a4,-48(s0)
    80007758:	fb043783          	ld	a5,-80(s0)
    8000775c:	00f77e63          	bgeu	a4,a5,80007778 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    80007760:	fd043783          	ld	a5,-48(s0)
    80007764:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80007768:	fd043783          	ld	a5,-48(s0)
    8000776c:	0007b783          	ld	a5,0(a5)
    80007770:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80007774:	fd9ff06f          	j	8000774c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    80007778:	fd843783          	ld	a5,-40(s0)
    8000777c:	02079663          	bnez	a5,800077a8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    80007780:	00006797          	auipc	a5,0x6
    80007784:	b0878793          	addi	a5,a5,-1272 # 8000d288 <_ZN15MemoryAllocator11usedMemHeadE>
    80007788:	0007b703          	ld	a4,0(a5)
    8000778c:	fb043783          	ld	a5,-80(s0)
    80007790:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    80007794:	00006797          	auipc	a5,0x6
    80007798:	af478793          	addi	a5,a5,-1292 # 8000d288 <_ZN15MemoryAllocator11usedMemHeadE>
    8000779c:	fb043703          	ld	a4,-80(s0)
    800077a0:	00e7b023          	sd	a4,0(a5)
    800077a4:	0200006f          	j	800077c4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    800077a8:	fd843783          	ld	a5,-40(s0)
    800077ac:	0007b703          	ld	a4,0(a5)
    800077b0:	fb043783          	ld	a5,-80(s0)
    800077b4:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    800077b8:	fd843783          	ld	a5,-40(s0)
    800077bc:	fb043703          	ld	a4,-80(s0)
    800077c0:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    800077c4:	fb043783          	ld	a5,-80(s0)
    800077c8:	0187b783          	ld	a5,24(a5)
    800077cc:	0240006f          	j	800077f0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    800077d0:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    800077d4:	fe043783          	ld	a5,-32(s0)
    800077d8:	fef43423          	sd	a5,-24(s0)
    800077dc:	fe043783          	ld	a5,-32(s0)
    800077e0:	0007b783          	ld	a5,0(a5)
    800077e4:	fef43023          	sd	a5,-32(s0)
    800077e8:	e51ff06f          	j	80007638 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    800077ec:	00000793          	li	a5,0
}
    800077f0:	00078513          	mv	a0,a5
    800077f4:	05813403          	ld	s0,88(sp)
    800077f8:	06010113          	addi	sp,sp,96
    800077fc:	00008067          	ret

0000000080007800 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80007800:	fb010113          	addi	sp,sp,-80
    80007804:	04113423          	sd	ra,72(sp)
    80007808:	04813023          	sd	s0,64(sp)
    8000780c:	05010413          	addi	s0,sp,80
    80007810:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    80007814:	fb843783          	ld	a5,-72(s0)
    80007818:	00079663          	bnez	a5,80007824 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    8000781c:	00000793          	li	a5,0
    80007820:	1740006f          	j	80007994 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    80007824:	00006797          	auipc	a5,0x6
    80007828:	a6478793          	addi	a5,a5,-1436 # 8000d288 <_ZN15MemoryAllocator11usedMemHeadE>
    8000782c:	0007b783          	ld	a5,0(a5)
    80007830:	00079663          	bnez	a5,8000783c <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    80007834:	fff00793          	li	a5,-1
    80007838:	15c0006f          	j	80007994 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    8000783c:	fb843783          	ld	a5,-72(s0)
    80007840:	fe078793          	addi	a5,a5,-32
    80007844:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    80007848:	00006797          	auipc	a5,0x6
    8000784c:	a4078793          	addi	a5,a5,-1472 # 8000d288 <_ZN15MemoryAllocator11usedMemHeadE>
    80007850:	0007b783          	ld	a5,0(a5)
    80007854:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    80007858:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    8000785c:	fe843783          	ld	a5,-24(s0)
    80007860:	02078463          	beqz	a5,80007888 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80007864:	fe843703          	ld	a4,-24(s0)
    80007868:	fb843783          	ld	a5,-72(s0)
    8000786c:	00f70e63          	beq	a4,a5,80007888 <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    80007870:	fe843783          	ld	a5,-24(s0)
    80007874:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80007878:	fe843783          	ld	a5,-24(s0)
    8000787c:	0007b783          	ld	a5,0(a5)
    80007880:	fef43423          	sd	a5,-24(s0)
    80007884:	fd9ff06f          	j	8000785c <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80007888:	fe843703          	ld	a4,-24(s0)
    8000788c:	fb843783          	ld	a5,-72(s0)
    80007890:	00f70663          	beq	a4,a5,8000789c <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80007894:	fff00793          	li	a5,-1
    80007898:	0fc0006f          	j	80007994 <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    8000789c:	fe043783          	ld	a5,-32(s0)
    800078a0:	00078c63          	beqz	a5,800078b8 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    800078a4:	fe843783          	ld	a5,-24(s0)
    800078a8:	0007b703          	ld	a4,0(a5)
    800078ac:	fe043783          	ld	a5,-32(s0)
    800078b0:	00e7b023          	sd	a4,0(a5)
    800078b4:	0180006f          	j	800078cc <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    800078b8:	fe843783          	ld	a5,-24(s0)
    800078bc:	0007b703          	ld	a4,0(a5)
    800078c0:	00006797          	auipc	a5,0x6
    800078c4:	9c878793          	addi	a5,a5,-1592 # 8000d288 <_ZN15MemoryAllocator11usedMemHeadE>
    800078c8:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    800078cc:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    800078d0:	00006797          	auipc	a5,0x6
    800078d4:	9c078793          	addi	a5,a5,-1600 # 8000d290 <_ZN15MemoryAllocator11freeMemHeadE>
    800078d8:	0007b783          	ld	a5,0(a5)
    800078dc:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    800078e0:	fd043783          	ld	a5,-48(s0)
    800078e4:	02078463          	beqz	a5,8000790c <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    800078e8:	fd043703          	ld	a4,-48(s0)
    800078ec:	fb843783          	ld	a5,-72(s0)
    800078f0:	00f77e63          	bgeu	a4,a5,8000790c <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    800078f4:	fd043783          	ld	a5,-48(s0)
    800078f8:	fcf43c23          	sd	a5,-40(s0)
    800078fc:	fd043783          	ld	a5,-48(s0)
    80007900:	0007b783          	ld	a5,0(a5)
    80007904:	fcf43823          	sd	a5,-48(s0)
    80007908:	fd9ff06f          	j	800078e0 <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    8000790c:	fb843783          	ld	a5,-72(s0)
    80007910:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    80007914:	fb843783          	ld	a5,-72(s0)
    80007918:	0087b783          	ld	a5,8(a5)
    8000791c:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    80007920:	fc843783          	ld	a5,-56(s0)
    80007924:	fc043703          	ld	a4,-64(s0)
    80007928:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    8000792c:	fd843783          	ld	a5,-40(s0)
    80007930:	02078263          	beqz	a5,80007954 <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    80007934:	fd843783          	ld	a5,-40(s0)
    80007938:	0007b703          	ld	a4,0(a5)
    8000793c:	fc843783          	ld	a5,-56(s0)
    80007940:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    80007944:	fd843783          	ld	a5,-40(s0)
    80007948:	fc843703          	ld	a4,-56(s0)
    8000794c:	00e7b023          	sd	a4,0(a5)
    80007950:	0280006f          	j	80007978 <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    80007954:	00006797          	auipc	a5,0x6
    80007958:	93c78793          	addi	a5,a5,-1732 # 8000d290 <_ZN15MemoryAllocator11freeMemHeadE>
    8000795c:	0007b703          	ld	a4,0(a5)
    80007960:	fc843783          	ld	a5,-56(s0)
    80007964:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    80007968:	00006797          	auipc	a5,0x6
    8000796c:	92878793          	addi	a5,a5,-1752 # 8000d290 <_ZN15MemoryAllocator11freeMemHeadE>
    80007970:	fc843703          	ld	a4,-56(s0)
    80007974:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    80007978:	fc843503          	ld	a0,-56(s0)
    8000797c:	00000097          	auipc	ra,0x0
    80007980:	02c080e7          	jalr	44(ra) # 800079a8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    80007984:	fd843503          	ld	a0,-40(s0)
    80007988:	00000097          	auipc	ra,0x0
    8000798c:	020080e7          	jalr	32(ra) # 800079a8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    80007990:	00000793          	li	a5,0
}
    80007994:	00078513          	mv	a0,a5
    80007998:	04813083          	ld	ra,72(sp)
    8000799c:	04013403          	ld	s0,64(sp)
    800079a0:	05010113          	addi	sp,sp,80
    800079a4:	00008067          	ret

00000000800079a8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    800079a8:	fc010113          	addi	sp,sp,-64
    800079ac:	02813c23          	sd	s0,56(sp)
    800079b0:	04010413          	addi	s0,sp,64
    800079b4:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    800079b8:	fc843783          	ld	a5,-56(s0)
    800079bc:	00079663          	bnez	a5,800079c8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    800079c0:	00000793          	li	a5,0
    800079c4:	0a00006f          	j	80007a64 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    800079c8:	fc843783          	ld	a5,-56(s0)
    800079cc:	0007b783          	ld	a5,0(a5)
    800079d0:	00f037b3          	snez	a5,a5
    800079d4:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    800079d8:	fc843783          	ld	a5,-56(s0)
    800079dc:	0087b783          	ld	a5,8(a5)
    800079e0:	fc843703          	ld	a4,-56(s0)
    800079e4:	00f707b3          	add	a5,a4,a5
    800079e8:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    800079ec:	fc843783          	ld	a5,-56(s0)
    800079f0:	0007b783          	ld	a5,0(a5)
    800079f4:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    800079f8:	fe043703          	ld	a4,-32(s0)
    800079fc:	fd843783          	ld	a5,-40(s0)
    80007a00:	40f707b3          	sub	a5,a4,a5
    80007a04:	0017b793          	seqz	a5,a5
    80007a08:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    80007a0c:	fef44783          	lbu	a5,-17(s0)
    80007a10:	0ff7f793          	andi	a5,a5,255
    80007a14:	04078663          	beqz	a5,80007a60 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    80007a18:	fd744783          	lbu	a5,-41(s0)
    80007a1c:	0ff7f793          	andi	a5,a5,255
    80007a20:	04078063          	beqz	a5,80007a60 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    80007a24:	fc843783          	ld	a5,-56(s0)
    80007a28:	0087b703          	ld	a4,8(a5)
    80007a2c:	fc843783          	ld	a5,-56(s0)
    80007a30:	0007b783          	ld	a5,0(a5)
    80007a34:	0087b783          	ld	a5,8(a5)
    80007a38:	00f70733          	add	a4,a4,a5
    80007a3c:	fc843783          	ld	a5,-56(s0)
    80007a40:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    80007a44:	fc843783          	ld	a5,-56(s0)
    80007a48:	0007b783          	ld	a5,0(a5)
    80007a4c:	0007b703          	ld	a4,0(a5)
    80007a50:	fc843783          	ld	a5,-56(s0)
    80007a54:	00e7b023          	sd	a4,0(a5)
        return 1;
    80007a58:	00100793          	li	a5,1
    80007a5c:	0080006f          	j	80007a64 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    80007a60:	00000793          	li	a5,0
}
    80007a64:	00078513          	mv	a0,a5
    80007a68:	03813403          	ld	s0,56(sp)
    80007a6c:	04010113          	addi	sp,sp,64
    80007a70:	00008067          	ret

0000000080007a74 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80007a74:	fe010113          	addi	sp,sp,-32
    80007a78:	00813c23          	sd	s0,24(sp)
    80007a7c:	02010413          	addi	s0,sp,32
    80007a80:	fea43423          	sd	a0,-24(s0)
    80007a84:	00058793          	mv	a5,a1
    80007a88:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80007a8c:	fe843783          	ld	a5,-24(s0)
    80007a90:	fe078793          	addi	a5,a5,-32
    80007a94:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    80007a98:	fe843783          	ld	a5,-24(s0)
    80007a9c:	0107a703          	lw	a4,16(a5)
    80007aa0:	fe442783          	lw	a5,-28(s0)
    80007aa4:	0007879b          	sext.w	a5,a5
    80007aa8:	40e787b3          	sub	a5,a5,a4
    80007aac:	0017b793          	seqz	a5,a5
    80007ab0:	0ff7f793          	andi	a5,a5,255
}
    80007ab4:	00078513          	mv	a0,a5
    80007ab8:	01813403          	ld	s0,24(sp)
    80007abc:	02010113          	addi	sp,sp,32
    80007ac0:	00008067          	ret

0000000080007ac4 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    80007ac4:	ff010113          	addi	sp,sp,-16
    80007ac8:	00813423          	sd	s0,8(sp)
    80007acc:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    80007ad0:	00005797          	auipc	a5,0x5
    80007ad4:	7c878793          	addi	a5,a5,1992 # 8000d298 <_ZN15MemoryAllocator11initializedE>
    80007ad8:	0007c783          	lbu	a5,0(a5)
    80007adc:	0017c793          	xori	a5,a5,1
    80007ae0:	0ff7f793          	andi	a5,a5,255
    80007ae4:	06078a63          	beqz	a5,80007b58 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    80007ae8:	00005797          	auipc	a5,0x5
    80007aec:	5607b783          	ld	a5,1376(a5) # 8000d048 <_GLOBAL_OFFSET_TABLE_+0x30>
    80007af0:	0007b703          	ld	a4,0(a5)
    80007af4:	00005797          	auipc	a5,0x5
    80007af8:	79c78793          	addi	a5,a5,1948 # 8000d290 <_ZN15MemoryAllocator11freeMemHeadE>
    80007afc:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    80007b00:	00005797          	auipc	a5,0x5
    80007b04:	79078793          	addi	a5,a5,1936 # 8000d290 <_ZN15MemoryAllocator11freeMemHeadE>
    80007b08:	0007b783          	ld	a5,0(a5)
    80007b0c:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    80007b10:	00005797          	auipc	a5,0x5
    80007b14:	5907b783          	ld	a5,1424(a5) # 8000d0a0 <_GLOBAL_OFFSET_TABLE_+0x88>
    80007b18:	0007b703          	ld	a4,0(a5)
    80007b1c:	00005797          	auipc	a5,0x5
    80007b20:	52c7b783          	ld	a5,1324(a5) # 8000d048 <_GLOBAL_OFFSET_TABLE_+0x30>
    80007b24:	0007b783          	ld	a5,0(a5)
    80007b28:	40f70733          	sub	a4,a4,a5
    80007b2c:	00005797          	auipc	a5,0x5
    80007b30:	76478793          	addi	a5,a5,1892 # 8000d290 <_ZN15MemoryAllocator11freeMemHeadE>
    80007b34:	0007b783          	ld	a5,0(a5)
    80007b38:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    80007b3c:	00005797          	auipc	a5,0x5
    80007b40:	74c78793          	addi	a5,a5,1868 # 8000d288 <_ZN15MemoryAllocator11usedMemHeadE>
    80007b44:	0007b023          	sd	zero,0(a5)

        initialized = true;
    80007b48:	00005797          	auipc	a5,0x5
    80007b4c:	75078793          	addi	a5,a5,1872 # 8000d298 <_ZN15MemoryAllocator11initializedE>
    80007b50:	00100713          	li	a4,1
    80007b54:	00e78023          	sb	a4,0(a5)
    }
}
    80007b58:	00000013          	nop
    80007b5c:	00813403          	ld	s0,8(sp)
    80007b60:	01010113          	addi	sp,sp,16
    80007b64:	00008067          	ret

0000000080007b68 <start>:
    80007b68:	ff010113          	addi	sp,sp,-16
    80007b6c:	00813423          	sd	s0,8(sp)
    80007b70:	01010413          	addi	s0,sp,16
    80007b74:	300027f3          	csrr	a5,mstatus
    80007b78:	ffffe737          	lui	a4,0xffffe
    80007b7c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff02ff>
    80007b80:	00e7f7b3          	and	a5,a5,a4
    80007b84:	00001737          	lui	a4,0x1
    80007b88:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80007b8c:	00e7e7b3          	or	a5,a5,a4
    80007b90:	30079073          	csrw	mstatus,a5
    80007b94:	00000797          	auipc	a5,0x0
    80007b98:	16078793          	addi	a5,a5,352 # 80007cf4 <system_main>
    80007b9c:	34179073          	csrw	mepc,a5
    80007ba0:	00000793          	li	a5,0
    80007ba4:	18079073          	csrw	satp,a5
    80007ba8:	000107b7          	lui	a5,0x10
    80007bac:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007bb0:	30279073          	csrw	medeleg,a5
    80007bb4:	30379073          	csrw	mideleg,a5
    80007bb8:	104027f3          	csrr	a5,sie
    80007bbc:	2227e793          	ori	a5,a5,546
    80007bc0:	10479073          	csrw	sie,a5
    80007bc4:	fff00793          	li	a5,-1
    80007bc8:	00a7d793          	srli	a5,a5,0xa
    80007bcc:	3b079073          	csrw	pmpaddr0,a5
    80007bd0:	00f00793          	li	a5,15
    80007bd4:	3a079073          	csrw	pmpcfg0,a5
    80007bd8:	f14027f3          	csrr	a5,mhartid
    80007bdc:	0200c737          	lui	a4,0x200c
    80007be0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007be4:	0007869b          	sext.w	a3,a5
    80007be8:	00269713          	slli	a4,a3,0x2
    80007bec:	000f4637          	lui	a2,0xf4
    80007bf0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007bf4:	00d70733          	add	a4,a4,a3
    80007bf8:	0037979b          	slliw	a5,a5,0x3
    80007bfc:	020046b7          	lui	a3,0x2004
    80007c00:	00d787b3          	add	a5,a5,a3
    80007c04:	00c585b3          	add	a1,a1,a2
    80007c08:	00371693          	slli	a3,a4,0x3
    80007c0c:	00005717          	auipc	a4,0x5
    80007c10:	69470713          	addi	a4,a4,1684 # 8000d2a0 <timer_scratch>
    80007c14:	00b7b023          	sd	a1,0(a5)
    80007c18:	00d70733          	add	a4,a4,a3
    80007c1c:	00f73c23          	sd	a5,24(a4)
    80007c20:	02c73023          	sd	a2,32(a4)
    80007c24:	34071073          	csrw	mscratch,a4
    80007c28:	00000797          	auipc	a5,0x0
    80007c2c:	6e878793          	addi	a5,a5,1768 # 80008310 <timervec>
    80007c30:	30579073          	csrw	mtvec,a5
    80007c34:	300027f3          	csrr	a5,mstatus
    80007c38:	0087e793          	ori	a5,a5,8
    80007c3c:	30079073          	csrw	mstatus,a5
    80007c40:	304027f3          	csrr	a5,mie
    80007c44:	0807e793          	ori	a5,a5,128
    80007c48:	30479073          	csrw	mie,a5
    80007c4c:	f14027f3          	csrr	a5,mhartid
    80007c50:	0007879b          	sext.w	a5,a5
    80007c54:	00078213          	mv	tp,a5
    80007c58:	30200073          	mret
    80007c5c:	00813403          	ld	s0,8(sp)
    80007c60:	01010113          	addi	sp,sp,16
    80007c64:	00008067          	ret

0000000080007c68 <timerinit>:
    80007c68:	ff010113          	addi	sp,sp,-16
    80007c6c:	00813423          	sd	s0,8(sp)
    80007c70:	01010413          	addi	s0,sp,16
    80007c74:	f14027f3          	csrr	a5,mhartid
    80007c78:	0200c737          	lui	a4,0x200c
    80007c7c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007c80:	0007869b          	sext.w	a3,a5
    80007c84:	00269713          	slli	a4,a3,0x2
    80007c88:	000f4637          	lui	a2,0xf4
    80007c8c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007c90:	00d70733          	add	a4,a4,a3
    80007c94:	0037979b          	slliw	a5,a5,0x3
    80007c98:	020046b7          	lui	a3,0x2004
    80007c9c:	00d787b3          	add	a5,a5,a3
    80007ca0:	00c585b3          	add	a1,a1,a2
    80007ca4:	00371693          	slli	a3,a4,0x3
    80007ca8:	00005717          	auipc	a4,0x5
    80007cac:	5f870713          	addi	a4,a4,1528 # 8000d2a0 <timer_scratch>
    80007cb0:	00b7b023          	sd	a1,0(a5)
    80007cb4:	00d70733          	add	a4,a4,a3
    80007cb8:	00f73c23          	sd	a5,24(a4)
    80007cbc:	02c73023          	sd	a2,32(a4)
    80007cc0:	34071073          	csrw	mscratch,a4
    80007cc4:	00000797          	auipc	a5,0x0
    80007cc8:	64c78793          	addi	a5,a5,1612 # 80008310 <timervec>
    80007ccc:	30579073          	csrw	mtvec,a5
    80007cd0:	300027f3          	csrr	a5,mstatus
    80007cd4:	0087e793          	ori	a5,a5,8
    80007cd8:	30079073          	csrw	mstatus,a5
    80007cdc:	304027f3          	csrr	a5,mie
    80007ce0:	0807e793          	ori	a5,a5,128
    80007ce4:	30479073          	csrw	mie,a5
    80007ce8:	00813403          	ld	s0,8(sp)
    80007cec:	01010113          	addi	sp,sp,16
    80007cf0:	00008067          	ret

0000000080007cf4 <system_main>:
    80007cf4:	fe010113          	addi	sp,sp,-32
    80007cf8:	00813823          	sd	s0,16(sp)
    80007cfc:	00913423          	sd	s1,8(sp)
    80007d00:	00113c23          	sd	ra,24(sp)
    80007d04:	02010413          	addi	s0,sp,32
    80007d08:	00000097          	auipc	ra,0x0
    80007d0c:	0c4080e7          	jalr	196(ra) # 80007dcc <cpuid>
    80007d10:	00005497          	auipc	s1,0x5
    80007d14:	3d048493          	addi	s1,s1,976 # 8000d0e0 <started>
    80007d18:	02050263          	beqz	a0,80007d3c <system_main+0x48>
    80007d1c:	0004a783          	lw	a5,0(s1)
    80007d20:	0007879b          	sext.w	a5,a5
    80007d24:	fe078ce3          	beqz	a5,80007d1c <system_main+0x28>
    80007d28:	0ff0000f          	fence
    80007d2c:	00003517          	auipc	a0,0x3
    80007d30:	aac50513          	addi	a0,a0,-1364 # 8000a7d8 <CONSOLE_STATUS+0x7c8>
    80007d34:	00001097          	auipc	ra,0x1
    80007d38:	a78080e7          	jalr	-1416(ra) # 800087ac <panic>
    80007d3c:	00001097          	auipc	ra,0x1
    80007d40:	9cc080e7          	jalr	-1588(ra) # 80008708 <consoleinit>
    80007d44:	00001097          	auipc	ra,0x1
    80007d48:	158080e7          	jalr	344(ra) # 80008e9c <printfinit>
    80007d4c:	00003517          	auipc	a0,0x3
    80007d50:	91450513          	addi	a0,a0,-1772 # 8000a660 <CONSOLE_STATUS+0x650>
    80007d54:	00001097          	auipc	ra,0x1
    80007d58:	ab4080e7          	jalr	-1356(ra) # 80008808 <__printf>
    80007d5c:	00003517          	auipc	a0,0x3
    80007d60:	a4c50513          	addi	a0,a0,-1460 # 8000a7a8 <CONSOLE_STATUS+0x798>
    80007d64:	00001097          	auipc	ra,0x1
    80007d68:	aa4080e7          	jalr	-1372(ra) # 80008808 <__printf>
    80007d6c:	00003517          	auipc	a0,0x3
    80007d70:	8f450513          	addi	a0,a0,-1804 # 8000a660 <CONSOLE_STATUS+0x650>
    80007d74:	00001097          	auipc	ra,0x1
    80007d78:	a94080e7          	jalr	-1388(ra) # 80008808 <__printf>
    80007d7c:	00001097          	auipc	ra,0x1
    80007d80:	4ac080e7          	jalr	1196(ra) # 80009228 <kinit>
    80007d84:	00000097          	auipc	ra,0x0
    80007d88:	148080e7          	jalr	328(ra) # 80007ecc <trapinit>
    80007d8c:	00000097          	auipc	ra,0x0
    80007d90:	16c080e7          	jalr	364(ra) # 80007ef8 <trapinithart>
    80007d94:	00000097          	auipc	ra,0x0
    80007d98:	5bc080e7          	jalr	1468(ra) # 80008350 <plicinit>
    80007d9c:	00000097          	auipc	ra,0x0
    80007da0:	5dc080e7          	jalr	1500(ra) # 80008378 <plicinithart>
    80007da4:	00000097          	auipc	ra,0x0
    80007da8:	078080e7          	jalr	120(ra) # 80007e1c <userinit>
    80007dac:	0ff0000f          	fence
    80007db0:	00100793          	li	a5,1
    80007db4:	00003517          	auipc	a0,0x3
    80007db8:	a0c50513          	addi	a0,a0,-1524 # 8000a7c0 <CONSOLE_STATUS+0x7b0>
    80007dbc:	00f4a023          	sw	a5,0(s1)
    80007dc0:	00001097          	auipc	ra,0x1
    80007dc4:	a48080e7          	jalr	-1464(ra) # 80008808 <__printf>
    80007dc8:	0000006f          	j	80007dc8 <system_main+0xd4>

0000000080007dcc <cpuid>:
    80007dcc:	ff010113          	addi	sp,sp,-16
    80007dd0:	00813423          	sd	s0,8(sp)
    80007dd4:	01010413          	addi	s0,sp,16
    80007dd8:	00020513          	mv	a0,tp
    80007ddc:	00813403          	ld	s0,8(sp)
    80007de0:	0005051b          	sext.w	a0,a0
    80007de4:	01010113          	addi	sp,sp,16
    80007de8:	00008067          	ret

0000000080007dec <mycpu>:
    80007dec:	ff010113          	addi	sp,sp,-16
    80007df0:	00813423          	sd	s0,8(sp)
    80007df4:	01010413          	addi	s0,sp,16
    80007df8:	00020793          	mv	a5,tp
    80007dfc:	00813403          	ld	s0,8(sp)
    80007e00:	0007879b          	sext.w	a5,a5
    80007e04:	00779793          	slli	a5,a5,0x7
    80007e08:	00006517          	auipc	a0,0x6
    80007e0c:	4c850513          	addi	a0,a0,1224 # 8000e2d0 <cpus>
    80007e10:	00f50533          	add	a0,a0,a5
    80007e14:	01010113          	addi	sp,sp,16
    80007e18:	00008067          	ret

0000000080007e1c <userinit>:
    80007e1c:	ff010113          	addi	sp,sp,-16
    80007e20:	00813423          	sd	s0,8(sp)
    80007e24:	01010413          	addi	s0,sp,16
    80007e28:	00813403          	ld	s0,8(sp)
    80007e2c:	01010113          	addi	sp,sp,16
    80007e30:	ffffa317          	auipc	t1,0xffffa
    80007e34:	4b030067          	jr	1200(t1) # 800022e0 <main>

0000000080007e38 <either_copyout>:
    80007e38:	ff010113          	addi	sp,sp,-16
    80007e3c:	00813023          	sd	s0,0(sp)
    80007e40:	00113423          	sd	ra,8(sp)
    80007e44:	01010413          	addi	s0,sp,16
    80007e48:	02051663          	bnez	a0,80007e74 <either_copyout+0x3c>
    80007e4c:	00058513          	mv	a0,a1
    80007e50:	00060593          	mv	a1,a2
    80007e54:	0006861b          	sext.w	a2,a3
    80007e58:	00002097          	auipc	ra,0x2
    80007e5c:	c5c080e7          	jalr	-932(ra) # 80009ab4 <__memmove>
    80007e60:	00813083          	ld	ra,8(sp)
    80007e64:	00013403          	ld	s0,0(sp)
    80007e68:	00000513          	li	a0,0
    80007e6c:	01010113          	addi	sp,sp,16
    80007e70:	00008067          	ret
    80007e74:	00003517          	auipc	a0,0x3
    80007e78:	98c50513          	addi	a0,a0,-1652 # 8000a800 <CONSOLE_STATUS+0x7f0>
    80007e7c:	00001097          	auipc	ra,0x1
    80007e80:	930080e7          	jalr	-1744(ra) # 800087ac <panic>

0000000080007e84 <either_copyin>:
    80007e84:	ff010113          	addi	sp,sp,-16
    80007e88:	00813023          	sd	s0,0(sp)
    80007e8c:	00113423          	sd	ra,8(sp)
    80007e90:	01010413          	addi	s0,sp,16
    80007e94:	02059463          	bnez	a1,80007ebc <either_copyin+0x38>
    80007e98:	00060593          	mv	a1,a2
    80007e9c:	0006861b          	sext.w	a2,a3
    80007ea0:	00002097          	auipc	ra,0x2
    80007ea4:	c14080e7          	jalr	-1004(ra) # 80009ab4 <__memmove>
    80007ea8:	00813083          	ld	ra,8(sp)
    80007eac:	00013403          	ld	s0,0(sp)
    80007eb0:	00000513          	li	a0,0
    80007eb4:	01010113          	addi	sp,sp,16
    80007eb8:	00008067          	ret
    80007ebc:	00003517          	auipc	a0,0x3
    80007ec0:	96c50513          	addi	a0,a0,-1684 # 8000a828 <CONSOLE_STATUS+0x818>
    80007ec4:	00001097          	auipc	ra,0x1
    80007ec8:	8e8080e7          	jalr	-1816(ra) # 800087ac <panic>

0000000080007ecc <trapinit>:
    80007ecc:	ff010113          	addi	sp,sp,-16
    80007ed0:	00813423          	sd	s0,8(sp)
    80007ed4:	01010413          	addi	s0,sp,16
    80007ed8:	00813403          	ld	s0,8(sp)
    80007edc:	00003597          	auipc	a1,0x3
    80007ee0:	97458593          	addi	a1,a1,-1676 # 8000a850 <CONSOLE_STATUS+0x840>
    80007ee4:	00006517          	auipc	a0,0x6
    80007ee8:	46c50513          	addi	a0,a0,1132 # 8000e350 <tickslock>
    80007eec:	01010113          	addi	sp,sp,16
    80007ef0:	00001317          	auipc	t1,0x1
    80007ef4:	5c830067          	jr	1480(t1) # 800094b8 <initlock>

0000000080007ef8 <trapinithart>:
    80007ef8:	ff010113          	addi	sp,sp,-16
    80007efc:	00813423          	sd	s0,8(sp)
    80007f00:	01010413          	addi	s0,sp,16
    80007f04:	00000797          	auipc	a5,0x0
    80007f08:	2fc78793          	addi	a5,a5,764 # 80008200 <kernelvec>
    80007f0c:	10579073          	csrw	stvec,a5
    80007f10:	00813403          	ld	s0,8(sp)
    80007f14:	01010113          	addi	sp,sp,16
    80007f18:	00008067          	ret

0000000080007f1c <usertrap>:
    80007f1c:	ff010113          	addi	sp,sp,-16
    80007f20:	00813423          	sd	s0,8(sp)
    80007f24:	01010413          	addi	s0,sp,16
    80007f28:	00813403          	ld	s0,8(sp)
    80007f2c:	01010113          	addi	sp,sp,16
    80007f30:	00008067          	ret

0000000080007f34 <usertrapret>:
    80007f34:	ff010113          	addi	sp,sp,-16
    80007f38:	00813423          	sd	s0,8(sp)
    80007f3c:	01010413          	addi	s0,sp,16
    80007f40:	00813403          	ld	s0,8(sp)
    80007f44:	01010113          	addi	sp,sp,16
    80007f48:	00008067          	ret

0000000080007f4c <kerneltrap>:
    80007f4c:	fe010113          	addi	sp,sp,-32
    80007f50:	00813823          	sd	s0,16(sp)
    80007f54:	00113c23          	sd	ra,24(sp)
    80007f58:	00913423          	sd	s1,8(sp)
    80007f5c:	02010413          	addi	s0,sp,32
    80007f60:	142025f3          	csrr	a1,scause
    80007f64:	100027f3          	csrr	a5,sstatus
    80007f68:	0027f793          	andi	a5,a5,2
    80007f6c:	10079c63          	bnez	a5,80008084 <kerneltrap+0x138>
    80007f70:	142027f3          	csrr	a5,scause
    80007f74:	0207ce63          	bltz	a5,80007fb0 <kerneltrap+0x64>
    80007f78:	00003517          	auipc	a0,0x3
    80007f7c:	92050513          	addi	a0,a0,-1760 # 8000a898 <CONSOLE_STATUS+0x888>
    80007f80:	00001097          	auipc	ra,0x1
    80007f84:	888080e7          	jalr	-1912(ra) # 80008808 <__printf>
    80007f88:	141025f3          	csrr	a1,sepc
    80007f8c:	14302673          	csrr	a2,stval
    80007f90:	00003517          	auipc	a0,0x3
    80007f94:	91850513          	addi	a0,a0,-1768 # 8000a8a8 <CONSOLE_STATUS+0x898>
    80007f98:	00001097          	auipc	ra,0x1
    80007f9c:	870080e7          	jalr	-1936(ra) # 80008808 <__printf>
    80007fa0:	00003517          	auipc	a0,0x3
    80007fa4:	92050513          	addi	a0,a0,-1760 # 8000a8c0 <CONSOLE_STATUS+0x8b0>
    80007fa8:	00001097          	auipc	ra,0x1
    80007fac:	804080e7          	jalr	-2044(ra) # 800087ac <panic>
    80007fb0:	0ff7f713          	andi	a4,a5,255
    80007fb4:	00900693          	li	a3,9
    80007fb8:	04d70063          	beq	a4,a3,80007ff8 <kerneltrap+0xac>
    80007fbc:	fff00713          	li	a4,-1
    80007fc0:	03f71713          	slli	a4,a4,0x3f
    80007fc4:	00170713          	addi	a4,a4,1
    80007fc8:	fae798e3          	bne	a5,a4,80007f78 <kerneltrap+0x2c>
    80007fcc:	00000097          	auipc	ra,0x0
    80007fd0:	e00080e7          	jalr	-512(ra) # 80007dcc <cpuid>
    80007fd4:	06050663          	beqz	a0,80008040 <kerneltrap+0xf4>
    80007fd8:	144027f3          	csrr	a5,sip
    80007fdc:	ffd7f793          	andi	a5,a5,-3
    80007fe0:	14479073          	csrw	sip,a5
    80007fe4:	01813083          	ld	ra,24(sp)
    80007fe8:	01013403          	ld	s0,16(sp)
    80007fec:	00813483          	ld	s1,8(sp)
    80007ff0:	02010113          	addi	sp,sp,32
    80007ff4:	00008067          	ret
    80007ff8:	00000097          	auipc	ra,0x0
    80007ffc:	3cc080e7          	jalr	972(ra) # 800083c4 <plic_claim>
    80008000:	00a00793          	li	a5,10
    80008004:	00050493          	mv	s1,a0
    80008008:	06f50863          	beq	a0,a5,80008078 <kerneltrap+0x12c>
    8000800c:	fc050ce3          	beqz	a0,80007fe4 <kerneltrap+0x98>
    80008010:	00050593          	mv	a1,a0
    80008014:	00003517          	auipc	a0,0x3
    80008018:	86450513          	addi	a0,a0,-1948 # 8000a878 <CONSOLE_STATUS+0x868>
    8000801c:	00000097          	auipc	ra,0x0
    80008020:	7ec080e7          	jalr	2028(ra) # 80008808 <__printf>
    80008024:	01013403          	ld	s0,16(sp)
    80008028:	01813083          	ld	ra,24(sp)
    8000802c:	00048513          	mv	a0,s1
    80008030:	00813483          	ld	s1,8(sp)
    80008034:	02010113          	addi	sp,sp,32
    80008038:	00000317          	auipc	t1,0x0
    8000803c:	3c430067          	jr	964(t1) # 800083fc <plic_complete>
    80008040:	00006517          	auipc	a0,0x6
    80008044:	31050513          	addi	a0,a0,784 # 8000e350 <tickslock>
    80008048:	00001097          	auipc	ra,0x1
    8000804c:	494080e7          	jalr	1172(ra) # 800094dc <acquire>
    80008050:	00005717          	auipc	a4,0x5
    80008054:	09470713          	addi	a4,a4,148 # 8000d0e4 <ticks>
    80008058:	00072783          	lw	a5,0(a4)
    8000805c:	00006517          	auipc	a0,0x6
    80008060:	2f450513          	addi	a0,a0,756 # 8000e350 <tickslock>
    80008064:	0017879b          	addiw	a5,a5,1
    80008068:	00f72023          	sw	a5,0(a4)
    8000806c:	00001097          	auipc	ra,0x1
    80008070:	53c080e7          	jalr	1340(ra) # 800095a8 <release>
    80008074:	f65ff06f          	j	80007fd8 <kerneltrap+0x8c>
    80008078:	00001097          	auipc	ra,0x1
    8000807c:	098080e7          	jalr	152(ra) # 80009110 <uartintr>
    80008080:	fa5ff06f          	j	80008024 <kerneltrap+0xd8>
    80008084:	00002517          	auipc	a0,0x2
    80008088:	7d450513          	addi	a0,a0,2004 # 8000a858 <CONSOLE_STATUS+0x848>
    8000808c:	00000097          	auipc	ra,0x0
    80008090:	720080e7          	jalr	1824(ra) # 800087ac <panic>

0000000080008094 <clockintr>:
    80008094:	fe010113          	addi	sp,sp,-32
    80008098:	00813823          	sd	s0,16(sp)
    8000809c:	00913423          	sd	s1,8(sp)
    800080a0:	00113c23          	sd	ra,24(sp)
    800080a4:	02010413          	addi	s0,sp,32
    800080a8:	00006497          	auipc	s1,0x6
    800080ac:	2a848493          	addi	s1,s1,680 # 8000e350 <tickslock>
    800080b0:	00048513          	mv	a0,s1
    800080b4:	00001097          	auipc	ra,0x1
    800080b8:	428080e7          	jalr	1064(ra) # 800094dc <acquire>
    800080bc:	00005717          	auipc	a4,0x5
    800080c0:	02870713          	addi	a4,a4,40 # 8000d0e4 <ticks>
    800080c4:	00072783          	lw	a5,0(a4)
    800080c8:	01013403          	ld	s0,16(sp)
    800080cc:	01813083          	ld	ra,24(sp)
    800080d0:	00048513          	mv	a0,s1
    800080d4:	0017879b          	addiw	a5,a5,1
    800080d8:	00813483          	ld	s1,8(sp)
    800080dc:	00f72023          	sw	a5,0(a4)
    800080e0:	02010113          	addi	sp,sp,32
    800080e4:	00001317          	auipc	t1,0x1
    800080e8:	4c430067          	jr	1220(t1) # 800095a8 <release>

00000000800080ec <devintr>:
    800080ec:	142027f3          	csrr	a5,scause
    800080f0:	00000513          	li	a0,0
    800080f4:	0007c463          	bltz	a5,800080fc <devintr+0x10>
    800080f8:	00008067          	ret
    800080fc:	fe010113          	addi	sp,sp,-32
    80008100:	00813823          	sd	s0,16(sp)
    80008104:	00113c23          	sd	ra,24(sp)
    80008108:	00913423          	sd	s1,8(sp)
    8000810c:	02010413          	addi	s0,sp,32
    80008110:	0ff7f713          	andi	a4,a5,255
    80008114:	00900693          	li	a3,9
    80008118:	04d70c63          	beq	a4,a3,80008170 <devintr+0x84>
    8000811c:	fff00713          	li	a4,-1
    80008120:	03f71713          	slli	a4,a4,0x3f
    80008124:	00170713          	addi	a4,a4,1
    80008128:	00e78c63          	beq	a5,a4,80008140 <devintr+0x54>
    8000812c:	01813083          	ld	ra,24(sp)
    80008130:	01013403          	ld	s0,16(sp)
    80008134:	00813483          	ld	s1,8(sp)
    80008138:	02010113          	addi	sp,sp,32
    8000813c:	00008067          	ret
    80008140:	00000097          	auipc	ra,0x0
    80008144:	c8c080e7          	jalr	-884(ra) # 80007dcc <cpuid>
    80008148:	06050663          	beqz	a0,800081b4 <devintr+0xc8>
    8000814c:	144027f3          	csrr	a5,sip
    80008150:	ffd7f793          	andi	a5,a5,-3
    80008154:	14479073          	csrw	sip,a5
    80008158:	01813083          	ld	ra,24(sp)
    8000815c:	01013403          	ld	s0,16(sp)
    80008160:	00813483          	ld	s1,8(sp)
    80008164:	00200513          	li	a0,2
    80008168:	02010113          	addi	sp,sp,32
    8000816c:	00008067          	ret
    80008170:	00000097          	auipc	ra,0x0
    80008174:	254080e7          	jalr	596(ra) # 800083c4 <plic_claim>
    80008178:	00a00793          	li	a5,10
    8000817c:	00050493          	mv	s1,a0
    80008180:	06f50663          	beq	a0,a5,800081ec <devintr+0x100>
    80008184:	00100513          	li	a0,1
    80008188:	fa0482e3          	beqz	s1,8000812c <devintr+0x40>
    8000818c:	00048593          	mv	a1,s1
    80008190:	00002517          	auipc	a0,0x2
    80008194:	6e850513          	addi	a0,a0,1768 # 8000a878 <CONSOLE_STATUS+0x868>
    80008198:	00000097          	auipc	ra,0x0
    8000819c:	670080e7          	jalr	1648(ra) # 80008808 <__printf>
    800081a0:	00048513          	mv	a0,s1
    800081a4:	00000097          	auipc	ra,0x0
    800081a8:	258080e7          	jalr	600(ra) # 800083fc <plic_complete>
    800081ac:	00100513          	li	a0,1
    800081b0:	f7dff06f          	j	8000812c <devintr+0x40>
    800081b4:	00006517          	auipc	a0,0x6
    800081b8:	19c50513          	addi	a0,a0,412 # 8000e350 <tickslock>
    800081bc:	00001097          	auipc	ra,0x1
    800081c0:	320080e7          	jalr	800(ra) # 800094dc <acquire>
    800081c4:	00005717          	auipc	a4,0x5
    800081c8:	f2070713          	addi	a4,a4,-224 # 8000d0e4 <ticks>
    800081cc:	00072783          	lw	a5,0(a4)
    800081d0:	00006517          	auipc	a0,0x6
    800081d4:	18050513          	addi	a0,a0,384 # 8000e350 <tickslock>
    800081d8:	0017879b          	addiw	a5,a5,1
    800081dc:	00f72023          	sw	a5,0(a4)
    800081e0:	00001097          	auipc	ra,0x1
    800081e4:	3c8080e7          	jalr	968(ra) # 800095a8 <release>
    800081e8:	f65ff06f          	j	8000814c <devintr+0x60>
    800081ec:	00001097          	auipc	ra,0x1
    800081f0:	f24080e7          	jalr	-220(ra) # 80009110 <uartintr>
    800081f4:	fadff06f          	j	800081a0 <devintr+0xb4>
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
    80008280:	ccdff0ef          	jal	ra,80007f4c <kerneltrap>
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
    8000838c:	a44080e7          	jalr	-1468(ra) # 80007dcc <cpuid>
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
    800083d8:	9f8080e7          	jalr	-1544(ra) # 80007dcc <cpuid>
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
    80008418:	9b8080e7          	jalr	-1608(ra) # 80007dcc <cpuid>
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
    800084ac:	9dc080e7          	jalr	-1572(ra) # 80007e84 <either_copyin>
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
    8000852c:	e5048493          	addi	s1,s1,-432 # 8000e378 <cons>
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
    80008584:	8b8080e7          	jalr	-1864(ra) # 80007e38 <either_copyout>
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
    80008690:	cec90913          	addi	s2,s2,-788 # 8000e378 <cons>
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
    800086f0:	c8c50513          	addi	a0,a0,-884 # 8000e378 <cons>
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
    80008720:	c5c48493          	addi	s1,s1,-932 # 8000e378 <cons>
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
    80008780:	cb433303          	ld	t1,-844(t1) # 8000e430 <devsw+0x10>
    80008784:	01010113          	addi	sp,sp,16
    80008788:	00030067          	jr	t1

000000008000878c <console_write>:
    8000878c:	ff010113          	addi	sp,sp,-16
    80008790:	00813423          	sd	s0,8(sp)
    80008794:	01010413          	addi	s0,sp,16
    80008798:	00813403          	ld	s0,8(sp)
    8000879c:	00006317          	auipc	t1,0x6
    800087a0:	c9c33303          	ld	t1,-868(t1) # 8000e438 <devsw+0x18>
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
    800087d0:	d007a623          	sw	zero,-756(a5) # 8000e4d8 <pr+0x18>
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
    80008800:	8ef72623          	sw	a5,-1812(a4) # 8000d0e8 <panicked>
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
    80008848:	c7c30313          	addi	t1,t1,-900 # 8000e4c0 <pr>
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
    80008c58:	86c50513          	addi	a0,a0,-1940 # 8000e4c0 <pr>
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
    80008eb4:	61048493          	addi	s1,s1,1552 # 8000e4c0 <pr>
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
    80008f2c:	1c07a783          	lw	a5,448(a5) # 8000d0e8 <panicked>
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
    80008f58:	19c90913          	addi	s2,s2,412 # 8000d0f0 <uart_tx_r>
    80008f5c:	00093783          	ld	a5,0(s2)
    80008f60:	00004497          	auipc	s1,0x4
    80008f64:	19848493          	addi	s1,s1,408 # 8000d0f8 <uart_tx_w>
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
    80008fb4:	53058593          	addi	a1,a1,1328 # 8000e4e0 <uart_tx_buf>
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
    80009030:	0bc72703          	lw	a4,188(a4) # 8000d0e8 <panicked>
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
    80009074:	08060613          	addi	a2,a2,128 # 8000d0f0 <uart_tx_r>
    80009078:	00004517          	auipc	a0,0x4
    8000907c:	08050513          	addi	a0,a0,128 # 8000d0f8 <uart_tx_w>
    80009080:	00063783          	ld	a5,0(a2)
    80009084:	00053703          	ld	a4,0(a0)
    80009088:	04f70263          	beq	a4,a5,800090cc <uartstart+0x68>
    8000908c:	100005b7          	lui	a1,0x10000
    80009090:	00005817          	auipc	a6,0x5
    80009094:	45080813          	addi	a6,a6,1104 # 8000e4e0 <uart_tx_buf>
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
    80009158:	f9c60613          	addi	a2,a2,-100 # 8000d0f0 <uart_tx_r>
    8000915c:	00004517          	auipc	a0,0x4
    80009160:	f9c50513          	addi	a0,a0,-100 # 8000d0f8 <uart_tx_w>
    80009164:	00063783          	ld	a5,0(a2)
    80009168:	00053703          	ld	a4,0(a0)
    8000916c:	04f70263          	beq	a4,a5,800091b0 <uartintr+0xa0>
    80009170:	100005b7          	lui	a1,0x10000
    80009174:	00005817          	auipc	a6,0x5
    80009178:	36c80813          	addi	a6,a6,876 # 8000e4e0 <uart_tx_buf>
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
    800091c8:	f2c60613          	addi	a2,a2,-212 # 8000d0f0 <uart_tx_r>
    800091cc:	00004517          	auipc	a0,0x4
    800091d0:	f2c50513          	addi	a0,a0,-212 # 8000d0f8 <uart_tx_w>
    800091d4:	00063783          	ld	a5,0(a2)
    800091d8:	00053703          	ld	a4,0(a0)
    800091dc:	04f70263          	beq	a4,a5,80009220 <uartintr+0x110>
    800091e0:	100005b7          	lui	a1,0x10000
    800091e4:	00005817          	auipc	a6,0x5
    800091e8:	2fc80813          	addi	a6,a6,764 # 8000e4e0 <uart_tx_buf>
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
    80009238:	2cb48493          	addi	s1,s1,715 # 8000f4ff <end+0xfff>
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
    80009274:	290a8a93          	addi	s5,s5,656 # 8000e500 <end>
    80009278:	0754ec63          	bltu	s1,s5,800092f0 <kinit+0xc8>
    8000927c:	0734fa63          	bgeu	s1,s3,800092f0 <kinit+0xc8>
    80009280:	00088a37          	lui	s4,0x88
    80009284:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80009288:	00004917          	auipc	s2,0x4
    8000928c:	e7890913          	addi	s2,s2,-392 # 8000d100 <kmem>
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
    80009348:	1bca8a93          	addi	s5,s5,444 # 8000e500 <end>
    8000934c:	0954e263          	bltu	s1,s5,800093d0 <freerange+0xd0>
    80009350:	01100993          	li	s3,17
    80009354:	01b99993          	slli	s3,s3,0x1b
    80009358:	0734fc63          	bgeu	s1,s3,800093d0 <freerange+0xd0>
    8000935c:	00058a13          	mv	s4,a1
    80009360:	00004917          	auipc	s2,0x4
    80009364:	da090913          	addi	s2,s2,-608 # 8000d100 <kmem>
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
    80009400:	10478793          	addi	a5,a5,260 # 8000e500 <end>
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
    8000942c:	cd878793          	addi	a5,a5,-808 # 8000d100 <kmem>
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
    80009478:	c8c78793          	addi	a5,a5,-884 # 8000d100 <kmem>
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
    8000950c:	8e4080e7          	jalr	-1820(ra) # 80007dec <mycpu>
    80009510:	07852783          	lw	a5,120(a0)
    80009514:	06078e63          	beqz	a5,80009590 <acquire+0xb4>
    80009518:	fffff097          	auipc	ra,0xfffff
    8000951c:	8d4080e7          	jalr	-1836(ra) # 80007dec <mycpu>
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
    80009550:	8a0080e7          	jalr	-1888(ra) # 80007dec <mycpu>
    80009554:	01813083          	ld	ra,24(sp)
    80009558:	01013403          	ld	s0,16(sp)
    8000955c:	00a4b823          	sd	a0,16(s1)
    80009560:	00013903          	ld	s2,0(sp)
    80009564:	00813483          	ld	s1,8(sp)
    80009568:	02010113          	addi	sp,sp,32
    8000956c:	00008067          	ret
    80009570:	0104b903          	ld	s2,16(s1)
    80009574:	fffff097          	auipc	ra,0xfffff
    80009578:	878080e7          	jalr	-1928(ra) # 80007dec <mycpu>
    8000957c:	faa91ce3          	bne	s2,a0,80009534 <acquire+0x58>
    80009580:	00001517          	auipc	a0,0x1
    80009584:	3a050513          	addi	a0,a0,928 # 8000a920 <digits+0x20>
    80009588:	fffff097          	auipc	ra,0xfffff
    8000958c:	224080e7          	jalr	548(ra) # 800087ac <panic>
    80009590:	00195913          	srli	s2,s2,0x1
    80009594:	fffff097          	auipc	ra,0xfffff
    80009598:	858080e7          	jalr	-1960(ra) # 80007dec <mycpu>
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
    800095e4:	80c080e7          	jalr	-2036(ra) # 80007dec <mycpu>
    800095e8:	fea910e3          	bne	s2,a0,800095c8 <release+0x20>
    800095ec:	0004b823          	sd	zero,16(s1)
    800095f0:	0ff0000f          	fence
    800095f4:	0f50000f          	fence	iorw,ow
    800095f8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800095fc:	ffffe097          	auipc	ra,0xffffe
    80009600:	7f0080e7          	jalr	2032(ra) # 80007dec <mycpu>
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
    8000969c:	754080e7          	jalr	1876(ra) # 80007dec <mycpu>
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
    800096e4:	70c080e7          	jalr	1804(ra) # 80007dec <mycpu>
    800096e8:	07852783          	lw	a5,120(a0)
    800096ec:	02078663          	beqz	a5,80009718 <push_off+0x5c>
    800096f0:	ffffe097          	auipc	ra,0xffffe
    800096f4:	6fc080e7          	jalr	1788(ra) # 80007dec <mycpu>
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
    80009720:	6d0080e7          	jalr	1744(ra) # 80007dec <mycpu>
    80009724:	0014f493          	andi	s1,s1,1
    80009728:	06952e23          	sw	s1,124(a0)
    8000972c:	fc5ff06f          	j	800096f0 <push_off+0x34>

0000000080009730 <pop_off>:
    80009730:	ff010113          	addi	sp,sp,-16
    80009734:	00813023          	sd	s0,0(sp)
    80009738:	00113423          	sd	ra,8(sp)
    8000973c:	01010413          	addi	s0,sp,16
    80009740:	ffffe097          	auipc	ra,0xffffe
    80009744:	6ac080e7          	jalr	1708(ra) # 80007dec <mycpu>
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
    800097d4:	61c080e7          	jalr	1564(ra) # 80007dec <mycpu>
    800097d8:	07852783          	lw	a5,120(a0)
    800097dc:	02078663          	beqz	a5,80009808 <push_on+0x5c>
    800097e0:	ffffe097          	auipc	ra,0xffffe
    800097e4:	60c080e7          	jalr	1548(ra) # 80007dec <mycpu>
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
    80009810:	5e0080e7          	jalr	1504(ra) # 80007dec <mycpu>
    80009814:	0014f493          	andi	s1,s1,1
    80009818:	06952e23          	sw	s1,124(a0)
    8000981c:	fc5ff06f          	j	800097e0 <push_on+0x34>

0000000080009820 <pop_on>:
    80009820:	ff010113          	addi	sp,sp,-16
    80009824:	00813023          	sd	s0,0(sp)
    80009828:	00113423          	sd	ra,8(sp)
    8000982c:	01010413          	addi	s0,sp,16
    80009830:	ffffe097          	auipc	ra,0xffffe
    80009834:	5bc080e7          	jalr	1468(ra) # 80007dec <mycpu>
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
