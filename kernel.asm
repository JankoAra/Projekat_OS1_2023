
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	f3013103          	ld	sp,-208(sp) # 8000cf30 <_GLOBAL_OFFSET_TABLE_+0x58>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	7e0070ef          	jal	ra,800077fc <start>

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
    80001084:	214010ef          	jal	ra,80002298 <interruptRoutine>

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
    80001430:	b147b783          	ld	a5,-1260(a5) # 8000cf40 <_GLOBAL_OFFSET_TABLE_+0x68>
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
    8000167c:	8c87b783          	ld	a5,-1848(a5) # 8000cf40 <_GLOBAL_OFFSET_TABLE_+0x68>
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
    80001710:	8c47c783          	lbu	a5,-1852(a5) # 8000cfd0 <_ZN8KConsole11initializedE>
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
    80001734:	8a048493          	addi	s1,s1,-1888 # 8000cfd0 <_ZN8KConsole11initializedE>
    80001738:	0000b797          	auipc	a5,0xb
    8000173c:	7b07b783          	ld	a5,1968(a5) # 8000cee8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001740:	0007b783          	ld	a5,0(a5)
    80001744:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    80001748:	0000b797          	auipc	a5,0xb
    8000174c:	7b07b783          	ld	a5,1968(a5) # 8000cef8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001750:	0007b783          	ld	a5,0(a5)
    80001754:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    80001758:	03200593          	li	a1,50
    8000175c:	0000c517          	auipc	a0,0xc
    80001760:	88c50513          	addi	a0,a0,-1908 # 8000cfe8 <_ZN8KConsole19inputBufferHasSpaceE>
    80001764:	00000097          	auipc	ra,0x0
    80001768:	dd4080e7          	jalr	-556(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    8000176c:	03200593          	li	a1,50
    80001770:	0000c517          	auipc	a0,0xc
    80001774:	88050513          	addi	a0,a0,-1920 # 8000cff0 <_ZN8KConsole20outputBufferHasSpaceE>
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	dc0080e7          	jalr	-576(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    80001780:	00000593          	li	a1,0
    80001784:	0000c517          	auipc	a0,0xc
    80001788:	87450513          	addi	a0,a0,-1932 # 8000cff8 <_ZN8KConsole12charsToInputE>
    8000178c:	00000097          	auipc	ra,0x0
    80001790:	dac080e7          	jalr	-596(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    80001794:	00000593          	li	a1,0
    80001798:	0000c517          	auipc	a0,0xc
    8000179c:	86850513          	addi	a0,a0,-1944 # 8000d000 <_ZN8KConsole13charsToOutputE>
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
    800017d8:	0000b497          	auipc	s1,0xb
    800017dc:	7f848493          	addi	s1,s1,2040 # 8000cfd0 <_ZN8KConsole11initializedE>
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
    80001820:	82872703          	lw	a4,-2008(a4) # 8000d044 <_ZN8KConsole15inputBufferSizeE>
    80001824:	03200793          	li	a5,50
    80001828:	04f70e63          	beq	a4,a5,80001884 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    8000182c:	ff010113          	addi	sp,sp,-16
    80001830:	00113423          	sd	ra,8(sp)
    80001834:	00813023          	sd	s0,0(sp)
    80001838:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    8000183c:	0000b697          	auipc	a3,0xb
    80001840:	79468693          	addi	a3,a3,1940 # 8000cfd0 <_ZN8KConsole11initializedE>
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
    800018a8:	72c48493          	addi	s1,s1,1836 # 8000cfd0 <_ZN8KConsole11initializedE>
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
    80001910:	6c448493          	addi	s1,s1,1732 # 8000cfd0 <_ZN8KConsole11initializedE>
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

000000008000195c <_ZN9Scheduler3putEP3TCB>:

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    8000195c:	ff010113          	addi	sp,sp,-16
    80001960:	00813423          	sd	s0,8(sp)
    80001964:	01010413          	addi	s0,sp,16
    if (tail == nullptr) {
    80001968:	0000b797          	auipc	a5,0xb
    8000196c:	7287b783          	ld	a5,1832(a5) # 8000d090 <_ZN9Scheduler4tailE>
    80001970:	02078263          	beqz	a5,80001994 <_ZN9Scheduler3putEP3TCB+0x38>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    80001974:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    80001978:	0000b797          	auipc	a5,0xb
    8000197c:	70a7bc23          	sd	a0,1816(a5) # 8000d090 <_ZN9Scheduler4tailE>
    using Body = void (*)(void*);

    enum ThreadStatus {
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    80001980:	00100793          	li	a5,1
    80001984:	04f52c23          	sw	a5,88(a0)
    }
    tcb->setStatus(TCB::ACTIVE);
}
    80001988:	00813403          	ld	s0,8(sp)
    8000198c:	01010113          	addi	sp,sp,16
    80001990:	00008067          	ret
        head = tail = tcb;
    80001994:	0000b797          	auipc	a5,0xb
    80001998:	6fc78793          	addi	a5,a5,1788 # 8000d090 <_ZN9Scheduler4tailE>
    8000199c:	00a7b023          	sd	a0,0(a5)
    800019a0:	00a7b423          	sd	a0,8(a5)
    800019a4:	fddff06f          	j	80001980 <_ZN9Scheduler3putEP3TCB+0x24>

00000000800019a8 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    800019a8:	ff010113          	addi	sp,sp,-16
    800019ac:	00813423          	sd	s0,8(sp)
    800019b0:	01010413          	addi	s0,sp,16
    TCB* firstThread = head;
    800019b4:	0000b717          	auipc	a4,0xb
    800019b8:	6dc70713          	addi	a4,a4,1756 # 8000d090 <_ZN9Scheduler4tailE>
    800019bc:	00873503          	ld	a0,8(a4)
    head = head->nextInScheduler;
    800019c0:	03053783          	ld	a5,48(a0)
    800019c4:	00f73423          	sd	a5,8(a4)
    if (head == nullptr) {
    800019c8:	00078a63          	beqz	a5,800019dc <_ZN9Scheduler3getEv+0x34>
        tail = head = nullptr;
    }
    firstThread->nextInScheduler = nullptr;
    800019cc:	02053823          	sd	zero,48(a0)
    return firstThread;
}
    800019d0:	00813403          	ld	s0,8(sp)
    800019d4:	01010113          	addi	sp,sp,16
    800019d8:	00008067          	ret
        tail = head = nullptr;
    800019dc:	00073423          	sd	zero,8(a4)
    800019e0:	00073023          	sd	zero,0(a4)
    800019e4:	fe9ff06f          	j	800019cc <_ZN9Scheduler3getEv+0x24>

00000000800019e8 <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    800019e8:	ff010113          	addi	sp,sp,-16
    800019ec:	00813423          	sd	s0,8(sp)
    800019f0:	01010413          	addi	s0,sp,16
    tcb->status = TCB::SLEEPING;
    800019f4:	00400793          	li	a5,4
    800019f8:	04f52c23          	sw	a5,88(a0)
    if (sleepingHead == nullptr) {
    800019fc:	0000b817          	auipc	a6,0xb
    80001a00:	6a483803          	ld	a6,1700(a6) # 8000d0a0 <_ZN9Scheduler12sleepingHeadE>
    80001a04:	02080863          	beqz	a6,80001a34 <_ZN9Scheduler10putToSleepEP3TCBm+0x4c>
        tcb->timeToSleep = sleepTime;
        return;
    }
    TCB* prevSleeping = nullptr;
    time_t accumulated = 0;
    TCB* current = sleepingHead;
    80001a08:	00080793          	mv	a5,a6
    time_t accumulated = 0;
    80001a0c:	00000693          	li	a3,0
    TCB* prevSleeping = nullptr;
    80001a10:	00000613          	li	a2,0
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001a14:	02078863          	beqz	a5,80001a44 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
    80001a18:	0387b703          	ld	a4,56(a5)
    80001a1c:	00d70733          	add	a4,a4,a3
    80001a20:	02b77263          	bgeu	a4,a1,80001a44 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
        accumulated += current->timeToSleep;
    80001a24:	00070693          	mv	a3,a4
        prevSleeping = current;
    80001a28:	00078613          	mv	a2,a5
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001a2c:	0407b783          	ld	a5,64(a5)
    80001a30:	fe5ff06f          	j	80001a14 <_ZN9Scheduler10putToSleepEP3TCBm+0x2c>
        sleepingHead = tcb;
    80001a34:	0000b797          	auipc	a5,0xb
    80001a38:	66a7b623          	sd	a0,1644(a5) # 8000d0a0 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80001a3c:	02b53c23          	sd	a1,56(a0)
        return;
    80001a40:	02c0006f          	j	80001a6c <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    }
    if (!prevSleeping) {
    80001a44:	02060a63          	beqz	a2,80001a78 <_ZN9Scheduler10putToSleepEP3TCBm+0x90>
        sleepingHead = tcb;
        tcb->timeToSleep = sleepTime;
        tcb->nextSleeping->timeToSleep -= sleepTime;
        return;
    }
    tcb->nextSleeping = current;
    80001a48:	04f53023          	sd	a5,64(a0)
    prevSleeping->nextSleeping = tcb;
    80001a4c:	04a63023          	sd	a0,64(a2)
    tcb->timeToSleep = sleepTime - accumulated;
    80001a50:	40d58733          	sub	a4,a1,a3
    80001a54:	02e53c23          	sd	a4,56(a0)
    if (current) current->timeToSleep -= sleepTime - accumulated;
    80001a58:	00078a63          	beqz	a5,80001a6c <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    80001a5c:	40b686b3          	sub	a3,a3,a1
    80001a60:	0387b703          	ld	a4,56(a5)
    80001a64:	00d706b3          	add	a3,a4,a3
    80001a68:	02d7bc23          	sd	a3,56(a5)
}
    80001a6c:	00813403          	ld	s0,8(sp)
    80001a70:	01010113          	addi	sp,sp,16
    80001a74:	00008067          	ret
        tcb->nextSleeping = sleepingHead;
    80001a78:	05053023          	sd	a6,64(a0)
        sleepingHead = tcb;
    80001a7c:	0000b797          	auipc	a5,0xb
    80001a80:	62a7b223          	sd	a0,1572(a5) # 8000d0a0 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80001a84:	02b53c23          	sd	a1,56(a0)
        tcb->nextSleeping->timeToSleep -= sleepTime;
    80001a88:	03883683          	ld	a3,56(a6)
    80001a8c:	40b686b3          	sub	a3,a3,a1
    80001a90:	02d83c23          	sd	a3,56(a6)
        return;
    80001a94:	fd9ff06f          	j	80001a6c <_ZN9Scheduler10putToSleepEP3TCBm+0x84>

0000000080001a98 <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
    if (!sleepingHead) return;
    80001a98:	0000b797          	auipc	a5,0xb
    80001a9c:	6087b783          	ld	a5,1544(a5) # 8000d0a0 <_ZN9Scheduler12sleepingHeadE>
    80001aa0:	06078a63          	beqz	a5,80001b14 <_ZN9Scheduler4wakeEv+0x7c>
    sleepingHead->timeToSleep--;
    80001aa4:	0387b703          	ld	a4,56(a5)
    80001aa8:	fff70713          	addi	a4,a4,-1
    80001aac:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001ab0:	0000b517          	auipc	a0,0xb
    80001ab4:	5f053503          	ld	a0,1520(a0) # 8000d0a0 <_ZN9Scheduler12sleepingHeadE>
    80001ab8:	04050e63          	beqz	a0,80001b14 <_ZN9Scheduler4wakeEv+0x7c>
    80001abc:	03853783          	ld	a5,56(a0)
    80001ac0:	04079a63          	bnez	a5,80001b14 <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    80001ac4:	ff010113          	addi	sp,sp,-16
    80001ac8:	00113423          	sd	ra,8(sp)
    80001acc:	00813023          	sd	s0,0(sp)
    80001ad0:	01010413          	addi	s0,sp,16
    80001ad4:	00c0006f          	j	80001ae0 <_ZN9Scheduler4wakeEv+0x48>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001ad8:	03853783          	ld	a5,56(a0)
    80001adc:	02079463          	bnez	a5,80001b04 <_ZN9Scheduler4wakeEv+0x6c>
        TCB* thread = sleepingHead;
        sleepingHead = sleepingHead->nextSleeping;
    80001ae0:	04053783          	ld	a5,64(a0)
    80001ae4:	0000b717          	auipc	a4,0xb
    80001ae8:	5af73e23          	sd	a5,1468(a4) # 8000d0a0 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    80001aec:	04053023          	sd	zero,64(a0)
        Scheduler::put(thread);
    80001af0:	00000097          	auipc	ra,0x0
    80001af4:	e6c080e7          	jalr	-404(ra) # 8000195c <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001af8:	0000b517          	auipc	a0,0xb
    80001afc:	5a853503          	ld	a0,1448(a0) # 8000d0a0 <_ZN9Scheduler12sleepingHeadE>
    80001b00:	fc051ce3          	bnez	a0,80001ad8 <_ZN9Scheduler4wakeEv+0x40>
    }
}
    80001b04:	00813083          	ld	ra,8(sp)
    80001b08:	00013403          	ld	s0,0(sp)
    80001b0c:	01010113          	addi	sp,sp,16
    80001b10:	00008067          	ret
    80001b14:	00008067          	ret

0000000080001b18 <_ZN7KMemory7kmallocEm>:
    kmalloc(blocksForBitVector);

    initialized = true;
}

void* KMemory::kmalloc(size_t size) {
    80001b18:	ff010113          	addi	sp,sp,-16
    80001b1c:	00813423          	sd	s0,8(sp)
    80001b20:	01010413          	addi	s0,sp,16
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80001b24:	16050063          	beqz	a0,80001c84 <_ZN7KMemory7kmallocEm+0x16c>
    80001b28:	0000b797          	auipc	a5,0xb
    80001b2c:	5807b783          	ld	a5,1408(a5) # 8000d0a8 <_ZN7KMemory14freeBlocksLeftE>
    80001b30:	14a7ee63          	bltu	a5,a0,80001c8c <_ZN7KMemory7kmallocEm+0x174>
    uint64 currentElem = 0;
    uint64 currentBit = 63;
    uint64 firstZeroElem = 0;
    uint64 firstZeroBit = 63;
    uint64 zerosFound = 0;
    bool zeroFound = false;
    80001b34:	00000313          	li	t1,0
    uint64 zerosFound = 0;
    80001b38:	00000713          	li	a4,0
    uint64 firstZeroBit = 63;
    80001b3c:	03f00813          	li	a6,63
    uint64 firstZeroElem = 0;
    80001b40:	00000893          	li	a7,0
    uint64 currentBit = 63;
    80001b44:	03f00793          	li	a5,63
    uint64 currentElem = 0;
    80001b48:	00000593          	li	a1,0
    80001b4c:	0080006f          	j	80001b54 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroElem = currentElem;
        } else {
            zerosFound++;
        }
        if (zerosFound == size) break;
        if (currentBit-- == 0) {
    80001b50:	00068793          	mv	a5,a3
    while (currentElem < sizeOfBitVectorInUint64) {
    80001b54:	0000b697          	auipc	a3,0xb
    80001b58:	55c6b683          	ld	a3,1372(a3) # 8000d0b0 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001b5c:	08d5fa63          	bgeu	a1,a3,80001bf0 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001b60:	03f00693          	li	a3,63
    80001b64:	02d78a63          	beq	a5,a3,80001b98 <_ZN7KMemory7kmallocEm+0x80>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    80001b68:	00359693          	slli	a3,a1,0x3
    80001b6c:	0000b617          	auipc	a2,0xb
    80001b70:	54c63603          	ld	a2,1356(a2) # 8000d0b8 <_ZN7KMemory9bitVectorE>
    80001b74:	00d606b3          	add	a3,a2,a3
    80001b78:	0006b683          	ld	a3,0(a3)

    static uint64 freeBlocksLeft;

    //maska sa 1 na mestu bitPos i ostalim nulama (bitPos=0..63)
    inline static uint64 maskBit(uint64 bitPos) {
        return (uint64)1 << bitPos;
    80001b7c:	00100613          	li	a2,1
    80001b80:	00f61633          	sll	a2,a2,a5
    80001b84:	00c6f6b3          	and	a3,a3,a2
        if (bit > 0) {
    80001b88:	02069a63          	bnez	a3,80001bbc <_ZN7KMemory7kmallocEm+0xa4>
        } else if (!zeroFound) {
    80001b8c:	04030863          	beqz	t1,80001bdc <_ZN7KMemory7kmallocEm+0xc4>
            zerosFound++;
    80001b90:	00170713          	addi	a4,a4,1
    80001b94:	0300006f          	j	80001bc4 <_ZN7KMemory7kmallocEm+0xac>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001b98:	00359693          	slli	a3,a1,0x3
    80001b9c:	0000b617          	auipc	a2,0xb
    80001ba0:	51c63603          	ld	a2,1308(a2) # 8000d0b8 <_ZN7KMemory9bitVectorE>
    80001ba4:	00d606b3          	add	a3,a2,a3
    80001ba8:	0006b603          	ld	a2,0(a3)
    80001bac:	fff00693          	li	a3,-1
    80001bb0:	fad61ce3          	bne	a2,a3,80001b68 <_ZN7KMemory7kmallocEm+0x50>
            currentElem++;
    80001bb4:	00158593          	addi	a1,a1,1
            continue;
    80001bb8:	f9dff06f          	j	80001b54 <_ZN7KMemory7kmallocEm+0x3c>
            zeroFound = false;
    80001bbc:	00000313          	li	t1,0
            zerosFound = 0;
    80001bc0:	00000713          	li	a4,0
        if (zerosFound == size) break;
    80001bc4:	02a70663          	beq	a4,a0,80001bf0 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit-- == 0) {
    80001bc8:	fff78693          	addi	a3,a5,-1
    80001bcc:	f80792e3          	bnez	a5,80001b50 <_ZN7KMemory7kmallocEm+0x38>
            currentBit = 63;
            currentElem++;
    80001bd0:	00158593          	addi	a1,a1,1
            currentBit = 63;
    80001bd4:	03f00793          	li	a5,63
    80001bd8:	f7dff06f          	j	80001b54 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroBit = currentBit;
    80001bdc:	00078813          	mv	a6,a5
            firstZeroElem = currentElem;
    80001be0:	00058893          	mv	a7,a1
            zeroFound = true;
    80001be4:	00100313          	li	t1,1
            zerosFound = 1;
    80001be8:	00100713          	li	a4,1
    80001bec:	fd9ff06f          	j	80001bc4 <_ZN7KMemory7kmallocEm+0xac>
        }
    }
    if (zerosFound != size) return nullptr;
    80001bf0:	0aa71263          	bne	a4,a0,80001c94 <_ZN7KMemory7kmallocEm+0x17c>

    //alociranje blokova
    uint64 blockNum = firstZeroElem * 64 + (63 - firstZeroBit);
    80001bf4:	00689793          	slli	a5,a7,0x6
    80001bf8:	410787b3          	sub	a5,a5,a6
    80001bfc:	03f78793          	addi	a5,a5,63
    void* addr = (char*)HEAP_START_ADDR + blockNum * MEM_BLOCK_SIZE;
    80001c00:	0000b697          	auipc	a3,0xb
    80001c04:	3086b683          	ld	a3,776(a3) # 8000cf08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001c08:	0006b583          	ld	a1,0(a3)
    80001c0c:	00679793          	slli	a5,a5,0x6
    80001c10:	00f585b3          	add	a1,a1,a5
    *(uint64*)addr = size;  //da znamo koliko blokova je alocirano zaredom
    80001c14:	00a5b023          	sd	a0,0(a1)

    //upisivanje 1 u bit vektor
    currentElem = firstZeroElem;
    currentBit = firstZeroBit;
    80001c18:	0080006f          	j	80001c20 <_ZN7KMemory7kmallocEm+0x108>
    while (zerosFound > 0) {
        bitVector[currentElem] |= maskBit(currentBit);
        zerosFound--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001c1c:	00078813          	mv	a6,a5
    while (zerosFound > 0) {
    80001c20:	04070063          	beqz	a4,80001c60 <_ZN7KMemory7kmallocEm+0x148>
    80001c24:	00100693          	li	a3,1
    80001c28:	01069633          	sll	a2,a3,a6
        bitVector[currentElem] |= maskBit(currentBit);
    80001c2c:	00389793          	slli	a5,a7,0x3
    80001c30:	0000b697          	auipc	a3,0xb
    80001c34:	4886b683          	ld	a3,1160(a3) # 8000d0b8 <_ZN7KMemory9bitVectorE>
    80001c38:	00f687b3          	add	a5,a3,a5
    80001c3c:	0007b683          	ld	a3,0(a5)
    80001c40:	00c6e6b3          	or	a3,a3,a2
    80001c44:	00d7b023          	sd	a3,0(a5)
        zerosFound--;
    80001c48:	fff70713          	addi	a4,a4,-1
        if (currentBit-- == 0) {
    80001c4c:	fff80793          	addi	a5,a6,-1
    80001c50:	fc0816e3          	bnez	a6,80001c1c <_ZN7KMemory7kmallocEm+0x104>
            currentElem++;
    80001c54:	00188893          	addi	a7,a7,1
            currentBit = 63;
    80001c58:	03f00793          	li	a5,63
    80001c5c:	fc1ff06f          	j	80001c1c <_ZN7KMemory7kmallocEm+0x104>
        }
    }
    freeBlocksLeft -= size;
    80001c60:	0000b717          	auipc	a4,0xb
    80001c64:	44870713          	addi	a4,a4,1096 # 8000d0a8 <_ZN7KMemory14freeBlocksLeftE>
    80001c68:	00073783          	ld	a5,0(a4)
    80001c6c:	40a78533          	sub	a0,a5,a0
    80001c70:	00a73023          	sd	a0,0(a4)
    return (char*)addr + 2 * sizeof(uint64);    //offset 2 da bi bilo zaokruzeno na 16 zbog steka
    80001c74:	01058513          	addi	a0,a1,16
}
    80001c78:	00813403          	ld	s0,8(sp)
    80001c7c:	01010113          	addi	sp,sp,16
    80001c80:	00008067          	ret
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80001c84:	00000513          	li	a0,0
    80001c88:	ff1ff06f          	j	80001c78 <_ZN7KMemory7kmallocEm+0x160>
    80001c8c:	00000513          	li	a0,0
    80001c90:	fe9ff06f          	j	80001c78 <_ZN7KMemory7kmallocEm+0x160>
    if (zerosFound != size) return nullptr;
    80001c94:	00000513          	li	a0,0
    80001c98:	fe1ff06f          	j	80001c78 <_ZN7KMemory7kmallocEm+0x160>

0000000080001c9c <_ZN7KMemory16initializeMemoryEv>:
    if (initialized) return;
    80001c9c:	0000b797          	auipc	a5,0xb
    80001ca0:	4247c783          	lbu	a5,1060(a5) # 8000d0c0 <_ZN7KMemory11initializedE>
    80001ca4:	0a079863          	bnez	a5,80001d54 <_ZN7KMemory16initializeMemoryEv+0xb8>
void KMemory::initializeMemory() {
    80001ca8:	ff010113          	addi	sp,sp,-16
    80001cac:	00113423          	sd	ra,8(sp)
    80001cb0:	00813023          	sd	s0,0(sp)
    80001cb4:	01010413          	addi	s0,sp,16
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001cb8:	0000b797          	auipc	a5,0xb
    80001cbc:	2a07b783          	ld	a5,672(a5) # 8000cf58 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001cc0:	0007b783          	ld	a5,0(a5)
    80001cc4:	0000b717          	auipc	a4,0xb
    80001cc8:	24473703          	ld	a4,580(a4) # 8000cf08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001ccc:	00073603          	ld	a2,0(a4)
    80001cd0:	40c787b3          	sub	a5,a5,a2
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    80001cd4:	00c7d793          	srli	a5,a5,0xc
    80001cd8:	0000b717          	auipc	a4,0xb
    80001cdc:	3d070713          	addi	a4,a4,976 # 8000d0a8 <_ZN7KMemory14freeBlocksLeftE>
    80001ce0:	00f73423          	sd	a5,8(a4)
    numOfBlocks = sizeOfBitVectorInUint64 * sizeof(uint64) * 8; //da se zaokruzi broj postojecih blokova na umnozak 64
    80001ce4:	00679693          	slli	a3,a5,0x6
    80001ce8:	02d73023          	sd	a3,32(a4)
    uint64 blocksForBitVector = (sizeOfBitVectorInUint64 * sizeof(uint64) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80001cec:	00878513          	addi	a0,a5,8
    80001cf0:	00351513          	slli	a0,a0,0x3
    80001cf4:	fff50513          	addi	a0,a0,-1
    80001cf8:	00655513          	srli	a0,a0,0x6
    bitVector = (uint64*)HEAP_START_ADDR;
    80001cfc:	00c73823          	sd	a2,16(a4)
    freeBlocksLeft = numOfBlocks;
    80001d00:	00d73023          	sd	a3,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001d04:	00000793          	li	a5,0
    80001d08:	0000b717          	auipc	a4,0xb
    80001d0c:	3a873703          	ld	a4,936(a4) # 8000d0b0 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001d10:	02e7f063          	bgeu	a5,a4,80001d30 <_ZN7KMemory16initializeMemoryEv+0x94>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    80001d14:	00379693          	slli	a3,a5,0x3
    80001d18:	0000b717          	auipc	a4,0xb
    80001d1c:	3a073703          	ld	a4,928(a4) # 8000d0b8 <_ZN7KMemory9bitVectorE>
    80001d20:	00d70733          	add	a4,a4,a3
    80001d24:	00073023          	sd	zero,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001d28:	00178793          	addi	a5,a5,1
    80001d2c:	fddff06f          	j	80001d08 <_ZN7KMemory16initializeMemoryEv+0x6c>
    kmalloc(blocksForBitVector);
    80001d30:	00000097          	auipc	ra,0x0
    80001d34:	de8080e7          	jalr	-536(ra) # 80001b18 <_ZN7KMemory7kmallocEm>
    initialized = true;
    80001d38:	00100793          	li	a5,1
    80001d3c:	0000b717          	auipc	a4,0xb
    80001d40:	38f70223          	sb	a5,900(a4) # 8000d0c0 <_ZN7KMemory11initializedE>
}
    80001d44:	00813083          	ld	ra,8(sp)
    80001d48:	00013403          	ld	s0,0(sp)
    80001d4c:	01010113          	addi	sp,sp,16
    80001d50:	00008067          	ret
    80001d54:	00008067          	ret

0000000080001d58 <_ZN7KMemory5kfreeEPv>:

int KMemory::kfree(void* ptr) {
    80001d58:	ff010113          	addi	sp,sp,-16
    80001d5c:	00813423          	sd	s0,8(sp)
    80001d60:	01010413          	addi	s0,sp,16
    if (!ptr) return 0;
    80001d64:	08050a63          	beqz	a0,80001df8 <_ZN7KMemory5kfreeEPv+0xa0>
    ptr = (char*)ptr - 2 * sizeof(uint64);
    80001d68:	ff050793          	addi	a5,a0,-16
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001d6c:	0000b717          	auipc	a4,0xb
    80001d70:	19c73703          	ld	a4,412(a4) # 8000cf08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001d74:	00073703          	ld	a4,0(a4)
    80001d78:	40e787b3          	sub	a5,a5,a4
    80001d7c:	03f7f713          	andi	a4,a5,63
    80001d80:	08071063          	bnez	a4,80001e00 <_ZN7KMemory5kfreeEPv+0xa8>
    uint64 blocksToFree = *(uint64*)ptr;
    80001d84:	ff053583          	ld	a1,-16(a0)
    freeBlocksLeft += blocksToFree;
    80001d88:	0000b697          	auipc	a3,0xb
    80001d8c:	32068693          	addi	a3,a3,800 # 8000d0a8 <_ZN7KMemory14freeBlocksLeftE>
    80001d90:	0006b703          	ld	a4,0(a3)
    80001d94:	00b70733          	add	a4,a4,a1
    80001d98:	00e6b023          	sd	a4,0(a3)
    uint64 blockNum = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    80001d9c:	0067d613          	srli	a2,a5,0x6
    uint64 currentElem = blockNum / 64;
    80001da0:	00c7d513          	srli	a0,a5,0xc
    uint64 currentBit = 63 - blockNum % 64;
    80001da4:	fff64613          	not	a2,a2
    80001da8:	03f67613          	andi	a2,a2,63
    80001dac:	0080006f          	j	80001db4 <_ZN7KMemory5kfreeEPv+0x5c>
    while (blocksToFree > 0) {
        bitVector[currentElem] &= ~maskBit(currentBit);
        blocksToFree--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001db0:	00078613          	mv	a2,a5
    while (blocksToFree > 0) {
    80001db4:	04058a63          	beqz	a1,80001e08 <_ZN7KMemory5kfreeEPv+0xb0>
    80001db8:	00100793          	li	a5,1
    80001dbc:	00c797b3          	sll	a5,a5,a2
        bitVector[currentElem] &= ~maskBit(currentBit);
    80001dc0:	fff7c793          	not	a5,a5
    80001dc4:	00351713          	slli	a4,a0,0x3
    80001dc8:	0000b697          	auipc	a3,0xb
    80001dcc:	2f06b683          	ld	a3,752(a3) # 8000d0b8 <_ZN7KMemory9bitVectorE>
    80001dd0:	00e68733          	add	a4,a3,a4
    80001dd4:	00073683          	ld	a3,0(a4)
    80001dd8:	00f6f7b3          	and	a5,a3,a5
    80001ddc:	00f73023          	sd	a5,0(a4)
        blocksToFree--;
    80001de0:	fff58593          	addi	a1,a1,-1
        if (currentBit-- == 0) {
    80001de4:	fff60793          	addi	a5,a2,-1
    80001de8:	fc0614e3          	bnez	a2,80001db0 <_ZN7KMemory5kfreeEPv+0x58>
            currentElem++;
    80001dec:	00150513          	addi	a0,a0,1
            currentBit = 63;
    80001df0:	03f00793          	li	a5,63
    80001df4:	fbdff06f          	j	80001db0 <_ZN7KMemory5kfreeEPv+0x58>
    if (!ptr) return 0;
    80001df8:	00000513          	li	a0,0
    80001dfc:	0100006f          	j	80001e0c <_ZN7KMemory5kfreeEPv+0xb4>
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001e00:	fff00513          	li	a0,-1
    80001e04:	0080006f          	j	80001e0c <_ZN7KMemory5kfreeEPv+0xb4>
        }
    }
    return 0;
    80001e08:	00000513          	li	a0,0
}
    80001e0c:	00813403          	ld	s0,8(sp)
    80001e10:	01010113          	addi	sp,sp,16
    80001e14:	00008067          	ret

0000000080001e18 <main>:

extern "C" void interruptHandler();

void userMain();

int main() {
    80001e18:	fc010113          	addi	sp,sp,-64
    80001e1c:	02113c23          	sd	ra,56(sp)
    80001e20:	02813823          	sd	s0,48(sp)
    80001e24:	02913423          	sd	s1,40(sp)
    80001e28:	03213023          	sd	s2,32(sp)
    80001e2c:	01313c23          	sd	s3,24(sp)
    80001e30:	04010413          	addi	s0,sp,64
//postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001e34:	0000b797          	auipc	a5,0xb
    80001e38:	12c7b783          	ld	a5,300(a5) # 8000cf60 <_GLOBAL_OFFSET_TABLE_+0x88>
    80001e3c:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80001e40:	00000097          	auipc	ra,0x0
    80001e44:	e5c080e7          	jalr	-420(ra) # 80001c9c <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001e48:	00000097          	auipc	ra,0x0
    80001e4c:	8c4080e7          	jalr	-1852(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>

    //pravljenje niti
    thread_t mainHandle;
    Thread* idleHandle = new IdleThread();
    80001e50:	02000513          	li	a0,32
    80001e54:	00001097          	auipc	ra,0x1
    80001e58:	e50080e7          	jalr	-432(ra) # 80002ca4 <_Znwm>
    80001e5c:	00050913          	mv	s2,a0
    80001e60:	00053023          	sd	zero,0(a0)
    80001e64:	00053423          	sd	zero,8(a0)
    80001e68:	00053823          	sd	zero,16(a0)
    80001e6c:	00053c23          	sd	zero,24(a0)
class IdleThread : public Thread {
    80001e70:	00001097          	auipc	ra,0x1
    80001e74:	11c080e7          	jalr	284(ra) # 80002f8c <_ZN6ThreadC1Ev>
    80001e78:	0000b797          	auipc	a5,0xb
    80001e7c:	dc878793          	addi	a5,a5,-568 # 8000cc40 <_ZTV10IdleThread+0x10>
    80001e80:	00f93023          	sd	a5,0(s2)
    Thread* consoleOutputHandle = new KernelConsumer();
    80001e84:	02000513          	li	a0,32
    80001e88:	00001097          	auipc	ra,0x1
    80001e8c:	e1c080e7          	jalr	-484(ra) # 80002ca4 <_Znwm>
    80001e90:	00050493          	mv	s1,a0
    80001e94:	00053023          	sd	zero,0(a0)
    80001e98:	00053423          	sd	zero,8(a0)
    80001e9c:	00053823          	sd	zero,16(a0)
    80001ea0:	00053c23          	sd	zero,24(a0)
class KernelConsumer : public Thread {
    80001ea4:	00001097          	auipc	ra,0x1
    80001ea8:	0e8080e7          	jalr	232(ra) # 80002f8c <_ZN6ThreadC1Ev>
    80001eac:	0000b797          	auipc	a5,0xb
    80001eb0:	dbc78793          	addi	a5,a5,-580 # 8000cc68 <_ZTV14KernelConsumer+0x10>
    80001eb4:	00f4b023          	sd	a5,0(s1)
    Thread* userThr = new Thread((TCB::Body)userMain, nullptr);
    80001eb8:	02000513          	li	a0,32
    80001ebc:	00001097          	auipc	ra,0x1
    80001ec0:	de8080e7          	jalr	-536(ra) # 80002ca4 <_Znwm>
    80001ec4:	00050993          	mv	s3,a0
    80001ec8:	00000613          	li	a2,0
    80001ecc:	0000b597          	auipc	a1,0xb
    80001ed0:	0145b583          	ld	a1,20(a1) # 8000cee0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001ed4:	00001097          	auipc	ra,0x1
    80001ed8:	ef0080e7          	jalr	-272(ra) # 80002dc4 <_ZN6ThreadC1EPFvPvES0_>
    80001edc:	0580006f          	j	80001f34 <main+0x11c>
    80001ee0:	00050493          	mv	s1,a0
    Thread* idleHandle = new IdleThread();
    80001ee4:	00090513          	mv	a0,s2
    80001ee8:	00001097          	auipc	ra,0x1
    80001eec:	e0c080e7          	jalr	-500(ra) # 80002cf4 <_ZdlPv>
    80001ef0:	00048513          	mv	a0,s1
    80001ef4:	0000c097          	auipc	ra,0xc
    80001ef8:	324080e7          	jalr	804(ra) # 8000e218 <_Unwind_Resume>
    80001efc:	00050913          	mv	s2,a0
    Thread* consoleOutputHandle = new KernelConsumer();
    80001f00:	00048513          	mv	a0,s1
    80001f04:	00001097          	auipc	ra,0x1
    80001f08:	df0080e7          	jalr	-528(ra) # 80002cf4 <_ZdlPv>
    80001f0c:	00090513          	mv	a0,s2
    80001f10:	0000c097          	auipc	ra,0xc
    80001f14:	308080e7          	jalr	776(ra) # 8000e218 <_Unwind_Resume>
    80001f18:	00050493          	mv	s1,a0
    Thread* userThr = new Thread((TCB::Body)userMain, nullptr);
    80001f1c:	00098513          	mv	a0,s3
    80001f20:	00001097          	auipc	ra,0x1
    80001f24:	dd4080e7          	jalr	-556(ra) # 80002cf4 <_ZdlPv>
    80001f28:	00048513          	mv	a0,s1
    80001f2c:	0000c097          	auipc	ra,0xc
    80001f30:	2ec080e7          	jalr	748(ra) # 8000e218 <_Unwind_Resume>
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    80001f34:	00000613          	li	a2,0
    80001f38:	00000597          	auipc	a1,0x0
    80001f3c:	ee058593          	addi	a1,a1,-288 # 80001e18 <main>
    80001f40:	fc840513          	addi	a0,s0,-56
    80001f44:	fffff097          	auipc	ra,0xfffff
    80001f48:	4c0080e7          	jalr	1216(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80001f4c:	fc843783          	ld	a5,-56(s0)

    ThreadQueue* getListOfJoiningThreads(){return &waitingToJoin;}

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }
    80001f50:	0000b717          	auipc	a4,0xb
    80001f54:	00073703          	ld	a4,0(a4) # 8000cf50 <_GLOBAL_OFFSET_TABLE_+0x78>
    80001f58:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001f5c:	00100713          	li	a4,1
    80001f60:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    idleHandle->start();
    80001f64:	00090513          	mv	a0,s2
    80001f68:	00001097          	auipc	ra,0x1
    80001f6c:	ef4080e7          	jalr	-268(ra) # 80002e5c <_ZN6Thread5startEv>
    consoleOutputHandle->start();
    80001f70:	00048513          	mv	a0,s1
    80001f74:	00001097          	auipc	ra,0x1
    80001f78:	ee8080e7          	jalr	-280(ra) # 80002e5c <_ZN6Thread5startEv>
    userThr->start();
    80001f7c:	00098513          	mv	a0,s3
    80001f80:	00001097          	auipc	ra,0x1
    80001f84:	edc080e7          	jalr	-292(ra) # 80002e5c <_ZN6Thread5startEv>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001f88:	00200493          	li	s1,2
    80001f8c:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    userThr->join();
    80001f90:	00098513          	mv	a0,s3
    80001f94:	00001097          	auipc	ra,0x1
    80001f98:	f10080e7          	jalr	-240(ra) # 80002ea4 <_ZN6Thread4joinEv>
    //stavlja karakter u ulazni bafer; ako je bafer pun, ignorise se
    static void placeInInput(char c);

    //ispis svih preostalih karaktera u izlaznom baferu
    static void flush() {
        __asm__ volatile("li a0, 0x43");
    80001f9c:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80001fa0:	00000073          	ecall
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001fa4:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80001fa8:	00000513          	li	a0,0
    80001fac:	03813083          	ld	ra,56(sp)
    80001fb0:	03013403          	ld	s0,48(sp)
    80001fb4:	02813483          	ld	s1,40(sp)
    80001fb8:	02013903          	ld	s2,32(sp)
    80001fbc:	01813983          	ld	s3,24(sp)
    80001fc0:	04010113          	addi	sp,sp,64
    80001fc4:	00008067          	ret

0000000080001fc8 <_ZN10IdleThread3runEv>:
    void run() override {
    80001fc8:	ff010113          	addi	sp,sp,-16
    80001fcc:	00113423          	sd	ra,8(sp)
    80001fd0:	00813023          	sd	s0,0(sp)
    80001fd4:	01010413          	addi	s0,sp,16
        while (1) { thread_dispatch(); }
    80001fd8:	fffff097          	auipc	ra,0xfffff
    80001fdc:	4e8080e7          	jalr	1256(ra) # 800014c0 <_Z15thread_dispatchv>
    80001fe0:	ff9ff06f          	j	80001fd8 <_ZN10IdleThread3runEv+0x10>

0000000080001fe4 <_ZN10IdleThreadD1Ev>:
class IdleThread : public Thread {
    80001fe4:	ff010113          	addi	sp,sp,-16
    80001fe8:	00113423          	sd	ra,8(sp)
    80001fec:	00813023          	sd	s0,0(sp)
    80001ff0:	01010413          	addi	s0,sp,16
    80001ff4:	0000b797          	auipc	a5,0xb
    80001ff8:	c4c78793          	addi	a5,a5,-948 # 8000cc40 <_ZTV10IdleThread+0x10>
    80001ffc:	00f53023          	sd	a5,0(a0)
    80002000:	00001097          	auipc	ra,0x1
    80002004:	b9c080e7          	jalr	-1124(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80002008:	00813083          	ld	ra,8(sp)
    8000200c:	00013403          	ld	s0,0(sp)
    80002010:	01010113          	addi	sp,sp,16
    80002014:	00008067          	ret

0000000080002018 <_ZN10IdleThreadD0Ev>:
    80002018:	fe010113          	addi	sp,sp,-32
    8000201c:	00113c23          	sd	ra,24(sp)
    80002020:	00813823          	sd	s0,16(sp)
    80002024:	00913423          	sd	s1,8(sp)
    80002028:	02010413          	addi	s0,sp,32
    8000202c:	00050493          	mv	s1,a0
    80002030:	0000b797          	auipc	a5,0xb
    80002034:	c1078793          	addi	a5,a5,-1008 # 8000cc40 <_ZTV10IdleThread+0x10>
    80002038:	00f53023          	sd	a5,0(a0)
    8000203c:	00001097          	auipc	ra,0x1
    80002040:	b60080e7          	jalr	-1184(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80002044:	00048513          	mv	a0,s1
    80002048:	00001097          	auipc	ra,0x1
    8000204c:	cac080e7          	jalr	-852(ra) # 80002cf4 <_ZdlPv>
    80002050:	01813083          	ld	ra,24(sp)
    80002054:	01013403          	ld	s0,16(sp)
    80002058:	00813483          	ld	s1,8(sp)
    8000205c:	02010113          	addi	sp,sp,32
    80002060:	00008067          	ret

0000000080002064 <_ZN14KernelConsumerD1Ev>:
class KernelConsumer : public Thread {
    80002064:	ff010113          	addi	sp,sp,-16
    80002068:	00113423          	sd	ra,8(sp)
    8000206c:	00813023          	sd	s0,0(sp)
    80002070:	01010413          	addi	s0,sp,16
    80002074:	0000b797          	auipc	a5,0xb
    80002078:	bf478793          	addi	a5,a5,-1036 # 8000cc68 <_ZTV14KernelConsumer+0x10>
    8000207c:	00f53023          	sd	a5,0(a0)
    80002080:	00001097          	auipc	ra,0x1
    80002084:	b1c080e7          	jalr	-1252(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80002088:	00813083          	ld	ra,8(sp)
    8000208c:	00013403          	ld	s0,0(sp)
    80002090:	01010113          	addi	sp,sp,16
    80002094:	00008067          	ret

0000000080002098 <_ZN14KernelConsumerD0Ev>:
    80002098:	fe010113          	addi	sp,sp,-32
    8000209c:	00113c23          	sd	ra,24(sp)
    800020a0:	00813823          	sd	s0,16(sp)
    800020a4:	00913423          	sd	s1,8(sp)
    800020a8:	02010413          	addi	s0,sp,32
    800020ac:	00050493          	mv	s1,a0
    800020b0:	0000b797          	auipc	a5,0xb
    800020b4:	bb878793          	addi	a5,a5,-1096 # 8000cc68 <_ZTV14KernelConsumer+0x10>
    800020b8:	00f53023          	sd	a5,0(a0)
    800020bc:	00001097          	auipc	ra,0x1
    800020c0:	ae0080e7          	jalr	-1312(ra) # 80002b9c <_ZN6ThreadD1Ev>
    800020c4:	00048513          	mv	a0,s1
    800020c8:	00001097          	auipc	ra,0x1
    800020cc:	c2c080e7          	jalr	-980(ra) # 80002cf4 <_ZdlPv>
    800020d0:	01813083          	ld	ra,24(sp)
    800020d4:	01013403          	ld	s0,16(sp)
    800020d8:	00813483          	ld	s1,8(sp)
    800020dc:	02010113          	addi	sp,sp,32
    800020e0:	00008067          	ret

00000000800020e4 <_ZN14KernelConsumer3runEv>:
    void run() override {
    800020e4:	ff010113          	addi	sp,sp,-16
    800020e8:	00113423          	sd	ra,8(sp)
    800020ec:	00813023          	sd	s0,0(sp)
    800020f0:	01010413          	addi	s0,sp,16
    800020f4:	0280006f          	j	8000211c <_ZN14KernelConsumer3runEv+0x38>

    static uint8 getSRvalue() { return *sr; }

    static uint8 getDRvalue() { return *dr; }

    static void setDRvalue(char c) { *dr = c; }
    800020f8:	0000b797          	auipc	a5,0xb
    800020fc:	e407b783          	ld	a5,-448(a5) # 8000cf38 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002100:	0007b783          	ld	a5,0(a5)
    80002104:	00a78023          	sb	a0,0(a5)
            sem_signal(KConsole::getOutputBufferHasSpace());
    80002108:	0000b797          	auipc	a5,0xb
    8000210c:	e407b783          	ld	a5,-448(a5) # 8000cf48 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002110:	0007b503          	ld	a0,0(a5)
    80002114:	fffff097          	auipc	ra,0xfffff
    80002118:	4bc080e7          	jalr	1212(ra) # 800015d0 <_Z10sem_signalP4KSem>
            char c = KConsole::getFromOutput();
    8000211c:	fffff097          	auipc	ra,0xfffff
    80002120:	6a8080e7          	jalr	1704(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    80002124:	0000b797          	auipc	a5,0xb
    80002128:	e5c7b783          	ld	a5,-420(a5) # 8000cf80 <_GLOBAL_OFFSET_TABLE_+0xa8>
    8000212c:	0007b783          	ld	a5,0(a5)
    80002130:	0007c783          	lbu	a5,0(a5)
            while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80002134:	0207f793          	andi	a5,a5,32
    80002138:	fe0786e3          	beqz	a5,80002124 <_ZN14KernelConsumer3runEv+0x40>
    8000213c:	fbdff06f          	j	800020f8 <_ZN14KernelConsumer3runEv+0x14>

0000000080002140 <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80002140:	ff010113          	addi	sp,sp,-16
    80002144:	00113423          	sd	ra,8(sp)
    80002148:	00813023          	sd	s0,0(sp)
    8000214c:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80002150:	fffff097          	auipc	ra,0xfffff
    80002154:	370080e7          	jalr	880(ra) # 800014c0 <_Z15thread_dispatchv>
    80002158:	ff9ff06f          	j	80002150 <_Z4idlePv+0x10>

000000008000215c <_Z22kernelConsumerFunctionPv>:
}

//salje na izlaz karakter iz izlaznog bafera KConsole
void kernelConsumerFunction(void*) {
    8000215c:	ff010113          	addi	sp,sp,-16
    80002160:	00113423          	sd	ra,8(sp)
    80002164:	00813023          	sd	s0,0(sp)
    80002168:	01010413          	addi	s0,sp,16
    8000216c:	0280006f          	j	80002194 <_Z22kernelConsumerFunctionPv+0x38>
    static void setDRvalue(char c) { *dr = c; }
    80002170:	0000b797          	auipc	a5,0xb
    80002174:	dc87b783          	ld	a5,-568(a5) # 8000cf38 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002178:	0007b783          	ld	a5,0(a5)
    8000217c:	00a78023          	sb	a0,0(a5)
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
        KConsole::setDRvalue(c);
        sem_signal(KConsole::getOutputBufferHasSpace());
    80002180:	0000b797          	auipc	a5,0xb
    80002184:	dc87b783          	ld	a5,-568(a5) # 8000cf48 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002188:	0007b503          	ld	a0,0(a5)
    8000218c:	fffff097          	auipc	ra,0xfffff
    80002190:	444080e7          	jalr	1092(ra) # 800015d0 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80002194:	fffff097          	auipc	ra,0xfffff
    80002198:	630080e7          	jalr	1584(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    8000219c:	0000b797          	auipc	a5,0xb
    800021a0:	de47b783          	ld	a5,-540(a5) # 8000cf80 <_GLOBAL_OFFSET_TABLE_+0xa8>
    800021a4:	0007b783          	ld	a5,0(a5)
    800021a8:	0007c783          	lbu	a5,0(a5)
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    800021ac:	0207f793          	andi	a5,a5,32
    800021b0:	fe0786e3          	beqz	a5,8000219c <_Z22kernelConsumerFunctionPv+0x40>
    800021b4:	fbdff06f          	j	80002170 <_Z22kernelConsumerFunctionPv+0x14>

00000000800021b8 <_Z5main3v>:
    }
}

int main3() {
    800021b8:	fc010113          	addi	sp,sp,-64
    800021bc:	02113c23          	sd	ra,56(sp)
    800021c0:	02813823          	sd	s0,48(sp)
    800021c4:	02913423          	sd	s1,40(sp)
    800021c8:	04010413          	addi	s0,sp,64
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    800021cc:	0000b797          	auipc	a5,0xb
    800021d0:	d947b783          	ld	a5,-620(a5) # 8000cf60 <_GLOBAL_OFFSET_TABLE_+0x88>
    800021d4:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    800021d8:	00000097          	auipc	ra,0x0
    800021dc:	ac4080e7          	jalr	-1340(ra) # 80001c9c <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    800021e0:	fffff097          	auipc	ra,0xfffff
    800021e4:	52c080e7          	jalr	1324(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    800021e8:	00000613          	li	a2,0
    800021ec:	0000b597          	auipc	a1,0xb
    800021f0:	d545b583          	ld	a1,-684(a1) # 8000cf40 <_GLOBAL_OFFSET_TABLE_+0x68>
    800021f4:	fd840513          	addi	a0,s0,-40
    800021f8:	fffff097          	auipc	ra,0xfffff
    800021fc:	20c080e7          	jalr	524(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80002200:	fd843783          	ld	a5,-40(s0)
    static TCB* getRunning() { return running; }
    80002204:	0000b717          	auipc	a4,0xb
    80002208:	d4c73703          	ld	a4,-692(a4) # 8000cf50 <_GLOBAL_OFFSET_TABLE_+0x78>
    8000220c:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80002210:	00100713          	li	a4,1
    80002214:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    80002218:	00000613          	li	a2,0
    8000221c:	0000b597          	auipc	a1,0xb
    80002220:	cc45b583          	ld	a1,-828(a1) # 8000cee0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002224:	fd040513          	addi	a0,s0,-48
    80002228:	fffff097          	auipc	ra,0xfffff
    8000222c:	1dc080e7          	jalr	476(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80002230:	00000613          	li	a2,0
    80002234:	00000597          	auipc	a1,0x0
    80002238:	f2858593          	addi	a1,a1,-216 # 8000215c <_Z22kernelConsumerFunctionPv>
    8000223c:	fc040513          	addi	a0,s0,-64
    80002240:	fffff097          	auipc	ra,0xfffff
    80002244:	1c4080e7          	jalr	452(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80002248:	00000613          	li	a2,0
    8000224c:	00000597          	auipc	a1,0x0
    80002250:	ef458593          	addi	a1,a1,-268 # 80002140 <_Z4idlePv>
    80002254:	fc840513          	addi	a0,s0,-56
    80002258:	fffff097          	auipc	ra,0xfffff
    8000225c:	1ac080e7          	jalr	428(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002260:	00200493          	li	s1,2
    80002264:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80002268:	fd043503          	ld	a0,-48(s0)
    8000226c:	fffff097          	auipc	ra,0xfffff
    80002270:	274080e7          	jalr	628(ra) # 800014e0 <_Z11thread_joinP3TCB>
        __asm__ volatile("li a0, 0x43");
    80002274:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80002278:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    8000227c:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80002280:	00000513          	li	a0,0
    80002284:	03813083          	ld	ra,56(sp)
    80002288:	03013403          	ld	s0,48(sp)
    8000228c:	02813483          	ld	s1,40(sp)
    80002290:	04010113          	addi	sp,sp,64
    80002294:	00008067          	ret

0000000080002298 <interruptRoutine>:
#include "../test/printing.hpp"

int main();

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80002298:	f9010113          	addi	sp,sp,-112
    8000229c:	06113423          	sd	ra,104(sp)
    800022a0:	06813023          	sd	s0,96(sp)
    800022a4:	04913c23          	sd	s1,88(sp)
    800022a8:	07010413          	addi	s0,sp,112
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800022ac:	14202373          	csrr	t1,scause
    800022b0:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800022b4:	14102373          	csrr	t1,sepc
    800022b8:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800022bc:	10002373          	csrr	t1,sstatus
    800022c0:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4;
    //uint64 a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800022c4:	00050313          	mv	t1,a0
    800022c8:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800022cc:	00058313          	mv	t1,a1
    800022d0:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800022d4:	00060313          	mv	t1,a2
    800022d8:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800022dc:	00068313          	mv	t1,a3
    800022e0:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800022e4:	00070313          	mv	t1,a4
    800022e8:	fa643023          	sd	t1,-96(s0)
//    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");

    if (scause == 0x9 || scause == 0x8) {
    800022ec:	fd843703          	ld	a4,-40(s0)
    800022f0:	00900793          	li	a5,9
    800022f4:	00f70863          	beq	a4,a5,80002304 <interruptRoutine+0x6c>
    800022f8:	fd843703          	ld	a4,-40(s0)
    800022fc:	00800793          	li	a5,8
    80002300:	4cf71263          	bne	a4,a5,800027c4 <interruptRoutine+0x52c>
        //prekid zbog poziva ecall
        switch (a0) {
    80002304:	fc043703          	ld	a4,-64(s0)
    80002308:	08100793          	li	a5,129
    8000230c:	3ee7e863          	bltu	a5,a4,800026fc <interruptRoutine+0x464>
    80002310:	fc043783          	ld	a5,-64(s0)
    80002314:	00279713          	slli	a4,a5,0x2
    80002318:	00008797          	auipc	a5,0x8
    8000231c:	d6478793          	addi	a5,a5,-668 # 8000a07c <CONSOLE_STATUS+0x6c>
    80002320:	00f707b3          	add	a5,a4,a5
    80002324:	0007a783          	lw	a5,0(a5)
    80002328:	0007871b          	sext.w	a4,a5
    8000232c:	00008797          	auipc	a5,0x8
    80002330:	d5078793          	addi	a5,a5,-688 # 8000a07c <CONSOLE_STATUS+0x6c>
    80002334:	00f707b3          	add	a5,a4,a5
    80002338:	00078067          	jr	a5
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                KMemory::kmalloc((size_t)a1);
    8000233c:	fb843503          	ld	a0,-72(s0)
    80002340:	fffff097          	auipc	ra,0xfffff
    80002344:	7d8080e7          	jalr	2008(ra) # 80001b18 <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    80002348:	04a43823          	sd	a0,80(s0)
                break;
    8000234c:	4540006f          	j	800027a0 <interruptRoutine+0x508>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                KMemory::kfree((void*)a1);
    80002350:	fb843783          	ld	a5,-72(s0)
    80002354:	00078513          	mv	a0,a5
    80002358:	00000097          	auipc	ra,0x0
    8000235c:	a00080e7          	jalr	-1536(ra) # 80001d58 <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    80002360:	04a43823          	sd	a0,80(s0)
                break;
    80002364:	43c0006f          	j	800027a0 <interruptRoutine+0x508>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002368:	fb043783          	ld	a5,-80(s0)
    8000236c:	fa843703          	ld	a4,-88(s0)
    80002370:	fa043683          	ld	a3,-96(s0)
    80002374:	fb843483          	ld	s1,-72(s0)
    80002378:	00068613          	mv	a2,a3
    8000237c:	00070593          	mv	a1,a4
    80002380:	00078513          	mv	a0,a5
    80002384:	00001097          	auipc	ra,0x1
    80002388:	fc4080e7          	jalr	-60(ra) # 80003348 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    8000238c:	00050793          	mv	a5,a0
    80002390:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80002394:	fb843783          	ld	a5,-72(s0)
    80002398:	0007b783          	ld	a5,0(a5)
    8000239c:	02078863          	beqz	a5,800023cc <interruptRoutine+0x134>
                    if ((TCB::Body)a2 != (TCB::Body)main) {
    800023a0:	fb043703          	ld	a4,-80(s0)
    800023a4:	0000b797          	auipc	a5,0xb
    800023a8:	b9c7b783          	ld	a5,-1124(a5) # 8000cf40 <_GLOBAL_OFFSET_TABLE_+0x68>
    800023ac:	00f70c63          	beq	a4,a5,800023c4 <interruptRoutine+0x12c>
                        Scheduler::put(*((thread_t*)a1));
    800023b0:	fb843783          	ld	a5,-72(s0)
    800023b4:	0007b783          	ld	a5,0(a5)
    800023b8:	00078513          	mv	a0,a5
    800023bc:	fffff097          	auipc	ra,0xfffff
    800023c0:	5a0080e7          	jalr	1440(ra) # 8000195c <_ZN9Scheduler3putEP3TCB>
                    }
                    __asm__ volatile("li a0, 0");
    800023c4:	00000513          	li	a0,0
    800023c8:	0080006f          	j	800023d0 <interruptRoutine+0x138>
                } else {
                    __asm__ volatile("li a0, -1");
    800023cc:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800023d0:	04a43823          	sd	a0,80(s0)
                break;
    800023d4:	3cc0006f          	j	800027a0 <interruptRoutine+0x508>
            case 0x12:
                //thread_exit
                TCB::getRunning()->setStatus(TCB::FINISHED);
    800023d8:	00000097          	auipc	ra,0x0
    800023dc:	74c080e7          	jalr	1868(ra) # 80002b24 <_ZN3TCB10getRunningEv>
    800023e0:	00050793          	mv	a5,a0
    800023e4:	00500593          	li	a1,5
    800023e8:	00078513          	mv	a0,a5
    800023ec:	00000097          	auipc	ra,0x0
    800023f0:	6e4080e7          	jalr	1764(ra) # 80002ad0 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined(TCB::getRunning());
    800023f4:	00000097          	auipc	ra,0x0
    800023f8:	730080e7          	jalr	1840(ra) # 80002b24 <_ZN3TCB10getRunningEv>
    800023fc:	00050793          	mv	a5,a0
    80002400:	00078513          	mv	a0,a5
    80002404:	00001097          	auipc	ra,0x1
    80002408:	078080e7          	jalr	120(ra) # 8000347c <_ZN3TCB13releaseJoinedEPS_>
                __asm__ volatile("li a0, 0");
    8000240c:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 80(s0)");
    80002410:	04a43823          	sd	a0,80(s0)
                TCB::dispatch();
    80002414:	00001097          	auipc	ra,0x1
    80002418:	e38080e7          	jalr	-456(ra) # 8000324c <_ZN3TCB8dispatchEv>
                break;
    8000241c:	3840006f          	j	800027a0 <interruptRoutine+0x508>
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
    80002420:	00001097          	auipc	ra,0x1
    80002424:	e2c080e7          	jalr	-468(ra) # 8000324c <_ZN3TCB8dispatchEv>
                break;
    80002428:	3780006f          	j	800027a0 <interruptRoutine+0x508>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    8000242c:	fb843783          	ld	a5,-72(s0)
    80002430:	00078513          	mv	a0,a5
    80002434:	00001097          	auipc	ra,0x1
    80002438:	ff8080e7          	jalr	-8(ra) # 8000342c <_ZN3TCB10threadJoinEPS_>
                TCB::dispatch();
    8000243c:	00001097          	auipc	ra,0x1
    80002440:	e10080e7          	jalr	-496(ra) # 8000324c <_ZN3TCB8dispatchEv>
                break;
    80002444:	35c0006f          	j	800027a0 <interruptRoutine+0x508>
            case 0x15:
                //destruktor klase Thread, brise nit ciji je handle prosledjen
                //a1 = rucka niti koja se brise
                if(TCB::getRunning()==(thread_t)a1){
    80002448:	00000097          	auipc	ra,0x0
    8000244c:	6dc080e7          	jalr	1756(ra) # 80002b24 <_ZN3TCB10getRunningEv>
    80002450:	00050713          	mv	a4,a0
    80002454:	fb843783          	ld	a5,-72(s0)
    80002458:	40f707b3          	sub	a5,a4,a5
    8000245c:	0017b793          	seqz	a5,a5
    80002460:	0ff7f793          	andi	a5,a5,255
    80002464:	04078263          	beqz	a5,800024a8 <interruptRoutine+0x210>
                    TCB::getRunning()->setStatus(TCB::FINISHED);
    80002468:	00000097          	auipc	ra,0x0
    8000246c:	6bc080e7          	jalr	1724(ra) # 80002b24 <_ZN3TCB10getRunningEv>
    80002470:	00050793          	mv	a5,a0
    80002474:	00500593          	li	a1,5
    80002478:	00078513          	mv	a0,a5
    8000247c:	00000097          	auipc	ra,0x0
    80002480:	654080e7          	jalr	1620(ra) # 80002ad0 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                    TCB::releaseJoined(TCB::getRunning());
    80002484:	00000097          	auipc	ra,0x0
    80002488:	6a0080e7          	jalr	1696(ra) # 80002b24 <_ZN3TCB10getRunningEv>
    8000248c:	00050793          	mv	a5,a0
    80002490:	00078513          	mv	a0,a5
    80002494:	00001097          	auipc	ra,0x1
    80002498:	fe8080e7          	jalr	-24(ra) # 8000347c <_ZN3TCB13releaseJoinedEPS_>
                    TCB::dispatch();
    8000249c:	00001097          	auipc	ra,0x1
    800024a0:	db0080e7          	jalr	-592(ra) # 8000324c <_ZN3TCB8dispatchEv>
                }
                else{
                    TCB::quitThread((thread_t)a1);
                    TCB::releaseJoined((thread_t)a1);
                }
                break;
    800024a4:	2fc0006f          	j	800027a0 <interruptRoutine+0x508>
                    TCB::quitThread((thread_t)a1);
    800024a8:	fb843783          	ld	a5,-72(s0)
    800024ac:	00078513          	mv	a0,a5
    800024b0:	00001097          	auipc	ra,0x1
    800024b4:	018080e7          	jalr	24(ra) # 800034c8 <_ZN3TCB10quitThreadEPS_>
                    TCB::releaseJoined((thread_t)a1);
    800024b8:	fb843783          	ld	a5,-72(s0)
    800024bc:	00078513          	mv	a0,a5
    800024c0:	00001097          	auipc	ra,0x1
    800024c4:	fbc080e7          	jalr	-68(ra) # 8000347c <_ZN3TCB13releaseJoinedEPS_>
                break;
    800024c8:	2d80006f          	j	800027a0 <interruptRoutine+0x508>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    800024cc:	fb043783          	ld	a5,-80(s0)
    800024d0:	0007879b          	sext.w	a5,a5
    800024d4:	fb843483          	ld	s1,-72(s0)
    800024d8:	00078513          	mv	a0,a5
    800024dc:	00001097          	auipc	ra,0x1
    800024e0:	1b0080e7          	jalr	432(ra) # 8000368c <_ZN4KSem7initSemEj>
    800024e4:	00050793          	mv	a5,a0
    800024e8:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    800024ec:	fb843783          	ld	a5,-72(s0)
    800024f0:	0007b783          	ld	a5,0(a5)
    800024f4:	00078663          	beqz	a5,80002500 <interruptRoutine+0x268>
                    __asm__ volatile("li a0, 0");
    800024f8:	00000513          	li	a0,0
    800024fc:	0080006f          	j	80002504 <interruptRoutine+0x26c>
                } else {
                    __asm__ volatile("li a0, -1");
    80002500:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002504:	04a43823          	sd	a0,80(s0)
                break;
    80002508:	2980006f          	j	800027a0 <interruptRoutine+0x508>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    8000250c:	fb843783          	ld	a5,-72(s0)
    80002510:	00078513          	mv	a0,a5
    80002514:	00001097          	auipc	ra,0x1
    80002518:	2c4080e7          	jalr	708(ra) # 800037d8 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    8000251c:	04a43823          	sd	a0,80(s0)
                delete (sem_t)a1;
    80002520:	fb843483          	ld	s1,-72(s0)
    80002524:	26048063          	beqz	s1,80002784 <interruptRoutine+0x4ec>
    80002528:	00048513          	mv	a0,s1
    8000252c:	00000097          	auipc	ra,0x0
    80002530:	458080e7          	jalr	1112(ra) # 80002984 <_ZN4KSemD1Ev>
    80002534:	00048513          	mv	a0,s1
    80002538:	00001097          	auipc	ra,0x1
    8000253c:	12c080e7          	jalr	300(ra) # 80003664 <_ZN4KSemdlEPv>
                break;
    80002540:	2440006f          	j	80002784 <interruptRoutine+0x4ec>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80002544:	fb843783          	ld	a5,-72(s0)
    80002548:	00078513          	mv	a0,a5
    8000254c:	00001097          	auipc	ra,0x1
    80002550:	1cc080e7          	jalr	460(ra) # 80003718 <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002554:	04a43823          	sd	a0,80(s0)
                break;
    80002558:	2480006f          	j	800027a0 <interruptRoutine+0x508>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    8000255c:	fb843783          	ld	a5,-72(s0)
    80002560:	00078513          	mv	a0,a5
    80002564:	00001097          	auipc	ra,0x1
    80002568:	230080e7          	jalr	560(ra) # 80003794 <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    8000256c:	04a43823          	sd	a0,80(s0)
                break;
    80002570:	2300006f          	j	800027a0 <interruptRoutine+0x508>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    80002574:	fb843783          	ld	a5,-72(s0)
    80002578:	00078663          	beqz	a5,80002584 <interruptRoutine+0x2ec>
                    __asm__ volatile("li a0, 0");
    8000257c:	00000513          	li	a0,0
    80002580:	0080006f          	j	80002588 <interruptRoutine+0x2f0>
                } else {
                    __asm__ volatile("li a0, -1");
    80002584:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002588:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    8000258c:	fb843783          	ld	a5,-72(s0)
    80002590:	1e078e63          	beqz	a5,8000278c <interruptRoutine+0x4f4>
                    Scheduler::putToSleep(TCB::getRunning(), (time_t)a1);
    80002594:	00000097          	auipc	ra,0x0
    80002598:	590080e7          	jalr	1424(ra) # 80002b24 <_ZN3TCB10getRunningEv>
    8000259c:	00050793          	mv	a5,a0
    800025a0:	fb843583          	ld	a1,-72(s0)
    800025a4:	00078513          	mv	a0,a5
    800025a8:	fffff097          	auipc	ra,0xfffff
    800025ac:	440080e7          	jalr	1088(ra) # 800019e8 <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::dispatch();
    800025b0:	00001097          	auipc	ra,0x1
    800025b4:	c9c080e7          	jalr	-868(ra) # 8000324c <_ZN3TCB8dispatchEv>
                }
                break;
    800025b8:	1d40006f          	j	8000278c <interruptRoutine+0x4f4>
            case 0x41:
                //getc
                KConsole::kgetc();
    800025bc:	fffff097          	auipc	ra,0xfffff
    800025c0:	33c080e7          	jalr	828(ra) # 800018f8 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    800025c4:	04a43823          	sd	a0,80(s0)
                break;
    800025c8:	1d80006f          	j	800027a0 <interruptRoutine+0x508>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    800025cc:	fb843783          	ld	a5,-72(s0)
    800025d0:	0ff7f793          	andi	a5,a5,255
    800025d4:	00078513          	mv	a0,a5
    800025d8:	fffff097          	auipc	ra,0xfffff
    800025dc:	2b0080e7          	jalr	688(ra) # 80001888 <_ZN8KConsole5kputcEc>
                break;
    800025e0:	1c00006f          	j	800027a0 <interruptRoutine+0x508>
            case 0x43:
                //flush izlaznog bafera konzole
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    800025e4:	00000097          	auipc	ra,0x0
    800025e8:	4a4080e7          	jalr	1188(ra) # 80002a88 <_ZN8KConsole13getOutputHeadEv>
    800025ec:	00050793          	mv	a5,a0
    800025f0:	00078493          	mv	s1,a5
    800025f4:	00000097          	auipc	ra,0x0
    800025f8:	4b8080e7          	jalr	1208(ra) # 80002aac <_ZN8KConsole13getOutputTailEv>
    800025fc:	00050793          	mv	a5,a0
    80002600:	00048713          	mv	a4,s1
    80002604:	40f707b3          	sub	a5,a4,a5
    80002608:	00f037b3          	snez	a5,a5
    8000260c:	0ff7f793          	andi	a5,a5,255
    80002610:	18078263          	beqz	a5,80002794 <interruptRoutine+0x4fc>
                    char c = KConsole::getFromOutput();
    80002614:	fffff097          	auipc	ra,0xfffff
    80002618:	1b0080e7          	jalr	432(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    8000261c:	00050793          	mv	a5,a0
    80002620:	f8f40ba3          	sb	a5,-105(s0)
                    while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80002624:	00000097          	auipc	ra,0x0
    80002628:	3c8080e7          	jalr	968(ra) # 800029ec <_ZN8KConsole10getSRvalueEv>
    8000262c:	00050793          	mv	a5,a0
    80002630:	0207f793          	andi	a5,a5,32
    80002634:	0017b793          	seqz	a5,a5
    80002638:	0ff7f793          	andi	a5,a5,255
    8000263c:	00078463          	beqz	a5,80002644 <interruptRoutine+0x3ac>
    80002640:	fe5ff06f          	j	80002624 <interruptRoutine+0x38c>
                    KConsole::setDRvalue(c);
    80002644:	f9744783          	lbu	a5,-105(s0)
    80002648:	00078513          	mv	a0,a5
    8000264c:	00000097          	auipc	ra,0x0
    80002650:	3f0080e7          	jalr	1008(ra) # 80002a3c <_ZN8KConsole10setDRvalueEc>
                    sem_signal(KConsole::getOutputBufferHasSpace());
    80002654:	00000097          	auipc	ra,0x0
    80002658:	410080e7          	jalr	1040(ra) # 80002a64 <_ZN8KConsole23getOutputBufferHasSpaceEv>
    8000265c:	00050793          	mv	a5,a0
    80002660:	00078513          	mv	a0,a5
    80002664:	fffff097          	auipc	ra,0xfffff
    80002668:	f6c080e7          	jalr	-148(ra) # 800015d0 <_Z10sem_signalP4KSem>
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    8000266c:	f79ff06f          	j	800025e4 <interruptRoutine+0x34c>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002670:	fb043783          	ld	a5,-80(s0)
    80002674:	fa843703          	ld	a4,-88(s0)
    80002678:	fa043683          	ld	a3,-96(s0)
    8000267c:	fb843483          	ld	s1,-72(s0)
    80002680:	00068613          	mv	a2,a3
    80002684:	00070593          	mv	a1,a4
    80002688:	00078513          	mv	a0,a5
    8000268c:	00001097          	auipc	ra,0x1
    80002690:	cbc080e7          	jalr	-836(ra) # 80003348 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002694:	00050793          	mv	a5,a0
    80002698:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    8000269c:	fb843783          	ld	a5,-72(s0)
    800026a0:	0007b783          	ld	a5,0(a5)
    800026a4:	00078663          	beqz	a5,800026b0 <interruptRoutine+0x418>
                    __asm__ volatile("li a0, 0");
    800026a8:	00000513          	li	a0,0
    800026ac:	0080006f          	j	800026b4 <interruptRoutine+0x41c>
                } else {
                    __asm__ volatile("li a0, -1");
    800026b0:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800026b4:	04a43823          	sd	a0,80(s0)
                break;
    800026b8:	0e80006f          	j	800027a0 <interruptRoutine+0x508>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                if (((thread_t)a1)->getBody() != (TCB::Body)main) {
    800026bc:	fb843783          	ld	a5,-72(s0)
    800026c0:	00078513          	mv	a0,a5
    800026c4:	00000097          	auipc	ra,0x0
    800026c8:	444080e7          	jalr	1092(ra) # 80002b08 <_ZN3TCB7getBodyEv>
    800026cc:	00050713          	mv	a4,a0
    800026d0:	0000b797          	auipc	a5,0xb
    800026d4:	8707b783          	ld	a5,-1936(a5) # 8000cf40 <_GLOBAL_OFFSET_TABLE_+0x68>
    800026d8:	40f707b3          	sub	a5,a4,a5
    800026dc:	00f037b3          	snez	a5,a5
    800026e0:	0ff7f793          	andi	a5,a5,255
    800026e4:	0a078c63          	beqz	a5,8000279c <interruptRoutine+0x504>
                    Scheduler::put((thread_t)a1);
    800026e8:	fb843783          	ld	a5,-72(s0)
    800026ec:	00078513          	mv	a0,a5
    800026f0:	fffff097          	auipc	ra,0xfffff
    800026f4:	26c080e7          	jalr	620(ra) # 8000195c <_ZN9Scheduler3putEP3TCB>
                }
                break;
    800026f8:	0a40006f          	j	8000279c <interruptRoutine+0x504>
            default:
                printString("\nNepostojeci op code: ");
    800026fc:	00008517          	auipc	a0,0x8
    80002700:	92450513          	addi	a0,a0,-1756 # 8000a020 <CONSOLE_STATUS+0x10>
    80002704:	00004097          	auipc	ra,0x4
    80002708:	908080e7          	jalr	-1784(ra) # 8000600c <_Z11printStringPKc>
                printInt(a0);
    8000270c:	fc043783          	ld	a5,-64(s0)
    80002710:	0007879b          	sext.w	a5,a5
    80002714:	00000613          	li	a2,0
    80002718:	00a00593          	li	a1,10
    8000271c:	00078513          	mv	a0,a5
    80002720:	00004097          	auipc	ra,0x4
    80002724:	a9c080e7          	jalr	-1380(ra) # 800061bc <_Z8printIntiii>
                printString("\nscause: ");
    80002728:	00008517          	auipc	a0,0x8
    8000272c:	91050513          	addi	a0,a0,-1776 # 8000a038 <CONSOLE_STATUS+0x28>
    80002730:	00004097          	auipc	ra,0x4
    80002734:	8dc080e7          	jalr	-1828(ra) # 8000600c <_Z11printStringPKc>
                printInt(scause);
    80002738:	fd843783          	ld	a5,-40(s0)
    8000273c:	0007879b          	sext.w	a5,a5
    80002740:	00000613          	li	a2,0
    80002744:	00a00593          	li	a1,10
    80002748:	00078513          	mv	a0,a5
    8000274c:	00004097          	auipc	ra,0x4
    80002750:	a70080e7          	jalr	-1424(ra) # 800061bc <_Z8printIntiii>
                printString("\nsepc: ");
    80002754:	00008517          	auipc	a0,0x8
    80002758:	8f450513          	addi	a0,a0,-1804 # 8000a048 <CONSOLE_STATUS+0x38>
    8000275c:	00004097          	auipc	ra,0x4
    80002760:	8b0080e7          	jalr	-1872(ra) # 8000600c <_Z11printStringPKc>
                printInt(sepc);
    80002764:	fd043783          	ld	a5,-48(s0)
    80002768:	0007879b          	sext.w	a5,a5
    8000276c:	00000613          	li	a2,0
    80002770:	00a00593          	li	a1,10
    80002774:	00078513          	mv	a0,a5
    80002778:	00004097          	auipc	ra,0x4
    8000277c:	a44080e7          	jalr	-1468(ra) # 800061bc <_Z8printIntiii>
                break;
    80002780:	0200006f          	j	800027a0 <interruptRoutine+0x508>
                break;
    80002784:	00000013          	nop
    80002788:	0180006f          	j	800027a0 <interruptRoutine+0x508>
                break;
    8000278c:	00000013          	nop
    80002790:	0100006f          	j	800027a0 <interruptRoutine+0x508>
                break;
    80002794:	00000013          	nop
    80002798:	0080006f          	j	800027a0 <interruptRoutine+0x508>
                break;
    8000279c:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    800027a0:	fd043783          	ld	a5,-48(s0)
    800027a4:	00478793          	addi	a5,a5,4
    800027a8:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800027ac:	fd043783          	ld	a5,-48(s0)
    800027b0:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800027b4:	fc843783          	ld	a5,-56(s0)
    800027b8:	10079073          	csrw	sstatus,a5
    800027bc:	00000013          	nop
        printString("\nsepc: ");
        printInt(sepc);
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    }
    800027c0:	1ac0006f          	j	8000296c <interruptRoutine+0x6d4>
    } else if (scause == 0x8000000000000009) {
    800027c4:	fd843703          	ld	a4,-40(s0)
    800027c8:	fff00793          	li	a5,-1
    800027cc:	03f79793          	slli	a5,a5,0x3f
    800027d0:	00978793          	addi	a5,a5,9
    800027d4:	08f71463          	bne	a4,a5,8000285c <interruptRoutine+0x5c4>
        uint64 irq = plic_claim();
    800027d8:	00006097          	auipc	ra,0x6
    800027dc:	87c080e7          	jalr	-1924(ra) # 80008054 <plic_claim>
    800027e0:	00050793          	mv	a5,a0
    800027e4:	f8f43c23          	sd	a5,-104(s0)
        if (irq == CONSOLE_IRQ) {
    800027e8:	f9843703          	ld	a4,-104(s0)
    800027ec:	00a00793          	li	a5,10
    800027f0:	02f71c63          	bne	a4,a5,80002828 <interruptRoutine+0x590>
            if (KConsole::getSRvalue() & CONSOLE_RX_STATUS_BIT) {
    800027f4:	00000097          	auipc	ra,0x0
    800027f8:	1f8080e7          	jalr	504(ra) # 800029ec <_ZN8KConsole10getSRvalueEv>
    800027fc:	00050793          	mv	a5,a0
    80002800:	0017f793          	andi	a5,a5,1
    80002804:	00f037b3          	snez	a5,a5
    80002808:	0ff7f793          	andi	a5,a5,255
    8000280c:	00078e63          	beqz	a5,80002828 <interruptRoutine+0x590>
                KConsole::placeInInput(KConsole::getDRvalue());
    80002810:	00000097          	auipc	ra,0x0
    80002814:	204080e7          	jalr	516(ra) # 80002a14 <_ZN8KConsole10getDRvalueEv>
    80002818:	00050793          	mv	a5,a0
    8000281c:	00078513          	mv	a0,a5
    80002820:	fffff097          	auipc	ra,0xfffff
    80002824:	ffc080e7          	jalr	-4(ra) # 8000181c <_ZN8KConsole12placeInInputEc>
        plic_complete(irq);
    80002828:	f9843783          	ld	a5,-104(s0)
    8000282c:	0007879b          	sext.w	a5,a5
    80002830:	00078513          	mv	a0,a5
    80002834:	00006097          	auipc	ra,0x6
    80002838:	858080e7          	jalr	-1960(ra) # 8000808c <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    8000283c:	fd043783          	ld	a5,-48(s0)
    80002840:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002844:	fc843783          	ld	a5,-56(s0)
    80002848:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    8000284c:	20000513          	li	a0,512
    80002850:	00000097          	auipc	ra,0x0
    80002854:	180080e7          	jalr	384(ra) # 800029d0 <_ZN5Riscv6mc_sipEm>
    80002858:	1140006f          	j	8000296c <interruptRoutine+0x6d4>
    } else if (scause == 0x8000000000000001) {
    8000285c:	fd843703          	ld	a4,-40(s0)
    80002860:	fff00793          	li	a5,-1
    80002864:	03f79793          	slli	a5,a5,0x3f
    80002868:	00178793          	addi	a5,a5,1
    8000286c:	08f71463          	bne	a4,a5,800028f4 <interruptRoutine+0x65c>
        Scheduler::wake();
    80002870:	fffff097          	auipc	ra,0xfffff
    80002874:	228080e7          	jalr	552(ra) # 80001a98 <_ZN9Scheduler4wakeEv>
        TCB::getRunningTimeSlice()++;
    80002878:	00000097          	auipc	ra,0x0
    8000287c:	2d0080e7          	jalr	720(ra) # 80002b48 <_ZN3TCB19getRunningTimeSliceEv>
    80002880:	00050793          	mv	a5,a0
    80002884:	0007b703          	ld	a4,0(a5)
    80002888:	00170713          	addi	a4,a4,1
    8000288c:	00e7b023          	sd	a4,0(a5)
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
    80002890:	00000097          	auipc	ra,0x0
    80002894:	2b8080e7          	jalr	696(ra) # 80002b48 <_ZN3TCB19getRunningTimeSliceEv>
    80002898:	00050793          	mv	a5,a0
    8000289c:	0007b483          	ld	s1,0(a5)
    800028a0:	00000097          	auipc	ra,0x0
    800028a4:	284080e7          	jalr	644(ra) # 80002b24 <_ZN3TCB10getRunningEv>
    800028a8:	00050793          	mv	a5,a0
    800028ac:	00078513          	mv	a0,a5
    800028b0:	00000097          	auipc	ra,0x0
    800028b4:	23c080e7          	jalr	572(ra) # 80002aec <_ZN3TCB12getTimeSliceEv>
    800028b8:	00050793          	mv	a5,a0
    800028bc:	00f4b7b3          	sltu	a5,s1,a5
    800028c0:	0017c793          	xori	a5,a5,1
    800028c4:	0ff7f793          	andi	a5,a5,255
    800028c8:	00078663          	beqz	a5,800028d4 <interruptRoutine+0x63c>
            TCB::dispatch();
    800028cc:	00001097          	auipc	ra,0x1
    800028d0:	980080e7          	jalr	-1664(ra) # 8000324c <_ZN3TCB8dispatchEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800028d4:	fd043783          	ld	a5,-48(s0)
    800028d8:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800028dc:	fc843783          	ld	a5,-56(s0)
    800028e0:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    800028e4:	00200513          	li	a0,2
    800028e8:	00000097          	auipc	ra,0x0
    800028ec:	0e8080e7          	jalr	232(ra) # 800029d0 <_ZN5Riscv6mc_sipEm>
    800028f0:	07c0006f          	j	8000296c <interruptRoutine+0x6d4>
        printString("\nGreska u prekidnoj rutini\n");
    800028f4:	00007517          	auipc	a0,0x7
    800028f8:	75c50513          	addi	a0,a0,1884 # 8000a050 <CONSOLE_STATUS+0x40>
    800028fc:	00003097          	auipc	ra,0x3
    80002900:	710080e7          	jalr	1808(ra) # 8000600c <_Z11printStringPKc>
        printString("scause: ");
    80002904:	00007517          	auipc	a0,0x7
    80002908:	76c50513          	addi	a0,a0,1900 # 8000a070 <CONSOLE_STATUS+0x60>
    8000290c:	00003097          	auipc	ra,0x3
    80002910:	700080e7          	jalr	1792(ra) # 8000600c <_Z11printStringPKc>
        printInt(scause);
    80002914:	fd843783          	ld	a5,-40(s0)
    80002918:	0007879b          	sext.w	a5,a5
    8000291c:	00000613          	li	a2,0
    80002920:	00a00593          	li	a1,10
    80002924:	00078513          	mv	a0,a5
    80002928:	00004097          	auipc	ra,0x4
    8000292c:	894080e7          	jalr	-1900(ra) # 800061bc <_Z8printIntiii>
        printString("\nsepc: ");
    80002930:	00007517          	auipc	a0,0x7
    80002934:	71850513          	addi	a0,a0,1816 # 8000a048 <CONSOLE_STATUS+0x38>
    80002938:	00003097          	auipc	ra,0x3
    8000293c:	6d4080e7          	jalr	1748(ra) # 8000600c <_Z11printStringPKc>
        printInt(sepc);
    80002940:	fd043783          	ld	a5,-48(s0)
    80002944:	0007879b          	sext.w	a5,a5
    80002948:	00000613          	li	a2,0
    8000294c:	00a00593          	li	a1,10
    80002950:	00078513          	mv	a0,a5
    80002954:	00004097          	auipc	ra,0x4
    80002958:	868080e7          	jalr	-1944(ra) # 800061bc <_Z8printIntiii>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    8000295c:	fd043783          	ld	a5,-48(s0)
    80002960:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002964:	fc843783          	ld	a5,-56(s0)
    80002968:	10079073          	csrw	sstatus,a5
    8000296c:	00000013          	nop
    80002970:	06813083          	ld	ra,104(sp)
    80002974:	06013403          	ld	s0,96(sp)
    80002978:	05813483          	ld	s1,88(sp)
    8000297c:	07010113          	addi	sp,sp,112
    80002980:	00008067          	ret

0000000080002984 <_ZN4KSemD1Ev>:
#define PROJEKAT2023_KSEM_HPP

#include "../h/ThreadQueue.hpp"

//klasa napravljena po uzoru na semafor u skolskom jezgru
class KSem {
    80002984:	fe010113          	addi	sp,sp,-32
    80002988:	00113c23          	sd	ra,24(sp)
    8000298c:	00813823          	sd	s0,16(sp)
    80002990:	00913423          	sd	s1,8(sp)
    80002994:	02010413          	addi	s0,sp,32
    80002998:	00050493          	mv	s1,a0
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    8000299c:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    800029a0:	00050e63          	beqz	a0,800029bc <_ZN4KSemD1Ev+0x38>
            front = front->next;
    800029a4:	00853783          	ld	a5,8(a0)
    800029a8:	00f4b423          	sd	a5,8(s1)
            delete node;
    800029ac:	fe0508e3          	beqz	a0,8000299c <_ZN4KSemD1Ev+0x18>
            mem_free(ptr);
    800029b0:	fffff097          	auipc	ra,0xfffff
    800029b4:	a24080e7          	jalr	-1500(ra) # 800013d4 <_Z8mem_freePv>
        }
    800029b8:	fe5ff06f          	j	8000299c <_ZN4KSemD1Ev+0x18>
    800029bc:	01813083          	ld	ra,24(sp)
    800029c0:	01013403          	ld	s0,16(sp)
    800029c4:	00813483          	ld	s1,8(sp)
    800029c8:	02010113          	addi	sp,sp,32
    800029cc:	00008067          	ret

00000000800029d0 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    800029d0:	ff010113          	addi	sp,sp,-16
    800029d4:	00813423          	sd	s0,8(sp)
    800029d8:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    800029dc:	14453073          	csrc	sip,a0
}
    800029e0:	00813403          	ld	s0,8(sp)
    800029e4:	01010113          	addi	sp,sp,16
    800029e8:	00008067          	ret

00000000800029ec <_ZN8KConsole10getSRvalueEv>:
    static uint8 getSRvalue() { return *sr; }
    800029ec:	ff010113          	addi	sp,sp,-16
    800029f0:	00813423          	sd	s0,8(sp)
    800029f4:	01010413          	addi	s0,sp,16
    800029f8:	0000a797          	auipc	a5,0xa
    800029fc:	5887b783          	ld	a5,1416(a5) # 8000cf80 <_GLOBAL_OFFSET_TABLE_+0xa8>
    80002a00:	0007b783          	ld	a5,0(a5)
    80002a04:	0007c503          	lbu	a0,0(a5)
    80002a08:	00813403          	ld	s0,8(sp)
    80002a0c:	01010113          	addi	sp,sp,16
    80002a10:	00008067          	ret

0000000080002a14 <_ZN8KConsole10getDRvalueEv>:
    static uint8 getDRvalue() { return *dr; }
    80002a14:	ff010113          	addi	sp,sp,-16
    80002a18:	00813423          	sd	s0,8(sp)
    80002a1c:	01010413          	addi	s0,sp,16
    80002a20:	0000a797          	auipc	a5,0xa
    80002a24:	5187b783          	ld	a5,1304(a5) # 8000cf38 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002a28:	0007b783          	ld	a5,0(a5)
    80002a2c:	0007c503          	lbu	a0,0(a5)
    80002a30:	00813403          	ld	s0,8(sp)
    80002a34:	01010113          	addi	sp,sp,16
    80002a38:	00008067          	ret

0000000080002a3c <_ZN8KConsole10setDRvalueEc>:
    static void setDRvalue(char c) { *dr = c; }
    80002a3c:	ff010113          	addi	sp,sp,-16
    80002a40:	00813423          	sd	s0,8(sp)
    80002a44:	01010413          	addi	s0,sp,16
    80002a48:	0000a797          	auipc	a5,0xa
    80002a4c:	4f07b783          	ld	a5,1264(a5) # 8000cf38 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002a50:	0007b783          	ld	a5,0(a5)
    80002a54:	00a78023          	sb	a0,0(a5)
    80002a58:	00813403          	ld	s0,8(sp)
    80002a5c:	01010113          	addi	sp,sp,16
    80002a60:	00008067          	ret

0000000080002a64 <_ZN8KConsole23getOutputBufferHasSpaceEv>:

    static sem_t getOutputBufferHasSpace() { return outputBufferHasSpace; }
    80002a64:	ff010113          	addi	sp,sp,-16
    80002a68:	00813423          	sd	s0,8(sp)
    80002a6c:	01010413          	addi	s0,sp,16
    80002a70:	0000a797          	auipc	a5,0xa
    80002a74:	4d87b783          	ld	a5,1240(a5) # 8000cf48 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002a78:	0007b503          	ld	a0,0(a5)
    80002a7c:	00813403          	ld	s0,8(sp)
    80002a80:	01010113          	addi	sp,sp,16
    80002a84:	00008067          	ret

0000000080002a88 <_ZN8KConsole13getOutputHeadEv>:

    static int getOutputHead() { return outputHead; }
    80002a88:	ff010113          	addi	sp,sp,-16
    80002a8c:	00813423          	sd	s0,8(sp)
    80002a90:	01010413          	addi	s0,sp,16
    80002a94:	0000a797          	auipc	a5,0xa
    80002a98:	4947b783          	ld	a5,1172(a5) # 8000cf28 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002a9c:	0007a503          	lw	a0,0(a5)
    80002aa0:	00813403          	ld	s0,8(sp)
    80002aa4:	01010113          	addi	sp,sp,16
    80002aa8:	00008067          	ret

0000000080002aac <_ZN8KConsole13getOutputTailEv>:

    static int getOutputTail() { return outputTail; }
    80002aac:	ff010113          	addi	sp,sp,-16
    80002ab0:	00813423          	sd	s0,8(sp)
    80002ab4:	01010413          	addi	s0,sp,16
    80002ab8:	0000a797          	auipc	a5,0xa
    80002abc:	4c07b783          	ld	a5,1216(a5) # 8000cf78 <_GLOBAL_OFFSET_TABLE_+0xa0>
    80002ac0:	0007a503          	lw	a0,0(a5)
    80002ac4:	00813403          	ld	s0,8(sp)
    80002ac8:	01010113          	addi	sp,sp,16
    80002acc:	00008067          	ret

0000000080002ad0 <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    80002ad0:	ff010113          	addi	sp,sp,-16
    80002ad4:	00813423          	sd	s0,8(sp)
    80002ad8:	01010413          	addi	s0,sp,16
    80002adc:	04b52c23          	sw	a1,88(a0)
    80002ae0:	00813403          	ld	s0,8(sp)
    80002ae4:	01010113          	addi	sp,sp,16
    80002ae8:	00008067          	ret

0000000080002aec <_ZN3TCB12getTimeSliceEv>:
    uint64 getTimeSlice() { return timeSlice; }
    80002aec:	ff010113          	addi	sp,sp,-16
    80002af0:	00813423          	sd	s0,8(sp)
    80002af4:	01010413          	addi	s0,sp,16
    80002af8:	02853503          	ld	a0,40(a0)
    80002afc:	00813403          	ld	s0,8(sp)
    80002b00:	01010113          	addi	sp,sp,16
    80002b04:	00008067          	ret

0000000080002b08 <_ZN3TCB7getBodyEv>:
    Body getBody() { return threadFunction; }
    80002b08:	ff010113          	addi	sp,sp,-16
    80002b0c:	00813423          	sd	s0,8(sp)
    80002b10:	01010413          	addi	s0,sp,16
    80002b14:	01053503          	ld	a0,16(a0)
    80002b18:	00813403          	ld	s0,8(sp)
    80002b1c:	01010113          	addi	sp,sp,16
    80002b20:	00008067          	ret

0000000080002b24 <_ZN3TCB10getRunningEv>:
    static TCB* getRunning() { return running; }
    80002b24:	ff010113          	addi	sp,sp,-16
    80002b28:	00813423          	sd	s0,8(sp)
    80002b2c:	01010413          	addi	s0,sp,16
    80002b30:	0000a797          	auipc	a5,0xa
    80002b34:	4207b783          	ld	a5,1056(a5) # 8000cf50 <_GLOBAL_OFFSET_TABLE_+0x78>
    80002b38:	0007b503          	ld	a0,0(a5)
    80002b3c:	00813403          	ld	s0,8(sp)
    80002b40:	01010113          	addi	sp,sp,16
    80002b44:	00008067          	ret

0000000080002b48 <_ZN3TCB19getRunningTimeSliceEv>:

    static uint64 &getRunningTimeSlice() { return runningTimeSlice; }
    80002b48:	ff010113          	addi	sp,sp,-16
    80002b4c:	00813423          	sd	s0,8(sp)
    80002b50:	01010413          	addi	s0,sp,16
    80002b54:	0000a517          	auipc	a0,0xa
    80002b58:	39c53503          	ld	a0,924(a0) # 8000cef0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002b5c:	00813403          	ld	s0,8(sp)
    80002b60:	01010113          	addi	sp,sp,16
    80002b64:	00008067          	ret

0000000080002b68 <_ZN6Thread7wrapperEPv>:

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
    80002b68:	02050863          	beqz	a0,80002b98 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80002b6c:	ff010113          	addi	sp,sp,-16
    80002b70:	00113423          	sd	ra,8(sp)
    80002b74:	00813023          	sd	s0,0(sp)
    80002b78:	01010413          	addi	s0,sp,16
        ((Thread*)thread)->run();
    80002b7c:	00053783          	ld	a5,0(a0)
    80002b80:	0107b783          	ld	a5,16(a5)
    80002b84:	000780e7          	jalr	a5
    }
}
    80002b88:	00813083          	ld	ra,8(sp)
    80002b8c:	00013403          	ld	s0,0(sp)
    80002b90:	01010113          	addi	sp,sp,16
    80002b94:	00008067          	ret
    80002b98:	00008067          	ret

0000000080002b9c <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80002b9c:	fe010113          	addi	sp,sp,-32
    80002ba0:	00113c23          	sd	ra,24(sp)
    80002ba4:	00813823          	sd	s0,16(sp)
    80002ba8:	00913423          	sd	s1,8(sp)
    80002bac:	01213023          	sd	s2,0(sp)
    80002bb0:	02010413          	addi	s0,sp,32
    80002bb4:	00050913          	mv	s2,a0
    80002bb8:	0000a797          	auipc	a5,0xa
    80002bbc:	0e078793          	addi	a5,a5,224 # 8000cc98 <_ZTV6Thread+0x10>
    80002bc0:	00f53023          	sd	a5,0(a0)
    thread_join(this->myHandle);
    80002bc4:	00853503          	ld	a0,8(a0)
    80002bc8:	fffff097          	auipc	ra,0xfffff
    80002bcc:	918080e7          	jalr	-1768(ra) # 800014e0 <_Z11thread_joinP3TCB>
    delete myHandle;
    80002bd0:	00893483          	ld	s1,8(s2)
    80002bd4:	02048863          	beqz	s1,80002c04 <_ZN6ThreadD1Ev+0x68>
        return front == nullptr;
    80002bd8:	0484b503          	ld	a0,72(s1)
        while (!isEmpty()) {
    80002bdc:	00050e63          	beqz	a0,80002bf8 <_ZN6ThreadD1Ev+0x5c>
            front = front->next;
    80002be0:	00853783          	ld	a5,8(a0)
    80002be4:	04f4b423          	sd	a5,72(s1)
            delete node;
    80002be8:	fe0508e3          	beqz	a0,80002bd8 <_ZN6ThreadD1Ev+0x3c>
            mem_free(ptr);
    80002bec:	ffffe097          	auipc	ra,0xffffe
    80002bf0:	7e8080e7          	jalr	2024(ra) # 800013d4 <_Z8mem_freePv>
        }
    80002bf4:	fe5ff06f          	j	80002bd8 <_ZN6ThreadD1Ev+0x3c>
    80002bf8:	00048513          	mv	a0,s1
    80002bfc:	00001097          	auipc	ra,0x1
    80002c00:	808080e7          	jalr	-2040(ra) # 80003404 <_ZN3TCBdlEPv>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002c04:	00893303          	ld	t1,8(s2)
    80002c08:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x15");
    80002c0c:	01500513          	li	a0,21
    __asm__ volatile("ecall");
    80002c10:	00000073          	ecall
}
    80002c14:	01813083          	ld	ra,24(sp)
    80002c18:	01013403          	ld	s0,16(sp)
    80002c1c:	00813483          	ld	s1,8(sp)
    80002c20:	00013903          	ld	s2,0(sp)
    80002c24:	02010113          	addi	sp,sp,32
    80002c28:	00008067          	ret

0000000080002c2c <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002c2c:	fe010113          	addi	sp,sp,-32
    80002c30:	00113c23          	sd	ra,24(sp)
    80002c34:	00813823          	sd	s0,16(sp)
    80002c38:	00913423          	sd	s1,8(sp)
    80002c3c:	02010413          	addi	s0,sp,32
    80002c40:	00050493          	mv	s1,a0
    80002c44:	0000a797          	auipc	a5,0xa
    80002c48:	07c78793          	addi	a5,a5,124 # 8000ccc0 <_ZTV9Semaphore+0x10>
    80002c4c:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80002c50:	00853503          	ld	a0,8(a0)
    80002c54:	fffff097          	auipc	ra,0xfffff
    80002c58:	91c080e7          	jalr	-1764(ra) # 80001570 <_Z9sem_closeP4KSem>
    delete myHandle;
    80002c5c:	0084b483          	ld	s1,8(s1)
    80002c60:	02048863          	beqz	s1,80002c90 <_ZN9SemaphoreD1Ev+0x64>
        return front == nullptr;
    80002c64:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002c68:	00050e63          	beqz	a0,80002c84 <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    80002c6c:	00853783          	ld	a5,8(a0)
    80002c70:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002c74:	fe0508e3          	beqz	a0,80002c64 <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    80002c78:	ffffe097          	auipc	ra,0xffffe
    80002c7c:	75c080e7          	jalr	1884(ra) # 800013d4 <_Z8mem_freePv>
        }
    80002c80:	fe5ff06f          	j	80002c64 <_ZN9SemaphoreD1Ev+0x38>
    80002c84:	00048513          	mv	a0,s1
    80002c88:	00001097          	auipc	ra,0x1
    80002c8c:	9dc080e7          	jalr	-1572(ra) # 80003664 <_ZN4KSemdlEPv>
}
    80002c90:	01813083          	ld	ra,24(sp)
    80002c94:	01013403          	ld	s0,16(sp)
    80002c98:	00813483          	ld	s1,8(sp)
    80002c9c:	02010113          	addi	sp,sp,32
    80002ca0:	00008067          	ret

0000000080002ca4 <_Znwm>:
void* operator new(size_t size) {
    80002ca4:	ff010113          	addi	sp,sp,-16
    80002ca8:	00113423          	sd	ra,8(sp)
    80002cac:	00813023          	sd	s0,0(sp)
    80002cb0:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002cb4:	ffffe097          	auipc	ra,0xffffe
    80002cb8:	6e0080e7          	jalr	1760(ra) # 80001394 <_Z9mem_allocm>
}
    80002cbc:	00813083          	ld	ra,8(sp)
    80002cc0:	00013403          	ld	s0,0(sp)
    80002cc4:	01010113          	addi	sp,sp,16
    80002cc8:	00008067          	ret

0000000080002ccc <_Znam>:
void* operator new[](size_t size) {
    80002ccc:	ff010113          	addi	sp,sp,-16
    80002cd0:	00113423          	sd	ra,8(sp)
    80002cd4:	00813023          	sd	s0,0(sp)
    80002cd8:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002cdc:	ffffe097          	auipc	ra,0xffffe
    80002ce0:	6b8080e7          	jalr	1720(ra) # 80001394 <_Z9mem_allocm>
}
    80002ce4:	00813083          	ld	ra,8(sp)
    80002ce8:	00013403          	ld	s0,0(sp)
    80002cec:	01010113          	addi	sp,sp,16
    80002cf0:	00008067          	ret

0000000080002cf4 <_ZdlPv>:
noexcept {
    80002cf4:	ff010113          	addi	sp,sp,-16
    80002cf8:	00113423          	sd	ra,8(sp)
    80002cfc:	00813023          	sd	s0,0(sp)
    80002d00:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002d04:	ffffe097          	auipc	ra,0xffffe
    80002d08:	6d0080e7          	jalr	1744(ra) # 800013d4 <_Z8mem_freePv>
}
    80002d0c:	00813083          	ld	ra,8(sp)
    80002d10:	00013403          	ld	s0,0(sp)
    80002d14:	01010113          	addi	sp,sp,16
    80002d18:	00008067          	ret

0000000080002d1c <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002d1c:	fe010113          	addi	sp,sp,-32
    80002d20:	00113c23          	sd	ra,24(sp)
    80002d24:	00813823          	sd	s0,16(sp)
    80002d28:	00913423          	sd	s1,8(sp)
    80002d2c:	02010413          	addi	s0,sp,32
    80002d30:	00050493          	mv	s1,a0
}
    80002d34:	00000097          	auipc	ra,0x0
    80002d38:	e68080e7          	jalr	-408(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80002d3c:	00048513          	mv	a0,s1
    80002d40:	00000097          	auipc	ra,0x0
    80002d44:	fb4080e7          	jalr	-76(ra) # 80002cf4 <_ZdlPv>
    80002d48:	01813083          	ld	ra,24(sp)
    80002d4c:	01013403          	ld	s0,16(sp)
    80002d50:	00813483          	ld	s1,8(sp)
    80002d54:	02010113          	addi	sp,sp,32
    80002d58:	00008067          	ret

0000000080002d5c <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002d5c:	fe010113          	addi	sp,sp,-32
    80002d60:	00113c23          	sd	ra,24(sp)
    80002d64:	00813823          	sd	s0,16(sp)
    80002d68:	00913423          	sd	s1,8(sp)
    80002d6c:	02010413          	addi	s0,sp,32
    80002d70:	00050493          	mv	s1,a0
}
    80002d74:	00000097          	auipc	ra,0x0
    80002d78:	eb8080e7          	jalr	-328(ra) # 80002c2c <_ZN9SemaphoreD1Ev>
    80002d7c:	00048513          	mv	a0,s1
    80002d80:	00000097          	auipc	ra,0x0
    80002d84:	f74080e7          	jalr	-140(ra) # 80002cf4 <_ZdlPv>
    80002d88:	01813083          	ld	ra,24(sp)
    80002d8c:	01013403          	ld	s0,16(sp)
    80002d90:	00813483          	ld	s1,8(sp)
    80002d94:	02010113          	addi	sp,sp,32
    80002d98:	00008067          	ret

0000000080002d9c <_ZdaPv>:
noexcept {
    80002d9c:	ff010113          	addi	sp,sp,-16
    80002da0:	00113423          	sd	ra,8(sp)
    80002da4:	00813023          	sd	s0,0(sp)
    80002da8:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002dac:	ffffe097          	auipc	ra,0xffffe
    80002db0:	628080e7          	jalr	1576(ra) # 800013d4 <_Z8mem_freePv>
}
    80002db4:	00813083          	ld	ra,8(sp)
    80002db8:	00013403          	ld	s0,0(sp)
    80002dbc:	01010113          	addi	sp,sp,16
    80002dc0:	00008067          	ret

0000000080002dc4 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80002dc4:	fd010113          	addi	sp,sp,-48
    80002dc8:	02113423          	sd	ra,40(sp)
    80002dcc:	02813023          	sd	s0,32(sp)
    80002dd0:	00913c23          	sd	s1,24(sp)
    80002dd4:	01213823          	sd	s2,16(sp)
    80002dd8:	01313423          	sd	s3,8(sp)
    80002ddc:	03010413          	addi	s0,sp,48
    80002de0:	00050493          	mv	s1,a0
    80002de4:	00058913          	mv	s2,a1
    80002de8:	00060993          	mv	s3,a2
    80002dec:	0000a797          	auipc	a5,0xa
    80002df0:	eac78793          	addi	a5,a5,-340 # 8000cc98 <_ZTV6Thread+0x10>
    80002df4:	00f53023          	sd	a5,0(a0)
    this->body = body;
    80002df8:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    80002dfc:	00c53c23          	sd	a2,24(a0)
    if (body != (TCB::Body)main) {
    80002e00:	0000a797          	auipc	a5,0xa
    80002e04:	1407b783          	ld	a5,320(a5) # 8000cf40 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002e08:	04f58663          	beq	a1,a5,80002e54 <_ZN6ThreadC1EPFvPvES0_+0x90>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002e0c:	00001537          	lui	a0,0x1
    80002e10:	ffffe097          	auipc	ra,0xffffe
    80002e14:	584080e7          	jalr	1412(ra) # 80001394 <_Z9mem_allocm>
    80002e18:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002e1c:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002e20:	00098693          	mv	a3,s3
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002e24:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002e28:	00848493          	addi	s1,s1,8
    80002e2c:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002e30:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002e34:	00000073          	ecall
}
    80002e38:	02813083          	ld	ra,40(sp)
    80002e3c:	02013403          	ld	s0,32(sp)
    80002e40:	01813483          	ld	s1,24(sp)
    80002e44:	01013903          	ld	s2,16(sp)
    80002e48:	00813983          	ld	s3,8(sp)
    80002e4c:	03010113          	addi	sp,sp,48
    80002e50:	00008067          	ret
    uint64* stack = nullptr;
    80002e54:	00000313          	li	t1,0
    80002e58:	fc5ff06f          	j	80002e1c <_ZN6ThreadC1EPFvPvES0_+0x58>

0000000080002e5c <_ZN6Thread5startEv>:
int Thread::start() {
    80002e5c:	ff010113          	addi	sp,sp,-16
    80002e60:	00813423          	sd	s0,8(sp)
    80002e64:	01010413          	addi	s0,sp,16
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    80002e68:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002e6c:	02030463          	beqz	t1,80002e94 <_ZN6Thread5startEv+0x38>
    ThreadStatus getStatus() { return this->status; }
    80002e70:	05832783          	lw	a5,88(t1)
    80002e74:	02079463          	bnez	a5,80002e9c <_ZN6Thread5startEv+0x40>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002e78:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    80002e7c:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    80002e80:	00000073          	ecall
    return 0;
    80002e84:	00000513          	li	a0,0
}
    80002e88:	00813403          	ld	s0,8(sp)
    80002e8c:	01010113          	addi	sp,sp,16
    80002e90:	00008067          	ret
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    80002e94:	fff00513          	li	a0,-1
    80002e98:	ff1ff06f          	j	80002e88 <_ZN6Thread5startEv+0x2c>
    80002e9c:	fff00513          	li	a0,-1
    80002ea0:	fe9ff06f          	j	80002e88 <_ZN6Thread5startEv+0x2c>

0000000080002ea4 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002ea4:	ff010113          	addi	sp,sp,-16
    80002ea8:	00113423          	sd	ra,8(sp)
    80002eac:	00813023          	sd	s0,0(sp)
    80002eb0:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80002eb4:	00853503          	ld	a0,8(a0)
    80002eb8:	ffffe097          	auipc	ra,0xffffe
    80002ebc:	628080e7          	jalr	1576(ra) # 800014e0 <_Z11thread_joinP3TCB>
}
    80002ec0:	00813083          	ld	ra,8(sp)
    80002ec4:	00013403          	ld	s0,0(sp)
    80002ec8:	01010113          	addi	sp,sp,16
    80002ecc:	00008067          	ret

0000000080002ed0 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002ed0:	ff010113          	addi	sp,sp,-16
    80002ed4:	00113423          	sd	ra,8(sp)
    80002ed8:	00813023          	sd	s0,0(sp)
    80002edc:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002ee0:	ffffe097          	auipc	ra,0xffffe
    80002ee4:	5e0080e7          	jalr	1504(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80002ee8:	00813083          	ld	ra,8(sp)
    80002eec:	00013403          	ld	s0,0(sp)
    80002ef0:	01010113          	addi	sp,sp,16
    80002ef4:	00008067          	ret

0000000080002ef8 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80002ef8:	ff010113          	addi	sp,sp,-16
    80002efc:	00113423          	sd	ra,8(sp)
    80002f00:	00813023          	sd	s0,0(sp)
    80002f04:	01010413          	addi	s0,sp,16
    time_sleep(t);
    80002f08:	ffffe097          	auipc	ra,0xffffe
    80002f0c:	600080e7          	jalr	1536(ra) # 80001508 <_Z10time_sleepm>
}
    80002f10:	00000513          	li	a0,0
    80002f14:	00813083          	ld	ra,8(sp)
    80002f18:	00013403          	ld	s0,0(sp)
    80002f1c:	01010113          	addi	sp,sp,16
    80002f20:	00008067          	ret

0000000080002f24 <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    80002f24:	fe010113          	addi	sp,sp,-32
    80002f28:	00113c23          	sd	ra,24(sp)
    80002f2c:	00813823          	sd	s0,16(sp)
    80002f30:	00913423          	sd	s1,8(sp)
    80002f34:	02010413          	addi	s0,sp,32
    80002f38:	00050493          	mv	s1,a0
    while (period != -1UL) {
    80002f3c:	0204b703          	ld	a4,32(s1)
    80002f40:	fff00793          	li	a5,-1
    80002f44:	02f70663          	beq	a4,a5,80002f70 <_ZN14PeriodicThread3runEv+0x4c>
        periodicActivation();
    80002f48:	0004b783          	ld	a5,0(s1)
    80002f4c:	0187b783          	ld	a5,24(a5)
    80002f50:	00048513          	mv	a0,s1
    80002f54:	000780e7          	jalr	a5
        if (period == -1UL) break;
    80002f58:	0204b503          	ld	a0,32(s1)
    80002f5c:	fff00793          	li	a5,-1
    80002f60:	00f50863          	beq	a0,a5,80002f70 <_ZN14PeriodicThread3runEv+0x4c>
        sleep(period);
    80002f64:	00000097          	auipc	ra,0x0
    80002f68:	f94080e7          	jalr	-108(ra) # 80002ef8 <_ZN6Thread5sleepEm>
    while (period != -1UL) {
    80002f6c:	fd1ff06f          	j	80002f3c <_ZN14PeriodicThread3runEv+0x18>
    }
    thread_exit();
    80002f70:	ffffe097          	auipc	ra,0xffffe
    80002f74:	528080e7          	jalr	1320(ra) # 80001498 <_Z11thread_exitv>
}
    80002f78:	01813083          	ld	ra,24(sp)
    80002f7c:	01013403          	ld	s0,16(sp)
    80002f80:	00813483          	ld	s1,8(sp)
    80002f84:	02010113          	addi	sp,sp,32
    80002f88:	00008067          	ret

0000000080002f8c <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002f8c:	fe010113          	addi	sp,sp,-32
    80002f90:	00113c23          	sd	ra,24(sp)
    80002f94:	00813823          	sd	s0,16(sp)
    80002f98:	00913423          	sd	s1,8(sp)
    80002f9c:	02010413          	addi	s0,sp,32
    80002fa0:	00050493          	mv	s1,a0
    80002fa4:	0000a797          	auipc	a5,0xa
    80002fa8:	cf478793          	addi	a5,a5,-780 # 8000cc98 <_ZTV6Thread+0x10>
    80002fac:	00f53023          	sd	a5,0(a0)
    this->body = wrapper;
    80002fb0:	00000797          	auipc	a5,0x0
    80002fb4:	bb878793          	addi	a5,a5,-1096 # 80002b68 <_ZN6Thread7wrapperEPv>
    80002fb8:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80002fbc:	00a53c23          	sd	a0,24(a0)
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002fc0:	00001537          	lui	a0,0x1
    80002fc4:	ffffe097          	auipc	ra,0xffffe
    80002fc8:	3d0080e7          	jalr	976(ra) # 80001394 <_Z9mem_allocm>
    80002fcc:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002fd0:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002fd4:	0184b303          	ld	t1,24(s1)
    80002fd8:	00030693          	mv	a3,t1
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002fdc:	0104b303          	ld	t1,16(s1)
    80002fe0:	00030613          	mv	a2,t1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002fe4:	00848493          	addi	s1,s1,8
    80002fe8:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002fec:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002ff0:	00000073          	ecall
}
    80002ff4:	01813083          	ld	ra,24(sp)
    80002ff8:	01013403          	ld	s0,16(sp)
    80002ffc:	00813483          	ld	s1,8(sp)
    80003000:	02010113          	addi	sp,sp,32
    80003004:	00008067          	ret

0000000080003008 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80003008:	ff010113          	addi	sp,sp,-16
    8000300c:	00113423          	sd	ra,8(sp)
    80003010:	00813023          	sd	s0,0(sp)
    80003014:	01010413          	addi	s0,sp,16
    80003018:	0000a797          	auipc	a5,0xa
    8000301c:	ca878793          	addi	a5,a5,-856 # 8000ccc0 <_ZTV9Semaphore+0x10>
    80003020:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle, init);
    80003024:	00850513          	addi	a0,a0,8
    80003028:	ffffe097          	auipc	ra,0xffffe
    8000302c:	510080e7          	jalr	1296(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    80003030:	00813083          	ld	ra,8(sp)
    80003034:	00013403          	ld	s0,0(sp)
    80003038:	01010113          	addi	sp,sp,16
    8000303c:	00008067          	ret

0000000080003040 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80003040:	ff010113          	addi	sp,sp,-16
    80003044:	00113423          	sd	ra,8(sp)
    80003048:	00813023          	sd	s0,0(sp)
    8000304c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80003050:	00853503          	ld	a0,8(a0)
    80003054:	ffffe097          	auipc	ra,0xffffe
    80003058:	54c080e7          	jalr	1356(ra) # 800015a0 <_Z8sem_waitP4KSem>
}
    8000305c:	00813083          	ld	ra,8(sp)
    80003060:	00013403          	ld	s0,0(sp)
    80003064:	01010113          	addi	sp,sp,16
    80003068:	00008067          	ret

000000008000306c <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    8000306c:	ff010113          	addi	sp,sp,-16
    80003070:	00113423          	sd	ra,8(sp)
    80003074:	00813023          	sd	s0,0(sp)
    80003078:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    8000307c:	00853503          	ld	a0,8(a0)
    80003080:	ffffe097          	auipc	ra,0xffffe
    80003084:	550080e7          	jalr	1360(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80003088:	00813083          	ld	ra,8(sp)
    8000308c:	00013403          	ld	s0,0(sp)
    80003090:	01010113          	addi	sp,sp,16
    80003094:	00008067          	ret

0000000080003098 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80003098:	ff010113          	addi	sp,sp,-16
    8000309c:	00813423          	sd	s0,8(sp)
    800030a0:	01010413          	addi	s0,sp,16
    this->period = -1;
    800030a4:	fff00793          	li	a5,-1
    800030a8:	02f53023          	sd	a5,32(a0)
}
    800030ac:	00813403          	ld	s0,8(sp)
    800030b0:	01010113          	addi	sp,sp,16
    800030b4:	00008067          	ret

00000000800030b8 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    800030b8:	fe010113          	addi	sp,sp,-32
    800030bc:	00113c23          	sd	ra,24(sp)
    800030c0:	00813823          	sd	s0,16(sp)
    800030c4:	00913423          	sd	s1,8(sp)
    800030c8:	01213023          	sd	s2,0(sp)
    800030cc:	02010413          	addi	s0,sp,32
    800030d0:	00050493          	mv	s1,a0
    800030d4:	00058913          	mv	s2,a1
    800030d8:	00000097          	auipc	ra,0x0
    800030dc:	eb4080e7          	jalr	-332(ra) # 80002f8c <_ZN6ThreadC1Ev>
    800030e0:	0000a797          	auipc	a5,0xa
    800030e4:	c0078793          	addi	a5,a5,-1024 # 8000cce0 <_ZTV14PeriodicThread+0x10>
    800030e8:	00f4b023          	sd	a5,0(s1)
    800030ec:	0324b023          	sd	s2,32(s1)
}
    800030f0:	01813083          	ld	ra,24(sp)
    800030f4:	01013403          	ld	s0,16(sp)
    800030f8:	00813483          	ld	s1,8(sp)
    800030fc:	00013903          	ld	s2,0(sp)
    80003100:	02010113          	addi	sp,sp,32
    80003104:	00008067          	ret

0000000080003108 <_ZN7Console4getcEv>:

char Console::getc() {
    80003108:	ff010113          	addi	sp,sp,-16
    8000310c:	00113423          	sd	ra,8(sp)
    80003110:	00813023          	sd	s0,0(sp)
    80003114:	01010413          	addi	s0,sp,16
    return ::getc();
    80003118:	ffffe097          	auipc	ra,0xffffe
    8000311c:	4e8080e7          	jalr	1256(ra) # 80001600 <_Z4getcv>
}
    80003120:	00813083          	ld	ra,8(sp)
    80003124:	00013403          	ld	s0,0(sp)
    80003128:	01010113          	addi	sp,sp,16
    8000312c:	00008067          	ret

0000000080003130 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80003130:	ff010113          	addi	sp,sp,-16
    80003134:	00113423          	sd	ra,8(sp)
    80003138:	00813023          	sd	s0,0(sp)
    8000313c:	01010413          	addi	s0,sp,16
    ::putc(c);
    80003140:	ffffe097          	auipc	ra,0xffffe
    80003144:	4e8080e7          	jalr	1256(ra) # 80001628 <_Z4putcc>
}
    80003148:	00813083          	ld	ra,8(sp)
    8000314c:	00013403          	ld	s0,0(sp)
    80003150:	01010113          	addi	sp,sp,16
    80003154:	00008067          	ret

0000000080003158 <_ZN6Thread3runEv>:
protected:
    //konstruktor koji pravi nit koja izvrsava run metodu, ne stavlja je u Scheduler
    Thread();

    //funkcija koju nit izvrsava, samo ako je nit napravljena podrazumevanim konstruktorom
    virtual void run() {}
    80003158:	ff010113          	addi	sp,sp,-16
    8000315c:	00813423          	sd	s0,8(sp)
    80003160:	01010413          	addi	s0,sp,16
    80003164:	00813403          	ld	s0,8(sp)
    80003168:	01010113          	addi	sp,sp,16
    8000316c:	00008067          	ret

0000000080003170 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    80003170:	ff010113          	addi	sp,sp,-16
    80003174:	00813423          	sd	s0,8(sp)
    80003178:	01010413          	addi	s0,sp,16
    8000317c:	00813403          	ld	s0,8(sp)
    80003180:	01010113          	addi	sp,sp,16
    80003184:	00008067          	ret

0000000080003188 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80003188:	ff010113          	addi	sp,sp,-16
    8000318c:	00113423          	sd	ra,8(sp)
    80003190:	00813023          	sd	s0,0(sp)
    80003194:	01010413          	addi	s0,sp,16
    80003198:	0000a797          	auipc	a5,0xa
    8000319c:	b4878793          	addi	a5,a5,-1208 # 8000cce0 <_ZTV14PeriodicThread+0x10>
    800031a0:	00f53023          	sd	a5,0(a0)
    800031a4:	00000097          	auipc	ra,0x0
    800031a8:	9f8080e7          	jalr	-1544(ra) # 80002b9c <_ZN6ThreadD1Ev>
    800031ac:	00813083          	ld	ra,8(sp)
    800031b0:	00013403          	ld	s0,0(sp)
    800031b4:	01010113          	addi	sp,sp,16
    800031b8:	00008067          	ret

00000000800031bc <_ZN14PeriodicThreadD0Ev>:
    800031bc:	fe010113          	addi	sp,sp,-32
    800031c0:	00113c23          	sd	ra,24(sp)
    800031c4:	00813823          	sd	s0,16(sp)
    800031c8:	00913423          	sd	s1,8(sp)
    800031cc:	02010413          	addi	s0,sp,32
    800031d0:	00050493          	mv	s1,a0
    800031d4:	0000a797          	auipc	a5,0xa
    800031d8:	b0c78793          	addi	a5,a5,-1268 # 8000cce0 <_ZTV14PeriodicThread+0x10>
    800031dc:	00f53023          	sd	a5,0(a0)
    800031e0:	00000097          	auipc	ra,0x0
    800031e4:	9bc080e7          	jalr	-1604(ra) # 80002b9c <_ZN6ThreadD1Ev>
    800031e8:	00048513          	mv	a0,s1
    800031ec:	00000097          	auipc	ra,0x0
    800031f0:	b08080e7          	jalr	-1272(ra) # 80002cf4 <_ZdlPv>
    800031f4:	01813083          	ld	ra,24(sp)
    800031f8:	01013403          	ld	s0,16(sp)
    800031fc:	00813483          	ld	s1,8(sp)
    80003200:	02010113          	addi	sp,sp,32
    80003204:	00008067          	ret

0000000080003208 <_ZN3TCB7wrapperEv>:
    }

    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
}

void TCB::wrapper() {
    80003208:	ff010113          	addi	sp,sp,-16
    8000320c:	00113423          	sd	ra,8(sp)
    80003210:	00813023          	sd	s0,0(sp)
    80003214:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch)
    Riscv::returnFromInterrupt();
    80003218:	00000097          	auipc	ra,0x0
    8000321c:	404080e7          	jalr	1028(ra) # 8000361c <_ZN5Riscv19returnFromInterruptEv>
    //na dalje se izvrsavamo u user modu (osim za kernel funkcije)
    running->threadFunction(running->args);
    80003220:	0000a797          	auipc	a5,0xa
    80003224:	eb07b783          	ld	a5,-336(a5) # 8000d0d0 <_ZN3TCB7runningE>
    80003228:	0107b703          	ld	a4,16(a5)
    8000322c:	0207b503          	ld	a0,32(a5)
    80003230:	000700e7          	jalr	a4
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    80003234:	ffffe097          	auipc	ra,0xffffe
    80003238:	264080e7          	jalr	612(ra) # 80001498 <_Z11thread_exitv>
}
    8000323c:	00813083          	ld	ra,8(sp)
    80003240:	00013403          	ld	s0,0(sp)
    80003244:	01010113          	addi	sp,sp,16
    80003248:	00008067          	ret

000000008000324c <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    8000324c:	fe010113          	addi	sp,sp,-32
    80003250:	00113c23          	sd	ra,24(sp)
    80003254:	00813823          	sd	s0,16(sp)
    80003258:	00913423          	sd	s1,8(sp)
    8000325c:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    80003260:	0000a497          	auipc	s1,0xa
    80003264:	e704b483          	ld	s1,-400(s1) # 8000d0d0 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    80003268:	0584a783          	lw	a5,88(s1)
    8000326c:	00100713          	li	a4,1
    80003270:	04e78e63          	beq	a5,a4,800032cc <_ZN3TCB8dispatchEv+0x80>
    } else if (old->status == FINISHED) {
    80003274:	00500713          	li	a4,5
    80003278:	06e78263          	beq	a5,a4,800032dc <_ZN3TCB8dispatchEv+0x90>
    TCB::running = Scheduler::get();
    8000327c:	ffffe097          	auipc	ra,0xffffe
    80003280:	72c080e7          	jalr	1836(ra) # 800019a8 <_ZN9Scheduler3getEv>
    80003284:	00050593          	mv	a1,a0
    80003288:	0000a797          	auipc	a5,0xa
    8000328c:	e4878793          	addi	a5,a5,-440 # 8000d0d0 <_ZN3TCB7runningE>
    80003290:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80003294:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == (TCB::Body)main || TCB::running->threadFunction == kernelConsumerFunction ||
    80003298:	01053783          	ld	a5,16(a0)
    8000329c:	0000a717          	auipc	a4,0xa
    800032a0:	ca473703          	ld	a4,-860(a4) # 8000cf40 <_GLOBAL_OFFSET_TABLE_+0x68>
    800032a4:	04e78863          	beq	a5,a4,800032f4 <_ZN3TCB8dispatchEv+0xa8>
    800032a8:	0000a717          	auipc	a4,0xa
    800032ac:	c7073703          	ld	a4,-912(a4) # 8000cf18 <_GLOBAL_OFFSET_TABLE_+0x40>
    800032b0:	04e78263          	beq	a5,a4,800032f4 <_ZN3TCB8dispatchEv+0xa8>
    800032b4:	0000a717          	auipc	a4,0xa
    800032b8:	cbc73703          	ld	a4,-836(a4) # 8000cf70 <_GLOBAL_OFFSET_TABLE_+0x98>
    800032bc:	02e78c63          	beq	a5,a4,800032f4 <_ZN3TCB8dispatchEv+0xa8>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800032c0:	10000793          	li	a5,256
    800032c4:	1007b073          	csrc	sstatus,a5
}
    800032c8:	0340006f          	j	800032fc <_ZN3TCB8dispatchEv+0xb0>
        Scheduler::put(old);
    800032cc:	00048513          	mv	a0,s1
    800032d0:	ffffe097          	auipc	ra,0xffffe
    800032d4:	68c080e7          	jalr	1676(ra) # 8000195c <_ZN9Scheduler3putEP3TCB>
    800032d8:	fa5ff06f          	j	8000327c <_ZN3TCB8dispatchEv+0x30>
        delete old->stack;
    800032dc:	0184b503          	ld	a0,24(s1)
    800032e0:	00050663          	beqz	a0,800032ec <_ZN3TCB8dispatchEv+0xa0>
    800032e4:	00000097          	auipc	ra,0x0
    800032e8:	a10080e7          	jalr	-1520(ra) # 80002cf4 <_ZdlPv>
        old->stack = nullptr;
    800032ec:	0004bc23          	sd	zero,24(s1)
    800032f0:	f8dff06f          	j	8000327c <_ZN3TCB8dispatchEv+0x30>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    800032f4:	10000793          	li	a5,256
    800032f8:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    800032fc:	00b48863          	beq	s1,a1,8000330c <_ZN3TCB8dispatchEv+0xc0>
    80003300:	00048513          	mv	a0,s1
    80003304:	ffffe097          	auipc	ra,0xffffe
    80003308:	e0c080e7          	jalr	-500(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    8000330c:	01813083          	ld	ra,24(sp)
    80003310:	01013403          	ld	s0,16(sp)
    80003314:	00813483          	ld	s1,8(sp)
    80003318:	02010113          	addi	sp,sp,32
    8000331c:	00008067          	ret

0000000080003320 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80003320:	ff010113          	addi	sp,sp,-16
    80003324:	00113423          	sd	ra,8(sp)
    80003328:	00813023          	sd	s0,0(sp)
    8000332c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003330:	ffffe097          	auipc	ra,0xffffe
    80003334:	064080e7          	jalr	100(ra) # 80001394 <_Z9mem_allocm>
}
    80003338:	00813083          	ld	ra,8(sp)
    8000333c:	00013403          	ld	s0,0(sp)
    80003340:	01010113          	addi	sp,sp,16
    80003344:	00008067          	ret

0000000080003348 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80003348:	fd010113          	addi	sp,sp,-48
    8000334c:	02113423          	sd	ra,40(sp)
    80003350:	02813023          	sd	s0,32(sp)
    80003354:	00913c23          	sd	s1,24(sp)
    80003358:	01213823          	sd	s2,16(sp)
    8000335c:	01313423          	sd	s3,8(sp)
    80003360:	03010413          	addi	s0,sp,48
    80003364:	00050913          	mv	s2,a0
    80003368:	00058993          	mv	s3,a1
    8000336c:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    80003370:	07000513          	li	a0,112
    80003374:	00000097          	auipc	ra,0x0
    80003378:	fac080e7          	jalr	-84(ra) # 80003320 <_ZN3TCBnwEm>
private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED), mySemaphore(nullptr),
                                                    joiningWithTCB(nullptr) {
    8000337c:	01253823          	sd	s2,16(a0)
    80003380:	00953c23          	sd	s1,24(a0)
    80003384:	03353023          	sd	s3,32(a0)
    80003388:	00200793          	li	a5,2
    8000338c:	02f53423          	sd	a5,40(a0)
    80003390:	02053823          	sd	zero,48(a0)
    80003394:	02053c23          	sd	zero,56(a0)
    80003398:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    8000339c:	04053423          	sd	zero,72(a0)
    800033a0:	04053823          	sd	zero,80(a0)
    800033a4:	04052c23          	sw	zero,88(a0)
    800033a8:	06053023          	sd	zero,96(a0)
    800033ac:	06053423          	sd	zero,104(a0)
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    800033b0:	0000a797          	auipc	a5,0xa
    800033b4:	b907b783          	ld	a5,-1136(a5) # 8000cf40 <_GLOBAL_OFFSET_TABLE_+0x68>
    800033b8:	02f90e63          	beq	s2,a5,800033f4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    800033bc:	00000797          	auipc	a5,0x0
    800033c0:	e4c78793          	addi	a5,a5,-436 # 80003208 <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    800033c4:	02048c63          	beqz	s1,800033fc <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb4>
    800033c8:	00001637          	lui	a2,0x1
    800033cc:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    800033d0:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    800033d4:	00953423          	sd	s1,8(a0)
}
    800033d8:	02813083          	ld	ra,40(sp)
    800033dc:	02013403          	ld	s0,32(sp)
    800033e0:	01813483          	ld	s1,24(sp)
    800033e4:	01013903          	ld	s2,16(sp)
    800033e8:	00813983          	ld	s3,8(sp)
    800033ec:	03010113          	addi	sp,sp,48
    800033f0:	00008067          	ret
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    800033f4:	00000793          	li	a5,0
    800033f8:	fcdff06f          	j	800033c4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x7c>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    800033fc:	00000493          	li	s1,0
    80003400:	fd1ff06f          	j	800033d0 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x88>

0000000080003404 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80003404:	ff010113          	addi	sp,sp,-16
    80003408:	00113423          	sd	ra,8(sp)
    8000340c:	00813023          	sd	s0,0(sp)
    80003410:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003414:	ffffe097          	auipc	ra,0xffffe
    80003418:	fc0080e7          	jalr	-64(ra) # 800013d4 <_Z8mem_freePv>
}
    8000341c:	00813083          	ld	ra,8(sp)
    80003420:	00013403          	ld	s0,0(sp)
    80003424:	01010113          	addi	sp,sp,16
    80003428:	00008067          	ret

000000008000342c <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED || TCB::running == handle) return;
    8000342c:	05852703          	lw	a4,88(a0)
    80003430:	00500793          	li	a5,5
    80003434:	04f70263          	beq	a4,a5,80003478 <_ZN3TCB10threadJoinEPS_+0x4c>
    80003438:	0000a597          	auipc	a1,0xa
    8000343c:	c985b583          	ld	a1,-872(a1) # 8000d0d0 <_ZN3TCB7runningE>
    80003440:	02a58c63          	beq	a1,a0,80003478 <_ZN3TCB10threadJoinEPS_+0x4c>
void TCB::threadJoin(TCB* handle) {
    80003444:	ff010113          	addi	sp,sp,-16
    80003448:	00113423          	sd	ra,8(sp)
    8000344c:	00813023          	sd	s0,0(sp)
    80003450:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    80003454:	00300793          	li	a5,3
    80003458:	04f5ac23          	sw	a5,88(a1)
    handle->waitingToJoin.putLast(TCB::running);
    8000345c:	04850513          	addi	a0,a0,72
    80003460:	ffffe097          	auipc	ra,0xffffe
    80003464:	ddc080e7          	jalr	-548(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
}
    80003468:	00813083          	ld	ra,8(sp)
    8000346c:	00013403          	ld	s0,0(sp)
    80003470:	01010113          	addi	sp,sp,16
    80003474:	00008067          	ret
    80003478:	00008067          	ret

000000008000347c <_ZN3TCB13releaseJoinedEPS_>:

void TCB::releaseJoined(TCB* handle) {
    8000347c:	fe010113          	addi	sp,sp,-32
    80003480:	00113c23          	sd	ra,24(sp)
    80003484:	00813823          	sd	s0,16(sp)
    80003488:	00913423          	sd	s1,8(sp)
    8000348c:	02010413          	addi	s0,sp,32
    80003490:	00050493          	mv	s1,a0
        return front == nullptr;
    80003494:	0484b783          	ld	a5,72(s1)
    while (!handle->waitingToJoin.isEmpty()) {
    80003498:	00078e63          	beqz	a5,800034b4 <_ZN3TCB13releaseJoinedEPS_+0x38>
        TCB* tcb = handle->waitingToJoin.getFirst();
    8000349c:	04848513          	addi	a0,s1,72
    800034a0:	ffffe097          	auipc	ra,0xffffe
    800034a4:	e08080e7          	jalr	-504(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
        Scheduler::put(tcb);
    800034a8:	ffffe097          	auipc	ra,0xffffe
    800034ac:	4b4080e7          	jalr	1204(ra) # 8000195c <_ZN9Scheduler3putEP3TCB>
    while (!handle->waitingToJoin.isEmpty()) {
    800034b0:	fe5ff06f          	j	80003494 <_ZN3TCB13releaseJoinedEPS_+0x18>
    }
}
    800034b4:	01813083          	ld	ra,24(sp)
    800034b8:	01013403          	ld	s0,16(sp)
    800034bc:	00813483          	ld	s1,8(sp)
    800034c0:	02010113          	addi	sp,sp,32
    800034c4:	00008067          	ret

00000000800034c8 <_ZN3TCB10quitThreadEPS_>:

void TCB::quitThread(TCB* handle) {
    800034c8:	fe010113          	addi	sp,sp,-32
    800034cc:	00113c23          	sd	ra,24(sp)
    800034d0:	00813823          	sd	s0,16(sp)
    800034d4:	00913423          	sd	s1,8(sp)
    800034d8:	02010413          	addi	s0,sp,32
    800034dc:	00050493          	mv	s1,a0
    TCB* prev, * curr;
    switch (handle->status) {
    800034e0:	05852783          	lw	a5,88(a0)
    800034e4:	00300713          	li	a4,3
    800034e8:	0ce78c63          	beq	a5,a4,800035c0 <_ZN3TCB10quitThreadEPS_+0xf8>
    800034ec:	02f76663          	bltu	a4,a5,80003518 <_ZN3TCB10quitThreadEPS_+0x50>
    800034f0:	00100713          	li	a4,1
    800034f4:	04e78663          	beq	a5,a4,80003540 <_ZN3TCB10quitThreadEPS_+0x78>
    800034f8:	00200713          	li	a4,2
    800034fc:	08e79263          	bne	a5,a4,80003580 <_ZN3TCB10quitThreadEPS_+0xb8>
            }
            curr->nextInScheduler = nullptr;
            break;
        case BLOCKED:
            //nit blokirana na semaforu, treba da se izbaci iz reda blokiranih na semaforu
            if (handle->mySemaphore->getBlocked()->remove(handle) < 0) {
    80003500:	06053503          	ld	a0,96(a0)
    80003504:	00048593          	mv	a1,s1
    80003508:	00850513          	addi	a0,a0,8
    8000350c:	ffffe097          	auipc	ra,0xffffe
    80003510:	dfc080e7          	jalr	-516(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    80003514:	06c0006f          	j	80003580 <_ZN3TCB10quitThreadEPS_+0xb8>
    switch (handle->status) {
    80003518:	00400713          	li	a4,4
    8000351c:	06e79263          	bne	a5,a4,80003580 <_ZN3TCB10quitThreadEPS_+0xb8>

    static TCB* getTail() { return tail; }

    static void setTail(TCB* tcb) { tail = tcb; }

    static TCB* getSleepingHead() { return sleepingHead; }
    80003520:	0000a797          	auipc	a5,0xa
    80003524:	a487b783          	ld	a5,-1464(a5) # 8000cf68 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003528:	0007b783          	ld	a5,0(a5)
                //greska
            }
            break;
        case SLEEPING:
            //nit je u redu uspavanih, treba da se izbaci
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    8000352c:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextSleeping);
    80003530:	0a978463          	beq	a5,s1,800035d8 <_ZN3TCB10quitThreadEPS_+0x110>
    80003534:	00078713          	mv	a4,a5
    80003538:	0407b783          	ld	a5,64(a5)
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    8000353c:	ff5ff06f          	j	80003530 <_ZN3TCB10quitThreadEPS_+0x68>
    static TCB* getHead() { return head; }
    80003540:	0000a797          	auipc	a5,0xa
    80003544:	9e07b783          	ld	a5,-1568(a5) # 8000cf20 <_GLOBAL_OFFSET_TABLE_+0x48>
    80003548:	0007b783          	ld	a5,0(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    8000354c:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextInScheduler);
    80003550:	00978863          	beq	a5,s1,80003560 <_ZN3TCB10quitThreadEPS_+0x98>
    80003554:	00078713          	mv	a4,a5
    80003558:	0307b783          	ld	a5,48(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    8000355c:	ff5ff06f          	j	80003550 <_ZN3TCB10quitThreadEPS_+0x88>
            if (!prev) {
    80003560:	02070e63          	beqz	a4,8000359c <_ZN3TCB10quitThreadEPS_+0xd4>
                prev->nextInScheduler = curr->nextInScheduler;
    80003564:	0307b683          	ld	a3,48(a5)
    80003568:	02d73823          	sd	a3,48(a4)
    static TCB* getTail() { return tail; }
    8000356c:	0000a697          	auipc	a3,0xa
    80003570:	9946b683          	ld	a3,-1644(a3) # 8000cf00 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003574:	0006b683          	ld	a3,0(a3)
            if (curr == Scheduler::getTail()) {
    80003578:	02d78c63          	beq	a5,a3,800035b0 <_ZN3TCB10quitThreadEPS_+0xe8>
            curr->nextInScheduler = nullptr;
    8000357c:	0207b823          	sd	zero,48(a5)
        case FINISHED:
            break;
        default:
            break;
    }
    handle->status = FINISHED;
    80003580:	00500793          	li	a5,5
    80003584:	04f4ac23          	sw	a5,88(s1)
}
    80003588:	01813083          	ld	ra,24(sp)
    8000358c:	01013403          	ld	s0,16(sp)
    80003590:	00813483          	ld	s1,8(sp)
    80003594:	02010113          	addi	sp,sp,32
    80003598:	00008067          	ret
                Scheduler::setHead(curr->nextInScheduler);
    8000359c:	0307b603          	ld	a2,48(a5)
    static void setHead(TCB* tcb) { head = tcb; }
    800035a0:	0000a697          	auipc	a3,0xa
    800035a4:	9806b683          	ld	a3,-1664(a3) # 8000cf20 <_GLOBAL_OFFSET_TABLE_+0x48>
    800035a8:	00c6b023          	sd	a2,0(a3)
    800035ac:	fc1ff06f          	j	8000356c <_ZN3TCB10quitThreadEPS_+0xa4>
    static void setTail(TCB* tcb) { tail = tcb; }
    800035b0:	0000a697          	auipc	a3,0xa
    800035b4:	9506b683          	ld	a3,-1712(a3) # 8000cf00 <_GLOBAL_OFFSET_TABLE_+0x28>
    800035b8:	00e6b023          	sd	a4,0(a3)
    800035bc:	fc1ff06f          	j	8000357c <_ZN3TCB10quitThreadEPS_+0xb4>
            if (handle->joiningWithTCB->getListOfJoiningThreads()->remove(handle) < 0) {
    800035c0:	06853503          	ld	a0,104(a0)
    800035c4:	00048593          	mv	a1,s1
    800035c8:	04850513          	addi	a0,a0,72
    800035cc:	ffffe097          	auipc	ra,0xffffe
    800035d0:	d3c080e7          	jalr	-708(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    800035d4:	fadff06f          	j	80003580 <_ZN3TCB10quitThreadEPS_+0xb8>
            if (!prev) {
    800035d8:	02070863          	beqz	a4,80003608 <_ZN3TCB10quitThreadEPS_+0x140>
                prev->nextSleeping = curr->nextSleeping;
    800035dc:	0407b683          	ld	a3,64(a5)
    800035e0:	04d73023          	sd	a3,64(a4)
            if (curr->nextSleeping) {
    800035e4:	0407b703          	ld	a4,64(a5)
    800035e8:	00070a63          	beqz	a4,800035fc <_ZN3TCB10quitThreadEPS_+0x134>
                curr->nextSleeping->timeToSleep += curr->timeToSleep;
    800035ec:	0387b603          	ld	a2,56(a5)
    800035f0:	03873683          	ld	a3,56(a4)
    800035f4:	00c686b3          	add	a3,a3,a2
    800035f8:	02d73c23          	sd	a3,56(a4)
            curr->timeToSleep = 0;
    800035fc:	0207bc23          	sd	zero,56(a5)
            curr->nextSleeping = nullptr;
    80003600:	0407b023          	sd	zero,64(a5)
            break;
    80003604:	f7dff06f          	j	80003580 <_ZN3TCB10quitThreadEPS_+0xb8>
                Scheduler::setSleepingHead(curr->nextSleeping);
    80003608:	0407b683          	ld	a3,64(a5)

    static void setSleepingHead(TCB* tcb) { sleepingHead = tcb; }
    8000360c:	0000a717          	auipc	a4,0xa
    80003610:	95c73703          	ld	a4,-1700(a4) # 8000cf68 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003614:	00d73023          	sd	a3,0(a4)
    80003618:	fcdff06f          	j	800035e4 <_ZN3TCB10quitThreadEPS_+0x11c>

000000008000361c <_ZN5Riscv19returnFromInterruptEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::returnFromInterrupt() {
    8000361c:	ff010113          	addi	sp,sp,-16
    80003620:	00813423          	sd	s0,8(sp)
    80003624:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80003628:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    8000362c:	10200073          	sret
    80003630:	00813403          	ld	s0,8(sp)
    80003634:	01010113          	addi	sp,sp,16
    80003638:	00008067          	ret

000000008000363c <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    8000363c:	ff010113          	addi	sp,sp,-16
    80003640:	00113423          	sd	ra,8(sp)
    80003644:	00813023          	sd	s0,0(sp)
    80003648:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    8000364c:	ffffe097          	auipc	ra,0xffffe
    80003650:	d48080e7          	jalr	-696(ra) # 80001394 <_Z9mem_allocm>
}
    80003654:	00813083          	ld	ra,8(sp)
    80003658:	00013403          	ld	s0,0(sp)
    8000365c:	01010113          	addi	sp,sp,16
    80003660:	00008067          	ret

0000000080003664 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80003664:	ff010113          	addi	sp,sp,-16
    80003668:	00113423          	sd	ra,8(sp)
    8000366c:	00813023          	sd	s0,0(sp)
    80003670:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003674:	ffffe097          	auipc	ra,0xffffe
    80003678:	d60080e7          	jalr	-672(ra) # 800013d4 <_Z8mem_freePv>
}
    8000367c:	00813083          	ld	ra,8(sp)
    80003680:	00013403          	ld	s0,0(sp)
    80003684:	01010113          	addi	sp,sp,16
    80003688:	00008067          	ret

000000008000368c <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    8000368c:	fe010113          	addi	sp,sp,-32
    80003690:	00113c23          	sd	ra,24(sp)
    80003694:	00813823          	sd	s0,16(sp)
    80003698:	00913423          	sd	s1,8(sp)
    8000369c:	02010413          	addi	s0,sp,32
    800036a0:	00050493          	mv	s1,a0
	return new KSem(val);
    800036a4:	01800513          	li	a0,24
    800036a8:	00000097          	auipc	ra,0x0
    800036ac:	f94080e7          	jalr	-108(ra) # 8000363c <_ZN4KSemnwEm>

protected:
    void block();

    void unblock();

    800036b0:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    800036b4:	00053423          	sd	zero,8(a0)
    800036b8:	00053823          	sd	zero,16(a0)
}
    800036bc:	01813083          	ld	ra,24(sp)
    800036c0:	01013403          	ld	s0,16(sp)
    800036c4:	00813483          	ld	s1,8(sp)
    800036c8:	02010113          	addi	sp,sp,32
    800036cc:	00008067          	ret

00000000800036d0 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    800036d0:	ff010113          	addi	sp,sp,-16
    800036d4:	00113423          	sd	ra,8(sp)
    800036d8:	00813023          	sd	s0,0(sp)
    800036dc:	01010413          	addi	s0,sp,16
    static TCB* getRunning() { return running; }
    800036e0:	0000a797          	auipc	a5,0xa
    800036e4:	8707b783          	ld	a5,-1936(a5) # 8000cf50 <_GLOBAL_OFFSET_TABLE_+0x78>
    800036e8:	0007b583          	ld	a1,0(a5)
    static TCB* createThread(Body function, void* args, uint64* stack);
    800036ec:	00200793          	li	a5,2
    800036f0:	04f5ac23          	sw	a5,88(a1)
    TCB::getRunning()->setStatus(TCB::BLOCKED);
	blocked.putLast(TCB::getRunning());
    800036f4:	00850513          	addi	a0,a0,8
    800036f8:	ffffe097          	auipc	ra,0xffffe
    800036fc:	b44080e7          	jalr	-1212(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::dispatch();
    80003700:	00000097          	auipc	ra,0x0
    80003704:	b4c080e7          	jalr	-1204(ra) # 8000324c <_ZN3TCB8dispatchEv>
}
    80003708:	00813083          	ld	ra,8(sp)
    8000370c:	00013403          	ld	s0,0(sp)
    80003710:	01010113          	addi	sp,sp,16
    80003714:	00008067          	ret

0000000080003718 <_ZN4KSem4waitEv>:
	if (--val < 0) {
    80003718:	00052783          	lw	a5,0(a0)
    8000371c:	fff7879b          	addiw	a5,a5,-1
    80003720:	00f52023          	sw	a5,0(a0)
    80003724:	02079713          	slli	a4,a5,0x20
    80003728:	00074663          	bltz	a4,80003734 <_ZN4KSem4waitEv+0x1c>
	return 0;
    8000372c:	00000513          	li	a0,0
}
    80003730:	00008067          	ret
int KSem::wait() {
    80003734:	ff010113          	addi	sp,sp,-16
    80003738:	00113423          	sd	ra,8(sp)
    8000373c:	00813023          	sd	s0,0(sp)
    80003740:	01010413          	addi	s0,sp,16
		block();
    80003744:	00000097          	auipc	ra,0x0
    80003748:	f8c080e7          	jalr	-116(ra) # 800036d0 <_ZN4KSem5blockEv>
		return -1;
    8000374c:	fff00513          	li	a0,-1
}
    80003750:	00813083          	ld	ra,8(sp)
    80003754:	00013403          	ld	s0,0(sp)
    80003758:	01010113          	addi	sp,sp,16
    8000375c:	00008067          	ret

0000000080003760 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003760:	ff010113          	addi	sp,sp,-16
    80003764:	00113423          	sd	ra,8(sp)
    80003768:	00813023          	sd	s0,0(sp)
    8000376c:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003770:	00850513          	addi	a0,a0,8
    80003774:	ffffe097          	auipc	ra,0xffffe
    80003778:	b34080e7          	jalr	-1228(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
	Scheduler::put(tcb);
    8000377c:	ffffe097          	auipc	ra,0xffffe
    80003780:	1e0080e7          	jalr	480(ra) # 8000195c <_ZN9Scheduler3putEP3TCB>
}
    80003784:	00813083          	ld	ra,8(sp)
    80003788:	00013403          	ld	s0,0(sp)
    8000378c:	01010113          	addi	sp,sp,16
    80003790:	00008067          	ret

0000000080003794 <_ZN4KSem6signalEv>:
	if (val++ < 0) {
    80003794:	00052783          	lw	a5,0(a0)
    80003798:	0017871b          	addiw	a4,a5,1
    8000379c:	00e52023          	sw	a4,0(a0)
    800037a0:	0007c663          	bltz	a5,800037ac <_ZN4KSem6signalEv+0x18>
}
    800037a4:	00000513          	li	a0,0
    800037a8:	00008067          	ret
int KSem::signal() {
    800037ac:	ff010113          	addi	sp,sp,-16
    800037b0:	00113423          	sd	ra,8(sp)
    800037b4:	00813023          	sd	s0,0(sp)
    800037b8:	01010413          	addi	s0,sp,16
		unblock();
    800037bc:	00000097          	auipc	ra,0x0
    800037c0:	fa4080e7          	jalr	-92(ra) # 80003760 <_ZN4KSem7unblockEv>
}
    800037c4:	00000513          	li	a0,0
    800037c8:	00813083          	ld	ra,8(sp)
    800037cc:	00013403          	ld	s0,0(sp)
    800037d0:	01010113          	addi	sp,sp,16
    800037d4:	00008067          	ret

00000000800037d8 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    800037d8:	fe010113          	addi	sp,sp,-32
    800037dc:	00113c23          	sd	ra,24(sp)
    800037e0:	00813823          	sd	s0,16(sp)
    800037e4:	00913423          	sd	s1,8(sp)
    800037e8:	02010413          	addi	s0,sp,32
    800037ec:	00050493          	mv	s1,a0
        return front == nullptr;
    800037f0:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    800037f4:	00078e63          	beqz	a5,80003810 <_ZN4KSem8closeSemEPS_+0x38>
		TCB* tcb = handle->blocked.getFirst();
    800037f8:	00848513          	addi	a0,s1,8
    800037fc:	ffffe097          	auipc	ra,0xffffe
    80003800:	aac080e7          	jalr	-1364(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
		Scheduler::put(tcb);
    80003804:	ffffe097          	auipc	ra,0xffffe
    80003808:	158080e7          	jalr	344(ra) # 8000195c <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    8000380c:	fe5ff06f          	j	800037f0 <_ZN4KSem8closeSemEPS_+0x18>
	}
	return 0;
}
    80003810:	00000513          	li	a0,0
    80003814:	01813083          	ld	ra,24(sp)
    80003818:	01013403          	ld	s0,16(sp)
    8000381c:	00813483          	ld	s1,8(sp)
    80003820:	02010113          	addi	sp,sp,32
    80003824:	00008067          	ret

0000000080003828 <_Z13emptyFunctionPv>:
    void run() override {
        thread_dispatch();
    }
};

void emptyFunction(void*) {}
    80003828:	ff010113          	addi	sp,sp,-16
    8000382c:	00813423          	sd	s0,8(sp)
    80003830:	01010413          	addi	s0,sp,16
    80003834:	00813403          	ld	s0,8(sp)
    80003838:	01010113          	addi	sp,sp,16
    8000383c:	00008067          	ret

0000000080003840 <_Z5nit1fPv>:

void nit1f(void*) {
    80003840:	fe010113          	addi	sp,sp,-32
    80003844:	00113c23          	sd	ra,24(sp)
    80003848:	00813823          	sd	s0,16(sp)
    8000384c:	02010413          	addi	s0,sp,32
    while (true) {
        thread_t handle;
        thread_create(&handle, emptyFunction, nullptr);
    80003850:	00000613          	li	a2,0
    80003854:	00000597          	auipc	a1,0x0
    80003858:	fd458593          	addi	a1,a1,-44 # 80003828 <_Z13emptyFunctionPv>
    8000385c:	fe840513          	addi	a0,s0,-24
    80003860:	ffffe097          	auipc	ra,0xffffe
    80003864:	ba4080e7          	jalr	-1116(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    while (true) {
    80003868:	fe9ff06f          	j	80003850 <_Z5nit1fPv+0x10>

000000008000386c <_Z5nit2fPv>:
    void periodicActivation() override {
        printString("Janko\n");
    }
};

void nit2f(void* arg2) {
    8000386c:	fe010113          	addi	sp,sp,-32
    80003870:	00113c23          	sd	ra,24(sp)
    80003874:	00813823          	sd	s0,16(sp)
    80003878:	00913423          	sd	s1,8(sp)
    8000387c:	01213023          	sd	s2,0(sp)
    80003880:	02010413          	addi	s0,sp,32
    PeriodicThread* pt = new per(10);
    80003884:	02800513          	li	a0,40
    80003888:	fffff097          	auipc	ra,0xfffff
    8000388c:	41c080e7          	jalr	1052(ra) # 80002ca4 <_Znwm>
    80003890:	00050493          	mv	s1,a0
    per(time_t period) : PeriodicThread(period) {}
    80003894:	00a00593          	li	a1,10
    80003898:	00000097          	auipc	ra,0x0
    8000389c:	820080e7          	jalr	-2016(ra) # 800030b8 <_ZN14PeriodicThreadC1Em>
    800038a0:	00009797          	auipc	a5,0x9
    800038a4:	47078793          	addi	a5,a5,1136 # 8000cd10 <_ZTV3per+0x10>
    800038a8:	00f4b023          	sd	a5,0(s1)
    pt->start();
    800038ac:	00048513          	mv	a0,s1
    800038b0:	fffff097          	auipc	ra,0xfffff
    800038b4:	5ac080e7          	jalr	1452(ra) # 80002e5c <_ZN6Thread5startEv>
    time_sleep(15);
    800038b8:	00f00513          	li	a0,15
    800038bc:	ffffe097          	auipc	ra,0xffffe
    800038c0:	c4c080e7          	jalr	-948(ra) # 80001508 <_Z10time_sleepm>
    pt->terminate();
    800038c4:	00048513          	mv	a0,s1
    800038c8:	fffff097          	auipc	ra,0xfffff
    800038cc:	7d0080e7          	jalr	2000(ra) # 80003098 <_ZN14PeriodicThread9terminateEv>
    printString("\nGotova nit 2\n");
    800038d0:	00007517          	auipc	a0,0x7
    800038d4:	9c050513          	addi	a0,a0,-1600 # 8000a290 <CONSOLE_STATUS+0x280>
    800038d8:	00002097          	auipc	ra,0x2
    800038dc:	734080e7          	jalr	1844(ra) # 8000600c <_Z11printStringPKc>
}
    800038e0:	01813083          	ld	ra,24(sp)
    800038e4:	01013403          	ld	s0,16(sp)
    800038e8:	00813483          	ld	s1,8(sp)
    800038ec:	00013903          	ld	s2,0(sp)
    800038f0:	02010113          	addi	sp,sp,32
    800038f4:	00008067          	ret
    800038f8:	00050913          	mv	s2,a0
    PeriodicThread* pt = new per(10);
    800038fc:	00048513          	mv	a0,s1
    80003900:	fffff097          	auipc	ra,0xfffff
    80003904:	3f4080e7          	jalr	1012(ra) # 80002cf4 <_ZdlPv>
    80003908:	00090513          	mv	a0,s2
    8000390c:	0000b097          	auipc	ra,0xb
    80003910:	90c080e7          	jalr	-1780(ra) # 8000e218 <_Unwind_Resume>

0000000080003914 <_Z5nit3fPv>:


void nit3f(void*) {
    80003914:	fe010113          	addi	sp,sp,-32
    80003918:	00113c23          	sd	ra,24(sp)
    8000391c:	00813823          	sd	s0,16(sp)
    80003920:	00913423          	sd	s1,8(sp)
    80003924:	02010413          	addi	s0,sp,32
    80003928:	0180006f          	j	80003940 <_Z5nit3fPv+0x2c>
    char slovo;
    do {
        slovo = getc();
        putc(slovo);
        if (slovo == '\r') putc('\n');
    8000392c:	00a00513          	li	a0,10
    80003930:	ffffe097          	auipc	ra,0xffffe
    80003934:	cf8080e7          	jalr	-776(ra) # 80001628 <_Z4putcc>
    } while (slovo != '0');
    80003938:	03000793          	li	a5,48
    8000393c:	02f48263          	beq	s1,a5,80003960 <_Z5nit3fPv+0x4c>
        slovo = getc();
    80003940:	ffffe097          	auipc	ra,0xffffe
    80003944:	cc0080e7          	jalr	-832(ra) # 80001600 <_Z4getcv>
    80003948:	00050493          	mv	s1,a0
        putc(slovo);
    8000394c:	ffffe097          	auipc	ra,0xffffe
    80003950:	cdc080e7          	jalr	-804(ra) # 80001628 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    80003954:	00d00793          	li	a5,13
    80003958:	fef490e3          	bne	s1,a5,80003938 <_Z5nit3fPv+0x24>
    8000395c:	fd1ff06f          	j	8000392c <_Z5nit3fPv+0x18>

    printString("\nGotova nit3\n");
    80003960:	00007517          	auipc	a0,0x7
    80003964:	94050513          	addi	a0,a0,-1728 # 8000a2a0 <CONSOLE_STATUS+0x290>
    80003968:	00002097          	auipc	ra,0x2
    8000396c:	6a4080e7          	jalr	1700(ra) # 8000600c <_Z11printStringPKc>
}
    80003970:	01813083          	ld	ra,24(sp)
    80003974:	01013403          	ld	s0,16(sp)
    80003978:	00813483          	ld	s1,8(sp)
    8000397c:	02010113          	addi	sp,sp,32
    80003980:	00008067          	ret

0000000080003984 <_Z5main2v>:


int main2() {
    80003984:	fb010113          	addi	sp,sp,-80
    80003988:	04113423          	sd	ra,72(sp)
    8000398c:	04813023          	sd	s0,64(sp)
    80003990:	02913c23          	sd	s1,56(sp)
    80003994:	05010413          	addi	s0,sp,80
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80003998:	00009797          	auipc	a5,0x9
    8000399c:	5c87b783          	ld	a5,1480(a5) # 8000cf60 <_GLOBAL_OFFSET_TABLE_+0x88>
    800039a0:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    800039a4:	ffffe097          	auipc	ra,0xffffe
    800039a8:	2f8080e7          	jalr	760(ra) # 80001c9c <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    800039ac:	ffffe097          	auipc	ra,0xffffe
    800039b0:	d60080e7          	jalr	-672(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

    //testiranje kreiranja niti
    thread_t glavnaNit = nullptr;
    800039b4:	fc043c23          	sd	zero,-40(s0)
    thread_t nit1 = nullptr;
    800039b8:	fc043823          	sd	zero,-48(s0)
    thread_t nit2 = nullptr;
    800039bc:	fc043423          	sd	zero,-56(s0)
    thread_t nit3 = nullptr;
    800039c0:	fc043023          	sd	zero,-64(s0)
    thread_t idleNit = nullptr;
    800039c4:	fa043c23          	sd	zero,-72(s0)
    thread_t kernelConsumerThread = nullptr;
    800039c8:	fa043823          	sd	zero,-80(s0)
    thread_create(&glavnaNit, (TCB::Body)main, nullptr);
    800039cc:	00000613          	li	a2,0
    800039d0:	00009597          	auipc	a1,0x9
    800039d4:	5705b583          	ld	a1,1392(a1) # 8000cf40 <_GLOBAL_OFFSET_TABLE_+0x68>
    800039d8:	fd840513          	addi	a0,s0,-40
    800039dc:	ffffe097          	auipc	ra,0xffffe
    800039e0:	a28080e7          	jalr	-1496(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>

    800039e4:	fd843703          	ld	a4,-40(s0)
    800039e8:	00009797          	auipc	a5,0x9
    800039ec:	5687b783          	ld	a5,1384(a5) # 8000cf50 <_GLOBAL_OFFSET_TABLE_+0x78>
    800039f0:	00e7b023          	sd	a4,0(a5)
    TCB::setRunning(glavnaNit);
    thread_create(&idleNit, idle, nullptr);
    800039f4:	00000613          	li	a2,0
    800039f8:	00009597          	auipc	a1,0x9
    800039fc:	5785b583          	ld	a1,1400(a1) # 8000cf70 <_GLOBAL_OFFSET_TABLE_+0x98>
    80003a00:	fb840513          	addi	a0,s0,-72
    80003a04:	ffffe097          	auipc	ra,0xffffe
    80003a08:	a00080e7          	jalr	-1536(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    80003a0c:	00000613          	li	a2,0
    80003a10:	00009597          	auipc	a1,0x9
    80003a14:	5085b583          	ld	a1,1288(a1) # 8000cf18 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003a18:	fb040513          	addi	a0,s0,-80
    80003a1c:	ffffe097          	auipc	ra,0xffffe
    80003a20:	9e8080e7          	jalr	-1560(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>


    thread_create(&nit1, nit1f, nullptr);
    80003a24:	00000613          	li	a2,0
    80003a28:	00000597          	auipc	a1,0x0
    80003a2c:	e1858593          	addi	a1,a1,-488 # 80003840 <_Z5nit1fPv>
    80003a30:	fd040513          	addi	a0,s0,-48
    80003a34:	ffffe097          	auipc	ra,0xffffe
    80003a38:	9d0080e7          	jalr	-1584(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit2, nit2f, nullptr);
    80003a3c:	00000613          	li	a2,0
    80003a40:	00000597          	auipc	a1,0x0
    80003a44:	e2c58593          	addi	a1,a1,-468 # 8000386c <_Z5nit2fPv>
    80003a48:	fc840513          	addi	a0,s0,-56
    80003a4c:	ffffe097          	auipc	ra,0xffffe
    80003a50:	9b8080e7          	jalr	-1608(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit3, nit3f, nullptr);
    80003a54:	00000613          	li	a2,0
    80003a58:	00000597          	auipc	a1,0x0
    80003a5c:	ebc58593          	addi	a1,a1,-324 # 80003914 <_Z5nit3fPv>
    80003a60:	fc040513          	addi	a0,s0,-64
    80003a64:	ffffe097          	auipc	ra,0xffffe
    80003a68:	9a0080e7          	jalr	-1632(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::mc_sstatus(uint64 mask) {
    80003a6c:	00200493          	li	s1,2
    80003a70:	1004a073          	csrs	sstatus,s1

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    thread_join(nit1);
    80003a74:	fd043503          	ld	a0,-48(s0)
    80003a78:	ffffe097          	auipc	ra,0xffffe
    80003a7c:	a68080e7          	jalr	-1432(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit2);
    80003a80:	fc843503          	ld	a0,-56(s0)
    80003a84:	ffffe097          	auipc	ra,0xffffe
    80003a88:	a5c080e7          	jalr	-1444(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit3);
    80003a8c:	fc043503          	ld	a0,-64(s0)
    80003a90:	ffffe097          	auipc	ra,0xffffe
    80003a94:	a50080e7          	jalr	-1456(ra) # 800014e0 <_Z11thread_joinP3TCB>
    //thread_join(idleNit);

    printString("\nGotove user niti\n");
    80003a98:	00007517          	auipc	a0,0x7
    80003a9c:	81850513          	addi	a0,a0,-2024 # 8000a2b0 <CONSOLE_STATUS+0x2a0>
    80003aa0:	00002097          	auipc	ra,0x2
    80003aa4:	56c080e7          	jalr	1388(ra) # 8000600c <_Z11printStringPKc>

    printString("\nSad cu da izadjem\n");
    80003aa8:	00007517          	auipc	a0,0x7
    80003aac:	82050513          	addi	a0,a0,-2016 # 8000a2c8 <CONSOLE_STATUS+0x2b8>
    80003ab0:	00002097          	auipc	ra,0x2
    80003ab4:	55c080e7          	jalr	1372(ra) # 8000600c <_Z11printStringPKc>
    static void flush() {
    80003ab8:	04300513          	li	a0,67
        __asm__ volatile("li a0, 0x43");
    80003abc:	00000073          	ecall

inline uint64 Riscv::r_sstatus() {
    80003ac0:	1004b073          	csrc	sstatus,s1
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);


    return 0;
    80003ac4:	00000513          	li	a0,0
    80003ac8:	04813083          	ld	ra,72(sp)
    80003acc:	04013403          	ld	s0,64(sp)
    80003ad0:	03813483          	ld	s1,56(sp)
    80003ad4:	05010113          	addi	sp,sp,80
    80003ad8:	00008067          	ret

0000000080003adc <_ZN3per18periodicActivationEv>:
    void periodicActivation() override {
    80003adc:	ff010113          	addi	sp,sp,-16
    80003ae0:	00113423          	sd	ra,8(sp)
    80003ae4:	00813023          	sd	s0,0(sp)
    80003ae8:	01010413          	addi	s0,sp,16
        printString("Janko\n");
    80003aec:	00006517          	auipc	a0,0x6
    80003af0:	79c50513          	addi	a0,a0,1948 # 8000a288 <CONSOLE_STATUS+0x278>
    80003af4:	00002097          	auipc	ra,0x2
    80003af8:	518080e7          	jalr	1304(ra) # 8000600c <_Z11printStringPKc>
    }
    80003afc:	00813083          	ld	ra,8(sp)
    80003b00:	00013403          	ld	s0,0(sp)
    80003b04:	01010113          	addi	sp,sp,16
    80003b08:	00008067          	ret

0000000080003b0c <_ZN3perD1Ev>:
class per : public PeriodicThread {
    80003b0c:	ff010113          	addi	sp,sp,-16
    80003b10:	00113423          	sd	ra,8(sp)
    80003b14:	00813023          	sd	s0,0(sp)
    80003b18:	01010413          	addi	s0,sp,16
public:
    80003b1c:	00009797          	auipc	a5,0x9
    80003b20:	3f47b783          	ld	a5,1012(a5) # 8000cf10 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003b24:	01078793          	addi	a5,a5,16
    80003b28:	00f53023          	sd	a5,0(a0)
    80003b2c:	fffff097          	auipc	ra,0xfffff
    80003b30:	070080e7          	jalr	112(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80003b34:	00813083          	ld	ra,8(sp)
    80003b38:	00013403          	ld	s0,0(sp)
    80003b3c:	01010113          	addi	sp,sp,16
    80003b40:	00008067          	ret

0000000080003b44 <_ZN3perD0Ev>:
    80003b44:	fe010113          	addi	sp,sp,-32
    80003b48:	00113c23          	sd	ra,24(sp)
    80003b4c:	00813823          	sd	s0,16(sp)
    80003b50:	00913423          	sd	s1,8(sp)
    80003b54:	02010413          	addi	s0,sp,32
    80003b58:	00050493          	mv	s1,a0
    80003b5c:	00009797          	auipc	a5,0x9
    80003b60:	3b47b783          	ld	a5,948(a5) # 8000cf10 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003b64:	01078793          	addi	a5,a5,16
    80003b68:	00f53023          	sd	a5,0(a0)
    80003b6c:	fffff097          	auipc	ra,0xfffff
    80003b70:	030080e7          	jalr	48(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80003b74:	00048513          	mv	a0,s1
    80003b78:	fffff097          	auipc	ra,0xfffff
    80003b7c:	17c080e7          	jalr	380(ra) # 80002cf4 <_ZdlPv>
    80003b80:	01813083          	ld	ra,24(sp)
    80003b84:	01013403          	ld	s0,16(sp)
    80003b88:	00813483          	ld	s1,8(sp)
    80003b8c:	02010113          	addi	sp,sp,32
    80003b90:	00008067          	ret

0000000080003b94 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003b94:	fe010113          	addi	sp,sp,-32
    80003b98:	00113c23          	sd	ra,24(sp)
    80003b9c:	00813823          	sd	s0,16(sp)
    80003ba0:	00913423          	sd	s1,8(sp)
    80003ba4:	01213023          	sd	s2,0(sp)
    80003ba8:	02010413          	addi	s0,sp,32
    80003bac:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003bb0:	00000913          	li	s2,0
    80003bb4:	00c0006f          	j	80003bc0 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003bb8:	ffffe097          	auipc	ra,0xffffe
    80003bbc:	908080e7          	jalr	-1784(ra) # 800014c0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80003bc0:	ffffe097          	auipc	ra,0xffffe
    80003bc4:	a40080e7          	jalr	-1472(ra) # 80001600 <_Z4getcv>
    80003bc8:	0005059b          	sext.w	a1,a0
    80003bcc:	02d00793          	li	a5,45
    80003bd0:	02f58a63          	beq	a1,a5,80003c04 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003bd4:	0084b503          	ld	a0,8(s1)
    80003bd8:	00003097          	auipc	ra,0x3
    80003bdc:	400080e7          	jalr	1024(ra) # 80006fd8 <_ZN6Buffer3putEi>
        i++;
    80003be0:	0019071b          	addiw	a4,s2,1
    80003be4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003be8:	0004a683          	lw	a3,0(s1)
    80003bec:	0026979b          	slliw	a5,a3,0x2
    80003bf0:	00d787bb          	addw	a5,a5,a3
    80003bf4:	0017979b          	slliw	a5,a5,0x1
    80003bf8:	02f767bb          	remw	a5,a4,a5
    80003bfc:	fc0792e3          	bnez	a5,80003bc0 <_ZL16producerKeyboardPv+0x2c>
    80003c00:	fb9ff06f          	j	80003bb8 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003c04:	00100793          	li	a5,1
    80003c08:	00009717          	auipc	a4,0x9
    80003c0c:	4cf72c23          	sw	a5,1240(a4) # 8000d0e0 <_ZL9threadEnd>
    data->buffer->put('!');
    80003c10:	02100593          	li	a1,33
    80003c14:	0084b503          	ld	a0,8(s1)
    80003c18:	00003097          	auipc	ra,0x3
    80003c1c:	3c0080e7          	jalr	960(ra) # 80006fd8 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003c20:	0104b503          	ld	a0,16(s1)
    80003c24:	ffffe097          	auipc	ra,0xffffe
    80003c28:	9ac080e7          	jalr	-1620(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80003c2c:	01813083          	ld	ra,24(sp)
    80003c30:	01013403          	ld	s0,16(sp)
    80003c34:	00813483          	ld	s1,8(sp)
    80003c38:	00013903          	ld	s2,0(sp)
    80003c3c:	02010113          	addi	sp,sp,32
    80003c40:	00008067          	ret

0000000080003c44 <_ZL8producerPv>:

static void producer(void *arg) {
    80003c44:	fe010113          	addi	sp,sp,-32
    80003c48:	00113c23          	sd	ra,24(sp)
    80003c4c:	00813823          	sd	s0,16(sp)
    80003c50:	00913423          	sd	s1,8(sp)
    80003c54:	01213023          	sd	s2,0(sp)
    80003c58:	02010413          	addi	s0,sp,32
    80003c5c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003c60:	00000913          	li	s2,0
    80003c64:	00c0006f          	j	80003c70 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003c68:	ffffe097          	auipc	ra,0xffffe
    80003c6c:	858080e7          	jalr	-1960(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003c70:	00009797          	auipc	a5,0x9
    80003c74:	4707a783          	lw	a5,1136(a5) # 8000d0e0 <_ZL9threadEnd>
    80003c78:	02079e63          	bnez	a5,80003cb4 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003c7c:	0004a583          	lw	a1,0(s1)
    80003c80:	0305859b          	addiw	a1,a1,48
    80003c84:	0084b503          	ld	a0,8(s1)
    80003c88:	00003097          	auipc	ra,0x3
    80003c8c:	350080e7          	jalr	848(ra) # 80006fd8 <_ZN6Buffer3putEi>
        i++;
    80003c90:	0019071b          	addiw	a4,s2,1
    80003c94:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003c98:	0004a683          	lw	a3,0(s1)
    80003c9c:	0026979b          	slliw	a5,a3,0x2
    80003ca0:	00d787bb          	addw	a5,a5,a3
    80003ca4:	0017979b          	slliw	a5,a5,0x1
    80003ca8:	02f767bb          	remw	a5,a4,a5
    80003cac:	fc0792e3          	bnez	a5,80003c70 <_ZL8producerPv+0x2c>
    80003cb0:	fb9ff06f          	j	80003c68 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003cb4:	0104b503          	ld	a0,16(s1)
    80003cb8:	ffffe097          	auipc	ra,0xffffe
    80003cbc:	918080e7          	jalr	-1768(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80003cc0:	01813083          	ld	ra,24(sp)
    80003cc4:	01013403          	ld	s0,16(sp)
    80003cc8:	00813483          	ld	s1,8(sp)
    80003ccc:	00013903          	ld	s2,0(sp)
    80003cd0:	02010113          	addi	sp,sp,32
    80003cd4:	00008067          	ret

0000000080003cd8 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003cd8:	fd010113          	addi	sp,sp,-48
    80003cdc:	02113423          	sd	ra,40(sp)
    80003ce0:	02813023          	sd	s0,32(sp)
    80003ce4:	00913c23          	sd	s1,24(sp)
    80003ce8:	01213823          	sd	s2,16(sp)
    80003cec:	01313423          	sd	s3,8(sp)
    80003cf0:	03010413          	addi	s0,sp,48
    80003cf4:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003cf8:	00000993          	li	s3,0
    80003cfc:	01c0006f          	j	80003d18 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003d00:	ffffd097          	auipc	ra,0xffffd
    80003d04:	7c0080e7          	jalr	1984(ra) # 800014c0 <_Z15thread_dispatchv>
    80003d08:	0500006f          	j	80003d58 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003d0c:	00a00513          	li	a0,10
    80003d10:	ffffe097          	auipc	ra,0xffffe
    80003d14:	918080e7          	jalr	-1768(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    80003d18:	00009797          	auipc	a5,0x9
    80003d1c:	3c87a783          	lw	a5,968(a5) # 8000d0e0 <_ZL9threadEnd>
    80003d20:	06079063          	bnez	a5,80003d80 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003d24:	00893503          	ld	a0,8(s2)
    80003d28:	00003097          	auipc	ra,0x3
    80003d2c:	340080e7          	jalr	832(ra) # 80007068 <_ZN6Buffer3getEv>
        i++;
    80003d30:	0019849b          	addiw	s1,s3,1
    80003d34:	0004899b          	sext.w	s3,s1
        putc(key);
    80003d38:	0ff57513          	andi	a0,a0,255
    80003d3c:	ffffe097          	auipc	ra,0xffffe
    80003d40:	8ec080e7          	jalr	-1812(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003d44:	00092703          	lw	a4,0(s2)
    80003d48:	0027179b          	slliw	a5,a4,0x2
    80003d4c:	00e787bb          	addw	a5,a5,a4
    80003d50:	02f4e7bb          	remw	a5,s1,a5
    80003d54:	fa0786e3          	beqz	a5,80003d00 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003d58:	05000793          	li	a5,80
    80003d5c:	02f4e4bb          	remw	s1,s1,a5
    80003d60:	fa049ce3          	bnez	s1,80003d18 <_ZL8consumerPv+0x40>
    80003d64:	fa9ff06f          	j	80003d0c <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003d68:	00893503          	ld	a0,8(s2)
    80003d6c:	00003097          	auipc	ra,0x3
    80003d70:	2fc080e7          	jalr	764(ra) # 80007068 <_ZN6Buffer3getEv>
        putc(key);
    80003d74:	0ff57513          	andi	a0,a0,255
    80003d78:	ffffe097          	auipc	ra,0xffffe
    80003d7c:	8b0080e7          	jalr	-1872(ra) # 80001628 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003d80:	00893503          	ld	a0,8(s2)
    80003d84:	00003097          	auipc	ra,0x3
    80003d88:	370080e7          	jalr	880(ra) # 800070f4 <_ZN6Buffer6getCntEv>
    80003d8c:	fca04ee3          	bgtz	a0,80003d68 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003d90:	01093503          	ld	a0,16(s2)
    80003d94:	ffffe097          	auipc	ra,0xffffe
    80003d98:	83c080e7          	jalr	-1988(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80003d9c:	02813083          	ld	ra,40(sp)
    80003da0:	02013403          	ld	s0,32(sp)
    80003da4:	01813483          	ld	s1,24(sp)
    80003da8:	01013903          	ld	s2,16(sp)
    80003dac:	00813983          	ld	s3,8(sp)
    80003db0:	03010113          	addi	sp,sp,48
    80003db4:	00008067          	ret

0000000080003db8 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003db8:	f9010113          	addi	sp,sp,-112
    80003dbc:	06113423          	sd	ra,104(sp)
    80003dc0:	06813023          	sd	s0,96(sp)
    80003dc4:	04913c23          	sd	s1,88(sp)
    80003dc8:	05213823          	sd	s2,80(sp)
    80003dcc:	05313423          	sd	s3,72(sp)
    80003dd0:	05413023          	sd	s4,64(sp)
    80003dd4:	03513c23          	sd	s5,56(sp)
    80003dd8:	03613823          	sd	s6,48(sp)
    80003ddc:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003de0:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003de4:	00006517          	auipc	a0,0x6
    80003de8:	4fc50513          	addi	a0,a0,1276 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80003dec:	00002097          	auipc	ra,0x2
    80003df0:	220080e7          	jalr	544(ra) # 8000600c <_Z11printStringPKc>
    getString(input, 30);
    80003df4:	01e00593          	li	a1,30
    80003df8:	fa040493          	addi	s1,s0,-96
    80003dfc:	00048513          	mv	a0,s1
    80003e00:	00002097          	auipc	ra,0x2
    80003e04:	294080e7          	jalr	660(ra) # 80006094 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003e08:	00048513          	mv	a0,s1
    80003e0c:	00002097          	auipc	ra,0x2
    80003e10:	360080e7          	jalr	864(ra) # 8000616c <_Z11stringToIntPKc>
    80003e14:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003e18:	00006517          	auipc	a0,0x6
    80003e1c:	4e850513          	addi	a0,a0,1256 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80003e20:	00002097          	auipc	ra,0x2
    80003e24:	1ec080e7          	jalr	492(ra) # 8000600c <_Z11printStringPKc>
    getString(input, 30);
    80003e28:	01e00593          	li	a1,30
    80003e2c:	00048513          	mv	a0,s1
    80003e30:	00002097          	auipc	ra,0x2
    80003e34:	264080e7          	jalr	612(ra) # 80006094 <_Z9getStringPci>
    n = stringToInt(input);
    80003e38:	00048513          	mv	a0,s1
    80003e3c:	00002097          	auipc	ra,0x2
    80003e40:	330080e7          	jalr	816(ra) # 8000616c <_Z11stringToIntPKc>
    80003e44:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003e48:	00006517          	auipc	a0,0x6
    80003e4c:	4d850513          	addi	a0,a0,1240 # 8000a320 <CONSOLE_STATUS+0x310>
    80003e50:	00002097          	auipc	ra,0x2
    80003e54:	1bc080e7          	jalr	444(ra) # 8000600c <_Z11printStringPKc>
	printInt(threadNum);
    80003e58:	00000613          	li	a2,0
    80003e5c:	00a00593          	li	a1,10
    80003e60:	00090513          	mv	a0,s2
    80003e64:	00002097          	auipc	ra,0x2
    80003e68:	358080e7          	jalr	856(ra) # 800061bc <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003e6c:	00006517          	auipc	a0,0x6
    80003e70:	4cc50513          	addi	a0,a0,1228 # 8000a338 <CONSOLE_STATUS+0x328>
    80003e74:	00002097          	auipc	ra,0x2
    80003e78:	198080e7          	jalr	408(ra) # 8000600c <_Z11printStringPKc>
	printInt(n);
    80003e7c:	00000613          	li	a2,0
    80003e80:	00a00593          	li	a1,10
    80003e84:	00048513          	mv	a0,s1
    80003e88:	00002097          	auipc	ra,0x2
    80003e8c:	334080e7          	jalr	820(ra) # 800061bc <_Z8printIntiii>
    printString(".\n");
    80003e90:	00006517          	auipc	a0,0x6
    80003e94:	4c050513          	addi	a0,a0,1216 # 8000a350 <CONSOLE_STATUS+0x340>
    80003e98:	00002097          	auipc	ra,0x2
    80003e9c:	174080e7          	jalr	372(ra) # 8000600c <_Z11printStringPKc>
    if(threadNum > n) {
    80003ea0:	0324c463          	blt	s1,s2,80003ec8 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003ea4:	03205c63          	blez	s2,80003edc <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003ea8:	03800513          	li	a0,56
    80003eac:	fffff097          	auipc	ra,0xfffff
    80003eb0:	df8080e7          	jalr	-520(ra) # 80002ca4 <_Znwm>
    80003eb4:	00050a13          	mv	s4,a0
    80003eb8:	00048593          	mv	a1,s1
    80003ebc:	00003097          	auipc	ra,0x3
    80003ec0:	080080e7          	jalr	128(ra) # 80006f3c <_ZN6BufferC1Ei>
    80003ec4:	0300006f          	j	80003ef4 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003ec8:	00006517          	auipc	a0,0x6
    80003ecc:	49050513          	addi	a0,a0,1168 # 8000a358 <CONSOLE_STATUS+0x348>
    80003ed0:	00002097          	auipc	ra,0x2
    80003ed4:	13c080e7          	jalr	316(ra) # 8000600c <_Z11printStringPKc>
        return;
    80003ed8:	0140006f          	j	80003eec <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003edc:	00006517          	auipc	a0,0x6
    80003ee0:	4bc50513          	addi	a0,a0,1212 # 8000a398 <CONSOLE_STATUS+0x388>
    80003ee4:	00002097          	auipc	ra,0x2
    80003ee8:	128080e7          	jalr	296(ra) # 8000600c <_Z11printStringPKc>
        return;
    80003eec:	000b0113          	mv	sp,s6
    80003ef0:	1500006f          	j	80004040 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003ef4:	00000593          	li	a1,0
    80003ef8:	00009517          	auipc	a0,0x9
    80003efc:	1f050513          	addi	a0,a0,496 # 8000d0e8 <_ZL10waitForAll>
    80003f00:	ffffd097          	auipc	ra,0xffffd
    80003f04:	638080e7          	jalr	1592(ra) # 80001538 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003f08:	00391793          	slli	a5,s2,0x3
    80003f0c:	00f78793          	addi	a5,a5,15
    80003f10:	ff07f793          	andi	a5,a5,-16
    80003f14:	40f10133          	sub	sp,sp,a5
    80003f18:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003f1c:	0019071b          	addiw	a4,s2,1
    80003f20:	00171793          	slli	a5,a4,0x1
    80003f24:	00e787b3          	add	a5,a5,a4
    80003f28:	00379793          	slli	a5,a5,0x3
    80003f2c:	00f78793          	addi	a5,a5,15
    80003f30:	ff07f793          	andi	a5,a5,-16
    80003f34:	40f10133          	sub	sp,sp,a5
    80003f38:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003f3c:	00191613          	slli	a2,s2,0x1
    80003f40:	012607b3          	add	a5,a2,s2
    80003f44:	00379793          	slli	a5,a5,0x3
    80003f48:	00f987b3          	add	a5,s3,a5
    80003f4c:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003f50:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003f54:	00009717          	auipc	a4,0x9
    80003f58:	19473703          	ld	a4,404(a4) # 8000d0e8 <_ZL10waitForAll>
    80003f5c:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003f60:	00078613          	mv	a2,a5
    80003f64:	00000597          	auipc	a1,0x0
    80003f68:	d7458593          	addi	a1,a1,-652 # 80003cd8 <_ZL8consumerPv>
    80003f6c:	f9840513          	addi	a0,s0,-104
    80003f70:	ffffd097          	auipc	ra,0xffffd
    80003f74:	494080e7          	jalr	1172(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003f78:	00000493          	li	s1,0
    80003f7c:	0280006f          	j	80003fa4 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003f80:	00000597          	auipc	a1,0x0
    80003f84:	c1458593          	addi	a1,a1,-1004 # 80003b94 <_ZL16producerKeyboardPv>
                      data + i);
    80003f88:	00179613          	slli	a2,a5,0x1
    80003f8c:	00f60633          	add	a2,a2,a5
    80003f90:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003f94:	00c98633          	add	a2,s3,a2
    80003f98:	ffffd097          	auipc	ra,0xffffd
    80003f9c:	46c080e7          	jalr	1132(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003fa0:	0014849b          	addiw	s1,s1,1
    80003fa4:	0524d263          	bge	s1,s2,80003fe8 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003fa8:	00149793          	slli	a5,s1,0x1
    80003fac:	009787b3          	add	a5,a5,s1
    80003fb0:	00379793          	slli	a5,a5,0x3
    80003fb4:	00f987b3          	add	a5,s3,a5
    80003fb8:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003fbc:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003fc0:	00009717          	auipc	a4,0x9
    80003fc4:	12873703          	ld	a4,296(a4) # 8000d0e8 <_ZL10waitForAll>
    80003fc8:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003fcc:	00048793          	mv	a5,s1
    80003fd0:	00349513          	slli	a0,s1,0x3
    80003fd4:	00aa8533          	add	a0,s5,a0
    80003fd8:	fa9054e3          	blez	s1,80003f80 <_Z22producerConsumer_C_APIv+0x1c8>
    80003fdc:	00000597          	auipc	a1,0x0
    80003fe0:	c6858593          	addi	a1,a1,-920 # 80003c44 <_ZL8producerPv>
    80003fe4:	fa5ff06f          	j	80003f88 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003fe8:	ffffd097          	auipc	ra,0xffffd
    80003fec:	4d8080e7          	jalr	1240(ra) # 800014c0 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003ff0:	00000493          	li	s1,0
    80003ff4:	00994e63          	blt	s2,s1,80004010 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003ff8:	00009517          	auipc	a0,0x9
    80003ffc:	0f053503          	ld	a0,240(a0) # 8000d0e8 <_ZL10waitForAll>
    80004000:	ffffd097          	auipc	ra,0xffffd
    80004004:	5a0080e7          	jalr	1440(ra) # 800015a0 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80004008:	0014849b          	addiw	s1,s1,1
    8000400c:	fe9ff06f          	j	80003ff4 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80004010:	00009517          	auipc	a0,0x9
    80004014:	0d853503          	ld	a0,216(a0) # 8000d0e8 <_ZL10waitForAll>
    80004018:	ffffd097          	auipc	ra,0xffffd
    8000401c:	558080e7          	jalr	1368(ra) # 80001570 <_Z9sem_closeP4KSem>
    delete buffer;
    80004020:	000a0e63          	beqz	s4,8000403c <_Z22producerConsumer_C_APIv+0x284>
    80004024:	000a0513          	mv	a0,s4
    80004028:	00003097          	auipc	ra,0x3
    8000402c:	154080e7          	jalr	340(ra) # 8000717c <_ZN6BufferD1Ev>
    80004030:	000a0513          	mv	a0,s4
    80004034:	fffff097          	auipc	ra,0xfffff
    80004038:	cc0080e7          	jalr	-832(ra) # 80002cf4 <_ZdlPv>
    8000403c:	000b0113          	mv	sp,s6

}
    80004040:	f9040113          	addi	sp,s0,-112
    80004044:	06813083          	ld	ra,104(sp)
    80004048:	06013403          	ld	s0,96(sp)
    8000404c:	05813483          	ld	s1,88(sp)
    80004050:	05013903          	ld	s2,80(sp)
    80004054:	04813983          	ld	s3,72(sp)
    80004058:	04013a03          	ld	s4,64(sp)
    8000405c:	03813a83          	ld	s5,56(sp)
    80004060:	03013b03          	ld	s6,48(sp)
    80004064:	07010113          	addi	sp,sp,112
    80004068:	00008067          	ret
    8000406c:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80004070:	000a0513          	mv	a0,s4
    80004074:	fffff097          	auipc	ra,0xfffff
    80004078:	c80080e7          	jalr	-896(ra) # 80002cf4 <_ZdlPv>
    8000407c:	00048513          	mv	a0,s1
    80004080:	0000a097          	auipc	ra,0xa
    80004084:	198080e7          	jalr	408(ra) # 8000e218 <_Unwind_Resume>

0000000080004088 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004088:	fe010113          	addi	sp,sp,-32
    8000408c:	00113c23          	sd	ra,24(sp)
    80004090:	00813823          	sd	s0,16(sp)
    80004094:	00913423          	sd	s1,8(sp)
    80004098:	01213023          	sd	s2,0(sp)
    8000409c:	02010413          	addi	s0,sp,32
    800040a0:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800040a4:	00100793          	li	a5,1
    800040a8:	02a7f863          	bgeu	a5,a0,800040d8 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800040ac:	00a00793          	li	a5,10
    800040b0:	02f577b3          	remu	a5,a0,a5
    800040b4:	02078e63          	beqz	a5,800040f0 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800040b8:	fff48513          	addi	a0,s1,-1
    800040bc:	00000097          	auipc	ra,0x0
    800040c0:	fcc080e7          	jalr	-52(ra) # 80004088 <_ZL9fibonaccim>
    800040c4:	00050913          	mv	s2,a0
    800040c8:	ffe48513          	addi	a0,s1,-2
    800040cc:	00000097          	auipc	ra,0x0
    800040d0:	fbc080e7          	jalr	-68(ra) # 80004088 <_ZL9fibonaccim>
    800040d4:	00a90533          	add	a0,s2,a0
}
    800040d8:	01813083          	ld	ra,24(sp)
    800040dc:	01013403          	ld	s0,16(sp)
    800040e0:	00813483          	ld	s1,8(sp)
    800040e4:	00013903          	ld	s2,0(sp)
    800040e8:	02010113          	addi	sp,sp,32
    800040ec:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800040f0:	ffffd097          	auipc	ra,0xffffd
    800040f4:	3d0080e7          	jalr	976(ra) # 800014c0 <_Z15thread_dispatchv>
    800040f8:	fc1ff06f          	j	800040b8 <_ZL9fibonaccim+0x30>

00000000800040fc <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    800040fc:	fe010113          	addi	sp,sp,-32
    80004100:	00113c23          	sd	ra,24(sp)
    80004104:	00813823          	sd	s0,16(sp)
    80004108:	00913423          	sd	s1,8(sp)
    8000410c:	01213023          	sd	s2,0(sp)
    80004110:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004114:	00000913          	li	s2,0
    80004118:	0380006f          	j	80004150 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    8000411c:	ffffd097          	auipc	ra,0xffffd
    80004120:	3a4080e7          	jalr	932(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004124:	00148493          	addi	s1,s1,1
    80004128:	000027b7          	lui	a5,0x2
    8000412c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004130:	0097ee63          	bltu	a5,s1,8000414c <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004134:	00000713          	li	a4,0
    80004138:	000077b7          	lui	a5,0x7
    8000413c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004140:	fce7eee3          	bltu	a5,a4,8000411c <_ZN7WorkerA11workerBodyAEPv+0x20>
    80004144:	00170713          	addi	a4,a4,1
    80004148:	ff1ff06f          	j	80004138 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000414c:	00190913          	addi	s2,s2,1
    80004150:	00900793          	li	a5,9
    80004154:	0527e063          	bltu	a5,s2,80004194 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004158:	00006517          	auipc	a0,0x6
    8000415c:	27050513          	addi	a0,a0,624 # 8000a3c8 <CONSOLE_STATUS+0x3b8>
    80004160:	00002097          	auipc	ra,0x2
    80004164:	eac080e7          	jalr	-340(ra) # 8000600c <_Z11printStringPKc>
    80004168:	00000613          	li	a2,0
    8000416c:	00a00593          	li	a1,10
    80004170:	0009051b          	sext.w	a0,s2
    80004174:	00002097          	auipc	ra,0x2
    80004178:	048080e7          	jalr	72(ra) # 800061bc <_Z8printIntiii>
    8000417c:	00006517          	auipc	a0,0x6
    80004180:	4ac50513          	addi	a0,a0,1196 # 8000a628 <CONSOLE_STATUS+0x618>
    80004184:	00002097          	auipc	ra,0x2
    80004188:	e88080e7          	jalr	-376(ra) # 8000600c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000418c:	00000493          	li	s1,0
    80004190:	f99ff06f          	j	80004128 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80004194:	00006517          	auipc	a0,0x6
    80004198:	23c50513          	addi	a0,a0,572 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    8000419c:	00002097          	auipc	ra,0x2
    800041a0:	e70080e7          	jalr	-400(ra) # 8000600c <_Z11printStringPKc>
    finishedA = true;
    800041a4:	00100793          	li	a5,1
    800041a8:	00009717          	auipc	a4,0x9
    800041ac:	f4f70423          	sb	a5,-184(a4) # 8000d0f0 <_ZL9finishedA>
}
    800041b0:	01813083          	ld	ra,24(sp)
    800041b4:	01013403          	ld	s0,16(sp)
    800041b8:	00813483          	ld	s1,8(sp)
    800041bc:	00013903          	ld	s2,0(sp)
    800041c0:	02010113          	addi	sp,sp,32
    800041c4:	00008067          	ret

00000000800041c8 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    800041c8:	fe010113          	addi	sp,sp,-32
    800041cc:	00113c23          	sd	ra,24(sp)
    800041d0:	00813823          	sd	s0,16(sp)
    800041d4:	00913423          	sd	s1,8(sp)
    800041d8:	01213023          	sd	s2,0(sp)
    800041dc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800041e0:	00000913          	li	s2,0
    800041e4:	0380006f          	j	8000421c <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800041e8:	ffffd097          	auipc	ra,0xffffd
    800041ec:	2d8080e7          	jalr	728(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800041f0:	00148493          	addi	s1,s1,1
    800041f4:	000027b7          	lui	a5,0x2
    800041f8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800041fc:	0097ee63          	bltu	a5,s1,80004218 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004200:	00000713          	li	a4,0
    80004204:	000077b7          	lui	a5,0x7
    80004208:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000420c:	fce7eee3          	bltu	a5,a4,800041e8 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80004210:	00170713          	addi	a4,a4,1
    80004214:	ff1ff06f          	j	80004204 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004218:	00190913          	addi	s2,s2,1
    8000421c:	00f00793          	li	a5,15
    80004220:	0527e063          	bltu	a5,s2,80004260 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004224:	00006517          	auipc	a0,0x6
    80004228:	1bc50513          	addi	a0,a0,444 # 8000a3e0 <CONSOLE_STATUS+0x3d0>
    8000422c:	00002097          	auipc	ra,0x2
    80004230:	de0080e7          	jalr	-544(ra) # 8000600c <_Z11printStringPKc>
    80004234:	00000613          	li	a2,0
    80004238:	00a00593          	li	a1,10
    8000423c:	0009051b          	sext.w	a0,s2
    80004240:	00002097          	auipc	ra,0x2
    80004244:	f7c080e7          	jalr	-132(ra) # 800061bc <_Z8printIntiii>
    80004248:	00006517          	auipc	a0,0x6
    8000424c:	3e050513          	addi	a0,a0,992 # 8000a628 <CONSOLE_STATUS+0x618>
    80004250:	00002097          	auipc	ra,0x2
    80004254:	dbc080e7          	jalr	-580(ra) # 8000600c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004258:	00000493          	li	s1,0
    8000425c:	f99ff06f          	j	800041f4 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80004260:	00006517          	auipc	a0,0x6
    80004264:	18850513          	addi	a0,a0,392 # 8000a3e8 <CONSOLE_STATUS+0x3d8>
    80004268:	00002097          	auipc	ra,0x2
    8000426c:	da4080e7          	jalr	-604(ra) # 8000600c <_Z11printStringPKc>
    finishedB = true;
    80004270:	00100793          	li	a5,1
    80004274:	00009717          	auipc	a4,0x9
    80004278:	e6f70ea3          	sb	a5,-387(a4) # 8000d0f1 <_ZL9finishedB>
    thread_dispatch();
    8000427c:	ffffd097          	auipc	ra,0xffffd
    80004280:	244080e7          	jalr	580(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80004284:	01813083          	ld	ra,24(sp)
    80004288:	01013403          	ld	s0,16(sp)
    8000428c:	00813483          	ld	s1,8(sp)
    80004290:	00013903          	ld	s2,0(sp)
    80004294:	02010113          	addi	sp,sp,32
    80004298:	00008067          	ret

000000008000429c <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    8000429c:	fe010113          	addi	sp,sp,-32
    800042a0:	00113c23          	sd	ra,24(sp)
    800042a4:	00813823          	sd	s0,16(sp)
    800042a8:	00913423          	sd	s1,8(sp)
    800042ac:	01213023          	sd	s2,0(sp)
    800042b0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800042b4:	00000493          	li	s1,0
    800042b8:	0400006f          	j	800042f8 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800042bc:	00006517          	auipc	a0,0x6
    800042c0:	13c50513          	addi	a0,a0,316 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    800042c4:	00002097          	auipc	ra,0x2
    800042c8:	d48080e7          	jalr	-696(ra) # 8000600c <_Z11printStringPKc>
    800042cc:	00000613          	li	a2,0
    800042d0:	00a00593          	li	a1,10
    800042d4:	00048513          	mv	a0,s1
    800042d8:	00002097          	auipc	ra,0x2
    800042dc:	ee4080e7          	jalr	-284(ra) # 800061bc <_Z8printIntiii>
    800042e0:	00006517          	auipc	a0,0x6
    800042e4:	34850513          	addi	a0,a0,840 # 8000a628 <CONSOLE_STATUS+0x618>
    800042e8:	00002097          	auipc	ra,0x2
    800042ec:	d24080e7          	jalr	-732(ra) # 8000600c <_Z11printStringPKc>
    for (; i < 3; i++) {
    800042f0:	0014849b          	addiw	s1,s1,1
    800042f4:	0ff4f493          	andi	s1,s1,255
    800042f8:	00200793          	li	a5,2
    800042fc:	fc97f0e3          	bgeu	a5,s1,800042bc <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80004300:	00006517          	auipc	a0,0x6
    80004304:	10050513          	addi	a0,a0,256 # 8000a400 <CONSOLE_STATUS+0x3f0>
    80004308:	00002097          	auipc	ra,0x2
    8000430c:	d04080e7          	jalr	-764(ra) # 8000600c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004310:	00700313          	li	t1,7
    thread_dispatch();
    80004314:	ffffd097          	auipc	ra,0xffffd
    80004318:	1ac080e7          	jalr	428(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000431c:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80004320:	00006517          	auipc	a0,0x6
    80004324:	0f050513          	addi	a0,a0,240 # 8000a410 <CONSOLE_STATUS+0x400>
    80004328:	00002097          	auipc	ra,0x2
    8000432c:	ce4080e7          	jalr	-796(ra) # 8000600c <_Z11printStringPKc>
    80004330:	00000613          	li	a2,0
    80004334:	00a00593          	li	a1,10
    80004338:	0009051b          	sext.w	a0,s2
    8000433c:	00002097          	auipc	ra,0x2
    80004340:	e80080e7          	jalr	-384(ra) # 800061bc <_Z8printIntiii>
    80004344:	00006517          	auipc	a0,0x6
    80004348:	2e450513          	addi	a0,a0,740 # 8000a628 <CONSOLE_STATUS+0x618>
    8000434c:	00002097          	auipc	ra,0x2
    80004350:	cc0080e7          	jalr	-832(ra) # 8000600c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80004354:	00c00513          	li	a0,12
    80004358:	00000097          	auipc	ra,0x0
    8000435c:	d30080e7          	jalr	-720(ra) # 80004088 <_ZL9fibonaccim>
    80004360:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004364:	00006517          	auipc	a0,0x6
    80004368:	0b450513          	addi	a0,a0,180 # 8000a418 <CONSOLE_STATUS+0x408>
    8000436c:	00002097          	auipc	ra,0x2
    80004370:	ca0080e7          	jalr	-864(ra) # 8000600c <_Z11printStringPKc>
    80004374:	00000613          	li	a2,0
    80004378:	00a00593          	li	a1,10
    8000437c:	0009051b          	sext.w	a0,s2
    80004380:	00002097          	auipc	ra,0x2
    80004384:	e3c080e7          	jalr	-452(ra) # 800061bc <_Z8printIntiii>
    80004388:	00006517          	auipc	a0,0x6
    8000438c:	2a050513          	addi	a0,a0,672 # 8000a628 <CONSOLE_STATUS+0x618>
    80004390:	00002097          	auipc	ra,0x2
    80004394:	c7c080e7          	jalr	-900(ra) # 8000600c <_Z11printStringPKc>
    80004398:	0400006f          	j	800043d8 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000439c:	00006517          	auipc	a0,0x6
    800043a0:	05c50513          	addi	a0,a0,92 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    800043a4:	00002097          	auipc	ra,0x2
    800043a8:	c68080e7          	jalr	-920(ra) # 8000600c <_Z11printStringPKc>
    800043ac:	00000613          	li	a2,0
    800043b0:	00a00593          	li	a1,10
    800043b4:	00048513          	mv	a0,s1
    800043b8:	00002097          	auipc	ra,0x2
    800043bc:	e04080e7          	jalr	-508(ra) # 800061bc <_Z8printIntiii>
    800043c0:	00006517          	auipc	a0,0x6
    800043c4:	26850513          	addi	a0,a0,616 # 8000a628 <CONSOLE_STATUS+0x618>
    800043c8:	00002097          	auipc	ra,0x2
    800043cc:	c44080e7          	jalr	-956(ra) # 8000600c <_Z11printStringPKc>
    for (; i < 6; i++) {
    800043d0:	0014849b          	addiw	s1,s1,1
    800043d4:	0ff4f493          	andi	s1,s1,255
    800043d8:	00500793          	li	a5,5
    800043dc:	fc97f0e3          	bgeu	a5,s1,8000439c <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    800043e0:	00006517          	auipc	a0,0x6
    800043e4:	04850513          	addi	a0,a0,72 # 8000a428 <CONSOLE_STATUS+0x418>
    800043e8:	00002097          	auipc	ra,0x2
    800043ec:	c24080e7          	jalr	-988(ra) # 8000600c <_Z11printStringPKc>
    finishedC = true;
    800043f0:	00100793          	li	a5,1
    800043f4:	00009717          	auipc	a4,0x9
    800043f8:	cef70f23          	sb	a5,-770(a4) # 8000d0f2 <_ZL9finishedC>
    thread_dispatch();
    800043fc:	ffffd097          	auipc	ra,0xffffd
    80004400:	0c4080e7          	jalr	196(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80004404:	01813083          	ld	ra,24(sp)
    80004408:	01013403          	ld	s0,16(sp)
    8000440c:	00813483          	ld	s1,8(sp)
    80004410:	00013903          	ld	s2,0(sp)
    80004414:	02010113          	addi	sp,sp,32
    80004418:	00008067          	ret

000000008000441c <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    8000441c:	fe010113          	addi	sp,sp,-32
    80004420:	00113c23          	sd	ra,24(sp)
    80004424:	00813823          	sd	s0,16(sp)
    80004428:	00913423          	sd	s1,8(sp)
    8000442c:	01213023          	sd	s2,0(sp)
    80004430:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004434:	00a00493          	li	s1,10
    80004438:	0400006f          	j	80004478 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000443c:	00006517          	auipc	a0,0x6
    80004440:	ffc50513          	addi	a0,a0,-4 # 8000a438 <CONSOLE_STATUS+0x428>
    80004444:	00002097          	auipc	ra,0x2
    80004448:	bc8080e7          	jalr	-1080(ra) # 8000600c <_Z11printStringPKc>
    8000444c:	00000613          	li	a2,0
    80004450:	00a00593          	li	a1,10
    80004454:	00048513          	mv	a0,s1
    80004458:	00002097          	auipc	ra,0x2
    8000445c:	d64080e7          	jalr	-668(ra) # 800061bc <_Z8printIntiii>
    80004460:	00006517          	auipc	a0,0x6
    80004464:	1c850513          	addi	a0,a0,456 # 8000a628 <CONSOLE_STATUS+0x618>
    80004468:	00002097          	auipc	ra,0x2
    8000446c:	ba4080e7          	jalr	-1116(ra) # 8000600c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004470:	0014849b          	addiw	s1,s1,1
    80004474:	0ff4f493          	andi	s1,s1,255
    80004478:	00c00793          	li	a5,12
    8000447c:	fc97f0e3          	bgeu	a5,s1,8000443c <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80004480:	00006517          	auipc	a0,0x6
    80004484:	fc050513          	addi	a0,a0,-64 # 8000a440 <CONSOLE_STATUS+0x430>
    80004488:	00002097          	auipc	ra,0x2
    8000448c:	b84080e7          	jalr	-1148(ra) # 8000600c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004490:	00500313          	li	t1,5
    thread_dispatch();
    80004494:	ffffd097          	auipc	ra,0xffffd
    80004498:	02c080e7          	jalr	44(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000449c:	01000513          	li	a0,16
    800044a0:	00000097          	auipc	ra,0x0
    800044a4:	be8080e7          	jalr	-1048(ra) # 80004088 <_ZL9fibonaccim>
    800044a8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800044ac:	00006517          	auipc	a0,0x6
    800044b0:	fa450513          	addi	a0,a0,-92 # 8000a450 <CONSOLE_STATUS+0x440>
    800044b4:	00002097          	auipc	ra,0x2
    800044b8:	b58080e7          	jalr	-1192(ra) # 8000600c <_Z11printStringPKc>
    800044bc:	00000613          	li	a2,0
    800044c0:	00a00593          	li	a1,10
    800044c4:	0009051b          	sext.w	a0,s2
    800044c8:	00002097          	auipc	ra,0x2
    800044cc:	cf4080e7          	jalr	-780(ra) # 800061bc <_Z8printIntiii>
    800044d0:	00006517          	auipc	a0,0x6
    800044d4:	15850513          	addi	a0,a0,344 # 8000a628 <CONSOLE_STATUS+0x618>
    800044d8:	00002097          	auipc	ra,0x2
    800044dc:	b34080e7          	jalr	-1228(ra) # 8000600c <_Z11printStringPKc>
    800044e0:	0400006f          	j	80004520 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800044e4:	00006517          	auipc	a0,0x6
    800044e8:	f5450513          	addi	a0,a0,-172 # 8000a438 <CONSOLE_STATUS+0x428>
    800044ec:	00002097          	auipc	ra,0x2
    800044f0:	b20080e7          	jalr	-1248(ra) # 8000600c <_Z11printStringPKc>
    800044f4:	00000613          	li	a2,0
    800044f8:	00a00593          	li	a1,10
    800044fc:	00048513          	mv	a0,s1
    80004500:	00002097          	auipc	ra,0x2
    80004504:	cbc080e7          	jalr	-836(ra) # 800061bc <_Z8printIntiii>
    80004508:	00006517          	auipc	a0,0x6
    8000450c:	12050513          	addi	a0,a0,288 # 8000a628 <CONSOLE_STATUS+0x618>
    80004510:	00002097          	auipc	ra,0x2
    80004514:	afc080e7          	jalr	-1284(ra) # 8000600c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004518:	0014849b          	addiw	s1,s1,1
    8000451c:	0ff4f493          	andi	s1,s1,255
    80004520:	00f00793          	li	a5,15
    80004524:	fc97f0e3          	bgeu	a5,s1,800044e4 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004528:	00006517          	auipc	a0,0x6
    8000452c:	f3850513          	addi	a0,a0,-200 # 8000a460 <CONSOLE_STATUS+0x450>
    80004530:	00002097          	auipc	ra,0x2
    80004534:	adc080e7          	jalr	-1316(ra) # 8000600c <_Z11printStringPKc>
    finishedD = true;
    80004538:	00100793          	li	a5,1
    8000453c:	00009717          	auipc	a4,0x9
    80004540:	baf70ba3          	sb	a5,-1097(a4) # 8000d0f3 <_ZL9finishedD>
    thread_dispatch();
    80004544:	ffffd097          	auipc	ra,0xffffd
    80004548:	f7c080e7          	jalr	-132(ra) # 800014c0 <_Z15thread_dispatchv>
}
    8000454c:	01813083          	ld	ra,24(sp)
    80004550:	01013403          	ld	s0,16(sp)
    80004554:	00813483          	ld	s1,8(sp)
    80004558:	00013903          	ld	s2,0(sp)
    8000455c:	02010113          	addi	sp,sp,32
    80004560:	00008067          	ret

0000000080004564 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80004564:	fc010113          	addi	sp,sp,-64
    80004568:	02113c23          	sd	ra,56(sp)
    8000456c:	02813823          	sd	s0,48(sp)
    80004570:	02913423          	sd	s1,40(sp)
    80004574:	03213023          	sd	s2,32(sp)
    80004578:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    8000457c:	02000513          	li	a0,32
    80004580:	ffffe097          	auipc	ra,0xffffe
    80004584:	724080e7          	jalr	1828(ra) # 80002ca4 <_Znwm>
    80004588:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    8000458c:	fffff097          	auipc	ra,0xfffff
    80004590:	a00080e7          	jalr	-1536(ra) # 80002f8c <_ZN6ThreadC1Ev>
    80004594:	00008797          	auipc	a5,0x8
    80004598:	7ac78793          	addi	a5,a5,1964 # 8000cd40 <_ZTV7WorkerA+0x10>
    8000459c:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    800045a0:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    800045a4:	00006517          	auipc	a0,0x6
    800045a8:	ecc50513          	addi	a0,a0,-308 # 8000a470 <CONSOLE_STATUS+0x460>
    800045ac:	00002097          	auipc	ra,0x2
    800045b0:	a60080e7          	jalr	-1440(ra) # 8000600c <_Z11printStringPKc>

    threads[1] = new WorkerB();
    800045b4:	02000513          	li	a0,32
    800045b8:	ffffe097          	auipc	ra,0xffffe
    800045bc:	6ec080e7          	jalr	1772(ra) # 80002ca4 <_Znwm>
    800045c0:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    800045c4:	fffff097          	auipc	ra,0xfffff
    800045c8:	9c8080e7          	jalr	-1592(ra) # 80002f8c <_ZN6ThreadC1Ev>
    800045cc:	00008797          	auipc	a5,0x8
    800045d0:	79c78793          	addi	a5,a5,1948 # 8000cd68 <_ZTV7WorkerB+0x10>
    800045d4:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    800045d8:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800045dc:	00006517          	auipc	a0,0x6
    800045e0:	eac50513          	addi	a0,a0,-340 # 8000a488 <CONSOLE_STATUS+0x478>
    800045e4:	00002097          	auipc	ra,0x2
    800045e8:	a28080e7          	jalr	-1496(ra) # 8000600c <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800045ec:	02000513          	li	a0,32
    800045f0:	ffffe097          	auipc	ra,0xffffe
    800045f4:	6b4080e7          	jalr	1716(ra) # 80002ca4 <_Znwm>
    800045f8:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800045fc:	fffff097          	auipc	ra,0xfffff
    80004600:	990080e7          	jalr	-1648(ra) # 80002f8c <_ZN6ThreadC1Ev>
    80004604:	00008797          	auipc	a5,0x8
    80004608:	78c78793          	addi	a5,a5,1932 # 8000cd90 <_ZTV7WorkerC+0x10>
    8000460c:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004610:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80004614:	00006517          	auipc	a0,0x6
    80004618:	e8c50513          	addi	a0,a0,-372 # 8000a4a0 <CONSOLE_STATUS+0x490>
    8000461c:	00002097          	auipc	ra,0x2
    80004620:	9f0080e7          	jalr	-1552(ra) # 8000600c <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004624:	02000513          	li	a0,32
    80004628:	ffffe097          	auipc	ra,0xffffe
    8000462c:	67c080e7          	jalr	1660(ra) # 80002ca4 <_Znwm>
    80004630:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004634:	fffff097          	auipc	ra,0xfffff
    80004638:	958080e7          	jalr	-1704(ra) # 80002f8c <_ZN6ThreadC1Ev>
    8000463c:	00008797          	auipc	a5,0x8
    80004640:	77c78793          	addi	a5,a5,1916 # 8000cdb8 <_ZTV7WorkerD+0x10>
    80004644:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004648:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    8000464c:	00006517          	auipc	a0,0x6
    80004650:	e6c50513          	addi	a0,a0,-404 # 8000a4b8 <CONSOLE_STATUS+0x4a8>
    80004654:	00002097          	auipc	ra,0x2
    80004658:	9b8080e7          	jalr	-1608(ra) # 8000600c <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    8000465c:	00000493          	li	s1,0
    80004660:	00300793          	li	a5,3
    80004664:	0297c663          	blt	a5,s1,80004690 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004668:	00349793          	slli	a5,s1,0x3
    8000466c:	fe040713          	addi	a4,s0,-32
    80004670:	00f707b3          	add	a5,a4,a5
    80004674:	fe07b503          	ld	a0,-32(a5)
    80004678:	ffffe097          	auipc	ra,0xffffe
    8000467c:	7e4080e7          	jalr	2020(ra) # 80002e5c <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80004680:	0014849b          	addiw	s1,s1,1
    80004684:	fddff06f          	j	80004660 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004688:	fffff097          	auipc	ra,0xfffff
    8000468c:	848080e7          	jalr	-1976(ra) # 80002ed0 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004690:	00009797          	auipc	a5,0x9
    80004694:	a607c783          	lbu	a5,-1440(a5) # 8000d0f0 <_ZL9finishedA>
    80004698:	fe0788e3          	beqz	a5,80004688 <_Z20Threads_CPP_API_testv+0x124>
    8000469c:	00009797          	auipc	a5,0x9
    800046a0:	a557c783          	lbu	a5,-1451(a5) # 8000d0f1 <_ZL9finishedB>
    800046a4:	fe0782e3          	beqz	a5,80004688 <_Z20Threads_CPP_API_testv+0x124>
    800046a8:	00009797          	auipc	a5,0x9
    800046ac:	a4a7c783          	lbu	a5,-1462(a5) # 8000d0f2 <_ZL9finishedC>
    800046b0:	fc078ce3          	beqz	a5,80004688 <_Z20Threads_CPP_API_testv+0x124>
    800046b4:	00009797          	auipc	a5,0x9
    800046b8:	a3f7c783          	lbu	a5,-1473(a5) # 8000d0f3 <_ZL9finishedD>
    800046bc:	fc0786e3          	beqz	a5,80004688 <_Z20Threads_CPP_API_testv+0x124>
    800046c0:	fc040493          	addi	s1,s0,-64
    800046c4:	0080006f          	j	800046cc <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    800046c8:	00848493          	addi	s1,s1,8
    800046cc:	fe040793          	addi	a5,s0,-32
    800046d0:	08f48663          	beq	s1,a5,8000475c <_Z20Threads_CPP_API_testv+0x1f8>
    800046d4:	0004b503          	ld	a0,0(s1)
		delete thread;
    800046d8:	fe0508e3          	beqz	a0,800046c8 <_Z20Threads_CPP_API_testv+0x164>
    800046dc:	00053783          	ld	a5,0(a0)
    800046e0:	0087b783          	ld	a5,8(a5)
    800046e4:	000780e7          	jalr	a5
    800046e8:	fe1ff06f          	j	800046c8 <_Z20Threads_CPP_API_testv+0x164>
    800046ec:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800046f0:	00048513          	mv	a0,s1
    800046f4:	ffffe097          	auipc	ra,0xffffe
    800046f8:	600080e7          	jalr	1536(ra) # 80002cf4 <_ZdlPv>
    800046fc:	00090513          	mv	a0,s2
    80004700:	0000a097          	auipc	ra,0xa
    80004704:	b18080e7          	jalr	-1256(ra) # 8000e218 <_Unwind_Resume>
    80004708:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    8000470c:	00048513          	mv	a0,s1
    80004710:	ffffe097          	auipc	ra,0xffffe
    80004714:	5e4080e7          	jalr	1508(ra) # 80002cf4 <_ZdlPv>
    80004718:	00090513          	mv	a0,s2
    8000471c:	0000a097          	auipc	ra,0xa
    80004720:	afc080e7          	jalr	-1284(ra) # 8000e218 <_Unwind_Resume>
    80004724:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004728:	00048513          	mv	a0,s1
    8000472c:	ffffe097          	auipc	ra,0xffffe
    80004730:	5c8080e7          	jalr	1480(ra) # 80002cf4 <_ZdlPv>
    80004734:	00090513          	mv	a0,s2
    80004738:	0000a097          	auipc	ra,0xa
    8000473c:	ae0080e7          	jalr	-1312(ra) # 8000e218 <_Unwind_Resume>
    80004740:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004744:	00048513          	mv	a0,s1
    80004748:	ffffe097          	auipc	ra,0xffffe
    8000474c:	5ac080e7          	jalr	1452(ra) # 80002cf4 <_ZdlPv>
    80004750:	00090513          	mv	a0,s2
    80004754:	0000a097          	auipc	ra,0xa
    80004758:	ac4080e7          	jalr	-1340(ra) # 8000e218 <_Unwind_Resume>
	}
}
    8000475c:	03813083          	ld	ra,56(sp)
    80004760:	03013403          	ld	s0,48(sp)
    80004764:	02813483          	ld	s1,40(sp)
    80004768:	02013903          	ld	s2,32(sp)
    8000476c:	04010113          	addi	sp,sp,64
    80004770:	00008067          	ret

0000000080004774 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004774:	ff010113          	addi	sp,sp,-16
    80004778:	00113423          	sd	ra,8(sp)
    8000477c:	00813023          	sd	s0,0(sp)
    80004780:	01010413          	addi	s0,sp,16
    80004784:	00008797          	auipc	a5,0x8
    80004788:	5bc78793          	addi	a5,a5,1468 # 8000cd40 <_ZTV7WorkerA+0x10>
    8000478c:	00f53023          	sd	a5,0(a0)
    80004790:	ffffe097          	auipc	ra,0xffffe
    80004794:	40c080e7          	jalr	1036(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80004798:	00813083          	ld	ra,8(sp)
    8000479c:	00013403          	ld	s0,0(sp)
    800047a0:	01010113          	addi	sp,sp,16
    800047a4:	00008067          	ret

00000000800047a8 <_ZN7WorkerAD0Ev>:
    800047a8:	fe010113          	addi	sp,sp,-32
    800047ac:	00113c23          	sd	ra,24(sp)
    800047b0:	00813823          	sd	s0,16(sp)
    800047b4:	00913423          	sd	s1,8(sp)
    800047b8:	02010413          	addi	s0,sp,32
    800047bc:	00050493          	mv	s1,a0
    800047c0:	00008797          	auipc	a5,0x8
    800047c4:	58078793          	addi	a5,a5,1408 # 8000cd40 <_ZTV7WorkerA+0x10>
    800047c8:	00f53023          	sd	a5,0(a0)
    800047cc:	ffffe097          	auipc	ra,0xffffe
    800047d0:	3d0080e7          	jalr	976(ra) # 80002b9c <_ZN6ThreadD1Ev>
    800047d4:	00048513          	mv	a0,s1
    800047d8:	ffffe097          	auipc	ra,0xffffe
    800047dc:	51c080e7          	jalr	1308(ra) # 80002cf4 <_ZdlPv>
    800047e0:	01813083          	ld	ra,24(sp)
    800047e4:	01013403          	ld	s0,16(sp)
    800047e8:	00813483          	ld	s1,8(sp)
    800047ec:	02010113          	addi	sp,sp,32
    800047f0:	00008067          	ret

00000000800047f4 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800047f4:	ff010113          	addi	sp,sp,-16
    800047f8:	00113423          	sd	ra,8(sp)
    800047fc:	00813023          	sd	s0,0(sp)
    80004800:	01010413          	addi	s0,sp,16
    80004804:	00008797          	auipc	a5,0x8
    80004808:	56478793          	addi	a5,a5,1380 # 8000cd68 <_ZTV7WorkerB+0x10>
    8000480c:	00f53023          	sd	a5,0(a0)
    80004810:	ffffe097          	auipc	ra,0xffffe
    80004814:	38c080e7          	jalr	908(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80004818:	00813083          	ld	ra,8(sp)
    8000481c:	00013403          	ld	s0,0(sp)
    80004820:	01010113          	addi	sp,sp,16
    80004824:	00008067          	ret

0000000080004828 <_ZN7WorkerBD0Ev>:
    80004828:	fe010113          	addi	sp,sp,-32
    8000482c:	00113c23          	sd	ra,24(sp)
    80004830:	00813823          	sd	s0,16(sp)
    80004834:	00913423          	sd	s1,8(sp)
    80004838:	02010413          	addi	s0,sp,32
    8000483c:	00050493          	mv	s1,a0
    80004840:	00008797          	auipc	a5,0x8
    80004844:	52878793          	addi	a5,a5,1320 # 8000cd68 <_ZTV7WorkerB+0x10>
    80004848:	00f53023          	sd	a5,0(a0)
    8000484c:	ffffe097          	auipc	ra,0xffffe
    80004850:	350080e7          	jalr	848(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80004854:	00048513          	mv	a0,s1
    80004858:	ffffe097          	auipc	ra,0xffffe
    8000485c:	49c080e7          	jalr	1180(ra) # 80002cf4 <_ZdlPv>
    80004860:	01813083          	ld	ra,24(sp)
    80004864:	01013403          	ld	s0,16(sp)
    80004868:	00813483          	ld	s1,8(sp)
    8000486c:	02010113          	addi	sp,sp,32
    80004870:	00008067          	ret

0000000080004874 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004874:	ff010113          	addi	sp,sp,-16
    80004878:	00113423          	sd	ra,8(sp)
    8000487c:	00813023          	sd	s0,0(sp)
    80004880:	01010413          	addi	s0,sp,16
    80004884:	00008797          	auipc	a5,0x8
    80004888:	50c78793          	addi	a5,a5,1292 # 8000cd90 <_ZTV7WorkerC+0x10>
    8000488c:	00f53023          	sd	a5,0(a0)
    80004890:	ffffe097          	auipc	ra,0xffffe
    80004894:	30c080e7          	jalr	780(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80004898:	00813083          	ld	ra,8(sp)
    8000489c:	00013403          	ld	s0,0(sp)
    800048a0:	01010113          	addi	sp,sp,16
    800048a4:	00008067          	ret

00000000800048a8 <_ZN7WorkerCD0Ev>:
    800048a8:	fe010113          	addi	sp,sp,-32
    800048ac:	00113c23          	sd	ra,24(sp)
    800048b0:	00813823          	sd	s0,16(sp)
    800048b4:	00913423          	sd	s1,8(sp)
    800048b8:	02010413          	addi	s0,sp,32
    800048bc:	00050493          	mv	s1,a0
    800048c0:	00008797          	auipc	a5,0x8
    800048c4:	4d078793          	addi	a5,a5,1232 # 8000cd90 <_ZTV7WorkerC+0x10>
    800048c8:	00f53023          	sd	a5,0(a0)
    800048cc:	ffffe097          	auipc	ra,0xffffe
    800048d0:	2d0080e7          	jalr	720(ra) # 80002b9c <_ZN6ThreadD1Ev>
    800048d4:	00048513          	mv	a0,s1
    800048d8:	ffffe097          	auipc	ra,0xffffe
    800048dc:	41c080e7          	jalr	1052(ra) # 80002cf4 <_ZdlPv>
    800048e0:	01813083          	ld	ra,24(sp)
    800048e4:	01013403          	ld	s0,16(sp)
    800048e8:	00813483          	ld	s1,8(sp)
    800048ec:	02010113          	addi	sp,sp,32
    800048f0:	00008067          	ret

00000000800048f4 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800048f4:	ff010113          	addi	sp,sp,-16
    800048f8:	00113423          	sd	ra,8(sp)
    800048fc:	00813023          	sd	s0,0(sp)
    80004900:	01010413          	addi	s0,sp,16
    80004904:	00008797          	auipc	a5,0x8
    80004908:	4b478793          	addi	a5,a5,1204 # 8000cdb8 <_ZTV7WorkerD+0x10>
    8000490c:	00f53023          	sd	a5,0(a0)
    80004910:	ffffe097          	auipc	ra,0xffffe
    80004914:	28c080e7          	jalr	652(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80004918:	00813083          	ld	ra,8(sp)
    8000491c:	00013403          	ld	s0,0(sp)
    80004920:	01010113          	addi	sp,sp,16
    80004924:	00008067          	ret

0000000080004928 <_ZN7WorkerDD0Ev>:
    80004928:	fe010113          	addi	sp,sp,-32
    8000492c:	00113c23          	sd	ra,24(sp)
    80004930:	00813823          	sd	s0,16(sp)
    80004934:	00913423          	sd	s1,8(sp)
    80004938:	02010413          	addi	s0,sp,32
    8000493c:	00050493          	mv	s1,a0
    80004940:	00008797          	auipc	a5,0x8
    80004944:	47878793          	addi	a5,a5,1144 # 8000cdb8 <_ZTV7WorkerD+0x10>
    80004948:	00f53023          	sd	a5,0(a0)
    8000494c:	ffffe097          	auipc	ra,0xffffe
    80004950:	250080e7          	jalr	592(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80004954:	00048513          	mv	a0,s1
    80004958:	ffffe097          	auipc	ra,0xffffe
    8000495c:	39c080e7          	jalr	924(ra) # 80002cf4 <_ZdlPv>
    80004960:	01813083          	ld	ra,24(sp)
    80004964:	01013403          	ld	s0,16(sp)
    80004968:	00813483          	ld	s1,8(sp)
    8000496c:	02010113          	addi	sp,sp,32
    80004970:	00008067          	ret

0000000080004974 <_ZN7WorkerA3runEv>:
    void run() override {
    80004974:	ff010113          	addi	sp,sp,-16
    80004978:	00113423          	sd	ra,8(sp)
    8000497c:	00813023          	sd	s0,0(sp)
    80004980:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004984:	00000593          	li	a1,0
    80004988:	fffff097          	auipc	ra,0xfffff
    8000498c:	774080e7          	jalr	1908(ra) # 800040fc <_ZN7WorkerA11workerBodyAEPv>
    }
    80004990:	00813083          	ld	ra,8(sp)
    80004994:	00013403          	ld	s0,0(sp)
    80004998:	01010113          	addi	sp,sp,16
    8000499c:	00008067          	ret

00000000800049a0 <_ZN7WorkerB3runEv>:
    void run() override {
    800049a0:	ff010113          	addi	sp,sp,-16
    800049a4:	00113423          	sd	ra,8(sp)
    800049a8:	00813023          	sd	s0,0(sp)
    800049ac:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    800049b0:	00000593          	li	a1,0
    800049b4:	00000097          	auipc	ra,0x0
    800049b8:	814080e7          	jalr	-2028(ra) # 800041c8 <_ZN7WorkerB11workerBodyBEPv>
    }
    800049bc:	00813083          	ld	ra,8(sp)
    800049c0:	00013403          	ld	s0,0(sp)
    800049c4:	01010113          	addi	sp,sp,16
    800049c8:	00008067          	ret

00000000800049cc <_ZN7WorkerC3runEv>:
    void run() override {
    800049cc:	ff010113          	addi	sp,sp,-16
    800049d0:	00113423          	sd	ra,8(sp)
    800049d4:	00813023          	sd	s0,0(sp)
    800049d8:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800049dc:	00000593          	li	a1,0
    800049e0:	00000097          	auipc	ra,0x0
    800049e4:	8bc080e7          	jalr	-1860(ra) # 8000429c <_ZN7WorkerC11workerBodyCEPv>
    }
    800049e8:	00813083          	ld	ra,8(sp)
    800049ec:	00013403          	ld	s0,0(sp)
    800049f0:	01010113          	addi	sp,sp,16
    800049f4:	00008067          	ret

00000000800049f8 <_ZN7WorkerD3runEv>:
    void run() override {
    800049f8:	ff010113          	addi	sp,sp,-16
    800049fc:	00113423          	sd	ra,8(sp)
    80004a00:	00813023          	sd	s0,0(sp)
    80004a04:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004a08:	00000593          	li	a1,0
    80004a0c:	00000097          	auipc	ra,0x0
    80004a10:	a10080e7          	jalr	-1520(ra) # 8000441c <_ZN7WorkerD11workerBodyDEPv>
    }
    80004a14:	00813083          	ld	ra,8(sp)
    80004a18:	00013403          	ld	s0,0(sp)
    80004a1c:	01010113          	addi	sp,sp,16
    80004a20:	00008067          	ret

0000000080004a24 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004a24:	f8010113          	addi	sp,sp,-128
    80004a28:	06113c23          	sd	ra,120(sp)
    80004a2c:	06813823          	sd	s0,112(sp)
    80004a30:	06913423          	sd	s1,104(sp)
    80004a34:	07213023          	sd	s2,96(sp)
    80004a38:	05313c23          	sd	s3,88(sp)
    80004a3c:	05413823          	sd	s4,80(sp)
    80004a40:	05513423          	sd	s5,72(sp)
    80004a44:	05613023          	sd	s6,64(sp)
    80004a48:	03713c23          	sd	s7,56(sp)
    80004a4c:	03813823          	sd	s8,48(sp)
    80004a50:	03913423          	sd	s9,40(sp)
    80004a54:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004a58:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004a5c:	00006517          	auipc	a0,0x6
    80004a60:	88450513          	addi	a0,a0,-1916 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80004a64:	00001097          	auipc	ra,0x1
    80004a68:	5a8080e7          	jalr	1448(ra) # 8000600c <_Z11printStringPKc>
    getString(input, 30);
    80004a6c:	01e00593          	li	a1,30
    80004a70:	f8040493          	addi	s1,s0,-128
    80004a74:	00048513          	mv	a0,s1
    80004a78:	00001097          	auipc	ra,0x1
    80004a7c:	61c080e7          	jalr	1564(ra) # 80006094 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004a80:	00048513          	mv	a0,s1
    80004a84:	00001097          	auipc	ra,0x1
    80004a88:	6e8080e7          	jalr	1768(ra) # 8000616c <_Z11stringToIntPKc>
    80004a8c:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004a90:	00006517          	auipc	a0,0x6
    80004a94:	87050513          	addi	a0,a0,-1936 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80004a98:	00001097          	auipc	ra,0x1
    80004a9c:	574080e7          	jalr	1396(ra) # 8000600c <_Z11printStringPKc>
    getString(input, 30);
    80004aa0:	01e00593          	li	a1,30
    80004aa4:	00048513          	mv	a0,s1
    80004aa8:	00001097          	auipc	ra,0x1
    80004aac:	5ec080e7          	jalr	1516(ra) # 80006094 <_Z9getStringPci>
    n = stringToInt(input);
    80004ab0:	00048513          	mv	a0,s1
    80004ab4:	00001097          	auipc	ra,0x1
    80004ab8:	6b8080e7          	jalr	1720(ra) # 8000616c <_Z11stringToIntPKc>
    80004abc:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004ac0:	00006517          	auipc	a0,0x6
    80004ac4:	86050513          	addi	a0,a0,-1952 # 8000a320 <CONSOLE_STATUS+0x310>
    80004ac8:	00001097          	auipc	ra,0x1
    80004acc:	544080e7          	jalr	1348(ra) # 8000600c <_Z11printStringPKc>
    printInt(threadNum);
    80004ad0:	00000613          	li	a2,0
    80004ad4:	00a00593          	li	a1,10
    80004ad8:	00098513          	mv	a0,s3
    80004adc:	00001097          	auipc	ra,0x1
    80004ae0:	6e0080e7          	jalr	1760(ra) # 800061bc <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004ae4:	00006517          	auipc	a0,0x6
    80004ae8:	85450513          	addi	a0,a0,-1964 # 8000a338 <CONSOLE_STATUS+0x328>
    80004aec:	00001097          	auipc	ra,0x1
    80004af0:	520080e7          	jalr	1312(ra) # 8000600c <_Z11printStringPKc>
    printInt(n);
    80004af4:	00000613          	li	a2,0
    80004af8:	00a00593          	li	a1,10
    80004afc:	00048513          	mv	a0,s1
    80004b00:	00001097          	auipc	ra,0x1
    80004b04:	6bc080e7          	jalr	1724(ra) # 800061bc <_Z8printIntiii>
    printString(".\n");
    80004b08:	00006517          	auipc	a0,0x6
    80004b0c:	84850513          	addi	a0,a0,-1976 # 8000a350 <CONSOLE_STATUS+0x340>
    80004b10:	00001097          	auipc	ra,0x1
    80004b14:	4fc080e7          	jalr	1276(ra) # 8000600c <_Z11printStringPKc>
    if (threadNum > n) {
    80004b18:	0334c463          	blt	s1,s3,80004b40 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004b1c:	03305c63          	blez	s3,80004b54 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004b20:	03800513          	li	a0,56
    80004b24:	ffffe097          	auipc	ra,0xffffe
    80004b28:	180080e7          	jalr	384(ra) # 80002ca4 <_Znwm>
    80004b2c:	00050a93          	mv	s5,a0
    80004b30:	00048593          	mv	a1,s1
    80004b34:	00001097          	auipc	ra,0x1
    80004b38:	7a8080e7          	jalr	1960(ra) # 800062dc <_ZN9BufferCPPC1Ei>
    80004b3c:	0300006f          	j	80004b6c <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004b40:	00006517          	auipc	a0,0x6
    80004b44:	81850513          	addi	a0,a0,-2024 # 8000a358 <CONSOLE_STATUS+0x348>
    80004b48:	00001097          	auipc	ra,0x1
    80004b4c:	4c4080e7          	jalr	1220(ra) # 8000600c <_Z11printStringPKc>
        return;
    80004b50:	0140006f          	j	80004b64 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004b54:	00006517          	auipc	a0,0x6
    80004b58:	84450513          	addi	a0,a0,-1980 # 8000a398 <CONSOLE_STATUS+0x388>
    80004b5c:	00001097          	auipc	ra,0x1
    80004b60:	4b0080e7          	jalr	1200(ra) # 8000600c <_Z11printStringPKc>
        return;
    80004b64:	000c0113          	mv	sp,s8
    80004b68:	2140006f          	j	80004d7c <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004b6c:	01000513          	li	a0,16
    80004b70:	ffffe097          	auipc	ra,0xffffe
    80004b74:	134080e7          	jalr	308(ra) # 80002ca4 <_Znwm>
    80004b78:	00050913          	mv	s2,a0
    80004b7c:	00000593          	li	a1,0
    80004b80:	ffffe097          	auipc	ra,0xffffe
    80004b84:	488080e7          	jalr	1160(ra) # 80003008 <_ZN9SemaphoreC1Ej>
    80004b88:	00008797          	auipc	a5,0x8
    80004b8c:	5727bc23          	sd	s2,1400(a5) # 8000d100 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004b90:	00399793          	slli	a5,s3,0x3
    80004b94:	00f78793          	addi	a5,a5,15
    80004b98:	ff07f793          	andi	a5,a5,-16
    80004b9c:	40f10133          	sub	sp,sp,a5
    80004ba0:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004ba4:	0019871b          	addiw	a4,s3,1
    80004ba8:	00171793          	slli	a5,a4,0x1
    80004bac:	00e787b3          	add	a5,a5,a4
    80004bb0:	00379793          	slli	a5,a5,0x3
    80004bb4:	00f78793          	addi	a5,a5,15
    80004bb8:	ff07f793          	andi	a5,a5,-16
    80004bbc:	40f10133          	sub	sp,sp,a5
    80004bc0:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004bc4:	00199493          	slli	s1,s3,0x1
    80004bc8:	013484b3          	add	s1,s1,s3
    80004bcc:	00349493          	slli	s1,s1,0x3
    80004bd0:	009b04b3          	add	s1,s6,s1
    80004bd4:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004bd8:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004bdc:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004be0:	02800513          	li	a0,40
    80004be4:	ffffe097          	auipc	ra,0xffffe
    80004be8:	0c0080e7          	jalr	192(ra) # 80002ca4 <_Znwm>
    80004bec:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004bf0:	ffffe097          	auipc	ra,0xffffe
    80004bf4:	39c080e7          	jalr	924(ra) # 80002f8c <_ZN6ThreadC1Ev>
    80004bf8:	00008797          	auipc	a5,0x8
    80004bfc:	23878793          	addi	a5,a5,568 # 8000ce30 <_ZTV8Consumer+0x10>
    80004c00:	00fbb023          	sd	a5,0(s7)
    80004c04:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004c08:	000b8513          	mv	a0,s7
    80004c0c:	ffffe097          	auipc	ra,0xffffe
    80004c10:	250080e7          	jalr	592(ra) # 80002e5c <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004c14:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004c18:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004c1c:	00008797          	auipc	a5,0x8
    80004c20:	4e47b783          	ld	a5,1252(a5) # 8000d100 <_ZL10waitForAll>
    80004c24:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004c28:	02800513          	li	a0,40
    80004c2c:	ffffe097          	auipc	ra,0xffffe
    80004c30:	078080e7          	jalr	120(ra) # 80002ca4 <_Znwm>
    80004c34:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004c38:	ffffe097          	auipc	ra,0xffffe
    80004c3c:	354080e7          	jalr	852(ra) # 80002f8c <_ZN6ThreadC1Ev>
    80004c40:	00008797          	auipc	a5,0x8
    80004c44:	1a078793          	addi	a5,a5,416 # 8000cde0 <_ZTV16ProducerKeyborad+0x10>
    80004c48:	00f4b023          	sd	a5,0(s1)
    80004c4c:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004c50:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004c54:	00048513          	mv	a0,s1
    80004c58:	ffffe097          	auipc	ra,0xffffe
    80004c5c:	204080e7          	jalr	516(ra) # 80002e5c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004c60:	00100913          	li	s2,1
    80004c64:	0300006f          	j	80004c94 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004c68:	00008797          	auipc	a5,0x8
    80004c6c:	1a078793          	addi	a5,a5,416 # 8000ce08 <_ZTV8Producer+0x10>
    80004c70:	00fcb023          	sd	a5,0(s9)
    80004c74:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004c78:	00391793          	slli	a5,s2,0x3
    80004c7c:	00fa07b3          	add	a5,s4,a5
    80004c80:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004c84:	000c8513          	mv	a0,s9
    80004c88:	ffffe097          	auipc	ra,0xffffe
    80004c8c:	1d4080e7          	jalr	468(ra) # 80002e5c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004c90:	0019091b          	addiw	s2,s2,1
    80004c94:	05395263          	bge	s2,s3,80004cd8 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004c98:	00191493          	slli	s1,s2,0x1
    80004c9c:	012484b3          	add	s1,s1,s2
    80004ca0:	00349493          	slli	s1,s1,0x3
    80004ca4:	009b04b3          	add	s1,s6,s1
    80004ca8:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004cac:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004cb0:	00008797          	auipc	a5,0x8
    80004cb4:	4507b783          	ld	a5,1104(a5) # 8000d100 <_ZL10waitForAll>
    80004cb8:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004cbc:	02800513          	li	a0,40
    80004cc0:	ffffe097          	auipc	ra,0xffffe
    80004cc4:	fe4080e7          	jalr	-28(ra) # 80002ca4 <_Znwm>
    80004cc8:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004ccc:	ffffe097          	auipc	ra,0xffffe
    80004cd0:	2c0080e7          	jalr	704(ra) # 80002f8c <_ZN6ThreadC1Ev>
    80004cd4:	f95ff06f          	j	80004c68 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004cd8:	ffffe097          	auipc	ra,0xffffe
    80004cdc:	1f8080e7          	jalr	504(ra) # 80002ed0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004ce0:	00000493          	li	s1,0
    80004ce4:	0099ce63          	blt	s3,s1,80004d00 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004ce8:	00008517          	auipc	a0,0x8
    80004cec:	41853503          	ld	a0,1048(a0) # 8000d100 <_ZL10waitForAll>
    80004cf0:	ffffe097          	auipc	ra,0xffffe
    80004cf4:	350080e7          	jalr	848(ra) # 80003040 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004cf8:	0014849b          	addiw	s1,s1,1
    80004cfc:	fe9ff06f          	j	80004ce4 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004d00:	00008517          	auipc	a0,0x8
    80004d04:	40053503          	ld	a0,1024(a0) # 8000d100 <_ZL10waitForAll>
    80004d08:	00050863          	beqz	a0,80004d18 <_Z20testConsumerProducerv+0x2f4>
    80004d0c:	00053783          	ld	a5,0(a0)
    80004d10:	0087b783          	ld	a5,8(a5)
    80004d14:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004d18:	00000493          	li	s1,0
    80004d1c:	0080006f          	j	80004d24 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004d20:	0014849b          	addiw	s1,s1,1
    80004d24:	0334d263          	bge	s1,s3,80004d48 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004d28:	00349793          	slli	a5,s1,0x3
    80004d2c:	00fa07b3          	add	a5,s4,a5
    80004d30:	0007b503          	ld	a0,0(a5)
    80004d34:	fe0506e3          	beqz	a0,80004d20 <_Z20testConsumerProducerv+0x2fc>
    80004d38:	00053783          	ld	a5,0(a0)
    80004d3c:	0087b783          	ld	a5,8(a5)
    80004d40:	000780e7          	jalr	a5
    80004d44:	fddff06f          	j	80004d20 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004d48:	000b8a63          	beqz	s7,80004d5c <_Z20testConsumerProducerv+0x338>
    80004d4c:	000bb783          	ld	a5,0(s7)
    80004d50:	0087b783          	ld	a5,8(a5)
    80004d54:	000b8513          	mv	a0,s7
    80004d58:	000780e7          	jalr	a5
    delete buffer;
    80004d5c:	000a8e63          	beqz	s5,80004d78 <_Z20testConsumerProducerv+0x354>
    80004d60:	000a8513          	mv	a0,s5
    80004d64:	00002097          	auipc	ra,0x2
    80004d68:	870080e7          	jalr	-1936(ra) # 800065d4 <_ZN9BufferCPPD1Ev>
    80004d6c:	000a8513          	mv	a0,s5
    80004d70:	ffffe097          	auipc	ra,0xffffe
    80004d74:	f84080e7          	jalr	-124(ra) # 80002cf4 <_ZdlPv>
    80004d78:	000c0113          	mv	sp,s8
}
    80004d7c:	f8040113          	addi	sp,s0,-128
    80004d80:	07813083          	ld	ra,120(sp)
    80004d84:	07013403          	ld	s0,112(sp)
    80004d88:	06813483          	ld	s1,104(sp)
    80004d8c:	06013903          	ld	s2,96(sp)
    80004d90:	05813983          	ld	s3,88(sp)
    80004d94:	05013a03          	ld	s4,80(sp)
    80004d98:	04813a83          	ld	s5,72(sp)
    80004d9c:	04013b03          	ld	s6,64(sp)
    80004da0:	03813b83          	ld	s7,56(sp)
    80004da4:	03013c03          	ld	s8,48(sp)
    80004da8:	02813c83          	ld	s9,40(sp)
    80004dac:	08010113          	addi	sp,sp,128
    80004db0:	00008067          	ret
    80004db4:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004db8:	000a8513          	mv	a0,s5
    80004dbc:	ffffe097          	auipc	ra,0xffffe
    80004dc0:	f38080e7          	jalr	-200(ra) # 80002cf4 <_ZdlPv>
    80004dc4:	00048513          	mv	a0,s1
    80004dc8:	00009097          	auipc	ra,0x9
    80004dcc:	450080e7          	jalr	1104(ra) # 8000e218 <_Unwind_Resume>
    80004dd0:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004dd4:	00090513          	mv	a0,s2
    80004dd8:	ffffe097          	auipc	ra,0xffffe
    80004ddc:	f1c080e7          	jalr	-228(ra) # 80002cf4 <_ZdlPv>
    80004de0:	00048513          	mv	a0,s1
    80004de4:	00009097          	auipc	ra,0x9
    80004de8:	434080e7          	jalr	1076(ra) # 8000e218 <_Unwind_Resume>
    80004dec:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004df0:	000b8513          	mv	a0,s7
    80004df4:	ffffe097          	auipc	ra,0xffffe
    80004df8:	f00080e7          	jalr	-256(ra) # 80002cf4 <_ZdlPv>
    80004dfc:	00048513          	mv	a0,s1
    80004e00:	00009097          	auipc	ra,0x9
    80004e04:	418080e7          	jalr	1048(ra) # 8000e218 <_Unwind_Resume>
    80004e08:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004e0c:	00048513          	mv	a0,s1
    80004e10:	ffffe097          	auipc	ra,0xffffe
    80004e14:	ee4080e7          	jalr	-284(ra) # 80002cf4 <_ZdlPv>
    80004e18:	00090513          	mv	a0,s2
    80004e1c:	00009097          	auipc	ra,0x9
    80004e20:	3fc080e7          	jalr	1020(ra) # 8000e218 <_Unwind_Resume>
    80004e24:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004e28:	000c8513          	mv	a0,s9
    80004e2c:	ffffe097          	auipc	ra,0xffffe
    80004e30:	ec8080e7          	jalr	-312(ra) # 80002cf4 <_ZdlPv>
    80004e34:	00048513          	mv	a0,s1
    80004e38:	00009097          	auipc	ra,0x9
    80004e3c:	3e0080e7          	jalr	992(ra) # 8000e218 <_Unwind_Resume>

0000000080004e40 <_ZN8Consumer3runEv>:
    void run() override {
    80004e40:	fd010113          	addi	sp,sp,-48
    80004e44:	02113423          	sd	ra,40(sp)
    80004e48:	02813023          	sd	s0,32(sp)
    80004e4c:	00913c23          	sd	s1,24(sp)
    80004e50:	01213823          	sd	s2,16(sp)
    80004e54:	01313423          	sd	s3,8(sp)
    80004e58:	03010413          	addi	s0,sp,48
    80004e5c:	00050913          	mv	s2,a0
        int i = 0;
    80004e60:	00000993          	li	s3,0
    80004e64:	0100006f          	j	80004e74 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004e68:	00a00513          	li	a0,10
    80004e6c:	ffffe097          	auipc	ra,0xffffe
    80004e70:	2c4080e7          	jalr	708(ra) # 80003130 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004e74:	00008797          	auipc	a5,0x8
    80004e78:	2847a783          	lw	a5,644(a5) # 8000d0f8 <_ZL9threadEnd>
    80004e7c:	04079a63          	bnez	a5,80004ed0 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004e80:	02093783          	ld	a5,32(s2)
    80004e84:	0087b503          	ld	a0,8(a5)
    80004e88:	00001097          	auipc	ra,0x1
    80004e8c:	638080e7          	jalr	1592(ra) # 800064c0 <_ZN9BufferCPP3getEv>
            i++;
    80004e90:	0019849b          	addiw	s1,s3,1
    80004e94:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004e98:	0ff57513          	andi	a0,a0,255
    80004e9c:	ffffe097          	auipc	ra,0xffffe
    80004ea0:	294080e7          	jalr	660(ra) # 80003130 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004ea4:	05000793          	li	a5,80
    80004ea8:	02f4e4bb          	remw	s1,s1,a5
    80004eac:	fc0494e3          	bnez	s1,80004e74 <_ZN8Consumer3runEv+0x34>
    80004eb0:	fb9ff06f          	j	80004e68 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004eb4:	02093783          	ld	a5,32(s2)
    80004eb8:	0087b503          	ld	a0,8(a5)
    80004ebc:	00001097          	auipc	ra,0x1
    80004ec0:	604080e7          	jalr	1540(ra) # 800064c0 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004ec4:	0ff57513          	andi	a0,a0,255
    80004ec8:	ffffe097          	auipc	ra,0xffffe
    80004ecc:	268080e7          	jalr	616(ra) # 80003130 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004ed0:	02093783          	ld	a5,32(s2)
    80004ed4:	0087b503          	ld	a0,8(a5)
    80004ed8:	00001097          	auipc	ra,0x1
    80004edc:	674080e7          	jalr	1652(ra) # 8000654c <_ZN9BufferCPP6getCntEv>
    80004ee0:	fca04ae3          	bgtz	a0,80004eb4 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004ee4:	02093783          	ld	a5,32(s2)
    80004ee8:	0107b503          	ld	a0,16(a5)
    80004eec:	ffffe097          	auipc	ra,0xffffe
    80004ef0:	180080e7          	jalr	384(ra) # 8000306c <_ZN9Semaphore6signalEv>
    }
    80004ef4:	02813083          	ld	ra,40(sp)
    80004ef8:	02013403          	ld	s0,32(sp)
    80004efc:	01813483          	ld	s1,24(sp)
    80004f00:	01013903          	ld	s2,16(sp)
    80004f04:	00813983          	ld	s3,8(sp)
    80004f08:	03010113          	addi	sp,sp,48
    80004f0c:	00008067          	ret

0000000080004f10 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004f10:	ff010113          	addi	sp,sp,-16
    80004f14:	00113423          	sd	ra,8(sp)
    80004f18:	00813023          	sd	s0,0(sp)
    80004f1c:	01010413          	addi	s0,sp,16
    80004f20:	00008797          	auipc	a5,0x8
    80004f24:	f1078793          	addi	a5,a5,-240 # 8000ce30 <_ZTV8Consumer+0x10>
    80004f28:	00f53023          	sd	a5,0(a0)
    80004f2c:	ffffe097          	auipc	ra,0xffffe
    80004f30:	c70080e7          	jalr	-912(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80004f34:	00813083          	ld	ra,8(sp)
    80004f38:	00013403          	ld	s0,0(sp)
    80004f3c:	01010113          	addi	sp,sp,16
    80004f40:	00008067          	ret

0000000080004f44 <_ZN8ConsumerD0Ev>:
    80004f44:	fe010113          	addi	sp,sp,-32
    80004f48:	00113c23          	sd	ra,24(sp)
    80004f4c:	00813823          	sd	s0,16(sp)
    80004f50:	00913423          	sd	s1,8(sp)
    80004f54:	02010413          	addi	s0,sp,32
    80004f58:	00050493          	mv	s1,a0
    80004f5c:	00008797          	auipc	a5,0x8
    80004f60:	ed478793          	addi	a5,a5,-300 # 8000ce30 <_ZTV8Consumer+0x10>
    80004f64:	00f53023          	sd	a5,0(a0)
    80004f68:	ffffe097          	auipc	ra,0xffffe
    80004f6c:	c34080e7          	jalr	-972(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80004f70:	00048513          	mv	a0,s1
    80004f74:	ffffe097          	auipc	ra,0xffffe
    80004f78:	d80080e7          	jalr	-640(ra) # 80002cf4 <_ZdlPv>
    80004f7c:	01813083          	ld	ra,24(sp)
    80004f80:	01013403          	ld	s0,16(sp)
    80004f84:	00813483          	ld	s1,8(sp)
    80004f88:	02010113          	addi	sp,sp,32
    80004f8c:	00008067          	ret

0000000080004f90 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004f90:	ff010113          	addi	sp,sp,-16
    80004f94:	00113423          	sd	ra,8(sp)
    80004f98:	00813023          	sd	s0,0(sp)
    80004f9c:	01010413          	addi	s0,sp,16
    80004fa0:	00008797          	auipc	a5,0x8
    80004fa4:	e4078793          	addi	a5,a5,-448 # 8000cde0 <_ZTV16ProducerKeyborad+0x10>
    80004fa8:	00f53023          	sd	a5,0(a0)
    80004fac:	ffffe097          	auipc	ra,0xffffe
    80004fb0:	bf0080e7          	jalr	-1040(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80004fb4:	00813083          	ld	ra,8(sp)
    80004fb8:	00013403          	ld	s0,0(sp)
    80004fbc:	01010113          	addi	sp,sp,16
    80004fc0:	00008067          	ret

0000000080004fc4 <_ZN16ProducerKeyboradD0Ev>:
    80004fc4:	fe010113          	addi	sp,sp,-32
    80004fc8:	00113c23          	sd	ra,24(sp)
    80004fcc:	00813823          	sd	s0,16(sp)
    80004fd0:	00913423          	sd	s1,8(sp)
    80004fd4:	02010413          	addi	s0,sp,32
    80004fd8:	00050493          	mv	s1,a0
    80004fdc:	00008797          	auipc	a5,0x8
    80004fe0:	e0478793          	addi	a5,a5,-508 # 8000cde0 <_ZTV16ProducerKeyborad+0x10>
    80004fe4:	00f53023          	sd	a5,0(a0)
    80004fe8:	ffffe097          	auipc	ra,0xffffe
    80004fec:	bb4080e7          	jalr	-1100(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80004ff0:	00048513          	mv	a0,s1
    80004ff4:	ffffe097          	auipc	ra,0xffffe
    80004ff8:	d00080e7          	jalr	-768(ra) # 80002cf4 <_ZdlPv>
    80004ffc:	01813083          	ld	ra,24(sp)
    80005000:	01013403          	ld	s0,16(sp)
    80005004:	00813483          	ld	s1,8(sp)
    80005008:	02010113          	addi	sp,sp,32
    8000500c:	00008067          	ret

0000000080005010 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80005010:	ff010113          	addi	sp,sp,-16
    80005014:	00113423          	sd	ra,8(sp)
    80005018:	00813023          	sd	s0,0(sp)
    8000501c:	01010413          	addi	s0,sp,16
    80005020:	00008797          	auipc	a5,0x8
    80005024:	de878793          	addi	a5,a5,-536 # 8000ce08 <_ZTV8Producer+0x10>
    80005028:	00f53023          	sd	a5,0(a0)
    8000502c:	ffffe097          	auipc	ra,0xffffe
    80005030:	b70080e7          	jalr	-1168(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80005034:	00813083          	ld	ra,8(sp)
    80005038:	00013403          	ld	s0,0(sp)
    8000503c:	01010113          	addi	sp,sp,16
    80005040:	00008067          	ret

0000000080005044 <_ZN8ProducerD0Ev>:
    80005044:	fe010113          	addi	sp,sp,-32
    80005048:	00113c23          	sd	ra,24(sp)
    8000504c:	00813823          	sd	s0,16(sp)
    80005050:	00913423          	sd	s1,8(sp)
    80005054:	02010413          	addi	s0,sp,32
    80005058:	00050493          	mv	s1,a0
    8000505c:	00008797          	auipc	a5,0x8
    80005060:	dac78793          	addi	a5,a5,-596 # 8000ce08 <_ZTV8Producer+0x10>
    80005064:	00f53023          	sd	a5,0(a0)
    80005068:	ffffe097          	auipc	ra,0xffffe
    8000506c:	b34080e7          	jalr	-1228(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80005070:	00048513          	mv	a0,s1
    80005074:	ffffe097          	auipc	ra,0xffffe
    80005078:	c80080e7          	jalr	-896(ra) # 80002cf4 <_ZdlPv>
    8000507c:	01813083          	ld	ra,24(sp)
    80005080:	01013403          	ld	s0,16(sp)
    80005084:	00813483          	ld	s1,8(sp)
    80005088:	02010113          	addi	sp,sp,32
    8000508c:	00008067          	ret

0000000080005090 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80005090:	fe010113          	addi	sp,sp,-32
    80005094:	00113c23          	sd	ra,24(sp)
    80005098:	00813823          	sd	s0,16(sp)
    8000509c:	00913423          	sd	s1,8(sp)
    800050a0:	02010413          	addi	s0,sp,32
    800050a4:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    800050a8:	ffffc097          	auipc	ra,0xffffc
    800050ac:	558080e7          	jalr	1368(ra) # 80001600 <_Z4getcv>
    800050b0:	0005059b          	sext.w	a1,a0
    800050b4:	01b00793          	li	a5,27
    800050b8:	00f58c63          	beq	a1,a5,800050d0 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    800050bc:	0204b783          	ld	a5,32(s1)
    800050c0:	0087b503          	ld	a0,8(a5)
    800050c4:	00001097          	auipc	ra,0x1
    800050c8:	36c080e7          	jalr	876(ra) # 80006430 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    800050cc:	fddff06f          	j	800050a8 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    800050d0:	00100793          	li	a5,1
    800050d4:	00008717          	auipc	a4,0x8
    800050d8:	02f72223          	sw	a5,36(a4) # 8000d0f8 <_ZL9threadEnd>
        td->buffer->put('!');
    800050dc:	0204b783          	ld	a5,32(s1)
    800050e0:	02100593          	li	a1,33
    800050e4:	0087b503          	ld	a0,8(a5)
    800050e8:	00001097          	auipc	ra,0x1
    800050ec:	348080e7          	jalr	840(ra) # 80006430 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    800050f0:	0204b783          	ld	a5,32(s1)
    800050f4:	0107b503          	ld	a0,16(a5)
    800050f8:	ffffe097          	auipc	ra,0xffffe
    800050fc:	f74080e7          	jalr	-140(ra) # 8000306c <_ZN9Semaphore6signalEv>
    }
    80005100:	01813083          	ld	ra,24(sp)
    80005104:	01013403          	ld	s0,16(sp)
    80005108:	00813483          	ld	s1,8(sp)
    8000510c:	02010113          	addi	sp,sp,32
    80005110:	00008067          	ret

0000000080005114 <_ZN8Producer3runEv>:
    void run() override {
    80005114:	fe010113          	addi	sp,sp,-32
    80005118:	00113c23          	sd	ra,24(sp)
    8000511c:	00813823          	sd	s0,16(sp)
    80005120:	00913423          	sd	s1,8(sp)
    80005124:	01213023          	sd	s2,0(sp)
    80005128:	02010413          	addi	s0,sp,32
    8000512c:	00050493          	mv	s1,a0
        int i = 0;
    80005130:	00000913          	li	s2,0
        while (!threadEnd) {
    80005134:	00008797          	auipc	a5,0x8
    80005138:	fc47a783          	lw	a5,-60(a5) # 8000d0f8 <_ZL9threadEnd>
    8000513c:	04079263          	bnez	a5,80005180 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80005140:	0204b783          	ld	a5,32(s1)
    80005144:	0007a583          	lw	a1,0(a5)
    80005148:	0305859b          	addiw	a1,a1,48
    8000514c:	0087b503          	ld	a0,8(a5)
    80005150:	00001097          	auipc	ra,0x1
    80005154:	2e0080e7          	jalr	736(ra) # 80006430 <_ZN9BufferCPP3putEi>
            i++;
    80005158:	0019071b          	addiw	a4,s2,1
    8000515c:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80005160:	0204b783          	ld	a5,32(s1)
    80005164:	0007a783          	lw	a5,0(a5)
    80005168:	00e787bb          	addw	a5,a5,a4
    8000516c:	00500513          	li	a0,5
    80005170:	02a7e53b          	remw	a0,a5,a0
    80005174:	ffffe097          	auipc	ra,0xffffe
    80005178:	d84080e7          	jalr	-636(ra) # 80002ef8 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    8000517c:	fb9ff06f          	j	80005134 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80005180:	0204b783          	ld	a5,32(s1)
    80005184:	0107b503          	ld	a0,16(a5)
    80005188:	ffffe097          	auipc	ra,0xffffe
    8000518c:	ee4080e7          	jalr	-284(ra) # 8000306c <_ZN9Semaphore6signalEv>
    }
    80005190:	01813083          	ld	ra,24(sp)
    80005194:	01013403          	ld	s0,16(sp)
    80005198:	00813483          	ld	s1,8(sp)
    8000519c:	00013903          	ld	s2,0(sp)
    800051a0:	02010113          	addi	sp,sp,32
    800051a4:	00008067          	ret

00000000800051a8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800051a8:	fe010113          	addi	sp,sp,-32
    800051ac:	00113c23          	sd	ra,24(sp)
    800051b0:	00813823          	sd	s0,16(sp)
    800051b4:	00913423          	sd	s1,8(sp)
    800051b8:	01213023          	sd	s2,0(sp)
    800051bc:	02010413          	addi	s0,sp,32
    800051c0:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800051c4:	00100793          	li	a5,1
    800051c8:	02a7f863          	bgeu	a5,a0,800051f8 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800051cc:	00a00793          	li	a5,10
    800051d0:	02f577b3          	remu	a5,a0,a5
    800051d4:	02078e63          	beqz	a5,80005210 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800051d8:	fff48513          	addi	a0,s1,-1
    800051dc:	00000097          	auipc	ra,0x0
    800051e0:	fcc080e7          	jalr	-52(ra) # 800051a8 <_ZL9fibonaccim>
    800051e4:	00050913          	mv	s2,a0
    800051e8:	ffe48513          	addi	a0,s1,-2
    800051ec:	00000097          	auipc	ra,0x0
    800051f0:	fbc080e7          	jalr	-68(ra) # 800051a8 <_ZL9fibonaccim>
    800051f4:	00a90533          	add	a0,s2,a0
}
    800051f8:	01813083          	ld	ra,24(sp)
    800051fc:	01013403          	ld	s0,16(sp)
    80005200:	00813483          	ld	s1,8(sp)
    80005204:	00013903          	ld	s2,0(sp)
    80005208:	02010113          	addi	sp,sp,32
    8000520c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005210:	ffffc097          	auipc	ra,0xffffc
    80005214:	2b0080e7          	jalr	688(ra) # 800014c0 <_Z15thread_dispatchv>
    80005218:	fc1ff06f          	j	800051d8 <_ZL9fibonaccim+0x30>

000000008000521c <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    8000521c:	fe010113          	addi	sp,sp,-32
    80005220:	00113c23          	sd	ra,24(sp)
    80005224:	00813823          	sd	s0,16(sp)
    80005228:	00913423          	sd	s1,8(sp)
    8000522c:	01213023          	sd	s2,0(sp)
    80005230:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005234:	00a00493          	li	s1,10
    80005238:	0400006f          	j	80005278 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000523c:	00005517          	auipc	a0,0x5
    80005240:	1fc50513          	addi	a0,a0,508 # 8000a438 <CONSOLE_STATUS+0x428>
    80005244:	00001097          	auipc	ra,0x1
    80005248:	dc8080e7          	jalr	-568(ra) # 8000600c <_Z11printStringPKc>
    8000524c:	00000613          	li	a2,0
    80005250:	00a00593          	li	a1,10
    80005254:	00048513          	mv	a0,s1
    80005258:	00001097          	auipc	ra,0x1
    8000525c:	f64080e7          	jalr	-156(ra) # 800061bc <_Z8printIntiii>
    80005260:	00005517          	auipc	a0,0x5
    80005264:	3c850513          	addi	a0,a0,968 # 8000a628 <CONSOLE_STATUS+0x618>
    80005268:	00001097          	auipc	ra,0x1
    8000526c:	da4080e7          	jalr	-604(ra) # 8000600c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005270:	0014849b          	addiw	s1,s1,1
    80005274:	0ff4f493          	andi	s1,s1,255
    80005278:	00c00793          	li	a5,12
    8000527c:	fc97f0e3          	bgeu	a5,s1,8000523c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005280:	00005517          	auipc	a0,0x5
    80005284:	1c050513          	addi	a0,a0,448 # 8000a440 <CONSOLE_STATUS+0x430>
    80005288:	00001097          	auipc	ra,0x1
    8000528c:	d84080e7          	jalr	-636(ra) # 8000600c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005290:	00500313          	li	t1,5
    thread_dispatch();
    80005294:	ffffc097          	auipc	ra,0xffffc
    80005298:	22c080e7          	jalr	556(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000529c:	01000513          	li	a0,16
    800052a0:	00000097          	auipc	ra,0x0
    800052a4:	f08080e7          	jalr	-248(ra) # 800051a8 <_ZL9fibonaccim>
    800052a8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800052ac:	00005517          	auipc	a0,0x5
    800052b0:	1a450513          	addi	a0,a0,420 # 8000a450 <CONSOLE_STATUS+0x440>
    800052b4:	00001097          	auipc	ra,0x1
    800052b8:	d58080e7          	jalr	-680(ra) # 8000600c <_Z11printStringPKc>
    800052bc:	00000613          	li	a2,0
    800052c0:	00a00593          	li	a1,10
    800052c4:	0009051b          	sext.w	a0,s2
    800052c8:	00001097          	auipc	ra,0x1
    800052cc:	ef4080e7          	jalr	-268(ra) # 800061bc <_Z8printIntiii>
    800052d0:	00005517          	auipc	a0,0x5
    800052d4:	35850513          	addi	a0,a0,856 # 8000a628 <CONSOLE_STATUS+0x618>
    800052d8:	00001097          	auipc	ra,0x1
    800052dc:	d34080e7          	jalr	-716(ra) # 8000600c <_Z11printStringPKc>
    800052e0:	0400006f          	j	80005320 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800052e4:	00005517          	auipc	a0,0x5
    800052e8:	15450513          	addi	a0,a0,340 # 8000a438 <CONSOLE_STATUS+0x428>
    800052ec:	00001097          	auipc	ra,0x1
    800052f0:	d20080e7          	jalr	-736(ra) # 8000600c <_Z11printStringPKc>
    800052f4:	00000613          	li	a2,0
    800052f8:	00a00593          	li	a1,10
    800052fc:	00048513          	mv	a0,s1
    80005300:	00001097          	auipc	ra,0x1
    80005304:	ebc080e7          	jalr	-324(ra) # 800061bc <_Z8printIntiii>
    80005308:	00005517          	auipc	a0,0x5
    8000530c:	32050513          	addi	a0,a0,800 # 8000a628 <CONSOLE_STATUS+0x618>
    80005310:	00001097          	auipc	ra,0x1
    80005314:	cfc080e7          	jalr	-772(ra) # 8000600c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005318:	0014849b          	addiw	s1,s1,1
    8000531c:	0ff4f493          	andi	s1,s1,255
    80005320:	00f00793          	li	a5,15
    80005324:	fc97f0e3          	bgeu	a5,s1,800052e4 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005328:	00005517          	auipc	a0,0x5
    8000532c:	13850513          	addi	a0,a0,312 # 8000a460 <CONSOLE_STATUS+0x450>
    80005330:	00001097          	auipc	ra,0x1
    80005334:	cdc080e7          	jalr	-804(ra) # 8000600c <_Z11printStringPKc>
    finishedD = true;
    80005338:	00100793          	li	a5,1
    8000533c:	00008717          	auipc	a4,0x8
    80005340:	dcf70623          	sb	a5,-564(a4) # 8000d108 <_ZL9finishedD>
    thread_dispatch();
    80005344:	ffffc097          	auipc	ra,0xffffc
    80005348:	17c080e7          	jalr	380(ra) # 800014c0 <_Z15thread_dispatchv>
}
    8000534c:	01813083          	ld	ra,24(sp)
    80005350:	01013403          	ld	s0,16(sp)
    80005354:	00813483          	ld	s1,8(sp)
    80005358:	00013903          	ld	s2,0(sp)
    8000535c:	02010113          	addi	sp,sp,32
    80005360:	00008067          	ret

0000000080005364 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005364:	fe010113          	addi	sp,sp,-32
    80005368:	00113c23          	sd	ra,24(sp)
    8000536c:	00813823          	sd	s0,16(sp)
    80005370:	00913423          	sd	s1,8(sp)
    80005374:	01213023          	sd	s2,0(sp)
    80005378:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000537c:	00000493          	li	s1,0
    80005380:	0400006f          	j	800053c0 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005384:	00005517          	auipc	a0,0x5
    80005388:	07450513          	addi	a0,a0,116 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    8000538c:	00001097          	auipc	ra,0x1
    80005390:	c80080e7          	jalr	-896(ra) # 8000600c <_Z11printStringPKc>
    80005394:	00000613          	li	a2,0
    80005398:	00a00593          	li	a1,10
    8000539c:	00048513          	mv	a0,s1
    800053a0:	00001097          	auipc	ra,0x1
    800053a4:	e1c080e7          	jalr	-484(ra) # 800061bc <_Z8printIntiii>
    800053a8:	00005517          	auipc	a0,0x5
    800053ac:	28050513          	addi	a0,a0,640 # 8000a628 <CONSOLE_STATUS+0x618>
    800053b0:	00001097          	auipc	ra,0x1
    800053b4:	c5c080e7          	jalr	-932(ra) # 8000600c <_Z11printStringPKc>
    for (; i < 3; i++) {
    800053b8:	0014849b          	addiw	s1,s1,1
    800053bc:	0ff4f493          	andi	s1,s1,255
    800053c0:	00200793          	li	a5,2
    800053c4:	fc97f0e3          	bgeu	a5,s1,80005384 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800053c8:	00005517          	auipc	a0,0x5
    800053cc:	03850513          	addi	a0,a0,56 # 8000a400 <CONSOLE_STATUS+0x3f0>
    800053d0:	00001097          	auipc	ra,0x1
    800053d4:	c3c080e7          	jalr	-964(ra) # 8000600c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800053d8:	00700313          	li	t1,7
    thread_dispatch();
    800053dc:	ffffc097          	auipc	ra,0xffffc
    800053e0:	0e4080e7          	jalr	228(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800053e4:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800053e8:	00005517          	auipc	a0,0x5
    800053ec:	02850513          	addi	a0,a0,40 # 8000a410 <CONSOLE_STATUS+0x400>
    800053f0:	00001097          	auipc	ra,0x1
    800053f4:	c1c080e7          	jalr	-996(ra) # 8000600c <_Z11printStringPKc>
    800053f8:	00000613          	li	a2,0
    800053fc:	00a00593          	li	a1,10
    80005400:	0009051b          	sext.w	a0,s2
    80005404:	00001097          	auipc	ra,0x1
    80005408:	db8080e7          	jalr	-584(ra) # 800061bc <_Z8printIntiii>
    8000540c:	00005517          	auipc	a0,0x5
    80005410:	21c50513          	addi	a0,a0,540 # 8000a628 <CONSOLE_STATUS+0x618>
    80005414:	00001097          	auipc	ra,0x1
    80005418:	bf8080e7          	jalr	-1032(ra) # 8000600c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    8000541c:	00c00513          	li	a0,12
    80005420:	00000097          	auipc	ra,0x0
    80005424:	d88080e7          	jalr	-632(ra) # 800051a8 <_ZL9fibonaccim>
    80005428:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000542c:	00005517          	auipc	a0,0x5
    80005430:	fec50513          	addi	a0,a0,-20 # 8000a418 <CONSOLE_STATUS+0x408>
    80005434:	00001097          	auipc	ra,0x1
    80005438:	bd8080e7          	jalr	-1064(ra) # 8000600c <_Z11printStringPKc>
    8000543c:	00000613          	li	a2,0
    80005440:	00a00593          	li	a1,10
    80005444:	0009051b          	sext.w	a0,s2
    80005448:	00001097          	auipc	ra,0x1
    8000544c:	d74080e7          	jalr	-652(ra) # 800061bc <_Z8printIntiii>
    80005450:	00005517          	auipc	a0,0x5
    80005454:	1d850513          	addi	a0,a0,472 # 8000a628 <CONSOLE_STATUS+0x618>
    80005458:	00001097          	auipc	ra,0x1
    8000545c:	bb4080e7          	jalr	-1100(ra) # 8000600c <_Z11printStringPKc>
    80005460:	0400006f          	j	800054a0 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005464:	00005517          	auipc	a0,0x5
    80005468:	f9450513          	addi	a0,a0,-108 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    8000546c:	00001097          	auipc	ra,0x1
    80005470:	ba0080e7          	jalr	-1120(ra) # 8000600c <_Z11printStringPKc>
    80005474:	00000613          	li	a2,0
    80005478:	00a00593          	li	a1,10
    8000547c:	00048513          	mv	a0,s1
    80005480:	00001097          	auipc	ra,0x1
    80005484:	d3c080e7          	jalr	-708(ra) # 800061bc <_Z8printIntiii>
    80005488:	00005517          	auipc	a0,0x5
    8000548c:	1a050513          	addi	a0,a0,416 # 8000a628 <CONSOLE_STATUS+0x618>
    80005490:	00001097          	auipc	ra,0x1
    80005494:	b7c080e7          	jalr	-1156(ra) # 8000600c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005498:	0014849b          	addiw	s1,s1,1
    8000549c:	0ff4f493          	andi	s1,s1,255
    800054a0:	00500793          	li	a5,5
    800054a4:	fc97f0e3          	bgeu	a5,s1,80005464 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    800054a8:	00005517          	auipc	a0,0x5
    800054ac:	f8050513          	addi	a0,a0,-128 # 8000a428 <CONSOLE_STATUS+0x418>
    800054b0:	00001097          	auipc	ra,0x1
    800054b4:	b5c080e7          	jalr	-1188(ra) # 8000600c <_Z11printStringPKc>
    finishedC = true;
    800054b8:	00100793          	li	a5,1
    800054bc:	00008717          	auipc	a4,0x8
    800054c0:	c4f706a3          	sb	a5,-947(a4) # 8000d109 <_ZL9finishedC>
    thread_dispatch();
    800054c4:	ffffc097          	auipc	ra,0xffffc
    800054c8:	ffc080e7          	jalr	-4(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800054cc:	01813083          	ld	ra,24(sp)
    800054d0:	01013403          	ld	s0,16(sp)
    800054d4:	00813483          	ld	s1,8(sp)
    800054d8:	00013903          	ld	s2,0(sp)
    800054dc:	02010113          	addi	sp,sp,32
    800054e0:	00008067          	ret

00000000800054e4 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800054e4:	fe010113          	addi	sp,sp,-32
    800054e8:	00113c23          	sd	ra,24(sp)
    800054ec:	00813823          	sd	s0,16(sp)
    800054f0:	00913423          	sd	s1,8(sp)
    800054f4:	01213023          	sd	s2,0(sp)
    800054f8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800054fc:	00000913          	li	s2,0
    80005500:	0380006f          	j	80005538 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80005504:	ffffc097          	auipc	ra,0xffffc
    80005508:	fbc080e7          	jalr	-68(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000550c:	00148493          	addi	s1,s1,1
    80005510:	000027b7          	lui	a5,0x2
    80005514:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005518:	0097ee63          	bltu	a5,s1,80005534 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000551c:	00000713          	li	a4,0
    80005520:	000077b7          	lui	a5,0x7
    80005524:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005528:	fce7eee3          	bltu	a5,a4,80005504 <_ZL11workerBodyBPv+0x20>
    8000552c:	00170713          	addi	a4,a4,1
    80005530:	ff1ff06f          	j	80005520 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80005534:	00190913          	addi	s2,s2,1
    80005538:	00f00793          	li	a5,15
    8000553c:	0527e063          	bltu	a5,s2,8000557c <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80005540:	00005517          	auipc	a0,0x5
    80005544:	ea050513          	addi	a0,a0,-352 # 8000a3e0 <CONSOLE_STATUS+0x3d0>
    80005548:	00001097          	auipc	ra,0x1
    8000554c:	ac4080e7          	jalr	-1340(ra) # 8000600c <_Z11printStringPKc>
    80005550:	00000613          	li	a2,0
    80005554:	00a00593          	li	a1,10
    80005558:	0009051b          	sext.w	a0,s2
    8000555c:	00001097          	auipc	ra,0x1
    80005560:	c60080e7          	jalr	-928(ra) # 800061bc <_Z8printIntiii>
    80005564:	00005517          	auipc	a0,0x5
    80005568:	0c450513          	addi	a0,a0,196 # 8000a628 <CONSOLE_STATUS+0x618>
    8000556c:	00001097          	auipc	ra,0x1
    80005570:	aa0080e7          	jalr	-1376(ra) # 8000600c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005574:	00000493          	li	s1,0
    80005578:	f99ff06f          	j	80005510 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    8000557c:	00005517          	auipc	a0,0x5
    80005580:	e6c50513          	addi	a0,a0,-404 # 8000a3e8 <CONSOLE_STATUS+0x3d8>
    80005584:	00001097          	auipc	ra,0x1
    80005588:	a88080e7          	jalr	-1400(ra) # 8000600c <_Z11printStringPKc>
    finishedB = true;
    8000558c:	00100793          	li	a5,1
    80005590:	00008717          	auipc	a4,0x8
    80005594:	b6f70d23          	sb	a5,-1158(a4) # 8000d10a <_ZL9finishedB>
    thread_dispatch();
    80005598:	ffffc097          	auipc	ra,0xffffc
    8000559c:	f28080e7          	jalr	-216(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800055a0:	01813083          	ld	ra,24(sp)
    800055a4:	01013403          	ld	s0,16(sp)
    800055a8:	00813483          	ld	s1,8(sp)
    800055ac:	00013903          	ld	s2,0(sp)
    800055b0:	02010113          	addi	sp,sp,32
    800055b4:	00008067          	ret

00000000800055b8 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800055b8:	fe010113          	addi	sp,sp,-32
    800055bc:	00113c23          	sd	ra,24(sp)
    800055c0:	00813823          	sd	s0,16(sp)
    800055c4:	00913423          	sd	s1,8(sp)
    800055c8:	01213023          	sd	s2,0(sp)
    800055cc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800055d0:	00000913          	li	s2,0
    800055d4:	0380006f          	j	8000560c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800055d8:	ffffc097          	auipc	ra,0xffffc
    800055dc:	ee8080e7          	jalr	-280(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800055e0:	00148493          	addi	s1,s1,1
    800055e4:	000027b7          	lui	a5,0x2
    800055e8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800055ec:	0097ee63          	bltu	a5,s1,80005608 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800055f0:	00000713          	li	a4,0
    800055f4:	000077b7          	lui	a5,0x7
    800055f8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800055fc:	fce7eee3          	bltu	a5,a4,800055d8 <_ZL11workerBodyAPv+0x20>
    80005600:	00170713          	addi	a4,a4,1
    80005604:	ff1ff06f          	j	800055f4 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005608:	00190913          	addi	s2,s2,1
    8000560c:	00900793          	li	a5,9
    80005610:	0527e063          	bltu	a5,s2,80005650 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005614:	00005517          	auipc	a0,0x5
    80005618:	db450513          	addi	a0,a0,-588 # 8000a3c8 <CONSOLE_STATUS+0x3b8>
    8000561c:	00001097          	auipc	ra,0x1
    80005620:	9f0080e7          	jalr	-1552(ra) # 8000600c <_Z11printStringPKc>
    80005624:	00000613          	li	a2,0
    80005628:	00a00593          	li	a1,10
    8000562c:	0009051b          	sext.w	a0,s2
    80005630:	00001097          	auipc	ra,0x1
    80005634:	b8c080e7          	jalr	-1140(ra) # 800061bc <_Z8printIntiii>
    80005638:	00005517          	auipc	a0,0x5
    8000563c:	ff050513          	addi	a0,a0,-16 # 8000a628 <CONSOLE_STATUS+0x618>
    80005640:	00001097          	auipc	ra,0x1
    80005644:	9cc080e7          	jalr	-1588(ra) # 8000600c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005648:	00000493          	li	s1,0
    8000564c:	f99ff06f          	j	800055e4 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005650:	00005517          	auipc	a0,0x5
    80005654:	d8050513          	addi	a0,a0,-640 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80005658:	00001097          	auipc	ra,0x1
    8000565c:	9b4080e7          	jalr	-1612(ra) # 8000600c <_Z11printStringPKc>
    finishedA = true;
    80005660:	00100793          	li	a5,1
    80005664:	00008717          	auipc	a4,0x8
    80005668:	aaf703a3          	sb	a5,-1369(a4) # 8000d10b <_ZL9finishedA>
}
    8000566c:	01813083          	ld	ra,24(sp)
    80005670:	01013403          	ld	s0,16(sp)
    80005674:	00813483          	ld	s1,8(sp)
    80005678:	00013903          	ld	s2,0(sp)
    8000567c:	02010113          	addi	sp,sp,32
    80005680:	00008067          	ret

0000000080005684 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005684:	fd010113          	addi	sp,sp,-48
    80005688:	02113423          	sd	ra,40(sp)
    8000568c:	02813023          	sd	s0,32(sp)
    80005690:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005694:	00000613          	li	a2,0
    80005698:	00000597          	auipc	a1,0x0
    8000569c:	f2058593          	addi	a1,a1,-224 # 800055b8 <_ZL11workerBodyAPv>
    800056a0:	fd040513          	addi	a0,s0,-48
    800056a4:	ffffc097          	auipc	ra,0xffffc
    800056a8:	d60080e7          	jalr	-672(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800056ac:	00005517          	auipc	a0,0x5
    800056b0:	dc450513          	addi	a0,a0,-572 # 8000a470 <CONSOLE_STATUS+0x460>
    800056b4:	00001097          	auipc	ra,0x1
    800056b8:	958080e7          	jalr	-1704(ra) # 8000600c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800056bc:	00000613          	li	a2,0
    800056c0:	00000597          	auipc	a1,0x0
    800056c4:	e2458593          	addi	a1,a1,-476 # 800054e4 <_ZL11workerBodyBPv>
    800056c8:	fd840513          	addi	a0,s0,-40
    800056cc:	ffffc097          	auipc	ra,0xffffc
    800056d0:	d38080e7          	jalr	-712(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800056d4:	00005517          	auipc	a0,0x5
    800056d8:	db450513          	addi	a0,a0,-588 # 8000a488 <CONSOLE_STATUS+0x478>
    800056dc:	00001097          	auipc	ra,0x1
    800056e0:	930080e7          	jalr	-1744(ra) # 8000600c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800056e4:	00000613          	li	a2,0
    800056e8:	00000597          	auipc	a1,0x0
    800056ec:	c7c58593          	addi	a1,a1,-900 # 80005364 <_ZL11workerBodyCPv>
    800056f0:	fe040513          	addi	a0,s0,-32
    800056f4:	ffffc097          	auipc	ra,0xffffc
    800056f8:	d10080e7          	jalr	-752(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800056fc:	00005517          	auipc	a0,0x5
    80005700:	da450513          	addi	a0,a0,-604 # 8000a4a0 <CONSOLE_STATUS+0x490>
    80005704:	00001097          	auipc	ra,0x1
    80005708:	908080e7          	jalr	-1784(ra) # 8000600c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000570c:	00000613          	li	a2,0
    80005710:	00000597          	auipc	a1,0x0
    80005714:	b0c58593          	addi	a1,a1,-1268 # 8000521c <_ZL11workerBodyDPv>
    80005718:	fe840513          	addi	a0,s0,-24
    8000571c:	ffffc097          	auipc	ra,0xffffc
    80005720:	ce8080e7          	jalr	-792(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005724:	00005517          	auipc	a0,0x5
    80005728:	d9450513          	addi	a0,a0,-620 # 8000a4b8 <CONSOLE_STATUS+0x4a8>
    8000572c:	00001097          	auipc	ra,0x1
    80005730:	8e0080e7          	jalr	-1824(ra) # 8000600c <_Z11printStringPKc>
    80005734:	00c0006f          	j	80005740 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005738:	ffffc097          	auipc	ra,0xffffc
    8000573c:	d88080e7          	jalr	-632(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005740:	00008797          	auipc	a5,0x8
    80005744:	9cb7c783          	lbu	a5,-1589(a5) # 8000d10b <_ZL9finishedA>
    80005748:	fe0788e3          	beqz	a5,80005738 <_Z18Threads_C_API_testv+0xb4>
    8000574c:	00008797          	auipc	a5,0x8
    80005750:	9be7c783          	lbu	a5,-1602(a5) # 8000d10a <_ZL9finishedB>
    80005754:	fe0782e3          	beqz	a5,80005738 <_Z18Threads_C_API_testv+0xb4>
    80005758:	00008797          	auipc	a5,0x8
    8000575c:	9b17c783          	lbu	a5,-1615(a5) # 8000d109 <_ZL9finishedC>
    80005760:	fc078ce3          	beqz	a5,80005738 <_Z18Threads_C_API_testv+0xb4>
    80005764:	00008797          	auipc	a5,0x8
    80005768:	9a47c783          	lbu	a5,-1628(a5) # 8000d108 <_ZL9finishedD>
    8000576c:	fc0786e3          	beqz	a5,80005738 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80005770:	02813083          	ld	ra,40(sp)
    80005774:	02013403          	ld	s0,32(sp)
    80005778:	03010113          	addi	sp,sp,48
    8000577c:	00008067          	ret

0000000080005780 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80005780:	fd010113          	addi	sp,sp,-48
    80005784:	02113423          	sd	ra,40(sp)
    80005788:	02813023          	sd	s0,32(sp)
    8000578c:	00913c23          	sd	s1,24(sp)
    80005790:	01213823          	sd	s2,16(sp)
    80005794:	01313423          	sd	s3,8(sp)
    80005798:	03010413          	addi	s0,sp,48
    8000579c:	00050993          	mv	s3,a0
    800057a0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800057a4:	00000913          	li	s2,0
    800057a8:	00c0006f          	j	800057b4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800057ac:	ffffd097          	auipc	ra,0xffffd
    800057b0:	724080e7          	jalr	1828(ra) # 80002ed0 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    800057b4:	ffffc097          	auipc	ra,0xffffc
    800057b8:	e4c080e7          	jalr	-436(ra) # 80001600 <_Z4getcv>
    800057bc:	0005059b          	sext.w	a1,a0
    800057c0:	01b00793          	li	a5,27
    800057c4:	02f58a63          	beq	a1,a5,800057f8 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    800057c8:	0084b503          	ld	a0,8(s1)
    800057cc:	00001097          	auipc	ra,0x1
    800057d0:	c64080e7          	jalr	-924(ra) # 80006430 <_ZN9BufferCPP3putEi>
        i++;
    800057d4:	0019071b          	addiw	a4,s2,1
    800057d8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800057dc:	0004a683          	lw	a3,0(s1)
    800057e0:	0026979b          	slliw	a5,a3,0x2
    800057e4:	00d787bb          	addw	a5,a5,a3
    800057e8:	0017979b          	slliw	a5,a5,0x1
    800057ec:	02f767bb          	remw	a5,a4,a5
    800057f0:	fc0792e3          	bnez	a5,800057b4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800057f4:	fb9ff06f          	j	800057ac <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800057f8:	00100793          	li	a5,1
    800057fc:	00008717          	auipc	a4,0x8
    80005800:	90f72a23          	sw	a5,-1772(a4) # 8000d110 <_ZL9threadEnd>
    td->buffer->put('!');
    80005804:	0209b783          	ld	a5,32(s3)
    80005808:	02100593          	li	a1,33
    8000580c:	0087b503          	ld	a0,8(a5)
    80005810:	00001097          	auipc	ra,0x1
    80005814:	c20080e7          	jalr	-992(ra) # 80006430 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005818:	0104b503          	ld	a0,16(s1)
    8000581c:	ffffe097          	auipc	ra,0xffffe
    80005820:	850080e7          	jalr	-1968(ra) # 8000306c <_ZN9Semaphore6signalEv>
}
    80005824:	02813083          	ld	ra,40(sp)
    80005828:	02013403          	ld	s0,32(sp)
    8000582c:	01813483          	ld	s1,24(sp)
    80005830:	01013903          	ld	s2,16(sp)
    80005834:	00813983          	ld	s3,8(sp)
    80005838:	03010113          	addi	sp,sp,48
    8000583c:	00008067          	ret

0000000080005840 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80005840:	fe010113          	addi	sp,sp,-32
    80005844:	00113c23          	sd	ra,24(sp)
    80005848:	00813823          	sd	s0,16(sp)
    8000584c:	00913423          	sd	s1,8(sp)
    80005850:	01213023          	sd	s2,0(sp)
    80005854:	02010413          	addi	s0,sp,32
    80005858:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000585c:	00000913          	li	s2,0
    80005860:	00c0006f          	j	8000586c <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005864:	ffffd097          	auipc	ra,0xffffd
    80005868:	66c080e7          	jalr	1644(ra) # 80002ed0 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    8000586c:	00008797          	auipc	a5,0x8
    80005870:	8a47a783          	lw	a5,-1884(a5) # 8000d110 <_ZL9threadEnd>
    80005874:	02079e63          	bnez	a5,800058b0 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005878:	0004a583          	lw	a1,0(s1)
    8000587c:	0305859b          	addiw	a1,a1,48
    80005880:	0084b503          	ld	a0,8(s1)
    80005884:	00001097          	auipc	ra,0x1
    80005888:	bac080e7          	jalr	-1108(ra) # 80006430 <_ZN9BufferCPP3putEi>
        i++;
    8000588c:	0019071b          	addiw	a4,s2,1
    80005890:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005894:	0004a683          	lw	a3,0(s1)
    80005898:	0026979b          	slliw	a5,a3,0x2
    8000589c:	00d787bb          	addw	a5,a5,a3
    800058a0:	0017979b          	slliw	a5,a5,0x1
    800058a4:	02f767bb          	remw	a5,a4,a5
    800058a8:	fc0792e3          	bnez	a5,8000586c <_ZN12ProducerSync8producerEPv+0x2c>
    800058ac:	fb9ff06f          	j	80005864 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    800058b0:	0104b503          	ld	a0,16(s1)
    800058b4:	ffffd097          	auipc	ra,0xffffd
    800058b8:	7b8080e7          	jalr	1976(ra) # 8000306c <_ZN9Semaphore6signalEv>
}
    800058bc:	01813083          	ld	ra,24(sp)
    800058c0:	01013403          	ld	s0,16(sp)
    800058c4:	00813483          	ld	s1,8(sp)
    800058c8:	00013903          	ld	s2,0(sp)
    800058cc:	02010113          	addi	sp,sp,32
    800058d0:	00008067          	ret

00000000800058d4 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    800058d4:	fd010113          	addi	sp,sp,-48
    800058d8:	02113423          	sd	ra,40(sp)
    800058dc:	02813023          	sd	s0,32(sp)
    800058e0:	00913c23          	sd	s1,24(sp)
    800058e4:	01213823          	sd	s2,16(sp)
    800058e8:	01313423          	sd	s3,8(sp)
    800058ec:	01413023          	sd	s4,0(sp)
    800058f0:	03010413          	addi	s0,sp,48
    800058f4:	00050993          	mv	s3,a0
    800058f8:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800058fc:	00000a13          	li	s4,0
    80005900:	01c0006f          	j	8000591c <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005904:	ffffd097          	auipc	ra,0xffffd
    80005908:	5cc080e7          	jalr	1484(ra) # 80002ed0 <_ZN6Thread8dispatchEv>
    8000590c:	0500006f          	j	8000595c <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005910:	00a00513          	li	a0,10
    80005914:	ffffc097          	auipc	ra,0xffffc
    80005918:	d14080e7          	jalr	-748(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    8000591c:	00007797          	auipc	a5,0x7
    80005920:	7f47a783          	lw	a5,2036(a5) # 8000d110 <_ZL9threadEnd>
    80005924:	06079263          	bnez	a5,80005988 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005928:	00893503          	ld	a0,8(s2)
    8000592c:	00001097          	auipc	ra,0x1
    80005930:	b94080e7          	jalr	-1132(ra) # 800064c0 <_ZN9BufferCPP3getEv>
        i++;
    80005934:	001a049b          	addiw	s1,s4,1
    80005938:	00048a1b          	sext.w	s4,s1
        putc(key);
    8000593c:	0ff57513          	andi	a0,a0,255
    80005940:	ffffc097          	auipc	ra,0xffffc
    80005944:	ce8080e7          	jalr	-792(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005948:	00092703          	lw	a4,0(s2)
    8000594c:	0027179b          	slliw	a5,a4,0x2
    80005950:	00e787bb          	addw	a5,a5,a4
    80005954:	02f4e7bb          	remw	a5,s1,a5
    80005958:	fa0786e3          	beqz	a5,80005904 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    8000595c:	05000793          	li	a5,80
    80005960:	02f4e4bb          	remw	s1,s1,a5
    80005964:	fa049ce3          	bnez	s1,8000591c <_ZN12ConsumerSync8consumerEPv+0x48>
    80005968:	fa9ff06f          	j	80005910 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    8000596c:	0209b783          	ld	a5,32(s3)
    80005970:	0087b503          	ld	a0,8(a5)
    80005974:	00001097          	auipc	ra,0x1
    80005978:	b4c080e7          	jalr	-1204(ra) # 800064c0 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    8000597c:	0ff57513          	andi	a0,a0,255
    80005980:	ffffd097          	auipc	ra,0xffffd
    80005984:	7b0080e7          	jalr	1968(ra) # 80003130 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005988:	0209b783          	ld	a5,32(s3)
    8000598c:	0087b503          	ld	a0,8(a5)
    80005990:	00001097          	auipc	ra,0x1
    80005994:	bbc080e7          	jalr	-1092(ra) # 8000654c <_ZN9BufferCPP6getCntEv>
    80005998:	fca04ae3          	bgtz	a0,8000596c <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    8000599c:	01093503          	ld	a0,16(s2)
    800059a0:	ffffd097          	auipc	ra,0xffffd
    800059a4:	6cc080e7          	jalr	1740(ra) # 8000306c <_ZN9Semaphore6signalEv>
}
    800059a8:	02813083          	ld	ra,40(sp)
    800059ac:	02013403          	ld	s0,32(sp)
    800059b0:	01813483          	ld	s1,24(sp)
    800059b4:	01013903          	ld	s2,16(sp)
    800059b8:	00813983          	ld	s3,8(sp)
    800059bc:	00013a03          	ld	s4,0(sp)
    800059c0:	03010113          	addi	sp,sp,48
    800059c4:	00008067          	ret

00000000800059c8 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    800059c8:	f8010113          	addi	sp,sp,-128
    800059cc:	06113c23          	sd	ra,120(sp)
    800059d0:	06813823          	sd	s0,112(sp)
    800059d4:	06913423          	sd	s1,104(sp)
    800059d8:	07213023          	sd	s2,96(sp)
    800059dc:	05313c23          	sd	s3,88(sp)
    800059e0:	05413823          	sd	s4,80(sp)
    800059e4:	05513423          	sd	s5,72(sp)
    800059e8:	05613023          	sd	s6,64(sp)
    800059ec:	03713c23          	sd	s7,56(sp)
    800059f0:	03813823          	sd	s8,48(sp)
    800059f4:	03913423          	sd	s9,40(sp)
    800059f8:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800059fc:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005a00:	00005517          	auipc	a0,0x5
    80005a04:	8e050513          	addi	a0,a0,-1824 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80005a08:	00000097          	auipc	ra,0x0
    80005a0c:	604080e7          	jalr	1540(ra) # 8000600c <_Z11printStringPKc>
    getString(input, 30);
    80005a10:	01e00593          	li	a1,30
    80005a14:	f8040493          	addi	s1,s0,-128
    80005a18:	00048513          	mv	a0,s1
    80005a1c:	00000097          	auipc	ra,0x0
    80005a20:	678080e7          	jalr	1656(ra) # 80006094 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005a24:	00048513          	mv	a0,s1
    80005a28:	00000097          	auipc	ra,0x0
    80005a2c:	744080e7          	jalr	1860(ra) # 8000616c <_Z11stringToIntPKc>
    80005a30:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005a34:	00005517          	auipc	a0,0x5
    80005a38:	8cc50513          	addi	a0,a0,-1844 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80005a3c:	00000097          	auipc	ra,0x0
    80005a40:	5d0080e7          	jalr	1488(ra) # 8000600c <_Z11printStringPKc>
    getString(input, 30);
    80005a44:	01e00593          	li	a1,30
    80005a48:	00048513          	mv	a0,s1
    80005a4c:	00000097          	auipc	ra,0x0
    80005a50:	648080e7          	jalr	1608(ra) # 80006094 <_Z9getStringPci>
    n = stringToInt(input);
    80005a54:	00048513          	mv	a0,s1
    80005a58:	00000097          	auipc	ra,0x0
    80005a5c:	714080e7          	jalr	1812(ra) # 8000616c <_Z11stringToIntPKc>
    80005a60:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005a64:	00005517          	auipc	a0,0x5
    80005a68:	8bc50513          	addi	a0,a0,-1860 # 8000a320 <CONSOLE_STATUS+0x310>
    80005a6c:	00000097          	auipc	ra,0x0
    80005a70:	5a0080e7          	jalr	1440(ra) # 8000600c <_Z11printStringPKc>
    80005a74:	00000613          	li	a2,0
    80005a78:	00a00593          	li	a1,10
    80005a7c:	00090513          	mv	a0,s2
    80005a80:	00000097          	auipc	ra,0x0
    80005a84:	73c080e7          	jalr	1852(ra) # 800061bc <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005a88:	00005517          	auipc	a0,0x5
    80005a8c:	8b050513          	addi	a0,a0,-1872 # 8000a338 <CONSOLE_STATUS+0x328>
    80005a90:	00000097          	auipc	ra,0x0
    80005a94:	57c080e7          	jalr	1404(ra) # 8000600c <_Z11printStringPKc>
    80005a98:	00000613          	li	a2,0
    80005a9c:	00a00593          	li	a1,10
    80005aa0:	00048513          	mv	a0,s1
    80005aa4:	00000097          	auipc	ra,0x0
    80005aa8:	718080e7          	jalr	1816(ra) # 800061bc <_Z8printIntiii>
    printString(".\n");
    80005aac:	00005517          	auipc	a0,0x5
    80005ab0:	8a450513          	addi	a0,a0,-1884 # 8000a350 <CONSOLE_STATUS+0x340>
    80005ab4:	00000097          	auipc	ra,0x0
    80005ab8:	558080e7          	jalr	1368(ra) # 8000600c <_Z11printStringPKc>
    if(threadNum > n) {
    80005abc:	0324c463          	blt	s1,s2,80005ae4 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005ac0:	03205c63          	blez	s2,80005af8 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005ac4:	03800513          	li	a0,56
    80005ac8:	ffffd097          	auipc	ra,0xffffd
    80005acc:	1dc080e7          	jalr	476(ra) # 80002ca4 <_Znwm>
    80005ad0:	00050a93          	mv	s5,a0
    80005ad4:	00048593          	mv	a1,s1
    80005ad8:	00001097          	auipc	ra,0x1
    80005adc:	804080e7          	jalr	-2044(ra) # 800062dc <_ZN9BufferCPPC1Ei>
    80005ae0:	0300006f          	j	80005b10 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005ae4:	00005517          	auipc	a0,0x5
    80005ae8:	87450513          	addi	a0,a0,-1932 # 8000a358 <CONSOLE_STATUS+0x348>
    80005aec:	00000097          	auipc	ra,0x0
    80005af0:	520080e7          	jalr	1312(ra) # 8000600c <_Z11printStringPKc>
        return;
    80005af4:	0140006f          	j	80005b08 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005af8:	00005517          	auipc	a0,0x5
    80005afc:	8a050513          	addi	a0,a0,-1888 # 8000a398 <CONSOLE_STATUS+0x388>
    80005b00:	00000097          	auipc	ra,0x0
    80005b04:	50c080e7          	jalr	1292(ra) # 8000600c <_Z11printStringPKc>
        return;
    80005b08:	000b8113          	mv	sp,s7
    80005b0c:	2380006f          	j	80005d44 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005b10:	01000513          	li	a0,16
    80005b14:	ffffd097          	auipc	ra,0xffffd
    80005b18:	190080e7          	jalr	400(ra) # 80002ca4 <_Znwm>
    80005b1c:	00050493          	mv	s1,a0
    80005b20:	00000593          	li	a1,0
    80005b24:	ffffd097          	auipc	ra,0xffffd
    80005b28:	4e4080e7          	jalr	1252(ra) # 80003008 <_ZN9SemaphoreC1Ej>
    80005b2c:	00007797          	auipc	a5,0x7
    80005b30:	5e97b623          	sd	s1,1516(a5) # 8000d118 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005b34:	00391793          	slli	a5,s2,0x3
    80005b38:	00f78793          	addi	a5,a5,15
    80005b3c:	ff07f793          	andi	a5,a5,-16
    80005b40:	40f10133          	sub	sp,sp,a5
    80005b44:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005b48:	0019071b          	addiw	a4,s2,1
    80005b4c:	00171793          	slli	a5,a4,0x1
    80005b50:	00e787b3          	add	a5,a5,a4
    80005b54:	00379793          	slli	a5,a5,0x3
    80005b58:	00f78793          	addi	a5,a5,15
    80005b5c:	ff07f793          	andi	a5,a5,-16
    80005b60:	40f10133          	sub	sp,sp,a5
    80005b64:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005b68:	00191c13          	slli	s8,s2,0x1
    80005b6c:	012c07b3          	add	a5,s8,s2
    80005b70:	00379793          	slli	a5,a5,0x3
    80005b74:	00fa07b3          	add	a5,s4,a5
    80005b78:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005b7c:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005b80:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005b84:	02800513          	li	a0,40
    80005b88:	ffffd097          	auipc	ra,0xffffd
    80005b8c:	11c080e7          	jalr	284(ra) # 80002ca4 <_Znwm>
    80005b90:	00050b13          	mv	s6,a0
    80005b94:	012c0c33          	add	s8,s8,s2
    80005b98:	003c1c13          	slli	s8,s8,0x3
    80005b9c:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005ba0:	ffffd097          	auipc	ra,0xffffd
    80005ba4:	3ec080e7          	jalr	1004(ra) # 80002f8c <_ZN6ThreadC1Ev>
    80005ba8:	00007797          	auipc	a5,0x7
    80005bac:	30078793          	addi	a5,a5,768 # 8000cea8 <_ZTV12ConsumerSync+0x10>
    80005bb0:	00fb3023          	sd	a5,0(s6)
    80005bb4:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005bb8:	000b0513          	mv	a0,s6
    80005bbc:	ffffd097          	auipc	ra,0xffffd
    80005bc0:	2a0080e7          	jalr	672(ra) # 80002e5c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005bc4:	00000493          	li	s1,0
    80005bc8:	0380006f          	j	80005c00 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005bcc:	00007797          	auipc	a5,0x7
    80005bd0:	2b478793          	addi	a5,a5,692 # 8000ce80 <_ZTV12ProducerSync+0x10>
    80005bd4:	00fcb023          	sd	a5,0(s9)
    80005bd8:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005bdc:	00349793          	slli	a5,s1,0x3
    80005be0:	00f987b3          	add	a5,s3,a5
    80005be4:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005be8:	00349793          	slli	a5,s1,0x3
    80005bec:	00f987b3          	add	a5,s3,a5
    80005bf0:	0007b503          	ld	a0,0(a5)
    80005bf4:	ffffd097          	auipc	ra,0xffffd
    80005bf8:	268080e7          	jalr	616(ra) # 80002e5c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005bfc:	0014849b          	addiw	s1,s1,1
    80005c00:	0b24d063          	bge	s1,s2,80005ca0 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005c04:	00149793          	slli	a5,s1,0x1
    80005c08:	009787b3          	add	a5,a5,s1
    80005c0c:	00379793          	slli	a5,a5,0x3
    80005c10:	00fa07b3          	add	a5,s4,a5
    80005c14:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005c18:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005c1c:	00007717          	auipc	a4,0x7
    80005c20:	4fc73703          	ld	a4,1276(a4) # 8000d118 <_ZL10waitForAll>
    80005c24:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005c28:	02905863          	blez	s1,80005c58 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005c2c:	02800513          	li	a0,40
    80005c30:	ffffd097          	auipc	ra,0xffffd
    80005c34:	074080e7          	jalr	116(ra) # 80002ca4 <_Znwm>
    80005c38:	00050c93          	mv	s9,a0
    80005c3c:	00149c13          	slli	s8,s1,0x1
    80005c40:	009c0c33          	add	s8,s8,s1
    80005c44:	003c1c13          	slli	s8,s8,0x3
    80005c48:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005c4c:	ffffd097          	auipc	ra,0xffffd
    80005c50:	340080e7          	jalr	832(ra) # 80002f8c <_ZN6ThreadC1Ev>
    80005c54:	f79ff06f          	j	80005bcc <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005c58:	02800513          	li	a0,40
    80005c5c:	ffffd097          	auipc	ra,0xffffd
    80005c60:	048080e7          	jalr	72(ra) # 80002ca4 <_Znwm>
    80005c64:	00050c93          	mv	s9,a0
    80005c68:	00149c13          	slli	s8,s1,0x1
    80005c6c:	009c0c33          	add	s8,s8,s1
    80005c70:	003c1c13          	slli	s8,s8,0x3
    80005c74:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005c78:	ffffd097          	auipc	ra,0xffffd
    80005c7c:	314080e7          	jalr	788(ra) # 80002f8c <_ZN6ThreadC1Ev>
    80005c80:	00007797          	auipc	a5,0x7
    80005c84:	1d878793          	addi	a5,a5,472 # 8000ce58 <_ZTV16ProducerKeyboard+0x10>
    80005c88:	00fcb023          	sd	a5,0(s9)
    80005c8c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005c90:	00349793          	slli	a5,s1,0x3
    80005c94:	00f987b3          	add	a5,s3,a5
    80005c98:	0197b023          	sd	s9,0(a5)
    80005c9c:	f4dff06f          	j	80005be8 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005ca0:	ffffd097          	auipc	ra,0xffffd
    80005ca4:	230080e7          	jalr	560(ra) # 80002ed0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005ca8:	00000493          	li	s1,0
    80005cac:	00994e63          	blt	s2,s1,80005cc8 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005cb0:	00007517          	auipc	a0,0x7
    80005cb4:	46853503          	ld	a0,1128(a0) # 8000d118 <_ZL10waitForAll>
    80005cb8:	ffffd097          	auipc	ra,0xffffd
    80005cbc:	388080e7          	jalr	904(ra) # 80003040 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005cc0:	0014849b          	addiw	s1,s1,1
    80005cc4:	fe9ff06f          	j	80005cac <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005cc8:	00000493          	li	s1,0
    80005ccc:	0080006f          	j	80005cd4 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005cd0:	0014849b          	addiw	s1,s1,1
    80005cd4:	0324d263          	bge	s1,s2,80005cf8 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005cd8:	00349793          	slli	a5,s1,0x3
    80005cdc:	00f987b3          	add	a5,s3,a5
    80005ce0:	0007b503          	ld	a0,0(a5)
    80005ce4:	fe0506e3          	beqz	a0,80005cd0 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005ce8:	00053783          	ld	a5,0(a0)
    80005cec:	0087b783          	ld	a5,8(a5)
    80005cf0:	000780e7          	jalr	a5
    80005cf4:	fddff06f          	j	80005cd0 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005cf8:	000b0a63          	beqz	s6,80005d0c <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005cfc:	000b3783          	ld	a5,0(s6)
    80005d00:	0087b783          	ld	a5,8(a5)
    80005d04:	000b0513          	mv	a0,s6
    80005d08:	000780e7          	jalr	a5
    delete waitForAll;
    80005d0c:	00007517          	auipc	a0,0x7
    80005d10:	40c53503          	ld	a0,1036(a0) # 8000d118 <_ZL10waitForAll>
    80005d14:	00050863          	beqz	a0,80005d24 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005d18:	00053783          	ld	a5,0(a0)
    80005d1c:	0087b783          	ld	a5,8(a5)
    80005d20:	000780e7          	jalr	a5
    delete buffer;
    80005d24:	000a8e63          	beqz	s5,80005d40 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005d28:	000a8513          	mv	a0,s5
    80005d2c:	00001097          	auipc	ra,0x1
    80005d30:	8a8080e7          	jalr	-1880(ra) # 800065d4 <_ZN9BufferCPPD1Ev>
    80005d34:	000a8513          	mv	a0,s5
    80005d38:	ffffd097          	auipc	ra,0xffffd
    80005d3c:	fbc080e7          	jalr	-68(ra) # 80002cf4 <_ZdlPv>
    80005d40:	000b8113          	mv	sp,s7

}
    80005d44:	f8040113          	addi	sp,s0,-128
    80005d48:	07813083          	ld	ra,120(sp)
    80005d4c:	07013403          	ld	s0,112(sp)
    80005d50:	06813483          	ld	s1,104(sp)
    80005d54:	06013903          	ld	s2,96(sp)
    80005d58:	05813983          	ld	s3,88(sp)
    80005d5c:	05013a03          	ld	s4,80(sp)
    80005d60:	04813a83          	ld	s5,72(sp)
    80005d64:	04013b03          	ld	s6,64(sp)
    80005d68:	03813b83          	ld	s7,56(sp)
    80005d6c:	03013c03          	ld	s8,48(sp)
    80005d70:	02813c83          	ld	s9,40(sp)
    80005d74:	08010113          	addi	sp,sp,128
    80005d78:	00008067          	ret
    80005d7c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005d80:	000a8513          	mv	a0,s5
    80005d84:	ffffd097          	auipc	ra,0xffffd
    80005d88:	f70080e7          	jalr	-144(ra) # 80002cf4 <_ZdlPv>
    80005d8c:	00048513          	mv	a0,s1
    80005d90:	00008097          	auipc	ra,0x8
    80005d94:	488080e7          	jalr	1160(ra) # 8000e218 <_Unwind_Resume>
    80005d98:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005d9c:	00048513          	mv	a0,s1
    80005da0:	ffffd097          	auipc	ra,0xffffd
    80005da4:	f54080e7          	jalr	-172(ra) # 80002cf4 <_ZdlPv>
    80005da8:	00090513          	mv	a0,s2
    80005dac:	00008097          	auipc	ra,0x8
    80005db0:	46c080e7          	jalr	1132(ra) # 8000e218 <_Unwind_Resume>
    80005db4:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005db8:	000b0513          	mv	a0,s6
    80005dbc:	ffffd097          	auipc	ra,0xffffd
    80005dc0:	f38080e7          	jalr	-200(ra) # 80002cf4 <_ZdlPv>
    80005dc4:	00048513          	mv	a0,s1
    80005dc8:	00008097          	auipc	ra,0x8
    80005dcc:	450080e7          	jalr	1104(ra) # 8000e218 <_Unwind_Resume>
    80005dd0:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005dd4:	000c8513          	mv	a0,s9
    80005dd8:	ffffd097          	auipc	ra,0xffffd
    80005ddc:	f1c080e7          	jalr	-228(ra) # 80002cf4 <_ZdlPv>
    80005de0:	00048513          	mv	a0,s1
    80005de4:	00008097          	auipc	ra,0x8
    80005de8:	434080e7          	jalr	1076(ra) # 8000e218 <_Unwind_Resume>
    80005dec:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005df0:	000c8513          	mv	a0,s9
    80005df4:	ffffd097          	auipc	ra,0xffffd
    80005df8:	f00080e7          	jalr	-256(ra) # 80002cf4 <_ZdlPv>
    80005dfc:	00048513          	mv	a0,s1
    80005e00:	00008097          	auipc	ra,0x8
    80005e04:	418080e7          	jalr	1048(ra) # 8000e218 <_Unwind_Resume>

0000000080005e08 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005e08:	ff010113          	addi	sp,sp,-16
    80005e0c:	00113423          	sd	ra,8(sp)
    80005e10:	00813023          	sd	s0,0(sp)
    80005e14:	01010413          	addi	s0,sp,16
    80005e18:	00007797          	auipc	a5,0x7
    80005e1c:	09078793          	addi	a5,a5,144 # 8000cea8 <_ZTV12ConsumerSync+0x10>
    80005e20:	00f53023          	sd	a5,0(a0)
    80005e24:	ffffd097          	auipc	ra,0xffffd
    80005e28:	d78080e7          	jalr	-648(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80005e2c:	00813083          	ld	ra,8(sp)
    80005e30:	00013403          	ld	s0,0(sp)
    80005e34:	01010113          	addi	sp,sp,16
    80005e38:	00008067          	ret

0000000080005e3c <_ZN12ConsumerSyncD0Ev>:
    80005e3c:	fe010113          	addi	sp,sp,-32
    80005e40:	00113c23          	sd	ra,24(sp)
    80005e44:	00813823          	sd	s0,16(sp)
    80005e48:	00913423          	sd	s1,8(sp)
    80005e4c:	02010413          	addi	s0,sp,32
    80005e50:	00050493          	mv	s1,a0
    80005e54:	00007797          	auipc	a5,0x7
    80005e58:	05478793          	addi	a5,a5,84 # 8000cea8 <_ZTV12ConsumerSync+0x10>
    80005e5c:	00f53023          	sd	a5,0(a0)
    80005e60:	ffffd097          	auipc	ra,0xffffd
    80005e64:	d3c080e7          	jalr	-708(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80005e68:	00048513          	mv	a0,s1
    80005e6c:	ffffd097          	auipc	ra,0xffffd
    80005e70:	e88080e7          	jalr	-376(ra) # 80002cf4 <_ZdlPv>
    80005e74:	01813083          	ld	ra,24(sp)
    80005e78:	01013403          	ld	s0,16(sp)
    80005e7c:	00813483          	ld	s1,8(sp)
    80005e80:	02010113          	addi	sp,sp,32
    80005e84:	00008067          	ret

0000000080005e88 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005e88:	ff010113          	addi	sp,sp,-16
    80005e8c:	00113423          	sd	ra,8(sp)
    80005e90:	00813023          	sd	s0,0(sp)
    80005e94:	01010413          	addi	s0,sp,16
    80005e98:	00007797          	auipc	a5,0x7
    80005e9c:	fe878793          	addi	a5,a5,-24 # 8000ce80 <_ZTV12ProducerSync+0x10>
    80005ea0:	00f53023          	sd	a5,0(a0)
    80005ea4:	ffffd097          	auipc	ra,0xffffd
    80005ea8:	cf8080e7          	jalr	-776(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80005eac:	00813083          	ld	ra,8(sp)
    80005eb0:	00013403          	ld	s0,0(sp)
    80005eb4:	01010113          	addi	sp,sp,16
    80005eb8:	00008067          	ret

0000000080005ebc <_ZN12ProducerSyncD0Ev>:
    80005ebc:	fe010113          	addi	sp,sp,-32
    80005ec0:	00113c23          	sd	ra,24(sp)
    80005ec4:	00813823          	sd	s0,16(sp)
    80005ec8:	00913423          	sd	s1,8(sp)
    80005ecc:	02010413          	addi	s0,sp,32
    80005ed0:	00050493          	mv	s1,a0
    80005ed4:	00007797          	auipc	a5,0x7
    80005ed8:	fac78793          	addi	a5,a5,-84 # 8000ce80 <_ZTV12ProducerSync+0x10>
    80005edc:	00f53023          	sd	a5,0(a0)
    80005ee0:	ffffd097          	auipc	ra,0xffffd
    80005ee4:	cbc080e7          	jalr	-836(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80005ee8:	00048513          	mv	a0,s1
    80005eec:	ffffd097          	auipc	ra,0xffffd
    80005ef0:	e08080e7          	jalr	-504(ra) # 80002cf4 <_ZdlPv>
    80005ef4:	01813083          	ld	ra,24(sp)
    80005ef8:	01013403          	ld	s0,16(sp)
    80005efc:	00813483          	ld	s1,8(sp)
    80005f00:	02010113          	addi	sp,sp,32
    80005f04:	00008067          	ret

0000000080005f08 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005f08:	ff010113          	addi	sp,sp,-16
    80005f0c:	00113423          	sd	ra,8(sp)
    80005f10:	00813023          	sd	s0,0(sp)
    80005f14:	01010413          	addi	s0,sp,16
    80005f18:	00007797          	auipc	a5,0x7
    80005f1c:	f4078793          	addi	a5,a5,-192 # 8000ce58 <_ZTV16ProducerKeyboard+0x10>
    80005f20:	00f53023          	sd	a5,0(a0)
    80005f24:	ffffd097          	auipc	ra,0xffffd
    80005f28:	c78080e7          	jalr	-904(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80005f2c:	00813083          	ld	ra,8(sp)
    80005f30:	00013403          	ld	s0,0(sp)
    80005f34:	01010113          	addi	sp,sp,16
    80005f38:	00008067          	ret

0000000080005f3c <_ZN16ProducerKeyboardD0Ev>:
    80005f3c:	fe010113          	addi	sp,sp,-32
    80005f40:	00113c23          	sd	ra,24(sp)
    80005f44:	00813823          	sd	s0,16(sp)
    80005f48:	00913423          	sd	s1,8(sp)
    80005f4c:	02010413          	addi	s0,sp,32
    80005f50:	00050493          	mv	s1,a0
    80005f54:	00007797          	auipc	a5,0x7
    80005f58:	f0478793          	addi	a5,a5,-252 # 8000ce58 <_ZTV16ProducerKeyboard+0x10>
    80005f5c:	00f53023          	sd	a5,0(a0)
    80005f60:	ffffd097          	auipc	ra,0xffffd
    80005f64:	c3c080e7          	jalr	-964(ra) # 80002b9c <_ZN6ThreadD1Ev>
    80005f68:	00048513          	mv	a0,s1
    80005f6c:	ffffd097          	auipc	ra,0xffffd
    80005f70:	d88080e7          	jalr	-632(ra) # 80002cf4 <_ZdlPv>
    80005f74:	01813083          	ld	ra,24(sp)
    80005f78:	01013403          	ld	s0,16(sp)
    80005f7c:	00813483          	ld	s1,8(sp)
    80005f80:	02010113          	addi	sp,sp,32
    80005f84:	00008067          	ret

0000000080005f88 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005f88:	ff010113          	addi	sp,sp,-16
    80005f8c:	00113423          	sd	ra,8(sp)
    80005f90:	00813023          	sd	s0,0(sp)
    80005f94:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005f98:	02053583          	ld	a1,32(a0)
    80005f9c:	fffff097          	auipc	ra,0xfffff
    80005fa0:	7e4080e7          	jalr	2020(ra) # 80005780 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005fa4:	00813083          	ld	ra,8(sp)
    80005fa8:	00013403          	ld	s0,0(sp)
    80005fac:	01010113          	addi	sp,sp,16
    80005fb0:	00008067          	ret

0000000080005fb4 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005fb4:	ff010113          	addi	sp,sp,-16
    80005fb8:	00113423          	sd	ra,8(sp)
    80005fbc:	00813023          	sd	s0,0(sp)
    80005fc0:	01010413          	addi	s0,sp,16
        producer(td);
    80005fc4:	02053583          	ld	a1,32(a0)
    80005fc8:	00000097          	auipc	ra,0x0
    80005fcc:	878080e7          	jalr	-1928(ra) # 80005840 <_ZN12ProducerSync8producerEPv>
    }
    80005fd0:	00813083          	ld	ra,8(sp)
    80005fd4:	00013403          	ld	s0,0(sp)
    80005fd8:	01010113          	addi	sp,sp,16
    80005fdc:	00008067          	ret

0000000080005fe0 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005fe0:	ff010113          	addi	sp,sp,-16
    80005fe4:	00113423          	sd	ra,8(sp)
    80005fe8:	00813023          	sd	s0,0(sp)
    80005fec:	01010413          	addi	s0,sp,16
        consumer(td);
    80005ff0:	02053583          	ld	a1,32(a0)
    80005ff4:	00000097          	auipc	ra,0x0
    80005ff8:	8e0080e7          	jalr	-1824(ra) # 800058d4 <_ZN12ConsumerSync8consumerEPv>
    }
    80005ffc:	00813083          	ld	ra,8(sp)
    80006000:	00013403          	ld	s0,0(sp)
    80006004:	01010113          	addi	sp,sp,16
    80006008:	00008067          	ret

000000008000600c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    8000600c:	fe010113          	addi	sp,sp,-32
    80006010:	00113c23          	sd	ra,24(sp)
    80006014:	00813823          	sd	s0,16(sp)
    80006018:	00913423          	sd	s1,8(sp)
    8000601c:	02010413          	addi	s0,sp,32
    80006020:	00050493          	mv	s1,a0
    LOCK();
    80006024:	00100613          	li	a2,1
    80006028:	00000593          	li	a1,0
    8000602c:	00007517          	auipc	a0,0x7
    80006030:	0f450513          	addi	a0,a0,244 # 8000d120 <lockPrint>
    80006034:	ffffb097          	auipc	ra,0xffffb
    80006038:	0f0080e7          	jalr	240(ra) # 80001124 <copy_and_swap>
    8000603c:	00050863          	beqz	a0,8000604c <_Z11printStringPKc+0x40>
    80006040:	ffffb097          	auipc	ra,0xffffb
    80006044:	480080e7          	jalr	1152(ra) # 800014c0 <_Z15thread_dispatchv>
    80006048:	fddff06f          	j	80006024 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    8000604c:	0004c503          	lbu	a0,0(s1)
    80006050:	00050a63          	beqz	a0,80006064 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80006054:	ffffb097          	auipc	ra,0xffffb
    80006058:	5d4080e7          	jalr	1492(ra) # 80001628 <_Z4putcc>
        string++;
    8000605c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80006060:	fedff06f          	j	8000604c <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80006064:	00000613          	li	a2,0
    80006068:	00100593          	li	a1,1
    8000606c:	00007517          	auipc	a0,0x7
    80006070:	0b450513          	addi	a0,a0,180 # 8000d120 <lockPrint>
    80006074:	ffffb097          	auipc	ra,0xffffb
    80006078:	0b0080e7          	jalr	176(ra) # 80001124 <copy_and_swap>
    8000607c:	fe0514e3          	bnez	a0,80006064 <_Z11printStringPKc+0x58>
}
    80006080:	01813083          	ld	ra,24(sp)
    80006084:	01013403          	ld	s0,16(sp)
    80006088:	00813483          	ld	s1,8(sp)
    8000608c:	02010113          	addi	sp,sp,32
    80006090:	00008067          	ret

0000000080006094 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80006094:	fd010113          	addi	sp,sp,-48
    80006098:	02113423          	sd	ra,40(sp)
    8000609c:	02813023          	sd	s0,32(sp)
    800060a0:	00913c23          	sd	s1,24(sp)
    800060a4:	01213823          	sd	s2,16(sp)
    800060a8:	01313423          	sd	s3,8(sp)
    800060ac:	01413023          	sd	s4,0(sp)
    800060b0:	03010413          	addi	s0,sp,48
    800060b4:	00050993          	mv	s3,a0
    800060b8:	00058a13          	mv	s4,a1
    LOCK();
    800060bc:	00100613          	li	a2,1
    800060c0:	00000593          	li	a1,0
    800060c4:	00007517          	auipc	a0,0x7
    800060c8:	05c50513          	addi	a0,a0,92 # 8000d120 <lockPrint>
    800060cc:	ffffb097          	auipc	ra,0xffffb
    800060d0:	058080e7          	jalr	88(ra) # 80001124 <copy_and_swap>
    800060d4:	00050863          	beqz	a0,800060e4 <_Z9getStringPci+0x50>
    800060d8:	ffffb097          	auipc	ra,0xffffb
    800060dc:	3e8080e7          	jalr	1000(ra) # 800014c0 <_Z15thread_dispatchv>
    800060e0:	fddff06f          	j	800060bc <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800060e4:	00000913          	li	s2,0
    800060e8:	00090493          	mv	s1,s2
    800060ec:	0019091b          	addiw	s2,s2,1
    800060f0:	03495a63          	bge	s2,s4,80006124 <_Z9getStringPci+0x90>
        cc = getc();
    800060f4:	ffffb097          	auipc	ra,0xffffb
    800060f8:	50c080e7          	jalr	1292(ra) # 80001600 <_Z4getcv>
        if(cc < 1)
    800060fc:	02050463          	beqz	a0,80006124 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80006100:	009984b3          	add	s1,s3,s1
    80006104:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80006108:	00a00793          	li	a5,10
    8000610c:	00f50a63          	beq	a0,a5,80006120 <_Z9getStringPci+0x8c>
    80006110:	00d00793          	li	a5,13
    80006114:	fcf51ae3          	bne	a0,a5,800060e8 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80006118:	00090493          	mv	s1,s2
    8000611c:	0080006f          	j	80006124 <_Z9getStringPci+0x90>
    80006120:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80006124:	009984b3          	add	s1,s3,s1
    80006128:	00048023          	sb	zero,0(s1)

    UNLOCK();
    8000612c:	00000613          	li	a2,0
    80006130:	00100593          	li	a1,1
    80006134:	00007517          	auipc	a0,0x7
    80006138:	fec50513          	addi	a0,a0,-20 # 8000d120 <lockPrint>
    8000613c:	ffffb097          	auipc	ra,0xffffb
    80006140:	fe8080e7          	jalr	-24(ra) # 80001124 <copy_and_swap>
    80006144:	fe0514e3          	bnez	a0,8000612c <_Z9getStringPci+0x98>
    return buf;
}
    80006148:	00098513          	mv	a0,s3
    8000614c:	02813083          	ld	ra,40(sp)
    80006150:	02013403          	ld	s0,32(sp)
    80006154:	01813483          	ld	s1,24(sp)
    80006158:	01013903          	ld	s2,16(sp)
    8000615c:	00813983          	ld	s3,8(sp)
    80006160:	00013a03          	ld	s4,0(sp)
    80006164:	03010113          	addi	sp,sp,48
    80006168:	00008067          	ret

000000008000616c <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    8000616c:	ff010113          	addi	sp,sp,-16
    80006170:	00813423          	sd	s0,8(sp)
    80006174:	01010413          	addi	s0,sp,16
    80006178:	00050693          	mv	a3,a0
    int n;

    n = 0;
    8000617c:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80006180:	0006c603          	lbu	a2,0(a3)
    80006184:	fd06071b          	addiw	a4,a2,-48
    80006188:	0ff77713          	andi	a4,a4,255
    8000618c:	00900793          	li	a5,9
    80006190:	02e7e063          	bltu	a5,a4,800061b0 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80006194:	0025179b          	slliw	a5,a0,0x2
    80006198:	00a787bb          	addw	a5,a5,a0
    8000619c:	0017979b          	slliw	a5,a5,0x1
    800061a0:	00168693          	addi	a3,a3,1
    800061a4:	00c787bb          	addw	a5,a5,a2
    800061a8:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800061ac:	fd5ff06f          	j	80006180 <_Z11stringToIntPKc+0x14>
    return n;
}
    800061b0:	00813403          	ld	s0,8(sp)
    800061b4:	01010113          	addi	sp,sp,16
    800061b8:	00008067          	ret

00000000800061bc <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800061bc:	fc010113          	addi	sp,sp,-64
    800061c0:	02113c23          	sd	ra,56(sp)
    800061c4:	02813823          	sd	s0,48(sp)
    800061c8:	02913423          	sd	s1,40(sp)
    800061cc:	03213023          	sd	s2,32(sp)
    800061d0:	01313c23          	sd	s3,24(sp)
    800061d4:	04010413          	addi	s0,sp,64
    800061d8:	00050493          	mv	s1,a0
    800061dc:	00058913          	mv	s2,a1
    800061e0:	00060993          	mv	s3,a2
    LOCK();
    800061e4:	00100613          	li	a2,1
    800061e8:	00000593          	li	a1,0
    800061ec:	00007517          	auipc	a0,0x7
    800061f0:	f3450513          	addi	a0,a0,-204 # 8000d120 <lockPrint>
    800061f4:	ffffb097          	auipc	ra,0xffffb
    800061f8:	f30080e7          	jalr	-208(ra) # 80001124 <copy_and_swap>
    800061fc:	00050863          	beqz	a0,8000620c <_Z8printIntiii+0x50>
    80006200:	ffffb097          	auipc	ra,0xffffb
    80006204:	2c0080e7          	jalr	704(ra) # 800014c0 <_Z15thread_dispatchv>
    80006208:	fddff06f          	j	800061e4 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    8000620c:	00098463          	beqz	s3,80006214 <_Z8printIntiii+0x58>
    80006210:	0804c463          	bltz	s1,80006298 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80006214:	0004851b          	sext.w	a0,s1
    neg = 0;
    80006218:	00000593          	li	a1,0
    }

    i = 0;
    8000621c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80006220:	0009079b          	sext.w	a5,s2
    80006224:	0325773b          	remuw	a4,a0,s2
    80006228:	00048613          	mv	a2,s1
    8000622c:	0014849b          	addiw	s1,s1,1
    80006230:	02071693          	slli	a3,a4,0x20
    80006234:	0206d693          	srli	a3,a3,0x20
    80006238:	00007717          	auipc	a4,0x7
    8000623c:	c8870713          	addi	a4,a4,-888 # 8000cec0 <digits>
    80006240:	00d70733          	add	a4,a4,a3
    80006244:	00074683          	lbu	a3,0(a4)
    80006248:	fd040713          	addi	a4,s0,-48
    8000624c:	00c70733          	add	a4,a4,a2
    80006250:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80006254:	0005071b          	sext.w	a4,a0
    80006258:	0325553b          	divuw	a0,a0,s2
    8000625c:	fcf772e3          	bgeu	a4,a5,80006220 <_Z8printIntiii+0x64>
    if(neg)
    80006260:	00058c63          	beqz	a1,80006278 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80006264:	fd040793          	addi	a5,s0,-48
    80006268:	009784b3          	add	s1,a5,s1
    8000626c:	02d00793          	li	a5,45
    80006270:	fef48823          	sb	a5,-16(s1)
    80006274:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80006278:	fff4849b          	addiw	s1,s1,-1
    8000627c:	0204c463          	bltz	s1,800062a4 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80006280:	fd040793          	addi	a5,s0,-48
    80006284:	009787b3          	add	a5,a5,s1
    80006288:	ff07c503          	lbu	a0,-16(a5)
    8000628c:	ffffb097          	auipc	ra,0xffffb
    80006290:	39c080e7          	jalr	924(ra) # 80001628 <_Z4putcc>
    80006294:	fe5ff06f          	j	80006278 <_Z8printIntiii+0xbc>
        x = -xx;
    80006298:	4090053b          	negw	a0,s1
        neg = 1;
    8000629c:	00100593          	li	a1,1
        x = -xx;
    800062a0:	f7dff06f          	j	8000621c <_Z8printIntiii+0x60>

    UNLOCK();
    800062a4:	00000613          	li	a2,0
    800062a8:	00100593          	li	a1,1
    800062ac:	00007517          	auipc	a0,0x7
    800062b0:	e7450513          	addi	a0,a0,-396 # 8000d120 <lockPrint>
    800062b4:	ffffb097          	auipc	ra,0xffffb
    800062b8:	e70080e7          	jalr	-400(ra) # 80001124 <copy_and_swap>
    800062bc:	fe0514e3          	bnez	a0,800062a4 <_Z8printIntiii+0xe8>
    800062c0:	03813083          	ld	ra,56(sp)
    800062c4:	03013403          	ld	s0,48(sp)
    800062c8:	02813483          	ld	s1,40(sp)
    800062cc:	02013903          	ld	s2,32(sp)
    800062d0:	01813983          	ld	s3,24(sp)
    800062d4:	04010113          	addi	sp,sp,64
    800062d8:	00008067          	ret

00000000800062dc <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800062dc:	fd010113          	addi	sp,sp,-48
    800062e0:	02113423          	sd	ra,40(sp)
    800062e4:	02813023          	sd	s0,32(sp)
    800062e8:	00913c23          	sd	s1,24(sp)
    800062ec:	01213823          	sd	s2,16(sp)
    800062f0:	01313423          	sd	s3,8(sp)
    800062f4:	03010413          	addi	s0,sp,48
    800062f8:	00050493          	mv	s1,a0
    800062fc:	00058913          	mv	s2,a1
    80006300:	0015879b          	addiw	a5,a1,1
    80006304:	0007851b          	sext.w	a0,a5
    80006308:	00f4a023          	sw	a5,0(s1)
    8000630c:	0004a823          	sw	zero,16(s1)
    80006310:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006314:	00251513          	slli	a0,a0,0x2
    80006318:	ffffb097          	auipc	ra,0xffffb
    8000631c:	07c080e7          	jalr	124(ra) # 80001394 <_Z9mem_allocm>
    80006320:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006324:	01000513          	li	a0,16
    80006328:	ffffd097          	auipc	ra,0xffffd
    8000632c:	97c080e7          	jalr	-1668(ra) # 80002ca4 <_Znwm>
    80006330:	00050993          	mv	s3,a0
    80006334:	00000593          	li	a1,0
    80006338:	ffffd097          	auipc	ra,0xffffd
    8000633c:	cd0080e7          	jalr	-816(ra) # 80003008 <_ZN9SemaphoreC1Ej>
    80006340:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80006344:	01000513          	li	a0,16
    80006348:	ffffd097          	auipc	ra,0xffffd
    8000634c:	95c080e7          	jalr	-1700(ra) # 80002ca4 <_Znwm>
    80006350:	00050993          	mv	s3,a0
    80006354:	00090593          	mv	a1,s2
    80006358:	ffffd097          	auipc	ra,0xffffd
    8000635c:	cb0080e7          	jalr	-848(ra) # 80003008 <_ZN9SemaphoreC1Ej>
    80006360:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80006364:	01000513          	li	a0,16
    80006368:	ffffd097          	auipc	ra,0xffffd
    8000636c:	93c080e7          	jalr	-1732(ra) # 80002ca4 <_Znwm>
    80006370:	00050913          	mv	s2,a0
    80006374:	00100593          	li	a1,1
    80006378:	ffffd097          	auipc	ra,0xffffd
    8000637c:	c90080e7          	jalr	-880(ra) # 80003008 <_ZN9SemaphoreC1Ej>
    80006380:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006384:	01000513          	li	a0,16
    80006388:	ffffd097          	auipc	ra,0xffffd
    8000638c:	91c080e7          	jalr	-1764(ra) # 80002ca4 <_Znwm>
    80006390:	00050913          	mv	s2,a0
    80006394:	00100593          	li	a1,1
    80006398:	ffffd097          	auipc	ra,0xffffd
    8000639c:	c70080e7          	jalr	-912(ra) # 80003008 <_ZN9SemaphoreC1Ej>
    800063a0:	0324b823          	sd	s2,48(s1)
}
    800063a4:	02813083          	ld	ra,40(sp)
    800063a8:	02013403          	ld	s0,32(sp)
    800063ac:	01813483          	ld	s1,24(sp)
    800063b0:	01013903          	ld	s2,16(sp)
    800063b4:	00813983          	ld	s3,8(sp)
    800063b8:	03010113          	addi	sp,sp,48
    800063bc:	00008067          	ret
    800063c0:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    800063c4:	00098513          	mv	a0,s3
    800063c8:	ffffd097          	auipc	ra,0xffffd
    800063cc:	92c080e7          	jalr	-1748(ra) # 80002cf4 <_ZdlPv>
    800063d0:	00048513          	mv	a0,s1
    800063d4:	00008097          	auipc	ra,0x8
    800063d8:	e44080e7          	jalr	-444(ra) # 8000e218 <_Unwind_Resume>
    800063dc:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800063e0:	00098513          	mv	a0,s3
    800063e4:	ffffd097          	auipc	ra,0xffffd
    800063e8:	910080e7          	jalr	-1776(ra) # 80002cf4 <_ZdlPv>
    800063ec:	00048513          	mv	a0,s1
    800063f0:	00008097          	auipc	ra,0x8
    800063f4:	e28080e7          	jalr	-472(ra) # 8000e218 <_Unwind_Resume>
    800063f8:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800063fc:	00090513          	mv	a0,s2
    80006400:	ffffd097          	auipc	ra,0xffffd
    80006404:	8f4080e7          	jalr	-1804(ra) # 80002cf4 <_ZdlPv>
    80006408:	00048513          	mv	a0,s1
    8000640c:	00008097          	auipc	ra,0x8
    80006410:	e0c080e7          	jalr	-500(ra) # 8000e218 <_Unwind_Resume>
    80006414:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006418:	00090513          	mv	a0,s2
    8000641c:	ffffd097          	auipc	ra,0xffffd
    80006420:	8d8080e7          	jalr	-1832(ra) # 80002cf4 <_ZdlPv>
    80006424:	00048513          	mv	a0,s1
    80006428:	00008097          	auipc	ra,0x8
    8000642c:	df0080e7          	jalr	-528(ra) # 8000e218 <_Unwind_Resume>

0000000080006430 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80006430:	fe010113          	addi	sp,sp,-32
    80006434:	00113c23          	sd	ra,24(sp)
    80006438:	00813823          	sd	s0,16(sp)
    8000643c:	00913423          	sd	s1,8(sp)
    80006440:	01213023          	sd	s2,0(sp)
    80006444:	02010413          	addi	s0,sp,32
    80006448:	00050493          	mv	s1,a0
    8000644c:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80006450:	01853503          	ld	a0,24(a0)
    80006454:	ffffd097          	auipc	ra,0xffffd
    80006458:	bec080e7          	jalr	-1044(ra) # 80003040 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    8000645c:	0304b503          	ld	a0,48(s1)
    80006460:	ffffd097          	auipc	ra,0xffffd
    80006464:	be0080e7          	jalr	-1056(ra) # 80003040 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80006468:	0084b783          	ld	a5,8(s1)
    8000646c:	0144a703          	lw	a4,20(s1)
    80006470:	00271713          	slli	a4,a4,0x2
    80006474:	00e787b3          	add	a5,a5,a4
    80006478:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000647c:	0144a783          	lw	a5,20(s1)
    80006480:	0017879b          	addiw	a5,a5,1
    80006484:	0004a703          	lw	a4,0(s1)
    80006488:	02e7e7bb          	remw	a5,a5,a4
    8000648c:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006490:	0304b503          	ld	a0,48(s1)
    80006494:	ffffd097          	auipc	ra,0xffffd
    80006498:	bd8080e7          	jalr	-1064(ra) # 8000306c <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    8000649c:	0204b503          	ld	a0,32(s1)
    800064a0:	ffffd097          	auipc	ra,0xffffd
    800064a4:	bcc080e7          	jalr	-1076(ra) # 8000306c <_ZN9Semaphore6signalEv>

}
    800064a8:	01813083          	ld	ra,24(sp)
    800064ac:	01013403          	ld	s0,16(sp)
    800064b0:	00813483          	ld	s1,8(sp)
    800064b4:	00013903          	ld	s2,0(sp)
    800064b8:	02010113          	addi	sp,sp,32
    800064bc:	00008067          	ret

00000000800064c0 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    800064c0:	fe010113          	addi	sp,sp,-32
    800064c4:	00113c23          	sd	ra,24(sp)
    800064c8:	00813823          	sd	s0,16(sp)
    800064cc:	00913423          	sd	s1,8(sp)
    800064d0:	01213023          	sd	s2,0(sp)
    800064d4:	02010413          	addi	s0,sp,32
    800064d8:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800064dc:	02053503          	ld	a0,32(a0)
    800064e0:	ffffd097          	auipc	ra,0xffffd
    800064e4:	b60080e7          	jalr	-1184(ra) # 80003040 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    800064e8:	0284b503          	ld	a0,40(s1)
    800064ec:	ffffd097          	auipc	ra,0xffffd
    800064f0:	b54080e7          	jalr	-1196(ra) # 80003040 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    800064f4:	0084b703          	ld	a4,8(s1)
    800064f8:	0104a783          	lw	a5,16(s1)
    800064fc:	00279693          	slli	a3,a5,0x2
    80006500:	00d70733          	add	a4,a4,a3
    80006504:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006508:	0017879b          	addiw	a5,a5,1
    8000650c:	0004a703          	lw	a4,0(s1)
    80006510:	02e7e7bb          	remw	a5,a5,a4
    80006514:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006518:	0284b503          	ld	a0,40(s1)
    8000651c:	ffffd097          	auipc	ra,0xffffd
    80006520:	b50080e7          	jalr	-1200(ra) # 8000306c <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006524:	0184b503          	ld	a0,24(s1)
    80006528:	ffffd097          	auipc	ra,0xffffd
    8000652c:	b44080e7          	jalr	-1212(ra) # 8000306c <_ZN9Semaphore6signalEv>

    return ret;
}
    80006530:	00090513          	mv	a0,s2
    80006534:	01813083          	ld	ra,24(sp)
    80006538:	01013403          	ld	s0,16(sp)
    8000653c:	00813483          	ld	s1,8(sp)
    80006540:	00013903          	ld	s2,0(sp)
    80006544:	02010113          	addi	sp,sp,32
    80006548:	00008067          	ret

000000008000654c <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    8000654c:	fe010113          	addi	sp,sp,-32
    80006550:	00113c23          	sd	ra,24(sp)
    80006554:	00813823          	sd	s0,16(sp)
    80006558:	00913423          	sd	s1,8(sp)
    8000655c:	01213023          	sd	s2,0(sp)
    80006560:	02010413          	addi	s0,sp,32
    80006564:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006568:	02853503          	ld	a0,40(a0)
    8000656c:	ffffd097          	auipc	ra,0xffffd
    80006570:	ad4080e7          	jalr	-1324(ra) # 80003040 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006574:	0304b503          	ld	a0,48(s1)
    80006578:	ffffd097          	auipc	ra,0xffffd
    8000657c:	ac8080e7          	jalr	-1336(ra) # 80003040 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006580:	0144a783          	lw	a5,20(s1)
    80006584:	0104a903          	lw	s2,16(s1)
    80006588:	0327ce63          	blt	a5,s2,800065c4 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    8000658c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006590:	0304b503          	ld	a0,48(s1)
    80006594:	ffffd097          	auipc	ra,0xffffd
    80006598:	ad8080e7          	jalr	-1320(ra) # 8000306c <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    8000659c:	0284b503          	ld	a0,40(s1)
    800065a0:	ffffd097          	auipc	ra,0xffffd
    800065a4:	acc080e7          	jalr	-1332(ra) # 8000306c <_ZN9Semaphore6signalEv>

    return ret;
}
    800065a8:	00090513          	mv	a0,s2
    800065ac:	01813083          	ld	ra,24(sp)
    800065b0:	01013403          	ld	s0,16(sp)
    800065b4:	00813483          	ld	s1,8(sp)
    800065b8:	00013903          	ld	s2,0(sp)
    800065bc:	02010113          	addi	sp,sp,32
    800065c0:	00008067          	ret
        ret = cap - head + tail;
    800065c4:	0004a703          	lw	a4,0(s1)
    800065c8:	4127093b          	subw	s2,a4,s2
    800065cc:	00f9093b          	addw	s2,s2,a5
    800065d0:	fc1ff06f          	j	80006590 <_ZN9BufferCPP6getCntEv+0x44>

00000000800065d4 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800065d4:	fe010113          	addi	sp,sp,-32
    800065d8:	00113c23          	sd	ra,24(sp)
    800065dc:	00813823          	sd	s0,16(sp)
    800065e0:	00913423          	sd	s1,8(sp)
    800065e4:	02010413          	addi	s0,sp,32
    800065e8:	00050493          	mv	s1,a0
    Console::putc('\n');
    800065ec:	00a00513          	li	a0,10
    800065f0:	ffffd097          	auipc	ra,0xffffd
    800065f4:	b40080e7          	jalr	-1216(ra) # 80003130 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800065f8:	00004517          	auipc	a0,0x4
    800065fc:	ed850513          	addi	a0,a0,-296 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80006600:	00000097          	auipc	ra,0x0
    80006604:	a0c080e7          	jalr	-1524(ra) # 8000600c <_Z11printStringPKc>
    while (getCnt()) {
    80006608:	00048513          	mv	a0,s1
    8000660c:	00000097          	auipc	ra,0x0
    80006610:	f40080e7          	jalr	-192(ra) # 8000654c <_ZN9BufferCPP6getCntEv>
    80006614:	02050c63          	beqz	a0,8000664c <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006618:	0084b783          	ld	a5,8(s1)
    8000661c:	0104a703          	lw	a4,16(s1)
    80006620:	00271713          	slli	a4,a4,0x2
    80006624:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006628:	0007c503          	lbu	a0,0(a5)
    8000662c:	ffffd097          	auipc	ra,0xffffd
    80006630:	b04080e7          	jalr	-1276(ra) # 80003130 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006634:	0104a783          	lw	a5,16(s1)
    80006638:	0017879b          	addiw	a5,a5,1
    8000663c:	0004a703          	lw	a4,0(s1)
    80006640:	02e7e7bb          	remw	a5,a5,a4
    80006644:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006648:	fc1ff06f          	j	80006608 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    8000664c:	02100513          	li	a0,33
    80006650:	ffffd097          	auipc	ra,0xffffd
    80006654:	ae0080e7          	jalr	-1312(ra) # 80003130 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006658:	00a00513          	li	a0,10
    8000665c:	ffffd097          	auipc	ra,0xffffd
    80006660:	ad4080e7          	jalr	-1324(ra) # 80003130 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006664:	0084b503          	ld	a0,8(s1)
    80006668:	ffffb097          	auipc	ra,0xffffb
    8000666c:	d6c080e7          	jalr	-660(ra) # 800013d4 <_Z8mem_freePv>
    delete itemAvailable;
    80006670:	0204b503          	ld	a0,32(s1)
    80006674:	00050863          	beqz	a0,80006684 <_ZN9BufferCPPD1Ev+0xb0>
    80006678:	00053783          	ld	a5,0(a0)
    8000667c:	0087b783          	ld	a5,8(a5)
    80006680:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006684:	0184b503          	ld	a0,24(s1)
    80006688:	00050863          	beqz	a0,80006698 <_ZN9BufferCPPD1Ev+0xc4>
    8000668c:	00053783          	ld	a5,0(a0)
    80006690:	0087b783          	ld	a5,8(a5)
    80006694:	000780e7          	jalr	a5
    delete mutexTail;
    80006698:	0304b503          	ld	a0,48(s1)
    8000669c:	00050863          	beqz	a0,800066ac <_ZN9BufferCPPD1Ev+0xd8>
    800066a0:	00053783          	ld	a5,0(a0)
    800066a4:	0087b783          	ld	a5,8(a5)
    800066a8:	000780e7          	jalr	a5
    delete mutexHead;
    800066ac:	0284b503          	ld	a0,40(s1)
    800066b0:	00050863          	beqz	a0,800066c0 <_ZN9BufferCPPD1Ev+0xec>
    800066b4:	00053783          	ld	a5,0(a0)
    800066b8:	0087b783          	ld	a5,8(a5)
    800066bc:	000780e7          	jalr	a5
}
    800066c0:	01813083          	ld	ra,24(sp)
    800066c4:	01013403          	ld	s0,16(sp)
    800066c8:	00813483          	ld	s1,8(sp)
    800066cc:	02010113          	addi	sp,sp,32
    800066d0:	00008067          	ret

00000000800066d4 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    800066d4:	fe010113          	addi	sp,sp,-32
    800066d8:	00113c23          	sd	ra,24(sp)
    800066dc:	00813823          	sd	s0,16(sp)
    800066e0:	00913423          	sd	s1,8(sp)
    800066e4:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    800066e8:	00004517          	auipc	a0,0x4
    800066ec:	e0050513          	addi	a0,a0,-512 # 8000a4e8 <CONSOLE_STATUS+0x4d8>
    800066f0:	00000097          	auipc	ra,0x0
    800066f4:	91c080e7          	jalr	-1764(ra) # 8000600c <_Z11printStringPKc>
    int test = getc() - '0';
    800066f8:	ffffb097          	auipc	ra,0xffffb
    800066fc:	f08080e7          	jalr	-248(ra) # 80001600 <_Z4getcv>
    80006700:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80006704:	ffffb097          	auipc	ra,0xffffb
    80006708:	efc080e7          	jalr	-260(ra) # 80001600 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    8000670c:	00700793          	li	a5,7
    80006710:	1097e263          	bltu	a5,s1,80006814 <_Z8userMainv+0x140>
    80006714:	00249493          	slli	s1,s1,0x2
    80006718:	00004717          	auipc	a4,0x4
    8000671c:	02870713          	addi	a4,a4,40 # 8000a740 <CONSOLE_STATUS+0x730>
    80006720:	00e484b3          	add	s1,s1,a4
    80006724:	0004a783          	lw	a5,0(s1)
    80006728:	00e787b3          	add	a5,a5,a4
    8000672c:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80006730:	fffff097          	auipc	ra,0xfffff
    80006734:	f54080e7          	jalr	-172(ra) # 80005684 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006738:	00004517          	auipc	a0,0x4
    8000673c:	dd050513          	addi	a0,a0,-560 # 8000a508 <CONSOLE_STATUS+0x4f8>
    80006740:	00000097          	auipc	ra,0x0
    80006744:	8cc080e7          	jalr	-1844(ra) # 8000600c <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006748:	01813083          	ld	ra,24(sp)
    8000674c:	01013403          	ld	s0,16(sp)
    80006750:	00813483          	ld	s1,8(sp)
    80006754:	02010113          	addi	sp,sp,32
    80006758:	00008067          	ret
            Threads_CPP_API_test();
    8000675c:	ffffe097          	auipc	ra,0xffffe
    80006760:	e08080e7          	jalr	-504(ra) # 80004564 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006764:	00004517          	auipc	a0,0x4
    80006768:	de450513          	addi	a0,a0,-540 # 8000a548 <CONSOLE_STATUS+0x538>
    8000676c:	00000097          	auipc	ra,0x0
    80006770:	8a0080e7          	jalr	-1888(ra) # 8000600c <_Z11printStringPKc>
            break;
    80006774:	fd5ff06f          	j	80006748 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006778:	ffffd097          	auipc	ra,0xffffd
    8000677c:	640080e7          	jalr	1600(ra) # 80003db8 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006780:	00004517          	auipc	a0,0x4
    80006784:	e0850513          	addi	a0,a0,-504 # 8000a588 <CONSOLE_STATUS+0x578>
    80006788:	00000097          	auipc	ra,0x0
    8000678c:	884080e7          	jalr	-1916(ra) # 8000600c <_Z11printStringPKc>
            break;
    80006790:	fb9ff06f          	j	80006748 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006794:	fffff097          	auipc	ra,0xfffff
    80006798:	234080e7          	jalr	564(ra) # 800059c8 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    8000679c:	00004517          	auipc	a0,0x4
    800067a0:	e3c50513          	addi	a0,a0,-452 # 8000a5d8 <CONSOLE_STATUS+0x5c8>
    800067a4:	00000097          	auipc	ra,0x0
    800067a8:	868080e7          	jalr	-1944(ra) # 8000600c <_Z11printStringPKc>
            break;
    800067ac:	f9dff06f          	j	80006748 <_Z8userMainv+0x74>
            testSleeping();
    800067b0:	00000097          	auipc	ra,0x0
    800067b4:	11c080e7          	jalr	284(ra) # 800068cc <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    800067b8:	00004517          	auipc	a0,0x4
    800067bc:	e7850513          	addi	a0,a0,-392 # 8000a630 <CONSOLE_STATUS+0x620>
    800067c0:	00000097          	auipc	ra,0x0
    800067c4:	84c080e7          	jalr	-1972(ra) # 8000600c <_Z11printStringPKc>
            break;
    800067c8:	f81ff06f          	j	80006748 <_Z8userMainv+0x74>
            testConsumerProducer();
    800067cc:	ffffe097          	auipc	ra,0xffffe
    800067d0:	258080e7          	jalr	600(ra) # 80004a24 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    800067d4:	00004517          	auipc	a0,0x4
    800067d8:	e8c50513          	addi	a0,a0,-372 # 8000a660 <CONSOLE_STATUS+0x650>
    800067dc:	00000097          	auipc	ra,0x0
    800067e0:	830080e7          	jalr	-2000(ra) # 8000600c <_Z11printStringPKc>
            break;
    800067e4:	f65ff06f          	j	80006748 <_Z8userMainv+0x74>
            System_Mode_test();
    800067e8:	00000097          	auipc	ra,0x0
    800067ec:	658080e7          	jalr	1624(ra) # 80006e40 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    800067f0:	00004517          	auipc	a0,0x4
    800067f4:	eb050513          	addi	a0,a0,-336 # 8000a6a0 <CONSOLE_STATUS+0x690>
    800067f8:	00000097          	auipc	ra,0x0
    800067fc:	814080e7          	jalr	-2028(ra) # 8000600c <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006800:	00004517          	auipc	a0,0x4
    80006804:	ec050513          	addi	a0,a0,-320 # 8000a6c0 <CONSOLE_STATUS+0x6b0>
    80006808:	00000097          	auipc	ra,0x0
    8000680c:	804080e7          	jalr	-2044(ra) # 8000600c <_Z11printStringPKc>
            break;
    80006810:	f39ff06f          	j	80006748 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80006814:	00004517          	auipc	a0,0x4
    80006818:	f0450513          	addi	a0,a0,-252 # 8000a718 <CONSOLE_STATUS+0x708>
    8000681c:	fffff097          	auipc	ra,0xfffff
    80006820:	7f0080e7          	jalr	2032(ra) # 8000600c <_Z11printStringPKc>
    80006824:	f25ff06f          	j	80006748 <_Z8userMainv+0x74>

0000000080006828 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006828:	fe010113          	addi	sp,sp,-32
    8000682c:	00113c23          	sd	ra,24(sp)
    80006830:	00813823          	sd	s0,16(sp)
    80006834:	00913423          	sd	s1,8(sp)
    80006838:	01213023          	sd	s2,0(sp)
    8000683c:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006840:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006844:	00600493          	li	s1,6
    while (--i > 0) {
    80006848:	fff4849b          	addiw	s1,s1,-1
    8000684c:	04905463          	blez	s1,80006894 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006850:	00004517          	auipc	a0,0x4
    80006854:	f1050513          	addi	a0,a0,-240 # 8000a760 <CONSOLE_STATUS+0x750>
    80006858:	fffff097          	auipc	ra,0xfffff
    8000685c:	7b4080e7          	jalr	1972(ra) # 8000600c <_Z11printStringPKc>
        printInt(sleep_time);
    80006860:	00000613          	li	a2,0
    80006864:	00a00593          	li	a1,10
    80006868:	0009051b          	sext.w	a0,s2
    8000686c:	00000097          	auipc	ra,0x0
    80006870:	950080e7          	jalr	-1712(ra) # 800061bc <_Z8printIntiii>
        printString(" !\n");
    80006874:	00004517          	auipc	a0,0x4
    80006878:	ef450513          	addi	a0,a0,-268 # 8000a768 <CONSOLE_STATUS+0x758>
    8000687c:	fffff097          	auipc	ra,0xfffff
    80006880:	790080e7          	jalr	1936(ra) # 8000600c <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006884:	00090513          	mv	a0,s2
    80006888:	ffffb097          	auipc	ra,0xffffb
    8000688c:	c80080e7          	jalr	-896(ra) # 80001508 <_Z10time_sleepm>
    while (--i > 0) {
    80006890:	fb9ff06f          	j	80006848 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006894:	00a00793          	li	a5,10
    80006898:	02f95933          	divu	s2,s2,a5
    8000689c:	fff90913          	addi	s2,s2,-1
    800068a0:	00007797          	auipc	a5,0x7
    800068a4:	88878793          	addi	a5,a5,-1912 # 8000d128 <_ZL8finished>
    800068a8:	01278933          	add	s2,a5,s2
    800068ac:	00100793          	li	a5,1
    800068b0:	00f90023          	sb	a5,0(s2)
}
    800068b4:	01813083          	ld	ra,24(sp)
    800068b8:	01013403          	ld	s0,16(sp)
    800068bc:	00813483          	ld	s1,8(sp)
    800068c0:	00013903          	ld	s2,0(sp)
    800068c4:	02010113          	addi	sp,sp,32
    800068c8:	00008067          	ret

00000000800068cc <_Z12testSleepingv>:

void testSleeping() {
    800068cc:	fc010113          	addi	sp,sp,-64
    800068d0:	02113c23          	sd	ra,56(sp)
    800068d4:	02813823          	sd	s0,48(sp)
    800068d8:	02913423          	sd	s1,40(sp)
    800068dc:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800068e0:	00a00793          	li	a5,10
    800068e4:	fcf43823          	sd	a5,-48(s0)
    800068e8:	01400793          	li	a5,20
    800068ec:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800068f0:	00000493          	li	s1,0
    800068f4:	02c0006f          	j	80006920 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800068f8:	00349793          	slli	a5,s1,0x3
    800068fc:	fd040613          	addi	a2,s0,-48
    80006900:	00f60633          	add	a2,a2,a5
    80006904:	00000597          	auipc	a1,0x0
    80006908:	f2458593          	addi	a1,a1,-220 # 80006828 <_ZL9sleepyRunPv>
    8000690c:	fc040513          	addi	a0,s0,-64
    80006910:	00f50533          	add	a0,a0,a5
    80006914:	ffffb097          	auipc	ra,0xffffb
    80006918:	af0080e7          	jalr	-1296(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    8000691c:	0014849b          	addiw	s1,s1,1
    80006920:	00100793          	li	a5,1
    80006924:	fc97dae3          	bge	a5,s1,800068f8 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006928:	00007797          	auipc	a5,0x7
    8000692c:	8007c783          	lbu	a5,-2048(a5) # 8000d128 <_ZL8finished>
    80006930:	fe078ce3          	beqz	a5,80006928 <_Z12testSleepingv+0x5c>
    80006934:	00006797          	auipc	a5,0x6
    80006938:	7f57c783          	lbu	a5,2037(a5) # 8000d129 <_ZL8finished+0x1>
    8000693c:	fe0786e3          	beqz	a5,80006928 <_Z12testSleepingv+0x5c>
}
    80006940:	03813083          	ld	ra,56(sp)
    80006944:	03013403          	ld	s0,48(sp)
    80006948:	02813483          	ld	s1,40(sp)
    8000694c:	04010113          	addi	sp,sp,64
    80006950:	00008067          	ret

0000000080006954 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006954:	fe010113          	addi	sp,sp,-32
    80006958:	00113c23          	sd	ra,24(sp)
    8000695c:	00813823          	sd	s0,16(sp)
    80006960:	00913423          	sd	s1,8(sp)
    80006964:	01213023          	sd	s2,0(sp)
    80006968:	02010413          	addi	s0,sp,32
    8000696c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006970:	00100793          	li	a5,1
    80006974:	02a7f863          	bgeu	a5,a0,800069a4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006978:	00a00793          	li	a5,10
    8000697c:	02f577b3          	remu	a5,a0,a5
    80006980:	02078e63          	beqz	a5,800069bc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006984:	fff48513          	addi	a0,s1,-1
    80006988:	00000097          	auipc	ra,0x0
    8000698c:	fcc080e7          	jalr	-52(ra) # 80006954 <_ZL9fibonaccim>
    80006990:	00050913          	mv	s2,a0
    80006994:	ffe48513          	addi	a0,s1,-2
    80006998:	00000097          	auipc	ra,0x0
    8000699c:	fbc080e7          	jalr	-68(ra) # 80006954 <_ZL9fibonaccim>
    800069a0:	00a90533          	add	a0,s2,a0
}
    800069a4:	01813083          	ld	ra,24(sp)
    800069a8:	01013403          	ld	s0,16(sp)
    800069ac:	00813483          	ld	s1,8(sp)
    800069b0:	00013903          	ld	s2,0(sp)
    800069b4:	02010113          	addi	sp,sp,32
    800069b8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800069bc:	ffffb097          	auipc	ra,0xffffb
    800069c0:	b04080e7          	jalr	-1276(ra) # 800014c0 <_Z15thread_dispatchv>
    800069c4:	fc1ff06f          	j	80006984 <_ZL9fibonaccim+0x30>

00000000800069c8 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800069c8:	fe010113          	addi	sp,sp,-32
    800069cc:	00113c23          	sd	ra,24(sp)
    800069d0:	00813823          	sd	s0,16(sp)
    800069d4:	00913423          	sd	s1,8(sp)
    800069d8:	01213023          	sd	s2,0(sp)
    800069dc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800069e0:	00a00493          	li	s1,10
    800069e4:	0400006f          	j	80006a24 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800069e8:	00004517          	auipc	a0,0x4
    800069ec:	a5050513          	addi	a0,a0,-1456 # 8000a438 <CONSOLE_STATUS+0x428>
    800069f0:	fffff097          	auipc	ra,0xfffff
    800069f4:	61c080e7          	jalr	1564(ra) # 8000600c <_Z11printStringPKc>
    800069f8:	00000613          	li	a2,0
    800069fc:	00a00593          	li	a1,10
    80006a00:	00048513          	mv	a0,s1
    80006a04:	fffff097          	auipc	ra,0xfffff
    80006a08:	7b8080e7          	jalr	1976(ra) # 800061bc <_Z8printIntiii>
    80006a0c:	00004517          	auipc	a0,0x4
    80006a10:	c1c50513          	addi	a0,a0,-996 # 8000a628 <CONSOLE_STATUS+0x618>
    80006a14:	fffff097          	auipc	ra,0xfffff
    80006a18:	5f8080e7          	jalr	1528(ra) # 8000600c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006a1c:	0014849b          	addiw	s1,s1,1
    80006a20:	0ff4f493          	andi	s1,s1,255
    80006a24:	00c00793          	li	a5,12
    80006a28:	fc97f0e3          	bgeu	a5,s1,800069e8 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006a2c:	00004517          	auipc	a0,0x4
    80006a30:	a1450513          	addi	a0,a0,-1516 # 8000a440 <CONSOLE_STATUS+0x430>
    80006a34:	fffff097          	auipc	ra,0xfffff
    80006a38:	5d8080e7          	jalr	1496(ra) # 8000600c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006a3c:	00500313          	li	t1,5
    thread_dispatch();
    80006a40:	ffffb097          	auipc	ra,0xffffb
    80006a44:	a80080e7          	jalr	-1408(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006a48:	01000513          	li	a0,16
    80006a4c:	00000097          	auipc	ra,0x0
    80006a50:	f08080e7          	jalr	-248(ra) # 80006954 <_ZL9fibonaccim>
    80006a54:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006a58:	00004517          	auipc	a0,0x4
    80006a5c:	9f850513          	addi	a0,a0,-1544 # 8000a450 <CONSOLE_STATUS+0x440>
    80006a60:	fffff097          	auipc	ra,0xfffff
    80006a64:	5ac080e7          	jalr	1452(ra) # 8000600c <_Z11printStringPKc>
    80006a68:	00000613          	li	a2,0
    80006a6c:	00a00593          	li	a1,10
    80006a70:	0009051b          	sext.w	a0,s2
    80006a74:	fffff097          	auipc	ra,0xfffff
    80006a78:	748080e7          	jalr	1864(ra) # 800061bc <_Z8printIntiii>
    80006a7c:	00004517          	auipc	a0,0x4
    80006a80:	bac50513          	addi	a0,a0,-1108 # 8000a628 <CONSOLE_STATUS+0x618>
    80006a84:	fffff097          	auipc	ra,0xfffff
    80006a88:	588080e7          	jalr	1416(ra) # 8000600c <_Z11printStringPKc>
    80006a8c:	0400006f          	j	80006acc <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006a90:	00004517          	auipc	a0,0x4
    80006a94:	9a850513          	addi	a0,a0,-1624 # 8000a438 <CONSOLE_STATUS+0x428>
    80006a98:	fffff097          	auipc	ra,0xfffff
    80006a9c:	574080e7          	jalr	1396(ra) # 8000600c <_Z11printStringPKc>
    80006aa0:	00000613          	li	a2,0
    80006aa4:	00a00593          	li	a1,10
    80006aa8:	00048513          	mv	a0,s1
    80006aac:	fffff097          	auipc	ra,0xfffff
    80006ab0:	710080e7          	jalr	1808(ra) # 800061bc <_Z8printIntiii>
    80006ab4:	00004517          	auipc	a0,0x4
    80006ab8:	b7450513          	addi	a0,a0,-1164 # 8000a628 <CONSOLE_STATUS+0x618>
    80006abc:	fffff097          	auipc	ra,0xfffff
    80006ac0:	550080e7          	jalr	1360(ra) # 8000600c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006ac4:	0014849b          	addiw	s1,s1,1
    80006ac8:	0ff4f493          	andi	s1,s1,255
    80006acc:	00f00793          	li	a5,15
    80006ad0:	fc97f0e3          	bgeu	a5,s1,80006a90 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006ad4:	00004517          	auipc	a0,0x4
    80006ad8:	98c50513          	addi	a0,a0,-1652 # 8000a460 <CONSOLE_STATUS+0x450>
    80006adc:	fffff097          	auipc	ra,0xfffff
    80006ae0:	530080e7          	jalr	1328(ra) # 8000600c <_Z11printStringPKc>
    finishedD = true;
    80006ae4:	00100793          	li	a5,1
    80006ae8:	00006717          	auipc	a4,0x6
    80006aec:	64f70123          	sb	a5,1602(a4) # 8000d12a <_ZL9finishedD>
    thread_dispatch();
    80006af0:	ffffb097          	auipc	ra,0xffffb
    80006af4:	9d0080e7          	jalr	-1584(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80006af8:	01813083          	ld	ra,24(sp)
    80006afc:	01013403          	ld	s0,16(sp)
    80006b00:	00813483          	ld	s1,8(sp)
    80006b04:	00013903          	ld	s2,0(sp)
    80006b08:	02010113          	addi	sp,sp,32
    80006b0c:	00008067          	ret

0000000080006b10 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006b10:	fe010113          	addi	sp,sp,-32
    80006b14:	00113c23          	sd	ra,24(sp)
    80006b18:	00813823          	sd	s0,16(sp)
    80006b1c:	00913423          	sd	s1,8(sp)
    80006b20:	01213023          	sd	s2,0(sp)
    80006b24:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006b28:	00000493          	li	s1,0
    80006b2c:	0400006f          	j	80006b6c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006b30:	00004517          	auipc	a0,0x4
    80006b34:	8c850513          	addi	a0,a0,-1848 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    80006b38:	fffff097          	auipc	ra,0xfffff
    80006b3c:	4d4080e7          	jalr	1236(ra) # 8000600c <_Z11printStringPKc>
    80006b40:	00000613          	li	a2,0
    80006b44:	00a00593          	li	a1,10
    80006b48:	00048513          	mv	a0,s1
    80006b4c:	fffff097          	auipc	ra,0xfffff
    80006b50:	670080e7          	jalr	1648(ra) # 800061bc <_Z8printIntiii>
    80006b54:	00004517          	auipc	a0,0x4
    80006b58:	ad450513          	addi	a0,a0,-1324 # 8000a628 <CONSOLE_STATUS+0x618>
    80006b5c:	fffff097          	auipc	ra,0xfffff
    80006b60:	4b0080e7          	jalr	1200(ra) # 8000600c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006b64:	0014849b          	addiw	s1,s1,1
    80006b68:	0ff4f493          	andi	s1,s1,255
    80006b6c:	00200793          	li	a5,2
    80006b70:	fc97f0e3          	bgeu	a5,s1,80006b30 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006b74:	00004517          	auipc	a0,0x4
    80006b78:	88c50513          	addi	a0,a0,-1908 # 8000a400 <CONSOLE_STATUS+0x3f0>
    80006b7c:	fffff097          	auipc	ra,0xfffff
    80006b80:	490080e7          	jalr	1168(ra) # 8000600c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006b84:	00700313          	li	t1,7
    thread_dispatch();
    80006b88:	ffffb097          	auipc	ra,0xffffb
    80006b8c:	938080e7          	jalr	-1736(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006b90:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006b94:	00004517          	auipc	a0,0x4
    80006b98:	87c50513          	addi	a0,a0,-1924 # 8000a410 <CONSOLE_STATUS+0x400>
    80006b9c:	fffff097          	auipc	ra,0xfffff
    80006ba0:	470080e7          	jalr	1136(ra) # 8000600c <_Z11printStringPKc>
    80006ba4:	00000613          	li	a2,0
    80006ba8:	00a00593          	li	a1,10
    80006bac:	0009051b          	sext.w	a0,s2
    80006bb0:	fffff097          	auipc	ra,0xfffff
    80006bb4:	60c080e7          	jalr	1548(ra) # 800061bc <_Z8printIntiii>
    80006bb8:	00004517          	auipc	a0,0x4
    80006bbc:	a7050513          	addi	a0,a0,-1424 # 8000a628 <CONSOLE_STATUS+0x618>
    80006bc0:	fffff097          	auipc	ra,0xfffff
    80006bc4:	44c080e7          	jalr	1100(ra) # 8000600c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006bc8:	00c00513          	li	a0,12
    80006bcc:	00000097          	auipc	ra,0x0
    80006bd0:	d88080e7          	jalr	-632(ra) # 80006954 <_ZL9fibonaccim>
    80006bd4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006bd8:	00004517          	auipc	a0,0x4
    80006bdc:	84050513          	addi	a0,a0,-1984 # 8000a418 <CONSOLE_STATUS+0x408>
    80006be0:	fffff097          	auipc	ra,0xfffff
    80006be4:	42c080e7          	jalr	1068(ra) # 8000600c <_Z11printStringPKc>
    80006be8:	00000613          	li	a2,0
    80006bec:	00a00593          	li	a1,10
    80006bf0:	0009051b          	sext.w	a0,s2
    80006bf4:	fffff097          	auipc	ra,0xfffff
    80006bf8:	5c8080e7          	jalr	1480(ra) # 800061bc <_Z8printIntiii>
    80006bfc:	00004517          	auipc	a0,0x4
    80006c00:	a2c50513          	addi	a0,a0,-1492 # 8000a628 <CONSOLE_STATUS+0x618>
    80006c04:	fffff097          	auipc	ra,0xfffff
    80006c08:	408080e7          	jalr	1032(ra) # 8000600c <_Z11printStringPKc>
    80006c0c:	0400006f          	j	80006c4c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006c10:	00003517          	auipc	a0,0x3
    80006c14:	7e850513          	addi	a0,a0,2024 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    80006c18:	fffff097          	auipc	ra,0xfffff
    80006c1c:	3f4080e7          	jalr	1012(ra) # 8000600c <_Z11printStringPKc>
    80006c20:	00000613          	li	a2,0
    80006c24:	00a00593          	li	a1,10
    80006c28:	00048513          	mv	a0,s1
    80006c2c:	fffff097          	auipc	ra,0xfffff
    80006c30:	590080e7          	jalr	1424(ra) # 800061bc <_Z8printIntiii>
    80006c34:	00004517          	auipc	a0,0x4
    80006c38:	9f450513          	addi	a0,a0,-1548 # 8000a628 <CONSOLE_STATUS+0x618>
    80006c3c:	fffff097          	auipc	ra,0xfffff
    80006c40:	3d0080e7          	jalr	976(ra) # 8000600c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006c44:	0014849b          	addiw	s1,s1,1
    80006c48:	0ff4f493          	andi	s1,s1,255
    80006c4c:	00500793          	li	a5,5
    80006c50:	fc97f0e3          	bgeu	a5,s1,80006c10 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006c54:	00003517          	auipc	a0,0x3
    80006c58:	77c50513          	addi	a0,a0,1916 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80006c5c:	fffff097          	auipc	ra,0xfffff
    80006c60:	3b0080e7          	jalr	944(ra) # 8000600c <_Z11printStringPKc>
    finishedC = true;
    80006c64:	00100793          	li	a5,1
    80006c68:	00006717          	auipc	a4,0x6
    80006c6c:	4cf701a3          	sb	a5,1219(a4) # 8000d12b <_ZL9finishedC>
    thread_dispatch();
    80006c70:	ffffb097          	auipc	ra,0xffffb
    80006c74:	850080e7          	jalr	-1968(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80006c78:	01813083          	ld	ra,24(sp)
    80006c7c:	01013403          	ld	s0,16(sp)
    80006c80:	00813483          	ld	s1,8(sp)
    80006c84:	00013903          	ld	s2,0(sp)
    80006c88:	02010113          	addi	sp,sp,32
    80006c8c:	00008067          	ret

0000000080006c90 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006c90:	fe010113          	addi	sp,sp,-32
    80006c94:	00113c23          	sd	ra,24(sp)
    80006c98:	00813823          	sd	s0,16(sp)
    80006c9c:	00913423          	sd	s1,8(sp)
    80006ca0:	01213023          	sd	s2,0(sp)
    80006ca4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006ca8:	00000913          	li	s2,0
    80006cac:	0400006f          	j	80006cec <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006cb0:	ffffb097          	auipc	ra,0xffffb
    80006cb4:	810080e7          	jalr	-2032(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006cb8:	00148493          	addi	s1,s1,1
    80006cbc:	000027b7          	lui	a5,0x2
    80006cc0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006cc4:	0097ee63          	bltu	a5,s1,80006ce0 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006cc8:	00000713          	li	a4,0
    80006ccc:	000077b7          	lui	a5,0x7
    80006cd0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006cd4:	fce7eee3          	bltu	a5,a4,80006cb0 <_ZL11workerBodyBPv+0x20>
    80006cd8:	00170713          	addi	a4,a4,1
    80006cdc:	ff1ff06f          	j	80006ccc <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006ce0:	00a00793          	li	a5,10
    80006ce4:	04f90663          	beq	s2,a5,80006d30 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006ce8:	00190913          	addi	s2,s2,1
    80006cec:	00f00793          	li	a5,15
    80006cf0:	0527e463          	bltu	a5,s2,80006d38 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006cf4:	00003517          	auipc	a0,0x3
    80006cf8:	6ec50513          	addi	a0,a0,1772 # 8000a3e0 <CONSOLE_STATUS+0x3d0>
    80006cfc:	fffff097          	auipc	ra,0xfffff
    80006d00:	310080e7          	jalr	784(ra) # 8000600c <_Z11printStringPKc>
    80006d04:	00000613          	li	a2,0
    80006d08:	00a00593          	li	a1,10
    80006d0c:	0009051b          	sext.w	a0,s2
    80006d10:	fffff097          	auipc	ra,0xfffff
    80006d14:	4ac080e7          	jalr	1196(ra) # 800061bc <_Z8printIntiii>
    80006d18:	00004517          	auipc	a0,0x4
    80006d1c:	91050513          	addi	a0,a0,-1776 # 8000a628 <CONSOLE_STATUS+0x618>
    80006d20:	fffff097          	auipc	ra,0xfffff
    80006d24:	2ec080e7          	jalr	748(ra) # 8000600c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006d28:	00000493          	li	s1,0
    80006d2c:	f91ff06f          	j	80006cbc <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006d30:	14102ff3          	csrr	t6,sepc
    80006d34:	fb5ff06f          	j	80006ce8 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006d38:	00003517          	auipc	a0,0x3
    80006d3c:	6b050513          	addi	a0,a0,1712 # 8000a3e8 <CONSOLE_STATUS+0x3d8>
    80006d40:	fffff097          	auipc	ra,0xfffff
    80006d44:	2cc080e7          	jalr	716(ra) # 8000600c <_Z11printStringPKc>
    finishedB = true;
    80006d48:	00100793          	li	a5,1
    80006d4c:	00006717          	auipc	a4,0x6
    80006d50:	3ef70023          	sb	a5,992(a4) # 8000d12c <_ZL9finishedB>
    thread_dispatch();
    80006d54:	ffffa097          	auipc	ra,0xffffa
    80006d58:	76c080e7          	jalr	1900(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80006d5c:	01813083          	ld	ra,24(sp)
    80006d60:	01013403          	ld	s0,16(sp)
    80006d64:	00813483          	ld	s1,8(sp)
    80006d68:	00013903          	ld	s2,0(sp)
    80006d6c:	02010113          	addi	sp,sp,32
    80006d70:	00008067          	ret

0000000080006d74 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006d74:	fe010113          	addi	sp,sp,-32
    80006d78:	00113c23          	sd	ra,24(sp)
    80006d7c:	00813823          	sd	s0,16(sp)
    80006d80:	00913423          	sd	s1,8(sp)
    80006d84:	01213023          	sd	s2,0(sp)
    80006d88:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006d8c:	00000913          	li	s2,0
    80006d90:	0380006f          	j	80006dc8 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006d94:	ffffa097          	auipc	ra,0xffffa
    80006d98:	72c080e7          	jalr	1836(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006d9c:	00148493          	addi	s1,s1,1
    80006da0:	000027b7          	lui	a5,0x2
    80006da4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006da8:	0097ee63          	bltu	a5,s1,80006dc4 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006dac:	00000713          	li	a4,0
    80006db0:	000077b7          	lui	a5,0x7
    80006db4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006db8:	fce7eee3          	bltu	a5,a4,80006d94 <_ZL11workerBodyAPv+0x20>
    80006dbc:	00170713          	addi	a4,a4,1
    80006dc0:	ff1ff06f          	j	80006db0 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006dc4:	00190913          	addi	s2,s2,1
    80006dc8:	00900793          	li	a5,9
    80006dcc:	0527e063          	bltu	a5,s2,80006e0c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006dd0:	00003517          	auipc	a0,0x3
    80006dd4:	5f850513          	addi	a0,a0,1528 # 8000a3c8 <CONSOLE_STATUS+0x3b8>
    80006dd8:	fffff097          	auipc	ra,0xfffff
    80006ddc:	234080e7          	jalr	564(ra) # 8000600c <_Z11printStringPKc>
    80006de0:	00000613          	li	a2,0
    80006de4:	00a00593          	li	a1,10
    80006de8:	0009051b          	sext.w	a0,s2
    80006dec:	fffff097          	auipc	ra,0xfffff
    80006df0:	3d0080e7          	jalr	976(ra) # 800061bc <_Z8printIntiii>
    80006df4:	00004517          	auipc	a0,0x4
    80006df8:	83450513          	addi	a0,a0,-1996 # 8000a628 <CONSOLE_STATUS+0x618>
    80006dfc:	fffff097          	auipc	ra,0xfffff
    80006e00:	210080e7          	jalr	528(ra) # 8000600c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006e04:	00000493          	li	s1,0
    80006e08:	f99ff06f          	j	80006da0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006e0c:	00003517          	auipc	a0,0x3
    80006e10:	5c450513          	addi	a0,a0,1476 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80006e14:	fffff097          	auipc	ra,0xfffff
    80006e18:	1f8080e7          	jalr	504(ra) # 8000600c <_Z11printStringPKc>
    finishedA = true;
    80006e1c:	00100793          	li	a5,1
    80006e20:	00006717          	auipc	a4,0x6
    80006e24:	30f706a3          	sb	a5,781(a4) # 8000d12d <_ZL9finishedA>
}
    80006e28:	01813083          	ld	ra,24(sp)
    80006e2c:	01013403          	ld	s0,16(sp)
    80006e30:	00813483          	ld	s1,8(sp)
    80006e34:	00013903          	ld	s2,0(sp)
    80006e38:	02010113          	addi	sp,sp,32
    80006e3c:	00008067          	ret

0000000080006e40 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006e40:	fd010113          	addi	sp,sp,-48
    80006e44:	02113423          	sd	ra,40(sp)
    80006e48:	02813023          	sd	s0,32(sp)
    80006e4c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006e50:	00000613          	li	a2,0
    80006e54:	00000597          	auipc	a1,0x0
    80006e58:	f2058593          	addi	a1,a1,-224 # 80006d74 <_ZL11workerBodyAPv>
    80006e5c:	fd040513          	addi	a0,s0,-48
    80006e60:	ffffa097          	auipc	ra,0xffffa
    80006e64:	5a4080e7          	jalr	1444(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006e68:	00003517          	auipc	a0,0x3
    80006e6c:	60850513          	addi	a0,a0,1544 # 8000a470 <CONSOLE_STATUS+0x460>
    80006e70:	fffff097          	auipc	ra,0xfffff
    80006e74:	19c080e7          	jalr	412(ra) # 8000600c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006e78:	00000613          	li	a2,0
    80006e7c:	00000597          	auipc	a1,0x0
    80006e80:	e1458593          	addi	a1,a1,-492 # 80006c90 <_ZL11workerBodyBPv>
    80006e84:	fd840513          	addi	a0,s0,-40
    80006e88:	ffffa097          	auipc	ra,0xffffa
    80006e8c:	57c080e7          	jalr	1404(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006e90:	00003517          	auipc	a0,0x3
    80006e94:	5f850513          	addi	a0,a0,1528 # 8000a488 <CONSOLE_STATUS+0x478>
    80006e98:	fffff097          	auipc	ra,0xfffff
    80006e9c:	174080e7          	jalr	372(ra) # 8000600c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006ea0:	00000613          	li	a2,0
    80006ea4:	00000597          	auipc	a1,0x0
    80006ea8:	c6c58593          	addi	a1,a1,-916 # 80006b10 <_ZL11workerBodyCPv>
    80006eac:	fe040513          	addi	a0,s0,-32
    80006eb0:	ffffa097          	auipc	ra,0xffffa
    80006eb4:	554080e7          	jalr	1364(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006eb8:	00003517          	auipc	a0,0x3
    80006ebc:	5e850513          	addi	a0,a0,1512 # 8000a4a0 <CONSOLE_STATUS+0x490>
    80006ec0:	fffff097          	auipc	ra,0xfffff
    80006ec4:	14c080e7          	jalr	332(ra) # 8000600c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006ec8:	00000613          	li	a2,0
    80006ecc:	00000597          	auipc	a1,0x0
    80006ed0:	afc58593          	addi	a1,a1,-1284 # 800069c8 <_ZL11workerBodyDPv>
    80006ed4:	fe840513          	addi	a0,s0,-24
    80006ed8:	ffffa097          	auipc	ra,0xffffa
    80006edc:	52c080e7          	jalr	1324(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006ee0:	00003517          	auipc	a0,0x3
    80006ee4:	5d850513          	addi	a0,a0,1496 # 8000a4b8 <CONSOLE_STATUS+0x4a8>
    80006ee8:	fffff097          	auipc	ra,0xfffff
    80006eec:	124080e7          	jalr	292(ra) # 8000600c <_Z11printStringPKc>
    80006ef0:	00c0006f          	j	80006efc <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006ef4:	ffffa097          	auipc	ra,0xffffa
    80006ef8:	5cc080e7          	jalr	1484(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006efc:	00006797          	auipc	a5,0x6
    80006f00:	2317c783          	lbu	a5,561(a5) # 8000d12d <_ZL9finishedA>
    80006f04:	fe0788e3          	beqz	a5,80006ef4 <_Z16System_Mode_testv+0xb4>
    80006f08:	00006797          	auipc	a5,0x6
    80006f0c:	2247c783          	lbu	a5,548(a5) # 8000d12c <_ZL9finishedB>
    80006f10:	fe0782e3          	beqz	a5,80006ef4 <_Z16System_Mode_testv+0xb4>
    80006f14:	00006797          	auipc	a5,0x6
    80006f18:	2177c783          	lbu	a5,535(a5) # 8000d12b <_ZL9finishedC>
    80006f1c:	fc078ce3          	beqz	a5,80006ef4 <_Z16System_Mode_testv+0xb4>
    80006f20:	00006797          	auipc	a5,0x6
    80006f24:	20a7c783          	lbu	a5,522(a5) # 8000d12a <_ZL9finishedD>
    80006f28:	fc0786e3          	beqz	a5,80006ef4 <_Z16System_Mode_testv+0xb4>
    }

}
    80006f2c:	02813083          	ld	ra,40(sp)
    80006f30:	02013403          	ld	s0,32(sp)
    80006f34:	03010113          	addi	sp,sp,48
    80006f38:	00008067          	ret

0000000080006f3c <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006f3c:	fe010113          	addi	sp,sp,-32
    80006f40:	00113c23          	sd	ra,24(sp)
    80006f44:	00813823          	sd	s0,16(sp)
    80006f48:	00913423          	sd	s1,8(sp)
    80006f4c:	01213023          	sd	s2,0(sp)
    80006f50:	02010413          	addi	s0,sp,32
    80006f54:	00050493          	mv	s1,a0
    80006f58:	00058913          	mv	s2,a1
    80006f5c:	0015879b          	addiw	a5,a1,1
    80006f60:	0007851b          	sext.w	a0,a5
    80006f64:	00f4a023          	sw	a5,0(s1)
    80006f68:	0004a823          	sw	zero,16(s1)
    80006f6c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006f70:	00251513          	slli	a0,a0,0x2
    80006f74:	ffffa097          	auipc	ra,0xffffa
    80006f78:	420080e7          	jalr	1056(ra) # 80001394 <_Z9mem_allocm>
    80006f7c:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006f80:	00000593          	li	a1,0
    80006f84:	02048513          	addi	a0,s1,32
    80006f88:	ffffa097          	auipc	ra,0xffffa
    80006f8c:	5b0080e7          	jalr	1456(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006f90:	00090593          	mv	a1,s2
    80006f94:	01848513          	addi	a0,s1,24
    80006f98:	ffffa097          	auipc	ra,0xffffa
    80006f9c:	5a0080e7          	jalr	1440(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006fa0:	00100593          	li	a1,1
    80006fa4:	02848513          	addi	a0,s1,40
    80006fa8:	ffffa097          	auipc	ra,0xffffa
    80006fac:	590080e7          	jalr	1424(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006fb0:	00100593          	li	a1,1
    80006fb4:	03048513          	addi	a0,s1,48
    80006fb8:	ffffa097          	auipc	ra,0xffffa
    80006fbc:	580080e7          	jalr	1408(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    80006fc0:	01813083          	ld	ra,24(sp)
    80006fc4:	01013403          	ld	s0,16(sp)
    80006fc8:	00813483          	ld	s1,8(sp)
    80006fcc:	00013903          	ld	s2,0(sp)
    80006fd0:	02010113          	addi	sp,sp,32
    80006fd4:	00008067          	ret

0000000080006fd8 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006fd8:	fe010113          	addi	sp,sp,-32
    80006fdc:	00113c23          	sd	ra,24(sp)
    80006fe0:	00813823          	sd	s0,16(sp)
    80006fe4:	00913423          	sd	s1,8(sp)
    80006fe8:	01213023          	sd	s2,0(sp)
    80006fec:	02010413          	addi	s0,sp,32
    80006ff0:	00050493          	mv	s1,a0
    80006ff4:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006ff8:	01853503          	ld	a0,24(a0)
    80006ffc:	ffffa097          	auipc	ra,0xffffa
    80007000:	5a4080e7          	jalr	1444(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80007004:	0304b503          	ld	a0,48(s1)
    80007008:	ffffa097          	auipc	ra,0xffffa
    8000700c:	598080e7          	jalr	1432(ra) # 800015a0 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80007010:	0084b783          	ld	a5,8(s1)
    80007014:	0144a703          	lw	a4,20(s1)
    80007018:	00271713          	slli	a4,a4,0x2
    8000701c:	00e787b3          	add	a5,a5,a4
    80007020:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80007024:	0144a783          	lw	a5,20(s1)
    80007028:	0017879b          	addiw	a5,a5,1
    8000702c:	0004a703          	lw	a4,0(s1)
    80007030:	02e7e7bb          	remw	a5,a5,a4
    80007034:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80007038:	0304b503          	ld	a0,48(s1)
    8000703c:	ffffa097          	auipc	ra,0xffffa
    80007040:	594080e7          	jalr	1428(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80007044:	0204b503          	ld	a0,32(s1)
    80007048:	ffffa097          	auipc	ra,0xffffa
    8000704c:	588080e7          	jalr	1416(ra) # 800015d0 <_Z10sem_signalP4KSem>

}
    80007050:	01813083          	ld	ra,24(sp)
    80007054:	01013403          	ld	s0,16(sp)
    80007058:	00813483          	ld	s1,8(sp)
    8000705c:	00013903          	ld	s2,0(sp)
    80007060:	02010113          	addi	sp,sp,32
    80007064:	00008067          	ret

0000000080007068 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80007068:	fe010113          	addi	sp,sp,-32
    8000706c:	00113c23          	sd	ra,24(sp)
    80007070:	00813823          	sd	s0,16(sp)
    80007074:	00913423          	sd	s1,8(sp)
    80007078:	01213023          	sd	s2,0(sp)
    8000707c:	02010413          	addi	s0,sp,32
    80007080:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80007084:	02053503          	ld	a0,32(a0)
    80007088:	ffffa097          	auipc	ra,0xffffa
    8000708c:	518080e7          	jalr	1304(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80007090:	0284b503          	ld	a0,40(s1)
    80007094:	ffffa097          	auipc	ra,0xffffa
    80007098:	50c080e7          	jalr	1292(ra) # 800015a0 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    8000709c:	0084b703          	ld	a4,8(s1)
    800070a0:	0104a783          	lw	a5,16(s1)
    800070a4:	00279693          	slli	a3,a5,0x2
    800070a8:	00d70733          	add	a4,a4,a3
    800070ac:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800070b0:	0017879b          	addiw	a5,a5,1
    800070b4:	0004a703          	lw	a4,0(s1)
    800070b8:	02e7e7bb          	remw	a5,a5,a4
    800070bc:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800070c0:	0284b503          	ld	a0,40(s1)
    800070c4:	ffffa097          	auipc	ra,0xffffa
    800070c8:	50c080e7          	jalr	1292(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    800070cc:	0184b503          	ld	a0,24(s1)
    800070d0:	ffffa097          	auipc	ra,0xffffa
    800070d4:	500080e7          	jalr	1280(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    800070d8:	00090513          	mv	a0,s2
    800070dc:	01813083          	ld	ra,24(sp)
    800070e0:	01013403          	ld	s0,16(sp)
    800070e4:	00813483          	ld	s1,8(sp)
    800070e8:	00013903          	ld	s2,0(sp)
    800070ec:	02010113          	addi	sp,sp,32
    800070f0:	00008067          	ret

00000000800070f4 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800070f4:	fe010113          	addi	sp,sp,-32
    800070f8:	00113c23          	sd	ra,24(sp)
    800070fc:	00813823          	sd	s0,16(sp)
    80007100:	00913423          	sd	s1,8(sp)
    80007104:	01213023          	sd	s2,0(sp)
    80007108:	02010413          	addi	s0,sp,32
    8000710c:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80007110:	02853503          	ld	a0,40(a0)
    80007114:	ffffa097          	auipc	ra,0xffffa
    80007118:	48c080e7          	jalr	1164(ra) # 800015a0 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    8000711c:	0304b503          	ld	a0,48(s1)
    80007120:	ffffa097          	auipc	ra,0xffffa
    80007124:	480080e7          	jalr	1152(ra) # 800015a0 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80007128:	0144a783          	lw	a5,20(s1)
    8000712c:	0104a903          	lw	s2,16(s1)
    80007130:	0327ce63          	blt	a5,s2,8000716c <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80007134:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80007138:	0304b503          	ld	a0,48(s1)
    8000713c:	ffffa097          	auipc	ra,0xffffa
    80007140:	494080e7          	jalr	1172(ra) # 800015d0 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80007144:	0284b503          	ld	a0,40(s1)
    80007148:	ffffa097          	auipc	ra,0xffffa
    8000714c:	488080e7          	jalr	1160(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    80007150:	00090513          	mv	a0,s2
    80007154:	01813083          	ld	ra,24(sp)
    80007158:	01013403          	ld	s0,16(sp)
    8000715c:	00813483          	ld	s1,8(sp)
    80007160:	00013903          	ld	s2,0(sp)
    80007164:	02010113          	addi	sp,sp,32
    80007168:	00008067          	ret
        ret = cap - head + tail;
    8000716c:	0004a703          	lw	a4,0(s1)
    80007170:	4127093b          	subw	s2,a4,s2
    80007174:	00f9093b          	addw	s2,s2,a5
    80007178:	fc1ff06f          	j	80007138 <_ZN6Buffer6getCntEv+0x44>

000000008000717c <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    8000717c:	fe010113          	addi	sp,sp,-32
    80007180:	00113c23          	sd	ra,24(sp)
    80007184:	00813823          	sd	s0,16(sp)
    80007188:	00913423          	sd	s1,8(sp)
    8000718c:	02010413          	addi	s0,sp,32
    80007190:	00050493          	mv	s1,a0
    putc('\n');
    80007194:	00a00513          	li	a0,10
    80007198:	ffffa097          	auipc	ra,0xffffa
    8000719c:	490080e7          	jalr	1168(ra) # 80001628 <_Z4putcc>
    printString("Buffer deleted!\n");
    800071a0:	00003517          	auipc	a0,0x3
    800071a4:	33050513          	addi	a0,a0,816 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    800071a8:	fffff097          	auipc	ra,0xfffff
    800071ac:	e64080e7          	jalr	-412(ra) # 8000600c <_Z11printStringPKc>
    while (getCnt() > 0) {
    800071b0:	00048513          	mv	a0,s1
    800071b4:	00000097          	auipc	ra,0x0
    800071b8:	f40080e7          	jalr	-192(ra) # 800070f4 <_ZN6Buffer6getCntEv>
    800071bc:	02a05c63          	blez	a0,800071f4 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800071c0:	0084b783          	ld	a5,8(s1)
    800071c4:	0104a703          	lw	a4,16(s1)
    800071c8:	00271713          	slli	a4,a4,0x2
    800071cc:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800071d0:	0007c503          	lbu	a0,0(a5)
    800071d4:	ffffa097          	auipc	ra,0xffffa
    800071d8:	454080e7          	jalr	1108(ra) # 80001628 <_Z4putcc>
        head = (head + 1) % cap;
    800071dc:	0104a783          	lw	a5,16(s1)
    800071e0:	0017879b          	addiw	a5,a5,1
    800071e4:	0004a703          	lw	a4,0(s1)
    800071e8:	02e7e7bb          	remw	a5,a5,a4
    800071ec:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800071f0:	fc1ff06f          	j	800071b0 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800071f4:	02100513          	li	a0,33
    800071f8:	ffffa097          	auipc	ra,0xffffa
    800071fc:	430080e7          	jalr	1072(ra) # 80001628 <_Z4putcc>
    putc('\n');
    80007200:	00a00513          	li	a0,10
    80007204:	ffffa097          	auipc	ra,0xffffa
    80007208:	424080e7          	jalr	1060(ra) # 80001628 <_Z4putcc>
    mem_free(buffer);
    8000720c:	0084b503          	ld	a0,8(s1)
    80007210:	ffffa097          	auipc	ra,0xffffa
    80007214:	1c4080e7          	jalr	452(ra) # 800013d4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80007218:	0204b503          	ld	a0,32(s1)
    8000721c:	ffffa097          	auipc	ra,0xffffa
    80007220:	354080e7          	jalr	852(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80007224:	0184b503          	ld	a0,24(s1)
    80007228:	ffffa097          	auipc	ra,0xffffa
    8000722c:	348080e7          	jalr	840(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80007230:	0304b503          	ld	a0,48(s1)
    80007234:	ffffa097          	auipc	ra,0xffffa
    80007238:	33c080e7          	jalr	828(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    8000723c:	0284b503          	ld	a0,40(s1)
    80007240:	ffffa097          	auipc	ra,0xffffa
    80007244:	330080e7          	jalr	816(ra) # 80001570 <_Z9sem_closeP4KSem>
}
    80007248:	01813083          	ld	ra,24(sp)
    8000724c:	01013403          	ld	s0,16(sp)
    80007250:	00813483          	ld	s1,8(sp)
    80007254:	02010113          	addi	sp,sp,32
    80007258:	00008067          	ret

000000008000725c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    8000725c:	fa010113          	addi	sp,sp,-96
    80007260:	04813c23          	sd	s0,88(sp)
    80007264:	06010413          	addi	s0,sp,96
    80007268:	faa43423          	sd	a0,-88(s0)
    8000726c:	00058793          	mv	a5,a1
    80007270:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80007274:	fa843783          	ld	a5,-88(s0)
    80007278:	00079663          	bnez	a5,80007284 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    8000727c:	00000793          	li	a5,0
    80007280:	2040006f          	j	80007484 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80007284:	fa843783          	ld	a5,-88(s0)
    80007288:	0067d713          	srli	a4,a5,0x6
    8000728c:	fa843783          	ld	a5,-88(s0)
    80007290:	03f7f793          	andi	a5,a5,63
    80007294:	00078663          	beqz	a5,800072a0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80007298:	00100793          	li	a5,1
    8000729c:	0080006f          	j	800072a4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    800072a0:	00000793          	li	a5,0
    800072a4:	00e787b3          	add	a5,a5,a4
    800072a8:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    800072ac:	fc843783          	ld	a5,-56(s0)
    800072b0:	00679793          	slli	a5,a5,0x6
    800072b4:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    800072b8:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    800072bc:	00006797          	auipc	a5,0x6
    800072c0:	e7c78793          	addi	a5,a5,-388 # 8000d138 <_ZN15MemoryAllocator11freeMemHeadE>
    800072c4:	0007b783          	ld	a5,0(a5)
    800072c8:	fef43023          	sd	a5,-32(s0)
    800072cc:	fe043783          	ld	a5,-32(s0)
    800072d0:	1a078863          	beqz	a5,80007480 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    800072d4:	fe043783          	ld	a5,-32(s0)
    800072d8:	0087b783          	ld	a5,8(a5)
    800072dc:	fa843703          	ld	a4,-88(s0)
    800072e0:	18e7e263          	bltu	a5,a4,80007464 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    800072e4:	fe043703          	ld	a4,-32(s0)
    800072e8:	fa843783          	ld	a5,-88(s0)
    800072ec:	00f707b3          	add	a5,a4,a5
    800072f0:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    800072f4:	fe043783          	ld	a5,-32(s0)
    800072f8:	0087b703          	ld	a4,8(a5)
    800072fc:	fa843783          	ld	a5,-88(s0)
    80007300:	40f707b3          	sub	a5,a4,a5
    80007304:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80007308:	fb843703          	ld	a4,-72(s0)
    8000730c:	02000793          	li	a5,32
    80007310:	04e7e463          	bltu	a5,a4,80007358 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    80007314:	fa843703          	ld	a4,-88(s0)
    80007318:	fb843783          	ld	a5,-72(s0)
    8000731c:	00f707b3          	add	a5,a4,a5
    80007320:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    80007324:	fe843783          	ld	a5,-24(s0)
    80007328:	00078c63          	beqz	a5,80007340 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    8000732c:	fe043783          	ld	a5,-32(s0)
    80007330:	0007b703          	ld	a4,0(a5)
    80007334:	fe843783          	ld	a5,-24(s0)
    80007338:	00e7b023          	sd	a4,0(a5)
    8000733c:	0600006f          	j	8000739c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    80007340:	fe043783          	ld	a5,-32(s0)
    80007344:	0007b703          	ld	a4,0(a5)
    80007348:	00006797          	auipc	a5,0x6
    8000734c:	df078793          	addi	a5,a5,-528 # 8000d138 <_ZN15MemoryAllocator11freeMemHeadE>
    80007350:	00e7b023          	sd	a4,0(a5)
    80007354:	0480006f          	j	8000739c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    80007358:	fc043783          	ld	a5,-64(s0)
    8000735c:	fb843703          	ld	a4,-72(s0)
    80007360:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    80007364:	fe043783          	ld	a5,-32(s0)
    80007368:	0007b703          	ld	a4,0(a5)
    8000736c:	fc043783          	ld	a5,-64(s0)
    80007370:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    80007374:	fe843783          	ld	a5,-24(s0)
    80007378:	00078a63          	beqz	a5,8000738c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    8000737c:	fe843783          	ld	a5,-24(s0)
    80007380:	fc043703          	ld	a4,-64(s0)
    80007384:	00e7b023          	sd	a4,0(a5)
    80007388:	0140006f          	j	8000739c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    8000738c:	00006797          	auipc	a5,0x6
    80007390:	dac78793          	addi	a5,a5,-596 # 8000d138 <_ZN15MemoryAllocator11freeMemHeadE>
    80007394:	fc043703          	ld	a4,-64(s0)
    80007398:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    8000739c:	fe043783          	ld	a5,-32(s0)
    800073a0:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    800073a4:	fb043783          	ld	a5,-80(s0)
    800073a8:	fa843703          	ld	a4,-88(s0)
    800073ac:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    800073b0:	fb043783          	ld	a5,-80(s0)
    800073b4:	fa442703          	lw	a4,-92(s0)
    800073b8:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    800073bc:	fb043783          	ld	a5,-80(s0)
    800073c0:	02078713          	addi	a4,a5,32
    800073c4:	fb043783          	ld	a5,-80(s0)
    800073c8:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    800073cc:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    800073d0:	00006797          	auipc	a5,0x6
    800073d4:	d6078793          	addi	a5,a5,-672 # 8000d130 <_ZN15MemoryAllocator11usedMemHeadE>
    800073d8:	0007b783          	ld	a5,0(a5)
    800073dc:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    800073e0:	fd043783          	ld	a5,-48(s0)
    800073e4:	02078463          	beqz	a5,8000740c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    800073e8:	fd043703          	ld	a4,-48(s0)
    800073ec:	fb043783          	ld	a5,-80(s0)
    800073f0:	00f77e63          	bgeu	a4,a5,8000740c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    800073f4:	fd043783          	ld	a5,-48(s0)
    800073f8:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    800073fc:	fd043783          	ld	a5,-48(s0)
    80007400:	0007b783          	ld	a5,0(a5)
    80007404:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80007408:	fd9ff06f          	j	800073e0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    8000740c:	fd843783          	ld	a5,-40(s0)
    80007410:	02079663          	bnez	a5,8000743c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    80007414:	00006797          	auipc	a5,0x6
    80007418:	d1c78793          	addi	a5,a5,-740 # 8000d130 <_ZN15MemoryAllocator11usedMemHeadE>
    8000741c:	0007b703          	ld	a4,0(a5)
    80007420:	fb043783          	ld	a5,-80(s0)
    80007424:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    80007428:	00006797          	auipc	a5,0x6
    8000742c:	d0878793          	addi	a5,a5,-760 # 8000d130 <_ZN15MemoryAllocator11usedMemHeadE>
    80007430:	fb043703          	ld	a4,-80(s0)
    80007434:	00e7b023          	sd	a4,0(a5)
    80007438:	0200006f          	j	80007458 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    8000743c:	fd843783          	ld	a5,-40(s0)
    80007440:	0007b703          	ld	a4,0(a5)
    80007444:	fb043783          	ld	a5,-80(s0)
    80007448:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    8000744c:	fd843783          	ld	a5,-40(s0)
    80007450:	fb043703          	ld	a4,-80(s0)
    80007454:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    80007458:	fb043783          	ld	a5,-80(s0)
    8000745c:	0187b783          	ld	a5,24(a5)
    80007460:	0240006f          	j	80007484 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    80007464:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80007468:	fe043783          	ld	a5,-32(s0)
    8000746c:	fef43423          	sd	a5,-24(s0)
    80007470:	fe043783          	ld	a5,-32(s0)
    80007474:	0007b783          	ld	a5,0(a5)
    80007478:	fef43023          	sd	a5,-32(s0)
    8000747c:	e51ff06f          	j	800072cc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    80007480:	00000793          	li	a5,0
}
    80007484:	00078513          	mv	a0,a5
    80007488:	05813403          	ld	s0,88(sp)
    8000748c:	06010113          	addi	sp,sp,96
    80007490:	00008067          	ret

0000000080007494 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80007494:	fb010113          	addi	sp,sp,-80
    80007498:	04113423          	sd	ra,72(sp)
    8000749c:	04813023          	sd	s0,64(sp)
    800074a0:	05010413          	addi	s0,sp,80
    800074a4:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    800074a8:	fb843783          	ld	a5,-72(s0)
    800074ac:	00079663          	bnez	a5,800074b8 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    800074b0:	00000793          	li	a5,0
    800074b4:	1740006f          	j	80007628 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    800074b8:	00006797          	auipc	a5,0x6
    800074bc:	c7878793          	addi	a5,a5,-904 # 8000d130 <_ZN15MemoryAllocator11usedMemHeadE>
    800074c0:	0007b783          	ld	a5,0(a5)
    800074c4:	00079663          	bnez	a5,800074d0 <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    800074c8:	fff00793          	li	a5,-1
    800074cc:	15c0006f          	j	80007628 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    800074d0:	fb843783          	ld	a5,-72(s0)
    800074d4:	fe078793          	addi	a5,a5,-32
    800074d8:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    800074dc:	00006797          	auipc	a5,0x6
    800074e0:	c5478793          	addi	a5,a5,-940 # 8000d130 <_ZN15MemoryAllocator11usedMemHeadE>
    800074e4:	0007b783          	ld	a5,0(a5)
    800074e8:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    800074ec:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    800074f0:	fe843783          	ld	a5,-24(s0)
    800074f4:	02078463          	beqz	a5,8000751c <_ZN15MemoryAllocator5kfreeEPv+0x88>
    800074f8:	fe843703          	ld	a4,-24(s0)
    800074fc:	fb843783          	ld	a5,-72(s0)
    80007500:	00f70e63          	beq	a4,a5,8000751c <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    80007504:	fe843783          	ld	a5,-24(s0)
    80007508:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    8000750c:	fe843783          	ld	a5,-24(s0)
    80007510:	0007b783          	ld	a5,0(a5)
    80007514:	fef43423          	sd	a5,-24(s0)
    80007518:	fd9ff06f          	j	800074f0 <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    8000751c:	fe843703          	ld	a4,-24(s0)
    80007520:	fb843783          	ld	a5,-72(s0)
    80007524:	00f70663          	beq	a4,a5,80007530 <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80007528:	fff00793          	li	a5,-1
    8000752c:	0fc0006f          	j	80007628 <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    80007530:	fe043783          	ld	a5,-32(s0)
    80007534:	00078c63          	beqz	a5,8000754c <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80007538:	fe843783          	ld	a5,-24(s0)
    8000753c:	0007b703          	ld	a4,0(a5)
    80007540:	fe043783          	ld	a5,-32(s0)
    80007544:	00e7b023          	sd	a4,0(a5)
    80007548:	0180006f          	j	80007560 <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    8000754c:	fe843783          	ld	a5,-24(s0)
    80007550:	0007b703          	ld	a4,0(a5)
    80007554:	00006797          	auipc	a5,0x6
    80007558:	bdc78793          	addi	a5,a5,-1060 # 8000d130 <_ZN15MemoryAllocator11usedMemHeadE>
    8000755c:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    80007560:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    80007564:	00006797          	auipc	a5,0x6
    80007568:	bd478793          	addi	a5,a5,-1068 # 8000d138 <_ZN15MemoryAllocator11freeMemHeadE>
    8000756c:	0007b783          	ld	a5,0(a5)
    80007570:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    80007574:	fd043783          	ld	a5,-48(s0)
    80007578:	02078463          	beqz	a5,800075a0 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    8000757c:	fd043703          	ld	a4,-48(s0)
    80007580:	fb843783          	ld	a5,-72(s0)
    80007584:	00f77e63          	bgeu	a4,a5,800075a0 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80007588:	fd043783          	ld	a5,-48(s0)
    8000758c:	fcf43c23          	sd	a5,-40(s0)
    80007590:	fd043783          	ld	a5,-48(s0)
    80007594:	0007b783          	ld	a5,0(a5)
    80007598:	fcf43823          	sd	a5,-48(s0)
    8000759c:	fd9ff06f          	j	80007574 <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    800075a0:	fb843783          	ld	a5,-72(s0)
    800075a4:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    800075a8:	fb843783          	ld	a5,-72(s0)
    800075ac:	0087b783          	ld	a5,8(a5)
    800075b0:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    800075b4:	fc843783          	ld	a5,-56(s0)
    800075b8:	fc043703          	ld	a4,-64(s0)
    800075bc:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    800075c0:	fd843783          	ld	a5,-40(s0)
    800075c4:	02078263          	beqz	a5,800075e8 <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    800075c8:	fd843783          	ld	a5,-40(s0)
    800075cc:	0007b703          	ld	a4,0(a5)
    800075d0:	fc843783          	ld	a5,-56(s0)
    800075d4:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    800075d8:	fd843783          	ld	a5,-40(s0)
    800075dc:	fc843703          	ld	a4,-56(s0)
    800075e0:	00e7b023          	sd	a4,0(a5)
    800075e4:	0280006f          	j	8000760c <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    800075e8:	00006797          	auipc	a5,0x6
    800075ec:	b5078793          	addi	a5,a5,-1200 # 8000d138 <_ZN15MemoryAllocator11freeMemHeadE>
    800075f0:	0007b703          	ld	a4,0(a5)
    800075f4:	fc843783          	ld	a5,-56(s0)
    800075f8:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    800075fc:	00006797          	auipc	a5,0x6
    80007600:	b3c78793          	addi	a5,a5,-1220 # 8000d138 <_ZN15MemoryAllocator11freeMemHeadE>
    80007604:	fc843703          	ld	a4,-56(s0)
    80007608:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    8000760c:	fc843503          	ld	a0,-56(s0)
    80007610:	00000097          	auipc	ra,0x0
    80007614:	02c080e7          	jalr	44(ra) # 8000763c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    80007618:	fd843503          	ld	a0,-40(s0)
    8000761c:	00000097          	auipc	ra,0x0
    80007620:	020080e7          	jalr	32(ra) # 8000763c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    80007624:	00000793          	li	a5,0
}
    80007628:	00078513          	mv	a0,a5
    8000762c:	04813083          	ld	ra,72(sp)
    80007630:	04013403          	ld	s0,64(sp)
    80007634:	05010113          	addi	sp,sp,80
    80007638:	00008067          	ret

000000008000763c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    8000763c:	fc010113          	addi	sp,sp,-64
    80007640:	02813c23          	sd	s0,56(sp)
    80007644:	04010413          	addi	s0,sp,64
    80007648:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    8000764c:	fc843783          	ld	a5,-56(s0)
    80007650:	00079663          	bnez	a5,8000765c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    80007654:	00000793          	li	a5,0
    80007658:	0a00006f          	j	800076f8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    8000765c:	fc843783          	ld	a5,-56(s0)
    80007660:	0007b783          	ld	a5,0(a5)
    80007664:	00f037b3          	snez	a5,a5
    80007668:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    8000766c:	fc843783          	ld	a5,-56(s0)
    80007670:	0087b783          	ld	a5,8(a5)
    80007674:	fc843703          	ld	a4,-56(s0)
    80007678:	00f707b3          	add	a5,a4,a5
    8000767c:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    80007680:	fc843783          	ld	a5,-56(s0)
    80007684:	0007b783          	ld	a5,0(a5)
    80007688:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    8000768c:	fe043703          	ld	a4,-32(s0)
    80007690:	fd843783          	ld	a5,-40(s0)
    80007694:	40f707b3          	sub	a5,a4,a5
    80007698:	0017b793          	seqz	a5,a5
    8000769c:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    800076a0:	fef44783          	lbu	a5,-17(s0)
    800076a4:	0ff7f793          	andi	a5,a5,255
    800076a8:	04078663          	beqz	a5,800076f4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    800076ac:	fd744783          	lbu	a5,-41(s0)
    800076b0:	0ff7f793          	andi	a5,a5,255
    800076b4:	04078063          	beqz	a5,800076f4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    800076b8:	fc843783          	ld	a5,-56(s0)
    800076bc:	0087b703          	ld	a4,8(a5)
    800076c0:	fc843783          	ld	a5,-56(s0)
    800076c4:	0007b783          	ld	a5,0(a5)
    800076c8:	0087b783          	ld	a5,8(a5)
    800076cc:	00f70733          	add	a4,a4,a5
    800076d0:	fc843783          	ld	a5,-56(s0)
    800076d4:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    800076d8:	fc843783          	ld	a5,-56(s0)
    800076dc:	0007b783          	ld	a5,0(a5)
    800076e0:	0007b703          	ld	a4,0(a5)
    800076e4:	fc843783          	ld	a5,-56(s0)
    800076e8:	00e7b023          	sd	a4,0(a5)
        return 1;
    800076ec:	00100793          	li	a5,1
    800076f0:	0080006f          	j	800076f8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    800076f4:	00000793          	li	a5,0
}
    800076f8:	00078513          	mv	a0,a5
    800076fc:	03813403          	ld	s0,56(sp)
    80007700:	04010113          	addi	sp,sp,64
    80007704:	00008067          	ret

0000000080007708 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80007708:	fe010113          	addi	sp,sp,-32
    8000770c:	00813c23          	sd	s0,24(sp)
    80007710:	02010413          	addi	s0,sp,32
    80007714:	fea43423          	sd	a0,-24(s0)
    80007718:	00058793          	mv	a5,a1
    8000771c:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80007720:	fe843783          	ld	a5,-24(s0)
    80007724:	fe078793          	addi	a5,a5,-32
    80007728:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    8000772c:	fe843783          	ld	a5,-24(s0)
    80007730:	0107a703          	lw	a4,16(a5)
    80007734:	fe442783          	lw	a5,-28(s0)
    80007738:	0007879b          	sext.w	a5,a5
    8000773c:	40e787b3          	sub	a5,a5,a4
    80007740:	0017b793          	seqz	a5,a5
    80007744:	0ff7f793          	andi	a5,a5,255
}
    80007748:	00078513          	mv	a0,a5
    8000774c:	01813403          	ld	s0,24(sp)
    80007750:	02010113          	addi	sp,sp,32
    80007754:	00008067          	ret

0000000080007758 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    80007758:	ff010113          	addi	sp,sp,-16
    8000775c:	00813423          	sd	s0,8(sp)
    80007760:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    80007764:	00006797          	auipc	a5,0x6
    80007768:	9dc78793          	addi	a5,a5,-1572 # 8000d140 <_ZN15MemoryAllocator11initializedE>
    8000776c:	0007c783          	lbu	a5,0(a5)
    80007770:	0017c793          	xori	a5,a5,1
    80007774:	0ff7f793          	andi	a5,a5,255
    80007778:	06078a63          	beqz	a5,800077ec <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    8000777c:	00005797          	auipc	a5,0x5
    80007780:	78c7b783          	ld	a5,1932(a5) # 8000cf08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80007784:	0007b703          	ld	a4,0(a5)
    80007788:	00006797          	auipc	a5,0x6
    8000778c:	9b078793          	addi	a5,a5,-1616 # 8000d138 <_ZN15MemoryAllocator11freeMemHeadE>
    80007790:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    80007794:	00006797          	auipc	a5,0x6
    80007798:	9a478793          	addi	a5,a5,-1628 # 8000d138 <_ZN15MemoryAllocator11freeMemHeadE>
    8000779c:	0007b783          	ld	a5,0(a5)
    800077a0:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    800077a4:	00005797          	auipc	a5,0x5
    800077a8:	7b47b783          	ld	a5,1972(a5) # 8000cf58 <_GLOBAL_OFFSET_TABLE_+0x80>
    800077ac:	0007b703          	ld	a4,0(a5)
    800077b0:	00005797          	auipc	a5,0x5
    800077b4:	7587b783          	ld	a5,1880(a5) # 8000cf08 <_GLOBAL_OFFSET_TABLE_+0x30>
    800077b8:	0007b783          	ld	a5,0(a5)
    800077bc:	40f70733          	sub	a4,a4,a5
    800077c0:	00006797          	auipc	a5,0x6
    800077c4:	97878793          	addi	a5,a5,-1672 # 8000d138 <_ZN15MemoryAllocator11freeMemHeadE>
    800077c8:	0007b783          	ld	a5,0(a5)
    800077cc:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    800077d0:	00006797          	auipc	a5,0x6
    800077d4:	96078793          	addi	a5,a5,-1696 # 8000d130 <_ZN15MemoryAllocator11usedMemHeadE>
    800077d8:	0007b023          	sd	zero,0(a5)

        initialized = true;
    800077dc:	00006797          	auipc	a5,0x6
    800077e0:	96478793          	addi	a5,a5,-1692 # 8000d140 <_ZN15MemoryAllocator11initializedE>
    800077e4:	00100713          	li	a4,1
    800077e8:	00e78023          	sb	a4,0(a5)
    }
}
    800077ec:	00000013          	nop
    800077f0:	00813403          	ld	s0,8(sp)
    800077f4:	01010113          	addi	sp,sp,16
    800077f8:	00008067          	ret

00000000800077fc <start>:
    800077fc:	ff010113          	addi	sp,sp,-16
    80007800:	00813423          	sd	s0,8(sp)
    80007804:	01010413          	addi	s0,sp,16
    80007808:	300027f3          	csrr	a5,mstatus
    8000780c:	ffffe737          	lui	a4,0xffffe
    80007810:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff044f>
    80007814:	00e7f7b3          	and	a5,a5,a4
    80007818:	00001737          	lui	a4,0x1
    8000781c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80007820:	00e7e7b3          	or	a5,a5,a4
    80007824:	30079073          	csrw	mstatus,a5
    80007828:	00000797          	auipc	a5,0x0
    8000782c:	16078793          	addi	a5,a5,352 # 80007988 <system_main>
    80007830:	34179073          	csrw	mepc,a5
    80007834:	00000793          	li	a5,0
    80007838:	18079073          	csrw	satp,a5
    8000783c:	000107b7          	lui	a5,0x10
    80007840:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007844:	30279073          	csrw	medeleg,a5
    80007848:	30379073          	csrw	mideleg,a5
    8000784c:	104027f3          	csrr	a5,sie
    80007850:	2227e793          	ori	a5,a5,546
    80007854:	10479073          	csrw	sie,a5
    80007858:	fff00793          	li	a5,-1
    8000785c:	00a7d793          	srli	a5,a5,0xa
    80007860:	3b079073          	csrw	pmpaddr0,a5
    80007864:	00f00793          	li	a5,15
    80007868:	3a079073          	csrw	pmpcfg0,a5
    8000786c:	f14027f3          	csrr	a5,mhartid
    80007870:	0200c737          	lui	a4,0x200c
    80007874:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007878:	0007869b          	sext.w	a3,a5
    8000787c:	00269713          	slli	a4,a3,0x2
    80007880:	000f4637          	lui	a2,0xf4
    80007884:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007888:	00d70733          	add	a4,a4,a3
    8000788c:	0037979b          	slliw	a5,a5,0x3
    80007890:	020046b7          	lui	a3,0x2004
    80007894:	00d787b3          	add	a5,a5,a3
    80007898:	00c585b3          	add	a1,a1,a2
    8000789c:	00371693          	slli	a3,a4,0x3
    800078a0:	00006717          	auipc	a4,0x6
    800078a4:	8b070713          	addi	a4,a4,-1872 # 8000d150 <timer_scratch>
    800078a8:	00b7b023          	sd	a1,0(a5)
    800078ac:	00d70733          	add	a4,a4,a3
    800078b0:	00f73c23          	sd	a5,24(a4)
    800078b4:	02c73023          	sd	a2,32(a4)
    800078b8:	34071073          	csrw	mscratch,a4
    800078bc:	00000797          	auipc	a5,0x0
    800078c0:	6e478793          	addi	a5,a5,1764 # 80007fa0 <timervec>
    800078c4:	30579073          	csrw	mtvec,a5
    800078c8:	300027f3          	csrr	a5,mstatus
    800078cc:	0087e793          	ori	a5,a5,8
    800078d0:	30079073          	csrw	mstatus,a5
    800078d4:	304027f3          	csrr	a5,mie
    800078d8:	0807e793          	ori	a5,a5,128
    800078dc:	30479073          	csrw	mie,a5
    800078e0:	f14027f3          	csrr	a5,mhartid
    800078e4:	0007879b          	sext.w	a5,a5
    800078e8:	00078213          	mv	tp,a5
    800078ec:	30200073          	mret
    800078f0:	00813403          	ld	s0,8(sp)
    800078f4:	01010113          	addi	sp,sp,16
    800078f8:	00008067          	ret

00000000800078fc <timerinit>:
    800078fc:	ff010113          	addi	sp,sp,-16
    80007900:	00813423          	sd	s0,8(sp)
    80007904:	01010413          	addi	s0,sp,16
    80007908:	f14027f3          	csrr	a5,mhartid
    8000790c:	0200c737          	lui	a4,0x200c
    80007910:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007914:	0007869b          	sext.w	a3,a5
    80007918:	00269713          	slli	a4,a3,0x2
    8000791c:	000f4637          	lui	a2,0xf4
    80007920:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007924:	00d70733          	add	a4,a4,a3
    80007928:	0037979b          	slliw	a5,a5,0x3
    8000792c:	020046b7          	lui	a3,0x2004
    80007930:	00d787b3          	add	a5,a5,a3
    80007934:	00c585b3          	add	a1,a1,a2
    80007938:	00371693          	slli	a3,a4,0x3
    8000793c:	00006717          	auipc	a4,0x6
    80007940:	81470713          	addi	a4,a4,-2028 # 8000d150 <timer_scratch>
    80007944:	00b7b023          	sd	a1,0(a5)
    80007948:	00d70733          	add	a4,a4,a3
    8000794c:	00f73c23          	sd	a5,24(a4)
    80007950:	02c73023          	sd	a2,32(a4)
    80007954:	34071073          	csrw	mscratch,a4
    80007958:	00000797          	auipc	a5,0x0
    8000795c:	64878793          	addi	a5,a5,1608 # 80007fa0 <timervec>
    80007960:	30579073          	csrw	mtvec,a5
    80007964:	300027f3          	csrr	a5,mstatus
    80007968:	0087e793          	ori	a5,a5,8
    8000796c:	30079073          	csrw	mstatus,a5
    80007970:	304027f3          	csrr	a5,mie
    80007974:	0807e793          	ori	a5,a5,128
    80007978:	30479073          	csrw	mie,a5
    8000797c:	00813403          	ld	s0,8(sp)
    80007980:	01010113          	addi	sp,sp,16
    80007984:	00008067          	ret

0000000080007988 <system_main>:
    80007988:	fe010113          	addi	sp,sp,-32
    8000798c:	00813823          	sd	s0,16(sp)
    80007990:	00913423          	sd	s1,8(sp)
    80007994:	00113c23          	sd	ra,24(sp)
    80007998:	02010413          	addi	s0,sp,32
    8000799c:	00000097          	auipc	ra,0x0
    800079a0:	0c4080e7          	jalr	196(ra) # 80007a60 <cpuid>
    800079a4:	00005497          	auipc	s1,0x5
    800079a8:	5fc48493          	addi	s1,s1,1532 # 8000cfa0 <started>
    800079ac:	02050263          	beqz	a0,800079d0 <system_main+0x48>
    800079b0:	0004a783          	lw	a5,0(s1)
    800079b4:	0007879b          	sext.w	a5,a5
    800079b8:	fe078ce3          	beqz	a5,800079b0 <system_main+0x28>
    800079bc:	0ff0000f          	fence
    800079c0:	00003517          	auipc	a0,0x3
    800079c4:	de050513          	addi	a0,a0,-544 # 8000a7a0 <CONSOLE_STATUS+0x790>
    800079c8:	00001097          	auipc	ra,0x1
    800079cc:	a74080e7          	jalr	-1420(ra) # 8000843c <panic>
    800079d0:	00001097          	auipc	ra,0x1
    800079d4:	9c8080e7          	jalr	-1592(ra) # 80008398 <consoleinit>
    800079d8:	00001097          	auipc	ra,0x1
    800079dc:	154080e7          	jalr	340(ra) # 80008b2c <printfinit>
    800079e0:	00003517          	auipc	a0,0x3
    800079e4:	c4850513          	addi	a0,a0,-952 # 8000a628 <CONSOLE_STATUS+0x618>
    800079e8:	00001097          	auipc	ra,0x1
    800079ec:	ab0080e7          	jalr	-1360(ra) # 80008498 <__printf>
    800079f0:	00003517          	auipc	a0,0x3
    800079f4:	d8050513          	addi	a0,a0,-640 # 8000a770 <CONSOLE_STATUS+0x760>
    800079f8:	00001097          	auipc	ra,0x1
    800079fc:	aa0080e7          	jalr	-1376(ra) # 80008498 <__printf>
    80007a00:	00003517          	auipc	a0,0x3
    80007a04:	c2850513          	addi	a0,a0,-984 # 8000a628 <CONSOLE_STATUS+0x618>
    80007a08:	00001097          	auipc	ra,0x1
    80007a0c:	a90080e7          	jalr	-1392(ra) # 80008498 <__printf>
    80007a10:	00001097          	auipc	ra,0x1
    80007a14:	4a8080e7          	jalr	1192(ra) # 80008eb8 <kinit>
    80007a18:	00000097          	auipc	ra,0x0
    80007a1c:	148080e7          	jalr	328(ra) # 80007b60 <trapinit>
    80007a20:	00000097          	auipc	ra,0x0
    80007a24:	16c080e7          	jalr	364(ra) # 80007b8c <trapinithart>
    80007a28:	00000097          	auipc	ra,0x0
    80007a2c:	5b8080e7          	jalr	1464(ra) # 80007fe0 <plicinit>
    80007a30:	00000097          	auipc	ra,0x0
    80007a34:	5d8080e7          	jalr	1496(ra) # 80008008 <plicinithart>
    80007a38:	00000097          	auipc	ra,0x0
    80007a3c:	078080e7          	jalr	120(ra) # 80007ab0 <userinit>
    80007a40:	0ff0000f          	fence
    80007a44:	00100793          	li	a5,1
    80007a48:	00003517          	auipc	a0,0x3
    80007a4c:	d4050513          	addi	a0,a0,-704 # 8000a788 <CONSOLE_STATUS+0x778>
    80007a50:	00f4a023          	sw	a5,0(s1)
    80007a54:	00001097          	auipc	ra,0x1
    80007a58:	a44080e7          	jalr	-1468(ra) # 80008498 <__printf>
    80007a5c:	0000006f          	j	80007a5c <system_main+0xd4>

0000000080007a60 <cpuid>:
    80007a60:	ff010113          	addi	sp,sp,-16
    80007a64:	00813423          	sd	s0,8(sp)
    80007a68:	01010413          	addi	s0,sp,16
    80007a6c:	00020513          	mv	a0,tp
    80007a70:	00813403          	ld	s0,8(sp)
    80007a74:	0005051b          	sext.w	a0,a0
    80007a78:	01010113          	addi	sp,sp,16
    80007a7c:	00008067          	ret

0000000080007a80 <mycpu>:
    80007a80:	ff010113          	addi	sp,sp,-16
    80007a84:	00813423          	sd	s0,8(sp)
    80007a88:	01010413          	addi	s0,sp,16
    80007a8c:	00020793          	mv	a5,tp
    80007a90:	00813403          	ld	s0,8(sp)
    80007a94:	0007879b          	sext.w	a5,a5
    80007a98:	00779793          	slli	a5,a5,0x7
    80007a9c:	00006517          	auipc	a0,0x6
    80007aa0:	6e450513          	addi	a0,a0,1764 # 8000e180 <cpus>
    80007aa4:	00f50533          	add	a0,a0,a5
    80007aa8:	01010113          	addi	sp,sp,16
    80007aac:	00008067          	ret

0000000080007ab0 <userinit>:
    80007ab0:	ff010113          	addi	sp,sp,-16
    80007ab4:	00813423          	sd	s0,8(sp)
    80007ab8:	01010413          	addi	s0,sp,16
    80007abc:	00813403          	ld	s0,8(sp)
    80007ac0:	01010113          	addi	sp,sp,16
    80007ac4:	ffffa317          	auipc	t1,0xffffa
    80007ac8:	35430067          	jr	852(t1) # 80001e18 <main>

0000000080007acc <either_copyout>:
    80007acc:	ff010113          	addi	sp,sp,-16
    80007ad0:	00813023          	sd	s0,0(sp)
    80007ad4:	00113423          	sd	ra,8(sp)
    80007ad8:	01010413          	addi	s0,sp,16
    80007adc:	02051663          	bnez	a0,80007b08 <either_copyout+0x3c>
    80007ae0:	00058513          	mv	a0,a1
    80007ae4:	00060593          	mv	a1,a2
    80007ae8:	0006861b          	sext.w	a2,a3
    80007aec:	00002097          	auipc	ra,0x2
    80007af0:	c58080e7          	jalr	-936(ra) # 80009744 <__memmove>
    80007af4:	00813083          	ld	ra,8(sp)
    80007af8:	00013403          	ld	s0,0(sp)
    80007afc:	00000513          	li	a0,0
    80007b00:	01010113          	addi	sp,sp,16
    80007b04:	00008067          	ret
    80007b08:	00003517          	auipc	a0,0x3
    80007b0c:	cc050513          	addi	a0,a0,-832 # 8000a7c8 <CONSOLE_STATUS+0x7b8>
    80007b10:	00001097          	auipc	ra,0x1
    80007b14:	92c080e7          	jalr	-1748(ra) # 8000843c <panic>

0000000080007b18 <either_copyin>:
    80007b18:	ff010113          	addi	sp,sp,-16
    80007b1c:	00813023          	sd	s0,0(sp)
    80007b20:	00113423          	sd	ra,8(sp)
    80007b24:	01010413          	addi	s0,sp,16
    80007b28:	02059463          	bnez	a1,80007b50 <either_copyin+0x38>
    80007b2c:	00060593          	mv	a1,a2
    80007b30:	0006861b          	sext.w	a2,a3
    80007b34:	00002097          	auipc	ra,0x2
    80007b38:	c10080e7          	jalr	-1008(ra) # 80009744 <__memmove>
    80007b3c:	00813083          	ld	ra,8(sp)
    80007b40:	00013403          	ld	s0,0(sp)
    80007b44:	00000513          	li	a0,0
    80007b48:	01010113          	addi	sp,sp,16
    80007b4c:	00008067          	ret
    80007b50:	00003517          	auipc	a0,0x3
    80007b54:	ca050513          	addi	a0,a0,-864 # 8000a7f0 <CONSOLE_STATUS+0x7e0>
    80007b58:	00001097          	auipc	ra,0x1
    80007b5c:	8e4080e7          	jalr	-1820(ra) # 8000843c <panic>

0000000080007b60 <trapinit>:
    80007b60:	ff010113          	addi	sp,sp,-16
    80007b64:	00813423          	sd	s0,8(sp)
    80007b68:	01010413          	addi	s0,sp,16
    80007b6c:	00813403          	ld	s0,8(sp)
    80007b70:	00003597          	auipc	a1,0x3
    80007b74:	ca858593          	addi	a1,a1,-856 # 8000a818 <CONSOLE_STATUS+0x808>
    80007b78:	00006517          	auipc	a0,0x6
    80007b7c:	68850513          	addi	a0,a0,1672 # 8000e200 <tickslock>
    80007b80:	01010113          	addi	sp,sp,16
    80007b84:	00001317          	auipc	t1,0x1
    80007b88:	5c430067          	jr	1476(t1) # 80009148 <initlock>

0000000080007b8c <trapinithart>:
    80007b8c:	ff010113          	addi	sp,sp,-16
    80007b90:	00813423          	sd	s0,8(sp)
    80007b94:	01010413          	addi	s0,sp,16
    80007b98:	00000797          	auipc	a5,0x0
    80007b9c:	2f878793          	addi	a5,a5,760 # 80007e90 <kernelvec>
    80007ba0:	10579073          	csrw	stvec,a5
    80007ba4:	00813403          	ld	s0,8(sp)
    80007ba8:	01010113          	addi	sp,sp,16
    80007bac:	00008067          	ret

0000000080007bb0 <usertrap>:
    80007bb0:	ff010113          	addi	sp,sp,-16
    80007bb4:	00813423          	sd	s0,8(sp)
    80007bb8:	01010413          	addi	s0,sp,16
    80007bbc:	00813403          	ld	s0,8(sp)
    80007bc0:	01010113          	addi	sp,sp,16
    80007bc4:	00008067          	ret

0000000080007bc8 <usertrapret>:
    80007bc8:	ff010113          	addi	sp,sp,-16
    80007bcc:	00813423          	sd	s0,8(sp)
    80007bd0:	01010413          	addi	s0,sp,16
    80007bd4:	00813403          	ld	s0,8(sp)
    80007bd8:	01010113          	addi	sp,sp,16
    80007bdc:	00008067          	ret

0000000080007be0 <kerneltrap>:
    80007be0:	fe010113          	addi	sp,sp,-32
    80007be4:	00813823          	sd	s0,16(sp)
    80007be8:	00113c23          	sd	ra,24(sp)
    80007bec:	00913423          	sd	s1,8(sp)
    80007bf0:	02010413          	addi	s0,sp,32
    80007bf4:	142025f3          	csrr	a1,scause
    80007bf8:	100027f3          	csrr	a5,sstatus
    80007bfc:	0027f793          	andi	a5,a5,2
    80007c00:	10079c63          	bnez	a5,80007d18 <kerneltrap+0x138>
    80007c04:	142027f3          	csrr	a5,scause
    80007c08:	0207ce63          	bltz	a5,80007c44 <kerneltrap+0x64>
    80007c0c:	00003517          	auipc	a0,0x3
    80007c10:	c5450513          	addi	a0,a0,-940 # 8000a860 <CONSOLE_STATUS+0x850>
    80007c14:	00001097          	auipc	ra,0x1
    80007c18:	884080e7          	jalr	-1916(ra) # 80008498 <__printf>
    80007c1c:	141025f3          	csrr	a1,sepc
    80007c20:	14302673          	csrr	a2,stval
    80007c24:	00003517          	auipc	a0,0x3
    80007c28:	c4c50513          	addi	a0,a0,-948 # 8000a870 <CONSOLE_STATUS+0x860>
    80007c2c:	00001097          	auipc	ra,0x1
    80007c30:	86c080e7          	jalr	-1940(ra) # 80008498 <__printf>
    80007c34:	00003517          	auipc	a0,0x3
    80007c38:	c5450513          	addi	a0,a0,-940 # 8000a888 <CONSOLE_STATUS+0x878>
    80007c3c:	00001097          	auipc	ra,0x1
    80007c40:	800080e7          	jalr	-2048(ra) # 8000843c <panic>
    80007c44:	0ff7f713          	andi	a4,a5,255
    80007c48:	00900693          	li	a3,9
    80007c4c:	04d70063          	beq	a4,a3,80007c8c <kerneltrap+0xac>
    80007c50:	fff00713          	li	a4,-1
    80007c54:	03f71713          	slli	a4,a4,0x3f
    80007c58:	00170713          	addi	a4,a4,1
    80007c5c:	fae798e3          	bne	a5,a4,80007c0c <kerneltrap+0x2c>
    80007c60:	00000097          	auipc	ra,0x0
    80007c64:	e00080e7          	jalr	-512(ra) # 80007a60 <cpuid>
    80007c68:	06050663          	beqz	a0,80007cd4 <kerneltrap+0xf4>
    80007c6c:	144027f3          	csrr	a5,sip
    80007c70:	ffd7f793          	andi	a5,a5,-3
    80007c74:	14479073          	csrw	sip,a5
    80007c78:	01813083          	ld	ra,24(sp)
    80007c7c:	01013403          	ld	s0,16(sp)
    80007c80:	00813483          	ld	s1,8(sp)
    80007c84:	02010113          	addi	sp,sp,32
    80007c88:	00008067          	ret
    80007c8c:	00000097          	auipc	ra,0x0
    80007c90:	3c8080e7          	jalr	968(ra) # 80008054 <plic_claim>
    80007c94:	00a00793          	li	a5,10
    80007c98:	00050493          	mv	s1,a0
    80007c9c:	06f50863          	beq	a0,a5,80007d0c <kerneltrap+0x12c>
    80007ca0:	fc050ce3          	beqz	a0,80007c78 <kerneltrap+0x98>
    80007ca4:	00050593          	mv	a1,a0
    80007ca8:	00003517          	auipc	a0,0x3
    80007cac:	b9850513          	addi	a0,a0,-1128 # 8000a840 <CONSOLE_STATUS+0x830>
    80007cb0:	00000097          	auipc	ra,0x0
    80007cb4:	7e8080e7          	jalr	2024(ra) # 80008498 <__printf>
    80007cb8:	01013403          	ld	s0,16(sp)
    80007cbc:	01813083          	ld	ra,24(sp)
    80007cc0:	00048513          	mv	a0,s1
    80007cc4:	00813483          	ld	s1,8(sp)
    80007cc8:	02010113          	addi	sp,sp,32
    80007ccc:	00000317          	auipc	t1,0x0
    80007cd0:	3c030067          	jr	960(t1) # 8000808c <plic_complete>
    80007cd4:	00006517          	auipc	a0,0x6
    80007cd8:	52c50513          	addi	a0,a0,1324 # 8000e200 <tickslock>
    80007cdc:	00001097          	auipc	ra,0x1
    80007ce0:	490080e7          	jalr	1168(ra) # 8000916c <acquire>
    80007ce4:	00005717          	auipc	a4,0x5
    80007ce8:	2c070713          	addi	a4,a4,704 # 8000cfa4 <ticks>
    80007cec:	00072783          	lw	a5,0(a4)
    80007cf0:	00006517          	auipc	a0,0x6
    80007cf4:	51050513          	addi	a0,a0,1296 # 8000e200 <tickslock>
    80007cf8:	0017879b          	addiw	a5,a5,1
    80007cfc:	00f72023          	sw	a5,0(a4)
    80007d00:	00001097          	auipc	ra,0x1
    80007d04:	538080e7          	jalr	1336(ra) # 80009238 <release>
    80007d08:	f65ff06f          	j	80007c6c <kerneltrap+0x8c>
    80007d0c:	00001097          	auipc	ra,0x1
    80007d10:	094080e7          	jalr	148(ra) # 80008da0 <uartintr>
    80007d14:	fa5ff06f          	j	80007cb8 <kerneltrap+0xd8>
    80007d18:	00003517          	auipc	a0,0x3
    80007d1c:	b0850513          	addi	a0,a0,-1272 # 8000a820 <CONSOLE_STATUS+0x810>
    80007d20:	00000097          	auipc	ra,0x0
    80007d24:	71c080e7          	jalr	1820(ra) # 8000843c <panic>

0000000080007d28 <clockintr>:
    80007d28:	fe010113          	addi	sp,sp,-32
    80007d2c:	00813823          	sd	s0,16(sp)
    80007d30:	00913423          	sd	s1,8(sp)
    80007d34:	00113c23          	sd	ra,24(sp)
    80007d38:	02010413          	addi	s0,sp,32
    80007d3c:	00006497          	auipc	s1,0x6
    80007d40:	4c448493          	addi	s1,s1,1220 # 8000e200 <tickslock>
    80007d44:	00048513          	mv	a0,s1
    80007d48:	00001097          	auipc	ra,0x1
    80007d4c:	424080e7          	jalr	1060(ra) # 8000916c <acquire>
    80007d50:	00005717          	auipc	a4,0x5
    80007d54:	25470713          	addi	a4,a4,596 # 8000cfa4 <ticks>
    80007d58:	00072783          	lw	a5,0(a4)
    80007d5c:	01013403          	ld	s0,16(sp)
    80007d60:	01813083          	ld	ra,24(sp)
    80007d64:	00048513          	mv	a0,s1
    80007d68:	0017879b          	addiw	a5,a5,1
    80007d6c:	00813483          	ld	s1,8(sp)
    80007d70:	00f72023          	sw	a5,0(a4)
    80007d74:	02010113          	addi	sp,sp,32
    80007d78:	00001317          	auipc	t1,0x1
    80007d7c:	4c030067          	jr	1216(t1) # 80009238 <release>

0000000080007d80 <devintr>:
    80007d80:	142027f3          	csrr	a5,scause
    80007d84:	00000513          	li	a0,0
    80007d88:	0007c463          	bltz	a5,80007d90 <devintr+0x10>
    80007d8c:	00008067          	ret
    80007d90:	fe010113          	addi	sp,sp,-32
    80007d94:	00813823          	sd	s0,16(sp)
    80007d98:	00113c23          	sd	ra,24(sp)
    80007d9c:	00913423          	sd	s1,8(sp)
    80007da0:	02010413          	addi	s0,sp,32
    80007da4:	0ff7f713          	andi	a4,a5,255
    80007da8:	00900693          	li	a3,9
    80007dac:	04d70c63          	beq	a4,a3,80007e04 <devintr+0x84>
    80007db0:	fff00713          	li	a4,-1
    80007db4:	03f71713          	slli	a4,a4,0x3f
    80007db8:	00170713          	addi	a4,a4,1
    80007dbc:	00e78c63          	beq	a5,a4,80007dd4 <devintr+0x54>
    80007dc0:	01813083          	ld	ra,24(sp)
    80007dc4:	01013403          	ld	s0,16(sp)
    80007dc8:	00813483          	ld	s1,8(sp)
    80007dcc:	02010113          	addi	sp,sp,32
    80007dd0:	00008067          	ret
    80007dd4:	00000097          	auipc	ra,0x0
    80007dd8:	c8c080e7          	jalr	-884(ra) # 80007a60 <cpuid>
    80007ddc:	06050663          	beqz	a0,80007e48 <devintr+0xc8>
    80007de0:	144027f3          	csrr	a5,sip
    80007de4:	ffd7f793          	andi	a5,a5,-3
    80007de8:	14479073          	csrw	sip,a5
    80007dec:	01813083          	ld	ra,24(sp)
    80007df0:	01013403          	ld	s0,16(sp)
    80007df4:	00813483          	ld	s1,8(sp)
    80007df8:	00200513          	li	a0,2
    80007dfc:	02010113          	addi	sp,sp,32
    80007e00:	00008067          	ret
    80007e04:	00000097          	auipc	ra,0x0
    80007e08:	250080e7          	jalr	592(ra) # 80008054 <plic_claim>
    80007e0c:	00a00793          	li	a5,10
    80007e10:	00050493          	mv	s1,a0
    80007e14:	06f50663          	beq	a0,a5,80007e80 <devintr+0x100>
    80007e18:	00100513          	li	a0,1
    80007e1c:	fa0482e3          	beqz	s1,80007dc0 <devintr+0x40>
    80007e20:	00048593          	mv	a1,s1
    80007e24:	00003517          	auipc	a0,0x3
    80007e28:	a1c50513          	addi	a0,a0,-1508 # 8000a840 <CONSOLE_STATUS+0x830>
    80007e2c:	00000097          	auipc	ra,0x0
    80007e30:	66c080e7          	jalr	1644(ra) # 80008498 <__printf>
    80007e34:	00048513          	mv	a0,s1
    80007e38:	00000097          	auipc	ra,0x0
    80007e3c:	254080e7          	jalr	596(ra) # 8000808c <plic_complete>
    80007e40:	00100513          	li	a0,1
    80007e44:	f7dff06f          	j	80007dc0 <devintr+0x40>
    80007e48:	00006517          	auipc	a0,0x6
    80007e4c:	3b850513          	addi	a0,a0,952 # 8000e200 <tickslock>
    80007e50:	00001097          	auipc	ra,0x1
    80007e54:	31c080e7          	jalr	796(ra) # 8000916c <acquire>
    80007e58:	00005717          	auipc	a4,0x5
    80007e5c:	14c70713          	addi	a4,a4,332 # 8000cfa4 <ticks>
    80007e60:	00072783          	lw	a5,0(a4)
    80007e64:	00006517          	auipc	a0,0x6
    80007e68:	39c50513          	addi	a0,a0,924 # 8000e200 <tickslock>
    80007e6c:	0017879b          	addiw	a5,a5,1
    80007e70:	00f72023          	sw	a5,0(a4)
    80007e74:	00001097          	auipc	ra,0x1
    80007e78:	3c4080e7          	jalr	964(ra) # 80009238 <release>
    80007e7c:	f65ff06f          	j	80007de0 <devintr+0x60>
    80007e80:	00001097          	auipc	ra,0x1
    80007e84:	f20080e7          	jalr	-224(ra) # 80008da0 <uartintr>
    80007e88:	fadff06f          	j	80007e34 <devintr+0xb4>
    80007e8c:	0000                	unimp
	...

0000000080007e90 <kernelvec>:
    80007e90:	f0010113          	addi	sp,sp,-256
    80007e94:	00113023          	sd	ra,0(sp)
    80007e98:	00213423          	sd	sp,8(sp)
    80007e9c:	00313823          	sd	gp,16(sp)
    80007ea0:	00413c23          	sd	tp,24(sp)
    80007ea4:	02513023          	sd	t0,32(sp)
    80007ea8:	02613423          	sd	t1,40(sp)
    80007eac:	02713823          	sd	t2,48(sp)
    80007eb0:	02813c23          	sd	s0,56(sp)
    80007eb4:	04913023          	sd	s1,64(sp)
    80007eb8:	04a13423          	sd	a0,72(sp)
    80007ebc:	04b13823          	sd	a1,80(sp)
    80007ec0:	04c13c23          	sd	a2,88(sp)
    80007ec4:	06d13023          	sd	a3,96(sp)
    80007ec8:	06e13423          	sd	a4,104(sp)
    80007ecc:	06f13823          	sd	a5,112(sp)
    80007ed0:	07013c23          	sd	a6,120(sp)
    80007ed4:	09113023          	sd	a7,128(sp)
    80007ed8:	09213423          	sd	s2,136(sp)
    80007edc:	09313823          	sd	s3,144(sp)
    80007ee0:	09413c23          	sd	s4,152(sp)
    80007ee4:	0b513023          	sd	s5,160(sp)
    80007ee8:	0b613423          	sd	s6,168(sp)
    80007eec:	0b713823          	sd	s7,176(sp)
    80007ef0:	0b813c23          	sd	s8,184(sp)
    80007ef4:	0d913023          	sd	s9,192(sp)
    80007ef8:	0da13423          	sd	s10,200(sp)
    80007efc:	0db13823          	sd	s11,208(sp)
    80007f00:	0dc13c23          	sd	t3,216(sp)
    80007f04:	0fd13023          	sd	t4,224(sp)
    80007f08:	0fe13423          	sd	t5,232(sp)
    80007f0c:	0ff13823          	sd	t6,240(sp)
    80007f10:	cd1ff0ef          	jal	ra,80007be0 <kerneltrap>
    80007f14:	00013083          	ld	ra,0(sp)
    80007f18:	00813103          	ld	sp,8(sp)
    80007f1c:	01013183          	ld	gp,16(sp)
    80007f20:	02013283          	ld	t0,32(sp)
    80007f24:	02813303          	ld	t1,40(sp)
    80007f28:	03013383          	ld	t2,48(sp)
    80007f2c:	03813403          	ld	s0,56(sp)
    80007f30:	04013483          	ld	s1,64(sp)
    80007f34:	04813503          	ld	a0,72(sp)
    80007f38:	05013583          	ld	a1,80(sp)
    80007f3c:	05813603          	ld	a2,88(sp)
    80007f40:	06013683          	ld	a3,96(sp)
    80007f44:	06813703          	ld	a4,104(sp)
    80007f48:	07013783          	ld	a5,112(sp)
    80007f4c:	07813803          	ld	a6,120(sp)
    80007f50:	08013883          	ld	a7,128(sp)
    80007f54:	08813903          	ld	s2,136(sp)
    80007f58:	09013983          	ld	s3,144(sp)
    80007f5c:	09813a03          	ld	s4,152(sp)
    80007f60:	0a013a83          	ld	s5,160(sp)
    80007f64:	0a813b03          	ld	s6,168(sp)
    80007f68:	0b013b83          	ld	s7,176(sp)
    80007f6c:	0b813c03          	ld	s8,184(sp)
    80007f70:	0c013c83          	ld	s9,192(sp)
    80007f74:	0c813d03          	ld	s10,200(sp)
    80007f78:	0d013d83          	ld	s11,208(sp)
    80007f7c:	0d813e03          	ld	t3,216(sp)
    80007f80:	0e013e83          	ld	t4,224(sp)
    80007f84:	0e813f03          	ld	t5,232(sp)
    80007f88:	0f013f83          	ld	t6,240(sp)
    80007f8c:	10010113          	addi	sp,sp,256
    80007f90:	10200073          	sret
    80007f94:	00000013          	nop
    80007f98:	00000013          	nop
    80007f9c:	00000013          	nop

0000000080007fa0 <timervec>:
    80007fa0:	34051573          	csrrw	a0,mscratch,a0
    80007fa4:	00b53023          	sd	a1,0(a0)
    80007fa8:	00c53423          	sd	a2,8(a0)
    80007fac:	00d53823          	sd	a3,16(a0)
    80007fb0:	01853583          	ld	a1,24(a0)
    80007fb4:	02053603          	ld	a2,32(a0)
    80007fb8:	0005b683          	ld	a3,0(a1)
    80007fbc:	00c686b3          	add	a3,a3,a2
    80007fc0:	00d5b023          	sd	a3,0(a1)
    80007fc4:	00200593          	li	a1,2
    80007fc8:	14459073          	csrw	sip,a1
    80007fcc:	01053683          	ld	a3,16(a0)
    80007fd0:	00853603          	ld	a2,8(a0)
    80007fd4:	00053583          	ld	a1,0(a0)
    80007fd8:	34051573          	csrrw	a0,mscratch,a0
    80007fdc:	30200073          	mret

0000000080007fe0 <plicinit>:
    80007fe0:	ff010113          	addi	sp,sp,-16
    80007fe4:	00813423          	sd	s0,8(sp)
    80007fe8:	01010413          	addi	s0,sp,16
    80007fec:	00813403          	ld	s0,8(sp)
    80007ff0:	0c0007b7          	lui	a5,0xc000
    80007ff4:	00100713          	li	a4,1
    80007ff8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80007ffc:	00e7a223          	sw	a4,4(a5)
    80008000:	01010113          	addi	sp,sp,16
    80008004:	00008067          	ret

0000000080008008 <plicinithart>:
    80008008:	ff010113          	addi	sp,sp,-16
    8000800c:	00813023          	sd	s0,0(sp)
    80008010:	00113423          	sd	ra,8(sp)
    80008014:	01010413          	addi	s0,sp,16
    80008018:	00000097          	auipc	ra,0x0
    8000801c:	a48080e7          	jalr	-1464(ra) # 80007a60 <cpuid>
    80008020:	0085171b          	slliw	a4,a0,0x8
    80008024:	0c0027b7          	lui	a5,0xc002
    80008028:	00e787b3          	add	a5,a5,a4
    8000802c:	40200713          	li	a4,1026
    80008030:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80008034:	00813083          	ld	ra,8(sp)
    80008038:	00013403          	ld	s0,0(sp)
    8000803c:	00d5151b          	slliw	a0,a0,0xd
    80008040:	0c2017b7          	lui	a5,0xc201
    80008044:	00a78533          	add	a0,a5,a0
    80008048:	00052023          	sw	zero,0(a0)
    8000804c:	01010113          	addi	sp,sp,16
    80008050:	00008067          	ret

0000000080008054 <plic_claim>:
    80008054:	ff010113          	addi	sp,sp,-16
    80008058:	00813023          	sd	s0,0(sp)
    8000805c:	00113423          	sd	ra,8(sp)
    80008060:	01010413          	addi	s0,sp,16
    80008064:	00000097          	auipc	ra,0x0
    80008068:	9fc080e7          	jalr	-1540(ra) # 80007a60 <cpuid>
    8000806c:	00813083          	ld	ra,8(sp)
    80008070:	00013403          	ld	s0,0(sp)
    80008074:	00d5151b          	slliw	a0,a0,0xd
    80008078:	0c2017b7          	lui	a5,0xc201
    8000807c:	00a78533          	add	a0,a5,a0
    80008080:	00452503          	lw	a0,4(a0)
    80008084:	01010113          	addi	sp,sp,16
    80008088:	00008067          	ret

000000008000808c <plic_complete>:
    8000808c:	fe010113          	addi	sp,sp,-32
    80008090:	00813823          	sd	s0,16(sp)
    80008094:	00913423          	sd	s1,8(sp)
    80008098:	00113c23          	sd	ra,24(sp)
    8000809c:	02010413          	addi	s0,sp,32
    800080a0:	00050493          	mv	s1,a0
    800080a4:	00000097          	auipc	ra,0x0
    800080a8:	9bc080e7          	jalr	-1604(ra) # 80007a60 <cpuid>
    800080ac:	01813083          	ld	ra,24(sp)
    800080b0:	01013403          	ld	s0,16(sp)
    800080b4:	00d5179b          	slliw	a5,a0,0xd
    800080b8:	0c201737          	lui	a4,0xc201
    800080bc:	00f707b3          	add	a5,a4,a5
    800080c0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800080c4:	00813483          	ld	s1,8(sp)
    800080c8:	02010113          	addi	sp,sp,32
    800080cc:	00008067          	ret

00000000800080d0 <consolewrite>:
    800080d0:	fb010113          	addi	sp,sp,-80
    800080d4:	04813023          	sd	s0,64(sp)
    800080d8:	04113423          	sd	ra,72(sp)
    800080dc:	02913c23          	sd	s1,56(sp)
    800080e0:	03213823          	sd	s2,48(sp)
    800080e4:	03313423          	sd	s3,40(sp)
    800080e8:	03413023          	sd	s4,32(sp)
    800080ec:	01513c23          	sd	s5,24(sp)
    800080f0:	05010413          	addi	s0,sp,80
    800080f4:	06c05c63          	blez	a2,8000816c <consolewrite+0x9c>
    800080f8:	00060993          	mv	s3,a2
    800080fc:	00050a13          	mv	s4,a0
    80008100:	00058493          	mv	s1,a1
    80008104:	00000913          	li	s2,0
    80008108:	fff00a93          	li	s5,-1
    8000810c:	01c0006f          	j	80008128 <consolewrite+0x58>
    80008110:	fbf44503          	lbu	a0,-65(s0)
    80008114:	0019091b          	addiw	s2,s2,1
    80008118:	00148493          	addi	s1,s1,1
    8000811c:	00001097          	auipc	ra,0x1
    80008120:	a9c080e7          	jalr	-1380(ra) # 80008bb8 <uartputc>
    80008124:	03298063          	beq	s3,s2,80008144 <consolewrite+0x74>
    80008128:	00048613          	mv	a2,s1
    8000812c:	00100693          	li	a3,1
    80008130:	000a0593          	mv	a1,s4
    80008134:	fbf40513          	addi	a0,s0,-65
    80008138:	00000097          	auipc	ra,0x0
    8000813c:	9e0080e7          	jalr	-1568(ra) # 80007b18 <either_copyin>
    80008140:	fd5518e3          	bne	a0,s5,80008110 <consolewrite+0x40>
    80008144:	04813083          	ld	ra,72(sp)
    80008148:	04013403          	ld	s0,64(sp)
    8000814c:	03813483          	ld	s1,56(sp)
    80008150:	02813983          	ld	s3,40(sp)
    80008154:	02013a03          	ld	s4,32(sp)
    80008158:	01813a83          	ld	s5,24(sp)
    8000815c:	00090513          	mv	a0,s2
    80008160:	03013903          	ld	s2,48(sp)
    80008164:	05010113          	addi	sp,sp,80
    80008168:	00008067          	ret
    8000816c:	00000913          	li	s2,0
    80008170:	fd5ff06f          	j	80008144 <consolewrite+0x74>

0000000080008174 <consoleread>:
    80008174:	f9010113          	addi	sp,sp,-112
    80008178:	06813023          	sd	s0,96(sp)
    8000817c:	04913c23          	sd	s1,88(sp)
    80008180:	05213823          	sd	s2,80(sp)
    80008184:	05313423          	sd	s3,72(sp)
    80008188:	05413023          	sd	s4,64(sp)
    8000818c:	03513c23          	sd	s5,56(sp)
    80008190:	03613823          	sd	s6,48(sp)
    80008194:	03713423          	sd	s7,40(sp)
    80008198:	03813023          	sd	s8,32(sp)
    8000819c:	06113423          	sd	ra,104(sp)
    800081a0:	01913c23          	sd	s9,24(sp)
    800081a4:	07010413          	addi	s0,sp,112
    800081a8:	00060b93          	mv	s7,a2
    800081ac:	00050913          	mv	s2,a0
    800081b0:	00058c13          	mv	s8,a1
    800081b4:	00060b1b          	sext.w	s6,a2
    800081b8:	00006497          	auipc	s1,0x6
    800081bc:	07048493          	addi	s1,s1,112 # 8000e228 <cons>
    800081c0:	00400993          	li	s3,4
    800081c4:	fff00a13          	li	s4,-1
    800081c8:	00a00a93          	li	s5,10
    800081cc:	05705e63          	blez	s7,80008228 <consoleread+0xb4>
    800081d0:	09c4a703          	lw	a4,156(s1)
    800081d4:	0984a783          	lw	a5,152(s1)
    800081d8:	0007071b          	sext.w	a4,a4
    800081dc:	08e78463          	beq	a5,a4,80008264 <consoleread+0xf0>
    800081e0:	07f7f713          	andi	a4,a5,127
    800081e4:	00e48733          	add	a4,s1,a4
    800081e8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800081ec:	0017869b          	addiw	a3,a5,1
    800081f0:	08d4ac23          	sw	a3,152(s1)
    800081f4:	00070c9b          	sext.w	s9,a4
    800081f8:	0b370663          	beq	a4,s3,800082a4 <consoleread+0x130>
    800081fc:	00100693          	li	a3,1
    80008200:	f9f40613          	addi	a2,s0,-97
    80008204:	000c0593          	mv	a1,s8
    80008208:	00090513          	mv	a0,s2
    8000820c:	f8e40fa3          	sb	a4,-97(s0)
    80008210:	00000097          	auipc	ra,0x0
    80008214:	8bc080e7          	jalr	-1860(ra) # 80007acc <either_copyout>
    80008218:	01450863          	beq	a0,s4,80008228 <consoleread+0xb4>
    8000821c:	001c0c13          	addi	s8,s8,1
    80008220:	fffb8b9b          	addiw	s7,s7,-1
    80008224:	fb5c94e3          	bne	s9,s5,800081cc <consoleread+0x58>
    80008228:	000b851b          	sext.w	a0,s7
    8000822c:	06813083          	ld	ra,104(sp)
    80008230:	06013403          	ld	s0,96(sp)
    80008234:	05813483          	ld	s1,88(sp)
    80008238:	05013903          	ld	s2,80(sp)
    8000823c:	04813983          	ld	s3,72(sp)
    80008240:	04013a03          	ld	s4,64(sp)
    80008244:	03813a83          	ld	s5,56(sp)
    80008248:	02813b83          	ld	s7,40(sp)
    8000824c:	02013c03          	ld	s8,32(sp)
    80008250:	01813c83          	ld	s9,24(sp)
    80008254:	40ab053b          	subw	a0,s6,a0
    80008258:	03013b03          	ld	s6,48(sp)
    8000825c:	07010113          	addi	sp,sp,112
    80008260:	00008067          	ret
    80008264:	00001097          	auipc	ra,0x1
    80008268:	1d8080e7          	jalr	472(ra) # 8000943c <push_on>
    8000826c:	0984a703          	lw	a4,152(s1)
    80008270:	09c4a783          	lw	a5,156(s1)
    80008274:	0007879b          	sext.w	a5,a5
    80008278:	fef70ce3          	beq	a4,a5,80008270 <consoleread+0xfc>
    8000827c:	00001097          	auipc	ra,0x1
    80008280:	234080e7          	jalr	564(ra) # 800094b0 <pop_on>
    80008284:	0984a783          	lw	a5,152(s1)
    80008288:	07f7f713          	andi	a4,a5,127
    8000828c:	00e48733          	add	a4,s1,a4
    80008290:	01874703          	lbu	a4,24(a4)
    80008294:	0017869b          	addiw	a3,a5,1
    80008298:	08d4ac23          	sw	a3,152(s1)
    8000829c:	00070c9b          	sext.w	s9,a4
    800082a0:	f5371ee3          	bne	a4,s3,800081fc <consoleread+0x88>
    800082a4:	000b851b          	sext.w	a0,s7
    800082a8:	f96bf2e3          	bgeu	s7,s6,8000822c <consoleread+0xb8>
    800082ac:	08f4ac23          	sw	a5,152(s1)
    800082b0:	f7dff06f          	j	8000822c <consoleread+0xb8>

00000000800082b4 <consputc>:
    800082b4:	10000793          	li	a5,256
    800082b8:	00f50663          	beq	a0,a5,800082c4 <consputc+0x10>
    800082bc:	00001317          	auipc	t1,0x1
    800082c0:	9f430067          	jr	-1548(t1) # 80008cb0 <uartputc_sync>
    800082c4:	ff010113          	addi	sp,sp,-16
    800082c8:	00113423          	sd	ra,8(sp)
    800082cc:	00813023          	sd	s0,0(sp)
    800082d0:	01010413          	addi	s0,sp,16
    800082d4:	00800513          	li	a0,8
    800082d8:	00001097          	auipc	ra,0x1
    800082dc:	9d8080e7          	jalr	-1576(ra) # 80008cb0 <uartputc_sync>
    800082e0:	02000513          	li	a0,32
    800082e4:	00001097          	auipc	ra,0x1
    800082e8:	9cc080e7          	jalr	-1588(ra) # 80008cb0 <uartputc_sync>
    800082ec:	00013403          	ld	s0,0(sp)
    800082f0:	00813083          	ld	ra,8(sp)
    800082f4:	00800513          	li	a0,8
    800082f8:	01010113          	addi	sp,sp,16
    800082fc:	00001317          	auipc	t1,0x1
    80008300:	9b430067          	jr	-1612(t1) # 80008cb0 <uartputc_sync>

0000000080008304 <consoleintr>:
    80008304:	fe010113          	addi	sp,sp,-32
    80008308:	00813823          	sd	s0,16(sp)
    8000830c:	00913423          	sd	s1,8(sp)
    80008310:	01213023          	sd	s2,0(sp)
    80008314:	00113c23          	sd	ra,24(sp)
    80008318:	02010413          	addi	s0,sp,32
    8000831c:	00006917          	auipc	s2,0x6
    80008320:	f0c90913          	addi	s2,s2,-244 # 8000e228 <cons>
    80008324:	00050493          	mv	s1,a0
    80008328:	00090513          	mv	a0,s2
    8000832c:	00001097          	auipc	ra,0x1
    80008330:	e40080e7          	jalr	-448(ra) # 8000916c <acquire>
    80008334:	02048c63          	beqz	s1,8000836c <consoleintr+0x68>
    80008338:	0a092783          	lw	a5,160(s2)
    8000833c:	09892703          	lw	a4,152(s2)
    80008340:	07f00693          	li	a3,127
    80008344:	40e7873b          	subw	a4,a5,a4
    80008348:	02e6e263          	bltu	a3,a4,8000836c <consoleintr+0x68>
    8000834c:	00d00713          	li	a4,13
    80008350:	04e48063          	beq	s1,a4,80008390 <consoleintr+0x8c>
    80008354:	07f7f713          	andi	a4,a5,127
    80008358:	00e90733          	add	a4,s2,a4
    8000835c:	0017879b          	addiw	a5,a5,1
    80008360:	0af92023          	sw	a5,160(s2)
    80008364:	00970c23          	sb	s1,24(a4)
    80008368:	08f92e23          	sw	a5,156(s2)
    8000836c:	01013403          	ld	s0,16(sp)
    80008370:	01813083          	ld	ra,24(sp)
    80008374:	00813483          	ld	s1,8(sp)
    80008378:	00013903          	ld	s2,0(sp)
    8000837c:	00006517          	auipc	a0,0x6
    80008380:	eac50513          	addi	a0,a0,-340 # 8000e228 <cons>
    80008384:	02010113          	addi	sp,sp,32
    80008388:	00001317          	auipc	t1,0x1
    8000838c:	eb030067          	jr	-336(t1) # 80009238 <release>
    80008390:	00a00493          	li	s1,10
    80008394:	fc1ff06f          	j	80008354 <consoleintr+0x50>

0000000080008398 <consoleinit>:
    80008398:	fe010113          	addi	sp,sp,-32
    8000839c:	00113c23          	sd	ra,24(sp)
    800083a0:	00813823          	sd	s0,16(sp)
    800083a4:	00913423          	sd	s1,8(sp)
    800083a8:	02010413          	addi	s0,sp,32
    800083ac:	00006497          	auipc	s1,0x6
    800083b0:	e7c48493          	addi	s1,s1,-388 # 8000e228 <cons>
    800083b4:	00048513          	mv	a0,s1
    800083b8:	00002597          	auipc	a1,0x2
    800083bc:	4e058593          	addi	a1,a1,1248 # 8000a898 <CONSOLE_STATUS+0x888>
    800083c0:	00001097          	auipc	ra,0x1
    800083c4:	d88080e7          	jalr	-632(ra) # 80009148 <initlock>
    800083c8:	00000097          	auipc	ra,0x0
    800083cc:	7ac080e7          	jalr	1964(ra) # 80008b74 <uartinit>
    800083d0:	01813083          	ld	ra,24(sp)
    800083d4:	01013403          	ld	s0,16(sp)
    800083d8:	00000797          	auipc	a5,0x0
    800083dc:	d9c78793          	addi	a5,a5,-612 # 80008174 <consoleread>
    800083e0:	0af4bc23          	sd	a5,184(s1)
    800083e4:	00000797          	auipc	a5,0x0
    800083e8:	cec78793          	addi	a5,a5,-788 # 800080d0 <consolewrite>
    800083ec:	0cf4b023          	sd	a5,192(s1)
    800083f0:	00813483          	ld	s1,8(sp)
    800083f4:	02010113          	addi	sp,sp,32
    800083f8:	00008067          	ret

00000000800083fc <console_read>:
    800083fc:	ff010113          	addi	sp,sp,-16
    80008400:	00813423          	sd	s0,8(sp)
    80008404:	01010413          	addi	s0,sp,16
    80008408:	00813403          	ld	s0,8(sp)
    8000840c:	00006317          	auipc	t1,0x6
    80008410:	ed433303          	ld	t1,-300(t1) # 8000e2e0 <devsw+0x10>
    80008414:	01010113          	addi	sp,sp,16
    80008418:	00030067          	jr	t1

000000008000841c <console_write>:
    8000841c:	ff010113          	addi	sp,sp,-16
    80008420:	00813423          	sd	s0,8(sp)
    80008424:	01010413          	addi	s0,sp,16
    80008428:	00813403          	ld	s0,8(sp)
    8000842c:	00006317          	auipc	t1,0x6
    80008430:	ebc33303          	ld	t1,-324(t1) # 8000e2e8 <devsw+0x18>
    80008434:	01010113          	addi	sp,sp,16
    80008438:	00030067          	jr	t1

000000008000843c <panic>:
    8000843c:	fe010113          	addi	sp,sp,-32
    80008440:	00113c23          	sd	ra,24(sp)
    80008444:	00813823          	sd	s0,16(sp)
    80008448:	00913423          	sd	s1,8(sp)
    8000844c:	02010413          	addi	s0,sp,32
    80008450:	00050493          	mv	s1,a0
    80008454:	00002517          	auipc	a0,0x2
    80008458:	44c50513          	addi	a0,a0,1100 # 8000a8a0 <CONSOLE_STATUS+0x890>
    8000845c:	00006797          	auipc	a5,0x6
    80008460:	f207a623          	sw	zero,-212(a5) # 8000e388 <pr+0x18>
    80008464:	00000097          	auipc	ra,0x0
    80008468:	034080e7          	jalr	52(ra) # 80008498 <__printf>
    8000846c:	00048513          	mv	a0,s1
    80008470:	00000097          	auipc	ra,0x0
    80008474:	028080e7          	jalr	40(ra) # 80008498 <__printf>
    80008478:	00002517          	auipc	a0,0x2
    8000847c:	1b050513          	addi	a0,a0,432 # 8000a628 <CONSOLE_STATUS+0x618>
    80008480:	00000097          	auipc	ra,0x0
    80008484:	018080e7          	jalr	24(ra) # 80008498 <__printf>
    80008488:	00100793          	li	a5,1
    8000848c:	00005717          	auipc	a4,0x5
    80008490:	b0f72e23          	sw	a5,-1252(a4) # 8000cfa8 <panicked>
    80008494:	0000006f          	j	80008494 <panic+0x58>

0000000080008498 <__printf>:
    80008498:	f3010113          	addi	sp,sp,-208
    8000849c:	08813023          	sd	s0,128(sp)
    800084a0:	07313423          	sd	s3,104(sp)
    800084a4:	09010413          	addi	s0,sp,144
    800084a8:	05813023          	sd	s8,64(sp)
    800084ac:	08113423          	sd	ra,136(sp)
    800084b0:	06913c23          	sd	s1,120(sp)
    800084b4:	07213823          	sd	s2,112(sp)
    800084b8:	07413023          	sd	s4,96(sp)
    800084bc:	05513c23          	sd	s5,88(sp)
    800084c0:	05613823          	sd	s6,80(sp)
    800084c4:	05713423          	sd	s7,72(sp)
    800084c8:	03913c23          	sd	s9,56(sp)
    800084cc:	03a13823          	sd	s10,48(sp)
    800084d0:	03b13423          	sd	s11,40(sp)
    800084d4:	00006317          	auipc	t1,0x6
    800084d8:	e9c30313          	addi	t1,t1,-356 # 8000e370 <pr>
    800084dc:	01832c03          	lw	s8,24(t1)
    800084e0:	00b43423          	sd	a1,8(s0)
    800084e4:	00c43823          	sd	a2,16(s0)
    800084e8:	00d43c23          	sd	a3,24(s0)
    800084ec:	02e43023          	sd	a4,32(s0)
    800084f0:	02f43423          	sd	a5,40(s0)
    800084f4:	03043823          	sd	a6,48(s0)
    800084f8:	03143c23          	sd	a7,56(s0)
    800084fc:	00050993          	mv	s3,a0
    80008500:	4a0c1663          	bnez	s8,800089ac <__printf+0x514>
    80008504:	60098c63          	beqz	s3,80008b1c <__printf+0x684>
    80008508:	0009c503          	lbu	a0,0(s3)
    8000850c:	00840793          	addi	a5,s0,8
    80008510:	f6f43c23          	sd	a5,-136(s0)
    80008514:	00000493          	li	s1,0
    80008518:	22050063          	beqz	a0,80008738 <__printf+0x2a0>
    8000851c:	00002a37          	lui	s4,0x2
    80008520:	00018ab7          	lui	s5,0x18
    80008524:	000f4b37          	lui	s6,0xf4
    80008528:	00989bb7          	lui	s7,0x989
    8000852c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80008530:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80008534:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80008538:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000853c:	00148c9b          	addiw	s9,s1,1
    80008540:	02500793          	li	a5,37
    80008544:	01998933          	add	s2,s3,s9
    80008548:	38f51263          	bne	a0,a5,800088cc <__printf+0x434>
    8000854c:	00094783          	lbu	a5,0(s2)
    80008550:	00078c9b          	sext.w	s9,a5
    80008554:	1e078263          	beqz	a5,80008738 <__printf+0x2a0>
    80008558:	0024849b          	addiw	s1,s1,2
    8000855c:	07000713          	li	a4,112
    80008560:	00998933          	add	s2,s3,s1
    80008564:	38e78a63          	beq	a5,a4,800088f8 <__printf+0x460>
    80008568:	20f76863          	bltu	a4,a5,80008778 <__printf+0x2e0>
    8000856c:	42a78863          	beq	a5,a0,8000899c <__printf+0x504>
    80008570:	06400713          	li	a4,100
    80008574:	40e79663          	bne	a5,a4,80008980 <__printf+0x4e8>
    80008578:	f7843783          	ld	a5,-136(s0)
    8000857c:	0007a603          	lw	a2,0(a5)
    80008580:	00878793          	addi	a5,a5,8
    80008584:	f6f43c23          	sd	a5,-136(s0)
    80008588:	42064a63          	bltz	a2,800089bc <__printf+0x524>
    8000858c:	00a00713          	li	a4,10
    80008590:	02e677bb          	remuw	a5,a2,a4
    80008594:	00002d97          	auipc	s11,0x2
    80008598:	334d8d93          	addi	s11,s11,820 # 8000a8c8 <digits>
    8000859c:	00900593          	li	a1,9
    800085a0:	0006051b          	sext.w	a0,a2
    800085a4:	00000c93          	li	s9,0
    800085a8:	02079793          	slli	a5,a5,0x20
    800085ac:	0207d793          	srli	a5,a5,0x20
    800085b0:	00fd87b3          	add	a5,s11,a5
    800085b4:	0007c783          	lbu	a5,0(a5)
    800085b8:	02e656bb          	divuw	a3,a2,a4
    800085bc:	f8f40023          	sb	a5,-128(s0)
    800085c0:	14c5d863          	bge	a1,a2,80008710 <__printf+0x278>
    800085c4:	06300593          	li	a1,99
    800085c8:	00100c93          	li	s9,1
    800085cc:	02e6f7bb          	remuw	a5,a3,a4
    800085d0:	02079793          	slli	a5,a5,0x20
    800085d4:	0207d793          	srli	a5,a5,0x20
    800085d8:	00fd87b3          	add	a5,s11,a5
    800085dc:	0007c783          	lbu	a5,0(a5)
    800085e0:	02e6d73b          	divuw	a4,a3,a4
    800085e4:	f8f400a3          	sb	a5,-127(s0)
    800085e8:	12a5f463          	bgeu	a1,a0,80008710 <__printf+0x278>
    800085ec:	00a00693          	li	a3,10
    800085f0:	00900593          	li	a1,9
    800085f4:	02d777bb          	remuw	a5,a4,a3
    800085f8:	02079793          	slli	a5,a5,0x20
    800085fc:	0207d793          	srli	a5,a5,0x20
    80008600:	00fd87b3          	add	a5,s11,a5
    80008604:	0007c503          	lbu	a0,0(a5)
    80008608:	02d757bb          	divuw	a5,a4,a3
    8000860c:	f8a40123          	sb	a0,-126(s0)
    80008610:	48e5f263          	bgeu	a1,a4,80008a94 <__printf+0x5fc>
    80008614:	06300513          	li	a0,99
    80008618:	02d7f5bb          	remuw	a1,a5,a3
    8000861c:	02059593          	slli	a1,a1,0x20
    80008620:	0205d593          	srli	a1,a1,0x20
    80008624:	00bd85b3          	add	a1,s11,a1
    80008628:	0005c583          	lbu	a1,0(a1)
    8000862c:	02d7d7bb          	divuw	a5,a5,a3
    80008630:	f8b401a3          	sb	a1,-125(s0)
    80008634:	48e57263          	bgeu	a0,a4,80008ab8 <__printf+0x620>
    80008638:	3e700513          	li	a0,999
    8000863c:	02d7f5bb          	remuw	a1,a5,a3
    80008640:	02059593          	slli	a1,a1,0x20
    80008644:	0205d593          	srli	a1,a1,0x20
    80008648:	00bd85b3          	add	a1,s11,a1
    8000864c:	0005c583          	lbu	a1,0(a1)
    80008650:	02d7d7bb          	divuw	a5,a5,a3
    80008654:	f8b40223          	sb	a1,-124(s0)
    80008658:	46e57663          	bgeu	a0,a4,80008ac4 <__printf+0x62c>
    8000865c:	02d7f5bb          	remuw	a1,a5,a3
    80008660:	02059593          	slli	a1,a1,0x20
    80008664:	0205d593          	srli	a1,a1,0x20
    80008668:	00bd85b3          	add	a1,s11,a1
    8000866c:	0005c583          	lbu	a1,0(a1)
    80008670:	02d7d7bb          	divuw	a5,a5,a3
    80008674:	f8b402a3          	sb	a1,-123(s0)
    80008678:	46ea7863          	bgeu	s4,a4,80008ae8 <__printf+0x650>
    8000867c:	02d7f5bb          	remuw	a1,a5,a3
    80008680:	02059593          	slli	a1,a1,0x20
    80008684:	0205d593          	srli	a1,a1,0x20
    80008688:	00bd85b3          	add	a1,s11,a1
    8000868c:	0005c583          	lbu	a1,0(a1)
    80008690:	02d7d7bb          	divuw	a5,a5,a3
    80008694:	f8b40323          	sb	a1,-122(s0)
    80008698:	3eeaf863          	bgeu	s5,a4,80008a88 <__printf+0x5f0>
    8000869c:	02d7f5bb          	remuw	a1,a5,a3
    800086a0:	02059593          	slli	a1,a1,0x20
    800086a4:	0205d593          	srli	a1,a1,0x20
    800086a8:	00bd85b3          	add	a1,s11,a1
    800086ac:	0005c583          	lbu	a1,0(a1)
    800086b0:	02d7d7bb          	divuw	a5,a5,a3
    800086b4:	f8b403a3          	sb	a1,-121(s0)
    800086b8:	42eb7e63          	bgeu	s6,a4,80008af4 <__printf+0x65c>
    800086bc:	02d7f5bb          	remuw	a1,a5,a3
    800086c0:	02059593          	slli	a1,a1,0x20
    800086c4:	0205d593          	srli	a1,a1,0x20
    800086c8:	00bd85b3          	add	a1,s11,a1
    800086cc:	0005c583          	lbu	a1,0(a1)
    800086d0:	02d7d7bb          	divuw	a5,a5,a3
    800086d4:	f8b40423          	sb	a1,-120(s0)
    800086d8:	42ebfc63          	bgeu	s7,a4,80008b10 <__printf+0x678>
    800086dc:	02079793          	slli	a5,a5,0x20
    800086e0:	0207d793          	srli	a5,a5,0x20
    800086e4:	00fd8db3          	add	s11,s11,a5
    800086e8:	000dc703          	lbu	a4,0(s11)
    800086ec:	00a00793          	li	a5,10
    800086f0:	00900c93          	li	s9,9
    800086f4:	f8e404a3          	sb	a4,-119(s0)
    800086f8:	00065c63          	bgez	a2,80008710 <__printf+0x278>
    800086fc:	f9040713          	addi	a4,s0,-112
    80008700:	00f70733          	add	a4,a4,a5
    80008704:	02d00693          	li	a3,45
    80008708:	fed70823          	sb	a3,-16(a4)
    8000870c:	00078c93          	mv	s9,a5
    80008710:	f8040793          	addi	a5,s0,-128
    80008714:	01978cb3          	add	s9,a5,s9
    80008718:	f7f40d13          	addi	s10,s0,-129
    8000871c:	000cc503          	lbu	a0,0(s9)
    80008720:	fffc8c93          	addi	s9,s9,-1
    80008724:	00000097          	auipc	ra,0x0
    80008728:	b90080e7          	jalr	-1136(ra) # 800082b4 <consputc>
    8000872c:	ffac98e3          	bne	s9,s10,8000871c <__printf+0x284>
    80008730:	00094503          	lbu	a0,0(s2)
    80008734:	e00514e3          	bnez	a0,8000853c <__printf+0xa4>
    80008738:	1a0c1663          	bnez	s8,800088e4 <__printf+0x44c>
    8000873c:	08813083          	ld	ra,136(sp)
    80008740:	08013403          	ld	s0,128(sp)
    80008744:	07813483          	ld	s1,120(sp)
    80008748:	07013903          	ld	s2,112(sp)
    8000874c:	06813983          	ld	s3,104(sp)
    80008750:	06013a03          	ld	s4,96(sp)
    80008754:	05813a83          	ld	s5,88(sp)
    80008758:	05013b03          	ld	s6,80(sp)
    8000875c:	04813b83          	ld	s7,72(sp)
    80008760:	04013c03          	ld	s8,64(sp)
    80008764:	03813c83          	ld	s9,56(sp)
    80008768:	03013d03          	ld	s10,48(sp)
    8000876c:	02813d83          	ld	s11,40(sp)
    80008770:	0d010113          	addi	sp,sp,208
    80008774:	00008067          	ret
    80008778:	07300713          	li	a4,115
    8000877c:	1ce78a63          	beq	a5,a4,80008950 <__printf+0x4b8>
    80008780:	07800713          	li	a4,120
    80008784:	1ee79e63          	bne	a5,a4,80008980 <__printf+0x4e8>
    80008788:	f7843783          	ld	a5,-136(s0)
    8000878c:	0007a703          	lw	a4,0(a5)
    80008790:	00878793          	addi	a5,a5,8
    80008794:	f6f43c23          	sd	a5,-136(s0)
    80008798:	28074263          	bltz	a4,80008a1c <__printf+0x584>
    8000879c:	00002d97          	auipc	s11,0x2
    800087a0:	12cd8d93          	addi	s11,s11,300 # 8000a8c8 <digits>
    800087a4:	00f77793          	andi	a5,a4,15
    800087a8:	00fd87b3          	add	a5,s11,a5
    800087ac:	0007c683          	lbu	a3,0(a5)
    800087b0:	00f00613          	li	a2,15
    800087b4:	0007079b          	sext.w	a5,a4
    800087b8:	f8d40023          	sb	a3,-128(s0)
    800087bc:	0047559b          	srliw	a1,a4,0x4
    800087c0:	0047569b          	srliw	a3,a4,0x4
    800087c4:	00000c93          	li	s9,0
    800087c8:	0ee65063          	bge	a2,a4,800088a8 <__printf+0x410>
    800087cc:	00f6f693          	andi	a3,a3,15
    800087d0:	00dd86b3          	add	a3,s11,a3
    800087d4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800087d8:	0087d79b          	srliw	a5,a5,0x8
    800087dc:	00100c93          	li	s9,1
    800087e0:	f8d400a3          	sb	a3,-127(s0)
    800087e4:	0cb67263          	bgeu	a2,a1,800088a8 <__printf+0x410>
    800087e8:	00f7f693          	andi	a3,a5,15
    800087ec:	00dd86b3          	add	a3,s11,a3
    800087f0:	0006c583          	lbu	a1,0(a3)
    800087f4:	00f00613          	li	a2,15
    800087f8:	0047d69b          	srliw	a3,a5,0x4
    800087fc:	f8b40123          	sb	a1,-126(s0)
    80008800:	0047d593          	srli	a1,a5,0x4
    80008804:	28f67e63          	bgeu	a2,a5,80008aa0 <__printf+0x608>
    80008808:	00f6f693          	andi	a3,a3,15
    8000880c:	00dd86b3          	add	a3,s11,a3
    80008810:	0006c503          	lbu	a0,0(a3)
    80008814:	0087d813          	srli	a6,a5,0x8
    80008818:	0087d69b          	srliw	a3,a5,0x8
    8000881c:	f8a401a3          	sb	a0,-125(s0)
    80008820:	28b67663          	bgeu	a2,a1,80008aac <__printf+0x614>
    80008824:	00f6f693          	andi	a3,a3,15
    80008828:	00dd86b3          	add	a3,s11,a3
    8000882c:	0006c583          	lbu	a1,0(a3)
    80008830:	00c7d513          	srli	a0,a5,0xc
    80008834:	00c7d69b          	srliw	a3,a5,0xc
    80008838:	f8b40223          	sb	a1,-124(s0)
    8000883c:	29067a63          	bgeu	a2,a6,80008ad0 <__printf+0x638>
    80008840:	00f6f693          	andi	a3,a3,15
    80008844:	00dd86b3          	add	a3,s11,a3
    80008848:	0006c583          	lbu	a1,0(a3)
    8000884c:	0107d813          	srli	a6,a5,0x10
    80008850:	0107d69b          	srliw	a3,a5,0x10
    80008854:	f8b402a3          	sb	a1,-123(s0)
    80008858:	28a67263          	bgeu	a2,a0,80008adc <__printf+0x644>
    8000885c:	00f6f693          	andi	a3,a3,15
    80008860:	00dd86b3          	add	a3,s11,a3
    80008864:	0006c683          	lbu	a3,0(a3)
    80008868:	0147d79b          	srliw	a5,a5,0x14
    8000886c:	f8d40323          	sb	a3,-122(s0)
    80008870:	21067663          	bgeu	a2,a6,80008a7c <__printf+0x5e4>
    80008874:	02079793          	slli	a5,a5,0x20
    80008878:	0207d793          	srli	a5,a5,0x20
    8000887c:	00fd8db3          	add	s11,s11,a5
    80008880:	000dc683          	lbu	a3,0(s11)
    80008884:	00800793          	li	a5,8
    80008888:	00700c93          	li	s9,7
    8000888c:	f8d403a3          	sb	a3,-121(s0)
    80008890:	00075c63          	bgez	a4,800088a8 <__printf+0x410>
    80008894:	f9040713          	addi	a4,s0,-112
    80008898:	00f70733          	add	a4,a4,a5
    8000889c:	02d00693          	li	a3,45
    800088a0:	fed70823          	sb	a3,-16(a4)
    800088a4:	00078c93          	mv	s9,a5
    800088a8:	f8040793          	addi	a5,s0,-128
    800088ac:	01978cb3          	add	s9,a5,s9
    800088b0:	f7f40d13          	addi	s10,s0,-129
    800088b4:	000cc503          	lbu	a0,0(s9)
    800088b8:	fffc8c93          	addi	s9,s9,-1
    800088bc:	00000097          	auipc	ra,0x0
    800088c0:	9f8080e7          	jalr	-1544(ra) # 800082b4 <consputc>
    800088c4:	ff9d18e3          	bne	s10,s9,800088b4 <__printf+0x41c>
    800088c8:	0100006f          	j	800088d8 <__printf+0x440>
    800088cc:	00000097          	auipc	ra,0x0
    800088d0:	9e8080e7          	jalr	-1560(ra) # 800082b4 <consputc>
    800088d4:	000c8493          	mv	s1,s9
    800088d8:	00094503          	lbu	a0,0(s2)
    800088dc:	c60510e3          	bnez	a0,8000853c <__printf+0xa4>
    800088e0:	e40c0ee3          	beqz	s8,8000873c <__printf+0x2a4>
    800088e4:	00006517          	auipc	a0,0x6
    800088e8:	a8c50513          	addi	a0,a0,-1396 # 8000e370 <pr>
    800088ec:	00001097          	auipc	ra,0x1
    800088f0:	94c080e7          	jalr	-1716(ra) # 80009238 <release>
    800088f4:	e49ff06f          	j	8000873c <__printf+0x2a4>
    800088f8:	f7843783          	ld	a5,-136(s0)
    800088fc:	03000513          	li	a0,48
    80008900:	01000d13          	li	s10,16
    80008904:	00878713          	addi	a4,a5,8
    80008908:	0007bc83          	ld	s9,0(a5)
    8000890c:	f6e43c23          	sd	a4,-136(s0)
    80008910:	00000097          	auipc	ra,0x0
    80008914:	9a4080e7          	jalr	-1628(ra) # 800082b4 <consputc>
    80008918:	07800513          	li	a0,120
    8000891c:	00000097          	auipc	ra,0x0
    80008920:	998080e7          	jalr	-1640(ra) # 800082b4 <consputc>
    80008924:	00002d97          	auipc	s11,0x2
    80008928:	fa4d8d93          	addi	s11,s11,-92 # 8000a8c8 <digits>
    8000892c:	03ccd793          	srli	a5,s9,0x3c
    80008930:	00fd87b3          	add	a5,s11,a5
    80008934:	0007c503          	lbu	a0,0(a5)
    80008938:	fffd0d1b          	addiw	s10,s10,-1
    8000893c:	004c9c93          	slli	s9,s9,0x4
    80008940:	00000097          	auipc	ra,0x0
    80008944:	974080e7          	jalr	-1676(ra) # 800082b4 <consputc>
    80008948:	fe0d12e3          	bnez	s10,8000892c <__printf+0x494>
    8000894c:	f8dff06f          	j	800088d8 <__printf+0x440>
    80008950:	f7843783          	ld	a5,-136(s0)
    80008954:	0007bc83          	ld	s9,0(a5)
    80008958:	00878793          	addi	a5,a5,8
    8000895c:	f6f43c23          	sd	a5,-136(s0)
    80008960:	000c9a63          	bnez	s9,80008974 <__printf+0x4dc>
    80008964:	1080006f          	j	80008a6c <__printf+0x5d4>
    80008968:	001c8c93          	addi	s9,s9,1
    8000896c:	00000097          	auipc	ra,0x0
    80008970:	948080e7          	jalr	-1720(ra) # 800082b4 <consputc>
    80008974:	000cc503          	lbu	a0,0(s9)
    80008978:	fe0518e3          	bnez	a0,80008968 <__printf+0x4d0>
    8000897c:	f5dff06f          	j	800088d8 <__printf+0x440>
    80008980:	02500513          	li	a0,37
    80008984:	00000097          	auipc	ra,0x0
    80008988:	930080e7          	jalr	-1744(ra) # 800082b4 <consputc>
    8000898c:	000c8513          	mv	a0,s9
    80008990:	00000097          	auipc	ra,0x0
    80008994:	924080e7          	jalr	-1756(ra) # 800082b4 <consputc>
    80008998:	f41ff06f          	j	800088d8 <__printf+0x440>
    8000899c:	02500513          	li	a0,37
    800089a0:	00000097          	auipc	ra,0x0
    800089a4:	914080e7          	jalr	-1772(ra) # 800082b4 <consputc>
    800089a8:	f31ff06f          	j	800088d8 <__printf+0x440>
    800089ac:	00030513          	mv	a0,t1
    800089b0:	00000097          	auipc	ra,0x0
    800089b4:	7bc080e7          	jalr	1980(ra) # 8000916c <acquire>
    800089b8:	b4dff06f          	j	80008504 <__printf+0x6c>
    800089bc:	40c0053b          	negw	a0,a2
    800089c0:	00a00713          	li	a4,10
    800089c4:	02e576bb          	remuw	a3,a0,a4
    800089c8:	00002d97          	auipc	s11,0x2
    800089cc:	f00d8d93          	addi	s11,s11,-256 # 8000a8c8 <digits>
    800089d0:	ff700593          	li	a1,-9
    800089d4:	02069693          	slli	a3,a3,0x20
    800089d8:	0206d693          	srli	a3,a3,0x20
    800089dc:	00dd86b3          	add	a3,s11,a3
    800089e0:	0006c683          	lbu	a3,0(a3)
    800089e4:	02e557bb          	divuw	a5,a0,a4
    800089e8:	f8d40023          	sb	a3,-128(s0)
    800089ec:	10b65e63          	bge	a2,a1,80008b08 <__printf+0x670>
    800089f0:	06300593          	li	a1,99
    800089f4:	02e7f6bb          	remuw	a3,a5,a4
    800089f8:	02069693          	slli	a3,a3,0x20
    800089fc:	0206d693          	srli	a3,a3,0x20
    80008a00:	00dd86b3          	add	a3,s11,a3
    80008a04:	0006c683          	lbu	a3,0(a3)
    80008a08:	02e7d73b          	divuw	a4,a5,a4
    80008a0c:	00200793          	li	a5,2
    80008a10:	f8d400a3          	sb	a3,-127(s0)
    80008a14:	bca5ece3          	bltu	a1,a0,800085ec <__printf+0x154>
    80008a18:	ce5ff06f          	j	800086fc <__printf+0x264>
    80008a1c:	40e007bb          	negw	a5,a4
    80008a20:	00002d97          	auipc	s11,0x2
    80008a24:	ea8d8d93          	addi	s11,s11,-344 # 8000a8c8 <digits>
    80008a28:	00f7f693          	andi	a3,a5,15
    80008a2c:	00dd86b3          	add	a3,s11,a3
    80008a30:	0006c583          	lbu	a1,0(a3)
    80008a34:	ff100613          	li	a2,-15
    80008a38:	0047d69b          	srliw	a3,a5,0x4
    80008a3c:	f8b40023          	sb	a1,-128(s0)
    80008a40:	0047d59b          	srliw	a1,a5,0x4
    80008a44:	0ac75e63          	bge	a4,a2,80008b00 <__printf+0x668>
    80008a48:	00f6f693          	andi	a3,a3,15
    80008a4c:	00dd86b3          	add	a3,s11,a3
    80008a50:	0006c603          	lbu	a2,0(a3)
    80008a54:	00f00693          	li	a3,15
    80008a58:	0087d79b          	srliw	a5,a5,0x8
    80008a5c:	f8c400a3          	sb	a2,-127(s0)
    80008a60:	d8b6e4e3          	bltu	a3,a1,800087e8 <__printf+0x350>
    80008a64:	00200793          	li	a5,2
    80008a68:	e2dff06f          	j	80008894 <__printf+0x3fc>
    80008a6c:	00002c97          	auipc	s9,0x2
    80008a70:	e3cc8c93          	addi	s9,s9,-452 # 8000a8a8 <CONSOLE_STATUS+0x898>
    80008a74:	02800513          	li	a0,40
    80008a78:	ef1ff06f          	j	80008968 <__printf+0x4d0>
    80008a7c:	00700793          	li	a5,7
    80008a80:	00600c93          	li	s9,6
    80008a84:	e0dff06f          	j	80008890 <__printf+0x3f8>
    80008a88:	00700793          	li	a5,7
    80008a8c:	00600c93          	li	s9,6
    80008a90:	c69ff06f          	j	800086f8 <__printf+0x260>
    80008a94:	00300793          	li	a5,3
    80008a98:	00200c93          	li	s9,2
    80008a9c:	c5dff06f          	j	800086f8 <__printf+0x260>
    80008aa0:	00300793          	li	a5,3
    80008aa4:	00200c93          	li	s9,2
    80008aa8:	de9ff06f          	j	80008890 <__printf+0x3f8>
    80008aac:	00400793          	li	a5,4
    80008ab0:	00300c93          	li	s9,3
    80008ab4:	dddff06f          	j	80008890 <__printf+0x3f8>
    80008ab8:	00400793          	li	a5,4
    80008abc:	00300c93          	li	s9,3
    80008ac0:	c39ff06f          	j	800086f8 <__printf+0x260>
    80008ac4:	00500793          	li	a5,5
    80008ac8:	00400c93          	li	s9,4
    80008acc:	c2dff06f          	j	800086f8 <__printf+0x260>
    80008ad0:	00500793          	li	a5,5
    80008ad4:	00400c93          	li	s9,4
    80008ad8:	db9ff06f          	j	80008890 <__printf+0x3f8>
    80008adc:	00600793          	li	a5,6
    80008ae0:	00500c93          	li	s9,5
    80008ae4:	dadff06f          	j	80008890 <__printf+0x3f8>
    80008ae8:	00600793          	li	a5,6
    80008aec:	00500c93          	li	s9,5
    80008af0:	c09ff06f          	j	800086f8 <__printf+0x260>
    80008af4:	00800793          	li	a5,8
    80008af8:	00700c93          	li	s9,7
    80008afc:	bfdff06f          	j	800086f8 <__printf+0x260>
    80008b00:	00100793          	li	a5,1
    80008b04:	d91ff06f          	j	80008894 <__printf+0x3fc>
    80008b08:	00100793          	li	a5,1
    80008b0c:	bf1ff06f          	j	800086fc <__printf+0x264>
    80008b10:	00900793          	li	a5,9
    80008b14:	00800c93          	li	s9,8
    80008b18:	be1ff06f          	j	800086f8 <__printf+0x260>
    80008b1c:	00002517          	auipc	a0,0x2
    80008b20:	d9450513          	addi	a0,a0,-620 # 8000a8b0 <CONSOLE_STATUS+0x8a0>
    80008b24:	00000097          	auipc	ra,0x0
    80008b28:	918080e7          	jalr	-1768(ra) # 8000843c <panic>

0000000080008b2c <printfinit>:
    80008b2c:	fe010113          	addi	sp,sp,-32
    80008b30:	00813823          	sd	s0,16(sp)
    80008b34:	00913423          	sd	s1,8(sp)
    80008b38:	00113c23          	sd	ra,24(sp)
    80008b3c:	02010413          	addi	s0,sp,32
    80008b40:	00006497          	auipc	s1,0x6
    80008b44:	83048493          	addi	s1,s1,-2000 # 8000e370 <pr>
    80008b48:	00048513          	mv	a0,s1
    80008b4c:	00002597          	auipc	a1,0x2
    80008b50:	d7458593          	addi	a1,a1,-652 # 8000a8c0 <CONSOLE_STATUS+0x8b0>
    80008b54:	00000097          	auipc	ra,0x0
    80008b58:	5f4080e7          	jalr	1524(ra) # 80009148 <initlock>
    80008b5c:	01813083          	ld	ra,24(sp)
    80008b60:	01013403          	ld	s0,16(sp)
    80008b64:	0004ac23          	sw	zero,24(s1)
    80008b68:	00813483          	ld	s1,8(sp)
    80008b6c:	02010113          	addi	sp,sp,32
    80008b70:	00008067          	ret

0000000080008b74 <uartinit>:
    80008b74:	ff010113          	addi	sp,sp,-16
    80008b78:	00813423          	sd	s0,8(sp)
    80008b7c:	01010413          	addi	s0,sp,16
    80008b80:	100007b7          	lui	a5,0x10000
    80008b84:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008b88:	f8000713          	li	a4,-128
    80008b8c:	00e781a3          	sb	a4,3(a5)
    80008b90:	00300713          	li	a4,3
    80008b94:	00e78023          	sb	a4,0(a5)
    80008b98:	000780a3          	sb	zero,1(a5)
    80008b9c:	00e781a3          	sb	a4,3(a5)
    80008ba0:	00700693          	li	a3,7
    80008ba4:	00d78123          	sb	a3,2(a5)
    80008ba8:	00e780a3          	sb	a4,1(a5)
    80008bac:	00813403          	ld	s0,8(sp)
    80008bb0:	01010113          	addi	sp,sp,16
    80008bb4:	00008067          	ret

0000000080008bb8 <uartputc>:
    80008bb8:	00004797          	auipc	a5,0x4
    80008bbc:	3f07a783          	lw	a5,1008(a5) # 8000cfa8 <panicked>
    80008bc0:	00078463          	beqz	a5,80008bc8 <uartputc+0x10>
    80008bc4:	0000006f          	j	80008bc4 <uartputc+0xc>
    80008bc8:	fd010113          	addi	sp,sp,-48
    80008bcc:	02813023          	sd	s0,32(sp)
    80008bd0:	00913c23          	sd	s1,24(sp)
    80008bd4:	01213823          	sd	s2,16(sp)
    80008bd8:	01313423          	sd	s3,8(sp)
    80008bdc:	02113423          	sd	ra,40(sp)
    80008be0:	03010413          	addi	s0,sp,48
    80008be4:	00004917          	auipc	s2,0x4
    80008be8:	3cc90913          	addi	s2,s2,972 # 8000cfb0 <uart_tx_r>
    80008bec:	00093783          	ld	a5,0(s2)
    80008bf0:	00004497          	auipc	s1,0x4
    80008bf4:	3c848493          	addi	s1,s1,968 # 8000cfb8 <uart_tx_w>
    80008bf8:	0004b703          	ld	a4,0(s1)
    80008bfc:	02078693          	addi	a3,a5,32
    80008c00:	00050993          	mv	s3,a0
    80008c04:	02e69c63          	bne	a3,a4,80008c3c <uartputc+0x84>
    80008c08:	00001097          	auipc	ra,0x1
    80008c0c:	834080e7          	jalr	-1996(ra) # 8000943c <push_on>
    80008c10:	00093783          	ld	a5,0(s2)
    80008c14:	0004b703          	ld	a4,0(s1)
    80008c18:	02078793          	addi	a5,a5,32
    80008c1c:	00e79463          	bne	a5,a4,80008c24 <uartputc+0x6c>
    80008c20:	0000006f          	j	80008c20 <uartputc+0x68>
    80008c24:	00001097          	auipc	ra,0x1
    80008c28:	88c080e7          	jalr	-1908(ra) # 800094b0 <pop_on>
    80008c2c:	00093783          	ld	a5,0(s2)
    80008c30:	0004b703          	ld	a4,0(s1)
    80008c34:	02078693          	addi	a3,a5,32
    80008c38:	fce688e3          	beq	a3,a4,80008c08 <uartputc+0x50>
    80008c3c:	01f77693          	andi	a3,a4,31
    80008c40:	00005597          	auipc	a1,0x5
    80008c44:	75058593          	addi	a1,a1,1872 # 8000e390 <uart_tx_buf>
    80008c48:	00d586b3          	add	a3,a1,a3
    80008c4c:	00170713          	addi	a4,a4,1
    80008c50:	01368023          	sb	s3,0(a3)
    80008c54:	00e4b023          	sd	a4,0(s1)
    80008c58:	10000637          	lui	a2,0x10000
    80008c5c:	02f71063          	bne	a4,a5,80008c7c <uartputc+0xc4>
    80008c60:	0340006f          	j	80008c94 <uartputc+0xdc>
    80008c64:	00074703          	lbu	a4,0(a4)
    80008c68:	00f93023          	sd	a5,0(s2)
    80008c6c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008c70:	00093783          	ld	a5,0(s2)
    80008c74:	0004b703          	ld	a4,0(s1)
    80008c78:	00f70e63          	beq	a4,a5,80008c94 <uartputc+0xdc>
    80008c7c:	00564683          	lbu	a3,5(a2)
    80008c80:	01f7f713          	andi	a4,a5,31
    80008c84:	00e58733          	add	a4,a1,a4
    80008c88:	0206f693          	andi	a3,a3,32
    80008c8c:	00178793          	addi	a5,a5,1
    80008c90:	fc069ae3          	bnez	a3,80008c64 <uartputc+0xac>
    80008c94:	02813083          	ld	ra,40(sp)
    80008c98:	02013403          	ld	s0,32(sp)
    80008c9c:	01813483          	ld	s1,24(sp)
    80008ca0:	01013903          	ld	s2,16(sp)
    80008ca4:	00813983          	ld	s3,8(sp)
    80008ca8:	03010113          	addi	sp,sp,48
    80008cac:	00008067          	ret

0000000080008cb0 <uartputc_sync>:
    80008cb0:	ff010113          	addi	sp,sp,-16
    80008cb4:	00813423          	sd	s0,8(sp)
    80008cb8:	01010413          	addi	s0,sp,16
    80008cbc:	00004717          	auipc	a4,0x4
    80008cc0:	2ec72703          	lw	a4,748(a4) # 8000cfa8 <panicked>
    80008cc4:	02071663          	bnez	a4,80008cf0 <uartputc_sync+0x40>
    80008cc8:	00050793          	mv	a5,a0
    80008ccc:	100006b7          	lui	a3,0x10000
    80008cd0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008cd4:	02077713          	andi	a4,a4,32
    80008cd8:	fe070ce3          	beqz	a4,80008cd0 <uartputc_sync+0x20>
    80008cdc:	0ff7f793          	andi	a5,a5,255
    80008ce0:	00f68023          	sb	a5,0(a3)
    80008ce4:	00813403          	ld	s0,8(sp)
    80008ce8:	01010113          	addi	sp,sp,16
    80008cec:	00008067          	ret
    80008cf0:	0000006f          	j	80008cf0 <uartputc_sync+0x40>

0000000080008cf4 <uartstart>:
    80008cf4:	ff010113          	addi	sp,sp,-16
    80008cf8:	00813423          	sd	s0,8(sp)
    80008cfc:	01010413          	addi	s0,sp,16
    80008d00:	00004617          	auipc	a2,0x4
    80008d04:	2b060613          	addi	a2,a2,688 # 8000cfb0 <uart_tx_r>
    80008d08:	00004517          	auipc	a0,0x4
    80008d0c:	2b050513          	addi	a0,a0,688 # 8000cfb8 <uart_tx_w>
    80008d10:	00063783          	ld	a5,0(a2)
    80008d14:	00053703          	ld	a4,0(a0)
    80008d18:	04f70263          	beq	a4,a5,80008d5c <uartstart+0x68>
    80008d1c:	100005b7          	lui	a1,0x10000
    80008d20:	00005817          	auipc	a6,0x5
    80008d24:	67080813          	addi	a6,a6,1648 # 8000e390 <uart_tx_buf>
    80008d28:	01c0006f          	j	80008d44 <uartstart+0x50>
    80008d2c:	0006c703          	lbu	a4,0(a3)
    80008d30:	00f63023          	sd	a5,0(a2)
    80008d34:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008d38:	00063783          	ld	a5,0(a2)
    80008d3c:	00053703          	ld	a4,0(a0)
    80008d40:	00f70e63          	beq	a4,a5,80008d5c <uartstart+0x68>
    80008d44:	01f7f713          	andi	a4,a5,31
    80008d48:	00e806b3          	add	a3,a6,a4
    80008d4c:	0055c703          	lbu	a4,5(a1)
    80008d50:	00178793          	addi	a5,a5,1
    80008d54:	02077713          	andi	a4,a4,32
    80008d58:	fc071ae3          	bnez	a4,80008d2c <uartstart+0x38>
    80008d5c:	00813403          	ld	s0,8(sp)
    80008d60:	01010113          	addi	sp,sp,16
    80008d64:	00008067          	ret

0000000080008d68 <uartgetc>:
    80008d68:	ff010113          	addi	sp,sp,-16
    80008d6c:	00813423          	sd	s0,8(sp)
    80008d70:	01010413          	addi	s0,sp,16
    80008d74:	10000737          	lui	a4,0x10000
    80008d78:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80008d7c:	0017f793          	andi	a5,a5,1
    80008d80:	00078c63          	beqz	a5,80008d98 <uartgetc+0x30>
    80008d84:	00074503          	lbu	a0,0(a4)
    80008d88:	0ff57513          	andi	a0,a0,255
    80008d8c:	00813403          	ld	s0,8(sp)
    80008d90:	01010113          	addi	sp,sp,16
    80008d94:	00008067          	ret
    80008d98:	fff00513          	li	a0,-1
    80008d9c:	ff1ff06f          	j	80008d8c <uartgetc+0x24>

0000000080008da0 <uartintr>:
    80008da0:	100007b7          	lui	a5,0x10000
    80008da4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008da8:	0017f793          	andi	a5,a5,1
    80008dac:	0a078463          	beqz	a5,80008e54 <uartintr+0xb4>
    80008db0:	fe010113          	addi	sp,sp,-32
    80008db4:	00813823          	sd	s0,16(sp)
    80008db8:	00913423          	sd	s1,8(sp)
    80008dbc:	00113c23          	sd	ra,24(sp)
    80008dc0:	02010413          	addi	s0,sp,32
    80008dc4:	100004b7          	lui	s1,0x10000
    80008dc8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80008dcc:	0ff57513          	andi	a0,a0,255
    80008dd0:	fffff097          	auipc	ra,0xfffff
    80008dd4:	534080e7          	jalr	1332(ra) # 80008304 <consoleintr>
    80008dd8:	0054c783          	lbu	a5,5(s1)
    80008ddc:	0017f793          	andi	a5,a5,1
    80008de0:	fe0794e3          	bnez	a5,80008dc8 <uartintr+0x28>
    80008de4:	00004617          	auipc	a2,0x4
    80008de8:	1cc60613          	addi	a2,a2,460 # 8000cfb0 <uart_tx_r>
    80008dec:	00004517          	auipc	a0,0x4
    80008df0:	1cc50513          	addi	a0,a0,460 # 8000cfb8 <uart_tx_w>
    80008df4:	00063783          	ld	a5,0(a2)
    80008df8:	00053703          	ld	a4,0(a0)
    80008dfc:	04f70263          	beq	a4,a5,80008e40 <uartintr+0xa0>
    80008e00:	100005b7          	lui	a1,0x10000
    80008e04:	00005817          	auipc	a6,0x5
    80008e08:	58c80813          	addi	a6,a6,1420 # 8000e390 <uart_tx_buf>
    80008e0c:	01c0006f          	j	80008e28 <uartintr+0x88>
    80008e10:	0006c703          	lbu	a4,0(a3)
    80008e14:	00f63023          	sd	a5,0(a2)
    80008e18:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008e1c:	00063783          	ld	a5,0(a2)
    80008e20:	00053703          	ld	a4,0(a0)
    80008e24:	00f70e63          	beq	a4,a5,80008e40 <uartintr+0xa0>
    80008e28:	01f7f713          	andi	a4,a5,31
    80008e2c:	00e806b3          	add	a3,a6,a4
    80008e30:	0055c703          	lbu	a4,5(a1)
    80008e34:	00178793          	addi	a5,a5,1
    80008e38:	02077713          	andi	a4,a4,32
    80008e3c:	fc071ae3          	bnez	a4,80008e10 <uartintr+0x70>
    80008e40:	01813083          	ld	ra,24(sp)
    80008e44:	01013403          	ld	s0,16(sp)
    80008e48:	00813483          	ld	s1,8(sp)
    80008e4c:	02010113          	addi	sp,sp,32
    80008e50:	00008067          	ret
    80008e54:	00004617          	auipc	a2,0x4
    80008e58:	15c60613          	addi	a2,a2,348 # 8000cfb0 <uart_tx_r>
    80008e5c:	00004517          	auipc	a0,0x4
    80008e60:	15c50513          	addi	a0,a0,348 # 8000cfb8 <uart_tx_w>
    80008e64:	00063783          	ld	a5,0(a2)
    80008e68:	00053703          	ld	a4,0(a0)
    80008e6c:	04f70263          	beq	a4,a5,80008eb0 <uartintr+0x110>
    80008e70:	100005b7          	lui	a1,0x10000
    80008e74:	00005817          	auipc	a6,0x5
    80008e78:	51c80813          	addi	a6,a6,1308 # 8000e390 <uart_tx_buf>
    80008e7c:	01c0006f          	j	80008e98 <uartintr+0xf8>
    80008e80:	0006c703          	lbu	a4,0(a3)
    80008e84:	00f63023          	sd	a5,0(a2)
    80008e88:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008e8c:	00063783          	ld	a5,0(a2)
    80008e90:	00053703          	ld	a4,0(a0)
    80008e94:	02f70063          	beq	a4,a5,80008eb4 <uartintr+0x114>
    80008e98:	01f7f713          	andi	a4,a5,31
    80008e9c:	00e806b3          	add	a3,a6,a4
    80008ea0:	0055c703          	lbu	a4,5(a1)
    80008ea4:	00178793          	addi	a5,a5,1
    80008ea8:	02077713          	andi	a4,a4,32
    80008eac:	fc071ae3          	bnez	a4,80008e80 <uartintr+0xe0>
    80008eb0:	00008067          	ret
    80008eb4:	00008067          	ret

0000000080008eb8 <kinit>:
    80008eb8:	fc010113          	addi	sp,sp,-64
    80008ebc:	02913423          	sd	s1,40(sp)
    80008ec0:	fffff7b7          	lui	a5,0xfffff
    80008ec4:	00006497          	auipc	s1,0x6
    80008ec8:	4eb48493          	addi	s1,s1,1259 # 8000f3af <end+0xfff>
    80008ecc:	02813823          	sd	s0,48(sp)
    80008ed0:	01313c23          	sd	s3,24(sp)
    80008ed4:	00f4f4b3          	and	s1,s1,a5
    80008ed8:	02113c23          	sd	ra,56(sp)
    80008edc:	03213023          	sd	s2,32(sp)
    80008ee0:	01413823          	sd	s4,16(sp)
    80008ee4:	01513423          	sd	s5,8(sp)
    80008ee8:	04010413          	addi	s0,sp,64
    80008eec:	000017b7          	lui	a5,0x1
    80008ef0:	01100993          	li	s3,17
    80008ef4:	00f487b3          	add	a5,s1,a5
    80008ef8:	01b99993          	slli	s3,s3,0x1b
    80008efc:	06f9e063          	bltu	s3,a5,80008f5c <kinit+0xa4>
    80008f00:	00005a97          	auipc	s5,0x5
    80008f04:	4b0a8a93          	addi	s5,s5,1200 # 8000e3b0 <end>
    80008f08:	0754ec63          	bltu	s1,s5,80008f80 <kinit+0xc8>
    80008f0c:	0734fa63          	bgeu	s1,s3,80008f80 <kinit+0xc8>
    80008f10:	00088a37          	lui	s4,0x88
    80008f14:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008f18:	00004917          	auipc	s2,0x4
    80008f1c:	0a890913          	addi	s2,s2,168 # 8000cfc0 <kmem>
    80008f20:	00ca1a13          	slli	s4,s4,0xc
    80008f24:	0140006f          	j	80008f38 <kinit+0x80>
    80008f28:	000017b7          	lui	a5,0x1
    80008f2c:	00f484b3          	add	s1,s1,a5
    80008f30:	0554e863          	bltu	s1,s5,80008f80 <kinit+0xc8>
    80008f34:	0534f663          	bgeu	s1,s3,80008f80 <kinit+0xc8>
    80008f38:	00001637          	lui	a2,0x1
    80008f3c:	00100593          	li	a1,1
    80008f40:	00048513          	mv	a0,s1
    80008f44:	00000097          	auipc	ra,0x0
    80008f48:	5e4080e7          	jalr	1508(ra) # 80009528 <__memset>
    80008f4c:	00093783          	ld	a5,0(s2)
    80008f50:	00f4b023          	sd	a5,0(s1)
    80008f54:	00993023          	sd	s1,0(s2)
    80008f58:	fd4498e3          	bne	s1,s4,80008f28 <kinit+0x70>
    80008f5c:	03813083          	ld	ra,56(sp)
    80008f60:	03013403          	ld	s0,48(sp)
    80008f64:	02813483          	ld	s1,40(sp)
    80008f68:	02013903          	ld	s2,32(sp)
    80008f6c:	01813983          	ld	s3,24(sp)
    80008f70:	01013a03          	ld	s4,16(sp)
    80008f74:	00813a83          	ld	s5,8(sp)
    80008f78:	04010113          	addi	sp,sp,64
    80008f7c:	00008067          	ret
    80008f80:	00002517          	auipc	a0,0x2
    80008f84:	96050513          	addi	a0,a0,-1696 # 8000a8e0 <digits+0x18>
    80008f88:	fffff097          	auipc	ra,0xfffff
    80008f8c:	4b4080e7          	jalr	1204(ra) # 8000843c <panic>

0000000080008f90 <freerange>:
    80008f90:	fc010113          	addi	sp,sp,-64
    80008f94:	000017b7          	lui	a5,0x1
    80008f98:	02913423          	sd	s1,40(sp)
    80008f9c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008fa0:	009504b3          	add	s1,a0,s1
    80008fa4:	fffff537          	lui	a0,0xfffff
    80008fa8:	02813823          	sd	s0,48(sp)
    80008fac:	02113c23          	sd	ra,56(sp)
    80008fb0:	03213023          	sd	s2,32(sp)
    80008fb4:	01313c23          	sd	s3,24(sp)
    80008fb8:	01413823          	sd	s4,16(sp)
    80008fbc:	01513423          	sd	s5,8(sp)
    80008fc0:	01613023          	sd	s6,0(sp)
    80008fc4:	04010413          	addi	s0,sp,64
    80008fc8:	00a4f4b3          	and	s1,s1,a0
    80008fcc:	00f487b3          	add	a5,s1,a5
    80008fd0:	06f5e463          	bltu	a1,a5,80009038 <freerange+0xa8>
    80008fd4:	00005a97          	auipc	s5,0x5
    80008fd8:	3dca8a93          	addi	s5,s5,988 # 8000e3b0 <end>
    80008fdc:	0954e263          	bltu	s1,s5,80009060 <freerange+0xd0>
    80008fe0:	01100993          	li	s3,17
    80008fe4:	01b99993          	slli	s3,s3,0x1b
    80008fe8:	0734fc63          	bgeu	s1,s3,80009060 <freerange+0xd0>
    80008fec:	00058a13          	mv	s4,a1
    80008ff0:	00004917          	auipc	s2,0x4
    80008ff4:	fd090913          	addi	s2,s2,-48 # 8000cfc0 <kmem>
    80008ff8:	00002b37          	lui	s6,0x2
    80008ffc:	0140006f          	j	80009010 <freerange+0x80>
    80009000:	000017b7          	lui	a5,0x1
    80009004:	00f484b3          	add	s1,s1,a5
    80009008:	0554ec63          	bltu	s1,s5,80009060 <freerange+0xd0>
    8000900c:	0534fa63          	bgeu	s1,s3,80009060 <freerange+0xd0>
    80009010:	00001637          	lui	a2,0x1
    80009014:	00100593          	li	a1,1
    80009018:	00048513          	mv	a0,s1
    8000901c:	00000097          	auipc	ra,0x0
    80009020:	50c080e7          	jalr	1292(ra) # 80009528 <__memset>
    80009024:	00093703          	ld	a4,0(s2)
    80009028:	016487b3          	add	a5,s1,s6
    8000902c:	00e4b023          	sd	a4,0(s1)
    80009030:	00993023          	sd	s1,0(s2)
    80009034:	fcfa76e3          	bgeu	s4,a5,80009000 <freerange+0x70>
    80009038:	03813083          	ld	ra,56(sp)
    8000903c:	03013403          	ld	s0,48(sp)
    80009040:	02813483          	ld	s1,40(sp)
    80009044:	02013903          	ld	s2,32(sp)
    80009048:	01813983          	ld	s3,24(sp)
    8000904c:	01013a03          	ld	s4,16(sp)
    80009050:	00813a83          	ld	s5,8(sp)
    80009054:	00013b03          	ld	s6,0(sp)
    80009058:	04010113          	addi	sp,sp,64
    8000905c:	00008067          	ret
    80009060:	00002517          	auipc	a0,0x2
    80009064:	88050513          	addi	a0,a0,-1920 # 8000a8e0 <digits+0x18>
    80009068:	fffff097          	auipc	ra,0xfffff
    8000906c:	3d4080e7          	jalr	980(ra) # 8000843c <panic>

0000000080009070 <kfree>:
    80009070:	fe010113          	addi	sp,sp,-32
    80009074:	00813823          	sd	s0,16(sp)
    80009078:	00113c23          	sd	ra,24(sp)
    8000907c:	00913423          	sd	s1,8(sp)
    80009080:	02010413          	addi	s0,sp,32
    80009084:	03451793          	slli	a5,a0,0x34
    80009088:	04079c63          	bnez	a5,800090e0 <kfree+0x70>
    8000908c:	00005797          	auipc	a5,0x5
    80009090:	32478793          	addi	a5,a5,804 # 8000e3b0 <end>
    80009094:	00050493          	mv	s1,a0
    80009098:	04f56463          	bltu	a0,a5,800090e0 <kfree+0x70>
    8000909c:	01100793          	li	a5,17
    800090a0:	01b79793          	slli	a5,a5,0x1b
    800090a4:	02f57e63          	bgeu	a0,a5,800090e0 <kfree+0x70>
    800090a8:	00001637          	lui	a2,0x1
    800090ac:	00100593          	li	a1,1
    800090b0:	00000097          	auipc	ra,0x0
    800090b4:	478080e7          	jalr	1144(ra) # 80009528 <__memset>
    800090b8:	00004797          	auipc	a5,0x4
    800090bc:	f0878793          	addi	a5,a5,-248 # 8000cfc0 <kmem>
    800090c0:	0007b703          	ld	a4,0(a5)
    800090c4:	01813083          	ld	ra,24(sp)
    800090c8:	01013403          	ld	s0,16(sp)
    800090cc:	00e4b023          	sd	a4,0(s1)
    800090d0:	0097b023          	sd	s1,0(a5)
    800090d4:	00813483          	ld	s1,8(sp)
    800090d8:	02010113          	addi	sp,sp,32
    800090dc:	00008067          	ret
    800090e0:	00002517          	auipc	a0,0x2
    800090e4:	80050513          	addi	a0,a0,-2048 # 8000a8e0 <digits+0x18>
    800090e8:	fffff097          	auipc	ra,0xfffff
    800090ec:	354080e7          	jalr	852(ra) # 8000843c <panic>

00000000800090f0 <kalloc>:
    800090f0:	fe010113          	addi	sp,sp,-32
    800090f4:	00813823          	sd	s0,16(sp)
    800090f8:	00913423          	sd	s1,8(sp)
    800090fc:	00113c23          	sd	ra,24(sp)
    80009100:	02010413          	addi	s0,sp,32
    80009104:	00004797          	auipc	a5,0x4
    80009108:	ebc78793          	addi	a5,a5,-324 # 8000cfc0 <kmem>
    8000910c:	0007b483          	ld	s1,0(a5)
    80009110:	02048063          	beqz	s1,80009130 <kalloc+0x40>
    80009114:	0004b703          	ld	a4,0(s1)
    80009118:	00001637          	lui	a2,0x1
    8000911c:	00500593          	li	a1,5
    80009120:	00048513          	mv	a0,s1
    80009124:	00e7b023          	sd	a4,0(a5)
    80009128:	00000097          	auipc	ra,0x0
    8000912c:	400080e7          	jalr	1024(ra) # 80009528 <__memset>
    80009130:	01813083          	ld	ra,24(sp)
    80009134:	01013403          	ld	s0,16(sp)
    80009138:	00048513          	mv	a0,s1
    8000913c:	00813483          	ld	s1,8(sp)
    80009140:	02010113          	addi	sp,sp,32
    80009144:	00008067          	ret

0000000080009148 <initlock>:
    80009148:	ff010113          	addi	sp,sp,-16
    8000914c:	00813423          	sd	s0,8(sp)
    80009150:	01010413          	addi	s0,sp,16
    80009154:	00813403          	ld	s0,8(sp)
    80009158:	00b53423          	sd	a1,8(a0)
    8000915c:	00052023          	sw	zero,0(a0)
    80009160:	00053823          	sd	zero,16(a0)
    80009164:	01010113          	addi	sp,sp,16
    80009168:	00008067          	ret

000000008000916c <acquire>:
    8000916c:	fe010113          	addi	sp,sp,-32
    80009170:	00813823          	sd	s0,16(sp)
    80009174:	00913423          	sd	s1,8(sp)
    80009178:	00113c23          	sd	ra,24(sp)
    8000917c:	01213023          	sd	s2,0(sp)
    80009180:	02010413          	addi	s0,sp,32
    80009184:	00050493          	mv	s1,a0
    80009188:	10002973          	csrr	s2,sstatus
    8000918c:	100027f3          	csrr	a5,sstatus
    80009190:	ffd7f793          	andi	a5,a5,-3
    80009194:	10079073          	csrw	sstatus,a5
    80009198:	fffff097          	auipc	ra,0xfffff
    8000919c:	8e8080e7          	jalr	-1816(ra) # 80007a80 <mycpu>
    800091a0:	07852783          	lw	a5,120(a0)
    800091a4:	06078e63          	beqz	a5,80009220 <acquire+0xb4>
    800091a8:	fffff097          	auipc	ra,0xfffff
    800091ac:	8d8080e7          	jalr	-1832(ra) # 80007a80 <mycpu>
    800091b0:	07852783          	lw	a5,120(a0)
    800091b4:	0004a703          	lw	a4,0(s1)
    800091b8:	0017879b          	addiw	a5,a5,1
    800091bc:	06f52c23          	sw	a5,120(a0)
    800091c0:	04071063          	bnez	a4,80009200 <acquire+0x94>
    800091c4:	00100713          	li	a4,1
    800091c8:	00070793          	mv	a5,a4
    800091cc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800091d0:	0007879b          	sext.w	a5,a5
    800091d4:	fe079ae3          	bnez	a5,800091c8 <acquire+0x5c>
    800091d8:	0ff0000f          	fence
    800091dc:	fffff097          	auipc	ra,0xfffff
    800091e0:	8a4080e7          	jalr	-1884(ra) # 80007a80 <mycpu>
    800091e4:	01813083          	ld	ra,24(sp)
    800091e8:	01013403          	ld	s0,16(sp)
    800091ec:	00a4b823          	sd	a0,16(s1)
    800091f0:	00013903          	ld	s2,0(sp)
    800091f4:	00813483          	ld	s1,8(sp)
    800091f8:	02010113          	addi	sp,sp,32
    800091fc:	00008067          	ret
    80009200:	0104b903          	ld	s2,16(s1)
    80009204:	fffff097          	auipc	ra,0xfffff
    80009208:	87c080e7          	jalr	-1924(ra) # 80007a80 <mycpu>
    8000920c:	faa91ce3          	bne	s2,a0,800091c4 <acquire+0x58>
    80009210:	00001517          	auipc	a0,0x1
    80009214:	6d850513          	addi	a0,a0,1752 # 8000a8e8 <digits+0x20>
    80009218:	fffff097          	auipc	ra,0xfffff
    8000921c:	224080e7          	jalr	548(ra) # 8000843c <panic>
    80009220:	00195913          	srli	s2,s2,0x1
    80009224:	fffff097          	auipc	ra,0xfffff
    80009228:	85c080e7          	jalr	-1956(ra) # 80007a80 <mycpu>
    8000922c:	00197913          	andi	s2,s2,1
    80009230:	07252e23          	sw	s2,124(a0)
    80009234:	f75ff06f          	j	800091a8 <acquire+0x3c>

0000000080009238 <release>:
    80009238:	fe010113          	addi	sp,sp,-32
    8000923c:	00813823          	sd	s0,16(sp)
    80009240:	00113c23          	sd	ra,24(sp)
    80009244:	00913423          	sd	s1,8(sp)
    80009248:	01213023          	sd	s2,0(sp)
    8000924c:	02010413          	addi	s0,sp,32
    80009250:	00052783          	lw	a5,0(a0)
    80009254:	00079a63          	bnez	a5,80009268 <release+0x30>
    80009258:	00001517          	auipc	a0,0x1
    8000925c:	69850513          	addi	a0,a0,1688 # 8000a8f0 <digits+0x28>
    80009260:	fffff097          	auipc	ra,0xfffff
    80009264:	1dc080e7          	jalr	476(ra) # 8000843c <panic>
    80009268:	01053903          	ld	s2,16(a0)
    8000926c:	00050493          	mv	s1,a0
    80009270:	fffff097          	auipc	ra,0xfffff
    80009274:	810080e7          	jalr	-2032(ra) # 80007a80 <mycpu>
    80009278:	fea910e3          	bne	s2,a0,80009258 <release+0x20>
    8000927c:	0004b823          	sd	zero,16(s1)
    80009280:	0ff0000f          	fence
    80009284:	0f50000f          	fence	iorw,ow
    80009288:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000928c:	ffffe097          	auipc	ra,0xffffe
    80009290:	7f4080e7          	jalr	2036(ra) # 80007a80 <mycpu>
    80009294:	100027f3          	csrr	a5,sstatus
    80009298:	0027f793          	andi	a5,a5,2
    8000929c:	04079a63          	bnez	a5,800092f0 <release+0xb8>
    800092a0:	07852783          	lw	a5,120(a0)
    800092a4:	02f05e63          	blez	a5,800092e0 <release+0xa8>
    800092a8:	fff7871b          	addiw	a4,a5,-1
    800092ac:	06e52c23          	sw	a4,120(a0)
    800092b0:	00071c63          	bnez	a4,800092c8 <release+0x90>
    800092b4:	07c52783          	lw	a5,124(a0)
    800092b8:	00078863          	beqz	a5,800092c8 <release+0x90>
    800092bc:	100027f3          	csrr	a5,sstatus
    800092c0:	0027e793          	ori	a5,a5,2
    800092c4:	10079073          	csrw	sstatus,a5
    800092c8:	01813083          	ld	ra,24(sp)
    800092cc:	01013403          	ld	s0,16(sp)
    800092d0:	00813483          	ld	s1,8(sp)
    800092d4:	00013903          	ld	s2,0(sp)
    800092d8:	02010113          	addi	sp,sp,32
    800092dc:	00008067          	ret
    800092e0:	00001517          	auipc	a0,0x1
    800092e4:	63050513          	addi	a0,a0,1584 # 8000a910 <digits+0x48>
    800092e8:	fffff097          	auipc	ra,0xfffff
    800092ec:	154080e7          	jalr	340(ra) # 8000843c <panic>
    800092f0:	00001517          	auipc	a0,0x1
    800092f4:	60850513          	addi	a0,a0,1544 # 8000a8f8 <digits+0x30>
    800092f8:	fffff097          	auipc	ra,0xfffff
    800092fc:	144080e7          	jalr	324(ra) # 8000843c <panic>

0000000080009300 <holding>:
    80009300:	00052783          	lw	a5,0(a0)
    80009304:	00079663          	bnez	a5,80009310 <holding+0x10>
    80009308:	00000513          	li	a0,0
    8000930c:	00008067          	ret
    80009310:	fe010113          	addi	sp,sp,-32
    80009314:	00813823          	sd	s0,16(sp)
    80009318:	00913423          	sd	s1,8(sp)
    8000931c:	00113c23          	sd	ra,24(sp)
    80009320:	02010413          	addi	s0,sp,32
    80009324:	01053483          	ld	s1,16(a0)
    80009328:	ffffe097          	auipc	ra,0xffffe
    8000932c:	758080e7          	jalr	1880(ra) # 80007a80 <mycpu>
    80009330:	01813083          	ld	ra,24(sp)
    80009334:	01013403          	ld	s0,16(sp)
    80009338:	40a48533          	sub	a0,s1,a0
    8000933c:	00153513          	seqz	a0,a0
    80009340:	00813483          	ld	s1,8(sp)
    80009344:	02010113          	addi	sp,sp,32
    80009348:	00008067          	ret

000000008000934c <push_off>:
    8000934c:	fe010113          	addi	sp,sp,-32
    80009350:	00813823          	sd	s0,16(sp)
    80009354:	00113c23          	sd	ra,24(sp)
    80009358:	00913423          	sd	s1,8(sp)
    8000935c:	02010413          	addi	s0,sp,32
    80009360:	100024f3          	csrr	s1,sstatus
    80009364:	100027f3          	csrr	a5,sstatus
    80009368:	ffd7f793          	andi	a5,a5,-3
    8000936c:	10079073          	csrw	sstatus,a5
    80009370:	ffffe097          	auipc	ra,0xffffe
    80009374:	710080e7          	jalr	1808(ra) # 80007a80 <mycpu>
    80009378:	07852783          	lw	a5,120(a0)
    8000937c:	02078663          	beqz	a5,800093a8 <push_off+0x5c>
    80009380:	ffffe097          	auipc	ra,0xffffe
    80009384:	700080e7          	jalr	1792(ra) # 80007a80 <mycpu>
    80009388:	07852783          	lw	a5,120(a0)
    8000938c:	01813083          	ld	ra,24(sp)
    80009390:	01013403          	ld	s0,16(sp)
    80009394:	0017879b          	addiw	a5,a5,1
    80009398:	06f52c23          	sw	a5,120(a0)
    8000939c:	00813483          	ld	s1,8(sp)
    800093a0:	02010113          	addi	sp,sp,32
    800093a4:	00008067          	ret
    800093a8:	0014d493          	srli	s1,s1,0x1
    800093ac:	ffffe097          	auipc	ra,0xffffe
    800093b0:	6d4080e7          	jalr	1748(ra) # 80007a80 <mycpu>
    800093b4:	0014f493          	andi	s1,s1,1
    800093b8:	06952e23          	sw	s1,124(a0)
    800093bc:	fc5ff06f          	j	80009380 <push_off+0x34>

00000000800093c0 <pop_off>:
    800093c0:	ff010113          	addi	sp,sp,-16
    800093c4:	00813023          	sd	s0,0(sp)
    800093c8:	00113423          	sd	ra,8(sp)
    800093cc:	01010413          	addi	s0,sp,16
    800093d0:	ffffe097          	auipc	ra,0xffffe
    800093d4:	6b0080e7          	jalr	1712(ra) # 80007a80 <mycpu>
    800093d8:	100027f3          	csrr	a5,sstatus
    800093dc:	0027f793          	andi	a5,a5,2
    800093e0:	04079663          	bnez	a5,8000942c <pop_off+0x6c>
    800093e4:	07852783          	lw	a5,120(a0)
    800093e8:	02f05a63          	blez	a5,8000941c <pop_off+0x5c>
    800093ec:	fff7871b          	addiw	a4,a5,-1
    800093f0:	06e52c23          	sw	a4,120(a0)
    800093f4:	00071c63          	bnez	a4,8000940c <pop_off+0x4c>
    800093f8:	07c52783          	lw	a5,124(a0)
    800093fc:	00078863          	beqz	a5,8000940c <pop_off+0x4c>
    80009400:	100027f3          	csrr	a5,sstatus
    80009404:	0027e793          	ori	a5,a5,2
    80009408:	10079073          	csrw	sstatus,a5
    8000940c:	00813083          	ld	ra,8(sp)
    80009410:	00013403          	ld	s0,0(sp)
    80009414:	01010113          	addi	sp,sp,16
    80009418:	00008067          	ret
    8000941c:	00001517          	auipc	a0,0x1
    80009420:	4f450513          	addi	a0,a0,1268 # 8000a910 <digits+0x48>
    80009424:	fffff097          	auipc	ra,0xfffff
    80009428:	018080e7          	jalr	24(ra) # 8000843c <panic>
    8000942c:	00001517          	auipc	a0,0x1
    80009430:	4cc50513          	addi	a0,a0,1228 # 8000a8f8 <digits+0x30>
    80009434:	fffff097          	auipc	ra,0xfffff
    80009438:	008080e7          	jalr	8(ra) # 8000843c <panic>

000000008000943c <push_on>:
    8000943c:	fe010113          	addi	sp,sp,-32
    80009440:	00813823          	sd	s0,16(sp)
    80009444:	00113c23          	sd	ra,24(sp)
    80009448:	00913423          	sd	s1,8(sp)
    8000944c:	02010413          	addi	s0,sp,32
    80009450:	100024f3          	csrr	s1,sstatus
    80009454:	100027f3          	csrr	a5,sstatus
    80009458:	0027e793          	ori	a5,a5,2
    8000945c:	10079073          	csrw	sstatus,a5
    80009460:	ffffe097          	auipc	ra,0xffffe
    80009464:	620080e7          	jalr	1568(ra) # 80007a80 <mycpu>
    80009468:	07852783          	lw	a5,120(a0)
    8000946c:	02078663          	beqz	a5,80009498 <push_on+0x5c>
    80009470:	ffffe097          	auipc	ra,0xffffe
    80009474:	610080e7          	jalr	1552(ra) # 80007a80 <mycpu>
    80009478:	07852783          	lw	a5,120(a0)
    8000947c:	01813083          	ld	ra,24(sp)
    80009480:	01013403          	ld	s0,16(sp)
    80009484:	0017879b          	addiw	a5,a5,1
    80009488:	06f52c23          	sw	a5,120(a0)
    8000948c:	00813483          	ld	s1,8(sp)
    80009490:	02010113          	addi	sp,sp,32
    80009494:	00008067          	ret
    80009498:	0014d493          	srli	s1,s1,0x1
    8000949c:	ffffe097          	auipc	ra,0xffffe
    800094a0:	5e4080e7          	jalr	1508(ra) # 80007a80 <mycpu>
    800094a4:	0014f493          	andi	s1,s1,1
    800094a8:	06952e23          	sw	s1,124(a0)
    800094ac:	fc5ff06f          	j	80009470 <push_on+0x34>

00000000800094b0 <pop_on>:
    800094b0:	ff010113          	addi	sp,sp,-16
    800094b4:	00813023          	sd	s0,0(sp)
    800094b8:	00113423          	sd	ra,8(sp)
    800094bc:	01010413          	addi	s0,sp,16
    800094c0:	ffffe097          	auipc	ra,0xffffe
    800094c4:	5c0080e7          	jalr	1472(ra) # 80007a80 <mycpu>
    800094c8:	100027f3          	csrr	a5,sstatus
    800094cc:	0027f793          	andi	a5,a5,2
    800094d0:	04078463          	beqz	a5,80009518 <pop_on+0x68>
    800094d4:	07852783          	lw	a5,120(a0)
    800094d8:	02f05863          	blez	a5,80009508 <pop_on+0x58>
    800094dc:	fff7879b          	addiw	a5,a5,-1
    800094e0:	06f52c23          	sw	a5,120(a0)
    800094e4:	07853783          	ld	a5,120(a0)
    800094e8:	00079863          	bnez	a5,800094f8 <pop_on+0x48>
    800094ec:	100027f3          	csrr	a5,sstatus
    800094f0:	ffd7f793          	andi	a5,a5,-3
    800094f4:	10079073          	csrw	sstatus,a5
    800094f8:	00813083          	ld	ra,8(sp)
    800094fc:	00013403          	ld	s0,0(sp)
    80009500:	01010113          	addi	sp,sp,16
    80009504:	00008067          	ret
    80009508:	00001517          	auipc	a0,0x1
    8000950c:	43050513          	addi	a0,a0,1072 # 8000a938 <digits+0x70>
    80009510:	fffff097          	auipc	ra,0xfffff
    80009514:	f2c080e7          	jalr	-212(ra) # 8000843c <panic>
    80009518:	00001517          	auipc	a0,0x1
    8000951c:	40050513          	addi	a0,a0,1024 # 8000a918 <digits+0x50>
    80009520:	fffff097          	auipc	ra,0xfffff
    80009524:	f1c080e7          	jalr	-228(ra) # 8000843c <panic>

0000000080009528 <__memset>:
    80009528:	ff010113          	addi	sp,sp,-16
    8000952c:	00813423          	sd	s0,8(sp)
    80009530:	01010413          	addi	s0,sp,16
    80009534:	1a060e63          	beqz	a2,800096f0 <__memset+0x1c8>
    80009538:	40a007b3          	neg	a5,a0
    8000953c:	0077f793          	andi	a5,a5,7
    80009540:	00778693          	addi	a3,a5,7
    80009544:	00b00813          	li	a6,11
    80009548:	0ff5f593          	andi	a1,a1,255
    8000954c:	fff6071b          	addiw	a4,a2,-1
    80009550:	1b06e663          	bltu	a3,a6,800096fc <__memset+0x1d4>
    80009554:	1cd76463          	bltu	a4,a3,8000971c <__memset+0x1f4>
    80009558:	1a078e63          	beqz	a5,80009714 <__memset+0x1ec>
    8000955c:	00b50023          	sb	a1,0(a0)
    80009560:	00100713          	li	a4,1
    80009564:	1ae78463          	beq	a5,a4,8000970c <__memset+0x1e4>
    80009568:	00b500a3          	sb	a1,1(a0)
    8000956c:	00200713          	li	a4,2
    80009570:	1ae78a63          	beq	a5,a4,80009724 <__memset+0x1fc>
    80009574:	00b50123          	sb	a1,2(a0)
    80009578:	00300713          	li	a4,3
    8000957c:	18e78463          	beq	a5,a4,80009704 <__memset+0x1dc>
    80009580:	00b501a3          	sb	a1,3(a0)
    80009584:	00400713          	li	a4,4
    80009588:	1ae78263          	beq	a5,a4,8000972c <__memset+0x204>
    8000958c:	00b50223          	sb	a1,4(a0)
    80009590:	00500713          	li	a4,5
    80009594:	1ae78063          	beq	a5,a4,80009734 <__memset+0x20c>
    80009598:	00b502a3          	sb	a1,5(a0)
    8000959c:	00700713          	li	a4,7
    800095a0:	18e79e63          	bne	a5,a4,8000973c <__memset+0x214>
    800095a4:	00b50323          	sb	a1,6(a0)
    800095a8:	00700e93          	li	t4,7
    800095ac:	00859713          	slli	a4,a1,0x8
    800095b0:	00e5e733          	or	a4,a1,a4
    800095b4:	01059e13          	slli	t3,a1,0x10
    800095b8:	01c76e33          	or	t3,a4,t3
    800095bc:	01859313          	slli	t1,a1,0x18
    800095c0:	006e6333          	or	t1,t3,t1
    800095c4:	02059893          	slli	a7,a1,0x20
    800095c8:	40f60e3b          	subw	t3,a2,a5
    800095cc:	011368b3          	or	a7,t1,a7
    800095d0:	02859813          	slli	a6,a1,0x28
    800095d4:	0108e833          	or	a6,a7,a6
    800095d8:	03059693          	slli	a3,a1,0x30
    800095dc:	003e589b          	srliw	a7,t3,0x3
    800095e0:	00d866b3          	or	a3,a6,a3
    800095e4:	03859713          	slli	a4,a1,0x38
    800095e8:	00389813          	slli	a6,a7,0x3
    800095ec:	00f507b3          	add	a5,a0,a5
    800095f0:	00e6e733          	or	a4,a3,a4
    800095f4:	000e089b          	sext.w	a7,t3
    800095f8:	00f806b3          	add	a3,a6,a5
    800095fc:	00e7b023          	sd	a4,0(a5)
    80009600:	00878793          	addi	a5,a5,8
    80009604:	fed79ce3          	bne	a5,a3,800095fc <__memset+0xd4>
    80009608:	ff8e7793          	andi	a5,t3,-8
    8000960c:	0007871b          	sext.w	a4,a5
    80009610:	01d787bb          	addw	a5,a5,t4
    80009614:	0ce88e63          	beq	a7,a4,800096f0 <__memset+0x1c8>
    80009618:	00f50733          	add	a4,a0,a5
    8000961c:	00b70023          	sb	a1,0(a4)
    80009620:	0017871b          	addiw	a4,a5,1
    80009624:	0cc77663          	bgeu	a4,a2,800096f0 <__memset+0x1c8>
    80009628:	00e50733          	add	a4,a0,a4
    8000962c:	00b70023          	sb	a1,0(a4)
    80009630:	0027871b          	addiw	a4,a5,2
    80009634:	0ac77e63          	bgeu	a4,a2,800096f0 <__memset+0x1c8>
    80009638:	00e50733          	add	a4,a0,a4
    8000963c:	00b70023          	sb	a1,0(a4)
    80009640:	0037871b          	addiw	a4,a5,3
    80009644:	0ac77663          	bgeu	a4,a2,800096f0 <__memset+0x1c8>
    80009648:	00e50733          	add	a4,a0,a4
    8000964c:	00b70023          	sb	a1,0(a4)
    80009650:	0047871b          	addiw	a4,a5,4
    80009654:	08c77e63          	bgeu	a4,a2,800096f0 <__memset+0x1c8>
    80009658:	00e50733          	add	a4,a0,a4
    8000965c:	00b70023          	sb	a1,0(a4)
    80009660:	0057871b          	addiw	a4,a5,5
    80009664:	08c77663          	bgeu	a4,a2,800096f0 <__memset+0x1c8>
    80009668:	00e50733          	add	a4,a0,a4
    8000966c:	00b70023          	sb	a1,0(a4)
    80009670:	0067871b          	addiw	a4,a5,6
    80009674:	06c77e63          	bgeu	a4,a2,800096f0 <__memset+0x1c8>
    80009678:	00e50733          	add	a4,a0,a4
    8000967c:	00b70023          	sb	a1,0(a4)
    80009680:	0077871b          	addiw	a4,a5,7
    80009684:	06c77663          	bgeu	a4,a2,800096f0 <__memset+0x1c8>
    80009688:	00e50733          	add	a4,a0,a4
    8000968c:	00b70023          	sb	a1,0(a4)
    80009690:	0087871b          	addiw	a4,a5,8
    80009694:	04c77e63          	bgeu	a4,a2,800096f0 <__memset+0x1c8>
    80009698:	00e50733          	add	a4,a0,a4
    8000969c:	00b70023          	sb	a1,0(a4)
    800096a0:	0097871b          	addiw	a4,a5,9
    800096a4:	04c77663          	bgeu	a4,a2,800096f0 <__memset+0x1c8>
    800096a8:	00e50733          	add	a4,a0,a4
    800096ac:	00b70023          	sb	a1,0(a4)
    800096b0:	00a7871b          	addiw	a4,a5,10
    800096b4:	02c77e63          	bgeu	a4,a2,800096f0 <__memset+0x1c8>
    800096b8:	00e50733          	add	a4,a0,a4
    800096bc:	00b70023          	sb	a1,0(a4)
    800096c0:	00b7871b          	addiw	a4,a5,11
    800096c4:	02c77663          	bgeu	a4,a2,800096f0 <__memset+0x1c8>
    800096c8:	00e50733          	add	a4,a0,a4
    800096cc:	00b70023          	sb	a1,0(a4)
    800096d0:	00c7871b          	addiw	a4,a5,12
    800096d4:	00c77e63          	bgeu	a4,a2,800096f0 <__memset+0x1c8>
    800096d8:	00e50733          	add	a4,a0,a4
    800096dc:	00b70023          	sb	a1,0(a4)
    800096e0:	00d7879b          	addiw	a5,a5,13
    800096e4:	00c7f663          	bgeu	a5,a2,800096f0 <__memset+0x1c8>
    800096e8:	00f507b3          	add	a5,a0,a5
    800096ec:	00b78023          	sb	a1,0(a5)
    800096f0:	00813403          	ld	s0,8(sp)
    800096f4:	01010113          	addi	sp,sp,16
    800096f8:	00008067          	ret
    800096fc:	00b00693          	li	a3,11
    80009700:	e55ff06f          	j	80009554 <__memset+0x2c>
    80009704:	00300e93          	li	t4,3
    80009708:	ea5ff06f          	j	800095ac <__memset+0x84>
    8000970c:	00100e93          	li	t4,1
    80009710:	e9dff06f          	j	800095ac <__memset+0x84>
    80009714:	00000e93          	li	t4,0
    80009718:	e95ff06f          	j	800095ac <__memset+0x84>
    8000971c:	00000793          	li	a5,0
    80009720:	ef9ff06f          	j	80009618 <__memset+0xf0>
    80009724:	00200e93          	li	t4,2
    80009728:	e85ff06f          	j	800095ac <__memset+0x84>
    8000972c:	00400e93          	li	t4,4
    80009730:	e7dff06f          	j	800095ac <__memset+0x84>
    80009734:	00500e93          	li	t4,5
    80009738:	e75ff06f          	j	800095ac <__memset+0x84>
    8000973c:	00600e93          	li	t4,6
    80009740:	e6dff06f          	j	800095ac <__memset+0x84>

0000000080009744 <__memmove>:
    80009744:	ff010113          	addi	sp,sp,-16
    80009748:	00813423          	sd	s0,8(sp)
    8000974c:	01010413          	addi	s0,sp,16
    80009750:	0e060863          	beqz	a2,80009840 <__memmove+0xfc>
    80009754:	fff6069b          	addiw	a3,a2,-1
    80009758:	0006881b          	sext.w	a6,a3
    8000975c:	0ea5e863          	bltu	a1,a0,8000984c <__memmove+0x108>
    80009760:	00758713          	addi	a4,a1,7
    80009764:	00a5e7b3          	or	a5,a1,a0
    80009768:	40a70733          	sub	a4,a4,a0
    8000976c:	0077f793          	andi	a5,a5,7
    80009770:	00f73713          	sltiu	a4,a4,15
    80009774:	00174713          	xori	a4,a4,1
    80009778:	0017b793          	seqz	a5,a5
    8000977c:	00e7f7b3          	and	a5,a5,a4
    80009780:	10078863          	beqz	a5,80009890 <__memmove+0x14c>
    80009784:	00900793          	li	a5,9
    80009788:	1107f463          	bgeu	a5,a6,80009890 <__memmove+0x14c>
    8000978c:	0036581b          	srliw	a6,a2,0x3
    80009790:	fff8081b          	addiw	a6,a6,-1
    80009794:	02081813          	slli	a6,a6,0x20
    80009798:	01d85893          	srli	a7,a6,0x1d
    8000979c:	00858813          	addi	a6,a1,8
    800097a0:	00058793          	mv	a5,a1
    800097a4:	00050713          	mv	a4,a0
    800097a8:	01088833          	add	a6,a7,a6
    800097ac:	0007b883          	ld	a7,0(a5)
    800097b0:	00878793          	addi	a5,a5,8
    800097b4:	00870713          	addi	a4,a4,8
    800097b8:	ff173c23          	sd	a7,-8(a4)
    800097bc:	ff0798e3          	bne	a5,a6,800097ac <__memmove+0x68>
    800097c0:	ff867713          	andi	a4,a2,-8
    800097c4:	02071793          	slli	a5,a4,0x20
    800097c8:	0207d793          	srli	a5,a5,0x20
    800097cc:	00f585b3          	add	a1,a1,a5
    800097d0:	40e686bb          	subw	a3,a3,a4
    800097d4:	00f507b3          	add	a5,a0,a5
    800097d8:	06e60463          	beq	a2,a4,80009840 <__memmove+0xfc>
    800097dc:	0005c703          	lbu	a4,0(a1)
    800097e0:	00e78023          	sb	a4,0(a5)
    800097e4:	04068e63          	beqz	a3,80009840 <__memmove+0xfc>
    800097e8:	0015c603          	lbu	a2,1(a1)
    800097ec:	00100713          	li	a4,1
    800097f0:	00c780a3          	sb	a2,1(a5)
    800097f4:	04e68663          	beq	a3,a4,80009840 <__memmove+0xfc>
    800097f8:	0025c603          	lbu	a2,2(a1)
    800097fc:	00200713          	li	a4,2
    80009800:	00c78123          	sb	a2,2(a5)
    80009804:	02e68e63          	beq	a3,a4,80009840 <__memmove+0xfc>
    80009808:	0035c603          	lbu	a2,3(a1)
    8000980c:	00300713          	li	a4,3
    80009810:	00c781a3          	sb	a2,3(a5)
    80009814:	02e68663          	beq	a3,a4,80009840 <__memmove+0xfc>
    80009818:	0045c603          	lbu	a2,4(a1)
    8000981c:	00400713          	li	a4,4
    80009820:	00c78223          	sb	a2,4(a5)
    80009824:	00e68e63          	beq	a3,a4,80009840 <__memmove+0xfc>
    80009828:	0055c603          	lbu	a2,5(a1)
    8000982c:	00500713          	li	a4,5
    80009830:	00c782a3          	sb	a2,5(a5)
    80009834:	00e68663          	beq	a3,a4,80009840 <__memmove+0xfc>
    80009838:	0065c703          	lbu	a4,6(a1)
    8000983c:	00e78323          	sb	a4,6(a5)
    80009840:	00813403          	ld	s0,8(sp)
    80009844:	01010113          	addi	sp,sp,16
    80009848:	00008067          	ret
    8000984c:	02061713          	slli	a4,a2,0x20
    80009850:	02075713          	srli	a4,a4,0x20
    80009854:	00e587b3          	add	a5,a1,a4
    80009858:	f0f574e3          	bgeu	a0,a5,80009760 <__memmove+0x1c>
    8000985c:	02069613          	slli	a2,a3,0x20
    80009860:	02065613          	srli	a2,a2,0x20
    80009864:	fff64613          	not	a2,a2
    80009868:	00e50733          	add	a4,a0,a4
    8000986c:	00c78633          	add	a2,a5,a2
    80009870:	fff7c683          	lbu	a3,-1(a5)
    80009874:	fff78793          	addi	a5,a5,-1
    80009878:	fff70713          	addi	a4,a4,-1
    8000987c:	00d70023          	sb	a3,0(a4)
    80009880:	fec798e3          	bne	a5,a2,80009870 <__memmove+0x12c>
    80009884:	00813403          	ld	s0,8(sp)
    80009888:	01010113          	addi	sp,sp,16
    8000988c:	00008067          	ret
    80009890:	02069713          	slli	a4,a3,0x20
    80009894:	02075713          	srli	a4,a4,0x20
    80009898:	00170713          	addi	a4,a4,1
    8000989c:	00e50733          	add	a4,a0,a4
    800098a0:	00050793          	mv	a5,a0
    800098a4:	0005c683          	lbu	a3,0(a1)
    800098a8:	00178793          	addi	a5,a5,1
    800098ac:	00158593          	addi	a1,a1,1
    800098b0:	fed78fa3          	sb	a3,-1(a5)
    800098b4:	fee798e3          	bne	a5,a4,800098a4 <__memmove+0x160>
    800098b8:	f89ff06f          	j	80009840 <__memmove+0xfc>
	...
