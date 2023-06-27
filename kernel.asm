
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	f6813103          	ld	sp,-152(sp) # 8000cf68 <_GLOBAL_OFFSET_TABLE_+0x50>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	255070ef          	jal	ra,80007a70 <start>

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
    80001084:	5e4010ef          	jal	ra,80002668 <interruptRoutine>

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
    80001430:	b4c7b783          	ld	a5,-1204(a5) # 8000cf78 <_GLOBAL_OFFSET_TABLE_+0x60>
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
    8000167c:	9007b783          	ld	a5,-1792(a5) # 8000cf78 <_GLOBAL_OFFSET_TABLE_+0x60>
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
    80001710:	8f47c783          	lbu	a5,-1804(a5) # 8000d000 <_ZN8KConsole11initializedE>
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
    80001734:	8d048493          	addi	s1,s1,-1840 # 8000d000 <_ZN8KConsole11initializedE>
    80001738:	0000b797          	auipc	a5,0xb
    8000173c:	7f07b783          	ld	a5,2032(a5) # 8000cf28 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001740:	0007b783          	ld	a5,0(a5)
    80001744:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    80001748:	0000b797          	auipc	a5,0xb
    8000174c:	7f07b783          	ld	a5,2032(a5) # 8000cf38 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001750:	0007b783          	ld	a5,0(a5)
    80001754:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    80001758:	03200593          	li	a1,50
    8000175c:	0000c517          	auipc	a0,0xc
    80001760:	8bc50513          	addi	a0,a0,-1860 # 8000d018 <_ZN8KConsole19inputBufferHasSpaceE>
    80001764:	00000097          	auipc	ra,0x0
    80001768:	dd4080e7          	jalr	-556(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    8000176c:	03200593          	li	a1,50
    80001770:	0000c517          	auipc	a0,0xc
    80001774:	8b050513          	addi	a0,a0,-1872 # 8000d020 <_ZN8KConsole20outputBufferHasSpaceE>
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	dc0080e7          	jalr	-576(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    80001780:	00000593          	li	a1,0
    80001784:	0000c517          	auipc	a0,0xc
    80001788:	8a450513          	addi	a0,a0,-1884 # 8000d028 <_ZN8KConsole12charsToInputE>
    8000178c:	00000097          	auipc	ra,0x0
    80001790:	dac080e7          	jalr	-596(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    80001794:	00000593          	li	a1,0
    80001798:	0000c517          	auipc	a0,0xc
    8000179c:	89850513          	addi	a0,a0,-1896 # 8000d030 <_ZN8KConsole13charsToOutputE>
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
    800017dc:	82848493          	addi	s1,s1,-2008 # 8000d000 <_ZN8KConsole11initializedE>
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
    80001820:	85872703          	lw	a4,-1960(a4) # 8000d074 <_ZN8KConsole15inputBufferSizeE>
    80001824:	03200793          	li	a5,50
    80001828:	04f70e63          	beq	a4,a5,80001884 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    8000182c:	ff010113          	addi	sp,sp,-16
    80001830:	00113423          	sd	ra,8(sp)
    80001834:	00813023          	sd	s0,0(sp)
    80001838:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    8000183c:	0000b697          	auipc	a3,0xb
    80001840:	7c468693          	addi	a3,a3,1988 # 8000d000 <_ZN8KConsole11initializedE>
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
    800018a4:	0000b497          	auipc	s1,0xb
    800018a8:	75c48493          	addi	s1,s1,1884 # 8000d000 <_ZN8KConsole11initializedE>
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
    8000190c:	0000b497          	auipc	s1,0xb
    80001910:	6f448493          	addi	s1,s1,1780 # 8000d000 <_ZN8KConsole11initializedE>
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
    }
};

void emptyFunction(void*);

void f1(void*) {
    8000195c:	fe010113          	addi	sp,sp,-32
    80001960:	00113c23          	sd	ra,24(sp)
    80001964:	00813823          	sd	s0,16(sp)
    80001968:	00913423          	sd	s1,8(sp)
    8000196c:	02010413          	addi	s0,sp,32
    int i = 0;
    80001970:	00000493          	li	s1,0
    80001974:	0140006f          	j	80001988 <_Z2f1Pv+0x2c>
    while (!end) {
        sem_wait(s31);
        printString("nit 1\n");
        if (++i == 4) end = true;
        sem_signal(s12);
    80001978:	0000b517          	auipc	a0,0xb
    8000197c:	75853503          	ld	a0,1880(a0) # 8000d0d0 <s12>
    80001980:	00000097          	auipc	ra,0x0
    80001984:	c50080e7          	jalr	-944(ra) # 800015d0 <_Z10sem_signalP4KSem>
    while (!end) {
    80001988:	0000b797          	auipc	a5,0xb
    8000198c:	7387c783          	lbu	a5,1848(a5) # 8000d0c0 <end>
    80001990:	04079063          	bnez	a5,800019d0 <_Z2f1Pv+0x74>
        sem_wait(s31);
    80001994:	0000b517          	auipc	a0,0xb
    80001998:	73453503          	ld	a0,1844(a0) # 8000d0c8 <s31>
    8000199c:	00000097          	auipc	ra,0x0
    800019a0:	c04080e7          	jalr	-1020(ra) # 800015a0 <_Z8sem_waitP4KSem>
        printString("nit 1\n");
    800019a4:	00008517          	auipc	a0,0x8
    800019a8:	68450513          	addi	a0,a0,1668 # 8000a028 <CONSOLE_STATUS+0x18>
    800019ac:	00005097          	auipc	ra,0x5
    800019b0:	8d4080e7          	jalr	-1836(ra) # 80006280 <_Z11printStringPKc>
        if (++i == 4) end = true;
    800019b4:	0014849b          	addiw	s1,s1,1
    800019b8:	00400793          	li	a5,4
    800019bc:	faf49ee3          	bne	s1,a5,80001978 <_Z2f1Pv+0x1c>
    800019c0:	00100793          	li	a5,1
    800019c4:	0000b717          	auipc	a4,0xb
    800019c8:	6ef70e23          	sb	a5,1788(a4) # 8000d0c0 <end>
    800019cc:	fadff06f          	j	80001978 <_Z2f1Pv+0x1c>
    }

    printString("\nGotova nit 1\n");
    800019d0:	00008517          	auipc	a0,0x8
    800019d4:	65050513          	addi	a0,a0,1616 # 8000a020 <CONSOLE_STATUS+0x10>
    800019d8:	00005097          	auipc	ra,0x5
    800019dc:	8a8080e7          	jalr	-1880(ra) # 80006280 <_Z11printStringPKc>
}
    800019e0:	01813083          	ld	ra,24(sp)
    800019e4:	01013403          	ld	s0,16(sp)
    800019e8:	00813483          	ld	s1,8(sp)
    800019ec:	02010113          	addi	sp,sp,32
    800019f0:	00008067          	ret

00000000800019f4 <_Z2f2Pv>:


void f2(void*) {
    800019f4:	fe010113          	addi	sp,sp,-32
    800019f8:	00113c23          	sd	ra,24(sp)
    800019fc:	00813823          	sd	s0,16(sp)
    80001a00:	00913423          	sd	s1,8(sp)
    80001a04:	02010413          	addi	s0,sp,32
    while (!end) {
    80001a08:	0000b797          	auipc	a5,0xb
    80001a0c:	6b87c783          	lbu	a5,1720(a5) # 8000d0c0 <end>
    80001a10:	02079c63          	bnez	a5,80001a48 <_Z2f2Pv+0x54>
        sem_wait(s12);
    80001a14:	0000b497          	auipc	s1,0xb
    80001a18:	6ac48493          	addi	s1,s1,1708 # 8000d0c0 <end>
    80001a1c:	0104b503          	ld	a0,16(s1)
    80001a20:	00000097          	auipc	ra,0x0
    80001a24:	b80080e7          	jalr	-1152(ra) # 800015a0 <_Z8sem_waitP4KSem>
        printString("nit 2\n");
    80001a28:	00008517          	auipc	a0,0x8
    80001a2c:	61050513          	addi	a0,a0,1552 # 8000a038 <CONSOLE_STATUS+0x28>
    80001a30:	00005097          	auipc	ra,0x5
    80001a34:	850080e7          	jalr	-1968(ra) # 80006280 <_Z11printStringPKc>
        sem_signal(s23);
    80001a38:	0184b503          	ld	a0,24(s1)
    80001a3c:	00000097          	auipc	ra,0x0
    80001a40:	b94080e7          	jalr	-1132(ra) # 800015d0 <_Z10sem_signalP4KSem>
    while (!end) {
    80001a44:	fc5ff06f          	j	80001a08 <_Z2f2Pv+0x14>
    }


    printString("\nGotova nit 2\n");
    80001a48:	00008517          	auipc	a0,0x8
    80001a4c:	5e850513          	addi	a0,a0,1512 # 8000a030 <CONSOLE_STATUS+0x20>
    80001a50:	00005097          	auipc	ra,0x5
    80001a54:	830080e7          	jalr	-2000(ra) # 80006280 <_Z11printStringPKc>
}
    80001a58:	01813083          	ld	ra,24(sp)
    80001a5c:	01013403          	ld	s0,16(sp)
    80001a60:	00813483          	ld	s1,8(sp)
    80001a64:	02010113          	addi	sp,sp,32
    80001a68:	00008067          	ret

0000000080001a6c <_Z2f3Pv>:


void f3(void*) {
    80001a6c:	fe010113          	addi	sp,sp,-32
    80001a70:	00113c23          	sd	ra,24(sp)
    80001a74:	00813823          	sd	s0,16(sp)
    80001a78:	00913423          	sd	s1,8(sp)
    80001a7c:	02010413          	addi	s0,sp,32
    while (!end) {
    80001a80:	0000b797          	auipc	a5,0xb
    80001a84:	6407c783          	lbu	a5,1600(a5) # 8000d0c0 <end>
    80001a88:	02079c63          	bnez	a5,80001ac0 <_Z2f3Pv+0x54>
        sem_wait(s23);
    80001a8c:	0000b497          	auipc	s1,0xb
    80001a90:	63448493          	addi	s1,s1,1588 # 8000d0c0 <end>
    80001a94:	0184b503          	ld	a0,24(s1)
    80001a98:	00000097          	auipc	ra,0x0
    80001a9c:	b08080e7          	jalr	-1272(ra) # 800015a0 <_Z8sem_waitP4KSem>
        printString("nit 3\n");
    80001aa0:	00008517          	auipc	a0,0x8
    80001aa4:	5a050513          	addi	a0,a0,1440 # 8000a040 <CONSOLE_STATUS+0x30>
    80001aa8:	00004097          	auipc	ra,0x4
    80001aac:	7d8080e7          	jalr	2008(ra) # 80006280 <_Z11printStringPKc>
        sem_signal(s31);
    80001ab0:	0084b503          	ld	a0,8(s1)
    80001ab4:	00000097          	auipc	ra,0x0
    80001ab8:	b1c080e7          	jalr	-1252(ra) # 800015d0 <_Z10sem_signalP4KSem>
    while (!end) {
    80001abc:	fc5ff06f          	j	80001a80 <_Z2f3Pv+0x14>
    }

    printString("\nGotova nit3\n");
    80001ac0:	00008517          	auipc	a0,0x8
    80001ac4:	58850513          	addi	a0,a0,1416 # 8000a048 <CONSOLE_STATUS+0x38>
    80001ac8:	00004097          	auipc	ra,0x4
    80001acc:	7b8080e7          	jalr	1976(ra) # 80006280 <_Z11printStringPKc>
}
    80001ad0:	01813083          	ld	ra,24(sp)
    80001ad4:	01013403          	ld	s0,16(sp)
    80001ad8:	00813483          	ld	s1,8(sp)
    80001adc:	02010113          	addi	sp,sp,32
    80001ae0:	00008067          	ret

0000000080001ae4 <_Z5main4v>:


int main4() {
    80001ae4:	fb010113          	addi	sp,sp,-80
    80001ae8:	04113423          	sd	ra,72(sp)
    80001aec:	04813023          	sd	s0,64(sp)
    80001af0:	02913c23          	sd	s1,56(sp)
    80001af4:	03213823          	sd	s2,48(sp)
    80001af8:	03313423          	sd	s3,40(sp)
    80001afc:	03413023          	sd	s4,32(sp)
    80001b00:	05010413          	addi	s0,sp,80
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001b04:	0000b797          	auipc	a5,0xb
    80001b08:	4947b783          	ld	a5,1172(a5) # 8000cf98 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001b0c:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80001b10:	00000097          	auipc	ra,0x0
    80001b14:	55c080e7          	jalr	1372(ra) # 8000206c <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001b18:	00000097          	auipc	ra,0x0
    80001b1c:	bf4080e7          	jalr	-1036(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>


    //testiranje kreiranja niti
    thread_t glavnaNit = nullptr;
    80001b20:	fc043423          	sd	zero,-56(s0)
    thread_t idleNit = nullptr;
    80001b24:	fc043023          	sd	zero,-64(s0)
    thread_t kernelConsumerThread = nullptr;
    80001b28:	fa043c23          	sd	zero,-72(s0)
    thread_create(&glavnaNit, (TCB::Body)main, nullptr);
    80001b2c:	00000613          	li	a2,0
    80001b30:	0000b597          	auipc	a1,0xb
    80001b34:	4485b583          	ld	a1,1096(a1) # 8000cf78 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001b38:	fc840513          	addi	a0,s0,-56
    80001b3c:	00000097          	auipc	ra,0x0
    80001b40:	8c8080e7          	jalr	-1848(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>

    ThreadQueue* getListOfJoiningThreads(){return &waitingToJoin;}

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }
    80001b44:	fc843703          	ld	a4,-56(s0)
    80001b48:	0000b797          	auipc	a5,0xb
    80001b4c:	4407b783          	ld	a5,1088(a5) # 8000cf88 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001b50:	00e7b023          	sd	a4,0(a5)
    TCB::setRunning(glavnaNit);
    thread_create(&idleNit, idle, nullptr);
    80001b54:	00000613          	li	a2,0
    80001b58:	0000b597          	auipc	a1,0xb
    80001b5c:	4505b583          	ld	a1,1104(a1) # 8000cfa8 <_GLOBAL_OFFSET_TABLE_+0x90>
    80001b60:	fc040513          	addi	a0,s0,-64
    80001b64:	00000097          	auipc	ra,0x0
    80001b68:	8a0080e7          	jalr	-1888(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    80001b6c:	00000613          	li	a2,0
    80001b70:	0000b597          	auipc	a1,0xb
    80001b74:	3e05b583          	ld	a1,992(a1) # 8000cf50 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001b78:	fb840513          	addi	a0,s0,-72
    80001b7c:	00000097          	auipc	ra,0x0
    80001b80:	888080e7          	jalr	-1912(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>

    Thread* nit1 = new Thread(f1, nullptr);
    80001b84:	02000513          	li	a0,32
    80001b88:	00001097          	auipc	ra,0x1
    80001b8c:	490080e7          	jalr	1168(ra) # 80003018 <_Znwm>
    80001b90:	00050993          	mv	s3,a0
    80001b94:	00000613          	li	a2,0
    80001b98:	00000597          	auipc	a1,0x0
    80001b9c:	dc458593          	addi	a1,a1,-572 # 8000195c <_Z2f1Pv>
    80001ba0:	00001097          	auipc	ra,0x1
    80001ba4:	598080e7          	jalr	1432(ra) # 80003138 <_ZN6ThreadC1EPFvPvES0_>
    Thread* nit2 = new Thread(f2, nullptr);
    80001ba8:	02000513          	li	a0,32
    80001bac:	00001097          	auipc	ra,0x1
    80001bb0:	46c080e7          	jalr	1132(ra) # 80003018 <_Znwm>
    80001bb4:	00050913          	mv	s2,a0
    80001bb8:	00000613          	li	a2,0
    80001bbc:	00000597          	auipc	a1,0x0
    80001bc0:	e3858593          	addi	a1,a1,-456 # 800019f4 <_Z2f2Pv>
    80001bc4:	00001097          	auipc	ra,0x1
    80001bc8:	574080e7          	jalr	1396(ra) # 80003138 <_ZN6ThreadC1EPFvPvES0_>
    Thread* nit3 = new Thread(f3, nullptr);
    80001bcc:	02000513          	li	a0,32
    80001bd0:	00001097          	auipc	ra,0x1
    80001bd4:	448080e7          	jalr	1096(ra) # 80003018 <_Znwm>
    80001bd8:	00050493          	mv	s1,a0
    80001bdc:	00000613          	li	a2,0
    80001be0:	00000597          	auipc	a1,0x0
    80001be4:	e8c58593          	addi	a1,a1,-372 # 80001a6c <_Z2f3Pv>
    80001be8:	00001097          	auipc	ra,0x1
    80001bec:	550080e7          	jalr	1360(ra) # 80003138 <_ZN6ThreadC1EPFvPvES0_>
    80001bf0:	0580006f          	j	80001c48 <_Z5main4v+0x164>
    80001bf4:	00050493          	mv	s1,a0
    Thread* nit1 = new Thread(f1, nullptr);
    80001bf8:	00098513          	mv	a0,s3
    80001bfc:	00001097          	auipc	ra,0x1
    80001c00:	46c080e7          	jalr	1132(ra) # 80003068 <_ZdlPv>
    80001c04:	00048513          	mv	a0,s1
    80001c08:	0000c097          	auipc	ra,0xc
    80001c0c:	660080e7          	jalr	1632(ra) # 8000e268 <_Unwind_Resume>
    80001c10:	00050493          	mv	s1,a0
    Thread* nit2 = new Thread(f2, nullptr);
    80001c14:	00090513          	mv	a0,s2
    80001c18:	00001097          	auipc	ra,0x1
    80001c1c:	450080e7          	jalr	1104(ra) # 80003068 <_ZdlPv>
    80001c20:	00048513          	mv	a0,s1
    80001c24:	0000c097          	auipc	ra,0xc
    80001c28:	644080e7          	jalr	1604(ra) # 8000e268 <_Unwind_Resume>
    80001c2c:	00050913          	mv	s2,a0
    Thread* nit3 = new Thread(f3, nullptr);
    80001c30:	00048513          	mv	a0,s1
    80001c34:	00001097          	auipc	ra,0x1
    80001c38:	434080e7          	jalr	1076(ra) # 80003068 <_ZdlPv>
    80001c3c:	00090513          	mv	a0,s2
    80001c40:	0000c097          	auipc	ra,0xc
    80001c44:	628080e7          	jalr	1576(ra) # 8000e268 <_Unwind_Resume>
    sem_open(&s12, 0);
    80001c48:	00000593          	li	a1,0
    80001c4c:	0000b517          	auipc	a0,0xb
    80001c50:	48450513          	addi	a0,a0,1156 # 8000d0d0 <s12>
    80001c54:	00000097          	auipc	ra,0x0
    80001c58:	8e4080e7          	jalr	-1820(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&s23, 0);
    80001c5c:	00000593          	li	a1,0
    80001c60:	0000b517          	auipc	a0,0xb
    80001c64:	47850513          	addi	a0,a0,1144 # 8000d0d8 <s23>
    80001c68:	00000097          	auipc	ra,0x0
    80001c6c:	8d0080e7          	jalr	-1840(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&s31, 1);
    80001c70:	00100593          	li	a1,1
    80001c74:	0000b517          	auipc	a0,0xb
    80001c78:	45450513          	addi	a0,a0,1108 # 8000d0c8 <s31>
    80001c7c:	00000097          	auipc	ra,0x0
    80001c80:	8bc080e7          	jalr	-1860(ra) # 80001538 <_Z8sem_openPP4KSemj>
    nit1->start();
    80001c84:	00098513          	mv	a0,s3
    80001c88:	00001097          	auipc	ra,0x1
    80001c8c:	548080e7          	jalr	1352(ra) # 800031d0 <_ZN6Thread5startEv>
    nit2->start();
    80001c90:	00090513          	mv	a0,s2
    80001c94:	00001097          	auipc	ra,0x1
    80001c98:	53c080e7          	jalr	1340(ra) # 800031d0 <_ZN6Thread5startEv>
    nit3->start();
    80001c9c:	00048513          	mv	a0,s1
    80001ca0:	00001097          	auipc	ra,0x1
    80001ca4:	530080e7          	jalr	1328(ra) # 800031d0 <_ZN6Thread5startEv>
    end = false;
    80001ca8:	0000b797          	auipc	a5,0xb
    80001cac:	40078c23          	sb	zero,1048(a5) # 8000d0c0 <end>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001cb0:	00200a13          	li	s4,2
    80001cb4:	100a2073          	csrs	sstatus,s4

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    nit1->join();
    80001cb8:	00098513          	mv	a0,s3
    80001cbc:	00001097          	auipc	ra,0x1
    80001cc0:	55c080e7          	jalr	1372(ra) # 80003218 <_ZN6Thread4joinEv>
    nit2->join();
    80001cc4:	00090513          	mv	a0,s2
    80001cc8:	00001097          	auipc	ra,0x1
    80001ccc:	550080e7          	jalr	1360(ra) # 80003218 <_ZN6Thread4joinEv>
    nit3->join();
    80001cd0:	00048513          	mv	a0,s1
    80001cd4:	00001097          	auipc	ra,0x1
    80001cd8:	544080e7          	jalr	1348(ra) # 80003218 <_ZN6Thread4joinEv>


    printString("\nGotove user niti\n");
    80001cdc:	00008517          	auipc	a0,0x8
    80001ce0:	37c50513          	addi	a0,a0,892 # 8000a058 <CONSOLE_STATUS+0x48>
    80001ce4:	00004097          	auipc	ra,0x4
    80001ce8:	59c080e7          	jalr	1436(ra) # 80006280 <_Z11printStringPKc>

    printString("\nSad cu da izadjem\n");
    80001cec:	00008517          	auipc	a0,0x8
    80001cf0:	38450513          	addi	a0,a0,900 # 8000a070 <CONSOLE_STATUS+0x60>
    80001cf4:	00004097          	auipc	ra,0x4
    80001cf8:	58c080e7          	jalr	1420(ra) # 80006280 <_Z11printStringPKc>
    //stavlja karakter u ulazni bafer; ako je bafer pun, ignorise se
    static void placeInInput(char c);

    //ispis svih preostalih karaktera u izlaznom baferu
    static void flush() {
        __asm__ volatile("li a0, 0x43");
    80001cfc:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80001d00:	00000073          	ecall
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001d04:	100a3073          	csrc	sstatus,s4
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);


    return 0;
    80001d08:	00000513          	li	a0,0
    80001d0c:	04813083          	ld	ra,72(sp)
    80001d10:	04013403          	ld	s0,64(sp)
    80001d14:	03813483          	ld	s1,56(sp)
    80001d18:	03013903          	ld	s2,48(sp)
    80001d1c:	02813983          	ld	s3,40(sp)
    80001d20:	02013a03          	ld	s4,32(sp)
    80001d24:	05010113          	addi	sp,sp,80
    80001d28:	00008067          	ret

0000000080001d2c <_ZN9Scheduler3putEP3TCB>:

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    80001d2c:	ff010113          	addi	sp,sp,-16
    80001d30:	00813423          	sd	s0,8(sp)
    80001d34:	01010413          	addi	s0,sp,16
    if (tail == nullptr) {
    80001d38:	0000b797          	auipc	a5,0xb
    80001d3c:	3a87b783          	ld	a5,936(a5) # 8000d0e0 <_ZN9Scheduler4tailE>
    80001d40:	02078263          	beqz	a5,80001d64 <_ZN9Scheduler3putEP3TCB+0x38>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    80001d44:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    80001d48:	0000b797          	auipc	a5,0xb
    80001d4c:	38a7bc23          	sd	a0,920(a5) # 8000d0e0 <_ZN9Scheduler4tailE>
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001d50:	00100793          	li	a5,1
    80001d54:	04f52c23          	sw	a5,88(a0)
    }
    tcb->setStatus(TCB::ACTIVE);
}
    80001d58:	00813403          	ld	s0,8(sp)
    80001d5c:	01010113          	addi	sp,sp,16
    80001d60:	00008067          	ret
        head = tail = tcb;
    80001d64:	0000b797          	auipc	a5,0xb
    80001d68:	37c78793          	addi	a5,a5,892 # 8000d0e0 <_ZN9Scheduler4tailE>
    80001d6c:	00a7b023          	sd	a0,0(a5)
    80001d70:	00a7b423          	sd	a0,8(a5)
    80001d74:	fddff06f          	j	80001d50 <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001d78 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001d78:	ff010113          	addi	sp,sp,-16
    80001d7c:	00813423          	sd	s0,8(sp)
    80001d80:	01010413          	addi	s0,sp,16
    TCB* firstThread = head;
    80001d84:	0000b717          	auipc	a4,0xb
    80001d88:	35c70713          	addi	a4,a4,860 # 8000d0e0 <_ZN9Scheduler4tailE>
    80001d8c:	00873503          	ld	a0,8(a4)
    head = head->nextInScheduler;
    80001d90:	03053783          	ld	a5,48(a0)
    80001d94:	00f73423          	sd	a5,8(a4)
    if (head == nullptr) {
    80001d98:	00078a63          	beqz	a5,80001dac <_ZN9Scheduler3getEv+0x34>
        tail = head = nullptr;
    }
    firstThread->nextInScheduler = nullptr;
    80001d9c:	02053823          	sd	zero,48(a0)
    return firstThread;
}
    80001da0:	00813403          	ld	s0,8(sp)
    80001da4:	01010113          	addi	sp,sp,16
    80001da8:	00008067          	ret
        tail = head = nullptr;
    80001dac:	00073423          	sd	zero,8(a4)
    80001db0:	00073023          	sd	zero,0(a4)
    80001db4:	fe9ff06f          	j	80001d9c <_ZN9Scheduler3getEv+0x24>

0000000080001db8 <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    80001db8:	ff010113          	addi	sp,sp,-16
    80001dbc:	00813423          	sd	s0,8(sp)
    80001dc0:	01010413          	addi	s0,sp,16
    tcb->status = TCB::SLEEPING;
    80001dc4:	00400793          	li	a5,4
    80001dc8:	04f52c23          	sw	a5,88(a0)
    if (sleepingHead == nullptr) {
    80001dcc:	0000b817          	auipc	a6,0xb
    80001dd0:	32483803          	ld	a6,804(a6) # 8000d0f0 <_ZN9Scheduler12sleepingHeadE>
    80001dd4:	02080863          	beqz	a6,80001e04 <_ZN9Scheduler10putToSleepEP3TCBm+0x4c>
        tcb->timeToSleep = sleepTime;
        return;
    }
    TCB* prevSleeping = nullptr;
    time_t accumulated = 0;
    TCB* current = sleepingHead;
    80001dd8:	00080793          	mv	a5,a6
    time_t accumulated = 0;
    80001ddc:	00000693          	li	a3,0
    TCB* prevSleeping = nullptr;
    80001de0:	00000613          	li	a2,0
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001de4:	02078863          	beqz	a5,80001e14 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
    80001de8:	0387b703          	ld	a4,56(a5)
    80001dec:	00d70733          	add	a4,a4,a3
    80001df0:	02b77263          	bgeu	a4,a1,80001e14 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
        accumulated += current->timeToSleep;
    80001df4:	00070693          	mv	a3,a4
        prevSleeping = current;
    80001df8:	00078613          	mv	a2,a5
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001dfc:	0407b783          	ld	a5,64(a5)
    80001e00:	fe5ff06f          	j	80001de4 <_ZN9Scheduler10putToSleepEP3TCBm+0x2c>
        sleepingHead = tcb;
    80001e04:	0000b797          	auipc	a5,0xb
    80001e08:	2ea7b623          	sd	a0,748(a5) # 8000d0f0 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80001e0c:	02b53c23          	sd	a1,56(a0)
        return;
    80001e10:	02c0006f          	j	80001e3c <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    }
    if (!prevSleeping) {
    80001e14:	02060a63          	beqz	a2,80001e48 <_ZN9Scheduler10putToSleepEP3TCBm+0x90>
        sleepingHead = tcb;
        tcb->timeToSleep = sleepTime;
        tcb->nextSleeping->timeToSleep -= sleepTime;
        return;
    }
    tcb->nextSleeping = current;
    80001e18:	04f53023          	sd	a5,64(a0)
    prevSleeping->nextSleeping = tcb;
    80001e1c:	04a63023          	sd	a0,64(a2)
    tcb->timeToSleep = sleepTime - accumulated;
    80001e20:	40d58733          	sub	a4,a1,a3
    80001e24:	02e53c23          	sd	a4,56(a0)
    if (current) current->timeToSleep -= sleepTime - accumulated;
    80001e28:	00078a63          	beqz	a5,80001e3c <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    80001e2c:	40b686b3          	sub	a3,a3,a1
    80001e30:	0387b703          	ld	a4,56(a5)
    80001e34:	00d706b3          	add	a3,a4,a3
    80001e38:	02d7bc23          	sd	a3,56(a5)
}
    80001e3c:	00813403          	ld	s0,8(sp)
    80001e40:	01010113          	addi	sp,sp,16
    80001e44:	00008067          	ret
        tcb->nextSleeping = sleepingHead;
    80001e48:	05053023          	sd	a6,64(a0)
        sleepingHead = tcb;
    80001e4c:	0000b797          	auipc	a5,0xb
    80001e50:	2aa7b223          	sd	a0,676(a5) # 8000d0f0 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80001e54:	02b53c23          	sd	a1,56(a0)
        tcb->nextSleeping->timeToSleep -= sleepTime;
    80001e58:	03883683          	ld	a3,56(a6)
    80001e5c:	40b686b3          	sub	a3,a3,a1
    80001e60:	02d83c23          	sd	a3,56(a6)
        return;
    80001e64:	fd9ff06f          	j	80001e3c <_ZN9Scheduler10putToSleepEP3TCBm+0x84>

0000000080001e68 <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
    if (!sleepingHead) return;
    80001e68:	0000b797          	auipc	a5,0xb
    80001e6c:	2887b783          	ld	a5,648(a5) # 8000d0f0 <_ZN9Scheduler12sleepingHeadE>
    80001e70:	06078a63          	beqz	a5,80001ee4 <_ZN9Scheduler4wakeEv+0x7c>
    sleepingHead->timeToSleep--;
    80001e74:	0387b703          	ld	a4,56(a5)
    80001e78:	fff70713          	addi	a4,a4,-1
    80001e7c:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001e80:	0000b517          	auipc	a0,0xb
    80001e84:	27053503          	ld	a0,624(a0) # 8000d0f0 <_ZN9Scheduler12sleepingHeadE>
    80001e88:	04050e63          	beqz	a0,80001ee4 <_ZN9Scheduler4wakeEv+0x7c>
    80001e8c:	03853783          	ld	a5,56(a0)
    80001e90:	04079a63          	bnez	a5,80001ee4 <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    80001e94:	ff010113          	addi	sp,sp,-16
    80001e98:	00113423          	sd	ra,8(sp)
    80001e9c:	00813023          	sd	s0,0(sp)
    80001ea0:	01010413          	addi	s0,sp,16
    80001ea4:	00c0006f          	j	80001eb0 <_ZN9Scheduler4wakeEv+0x48>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001ea8:	03853783          	ld	a5,56(a0)
    80001eac:	02079463          	bnez	a5,80001ed4 <_ZN9Scheduler4wakeEv+0x6c>
        TCB* thread = sleepingHead;
        sleepingHead = sleepingHead->nextSleeping;
    80001eb0:	04053783          	ld	a5,64(a0)
    80001eb4:	0000b717          	auipc	a4,0xb
    80001eb8:	22f73e23          	sd	a5,572(a4) # 8000d0f0 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    80001ebc:	04053023          	sd	zero,64(a0)
        Scheduler::put(thread);
    80001ec0:	00000097          	auipc	ra,0x0
    80001ec4:	e6c080e7          	jalr	-404(ra) # 80001d2c <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001ec8:	0000b517          	auipc	a0,0xb
    80001ecc:	22853503          	ld	a0,552(a0) # 8000d0f0 <_ZN9Scheduler12sleepingHeadE>
    80001ed0:	fc051ce3          	bnez	a0,80001ea8 <_ZN9Scheduler4wakeEv+0x40>
    }
}
    80001ed4:	00813083          	ld	ra,8(sp)
    80001ed8:	00013403          	ld	s0,0(sp)
    80001edc:	01010113          	addi	sp,sp,16
    80001ee0:	00008067          	ret
    80001ee4:	00008067          	ret

0000000080001ee8 <_ZN7KMemory7kmallocEm>:
    kmalloc(blocksForBitVector);

    initialized = true;
}

void* KMemory::kmalloc(size_t size) {
    80001ee8:	ff010113          	addi	sp,sp,-16
    80001eec:	00813423          	sd	s0,8(sp)
    80001ef0:	01010413          	addi	s0,sp,16
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80001ef4:	16050063          	beqz	a0,80002054 <_ZN7KMemory7kmallocEm+0x16c>
    80001ef8:	0000b797          	auipc	a5,0xb
    80001efc:	2007b783          	ld	a5,512(a5) # 8000d0f8 <_ZN7KMemory14freeBlocksLeftE>
    80001f00:	14a7ee63          	bltu	a5,a0,8000205c <_ZN7KMemory7kmallocEm+0x174>
    uint64 currentElem = 0;
    uint64 currentBit = 63;
    uint64 firstZeroElem = 0;
    uint64 firstZeroBit = 63;
    uint64 zerosFound = 0;
    bool zeroFound = false;
    80001f04:	00000313          	li	t1,0
    uint64 zerosFound = 0;
    80001f08:	00000713          	li	a4,0
    uint64 firstZeroBit = 63;
    80001f0c:	03f00813          	li	a6,63
    uint64 firstZeroElem = 0;
    80001f10:	00000893          	li	a7,0
    uint64 currentBit = 63;
    80001f14:	03f00793          	li	a5,63
    uint64 currentElem = 0;
    80001f18:	00000593          	li	a1,0
    80001f1c:	0080006f          	j	80001f24 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroElem = currentElem;
        } else {
            zerosFound++;
        }
        if (zerosFound == size) break;
        if (currentBit-- == 0) {
    80001f20:	00068793          	mv	a5,a3
    while (currentElem < sizeOfBitVectorInUint64) {
    80001f24:	0000b697          	auipc	a3,0xb
    80001f28:	1dc6b683          	ld	a3,476(a3) # 8000d100 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001f2c:	08d5fa63          	bgeu	a1,a3,80001fc0 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001f30:	03f00693          	li	a3,63
    80001f34:	02d78a63          	beq	a5,a3,80001f68 <_ZN7KMemory7kmallocEm+0x80>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    80001f38:	00359693          	slli	a3,a1,0x3
    80001f3c:	0000b617          	auipc	a2,0xb
    80001f40:	1cc63603          	ld	a2,460(a2) # 8000d108 <_ZN7KMemory9bitVectorE>
    80001f44:	00d606b3          	add	a3,a2,a3
    80001f48:	0006b683          	ld	a3,0(a3)

    static uint64 freeBlocksLeft;

    //maska sa 1 na mestu bitPos i ostalim nulama (bitPos=0..63)
    inline static uint64 maskBit(uint64 bitPos) {
        return (uint64)1 << bitPos;
    80001f4c:	00100613          	li	a2,1
    80001f50:	00f61633          	sll	a2,a2,a5
    80001f54:	00c6f6b3          	and	a3,a3,a2
        if (bit > 0) {
    80001f58:	02069a63          	bnez	a3,80001f8c <_ZN7KMemory7kmallocEm+0xa4>
        } else if (!zeroFound) {
    80001f5c:	04030863          	beqz	t1,80001fac <_ZN7KMemory7kmallocEm+0xc4>
            zerosFound++;
    80001f60:	00170713          	addi	a4,a4,1
    80001f64:	0300006f          	j	80001f94 <_ZN7KMemory7kmallocEm+0xac>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001f68:	00359693          	slli	a3,a1,0x3
    80001f6c:	0000b617          	auipc	a2,0xb
    80001f70:	19c63603          	ld	a2,412(a2) # 8000d108 <_ZN7KMemory9bitVectorE>
    80001f74:	00d606b3          	add	a3,a2,a3
    80001f78:	0006b603          	ld	a2,0(a3)
    80001f7c:	fff00693          	li	a3,-1
    80001f80:	fad61ce3          	bne	a2,a3,80001f38 <_ZN7KMemory7kmallocEm+0x50>
            currentElem++;
    80001f84:	00158593          	addi	a1,a1,1
            continue;
    80001f88:	f9dff06f          	j	80001f24 <_ZN7KMemory7kmallocEm+0x3c>
            zeroFound = false;
    80001f8c:	00000313          	li	t1,0
            zerosFound = 0;
    80001f90:	00000713          	li	a4,0
        if (zerosFound == size) break;
    80001f94:	02a70663          	beq	a4,a0,80001fc0 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit-- == 0) {
    80001f98:	fff78693          	addi	a3,a5,-1
    80001f9c:	f80792e3          	bnez	a5,80001f20 <_ZN7KMemory7kmallocEm+0x38>
            currentBit = 63;
            currentElem++;
    80001fa0:	00158593          	addi	a1,a1,1
            currentBit = 63;
    80001fa4:	03f00793          	li	a5,63
    80001fa8:	f7dff06f          	j	80001f24 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroBit = currentBit;
    80001fac:	00078813          	mv	a6,a5
            firstZeroElem = currentElem;
    80001fb0:	00058893          	mv	a7,a1
            zeroFound = true;
    80001fb4:	00100313          	li	t1,1
            zerosFound = 1;
    80001fb8:	00100713          	li	a4,1
    80001fbc:	fd9ff06f          	j	80001f94 <_ZN7KMemory7kmallocEm+0xac>
        }
    }
    if (zerosFound != size) return nullptr;
    80001fc0:	0aa71263          	bne	a4,a0,80002064 <_ZN7KMemory7kmallocEm+0x17c>

    //alociranje blokova
    uint64 blockNum = firstZeroElem * 64 + (63 - firstZeroBit);
    80001fc4:	00689793          	slli	a5,a7,0x6
    80001fc8:	410787b3          	sub	a5,a5,a6
    80001fcc:	03f78793          	addi	a5,a5,63
    void* addr = (char*)HEAP_START_ADDR + blockNum * MEM_BLOCK_SIZE;
    80001fd0:	0000b697          	auipc	a3,0xb
    80001fd4:	f786b683          	ld	a3,-136(a3) # 8000cf48 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001fd8:	0006b583          	ld	a1,0(a3)
    80001fdc:	00679793          	slli	a5,a5,0x6
    80001fe0:	00f585b3          	add	a1,a1,a5
    *(uint64*)addr = size;  //da znamo koliko blokova je alocirano zaredom
    80001fe4:	00a5b023          	sd	a0,0(a1)

    //upisivanje 1 u bit vektor
    currentElem = firstZeroElem;
    currentBit = firstZeroBit;
    80001fe8:	0080006f          	j	80001ff0 <_ZN7KMemory7kmallocEm+0x108>
    while (zerosFound > 0) {
        bitVector[currentElem] |= maskBit(currentBit);
        zerosFound--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001fec:	00078813          	mv	a6,a5
    while (zerosFound > 0) {
    80001ff0:	04070063          	beqz	a4,80002030 <_ZN7KMemory7kmallocEm+0x148>
    80001ff4:	00100693          	li	a3,1
    80001ff8:	01069633          	sll	a2,a3,a6
        bitVector[currentElem] |= maskBit(currentBit);
    80001ffc:	00389793          	slli	a5,a7,0x3
    80002000:	0000b697          	auipc	a3,0xb
    80002004:	1086b683          	ld	a3,264(a3) # 8000d108 <_ZN7KMemory9bitVectorE>
    80002008:	00f687b3          	add	a5,a3,a5
    8000200c:	0007b683          	ld	a3,0(a5)
    80002010:	00c6e6b3          	or	a3,a3,a2
    80002014:	00d7b023          	sd	a3,0(a5)
        zerosFound--;
    80002018:	fff70713          	addi	a4,a4,-1
        if (currentBit-- == 0) {
    8000201c:	fff80793          	addi	a5,a6,-1
    80002020:	fc0816e3          	bnez	a6,80001fec <_ZN7KMemory7kmallocEm+0x104>
            currentElem++;
    80002024:	00188893          	addi	a7,a7,1
            currentBit = 63;
    80002028:	03f00793          	li	a5,63
    8000202c:	fc1ff06f          	j	80001fec <_ZN7KMemory7kmallocEm+0x104>
        }
    }
    freeBlocksLeft -= size;
    80002030:	0000b717          	auipc	a4,0xb
    80002034:	0c870713          	addi	a4,a4,200 # 8000d0f8 <_ZN7KMemory14freeBlocksLeftE>
    80002038:	00073783          	ld	a5,0(a4)
    8000203c:	40a78533          	sub	a0,a5,a0
    80002040:	00a73023          	sd	a0,0(a4)
    return (char*)addr + 2 * sizeof(uint64);    //offset 2 da bi bilo zaokruzeno na 16 zbog steka
    80002044:	01058513          	addi	a0,a1,16
}
    80002048:	00813403          	ld	s0,8(sp)
    8000204c:	01010113          	addi	sp,sp,16
    80002050:	00008067          	ret
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80002054:	00000513          	li	a0,0
    80002058:	ff1ff06f          	j	80002048 <_ZN7KMemory7kmallocEm+0x160>
    8000205c:	00000513          	li	a0,0
    80002060:	fe9ff06f          	j	80002048 <_ZN7KMemory7kmallocEm+0x160>
    if (zerosFound != size) return nullptr;
    80002064:	00000513          	li	a0,0
    80002068:	fe1ff06f          	j	80002048 <_ZN7KMemory7kmallocEm+0x160>

000000008000206c <_ZN7KMemory16initializeMemoryEv>:
    if (initialized) return;
    8000206c:	0000b797          	auipc	a5,0xb
    80002070:	0a47c783          	lbu	a5,164(a5) # 8000d110 <_ZN7KMemory11initializedE>
    80002074:	0a079863          	bnez	a5,80002124 <_ZN7KMemory16initializeMemoryEv+0xb8>
void KMemory::initializeMemory() {
    80002078:	ff010113          	addi	sp,sp,-16
    8000207c:	00113423          	sd	ra,8(sp)
    80002080:	00813023          	sd	s0,0(sp)
    80002084:	01010413          	addi	s0,sp,16
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80002088:	0000b797          	auipc	a5,0xb
    8000208c:	f087b783          	ld	a5,-248(a5) # 8000cf90 <_GLOBAL_OFFSET_TABLE_+0x78>
    80002090:	0007b783          	ld	a5,0(a5)
    80002094:	0000b717          	auipc	a4,0xb
    80002098:	eb473703          	ld	a4,-332(a4) # 8000cf48 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000209c:	00073603          	ld	a2,0(a4)
    800020a0:	40c787b3          	sub	a5,a5,a2
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    800020a4:	00c7d793          	srli	a5,a5,0xc
    800020a8:	0000b717          	auipc	a4,0xb
    800020ac:	05070713          	addi	a4,a4,80 # 8000d0f8 <_ZN7KMemory14freeBlocksLeftE>
    800020b0:	00f73423          	sd	a5,8(a4)
    numOfBlocks = sizeOfBitVectorInUint64 * sizeof(uint64) * 8; //da se zaokruzi broj postojecih blokova na umnozak 64
    800020b4:	00679693          	slli	a3,a5,0x6
    800020b8:	02d73023          	sd	a3,32(a4)
    uint64 blocksForBitVector = (sizeOfBitVectorInUint64 * sizeof(uint64) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    800020bc:	00878513          	addi	a0,a5,8
    800020c0:	00351513          	slli	a0,a0,0x3
    800020c4:	fff50513          	addi	a0,a0,-1
    800020c8:	00655513          	srli	a0,a0,0x6
    bitVector = (uint64*)HEAP_START_ADDR;
    800020cc:	00c73823          	sd	a2,16(a4)
    freeBlocksLeft = numOfBlocks;
    800020d0:	00d73023          	sd	a3,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    800020d4:	00000793          	li	a5,0
    800020d8:	0000b717          	auipc	a4,0xb
    800020dc:	02873703          	ld	a4,40(a4) # 8000d100 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    800020e0:	02e7f063          	bgeu	a5,a4,80002100 <_ZN7KMemory16initializeMemoryEv+0x94>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    800020e4:	00379693          	slli	a3,a5,0x3
    800020e8:	0000b717          	auipc	a4,0xb
    800020ec:	02073703          	ld	a4,32(a4) # 8000d108 <_ZN7KMemory9bitVectorE>
    800020f0:	00d70733          	add	a4,a4,a3
    800020f4:	00073023          	sd	zero,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    800020f8:	00178793          	addi	a5,a5,1
    800020fc:	fddff06f          	j	800020d8 <_ZN7KMemory16initializeMemoryEv+0x6c>
    kmalloc(blocksForBitVector);
    80002100:	00000097          	auipc	ra,0x0
    80002104:	de8080e7          	jalr	-536(ra) # 80001ee8 <_ZN7KMemory7kmallocEm>
    initialized = true;
    80002108:	00100793          	li	a5,1
    8000210c:	0000b717          	auipc	a4,0xb
    80002110:	00f70223          	sb	a5,4(a4) # 8000d110 <_ZN7KMemory11initializedE>
}
    80002114:	00813083          	ld	ra,8(sp)
    80002118:	00013403          	ld	s0,0(sp)
    8000211c:	01010113          	addi	sp,sp,16
    80002120:	00008067          	ret
    80002124:	00008067          	ret

0000000080002128 <_ZN7KMemory5kfreeEPv>:

int KMemory::kfree(void* ptr) {
    80002128:	ff010113          	addi	sp,sp,-16
    8000212c:	00813423          	sd	s0,8(sp)
    80002130:	01010413          	addi	s0,sp,16
    if (!ptr) return 0;
    80002134:	08050a63          	beqz	a0,800021c8 <_ZN7KMemory5kfreeEPv+0xa0>
    ptr = (char*)ptr - 2 * sizeof(uint64);
    80002138:	ff050793          	addi	a5,a0,-16
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    8000213c:	0000b717          	auipc	a4,0xb
    80002140:	e0c73703          	ld	a4,-500(a4) # 8000cf48 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002144:	00073703          	ld	a4,0(a4)
    80002148:	40e787b3          	sub	a5,a5,a4
    8000214c:	03f7f713          	andi	a4,a5,63
    80002150:	08071063          	bnez	a4,800021d0 <_ZN7KMemory5kfreeEPv+0xa8>
    uint64 blocksToFree = *(uint64*)ptr;
    80002154:	ff053583          	ld	a1,-16(a0)
    freeBlocksLeft += blocksToFree;
    80002158:	0000b697          	auipc	a3,0xb
    8000215c:	fa068693          	addi	a3,a3,-96 # 8000d0f8 <_ZN7KMemory14freeBlocksLeftE>
    80002160:	0006b703          	ld	a4,0(a3)
    80002164:	00b70733          	add	a4,a4,a1
    80002168:	00e6b023          	sd	a4,0(a3)
    uint64 blockNum = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    8000216c:	0067d613          	srli	a2,a5,0x6
    uint64 currentElem = blockNum / 64;
    80002170:	00c7d513          	srli	a0,a5,0xc
    uint64 currentBit = 63 - blockNum % 64;
    80002174:	fff64613          	not	a2,a2
    80002178:	03f67613          	andi	a2,a2,63
    8000217c:	0080006f          	j	80002184 <_ZN7KMemory5kfreeEPv+0x5c>
    while (blocksToFree > 0) {
        bitVector[currentElem] &= ~maskBit(currentBit);
        blocksToFree--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80002180:	00078613          	mv	a2,a5
    while (blocksToFree > 0) {
    80002184:	04058a63          	beqz	a1,800021d8 <_ZN7KMemory5kfreeEPv+0xb0>
    80002188:	00100793          	li	a5,1
    8000218c:	00c797b3          	sll	a5,a5,a2
        bitVector[currentElem] &= ~maskBit(currentBit);
    80002190:	fff7c793          	not	a5,a5
    80002194:	00351713          	slli	a4,a0,0x3
    80002198:	0000b697          	auipc	a3,0xb
    8000219c:	f706b683          	ld	a3,-144(a3) # 8000d108 <_ZN7KMemory9bitVectorE>
    800021a0:	00e68733          	add	a4,a3,a4
    800021a4:	00073683          	ld	a3,0(a4)
    800021a8:	00f6f7b3          	and	a5,a3,a5
    800021ac:	00f73023          	sd	a5,0(a4)
        blocksToFree--;
    800021b0:	fff58593          	addi	a1,a1,-1
        if (currentBit-- == 0) {
    800021b4:	fff60793          	addi	a5,a2,-1
    800021b8:	fc0614e3          	bnez	a2,80002180 <_ZN7KMemory5kfreeEPv+0x58>
            currentElem++;
    800021bc:	00150513          	addi	a0,a0,1
            currentBit = 63;
    800021c0:	03f00793          	li	a5,63
    800021c4:	fbdff06f          	j	80002180 <_ZN7KMemory5kfreeEPv+0x58>
    if (!ptr) return 0;
    800021c8:	00000513          	li	a0,0
    800021cc:	0100006f          	j	800021dc <_ZN7KMemory5kfreeEPv+0xb4>
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    800021d0:	fff00513          	li	a0,-1
    800021d4:	0080006f          	j	800021dc <_ZN7KMemory5kfreeEPv+0xb4>
        }
    }
    return 0;
    800021d8:	00000513          	li	a0,0
}
    800021dc:	00813403          	ld	s0,8(sp)
    800021e0:	01010113          	addi	sp,sp,16
    800021e4:	00008067          	ret

00000000800021e8 <main>:

extern "C" void interruptHandler();

void userMain();

int main() {
    800021e8:	fc010113          	addi	sp,sp,-64
    800021ec:	02113c23          	sd	ra,56(sp)
    800021f0:	02813823          	sd	s0,48(sp)
    800021f4:	02913423          	sd	s1,40(sp)
    800021f8:	03213023          	sd	s2,32(sp)
    800021fc:	01313c23          	sd	s3,24(sp)
    80002200:	04010413          	addi	s0,sp,64
//postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80002204:	0000b797          	auipc	a5,0xb
    80002208:	d947b783          	ld	a5,-620(a5) # 8000cf98 <_GLOBAL_OFFSET_TABLE_+0x80>
    8000220c:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80002210:	00000097          	auipc	ra,0x0
    80002214:	e5c080e7          	jalr	-420(ra) # 8000206c <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80002218:	fffff097          	auipc	ra,0xfffff
    8000221c:	4f4080e7          	jalr	1268(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>

    //pravljenje niti
    thread_t mainHandle;
    Thread* idleHandle = new IdleThread();
    80002220:	02000513          	li	a0,32
    80002224:	00001097          	auipc	ra,0x1
    80002228:	df4080e7          	jalr	-524(ra) # 80003018 <_Znwm>
    8000222c:	00050913          	mv	s2,a0
    80002230:	00053023          	sd	zero,0(a0)
    80002234:	00053423          	sd	zero,8(a0)
    80002238:	00053823          	sd	zero,16(a0)
    8000223c:	00053c23          	sd	zero,24(a0)
class IdleThread : public Thread {
    80002240:	00001097          	auipc	ra,0x1
    80002244:	0c0080e7          	jalr	192(ra) # 80003300 <_ZN6ThreadC1Ev>
    80002248:	0000b797          	auipc	a5,0xb
    8000224c:	a7078793          	addi	a5,a5,-1424 # 8000ccb8 <_ZTV10IdleThread+0x10>
    80002250:	00f93023          	sd	a5,0(s2)
    Thread* consoleOutputHandle = new KernelConsumer();
    80002254:	02000513          	li	a0,32
    80002258:	00001097          	auipc	ra,0x1
    8000225c:	dc0080e7          	jalr	-576(ra) # 80003018 <_Znwm>
    80002260:	00050493          	mv	s1,a0
    80002264:	00053023          	sd	zero,0(a0)
    80002268:	00053423          	sd	zero,8(a0)
    8000226c:	00053823          	sd	zero,16(a0)
    80002270:	00053c23          	sd	zero,24(a0)
class KernelConsumer : public Thread {
    80002274:	00001097          	auipc	ra,0x1
    80002278:	08c080e7          	jalr	140(ra) # 80003300 <_ZN6ThreadC1Ev>
    8000227c:	0000b797          	auipc	a5,0xb
    80002280:	a6478793          	addi	a5,a5,-1436 # 8000cce0 <_ZTV14KernelConsumer+0x10>
    80002284:	00f4b023          	sd	a5,0(s1)
    Thread* userThr = new Thread((TCB::Body)userMain, nullptr);
    80002288:	02000513          	li	a0,32
    8000228c:	00001097          	auipc	ra,0x1
    80002290:	d8c080e7          	jalr	-628(ra) # 80003018 <_Znwm>
    80002294:	00050993          	mv	s3,a0
    80002298:	00000613          	li	a2,0
    8000229c:	0000b597          	auipc	a1,0xb
    800022a0:	c845b583          	ld	a1,-892(a1) # 8000cf20 <_GLOBAL_OFFSET_TABLE_+0x8>
    800022a4:	00001097          	auipc	ra,0x1
    800022a8:	e94080e7          	jalr	-364(ra) # 80003138 <_ZN6ThreadC1EPFvPvES0_>
    800022ac:	0580006f          	j	80002304 <main+0x11c>
    800022b0:	00050493          	mv	s1,a0
    Thread* idleHandle = new IdleThread();
    800022b4:	00090513          	mv	a0,s2
    800022b8:	00001097          	auipc	ra,0x1
    800022bc:	db0080e7          	jalr	-592(ra) # 80003068 <_ZdlPv>
    800022c0:	00048513          	mv	a0,s1
    800022c4:	0000c097          	auipc	ra,0xc
    800022c8:	fa4080e7          	jalr	-92(ra) # 8000e268 <_Unwind_Resume>
    800022cc:	00050913          	mv	s2,a0
    Thread* consoleOutputHandle = new KernelConsumer();
    800022d0:	00048513          	mv	a0,s1
    800022d4:	00001097          	auipc	ra,0x1
    800022d8:	d94080e7          	jalr	-620(ra) # 80003068 <_ZdlPv>
    800022dc:	00090513          	mv	a0,s2
    800022e0:	0000c097          	auipc	ra,0xc
    800022e4:	f88080e7          	jalr	-120(ra) # 8000e268 <_Unwind_Resume>
    800022e8:	00050493          	mv	s1,a0
    Thread* userThr = new Thread((TCB::Body)userMain, nullptr);
    800022ec:	00098513          	mv	a0,s3
    800022f0:	00001097          	auipc	ra,0x1
    800022f4:	d78080e7          	jalr	-648(ra) # 80003068 <_ZdlPv>
    800022f8:	00048513          	mv	a0,s1
    800022fc:	0000c097          	auipc	ra,0xc
    80002300:	f6c080e7          	jalr	-148(ra) # 8000e268 <_Unwind_Resume>
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    80002304:	00000613          	li	a2,0
    80002308:	00000597          	auipc	a1,0x0
    8000230c:	ee058593          	addi	a1,a1,-288 # 800021e8 <main>
    80002310:	fc840513          	addi	a0,s0,-56
    80002314:	fffff097          	auipc	ra,0xfffff
    80002318:	0f0080e7          	jalr	240(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    8000231c:	fc843783          	ld	a5,-56(s0)
    static void setRunning(TCB* newRunning) { running = newRunning; }
    80002320:	0000b717          	auipc	a4,0xb
    80002324:	c6873703          	ld	a4,-920(a4) # 8000cf88 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002328:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    8000232c:	00100713          	li	a4,1
    80002330:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    idleHandle->start();
    80002334:	00090513          	mv	a0,s2
    80002338:	00001097          	auipc	ra,0x1
    8000233c:	e98080e7          	jalr	-360(ra) # 800031d0 <_ZN6Thread5startEv>
    consoleOutputHandle->start();
    80002340:	00048513          	mv	a0,s1
    80002344:	00001097          	auipc	ra,0x1
    80002348:	e8c080e7          	jalr	-372(ra) # 800031d0 <_ZN6Thread5startEv>
    userThr->start();
    8000234c:	00098513          	mv	a0,s3
    80002350:	00001097          	auipc	ra,0x1
    80002354:	e80080e7          	jalr	-384(ra) # 800031d0 <_ZN6Thread5startEv>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002358:	00200493          	li	s1,2
    8000235c:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    userThr->join();
    80002360:	00098513          	mv	a0,s3
    80002364:	00001097          	auipc	ra,0x1
    80002368:	eb4080e7          	jalr	-332(ra) # 80003218 <_ZN6Thread4joinEv>
        __asm__ volatile("li a0, 0x43");
    8000236c:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80002370:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002374:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80002378:	00000513          	li	a0,0
    8000237c:	03813083          	ld	ra,56(sp)
    80002380:	03013403          	ld	s0,48(sp)
    80002384:	02813483          	ld	s1,40(sp)
    80002388:	02013903          	ld	s2,32(sp)
    8000238c:	01813983          	ld	s3,24(sp)
    80002390:	04010113          	addi	sp,sp,64
    80002394:	00008067          	ret

0000000080002398 <_ZN10IdleThread3runEv>:
    void run() override {
    80002398:	ff010113          	addi	sp,sp,-16
    8000239c:	00113423          	sd	ra,8(sp)
    800023a0:	00813023          	sd	s0,0(sp)
    800023a4:	01010413          	addi	s0,sp,16
        while (1) { thread_dispatch(); }
    800023a8:	fffff097          	auipc	ra,0xfffff
    800023ac:	118080e7          	jalr	280(ra) # 800014c0 <_Z15thread_dispatchv>
    800023b0:	ff9ff06f          	j	800023a8 <_ZN10IdleThread3runEv+0x10>

00000000800023b4 <_ZN10IdleThreadD1Ev>:
class IdleThread : public Thread {
    800023b4:	ff010113          	addi	sp,sp,-16
    800023b8:	00113423          	sd	ra,8(sp)
    800023bc:	00813023          	sd	s0,0(sp)
    800023c0:	01010413          	addi	s0,sp,16
    800023c4:	0000b797          	auipc	a5,0xb
    800023c8:	8f478793          	addi	a5,a5,-1804 # 8000ccb8 <_ZTV10IdleThread+0x10>
    800023cc:	00f53023          	sd	a5,0(a0)
    800023d0:	00001097          	auipc	ra,0x1
    800023d4:	b68080e7          	jalr	-1176(ra) # 80002f38 <_ZN6ThreadD1Ev>
    800023d8:	00813083          	ld	ra,8(sp)
    800023dc:	00013403          	ld	s0,0(sp)
    800023e0:	01010113          	addi	sp,sp,16
    800023e4:	00008067          	ret

00000000800023e8 <_ZN10IdleThreadD0Ev>:
    800023e8:	fe010113          	addi	sp,sp,-32
    800023ec:	00113c23          	sd	ra,24(sp)
    800023f0:	00813823          	sd	s0,16(sp)
    800023f4:	00913423          	sd	s1,8(sp)
    800023f8:	02010413          	addi	s0,sp,32
    800023fc:	00050493          	mv	s1,a0
    80002400:	0000b797          	auipc	a5,0xb
    80002404:	8b878793          	addi	a5,a5,-1864 # 8000ccb8 <_ZTV10IdleThread+0x10>
    80002408:	00f53023          	sd	a5,0(a0)
    8000240c:	00001097          	auipc	ra,0x1
    80002410:	b2c080e7          	jalr	-1236(ra) # 80002f38 <_ZN6ThreadD1Ev>
    80002414:	00048513          	mv	a0,s1
    80002418:	00001097          	auipc	ra,0x1
    8000241c:	c50080e7          	jalr	-944(ra) # 80003068 <_ZdlPv>
    80002420:	01813083          	ld	ra,24(sp)
    80002424:	01013403          	ld	s0,16(sp)
    80002428:	00813483          	ld	s1,8(sp)
    8000242c:	02010113          	addi	sp,sp,32
    80002430:	00008067          	ret

0000000080002434 <_ZN14KernelConsumerD1Ev>:
class KernelConsumer : public Thread {
    80002434:	ff010113          	addi	sp,sp,-16
    80002438:	00113423          	sd	ra,8(sp)
    8000243c:	00813023          	sd	s0,0(sp)
    80002440:	01010413          	addi	s0,sp,16
    80002444:	0000b797          	auipc	a5,0xb
    80002448:	89c78793          	addi	a5,a5,-1892 # 8000cce0 <_ZTV14KernelConsumer+0x10>
    8000244c:	00f53023          	sd	a5,0(a0)
    80002450:	00001097          	auipc	ra,0x1
    80002454:	ae8080e7          	jalr	-1304(ra) # 80002f38 <_ZN6ThreadD1Ev>
    80002458:	00813083          	ld	ra,8(sp)
    8000245c:	00013403          	ld	s0,0(sp)
    80002460:	01010113          	addi	sp,sp,16
    80002464:	00008067          	ret

0000000080002468 <_ZN14KernelConsumerD0Ev>:
    80002468:	fe010113          	addi	sp,sp,-32
    8000246c:	00113c23          	sd	ra,24(sp)
    80002470:	00813823          	sd	s0,16(sp)
    80002474:	00913423          	sd	s1,8(sp)
    80002478:	02010413          	addi	s0,sp,32
    8000247c:	00050493          	mv	s1,a0
    80002480:	0000b797          	auipc	a5,0xb
    80002484:	86078793          	addi	a5,a5,-1952 # 8000cce0 <_ZTV14KernelConsumer+0x10>
    80002488:	00f53023          	sd	a5,0(a0)
    8000248c:	00001097          	auipc	ra,0x1
    80002490:	aac080e7          	jalr	-1364(ra) # 80002f38 <_ZN6ThreadD1Ev>
    80002494:	00048513          	mv	a0,s1
    80002498:	00001097          	auipc	ra,0x1
    8000249c:	bd0080e7          	jalr	-1072(ra) # 80003068 <_ZdlPv>
    800024a0:	01813083          	ld	ra,24(sp)
    800024a4:	01013403          	ld	s0,16(sp)
    800024a8:	00813483          	ld	s1,8(sp)
    800024ac:	02010113          	addi	sp,sp,32
    800024b0:	00008067          	ret

00000000800024b4 <_ZN14KernelConsumer3runEv>:
    void run() override {
    800024b4:	ff010113          	addi	sp,sp,-16
    800024b8:	00113423          	sd	ra,8(sp)
    800024bc:	00813023          	sd	s0,0(sp)
    800024c0:	01010413          	addi	s0,sp,16
    800024c4:	0280006f          	j	800024ec <_ZN14KernelConsumer3runEv+0x38>

    static uint8 getSRvalue() { return *sr; }

    static uint8 getDRvalue() { return *dr; }

    static void setDRvalue(char c) { *dr = c; }
    800024c8:	0000b797          	auipc	a5,0xb
    800024cc:	aa87b783          	ld	a5,-1368(a5) # 8000cf70 <_GLOBAL_OFFSET_TABLE_+0x58>
    800024d0:	0007b783          	ld	a5,0(a5)
    800024d4:	00a78023          	sb	a0,0(a5)
            sem_signal(KConsole::getOutputBufferHasSpace());
    800024d8:	0000b797          	auipc	a5,0xb
    800024dc:	aa87b783          	ld	a5,-1368(a5) # 8000cf80 <_GLOBAL_OFFSET_TABLE_+0x68>
    800024e0:	0007b503          	ld	a0,0(a5)
    800024e4:	fffff097          	auipc	ra,0xfffff
    800024e8:	0ec080e7          	jalr	236(ra) # 800015d0 <_Z10sem_signalP4KSem>
            char c = KConsole::getFromOutput();
    800024ec:	fffff097          	auipc	ra,0xfffff
    800024f0:	2d8080e7          	jalr	728(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    800024f4:	0000b797          	auipc	a5,0xb
    800024f8:	ac47b783          	ld	a5,-1340(a5) # 8000cfb8 <_GLOBAL_OFFSET_TABLE_+0xa0>
    800024fc:	0007b783          	ld	a5,0(a5)
    80002500:	0007c783          	lbu	a5,0(a5)
            while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80002504:	0207f793          	andi	a5,a5,32
    80002508:	fe0786e3          	beqz	a5,800024f4 <_ZN14KernelConsumer3runEv+0x40>
    8000250c:	fbdff06f          	j	800024c8 <_ZN14KernelConsumer3runEv+0x14>

0000000080002510 <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80002510:	ff010113          	addi	sp,sp,-16
    80002514:	00113423          	sd	ra,8(sp)
    80002518:	00813023          	sd	s0,0(sp)
    8000251c:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80002520:	fffff097          	auipc	ra,0xfffff
    80002524:	fa0080e7          	jalr	-96(ra) # 800014c0 <_Z15thread_dispatchv>
    80002528:	ff9ff06f          	j	80002520 <_Z4idlePv+0x10>

000000008000252c <_Z22kernelConsumerFunctionPv>:
}

//salje na izlaz karakter iz izlaznog bafera KConsole
void kernelConsumerFunction(void*) {
    8000252c:	ff010113          	addi	sp,sp,-16
    80002530:	00113423          	sd	ra,8(sp)
    80002534:	00813023          	sd	s0,0(sp)
    80002538:	01010413          	addi	s0,sp,16
    8000253c:	0280006f          	j	80002564 <_Z22kernelConsumerFunctionPv+0x38>
    static void setDRvalue(char c) { *dr = c; }
    80002540:	0000b797          	auipc	a5,0xb
    80002544:	a307b783          	ld	a5,-1488(a5) # 8000cf70 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002548:	0007b783          	ld	a5,0(a5)
    8000254c:	00a78023          	sb	a0,0(a5)
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
        KConsole::setDRvalue(c);
        sem_signal(KConsole::getOutputBufferHasSpace());
    80002550:	0000b797          	auipc	a5,0xb
    80002554:	a307b783          	ld	a5,-1488(a5) # 8000cf80 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002558:	0007b503          	ld	a0,0(a5)
    8000255c:	fffff097          	auipc	ra,0xfffff
    80002560:	074080e7          	jalr	116(ra) # 800015d0 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80002564:	fffff097          	auipc	ra,0xfffff
    80002568:	260080e7          	jalr	608(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    8000256c:	0000b797          	auipc	a5,0xb
    80002570:	a4c7b783          	ld	a5,-1460(a5) # 8000cfb8 <_GLOBAL_OFFSET_TABLE_+0xa0>
    80002574:	0007b783          	ld	a5,0(a5)
    80002578:	0007c783          	lbu	a5,0(a5)
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    8000257c:	0207f793          	andi	a5,a5,32
    80002580:	fe0786e3          	beqz	a5,8000256c <_Z22kernelConsumerFunctionPv+0x40>
    80002584:	fbdff06f          	j	80002540 <_Z22kernelConsumerFunctionPv+0x14>

0000000080002588 <_Z5main1v>:
    }
}

int main1() {
    80002588:	fc010113          	addi	sp,sp,-64
    8000258c:	02113c23          	sd	ra,56(sp)
    80002590:	02813823          	sd	s0,48(sp)
    80002594:	02913423          	sd	s1,40(sp)
    80002598:	04010413          	addi	s0,sp,64
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    8000259c:	0000b797          	auipc	a5,0xb
    800025a0:	9fc7b783          	ld	a5,-1540(a5) # 8000cf98 <_GLOBAL_OFFSET_TABLE_+0x80>
    800025a4:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    800025a8:	00000097          	auipc	ra,0x0
    800025ac:	ac4080e7          	jalr	-1340(ra) # 8000206c <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    800025b0:	fffff097          	auipc	ra,0xfffff
    800025b4:	15c080e7          	jalr	348(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    800025b8:	00000613          	li	a2,0
    800025bc:	0000b597          	auipc	a1,0xb
    800025c0:	9bc5b583          	ld	a1,-1604(a1) # 8000cf78 <_GLOBAL_OFFSET_TABLE_+0x60>
    800025c4:	fd840513          	addi	a0,s0,-40
    800025c8:	fffff097          	auipc	ra,0xfffff
    800025cc:	e3c080e7          	jalr	-452(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    800025d0:	fd843783          	ld	a5,-40(s0)
    static void setRunning(TCB* newRunning) { running = newRunning; }
    800025d4:	0000b717          	auipc	a4,0xb
    800025d8:	9b473703          	ld	a4,-1612(a4) # 8000cf88 <_GLOBAL_OFFSET_TABLE_+0x70>
    800025dc:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    800025e0:	00100713          	li	a4,1
    800025e4:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    800025e8:	00000613          	li	a2,0
    800025ec:	0000b597          	auipc	a1,0xb
    800025f0:	9345b583          	ld	a1,-1740(a1) # 8000cf20 <_GLOBAL_OFFSET_TABLE_+0x8>
    800025f4:	fd040513          	addi	a0,s0,-48
    800025f8:	fffff097          	auipc	ra,0xfffff
    800025fc:	e0c080e7          	jalr	-500(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80002600:	00000613          	li	a2,0
    80002604:	00000597          	auipc	a1,0x0
    80002608:	f2858593          	addi	a1,a1,-216 # 8000252c <_Z22kernelConsumerFunctionPv>
    8000260c:	fc040513          	addi	a0,s0,-64
    80002610:	fffff097          	auipc	ra,0xfffff
    80002614:	df4080e7          	jalr	-524(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80002618:	00000613          	li	a2,0
    8000261c:	00000597          	auipc	a1,0x0
    80002620:	ef458593          	addi	a1,a1,-268 # 80002510 <_Z4idlePv>
    80002624:	fc840513          	addi	a0,s0,-56
    80002628:	fffff097          	auipc	ra,0xfffff
    8000262c:	ddc080e7          	jalr	-548(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002630:	00200493          	li	s1,2
    80002634:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80002638:	fd043503          	ld	a0,-48(s0)
    8000263c:	fffff097          	auipc	ra,0xfffff
    80002640:	ea4080e7          	jalr	-348(ra) # 800014e0 <_Z11thread_joinP3TCB>
        __asm__ volatile("li a0, 0x43");
    80002644:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80002648:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    8000264c:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80002650:	00000513          	li	a0,0
    80002654:	03813083          	ld	ra,56(sp)
    80002658:	03013403          	ld	s0,48(sp)
    8000265c:	02813483          	ld	s1,40(sp)
    80002660:	04010113          	addi	sp,sp,64
    80002664:	00008067          	ret

0000000080002668 <interruptRoutine>:
#include "../test/printing.hpp"

int main();

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80002668:	f9010113          	addi	sp,sp,-112
    8000266c:	06113423          	sd	ra,104(sp)
    80002670:	06813023          	sd	s0,96(sp)
    80002674:	04913c23          	sd	s1,88(sp)
    80002678:	07010413          	addi	s0,sp,112
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000267c:	14202373          	csrr	t1,scause
    80002680:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002684:	14102373          	csrr	t1,sepc
    80002688:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000268c:	10002373          	csrr	t1,sstatus
    80002690:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4;
    //uint64 a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002694:	00050313          	mv	t1,a0
    80002698:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000269c:	00058313          	mv	t1,a1
    800026a0:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800026a4:	00060313          	mv	t1,a2
    800026a8:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800026ac:	00068313          	mv	t1,a3
    800026b0:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800026b4:	00070313          	mv	t1,a4
    800026b8:	fa643023          	sd	t1,-96(s0)
//    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");

    if (scause == 0x9 || scause == 0x8) {
    800026bc:	fd843703          	ld	a4,-40(s0)
    800026c0:	00900793          	li	a5,9
    800026c4:	00f70863          	beq	a4,a5,800026d4 <interruptRoutine+0x6c>
    800026c8:	fd843703          	ld	a4,-40(s0)
    800026cc:	00800793          	li	a5,8
    800026d0:	4cf71263          	bne	a4,a5,80002b94 <interruptRoutine+0x52c>
        //prekid zbog poziva ecall
        switch (a0) {
    800026d4:	fc043703          	ld	a4,-64(s0)
    800026d8:	08100793          	li	a5,129
    800026dc:	3ee7e863          	bltu	a5,a4,80002acc <interruptRoutine+0x464>
    800026e0:	fc043783          	ld	a5,-64(s0)
    800026e4:	00279713          	slli	a4,a5,0x2
    800026e8:	00008797          	auipc	a5,0x8
    800026ec:	9fc78793          	addi	a5,a5,-1540 # 8000a0e4 <CONSOLE_STATUS+0xd4>
    800026f0:	00f707b3          	add	a5,a4,a5
    800026f4:	0007a783          	lw	a5,0(a5)
    800026f8:	0007871b          	sext.w	a4,a5
    800026fc:	00008797          	auipc	a5,0x8
    80002700:	9e878793          	addi	a5,a5,-1560 # 8000a0e4 <CONSOLE_STATUS+0xd4>
    80002704:	00f707b3          	add	a5,a4,a5
    80002708:	00078067          	jr	a5
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                KMemory::kmalloc((size_t)a1);
    8000270c:	fb843503          	ld	a0,-72(s0)
    80002710:	fffff097          	auipc	ra,0xfffff
    80002714:	7d8080e7          	jalr	2008(ra) # 80001ee8 <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    80002718:	04a43823          	sd	a0,80(s0)
                break;
    8000271c:	4540006f          	j	80002b70 <interruptRoutine+0x508>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                KMemory::kfree((void*)a1);
    80002720:	fb843783          	ld	a5,-72(s0)
    80002724:	00078513          	mv	a0,a5
    80002728:	00000097          	auipc	ra,0x0
    8000272c:	a00080e7          	jalr	-1536(ra) # 80002128 <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    80002730:	04a43823          	sd	a0,80(s0)
                break;
    80002734:	43c0006f          	j	80002b70 <interruptRoutine+0x508>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002738:	fb043783          	ld	a5,-80(s0)
    8000273c:	fa843703          	ld	a4,-88(s0)
    80002740:	fa043683          	ld	a3,-96(s0)
    80002744:	fb843483          	ld	s1,-72(s0)
    80002748:	00068613          	mv	a2,a3
    8000274c:	00070593          	mv	a1,a4
    80002750:	00078513          	mv	a0,a5
    80002754:	00001097          	auipc	ra,0x1
    80002758:	f68080e7          	jalr	-152(ra) # 800036bc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    8000275c:	00050793          	mv	a5,a0
    80002760:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80002764:	fb843783          	ld	a5,-72(s0)
    80002768:	0007b783          	ld	a5,0(a5)
    8000276c:	02078863          	beqz	a5,8000279c <interruptRoutine+0x134>
                    if ((TCB::Body)a2 != (TCB::Body)main) {
    80002770:	fb043703          	ld	a4,-80(s0)
    80002774:	0000b797          	auipc	a5,0xb
    80002778:	8047b783          	ld	a5,-2044(a5) # 8000cf78 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000277c:	00f70c63          	beq	a4,a5,80002794 <interruptRoutine+0x12c>
                        Scheduler::put(*((thread_t*)a1));
    80002780:	fb843783          	ld	a5,-72(s0)
    80002784:	0007b783          	ld	a5,0(a5)
    80002788:	00078513          	mv	a0,a5
    8000278c:	fffff097          	auipc	ra,0xfffff
    80002790:	5a0080e7          	jalr	1440(ra) # 80001d2c <_ZN9Scheduler3putEP3TCB>
                    }
                    __asm__ volatile("li a0, 0");
    80002794:	00000513          	li	a0,0
    80002798:	0080006f          	j	800027a0 <interruptRoutine+0x138>
                } else {
                    __asm__ volatile("li a0, -1");
    8000279c:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800027a0:	04a43823          	sd	a0,80(s0)
                break;
    800027a4:	3cc0006f          	j	80002b70 <interruptRoutine+0x508>
            case 0x12:
                //thread_exit
                TCB::getRunning()->setStatus(TCB::FINISHED);
    800027a8:	00000097          	auipc	ra,0x0
    800027ac:	74c080e7          	jalr	1868(ra) # 80002ef4 <_ZN3TCB10getRunningEv>
    800027b0:	00050793          	mv	a5,a0
    800027b4:	00500593          	li	a1,5
    800027b8:	00078513          	mv	a0,a5
    800027bc:	00000097          	auipc	ra,0x0
    800027c0:	6e4080e7          	jalr	1764(ra) # 80002ea0 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined(TCB::getRunning());
    800027c4:	00000097          	auipc	ra,0x0
    800027c8:	730080e7          	jalr	1840(ra) # 80002ef4 <_ZN3TCB10getRunningEv>
    800027cc:	00050793          	mv	a5,a0
    800027d0:	00078513          	mv	a0,a5
    800027d4:	00001097          	auipc	ra,0x1
    800027d8:	01c080e7          	jalr	28(ra) # 800037f0 <_ZN3TCB13releaseJoinedEPS_>
                __asm__ volatile("li a0, 0");
    800027dc:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 80(s0)");
    800027e0:	04a43823          	sd	a0,80(s0)
                TCB::dispatch();
    800027e4:	00001097          	auipc	ra,0x1
    800027e8:	ddc080e7          	jalr	-548(ra) # 800035c0 <_ZN3TCB8dispatchEv>
                break;
    800027ec:	3840006f          	j	80002b70 <interruptRoutine+0x508>
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
    800027f0:	00001097          	auipc	ra,0x1
    800027f4:	dd0080e7          	jalr	-560(ra) # 800035c0 <_ZN3TCB8dispatchEv>
                break;
    800027f8:	3780006f          	j	80002b70 <interruptRoutine+0x508>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    800027fc:	fb843783          	ld	a5,-72(s0)
    80002800:	00078513          	mv	a0,a5
    80002804:	00001097          	auipc	ra,0x1
    80002808:	f9c080e7          	jalr	-100(ra) # 800037a0 <_ZN3TCB10threadJoinEPS_>
                TCB::dispatch();
    8000280c:	00001097          	auipc	ra,0x1
    80002810:	db4080e7          	jalr	-588(ra) # 800035c0 <_ZN3TCB8dispatchEv>
                break;
    80002814:	35c0006f          	j	80002b70 <interruptRoutine+0x508>
            case 0x15:
                //destruktor klase Thread, brise nit ciji je handle prosledjen
                //a1 = rucka niti koja se brise
                if(TCB::getRunning()==(thread_t)a1){
    80002818:	00000097          	auipc	ra,0x0
    8000281c:	6dc080e7          	jalr	1756(ra) # 80002ef4 <_ZN3TCB10getRunningEv>
    80002820:	00050713          	mv	a4,a0
    80002824:	fb843783          	ld	a5,-72(s0)
    80002828:	40f707b3          	sub	a5,a4,a5
    8000282c:	0017b793          	seqz	a5,a5
    80002830:	0ff7f793          	andi	a5,a5,255
    80002834:	04078263          	beqz	a5,80002878 <interruptRoutine+0x210>
                    TCB::getRunning()->setStatus(TCB::FINISHED);
    80002838:	00000097          	auipc	ra,0x0
    8000283c:	6bc080e7          	jalr	1724(ra) # 80002ef4 <_ZN3TCB10getRunningEv>
    80002840:	00050793          	mv	a5,a0
    80002844:	00500593          	li	a1,5
    80002848:	00078513          	mv	a0,a5
    8000284c:	00000097          	auipc	ra,0x0
    80002850:	654080e7          	jalr	1620(ra) # 80002ea0 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                    TCB::releaseJoined(TCB::getRunning());
    80002854:	00000097          	auipc	ra,0x0
    80002858:	6a0080e7          	jalr	1696(ra) # 80002ef4 <_ZN3TCB10getRunningEv>
    8000285c:	00050793          	mv	a5,a0
    80002860:	00078513          	mv	a0,a5
    80002864:	00001097          	auipc	ra,0x1
    80002868:	f8c080e7          	jalr	-116(ra) # 800037f0 <_ZN3TCB13releaseJoinedEPS_>
                    TCB::dispatch();
    8000286c:	00001097          	auipc	ra,0x1
    80002870:	d54080e7          	jalr	-684(ra) # 800035c0 <_ZN3TCB8dispatchEv>
                }
                else{
                    TCB::quitThread((thread_t)a1);
                    TCB::releaseJoined((thread_t)a1);
                }
                break;
    80002874:	2fc0006f          	j	80002b70 <interruptRoutine+0x508>
                    TCB::quitThread((thread_t)a1);
    80002878:	fb843783          	ld	a5,-72(s0)
    8000287c:	00078513          	mv	a0,a5
    80002880:	00001097          	auipc	ra,0x1
    80002884:	fbc080e7          	jalr	-68(ra) # 8000383c <_ZN3TCB10quitThreadEPS_>
                    TCB::releaseJoined((thread_t)a1);
    80002888:	fb843783          	ld	a5,-72(s0)
    8000288c:	00078513          	mv	a0,a5
    80002890:	00001097          	auipc	ra,0x1
    80002894:	f60080e7          	jalr	-160(ra) # 800037f0 <_ZN3TCB13releaseJoinedEPS_>
                break;
    80002898:	2d80006f          	j	80002b70 <interruptRoutine+0x508>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    8000289c:	fb043783          	ld	a5,-80(s0)
    800028a0:	0007879b          	sext.w	a5,a5
    800028a4:	fb843483          	ld	s1,-72(s0)
    800028a8:	00078513          	mv	a0,a5
    800028ac:	00001097          	auipc	ra,0x1
    800028b0:	184080e7          	jalr	388(ra) # 80003a30 <_ZN4KSem7initSemEj>
    800028b4:	00050793          	mv	a5,a0
    800028b8:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    800028bc:	fb843783          	ld	a5,-72(s0)
    800028c0:	0007b783          	ld	a5,0(a5)
    800028c4:	00078663          	beqz	a5,800028d0 <interruptRoutine+0x268>
                    __asm__ volatile("li a0, 0");
    800028c8:	00000513          	li	a0,0
    800028cc:	0080006f          	j	800028d4 <interruptRoutine+0x26c>
                } else {
                    __asm__ volatile("li a0, -1");
    800028d0:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800028d4:	04a43823          	sd	a0,80(s0)
                break;
    800028d8:	2980006f          	j	80002b70 <interruptRoutine+0x508>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    800028dc:	fb843783          	ld	a5,-72(s0)
    800028e0:	00078513          	mv	a0,a5
    800028e4:	00001097          	auipc	ra,0x1
    800028e8:	298080e7          	jalr	664(ra) # 80003b7c <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    800028ec:	04a43823          	sd	a0,80(s0)
                delete (sem_t)a1;
    800028f0:	fb843483          	ld	s1,-72(s0)
    800028f4:	26048063          	beqz	s1,80002b54 <interruptRoutine+0x4ec>
    800028f8:	00048513          	mv	a0,s1
    800028fc:	00000097          	auipc	ra,0x0
    80002900:	458080e7          	jalr	1112(ra) # 80002d54 <_ZN4KSemD1Ev>
    80002904:	00048513          	mv	a0,s1
    80002908:	00001097          	auipc	ra,0x1
    8000290c:	100080e7          	jalr	256(ra) # 80003a08 <_ZN4KSemdlEPv>
                break;
    80002910:	2440006f          	j	80002b54 <interruptRoutine+0x4ec>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80002914:	fb843783          	ld	a5,-72(s0)
    80002918:	00078513          	mv	a0,a5
    8000291c:	00001097          	auipc	ra,0x1
    80002920:	1a0080e7          	jalr	416(ra) # 80003abc <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002924:	04a43823          	sd	a0,80(s0)
                break;
    80002928:	2480006f          	j	80002b70 <interruptRoutine+0x508>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    8000292c:	fb843783          	ld	a5,-72(s0)
    80002930:	00078513          	mv	a0,a5
    80002934:	00001097          	auipc	ra,0x1
    80002938:	204080e7          	jalr	516(ra) # 80003b38 <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    8000293c:	04a43823          	sd	a0,80(s0)
                break;
    80002940:	2300006f          	j	80002b70 <interruptRoutine+0x508>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    80002944:	fb843783          	ld	a5,-72(s0)
    80002948:	00078663          	beqz	a5,80002954 <interruptRoutine+0x2ec>
                    __asm__ volatile("li a0, 0");
    8000294c:	00000513          	li	a0,0
    80002950:	0080006f          	j	80002958 <interruptRoutine+0x2f0>
                } else {
                    __asm__ volatile("li a0, -1");
    80002954:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002958:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    8000295c:	fb843783          	ld	a5,-72(s0)
    80002960:	1e078e63          	beqz	a5,80002b5c <interruptRoutine+0x4f4>
                    Scheduler::putToSleep(TCB::getRunning(), (time_t)a1);
    80002964:	00000097          	auipc	ra,0x0
    80002968:	590080e7          	jalr	1424(ra) # 80002ef4 <_ZN3TCB10getRunningEv>
    8000296c:	00050793          	mv	a5,a0
    80002970:	fb843583          	ld	a1,-72(s0)
    80002974:	00078513          	mv	a0,a5
    80002978:	fffff097          	auipc	ra,0xfffff
    8000297c:	440080e7          	jalr	1088(ra) # 80001db8 <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::dispatch();
    80002980:	00001097          	auipc	ra,0x1
    80002984:	c40080e7          	jalr	-960(ra) # 800035c0 <_ZN3TCB8dispatchEv>
                }
                break;
    80002988:	1d40006f          	j	80002b5c <interruptRoutine+0x4f4>
            case 0x41:
                //getc
                KConsole::kgetc();
    8000298c:	fffff097          	auipc	ra,0xfffff
    80002990:	f6c080e7          	jalr	-148(ra) # 800018f8 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002994:	04a43823          	sd	a0,80(s0)
                break;
    80002998:	1d80006f          	j	80002b70 <interruptRoutine+0x508>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    8000299c:	fb843783          	ld	a5,-72(s0)
    800029a0:	0ff7f793          	andi	a5,a5,255
    800029a4:	00078513          	mv	a0,a5
    800029a8:	fffff097          	auipc	ra,0xfffff
    800029ac:	ee0080e7          	jalr	-288(ra) # 80001888 <_ZN8KConsole5kputcEc>
                break;
    800029b0:	1c00006f          	j	80002b70 <interruptRoutine+0x508>
            case 0x43:
                //flush izlaznog bafera konzole
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    800029b4:	00000097          	auipc	ra,0x0
    800029b8:	4a4080e7          	jalr	1188(ra) # 80002e58 <_ZN8KConsole13getOutputHeadEv>
    800029bc:	00050793          	mv	a5,a0
    800029c0:	00078493          	mv	s1,a5
    800029c4:	00000097          	auipc	ra,0x0
    800029c8:	4b8080e7          	jalr	1208(ra) # 80002e7c <_ZN8KConsole13getOutputTailEv>
    800029cc:	00050793          	mv	a5,a0
    800029d0:	00048713          	mv	a4,s1
    800029d4:	40f707b3          	sub	a5,a4,a5
    800029d8:	00f037b3          	snez	a5,a5
    800029dc:	0ff7f793          	andi	a5,a5,255
    800029e0:	18078263          	beqz	a5,80002b64 <interruptRoutine+0x4fc>
                    char c = KConsole::getFromOutput();
    800029e4:	fffff097          	auipc	ra,0xfffff
    800029e8:	de0080e7          	jalr	-544(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    800029ec:	00050793          	mv	a5,a0
    800029f0:	f8f40ba3          	sb	a5,-105(s0)
                    while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    800029f4:	00000097          	auipc	ra,0x0
    800029f8:	3c8080e7          	jalr	968(ra) # 80002dbc <_ZN8KConsole10getSRvalueEv>
    800029fc:	00050793          	mv	a5,a0
    80002a00:	0207f793          	andi	a5,a5,32
    80002a04:	0017b793          	seqz	a5,a5
    80002a08:	0ff7f793          	andi	a5,a5,255
    80002a0c:	00078463          	beqz	a5,80002a14 <interruptRoutine+0x3ac>
    80002a10:	fe5ff06f          	j	800029f4 <interruptRoutine+0x38c>
                    KConsole::setDRvalue(c);
    80002a14:	f9744783          	lbu	a5,-105(s0)
    80002a18:	00078513          	mv	a0,a5
    80002a1c:	00000097          	auipc	ra,0x0
    80002a20:	3f0080e7          	jalr	1008(ra) # 80002e0c <_ZN8KConsole10setDRvalueEc>
                    sem_signal(KConsole::getOutputBufferHasSpace());
    80002a24:	00000097          	auipc	ra,0x0
    80002a28:	410080e7          	jalr	1040(ra) # 80002e34 <_ZN8KConsole23getOutputBufferHasSpaceEv>
    80002a2c:	00050793          	mv	a5,a0
    80002a30:	00078513          	mv	a0,a5
    80002a34:	fffff097          	auipc	ra,0xfffff
    80002a38:	b9c080e7          	jalr	-1124(ra) # 800015d0 <_Z10sem_signalP4KSem>
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    80002a3c:	f79ff06f          	j	800029b4 <interruptRoutine+0x34c>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002a40:	fb043783          	ld	a5,-80(s0)
    80002a44:	fa843703          	ld	a4,-88(s0)
    80002a48:	fa043683          	ld	a3,-96(s0)
    80002a4c:	fb843483          	ld	s1,-72(s0)
    80002a50:	00068613          	mv	a2,a3
    80002a54:	00070593          	mv	a1,a4
    80002a58:	00078513          	mv	a0,a5
    80002a5c:	00001097          	auipc	ra,0x1
    80002a60:	c60080e7          	jalr	-928(ra) # 800036bc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002a64:	00050793          	mv	a5,a0
    80002a68:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80002a6c:	fb843783          	ld	a5,-72(s0)
    80002a70:	0007b783          	ld	a5,0(a5)
    80002a74:	00078663          	beqz	a5,80002a80 <interruptRoutine+0x418>
                    __asm__ volatile("li a0, 0");
    80002a78:	00000513          	li	a0,0
    80002a7c:	0080006f          	j	80002a84 <interruptRoutine+0x41c>
                } else {
                    __asm__ volatile("li a0, -1");
    80002a80:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002a84:	04a43823          	sd	a0,80(s0)
                break;
    80002a88:	0e80006f          	j	80002b70 <interruptRoutine+0x508>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                if (((thread_t)a1)->getBody() != (TCB::Body)main) {
    80002a8c:	fb843783          	ld	a5,-72(s0)
    80002a90:	00078513          	mv	a0,a5
    80002a94:	00000097          	auipc	ra,0x0
    80002a98:	444080e7          	jalr	1092(ra) # 80002ed8 <_ZN3TCB7getBodyEv>
    80002a9c:	00050713          	mv	a4,a0
    80002aa0:	0000a797          	auipc	a5,0xa
    80002aa4:	4d87b783          	ld	a5,1240(a5) # 8000cf78 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002aa8:	40f707b3          	sub	a5,a4,a5
    80002aac:	00f037b3          	snez	a5,a5
    80002ab0:	0ff7f793          	andi	a5,a5,255
    80002ab4:	0a078c63          	beqz	a5,80002b6c <interruptRoutine+0x504>
                    Scheduler::put((thread_t)a1);
    80002ab8:	fb843783          	ld	a5,-72(s0)
    80002abc:	00078513          	mv	a0,a5
    80002ac0:	fffff097          	auipc	ra,0xfffff
    80002ac4:	26c080e7          	jalr	620(ra) # 80001d2c <_ZN9Scheduler3putEP3TCB>
                }
                break;
    80002ac8:	0a40006f          	j	80002b6c <interruptRoutine+0x504>
            default:
                printString("\nNepostojeci op code: ");
    80002acc:	00007517          	auipc	a0,0x7
    80002ad0:	5bc50513          	addi	a0,a0,1468 # 8000a088 <CONSOLE_STATUS+0x78>
    80002ad4:	00003097          	auipc	ra,0x3
    80002ad8:	7ac080e7          	jalr	1964(ra) # 80006280 <_Z11printStringPKc>
                printInt(a0);
    80002adc:	fc043783          	ld	a5,-64(s0)
    80002ae0:	0007879b          	sext.w	a5,a5
    80002ae4:	00000613          	li	a2,0
    80002ae8:	00a00593          	li	a1,10
    80002aec:	00078513          	mv	a0,a5
    80002af0:	00004097          	auipc	ra,0x4
    80002af4:	940080e7          	jalr	-1728(ra) # 80006430 <_Z8printIntiii>
                printString("\nscause: ");
    80002af8:	00007517          	auipc	a0,0x7
    80002afc:	5a850513          	addi	a0,a0,1448 # 8000a0a0 <CONSOLE_STATUS+0x90>
    80002b00:	00003097          	auipc	ra,0x3
    80002b04:	780080e7          	jalr	1920(ra) # 80006280 <_Z11printStringPKc>
                printInt(scause);
    80002b08:	fd843783          	ld	a5,-40(s0)
    80002b0c:	0007879b          	sext.w	a5,a5
    80002b10:	00000613          	li	a2,0
    80002b14:	00a00593          	li	a1,10
    80002b18:	00078513          	mv	a0,a5
    80002b1c:	00004097          	auipc	ra,0x4
    80002b20:	914080e7          	jalr	-1772(ra) # 80006430 <_Z8printIntiii>
                printString("\nsepc: ");
    80002b24:	00007517          	auipc	a0,0x7
    80002b28:	58c50513          	addi	a0,a0,1420 # 8000a0b0 <CONSOLE_STATUS+0xa0>
    80002b2c:	00003097          	auipc	ra,0x3
    80002b30:	754080e7          	jalr	1876(ra) # 80006280 <_Z11printStringPKc>
                printInt(sepc);
    80002b34:	fd043783          	ld	a5,-48(s0)
    80002b38:	0007879b          	sext.w	a5,a5
    80002b3c:	00000613          	li	a2,0
    80002b40:	00a00593          	li	a1,10
    80002b44:	00078513          	mv	a0,a5
    80002b48:	00004097          	auipc	ra,0x4
    80002b4c:	8e8080e7          	jalr	-1816(ra) # 80006430 <_Z8printIntiii>
                break;
    80002b50:	0200006f          	j	80002b70 <interruptRoutine+0x508>
                break;
    80002b54:	00000013          	nop
    80002b58:	0180006f          	j	80002b70 <interruptRoutine+0x508>
                break;
    80002b5c:	00000013          	nop
    80002b60:	0100006f          	j	80002b70 <interruptRoutine+0x508>
                break;
    80002b64:	00000013          	nop
    80002b68:	0080006f          	j	80002b70 <interruptRoutine+0x508>
                break;
    80002b6c:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    80002b70:	fd043783          	ld	a5,-48(s0)
    80002b74:	00478793          	addi	a5,a5,4
    80002b78:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002b7c:	fd043783          	ld	a5,-48(s0)
    80002b80:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002b84:	fc843783          	ld	a5,-56(s0)
    80002b88:	10079073          	csrw	sstatus,a5
    80002b8c:	00000013          	nop
        printString("\nsepc: ");
        printInt(sepc);
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    }
    80002b90:	1ac0006f          	j	80002d3c <interruptRoutine+0x6d4>
    } else if (scause == 0x8000000000000009) {
    80002b94:	fd843703          	ld	a4,-40(s0)
    80002b98:	fff00793          	li	a5,-1
    80002b9c:	03f79793          	slli	a5,a5,0x3f
    80002ba0:	00978793          	addi	a5,a5,9
    80002ba4:	08f71463          	bne	a4,a5,80002c2c <interruptRoutine+0x5c4>
        uint64 irq = plic_claim();
    80002ba8:	00005097          	auipc	ra,0x5
    80002bac:	71c080e7          	jalr	1820(ra) # 800082c4 <plic_claim>
    80002bb0:	00050793          	mv	a5,a0
    80002bb4:	f8f43c23          	sd	a5,-104(s0)
        if (irq == CONSOLE_IRQ) {
    80002bb8:	f9843703          	ld	a4,-104(s0)
    80002bbc:	00a00793          	li	a5,10
    80002bc0:	02f71c63          	bne	a4,a5,80002bf8 <interruptRoutine+0x590>
            if (KConsole::getSRvalue() & CONSOLE_RX_STATUS_BIT) {
    80002bc4:	00000097          	auipc	ra,0x0
    80002bc8:	1f8080e7          	jalr	504(ra) # 80002dbc <_ZN8KConsole10getSRvalueEv>
    80002bcc:	00050793          	mv	a5,a0
    80002bd0:	0017f793          	andi	a5,a5,1
    80002bd4:	00f037b3          	snez	a5,a5
    80002bd8:	0ff7f793          	andi	a5,a5,255
    80002bdc:	00078e63          	beqz	a5,80002bf8 <interruptRoutine+0x590>
                KConsole::placeInInput(KConsole::getDRvalue());
    80002be0:	00000097          	auipc	ra,0x0
    80002be4:	204080e7          	jalr	516(ra) # 80002de4 <_ZN8KConsole10getDRvalueEv>
    80002be8:	00050793          	mv	a5,a0
    80002bec:	00078513          	mv	a0,a5
    80002bf0:	fffff097          	auipc	ra,0xfffff
    80002bf4:	c2c080e7          	jalr	-980(ra) # 8000181c <_ZN8KConsole12placeInInputEc>
        plic_complete(irq);
    80002bf8:	f9843783          	ld	a5,-104(s0)
    80002bfc:	0007879b          	sext.w	a5,a5
    80002c00:	00078513          	mv	a0,a5
    80002c04:	00005097          	auipc	ra,0x5
    80002c08:	6f8080e7          	jalr	1784(ra) # 800082fc <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002c0c:	fd043783          	ld	a5,-48(s0)
    80002c10:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002c14:	fc843783          	ld	a5,-56(s0)
    80002c18:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    80002c1c:	20000513          	li	a0,512
    80002c20:	00000097          	auipc	ra,0x0
    80002c24:	180080e7          	jalr	384(ra) # 80002da0 <_ZN5Riscv6mc_sipEm>
    80002c28:	1140006f          	j	80002d3c <interruptRoutine+0x6d4>
    } else if (scause == 0x8000000000000001) {
    80002c2c:	fd843703          	ld	a4,-40(s0)
    80002c30:	fff00793          	li	a5,-1
    80002c34:	03f79793          	slli	a5,a5,0x3f
    80002c38:	00178793          	addi	a5,a5,1
    80002c3c:	08f71463          	bne	a4,a5,80002cc4 <interruptRoutine+0x65c>
        Scheduler::wake();
    80002c40:	fffff097          	auipc	ra,0xfffff
    80002c44:	228080e7          	jalr	552(ra) # 80001e68 <_ZN9Scheduler4wakeEv>
        TCB::getRunningTimeSlice()++;
    80002c48:	00000097          	auipc	ra,0x0
    80002c4c:	2d0080e7          	jalr	720(ra) # 80002f18 <_ZN3TCB19getRunningTimeSliceEv>
    80002c50:	00050793          	mv	a5,a0
    80002c54:	0007b703          	ld	a4,0(a5)
    80002c58:	00170713          	addi	a4,a4,1
    80002c5c:	00e7b023          	sd	a4,0(a5)
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
    80002c60:	00000097          	auipc	ra,0x0
    80002c64:	2b8080e7          	jalr	696(ra) # 80002f18 <_ZN3TCB19getRunningTimeSliceEv>
    80002c68:	00050793          	mv	a5,a0
    80002c6c:	0007b483          	ld	s1,0(a5)
    80002c70:	00000097          	auipc	ra,0x0
    80002c74:	284080e7          	jalr	644(ra) # 80002ef4 <_ZN3TCB10getRunningEv>
    80002c78:	00050793          	mv	a5,a0
    80002c7c:	00078513          	mv	a0,a5
    80002c80:	00000097          	auipc	ra,0x0
    80002c84:	23c080e7          	jalr	572(ra) # 80002ebc <_ZN3TCB12getTimeSliceEv>
    80002c88:	00050793          	mv	a5,a0
    80002c8c:	00f4b7b3          	sltu	a5,s1,a5
    80002c90:	0017c793          	xori	a5,a5,1
    80002c94:	0ff7f793          	andi	a5,a5,255
    80002c98:	00078663          	beqz	a5,80002ca4 <interruptRoutine+0x63c>
            TCB::dispatch();
    80002c9c:	00001097          	auipc	ra,0x1
    80002ca0:	924080e7          	jalr	-1756(ra) # 800035c0 <_ZN3TCB8dispatchEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002ca4:	fd043783          	ld	a5,-48(s0)
    80002ca8:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002cac:	fc843783          	ld	a5,-56(s0)
    80002cb0:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    80002cb4:	00200513          	li	a0,2
    80002cb8:	00000097          	auipc	ra,0x0
    80002cbc:	0e8080e7          	jalr	232(ra) # 80002da0 <_ZN5Riscv6mc_sipEm>
    80002cc0:	07c0006f          	j	80002d3c <interruptRoutine+0x6d4>
        printString("\nGreska u prekidnoj rutini\n");
    80002cc4:	00007517          	auipc	a0,0x7
    80002cc8:	3f450513          	addi	a0,a0,1012 # 8000a0b8 <CONSOLE_STATUS+0xa8>
    80002ccc:	00003097          	auipc	ra,0x3
    80002cd0:	5b4080e7          	jalr	1460(ra) # 80006280 <_Z11printStringPKc>
        printString("scause: ");
    80002cd4:	00007517          	auipc	a0,0x7
    80002cd8:	40450513          	addi	a0,a0,1028 # 8000a0d8 <CONSOLE_STATUS+0xc8>
    80002cdc:	00003097          	auipc	ra,0x3
    80002ce0:	5a4080e7          	jalr	1444(ra) # 80006280 <_Z11printStringPKc>
        printInt(scause);
    80002ce4:	fd843783          	ld	a5,-40(s0)
    80002ce8:	0007879b          	sext.w	a5,a5
    80002cec:	00000613          	li	a2,0
    80002cf0:	00a00593          	li	a1,10
    80002cf4:	00078513          	mv	a0,a5
    80002cf8:	00003097          	auipc	ra,0x3
    80002cfc:	738080e7          	jalr	1848(ra) # 80006430 <_Z8printIntiii>
        printString("\nsepc: ");
    80002d00:	00007517          	auipc	a0,0x7
    80002d04:	3b050513          	addi	a0,a0,944 # 8000a0b0 <CONSOLE_STATUS+0xa0>
    80002d08:	00003097          	auipc	ra,0x3
    80002d0c:	578080e7          	jalr	1400(ra) # 80006280 <_Z11printStringPKc>
        printInt(sepc);
    80002d10:	fd043783          	ld	a5,-48(s0)
    80002d14:	0007879b          	sext.w	a5,a5
    80002d18:	00000613          	li	a2,0
    80002d1c:	00a00593          	li	a1,10
    80002d20:	00078513          	mv	a0,a5
    80002d24:	00003097          	auipc	ra,0x3
    80002d28:	70c080e7          	jalr	1804(ra) # 80006430 <_Z8printIntiii>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002d2c:	fd043783          	ld	a5,-48(s0)
    80002d30:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002d34:	fc843783          	ld	a5,-56(s0)
    80002d38:	10079073          	csrw	sstatus,a5
    80002d3c:	00000013          	nop
    80002d40:	06813083          	ld	ra,104(sp)
    80002d44:	06013403          	ld	s0,96(sp)
    80002d48:	05813483          	ld	s1,88(sp)
    80002d4c:	07010113          	addi	sp,sp,112
    80002d50:	00008067          	ret

0000000080002d54 <_ZN4KSemD1Ev>:
#define PROJEKAT2023_KSEM_HPP

#include "../h/ThreadQueue.hpp"

//klasa napravljena po uzoru na semafor u skolskom jezgru
class KSem {
    80002d54:	fe010113          	addi	sp,sp,-32
    80002d58:	00113c23          	sd	ra,24(sp)
    80002d5c:	00813823          	sd	s0,16(sp)
    80002d60:	00913423          	sd	s1,8(sp)
    80002d64:	02010413          	addi	s0,sp,32
    80002d68:	00050493          	mv	s1,a0
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    80002d6c:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002d70:	00050e63          	beqz	a0,80002d8c <_ZN4KSemD1Ev+0x38>
            front = front->next;
    80002d74:	00853783          	ld	a5,8(a0)
    80002d78:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002d7c:	fe0508e3          	beqz	a0,80002d6c <_ZN4KSemD1Ev+0x18>
            mem_free(ptr);
    80002d80:	ffffe097          	auipc	ra,0xffffe
    80002d84:	654080e7          	jalr	1620(ra) # 800013d4 <_Z8mem_freePv>
        }
    80002d88:	fe5ff06f          	j	80002d6c <_ZN4KSemD1Ev+0x18>
    80002d8c:	01813083          	ld	ra,24(sp)
    80002d90:	01013403          	ld	s0,16(sp)
    80002d94:	00813483          	ld	s1,8(sp)
    80002d98:	02010113          	addi	sp,sp,32
    80002d9c:	00008067          	ret

0000000080002da0 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002da0:	ff010113          	addi	sp,sp,-16
    80002da4:	00813423          	sd	s0,8(sp)
    80002da8:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80002dac:	14453073          	csrc	sip,a0
}
    80002db0:	00813403          	ld	s0,8(sp)
    80002db4:	01010113          	addi	sp,sp,16
    80002db8:	00008067          	ret

0000000080002dbc <_ZN8KConsole10getSRvalueEv>:
    static uint8 getSRvalue() { return *sr; }
    80002dbc:	ff010113          	addi	sp,sp,-16
    80002dc0:	00813423          	sd	s0,8(sp)
    80002dc4:	01010413          	addi	s0,sp,16
    80002dc8:	0000a797          	auipc	a5,0xa
    80002dcc:	1f07b783          	ld	a5,496(a5) # 8000cfb8 <_GLOBAL_OFFSET_TABLE_+0xa0>
    80002dd0:	0007b783          	ld	a5,0(a5)
    80002dd4:	0007c503          	lbu	a0,0(a5)
    80002dd8:	00813403          	ld	s0,8(sp)
    80002ddc:	01010113          	addi	sp,sp,16
    80002de0:	00008067          	ret

0000000080002de4 <_ZN8KConsole10getDRvalueEv>:
    static uint8 getDRvalue() { return *dr; }
    80002de4:	ff010113          	addi	sp,sp,-16
    80002de8:	00813423          	sd	s0,8(sp)
    80002dec:	01010413          	addi	s0,sp,16
    80002df0:	0000a797          	auipc	a5,0xa
    80002df4:	1807b783          	ld	a5,384(a5) # 8000cf70 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002df8:	0007b783          	ld	a5,0(a5)
    80002dfc:	0007c503          	lbu	a0,0(a5)
    80002e00:	00813403          	ld	s0,8(sp)
    80002e04:	01010113          	addi	sp,sp,16
    80002e08:	00008067          	ret

0000000080002e0c <_ZN8KConsole10setDRvalueEc>:
    static void setDRvalue(char c) { *dr = c; }
    80002e0c:	ff010113          	addi	sp,sp,-16
    80002e10:	00813423          	sd	s0,8(sp)
    80002e14:	01010413          	addi	s0,sp,16
    80002e18:	0000a797          	auipc	a5,0xa
    80002e1c:	1587b783          	ld	a5,344(a5) # 8000cf70 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002e20:	0007b783          	ld	a5,0(a5)
    80002e24:	00a78023          	sb	a0,0(a5)
    80002e28:	00813403          	ld	s0,8(sp)
    80002e2c:	01010113          	addi	sp,sp,16
    80002e30:	00008067          	ret

0000000080002e34 <_ZN8KConsole23getOutputBufferHasSpaceEv>:

    static sem_t getOutputBufferHasSpace() { return outputBufferHasSpace; }
    80002e34:	ff010113          	addi	sp,sp,-16
    80002e38:	00813423          	sd	s0,8(sp)
    80002e3c:	01010413          	addi	s0,sp,16
    80002e40:	0000a797          	auipc	a5,0xa
    80002e44:	1407b783          	ld	a5,320(a5) # 8000cf80 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002e48:	0007b503          	ld	a0,0(a5)
    80002e4c:	00813403          	ld	s0,8(sp)
    80002e50:	01010113          	addi	sp,sp,16
    80002e54:	00008067          	ret

0000000080002e58 <_ZN8KConsole13getOutputHeadEv>:

    static int getOutputHead() { return outputHead; }
    80002e58:	ff010113          	addi	sp,sp,-16
    80002e5c:	00813423          	sd	s0,8(sp)
    80002e60:	01010413          	addi	s0,sp,16
    80002e64:	0000a797          	auipc	a5,0xa
    80002e68:	0fc7b783          	ld	a5,252(a5) # 8000cf60 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002e6c:	0007a503          	lw	a0,0(a5)
    80002e70:	00813403          	ld	s0,8(sp)
    80002e74:	01010113          	addi	sp,sp,16
    80002e78:	00008067          	ret

0000000080002e7c <_ZN8KConsole13getOutputTailEv>:

    static int getOutputTail() { return outputTail; }
    80002e7c:	ff010113          	addi	sp,sp,-16
    80002e80:	00813423          	sd	s0,8(sp)
    80002e84:	01010413          	addi	s0,sp,16
    80002e88:	0000a797          	auipc	a5,0xa
    80002e8c:	1287b783          	ld	a5,296(a5) # 8000cfb0 <_GLOBAL_OFFSET_TABLE_+0x98>
    80002e90:	0007a503          	lw	a0,0(a5)
    80002e94:	00813403          	ld	s0,8(sp)
    80002e98:	01010113          	addi	sp,sp,16
    80002e9c:	00008067          	ret

0000000080002ea0 <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    80002ea0:	ff010113          	addi	sp,sp,-16
    80002ea4:	00813423          	sd	s0,8(sp)
    80002ea8:	01010413          	addi	s0,sp,16
    80002eac:	04b52c23          	sw	a1,88(a0)
    80002eb0:	00813403          	ld	s0,8(sp)
    80002eb4:	01010113          	addi	sp,sp,16
    80002eb8:	00008067          	ret

0000000080002ebc <_ZN3TCB12getTimeSliceEv>:
    uint64 getTimeSlice() { return timeSlice; }
    80002ebc:	ff010113          	addi	sp,sp,-16
    80002ec0:	00813423          	sd	s0,8(sp)
    80002ec4:	01010413          	addi	s0,sp,16
    80002ec8:	02853503          	ld	a0,40(a0)
    80002ecc:	00813403          	ld	s0,8(sp)
    80002ed0:	01010113          	addi	sp,sp,16
    80002ed4:	00008067          	ret

0000000080002ed8 <_ZN3TCB7getBodyEv>:
    Body getBody() { return threadFunction; }
    80002ed8:	ff010113          	addi	sp,sp,-16
    80002edc:	00813423          	sd	s0,8(sp)
    80002ee0:	01010413          	addi	s0,sp,16
    80002ee4:	01053503          	ld	a0,16(a0)
    80002ee8:	00813403          	ld	s0,8(sp)
    80002eec:	01010113          	addi	sp,sp,16
    80002ef0:	00008067          	ret

0000000080002ef4 <_ZN3TCB10getRunningEv>:
    static TCB* getRunning() { return running; }
    80002ef4:	ff010113          	addi	sp,sp,-16
    80002ef8:	00813423          	sd	s0,8(sp)
    80002efc:	01010413          	addi	s0,sp,16
    80002f00:	0000a797          	auipc	a5,0xa
    80002f04:	0887b783          	ld	a5,136(a5) # 8000cf88 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002f08:	0007b503          	ld	a0,0(a5)
    80002f0c:	00813403          	ld	s0,8(sp)
    80002f10:	01010113          	addi	sp,sp,16
    80002f14:	00008067          	ret

0000000080002f18 <_ZN3TCB19getRunningTimeSliceEv>:

    static uint64 &getRunningTimeSlice() { return runningTimeSlice; }
    80002f18:	ff010113          	addi	sp,sp,-16
    80002f1c:	00813423          	sd	s0,8(sp)
    80002f20:	01010413          	addi	s0,sp,16
    80002f24:	0000a517          	auipc	a0,0xa
    80002f28:	00c53503          	ld	a0,12(a0) # 8000cf30 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002f2c:	00813403          	ld	s0,8(sp)
    80002f30:	01010113          	addi	sp,sp,16
    80002f34:	00008067          	ret

0000000080002f38 <_ZN6ThreadD1Ev>:
    //a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

    __asm__ volatile("ecall");
}

Thread::~Thread() {
    80002f38:	ff010113          	addi	sp,sp,-16
    80002f3c:	00813423          	sd	s0,8(sp)
    80002f40:	01010413          	addi	s0,sp,16
    80002f44:	0000a797          	auipc	a5,0xa
    80002f48:	dc478793          	addi	a5,a5,-572 # 8000cd08 <_ZTV6Thread+0x10>
    80002f4c:	00f53023          	sd	a5,0(a0)
    //ne treba da se gasi running nit, vec nit na koju pokazuje rucka od this
//    thread_join(this->myHandle);
//    delete myHandle;

    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002f50:	00853303          	ld	t1,8(a0)
    80002f54:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x15");
    80002f58:	01500513          	li	a0,21

    __asm__ volatile("ecall");
    80002f5c:	00000073          	ecall
}
    80002f60:	00813403          	ld	s0,8(sp)
    80002f64:	01010113          	addi	sp,sp,16
    80002f68:	00008067          	ret

0000000080002f6c <_ZN6Thread7wrapperEPv>:

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
    80002f6c:	02050863          	beqz	a0,80002f9c <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80002f70:	ff010113          	addi	sp,sp,-16
    80002f74:	00113423          	sd	ra,8(sp)
    80002f78:	00813023          	sd	s0,0(sp)
    80002f7c:	01010413          	addi	s0,sp,16
        ((Thread*)thread)->run();
    80002f80:	00053783          	ld	a5,0(a0)
    80002f84:	0107b783          	ld	a5,16(a5)
    80002f88:	000780e7          	jalr	a5
    }
}
    80002f8c:	00813083          	ld	ra,8(sp)
    80002f90:	00013403          	ld	s0,0(sp)
    80002f94:	01010113          	addi	sp,sp,16
    80002f98:	00008067          	ret
    80002f9c:	00008067          	ret

0000000080002fa0 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002fa0:	fe010113          	addi	sp,sp,-32
    80002fa4:	00113c23          	sd	ra,24(sp)
    80002fa8:	00813823          	sd	s0,16(sp)
    80002fac:	00913423          	sd	s1,8(sp)
    80002fb0:	02010413          	addi	s0,sp,32
    80002fb4:	00050493          	mv	s1,a0
    80002fb8:	0000a797          	auipc	a5,0xa
    80002fbc:	d7878793          	addi	a5,a5,-648 # 8000cd30 <_ZTV9Semaphore+0x10>
    80002fc0:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80002fc4:	00853503          	ld	a0,8(a0)
    80002fc8:	ffffe097          	auipc	ra,0xffffe
    80002fcc:	5a8080e7          	jalr	1448(ra) # 80001570 <_Z9sem_closeP4KSem>
    delete myHandle;
    80002fd0:	0084b483          	ld	s1,8(s1)
    80002fd4:	02048863          	beqz	s1,80003004 <_ZN9SemaphoreD1Ev+0x64>
        return front == nullptr;
    80002fd8:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002fdc:	00050e63          	beqz	a0,80002ff8 <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    80002fe0:	00853783          	ld	a5,8(a0)
    80002fe4:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002fe8:	fe0508e3          	beqz	a0,80002fd8 <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    80002fec:	ffffe097          	auipc	ra,0xffffe
    80002ff0:	3e8080e7          	jalr	1000(ra) # 800013d4 <_Z8mem_freePv>
        }
    80002ff4:	fe5ff06f          	j	80002fd8 <_ZN9SemaphoreD1Ev+0x38>
    80002ff8:	00048513          	mv	a0,s1
    80002ffc:	00001097          	auipc	ra,0x1
    80003000:	a0c080e7          	jalr	-1524(ra) # 80003a08 <_ZN4KSemdlEPv>
}
    80003004:	01813083          	ld	ra,24(sp)
    80003008:	01013403          	ld	s0,16(sp)
    8000300c:	00813483          	ld	s1,8(sp)
    80003010:	02010113          	addi	sp,sp,32
    80003014:	00008067          	ret

0000000080003018 <_Znwm>:
void* operator new(size_t size) {
    80003018:	ff010113          	addi	sp,sp,-16
    8000301c:	00113423          	sd	ra,8(sp)
    80003020:	00813023          	sd	s0,0(sp)
    80003024:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003028:	ffffe097          	auipc	ra,0xffffe
    8000302c:	36c080e7          	jalr	876(ra) # 80001394 <_Z9mem_allocm>
}
    80003030:	00813083          	ld	ra,8(sp)
    80003034:	00013403          	ld	s0,0(sp)
    80003038:	01010113          	addi	sp,sp,16
    8000303c:	00008067          	ret

0000000080003040 <_Znam>:
void* operator new[](size_t size) {
    80003040:	ff010113          	addi	sp,sp,-16
    80003044:	00113423          	sd	ra,8(sp)
    80003048:	00813023          	sd	s0,0(sp)
    8000304c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003050:	ffffe097          	auipc	ra,0xffffe
    80003054:	344080e7          	jalr	836(ra) # 80001394 <_Z9mem_allocm>
}
    80003058:	00813083          	ld	ra,8(sp)
    8000305c:	00013403          	ld	s0,0(sp)
    80003060:	01010113          	addi	sp,sp,16
    80003064:	00008067          	ret

0000000080003068 <_ZdlPv>:
noexcept {
    80003068:	ff010113          	addi	sp,sp,-16
    8000306c:	00113423          	sd	ra,8(sp)
    80003070:	00813023          	sd	s0,0(sp)
    80003074:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80003078:	ffffe097          	auipc	ra,0xffffe
    8000307c:	35c080e7          	jalr	860(ra) # 800013d4 <_Z8mem_freePv>
}
    80003080:	00813083          	ld	ra,8(sp)
    80003084:	00013403          	ld	s0,0(sp)
    80003088:	01010113          	addi	sp,sp,16
    8000308c:	00008067          	ret

0000000080003090 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80003090:	fe010113          	addi	sp,sp,-32
    80003094:	00113c23          	sd	ra,24(sp)
    80003098:	00813823          	sd	s0,16(sp)
    8000309c:	00913423          	sd	s1,8(sp)
    800030a0:	02010413          	addi	s0,sp,32
    800030a4:	00050493          	mv	s1,a0
}
    800030a8:	00000097          	auipc	ra,0x0
    800030ac:	e90080e7          	jalr	-368(ra) # 80002f38 <_ZN6ThreadD1Ev>
    800030b0:	00048513          	mv	a0,s1
    800030b4:	00000097          	auipc	ra,0x0
    800030b8:	fb4080e7          	jalr	-76(ra) # 80003068 <_ZdlPv>
    800030bc:	01813083          	ld	ra,24(sp)
    800030c0:	01013403          	ld	s0,16(sp)
    800030c4:	00813483          	ld	s1,8(sp)
    800030c8:	02010113          	addi	sp,sp,32
    800030cc:	00008067          	ret

00000000800030d0 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800030d0:	fe010113          	addi	sp,sp,-32
    800030d4:	00113c23          	sd	ra,24(sp)
    800030d8:	00813823          	sd	s0,16(sp)
    800030dc:	00913423          	sd	s1,8(sp)
    800030e0:	02010413          	addi	s0,sp,32
    800030e4:	00050493          	mv	s1,a0
}
    800030e8:	00000097          	auipc	ra,0x0
    800030ec:	eb8080e7          	jalr	-328(ra) # 80002fa0 <_ZN9SemaphoreD1Ev>
    800030f0:	00048513          	mv	a0,s1
    800030f4:	00000097          	auipc	ra,0x0
    800030f8:	f74080e7          	jalr	-140(ra) # 80003068 <_ZdlPv>
    800030fc:	01813083          	ld	ra,24(sp)
    80003100:	01013403          	ld	s0,16(sp)
    80003104:	00813483          	ld	s1,8(sp)
    80003108:	02010113          	addi	sp,sp,32
    8000310c:	00008067          	ret

0000000080003110 <_ZdaPv>:
noexcept {
    80003110:	ff010113          	addi	sp,sp,-16
    80003114:	00113423          	sd	ra,8(sp)
    80003118:	00813023          	sd	s0,0(sp)
    8000311c:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80003120:	ffffe097          	auipc	ra,0xffffe
    80003124:	2b4080e7          	jalr	692(ra) # 800013d4 <_Z8mem_freePv>
}
    80003128:	00813083          	ld	ra,8(sp)
    8000312c:	00013403          	ld	s0,0(sp)
    80003130:	01010113          	addi	sp,sp,16
    80003134:	00008067          	ret

0000000080003138 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80003138:	fd010113          	addi	sp,sp,-48
    8000313c:	02113423          	sd	ra,40(sp)
    80003140:	02813023          	sd	s0,32(sp)
    80003144:	00913c23          	sd	s1,24(sp)
    80003148:	01213823          	sd	s2,16(sp)
    8000314c:	01313423          	sd	s3,8(sp)
    80003150:	03010413          	addi	s0,sp,48
    80003154:	00050493          	mv	s1,a0
    80003158:	00058913          	mv	s2,a1
    8000315c:	00060993          	mv	s3,a2
    80003160:	0000a797          	auipc	a5,0xa
    80003164:	ba878793          	addi	a5,a5,-1112 # 8000cd08 <_ZTV6Thread+0x10>
    80003168:	00f53023          	sd	a5,0(a0)
    this->body = body;
    8000316c:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    80003170:	00c53c23          	sd	a2,24(a0)
    if (body != (TCB::Body)main) {
    80003174:	0000a797          	auipc	a5,0xa
    80003178:	e047b783          	ld	a5,-508(a5) # 8000cf78 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000317c:	04f58663          	beq	a1,a5,800031c8 <_ZN6ThreadC1EPFvPvES0_+0x90>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80003180:	00001537          	lui	a0,0x1
    80003184:	ffffe097          	auipc	ra,0xffffe
    80003188:	210080e7          	jalr	528(ra) # 80001394 <_Z9mem_allocm>
    8000318c:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003190:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003194:	00098693          	mv	a3,s3
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003198:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000319c:	00848493          	addi	s1,s1,8
    800031a0:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    800031a4:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    800031a8:	00000073          	ecall
}
    800031ac:	02813083          	ld	ra,40(sp)
    800031b0:	02013403          	ld	s0,32(sp)
    800031b4:	01813483          	ld	s1,24(sp)
    800031b8:	01013903          	ld	s2,16(sp)
    800031bc:	00813983          	ld	s3,8(sp)
    800031c0:	03010113          	addi	sp,sp,48
    800031c4:	00008067          	ret
    uint64* stack = nullptr;
    800031c8:	00000313          	li	t1,0
    800031cc:	fc5ff06f          	j	80003190 <_ZN6ThreadC1EPFvPvES0_+0x58>

00000000800031d0 <_ZN6Thread5startEv>:
int Thread::start() {
    800031d0:	ff010113          	addi	sp,sp,-16
    800031d4:	00813423          	sd	s0,8(sp)
    800031d8:	01010413          	addi	s0,sp,16
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    800031dc:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    800031e0:	02030463          	beqz	t1,80003208 <_ZN6Thread5startEv+0x38>
    ThreadStatus getStatus() { return this->status; }
    800031e4:	05832783          	lw	a5,88(t1)
    800031e8:	02079463          	bnez	a5,80003210 <_ZN6Thread5startEv+0x40>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800031ec:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    800031f0:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    800031f4:	00000073          	ecall
    return 0;
    800031f8:	00000513          	li	a0,0
}
    800031fc:	00813403          	ld	s0,8(sp)
    80003200:	01010113          	addi	sp,sp,16
    80003204:	00008067          	ret
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    80003208:	fff00513          	li	a0,-1
    8000320c:	ff1ff06f          	j	800031fc <_ZN6Thread5startEv+0x2c>
    80003210:	fff00513          	li	a0,-1
    80003214:	fe9ff06f          	j	800031fc <_ZN6Thread5startEv+0x2c>

0000000080003218 <_ZN6Thread4joinEv>:
void Thread::join() {
    80003218:	ff010113          	addi	sp,sp,-16
    8000321c:	00113423          	sd	ra,8(sp)
    80003220:	00813023          	sd	s0,0(sp)
    80003224:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80003228:	00853503          	ld	a0,8(a0)
    8000322c:	ffffe097          	auipc	ra,0xffffe
    80003230:	2b4080e7          	jalr	692(ra) # 800014e0 <_Z11thread_joinP3TCB>
}
    80003234:	00813083          	ld	ra,8(sp)
    80003238:	00013403          	ld	s0,0(sp)
    8000323c:	01010113          	addi	sp,sp,16
    80003240:	00008067          	ret

0000000080003244 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80003244:	ff010113          	addi	sp,sp,-16
    80003248:	00113423          	sd	ra,8(sp)
    8000324c:	00813023          	sd	s0,0(sp)
    80003250:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80003254:	ffffe097          	auipc	ra,0xffffe
    80003258:	26c080e7          	jalr	620(ra) # 800014c0 <_Z15thread_dispatchv>
}
    8000325c:	00813083          	ld	ra,8(sp)
    80003260:	00013403          	ld	s0,0(sp)
    80003264:	01010113          	addi	sp,sp,16
    80003268:	00008067          	ret

000000008000326c <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    8000326c:	ff010113          	addi	sp,sp,-16
    80003270:	00113423          	sd	ra,8(sp)
    80003274:	00813023          	sd	s0,0(sp)
    80003278:	01010413          	addi	s0,sp,16
    time_sleep(t);
    8000327c:	ffffe097          	auipc	ra,0xffffe
    80003280:	28c080e7          	jalr	652(ra) # 80001508 <_Z10time_sleepm>
}
    80003284:	00000513          	li	a0,0
    80003288:	00813083          	ld	ra,8(sp)
    8000328c:	00013403          	ld	s0,0(sp)
    80003290:	01010113          	addi	sp,sp,16
    80003294:	00008067          	ret

0000000080003298 <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    80003298:	fe010113          	addi	sp,sp,-32
    8000329c:	00113c23          	sd	ra,24(sp)
    800032a0:	00813823          	sd	s0,16(sp)
    800032a4:	00913423          	sd	s1,8(sp)
    800032a8:	02010413          	addi	s0,sp,32
    800032ac:	00050493          	mv	s1,a0
    while (period != -1UL) {
    800032b0:	0204b703          	ld	a4,32(s1)
    800032b4:	fff00793          	li	a5,-1
    800032b8:	02f70663          	beq	a4,a5,800032e4 <_ZN14PeriodicThread3runEv+0x4c>
        periodicActivation();
    800032bc:	0004b783          	ld	a5,0(s1)
    800032c0:	0187b783          	ld	a5,24(a5)
    800032c4:	00048513          	mv	a0,s1
    800032c8:	000780e7          	jalr	a5
        if (period == -1UL) break;
    800032cc:	0204b503          	ld	a0,32(s1)
    800032d0:	fff00793          	li	a5,-1
    800032d4:	00f50863          	beq	a0,a5,800032e4 <_ZN14PeriodicThread3runEv+0x4c>
        sleep(period);
    800032d8:	00000097          	auipc	ra,0x0
    800032dc:	f94080e7          	jalr	-108(ra) # 8000326c <_ZN6Thread5sleepEm>
    while (period != -1UL) {
    800032e0:	fd1ff06f          	j	800032b0 <_ZN14PeriodicThread3runEv+0x18>
    }
    thread_exit();
    800032e4:	ffffe097          	auipc	ra,0xffffe
    800032e8:	1b4080e7          	jalr	436(ra) # 80001498 <_Z11thread_exitv>
}
    800032ec:	01813083          	ld	ra,24(sp)
    800032f0:	01013403          	ld	s0,16(sp)
    800032f4:	00813483          	ld	s1,8(sp)
    800032f8:	02010113          	addi	sp,sp,32
    800032fc:	00008067          	ret

0000000080003300 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80003300:	fe010113          	addi	sp,sp,-32
    80003304:	00113c23          	sd	ra,24(sp)
    80003308:	00813823          	sd	s0,16(sp)
    8000330c:	00913423          	sd	s1,8(sp)
    80003310:	02010413          	addi	s0,sp,32
    80003314:	00050493          	mv	s1,a0
    80003318:	0000a797          	auipc	a5,0xa
    8000331c:	9f078793          	addi	a5,a5,-1552 # 8000cd08 <_ZTV6Thread+0x10>
    80003320:	00f53023          	sd	a5,0(a0)
    this->body = wrapper;
    80003324:	00000797          	auipc	a5,0x0
    80003328:	c4878793          	addi	a5,a5,-952 # 80002f6c <_ZN6Thread7wrapperEPv>
    8000332c:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80003330:	00a53c23          	sd	a0,24(a0)
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80003334:	00001537          	lui	a0,0x1
    80003338:	ffffe097          	auipc	ra,0xffffe
    8000333c:	05c080e7          	jalr	92(ra) # 80001394 <_Z9mem_allocm>
    80003340:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003344:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003348:	0184b303          	ld	t1,24(s1)
    8000334c:	00030693          	mv	a3,t1
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003350:	0104b303          	ld	t1,16(s1)
    80003354:	00030613          	mv	a2,t1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003358:	00848493          	addi	s1,s1,8
    8000335c:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80003360:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80003364:	00000073          	ecall
}
    80003368:	01813083          	ld	ra,24(sp)
    8000336c:	01013403          	ld	s0,16(sp)
    80003370:	00813483          	ld	s1,8(sp)
    80003374:	02010113          	addi	sp,sp,32
    80003378:	00008067          	ret

000000008000337c <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    8000337c:	ff010113          	addi	sp,sp,-16
    80003380:	00113423          	sd	ra,8(sp)
    80003384:	00813023          	sd	s0,0(sp)
    80003388:	01010413          	addi	s0,sp,16
    8000338c:	0000a797          	auipc	a5,0xa
    80003390:	9a478793          	addi	a5,a5,-1628 # 8000cd30 <_ZTV9Semaphore+0x10>
    80003394:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle, init);
    80003398:	00850513          	addi	a0,a0,8
    8000339c:	ffffe097          	auipc	ra,0xffffe
    800033a0:	19c080e7          	jalr	412(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    800033a4:	00813083          	ld	ra,8(sp)
    800033a8:	00013403          	ld	s0,0(sp)
    800033ac:	01010113          	addi	sp,sp,16
    800033b0:	00008067          	ret

00000000800033b4 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    800033b4:	ff010113          	addi	sp,sp,-16
    800033b8:	00113423          	sd	ra,8(sp)
    800033bc:	00813023          	sd	s0,0(sp)
    800033c0:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    800033c4:	00853503          	ld	a0,8(a0)
    800033c8:	ffffe097          	auipc	ra,0xffffe
    800033cc:	1d8080e7          	jalr	472(ra) # 800015a0 <_Z8sem_waitP4KSem>
}
    800033d0:	00813083          	ld	ra,8(sp)
    800033d4:	00013403          	ld	s0,0(sp)
    800033d8:	01010113          	addi	sp,sp,16
    800033dc:	00008067          	ret

00000000800033e0 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    800033e0:	ff010113          	addi	sp,sp,-16
    800033e4:	00113423          	sd	ra,8(sp)
    800033e8:	00813023          	sd	s0,0(sp)
    800033ec:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    800033f0:	00853503          	ld	a0,8(a0)
    800033f4:	ffffe097          	auipc	ra,0xffffe
    800033f8:	1dc080e7          	jalr	476(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    800033fc:	00813083          	ld	ra,8(sp)
    80003400:	00013403          	ld	s0,0(sp)
    80003404:	01010113          	addi	sp,sp,16
    80003408:	00008067          	ret

000000008000340c <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    8000340c:	ff010113          	addi	sp,sp,-16
    80003410:	00813423          	sd	s0,8(sp)
    80003414:	01010413          	addi	s0,sp,16
    this->period = -1;
    80003418:	fff00793          	li	a5,-1
    8000341c:	02f53023          	sd	a5,32(a0)
}
    80003420:	00813403          	ld	s0,8(sp)
    80003424:	01010113          	addi	sp,sp,16
    80003428:	00008067          	ret

000000008000342c <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    8000342c:	fe010113          	addi	sp,sp,-32
    80003430:	00113c23          	sd	ra,24(sp)
    80003434:	00813823          	sd	s0,16(sp)
    80003438:	00913423          	sd	s1,8(sp)
    8000343c:	01213023          	sd	s2,0(sp)
    80003440:	02010413          	addi	s0,sp,32
    80003444:	00050493          	mv	s1,a0
    80003448:	00058913          	mv	s2,a1
    8000344c:	00000097          	auipc	ra,0x0
    80003450:	eb4080e7          	jalr	-332(ra) # 80003300 <_ZN6ThreadC1Ev>
    80003454:	0000a797          	auipc	a5,0xa
    80003458:	8fc78793          	addi	a5,a5,-1796 # 8000cd50 <_ZTV14PeriodicThread+0x10>
    8000345c:	00f4b023          	sd	a5,0(s1)
    80003460:	0324b023          	sd	s2,32(s1)
}
    80003464:	01813083          	ld	ra,24(sp)
    80003468:	01013403          	ld	s0,16(sp)
    8000346c:	00813483          	ld	s1,8(sp)
    80003470:	00013903          	ld	s2,0(sp)
    80003474:	02010113          	addi	sp,sp,32
    80003478:	00008067          	ret

000000008000347c <_ZN7Console4getcEv>:

char Console::getc() {
    8000347c:	ff010113          	addi	sp,sp,-16
    80003480:	00113423          	sd	ra,8(sp)
    80003484:	00813023          	sd	s0,0(sp)
    80003488:	01010413          	addi	s0,sp,16
    return ::getc();
    8000348c:	ffffe097          	auipc	ra,0xffffe
    80003490:	174080e7          	jalr	372(ra) # 80001600 <_Z4getcv>
}
    80003494:	00813083          	ld	ra,8(sp)
    80003498:	00013403          	ld	s0,0(sp)
    8000349c:	01010113          	addi	sp,sp,16
    800034a0:	00008067          	ret

00000000800034a4 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    800034a4:	ff010113          	addi	sp,sp,-16
    800034a8:	00113423          	sd	ra,8(sp)
    800034ac:	00813023          	sd	s0,0(sp)
    800034b0:	01010413          	addi	s0,sp,16
    ::putc(c);
    800034b4:	ffffe097          	auipc	ra,0xffffe
    800034b8:	174080e7          	jalr	372(ra) # 80001628 <_Z4putcc>
}
    800034bc:	00813083          	ld	ra,8(sp)
    800034c0:	00013403          	ld	s0,0(sp)
    800034c4:	01010113          	addi	sp,sp,16
    800034c8:	00008067          	ret

00000000800034cc <_ZN6Thread3runEv>:
protected:
    //konstruktor koji pravi nit koja izvrsava run metodu, ne stavlja je u Scheduler
    Thread();

    //funkcija koju nit izvrsava, samo ako je nit napravljena podrazumevanim konstruktorom
    virtual void run() {}
    800034cc:	ff010113          	addi	sp,sp,-16
    800034d0:	00813423          	sd	s0,8(sp)
    800034d4:	01010413          	addi	s0,sp,16
    800034d8:	00813403          	ld	s0,8(sp)
    800034dc:	01010113          	addi	sp,sp,16
    800034e0:	00008067          	ret

00000000800034e4 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    800034e4:	ff010113          	addi	sp,sp,-16
    800034e8:	00813423          	sd	s0,8(sp)
    800034ec:	01010413          	addi	s0,sp,16
    800034f0:	00813403          	ld	s0,8(sp)
    800034f4:	01010113          	addi	sp,sp,16
    800034f8:	00008067          	ret

00000000800034fc <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800034fc:	ff010113          	addi	sp,sp,-16
    80003500:	00113423          	sd	ra,8(sp)
    80003504:	00813023          	sd	s0,0(sp)
    80003508:	01010413          	addi	s0,sp,16
    8000350c:	0000a797          	auipc	a5,0xa
    80003510:	84478793          	addi	a5,a5,-1980 # 8000cd50 <_ZTV14PeriodicThread+0x10>
    80003514:	00f53023          	sd	a5,0(a0)
    80003518:	00000097          	auipc	ra,0x0
    8000351c:	a20080e7          	jalr	-1504(ra) # 80002f38 <_ZN6ThreadD1Ev>
    80003520:	00813083          	ld	ra,8(sp)
    80003524:	00013403          	ld	s0,0(sp)
    80003528:	01010113          	addi	sp,sp,16
    8000352c:	00008067          	ret

0000000080003530 <_ZN14PeriodicThreadD0Ev>:
    80003530:	fe010113          	addi	sp,sp,-32
    80003534:	00113c23          	sd	ra,24(sp)
    80003538:	00813823          	sd	s0,16(sp)
    8000353c:	00913423          	sd	s1,8(sp)
    80003540:	02010413          	addi	s0,sp,32
    80003544:	00050493          	mv	s1,a0
    80003548:	0000a797          	auipc	a5,0xa
    8000354c:	80878793          	addi	a5,a5,-2040 # 8000cd50 <_ZTV14PeriodicThread+0x10>
    80003550:	00f53023          	sd	a5,0(a0)
    80003554:	00000097          	auipc	ra,0x0
    80003558:	9e4080e7          	jalr	-1564(ra) # 80002f38 <_ZN6ThreadD1Ev>
    8000355c:	00048513          	mv	a0,s1
    80003560:	00000097          	auipc	ra,0x0
    80003564:	b08080e7          	jalr	-1272(ra) # 80003068 <_ZdlPv>
    80003568:	01813083          	ld	ra,24(sp)
    8000356c:	01013403          	ld	s0,16(sp)
    80003570:	00813483          	ld	s1,8(sp)
    80003574:	02010113          	addi	sp,sp,32
    80003578:	00008067          	ret

000000008000357c <_ZN3TCB7wrapperEv>:
    }

    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
}

void TCB::wrapper() {
    8000357c:	ff010113          	addi	sp,sp,-16
    80003580:	00113423          	sd	ra,8(sp)
    80003584:	00813023          	sd	s0,0(sp)
    80003588:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch)
    Riscv::returnFromInterrupt();
    8000358c:	00000097          	auipc	ra,0x0
    80003590:	434080e7          	jalr	1076(ra) # 800039c0 <_ZN5Riscv19returnFromInterruptEv>
    //na dalje se izvrsavamo u user modu (osim za kernel funkcije)
    running->threadFunction(running->args);
    80003594:	0000a797          	auipc	a5,0xa
    80003598:	b8c7b783          	ld	a5,-1140(a5) # 8000d120 <_ZN3TCB7runningE>
    8000359c:	0107b703          	ld	a4,16(a5)
    800035a0:	0207b503          	ld	a0,32(a5)
    800035a4:	000700e7          	jalr	a4
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    800035a8:	ffffe097          	auipc	ra,0xffffe
    800035ac:	ef0080e7          	jalr	-272(ra) # 80001498 <_Z11thread_exitv>
}
    800035b0:	00813083          	ld	ra,8(sp)
    800035b4:	00013403          	ld	s0,0(sp)
    800035b8:	01010113          	addi	sp,sp,16
    800035bc:	00008067          	ret

00000000800035c0 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    800035c0:	fe010113          	addi	sp,sp,-32
    800035c4:	00113c23          	sd	ra,24(sp)
    800035c8:	00813823          	sd	s0,16(sp)
    800035cc:	00913423          	sd	s1,8(sp)
    800035d0:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    800035d4:	0000a497          	auipc	s1,0xa
    800035d8:	b4c4b483          	ld	s1,-1204(s1) # 8000d120 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    800035dc:	0584a783          	lw	a5,88(s1)
    800035e0:	00100713          	li	a4,1
    800035e4:	04e78e63          	beq	a5,a4,80003640 <_ZN3TCB8dispatchEv+0x80>
    } else if (old->status == FINISHED) {
    800035e8:	00500713          	li	a4,5
    800035ec:	06e78263          	beq	a5,a4,80003650 <_ZN3TCB8dispatchEv+0x90>
    TCB::running = Scheduler::get();
    800035f0:	ffffe097          	auipc	ra,0xffffe
    800035f4:	788080e7          	jalr	1928(ra) # 80001d78 <_ZN9Scheduler3getEv>
    800035f8:	00050593          	mv	a1,a0
    800035fc:	0000a797          	auipc	a5,0xa
    80003600:	b2478793          	addi	a5,a5,-1244 # 8000d120 <_ZN3TCB7runningE>
    80003604:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80003608:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == (TCB::Body)main || TCB::running->threadFunction == kernelConsumerFunction ||
    8000360c:	01053783          	ld	a5,16(a0)
    80003610:	0000a717          	auipc	a4,0xa
    80003614:	96873703          	ld	a4,-1688(a4) # 8000cf78 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003618:	04e78863          	beq	a5,a4,80003668 <_ZN3TCB8dispatchEv+0xa8>
    8000361c:	0000a717          	auipc	a4,0xa
    80003620:	93473703          	ld	a4,-1740(a4) # 8000cf50 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003624:	04e78263          	beq	a5,a4,80003668 <_ZN3TCB8dispatchEv+0xa8>
    80003628:	0000a717          	auipc	a4,0xa
    8000362c:	98073703          	ld	a4,-1664(a4) # 8000cfa8 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003630:	02e78c63          	beq	a5,a4,80003668 <_ZN3TCB8dispatchEv+0xa8>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003634:	10000793          	li	a5,256
    80003638:	1007b073          	csrc	sstatus,a5
}
    8000363c:	0340006f          	j	80003670 <_ZN3TCB8dispatchEv+0xb0>
        Scheduler::put(old);
    80003640:	00048513          	mv	a0,s1
    80003644:	ffffe097          	auipc	ra,0xffffe
    80003648:	6e8080e7          	jalr	1768(ra) # 80001d2c <_ZN9Scheduler3putEP3TCB>
    8000364c:	fa5ff06f          	j	800035f0 <_ZN3TCB8dispatchEv+0x30>
        delete old->stack;
    80003650:	0184b503          	ld	a0,24(s1)
    80003654:	00050663          	beqz	a0,80003660 <_ZN3TCB8dispatchEv+0xa0>
    80003658:	00000097          	auipc	ra,0x0
    8000365c:	a10080e7          	jalr	-1520(ra) # 80003068 <_ZdlPv>
        old->stack = nullptr;
    80003660:	0004bc23          	sd	zero,24(s1)
    80003664:	f8dff06f          	j	800035f0 <_ZN3TCB8dispatchEv+0x30>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80003668:	10000793          	li	a5,256
    8000366c:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80003670:	00b48863          	beq	s1,a1,80003680 <_ZN3TCB8dispatchEv+0xc0>
    80003674:	00048513          	mv	a0,s1
    80003678:	ffffe097          	auipc	ra,0xffffe
    8000367c:	a98080e7          	jalr	-1384(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80003680:	01813083          	ld	ra,24(sp)
    80003684:	01013403          	ld	s0,16(sp)
    80003688:	00813483          	ld	s1,8(sp)
    8000368c:	02010113          	addi	sp,sp,32
    80003690:	00008067          	ret

0000000080003694 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80003694:	ff010113          	addi	sp,sp,-16
    80003698:	00113423          	sd	ra,8(sp)
    8000369c:	00813023          	sd	s0,0(sp)
    800036a0:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800036a4:	ffffe097          	auipc	ra,0xffffe
    800036a8:	cf0080e7          	jalr	-784(ra) # 80001394 <_Z9mem_allocm>
}
    800036ac:	00813083          	ld	ra,8(sp)
    800036b0:	00013403          	ld	s0,0(sp)
    800036b4:	01010113          	addi	sp,sp,16
    800036b8:	00008067          	ret

00000000800036bc <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    800036bc:	fd010113          	addi	sp,sp,-48
    800036c0:	02113423          	sd	ra,40(sp)
    800036c4:	02813023          	sd	s0,32(sp)
    800036c8:	00913c23          	sd	s1,24(sp)
    800036cc:	01213823          	sd	s2,16(sp)
    800036d0:	01313423          	sd	s3,8(sp)
    800036d4:	03010413          	addi	s0,sp,48
    800036d8:	00050913          	mv	s2,a0
    800036dc:	00058993          	mv	s3,a1
    800036e0:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    800036e4:	07000513          	li	a0,112
    800036e8:	00000097          	auipc	ra,0x0
    800036ec:	fac080e7          	jalr	-84(ra) # 80003694 <_ZN3TCBnwEm>
private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED), mySemaphore(nullptr),
                                                    joiningWithTCB(nullptr) {
    800036f0:	01253823          	sd	s2,16(a0)
    800036f4:	00953c23          	sd	s1,24(a0)
    800036f8:	03353023          	sd	s3,32(a0)
    800036fc:	00200793          	li	a5,2
    80003700:	02f53423          	sd	a5,40(a0)
    80003704:	02053823          	sd	zero,48(a0)
    80003708:	02053c23          	sd	zero,56(a0)
    8000370c:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003710:	04053423          	sd	zero,72(a0)
    80003714:	04053823          	sd	zero,80(a0)
    80003718:	04052c23          	sw	zero,88(a0)
    8000371c:	06053023          	sd	zero,96(a0)
    80003720:	06053423          	sd	zero,104(a0)
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80003724:	0000a797          	auipc	a5,0xa
    80003728:	8547b783          	ld	a5,-1964(a5) # 8000cf78 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000372c:	02f90e63          	beq	s2,a5,80003768 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80003730:	00000797          	auipc	a5,0x0
    80003734:	e4c78793          	addi	a5,a5,-436 # 8000357c <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80003738:	02048c63          	beqz	s1,80003770 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb4>
    8000373c:	00001637          	lui	a2,0x1
    80003740:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    80003744:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    80003748:	00953423          	sd	s1,8(a0)
}
    8000374c:	02813083          	ld	ra,40(sp)
    80003750:	02013403          	ld	s0,32(sp)
    80003754:	01813483          	ld	s1,24(sp)
    80003758:	01013903          	ld	s2,16(sp)
    8000375c:	00813983          	ld	s3,8(sp)
    80003760:	03010113          	addi	sp,sp,48
    80003764:	00008067          	ret
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80003768:	00000793          	li	a5,0
    8000376c:	fcdff06f          	j	80003738 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x7c>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80003770:	00000493          	li	s1,0
    80003774:	fd1ff06f          	j	80003744 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x88>

0000000080003778 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80003778:	ff010113          	addi	sp,sp,-16
    8000377c:	00113423          	sd	ra,8(sp)
    80003780:	00813023          	sd	s0,0(sp)
    80003784:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003788:	ffffe097          	auipc	ra,0xffffe
    8000378c:	c4c080e7          	jalr	-948(ra) # 800013d4 <_Z8mem_freePv>
}
    80003790:	00813083          	ld	ra,8(sp)
    80003794:	00013403          	ld	s0,0(sp)
    80003798:	01010113          	addi	sp,sp,16
    8000379c:	00008067          	ret

00000000800037a0 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED || TCB::running == handle) return;
    800037a0:	05852703          	lw	a4,88(a0)
    800037a4:	00500793          	li	a5,5
    800037a8:	04f70263          	beq	a4,a5,800037ec <_ZN3TCB10threadJoinEPS_+0x4c>
    800037ac:	0000a597          	auipc	a1,0xa
    800037b0:	9745b583          	ld	a1,-1676(a1) # 8000d120 <_ZN3TCB7runningE>
    800037b4:	02a58c63          	beq	a1,a0,800037ec <_ZN3TCB10threadJoinEPS_+0x4c>
void TCB::threadJoin(TCB* handle) {
    800037b8:	ff010113          	addi	sp,sp,-16
    800037bc:	00113423          	sd	ra,8(sp)
    800037c0:	00813023          	sd	s0,0(sp)
    800037c4:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    800037c8:	00300793          	li	a5,3
    800037cc:	04f5ac23          	sw	a5,88(a1)
    handle->waitingToJoin.putLast(TCB::running);
    800037d0:	04850513          	addi	a0,a0,72
    800037d4:	ffffe097          	auipc	ra,0xffffe
    800037d8:	a68080e7          	jalr	-1432(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
}
    800037dc:	00813083          	ld	ra,8(sp)
    800037e0:	00013403          	ld	s0,0(sp)
    800037e4:	01010113          	addi	sp,sp,16
    800037e8:	00008067          	ret
    800037ec:	00008067          	ret

00000000800037f0 <_ZN3TCB13releaseJoinedEPS_>:

void TCB::releaseJoined(TCB* handle) {
    800037f0:	fe010113          	addi	sp,sp,-32
    800037f4:	00113c23          	sd	ra,24(sp)
    800037f8:	00813823          	sd	s0,16(sp)
    800037fc:	00913423          	sd	s1,8(sp)
    80003800:	02010413          	addi	s0,sp,32
    80003804:	00050493          	mv	s1,a0
        return front == nullptr;
    80003808:	0484b783          	ld	a5,72(s1)
    while (!handle->waitingToJoin.isEmpty()) {
    8000380c:	00078e63          	beqz	a5,80003828 <_ZN3TCB13releaseJoinedEPS_+0x38>
        TCB* tcb = handle->waitingToJoin.getFirst();
    80003810:	04848513          	addi	a0,s1,72
    80003814:	ffffe097          	auipc	ra,0xffffe
    80003818:	a94080e7          	jalr	-1388(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
        Scheduler::put(tcb);
    8000381c:	ffffe097          	auipc	ra,0xffffe
    80003820:	510080e7          	jalr	1296(ra) # 80001d2c <_ZN9Scheduler3putEP3TCB>
    while (!handle->waitingToJoin.isEmpty()) {
    80003824:	fe5ff06f          	j	80003808 <_ZN3TCB13releaseJoinedEPS_+0x18>
    }
}
    80003828:	01813083          	ld	ra,24(sp)
    8000382c:	01013403          	ld	s0,16(sp)
    80003830:	00813483          	ld	s1,8(sp)
    80003834:	02010113          	addi	sp,sp,32
    80003838:	00008067          	ret

000000008000383c <_ZN3TCB10quitThreadEPS_>:

void TCB::quitThread(TCB* handle) {
    8000383c:	fe010113          	addi	sp,sp,-32
    80003840:	00113c23          	sd	ra,24(sp)
    80003844:	00813823          	sd	s0,16(sp)
    80003848:	00913423          	sd	s1,8(sp)
    8000384c:	02010413          	addi	s0,sp,32
    80003850:	00050493          	mv	s1,a0
    TCB* prev, * curr;
    switch (handle->status) {
    80003854:	05852783          	lw	a5,88(a0)
    80003858:	00300713          	li	a4,3
    8000385c:	10e78063          	beq	a5,a4,8000395c <_ZN3TCB10quitThreadEPS_+0x120>
    80003860:	04f76263          	bltu	a4,a5,800038a4 <_ZN3TCB10quitThreadEPS_+0x68>
    80003864:	00100713          	li	a4,1
    80003868:	06e78263          	beq	a5,a4,800038cc <_ZN3TCB10quitThreadEPS_+0x90>
    8000386c:	00200713          	li	a4,2
    80003870:	08e79e63          	bne	a5,a4,8000390c <_ZN3TCB10quitThreadEPS_+0xd0>
            }
            curr->nextInScheduler = nullptr;
            break;
        case BLOCKED:
            //nit blokirana na semaforu, treba da se izbaci iz reda blokiranih na semaforu
            if (handle->mySemaphore->getBlocked()->remove(handle) < 0) {
    80003874:	06053503          	ld	a0,96(a0)
    80003878:	00048593          	mv	a1,s1
    8000387c:	00850513          	addi	a0,a0,8
    80003880:	ffffe097          	auipc	ra,0xffffe
    80003884:	a88080e7          	jalr	-1400(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    80003888:	08054263          	bltz	a0,8000390c <_ZN3TCB10quitThreadEPS_+0xd0>
                //greska
            } else {
                handle->mySemaphore->increaseVal(1);
    8000388c:	0604b703          	ld	a4,96(s1)

    static void operator delete(void* ptr);

    ThreadQueue* getBlocked() { return &blocked; }

    void increaseVal(int add) { val += add; }
    80003890:	00072783          	lw	a5,0(a4)
    80003894:	0017879b          	addiw	a5,a5,1
    80003898:	00f72023          	sw	a5,0(a4)
                handle->mySemaphore = nullptr;
    8000389c:	0604b023          	sd	zero,96(s1)
    800038a0:	06c0006f          	j	8000390c <_ZN3TCB10quitThreadEPS_+0xd0>
    switch (handle->status) {
    800038a4:	00400713          	li	a4,4
    800038a8:	06e79263          	bne	a5,a4,8000390c <_ZN3TCB10quitThreadEPS_+0xd0>

    static TCB* getTail() { return tail; }

    static void setTail(TCB* tcb) { tail = tcb; }

    static TCB* getSleepingHead() { return sleepingHead; }
    800038ac:	00009797          	auipc	a5,0x9
    800038b0:	6f47b783          	ld	a5,1780(a5) # 8000cfa0 <_GLOBAL_OFFSET_TABLE_+0x88>
    800038b4:	0007b783          	ld	a5,0(a5)
                handle->joiningWithTCB = nullptr;
            }
            break;
        case SLEEPING:
            //nit je u redu uspavanih, treba da se izbaci
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    800038b8:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextSleeping);
    800038bc:	0c978063          	beq	a5,s1,8000397c <_ZN3TCB10quitThreadEPS_+0x140>
    800038c0:	00078713          	mv	a4,a5
    800038c4:	0407b783          	ld	a5,64(a5)
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    800038c8:	ff5ff06f          	j	800038bc <_ZN3TCB10quitThreadEPS_+0x80>
    static TCB* getHead() { return head; }
    800038cc:	00009797          	auipc	a5,0x9
    800038d0:	68c7b783          	ld	a5,1676(a5) # 8000cf58 <_GLOBAL_OFFSET_TABLE_+0x40>
    800038d4:	0007b783          	ld	a5,0(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    800038d8:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextInScheduler);
    800038dc:	00978863          	beq	a5,s1,800038ec <_ZN3TCB10quitThreadEPS_+0xb0>
    800038e0:	00078713          	mv	a4,a5
    800038e4:	0307b783          	ld	a5,48(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    800038e8:	ff5ff06f          	j	800038dc <_ZN3TCB10quitThreadEPS_+0xa0>
            if (!prev) {
    800038ec:	04070663          	beqz	a4,80003938 <_ZN3TCB10quitThreadEPS_+0xfc>
                prev->nextInScheduler = curr->nextInScheduler;
    800038f0:	0307b683          	ld	a3,48(a5)
    800038f4:	02d73823          	sd	a3,48(a4)
    static TCB* getTail() { return tail; }
    800038f8:	00009697          	auipc	a3,0x9
    800038fc:	6486b683          	ld	a3,1608(a3) # 8000cf40 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003900:	0006b683          	ld	a3,0(a3)
            if (curr == Scheduler::getTail()) {
    80003904:	04d78463          	beq	a5,a3,8000394c <_ZN3TCB10quitThreadEPS_+0x110>
            curr->nextInScheduler = nullptr;
    80003908:	0207b823          	sd	zero,48(a5)
        case FINISHED:
            break;
        default:
            break;
    }
    handle->status = FINISHED;
    8000390c:	00500793          	li	a5,5
    80003910:	04f4ac23          	sw	a5,88(s1)
    delete handle->stack;
    80003914:	0184b503          	ld	a0,24(s1)
    80003918:	00050663          	beqz	a0,80003924 <_ZN3TCB10quitThreadEPS_+0xe8>
    8000391c:	fffff097          	auipc	ra,0xfffff
    80003920:	74c080e7          	jalr	1868(ra) # 80003068 <_ZdlPv>
}
    80003924:	01813083          	ld	ra,24(sp)
    80003928:	01013403          	ld	s0,16(sp)
    8000392c:	00813483          	ld	s1,8(sp)
    80003930:	02010113          	addi	sp,sp,32
    80003934:	00008067          	ret
                Scheduler::setHead(curr->nextInScheduler);
    80003938:	0307b603          	ld	a2,48(a5)
    static void setHead(TCB* tcb) { head = tcb; }
    8000393c:	00009697          	auipc	a3,0x9
    80003940:	61c6b683          	ld	a3,1564(a3) # 8000cf58 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003944:	00c6b023          	sd	a2,0(a3)
    80003948:	fb1ff06f          	j	800038f8 <_ZN3TCB10quitThreadEPS_+0xbc>
    static void setTail(TCB* tcb) { tail = tcb; }
    8000394c:	00009697          	auipc	a3,0x9
    80003950:	5f46b683          	ld	a3,1524(a3) # 8000cf40 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003954:	00e6b023          	sd	a4,0(a3)
    80003958:	fb1ff06f          	j	80003908 <_ZN3TCB10quitThreadEPS_+0xcc>
            if (handle->joiningWithTCB->getListOfJoiningThreads()->remove(handle) < 0) {
    8000395c:	06853503          	ld	a0,104(a0)
    80003960:	00048593          	mv	a1,s1
    80003964:	04850513          	addi	a0,a0,72
    80003968:	ffffe097          	auipc	ra,0xffffe
    8000396c:	9a0080e7          	jalr	-1632(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    80003970:	f8054ee3          	bltz	a0,8000390c <_ZN3TCB10quitThreadEPS_+0xd0>
                handle->joiningWithTCB = nullptr;
    80003974:	0604b423          	sd	zero,104(s1)
    80003978:	f95ff06f          	j	8000390c <_ZN3TCB10quitThreadEPS_+0xd0>
            if (!prev) {
    8000397c:	02070863          	beqz	a4,800039ac <_ZN3TCB10quitThreadEPS_+0x170>
                prev->nextSleeping = curr->nextSleeping;
    80003980:	0407b683          	ld	a3,64(a5)
    80003984:	04d73023          	sd	a3,64(a4)
            if (curr->nextSleeping) {
    80003988:	0407b703          	ld	a4,64(a5)
    8000398c:	00070a63          	beqz	a4,800039a0 <_ZN3TCB10quitThreadEPS_+0x164>
                curr->nextSleeping->timeToSleep += curr->timeToSleep;
    80003990:	0387b603          	ld	a2,56(a5)
    80003994:	03873683          	ld	a3,56(a4)
    80003998:	00c686b3          	add	a3,a3,a2
    8000399c:	02d73c23          	sd	a3,56(a4)
            curr->timeToSleep = 0;
    800039a0:	0207bc23          	sd	zero,56(a5)
            curr->nextSleeping = nullptr;
    800039a4:	0407b023          	sd	zero,64(a5)
            break;
    800039a8:	f65ff06f          	j	8000390c <_ZN3TCB10quitThreadEPS_+0xd0>
                Scheduler::setSleepingHead(curr->nextSleeping);
    800039ac:	0407b683          	ld	a3,64(a5)

    static void setSleepingHead(TCB* tcb) { sleepingHead = tcb; }
    800039b0:	00009717          	auipc	a4,0x9
    800039b4:	5f073703          	ld	a4,1520(a4) # 8000cfa0 <_GLOBAL_OFFSET_TABLE_+0x88>
    800039b8:	00d73023          	sd	a3,0(a4)
    800039bc:	fcdff06f          	j	80003988 <_ZN3TCB10quitThreadEPS_+0x14c>

00000000800039c0 <_ZN5Riscv19returnFromInterruptEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::returnFromInterrupt() {
    800039c0:	ff010113          	addi	sp,sp,-16
    800039c4:	00813423          	sd	s0,8(sp)
    800039c8:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    800039cc:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    800039d0:	10200073          	sret
    800039d4:	00813403          	ld	s0,8(sp)
    800039d8:	01010113          	addi	sp,sp,16
    800039dc:	00008067          	ret

00000000800039e0 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    800039e0:	ff010113          	addi	sp,sp,-16
    800039e4:	00113423          	sd	ra,8(sp)
    800039e8:	00813023          	sd	s0,0(sp)
    800039ec:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800039f0:	ffffe097          	auipc	ra,0xffffe
    800039f4:	9a4080e7          	jalr	-1628(ra) # 80001394 <_Z9mem_allocm>
}
    800039f8:	00813083          	ld	ra,8(sp)
    800039fc:	00013403          	ld	s0,0(sp)
    80003a00:	01010113          	addi	sp,sp,16
    80003a04:	00008067          	ret

0000000080003a08 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80003a08:	ff010113          	addi	sp,sp,-16
    80003a0c:	00113423          	sd	ra,8(sp)
    80003a10:	00813023          	sd	s0,0(sp)
    80003a14:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003a18:	ffffe097          	auipc	ra,0xffffe
    80003a1c:	9bc080e7          	jalr	-1604(ra) # 800013d4 <_Z8mem_freePv>
}
    80003a20:	00813083          	ld	ra,8(sp)
    80003a24:	00013403          	ld	s0,0(sp)
    80003a28:	01010113          	addi	sp,sp,16
    80003a2c:	00008067          	ret

0000000080003a30 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003a30:	fe010113          	addi	sp,sp,-32
    80003a34:	00113c23          	sd	ra,24(sp)
    80003a38:	00813823          	sd	s0,16(sp)
    80003a3c:	00913423          	sd	s1,8(sp)
    80003a40:	02010413          	addi	s0,sp,32
    80003a44:	00050493          	mv	s1,a0
	return new KSem(val);
    80003a48:	01800513          	li	a0,24
    80003a4c:	00000097          	auipc	ra,0x0
    80003a50:	f94080e7          	jalr	-108(ra) # 800039e0 <_ZN4KSemnwEm>
    void block();

    void unblock();

private:
    KSem(uint val) : val(val) {}
    80003a54:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003a58:	00053423          	sd	zero,8(a0)
    80003a5c:	00053823          	sd	zero,16(a0)
}
    80003a60:	01813083          	ld	ra,24(sp)
    80003a64:	01013403          	ld	s0,16(sp)
    80003a68:	00813483          	ld	s1,8(sp)
    80003a6c:	02010113          	addi	sp,sp,32
    80003a70:	00008067          	ret

0000000080003a74 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003a74:	ff010113          	addi	sp,sp,-16
    80003a78:	00113423          	sd	ra,8(sp)
    80003a7c:	00813023          	sd	s0,0(sp)
    80003a80:	01010413          	addi	s0,sp,16
    static TCB* getRunning() { return running; }
    80003a84:	00009797          	auipc	a5,0x9
    80003a88:	5047b783          	ld	a5,1284(a5) # 8000cf88 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003a8c:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80003a90:	00200793          	li	a5,2
    80003a94:	04f5ac23          	sw	a5,88(a1)
    TCB::getRunning()->setStatus(TCB::BLOCKED);
	blocked.putLast(TCB::getRunning());
    80003a98:	00850513          	addi	a0,a0,8
    80003a9c:	ffffd097          	auipc	ra,0xffffd
    80003aa0:	7a0080e7          	jalr	1952(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::dispatch();
    80003aa4:	00000097          	auipc	ra,0x0
    80003aa8:	b1c080e7          	jalr	-1252(ra) # 800035c0 <_ZN3TCB8dispatchEv>
}
    80003aac:	00813083          	ld	ra,8(sp)
    80003ab0:	00013403          	ld	s0,0(sp)
    80003ab4:	01010113          	addi	sp,sp,16
    80003ab8:	00008067          	ret

0000000080003abc <_ZN4KSem4waitEv>:
	if (--val < 0) {
    80003abc:	00052783          	lw	a5,0(a0)
    80003ac0:	fff7879b          	addiw	a5,a5,-1
    80003ac4:	00f52023          	sw	a5,0(a0)
    80003ac8:	02079713          	slli	a4,a5,0x20
    80003acc:	00074663          	bltz	a4,80003ad8 <_ZN4KSem4waitEv+0x1c>
	return 0;
    80003ad0:	00000513          	li	a0,0
}
    80003ad4:	00008067          	ret
int KSem::wait() {
    80003ad8:	ff010113          	addi	sp,sp,-16
    80003adc:	00113423          	sd	ra,8(sp)
    80003ae0:	00813023          	sd	s0,0(sp)
    80003ae4:	01010413          	addi	s0,sp,16
		block();
    80003ae8:	00000097          	auipc	ra,0x0
    80003aec:	f8c080e7          	jalr	-116(ra) # 80003a74 <_ZN4KSem5blockEv>
		return -1;
    80003af0:	fff00513          	li	a0,-1
}
    80003af4:	00813083          	ld	ra,8(sp)
    80003af8:	00013403          	ld	s0,0(sp)
    80003afc:	01010113          	addi	sp,sp,16
    80003b00:	00008067          	ret

0000000080003b04 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003b04:	ff010113          	addi	sp,sp,-16
    80003b08:	00113423          	sd	ra,8(sp)
    80003b0c:	00813023          	sd	s0,0(sp)
    80003b10:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003b14:	00850513          	addi	a0,a0,8
    80003b18:	ffffd097          	auipc	ra,0xffffd
    80003b1c:	790080e7          	jalr	1936(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
	Scheduler::put(tcb);
    80003b20:	ffffe097          	auipc	ra,0xffffe
    80003b24:	20c080e7          	jalr	524(ra) # 80001d2c <_ZN9Scheduler3putEP3TCB>
}
    80003b28:	00813083          	ld	ra,8(sp)
    80003b2c:	00013403          	ld	s0,0(sp)
    80003b30:	01010113          	addi	sp,sp,16
    80003b34:	00008067          	ret

0000000080003b38 <_ZN4KSem6signalEv>:
	if (val++ < 0) {
    80003b38:	00052783          	lw	a5,0(a0)
    80003b3c:	0017871b          	addiw	a4,a5,1
    80003b40:	00e52023          	sw	a4,0(a0)
    80003b44:	0007c663          	bltz	a5,80003b50 <_ZN4KSem6signalEv+0x18>
}
    80003b48:	00000513          	li	a0,0
    80003b4c:	00008067          	ret
int KSem::signal() {
    80003b50:	ff010113          	addi	sp,sp,-16
    80003b54:	00113423          	sd	ra,8(sp)
    80003b58:	00813023          	sd	s0,0(sp)
    80003b5c:	01010413          	addi	s0,sp,16
		unblock();
    80003b60:	00000097          	auipc	ra,0x0
    80003b64:	fa4080e7          	jalr	-92(ra) # 80003b04 <_ZN4KSem7unblockEv>
}
    80003b68:	00000513          	li	a0,0
    80003b6c:	00813083          	ld	ra,8(sp)
    80003b70:	00013403          	ld	s0,0(sp)
    80003b74:	01010113          	addi	sp,sp,16
    80003b78:	00008067          	ret

0000000080003b7c <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003b7c:	fe010113          	addi	sp,sp,-32
    80003b80:	00113c23          	sd	ra,24(sp)
    80003b84:	00813823          	sd	s0,16(sp)
    80003b88:	00913423          	sd	s1,8(sp)
    80003b8c:	02010413          	addi	s0,sp,32
    80003b90:	00050493          	mv	s1,a0
        return front == nullptr;
    80003b94:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003b98:	00078e63          	beqz	a5,80003bb4 <_ZN4KSem8closeSemEPS_+0x38>
		TCB* tcb = handle->blocked.getFirst();
    80003b9c:	00848513          	addi	a0,s1,8
    80003ba0:	ffffd097          	auipc	ra,0xffffd
    80003ba4:	708080e7          	jalr	1800(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
		Scheduler::put(tcb);
    80003ba8:	ffffe097          	auipc	ra,0xffffe
    80003bac:	184080e7          	jalr	388(ra) # 80001d2c <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    80003bb0:	fe5ff06f          	j	80003b94 <_ZN4KSem8closeSemEPS_+0x18>
	}
	return 0;
}
    80003bb4:	00000513          	li	a0,0
    80003bb8:	01813083          	ld	ra,24(sp)
    80003bbc:	01013403          	ld	s0,16(sp)
    80003bc0:	00813483          	ld	s1,8(sp)
    80003bc4:	02010113          	addi	sp,sp,32
    80003bc8:	00008067          	ret

0000000080003bcc <_Z13emptyFunctionPv>:
void idle(void*);

void kernelConsumerFunction(void*);


void emptyFunction(void*) {}
    80003bcc:	ff010113          	addi	sp,sp,-16
    80003bd0:	00813423          	sd	s0,8(sp)
    80003bd4:	01010413          	addi	s0,sp,16
    80003bd8:	00813403          	ld	s0,8(sp)
    80003bdc:	01010113          	addi	sp,sp,16
    80003be0:	00008067          	ret

0000000080003be4 <_Z5nit1fPv>:

void nit1f(void*) {
    80003be4:	fe010113          	addi	sp,sp,-32
    80003be8:	00113c23          	sd	ra,24(sp)
    80003bec:	00813823          	sd	s0,16(sp)
    80003bf0:	02010413          	addi	s0,sp,32
    while (true) {
        thread_t handle;
        thread_create(&handle, emptyFunction, nullptr);
    80003bf4:	00000613          	li	a2,0
    80003bf8:	00000597          	auipc	a1,0x0
    80003bfc:	fd458593          	addi	a1,a1,-44 # 80003bcc <_Z13emptyFunctionPv>
    80003c00:	fe840513          	addi	a0,s0,-24
    80003c04:	ffffe097          	auipc	ra,0xffffe
    80003c08:	800080e7          	jalr	-2048(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    while (true) {
    80003c0c:	fe9ff06f          	j	80003bf4 <_Z5nit1fPv+0x10>

0000000080003c10 <_Z5nit2fPv>:
    }

    printString("\nGotova nit 1\n");
}

void nit2f(void* arg2) {
    80003c10:	ff010113          	addi	sp,sp,-16
    80003c14:	00113423          	sd	ra,8(sp)
    80003c18:	00813023          	sd	s0,0(sp)
    80003c1c:	01010413          	addi	s0,sp,16
    printString("\nGotova nit 2\n");
    80003c20:	00006517          	auipc	a0,0x6
    80003c24:	41050513          	addi	a0,a0,1040 # 8000a030 <CONSOLE_STATUS+0x20>
    80003c28:	00002097          	auipc	ra,0x2
    80003c2c:	658080e7          	jalr	1624(ra) # 80006280 <_Z11printStringPKc>
}
    80003c30:	00813083          	ld	ra,8(sp)
    80003c34:	00013403          	ld	s0,0(sp)
    80003c38:	01010113          	addi	sp,sp,16
    80003c3c:	00008067          	ret

0000000080003c40 <_Z5nit3fPv>:


void nit3f(void*) {
    80003c40:	fe010113          	addi	sp,sp,-32
    80003c44:	00113c23          	sd	ra,24(sp)
    80003c48:	00813823          	sd	s0,16(sp)
    80003c4c:	00913423          	sd	s1,8(sp)
    80003c50:	02010413          	addi	s0,sp,32
    80003c54:	0180006f          	j	80003c6c <_Z5nit3fPv+0x2c>
    char slovo;
    do {
        slovo = getc();
        putc(slovo);
        if (slovo == '\r') putc('\n');
    80003c58:	00a00513          	li	a0,10
    80003c5c:	ffffe097          	auipc	ra,0xffffe
    80003c60:	9cc080e7          	jalr	-1588(ra) # 80001628 <_Z4putcc>
    } while (slovo != '0');
    80003c64:	03000793          	li	a5,48
    80003c68:	02f48263          	beq	s1,a5,80003c8c <_Z5nit3fPv+0x4c>
        slovo = getc();
    80003c6c:	ffffe097          	auipc	ra,0xffffe
    80003c70:	994080e7          	jalr	-1644(ra) # 80001600 <_Z4getcv>
    80003c74:	00050493          	mv	s1,a0
        putc(slovo);
    80003c78:	ffffe097          	auipc	ra,0xffffe
    80003c7c:	9b0080e7          	jalr	-1616(ra) # 80001628 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    80003c80:	00d00793          	li	a5,13
    80003c84:	fef490e3          	bne	s1,a5,80003c64 <_Z5nit3fPv+0x24>
    80003c88:	fd1ff06f          	j	80003c58 <_Z5nit3fPv+0x18>

    printString("\nGotova nit3\n");
    80003c8c:	00006517          	auipc	a0,0x6
    80003c90:	3bc50513          	addi	a0,a0,956 # 8000a048 <CONSOLE_STATUS+0x38>
    80003c94:	00002097          	auipc	ra,0x2
    80003c98:	5ec080e7          	jalr	1516(ra) # 80006280 <_Z11printStringPKc>
}
    80003c9c:	01813083          	ld	ra,24(sp)
    80003ca0:	01013403          	ld	s0,16(sp)
    80003ca4:	00813483          	ld	s1,8(sp)
    80003ca8:	02010113          	addi	sp,sp,32
    80003cac:	00008067          	ret

0000000080003cb0 <_Z5main5v>:


int main5() {
    80003cb0:	fb010113          	addi	sp,sp,-80
    80003cb4:	04113423          	sd	ra,72(sp)
    80003cb8:	04813023          	sd	s0,64(sp)
    80003cbc:	02913c23          	sd	s1,56(sp)
    80003cc0:	05010413          	addi	s0,sp,80
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80003cc4:	00009797          	auipc	a5,0x9
    80003cc8:	2d47b783          	ld	a5,724(a5) # 8000cf98 <_GLOBAL_OFFSET_TABLE_+0x80>
    80003ccc:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80003cd0:	ffffe097          	auipc	ra,0xffffe
    80003cd4:	39c080e7          	jalr	924(ra) # 8000206c <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80003cd8:	ffffe097          	auipc	ra,0xffffe
    80003cdc:	a34080e7          	jalr	-1484(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>

    //testiranje kreiranja niti
    thread_t glavnaNit = nullptr;
    80003ce0:	fc043c23          	sd	zero,-40(s0)
    thread_t nit1 = nullptr;
    80003ce4:	fc043823          	sd	zero,-48(s0)
    thread_t nit2 = nullptr;
    80003ce8:	fc043423          	sd	zero,-56(s0)
    thread_t nit3 = nullptr;
    80003cec:	fc043023          	sd	zero,-64(s0)
    thread_t idleNit = nullptr;
    80003cf0:	fa043c23          	sd	zero,-72(s0)
    thread_t kernelConsumerThread = nullptr;
    80003cf4:	fa043823          	sd	zero,-80(s0)
    thread_create(&glavnaNit, (TCB::Body)main, nullptr);
    80003cf8:	00000613          	li	a2,0
    80003cfc:	00009597          	auipc	a1,0x9
    80003d00:	27c5b583          	ld	a1,636(a1) # 8000cf78 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003d04:	fd840513          	addi	a0,s0,-40
    80003d08:	ffffd097          	auipc	ra,0xffffd
    80003d0c:	6fc080e7          	jalr	1788(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    static void setRunning(TCB* newRunning) { running = newRunning; }
    80003d10:	fd843703          	ld	a4,-40(s0)
    80003d14:	00009797          	auipc	a5,0x9
    80003d18:	2747b783          	ld	a5,628(a5) # 8000cf88 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003d1c:	00e7b023          	sd	a4,0(a5)
    TCB::setRunning(glavnaNit);
    thread_create(&idleNit, idle, nullptr);
    80003d20:	00000613          	li	a2,0
    80003d24:	00009597          	auipc	a1,0x9
    80003d28:	2845b583          	ld	a1,644(a1) # 8000cfa8 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003d2c:	fb840513          	addi	a0,s0,-72
    80003d30:	ffffd097          	auipc	ra,0xffffd
    80003d34:	6d4080e7          	jalr	1748(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    80003d38:	00000613          	li	a2,0
    80003d3c:	00009597          	auipc	a1,0x9
    80003d40:	2145b583          	ld	a1,532(a1) # 8000cf50 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003d44:	fb040513          	addi	a0,s0,-80
    80003d48:	ffffd097          	auipc	ra,0xffffd
    80003d4c:	6bc080e7          	jalr	1724(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>


    thread_create(&nit1, nit1f, nullptr);
    80003d50:	00000613          	li	a2,0
    80003d54:	00000597          	auipc	a1,0x0
    80003d58:	e9058593          	addi	a1,a1,-368 # 80003be4 <_Z5nit1fPv>
    80003d5c:	fd040513          	addi	a0,s0,-48
    80003d60:	ffffd097          	auipc	ra,0xffffd
    80003d64:	6a4080e7          	jalr	1700(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit2, nit2f, nullptr);
    80003d68:	00000613          	li	a2,0
    80003d6c:	00000597          	auipc	a1,0x0
    80003d70:	ea458593          	addi	a1,a1,-348 # 80003c10 <_Z5nit2fPv>
    80003d74:	fc840513          	addi	a0,s0,-56
    80003d78:	ffffd097          	auipc	ra,0xffffd
    80003d7c:	68c080e7          	jalr	1676(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit3, nit3f, nullptr);
    80003d80:	00000613          	li	a2,0
    80003d84:	00000597          	auipc	a1,0x0
    80003d88:	ebc58593          	addi	a1,a1,-324 # 80003c40 <_Z5nit3fPv>
    80003d8c:	fc040513          	addi	a0,s0,-64
    80003d90:	ffffd097          	auipc	ra,0xffffd
    80003d94:	674080e7          	jalr	1652(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    80003d98:	00200493          	li	s1,2
    80003d9c:	1004a073          	csrs	sstatus,s1

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    thread_join(nit1);
    80003da0:	fd043503          	ld	a0,-48(s0)
    80003da4:	ffffd097          	auipc	ra,0xffffd
    80003da8:	73c080e7          	jalr	1852(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit2);
    80003dac:	fc843503          	ld	a0,-56(s0)
    80003db0:	ffffd097          	auipc	ra,0xffffd
    80003db4:	730080e7          	jalr	1840(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit3);
    80003db8:	fc043503          	ld	a0,-64(s0)
    80003dbc:	ffffd097          	auipc	ra,0xffffd
    80003dc0:	724080e7          	jalr	1828(ra) # 800014e0 <_Z11thread_joinP3TCB>
    //thread_join(idleNit);

    printString("\nGotove user niti\n");
    80003dc4:	00006517          	auipc	a0,0x6
    80003dc8:	29450513          	addi	a0,a0,660 # 8000a058 <CONSOLE_STATUS+0x48>
    80003dcc:	00002097          	auipc	ra,0x2
    80003dd0:	4b4080e7          	jalr	1204(ra) # 80006280 <_Z11printStringPKc>

    printString("\nSad cu da izadjem\n");
    80003dd4:	00006517          	auipc	a0,0x6
    80003dd8:	29c50513          	addi	a0,a0,668 # 8000a070 <CONSOLE_STATUS+0x60>
    80003ddc:	00002097          	auipc	ra,0x2
    80003de0:	4a4080e7          	jalr	1188(ra) # 80006280 <_Z11printStringPKc>
        __asm__ volatile("li a0, 0x43");
    80003de4:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80003de8:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003dec:	1004b073          	csrc	sstatus,s1
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);


    return 0;
    80003df0:	00000513          	li	a0,0
    80003df4:	04813083          	ld	ra,72(sp)
    80003df8:	04013403          	ld	s0,64(sp)
    80003dfc:	03813483          	ld	s1,56(sp)
    80003e00:	05010113          	addi	sp,sp,80
    80003e04:	00008067          	ret

0000000080003e08 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003e08:	fe010113          	addi	sp,sp,-32
    80003e0c:	00113c23          	sd	ra,24(sp)
    80003e10:	00813823          	sd	s0,16(sp)
    80003e14:	00913423          	sd	s1,8(sp)
    80003e18:	01213023          	sd	s2,0(sp)
    80003e1c:	02010413          	addi	s0,sp,32
    80003e20:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003e24:	00000913          	li	s2,0
    80003e28:	00c0006f          	j	80003e34 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003e2c:	ffffd097          	auipc	ra,0xffffd
    80003e30:	694080e7          	jalr	1684(ra) # 800014c0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80003e34:	ffffd097          	auipc	ra,0xffffd
    80003e38:	7cc080e7          	jalr	1996(ra) # 80001600 <_Z4getcv>
    80003e3c:	0005059b          	sext.w	a1,a0
    80003e40:	02d00793          	li	a5,45
    80003e44:	02f58a63          	beq	a1,a5,80003e78 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003e48:	0084b503          	ld	a0,8(s1)
    80003e4c:	00003097          	auipc	ra,0x3
    80003e50:	400080e7          	jalr	1024(ra) # 8000724c <_ZN6Buffer3putEi>
        i++;
    80003e54:	0019071b          	addiw	a4,s2,1
    80003e58:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003e5c:	0004a683          	lw	a3,0(s1)
    80003e60:	0026979b          	slliw	a5,a3,0x2
    80003e64:	00d787bb          	addw	a5,a5,a3
    80003e68:	0017979b          	slliw	a5,a5,0x1
    80003e6c:	02f767bb          	remw	a5,a4,a5
    80003e70:	fc0792e3          	bnez	a5,80003e34 <_ZL16producerKeyboardPv+0x2c>
    80003e74:	fb9ff06f          	j	80003e2c <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003e78:	00100793          	li	a5,1
    80003e7c:	00009717          	auipc	a4,0x9
    80003e80:	2af72a23          	sw	a5,692(a4) # 8000d130 <_ZL9threadEnd>
    data->buffer->put('!');
    80003e84:	02100593          	li	a1,33
    80003e88:	0084b503          	ld	a0,8(s1)
    80003e8c:	00003097          	auipc	ra,0x3
    80003e90:	3c0080e7          	jalr	960(ra) # 8000724c <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003e94:	0104b503          	ld	a0,16(s1)
    80003e98:	ffffd097          	auipc	ra,0xffffd
    80003e9c:	738080e7          	jalr	1848(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80003ea0:	01813083          	ld	ra,24(sp)
    80003ea4:	01013403          	ld	s0,16(sp)
    80003ea8:	00813483          	ld	s1,8(sp)
    80003eac:	00013903          	ld	s2,0(sp)
    80003eb0:	02010113          	addi	sp,sp,32
    80003eb4:	00008067          	ret

0000000080003eb8 <_ZL8producerPv>:

static void producer(void *arg) {
    80003eb8:	fe010113          	addi	sp,sp,-32
    80003ebc:	00113c23          	sd	ra,24(sp)
    80003ec0:	00813823          	sd	s0,16(sp)
    80003ec4:	00913423          	sd	s1,8(sp)
    80003ec8:	01213023          	sd	s2,0(sp)
    80003ecc:	02010413          	addi	s0,sp,32
    80003ed0:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003ed4:	00000913          	li	s2,0
    80003ed8:	00c0006f          	j	80003ee4 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003edc:	ffffd097          	auipc	ra,0xffffd
    80003ee0:	5e4080e7          	jalr	1508(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003ee4:	00009797          	auipc	a5,0x9
    80003ee8:	24c7a783          	lw	a5,588(a5) # 8000d130 <_ZL9threadEnd>
    80003eec:	02079e63          	bnez	a5,80003f28 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003ef0:	0004a583          	lw	a1,0(s1)
    80003ef4:	0305859b          	addiw	a1,a1,48
    80003ef8:	0084b503          	ld	a0,8(s1)
    80003efc:	00003097          	auipc	ra,0x3
    80003f00:	350080e7          	jalr	848(ra) # 8000724c <_ZN6Buffer3putEi>
        i++;
    80003f04:	0019071b          	addiw	a4,s2,1
    80003f08:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003f0c:	0004a683          	lw	a3,0(s1)
    80003f10:	0026979b          	slliw	a5,a3,0x2
    80003f14:	00d787bb          	addw	a5,a5,a3
    80003f18:	0017979b          	slliw	a5,a5,0x1
    80003f1c:	02f767bb          	remw	a5,a4,a5
    80003f20:	fc0792e3          	bnez	a5,80003ee4 <_ZL8producerPv+0x2c>
    80003f24:	fb9ff06f          	j	80003edc <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003f28:	0104b503          	ld	a0,16(s1)
    80003f2c:	ffffd097          	auipc	ra,0xffffd
    80003f30:	6a4080e7          	jalr	1700(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80003f34:	01813083          	ld	ra,24(sp)
    80003f38:	01013403          	ld	s0,16(sp)
    80003f3c:	00813483          	ld	s1,8(sp)
    80003f40:	00013903          	ld	s2,0(sp)
    80003f44:	02010113          	addi	sp,sp,32
    80003f48:	00008067          	ret

0000000080003f4c <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003f4c:	fd010113          	addi	sp,sp,-48
    80003f50:	02113423          	sd	ra,40(sp)
    80003f54:	02813023          	sd	s0,32(sp)
    80003f58:	00913c23          	sd	s1,24(sp)
    80003f5c:	01213823          	sd	s2,16(sp)
    80003f60:	01313423          	sd	s3,8(sp)
    80003f64:	03010413          	addi	s0,sp,48
    80003f68:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003f6c:	00000993          	li	s3,0
    80003f70:	01c0006f          	j	80003f8c <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003f74:	ffffd097          	auipc	ra,0xffffd
    80003f78:	54c080e7          	jalr	1356(ra) # 800014c0 <_Z15thread_dispatchv>
    80003f7c:	0500006f          	j	80003fcc <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003f80:	00a00513          	li	a0,10
    80003f84:	ffffd097          	auipc	ra,0xffffd
    80003f88:	6a4080e7          	jalr	1700(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    80003f8c:	00009797          	auipc	a5,0x9
    80003f90:	1a47a783          	lw	a5,420(a5) # 8000d130 <_ZL9threadEnd>
    80003f94:	06079063          	bnez	a5,80003ff4 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003f98:	00893503          	ld	a0,8(s2)
    80003f9c:	00003097          	auipc	ra,0x3
    80003fa0:	340080e7          	jalr	832(ra) # 800072dc <_ZN6Buffer3getEv>
        i++;
    80003fa4:	0019849b          	addiw	s1,s3,1
    80003fa8:	0004899b          	sext.w	s3,s1
        putc(key);
    80003fac:	0ff57513          	andi	a0,a0,255
    80003fb0:	ffffd097          	auipc	ra,0xffffd
    80003fb4:	678080e7          	jalr	1656(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003fb8:	00092703          	lw	a4,0(s2)
    80003fbc:	0027179b          	slliw	a5,a4,0x2
    80003fc0:	00e787bb          	addw	a5,a5,a4
    80003fc4:	02f4e7bb          	remw	a5,s1,a5
    80003fc8:	fa0786e3          	beqz	a5,80003f74 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003fcc:	05000793          	li	a5,80
    80003fd0:	02f4e4bb          	remw	s1,s1,a5
    80003fd4:	fa049ce3          	bnez	s1,80003f8c <_ZL8consumerPv+0x40>
    80003fd8:	fa9ff06f          	j	80003f80 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003fdc:	00893503          	ld	a0,8(s2)
    80003fe0:	00003097          	auipc	ra,0x3
    80003fe4:	2fc080e7          	jalr	764(ra) # 800072dc <_ZN6Buffer3getEv>
        putc(key);
    80003fe8:	0ff57513          	andi	a0,a0,255
    80003fec:	ffffd097          	auipc	ra,0xffffd
    80003ff0:	63c080e7          	jalr	1596(ra) # 80001628 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003ff4:	00893503          	ld	a0,8(s2)
    80003ff8:	00003097          	auipc	ra,0x3
    80003ffc:	370080e7          	jalr	880(ra) # 80007368 <_ZN6Buffer6getCntEv>
    80004000:	fca04ee3          	bgtz	a0,80003fdc <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80004004:	01093503          	ld	a0,16(s2)
    80004008:	ffffd097          	auipc	ra,0xffffd
    8000400c:	5c8080e7          	jalr	1480(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80004010:	02813083          	ld	ra,40(sp)
    80004014:	02013403          	ld	s0,32(sp)
    80004018:	01813483          	ld	s1,24(sp)
    8000401c:	01013903          	ld	s2,16(sp)
    80004020:	00813983          	ld	s3,8(sp)
    80004024:	03010113          	addi	sp,sp,48
    80004028:	00008067          	ret

000000008000402c <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    8000402c:	f9010113          	addi	sp,sp,-112
    80004030:	06113423          	sd	ra,104(sp)
    80004034:	06813023          	sd	s0,96(sp)
    80004038:	04913c23          	sd	s1,88(sp)
    8000403c:	05213823          	sd	s2,80(sp)
    80004040:	05313423          	sd	s3,72(sp)
    80004044:	05413023          	sd	s4,64(sp)
    80004048:	03513c23          	sd	s5,56(sp)
    8000404c:	03613823          	sd	s6,48(sp)
    80004050:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80004054:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80004058:	00006517          	auipc	a0,0x6
    8000405c:	29850513          	addi	a0,a0,664 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    80004060:	00002097          	auipc	ra,0x2
    80004064:	220080e7          	jalr	544(ra) # 80006280 <_Z11printStringPKc>
    getString(input, 30);
    80004068:	01e00593          	li	a1,30
    8000406c:	fa040493          	addi	s1,s0,-96
    80004070:	00048513          	mv	a0,s1
    80004074:	00002097          	auipc	ra,0x2
    80004078:	294080e7          	jalr	660(ra) # 80006308 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000407c:	00048513          	mv	a0,s1
    80004080:	00002097          	auipc	ra,0x2
    80004084:	360080e7          	jalr	864(ra) # 800063e0 <_Z11stringToIntPKc>
    80004088:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000408c:	00006517          	auipc	a0,0x6
    80004090:	28450513          	addi	a0,a0,644 # 8000a310 <CONSOLE_STATUS+0x300>
    80004094:	00002097          	auipc	ra,0x2
    80004098:	1ec080e7          	jalr	492(ra) # 80006280 <_Z11printStringPKc>
    getString(input, 30);
    8000409c:	01e00593          	li	a1,30
    800040a0:	00048513          	mv	a0,s1
    800040a4:	00002097          	auipc	ra,0x2
    800040a8:	264080e7          	jalr	612(ra) # 80006308 <_Z9getStringPci>
    n = stringToInt(input);
    800040ac:	00048513          	mv	a0,s1
    800040b0:	00002097          	auipc	ra,0x2
    800040b4:	330080e7          	jalr	816(ra) # 800063e0 <_Z11stringToIntPKc>
    800040b8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    800040bc:	00006517          	auipc	a0,0x6
    800040c0:	27450513          	addi	a0,a0,628 # 8000a330 <CONSOLE_STATUS+0x320>
    800040c4:	00002097          	auipc	ra,0x2
    800040c8:	1bc080e7          	jalr	444(ra) # 80006280 <_Z11printStringPKc>
	printInt(threadNum);
    800040cc:	00000613          	li	a2,0
    800040d0:	00a00593          	li	a1,10
    800040d4:	00090513          	mv	a0,s2
    800040d8:	00002097          	auipc	ra,0x2
    800040dc:	358080e7          	jalr	856(ra) # 80006430 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800040e0:	00006517          	auipc	a0,0x6
    800040e4:	26850513          	addi	a0,a0,616 # 8000a348 <CONSOLE_STATUS+0x338>
    800040e8:	00002097          	auipc	ra,0x2
    800040ec:	198080e7          	jalr	408(ra) # 80006280 <_Z11printStringPKc>
	printInt(n);
    800040f0:	00000613          	li	a2,0
    800040f4:	00a00593          	li	a1,10
    800040f8:	00048513          	mv	a0,s1
    800040fc:	00002097          	auipc	ra,0x2
    80004100:	334080e7          	jalr	820(ra) # 80006430 <_Z8printIntiii>
    printString(".\n");
    80004104:	00006517          	auipc	a0,0x6
    80004108:	25c50513          	addi	a0,a0,604 # 8000a360 <CONSOLE_STATUS+0x350>
    8000410c:	00002097          	auipc	ra,0x2
    80004110:	174080e7          	jalr	372(ra) # 80006280 <_Z11printStringPKc>
    if(threadNum > n) {
    80004114:	0324c463          	blt	s1,s2,8000413c <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80004118:	03205c63          	blez	s2,80004150 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    8000411c:	03800513          	li	a0,56
    80004120:	fffff097          	auipc	ra,0xfffff
    80004124:	ef8080e7          	jalr	-264(ra) # 80003018 <_Znwm>
    80004128:	00050a13          	mv	s4,a0
    8000412c:	00048593          	mv	a1,s1
    80004130:	00003097          	auipc	ra,0x3
    80004134:	080080e7          	jalr	128(ra) # 800071b0 <_ZN6BufferC1Ei>
    80004138:	0300006f          	j	80004168 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000413c:	00006517          	auipc	a0,0x6
    80004140:	22c50513          	addi	a0,a0,556 # 8000a368 <CONSOLE_STATUS+0x358>
    80004144:	00002097          	auipc	ra,0x2
    80004148:	13c080e7          	jalr	316(ra) # 80006280 <_Z11printStringPKc>
        return;
    8000414c:	0140006f          	j	80004160 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004150:	00006517          	auipc	a0,0x6
    80004154:	25850513          	addi	a0,a0,600 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80004158:	00002097          	auipc	ra,0x2
    8000415c:	128080e7          	jalr	296(ra) # 80006280 <_Z11printStringPKc>
        return;
    80004160:	000b0113          	mv	sp,s6
    80004164:	1500006f          	j	800042b4 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80004168:	00000593          	li	a1,0
    8000416c:	00009517          	auipc	a0,0x9
    80004170:	fcc50513          	addi	a0,a0,-52 # 8000d138 <_ZL10waitForAll>
    80004174:	ffffd097          	auipc	ra,0xffffd
    80004178:	3c4080e7          	jalr	964(ra) # 80001538 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    8000417c:	00391793          	slli	a5,s2,0x3
    80004180:	00f78793          	addi	a5,a5,15
    80004184:	ff07f793          	andi	a5,a5,-16
    80004188:	40f10133          	sub	sp,sp,a5
    8000418c:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80004190:	0019071b          	addiw	a4,s2,1
    80004194:	00171793          	slli	a5,a4,0x1
    80004198:	00e787b3          	add	a5,a5,a4
    8000419c:	00379793          	slli	a5,a5,0x3
    800041a0:	00f78793          	addi	a5,a5,15
    800041a4:	ff07f793          	andi	a5,a5,-16
    800041a8:	40f10133          	sub	sp,sp,a5
    800041ac:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800041b0:	00191613          	slli	a2,s2,0x1
    800041b4:	012607b3          	add	a5,a2,s2
    800041b8:	00379793          	slli	a5,a5,0x3
    800041bc:	00f987b3          	add	a5,s3,a5
    800041c0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800041c4:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800041c8:	00009717          	auipc	a4,0x9
    800041cc:	f7073703          	ld	a4,-144(a4) # 8000d138 <_ZL10waitForAll>
    800041d0:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800041d4:	00078613          	mv	a2,a5
    800041d8:	00000597          	auipc	a1,0x0
    800041dc:	d7458593          	addi	a1,a1,-652 # 80003f4c <_ZL8consumerPv>
    800041e0:	f9840513          	addi	a0,s0,-104
    800041e4:	ffffd097          	auipc	ra,0xffffd
    800041e8:	220080e7          	jalr	544(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800041ec:	00000493          	li	s1,0
    800041f0:	0280006f          	j	80004218 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    800041f4:	00000597          	auipc	a1,0x0
    800041f8:	c1458593          	addi	a1,a1,-1004 # 80003e08 <_ZL16producerKeyboardPv>
                      data + i);
    800041fc:	00179613          	slli	a2,a5,0x1
    80004200:	00f60633          	add	a2,a2,a5
    80004204:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80004208:	00c98633          	add	a2,s3,a2
    8000420c:	ffffd097          	auipc	ra,0xffffd
    80004210:	1f8080e7          	jalr	504(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80004214:	0014849b          	addiw	s1,s1,1
    80004218:	0524d263          	bge	s1,s2,8000425c <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    8000421c:	00149793          	slli	a5,s1,0x1
    80004220:	009787b3          	add	a5,a5,s1
    80004224:	00379793          	slli	a5,a5,0x3
    80004228:	00f987b3          	add	a5,s3,a5
    8000422c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80004230:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80004234:	00009717          	auipc	a4,0x9
    80004238:	f0473703          	ld	a4,-252(a4) # 8000d138 <_ZL10waitForAll>
    8000423c:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80004240:	00048793          	mv	a5,s1
    80004244:	00349513          	slli	a0,s1,0x3
    80004248:	00aa8533          	add	a0,s5,a0
    8000424c:	fa9054e3          	blez	s1,800041f4 <_Z22producerConsumer_C_APIv+0x1c8>
    80004250:	00000597          	auipc	a1,0x0
    80004254:	c6858593          	addi	a1,a1,-920 # 80003eb8 <_ZL8producerPv>
    80004258:	fa5ff06f          	j	800041fc <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    8000425c:	ffffd097          	auipc	ra,0xffffd
    80004260:	264080e7          	jalr	612(ra) # 800014c0 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80004264:	00000493          	li	s1,0
    80004268:	00994e63          	blt	s2,s1,80004284 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    8000426c:	00009517          	auipc	a0,0x9
    80004270:	ecc53503          	ld	a0,-308(a0) # 8000d138 <_ZL10waitForAll>
    80004274:	ffffd097          	auipc	ra,0xffffd
    80004278:	32c080e7          	jalr	812(ra) # 800015a0 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    8000427c:	0014849b          	addiw	s1,s1,1
    80004280:	fe9ff06f          	j	80004268 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80004284:	00009517          	auipc	a0,0x9
    80004288:	eb453503          	ld	a0,-332(a0) # 8000d138 <_ZL10waitForAll>
    8000428c:	ffffd097          	auipc	ra,0xffffd
    80004290:	2e4080e7          	jalr	740(ra) # 80001570 <_Z9sem_closeP4KSem>
    delete buffer;
    80004294:	000a0e63          	beqz	s4,800042b0 <_Z22producerConsumer_C_APIv+0x284>
    80004298:	000a0513          	mv	a0,s4
    8000429c:	00003097          	auipc	ra,0x3
    800042a0:	154080e7          	jalr	340(ra) # 800073f0 <_ZN6BufferD1Ev>
    800042a4:	000a0513          	mv	a0,s4
    800042a8:	fffff097          	auipc	ra,0xfffff
    800042ac:	dc0080e7          	jalr	-576(ra) # 80003068 <_ZdlPv>
    800042b0:	000b0113          	mv	sp,s6

}
    800042b4:	f9040113          	addi	sp,s0,-112
    800042b8:	06813083          	ld	ra,104(sp)
    800042bc:	06013403          	ld	s0,96(sp)
    800042c0:	05813483          	ld	s1,88(sp)
    800042c4:	05013903          	ld	s2,80(sp)
    800042c8:	04813983          	ld	s3,72(sp)
    800042cc:	04013a03          	ld	s4,64(sp)
    800042d0:	03813a83          	ld	s5,56(sp)
    800042d4:	03013b03          	ld	s6,48(sp)
    800042d8:	07010113          	addi	sp,sp,112
    800042dc:	00008067          	ret
    800042e0:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800042e4:	000a0513          	mv	a0,s4
    800042e8:	fffff097          	auipc	ra,0xfffff
    800042ec:	d80080e7          	jalr	-640(ra) # 80003068 <_ZdlPv>
    800042f0:	00048513          	mv	a0,s1
    800042f4:	0000a097          	auipc	ra,0xa
    800042f8:	f74080e7          	jalr	-140(ra) # 8000e268 <_Unwind_Resume>

00000000800042fc <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800042fc:	fe010113          	addi	sp,sp,-32
    80004300:	00113c23          	sd	ra,24(sp)
    80004304:	00813823          	sd	s0,16(sp)
    80004308:	00913423          	sd	s1,8(sp)
    8000430c:	01213023          	sd	s2,0(sp)
    80004310:	02010413          	addi	s0,sp,32
    80004314:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004318:	00100793          	li	a5,1
    8000431c:	02a7f863          	bgeu	a5,a0,8000434c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004320:	00a00793          	li	a5,10
    80004324:	02f577b3          	remu	a5,a0,a5
    80004328:	02078e63          	beqz	a5,80004364 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000432c:	fff48513          	addi	a0,s1,-1
    80004330:	00000097          	auipc	ra,0x0
    80004334:	fcc080e7          	jalr	-52(ra) # 800042fc <_ZL9fibonaccim>
    80004338:	00050913          	mv	s2,a0
    8000433c:	ffe48513          	addi	a0,s1,-2
    80004340:	00000097          	auipc	ra,0x0
    80004344:	fbc080e7          	jalr	-68(ra) # 800042fc <_ZL9fibonaccim>
    80004348:	00a90533          	add	a0,s2,a0
}
    8000434c:	01813083          	ld	ra,24(sp)
    80004350:	01013403          	ld	s0,16(sp)
    80004354:	00813483          	ld	s1,8(sp)
    80004358:	00013903          	ld	s2,0(sp)
    8000435c:	02010113          	addi	sp,sp,32
    80004360:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004364:	ffffd097          	auipc	ra,0xffffd
    80004368:	15c080e7          	jalr	348(ra) # 800014c0 <_Z15thread_dispatchv>
    8000436c:	fc1ff06f          	j	8000432c <_ZL9fibonaccim+0x30>

0000000080004370 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80004370:	fe010113          	addi	sp,sp,-32
    80004374:	00113c23          	sd	ra,24(sp)
    80004378:	00813823          	sd	s0,16(sp)
    8000437c:	00913423          	sd	s1,8(sp)
    80004380:	01213023          	sd	s2,0(sp)
    80004384:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004388:	00000913          	li	s2,0
    8000438c:	0380006f          	j	800043c4 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80004390:	ffffd097          	auipc	ra,0xffffd
    80004394:	130080e7          	jalr	304(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004398:	00148493          	addi	s1,s1,1
    8000439c:	000027b7          	lui	a5,0x2
    800043a0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800043a4:	0097ee63          	bltu	a5,s1,800043c0 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800043a8:	00000713          	li	a4,0
    800043ac:	000077b7          	lui	a5,0x7
    800043b0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800043b4:	fce7eee3          	bltu	a5,a4,80004390 <_ZN7WorkerA11workerBodyAEPv+0x20>
    800043b8:	00170713          	addi	a4,a4,1
    800043bc:	ff1ff06f          	j	800043ac <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800043c0:	00190913          	addi	s2,s2,1
    800043c4:	00900793          	li	a5,9
    800043c8:	0527e063          	bltu	a5,s2,80004408 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800043cc:	00006517          	auipc	a0,0x6
    800043d0:	00c50513          	addi	a0,a0,12 # 8000a3d8 <CONSOLE_STATUS+0x3c8>
    800043d4:	00002097          	auipc	ra,0x2
    800043d8:	eac080e7          	jalr	-340(ra) # 80006280 <_Z11printStringPKc>
    800043dc:	00000613          	li	a2,0
    800043e0:	00a00593          	li	a1,10
    800043e4:	0009051b          	sext.w	a0,s2
    800043e8:	00002097          	auipc	ra,0x2
    800043ec:	048080e7          	jalr	72(ra) # 80006430 <_Z8printIntiii>
    800043f0:	00006517          	auipc	a0,0x6
    800043f4:	24850513          	addi	a0,a0,584 # 8000a638 <CONSOLE_STATUS+0x628>
    800043f8:	00002097          	auipc	ra,0x2
    800043fc:	e88080e7          	jalr	-376(ra) # 80006280 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004400:	00000493          	li	s1,0
    80004404:	f99ff06f          	j	8000439c <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80004408:	00006517          	auipc	a0,0x6
    8000440c:	fd850513          	addi	a0,a0,-40 # 8000a3e0 <CONSOLE_STATUS+0x3d0>
    80004410:	00002097          	auipc	ra,0x2
    80004414:	e70080e7          	jalr	-400(ra) # 80006280 <_Z11printStringPKc>
    finishedA = true;
    80004418:	00100793          	li	a5,1
    8000441c:	00009717          	auipc	a4,0x9
    80004420:	d2f70223          	sb	a5,-732(a4) # 8000d140 <_ZL9finishedA>
}
    80004424:	01813083          	ld	ra,24(sp)
    80004428:	01013403          	ld	s0,16(sp)
    8000442c:	00813483          	ld	s1,8(sp)
    80004430:	00013903          	ld	s2,0(sp)
    80004434:	02010113          	addi	sp,sp,32
    80004438:	00008067          	ret

000000008000443c <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    8000443c:	fe010113          	addi	sp,sp,-32
    80004440:	00113c23          	sd	ra,24(sp)
    80004444:	00813823          	sd	s0,16(sp)
    80004448:	00913423          	sd	s1,8(sp)
    8000444c:	01213023          	sd	s2,0(sp)
    80004450:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004454:	00000913          	li	s2,0
    80004458:	0380006f          	j	80004490 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    8000445c:	ffffd097          	auipc	ra,0xffffd
    80004460:	064080e7          	jalr	100(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004464:	00148493          	addi	s1,s1,1
    80004468:	000027b7          	lui	a5,0x2
    8000446c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004470:	0097ee63          	bltu	a5,s1,8000448c <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004474:	00000713          	li	a4,0
    80004478:	000077b7          	lui	a5,0x7
    8000447c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004480:	fce7eee3          	bltu	a5,a4,8000445c <_ZN7WorkerB11workerBodyBEPv+0x20>
    80004484:	00170713          	addi	a4,a4,1
    80004488:	ff1ff06f          	j	80004478 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    8000448c:	00190913          	addi	s2,s2,1
    80004490:	00f00793          	li	a5,15
    80004494:	0527e063          	bltu	a5,s2,800044d4 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004498:	00006517          	auipc	a0,0x6
    8000449c:	f5850513          	addi	a0,a0,-168 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    800044a0:	00002097          	auipc	ra,0x2
    800044a4:	de0080e7          	jalr	-544(ra) # 80006280 <_Z11printStringPKc>
    800044a8:	00000613          	li	a2,0
    800044ac:	00a00593          	li	a1,10
    800044b0:	0009051b          	sext.w	a0,s2
    800044b4:	00002097          	auipc	ra,0x2
    800044b8:	f7c080e7          	jalr	-132(ra) # 80006430 <_Z8printIntiii>
    800044bc:	00006517          	auipc	a0,0x6
    800044c0:	17c50513          	addi	a0,a0,380 # 8000a638 <CONSOLE_STATUS+0x628>
    800044c4:	00002097          	auipc	ra,0x2
    800044c8:	dbc080e7          	jalr	-580(ra) # 80006280 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800044cc:	00000493          	li	s1,0
    800044d0:	f99ff06f          	j	80004468 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800044d4:	00006517          	auipc	a0,0x6
    800044d8:	f2450513          	addi	a0,a0,-220 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    800044dc:	00002097          	auipc	ra,0x2
    800044e0:	da4080e7          	jalr	-604(ra) # 80006280 <_Z11printStringPKc>
    finishedB = true;
    800044e4:	00100793          	li	a5,1
    800044e8:	00009717          	auipc	a4,0x9
    800044ec:	c4f70ca3          	sb	a5,-935(a4) # 8000d141 <_ZL9finishedB>
    thread_dispatch();
    800044f0:	ffffd097          	auipc	ra,0xffffd
    800044f4:	fd0080e7          	jalr	-48(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800044f8:	01813083          	ld	ra,24(sp)
    800044fc:	01013403          	ld	s0,16(sp)
    80004500:	00813483          	ld	s1,8(sp)
    80004504:	00013903          	ld	s2,0(sp)
    80004508:	02010113          	addi	sp,sp,32
    8000450c:	00008067          	ret

0000000080004510 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80004510:	fe010113          	addi	sp,sp,-32
    80004514:	00113c23          	sd	ra,24(sp)
    80004518:	00813823          	sd	s0,16(sp)
    8000451c:	00913423          	sd	s1,8(sp)
    80004520:	01213023          	sd	s2,0(sp)
    80004524:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004528:	00000493          	li	s1,0
    8000452c:	0400006f          	j	8000456c <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004530:	00006517          	auipc	a0,0x6
    80004534:	ed850513          	addi	a0,a0,-296 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80004538:	00002097          	auipc	ra,0x2
    8000453c:	d48080e7          	jalr	-696(ra) # 80006280 <_Z11printStringPKc>
    80004540:	00000613          	li	a2,0
    80004544:	00a00593          	li	a1,10
    80004548:	00048513          	mv	a0,s1
    8000454c:	00002097          	auipc	ra,0x2
    80004550:	ee4080e7          	jalr	-284(ra) # 80006430 <_Z8printIntiii>
    80004554:	00006517          	auipc	a0,0x6
    80004558:	0e450513          	addi	a0,a0,228 # 8000a638 <CONSOLE_STATUS+0x628>
    8000455c:	00002097          	auipc	ra,0x2
    80004560:	d24080e7          	jalr	-732(ra) # 80006280 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004564:	0014849b          	addiw	s1,s1,1
    80004568:	0ff4f493          	andi	s1,s1,255
    8000456c:	00200793          	li	a5,2
    80004570:	fc97f0e3          	bgeu	a5,s1,80004530 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80004574:	00006517          	auipc	a0,0x6
    80004578:	e9c50513          	addi	a0,a0,-356 # 8000a410 <CONSOLE_STATUS+0x400>
    8000457c:	00002097          	auipc	ra,0x2
    80004580:	d04080e7          	jalr	-764(ra) # 80006280 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004584:	00700313          	li	t1,7
    thread_dispatch();
    80004588:	ffffd097          	auipc	ra,0xffffd
    8000458c:	f38080e7          	jalr	-200(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004590:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80004594:	00006517          	auipc	a0,0x6
    80004598:	e8c50513          	addi	a0,a0,-372 # 8000a420 <CONSOLE_STATUS+0x410>
    8000459c:	00002097          	auipc	ra,0x2
    800045a0:	ce4080e7          	jalr	-796(ra) # 80006280 <_Z11printStringPKc>
    800045a4:	00000613          	li	a2,0
    800045a8:	00a00593          	li	a1,10
    800045ac:	0009051b          	sext.w	a0,s2
    800045b0:	00002097          	auipc	ra,0x2
    800045b4:	e80080e7          	jalr	-384(ra) # 80006430 <_Z8printIntiii>
    800045b8:	00006517          	auipc	a0,0x6
    800045bc:	08050513          	addi	a0,a0,128 # 8000a638 <CONSOLE_STATUS+0x628>
    800045c0:	00002097          	auipc	ra,0x2
    800045c4:	cc0080e7          	jalr	-832(ra) # 80006280 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800045c8:	00c00513          	li	a0,12
    800045cc:	00000097          	auipc	ra,0x0
    800045d0:	d30080e7          	jalr	-720(ra) # 800042fc <_ZL9fibonaccim>
    800045d4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800045d8:	00006517          	auipc	a0,0x6
    800045dc:	e5050513          	addi	a0,a0,-432 # 8000a428 <CONSOLE_STATUS+0x418>
    800045e0:	00002097          	auipc	ra,0x2
    800045e4:	ca0080e7          	jalr	-864(ra) # 80006280 <_Z11printStringPKc>
    800045e8:	00000613          	li	a2,0
    800045ec:	00a00593          	li	a1,10
    800045f0:	0009051b          	sext.w	a0,s2
    800045f4:	00002097          	auipc	ra,0x2
    800045f8:	e3c080e7          	jalr	-452(ra) # 80006430 <_Z8printIntiii>
    800045fc:	00006517          	auipc	a0,0x6
    80004600:	03c50513          	addi	a0,a0,60 # 8000a638 <CONSOLE_STATUS+0x628>
    80004604:	00002097          	auipc	ra,0x2
    80004608:	c7c080e7          	jalr	-900(ra) # 80006280 <_Z11printStringPKc>
    8000460c:	0400006f          	j	8000464c <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004610:	00006517          	auipc	a0,0x6
    80004614:	df850513          	addi	a0,a0,-520 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80004618:	00002097          	auipc	ra,0x2
    8000461c:	c68080e7          	jalr	-920(ra) # 80006280 <_Z11printStringPKc>
    80004620:	00000613          	li	a2,0
    80004624:	00a00593          	li	a1,10
    80004628:	00048513          	mv	a0,s1
    8000462c:	00002097          	auipc	ra,0x2
    80004630:	e04080e7          	jalr	-508(ra) # 80006430 <_Z8printIntiii>
    80004634:	00006517          	auipc	a0,0x6
    80004638:	00450513          	addi	a0,a0,4 # 8000a638 <CONSOLE_STATUS+0x628>
    8000463c:	00002097          	auipc	ra,0x2
    80004640:	c44080e7          	jalr	-956(ra) # 80006280 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004644:	0014849b          	addiw	s1,s1,1
    80004648:	0ff4f493          	andi	s1,s1,255
    8000464c:	00500793          	li	a5,5
    80004650:	fc97f0e3          	bgeu	a5,s1,80004610 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80004654:	00006517          	auipc	a0,0x6
    80004658:	de450513          	addi	a0,a0,-540 # 8000a438 <CONSOLE_STATUS+0x428>
    8000465c:	00002097          	auipc	ra,0x2
    80004660:	c24080e7          	jalr	-988(ra) # 80006280 <_Z11printStringPKc>
    finishedC = true;
    80004664:	00100793          	li	a5,1
    80004668:	00009717          	auipc	a4,0x9
    8000466c:	acf70d23          	sb	a5,-1318(a4) # 8000d142 <_ZL9finishedC>
    thread_dispatch();
    80004670:	ffffd097          	auipc	ra,0xffffd
    80004674:	e50080e7          	jalr	-432(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80004678:	01813083          	ld	ra,24(sp)
    8000467c:	01013403          	ld	s0,16(sp)
    80004680:	00813483          	ld	s1,8(sp)
    80004684:	00013903          	ld	s2,0(sp)
    80004688:	02010113          	addi	sp,sp,32
    8000468c:	00008067          	ret

0000000080004690 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80004690:	fe010113          	addi	sp,sp,-32
    80004694:	00113c23          	sd	ra,24(sp)
    80004698:	00813823          	sd	s0,16(sp)
    8000469c:	00913423          	sd	s1,8(sp)
    800046a0:	01213023          	sd	s2,0(sp)
    800046a4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800046a8:	00a00493          	li	s1,10
    800046ac:	0400006f          	j	800046ec <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800046b0:	00006517          	auipc	a0,0x6
    800046b4:	d9850513          	addi	a0,a0,-616 # 8000a448 <CONSOLE_STATUS+0x438>
    800046b8:	00002097          	auipc	ra,0x2
    800046bc:	bc8080e7          	jalr	-1080(ra) # 80006280 <_Z11printStringPKc>
    800046c0:	00000613          	li	a2,0
    800046c4:	00a00593          	li	a1,10
    800046c8:	00048513          	mv	a0,s1
    800046cc:	00002097          	auipc	ra,0x2
    800046d0:	d64080e7          	jalr	-668(ra) # 80006430 <_Z8printIntiii>
    800046d4:	00006517          	auipc	a0,0x6
    800046d8:	f6450513          	addi	a0,a0,-156 # 8000a638 <CONSOLE_STATUS+0x628>
    800046dc:	00002097          	auipc	ra,0x2
    800046e0:	ba4080e7          	jalr	-1116(ra) # 80006280 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800046e4:	0014849b          	addiw	s1,s1,1
    800046e8:	0ff4f493          	andi	s1,s1,255
    800046ec:	00c00793          	li	a5,12
    800046f0:	fc97f0e3          	bgeu	a5,s1,800046b0 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800046f4:	00006517          	auipc	a0,0x6
    800046f8:	d5c50513          	addi	a0,a0,-676 # 8000a450 <CONSOLE_STATUS+0x440>
    800046fc:	00002097          	auipc	ra,0x2
    80004700:	b84080e7          	jalr	-1148(ra) # 80006280 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004704:	00500313          	li	t1,5
    thread_dispatch();
    80004708:	ffffd097          	auipc	ra,0xffffd
    8000470c:	db8080e7          	jalr	-584(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004710:	01000513          	li	a0,16
    80004714:	00000097          	auipc	ra,0x0
    80004718:	be8080e7          	jalr	-1048(ra) # 800042fc <_ZL9fibonaccim>
    8000471c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004720:	00006517          	auipc	a0,0x6
    80004724:	d4050513          	addi	a0,a0,-704 # 8000a460 <CONSOLE_STATUS+0x450>
    80004728:	00002097          	auipc	ra,0x2
    8000472c:	b58080e7          	jalr	-1192(ra) # 80006280 <_Z11printStringPKc>
    80004730:	00000613          	li	a2,0
    80004734:	00a00593          	li	a1,10
    80004738:	0009051b          	sext.w	a0,s2
    8000473c:	00002097          	auipc	ra,0x2
    80004740:	cf4080e7          	jalr	-780(ra) # 80006430 <_Z8printIntiii>
    80004744:	00006517          	auipc	a0,0x6
    80004748:	ef450513          	addi	a0,a0,-268 # 8000a638 <CONSOLE_STATUS+0x628>
    8000474c:	00002097          	auipc	ra,0x2
    80004750:	b34080e7          	jalr	-1228(ra) # 80006280 <_Z11printStringPKc>
    80004754:	0400006f          	j	80004794 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004758:	00006517          	auipc	a0,0x6
    8000475c:	cf050513          	addi	a0,a0,-784 # 8000a448 <CONSOLE_STATUS+0x438>
    80004760:	00002097          	auipc	ra,0x2
    80004764:	b20080e7          	jalr	-1248(ra) # 80006280 <_Z11printStringPKc>
    80004768:	00000613          	li	a2,0
    8000476c:	00a00593          	li	a1,10
    80004770:	00048513          	mv	a0,s1
    80004774:	00002097          	auipc	ra,0x2
    80004778:	cbc080e7          	jalr	-836(ra) # 80006430 <_Z8printIntiii>
    8000477c:	00006517          	auipc	a0,0x6
    80004780:	ebc50513          	addi	a0,a0,-324 # 8000a638 <CONSOLE_STATUS+0x628>
    80004784:	00002097          	auipc	ra,0x2
    80004788:	afc080e7          	jalr	-1284(ra) # 80006280 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000478c:	0014849b          	addiw	s1,s1,1
    80004790:	0ff4f493          	andi	s1,s1,255
    80004794:	00f00793          	li	a5,15
    80004798:	fc97f0e3          	bgeu	a5,s1,80004758 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    8000479c:	00006517          	auipc	a0,0x6
    800047a0:	cd450513          	addi	a0,a0,-812 # 8000a470 <CONSOLE_STATUS+0x460>
    800047a4:	00002097          	auipc	ra,0x2
    800047a8:	adc080e7          	jalr	-1316(ra) # 80006280 <_Z11printStringPKc>
    finishedD = true;
    800047ac:	00100793          	li	a5,1
    800047b0:	00009717          	auipc	a4,0x9
    800047b4:	98f709a3          	sb	a5,-1645(a4) # 8000d143 <_ZL9finishedD>
    thread_dispatch();
    800047b8:	ffffd097          	auipc	ra,0xffffd
    800047bc:	d08080e7          	jalr	-760(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800047c0:	01813083          	ld	ra,24(sp)
    800047c4:	01013403          	ld	s0,16(sp)
    800047c8:	00813483          	ld	s1,8(sp)
    800047cc:	00013903          	ld	s2,0(sp)
    800047d0:	02010113          	addi	sp,sp,32
    800047d4:	00008067          	ret

00000000800047d8 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800047d8:	fc010113          	addi	sp,sp,-64
    800047dc:	02113c23          	sd	ra,56(sp)
    800047e0:	02813823          	sd	s0,48(sp)
    800047e4:	02913423          	sd	s1,40(sp)
    800047e8:	03213023          	sd	s2,32(sp)
    800047ec:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800047f0:	02000513          	li	a0,32
    800047f4:	fffff097          	auipc	ra,0xfffff
    800047f8:	824080e7          	jalr	-2012(ra) # 80003018 <_Znwm>
    800047fc:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004800:	fffff097          	auipc	ra,0xfffff
    80004804:	b00080e7          	jalr	-1280(ra) # 80003300 <_ZN6ThreadC1Ev>
    80004808:	00008797          	auipc	a5,0x8
    8000480c:	57878793          	addi	a5,a5,1400 # 8000cd80 <_ZTV7WorkerA+0x10>
    80004810:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004814:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004818:	00006517          	auipc	a0,0x6
    8000481c:	c6850513          	addi	a0,a0,-920 # 8000a480 <CONSOLE_STATUS+0x470>
    80004820:	00002097          	auipc	ra,0x2
    80004824:	a60080e7          	jalr	-1440(ra) # 80006280 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004828:	02000513          	li	a0,32
    8000482c:	ffffe097          	auipc	ra,0xffffe
    80004830:	7ec080e7          	jalr	2028(ra) # 80003018 <_Znwm>
    80004834:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004838:	fffff097          	auipc	ra,0xfffff
    8000483c:	ac8080e7          	jalr	-1336(ra) # 80003300 <_ZN6ThreadC1Ev>
    80004840:	00008797          	auipc	a5,0x8
    80004844:	56878793          	addi	a5,a5,1384 # 8000cda8 <_ZTV7WorkerB+0x10>
    80004848:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    8000484c:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004850:	00006517          	auipc	a0,0x6
    80004854:	c4850513          	addi	a0,a0,-952 # 8000a498 <CONSOLE_STATUS+0x488>
    80004858:	00002097          	auipc	ra,0x2
    8000485c:	a28080e7          	jalr	-1496(ra) # 80006280 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004860:	02000513          	li	a0,32
    80004864:	ffffe097          	auipc	ra,0xffffe
    80004868:	7b4080e7          	jalr	1972(ra) # 80003018 <_Znwm>
    8000486c:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004870:	fffff097          	auipc	ra,0xfffff
    80004874:	a90080e7          	jalr	-1392(ra) # 80003300 <_ZN6ThreadC1Ev>
    80004878:	00008797          	auipc	a5,0x8
    8000487c:	55878793          	addi	a5,a5,1368 # 8000cdd0 <_ZTV7WorkerC+0x10>
    80004880:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004884:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80004888:	00006517          	auipc	a0,0x6
    8000488c:	c2850513          	addi	a0,a0,-984 # 8000a4b0 <CONSOLE_STATUS+0x4a0>
    80004890:	00002097          	auipc	ra,0x2
    80004894:	9f0080e7          	jalr	-1552(ra) # 80006280 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004898:	02000513          	li	a0,32
    8000489c:	ffffe097          	auipc	ra,0xffffe
    800048a0:	77c080e7          	jalr	1916(ra) # 80003018 <_Znwm>
    800048a4:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800048a8:	fffff097          	auipc	ra,0xfffff
    800048ac:	a58080e7          	jalr	-1448(ra) # 80003300 <_ZN6ThreadC1Ev>
    800048b0:	00008797          	auipc	a5,0x8
    800048b4:	54878793          	addi	a5,a5,1352 # 8000cdf8 <_ZTV7WorkerD+0x10>
    800048b8:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800048bc:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800048c0:	00006517          	auipc	a0,0x6
    800048c4:	c0850513          	addi	a0,a0,-1016 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    800048c8:	00002097          	auipc	ra,0x2
    800048cc:	9b8080e7          	jalr	-1608(ra) # 80006280 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800048d0:	00000493          	li	s1,0
    800048d4:	00300793          	li	a5,3
    800048d8:	0297c663          	blt	a5,s1,80004904 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800048dc:	00349793          	slli	a5,s1,0x3
    800048e0:	fe040713          	addi	a4,s0,-32
    800048e4:	00f707b3          	add	a5,a4,a5
    800048e8:	fe07b503          	ld	a0,-32(a5)
    800048ec:	fffff097          	auipc	ra,0xfffff
    800048f0:	8e4080e7          	jalr	-1820(ra) # 800031d0 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800048f4:	0014849b          	addiw	s1,s1,1
    800048f8:	fddff06f          	j	800048d4 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800048fc:	fffff097          	auipc	ra,0xfffff
    80004900:	948080e7          	jalr	-1720(ra) # 80003244 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004904:	00009797          	auipc	a5,0x9
    80004908:	83c7c783          	lbu	a5,-1988(a5) # 8000d140 <_ZL9finishedA>
    8000490c:	fe0788e3          	beqz	a5,800048fc <_Z20Threads_CPP_API_testv+0x124>
    80004910:	00009797          	auipc	a5,0x9
    80004914:	8317c783          	lbu	a5,-1999(a5) # 8000d141 <_ZL9finishedB>
    80004918:	fe0782e3          	beqz	a5,800048fc <_Z20Threads_CPP_API_testv+0x124>
    8000491c:	00009797          	auipc	a5,0x9
    80004920:	8267c783          	lbu	a5,-2010(a5) # 8000d142 <_ZL9finishedC>
    80004924:	fc078ce3          	beqz	a5,800048fc <_Z20Threads_CPP_API_testv+0x124>
    80004928:	00009797          	auipc	a5,0x9
    8000492c:	81b7c783          	lbu	a5,-2021(a5) # 8000d143 <_ZL9finishedD>
    80004930:	fc0786e3          	beqz	a5,800048fc <_Z20Threads_CPP_API_testv+0x124>
    80004934:	fc040493          	addi	s1,s0,-64
    80004938:	0080006f          	j	80004940 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    8000493c:	00848493          	addi	s1,s1,8
    80004940:	fe040793          	addi	a5,s0,-32
    80004944:	08f48663          	beq	s1,a5,800049d0 <_Z20Threads_CPP_API_testv+0x1f8>
    80004948:	0004b503          	ld	a0,0(s1)
		delete thread;
    8000494c:	fe0508e3          	beqz	a0,8000493c <_Z20Threads_CPP_API_testv+0x164>
    80004950:	00053783          	ld	a5,0(a0)
    80004954:	0087b783          	ld	a5,8(a5)
    80004958:	000780e7          	jalr	a5
    8000495c:	fe1ff06f          	j	8000493c <_Z20Threads_CPP_API_testv+0x164>
    80004960:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004964:	00048513          	mv	a0,s1
    80004968:	ffffe097          	auipc	ra,0xffffe
    8000496c:	700080e7          	jalr	1792(ra) # 80003068 <_ZdlPv>
    80004970:	00090513          	mv	a0,s2
    80004974:	0000a097          	auipc	ra,0xa
    80004978:	8f4080e7          	jalr	-1804(ra) # 8000e268 <_Unwind_Resume>
    8000497c:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004980:	00048513          	mv	a0,s1
    80004984:	ffffe097          	auipc	ra,0xffffe
    80004988:	6e4080e7          	jalr	1764(ra) # 80003068 <_ZdlPv>
    8000498c:	00090513          	mv	a0,s2
    80004990:	0000a097          	auipc	ra,0xa
    80004994:	8d8080e7          	jalr	-1832(ra) # 8000e268 <_Unwind_Resume>
    80004998:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    8000499c:	00048513          	mv	a0,s1
    800049a0:	ffffe097          	auipc	ra,0xffffe
    800049a4:	6c8080e7          	jalr	1736(ra) # 80003068 <_ZdlPv>
    800049a8:	00090513          	mv	a0,s2
    800049ac:	0000a097          	auipc	ra,0xa
    800049b0:	8bc080e7          	jalr	-1860(ra) # 8000e268 <_Unwind_Resume>
    800049b4:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800049b8:	00048513          	mv	a0,s1
    800049bc:	ffffe097          	auipc	ra,0xffffe
    800049c0:	6ac080e7          	jalr	1708(ra) # 80003068 <_ZdlPv>
    800049c4:	00090513          	mv	a0,s2
    800049c8:	0000a097          	auipc	ra,0xa
    800049cc:	8a0080e7          	jalr	-1888(ra) # 8000e268 <_Unwind_Resume>
	}
}
    800049d0:	03813083          	ld	ra,56(sp)
    800049d4:	03013403          	ld	s0,48(sp)
    800049d8:	02813483          	ld	s1,40(sp)
    800049dc:	02013903          	ld	s2,32(sp)
    800049e0:	04010113          	addi	sp,sp,64
    800049e4:	00008067          	ret

00000000800049e8 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800049e8:	ff010113          	addi	sp,sp,-16
    800049ec:	00113423          	sd	ra,8(sp)
    800049f0:	00813023          	sd	s0,0(sp)
    800049f4:	01010413          	addi	s0,sp,16
    800049f8:	00008797          	auipc	a5,0x8
    800049fc:	38878793          	addi	a5,a5,904 # 8000cd80 <_ZTV7WorkerA+0x10>
    80004a00:	00f53023          	sd	a5,0(a0)
    80004a04:	ffffe097          	auipc	ra,0xffffe
    80004a08:	534080e7          	jalr	1332(ra) # 80002f38 <_ZN6ThreadD1Ev>
    80004a0c:	00813083          	ld	ra,8(sp)
    80004a10:	00013403          	ld	s0,0(sp)
    80004a14:	01010113          	addi	sp,sp,16
    80004a18:	00008067          	ret

0000000080004a1c <_ZN7WorkerAD0Ev>:
    80004a1c:	fe010113          	addi	sp,sp,-32
    80004a20:	00113c23          	sd	ra,24(sp)
    80004a24:	00813823          	sd	s0,16(sp)
    80004a28:	00913423          	sd	s1,8(sp)
    80004a2c:	02010413          	addi	s0,sp,32
    80004a30:	00050493          	mv	s1,a0
    80004a34:	00008797          	auipc	a5,0x8
    80004a38:	34c78793          	addi	a5,a5,844 # 8000cd80 <_ZTV7WorkerA+0x10>
    80004a3c:	00f53023          	sd	a5,0(a0)
    80004a40:	ffffe097          	auipc	ra,0xffffe
    80004a44:	4f8080e7          	jalr	1272(ra) # 80002f38 <_ZN6ThreadD1Ev>
    80004a48:	00048513          	mv	a0,s1
    80004a4c:	ffffe097          	auipc	ra,0xffffe
    80004a50:	61c080e7          	jalr	1564(ra) # 80003068 <_ZdlPv>
    80004a54:	01813083          	ld	ra,24(sp)
    80004a58:	01013403          	ld	s0,16(sp)
    80004a5c:	00813483          	ld	s1,8(sp)
    80004a60:	02010113          	addi	sp,sp,32
    80004a64:	00008067          	ret

0000000080004a68 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80004a68:	ff010113          	addi	sp,sp,-16
    80004a6c:	00113423          	sd	ra,8(sp)
    80004a70:	00813023          	sd	s0,0(sp)
    80004a74:	01010413          	addi	s0,sp,16
    80004a78:	00008797          	auipc	a5,0x8
    80004a7c:	33078793          	addi	a5,a5,816 # 8000cda8 <_ZTV7WorkerB+0x10>
    80004a80:	00f53023          	sd	a5,0(a0)
    80004a84:	ffffe097          	auipc	ra,0xffffe
    80004a88:	4b4080e7          	jalr	1204(ra) # 80002f38 <_ZN6ThreadD1Ev>
    80004a8c:	00813083          	ld	ra,8(sp)
    80004a90:	00013403          	ld	s0,0(sp)
    80004a94:	01010113          	addi	sp,sp,16
    80004a98:	00008067          	ret

0000000080004a9c <_ZN7WorkerBD0Ev>:
    80004a9c:	fe010113          	addi	sp,sp,-32
    80004aa0:	00113c23          	sd	ra,24(sp)
    80004aa4:	00813823          	sd	s0,16(sp)
    80004aa8:	00913423          	sd	s1,8(sp)
    80004aac:	02010413          	addi	s0,sp,32
    80004ab0:	00050493          	mv	s1,a0
    80004ab4:	00008797          	auipc	a5,0x8
    80004ab8:	2f478793          	addi	a5,a5,756 # 8000cda8 <_ZTV7WorkerB+0x10>
    80004abc:	00f53023          	sd	a5,0(a0)
    80004ac0:	ffffe097          	auipc	ra,0xffffe
    80004ac4:	478080e7          	jalr	1144(ra) # 80002f38 <_ZN6ThreadD1Ev>
    80004ac8:	00048513          	mv	a0,s1
    80004acc:	ffffe097          	auipc	ra,0xffffe
    80004ad0:	59c080e7          	jalr	1436(ra) # 80003068 <_ZdlPv>
    80004ad4:	01813083          	ld	ra,24(sp)
    80004ad8:	01013403          	ld	s0,16(sp)
    80004adc:	00813483          	ld	s1,8(sp)
    80004ae0:	02010113          	addi	sp,sp,32
    80004ae4:	00008067          	ret

0000000080004ae8 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004ae8:	ff010113          	addi	sp,sp,-16
    80004aec:	00113423          	sd	ra,8(sp)
    80004af0:	00813023          	sd	s0,0(sp)
    80004af4:	01010413          	addi	s0,sp,16
    80004af8:	00008797          	auipc	a5,0x8
    80004afc:	2d878793          	addi	a5,a5,728 # 8000cdd0 <_ZTV7WorkerC+0x10>
    80004b00:	00f53023          	sd	a5,0(a0)
    80004b04:	ffffe097          	auipc	ra,0xffffe
    80004b08:	434080e7          	jalr	1076(ra) # 80002f38 <_ZN6ThreadD1Ev>
    80004b0c:	00813083          	ld	ra,8(sp)
    80004b10:	00013403          	ld	s0,0(sp)
    80004b14:	01010113          	addi	sp,sp,16
    80004b18:	00008067          	ret

0000000080004b1c <_ZN7WorkerCD0Ev>:
    80004b1c:	fe010113          	addi	sp,sp,-32
    80004b20:	00113c23          	sd	ra,24(sp)
    80004b24:	00813823          	sd	s0,16(sp)
    80004b28:	00913423          	sd	s1,8(sp)
    80004b2c:	02010413          	addi	s0,sp,32
    80004b30:	00050493          	mv	s1,a0
    80004b34:	00008797          	auipc	a5,0x8
    80004b38:	29c78793          	addi	a5,a5,668 # 8000cdd0 <_ZTV7WorkerC+0x10>
    80004b3c:	00f53023          	sd	a5,0(a0)
    80004b40:	ffffe097          	auipc	ra,0xffffe
    80004b44:	3f8080e7          	jalr	1016(ra) # 80002f38 <_ZN6ThreadD1Ev>
    80004b48:	00048513          	mv	a0,s1
    80004b4c:	ffffe097          	auipc	ra,0xffffe
    80004b50:	51c080e7          	jalr	1308(ra) # 80003068 <_ZdlPv>
    80004b54:	01813083          	ld	ra,24(sp)
    80004b58:	01013403          	ld	s0,16(sp)
    80004b5c:	00813483          	ld	s1,8(sp)
    80004b60:	02010113          	addi	sp,sp,32
    80004b64:	00008067          	ret

0000000080004b68 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004b68:	ff010113          	addi	sp,sp,-16
    80004b6c:	00113423          	sd	ra,8(sp)
    80004b70:	00813023          	sd	s0,0(sp)
    80004b74:	01010413          	addi	s0,sp,16
    80004b78:	00008797          	auipc	a5,0x8
    80004b7c:	28078793          	addi	a5,a5,640 # 8000cdf8 <_ZTV7WorkerD+0x10>
    80004b80:	00f53023          	sd	a5,0(a0)
    80004b84:	ffffe097          	auipc	ra,0xffffe
    80004b88:	3b4080e7          	jalr	948(ra) # 80002f38 <_ZN6ThreadD1Ev>
    80004b8c:	00813083          	ld	ra,8(sp)
    80004b90:	00013403          	ld	s0,0(sp)
    80004b94:	01010113          	addi	sp,sp,16
    80004b98:	00008067          	ret

0000000080004b9c <_ZN7WorkerDD0Ev>:
    80004b9c:	fe010113          	addi	sp,sp,-32
    80004ba0:	00113c23          	sd	ra,24(sp)
    80004ba4:	00813823          	sd	s0,16(sp)
    80004ba8:	00913423          	sd	s1,8(sp)
    80004bac:	02010413          	addi	s0,sp,32
    80004bb0:	00050493          	mv	s1,a0
    80004bb4:	00008797          	auipc	a5,0x8
    80004bb8:	24478793          	addi	a5,a5,580 # 8000cdf8 <_ZTV7WorkerD+0x10>
    80004bbc:	00f53023          	sd	a5,0(a0)
    80004bc0:	ffffe097          	auipc	ra,0xffffe
    80004bc4:	378080e7          	jalr	888(ra) # 80002f38 <_ZN6ThreadD1Ev>
    80004bc8:	00048513          	mv	a0,s1
    80004bcc:	ffffe097          	auipc	ra,0xffffe
    80004bd0:	49c080e7          	jalr	1180(ra) # 80003068 <_ZdlPv>
    80004bd4:	01813083          	ld	ra,24(sp)
    80004bd8:	01013403          	ld	s0,16(sp)
    80004bdc:	00813483          	ld	s1,8(sp)
    80004be0:	02010113          	addi	sp,sp,32
    80004be4:	00008067          	ret

0000000080004be8 <_ZN7WorkerA3runEv>:
    void run() override {
    80004be8:	ff010113          	addi	sp,sp,-16
    80004bec:	00113423          	sd	ra,8(sp)
    80004bf0:	00813023          	sd	s0,0(sp)
    80004bf4:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004bf8:	00000593          	li	a1,0
    80004bfc:	fffff097          	auipc	ra,0xfffff
    80004c00:	774080e7          	jalr	1908(ra) # 80004370 <_ZN7WorkerA11workerBodyAEPv>
    }
    80004c04:	00813083          	ld	ra,8(sp)
    80004c08:	00013403          	ld	s0,0(sp)
    80004c0c:	01010113          	addi	sp,sp,16
    80004c10:	00008067          	ret

0000000080004c14 <_ZN7WorkerB3runEv>:
    void run() override {
    80004c14:	ff010113          	addi	sp,sp,-16
    80004c18:	00113423          	sd	ra,8(sp)
    80004c1c:	00813023          	sd	s0,0(sp)
    80004c20:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004c24:	00000593          	li	a1,0
    80004c28:	00000097          	auipc	ra,0x0
    80004c2c:	814080e7          	jalr	-2028(ra) # 8000443c <_ZN7WorkerB11workerBodyBEPv>
    }
    80004c30:	00813083          	ld	ra,8(sp)
    80004c34:	00013403          	ld	s0,0(sp)
    80004c38:	01010113          	addi	sp,sp,16
    80004c3c:	00008067          	ret

0000000080004c40 <_ZN7WorkerC3runEv>:
    void run() override {
    80004c40:	ff010113          	addi	sp,sp,-16
    80004c44:	00113423          	sd	ra,8(sp)
    80004c48:	00813023          	sd	s0,0(sp)
    80004c4c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004c50:	00000593          	li	a1,0
    80004c54:	00000097          	auipc	ra,0x0
    80004c58:	8bc080e7          	jalr	-1860(ra) # 80004510 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004c5c:	00813083          	ld	ra,8(sp)
    80004c60:	00013403          	ld	s0,0(sp)
    80004c64:	01010113          	addi	sp,sp,16
    80004c68:	00008067          	ret

0000000080004c6c <_ZN7WorkerD3runEv>:
    void run() override {
    80004c6c:	ff010113          	addi	sp,sp,-16
    80004c70:	00113423          	sd	ra,8(sp)
    80004c74:	00813023          	sd	s0,0(sp)
    80004c78:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004c7c:	00000593          	li	a1,0
    80004c80:	00000097          	auipc	ra,0x0
    80004c84:	a10080e7          	jalr	-1520(ra) # 80004690 <_ZN7WorkerD11workerBodyDEPv>
    }
    80004c88:	00813083          	ld	ra,8(sp)
    80004c8c:	00013403          	ld	s0,0(sp)
    80004c90:	01010113          	addi	sp,sp,16
    80004c94:	00008067          	ret

0000000080004c98 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004c98:	f8010113          	addi	sp,sp,-128
    80004c9c:	06113c23          	sd	ra,120(sp)
    80004ca0:	06813823          	sd	s0,112(sp)
    80004ca4:	06913423          	sd	s1,104(sp)
    80004ca8:	07213023          	sd	s2,96(sp)
    80004cac:	05313c23          	sd	s3,88(sp)
    80004cb0:	05413823          	sd	s4,80(sp)
    80004cb4:	05513423          	sd	s5,72(sp)
    80004cb8:	05613023          	sd	s6,64(sp)
    80004cbc:	03713c23          	sd	s7,56(sp)
    80004cc0:	03813823          	sd	s8,48(sp)
    80004cc4:	03913423          	sd	s9,40(sp)
    80004cc8:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004ccc:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004cd0:	00005517          	auipc	a0,0x5
    80004cd4:	62050513          	addi	a0,a0,1568 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    80004cd8:	00001097          	auipc	ra,0x1
    80004cdc:	5a8080e7          	jalr	1448(ra) # 80006280 <_Z11printStringPKc>
    getString(input, 30);
    80004ce0:	01e00593          	li	a1,30
    80004ce4:	f8040493          	addi	s1,s0,-128
    80004ce8:	00048513          	mv	a0,s1
    80004cec:	00001097          	auipc	ra,0x1
    80004cf0:	61c080e7          	jalr	1564(ra) # 80006308 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004cf4:	00048513          	mv	a0,s1
    80004cf8:	00001097          	auipc	ra,0x1
    80004cfc:	6e8080e7          	jalr	1768(ra) # 800063e0 <_Z11stringToIntPKc>
    80004d00:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004d04:	00005517          	auipc	a0,0x5
    80004d08:	60c50513          	addi	a0,a0,1548 # 8000a310 <CONSOLE_STATUS+0x300>
    80004d0c:	00001097          	auipc	ra,0x1
    80004d10:	574080e7          	jalr	1396(ra) # 80006280 <_Z11printStringPKc>
    getString(input, 30);
    80004d14:	01e00593          	li	a1,30
    80004d18:	00048513          	mv	a0,s1
    80004d1c:	00001097          	auipc	ra,0x1
    80004d20:	5ec080e7          	jalr	1516(ra) # 80006308 <_Z9getStringPci>
    n = stringToInt(input);
    80004d24:	00048513          	mv	a0,s1
    80004d28:	00001097          	auipc	ra,0x1
    80004d2c:	6b8080e7          	jalr	1720(ra) # 800063e0 <_Z11stringToIntPKc>
    80004d30:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004d34:	00005517          	auipc	a0,0x5
    80004d38:	5fc50513          	addi	a0,a0,1532 # 8000a330 <CONSOLE_STATUS+0x320>
    80004d3c:	00001097          	auipc	ra,0x1
    80004d40:	544080e7          	jalr	1348(ra) # 80006280 <_Z11printStringPKc>
    printInt(threadNum);
    80004d44:	00000613          	li	a2,0
    80004d48:	00a00593          	li	a1,10
    80004d4c:	00098513          	mv	a0,s3
    80004d50:	00001097          	auipc	ra,0x1
    80004d54:	6e0080e7          	jalr	1760(ra) # 80006430 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004d58:	00005517          	auipc	a0,0x5
    80004d5c:	5f050513          	addi	a0,a0,1520 # 8000a348 <CONSOLE_STATUS+0x338>
    80004d60:	00001097          	auipc	ra,0x1
    80004d64:	520080e7          	jalr	1312(ra) # 80006280 <_Z11printStringPKc>
    printInt(n);
    80004d68:	00000613          	li	a2,0
    80004d6c:	00a00593          	li	a1,10
    80004d70:	00048513          	mv	a0,s1
    80004d74:	00001097          	auipc	ra,0x1
    80004d78:	6bc080e7          	jalr	1724(ra) # 80006430 <_Z8printIntiii>
    printString(".\n");
    80004d7c:	00005517          	auipc	a0,0x5
    80004d80:	5e450513          	addi	a0,a0,1508 # 8000a360 <CONSOLE_STATUS+0x350>
    80004d84:	00001097          	auipc	ra,0x1
    80004d88:	4fc080e7          	jalr	1276(ra) # 80006280 <_Z11printStringPKc>
    if (threadNum > n) {
    80004d8c:	0334c463          	blt	s1,s3,80004db4 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004d90:	03305c63          	blez	s3,80004dc8 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004d94:	03800513          	li	a0,56
    80004d98:	ffffe097          	auipc	ra,0xffffe
    80004d9c:	280080e7          	jalr	640(ra) # 80003018 <_Znwm>
    80004da0:	00050a93          	mv	s5,a0
    80004da4:	00048593          	mv	a1,s1
    80004da8:	00001097          	auipc	ra,0x1
    80004dac:	7a8080e7          	jalr	1960(ra) # 80006550 <_ZN9BufferCPPC1Ei>
    80004db0:	0300006f          	j	80004de0 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004db4:	00005517          	auipc	a0,0x5
    80004db8:	5b450513          	addi	a0,a0,1460 # 8000a368 <CONSOLE_STATUS+0x358>
    80004dbc:	00001097          	auipc	ra,0x1
    80004dc0:	4c4080e7          	jalr	1220(ra) # 80006280 <_Z11printStringPKc>
        return;
    80004dc4:	0140006f          	j	80004dd8 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004dc8:	00005517          	auipc	a0,0x5
    80004dcc:	5e050513          	addi	a0,a0,1504 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80004dd0:	00001097          	auipc	ra,0x1
    80004dd4:	4b0080e7          	jalr	1200(ra) # 80006280 <_Z11printStringPKc>
        return;
    80004dd8:	000c0113          	mv	sp,s8
    80004ddc:	2140006f          	j	80004ff0 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004de0:	01000513          	li	a0,16
    80004de4:	ffffe097          	auipc	ra,0xffffe
    80004de8:	234080e7          	jalr	564(ra) # 80003018 <_Znwm>
    80004dec:	00050913          	mv	s2,a0
    80004df0:	00000593          	li	a1,0
    80004df4:	ffffe097          	auipc	ra,0xffffe
    80004df8:	588080e7          	jalr	1416(ra) # 8000337c <_ZN9SemaphoreC1Ej>
    80004dfc:	00008797          	auipc	a5,0x8
    80004e00:	3527ba23          	sd	s2,852(a5) # 8000d150 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004e04:	00399793          	slli	a5,s3,0x3
    80004e08:	00f78793          	addi	a5,a5,15
    80004e0c:	ff07f793          	andi	a5,a5,-16
    80004e10:	40f10133          	sub	sp,sp,a5
    80004e14:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004e18:	0019871b          	addiw	a4,s3,1
    80004e1c:	00171793          	slli	a5,a4,0x1
    80004e20:	00e787b3          	add	a5,a5,a4
    80004e24:	00379793          	slli	a5,a5,0x3
    80004e28:	00f78793          	addi	a5,a5,15
    80004e2c:	ff07f793          	andi	a5,a5,-16
    80004e30:	40f10133          	sub	sp,sp,a5
    80004e34:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004e38:	00199493          	slli	s1,s3,0x1
    80004e3c:	013484b3          	add	s1,s1,s3
    80004e40:	00349493          	slli	s1,s1,0x3
    80004e44:	009b04b3          	add	s1,s6,s1
    80004e48:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004e4c:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004e50:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004e54:	02800513          	li	a0,40
    80004e58:	ffffe097          	auipc	ra,0xffffe
    80004e5c:	1c0080e7          	jalr	448(ra) # 80003018 <_Znwm>
    80004e60:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004e64:	ffffe097          	auipc	ra,0xffffe
    80004e68:	49c080e7          	jalr	1180(ra) # 80003300 <_ZN6ThreadC1Ev>
    80004e6c:	00008797          	auipc	a5,0x8
    80004e70:	00478793          	addi	a5,a5,4 # 8000ce70 <_ZTV8Consumer+0x10>
    80004e74:	00fbb023          	sd	a5,0(s7)
    80004e78:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004e7c:	000b8513          	mv	a0,s7
    80004e80:	ffffe097          	auipc	ra,0xffffe
    80004e84:	350080e7          	jalr	848(ra) # 800031d0 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004e88:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004e8c:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004e90:	00008797          	auipc	a5,0x8
    80004e94:	2c07b783          	ld	a5,704(a5) # 8000d150 <_ZL10waitForAll>
    80004e98:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004e9c:	02800513          	li	a0,40
    80004ea0:	ffffe097          	auipc	ra,0xffffe
    80004ea4:	178080e7          	jalr	376(ra) # 80003018 <_Znwm>
    80004ea8:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004eac:	ffffe097          	auipc	ra,0xffffe
    80004eb0:	454080e7          	jalr	1108(ra) # 80003300 <_ZN6ThreadC1Ev>
    80004eb4:	00008797          	auipc	a5,0x8
    80004eb8:	f6c78793          	addi	a5,a5,-148 # 8000ce20 <_ZTV16ProducerKeyborad+0x10>
    80004ebc:	00f4b023          	sd	a5,0(s1)
    80004ec0:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004ec4:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004ec8:	00048513          	mv	a0,s1
    80004ecc:	ffffe097          	auipc	ra,0xffffe
    80004ed0:	304080e7          	jalr	772(ra) # 800031d0 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004ed4:	00100913          	li	s2,1
    80004ed8:	0300006f          	j	80004f08 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004edc:	00008797          	auipc	a5,0x8
    80004ee0:	f6c78793          	addi	a5,a5,-148 # 8000ce48 <_ZTV8Producer+0x10>
    80004ee4:	00fcb023          	sd	a5,0(s9)
    80004ee8:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004eec:	00391793          	slli	a5,s2,0x3
    80004ef0:	00fa07b3          	add	a5,s4,a5
    80004ef4:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004ef8:	000c8513          	mv	a0,s9
    80004efc:	ffffe097          	auipc	ra,0xffffe
    80004f00:	2d4080e7          	jalr	724(ra) # 800031d0 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004f04:	0019091b          	addiw	s2,s2,1
    80004f08:	05395263          	bge	s2,s3,80004f4c <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004f0c:	00191493          	slli	s1,s2,0x1
    80004f10:	012484b3          	add	s1,s1,s2
    80004f14:	00349493          	slli	s1,s1,0x3
    80004f18:	009b04b3          	add	s1,s6,s1
    80004f1c:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004f20:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004f24:	00008797          	auipc	a5,0x8
    80004f28:	22c7b783          	ld	a5,556(a5) # 8000d150 <_ZL10waitForAll>
    80004f2c:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004f30:	02800513          	li	a0,40
    80004f34:	ffffe097          	auipc	ra,0xffffe
    80004f38:	0e4080e7          	jalr	228(ra) # 80003018 <_Znwm>
    80004f3c:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004f40:	ffffe097          	auipc	ra,0xffffe
    80004f44:	3c0080e7          	jalr	960(ra) # 80003300 <_ZN6ThreadC1Ev>
    80004f48:	f95ff06f          	j	80004edc <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004f4c:	ffffe097          	auipc	ra,0xffffe
    80004f50:	2f8080e7          	jalr	760(ra) # 80003244 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004f54:	00000493          	li	s1,0
    80004f58:	0099ce63          	blt	s3,s1,80004f74 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004f5c:	00008517          	auipc	a0,0x8
    80004f60:	1f453503          	ld	a0,500(a0) # 8000d150 <_ZL10waitForAll>
    80004f64:	ffffe097          	auipc	ra,0xffffe
    80004f68:	450080e7          	jalr	1104(ra) # 800033b4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004f6c:	0014849b          	addiw	s1,s1,1
    80004f70:	fe9ff06f          	j	80004f58 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004f74:	00008517          	auipc	a0,0x8
    80004f78:	1dc53503          	ld	a0,476(a0) # 8000d150 <_ZL10waitForAll>
    80004f7c:	00050863          	beqz	a0,80004f8c <_Z20testConsumerProducerv+0x2f4>
    80004f80:	00053783          	ld	a5,0(a0)
    80004f84:	0087b783          	ld	a5,8(a5)
    80004f88:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004f8c:	00000493          	li	s1,0
    80004f90:	0080006f          	j	80004f98 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004f94:	0014849b          	addiw	s1,s1,1
    80004f98:	0334d263          	bge	s1,s3,80004fbc <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004f9c:	00349793          	slli	a5,s1,0x3
    80004fa0:	00fa07b3          	add	a5,s4,a5
    80004fa4:	0007b503          	ld	a0,0(a5)
    80004fa8:	fe0506e3          	beqz	a0,80004f94 <_Z20testConsumerProducerv+0x2fc>
    80004fac:	00053783          	ld	a5,0(a0)
    80004fb0:	0087b783          	ld	a5,8(a5)
    80004fb4:	000780e7          	jalr	a5
    80004fb8:	fddff06f          	j	80004f94 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004fbc:	000b8a63          	beqz	s7,80004fd0 <_Z20testConsumerProducerv+0x338>
    80004fc0:	000bb783          	ld	a5,0(s7)
    80004fc4:	0087b783          	ld	a5,8(a5)
    80004fc8:	000b8513          	mv	a0,s7
    80004fcc:	000780e7          	jalr	a5
    delete buffer;
    80004fd0:	000a8e63          	beqz	s5,80004fec <_Z20testConsumerProducerv+0x354>
    80004fd4:	000a8513          	mv	a0,s5
    80004fd8:	00002097          	auipc	ra,0x2
    80004fdc:	870080e7          	jalr	-1936(ra) # 80006848 <_ZN9BufferCPPD1Ev>
    80004fe0:	000a8513          	mv	a0,s5
    80004fe4:	ffffe097          	auipc	ra,0xffffe
    80004fe8:	084080e7          	jalr	132(ra) # 80003068 <_ZdlPv>
    80004fec:	000c0113          	mv	sp,s8
}
    80004ff0:	f8040113          	addi	sp,s0,-128
    80004ff4:	07813083          	ld	ra,120(sp)
    80004ff8:	07013403          	ld	s0,112(sp)
    80004ffc:	06813483          	ld	s1,104(sp)
    80005000:	06013903          	ld	s2,96(sp)
    80005004:	05813983          	ld	s3,88(sp)
    80005008:	05013a03          	ld	s4,80(sp)
    8000500c:	04813a83          	ld	s5,72(sp)
    80005010:	04013b03          	ld	s6,64(sp)
    80005014:	03813b83          	ld	s7,56(sp)
    80005018:	03013c03          	ld	s8,48(sp)
    8000501c:	02813c83          	ld	s9,40(sp)
    80005020:	08010113          	addi	sp,sp,128
    80005024:	00008067          	ret
    80005028:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000502c:	000a8513          	mv	a0,s5
    80005030:	ffffe097          	auipc	ra,0xffffe
    80005034:	038080e7          	jalr	56(ra) # 80003068 <_ZdlPv>
    80005038:	00048513          	mv	a0,s1
    8000503c:	00009097          	auipc	ra,0x9
    80005040:	22c080e7          	jalr	556(ra) # 8000e268 <_Unwind_Resume>
    80005044:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80005048:	00090513          	mv	a0,s2
    8000504c:	ffffe097          	auipc	ra,0xffffe
    80005050:	01c080e7          	jalr	28(ra) # 80003068 <_ZdlPv>
    80005054:	00048513          	mv	a0,s1
    80005058:	00009097          	auipc	ra,0x9
    8000505c:	210080e7          	jalr	528(ra) # 8000e268 <_Unwind_Resume>
    80005060:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80005064:	000b8513          	mv	a0,s7
    80005068:	ffffe097          	auipc	ra,0xffffe
    8000506c:	000080e7          	jalr	ra # 80003068 <_ZdlPv>
    80005070:	00048513          	mv	a0,s1
    80005074:	00009097          	auipc	ra,0x9
    80005078:	1f4080e7          	jalr	500(ra) # 8000e268 <_Unwind_Resume>
    8000507c:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80005080:	00048513          	mv	a0,s1
    80005084:	ffffe097          	auipc	ra,0xffffe
    80005088:	fe4080e7          	jalr	-28(ra) # 80003068 <_ZdlPv>
    8000508c:	00090513          	mv	a0,s2
    80005090:	00009097          	auipc	ra,0x9
    80005094:	1d8080e7          	jalr	472(ra) # 8000e268 <_Unwind_Resume>
    80005098:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    8000509c:	000c8513          	mv	a0,s9
    800050a0:	ffffe097          	auipc	ra,0xffffe
    800050a4:	fc8080e7          	jalr	-56(ra) # 80003068 <_ZdlPv>
    800050a8:	00048513          	mv	a0,s1
    800050ac:	00009097          	auipc	ra,0x9
    800050b0:	1bc080e7          	jalr	444(ra) # 8000e268 <_Unwind_Resume>

00000000800050b4 <_ZN8Consumer3runEv>:
    void run() override {
    800050b4:	fd010113          	addi	sp,sp,-48
    800050b8:	02113423          	sd	ra,40(sp)
    800050bc:	02813023          	sd	s0,32(sp)
    800050c0:	00913c23          	sd	s1,24(sp)
    800050c4:	01213823          	sd	s2,16(sp)
    800050c8:	01313423          	sd	s3,8(sp)
    800050cc:	03010413          	addi	s0,sp,48
    800050d0:	00050913          	mv	s2,a0
        int i = 0;
    800050d4:	00000993          	li	s3,0
    800050d8:	0100006f          	j	800050e8 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800050dc:	00a00513          	li	a0,10
    800050e0:	ffffe097          	auipc	ra,0xffffe
    800050e4:	3c4080e7          	jalr	964(ra) # 800034a4 <_ZN7Console4putcEc>
        while (!threadEnd) {
    800050e8:	00008797          	auipc	a5,0x8
    800050ec:	0607a783          	lw	a5,96(a5) # 8000d148 <_ZL9threadEnd>
    800050f0:	04079a63          	bnez	a5,80005144 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    800050f4:	02093783          	ld	a5,32(s2)
    800050f8:	0087b503          	ld	a0,8(a5)
    800050fc:	00001097          	auipc	ra,0x1
    80005100:	638080e7          	jalr	1592(ra) # 80006734 <_ZN9BufferCPP3getEv>
            i++;
    80005104:	0019849b          	addiw	s1,s3,1
    80005108:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    8000510c:	0ff57513          	andi	a0,a0,255
    80005110:	ffffe097          	auipc	ra,0xffffe
    80005114:	394080e7          	jalr	916(ra) # 800034a4 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80005118:	05000793          	li	a5,80
    8000511c:	02f4e4bb          	remw	s1,s1,a5
    80005120:	fc0494e3          	bnez	s1,800050e8 <_ZN8Consumer3runEv+0x34>
    80005124:	fb9ff06f          	j	800050dc <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80005128:	02093783          	ld	a5,32(s2)
    8000512c:	0087b503          	ld	a0,8(a5)
    80005130:	00001097          	auipc	ra,0x1
    80005134:	604080e7          	jalr	1540(ra) # 80006734 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80005138:	0ff57513          	andi	a0,a0,255
    8000513c:	ffffe097          	auipc	ra,0xffffe
    80005140:	368080e7          	jalr	872(ra) # 800034a4 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80005144:	02093783          	ld	a5,32(s2)
    80005148:	0087b503          	ld	a0,8(a5)
    8000514c:	00001097          	auipc	ra,0x1
    80005150:	674080e7          	jalr	1652(ra) # 800067c0 <_ZN9BufferCPP6getCntEv>
    80005154:	fca04ae3          	bgtz	a0,80005128 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80005158:	02093783          	ld	a5,32(s2)
    8000515c:	0107b503          	ld	a0,16(a5)
    80005160:	ffffe097          	auipc	ra,0xffffe
    80005164:	280080e7          	jalr	640(ra) # 800033e0 <_ZN9Semaphore6signalEv>
    }
    80005168:	02813083          	ld	ra,40(sp)
    8000516c:	02013403          	ld	s0,32(sp)
    80005170:	01813483          	ld	s1,24(sp)
    80005174:	01013903          	ld	s2,16(sp)
    80005178:	00813983          	ld	s3,8(sp)
    8000517c:	03010113          	addi	sp,sp,48
    80005180:	00008067          	ret

0000000080005184 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80005184:	ff010113          	addi	sp,sp,-16
    80005188:	00113423          	sd	ra,8(sp)
    8000518c:	00813023          	sd	s0,0(sp)
    80005190:	01010413          	addi	s0,sp,16
    80005194:	00008797          	auipc	a5,0x8
    80005198:	cdc78793          	addi	a5,a5,-804 # 8000ce70 <_ZTV8Consumer+0x10>
    8000519c:	00f53023          	sd	a5,0(a0)
    800051a0:	ffffe097          	auipc	ra,0xffffe
    800051a4:	d98080e7          	jalr	-616(ra) # 80002f38 <_ZN6ThreadD1Ev>
    800051a8:	00813083          	ld	ra,8(sp)
    800051ac:	00013403          	ld	s0,0(sp)
    800051b0:	01010113          	addi	sp,sp,16
    800051b4:	00008067          	ret

00000000800051b8 <_ZN8ConsumerD0Ev>:
    800051b8:	fe010113          	addi	sp,sp,-32
    800051bc:	00113c23          	sd	ra,24(sp)
    800051c0:	00813823          	sd	s0,16(sp)
    800051c4:	00913423          	sd	s1,8(sp)
    800051c8:	02010413          	addi	s0,sp,32
    800051cc:	00050493          	mv	s1,a0
    800051d0:	00008797          	auipc	a5,0x8
    800051d4:	ca078793          	addi	a5,a5,-864 # 8000ce70 <_ZTV8Consumer+0x10>
    800051d8:	00f53023          	sd	a5,0(a0)
    800051dc:	ffffe097          	auipc	ra,0xffffe
    800051e0:	d5c080e7          	jalr	-676(ra) # 80002f38 <_ZN6ThreadD1Ev>
    800051e4:	00048513          	mv	a0,s1
    800051e8:	ffffe097          	auipc	ra,0xffffe
    800051ec:	e80080e7          	jalr	-384(ra) # 80003068 <_ZdlPv>
    800051f0:	01813083          	ld	ra,24(sp)
    800051f4:	01013403          	ld	s0,16(sp)
    800051f8:	00813483          	ld	s1,8(sp)
    800051fc:	02010113          	addi	sp,sp,32
    80005200:	00008067          	ret

0000000080005204 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80005204:	ff010113          	addi	sp,sp,-16
    80005208:	00113423          	sd	ra,8(sp)
    8000520c:	00813023          	sd	s0,0(sp)
    80005210:	01010413          	addi	s0,sp,16
    80005214:	00008797          	auipc	a5,0x8
    80005218:	c0c78793          	addi	a5,a5,-1012 # 8000ce20 <_ZTV16ProducerKeyborad+0x10>
    8000521c:	00f53023          	sd	a5,0(a0)
    80005220:	ffffe097          	auipc	ra,0xffffe
    80005224:	d18080e7          	jalr	-744(ra) # 80002f38 <_ZN6ThreadD1Ev>
    80005228:	00813083          	ld	ra,8(sp)
    8000522c:	00013403          	ld	s0,0(sp)
    80005230:	01010113          	addi	sp,sp,16
    80005234:	00008067          	ret

0000000080005238 <_ZN16ProducerKeyboradD0Ev>:
    80005238:	fe010113          	addi	sp,sp,-32
    8000523c:	00113c23          	sd	ra,24(sp)
    80005240:	00813823          	sd	s0,16(sp)
    80005244:	00913423          	sd	s1,8(sp)
    80005248:	02010413          	addi	s0,sp,32
    8000524c:	00050493          	mv	s1,a0
    80005250:	00008797          	auipc	a5,0x8
    80005254:	bd078793          	addi	a5,a5,-1072 # 8000ce20 <_ZTV16ProducerKeyborad+0x10>
    80005258:	00f53023          	sd	a5,0(a0)
    8000525c:	ffffe097          	auipc	ra,0xffffe
    80005260:	cdc080e7          	jalr	-804(ra) # 80002f38 <_ZN6ThreadD1Ev>
    80005264:	00048513          	mv	a0,s1
    80005268:	ffffe097          	auipc	ra,0xffffe
    8000526c:	e00080e7          	jalr	-512(ra) # 80003068 <_ZdlPv>
    80005270:	01813083          	ld	ra,24(sp)
    80005274:	01013403          	ld	s0,16(sp)
    80005278:	00813483          	ld	s1,8(sp)
    8000527c:	02010113          	addi	sp,sp,32
    80005280:	00008067          	ret

0000000080005284 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80005284:	ff010113          	addi	sp,sp,-16
    80005288:	00113423          	sd	ra,8(sp)
    8000528c:	00813023          	sd	s0,0(sp)
    80005290:	01010413          	addi	s0,sp,16
    80005294:	00008797          	auipc	a5,0x8
    80005298:	bb478793          	addi	a5,a5,-1100 # 8000ce48 <_ZTV8Producer+0x10>
    8000529c:	00f53023          	sd	a5,0(a0)
    800052a0:	ffffe097          	auipc	ra,0xffffe
    800052a4:	c98080e7          	jalr	-872(ra) # 80002f38 <_ZN6ThreadD1Ev>
    800052a8:	00813083          	ld	ra,8(sp)
    800052ac:	00013403          	ld	s0,0(sp)
    800052b0:	01010113          	addi	sp,sp,16
    800052b4:	00008067          	ret

00000000800052b8 <_ZN8ProducerD0Ev>:
    800052b8:	fe010113          	addi	sp,sp,-32
    800052bc:	00113c23          	sd	ra,24(sp)
    800052c0:	00813823          	sd	s0,16(sp)
    800052c4:	00913423          	sd	s1,8(sp)
    800052c8:	02010413          	addi	s0,sp,32
    800052cc:	00050493          	mv	s1,a0
    800052d0:	00008797          	auipc	a5,0x8
    800052d4:	b7878793          	addi	a5,a5,-1160 # 8000ce48 <_ZTV8Producer+0x10>
    800052d8:	00f53023          	sd	a5,0(a0)
    800052dc:	ffffe097          	auipc	ra,0xffffe
    800052e0:	c5c080e7          	jalr	-932(ra) # 80002f38 <_ZN6ThreadD1Ev>
    800052e4:	00048513          	mv	a0,s1
    800052e8:	ffffe097          	auipc	ra,0xffffe
    800052ec:	d80080e7          	jalr	-640(ra) # 80003068 <_ZdlPv>
    800052f0:	01813083          	ld	ra,24(sp)
    800052f4:	01013403          	ld	s0,16(sp)
    800052f8:	00813483          	ld	s1,8(sp)
    800052fc:	02010113          	addi	sp,sp,32
    80005300:	00008067          	ret

0000000080005304 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80005304:	fe010113          	addi	sp,sp,-32
    80005308:	00113c23          	sd	ra,24(sp)
    8000530c:	00813823          	sd	s0,16(sp)
    80005310:	00913423          	sd	s1,8(sp)
    80005314:	02010413          	addi	s0,sp,32
    80005318:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    8000531c:	ffffc097          	auipc	ra,0xffffc
    80005320:	2e4080e7          	jalr	740(ra) # 80001600 <_Z4getcv>
    80005324:	0005059b          	sext.w	a1,a0
    80005328:	01b00793          	li	a5,27
    8000532c:	00f58c63          	beq	a1,a5,80005344 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80005330:	0204b783          	ld	a5,32(s1)
    80005334:	0087b503          	ld	a0,8(a5)
    80005338:	00001097          	auipc	ra,0x1
    8000533c:	36c080e7          	jalr	876(ra) # 800066a4 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80005340:	fddff06f          	j	8000531c <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80005344:	00100793          	li	a5,1
    80005348:	00008717          	auipc	a4,0x8
    8000534c:	e0f72023          	sw	a5,-512(a4) # 8000d148 <_ZL9threadEnd>
        td->buffer->put('!');
    80005350:	0204b783          	ld	a5,32(s1)
    80005354:	02100593          	li	a1,33
    80005358:	0087b503          	ld	a0,8(a5)
    8000535c:	00001097          	auipc	ra,0x1
    80005360:	348080e7          	jalr	840(ra) # 800066a4 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80005364:	0204b783          	ld	a5,32(s1)
    80005368:	0107b503          	ld	a0,16(a5)
    8000536c:	ffffe097          	auipc	ra,0xffffe
    80005370:	074080e7          	jalr	116(ra) # 800033e0 <_ZN9Semaphore6signalEv>
    }
    80005374:	01813083          	ld	ra,24(sp)
    80005378:	01013403          	ld	s0,16(sp)
    8000537c:	00813483          	ld	s1,8(sp)
    80005380:	02010113          	addi	sp,sp,32
    80005384:	00008067          	ret

0000000080005388 <_ZN8Producer3runEv>:
    void run() override {
    80005388:	fe010113          	addi	sp,sp,-32
    8000538c:	00113c23          	sd	ra,24(sp)
    80005390:	00813823          	sd	s0,16(sp)
    80005394:	00913423          	sd	s1,8(sp)
    80005398:	01213023          	sd	s2,0(sp)
    8000539c:	02010413          	addi	s0,sp,32
    800053a0:	00050493          	mv	s1,a0
        int i = 0;
    800053a4:	00000913          	li	s2,0
        while (!threadEnd) {
    800053a8:	00008797          	auipc	a5,0x8
    800053ac:	da07a783          	lw	a5,-608(a5) # 8000d148 <_ZL9threadEnd>
    800053b0:	04079263          	bnez	a5,800053f4 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    800053b4:	0204b783          	ld	a5,32(s1)
    800053b8:	0007a583          	lw	a1,0(a5)
    800053bc:	0305859b          	addiw	a1,a1,48
    800053c0:	0087b503          	ld	a0,8(a5)
    800053c4:	00001097          	auipc	ra,0x1
    800053c8:	2e0080e7          	jalr	736(ra) # 800066a4 <_ZN9BufferCPP3putEi>
            i++;
    800053cc:	0019071b          	addiw	a4,s2,1
    800053d0:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    800053d4:	0204b783          	ld	a5,32(s1)
    800053d8:	0007a783          	lw	a5,0(a5)
    800053dc:	00e787bb          	addw	a5,a5,a4
    800053e0:	00500513          	li	a0,5
    800053e4:	02a7e53b          	remw	a0,a5,a0
    800053e8:	ffffe097          	auipc	ra,0xffffe
    800053ec:	e84080e7          	jalr	-380(ra) # 8000326c <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    800053f0:	fb9ff06f          	j	800053a8 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    800053f4:	0204b783          	ld	a5,32(s1)
    800053f8:	0107b503          	ld	a0,16(a5)
    800053fc:	ffffe097          	auipc	ra,0xffffe
    80005400:	fe4080e7          	jalr	-28(ra) # 800033e0 <_ZN9Semaphore6signalEv>
    }
    80005404:	01813083          	ld	ra,24(sp)
    80005408:	01013403          	ld	s0,16(sp)
    8000540c:	00813483          	ld	s1,8(sp)
    80005410:	00013903          	ld	s2,0(sp)
    80005414:	02010113          	addi	sp,sp,32
    80005418:	00008067          	ret

000000008000541c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000541c:	fe010113          	addi	sp,sp,-32
    80005420:	00113c23          	sd	ra,24(sp)
    80005424:	00813823          	sd	s0,16(sp)
    80005428:	00913423          	sd	s1,8(sp)
    8000542c:	01213023          	sd	s2,0(sp)
    80005430:	02010413          	addi	s0,sp,32
    80005434:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005438:	00100793          	li	a5,1
    8000543c:	02a7f863          	bgeu	a5,a0,8000546c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005440:	00a00793          	li	a5,10
    80005444:	02f577b3          	remu	a5,a0,a5
    80005448:	02078e63          	beqz	a5,80005484 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000544c:	fff48513          	addi	a0,s1,-1
    80005450:	00000097          	auipc	ra,0x0
    80005454:	fcc080e7          	jalr	-52(ra) # 8000541c <_ZL9fibonaccim>
    80005458:	00050913          	mv	s2,a0
    8000545c:	ffe48513          	addi	a0,s1,-2
    80005460:	00000097          	auipc	ra,0x0
    80005464:	fbc080e7          	jalr	-68(ra) # 8000541c <_ZL9fibonaccim>
    80005468:	00a90533          	add	a0,s2,a0
}
    8000546c:	01813083          	ld	ra,24(sp)
    80005470:	01013403          	ld	s0,16(sp)
    80005474:	00813483          	ld	s1,8(sp)
    80005478:	00013903          	ld	s2,0(sp)
    8000547c:	02010113          	addi	sp,sp,32
    80005480:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005484:	ffffc097          	auipc	ra,0xffffc
    80005488:	03c080e7          	jalr	60(ra) # 800014c0 <_Z15thread_dispatchv>
    8000548c:	fc1ff06f          	j	8000544c <_ZL9fibonaccim+0x30>

0000000080005490 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005490:	fe010113          	addi	sp,sp,-32
    80005494:	00113c23          	sd	ra,24(sp)
    80005498:	00813823          	sd	s0,16(sp)
    8000549c:	00913423          	sd	s1,8(sp)
    800054a0:	01213023          	sd	s2,0(sp)
    800054a4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800054a8:	00a00493          	li	s1,10
    800054ac:	0400006f          	j	800054ec <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800054b0:	00005517          	auipc	a0,0x5
    800054b4:	f9850513          	addi	a0,a0,-104 # 8000a448 <CONSOLE_STATUS+0x438>
    800054b8:	00001097          	auipc	ra,0x1
    800054bc:	dc8080e7          	jalr	-568(ra) # 80006280 <_Z11printStringPKc>
    800054c0:	00000613          	li	a2,0
    800054c4:	00a00593          	li	a1,10
    800054c8:	00048513          	mv	a0,s1
    800054cc:	00001097          	auipc	ra,0x1
    800054d0:	f64080e7          	jalr	-156(ra) # 80006430 <_Z8printIntiii>
    800054d4:	00005517          	auipc	a0,0x5
    800054d8:	16450513          	addi	a0,a0,356 # 8000a638 <CONSOLE_STATUS+0x628>
    800054dc:	00001097          	auipc	ra,0x1
    800054e0:	da4080e7          	jalr	-604(ra) # 80006280 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800054e4:	0014849b          	addiw	s1,s1,1
    800054e8:	0ff4f493          	andi	s1,s1,255
    800054ec:	00c00793          	li	a5,12
    800054f0:	fc97f0e3          	bgeu	a5,s1,800054b0 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800054f4:	00005517          	auipc	a0,0x5
    800054f8:	f5c50513          	addi	a0,a0,-164 # 8000a450 <CONSOLE_STATUS+0x440>
    800054fc:	00001097          	auipc	ra,0x1
    80005500:	d84080e7          	jalr	-636(ra) # 80006280 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005504:	00500313          	li	t1,5
    thread_dispatch();
    80005508:	ffffc097          	auipc	ra,0xffffc
    8000550c:	fb8080e7          	jalr	-72(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005510:	01000513          	li	a0,16
    80005514:	00000097          	auipc	ra,0x0
    80005518:	f08080e7          	jalr	-248(ra) # 8000541c <_ZL9fibonaccim>
    8000551c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005520:	00005517          	auipc	a0,0x5
    80005524:	f4050513          	addi	a0,a0,-192 # 8000a460 <CONSOLE_STATUS+0x450>
    80005528:	00001097          	auipc	ra,0x1
    8000552c:	d58080e7          	jalr	-680(ra) # 80006280 <_Z11printStringPKc>
    80005530:	00000613          	li	a2,0
    80005534:	00a00593          	li	a1,10
    80005538:	0009051b          	sext.w	a0,s2
    8000553c:	00001097          	auipc	ra,0x1
    80005540:	ef4080e7          	jalr	-268(ra) # 80006430 <_Z8printIntiii>
    80005544:	00005517          	auipc	a0,0x5
    80005548:	0f450513          	addi	a0,a0,244 # 8000a638 <CONSOLE_STATUS+0x628>
    8000554c:	00001097          	auipc	ra,0x1
    80005550:	d34080e7          	jalr	-716(ra) # 80006280 <_Z11printStringPKc>
    80005554:	0400006f          	j	80005594 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005558:	00005517          	auipc	a0,0x5
    8000555c:	ef050513          	addi	a0,a0,-272 # 8000a448 <CONSOLE_STATUS+0x438>
    80005560:	00001097          	auipc	ra,0x1
    80005564:	d20080e7          	jalr	-736(ra) # 80006280 <_Z11printStringPKc>
    80005568:	00000613          	li	a2,0
    8000556c:	00a00593          	li	a1,10
    80005570:	00048513          	mv	a0,s1
    80005574:	00001097          	auipc	ra,0x1
    80005578:	ebc080e7          	jalr	-324(ra) # 80006430 <_Z8printIntiii>
    8000557c:	00005517          	auipc	a0,0x5
    80005580:	0bc50513          	addi	a0,a0,188 # 8000a638 <CONSOLE_STATUS+0x628>
    80005584:	00001097          	auipc	ra,0x1
    80005588:	cfc080e7          	jalr	-772(ra) # 80006280 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000558c:	0014849b          	addiw	s1,s1,1
    80005590:	0ff4f493          	andi	s1,s1,255
    80005594:	00f00793          	li	a5,15
    80005598:	fc97f0e3          	bgeu	a5,s1,80005558 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000559c:	00005517          	auipc	a0,0x5
    800055a0:	ed450513          	addi	a0,a0,-300 # 8000a470 <CONSOLE_STATUS+0x460>
    800055a4:	00001097          	auipc	ra,0x1
    800055a8:	cdc080e7          	jalr	-804(ra) # 80006280 <_Z11printStringPKc>
    finishedD = true;
    800055ac:	00100793          	li	a5,1
    800055b0:	00008717          	auipc	a4,0x8
    800055b4:	baf70423          	sb	a5,-1112(a4) # 8000d158 <_ZL9finishedD>
    thread_dispatch();
    800055b8:	ffffc097          	auipc	ra,0xffffc
    800055bc:	f08080e7          	jalr	-248(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800055c0:	01813083          	ld	ra,24(sp)
    800055c4:	01013403          	ld	s0,16(sp)
    800055c8:	00813483          	ld	s1,8(sp)
    800055cc:	00013903          	ld	s2,0(sp)
    800055d0:	02010113          	addi	sp,sp,32
    800055d4:	00008067          	ret

00000000800055d8 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800055d8:	fe010113          	addi	sp,sp,-32
    800055dc:	00113c23          	sd	ra,24(sp)
    800055e0:	00813823          	sd	s0,16(sp)
    800055e4:	00913423          	sd	s1,8(sp)
    800055e8:	01213023          	sd	s2,0(sp)
    800055ec:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800055f0:	00000493          	li	s1,0
    800055f4:	0400006f          	j	80005634 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800055f8:	00005517          	auipc	a0,0x5
    800055fc:	e1050513          	addi	a0,a0,-496 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80005600:	00001097          	auipc	ra,0x1
    80005604:	c80080e7          	jalr	-896(ra) # 80006280 <_Z11printStringPKc>
    80005608:	00000613          	li	a2,0
    8000560c:	00a00593          	li	a1,10
    80005610:	00048513          	mv	a0,s1
    80005614:	00001097          	auipc	ra,0x1
    80005618:	e1c080e7          	jalr	-484(ra) # 80006430 <_Z8printIntiii>
    8000561c:	00005517          	auipc	a0,0x5
    80005620:	01c50513          	addi	a0,a0,28 # 8000a638 <CONSOLE_STATUS+0x628>
    80005624:	00001097          	auipc	ra,0x1
    80005628:	c5c080e7          	jalr	-932(ra) # 80006280 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000562c:	0014849b          	addiw	s1,s1,1
    80005630:	0ff4f493          	andi	s1,s1,255
    80005634:	00200793          	li	a5,2
    80005638:	fc97f0e3          	bgeu	a5,s1,800055f8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    8000563c:	00005517          	auipc	a0,0x5
    80005640:	dd450513          	addi	a0,a0,-556 # 8000a410 <CONSOLE_STATUS+0x400>
    80005644:	00001097          	auipc	ra,0x1
    80005648:	c3c080e7          	jalr	-964(ra) # 80006280 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000564c:	00700313          	li	t1,7
    thread_dispatch();
    80005650:	ffffc097          	auipc	ra,0xffffc
    80005654:	e70080e7          	jalr	-400(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005658:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    8000565c:	00005517          	auipc	a0,0x5
    80005660:	dc450513          	addi	a0,a0,-572 # 8000a420 <CONSOLE_STATUS+0x410>
    80005664:	00001097          	auipc	ra,0x1
    80005668:	c1c080e7          	jalr	-996(ra) # 80006280 <_Z11printStringPKc>
    8000566c:	00000613          	li	a2,0
    80005670:	00a00593          	li	a1,10
    80005674:	0009051b          	sext.w	a0,s2
    80005678:	00001097          	auipc	ra,0x1
    8000567c:	db8080e7          	jalr	-584(ra) # 80006430 <_Z8printIntiii>
    80005680:	00005517          	auipc	a0,0x5
    80005684:	fb850513          	addi	a0,a0,-72 # 8000a638 <CONSOLE_STATUS+0x628>
    80005688:	00001097          	auipc	ra,0x1
    8000568c:	bf8080e7          	jalr	-1032(ra) # 80006280 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005690:	00c00513          	li	a0,12
    80005694:	00000097          	auipc	ra,0x0
    80005698:	d88080e7          	jalr	-632(ra) # 8000541c <_ZL9fibonaccim>
    8000569c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800056a0:	00005517          	auipc	a0,0x5
    800056a4:	d8850513          	addi	a0,a0,-632 # 8000a428 <CONSOLE_STATUS+0x418>
    800056a8:	00001097          	auipc	ra,0x1
    800056ac:	bd8080e7          	jalr	-1064(ra) # 80006280 <_Z11printStringPKc>
    800056b0:	00000613          	li	a2,0
    800056b4:	00a00593          	li	a1,10
    800056b8:	0009051b          	sext.w	a0,s2
    800056bc:	00001097          	auipc	ra,0x1
    800056c0:	d74080e7          	jalr	-652(ra) # 80006430 <_Z8printIntiii>
    800056c4:	00005517          	auipc	a0,0x5
    800056c8:	f7450513          	addi	a0,a0,-140 # 8000a638 <CONSOLE_STATUS+0x628>
    800056cc:	00001097          	auipc	ra,0x1
    800056d0:	bb4080e7          	jalr	-1100(ra) # 80006280 <_Z11printStringPKc>
    800056d4:	0400006f          	j	80005714 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800056d8:	00005517          	auipc	a0,0x5
    800056dc:	d3050513          	addi	a0,a0,-720 # 8000a408 <CONSOLE_STATUS+0x3f8>
    800056e0:	00001097          	auipc	ra,0x1
    800056e4:	ba0080e7          	jalr	-1120(ra) # 80006280 <_Z11printStringPKc>
    800056e8:	00000613          	li	a2,0
    800056ec:	00a00593          	li	a1,10
    800056f0:	00048513          	mv	a0,s1
    800056f4:	00001097          	auipc	ra,0x1
    800056f8:	d3c080e7          	jalr	-708(ra) # 80006430 <_Z8printIntiii>
    800056fc:	00005517          	auipc	a0,0x5
    80005700:	f3c50513          	addi	a0,a0,-196 # 8000a638 <CONSOLE_STATUS+0x628>
    80005704:	00001097          	auipc	ra,0x1
    80005708:	b7c080e7          	jalr	-1156(ra) # 80006280 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000570c:	0014849b          	addiw	s1,s1,1
    80005710:	0ff4f493          	andi	s1,s1,255
    80005714:	00500793          	li	a5,5
    80005718:	fc97f0e3          	bgeu	a5,s1,800056d8 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    8000571c:	00005517          	auipc	a0,0x5
    80005720:	d1c50513          	addi	a0,a0,-740 # 8000a438 <CONSOLE_STATUS+0x428>
    80005724:	00001097          	auipc	ra,0x1
    80005728:	b5c080e7          	jalr	-1188(ra) # 80006280 <_Z11printStringPKc>
    finishedC = true;
    8000572c:	00100793          	li	a5,1
    80005730:	00008717          	auipc	a4,0x8
    80005734:	a2f704a3          	sb	a5,-1495(a4) # 8000d159 <_ZL9finishedC>
    thread_dispatch();
    80005738:	ffffc097          	auipc	ra,0xffffc
    8000573c:	d88080e7          	jalr	-632(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80005740:	01813083          	ld	ra,24(sp)
    80005744:	01013403          	ld	s0,16(sp)
    80005748:	00813483          	ld	s1,8(sp)
    8000574c:	00013903          	ld	s2,0(sp)
    80005750:	02010113          	addi	sp,sp,32
    80005754:	00008067          	ret

0000000080005758 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005758:	fe010113          	addi	sp,sp,-32
    8000575c:	00113c23          	sd	ra,24(sp)
    80005760:	00813823          	sd	s0,16(sp)
    80005764:	00913423          	sd	s1,8(sp)
    80005768:	01213023          	sd	s2,0(sp)
    8000576c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005770:	00000913          	li	s2,0
    80005774:	0380006f          	j	800057ac <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80005778:	ffffc097          	auipc	ra,0xffffc
    8000577c:	d48080e7          	jalr	-696(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005780:	00148493          	addi	s1,s1,1
    80005784:	000027b7          	lui	a5,0x2
    80005788:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000578c:	0097ee63          	bltu	a5,s1,800057a8 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005790:	00000713          	li	a4,0
    80005794:	000077b7          	lui	a5,0x7
    80005798:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000579c:	fce7eee3          	bltu	a5,a4,80005778 <_ZL11workerBodyBPv+0x20>
    800057a0:	00170713          	addi	a4,a4,1
    800057a4:	ff1ff06f          	j	80005794 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800057a8:	00190913          	addi	s2,s2,1
    800057ac:	00f00793          	li	a5,15
    800057b0:	0527e063          	bltu	a5,s2,800057f0 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800057b4:	00005517          	auipc	a0,0x5
    800057b8:	c3c50513          	addi	a0,a0,-964 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    800057bc:	00001097          	auipc	ra,0x1
    800057c0:	ac4080e7          	jalr	-1340(ra) # 80006280 <_Z11printStringPKc>
    800057c4:	00000613          	li	a2,0
    800057c8:	00a00593          	li	a1,10
    800057cc:	0009051b          	sext.w	a0,s2
    800057d0:	00001097          	auipc	ra,0x1
    800057d4:	c60080e7          	jalr	-928(ra) # 80006430 <_Z8printIntiii>
    800057d8:	00005517          	auipc	a0,0x5
    800057dc:	e6050513          	addi	a0,a0,-416 # 8000a638 <CONSOLE_STATUS+0x628>
    800057e0:	00001097          	auipc	ra,0x1
    800057e4:	aa0080e7          	jalr	-1376(ra) # 80006280 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800057e8:	00000493          	li	s1,0
    800057ec:	f99ff06f          	j	80005784 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    800057f0:	00005517          	auipc	a0,0x5
    800057f4:	c0850513          	addi	a0,a0,-1016 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    800057f8:	00001097          	auipc	ra,0x1
    800057fc:	a88080e7          	jalr	-1400(ra) # 80006280 <_Z11printStringPKc>
    finishedB = true;
    80005800:	00100793          	li	a5,1
    80005804:	00008717          	auipc	a4,0x8
    80005808:	94f70b23          	sb	a5,-1706(a4) # 8000d15a <_ZL9finishedB>
    thread_dispatch();
    8000580c:	ffffc097          	auipc	ra,0xffffc
    80005810:	cb4080e7          	jalr	-844(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80005814:	01813083          	ld	ra,24(sp)
    80005818:	01013403          	ld	s0,16(sp)
    8000581c:	00813483          	ld	s1,8(sp)
    80005820:	00013903          	ld	s2,0(sp)
    80005824:	02010113          	addi	sp,sp,32
    80005828:	00008067          	ret

000000008000582c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    8000582c:	fe010113          	addi	sp,sp,-32
    80005830:	00113c23          	sd	ra,24(sp)
    80005834:	00813823          	sd	s0,16(sp)
    80005838:	00913423          	sd	s1,8(sp)
    8000583c:	01213023          	sd	s2,0(sp)
    80005840:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005844:	00000913          	li	s2,0
    80005848:	0380006f          	j	80005880 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    8000584c:	ffffc097          	auipc	ra,0xffffc
    80005850:	c74080e7          	jalr	-908(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005854:	00148493          	addi	s1,s1,1
    80005858:	000027b7          	lui	a5,0x2
    8000585c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005860:	0097ee63          	bltu	a5,s1,8000587c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005864:	00000713          	li	a4,0
    80005868:	000077b7          	lui	a5,0x7
    8000586c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005870:	fce7eee3          	bltu	a5,a4,8000584c <_ZL11workerBodyAPv+0x20>
    80005874:	00170713          	addi	a4,a4,1
    80005878:	ff1ff06f          	j	80005868 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000587c:	00190913          	addi	s2,s2,1
    80005880:	00900793          	li	a5,9
    80005884:	0527e063          	bltu	a5,s2,800058c4 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005888:	00005517          	auipc	a0,0x5
    8000588c:	b5050513          	addi	a0,a0,-1200 # 8000a3d8 <CONSOLE_STATUS+0x3c8>
    80005890:	00001097          	auipc	ra,0x1
    80005894:	9f0080e7          	jalr	-1552(ra) # 80006280 <_Z11printStringPKc>
    80005898:	00000613          	li	a2,0
    8000589c:	00a00593          	li	a1,10
    800058a0:	0009051b          	sext.w	a0,s2
    800058a4:	00001097          	auipc	ra,0x1
    800058a8:	b8c080e7          	jalr	-1140(ra) # 80006430 <_Z8printIntiii>
    800058ac:	00005517          	auipc	a0,0x5
    800058b0:	d8c50513          	addi	a0,a0,-628 # 8000a638 <CONSOLE_STATUS+0x628>
    800058b4:	00001097          	auipc	ra,0x1
    800058b8:	9cc080e7          	jalr	-1588(ra) # 80006280 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800058bc:	00000493          	li	s1,0
    800058c0:	f99ff06f          	j	80005858 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800058c4:	00005517          	auipc	a0,0x5
    800058c8:	b1c50513          	addi	a0,a0,-1252 # 8000a3e0 <CONSOLE_STATUS+0x3d0>
    800058cc:	00001097          	auipc	ra,0x1
    800058d0:	9b4080e7          	jalr	-1612(ra) # 80006280 <_Z11printStringPKc>
    finishedA = true;
    800058d4:	00100793          	li	a5,1
    800058d8:	00008717          	auipc	a4,0x8
    800058dc:	88f701a3          	sb	a5,-1917(a4) # 8000d15b <_ZL9finishedA>
}
    800058e0:	01813083          	ld	ra,24(sp)
    800058e4:	01013403          	ld	s0,16(sp)
    800058e8:	00813483          	ld	s1,8(sp)
    800058ec:	00013903          	ld	s2,0(sp)
    800058f0:	02010113          	addi	sp,sp,32
    800058f4:	00008067          	ret

00000000800058f8 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800058f8:	fd010113          	addi	sp,sp,-48
    800058fc:	02113423          	sd	ra,40(sp)
    80005900:	02813023          	sd	s0,32(sp)
    80005904:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005908:	00000613          	li	a2,0
    8000590c:	00000597          	auipc	a1,0x0
    80005910:	f2058593          	addi	a1,a1,-224 # 8000582c <_ZL11workerBodyAPv>
    80005914:	fd040513          	addi	a0,s0,-48
    80005918:	ffffc097          	auipc	ra,0xffffc
    8000591c:	aec080e7          	jalr	-1300(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005920:	00005517          	auipc	a0,0x5
    80005924:	b6050513          	addi	a0,a0,-1184 # 8000a480 <CONSOLE_STATUS+0x470>
    80005928:	00001097          	auipc	ra,0x1
    8000592c:	958080e7          	jalr	-1704(ra) # 80006280 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005930:	00000613          	li	a2,0
    80005934:	00000597          	auipc	a1,0x0
    80005938:	e2458593          	addi	a1,a1,-476 # 80005758 <_ZL11workerBodyBPv>
    8000593c:	fd840513          	addi	a0,s0,-40
    80005940:	ffffc097          	auipc	ra,0xffffc
    80005944:	ac4080e7          	jalr	-1340(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005948:	00005517          	auipc	a0,0x5
    8000594c:	b5050513          	addi	a0,a0,-1200 # 8000a498 <CONSOLE_STATUS+0x488>
    80005950:	00001097          	auipc	ra,0x1
    80005954:	930080e7          	jalr	-1744(ra) # 80006280 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005958:	00000613          	li	a2,0
    8000595c:	00000597          	auipc	a1,0x0
    80005960:	c7c58593          	addi	a1,a1,-900 # 800055d8 <_ZL11workerBodyCPv>
    80005964:	fe040513          	addi	a0,s0,-32
    80005968:	ffffc097          	auipc	ra,0xffffc
    8000596c:	a9c080e7          	jalr	-1380(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005970:	00005517          	auipc	a0,0x5
    80005974:	b4050513          	addi	a0,a0,-1216 # 8000a4b0 <CONSOLE_STATUS+0x4a0>
    80005978:	00001097          	auipc	ra,0x1
    8000597c:	908080e7          	jalr	-1784(ra) # 80006280 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005980:	00000613          	li	a2,0
    80005984:	00000597          	auipc	a1,0x0
    80005988:	b0c58593          	addi	a1,a1,-1268 # 80005490 <_ZL11workerBodyDPv>
    8000598c:	fe840513          	addi	a0,s0,-24
    80005990:	ffffc097          	auipc	ra,0xffffc
    80005994:	a74080e7          	jalr	-1420(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005998:	00005517          	auipc	a0,0x5
    8000599c:	b3050513          	addi	a0,a0,-1232 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    800059a0:	00001097          	auipc	ra,0x1
    800059a4:	8e0080e7          	jalr	-1824(ra) # 80006280 <_Z11printStringPKc>
    800059a8:	00c0006f          	j	800059b4 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800059ac:	ffffc097          	auipc	ra,0xffffc
    800059b0:	b14080e7          	jalr	-1260(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800059b4:	00007797          	auipc	a5,0x7
    800059b8:	7a77c783          	lbu	a5,1959(a5) # 8000d15b <_ZL9finishedA>
    800059bc:	fe0788e3          	beqz	a5,800059ac <_Z18Threads_C_API_testv+0xb4>
    800059c0:	00007797          	auipc	a5,0x7
    800059c4:	79a7c783          	lbu	a5,1946(a5) # 8000d15a <_ZL9finishedB>
    800059c8:	fe0782e3          	beqz	a5,800059ac <_Z18Threads_C_API_testv+0xb4>
    800059cc:	00007797          	auipc	a5,0x7
    800059d0:	78d7c783          	lbu	a5,1933(a5) # 8000d159 <_ZL9finishedC>
    800059d4:	fc078ce3          	beqz	a5,800059ac <_Z18Threads_C_API_testv+0xb4>
    800059d8:	00007797          	auipc	a5,0x7
    800059dc:	7807c783          	lbu	a5,1920(a5) # 8000d158 <_ZL9finishedD>
    800059e0:	fc0786e3          	beqz	a5,800059ac <_Z18Threads_C_API_testv+0xb4>
    }

}
    800059e4:	02813083          	ld	ra,40(sp)
    800059e8:	02013403          	ld	s0,32(sp)
    800059ec:	03010113          	addi	sp,sp,48
    800059f0:	00008067          	ret

00000000800059f4 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    800059f4:	fd010113          	addi	sp,sp,-48
    800059f8:	02113423          	sd	ra,40(sp)
    800059fc:	02813023          	sd	s0,32(sp)
    80005a00:	00913c23          	sd	s1,24(sp)
    80005a04:	01213823          	sd	s2,16(sp)
    80005a08:	01313423          	sd	s3,8(sp)
    80005a0c:	03010413          	addi	s0,sp,48
    80005a10:	00050993          	mv	s3,a0
    80005a14:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005a18:	00000913          	li	s2,0
    80005a1c:	00c0006f          	j	80005a28 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005a20:	ffffe097          	auipc	ra,0xffffe
    80005a24:	824080e7          	jalr	-2012(ra) # 80003244 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005a28:	ffffc097          	auipc	ra,0xffffc
    80005a2c:	bd8080e7          	jalr	-1064(ra) # 80001600 <_Z4getcv>
    80005a30:	0005059b          	sext.w	a1,a0
    80005a34:	01b00793          	li	a5,27
    80005a38:	02f58a63          	beq	a1,a5,80005a6c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005a3c:	0084b503          	ld	a0,8(s1)
    80005a40:	00001097          	auipc	ra,0x1
    80005a44:	c64080e7          	jalr	-924(ra) # 800066a4 <_ZN9BufferCPP3putEi>
        i++;
    80005a48:	0019071b          	addiw	a4,s2,1
    80005a4c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005a50:	0004a683          	lw	a3,0(s1)
    80005a54:	0026979b          	slliw	a5,a3,0x2
    80005a58:	00d787bb          	addw	a5,a5,a3
    80005a5c:	0017979b          	slliw	a5,a5,0x1
    80005a60:	02f767bb          	remw	a5,a4,a5
    80005a64:	fc0792e3          	bnez	a5,80005a28 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80005a68:	fb9ff06f          	j	80005a20 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005a6c:	00100793          	li	a5,1
    80005a70:	00007717          	auipc	a4,0x7
    80005a74:	6ef72823          	sw	a5,1776(a4) # 8000d160 <_ZL9threadEnd>
    td->buffer->put('!');
    80005a78:	0209b783          	ld	a5,32(s3)
    80005a7c:	02100593          	li	a1,33
    80005a80:	0087b503          	ld	a0,8(a5)
    80005a84:	00001097          	auipc	ra,0x1
    80005a88:	c20080e7          	jalr	-992(ra) # 800066a4 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005a8c:	0104b503          	ld	a0,16(s1)
    80005a90:	ffffe097          	auipc	ra,0xffffe
    80005a94:	950080e7          	jalr	-1712(ra) # 800033e0 <_ZN9Semaphore6signalEv>
}
    80005a98:	02813083          	ld	ra,40(sp)
    80005a9c:	02013403          	ld	s0,32(sp)
    80005aa0:	01813483          	ld	s1,24(sp)
    80005aa4:	01013903          	ld	s2,16(sp)
    80005aa8:	00813983          	ld	s3,8(sp)
    80005aac:	03010113          	addi	sp,sp,48
    80005ab0:	00008067          	ret

0000000080005ab4 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80005ab4:	fe010113          	addi	sp,sp,-32
    80005ab8:	00113c23          	sd	ra,24(sp)
    80005abc:	00813823          	sd	s0,16(sp)
    80005ac0:	00913423          	sd	s1,8(sp)
    80005ac4:	01213023          	sd	s2,0(sp)
    80005ac8:	02010413          	addi	s0,sp,32
    80005acc:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005ad0:	00000913          	li	s2,0
    80005ad4:	00c0006f          	j	80005ae0 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005ad8:	ffffd097          	auipc	ra,0xffffd
    80005adc:	76c080e7          	jalr	1900(ra) # 80003244 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005ae0:	00007797          	auipc	a5,0x7
    80005ae4:	6807a783          	lw	a5,1664(a5) # 8000d160 <_ZL9threadEnd>
    80005ae8:	02079e63          	bnez	a5,80005b24 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005aec:	0004a583          	lw	a1,0(s1)
    80005af0:	0305859b          	addiw	a1,a1,48
    80005af4:	0084b503          	ld	a0,8(s1)
    80005af8:	00001097          	auipc	ra,0x1
    80005afc:	bac080e7          	jalr	-1108(ra) # 800066a4 <_ZN9BufferCPP3putEi>
        i++;
    80005b00:	0019071b          	addiw	a4,s2,1
    80005b04:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005b08:	0004a683          	lw	a3,0(s1)
    80005b0c:	0026979b          	slliw	a5,a3,0x2
    80005b10:	00d787bb          	addw	a5,a5,a3
    80005b14:	0017979b          	slliw	a5,a5,0x1
    80005b18:	02f767bb          	remw	a5,a4,a5
    80005b1c:	fc0792e3          	bnez	a5,80005ae0 <_ZN12ProducerSync8producerEPv+0x2c>
    80005b20:	fb9ff06f          	j	80005ad8 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005b24:	0104b503          	ld	a0,16(s1)
    80005b28:	ffffe097          	auipc	ra,0xffffe
    80005b2c:	8b8080e7          	jalr	-1864(ra) # 800033e0 <_ZN9Semaphore6signalEv>
}
    80005b30:	01813083          	ld	ra,24(sp)
    80005b34:	01013403          	ld	s0,16(sp)
    80005b38:	00813483          	ld	s1,8(sp)
    80005b3c:	00013903          	ld	s2,0(sp)
    80005b40:	02010113          	addi	sp,sp,32
    80005b44:	00008067          	ret

0000000080005b48 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005b48:	fd010113          	addi	sp,sp,-48
    80005b4c:	02113423          	sd	ra,40(sp)
    80005b50:	02813023          	sd	s0,32(sp)
    80005b54:	00913c23          	sd	s1,24(sp)
    80005b58:	01213823          	sd	s2,16(sp)
    80005b5c:	01313423          	sd	s3,8(sp)
    80005b60:	01413023          	sd	s4,0(sp)
    80005b64:	03010413          	addi	s0,sp,48
    80005b68:	00050993          	mv	s3,a0
    80005b6c:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005b70:	00000a13          	li	s4,0
    80005b74:	01c0006f          	j	80005b90 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005b78:	ffffd097          	auipc	ra,0xffffd
    80005b7c:	6cc080e7          	jalr	1740(ra) # 80003244 <_ZN6Thread8dispatchEv>
    80005b80:	0500006f          	j	80005bd0 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005b84:	00a00513          	li	a0,10
    80005b88:	ffffc097          	auipc	ra,0xffffc
    80005b8c:	aa0080e7          	jalr	-1376(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    80005b90:	00007797          	auipc	a5,0x7
    80005b94:	5d07a783          	lw	a5,1488(a5) # 8000d160 <_ZL9threadEnd>
    80005b98:	06079263          	bnez	a5,80005bfc <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005b9c:	00893503          	ld	a0,8(s2)
    80005ba0:	00001097          	auipc	ra,0x1
    80005ba4:	b94080e7          	jalr	-1132(ra) # 80006734 <_ZN9BufferCPP3getEv>
        i++;
    80005ba8:	001a049b          	addiw	s1,s4,1
    80005bac:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005bb0:	0ff57513          	andi	a0,a0,255
    80005bb4:	ffffc097          	auipc	ra,0xffffc
    80005bb8:	a74080e7          	jalr	-1420(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005bbc:	00092703          	lw	a4,0(s2)
    80005bc0:	0027179b          	slliw	a5,a4,0x2
    80005bc4:	00e787bb          	addw	a5,a5,a4
    80005bc8:	02f4e7bb          	remw	a5,s1,a5
    80005bcc:	fa0786e3          	beqz	a5,80005b78 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005bd0:	05000793          	li	a5,80
    80005bd4:	02f4e4bb          	remw	s1,s1,a5
    80005bd8:	fa049ce3          	bnez	s1,80005b90 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005bdc:	fa9ff06f          	j	80005b84 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005be0:	0209b783          	ld	a5,32(s3)
    80005be4:	0087b503          	ld	a0,8(a5)
    80005be8:	00001097          	auipc	ra,0x1
    80005bec:	b4c080e7          	jalr	-1204(ra) # 80006734 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005bf0:	0ff57513          	andi	a0,a0,255
    80005bf4:	ffffe097          	auipc	ra,0xffffe
    80005bf8:	8b0080e7          	jalr	-1872(ra) # 800034a4 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005bfc:	0209b783          	ld	a5,32(s3)
    80005c00:	0087b503          	ld	a0,8(a5)
    80005c04:	00001097          	auipc	ra,0x1
    80005c08:	bbc080e7          	jalr	-1092(ra) # 800067c0 <_ZN9BufferCPP6getCntEv>
    80005c0c:	fca04ae3          	bgtz	a0,80005be0 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005c10:	01093503          	ld	a0,16(s2)
    80005c14:	ffffd097          	auipc	ra,0xffffd
    80005c18:	7cc080e7          	jalr	1996(ra) # 800033e0 <_ZN9Semaphore6signalEv>
}
    80005c1c:	02813083          	ld	ra,40(sp)
    80005c20:	02013403          	ld	s0,32(sp)
    80005c24:	01813483          	ld	s1,24(sp)
    80005c28:	01013903          	ld	s2,16(sp)
    80005c2c:	00813983          	ld	s3,8(sp)
    80005c30:	00013a03          	ld	s4,0(sp)
    80005c34:	03010113          	addi	sp,sp,48
    80005c38:	00008067          	ret

0000000080005c3c <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005c3c:	f8010113          	addi	sp,sp,-128
    80005c40:	06113c23          	sd	ra,120(sp)
    80005c44:	06813823          	sd	s0,112(sp)
    80005c48:	06913423          	sd	s1,104(sp)
    80005c4c:	07213023          	sd	s2,96(sp)
    80005c50:	05313c23          	sd	s3,88(sp)
    80005c54:	05413823          	sd	s4,80(sp)
    80005c58:	05513423          	sd	s5,72(sp)
    80005c5c:	05613023          	sd	s6,64(sp)
    80005c60:	03713c23          	sd	s7,56(sp)
    80005c64:	03813823          	sd	s8,48(sp)
    80005c68:	03913423          	sd	s9,40(sp)
    80005c6c:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005c70:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005c74:	00004517          	auipc	a0,0x4
    80005c78:	67c50513          	addi	a0,a0,1660 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    80005c7c:	00000097          	auipc	ra,0x0
    80005c80:	604080e7          	jalr	1540(ra) # 80006280 <_Z11printStringPKc>
    getString(input, 30);
    80005c84:	01e00593          	li	a1,30
    80005c88:	f8040493          	addi	s1,s0,-128
    80005c8c:	00048513          	mv	a0,s1
    80005c90:	00000097          	auipc	ra,0x0
    80005c94:	678080e7          	jalr	1656(ra) # 80006308 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005c98:	00048513          	mv	a0,s1
    80005c9c:	00000097          	auipc	ra,0x0
    80005ca0:	744080e7          	jalr	1860(ra) # 800063e0 <_Z11stringToIntPKc>
    80005ca4:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005ca8:	00004517          	auipc	a0,0x4
    80005cac:	66850513          	addi	a0,a0,1640 # 8000a310 <CONSOLE_STATUS+0x300>
    80005cb0:	00000097          	auipc	ra,0x0
    80005cb4:	5d0080e7          	jalr	1488(ra) # 80006280 <_Z11printStringPKc>
    getString(input, 30);
    80005cb8:	01e00593          	li	a1,30
    80005cbc:	00048513          	mv	a0,s1
    80005cc0:	00000097          	auipc	ra,0x0
    80005cc4:	648080e7          	jalr	1608(ra) # 80006308 <_Z9getStringPci>
    n = stringToInt(input);
    80005cc8:	00048513          	mv	a0,s1
    80005ccc:	00000097          	auipc	ra,0x0
    80005cd0:	714080e7          	jalr	1812(ra) # 800063e0 <_Z11stringToIntPKc>
    80005cd4:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005cd8:	00004517          	auipc	a0,0x4
    80005cdc:	65850513          	addi	a0,a0,1624 # 8000a330 <CONSOLE_STATUS+0x320>
    80005ce0:	00000097          	auipc	ra,0x0
    80005ce4:	5a0080e7          	jalr	1440(ra) # 80006280 <_Z11printStringPKc>
    80005ce8:	00000613          	li	a2,0
    80005cec:	00a00593          	li	a1,10
    80005cf0:	00090513          	mv	a0,s2
    80005cf4:	00000097          	auipc	ra,0x0
    80005cf8:	73c080e7          	jalr	1852(ra) # 80006430 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005cfc:	00004517          	auipc	a0,0x4
    80005d00:	64c50513          	addi	a0,a0,1612 # 8000a348 <CONSOLE_STATUS+0x338>
    80005d04:	00000097          	auipc	ra,0x0
    80005d08:	57c080e7          	jalr	1404(ra) # 80006280 <_Z11printStringPKc>
    80005d0c:	00000613          	li	a2,0
    80005d10:	00a00593          	li	a1,10
    80005d14:	00048513          	mv	a0,s1
    80005d18:	00000097          	auipc	ra,0x0
    80005d1c:	718080e7          	jalr	1816(ra) # 80006430 <_Z8printIntiii>
    printString(".\n");
    80005d20:	00004517          	auipc	a0,0x4
    80005d24:	64050513          	addi	a0,a0,1600 # 8000a360 <CONSOLE_STATUS+0x350>
    80005d28:	00000097          	auipc	ra,0x0
    80005d2c:	558080e7          	jalr	1368(ra) # 80006280 <_Z11printStringPKc>
    if(threadNum > n) {
    80005d30:	0324c463          	blt	s1,s2,80005d58 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005d34:	03205c63          	blez	s2,80005d6c <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005d38:	03800513          	li	a0,56
    80005d3c:	ffffd097          	auipc	ra,0xffffd
    80005d40:	2dc080e7          	jalr	732(ra) # 80003018 <_Znwm>
    80005d44:	00050a93          	mv	s5,a0
    80005d48:	00048593          	mv	a1,s1
    80005d4c:	00001097          	auipc	ra,0x1
    80005d50:	804080e7          	jalr	-2044(ra) # 80006550 <_ZN9BufferCPPC1Ei>
    80005d54:	0300006f          	j	80005d84 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005d58:	00004517          	auipc	a0,0x4
    80005d5c:	61050513          	addi	a0,a0,1552 # 8000a368 <CONSOLE_STATUS+0x358>
    80005d60:	00000097          	auipc	ra,0x0
    80005d64:	520080e7          	jalr	1312(ra) # 80006280 <_Z11printStringPKc>
        return;
    80005d68:	0140006f          	j	80005d7c <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005d6c:	00004517          	auipc	a0,0x4
    80005d70:	63c50513          	addi	a0,a0,1596 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80005d74:	00000097          	auipc	ra,0x0
    80005d78:	50c080e7          	jalr	1292(ra) # 80006280 <_Z11printStringPKc>
        return;
    80005d7c:	000b8113          	mv	sp,s7
    80005d80:	2380006f          	j	80005fb8 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005d84:	01000513          	li	a0,16
    80005d88:	ffffd097          	auipc	ra,0xffffd
    80005d8c:	290080e7          	jalr	656(ra) # 80003018 <_Znwm>
    80005d90:	00050493          	mv	s1,a0
    80005d94:	00000593          	li	a1,0
    80005d98:	ffffd097          	auipc	ra,0xffffd
    80005d9c:	5e4080e7          	jalr	1508(ra) # 8000337c <_ZN9SemaphoreC1Ej>
    80005da0:	00007797          	auipc	a5,0x7
    80005da4:	3c97b423          	sd	s1,968(a5) # 8000d168 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005da8:	00391793          	slli	a5,s2,0x3
    80005dac:	00f78793          	addi	a5,a5,15
    80005db0:	ff07f793          	andi	a5,a5,-16
    80005db4:	40f10133          	sub	sp,sp,a5
    80005db8:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005dbc:	0019071b          	addiw	a4,s2,1
    80005dc0:	00171793          	slli	a5,a4,0x1
    80005dc4:	00e787b3          	add	a5,a5,a4
    80005dc8:	00379793          	slli	a5,a5,0x3
    80005dcc:	00f78793          	addi	a5,a5,15
    80005dd0:	ff07f793          	andi	a5,a5,-16
    80005dd4:	40f10133          	sub	sp,sp,a5
    80005dd8:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005ddc:	00191c13          	slli	s8,s2,0x1
    80005de0:	012c07b3          	add	a5,s8,s2
    80005de4:	00379793          	slli	a5,a5,0x3
    80005de8:	00fa07b3          	add	a5,s4,a5
    80005dec:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005df0:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005df4:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005df8:	02800513          	li	a0,40
    80005dfc:	ffffd097          	auipc	ra,0xffffd
    80005e00:	21c080e7          	jalr	540(ra) # 80003018 <_Znwm>
    80005e04:	00050b13          	mv	s6,a0
    80005e08:	012c0c33          	add	s8,s8,s2
    80005e0c:	003c1c13          	slli	s8,s8,0x3
    80005e10:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005e14:	ffffd097          	auipc	ra,0xffffd
    80005e18:	4ec080e7          	jalr	1260(ra) # 80003300 <_ZN6ThreadC1Ev>
    80005e1c:	00007797          	auipc	a5,0x7
    80005e20:	0cc78793          	addi	a5,a5,204 # 8000cee8 <_ZTV12ConsumerSync+0x10>
    80005e24:	00fb3023          	sd	a5,0(s6)
    80005e28:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005e2c:	000b0513          	mv	a0,s6
    80005e30:	ffffd097          	auipc	ra,0xffffd
    80005e34:	3a0080e7          	jalr	928(ra) # 800031d0 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005e38:	00000493          	li	s1,0
    80005e3c:	0380006f          	j	80005e74 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005e40:	00007797          	auipc	a5,0x7
    80005e44:	08078793          	addi	a5,a5,128 # 8000cec0 <_ZTV12ProducerSync+0x10>
    80005e48:	00fcb023          	sd	a5,0(s9)
    80005e4c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005e50:	00349793          	slli	a5,s1,0x3
    80005e54:	00f987b3          	add	a5,s3,a5
    80005e58:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005e5c:	00349793          	slli	a5,s1,0x3
    80005e60:	00f987b3          	add	a5,s3,a5
    80005e64:	0007b503          	ld	a0,0(a5)
    80005e68:	ffffd097          	auipc	ra,0xffffd
    80005e6c:	368080e7          	jalr	872(ra) # 800031d0 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005e70:	0014849b          	addiw	s1,s1,1
    80005e74:	0b24d063          	bge	s1,s2,80005f14 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005e78:	00149793          	slli	a5,s1,0x1
    80005e7c:	009787b3          	add	a5,a5,s1
    80005e80:	00379793          	slli	a5,a5,0x3
    80005e84:	00fa07b3          	add	a5,s4,a5
    80005e88:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005e8c:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005e90:	00007717          	auipc	a4,0x7
    80005e94:	2d873703          	ld	a4,728(a4) # 8000d168 <_ZL10waitForAll>
    80005e98:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005e9c:	02905863          	blez	s1,80005ecc <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005ea0:	02800513          	li	a0,40
    80005ea4:	ffffd097          	auipc	ra,0xffffd
    80005ea8:	174080e7          	jalr	372(ra) # 80003018 <_Znwm>
    80005eac:	00050c93          	mv	s9,a0
    80005eb0:	00149c13          	slli	s8,s1,0x1
    80005eb4:	009c0c33          	add	s8,s8,s1
    80005eb8:	003c1c13          	slli	s8,s8,0x3
    80005ebc:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005ec0:	ffffd097          	auipc	ra,0xffffd
    80005ec4:	440080e7          	jalr	1088(ra) # 80003300 <_ZN6ThreadC1Ev>
    80005ec8:	f79ff06f          	j	80005e40 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005ecc:	02800513          	li	a0,40
    80005ed0:	ffffd097          	auipc	ra,0xffffd
    80005ed4:	148080e7          	jalr	328(ra) # 80003018 <_Znwm>
    80005ed8:	00050c93          	mv	s9,a0
    80005edc:	00149c13          	slli	s8,s1,0x1
    80005ee0:	009c0c33          	add	s8,s8,s1
    80005ee4:	003c1c13          	slli	s8,s8,0x3
    80005ee8:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005eec:	ffffd097          	auipc	ra,0xffffd
    80005ef0:	414080e7          	jalr	1044(ra) # 80003300 <_ZN6ThreadC1Ev>
    80005ef4:	00007797          	auipc	a5,0x7
    80005ef8:	fa478793          	addi	a5,a5,-92 # 8000ce98 <_ZTV16ProducerKeyboard+0x10>
    80005efc:	00fcb023          	sd	a5,0(s9)
    80005f00:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005f04:	00349793          	slli	a5,s1,0x3
    80005f08:	00f987b3          	add	a5,s3,a5
    80005f0c:	0197b023          	sd	s9,0(a5)
    80005f10:	f4dff06f          	j	80005e5c <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005f14:	ffffd097          	auipc	ra,0xffffd
    80005f18:	330080e7          	jalr	816(ra) # 80003244 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005f1c:	00000493          	li	s1,0
    80005f20:	00994e63          	blt	s2,s1,80005f3c <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005f24:	00007517          	auipc	a0,0x7
    80005f28:	24453503          	ld	a0,580(a0) # 8000d168 <_ZL10waitForAll>
    80005f2c:	ffffd097          	auipc	ra,0xffffd
    80005f30:	488080e7          	jalr	1160(ra) # 800033b4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005f34:	0014849b          	addiw	s1,s1,1
    80005f38:	fe9ff06f          	j	80005f20 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005f3c:	00000493          	li	s1,0
    80005f40:	0080006f          	j	80005f48 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005f44:	0014849b          	addiw	s1,s1,1
    80005f48:	0324d263          	bge	s1,s2,80005f6c <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005f4c:	00349793          	slli	a5,s1,0x3
    80005f50:	00f987b3          	add	a5,s3,a5
    80005f54:	0007b503          	ld	a0,0(a5)
    80005f58:	fe0506e3          	beqz	a0,80005f44 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005f5c:	00053783          	ld	a5,0(a0)
    80005f60:	0087b783          	ld	a5,8(a5)
    80005f64:	000780e7          	jalr	a5
    80005f68:	fddff06f          	j	80005f44 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005f6c:	000b0a63          	beqz	s6,80005f80 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005f70:	000b3783          	ld	a5,0(s6)
    80005f74:	0087b783          	ld	a5,8(a5)
    80005f78:	000b0513          	mv	a0,s6
    80005f7c:	000780e7          	jalr	a5
    delete waitForAll;
    80005f80:	00007517          	auipc	a0,0x7
    80005f84:	1e853503          	ld	a0,488(a0) # 8000d168 <_ZL10waitForAll>
    80005f88:	00050863          	beqz	a0,80005f98 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005f8c:	00053783          	ld	a5,0(a0)
    80005f90:	0087b783          	ld	a5,8(a5)
    80005f94:	000780e7          	jalr	a5
    delete buffer;
    80005f98:	000a8e63          	beqz	s5,80005fb4 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005f9c:	000a8513          	mv	a0,s5
    80005fa0:	00001097          	auipc	ra,0x1
    80005fa4:	8a8080e7          	jalr	-1880(ra) # 80006848 <_ZN9BufferCPPD1Ev>
    80005fa8:	000a8513          	mv	a0,s5
    80005fac:	ffffd097          	auipc	ra,0xffffd
    80005fb0:	0bc080e7          	jalr	188(ra) # 80003068 <_ZdlPv>
    80005fb4:	000b8113          	mv	sp,s7

}
    80005fb8:	f8040113          	addi	sp,s0,-128
    80005fbc:	07813083          	ld	ra,120(sp)
    80005fc0:	07013403          	ld	s0,112(sp)
    80005fc4:	06813483          	ld	s1,104(sp)
    80005fc8:	06013903          	ld	s2,96(sp)
    80005fcc:	05813983          	ld	s3,88(sp)
    80005fd0:	05013a03          	ld	s4,80(sp)
    80005fd4:	04813a83          	ld	s5,72(sp)
    80005fd8:	04013b03          	ld	s6,64(sp)
    80005fdc:	03813b83          	ld	s7,56(sp)
    80005fe0:	03013c03          	ld	s8,48(sp)
    80005fe4:	02813c83          	ld	s9,40(sp)
    80005fe8:	08010113          	addi	sp,sp,128
    80005fec:	00008067          	ret
    80005ff0:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005ff4:	000a8513          	mv	a0,s5
    80005ff8:	ffffd097          	auipc	ra,0xffffd
    80005ffc:	070080e7          	jalr	112(ra) # 80003068 <_ZdlPv>
    80006000:	00048513          	mv	a0,s1
    80006004:	00008097          	auipc	ra,0x8
    80006008:	264080e7          	jalr	612(ra) # 8000e268 <_Unwind_Resume>
    8000600c:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80006010:	00048513          	mv	a0,s1
    80006014:	ffffd097          	auipc	ra,0xffffd
    80006018:	054080e7          	jalr	84(ra) # 80003068 <_ZdlPv>
    8000601c:	00090513          	mv	a0,s2
    80006020:	00008097          	auipc	ra,0x8
    80006024:	248080e7          	jalr	584(ra) # 8000e268 <_Unwind_Resume>
    80006028:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    8000602c:	000b0513          	mv	a0,s6
    80006030:	ffffd097          	auipc	ra,0xffffd
    80006034:	038080e7          	jalr	56(ra) # 80003068 <_ZdlPv>
    80006038:	00048513          	mv	a0,s1
    8000603c:	00008097          	auipc	ra,0x8
    80006040:	22c080e7          	jalr	556(ra) # 8000e268 <_Unwind_Resume>
    80006044:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80006048:	000c8513          	mv	a0,s9
    8000604c:	ffffd097          	auipc	ra,0xffffd
    80006050:	01c080e7          	jalr	28(ra) # 80003068 <_ZdlPv>
    80006054:	00048513          	mv	a0,s1
    80006058:	00008097          	auipc	ra,0x8
    8000605c:	210080e7          	jalr	528(ra) # 8000e268 <_Unwind_Resume>
    80006060:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80006064:	000c8513          	mv	a0,s9
    80006068:	ffffd097          	auipc	ra,0xffffd
    8000606c:	000080e7          	jalr	ra # 80003068 <_ZdlPv>
    80006070:	00048513          	mv	a0,s1
    80006074:	00008097          	auipc	ra,0x8
    80006078:	1f4080e7          	jalr	500(ra) # 8000e268 <_Unwind_Resume>

000000008000607c <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    8000607c:	ff010113          	addi	sp,sp,-16
    80006080:	00113423          	sd	ra,8(sp)
    80006084:	00813023          	sd	s0,0(sp)
    80006088:	01010413          	addi	s0,sp,16
    8000608c:	00007797          	auipc	a5,0x7
    80006090:	e5c78793          	addi	a5,a5,-420 # 8000cee8 <_ZTV12ConsumerSync+0x10>
    80006094:	00f53023          	sd	a5,0(a0)
    80006098:	ffffd097          	auipc	ra,0xffffd
    8000609c:	ea0080e7          	jalr	-352(ra) # 80002f38 <_ZN6ThreadD1Ev>
    800060a0:	00813083          	ld	ra,8(sp)
    800060a4:	00013403          	ld	s0,0(sp)
    800060a8:	01010113          	addi	sp,sp,16
    800060ac:	00008067          	ret

00000000800060b0 <_ZN12ConsumerSyncD0Ev>:
    800060b0:	fe010113          	addi	sp,sp,-32
    800060b4:	00113c23          	sd	ra,24(sp)
    800060b8:	00813823          	sd	s0,16(sp)
    800060bc:	00913423          	sd	s1,8(sp)
    800060c0:	02010413          	addi	s0,sp,32
    800060c4:	00050493          	mv	s1,a0
    800060c8:	00007797          	auipc	a5,0x7
    800060cc:	e2078793          	addi	a5,a5,-480 # 8000cee8 <_ZTV12ConsumerSync+0x10>
    800060d0:	00f53023          	sd	a5,0(a0)
    800060d4:	ffffd097          	auipc	ra,0xffffd
    800060d8:	e64080e7          	jalr	-412(ra) # 80002f38 <_ZN6ThreadD1Ev>
    800060dc:	00048513          	mv	a0,s1
    800060e0:	ffffd097          	auipc	ra,0xffffd
    800060e4:	f88080e7          	jalr	-120(ra) # 80003068 <_ZdlPv>
    800060e8:	01813083          	ld	ra,24(sp)
    800060ec:	01013403          	ld	s0,16(sp)
    800060f0:	00813483          	ld	s1,8(sp)
    800060f4:	02010113          	addi	sp,sp,32
    800060f8:	00008067          	ret

00000000800060fc <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    800060fc:	ff010113          	addi	sp,sp,-16
    80006100:	00113423          	sd	ra,8(sp)
    80006104:	00813023          	sd	s0,0(sp)
    80006108:	01010413          	addi	s0,sp,16
    8000610c:	00007797          	auipc	a5,0x7
    80006110:	db478793          	addi	a5,a5,-588 # 8000cec0 <_ZTV12ProducerSync+0x10>
    80006114:	00f53023          	sd	a5,0(a0)
    80006118:	ffffd097          	auipc	ra,0xffffd
    8000611c:	e20080e7          	jalr	-480(ra) # 80002f38 <_ZN6ThreadD1Ev>
    80006120:	00813083          	ld	ra,8(sp)
    80006124:	00013403          	ld	s0,0(sp)
    80006128:	01010113          	addi	sp,sp,16
    8000612c:	00008067          	ret

0000000080006130 <_ZN12ProducerSyncD0Ev>:
    80006130:	fe010113          	addi	sp,sp,-32
    80006134:	00113c23          	sd	ra,24(sp)
    80006138:	00813823          	sd	s0,16(sp)
    8000613c:	00913423          	sd	s1,8(sp)
    80006140:	02010413          	addi	s0,sp,32
    80006144:	00050493          	mv	s1,a0
    80006148:	00007797          	auipc	a5,0x7
    8000614c:	d7878793          	addi	a5,a5,-648 # 8000cec0 <_ZTV12ProducerSync+0x10>
    80006150:	00f53023          	sd	a5,0(a0)
    80006154:	ffffd097          	auipc	ra,0xffffd
    80006158:	de4080e7          	jalr	-540(ra) # 80002f38 <_ZN6ThreadD1Ev>
    8000615c:	00048513          	mv	a0,s1
    80006160:	ffffd097          	auipc	ra,0xffffd
    80006164:	f08080e7          	jalr	-248(ra) # 80003068 <_ZdlPv>
    80006168:	01813083          	ld	ra,24(sp)
    8000616c:	01013403          	ld	s0,16(sp)
    80006170:	00813483          	ld	s1,8(sp)
    80006174:	02010113          	addi	sp,sp,32
    80006178:	00008067          	ret

000000008000617c <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    8000617c:	ff010113          	addi	sp,sp,-16
    80006180:	00113423          	sd	ra,8(sp)
    80006184:	00813023          	sd	s0,0(sp)
    80006188:	01010413          	addi	s0,sp,16
    8000618c:	00007797          	auipc	a5,0x7
    80006190:	d0c78793          	addi	a5,a5,-756 # 8000ce98 <_ZTV16ProducerKeyboard+0x10>
    80006194:	00f53023          	sd	a5,0(a0)
    80006198:	ffffd097          	auipc	ra,0xffffd
    8000619c:	da0080e7          	jalr	-608(ra) # 80002f38 <_ZN6ThreadD1Ev>
    800061a0:	00813083          	ld	ra,8(sp)
    800061a4:	00013403          	ld	s0,0(sp)
    800061a8:	01010113          	addi	sp,sp,16
    800061ac:	00008067          	ret

00000000800061b0 <_ZN16ProducerKeyboardD0Ev>:
    800061b0:	fe010113          	addi	sp,sp,-32
    800061b4:	00113c23          	sd	ra,24(sp)
    800061b8:	00813823          	sd	s0,16(sp)
    800061bc:	00913423          	sd	s1,8(sp)
    800061c0:	02010413          	addi	s0,sp,32
    800061c4:	00050493          	mv	s1,a0
    800061c8:	00007797          	auipc	a5,0x7
    800061cc:	cd078793          	addi	a5,a5,-816 # 8000ce98 <_ZTV16ProducerKeyboard+0x10>
    800061d0:	00f53023          	sd	a5,0(a0)
    800061d4:	ffffd097          	auipc	ra,0xffffd
    800061d8:	d64080e7          	jalr	-668(ra) # 80002f38 <_ZN6ThreadD1Ev>
    800061dc:	00048513          	mv	a0,s1
    800061e0:	ffffd097          	auipc	ra,0xffffd
    800061e4:	e88080e7          	jalr	-376(ra) # 80003068 <_ZdlPv>
    800061e8:	01813083          	ld	ra,24(sp)
    800061ec:	01013403          	ld	s0,16(sp)
    800061f0:	00813483          	ld	s1,8(sp)
    800061f4:	02010113          	addi	sp,sp,32
    800061f8:	00008067          	ret

00000000800061fc <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    800061fc:	ff010113          	addi	sp,sp,-16
    80006200:	00113423          	sd	ra,8(sp)
    80006204:	00813023          	sd	s0,0(sp)
    80006208:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    8000620c:	02053583          	ld	a1,32(a0)
    80006210:	fffff097          	auipc	ra,0xfffff
    80006214:	7e4080e7          	jalr	2020(ra) # 800059f4 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80006218:	00813083          	ld	ra,8(sp)
    8000621c:	00013403          	ld	s0,0(sp)
    80006220:	01010113          	addi	sp,sp,16
    80006224:	00008067          	ret

0000000080006228 <_ZN12ProducerSync3runEv>:
    void run() override {
    80006228:	ff010113          	addi	sp,sp,-16
    8000622c:	00113423          	sd	ra,8(sp)
    80006230:	00813023          	sd	s0,0(sp)
    80006234:	01010413          	addi	s0,sp,16
        producer(td);
    80006238:	02053583          	ld	a1,32(a0)
    8000623c:	00000097          	auipc	ra,0x0
    80006240:	878080e7          	jalr	-1928(ra) # 80005ab4 <_ZN12ProducerSync8producerEPv>
    }
    80006244:	00813083          	ld	ra,8(sp)
    80006248:	00013403          	ld	s0,0(sp)
    8000624c:	01010113          	addi	sp,sp,16
    80006250:	00008067          	ret

0000000080006254 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80006254:	ff010113          	addi	sp,sp,-16
    80006258:	00113423          	sd	ra,8(sp)
    8000625c:	00813023          	sd	s0,0(sp)
    80006260:	01010413          	addi	s0,sp,16
        consumer(td);
    80006264:	02053583          	ld	a1,32(a0)
    80006268:	00000097          	auipc	ra,0x0
    8000626c:	8e0080e7          	jalr	-1824(ra) # 80005b48 <_ZN12ConsumerSync8consumerEPv>
    }
    80006270:	00813083          	ld	ra,8(sp)
    80006274:	00013403          	ld	s0,0(sp)
    80006278:	01010113          	addi	sp,sp,16
    8000627c:	00008067          	ret

0000000080006280 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80006280:	fe010113          	addi	sp,sp,-32
    80006284:	00113c23          	sd	ra,24(sp)
    80006288:	00813823          	sd	s0,16(sp)
    8000628c:	00913423          	sd	s1,8(sp)
    80006290:	02010413          	addi	s0,sp,32
    80006294:	00050493          	mv	s1,a0
    LOCK();
    80006298:	00100613          	li	a2,1
    8000629c:	00000593          	li	a1,0
    800062a0:	00007517          	auipc	a0,0x7
    800062a4:	ed050513          	addi	a0,a0,-304 # 8000d170 <lockPrint>
    800062a8:	ffffb097          	auipc	ra,0xffffb
    800062ac:	e7c080e7          	jalr	-388(ra) # 80001124 <copy_and_swap>
    800062b0:	00050863          	beqz	a0,800062c0 <_Z11printStringPKc+0x40>
    800062b4:	ffffb097          	auipc	ra,0xffffb
    800062b8:	20c080e7          	jalr	524(ra) # 800014c0 <_Z15thread_dispatchv>
    800062bc:	fddff06f          	j	80006298 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800062c0:	0004c503          	lbu	a0,0(s1)
    800062c4:	00050a63          	beqz	a0,800062d8 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    800062c8:	ffffb097          	auipc	ra,0xffffb
    800062cc:	360080e7          	jalr	864(ra) # 80001628 <_Z4putcc>
        string++;
    800062d0:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800062d4:	fedff06f          	j	800062c0 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800062d8:	00000613          	li	a2,0
    800062dc:	00100593          	li	a1,1
    800062e0:	00007517          	auipc	a0,0x7
    800062e4:	e9050513          	addi	a0,a0,-368 # 8000d170 <lockPrint>
    800062e8:	ffffb097          	auipc	ra,0xffffb
    800062ec:	e3c080e7          	jalr	-452(ra) # 80001124 <copy_and_swap>
    800062f0:	fe0514e3          	bnez	a0,800062d8 <_Z11printStringPKc+0x58>
}
    800062f4:	01813083          	ld	ra,24(sp)
    800062f8:	01013403          	ld	s0,16(sp)
    800062fc:	00813483          	ld	s1,8(sp)
    80006300:	02010113          	addi	sp,sp,32
    80006304:	00008067          	ret

0000000080006308 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80006308:	fd010113          	addi	sp,sp,-48
    8000630c:	02113423          	sd	ra,40(sp)
    80006310:	02813023          	sd	s0,32(sp)
    80006314:	00913c23          	sd	s1,24(sp)
    80006318:	01213823          	sd	s2,16(sp)
    8000631c:	01313423          	sd	s3,8(sp)
    80006320:	01413023          	sd	s4,0(sp)
    80006324:	03010413          	addi	s0,sp,48
    80006328:	00050993          	mv	s3,a0
    8000632c:	00058a13          	mv	s4,a1
    LOCK();
    80006330:	00100613          	li	a2,1
    80006334:	00000593          	li	a1,0
    80006338:	00007517          	auipc	a0,0x7
    8000633c:	e3850513          	addi	a0,a0,-456 # 8000d170 <lockPrint>
    80006340:	ffffb097          	auipc	ra,0xffffb
    80006344:	de4080e7          	jalr	-540(ra) # 80001124 <copy_and_swap>
    80006348:	00050863          	beqz	a0,80006358 <_Z9getStringPci+0x50>
    8000634c:	ffffb097          	auipc	ra,0xffffb
    80006350:	174080e7          	jalr	372(ra) # 800014c0 <_Z15thread_dispatchv>
    80006354:	fddff06f          	j	80006330 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80006358:	00000913          	li	s2,0
    8000635c:	00090493          	mv	s1,s2
    80006360:	0019091b          	addiw	s2,s2,1
    80006364:	03495a63          	bge	s2,s4,80006398 <_Z9getStringPci+0x90>
        cc = getc();
    80006368:	ffffb097          	auipc	ra,0xffffb
    8000636c:	298080e7          	jalr	664(ra) # 80001600 <_Z4getcv>
        if(cc < 1)
    80006370:	02050463          	beqz	a0,80006398 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80006374:	009984b3          	add	s1,s3,s1
    80006378:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    8000637c:	00a00793          	li	a5,10
    80006380:	00f50a63          	beq	a0,a5,80006394 <_Z9getStringPci+0x8c>
    80006384:	00d00793          	li	a5,13
    80006388:	fcf51ae3          	bne	a0,a5,8000635c <_Z9getStringPci+0x54>
        buf[i++] = c;
    8000638c:	00090493          	mv	s1,s2
    80006390:	0080006f          	j	80006398 <_Z9getStringPci+0x90>
    80006394:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80006398:	009984b3          	add	s1,s3,s1
    8000639c:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800063a0:	00000613          	li	a2,0
    800063a4:	00100593          	li	a1,1
    800063a8:	00007517          	auipc	a0,0x7
    800063ac:	dc850513          	addi	a0,a0,-568 # 8000d170 <lockPrint>
    800063b0:	ffffb097          	auipc	ra,0xffffb
    800063b4:	d74080e7          	jalr	-652(ra) # 80001124 <copy_and_swap>
    800063b8:	fe0514e3          	bnez	a0,800063a0 <_Z9getStringPci+0x98>
    return buf;
}
    800063bc:	00098513          	mv	a0,s3
    800063c0:	02813083          	ld	ra,40(sp)
    800063c4:	02013403          	ld	s0,32(sp)
    800063c8:	01813483          	ld	s1,24(sp)
    800063cc:	01013903          	ld	s2,16(sp)
    800063d0:	00813983          	ld	s3,8(sp)
    800063d4:	00013a03          	ld	s4,0(sp)
    800063d8:	03010113          	addi	sp,sp,48
    800063dc:	00008067          	ret

00000000800063e0 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800063e0:	ff010113          	addi	sp,sp,-16
    800063e4:	00813423          	sd	s0,8(sp)
    800063e8:	01010413          	addi	s0,sp,16
    800063ec:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800063f0:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800063f4:	0006c603          	lbu	a2,0(a3)
    800063f8:	fd06071b          	addiw	a4,a2,-48
    800063fc:	0ff77713          	andi	a4,a4,255
    80006400:	00900793          	li	a5,9
    80006404:	02e7e063          	bltu	a5,a4,80006424 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80006408:	0025179b          	slliw	a5,a0,0x2
    8000640c:	00a787bb          	addw	a5,a5,a0
    80006410:	0017979b          	slliw	a5,a5,0x1
    80006414:	00168693          	addi	a3,a3,1
    80006418:	00c787bb          	addw	a5,a5,a2
    8000641c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80006420:	fd5ff06f          	j	800063f4 <_Z11stringToIntPKc+0x14>
    return n;
}
    80006424:	00813403          	ld	s0,8(sp)
    80006428:	01010113          	addi	sp,sp,16
    8000642c:	00008067          	ret

0000000080006430 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80006430:	fc010113          	addi	sp,sp,-64
    80006434:	02113c23          	sd	ra,56(sp)
    80006438:	02813823          	sd	s0,48(sp)
    8000643c:	02913423          	sd	s1,40(sp)
    80006440:	03213023          	sd	s2,32(sp)
    80006444:	01313c23          	sd	s3,24(sp)
    80006448:	04010413          	addi	s0,sp,64
    8000644c:	00050493          	mv	s1,a0
    80006450:	00058913          	mv	s2,a1
    80006454:	00060993          	mv	s3,a2
    LOCK();
    80006458:	00100613          	li	a2,1
    8000645c:	00000593          	li	a1,0
    80006460:	00007517          	auipc	a0,0x7
    80006464:	d1050513          	addi	a0,a0,-752 # 8000d170 <lockPrint>
    80006468:	ffffb097          	auipc	ra,0xffffb
    8000646c:	cbc080e7          	jalr	-836(ra) # 80001124 <copy_and_swap>
    80006470:	00050863          	beqz	a0,80006480 <_Z8printIntiii+0x50>
    80006474:	ffffb097          	auipc	ra,0xffffb
    80006478:	04c080e7          	jalr	76(ra) # 800014c0 <_Z15thread_dispatchv>
    8000647c:	fddff06f          	j	80006458 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80006480:	00098463          	beqz	s3,80006488 <_Z8printIntiii+0x58>
    80006484:	0804c463          	bltz	s1,8000650c <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80006488:	0004851b          	sext.w	a0,s1
    neg = 0;
    8000648c:	00000593          	li	a1,0
    }

    i = 0;
    80006490:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80006494:	0009079b          	sext.w	a5,s2
    80006498:	0325773b          	remuw	a4,a0,s2
    8000649c:	00048613          	mv	a2,s1
    800064a0:	0014849b          	addiw	s1,s1,1
    800064a4:	02071693          	slli	a3,a4,0x20
    800064a8:	0206d693          	srli	a3,a3,0x20
    800064ac:	00007717          	auipc	a4,0x7
    800064b0:	a5470713          	addi	a4,a4,-1452 # 8000cf00 <digits>
    800064b4:	00d70733          	add	a4,a4,a3
    800064b8:	00074683          	lbu	a3,0(a4)
    800064bc:	fd040713          	addi	a4,s0,-48
    800064c0:	00c70733          	add	a4,a4,a2
    800064c4:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800064c8:	0005071b          	sext.w	a4,a0
    800064cc:	0325553b          	divuw	a0,a0,s2
    800064d0:	fcf772e3          	bgeu	a4,a5,80006494 <_Z8printIntiii+0x64>
    if(neg)
    800064d4:	00058c63          	beqz	a1,800064ec <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    800064d8:	fd040793          	addi	a5,s0,-48
    800064dc:	009784b3          	add	s1,a5,s1
    800064e0:	02d00793          	li	a5,45
    800064e4:	fef48823          	sb	a5,-16(s1)
    800064e8:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800064ec:	fff4849b          	addiw	s1,s1,-1
    800064f0:	0204c463          	bltz	s1,80006518 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    800064f4:	fd040793          	addi	a5,s0,-48
    800064f8:	009787b3          	add	a5,a5,s1
    800064fc:	ff07c503          	lbu	a0,-16(a5)
    80006500:	ffffb097          	auipc	ra,0xffffb
    80006504:	128080e7          	jalr	296(ra) # 80001628 <_Z4putcc>
    80006508:	fe5ff06f          	j	800064ec <_Z8printIntiii+0xbc>
        x = -xx;
    8000650c:	4090053b          	negw	a0,s1
        neg = 1;
    80006510:	00100593          	li	a1,1
        x = -xx;
    80006514:	f7dff06f          	j	80006490 <_Z8printIntiii+0x60>

    UNLOCK();
    80006518:	00000613          	li	a2,0
    8000651c:	00100593          	li	a1,1
    80006520:	00007517          	auipc	a0,0x7
    80006524:	c5050513          	addi	a0,a0,-944 # 8000d170 <lockPrint>
    80006528:	ffffb097          	auipc	ra,0xffffb
    8000652c:	bfc080e7          	jalr	-1028(ra) # 80001124 <copy_and_swap>
    80006530:	fe0514e3          	bnez	a0,80006518 <_Z8printIntiii+0xe8>
    80006534:	03813083          	ld	ra,56(sp)
    80006538:	03013403          	ld	s0,48(sp)
    8000653c:	02813483          	ld	s1,40(sp)
    80006540:	02013903          	ld	s2,32(sp)
    80006544:	01813983          	ld	s3,24(sp)
    80006548:	04010113          	addi	sp,sp,64
    8000654c:	00008067          	ret

0000000080006550 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006550:	fd010113          	addi	sp,sp,-48
    80006554:	02113423          	sd	ra,40(sp)
    80006558:	02813023          	sd	s0,32(sp)
    8000655c:	00913c23          	sd	s1,24(sp)
    80006560:	01213823          	sd	s2,16(sp)
    80006564:	01313423          	sd	s3,8(sp)
    80006568:	03010413          	addi	s0,sp,48
    8000656c:	00050493          	mv	s1,a0
    80006570:	00058913          	mv	s2,a1
    80006574:	0015879b          	addiw	a5,a1,1
    80006578:	0007851b          	sext.w	a0,a5
    8000657c:	00f4a023          	sw	a5,0(s1)
    80006580:	0004a823          	sw	zero,16(s1)
    80006584:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006588:	00251513          	slli	a0,a0,0x2
    8000658c:	ffffb097          	auipc	ra,0xffffb
    80006590:	e08080e7          	jalr	-504(ra) # 80001394 <_Z9mem_allocm>
    80006594:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006598:	01000513          	li	a0,16
    8000659c:	ffffd097          	auipc	ra,0xffffd
    800065a0:	a7c080e7          	jalr	-1412(ra) # 80003018 <_Znwm>
    800065a4:	00050993          	mv	s3,a0
    800065a8:	00000593          	li	a1,0
    800065ac:	ffffd097          	auipc	ra,0xffffd
    800065b0:	dd0080e7          	jalr	-560(ra) # 8000337c <_ZN9SemaphoreC1Ej>
    800065b4:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800065b8:	01000513          	li	a0,16
    800065bc:	ffffd097          	auipc	ra,0xffffd
    800065c0:	a5c080e7          	jalr	-1444(ra) # 80003018 <_Znwm>
    800065c4:	00050993          	mv	s3,a0
    800065c8:	00090593          	mv	a1,s2
    800065cc:	ffffd097          	auipc	ra,0xffffd
    800065d0:	db0080e7          	jalr	-592(ra) # 8000337c <_ZN9SemaphoreC1Ej>
    800065d4:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800065d8:	01000513          	li	a0,16
    800065dc:	ffffd097          	auipc	ra,0xffffd
    800065e0:	a3c080e7          	jalr	-1476(ra) # 80003018 <_Znwm>
    800065e4:	00050913          	mv	s2,a0
    800065e8:	00100593          	li	a1,1
    800065ec:	ffffd097          	auipc	ra,0xffffd
    800065f0:	d90080e7          	jalr	-624(ra) # 8000337c <_ZN9SemaphoreC1Ej>
    800065f4:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800065f8:	01000513          	li	a0,16
    800065fc:	ffffd097          	auipc	ra,0xffffd
    80006600:	a1c080e7          	jalr	-1508(ra) # 80003018 <_Znwm>
    80006604:	00050913          	mv	s2,a0
    80006608:	00100593          	li	a1,1
    8000660c:	ffffd097          	auipc	ra,0xffffd
    80006610:	d70080e7          	jalr	-656(ra) # 8000337c <_ZN9SemaphoreC1Ej>
    80006614:	0324b823          	sd	s2,48(s1)
}
    80006618:	02813083          	ld	ra,40(sp)
    8000661c:	02013403          	ld	s0,32(sp)
    80006620:	01813483          	ld	s1,24(sp)
    80006624:	01013903          	ld	s2,16(sp)
    80006628:	00813983          	ld	s3,8(sp)
    8000662c:	03010113          	addi	sp,sp,48
    80006630:	00008067          	ret
    80006634:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006638:	00098513          	mv	a0,s3
    8000663c:	ffffd097          	auipc	ra,0xffffd
    80006640:	a2c080e7          	jalr	-1492(ra) # 80003068 <_ZdlPv>
    80006644:	00048513          	mv	a0,s1
    80006648:	00008097          	auipc	ra,0x8
    8000664c:	c20080e7          	jalr	-992(ra) # 8000e268 <_Unwind_Resume>
    80006650:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006654:	00098513          	mv	a0,s3
    80006658:	ffffd097          	auipc	ra,0xffffd
    8000665c:	a10080e7          	jalr	-1520(ra) # 80003068 <_ZdlPv>
    80006660:	00048513          	mv	a0,s1
    80006664:	00008097          	auipc	ra,0x8
    80006668:	c04080e7          	jalr	-1020(ra) # 8000e268 <_Unwind_Resume>
    8000666c:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006670:	00090513          	mv	a0,s2
    80006674:	ffffd097          	auipc	ra,0xffffd
    80006678:	9f4080e7          	jalr	-1548(ra) # 80003068 <_ZdlPv>
    8000667c:	00048513          	mv	a0,s1
    80006680:	00008097          	auipc	ra,0x8
    80006684:	be8080e7          	jalr	-1048(ra) # 8000e268 <_Unwind_Resume>
    80006688:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    8000668c:	00090513          	mv	a0,s2
    80006690:	ffffd097          	auipc	ra,0xffffd
    80006694:	9d8080e7          	jalr	-1576(ra) # 80003068 <_ZdlPv>
    80006698:	00048513          	mv	a0,s1
    8000669c:	00008097          	auipc	ra,0x8
    800066a0:	bcc080e7          	jalr	-1076(ra) # 8000e268 <_Unwind_Resume>

00000000800066a4 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800066a4:	fe010113          	addi	sp,sp,-32
    800066a8:	00113c23          	sd	ra,24(sp)
    800066ac:	00813823          	sd	s0,16(sp)
    800066b0:	00913423          	sd	s1,8(sp)
    800066b4:	01213023          	sd	s2,0(sp)
    800066b8:	02010413          	addi	s0,sp,32
    800066bc:	00050493          	mv	s1,a0
    800066c0:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800066c4:	01853503          	ld	a0,24(a0)
    800066c8:	ffffd097          	auipc	ra,0xffffd
    800066cc:	cec080e7          	jalr	-788(ra) # 800033b4 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800066d0:	0304b503          	ld	a0,48(s1)
    800066d4:	ffffd097          	auipc	ra,0xffffd
    800066d8:	ce0080e7          	jalr	-800(ra) # 800033b4 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800066dc:	0084b783          	ld	a5,8(s1)
    800066e0:	0144a703          	lw	a4,20(s1)
    800066e4:	00271713          	slli	a4,a4,0x2
    800066e8:	00e787b3          	add	a5,a5,a4
    800066ec:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800066f0:	0144a783          	lw	a5,20(s1)
    800066f4:	0017879b          	addiw	a5,a5,1
    800066f8:	0004a703          	lw	a4,0(s1)
    800066fc:	02e7e7bb          	remw	a5,a5,a4
    80006700:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006704:	0304b503          	ld	a0,48(s1)
    80006708:	ffffd097          	auipc	ra,0xffffd
    8000670c:	cd8080e7          	jalr	-808(ra) # 800033e0 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006710:	0204b503          	ld	a0,32(s1)
    80006714:	ffffd097          	auipc	ra,0xffffd
    80006718:	ccc080e7          	jalr	-820(ra) # 800033e0 <_ZN9Semaphore6signalEv>

}
    8000671c:	01813083          	ld	ra,24(sp)
    80006720:	01013403          	ld	s0,16(sp)
    80006724:	00813483          	ld	s1,8(sp)
    80006728:	00013903          	ld	s2,0(sp)
    8000672c:	02010113          	addi	sp,sp,32
    80006730:	00008067          	ret

0000000080006734 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006734:	fe010113          	addi	sp,sp,-32
    80006738:	00113c23          	sd	ra,24(sp)
    8000673c:	00813823          	sd	s0,16(sp)
    80006740:	00913423          	sd	s1,8(sp)
    80006744:	01213023          	sd	s2,0(sp)
    80006748:	02010413          	addi	s0,sp,32
    8000674c:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006750:	02053503          	ld	a0,32(a0)
    80006754:	ffffd097          	auipc	ra,0xffffd
    80006758:	c60080e7          	jalr	-928(ra) # 800033b4 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    8000675c:	0284b503          	ld	a0,40(s1)
    80006760:	ffffd097          	auipc	ra,0xffffd
    80006764:	c54080e7          	jalr	-940(ra) # 800033b4 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80006768:	0084b703          	ld	a4,8(s1)
    8000676c:	0104a783          	lw	a5,16(s1)
    80006770:	00279693          	slli	a3,a5,0x2
    80006774:	00d70733          	add	a4,a4,a3
    80006778:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000677c:	0017879b          	addiw	a5,a5,1
    80006780:	0004a703          	lw	a4,0(s1)
    80006784:	02e7e7bb          	remw	a5,a5,a4
    80006788:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    8000678c:	0284b503          	ld	a0,40(s1)
    80006790:	ffffd097          	auipc	ra,0xffffd
    80006794:	c50080e7          	jalr	-944(ra) # 800033e0 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006798:	0184b503          	ld	a0,24(s1)
    8000679c:	ffffd097          	auipc	ra,0xffffd
    800067a0:	c44080e7          	jalr	-956(ra) # 800033e0 <_ZN9Semaphore6signalEv>

    return ret;
}
    800067a4:	00090513          	mv	a0,s2
    800067a8:	01813083          	ld	ra,24(sp)
    800067ac:	01013403          	ld	s0,16(sp)
    800067b0:	00813483          	ld	s1,8(sp)
    800067b4:	00013903          	ld	s2,0(sp)
    800067b8:	02010113          	addi	sp,sp,32
    800067bc:	00008067          	ret

00000000800067c0 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800067c0:	fe010113          	addi	sp,sp,-32
    800067c4:	00113c23          	sd	ra,24(sp)
    800067c8:	00813823          	sd	s0,16(sp)
    800067cc:	00913423          	sd	s1,8(sp)
    800067d0:	01213023          	sd	s2,0(sp)
    800067d4:	02010413          	addi	s0,sp,32
    800067d8:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800067dc:	02853503          	ld	a0,40(a0)
    800067e0:	ffffd097          	auipc	ra,0xffffd
    800067e4:	bd4080e7          	jalr	-1068(ra) # 800033b4 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800067e8:	0304b503          	ld	a0,48(s1)
    800067ec:	ffffd097          	auipc	ra,0xffffd
    800067f0:	bc8080e7          	jalr	-1080(ra) # 800033b4 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800067f4:	0144a783          	lw	a5,20(s1)
    800067f8:	0104a903          	lw	s2,16(s1)
    800067fc:	0327ce63          	blt	a5,s2,80006838 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006800:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006804:	0304b503          	ld	a0,48(s1)
    80006808:	ffffd097          	auipc	ra,0xffffd
    8000680c:	bd8080e7          	jalr	-1064(ra) # 800033e0 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006810:	0284b503          	ld	a0,40(s1)
    80006814:	ffffd097          	auipc	ra,0xffffd
    80006818:	bcc080e7          	jalr	-1076(ra) # 800033e0 <_ZN9Semaphore6signalEv>

    return ret;
}
    8000681c:	00090513          	mv	a0,s2
    80006820:	01813083          	ld	ra,24(sp)
    80006824:	01013403          	ld	s0,16(sp)
    80006828:	00813483          	ld	s1,8(sp)
    8000682c:	00013903          	ld	s2,0(sp)
    80006830:	02010113          	addi	sp,sp,32
    80006834:	00008067          	ret
        ret = cap - head + tail;
    80006838:	0004a703          	lw	a4,0(s1)
    8000683c:	4127093b          	subw	s2,a4,s2
    80006840:	00f9093b          	addw	s2,s2,a5
    80006844:	fc1ff06f          	j	80006804 <_ZN9BufferCPP6getCntEv+0x44>

0000000080006848 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006848:	fe010113          	addi	sp,sp,-32
    8000684c:	00113c23          	sd	ra,24(sp)
    80006850:	00813823          	sd	s0,16(sp)
    80006854:	00913423          	sd	s1,8(sp)
    80006858:	02010413          	addi	s0,sp,32
    8000685c:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006860:	00a00513          	li	a0,10
    80006864:	ffffd097          	auipc	ra,0xffffd
    80006868:	c40080e7          	jalr	-960(ra) # 800034a4 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    8000686c:	00004517          	auipc	a0,0x4
    80006870:	c7450513          	addi	a0,a0,-908 # 8000a4e0 <CONSOLE_STATUS+0x4d0>
    80006874:	00000097          	auipc	ra,0x0
    80006878:	a0c080e7          	jalr	-1524(ra) # 80006280 <_Z11printStringPKc>
    while (getCnt()) {
    8000687c:	00048513          	mv	a0,s1
    80006880:	00000097          	auipc	ra,0x0
    80006884:	f40080e7          	jalr	-192(ra) # 800067c0 <_ZN9BufferCPP6getCntEv>
    80006888:	02050c63          	beqz	a0,800068c0 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    8000688c:	0084b783          	ld	a5,8(s1)
    80006890:	0104a703          	lw	a4,16(s1)
    80006894:	00271713          	slli	a4,a4,0x2
    80006898:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    8000689c:	0007c503          	lbu	a0,0(a5)
    800068a0:	ffffd097          	auipc	ra,0xffffd
    800068a4:	c04080e7          	jalr	-1020(ra) # 800034a4 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800068a8:	0104a783          	lw	a5,16(s1)
    800068ac:	0017879b          	addiw	a5,a5,1
    800068b0:	0004a703          	lw	a4,0(s1)
    800068b4:	02e7e7bb          	remw	a5,a5,a4
    800068b8:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800068bc:	fc1ff06f          	j	8000687c <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800068c0:	02100513          	li	a0,33
    800068c4:	ffffd097          	auipc	ra,0xffffd
    800068c8:	be0080e7          	jalr	-1056(ra) # 800034a4 <_ZN7Console4putcEc>
    Console::putc('\n');
    800068cc:	00a00513          	li	a0,10
    800068d0:	ffffd097          	auipc	ra,0xffffd
    800068d4:	bd4080e7          	jalr	-1068(ra) # 800034a4 <_ZN7Console4putcEc>
    mem_free(buffer);
    800068d8:	0084b503          	ld	a0,8(s1)
    800068dc:	ffffb097          	auipc	ra,0xffffb
    800068e0:	af8080e7          	jalr	-1288(ra) # 800013d4 <_Z8mem_freePv>
    delete itemAvailable;
    800068e4:	0204b503          	ld	a0,32(s1)
    800068e8:	00050863          	beqz	a0,800068f8 <_ZN9BufferCPPD1Ev+0xb0>
    800068ec:	00053783          	ld	a5,0(a0)
    800068f0:	0087b783          	ld	a5,8(a5)
    800068f4:	000780e7          	jalr	a5
    delete spaceAvailable;
    800068f8:	0184b503          	ld	a0,24(s1)
    800068fc:	00050863          	beqz	a0,8000690c <_ZN9BufferCPPD1Ev+0xc4>
    80006900:	00053783          	ld	a5,0(a0)
    80006904:	0087b783          	ld	a5,8(a5)
    80006908:	000780e7          	jalr	a5
    delete mutexTail;
    8000690c:	0304b503          	ld	a0,48(s1)
    80006910:	00050863          	beqz	a0,80006920 <_ZN9BufferCPPD1Ev+0xd8>
    80006914:	00053783          	ld	a5,0(a0)
    80006918:	0087b783          	ld	a5,8(a5)
    8000691c:	000780e7          	jalr	a5
    delete mutexHead;
    80006920:	0284b503          	ld	a0,40(s1)
    80006924:	00050863          	beqz	a0,80006934 <_ZN9BufferCPPD1Ev+0xec>
    80006928:	00053783          	ld	a5,0(a0)
    8000692c:	0087b783          	ld	a5,8(a5)
    80006930:	000780e7          	jalr	a5
}
    80006934:	01813083          	ld	ra,24(sp)
    80006938:	01013403          	ld	s0,16(sp)
    8000693c:	00813483          	ld	s1,8(sp)
    80006940:	02010113          	addi	sp,sp,32
    80006944:	00008067          	ret

0000000080006948 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80006948:	fe010113          	addi	sp,sp,-32
    8000694c:	00113c23          	sd	ra,24(sp)
    80006950:	00813823          	sd	s0,16(sp)
    80006954:	00913423          	sd	s1,8(sp)
    80006958:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    8000695c:	00004517          	auipc	a0,0x4
    80006960:	b9c50513          	addi	a0,a0,-1124 # 8000a4f8 <CONSOLE_STATUS+0x4e8>
    80006964:	00000097          	auipc	ra,0x0
    80006968:	91c080e7          	jalr	-1764(ra) # 80006280 <_Z11printStringPKc>
    int test = getc() - '0';
    8000696c:	ffffb097          	auipc	ra,0xffffb
    80006970:	c94080e7          	jalr	-876(ra) # 80001600 <_Z4getcv>
    80006974:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80006978:	ffffb097          	auipc	ra,0xffffb
    8000697c:	c88080e7          	jalr	-888(ra) # 80001600 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006980:	00700793          	li	a5,7
    80006984:	1097e263          	bltu	a5,s1,80006a88 <_Z8userMainv+0x140>
    80006988:	00249493          	slli	s1,s1,0x2
    8000698c:	00004717          	auipc	a4,0x4
    80006990:	dc470713          	addi	a4,a4,-572 # 8000a750 <CONSOLE_STATUS+0x740>
    80006994:	00e484b3          	add	s1,s1,a4
    80006998:	0004a783          	lw	a5,0(s1)
    8000699c:	00e787b3          	add	a5,a5,a4
    800069a0:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    800069a4:	fffff097          	auipc	ra,0xfffff
    800069a8:	f54080e7          	jalr	-172(ra) # 800058f8 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    800069ac:	00004517          	auipc	a0,0x4
    800069b0:	b6c50513          	addi	a0,a0,-1172 # 8000a518 <CONSOLE_STATUS+0x508>
    800069b4:	00000097          	auipc	ra,0x0
    800069b8:	8cc080e7          	jalr	-1844(ra) # 80006280 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    800069bc:	01813083          	ld	ra,24(sp)
    800069c0:	01013403          	ld	s0,16(sp)
    800069c4:	00813483          	ld	s1,8(sp)
    800069c8:	02010113          	addi	sp,sp,32
    800069cc:	00008067          	ret
            Threads_CPP_API_test();
    800069d0:	ffffe097          	auipc	ra,0xffffe
    800069d4:	e08080e7          	jalr	-504(ra) # 800047d8 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    800069d8:	00004517          	auipc	a0,0x4
    800069dc:	b8050513          	addi	a0,a0,-1152 # 8000a558 <CONSOLE_STATUS+0x548>
    800069e0:	00000097          	auipc	ra,0x0
    800069e4:	8a0080e7          	jalr	-1888(ra) # 80006280 <_Z11printStringPKc>
            break;
    800069e8:	fd5ff06f          	j	800069bc <_Z8userMainv+0x74>
            producerConsumer_C_API();
    800069ec:	ffffd097          	auipc	ra,0xffffd
    800069f0:	640080e7          	jalr	1600(ra) # 8000402c <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    800069f4:	00004517          	auipc	a0,0x4
    800069f8:	ba450513          	addi	a0,a0,-1116 # 8000a598 <CONSOLE_STATUS+0x588>
    800069fc:	00000097          	auipc	ra,0x0
    80006a00:	884080e7          	jalr	-1916(ra) # 80006280 <_Z11printStringPKc>
            break;
    80006a04:	fb9ff06f          	j	800069bc <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006a08:	fffff097          	auipc	ra,0xfffff
    80006a0c:	234080e7          	jalr	564(ra) # 80005c3c <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006a10:	00004517          	auipc	a0,0x4
    80006a14:	bd850513          	addi	a0,a0,-1064 # 8000a5e8 <CONSOLE_STATUS+0x5d8>
    80006a18:	00000097          	auipc	ra,0x0
    80006a1c:	868080e7          	jalr	-1944(ra) # 80006280 <_Z11printStringPKc>
            break;
    80006a20:	f9dff06f          	j	800069bc <_Z8userMainv+0x74>
            testSleeping();
    80006a24:	00000097          	auipc	ra,0x0
    80006a28:	11c080e7          	jalr	284(ra) # 80006b40 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006a2c:	00004517          	auipc	a0,0x4
    80006a30:	c1450513          	addi	a0,a0,-1004 # 8000a640 <CONSOLE_STATUS+0x630>
    80006a34:	00000097          	auipc	ra,0x0
    80006a38:	84c080e7          	jalr	-1972(ra) # 80006280 <_Z11printStringPKc>
            break;
    80006a3c:	f81ff06f          	j	800069bc <_Z8userMainv+0x74>
            testConsumerProducer();
    80006a40:	ffffe097          	auipc	ra,0xffffe
    80006a44:	258080e7          	jalr	600(ra) # 80004c98 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006a48:	00004517          	auipc	a0,0x4
    80006a4c:	c2850513          	addi	a0,a0,-984 # 8000a670 <CONSOLE_STATUS+0x660>
    80006a50:	00000097          	auipc	ra,0x0
    80006a54:	830080e7          	jalr	-2000(ra) # 80006280 <_Z11printStringPKc>
            break;
    80006a58:	f65ff06f          	j	800069bc <_Z8userMainv+0x74>
            System_Mode_test();
    80006a5c:	00000097          	auipc	ra,0x0
    80006a60:	658080e7          	jalr	1624(ra) # 800070b4 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006a64:	00004517          	auipc	a0,0x4
    80006a68:	c4c50513          	addi	a0,a0,-948 # 8000a6b0 <CONSOLE_STATUS+0x6a0>
    80006a6c:	00000097          	auipc	ra,0x0
    80006a70:	814080e7          	jalr	-2028(ra) # 80006280 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006a74:	00004517          	auipc	a0,0x4
    80006a78:	c5c50513          	addi	a0,a0,-932 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80006a7c:	00000097          	auipc	ra,0x0
    80006a80:	804080e7          	jalr	-2044(ra) # 80006280 <_Z11printStringPKc>
            break;
    80006a84:	f39ff06f          	j	800069bc <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80006a88:	00004517          	auipc	a0,0x4
    80006a8c:	ca050513          	addi	a0,a0,-864 # 8000a728 <CONSOLE_STATUS+0x718>
    80006a90:	fffff097          	auipc	ra,0xfffff
    80006a94:	7f0080e7          	jalr	2032(ra) # 80006280 <_Z11printStringPKc>
    80006a98:	f25ff06f          	j	800069bc <_Z8userMainv+0x74>

0000000080006a9c <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006a9c:	fe010113          	addi	sp,sp,-32
    80006aa0:	00113c23          	sd	ra,24(sp)
    80006aa4:	00813823          	sd	s0,16(sp)
    80006aa8:	00913423          	sd	s1,8(sp)
    80006aac:	01213023          	sd	s2,0(sp)
    80006ab0:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006ab4:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006ab8:	00600493          	li	s1,6
    while (--i > 0) {
    80006abc:	fff4849b          	addiw	s1,s1,-1
    80006ac0:	04905463          	blez	s1,80006b08 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006ac4:	00004517          	auipc	a0,0x4
    80006ac8:	cac50513          	addi	a0,a0,-852 # 8000a770 <CONSOLE_STATUS+0x760>
    80006acc:	fffff097          	auipc	ra,0xfffff
    80006ad0:	7b4080e7          	jalr	1972(ra) # 80006280 <_Z11printStringPKc>
        printInt(sleep_time);
    80006ad4:	00000613          	li	a2,0
    80006ad8:	00a00593          	li	a1,10
    80006adc:	0009051b          	sext.w	a0,s2
    80006ae0:	00000097          	auipc	ra,0x0
    80006ae4:	950080e7          	jalr	-1712(ra) # 80006430 <_Z8printIntiii>
        printString(" !\n");
    80006ae8:	00004517          	auipc	a0,0x4
    80006aec:	c9050513          	addi	a0,a0,-880 # 8000a778 <CONSOLE_STATUS+0x768>
    80006af0:	fffff097          	auipc	ra,0xfffff
    80006af4:	790080e7          	jalr	1936(ra) # 80006280 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006af8:	00090513          	mv	a0,s2
    80006afc:	ffffb097          	auipc	ra,0xffffb
    80006b00:	a0c080e7          	jalr	-1524(ra) # 80001508 <_Z10time_sleepm>
    while (--i > 0) {
    80006b04:	fb9ff06f          	j	80006abc <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006b08:	00a00793          	li	a5,10
    80006b0c:	02f95933          	divu	s2,s2,a5
    80006b10:	fff90913          	addi	s2,s2,-1
    80006b14:	00006797          	auipc	a5,0x6
    80006b18:	66478793          	addi	a5,a5,1636 # 8000d178 <_ZL8finished>
    80006b1c:	01278933          	add	s2,a5,s2
    80006b20:	00100793          	li	a5,1
    80006b24:	00f90023          	sb	a5,0(s2)
}
    80006b28:	01813083          	ld	ra,24(sp)
    80006b2c:	01013403          	ld	s0,16(sp)
    80006b30:	00813483          	ld	s1,8(sp)
    80006b34:	00013903          	ld	s2,0(sp)
    80006b38:	02010113          	addi	sp,sp,32
    80006b3c:	00008067          	ret

0000000080006b40 <_Z12testSleepingv>:

void testSleeping() {
    80006b40:	fc010113          	addi	sp,sp,-64
    80006b44:	02113c23          	sd	ra,56(sp)
    80006b48:	02813823          	sd	s0,48(sp)
    80006b4c:	02913423          	sd	s1,40(sp)
    80006b50:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006b54:	00a00793          	li	a5,10
    80006b58:	fcf43823          	sd	a5,-48(s0)
    80006b5c:	01400793          	li	a5,20
    80006b60:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006b64:	00000493          	li	s1,0
    80006b68:	02c0006f          	j	80006b94 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006b6c:	00349793          	slli	a5,s1,0x3
    80006b70:	fd040613          	addi	a2,s0,-48
    80006b74:	00f60633          	add	a2,a2,a5
    80006b78:	00000597          	auipc	a1,0x0
    80006b7c:	f2458593          	addi	a1,a1,-220 # 80006a9c <_ZL9sleepyRunPv>
    80006b80:	fc040513          	addi	a0,s0,-64
    80006b84:	00f50533          	add	a0,a0,a5
    80006b88:	ffffb097          	auipc	ra,0xffffb
    80006b8c:	87c080e7          	jalr	-1924(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006b90:	0014849b          	addiw	s1,s1,1
    80006b94:	00100793          	li	a5,1
    80006b98:	fc97dae3          	bge	a5,s1,80006b6c <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006b9c:	00006797          	auipc	a5,0x6
    80006ba0:	5dc7c783          	lbu	a5,1500(a5) # 8000d178 <_ZL8finished>
    80006ba4:	fe078ce3          	beqz	a5,80006b9c <_Z12testSleepingv+0x5c>
    80006ba8:	00006797          	auipc	a5,0x6
    80006bac:	5d17c783          	lbu	a5,1489(a5) # 8000d179 <_ZL8finished+0x1>
    80006bb0:	fe0786e3          	beqz	a5,80006b9c <_Z12testSleepingv+0x5c>
}
    80006bb4:	03813083          	ld	ra,56(sp)
    80006bb8:	03013403          	ld	s0,48(sp)
    80006bbc:	02813483          	ld	s1,40(sp)
    80006bc0:	04010113          	addi	sp,sp,64
    80006bc4:	00008067          	ret

0000000080006bc8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006bc8:	fe010113          	addi	sp,sp,-32
    80006bcc:	00113c23          	sd	ra,24(sp)
    80006bd0:	00813823          	sd	s0,16(sp)
    80006bd4:	00913423          	sd	s1,8(sp)
    80006bd8:	01213023          	sd	s2,0(sp)
    80006bdc:	02010413          	addi	s0,sp,32
    80006be0:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006be4:	00100793          	li	a5,1
    80006be8:	02a7f863          	bgeu	a5,a0,80006c18 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006bec:	00a00793          	li	a5,10
    80006bf0:	02f577b3          	remu	a5,a0,a5
    80006bf4:	02078e63          	beqz	a5,80006c30 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006bf8:	fff48513          	addi	a0,s1,-1
    80006bfc:	00000097          	auipc	ra,0x0
    80006c00:	fcc080e7          	jalr	-52(ra) # 80006bc8 <_ZL9fibonaccim>
    80006c04:	00050913          	mv	s2,a0
    80006c08:	ffe48513          	addi	a0,s1,-2
    80006c0c:	00000097          	auipc	ra,0x0
    80006c10:	fbc080e7          	jalr	-68(ra) # 80006bc8 <_ZL9fibonaccim>
    80006c14:	00a90533          	add	a0,s2,a0
}
    80006c18:	01813083          	ld	ra,24(sp)
    80006c1c:	01013403          	ld	s0,16(sp)
    80006c20:	00813483          	ld	s1,8(sp)
    80006c24:	00013903          	ld	s2,0(sp)
    80006c28:	02010113          	addi	sp,sp,32
    80006c2c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006c30:	ffffb097          	auipc	ra,0xffffb
    80006c34:	890080e7          	jalr	-1904(ra) # 800014c0 <_Z15thread_dispatchv>
    80006c38:	fc1ff06f          	j	80006bf8 <_ZL9fibonaccim+0x30>

0000000080006c3c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006c3c:	fe010113          	addi	sp,sp,-32
    80006c40:	00113c23          	sd	ra,24(sp)
    80006c44:	00813823          	sd	s0,16(sp)
    80006c48:	00913423          	sd	s1,8(sp)
    80006c4c:	01213023          	sd	s2,0(sp)
    80006c50:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006c54:	00a00493          	li	s1,10
    80006c58:	0400006f          	j	80006c98 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006c5c:	00003517          	auipc	a0,0x3
    80006c60:	7ec50513          	addi	a0,a0,2028 # 8000a448 <CONSOLE_STATUS+0x438>
    80006c64:	fffff097          	auipc	ra,0xfffff
    80006c68:	61c080e7          	jalr	1564(ra) # 80006280 <_Z11printStringPKc>
    80006c6c:	00000613          	li	a2,0
    80006c70:	00a00593          	li	a1,10
    80006c74:	00048513          	mv	a0,s1
    80006c78:	fffff097          	auipc	ra,0xfffff
    80006c7c:	7b8080e7          	jalr	1976(ra) # 80006430 <_Z8printIntiii>
    80006c80:	00004517          	auipc	a0,0x4
    80006c84:	9b850513          	addi	a0,a0,-1608 # 8000a638 <CONSOLE_STATUS+0x628>
    80006c88:	fffff097          	auipc	ra,0xfffff
    80006c8c:	5f8080e7          	jalr	1528(ra) # 80006280 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006c90:	0014849b          	addiw	s1,s1,1
    80006c94:	0ff4f493          	andi	s1,s1,255
    80006c98:	00c00793          	li	a5,12
    80006c9c:	fc97f0e3          	bgeu	a5,s1,80006c5c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006ca0:	00003517          	auipc	a0,0x3
    80006ca4:	7b050513          	addi	a0,a0,1968 # 8000a450 <CONSOLE_STATUS+0x440>
    80006ca8:	fffff097          	auipc	ra,0xfffff
    80006cac:	5d8080e7          	jalr	1496(ra) # 80006280 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006cb0:	00500313          	li	t1,5
    thread_dispatch();
    80006cb4:	ffffb097          	auipc	ra,0xffffb
    80006cb8:	80c080e7          	jalr	-2036(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006cbc:	01000513          	li	a0,16
    80006cc0:	00000097          	auipc	ra,0x0
    80006cc4:	f08080e7          	jalr	-248(ra) # 80006bc8 <_ZL9fibonaccim>
    80006cc8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006ccc:	00003517          	auipc	a0,0x3
    80006cd0:	79450513          	addi	a0,a0,1940 # 8000a460 <CONSOLE_STATUS+0x450>
    80006cd4:	fffff097          	auipc	ra,0xfffff
    80006cd8:	5ac080e7          	jalr	1452(ra) # 80006280 <_Z11printStringPKc>
    80006cdc:	00000613          	li	a2,0
    80006ce0:	00a00593          	li	a1,10
    80006ce4:	0009051b          	sext.w	a0,s2
    80006ce8:	fffff097          	auipc	ra,0xfffff
    80006cec:	748080e7          	jalr	1864(ra) # 80006430 <_Z8printIntiii>
    80006cf0:	00004517          	auipc	a0,0x4
    80006cf4:	94850513          	addi	a0,a0,-1720 # 8000a638 <CONSOLE_STATUS+0x628>
    80006cf8:	fffff097          	auipc	ra,0xfffff
    80006cfc:	588080e7          	jalr	1416(ra) # 80006280 <_Z11printStringPKc>
    80006d00:	0400006f          	j	80006d40 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006d04:	00003517          	auipc	a0,0x3
    80006d08:	74450513          	addi	a0,a0,1860 # 8000a448 <CONSOLE_STATUS+0x438>
    80006d0c:	fffff097          	auipc	ra,0xfffff
    80006d10:	574080e7          	jalr	1396(ra) # 80006280 <_Z11printStringPKc>
    80006d14:	00000613          	li	a2,0
    80006d18:	00a00593          	li	a1,10
    80006d1c:	00048513          	mv	a0,s1
    80006d20:	fffff097          	auipc	ra,0xfffff
    80006d24:	710080e7          	jalr	1808(ra) # 80006430 <_Z8printIntiii>
    80006d28:	00004517          	auipc	a0,0x4
    80006d2c:	91050513          	addi	a0,a0,-1776 # 8000a638 <CONSOLE_STATUS+0x628>
    80006d30:	fffff097          	auipc	ra,0xfffff
    80006d34:	550080e7          	jalr	1360(ra) # 80006280 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006d38:	0014849b          	addiw	s1,s1,1
    80006d3c:	0ff4f493          	andi	s1,s1,255
    80006d40:	00f00793          	li	a5,15
    80006d44:	fc97f0e3          	bgeu	a5,s1,80006d04 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006d48:	00003517          	auipc	a0,0x3
    80006d4c:	72850513          	addi	a0,a0,1832 # 8000a470 <CONSOLE_STATUS+0x460>
    80006d50:	fffff097          	auipc	ra,0xfffff
    80006d54:	530080e7          	jalr	1328(ra) # 80006280 <_Z11printStringPKc>
    finishedD = true;
    80006d58:	00100793          	li	a5,1
    80006d5c:	00006717          	auipc	a4,0x6
    80006d60:	40f70f23          	sb	a5,1054(a4) # 8000d17a <_ZL9finishedD>
    thread_dispatch();
    80006d64:	ffffa097          	auipc	ra,0xffffa
    80006d68:	75c080e7          	jalr	1884(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80006d6c:	01813083          	ld	ra,24(sp)
    80006d70:	01013403          	ld	s0,16(sp)
    80006d74:	00813483          	ld	s1,8(sp)
    80006d78:	00013903          	ld	s2,0(sp)
    80006d7c:	02010113          	addi	sp,sp,32
    80006d80:	00008067          	ret

0000000080006d84 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006d84:	fe010113          	addi	sp,sp,-32
    80006d88:	00113c23          	sd	ra,24(sp)
    80006d8c:	00813823          	sd	s0,16(sp)
    80006d90:	00913423          	sd	s1,8(sp)
    80006d94:	01213023          	sd	s2,0(sp)
    80006d98:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006d9c:	00000493          	li	s1,0
    80006da0:	0400006f          	j	80006de0 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006da4:	00003517          	auipc	a0,0x3
    80006da8:	66450513          	addi	a0,a0,1636 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80006dac:	fffff097          	auipc	ra,0xfffff
    80006db0:	4d4080e7          	jalr	1236(ra) # 80006280 <_Z11printStringPKc>
    80006db4:	00000613          	li	a2,0
    80006db8:	00a00593          	li	a1,10
    80006dbc:	00048513          	mv	a0,s1
    80006dc0:	fffff097          	auipc	ra,0xfffff
    80006dc4:	670080e7          	jalr	1648(ra) # 80006430 <_Z8printIntiii>
    80006dc8:	00004517          	auipc	a0,0x4
    80006dcc:	87050513          	addi	a0,a0,-1936 # 8000a638 <CONSOLE_STATUS+0x628>
    80006dd0:	fffff097          	auipc	ra,0xfffff
    80006dd4:	4b0080e7          	jalr	1200(ra) # 80006280 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006dd8:	0014849b          	addiw	s1,s1,1
    80006ddc:	0ff4f493          	andi	s1,s1,255
    80006de0:	00200793          	li	a5,2
    80006de4:	fc97f0e3          	bgeu	a5,s1,80006da4 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006de8:	00003517          	auipc	a0,0x3
    80006dec:	62850513          	addi	a0,a0,1576 # 8000a410 <CONSOLE_STATUS+0x400>
    80006df0:	fffff097          	auipc	ra,0xfffff
    80006df4:	490080e7          	jalr	1168(ra) # 80006280 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006df8:	00700313          	li	t1,7
    thread_dispatch();
    80006dfc:	ffffa097          	auipc	ra,0xffffa
    80006e00:	6c4080e7          	jalr	1732(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006e04:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006e08:	00003517          	auipc	a0,0x3
    80006e0c:	61850513          	addi	a0,a0,1560 # 8000a420 <CONSOLE_STATUS+0x410>
    80006e10:	fffff097          	auipc	ra,0xfffff
    80006e14:	470080e7          	jalr	1136(ra) # 80006280 <_Z11printStringPKc>
    80006e18:	00000613          	li	a2,0
    80006e1c:	00a00593          	li	a1,10
    80006e20:	0009051b          	sext.w	a0,s2
    80006e24:	fffff097          	auipc	ra,0xfffff
    80006e28:	60c080e7          	jalr	1548(ra) # 80006430 <_Z8printIntiii>
    80006e2c:	00004517          	auipc	a0,0x4
    80006e30:	80c50513          	addi	a0,a0,-2036 # 8000a638 <CONSOLE_STATUS+0x628>
    80006e34:	fffff097          	auipc	ra,0xfffff
    80006e38:	44c080e7          	jalr	1100(ra) # 80006280 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006e3c:	00c00513          	li	a0,12
    80006e40:	00000097          	auipc	ra,0x0
    80006e44:	d88080e7          	jalr	-632(ra) # 80006bc8 <_ZL9fibonaccim>
    80006e48:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006e4c:	00003517          	auipc	a0,0x3
    80006e50:	5dc50513          	addi	a0,a0,1500 # 8000a428 <CONSOLE_STATUS+0x418>
    80006e54:	fffff097          	auipc	ra,0xfffff
    80006e58:	42c080e7          	jalr	1068(ra) # 80006280 <_Z11printStringPKc>
    80006e5c:	00000613          	li	a2,0
    80006e60:	00a00593          	li	a1,10
    80006e64:	0009051b          	sext.w	a0,s2
    80006e68:	fffff097          	auipc	ra,0xfffff
    80006e6c:	5c8080e7          	jalr	1480(ra) # 80006430 <_Z8printIntiii>
    80006e70:	00003517          	auipc	a0,0x3
    80006e74:	7c850513          	addi	a0,a0,1992 # 8000a638 <CONSOLE_STATUS+0x628>
    80006e78:	fffff097          	auipc	ra,0xfffff
    80006e7c:	408080e7          	jalr	1032(ra) # 80006280 <_Z11printStringPKc>
    80006e80:	0400006f          	j	80006ec0 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006e84:	00003517          	auipc	a0,0x3
    80006e88:	58450513          	addi	a0,a0,1412 # 8000a408 <CONSOLE_STATUS+0x3f8>
    80006e8c:	fffff097          	auipc	ra,0xfffff
    80006e90:	3f4080e7          	jalr	1012(ra) # 80006280 <_Z11printStringPKc>
    80006e94:	00000613          	li	a2,0
    80006e98:	00a00593          	li	a1,10
    80006e9c:	00048513          	mv	a0,s1
    80006ea0:	fffff097          	auipc	ra,0xfffff
    80006ea4:	590080e7          	jalr	1424(ra) # 80006430 <_Z8printIntiii>
    80006ea8:	00003517          	auipc	a0,0x3
    80006eac:	79050513          	addi	a0,a0,1936 # 8000a638 <CONSOLE_STATUS+0x628>
    80006eb0:	fffff097          	auipc	ra,0xfffff
    80006eb4:	3d0080e7          	jalr	976(ra) # 80006280 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006eb8:	0014849b          	addiw	s1,s1,1
    80006ebc:	0ff4f493          	andi	s1,s1,255
    80006ec0:	00500793          	li	a5,5
    80006ec4:	fc97f0e3          	bgeu	a5,s1,80006e84 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006ec8:	00003517          	auipc	a0,0x3
    80006ecc:	51850513          	addi	a0,a0,1304 # 8000a3e0 <CONSOLE_STATUS+0x3d0>
    80006ed0:	fffff097          	auipc	ra,0xfffff
    80006ed4:	3b0080e7          	jalr	944(ra) # 80006280 <_Z11printStringPKc>
    finishedC = true;
    80006ed8:	00100793          	li	a5,1
    80006edc:	00006717          	auipc	a4,0x6
    80006ee0:	28f70fa3          	sb	a5,671(a4) # 8000d17b <_ZL9finishedC>
    thread_dispatch();
    80006ee4:	ffffa097          	auipc	ra,0xffffa
    80006ee8:	5dc080e7          	jalr	1500(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80006eec:	01813083          	ld	ra,24(sp)
    80006ef0:	01013403          	ld	s0,16(sp)
    80006ef4:	00813483          	ld	s1,8(sp)
    80006ef8:	00013903          	ld	s2,0(sp)
    80006efc:	02010113          	addi	sp,sp,32
    80006f00:	00008067          	ret

0000000080006f04 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006f04:	fe010113          	addi	sp,sp,-32
    80006f08:	00113c23          	sd	ra,24(sp)
    80006f0c:	00813823          	sd	s0,16(sp)
    80006f10:	00913423          	sd	s1,8(sp)
    80006f14:	01213023          	sd	s2,0(sp)
    80006f18:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006f1c:	00000913          	li	s2,0
    80006f20:	0400006f          	j	80006f60 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006f24:	ffffa097          	auipc	ra,0xffffa
    80006f28:	59c080e7          	jalr	1436(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006f2c:	00148493          	addi	s1,s1,1
    80006f30:	000027b7          	lui	a5,0x2
    80006f34:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006f38:	0097ee63          	bltu	a5,s1,80006f54 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006f3c:	00000713          	li	a4,0
    80006f40:	000077b7          	lui	a5,0x7
    80006f44:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006f48:	fce7eee3          	bltu	a5,a4,80006f24 <_ZL11workerBodyBPv+0x20>
    80006f4c:	00170713          	addi	a4,a4,1
    80006f50:	ff1ff06f          	j	80006f40 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006f54:	00a00793          	li	a5,10
    80006f58:	04f90663          	beq	s2,a5,80006fa4 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006f5c:	00190913          	addi	s2,s2,1
    80006f60:	00f00793          	li	a5,15
    80006f64:	0527e463          	bltu	a5,s2,80006fac <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006f68:	00003517          	auipc	a0,0x3
    80006f6c:	48850513          	addi	a0,a0,1160 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    80006f70:	fffff097          	auipc	ra,0xfffff
    80006f74:	310080e7          	jalr	784(ra) # 80006280 <_Z11printStringPKc>
    80006f78:	00000613          	li	a2,0
    80006f7c:	00a00593          	li	a1,10
    80006f80:	0009051b          	sext.w	a0,s2
    80006f84:	fffff097          	auipc	ra,0xfffff
    80006f88:	4ac080e7          	jalr	1196(ra) # 80006430 <_Z8printIntiii>
    80006f8c:	00003517          	auipc	a0,0x3
    80006f90:	6ac50513          	addi	a0,a0,1708 # 8000a638 <CONSOLE_STATUS+0x628>
    80006f94:	fffff097          	auipc	ra,0xfffff
    80006f98:	2ec080e7          	jalr	748(ra) # 80006280 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006f9c:	00000493          	li	s1,0
    80006fa0:	f91ff06f          	j	80006f30 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006fa4:	14102ff3          	csrr	t6,sepc
    80006fa8:	fb5ff06f          	j	80006f5c <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006fac:	00003517          	auipc	a0,0x3
    80006fb0:	44c50513          	addi	a0,a0,1100 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    80006fb4:	fffff097          	auipc	ra,0xfffff
    80006fb8:	2cc080e7          	jalr	716(ra) # 80006280 <_Z11printStringPKc>
    finishedB = true;
    80006fbc:	00100793          	li	a5,1
    80006fc0:	00006717          	auipc	a4,0x6
    80006fc4:	1af70e23          	sb	a5,444(a4) # 8000d17c <_ZL9finishedB>
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

0000000080006fe8 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006fe8:	fe010113          	addi	sp,sp,-32
    80006fec:	00113c23          	sd	ra,24(sp)
    80006ff0:	00813823          	sd	s0,16(sp)
    80006ff4:	00913423          	sd	s1,8(sp)
    80006ff8:	01213023          	sd	s2,0(sp)
    80006ffc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80007000:	00000913          	li	s2,0
    80007004:	0380006f          	j	8000703c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80007008:	ffffa097          	auipc	ra,0xffffa
    8000700c:	4b8080e7          	jalr	1208(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80007010:	00148493          	addi	s1,s1,1
    80007014:	000027b7          	lui	a5,0x2
    80007018:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000701c:	0097ee63          	bltu	a5,s1,80007038 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80007020:	00000713          	li	a4,0
    80007024:	000077b7          	lui	a5,0x7
    80007028:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000702c:	fce7eee3          	bltu	a5,a4,80007008 <_ZL11workerBodyAPv+0x20>
    80007030:	00170713          	addi	a4,a4,1
    80007034:	ff1ff06f          	j	80007024 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80007038:	00190913          	addi	s2,s2,1
    8000703c:	00900793          	li	a5,9
    80007040:	0527e063          	bltu	a5,s2,80007080 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80007044:	00003517          	auipc	a0,0x3
    80007048:	39450513          	addi	a0,a0,916 # 8000a3d8 <CONSOLE_STATUS+0x3c8>
    8000704c:	fffff097          	auipc	ra,0xfffff
    80007050:	234080e7          	jalr	564(ra) # 80006280 <_Z11printStringPKc>
    80007054:	00000613          	li	a2,0
    80007058:	00a00593          	li	a1,10
    8000705c:	0009051b          	sext.w	a0,s2
    80007060:	fffff097          	auipc	ra,0xfffff
    80007064:	3d0080e7          	jalr	976(ra) # 80006430 <_Z8printIntiii>
    80007068:	00003517          	auipc	a0,0x3
    8000706c:	5d050513          	addi	a0,a0,1488 # 8000a638 <CONSOLE_STATUS+0x628>
    80007070:	fffff097          	auipc	ra,0xfffff
    80007074:	210080e7          	jalr	528(ra) # 80006280 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80007078:	00000493          	li	s1,0
    8000707c:	f99ff06f          	j	80007014 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80007080:	00003517          	auipc	a0,0x3
    80007084:	36050513          	addi	a0,a0,864 # 8000a3e0 <CONSOLE_STATUS+0x3d0>
    80007088:	fffff097          	auipc	ra,0xfffff
    8000708c:	1f8080e7          	jalr	504(ra) # 80006280 <_Z11printStringPKc>
    finishedA = true;
    80007090:	00100793          	li	a5,1
    80007094:	00006717          	auipc	a4,0x6
    80007098:	0ef704a3          	sb	a5,233(a4) # 8000d17d <_ZL9finishedA>
}
    8000709c:	01813083          	ld	ra,24(sp)
    800070a0:	01013403          	ld	s0,16(sp)
    800070a4:	00813483          	ld	s1,8(sp)
    800070a8:	00013903          	ld	s2,0(sp)
    800070ac:	02010113          	addi	sp,sp,32
    800070b0:	00008067          	ret

00000000800070b4 <_Z16System_Mode_testv>:


void System_Mode_test() {
    800070b4:	fd010113          	addi	sp,sp,-48
    800070b8:	02113423          	sd	ra,40(sp)
    800070bc:	02813023          	sd	s0,32(sp)
    800070c0:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800070c4:	00000613          	li	a2,0
    800070c8:	00000597          	auipc	a1,0x0
    800070cc:	f2058593          	addi	a1,a1,-224 # 80006fe8 <_ZL11workerBodyAPv>
    800070d0:	fd040513          	addi	a0,s0,-48
    800070d4:	ffffa097          	auipc	ra,0xffffa
    800070d8:	330080e7          	jalr	816(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800070dc:	00003517          	auipc	a0,0x3
    800070e0:	3a450513          	addi	a0,a0,932 # 8000a480 <CONSOLE_STATUS+0x470>
    800070e4:	fffff097          	auipc	ra,0xfffff
    800070e8:	19c080e7          	jalr	412(ra) # 80006280 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800070ec:	00000613          	li	a2,0
    800070f0:	00000597          	auipc	a1,0x0
    800070f4:	e1458593          	addi	a1,a1,-492 # 80006f04 <_ZL11workerBodyBPv>
    800070f8:	fd840513          	addi	a0,s0,-40
    800070fc:	ffffa097          	auipc	ra,0xffffa
    80007100:	308080e7          	jalr	776(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80007104:	00003517          	auipc	a0,0x3
    80007108:	39450513          	addi	a0,a0,916 # 8000a498 <CONSOLE_STATUS+0x488>
    8000710c:	fffff097          	auipc	ra,0xfffff
    80007110:	174080e7          	jalr	372(ra) # 80006280 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80007114:	00000613          	li	a2,0
    80007118:	00000597          	auipc	a1,0x0
    8000711c:	c6c58593          	addi	a1,a1,-916 # 80006d84 <_ZL11workerBodyCPv>
    80007120:	fe040513          	addi	a0,s0,-32
    80007124:	ffffa097          	auipc	ra,0xffffa
    80007128:	2e0080e7          	jalr	736(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    8000712c:	00003517          	auipc	a0,0x3
    80007130:	38450513          	addi	a0,a0,900 # 8000a4b0 <CONSOLE_STATUS+0x4a0>
    80007134:	fffff097          	auipc	ra,0xfffff
    80007138:	14c080e7          	jalr	332(ra) # 80006280 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000713c:	00000613          	li	a2,0
    80007140:	00000597          	auipc	a1,0x0
    80007144:	afc58593          	addi	a1,a1,-1284 # 80006c3c <_ZL11workerBodyDPv>
    80007148:	fe840513          	addi	a0,s0,-24
    8000714c:	ffffa097          	auipc	ra,0xffffa
    80007150:	2b8080e7          	jalr	696(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80007154:	00003517          	auipc	a0,0x3
    80007158:	37450513          	addi	a0,a0,884 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    8000715c:	fffff097          	auipc	ra,0xfffff
    80007160:	124080e7          	jalr	292(ra) # 80006280 <_Z11printStringPKc>
    80007164:	00c0006f          	j	80007170 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80007168:	ffffa097          	auipc	ra,0xffffa
    8000716c:	358080e7          	jalr	856(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80007170:	00006797          	auipc	a5,0x6
    80007174:	00d7c783          	lbu	a5,13(a5) # 8000d17d <_ZL9finishedA>
    80007178:	fe0788e3          	beqz	a5,80007168 <_Z16System_Mode_testv+0xb4>
    8000717c:	00006797          	auipc	a5,0x6
    80007180:	0007c783          	lbu	a5,0(a5) # 8000d17c <_ZL9finishedB>
    80007184:	fe0782e3          	beqz	a5,80007168 <_Z16System_Mode_testv+0xb4>
    80007188:	00006797          	auipc	a5,0x6
    8000718c:	ff37c783          	lbu	a5,-13(a5) # 8000d17b <_ZL9finishedC>
    80007190:	fc078ce3          	beqz	a5,80007168 <_Z16System_Mode_testv+0xb4>
    80007194:	00006797          	auipc	a5,0x6
    80007198:	fe67c783          	lbu	a5,-26(a5) # 8000d17a <_ZL9finishedD>
    8000719c:	fc0786e3          	beqz	a5,80007168 <_Z16System_Mode_testv+0xb4>
    }

}
    800071a0:	02813083          	ld	ra,40(sp)
    800071a4:	02013403          	ld	s0,32(sp)
    800071a8:	03010113          	addi	sp,sp,48
    800071ac:	00008067          	ret

00000000800071b0 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800071b0:	fe010113          	addi	sp,sp,-32
    800071b4:	00113c23          	sd	ra,24(sp)
    800071b8:	00813823          	sd	s0,16(sp)
    800071bc:	00913423          	sd	s1,8(sp)
    800071c0:	01213023          	sd	s2,0(sp)
    800071c4:	02010413          	addi	s0,sp,32
    800071c8:	00050493          	mv	s1,a0
    800071cc:	00058913          	mv	s2,a1
    800071d0:	0015879b          	addiw	a5,a1,1
    800071d4:	0007851b          	sext.w	a0,a5
    800071d8:	00f4a023          	sw	a5,0(s1)
    800071dc:	0004a823          	sw	zero,16(s1)
    800071e0:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800071e4:	00251513          	slli	a0,a0,0x2
    800071e8:	ffffa097          	auipc	ra,0xffffa
    800071ec:	1ac080e7          	jalr	428(ra) # 80001394 <_Z9mem_allocm>
    800071f0:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800071f4:	00000593          	li	a1,0
    800071f8:	02048513          	addi	a0,s1,32
    800071fc:	ffffa097          	auipc	ra,0xffffa
    80007200:	33c080e7          	jalr	828(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80007204:	00090593          	mv	a1,s2
    80007208:	01848513          	addi	a0,s1,24
    8000720c:	ffffa097          	auipc	ra,0xffffa
    80007210:	32c080e7          	jalr	812(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80007214:	00100593          	li	a1,1
    80007218:	02848513          	addi	a0,s1,40
    8000721c:	ffffa097          	auipc	ra,0xffffa
    80007220:	31c080e7          	jalr	796(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80007224:	00100593          	li	a1,1
    80007228:	03048513          	addi	a0,s1,48
    8000722c:	ffffa097          	auipc	ra,0xffffa
    80007230:	30c080e7          	jalr	780(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    80007234:	01813083          	ld	ra,24(sp)
    80007238:	01013403          	ld	s0,16(sp)
    8000723c:	00813483          	ld	s1,8(sp)
    80007240:	00013903          	ld	s2,0(sp)
    80007244:	02010113          	addi	sp,sp,32
    80007248:	00008067          	ret

000000008000724c <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    8000724c:	fe010113          	addi	sp,sp,-32
    80007250:	00113c23          	sd	ra,24(sp)
    80007254:	00813823          	sd	s0,16(sp)
    80007258:	00913423          	sd	s1,8(sp)
    8000725c:	01213023          	sd	s2,0(sp)
    80007260:	02010413          	addi	s0,sp,32
    80007264:	00050493          	mv	s1,a0
    80007268:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    8000726c:	01853503          	ld	a0,24(a0)
    80007270:	ffffa097          	auipc	ra,0xffffa
    80007274:	330080e7          	jalr	816(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80007278:	0304b503          	ld	a0,48(s1)
    8000727c:	ffffa097          	auipc	ra,0xffffa
    80007280:	324080e7          	jalr	804(ra) # 800015a0 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80007284:	0084b783          	ld	a5,8(s1)
    80007288:	0144a703          	lw	a4,20(s1)
    8000728c:	00271713          	slli	a4,a4,0x2
    80007290:	00e787b3          	add	a5,a5,a4
    80007294:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80007298:	0144a783          	lw	a5,20(s1)
    8000729c:	0017879b          	addiw	a5,a5,1
    800072a0:	0004a703          	lw	a4,0(s1)
    800072a4:	02e7e7bb          	remw	a5,a5,a4
    800072a8:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800072ac:	0304b503          	ld	a0,48(s1)
    800072b0:	ffffa097          	auipc	ra,0xffffa
    800072b4:	320080e7          	jalr	800(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    800072b8:	0204b503          	ld	a0,32(s1)
    800072bc:	ffffa097          	auipc	ra,0xffffa
    800072c0:	314080e7          	jalr	788(ra) # 800015d0 <_Z10sem_signalP4KSem>

}
    800072c4:	01813083          	ld	ra,24(sp)
    800072c8:	01013403          	ld	s0,16(sp)
    800072cc:	00813483          	ld	s1,8(sp)
    800072d0:	00013903          	ld	s2,0(sp)
    800072d4:	02010113          	addi	sp,sp,32
    800072d8:	00008067          	ret

00000000800072dc <_ZN6Buffer3getEv>:

int Buffer::get() {
    800072dc:	fe010113          	addi	sp,sp,-32
    800072e0:	00113c23          	sd	ra,24(sp)
    800072e4:	00813823          	sd	s0,16(sp)
    800072e8:	00913423          	sd	s1,8(sp)
    800072ec:	01213023          	sd	s2,0(sp)
    800072f0:	02010413          	addi	s0,sp,32
    800072f4:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800072f8:	02053503          	ld	a0,32(a0)
    800072fc:	ffffa097          	auipc	ra,0xffffa
    80007300:	2a4080e7          	jalr	676(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80007304:	0284b503          	ld	a0,40(s1)
    80007308:	ffffa097          	auipc	ra,0xffffa
    8000730c:	298080e7          	jalr	664(ra) # 800015a0 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80007310:	0084b703          	ld	a4,8(s1)
    80007314:	0104a783          	lw	a5,16(s1)
    80007318:	00279693          	slli	a3,a5,0x2
    8000731c:	00d70733          	add	a4,a4,a3
    80007320:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80007324:	0017879b          	addiw	a5,a5,1
    80007328:	0004a703          	lw	a4,0(s1)
    8000732c:	02e7e7bb          	remw	a5,a5,a4
    80007330:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80007334:	0284b503          	ld	a0,40(s1)
    80007338:	ffffa097          	auipc	ra,0xffffa
    8000733c:	298080e7          	jalr	664(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80007340:	0184b503          	ld	a0,24(s1)
    80007344:	ffffa097          	auipc	ra,0xffffa
    80007348:	28c080e7          	jalr	652(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    8000734c:	00090513          	mv	a0,s2
    80007350:	01813083          	ld	ra,24(sp)
    80007354:	01013403          	ld	s0,16(sp)
    80007358:	00813483          	ld	s1,8(sp)
    8000735c:	00013903          	ld	s2,0(sp)
    80007360:	02010113          	addi	sp,sp,32
    80007364:	00008067          	ret

0000000080007368 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80007368:	fe010113          	addi	sp,sp,-32
    8000736c:	00113c23          	sd	ra,24(sp)
    80007370:	00813823          	sd	s0,16(sp)
    80007374:	00913423          	sd	s1,8(sp)
    80007378:	01213023          	sd	s2,0(sp)
    8000737c:	02010413          	addi	s0,sp,32
    80007380:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80007384:	02853503          	ld	a0,40(a0)
    80007388:	ffffa097          	auipc	ra,0xffffa
    8000738c:	218080e7          	jalr	536(ra) # 800015a0 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80007390:	0304b503          	ld	a0,48(s1)
    80007394:	ffffa097          	auipc	ra,0xffffa
    80007398:	20c080e7          	jalr	524(ra) # 800015a0 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    8000739c:	0144a783          	lw	a5,20(s1)
    800073a0:	0104a903          	lw	s2,16(s1)
    800073a4:	0327ce63          	blt	a5,s2,800073e0 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800073a8:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800073ac:	0304b503          	ld	a0,48(s1)
    800073b0:	ffffa097          	auipc	ra,0xffffa
    800073b4:	220080e7          	jalr	544(ra) # 800015d0 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    800073b8:	0284b503          	ld	a0,40(s1)
    800073bc:	ffffa097          	auipc	ra,0xffffa
    800073c0:	214080e7          	jalr	532(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    800073c4:	00090513          	mv	a0,s2
    800073c8:	01813083          	ld	ra,24(sp)
    800073cc:	01013403          	ld	s0,16(sp)
    800073d0:	00813483          	ld	s1,8(sp)
    800073d4:	00013903          	ld	s2,0(sp)
    800073d8:	02010113          	addi	sp,sp,32
    800073dc:	00008067          	ret
        ret = cap - head + tail;
    800073e0:	0004a703          	lw	a4,0(s1)
    800073e4:	4127093b          	subw	s2,a4,s2
    800073e8:	00f9093b          	addw	s2,s2,a5
    800073ec:	fc1ff06f          	j	800073ac <_ZN6Buffer6getCntEv+0x44>

00000000800073f0 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    800073f0:	fe010113          	addi	sp,sp,-32
    800073f4:	00113c23          	sd	ra,24(sp)
    800073f8:	00813823          	sd	s0,16(sp)
    800073fc:	00913423          	sd	s1,8(sp)
    80007400:	02010413          	addi	s0,sp,32
    80007404:	00050493          	mv	s1,a0
    putc('\n');
    80007408:	00a00513          	li	a0,10
    8000740c:	ffffa097          	auipc	ra,0xffffa
    80007410:	21c080e7          	jalr	540(ra) # 80001628 <_Z4putcc>
    printString("Buffer deleted!\n");
    80007414:	00003517          	auipc	a0,0x3
    80007418:	0cc50513          	addi	a0,a0,204 # 8000a4e0 <CONSOLE_STATUS+0x4d0>
    8000741c:	fffff097          	auipc	ra,0xfffff
    80007420:	e64080e7          	jalr	-412(ra) # 80006280 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80007424:	00048513          	mv	a0,s1
    80007428:	00000097          	auipc	ra,0x0
    8000742c:	f40080e7          	jalr	-192(ra) # 80007368 <_ZN6Buffer6getCntEv>
    80007430:	02a05c63          	blez	a0,80007468 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80007434:	0084b783          	ld	a5,8(s1)
    80007438:	0104a703          	lw	a4,16(s1)
    8000743c:	00271713          	slli	a4,a4,0x2
    80007440:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80007444:	0007c503          	lbu	a0,0(a5)
    80007448:	ffffa097          	auipc	ra,0xffffa
    8000744c:	1e0080e7          	jalr	480(ra) # 80001628 <_Z4putcc>
        head = (head + 1) % cap;
    80007450:	0104a783          	lw	a5,16(s1)
    80007454:	0017879b          	addiw	a5,a5,1
    80007458:	0004a703          	lw	a4,0(s1)
    8000745c:	02e7e7bb          	remw	a5,a5,a4
    80007460:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80007464:	fc1ff06f          	j	80007424 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80007468:	02100513          	li	a0,33
    8000746c:	ffffa097          	auipc	ra,0xffffa
    80007470:	1bc080e7          	jalr	444(ra) # 80001628 <_Z4putcc>
    putc('\n');
    80007474:	00a00513          	li	a0,10
    80007478:	ffffa097          	auipc	ra,0xffffa
    8000747c:	1b0080e7          	jalr	432(ra) # 80001628 <_Z4putcc>
    mem_free(buffer);
    80007480:	0084b503          	ld	a0,8(s1)
    80007484:	ffffa097          	auipc	ra,0xffffa
    80007488:	f50080e7          	jalr	-176(ra) # 800013d4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    8000748c:	0204b503          	ld	a0,32(s1)
    80007490:	ffffa097          	auipc	ra,0xffffa
    80007494:	0e0080e7          	jalr	224(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80007498:	0184b503          	ld	a0,24(s1)
    8000749c:	ffffa097          	auipc	ra,0xffffa
    800074a0:	0d4080e7          	jalr	212(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    800074a4:	0304b503          	ld	a0,48(s1)
    800074a8:	ffffa097          	auipc	ra,0xffffa
    800074ac:	0c8080e7          	jalr	200(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    800074b0:	0284b503          	ld	a0,40(s1)
    800074b4:	ffffa097          	auipc	ra,0xffffa
    800074b8:	0bc080e7          	jalr	188(ra) # 80001570 <_Z9sem_closeP4KSem>
}
    800074bc:	01813083          	ld	ra,24(sp)
    800074c0:	01013403          	ld	s0,16(sp)
    800074c4:	00813483          	ld	s1,8(sp)
    800074c8:	02010113          	addi	sp,sp,32
    800074cc:	00008067          	ret

00000000800074d0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    800074d0:	fa010113          	addi	sp,sp,-96
    800074d4:	04813c23          	sd	s0,88(sp)
    800074d8:	06010413          	addi	s0,sp,96
    800074dc:	faa43423          	sd	a0,-88(s0)
    800074e0:	00058793          	mv	a5,a1
    800074e4:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    800074e8:	fa843783          	ld	a5,-88(s0)
    800074ec:	00079663          	bnez	a5,800074f8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    800074f0:	00000793          	li	a5,0
    800074f4:	2040006f          	j	800076f8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    800074f8:	fa843783          	ld	a5,-88(s0)
    800074fc:	0067d713          	srli	a4,a5,0x6
    80007500:	fa843783          	ld	a5,-88(s0)
    80007504:	03f7f793          	andi	a5,a5,63
    80007508:	00078663          	beqz	a5,80007514 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    8000750c:	00100793          	li	a5,1
    80007510:	0080006f          	j	80007518 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80007514:	00000793          	li	a5,0
    80007518:	00e787b3          	add	a5,a5,a4
    8000751c:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80007520:	fc843783          	ld	a5,-56(s0)
    80007524:	00679793          	slli	a5,a5,0x6
    80007528:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    8000752c:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80007530:	00006797          	auipc	a5,0x6
    80007534:	c5878793          	addi	a5,a5,-936 # 8000d188 <_ZN15MemoryAllocator11freeMemHeadE>
    80007538:	0007b783          	ld	a5,0(a5)
    8000753c:	fef43023          	sd	a5,-32(s0)
    80007540:	fe043783          	ld	a5,-32(s0)
    80007544:	1a078863          	beqz	a5,800076f4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    80007548:	fe043783          	ld	a5,-32(s0)
    8000754c:	0087b783          	ld	a5,8(a5)
    80007550:	fa843703          	ld	a4,-88(s0)
    80007554:	18e7e263          	bltu	a5,a4,800076d8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    80007558:	fe043703          	ld	a4,-32(s0)
    8000755c:	fa843783          	ld	a5,-88(s0)
    80007560:	00f707b3          	add	a5,a4,a5
    80007564:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    80007568:	fe043783          	ld	a5,-32(s0)
    8000756c:	0087b703          	ld	a4,8(a5)
    80007570:	fa843783          	ld	a5,-88(s0)
    80007574:	40f707b3          	sub	a5,a4,a5
    80007578:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    8000757c:	fb843703          	ld	a4,-72(s0)
    80007580:	02000793          	li	a5,32
    80007584:	04e7e463          	bltu	a5,a4,800075cc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    80007588:	fa843703          	ld	a4,-88(s0)
    8000758c:	fb843783          	ld	a5,-72(s0)
    80007590:	00f707b3          	add	a5,a4,a5
    80007594:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    80007598:	fe843783          	ld	a5,-24(s0)
    8000759c:	00078c63          	beqz	a5,800075b4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    800075a0:	fe043783          	ld	a5,-32(s0)
    800075a4:	0007b703          	ld	a4,0(a5)
    800075a8:	fe843783          	ld	a5,-24(s0)
    800075ac:	00e7b023          	sd	a4,0(a5)
    800075b0:	0600006f          	j	80007610 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    800075b4:	fe043783          	ld	a5,-32(s0)
    800075b8:	0007b703          	ld	a4,0(a5)
    800075bc:	00006797          	auipc	a5,0x6
    800075c0:	bcc78793          	addi	a5,a5,-1076 # 8000d188 <_ZN15MemoryAllocator11freeMemHeadE>
    800075c4:	00e7b023          	sd	a4,0(a5)
    800075c8:	0480006f          	j	80007610 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    800075cc:	fc043783          	ld	a5,-64(s0)
    800075d0:	fb843703          	ld	a4,-72(s0)
    800075d4:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    800075d8:	fe043783          	ld	a5,-32(s0)
    800075dc:	0007b703          	ld	a4,0(a5)
    800075e0:	fc043783          	ld	a5,-64(s0)
    800075e4:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    800075e8:	fe843783          	ld	a5,-24(s0)
    800075ec:	00078a63          	beqz	a5,80007600 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    800075f0:	fe843783          	ld	a5,-24(s0)
    800075f4:	fc043703          	ld	a4,-64(s0)
    800075f8:	00e7b023          	sd	a4,0(a5)
    800075fc:	0140006f          	j	80007610 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    80007600:	00006797          	auipc	a5,0x6
    80007604:	b8878793          	addi	a5,a5,-1144 # 8000d188 <_ZN15MemoryAllocator11freeMemHeadE>
    80007608:	fc043703          	ld	a4,-64(s0)
    8000760c:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    80007610:	fe043783          	ld	a5,-32(s0)
    80007614:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    80007618:	fb043783          	ld	a5,-80(s0)
    8000761c:	fa843703          	ld	a4,-88(s0)
    80007620:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    80007624:	fb043783          	ld	a5,-80(s0)
    80007628:	fa442703          	lw	a4,-92(s0)
    8000762c:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    80007630:	fb043783          	ld	a5,-80(s0)
    80007634:	02078713          	addi	a4,a5,32
    80007638:	fb043783          	ld	a5,-80(s0)
    8000763c:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    80007640:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80007644:	00006797          	auipc	a5,0x6
    80007648:	b3c78793          	addi	a5,a5,-1220 # 8000d180 <_ZN15MemoryAllocator11usedMemHeadE>
    8000764c:	0007b783          	ld	a5,0(a5)
    80007650:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80007654:	fd043783          	ld	a5,-48(s0)
    80007658:	02078463          	beqz	a5,80007680 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    8000765c:	fd043703          	ld	a4,-48(s0)
    80007660:	fb043783          	ld	a5,-80(s0)
    80007664:	00f77e63          	bgeu	a4,a5,80007680 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    80007668:	fd043783          	ld	a5,-48(s0)
    8000766c:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80007670:	fd043783          	ld	a5,-48(s0)
    80007674:	0007b783          	ld	a5,0(a5)
    80007678:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    8000767c:	fd9ff06f          	j	80007654 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    80007680:	fd843783          	ld	a5,-40(s0)
    80007684:	02079663          	bnez	a5,800076b0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    80007688:	00006797          	auipc	a5,0x6
    8000768c:	af878793          	addi	a5,a5,-1288 # 8000d180 <_ZN15MemoryAllocator11usedMemHeadE>
    80007690:	0007b703          	ld	a4,0(a5)
    80007694:	fb043783          	ld	a5,-80(s0)
    80007698:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    8000769c:	00006797          	auipc	a5,0x6
    800076a0:	ae478793          	addi	a5,a5,-1308 # 8000d180 <_ZN15MemoryAllocator11usedMemHeadE>
    800076a4:	fb043703          	ld	a4,-80(s0)
    800076a8:	00e7b023          	sd	a4,0(a5)
    800076ac:	0200006f          	j	800076cc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    800076b0:	fd843783          	ld	a5,-40(s0)
    800076b4:	0007b703          	ld	a4,0(a5)
    800076b8:	fb043783          	ld	a5,-80(s0)
    800076bc:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    800076c0:	fd843783          	ld	a5,-40(s0)
    800076c4:	fb043703          	ld	a4,-80(s0)
    800076c8:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    800076cc:	fb043783          	ld	a5,-80(s0)
    800076d0:	0187b783          	ld	a5,24(a5)
    800076d4:	0240006f          	j	800076f8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    800076d8:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    800076dc:	fe043783          	ld	a5,-32(s0)
    800076e0:	fef43423          	sd	a5,-24(s0)
    800076e4:	fe043783          	ld	a5,-32(s0)
    800076e8:	0007b783          	ld	a5,0(a5)
    800076ec:	fef43023          	sd	a5,-32(s0)
    800076f0:	e51ff06f          	j	80007540 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    800076f4:	00000793          	li	a5,0
}
    800076f8:	00078513          	mv	a0,a5
    800076fc:	05813403          	ld	s0,88(sp)
    80007700:	06010113          	addi	sp,sp,96
    80007704:	00008067          	ret

0000000080007708 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80007708:	fb010113          	addi	sp,sp,-80
    8000770c:	04113423          	sd	ra,72(sp)
    80007710:	04813023          	sd	s0,64(sp)
    80007714:	05010413          	addi	s0,sp,80
    80007718:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    8000771c:	fb843783          	ld	a5,-72(s0)
    80007720:	00079663          	bnez	a5,8000772c <_ZN15MemoryAllocator5kfreeEPv+0x24>
    80007724:	00000793          	li	a5,0
    80007728:	1740006f          	j	8000789c <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    8000772c:	00006797          	auipc	a5,0x6
    80007730:	a5478793          	addi	a5,a5,-1452 # 8000d180 <_ZN15MemoryAllocator11usedMemHeadE>
    80007734:	0007b783          	ld	a5,0(a5)
    80007738:	00079663          	bnez	a5,80007744 <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    8000773c:	fff00793          	li	a5,-1
    80007740:	15c0006f          	j	8000789c <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80007744:	fb843783          	ld	a5,-72(s0)
    80007748:	fe078793          	addi	a5,a5,-32
    8000774c:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    80007750:	00006797          	auipc	a5,0x6
    80007754:	a3078793          	addi	a5,a5,-1488 # 8000d180 <_ZN15MemoryAllocator11usedMemHeadE>
    80007758:	0007b783          	ld	a5,0(a5)
    8000775c:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    80007760:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80007764:	fe843783          	ld	a5,-24(s0)
    80007768:	02078463          	beqz	a5,80007790 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    8000776c:	fe843703          	ld	a4,-24(s0)
    80007770:	fb843783          	ld	a5,-72(s0)
    80007774:	00f70e63          	beq	a4,a5,80007790 <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    80007778:	fe843783          	ld	a5,-24(s0)
    8000777c:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80007780:	fe843783          	ld	a5,-24(s0)
    80007784:	0007b783          	ld	a5,0(a5)
    80007788:	fef43423          	sd	a5,-24(s0)
    8000778c:	fd9ff06f          	j	80007764 <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80007790:	fe843703          	ld	a4,-24(s0)
    80007794:	fb843783          	ld	a5,-72(s0)
    80007798:	00f70663          	beq	a4,a5,800077a4 <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    8000779c:	fff00793          	li	a5,-1
    800077a0:	0fc0006f          	j	8000789c <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    800077a4:	fe043783          	ld	a5,-32(s0)
    800077a8:	00078c63          	beqz	a5,800077c0 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    800077ac:	fe843783          	ld	a5,-24(s0)
    800077b0:	0007b703          	ld	a4,0(a5)
    800077b4:	fe043783          	ld	a5,-32(s0)
    800077b8:	00e7b023          	sd	a4,0(a5)
    800077bc:	0180006f          	j	800077d4 <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    800077c0:	fe843783          	ld	a5,-24(s0)
    800077c4:	0007b703          	ld	a4,0(a5)
    800077c8:	00006797          	auipc	a5,0x6
    800077cc:	9b878793          	addi	a5,a5,-1608 # 8000d180 <_ZN15MemoryAllocator11usedMemHeadE>
    800077d0:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    800077d4:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    800077d8:	00006797          	auipc	a5,0x6
    800077dc:	9b078793          	addi	a5,a5,-1616 # 8000d188 <_ZN15MemoryAllocator11freeMemHeadE>
    800077e0:	0007b783          	ld	a5,0(a5)
    800077e4:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    800077e8:	fd043783          	ld	a5,-48(s0)
    800077ec:	02078463          	beqz	a5,80007814 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    800077f0:	fd043703          	ld	a4,-48(s0)
    800077f4:	fb843783          	ld	a5,-72(s0)
    800077f8:	00f77e63          	bgeu	a4,a5,80007814 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    800077fc:	fd043783          	ld	a5,-48(s0)
    80007800:	fcf43c23          	sd	a5,-40(s0)
    80007804:	fd043783          	ld	a5,-48(s0)
    80007808:	0007b783          	ld	a5,0(a5)
    8000780c:	fcf43823          	sd	a5,-48(s0)
    80007810:	fd9ff06f          	j	800077e8 <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    80007814:	fb843783          	ld	a5,-72(s0)
    80007818:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    8000781c:	fb843783          	ld	a5,-72(s0)
    80007820:	0087b783          	ld	a5,8(a5)
    80007824:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    80007828:	fc843783          	ld	a5,-56(s0)
    8000782c:	fc043703          	ld	a4,-64(s0)
    80007830:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    80007834:	fd843783          	ld	a5,-40(s0)
    80007838:	02078263          	beqz	a5,8000785c <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    8000783c:	fd843783          	ld	a5,-40(s0)
    80007840:	0007b703          	ld	a4,0(a5)
    80007844:	fc843783          	ld	a5,-56(s0)
    80007848:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    8000784c:	fd843783          	ld	a5,-40(s0)
    80007850:	fc843703          	ld	a4,-56(s0)
    80007854:	00e7b023          	sd	a4,0(a5)
    80007858:	0280006f          	j	80007880 <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    8000785c:	00006797          	auipc	a5,0x6
    80007860:	92c78793          	addi	a5,a5,-1748 # 8000d188 <_ZN15MemoryAllocator11freeMemHeadE>
    80007864:	0007b703          	ld	a4,0(a5)
    80007868:	fc843783          	ld	a5,-56(s0)
    8000786c:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    80007870:	00006797          	auipc	a5,0x6
    80007874:	91878793          	addi	a5,a5,-1768 # 8000d188 <_ZN15MemoryAllocator11freeMemHeadE>
    80007878:	fc843703          	ld	a4,-56(s0)
    8000787c:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    80007880:	fc843503          	ld	a0,-56(s0)
    80007884:	00000097          	auipc	ra,0x0
    80007888:	02c080e7          	jalr	44(ra) # 800078b0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    8000788c:	fd843503          	ld	a0,-40(s0)
    80007890:	00000097          	auipc	ra,0x0
    80007894:	020080e7          	jalr	32(ra) # 800078b0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    80007898:	00000793          	li	a5,0
}
    8000789c:	00078513          	mv	a0,a5
    800078a0:	04813083          	ld	ra,72(sp)
    800078a4:	04013403          	ld	s0,64(sp)
    800078a8:	05010113          	addi	sp,sp,80
    800078ac:	00008067          	ret

00000000800078b0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    800078b0:	fc010113          	addi	sp,sp,-64
    800078b4:	02813c23          	sd	s0,56(sp)
    800078b8:	04010413          	addi	s0,sp,64
    800078bc:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    800078c0:	fc843783          	ld	a5,-56(s0)
    800078c4:	00079663          	bnez	a5,800078d0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    800078c8:	00000793          	li	a5,0
    800078cc:	0a00006f          	j	8000796c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    800078d0:	fc843783          	ld	a5,-56(s0)
    800078d4:	0007b783          	ld	a5,0(a5)
    800078d8:	00f037b3          	snez	a5,a5
    800078dc:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    800078e0:	fc843783          	ld	a5,-56(s0)
    800078e4:	0087b783          	ld	a5,8(a5)
    800078e8:	fc843703          	ld	a4,-56(s0)
    800078ec:	00f707b3          	add	a5,a4,a5
    800078f0:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    800078f4:	fc843783          	ld	a5,-56(s0)
    800078f8:	0007b783          	ld	a5,0(a5)
    800078fc:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    80007900:	fe043703          	ld	a4,-32(s0)
    80007904:	fd843783          	ld	a5,-40(s0)
    80007908:	40f707b3          	sub	a5,a4,a5
    8000790c:	0017b793          	seqz	a5,a5
    80007910:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    80007914:	fef44783          	lbu	a5,-17(s0)
    80007918:	0ff7f793          	andi	a5,a5,255
    8000791c:	04078663          	beqz	a5,80007968 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    80007920:	fd744783          	lbu	a5,-41(s0)
    80007924:	0ff7f793          	andi	a5,a5,255
    80007928:	04078063          	beqz	a5,80007968 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    8000792c:	fc843783          	ld	a5,-56(s0)
    80007930:	0087b703          	ld	a4,8(a5)
    80007934:	fc843783          	ld	a5,-56(s0)
    80007938:	0007b783          	ld	a5,0(a5)
    8000793c:	0087b783          	ld	a5,8(a5)
    80007940:	00f70733          	add	a4,a4,a5
    80007944:	fc843783          	ld	a5,-56(s0)
    80007948:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    8000794c:	fc843783          	ld	a5,-56(s0)
    80007950:	0007b783          	ld	a5,0(a5)
    80007954:	0007b703          	ld	a4,0(a5)
    80007958:	fc843783          	ld	a5,-56(s0)
    8000795c:	00e7b023          	sd	a4,0(a5)
        return 1;
    80007960:	00100793          	li	a5,1
    80007964:	0080006f          	j	8000796c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    80007968:	00000793          	li	a5,0
}
    8000796c:	00078513          	mv	a0,a5
    80007970:	03813403          	ld	s0,56(sp)
    80007974:	04010113          	addi	sp,sp,64
    80007978:	00008067          	ret

000000008000797c <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    8000797c:	fe010113          	addi	sp,sp,-32
    80007980:	00813c23          	sd	s0,24(sp)
    80007984:	02010413          	addi	s0,sp,32
    80007988:	fea43423          	sd	a0,-24(s0)
    8000798c:	00058793          	mv	a5,a1
    80007990:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80007994:	fe843783          	ld	a5,-24(s0)
    80007998:	fe078793          	addi	a5,a5,-32
    8000799c:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    800079a0:	fe843783          	ld	a5,-24(s0)
    800079a4:	0107a703          	lw	a4,16(a5)
    800079a8:	fe442783          	lw	a5,-28(s0)
    800079ac:	0007879b          	sext.w	a5,a5
    800079b0:	40e787b3          	sub	a5,a5,a4
    800079b4:	0017b793          	seqz	a5,a5
    800079b8:	0ff7f793          	andi	a5,a5,255
}
    800079bc:	00078513          	mv	a0,a5
    800079c0:	01813403          	ld	s0,24(sp)
    800079c4:	02010113          	addi	sp,sp,32
    800079c8:	00008067          	ret

00000000800079cc <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    800079cc:	ff010113          	addi	sp,sp,-16
    800079d0:	00813423          	sd	s0,8(sp)
    800079d4:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    800079d8:	00005797          	auipc	a5,0x5
    800079dc:	7b878793          	addi	a5,a5,1976 # 8000d190 <_ZN15MemoryAllocator11initializedE>
    800079e0:	0007c783          	lbu	a5,0(a5)
    800079e4:	0017c793          	xori	a5,a5,1
    800079e8:	0ff7f793          	andi	a5,a5,255
    800079ec:	06078a63          	beqz	a5,80007a60 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    800079f0:	00005797          	auipc	a5,0x5
    800079f4:	5587b783          	ld	a5,1368(a5) # 8000cf48 <_GLOBAL_OFFSET_TABLE_+0x30>
    800079f8:	0007b703          	ld	a4,0(a5)
    800079fc:	00005797          	auipc	a5,0x5
    80007a00:	78c78793          	addi	a5,a5,1932 # 8000d188 <_ZN15MemoryAllocator11freeMemHeadE>
    80007a04:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    80007a08:	00005797          	auipc	a5,0x5
    80007a0c:	78078793          	addi	a5,a5,1920 # 8000d188 <_ZN15MemoryAllocator11freeMemHeadE>
    80007a10:	0007b783          	ld	a5,0(a5)
    80007a14:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    80007a18:	00005797          	auipc	a5,0x5
    80007a1c:	5787b783          	ld	a5,1400(a5) # 8000cf90 <_GLOBAL_OFFSET_TABLE_+0x78>
    80007a20:	0007b703          	ld	a4,0(a5)
    80007a24:	00005797          	auipc	a5,0x5
    80007a28:	5247b783          	ld	a5,1316(a5) # 8000cf48 <_GLOBAL_OFFSET_TABLE_+0x30>
    80007a2c:	0007b783          	ld	a5,0(a5)
    80007a30:	40f70733          	sub	a4,a4,a5
    80007a34:	00005797          	auipc	a5,0x5
    80007a38:	75478793          	addi	a5,a5,1876 # 8000d188 <_ZN15MemoryAllocator11freeMemHeadE>
    80007a3c:	0007b783          	ld	a5,0(a5)
    80007a40:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    80007a44:	00005797          	auipc	a5,0x5
    80007a48:	73c78793          	addi	a5,a5,1852 # 8000d180 <_ZN15MemoryAllocator11usedMemHeadE>
    80007a4c:	0007b023          	sd	zero,0(a5)

        initialized = true;
    80007a50:	00005797          	auipc	a5,0x5
    80007a54:	74078793          	addi	a5,a5,1856 # 8000d190 <_ZN15MemoryAllocator11initializedE>
    80007a58:	00100713          	li	a4,1
    80007a5c:	00e78023          	sb	a4,0(a5)
    }
}
    80007a60:	00000013          	nop
    80007a64:	00813403          	ld	s0,8(sp)
    80007a68:	01010113          	addi	sp,sp,16
    80007a6c:	00008067          	ret

0000000080007a70 <start>:
    80007a70:	ff010113          	addi	sp,sp,-16
    80007a74:	00813423          	sd	s0,8(sp)
    80007a78:	01010413          	addi	s0,sp,16
    80007a7c:	300027f3          	csrr	a5,mstatus
    80007a80:	ffffe737          	lui	a4,0xffffe
    80007a84:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <uart_tx_buf+0xffffffff7fff041f>
    80007a88:	00e7f7b3          	and	a5,a5,a4
    80007a8c:	00001737          	lui	a4,0x1
    80007a90:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80007a94:	00e7e7b3          	or	a5,a5,a4
    80007a98:	30079073          	csrw	mstatus,a5
    80007a9c:	00000797          	auipc	a5,0x0
    80007aa0:	16078793          	addi	a5,a5,352 # 80007bfc <system_main>
    80007aa4:	34179073          	csrw	mepc,a5
    80007aa8:	00000793          	li	a5,0
    80007aac:	18079073          	csrw	satp,a5
    80007ab0:	000107b7          	lui	a5,0x10
    80007ab4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007ab8:	30279073          	csrw	medeleg,a5
    80007abc:	30379073          	csrw	mideleg,a5
    80007ac0:	104027f3          	csrr	a5,sie
    80007ac4:	2227e793          	ori	a5,a5,546
    80007ac8:	10479073          	csrw	sie,a5
    80007acc:	fff00793          	li	a5,-1
    80007ad0:	00a7d793          	srli	a5,a5,0xa
    80007ad4:	3b079073          	csrw	pmpaddr0,a5
    80007ad8:	00f00793          	li	a5,15
    80007adc:	3a079073          	csrw	pmpcfg0,a5
    80007ae0:	f14027f3          	csrr	a5,mhartid
    80007ae4:	0200c737          	lui	a4,0x200c
    80007ae8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007aec:	0007869b          	sext.w	a3,a5
    80007af0:	00269713          	slli	a4,a3,0x2
    80007af4:	000f4637          	lui	a2,0xf4
    80007af8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007afc:	00d70733          	add	a4,a4,a3
    80007b00:	0037979b          	slliw	a5,a5,0x3
    80007b04:	020046b7          	lui	a3,0x2004
    80007b08:	00d787b3          	add	a5,a5,a3
    80007b0c:	00c585b3          	add	a1,a1,a2
    80007b10:	00371693          	slli	a3,a4,0x3
    80007b14:	00005717          	auipc	a4,0x5
    80007b18:	68c70713          	addi	a4,a4,1676 # 8000d1a0 <timer_scratch>
    80007b1c:	00b7b023          	sd	a1,0(a5)
    80007b20:	00d70733          	add	a4,a4,a3
    80007b24:	00f73c23          	sd	a5,24(a4)
    80007b28:	02c73023          	sd	a2,32(a4)
    80007b2c:	34071073          	csrw	mscratch,a4
    80007b30:	00000797          	auipc	a5,0x0
    80007b34:	6e078793          	addi	a5,a5,1760 # 80008210 <timervec>
    80007b38:	30579073          	csrw	mtvec,a5
    80007b3c:	300027f3          	csrr	a5,mstatus
    80007b40:	0087e793          	ori	a5,a5,8
    80007b44:	30079073          	csrw	mstatus,a5
    80007b48:	304027f3          	csrr	a5,mie
    80007b4c:	0807e793          	ori	a5,a5,128
    80007b50:	30479073          	csrw	mie,a5
    80007b54:	f14027f3          	csrr	a5,mhartid
    80007b58:	0007879b          	sext.w	a5,a5
    80007b5c:	00078213          	mv	tp,a5
    80007b60:	30200073          	mret
    80007b64:	00813403          	ld	s0,8(sp)
    80007b68:	01010113          	addi	sp,sp,16
    80007b6c:	00008067          	ret

0000000080007b70 <timerinit>:
    80007b70:	ff010113          	addi	sp,sp,-16
    80007b74:	00813423          	sd	s0,8(sp)
    80007b78:	01010413          	addi	s0,sp,16
    80007b7c:	f14027f3          	csrr	a5,mhartid
    80007b80:	0200c737          	lui	a4,0x200c
    80007b84:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007b88:	0007869b          	sext.w	a3,a5
    80007b8c:	00269713          	slli	a4,a3,0x2
    80007b90:	000f4637          	lui	a2,0xf4
    80007b94:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007b98:	00d70733          	add	a4,a4,a3
    80007b9c:	0037979b          	slliw	a5,a5,0x3
    80007ba0:	020046b7          	lui	a3,0x2004
    80007ba4:	00d787b3          	add	a5,a5,a3
    80007ba8:	00c585b3          	add	a1,a1,a2
    80007bac:	00371693          	slli	a3,a4,0x3
    80007bb0:	00005717          	auipc	a4,0x5
    80007bb4:	5f070713          	addi	a4,a4,1520 # 8000d1a0 <timer_scratch>
    80007bb8:	00b7b023          	sd	a1,0(a5)
    80007bbc:	00d70733          	add	a4,a4,a3
    80007bc0:	00f73c23          	sd	a5,24(a4)
    80007bc4:	02c73023          	sd	a2,32(a4)
    80007bc8:	34071073          	csrw	mscratch,a4
    80007bcc:	00000797          	auipc	a5,0x0
    80007bd0:	64478793          	addi	a5,a5,1604 # 80008210 <timervec>
    80007bd4:	30579073          	csrw	mtvec,a5
    80007bd8:	300027f3          	csrr	a5,mstatus
    80007bdc:	0087e793          	ori	a5,a5,8
    80007be0:	30079073          	csrw	mstatus,a5
    80007be4:	304027f3          	csrr	a5,mie
    80007be8:	0807e793          	ori	a5,a5,128
    80007bec:	30479073          	csrw	mie,a5
    80007bf0:	00813403          	ld	s0,8(sp)
    80007bf4:	01010113          	addi	sp,sp,16
    80007bf8:	00008067          	ret

0000000080007bfc <system_main>:
    80007bfc:	fe010113          	addi	sp,sp,-32
    80007c00:	00813823          	sd	s0,16(sp)
    80007c04:	00913423          	sd	s1,8(sp)
    80007c08:	00113c23          	sd	ra,24(sp)
    80007c0c:	02010413          	addi	s0,sp,32
    80007c10:	00000097          	auipc	ra,0x0
    80007c14:	0c4080e7          	jalr	196(ra) # 80007cd4 <cpuid>
    80007c18:	00005497          	auipc	s1,0x5
    80007c1c:	3b848493          	addi	s1,s1,952 # 8000cfd0 <started>
    80007c20:	02050263          	beqz	a0,80007c44 <system_main+0x48>
    80007c24:	0004a783          	lw	a5,0(s1)
    80007c28:	0007879b          	sext.w	a5,a5
    80007c2c:	fe078ce3          	beqz	a5,80007c24 <system_main+0x28>
    80007c30:	0ff0000f          	fence
    80007c34:	00003517          	auipc	a0,0x3
    80007c38:	b7c50513          	addi	a0,a0,-1156 # 8000a7b0 <CONSOLE_STATUS+0x7a0>
    80007c3c:	00001097          	auipc	ra,0x1
    80007c40:	a70080e7          	jalr	-1424(ra) # 800086ac <panic>
    80007c44:	00001097          	auipc	ra,0x1
    80007c48:	9c4080e7          	jalr	-1596(ra) # 80008608 <consoleinit>
    80007c4c:	00001097          	auipc	ra,0x1
    80007c50:	150080e7          	jalr	336(ra) # 80008d9c <printfinit>
    80007c54:	00003517          	auipc	a0,0x3
    80007c58:	9e450513          	addi	a0,a0,-1564 # 8000a638 <CONSOLE_STATUS+0x628>
    80007c5c:	00001097          	auipc	ra,0x1
    80007c60:	aac080e7          	jalr	-1364(ra) # 80008708 <__printf>
    80007c64:	00003517          	auipc	a0,0x3
    80007c68:	b1c50513          	addi	a0,a0,-1252 # 8000a780 <CONSOLE_STATUS+0x770>
    80007c6c:	00001097          	auipc	ra,0x1
    80007c70:	a9c080e7          	jalr	-1380(ra) # 80008708 <__printf>
    80007c74:	00003517          	auipc	a0,0x3
    80007c78:	9c450513          	addi	a0,a0,-1596 # 8000a638 <CONSOLE_STATUS+0x628>
    80007c7c:	00001097          	auipc	ra,0x1
    80007c80:	a8c080e7          	jalr	-1396(ra) # 80008708 <__printf>
    80007c84:	00001097          	auipc	ra,0x1
    80007c88:	4a4080e7          	jalr	1188(ra) # 80009128 <kinit>
    80007c8c:	00000097          	auipc	ra,0x0
    80007c90:	148080e7          	jalr	328(ra) # 80007dd4 <trapinit>
    80007c94:	00000097          	auipc	ra,0x0
    80007c98:	16c080e7          	jalr	364(ra) # 80007e00 <trapinithart>
    80007c9c:	00000097          	auipc	ra,0x0
    80007ca0:	5b4080e7          	jalr	1460(ra) # 80008250 <plicinit>
    80007ca4:	00000097          	auipc	ra,0x0
    80007ca8:	5d4080e7          	jalr	1492(ra) # 80008278 <plicinithart>
    80007cac:	00000097          	auipc	ra,0x0
    80007cb0:	078080e7          	jalr	120(ra) # 80007d24 <userinit>
    80007cb4:	0ff0000f          	fence
    80007cb8:	00100793          	li	a5,1
    80007cbc:	00003517          	auipc	a0,0x3
    80007cc0:	adc50513          	addi	a0,a0,-1316 # 8000a798 <CONSOLE_STATUS+0x788>
    80007cc4:	00f4a023          	sw	a5,0(s1)
    80007cc8:	00001097          	auipc	ra,0x1
    80007ccc:	a40080e7          	jalr	-1472(ra) # 80008708 <__printf>
    80007cd0:	0000006f          	j	80007cd0 <system_main+0xd4>

0000000080007cd4 <cpuid>:
    80007cd4:	ff010113          	addi	sp,sp,-16
    80007cd8:	00813423          	sd	s0,8(sp)
    80007cdc:	01010413          	addi	s0,sp,16
    80007ce0:	00020513          	mv	a0,tp
    80007ce4:	00813403          	ld	s0,8(sp)
    80007ce8:	0005051b          	sext.w	a0,a0
    80007cec:	01010113          	addi	sp,sp,16
    80007cf0:	00008067          	ret

0000000080007cf4 <mycpu>:
    80007cf4:	ff010113          	addi	sp,sp,-16
    80007cf8:	00813423          	sd	s0,8(sp)
    80007cfc:	01010413          	addi	s0,sp,16
    80007d00:	00020793          	mv	a5,tp
    80007d04:	00813403          	ld	s0,8(sp)
    80007d08:	0007879b          	sext.w	a5,a5
    80007d0c:	00779793          	slli	a5,a5,0x7
    80007d10:	00006517          	auipc	a0,0x6
    80007d14:	4c050513          	addi	a0,a0,1216 # 8000e1d0 <cpus>
    80007d18:	00f50533          	add	a0,a0,a5
    80007d1c:	01010113          	addi	sp,sp,16
    80007d20:	00008067          	ret

0000000080007d24 <userinit>:
    80007d24:	ff010113          	addi	sp,sp,-16
    80007d28:	00813423          	sd	s0,8(sp)
    80007d2c:	01010413          	addi	s0,sp,16
    80007d30:	00813403          	ld	s0,8(sp)
    80007d34:	01010113          	addi	sp,sp,16
    80007d38:	ffffa317          	auipc	t1,0xffffa
    80007d3c:	4b030067          	jr	1200(t1) # 800021e8 <main>

0000000080007d40 <either_copyout>:
    80007d40:	ff010113          	addi	sp,sp,-16
    80007d44:	00813023          	sd	s0,0(sp)
    80007d48:	00113423          	sd	ra,8(sp)
    80007d4c:	01010413          	addi	s0,sp,16
    80007d50:	02051663          	bnez	a0,80007d7c <either_copyout+0x3c>
    80007d54:	00058513          	mv	a0,a1
    80007d58:	00060593          	mv	a1,a2
    80007d5c:	0006861b          	sext.w	a2,a3
    80007d60:	00002097          	auipc	ra,0x2
    80007d64:	c54080e7          	jalr	-940(ra) # 800099b4 <__memmove>
    80007d68:	00813083          	ld	ra,8(sp)
    80007d6c:	00013403          	ld	s0,0(sp)
    80007d70:	00000513          	li	a0,0
    80007d74:	01010113          	addi	sp,sp,16
    80007d78:	00008067          	ret
    80007d7c:	00003517          	auipc	a0,0x3
    80007d80:	a5c50513          	addi	a0,a0,-1444 # 8000a7d8 <CONSOLE_STATUS+0x7c8>
    80007d84:	00001097          	auipc	ra,0x1
    80007d88:	928080e7          	jalr	-1752(ra) # 800086ac <panic>

0000000080007d8c <either_copyin>:
    80007d8c:	ff010113          	addi	sp,sp,-16
    80007d90:	00813023          	sd	s0,0(sp)
    80007d94:	00113423          	sd	ra,8(sp)
    80007d98:	01010413          	addi	s0,sp,16
    80007d9c:	02059463          	bnez	a1,80007dc4 <either_copyin+0x38>
    80007da0:	00060593          	mv	a1,a2
    80007da4:	0006861b          	sext.w	a2,a3
    80007da8:	00002097          	auipc	ra,0x2
    80007dac:	c0c080e7          	jalr	-1012(ra) # 800099b4 <__memmove>
    80007db0:	00813083          	ld	ra,8(sp)
    80007db4:	00013403          	ld	s0,0(sp)
    80007db8:	00000513          	li	a0,0
    80007dbc:	01010113          	addi	sp,sp,16
    80007dc0:	00008067          	ret
    80007dc4:	00003517          	auipc	a0,0x3
    80007dc8:	a3c50513          	addi	a0,a0,-1476 # 8000a800 <CONSOLE_STATUS+0x7f0>
    80007dcc:	00001097          	auipc	ra,0x1
    80007dd0:	8e0080e7          	jalr	-1824(ra) # 800086ac <panic>

0000000080007dd4 <trapinit>:
    80007dd4:	ff010113          	addi	sp,sp,-16
    80007dd8:	00813423          	sd	s0,8(sp)
    80007ddc:	01010413          	addi	s0,sp,16
    80007de0:	00813403          	ld	s0,8(sp)
    80007de4:	00003597          	auipc	a1,0x3
    80007de8:	a4458593          	addi	a1,a1,-1468 # 8000a828 <CONSOLE_STATUS+0x818>
    80007dec:	00006517          	auipc	a0,0x6
    80007df0:	46450513          	addi	a0,a0,1124 # 8000e250 <tickslock>
    80007df4:	01010113          	addi	sp,sp,16
    80007df8:	00001317          	auipc	t1,0x1
    80007dfc:	5c030067          	jr	1472(t1) # 800093b8 <initlock>

0000000080007e00 <trapinithart>:
    80007e00:	ff010113          	addi	sp,sp,-16
    80007e04:	00813423          	sd	s0,8(sp)
    80007e08:	01010413          	addi	s0,sp,16
    80007e0c:	00000797          	auipc	a5,0x0
    80007e10:	2f478793          	addi	a5,a5,756 # 80008100 <kernelvec>
    80007e14:	10579073          	csrw	stvec,a5
    80007e18:	00813403          	ld	s0,8(sp)
    80007e1c:	01010113          	addi	sp,sp,16
    80007e20:	00008067          	ret

0000000080007e24 <usertrap>:
    80007e24:	ff010113          	addi	sp,sp,-16
    80007e28:	00813423          	sd	s0,8(sp)
    80007e2c:	01010413          	addi	s0,sp,16
    80007e30:	00813403          	ld	s0,8(sp)
    80007e34:	01010113          	addi	sp,sp,16
    80007e38:	00008067          	ret

0000000080007e3c <usertrapret>:
    80007e3c:	ff010113          	addi	sp,sp,-16
    80007e40:	00813423          	sd	s0,8(sp)
    80007e44:	01010413          	addi	s0,sp,16
    80007e48:	00813403          	ld	s0,8(sp)
    80007e4c:	01010113          	addi	sp,sp,16
    80007e50:	00008067          	ret

0000000080007e54 <kerneltrap>:
    80007e54:	fe010113          	addi	sp,sp,-32
    80007e58:	00813823          	sd	s0,16(sp)
    80007e5c:	00113c23          	sd	ra,24(sp)
    80007e60:	00913423          	sd	s1,8(sp)
    80007e64:	02010413          	addi	s0,sp,32
    80007e68:	142025f3          	csrr	a1,scause
    80007e6c:	100027f3          	csrr	a5,sstatus
    80007e70:	0027f793          	andi	a5,a5,2
    80007e74:	10079c63          	bnez	a5,80007f8c <kerneltrap+0x138>
    80007e78:	142027f3          	csrr	a5,scause
    80007e7c:	0207ce63          	bltz	a5,80007eb8 <kerneltrap+0x64>
    80007e80:	00003517          	auipc	a0,0x3
    80007e84:	9f050513          	addi	a0,a0,-1552 # 8000a870 <CONSOLE_STATUS+0x860>
    80007e88:	00001097          	auipc	ra,0x1
    80007e8c:	880080e7          	jalr	-1920(ra) # 80008708 <__printf>
    80007e90:	141025f3          	csrr	a1,sepc
    80007e94:	14302673          	csrr	a2,stval
    80007e98:	00003517          	auipc	a0,0x3
    80007e9c:	9e850513          	addi	a0,a0,-1560 # 8000a880 <CONSOLE_STATUS+0x870>
    80007ea0:	00001097          	auipc	ra,0x1
    80007ea4:	868080e7          	jalr	-1944(ra) # 80008708 <__printf>
    80007ea8:	00003517          	auipc	a0,0x3
    80007eac:	9f050513          	addi	a0,a0,-1552 # 8000a898 <CONSOLE_STATUS+0x888>
    80007eb0:	00000097          	auipc	ra,0x0
    80007eb4:	7fc080e7          	jalr	2044(ra) # 800086ac <panic>
    80007eb8:	0ff7f713          	andi	a4,a5,255
    80007ebc:	00900693          	li	a3,9
    80007ec0:	04d70063          	beq	a4,a3,80007f00 <kerneltrap+0xac>
    80007ec4:	fff00713          	li	a4,-1
    80007ec8:	03f71713          	slli	a4,a4,0x3f
    80007ecc:	00170713          	addi	a4,a4,1
    80007ed0:	fae798e3          	bne	a5,a4,80007e80 <kerneltrap+0x2c>
    80007ed4:	00000097          	auipc	ra,0x0
    80007ed8:	e00080e7          	jalr	-512(ra) # 80007cd4 <cpuid>
    80007edc:	06050663          	beqz	a0,80007f48 <kerneltrap+0xf4>
    80007ee0:	144027f3          	csrr	a5,sip
    80007ee4:	ffd7f793          	andi	a5,a5,-3
    80007ee8:	14479073          	csrw	sip,a5
    80007eec:	01813083          	ld	ra,24(sp)
    80007ef0:	01013403          	ld	s0,16(sp)
    80007ef4:	00813483          	ld	s1,8(sp)
    80007ef8:	02010113          	addi	sp,sp,32
    80007efc:	00008067          	ret
    80007f00:	00000097          	auipc	ra,0x0
    80007f04:	3c4080e7          	jalr	964(ra) # 800082c4 <plic_claim>
    80007f08:	00a00793          	li	a5,10
    80007f0c:	00050493          	mv	s1,a0
    80007f10:	06f50863          	beq	a0,a5,80007f80 <kerneltrap+0x12c>
    80007f14:	fc050ce3          	beqz	a0,80007eec <kerneltrap+0x98>
    80007f18:	00050593          	mv	a1,a0
    80007f1c:	00003517          	auipc	a0,0x3
    80007f20:	93450513          	addi	a0,a0,-1740 # 8000a850 <CONSOLE_STATUS+0x840>
    80007f24:	00000097          	auipc	ra,0x0
    80007f28:	7e4080e7          	jalr	2020(ra) # 80008708 <__printf>
    80007f2c:	01013403          	ld	s0,16(sp)
    80007f30:	01813083          	ld	ra,24(sp)
    80007f34:	00048513          	mv	a0,s1
    80007f38:	00813483          	ld	s1,8(sp)
    80007f3c:	02010113          	addi	sp,sp,32
    80007f40:	00000317          	auipc	t1,0x0
    80007f44:	3bc30067          	jr	956(t1) # 800082fc <plic_complete>
    80007f48:	00006517          	auipc	a0,0x6
    80007f4c:	30850513          	addi	a0,a0,776 # 8000e250 <tickslock>
    80007f50:	00001097          	auipc	ra,0x1
    80007f54:	48c080e7          	jalr	1164(ra) # 800093dc <acquire>
    80007f58:	00005717          	auipc	a4,0x5
    80007f5c:	07c70713          	addi	a4,a4,124 # 8000cfd4 <ticks>
    80007f60:	00072783          	lw	a5,0(a4)
    80007f64:	00006517          	auipc	a0,0x6
    80007f68:	2ec50513          	addi	a0,a0,748 # 8000e250 <tickslock>
    80007f6c:	0017879b          	addiw	a5,a5,1
    80007f70:	00f72023          	sw	a5,0(a4)
    80007f74:	00001097          	auipc	ra,0x1
    80007f78:	534080e7          	jalr	1332(ra) # 800094a8 <release>
    80007f7c:	f65ff06f          	j	80007ee0 <kerneltrap+0x8c>
    80007f80:	00001097          	auipc	ra,0x1
    80007f84:	090080e7          	jalr	144(ra) # 80009010 <uartintr>
    80007f88:	fa5ff06f          	j	80007f2c <kerneltrap+0xd8>
    80007f8c:	00003517          	auipc	a0,0x3
    80007f90:	8a450513          	addi	a0,a0,-1884 # 8000a830 <CONSOLE_STATUS+0x820>
    80007f94:	00000097          	auipc	ra,0x0
    80007f98:	718080e7          	jalr	1816(ra) # 800086ac <panic>

0000000080007f9c <clockintr>:
    80007f9c:	fe010113          	addi	sp,sp,-32
    80007fa0:	00813823          	sd	s0,16(sp)
    80007fa4:	00913423          	sd	s1,8(sp)
    80007fa8:	00113c23          	sd	ra,24(sp)
    80007fac:	02010413          	addi	s0,sp,32
    80007fb0:	00006497          	auipc	s1,0x6
    80007fb4:	2a048493          	addi	s1,s1,672 # 8000e250 <tickslock>
    80007fb8:	00048513          	mv	a0,s1
    80007fbc:	00001097          	auipc	ra,0x1
    80007fc0:	420080e7          	jalr	1056(ra) # 800093dc <acquire>
    80007fc4:	00005717          	auipc	a4,0x5
    80007fc8:	01070713          	addi	a4,a4,16 # 8000cfd4 <ticks>
    80007fcc:	00072783          	lw	a5,0(a4)
    80007fd0:	01013403          	ld	s0,16(sp)
    80007fd4:	01813083          	ld	ra,24(sp)
    80007fd8:	00048513          	mv	a0,s1
    80007fdc:	0017879b          	addiw	a5,a5,1
    80007fe0:	00813483          	ld	s1,8(sp)
    80007fe4:	00f72023          	sw	a5,0(a4)
    80007fe8:	02010113          	addi	sp,sp,32
    80007fec:	00001317          	auipc	t1,0x1
    80007ff0:	4bc30067          	jr	1212(t1) # 800094a8 <release>

0000000080007ff4 <devintr>:
    80007ff4:	142027f3          	csrr	a5,scause
    80007ff8:	00000513          	li	a0,0
    80007ffc:	0007c463          	bltz	a5,80008004 <devintr+0x10>
    80008000:	00008067          	ret
    80008004:	fe010113          	addi	sp,sp,-32
    80008008:	00813823          	sd	s0,16(sp)
    8000800c:	00113c23          	sd	ra,24(sp)
    80008010:	00913423          	sd	s1,8(sp)
    80008014:	02010413          	addi	s0,sp,32
    80008018:	0ff7f713          	andi	a4,a5,255
    8000801c:	00900693          	li	a3,9
    80008020:	04d70c63          	beq	a4,a3,80008078 <devintr+0x84>
    80008024:	fff00713          	li	a4,-1
    80008028:	03f71713          	slli	a4,a4,0x3f
    8000802c:	00170713          	addi	a4,a4,1
    80008030:	00e78c63          	beq	a5,a4,80008048 <devintr+0x54>
    80008034:	01813083          	ld	ra,24(sp)
    80008038:	01013403          	ld	s0,16(sp)
    8000803c:	00813483          	ld	s1,8(sp)
    80008040:	02010113          	addi	sp,sp,32
    80008044:	00008067          	ret
    80008048:	00000097          	auipc	ra,0x0
    8000804c:	c8c080e7          	jalr	-884(ra) # 80007cd4 <cpuid>
    80008050:	06050663          	beqz	a0,800080bc <devintr+0xc8>
    80008054:	144027f3          	csrr	a5,sip
    80008058:	ffd7f793          	andi	a5,a5,-3
    8000805c:	14479073          	csrw	sip,a5
    80008060:	01813083          	ld	ra,24(sp)
    80008064:	01013403          	ld	s0,16(sp)
    80008068:	00813483          	ld	s1,8(sp)
    8000806c:	00200513          	li	a0,2
    80008070:	02010113          	addi	sp,sp,32
    80008074:	00008067          	ret
    80008078:	00000097          	auipc	ra,0x0
    8000807c:	24c080e7          	jalr	588(ra) # 800082c4 <plic_claim>
    80008080:	00a00793          	li	a5,10
    80008084:	00050493          	mv	s1,a0
    80008088:	06f50663          	beq	a0,a5,800080f4 <devintr+0x100>
    8000808c:	00100513          	li	a0,1
    80008090:	fa0482e3          	beqz	s1,80008034 <devintr+0x40>
    80008094:	00048593          	mv	a1,s1
    80008098:	00002517          	auipc	a0,0x2
    8000809c:	7b850513          	addi	a0,a0,1976 # 8000a850 <CONSOLE_STATUS+0x840>
    800080a0:	00000097          	auipc	ra,0x0
    800080a4:	668080e7          	jalr	1640(ra) # 80008708 <__printf>
    800080a8:	00048513          	mv	a0,s1
    800080ac:	00000097          	auipc	ra,0x0
    800080b0:	250080e7          	jalr	592(ra) # 800082fc <plic_complete>
    800080b4:	00100513          	li	a0,1
    800080b8:	f7dff06f          	j	80008034 <devintr+0x40>
    800080bc:	00006517          	auipc	a0,0x6
    800080c0:	19450513          	addi	a0,a0,404 # 8000e250 <tickslock>
    800080c4:	00001097          	auipc	ra,0x1
    800080c8:	318080e7          	jalr	792(ra) # 800093dc <acquire>
    800080cc:	00005717          	auipc	a4,0x5
    800080d0:	f0870713          	addi	a4,a4,-248 # 8000cfd4 <ticks>
    800080d4:	00072783          	lw	a5,0(a4)
    800080d8:	00006517          	auipc	a0,0x6
    800080dc:	17850513          	addi	a0,a0,376 # 8000e250 <tickslock>
    800080e0:	0017879b          	addiw	a5,a5,1
    800080e4:	00f72023          	sw	a5,0(a4)
    800080e8:	00001097          	auipc	ra,0x1
    800080ec:	3c0080e7          	jalr	960(ra) # 800094a8 <release>
    800080f0:	f65ff06f          	j	80008054 <devintr+0x60>
    800080f4:	00001097          	auipc	ra,0x1
    800080f8:	f1c080e7          	jalr	-228(ra) # 80009010 <uartintr>
    800080fc:	fadff06f          	j	800080a8 <devintr+0xb4>

0000000080008100 <kernelvec>:
    80008100:	f0010113          	addi	sp,sp,-256
    80008104:	00113023          	sd	ra,0(sp)
    80008108:	00213423          	sd	sp,8(sp)
    8000810c:	00313823          	sd	gp,16(sp)
    80008110:	00413c23          	sd	tp,24(sp)
    80008114:	02513023          	sd	t0,32(sp)
    80008118:	02613423          	sd	t1,40(sp)
    8000811c:	02713823          	sd	t2,48(sp)
    80008120:	02813c23          	sd	s0,56(sp)
    80008124:	04913023          	sd	s1,64(sp)
    80008128:	04a13423          	sd	a0,72(sp)
    8000812c:	04b13823          	sd	a1,80(sp)
    80008130:	04c13c23          	sd	a2,88(sp)
    80008134:	06d13023          	sd	a3,96(sp)
    80008138:	06e13423          	sd	a4,104(sp)
    8000813c:	06f13823          	sd	a5,112(sp)
    80008140:	07013c23          	sd	a6,120(sp)
    80008144:	09113023          	sd	a7,128(sp)
    80008148:	09213423          	sd	s2,136(sp)
    8000814c:	09313823          	sd	s3,144(sp)
    80008150:	09413c23          	sd	s4,152(sp)
    80008154:	0b513023          	sd	s5,160(sp)
    80008158:	0b613423          	sd	s6,168(sp)
    8000815c:	0b713823          	sd	s7,176(sp)
    80008160:	0b813c23          	sd	s8,184(sp)
    80008164:	0d913023          	sd	s9,192(sp)
    80008168:	0da13423          	sd	s10,200(sp)
    8000816c:	0db13823          	sd	s11,208(sp)
    80008170:	0dc13c23          	sd	t3,216(sp)
    80008174:	0fd13023          	sd	t4,224(sp)
    80008178:	0fe13423          	sd	t5,232(sp)
    8000817c:	0ff13823          	sd	t6,240(sp)
    80008180:	cd5ff0ef          	jal	ra,80007e54 <kerneltrap>
    80008184:	00013083          	ld	ra,0(sp)
    80008188:	00813103          	ld	sp,8(sp)
    8000818c:	01013183          	ld	gp,16(sp)
    80008190:	02013283          	ld	t0,32(sp)
    80008194:	02813303          	ld	t1,40(sp)
    80008198:	03013383          	ld	t2,48(sp)
    8000819c:	03813403          	ld	s0,56(sp)
    800081a0:	04013483          	ld	s1,64(sp)
    800081a4:	04813503          	ld	a0,72(sp)
    800081a8:	05013583          	ld	a1,80(sp)
    800081ac:	05813603          	ld	a2,88(sp)
    800081b0:	06013683          	ld	a3,96(sp)
    800081b4:	06813703          	ld	a4,104(sp)
    800081b8:	07013783          	ld	a5,112(sp)
    800081bc:	07813803          	ld	a6,120(sp)
    800081c0:	08013883          	ld	a7,128(sp)
    800081c4:	08813903          	ld	s2,136(sp)
    800081c8:	09013983          	ld	s3,144(sp)
    800081cc:	09813a03          	ld	s4,152(sp)
    800081d0:	0a013a83          	ld	s5,160(sp)
    800081d4:	0a813b03          	ld	s6,168(sp)
    800081d8:	0b013b83          	ld	s7,176(sp)
    800081dc:	0b813c03          	ld	s8,184(sp)
    800081e0:	0c013c83          	ld	s9,192(sp)
    800081e4:	0c813d03          	ld	s10,200(sp)
    800081e8:	0d013d83          	ld	s11,208(sp)
    800081ec:	0d813e03          	ld	t3,216(sp)
    800081f0:	0e013e83          	ld	t4,224(sp)
    800081f4:	0e813f03          	ld	t5,232(sp)
    800081f8:	0f013f83          	ld	t6,240(sp)
    800081fc:	10010113          	addi	sp,sp,256
    80008200:	10200073          	sret
    80008204:	00000013          	nop
    80008208:	00000013          	nop
    8000820c:	00000013          	nop

0000000080008210 <timervec>:
    80008210:	34051573          	csrrw	a0,mscratch,a0
    80008214:	00b53023          	sd	a1,0(a0)
    80008218:	00c53423          	sd	a2,8(a0)
    8000821c:	00d53823          	sd	a3,16(a0)
    80008220:	01853583          	ld	a1,24(a0)
    80008224:	02053603          	ld	a2,32(a0)
    80008228:	0005b683          	ld	a3,0(a1)
    8000822c:	00c686b3          	add	a3,a3,a2
    80008230:	00d5b023          	sd	a3,0(a1)
    80008234:	00200593          	li	a1,2
    80008238:	14459073          	csrw	sip,a1
    8000823c:	01053683          	ld	a3,16(a0)
    80008240:	00853603          	ld	a2,8(a0)
    80008244:	00053583          	ld	a1,0(a0)
    80008248:	34051573          	csrrw	a0,mscratch,a0
    8000824c:	30200073          	mret

0000000080008250 <plicinit>:
    80008250:	ff010113          	addi	sp,sp,-16
    80008254:	00813423          	sd	s0,8(sp)
    80008258:	01010413          	addi	s0,sp,16
    8000825c:	00813403          	ld	s0,8(sp)
    80008260:	0c0007b7          	lui	a5,0xc000
    80008264:	00100713          	li	a4,1
    80008268:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000826c:	00e7a223          	sw	a4,4(a5)
    80008270:	01010113          	addi	sp,sp,16
    80008274:	00008067          	ret

0000000080008278 <plicinithart>:
    80008278:	ff010113          	addi	sp,sp,-16
    8000827c:	00813023          	sd	s0,0(sp)
    80008280:	00113423          	sd	ra,8(sp)
    80008284:	01010413          	addi	s0,sp,16
    80008288:	00000097          	auipc	ra,0x0
    8000828c:	a4c080e7          	jalr	-1460(ra) # 80007cd4 <cpuid>
    80008290:	0085171b          	slliw	a4,a0,0x8
    80008294:	0c0027b7          	lui	a5,0xc002
    80008298:	00e787b3          	add	a5,a5,a4
    8000829c:	40200713          	li	a4,1026
    800082a0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800082a4:	00813083          	ld	ra,8(sp)
    800082a8:	00013403          	ld	s0,0(sp)
    800082ac:	00d5151b          	slliw	a0,a0,0xd
    800082b0:	0c2017b7          	lui	a5,0xc201
    800082b4:	00a78533          	add	a0,a5,a0
    800082b8:	00052023          	sw	zero,0(a0)
    800082bc:	01010113          	addi	sp,sp,16
    800082c0:	00008067          	ret

00000000800082c4 <plic_claim>:
    800082c4:	ff010113          	addi	sp,sp,-16
    800082c8:	00813023          	sd	s0,0(sp)
    800082cc:	00113423          	sd	ra,8(sp)
    800082d0:	01010413          	addi	s0,sp,16
    800082d4:	00000097          	auipc	ra,0x0
    800082d8:	a00080e7          	jalr	-1536(ra) # 80007cd4 <cpuid>
    800082dc:	00813083          	ld	ra,8(sp)
    800082e0:	00013403          	ld	s0,0(sp)
    800082e4:	00d5151b          	slliw	a0,a0,0xd
    800082e8:	0c2017b7          	lui	a5,0xc201
    800082ec:	00a78533          	add	a0,a5,a0
    800082f0:	00452503          	lw	a0,4(a0)
    800082f4:	01010113          	addi	sp,sp,16
    800082f8:	00008067          	ret

00000000800082fc <plic_complete>:
    800082fc:	fe010113          	addi	sp,sp,-32
    80008300:	00813823          	sd	s0,16(sp)
    80008304:	00913423          	sd	s1,8(sp)
    80008308:	00113c23          	sd	ra,24(sp)
    8000830c:	02010413          	addi	s0,sp,32
    80008310:	00050493          	mv	s1,a0
    80008314:	00000097          	auipc	ra,0x0
    80008318:	9c0080e7          	jalr	-1600(ra) # 80007cd4 <cpuid>
    8000831c:	01813083          	ld	ra,24(sp)
    80008320:	01013403          	ld	s0,16(sp)
    80008324:	00d5179b          	slliw	a5,a0,0xd
    80008328:	0c201737          	lui	a4,0xc201
    8000832c:	00f707b3          	add	a5,a4,a5
    80008330:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80008334:	00813483          	ld	s1,8(sp)
    80008338:	02010113          	addi	sp,sp,32
    8000833c:	00008067          	ret

0000000080008340 <consolewrite>:
    80008340:	fb010113          	addi	sp,sp,-80
    80008344:	04813023          	sd	s0,64(sp)
    80008348:	04113423          	sd	ra,72(sp)
    8000834c:	02913c23          	sd	s1,56(sp)
    80008350:	03213823          	sd	s2,48(sp)
    80008354:	03313423          	sd	s3,40(sp)
    80008358:	03413023          	sd	s4,32(sp)
    8000835c:	01513c23          	sd	s5,24(sp)
    80008360:	05010413          	addi	s0,sp,80
    80008364:	06c05c63          	blez	a2,800083dc <consolewrite+0x9c>
    80008368:	00060993          	mv	s3,a2
    8000836c:	00050a13          	mv	s4,a0
    80008370:	00058493          	mv	s1,a1
    80008374:	00000913          	li	s2,0
    80008378:	fff00a93          	li	s5,-1
    8000837c:	01c0006f          	j	80008398 <consolewrite+0x58>
    80008380:	fbf44503          	lbu	a0,-65(s0)
    80008384:	0019091b          	addiw	s2,s2,1
    80008388:	00148493          	addi	s1,s1,1
    8000838c:	00001097          	auipc	ra,0x1
    80008390:	a9c080e7          	jalr	-1380(ra) # 80008e28 <uartputc>
    80008394:	03298063          	beq	s3,s2,800083b4 <consolewrite+0x74>
    80008398:	00048613          	mv	a2,s1
    8000839c:	00100693          	li	a3,1
    800083a0:	000a0593          	mv	a1,s4
    800083a4:	fbf40513          	addi	a0,s0,-65
    800083a8:	00000097          	auipc	ra,0x0
    800083ac:	9e4080e7          	jalr	-1564(ra) # 80007d8c <either_copyin>
    800083b0:	fd5518e3          	bne	a0,s5,80008380 <consolewrite+0x40>
    800083b4:	04813083          	ld	ra,72(sp)
    800083b8:	04013403          	ld	s0,64(sp)
    800083bc:	03813483          	ld	s1,56(sp)
    800083c0:	02813983          	ld	s3,40(sp)
    800083c4:	02013a03          	ld	s4,32(sp)
    800083c8:	01813a83          	ld	s5,24(sp)
    800083cc:	00090513          	mv	a0,s2
    800083d0:	03013903          	ld	s2,48(sp)
    800083d4:	05010113          	addi	sp,sp,80
    800083d8:	00008067          	ret
    800083dc:	00000913          	li	s2,0
    800083e0:	fd5ff06f          	j	800083b4 <consolewrite+0x74>

00000000800083e4 <consoleread>:
    800083e4:	f9010113          	addi	sp,sp,-112
    800083e8:	06813023          	sd	s0,96(sp)
    800083ec:	04913c23          	sd	s1,88(sp)
    800083f0:	05213823          	sd	s2,80(sp)
    800083f4:	05313423          	sd	s3,72(sp)
    800083f8:	05413023          	sd	s4,64(sp)
    800083fc:	03513c23          	sd	s5,56(sp)
    80008400:	03613823          	sd	s6,48(sp)
    80008404:	03713423          	sd	s7,40(sp)
    80008408:	03813023          	sd	s8,32(sp)
    8000840c:	06113423          	sd	ra,104(sp)
    80008410:	01913c23          	sd	s9,24(sp)
    80008414:	07010413          	addi	s0,sp,112
    80008418:	00060b93          	mv	s7,a2
    8000841c:	00050913          	mv	s2,a0
    80008420:	00058c13          	mv	s8,a1
    80008424:	00060b1b          	sext.w	s6,a2
    80008428:	00006497          	auipc	s1,0x6
    8000842c:	e5048493          	addi	s1,s1,-432 # 8000e278 <cons>
    80008430:	00400993          	li	s3,4
    80008434:	fff00a13          	li	s4,-1
    80008438:	00a00a93          	li	s5,10
    8000843c:	05705e63          	blez	s7,80008498 <consoleread+0xb4>
    80008440:	09c4a703          	lw	a4,156(s1)
    80008444:	0984a783          	lw	a5,152(s1)
    80008448:	0007071b          	sext.w	a4,a4
    8000844c:	08e78463          	beq	a5,a4,800084d4 <consoleread+0xf0>
    80008450:	07f7f713          	andi	a4,a5,127
    80008454:	00e48733          	add	a4,s1,a4
    80008458:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000845c:	0017869b          	addiw	a3,a5,1
    80008460:	08d4ac23          	sw	a3,152(s1)
    80008464:	00070c9b          	sext.w	s9,a4
    80008468:	0b370663          	beq	a4,s3,80008514 <consoleread+0x130>
    8000846c:	00100693          	li	a3,1
    80008470:	f9f40613          	addi	a2,s0,-97
    80008474:	000c0593          	mv	a1,s8
    80008478:	00090513          	mv	a0,s2
    8000847c:	f8e40fa3          	sb	a4,-97(s0)
    80008480:	00000097          	auipc	ra,0x0
    80008484:	8c0080e7          	jalr	-1856(ra) # 80007d40 <either_copyout>
    80008488:	01450863          	beq	a0,s4,80008498 <consoleread+0xb4>
    8000848c:	001c0c13          	addi	s8,s8,1
    80008490:	fffb8b9b          	addiw	s7,s7,-1
    80008494:	fb5c94e3          	bne	s9,s5,8000843c <consoleread+0x58>
    80008498:	000b851b          	sext.w	a0,s7
    8000849c:	06813083          	ld	ra,104(sp)
    800084a0:	06013403          	ld	s0,96(sp)
    800084a4:	05813483          	ld	s1,88(sp)
    800084a8:	05013903          	ld	s2,80(sp)
    800084ac:	04813983          	ld	s3,72(sp)
    800084b0:	04013a03          	ld	s4,64(sp)
    800084b4:	03813a83          	ld	s5,56(sp)
    800084b8:	02813b83          	ld	s7,40(sp)
    800084bc:	02013c03          	ld	s8,32(sp)
    800084c0:	01813c83          	ld	s9,24(sp)
    800084c4:	40ab053b          	subw	a0,s6,a0
    800084c8:	03013b03          	ld	s6,48(sp)
    800084cc:	07010113          	addi	sp,sp,112
    800084d0:	00008067          	ret
    800084d4:	00001097          	auipc	ra,0x1
    800084d8:	1d8080e7          	jalr	472(ra) # 800096ac <push_on>
    800084dc:	0984a703          	lw	a4,152(s1)
    800084e0:	09c4a783          	lw	a5,156(s1)
    800084e4:	0007879b          	sext.w	a5,a5
    800084e8:	fef70ce3          	beq	a4,a5,800084e0 <consoleread+0xfc>
    800084ec:	00001097          	auipc	ra,0x1
    800084f0:	234080e7          	jalr	564(ra) # 80009720 <pop_on>
    800084f4:	0984a783          	lw	a5,152(s1)
    800084f8:	07f7f713          	andi	a4,a5,127
    800084fc:	00e48733          	add	a4,s1,a4
    80008500:	01874703          	lbu	a4,24(a4)
    80008504:	0017869b          	addiw	a3,a5,1
    80008508:	08d4ac23          	sw	a3,152(s1)
    8000850c:	00070c9b          	sext.w	s9,a4
    80008510:	f5371ee3          	bne	a4,s3,8000846c <consoleread+0x88>
    80008514:	000b851b          	sext.w	a0,s7
    80008518:	f96bf2e3          	bgeu	s7,s6,8000849c <consoleread+0xb8>
    8000851c:	08f4ac23          	sw	a5,152(s1)
    80008520:	f7dff06f          	j	8000849c <consoleread+0xb8>

0000000080008524 <consputc>:
    80008524:	10000793          	li	a5,256
    80008528:	00f50663          	beq	a0,a5,80008534 <consputc+0x10>
    8000852c:	00001317          	auipc	t1,0x1
    80008530:	9f430067          	jr	-1548(t1) # 80008f20 <uartputc_sync>
    80008534:	ff010113          	addi	sp,sp,-16
    80008538:	00113423          	sd	ra,8(sp)
    8000853c:	00813023          	sd	s0,0(sp)
    80008540:	01010413          	addi	s0,sp,16
    80008544:	00800513          	li	a0,8
    80008548:	00001097          	auipc	ra,0x1
    8000854c:	9d8080e7          	jalr	-1576(ra) # 80008f20 <uartputc_sync>
    80008550:	02000513          	li	a0,32
    80008554:	00001097          	auipc	ra,0x1
    80008558:	9cc080e7          	jalr	-1588(ra) # 80008f20 <uartputc_sync>
    8000855c:	00013403          	ld	s0,0(sp)
    80008560:	00813083          	ld	ra,8(sp)
    80008564:	00800513          	li	a0,8
    80008568:	01010113          	addi	sp,sp,16
    8000856c:	00001317          	auipc	t1,0x1
    80008570:	9b430067          	jr	-1612(t1) # 80008f20 <uartputc_sync>

0000000080008574 <consoleintr>:
    80008574:	fe010113          	addi	sp,sp,-32
    80008578:	00813823          	sd	s0,16(sp)
    8000857c:	00913423          	sd	s1,8(sp)
    80008580:	01213023          	sd	s2,0(sp)
    80008584:	00113c23          	sd	ra,24(sp)
    80008588:	02010413          	addi	s0,sp,32
    8000858c:	00006917          	auipc	s2,0x6
    80008590:	cec90913          	addi	s2,s2,-788 # 8000e278 <cons>
    80008594:	00050493          	mv	s1,a0
    80008598:	00090513          	mv	a0,s2
    8000859c:	00001097          	auipc	ra,0x1
    800085a0:	e40080e7          	jalr	-448(ra) # 800093dc <acquire>
    800085a4:	02048c63          	beqz	s1,800085dc <consoleintr+0x68>
    800085a8:	0a092783          	lw	a5,160(s2)
    800085ac:	09892703          	lw	a4,152(s2)
    800085b0:	07f00693          	li	a3,127
    800085b4:	40e7873b          	subw	a4,a5,a4
    800085b8:	02e6e263          	bltu	a3,a4,800085dc <consoleintr+0x68>
    800085bc:	00d00713          	li	a4,13
    800085c0:	04e48063          	beq	s1,a4,80008600 <consoleintr+0x8c>
    800085c4:	07f7f713          	andi	a4,a5,127
    800085c8:	00e90733          	add	a4,s2,a4
    800085cc:	0017879b          	addiw	a5,a5,1
    800085d0:	0af92023          	sw	a5,160(s2)
    800085d4:	00970c23          	sb	s1,24(a4)
    800085d8:	08f92e23          	sw	a5,156(s2)
    800085dc:	01013403          	ld	s0,16(sp)
    800085e0:	01813083          	ld	ra,24(sp)
    800085e4:	00813483          	ld	s1,8(sp)
    800085e8:	00013903          	ld	s2,0(sp)
    800085ec:	00006517          	auipc	a0,0x6
    800085f0:	c8c50513          	addi	a0,a0,-884 # 8000e278 <cons>
    800085f4:	02010113          	addi	sp,sp,32
    800085f8:	00001317          	auipc	t1,0x1
    800085fc:	eb030067          	jr	-336(t1) # 800094a8 <release>
    80008600:	00a00493          	li	s1,10
    80008604:	fc1ff06f          	j	800085c4 <consoleintr+0x50>

0000000080008608 <consoleinit>:
    80008608:	fe010113          	addi	sp,sp,-32
    8000860c:	00113c23          	sd	ra,24(sp)
    80008610:	00813823          	sd	s0,16(sp)
    80008614:	00913423          	sd	s1,8(sp)
    80008618:	02010413          	addi	s0,sp,32
    8000861c:	00006497          	auipc	s1,0x6
    80008620:	c5c48493          	addi	s1,s1,-932 # 8000e278 <cons>
    80008624:	00048513          	mv	a0,s1
    80008628:	00002597          	auipc	a1,0x2
    8000862c:	28058593          	addi	a1,a1,640 # 8000a8a8 <CONSOLE_STATUS+0x898>
    80008630:	00001097          	auipc	ra,0x1
    80008634:	d88080e7          	jalr	-632(ra) # 800093b8 <initlock>
    80008638:	00000097          	auipc	ra,0x0
    8000863c:	7ac080e7          	jalr	1964(ra) # 80008de4 <uartinit>
    80008640:	01813083          	ld	ra,24(sp)
    80008644:	01013403          	ld	s0,16(sp)
    80008648:	00000797          	auipc	a5,0x0
    8000864c:	d9c78793          	addi	a5,a5,-612 # 800083e4 <consoleread>
    80008650:	0af4bc23          	sd	a5,184(s1)
    80008654:	00000797          	auipc	a5,0x0
    80008658:	cec78793          	addi	a5,a5,-788 # 80008340 <consolewrite>
    8000865c:	0cf4b023          	sd	a5,192(s1)
    80008660:	00813483          	ld	s1,8(sp)
    80008664:	02010113          	addi	sp,sp,32
    80008668:	00008067          	ret

000000008000866c <console_read>:
    8000866c:	ff010113          	addi	sp,sp,-16
    80008670:	00813423          	sd	s0,8(sp)
    80008674:	01010413          	addi	s0,sp,16
    80008678:	00813403          	ld	s0,8(sp)
    8000867c:	00006317          	auipc	t1,0x6
    80008680:	cb433303          	ld	t1,-844(t1) # 8000e330 <devsw+0x10>
    80008684:	01010113          	addi	sp,sp,16
    80008688:	00030067          	jr	t1

000000008000868c <console_write>:
    8000868c:	ff010113          	addi	sp,sp,-16
    80008690:	00813423          	sd	s0,8(sp)
    80008694:	01010413          	addi	s0,sp,16
    80008698:	00813403          	ld	s0,8(sp)
    8000869c:	00006317          	auipc	t1,0x6
    800086a0:	c9c33303          	ld	t1,-868(t1) # 8000e338 <devsw+0x18>
    800086a4:	01010113          	addi	sp,sp,16
    800086a8:	00030067          	jr	t1

00000000800086ac <panic>:
    800086ac:	fe010113          	addi	sp,sp,-32
    800086b0:	00113c23          	sd	ra,24(sp)
    800086b4:	00813823          	sd	s0,16(sp)
    800086b8:	00913423          	sd	s1,8(sp)
    800086bc:	02010413          	addi	s0,sp,32
    800086c0:	00050493          	mv	s1,a0
    800086c4:	00002517          	auipc	a0,0x2
    800086c8:	1ec50513          	addi	a0,a0,492 # 8000a8b0 <CONSOLE_STATUS+0x8a0>
    800086cc:	00006797          	auipc	a5,0x6
    800086d0:	d007a623          	sw	zero,-756(a5) # 8000e3d8 <pr+0x18>
    800086d4:	00000097          	auipc	ra,0x0
    800086d8:	034080e7          	jalr	52(ra) # 80008708 <__printf>
    800086dc:	00048513          	mv	a0,s1
    800086e0:	00000097          	auipc	ra,0x0
    800086e4:	028080e7          	jalr	40(ra) # 80008708 <__printf>
    800086e8:	00002517          	auipc	a0,0x2
    800086ec:	f5050513          	addi	a0,a0,-176 # 8000a638 <CONSOLE_STATUS+0x628>
    800086f0:	00000097          	auipc	ra,0x0
    800086f4:	018080e7          	jalr	24(ra) # 80008708 <__printf>
    800086f8:	00100793          	li	a5,1
    800086fc:	00005717          	auipc	a4,0x5
    80008700:	8cf72e23          	sw	a5,-1828(a4) # 8000cfd8 <panicked>
    80008704:	0000006f          	j	80008704 <panic+0x58>

0000000080008708 <__printf>:
    80008708:	f3010113          	addi	sp,sp,-208
    8000870c:	08813023          	sd	s0,128(sp)
    80008710:	07313423          	sd	s3,104(sp)
    80008714:	09010413          	addi	s0,sp,144
    80008718:	05813023          	sd	s8,64(sp)
    8000871c:	08113423          	sd	ra,136(sp)
    80008720:	06913c23          	sd	s1,120(sp)
    80008724:	07213823          	sd	s2,112(sp)
    80008728:	07413023          	sd	s4,96(sp)
    8000872c:	05513c23          	sd	s5,88(sp)
    80008730:	05613823          	sd	s6,80(sp)
    80008734:	05713423          	sd	s7,72(sp)
    80008738:	03913c23          	sd	s9,56(sp)
    8000873c:	03a13823          	sd	s10,48(sp)
    80008740:	03b13423          	sd	s11,40(sp)
    80008744:	00006317          	auipc	t1,0x6
    80008748:	c7c30313          	addi	t1,t1,-900 # 8000e3c0 <pr>
    8000874c:	01832c03          	lw	s8,24(t1)
    80008750:	00b43423          	sd	a1,8(s0)
    80008754:	00c43823          	sd	a2,16(s0)
    80008758:	00d43c23          	sd	a3,24(s0)
    8000875c:	02e43023          	sd	a4,32(s0)
    80008760:	02f43423          	sd	a5,40(s0)
    80008764:	03043823          	sd	a6,48(s0)
    80008768:	03143c23          	sd	a7,56(s0)
    8000876c:	00050993          	mv	s3,a0
    80008770:	4a0c1663          	bnez	s8,80008c1c <__printf+0x514>
    80008774:	60098c63          	beqz	s3,80008d8c <__printf+0x684>
    80008778:	0009c503          	lbu	a0,0(s3)
    8000877c:	00840793          	addi	a5,s0,8
    80008780:	f6f43c23          	sd	a5,-136(s0)
    80008784:	00000493          	li	s1,0
    80008788:	22050063          	beqz	a0,800089a8 <__printf+0x2a0>
    8000878c:	00002a37          	lui	s4,0x2
    80008790:	00018ab7          	lui	s5,0x18
    80008794:	000f4b37          	lui	s6,0xf4
    80008798:	00989bb7          	lui	s7,0x989
    8000879c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800087a0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800087a4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800087a8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800087ac:	00148c9b          	addiw	s9,s1,1
    800087b0:	02500793          	li	a5,37
    800087b4:	01998933          	add	s2,s3,s9
    800087b8:	38f51263          	bne	a0,a5,80008b3c <__printf+0x434>
    800087bc:	00094783          	lbu	a5,0(s2)
    800087c0:	00078c9b          	sext.w	s9,a5
    800087c4:	1e078263          	beqz	a5,800089a8 <__printf+0x2a0>
    800087c8:	0024849b          	addiw	s1,s1,2
    800087cc:	07000713          	li	a4,112
    800087d0:	00998933          	add	s2,s3,s1
    800087d4:	38e78a63          	beq	a5,a4,80008b68 <__printf+0x460>
    800087d8:	20f76863          	bltu	a4,a5,800089e8 <__printf+0x2e0>
    800087dc:	42a78863          	beq	a5,a0,80008c0c <__printf+0x504>
    800087e0:	06400713          	li	a4,100
    800087e4:	40e79663          	bne	a5,a4,80008bf0 <__printf+0x4e8>
    800087e8:	f7843783          	ld	a5,-136(s0)
    800087ec:	0007a603          	lw	a2,0(a5)
    800087f0:	00878793          	addi	a5,a5,8
    800087f4:	f6f43c23          	sd	a5,-136(s0)
    800087f8:	42064a63          	bltz	a2,80008c2c <__printf+0x524>
    800087fc:	00a00713          	li	a4,10
    80008800:	02e677bb          	remuw	a5,a2,a4
    80008804:	00002d97          	auipc	s11,0x2
    80008808:	0d4d8d93          	addi	s11,s11,212 # 8000a8d8 <digits>
    8000880c:	00900593          	li	a1,9
    80008810:	0006051b          	sext.w	a0,a2
    80008814:	00000c93          	li	s9,0
    80008818:	02079793          	slli	a5,a5,0x20
    8000881c:	0207d793          	srli	a5,a5,0x20
    80008820:	00fd87b3          	add	a5,s11,a5
    80008824:	0007c783          	lbu	a5,0(a5)
    80008828:	02e656bb          	divuw	a3,a2,a4
    8000882c:	f8f40023          	sb	a5,-128(s0)
    80008830:	14c5d863          	bge	a1,a2,80008980 <__printf+0x278>
    80008834:	06300593          	li	a1,99
    80008838:	00100c93          	li	s9,1
    8000883c:	02e6f7bb          	remuw	a5,a3,a4
    80008840:	02079793          	slli	a5,a5,0x20
    80008844:	0207d793          	srli	a5,a5,0x20
    80008848:	00fd87b3          	add	a5,s11,a5
    8000884c:	0007c783          	lbu	a5,0(a5)
    80008850:	02e6d73b          	divuw	a4,a3,a4
    80008854:	f8f400a3          	sb	a5,-127(s0)
    80008858:	12a5f463          	bgeu	a1,a0,80008980 <__printf+0x278>
    8000885c:	00a00693          	li	a3,10
    80008860:	00900593          	li	a1,9
    80008864:	02d777bb          	remuw	a5,a4,a3
    80008868:	02079793          	slli	a5,a5,0x20
    8000886c:	0207d793          	srli	a5,a5,0x20
    80008870:	00fd87b3          	add	a5,s11,a5
    80008874:	0007c503          	lbu	a0,0(a5)
    80008878:	02d757bb          	divuw	a5,a4,a3
    8000887c:	f8a40123          	sb	a0,-126(s0)
    80008880:	48e5f263          	bgeu	a1,a4,80008d04 <__printf+0x5fc>
    80008884:	06300513          	li	a0,99
    80008888:	02d7f5bb          	remuw	a1,a5,a3
    8000888c:	02059593          	slli	a1,a1,0x20
    80008890:	0205d593          	srli	a1,a1,0x20
    80008894:	00bd85b3          	add	a1,s11,a1
    80008898:	0005c583          	lbu	a1,0(a1)
    8000889c:	02d7d7bb          	divuw	a5,a5,a3
    800088a0:	f8b401a3          	sb	a1,-125(s0)
    800088a4:	48e57263          	bgeu	a0,a4,80008d28 <__printf+0x620>
    800088a8:	3e700513          	li	a0,999
    800088ac:	02d7f5bb          	remuw	a1,a5,a3
    800088b0:	02059593          	slli	a1,a1,0x20
    800088b4:	0205d593          	srli	a1,a1,0x20
    800088b8:	00bd85b3          	add	a1,s11,a1
    800088bc:	0005c583          	lbu	a1,0(a1)
    800088c0:	02d7d7bb          	divuw	a5,a5,a3
    800088c4:	f8b40223          	sb	a1,-124(s0)
    800088c8:	46e57663          	bgeu	a0,a4,80008d34 <__printf+0x62c>
    800088cc:	02d7f5bb          	remuw	a1,a5,a3
    800088d0:	02059593          	slli	a1,a1,0x20
    800088d4:	0205d593          	srli	a1,a1,0x20
    800088d8:	00bd85b3          	add	a1,s11,a1
    800088dc:	0005c583          	lbu	a1,0(a1)
    800088e0:	02d7d7bb          	divuw	a5,a5,a3
    800088e4:	f8b402a3          	sb	a1,-123(s0)
    800088e8:	46ea7863          	bgeu	s4,a4,80008d58 <__printf+0x650>
    800088ec:	02d7f5bb          	remuw	a1,a5,a3
    800088f0:	02059593          	slli	a1,a1,0x20
    800088f4:	0205d593          	srli	a1,a1,0x20
    800088f8:	00bd85b3          	add	a1,s11,a1
    800088fc:	0005c583          	lbu	a1,0(a1)
    80008900:	02d7d7bb          	divuw	a5,a5,a3
    80008904:	f8b40323          	sb	a1,-122(s0)
    80008908:	3eeaf863          	bgeu	s5,a4,80008cf8 <__printf+0x5f0>
    8000890c:	02d7f5bb          	remuw	a1,a5,a3
    80008910:	02059593          	slli	a1,a1,0x20
    80008914:	0205d593          	srli	a1,a1,0x20
    80008918:	00bd85b3          	add	a1,s11,a1
    8000891c:	0005c583          	lbu	a1,0(a1)
    80008920:	02d7d7bb          	divuw	a5,a5,a3
    80008924:	f8b403a3          	sb	a1,-121(s0)
    80008928:	42eb7e63          	bgeu	s6,a4,80008d64 <__printf+0x65c>
    8000892c:	02d7f5bb          	remuw	a1,a5,a3
    80008930:	02059593          	slli	a1,a1,0x20
    80008934:	0205d593          	srli	a1,a1,0x20
    80008938:	00bd85b3          	add	a1,s11,a1
    8000893c:	0005c583          	lbu	a1,0(a1)
    80008940:	02d7d7bb          	divuw	a5,a5,a3
    80008944:	f8b40423          	sb	a1,-120(s0)
    80008948:	42ebfc63          	bgeu	s7,a4,80008d80 <__printf+0x678>
    8000894c:	02079793          	slli	a5,a5,0x20
    80008950:	0207d793          	srli	a5,a5,0x20
    80008954:	00fd8db3          	add	s11,s11,a5
    80008958:	000dc703          	lbu	a4,0(s11)
    8000895c:	00a00793          	li	a5,10
    80008960:	00900c93          	li	s9,9
    80008964:	f8e404a3          	sb	a4,-119(s0)
    80008968:	00065c63          	bgez	a2,80008980 <__printf+0x278>
    8000896c:	f9040713          	addi	a4,s0,-112
    80008970:	00f70733          	add	a4,a4,a5
    80008974:	02d00693          	li	a3,45
    80008978:	fed70823          	sb	a3,-16(a4)
    8000897c:	00078c93          	mv	s9,a5
    80008980:	f8040793          	addi	a5,s0,-128
    80008984:	01978cb3          	add	s9,a5,s9
    80008988:	f7f40d13          	addi	s10,s0,-129
    8000898c:	000cc503          	lbu	a0,0(s9)
    80008990:	fffc8c93          	addi	s9,s9,-1
    80008994:	00000097          	auipc	ra,0x0
    80008998:	b90080e7          	jalr	-1136(ra) # 80008524 <consputc>
    8000899c:	ffac98e3          	bne	s9,s10,8000898c <__printf+0x284>
    800089a0:	00094503          	lbu	a0,0(s2)
    800089a4:	e00514e3          	bnez	a0,800087ac <__printf+0xa4>
    800089a8:	1a0c1663          	bnez	s8,80008b54 <__printf+0x44c>
    800089ac:	08813083          	ld	ra,136(sp)
    800089b0:	08013403          	ld	s0,128(sp)
    800089b4:	07813483          	ld	s1,120(sp)
    800089b8:	07013903          	ld	s2,112(sp)
    800089bc:	06813983          	ld	s3,104(sp)
    800089c0:	06013a03          	ld	s4,96(sp)
    800089c4:	05813a83          	ld	s5,88(sp)
    800089c8:	05013b03          	ld	s6,80(sp)
    800089cc:	04813b83          	ld	s7,72(sp)
    800089d0:	04013c03          	ld	s8,64(sp)
    800089d4:	03813c83          	ld	s9,56(sp)
    800089d8:	03013d03          	ld	s10,48(sp)
    800089dc:	02813d83          	ld	s11,40(sp)
    800089e0:	0d010113          	addi	sp,sp,208
    800089e4:	00008067          	ret
    800089e8:	07300713          	li	a4,115
    800089ec:	1ce78a63          	beq	a5,a4,80008bc0 <__printf+0x4b8>
    800089f0:	07800713          	li	a4,120
    800089f4:	1ee79e63          	bne	a5,a4,80008bf0 <__printf+0x4e8>
    800089f8:	f7843783          	ld	a5,-136(s0)
    800089fc:	0007a703          	lw	a4,0(a5)
    80008a00:	00878793          	addi	a5,a5,8
    80008a04:	f6f43c23          	sd	a5,-136(s0)
    80008a08:	28074263          	bltz	a4,80008c8c <__printf+0x584>
    80008a0c:	00002d97          	auipc	s11,0x2
    80008a10:	eccd8d93          	addi	s11,s11,-308 # 8000a8d8 <digits>
    80008a14:	00f77793          	andi	a5,a4,15
    80008a18:	00fd87b3          	add	a5,s11,a5
    80008a1c:	0007c683          	lbu	a3,0(a5)
    80008a20:	00f00613          	li	a2,15
    80008a24:	0007079b          	sext.w	a5,a4
    80008a28:	f8d40023          	sb	a3,-128(s0)
    80008a2c:	0047559b          	srliw	a1,a4,0x4
    80008a30:	0047569b          	srliw	a3,a4,0x4
    80008a34:	00000c93          	li	s9,0
    80008a38:	0ee65063          	bge	a2,a4,80008b18 <__printf+0x410>
    80008a3c:	00f6f693          	andi	a3,a3,15
    80008a40:	00dd86b3          	add	a3,s11,a3
    80008a44:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80008a48:	0087d79b          	srliw	a5,a5,0x8
    80008a4c:	00100c93          	li	s9,1
    80008a50:	f8d400a3          	sb	a3,-127(s0)
    80008a54:	0cb67263          	bgeu	a2,a1,80008b18 <__printf+0x410>
    80008a58:	00f7f693          	andi	a3,a5,15
    80008a5c:	00dd86b3          	add	a3,s11,a3
    80008a60:	0006c583          	lbu	a1,0(a3)
    80008a64:	00f00613          	li	a2,15
    80008a68:	0047d69b          	srliw	a3,a5,0x4
    80008a6c:	f8b40123          	sb	a1,-126(s0)
    80008a70:	0047d593          	srli	a1,a5,0x4
    80008a74:	28f67e63          	bgeu	a2,a5,80008d10 <__printf+0x608>
    80008a78:	00f6f693          	andi	a3,a3,15
    80008a7c:	00dd86b3          	add	a3,s11,a3
    80008a80:	0006c503          	lbu	a0,0(a3)
    80008a84:	0087d813          	srli	a6,a5,0x8
    80008a88:	0087d69b          	srliw	a3,a5,0x8
    80008a8c:	f8a401a3          	sb	a0,-125(s0)
    80008a90:	28b67663          	bgeu	a2,a1,80008d1c <__printf+0x614>
    80008a94:	00f6f693          	andi	a3,a3,15
    80008a98:	00dd86b3          	add	a3,s11,a3
    80008a9c:	0006c583          	lbu	a1,0(a3)
    80008aa0:	00c7d513          	srli	a0,a5,0xc
    80008aa4:	00c7d69b          	srliw	a3,a5,0xc
    80008aa8:	f8b40223          	sb	a1,-124(s0)
    80008aac:	29067a63          	bgeu	a2,a6,80008d40 <__printf+0x638>
    80008ab0:	00f6f693          	andi	a3,a3,15
    80008ab4:	00dd86b3          	add	a3,s11,a3
    80008ab8:	0006c583          	lbu	a1,0(a3)
    80008abc:	0107d813          	srli	a6,a5,0x10
    80008ac0:	0107d69b          	srliw	a3,a5,0x10
    80008ac4:	f8b402a3          	sb	a1,-123(s0)
    80008ac8:	28a67263          	bgeu	a2,a0,80008d4c <__printf+0x644>
    80008acc:	00f6f693          	andi	a3,a3,15
    80008ad0:	00dd86b3          	add	a3,s11,a3
    80008ad4:	0006c683          	lbu	a3,0(a3)
    80008ad8:	0147d79b          	srliw	a5,a5,0x14
    80008adc:	f8d40323          	sb	a3,-122(s0)
    80008ae0:	21067663          	bgeu	a2,a6,80008cec <__printf+0x5e4>
    80008ae4:	02079793          	slli	a5,a5,0x20
    80008ae8:	0207d793          	srli	a5,a5,0x20
    80008aec:	00fd8db3          	add	s11,s11,a5
    80008af0:	000dc683          	lbu	a3,0(s11)
    80008af4:	00800793          	li	a5,8
    80008af8:	00700c93          	li	s9,7
    80008afc:	f8d403a3          	sb	a3,-121(s0)
    80008b00:	00075c63          	bgez	a4,80008b18 <__printf+0x410>
    80008b04:	f9040713          	addi	a4,s0,-112
    80008b08:	00f70733          	add	a4,a4,a5
    80008b0c:	02d00693          	li	a3,45
    80008b10:	fed70823          	sb	a3,-16(a4)
    80008b14:	00078c93          	mv	s9,a5
    80008b18:	f8040793          	addi	a5,s0,-128
    80008b1c:	01978cb3          	add	s9,a5,s9
    80008b20:	f7f40d13          	addi	s10,s0,-129
    80008b24:	000cc503          	lbu	a0,0(s9)
    80008b28:	fffc8c93          	addi	s9,s9,-1
    80008b2c:	00000097          	auipc	ra,0x0
    80008b30:	9f8080e7          	jalr	-1544(ra) # 80008524 <consputc>
    80008b34:	ff9d18e3          	bne	s10,s9,80008b24 <__printf+0x41c>
    80008b38:	0100006f          	j	80008b48 <__printf+0x440>
    80008b3c:	00000097          	auipc	ra,0x0
    80008b40:	9e8080e7          	jalr	-1560(ra) # 80008524 <consputc>
    80008b44:	000c8493          	mv	s1,s9
    80008b48:	00094503          	lbu	a0,0(s2)
    80008b4c:	c60510e3          	bnez	a0,800087ac <__printf+0xa4>
    80008b50:	e40c0ee3          	beqz	s8,800089ac <__printf+0x2a4>
    80008b54:	00006517          	auipc	a0,0x6
    80008b58:	86c50513          	addi	a0,a0,-1940 # 8000e3c0 <pr>
    80008b5c:	00001097          	auipc	ra,0x1
    80008b60:	94c080e7          	jalr	-1716(ra) # 800094a8 <release>
    80008b64:	e49ff06f          	j	800089ac <__printf+0x2a4>
    80008b68:	f7843783          	ld	a5,-136(s0)
    80008b6c:	03000513          	li	a0,48
    80008b70:	01000d13          	li	s10,16
    80008b74:	00878713          	addi	a4,a5,8
    80008b78:	0007bc83          	ld	s9,0(a5)
    80008b7c:	f6e43c23          	sd	a4,-136(s0)
    80008b80:	00000097          	auipc	ra,0x0
    80008b84:	9a4080e7          	jalr	-1628(ra) # 80008524 <consputc>
    80008b88:	07800513          	li	a0,120
    80008b8c:	00000097          	auipc	ra,0x0
    80008b90:	998080e7          	jalr	-1640(ra) # 80008524 <consputc>
    80008b94:	00002d97          	auipc	s11,0x2
    80008b98:	d44d8d93          	addi	s11,s11,-700 # 8000a8d8 <digits>
    80008b9c:	03ccd793          	srli	a5,s9,0x3c
    80008ba0:	00fd87b3          	add	a5,s11,a5
    80008ba4:	0007c503          	lbu	a0,0(a5)
    80008ba8:	fffd0d1b          	addiw	s10,s10,-1
    80008bac:	004c9c93          	slli	s9,s9,0x4
    80008bb0:	00000097          	auipc	ra,0x0
    80008bb4:	974080e7          	jalr	-1676(ra) # 80008524 <consputc>
    80008bb8:	fe0d12e3          	bnez	s10,80008b9c <__printf+0x494>
    80008bbc:	f8dff06f          	j	80008b48 <__printf+0x440>
    80008bc0:	f7843783          	ld	a5,-136(s0)
    80008bc4:	0007bc83          	ld	s9,0(a5)
    80008bc8:	00878793          	addi	a5,a5,8
    80008bcc:	f6f43c23          	sd	a5,-136(s0)
    80008bd0:	000c9a63          	bnez	s9,80008be4 <__printf+0x4dc>
    80008bd4:	1080006f          	j	80008cdc <__printf+0x5d4>
    80008bd8:	001c8c93          	addi	s9,s9,1
    80008bdc:	00000097          	auipc	ra,0x0
    80008be0:	948080e7          	jalr	-1720(ra) # 80008524 <consputc>
    80008be4:	000cc503          	lbu	a0,0(s9)
    80008be8:	fe0518e3          	bnez	a0,80008bd8 <__printf+0x4d0>
    80008bec:	f5dff06f          	j	80008b48 <__printf+0x440>
    80008bf0:	02500513          	li	a0,37
    80008bf4:	00000097          	auipc	ra,0x0
    80008bf8:	930080e7          	jalr	-1744(ra) # 80008524 <consputc>
    80008bfc:	000c8513          	mv	a0,s9
    80008c00:	00000097          	auipc	ra,0x0
    80008c04:	924080e7          	jalr	-1756(ra) # 80008524 <consputc>
    80008c08:	f41ff06f          	j	80008b48 <__printf+0x440>
    80008c0c:	02500513          	li	a0,37
    80008c10:	00000097          	auipc	ra,0x0
    80008c14:	914080e7          	jalr	-1772(ra) # 80008524 <consputc>
    80008c18:	f31ff06f          	j	80008b48 <__printf+0x440>
    80008c1c:	00030513          	mv	a0,t1
    80008c20:	00000097          	auipc	ra,0x0
    80008c24:	7bc080e7          	jalr	1980(ra) # 800093dc <acquire>
    80008c28:	b4dff06f          	j	80008774 <__printf+0x6c>
    80008c2c:	40c0053b          	negw	a0,a2
    80008c30:	00a00713          	li	a4,10
    80008c34:	02e576bb          	remuw	a3,a0,a4
    80008c38:	00002d97          	auipc	s11,0x2
    80008c3c:	ca0d8d93          	addi	s11,s11,-864 # 8000a8d8 <digits>
    80008c40:	ff700593          	li	a1,-9
    80008c44:	02069693          	slli	a3,a3,0x20
    80008c48:	0206d693          	srli	a3,a3,0x20
    80008c4c:	00dd86b3          	add	a3,s11,a3
    80008c50:	0006c683          	lbu	a3,0(a3)
    80008c54:	02e557bb          	divuw	a5,a0,a4
    80008c58:	f8d40023          	sb	a3,-128(s0)
    80008c5c:	10b65e63          	bge	a2,a1,80008d78 <__printf+0x670>
    80008c60:	06300593          	li	a1,99
    80008c64:	02e7f6bb          	remuw	a3,a5,a4
    80008c68:	02069693          	slli	a3,a3,0x20
    80008c6c:	0206d693          	srli	a3,a3,0x20
    80008c70:	00dd86b3          	add	a3,s11,a3
    80008c74:	0006c683          	lbu	a3,0(a3)
    80008c78:	02e7d73b          	divuw	a4,a5,a4
    80008c7c:	00200793          	li	a5,2
    80008c80:	f8d400a3          	sb	a3,-127(s0)
    80008c84:	bca5ece3          	bltu	a1,a0,8000885c <__printf+0x154>
    80008c88:	ce5ff06f          	j	8000896c <__printf+0x264>
    80008c8c:	40e007bb          	negw	a5,a4
    80008c90:	00002d97          	auipc	s11,0x2
    80008c94:	c48d8d93          	addi	s11,s11,-952 # 8000a8d8 <digits>
    80008c98:	00f7f693          	andi	a3,a5,15
    80008c9c:	00dd86b3          	add	a3,s11,a3
    80008ca0:	0006c583          	lbu	a1,0(a3)
    80008ca4:	ff100613          	li	a2,-15
    80008ca8:	0047d69b          	srliw	a3,a5,0x4
    80008cac:	f8b40023          	sb	a1,-128(s0)
    80008cb0:	0047d59b          	srliw	a1,a5,0x4
    80008cb4:	0ac75e63          	bge	a4,a2,80008d70 <__printf+0x668>
    80008cb8:	00f6f693          	andi	a3,a3,15
    80008cbc:	00dd86b3          	add	a3,s11,a3
    80008cc0:	0006c603          	lbu	a2,0(a3)
    80008cc4:	00f00693          	li	a3,15
    80008cc8:	0087d79b          	srliw	a5,a5,0x8
    80008ccc:	f8c400a3          	sb	a2,-127(s0)
    80008cd0:	d8b6e4e3          	bltu	a3,a1,80008a58 <__printf+0x350>
    80008cd4:	00200793          	li	a5,2
    80008cd8:	e2dff06f          	j	80008b04 <__printf+0x3fc>
    80008cdc:	00002c97          	auipc	s9,0x2
    80008ce0:	bdcc8c93          	addi	s9,s9,-1060 # 8000a8b8 <CONSOLE_STATUS+0x8a8>
    80008ce4:	02800513          	li	a0,40
    80008ce8:	ef1ff06f          	j	80008bd8 <__printf+0x4d0>
    80008cec:	00700793          	li	a5,7
    80008cf0:	00600c93          	li	s9,6
    80008cf4:	e0dff06f          	j	80008b00 <__printf+0x3f8>
    80008cf8:	00700793          	li	a5,7
    80008cfc:	00600c93          	li	s9,6
    80008d00:	c69ff06f          	j	80008968 <__printf+0x260>
    80008d04:	00300793          	li	a5,3
    80008d08:	00200c93          	li	s9,2
    80008d0c:	c5dff06f          	j	80008968 <__printf+0x260>
    80008d10:	00300793          	li	a5,3
    80008d14:	00200c93          	li	s9,2
    80008d18:	de9ff06f          	j	80008b00 <__printf+0x3f8>
    80008d1c:	00400793          	li	a5,4
    80008d20:	00300c93          	li	s9,3
    80008d24:	dddff06f          	j	80008b00 <__printf+0x3f8>
    80008d28:	00400793          	li	a5,4
    80008d2c:	00300c93          	li	s9,3
    80008d30:	c39ff06f          	j	80008968 <__printf+0x260>
    80008d34:	00500793          	li	a5,5
    80008d38:	00400c93          	li	s9,4
    80008d3c:	c2dff06f          	j	80008968 <__printf+0x260>
    80008d40:	00500793          	li	a5,5
    80008d44:	00400c93          	li	s9,4
    80008d48:	db9ff06f          	j	80008b00 <__printf+0x3f8>
    80008d4c:	00600793          	li	a5,6
    80008d50:	00500c93          	li	s9,5
    80008d54:	dadff06f          	j	80008b00 <__printf+0x3f8>
    80008d58:	00600793          	li	a5,6
    80008d5c:	00500c93          	li	s9,5
    80008d60:	c09ff06f          	j	80008968 <__printf+0x260>
    80008d64:	00800793          	li	a5,8
    80008d68:	00700c93          	li	s9,7
    80008d6c:	bfdff06f          	j	80008968 <__printf+0x260>
    80008d70:	00100793          	li	a5,1
    80008d74:	d91ff06f          	j	80008b04 <__printf+0x3fc>
    80008d78:	00100793          	li	a5,1
    80008d7c:	bf1ff06f          	j	8000896c <__printf+0x264>
    80008d80:	00900793          	li	a5,9
    80008d84:	00800c93          	li	s9,8
    80008d88:	be1ff06f          	j	80008968 <__printf+0x260>
    80008d8c:	00002517          	auipc	a0,0x2
    80008d90:	b3450513          	addi	a0,a0,-1228 # 8000a8c0 <CONSOLE_STATUS+0x8b0>
    80008d94:	00000097          	auipc	ra,0x0
    80008d98:	918080e7          	jalr	-1768(ra) # 800086ac <panic>

0000000080008d9c <printfinit>:
    80008d9c:	fe010113          	addi	sp,sp,-32
    80008da0:	00813823          	sd	s0,16(sp)
    80008da4:	00913423          	sd	s1,8(sp)
    80008da8:	00113c23          	sd	ra,24(sp)
    80008dac:	02010413          	addi	s0,sp,32
    80008db0:	00005497          	auipc	s1,0x5
    80008db4:	61048493          	addi	s1,s1,1552 # 8000e3c0 <pr>
    80008db8:	00048513          	mv	a0,s1
    80008dbc:	00002597          	auipc	a1,0x2
    80008dc0:	b1458593          	addi	a1,a1,-1260 # 8000a8d0 <CONSOLE_STATUS+0x8c0>
    80008dc4:	00000097          	auipc	ra,0x0
    80008dc8:	5f4080e7          	jalr	1524(ra) # 800093b8 <initlock>
    80008dcc:	01813083          	ld	ra,24(sp)
    80008dd0:	01013403          	ld	s0,16(sp)
    80008dd4:	0004ac23          	sw	zero,24(s1)
    80008dd8:	00813483          	ld	s1,8(sp)
    80008ddc:	02010113          	addi	sp,sp,32
    80008de0:	00008067          	ret

0000000080008de4 <uartinit>:
    80008de4:	ff010113          	addi	sp,sp,-16
    80008de8:	00813423          	sd	s0,8(sp)
    80008dec:	01010413          	addi	s0,sp,16
    80008df0:	100007b7          	lui	a5,0x10000
    80008df4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008df8:	f8000713          	li	a4,-128
    80008dfc:	00e781a3          	sb	a4,3(a5)
    80008e00:	00300713          	li	a4,3
    80008e04:	00e78023          	sb	a4,0(a5)
    80008e08:	000780a3          	sb	zero,1(a5)
    80008e0c:	00e781a3          	sb	a4,3(a5)
    80008e10:	00700693          	li	a3,7
    80008e14:	00d78123          	sb	a3,2(a5)
    80008e18:	00e780a3          	sb	a4,1(a5)
    80008e1c:	00813403          	ld	s0,8(sp)
    80008e20:	01010113          	addi	sp,sp,16
    80008e24:	00008067          	ret

0000000080008e28 <uartputc>:
    80008e28:	00004797          	auipc	a5,0x4
    80008e2c:	1b07a783          	lw	a5,432(a5) # 8000cfd8 <panicked>
    80008e30:	00078463          	beqz	a5,80008e38 <uartputc+0x10>
    80008e34:	0000006f          	j	80008e34 <uartputc+0xc>
    80008e38:	fd010113          	addi	sp,sp,-48
    80008e3c:	02813023          	sd	s0,32(sp)
    80008e40:	00913c23          	sd	s1,24(sp)
    80008e44:	01213823          	sd	s2,16(sp)
    80008e48:	01313423          	sd	s3,8(sp)
    80008e4c:	02113423          	sd	ra,40(sp)
    80008e50:	03010413          	addi	s0,sp,48
    80008e54:	00004917          	auipc	s2,0x4
    80008e58:	18c90913          	addi	s2,s2,396 # 8000cfe0 <uart_tx_r>
    80008e5c:	00093783          	ld	a5,0(s2)
    80008e60:	00004497          	auipc	s1,0x4
    80008e64:	18848493          	addi	s1,s1,392 # 8000cfe8 <uart_tx_w>
    80008e68:	0004b703          	ld	a4,0(s1)
    80008e6c:	02078693          	addi	a3,a5,32
    80008e70:	00050993          	mv	s3,a0
    80008e74:	02e69c63          	bne	a3,a4,80008eac <uartputc+0x84>
    80008e78:	00001097          	auipc	ra,0x1
    80008e7c:	834080e7          	jalr	-1996(ra) # 800096ac <push_on>
    80008e80:	00093783          	ld	a5,0(s2)
    80008e84:	0004b703          	ld	a4,0(s1)
    80008e88:	02078793          	addi	a5,a5,32
    80008e8c:	00e79463          	bne	a5,a4,80008e94 <uartputc+0x6c>
    80008e90:	0000006f          	j	80008e90 <uartputc+0x68>
    80008e94:	00001097          	auipc	ra,0x1
    80008e98:	88c080e7          	jalr	-1908(ra) # 80009720 <pop_on>
    80008e9c:	00093783          	ld	a5,0(s2)
    80008ea0:	0004b703          	ld	a4,0(s1)
    80008ea4:	02078693          	addi	a3,a5,32
    80008ea8:	fce688e3          	beq	a3,a4,80008e78 <uartputc+0x50>
    80008eac:	01f77693          	andi	a3,a4,31
    80008eb0:	00005597          	auipc	a1,0x5
    80008eb4:	53058593          	addi	a1,a1,1328 # 8000e3e0 <uart_tx_buf>
    80008eb8:	00d586b3          	add	a3,a1,a3
    80008ebc:	00170713          	addi	a4,a4,1
    80008ec0:	01368023          	sb	s3,0(a3)
    80008ec4:	00e4b023          	sd	a4,0(s1)
    80008ec8:	10000637          	lui	a2,0x10000
    80008ecc:	02f71063          	bne	a4,a5,80008eec <uartputc+0xc4>
    80008ed0:	0340006f          	j	80008f04 <uartputc+0xdc>
    80008ed4:	00074703          	lbu	a4,0(a4)
    80008ed8:	00f93023          	sd	a5,0(s2)
    80008edc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008ee0:	00093783          	ld	a5,0(s2)
    80008ee4:	0004b703          	ld	a4,0(s1)
    80008ee8:	00f70e63          	beq	a4,a5,80008f04 <uartputc+0xdc>
    80008eec:	00564683          	lbu	a3,5(a2)
    80008ef0:	01f7f713          	andi	a4,a5,31
    80008ef4:	00e58733          	add	a4,a1,a4
    80008ef8:	0206f693          	andi	a3,a3,32
    80008efc:	00178793          	addi	a5,a5,1
    80008f00:	fc069ae3          	bnez	a3,80008ed4 <uartputc+0xac>
    80008f04:	02813083          	ld	ra,40(sp)
    80008f08:	02013403          	ld	s0,32(sp)
    80008f0c:	01813483          	ld	s1,24(sp)
    80008f10:	01013903          	ld	s2,16(sp)
    80008f14:	00813983          	ld	s3,8(sp)
    80008f18:	03010113          	addi	sp,sp,48
    80008f1c:	00008067          	ret

0000000080008f20 <uartputc_sync>:
    80008f20:	ff010113          	addi	sp,sp,-16
    80008f24:	00813423          	sd	s0,8(sp)
    80008f28:	01010413          	addi	s0,sp,16
    80008f2c:	00004717          	auipc	a4,0x4
    80008f30:	0ac72703          	lw	a4,172(a4) # 8000cfd8 <panicked>
    80008f34:	02071663          	bnez	a4,80008f60 <uartputc_sync+0x40>
    80008f38:	00050793          	mv	a5,a0
    80008f3c:	100006b7          	lui	a3,0x10000
    80008f40:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008f44:	02077713          	andi	a4,a4,32
    80008f48:	fe070ce3          	beqz	a4,80008f40 <uartputc_sync+0x20>
    80008f4c:	0ff7f793          	andi	a5,a5,255
    80008f50:	00f68023          	sb	a5,0(a3)
    80008f54:	00813403          	ld	s0,8(sp)
    80008f58:	01010113          	addi	sp,sp,16
    80008f5c:	00008067          	ret
    80008f60:	0000006f          	j	80008f60 <uartputc_sync+0x40>

0000000080008f64 <uartstart>:
    80008f64:	ff010113          	addi	sp,sp,-16
    80008f68:	00813423          	sd	s0,8(sp)
    80008f6c:	01010413          	addi	s0,sp,16
    80008f70:	00004617          	auipc	a2,0x4
    80008f74:	07060613          	addi	a2,a2,112 # 8000cfe0 <uart_tx_r>
    80008f78:	00004517          	auipc	a0,0x4
    80008f7c:	07050513          	addi	a0,a0,112 # 8000cfe8 <uart_tx_w>
    80008f80:	00063783          	ld	a5,0(a2)
    80008f84:	00053703          	ld	a4,0(a0)
    80008f88:	04f70263          	beq	a4,a5,80008fcc <uartstart+0x68>
    80008f8c:	100005b7          	lui	a1,0x10000
    80008f90:	00005817          	auipc	a6,0x5
    80008f94:	45080813          	addi	a6,a6,1104 # 8000e3e0 <uart_tx_buf>
    80008f98:	01c0006f          	j	80008fb4 <uartstart+0x50>
    80008f9c:	0006c703          	lbu	a4,0(a3)
    80008fa0:	00f63023          	sd	a5,0(a2)
    80008fa4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008fa8:	00063783          	ld	a5,0(a2)
    80008fac:	00053703          	ld	a4,0(a0)
    80008fb0:	00f70e63          	beq	a4,a5,80008fcc <uartstart+0x68>
    80008fb4:	01f7f713          	andi	a4,a5,31
    80008fb8:	00e806b3          	add	a3,a6,a4
    80008fbc:	0055c703          	lbu	a4,5(a1)
    80008fc0:	00178793          	addi	a5,a5,1
    80008fc4:	02077713          	andi	a4,a4,32
    80008fc8:	fc071ae3          	bnez	a4,80008f9c <uartstart+0x38>
    80008fcc:	00813403          	ld	s0,8(sp)
    80008fd0:	01010113          	addi	sp,sp,16
    80008fd4:	00008067          	ret

0000000080008fd8 <uartgetc>:
    80008fd8:	ff010113          	addi	sp,sp,-16
    80008fdc:	00813423          	sd	s0,8(sp)
    80008fe0:	01010413          	addi	s0,sp,16
    80008fe4:	10000737          	lui	a4,0x10000
    80008fe8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80008fec:	0017f793          	andi	a5,a5,1
    80008ff0:	00078c63          	beqz	a5,80009008 <uartgetc+0x30>
    80008ff4:	00074503          	lbu	a0,0(a4)
    80008ff8:	0ff57513          	andi	a0,a0,255
    80008ffc:	00813403          	ld	s0,8(sp)
    80009000:	01010113          	addi	sp,sp,16
    80009004:	00008067          	ret
    80009008:	fff00513          	li	a0,-1
    8000900c:	ff1ff06f          	j	80008ffc <uartgetc+0x24>

0000000080009010 <uartintr>:
    80009010:	100007b7          	lui	a5,0x10000
    80009014:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80009018:	0017f793          	andi	a5,a5,1
    8000901c:	0a078463          	beqz	a5,800090c4 <uartintr+0xb4>
    80009020:	fe010113          	addi	sp,sp,-32
    80009024:	00813823          	sd	s0,16(sp)
    80009028:	00913423          	sd	s1,8(sp)
    8000902c:	00113c23          	sd	ra,24(sp)
    80009030:	02010413          	addi	s0,sp,32
    80009034:	100004b7          	lui	s1,0x10000
    80009038:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000903c:	0ff57513          	andi	a0,a0,255
    80009040:	fffff097          	auipc	ra,0xfffff
    80009044:	534080e7          	jalr	1332(ra) # 80008574 <consoleintr>
    80009048:	0054c783          	lbu	a5,5(s1)
    8000904c:	0017f793          	andi	a5,a5,1
    80009050:	fe0794e3          	bnez	a5,80009038 <uartintr+0x28>
    80009054:	00004617          	auipc	a2,0x4
    80009058:	f8c60613          	addi	a2,a2,-116 # 8000cfe0 <uart_tx_r>
    8000905c:	00004517          	auipc	a0,0x4
    80009060:	f8c50513          	addi	a0,a0,-116 # 8000cfe8 <uart_tx_w>
    80009064:	00063783          	ld	a5,0(a2)
    80009068:	00053703          	ld	a4,0(a0)
    8000906c:	04f70263          	beq	a4,a5,800090b0 <uartintr+0xa0>
    80009070:	100005b7          	lui	a1,0x10000
    80009074:	00005817          	auipc	a6,0x5
    80009078:	36c80813          	addi	a6,a6,876 # 8000e3e0 <uart_tx_buf>
    8000907c:	01c0006f          	j	80009098 <uartintr+0x88>
    80009080:	0006c703          	lbu	a4,0(a3)
    80009084:	00f63023          	sd	a5,0(a2)
    80009088:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000908c:	00063783          	ld	a5,0(a2)
    80009090:	00053703          	ld	a4,0(a0)
    80009094:	00f70e63          	beq	a4,a5,800090b0 <uartintr+0xa0>
    80009098:	01f7f713          	andi	a4,a5,31
    8000909c:	00e806b3          	add	a3,a6,a4
    800090a0:	0055c703          	lbu	a4,5(a1)
    800090a4:	00178793          	addi	a5,a5,1
    800090a8:	02077713          	andi	a4,a4,32
    800090ac:	fc071ae3          	bnez	a4,80009080 <uartintr+0x70>
    800090b0:	01813083          	ld	ra,24(sp)
    800090b4:	01013403          	ld	s0,16(sp)
    800090b8:	00813483          	ld	s1,8(sp)
    800090bc:	02010113          	addi	sp,sp,32
    800090c0:	00008067          	ret
    800090c4:	00004617          	auipc	a2,0x4
    800090c8:	f1c60613          	addi	a2,a2,-228 # 8000cfe0 <uart_tx_r>
    800090cc:	00004517          	auipc	a0,0x4
    800090d0:	f1c50513          	addi	a0,a0,-228 # 8000cfe8 <uart_tx_w>
    800090d4:	00063783          	ld	a5,0(a2)
    800090d8:	00053703          	ld	a4,0(a0)
    800090dc:	04f70263          	beq	a4,a5,80009120 <uartintr+0x110>
    800090e0:	100005b7          	lui	a1,0x10000
    800090e4:	00005817          	auipc	a6,0x5
    800090e8:	2fc80813          	addi	a6,a6,764 # 8000e3e0 <uart_tx_buf>
    800090ec:	01c0006f          	j	80009108 <uartintr+0xf8>
    800090f0:	0006c703          	lbu	a4,0(a3)
    800090f4:	00f63023          	sd	a5,0(a2)
    800090f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800090fc:	00063783          	ld	a5,0(a2)
    80009100:	00053703          	ld	a4,0(a0)
    80009104:	02f70063          	beq	a4,a5,80009124 <uartintr+0x114>
    80009108:	01f7f713          	andi	a4,a5,31
    8000910c:	00e806b3          	add	a3,a6,a4
    80009110:	0055c703          	lbu	a4,5(a1)
    80009114:	00178793          	addi	a5,a5,1
    80009118:	02077713          	andi	a4,a4,32
    8000911c:	fc071ae3          	bnez	a4,800090f0 <uartintr+0xe0>
    80009120:	00008067          	ret
    80009124:	00008067          	ret

0000000080009128 <kinit>:
    80009128:	fc010113          	addi	sp,sp,-64
    8000912c:	02913423          	sd	s1,40(sp)
    80009130:	fffff7b7          	lui	a5,0xfffff
    80009134:	00005497          	auipc	s1,0x5
    80009138:	f8b48493          	addi	s1,s1,-117 # 8000e0bf <stack0+0xeef>
    8000913c:	02813823          	sd	s0,48(sp)
    80009140:	01313c23          	sd	s3,24(sp)
    80009144:	00f4f4b3          	and	s1,s1,a5
    80009148:	02113c23          	sd	ra,56(sp)
    8000914c:	03213023          	sd	s2,32(sp)
    80009150:	01413823          	sd	s4,16(sp)
    80009154:	01513423          	sd	s5,8(sp)
    80009158:	04010413          	addi	s0,sp,64
    8000915c:	000017b7          	lui	a5,0x1
    80009160:	01100993          	li	s3,17
    80009164:	00f487b3          	add	a5,s1,a5
    80009168:	01b99993          	slli	s3,s3,0x1b
    8000916c:	06f9e063          	bltu	s3,a5,800091cc <kinit+0xa4>
    80009170:	00004a97          	auipc	s5,0x4
    80009174:	f50a8a93          	addi	s5,s5,-176 # 8000d0c0 <end>
    80009178:	0754ec63          	bltu	s1,s5,800091f0 <kinit+0xc8>
    8000917c:	0734fa63          	bgeu	s1,s3,800091f0 <kinit+0xc8>
    80009180:	00088a37          	lui	s4,0x88
    80009184:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80009188:	00004917          	auipc	s2,0x4
    8000918c:	e6890913          	addi	s2,s2,-408 # 8000cff0 <kmem>
    80009190:	00ca1a13          	slli	s4,s4,0xc
    80009194:	0140006f          	j	800091a8 <kinit+0x80>
    80009198:	000017b7          	lui	a5,0x1
    8000919c:	00f484b3          	add	s1,s1,a5
    800091a0:	0554e863          	bltu	s1,s5,800091f0 <kinit+0xc8>
    800091a4:	0534f663          	bgeu	s1,s3,800091f0 <kinit+0xc8>
    800091a8:	00001637          	lui	a2,0x1
    800091ac:	00100593          	li	a1,1
    800091b0:	00048513          	mv	a0,s1
    800091b4:	00000097          	auipc	ra,0x0
    800091b8:	5e4080e7          	jalr	1508(ra) # 80009798 <__memset>
    800091bc:	00093783          	ld	a5,0(s2)
    800091c0:	00f4b023          	sd	a5,0(s1)
    800091c4:	00993023          	sd	s1,0(s2)
    800091c8:	fd4498e3          	bne	s1,s4,80009198 <kinit+0x70>
    800091cc:	03813083          	ld	ra,56(sp)
    800091d0:	03013403          	ld	s0,48(sp)
    800091d4:	02813483          	ld	s1,40(sp)
    800091d8:	02013903          	ld	s2,32(sp)
    800091dc:	01813983          	ld	s3,24(sp)
    800091e0:	01013a03          	ld	s4,16(sp)
    800091e4:	00813a83          	ld	s5,8(sp)
    800091e8:	04010113          	addi	sp,sp,64
    800091ec:	00008067          	ret
    800091f0:	00001517          	auipc	a0,0x1
    800091f4:	70050513          	addi	a0,a0,1792 # 8000a8f0 <digits+0x18>
    800091f8:	fffff097          	auipc	ra,0xfffff
    800091fc:	4b4080e7          	jalr	1204(ra) # 800086ac <panic>

0000000080009200 <freerange>:
    80009200:	fc010113          	addi	sp,sp,-64
    80009204:	000017b7          	lui	a5,0x1
    80009208:	02913423          	sd	s1,40(sp)
    8000920c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80009210:	009504b3          	add	s1,a0,s1
    80009214:	fffff537          	lui	a0,0xfffff
    80009218:	02813823          	sd	s0,48(sp)
    8000921c:	02113c23          	sd	ra,56(sp)
    80009220:	03213023          	sd	s2,32(sp)
    80009224:	01313c23          	sd	s3,24(sp)
    80009228:	01413823          	sd	s4,16(sp)
    8000922c:	01513423          	sd	s5,8(sp)
    80009230:	01613023          	sd	s6,0(sp)
    80009234:	04010413          	addi	s0,sp,64
    80009238:	00a4f4b3          	and	s1,s1,a0
    8000923c:	00f487b3          	add	a5,s1,a5
    80009240:	06f5e463          	bltu	a1,a5,800092a8 <freerange+0xa8>
    80009244:	00004a97          	auipc	s5,0x4
    80009248:	e7ca8a93          	addi	s5,s5,-388 # 8000d0c0 <end>
    8000924c:	0954e263          	bltu	s1,s5,800092d0 <freerange+0xd0>
    80009250:	01100993          	li	s3,17
    80009254:	01b99993          	slli	s3,s3,0x1b
    80009258:	0734fc63          	bgeu	s1,s3,800092d0 <freerange+0xd0>
    8000925c:	00058a13          	mv	s4,a1
    80009260:	00004917          	auipc	s2,0x4
    80009264:	d9090913          	addi	s2,s2,-624 # 8000cff0 <kmem>
    80009268:	00002b37          	lui	s6,0x2
    8000926c:	0140006f          	j	80009280 <freerange+0x80>
    80009270:	000017b7          	lui	a5,0x1
    80009274:	00f484b3          	add	s1,s1,a5
    80009278:	0554ec63          	bltu	s1,s5,800092d0 <freerange+0xd0>
    8000927c:	0534fa63          	bgeu	s1,s3,800092d0 <freerange+0xd0>
    80009280:	00001637          	lui	a2,0x1
    80009284:	00100593          	li	a1,1
    80009288:	00048513          	mv	a0,s1
    8000928c:	00000097          	auipc	ra,0x0
    80009290:	50c080e7          	jalr	1292(ra) # 80009798 <__memset>
    80009294:	00093703          	ld	a4,0(s2)
    80009298:	016487b3          	add	a5,s1,s6
    8000929c:	00e4b023          	sd	a4,0(s1)
    800092a0:	00993023          	sd	s1,0(s2)
    800092a4:	fcfa76e3          	bgeu	s4,a5,80009270 <freerange+0x70>
    800092a8:	03813083          	ld	ra,56(sp)
    800092ac:	03013403          	ld	s0,48(sp)
    800092b0:	02813483          	ld	s1,40(sp)
    800092b4:	02013903          	ld	s2,32(sp)
    800092b8:	01813983          	ld	s3,24(sp)
    800092bc:	01013a03          	ld	s4,16(sp)
    800092c0:	00813a83          	ld	s5,8(sp)
    800092c4:	00013b03          	ld	s6,0(sp)
    800092c8:	04010113          	addi	sp,sp,64
    800092cc:	00008067          	ret
    800092d0:	00001517          	auipc	a0,0x1
    800092d4:	62050513          	addi	a0,a0,1568 # 8000a8f0 <digits+0x18>
    800092d8:	fffff097          	auipc	ra,0xfffff
    800092dc:	3d4080e7          	jalr	980(ra) # 800086ac <panic>

00000000800092e0 <kfree>:
    800092e0:	fe010113          	addi	sp,sp,-32
    800092e4:	00813823          	sd	s0,16(sp)
    800092e8:	00113c23          	sd	ra,24(sp)
    800092ec:	00913423          	sd	s1,8(sp)
    800092f0:	02010413          	addi	s0,sp,32
    800092f4:	03451793          	slli	a5,a0,0x34
    800092f8:	04079c63          	bnez	a5,80009350 <kfree+0x70>
    800092fc:	00004797          	auipc	a5,0x4
    80009300:	dc478793          	addi	a5,a5,-572 # 8000d0c0 <end>
    80009304:	00050493          	mv	s1,a0
    80009308:	04f56463          	bltu	a0,a5,80009350 <kfree+0x70>
    8000930c:	01100793          	li	a5,17
    80009310:	01b79793          	slli	a5,a5,0x1b
    80009314:	02f57e63          	bgeu	a0,a5,80009350 <kfree+0x70>
    80009318:	00001637          	lui	a2,0x1
    8000931c:	00100593          	li	a1,1
    80009320:	00000097          	auipc	ra,0x0
    80009324:	478080e7          	jalr	1144(ra) # 80009798 <__memset>
    80009328:	00004797          	auipc	a5,0x4
    8000932c:	cc878793          	addi	a5,a5,-824 # 8000cff0 <kmem>
    80009330:	0007b703          	ld	a4,0(a5)
    80009334:	01813083          	ld	ra,24(sp)
    80009338:	01013403          	ld	s0,16(sp)
    8000933c:	00e4b023          	sd	a4,0(s1)
    80009340:	0097b023          	sd	s1,0(a5)
    80009344:	00813483          	ld	s1,8(sp)
    80009348:	02010113          	addi	sp,sp,32
    8000934c:	00008067          	ret
    80009350:	00001517          	auipc	a0,0x1
    80009354:	5a050513          	addi	a0,a0,1440 # 8000a8f0 <digits+0x18>
    80009358:	fffff097          	auipc	ra,0xfffff
    8000935c:	354080e7          	jalr	852(ra) # 800086ac <panic>

0000000080009360 <kalloc>:
    80009360:	fe010113          	addi	sp,sp,-32
    80009364:	00813823          	sd	s0,16(sp)
    80009368:	00913423          	sd	s1,8(sp)
    8000936c:	00113c23          	sd	ra,24(sp)
    80009370:	02010413          	addi	s0,sp,32
    80009374:	00004797          	auipc	a5,0x4
    80009378:	c7c78793          	addi	a5,a5,-900 # 8000cff0 <kmem>
    8000937c:	0007b483          	ld	s1,0(a5)
    80009380:	02048063          	beqz	s1,800093a0 <kalloc+0x40>
    80009384:	0004b703          	ld	a4,0(s1)
    80009388:	00001637          	lui	a2,0x1
    8000938c:	00500593          	li	a1,5
    80009390:	00048513          	mv	a0,s1
    80009394:	00e7b023          	sd	a4,0(a5)
    80009398:	00000097          	auipc	ra,0x0
    8000939c:	400080e7          	jalr	1024(ra) # 80009798 <__memset>
    800093a0:	01813083          	ld	ra,24(sp)
    800093a4:	01013403          	ld	s0,16(sp)
    800093a8:	00048513          	mv	a0,s1
    800093ac:	00813483          	ld	s1,8(sp)
    800093b0:	02010113          	addi	sp,sp,32
    800093b4:	00008067          	ret

00000000800093b8 <initlock>:
    800093b8:	ff010113          	addi	sp,sp,-16
    800093bc:	00813423          	sd	s0,8(sp)
    800093c0:	01010413          	addi	s0,sp,16
    800093c4:	00813403          	ld	s0,8(sp)
    800093c8:	00b53423          	sd	a1,8(a0)
    800093cc:	00052023          	sw	zero,0(a0)
    800093d0:	00053823          	sd	zero,16(a0)
    800093d4:	01010113          	addi	sp,sp,16
    800093d8:	00008067          	ret

00000000800093dc <acquire>:
    800093dc:	fe010113          	addi	sp,sp,-32
    800093e0:	00813823          	sd	s0,16(sp)
    800093e4:	00913423          	sd	s1,8(sp)
    800093e8:	00113c23          	sd	ra,24(sp)
    800093ec:	01213023          	sd	s2,0(sp)
    800093f0:	02010413          	addi	s0,sp,32
    800093f4:	00050493          	mv	s1,a0
    800093f8:	10002973          	csrr	s2,sstatus
    800093fc:	100027f3          	csrr	a5,sstatus
    80009400:	ffd7f793          	andi	a5,a5,-3
    80009404:	10079073          	csrw	sstatus,a5
    80009408:	fffff097          	auipc	ra,0xfffff
    8000940c:	8ec080e7          	jalr	-1812(ra) # 80007cf4 <mycpu>
    80009410:	07852783          	lw	a5,120(a0)
    80009414:	06078e63          	beqz	a5,80009490 <acquire+0xb4>
    80009418:	fffff097          	auipc	ra,0xfffff
    8000941c:	8dc080e7          	jalr	-1828(ra) # 80007cf4 <mycpu>
    80009420:	07852783          	lw	a5,120(a0)
    80009424:	0004a703          	lw	a4,0(s1)
    80009428:	0017879b          	addiw	a5,a5,1
    8000942c:	06f52c23          	sw	a5,120(a0)
    80009430:	04071063          	bnez	a4,80009470 <acquire+0x94>
    80009434:	00100713          	li	a4,1
    80009438:	00070793          	mv	a5,a4
    8000943c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80009440:	0007879b          	sext.w	a5,a5
    80009444:	fe079ae3          	bnez	a5,80009438 <acquire+0x5c>
    80009448:	0ff0000f          	fence
    8000944c:	fffff097          	auipc	ra,0xfffff
    80009450:	8a8080e7          	jalr	-1880(ra) # 80007cf4 <mycpu>
    80009454:	01813083          	ld	ra,24(sp)
    80009458:	01013403          	ld	s0,16(sp)
    8000945c:	00a4b823          	sd	a0,16(s1)
    80009460:	00013903          	ld	s2,0(sp)
    80009464:	00813483          	ld	s1,8(sp)
    80009468:	02010113          	addi	sp,sp,32
    8000946c:	00008067          	ret
    80009470:	0104b903          	ld	s2,16(s1)
    80009474:	fffff097          	auipc	ra,0xfffff
    80009478:	880080e7          	jalr	-1920(ra) # 80007cf4 <mycpu>
    8000947c:	faa91ce3          	bne	s2,a0,80009434 <acquire+0x58>
    80009480:	00001517          	auipc	a0,0x1
    80009484:	47850513          	addi	a0,a0,1144 # 8000a8f8 <digits+0x20>
    80009488:	fffff097          	auipc	ra,0xfffff
    8000948c:	224080e7          	jalr	548(ra) # 800086ac <panic>
    80009490:	00195913          	srli	s2,s2,0x1
    80009494:	fffff097          	auipc	ra,0xfffff
    80009498:	860080e7          	jalr	-1952(ra) # 80007cf4 <mycpu>
    8000949c:	00197913          	andi	s2,s2,1
    800094a0:	07252e23          	sw	s2,124(a0)
    800094a4:	f75ff06f          	j	80009418 <acquire+0x3c>

00000000800094a8 <release>:
    800094a8:	fe010113          	addi	sp,sp,-32
    800094ac:	00813823          	sd	s0,16(sp)
    800094b0:	00113c23          	sd	ra,24(sp)
    800094b4:	00913423          	sd	s1,8(sp)
    800094b8:	01213023          	sd	s2,0(sp)
    800094bc:	02010413          	addi	s0,sp,32
    800094c0:	00052783          	lw	a5,0(a0)
    800094c4:	00079a63          	bnez	a5,800094d8 <release+0x30>
    800094c8:	00001517          	auipc	a0,0x1
    800094cc:	43850513          	addi	a0,a0,1080 # 8000a900 <digits+0x28>
    800094d0:	fffff097          	auipc	ra,0xfffff
    800094d4:	1dc080e7          	jalr	476(ra) # 800086ac <panic>
    800094d8:	01053903          	ld	s2,16(a0)
    800094dc:	00050493          	mv	s1,a0
    800094e0:	fffff097          	auipc	ra,0xfffff
    800094e4:	814080e7          	jalr	-2028(ra) # 80007cf4 <mycpu>
    800094e8:	fea910e3          	bne	s2,a0,800094c8 <release+0x20>
    800094ec:	0004b823          	sd	zero,16(s1)
    800094f0:	0ff0000f          	fence
    800094f4:	0f50000f          	fence	iorw,ow
    800094f8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800094fc:	ffffe097          	auipc	ra,0xffffe
    80009500:	7f8080e7          	jalr	2040(ra) # 80007cf4 <mycpu>
    80009504:	100027f3          	csrr	a5,sstatus
    80009508:	0027f793          	andi	a5,a5,2
    8000950c:	04079a63          	bnez	a5,80009560 <release+0xb8>
    80009510:	07852783          	lw	a5,120(a0)
    80009514:	02f05e63          	blez	a5,80009550 <release+0xa8>
    80009518:	fff7871b          	addiw	a4,a5,-1
    8000951c:	06e52c23          	sw	a4,120(a0)
    80009520:	00071c63          	bnez	a4,80009538 <release+0x90>
    80009524:	07c52783          	lw	a5,124(a0)
    80009528:	00078863          	beqz	a5,80009538 <release+0x90>
    8000952c:	100027f3          	csrr	a5,sstatus
    80009530:	0027e793          	ori	a5,a5,2
    80009534:	10079073          	csrw	sstatus,a5
    80009538:	01813083          	ld	ra,24(sp)
    8000953c:	01013403          	ld	s0,16(sp)
    80009540:	00813483          	ld	s1,8(sp)
    80009544:	00013903          	ld	s2,0(sp)
    80009548:	02010113          	addi	sp,sp,32
    8000954c:	00008067          	ret
    80009550:	00001517          	auipc	a0,0x1
    80009554:	3d050513          	addi	a0,a0,976 # 8000a920 <digits+0x48>
    80009558:	fffff097          	auipc	ra,0xfffff
    8000955c:	154080e7          	jalr	340(ra) # 800086ac <panic>
    80009560:	00001517          	auipc	a0,0x1
    80009564:	3a850513          	addi	a0,a0,936 # 8000a908 <digits+0x30>
    80009568:	fffff097          	auipc	ra,0xfffff
    8000956c:	144080e7          	jalr	324(ra) # 800086ac <panic>

0000000080009570 <holding>:
    80009570:	00052783          	lw	a5,0(a0)
    80009574:	00079663          	bnez	a5,80009580 <holding+0x10>
    80009578:	00000513          	li	a0,0
    8000957c:	00008067          	ret
    80009580:	fe010113          	addi	sp,sp,-32
    80009584:	00813823          	sd	s0,16(sp)
    80009588:	00913423          	sd	s1,8(sp)
    8000958c:	00113c23          	sd	ra,24(sp)
    80009590:	02010413          	addi	s0,sp,32
    80009594:	01053483          	ld	s1,16(a0)
    80009598:	ffffe097          	auipc	ra,0xffffe
    8000959c:	75c080e7          	jalr	1884(ra) # 80007cf4 <mycpu>
    800095a0:	01813083          	ld	ra,24(sp)
    800095a4:	01013403          	ld	s0,16(sp)
    800095a8:	40a48533          	sub	a0,s1,a0
    800095ac:	00153513          	seqz	a0,a0
    800095b0:	00813483          	ld	s1,8(sp)
    800095b4:	02010113          	addi	sp,sp,32
    800095b8:	00008067          	ret

00000000800095bc <push_off>:
    800095bc:	fe010113          	addi	sp,sp,-32
    800095c0:	00813823          	sd	s0,16(sp)
    800095c4:	00113c23          	sd	ra,24(sp)
    800095c8:	00913423          	sd	s1,8(sp)
    800095cc:	02010413          	addi	s0,sp,32
    800095d0:	100024f3          	csrr	s1,sstatus
    800095d4:	100027f3          	csrr	a5,sstatus
    800095d8:	ffd7f793          	andi	a5,a5,-3
    800095dc:	10079073          	csrw	sstatus,a5
    800095e0:	ffffe097          	auipc	ra,0xffffe
    800095e4:	714080e7          	jalr	1812(ra) # 80007cf4 <mycpu>
    800095e8:	07852783          	lw	a5,120(a0)
    800095ec:	02078663          	beqz	a5,80009618 <push_off+0x5c>
    800095f0:	ffffe097          	auipc	ra,0xffffe
    800095f4:	704080e7          	jalr	1796(ra) # 80007cf4 <mycpu>
    800095f8:	07852783          	lw	a5,120(a0)
    800095fc:	01813083          	ld	ra,24(sp)
    80009600:	01013403          	ld	s0,16(sp)
    80009604:	0017879b          	addiw	a5,a5,1
    80009608:	06f52c23          	sw	a5,120(a0)
    8000960c:	00813483          	ld	s1,8(sp)
    80009610:	02010113          	addi	sp,sp,32
    80009614:	00008067          	ret
    80009618:	0014d493          	srli	s1,s1,0x1
    8000961c:	ffffe097          	auipc	ra,0xffffe
    80009620:	6d8080e7          	jalr	1752(ra) # 80007cf4 <mycpu>
    80009624:	0014f493          	andi	s1,s1,1
    80009628:	06952e23          	sw	s1,124(a0)
    8000962c:	fc5ff06f          	j	800095f0 <push_off+0x34>

0000000080009630 <pop_off>:
    80009630:	ff010113          	addi	sp,sp,-16
    80009634:	00813023          	sd	s0,0(sp)
    80009638:	00113423          	sd	ra,8(sp)
    8000963c:	01010413          	addi	s0,sp,16
    80009640:	ffffe097          	auipc	ra,0xffffe
    80009644:	6b4080e7          	jalr	1716(ra) # 80007cf4 <mycpu>
    80009648:	100027f3          	csrr	a5,sstatus
    8000964c:	0027f793          	andi	a5,a5,2
    80009650:	04079663          	bnez	a5,8000969c <pop_off+0x6c>
    80009654:	07852783          	lw	a5,120(a0)
    80009658:	02f05a63          	blez	a5,8000968c <pop_off+0x5c>
    8000965c:	fff7871b          	addiw	a4,a5,-1
    80009660:	06e52c23          	sw	a4,120(a0)
    80009664:	00071c63          	bnez	a4,8000967c <pop_off+0x4c>
    80009668:	07c52783          	lw	a5,124(a0)
    8000966c:	00078863          	beqz	a5,8000967c <pop_off+0x4c>
    80009670:	100027f3          	csrr	a5,sstatus
    80009674:	0027e793          	ori	a5,a5,2
    80009678:	10079073          	csrw	sstatus,a5
    8000967c:	00813083          	ld	ra,8(sp)
    80009680:	00013403          	ld	s0,0(sp)
    80009684:	01010113          	addi	sp,sp,16
    80009688:	00008067          	ret
    8000968c:	00001517          	auipc	a0,0x1
    80009690:	29450513          	addi	a0,a0,660 # 8000a920 <digits+0x48>
    80009694:	fffff097          	auipc	ra,0xfffff
    80009698:	018080e7          	jalr	24(ra) # 800086ac <panic>
    8000969c:	00001517          	auipc	a0,0x1
    800096a0:	26c50513          	addi	a0,a0,620 # 8000a908 <digits+0x30>
    800096a4:	fffff097          	auipc	ra,0xfffff
    800096a8:	008080e7          	jalr	8(ra) # 800086ac <panic>

00000000800096ac <push_on>:
    800096ac:	fe010113          	addi	sp,sp,-32
    800096b0:	00813823          	sd	s0,16(sp)
    800096b4:	00113c23          	sd	ra,24(sp)
    800096b8:	00913423          	sd	s1,8(sp)
    800096bc:	02010413          	addi	s0,sp,32
    800096c0:	100024f3          	csrr	s1,sstatus
    800096c4:	100027f3          	csrr	a5,sstatus
    800096c8:	0027e793          	ori	a5,a5,2
    800096cc:	10079073          	csrw	sstatus,a5
    800096d0:	ffffe097          	auipc	ra,0xffffe
    800096d4:	624080e7          	jalr	1572(ra) # 80007cf4 <mycpu>
    800096d8:	07852783          	lw	a5,120(a0)
    800096dc:	02078663          	beqz	a5,80009708 <push_on+0x5c>
    800096e0:	ffffe097          	auipc	ra,0xffffe
    800096e4:	614080e7          	jalr	1556(ra) # 80007cf4 <mycpu>
    800096e8:	07852783          	lw	a5,120(a0)
    800096ec:	01813083          	ld	ra,24(sp)
    800096f0:	01013403          	ld	s0,16(sp)
    800096f4:	0017879b          	addiw	a5,a5,1
    800096f8:	06f52c23          	sw	a5,120(a0)
    800096fc:	00813483          	ld	s1,8(sp)
    80009700:	02010113          	addi	sp,sp,32
    80009704:	00008067          	ret
    80009708:	0014d493          	srli	s1,s1,0x1
    8000970c:	ffffe097          	auipc	ra,0xffffe
    80009710:	5e8080e7          	jalr	1512(ra) # 80007cf4 <mycpu>
    80009714:	0014f493          	andi	s1,s1,1
    80009718:	06952e23          	sw	s1,124(a0)
    8000971c:	fc5ff06f          	j	800096e0 <push_on+0x34>

0000000080009720 <pop_on>:
    80009720:	ff010113          	addi	sp,sp,-16
    80009724:	00813023          	sd	s0,0(sp)
    80009728:	00113423          	sd	ra,8(sp)
    8000972c:	01010413          	addi	s0,sp,16
    80009730:	ffffe097          	auipc	ra,0xffffe
    80009734:	5c4080e7          	jalr	1476(ra) # 80007cf4 <mycpu>
    80009738:	100027f3          	csrr	a5,sstatus
    8000973c:	0027f793          	andi	a5,a5,2
    80009740:	04078463          	beqz	a5,80009788 <pop_on+0x68>
    80009744:	07852783          	lw	a5,120(a0)
    80009748:	02f05863          	blez	a5,80009778 <pop_on+0x58>
    8000974c:	fff7879b          	addiw	a5,a5,-1
    80009750:	06f52c23          	sw	a5,120(a0)
    80009754:	07853783          	ld	a5,120(a0)
    80009758:	00079863          	bnez	a5,80009768 <pop_on+0x48>
    8000975c:	100027f3          	csrr	a5,sstatus
    80009760:	ffd7f793          	andi	a5,a5,-3
    80009764:	10079073          	csrw	sstatus,a5
    80009768:	00813083          	ld	ra,8(sp)
    8000976c:	00013403          	ld	s0,0(sp)
    80009770:	01010113          	addi	sp,sp,16
    80009774:	00008067          	ret
    80009778:	00001517          	auipc	a0,0x1
    8000977c:	1d050513          	addi	a0,a0,464 # 8000a948 <digits+0x70>
    80009780:	fffff097          	auipc	ra,0xfffff
    80009784:	f2c080e7          	jalr	-212(ra) # 800086ac <panic>
    80009788:	00001517          	auipc	a0,0x1
    8000978c:	1a050513          	addi	a0,a0,416 # 8000a928 <digits+0x50>
    80009790:	fffff097          	auipc	ra,0xfffff
    80009794:	f1c080e7          	jalr	-228(ra) # 800086ac <panic>

0000000080009798 <__memset>:
    80009798:	ff010113          	addi	sp,sp,-16
    8000979c:	00813423          	sd	s0,8(sp)
    800097a0:	01010413          	addi	s0,sp,16
    800097a4:	1a060e63          	beqz	a2,80009960 <__memset+0x1c8>
    800097a8:	40a007b3          	neg	a5,a0
    800097ac:	0077f793          	andi	a5,a5,7
    800097b0:	00778693          	addi	a3,a5,7
    800097b4:	00b00813          	li	a6,11
    800097b8:	0ff5f593          	andi	a1,a1,255
    800097bc:	fff6071b          	addiw	a4,a2,-1
    800097c0:	1b06e663          	bltu	a3,a6,8000996c <__memset+0x1d4>
    800097c4:	1cd76463          	bltu	a4,a3,8000998c <__memset+0x1f4>
    800097c8:	1a078e63          	beqz	a5,80009984 <__memset+0x1ec>
    800097cc:	00b50023          	sb	a1,0(a0)
    800097d0:	00100713          	li	a4,1
    800097d4:	1ae78463          	beq	a5,a4,8000997c <__memset+0x1e4>
    800097d8:	00b500a3          	sb	a1,1(a0)
    800097dc:	00200713          	li	a4,2
    800097e0:	1ae78a63          	beq	a5,a4,80009994 <__memset+0x1fc>
    800097e4:	00b50123          	sb	a1,2(a0)
    800097e8:	00300713          	li	a4,3
    800097ec:	18e78463          	beq	a5,a4,80009974 <__memset+0x1dc>
    800097f0:	00b501a3          	sb	a1,3(a0)
    800097f4:	00400713          	li	a4,4
    800097f8:	1ae78263          	beq	a5,a4,8000999c <__memset+0x204>
    800097fc:	00b50223          	sb	a1,4(a0)
    80009800:	00500713          	li	a4,5
    80009804:	1ae78063          	beq	a5,a4,800099a4 <__memset+0x20c>
    80009808:	00b502a3          	sb	a1,5(a0)
    8000980c:	00700713          	li	a4,7
    80009810:	18e79e63          	bne	a5,a4,800099ac <__memset+0x214>
    80009814:	00b50323          	sb	a1,6(a0)
    80009818:	00700e93          	li	t4,7
    8000981c:	00859713          	slli	a4,a1,0x8
    80009820:	00e5e733          	or	a4,a1,a4
    80009824:	01059e13          	slli	t3,a1,0x10
    80009828:	01c76e33          	or	t3,a4,t3
    8000982c:	01859313          	slli	t1,a1,0x18
    80009830:	006e6333          	or	t1,t3,t1
    80009834:	02059893          	slli	a7,a1,0x20
    80009838:	40f60e3b          	subw	t3,a2,a5
    8000983c:	011368b3          	or	a7,t1,a7
    80009840:	02859813          	slli	a6,a1,0x28
    80009844:	0108e833          	or	a6,a7,a6
    80009848:	03059693          	slli	a3,a1,0x30
    8000984c:	003e589b          	srliw	a7,t3,0x3
    80009850:	00d866b3          	or	a3,a6,a3
    80009854:	03859713          	slli	a4,a1,0x38
    80009858:	00389813          	slli	a6,a7,0x3
    8000985c:	00f507b3          	add	a5,a0,a5
    80009860:	00e6e733          	or	a4,a3,a4
    80009864:	000e089b          	sext.w	a7,t3
    80009868:	00f806b3          	add	a3,a6,a5
    8000986c:	00e7b023          	sd	a4,0(a5)
    80009870:	00878793          	addi	a5,a5,8
    80009874:	fed79ce3          	bne	a5,a3,8000986c <__memset+0xd4>
    80009878:	ff8e7793          	andi	a5,t3,-8
    8000987c:	0007871b          	sext.w	a4,a5
    80009880:	01d787bb          	addw	a5,a5,t4
    80009884:	0ce88e63          	beq	a7,a4,80009960 <__memset+0x1c8>
    80009888:	00f50733          	add	a4,a0,a5
    8000988c:	00b70023          	sb	a1,0(a4)
    80009890:	0017871b          	addiw	a4,a5,1
    80009894:	0cc77663          	bgeu	a4,a2,80009960 <__memset+0x1c8>
    80009898:	00e50733          	add	a4,a0,a4
    8000989c:	00b70023          	sb	a1,0(a4)
    800098a0:	0027871b          	addiw	a4,a5,2
    800098a4:	0ac77e63          	bgeu	a4,a2,80009960 <__memset+0x1c8>
    800098a8:	00e50733          	add	a4,a0,a4
    800098ac:	00b70023          	sb	a1,0(a4)
    800098b0:	0037871b          	addiw	a4,a5,3
    800098b4:	0ac77663          	bgeu	a4,a2,80009960 <__memset+0x1c8>
    800098b8:	00e50733          	add	a4,a0,a4
    800098bc:	00b70023          	sb	a1,0(a4)
    800098c0:	0047871b          	addiw	a4,a5,4
    800098c4:	08c77e63          	bgeu	a4,a2,80009960 <__memset+0x1c8>
    800098c8:	00e50733          	add	a4,a0,a4
    800098cc:	00b70023          	sb	a1,0(a4)
    800098d0:	0057871b          	addiw	a4,a5,5
    800098d4:	08c77663          	bgeu	a4,a2,80009960 <__memset+0x1c8>
    800098d8:	00e50733          	add	a4,a0,a4
    800098dc:	00b70023          	sb	a1,0(a4)
    800098e0:	0067871b          	addiw	a4,a5,6
    800098e4:	06c77e63          	bgeu	a4,a2,80009960 <__memset+0x1c8>
    800098e8:	00e50733          	add	a4,a0,a4
    800098ec:	00b70023          	sb	a1,0(a4)
    800098f0:	0077871b          	addiw	a4,a5,7
    800098f4:	06c77663          	bgeu	a4,a2,80009960 <__memset+0x1c8>
    800098f8:	00e50733          	add	a4,a0,a4
    800098fc:	00b70023          	sb	a1,0(a4)
    80009900:	0087871b          	addiw	a4,a5,8
    80009904:	04c77e63          	bgeu	a4,a2,80009960 <__memset+0x1c8>
    80009908:	00e50733          	add	a4,a0,a4
    8000990c:	00b70023          	sb	a1,0(a4)
    80009910:	0097871b          	addiw	a4,a5,9
    80009914:	04c77663          	bgeu	a4,a2,80009960 <__memset+0x1c8>
    80009918:	00e50733          	add	a4,a0,a4
    8000991c:	00b70023          	sb	a1,0(a4)
    80009920:	00a7871b          	addiw	a4,a5,10
    80009924:	02c77e63          	bgeu	a4,a2,80009960 <__memset+0x1c8>
    80009928:	00e50733          	add	a4,a0,a4
    8000992c:	00b70023          	sb	a1,0(a4)
    80009930:	00b7871b          	addiw	a4,a5,11
    80009934:	02c77663          	bgeu	a4,a2,80009960 <__memset+0x1c8>
    80009938:	00e50733          	add	a4,a0,a4
    8000993c:	00b70023          	sb	a1,0(a4)
    80009940:	00c7871b          	addiw	a4,a5,12
    80009944:	00c77e63          	bgeu	a4,a2,80009960 <__memset+0x1c8>
    80009948:	00e50733          	add	a4,a0,a4
    8000994c:	00b70023          	sb	a1,0(a4)
    80009950:	00d7879b          	addiw	a5,a5,13
    80009954:	00c7f663          	bgeu	a5,a2,80009960 <__memset+0x1c8>
    80009958:	00f507b3          	add	a5,a0,a5
    8000995c:	00b78023          	sb	a1,0(a5)
    80009960:	00813403          	ld	s0,8(sp)
    80009964:	01010113          	addi	sp,sp,16
    80009968:	00008067          	ret
    8000996c:	00b00693          	li	a3,11
    80009970:	e55ff06f          	j	800097c4 <__memset+0x2c>
    80009974:	00300e93          	li	t4,3
    80009978:	ea5ff06f          	j	8000981c <__memset+0x84>
    8000997c:	00100e93          	li	t4,1
    80009980:	e9dff06f          	j	8000981c <__memset+0x84>
    80009984:	00000e93          	li	t4,0
    80009988:	e95ff06f          	j	8000981c <__memset+0x84>
    8000998c:	00000793          	li	a5,0
    80009990:	ef9ff06f          	j	80009888 <__memset+0xf0>
    80009994:	00200e93          	li	t4,2
    80009998:	e85ff06f          	j	8000981c <__memset+0x84>
    8000999c:	00400e93          	li	t4,4
    800099a0:	e7dff06f          	j	8000981c <__memset+0x84>
    800099a4:	00500e93          	li	t4,5
    800099a8:	e75ff06f          	j	8000981c <__memset+0x84>
    800099ac:	00600e93          	li	t4,6
    800099b0:	e6dff06f          	j	8000981c <__memset+0x84>

00000000800099b4 <__memmove>:
    800099b4:	ff010113          	addi	sp,sp,-16
    800099b8:	00813423          	sd	s0,8(sp)
    800099bc:	01010413          	addi	s0,sp,16
    800099c0:	0e060863          	beqz	a2,80009ab0 <__memmove+0xfc>
    800099c4:	fff6069b          	addiw	a3,a2,-1
    800099c8:	0006881b          	sext.w	a6,a3
    800099cc:	0ea5e863          	bltu	a1,a0,80009abc <__memmove+0x108>
    800099d0:	00758713          	addi	a4,a1,7
    800099d4:	00a5e7b3          	or	a5,a1,a0
    800099d8:	40a70733          	sub	a4,a4,a0
    800099dc:	0077f793          	andi	a5,a5,7
    800099e0:	00f73713          	sltiu	a4,a4,15
    800099e4:	00174713          	xori	a4,a4,1
    800099e8:	0017b793          	seqz	a5,a5
    800099ec:	00e7f7b3          	and	a5,a5,a4
    800099f0:	10078863          	beqz	a5,80009b00 <__memmove+0x14c>
    800099f4:	00900793          	li	a5,9
    800099f8:	1107f463          	bgeu	a5,a6,80009b00 <__memmove+0x14c>
    800099fc:	0036581b          	srliw	a6,a2,0x3
    80009a00:	fff8081b          	addiw	a6,a6,-1
    80009a04:	02081813          	slli	a6,a6,0x20
    80009a08:	01d85893          	srli	a7,a6,0x1d
    80009a0c:	00858813          	addi	a6,a1,8
    80009a10:	00058793          	mv	a5,a1
    80009a14:	00050713          	mv	a4,a0
    80009a18:	01088833          	add	a6,a7,a6
    80009a1c:	0007b883          	ld	a7,0(a5)
    80009a20:	00878793          	addi	a5,a5,8
    80009a24:	00870713          	addi	a4,a4,8
    80009a28:	ff173c23          	sd	a7,-8(a4)
    80009a2c:	ff0798e3          	bne	a5,a6,80009a1c <__memmove+0x68>
    80009a30:	ff867713          	andi	a4,a2,-8
    80009a34:	02071793          	slli	a5,a4,0x20
    80009a38:	0207d793          	srli	a5,a5,0x20
    80009a3c:	00f585b3          	add	a1,a1,a5
    80009a40:	40e686bb          	subw	a3,a3,a4
    80009a44:	00f507b3          	add	a5,a0,a5
    80009a48:	06e60463          	beq	a2,a4,80009ab0 <__memmove+0xfc>
    80009a4c:	0005c703          	lbu	a4,0(a1)
    80009a50:	00e78023          	sb	a4,0(a5)
    80009a54:	04068e63          	beqz	a3,80009ab0 <__memmove+0xfc>
    80009a58:	0015c603          	lbu	a2,1(a1)
    80009a5c:	00100713          	li	a4,1
    80009a60:	00c780a3          	sb	a2,1(a5)
    80009a64:	04e68663          	beq	a3,a4,80009ab0 <__memmove+0xfc>
    80009a68:	0025c603          	lbu	a2,2(a1)
    80009a6c:	00200713          	li	a4,2
    80009a70:	00c78123          	sb	a2,2(a5)
    80009a74:	02e68e63          	beq	a3,a4,80009ab0 <__memmove+0xfc>
    80009a78:	0035c603          	lbu	a2,3(a1)
    80009a7c:	00300713          	li	a4,3
    80009a80:	00c781a3          	sb	a2,3(a5)
    80009a84:	02e68663          	beq	a3,a4,80009ab0 <__memmove+0xfc>
    80009a88:	0045c603          	lbu	a2,4(a1)
    80009a8c:	00400713          	li	a4,4
    80009a90:	00c78223          	sb	a2,4(a5)
    80009a94:	00e68e63          	beq	a3,a4,80009ab0 <__memmove+0xfc>
    80009a98:	0055c603          	lbu	a2,5(a1)
    80009a9c:	00500713          	li	a4,5
    80009aa0:	00c782a3          	sb	a2,5(a5)
    80009aa4:	00e68663          	beq	a3,a4,80009ab0 <__memmove+0xfc>
    80009aa8:	0065c703          	lbu	a4,6(a1)
    80009aac:	00e78323          	sb	a4,6(a5)
    80009ab0:	00813403          	ld	s0,8(sp)
    80009ab4:	01010113          	addi	sp,sp,16
    80009ab8:	00008067          	ret
    80009abc:	02061713          	slli	a4,a2,0x20
    80009ac0:	02075713          	srli	a4,a4,0x20
    80009ac4:	00e587b3          	add	a5,a1,a4
    80009ac8:	f0f574e3          	bgeu	a0,a5,800099d0 <__memmove+0x1c>
    80009acc:	02069613          	slli	a2,a3,0x20
    80009ad0:	02065613          	srli	a2,a2,0x20
    80009ad4:	fff64613          	not	a2,a2
    80009ad8:	00e50733          	add	a4,a0,a4
    80009adc:	00c78633          	add	a2,a5,a2
    80009ae0:	fff7c683          	lbu	a3,-1(a5)
    80009ae4:	fff78793          	addi	a5,a5,-1
    80009ae8:	fff70713          	addi	a4,a4,-1
    80009aec:	00d70023          	sb	a3,0(a4)
    80009af0:	fec798e3          	bne	a5,a2,80009ae0 <__memmove+0x12c>
    80009af4:	00813403          	ld	s0,8(sp)
    80009af8:	01010113          	addi	sp,sp,16
    80009afc:	00008067          	ret
    80009b00:	02069713          	slli	a4,a3,0x20
    80009b04:	02075713          	srli	a4,a4,0x20
    80009b08:	00170713          	addi	a4,a4,1
    80009b0c:	00e50733          	add	a4,a0,a4
    80009b10:	00050793          	mv	a5,a0
    80009b14:	0005c683          	lbu	a3,0(a1)
    80009b18:	00178793          	addi	a5,a5,1
    80009b1c:	00158593          	addi	a1,a1,1
    80009b20:	fed78fa3          	sb	a3,-1(a5)
    80009b24:	fee798e3          	bne	a5,a4,80009b14 <__memmove+0x160>
    80009b28:	f89ff06f          	j	80009ab0 <__memmove+0xfc>
	...
