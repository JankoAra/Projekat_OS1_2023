
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	02013103          	ld	sp,32(sp) # 8000d020 <_GLOBAL_OFFSET_TABLE_+0x58>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	315070ef          	jal	ra,80007b30 <start>

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
    80001084:	631000ef          	jal	ra,80001eb4 <interruptRoutine>

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
    80001430:	c047b783          	ld	a5,-1020(a5) # 8000d030 <_GLOBAL_OFFSET_TABLE_+0x68>
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
    80001644:	00813403          	ld	s0,8(sp)
    80001648:	01010113          	addi	sp,sp,16
    8000164c:	00008067          	ret

0000000080001650 <_ZN8KConsole12initKConsoleEv>:
int KConsole::inputBufferSize = 0;
char KConsole::inputBuffer[];
char KConsole::outputBuffer[];

void KConsole::initKConsole() {
	if (initialized) return;
    80001650:	0000c797          	auipc	a5,0xc
    80001654:	a707c783          	lbu	a5,-1424(a5) # 8000d0c0 <_ZN8KConsole11initializedE>
    80001658:	00078463          	beqz	a5,80001660 <_ZN8KConsole12initKConsoleEv+0x10>
    8000165c:	00008067          	ret
void KConsole::initKConsole() {
    80001660:	fe010113          	addi	sp,sp,-32
    80001664:	00113c23          	sd	ra,24(sp)
    80001668:	00813823          	sd	s0,16(sp)
    8000166c:	00913423          	sd	s1,8(sp)
    80001670:	02010413          	addi	s0,sp,32
	dr = (char*)CONSOLE_RX_DATA;
    80001674:	0000c497          	auipc	s1,0xc
    80001678:	a4c48493          	addi	s1,s1,-1460 # 8000d0c0 <_ZN8KConsole11initializedE>
    8000167c:	0000c797          	auipc	a5,0xc
    80001680:	95c7b783          	ld	a5,-1700(a5) # 8000cfd8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001684:	0007b783          	ld	a5,0(a5)
    80001688:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    8000168c:	0000c797          	auipc	a5,0xc
    80001690:	95c7b783          	ld	a5,-1700(a5) # 8000cfe8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001694:	0007b783          	ld	a5,0(a5)
    80001698:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    8000169c:	05000593          	li	a1,80
    800016a0:	0000c517          	auipc	a0,0xc
    800016a4:	a3850513          	addi	a0,a0,-1480 # 8000d0d8 <_ZN8KConsole19inputBufferHasSpaceE>
    800016a8:	00000097          	auipc	ra,0x0
    800016ac:	e90080e7          	jalr	-368(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016b0:	05000593          	li	a1,80
    800016b4:	0000c517          	auipc	a0,0xc
    800016b8:	a2c50513          	addi	a0,a0,-1492 # 8000d0e0 <_ZN8KConsole20outputBufferHasSpaceE>
    800016bc:	00000097          	auipc	ra,0x0
    800016c0:	e7c080e7          	jalr	-388(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016c4:	00000593          	li	a1,0
    800016c8:	0000c517          	auipc	a0,0xc
    800016cc:	a2050513          	addi	a0,a0,-1504 # 8000d0e8 <_ZN8KConsole12charsToInputE>
    800016d0:	00000097          	auipc	ra,0x0
    800016d4:	e68080e7          	jalr	-408(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    800016d8:	00000593          	li	a1,0
    800016dc:	0000c517          	auipc	a0,0xc
    800016e0:	a1450513          	addi	a0,a0,-1516 # 8000d0f0 <_ZN8KConsole13charsToOutputE>
    800016e4:	00000097          	auipc	ra,0x0
    800016e8:	e54080e7          	jalr	-428(ra) # 80001538 <_Z8sem_openPP4KSemj>
	initialized = true;
    800016ec:	00100793          	li	a5,1
    800016f0:	00f48023          	sb	a5,0(s1)
}
    800016f4:	01813083          	ld	ra,24(sp)
    800016f8:	01013403          	ld	s0,16(sp)
    800016fc:	00813483          	ld	s1,8(sp)
    80001700:	02010113          	addi	sp,sp,32
    80001704:	00008067          	ret

0000000080001708 <_ZN8KConsole13getFromOutputEv>:

char KConsole::getFromOutput() {
    80001708:	fe010113          	addi	sp,sp,-32
    8000170c:	00113c23          	sd	ra,24(sp)
    80001710:	00813823          	sd	s0,16(sp)
    80001714:	00913423          	sd	s1,8(sp)
    80001718:	02010413          	addi	s0,sp,32
	sem_wait(charsToOutput);
    8000171c:	0000c497          	auipc	s1,0xc
    80001720:	9a448493          	addi	s1,s1,-1628 # 8000d0c0 <_ZN8KConsole11initializedE>
    80001724:	0304b503          	ld	a0,48(s1)
    80001728:	00000097          	auipc	ra,0x0
    8000172c:	e78080e7          	jalr	-392(ra) # 800015a0 <_Z8sem_waitP4KSem>
	char c = outputBuffer[outputHead];
    80001730:	0384a783          	lw	a5,56(s1)
    80001734:	00f48733          	add	a4,s1,a5
	outputHead = (outputHead + 1) % capacity;
    80001738:	0017879b          	addiw	a5,a5,1
    8000173c:	05000693          	li	a3,80
    80001740:	02d7e7bb          	remw	a5,a5,a3
    80001744:	02f4ac23          	sw	a5,56(s1)
	return c;
}
    80001748:	04074503          	lbu	a0,64(a4)
    8000174c:	01813083          	ld	ra,24(sp)
    80001750:	01013403          	ld	s0,16(sp)
    80001754:	00813483          	ld	s1,8(sp)
    80001758:	02010113          	addi	sp,sp,32
    8000175c:	00008067          	ret

0000000080001760 <_ZN8KConsole12placeInInputEc>:

void KConsole::placeInInput(char c) {
	if (inputBufferSize == capacity) return;
    80001760:	0000c717          	auipc	a4,0xc
    80001764:	9f072703          	lw	a4,-1552(a4) # 8000d150 <_ZN8KConsole15inputBufferSizeE>
    80001768:	05000793          	li	a5,80
    8000176c:	04f70e63          	beq	a4,a5,800017c8 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    80001770:	ff010113          	addi	sp,sp,-16
    80001774:	00113423          	sd	ra,8(sp)
    80001778:	00813023          	sd	s0,0(sp)
    8000177c:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    80001780:	0000c697          	auipc	a3,0xc
    80001784:	94068693          	addi	a3,a3,-1728 # 8000d0c0 <_ZN8KConsole11initializedE>
    80001788:	0946a783          	lw	a5,148(a3)
    8000178c:	00f68633          	add	a2,a3,a5
    80001790:	08a60c23          	sb	a0,152(a2)
	inputTail = (inputTail + 1) % capacity;
    80001794:	0017879b          	addiw	a5,a5,1
    80001798:	05000613          	li	a2,80
    8000179c:	02c7e7bb          	remw	a5,a5,a2
    800017a0:	08f6aa23          	sw	a5,148(a3)
	inputBufferSize++;
    800017a4:	0017071b          	addiw	a4,a4,1
    800017a8:	08e6a823          	sw	a4,144(a3)
	sem_signal(charsToInput);
    800017ac:	0286b503          	ld	a0,40(a3)
    800017b0:	00000097          	auipc	ra,0x0
    800017b4:	e20080e7          	jalr	-480(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    800017b8:	00813083          	ld	ra,8(sp)
    800017bc:	00013403          	ld	s0,0(sp)
    800017c0:	01010113          	addi	sp,sp,16
    800017c4:	00008067          	ret
    800017c8:	00008067          	ret

00000000800017cc <_ZN8KConsole5kputcEc>:

void KConsole::kputc(char c) {
    800017cc:	fe010113          	addi	sp,sp,-32
    800017d0:	00113c23          	sd	ra,24(sp)
    800017d4:	00813823          	sd	s0,16(sp)
    800017d8:	00913423          	sd	s1,8(sp)
    800017dc:	01213023          	sd	s2,0(sp)
    800017e0:	02010413          	addi	s0,sp,32
    800017e4:	00050913          	mv	s2,a0
	sem_wait(outputBufferHasSpace);
    800017e8:	0000c497          	auipc	s1,0xc
    800017ec:	8d848493          	addi	s1,s1,-1832 # 8000d0c0 <_ZN8KConsole11initializedE>
    800017f0:	0204b503          	ld	a0,32(s1)
    800017f4:	00000097          	auipc	ra,0x0
    800017f8:	dac080e7          	jalr	-596(ra) # 800015a0 <_Z8sem_waitP4KSem>
	outputBuffer[outputTail] = c;
    800017fc:	0e84a783          	lw	a5,232(s1)
    80001800:	00f48733          	add	a4,s1,a5
    80001804:	05270023          	sb	s2,64(a4)
	outputTail = (outputTail + 1) % capacity;
    80001808:	0017879b          	addiw	a5,a5,1
    8000180c:	05000713          	li	a4,80
    80001810:	02e7e7bb          	remw	a5,a5,a4
    80001814:	0ef4a423          	sw	a5,232(s1)
	sem_signal(charsToOutput);
    80001818:	0304b503          	ld	a0,48(s1)
    8000181c:	00000097          	auipc	ra,0x0
    80001820:	db4080e7          	jalr	-588(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80001824:	01813083          	ld	ra,24(sp)
    80001828:	01013403          	ld	s0,16(sp)
    8000182c:	00813483          	ld	s1,8(sp)
    80001830:	00013903          	ld	s2,0(sp)
    80001834:	02010113          	addi	sp,sp,32
    80001838:	00008067          	ret

000000008000183c <_ZN8KConsole5kgetcEv>:

char KConsole::kgetc() {
    8000183c:	fe010113          	addi	sp,sp,-32
    80001840:	00113c23          	sd	ra,24(sp)
    80001844:	00813823          	sd	s0,16(sp)
    80001848:	00913423          	sd	s1,8(sp)
    8000184c:	02010413          	addi	s0,sp,32
	sem_wait(charsToInput);
    80001850:	0000c497          	auipc	s1,0xc
    80001854:	87048493          	addi	s1,s1,-1936 # 8000d0c0 <_ZN8KConsole11initializedE>
    80001858:	0284b503          	ld	a0,40(s1)
    8000185c:	00000097          	auipc	ra,0x0
    80001860:	d44080e7          	jalr	-700(ra) # 800015a0 <_Z8sem_waitP4KSem>
	char c = inputBuffer[inputHead];
    80001864:	0ec4a783          	lw	a5,236(s1)
    80001868:	00f48733          	add	a4,s1,a5
	inputHead = (inputHead + 1) % capacity;
    8000186c:	0017879b          	addiw	a5,a5,1
    80001870:	05000693          	li	a3,80
    80001874:	02d7e7bb          	remw	a5,a5,a3
    80001878:	0ef4a623          	sw	a5,236(s1)
	inputBufferSize--;
    8000187c:	0904a783          	lw	a5,144(s1)
    80001880:	fff7879b          	addiw	a5,a5,-1
    80001884:	08f4a823          	sw	a5,144(s1)
	return c;
}
    80001888:	09874503          	lbu	a0,152(a4)
    8000188c:	01813083          	ld	ra,24(sp)
    80001890:	01013403          	ld	s0,16(sp)
    80001894:	00813483          	ld	s1,8(sp)
    80001898:	02010113          	addi	sp,sp,32
    8000189c:	00008067          	ret

00000000800018a0 <_ZN9Scheduler3putEP3TCB>:

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    800018a0:	ff010113          	addi	sp,sp,-16
    800018a4:	00813423          	sd	s0,8(sp)
    800018a8:	01010413          	addi	s0,sp,16
    if (tail == nullptr) {
    800018ac:	0000c797          	auipc	a5,0xc
    800018b0:	9047b783          	ld	a5,-1788(a5) # 8000d1b0 <_ZN9Scheduler4tailE>
    800018b4:	02078263          	beqz	a5,800018d8 <_ZN9Scheduler3putEP3TCB+0x38>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    800018b8:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    800018bc:	0000c797          	auipc	a5,0xc
    800018c0:	8ea7ba23          	sd	a0,-1804(a5) # 8000d1b0 <_ZN9Scheduler4tailE>
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    static TCB* createThread(Body function, void* args, uint64* stack);

    void setStatus(ThreadStatus stat) { this->status = stat; }
    800018c4:	00100793          	li	a5,1
    800018c8:	04f52c23          	sw	a5,88(a0)
    }
    tcb->setStatus(TCB::ACTIVE);
}
    800018cc:	00813403          	ld	s0,8(sp)
    800018d0:	01010113          	addi	sp,sp,16
    800018d4:	00008067          	ret
        head = tail = tcb;
    800018d8:	0000c797          	auipc	a5,0xc
    800018dc:	8d878793          	addi	a5,a5,-1832 # 8000d1b0 <_ZN9Scheduler4tailE>
    800018e0:	00a7b023          	sd	a0,0(a5)
    800018e4:	00a7b423          	sd	a0,8(a5)
    800018e8:	fddff06f          	j	800018c4 <_ZN9Scheduler3putEP3TCB+0x24>

00000000800018ec <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    800018ec:	ff010113          	addi	sp,sp,-16
    800018f0:	00813423          	sd	s0,8(sp)
    800018f4:	01010413          	addi	s0,sp,16
    TCB* firstThread = head;
    800018f8:	0000c717          	auipc	a4,0xc
    800018fc:	8b870713          	addi	a4,a4,-1864 # 8000d1b0 <_ZN9Scheduler4tailE>
    80001900:	00873503          	ld	a0,8(a4)
    head = head->nextInScheduler;
    80001904:	03053783          	ld	a5,48(a0)
    80001908:	00f73423          	sd	a5,8(a4)
    if (head == nullptr) {
    8000190c:	00078a63          	beqz	a5,80001920 <_ZN9Scheduler3getEv+0x34>
        tail = head = nullptr;
    }
    firstThread->nextInScheduler = nullptr;
    80001910:	02053823          	sd	zero,48(a0)
    return firstThread;
}
    80001914:	00813403          	ld	s0,8(sp)
    80001918:	01010113          	addi	sp,sp,16
    8000191c:	00008067          	ret
        tail = head = nullptr;
    80001920:	00073423          	sd	zero,8(a4)
    80001924:	00073023          	sd	zero,0(a4)
    80001928:	fe9ff06f          	j	80001910 <_ZN9Scheduler3getEv+0x24>

000000008000192c <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    8000192c:	ff010113          	addi	sp,sp,-16
    80001930:	00813423          	sd	s0,8(sp)
    80001934:	01010413          	addi	s0,sp,16
    tcb->status = TCB::SLEEPING;
    80001938:	00400793          	li	a5,4
    8000193c:	04f52c23          	sw	a5,88(a0)
    if (sleepingHead == nullptr) {
    80001940:	0000c817          	auipc	a6,0xc
    80001944:	88083803          	ld	a6,-1920(a6) # 8000d1c0 <_ZN9Scheduler12sleepingHeadE>
    80001948:	02080863          	beqz	a6,80001978 <_ZN9Scheduler10putToSleepEP3TCBm+0x4c>
        tcb->timeToSleep = sleepTime;
        return;
    }
    TCB* prevSleeping = nullptr;
    time_t accumulated = 0;
    TCB* current = sleepingHead;
    8000194c:	00080793          	mv	a5,a6
    time_t accumulated = 0;
    80001950:	00000693          	li	a3,0
    TCB* prevSleeping = nullptr;
    80001954:	00000613          	li	a2,0
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001958:	02078863          	beqz	a5,80001988 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
    8000195c:	0387b703          	ld	a4,56(a5)
    80001960:	00d70733          	add	a4,a4,a3
    80001964:	02b77263          	bgeu	a4,a1,80001988 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
        accumulated += current->timeToSleep;
    80001968:	00070693          	mv	a3,a4
        prevSleeping = current;
    8000196c:	00078613          	mv	a2,a5
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001970:	0407b783          	ld	a5,64(a5)
    80001974:	fe5ff06f          	j	80001958 <_ZN9Scheduler10putToSleepEP3TCBm+0x2c>
        sleepingHead = tcb;
    80001978:	0000c797          	auipc	a5,0xc
    8000197c:	84a7b423          	sd	a0,-1976(a5) # 8000d1c0 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80001980:	02b53c23          	sd	a1,56(a0)
        return;
    80001984:	02c0006f          	j	800019b0 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    }
    if (!prevSleeping) {
    80001988:	02060a63          	beqz	a2,800019bc <_ZN9Scheduler10putToSleepEP3TCBm+0x90>
        sleepingHead = tcb;
        tcb->timeToSleep = sleepTime;
        tcb->nextSleeping->timeToSleep -= sleepTime;
        return;
    }
    tcb->nextSleeping = current;
    8000198c:	04f53023          	sd	a5,64(a0)
    prevSleeping->nextSleeping = tcb;
    80001990:	04a63023          	sd	a0,64(a2)
    tcb->timeToSleep = sleepTime - accumulated;
    80001994:	40d58733          	sub	a4,a1,a3
    80001998:	02e53c23          	sd	a4,56(a0)
    if (current) current->timeToSleep -= sleepTime - accumulated;
    8000199c:	00078a63          	beqz	a5,800019b0 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    800019a0:	40b686b3          	sub	a3,a3,a1
    800019a4:	0387b703          	ld	a4,56(a5)
    800019a8:	00d706b3          	add	a3,a4,a3
    800019ac:	02d7bc23          	sd	a3,56(a5)
}
    800019b0:	00813403          	ld	s0,8(sp)
    800019b4:	01010113          	addi	sp,sp,16
    800019b8:	00008067          	ret
        tcb->nextSleeping = sleepingHead;
    800019bc:	05053023          	sd	a6,64(a0)
        sleepingHead = tcb;
    800019c0:	0000c797          	auipc	a5,0xc
    800019c4:	80a7b023          	sd	a0,-2048(a5) # 8000d1c0 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    800019c8:	02b53c23          	sd	a1,56(a0)
        tcb->nextSleeping->timeToSleep -= sleepTime;
    800019cc:	03883683          	ld	a3,56(a6)
    800019d0:	40b686b3          	sub	a3,a3,a1
    800019d4:	02d83c23          	sd	a3,56(a6)
        return;
    800019d8:	fd9ff06f          	j	800019b0 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>

00000000800019dc <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
    if (!sleepingHead) return;
    800019dc:	0000b797          	auipc	a5,0xb
    800019e0:	7e47b783          	ld	a5,2020(a5) # 8000d1c0 <_ZN9Scheduler12sleepingHeadE>
    800019e4:	06078a63          	beqz	a5,80001a58 <_ZN9Scheduler4wakeEv+0x7c>
    sleepingHead->timeToSleep--;
    800019e8:	0387b703          	ld	a4,56(a5)
    800019ec:	fff70713          	addi	a4,a4,-1
    800019f0:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    800019f4:	0000b517          	auipc	a0,0xb
    800019f8:	7cc53503          	ld	a0,1996(a0) # 8000d1c0 <_ZN9Scheduler12sleepingHeadE>
    800019fc:	04050e63          	beqz	a0,80001a58 <_ZN9Scheduler4wakeEv+0x7c>
    80001a00:	03853783          	ld	a5,56(a0)
    80001a04:	04079a63          	bnez	a5,80001a58 <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    80001a08:	ff010113          	addi	sp,sp,-16
    80001a0c:	00113423          	sd	ra,8(sp)
    80001a10:	00813023          	sd	s0,0(sp)
    80001a14:	01010413          	addi	s0,sp,16
    80001a18:	00c0006f          	j	80001a24 <_ZN9Scheduler4wakeEv+0x48>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001a1c:	03853783          	ld	a5,56(a0)
    80001a20:	02079463          	bnez	a5,80001a48 <_ZN9Scheduler4wakeEv+0x6c>
        TCB* thread = sleepingHead;
        sleepingHead = sleepingHead->nextSleeping;
    80001a24:	04053783          	ld	a5,64(a0)
    80001a28:	0000b717          	auipc	a4,0xb
    80001a2c:	78f73c23          	sd	a5,1944(a4) # 8000d1c0 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    80001a30:	04053023          	sd	zero,64(a0)
        Scheduler::put(thread);
    80001a34:	00000097          	auipc	ra,0x0
    80001a38:	e6c080e7          	jalr	-404(ra) # 800018a0 <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001a3c:	0000b517          	auipc	a0,0xb
    80001a40:	78453503          	ld	a0,1924(a0) # 8000d1c0 <_ZN9Scheduler12sleepingHeadE>
    80001a44:	fc051ce3          	bnez	a0,80001a1c <_ZN9Scheduler4wakeEv+0x40>
    }
}
    80001a48:	00813083          	ld	ra,8(sp)
    80001a4c:	00013403          	ld	s0,0(sp)
    80001a50:	01010113          	addi	sp,sp,16
    80001a54:	00008067          	ret
    80001a58:	00008067          	ret

0000000080001a5c <_ZN7KMemory7kmallocEm>:
    kmalloc(blocksForBitVector);

    initialized = true;
}

void* KMemory::kmalloc(size_t size) {
    80001a5c:	ff010113          	addi	sp,sp,-16
    80001a60:	00813423          	sd	s0,8(sp)
    80001a64:	01010413          	addi	s0,sp,16
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80001a68:	16050063          	beqz	a0,80001bc8 <_ZN7KMemory7kmallocEm+0x16c>
    80001a6c:	0000b797          	auipc	a5,0xb
    80001a70:	75c7b783          	ld	a5,1884(a5) # 8000d1c8 <_ZN7KMemory14freeBlocksLeftE>
    80001a74:	14a7ee63          	bltu	a5,a0,80001bd0 <_ZN7KMemory7kmallocEm+0x174>
    uint64 currentElem = 0;
    uint64 currentBit = 63;
    uint64 firstZeroElem = 0;
    uint64 firstZeroBit = 63;
    uint64 zerosFound = 0;
    bool zeroFound = false;
    80001a78:	00000313          	li	t1,0
    uint64 zerosFound = 0;
    80001a7c:	00000713          	li	a4,0
    uint64 firstZeroBit = 63;
    80001a80:	03f00813          	li	a6,63
    uint64 firstZeroElem = 0;
    80001a84:	00000893          	li	a7,0
    uint64 currentBit = 63;
    80001a88:	03f00793          	li	a5,63
    uint64 currentElem = 0;
    80001a8c:	00000593          	li	a1,0
    80001a90:	0080006f          	j	80001a98 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroElem = currentElem;
        } else {
            zerosFound++;
        }
        if (zerosFound == size) break;
        if (currentBit-- == 0) {
    80001a94:	00068793          	mv	a5,a3
    while (currentElem < sizeOfBitVectorInUint64) {
    80001a98:	0000b697          	auipc	a3,0xb
    80001a9c:	7386b683          	ld	a3,1848(a3) # 8000d1d0 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001aa0:	08d5fa63          	bgeu	a1,a3,80001b34 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001aa4:	03f00693          	li	a3,63
    80001aa8:	02d78a63          	beq	a5,a3,80001adc <_ZN7KMemory7kmallocEm+0x80>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    80001aac:	00359693          	slli	a3,a1,0x3
    80001ab0:	0000b617          	auipc	a2,0xb
    80001ab4:	72863603          	ld	a2,1832(a2) # 8000d1d8 <_ZN7KMemory9bitVectorE>
    80001ab8:	00d606b3          	add	a3,a2,a3
    80001abc:	0006b683          	ld	a3,0(a3)

    static uint64 freeBlocksLeft;

    //maska sa 1 na mestu bitPos i ostalim nulama (bitPos=0..63)
    inline static uint64 maskBit(uint64 bitPos) {
        return (uint64)1 << bitPos;
    80001ac0:	00100613          	li	a2,1
    80001ac4:	00f61633          	sll	a2,a2,a5
    80001ac8:	00c6f6b3          	and	a3,a3,a2
        if (bit > 0) {
    80001acc:	02069a63          	bnez	a3,80001b00 <_ZN7KMemory7kmallocEm+0xa4>
        } else if (!zeroFound) {
    80001ad0:	04030863          	beqz	t1,80001b20 <_ZN7KMemory7kmallocEm+0xc4>
            zerosFound++;
    80001ad4:	00170713          	addi	a4,a4,1
    80001ad8:	0300006f          	j	80001b08 <_ZN7KMemory7kmallocEm+0xac>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001adc:	00359693          	slli	a3,a1,0x3
    80001ae0:	0000b617          	auipc	a2,0xb
    80001ae4:	6f863603          	ld	a2,1784(a2) # 8000d1d8 <_ZN7KMemory9bitVectorE>
    80001ae8:	00d606b3          	add	a3,a2,a3
    80001aec:	0006b603          	ld	a2,0(a3)
    80001af0:	fff00693          	li	a3,-1
    80001af4:	fad61ce3          	bne	a2,a3,80001aac <_ZN7KMemory7kmallocEm+0x50>
            currentElem++;
    80001af8:	00158593          	addi	a1,a1,1
            continue;
    80001afc:	f9dff06f          	j	80001a98 <_ZN7KMemory7kmallocEm+0x3c>
            zeroFound = false;
    80001b00:	00000313          	li	t1,0
            zerosFound = 0;
    80001b04:	00000713          	li	a4,0
        if (zerosFound == size) break;
    80001b08:	02a70663          	beq	a4,a0,80001b34 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit-- == 0) {
    80001b0c:	fff78693          	addi	a3,a5,-1
    80001b10:	f80792e3          	bnez	a5,80001a94 <_ZN7KMemory7kmallocEm+0x38>
            currentBit = 63;
            currentElem++;
    80001b14:	00158593          	addi	a1,a1,1
            currentBit = 63;
    80001b18:	03f00793          	li	a5,63
    80001b1c:	f7dff06f          	j	80001a98 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroBit = currentBit;
    80001b20:	00078813          	mv	a6,a5
            firstZeroElem = currentElem;
    80001b24:	00058893          	mv	a7,a1
            zeroFound = true;
    80001b28:	00100313          	li	t1,1
            zerosFound = 1;
    80001b2c:	00100713          	li	a4,1
    80001b30:	fd9ff06f          	j	80001b08 <_ZN7KMemory7kmallocEm+0xac>
        }
    }
    if (zerosFound != size) return nullptr;
    80001b34:	0aa71263          	bne	a4,a0,80001bd8 <_ZN7KMemory7kmallocEm+0x17c>

    //alociranje blokova
    uint64 blockNum = firstZeroElem * 64 + (63 - firstZeroBit);
    80001b38:	00689793          	slli	a5,a7,0x6
    80001b3c:	410787b3          	sub	a5,a5,a6
    80001b40:	03f78793          	addi	a5,a5,63
    void* addr = (char*)HEAP_START_ADDR + blockNum * MEM_BLOCK_SIZE;
    80001b44:	0000b697          	auipc	a3,0xb
    80001b48:	4b46b683          	ld	a3,1204(a3) # 8000cff8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001b4c:	0006b583          	ld	a1,0(a3)
    80001b50:	00679793          	slli	a5,a5,0x6
    80001b54:	00f585b3          	add	a1,a1,a5
    *(uint64*)addr = size;  //da znamo koliko blokova je alocirano zaredom
    80001b58:	00a5b023          	sd	a0,0(a1)

    //upisivanje 1 u bit vektor
    currentElem = firstZeroElem;
    currentBit = firstZeroBit;
    80001b5c:	0080006f          	j	80001b64 <_ZN7KMemory7kmallocEm+0x108>
    while (zerosFound > 0) {
        bitVector[currentElem] |= maskBit(currentBit);
        zerosFound--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001b60:	00078813          	mv	a6,a5
    while (zerosFound > 0) {
    80001b64:	04070063          	beqz	a4,80001ba4 <_ZN7KMemory7kmallocEm+0x148>
    80001b68:	00100693          	li	a3,1
    80001b6c:	01069633          	sll	a2,a3,a6
        bitVector[currentElem] |= maskBit(currentBit);
    80001b70:	00389793          	slli	a5,a7,0x3
    80001b74:	0000b697          	auipc	a3,0xb
    80001b78:	6646b683          	ld	a3,1636(a3) # 8000d1d8 <_ZN7KMemory9bitVectorE>
    80001b7c:	00f687b3          	add	a5,a3,a5
    80001b80:	0007b683          	ld	a3,0(a5)
    80001b84:	00c6e6b3          	or	a3,a3,a2
    80001b88:	00d7b023          	sd	a3,0(a5)
        zerosFound--;
    80001b8c:	fff70713          	addi	a4,a4,-1
        if (currentBit-- == 0) {
    80001b90:	fff80793          	addi	a5,a6,-1
    80001b94:	fc0816e3          	bnez	a6,80001b60 <_ZN7KMemory7kmallocEm+0x104>
            currentElem++;
    80001b98:	00188893          	addi	a7,a7,1
            currentBit = 63;
    80001b9c:	03f00793          	li	a5,63
    80001ba0:	fc1ff06f          	j	80001b60 <_ZN7KMemory7kmallocEm+0x104>
        }
    }
    freeBlocksLeft -= size;
    80001ba4:	0000b717          	auipc	a4,0xb
    80001ba8:	62470713          	addi	a4,a4,1572 # 8000d1c8 <_ZN7KMemory14freeBlocksLeftE>
    80001bac:	00073783          	ld	a5,0(a4)
    80001bb0:	40a78533          	sub	a0,a5,a0
    80001bb4:	00a73023          	sd	a0,0(a4)
    return (char*)addr + 2 * sizeof(uint64);    //offset 2 da bi bilo zaokruzeno na 16 zbog steka
    80001bb8:	01058513          	addi	a0,a1,16
}
    80001bbc:	00813403          	ld	s0,8(sp)
    80001bc0:	01010113          	addi	sp,sp,16
    80001bc4:	00008067          	ret
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80001bc8:	00000513          	li	a0,0
    80001bcc:	ff1ff06f          	j	80001bbc <_ZN7KMemory7kmallocEm+0x160>
    80001bd0:	00000513          	li	a0,0
    80001bd4:	fe9ff06f          	j	80001bbc <_ZN7KMemory7kmallocEm+0x160>
    if (zerosFound != size) return nullptr;
    80001bd8:	00000513          	li	a0,0
    80001bdc:	fe1ff06f          	j	80001bbc <_ZN7KMemory7kmallocEm+0x160>

0000000080001be0 <_ZN7KMemory16initializeMemoryEv>:
    if (initialized) return;
    80001be0:	0000b797          	auipc	a5,0xb
    80001be4:	6007c783          	lbu	a5,1536(a5) # 8000d1e0 <_ZN7KMemory11initializedE>
    80001be8:	0a079863          	bnez	a5,80001c98 <_ZN7KMemory16initializeMemoryEv+0xb8>
void KMemory::initializeMemory() {
    80001bec:	ff010113          	addi	sp,sp,-16
    80001bf0:	00113423          	sd	ra,8(sp)
    80001bf4:	00813023          	sd	s0,0(sp)
    80001bf8:	01010413          	addi	s0,sp,16
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001bfc:	0000b797          	auipc	a5,0xb
    80001c00:	44c7b783          	ld	a5,1100(a5) # 8000d048 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001c04:	0007b783          	ld	a5,0(a5)
    80001c08:	0000b717          	auipc	a4,0xb
    80001c0c:	3f073703          	ld	a4,1008(a4) # 8000cff8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001c10:	00073603          	ld	a2,0(a4)
    80001c14:	40c787b3          	sub	a5,a5,a2
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    80001c18:	00c7d793          	srli	a5,a5,0xc
    80001c1c:	0000b717          	auipc	a4,0xb
    80001c20:	5ac70713          	addi	a4,a4,1452 # 8000d1c8 <_ZN7KMemory14freeBlocksLeftE>
    80001c24:	00f73423          	sd	a5,8(a4)
    numOfBlocks = sizeOfBitVectorInUint64 * sizeof(uint64) * 8; //da se zaokruzi broj postojecih blokova na umnozak 64
    80001c28:	00679693          	slli	a3,a5,0x6
    80001c2c:	02d73023          	sd	a3,32(a4)
    uint64 blocksForBitVector = (sizeOfBitVectorInUint64 * sizeof(uint64) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80001c30:	00878513          	addi	a0,a5,8
    80001c34:	00351513          	slli	a0,a0,0x3
    80001c38:	fff50513          	addi	a0,a0,-1
    80001c3c:	00655513          	srli	a0,a0,0x6
    bitVector = (uint64*)HEAP_START_ADDR;
    80001c40:	00c73823          	sd	a2,16(a4)
    freeBlocksLeft = numOfBlocks;
    80001c44:	00d73023          	sd	a3,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001c48:	00000793          	li	a5,0
    80001c4c:	0000b717          	auipc	a4,0xb
    80001c50:	58473703          	ld	a4,1412(a4) # 8000d1d0 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001c54:	02e7f063          	bgeu	a5,a4,80001c74 <_ZN7KMemory16initializeMemoryEv+0x94>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    80001c58:	00379693          	slli	a3,a5,0x3
    80001c5c:	0000b717          	auipc	a4,0xb
    80001c60:	57c73703          	ld	a4,1404(a4) # 8000d1d8 <_ZN7KMemory9bitVectorE>
    80001c64:	00d70733          	add	a4,a4,a3
    80001c68:	00073023          	sd	zero,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001c6c:	00178793          	addi	a5,a5,1
    80001c70:	fddff06f          	j	80001c4c <_ZN7KMemory16initializeMemoryEv+0x6c>
    kmalloc(blocksForBitVector);
    80001c74:	00000097          	auipc	ra,0x0
    80001c78:	de8080e7          	jalr	-536(ra) # 80001a5c <_ZN7KMemory7kmallocEm>
    initialized = true;
    80001c7c:	00100793          	li	a5,1
    80001c80:	0000b717          	auipc	a4,0xb
    80001c84:	56f70023          	sb	a5,1376(a4) # 8000d1e0 <_ZN7KMemory11initializedE>
}
    80001c88:	00813083          	ld	ra,8(sp)
    80001c8c:	00013403          	ld	s0,0(sp)
    80001c90:	01010113          	addi	sp,sp,16
    80001c94:	00008067          	ret
    80001c98:	00008067          	ret

0000000080001c9c <_ZN7KMemory5kfreeEPv>:

int KMemory::kfree(void* ptr) {
    80001c9c:	ff010113          	addi	sp,sp,-16
    80001ca0:	00813423          	sd	s0,8(sp)
    80001ca4:	01010413          	addi	s0,sp,16
    if (!ptr) return 0;
    80001ca8:	08050a63          	beqz	a0,80001d3c <_ZN7KMemory5kfreeEPv+0xa0>
    ptr = (char*)ptr - 2 * sizeof(uint64);
    80001cac:	ff050793          	addi	a5,a0,-16
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001cb0:	0000b717          	auipc	a4,0xb
    80001cb4:	34873703          	ld	a4,840(a4) # 8000cff8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001cb8:	00073703          	ld	a4,0(a4)
    80001cbc:	40e787b3          	sub	a5,a5,a4
    80001cc0:	03f7f713          	andi	a4,a5,63
    80001cc4:	08071063          	bnez	a4,80001d44 <_ZN7KMemory5kfreeEPv+0xa8>
    uint64 blocksToFree = *(uint64*)ptr;
    80001cc8:	ff053583          	ld	a1,-16(a0)
    freeBlocksLeft += blocksToFree;
    80001ccc:	0000b697          	auipc	a3,0xb
    80001cd0:	4fc68693          	addi	a3,a3,1276 # 8000d1c8 <_ZN7KMemory14freeBlocksLeftE>
    80001cd4:	0006b703          	ld	a4,0(a3)
    80001cd8:	00b70733          	add	a4,a4,a1
    80001cdc:	00e6b023          	sd	a4,0(a3)
    uint64 blockNum = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    80001ce0:	0067d613          	srli	a2,a5,0x6
    uint64 currentElem = blockNum / 64;
    80001ce4:	00c7d513          	srli	a0,a5,0xc
    uint64 currentBit = 63 - blockNum % 64;
    80001ce8:	fff64613          	not	a2,a2
    80001cec:	03f67613          	andi	a2,a2,63
    80001cf0:	0080006f          	j	80001cf8 <_ZN7KMemory5kfreeEPv+0x5c>
    while (blocksToFree > 0) {
        bitVector[currentElem] &= ~maskBit(currentBit);
        blocksToFree--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001cf4:	00078613          	mv	a2,a5
    while (blocksToFree > 0) {
    80001cf8:	04058a63          	beqz	a1,80001d4c <_ZN7KMemory5kfreeEPv+0xb0>
    80001cfc:	00100793          	li	a5,1
    80001d00:	00c797b3          	sll	a5,a5,a2
        bitVector[currentElem] &= ~maskBit(currentBit);
    80001d04:	fff7c793          	not	a5,a5
    80001d08:	00351713          	slli	a4,a0,0x3
    80001d0c:	0000b697          	auipc	a3,0xb
    80001d10:	4cc6b683          	ld	a3,1228(a3) # 8000d1d8 <_ZN7KMemory9bitVectorE>
    80001d14:	00e68733          	add	a4,a3,a4
    80001d18:	00073683          	ld	a3,0(a4)
    80001d1c:	00f6f7b3          	and	a5,a3,a5
    80001d20:	00f73023          	sd	a5,0(a4)
        blocksToFree--;
    80001d24:	fff58593          	addi	a1,a1,-1
        if (currentBit-- == 0) {
    80001d28:	fff60793          	addi	a5,a2,-1
    80001d2c:	fc0614e3          	bnez	a2,80001cf4 <_ZN7KMemory5kfreeEPv+0x58>
            currentElem++;
    80001d30:	00150513          	addi	a0,a0,1
            currentBit = 63;
    80001d34:	03f00793          	li	a5,63
    80001d38:	fbdff06f          	j	80001cf4 <_ZN7KMemory5kfreeEPv+0x58>
    if (!ptr) return 0;
    80001d3c:	00000513          	li	a0,0
    80001d40:	0100006f          	j	80001d50 <_ZN7KMemory5kfreeEPv+0xb4>
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001d44:	fff00513          	li	a0,-1
    80001d48:	0080006f          	j	80001d50 <_ZN7KMemory5kfreeEPv+0xb4>
        }
    }
    return 0;
    80001d4c:	00000513          	li	a0,0
}
    80001d50:	00813403          	ld	s0,8(sp)
    80001d54:	01010113          	addi	sp,sp,16
    80001d58:	00008067          	ret

0000000080001d5c <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80001d5c:	ff010113          	addi	sp,sp,-16
    80001d60:	00113423          	sd	ra,8(sp)
    80001d64:	00813023          	sd	s0,0(sp)
    80001d68:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80001d6c:	fffff097          	auipc	ra,0xfffff
    80001d70:	754080e7          	jalr	1876(ra) # 800014c0 <_Z15thread_dispatchv>
    80001d74:	ff9ff06f          	j	80001d6c <_Z4idlePv+0x10>

0000000080001d78 <_Z22kernelConsumerFunctionPv>:
}

//salje na izlaz karakter iz izlaznog bafera KConsole
void kernelConsumerFunction(void*) {
    80001d78:	ff010113          	addi	sp,sp,-16
    80001d7c:	00113423          	sd	ra,8(sp)
    80001d80:	00813023          	sd	s0,0(sp)
    80001d84:	01010413          	addi	s0,sp,16
    80001d88:	0280006f          	j	80001db0 <_Z22kernelConsumerFunctionPv+0x38>

    static uint8 getSRvalue() { return *sr; }

    static uint8 getDRvalue() { return *dr; }

    static void setDRvalue(char c) { *dr = c; }
    80001d8c:	0000b797          	auipc	a5,0xb
    80001d90:	29c7b783          	ld	a5,668(a5) # 8000d028 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001d94:	0007b783          	ld	a5,0(a5)
    80001d98:	00a78023          	sb	a0,0(a5)
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
        KConsole::setDRvalue(c);
        sem_signal(KConsole::getOutputBufferHasSpace());
    80001d9c:	0000b797          	auipc	a5,0xb
    80001da0:	29c7b783          	ld	a5,668(a5) # 8000d038 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001da4:	0007b503          	ld	a0,0(a5)
    80001da8:	00000097          	auipc	ra,0x0
    80001dac:	828080e7          	jalr	-2008(ra) # 800015d0 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001db0:	00000097          	auipc	ra,0x0
    80001db4:	958080e7          	jalr	-1704(ra) # 80001708 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    80001db8:	0000b797          	auipc	a5,0xb
    80001dbc:	2b87b783          	ld	a5,696(a5) # 8000d070 <_GLOBAL_OFFSET_TABLE_+0xa8>
    80001dc0:	0007b783          	ld	a5,0(a5)
    80001dc4:	0007c783          	lbu	a5,0(a5)
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80001dc8:	0207f793          	andi	a5,a5,32
    80001dcc:	fe0786e3          	beqz	a5,80001db8 <_Z22kernelConsumerFunctionPv+0x40>
    80001dd0:	fbdff06f          	j	80001d8c <_Z22kernelConsumerFunctionPv+0x14>

0000000080001dd4 <main>:
    }
}

int main() {
    80001dd4:	fc010113          	addi	sp,sp,-64
    80001dd8:	02113c23          	sd	ra,56(sp)
    80001ddc:	02813823          	sd	s0,48(sp)
    80001de0:	02913423          	sd	s1,40(sp)
    80001de4:	04010413          	addi	s0,sp,64
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001de8:	0000b797          	auipc	a5,0xb
    80001dec:	2687b783          	ld	a5,616(a5) # 8000d050 <_GLOBAL_OFFSET_TABLE_+0x88>
    80001df0:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80001df4:	00000097          	auipc	ra,0x0
    80001df8:	dec080e7          	jalr	-532(ra) # 80001be0 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001dfc:	00000097          	auipc	ra,0x0
    80001e00:	854080e7          	jalr	-1964(ra) # 80001650 <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    80001e04:	00000613          	li	a2,0
    80001e08:	00000597          	auipc	a1,0x0
    80001e0c:	fcc58593          	addi	a1,a1,-52 # 80001dd4 <main>
    80001e10:	fd840513          	addi	a0,s0,-40
    80001e14:	fffff097          	auipc	ra,0xfffff
    80001e18:	5f0080e7          	jalr	1520(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80001e1c:	fd843783          	ld	a5,-40(s0)

    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }
    80001e20:	0000b717          	auipc	a4,0xb
    80001e24:	22073703          	ld	a4,544(a4) # 8000d040 <_GLOBAL_OFFSET_TABLE_+0x78>
    80001e28:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001e2c:	00100713          	li	a4,1
    80001e30:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    80001e34:	00000613          	li	a2,0
    80001e38:	0000b597          	auipc	a1,0xb
    80001e3c:	1985b583          	ld	a1,408(a1) # 8000cfd0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001e40:	fd040513          	addi	a0,s0,-48
    80001e44:	fffff097          	auipc	ra,0xfffff
    80001e48:	5c0080e7          	jalr	1472(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80001e4c:	00000613          	li	a2,0
    80001e50:	00000597          	auipc	a1,0x0
    80001e54:	f2858593          	addi	a1,a1,-216 # 80001d78 <_Z22kernelConsumerFunctionPv>
    80001e58:	fc040513          	addi	a0,s0,-64
    80001e5c:	fffff097          	auipc	ra,0xfffff
    80001e60:	5a8080e7          	jalr	1448(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80001e64:	00000613          	li	a2,0
    80001e68:	00000597          	auipc	a1,0x0
    80001e6c:	ef458593          	addi	a1,a1,-268 # 80001d5c <_Z4idlePv>
    80001e70:	fc840513          	addi	a0,s0,-56
    80001e74:	fffff097          	auipc	ra,0xfffff
    80001e78:	590080e7          	jalr	1424(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::mc_sip(uint64 mask) {
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001e7c:	00200493          	li	s1,2
    80001e80:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80001e84:	fd043503          	ld	a0,-48(s0)
    80001e88:	fffff097          	auipc	ra,0xfffff
    80001e8c:	658080e7          	jalr	1624(ra) # 800014e0 <_Z11thread_joinP3TCB>
        __asm__ volatile("li a0, 0x43");
    80001e90:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80001e94:	00000073          	ecall
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001e98:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80001e9c:	00000513          	li	a0,0
    80001ea0:	03813083          	ld	ra,56(sp)
    80001ea4:	03013403          	ld	s0,48(sp)
    80001ea8:	02813483          	ld	s1,40(sp)
    80001eac:	04010113          	addi	sp,sp,64
    80001eb0:	00008067          	ret

0000000080001eb4 <interruptRoutine>:
//#include "../test/printing.hpp"

int main();

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001eb4:	f9010113          	addi	sp,sp,-112
    80001eb8:	06113423          	sd	ra,104(sp)
    80001ebc:	06813023          	sd	s0,96(sp)
    80001ec0:	04913c23          	sd	s1,88(sp)
    80001ec4:	07010413          	addi	s0,sp,112
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ec8:	14202373          	csrr	t1,scause
    80001ecc:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ed0:	14102373          	csrr	t1,sepc
    80001ed4:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ed8:	10002373          	csrr	t1,sstatus
    80001edc:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4;
    //uint64 a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ee0:	00050313          	mv	t1,a0
    80001ee4:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ee8:	00058313          	mv	t1,a1
    80001eec:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ef0:	00060313          	mv	t1,a2
    80001ef4:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ef8:	00068313          	mv	t1,a3
    80001efc:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f00:	00070313          	mv	t1,a4
    80001f04:	fa643023          	sd	t1,-96(s0)
//    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");

    if (scause == 0x9 || scause == 0x8) {
    80001f08:	fd843703          	ld	a4,-40(s0)
    80001f0c:	00900793          	li	a5,9
    80001f10:	00f70863          	beq	a4,a5,80001f20 <interruptRoutine+0x6c>
    80001f14:	fd843703          	ld	a4,-40(s0)
    80001f18:	00800793          	li	a5,8
    80001f1c:	44f71263          	bne	a4,a5,80002360 <interruptRoutine+0x4ac>
        //prekid zbog poziva ecall
        switch (a0) {
    80001f20:	fc043703          	ld	a4,-64(s0)
    80001f24:	08100793          	li	a5,129
    80001f28:	3ee7e863          	bltu	a5,a4,80002318 <interruptRoutine+0x464>
    80001f2c:	fc043783          	ld	a5,-64(s0)
    80001f30:	00279713          	slli	a4,a5,0x2
    80001f34:	00008797          	auipc	a5,0x8
    80001f38:	0ec78793          	addi	a5,a5,236 # 8000a020 <CONSOLE_STATUS+0x10>
    80001f3c:	00f707b3          	add	a5,a4,a5
    80001f40:	0007a783          	lw	a5,0(a5)
    80001f44:	0007871b          	sext.w	a4,a5
    80001f48:	00008797          	auipc	a5,0x8
    80001f4c:	0d878793          	addi	a5,a5,216 # 8000a020 <CONSOLE_STATUS+0x10>
    80001f50:	00f707b3          	add	a5,a4,a5
    80001f54:	00078067          	jr	a5
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                KMemory::kmalloc((size_t)a1);
    80001f58:	fb843503          	ld	a0,-72(s0)
    80001f5c:	00000097          	auipc	ra,0x0
    80001f60:	b00080e7          	jalr	-1280(ra) # 80001a5c <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    80001f64:	04a43823          	sd	a0,80(s0)
                break;
    80001f68:	3d40006f          	j	8000233c <interruptRoutine+0x488>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                KMemory::kfree((void*)a1);
    80001f6c:	fb843783          	ld	a5,-72(s0)
    80001f70:	00078513          	mv	a0,a5
    80001f74:	00000097          	auipc	ra,0x0
    80001f78:	d28080e7          	jalr	-728(ra) # 80001c9c <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    80001f7c:	04a43823          	sd	a0,80(s0)
                break;
    80001f80:	3bc0006f          	j	8000233c <interruptRoutine+0x488>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80001f84:	fb043783          	ld	a5,-80(s0)
    80001f88:	fa843703          	ld	a4,-88(s0)
    80001f8c:	fa043683          	ld	a3,-96(s0)
    80001f90:	fb843483          	ld	s1,-72(s0)
    80001f94:	00068613          	mv	a2,a3
    80001f98:	00070593          	mv	a1,a4
    80001f9c:	00078513          	mv	a0,a5
    80001fa0:	00001097          	auipc	ra,0x1
    80001fa4:	ea8080e7          	jalr	-344(ra) # 80002e48 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001fa8:	00050793          	mv	a5,a0
    80001fac:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80001fb0:	fb843783          	ld	a5,-72(s0)
    80001fb4:	0007b783          	ld	a5,0(a5)
    80001fb8:	02078863          	beqz	a5,80001fe8 <interruptRoutine+0x134>
                    if ((TCB::Body)a2 != (TCB::Body)main) {
    80001fbc:	fb043703          	ld	a4,-80(s0)
    80001fc0:	0000b797          	auipc	a5,0xb
    80001fc4:	0707b783          	ld	a5,112(a5) # 8000d030 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001fc8:	00f70c63          	beq	a4,a5,80001fe0 <interruptRoutine+0x12c>
                        Scheduler::put(*((thread_t*)a1));
    80001fcc:	fb843783          	ld	a5,-72(s0)
    80001fd0:	0007b783          	ld	a5,0(a5)
    80001fd4:	00078513          	mv	a0,a5
    80001fd8:	00000097          	auipc	ra,0x0
    80001fdc:	8c8080e7          	jalr	-1848(ra) # 800018a0 <_ZN9Scheduler3putEP3TCB>
                    }
                    __asm__ volatile("li a0, 0");
    80001fe0:	00000513          	li	a0,0
    80001fe4:	0080006f          	j	80001fec <interruptRoutine+0x138>
                } else {
                    __asm__ volatile("li a0, -1");
    80001fe8:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80001fec:	04a43823          	sd	a0,80(s0)
                break;
    80001ff0:	34c0006f          	j	8000233c <interruptRoutine+0x488>
            case 0x12:
                //thread_exit
                TCB::getRunning()->setStatus(TCB::FINISHED);
    80001ff4:	00000097          	auipc	ra,0x0
    80001ff8:	664080e7          	jalr	1636(ra) # 80002658 <_ZN3TCB10getRunningEv>
    80001ffc:	00050793          	mv	a5,a0
    80002000:	00500593          	li	a1,5
    80002004:	00078513          	mv	a0,a5
    80002008:	00000097          	auipc	ra,0x0
    8000200c:	5fc080e7          	jalr	1532(ra) # 80002604 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined(TCB::getRunning());
    80002010:	00000097          	auipc	ra,0x0
    80002014:	648080e7          	jalr	1608(ra) # 80002658 <_ZN3TCB10getRunningEv>
    80002018:	00050793          	mv	a5,a0
    8000201c:	00078513          	mv	a0,a5
    80002020:	00001097          	auipc	ra,0x1
    80002024:	f60080e7          	jalr	-160(ra) # 80002f80 <_ZN3TCB13releaseJoinedEPS_>
                __asm__ volatile("li a0, 0");
    80002028:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 80(s0)");
    8000202c:	04a43823          	sd	a0,80(s0)
                TCB::dispatch();
    80002030:	00001097          	auipc	ra,0x1
    80002034:	d58080e7          	jalr	-680(ra) # 80002d88 <_ZN3TCB8dispatchEv>
                break;
    80002038:	3040006f          	j	8000233c <interruptRoutine+0x488>
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
    8000203c:	00001097          	auipc	ra,0x1
    80002040:	d4c080e7          	jalr	-692(ra) # 80002d88 <_ZN3TCB8dispatchEv>
                break;
    80002044:	2f80006f          	j	8000233c <interruptRoutine+0x488>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    80002048:	fb843783          	ld	a5,-72(s0)
    8000204c:	00078513          	mv	a0,a5
    80002050:	00001097          	auipc	ra,0x1
    80002054:	edc080e7          	jalr	-292(ra) # 80002f2c <_ZN3TCB10threadJoinEPS_>
                TCB::dispatch();
    80002058:	00001097          	auipc	ra,0x1
    8000205c:	d30080e7          	jalr	-720(ra) # 80002d88 <_ZN3TCB8dispatchEv>
                break;
    80002060:	2dc0006f          	j	8000233c <interruptRoutine+0x488>
            case 0x15:
                //destruktor klase Thread, brise nit ciji je handle prosledjen
                //a1 = rucka niti koja se brise
                if (TCB::getRunning() == (thread_t)a1) {
    80002064:	00000097          	auipc	ra,0x0
    80002068:	5f4080e7          	jalr	1524(ra) # 80002658 <_ZN3TCB10getRunningEv>
    8000206c:	00050713          	mv	a4,a0
    80002070:	fb843783          	ld	a5,-72(s0)
    80002074:	40f707b3          	sub	a5,a4,a5
    80002078:	0017b793          	seqz	a5,a5
    8000207c:	0ff7f793          	andi	a5,a5,255
    80002080:	04078263          	beqz	a5,800020c4 <interruptRoutine+0x210>
                    TCB::getRunning()->setStatus(TCB::FINISHED);
    80002084:	00000097          	auipc	ra,0x0
    80002088:	5d4080e7          	jalr	1492(ra) # 80002658 <_ZN3TCB10getRunningEv>
    8000208c:	00050793          	mv	a5,a0
    80002090:	00500593          	li	a1,5
    80002094:	00078513          	mv	a0,a5
    80002098:	00000097          	auipc	ra,0x0
    8000209c:	56c080e7          	jalr	1388(ra) # 80002604 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                    TCB::releaseJoined(TCB::getRunning());
    800020a0:	00000097          	auipc	ra,0x0
    800020a4:	5b8080e7          	jalr	1464(ra) # 80002658 <_ZN3TCB10getRunningEv>
    800020a8:	00050793          	mv	a5,a0
    800020ac:	00078513          	mv	a0,a5
    800020b0:	00001097          	auipc	ra,0x1
    800020b4:	ed0080e7          	jalr	-304(ra) # 80002f80 <_ZN3TCB13releaseJoinedEPS_>
                    TCB::dispatch();
    800020b8:	00001097          	auipc	ra,0x1
    800020bc:	cd0080e7          	jalr	-816(ra) # 80002d88 <_ZN3TCB8dispatchEv>
                } else {
                    TCB::quitThread((thread_t)a1);
                    TCB::releaseJoined((thread_t)a1);
                }
                break;
    800020c0:	27c0006f          	j	8000233c <interruptRoutine+0x488>
                    TCB::quitThread((thread_t)a1);
    800020c4:	fb843783          	ld	a5,-72(s0)
    800020c8:	00078513          	mv	a0,a5
    800020cc:	00001097          	auipc	ra,0x1
    800020d0:	f04080e7          	jalr	-252(ra) # 80002fd0 <_ZN3TCB10quitThreadEPS_>
                    TCB::releaseJoined((thread_t)a1);
    800020d4:	fb843783          	ld	a5,-72(s0)
    800020d8:	00078513          	mv	a0,a5
    800020dc:	00001097          	auipc	ra,0x1
    800020e0:	ea4080e7          	jalr	-348(ra) # 80002f80 <_ZN3TCB13releaseJoinedEPS_>
                break;
    800020e4:	2580006f          	j	8000233c <interruptRoutine+0x488>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    800020e8:	fb043783          	ld	a5,-80(s0)
    800020ec:	0007879b          	sext.w	a5,a5
    800020f0:	fb843483          	ld	s1,-72(s0)
    800020f4:	00078513          	mv	a0,a5
    800020f8:	00001097          	auipc	ra,0x1
    800020fc:	0cc080e7          	jalr	204(ra) # 800031c4 <_ZN4KSem7initSemEj>
    80002100:	00050793          	mv	a5,a0
    80002104:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    80002108:	fb843783          	ld	a5,-72(s0)
    8000210c:	0007b783          	ld	a5,0(a5)
    80002110:	00078663          	beqz	a5,8000211c <interruptRoutine+0x268>
                    __asm__ volatile("li a0, 0");
    80002114:	00000513          	li	a0,0
    80002118:	0080006f          	j	80002120 <interruptRoutine+0x26c>
                } else {
                    __asm__ volatile("li a0, -1");
    8000211c:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002120:	04a43823          	sd	a0,80(s0)
                break;
    80002124:	2180006f          	j	8000233c <interruptRoutine+0x488>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    80002128:	fb843783          	ld	a5,-72(s0)
    8000212c:	00078513          	mv	a0,a5
    80002130:	00001097          	auipc	ra,0x1
    80002134:	1e8080e7          	jalr	488(ra) # 80003318 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    80002138:	04a43823          	sd	a0,80(s0)
                delete (sem_t)a1;
    8000213c:	fb843483          	ld	s1,-72(s0)
    80002140:	1e048063          	beqz	s1,80002320 <interruptRoutine+0x46c>
    80002144:	00048513          	mv	a0,s1
    80002148:	00000097          	auipc	ra,0x0
    8000214c:	370080e7          	jalr	880(ra) # 800024b8 <_ZN4KSemD1Ev>
    80002150:	00048513          	mv	a0,s1
    80002154:	00001097          	auipc	ra,0x1
    80002158:	048080e7          	jalr	72(ra) # 8000319c <_ZN4KSemdlEPv>
                break;
    8000215c:	1c40006f          	j	80002320 <interruptRoutine+0x46c>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80002160:	fb843783          	ld	a5,-72(s0)
    80002164:	00078513          	mv	a0,a5
    80002168:	00001097          	auipc	ra,0x1
    8000216c:	0ec080e7          	jalr	236(ra) # 80003254 <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002170:	04a43823          	sd	a0,80(s0)
                break;
    80002174:	1c80006f          	j	8000233c <interruptRoutine+0x488>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    80002178:	fb843783          	ld	a5,-72(s0)
    8000217c:	00078513          	mv	a0,a5
    80002180:	00001097          	auipc	ra,0x1
    80002184:	154080e7          	jalr	340(ra) # 800032d4 <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002188:	04a43823          	sd	a0,80(s0)
                break;
    8000218c:	1b00006f          	j	8000233c <interruptRoutine+0x488>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    80002190:	fb843783          	ld	a5,-72(s0)
    80002194:	00078663          	beqz	a5,800021a0 <interruptRoutine+0x2ec>
                    __asm__ volatile("li a0, 0");
    80002198:	00000513          	li	a0,0
    8000219c:	0080006f          	j	800021a4 <interruptRoutine+0x2f0>
                } else {
                    __asm__ volatile("li a0, -1");
    800021a0:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800021a4:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    800021a8:	fb843783          	ld	a5,-72(s0)
    800021ac:	16078e63          	beqz	a5,80002328 <interruptRoutine+0x474>
                    Scheduler::putToSleep(TCB::getRunning(), (time_t)a1);
    800021b0:	00000097          	auipc	ra,0x0
    800021b4:	4a8080e7          	jalr	1192(ra) # 80002658 <_ZN3TCB10getRunningEv>
    800021b8:	00050793          	mv	a5,a0
    800021bc:	fb843583          	ld	a1,-72(s0)
    800021c0:	00078513          	mv	a0,a5
    800021c4:	fffff097          	auipc	ra,0xfffff
    800021c8:	768080e7          	jalr	1896(ra) # 8000192c <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::dispatch();
    800021cc:	00001097          	auipc	ra,0x1
    800021d0:	bbc080e7          	jalr	-1092(ra) # 80002d88 <_ZN3TCB8dispatchEv>
                }
                break;
    800021d4:	1540006f          	j	80002328 <interruptRoutine+0x474>
            case 0x41:
                //getc
                KConsole::kgetc();
    800021d8:	fffff097          	auipc	ra,0xfffff
    800021dc:	664080e7          	jalr	1636(ra) # 8000183c <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    800021e0:	04a43823          	sd	a0,80(s0)
                break;
    800021e4:	1580006f          	j	8000233c <interruptRoutine+0x488>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    800021e8:	fb843783          	ld	a5,-72(s0)
    800021ec:	0ff7f793          	andi	a5,a5,255
    800021f0:	00078513          	mv	a0,a5
    800021f4:	fffff097          	auipc	ra,0xfffff
    800021f8:	5d8080e7          	jalr	1496(ra) # 800017cc <_ZN8KConsole5kputcEc>
                break;
    800021fc:	1400006f          	j	8000233c <interruptRoutine+0x488>
            case 0x43:
                //flush izlaznog bafera konzole
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    80002200:	00000097          	auipc	ra,0x0
    80002204:	3bc080e7          	jalr	956(ra) # 800025bc <_ZN8KConsole13getOutputHeadEv>
    80002208:	00050793          	mv	a5,a0
    8000220c:	00078493          	mv	s1,a5
    80002210:	00000097          	auipc	ra,0x0
    80002214:	3d0080e7          	jalr	976(ra) # 800025e0 <_ZN8KConsole13getOutputTailEv>
    80002218:	00050793          	mv	a5,a0
    8000221c:	00048713          	mv	a4,s1
    80002220:	40f707b3          	sub	a5,a4,a5
    80002224:	00f037b3          	snez	a5,a5
    80002228:	0ff7f793          	andi	a5,a5,255
    8000222c:	10078263          	beqz	a5,80002330 <interruptRoutine+0x47c>
                    char c = KConsole::getFromOutput();
    80002230:	fffff097          	auipc	ra,0xfffff
    80002234:	4d8080e7          	jalr	1240(ra) # 80001708 <_ZN8KConsole13getFromOutputEv>
    80002238:	00050793          	mv	a5,a0
    8000223c:	f8f40ba3          	sb	a5,-105(s0)
                    while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80002240:	00000097          	auipc	ra,0x0
    80002244:	2e0080e7          	jalr	736(ra) # 80002520 <_ZN8KConsole10getSRvalueEv>
    80002248:	00050793          	mv	a5,a0
    8000224c:	0207f793          	andi	a5,a5,32
    80002250:	0017b793          	seqz	a5,a5
    80002254:	0ff7f793          	andi	a5,a5,255
    80002258:	00078463          	beqz	a5,80002260 <interruptRoutine+0x3ac>
    8000225c:	fe5ff06f          	j	80002240 <interruptRoutine+0x38c>
                    KConsole::setDRvalue(c);
    80002260:	f9744783          	lbu	a5,-105(s0)
    80002264:	00078513          	mv	a0,a5
    80002268:	00000097          	auipc	ra,0x0
    8000226c:	308080e7          	jalr	776(ra) # 80002570 <_ZN8KConsole10setDRvalueEc>
                    sem_signal(KConsole::getOutputBufferHasSpace());
    80002270:	00000097          	auipc	ra,0x0
    80002274:	328080e7          	jalr	808(ra) # 80002598 <_ZN8KConsole23getOutputBufferHasSpaceEv>
    80002278:	00050793          	mv	a5,a0
    8000227c:	00078513          	mv	a0,a5
    80002280:	fffff097          	auipc	ra,0xfffff
    80002284:	350080e7          	jalr	848(ra) # 800015d0 <_Z10sem_signalP4KSem>
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    80002288:	f79ff06f          	j	80002200 <interruptRoutine+0x34c>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    8000228c:	fb043783          	ld	a5,-80(s0)
    80002290:	fa843703          	ld	a4,-88(s0)
    80002294:	fa043683          	ld	a3,-96(s0)
    80002298:	fb843483          	ld	s1,-72(s0)
    8000229c:	00068613          	mv	a2,a3
    800022a0:	00070593          	mv	a1,a4
    800022a4:	00078513          	mv	a0,a5
    800022a8:	00001097          	auipc	ra,0x1
    800022ac:	ba0080e7          	jalr	-1120(ra) # 80002e48 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800022b0:	00050793          	mv	a5,a0
    800022b4:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    800022b8:	fb843783          	ld	a5,-72(s0)
    800022bc:	0007b783          	ld	a5,0(a5)
    800022c0:	00078663          	beqz	a5,800022cc <interruptRoutine+0x418>
                    __asm__ volatile("li a0, 0");
    800022c4:	00000513          	li	a0,0
    800022c8:	0080006f          	j	800022d0 <interruptRoutine+0x41c>
                } else {
                    __asm__ volatile("li a0, -1");
    800022cc:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800022d0:	04a43823          	sd	a0,80(s0)
                break;
    800022d4:	0680006f          	j	8000233c <interruptRoutine+0x488>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                if (((thread_t)a1)->getBody() != (TCB::Body)main) {
    800022d8:	fb843783          	ld	a5,-72(s0)
    800022dc:	00078513          	mv	a0,a5
    800022e0:	00000097          	auipc	ra,0x0
    800022e4:	35c080e7          	jalr	860(ra) # 8000263c <_ZN3TCB7getBodyEv>
    800022e8:	00050713          	mv	a4,a0
    800022ec:	0000b797          	auipc	a5,0xb
    800022f0:	d447b783          	ld	a5,-700(a5) # 8000d030 <_GLOBAL_OFFSET_TABLE_+0x68>
    800022f4:	40f707b3          	sub	a5,a4,a5
    800022f8:	00f037b3          	snez	a5,a5
    800022fc:	0ff7f793          	andi	a5,a5,255
    80002300:	02078c63          	beqz	a5,80002338 <interruptRoutine+0x484>
                    Scheduler::put((thread_t)a1);
    80002304:	fb843783          	ld	a5,-72(s0)
    80002308:	00078513          	mv	a0,a5
    8000230c:	fffff097          	auipc	ra,0xfffff
    80002310:	594080e7          	jalr	1428(ra) # 800018a0 <_ZN9Scheduler3putEP3TCB>
                }
                break;
    80002314:	0240006f          	j	80002338 <interruptRoutine+0x484>
//                printInt(a0);
//                printString("\nscause: ");
//                printInt(scause);
//                printString("\nsepc: ");
//                printInt(sepc);
                break;
    80002318:	00000013          	nop
    8000231c:	0200006f          	j	8000233c <interruptRoutine+0x488>
                break;
    80002320:	00000013          	nop
    80002324:	0180006f          	j	8000233c <interruptRoutine+0x488>
                break;
    80002328:	00000013          	nop
    8000232c:	0100006f          	j	8000233c <interruptRoutine+0x488>
                break;
    80002330:	00000013          	nop
    80002334:	0080006f          	j	8000233c <interruptRoutine+0x488>
                break;
    80002338:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    8000233c:	fd043783          	ld	a5,-48(s0)
    80002340:	00478793          	addi	a5,a5,4
    80002344:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002348:	fd043783          	ld	a5,-48(s0)
    8000234c:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002350:	fc843783          	ld	a5,-56(s0)
    80002354:	10079073          	csrw	sstatus,a5
    80002358:	00000013          	nop
//        printString("\nsepc: ");
//        printInt(sepc);
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    }
    8000235c:	1440006f          	j	800024a0 <interruptRoutine+0x5ec>
    } else if (scause == 0x8000000000000009) {
    80002360:	fd843703          	ld	a4,-40(s0)
    80002364:	fff00793          	li	a5,-1
    80002368:	03f79793          	slli	a5,a5,0x3f
    8000236c:	00978793          	addi	a5,a5,9
    80002370:	08f71463          	bne	a4,a5,800023f8 <interruptRoutine+0x544>
        uint64 irq = plic_claim();
    80002374:	00006097          	auipc	ra,0x6
    80002378:	010080e7          	jalr	16(ra) # 80008384 <plic_claim>
    8000237c:	00050793          	mv	a5,a0
    80002380:	f8f43c23          	sd	a5,-104(s0)
        if (irq == CONSOLE_IRQ) {
    80002384:	f9843703          	ld	a4,-104(s0)
    80002388:	00a00793          	li	a5,10
    8000238c:	02f71c63          	bne	a4,a5,800023c4 <interruptRoutine+0x510>
            if (KConsole::getSRvalue() & CONSOLE_RX_STATUS_BIT) {
    80002390:	00000097          	auipc	ra,0x0
    80002394:	190080e7          	jalr	400(ra) # 80002520 <_ZN8KConsole10getSRvalueEv>
    80002398:	00050793          	mv	a5,a0
    8000239c:	0017f793          	andi	a5,a5,1
    800023a0:	00f037b3          	snez	a5,a5
    800023a4:	0ff7f793          	andi	a5,a5,255
    800023a8:	00078e63          	beqz	a5,800023c4 <interruptRoutine+0x510>
                KConsole::placeInInput(KConsole::getDRvalue());
    800023ac:	00000097          	auipc	ra,0x0
    800023b0:	19c080e7          	jalr	412(ra) # 80002548 <_ZN8KConsole10getDRvalueEv>
    800023b4:	00050793          	mv	a5,a0
    800023b8:	00078513          	mv	a0,a5
    800023bc:	fffff097          	auipc	ra,0xfffff
    800023c0:	3a4080e7          	jalr	932(ra) # 80001760 <_ZN8KConsole12placeInInputEc>
        plic_complete(irq);
    800023c4:	f9843783          	ld	a5,-104(s0)
    800023c8:	0007879b          	sext.w	a5,a5
    800023cc:	00078513          	mv	a0,a5
    800023d0:	00006097          	auipc	ra,0x6
    800023d4:	fec080e7          	jalr	-20(ra) # 800083bc <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800023d8:	fd043783          	ld	a5,-48(s0)
    800023dc:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800023e0:	fc843783          	ld	a5,-56(s0)
    800023e4:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    800023e8:	20000513          	li	a0,512
    800023ec:	00000097          	auipc	ra,0x0
    800023f0:	118080e7          	jalr	280(ra) # 80002504 <_ZN5Riscv6mc_sipEm>
    800023f4:	0ac0006f          	j	800024a0 <interruptRoutine+0x5ec>
    } else if (scause == 0x8000000000000001) {
    800023f8:	fd843703          	ld	a4,-40(s0)
    800023fc:	fff00793          	li	a5,-1
    80002400:	03f79793          	slli	a5,a5,0x3f
    80002404:	00178793          	addi	a5,a5,1
    80002408:	08f71463          	bne	a4,a5,80002490 <interruptRoutine+0x5dc>
        Scheduler::wake();
    8000240c:	fffff097          	auipc	ra,0xfffff
    80002410:	5d0080e7          	jalr	1488(ra) # 800019dc <_ZN9Scheduler4wakeEv>
        TCB::getRunningTimeSlice()++;
    80002414:	00000097          	auipc	ra,0x0
    80002418:	268080e7          	jalr	616(ra) # 8000267c <_ZN3TCB19getRunningTimeSliceEv>
    8000241c:	00050793          	mv	a5,a0
    80002420:	0007b703          	ld	a4,0(a5)
    80002424:	00170713          	addi	a4,a4,1
    80002428:	00e7b023          	sd	a4,0(a5)
        Riscv::mc_sip(Riscv::SIP_SSIP);
    8000242c:	00200513          	li	a0,2
    80002430:	00000097          	auipc	ra,0x0
    80002434:	0d4080e7          	jalr	212(ra) # 80002504 <_ZN5Riscv6mc_sipEm>
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
    80002438:	00000097          	auipc	ra,0x0
    8000243c:	244080e7          	jalr	580(ra) # 8000267c <_ZN3TCB19getRunningTimeSliceEv>
    80002440:	00050793          	mv	a5,a0
    80002444:	0007b483          	ld	s1,0(a5)
    80002448:	00000097          	auipc	ra,0x0
    8000244c:	210080e7          	jalr	528(ra) # 80002658 <_ZN3TCB10getRunningEv>
    80002450:	00050793          	mv	a5,a0
    80002454:	00078513          	mv	a0,a5
    80002458:	00000097          	auipc	ra,0x0
    8000245c:	1c8080e7          	jalr	456(ra) # 80002620 <_ZN3TCB12getTimeSliceEv>
    80002460:	00050793          	mv	a5,a0
    80002464:	00f4b7b3          	sltu	a5,s1,a5
    80002468:	0017c793          	xori	a5,a5,1
    8000246c:	0ff7f793          	andi	a5,a5,255
    80002470:	00078663          	beqz	a5,8000247c <interruptRoutine+0x5c8>
            TCB::dispatch();
    80002474:	00001097          	auipc	ra,0x1
    80002478:	914080e7          	jalr	-1772(ra) # 80002d88 <_ZN3TCB8dispatchEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    8000247c:	fd043783          	ld	a5,-48(s0)
    80002480:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002484:	fc843783          	ld	a5,-56(s0)
    80002488:	10079073          	csrw	sstatus,a5
    8000248c:	0140006f          	j	800024a0 <interruptRoutine+0x5ec>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002490:	fd043783          	ld	a5,-48(s0)
    80002494:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002498:	fc843783          	ld	a5,-56(s0)
    8000249c:	10079073          	csrw	sstatus,a5
    800024a0:	00000013          	nop
    800024a4:	06813083          	ld	ra,104(sp)
    800024a8:	06013403          	ld	s0,96(sp)
    800024ac:	05813483          	ld	s1,88(sp)
    800024b0:	07010113          	addi	sp,sp,112
    800024b4:	00008067          	ret

00000000800024b8 <_ZN4KSemD1Ev>:
#define PROJEKAT2023_KSEM_HPP

#include "../h/ThreadQueue.hpp"

//klasa napravljena po uzoru na semafor u skolskom jezgru
class KSem {
    800024b8:	fe010113          	addi	sp,sp,-32
    800024bc:	00113c23          	sd	ra,24(sp)
    800024c0:	00813823          	sd	s0,16(sp)
    800024c4:	00913423          	sd	s1,8(sp)
    800024c8:	02010413          	addi	s0,sp,32
    800024cc:	00050493          	mv	s1,a0
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    800024d0:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    800024d4:	00050e63          	beqz	a0,800024f0 <_ZN4KSemD1Ev+0x38>
            front = front->next;
    800024d8:	00853783          	ld	a5,8(a0)
    800024dc:	00f4b423          	sd	a5,8(s1)
            delete node;
    800024e0:	fe0508e3          	beqz	a0,800024d0 <_ZN4KSemD1Ev+0x18>
            mem_free(ptr);
    800024e4:	fffff097          	auipc	ra,0xfffff
    800024e8:	ef0080e7          	jalr	-272(ra) # 800013d4 <_Z8mem_freePv>
        }
    800024ec:	fe5ff06f          	j	800024d0 <_ZN4KSemD1Ev+0x18>
    800024f0:	01813083          	ld	ra,24(sp)
    800024f4:	01013403          	ld	s0,16(sp)
    800024f8:	00813483          	ld	s1,8(sp)
    800024fc:	02010113          	addi	sp,sp,32
    80002500:	00008067          	ret

0000000080002504 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002504:	ff010113          	addi	sp,sp,-16
    80002508:	00813423          	sd	s0,8(sp)
    8000250c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80002510:	14453073          	csrc	sip,a0
}
    80002514:	00813403          	ld	s0,8(sp)
    80002518:	01010113          	addi	sp,sp,16
    8000251c:	00008067          	ret

0000000080002520 <_ZN8KConsole10getSRvalueEv>:
    static uint8 getSRvalue() { return *sr; }
    80002520:	ff010113          	addi	sp,sp,-16
    80002524:	00813423          	sd	s0,8(sp)
    80002528:	01010413          	addi	s0,sp,16
    8000252c:	0000b797          	auipc	a5,0xb
    80002530:	b447b783          	ld	a5,-1212(a5) # 8000d070 <_GLOBAL_OFFSET_TABLE_+0xa8>
    80002534:	0007b783          	ld	a5,0(a5)
    80002538:	0007c503          	lbu	a0,0(a5)
    8000253c:	00813403          	ld	s0,8(sp)
    80002540:	01010113          	addi	sp,sp,16
    80002544:	00008067          	ret

0000000080002548 <_ZN8KConsole10getDRvalueEv>:
    static uint8 getDRvalue() { return *dr; }
    80002548:	ff010113          	addi	sp,sp,-16
    8000254c:	00813423          	sd	s0,8(sp)
    80002550:	01010413          	addi	s0,sp,16
    80002554:	0000b797          	auipc	a5,0xb
    80002558:	ad47b783          	ld	a5,-1324(a5) # 8000d028 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000255c:	0007b783          	ld	a5,0(a5)
    80002560:	0007c503          	lbu	a0,0(a5)
    80002564:	00813403          	ld	s0,8(sp)
    80002568:	01010113          	addi	sp,sp,16
    8000256c:	00008067          	ret

0000000080002570 <_ZN8KConsole10setDRvalueEc>:
    static void setDRvalue(char c) { *dr = c; }
    80002570:	ff010113          	addi	sp,sp,-16
    80002574:	00813423          	sd	s0,8(sp)
    80002578:	01010413          	addi	s0,sp,16
    8000257c:	0000b797          	auipc	a5,0xb
    80002580:	aac7b783          	ld	a5,-1364(a5) # 8000d028 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002584:	0007b783          	ld	a5,0(a5)
    80002588:	00a78023          	sb	a0,0(a5)
    8000258c:	00813403          	ld	s0,8(sp)
    80002590:	01010113          	addi	sp,sp,16
    80002594:	00008067          	ret

0000000080002598 <_ZN8KConsole23getOutputBufferHasSpaceEv>:

    static sem_t getOutputBufferHasSpace() { return outputBufferHasSpace; }
    80002598:	ff010113          	addi	sp,sp,-16
    8000259c:	00813423          	sd	s0,8(sp)
    800025a0:	01010413          	addi	s0,sp,16
    800025a4:	0000b797          	auipc	a5,0xb
    800025a8:	a947b783          	ld	a5,-1388(a5) # 8000d038 <_GLOBAL_OFFSET_TABLE_+0x70>
    800025ac:	0007b503          	ld	a0,0(a5)
    800025b0:	00813403          	ld	s0,8(sp)
    800025b4:	01010113          	addi	sp,sp,16
    800025b8:	00008067          	ret

00000000800025bc <_ZN8KConsole13getOutputHeadEv>:

    static int getOutputHead() { return outputHead; }
    800025bc:	ff010113          	addi	sp,sp,-16
    800025c0:	00813423          	sd	s0,8(sp)
    800025c4:	01010413          	addi	s0,sp,16
    800025c8:	0000b797          	auipc	a5,0xb
    800025cc:	a507b783          	ld	a5,-1456(a5) # 8000d018 <_GLOBAL_OFFSET_TABLE_+0x50>
    800025d0:	0007a503          	lw	a0,0(a5)
    800025d4:	00813403          	ld	s0,8(sp)
    800025d8:	01010113          	addi	sp,sp,16
    800025dc:	00008067          	ret

00000000800025e0 <_ZN8KConsole13getOutputTailEv>:

    static int getOutputTail() { return outputTail; }
    800025e0:	ff010113          	addi	sp,sp,-16
    800025e4:	00813423          	sd	s0,8(sp)
    800025e8:	01010413          	addi	s0,sp,16
    800025ec:	0000b797          	auipc	a5,0xb
    800025f0:	a7c7b783          	ld	a5,-1412(a5) # 8000d068 <_GLOBAL_OFFSET_TABLE_+0xa0>
    800025f4:	0007a503          	lw	a0,0(a5)
    800025f8:	00813403          	ld	s0,8(sp)
    800025fc:	01010113          	addi	sp,sp,16
    80002600:	00008067          	ret

0000000080002604 <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    80002604:	ff010113          	addi	sp,sp,-16
    80002608:	00813423          	sd	s0,8(sp)
    8000260c:	01010413          	addi	s0,sp,16
    80002610:	04b52c23          	sw	a1,88(a0)
    80002614:	00813403          	ld	s0,8(sp)
    80002618:	01010113          	addi	sp,sp,16
    8000261c:	00008067          	ret

0000000080002620 <_ZN3TCB12getTimeSliceEv>:
    uint64 getTimeSlice() { return timeSlice; }
    80002620:	ff010113          	addi	sp,sp,-16
    80002624:	00813423          	sd	s0,8(sp)
    80002628:	01010413          	addi	s0,sp,16
    8000262c:	02853503          	ld	a0,40(a0)
    80002630:	00813403          	ld	s0,8(sp)
    80002634:	01010113          	addi	sp,sp,16
    80002638:	00008067          	ret

000000008000263c <_ZN3TCB7getBodyEv>:
    Body getBody() { return threadFunction; }
    8000263c:	ff010113          	addi	sp,sp,-16
    80002640:	00813423          	sd	s0,8(sp)
    80002644:	01010413          	addi	s0,sp,16
    80002648:	01053503          	ld	a0,16(a0)
    8000264c:	00813403          	ld	s0,8(sp)
    80002650:	01010113          	addi	sp,sp,16
    80002654:	00008067          	ret

0000000080002658 <_ZN3TCB10getRunningEv>:
    static TCB* getRunning() { return running; }
    80002658:	ff010113          	addi	sp,sp,-16
    8000265c:	00813423          	sd	s0,8(sp)
    80002660:	01010413          	addi	s0,sp,16
    80002664:	0000b797          	auipc	a5,0xb
    80002668:	9dc7b783          	ld	a5,-1572(a5) # 8000d040 <_GLOBAL_OFFSET_TABLE_+0x78>
    8000266c:	0007b503          	ld	a0,0(a5)
    80002670:	00813403          	ld	s0,8(sp)
    80002674:	01010113          	addi	sp,sp,16
    80002678:	00008067          	ret

000000008000267c <_ZN3TCB19getRunningTimeSliceEv>:

    static uint64 &getRunningTimeSlice() { return runningTimeSlice; }
    8000267c:	ff010113          	addi	sp,sp,-16
    80002680:	00813423          	sd	s0,8(sp)
    80002684:	01010413          	addi	s0,sp,16
    80002688:	0000b517          	auipc	a0,0xb
    8000268c:	95853503          	ld	a0,-1704(a0) # 8000cfe0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002690:	00813403          	ld	s0,8(sp)
    80002694:	01010113          	addi	sp,sp,16
    80002698:	00008067          	ret

000000008000269c <_ZN6Thread7wrapperEPv>:

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
    8000269c:	02050863          	beqz	a0,800026cc <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    800026a0:	ff010113          	addi	sp,sp,-16
    800026a4:	00113423          	sd	ra,8(sp)
    800026a8:	00813023          	sd	s0,0(sp)
    800026ac:	01010413          	addi	s0,sp,16
        ((Thread*)thread)->run();
    800026b0:	00053783          	ld	a5,0(a0)
    800026b4:	0107b783          	ld	a5,16(a5)
    800026b8:	000780e7          	jalr	a5
    }
}
    800026bc:	00813083          	ld	ra,8(sp)
    800026c0:	00013403          	ld	s0,0(sp)
    800026c4:	01010113          	addi	sp,sp,16
    800026c8:	00008067          	ret
    800026cc:	00008067          	ret

00000000800026d0 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800026d0:	fe010113          	addi	sp,sp,-32
    800026d4:	00113c23          	sd	ra,24(sp)
    800026d8:	00813823          	sd	s0,16(sp)
    800026dc:	00913423          	sd	s1,8(sp)
    800026e0:	02010413          	addi	s0,sp,32
    800026e4:	00050313          	mv	t1,a0
    800026e8:	0000a797          	auipc	a5,0xa
    800026ec:	65078793          	addi	a5,a5,1616 # 8000cd38 <_ZTV6Thread+0x10>
    800026f0:	00f53023          	sd	a5,0(a0)
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800026f4:	00853e03          	ld	t3,8(a0)
    800026f8:	000e0593          	mv	a1,t3
    __asm__ volatile("li a0, 0x15");
    800026fc:	01500513          	li	a0,21
    __asm__ volatile("ecall");
    80002700:	00000073          	ecall
    delete myHandle;
    80002704:	00833483          	ld	s1,8(t1)
    80002708:	02048863          	beqz	s1,80002738 <_ZN6ThreadD1Ev+0x68>
        return front == nullptr;
    8000270c:	0484b503          	ld	a0,72(s1)
        while (!isEmpty()) {
    80002710:	00050e63          	beqz	a0,8000272c <_ZN6ThreadD1Ev+0x5c>
            front = front->next;
    80002714:	00853783          	ld	a5,8(a0)
    80002718:	04f4b423          	sd	a5,72(s1)
            delete node;
    8000271c:	fe0508e3          	beqz	a0,8000270c <_ZN6ThreadD1Ev+0x3c>
            mem_free(ptr);
    80002720:	fffff097          	auipc	ra,0xfffff
    80002724:	cb4080e7          	jalr	-844(ra) # 800013d4 <_Z8mem_freePv>
        }
    80002728:	fe5ff06f          	j	8000270c <_ZN6ThreadD1Ev+0x3c>
    8000272c:	00048513          	mv	a0,s1
    80002730:	00000097          	auipc	ra,0x0
    80002734:	7d4080e7          	jalr	2004(ra) # 80002f04 <_ZN3TCBdlEPv>
}
    80002738:	01813083          	ld	ra,24(sp)
    8000273c:	01013403          	ld	s0,16(sp)
    80002740:	00813483          	ld	s1,8(sp)
    80002744:	02010113          	addi	sp,sp,32
    80002748:	00008067          	ret

000000008000274c <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    8000274c:	ff010113          	addi	sp,sp,-16
    80002750:	00113423          	sd	ra,8(sp)
    80002754:	00813023          	sd	s0,0(sp)
    80002758:	01010413          	addi	s0,sp,16
    8000275c:	0000a797          	auipc	a5,0xa
    80002760:	60478793          	addi	a5,a5,1540 # 8000cd60 <_ZTV9Semaphore+0x10>
    80002764:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80002768:	00853503          	ld	a0,8(a0)
    8000276c:	fffff097          	auipc	ra,0xfffff
    80002770:	e04080e7          	jalr	-508(ra) # 80001570 <_Z9sem_closeP4KSem>
}
    80002774:	00813083          	ld	ra,8(sp)
    80002778:	00013403          	ld	s0,0(sp)
    8000277c:	01010113          	addi	sp,sp,16
    80002780:	00008067          	ret

0000000080002784 <_Znwm>:
void* operator new(size_t size) {
    80002784:	ff010113          	addi	sp,sp,-16
    80002788:	00113423          	sd	ra,8(sp)
    8000278c:	00813023          	sd	s0,0(sp)
    80002790:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002794:	fffff097          	auipc	ra,0xfffff
    80002798:	c00080e7          	jalr	-1024(ra) # 80001394 <_Z9mem_allocm>
}
    8000279c:	00813083          	ld	ra,8(sp)
    800027a0:	00013403          	ld	s0,0(sp)
    800027a4:	01010113          	addi	sp,sp,16
    800027a8:	00008067          	ret

00000000800027ac <_Znam>:
void* operator new[](size_t size) {
    800027ac:	ff010113          	addi	sp,sp,-16
    800027b0:	00113423          	sd	ra,8(sp)
    800027b4:	00813023          	sd	s0,0(sp)
    800027b8:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800027bc:	fffff097          	auipc	ra,0xfffff
    800027c0:	bd8080e7          	jalr	-1064(ra) # 80001394 <_Z9mem_allocm>
}
    800027c4:	00813083          	ld	ra,8(sp)
    800027c8:	00013403          	ld	s0,0(sp)
    800027cc:	01010113          	addi	sp,sp,16
    800027d0:	00008067          	ret

00000000800027d4 <_ZdlPv>:
noexcept {
    800027d4:	ff010113          	addi	sp,sp,-16
    800027d8:	00113423          	sd	ra,8(sp)
    800027dc:	00813023          	sd	s0,0(sp)
    800027e0:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800027e4:	fffff097          	auipc	ra,0xfffff
    800027e8:	bf0080e7          	jalr	-1040(ra) # 800013d4 <_Z8mem_freePv>
}
    800027ec:	00813083          	ld	ra,8(sp)
    800027f0:	00013403          	ld	s0,0(sp)
    800027f4:	01010113          	addi	sp,sp,16
    800027f8:	00008067          	ret

00000000800027fc <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800027fc:	fe010113          	addi	sp,sp,-32
    80002800:	00113c23          	sd	ra,24(sp)
    80002804:	00813823          	sd	s0,16(sp)
    80002808:	00913423          	sd	s1,8(sp)
    8000280c:	02010413          	addi	s0,sp,32
    80002810:	00050493          	mv	s1,a0
}
    80002814:	00000097          	auipc	ra,0x0
    80002818:	f38080e7          	jalr	-200(ra) # 8000274c <_ZN9SemaphoreD1Ev>
    8000281c:	00048513          	mv	a0,s1
    80002820:	00000097          	auipc	ra,0x0
    80002824:	fb4080e7          	jalr	-76(ra) # 800027d4 <_ZdlPv>
    80002828:	01813083          	ld	ra,24(sp)
    8000282c:	01013403          	ld	s0,16(sp)
    80002830:	00813483          	ld	s1,8(sp)
    80002834:	02010113          	addi	sp,sp,32
    80002838:	00008067          	ret

000000008000283c <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    8000283c:	fe010113          	addi	sp,sp,-32
    80002840:	00113c23          	sd	ra,24(sp)
    80002844:	00813823          	sd	s0,16(sp)
    80002848:	00913423          	sd	s1,8(sp)
    8000284c:	02010413          	addi	s0,sp,32
    80002850:	00050493          	mv	s1,a0
}
    80002854:	00000097          	auipc	ra,0x0
    80002858:	e7c080e7          	jalr	-388(ra) # 800026d0 <_ZN6ThreadD1Ev>
    8000285c:	00048513          	mv	a0,s1
    80002860:	00000097          	auipc	ra,0x0
    80002864:	f74080e7          	jalr	-140(ra) # 800027d4 <_ZdlPv>
    80002868:	01813083          	ld	ra,24(sp)
    8000286c:	01013403          	ld	s0,16(sp)
    80002870:	00813483          	ld	s1,8(sp)
    80002874:	02010113          	addi	sp,sp,32
    80002878:	00008067          	ret

000000008000287c <_ZdaPv>:
noexcept {
    8000287c:	ff010113          	addi	sp,sp,-16
    80002880:	00113423          	sd	ra,8(sp)
    80002884:	00813023          	sd	s0,0(sp)
    80002888:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000288c:	fffff097          	auipc	ra,0xfffff
    80002890:	b48080e7          	jalr	-1208(ra) # 800013d4 <_Z8mem_freePv>
}
    80002894:	00813083          	ld	ra,8(sp)
    80002898:	00013403          	ld	s0,0(sp)
    8000289c:	01010113          	addi	sp,sp,16
    800028a0:	00008067          	ret

00000000800028a4 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    800028a4:	fd010113          	addi	sp,sp,-48
    800028a8:	02113423          	sd	ra,40(sp)
    800028ac:	02813023          	sd	s0,32(sp)
    800028b0:	00913c23          	sd	s1,24(sp)
    800028b4:	01213823          	sd	s2,16(sp)
    800028b8:	01313423          	sd	s3,8(sp)
    800028bc:	03010413          	addi	s0,sp,48
    800028c0:	00050493          	mv	s1,a0
    800028c4:	00058913          	mv	s2,a1
    800028c8:	00060993          	mv	s3,a2
    800028cc:	0000a797          	auipc	a5,0xa
    800028d0:	46c78793          	addi	a5,a5,1132 # 8000cd38 <_ZTV6Thread+0x10>
    800028d4:	00f53023          	sd	a5,0(a0)
    this->body = body;
    800028d8:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    800028dc:	00c53c23          	sd	a2,24(a0)
    if (body != (TCB::Body)main) {
    800028e0:	0000a797          	auipc	a5,0xa
    800028e4:	7507b783          	ld	a5,1872(a5) # 8000d030 <_GLOBAL_OFFSET_TABLE_+0x68>
    800028e8:	04f58663          	beq	a1,a5,80002934 <_ZN6ThreadC1EPFvPvES0_+0x90>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800028ec:	00001537          	lui	a0,0x1
    800028f0:	fffff097          	auipc	ra,0xfffff
    800028f4:	aa4080e7          	jalr	-1372(ra) # 80001394 <_Z9mem_allocm>
    800028f8:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028fc:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002900:	00098693          	mv	a3,s3
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002904:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002908:	00848493          	addi	s1,s1,8
    8000290c:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002910:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002914:	00000073          	ecall
}
    80002918:	02813083          	ld	ra,40(sp)
    8000291c:	02013403          	ld	s0,32(sp)
    80002920:	01813483          	ld	s1,24(sp)
    80002924:	01013903          	ld	s2,16(sp)
    80002928:	00813983          	ld	s3,8(sp)
    8000292c:	03010113          	addi	sp,sp,48
    80002930:	00008067          	ret
    uint64* stack = nullptr;
    80002934:	00000313          	li	t1,0
    80002938:	fc5ff06f          	j	800028fc <_ZN6ThreadC1EPFvPvES0_+0x58>

000000008000293c <_ZN6Thread5startEv>:
int Thread::start() {
    8000293c:	ff010113          	addi	sp,sp,-16
    80002940:	00813423          	sd	s0,8(sp)
    80002944:	01010413          	addi	s0,sp,16
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    80002948:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    8000294c:	02030463          	beqz	t1,80002974 <_ZN6Thread5startEv+0x38>
    ThreadStatus getStatus() { return this->status; }
    80002950:	05832783          	lw	a5,88(t1)
    80002954:	02079463          	bnez	a5,8000297c <_ZN6Thread5startEv+0x40>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002958:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    8000295c:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    80002960:	00000073          	ecall
    return 0;
    80002964:	00000513          	li	a0,0
}
    80002968:	00813403          	ld	s0,8(sp)
    8000296c:	01010113          	addi	sp,sp,16
    80002970:	00008067          	ret
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    80002974:	fff00513          	li	a0,-1
    80002978:	ff1ff06f          	j	80002968 <_ZN6Thread5startEv+0x2c>
    8000297c:	fff00513          	li	a0,-1
    80002980:	fe9ff06f          	j	80002968 <_ZN6Thread5startEv+0x2c>

0000000080002984 <_ZN6Thread4joinEv>:
    if (myHandle) thread_join(myHandle);
    80002984:	00853503          	ld	a0,8(a0)
    80002988:	02050663          	beqz	a0,800029b4 <_ZN6Thread4joinEv+0x30>
void Thread::join() {
    8000298c:	ff010113          	addi	sp,sp,-16
    80002990:	00113423          	sd	ra,8(sp)
    80002994:	00813023          	sd	s0,0(sp)
    80002998:	01010413          	addi	s0,sp,16
    if (myHandle) thread_join(myHandle);
    8000299c:	fffff097          	auipc	ra,0xfffff
    800029a0:	b44080e7          	jalr	-1212(ra) # 800014e0 <_Z11thread_joinP3TCB>
}
    800029a4:	00813083          	ld	ra,8(sp)
    800029a8:	00013403          	ld	s0,0(sp)
    800029ac:	01010113          	addi	sp,sp,16
    800029b0:	00008067          	ret
    800029b4:	00008067          	ret

00000000800029b8 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800029b8:	ff010113          	addi	sp,sp,-16
    800029bc:	00113423          	sd	ra,8(sp)
    800029c0:	00813023          	sd	s0,0(sp)
    800029c4:	01010413          	addi	s0,sp,16
    thread_dispatch();
    800029c8:	fffff097          	auipc	ra,0xfffff
    800029cc:	af8080e7          	jalr	-1288(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800029d0:	00813083          	ld	ra,8(sp)
    800029d4:	00013403          	ld	s0,0(sp)
    800029d8:	01010113          	addi	sp,sp,16
    800029dc:	00008067          	ret

00000000800029e0 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    800029e0:	ff010113          	addi	sp,sp,-16
    800029e4:	00113423          	sd	ra,8(sp)
    800029e8:	00813023          	sd	s0,0(sp)
    800029ec:	01010413          	addi	s0,sp,16
    time_sleep(t);
    800029f0:	fffff097          	auipc	ra,0xfffff
    800029f4:	b18080e7          	jalr	-1256(ra) # 80001508 <_Z10time_sleepm>
}
    800029f8:	00000513          	li	a0,0
    800029fc:	00813083          	ld	ra,8(sp)
    80002a00:	00013403          	ld	s0,0(sp)
    80002a04:	01010113          	addi	sp,sp,16
    80002a08:	00008067          	ret

0000000080002a0c <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    80002a0c:	fe010113          	addi	sp,sp,-32
    80002a10:	00113c23          	sd	ra,24(sp)
    80002a14:	00813823          	sd	s0,16(sp)
    80002a18:	00913423          	sd	s1,8(sp)
    80002a1c:	02010413          	addi	s0,sp,32
    80002a20:	00050493          	mv	s1,a0
    while (period != -1UL) {
    80002a24:	0204b703          	ld	a4,32(s1)
    80002a28:	fff00793          	li	a5,-1
    80002a2c:	02f70663          	beq	a4,a5,80002a58 <_ZN14PeriodicThread3runEv+0x4c>
        periodicActivation();
    80002a30:	0004b783          	ld	a5,0(s1)
    80002a34:	0187b783          	ld	a5,24(a5)
    80002a38:	00048513          	mv	a0,s1
    80002a3c:	000780e7          	jalr	a5
        if (period == -1UL) break;
    80002a40:	0204b503          	ld	a0,32(s1)
    80002a44:	fff00793          	li	a5,-1
    80002a48:	00f50863          	beq	a0,a5,80002a58 <_ZN14PeriodicThread3runEv+0x4c>
        sleep(period);
    80002a4c:	00000097          	auipc	ra,0x0
    80002a50:	f94080e7          	jalr	-108(ra) # 800029e0 <_ZN6Thread5sleepEm>
    while (period != -1UL) {
    80002a54:	fd1ff06f          	j	80002a24 <_ZN14PeriodicThread3runEv+0x18>
    }
    thread_exit();
    80002a58:	fffff097          	auipc	ra,0xfffff
    80002a5c:	a40080e7          	jalr	-1472(ra) # 80001498 <_Z11thread_exitv>
}
    80002a60:	01813083          	ld	ra,24(sp)
    80002a64:	01013403          	ld	s0,16(sp)
    80002a68:	00813483          	ld	s1,8(sp)
    80002a6c:	02010113          	addi	sp,sp,32
    80002a70:	00008067          	ret

0000000080002a74 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002a74:	fe010113          	addi	sp,sp,-32
    80002a78:	00113c23          	sd	ra,24(sp)
    80002a7c:	00813823          	sd	s0,16(sp)
    80002a80:	00913423          	sd	s1,8(sp)
    80002a84:	02010413          	addi	s0,sp,32
    80002a88:	00050493          	mv	s1,a0
    80002a8c:	0000a797          	auipc	a5,0xa
    80002a90:	2ac78793          	addi	a5,a5,684 # 8000cd38 <_ZTV6Thread+0x10>
    80002a94:	00f53023          	sd	a5,0(a0)
    this->body = wrapper;
    80002a98:	00000797          	auipc	a5,0x0
    80002a9c:	c0478793          	addi	a5,a5,-1020 # 8000269c <_ZN6Thread7wrapperEPv>
    80002aa0:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80002aa4:	00a53c23          	sd	a0,24(a0)
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002aa8:	00001537          	lui	a0,0x1
    80002aac:	fffff097          	auipc	ra,0xfffff
    80002ab0:	8e8080e7          	jalr	-1816(ra) # 80001394 <_Z9mem_allocm>
    80002ab4:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002ab8:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002abc:	0184b303          	ld	t1,24(s1)
    80002ac0:	00030693          	mv	a3,t1
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002ac4:	0104b303          	ld	t1,16(s1)
    80002ac8:	00030613          	mv	a2,t1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002acc:	00848493          	addi	s1,s1,8
    80002ad0:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002ad4:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002ad8:	00000073          	ecall
}
    80002adc:	01813083          	ld	ra,24(sp)
    80002ae0:	01013403          	ld	s0,16(sp)
    80002ae4:	00813483          	ld	s1,8(sp)
    80002ae8:	02010113          	addi	sp,sp,32
    80002aec:	00008067          	ret

0000000080002af0 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002af0:	ff010113          	addi	sp,sp,-16
    80002af4:	00113423          	sd	ra,8(sp)
    80002af8:	00813023          	sd	s0,0(sp)
    80002afc:	01010413          	addi	s0,sp,16
    80002b00:	0000a797          	auipc	a5,0xa
    80002b04:	26078793          	addi	a5,a5,608 # 8000cd60 <_ZTV9Semaphore+0x10>
    80002b08:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle, init);
    80002b0c:	00850513          	addi	a0,a0,8
    80002b10:	fffff097          	auipc	ra,0xfffff
    80002b14:	a28080e7          	jalr	-1496(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    80002b18:	00813083          	ld	ra,8(sp)
    80002b1c:	00013403          	ld	s0,0(sp)
    80002b20:	01010113          	addi	sp,sp,16
    80002b24:	00008067          	ret

0000000080002b28 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002b28:	ff010113          	addi	sp,sp,-16
    80002b2c:	00113423          	sd	ra,8(sp)
    80002b30:	00813023          	sd	s0,0(sp)
    80002b34:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002b38:	00853503          	ld	a0,8(a0)
    80002b3c:	fffff097          	auipc	ra,0xfffff
    80002b40:	a64080e7          	jalr	-1436(ra) # 800015a0 <_Z8sem_waitP4KSem>
}
    80002b44:	00813083          	ld	ra,8(sp)
    80002b48:	00013403          	ld	s0,0(sp)
    80002b4c:	01010113          	addi	sp,sp,16
    80002b50:	00008067          	ret

0000000080002b54 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002b54:	ff010113          	addi	sp,sp,-16
    80002b58:	00113423          	sd	ra,8(sp)
    80002b5c:	00813023          	sd	s0,0(sp)
    80002b60:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80002b64:	00853503          	ld	a0,8(a0)
    80002b68:	fffff097          	auipc	ra,0xfffff
    80002b6c:	a68080e7          	jalr	-1432(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80002b70:	00813083          	ld	ra,8(sp)
    80002b74:	00013403          	ld	s0,0(sp)
    80002b78:	01010113          	addi	sp,sp,16
    80002b7c:	00008067          	ret

0000000080002b80 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002b80:	ff010113          	addi	sp,sp,-16
    80002b84:	00113423          	sd	ra,8(sp)
    80002b88:	00813023          	sd	s0,0(sp)
    80002b8c:	01010413          	addi	s0,sp,16
    this->period = -1;
    80002b90:	fff00793          	li	a5,-1
    80002b94:	02f53023          	sd	a5,32(a0)
    join();
    80002b98:	00000097          	auipc	ra,0x0
    80002b9c:	dec080e7          	jalr	-532(ra) # 80002984 <_ZN6Thread4joinEv>
}
    80002ba0:	00813083          	ld	ra,8(sp)
    80002ba4:	00013403          	ld	s0,0(sp)
    80002ba8:	01010113          	addi	sp,sp,16
    80002bac:	00008067          	ret

0000000080002bb0 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    80002bb0:	fe010113          	addi	sp,sp,-32
    80002bb4:	00113c23          	sd	ra,24(sp)
    80002bb8:	00813823          	sd	s0,16(sp)
    80002bbc:	00913423          	sd	s1,8(sp)
    80002bc0:	01213023          	sd	s2,0(sp)
    80002bc4:	02010413          	addi	s0,sp,32
    80002bc8:	00050493          	mv	s1,a0
    80002bcc:	00058913          	mv	s2,a1
    80002bd0:	00000097          	auipc	ra,0x0
    80002bd4:	ea4080e7          	jalr	-348(ra) # 80002a74 <_ZN6ThreadC1Ev>
    80002bd8:	0000a797          	auipc	a5,0xa
    80002bdc:	1a878793          	addi	a5,a5,424 # 8000cd80 <_ZTV14PeriodicThread+0x10>
    80002be0:	00f4b023          	sd	a5,0(s1)
    80002be4:	0324b023          	sd	s2,32(s1)
}
    80002be8:	01813083          	ld	ra,24(sp)
    80002bec:	01013403          	ld	s0,16(sp)
    80002bf0:	00813483          	ld	s1,8(sp)
    80002bf4:	00013903          	ld	s2,0(sp)
    80002bf8:	02010113          	addi	sp,sp,32
    80002bfc:	00008067          	ret

0000000080002c00 <_ZN7Console4getcEv>:

char Console::getc() {
    80002c00:	ff010113          	addi	sp,sp,-16
    80002c04:	00113423          	sd	ra,8(sp)
    80002c08:	00813023          	sd	s0,0(sp)
    80002c0c:	01010413          	addi	s0,sp,16
    return ::getc();
    80002c10:	fffff097          	auipc	ra,0xfffff
    80002c14:	9f0080e7          	jalr	-1552(ra) # 80001600 <_Z4getcv>
}
    80002c18:	00813083          	ld	ra,8(sp)
    80002c1c:	00013403          	ld	s0,0(sp)
    80002c20:	01010113          	addi	sp,sp,16
    80002c24:	00008067          	ret

0000000080002c28 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002c28:	ff010113          	addi	sp,sp,-16
    80002c2c:	00113423          	sd	ra,8(sp)
    80002c30:	00813023          	sd	s0,0(sp)
    80002c34:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002c38:	fffff097          	auipc	ra,0xfffff
    80002c3c:	9f0080e7          	jalr	-1552(ra) # 80001628 <_Z4putcc>
}
    80002c40:	00813083          	ld	ra,8(sp)
    80002c44:	00013403          	ld	s0,0(sp)
    80002c48:	01010113          	addi	sp,sp,16
    80002c4c:	00008067          	ret

0000000080002c50 <_ZN6Thread3runEv>:
protected:
    //konstruktor koji pravi nit koja izvrsava run metodu, ne stavlja je u Scheduler
    Thread();

    //funkcija koju nit izvrsava, samo ako je nit napravljena podrazumevanim konstruktorom
    virtual void run() {}
    80002c50:	ff010113          	addi	sp,sp,-16
    80002c54:	00813423          	sd	s0,8(sp)
    80002c58:	01010413          	addi	s0,sp,16
    80002c5c:	00813403          	ld	s0,8(sp)
    80002c60:	01010113          	addi	sp,sp,16
    80002c64:	00008067          	ret

0000000080002c68 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    80002c68:	ff010113          	addi	sp,sp,-16
    80002c6c:	00813423          	sd	s0,8(sp)
    80002c70:	01010413          	addi	s0,sp,16
    80002c74:	00813403          	ld	s0,8(sp)
    80002c78:	01010113          	addi	sp,sp,16
    80002c7c:	00008067          	ret

0000000080002c80 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002c80:	ff010113          	addi	sp,sp,-16
    80002c84:	00113423          	sd	ra,8(sp)
    80002c88:	00813023          	sd	s0,0(sp)
    80002c8c:	01010413          	addi	s0,sp,16
    80002c90:	0000a797          	auipc	a5,0xa
    80002c94:	0f078793          	addi	a5,a5,240 # 8000cd80 <_ZTV14PeriodicThread+0x10>
    80002c98:	00f53023          	sd	a5,0(a0)
    80002c9c:	00000097          	auipc	ra,0x0
    80002ca0:	a34080e7          	jalr	-1484(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80002ca4:	00813083          	ld	ra,8(sp)
    80002ca8:	00013403          	ld	s0,0(sp)
    80002cac:	01010113          	addi	sp,sp,16
    80002cb0:	00008067          	ret

0000000080002cb4 <_ZN14PeriodicThreadD0Ev>:
    80002cb4:	fe010113          	addi	sp,sp,-32
    80002cb8:	00113c23          	sd	ra,24(sp)
    80002cbc:	00813823          	sd	s0,16(sp)
    80002cc0:	00913423          	sd	s1,8(sp)
    80002cc4:	02010413          	addi	s0,sp,32
    80002cc8:	00050493          	mv	s1,a0
    80002ccc:	0000a797          	auipc	a5,0xa
    80002cd0:	0b478793          	addi	a5,a5,180 # 8000cd80 <_ZTV14PeriodicThread+0x10>
    80002cd4:	00f53023          	sd	a5,0(a0)
    80002cd8:	00000097          	auipc	ra,0x0
    80002cdc:	9f8080e7          	jalr	-1544(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80002ce0:	00048513          	mv	a0,s1
    80002ce4:	00000097          	auipc	ra,0x0
    80002ce8:	af0080e7          	jalr	-1296(ra) # 800027d4 <_ZdlPv>
    80002cec:	01813083          	ld	ra,24(sp)
    80002cf0:	01013403          	ld	s0,16(sp)
    80002cf4:	00813483          	ld	s1,8(sp)
    80002cf8:	02010113          	addi	sp,sp,32
    80002cfc:	00008067          	ret

0000000080002d00 <_ZN3TCB7wrapperEv>:
    TCB::runningTimeSlice = 0;

    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
}

void TCB::wrapper() {
    80002d00:	ff010113          	addi	sp,sp,-16
    80002d04:	00113423          	sd	ra,8(sp)
    80002d08:	00813023          	sd	s0,0(sp)
    80002d0c:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch)

    //sada biramo u kom rezimu ce se izvrsavati nit, upisom bita SSTATUS_SPP
    //ako treba da se izvrsava kernel nit, povratak je u sistemski rezim, inace u korisnicki
    if (TCB::running->threadFunction == (TCB::Body)main || TCB::running->threadFunction == kernelConsumerFunction ||
    80002d10:	0000a797          	auipc	a5,0xa
    80002d14:	4e07b783          	ld	a5,1248(a5) # 8000d1f0 <_ZN3TCB7runningE>
    80002d18:	0107b783          	ld	a5,16(a5)
    80002d1c:	0000a717          	auipc	a4,0xa
    80002d20:	31473703          	ld	a4,788(a4) # 8000d030 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002d24:	02e78463          	beq	a5,a4,80002d4c <_ZN3TCB7wrapperEv+0x4c>
    80002d28:	0000a717          	auipc	a4,0xa
    80002d2c:	2e073703          	ld	a4,736(a4) # 8000d008 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002d30:	00e78e63          	beq	a5,a4,80002d4c <_ZN3TCB7wrapperEv+0x4c>
    80002d34:	0000a717          	auipc	a4,0xa
    80002d38:	32c73703          	ld	a4,812(a4) # 8000d060 <_GLOBAL_OFFSET_TABLE_+0x98>
    80002d3c:	00e78863          	beq	a5,a4,80002d4c <_ZN3TCB7wrapperEv+0x4c>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002d40:	10000793          	li	a5,256
    80002d44:	1007b073          	csrc	sstatus,a5
}
    80002d48:	00c0006f          	j	80002d54 <_ZN3TCB7wrapperEv+0x54>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002d4c:	10000793          	li	a5,256
    80002d50:	1007a073          	csrs	sstatus,a5
        TCB::running->threadFunction == idle) {
        Riscv::ms_sstatus(Riscv::SSTATUS_SPP);
    } else {
        Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    }
    Riscv::returnFromInterrupt();
    80002d54:	00000097          	auipc	ra,0x0
    80002d58:	400080e7          	jalr	1024(ra) # 80003154 <_ZN5Riscv19returnFromInterruptEv>
    //na dalje se izvrsavamo u user modu (osim za kernel funkcije)
    running->threadFunction(running->args);
    80002d5c:	0000a797          	auipc	a5,0xa
    80002d60:	4947b783          	ld	a5,1172(a5) # 8000d1f0 <_ZN3TCB7runningE>
    80002d64:	0107b703          	ld	a4,16(a5)
    80002d68:	0207b503          	ld	a0,32(a5)
    80002d6c:	000700e7          	jalr	a4
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    80002d70:	ffffe097          	auipc	ra,0xffffe
    80002d74:	728080e7          	jalr	1832(ra) # 80001498 <_Z11thread_exitv>
}
    80002d78:	00813083          	ld	ra,8(sp)
    80002d7c:	00013403          	ld	s0,0(sp)
    80002d80:	01010113          	addi	sp,sp,16
    80002d84:	00008067          	ret

0000000080002d88 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002d88:	fe010113          	addi	sp,sp,-32
    80002d8c:	00113c23          	sd	ra,24(sp)
    80002d90:	00813823          	sd	s0,16(sp)
    80002d94:	00913423          	sd	s1,8(sp)
    80002d98:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    80002d9c:	0000a497          	auipc	s1,0xa
    80002da0:	4544b483          	ld	s1,1108(s1) # 8000d1f0 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    80002da4:	0584a783          	lw	a5,88(s1)
    80002da8:	00100713          	li	a4,1
    80002dac:	04e78663          	beq	a5,a4,80002df8 <_ZN3TCB8dispatchEv+0x70>
    } else if (old->status == FINISHED) {
    80002db0:	00500713          	li	a4,5
    80002db4:	04e78a63          	beq	a5,a4,80002e08 <_ZN3TCB8dispatchEv+0x80>
    TCB::running = Scheduler::get();
    80002db8:	fffff097          	auipc	ra,0xfffff
    80002dbc:	b34080e7          	jalr	-1228(ra) # 800018ec <_ZN9Scheduler3getEv>
    80002dc0:	00050593          	mv	a1,a0
    80002dc4:	0000a797          	auipc	a5,0xa
    80002dc8:	42c78793          	addi	a5,a5,1068 # 8000d1f0 <_ZN3TCB7runningE>
    80002dcc:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80002dd0:	0007b423          	sd	zero,8(a5)
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002dd4:	00a48863          	beq	s1,a0,80002de4 <_ZN3TCB8dispatchEv+0x5c>
    80002dd8:	00048513          	mv	a0,s1
    80002ddc:	ffffe097          	auipc	ra,0xffffe
    80002de0:	334080e7          	jalr	820(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002de4:	01813083          	ld	ra,24(sp)
    80002de8:	01013403          	ld	s0,16(sp)
    80002dec:	00813483          	ld	s1,8(sp)
    80002df0:	02010113          	addi	sp,sp,32
    80002df4:	00008067          	ret
        Scheduler::put(old);
    80002df8:	00048513          	mv	a0,s1
    80002dfc:	fffff097          	auipc	ra,0xfffff
    80002e00:	aa4080e7          	jalr	-1372(ra) # 800018a0 <_ZN9Scheduler3putEP3TCB>
    80002e04:	fb5ff06f          	j	80002db8 <_ZN3TCB8dispatchEv+0x30>
        delete old->stack;
    80002e08:	0184b503          	ld	a0,24(s1)
    80002e0c:	00050663          	beqz	a0,80002e18 <_ZN3TCB8dispatchEv+0x90>
    80002e10:	00000097          	auipc	ra,0x0
    80002e14:	9c4080e7          	jalr	-1596(ra) # 800027d4 <_ZdlPv>
        old->stack = nullptr;
    80002e18:	0004bc23          	sd	zero,24(s1)
    80002e1c:	f9dff06f          	j	80002db8 <_ZN3TCB8dispatchEv+0x30>

0000000080002e20 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002e20:	ff010113          	addi	sp,sp,-16
    80002e24:	00113423          	sd	ra,8(sp)
    80002e28:	00813023          	sd	s0,0(sp)
    80002e2c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002e30:	ffffe097          	auipc	ra,0xffffe
    80002e34:	564080e7          	jalr	1380(ra) # 80001394 <_Z9mem_allocm>
}
    80002e38:	00813083          	ld	ra,8(sp)
    80002e3c:	00013403          	ld	s0,0(sp)
    80002e40:	01010113          	addi	sp,sp,16
    80002e44:	00008067          	ret

0000000080002e48 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002e48:	fd010113          	addi	sp,sp,-48
    80002e4c:	02113423          	sd	ra,40(sp)
    80002e50:	02813023          	sd	s0,32(sp)
    80002e54:	00913c23          	sd	s1,24(sp)
    80002e58:	01213823          	sd	s2,16(sp)
    80002e5c:	01313423          	sd	s3,8(sp)
    80002e60:	03010413          	addi	s0,sp,48
    80002e64:	00050913          	mv	s2,a0
    80002e68:	00058993          	mv	s3,a1
    80002e6c:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    80002e70:	07000513          	li	a0,112
    80002e74:	00000097          	auipc	ra,0x0
    80002e78:	fac080e7          	jalr	-84(ra) # 80002e20 <_ZN3TCBnwEm>
private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED), mySemaphore(nullptr),
                                                    joiningWithTCB(nullptr) {
    80002e7c:	01253823          	sd	s2,16(a0)
    80002e80:	00953c23          	sd	s1,24(a0)
    80002e84:	03353023          	sd	s3,32(a0)
    80002e88:	00200793          	li	a5,2
    80002e8c:	02f53423          	sd	a5,40(a0)
    80002e90:	02053823          	sd	zero,48(a0)
    80002e94:	02053c23          	sd	zero,56(a0)
    80002e98:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80002e9c:	04053423          	sd	zero,72(a0)
    80002ea0:	04053823          	sd	zero,80(a0)
    80002ea4:	04052c23          	sw	zero,88(a0)
    80002ea8:	06053023          	sd	zero,96(a0)
    80002eac:	06053423          	sd	zero,104(a0)
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80002eb0:	0000a797          	auipc	a5,0xa
    80002eb4:	1807b783          	ld	a5,384(a5) # 8000d030 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002eb8:	02f90e63          	beq	s2,a5,80002ef4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002ebc:	00000797          	auipc	a5,0x0
    80002ec0:	e4478793          	addi	a5,a5,-444 # 80002d00 <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002ec4:	02048c63          	beqz	s1,80002efc <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb4>
    80002ec8:	00001637          	lui	a2,0x1
    80002ecc:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    80002ed0:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    80002ed4:	00953423          	sd	s1,8(a0)
}
    80002ed8:	02813083          	ld	ra,40(sp)
    80002edc:	02013403          	ld	s0,32(sp)
    80002ee0:	01813483          	ld	s1,24(sp)
    80002ee4:	01013903          	ld	s2,16(sp)
    80002ee8:	00813983          	ld	s3,8(sp)
    80002eec:	03010113          	addi	sp,sp,48
    80002ef0:	00008067          	ret
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80002ef4:	00000793          	li	a5,0
    80002ef8:	fcdff06f          	j	80002ec4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x7c>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002efc:	00000493          	li	s1,0
    80002f00:	fd1ff06f          	j	80002ed0 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x88>

0000000080002f04 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002f04:	ff010113          	addi	sp,sp,-16
    80002f08:	00113423          	sd	ra,8(sp)
    80002f0c:	00813023          	sd	s0,0(sp)
    80002f10:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002f14:	ffffe097          	auipc	ra,0xffffe
    80002f18:	4c0080e7          	jalr	1216(ra) # 800013d4 <_Z8mem_freePv>
}
    80002f1c:	00813083          	ld	ra,8(sp)
    80002f20:	00013403          	ld	s0,0(sp)
    80002f24:	01010113          	addi	sp,sp,16
    80002f28:	00008067          	ret

0000000080002f2c <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED || TCB::running == handle) return;
    80002f2c:	05852703          	lw	a4,88(a0)
    80002f30:	00500793          	li	a5,5
    80002f34:	04f70463          	beq	a4,a5,80002f7c <_ZN3TCB10threadJoinEPS_+0x50>
    80002f38:	0000a597          	auipc	a1,0xa
    80002f3c:	2b85b583          	ld	a1,696(a1) # 8000d1f0 <_ZN3TCB7runningE>
    80002f40:	02a58e63          	beq	a1,a0,80002f7c <_ZN3TCB10threadJoinEPS_+0x50>
void TCB::threadJoin(TCB* handle) {
    80002f44:	ff010113          	addi	sp,sp,-16
    80002f48:	00113423          	sd	ra,8(sp)
    80002f4c:	00813023          	sd	s0,0(sp)
    80002f50:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    80002f54:	00300793          	li	a5,3
    80002f58:	04f5ac23          	sw	a5,88(a1)
    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }
    80002f5c:	06a5b423          	sd	a0,104(a1)
    TCB::running->setJoiningWithTCB(handle);
    handle->waitingToJoin.putLast(TCB::running);
    80002f60:	04850513          	addi	a0,a0,72
    80002f64:	ffffe097          	auipc	ra,0xffffe
    80002f68:	2d8080e7          	jalr	728(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002f6c:	00813083          	ld	ra,8(sp)
    80002f70:	00013403          	ld	s0,0(sp)
    80002f74:	01010113          	addi	sp,sp,16
    80002f78:	00008067          	ret
    80002f7c:	00008067          	ret

0000000080002f80 <_ZN3TCB13releaseJoinedEPS_>:

void TCB::releaseJoined(TCB* handle) {
    80002f80:	fe010113          	addi	sp,sp,-32
    80002f84:	00113c23          	sd	ra,24(sp)
    80002f88:	00813823          	sd	s0,16(sp)
    80002f8c:	00913423          	sd	s1,8(sp)
    80002f90:	02010413          	addi	s0,sp,32
    80002f94:	00050493          	mv	s1,a0
        return front == nullptr;
    80002f98:	0484b783          	ld	a5,72(s1)
    while (!handle->waitingToJoin.isEmpty()) {
    80002f9c:	02078063          	beqz	a5,80002fbc <_ZN3TCB13releaseJoinedEPS_+0x3c>
        TCB* tcb = handle->waitingToJoin.getFirst();
    80002fa0:	04848513          	addi	a0,s1,72
    80002fa4:	ffffe097          	auipc	ra,0xffffe
    80002fa8:	304080e7          	jalr	772(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
    80002fac:	06053423          	sd	zero,104(a0)
        tcb->setJoiningWithTCB(nullptr);
        Scheduler::put(tcb);
    80002fb0:	fffff097          	auipc	ra,0xfffff
    80002fb4:	8f0080e7          	jalr	-1808(ra) # 800018a0 <_ZN9Scheduler3putEP3TCB>
    while (!handle->waitingToJoin.isEmpty()) {
    80002fb8:	fe1ff06f          	j	80002f98 <_ZN3TCB13releaseJoinedEPS_+0x18>
    }
}
    80002fbc:	01813083          	ld	ra,24(sp)
    80002fc0:	01013403          	ld	s0,16(sp)
    80002fc4:	00813483          	ld	s1,8(sp)
    80002fc8:	02010113          	addi	sp,sp,32
    80002fcc:	00008067          	ret

0000000080002fd0 <_ZN3TCB10quitThreadEPS_>:

void TCB::quitThread(TCB* handle) {
    80002fd0:	fe010113          	addi	sp,sp,-32
    80002fd4:	00113c23          	sd	ra,24(sp)
    80002fd8:	00813823          	sd	s0,16(sp)
    80002fdc:	00913423          	sd	s1,8(sp)
    80002fe0:	02010413          	addi	s0,sp,32
    80002fe4:	00050493          	mv	s1,a0
    TCB* prev, * curr;
    switch (handle->status) {
    80002fe8:	05852783          	lw	a5,88(a0)
    80002fec:	00300713          	li	a4,3
    80002ff0:	10e78063          	beq	a5,a4,800030f0 <_ZN3TCB10quitThreadEPS_+0x120>
    80002ff4:	04f76263          	bltu	a4,a5,80003038 <_ZN3TCB10quitThreadEPS_+0x68>
    80002ff8:	00100713          	li	a4,1
    80002ffc:	06e78263          	beq	a5,a4,80003060 <_ZN3TCB10quitThreadEPS_+0x90>
    80003000:	00200713          	li	a4,2
    80003004:	08e79e63          	bne	a5,a4,800030a0 <_ZN3TCB10quitThreadEPS_+0xd0>
            }
            curr->nextInScheduler = nullptr;
            break;
        case BLOCKED:
            //nit blokirana na semaforu, treba da se izbaci iz reda blokiranih na semaforu
            if (handle->mySemaphore->getBlocked()->remove(handle) < 0) {
    80003008:	06053503          	ld	a0,96(a0)
    8000300c:	00048593          	mv	a1,s1
    80003010:	00850513          	addi	a0,a0,8
    80003014:	ffffe097          	auipc	ra,0xffffe
    80003018:	2f4080e7          	jalr	756(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    8000301c:	08054263          	bltz	a0,800030a0 <_ZN3TCB10quitThreadEPS_+0xd0>
                //greska
            } else {
                handle->mySemaphore->increaseVal(1);
    80003020:	0604b703          	ld	a4,96(s1)

    static void operator delete(void* ptr);

    ThreadQueue* getBlocked() { return &blocked; }

    void increaseVal(int add) { val += add; }
    80003024:	00072783          	lw	a5,0(a4)
    80003028:	0017879b          	addiw	a5,a5,1
    8000302c:	00f72023          	sw	a5,0(a4)
                handle->mySemaphore = nullptr;
    80003030:	0604b023          	sd	zero,96(s1)
    80003034:	06c0006f          	j	800030a0 <_ZN3TCB10quitThreadEPS_+0xd0>
    switch (handle->status) {
    80003038:	00400713          	li	a4,4
    8000303c:	06e79263          	bne	a5,a4,800030a0 <_ZN3TCB10quitThreadEPS_+0xd0>

    static TCB* getTail() { return tail; }

    static void setTail(TCB* tcb) { tail = tcb; }

    static TCB* getSleepingHead() { return sleepingHead; }
    80003040:	0000a797          	auipc	a5,0xa
    80003044:	0187b783          	ld	a5,24(a5) # 8000d058 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003048:	0007b783          	ld	a5,0(a5)
                handle->joiningWithTCB = nullptr;
            }
            break;
        case SLEEPING:
            //nit je u redu uspavanih, treba da se izbaci
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    8000304c:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextSleeping);
    80003050:	0c978063          	beq	a5,s1,80003110 <_ZN3TCB10quitThreadEPS_+0x140>
    80003054:	00078713          	mv	a4,a5
    80003058:	0407b783          	ld	a5,64(a5)
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    8000305c:	ff5ff06f          	j	80003050 <_ZN3TCB10quitThreadEPS_+0x80>
    static TCB* getHead() { return head; }
    80003060:	0000a797          	auipc	a5,0xa
    80003064:	fb07b783          	ld	a5,-80(a5) # 8000d010 <_GLOBAL_OFFSET_TABLE_+0x48>
    80003068:	0007b783          	ld	a5,0(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    8000306c:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextInScheduler);
    80003070:	00978863          	beq	a5,s1,80003080 <_ZN3TCB10quitThreadEPS_+0xb0>
    80003074:	00078713          	mv	a4,a5
    80003078:	0307b783          	ld	a5,48(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    8000307c:	ff5ff06f          	j	80003070 <_ZN3TCB10quitThreadEPS_+0xa0>
            if (!prev) {
    80003080:	04070663          	beqz	a4,800030cc <_ZN3TCB10quitThreadEPS_+0xfc>
                prev->nextInScheduler = curr->nextInScheduler;
    80003084:	0307b683          	ld	a3,48(a5)
    80003088:	02d73823          	sd	a3,48(a4)
    static TCB* getTail() { return tail; }
    8000308c:	0000a697          	auipc	a3,0xa
    80003090:	f646b683          	ld	a3,-156(a3) # 8000cff0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003094:	0006b683          	ld	a3,0(a3)
            if (curr == Scheduler::getTail()) {
    80003098:	04d78463          	beq	a5,a3,800030e0 <_ZN3TCB10quitThreadEPS_+0x110>
            curr->nextInScheduler = nullptr;
    8000309c:	0207b823          	sd	zero,48(a5)
        case FINISHED:
            break;
        default:
            break;
    }
    handle->status = FINISHED;
    800030a0:	00500793          	li	a5,5
    800030a4:	04f4ac23          	sw	a5,88(s1)
    delete handle->stack;
    800030a8:	0184b503          	ld	a0,24(s1)
    800030ac:	00050663          	beqz	a0,800030b8 <_ZN3TCB10quitThreadEPS_+0xe8>
    800030b0:	fffff097          	auipc	ra,0xfffff
    800030b4:	724080e7          	jalr	1828(ra) # 800027d4 <_ZdlPv>
}
    800030b8:	01813083          	ld	ra,24(sp)
    800030bc:	01013403          	ld	s0,16(sp)
    800030c0:	00813483          	ld	s1,8(sp)
    800030c4:	02010113          	addi	sp,sp,32
    800030c8:	00008067          	ret
                Scheduler::setHead(curr->nextInScheduler);
    800030cc:	0307b603          	ld	a2,48(a5)
    static void setHead(TCB* tcb) { head = tcb; }
    800030d0:	0000a697          	auipc	a3,0xa
    800030d4:	f406b683          	ld	a3,-192(a3) # 8000d010 <_GLOBAL_OFFSET_TABLE_+0x48>
    800030d8:	00c6b023          	sd	a2,0(a3)
    800030dc:	fb1ff06f          	j	8000308c <_ZN3TCB10quitThreadEPS_+0xbc>
    static void setTail(TCB* tcb) { tail = tcb; }
    800030e0:	0000a697          	auipc	a3,0xa
    800030e4:	f106b683          	ld	a3,-240(a3) # 8000cff0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800030e8:	00e6b023          	sd	a4,0(a3)
    800030ec:	fb1ff06f          	j	8000309c <_ZN3TCB10quitThreadEPS_+0xcc>
            if (handle->joiningWithTCB->getListOfJoiningThreads()->remove(handle) < 0) {
    800030f0:	06853503          	ld	a0,104(a0)
    800030f4:	00048593          	mv	a1,s1
    800030f8:	04850513          	addi	a0,a0,72
    800030fc:	ffffe097          	auipc	ra,0xffffe
    80003100:	20c080e7          	jalr	524(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    80003104:	f8054ee3          	bltz	a0,800030a0 <_ZN3TCB10quitThreadEPS_+0xd0>
                handle->joiningWithTCB = nullptr;
    80003108:	0604b423          	sd	zero,104(s1)
    8000310c:	f95ff06f          	j	800030a0 <_ZN3TCB10quitThreadEPS_+0xd0>
            if (!prev) {
    80003110:	02070863          	beqz	a4,80003140 <_ZN3TCB10quitThreadEPS_+0x170>
                prev->nextSleeping = curr->nextSleeping;
    80003114:	0407b683          	ld	a3,64(a5)
    80003118:	04d73023          	sd	a3,64(a4)
            if (curr->nextSleeping) {
    8000311c:	0407b703          	ld	a4,64(a5)
    80003120:	00070a63          	beqz	a4,80003134 <_ZN3TCB10quitThreadEPS_+0x164>
                curr->nextSleeping->timeToSleep += curr->timeToSleep;
    80003124:	0387b603          	ld	a2,56(a5)
    80003128:	03873683          	ld	a3,56(a4)
    8000312c:	00c686b3          	add	a3,a3,a2
    80003130:	02d73c23          	sd	a3,56(a4)
            curr->timeToSleep = 0;
    80003134:	0207bc23          	sd	zero,56(a5)
            curr->nextSleeping = nullptr;
    80003138:	0407b023          	sd	zero,64(a5)
            break;
    8000313c:	f65ff06f          	j	800030a0 <_ZN3TCB10quitThreadEPS_+0xd0>
                Scheduler::setSleepingHead(curr->nextSleeping);
    80003140:	0407b683          	ld	a3,64(a5)

    static void setSleepingHead(TCB* tcb) { sleepingHead = tcb; }
    80003144:	0000a717          	auipc	a4,0xa
    80003148:	f1473703          	ld	a4,-236(a4) # 8000d058 <_GLOBAL_OFFSET_TABLE_+0x90>
    8000314c:	00d73023          	sd	a3,0(a4)
    80003150:	fcdff06f          	j	8000311c <_ZN3TCB10quitThreadEPS_+0x14c>

0000000080003154 <_ZN5Riscv19returnFromInterruptEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::returnFromInterrupt() {
    80003154:	ff010113          	addi	sp,sp,-16
    80003158:	00813423          	sd	s0,8(sp)
    8000315c:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80003160:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80003164:	10200073          	sret
    80003168:	00813403          	ld	s0,8(sp)
    8000316c:	01010113          	addi	sp,sp,16
    80003170:	00008067          	ret

0000000080003174 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80003174:	ff010113          	addi	sp,sp,-16
    80003178:	00113423          	sd	ra,8(sp)
    8000317c:	00813023          	sd	s0,0(sp)
    80003180:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003184:	ffffe097          	auipc	ra,0xffffe
    80003188:	210080e7          	jalr	528(ra) # 80001394 <_Z9mem_allocm>
}
    8000318c:	00813083          	ld	ra,8(sp)
    80003190:	00013403          	ld	s0,0(sp)
    80003194:	01010113          	addi	sp,sp,16
    80003198:	00008067          	ret

000000008000319c <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    8000319c:	ff010113          	addi	sp,sp,-16
    800031a0:	00113423          	sd	ra,8(sp)
    800031a4:	00813023          	sd	s0,0(sp)
    800031a8:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    800031ac:	ffffe097          	auipc	ra,0xffffe
    800031b0:	228080e7          	jalr	552(ra) # 800013d4 <_Z8mem_freePv>
}
    800031b4:	00813083          	ld	ra,8(sp)
    800031b8:	00013403          	ld	s0,0(sp)
    800031bc:	01010113          	addi	sp,sp,16
    800031c0:	00008067          	ret

00000000800031c4 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    800031c4:	fe010113          	addi	sp,sp,-32
    800031c8:	00113c23          	sd	ra,24(sp)
    800031cc:	00813823          	sd	s0,16(sp)
    800031d0:	00913423          	sd	s1,8(sp)
    800031d4:	02010413          	addi	s0,sp,32
    800031d8:	00050493          	mv	s1,a0
	return new KSem(val);
    800031dc:	01800513          	li	a0,24
    800031e0:	00000097          	auipc	ra,0x0
    800031e4:	f94080e7          	jalr	-108(ra) # 80003174 <_ZN4KSemnwEm>
    void block();

    void unblock();

private:
    KSem(uint val) : val(val) {}
    800031e8:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    800031ec:	00053423          	sd	zero,8(a0)
    800031f0:	00053823          	sd	zero,16(a0)
}
    800031f4:	01813083          	ld	ra,24(sp)
    800031f8:	01013403          	ld	s0,16(sp)
    800031fc:	00813483          	ld	s1,8(sp)
    80003200:	02010113          	addi	sp,sp,32
    80003204:	00008067          	ret

0000000080003208 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003208:	ff010113          	addi	sp,sp,-16
    8000320c:	00113423          	sd	ra,8(sp)
    80003210:	00813023          	sd	s0,0(sp)
    80003214:	01010413          	addi	s0,sp,16
    static TCB* getRunning() { return running; }
    80003218:	0000a797          	auipc	a5,0xa
    8000321c:	e287b783          	ld	a5,-472(a5) # 8000d040 <_GLOBAL_OFFSET_TABLE_+0x78>
    80003220:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80003224:	00200793          	li	a5,2
    80003228:	04f5ac23          	sw	a5,88(a1)
    void setMySemaphore(KSem* sem) { mySemaphore = sem; }
    8000322c:	06a5b023          	sd	a0,96(a1)
    TCB::getRunning()->setStatus(TCB::BLOCKED);
    TCB::getRunning()->setMySemaphore(this);
	blocked.putLast(TCB::getRunning());
    80003230:	00850513          	addi	a0,a0,8
    80003234:	ffffe097          	auipc	ra,0xffffe
    80003238:	008080e7          	jalr	8(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::dispatch();
    8000323c:	00000097          	auipc	ra,0x0
    80003240:	b4c080e7          	jalr	-1204(ra) # 80002d88 <_ZN3TCB8dispatchEv>
}
    80003244:	00813083          	ld	ra,8(sp)
    80003248:	00013403          	ld	s0,0(sp)
    8000324c:	01010113          	addi	sp,sp,16
    80003250:	00008067          	ret

0000000080003254 <_ZN4KSem4waitEv>:
	if (--val < 0) {
    80003254:	00052783          	lw	a5,0(a0)
    80003258:	fff7879b          	addiw	a5,a5,-1
    8000325c:	00f52023          	sw	a5,0(a0)
    80003260:	02079713          	slli	a4,a5,0x20
    80003264:	00074663          	bltz	a4,80003270 <_ZN4KSem4waitEv+0x1c>
	return 0;
    80003268:	00000513          	li	a0,0
}
    8000326c:	00008067          	ret
int KSem::wait() {
    80003270:	ff010113          	addi	sp,sp,-16
    80003274:	00113423          	sd	ra,8(sp)
    80003278:	00813023          	sd	s0,0(sp)
    8000327c:	01010413          	addi	s0,sp,16
		block();
    80003280:	00000097          	auipc	ra,0x0
    80003284:	f88080e7          	jalr	-120(ra) # 80003208 <_ZN4KSem5blockEv>
		return -1;
    80003288:	fff00513          	li	a0,-1
}
    8000328c:	00813083          	ld	ra,8(sp)
    80003290:	00013403          	ld	s0,0(sp)
    80003294:	01010113          	addi	sp,sp,16
    80003298:	00008067          	ret

000000008000329c <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    8000329c:	ff010113          	addi	sp,sp,-16
    800032a0:	00113423          	sd	ra,8(sp)
    800032a4:	00813023          	sd	s0,0(sp)
    800032a8:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    800032ac:	00850513          	addi	a0,a0,8
    800032b0:	ffffe097          	auipc	ra,0xffffe
    800032b4:	ff8080e7          	jalr	-8(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
    800032b8:	06053023          	sd	zero,96(a0)
    tcb->setMySemaphore(nullptr);
	Scheduler::put(tcb);
    800032bc:	ffffe097          	auipc	ra,0xffffe
    800032c0:	5e4080e7          	jalr	1508(ra) # 800018a0 <_ZN9Scheduler3putEP3TCB>
}
    800032c4:	00813083          	ld	ra,8(sp)
    800032c8:	00013403          	ld	s0,0(sp)
    800032cc:	01010113          	addi	sp,sp,16
    800032d0:	00008067          	ret

00000000800032d4 <_ZN4KSem6signalEv>:
	if (val++ < 0) {
    800032d4:	00052783          	lw	a5,0(a0)
    800032d8:	0017871b          	addiw	a4,a5,1
    800032dc:	00e52023          	sw	a4,0(a0)
    800032e0:	0007c663          	bltz	a5,800032ec <_ZN4KSem6signalEv+0x18>
}
    800032e4:	00000513          	li	a0,0
    800032e8:	00008067          	ret
int KSem::signal() {
    800032ec:	ff010113          	addi	sp,sp,-16
    800032f0:	00113423          	sd	ra,8(sp)
    800032f4:	00813023          	sd	s0,0(sp)
    800032f8:	01010413          	addi	s0,sp,16
		unblock();
    800032fc:	00000097          	auipc	ra,0x0
    80003300:	fa0080e7          	jalr	-96(ra) # 8000329c <_ZN4KSem7unblockEv>
}
    80003304:	00000513          	li	a0,0
    80003308:	00813083          	ld	ra,8(sp)
    8000330c:	00013403          	ld	s0,0(sp)
    80003310:	01010113          	addi	sp,sp,16
    80003314:	00008067          	ret

0000000080003318 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003318:	fe010113          	addi	sp,sp,-32
    8000331c:	00113c23          	sd	ra,24(sp)
    80003320:	00813823          	sd	s0,16(sp)
    80003324:	00913423          	sd	s1,8(sp)
    80003328:	02010413          	addi	s0,sp,32
    8000332c:	00050493          	mv	s1,a0
        return front == nullptr;
    80003330:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003334:	00078a63          	beqz	a5,80003348 <_ZN4KSem8closeSemEPS_+0x30>
		handle->unblock();
    80003338:	00048513          	mv	a0,s1
    8000333c:	00000097          	auipc	ra,0x0
    80003340:	f60080e7          	jalr	-160(ra) # 8000329c <_ZN4KSem7unblockEv>
	while (!handle->blocked.isEmpty()) {
    80003344:	fedff06f          	j	80003330 <_ZN4KSem8closeSemEPS_+0x18>
	}
	return 0;
}
    80003348:	00000513          	li	a0,0
    8000334c:	01813083          	ld	ra,24(sp)
    80003350:	01013403          	ld	s0,16(sp)
    80003354:	00813483          	ld	s1,8(sp)
    80003358:	02010113          	addi	sp,sp,32
    8000335c:	00008067          	ret

0000000080003360 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003360:	fe010113          	addi	sp,sp,-32
    80003364:	00113c23          	sd	ra,24(sp)
    80003368:	00813823          	sd	s0,16(sp)
    8000336c:	00913423          	sd	s1,8(sp)
    80003370:	01213023          	sd	s2,0(sp)
    80003374:	02010413          	addi	s0,sp,32
    80003378:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000337c:	00000913          	li	s2,0
    80003380:	00c0006f          	j	8000338c <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003384:	ffffe097          	auipc	ra,0xffffe
    80003388:	13c080e7          	jalr	316(ra) # 800014c0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    8000338c:	ffffe097          	auipc	ra,0xffffe
    80003390:	274080e7          	jalr	628(ra) # 80001600 <_Z4getcv>
    80003394:	0005059b          	sext.w	a1,a0
    80003398:	02d00793          	li	a5,45
    8000339c:	02f58a63          	beq	a1,a5,800033d0 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800033a0:	0084b503          	ld	a0,8(s1)
    800033a4:	00003097          	auipc	ra,0x3
    800033a8:	400080e7          	jalr	1024(ra) # 800067a4 <_ZN6Buffer3putEi>
        i++;
    800033ac:	0019071b          	addiw	a4,s2,1
    800033b0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800033b4:	0004a683          	lw	a3,0(s1)
    800033b8:	0026979b          	slliw	a5,a3,0x2
    800033bc:	00d787bb          	addw	a5,a5,a3
    800033c0:	0017979b          	slliw	a5,a5,0x1
    800033c4:	02f767bb          	remw	a5,a4,a5
    800033c8:	fc0792e3          	bnez	a5,8000338c <_ZL16producerKeyboardPv+0x2c>
    800033cc:	fb9ff06f          	j	80003384 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800033d0:	00100793          	li	a5,1
    800033d4:	0000a717          	auipc	a4,0xa
    800033d8:	e2f72623          	sw	a5,-468(a4) # 8000d200 <_ZL9threadEnd>
    data->buffer->put('!');
    800033dc:	02100593          	li	a1,33
    800033e0:	0084b503          	ld	a0,8(s1)
    800033e4:	00003097          	auipc	ra,0x3
    800033e8:	3c0080e7          	jalr	960(ra) # 800067a4 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800033ec:	0104b503          	ld	a0,16(s1)
    800033f0:	ffffe097          	auipc	ra,0xffffe
    800033f4:	1e0080e7          	jalr	480(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    800033f8:	01813083          	ld	ra,24(sp)
    800033fc:	01013403          	ld	s0,16(sp)
    80003400:	00813483          	ld	s1,8(sp)
    80003404:	00013903          	ld	s2,0(sp)
    80003408:	02010113          	addi	sp,sp,32
    8000340c:	00008067          	ret

0000000080003410 <_ZL8producerPv>:

static void producer(void *arg) {
    80003410:	fe010113          	addi	sp,sp,-32
    80003414:	00113c23          	sd	ra,24(sp)
    80003418:	00813823          	sd	s0,16(sp)
    8000341c:	00913423          	sd	s1,8(sp)
    80003420:	01213023          	sd	s2,0(sp)
    80003424:	02010413          	addi	s0,sp,32
    80003428:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000342c:	00000913          	li	s2,0
    80003430:	00c0006f          	j	8000343c <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003434:	ffffe097          	auipc	ra,0xffffe
    80003438:	08c080e7          	jalr	140(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    8000343c:	0000a797          	auipc	a5,0xa
    80003440:	dc47a783          	lw	a5,-572(a5) # 8000d200 <_ZL9threadEnd>
    80003444:	02079e63          	bnez	a5,80003480 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003448:	0004a583          	lw	a1,0(s1)
    8000344c:	0305859b          	addiw	a1,a1,48
    80003450:	0084b503          	ld	a0,8(s1)
    80003454:	00003097          	auipc	ra,0x3
    80003458:	350080e7          	jalr	848(ra) # 800067a4 <_ZN6Buffer3putEi>
        i++;
    8000345c:	0019071b          	addiw	a4,s2,1
    80003460:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003464:	0004a683          	lw	a3,0(s1)
    80003468:	0026979b          	slliw	a5,a3,0x2
    8000346c:	00d787bb          	addw	a5,a5,a3
    80003470:	0017979b          	slliw	a5,a5,0x1
    80003474:	02f767bb          	remw	a5,a4,a5
    80003478:	fc0792e3          	bnez	a5,8000343c <_ZL8producerPv+0x2c>
    8000347c:	fb9ff06f          	j	80003434 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003480:	0104b503          	ld	a0,16(s1)
    80003484:	ffffe097          	auipc	ra,0xffffe
    80003488:	14c080e7          	jalr	332(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    8000348c:	01813083          	ld	ra,24(sp)
    80003490:	01013403          	ld	s0,16(sp)
    80003494:	00813483          	ld	s1,8(sp)
    80003498:	00013903          	ld	s2,0(sp)
    8000349c:	02010113          	addi	sp,sp,32
    800034a0:	00008067          	ret

00000000800034a4 <_ZL8consumerPv>:

static void consumer(void *arg) {
    800034a4:	fd010113          	addi	sp,sp,-48
    800034a8:	02113423          	sd	ra,40(sp)
    800034ac:	02813023          	sd	s0,32(sp)
    800034b0:	00913c23          	sd	s1,24(sp)
    800034b4:	01213823          	sd	s2,16(sp)
    800034b8:	01313423          	sd	s3,8(sp)
    800034bc:	03010413          	addi	s0,sp,48
    800034c0:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800034c4:	00000993          	li	s3,0
    800034c8:	01c0006f          	j	800034e4 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800034cc:	ffffe097          	auipc	ra,0xffffe
    800034d0:	ff4080e7          	jalr	-12(ra) # 800014c0 <_Z15thread_dispatchv>
    800034d4:	0500006f          	j	80003524 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800034d8:	00a00513          	li	a0,10
    800034dc:	ffffe097          	auipc	ra,0xffffe
    800034e0:	14c080e7          	jalr	332(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    800034e4:	0000a797          	auipc	a5,0xa
    800034e8:	d1c7a783          	lw	a5,-740(a5) # 8000d200 <_ZL9threadEnd>
    800034ec:	06079063          	bnez	a5,8000354c <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800034f0:	00893503          	ld	a0,8(s2)
    800034f4:	00003097          	auipc	ra,0x3
    800034f8:	340080e7          	jalr	832(ra) # 80006834 <_ZN6Buffer3getEv>
        i++;
    800034fc:	0019849b          	addiw	s1,s3,1
    80003500:	0004899b          	sext.w	s3,s1
        putc(key);
    80003504:	0ff57513          	andi	a0,a0,255
    80003508:	ffffe097          	auipc	ra,0xffffe
    8000350c:	120080e7          	jalr	288(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003510:	00092703          	lw	a4,0(s2)
    80003514:	0027179b          	slliw	a5,a4,0x2
    80003518:	00e787bb          	addw	a5,a5,a4
    8000351c:	02f4e7bb          	remw	a5,s1,a5
    80003520:	fa0786e3          	beqz	a5,800034cc <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003524:	05000793          	li	a5,80
    80003528:	02f4e4bb          	remw	s1,s1,a5
    8000352c:	fa049ce3          	bnez	s1,800034e4 <_ZL8consumerPv+0x40>
    80003530:	fa9ff06f          	j	800034d8 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003534:	00893503          	ld	a0,8(s2)
    80003538:	00003097          	auipc	ra,0x3
    8000353c:	2fc080e7          	jalr	764(ra) # 80006834 <_ZN6Buffer3getEv>
        putc(key);
    80003540:	0ff57513          	andi	a0,a0,255
    80003544:	ffffe097          	auipc	ra,0xffffe
    80003548:	0e4080e7          	jalr	228(ra) # 80001628 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    8000354c:	00893503          	ld	a0,8(s2)
    80003550:	00003097          	auipc	ra,0x3
    80003554:	370080e7          	jalr	880(ra) # 800068c0 <_ZN6Buffer6getCntEv>
    80003558:	fca04ee3          	bgtz	a0,80003534 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    8000355c:	01093503          	ld	a0,16(s2)
    80003560:	ffffe097          	auipc	ra,0xffffe
    80003564:	070080e7          	jalr	112(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80003568:	02813083          	ld	ra,40(sp)
    8000356c:	02013403          	ld	s0,32(sp)
    80003570:	01813483          	ld	s1,24(sp)
    80003574:	01013903          	ld	s2,16(sp)
    80003578:	00813983          	ld	s3,8(sp)
    8000357c:	03010113          	addi	sp,sp,48
    80003580:	00008067          	ret

0000000080003584 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003584:	f9010113          	addi	sp,sp,-112
    80003588:	06113423          	sd	ra,104(sp)
    8000358c:	06813023          	sd	s0,96(sp)
    80003590:	04913c23          	sd	s1,88(sp)
    80003594:	05213823          	sd	s2,80(sp)
    80003598:	05313423          	sd	s3,72(sp)
    8000359c:	05413023          	sd	s4,64(sp)
    800035a0:	03513c23          	sd	s5,56(sp)
    800035a4:	03613823          	sd	s6,48(sp)
    800035a8:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800035ac:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800035b0:	00007517          	auipc	a0,0x7
    800035b4:	c7850513          	addi	a0,a0,-904 # 8000a228 <CONSOLE_STATUS+0x218>
    800035b8:	00002097          	auipc	ra,0x2
    800035bc:	220080e7          	jalr	544(ra) # 800057d8 <_Z11printStringPKc>
    getString(input, 30);
    800035c0:	01e00593          	li	a1,30
    800035c4:	fa040493          	addi	s1,s0,-96
    800035c8:	00048513          	mv	a0,s1
    800035cc:	00002097          	auipc	ra,0x2
    800035d0:	294080e7          	jalr	660(ra) # 80005860 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800035d4:	00048513          	mv	a0,s1
    800035d8:	00002097          	auipc	ra,0x2
    800035dc:	360080e7          	jalr	864(ra) # 80005938 <_Z11stringToIntPKc>
    800035e0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800035e4:	00007517          	auipc	a0,0x7
    800035e8:	c6450513          	addi	a0,a0,-924 # 8000a248 <CONSOLE_STATUS+0x238>
    800035ec:	00002097          	auipc	ra,0x2
    800035f0:	1ec080e7          	jalr	492(ra) # 800057d8 <_Z11printStringPKc>
    getString(input, 30);
    800035f4:	01e00593          	li	a1,30
    800035f8:	00048513          	mv	a0,s1
    800035fc:	00002097          	auipc	ra,0x2
    80003600:	264080e7          	jalr	612(ra) # 80005860 <_Z9getStringPci>
    n = stringToInt(input);
    80003604:	00048513          	mv	a0,s1
    80003608:	00002097          	auipc	ra,0x2
    8000360c:	330080e7          	jalr	816(ra) # 80005938 <_Z11stringToIntPKc>
    80003610:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003614:	00007517          	auipc	a0,0x7
    80003618:	c5450513          	addi	a0,a0,-940 # 8000a268 <CONSOLE_STATUS+0x258>
    8000361c:	00002097          	auipc	ra,0x2
    80003620:	1bc080e7          	jalr	444(ra) # 800057d8 <_Z11printStringPKc>
	printInt(threadNum);
    80003624:	00000613          	li	a2,0
    80003628:	00a00593          	li	a1,10
    8000362c:	00090513          	mv	a0,s2
    80003630:	00002097          	auipc	ra,0x2
    80003634:	358080e7          	jalr	856(ra) # 80005988 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003638:	00007517          	auipc	a0,0x7
    8000363c:	c4850513          	addi	a0,a0,-952 # 8000a280 <CONSOLE_STATUS+0x270>
    80003640:	00002097          	auipc	ra,0x2
    80003644:	198080e7          	jalr	408(ra) # 800057d8 <_Z11printStringPKc>
	printInt(n);
    80003648:	00000613          	li	a2,0
    8000364c:	00a00593          	li	a1,10
    80003650:	00048513          	mv	a0,s1
    80003654:	00002097          	auipc	ra,0x2
    80003658:	334080e7          	jalr	820(ra) # 80005988 <_Z8printIntiii>
    printString(".\n");
    8000365c:	00007517          	auipc	a0,0x7
    80003660:	c3c50513          	addi	a0,a0,-964 # 8000a298 <CONSOLE_STATUS+0x288>
    80003664:	00002097          	auipc	ra,0x2
    80003668:	174080e7          	jalr	372(ra) # 800057d8 <_Z11printStringPKc>
    if(threadNum > n) {
    8000366c:	0324c463          	blt	s1,s2,80003694 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003670:	03205c63          	blez	s2,800036a8 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003674:	03800513          	li	a0,56
    80003678:	fffff097          	auipc	ra,0xfffff
    8000367c:	10c080e7          	jalr	268(ra) # 80002784 <_Znwm>
    80003680:	00050a13          	mv	s4,a0
    80003684:	00048593          	mv	a1,s1
    80003688:	00003097          	auipc	ra,0x3
    8000368c:	080080e7          	jalr	128(ra) # 80006708 <_ZN6BufferC1Ei>
    80003690:	0300006f          	j	800036c0 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003694:	00007517          	auipc	a0,0x7
    80003698:	c0c50513          	addi	a0,a0,-1012 # 8000a2a0 <CONSOLE_STATUS+0x290>
    8000369c:	00002097          	auipc	ra,0x2
    800036a0:	13c080e7          	jalr	316(ra) # 800057d8 <_Z11printStringPKc>
        return;
    800036a4:	0140006f          	j	800036b8 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800036a8:	00007517          	auipc	a0,0x7
    800036ac:	c3850513          	addi	a0,a0,-968 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800036b0:	00002097          	auipc	ra,0x2
    800036b4:	128080e7          	jalr	296(ra) # 800057d8 <_Z11printStringPKc>
        return;
    800036b8:	000b0113          	mv	sp,s6
    800036bc:	1500006f          	j	8000380c <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    800036c0:	00000593          	li	a1,0
    800036c4:	0000a517          	auipc	a0,0xa
    800036c8:	b4450513          	addi	a0,a0,-1212 # 8000d208 <_ZL10waitForAll>
    800036cc:	ffffe097          	auipc	ra,0xffffe
    800036d0:	e6c080e7          	jalr	-404(ra) # 80001538 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    800036d4:	00391793          	slli	a5,s2,0x3
    800036d8:	00f78793          	addi	a5,a5,15
    800036dc:	ff07f793          	andi	a5,a5,-16
    800036e0:	40f10133          	sub	sp,sp,a5
    800036e4:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800036e8:	0019071b          	addiw	a4,s2,1
    800036ec:	00171793          	slli	a5,a4,0x1
    800036f0:	00e787b3          	add	a5,a5,a4
    800036f4:	00379793          	slli	a5,a5,0x3
    800036f8:	00f78793          	addi	a5,a5,15
    800036fc:	ff07f793          	andi	a5,a5,-16
    80003700:	40f10133          	sub	sp,sp,a5
    80003704:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003708:	00191613          	slli	a2,s2,0x1
    8000370c:	012607b3          	add	a5,a2,s2
    80003710:	00379793          	slli	a5,a5,0x3
    80003714:	00f987b3          	add	a5,s3,a5
    80003718:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    8000371c:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003720:	0000a717          	auipc	a4,0xa
    80003724:	ae873703          	ld	a4,-1304(a4) # 8000d208 <_ZL10waitForAll>
    80003728:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    8000372c:	00078613          	mv	a2,a5
    80003730:	00000597          	auipc	a1,0x0
    80003734:	d7458593          	addi	a1,a1,-652 # 800034a4 <_ZL8consumerPv>
    80003738:	f9840513          	addi	a0,s0,-104
    8000373c:	ffffe097          	auipc	ra,0xffffe
    80003740:	cc8080e7          	jalr	-824(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003744:	00000493          	li	s1,0
    80003748:	0280006f          	j	80003770 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    8000374c:	00000597          	auipc	a1,0x0
    80003750:	c1458593          	addi	a1,a1,-1004 # 80003360 <_ZL16producerKeyboardPv>
                      data + i);
    80003754:	00179613          	slli	a2,a5,0x1
    80003758:	00f60633          	add	a2,a2,a5
    8000375c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003760:	00c98633          	add	a2,s3,a2
    80003764:	ffffe097          	auipc	ra,0xffffe
    80003768:	ca0080e7          	jalr	-864(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000376c:	0014849b          	addiw	s1,s1,1
    80003770:	0524d263          	bge	s1,s2,800037b4 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003774:	00149793          	slli	a5,s1,0x1
    80003778:	009787b3          	add	a5,a5,s1
    8000377c:	00379793          	slli	a5,a5,0x3
    80003780:	00f987b3          	add	a5,s3,a5
    80003784:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003788:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    8000378c:	0000a717          	auipc	a4,0xa
    80003790:	a7c73703          	ld	a4,-1412(a4) # 8000d208 <_ZL10waitForAll>
    80003794:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003798:	00048793          	mv	a5,s1
    8000379c:	00349513          	slli	a0,s1,0x3
    800037a0:	00aa8533          	add	a0,s5,a0
    800037a4:	fa9054e3          	blez	s1,8000374c <_Z22producerConsumer_C_APIv+0x1c8>
    800037a8:	00000597          	auipc	a1,0x0
    800037ac:	c6858593          	addi	a1,a1,-920 # 80003410 <_ZL8producerPv>
    800037b0:	fa5ff06f          	j	80003754 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800037b4:	ffffe097          	auipc	ra,0xffffe
    800037b8:	d0c080e7          	jalr	-756(ra) # 800014c0 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    800037bc:	00000493          	li	s1,0
    800037c0:	00994e63          	blt	s2,s1,800037dc <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    800037c4:	0000a517          	auipc	a0,0xa
    800037c8:	a4453503          	ld	a0,-1468(a0) # 8000d208 <_ZL10waitForAll>
    800037cc:	ffffe097          	auipc	ra,0xffffe
    800037d0:	dd4080e7          	jalr	-556(ra) # 800015a0 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    800037d4:	0014849b          	addiw	s1,s1,1
    800037d8:	fe9ff06f          	j	800037c0 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    800037dc:	0000a517          	auipc	a0,0xa
    800037e0:	a2c53503          	ld	a0,-1492(a0) # 8000d208 <_ZL10waitForAll>
    800037e4:	ffffe097          	auipc	ra,0xffffe
    800037e8:	d8c080e7          	jalr	-628(ra) # 80001570 <_Z9sem_closeP4KSem>
    delete buffer;
    800037ec:	000a0e63          	beqz	s4,80003808 <_Z22producerConsumer_C_APIv+0x284>
    800037f0:	000a0513          	mv	a0,s4
    800037f4:	00003097          	auipc	ra,0x3
    800037f8:	154080e7          	jalr	340(ra) # 80006948 <_ZN6BufferD1Ev>
    800037fc:	000a0513          	mv	a0,s4
    80003800:	fffff097          	auipc	ra,0xfffff
    80003804:	fd4080e7          	jalr	-44(ra) # 800027d4 <_ZdlPv>
    80003808:	000b0113          	mv	sp,s6

}
    8000380c:	f9040113          	addi	sp,s0,-112
    80003810:	06813083          	ld	ra,104(sp)
    80003814:	06013403          	ld	s0,96(sp)
    80003818:	05813483          	ld	s1,88(sp)
    8000381c:	05013903          	ld	s2,80(sp)
    80003820:	04813983          	ld	s3,72(sp)
    80003824:	04013a03          	ld	s4,64(sp)
    80003828:	03813a83          	ld	s5,56(sp)
    8000382c:	03013b03          	ld	s6,48(sp)
    80003830:	07010113          	addi	sp,sp,112
    80003834:	00008067          	ret
    80003838:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    8000383c:	000a0513          	mv	a0,s4
    80003840:	fffff097          	auipc	ra,0xfffff
    80003844:	f94080e7          	jalr	-108(ra) # 800027d4 <_ZdlPv>
    80003848:	00048513          	mv	a0,s1
    8000384c:	0000b097          	auipc	ra,0xb
    80003850:	afc080e7          	jalr	-1284(ra) # 8000e348 <_Unwind_Resume>

0000000080003854 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003854:	fe010113          	addi	sp,sp,-32
    80003858:	00113c23          	sd	ra,24(sp)
    8000385c:	00813823          	sd	s0,16(sp)
    80003860:	00913423          	sd	s1,8(sp)
    80003864:	01213023          	sd	s2,0(sp)
    80003868:	02010413          	addi	s0,sp,32
    8000386c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003870:	00100793          	li	a5,1
    80003874:	02a7f863          	bgeu	a5,a0,800038a4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003878:	00a00793          	li	a5,10
    8000387c:	02f577b3          	remu	a5,a0,a5
    80003880:	02078e63          	beqz	a5,800038bc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003884:	fff48513          	addi	a0,s1,-1
    80003888:	00000097          	auipc	ra,0x0
    8000388c:	fcc080e7          	jalr	-52(ra) # 80003854 <_ZL9fibonaccim>
    80003890:	00050913          	mv	s2,a0
    80003894:	ffe48513          	addi	a0,s1,-2
    80003898:	00000097          	auipc	ra,0x0
    8000389c:	fbc080e7          	jalr	-68(ra) # 80003854 <_ZL9fibonaccim>
    800038a0:	00a90533          	add	a0,s2,a0
}
    800038a4:	01813083          	ld	ra,24(sp)
    800038a8:	01013403          	ld	s0,16(sp)
    800038ac:	00813483          	ld	s1,8(sp)
    800038b0:	00013903          	ld	s2,0(sp)
    800038b4:	02010113          	addi	sp,sp,32
    800038b8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800038bc:	ffffe097          	auipc	ra,0xffffe
    800038c0:	c04080e7          	jalr	-1020(ra) # 800014c0 <_Z15thread_dispatchv>
    800038c4:	fc1ff06f          	j	80003884 <_ZL9fibonaccim+0x30>

00000000800038c8 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    800038c8:	fe010113          	addi	sp,sp,-32
    800038cc:	00113c23          	sd	ra,24(sp)
    800038d0:	00813823          	sd	s0,16(sp)
    800038d4:	00913423          	sd	s1,8(sp)
    800038d8:	01213023          	sd	s2,0(sp)
    800038dc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800038e0:	00000913          	li	s2,0
    800038e4:	0380006f          	j	8000391c <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800038e8:	ffffe097          	auipc	ra,0xffffe
    800038ec:	bd8080e7          	jalr	-1064(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800038f0:	00148493          	addi	s1,s1,1
    800038f4:	000027b7          	lui	a5,0x2
    800038f8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800038fc:	0097ee63          	bltu	a5,s1,80003918 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003900:	00000713          	li	a4,0
    80003904:	000077b7          	lui	a5,0x7
    80003908:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000390c:	fce7eee3          	bltu	a5,a4,800038e8 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003910:	00170713          	addi	a4,a4,1
    80003914:	ff1ff06f          	j	80003904 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003918:	00190913          	addi	s2,s2,1
    8000391c:	00900793          	li	a5,9
    80003920:	0527e063          	bltu	a5,s2,80003960 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003924:	00007517          	auipc	a0,0x7
    80003928:	9ec50513          	addi	a0,a0,-1556 # 8000a310 <CONSOLE_STATUS+0x300>
    8000392c:	00002097          	auipc	ra,0x2
    80003930:	eac080e7          	jalr	-340(ra) # 800057d8 <_Z11printStringPKc>
    80003934:	00000613          	li	a2,0
    80003938:	00a00593          	li	a1,10
    8000393c:	0009051b          	sext.w	a0,s2
    80003940:	00002097          	auipc	ra,0x2
    80003944:	048080e7          	jalr	72(ra) # 80005988 <_Z8printIntiii>
    80003948:	00007517          	auipc	a0,0x7
    8000394c:	c2850513          	addi	a0,a0,-984 # 8000a570 <CONSOLE_STATUS+0x560>
    80003950:	00002097          	auipc	ra,0x2
    80003954:	e88080e7          	jalr	-376(ra) # 800057d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003958:	00000493          	li	s1,0
    8000395c:	f99ff06f          	j	800038f4 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003960:	00007517          	auipc	a0,0x7
    80003964:	9b850513          	addi	a0,a0,-1608 # 8000a318 <CONSOLE_STATUS+0x308>
    80003968:	00002097          	auipc	ra,0x2
    8000396c:	e70080e7          	jalr	-400(ra) # 800057d8 <_Z11printStringPKc>
    finishedA = true;
    80003970:	00100793          	li	a5,1
    80003974:	0000a717          	auipc	a4,0xa
    80003978:	88f70e23          	sb	a5,-1892(a4) # 8000d210 <_ZL9finishedA>
}
    8000397c:	01813083          	ld	ra,24(sp)
    80003980:	01013403          	ld	s0,16(sp)
    80003984:	00813483          	ld	s1,8(sp)
    80003988:	00013903          	ld	s2,0(sp)
    8000398c:	02010113          	addi	sp,sp,32
    80003990:	00008067          	ret

0000000080003994 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003994:	fe010113          	addi	sp,sp,-32
    80003998:	00113c23          	sd	ra,24(sp)
    8000399c:	00813823          	sd	s0,16(sp)
    800039a0:	00913423          	sd	s1,8(sp)
    800039a4:	01213023          	sd	s2,0(sp)
    800039a8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800039ac:	00000913          	li	s2,0
    800039b0:	0380006f          	j	800039e8 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800039b4:	ffffe097          	auipc	ra,0xffffe
    800039b8:	b0c080e7          	jalr	-1268(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800039bc:	00148493          	addi	s1,s1,1
    800039c0:	000027b7          	lui	a5,0x2
    800039c4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800039c8:	0097ee63          	bltu	a5,s1,800039e4 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800039cc:	00000713          	li	a4,0
    800039d0:	000077b7          	lui	a5,0x7
    800039d4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800039d8:	fce7eee3          	bltu	a5,a4,800039b4 <_ZN7WorkerB11workerBodyBEPv+0x20>
    800039dc:	00170713          	addi	a4,a4,1
    800039e0:	ff1ff06f          	j	800039d0 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800039e4:	00190913          	addi	s2,s2,1
    800039e8:	00f00793          	li	a5,15
    800039ec:	0527e063          	bltu	a5,s2,80003a2c <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800039f0:	00007517          	auipc	a0,0x7
    800039f4:	93850513          	addi	a0,a0,-1736 # 8000a328 <CONSOLE_STATUS+0x318>
    800039f8:	00002097          	auipc	ra,0x2
    800039fc:	de0080e7          	jalr	-544(ra) # 800057d8 <_Z11printStringPKc>
    80003a00:	00000613          	li	a2,0
    80003a04:	00a00593          	li	a1,10
    80003a08:	0009051b          	sext.w	a0,s2
    80003a0c:	00002097          	auipc	ra,0x2
    80003a10:	f7c080e7          	jalr	-132(ra) # 80005988 <_Z8printIntiii>
    80003a14:	00007517          	auipc	a0,0x7
    80003a18:	b5c50513          	addi	a0,a0,-1188 # 8000a570 <CONSOLE_STATUS+0x560>
    80003a1c:	00002097          	auipc	ra,0x2
    80003a20:	dbc080e7          	jalr	-580(ra) # 800057d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003a24:	00000493          	li	s1,0
    80003a28:	f99ff06f          	j	800039c0 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003a2c:	00007517          	auipc	a0,0x7
    80003a30:	90450513          	addi	a0,a0,-1788 # 8000a330 <CONSOLE_STATUS+0x320>
    80003a34:	00002097          	auipc	ra,0x2
    80003a38:	da4080e7          	jalr	-604(ra) # 800057d8 <_Z11printStringPKc>
    finishedB = true;
    80003a3c:	00100793          	li	a5,1
    80003a40:	00009717          	auipc	a4,0x9
    80003a44:	7cf708a3          	sb	a5,2001(a4) # 8000d211 <_ZL9finishedB>
    thread_dispatch();
    80003a48:	ffffe097          	auipc	ra,0xffffe
    80003a4c:	a78080e7          	jalr	-1416(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80003a50:	01813083          	ld	ra,24(sp)
    80003a54:	01013403          	ld	s0,16(sp)
    80003a58:	00813483          	ld	s1,8(sp)
    80003a5c:	00013903          	ld	s2,0(sp)
    80003a60:	02010113          	addi	sp,sp,32
    80003a64:	00008067          	ret

0000000080003a68 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003a68:	fe010113          	addi	sp,sp,-32
    80003a6c:	00113c23          	sd	ra,24(sp)
    80003a70:	00813823          	sd	s0,16(sp)
    80003a74:	00913423          	sd	s1,8(sp)
    80003a78:	01213023          	sd	s2,0(sp)
    80003a7c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003a80:	00000493          	li	s1,0
    80003a84:	0400006f          	j	80003ac4 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003a88:	00007517          	auipc	a0,0x7
    80003a8c:	8b850513          	addi	a0,a0,-1864 # 8000a340 <CONSOLE_STATUS+0x330>
    80003a90:	00002097          	auipc	ra,0x2
    80003a94:	d48080e7          	jalr	-696(ra) # 800057d8 <_Z11printStringPKc>
    80003a98:	00000613          	li	a2,0
    80003a9c:	00a00593          	li	a1,10
    80003aa0:	00048513          	mv	a0,s1
    80003aa4:	00002097          	auipc	ra,0x2
    80003aa8:	ee4080e7          	jalr	-284(ra) # 80005988 <_Z8printIntiii>
    80003aac:	00007517          	auipc	a0,0x7
    80003ab0:	ac450513          	addi	a0,a0,-1340 # 8000a570 <CONSOLE_STATUS+0x560>
    80003ab4:	00002097          	auipc	ra,0x2
    80003ab8:	d24080e7          	jalr	-732(ra) # 800057d8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003abc:	0014849b          	addiw	s1,s1,1
    80003ac0:	0ff4f493          	andi	s1,s1,255
    80003ac4:	00200793          	li	a5,2
    80003ac8:	fc97f0e3          	bgeu	a5,s1,80003a88 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003acc:	00007517          	auipc	a0,0x7
    80003ad0:	87c50513          	addi	a0,a0,-1924 # 8000a348 <CONSOLE_STATUS+0x338>
    80003ad4:	00002097          	auipc	ra,0x2
    80003ad8:	d04080e7          	jalr	-764(ra) # 800057d8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003adc:	00700313          	li	t1,7
    thread_dispatch();
    80003ae0:	ffffe097          	auipc	ra,0xffffe
    80003ae4:	9e0080e7          	jalr	-1568(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003ae8:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003aec:	00007517          	auipc	a0,0x7
    80003af0:	86c50513          	addi	a0,a0,-1940 # 8000a358 <CONSOLE_STATUS+0x348>
    80003af4:	00002097          	auipc	ra,0x2
    80003af8:	ce4080e7          	jalr	-796(ra) # 800057d8 <_Z11printStringPKc>
    80003afc:	00000613          	li	a2,0
    80003b00:	00a00593          	li	a1,10
    80003b04:	0009051b          	sext.w	a0,s2
    80003b08:	00002097          	auipc	ra,0x2
    80003b0c:	e80080e7          	jalr	-384(ra) # 80005988 <_Z8printIntiii>
    80003b10:	00007517          	auipc	a0,0x7
    80003b14:	a6050513          	addi	a0,a0,-1440 # 8000a570 <CONSOLE_STATUS+0x560>
    80003b18:	00002097          	auipc	ra,0x2
    80003b1c:	cc0080e7          	jalr	-832(ra) # 800057d8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003b20:	00c00513          	li	a0,12
    80003b24:	00000097          	auipc	ra,0x0
    80003b28:	d30080e7          	jalr	-720(ra) # 80003854 <_ZL9fibonaccim>
    80003b2c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003b30:	00007517          	auipc	a0,0x7
    80003b34:	83050513          	addi	a0,a0,-2000 # 8000a360 <CONSOLE_STATUS+0x350>
    80003b38:	00002097          	auipc	ra,0x2
    80003b3c:	ca0080e7          	jalr	-864(ra) # 800057d8 <_Z11printStringPKc>
    80003b40:	00000613          	li	a2,0
    80003b44:	00a00593          	li	a1,10
    80003b48:	0009051b          	sext.w	a0,s2
    80003b4c:	00002097          	auipc	ra,0x2
    80003b50:	e3c080e7          	jalr	-452(ra) # 80005988 <_Z8printIntiii>
    80003b54:	00007517          	auipc	a0,0x7
    80003b58:	a1c50513          	addi	a0,a0,-1508 # 8000a570 <CONSOLE_STATUS+0x560>
    80003b5c:	00002097          	auipc	ra,0x2
    80003b60:	c7c080e7          	jalr	-900(ra) # 800057d8 <_Z11printStringPKc>
    80003b64:	0400006f          	j	80003ba4 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003b68:	00006517          	auipc	a0,0x6
    80003b6c:	7d850513          	addi	a0,a0,2008 # 8000a340 <CONSOLE_STATUS+0x330>
    80003b70:	00002097          	auipc	ra,0x2
    80003b74:	c68080e7          	jalr	-920(ra) # 800057d8 <_Z11printStringPKc>
    80003b78:	00000613          	li	a2,0
    80003b7c:	00a00593          	li	a1,10
    80003b80:	00048513          	mv	a0,s1
    80003b84:	00002097          	auipc	ra,0x2
    80003b88:	e04080e7          	jalr	-508(ra) # 80005988 <_Z8printIntiii>
    80003b8c:	00007517          	auipc	a0,0x7
    80003b90:	9e450513          	addi	a0,a0,-1564 # 8000a570 <CONSOLE_STATUS+0x560>
    80003b94:	00002097          	auipc	ra,0x2
    80003b98:	c44080e7          	jalr	-956(ra) # 800057d8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003b9c:	0014849b          	addiw	s1,s1,1
    80003ba0:	0ff4f493          	andi	s1,s1,255
    80003ba4:	00500793          	li	a5,5
    80003ba8:	fc97f0e3          	bgeu	a5,s1,80003b68 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80003bac:	00006517          	auipc	a0,0x6
    80003bb0:	7c450513          	addi	a0,a0,1988 # 8000a370 <CONSOLE_STATUS+0x360>
    80003bb4:	00002097          	auipc	ra,0x2
    80003bb8:	c24080e7          	jalr	-988(ra) # 800057d8 <_Z11printStringPKc>
    finishedC = true;
    80003bbc:	00100793          	li	a5,1
    80003bc0:	00009717          	auipc	a4,0x9
    80003bc4:	64f70923          	sb	a5,1618(a4) # 8000d212 <_ZL9finishedC>
    thread_dispatch();
    80003bc8:	ffffe097          	auipc	ra,0xffffe
    80003bcc:	8f8080e7          	jalr	-1800(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80003bd0:	01813083          	ld	ra,24(sp)
    80003bd4:	01013403          	ld	s0,16(sp)
    80003bd8:	00813483          	ld	s1,8(sp)
    80003bdc:	00013903          	ld	s2,0(sp)
    80003be0:	02010113          	addi	sp,sp,32
    80003be4:	00008067          	ret

0000000080003be8 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003be8:	fe010113          	addi	sp,sp,-32
    80003bec:	00113c23          	sd	ra,24(sp)
    80003bf0:	00813823          	sd	s0,16(sp)
    80003bf4:	00913423          	sd	s1,8(sp)
    80003bf8:	01213023          	sd	s2,0(sp)
    80003bfc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003c00:	00a00493          	li	s1,10
    80003c04:	0400006f          	j	80003c44 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003c08:	00006517          	auipc	a0,0x6
    80003c0c:	77850513          	addi	a0,a0,1912 # 8000a380 <CONSOLE_STATUS+0x370>
    80003c10:	00002097          	auipc	ra,0x2
    80003c14:	bc8080e7          	jalr	-1080(ra) # 800057d8 <_Z11printStringPKc>
    80003c18:	00000613          	li	a2,0
    80003c1c:	00a00593          	li	a1,10
    80003c20:	00048513          	mv	a0,s1
    80003c24:	00002097          	auipc	ra,0x2
    80003c28:	d64080e7          	jalr	-668(ra) # 80005988 <_Z8printIntiii>
    80003c2c:	00007517          	auipc	a0,0x7
    80003c30:	94450513          	addi	a0,a0,-1724 # 8000a570 <CONSOLE_STATUS+0x560>
    80003c34:	00002097          	auipc	ra,0x2
    80003c38:	ba4080e7          	jalr	-1116(ra) # 800057d8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003c3c:	0014849b          	addiw	s1,s1,1
    80003c40:	0ff4f493          	andi	s1,s1,255
    80003c44:	00c00793          	li	a5,12
    80003c48:	fc97f0e3          	bgeu	a5,s1,80003c08 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003c4c:	00006517          	auipc	a0,0x6
    80003c50:	73c50513          	addi	a0,a0,1852 # 8000a388 <CONSOLE_STATUS+0x378>
    80003c54:	00002097          	auipc	ra,0x2
    80003c58:	b84080e7          	jalr	-1148(ra) # 800057d8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003c5c:	00500313          	li	t1,5
    thread_dispatch();
    80003c60:	ffffe097          	auipc	ra,0xffffe
    80003c64:	860080e7          	jalr	-1952(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003c68:	01000513          	li	a0,16
    80003c6c:	00000097          	auipc	ra,0x0
    80003c70:	be8080e7          	jalr	-1048(ra) # 80003854 <_ZL9fibonaccim>
    80003c74:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003c78:	00006517          	auipc	a0,0x6
    80003c7c:	72050513          	addi	a0,a0,1824 # 8000a398 <CONSOLE_STATUS+0x388>
    80003c80:	00002097          	auipc	ra,0x2
    80003c84:	b58080e7          	jalr	-1192(ra) # 800057d8 <_Z11printStringPKc>
    80003c88:	00000613          	li	a2,0
    80003c8c:	00a00593          	li	a1,10
    80003c90:	0009051b          	sext.w	a0,s2
    80003c94:	00002097          	auipc	ra,0x2
    80003c98:	cf4080e7          	jalr	-780(ra) # 80005988 <_Z8printIntiii>
    80003c9c:	00007517          	auipc	a0,0x7
    80003ca0:	8d450513          	addi	a0,a0,-1836 # 8000a570 <CONSOLE_STATUS+0x560>
    80003ca4:	00002097          	auipc	ra,0x2
    80003ca8:	b34080e7          	jalr	-1228(ra) # 800057d8 <_Z11printStringPKc>
    80003cac:	0400006f          	j	80003cec <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003cb0:	00006517          	auipc	a0,0x6
    80003cb4:	6d050513          	addi	a0,a0,1744 # 8000a380 <CONSOLE_STATUS+0x370>
    80003cb8:	00002097          	auipc	ra,0x2
    80003cbc:	b20080e7          	jalr	-1248(ra) # 800057d8 <_Z11printStringPKc>
    80003cc0:	00000613          	li	a2,0
    80003cc4:	00a00593          	li	a1,10
    80003cc8:	00048513          	mv	a0,s1
    80003ccc:	00002097          	auipc	ra,0x2
    80003cd0:	cbc080e7          	jalr	-836(ra) # 80005988 <_Z8printIntiii>
    80003cd4:	00007517          	auipc	a0,0x7
    80003cd8:	89c50513          	addi	a0,a0,-1892 # 8000a570 <CONSOLE_STATUS+0x560>
    80003cdc:	00002097          	auipc	ra,0x2
    80003ce0:	afc080e7          	jalr	-1284(ra) # 800057d8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003ce4:	0014849b          	addiw	s1,s1,1
    80003ce8:	0ff4f493          	andi	s1,s1,255
    80003cec:	00f00793          	li	a5,15
    80003cf0:	fc97f0e3          	bgeu	a5,s1,80003cb0 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003cf4:	00006517          	auipc	a0,0x6
    80003cf8:	6b450513          	addi	a0,a0,1716 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80003cfc:	00002097          	auipc	ra,0x2
    80003d00:	adc080e7          	jalr	-1316(ra) # 800057d8 <_Z11printStringPKc>
    finishedD = true;
    80003d04:	00100793          	li	a5,1
    80003d08:	00009717          	auipc	a4,0x9
    80003d0c:	50f705a3          	sb	a5,1291(a4) # 8000d213 <_ZL9finishedD>
    thread_dispatch();
    80003d10:	ffffd097          	auipc	ra,0xffffd
    80003d14:	7b0080e7          	jalr	1968(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80003d18:	01813083          	ld	ra,24(sp)
    80003d1c:	01013403          	ld	s0,16(sp)
    80003d20:	00813483          	ld	s1,8(sp)
    80003d24:	00013903          	ld	s2,0(sp)
    80003d28:	02010113          	addi	sp,sp,32
    80003d2c:	00008067          	ret

0000000080003d30 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003d30:	fc010113          	addi	sp,sp,-64
    80003d34:	02113c23          	sd	ra,56(sp)
    80003d38:	02813823          	sd	s0,48(sp)
    80003d3c:	02913423          	sd	s1,40(sp)
    80003d40:	03213023          	sd	s2,32(sp)
    80003d44:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003d48:	02000513          	li	a0,32
    80003d4c:	fffff097          	auipc	ra,0xfffff
    80003d50:	a38080e7          	jalr	-1480(ra) # 80002784 <_Znwm>
    80003d54:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003d58:	fffff097          	auipc	ra,0xfffff
    80003d5c:	d1c080e7          	jalr	-740(ra) # 80002a74 <_ZN6ThreadC1Ev>
    80003d60:	00009797          	auipc	a5,0x9
    80003d64:	05078793          	addi	a5,a5,80 # 8000cdb0 <_ZTV7WorkerA+0x10>
    80003d68:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003d6c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003d70:	00006517          	auipc	a0,0x6
    80003d74:	64850513          	addi	a0,a0,1608 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    80003d78:	00002097          	auipc	ra,0x2
    80003d7c:	a60080e7          	jalr	-1440(ra) # 800057d8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003d80:	02000513          	li	a0,32
    80003d84:	fffff097          	auipc	ra,0xfffff
    80003d88:	a00080e7          	jalr	-1536(ra) # 80002784 <_Znwm>
    80003d8c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003d90:	fffff097          	auipc	ra,0xfffff
    80003d94:	ce4080e7          	jalr	-796(ra) # 80002a74 <_ZN6ThreadC1Ev>
    80003d98:	00009797          	auipc	a5,0x9
    80003d9c:	04078793          	addi	a5,a5,64 # 8000cdd8 <_ZTV7WorkerB+0x10>
    80003da0:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003da4:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003da8:	00006517          	auipc	a0,0x6
    80003dac:	62850513          	addi	a0,a0,1576 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80003db0:	00002097          	auipc	ra,0x2
    80003db4:	a28080e7          	jalr	-1496(ra) # 800057d8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003db8:	02000513          	li	a0,32
    80003dbc:	fffff097          	auipc	ra,0xfffff
    80003dc0:	9c8080e7          	jalr	-1592(ra) # 80002784 <_Znwm>
    80003dc4:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003dc8:	fffff097          	auipc	ra,0xfffff
    80003dcc:	cac080e7          	jalr	-852(ra) # 80002a74 <_ZN6ThreadC1Ev>
    80003dd0:	00009797          	auipc	a5,0x9
    80003dd4:	03078793          	addi	a5,a5,48 # 8000ce00 <_ZTV7WorkerC+0x10>
    80003dd8:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003ddc:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003de0:	00006517          	auipc	a0,0x6
    80003de4:	60850513          	addi	a0,a0,1544 # 8000a3e8 <CONSOLE_STATUS+0x3d8>
    80003de8:	00002097          	auipc	ra,0x2
    80003dec:	9f0080e7          	jalr	-1552(ra) # 800057d8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80003df0:	02000513          	li	a0,32
    80003df4:	fffff097          	auipc	ra,0xfffff
    80003df8:	990080e7          	jalr	-1648(ra) # 80002784 <_Znwm>
    80003dfc:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80003e00:	fffff097          	auipc	ra,0xfffff
    80003e04:	c74080e7          	jalr	-908(ra) # 80002a74 <_ZN6ThreadC1Ev>
    80003e08:	00009797          	auipc	a5,0x9
    80003e0c:	02078793          	addi	a5,a5,32 # 8000ce28 <_ZTV7WorkerD+0x10>
    80003e10:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80003e14:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80003e18:	00006517          	auipc	a0,0x6
    80003e1c:	5e850513          	addi	a0,a0,1512 # 8000a400 <CONSOLE_STATUS+0x3f0>
    80003e20:	00002097          	auipc	ra,0x2
    80003e24:	9b8080e7          	jalr	-1608(ra) # 800057d8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80003e28:	00000493          	li	s1,0
    80003e2c:	00300793          	li	a5,3
    80003e30:	0297c663          	blt	a5,s1,80003e5c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80003e34:	00349793          	slli	a5,s1,0x3
    80003e38:	fe040713          	addi	a4,s0,-32
    80003e3c:	00f707b3          	add	a5,a4,a5
    80003e40:	fe07b503          	ld	a0,-32(a5)
    80003e44:	fffff097          	auipc	ra,0xfffff
    80003e48:	af8080e7          	jalr	-1288(ra) # 8000293c <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80003e4c:	0014849b          	addiw	s1,s1,1
    80003e50:	fddff06f          	j	80003e2c <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80003e54:	fffff097          	auipc	ra,0xfffff
    80003e58:	b64080e7          	jalr	-1180(ra) # 800029b8 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003e5c:	00009797          	auipc	a5,0x9
    80003e60:	3b47c783          	lbu	a5,948(a5) # 8000d210 <_ZL9finishedA>
    80003e64:	fe0788e3          	beqz	a5,80003e54 <_Z20Threads_CPP_API_testv+0x124>
    80003e68:	00009797          	auipc	a5,0x9
    80003e6c:	3a97c783          	lbu	a5,937(a5) # 8000d211 <_ZL9finishedB>
    80003e70:	fe0782e3          	beqz	a5,80003e54 <_Z20Threads_CPP_API_testv+0x124>
    80003e74:	00009797          	auipc	a5,0x9
    80003e78:	39e7c783          	lbu	a5,926(a5) # 8000d212 <_ZL9finishedC>
    80003e7c:	fc078ce3          	beqz	a5,80003e54 <_Z20Threads_CPP_API_testv+0x124>
    80003e80:	00009797          	auipc	a5,0x9
    80003e84:	3937c783          	lbu	a5,915(a5) # 8000d213 <_ZL9finishedD>
    80003e88:	fc0786e3          	beqz	a5,80003e54 <_Z20Threads_CPP_API_testv+0x124>
    80003e8c:	fc040493          	addi	s1,s0,-64
    80003e90:	0080006f          	j	80003e98 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    80003e94:	00848493          	addi	s1,s1,8
    80003e98:	fe040793          	addi	a5,s0,-32
    80003e9c:	08f48663          	beq	s1,a5,80003f28 <_Z20Threads_CPP_API_testv+0x1f8>
    80003ea0:	0004b503          	ld	a0,0(s1)
		delete thread;
    80003ea4:	fe0508e3          	beqz	a0,80003e94 <_Z20Threads_CPP_API_testv+0x164>
    80003ea8:	00053783          	ld	a5,0(a0)
    80003eac:	0087b783          	ld	a5,8(a5)
    80003eb0:	000780e7          	jalr	a5
    80003eb4:	fe1ff06f          	j	80003e94 <_Z20Threads_CPP_API_testv+0x164>
    80003eb8:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003ebc:	00048513          	mv	a0,s1
    80003ec0:	fffff097          	auipc	ra,0xfffff
    80003ec4:	914080e7          	jalr	-1772(ra) # 800027d4 <_ZdlPv>
    80003ec8:	00090513          	mv	a0,s2
    80003ecc:	0000a097          	auipc	ra,0xa
    80003ed0:	47c080e7          	jalr	1148(ra) # 8000e348 <_Unwind_Resume>
    80003ed4:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003ed8:	00048513          	mv	a0,s1
    80003edc:	fffff097          	auipc	ra,0xfffff
    80003ee0:	8f8080e7          	jalr	-1800(ra) # 800027d4 <_ZdlPv>
    80003ee4:	00090513          	mv	a0,s2
    80003ee8:	0000a097          	auipc	ra,0xa
    80003eec:	460080e7          	jalr	1120(ra) # 8000e348 <_Unwind_Resume>
    80003ef0:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80003ef4:	00048513          	mv	a0,s1
    80003ef8:	fffff097          	auipc	ra,0xfffff
    80003efc:	8dc080e7          	jalr	-1828(ra) # 800027d4 <_ZdlPv>
    80003f00:	00090513          	mv	a0,s2
    80003f04:	0000a097          	auipc	ra,0xa
    80003f08:	444080e7          	jalr	1092(ra) # 8000e348 <_Unwind_Resume>
    80003f0c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80003f10:	00048513          	mv	a0,s1
    80003f14:	fffff097          	auipc	ra,0xfffff
    80003f18:	8c0080e7          	jalr	-1856(ra) # 800027d4 <_ZdlPv>
    80003f1c:	00090513          	mv	a0,s2
    80003f20:	0000a097          	auipc	ra,0xa
    80003f24:	428080e7          	jalr	1064(ra) # 8000e348 <_Unwind_Resume>
	}
}
    80003f28:	03813083          	ld	ra,56(sp)
    80003f2c:	03013403          	ld	s0,48(sp)
    80003f30:	02813483          	ld	s1,40(sp)
    80003f34:	02013903          	ld	s2,32(sp)
    80003f38:	04010113          	addi	sp,sp,64
    80003f3c:	00008067          	ret

0000000080003f40 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80003f40:	ff010113          	addi	sp,sp,-16
    80003f44:	00113423          	sd	ra,8(sp)
    80003f48:	00813023          	sd	s0,0(sp)
    80003f4c:	01010413          	addi	s0,sp,16
    80003f50:	00009797          	auipc	a5,0x9
    80003f54:	e6078793          	addi	a5,a5,-416 # 8000cdb0 <_ZTV7WorkerA+0x10>
    80003f58:	00f53023          	sd	a5,0(a0)
    80003f5c:	ffffe097          	auipc	ra,0xffffe
    80003f60:	774080e7          	jalr	1908(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80003f64:	00813083          	ld	ra,8(sp)
    80003f68:	00013403          	ld	s0,0(sp)
    80003f6c:	01010113          	addi	sp,sp,16
    80003f70:	00008067          	ret

0000000080003f74 <_ZN7WorkerAD0Ev>:
    80003f74:	fe010113          	addi	sp,sp,-32
    80003f78:	00113c23          	sd	ra,24(sp)
    80003f7c:	00813823          	sd	s0,16(sp)
    80003f80:	00913423          	sd	s1,8(sp)
    80003f84:	02010413          	addi	s0,sp,32
    80003f88:	00050493          	mv	s1,a0
    80003f8c:	00009797          	auipc	a5,0x9
    80003f90:	e2478793          	addi	a5,a5,-476 # 8000cdb0 <_ZTV7WorkerA+0x10>
    80003f94:	00f53023          	sd	a5,0(a0)
    80003f98:	ffffe097          	auipc	ra,0xffffe
    80003f9c:	738080e7          	jalr	1848(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80003fa0:	00048513          	mv	a0,s1
    80003fa4:	fffff097          	auipc	ra,0xfffff
    80003fa8:	830080e7          	jalr	-2000(ra) # 800027d4 <_ZdlPv>
    80003fac:	01813083          	ld	ra,24(sp)
    80003fb0:	01013403          	ld	s0,16(sp)
    80003fb4:	00813483          	ld	s1,8(sp)
    80003fb8:	02010113          	addi	sp,sp,32
    80003fbc:	00008067          	ret

0000000080003fc0 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80003fc0:	ff010113          	addi	sp,sp,-16
    80003fc4:	00113423          	sd	ra,8(sp)
    80003fc8:	00813023          	sd	s0,0(sp)
    80003fcc:	01010413          	addi	s0,sp,16
    80003fd0:	00009797          	auipc	a5,0x9
    80003fd4:	e0878793          	addi	a5,a5,-504 # 8000cdd8 <_ZTV7WorkerB+0x10>
    80003fd8:	00f53023          	sd	a5,0(a0)
    80003fdc:	ffffe097          	auipc	ra,0xffffe
    80003fe0:	6f4080e7          	jalr	1780(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80003fe4:	00813083          	ld	ra,8(sp)
    80003fe8:	00013403          	ld	s0,0(sp)
    80003fec:	01010113          	addi	sp,sp,16
    80003ff0:	00008067          	ret

0000000080003ff4 <_ZN7WorkerBD0Ev>:
    80003ff4:	fe010113          	addi	sp,sp,-32
    80003ff8:	00113c23          	sd	ra,24(sp)
    80003ffc:	00813823          	sd	s0,16(sp)
    80004000:	00913423          	sd	s1,8(sp)
    80004004:	02010413          	addi	s0,sp,32
    80004008:	00050493          	mv	s1,a0
    8000400c:	00009797          	auipc	a5,0x9
    80004010:	dcc78793          	addi	a5,a5,-564 # 8000cdd8 <_ZTV7WorkerB+0x10>
    80004014:	00f53023          	sd	a5,0(a0)
    80004018:	ffffe097          	auipc	ra,0xffffe
    8000401c:	6b8080e7          	jalr	1720(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80004020:	00048513          	mv	a0,s1
    80004024:	ffffe097          	auipc	ra,0xffffe
    80004028:	7b0080e7          	jalr	1968(ra) # 800027d4 <_ZdlPv>
    8000402c:	01813083          	ld	ra,24(sp)
    80004030:	01013403          	ld	s0,16(sp)
    80004034:	00813483          	ld	s1,8(sp)
    80004038:	02010113          	addi	sp,sp,32
    8000403c:	00008067          	ret

0000000080004040 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004040:	ff010113          	addi	sp,sp,-16
    80004044:	00113423          	sd	ra,8(sp)
    80004048:	00813023          	sd	s0,0(sp)
    8000404c:	01010413          	addi	s0,sp,16
    80004050:	00009797          	auipc	a5,0x9
    80004054:	db078793          	addi	a5,a5,-592 # 8000ce00 <_ZTV7WorkerC+0x10>
    80004058:	00f53023          	sd	a5,0(a0)
    8000405c:	ffffe097          	auipc	ra,0xffffe
    80004060:	674080e7          	jalr	1652(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80004064:	00813083          	ld	ra,8(sp)
    80004068:	00013403          	ld	s0,0(sp)
    8000406c:	01010113          	addi	sp,sp,16
    80004070:	00008067          	ret

0000000080004074 <_ZN7WorkerCD0Ev>:
    80004074:	fe010113          	addi	sp,sp,-32
    80004078:	00113c23          	sd	ra,24(sp)
    8000407c:	00813823          	sd	s0,16(sp)
    80004080:	00913423          	sd	s1,8(sp)
    80004084:	02010413          	addi	s0,sp,32
    80004088:	00050493          	mv	s1,a0
    8000408c:	00009797          	auipc	a5,0x9
    80004090:	d7478793          	addi	a5,a5,-652 # 8000ce00 <_ZTV7WorkerC+0x10>
    80004094:	00f53023          	sd	a5,0(a0)
    80004098:	ffffe097          	auipc	ra,0xffffe
    8000409c:	638080e7          	jalr	1592(ra) # 800026d0 <_ZN6ThreadD1Ev>
    800040a0:	00048513          	mv	a0,s1
    800040a4:	ffffe097          	auipc	ra,0xffffe
    800040a8:	730080e7          	jalr	1840(ra) # 800027d4 <_ZdlPv>
    800040ac:	01813083          	ld	ra,24(sp)
    800040b0:	01013403          	ld	s0,16(sp)
    800040b4:	00813483          	ld	s1,8(sp)
    800040b8:	02010113          	addi	sp,sp,32
    800040bc:	00008067          	ret

00000000800040c0 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800040c0:	ff010113          	addi	sp,sp,-16
    800040c4:	00113423          	sd	ra,8(sp)
    800040c8:	00813023          	sd	s0,0(sp)
    800040cc:	01010413          	addi	s0,sp,16
    800040d0:	00009797          	auipc	a5,0x9
    800040d4:	d5878793          	addi	a5,a5,-680 # 8000ce28 <_ZTV7WorkerD+0x10>
    800040d8:	00f53023          	sd	a5,0(a0)
    800040dc:	ffffe097          	auipc	ra,0xffffe
    800040e0:	5f4080e7          	jalr	1524(ra) # 800026d0 <_ZN6ThreadD1Ev>
    800040e4:	00813083          	ld	ra,8(sp)
    800040e8:	00013403          	ld	s0,0(sp)
    800040ec:	01010113          	addi	sp,sp,16
    800040f0:	00008067          	ret

00000000800040f4 <_ZN7WorkerDD0Ev>:
    800040f4:	fe010113          	addi	sp,sp,-32
    800040f8:	00113c23          	sd	ra,24(sp)
    800040fc:	00813823          	sd	s0,16(sp)
    80004100:	00913423          	sd	s1,8(sp)
    80004104:	02010413          	addi	s0,sp,32
    80004108:	00050493          	mv	s1,a0
    8000410c:	00009797          	auipc	a5,0x9
    80004110:	d1c78793          	addi	a5,a5,-740 # 8000ce28 <_ZTV7WorkerD+0x10>
    80004114:	00f53023          	sd	a5,0(a0)
    80004118:	ffffe097          	auipc	ra,0xffffe
    8000411c:	5b8080e7          	jalr	1464(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80004120:	00048513          	mv	a0,s1
    80004124:	ffffe097          	auipc	ra,0xffffe
    80004128:	6b0080e7          	jalr	1712(ra) # 800027d4 <_ZdlPv>
    8000412c:	01813083          	ld	ra,24(sp)
    80004130:	01013403          	ld	s0,16(sp)
    80004134:	00813483          	ld	s1,8(sp)
    80004138:	02010113          	addi	sp,sp,32
    8000413c:	00008067          	ret

0000000080004140 <_ZN7WorkerA3runEv>:
    void run() override {
    80004140:	ff010113          	addi	sp,sp,-16
    80004144:	00113423          	sd	ra,8(sp)
    80004148:	00813023          	sd	s0,0(sp)
    8000414c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004150:	00000593          	li	a1,0
    80004154:	fffff097          	auipc	ra,0xfffff
    80004158:	774080e7          	jalr	1908(ra) # 800038c8 <_ZN7WorkerA11workerBodyAEPv>
    }
    8000415c:	00813083          	ld	ra,8(sp)
    80004160:	00013403          	ld	s0,0(sp)
    80004164:	01010113          	addi	sp,sp,16
    80004168:	00008067          	ret

000000008000416c <_ZN7WorkerB3runEv>:
    void run() override {
    8000416c:	ff010113          	addi	sp,sp,-16
    80004170:	00113423          	sd	ra,8(sp)
    80004174:	00813023          	sd	s0,0(sp)
    80004178:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    8000417c:	00000593          	li	a1,0
    80004180:	00000097          	auipc	ra,0x0
    80004184:	814080e7          	jalr	-2028(ra) # 80003994 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004188:	00813083          	ld	ra,8(sp)
    8000418c:	00013403          	ld	s0,0(sp)
    80004190:	01010113          	addi	sp,sp,16
    80004194:	00008067          	ret

0000000080004198 <_ZN7WorkerC3runEv>:
    void run() override {
    80004198:	ff010113          	addi	sp,sp,-16
    8000419c:	00113423          	sd	ra,8(sp)
    800041a0:	00813023          	sd	s0,0(sp)
    800041a4:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800041a8:	00000593          	li	a1,0
    800041ac:	00000097          	auipc	ra,0x0
    800041b0:	8bc080e7          	jalr	-1860(ra) # 80003a68 <_ZN7WorkerC11workerBodyCEPv>
    }
    800041b4:	00813083          	ld	ra,8(sp)
    800041b8:	00013403          	ld	s0,0(sp)
    800041bc:	01010113          	addi	sp,sp,16
    800041c0:	00008067          	ret

00000000800041c4 <_ZN7WorkerD3runEv>:
    void run() override {
    800041c4:	ff010113          	addi	sp,sp,-16
    800041c8:	00113423          	sd	ra,8(sp)
    800041cc:	00813023          	sd	s0,0(sp)
    800041d0:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800041d4:	00000593          	li	a1,0
    800041d8:	00000097          	auipc	ra,0x0
    800041dc:	a10080e7          	jalr	-1520(ra) # 80003be8 <_ZN7WorkerD11workerBodyDEPv>
    }
    800041e0:	00813083          	ld	ra,8(sp)
    800041e4:	00013403          	ld	s0,0(sp)
    800041e8:	01010113          	addi	sp,sp,16
    800041ec:	00008067          	ret

00000000800041f0 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800041f0:	f8010113          	addi	sp,sp,-128
    800041f4:	06113c23          	sd	ra,120(sp)
    800041f8:	06813823          	sd	s0,112(sp)
    800041fc:	06913423          	sd	s1,104(sp)
    80004200:	07213023          	sd	s2,96(sp)
    80004204:	05313c23          	sd	s3,88(sp)
    80004208:	05413823          	sd	s4,80(sp)
    8000420c:	05513423          	sd	s5,72(sp)
    80004210:	05613023          	sd	s6,64(sp)
    80004214:	03713c23          	sd	s7,56(sp)
    80004218:	03813823          	sd	s8,48(sp)
    8000421c:	03913423          	sd	s9,40(sp)
    80004220:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004224:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004228:	00006517          	auipc	a0,0x6
    8000422c:	00050513          	mv	a0,a0
    80004230:	00001097          	auipc	ra,0x1
    80004234:	5a8080e7          	jalr	1448(ra) # 800057d8 <_Z11printStringPKc>
    getString(input, 30);
    80004238:	01e00593          	li	a1,30
    8000423c:	f8040493          	addi	s1,s0,-128
    80004240:	00048513          	mv	a0,s1
    80004244:	00001097          	auipc	ra,0x1
    80004248:	61c080e7          	jalr	1564(ra) # 80005860 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000424c:	00048513          	mv	a0,s1
    80004250:	00001097          	auipc	ra,0x1
    80004254:	6e8080e7          	jalr	1768(ra) # 80005938 <_Z11stringToIntPKc>
    80004258:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    8000425c:	00006517          	auipc	a0,0x6
    80004260:	fec50513          	addi	a0,a0,-20 # 8000a248 <CONSOLE_STATUS+0x238>
    80004264:	00001097          	auipc	ra,0x1
    80004268:	574080e7          	jalr	1396(ra) # 800057d8 <_Z11printStringPKc>
    getString(input, 30);
    8000426c:	01e00593          	li	a1,30
    80004270:	00048513          	mv	a0,s1
    80004274:	00001097          	auipc	ra,0x1
    80004278:	5ec080e7          	jalr	1516(ra) # 80005860 <_Z9getStringPci>
    n = stringToInt(input);
    8000427c:	00048513          	mv	a0,s1
    80004280:	00001097          	auipc	ra,0x1
    80004284:	6b8080e7          	jalr	1720(ra) # 80005938 <_Z11stringToIntPKc>
    80004288:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    8000428c:	00006517          	auipc	a0,0x6
    80004290:	fdc50513          	addi	a0,a0,-36 # 8000a268 <CONSOLE_STATUS+0x258>
    80004294:	00001097          	auipc	ra,0x1
    80004298:	544080e7          	jalr	1348(ra) # 800057d8 <_Z11printStringPKc>
    printInt(threadNum);
    8000429c:	00000613          	li	a2,0
    800042a0:	00a00593          	li	a1,10
    800042a4:	00098513          	mv	a0,s3
    800042a8:	00001097          	auipc	ra,0x1
    800042ac:	6e0080e7          	jalr	1760(ra) # 80005988 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800042b0:	00006517          	auipc	a0,0x6
    800042b4:	fd050513          	addi	a0,a0,-48 # 8000a280 <CONSOLE_STATUS+0x270>
    800042b8:	00001097          	auipc	ra,0x1
    800042bc:	520080e7          	jalr	1312(ra) # 800057d8 <_Z11printStringPKc>
    printInt(n);
    800042c0:	00000613          	li	a2,0
    800042c4:	00a00593          	li	a1,10
    800042c8:	00048513          	mv	a0,s1
    800042cc:	00001097          	auipc	ra,0x1
    800042d0:	6bc080e7          	jalr	1724(ra) # 80005988 <_Z8printIntiii>
    printString(".\n");
    800042d4:	00006517          	auipc	a0,0x6
    800042d8:	fc450513          	addi	a0,a0,-60 # 8000a298 <CONSOLE_STATUS+0x288>
    800042dc:	00001097          	auipc	ra,0x1
    800042e0:	4fc080e7          	jalr	1276(ra) # 800057d8 <_Z11printStringPKc>
    if (threadNum > n) {
    800042e4:	0334c463          	blt	s1,s3,8000430c <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800042e8:	03305c63          	blez	s3,80004320 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800042ec:	03800513          	li	a0,56
    800042f0:	ffffe097          	auipc	ra,0xffffe
    800042f4:	494080e7          	jalr	1172(ra) # 80002784 <_Znwm>
    800042f8:	00050a93          	mv	s5,a0
    800042fc:	00048593          	mv	a1,s1
    80004300:	00001097          	auipc	ra,0x1
    80004304:	7a8080e7          	jalr	1960(ra) # 80005aa8 <_ZN9BufferCPPC1Ei>
    80004308:	0300006f          	j	80004338 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000430c:	00006517          	auipc	a0,0x6
    80004310:	f9450513          	addi	a0,a0,-108 # 8000a2a0 <CONSOLE_STATUS+0x290>
    80004314:	00001097          	auipc	ra,0x1
    80004318:	4c4080e7          	jalr	1220(ra) # 800057d8 <_Z11printStringPKc>
        return;
    8000431c:	0140006f          	j	80004330 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004320:	00006517          	auipc	a0,0x6
    80004324:	fc050513          	addi	a0,a0,-64 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80004328:	00001097          	auipc	ra,0x1
    8000432c:	4b0080e7          	jalr	1200(ra) # 800057d8 <_Z11printStringPKc>
        return;
    80004330:	000c0113          	mv	sp,s8
    80004334:	2140006f          	j	80004548 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004338:	01000513          	li	a0,16
    8000433c:	ffffe097          	auipc	ra,0xffffe
    80004340:	448080e7          	jalr	1096(ra) # 80002784 <_Znwm>
    80004344:	00050913          	mv	s2,a0
    80004348:	00000593          	li	a1,0
    8000434c:	ffffe097          	auipc	ra,0xffffe
    80004350:	7a4080e7          	jalr	1956(ra) # 80002af0 <_ZN9SemaphoreC1Ej>
    80004354:	00009797          	auipc	a5,0x9
    80004358:	ed27b623          	sd	s2,-308(a5) # 8000d220 <_ZL10waitForAll>
    Thread *producers[threadNum];
    8000435c:	00399793          	slli	a5,s3,0x3
    80004360:	00f78793          	addi	a5,a5,15
    80004364:	ff07f793          	andi	a5,a5,-16
    80004368:	40f10133          	sub	sp,sp,a5
    8000436c:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004370:	0019871b          	addiw	a4,s3,1
    80004374:	00171793          	slli	a5,a4,0x1
    80004378:	00e787b3          	add	a5,a5,a4
    8000437c:	00379793          	slli	a5,a5,0x3
    80004380:	00f78793          	addi	a5,a5,15
    80004384:	ff07f793          	andi	a5,a5,-16
    80004388:	40f10133          	sub	sp,sp,a5
    8000438c:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004390:	00199493          	slli	s1,s3,0x1
    80004394:	013484b3          	add	s1,s1,s3
    80004398:	00349493          	slli	s1,s1,0x3
    8000439c:	009b04b3          	add	s1,s6,s1
    800043a0:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    800043a4:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    800043a8:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800043ac:	02800513          	li	a0,40
    800043b0:	ffffe097          	auipc	ra,0xffffe
    800043b4:	3d4080e7          	jalr	980(ra) # 80002784 <_Znwm>
    800043b8:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    800043bc:	ffffe097          	auipc	ra,0xffffe
    800043c0:	6b8080e7          	jalr	1720(ra) # 80002a74 <_ZN6ThreadC1Ev>
    800043c4:	00009797          	auipc	a5,0x9
    800043c8:	adc78793          	addi	a5,a5,-1316 # 8000cea0 <_ZTV8Consumer+0x10>
    800043cc:	00fbb023          	sd	a5,0(s7)
    800043d0:	029bb023          	sd	s1,32(s7)
    consumer->start();
    800043d4:	000b8513          	mv	a0,s7
    800043d8:	ffffe097          	auipc	ra,0xffffe
    800043dc:	564080e7          	jalr	1380(ra) # 8000293c <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800043e0:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800043e4:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800043e8:	00009797          	auipc	a5,0x9
    800043ec:	e387b783          	ld	a5,-456(a5) # 8000d220 <_ZL10waitForAll>
    800043f0:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800043f4:	02800513          	li	a0,40
    800043f8:	ffffe097          	auipc	ra,0xffffe
    800043fc:	38c080e7          	jalr	908(ra) # 80002784 <_Znwm>
    80004400:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004404:	ffffe097          	auipc	ra,0xffffe
    80004408:	670080e7          	jalr	1648(ra) # 80002a74 <_ZN6ThreadC1Ev>
    8000440c:	00009797          	auipc	a5,0x9
    80004410:	a4478793          	addi	a5,a5,-1468 # 8000ce50 <_ZTV16ProducerKeyborad+0x10>
    80004414:	00f4b023          	sd	a5,0(s1)
    80004418:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000441c:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004420:	00048513          	mv	a0,s1
    80004424:	ffffe097          	auipc	ra,0xffffe
    80004428:	518080e7          	jalr	1304(ra) # 8000293c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000442c:	00100913          	li	s2,1
    80004430:	0300006f          	j	80004460 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004434:	00009797          	auipc	a5,0x9
    80004438:	a4478793          	addi	a5,a5,-1468 # 8000ce78 <_ZTV8Producer+0x10>
    8000443c:	00fcb023          	sd	a5,0(s9)
    80004440:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004444:	00391793          	slli	a5,s2,0x3
    80004448:	00fa07b3          	add	a5,s4,a5
    8000444c:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004450:	000c8513          	mv	a0,s9
    80004454:	ffffe097          	auipc	ra,0xffffe
    80004458:	4e8080e7          	jalr	1256(ra) # 8000293c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000445c:	0019091b          	addiw	s2,s2,1
    80004460:	05395263          	bge	s2,s3,800044a4 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004464:	00191493          	slli	s1,s2,0x1
    80004468:	012484b3          	add	s1,s1,s2
    8000446c:	00349493          	slli	s1,s1,0x3
    80004470:	009b04b3          	add	s1,s6,s1
    80004474:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004478:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    8000447c:	00009797          	auipc	a5,0x9
    80004480:	da47b783          	ld	a5,-604(a5) # 8000d220 <_ZL10waitForAll>
    80004484:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004488:	02800513          	li	a0,40
    8000448c:	ffffe097          	auipc	ra,0xffffe
    80004490:	2f8080e7          	jalr	760(ra) # 80002784 <_Znwm>
    80004494:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004498:	ffffe097          	auipc	ra,0xffffe
    8000449c:	5dc080e7          	jalr	1500(ra) # 80002a74 <_ZN6ThreadC1Ev>
    800044a0:	f95ff06f          	j	80004434 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    800044a4:	ffffe097          	auipc	ra,0xffffe
    800044a8:	514080e7          	jalr	1300(ra) # 800029b8 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800044ac:	00000493          	li	s1,0
    800044b0:	0099ce63          	blt	s3,s1,800044cc <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    800044b4:	00009517          	auipc	a0,0x9
    800044b8:	d6c53503          	ld	a0,-660(a0) # 8000d220 <_ZL10waitForAll>
    800044bc:	ffffe097          	auipc	ra,0xffffe
    800044c0:	66c080e7          	jalr	1644(ra) # 80002b28 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800044c4:	0014849b          	addiw	s1,s1,1
    800044c8:	fe9ff06f          	j	800044b0 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    800044cc:	00009517          	auipc	a0,0x9
    800044d0:	d5453503          	ld	a0,-684(a0) # 8000d220 <_ZL10waitForAll>
    800044d4:	00050863          	beqz	a0,800044e4 <_Z20testConsumerProducerv+0x2f4>
    800044d8:	00053783          	ld	a5,0(a0)
    800044dc:	0087b783          	ld	a5,8(a5)
    800044e0:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800044e4:	00000493          	li	s1,0
    800044e8:	0080006f          	j	800044f0 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800044ec:	0014849b          	addiw	s1,s1,1
    800044f0:	0334d263          	bge	s1,s3,80004514 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800044f4:	00349793          	slli	a5,s1,0x3
    800044f8:	00fa07b3          	add	a5,s4,a5
    800044fc:	0007b503          	ld	a0,0(a5)
    80004500:	fe0506e3          	beqz	a0,800044ec <_Z20testConsumerProducerv+0x2fc>
    80004504:	00053783          	ld	a5,0(a0)
    80004508:	0087b783          	ld	a5,8(a5)
    8000450c:	000780e7          	jalr	a5
    80004510:	fddff06f          	j	800044ec <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004514:	000b8a63          	beqz	s7,80004528 <_Z20testConsumerProducerv+0x338>
    80004518:	000bb783          	ld	a5,0(s7)
    8000451c:	0087b783          	ld	a5,8(a5)
    80004520:	000b8513          	mv	a0,s7
    80004524:	000780e7          	jalr	a5
    delete buffer;
    80004528:	000a8e63          	beqz	s5,80004544 <_Z20testConsumerProducerv+0x354>
    8000452c:	000a8513          	mv	a0,s5
    80004530:	00002097          	auipc	ra,0x2
    80004534:	870080e7          	jalr	-1936(ra) # 80005da0 <_ZN9BufferCPPD1Ev>
    80004538:	000a8513          	mv	a0,s5
    8000453c:	ffffe097          	auipc	ra,0xffffe
    80004540:	298080e7          	jalr	664(ra) # 800027d4 <_ZdlPv>
    80004544:	000c0113          	mv	sp,s8
}
    80004548:	f8040113          	addi	sp,s0,-128
    8000454c:	07813083          	ld	ra,120(sp)
    80004550:	07013403          	ld	s0,112(sp)
    80004554:	06813483          	ld	s1,104(sp)
    80004558:	06013903          	ld	s2,96(sp)
    8000455c:	05813983          	ld	s3,88(sp)
    80004560:	05013a03          	ld	s4,80(sp)
    80004564:	04813a83          	ld	s5,72(sp)
    80004568:	04013b03          	ld	s6,64(sp)
    8000456c:	03813b83          	ld	s7,56(sp)
    80004570:	03013c03          	ld	s8,48(sp)
    80004574:	02813c83          	ld	s9,40(sp)
    80004578:	08010113          	addi	sp,sp,128
    8000457c:	00008067          	ret
    80004580:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004584:	000a8513          	mv	a0,s5
    80004588:	ffffe097          	auipc	ra,0xffffe
    8000458c:	24c080e7          	jalr	588(ra) # 800027d4 <_ZdlPv>
    80004590:	00048513          	mv	a0,s1
    80004594:	0000a097          	auipc	ra,0xa
    80004598:	db4080e7          	jalr	-588(ra) # 8000e348 <_Unwind_Resume>
    8000459c:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    800045a0:	00090513          	mv	a0,s2
    800045a4:	ffffe097          	auipc	ra,0xffffe
    800045a8:	230080e7          	jalr	560(ra) # 800027d4 <_ZdlPv>
    800045ac:	00048513          	mv	a0,s1
    800045b0:	0000a097          	auipc	ra,0xa
    800045b4:	d98080e7          	jalr	-616(ra) # 8000e348 <_Unwind_Resume>
    800045b8:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800045bc:	000b8513          	mv	a0,s7
    800045c0:	ffffe097          	auipc	ra,0xffffe
    800045c4:	214080e7          	jalr	532(ra) # 800027d4 <_ZdlPv>
    800045c8:	00048513          	mv	a0,s1
    800045cc:	0000a097          	auipc	ra,0xa
    800045d0:	d7c080e7          	jalr	-644(ra) # 8000e348 <_Unwind_Resume>
    800045d4:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800045d8:	00048513          	mv	a0,s1
    800045dc:	ffffe097          	auipc	ra,0xffffe
    800045e0:	1f8080e7          	jalr	504(ra) # 800027d4 <_ZdlPv>
    800045e4:	00090513          	mv	a0,s2
    800045e8:	0000a097          	auipc	ra,0xa
    800045ec:	d60080e7          	jalr	-672(ra) # 8000e348 <_Unwind_Resume>
    800045f0:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800045f4:	000c8513          	mv	a0,s9
    800045f8:	ffffe097          	auipc	ra,0xffffe
    800045fc:	1dc080e7          	jalr	476(ra) # 800027d4 <_ZdlPv>
    80004600:	00048513          	mv	a0,s1
    80004604:	0000a097          	auipc	ra,0xa
    80004608:	d44080e7          	jalr	-700(ra) # 8000e348 <_Unwind_Resume>

000000008000460c <_ZN8Consumer3runEv>:
    void run() override {
    8000460c:	fd010113          	addi	sp,sp,-48
    80004610:	02113423          	sd	ra,40(sp)
    80004614:	02813023          	sd	s0,32(sp)
    80004618:	00913c23          	sd	s1,24(sp)
    8000461c:	01213823          	sd	s2,16(sp)
    80004620:	01313423          	sd	s3,8(sp)
    80004624:	03010413          	addi	s0,sp,48
    80004628:	00050913          	mv	s2,a0
        int i = 0;
    8000462c:	00000993          	li	s3,0
    80004630:	0100006f          	j	80004640 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004634:	00a00513          	li	a0,10
    80004638:	ffffe097          	auipc	ra,0xffffe
    8000463c:	5f0080e7          	jalr	1520(ra) # 80002c28 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004640:	00009797          	auipc	a5,0x9
    80004644:	bd87a783          	lw	a5,-1064(a5) # 8000d218 <_ZL9threadEnd>
    80004648:	04079a63          	bnez	a5,8000469c <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    8000464c:	02093783          	ld	a5,32(s2)
    80004650:	0087b503          	ld	a0,8(a5)
    80004654:	00001097          	auipc	ra,0x1
    80004658:	638080e7          	jalr	1592(ra) # 80005c8c <_ZN9BufferCPP3getEv>
            i++;
    8000465c:	0019849b          	addiw	s1,s3,1
    80004660:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004664:	0ff57513          	andi	a0,a0,255
    80004668:	ffffe097          	auipc	ra,0xffffe
    8000466c:	5c0080e7          	jalr	1472(ra) # 80002c28 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004670:	05000793          	li	a5,80
    80004674:	02f4e4bb          	remw	s1,s1,a5
    80004678:	fc0494e3          	bnez	s1,80004640 <_ZN8Consumer3runEv+0x34>
    8000467c:	fb9ff06f          	j	80004634 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004680:	02093783          	ld	a5,32(s2)
    80004684:	0087b503          	ld	a0,8(a5)
    80004688:	00001097          	auipc	ra,0x1
    8000468c:	604080e7          	jalr	1540(ra) # 80005c8c <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004690:	0ff57513          	andi	a0,a0,255
    80004694:	ffffe097          	auipc	ra,0xffffe
    80004698:	594080e7          	jalr	1428(ra) # 80002c28 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    8000469c:	02093783          	ld	a5,32(s2)
    800046a0:	0087b503          	ld	a0,8(a5)
    800046a4:	00001097          	auipc	ra,0x1
    800046a8:	674080e7          	jalr	1652(ra) # 80005d18 <_ZN9BufferCPP6getCntEv>
    800046ac:	fca04ae3          	bgtz	a0,80004680 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    800046b0:	02093783          	ld	a5,32(s2)
    800046b4:	0107b503          	ld	a0,16(a5)
    800046b8:	ffffe097          	auipc	ra,0xffffe
    800046bc:	49c080e7          	jalr	1180(ra) # 80002b54 <_ZN9Semaphore6signalEv>
    }
    800046c0:	02813083          	ld	ra,40(sp)
    800046c4:	02013403          	ld	s0,32(sp)
    800046c8:	01813483          	ld	s1,24(sp)
    800046cc:	01013903          	ld	s2,16(sp)
    800046d0:	00813983          	ld	s3,8(sp)
    800046d4:	03010113          	addi	sp,sp,48
    800046d8:	00008067          	ret

00000000800046dc <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    800046dc:	ff010113          	addi	sp,sp,-16
    800046e0:	00113423          	sd	ra,8(sp)
    800046e4:	00813023          	sd	s0,0(sp)
    800046e8:	01010413          	addi	s0,sp,16
    800046ec:	00008797          	auipc	a5,0x8
    800046f0:	7b478793          	addi	a5,a5,1972 # 8000cea0 <_ZTV8Consumer+0x10>
    800046f4:	00f53023          	sd	a5,0(a0)
    800046f8:	ffffe097          	auipc	ra,0xffffe
    800046fc:	fd8080e7          	jalr	-40(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80004700:	00813083          	ld	ra,8(sp)
    80004704:	00013403          	ld	s0,0(sp)
    80004708:	01010113          	addi	sp,sp,16
    8000470c:	00008067          	ret

0000000080004710 <_ZN8ConsumerD0Ev>:
    80004710:	fe010113          	addi	sp,sp,-32
    80004714:	00113c23          	sd	ra,24(sp)
    80004718:	00813823          	sd	s0,16(sp)
    8000471c:	00913423          	sd	s1,8(sp)
    80004720:	02010413          	addi	s0,sp,32
    80004724:	00050493          	mv	s1,a0
    80004728:	00008797          	auipc	a5,0x8
    8000472c:	77878793          	addi	a5,a5,1912 # 8000cea0 <_ZTV8Consumer+0x10>
    80004730:	00f53023          	sd	a5,0(a0)
    80004734:	ffffe097          	auipc	ra,0xffffe
    80004738:	f9c080e7          	jalr	-100(ra) # 800026d0 <_ZN6ThreadD1Ev>
    8000473c:	00048513          	mv	a0,s1
    80004740:	ffffe097          	auipc	ra,0xffffe
    80004744:	094080e7          	jalr	148(ra) # 800027d4 <_ZdlPv>
    80004748:	01813083          	ld	ra,24(sp)
    8000474c:	01013403          	ld	s0,16(sp)
    80004750:	00813483          	ld	s1,8(sp)
    80004754:	02010113          	addi	sp,sp,32
    80004758:	00008067          	ret

000000008000475c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    8000475c:	ff010113          	addi	sp,sp,-16
    80004760:	00113423          	sd	ra,8(sp)
    80004764:	00813023          	sd	s0,0(sp)
    80004768:	01010413          	addi	s0,sp,16
    8000476c:	00008797          	auipc	a5,0x8
    80004770:	6e478793          	addi	a5,a5,1764 # 8000ce50 <_ZTV16ProducerKeyborad+0x10>
    80004774:	00f53023          	sd	a5,0(a0)
    80004778:	ffffe097          	auipc	ra,0xffffe
    8000477c:	f58080e7          	jalr	-168(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80004780:	00813083          	ld	ra,8(sp)
    80004784:	00013403          	ld	s0,0(sp)
    80004788:	01010113          	addi	sp,sp,16
    8000478c:	00008067          	ret

0000000080004790 <_ZN16ProducerKeyboradD0Ev>:
    80004790:	fe010113          	addi	sp,sp,-32
    80004794:	00113c23          	sd	ra,24(sp)
    80004798:	00813823          	sd	s0,16(sp)
    8000479c:	00913423          	sd	s1,8(sp)
    800047a0:	02010413          	addi	s0,sp,32
    800047a4:	00050493          	mv	s1,a0
    800047a8:	00008797          	auipc	a5,0x8
    800047ac:	6a878793          	addi	a5,a5,1704 # 8000ce50 <_ZTV16ProducerKeyborad+0x10>
    800047b0:	00f53023          	sd	a5,0(a0)
    800047b4:	ffffe097          	auipc	ra,0xffffe
    800047b8:	f1c080e7          	jalr	-228(ra) # 800026d0 <_ZN6ThreadD1Ev>
    800047bc:	00048513          	mv	a0,s1
    800047c0:	ffffe097          	auipc	ra,0xffffe
    800047c4:	014080e7          	jalr	20(ra) # 800027d4 <_ZdlPv>
    800047c8:	01813083          	ld	ra,24(sp)
    800047cc:	01013403          	ld	s0,16(sp)
    800047d0:	00813483          	ld	s1,8(sp)
    800047d4:	02010113          	addi	sp,sp,32
    800047d8:	00008067          	ret

00000000800047dc <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    800047dc:	ff010113          	addi	sp,sp,-16
    800047e0:	00113423          	sd	ra,8(sp)
    800047e4:	00813023          	sd	s0,0(sp)
    800047e8:	01010413          	addi	s0,sp,16
    800047ec:	00008797          	auipc	a5,0x8
    800047f0:	68c78793          	addi	a5,a5,1676 # 8000ce78 <_ZTV8Producer+0x10>
    800047f4:	00f53023          	sd	a5,0(a0)
    800047f8:	ffffe097          	auipc	ra,0xffffe
    800047fc:	ed8080e7          	jalr	-296(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80004800:	00813083          	ld	ra,8(sp)
    80004804:	00013403          	ld	s0,0(sp)
    80004808:	01010113          	addi	sp,sp,16
    8000480c:	00008067          	ret

0000000080004810 <_ZN8ProducerD0Ev>:
    80004810:	fe010113          	addi	sp,sp,-32
    80004814:	00113c23          	sd	ra,24(sp)
    80004818:	00813823          	sd	s0,16(sp)
    8000481c:	00913423          	sd	s1,8(sp)
    80004820:	02010413          	addi	s0,sp,32
    80004824:	00050493          	mv	s1,a0
    80004828:	00008797          	auipc	a5,0x8
    8000482c:	65078793          	addi	a5,a5,1616 # 8000ce78 <_ZTV8Producer+0x10>
    80004830:	00f53023          	sd	a5,0(a0)
    80004834:	ffffe097          	auipc	ra,0xffffe
    80004838:	e9c080e7          	jalr	-356(ra) # 800026d0 <_ZN6ThreadD1Ev>
    8000483c:	00048513          	mv	a0,s1
    80004840:	ffffe097          	auipc	ra,0xffffe
    80004844:	f94080e7          	jalr	-108(ra) # 800027d4 <_ZdlPv>
    80004848:	01813083          	ld	ra,24(sp)
    8000484c:	01013403          	ld	s0,16(sp)
    80004850:	00813483          	ld	s1,8(sp)
    80004854:	02010113          	addi	sp,sp,32
    80004858:	00008067          	ret

000000008000485c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    8000485c:	fe010113          	addi	sp,sp,-32
    80004860:	00113c23          	sd	ra,24(sp)
    80004864:	00813823          	sd	s0,16(sp)
    80004868:	00913423          	sd	s1,8(sp)
    8000486c:	02010413          	addi	s0,sp,32
    80004870:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004874:	ffffd097          	auipc	ra,0xffffd
    80004878:	d8c080e7          	jalr	-628(ra) # 80001600 <_Z4getcv>
    8000487c:	0005059b          	sext.w	a1,a0
    80004880:	01b00793          	li	a5,27
    80004884:	00f58c63          	beq	a1,a5,8000489c <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004888:	0204b783          	ld	a5,32(s1)
    8000488c:	0087b503          	ld	a0,8(a5)
    80004890:	00001097          	auipc	ra,0x1
    80004894:	36c080e7          	jalr	876(ra) # 80005bfc <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004898:	fddff06f          	j	80004874 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    8000489c:	00100793          	li	a5,1
    800048a0:	00009717          	auipc	a4,0x9
    800048a4:	96f72c23          	sw	a5,-1672(a4) # 8000d218 <_ZL9threadEnd>
        td->buffer->put('!');
    800048a8:	0204b783          	ld	a5,32(s1)
    800048ac:	02100593          	li	a1,33
    800048b0:	0087b503          	ld	a0,8(a5)
    800048b4:	00001097          	auipc	ra,0x1
    800048b8:	348080e7          	jalr	840(ra) # 80005bfc <_ZN9BufferCPP3putEi>
        td->sem->signal();
    800048bc:	0204b783          	ld	a5,32(s1)
    800048c0:	0107b503          	ld	a0,16(a5)
    800048c4:	ffffe097          	auipc	ra,0xffffe
    800048c8:	290080e7          	jalr	656(ra) # 80002b54 <_ZN9Semaphore6signalEv>
    }
    800048cc:	01813083          	ld	ra,24(sp)
    800048d0:	01013403          	ld	s0,16(sp)
    800048d4:	00813483          	ld	s1,8(sp)
    800048d8:	02010113          	addi	sp,sp,32
    800048dc:	00008067          	ret

00000000800048e0 <_ZN8Producer3runEv>:
    void run() override {
    800048e0:	fe010113          	addi	sp,sp,-32
    800048e4:	00113c23          	sd	ra,24(sp)
    800048e8:	00813823          	sd	s0,16(sp)
    800048ec:	00913423          	sd	s1,8(sp)
    800048f0:	01213023          	sd	s2,0(sp)
    800048f4:	02010413          	addi	s0,sp,32
    800048f8:	00050493          	mv	s1,a0
        int i = 0;
    800048fc:	00000913          	li	s2,0
        while (!threadEnd) {
    80004900:	00009797          	auipc	a5,0x9
    80004904:	9187a783          	lw	a5,-1768(a5) # 8000d218 <_ZL9threadEnd>
    80004908:	04079263          	bnez	a5,8000494c <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    8000490c:	0204b783          	ld	a5,32(s1)
    80004910:	0007a583          	lw	a1,0(a5)
    80004914:	0305859b          	addiw	a1,a1,48
    80004918:	0087b503          	ld	a0,8(a5)
    8000491c:	00001097          	auipc	ra,0x1
    80004920:	2e0080e7          	jalr	736(ra) # 80005bfc <_ZN9BufferCPP3putEi>
            i++;
    80004924:	0019071b          	addiw	a4,s2,1
    80004928:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    8000492c:	0204b783          	ld	a5,32(s1)
    80004930:	0007a783          	lw	a5,0(a5)
    80004934:	00e787bb          	addw	a5,a5,a4
    80004938:	00500513          	li	a0,5
    8000493c:	02a7e53b          	remw	a0,a5,a0
    80004940:	ffffe097          	auipc	ra,0xffffe
    80004944:	0a0080e7          	jalr	160(ra) # 800029e0 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004948:	fb9ff06f          	j	80004900 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    8000494c:	0204b783          	ld	a5,32(s1)
    80004950:	0107b503          	ld	a0,16(a5)
    80004954:	ffffe097          	auipc	ra,0xffffe
    80004958:	200080e7          	jalr	512(ra) # 80002b54 <_ZN9Semaphore6signalEv>
    }
    8000495c:	01813083          	ld	ra,24(sp)
    80004960:	01013403          	ld	s0,16(sp)
    80004964:	00813483          	ld	s1,8(sp)
    80004968:	00013903          	ld	s2,0(sp)
    8000496c:	02010113          	addi	sp,sp,32
    80004970:	00008067          	ret

0000000080004974 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004974:	fe010113          	addi	sp,sp,-32
    80004978:	00113c23          	sd	ra,24(sp)
    8000497c:	00813823          	sd	s0,16(sp)
    80004980:	00913423          	sd	s1,8(sp)
    80004984:	01213023          	sd	s2,0(sp)
    80004988:	02010413          	addi	s0,sp,32
    8000498c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004990:	00100793          	li	a5,1
    80004994:	02a7f863          	bgeu	a5,a0,800049c4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004998:	00a00793          	li	a5,10
    8000499c:	02f577b3          	remu	a5,a0,a5
    800049a0:	02078e63          	beqz	a5,800049dc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800049a4:	fff48513          	addi	a0,s1,-1
    800049a8:	00000097          	auipc	ra,0x0
    800049ac:	fcc080e7          	jalr	-52(ra) # 80004974 <_ZL9fibonaccim>
    800049b0:	00050913          	mv	s2,a0
    800049b4:	ffe48513          	addi	a0,s1,-2
    800049b8:	00000097          	auipc	ra,0x0
    800049bc:	fbc080e7          	jalr	-68(ra) # 80004974 <_ZL9fibonaccim>
    800049c0:	00a90533          	add	a0,s2,a0
}
    800049c4:	01813083          	ld	ra,24(sp)
    800049c8:	01013403          	ld	s0,16(sp)
    800049cc:	00813483          	ld	s1,8(sp)
    800049d0:	00013903          	ld	s2,0(sp)
    800049d4:	02010113          	addi	sp,sp,32
    800049d8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800049dc:	ffffd097          	auipc	ra,0xffffd
    800049e0:	ae4080e7          	jalr	-1308(ra) # 800014c0 <_Z15thread_dispatchv>
    800049e4:	fc1ff06f          	j	800049a4 <_ZL9fibonaccim+0x30>

00000000800049e8 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800049e8:	fe010113          	addi	sp,sp,-32
    800049ec:	00113c23          	sd	ra,24(sp)
    800049f0:	00813823          	sd	s0,16(sp)
    800049f4:	00913423          	sd	s1,8(sp)
    800049f8:	01213023          	sd	s2,0(sp)
    800049fc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004a00:	00a00493          	li	s1,10
    80004a04:	0400006f          	j	80004a44 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004a08:	00006517          	auipc	a0,0x6
    80004a0c:	97850513          	addi	a0,a0,-1672 # 8000a380 <CONSOLE_STATUS+0x370>
    80004a10:	00001097          	auipc	ra,0x1
    80004a14:	dc8080e7          	jalr	-568(ra) # 800057d8 <_Z11printStringPKc>
    80004a18:	00000613          	li	a2,0
    80004a1c:	00a00593          	li	a1,10
    80004a20:	00048513          	mv	a0,s1
    80004a24:	00001097          	auipc	ra,0x1
    80004a28:	f64080e7          	jalr	-156(ra) # 80005988 <_Z8printIntiii>
    80004a2c:	00006517          	auipc	a0,0x6
    80004a30:	b4450513          	addi	a0,a0,-1212 # 8000a570 <CONSOLE_STATUS+0x560>
    80004a34:	00001097          	auipc	ra,0x1
    80004a38:	da4080e7          	jalr	-604(ra) # 800057d8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004a3c:	0014849b          	addiw	s1,s1,1
    80004a40:	0ff4f493          	andi	s1,s1,255
    80004a44:	00c00793          	li	a5,12
    80004a48:	fc97f0e3          	bgeu	a5,s1,80004a08 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004a4c:	00006517          	auipc	a0,0x6
    80004a50:	93c50513          	addi	a0,a0,-1732 # 8000a388 <CONSOLE_STATUS+0x378>
    80004a54:	00001097          	auipc	ra,0x1
    80004a58:	d84080e7          	jalr	-636(ra) # 800057d8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004a5c:	00500313          	li	t1,5
    thread_dispatch();
    80004a60:	ffffd097          	auipc	ra,0xffffd
    80004a64:	a60080e7          	jalr	-1440(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004a68:	01000513          	li	a0,16
    80004a6c:	00000097          	auipc	ra,0x0
    80004a70:	f08080e7          	jalr	-248(ra) # 80004974 <_ZL9fibonaccim>
    80004a74:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004a78:	00006517          	auipc	a0,0x6
    80004a7c:	92050513          	addi	a0,a0,-1760 # 8000a398 <CONSOLE_STATUS+0x388>
    80004a80:	00001097          	auipc	ra,0x1
    80004a84:	d58080e7          	jalr	-680(ra) # 800057d8 <_Z11printStringPKc>
    80004a88:	00000613          	li	a2,0
    80004a8c:	00a00593          	li	a1,10
    80004a90:	0009051b          	sext.w	a0,s2
    80004a94:	00001097          	auipc	ra,0x1
    80004a98:	ef4080e7          	jalr	-268(ra) # 80005988 <_Z8printIntiii>
    80004a9c:	00006517          	auipc	a0,0x6
    80004aa0:	ad450513          	addi	a0,a0,-1324 # 8000a570 <CONSOLE_STATUS+0x560>
    80004aa4:	00001097          	auipc	ra,0x1
    80004aa8:	d34080e7          	jalr	-716(ra) # 800057d8 <_Z11printStringPKc>
    80004aac:	0400006f          	j	80004aec <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004ab0:	00006517          	auipc	a0,0x6
    80004ab4:	8d050513          	addi	a0,a0,-1840 # 8000a380 <CONSOLE_STATUS+0x370>
    80004ab8:	00001097          	auipc	ra,0x1
    80004abc:	d20080e7          	jalr	-736(ra) # 800057d8 <_Z11printStringPKc>
    80004ac0:	00000613          	li	a2,0
    80004ac4:	00a00593          	li	a1,10
    80004ac8:	00048513          	mv	a0,s1
    80004acc:	00001097          	auipc	ra,0x1
    80004ad0:	ebc080e7          	jalr	-324(ra) # 80005988 <_Z8printIntiii>
    80004ad4:	00006517          	auipc	a0,0x6
    80004ad8:	a9c50513          	addi	a0,a0,-1380 # 8000a570 <CONSOLE_STATUS+0x560>
    80004adc:	00001097          	auipc	ra,0x1
    80004ae0:	cfc080e7          	jalr	-772(ra) # 800057d8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004ae4:	0014849b          	addiw	s1,s1,1
    80004ae8:	0ff4f493          	andi	s1,s1,255
    80004aec:	00f00793          	li	a5,15
    80004af0:	fc97f0e3          	bgeu	a5,s1,80004ab0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004af4:	00006517          	auipc	a0,0x6
    80004af8:	8b450513          	addi	a0,a0,-1868 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80004afc:	00001097          	auipc	ra,0x1
    80004b00:	cdc080e7          	jalr	-804(ra) # 800057d8 <_Z11printStringPKc>
    finishedD = true;
    80004b04:	00100793          	li	a5,1
    80004b08:	00008717          	auipc	a4,0x8
    80004b0c:	72f70023          	sb	a5,1824(a4) # 8000d228 <_ZL9finishedD>
    thread_dispatch();
    80004b10:	ffffd097          	auipc	ra,0xffffd
    80004b14:	9b0080e7          	jalr	-1616(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80004b18:	01813083          	ld	ra,24(sp)
    80004b1c:	01013403          	ld	s0,16(sp)
    80004b20:	00813483          	ld	s1,8(sp)
    80004b24:	00013903          	ld	s2,0(sp)
    80004b28:	02010113          	addi	sp,sp,32
    80004b2c:	00008067          	ret

0000000080004b30 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004b30:	fe010113          	addi	sp,sp,-32
    80004b34:	00113c23          	sd	ra,24(sp)
    80004b38:	00813823          	sd	s0,16(sp)
    80004b3c:	00913423          	sd	s1,8(sp)
    80004b40:	01213023          	sd	s2,0(sp)
    80004b44:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004b48:	00000493          	li	s1,0
    80004b4c:	0400006f          	j	80004b8c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004b50:	00005517          	auipc	a0,0x5
    80004b54:	7f050513          	addi	a0,a0,2032 # 8000a340 <CONSOLE_STATUS+0x330>
    80004b58:	00001097          	auipc	ra,0x1
    80004b5c:	c80080e7          	jalr	-896(ra) # 800057d8 <_Z11printStringPKc>
    80004b60:	00000613          	li	a2,0
    80004b64:	00a00593          	li	a1,10
    80004b68:	00048513          	mv	a0,s1
    80004b6c:	00001097          	auipc	ra,0x1
    80004b70:	e1c080e7          	jalr	-484(ra) # 80005988 <_Z8printIntiii>
    80004b74:	00006517          	auipc	a0,0x6
    80004b78:	9fc50513          	addi	a0,a0,-1540 # 8000a570 <CONSOLE_STATUS+0x560>
    80004b7c:	00001097          	auipc	ra,0x1
    80004b80:	c5c080e7          	jalr	-932(ra) # 800057d8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004b84:	0014849b          	addiw	s1,s1,1
    80004b88:	0ff4f493          	andi	s1,s1,255
    80004b8c:	00200793          	li	a5,2
    80004b90:	fc97f0e3          	bgeu	a5,s1,80004b50 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004b94:	00005517          	auipc	a0,0x5
    80004b98:	7b450513          	addi	a0,a0,1972 # 8000a348 <CONSOLE_STATUS+0x338>
    80004b9c:	00001097          	auipc	ra,0x1
    80004ba0:	c3c080e7          	jalr	-964(ra) # 800057d8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004ba4:	00700313          	li	t1,7
    thread_dispatch();
    80004ba8:	ffffd097          	auipc	ra,0xffffd
    80004bac:	918080e7          	jalr	-1768(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004bb0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004bb4:	00005517          	auipc	a0,0x5
    80004bb8:	7a450513          	addi	a0,a0,1956 # 8000a358 <CONSOLE_STATUS+0x348>
    80004bbc:	00001097          	auipc	ra,0x1
    80004bc0:	c1c080e7          	jalr	-996(ra) # 800057d8 <_Z11printStringPKc>
    80004bc4:	00000613          	li	a2,0
    80004bc8:	00a00593          	li	a1,10
    80004bcc:	0009051b          	sext.w	a0,s2
    80004bd0:	00001097          	auipc	ra,0x1
    80004bd4:	db8080e7          	jalr	-584(ra) # 80005988 <_Z8printIntiii>
    80004bd8:	00006517          	auipc	a0,0x6
    80004bdc:	99850513          	addi	a0,a0,-1640 # 8000a570 <CONSOLE_STATUS+0x560>
    80004be0:	00001097          	auipc	ra,0x1
    80004be4:	bf8080e7          	jalr	-1032(ra) # 800057d8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004be8:	00c00513          	li	a0,12
    80004bec:	00000097          	auipc	ra,0x0
    80004bf0:	d88080e7          	jalr	-632(ra) # 80004974 <_ZL9fibonaccim>
    80004bf4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004bf8:	00005517          	auipc	a0,0x5
    80004bfc:	76850513          	addi	a0,a0,1896 # 8000a360 <CONSOLE_STATUS+0x350>
    80004c00:	00001097          	auipc	ra,0x1
    80004c04:	bd8080e7          	jalr	-1064(ra) # 800057d8 <_Z11printStringPKc>
    80004c08:	00000613          	li	a2,0
    80004c0c:	00a00593          	li	a1,10
    80004c10:	0009051b          	sext.w	a0,s2
    80004c14:	00001097          	auipc	ra,0x1
    80004c18:	d74080e7          	jalr	-652(ra) # 80005988 <_Z8printIntiii>
    80004c1c:	00006517          	auipc	a0,0x6
    80004c20:	95450513          	addi	a0,a0,-1708 # 8000a570 <CONSOLE_STATUS+0x560>
    80004c24:	00001097          	auipc	ra,0x1
    80004c28:	bb4080e7          	jalr	-1100(ra) # 800057d8 <_Z11printStringPKc>
    80004c2c:	0400006f          	j	80004c6c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004c30:	00005517          	auipc	a0,0x5
    80004c34:	71050513          	addi	a0,a0,1808 # 8000a340 <CONSOLE_STATUS+0x330>
    80004c38:	00001097          	auipc	ra,0x1
    80004c3c:	ba0080e7          	jalr	-1120(ra) # 800057d8 <_Z11printStringPKc>
    80004c40:	00000613          	li	a2,0
    80004c44:	00a00593          	li	a1,10
    80004c48:	00048513          	mv	a0,s1
    80004c4c:	00001097          	auipc	ra,0x1
    80004c50:	d3c080e7          	jalr	-708(ra) # 80005988 <_Z8printIntiii>
    80004c54:	00006517          	auipc	a0,0x6
    80004c58:	91c50513          	addi	a0,a0,-1764 # 8000a570 <CONSOLE_STATUS+0x560>
    80004c5c:	00001097          	auipc	ra,0x1
    80004c60:	b7c080e7          	jalr	-1156(ra) # 800057d8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004c64:	0014849b          	addiw	s1,s1,1
    80004c68:	0ff4f493          	andi	s1,s1,255
    80004c6c:	00500793          	li	a5,5
    80004c70:	fc97f0e3          	bgeu	a5,s1,80004c30 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80004c74:	00005517          	auipc	a0,0x5
    80004c78:	6fc50513          	addi	a0,a0,1788 # 8000a370 <CONSOLE_STATUS+0x360>
    80004c7c:	00001097          	auipc	ra,0x1
    80004c80:	b5c080e7          	jalr	-1188(ra) # 800057d8 <_Z11printStringPKc>
    finishedC = true;
    80004c84:	00100793          	li	a5,1
    80004c88:	00008717          	auipc	a4,0x8
    80004c8c:	5af700a3          	sb	a5,1441(a4) # 8000d229 <_ZL9finishedC>
    thread_dispatch();
    80004c90:	ffffd097          	auipc	ra,0xffffd
    80004c94:	830080e7          	jalr	-2000(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80004c98:	01813083          	ld	ra,24(sp)
    80004c9c:	01013403          	ld	s0,16(sp)
    80004ca0:	00813483          	ld	s1,8(sp)
    80004ca4:	00013903          	ld	s2,0(sp)
    80004ca8:	02010113          	addi	sp,sp,32
    80004cac:	00008067          	ret

0000000080004cb0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004cb0:	fe010113          	addi	sp,sp,-32
    80004cb4:	00113c23          	sd	ra,24(sp)
    80004cb8:	00813823          	sd	s0,16(sp)
    80004cbc:	00913423          	sd	s1,8(sp)
    80004cc0:	01213023          	sd	s2,0(sp)
    80004cc4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004cc8:	00000913          	li	s2,0
    80004ccc:	0380006f          	j	80004d04 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004cd0:	ffffc097          	auipc	ra,0xffffc
    80004cd4:	7f0080e7          	jalr	2032(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004cd8:	00148493          	addi	s1,s1,1
    80004cdc:	000027b7          	lui	a5,0x2
    80004ce0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004ce4:	0097ee63          	bltu	a5,s1,80004d00 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004ce8:	00000713          	li	a4,0
    80004cec:	000077b7          	lui	a5,0x7
    80004cf0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004cf4:	fce7eee3          	bltu	a5,a4,80004cd0 <_ZL11workerBodyBPv+0x20>
    80004cf8:	00170713          	addi	a4,a4,1
    80004cfc:	ff1ff06f          	j	80004cec <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004d00:	00190913          	addi	s2,s2,1
    80004d04:	00f00793          	li	a5,15
    80004d08:	0527e063          	bltu	a5,s2,80004d48 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004d0c:	00005517          	auipc	a0,0x5
    80004d10:	61c50513          	addi	a0,a0,1564 # 8000a328 <CONSOLE_STATUS+0x318>
    80004d14:	00001097          	auipc	ra,0x1
    80004d18:	ac4080e7          	jalr	-1340(ra) # 800057d8 <_Z11printStringPKc>
    80004d1c:	00000613          	li	a2,0
    80004d20:	00a00593          	li	a1,10
    80004d24:	0009051b          	sext.w	a0,s2
    80004d28:	00001097          	auipc	ra,0x1
    80004d2c:	c60080e7          	jalr	-928(ra) # 80005988 <_Z8printIntiii>
    80004d30:	00006517          	auipc	a0,0x6
    80004d34:	84050513          	addi	a0,a0,-1984 # 8000a570 <CONSOLE_STATUS+0x560>
    80004d38:	00001097          	auipc	ra,0x1
    80004d3c:	aa0080e7          	jalr	-1376(ra) # 800057d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004d40:	00000493          	li	s1,0
    80004d44:	f99ff06f          	j	80004cdc <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004d48:	00005517          	auipc	a0,0x5
    80004d4c:	5e850513          	addi	a0,a0,1512 # 8000a330 <CONSOLE_STATUS+0x320>
    80004d50:	00001097          	auipc	ra,0x1
    80004d54:	a88080e7          	jalr	-1400(ra) # 800057d8 <_Z11printStringPKc>
    finishedB = true;
    80004d58:	00100793          	li	a5,1
    80004d5c:	00008717          	auipc	a4,0x8
    80004d60:	4cf70723          	sb	a5,1230(a4) # 8000d22a <_ZL9finishedB>
    thread_dispatch();
    80004d64:	ffffc097          	auipc	ra,0xffffc
    80004d68:	75c080e7          	jalr	1884(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80004d6c:	01813083          	ld	ra,24(sp)
    80004d70:	01013403          	ld	s0,16(sp)
    80004d74:	00813483          	ld	s1,8(sp)
    80004d78:	00013903          	ld	s2,0(sp)
    80004d7c:	02010113          	addi	sp,sp,32
    80004d80:	00008067          	ret

0000000080004d84 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004d84:	fe010113          	addi	sp,sp,-32
    80004d88:	00113c23          	sd	ra,24(sp)
    80004d8c:	00813823          	sd	s0,16(sp)
    80004d90:	00913423          	sd	s1,8(sp)
    80004d94:	01213023          	sd	s2,0(sp)
    80004d98:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004d9c:	00000913          	li	s2,0
    80004da0:	0380006f          	j	80004dd8 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004da4:	ffffc097          	auipc	ra,0xffffc
    80004da8:	71c080e7          	jalr	1820(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004dac:	00148493          	addi	s1,s1,1
    80004db0:	000027b7          	lui	a5,0x2
    80004db4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004db8:	0097ee63          	bltu	a5,s1,80004dd4 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004dbc:	00000713          	li	a4,0
    80004dc0:	000077b7          	lui	a5,0x7
    80004dc4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004dc8:	fce7eee3          	bltu	a5,a4,80004da4 <_ZL11workerBodyAPv+0x20>
    80004dcc:	00170713          	addi	a4,a4,1
    80004dd0:	ff1ff06f          	j	80004dc0 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004dd4:	00190913          	addi	s2,s2,1
    80004dd8:	00900793          	li	a5,9
    80004ddc:	0527e063          	bltu	a5,s2,80004e1c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004de0:	00005517          	auipc	a0,0x5
    80004de4:	53050513          	addi	a0,a0,1328 # 8000a310 <CONSOLE_STATUS+0x300>
    80004de8:	00001097          	auipc	ra,0x1
    80004dec:	9f0080e7          	jalr	-1552(ra) # 800057d8 <_Z11printStringPKc>
    80004df0:	00000613          	li	a2,0
    80004df4:	00a00593          	li	a1,10
    80004df8:	0009051b          	sext.w	a0,s2
    80004dfc:	00001097          	auipc	ra,0x1
    80004e00:	b8c080e7          	jalr	-1140(ra) # 80005988 <_Z8printIntiii>
    80004e04:	00005517          	auipc	a0,0x5
    80004e08:	76c50513          	addi	a0,a0,1900 # 8000a570 <CONSOLE_STATUS+0x560>
    80004e0c:	00001097          	auipc	ra,0x1
    80004e10:	9cc080e7          	jalr	-1588(ra) # 800057d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004e14:	00000493          	li	s1,0
    80004e18:	f99ff06f          	j	80004db0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80004e1c:	00005517          	auipc	a0,0x5
    80004e20:	4fc50513          	addi	a0,a0,1276 # 8000a318 <CONSOLE_STATUS+0x308>
    80004e24:	00001097          	auipc	ra,0x1
    80004e28:	9b4080e7          	jalr	-1612(ra) # 800057d8 <_Z11printStringPKc>
    finishedA = true;
    80004e2c:	00100793          	li	a5,1
    80004e30:	00008717          	auipc	a4,0x8
    80004e34:	3ef70da3          	sb	a5,1019(a4) # 8000d22b <_ZL9finishedA>
}
    80004e38:	01813083          	ld	ra,24(sp)
    80004e3c:	01013403          	ld	s0,16(sp)
    80004e40:	00813483          	ld	s1,8(sp)
    80004e44:	00013903          	ld	s2,0(sp)
    80004e48:	02010113          	addi	sp,sp,32
    80004e4c:	00008067          	ret

0000000080004e50 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004e50:	fd010113          	addi	sp,sp,-48
    80004e54:	02113423          	sd	ra,40(sp)
    80004e58:	02813023          	sd	s0,32(sp)
    80004e5c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004e60:	00000613          	li	a2,0
    80004e64:	00000597          	auipc	a1,0x0
    80004e68:	f2058593          	addi	a1,a1,-224 # 80004d84 <_ZL11workerBodyAPv>
    80004e6c:	fd040513          	addi	a0,s0,-48
    80004e70:	ffffc097          	auipc	ra,0xffffc
    80004e74:	594080e7          	jalr	1428(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80004e78:	00005517          	auipc	a0,0x5
    80004e7c:	54050513          	addi	a0,a0,1344 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    80004e80:	00001097          	auipc	ra,0x1
    80004e84:	958080e7          	jalr	-1704(ra) # 800057d8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80004e88:	00000613          	li	a2,0
    80004e8c:	00000597          	auipc	a1,0x0
    80004e90:	e2458593          	addi	a1,a1,-476 # 80004cb0 <_ZL11workerBodyBPv>
    80004e94:	fd840513          	addi	a0,s0,-40
    80004e98:	ffffc097          	auipc	ra,0xffffc
    80004e9c:	56c080e7          	jalr	1388(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80004ea0:	00005517          	auipc	a0,0x5
    80004ea4:	53050513          	addi	a0,a0,1328 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80004ea8:	00001097          	auipc	ra,0x1
    80004eac:	930080e7          	jalr	-1744(ra) # 800057d8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004eb0:	00000613          	li	a2,0
    80004eb4:	00000597          	auipc	a1,0x0
    80004eb8:	c7c58593          	addi	a1,a1,-900 # 80004b30 <_ZL11workerBodyCPv>
    80004ebc:	fe040513          	addi	a0,s0,-32
    80004ec0:	ffffc097          	auipc	ra,0xffffc
    80004ec4:	544080e7          	jalr	1348(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80004ec8:	00005517          	auipc	a0,0x5
    80004ecc:	52050513          	addi	a0,a0,1312 # 8000a3e8 <CONSOLE_STATUS+0x3d8>
    80004ed0:	00001097          	auipc	ra,0x1
    80004ed4:	908080e7          	jalr	-1784(ra) # 800057d8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80004ed8:	00000613          	li	a2,0
    80004edc:	00000597          	auipc	a1,0x0
    80004ee0:	b0c58593          	addi	a1,a1,-1268 # 800049e8 <_ZL11workerBodyDPv>
    80004ee4:	fe840513          	addi	a0,s0,-24
    80004ee8:	ffffc097          	auipc	ra,0xffffc
    80004eec:	51c080e7          	jalr	1308(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80004ef0:	00005517          	auipc	a0,0x5
    80004ef4:	51050513          	addi	a0,a0,1296 # 8000a400 <CONSOLE_STATUS+0x3f0>
    80004ef8:	00001097          	auipc	ra,0x1
    80004efc:	8e0080e7          	jalr	-1824(ra) # 800057d8 <_Z11printStringPKc>
    80004f00:	00c0006f          	j	80004f0c <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004f04:	ffffc097          	auipc	ra,0xffffc
    80004f08:	5bc080e7          	jalr	1468(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004f0c:	00008797          	auipc	a5,0x8
    80004f10:	31f7c783          	lbu	a5,799(a5) # 8000d22b <_ZL9finishedA>
    80004f14:	fe0788e3          	beqz	a5,80004f04 <_Z18Threads_C_API_testv+0xb4>
    80004f18:	00008797          	auipc	a5,0x8
    80004f1c:	3127c783          	lbu	a5,786(a5) # 8000d22a <_ZL9finishedB>
    80004f20:	fe0782e3          	beqz	a5,80004f04 <_Z18Threads_C_API_testv+0xb4>
    80004f24:	00008797          	auipc	a5,0x8
    80004f28:	3057c783          	lbu	a5,773(a5) # 8000d229 <_ZL9finishedC>
    80004f2c:	fc078ce3          	beqz	a5,80004f04 <_Z18Threads_C_API_testv+0xb4>
    80004f30:	00008797          	auipc	a5,0x8
    80004f34:	2f87c783          	lbu	a5,760(a5) # 8000d228 <_ZL9finishedD>
    80004f38:	fc0786e3          	beqz	a5,80004f04 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80004f3c:	02813083          	ld	ra,40(sp)
    80004f40:	02013403          	ld	s0,32(sp)
    80004f44:	03010113          	addi	sp,sp,48
    80004f48:	00008067          	ret

0000000080004f4c <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80004f4c:	fd010113          	addi	sp,sp,-48
    80004f50:	02113423          	sd	ra,40(sp)
    80004f54:	02813023          	sd	s0,32(sp)
    80004f58:	00913c23          	sd	s1,24(sp)
    80004f5c:	01213823          	sd	s2,16(sp)
    80004f60:	01313423          	sd	s3,8(sp)
    80004f64:	03010413          	addi	s0,sp,48
    80004f68:	00050993          	mv	s3,a0
    80004f6c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004f70:	00000913          	li	s2,0
    80004f74:	00c0006f          	j	80004f80 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004f78:	ffffe097          	auipc	ra,0xffffe
    80004f7c:	a40080e7          	jalr	-1472(ra) # 800029b8 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80004f80:	ffffc097          	auipc	ra,0xffffc
    80004f84:	680080e7          	jalr	1664(ra) # 80001600 <_Z4getcv>
    80004f88:	0005059b          	sext.w	a1,a0
    80004f8c:	01b00793          	li	a5,27
    80004f90:	02f58a63          	beq	a1,a5,80004fc4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80004f94:	0084b503          	ld	a0,8(s1)
    80004f98:	00001097          	auipc	ra,0x1
    80004f9c:	c64080e7          	jalr	-924(ra) # 80005bfc <_ZN9BufferCPP3putEi>
        i++;
    80004fa0:	0019071b          	addiw	a4,s2,1
    80004fa4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004fa8:	0004a683          	lw	a3,0(s1)
    80004fac:	0026979b          	slliw	a5,a3,0x2
    80004fb0:	00d787bb          	addw	a5,a5,a3
    80004fb4:	0017979b          	slliw	a5,a5,0x1
    80004fb8:	02f767bb          	remw	a5,a4,a5
    80004fbc:	fc0792e3          	bnez	a5,80004f80 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80004fc0:	fb9ff06f          	j	80004f78 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80004fc4:	00100793          	li	a5,1
    80004fc8:	00008717          	auipc	a4,0x8
    80004fcc:	26f72423          	sw	a5,616(a4) # 8000d230 <_ZL9threadEnd>
    td->buffer->put('!');
    80004fd0:	0209b783          	ld	a5,32(s3)
    80004fd4:	02100593          	li	a1,33
    80004fd8:	0087b503          	ld	a0,8(a5)
    80004fdc:	00001097          	auipc	ra,0x1
    80004fe0:	c20080e7          	jalr	-992(ra) # 80005bfc <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80004fe4:	0104b503          	ld	a0,16(s1)
    80004fe8:	ffffe097          	auipc	ra,0xffffe
    80004fec:	b6c080e7          	jalr	-1172(ra) # 80002b54 <_ZN9Semaphore6signalEv>
}
    80004ff0:	02813083          	ld	ra,40(sp)
    80004ff4:	02013403          	ld	s0,32(sp)
    80004ff8:	01813483          	ld	s1,24(sp)
    80004ffc:	01013903          	ld	s2,16(sp)
    80005000:	00813983          	ld	s3,8(sp)
    80005004:	03010113          	addi	sp,sp,48
    80005008:	00008067          	ret

000000008000500c <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    8000500c:	fe010113          	addi	sp,sp,-32
    80005010:	00113c23          	sd	ra,24(sp)
    80005014:	00813823          	sd	s0,16(sp)
    80005018:	00913423          	sd	s1,8(sp)
    8000501c:	01213023          	sd	s2,0(sp)
    80005020:	02010413          	addi	s0,sp,32
    80005024:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005028:	00000913          	li	s2,0
    8000502c:	00c0006f          	j	80005038 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005030:	ffffe097          	auipc	ra,0xffffe
    80005034:	988080e7          	jalr	-1656(ra) # 800029b8 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005038:	00008797          	auipc	a5,0x8
    8000503c:	1f87a783          	lw	a5,504(a5) # 8000d230 <_ZL9threadEnd>
    80005040:	02079e63          	bnez	a5,8000507c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005044:	0004a583          	lw	a1,0(s1)
    80005048:	0305859b          	addiw	a1,a1,48
    8000504c:	0084b503          	ld	a0,8(s1)
    80005050:	00001097          	auipc	ra,0x1
    80005054:	bac080e7          	jalr	-1108(ra) # 80005bfc <_ZN9BufferCPP3putEi>
        i++;
    80005058:	0019071b          	addiw	a4,s2,1
    8000505c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005060:	0004a683          	lw	a3,0(s1)
    80005064:	0026979b          	slliw	a5,a3,0x2
    80005068:	00d787bb          	addw	a5,a5,a3
    8000506c:	0017979b          	slliw	a5,a5,0x1
    80005070:	02f767bb          	remw	a5,a4,a5
    80005074:	fc0792e3          	bnez	a5,80005038 <_ZN12ProducerSync8producerEPv+0x2c>
    80005078:	fb9ff06f          	j	80005030 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    8000507c:	0104b503          	ld	a0,16(s1)
    80005080:	ffffe097          	auipc	ra,0xffffe
    80005084:	ad4080e7          	jalr	-1324(ra) # 80002b54 <_ZN9Semaphore6signalEv>
}
    80005088:	01813083          	ld	ra,24(sp)
    8000508c:	01013403          	ld	s0,16(sp)
    80005090:	00813483          	ld	s1,8(sp)
    80005094:	00013903          	ld	s2,0(sp)
    80005098:	02010113          	addi	sp,sp,32
    8000509c:	00008067          	ret

00000000800050a0 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    800050a0:	fd010113          	addi	sp,sp,-48
    800050a4:	02113423          	sd	ra,40(sp)
    800050a8:	02813023          	sd	s0,32(sp)
    800050ac:	00913c23          	sd	s1,24(sp)
    800050b0:	01213823          	sd	s2,16(sp)
    800050b4:	01313423          	sd	s3,8(sp)
    800050b8:	01413023          	sd	s4,0(sp)
    800050bc:	03010413          	addi	s0,sp,48
    800050c0:	00050993          	mv	s3,a0
    800050c4:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800050c8:	00000a13          	li	s4,0
    800050cc:	01c0006f          	j	800050e8 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800050d0:	ffffe097          	auipc	ra,0xffffe
    800050d4:	8e8080e7          	jalr	-1816(ra) # 800029b8 <_ZN6Thread8dispatchEv>
    800050d8:	0500006f          	j	80005128 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800050dc:	00a00513          	li	a0,10
    800050e0:	ffffc097          	auipc	ra,0xffffc
    800050e4:	548080e7          	jalr	1352(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    800050e8:	00008797          	auipc	a5,0x8
    800050ec:	1487a783          	lw	a5,328(a5) # 8000d230 <_ZL9threadEnd>
    800050f0:	06079263          	bnez	a5,80005154 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800050f4:	00893503          	ld	a0,8(s2)
    800050f8:	00001097          	auipc	ra,0x1
    800050fc:	b94080e7          	jalr	-1132(ra) # 80005c8c <_ZN9BufferCPP3getEv>
        i++;
    80005100:	001a049b          	addiw	s1,s4,1
    80005104:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005108:	0ff57513          	andi	a0,a0,255
    8000510c:	ffffc097          	auipc	ra,0xffffc
    80005110:	51c080e7          	jalr	1308(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005114:	00092703          	lw	a4,0(s2)
    80005118:	0027179b          	slliw	a5,a4,0x2
    8000511c:	00e787bb          	addw	a5,a5,a4
    80005120:	02f4e7bb          	remw	a5,s1,a5
    80005124:	fa0786e3          	beqz	a5,800050d0 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005128:	05000793          	li	a5,80
    8000512c:	02f4e4bb          	remw	s1,s1,a5
    80005130:	fa049ce3          	bnez	s1,800050e8 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005134:	fa9ff06f          	j	800050dc <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005138:	0209b783          	ld	a5,32(s3)
    8000513c:	0087b503          	ld	a0,8(a5)
    80005140:	00001097          	auipc	ra,0x1
    80005144:	b4c080e7          	jalr	-1204(ra) # 80005c8c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005148:	0ff57513          	andi	a0,a0,255
    8000514c:	ffffe097          	auipc	ra,0xffffe
    80005150:	adc080e7          	jalr	-1316(ra) # 80002c28 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005154:	0209b783          	ld	a5,32(s3)
    80005158:	0087b503          	ld	a0,8(a5)
    8000515c:	00001097          	auipc	ra,0x1
    80005160:	bbc080e7          	jalr	-1092(ra) # 80005d18 <_ZN9BufferCPP6getCntEv>
    80005164:	fca04ae3          	bgtz	a0,80005138 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005168:	01093503          	ld	a0,16(s2)
    8000516c:	ffffe097          	auipc	ra,0xffffe
    80005170:	9e8080e7          	jalr	-1560(ra) # 80002b54 <_ZN9Semaphore6signalEv>
}
    80005174:	02813083          	ld	ra,40(sp)
    80005178:	02013403          	ld	s0,32(sp)
    8000517c:	01813483          	ld	s1,24(sp)
    80005180:	01013903          	ld	s2,16(sp)
    80005184:	00813983          	ld	s3,8(sp)
    80005188:	00013a03          	ld	s4,0(sp)
    8000518c:	03010113          	addi	sp,sp,48
    80005190:	00008067          	ret

0000000080005194 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005194:	f8010113          	addi	sp,sp,-128
    80005198:	06113c23          	sd	ra,120(sp)
    8000519c:	06813823          	sd	s0,112(sp)
    800051a0:	06913423          	sd	s1,104(sp)
    800051a4:	07213023          	sd	s2,96(sp)
    800051a8:	05313c23          	sd	s3,88(sp)
    800051ac:	05413823          	sd	s4,80(sp)
    800051b0:	05513423          	sd	s5,72(sp)
    800051b4:	05613023          	sd	s6,64(sp)
    800051b8:	03713c23          	sd	s7,56(sp)
    800051bc:	03813823          	sd	s8,48(sp)
    800051c0:	03913423          	sd	s9,40(sp)
    800051c4:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800051c8:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800051cc:	00005517          	auipc	a0,0x5
    800051d0:	05c50513          	addi	a0,a0,92 # 8000a228 <CONSOLE_STATUS+0x218>
    800051d4:	00000097          	auipc	ra,0x0
    800051d8:	604080e7          	jalr	1540(ra) # 800057d8 <_Z11printStringPKc>
    getString(input, 30);
    800051dc:	01e00593          	li	a1,30
    800051e0:	f8040493          	addi	s1,s0,-128
    800051e4:	00048513          	mv	a0,s1
    800051e8:	00000097          	auipc	ra,0x0
    800051ec:	678080e7          	jalr	1656(ra) # 80005860 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800051f0:	00048513          	mv	a0,s1
    800051f4:	00000097          	auipc	ra,0x0
    800051f8:	744080e7          	jalr	1860(ra) # 80005938 <_Z11stringToIntPKc>
    800051fc:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005200:	00005517          	auipc	a0,0x5
    80005204:	04850513          	addi	a0,a0,72 # 8000a248 <CONSOLE_STATUS+0x238>
    80005208:	00000097          	auipc	ra,0x0
    8000520c:	5d0080e7          	jalr	1488(ra) # 800057d8 <_Z11printStringPKc>
    getString(input, 30);
    80005210:	01e00593          	li	a1,30
    80005214:	00048513          	mv	a0,s1
    80005218:	00000097          	auipc	ra,0x0
    8000521c:	648080e7          	jalr	1608(ra) # 80005860 <_Z9getStringPci>
    n = stringToInt(input);
    80005220:	00048513          	mv	a0,s1
    80005224:	00000097          	auipc	ra,0x0
    80005228:	714080e7          	jalr	1812(ra) # 80005938 <_Z11stringToIntPKc>
    8000522c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005230:	00005517          	auipc	a0,0x5
    80005234:	03850513          	addi	a0,a0,56 # 8000a268 <CONSOLE_STATUS+0x258>
    80005238:	00000097          	auipc	ra,0x0
    8000523c:	5a0080e7          	jalr	1440(ra) # 800057d8 <_Z11printStringPKc>
    80005240:	00000613          	li	a2,0
    80005244:	00a00593          	li	a1,10
    80005248:	00090513          	mv	a0,s2
    8000524c:	00000097          	auipc	ra,0x0
    80005250:	73c080e7          	jalr	1852(ra) # 80005988 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005254:	00005517          	auipc	a0,0x5
    80005258:	02c50513          	addi	a0,a0,44 # 8000a280 <CONSOLE_STATUS+0x270>
    8000525c:	00000097          	auipc	ra,0x0
    80005260:	57c080e7          	jalr	1404(ra) # 800057d8 <_Z11printStringPKc>
    80005264:	00000613          	li	a2,0
    80005268:	00a00593          	li	a1,10
    8000526c:	00048513          	mv	a0,s1
    80005270:	00000097          	auipc	ra,0x0
    80005274:	718080e7          	jalr	1816(ra) # 80005988 <_Z8printIntiii>
    printString(".\n");
    80005278:	00005517          	auipc	a0,0x5
    8000527c:	02050513          	addi	a0,a0,32 # 8000a298 <CONSOLE_STATUS+0x288>
    80005280:	00000097          	auipc	ra,0x0
    80005284:	558080e7          	jalr	1368(ra) # 800057d8 <_Z11printStringPKc>
    if(threadNum > n) {
    80005288:	0324c463          	blt	s1,s2,800052b0 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    8000528c:	03205c63          	blez	s2,800052c4 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005290:	03800513          	li	a0,56
    80005294:	ffffd097          	auipc	ra,0xffffd
    80005298:	4f0080e7          	jalr	1264(ra) # 80002784 <_Znwm>
    8000529c:	00050a93          	mv	s5,a0
    800052a0:	00048593          	mv	a1,s1
    800052a4:	00001097          	auipc	ra,0x1
    800052a8:	804080e7          	jalr	-2044(ra) # 80005aa8 <_ZN9BufferCPPC1Ei>
    800052ac:	0300006f          	j	800052dc <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800052b0:	00005517          	auipc	a0,0x5
    800052b4:	ff050513          	addi	a0,a0,-16 # 8000a2a0 <CONSOLE_STATUS+0x290>
    800052b8:	00000097          	auipc	ra,0x0
    800052bc:	520080e7          	jalr	1312(ra) # 800057d8 <_Z11printStringPKc>
        return;
    800052c0:	0140006f          	j	800052d4 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800052c4:	00005517          	auipc	a0,0x5
    800052c8:	01c50513          	addi	a0,a0,28 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800052cc:	00000097          	auipc	ra,0x0
    800052d0:	50c080e7          	jalr	1292(ra) # 800057d8 <_Z11printStringPKc>
        return;
    800052d4:	000b8113          	mv	sp,s7
    800052d8:	2380006f          	j	80005510 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800052dc:	01000513          	li	a0,16
    800052e0:	ffffd097          	auipc	ra,0xffffd
    800052e4:	4a4080e7          	jalr	1188(ra) # 80002784 <_Znwm>
    800052e8:	00050493          	mv	s1,a0
    800052ec:	00000593          	li	a1,0
    800052f0:	ffffe097          	auipc	ra,0xffffe
    800052f4:	800080e7          	jalr	-2048(ra) # 80002af0 <_ZN9SemaphoreC1Ej>
    800052f8:	00008797          	auipc	a5,0x8
    800052fc:	f497b023          	sd	s1,-192(a5) # 8000d238 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005300:	00391793          	slli	a5,s2,0x3
    80005304:	00f78793          	addi	a5,a5,15
    80005308:	ff07f793          	andi	a5,a5,-16
    8000530c:	40f10133          	sub	sp,sp,a5
    80005310:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005314:	0019071b          	addiw	a4,s2,1
    80005318:	00171793          	slli	a5,a4,0x1
    8000531c:	00e787b3          	add	a5,a5,a4
    80005320:	00379793          	slli	a5,a5,0x3
    80005324:	00f78793          	addi	a5,a5,15
    80005328:	ff07f793          	andi	a5,a5,-16
    8000532c:	40f10133          	sub	sp,sp,a5
    80005330:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005334:	00191c13          	slli	s8,s2,0x1
    80005338:	012c07b3          	add	a5,s8,s2
    8000533c:	00379793          	slli	a5,a5,0x3
    80005340:	00fa07b3          	add	a5,s4,a5
    80005344:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005348:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    8000534c:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005350:	02800513          	li	a0,40
    80005354:	ffffd097          	auipc	ra,0xffffd
    80005358:	430080e7          	jalr	1072(ra) # 80002784 <_Znwm>
    8000535c:	00050b13          	mv	s6,a0
    80005360:	012c0c33          	add	s8,s8,s2
    80005364:	003c1c13          	slli	s8,s8,0x3
    80005368:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    8000536c:	ffffd097          	auipc	ra,0xffffd
    80005370:	708080e7          	jalr	1800(ra) # 80002a74 <_ZN6ThreadC1Ev>
    80005374:	00008797          	auipc	a5,0x8
    80005378:	ba478793          	addi	a5,a5,-1116 # 8000cf18 <_ZTV12ConsumerSync+0x10>
    8000537c:	00fb3023          	sd	a5,0(s6)
    80005380:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005384:	000b0513          	mv	a0,s6
    80005388:	ffffd097          	auipc	ra,0xffffd
    8000538c:	5b4080e7          	jalr	1460(ra) # 8000293c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005390:	00000493          	li	s1,0
    80005394:	0380006f          	j	800053cc <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005398:	00008797          	auipc	a5,0x8
    8000539c:	b5878793          	addi	a5,a5,-1192 # 8000cef0 <_ZTV12ProducerSync+0x10>
    800053a0:	00fcb023          	sd	a5,0(s9)
    800053a4:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    800053a8:	00349793          	slli	a5,s1,0x3
    800053ac:	00f987b3          	add	a5,s3,a5
    800053b0:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800053b4:	00349793          	slli	a5,s1,0x3
    800053b8:	00f987b3          	add	a5,s3,a5
    800053bc:	0007b503          	ld	a0,0(a5)
    800053c0:	ffffd097          	auipc	ra,0xffffd
    800053c4:	57c080e7          	jalr	1404(ra) # 8000293c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800053c8:	0014849b          	addiw	s1,s1,1
    800053cc:	0b24d063          	bge	s1,s2,8000546c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800053d0:	00149793          	slli	a5,s1,0x1
    800053d4:	009787b3          	add	a5,a5,s1
    800053d8:	00379793          	slli	a5,a5,0x3
    800053dc:	00fa07b3          	add	a5,s4,a5
    800053e0:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800053e4:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800053e8:	00008717          	auipc	a4,0x8
    800053ec:	e5073703          	ld	a4,-432(a4) # 8000d238 <_ZL10waitForAll>
    800053f0:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800053f4:	02905863          	blez	s1,80005424 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800053f8:	02800513          	li	a0,40
    800053fc:	ffffd097          	auipc	ra,0xffffd
    80005400:	388080e7          	jalr	904(ra) # 80002784 <_Znwm>
    80005404:	00050c93          	mv	s9,a0
    80005408:	00149c13          	slli	s8,s1,0x1
    8000540c:	009c0c33          	add	s8,s8,s1
    80005410:	003c1c13          	slli	s8,s8,0x3
    80005414:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005418:	ffffd097          	auipc	ra,0xffffd
    8000541c:	65c080e7          	jalr	1628(ra) # 80002a74 <_ZN6ThreadC1Ev>
    80005420:	f79ff06f          	j	80005398 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005424:	02800513          	li	a0,40
    80005428:	ffffd097          	auipc	ra,0xffffd
    8000542c:	35c080e7          	jalr	860(ra) # 80002784 <_Znwm>
    80005430:	00050c93          	mv	s9,a0
    80005434:	00149c13          	slli	s8,s1,0x1
    80005438:	009c0c33          	add	s8,s8,s1
    8000543c:	003c1c13          	slli	s8,s8,0x3
    80005440:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005444:	ffffd097          	auipc	ra,0xffffd
    80005448:	630080e7          	jalr	1584(ra) # 80002a74 <_ZN6ThreadC1Ev>
    8000544c:	00008797          	auipc	a5,0x8
    80005450:	a7c78793          	addi	a5,a5,-1412 # 8000cec8 <_ZTV16ProducerKeyboard+0x10>
    80005454:	00fcb023          	sd	a5,0(s9)
    80005458:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    8000545c:	00349793          	slli	a5,s1,0x3
    80005460:	00f987b3          	add	a5,s3,a5
    80005464:	0197b023          	sd	s9,0(a5)
    80005468:	f4dff06f          	j	800053b4 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    8000546c:	ffffd097          	auipc	ra,0xffffd
    80005470:	54c080e7          	jalr	1356(ra) # 800029b8 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005474:	00000493          	li	s1,0
    80005478:	00994e63          	blt	s2,s1,80005494 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    8000547c:	00008517          	auipc	a0,0x8
    80005480:	dbc53503          	ld	a0,-580(a0) # 8000d238 <_ZL10waitForAll>
    80005484:	ffffd097          	auipc	ra,0xffffd
    80005488:	6a4080e7          	jalr	1700(ra) # 80002b28 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000548c:	0014849b          	addiw	s1,s1,1
    80005490:	fe9ff06f          	j	80005478 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005494:	00000493          	li	s1,0
    80005498:	0080006f          	j	800054a0 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    8000549c:	0014849b          	addiw	s1,s1,1
    800054a0:	0324d263          	bge	s1,s2,800054c4 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    800054a4:	00349793          	slli	a5,s1,0x3
    800054a8:	00f987b3          	add	a5,s3,a5
    800054ac:	0007b503          	ld	a0,0(a5)
    800054b0:	fe0506e3          	beqz	a0,8000549c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800054b4:	00053783          	ld	a5,0(a0)
    800054b8:	0087b783          	ld	a5,8(a5)
    800054bc:	000780e7          	jalr	a5
    800054c0:	fddff06f          	j	8000549c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800054c4:	000b0a63          	beqz	s6,800054d8 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800054c8:	000b3783          	ld	a5,0(s6)
    800054cc:	0087b783          	ld	a5,8(a5)
    800054d0:	000b0513          	mv	a0,s6
    800054d4:	000780e7          	jalr	a5
    delete waitForAll;
    800054d8:	00008517          	auipc	a0,0x8
    800054dc:	d6053503          	ld	a0,-672(a0) # 8000d238 <_ZL10waitForAll>
    800054e0:	00050863          	beqz	a0,800054f0 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800054e4:	00053783          	ld	a5,0(a0)
    800054e8:	0087b783          	ld	a5,8(a5)
    800054ec:	000780e7          	jalr	a5
    delete buffer;
    800054f0:	000a8e63          	beqz	s5,8000550c <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800054f4:	000a8513          	mv	a0,s5
    800054f8:	00001097          	auipc	ra,0x1
    800054fc:	8a8080e7          	jalr	-1880(ra) # 80005da0 <_ZN9BufferCPPD1Ev>
    80005500:	000a8513          	mv	a0,s5
    80005504:	ffffd097          	auipc	ra,0xffffd
    80005508:	2d0080e7          	jalr	720(ra) # 800027d4 <_ZdlPv>
    8000550c:	000b8113          	mv	sp,s7

}
    80005510:	f8040113          	addi	sp,s0,-128
    80005514:	07813083          	ld	ra,120(sp)
    80005518:	07013403          	ld	s0,112(sp)
    8000551c:	06813483          	ld	s1,104(sp)
    80005520:	06013903          	ld	s2,96(sp)
    80005524:	05813983          	ld	s3,88(sp)
    80005528:	05013a03          	ld	s4,80(sp)
    8000552c:	04813a83          	ld	s5,72(sp)
    80005530:	04013b03          	ld	s6,64(sp)
    80005534:	03813b83          	ld	s7,56(sp)
    80005538:	03013c03          	ld	s8,48(sp)
    8000553c:	02813c83          	ld	s9,40(sp)
    80005540:	08010113          	addi	sp,sp,128
    80005544:	00008067          	ret
    80005548:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000554c:	000a8513          	mv	a0,s5
    80005550:	ffffd097          	auipc	ra,0xffffd
    80005554:	284080e7          	jalr	644(ra) # 800027d4 <_ZdlPv>
    80005558:	00048513          	mv	a0,s1
    8000555c:	00009097          	auipc	ra,0x9
    80005560:	dec080e7          	jalr	-532(ra) # 8000e348 <_Unwind_Resume>
    80005564:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005568:	00048513          	mv	a0,s1
    8000556c:	ffffd097          	auipc	ra,0xffffd
    80005570:	268080e7          	jalr	616(ra) # 800027d4 <_ZdlPv>
    80005574:	00090513          	mv	a0,s2
    80005578:	00009097          	auipc	ra,0x9
    8000557c:	dd0080e7          	jalr	-560(ra) # 8000e348 <_Unwind_Resume>
    80005580:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005584:	000b0513          	mv	a0,s6
    80005588:	ffffd097          	auipc	ra,0xffffd
    8000558c:	24c080e7          	jalr	588(ra) # 800027d4 <_ZdlPv>
    80005590:	00048513          	mv	a0,s1
    80005594:	00009097          	auipc	ra,0x9
    80005598:	db4080e7          	jalr	-588(ra) # 8000e348 <_Unwind_Resume>
    8000559c:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    800055a0:	000c8513          	mv	a0,s9
    800055a4:	ffffd097          	auipc	ra,0xffffd
    800055a8:	230080e7          	jalr	560(ra) # 800027d4 <_ZdlPv>
    800055ac:	00048513          	mv	a0,s1
    800055b0:	00009097          	auipc	ra,0x9
    800055b4:	d98080e7          	jalr	-616(ra) # 8000e348 <_Unwind_Resume>
    800055b8:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800055bc:	000c8513          	mv	a0,s9
    800055c0:	ffffd097          	auipc	ra,0xffffd
    800055c4:	214080e7          	jalr	532(ra) # 800027d4 <_ZdlPv>
    800055c8:	00048513          	mv	a0,s1
    800055cc:	00009097          	auipc	ra,0x9
    800055d0:	d7c080e7          	jalr	-644(ra) # 8000e348 <_Unwind_Resume>

00000000800055d4 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800055d4:	ff010113          	addi	sp,sp,-16
    800055d8:	00113423          	sd	ra,8(sp)
    800055dc:	00813023          	sd	s0,0(sp)
    800055e0:	01010413          	addi	s0,sp,16
    800055e4:	00008797          	auipc	a5,0x8
    800055e8:	93478793          	addi	a5,a5,-1740 # 8000cf18 <_ZTV12ConsumerSync+0x10>
    800055ec:	00f53023          	sd	a5,0(a0)
    800055f0:	ffffd097          	auipc	ra,0xffffd
    800055f4:	0e0080e7          	jalr	224(ra) # 800026d0 <_ZN6ThreadD1Ev>
    800055f8:	00813083          	ld	ra,8(sp)
    800055fc:	00013403          	ld	s0,0(sp)
    80005600:	01010113          	addi	sp,sp,16
    80005604:	00008067          	ret

0000000080005608 <_ZN12ConsumerSyncD0Ev>:
    80005608:	fe010113          	addi	sp,sp,-32
    8000560c:	00113c23          	sd	ra,24(sp)
    80005610:	00813823          	sd	s0,16(sp)
    80005614:	00913423          	sd	s1,8(sp)
    80005618:	02010413          	addi	s0,sp,32
    8000561c:	00050493          	mv	s1,a0
    80005620:	00008797          	auipc	a5,0x8
    80005624:	8f878793          	addi	a5,a5,-1800 # 8000cf18 <_ZTV12ConsumerSync+0x10>
    80005628:	00f53023          	sd	a5,0(a0)
    8000562c:	ffffd097          	auipc	ra,0xffffd
    80005630:	0a4080e7          	jalr	164(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80005634:	00048513          	mv	a0,s1
    80005638:	ffffd097          	auipc	ra,0xffffd
    8000563c:	19c080e7          	jalr	412(ra) # 800027d4 <_ZdlPv>
    80005640:	01813083          	ld	ra,24(sp)
    80005644:	01013403          	ld	s0,16(sp)
    80005648:	00813483          	ld	s1,8(sp)
    8000564c:	02010113          	addi	sp,sp,32
    80005650:	00008067          	ret

0000000080005654 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005654:	ff010113          	addi	sp,sp,-16
    80005658:	00113423          	sd	ra,8(sp)
    8000565c:	00813023          	sd	s0,0(sp)
    80005660:	01010413          	addi	s0,sp,16
    80005664:	00008797          	auipc	a5,0x8
    80005668:	88c78793          	addi	a5,a5,-1908 # 8000cef0 <_ZTV12ProducerSync+0x10>
    8000566c:	00f53023          	sd	a5,0(a0)
    80005670:	ffffd097          	auipc	ra,0xffffd
    80005674:	060080e7          	jalr	96(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80005678:	00813083          	ld	ra,8(sp)
    8000567c:	00013403          	ld	s0,0(sp)
    80005680:	01010113          	addi	sp,sp,16
    80005684:	00008067          	ret

0000000080005688 <_ZN12ProducerSyncD0Ev>:
    80005688:	fe010113          	addi	sp,sp,-32
    8000568c:	00113c23          	sd	ra,24(sp)
    80005690:	00813823          	sd	s0,16(sp)
    80005694:	00913423          	sd	s1,8(sp)
    80005698:	02010413          	addi	s0,sp,32
    8000569c:	00050493          	mv	s1,a0
    800056a0:	00008797          	auipc	a5,0x8
    800056a4:	85078793          	addi	a5,a5,-1968 # 8000cef0 <_ZTV12ProducerSync+0x10>
    800056a8:	00f53023          	sd	a5,0(a0)
    800056ac:	ffffd097          	auipc	ra,0xffffd
    800056b0:	024080e7          	jalr	36(ra) # 800026d0 <_ZN6ThreadD1Ev>
    800056b4:	00048513          	mv	a0,s1
    800056b8:	ffffd097          	auipc	ra,0xffffd
    800056bc:	11c080e7          	jalr	284(ra) # 800027d4 <_ZdlPv>
    800056c0:	01813083          	ld	ra,24(sp)
    800056c4:	01013403          	ld	s0,16(sp)
    800056c8:	00813483          	ld	s1,8(sp)
    800056cc:	02010113          	addi	sp,sp,32
    800056d0:	00008067          	ret

00000000800056d4 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800056d4:	ff010113          	addi	sp,sp,-16
    800056d8:	00113423          	sd	ra,8(sp)
    800056dc:	00813023          	sd	s0,0(sp)
    800056e0:	01010413          	addi	s0,sp,16
    800056e4:	00007797          	auipc	a5,0x7
    800056e8:	7e478793          	addi	a5,a5,2020 # 8000cec8 <_ZTV16ProducerKeyboard+0x10>
    800056ec:	00f53023          	sd	a5,0(a0)
    800056f0:	ffffd097          	auipc	ra,0xffffd
    800056f4:	fe0080e7          	jalr	-32(ra) # 800026d0 <_ZN6ThreadD1Ev>
    800056f8:	00813083          	ld	ra,8(sp)
    800056fc:	00013403          	ld	s0,0(sp)
    80005700:	01010113          	addi	sp,sp,16
    80005704:	00008067          	ret

0000000080005708 <_ZN16ProducerKeyboardD0Ev>:
    80005708:	fe010113          	addi	sp,sp,-32
    8000570c:	00113c23          	sd	ra,24(sp)
    80005710:	00813823          	sd	s0,16(sp)
    80005714:	00913423          	sd	s1,8(sp)
    80005718:	02010413          	addi	s0,sp,32
    8000571c:	00050493          	mv	s1,a0
    80005720:	00007797          	auipc	a5,0x7
    80005724:	7a878793          	addi	a5,a5,1960 # 8000cec8 <_ZTV16ProducerKeyboard+0x10>
    80005728:	00f53023          	sd	a5,0(a0)
    8000572c:	ffffd097          	auipc	ra,0xffffd
    80005730:	fa4080e7          	jalr	-92(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80005734:	00048513          	mv	a0,s1
    80005738:	ffffd097          	auipc	ra,0xffffd
    8000573c:	09c080e7          	jalr	156(ra) # 800027d4 <_ZdlPv>
    80005740:	01813083          	ld	ra,24(sp)
    80005744:	01013403          	ld	s0,16(sp)
    80005748:	00813483          	ld	s1,8(sp)
    8000574c:	02010113          	addi	sp,sp,32
    80005750:	00008067          	ret

0000000080005754 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005754:	ff010113          	addi	sp,sp,-16
    80005758:	00113423          	sd	ra,8(sp)
    8000575c:	00813023          	sd	s0,0(sp)
    80005760:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005764:	02053583          	ld	a1,32(a0)
    80005768:	fffff097          	auipc	ra,0xfffff
    8000576c:	7e4080e7          	jalr	2020(ra) # 80004f4c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005770:	00813083          	ld	ra,8(sp)
    80005774:	00013403          	ld	s0,0(sp)
    80005778:	01010113          	addi	sp,sp,16
    8000577c:	00008067          	ret

0000000080005780 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005780:	ff010113          	addi	sp,sp,-16
    80005784:	00113423          	sd	ra,8(sp)
    80005788:	00813023          	sd	s0,0(sp)
    8000578c:	01010413          	addi	s0,sp,16
        producer(td);
    80005790:	02053583          	ld	a1,32(a0)
    80005794:	00000097          	auipc	ra,0x0
    80005798:	878080e7          	jalr	-1928(ra) # 8000500c <_ZN12ProducerSync8producerEPv>
    }
    8000579c:	00813083          	ld	ra,8(sp)
    800057a0:	00013403          	ld	s0,0(sp)
    800057a4:	01010113          	addi	sp,sp,16
    800057a8:	00008067          	ret

00000000800057ac <_ZN12ConsumerSync3runEv>:
    void run() override {
    800057ac:	ff010113          	addi	sp,sp,-16
    800057b0:	00113423          	sd	ra,8(sp)
    800057b4:	00813023          	sd	s0,0(sp)
    800057b8:	01010413          	addi	s0,sp,16
        consumer(td);
    800057bc:	02053583          	ld	a1,32(a0)
    800057c0:	00000097          	auipc	ra,0x0
    800057c4:	8e0080e7          	jalr	-1824(ra) # 800050a0 <_ZN12ConsumerSync8consumerEPv>
    }
    800057c8:	00813083          	ld	ra,8(sp)
    800057cc:	00013403          	ld	s0,0(sp)
    800057d0:	01010113          	addi	sp,sp,16
    800057d4:	00008067          	ret

00000000800057d8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800057d8:	fe010113          	addi	sp,sp,-32
    800057dc:	00113c23          	sd	ra,24(sp)
    800057e0:	00813823          	sd	s0,16(sp)
    800057e4:	00913423          	sd	s1,8(sp)
    800057e8:	02010413          	addi	s0,sp,32
    800057ec:	00050493          	mv	s1,a0
    LOCK();
    800057f0:	00100613          	li	a2,1
    800057f4:	00000593          	li	a1,0
    800057f8:	00008517          	auipc	a0,0x8
    800057fc:	a4850513          	addi	a0,a0,-1464 # 8000d240 <lockPrint>
    80005800:	ffffc097          	auipc	ra,0xffffc
    80005804:	924080e7          	jalr	-1756(ra) # 80001124 <copy_and_swap>
    80005808:	00050863          	beqz	a0,80005818 <_Z11printStringPKc+0x40>
    8000580c:	ffffc097          	auipc	ra,0xffffc
    80005810:	cb4080e7          	jalr	-844(ra) # 800014c0 <_Z15thread_dispatchv>
    80005814:	fddff06f          	j	800057f0 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005818:	0004c503          	lbu	a0,0(s1)
    8000581c:	00050a63          	beqz	a0,80005830 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005820:	ffffc097          	auipc	ra,0xffffc
    80005824:	e08080e7          	jalr	-504(ra) # 80001628 <_Z4putcc>
        string++;
    80005828:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    8000582c:	fedff06f          	j	80005818 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005830:	00000613          	li	a2,0
    80005834:	00100593          	li	a1,1
    80005838:	00008517          	auipc	a0,0x8
    8000583c:	a0850513          	addi	a0,a0,-1528 # 8000d240 <lockPrint>
    80005840:	ffffc097          	auipc	ra,0xffffc
    80005844:	8e4080e7          	jalr	-1820(ra) # 80001124 <copy_and_swap>
    80005848:	fe0514e3          	bnez	a0,80005830 <_Z11printStringPKc+0x58>
}
    8000584c:	01813083          	ld	ra,24(sp)
    80005850:	01013403          	ld	s0,16(sp)
    80005854:	00813483          	ld	s1,8(sp)
    80005858:	02010113          	addi	sp,sp,32
    8000585c:	00008067          	ret

0000000080005860 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005860:	fd010113          	addi	sp,sp,-48
    80005864:	02113423          	sd	ra,40(sp)
    80005868:	02813023          	sd	s0,32(sp)
    8000586c:	00913c23          	sd	s1,24(sp)
    80005870:	01213823          	sd	s2,16(sp)
    80005874:	01313423          	sd	s3,8(sp)
    80005878:	01413023          	sd	s4,0(sp)
    8000587c:	03010413          	addi	s0,sp,48
    80005880:	00050993          	mv	s3,a0
    80005884:	00058a13          	mv	s4,a1
    LOCK();
    80005888:	00100613          	li	a2,1
    8000588c:	00000593          	li	a1,0
    80005890:	00008517          	auipc	a0,0x8
    80005894:	9b050513          	addi	a0,a0,-1616 # 8000d240 <lockPrint>
    80005898:	ffffc097          	auipc	ra,0xffffc
    8000589c:	88c080e7          	jalr	-1908(ra) # 80001124 <copy_and_swap>
    800058a0:	00050863          	beqz	a0,800058b0 <_Z9getStringPci+0x50>
    800058a4:	ffffc097          	auipc	ra,0xffffc
    800058a8:	c1c080e7          	jalr	-996(ra) # 800014c0 <_Z15thread_dispatchv>
    800058ac:	fddff06f          	j	80005888 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800058b0:	00000913          	li	s2,0
    800058b4:	00090493          	mv	s1,s2
    800058b8:	0019091b          	addiw	s2,s2,1
    800058bc:	03495a63          	bge	s2,s4,800058f0 <_Z9getStringPci+0x90>
        cc = getc();
    800058c0:	ffffc097          	auipc	ra,0xffffc
    800058c4:	d40080e7          	jalr	-704(ra) # 80001600 <_Z4getcv>
        if(cc < 1)
    800058c8:	02050463          	beqz	a0,800058f0 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    800058cc:	009984b3          	add	s1,s3,s1
    800058d0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800058d4:	00a00793          	li	a5,10
    800058d8:	00f50a63          	beq	a0,a5,800058ec <_Z9getStringPci+0x8c>
    800058dc:	00d00793          	li	a5,13
    800058e0:	fcf51ae3          	bne	a0,a5,800058b4 <_Z9getStringPci+0x54>
        buf[i++] = c;
    800058e4:	00090493          	mv	s1,s2
    800058e8:	0080006f          	j	800058f0 <_Z9getStringPci+0x90>
    800058ec:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800058f0:	009984b3          	add	s1,s3,s1
    800058f4:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800058f8:	00000613          	li	a2,0
    800058fc:	00100593          	li	a1,1
    80005900:	00008517          	auipc	a0,0x8
    80005904:	94050513          	addi	a0,a0,-1728 # 8000d240 <lockPrint>
    80005908:	ffffc097          	auipc	ra,0xffffc
    8000590c:	81c080e7          	jalr	-2020(ra) # 80001124 <copy_and_swap>
    80005910:	fe0514e3          	bnez	a0,800058f8 <_Z9getStringPci+0x98>
    return buf;
}
    80005914:	00098513          	mv	a0,s3
    80005918:	02813083          	ld	ra,40(sp)
    8000591c:	02013403          	ld	s0,32(sp)
    80005920:	01813483          	ld	s1,24(sp)
    80005924:	01013903          	ld	s2,16(sp)
    80005928:	00813983          	ld	s3,8(sp)
    8000592c:	00013a03          	ld	s4,0(sp)
    80005930:	03010113          	addi	sp,sp,48
    80005934:	00008067          	ret

0000000080005938 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005938:	ff010113          	addi	sp,sp,-16
    8000593c:	00813423          	sd	s0,8(sp)
    80005940:	01010413          	addi	s0,sp,16
    80005944:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005948:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    8000594c:	0006c603          	lbu	a2,0(a3)
    80005950:	fd06071b          	addiw	a4,a2,-48
    80005954:	0ff77713          	andi	a4,a4,255
    80005958:	00900793          	li	a5,9
    8000595c:	02e7e063          	bltu	a5,a4,8000597c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005960:	0025179b          	slliw	a5,a0,0x2
    80005964:	00a787bb          	addw	a5,a5,a0
    80005968:	0017979b          	slliw	a5,a5,0x1
    8000596c:	00168693          	addi	a3,a3,1
    80005970:	00c787bb          	addw	a5,a5,a2
    80005974:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005978:	fd5ff06f          	j	8000594c <_Z11stringToIntPKc+0x14>
    return n;
}
    8000597c:	00813403          	ld	s0,8(sp)
    80005980:	01010113          	addi	sp,sp,16
    80005984:	00008067          	ret

0000000080005988 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005988:	fc010113          	addi	sp,sp,-64
    8000598c:	02113c23          	sd	ra,56(sp)
    80005990:	02813823          	sd	s0,48(sp)
    80005994:	02913423          	sd	s1,40(sp)
    80005998:	03213023          	sd	s2,32(sp)
    8000599c:	01313c23          	sd	s3,24(sp)
    800059a0:	04010413          	addi	s0,sp,64
    800059a4:	00050493          	mv	s1,a0
    800059a8:	00058913          	mv	s2,a1
    800059ac:	00060993          	mv	s3,a2
    LOCK();
    800059b0:	00100613          	li	a2,1
    800059b4:	00000593          	li	a1,0
    800059b8:	00008517          	auipc	a0,0x8
    800059bc:	88850513          	addi	a0,a0,-1912 # 8000d240 <lockPrint>
    800059c0:	ffffb097          	auipc	ra,0xffffb
    800059c4:	764080e7          	jalr	1892(ra) # 80001124 <copy_and_swap>
    800059c8:	00050863          	beqz	a0,800059d8 <_Z8printIntiii+0x50>
    800059cc:	ffffc097          	auipc	ra,0xffffc
    800059d0:	af4080e7          	jalr	-1292(ra) # 800014c0 <_Z15thread_dispatchv>
    800059d4:	fddff06f          	j	800059b0 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800059d8:	00098463          	beqz	s3,800059e0 <_Z8printIntiii+0x58>
    800059dc:	0804c463          	bltz	s1,80005a64 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800059e0:	0004851b          	sext.w	a0,s1
    neg = 0;
    800059e4:	00000593          	li	a1,0
    }

    i = 0;
    800059e8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800059ec:	0009079b          	sext.w	a5,s2
    800059f0:	0325773b          	remuw	a4,a0,s2
    800059f4:	00048613          	mv	a2,s1
    800059f8:	0014849b          	addiw	s1,s1,1
    800059fc:	02071693          	slli	a3,a4,0x20
    80005a00:	0206d693          	srli	a3,a3,0x20
    80005a04:	00007717          	auipc	a4,0x7
    80005a08:	52c70713          	addi	a4,a4,1324 # 8000cf30 <digits>
    80005a0c:	00d70733          	add	a4,a4,a3
    80005a10:	00074683          	lbu	a3,0(a4)
    80005a14:	fd040713          	addi	a4,s0,-48
    80005a18:	00c70733          	add	a4,a4,a2
    80005a1c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005a20:	0005071b          	sext.w	a4,a0
    80005a24:	0325553b          	divuw	a0,a0,s2
    80005a28:	fcf772e3          	bgeu	a4,a5,800059ec <_Z8printIntiii+0x64>
    if(neg)
    80005a2c:	00058c63          	beqz	a1,80005a44 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005a30:	fd040793          	addi	a5,s0,-48
    80005a34:	009784b3          	add	s1,a5,s1
    80005a38:	02d00793          	li	a5,45
    80005a3c:	fef48823          	sb	a5,-16(s1)
    80005a40:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005a44:	fff4849b          	addiw	s1,s1,-1
    80005a48:	0204c463          	bltz	s1,80005a70 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005a4c:	fd040793          	addi	a5,s0,-48
    80005a50:	009787b3          	add	a5,a5,s1
    80005a54:	ff07c503          	lbu	a0,-16(a5)
    80005a58:	ffffc097          	auipc	ra,0xffffc
    80005a5c:	bd0080e7          	jalr	-1072(ra) # 80001628 <_Z4putcc>
    80005a60:	fe5ff06f          	j	80005a44 <_Z8printIntiii+0xbc>
        x = -xx;
    80005a64:	4090053b          	negw	a0,s1
        neg = 1;
    80005a68:	00100593          	li	a1,1
        x = -xx;
    80005a6c:	f7dff06f          	j	800059e8 <_Z8printIntiii+0x60>

    UNLOCK();
    80005a70:	00000613          	li	a2,0
    80005a74:	00100593          	li	a1,1
    80005a78:	00007517          	auipc	a0,0x7
    80005a7c:	7c850513          	addi	a0,a0,1992 # 8000d240 <lockPrint>
    80005a80:	ffffb097          	auipc	ra,0xffffb
    80005a84:	6a4080e7          	jalr	1700(ra) # 80001124 <copy_and_swap>
    80005a88:	fe0514e3          	bnez	a0,80005a70 <_Z8printIntiii+0xe8>
    80005a8c:	03813083          	ld	ra,56(sp)
    80005a90:	03013403          	ld	s0,48(sp)
    80005a94:	02813483          	ld	s1,40(sp)
    80005a98:	02013903          	ld	s2,32(sp)
    80005a9c:	01813983          	ld	s3,24(sp)
    80005aa0:	04010113          	addi	sp,sp,64
    80005aa4:	00008067          	ret

0000000080005aa8 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005aa8:	fd010113          	addi	sp,sp,-48
    80005aac:	02113423          	sd	ra,40(sp)
    80005ab0:	02813023          	sd	s0,32(sp)
    80005ab4:	00913c23          	sd	s1,24(sp)
    80005ab8:	01213823          	sd	s2,16(sp)
    80005abc:	01313423          	sd	s3,8(sp)
    80005ac0:	03010413          	addi	s0,sp,48
    80005ac4:	00050493          	mv	s1,a0
    80005ac8:	00058913          	mv	s2,a1
    80005acc:	0015879b          	addiw	a5,a1,1
    80005ad0:	0007851b          	sext.w	a0,a5
    80005ad4:	00f4a023          	sw	a5,0(s1)
    80005ad8:	0004a823          	sw	zero,16(s1)
    80005adc:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005ae0:	00251513          	slli	a0,a0,0x2
    80005ae4:	ffffc097          	auipc	ra,0xffffc
    80005ae8:	8b0080e7          	jalr	-1872(ra) # 80001394 <_Z9mem_allocm>
    80005aec:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005af0:	01000513          	li	a0,16
    80005af4:	ffffd097          	auipc	ra,0xffffd
    80005af8:	c90080e7          	jalr	-880(ra) # 80002784 <_Znwm>
    80005afc:	00050993          	mv	s3,a0
    80005b00:	00000593          	li	a1,0
    80005b04:	ffffd097          	auipc	ra,0xffffd
    80005b08:	fec080e7          	jalr	-20(ra) # 80002af0 <_ZN9SemaphoreC1Ej>
    80005b0c:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005b10:	01000513          	li	a0,16
    80005b14:	ffffd097          	auipc	ra,0xffffd
    80005b18:	c70080e7          	jalr	-912(ra) # 80002784 <_Znwm>
    80005b1c:	00050993          	mv	s3,a0
    80005b20:	00090593          	mv	a1,s2
    80005b24:	ffffd097          	auipc	ra,0xffffd
    80005b28:	fcc080e7          	jalr	-52(ra) # 80002af0 <_ZN9SemaphoreC1Ej>
    80005b2c:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005b30:	01000513          	li	a0,16
    80005b34:	ffffd097          	auipc	ra,0xffffd
    80005b38:	c50080e7          	jalr	-944(ra) # 80002784 <_Znwm>
    80005b3c:	00050913          	mv	s2,a0
    80005b40:	00100593          	li	a1,1
    80005b44:	ffffd097          	auipc	ra,0xffffd
    80005b48:	fac080e7          	jalr	-84(ra) # 80002af0 <_ZN9SemaphoreC1Ej>
    80005b4c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005b50:	01000513          	li	a0,16
    80005b54:	ffffd097          	auipc	ra,0xffffd
    80005b58:	c30080e7          	jalr	-976(ra) # 80002784 <_Znwm>
    80005b5c:	00050913          	mv	s2,a0
    80005b60:	00100593          	li	a1,1
    80005b64:	ffffd097          	auipc	ra,0xffffd
    80005b68:	f8c080e7          	jalr	-116(ra) # 80002af0 <_ZN9SemaphoreC1Ej>
    80005b6c:	0324b823          	sd	s2,48(s1)
}
    80005b70:	02813083          	ld	ra,40(sp)
    80005b74:	02013403          	ld	s0,32(sp)
    80005b78:	01813483          	ld	s1,24(sp)
    80005b7c:	01013903          	ld	s2,16(sp)
    80005b80:	00813983          	ld	s3,8(sp)
    80005b84:	03010113          	addi	sp,sp,48
    80005b88:	00008067          	ret
    80005b8c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005b90:	00098513          	mv	a0,s3
    80005b94:	ffffd097          	auipc	ra,0xffffd
    80005b98:	c40080e7          	jalr	-960(ra) # 800027d4 <_ZdlPv>
    80005b9c:	00048513          	mv	a0,s1
    80005ba0:	00008097          	auipc	ra,0x8
    80005ba4:	7a8080e7          	jalr	1960(ra) # 8000e348 <_Unwind_Resume>
    80005ba8:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005bac:	00098513          	mv	a0,s3
    80005bb0:	ffffd097          	auipc	ra,0xffffd
    80005bb4:	c24080e7          	jalr	-988(ra) # 800027d4 <_ZdlPv>
    80005bb8:	00048513          	mv	a0,s1
    80005bbc:	00008097          	auipc	ra,0x8
    80005bc0:	78c080e7          	jalr	1932(ra) # 8000e348 <_Unwind_Resume>
    80005bc4:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005bc8:	00090513          	mv	a0,s2
    80005bcc:	ffffd097          	auipc	ra,0xffffd
    80005bd0:	c08080e7          	jalr	-1016(ra) # 800027d4 <_ZdlPv>
    80005bd4:	00048513          	mv	a0,s1
    80005bd8:	00008097          	auipc	ra,0x8
    80005bdc:	770080e7          	jalr	1904(ra) # 8000e348 <_Unwind_Resume>
    80005be0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005be4:	00090513          	mv	a0,s2
    80005be8:	ffffd097          	auipc	ra,0xffffd
    80005bec:	bec080e7          	jalr	-1044(ra) # 800027d4 <_ZdlPv>
    80005bf0:	00048513          	mv	a0,s1
    80005bf4:	00008097          	auipc	ra,0x8
    80005bf8:	754080e7          	jalr	1876(ra) # 8000e348 <_Unwind_Resume>

0000000080005bfc <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005bfc:	fe010113          	addi	sp,sp,-32
    80005c00:	00113c23          	sd	ra,24(sp)
    80005c04:	00813823          	sd	s0,16(sp)
    80005c08:	00913423          	sd	s1,8(sp)
    80005c0c:	01213023          	sd	s2,0(sp)
    80005c10:	02010413          	addi	s0,sp,32
    80005c14:	00050493          	mv	s1,a0
    80005c18:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005c1c:	01853503          	ld	a0,24(a0)
    80005c20:	ffffd097          	auipc	ra,0xffffd
    80005c24:	f08080e7          	jalr	-248(ra) # 80002b28 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005c28:	0304b503          	ld	a0,48(s1)
    80005c2c:	ffffd097          	auipc	ra,0xffffd
    80005c30:	efc080e7          	jalr	-260(ra) # 80002b28 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005c34:	0084b783          	ld	a5,8(s1)
    80005c38:	0144a703          	lw	a4,20(s1)
    80005c3c:	00271713          	slli	a4,a4,0x2
    80005c40:	00e787b3          	add	a5,a5,a4
    80005c44:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005c48:	0144a783          	lw	a5,20(s1)
    80005c4c:	0017879b          	addiw	a5,a5,1
    80005c50:	0004a703          	lw	a4,0(s1)
    80005c54:	02e7e7bb          	remw	a5,a5,a4
    80005c58:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005c5c:	0304b503          	ld	a0,48(s1)
    80005c60:	ffffd097          	auipc	ra,0xffffd
    80005c64:	ef4080e7          	jalr	-268(ra) # 80002b54 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005c68:	0204b503          	ld	a0,32(s1)
    80005c6c:	ffffd097          	auipc	ra,0xffffd
    80005c70:	ee8080e7          	jalr	-280(ra) # 80002b54 <_ZN9Semaphore6signalEv>

}
    80005c74:	01813083          	ld	ra,24(sp)
    80005c78:	01013403          	ld	s0,16(sp)
    80005c7c:	00813483          	ld	s1,8(sp)
    80005c80:	00013903          	ld	s2,0(sp)
    80005c84:	02010113          	addi	sp,sp,32
    80005c88:	00008067          	ret

0000000080005c8c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005c8c:	fe010113          	addi	sp,sp,-32
    80005c90:	00113c23          	sd	ra,24(sp)
    80005c94:	00813823          	sd	s0,16(sp)
    80005c98:	00913423          	sd	s1,8(sp)
    80005c9c:	01213023          	sd	s2,0(sp)
    80005ca0:	02010413          	addi	s0,sp,32
    80005ca4:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005ca8:	02053503          	ld	a0,32(a0)
    80005cac:	ffffd097          	auipc	ra,0xffffd
    80005cb0:	e7c080e7          	jalr	-388(ra) # 80002b28 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005cb4:	0284b503          	ld	a0,40(s1)
    80005cb8:	ffffd097          	auipc	ra,0xffffd
    80005cbc:	e70080e7          	jalr	-400(ra) # 80002b28 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005cc0:	0084b703          	ld	a4,8(s1)
    80005cc4:	0104a783          	lw	a5,16(s1)
    80005cc8:	00279693          	slli	a3,a5,0x2
    80005ccc:	00d70733          	add	a4,a4,a3
    80005cd0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005cd4:	0017879b          	addiw	a5,a5,1
    80005cd8:	0004a703          	lw	a4,0(s1)
    80005cdc:	02e7e7bb          	remw	a5,a5,a4
    80005ce0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005ce4:	0284b503          	ld	a0,40(s1)
    80005ce8:	ffffd097          	auipc	ra,0xffffd
    80005cec:	e6c080e7          	jalr	-404(ra) # 80002b54 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005cf0:	0184b503          	ld	a0,24(s1)
    80005cf4:	ffffd097          	auipc	ra,0xffffd
    80005cf8:	e60080e7          	jalr	-416(ra) # 80002b54 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005cfc:	00090513          	mv	a0,s2
    80005d00:	01813083          	ld	ra,24(sp)
    80005d04:	01013403          	ld	s0,16(sp)
    80005d08:	00813483          	ld	s1,8(sp)
    80005d0c:	00013903          	ld	s2,0(sp)
    80005d10:	02010113          	addi	sp,sp,32
    80005d14:	00008067          	ret

0000000080005d18 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005d18:	fe010113          	addi	sp,sp,-32
    80005d1c:	00113c23          	sd	ra,24(sp)
    80005d20:	00813823          	sd	s0,16(sp)
    80005d24:	00913423          	sd	s1,8(sp)
    80005d28:	01213023          	sd	s2,0(sp)
    80005d2c:	02010413          	addi	s0,sp,32
    80005d30:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005d34:	02853503          	ld	a0,40(a0)
    80005d38:	ffffd097          	auipc	ra,0xffffd
    80005d3c:	df0080e7          	jalr	-528(ra) # 80002b28 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005d40:	0304b503          	ld	a0,48(s1)
    80005d44:	ffffd097          	auipc	ra,0xffffd
    80005d48:	de4080e7          	jalr	-540(ra) # 80002b28 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005d4c:	0144a783          	lw	a5,20(s1)
    80005d50:	0104a903          	lw	s2,16(s1)
    80005d54:	0327ce63          	blt	a5,s2,80005d90 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80005d58:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005d5c:	0304b503          	ld	a0,48(s1)
    80005d60:	ffffd097          	auipc	ra,0xffffd
    80005d64:	df4080e7          	jalr	-524(ra) # 80002b54 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80005d68:	0284b503          	ld	a0,40(s1)
    80005d6c:	ffffd097          	auipc	ra,0xffffd
    80005d70:	de8080e7          	jalr	-536(ra) # 80002b54 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005d74:	00090513          	mv	a0,s2
    80005d78:	01813083          	ld	ra,24(sp)
    80005d7c:	01013403          	ld	s0,16(sp)
    80005d80:	00813483          	ld	s1,8(sp)
    80005d84:	00013903          	ld	s2,0(sp)
    80005d88:	02010113          	addi	sp,sp,32
    80005d8c:	00008067          	ret
        ret = cap - head + tail;
    80005d90:	0004a703          	lw	a4,0(s1)
    80005d94:	4127093b          	subw	s2,a4,s2
    80005d98:	00f9093b          	addw	s2,s2,a5
    80005d9c:	fc1ff06f          	j	80005d5c <_ZN9BufferCPP6getCntEv+0x44>

0000000080005da0 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80005da0:	fe010113          	addi	sp,sp,-32
    80005da4:	00113c23          	sd	ra,24(sp)
    80005da8:	00813823          	sd	s0,16(sp)
    80005dac:	00913423          	sd	s1,8(sp)
    80005db0:	02010413          	addi	s0,sp,32
    80005db4:	00050493          	mv	s1,a0
    Console::putc('\n');
    80005db8:	00a00513          	li	a0,10
    80005dbc:	ffffd097          	auipc	ra,0xffffd
    80005dc0:	e6c080e7          	jalr	-404(ra) # 80002c28 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80005dc4:	00004517          	auipc	a0,0x4
    80005dc8:	65450513          	addi	a0,a0,1620 # 8000a418 <CONSOLE_STATUS+0x408>
    80005dcc:	00000097          	auipc	ra,0x0
    80005dd0:	a0c080e7          	jalr	-1524(ra) # 800057d8 <_Z11printStringPKc>
    while (getCnt()) {
    80005dd4:	00048513          	mv	a0,s1
    80005dd8:	00000097          	auipc	ra,0x0
    80005ddc:	f40080e7          	jalr	-192(ra) # 80005d18 <_ZN9BufferCPP6getCntEv>
    80005de0:	02050c63          	beqz	a0,80005e18 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80005de4:	0084b783          	ld	a5,8(s1)
    80005de8:	0104a703          	lw	a4,16(s1)
    80005dec:	00271713          	slli	a4,a4,0x2
    80005df0:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80005df4:	0007c503          	lbu	a0,0(a5)
    80005df8:	ffffd097          	auipc	ra,0xffffd
    80005dfc:	e30080e7          	jalr	-464(ra) # 80002c28 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80005e00:	0104a783          	lw	a5,16(s1)
    80005e04:	0017879b          	addiw	a5,a5,1
    80005e08:	0004a703          	lw	a4,0(s1)
    80005e0c:	02e7e7bb          	remw	a5,a5,a4
    80005e10:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80005e14:	fc1ff06f          	j	80005dd4 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80005e18:	02100513          	li	a0,33
    80005e1c:	ffffd097          	auipc	ra,0xffffd
    80005e20:	e0c080e7          	jalr	-500(ra) # 80002c28 <_ZN7Console4putcEc>
    Console::putc('\n');
    80005e24:	00a00513          	li	a0,10
    80005e28:	ffffd097          	auipc	ra,0xffffd
    80005e2c:	e00080e7          	jalr	-512(ra) # 80002c28 <_ZN7Console4putcEc>
    mem_free(buffer);
    80005e30:	0084b503          	ld	a0,8(s1)
    80005e34:	ffffb097          	auipc	ra,0xffffb
    80005e38:	5a0080e7          	jalr	1440(ra) # 800013d4 <_Z8mem_freePv>
    delete itemAvailable;
    80005e3c:	0204b503          	ld	a0,32(s1)
    80005e40:	00050863          	beqz	a0,80005e50 <_ZN9BufferCPPD1Ev+0xb0>
    80005e44:	00053783          	ld	a5,0(a0)
    80005e48:	0087b783          	ld	a5,8(a5)
    80005e4c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80005e50:	0184b503          	ld	a0,24(s1)
    80005e54:	00050863          	beqz	a0,80005e64 <_ZN9BufferCPPD1Ev+0xc4>
    80005e58:	00053783          	ld	a5,0(a0)
    80005e5c:	0087b783          	ld	a5,8(a5)
    80005e60:	000780e7          	jalr	a5
    delete mutexTail;
    80005e64:	0304b503          	ld	a0,48(s1)
    80005e68:	00050863          	beqz	a0,80005e78 <_ZN9BufferCPPD1Ev+0xd8>
    80005e6c:	00053783          	ld	a5,0(a0)
    80005e70:	0087b783          	ld	a5,8(a5)
    80005e74:	000780e7          	jalr	a5
    delete mutexHead;
    80005e78:	0284b503          	ld	a0,40(s1)
    80005e7c:	00050863          	beqz	a0,80005e8c <_ZN9BufferCPPD1Ev+0xec>
    80005e80:	00053783          	ld	a5,0(a0)
    80005e84:	0087b783          	ld	a5,8(a5)
    80005e88:	000780e7          	jalr	a5
}
    80005e8c:	01813083          	ld	ra,24(sp)
    80005e90:	01013403          	ld	s0,16(sp)
    80005e94:	00813483          	ld	s1,8(sp)
    80005e98:	02010113          	addi	sp,sp,32
    80005e9c:	00008067          	ret

0000000080005ea0 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80005ea0:	fe010113          	addi	sp,sp,-32
    80005ea4:	00113c23          	sd	ra,24(sp)
    80005ea8:	00813823          	sd	s0,16(sp)
    80005eac:	00913423          	sd	s1,8(sp)
    80005eb0:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80005eb4:	00004517          	auipc	a0,0x4
    80005eb8:	57c50513          	addi	a0,a0,1404 # 8000a430 <CONSOLE_STATUS+0x420>
    80005ebc:	00000097          	auipc	ra,0x0
    80005ec0:	91c080e7          	jalr	-1764(ra) # 800057d8 <_Z11printStringPKc>
    int test = getc() - '0';
    80005ec4:	ffffb097          	auipc	ra,0xffffb
    80005ec8:	73c080e7          	jalr	1852(ra) # 80001600 <_Z4getcv>
    80005ecc:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80005ed0:	ffffb097          	auipc	ra,0xffffb
    80005ed4:	730080e7          	jalr	1840(ra) # 80001600 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80005ed8:	00700793          	li	a5,7
    80005edc:	1097e263          	bltu	a5,s1,80005fe0 <_Z8userMainv+0x140>
    80005ee0:	00249493          	slli	s1,s1,0x2
    80005ee4:	00004717          	auipc	a4,0x4
    80005ee8:	7a470713          	addi	a4,a4,1956 # 8000a688 <CONSOLE_STATUS+0x678>
    80005eec:	00e484b3          	add	s1,s1,a4
    80005ef0:	0004a783          	lw	a5,0(s1)
    80005ef4:	00e787b3          	add	a5,a5,a4
    80005ef8:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80005efc:	fffff097          	auipc	ra,0xfffff
    80005f00:	f54080e7          	jalr	-172(ra) # 80004e50 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80005f04:	00004517          	auipc	a0,0x4
    80005f08:	54c50513          	addi	a0,a0,1356 # 8000a450 <CONSOLE_STATUS+0x440>
    80005f0c:	00000097          	auipc	ra,0x0
    80005f10:	8cc080e7          	jalr	-1844(ra) # 800057d8 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80005f14:	01813083          	ld	ra,24(sp)
    80005f18:	01013403          	ld	s0,16(sp)
    80005f1c:	00813483          	ld	s1,8(sp)
    80005f20:	02010113          	addi	sp,sp,32
    80005f24:	00008067          	ret
            Threads_CPP_API_test();
    80005f28:	ffffe097          	auipc	ra,0xffffe
    80005f2c:	e08080e7          	jalr	-504(ra) # 80003d30 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80005f30:	00004517          	auipc	a0,0x4
    80005f34:	56050513          	addi	a0,a0,1376 # 8000a490 <CONSOLE_STATUS+0x480>
    80005f38:	00000097          	auipc	ra,0x0
    80005f3c:	8a0080e7          	jalr	-1888(ra) # 800057d8 <_Z11printStringPKc>
            break;
    80005f40:	fd5ff06f          	j	80005f14 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80005f44:	ffffd097          	auipc	ra,0xffffd
    80005f48:	640080e7          	jalr	1600(ra) # 80003584 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80005f4c:	00004517          	auipc	a0,0x4
    80005f50:	58450513          	addi	a0,a0,1412 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80005f54:	00000097          	auipc	ra,0x0
    80005f58:	884080e7          	jalr	-1916(ra) # 800057d8 <_Z11printStringPKc>
            break;
    80005f5c:	fb9ff06f          	j	80005f14 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80005f60:	fffff097          	auipc	ra,0xfffff
    80005f64:	234080e7          	jalr	564(ra) # 80005194 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80005f68:	00004517          	auipc	a0,0x4
    80005f6c:	5b850513          	addi	a0,a0,1464 # 8000a520 <CONSOLE_STATUS+0x510>
    80005f70:	00000097          	auipc	ra,0x0
    80005f74:	868080e7          	jalr	-1944(ra) # 800057d8 <_Z11printStringPKc>
            break;
    80005f78:	f9dff06f          	j	80005f14 <_Z8userMainv+0x74>
            testSleeping();
    80005f7c:	00000097          	auipc	ra,0x0
    80005f80:	11c080e7          	jalr	284(ra) # 80006098 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80005f84:	00004517          	auipc	a0,0x4
    80005f88:	5f450513          	addi	a0,a0,1524 # 8000a578 <CONSOLE_STATUS+0x568>
    80005f8c:	00000097          	auipc	ra,0x0
    80005f90:	84c080e7          	jalr	-1972(ra) # 800057d8 <_Z11printStringPKc>
            break;
    80005f94:	f81ff06f          	j	80005f14 <_Z8userMainv+0x74>
            testConsumerProducer();
    80005f98:	ffffe097          	auipc	ra,0xffffe
    80005f9c:	258080e7          	jalr	600(ra) # 800041f0 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80005fa0:	00004517          	auipc	a0,0x4
    80005fa4:	60850513          	addi	a0,a0,1544 # 8000a5a8 <CONSOLE_STATUS+0x598>
    80005fa8:	00000097          	auipc	ra,0x0
    80005fac:	830080e7          	jalr	-2000(ra) # 800057d8 <_Z11printStringPKc>
            break;
    80005fb0:	f65ff06f          	j	80005f14 <_Z8userMainv+0x74>
            System_Mode_test();
    80005fb4:	00000097          	auipc	ra,0x0
    80005fb8:	658080e7          	jalr	1624(ra) # 8000660c <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80005fbc:	00004517          	auipc	a0,0x4
    80005fc0:	62c50513          	addi	a0,a0,1580 # 8000a5e8 <CONSOLE_STATUS+0x5d8>
    80005fc4:	00000097          	auipc	ra,0x0
    80005fc8:	814080e7          	jalr	-2028(ra) # 800057d8 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80005fcc:	00004517          	auipc	a0,0x4
    80005fd0:	63c50513          	addi	a0,a0,1596 # 8000a608 <CONSOLE_STATUS+0x5f8>
    80005fd4:	00000097          	auipc	ra,0x0
    80005fd8:	804080e7          	jalr	-2044(ra) # 800057d8 <_Z11printStringPKc>
            break;
    80005fdc:	f39ff06f          	j	80005f14 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80005fe0:	00004517          	auipc	a0,0x4
    80005fe4:	68050513          	addi	a0,a0,1664 # 8000a660 <CONSOLE_STATUS+0x650>
    80005fe8:	fffff097          	auipc	ra,0xfffff
    80005fec:	7f0080e7          	jalr	2032(ra) # 800057d8 <_Z11printStringPKc>
    80005ff0:	f25ff06f          	j	80005f14 <_Z8userMainv+0x74>

0000000080005ff4 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void* arg) {
    80005ff4:	fe010113          	addi	sp,sp,-32
    80005ff8:	00113c23          	sd	ra,24(sp)
    80005ffc:	00813823          	sd	s0,16(sp)
    80006000:	00913423          	sd	s1,8(sp)
    80006004:	01213023          	sd	s2,0(sp)
    80006008:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t*)arg);
    8000600c:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006010:	00600493          	li	s1,6
    while (--i > 0) {
    80006014:	fff4849b          	addiw	s1,s1,-1
    80006018:	04905463          	blez	s1,80006060 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    8000601c:	00004517          	auipc	a0,0x4
    80006020:	68c50513          	addi	a0,a0,1676 # 8000a6a8 <CONSOLE_STATUS+0x698>
    80006024:	fffff097          	auipc	ra,0xfffff
    80006028:	7b4080e7          	jalr	1972(ra) # 800057d8 <_Z11printStringPKc>
        printInt(sleep_time);
    8000602c:	00000613          	li	a2,0
    80006030:	00a00593          	li	a1,10
    80006034:	0009051b          	sext.w	a0,s2
    80006038:	00000097          	auipc	ra,0x0
    8000603c:	950080e7          	jalr	-1712(ra) # 80005988 <_Z8printIntiii>
        printString(" !\n");
    80006040:	00004517          	auipc	a0,0x4
    80006044:	67050513          	addi	a0,a0,1648 # 8000a6b0 <CONSOLE_STATUS+0x6a0>
    80006048:	fffff097          	auipc	ra,0xfffff
    8000604c:	790080e7          	jalr	1936(ra) # 800057d8 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006050:	00090513          	mv	a0,s2
    80006054:	ffffb097          	auipc	ra,0xffffb
    80006058:	4b4080e7          	jalr	1204(ra) # 80001508 <_Z10time_sleepm>
    while (--i > 0) {
    8000605c:	fb9ff06f          	j	80006014 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time / 10 - 1] = true;
    80006060:	00a00793          	li	a5,10
    80006064:	02f95933          	divu	s2,s2,a5
    80006068:	fff90913          	addi	s2,s2,-1
    8000606c:	00007797          	auipc	a5,0x7
    80006070:	1dc78793          	addi	a5,a5,476 # 8000d248 <_ZL8finished>
    80006074:	01278933          	add	s2,a5,s2
    80006078:	00100793          	li	a5,1
    8000607c:	00f90023          	sb	a5,0(s2)
}
    80006080:	01813083          	ld	ra,24(sp)
    80006084:	01013403          	ld	s0,16(sp)
    80006088:	00813483          	ld	s1,8(sp)
    8000608c:	00013903          	ld	s2,0(sp)
    80006090:	02010113          	addi	sp,sp,32
    80006094:	00008067          	ret

0000000080006098 <_Z12testSleepingv>:
        printInt(counter++);
        printString("\n");
    }
};

void testSleeping() {
    80006098:	fc010113          	addi	sp,sp,-64
    8000609c:	02113c23          	sd	ra,56(sp)
    800060a0:	02813823          	sd	s0,48(sp)
    800060a4:	02913423          	sd	s1,40(sp)
    800060a8:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800060ac:	00a00793          	li	a5,10
    800060b0:	fcf43823          	sd	a5,-48(s0)
    800060b4:	01400793          	li	a5,20
    800060b8:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];
    //timer t;
    //t.start();
    for (int i = 0; i < sleepy_thread_count; i++) {
    800060bc:	00000493          	li	s1,0
    800060c0:	02c0006f          	j	800060ec <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800060c4:	00349793          	slli	a5,s1,0x3
    800060c8:	fd040613          	addi	a2,s0,-48
    800060cc:	00f60633          	add	a2,a2,a5
    800060d0:	00000597          	auipc	a1,0x0
    800060d4:	f2458593          	addi	a1,a1,-220 # 80005ff4 <_ZL9sleepyRunPv>
    800060d8:	fc040513          	addi	a0,s0,-64
    800060dc:	00f50533          	add	a0,a0,a5
    800060e0:	ffffb097          	auipc	ra,0xffffb
    800060e4:	324080e7          	jalr	804(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800060e8:	0014849b          	addiw	s1,s1,1
    800060ec:	00100793          	li	a5,1
    800060f0:	fc97dae3          	bge	a5,s1,800060c4 <_Z12testSleepingv+0x2c>
    }
    while (!(finished[0] && finished[1])) {}
    800060f4:	00007797          	auipc	a5,0x7
    800060f8:	1547c783          	lbu	a5,340(a5) # 8000d248 <_ZL8finished>
    800060fc:	fe078ce3          	beqz	a5,800060f4 <_Z12testSleepingv+0x5c>
    80006100:	00007797          	auipc	a5,0x7
    80006104:	1497c783          	lbu	a5,329(a5) # 8000d249 <_ZL8finished+0x1>
    80006108:	fe0786e3          	beqz	a5,800060f4 <_Z12testSleepingv+0x5c>
    //t.terminate();
    //t.join();
}
    8000610c:	03813083          	ld	ra,56(sp)
    80006110:	03013403          	ld	s0,48(sp)
    80006114:	02813483          	ld	s1,40(sp)
    80006118:	04010113          	addi	sp,sp,64
    8000611c:	00008067          	ret

0000000080006120 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006120:	fe010113          	addi	sp,sp,-32
    80006124:	00113c23          	sd	ra,24(sp)
    80006128:	00813823          	sd	s0,16(sp)
    8000612c:	00913423          	sd	s1,8(sp)
    80006130:	01213023          	sd	s2,0(sp)
    80006134:	02010413          	addi	s0,sp,32
    80006138:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000613c:	00100793          	li	a5,1
    80006140:	02a7f863          	bgeu	a5,a0,80006170 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006144:	00a00793          	li	a5,10
    80006148:	02f577b3          	remu	a5,a0,a5
    8000614c:	02078e63          	beqz	a5,80006188 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006150:	fff48513          	addi	a0,s1,-1
    80006154:	00000097          	auipc	ra,0x0
    80006158:	fcc080e7          	jalr	-52(ra) # 80006120 <_ZL9fibonaccim>
    8000615c:	00050913          	mv	s2,a0
    80006160:	ffe48513          	addi	a0,s1,-2
    80006164:	00000097          	auipc	ra,0x0
    80006168:	fbc080e7          	jalr	-68(ra) # 80006120 <_ZL9fibonaccim>
    8000616c:	00a90533          	add	a0,s2,a0
}
    80006170:	01813083          	ld	ra,24(sp)
    80006174:	01013403          	ld	s0,16(sp)
    80006178:	00813483          	ld	s1,8(sp)
    8000617c:	00013903          	ld	s2,0(sp)
    80006180:	02010113          	addi	sp,sp,32
    80006184:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006188:	ffffb097          	auipc	ra,0xffffb
    8000618c:	338080e7          	jalr	824(ra) # 800014c0 <_Z15thread_dispatchv>
    80006190:	fc1ff06f          	j	80006150 <_ZL9fibonaccim+0x30>

0000000080006194 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006194:	fe010113          	addi	sp,sp,-32
    80006198:	00113c23          	sd	ra,24(sp)
    8000619c:	00813823          	sd	s0,16(sp)
    800061a0:	00913423          	sd	s1,8(sp)
    800061a4:	01213023          	sd	s2,0(sp)
    800061a8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800061ac:	00a00493          	li	s1,10
    800061b0:	0400006f          	j	800061f0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800061b4:	00004517          	auipc	a0,0x4
    800061b8:	1cc50513          	addi	a0,a0,460 # 8000a380 <CONSOLE_STATUS+0x370>
    800061bc:	fffff097          	auipc	ra,0xfffff
    800061c0:	61c080e7          	jalr	1564(ra) # 800057d8 <_Z11printStringPKc>
    800061c4:	00000613          	li	a2,0
    800061c8:	00a00593          	li	a1,10
    800061cc:	00048513          	mv	a0,s1
    800061d0:	fffff097          	auipc	ra,0xfffff
    800061d4:	7b8080e7          	jalr	1976(ra) # 80005988 <_Z8printIntiii>
    800061d8:	00004517          	auipc	a0,0x4
    800061dc:	39850513          	addi	a0,a0,920 # 8000a570 <CONSOLE_STATUS+0x560>
    800061e0:	fffff097          	auipc	ra,0xfffff
    800061e4:	5f8080e7          	jalr	1528(ra) # 800057d8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800061e8:	0014849b          	addiw	s1,s1,1
    800061ec:	0ff4f493          	andi	s1,s1,255
    800061f0:	00c00793          	li	a5,12
    800061f4:	fc97f0e3          	bgeu	a5,s1,800061b4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800061f8:	00004517          	auipc	a0,0x4
    800061fc:	19050513          	addi	a0,a0,400 # 8000a388 <CONSOLE_STATUS+0x378>
    80006200:	fffff097          	auipc	ra,0xfffff
    80006204:	5d8080e7          	jalr	1496(ra) # 800057d8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006208:	00500313          	li	t1,5
    thread_dispatch();
    8000620c:	ffffb097          	auipc	ra,0xffffb
    80006210:	2b4080e7          	jalr	692(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006214:	01000513          	li	a0,16
    80006218:	00000097          	auipc	ra,0x0
    8000621c:	f08080e7          	jalr	-248(ra) # 80006120 <_ZL9fibonaccim>
    80006220:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006224:	00004517          	auipc	a0,0x4
    80006228:	17450513          	addi	a0,a0,372 # 8000a398 <CONSOLE_STATUS+0x388>
    8000622c:	fffff097          	auipc	ra,0xfffff
    80006230:	5ac080e7          	jalr	1452(ra) # 800057d8 <_Z11printStringPKc>
    80006234:	00000613          	li	a2,0
    80006238:	00a00593          	li	a1,10
    8000623c:	0009051b          	sext.w	a0,s2
    80006240:	fffff097          	auipc	ra,0xfffff
    80006244:	748080e7          	jalr	1864(ra) # 80005988 <_Z8printIntiii>
    80006248:	00004517          	auipc	a0,0x4
    8000624c:	32850513          	addi	a0,a0,808 # 8000a570 <CONSOLE_STATUS+0x560>
    80006250:	fffff097          	auipc	ra,0xfffff
    80006254:	588080e7          	jalr	1416(ra) # 800057d8 <_Z11printStringPKc>
    80006258:	0400006f          	j	80006298 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000625c:	00004517          	auipc	a0,0x4
    80006260:	12450513          	addi	a0,a0,292 # 8000a380 <CONSOLE_STATUS+0x370>
    80006264:	fffff097          	auipc	ra,0xfffff
    80006268:	574080e7          	jalr	1396(ra) # 800057d8 <_Z11printStringPKc>
    8000626c:	00000613          	li	a2,0
    80006270:	00a00593          	li	a1,10
    80006274:	00048513          	mv	a0,s1
    80006278:	fffff097          	auipc	ra,0xfffff
    8000627c:	710080e7          	jalr	1808(ra) # 80005988 <_Z8printIntiii>
    80006280:	00004517          	auipc	a0,0x4
    80006284:	2f050513          	addi	a0,a0,752 # 8000a570 <CONSOLE_STATUS+0x560>
    80006288:	fffff097          	auipc	ra,0xfffff
    8000628c:	550080e7          	jalr	1360(ra) # 800057d8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006290:	0014849b          	addiw	s1,s1,1
    80006294:	0ff4f493          	andi	s1,s1,255
    80006298:	00f00793          	li	a5,15
    8000629c:	fc97f0e3          	bgeu	a5,s1,8000625c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800062a0:	00004517          	auipc	a0,0x4
    800062a4:	10850513          	addi	a0,a0,264 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800062a8:	fffff097          	auipc	ra,0xfffff
    800062ac:	530080e7          	jalr	1328(ra) # 800057d8 <_Z11printStringPKc>
    finishedD = true;
    800062b0:	00100793          	li	a5,1
    800062b4:	00007717          	auipc	a4,0x7
    800062b8:	f8f70b23          	sb	a5,-106(a4) # 8000d24a <_ZL9finishedD>
    thread_dispatch();
    800062bc:	ffffb097          	auipc	ra,0xffffb
    800062c0:	204080e7          	jalr	516(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800062c4:	01813083          	ld	ra,24(sp)
    800062c8:	01013403          	ld	s0,16(sp)
    800062cc:	00813483          	ld	s1,8(sp)
    800062d0:	00013903          	ld	s2,0(sp)
    800062d4:	02010113          	addi	sp,sp,32
    800062d8:	00008067          	ret

00000000800062dc <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800062dc:	fe010113          	addi	sp,sp,-32
    800062e0:	00113c23          	sd	ra,24(sp)
    800062e4:	00813823          	sd	s0,16(sp)
    800062e8:	00913423          	sd	s1,8(sp)
    800062ec:	01213023          	sd	s2,0(sp)
    800062f0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800062f4:	00000493          	li	s1,0
    800062f8:	0400006f          	j	80006338 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800062fc:	00004517          	auipc	a0,0x4
    80006300:	04450513          	addi	a0,a0,68 # 8000a340 <CONSOLE_STATUS+0x330>
    80006304:	fffff097          	auipc	ra,0xfffff
    80006308:	4d4080e7          	jalr	1236(ra) # 800057d8 <_Z11printStringPKc>
    8000630c:	00000613          	li	a2,0
    80006310:	00a00593          	li	a1,10
    80006314:	00048513          	mv	a0,s1
    80006318:	fffff097          	auipc	ra,0xfffff
    8000631c:	670080e7          	jalr	1648(ra) # 80005988 <_Z8printIntiii>
    80006320:	00004517          	auipc	a0,0x4
    80006324:	25050513          	addi	a0,a0,592 # 8000a570 <CONSOLE_STATUS+0x560>
    80006328:	fffff097          	auipc	ra,0xfffff
    8000632c:	4b0080e7          	jalr	1200(ra) # 800057d8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006330:	0014849b          	addiw	s1,s1,1
    80006334:	0ff4f493          	andi	s1,s1,255
    80006338:	00200793          	li	a5,2
    8000633c:	fc97f0e3          	bgeu	a5,s1,800062fc <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006340:	00004517          	auipc	a0,0x4
    80006344:	00850513          	addi	a0,a0,8 # 8000a348 <CONSOLE_STATUS+0x338>
    80006348:	fffff097          	auipc	ra,0xfffff
    8000634c:	490080e7          	jalr	1168(ra) # 800057d8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006350:	00700313          	li	t1,7
    thread_dispatch();
    80006354:	ffffb097          	auipc	ra,0xffffb
    80006358:	16c080e7          	jalr	364(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000635c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006360:	00004517          	auipc	a0,0x4
    80006364:	ff850513          	addi	a0,a0,-8 # 8000a358 <CONSOLE_STATUS+0x348>
    80006368:	fffff097          	auipc	ra,0xfffff
    8000636c:	470080e7          	jalr	1136(ra) # 800057d8 <_Z11printStringPKc>
    80006370:	00000613          	li	a2,0
    80006374:	00a00593          	li	a1,10
    80006378:	0009051b          	sext.w	a0,s2
    8000637c:	fffff097          	auipc	ra,0xfffff
    80006380:	60c080e7          	jalr	1548(ra) # 80005988 <_Z8printIntiii>
    80006384:	00004517          	auipc	a0,0x4
    80006388:	1ec50513          	addi	a0,a0,492 # 8000a570 <CONSOLE_STATUS+0x560>
    8000638c:	fffff097          	auipc	ra,0xfffff
    80006390:	44c080e7          	jalr	1100(ra) # 800057d8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006394:	00c00513          	li	a0,12
    80006398:	00000097          	auipc	ra,0x0
    8000639c:	d88080e7          	jalr	-632(ra) # 80006120 <_ZL9fibonaccim>
    800063a0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800063a4:	00004517          	auipc	a0,0x4
    800063a8:	fbc50513          	addi	a0,a0,-68 # 8000a360 <CONSOLE_STATUS+0x350>
    800063ac:	fffff097          	auipc	ra,0xfffff
    800063b0:	42c080e7          	jalr	1068(ra) # 800057d8 <_Z11printStringPKc>
    800063b4:	00000613          	li	a2,0
    800063b8:	00a00593          	li	a1,10
    800063bc:	0009051b          	sext.w	a0,s2
    800063c0:	fffff097          	auipc	ra,0xfffff
    800063c4:	5c8080e7          	jalr	1480(ra) # 80005988 <_Z8printIntiii>
    800063c8:	00004517          	auipc	a0,0x4
    800063cc:	1a850513          	addi	a0,a0,424 # 8000a570 <CONSOLE_STATUS+0x560>
    800063d0:	fffff097          	auipc	ra,0xfffff
    800063d4:	408080e7          	jalr	1032(ra) # 800057d8 <_Z11printStringPKc>
    800063d8:	0400006f          	j	80006418 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800063dc:	00004517          	auipc	a0,0x4
    800063e0:	f6450513          	addi	a0,a0,-156 # 8000a340 <CONSOLE_STATUS+0x330>
    800063e4:	fffff097          	auipc	ra,0xfffff
    800063e8:	3f4080e7          	jalr	1012(ra) # 800057d8 <_Z11printStringPKc>
    800063ec:	00000613          	li	a2,0
    800063f0:	00a00593          	li	a1,10
    800063f4:	00048513          	mv	a0,s1
    800063f8:	fffff097          	auipc	ra,0xfffff
    800063fc:	590080e7          	jalr	1424(ra) # 80005988 <_Z8printIntiii>
    80006400:	00004517          	auipc	a0,0x4
    80006404:	17050513          	addi	a0,a0,368 # 8000a570 <CONSOLE_STATUS+0x560>
    80006408:	fffff097          	auipc	ra,0xfffff
    8000640c:	3d0080e7          	jalr	976(ra) # 800057d8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006410:	0014849b          	addiw	s1,s1,1
    80006414:	0ff4f493          	andi	s1,s1,255
    80006418:	00500793          	li	a5,5
    8000641c:	fc97f0e3          	bgeu	a5,s1,800063dc <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006420:	00004517          	auipc	a0,0x4
    80006424:	ef850513          	addi	a0,a0,-264 # 8000a318 <CONSOLE_STATUS+0x308>
    80006428:	fffff097          	auipc	ra,0xfffff
    8000642c:	3b0080e7          	jalr	944(ra) # 800057d8 <_Z11printStringPKc>
    finishedC = true;
    80006430:	00100793          	li	a5,1
    80006434:	00007717          	auipc	a4,0x7
    80006438:	e0f70ba3          	sb	a5,-489(a4) # 8000d24b <_ZL9finishedC>
    thread_dispatch();
    8000643c:	ffffb097          	auipc	ra,0xffffb
    80006440:	084080e7          	jalr	132(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80006444:	01813083          	ld	ra,24(sp)
    80006448:	01013403          	ld	s0,16(sp)
    8000644c:	00813483          	ld	s1,8(sp)
    80006450:	00013903          	ld	s2,0(sp)
    80006454:	02010113          	addi	sp,sp,32
    80006458:	00008067          	ret

000000008000645c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000645c:	fe010113          	addi	sp,sp,-32
    80006460:	00113c23          	sd	ra,24(sp)
    80006464:	00813823          	sd	s0,16(sp)
    80006468:	00913423          	sd	s1,8(sp)
    8000646c:	01213023          	sd	s2,0(sp)
    80006470:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006474:	00000913          	li	s2,0
    80006478:	0400006f          	j	800064b8 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    8000647c:	ffffb097          	auipc	ra,0xffffb
    80006480:	044080e7          	jalr	68(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006484:	00148493          	addi	s1,s1,1
    80006488:	000027b7          	lui	a5,0x2
    8000648c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006490:	0097ee63          	bltu	a5,s1,800064ac <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006494:	00000713          	li	a4,0
    80006498:	000077b7          	lui	a5,0x7
    8000649c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800064a0:	fce7eee3          	bltu	a5,a4,8000647c <_ZL11workerBodyBPv+0x20>
    800064a4:	00170713          	addi	a4,a4,1
    800064a8:	ff1ff06f          	j	80006498 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    800064ac:	00a00793          	li	a5,10
    800064b0:	04f90663          	beq	s2,a5,800064fc <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    800064b4:	00190913          	addi	s2,s2,1
    800064b8:	00f00793          	li	a5,15
    800064bc:	0527e463          	bltu	a5,s2,80006504 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    800064c0:	00004517          	auipc	a0,0x4
    800064c4:	e6850513          	addi	a0,a0,-408 # 8000a328 <CONSOLE_STATUS+0x318>
    800064c8:	fffff097          	auipc	ra,0xfffff
    800064cc:	310080e7          	jalr	784(ra) # 800057d8 <_Z11printStringPKc>
    800064d0:	00000613          	li	a2,0
    800064d4:	00a00593          	li	a1,10
    800064d8:	0009051b          	sext.w	a0,s2
    800064dc:	fffff097          	auipc	ra,0xfffff
    800064e0:	4ac080e7          	jalr	1196(ra) # 80005988 <_Z8printIntiii>
    800064e4:	00004517          	auipc	a0,0x4
    800064e8:	08c50513          	addi	a0,a0,140 # 8000a570 <CONSOLE_STATUS+0x560>
    800064ec:	fffff097          	auipc	ra,0xfffff
    800064f0:	2ec080e7          	jalr	748(ra) # 800057d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800064f4:	00000493          	li	s1,0
    800064f8:	f91ff06f          	j	80006488 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800064fc:	14102ff3          	csrr	t6,sepc
    80006500:	fb5ff06f          	j	800064b4 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006504:	00004517          	auipc	a0,0x4
    80006508:	e2c50513          	addi	a0,a0,-468 # 8000a330 <CONSOLE_STATUS+0x320>
    8000650c:	fffff097          	auipc	ra,0xfffff
    80006510:	2cc080e7          	jalr	716(ra) # 800057d8 <_Z11printStringPKc>
    finishedB = true;
    80006514:	00100793          	li	a5,1
    80006518:	00007717          	auipc	a4,0x7
    8000651c:	d2f70a23          	sb	a5,-716(a4) # 8000d24c <_ZL9finishedB>
    thread_dispatch();
    80006520:	ffffb097          	auipc	ra,0xffffb
    80006524:	fa0080e7          	jalr	-96(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80006528:	01813083          	ld	ra,24(sp)
    8000652c:	01013403          	ld	s0,16(sp)
    80006530:	00813483          	ld	s1,8(sp)
    80006534:	00013903          	ld	s2,0(sp)
    80006538:	02010113          	addi	sp,sp,32
    8000653c:	00008067          	ret

0000000080006540 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006540:	fe010113          	addi	sp,sp,-32
    80006544:	00113c23          	sd	ra,24(sp)
    80006548:	00813823          	sd	s0,16(sp)
    8000654c:	00913423          	sd	s1,8(sp)
    80006550:	01213023          	sd	s2,0(sp)
    80006554:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006558:	00000913          	li	s2,0
    8000655c:	0380006f          	j	80006594 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006560:	ffffb097          	auipc	ra,0xffffb
    80006564:	f60080e7          	jalr	-160(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006568:	00148493          	addi	s1,s1,1
    8000656c:	000027b7          	lui	a5,0x2
    80006570:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006574:	0097ee63          	bltu	a5,s1,80006590 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006578:	00000713          	li	a4,0
    8000657c:	000077b7          	lui	a5,0x7
    80006580:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006584:	fce7eee3          	bltu	a5,a4,80006560 <_ZL11workerBodyAPv+0x20>
    80006588:	00170713          	addi	a4,a4,1
    8000658c:	ff1ff06f          	j	8000657c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006590:	00190913          	addi	s2,s2,1
    80006594:	00900793          	li	a5,9
    80006598:	0527e063          	bltu	a5,s2,800065d8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000659c:	00004517          	auipc	a0,0x4
    800065a0:	d7450513          	addi	a0,a0,-652 # 8000a310 <CONSOLE_STATUS+0x300>
    800065a4:	fffff097          	auipc	ra,0xfffff
    800065a8:	234080e7          	jalr	564(ra) # 800057d8 <_Z11printStringPKc>
    800065ac:	00000613          	li	a2,0
    800065b0:	00a00593          	li	a1,10
    800065b4:	0009051b          	sext.w	a0,s2
    800065b8:	fffff097          	auipc	ra,0xfffff
    800065bc:	3d0080e7          	jalr	976(ra) # 80005988 <_Z8printIntiii>
    800065c0:	00004517          	auipc	a0,0x4
    800065c4:	fb050513          	addi	a0,a0,-80 # 8000a570 <CONSOLE_STATUS+0x560>
    800065c8:	fffff097          	auipc	ra,0xfffff
    800065cc:	210080e7          	jalr	528(ra) # 800057d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800065d0:	00000493          	li	s1,0
    800065d4:	f99ff06f          	j	8000656c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800065d8:	00004517          	auipc	a0,0x4
    800065dc:	d4050513          	addi	a0,a0,-704 # 8000a318 <CONSOLE_STATUS+0x308>
    800065e0:	fffff097          	auipc	ra,0xfffff
    800065e4:	1f8080e7          	jalr	504(ra) # 800057d8 <_Z11printStringPKc>
    finishedA = true;
    800065e8:	00100793          	li	a5,1
    800065ec:	00007717          	auipc	a4,0x7
    800065f0:	c6f700a3          	sb	a5,-927(a4) # 8000d24d <_ZL9finishedA>
}
    800065f4:	01813083          	ld	ra,24(sp)
    800065f8:	01013403          	ld	s0,16(sp)
    800065fc:	00813483          	ld	s1,8(sp)
    80006600:	00013903          	ld	s2,0(sp)
    80006604:	02010113          	addi	sp,sp,32
    80006608:	00008067          	ret

000000008000660c <_Z16System_Mode_testv>:


void System_Mode_test() {
    8000660c:	fd010113          	addi	sp,sp,-48
    80006610:	02113423          	sd	ra,40(sp)
    80006614:	02813023          	sd	s0,32(sp)
    80006618:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    8000661c:	00000613          	li	a2,0
    80006620:	00000597          	auipc	a1,0x0
    80006624:	f2058593          	addi	a1,a1,-224 # 80006540 <_ZL11workerBodyAPv>
    80006628:	fd040513          	addi	a0,s0,-48
    8000662c:	ffffb097          	auipc	ra,0xffffb
    80006630:	dd8080e7          	jalr	-552(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006634:	00004517          	auipc	a0,0x4
    80006638:	d8450513          	addi	a0,a0,-636 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    8000663c:	fffff097          	auipc	ra,0xfffff
    80006640:	19c080e7          	jalr	412(ra) # 800057d8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006644:	00000613          	li	a2,0
    80006648:	00000597          	auipc	a1,0x0
    8000664c:	e1458593          	addi	a1,a1,-492 # 8000645c <_ZL11workerBodyBPv>
    80006650:	fd840513          	addi	a0,s0,-40
    80006654:	ffffb097          	auipc	ra,0xffffb
    80006658:	db0080e7          	jalr	-592(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    8000665c:	00004517          	auipc	a0,0x4
    80006660:	d7450513          	addi	a0,a0,-652 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80006664:	fffff097          	auipc	ra,0xfffff
    80006668:	174080e7          	jalr	372(ra) # 800057d8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000666c:	00000613          	li	a2,0
    80006670:	00000597          	auipc	a1,0x0
    80006674:	c6c58593          	addi	a1,a1,-916 # 800062dc <_ZL11workerBodyCPv>
    80006678:	fe040513          	addi	a0,s0,-32
    8000667c:	ffffb097          	auipc	ra,0xffffb
    80006680:	d88080e7          	jalr	-632(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006684:	00004517          	auipc	a0,0x4
    80006688:	d6450513          	addi	a0,a0,-668 # 8000a3e8 <CONSOLE_STATUS+0x3d8>
    8000668c:	fffff097          	auipc	ra,0xfffff
    80006690:	14c080e7          	jalr	332(ra) # 800057d8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006694:	00000613          	li	a2,0
    80006698:	00000597          	auipc	a1,0x0
    8000669c:	afc58593          	addi	a1,a1,-1284 # 80006194 <_ZL11workerBodyDPv>
    800066a0:	fe840513          	addi	a0,s0,-24
    800066a4:	ffffb097          	auipc	ra,0xffffb
    800066a8:	d60080e7          	jalr	-672(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800066ac:	00004517          	auipc	a0,0x4
    800066b0:	d5450513          	addi	a0,a0,-684 # 8000a400 <CONSOLE_STATUS+0x3f0>
    800066b4:	fffff097          	auipc	ra,0xfffff
    800066b8:	124080e7          	jalr	292(ra) # 800057d8 <_Z11printStringPKc>
    800066bc:	00c0006f          	j	800066c8 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800066c0:	ffffb097          	auipc	ra,0xffffb
    800066c4:	e00080e7          	jalr	-512(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800066c8:	00007797          	auipc	a5,0x7
    800066cc:	b857c783          	lbu	a5,-1147(a5) # 8000d24d <_ZL9finishedA>
    800066d0:	fe0788e3          	beqz	a5,800066c0 <_Z16System_Mode_testv+0xb4>
    800066d4:	00007797          	auipc	a5,0x7
    800066d8:	b787c783          	lbu	a5,-1160(a5) # 8000d24c <_ZL9finishedB>
    800066dc:	fe0782e3          	beqz	a5,800066c0 <_Z16System_Mode_testv+0xb4>
    800066e0:	00007797          	auipc	a5,0x7
    800066e4:	b6b7c783          	lbu	a5,-1173(a5) # 8000d24b <_ZL9finishedC>
    800066e8:	fc078ce3          	beqz	a5,800066c0 <_Z16System_Mode_testv+0xb4>
    800066ec:	00007797          	auipc	a5,0x7
    800066f0:	b5e7c783          	lbu	a5,-1186(a5) # 8000d24a <_ZL9finishedD>
    800066f4:	fc0786e3          	beqz	a5,800066c0 <_Z16System_Mode_testv+0xb4>
    }

}
    800066f8:	02813083          	ld	ra,40(sp)
    800066fc:	02013403          	ld	s0,32(sp)
    80006700:	03010113          	addi	sp,sp,48
    80006704:	00008067          	ret

0000000080006708 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006708:	fe010113          	addi	sp,sp,-32
    8000670c:	00113c23          	sd	ra,24(sp)
    80006710:	00813823          	sd	s0,16(sp)
    80006714:	00913423          	sd	s1,8(sp)
    80006718:	01213023          	sd	s2,0(sp)
    8000671c:	02010413          	addi	s0,sp,32
    80006720:	00050493          	mv	s1,a0
    80006724:	00058913          	mv	s2,a1
    80006728:	0015879b          	addiw	a5,a1,1
    8000672c:	0007851b          	sext.w	a0,a5
    80006730:	00f4a023          	sw	a5,0(s1)
    80006734:	0004a823          	sw	zero,16(s1)
    80006738:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000673c:	00251513          	slli	a0,a0,0x2
    80006740:	ffffb097          	auipc	ra,0xffffb
    80006744:	c54080e7          	jalr	-940(ra) # 80001394 <_Z9mem_allocm>
    80006748:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    8000674c:	00000593          	li	a1,0
    80006750:	02048513          	addi	a0,s1,32
    80006754:	ffffb097          	auipc	ra,0xffffb
    80006758:	de4080e7          	jalr	-540(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    8000675c:	00090593          	mv	a1,s2
    80006760:	01848513          	addi	a0,s1,24
    80006764:	ffffb097          	auipc	ra,0xffffb
    80006768:	dd4080e7          	jalr	-556(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    8000676c:	00100593          	li	a1,1
    80006770:	02848513          	addi	a0,s1,40
    80006774:	ffffb097          	auipc	ra,0xffffb
    80006778:	dc4080e7          	jalr	-572(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    8000677c:	00100593          	li	a1,1
    80006780:	03048513          	addi	a0,s1,48
    80006784:	ffffb097          	auipc	ra,0xffffb
    80006788:	db4080e7          	jalr	-588(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    8000678c:	01813083          	ld	ra,24(sp)
    80006790:	01013403          	ld	s0,16(sp)
    80006794:	00813483          	ld	s1,8(sp)
    80006798:	00013903          	ld	s2,0(sp)
    8000679c:	02010113          	addi	sp,sp,32
    800067a0:	00008067          	ret

00000000800067a4 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800067a4:	fe010113          	addi	sp,sp,-32
    800067a8:	00113c23          	sd	ra,24(sp)
    800067ac:	00813823          	sd	s0,16(sp)
    800067b0:	00913423          	sd	s1,8(sp)
    800067b4:	01213023          	sd	s2,0(sp)
    800067b8:	02010413          	addi	s0,sp,32
    800067bc:	00050493          	mv	s1,a0
    800067c0:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800067c4:	01853503          	ld	a0,24(a0)
    800067c8:	ffffb097          	auipc	ra,0xffffb
    800067cc:	dd8080e7          	jalr	-552(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    800067d0:	0304b503          	ld	a0,48(s1)
    800067d4:	ffffb097          	auipc	ra,0xffffb
    800067d8:	dcc080e7          	jalr	-564(ra) # 800015a0 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    800067dc:	0084b783          	ld	a5,8(s1)
    800067e0:	0144a703          	lw	a4,20(s1)
    800067e4:	00271713          	slli	a4,a4,0x2
    800067e8:	00e787b3          	add	a5,a5,a4
    800067ec:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800067f0:	0144a783          	lw	a5,20(s1)
    800067f4:	0017879b          	addiw	a5,a5,1
    800067f8:	0004a703          	lw	a4,0(s1)
    800067fc:	02e7e7bb          	remw	a5,a5,a4
    80006800:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006804:	0304b503          	ld	a0,48(s1)
    80006808:	ffffb097          	auipc	ra,0xffffb
    8000680c:	dc8080e7          	jalr	-568(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006810:	0204b503          	ld	a0,32(s1)
    80006814:	ffffb097          	auipc	ra,0xffffb
    80006818:	dbc080e7          	jalr	-580(ra) # 800015d0 <_Z10sem_signalP4KSem>

}
    8000681c:	01813083          	ld	ra,24(sp)
    80006820:	01013403          	ld	s0,16(sp)
    80006824:	00813483          	ld	s1,8(sp)
    80006828:	00013903          	ld	s2,0(sp)
    8000682c:	02010113          	addi	sp,sp,32
    80006830:	00008067          	ret

0000000080006834 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006834:	fe010113          	addi	sp,sp,-32
    80006838:	00113c23          	sd	ra,24(sp)
    8000683c:	00813823          	sd	s0,16(sp)
    80006840:	00913423          	sd	s1,8(sp)
    80006844:	01213023          	sd	s2,0(sp)
    80006848:	02010413          	addi	s0,sp,32
    8000684c:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006850:	02053503          	ld	a0,32(a0)
    80006854:	ffffb097          	auipc	ra,0xffffb
    80006858:	d4c080e7          	jalr	-692(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    8000685c:	0284b503          	ld	a0,40(s1)
    80006860:	ffffb097          	auipc	ra,0xffffb
    80006864:	d40080e7          	jalr	-704(ra) # 800015a0 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006868:	0084b703          	ld	a4,8(s1)
    8000686c:	0104a783          	lw	a5,16(s1)
    80006870:	00279693          	slli	a3,a5,0x2
    80006874:	00d70733          	add	a4,a4,a3
    80006878:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000687c:	0017879b          	addiw	a5,a5,1
    80006880:	0004a703          	lw	a4,0(s1)
    80006884:	02e7e7bb          	remw	a5,a5,a4
    80006888:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    8000688c:	0284b503          	ld	a0,40(s1)
    80006890:	ffffb097          	auipc	ra,0xffffb
    80006894:	d40080e7          	jalr	-704(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006898:	0184b503          	ld	a0,24(s1)
    8000689c:	ffffb097          	auipc	ra,0xffffb
    800068a0:	d34080e7          	jalr	-716(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    800068a4:	00090513          	mv	a0,s2
    800068a8:	01813083          	ld	ra,24(sp)
    800068ac:	01013403          	ld	s0,16(sp)
    800068b0:	00813483          	ld	s1,8(sp)
    800068b4:	00013903          	ld	s2,0(sp)
    800068b8:	02010113          	addi	sp,sp,32
    800068bc:	00008067          	ret

00000000800068c0 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800068c0:	fe010113          	addi	sp,sp,-32
    800068c4:	00113c23          	sd	ra,24(sp)
    800068c8:	00813823          	sd	s0,16(sp)
    800068cc:	00913423          	sd	s1,8(sp)
    800068d0:	01213023          	sd	s2,0(sp)
    800068d4:	02010413          	addi	s0,sp,32
    800068d8:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800068dc:	02853503          	ld	a0,40(a0)
    800068e0:	ffffb097          	auipc	ra,0xffffb
    800068e4:	cc0080e7          	jalr	-832(ra) # 800015a0 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    800068e8:	0304b503          	ld	a0,48(s1)
    800068ec:	ffffb097          	auipc	ra,0xffffb
    800068f0:	cb4080e7          	jalr	-844(ra) # 800015a0 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    800068f4:	0144a783          	lw	a5,20(s1)
    800068f8:	0104a903          	lw	s2,16(s1)
    800068fc:	0327ce63          	blt	a5,s2,80006938 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006900:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006904:	0304b503          	ld	a0,48(s1)
    80006908:	ffffb097          	auipc	ra,0xffffb
    8000690c:	cc8080e7          	jalr	-824(ra) # 800015d0 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006910:	0284b503          	ld	a0,40(s1)
    80006914:	ffffb097          	auipc	ra,0xffffb
    80006918:	cbc080e7          	jalr	-836(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    8000691c:	00090513          	mv	a0,s2
    80006920:	01813083          	ld	ra,24(sp)
    80006924:	01013403          	ld	s0,16(sp)
    80006928:	00813483          	ld	s1,8(sp)
    8000692c:	00013903          	ld	s2,0(sp)
    80006930:	02010113          	addi	sp,sp,32
    80006934:	00008067          	ret
        ret = cap - head + tail;
    80006938:	0004a703          	lw	a4,0(s1)
    8000693c:	4127093b          	subw	s2,a4,s2
    80006940:	00f9093b          	addw	s2,s2,a5
    80006944:	fc1ff06f          	j	80006904 <_ZN6Buffer6getCntEv+0x44>

0000000080006948 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006948:	fe010113          	addi	sp,sp,-32
    8000694c:	00113c23          	sd	ra,24(sp)
    80006950:	00813823          	sd	s0,16(sp)
    80006954:	00913423          	sd	s1,8(sp)
    80006958:	02010413          	addi	s0,sp,32
    8000695c:	00050493          	mv	s1,a0
    putc('\n');
    80006960:	00a00513          	li	a0,10
    80006964:	ffffb097          	auipc	ra,0xffffb
    80006968:	cc4080e7          	jalr	-828(ra) # 80001628 <_Z4putcc>
    printString("Buffer deleted!\n");
    8000696c:	00004517          	auipc	a0,0x4
    80006970:	aac50513          	addi	a0,a0,-1364 # 8000a418 <CONSOLE_STATUS+0x408>
    80006974:	fffff097          	auipc	ra,0xfffff
    80006978:	e64080e7          	jalr	-412(ra) # 800057d8 <_Z11printStringPKc>
    while (getCnt() > 0) {
    8000697c:	00048513          	mv	a0,s1
    80006980:	00000097          	auipc	ra,0x0
    80006984:	f40080e7          	jalr	-192(ra) # 800068c0 <_ZN6Buffer6getCntEv>
    80006988:	02a05c63          	blez	a0,800069c0 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    8000698c:	0084b783          	ld	a5,8(s1)
    80006990:	0104a703          	lw	a4,16(s1)
    80006994:	00271713          	slli	a4,a4,0x2
    80006998:	00e787b3          	add	a5,a5,a4
        putc(ch);
    8000699c:	0007c503          	lbu	a0,0(a5)
    800069a0:	ffffb097          	auipc	ra,0xffffb
    800069a4:	c88080e7          	jalr	-888(ra) # 80001628 <_Z4putcc>
        head = (head + 1) % cap;
    800069a8:	0104a783          	lw	a5,16(s1)
    800069ac:	0017879b          	addiw	a5,a5,1
    800069b0:	0004a703          	lw	a4,0(s1)
    800069b4:	02e7e7bb          	remw	a5,a5,a4
    800069b8:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800069bc:	fc1ff06f          	j	8000697c <_ZN6BufferD1Ev+0x34>
    putc('!');
    800069c0:	02100513          	li	a0,33
    800069c4:	ffffb097          	auipc	ra,0xffffb
    800069c8:	c64080e7          	jalr	-924(ra) # 80001628 <_Z4putcc>
    putc('\n');
    800069cc:	00a00513          	li	a0,10
    800069d0:	ffffb097          	auipc	ra,0xffffb
    800069d4:	c58080e7          	jalr	-936(ra) # 80001628 <_Z4putcc>
    mem_free(buffer);
    800069d8:	0084b503          	ld	a0,8(s1)
    800069dc:	ffffb097          	auipc	ra,0xffffb
    800069e0:	9f8080e7          	jalr	-1544(ra) # 800013d4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800069e4:	0204b503          	ld	a0,32(s1)
    800069e8:	ffffb097          	auipc	ra,0xffffb
    800069ec:	b88080e7          	jalr	-1144(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    800069f0:	0184b503          	ld	a0,24(s1)
    800069f4:	ffffb097          	auipc	ra,0xffffb
    800069f8:	b7c080e7          	jalr	-1156(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    800069fc:	0304b503          	ld	a0,48(s1)
    80006a00:	ffffb097          	auipc	ra,0xffffb
    80006a04:	b70080e7          	jalr	-1168(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006a08:	0284b503          	ld	a0,40(s1)
    80006a0c:	ffffb097          	auipc	ra,0xffffb
    80006a10:	b64080e7          	jalr	-1180(ra) # 80001570 <_Z9sem_closeP4KSem>
}
    80006a14:	01813083          	ld	ra,24(sp)
    80006a18:	01013403          	ld	s0,16(sp)
    80006a1c:	00813483          	ld	s1,8(sp)
    80006a20:	02010113          	addi	sp,sp,32
    80006a24:	00008067          	ret

0000000080006a28 <_Z6sumRowPv>:
    int len;
    int num;
};

void sumRow(void* rowd) {
    if (!rowd) return;
    80006a28:	0c050063          	beqz	a0,80006ae8 <_Z6sumRowPv+0xc0>
void sumRow(void* rowd) {
    80006a2c:	fd010113          	addi	sp,sp,-48
    80006a30:	02113423          	sd	ra,40(sp)
    80006a34:	02813023          	sd	s0,32(sp)
    80006a38:	00913c23          	sd	s1,24(sp)
    80006a3c:	03010413          	addi	s0,sp,48
    rowdesc rd = *(rowdesc*)rowd;
    80006a40:	00053783          	ld	a5,0(a0)
    80006a44:	fcf43823          	sd	a5,-48(s0)
    80006a48:	00853783          	ld	a5,8(a0)
    80006a4c:	fcf43c23          	sd	a5,-40(s0)
    uint64 sum = 0;
    for (int i = 0; i < rd.len; i++) {
    80006a50:	00000793          	li	a5,0
    uint64 sum = 0;
    80006a54:	00000493          	li	s1,0
    for (int i = 0; i < rd.len; i++) {
    80006a58:	fd842703          	lw	a4,-40(s0)
    80006a5c:	02e7d063          	bge	a5,a4,80006a7c <_Z6sumRowPv+0x54>
        sum += rd.row[i];
    80006a60:	00379693          	slli	a3,a5,0x3
    80006a64:	fd043703          	ld	a4,-48(s0)
    80006a68:	00d70733          	add	a4,a4,a3
    80006a6c:	00073703          	ld	a4,0(a4)
    80006a70:	00e484b3          	add	s1,s1,a4
    for (int i = 0; i < rd.len; i++) {
    80006a74:	0017879b          	addiw	a5,a5,1
    80006a78:	fe1ff06f          	j	80006a58 <_Z6sumRowPv+0x30>
    }
    printString("Suma reda ");
    80006a7c:	00004517          	auipc	a0,0x4
    80006a80:	c3c50513          	addi	a0,a0,-964 # 8000a6b8 <CONSOLE_STATUS+0x6a8>
    80006a84:	fffff097          	auipc	ra,0xfffff
    80006a88:	d54080e7          	jalr	-684(ra) # 800057d8 <_Z11printStringPKc>
    printInt(rd.num);
    80006a8c:	00000613          	li	a2,0
    80006a90:	00a00593          	li	a1,10
    80006a94:	fdc42503          	lw	a0,-36(s0)
    80006a98:	fffff097          	auipc	ra,0xfffff
    80006a9c:	ef0080e7          	jalr	-272(ra) # 80005988 <_Z8printIntiii>
    printString(". = ");
    80006aa0:	00004517          	auipc	a0,0x4
    80006aa4:	c2850513          	addi	a0,a0,-984 # 8000a6c8 <CONSOLE_STATUS+0x6b8>
    80006aa8:	fffff097          	auipc	ra,0xfffff
    80006aac:	d30080e7          	jalr	-720(ra) # 800057d8 <_Z11printStringPKc>
    printInt(sum);
    80006ab0:	00000613          	li	a2,0
    80006ab4:	00a00593          	li	a1,10
    80006ab8:	0004851b          	sext.w	a0,s1
    80006abc:	fffff097          	auipc	ra,0xfffff
    80006ac0:	ecc080e7          	jalr	-308(ra) # 80005988 <_Z8printIntiii>
    printString("\n");
    80006ac4:	00004517          	auipc	a0,0x4
    80006ac8:	aac50513          	addi	a0,a0,-1364 # 8000a570 <CONSOLE_STATUS+0x560>
    80006acc:	fffff097          	auipc	ra,0xfffff
    80006ad0:	d0c080e7          	jalr	-756(ra) # 800057d8 <_Z11printStringPKc>
}
    80006ad4:	02813083          	ld	ra,40(sp)
    80006ad8:	02013403          	ld	s0,32(sp)
    80006adc:	01813483          	ld	s1,24(sp)
    80006ae0:	03010113          	addi	sp,sp,48
    80006ae4:	00008067          	ret
    80006ae8:	00008067          	ret

0000000080006aec <_ZL2f3Pv>:
static void f3(void* end) {
    80006aec:	fe010113          	addi	sp,sp,-32
    80006af0:	00113c23          	sd	ra,24(sp)
    80006af4:	00813823          	sd	s0,16(sp)
    80006af8:	00913423          	sd	s1,8(sp)
    80006afc:	01213023          	sd	s2,0(sp)
    80006b00:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t*)end);
    80006b04:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006b08:	00600493          	li	s1,6
    while (--i > 0) {
    80006b0c:	fff4849b          	addiw	s1,s1,-1
    80006b10:	04905463          	blez	s1,80006b58 <_ZL2f3Pv+0x6c>
        printString("Hello ");
    80006b14:	00004517          	auipc	a0,0x4
    80006b18:	b9450513          	addi	a0,a0,-1132 # 8000a6a8 <CONSOLE_STATUS+0x698>
    80006b1c:	fffff097          	auipc	ra,0xfffff
    80006b20:	cbc080e7          	jalr	-836(ra) # 800057d8 <_Z11printStringPKc>
        printInt(sleep_time);
    80006b24:	00000613          	li	a2,0
    80006b28:	00a00593          	li	a1,10
    80006b2c:	0009051b          	sext.w	a0,s2
    80006b30:	fffff097          	auipc	ra,0xfffff
    80006b34:	e58080e7          	jalr	-424(ra) # 80005988 <_Z8printIntiii>
        printString(" !\n");
    80006b38:	00004517          	auipc	a0,0x4
    80006b3c:	b7850513          	addi	a0,a0,-1160 # 8000a6b0 <CONSOLE_STATUS+0x6a0>
    80006b40:	fffff097          	auipc	ra,0xfffff
    80006b44:	c98080e7          	jalr	-872(ra) # 800057d8 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006b48:	00090513          	mv	a0,s2
    80006b4c:	ffffb097          	auipc	ra,0xffffb
    80006b50:	9bc080e7          	jalr	-1604(ra) # 80001508 <_Z10time_sleepm>
    while (--i > 0) {
    80006b54:	fb9ff06f          	j	80006b0c <_ZL2f3Pv+0x20>
}
    80006b58:	01813083          	ld	ra,24(sp)
    80006b5c:	01013403          	ld	s0,16(sp)
    80006b60:	00813483          	ld	s1,8(sp)
    80006b64:	00013903          	ld	s2,0(sp)
    80006b68:	02010113          	addi	sp,sp,32
    80006b6c:	00008067          	ret

0000000080006b70 <_Z4factm>:
    if (i <= 1) return 1;
    80006b70:	00100793          	li	a5,1
    80006b74:	04a7fa63          	bgeu	a5,a0,80006bc8 <_Z4factm+0x58>
uint64 fact(uint64 i) {
    80006b78:	fe010113          	addi	sp,sp,-32
    80006b7c:	00113c23          	sd	ra,24(sp)
    80006b80:	00813823          	sd	s0,16(sp)
    80006b84:	00913423          	sd	s1,8(sp)
    80006b88:	02010413          	addi	s0,sp,32
    80006b8c:	00050493          	mv	s1,a0
    if (i % 2) thread_dispatch();
    80006b90:	00157793          	andi	a5,a0,1
    80006b94:	02079463          	bnez	a5,80006bbc <_Z4factm+0x4c>
    return i * fact(i - 1);
    80006b98:	fff48513          	addi	a0,s1,-1
    80006b9c:	00000097          	auipc	ra,0x0
    80006ba0:	fd4080e7          	jalr	-44(ra) # 80006b70 <_Z4factm>
    80006ba4:	02a48533          	mul	a0,s1,a0
}
    80006ba8:	01813083          	ld	ra,24(sp)
    80006bac:	01013403          	ld	s0,16(sp)
    80006bb0:	00813483          	ld	s1,8(sp)
    80006bb4:	02010113          	addi	sp,sp,32
    80006bb8:	00008067          	ret
    if (i % 2) thread_dispatch();
    80006bbc:	ffffb097          	auipc	ra,0xffffb
    80006bc0:	904080e7          	jalr	-1788(ra) # 800014c0 <_Z15thread_dispatchv>
    80006bc4:	fd5ff06f          	j	80006b98 <_Z4factm+0x28>
    if (i <= 1) return 1;
    80006bc8:	00100513          	li	a0,1
}
    80006bcc:	00008067          	ret

0000000080006bd0 <_Z2f1Pv>:
void f1(void* end) {
    80006bd0:	fe010113          	addi	sp,sp,-32
    80006bd4:	00113c23          	sd	ra,24(sp)
    80006bd8:	00813823          	sd	s0,16(sp)
    80006bdc:	00913423          	sd	s1,8(sp)
    80006be0:	02010413          	addi	s0,sp,32
    uint64 i = fact(*(uint64*)end);
    80006be4:	00053503          	ld	a0,0(a0)
    80006be8:	00000097          	auipc	ra,0x0
    80006bec:	f88080e7          	jalr	-120(ra) # 80006b70 <_Z4factm>
    80006bf0:	00050493          	mv	s1,a0
    printString("f1: i=");
    80006bf4:	00004517          	auipc	a0,0x4
    80006bf8:	adc50513          	addi	a0,a0,-1316 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80006bfc:	fffff097          	auipc	ra,0xfffff
    80006c00:	bdc080e7          	jalr	-1060(ra) # 800057d8 <_Z11printStringPKc>
    printInt(i);
    80006c04:	00000613          	li	a2,0
    80006c08:	00a00593          	li	a1,10
    80006c0c:	0004851b          	sext.w	a0,s1
    80006c10:	fffff097          	auipc	ra,0xfffff
    80006c14:	d78080e7          	jalr	-648(ra) # 80005988 <_Z8printIntiii>
    printString("\nGotova nit 1\n");
    80006c18:	00004517          	auipc	a0,0x4
    80006c1c:	ac050513          	addi	a0,a0,-1344 # 8000a6d8 <CONSOLE_STATUS+0x6c8>
    80006c20:	fffff097          	auipc	ra,0xfffff
    80006c24:	bb8080e7          	jalr	-1096(ra) # 800057d8 <_Z11printStringPKc>
}
    80006c28:	01813083          	ld	ra,24(sp)
    80006c2c:	01013403          	ld	s0,16(sp)
    80006c30:	00813483          	ld	s1,8(sp)
    80006c34:	02010113          	addi	sp,sp,32
    80006c38:	00008067          	ret

0000000080006c3c <_Z2f2Pv>:
void f2(void* end) {
    80006c3c:	fe010113          	addi	sp,sp,-32
    80006c40:	00113c23          	sd	ra,24(sp)
    80006c44:	00813823          	sd	s0,16(sp)
    80006c48:	00913423          	sd	s1,8(sp)
    80006c4c:	02010413          	addi	s0,sp,32
    uint64 i = fact(20);
    80006c50:	01400513          	li	a0,20
    80006c54:	00000097          	auipc	ra,0x0
    80006c58:	f1c080e7          	jalr	-228(ra) # 80006b70 <_Z4factm>
    80006c5c:	00050493          	mv	s1,a0
    printString("f2: i=");
    80006c60:	00004517          	auipc	a0,0x4
    80006c64:	a8850513          	addi	a0,a0,-1400 # 8000a6e8 <CONSOLE_STATUS+0x6d8>
    80006c68:	fffff097          	auipc	ra,0xfffff
    80006c6c:	b70080e7          	jalr	-1168(ra) # 800057d8 <_Z11printStringPKc>
    printInt(i);
    80006c70:	00000613          	li	a2,0
    80006c74:	00a00593          	li	a1,10
    80006c78:	0004851b          	sext.w	a0,s1
    80006c7c:	fffff097          	auipc	ra,0xfffff
    80006c80:	d0c080e7          	jalr	-756(ra) # 80005988 <_Z8printIntiii>
    printString("\nGotova nit 2\n");
    80006c84:	00004517          	auipc	a0,0x4
    80006c88:	a6c50513          	addi	a0,a0,-1428 # 8000a6f0 <CONSOLE_STATUS+0x6e0>
    80006c8c:	fffff097          	auipc	ra,0xfffff
    80006c90:	b4c080e7          	jalr	-1204(ra) # 800057d8 <_Z11printStringPKc>
}
    80006c94:	01813083          	ld	ra,24(sp)
    80006c98:	01013403          	ld	s0,16(sp)
    80006c9c:	00813483          	ld	s1,8(sp)
    80006ca0:	02010113          	addi	sp,sp,32
    80006ca4:	00008067          	ret

0000000080006ca8 <_Z4userPv>:

void user(void*) {
    80006ca8:	bd010113          	addi	sp,sp,-1072
    80006cac:	42113423          	sd	ra,1064(sp)
    80006cb0:	42813023          	sd	s0,1056(sp)
    80006cb4:	40913c23          	sd	s1,1048(sp)
    80006cb8:	41213823          	sd	s2,1040(sp)
    80006cbc:	43010413          	addi	s0,sp,1072
    const int dim = 10;
    uint64 matrix[dim][dim];
    for (int i = 0; i < dim; i++) {
    80006cc0:	00000913          	li	s2,0
    80006cc4:	09c0006f          	j	80006d60 <_Z4userPv+0xb8>
        for (int j = 0; j < dim; j++) {
            matrix[i][j] = ((i * 10 + j) * ((i+j) * j ^ i<<j)) % 100;
            printInt(matrix[i][j]);
            if (j == dim - 1) printString("\n");
    80006cc8:	00004517          	auipc	a0,0x4
    80006ccc:	8a850513          	addi	a0,a0,-1880 # 8000a570 <CONSOLE_STATUS+0x560>
    80006cd0:	fffff097          	auipc	ra,0xfffff
    80006cd4:	b08080e7          	jalr	-1272(ra) # 800057d8 <_Z11printStringPKc>
        for (int j = 0; j < dim; j++) {
    80006cd8:	0014849b          	addiw	s1,s1,1
    80006cdc:	00900793          	li	a5,9
    80006ce0:	0697ce63          	blt	a5,s1,80006d5c <_Z4userPv+0xb4>
            matrix[i][j] = ((i * 10 + j) * ((i+j) * j ^ i<<j)) % 100;
    80006ce4:	0029179b          	slliw	a5,s2,0x2
    80006ce8:	012787bb          	addw	a5,a5,s2
    80006cec:	0017951b          	slliw	a0,a5,0x1
    80006cf0:	0095053b          	addw	a0,a0,s1
    80006cf4:	009907bb          	addw	a5,s2,s1
    80006cf8:	029787bb          	mulw	a5,a5,s1
    80006cfc:	0099173b          	sllw	a4,s2,s1
    80006d00:	00e7c7b3          	xor	a5,a5,a4
    80006d04:	02f5053b          	mulw	a0,a0,a5
    80006d08:	06400793          	li	a5,100
    80006d0c:	02f5653b          	remw	a0,a0,a5
    80006d10:	00291713          	slli	a4,s2,0x2
    80006d14:	01270733          	add	a4,a4,s2
    80006d18:	00171793          	slli	a5,a4,0x1
    80006d1c:	009787b3          	add	a5,a5,s1
    80006d20:	00379793          	slli	a5,a5,0x3
    80006d24:	fe040713          	addi	a4,s0,-32
    80006d28:	00f707b3          	add	a5,a4,a5
    80006d2c:	cea7b023          	sd	a0,-800(a5)
            printInt(matrix[i][j]);
    80006d30:	00000613          	li	a2,0
    80006d34:	00a00593          	li	a1,10
    80006d38:	fffff097          	auipc	ra,0xfffff
    80006d3c:	c50080e7          	jalr	-944(ra) # 80005988 <_Z8printIntiii>
            if (j == dim - 1) printString("\n");
    80006d40:	00900793          	li	a5,9
    80006d44:	f8f482e3          	beq	s1,a5,80006cc8 <_Z4userPv+0x20>
            else printString(" ");
    80006d48:	00004517          	auipc	a0,0x4
    80006d4c:	9b850513          	addi	a0,a0,-1608 # 8000a700 <CONSOLE_STATUS+0x6f0>
    80006d50:	fffff097          	auipc	ra,0xfffff
    80006d54:	a88080e7          	jalr	-1400(ra) # 800057d8 <_Z11printStringPKc>
    80006d58:	f81ff06f          	j	80006cd8 <_Z4userPv+0x30>
    for (int i = 0; i < dim; i++) {
    80006d5c:	0019091b          	addiw	s2,s2,1
    80006d60:	00900793          	li	a5,9
    80006d64:	0127c663          	blt	a5,s2,80006d70 <_Z4userPv+0xc8>
        for (int j = 0; j < dim; j++) {
    80006d68:	00000493          	li	s1,0
    80006d6c:	f71ff06f          	j	80006cdc <_Z4userPv+0x34>
        }
    }
    thread_t handles[dim];
    rowdesc rds[dim];
    for (int i = 0; i < dim; i++) {
    80006d70:	00000493          	li	s1,0
    80006d74:	00900793          	li	a5,9
    80006d78:	0697c063          	blt	a5,s1,80006dd8 <_Z4userPv+0x130>

        rds[i].row = matrix[i];
    80006d7c:	00249793          	slli	a5,s1,0x2
    80006d80:	009787b3          	add	a5,a5,s1
    80006d84:	00479693          	slli	a3,a5,0x4
    80006d88:	cc040713          	addi	a4,s0,-832
    80006d8c:	00d70733          	add	a4,a4,a3
    80006d90:	00449693          	slli	a3,s1,0x4
    80006d94:	fe040793          	addi	a5,s0,-32
    80006d98:	00d787b3          	add	a5,a5,a3
    80006d9c:	bee7b823          	sd	a4,-1040(a5)
        rds[i].len = dim;
    80006da0:	00a00713          	li	a4,10
    80006da4:	bee7ac23          	sw	a4,-1032(a5)
        rds[i].num = i;
    80006da8:	be97ae23          	sw	s1,-1028(a5)
        thread_create(&handles[i], sumRow, &rds[i]);
    80006dac:	00349793          	slli	a5,s1,0x3
    80006db0:	bd040613          	addi	a2,s0,-1072
    80006db4:	00d60633          	add	a2,a2,a3
    80006db8:	00000597          	auipc	a1,0x0
    80006dbc:	c7058593          	addi	a1,a1,-912 # 80006a28 <_Z6sumRowPv>
    80006dc0:	c7040513          	addi	a0,s0,-912
    80006dc4:	00f50533          	add	a0,a0,a5
    80006dc8:	ffffa097          	auipc	ra,0xffffa
    80006dcc:	63c080e7          	jalr	1596(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < dim; i++) {
    80006dd0:	0014849b          	addiw	s1,s1,1
    80006dd4:	fa1ff06f          	j	80006d74 <_Z4userPv+0xcc>
    }
    for (int i = 0; i < dim; i++) {
    80006dd8:	00000493          	li	s1,0
    80006ddc:	00900793          	li	a5,9
    80006de0:	0297c263          	blt	a5,s1,80006e04 <_Z4userPv+0x15c>
        thread_join(handles[i]);
    80006de4:	00349793          	slli	a5,s1,0x3
    80006de8:	fe040713          	addi	a4,s0,-32
    80006dec:	00f707b3          	add	a5,a4,a5
    80006df0:	c907b503          	ld	a0,-880(a5)
    80006df4:	ffffa097          	auipc	ra,0xffffa
    80006df8:	6ec080e7          	jalr	1772(ra) # 800014e0 <_Z11thread_joinP3TCB>
    for (int i = 0; i < dim; i++) {
    80006dfc:	0014849b          	addiw	s1,s1,1
    80006e00:	fddff06f          	j	80006ddc <_Z4userPv+0x134>
    }
}
    80006e04:	42813083          	ld	ra,1064(sp)
    80006e08:	42013403          	ld	s0,1056(sp)
    80006e0c:	41813483          	ld	s1,1048(sp)
    80006e10:	41013903          	ld	s2,1040(sp)
    80006e14:	43010113          	addi	sp,sp,1072
    80006e18:	00008067          	ret

0000000080006e1c <_Z5user2Pv>:

void user2(void*) {
    80006e1c:	f9010113          	addi	sp,sp,-112
    80006e20:	06113423          	sd	ra,104(sp)
    80006e24:	06813023          	sd	s0,96(sp)
    80006e28:	04913c23          	sd	s1,88(sp)
    80006e2c:	07010413          	addi	s0,sp,112
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006e30:	00a00793          	li	a5,10
    80006e34:	fcf43823          	sd	a5,-48(s0)
    80006e38:	01400793          	li	a5,20
    80006e3c:	fcf43c23          	sd	a5,-40(s0)
    explicit timer1() : PeriodicThread(1) {}
    80006e40:	00100593          	li	a1,1
    80006e44:	f9040493          	addi	s1,s0,-112
    80006e48:	00048513          	mv	a0,s1
    80006e4c:	ffffc097          	auipc	ra,0xffffc
    80006e50:	d64080e7          	jalr	-668(ra) # 80002bb0 <_ZN14PeriodicThreadC1Em>
    80006e54:	00006797          	auipc	a5,0x6
    80006e58:	10478793          	addi	a5,a5,260 # 8000cf58 <_ZTV6timer1+0x10>
    80006e5c:	f8f43823          	sd	a5,-112(s0)
    80006e60:	fa042c23          	sw	zero,-72(s0)
    thread_t sleepyThread[sleepy_thread_count];
    timer1 t;
    t.start();
    80006e64:	00048513          	mv	a0,s1
    80006e68:	ffffc097          	auipc	ra,0xffffc
    80006e6c:	ad4080e7          	jalr	-1324(ra) # 8000293c <_ZN6Thread5startEv>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006e70:	00000493          	li	s1,0
    80006e74:	0080006f          	j	80006e7c <_Z5user2Pv+0x60>
    80006e78:	0014849b          	addiw	s1,s1,1
    80006e7c:	00100793          	li	a5,1
    80006e80:	0297c663          	blt	a5,s1,80006eac <_Z5user2Pv+0x90>
        thread_create(&sleepyThread[i], f3, sleep_times + i);
    80006e84:	00349513          	slli	a0,s1,0x3
    80006e88:	fd040613          	addi	a2,s0,-48
    80006e8c:	00a60633          	add	a2,a2,a0
    80006e90:	00000597          	auipc	a1,0x0
    80006e94:	c5c58593          	addi	a1,a1,-932 # 80006aec <_ZL2f3Pv>
    80006e98:	fc040793          	addi	a5,s0,-64
    80006e9c:	00a78533          	add	a0,a5,a0
    80006ea0:	ffffa097          	auipc	ra,0xffffa
    80006ea4:	564080e7          	jalr	1380(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    80006ea8:	fd1ff06f          	j	80006e78 <_Z5user2Pv+0x5c>
    }

    thread_join(sleepyThread[0]);
    80006eac:	fc043503          	ld	a0,-64(s0)
    80006eb0:	ffffa097          	auipc	ra,0xffffa
    80006eb4:	630080e7          	jalr	1584(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(sleepyThread[1]);
    80006eb8:	fc843503          	ld	a0,-56(s0)
    80006ebc:	ffffa097          	auipc	ra,0xffffa
    80006ec0:	624080e7          	jalr	1572(ra) # 800014e0 <_Z11thread_joinP3TCB>
    t.terminate();
    80006ec4:	f9040513          	addi	a0,s0,-112
    80006ec8:	ffffc097          	auipc	ra,0xffffc
    80006ecc:	cb8080e7          	jalr	-840(ra) # 80002b80 <_ZN14PeriodicThread9terminateEv>
    //t.join();
    printString("izlazim iz user 2\n");
    80006ed0:	00004517          	auipc	a0,0x4
    80006ed4:	83850513          	addi	a0,a0,-1992 # 8000a708 <CONSOLE_STATUS+0x6f8>
    80006ed8:	fffff097          	auipc	ra,0xfffff
    80006edc:	900080e7          	jalr	-1792(ra) # 800057d8 <_Z11printStringPKc>
private:
    sem_t myHandle;
};


class PeriodicThread : public Thread {
    80006ee0:	00006797          	auipc	a5,0x6
    80006ee4:	1207b783          	ld	a5,288(a5) # 8000d000 <_GLOBAL_OFFSET_TABLE_+0x38>
    80006ee8:	01078793          	addi	a5,a5,16
    80006eec:	f8f43823          	sd	a5,-112(s0)
    80006ef0:	f9040513          	addi	a0,s0,-112
    80006ef4:	ffffb097          	auipc	ra,0xffffb
    80006ef8:	7dc080e7          	jalr	2012(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80006efc:	06813083          	ld	ra,104(sp)
    80006f00:	06013403          	ld	s0,96(sp)
    80006f04:	05813483          	ld	s1,88(sp)
    80006f08:	07010113          	addi	sp,sp,112
    80006f0c:	00008067          	ret
    80006f10:	00050493          	mv	s1,a0
    80006f14:	00006797          	auipc	a5,0x6
    80006f18:	0ec7b783          	ld	a5,236(a5) # 8000d000 <_GLOBAL_OFFSET_TABLE_+0x38>
    80006f1c:	01078793          	addi	a5,a5,16
    80006f20:	f8f43823          	sd	a5,-112(s0)
    80006f24:	f9040513          	addi	a0,s0,-112
    80006f28:	ffffb097          	auipc	ra,0xffffb
    80006f2c:	7a8080e7          	jalr	1960(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80006f30:	00048513          	mv	a0,s1
    80006f34:	00007097          	auipc	ra,0x7
    80006f38:	414080e7          	jalr	1044(ra) # 8000e348 <_Unwind_Resume>

0000000080006f3c <_ZN6timer118periodicActivationEv>:
    void periodicActivation() override {
    80006f3c:	fe010113          	addi	sp,sp,-32
    80006f40:	00113c23          	sd	ra,24(sp)
    80006f44:	00813823          	sd	s0,16(sp)
    80006f48:	00913423          	sd	s1,8(sp)
    80006f4c:	02010413          	addi	s0,sp,32
    80006f50:	00050493          	mv	s1,a0
        printString("Tajmer: ");
    80006f54:	00003517          	auipc	a0,0x3
    80006f58:	7cc50513          	addi	a0,a0,1996 # 8000a720 <CONSOLE_STATUS+0x710>
    80006f5c:	fffff097          	auipc	ra,0xfffff
    80006f60:	87c080e7          	jalr	-1924(ra) # 800057d8 <_Z11printStringPKc>
        printInt(counter++);
    80006f64:	0284a503          	lw	a0,40(s1)
    80006f68:	0015079b          	addiw	a5,a0,1
    80006f6c:	02f4a423          	sw	a5,40(s1)
    80006f70:	00000613          	li	a2,0
    80006f74:	00a00593          	li	a1,10
    80006f78:	fffff097          	auipc	ra,0xfffff
    80006f7c:	a10080e7          	jalr	-1520(ra) # 80005988 <_Z8printIntiii>
        printString("\n");
    80006f80:	00003517          	auipc	a0,0x3
    80006f84:	5f050513          	addi	a0,a0,1520 # 8000a570 <CONSOLE_STATUS+0x560>
    80006f88:	fffff097          	auipc	ra,0xfffff
    80006f8c:	850080e7          	jalr	-1968(ra) # 800057d8 <_Z11printStringPKc>
    }
    80006f90:	01813083          	ld	ra,24(sp)
    80006f94:	01013403          	ld	s0,16(sp)
    80006f98:	00813483          	ld	s1,8(sp)
    80006f9c:	02010113          	addi	sp,sp,32
    80006fa0:	00008067          	ret

0000000080006fa4 <_ZN6timer1D1Ev>:
class timer1 : public PeriodicThread {
    80006fa4:	ff010113          	addi	sp,sp,-16
    80006fa8:	00113423          	sd	ra,8(sp)
    80006fac:	00813023          	sd	s0,0(sp)
    80006fb0:	01010413          	addi	s0,sp,16
    80006fb4:	00006797          	auipc	a5,0x6
    80006fb8:	04c7b783          	ld	a5,76(a5) # 8000d000 <_GLOBAL_OFFSET_TABLE_+0x38>
    80006fbc:	01078793          	addi	a5,a5,16
    80006fc0:	00f53023          	sd	a5,0(a0)
    80006fc4:	ffffb097          	auipc	ra,0xffffb
    80006fc8:	70c080e7          	jalr	1804(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80006fcc:	00813083          	ld	ra,8(sp)
    80006fd0:	00013403          	ld	s0,0(sp)
    80006fd4:	01010113          	addi	sp,sp,16
    80006fd8:	00008067          	ret

0000000080006fdc <_ZN6timer1D0Ev>:
    80006fdc:	fe010113          	addi	sp,sp,-32
    80006fe0:	00113c23          	sd	ra,24(sp)
    80006fe4:	00813823          	sd	s0,16(sp)
    80006fe8:	00913423          	sd	s1,8(sp)
    80006fec:	02010413          	addi	s0,sp,32
    80006ff0:	00050493          	mv	s1,a0
    80006ff4:	00006797          	auipc	a5,0x6
    80006ff8:	00c7b783          	ld	a5,12(a5) # 8000d000 <_GLOBAL_OFFSET_TABLE_+0x38>
    80006ffc:	01078793          	addi	a5,a5,16
    80007000:	00f53023          	sd	a5,0(a0)
    80007004:	ffffb097          	auipc	ra,0xffffb
    80007008:	6cc080e7          	jalr	1740(ra) # 800026d0 <_ZN6ThreadD1Ev>
    8000700c:	00048513          	mv	a0,s1
    80007010:	ffffb097          	auipc	ra,0xffffb
    80007014:	7c4080e7          	jalr	1988(ra) # 800027d4 <_ZdlPv>
    80007018:	01813083          	ld	ra,24(sp)
    8000701c:	01013403          	ld	s0,16(sp)
    80007020:	00813483          	ld	s1,8(sp)
    80007024:	02010113          	addi	sp,sp,32
    80007028:	00008067          	ret

000000008000702c <_Z7maincppv>:

void userMain();

void user(void*);
void user2(void*);
int maincpp() {
    8000702c:	fc010113          	addi	sp,sp,-64
    80007030:	02113c23          	sd	ra,56(sp)
    80007034:	02813823          	sd	s0,48(sp)
    80007038:	02913423          	sd	s1,40(sp)
    8000703c:	03213023          	sd	s2,32(sp)
    80007040:	01313c23          	sd	s3,24(sp)
    80007044:	04010413          	addi	s0,sp,64
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80007048:	00006797          	auipc	a5,0x6
    8000704c:	0087b783          	ld	a5,8(a5) # 8000d050 <_GLOBAL_OFFSET_TABLE_+0x88>
    80007050:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80007054:	ffffb097          	auipc	ra,0xffffb
    80007058:	b8c080e7          	jalr	-1140(ra) # 80001be0 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    8000705c:	ffffa097          	auipc	ra,0xffffa
    80007060:	5f4080e7          	jalr	1524(ra) # 80001650 <_ZN8KConsole12initKConsoleEv>

    //pravljenje niti
    thread_t mainHandle;
    Thread* idleHandle = new IdleThread();
    80007064:	02000513          	li	a0,32
    80007068:	ffffb097          	auipc	ra,0xffffb
    8000706c:	71c080e7          	jalr	1820(ra) # 80002784 <_Znwm>
    80007070:	00050913          	mv	s2,a0
    80007074:	00053023          	sd	zero,0(a0)
    80007078:	00053423          	sd	zero,8(a0)
    8000707c:	00053823          	sd	zero,16(a0)
    80007080:	00053c23          	sd	zero,24(a0)
class IdleThread : public Thread {
    80007084:	ffffc097          	auipc	ra,0xffffc
    80007088:	9f0080e7          	jalr	-1552(ra) # 80002a74 <_ZN6ThreadC1Ev>
    8000708c:	00006797          	auipc	a5,0x6
    80007090:	efc78793          	addi	a5,a5,-260 # 8000cf88 <_ZTV10IdleThread+0x10>
    80007094:	00f93023          	sd	a5,0(s2)
    Thread* consoleOutputHandle = new KernelConsumer();
    80007098:	02000513          	li	a0,32
    8000709c:	ffffb097          	auipc	ra,0xffffb
    800070a0:	6e8080e7          	jalr	1768(ra) # 80002784 <_Znwm>
    800070a4:	00050493          	mv	s1,a0
    800070a8:	00053023          	sd	zero,0(a0)
    800070ac:	00053423          	sd	zero,8(a0)
    800070b0:	00053823          	sd	zero,16(a0)
    800070b4:	00053c23          	sd	zero,24(a0)
class KernelConsumer : public Thread {
    800070b8:	ffffc097          	auipc	ra,0xffffc
    800070bc:	9bc080e7          	jalr	-1604(ra) # 80002a74 <_ZN6ThreadC1Ev>
    800070c0:	00006797          	auipc	a5,0x6
    800070c4:	ef078793          	addi	a5,a5,-272 # 8000cfb0 <_ZTV14KernelConsumer+0x10>
    800070c8:	00f4b023          	sd	a5,0(s1)
    Thread* userThr = new Thread((TCB::Body)userMain, nullptr);
    800070cc:	02000513          	li	a0,32
    800070d0:	ffffb097          	auipc	ra,0xffffb
    800070d4:	6b4080e7          	jalr	1716(ra) # 80002784 <_Znwm>
    800070d8:	00050993          	mv	s3,a0
    800070dc:	00000613          	li	a2,0
    800070e0:	00006597          	auipc	a1,0x6
    800070e4:	ef05b583          	ld	a1,-272(a1) # 8000cfd0 <_GLOBAL_OFFSET_TABLE_+0x8>
    800070e8:	ffffb097          	auipc	ra,0xffffb
    800070ec:	7bc080e7          	jalr	1980(ra) # 800028a4 <_ZN6ThreadC1EPFvPvES0_>
    800070f0:	0580006f          	j	80007148 <_Z7maincppv+0x11c>
    800070f4:	00050493          	mv	s1,a0
    Thread* idleHandle = new IdleThread();
    800070f8:	00090513          	mv	a0,s2
    800070fc:	ffffb097          	auipc	ra,0xffffb
    80007100:	6d8080e7          	jalr	1752(ra) # 800027d4 <_ZdlPv>
    80007104:	00048513          	mv	a0,s1
    80007108:	00007097          	auipc	ra,0x7
    8000710c:	240080e7          	jalr	576(ra) # 8000e348 <_Unwind_Resume>
    80007110:	00050913          	mv	s2,a0
    Thread* consoleOutputHandle = new KernelConsumer();
    80007114:	00048513          	mv	a0,s1
    80007118:	ffffb097          	auipc	ra,0xffffb
    8000711c:	6bc080e7          	jalr	1724(ra) # 800027d4 <_ZdlPv>
    80007120:	00090513          	mv	a0,s2
    80007124:	00007097          	auipc	ra,0x7
    80007128:	224080e7          	jalr	548(ra) # 8000e348 <_Unwind_Resume>
    8000712c:	00050493          	mv	s1,a0
    Thread* userThr = new Thread((TCB::Body)userMain, nullptr);
    80007130:	00098513          	mv	a0,s3
    80007134:	ffffb097          	auipc	ra,0xffffb
    80007138:	6a0080e7          	jalr	1696(ra) # 800027d4 <_ZdlPv>
    8000713c:	00048513          	mv	a0,s1
    80007140:	00007097          	auipc	ra,0x7
    80007144:	208080e7          	jalr	520(ra) # 8000e348 <_Unwind_Resume>
    //Thread* userThr = new Thread(user, nullptr);
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    80007148:	00000613          	li	a2,0
    8000714c:	00006597          	auipc	a1,0x6
    80007150:	ee45b583          	ld	a1,-284(a1) # 8000d030 <_GLOBAL_OFFSET_TABLE_+0x68>
    80007154:	fc840513          	addi	a0,s0,-56
    80007158:	ffffa097          	auipc	ra,0xffffa
    8000715c:	2ac080e7          	jalr	684(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80007160:	fc843783          	ld	a5,-56(s0)

    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }
    80007164:	00006717          	auipc	a4,0x6
    80007168:	edc73703          	ld	a4,-292(a4) # 8000d040 <_GLOBAL_OFFSET_TABLE_+0x78>
    8000716c:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80007170:	00100713          	li	a4,1
    80007174:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    idleHandle->start();
    80007178:	00090513          	mv	a0,s2
    8000717c:	ffffb097          	auipc	ra,0xffffb
    80007180:	7c0080e7          	jalr	1984(ra) # 8000293c <_ZN6Thread5startEv>
    consoleOutputHandle->start();
    80007184:	00048513          	mv	a0,s1
    80007188:	ffffb097          	auipc	ra,0xffffb
    8000718c:	7b4080e7          	jalr	1972(ra) # 8000293c <_ZN6Thread5startEv>
    userThr->start();
    80007190:	00098513          	mv	a0,s3
    80007194:	ffffb097          	auipc	ra,0xffffb
    80007198:	7a8080e7          	jalr	1960(ra) # 8000293c <_ZN6Thread5startEv>
inline void Riscv::mc_sip(uint64 mask) {
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    8000719c:	00200493          	li	s1,2
    800071a0:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    userThr->join();
    800071a4:	00098513          	mv	a0,s3
    800071a8:	ffffb097          	auipc	ra,0xffffb
    800071ac:	7dc080e7          	jalr	2012(ra) # 80002984 <_ZN6Thread4joinEv>
    //stavlja karakter u ulazni bafer; ako je bafer pun, ignorise se
    static void placeInInput(char c);

    //ispis svih preostalih karaktera u izlaznom baferu
    static void flush() {
        __asm__ volatile("li a0, 0x43");
    800071b0:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    800071b4:	00000073          	ecall
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800071b8:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    800071bc:	00000513          	li	a0,0
    800071c0:	03813083          	ld	ra,56(sp)
    800071c4:	03013403          	ld	s0,48(sp)
    800071c8:	02813483          	ld	s1,40(sp)
    800071cc:	02013903          	ld	s2,32(sp)
    800071d0:	01813983          	ld	s3,24(sp)
    800071d4:	04010113          	addi	sp,sp,64
    800071d8:	00008067          	ret

00000000800071dc <_ZN10IdleThread3runEv>:
    void run() override {
    800071dc:	ff010113          	addi	sp,sp,-16
    800071e0:	00113423          	sd	ra,8(sp)
    800071e4:	00813023          	sd	s0,0(sp)
    800071e8:	01010413          	addi	s0,sp,16
        while (1) { thread_dispatch(); }
    800071ec:	ffffa097          	auipc	ra,0xffffa
    800071f0:	2d4080e7          	jalr	724(ra) # 800014c0 <_Z15thread_dispatchv>
    800071f4:	ff9ff06f          	j	800071ec <_ZN10IdleThread3runEv+0x10>

00000000800071f8 <_ZN10IdleThreadD1Ev>:
class IdleThread : public Thread {
    800071f8:	ff010113          	addi	sp,sp,-16
    800071fc:	00113423          	sd	ra,8(sp)
    80007200:	00813023          	sd	s0,0(sp)
    80007204:	01010413          	addi	s0,sp,16
    80007208:	00006797          	auipc	a5,0x6
    8000720c:	d8078793          	addi	a5,a5,-640 # 8000cf88 <_ZTV10IdleThread+0x10>
    80007210:	00f53023          	sd	a5,0(a0)
    80007214:	ffffb097          	auipc	ra,0xffffb
    80007218:	4bc080e7          	jalr	1212(ra) # 800026d0 <_ZN6ThreadD1Ev>
    8000721c:	00813083          	ld	ra,8(sp)
    80007220:	00013403          	ld	s0,0(sp)
    80007224:	01010113          	addi	sp,sp,16
    80007228:	00008067          	ret

000000008000722c <_ZN10IdleThreadD0Ev>:
    8000722c:	fe010113          	addi	sp,sp,-32
    80007230:	00113c23          	sd	ra,24(sp)
    80007234:	00813823          	sd	s0,16(sp)
    80007238:	00913423          	sd	s1,8(sp)
    8000723c:	02010413          	addi	s0,sp,32
    80007240:	00050493          	mv	s1,a0
    80007244:	00006797          	auipc	a5,0x6
    80007248:	d4478793          	addi	a5,a5,-700 # 8000cf88 <_ZTV10IdleThread+0x10>
    8000724c:	00f53023          	sd	a5,0(a0)
    80007250:	ffffb097          	auipc	ra,0xffffb
    80007254:	480080e7          	jalr	1152(ra) # 800026d0 <_ZN6ThreadD1Ev>
    80007258:	00048513          	mv	a0,s1
    8000725c:	ffffb097          	auipc	ra,0xffffb
    80007260:	578080e7          	jalr	1400(ra) # 800027d4 <_ZdlPv>
    80007264:	01813083          	ld	ra,24(sp)
    80007268:	01013403          	ld	s0,16(sp)
    8000726c:	00813483          	ld	s1,8(sp)
    80007270:	02010113          	addi	sp,sp,32
    80007274:	00008067          	ret

0000000080007278 <_ZN14KernelConsumerD1Ev>:
class KernelConsumer : public Thread {
    80007278:	ff010113          	addi	sp,sp,-16
    8000727c:	00113423          	sd	ra,8(sp)
    80007280:	00813023          	sd	s0,0(sp)
    80007284:	01010413          	addi	s0,sp,16
    80007288:	00006797          	auipc	a5,0x6
    8000728c:	d2878793          	addi	a5,a5,-728 # 8000cfb0 <_ZTV14KernelConsumer+0x10>
    80007290:	00f53023          	sd	a5,0(a0)
    80007294:	ffffb097          	auipc	ra,0xffffb
    80007298:	43c080e7          	jalr	1084(ra) # 800026d0 <_ZN6ThreadD1Ev>
    8000729c:	00813083          	ld	ra,8(sp)
    800072a0:	00013403          	ld	s0,0(sp)
    800072a4:	01010113          	addi	sp,sp,16
    800072a8:	00008067          	ret

00000000800072ac <_ZN14KernelConsumerD0Ev>:
    800072ac:	fe010113          	addi	sp,sp,-32
    800072b0:	00113c23          	sd	ra,24(sp)
    800072b4:	00813823          	sd	s0,16(sp)
    800072b8:	00913423          	sd	s1,8(sp)
    800072bc:	02010413          	addi	s0,sp,32
    800072c0:	00050493          	mv	s1,a0
    800072c4:	00006797          	auipc	a5,0x6
    800072c8:	cec78793          	addi	a5,a5,-788 # 8000cfb0 <_ZTV14KernelConsumer+0x10>
    800072cc:	00f53023          	sd	a5,0(a0)
    800072d0:	ffffb097          	auipc	ra,0xffffb
    800072d4:	400080e7          	jalr	1024(ra) # 800026d0 <_ZN6ThreadD1Ev>
    800072d8:	00048513          	mv	a0,s1
    800072dc:	ffffb097          	auipc	ra,0xffffb
    800072e0:	4f8080e7          	jalr	1272(ra) # 800027d4 <_ZdlPv>
    800072e4:	01813083          	ld	ra,24(sp)
    800072e8:	01013403          	ld	s0,16(sp)
    800072ec:	00813483          	ld	s1,8(sp)
    800072f0:	02010113          	addi	sp,sp,32
    800072f4:	00008067          	ret

00000000800072f8 <_ZN14KernelConsumer3runEv>:
    void run() override {
    800072f8:	ff010113          	addi	sp,sp,-16
    800072fc:	00113423          	sd	ra,8(sp)
    80007300:	00813023          	sd	s0,0(sp)
    80007304:	01010413          	addi	s0,sp,16
    80007308:	0280006f          	j	80007330 <_ZN14KernelConsumer3runEv+0x38>

    static uint8 getSRvalue() { return *sr; }

    static uint8 getDRvalue() { return *dr; }

    static void setDRvalue(char c) { *dr = c; }
    8000730c:	00006797          	auipc	a5,0x6
    80007310:	d1c7b783          	ld	a5,-740(a5) # 8000d028 <_GLOBAL_OFFSET_TABLE_+0x60>
    80007314:	0007b783          	ld	a5,0(a5)
    80007318:	00a78023          	sb	a0,0(a5)
            sem_signal(KConsole::getOutputBufferHasSpace());
    8000731c:	00006797          	auipc	a5,0x6
    80007320:	d1c7b783          	ld	a5,-740(a5) # 8000d038 <_GLOBAL_OFFSET_TABLE_+0x70>
    80007324:	0007b503          	ld	a0,0(a5)
    80007328:	ffffa097          	auipc	ra,0xffffa
    8000732c:	2a8080e7          	jalr	680(ra) # 800015d0 <_Z10sem_signalP4KSem>
            char c = KConsole::getFromOutput();
    80007330:	ffffa097          	auipc	ra,0xffffa
    80007334:	3d8080e7          	jalr	984(ra) # 80001708 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    80007338:	00006797          	auipc	a5,0x6
    8000733c:	d387b783          	ld	a5,-712(a5) # 8000d070 <_GLOBAL_OFFSET_TABLE_+0xa8>
    80007340:	0007b783          	ld	a5,0(a5)
    80007344:	0007c783          	lbu	a5,0(a5)
            while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80007348:	0207f793          	andi	a5,a5,32
    8000734c:	fe0786e3          	beqz	a5,80007338 <_ZN14KernelConsumer3runEv+0x40>
    80007350:	fbdff06f          	j	8000730c <_ZN14KernelConsumer3runEv+0x14>

0000000080007354 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80007354:	fa010113          	addi	sp,sp,-96
    80007358:	04813c23          	sd	s0,88(sp)
    8000735c:	06010413          	addi	s0,sp,96
    80007360:	faa43423          	sd	a0,-88(s0)
    80007364:	00058793          	mv	a5,a1
    80007368:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    8000736c:	fa843783          	ld	a5,-88(s0)
    80007370:	00079663          	bnez	a5,8000737c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80007374:	00000793          	li	a5,0
    80007378:	2040006f          	j	8000757c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    8000737c:	fa843783          	ld	a5,-88(s0)
    80007380:	0067d713          	srli	a4,a5,0x6
    80007384:	fa843783          	ld	a5,-88(s0)
    80007388:	03f7f793          	andi	a5,a5,63
    8000738c:	00078663          	beqz	a5,80007398 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80007390:	00100793          	li	a5,1
    80007394:	0080006f          	j	8000739c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80007398:	00000793          	li	a5,0
    8000739c:	00e787b3          	add	a5,a5,a4
    800073a0:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    800073a4:	fc843783          	ld	a5,-56(s0)
    800073a8:	00679793          	slli	a5,a5,0x6
    800073ac:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    800073b0:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    800073b4:	00006797          	auipc	a5,0x6
    800073b8:	ebc78793          	addi	a5,a5,-324 # 8000d270 <_ZN15MemoryAllocator11freeMemHeadE>
    800073bc:	0007b783          	ld	a5,0(a5)
    800073c0:	fef43023          	sd	a5,-32(s0)
    800073c4:	fe043783          	ld	a5,-32(s0)
    800073c8:	1a078863          	beqz	a5,80007578 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    800073cc:	fe043783          	ld	a5,-32(s0)
    800073d0:	0087b783          	ld	a5,8(a5)
    800073d4:	fa843703          	ld	a4,-88(s0)
    800073d8:	18e7e263          	bltu	a5,a4,8000755c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    800073dc:	fe043703          	ld	a4,-32(s0)
    800073e0:	fa843783          	ld	a5,-88(s0)
    800073e4:	00f707b3          	add	a5,a4,a5
    800073e8:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    800073ec:	fe043783          	ld	a5,-32(s0)
    800073f0:	0087b703          	ld	a4,8(a5)
    800073f4:	fa843783          	ld	a5,-88(s0)
    800073f8:	40f707b3          	sub	a5,a4,a5
    800073fc:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80007400:	fb843703          	ld	a4,-72(s0)
    80007404:	02000793          	li	a5,32
    80007408:	04e7e463          	bltu	a5,a4,80007450 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    8000740c:	fa843703          	ld	a4,-88(s0)
    80007410:	fb843783          	ld	a5,-72(s0)
    80007414:	00f707b3          	add	a5,a4,a5
    80007418:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    8000741c:	fe843783          	ld	a5,-24(s0)
    80007420:	00078c63          	beqz	a5,80007438 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    80007424:	fe043783          	ld	a5,-32(s0)
    80007428:	0007b703          	ld	a4,0(a5)
    8000742c:	fe843783          	ld	a5,-24(s0)
    80007430:	00e7b023          	sd	a4,0(a5)
    80007434:	0600006f          	j	80007494 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    80007438:	fe043783          	ld	a5,-32(s0)
    8000743c:	0007b703          	ld	a4,0(a5)
    80007440:	00006797          	auipc	a5,0x6
    80007444:	e3078793          	addi	a5,a5,-464 # 8000d270 <_ZN15MemoryAllocator11freeMemHeadE>
    80007448:	00e7b023          	sd	a4,0(a5)
    8000744c:	0480006f          	j	80007494 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    80007450:	fc043783          	ld	a5,-64(s0)
    80007454:	fb843703          	ld	a4,-72(s0)
    80007458:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    8000745c:	fe043783          	ld	a5,-32(s0)
    80007460:	0007b703          	ld	a4,0(a5)
    80007464:	fc043783          	ld	a5,-64(s0)
    80007468:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    8000746c:	fe843783          	ld	a5,-24(s0)
    80007470:	00078a63          	beqz	a5,80007484 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    80007474:	fe843783          	ld	a5,-24(s0)
    80007478:	fc043703          	ld	a4,-64(s0)
    8000747c:	00e7b023          	sd	a4,0(a5)
    80007480:	0140006f          	j	80007494 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    80007484:	00006797          	auipc	a5,0x6
    80007488:	dec78793          	addi	a5,a5,-532 # 8000d270 <_ZN15MemoryAllocator11freeMemHeadE>
    8000748c:	fc043703          	ld	a4,-64(s0)
    80007490:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    80007494:	fe043783          	ld	a5,-32(s0)
    80007498:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    8000749c:	fb043783          	ld	a5,-80(s0)
    800074a0:	fa843703          	ld	a4,-88(s0)
    800074a4:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    800074a8:	fb043783          	ld	a5,-80(s0)
    800074ac:	fa442703          	lw	a4,-92(s0)
    800074b0:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    800074b4:	fb043783          	ld	a5,-80(s0)
    800074b8:	02078713          	addi	a4,a5,32
    800074bc:	fb043783          	ld	a5,-80(s0)
    800074c0:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    800074c4:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    800074c8:	00006797          	auipc	a5,0x6
    800074cc:	da078793          	addi	a5,a5,-608 # 8000d268 <_ZN15MemoryAllocator11usedMemHeadE>
    800074d0:	0007b783          	ld	a5,0(a5)
    800074d4:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    800074d8:	fd043783          	ld	a5,-48(s0)
    800074dc:	02078463          	beqz	a5,80007504 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    800074e0:	fd043703          	ld	a4,-48(s0)
    800074e4:	fb043783          	ld	a5,-80(s0)
    800074e8:	00f77e63          	bgeu	a4,a5,80007504 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    800074ec:	fd043783          	ld	a5,-48(s0)
    800074f0:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    800074f4:	fd043783          	ld	a5,-48(s0)
    800074f8:	0007b783          	ld	a5,0(a5)
    800074fc:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80007500:	fd9ff06f          	j	800074d8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    80007504:	fd843783          	ld	a5,-40(s0)
    80007508:	02079663          	bnez	a5,80007534 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    8000750c:	00006797          	auipc	a5,0x6
    80007510:	d5c78793          	addi	a5,a5,-676 # 8000d268 <_ZN15MemoryAllocator11usedMemHeadE>
    80007514:	0007b703          	ld	a4,0(a5)
    80007518:	fb043783          	ld	a5,-80(s0)
    8000751c:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    80007520:	00006797          	auipc	a5,0x6
    80007524:	d4878793          	addi	a5,a5,-696 # 8000d268 <_ZN15MemoryAllocator11usedMemHeadE>
    80007528:	fb043703          	ld	a4,-80(s0)
    8000752c:	00e7b023          	sd	a4,0(a5)
    80007530:	0200006f          	j	80007550 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    80007534:	fd843783          	ld	a5,-40(s0)
    80007538:	0007b703          	ld	a4,0(a5)
    8000753c:	fb043783          	ld	a5,-80(s0)
    80007540:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    80007544:	fd843783          	ld	a5,-40(s0)
    80007548:	fb043703          	ld	a4,-80(s0)
    8000754c:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    80007550:	fb043783          	ld	a5,-80(s0)
    80007554:	0187b783          	ld	a5,24(a5)
    80007558:	0240006f          	j	8000757c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    8000755c:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80007560:	fe043783          	ld	a5,-32(s0)
    80007564:	fef43423          	sd	a5,-24(s0)
    80007568:	fe043783          	ld	a5,-32(s0)
    8000756c:	0007b783          	ld	a5,0(a5)
    80007570:	fef43023          	sd	a5,-32(s0)
    80007574:	e51ff06f          	j	800073c4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    80007578:	00000793          	li	a5,0
}
    8000757c:	00078513          	mv	a0,a5
    80007580:	05813403          	ld	s0,88(sp)
    80007584:	06010113          	addi	sp,sp,96
    80007588:	00008067          	ret

000000008000758c <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    8000758c:	fb010113          	addi	sp,sp,-80
    80007590:	04113423          	sd	ra,72(sp)
    80007594:	04813023          	sd	s0,64(sp)
    80007598:	05010413          	addi	s0,sp,80
    8000759c:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    800075a0:	fb843783          	ld	a5,-72(s0)
    800075a4:	00079663          	bnez	a5,800075b0 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    800075a8:	00000793          	li	a5,0
    800075ac:	1740006f          	j	80007720 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    800075b0:	00006797          	auipc	a5,0x6
    800075b4:	cb878793          	addi	a5,a5,-840 # 8000d268 <_ZN15MemoryAllocator11usedMemHeadE>
    800075b8:	0007b783          	ld	a5,0(a5)
    800075bc:	00079663          	bnez	a5,800075c8 <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    800075c0:	fff00793          	li	a5,-1
    800075c4:	15c0006f          	j	80007720 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    800075c8:	fb843783          	ld	a5,-72(s0)
    800075cc:	fe078793          	addi	a5,a5,-32
    800075d0:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    800075d4:	00006797          	auipc	a5,0x6
    800075d8:	c9478793          	addi	a5,a5,-876 # 8000d268 <_ZN15MemoryAllocator11usedMemHeadE>
    800075dc:	0007b783          	ld	a5,0(a5)
    800075e0:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    800075e4:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    800075e8:	fe843783          	ld	a5,-24(s0)
    800075ec:	02078463          	beqz	a5,80007614 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    800075f0:	fe843703          	ld	a4,-24(s0)
    800075f4:	fb843783          	ld	a5,-72(s0)
    800075f8:	00f70e63          	beq	a4,a5,80007614 <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    800075fc:	fe843783          	ld	a5,-24(s0)
    80007600:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80007604:	fe843783          	ld	a5,-24(s0)
    80007608:	0007b783          	ld	a5,0(a5)
    8000760c:	fef43423          	sd	a5,-24(s0)
    80007610:	fd9ff06f          	j	800075e8 <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80007614:	fe843703          	ld	a4,-24(s0)
    80007618:	fb843783          	ld	a5,-72(s0)
    8000761c:	00f70663          	beq	a4,a5,80007628 <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80007620:	fff00793          	li	a5,-1
    80007624:	0fc0006f          	j	80007720 <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    80007628:	fe043783          	ld	a5,-32(s0)
    8000762c:	00078c63          	beqz	a5,80007644 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80007630:	fe843783          	ld	a5,-24(s0)
    80007634:	0007b703          	ld	a4,0(a5)
    80007638:	fe043783          	ld	a5,-32(s0)
    8000763c:	00e7b023          	sd	a4,0(a5)
    80007640:	0180006f          	j	80007658 <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    80007644:	fe843783          	ld	a5,-24(s0)
    80007648:	0007b703          	ld	a4,0(a5)
    8000764c:	00006797          	auipc	a5,0x6
    80007650:	c1c78793          	addi	a5,a5,-996 # 8000d268 <_ZN15MemoryAllocator11usedMemHeadE>
    80007654:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    80007658:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    8000765c:	00006797          	auipc	a5,0x6
    80007660:	c1478793          	addi	a5,a5,-1004 # 8000d270 <_ZN15MemoryAllocator11freeMemHeadE>
    80007664:	0007b783          	ld	a5,0(a5)
    80007668:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    8000766c:	fd043783          	ld	a5,-48(s0)
    80007670:	02078463          	beqz	a5,80007698 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80007674:	fd043703          	ld	a4,-48(s0)
    80007678:	fb843783          	ld	a5,-72(s0)
    8000767c:	00f77e63          	bgeu	a4,a5,80007698 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80007680:	fd043783          	ld	a5,-48(s0)
    80007684:	fcf43c23          	sd	a5,-40(s0)
    80007688:	fd043783          	ld	a5,-48(s0)
    8000768c:	0007b783          	ld	a5,0(a5)
    80007690:	fcf43823          	sd	a5,-48(s0)
    80007694:	fd9ff06f          	j	8000766c <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    80007698:	fb843783          	ld	a5,-72(s0)
    8000769c:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    800076a0:	fb843783          	ld	a5,-72(s0)
    800076a4:	0087b783          	ld	a5,8(a5)
    800076a8:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    800076ac:	fc843783          	ld	a5,-56(s0)
    800076b0:	fc043703          	ld	a4,-64(s0)
    800076b4:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    800076b8:	fd843783          	ld	a5,-40(s0)
    800076bc:	02078263          	beqz	a5,800076e0 <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    800076c0:	fd843783          	ld	a5,-40(s0)
    800076c4:	0007b703          	ld	a4,0(a5)
    800076c8:	fc843783          	ld	a5,-56(s0)
    800076cc:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    800076d0:	fd843783          	ld	a5,-40(s0)
    800076d4:	fc843703          	ld	a4,-56(s0)
    800076d8:	00e7b023          	sd	a4,0(a5)
    800076dc:	0280006f          	j	80007704 <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    800076e0:	00006797          	auipc	a5,0x6
    800076e4:	b9078793          	addi	a5,a5,-1136 # 8000d270 <_ZN15MemoryAllocator11freeMemHeadE>
    800076e8:	0007b703          	ld	a4,0(a5)
    800076ec:	fc843783          	ld	a5,-56(s0)
    800076f0:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    800076f4:	00006797          	auipc	a5,0x6
    800076f8:	b7c78793          	addi	a5,a5,-1156 # 8000d270 <_ZN15MemoryAllocator11freeMemHeadE>
    800076fc:	fc843703          	ld	a4,-56(s0)
    80007700:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    80007704:	fc843503          	ld	a0,-56(s0)
    80007708:	00000097          	auipc	ra,0x0
    8000770c:	02c080e7          	jalr	44(ra) # 80007734 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    80007710:	fd843503          	ld	a0,-40(s0)
    80007714:	00000097          	auipc	ra,0x0
    80007718:	020080e7          	jalr	32(ra) # 80007734 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    8000771c:	00000793          	li	a5,0
}
    80007720:	00078513          	mv	a0,a5
    80007724:	04813083          	ld	ra,72(sp)
    80007728:	04013403          	ld	s0,64(sp)
    8000772c:	05010113          	addi	sp,sp,80
    80007730:	00008067          	ret

0000000080007734 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80007734:	fc010113          	addi	sp,sp,-64
    80007738:	02813c23          	sd	s0,56(sp)
    8000773c:	04010413          	addi	s0,sp,64
    80007740:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    80007744:	fc843783          	ld	a5,-56(s0)
    80007748:	00079663          	bnez	a5,80007754 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    8000774c:	00000793          	li	a5,0
    80007750:	0a00006f          	j	800077f0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    80007754:	fc843783          	ld	a5,-56(s0)
    80007758:	0007b783          	ld	a5,0(a5)
    8000775c:	00f037b3          	snez	a5,a5
    80007760:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    80007764:	fc843783          	ld	a5,-56(s0)
    80007768:	0087b783          	ld	a5,8(a5)
    8000776c:	fc843703          	ld	a4,-56(s0)
    80007770:	00f707b3          	add	a5,a4,a5
    80007774:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    80007778:	fc843783          	ld	a5,-56(s0)
    8000777c:	0007b783          	ld	a5,0(a5)
    80007780:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    80007784:	fe043703          	ld	a4,-32(s0)
    80007788:	fd843783          	ld	a5,-40(s0)
    8000778c:	40f707b3          	sub	a5,a4,a5
    80007790:	0017b793          	seqz	a5,a5
    80007794:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    80007798:	fef44783          	lbu	a5,-17(s0)
    8000779c:	0ff7f793          	andi	a5,a5,255
    800077a0:	04078663          	beqz	a5,800077ec <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    800077a4:	fd744783          	lbu	a5,-41(s0)
    800077a8:	0ff7f793          	andi	a5,a5,255
    800077ac:	04078063          	beqz	a5,800077ec <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    800077b0:	fc843783          	ld	a5,-56(s0)
    800077b4:	0087b703          	ld	a4,8(a5)
    800077b8:	fc843783          	ld	a5,-56(s0)
    800077bc:	0007b783          	ld	a5,0(a5)
    800077c0:	0087b783          	ld	a5,8(a5)
    800077c4:	00f70733          	add	a4,a4,a5
    800077c8:	fc843783          	ld	a5,-56(s0)
    800077cc:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    800077d0:	fc843783          	ld	a5,-56(s0)
    800077d4:	0007b783          	ld	a5,0(a5)
    800077d8:	0007b703          	ld	a4,0(a5)
    800077dc:	fc843783          	ld	a5,-56(s0)
    800077e0:	00e7b023          	sd	a4,0(a5)
        return 1;
    800077e4:	00100793          	li	a5,1
    800077e8:	0080006f          	j	800077f0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    800077ec:	00000793          	li	a5,0
}
    800077f0:	00078513          	mv	a0,a5
    800077f4:	03813403          	ld	s0,56(sp)
    800077f8:	04010113          	addi	sp,sp,64
    800077fc:	00008067          	ret

0000000080007800 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80007800:	fe010113          	addi	sp,sp,-32
    80007804:	00813c23          	sd	s0,24(sp)
    80007808:	02010413          	addi	s0,sp,32
    8000780c:	fea43423          	sd	a0,-24(s0)
    80007810:	00058793          	mv	a5,a1
    80007814:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80007818:	fe843783          	ld	a5,-24(s0)
    8000781c:	fe078793          	addi	a5,a5,-32
    80007820:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    80007824:	fe843783          	ld	a5,-24(s0)
    80007828:	0107a703          	lw	a4,16(a5)
    8000782c:	fe442783          	lw	a5,-28(s0)
    80007830:	0007879b          	sext.w	a5,a5
    80007834:	40e787b3          	sub	a5,a5,a4
    80007838:	0017b793          	seqz	a5,a5
    8000783c:	0ff7f793          	andi	a5,a5,255
}
    80007840:	00078513          	mv	a0,a5
    80007844:	01813403          	ld	s0,24(sp)
    80007848:	02010113          	addi	sp,sp,32
    8000784c:	00008067          	ret

0000000080007850 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    80007850:	ff010113          	addi	sp,sp,-16
    80007854:	00813423          	sd	s0,8(sp)
    80007858:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    8000785c:	00006797          	auipc	a5,0x6
    80007860:	a1c78793          	addi	a5,a5,-1508 # 8000d278 <_ZN15MemoryAllocator11initializedE>
    80007864:	0007c783          	lbu	a5,0(a5)
    80007868:	0017c793          	xori	a5,a5,1
    8000786c:	0ff7f793          	andi	a5,a5,255
    80007870:	06078a63          	beqz	a5,800078e4 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    80007874:	00005797          	auipc	a5,0x5
    80007878:	7847b783          	ld	a5,1924(a5) # 8000cff8 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000787c:	0007b703          	ld	a4,0(a5)
    80007880:	00006797          	auipc	a5,0x6
    80007884:	9f078793          	addi	a5,a5,-1552 # 8000d270 <_ZN15MemoryAllocator11freeMemHeadE>
    80007888:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    8000788c:	00006797          	auipc	a5,0x6
    80007890:	9e478793          	addi	a5,a5,-1564 # 8000d270 <_ZN15MemoryAllocator11freeMemHeadE>
    80007894:	0007b783          	ld	a5,0(a5)
    80007898:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    8000789c:	00005797          	auipc	a5,0x5
    800078a0:	7ac7b783          	ld	a5,1964(a5) # 8000d048 <_GLOBAL_OFFSET_TABLE_+0x80>
    800078a4:	0007b703          	ld	a4,0(a5)
    800078a8:	00005797          	auipc	a5,0x5
    800078ac:	7507b783          	ld	a5,1872(a5) # 8000cff8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800078b0:	0007b783          	ld	a5,0(a5)
    800078b4:	40f70733          	sub	a4,a4,a5
    800078b8:	00006797          	auipc	a5,0x6
    800078bc:	9b878793          	addi	a5,a5,-1608 # 8000d270 <_ZN15MemoryAllocator11freeMemHeadE>
    800078c0:	0007b783          	ld	a5,0(a5)
    800078c4:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    800078c8:	00006797          	auipc	a5,0x6
    800078cc:	9a078793          	addi	a5,a5,-1632 # 8000d268 <_ZN15MemoryAllocator11usedMemHeadE>
    800078d0:	0007b023          	sd	zero,0(a5)

        initialized = true;
    800078d4:	00006797          	auipc	a5,0x6
    800078d8:	9a478793          	addi	a5,a5,-1628 # 8000d278 <_ZN15MemoryAllocator11initializedE>
    800078dc:	00100713          	li	a4,1
    800078e0:	00e78023          	sb	a4,0(a5)
    }
}
    800078e4:	00000013          	nop
    800078e8:	00813403          	ld	s0,8(sp)
    800078ec:	01010113          	addi	sp,sp,16
    800078f0:	00008067          	ret

00000000800078f4 <_Z13emptyFunctionPv>:
void idle(void*);

void kernelConsumerFunction(void*);


void emptyFunction(void*) {}
    800078f4:	ff010113          	addi	sp,sp,-16
    800078f8:	00813423          	sd	s0,8(sp)
    800078fc:	01010413          	addi	s0,sp,16
    80007900:	00813403          	ld	s0,8(sp)
    80007904:	01010113          	addi	sp,sp,16
    80007908:	00008067          	ret

000000008000790c <_Z5nit1fPv>:

void nit1f(void*) {
    8000790c:	fe010113          	addi	sp,sp,-32
    80007910:	00113c23          	sd	ra,24(sp)
    80007914:	00813823          	sd	s0,16(sp)
    80007918:	02010413          	addi	s0,sp,32
    while (true) {
        thread_t handle;
        thread_create(&handle, emptyFunction, nullptr);
    8000791c:	00000613          	li	a2,0
    80007920:	00000597          	auipc	a1,0x0
    80007924:	fd458593          	addi	a1,a1,-44 # 800078f4 <_Z13emptyFunctionPv>
    80007928:	fe840513          	addi	a0,s0,-24
    8000792c:	ffffa097          	auipc	ra,0xffffa
    80007930:	ad8080e7          	jalr	-1320(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    while (true) {
    80007934:	fe9ff06f          	j	8000791c <_Z5nit1fPv+0x10>

0000000080007938 <_Z5nit2fPv>:
    }

    printString("\nGotova nit 1\n");
}

void nit2f(void* arg2) {
    80007938:	ff010113          	addi	sp,sp,-16
    8000793c:	00113423          	sd	ra,8(sp)
    80007940:	00813023          	sd	s0,0(sp)
    80007944:	01010413          	addi	s0,sp,16
    printString("\nGotova nit 2\n");
    80007948:	00003517          	auipc	a0,0x3
    8000794c:	da850513          	addi	a0,a0,-600 # 8000a6f0 <CONSOLE_STATUS+0x6e0>
    80007950:	ffffe097          	auipc	ra,0xffffe
    80007954:	e88080e7          	jalr	-376(ra) # 800057d8 <_Z11printStringPKc>
}
    80007958:	00813083          	ld	ra,8(sp)
    8000795c:	00013403          	ld	s0,0(sp)
    80007960:	01010113          	addi	sp,sp,16
    80007964:	00008067          	ret

0000000080007968 <_Z5nit3fPv>:


void nit3f(void*) {
    80007968:	fe010113          	addi	sp,sp,-32
    8000796c:	00113c23          	sd	ra,24(sp)
    80007970:	00813823          	sd	s0,16(sp)
    80007974:	00913423          	sd	s1,8(sp)
    80007978:	02010413          	addi	s0,sp,32
    8000797c:	0180006f          	j	80007994 <_Z5nit3fPv+0x2c>
    char slovo;
    do {
        slovo = getc();
        putc(slovo);
        if (slovo == '\r') putc('\n');
    80007980:	00a00513          	li	a0,10
    80007984:	ffffa097          	auipc	ra,0xffffa
    80007988:	ca4080e7          	jalr	-860(ra) # 80001628 <_Z4putcc>
    } while (slovo != '0');
    8000798c:	03000793          	li	a5,48
    80007990:	02f48263          	beq	s1,a5,800079b4 <_Z5nit3fPv+0x4c>
        slovo = getc();
    80007994:	ffffa097          	auipc	ra,0xffffa
    80007998:	c6c080e7          	jalr	-916(ra) # 80001600 <_Z4getcv>
    8000799c:	00050493          	mv	s1,a0
        putc(slovo);
    800079a0:	ffffa097          	auipc	ra,0xffffa
    800079a4:	c88080e7          	jalr	-888(ra) # 80001628 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    800079a8:	00d00793          	li	a5,13
    800079ac:	fef490e3          	bne	s1,a5,8000798c <_Z5nit3fPv+0x24>
    800079b0:	fd1ff06f          	j	80007980 <_Z5nit3fPv+0x18>

    printString("\nGotova nit3\n");
    800079b4:	00003517          	auipc	a0,0x3
    800079b8:	d7c50513          	addi	a0,a0,-644 # 8000a730 <CONSOLE_STATUS+0x720>
    800079bc:	ffffe097          	auipc	ra,0xffffe
    800079c0:	e1c080e7          	jalr	-484(ra) # 800057d8 <_Z11printStringPKc>
}
    800079c4:	01813083          	ld	ra,24(sp)
    800079c8:	01013403          	ld	s0,16(sp)
    800079cc:	00813483          	ld	s1,8(sp)
    800079d0:	02010113          	addi	sp,sp,32
    800079d4:	00008067          	ret

00000000800079d8 <_Z5main5v>:


int main5() {
    800079d8:	fb010113          	addi	sp,sp,-80
    800079dc:	04113423          	sd	ra,72(sp)
    800079e0:	04813023          	sd	s0,64(sp)
    800079e4:	02913c23          	sd	s1,56(sp)
    800079e8:	05010413          	addi	s0,sp,80
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    800079ec:	00005797          	auipc	a5,0x5
    800079f0:	6647b783          	ld	a5,1636(a5) # 8000d050 <_GLOBAL_OFFSET_TABLE_+0x88>
    800079f4:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    800079f8:	ffffa097          	auipc	ra,0xffffa
    800079fc:	1e8080e7          	jalr	488(ra) # 80001be0 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80007a00:	ffffa097          	auipc	ra,0xffffa
    80007a04:	c50080e7          	jalr	-944(ra) # 80001650 <_ZN8KConsole12initKConsoleEv>

    //testiranje kreiranja niti
    thread_t glavnaNit = nullptr;
    80007a08:	fc043c23          	sd	zero,-40(s0)
    thread_t nit1 = nullptr;
    80007a0c:	fc043823          	sd	zero,-48(s0)
    thread_t nit2 = nullptr;
    80007a10:	fc043423          	sd	zero,-56(s0)
    thread_t nit3 = nullptr;
    80007a14:	fc043023          	sd	zero,-64(s0)
    thread_t idleNit = nullptr;
    80007a18:	fa043c23          	sd	zero,-72(s0)
    thread_t kernelConsumerThread = nullptr;
    80007a1c:	fa043823          	sd	zero,-80(s0)
    thread_create(&glavnaNit, (TCB::Body)main, nullptr);
    80007a20:	00000613          	li	a2,0
    80007a24:	00005597          	auipc	a1,0x5
    80007a28:	60c5b583          	ld	a1,1548(a1) # 8000d030 <_GLOBAL_OFFSET_TABLE_+0x68>
    80007a2c:	fd840513          	addi	a0,s0,-40
    80007a30:	ffffa097          	auipc	ra,0xffffa
    80007a34:	9d4080e7          	jalr	-1580(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    static void setRunning(TCB* newRunning) { running = newRunning; }
    80007a38:	fd843703          	ld	a4,-40(s0)
    80007a3c:	00005797          	auipc	a5,0x5
    80007a40:	6047b783          	ld	a5,1540(a5) # 8000d040 <_GLOBAL_OFFSET_TABLE_+0x78>
    80007a44:	00e7b023          	sd	a4,0(a5)
    TCB::setRunning(glavnaNit);
    thread_create(&idleNit, idle, nullptr);
    80007a48:	00000613          	li	a2,0
    80007a4c:	00005597          	auipc	a1,0x5
    80007a50:	6145b583          	ld	a1,1556(a1) # 8000d060 <_GLOBAL_OFFSET_TABLE_+0x98>
    80007a54:	fb840513          	addi	a0,s0,-72
    80007a58:	ffffa097          	auipc	ra,0xffffa
    80007a5c:	9ac080e7          	jalr	-1620(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    80007a60:	00000613          	li	a2,0
    80007a64:	00005597          	auipc	a1,0x5
    80007a68:	5a45b583          	ld	a1,1444(a1) # 8000d008 <_GLOBAL_OFFSET_TABLE_+0x40>
    80007a6c:	fb040513          	addi	a0,s0,-80
    80007a70:	ffffa097          	auipc	ra,0xffffa
    80007a74:	994080e7          	jalr	-1644(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>


    thread_create(&nit1, nit1f, nullptr);
    80007a78:	00000613          	li	a2,0
    80007a7c:	00000597          	auipc	a1,0x0
    80007a80:	e9058593          	addi	a1,a1,-368 # 8000790c <_Z5nit1fPv>
    80007a84:	fd040513          	addi	a0,s0,-48
    80007a88:	ffffa097          	auipc	ra,0xffffa
    80007a8c:	97c080e7          	jalr	-1668(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit2, nit2f, nullptr);
    80007a90:	00000613          	li	a2,0
    80007a94:	00000597          	auipc	a1,0x0
    80007a98:	ea458593          	addi	a1,a1,-348 # 80007938 <_Z5nit2fPv>
    80007a9c:	fc840513          	addi	a0,s0,-56
    80007aa0:	ffffa097          	auipc	ra,0xffffa
    80007aa4:	964080e7          	jalr	-1692(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit3, nit3f, nullptr);
    80007aa8:	00000613          	li	a2,0
    80007aac:	00000597          	auipc	a1,0x0
    80007ab0:	ebc58593          	addi	a1,a1,-324 # 80007968 <_Z5nit3fPv>
    80007ab4:	fc040513          	addi	a0,s0,-64
    80007ab8:	ffffa097          	auipc	ra,0xffffa
    80007abc:	94c080e7          	jalr	-1716(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80007ac0:	00200493          	li	s1,2
    80007ac4:	1004a073          	csrs	sstatus,s1

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    thread_join(nit1);
    80007ac8:	fd043503          	ld	a0,-48(s0)
    80007acc:	ffffa097          	auipc	ra,0xffffa
    80007ad0:	a14080e7          	jalr	-1516(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit2);
    80007ad4:	fc843503          	ld	a0,-56(s0)
    80007ad8:	ffffa097          	auipc	ra,0xffffa
    80007adc:	a08080e7          	jalr	-1528(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit3);
    80007ae0:	fc043503          	ld	a0,-64(s0)
    80007ae4:	ffffa097          	auipc	ra,0xffffa
    80007ae8:	9fc080e7          	jalr	-1540(ra) # 800014e0 <_Z11thread_joinP3TCB>
    //thread_join(idleNit);

    printString("\nGotove user niti\n");
    80007aec:	00003517          	auipc	a0,0x3
    80007af0:	c5450513          	addi	a0,a0,-940 # 8000a740 <CONSOLE_STATUS+0x730>
    80007af4:	ffffe097          	auipc	ra,0xffffe
    80007af8:	ce4080e7          	jalr	-796(ra) # 800057d8 <_Z11printStringPKc>

    printString("\nSad cu da izadjem\n");
    80007afc:	00003517          	auipc	a0,0x3
    80007b00:	c5c50513          	addi	a0,a0,-932 # 8000a758 <CONSOLE_STATUS+0x748>
    80007b04:	ffffe097          	auipc	ra,0xffffe
    80007b08:	cd4080e7          	jalr	-812(ra) # 800057d8 <_Z11printStringPKc>
        __asm__ volatile("li a0, 0x43");
    80007b0c:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80007b10:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80007b14:	1004b073          	csrc	sstatus,s1
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);


    return 0;
    80007b18:	00000513          	li	a0,0
    80007b1c:	04813083          	ld	ra,72(sp)
    80007b20:	04013403          	ld	s0,64(sp)
    80007b24:	03813483          	ld	s1,56(sp)
    80007b28:	05010113          	addi	sp,sp,80
    80007b2c:	00008067          	ret

0000000080007b30 <start>:
    80007b30:	ff010113          	addi	sp,sp,-16
    80007b34:	00813423          	sd	s0,8(sp)
    80007b38:	01010413          	addi	s0,sp,16
    80007b3c:	300027f3          	csrr	a5,mstatus
    80007b40:	ffffe737          	lui	a4,0xffffe
    80007b44:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff031f>
    80007b48:	00e7f7b3          	and	a5,a5,a4
    80007b4c:	00001737          	lui	a4,0x1
    80007b50:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80007b54:	00e7e7b3          	or	a5,a5,a4
    80007b58:	30079073          	csrw	mstatus,a5
    80007b5c:	00000797          	auipc	a5,0x0
    80007b60:	16078793          	addi	a5,a5,352 # 80007cbc <system_main>
    80007b64:	34179073          	csrw	mepc,a5
    80007b68:	00000793          	li	a5,0
    80007b6c:	18079073          	csrw	satp,a5
    80007b70:	000107b7          	lui	a5,0x10
    80007b74:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007b78:	30279073          	csrw	medeleg,a5
    80007b7c:	30379073          	csrw	mideleg,a5
    80007b80:	104027f3          	csrr	a5,sie
    80007b84:	2227e793          	ori	a5,a5,546
    80007b88:	10479073          	csrw	sie,a5
    80007b8c:	fff00793          	li	a5,-1
    80007b90:	00a7d793          	srli	a5,a5,0xa
    80007b94:	3b079073          	csrw	pmpaddr0,a5
    80007b98:	00f00793          	li	a5,15
    80007b9c:	3a079073          	csrw	pmpcfg0,a5
    80007ba0:	f14027f3          	csrr	a5,mhartid
    80007ba4:	0200c737          	lui	a4,0x200c
    80007ba8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007bac:	0007869b          	sext.w	a3,a5
    80007bb0:	00269713          	slli	a4,a3,0x2
    80007bb4:	000f4637          	lui	a2,0xf4
    80007bb8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007bbc:	00d70733          	add	a4,a4,a3
    80007bc0:	0037979b          	slliw	a5,a5,0x3
    80007bc4:	020046b7          	lui	a3,0x2004
    80007bc8:	00d787b3          	add	a5,a5,a3
    80007bcc:	00c585b3          	add	a1,a1,a2
    80007bd0:	00371693          	slli	a3,a4,0x3
    80007bd4:	00005717          	auipc	a4,0x5
    80007bd8:	6ac70713          	addi	a4,a4,1708 # 8000d280 <timer_scratch>
    80007bdc:	00b7b023          	sd	a1,0(a5)
    80007be0:	00d70733          	add	a4,a4,a3
    80007be4:	00f73c23          	sd	a5,24(a4)
    80007be8:	02c73023          	sd	a2,32(a4)
    80007bec:	34071073          	csrw	mscratch,a4
    80007bf0:	00000797          	auipc	a5,0x0
    80007bf4:	6e078793          	addi	a5,a5,1760 # 800082d0 <timervec>
    80007bf8:	30579073          	csrw	mtvec,a5
    80007bfc:	300027f3          	csrr	a5,mstatus
    80007c00:	0087e793          	ori	a5,a5,8
    80007c04:	30079073          	csrw	mstatus,a5
    80007c08:	304027f3          	csrr	a5,mie
    80007c0c:	0807e793          	ori	a5,a5,128
    80007c10:	30479073          	csrw	mie,a5
    80007c14:	f14027f3          	csrr	a5,mhartid
    80007c18:	0007879b          	sext.w	a5,a5
    80007c1c:	00078213          	mv	tp,a5
    80007c20:	30200073          	mret
    80007c24:	00813403          	ld	s0,8(sp)
    80007c28:	01010113          	addi	sp,sp,16
    80007c2c:	00008067          	ret

0000000080007c30 <timerinit>:
    80007c30:	ff010113          	addi	sp,sp,-16
    80007c34:	00813423          	sd	s0,8(sp)
    80007c38:	01010413          	addi	s0,sp,16
    80007c3c:	f14027f3          	csrr	a5,mhartid
    80007c40:	0200c737          	lui	a4,0x200c
    80007c44:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007c48:	0007869b          	sext.w	a3,a5
    80007c4c:	00269713          	slli	a4,a3,0x2
    80007c50:	000f4637          	lui	a2,0xf4
    80007c54:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007c58:	00d70733          	add	a4,a4,a3
    80007c5c:	0037979b          	slliw	a5,a5,0x3
    80007c60:	020046b7          	lui	a3,0x2004
    80007c64:	00d787b3          	add	a5,a5,a3
    80007c68:	00c585b3          	add	a1,a1,a2
    80007c6c:	00371693          	slli	a3,a4,0x3
    80007c70:	00005717          	auipc	a4,0x5
    80007c74:	61070713          	addi	a4,a4,1552 # 8000d280 <timer_scratch>
    80007c78:	00b7b023          	sd	a1,0(a5)
    80007c7c:	00d70733          	add	a4,a4,a3
    80007c80:	00f73c23          	sd	a5,24(a4)
    80007c84:	02c73023          	sd	a2,32(a4)
    80007c88:	34071073          	csrw	mscratch,a4
    80007c8c:	00000797          	auipc	a5,0x0
    80007c90:	64478793          	addi	a5,a5,1604 # 800082d0 <timervec>
    80007c94:	30579073          	csrw	mtvec,a5
    80007c98:	300027f3          	csrr	a5,mstatus
    80007c9c:	0087e793          	ori	a5,a5,8
    80007ca0:	30079073          	csrw	mstatus,a5
    80007ca4:	304027f3          	csrr	a5,mie
    80007ca8:	0807e793          	ori	a5,a5,128
    80007cac:	30479073          	csrw	mie,a5
    80007cb0:	00813403          	ld	s0,8(sp)
    80007cb4:	01010113          	addi	sp,sp,16
    80007cb8:	00008067          	ret

0000000080007cbc <system_main>:
    80007cbc:	fe010113          	addi	sp,sp,-32
    80007cc0:	00813823          	sd	s0,16(sp)
    80007cc4:	00913423          	sd	s1,8(sp)
    80007cc8:	00113c23          	sd	ra,24(sp)
    80007ccc:	02010413          	addi	s0,sp,32
    80007cd0:	00000097          	auipc	ra,0x0
    80007cd4:	0c4080e7          	jalr	196(ra) # 80007d94 <cpuid>
    80007cd8:	00005497          	auipc	s1,0x5
    80007cdc:	3b848493          	addi	s1,s1,952 # 8000d090 <started>
    80007ce0:	02050263          	beqz	a0,80007d04 <system_main+0x48>
    80007ce4:	0004a783          	lw	a5,0(s1)
    80007ce8:	0007879b          	sext.w	a5,a5
    80007cec:	fe078ce3          	beqz	a5,80007ce4 <system_main+0x28>
    80007cf0:	0ff0000f          	fence
    80007cf4:	00003517          	auipc	a0,0x3
    80007cf8:	aac50513          	addi	a0,a0,-1364 # 8000a7a0 <CONSOLE_STATUS+0x790>
    80007cfc:	00001097          	auipc	ra,0x1
    80007d00:	a70080e7          	jalr	-1424(ra) # 8000876c <panic>
    80007d04:	00001097          	auipc	ra,0x1
    80007d08:	9c4080e7          	jalr	-1596(ra) # 800086c8 <consoleinit>
    80007d0c:	00001097          	auipc	ra,0x1
    80007d10:	150080e7          	jalr	336(ra) # 80008e5c <printfinit>
    80007d14:	00003517          	auipc	a0,0x3
    80007d18:	85c50513          	addi	a0,a0,-1956 # 8000a570 <CONSOLE_STATUS+0x560>
    80007d1c:	00001097          	auipc	ra,0x1
    80007d20:	aac080e7          	jalr	-1364(ra) # 800087c8 <__printf>
    80007d24:	00003517          	auipc	a0,0x3
    80007d28:	a4c50513          	addi	a0,a0,-1460 # 8000a770 <CONSOLE_STATUS+0x760>
    80007d2c:	00001097          	auipc	ra,0x1
    80007d30:	a9c080e7          	jalr	-1380(ra) # 800087c8 <__printf>
    80007d34:	00003517          	auipc	a0,0x3
    80007d38:	83c50513          	addi	a0,a0,-1988 # 8000a570 <CONSOLE_STATUS+0x560>
    80007d3c:	00001097          	auipc	ra,0x1
    80007d40:	a8c080e7          	jalr	-1396(ra) # 800087c8 <__printf>
    80007d44:	00001097          	auipc	ra,0x1
    80007d48:	4a4080e7          	jalr	1188(ra) # 800091e8 <kinit>
    80007d4c:	00000097          	auipc	ra,0x0
    80007d50:	148080e7          	jalr	328(ra) # 80007e94 <trapinit>
    80007d54:	00000097          	auipc	ra,0x0
    80007d58:	16c080e7          	jalr	364(ra) # 80007ec0 <trapinithart>
    80007d5c:	00000097          	auipc	ra,0x0
    80007d60:	5b4080e7          	jalr	1460(ra) # 80008310 <plicinit>
    80007d64:	00000097          	auipc	ra,0x0
    80007d68:	5d4080e7          	jalr	1492(ra) # 80008338 <plicinithart>
    80007d6c:	00000097          	auipc	ra,0x0
    80007d70:	078080e7          	jalr	120(ra) # 80007de4 <userinit>
    80007d74:	0ff0000f          	fence
    80007d78:	00100793          	li	a5,1
    80007d7c:	00003517          	auipc	a0,0x3
    80007d80:	a0c50513          	addi	a0,a0,-1524 # 8000a788 <CONSOLE_STATUS+0x778>
    80007d84:	00f4a023          	sw	a5,0(s1)
    80007d88:	00001097          	auipc	ra,0x1
    80007d8c:	a40080e7          	jalr	-1472(ra) # 800087c8 <__printf>
    80007d90:	0000006f          	j	80007d90 <system_main+0xd4>

0000000080007d94 <cpuid>:
    80007d94:	ff010113          	addi	sp,sp,-16
    80007d98:	00813423          	sd	s0,8(sp)
    80007d9c:	01010413          	addi	s0,sp,16
    80007da0:	00020513          	mv	a0,tp
    80007da4:	00813403          	ld	s0,8(sp)
    80007da8:	0005051b          	sext.w	a0,a0
    80007dac:	01010113          	addi	sp,sp,16
    80007db0:	00008067          	ret

0000000080007db4 <mycpu>:
    80007db4:	ff010113          	addi	sp,sp,-16
    80007db8:	00813423          	sd	s0,8(sp)
    80007dbc:	01010413          	addi	s0,sp,16
    80007dc0:	00020793          	mv	a5,tp
    80007dc4:	00813403          	ld	s0,8(sp)
    80007dc8:	0007879b          	sext.w	a5,a5
    80007dcc:	00779793          	slli	a5,a5,0x7
    80007dd0:	00006517          	auipc	a0,0x6
    80007dd4:	4e050513          	addi	a0,a0,1248 # 8000e2b0 <cpus>
    80007dd8:	00f50533          	add	a0,a0,a5
    80007ddc:	01010113          	addi	sp,sp,16
    80007de0:	00008067          	ret

0000000080007de4 <userinit>:
    80007de4:	ff010113          	addi	sp,sp,-16
    80007de8:	00813423          	sd	s0,8(sp)
    80007dec:	01010413          	addi	s0,sp,16
    80007df0:	00813403          	ld	s0,8(sp)
    80007df4:	01010113          	addi	sp,sp,16
    80007df8:	ffffa317          	auipc	t1,0xffffa
    80007dfc:	fdc30067          	jr	-36(t1) # 80001dd4 <main>

0000000080007e00 <either_copyout>:
    80007e00:	ff010113          	addi	sp,sp,-16
    80007e04:	00813023          	sd	s0,0(sp)
    80007e08:	00113423          	sd	ra,8(sp)
    80007e0c:	01010413          	addi	s0,sp,16
    80007e10:	02051663          	bnez	a0,80007e3c <either_copyout+0x3c>
    80007e14:	00058513          	mv	a0,a1
    80007e18:	00060593          	mv	a1,a2
    80007e1c:	0006861b          	sext.w	a2,a3
    80007e20:	00002097          	auipc	ra,0x2
    80007e24:	c54080e7          	jalr	-940(ra) # 80009a74 <__memmove>
    80007e28:	00813083          	ld	ra,8(sp)
    80007e2c:	00013403          	ld	s0,0(sp)
    80007e30:	00000513          	li	a0,0
    80007e34:	01010113          	addi	sp,sp,16
    80007e38:	00008067          	ret
    80007e3c:	00003517          	auipc	a0,0x3
    80007e40:	98c50513          	addi	a0,a0,-1652 # 8000a7c8 <CONSOLE_STATUS+0x7b8>
    80007e44:	00001097          	auipc	ra,0x1
    80007e48:	928080e7          	jalr	-1752(ra) # 8000876c <panic>

0000000080007e4c <either_copyin>:
    80007e4c:	ff010113          	addi	sp,sp,-16
    80007e50:	00813023          	sd	s0,0(sp)
    80007e54:	00113423          	sd	ra,8(sp)
    80007e58:	01010413          	addi	s0,sp,16
    80007e5c:	02059463          	bnez	a1,80007e84 <either_copyin+0x38>
    80007e60:	00060593          	mv	a1,a2
    80007e64:	0006861b          	sext.w	a2,a3
    80007e68:	00002097          	auipc	ra,0x2
    80007e6c:	c0c080e7          	jalr	-1012(ra) # 80009a74 <__memmove>
    80007e70:	00813083          	ld	ra,8(sp)
    80007e74:	00013403          	ld	s0,0(sp)
    80007e78:	00000513          	li	a0,0
    80007e7c:	01010113          	addi	sp,sp,16
    80007e80:	00008067          	ret
    80007e84:	00003517          	auipc	a0,0x3
    80007e88:	96c50513          	addi	a0,a0,-1684 # 8000a7f0 <CONSOLE_STATUS+0x7e0>
    80007e8c:	00001097          	auipc	ra,0x1
    80007e90:	8e0080e7          	jalr	-1824(ra) # 8000876c <panic>

0000000080007e94 <trapinit>:
    80007e94:	ff010113          	addi	sp,sp,-16
    80007e98:	00813423          	sd	s0,8(sp)
    80007e9c:	01010413          	addi	s0,sp,16
    80007ea0:	00813403          	ld	s0,8(sp)
    80007ea4:	00003597          	auipc	a1,0x3
    80007ea8:	97458593          	addi	a1,a1,-1676 # 8000a818 <CONSOLE_STATUS+0x808>
    80007eac:	00006517          	auipc	a0,0x6
    80007eb0:	48450513          	addi	a0,a0,1156 # 8000e330 <tickslock>
    80007eb4:	01010113          	addi	sp,sp,16
    80007eb8:	00001317          	auipc	t1,0x1
    80007ebc:	5c030067          	jr	1472(t1) # 80009478 <initlock>

0000000080007ec0 <trapinithart>:
    80007ec0:	ff010113          	addi	sp,sp,-16
    80007ec4:	00813423          	sd	s0,8(sp)
    80007ec8:	01010413          	addi	s0,sp,16
    80007ecc:	00000797          	auipc	a5,0x0
    80007ed0:	2f478793          	addi	a5,a5,756 # 800081c0 <kernelvec>
    80007ed4:	10579073          	csrw	stvec,a5
    80007ed8:	00813403          	ld	s0,8(sp)
    80007edc:	01010113          	addi	sp,sp,16
    80007ee0:	00008067          	ret

0000000080007ee4 <usertrap>:
    80007ee4:	ff010113          	addi	sp,sp,-16
    80007ee8:	00813423          	sd	s0,8(sp)
    80007eec:	01010413          	addi	s0,sp,16
    80007ef0:	00813403          	ld	s0,8(sp)
    80007ef4:	01010113          	addi	sp,sp,16
    80007ef8:	00008067          	ret

0000000080007efc <usertrapret>:
    80007efc:	ff010113          	addi	sp,sp,-16
    80007f00:	00813423          	sd	s0,8(sp)
    80007f04:	01010413          	addi	s0,sp,16
    80007f08:	00813403          	ld	s0,8(sp)
    80007f0c:	01010113          	addi	sp,sp,16
    80007f10:	00008067          	ret

0000000080007f14 <kerneltrap>:
    80007f14:	fe010113          	addi	sp,sp,-32
    80007f18:	00813823          	sd	s0,16(sp)
    80007f1c:	00113c23          	sd	ra,24(sp)
    80007f20:	00913423          	sd	s1,8(sp)
    80007f24:	02010413          	addi	s0,sp,32
    80007f28:	142025f3          	csrr	a1,scause
    80007f2c:	100027f3          	csrr	a5,sstatus
    80007f30:	0027f793          	andi	a5,a5,2
    80007f34:	10079c63          	bnez	a5,8000804c <kerneltrap+0x138>
    80007f38:	142027f3          	csrr	a5,scause
    80007f3c:	0207ce63          	bltz	a5,80007f78 <kerneltrap+0x64>
    80007f40:	00003517          	auipc	a0,0x3
    80007f44:	92050513          	addi	a0,a0,-1760 # 8000a860 <CONSOLE_STATUS+0x850>
    80007f48:	00001097          	auipc	ra,0x1
    80007f4c:	880080e7          	jalr	-1920(ra) # 800087c8 <__printf>
    80007f50:	141025f3          	csrr	a1,sepc
    80007f54:	14302673          	csrr	a2,stval
    80007f58:	00003517          	auipc	a0,0x3
    80007f5c:	91850513          	addi	a0,a0,-1768 # 8000a870 <CONSOLE_STATUS+0x860>
    80007f60:	00001097          	auipc	ra,0x1
    80007f64:	868080e7          	jalr	-1944(ra) # 800087c8 <__printf>
    80007f68:	00003517          	auipc	a0,0x3
    80007f6c:	92050513          	addi	a0,a0,-1760 # 8000a888 <CONSOLE_STATUS+0x878>
    80007f70:	00000097          	auipc	ra,0x0
    80007f74:	7fc080e7          	jalr	2044(ra) # 8000876c <panic>
    80007f78:	0ff7f713          	andi	a4,a5,255
    80007f7c:	00900693          	li	a3,9
    80007f80:	04d70063          	beq	a4,a3,80007fc0 <kerneltrap+0xac>
    80007f84:	fff00713          	li	a4,-1
    80007f88:	03f71713          	slli	a4,a4,0x3f
    80007f8c:	00170713          	addi	a4,a4,1
    80007f90:	fae798e3          	bne	a5,a4,80007f40 <kerneltrap+0x2c>
    80007f94:	00000097          	auipc	ra,0x0
    80007f98:	e00080e7          	jalr	-512(ra) # 80007d94 <cpuid>
    80007f9c:	06050663          	beqz	a0,80008008 <kerneltrap+0xf4>
    80007fa0:	144027f3          	csrr	a5,sip
    80007fa4:	ffd7f793          	andi	a5,a5,-3
    80007fa8:	14479073          	csrw	sip,a5
    80007fac:	01813083          	ld	ra,24(sp)
    80007fb0:	01013403          	ld	s0,16(sp)
    80007fb4:	00813483          	ld	s1,8(sp)
    80007fb8:	02010113          	addi	sp,sp,32
    80007fbc:	00008067          	ret
    80007fc0:	00000097          	auipc	ra,0x0
    80007fc4:	3c4080e7          	jalr	964(ra) # 80008384 <plic_claim>
    80007fc8:	00a00793          	li	a5,10
    80007fcc:	00050493          	mv	s1,a0
    80007fd0:	06f50863          	beq	a0,a5,80008040 <kerneltrap+0x12c>
    80007fd4:	fc050ce3          	beqz	a0,80007fac <kerneltrap+0x98>
    80007fd8:	00050593          	mv	a1,a0
    80007fdc:	00003517          	auipc	a0,0x3
    80007fe0:	86450513          	addi	a0,a0,-1948 # 8000a840 <CONSOLE_STATUS+0x830>
    80007fe4:	00000097          	auipc	ra,0x0
    80007fe8:	7e4080e7          	jalr	2020(ra) # 800087c8 <__printf>
    80007fec:	01013403          	ld	s0,16(sp)
    80007ff0:	01813083          	ld	ra,24(sp)
    80007ff4:	00048513          	mv	a0,s1
    80007ff8:	00813483          	ld	s1,8(sp)
    80007ffc:	02010113          	addi	sp,sp,32
    80008000:	00000317          	auipc	t1,0x0
    80008004:	3bc30067          	jr	956(t1) # 800083bc <plic_complete>
    80008008:	00006517          	auipc	a0,0x6
    8000800c:	32850513          	addi	a0,a0,808 # 8000e330 <tickslock>
    80008010:	00001097          	auipc	ra,0x1
    80008014:	48c080e7          	jalr	1164(ra) # 8000949c <acquire>
    80008018:	00005717          	auipc	a4,0x5
    8000801c:	07c70713          	addi	a4,a4,124 # 8000d094 <ticks>
    80008020:	00072783          	lw	a5,0(a4)
    80008024:	00006517          	auipc	a0,0x6
    80008028:	30c50513          	addi	a0,a0,780 # 8000e330 <tickslock>
    8000802c:	0017879b          	addiw	a5,a5,1
    80008030:	00f72023          	sw	a5,0(a4)
    80008034:	00001097          	auipc	ra,0x1
    80008038:	534080e7          	jalr	1332(ra) # 80009568 <release>
    8000803c:	f65ff06f          	j	80007fa0 <kerneltrap+0x8c>
    80008040:	00001097          	auipc	ra,0x1
    80008044:	090080e7          	jalr	144(ra) # 800090d0 <uartintr>
    80008048:	fa5ff06f          	j	80007fec <kerneltrap+0xd8>
    8000804c:	00002517          	auipc	a0,0x2
    80008050:	7d450513          	addi	a0,a0,2004 # 8000a820 <CONSOLE_STATUS+0x810>
    80008054:	00000097          	auipc	ra,0x0
    80008058:	718080e7          	jalr	1816(ra) # 8000876c <panic>

000000008000805c <clockintr>:
    8000805c:	fe010113          	addi	sp,sp,-32
    80008060:	00813823          	sd	s0,16(sp)
    80008064:	00913423          	sd	s1,8(sp)
    80008068:	00113c23          	sd	ra,24(sp)
    8000806c:	02010413          	addi	s0,sp,32
    80008070:	00006497          	auipc	s1,0x6
    80008074:	2c048493          	addi	s1,s1,704 # 8000e330 <tickslock>
    80008078:	00048513          	mv	a0,s1
    8000807c:	00001097          	auipc	ra,0x1
    80008080:	420080e7          	jalr	1056(ra) # 8000949c <acquire>
    80008084:	00005717          	auipc	a4,0x5
    80008088:	01070713          	addi	a4,a4,16 # 8000d094 <ticks>
    8000808c:	00072783          	lw	a5,0(a4)
    80008090:	01013403          	ld	s0,16(sp)
    80008094:	01813083          	ld	ra,24(sp)
    80008098:	00048513          	mv	a0,s1
    8000809c:	0017879b          	addiw	a5,a5,1
    800080a0:	00813483          	ld	s1,8(sp)
    800080a4:	00f72023          	sw	a5,0(a4)
    800080a8:	02010113          	addi	sp,sp,32
    800080ac:	00001317          	auipc	t1,0x1
    800080b0:	4bc30067          	jr	1212(t1) # 80009568 <release>

00000000800080b4 <devintr>:
    800080b4:	142027f3          	csrr	a5,scause
    800080b8:	00000513          	li	a0,0
    800080bc:	0007c463          	bltz	a5,800080c4 <devintr+0x10>
    800080c0:	00008067          	ret
    800080c4:	fe010113          	addi	sp,sp,-32
    800080c8:	00813823          	sd	s0,16(sp)
    800080cc:	00113c23          	sd	ra,24(sp)
    800080d0:	00913423          	sd	s1,8(sp)
    800080d4:	02010413          	addi	s0,sp,32
    800080d8:	0ff7f713          	andi	a4,a5,255
    800080dc:	00900693          	li	a3,9
    800080e0:	04d70c63          	beq	a4,a3,80008138 <devintr+0x84>
    800080e4:	fff00713          	li	a4,-1
    800080e8:	03f71713          	slli	a4,a4,0x3f
    800080ec:	00170713          	addi	a4,a4,1
    800080f0:	00e78c63          	beq	a5,a4,80008108 <devintr+0x54>
    800080f4:	01813083          	ld	ra,24(sp)
    800080f8:	01013403          	ld	s0,16(sp)
    800080fc:	00813483          	ld	s1,8(sp)
    80008100:	02010113          	addi	sp,sp,32
    80008104:	00008067          	ret
    80008108:	00000097          	auipc	ra,0x0
    8000810c:	c8c080e7          	jalr	-884(ra) # 80007d94 <cpuid>
    80008110:	06050663          	beqz	a0,8000817c <devintr+0xc8>
    80008114:	144027f3          	csrr	a5,sip
    80008118:	ffd7f793          	andi	a5,a5,-3
    8000811c:	14479073          	csrw	sip,a5
    80008120:	01813083          	ld	ra,24(sp)
    80008124:	01013403          	ld	s0,16(sp)
    80008128:	00813483          	ld	s1,8(sp)
    8000812c:	00200513          	li	a0,2
    80008130:	02010113          	addi	sp,sp,32
    80008134:	00008067          	ret
    80008138:	00000097          	auipc	ra,0x0
    8000813c:	24c080e7          	jalr	588(ra) # 80008384 <plic_claim>
    80008140:	00a00793          	li	a5,10
    80008144:	00050493          	mv	s1,a0
    80008148:	06f50663          	beq	a0,a5,800081b4 <devintr+0x100>
    8000814c:	00100513          	li	a0,1
    80008150:	fa0482e3          	beqz	s1,800080f4 <devintr+0x40>
    80008154:	00048593          	mv	a1,s1
    80008158:	00002517          	auipc	a0,0x2
    8000815c:	6e850513          	addi	a0,a0,1768 # 8000a840 <CONSOLE_STATUS+0x830>
    80008160:	00000097          	auipc	ra,0x0
    80008164:	668080e7          	jalr	1640(ra) # 800087c8 <__printf>
    80008168:	00048513          	mv	a0,s1
    8000816c:	00000097          	auipc	ra,0x0
    80008170:	250080e7          	jalr	592(ra) # 800083bc <plic_complete>
    80008174:	00100513          	li	a0,1
    80008178:	f7dff06f          	j	800080f4 <devintr+0x40>
    8000817c:	00006517          	auipc	a0,0x6
    80008180:	1b450513          	addi	a0,a0,436 # 8000e330 <tickslock>
    80008184:	00001097          	auipc	ra,0x1
    80008188:	318080e7          	jalr	792(ra) # 8000949c <acquire>
    8000818c:	00005717          	auipc	a4,0x5
    80008190:	f0870713          	addi	a4,a4,-248 # 8000d094 <ticks>
    80008194:	00072783          	lw	a5,0(a4)
    80008198:	00006517          	auipc	a0,0x6
    8000819c:	19850513          	addi	a0,a0,408 # 8000e330 <tickslock>
    800081a0:	0017879b          	addiw	a5,a5,1
    800081a4:	00f72023          	sw	a5,0(a4)
    800081a8:	00001097          	auipc	ra,0x1
    800081ac:	3c0080e7          	jalr	960(ra) # 80009568 <release>
    800081b0:	f65ff06f          	j	80008114 <devintr+0x60>
    800081b4:	00001097          	auipc	ra,0x1
    800081b8:	f1c080e7          	jalr	-228(ra) # 800090d0 <uartintr>
    800081bc:	fadff06f          	j	80008168 <devintr+0xb4>

00000000800081c0 <kernelvec>:
    800081c0:	f0010113          	addi	sp,sp,-256
    800081c4:	00113023          	sd	ra,0(sp)
    800081c8:	00213423          	sd	sp,8(sp)
    800081cc:	00313823          	sd	gp,16(sp)
    800081d0:	00413c23          	sd	tp,24(sp)
    800081d4:	02513023          	sd	t0,32(sp)
    800081d8:	02613423          	sd	t1,40(sp)
    800081dc:	02713823          	sd	t2,48(sp)
    800081e0:	02813c23          	sd	s0,56(sp)
    800081e4:	04913023          	sd	s1,64(sp)
    800081e8:	04a13423          	sd	a0,72(sp)
    800081ec:	04b13823          	sd	a1,80(sp)
    800081f0:	04c13c23          	sd	a2,88(sp)
    800081f4:	06d13023          	sd	a3,96(sp)
    800081f8:	06e13423          	sd	a4,104(sp)
    800081fc:	06f13823          	sd	a5,112(sp)
    80008200:	07013c23          	sd	a6,120(sp)
    80008204:	09113023          	sd	a7,128(sp)
    80008208:	09213423          	sd	s2,136(sp)
    8000820c:	09313823          	sd	s3,144(sp)
    80008210:	09413c23          	sd	s4,152(sp)
    80008214:	0b513023          	sd	s5,160(sp)
    80008218:	0b613423          	sd	s6,168(sp)
    8000821c:	0b713823          	sd	s7,176(sp)
    80008220:	0b813c23          	sd	s8,184(sp)
    80008224:	0d913023          	sd	s9,192(sp)
    80008228:	0da13423          	sd	s10,200(sp)
    8000822c:	0db13823          	sd	s11,208(sp)
    80008230:	0dc13c23          	sd	t3,216(sp)
    80008234:	0fd13023          	sd	t4,224(sp)
    80008238:	0fe13423          	sd	t5,232(sp)
    8000823c:	0ff13823          	sd	t6,240(sp)
    80008240:	cd5ff0ef          	jal	ra,80007f14 <kerneltrap>
    80008244:	00013083          	ld	ra,0(sp)
    80008248:	00813103          	ld	sp,8(sp)
    8000824c:	01013183          	ld	gp,16(sp)
    80008250:	02013283          	ld	t0,32(sp)
    80008254:	02813303          	ld	t1,40(sp)
    80008258:	03013383          	ld	t2,48(sp)
    8000825c:	03813403          	ld	s0,56(sp)
    80008260:	04013483          	ld	s1,64(sp)
    80008264:	04813503          	ld	a0,72(sp)
    80008268:	05013583          	ld	a1,80(sp)
    8000826c:	05813603          	ld	a2,88(sp)
    80008270:	06013683          	ld	a3,96(sp)
    80008274:	06813703          	ld	a4,104(sp)
    80008278:	07013783          	ld	a5,112(sp)
    8000827c:	07813803          	ld	a6,120(sp)
    80008280:	08013883          	ld	a7,128(sp)
    80008284:	08813903          	ld	s2,136(sp)
    80008288:	09013983          	ld	s3,144(sp)
    8000828c:	09813a03          	ld	s4,152(sp)
    80008290:	0a013a83          	ld	s5,160(sp)
    80008294:	0a813b03          	ld	s6,168(sp)
    80008298:	0b013b83          	ld	s7,176(sp)
    8000829c:	0b813c03          	ld	s8,184(sp)
    800082a0:	0c013c83          	ld	s9,192(sp)
    800082a4:	0c813d03          	ld	s10,200(sp)
    800082a8:	0d013d83          	ld	s11,208(sp)
    800082ac:	0d813e03          	ld	t3,216(sp)
    800082b0:	0e013e83          	ld	t4,224(sp)
    800082b4:	0e813f03          	ld	t5,232(sp)
    800082b8:	0f013f83          	ld	t6,240(sp)
    800082bc:	10010113          	addi	sp,sp,256
    800082c0:	10200073          	sret
    800082c4:	00000013          	nop
    800082c8:	00000013          	nop
    800082cc:	00000013          	nop

00000000800082d0 <timervec>:
    800082d0:	34051573          	csrrw	a0,mscratch,a0
    800082d4:	00b53023          	sd	a1,0(a0)
    800082d8:	00c53423          	sd	a2,8(a0)
    800082dc:	00d53823          	sd	a3,16(a0)
    800082e0:	01853583          	ld	a1,24(a0)
    800082e4:	02053603          	ld	a2,32(a0)
    800082e8:	0005b683          	ld	a3,0(a1)
    800082ec:	00c686b3          	add	a3,a3,a2
    800082f0:	00d5b023          	sd	a3,0(a1)
    800082f4:	00200593          	li	a1,2
    800082f8:	14459073          	csrw	sip,a1
    800082fc:	01053683          	ld	a3,16(a0)
    80008300:	00853603          	ld	a2,8(a0)
    80008304:	00053583          	ld	a1,0(a0)
    80008308:	34051573          	csrrw	a0,mscratch,a0
    8000830c:	30200073          	mret

0000000080008310 <plicinit>:
    80008310:	ff010113          	addi	sp,sp,-16
    80008314:	00813423          	sd	s0,8(sp)
    80008318:	01010413          	addi	s0,sp,16
    8000831c:	00813403          	ld	s0,8(sp)
    80008320:	0c0007b7          	lui	a5,0xc000
    80008324:	00100713          	li	a4,1
    80008328:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000832c:	00e7a223          	sw	a4,4(a5)
    80008330:	01010113          	addi	sp,sp,16
    80008334:	00008067          	ret

0000000080008338 <plicinithart>:
    80008338:	ff010113          	addi	sp,sp,-16
    8000833c:	00813023          	sd	s0,0(sp)
    80008340:	00113423          	sd	ra,8(sp)
    80008344:	01010413          	addi	s0,sp,16
    80008348:	00000097          	auipc	ra,0x0
    8000834c:	a4c080e7          	jalr	-1460(ra) # 80007d94 <cpuid>
    80008350:	0085171b          	slliw	a4,a0,0x8
    80008354:	0c0027b7          	lui	a5,0xc002
    80008358:	00e787b3          	add	a5,a5,a4
    8000835c:	40200713          	li	a4,1026
    80008360:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80008364:	00813083          	ld	ra,8(sp)
    80008368:	00013403          	ld	s0,0(sp)
    8000836c:	00d5151b          	slliw	a0,a0,0xd
    80008370:	0c2017b7          	lui	a5,0xc201
    80008374:	00a78533          	add	a0,a5,a0
    80008378:	00052023          	sw	zero,0(a0)
    8000837c:	01010113          	addi	sp,sp,16
    80008380:	00008067          	ret

0000000080008384 <plic_claim>:
    80008384:	ff010113          	addi	sp,sp,-16
    80008388:	00813023          	sd	s0,0(sp)
    8000838c:	00113423          	sd	ra,8(sp)
    80008390:	01010413          	addi	s0,sp,16
    80008394:	00000097          	auipc	ra,0x0
    80008398:	a00080e7          	jalr	-1536(ra) # 80007d94 <cpuid>
    8000839c:	00813083          	ld	ra,8(sp)
    800083a0:	00013403          	ld	s0,0(sp)
    800083a4:	00d5151b          	slliw	a0,a0,0xd
    800083a8:	0c2017b7          	lui	a5,0xc201
    800083ac:	00a78533          	add	a0,a5,a0
    800083b0:	00452503          	lw	a0,4(a0)
    800083b4:	01010113          	addi	sp,sp,16
    800083b8:	00008067          	ret

00000000800083bc <plic_complete>:
    800083bc:	fe010113          	addi	sp,sp,-32
    800083c0:	00813823          	sd	s0,16(sp)
    800083c4:	00913423          	sd	s1,8(sp)
    800083c8:	00113c23          	sd	ra,24(sp)
    800083cc:	02010413          	addi	s0,sp,32
    800083d0:	00050493          	mv	s1,a0
    800083d4:	00000097          	auipc	ra,0x0
    800083d8:	9c0080e7          	jalr	-1600(ra) # 80007d94 <cpuid>
    800083dc:	01813083          	ld	ra,24(sp)
    800083e0:	01013403          	ld	s0,16(sp)
    800083e4:	00d5179b          	slliw	a5,a0,0xd
    800083e8:	0c201737          	lui	a4,0xc201
    800083ec:	00f707b3          	add	a5,a4,a5
    800083f0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800083f4:	00813483          	ld	s1,8(sp)
    800083f8:	02010113          	addi	sp,sp,32
    800083fc:	00008067          	ret

0000000080008400 <consolewrite>:
    80008400:	fb010113          	addi	sp,sp,-80
    80008404:	04813023          	sd	s0,64(sp)
    80008408:	04113423          	sd	ra,72(sp)
    8000840c:	02913c23          	sd	s1,56(sp)
    80008410:	03213823          	sd	s2,48(sp)
    80008414:	03313423          	sd	s3,40(sp)
    80008418:	03413023          	sd	s4,32(sp)
    8000841c:	01513c23          	sd	s5,24(sp)
    80008420:	05010413          	addi	s0,sp,80
    80008424:	06c05c63          	blez	a2,8000849c <consolewrite+0x9c>
    80008428:	00060993          	mv	s3,a2
    8000842c:	00050a13          	mv	s4,a0
    80008430:	00058493          	mv	s1,a1
    80008434:	00000913          	li	s2,0
    80008438:	fff00a93          	li	s5,-1
    8000843c:	01c0006f          	j	80008458 <consolewrite+0x58>
    80008440:	fbf44503          	lbu	a0,-65(s0)
    80008444:	0019091b          	addiw	s2,s2,1
    80008448:	00148493          	addi	s1,s1,1
    8000844c:	00001097          	auipc	ra,0x1
    80008450:	a9c080e7          	jalr	-1380(ra) # 80008ee8 <uartputc>
    80008454:	03298063          	beq	s3,s2,80008474 <consolewrite+0x74>
    80008458:	00048613          	mv	a2,s1
    8000845c:	00100693          	li	a3,1
    80008460:	000a0593          	mv	a1,s4
    80008464:	fbf40513          	addi	a0,s0,-65
    80008468:	00000097          	auipc	ra,0x0
    8000846c:	9e4080e7          	jalr	-1564(ra) # 80007e4c <either_copyin>
    80008470:	fd5518e3          	bne	a0,s5,80008440 <consolewrite+0x40>
    80008474:	04813083          	ld	ra,72(sp)
    80008478:	04013403          	ld	s0,64(sp)
    8000847c:	03813483          	ld	s1,56(sp)
    80008480:	02813983          	ld	s3,40(sp)
    80008484:	02013a03          	ld	s4,32(sp)
    80008488:	01813a83          	ld	s5,24(sp)
    8000848c:	00090513          	mv	a0,s2
    80008490:	03013903          	ld	s2,48(sp)
    80008494:	05010113          	addi	sp,sp,80
    80008498:	00008067          	ret
    8000849c:	00000913          	li	s2,0
    800084a0:	fd5ff06f          	j	80008474 <consolewrite+0x74>

00000000800084a4 <consoleread>:
    800084a4:	f9010113          	addi	sp,sp,-112
    800084a8:	06813023          	sd	s0,96(sp)
    800084ac:	04913c23          	sd	s1,88(sp)
    800084b0:	05213823          	sd	s2,80(sp)
    800084b4:	05313423          	sd	s3,72(sp)
    800084b8:	05413023          	sd	s4,64(sp)
    800084bc:	03513c23          	sd	s5,56(sp)
    800084c0:	03613823          	sd	s6,48(sp)
    800084c4:	03713423          	sd	s7,40(sp)
    800084c8:	03813023          	sd	s8,32(sp)
    800084cc:	06113423          	sd	ra,104(sp)
    800084d0:	01913c23          	sd	s9,24(sp)
    800084d4:	07010413          	addi	s0,sp,112
    800084d8:	00060b93          	mv	s7,a2
    800084dc:	00050913          	mv	s2,a0
    800084e0:	00058c13          	mv	s8,a1
    800084e4:	00060b1b          	sext.w	s6,a2
    800084e8:	00006497          	auipc	s1,0x6
    800084ec:	e7048493          	addi	s1,s1,-400 # 8000e358 <cons>
    800084f0:	00400993          	li	s3,4
    800084f4:	fff00a13          	li	s4,-1
    800084f8:	00a00a93          	li	s5,10
    800084fc:	05705e63          	blez	s7,80008558 <consoleread+0xb4>
    80008500:	09c4a703          	lw	a4,156(s1)
    80008504:	0984a783          	lw	a5,152(s1)
    80008508:	0007071b          	sext.w	a4,a4
    8000850c:	08e78463          	beq	a5,a4,80008594 <consoleread+0xf0>
    80008510:	07f7f713          	andi	a4,a5,127
    80008514:	00e48733          	add	a4,s1,a4
    80008518:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000851c:	0017869b          	addiw	a3,a5,1
    80008520:	08d4ac23          	sw	a3,152(s1)
    80008524:	00070c9b          	sext.w	s9,a4
    80008528:	0b370663          	beq	a4,s3,800085d4 <consoleread+0x130>
    8000852c:	00100693          	li	a3,1
    80008530:	f9f40613          	addi	a2,s0,-97
    80008534:	000c0593          	mv	a1,s8
    80008538:	00090513          	mv	a0,s2
    8000853c:	f8e40fa3          	sb	a4,-97(s0)
    80008540:	00000097          	auipc	ra,0x0
    80008544:	8c0080e7          	jalr	-1856(ra) # 80007e00 <either_copyout>
    80008548:	01450863          	beq	a0,s4,80008558 <consoleread+0xb4>
    8000854c:	001c0c13          	addi	s8,s8,1
    80008550:	fffb8b9b          	addiw	s7,s7,-1
    80008554:	fb5c94e3          	bne	s9,s5,800084fc <consoleread+0x58>
    80008558:	000b851b          	sext.w	a0,s7
    8000855c:	06813083          	ld	ra,104(sp)
    80008560:	06013403          	ld	s0,96(sp)
    80008564:	05813483          	ld	s1,88(sp)
    80008568:	05013903          	ld	s2,80(sp)
    8000856c:	04813983          	ld	s3,72(sp)
    80008570:	04013a03          	ld	s4,64(sp)
    80008574:	03813a83          	ld	s5,56(sp)
    80008578:	02813b83          	ld	s7,40(sp)
    8000857c:	02013c03          	ld	s8,32(sp)
    80008580:	01813c83          	ld	s9,24(sp)
    80008584:	40ab053b          	subw	a0,s6,a0
    80008588:	03013b03          	ld	s6,48(sp)
    8000858c:	07010113          	addi	sp,sp,112
    80008590:	00008067          	ret
    80008594:	00001097          	auipc	ra,0x1
    80008598:	1d8080e7          	jalr	472(ra) # 8000976c <push_on>
    8000859c:	0984a703          	lw	a4,152(s1)
    800085a0:	09c4a783          	lw	a5,156(s1)
    800085a4:	0007879b          	sext.w	a5,a5
    800085a8:	fef70ce3          	beq	a4,a5,800085a0 <consoleread+0xfc>
    800085ac:	00001097          	auipc	ra,0x1
    800085b0:	234080e7          	jalr	564(ra) # 800097e0 <pop_on>
    800085b4:	0984a783          	lw	a5,152(s1)
    800085b8:	07f7f713          	andi	a4,a5,127
    800085bc:	00e48733          	add	a4,s1,a4
    800085c0:	01874703          	lbu	a4,24(a4)
    800085c4:	0017869b          	addiw	a3,a5,1
    800085c8:	08d4ac23          	sw	a3,152(s1)
    800085cc:	00070c9b          	sext.w	s9,a4
    800085d0:	f5371ee3          	bne	a4,s3,8000852c <consoleread+0x88>
    800085d4:	000b851b          	sext.w	a0,s7
    800085d8:	f96bf2e3          	bgeu	s7,s6,8000855c <consoleread+0xb8>
    800085dc:	08f4ac23          	sw	a5,152(s1)
    800085e0:	f7dff06f          	j	8000855c <consoleread+0xb8>

00000000800085e4 <consputc>:
    800085e4:	10000793          	li	a5,256
    800085e8:	00f50663          	beq	a0,a5,800085f4 <consputc+0x10>
    800085ec:	00001317          	auipc	t1,0x1
    800085f0:	9f430067          	jr	-1548(t1) # 80008fe0 <uartputc_sync>
    800085f4:	ff010113          	addi	sp,sp,-16
    800085f8:	00113423          	sd	ra,8(sp)
    800085fc:	00813023          	sd	s0,0(sp)
    80008600:	01010413          	addi	s0,sp,16
    80008604:	00800513          	li	a0,8
    80008608:	00001097          	auipc	ra,0x1
    8000860c:	9d8080e7          	jalr	-1576(ra) # 80008fe0 <uartputc_sync>
    80008610:	02000513          	li	a0,32
    80008614:	00001097          	auipc	ra,0x1
    80008618:	9cc080e7          	jalr	-1588(ra) # 80008fe0 <uartputc_sync>
    8000861c:	00013403          	ld	s0,0(sp)
    80008620:	00813083          	ld	ra,8(sp)
    80008624:	00800513          	li	a0,8
    80008628:	01010113          	addi	sp,sp,16
    8000862c:	00001317          	auipc	t1,0x1
    80008630:	9b430067          	jr	-1612(t1) # 80008fe0 <uartputc_sync>

0000000080008634 <consoleintr>:
    80008634:	fe010113          	addi	sp,sp,-32
    80008638:	00813823          	sd	s0,16(sp)
    8000863c:	00913423          	sd	s1,8(sp)
    80008640:	01213023          	sd	s2,0(sp)
    80008644:	00113c23          	sd	ra,24(sp)
    80008648:	02010413          	addi	s0,sp,32
    8000864c:	00006917          	auipc	s2,0x6
    80008650:	d0c90913          	addi	s2,s2,-756 # 8000e358 <cons>
    80008654:	00050493          	mv	s1,a0
    80008658:	00090513          	mv	a0,s2
    8000865c:	00001097          	auipc	ra,0x1
    80008660:	e40080e7          	jalr	-448(ra) # 8000949c <acquire>
    80008664:	02048c63          	beqz	s1,8000869c <consoleintr+0x68>
    80008668:	0a092783          	lw	a5,160(s2)
    8000866c:	09892703          	lw	a4,152(s2)
    80008670:	07f00693          	li	a3,127
    80008674:	40e7873b          	subw	a4,a5,a4
    80008678:	02e6e263          	bltu	a3,a4,8000869c <consoleintr+0x68>
    8000867c:	00d00713          	li	a4,13
    80008680:	04e48063          	beq	s1,a4,800086c0 <consoleintr+0x8c>
    80008684:	07f7f713          	andi	a4,a5,127
    80008688:	00e90733          	add	a4,s2,a4
    8000868c:	0017879b          	addiw	a5,a5,1
    80008690:	0af92023          	sw	a5,160(s2)
    80008694:	00970c23          	sb	s1,24(a4)
    80008698:	08f92e23          	sw	a5,156(s2)
    8000869c:	01013403          	ld	s0,16(sp)
    800086a0:	01813083          	ld	ra,24(sp)
    800086a4:	00813483          	ld	s1,8(sp)
    800086a8:	00013903          	ld	s2,0(sp)
    800086ac:	00006517          	auipc	a0,0x6
    800086b0:	cac50513          	addi	a0,a0,-852 # 8000e358 <cons>
    800086b4:	02010113          	addi	sp,sp,32
    800086b8:	00001317          	auipc	t1,0x1
    800086bc:	eb030067          	jr	-336(t1) # 80009568 <release>
    800086c0:	00a00493          	li	s1,10
    800086c4:	fc1ff06f          	j	80008684 <consoleintr+0x50>

00000000800086c8 <consoleinit>:
    800086c8:	fe010113          	addi	sp,sp,-32
    800086cc:	00113c23          	sd	ra,24(sp)
    800086d0:	00813823          	sd	s0,16(sp)
    800086d4:	00913423          	sd	s1,8(sp)
    800086d8:	02010413          	addi	s0,sp,32
    800086dc:	00006497          	auipc	s1,0x6
    800086e0:	c7c48493          	addi	s1,s1,-900 # 8000e358 <cons>
    800086e4:	00048513          	mv	a0,s1
    800086e8:	00002597          	auipc	a1,0x2
    800086ec:	1b058593          	addi	a1,a1,432 # 8000a898 <CONSOLE_STATUS+0x888>
    800086f0:	00001097          	auipc	ra,0x1
    800086f4:	d88080e7          	jalr	-632(ra) # 80009478 <initlock>
    800086f8:	00000097          	auipc	ra,0x0
    800086fc:	7ac080e7          	jalr	1964(ra) # 80008ea4 <uartinit>
    80008700:	01813083          	ld	ra,24(sp)
    80008704:	01013403          	ld	s0,16(sp)
    80008708:	00000797          	auipc	a5,0x0
    8000870c:	d9c78793          	addi	a5,a5,-612 # 800084a4 <consoleread>
    80008710:	0af4bc23          	sd	a5,184(s1)
    80008714:	00000797          	auipc	a5,0x0
    80008718:	cec78793          	addi	a5,a5,-788 # 80008400 <consolewrite>
    8000871c:	0cf4b023          	sd	a5,192(s1)
    80008720:	00813483          	ld	s1,8(sp)
    80008724:	02010113          	addi	sp,sp,32
    80008728:	00008067          	ret

000000008000872c <console_read>:
    8000872c:	ff010113          	addi	sp,sp,-16
    80008730:	00813423          	sd	s0,8(sp)
    80008734:	01010413          	addi	s0,sp,16
    80008738:	00813403          	ld	s0,8(sp)
    8000873c:	00006317          	auipc	t1,0x6
    80008740:	cd433303          	ld	t1,-812(t1) # 8000e410 <devsw+0x10>
    80008744:	01010113          	addi	sp,sp,16
    80008748:	00030067          	jr	t1

000000008000874c <console_write>:
    8000874c:	ff010113          	addi	sp,sp,-16
    80008750:	00813423          	sd	s0,8(sp)
    80008754:	01010413          	addi	s0,sp,16
    80008758:	00813403          	ld	s0,8(sp)
    8000875c:	00006317          	auipc	t1,0x6
    80008760:	cbc33303          	ld	t1,-836(t1) # 8000e418 <devsw+0x18>
    80008764:	01010113          	addi	sp,sp,16
    80008768:	00030067          	jr	t1

000000008000876c <panic>:
    8000876c:	fe010113          	addi	sp,sp,-32
    80008770:	00113c23          	sd	ra,24(sp)
    80008774:	00813823          	sd	s0,16(sp)
    80008778:	00913423          	sd	s1,8(sp)
    8000877c:	02010413          	addi	s0,sp,32
    80008780:	00050493          	mv	s1,a0
    80008784:	00002517          	auipc	a0,0x2
    80008788:	11c50513          	addi	a0,a0,284 # 8000a8a0 <CONSOLE_STATUS+0x890>
    8000878c:	00006797          	auipc	a5,0x6
    80008790:	d207a623          	sw	zero,-724(a5) # 8000e4b8 <pr+0x18>
    80008794:	00000097          	auipc	ra,0x0
    80008798:	034080e7          	jalr	52(ra) # 800087c8 <__printf>
    8000879c:	00048513          	mv	a0,s1
    800087a0:	00000097          	auipc	ra,0x0
    800087a4:	028080e7          	jalr	40(ra) # 800087c8 <__printf>
    800087a8:	00002517          	auipc	a0,0x2
    800087ac:	dc850513          	addi	a0,a0,-568 # 8000a570 <CONSOLE_STATUS+0x560>
    800087b0:	00000097          	auipc	ra,0x0
    800087b4:	018080e7          	jalr	24(ra) # 800087c8 <__printf>
    800087b8:	00100793          	li	a5,1
    800087bc:	00005717          	auipc	a4,0x5
    800087c0:	8cf72e23          	sw	a5,-1828(a4) # 8000d098 <panicked>
    800087c4:	0000006f          	j	800087c4 <panic+0x58>

00000000800087c8 <__printf>:
    800087c8:	f3010113          	addi	sp,sp,-208
    800087cc:	08813023          	sd	s0,128(sp)
    800087d0:	07313423          	sd	s3,104(sp)
    800087d4:	09010413          	addi	s0,sp,144
    800087d8:	05813023          	sd	s8,64(sp)
    800087dc:	08113423          	sd	ra,136(sp)
    800087e0:	06913c23          	sd	s1,120(sp)
    800087e4:	07213823          	sd	s2,112(sp)
    800087e8:	07413023          	sd	s4,96(sp)
    800087ec:	05513c23          	sd	s5,88(sp)
    800087f0:	05613823          	sd	s6,80(sp)
    800087f4:	05713423          	sd	s7,72(sp)
    800087f8:	03913c23          	sd	s9,56(sp)
    800087fc:	03a13823          	sd	s10,48(sp)
    80008800:	03b13423          	sd	s11,40(sp)
    80008804:	00006317          	auipc	t1,0x6
    80008808:	c9c30313          	addi	t1,t1,-868 # 8000e4a0 <pr>
    8000880c:	01832c03          	lw	s8,24(t1)
    80008810:	00b43423          	sd	a1,8(s0)
    80008814:	00c43823          	sd	a2,16(s0)
    80008818:	00d43c23          	sd	a3,24(s0)
    8000881c:	02e43023          	sd	a4,32(s0)
    80008820:	02f43423          	sd	a5,40(s0)
    80008824:	03043823          	sd	a6,48(s0)
    80008828:	03143c23          	sd	a7,56(s0)
    8000882c:	00050993          	mv	s3,a0
    80008830:	4a0c1663          	bnez	s8,80008cdc <__printf+0x514>
    80008834:	60098c63          	beqz	s3,80008e4c <__printf+0x684>
    80008838:	0009c503          	lbu	a0,0(s3)
    8000883c:	00840793          	addi	a5,s0,8
    80008840:	f6f43c23          	sd	a5,-136(s0)
    80008844:	00000493          	li	s1,0
    80008848:	22050063          	beqz	a0,80008a68 <__printf+0x2a0>
    8000884c:	00002a37          	lui	s4,0x2
    80008850:	00018ab7          	lui	s5,0x18
    80008854:	000f4b37          	lui	s6,0xf4
    80008858:	00989bb7          	lui	s7,0x989
    8000885c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80008860:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80008864:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80008868:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000886c:	00148c9b          	addiw	s9,s1,1
    80008870:	02500793          	li	a5,37
    80008874:	01998933          	add	s2,s3,s9
    80008878:	38f51263          	bne	a0,a5,80008bfc <__printf+0x434>
    8000887c:	00094783          	lbu	a5,0(s2)
    80008880:	00078c9b          	sext.w	s9,a5
    80008884:	1e078263          	beqz	a5,80008a68 <__printf+0x2a0>
    80008888:	0024849b          	addiw	s1,s1,2
    8000888c:	07000713          	li	a4,112
    80008890:	00998933          	add	s2,s3,s1
    80008894:	38e78a63          	beq	a5,a4,80008c28 <__printf+0x460>
    80008898:	20f76863          	bltu	a4,a5,80008aa8 <__printf+0x2e0>
    8000889c:	42a78863          	beq	a5,a0,80008ccc <__printf+0x504>
    800088a0:	06400713          	li	a4,100
    800088a4:	40e79663          	bne	a5,a4,80008cb0 <__printf+0x4e8>
    800088a8:	f7843783          	ld	a5,-136(s0)
    800088ac:	0007a603          	lw	a2,0(a5)
    800088b0:	00878793          	addi	a5,a5,8
    800088b4:	f6f43c23          	sd	a5,-136(s0)
    800088b8:	42064a63          	bltz	a2,80008cec <__printf+0x524>
    800088bc:	00a00713          	li	a4,10
    800088c0:	02e677bb          	remuw	a5,a2,a4
    800088c4:	00002d97          	auipc	s11,0x2
    800088c8:	004d8d93          	addi	s11,s11,4 # 8000a8c8 <digits>
    800088cc:	00900593          	li	a1,9
    800088d0:	0006051b          	sext.w	a0,a2
    800088d4:	00000c93          	li	s9,0
    800088d8:	02079793          	slli	a5,a5,0x20
    800088dc:	0207d793          	srli	a5,a5,0x20
    800088e0:	00fd87b3          	add	a5,s11,a5
    800088e4:	0007c783          	lbu	a5,0(a5)
    800088e8:	02e656bb          	divuw	a3,a2,a4
    800088ec:	f8f40023          	sb	a5,-128(s0)
    800088f0:	14c5d863          	bge	a1,a2,80008a40 <__printf+0x278>
    800088f4:	06300593          	li	a1,99
    800088f8:	00100c93          	li	s9,1
    800088fc:	02e6f7bb          	remuw	a5,a3,a4
    80008900:	02079793          	slli	a5,a5,0x20
    80008904:	0207d793          	srli	a5,a5,0x20
    80008908:	00fd87b3          	add	a5,s11,a5
    8000890c:	0007c783          	lbu	a5,0(a5)
    80008910:	02e6d73b          	divuw	a4,a3,a4
    80008914:	f8f400a3          	sb	a5,-127(s0)
    80008918:	12a5f463          	bgeu	a1,a0,80008a40 <__printf+0x278>
    8000891c:	00a00693          	li	a3,10
    80008920:	00900593          	li	a1,9
    80008924:	02d777bb          	remuw	a5,a4,a3
    80008928:	02079793          	slli	a5,a5,0x20
    8000892c:	0207d793          	srli	a5,a5,0x20
    80008930:	00fd87b3          	add	a5,s11,a5
    80008934:	0007c503          	lbu	a0,0(a5)
    80008938:	02d757bb          	divuw	a5,a4,a3
    8000893c:	f8a40123          	sb	a0,-126(s0)
    80008940:	48e5f263          	bgeu	a1,a4,80008dc4 <__printf+0x5fc>
    80008944:	06300513          	li	a0,99
    80008948:	02d7f5bb          	remuw	a1,a5,a3
    8000894c:	02059593          	slli	a1,a1,0x20
    80008950:	0205d593          	srli	a1,a1,0x20
    80008954:	00bd85b3          	add	a1,s11,a1
    80008958:	0005c583          	lbu	a1,0(a1)
    8000895c:	02d7d7bb          	divuw	a5,a5,a3
    80008960:	f8b401a3          	sb	a1,-125(s0)
    80008964:	48e57263          	bgeu	a0,a4,80008de8 <__printf+0x620>
    80008968:	3e700513          	li	a0,999
    8000896c:	02d7f5bb          	remuw	a1,a5,a3
    80008970:	02059593          	slli	a1,a1,0x20
    80008974:	0205d593          	srli	a1,a1,0x20
    80008978:	00bd85b3          	add	a1,s11,a1
    8000897c:	0005c583          	lbu	a1,0(a1)
    80008980:	02d7d7bb          	divuw	a5,a5,a3
    80008984:	f8b40223          	sb	a1,-124(s0)
    80008988:	46e57663          	bgeu	a0,a4,80008df4 <__printf+0x62c>
    8000898c:	02d7f5bb          	remuw	a1,a5,a3
    80008990:	02059593          	slli	a1,a1,0x20
    80008994:	0205d593          	srli	a1,a1,0x20
    80008998:	00bd85b3          	add	a1,s11,a1
    8000899c:	0005c583          	lbu	a1,0(a1)
    800089a0:	02d7d7bb          	divuw	a5,a5,a3
    800089a4:	f8b402a3          	sb	a1,-123(s0)
    800089a8:	46ea7863          	bgeu	s4,a4,80008e18 <__printf+0x650>
    800089ac:	02d7f5bb          	remuw	a1,a5,a3
    800089b0:	02059593          	slli	a1,a1,0x20
    800089b4:	0205d593          	srli	a1,a1,0x20
    800089b8:	00bd85b3          	add	a1,s11,a1
    800089bc:	0005c583          	lbu	a1,0(a1)
    800089c0:	02d7d7bb          	divuw	a5,a5,a3
    800089c4:	f8b40323          	sb	a1,-122(s0)
    800089c8:	3eeaf863          	bgeu	s5,a4,80008db8 <__printf+0x5f0>
    800089cc:	02d7f5bb          	remuw	a1,a5,a3
    800089d0:	02059593          	slli	a1,a1,0x20
    800089d4:	0205d593          	srli	a1,a1,0x20
    800089d8:	00bd85b3          	add	a1,s11,a1
    800089dc:	0005c583          	lbu	a1,0(a1)
    800089e0:	02d7d7bb          	divuw	a5,a5,a3
    800089e4:	f8b403a3          	sb	a1,-121(s0)
    800089e8:	42eb7e63          	bgeu	s6,a4,80008e24 <__printf+0x65c>
    800089ec:	02d7f5bb          	remuw	a1,a5,a3
    800089f0:	02059593          	slli	a1,a1,0x20
    800089f4:	0205d593          	srli	a1,a1,0x20
    800089f8:	00bd85b3          	add	a1,s11,a1
    800089fc:	0005c583          	lbu	a1,0(a1)
    80008a00:	02d7d7bb          	divuw	a5,a5,a3
    80008a04:	f8b40423          	sb	a1,-120(s0)
    80008a08:	42ebfc63          	bgeu	s7,a4,80008e40 <__printf+0x678>
    80008a0c:	02079793          	slli	a5,a5,0x20
    80008a10:	0207d793          	srli	a5,a5,0x20
    80008a14:	00fd8db3          	add	s11,s11,a5
    80008a18:	000dc703          	lbu	a4,0(s11)
    80008a1c:	00a00793          	li	a5,10
    80008a20:	00900c93          	li	s9,9
    80008a24:	f8e404a3          	sb	a4,-119(s0)
    80008a28:	00065c63          	bgez	a2,80008a40 <__printf+0x278>
    80008a2c:	f9040713          	addi	a4,s0,-112
    80008a30:	00f70733          	add	a4,a4,a5
    80008a34:	02d00693          	li	a3,45
    80008a38:	fed70823          	sb	a3,-16(a4)
    80008a3c:	00078c93          	mv	s9,a5
    80008a40:	f8040793          	addi	a5,s0,-128
    80008a44:	01978cb3          	add	s9,a5,s9
    80008a48:	f7f40d13          	addi	s10,s0,-129
    80008a4c:	000cc503          	lbu	a0,0(s9)
    80008a50:	fffc8c93          	addi	s9,s9,-1
    80008a54:	00000097          	auipc	ra,0x0
    80008a58:	b90080e7          	jalr	-1136(ra) # 800085e4 <consputc>
    80008a5c:	ffac98e3          	bne	s9,s10,80008a4c <__printf+0x284>
    80008a60:	00094503          	lbu	a0,0(s2)
    80008a64:	e00514e3          	bnez	a0,8000886c <__printf+0xa4>
    80008a68:	1a0c1663          	bnez	s8,80008c14 <__printf+0x44c>
    80008a6c:	08813083          	ld	ra,136(sp)
    80008a70:	08013403          	ld	s0,128(sp)
    80008a74:	07813483          	ld	s1,120(sp)
    80008a78:	07013903          	ld	s2,112(sp)
    80008a7c:	06813983          	ld	s3,104(sp)
    80008a80:	06013a03          	ld	s4,96(sp)
    80008a84:	05813a83          	ld	s5,88(sp)
    80008a88:	05013b03          	ld	s6,80(sp)
    80008a8c:	04813b83          	ld	s7,72(sp)
    80008a90:	04013c03          	ld	s8,64(sp)
    80008a94:	03813c83          	ld	s9,56(sp)
    80008a98:	03013d03          	ld	s10,48(sp)
    80008a9c:	02813d83          	ld	s11,40(sp)
    80008aa0:	0d010113          	addi	sp,sp,208
    80008aa4:	00008067          	ret
    80008aa8:	07300713          	li	a4,115
    80008aac:	1ce78a63          	beq	a5,a4,80008c80 <__printf+0x4b8>
    80008ab0:	07800713          	li	a4,120
    80008ab4:	1ee79e63          	bne	a5,a4,80008cb0 <__printf+0x4e8>
    80008ab8:	f7843783          	ld	a5,-136(s0)
    80008abc:	0007a703          	lw	a4,0(a5)
    80008ac0:	00878793          	addi	a5,a5,8
    80008ac4:	f6f43c23          	sd	a5,-136(s0)
    80008ac8:	28074263          	bltz	a4,80008d4c <__printf+0x584>
    80008acc:	00002d97          	auipc	s11,0x2
    80008ad0:	dfcd8d93          	addi	s11,s11,-516 # 8000a8c8 <digits>
    80008ad4:	00f77793          	andi	a5,a4,15
    80008ad8:	00fd87b3          	add	a5,s11,a5
    80008adc:	0007c683          	lbu	a3,0(a5)
    80008ae0:	00f00613          	li	a2,15
    80008ae4:	0007079b          	sext.w	a5,a4
    80008ae8:	f8d40023          	sb	a3,-128(s0)
    80008aec:	0047559b          	srliw	a1,a4,0x4
    80008af0:	0047569b          	srliw	a3,a4,0x4
    80008af4:	00000c93          	li	s9,0
    80008af8:	0ee65063          	bge	a2,a4,80008bd8 <__printf+0x410>
    80008afc:	00f6f693          	andi	a3,a3,15
    80008b00:	00dd86b3          	add	a3,s11,a3
    80008b04:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80008b08:	0087d79b          	srliw	a5,a5,0x8
    80008b0c:	00100c93          	li	s9,1
    80008b10:	f8d400a3          	sb	a3,-127(s0)
    80008b14:	0cb67263          	bgeu	a2,a1,80008bd8 <__printf+0x410>
    80008b18:	00f7f693          	andi	a3,a5,15
    80008b1c:	00dd86b3          	add	a3,s11,a3
    80008b20:	0006c583          	lbu	a1,0(a3)
    80008b24:	00f00613          	li	a2,15
    80008b28:	0047d69b          	srliw	a3,a5,0x4
    80008b2c:	f8b40123          	sb	a1,-126(s0)
    80008b30:	0047d593          	srli	a1,a5,0x4
    80008b34:	28f67e63          	bgeu	a2,a5,80008dd0 <__printf+0x608>
    80008b38:	00f6f693          	andi	a3,a3,15
    80008b3c:	00dd86b3          	add	a3,s11,a3
    80008b40:	0006c503          	lbu	a0,0(a3)
    80008b44:	0087d813          	srli	a6,a5,0x8
    80008b48:	0087d69b          	srliw	a3,a5,0x8
    80008b4c:	f8a401a3          	sb	a0,-125(s0)
    80008b50:	28b67663          	bgeu	a2,a1,80008ddc <__printf+0x614>
    80008b54:	00f6f693          	andi	a3,a3,15
    80008b58:	00dd86b3          	add	a3,s11,a3
    80008b5c:	0006c583          	lbu	a1,0(a3)
    80008b60:	00c7d513          	srli	a0,a5,0xc
    80008b64:	00c7d69b          	srliw	a3,a5,0xc
    80008b68:	f8b40223          	sb	a1,-124(s0)
    80008b6c:	29067a63          	bgeu	a2,a6,80008e00 <__printf+0x638>
    80008b70:	00f6f693          	andi	a3,a3,15
    80008b74:	00dd86b3          	add	a3,s11,a3
    80008b78:	0006c583          	lbu	a1,0(a3)
    80008b7c:	0107d813          	srli	a6,a5,0x10
    80008b80:	0107d69b          	srliw	a3,a5,0x10
    80008b84:	f8b402a3          	sb	a1,-123(s0)
    80008b88:	28a67263          	bgeu	a2,a0,80008e0c <__printf+0x644>
    80008b8c:	00f6f693          	andi	a3,a3,15
    80008b90:	00dd86b3          	add	a3,s11,a3
    80008b94:	0006c683          	lbu	a3,0(a3)
    80008b98:	0147d79b          	srliw	a5,a5,0x14
    80008b9c:	f8d40323          	sb	a3,-122(s0)
    80008ba0:	21067663          	bgeu	a2,a6,80008dac <__printf+0x5e4>
    80008ba4:	02079793          	slli	a5,a5,0x20
    80008ba8:	0207d793          	srli	a5,a5,0x20
    80008bac:	00fd8db3          	add	s11,s11,a5
    80008bb0:	000dc683          	lbu	a3,0(s11)
    80008bb4:	00800793          	li	a5,8
    80008bb8:	00700c93          	li	s9,7
    80008bbc:	f8d403a3          	sb	a3,-121(s0)
    80008bc0:	00075c63          	bgez	a4,80008bd8 <__printf+0x410>
    80008bc4:	f9040713          	addi	a4,s0,-112
    80008bc8:	00f70733          	add	a4,a4,a5
    80008bcc:	02d00693          	li	a3,45
    80008bd0:	fed70823          	sb	a3,-16(a4)
    80008bd4:	00078c93          	mv	s9,a5
    80008bd8:	f8040793          	addi	a5,s0,-128
    80008bdc:	01978cb3          	add	s9,a5,s9
    80008be0:	f7f40d13          	addi	s10,s0,-129
    80008be4:	000cc503          	lbu	a0,0(s9)
    80008be8:	fffc8c93          	addi	s9,s9,-1
    80008bec:	00000097          	auipc	ra,0x0
    80008bf0:	9f8080e7          	jalr	-1544(ra) # 800085e4 <consputc>
    80008bf4:	ff9d18e3          	bne	s10,s9,80008be4 <__printf+0x41c>
    80008bf8:	0100006f          	j	80008c08 <__printf+0x440>
    80008bfc:	00000097          	auipc	ra,0x0
    80008c00:	9e8080e7          	jalr	-1560(ra) # 800085e4 <consputc>
    80008c04:	000c8493          	mv	s1,s9
    80008c08:	00094503          	lbu	a0,0(s2)
    80008c0c:	c60510e3          	bnez	a0,8000886c <__printf+0xa4>
    80008c10:	e40c0ee3          	beqz	s8,80008a6c <__printf+0x2a4>
    80008c14:	00006517          	auipc	a0,0x6
    80008c18:	88c50513          	addi	a0,a0,-1908 # 8000e4a0 <pr>
    80008c1c:	00001097          	auipc	ra,0x1
    80008c20:	94c080e7          	jalr	-1716(ra) # 80009568 <release>
    80008c24:	e49ff06f          	j	80008a6c <__printf+0x2a4>
    80008c28:	f7843783          	ld	a5,-136(s0)
    80008c2c:	03000513          	li	a0,48
    80008c30:	01000d13          	li	s10,16
    80008c34:	00878713          	addi	a4,a5,8
    80008c38:	0007bc83          	ld	s9,0(a5)
    80008c3c:	f6e43c23          	sd	a4,-136(s0)
    80008c40:	00000097          	auipc	ra,0x0
    80008c44:	9a4080e7          	jalr	-1628(ra) # 800085e4 <consputc>
    80008c48:	07800513          	li	a0,120
    80008c4c:	00000097          	auipc	ra,0x0
    80008c50:	998080e7          	jalr	-1640(ra) # 800085e4 <consputc>
    80008c54:	00002d97          	auipc	s11,0x2
    80008c58:	c74d8d93          	addi	s11,s11,-908 # 8000a8c8 <digits>
    80008c5c:	03ccd793          	srli	a5,s9,0x3c
    80008c60:	00fd87b3          	add	a5,s11,a5
    80008c64:	0007c503          	lbu	a0,0(a5)
    80008c68:	fffd0d1b          	addiw	s10,s10,-1
    80008c6c:	004c9c93          	slli	s9,s9,0x4
    80008c70:	00000097          	auipc	ra,0x0
    80008c74:	974080e7          	jalr	-1676(ra) # 800085e4 <consputc>
    80008c78:	fe0d12e3          	bnez	s10,80008c5c <__printf+0x494>
    80008c7c:	f8dff06f          	j	80008c08 <__printf+0x440>
    80008c80:	f7843783          	ld	a5,-136(s0)
    80008c84:	0007bc83          	ld	s9,0(a5)
    80008c88:	00878793          	addi	a5,a5,8
    80008c8c:	f6f43c23          	sd	a5,-136(s0)
    80008c90:	000c9a63          	bnez	s9,80008ca4 <__printf+0x4dc>
    80008c94:	1080006f          	j	80008d9c <__printf+0x5d4>
    80008c98:	001c8c93          	addi	s9,s9,1
    80008c9c:	00000097          	auipc	ra,0x0
    80008ca0:	948080e7          	jalr	-1720(ra) # 800085e4 <consputc>
    80008ca4:	000cc503          	lbu	a0,0(s9)
    80008ca8:	fe0518e3          	bnez	a0,80008c98 <__printf+0x4d0>
    80008cac:	f5dff06f          	j	80008c08 <__printf+0x440>
    80008cb0:	02500513          	li	a0,37
    80008cb4:	00000097          	auipc	ra,0x0
    80008cb8:	930080e7          	jalr	-1744(ra) # 800085e4 <consputc>
    80008cbc:	000c8513          	mv	a0,s9
    80008cc0:	00000097          	auipc	ra,0x0
    80008cc4:	924080e7          	jalr	-1756(ra) # 800085e4 <consputc>
    80008cc8:	f41ff06f          	j	80008c08 <__printf+0x440>
    80008ccc:	02500513          	li	a0,37
    80008cd0:	00000097          	auipc	ra,0x0
    80008cd4:	914080e7          	jalr	-1772(ra) # 800085e4 <consputc>
    80008cd8:	f31ff06f          	j	80008c08 <__printf+0x440>
    80008cdc:	00030513          	mv	a0,t1
    80008ce0:	00000097          	auipc	ra,0x0
    80008ce4:	7bc080e7          	jalr	1980(ra) # 8000949c <acquire>
    80008ce8:	b4dff06f          	j	80008834 <__printf+0x6c>
    80008cec:	40c0053b          	negw	a0,a2
    80008cf0:	00a00713          	li	a4,10
    80008cf4:	02e576bb          	remuw	a3,a0,a4
    80008cf8:	00002d97          	auipc	s11,0x2
    80008cfc:	bd0d8d93          	addi	s11,s11,-1072 # 8000a8c8 <digits>
    80008d00:	ff700593          	li	a1,-9
    80008d04:	02069693          	slli	a3,a3,0x20
    80008d08:	0206d693          	srli	a3,a3,0x20
    80008d0c:	00dd86b3          	add	a3,s11,a3
    80008d10:	0006c683          	lbu	a3,0(a3)
    80008d14:	02e557bb          	divuw	a5,a0,a4
    80008d18:	f8d40023          	sb	a3,-128(s0)
    80008d1c:	10b65e63          	bge	a2,a1,80008e38 <__printf+0x670>
    80008d20:	06300593          	li	a1,99
    80008d24:	02e7f6bb          	remuw	a3,a5,a4
    80008d28:	02069693          	slli	a3,a3,0x20
    80008d2c:	0206d693          	srli	a3,a3,0x20
    80008d30:	00dd86b3          	add	a3,s11,a3
    80008d34:	0006c683          	lbu	a3,0(a3)
    80008d38:	02e7d73b          	divuw	a4,a5,a4
    80008d3c:	00200793          	li	a5,2
    80008d40:	f8d400a3          	sb	a3,-127(s0)
    80008d44:	bca5ece3          	bltu	a1,a0,8000891c <__printf+0x154>
    80008d48:	ce5ff06f          	j	80008a2c <__printf+0x264>
    80008d4c:	40e007bb          	negw	a5,a4
    80008d50:	00002d97          	auipc	s11,0x2
    80008d54:	b78d8d93          	addi	s11,s11,-1160 # 8000a8c8 <digits>
    80008d58:	00f7f693          	andi	a3,a5,15
    80008d5c:	00dd86b3          	add	a3,s11,a3
    80008d60:	0006c583          	lbu	a1,0(a3)
    80008d64:	ff100613          	li	a2,-15
    80008d68:	0047d69b          	srliw	a3,a5,0x4
    80008d6c:	f8b40023          	sb	a1,-128(s0)
    80008d70:	0047d59b          	srliw	a1,a5,0x4
    80008d74:	0ac75e63          	bge	a4,a2,80008e30 <__printf+0x668>
    80008d78:	00f6f693          	andi	a3,a3,15
    80008d7c:	00dd86b3          	add	a3,s11,a3
    80008d80:	0006c603          	lbu	a2,0(a3)
    80008d84:	00f00693          	li	a3,15
    80008d88:	0087d79b          	srliw	a5,a5,0x8
    80008d8c:	f8c400a3          	sb	a2,-127(s0)
    80008d90:	d8b6e4e3          	bltu	a3,a1,80008b18 <__printf+0x350>
    80008d94:	00200793          	li	a5,2
    80008d98:	e2dff06f          	j	80008bc4 <__printf+0x3fc>
    80008d9c:	00002c97          	auipc	s9,0x2
    80008da0:	b0cc8c93          	addi	s9,s9,-1268 # 8000a8a8 <CONSOLE_STATUS+0x898>
    80008da4:	02800513          	li	a0,40
    80008da8:	ef1ff06f          	j	80008c98 <__printf+0x4d0>
    80008dac:	00700793          	li	a5,7
    80008db0:	00600c93          	li	s9,6
    80008db4:	e0dff06f          	j	80008bc0 <__printf+0x3f8>
    80008db8:	00700793          	li	a5,7
    80008dbc:	00600c93          	li	s9,6
    80008dc0:	c69ff06f          	j	80008a28 <__printf+0x260>
    80008dc4:	00300793          	li	a5,3
    80008dc8:	00200c93          	li	s9,2
    80008dcc:	c5dff06f          	j	80008a28 <__printf+0x260>
    80008dd0:	00300793          	li	a5,3
    80008dd4:	00200c93          	li	s9,2
    80008dd8:	de9ff06f          	j	80008bc0 <__printf+0x3f8>
    80008ddc:	00400793          	li	a5,4
    80008de0:	00300c93          	li	s9,3
    80008de4:	dddff06f          	j	80008bc0 <__printf+0x3f8>
    80008de8:	00400793          	li	a5,4
    80008dec:	00300c93          	li	s9,3
    80008df0:	c39ff06f          	j	80008a28 <__printf+0x260>
    80008df4:	00500793          	li	a5,5
    80008df8:	00400c93          	li	s9,4
    80008dfc:	c2dff06f          	j	80008a28 <__printf+0x260>
    80008e00:	00500793          	li	a5,5
    80008e04:	00400c93          	li	s9,4
    80008e08:	db9ff06f          	j	80008bc0 <__printf+0x3f8>
    80008e0c:	00600793          	li	a5,6
    80008e10:	00500c93          	li	s9,5
    80008e14:	dadff06f          	j	80008bc0 <__printf+0x3f8>
    80008e18:	00600793          	li	a5,6
    80008e1c:	00500c93          	li	s9,5
    80008e20:	c09ff06f          	j	80008a28 <__printf+0x260>
    80008e24:	00800793          	li	a5,8
    80008e28:	00700c93          	li	s9,7
    80008e2c:	bfdff06f          	j	80008a28 <__printf+0x260>
    80008e30:	00100793          	li	a5,1
    80008e34:	d91ff06f          	j	80008bc4 <__printf+0x3fc>
    80008e38:	00100793          	li	a5,1
    80008e3c:	bf1ff06f          	j	80008a2c <__printf+0x264>
    80008e40:	00900793          	li	a5,9
    80008e44:	00800c93          	li	s9,8
    80008e48:	be1ff06f          	j	80008a28 <__printf+0x260>
    80008e4c:	00002517          	auipc	a0,0x2
    80008e50:	a6450513          	addi	a0,a0,-1436 # 8000a8b0 <CONSOLE_STATUS+0x8a0>
    80008e54:	00000097          	auipc	ra,0x0
    80008e58:	918080e7          	jalr	-1768(ra) # 8000876c <panic>

0000000080008e5c <printfinit>:
    80008e5c:	fe010113          	addi	sp,sp,-32
    80008e60:	00813823          	sd	s0,16(sp)
    80008e64:	00913423          	sd	s1,8(sp)
    80008e68:	00113c23          	sd	ra,24(sp)
    80008e6c:	02010413          	addi	s0,sp,32
    80008e70:	00005497          	auipc	s1,0x5
    80008e74:	63048493          	addi	s1,s1,1584 # 8000e4a0 <pr>
    80008e78:	00048513          	mv	a0,s1
    80008e7c:	00002597          	auipc	a1,0x2
    80008e80:	a4458593          	addi	a1,a1,-1468 # 8000a8c0 <CONSOLE_STATUS+0x8b0>
    80008e84:	00000097          	auipc	ra,0x0
    80008e88:	5f4080e7          	jalr	1524(ra) # 80009478 <initlock>
    80008e8c:	01813083          	ld	ra,24(sp)
    80008e90:	01013403          	ld	s0,16(sp)
    80008e94:	0004ac23          	sw	zero,24(s1)
    80008e98:	00813483          	ld	s1,8(sp)
    80008e9c:	02010113          	addi	sp,sp,32
    80008ea0:	00008067          	ret

0000000080008ea4 <uartinit>:
    80008ea4:	ff010113          	addi	sp,sp,-16
    80008ea8:	00813423          	sd	s0,8(sp)
    80008eac:	01010413          	addi	s0,sp,16
    80008eb0:	100007b7          	lui	a5,0x10000
    80008eb4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008eb8:	f8000713          	li	a4,-128
    80008ebc:	00e781a3          	sb	a4,3(a5)
    80008ec0:	00300713          	li	a4,3
    80008ec4:	00e78023          	sb	a4,0(a5)
    80008ec8:	000780a3          	sb	zero,1(a5)
    80008ecc:	00e781a3          	sb	a4,3(a5)
    80008ed0:	00700693          	li	a3,7
    80008ed4:	00d78123          	sb	a3,2(a5)
    80008ed8:	00e780a3          	sb	a4,1(a5)
    80008edc:	00813403          	ld	s0,8(sp)
    80008ee0:	01010113          	addi	sp,sp,16
    80008ee4:	00008067          	ret

0000000080008ee8 <uartputc>:
    80008ee8:	00004797          	auipc	a5,0x4
    80008eec:	1b07a783          	lw	a5,432(a5) # 8000d098 <panicked>
    80008ef0:	00078463          	beqz	a5,80008ef8 <uartputc+0x10>
    80008ef4:	0000006f          	j	80008ef4 <uartputc+0xc>
    80008ef8:	fd010113          	addi	sp,sp,-48
    80008efc:	02813023          	sd	s0,32(sp)
    80008f00:	00913c23          	sd	s1,24(sp)
    80008f04:	01213823          	sd	s2,16(sp)
    80008f08:	01313423          	sd	s3,8(sp)
    80008f0c:	02113423          	sd	ra,40(sp)
    80008f10:	03010413          	addi	s0,sp,48
    80008f14:	00004917          	auipc	s2,0x4
    80008f18:	18c90913          	addi	s2,s2,396 # 8000d0a0 <uart_tx_r>
    80008f1c:	00093783          	ld	a5,0(s2)
    80008f20:	00004497          	auipc	s1,0x4
    80008f24:	18848493          	addi	s1,s1,392 # 8000d0a8 <uart_tx_w>
    80008f28:	0004b703          	ld	a4,0(s1)
    80008f2c:	02078693          	addi	a3,a5,32
    80008f30:	00050993          	mv	s3,a0
    80008f34:	02e69c63          	bne	a3,a4,80008f6c <uartputc+0x84>
    80008f38:	00001097          	auipc	ra,0x1
    80008f3c:	834080e7          	jalr	-1996(ra) # 8000976c <push_on>
    80008f40:	00093783          	ld	a5,0(s2)
    80008f44:	0004b703          	ld	a4,0(s1)
    80008f48:	02078793          	addi	a5,a5,32
    80008f4c:	00e79463          	bne	a5,a4,80008f54 <uartputc+0x6c>
    80008f50:	0000006f          	j	80008f50 <uartputc+0x68>
    80008f54:	00001097          	auipc	ra,0x1
    80008f58:	88c080e7          	jalr	-1908(ra) # 800097e0 <pop_on>
    80008f5c:	00093783          	ld	a5,0(s2)
    80008f60:	0004b703          	ld	a4,0(s1)
    80008f64:	02078693          	addi	a3,a5,32
    80008f68:	fce688e3          	beq	a3,a4,80008f38 <uartputc+0x50>
    80008f6c:	01f77693          	andi	a3,a4,31
    80008f70:	00005597          	auipc	a1,0x5
    80008f74:	55058593          	addi	a1,a1,1360 # 8000e4c0 <uart_tx_buf>
    80008f78:	00d586b3          	add	a3,a1,a3
    80008f7c:	00170713          	addi	a4,a4,1
    80008f80:	01368023          	sb	s3,0(a3)
    80008f84:	00e4b023          	sd	a4,0(s1)
    80008f88:	10000637          	lui	a2,0x10000
    80008f8c:	02f71063          	bne	a4,a5,80008fac <uartputc+0xc4>
    80008f90:	0340006f          	j	80008fc4 <uartputc+0xdc>
    80008f94:	00074703          	lbu	a4,0(a4)
    80008f98:	00f93023          	sd	a5,0(s2)
    80008f9c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008fa0:	00093783          	ld	a5,0(s2)
    80008fa4:	0004b703          	ld	a4,0(s1)
    80008fa8:	00f70e63          	beq	a4,a5,80008fc4 <uartputc+0xdc>
    80008fac:	00564683          	lbu	a3,5(a2)
    80008fb0:	01f7f713          	andi	a4,a5,31
    80008fb4:	00e58733          	add	a4,a1,a4
    80008fb8:	0206f693          	andi	a3,a3,32
    80008fbc:	00178793          	addi	a5,a5,1
    80008fc0:	fc069ae3          	bnez	a3,80008f94 <uartputc+0xac>
    80008fc4:	02813083          	ld	ra,40(sp)
    80008fc8:	02013403          	ld	s0,32(sp)
    80008fcc:	01813483          	ld	s1,24(sp)
    80008fd0:	01013903          	ld	s2,16(sp)
    80008fd4:	00813983          	ld	s3,8(sp)
    80008fd8:	03010113          	addi	sp,sp,48
    80008fdc:	00008067          	ret

0000000080008fe0 <uartputc_sync>:
    80008fe0:	ff010113          	addi	sp,sp,-16
    80008fe4:	00813423          	sd	s0,8(sp)
    80008fe8:	01010413          	addi	s0,sp,16
    80008fec:	00004717          	auipc	a4,0x4
    80008ff0:	0ac72703          	lw	a4,172(a4) # 8000d098 <panicked>
    80008ff4:	02071663          	bnez	a4,80009020 <uartputc_sync+0x40>
    80008ff8:	00050793          	mv	a5,a0
    80008ffc:	100006b7          	lui	a3,0x10000
    80009000:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80009004:	02077713          	andi	a4,a4,32
    80009008:	fe070ce3          	beqz	a4,80009000 <uartputc_sync+0x20>
    8000900c:	0ff7f793          	andi	a5,a5,255
    80009010:	00f68023          	sb	a5,0(a3)
    80009014:	00813403          	ld	s0,8(sp)
    80009018:	01010113          	addi	sp,sp,16
    8000901c:	00008067          	ret
    80009020:	0000006f          	j	80009020 <uartputc_sync+0x40>

0000000080009024 <uartstart>:
    80009024:	ff010113          	addi	sp,sp,-16
    80009028:	00813423          	sd	s0,8(sp)
    8000902c:	01010413          	addi	s0,sp,16
    80009030:	00004617          	auipc	a2,0x4
    80009034:	07060613          	addi	a2,a2,112 # 8000d0a0 <uart_tx_r>
    80009038:	00004517          	auipc	a0,0x4
    8000903c:	07050513          	addi	a0,a0,112 # 8000d0a8 <uart_tx_w>
    80009040:	00063783          	ld	a5,0(a2)
    80009044:	00053703          	ld	a4,0(a0)
    80009048:	04f70263          	beq	a4,a5,8000908c <uartstart+0x68>
    8000904c:	100005b7          	lui	a1,0x10000
    80009050:	00005817          	auipc	a6,0x5
    80009054:	47080813          	addi	a6,a6,1136 # 8000e4c0 <uart_tx_buf>
    80009058:	01c0006f          	j	80009074 <uartstart+0x50>
    8000905c:	0006c703          	lbu	a4,0(a3)
    80009060:	00f63023          	sd	a5,0(a2)
    80009064:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80009068:	00063783          	ld	a5,0(a2)
    8000906c:	00053703          	ld	a4,0(a0)
    80009070:	00f70e63          	beq	a4,a5,8000908c <uartstart+0x68>
    80009074:	01f7f713          	andi	a4,a5,31
    80009078:	00e806b3          	add	a3,a6,a4
    8000907c:	0055c703          	lbu	a4,5(a1)
    80009080:	00178793          	addi	a5,a5,1
    80009084:	02077713          	andi	a4,a4,32
    80009088:	fc071ae3          	bnez	a4,8000905c <uartstart+0x38>
    8000908c:	00813403          	ld	s0,8(sp)
    80009090:	01010113          	addi	sp,sp,16
    80009094:	00008067          	ret

0000000080009098 <uartgetc>:
    80009098:	ff010113          	addi	sp,sp,-16
    8000909c:	00813423          	sd	s0,8(sp)
    800090a0:	01010413          	addi	s0,sp,16
    800090a4:	10000737          	lui	a4,0x10000
    800090a8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800090ac:	0017f793          	andi	a5,a5,1
    800090b0:	00078c63          	beqz	a5,800090c8 <uartgetc+0x30>
    800090b4:	00074503          	lbu	a0,0(a4)
    800090b8:	0ff57513          	andi	a0,a0,255
    800090bc:	00813403          	ld	s0,8(sp)
    800090c0:	01010113          	addi	sp,sp,16
    800090c4:	00008067          	ret
    800090c8:	fff00513          	li	a0,-1
    800090cc:	ff1ff06f          	j	800090bc <uartgetc+0x24>

00000000800090d0 <uartintr>:
    800090d0:	100007b7          	lui	a5,0x10000
    800090d4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800090d8:	0017f793          	andi	a5,a5,1
    800090dc:	0a078463          	beqz	a5,80009184 <uartintr+0xb4>
    800090e0:	fe010113          	addi	sp,sp,-32
    800090e4:	00813823          	sd	s0,16(sp)
    800090e8:	00913423          	sd	s1,8(sp)
    800090ec:	00113c23          	sd	ra,24(sp)
    800090f0:	02010413          	addi	s0,sp,32
    800090f4:	100004b7          	lui	s1,0x10000
    800090f8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800090fc:	0ff57513          	andi	a0,a0,255
    80009100:	fffff097          	auipc	ra,0xfffff
    80009104:	534080e7          	jalr	1332(ra) # 80008634 <consoleintr>
    80009108:	0054c783          	lbu	a5,5(s1)
    8000910c:	0017f793          	andi	a5,a5,1
    80009110:	fe0794e3          	bnez	a5,800090f8 <uartintr+0x28>
    80009114:	00004617          	auipc	a2,0x4
    80009118:	f8c60613          	addi	a2,a2,-116 # 8000d0a0 <uart_tx_r>
    8000911c:	00004517          	auipc	a0,0x4
    80009120:	f8c50513          	addi	a0,a0,-116 # 8000d0a8 <uart_tx_w>
    80009124:	00063783          	ld	a5,0(a2)
    80009128:	00053703          	ld	a4,0(a0)
    8000912c:	04f70263          	beq	a4,a5,80009170 <uartintr+0xa0>
    80009130:	100005b7          	lui	a1,0x10000
    80009134:	00005817          	auipc	a6,0x5
    80009138:	38c80813          	addi	a6,a6,908 # 8000e4c0 <uart_tx_buf>
    8000913c:	01c0006f          	j	80009158 <uartintr+0x88>
    80009140:	0006c703          	lbu	a4,0(a3)
    80009144:	00f63023          	sd	a5,0(a2)
    80009148:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000914c:	00063783          	ld	a5,0(a2)
    80009150:	00053703          	ld	a4,0(a0)
    80009154:	00f70e63          	beq	a4,a5,80009170 <uartintr+0xa0>
    80009158:	01f7f713          	andi	a4,a5,31
    8000915c:	00e806b3          	add	a3,a6,a4
    80009160:	0055c703          	lbu	a4,5(a1)
    80009164:	00178793          	addi	a5,a5,1
    80009168:	02077713          	andi	a4,a4,32
    8000916c:	fc071ae3          	bnez	a4,80009140 <uartintr+0x70>
    80009170:	01813083          	ld	ra,24(sp)
    80009174:	01013403          	ld	s0,16(sp)
    80009178:	00813483          	ld	s1,8(sp)
    8000917c:	02010113          	addi	sp,sp,32
    80009180:	00008067          	ret
    80009184:	00004617          	auipc	a2,0x4
    80009188:	f1c60613          	addi	a2,a2,-228 # 8000d0a0 <uart_tx_r>
    8000918c:	00004517          	auipc	a0,0x4
    80009190:	f1c50513          	addi	a0,a0,-228 # 8000d0a8 <uart_tx_w>
    80009194:	00063783          	ld	a5,0(a2)
    80009198:	00053703          	ld	a4,0(a0)
    8000919c:	04f70263          	beq	a4,a5,800091e0 <uartintr+0x110>
    800091a0:	100005b7          	lui	a1,0x10000
    800091a4:	00005817          	auipc	a6,0x5
    800091a8:	31c80813          	addi	a6,a6,796 # 8000e4c0 <uart_tx_buf>
    800091ac:	01c0006f          	j	800091c8 <uartintr+0xf8>
    800091b0:	0006c703          	lbu	a4,0(a3)
    800091b4:	00f63023          	sd	a5,0(a2)
    800091b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800091bc:	00063783          	ld	a5,0(a2)
    800091c0:	00053703          	ld	a4,0(a0)
    800091c4:	02f70063          	beq	a4,a5,800091e4 <uartintr+0x114>
    800091c8:	01f7f713          	andi	a4,a5,31
    800091cc:	00e806b3          	add	a3,a6,a4
    800091d0:	0055c703          	lbu	a4,5(a1)
    800091d4:	00178793          	addi	a5,a5,1
    800091d8:	02077713          	andi	a4,a4,32
    800091dc:	fc071ae3          	bnez	a4,800091b0 <uartintr+0xe0>
    800091e0:	00008067          	ret
    800091e4:	00008067          	ret

00000000800091e8 <kinit>:
    800091e8:	fc010113          	addi	sp,sp,-64
    800091ec:	02913423          	sd	s1,40(sp)
    800091f0:	fffff7b7          	lui	a5,0xfffff
    800091f4:	00006497          	auipc	s1,0x6
    800091f8:	2eb48493          	addi	s1,s1,747 # 8000f4df <end+0xfff>
    800091fc:	02813823          	sd	s0,48(sp)
    80009200:	01313c23          	sd	s3,24(sp)
    80009204:	00f4f4b3          	and	s1,s1,a5
    80009208:	02113c23          	sd	ra,56(sp)
    8000920c:	03213023          	sd	s2,32(sp)
    80009210:	01413823          	sd	s4,16(sp)
    80009214:	01513423          	sd	s5,8(sp)
    80009218:	04010413          	addi	s0,sp,64
    8000921c:	000017b7          	lui	a5,0x1
    80009220:	01100993          	li	s3,17
    80009224:	00f487b3          	add	a5,s1,a5
    80009228:	01b99993          	slli	s3,s3,0x1b
    8000922c:	06f9e063          	bltu	s3,a5,8000928c <kinit+0xa4>
    80009230:	00005a97          	auipc	s5,0x5
    80009234:	2b0a8a93          	addi	s5,s5,688 # 8000e4e0 <end>
    80009238:	0754ec63          	bltu	s1,s5,800092b0 <kinit+0xc8>
    8000923c:	0734fa63          	bgeu	s1,s3,800092b0 <kinit+0xc8>
    80009240:	00088a37          	lui	s4,0x88
    80009244:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80009248:	00004917          	auipc	s2,0x4
    8000924c:	e6890913          	addi	s2,s2,-408 # 8000d0b0 <kmem>
    80009250:	00ca1a13          	slli	s4,s4,0xc
    80009254:	0140006f          	j	80009268 <kinit+0x80>
    80009258:	000017b7          	lui	a5,0x1
    8000925c:	00f484b3          	add	s1,s1,a5
    80009260:	0554e863          	bltu	s1,s5,800092b0 <kinit+0xc8>
    80009264:	0534f663          	bgeu	s1,s3,800092b0 <kinit+0xc8>
    80009268:	00001637          	lui	a2,0x1
    8000926c:	00100593          	li	a1,1
    80009270:	00048513          	mv	a0,s1
    80009274:	00000097          	auipc	ra,0x0
    80009278:	5e4080e7          	jalr	1508(ra) # 80009858 <__memset>
    8000927c:	00093783          	ld	a5,0(s2)
    80009280:	00f4b023          	sd	a5,0(s1)
    80009284:	00993023          	sd	s1,0(s2)
    80009288:	fd4498e3          	bne	s1,s4,80009258 <kinit+0x70>
    8000928c:	03813083          	ld	ra,56(sp)
    80009290:	03013403          	ld	s0,48(sp)
    80009294:	02813483          	ld	s1,40(sp)
    80009298:	02013903          	ld	s2,32(sp)
    8000929c:	01813983          	ld	s3,24(sp)
    800092a0:	01013a03          	ld	s4,16(sp)
    800092a4:	00813a83          	ld	s5,8(sp)
    800092a8:	04010113          	addi	sp,sp,64
    800092ac:	00008067          	ret
    800092b0:	00001517          	auipc	a0,0x1
    800092b4:	63050513          	addi	a0,a0,1584 # 8000a8e0 <digits+0x18>
    800092b8:	fffff097          	auipc	ra,0xfffff
    800092bc:	4b4080e7          	jalr	1204(ra) # 8000876c <panic>

00000000800092c0 <freerange>:
    800092c0:	fc010113          	addi	sp,sp,-64
    800092c4:	000017b7          	lui	a5,0x1
    800092c8:	02913423          	sd	s1,40(sp)
    800092cc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800092d0:	009504b3          	add	s1,a0,s1
    800092d4:	fffff537          	lui	a0,0xfffff
    800092d8:	02813823          	sd	s0,48(sp)
    800092dc:	02113c23          	sd	ra,56(sp)
    800092e0:	03213023          	sd	s2,32(sp)
    800092e4:	01313c23          	sd	s3,24(sp)
    800092e8:	01413823          	sd	s4,16(sp)
    800092ec:	01513423          	sd	s5,8(sp)
    800092f0:	01613023          	sd	s6,0(sp)
    800092f4:	04010413          	addi	s0,sp,64
    800092f8:	00a4f4b3          	and	s1,s1,a0
    800092fc:	00f487b3          	add	a5,s1,a5
    80009300:	06f5e463          	bltu	a1,a5,80009368 <freerange+0xa8>
    80009304:	00005a97          	auipc	s5,0x5
    80009308:	1dca8a93          	addi	s5,s5,476 # 8000e4e0 <end>
    8000930c:	0954e263          	bltu	s1,s5,80009390 <freerange+0xd0>
    80009310:	01100993          	li	s3,17
    80009314:	01b99993          	slli	s3,s3,0x1b
    80009318:	0734fc63          	bgeu	s1,s3,80009390 <freerange+0xd0>
    8000931c:	00058a13          	mv	s4,a1
    80009320:	00004917          	auipc	s2,0x4
    80009324:	d9090913          	addi	s2,s2,-624 # 8000d0b0 <kmem>
    80009328:	00002b37          	lui	s6,0x2
    8000932c:	0140006f          	j	80009340 <freerange+0x80>
    80009330:	000017b7          	lui	a5,0x1
    80009334:	00f484b3          	add	s1,s1,a5
    80009338:	0554ec63          	bltu	s1,s5,80009390 <freerange+0xd0>
    8000933c:	0534fa63          	bgeu	s1,s3,80009390 <freerange+0xd0>
    80009340:	00001637          	lui	a2,0x1
    80009344:	00100593          	li	a1,1
    80009348:	00048513          	mv	a0,s1
    8000934c:	00000097          	auipc	ra,0x0
    80009350:	50c080e7          	jalr	1292(ra) # 80009858 <__memset>
    80009354:	00093703          	ld	a4,0(s2)
    80009358:	016487b3          	add	a5,s1,s6
    8000935c:	00e4b023          	sd	a4,0(s1)
    80009360:	00993023          	sd	s1,0(s2)
    80009364:	fcfa76e3          	bgeu	s4,a5,80009330 <freerange+0x70>
    80009368:	03813083          	ld	ra,56(sp)
    8000936c:	03013403          	ld	s0,48(sp)
    80009370:	02813483          	ld	s1,40(sp)
    80009374:	02013903          	ld	s2,32(sp)
    80009378:	01813983          	ld	s3,24(sp)
    8000937c:	01013a03          	ld	s4,16(sp)
    80009380:	00813a83          	ld	s5,8(sp)
    80009384:	00013b03          	ld	s6,0(sp)
    80009388:	04010113          	addi	sp,sp,64
    8000938c:	00008067          	ret
    80009390:	00001517          	auipc	a0,0x1
    80009394:	55050513          	addi	a0,a0,1360 # 8000a8e0 <digits+0x18>
    80009398:	fffff097          	auipc	ra,0xfffff
    8000939c:	3d4080e7          	jalr	980(ra) # 8000876c <panic>

00000000800093a0 <kfree>:
    800093a0:	fe010113          	addi	sp,sp,-32
    800093a4:	00813823          	sd	s0,16(sp)
    800093a8:	00113c23          	sd	ra,24(sp)
    800093ac:	00913423          	sd	s1,8(sp)
    800093b0:	02010413          	addi	s0,sp,32
    800093b4:	03451793          	slli	a5,a0,0x34
    800093b8:	04079c63          	bnez	a5,80009410 <kfree+0x70>
    800093bc:	00005797          	auipc	a5,0x5
    800093c0:	12478793          	addi	a5,a5,292 # 8000e4e0 <end>
    800093c4:	00050493          	mv	s1,a0
    800093c8:	04f56463          	bltu	a0,a5,80009410 <kfree+0x70>
    800093cc:	01100793          	li	a5,17
    800093d0:	01b79793          	slli	a5,a5,0x1b
    800093d4:	02f57e63          	bgeu	a0,a5,80009410 <kfree+0x70>
    800093d8:	00001637          	lui	a2,0x1
    800093dc:	00100593          	li	a1,1
    800093e0:	00000097          	auipc	ra,0x0
    800093e4:	478080e7          	jalr	1144(ra) # 80009858 <__memset>
    800093e8:	00004797          	auipc	a5,0x4
    800093ec:	cc878793          	addi	a5,a5,-824 # 8000d0b0 <kmem>
    800093f0:	0007b703          	ld	a4,0(a5)
    800093f4:	01813083          	ld	ra,24(sp)
    800093f8:	01013403          	ld	s0,16(sp)
    800093fc:	00e4b023          	sd	a4,0(s1)
    80009400:	0097b023          	sd	s1,0(a5)
    80009404:	00813483          	ld	s1,8(sp)
    80009408:	02010113          	addi	sp,sp,32
    8000940c:	00008067          	ret
    80009410:	00001517          	auipc	a0,0x1
    80009414:	4d050513          	addi	a0,a0,1232 # 8000a8e0 <digits+0x18>
    80009418:	fffff097          	auipc	ra,0xfffff
    8000941c:	354080e7          	jalr	852(ra) # 8000876c <panic>

0000000080009420 <kalloc>:
    80009420:	fe010113          	addi	sp,sp,-32
    80009424:	00813823          	sd	s0,16(sp)
    80009428:	00913423          	sd	s1,8(sp)
    8000942c:	00113c23          	sd	ra,24(sp)
    80009430:	02010413          	addi	s0,sp,32
    80009434:	00004797          	auipc	a5,0x4
    80009438:	c7c78793          	addi	a5,a5,-900 # 8000d0b0 <kmem>
    8000943c:	0007b483          	ld	s1,0(a5)
    80009440:	02048063          	beqz	s1,80009460 <kalloc+0x40>
    80009444:	0004b703          	ld	a4,0(s1)
    80009448:	00001637          	lui	a2,0x1
    8000944c:	00500593          	li	a1,5
    80009450:	00048513          	mv	a0,s1
    80009454:	00e7b023          	sd	a4,0(a5)
    80009458:	00000097          	auipc	ra,0x0
    8000945c:	400080e7          	jalr	1024(ra) # 80009858 <__memset>
    80009460:	01813083          	ld	ra,24(sp)
    80009464:	01013403          	ld	s0,16(sp)
    80009468:	00048513          	mv	a0,s1
    8000946c:	00813483          	ld	s1,8(sp)
    80009470:	02010113          	addi	sp,sp,32
    80009474:	00008067          	ret

0000000080009478 <initlock>:
    80009478:	ff010113          	addi	sp,sp,-16
    8000947c:	00813423          	sd	s0,8(sp)
    80009480:	01010413          	addi	s0,sp,16
    80009484:	00813403          	ld	s0,8(sp)
    80009488:	00b53423          	sd	a1,8(a0)
    8000948c:	00052023          	sw	zero,0(a0)
    80009490:	00053823          	sd	zero,16(a0)
    80009494:	01010113          	addi	sp,sp,16
    80009498:	00008067          	ret

000000008000949c <acquire>:
    8000949c:	fe010113          	addi	sp,sp,-32
    800094a0:	00813823          	sd	s0,16(sp)
    800094a4:	00913423          	sd	s1,8(sp)
    800094a8:	00113c23          	sd	ra,24(sp)
    800094ac:	01213023          	sd	s2,0(sp)
    800094b0:	02010413          	addi	s0,sp,32
    800094b4:	00050493          	mv	s1,a0
    800094b8:	10002973          	csrr	s2,sstatus
    800094bc:	100027f3          	csrr	a5,sstatus
    800094c0:	ffd7f793          	andi	a5,a5,-3
    800094c4:	10079073          	csrw	sstatus,a5
    800094c8:	fffff097          	auipc	ra,0xfffff
    800094cc:	8ec080e7          	jalr	-1812(ra) # 80007db4 <mycpu>
    800094d0:	07852783          	lw	a5,120(a0)
    800094d4:	06078e63          	beqz	a5,80009550 <acquire+0xb4>
    800094d8:	fffff097          	auipc	ra,0xfffff
    800094dc:	8dc080e7          	jalr	-1828(ra) # 80007db4 <mycpu>
    800094e0:	07852783          	lw	a5,120(a0)
    800094e4:	0004a703          	lw	a4,0(s1)
    800094e8:	0017879b          	addiw	a5,a5,1
    800094ec:	06f52c23          	sw	a5,120(a0)
    800094f0:	04071063          	bnez	a4,80009530 <acquire+0x94>
    800094f4:	00100713          	li	a4,1
    800094f8:	00070793          	mv	a5,a4
    800094fc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80009500:	0007879b          	sext.w	a5,a5
    80009504:	fe079ae3          	bnez	a5,800094f8 <acquire+0x5c>
    80009508:	0ff0000f          	fence
    8000950c:	fffff097          	auipc	ra,0xfffff
    80009510:	8a8080e7          	jalr	-1880(ra) # 80007db4 <mycpu>
    80009514:	01813083          	ld	ra,24(sp)
    80009518:	01013403          	ld	s0,16(sp)
    8000951c:	00a4b823          	sd	a0,16(s1)
    80009520:	00013903          	ld	s2,0(sp)
    80009524:	00813483          	ld	s1,8(sp)
    80009528:	02010113          	addi	sp,sp,32
    8000952c:	00008067          	ret
    80009530:	0104b903          	ld	s2,16(s1)
    80009534:	fffff097          	auipc	ra,0xfffff
    80009538:	880080e7          	jalr	-1920(ra) # 80007db4 <mycpu>
    8000953c:	faa91ce3          	bne	s2,a0,800094f4 <acquire+0x58>
    80009540:	00001517          	auipc	a0,0x1
    80009544:	3a850513          	addi	a0,a0,936 # 8000a8e8 <digits+0x20>
    80009548:	fffff097          	auipc	ra,0xfffff
    8000954c:	224080e7          	jalr	548(ra) # 8000876c <panic>
    80009550:	00195913          	srli	s2,s2,0x1
    80009554:	fffff097          	auipc	ra,0xfffff
    80009558:	860080e7          	jalr	-1952(ra) # 80007db4 <mycpu>
    8000955c:	00197913          	andi	s2,s2,1
    80009560:	07252e23          	sw	s2,124(a0)
    80009564:	f75ff06f          	j	800094d8 <acquire+0x3c>

0000000080009568 <release>:
    80009568:	fe010113          	addi	sp,sp,-32
    8000956c:	00813823          	sd	s0,16(sp)
    80009570:	00113c23          	sd	ra,24(sp)
    80009574:	00913423          	sd	s1,8(sp)
    80009578:	01213023          	sd	s2,0(sp)
    8000957c:	02010413          	addi	s0,sp,32
    80009580:	00052783          	lw	a5,0(a0)
    80009584:	00079a63          	bnez	a5,80009598 <release+0x30>
    80009588:	00001517          	auipc	a0,0x1
    8000958c:	36850513          	addi	a0,a0,872 # 8000a8f0 <digits+0x28>
    80009590:	fffff097          	auipc	ra,0xfffff
    80009594:	1dc080e7          	jalr	476(ra) # 8000876c <panic>
    80009598:	01053903          	ld	s2,16(a0)
    8000959c:	00050493          	mv	s1,a0
    800095a0:	fffff097          	auipc	ra,0xfffff
    800095a4:	814080e7          	jalr	-2028(ra) # 80007db4 <mycpu>
    800095a8:	fea910e3          	bne	s2,a0,80009588 <release+0x20>
    800095ac:	0004b823          	sd	zero,16(s1)
    800095b0:	0ff0000f          	fence
    800095b4:	0f50000f          	fence	iorw,ow
    800095b8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800095bc:	ffffe097          	auipc	ra,0xffffe
    800095c0:	7f8080e7          	jalr	2040(ra) # 80007db4 <mycpu>
    800095c4:	100027f3          	csrr	a5,sstatus
    800095c8:	0027f793          	andi	a5,a5,2
    800095cc:	04079a63          	bnez	a5,80009620 <release+0xb8>
    800095d0:	07852783          	lw	a5,120(a0)
    800095d4:	02f05e63          	blez	a5,80009610 <release+0xa8>
    800095d8:	fff7871b          	addiw	a4,a5,-1
    800095dc:	06e52c23          	sw	a4,120(a0)
    800095e0:	00071c63          	bnez	a4,800095f8 <release+0x90>
    800095e4:	07c52783          	lw	a5,124(a0)
    800095e8:	00078863          	beqz	a5,800095f8 <release+0x90>
    800095ec:	100027f3          	csrr	a5,sstatus
    800095f0:	0027e793          	ori	a5,a5,2
    800095f4:	10079073          	csrw	sstatus,a5
    800095f8:	01813083          	ld	ra,24(sp)
    800095fc:	01013403          	ld	s0,16(sp)
    80009600:	00813483          	ld	s1,8(sp)
    80009604:	00013903          	ld	s2,0(sp)
    80009608:	02010113          	addi	sp,sp,32
    8000960c:	00008067          	ret
    80009610:	00001517          	auipc	a0,0x1
    80009614:	30050513          	addi	a0,a0,768 # 8000a910 <digits+0x48>
    80009618:	fffff097          	auipc	ra,0xfffff
    8000961c:	154080e7          	jalr	340(ra) # 8000876c <panic>
    80009620:	00001517          	auipc	a0,0x1
    80009624:	2d850513          	addi	a0,a0,728 # 8000a8f8 <digits+0x30>
    80009628:	fffff097          	auipc	ra,0xfffff
    8000962c:	144080e7          	jalr	324(ra) # 8000876c <panic>

0000000080009630 <holding>:
    80009630:	00052783          	lw	a5,0(a0)
    80009634:	00079663          	bnez	a5,80009640 <holding+0x10>
    80009638:	00000513          	li	a0,0
    8000963c:	00008067          	ret
    80009640:	fe010113          	addi	sp,sp,-32
    80009644:	00813823          	sd	s0,16(sp)
    80009648:	00913423          	sd	s1,8(sp)
    8000964c:	00113c23          	sd	ra,24(sp)
    80009650:	02010413          	addi	s0,sp,32
    80009654:	01053483          	ld	s1,16(a0)
    80009658:	ffffe097          	auipc	ra,0xffffe
    8000965c:	75c080e7          	jalr	1884(ra) # 80007db4 <mycpu>
    80009660:	01813083          	ld	ra,24(sp)
    80009664:	01013403          	ld	s0,16(sp)
    80009668:	40a48533          	sub	a0,s1,a0
    8000966c:	00153513          	seqz	a0,a0
    80009670:	00813483          	ld	s1,8(sp)
    80009674:	02010113          	addi	sp,sp,32
    80009678:	00008067          	ret

000000008000967c <push_off>:
    8000967c:	fe010113          	addi	sp,sp,-32
    80009680:	00813823          	sd	s0,16(sp)
    80009684:	00113c23          	sd	ra,24(sp)
    80009688:	00913423          	sd	s1,8(sp)
    8000968c:	02010413          	addi	s0,sp,32
    80009690:	100024f3          	csrr	s1,sstatus
    80009694:	100027f3          	csrr	a5,sstatus
    80009698:	ffd7f793          	andi	a5,a5,-3
    8000969c:	10079073          	csrw	sstatus,a5
    800096a0:	ffffe097          	auipc	ra,0xffffe
    800096a4:	714080e7          	jalr	1812(ra) # 80007db4 <mycpu>
    800096a8:	07852783          	lw	a5,120(a0)
    800096ac:	02078663          	beqz	a5,800096d8 <push_off+0x5c>
    800096b0:	ffffe097          	auipc	ra,0xffffe
    800096b4:	704080e7          	jalr	1796(ra) # 80007db4 <mycpu>
    800096b8:	07852783          	lw	a5,120(a0)
    800096bc:	01813083          	ld	ra,24(sp)
    800096c0:	01013403          	ld	s0,16(sp)
    800096c4:	0017879b          	addiw	a5,a5,1
    800096c8:	06f52c23          	sw	a5,120(a0)
    800096cc:	00813483          	ld	s1,8(sp)
    800096d0:	02010113          	addi	sp,sp,32
    800096d4:	00008067          	ret
    800096d8:	0014d493          	srli	s1,s1,0x1
    800096dc:	ffffe097          	auipc	ra,0xffffe
    800096e0:	6d8080e7          	jalr	1752(ra) # 80007db4 <mycpu>
    800096e4:	0014f493          	andi	s1,s1,1
    800096e8:	06952e23          	sw	s1,124(a0)
    800096ec:	fc5ff06f          	j	800096b0 <push_off+0x34>

00000000800096f0 <pop_off>:
    800096f0:	ff010113          	addi	sp,sp,-16
    800096f4:	00813023          	sd	s0,0(sp)
    800096f8:	00113423          	sd	ra,8(sp)
    800096fc:	01010413          	addi	s0,sp,16
    80009700:	ffffe097          	auipc	ra,0xffffe
    80009704:	6b4080e7          	jalr	1716(ra) # 80007db4 <mycpu>
    80009708:	100027f3          	csrr	a5,sstatus
    8000970c:	0027f793          	andi	a5,a5,2
    80009710:	04079663          	bnez	a5,8000975c <pop_off+0x6c>
    80009714:	07852783          	lw	a5,120(a0)
    80009718:	02f05a63          	blez	a5,8000974c <pop_off+0x5c>
    8000971c:	fff7871b          	addiw	a4,a5,-1
    80009720:	06e52c23          	sw	a4,120(a0)
    80009724:	00071c63          	bnez	a4,8000973c <pop_off+0x4c>
    80009728:	07c52783          	lw	a5,124(a0)
    8000972c:	00078863          	beqz	a5,8000973c <pop_off+0x4c>
    80009730:	100027f3          	csrr	a5,sstatus
    80009734:	0027e793          	ori	a5,a5,2
    80009738:	10079073          	csrw	sstatus,a5
    8000973c:	00813083          	ld	ra,8(sp)
    80009740:	00013403          	ld	s0,0(sp)
    80009744:	01010113          	addi	sp,sp,16
    80009748:	00008067          	ret
    8000974c:	00001517          	auipc	a0,0x1
    80009750:	1c450513          	addi	a0,a0,452 # 8000a910 <digits+0x48>
    80009754:	fffff097          	auipc	ra,0xfffff
    80009758:	018080e7          	jalr	24(ra) # 8000876c <panic>
    8000975c:	00001517          	auipc	a0,0x1
    80009760:	19c50513          	addi	a0,a0,412 # 8000a8f8 <digits+0x30>
    80009764:	fffff097          	auipc	ra,0xfffff
    80009768:	008080e7          	jalr	8(ra) # 8000876c <panic>

000000008000976c <push_on>:
    8000976c:	fe010113          	addi	sp,sp,-32
    80009770:	00813823          	sd	s0,16(sp)
    80009774:	00113c23          	sd	ra,24(sp)
    80009778:	00913423          	sd	s1,8(sp)
    8000977c:	02010413          	addi	s0,sp,32
    80009780:	100024f3          	csrr	s1,sstatus
    80009784:	100027f3          	csrr	a5,sstatus
    80009788:	0027e793          	ori	a5,a5,2
    8000978c:	10079073          	csrw	sstatus,a5
    80009790:	ffffe097          	auipc	ra,0xffffe
    80009794:	624080e7          	jalr	1572(ra) # 80007db4 <mycpu>
    80009798:	07852783          	lw	a5,120(a0)
    8000979c:	02078663          	beqz	a5,800097c8 <push_on+0x5c>
    800097a0:	ffffe097          	auipc	ra,0xffffe
    800097a4:	614080e7          	jalr	1556(ra) # 80007db4 <mycpu>
    800097a8:	07852783          	lw	a5,120(a0)
    800097ac:	01813083          	ld	ra,24(sp)
    800097b0:	01013403          	ld	s0,16(sp)
    800097b4:	0017879b          	addiw	a5,a5,1
    800097b8:	06f52c23          	sw	a5,120(a0)
    800097bc:	00813483          	ld	s1,8(sp)
    800097c0:	02010113          	addi	sp,sp,32
    800097c4:	00008067          	ret
    800097c8:	0014d493          	srli	s1,s1,0x1
    800097cc:	ffffe097          	auipc	ra,0xffffe
    800097d0:	5e8080e7          	jalr	1512(ra) # 80007db4 <mycpu>
    800097d4:	0014f493          	andi	s1,s1,1
    800097d8:	06952e23          	sw	s1,124(a0)
    800097dc:	fc5ff06f          	j	800097a0 <push_on+0x34>

00000000800097e0 <pop_on>:
    800097e0:	ff010113          	addi	sp,sp,-16
    800097e4:	00813023          	sd	s0,0(sp)
    800097e8:	00113423          	sd	ra,8(sp)
    800097ec:	01010413          	addi	s0,sp,16
    800097f0:	ffffe097          	auipc	ra,0xffffe
    800097f4:	5c4080e7          	jalr	1476(ra) # 80007db4 <mycpu>
    800097f8:	100027f3          	csrr	a5,sstatus
    800097fc:	0027f793          	andi	a5,a5,2
    80009800:	04078463          	beqz	a5,80009848 <pop_on+0x68>
    80009804:	07852783          	lw	a5,120(a0)
    80009808:	02f05863          	blez	a5,80009838 <pop_on+0x58>
    8000980c:	fff7879b          	addiw	a5,a5,-1
    80009810:	06f52c23          	sw	a5,120(a0)
    80009814:	07853783          	ld	a5,120(a0)
    80009818:	00079863          	bnez	a5,80009828 <pop_on+0x48>
    8000981c:	100027f3          	csrr	a5,sstatus
    80009820:	ffd7f793          	andi	a5,a5,-3
    80009824:	10079073          	csrw	sstatus,a5
    80009828:	00813083          	ld	ra,8(sp)
    8000982c:	00013403          	ld	s0,0(sp)
    80009830:	01010113          	addi	sp,sp,16
    80009834:	00008067          	ret
    80009838:	00001517          	auipc	a0,0x1
    8000983c:	10050513          	addi	a0,a0,256 # 8000a938 <digits+0x70>
    80009840:	fffff097          	auipc	ra,0xfffff
    80009844:	f2c080e7          	jalr	-212(ra) # 8000876c <panic>
    80009848:	00001517          	auipc	a0,0x1
    8000984c:	0d050513          	addi	a0,a0,208 # 8000a918 <digits+0x50>
    80009850:	fffff097          	auipc	ra,0xfffff
    80009854:	f1c080e7          	jalr	-228(ra) # 8000876c <panic>

0000000080009858 <__memset>:
    80009858:	ff010113          	addi	sp,sp,-16
    8000985c:	00813423          	sd	s0,8(sp)
    80009860:	01010413          	addi	s0,sp,16
    80009864:	1a060e63          	beqz	a2,80009a20 <__memset+0x1c8>
    80009868:	40a007b3          	neg	a5,a0
    8000986c:	0077f793          	andi	a5,a5,7
    80009870:	00778693          	addi	a3,a5,7
    80009874:	00b00813          	li	a6,11
    80009878:	0ff5f593          	andi	a1,a1,255
    8000987c:	fff6071b          	addiw	a4,a2,-1
    80009880:	1b06e663          	bltu	a3,a6,80009a2c <__memset+0x1d4>
    80009884:	1cd76463          	bltu	a4,a3,80009a4c <__memset+0x1f4>
    80009888:	1a078e63          	beqz	a5,80009a44 <__memset+0x1ec>
    8000988c:	00b50023          	sb	a1,0(a0)
    80009890:	00100713          	li	a4,1
    80009894:	1ae78463          	beq	a5,a4,80009a3c <__memset+0x1e4>
    80009898:	00b500a3          	sb	a1,1(a0)
    8000989c:	00200713          	li	a4,2
    800098a0:	1ae78a63          	beq	a5,a4,80009a54 <__memset+0x1fc>
    800098a4:	00b50123          	sb	a1,2(a0)
    800098a8:	00300713          	li	a4,3
    800098ac:	18e78463          	beq	a5,a4,80009a34 <__memset+0x1dc>
    800098b0:	00b501a3          	sb	a1,3(a0)
    800098b4:	00400713          	li	a4,4
    800098b8:	1ae78263          	beq	a5,a4,80009a5c <__memset+0x204>
    800098bc:	00b50223          	sb	a1,4(a0)
    800098c0:	00500713          	li	a4,5
    800098c4:	1ae78063          	beq	a5,a4,80009a64 <__memset+0x20c>
    800098c8:	00b502a3          	sb	a1,5(a0)
    800098cc:	00700713          	li	a4,7
    800098d0:	18e79e63          	bne	a5,a4,80009a6c <__memset+0x214>
    800098d4:	00b50323          	sb	a1,6(a0)
    800098d8:	00700e93          	li	t4,7
    800098dc:	00859713          	slli	a4,a1,0x8
    800098e0:	00e5e733          	or	a4,a1,a4
    800098e4:	01059e13          	slli	t3,a1,0x10
    800098e8:	01c76e33          	or	t3,a4,t3
    800098ec:	01859313          	slli	t1,a1,0x18
    800098f0:	006e6333          	or	t1,t3,t1
    800098f4:	02059893          	slli	a7,a1,0x20
    800098f8:	40f60e3b          	subw	t3,a2,a5
    800098fc:	011368b3          	or	a7,t1,a7
    80009900:	02859813          	slli	a6,a1,0x28
    80009904:	0108e833          	or	a6,a7,a6
    80009908:	03059693          	slli	a3,a1,0x30
    8000990c:	003e589b          	srliw	a7,t3,0x3
    80009910:	00d866b3          	or	a3,a6,a3
    80009914:	03859713          	slli	a4,a1,0x38
    80009918:	00389813          	slli	a6,a7,0x3
    8000991c:	00f507b3          	add	a5,a0,a5
    80009920:	00e6e733          	or	a4,a3,a4
    80009924:	000e089b          	sext.w	a7,t3
    80009928:	00f806b3          	add	a3,a6,a5
    8000992c:	00e7b023          	sd	a4,0(a5)
    80009930:	00878793          	addi	a5,a5,8
    80009934:	fed79ce3          	bne	a5,a3,8000992c <__memset+0xd4>
    80009938:	ff8e7793          	andi	a5,t3,-8
    8000993c:	0007871b          	sext.w	a4,a5
    80009940:	01d787bb          	addw	a5,a5,t4
    80009944:	0ce88e63          	beq	a7,a4,80009a20 <__memset+0x1c8>
    80009948:	00f50733          	add	a4,a0,a5
    8000994c:	00b70023          	sb	a1,0(a4)
    80009950:	0017871b          	addiw	a4,a5,1
    80009954:	0cc77663          	bgeu	a4,a2,80009a20 <__memset+0x1c8>
    80009958:	00e50733          	add	a4,a0,a4
    8000995c:	00b70023          	sb	a1,0(a4)
    80009960:	0027871b          	addiw	a4,a5,2
    80009964:	0ac77e63          	bgeu	a4,a2,80009a20 <__memset+0x1c8>
    80009968:	00e50733          	add	a4,a0,a4
    8000996c:	00b70023          	sb	a1,0(a4)
    80009970:	0037871b          	addiw	a4,a5,3
    80009974:	0ac77663          	bgeu	a4,a2,80009a20 <__memset+0x1c8>
    80009978:	00e50733          	add	a4,a0,a4
    8000997c:	00b70023          	sb	a1,0(a4)
    80009980:	0047871b          	addiw	a4,a5,4
    80009984:	08c77e63          	bgeu	a4,a2,80009a20 <__memset+0x1c8>
    80009988:	00e50733          	add	a4,a0,a4
    8000998c:	00b70023          	sb	a1,0(a4)
    80009990:	0057871b          	addiw	a4,a5,5
    80009994:	08c77663          	bgeu	a4,a2,80009a20 <__memset+0x1c8>
    80009998:	00e50733          	add	a4,a0,a4
    8000999c:	00b70023          	sb	a1,0(a4)
    800099a0:	0067871b          	addiw	a4,a5,6
    800099a4:	06c77e63          	bgeu	a4,a2,80009a20 <__memset+0x1c8>
    800099a8:	00e50733          	add	a4,a0,a4
    800099ac:	00b70023          	sb	a1,0(a4)
    800099b0:	0077871b          	addiw	a4,a5,7
    800099b4:	06c77663          	bgeu	a4,a2,80009a20 <__memset+0x1c8>
    800099b8:	00e50733          	add	a4,a0,a4
    800099bc:	00b70023          	sb	a1,0(a4)
    800099c0:	0087871b          	addiw	a4,a5,8
    800099c4:	04c77e63          	bgeu	a4,a2,80009a20 <__memset+0x1c8>
    800099c8:	00e50733          	add	a4,a0,a4
    800099cc:	00b70023          	sb	a1,0(a4)
    800099d0:	0097871b          	addiw	a4,a5,9
    800099d4:	04c77663          	bgeu	a4,a2,80009a20 <__memset+0x1c8>
    800099d8:	00e50733          	add	a4,a0,a4
    800099dc:	00b70023          	sb	a1,0(a4)
    800099e0:	00a7871b          	addiw	a4,a5,10
    800099e4:	02c77e63          	bgeu	a4,a2,80009a20 <__memset+0x1c8>
    800099e8:	00e50733          	add	a4,a0,a4
    800099ec:	00b70023          	sb	a1,0(a4)
    800099f0:	00b7871b          	addiw	a4,a5,11
    800099f4:	02c77663          	bgeu	a4,a2,80009a20 <__memset+0x1c8>
    800099f8:	00e50733          	add	a4,a0,a4
    800099fc:	00b70023          	sb	a1,0(a4)
    80009a00:	00c7871b          	addiw	a4,a5,12
    80009a04:	00c77e63          	bgeu	a4,a2,80009a20 <__memset+0x1c8>
    80009a08:	00e50733          	add	a4,a0,a4
    80009a0c:	00b70023          	sb	a1,0(a4)
    80009a10:	00d7879b          	addiw	a5,a5,13
    80009a14:	00c7f663          	bgeu	a5,a2,80009a20 <__memset+0x1c8>
    80009a18:	00f507b3          	add	a5,a0,a5
    80009a1c:	00b78023          	sb	a1,0(a5)
    80009a20:	00813403          	ld	s0,8(sp)
    80009a24:	01010113          	addi	sp,sp,16
    80009a28:	00008067          	ret
    80009a2c:	00b00693          	li	a3,11
    80009a30:	e55ff06f          	j	80009884 <__memset+0x2c>
    80009a34:	00300e93          	li	t4,3
    80009a38:	ea5ff06f          	j	800098dc <__memset+0x84>
    80009a3c:	00100e93          	li	t4,1
    80009a40:	e9dff06f          	j	800098dc <__memset+0x84>
    80009a44:	00000e93          	li	t4,0
    80009a48:	e95ff06f          	j	800098dc <__memset+0x84>
    80009a4c:	00000793          	li	a5,0
    80009a50:	ef9ff06f          	j	80009948 <__memset+0xf0>
    80009a54:	00200e93          	li	t4,2
    80009a58:	e85ff06f          	j	800098dc <__memset+0x84>
    80009a5c:	00400e93          	li	t4,4
    80009a60:	e7dff06f          	j	800098dc <__memset+0x84>
    80009a64:	00500e93          	li	t4,5
    80009a68:	e75ff06f          	j	800098dc <__memset+0x84>
    80009a6c:	00600e93          	li	t4,6
    80009a70:	e6dff06f          	j	800098dc <__memset+0x84>

0000000080009a74 <__memmove>:
    80009a74:	ff010113          	addi	sp,sp,-16
    80009a78:	00813423          	sd	s0,8(sp)
    80009a7c:	01010413          	addi	s0,sp,16
    80009a80:	0e060863          	beqz	a2,80009b70 <__memmove+0xfc>
    80009a84:	fff6069b          	addiw	a3,a2,-1
    80009a88:	0006881b          	sext.w	a6,a3
    80009a8c:	0ea5e863          	bltu	a1,a0,80009b7c <__memmove+0x108>
    80009a90:	00758713          	addi	a4,a1,7
    80009a94:	00a5e7b3          	or	a5,a1,a0
    80009a98:	40a70733          	sub	a4,a4,a0
    80009a9c:	0077f793          	andi	a5,a5,7
    80009aa0:	00f73713          	sltiu	a4,a4,15
    80009aa4:	00174713          	xori	a4,a4,1
    80009aa8:	0017b793          	seqz	a5,a5
    80009aac:	00e7f7b3          	and	a5,a5,a4
    80009ab0:	10078863          	beqz	a5,80009bc0 <__memmove+0x14c>
    80009ab4:	00900793          	li	a5,9
    80009ab8:	1107f463          	bgeu	a5,a6,80009bc0 <__memmove+0x14c>
    80009abc:	0036581b          	srliw	a6,a2,0x3
    80009ac0:	fff8081b          	addiw	a6,a6,-1
    80009ac4:	02081813          	slli	a6,a6,0x20
    80009ac8:	01d85893          	srli	a7,a6,0x1d
    80009acc:	00858813          	addi	a6,a1,8
    80009ad0:	00058793          	mv	a5,a1
    80009ad4:	00050713          	mv	a4,a0
    80009ad8:	01088833          	add	a6,a7,a6
    80009adc:	0007b883          	ld	a7,0(a5)
    80009ae0:	00878793          	addi	a5,a5,8
    80009ae4:	00870713          	addi	a4,a4,8
    80009ae8:	ff173c23          	sd	a7,-8(a4)
    80009aec:	ff0798e3          	bne	a5,a6,80009adc <__memmove+0x68>
    80009af0:	ff867713          	andi	a4,a2,-8
    80009af4:	02071793          	slli	a5,a4,0x20
    80009af8:	0207d793          	srli	a5,a5,0x20
    80009afc:	00f585b3          	add	a1,a1,a5
    80009b00:	40e686bb          	subw	a3,a3,a4
    80009b04:	00f507b3          	add	a5,a0,a5
    80009b08:	06e60463          	beq	a2,a4,80009b70 <__memmove+0xfc>
    80009b0c:	0005c703          	lbu	a4,0(a1)
    80009b10:	00e78023          	sb	a4,0(a5)
    80009b14:	04068e63          	beqz	a3,80009b70 <__memmove+0xfc>
    80009b18:	0015c603          	lbu	a2,1(a1)
    80009b1c:	00100713          	li	a4,1
    80009b20:	00c780a3          	sb	a2,1(a5)
    80009b24:	04e68663          	beq	a3,a4,80009b70 <__memmove+0xfc>
    80009b28:	0025c603          	lbu	a2,2(a1)
    80009b2c:	00200713          	li	a4,2
    80009b30:	00c78123          	sb	a2,2(a5)
    80009b34:	02e68e63          	beq	a3,a4,80009b70 <__memmove+0xfc>
    80009b38:	0035c603          	lbu	a2,3(a1)
    80009b3c:	00300713          	li	a4,3
    80009b40:	00c781a3          	sb	a2,3(a5)
    80009b44:	02e68663          	beq	a3,a4,80009b70 <__memmove+0xfc>
    80009b48:	0045c603          	lbu	a2,4(a1)
    80009b4c:	00400713          	li	a4,4
    80009b50:	00c78223          	sb	a2,4(a5)
    80009b54:	00e68e63          	beq	a3,a4,80009b70 <__memmove+0xfc>
    80009b58:	0055c603          	lbu	a2,5(a1)
    80009b5c:	00500713          	li	a4,5
    80009b60:	00c782a3          	sb	a2,5(a5)
    80009b64:	00e68663          	beq	a3,a4,80009b70 <__memmove+0xfc>
    80009b68:	0065c703          	lbu	a4,6(a1)
    80009b6c:	00e78323          	sb	a4,6(a5)
    80009b70:	00813403          	ld	s0,8(sp)
    80009b74:	01010113          	addi	sp,sp,16
    80009b78:	00008067          	ret
    80009b7c:	02061713          	slli	a4,a2,0x20
    80009b80:	02075713          	srli	a4,a4,0x20
    80009b84:	00e587b3          	add	a5,a1,a4
    80009b88:	f0f574e3          	bgeu	a0,a5,80009a90 <__memmove+0x1c>
    80009b8c:	02069613          	slli	a2,a3,0x20
    80009b90:	02065613          	srli	a2,a2,0x20
    80009b94:	fff64613          	not	a2,a2
    80009b98:	00e50733          	add	a4,a0,a4
    80009b9c:	00c78633          	add	a2,a5,a2
    80009ba0:	fff7c683          	lbu	a3,-1(a5)
    80009ba4:	fff78793          	addi	a5,a5,-1
    80009ba8:	fff70713          	addi	a4,a4,-1
    80009bac:	00d70023          	sb	a3,0(a4)
    80009bb0:	fec798e3          	bne	a5,a2,80009ba0 <__memmove+0x12c>
    80009bb4:	00813403          	ld	s0,8(sp)
    80009bb8:	01010113          	addi	sp,sp,16
    80009bbc:	00008067          	ret
    80009bc0:	02069713          	slli	a4,a3,0x20
    80009bc4:	02075713          	srli	a4,a4,0x20
    80009bc8:	00170713          	addi	a4,a4,1
    80009bcc:	00e50733          	add	a4,a0,a4
    80009bd0:	00050793          	mv	a5,a0
    80009bd4:	0005c683          	lbu	a3,0(a1)
    80009bd8:	00178793          	addi	a5,a5,1
    80009bdc:	00158593          	addi	a1,a1,1
    80009be0:	fed78fa3          	sb	a3,-1(a5)
    80009be4:	fee798e3          	bne	a5,a4,80009bd4 <__memmove+0x160>
    80009be8:	f89ff06f          	j	80009b70 <__memmove+0xfc>
	...
