
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	12013103          	ld	sp,288(sp) # 8000d120 <_GLOBAL_OFFSET_TABLE_+0x58>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	461070ef          	jal	ra,80007c7c <start>

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
    80001084:	7d8010ef          	jal	ra,8000285c <interruptRoutine>

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
    80001430:	d0c7b783          	ld	a5,-756(a5) # 8000d138 <_GLOBAL_OFFSET_TABLE_+0x70>
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
    8000167c:	ac07b783          	ld	a5,-1344(a5) # 8000d138 <_GLOBAL_OFFSET_TABLE_+0x70>
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
    80001710:	ab47c783          	lbu	a5,-1356(a5) # 8000d1c0 <_ZN8KConsole11initializedE>
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
    80001734:	a9048493          	addi	s1,s1,-1392 # 8000d1c0 <_ZN8KConsole11initializedE>
    80001738:	0000c797          	auipc	a5,0xc
    8000173c:	9a07b783          	ld	a5,-1632(a5) # 8000d0d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001740:	0007b783          	ld	a5,0(a5)
    80001744:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    80001748:	0000c797          	auipc	a5,0xc
    8000174c:	9a07b783          	ld	a5,-1632(a5) # 8000d0e8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001750:	0007b783          	ld	a5,0(a5)
    80001754:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    80001758:	03200593          	li	a1,50
    8000175c:	0000c517          	auipc	a0,0xc
    80001760:	a7c50513          	addi	a0,a0,-1412 # 8000d1d8 <_ZN8KConsole19inputBufferHasSpaceE>
    80001764:	00000097          	auipc	ra,0x0
    80001768:	dd4080e7          	jalr	-556(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    8000176c:	03200593          	li	a1,50
    80001770:	0000c517          	auipc	a0,0xc
    80001774:	a7050513          	addi	a0,a0,-1424 # 8000d1e0 <_ZN8KConsole20outputBufferHasSpaceE>
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	dc0080e7          	jalr	-576(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    80001780:	00000593          	li	a1,0
    80001784:	0000c517          	auipc	a0,0xc
    80001788:	a6450513          	addi	a0,a0,-1436 # 8000d1e8 <_ZN8KConsole12charsToInputE>
    8000178c:	00000097          	auipc	ra,0x0
    80001790:	dac080e7          	jalr	-596(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    80001794:	00000593          	li	a1,0
    80001798:	0000c517          	auipc	a0,0xc
    8000179c:	a5850513          	addi	a0,a0,-1448 # 8000d1f0 <_ZN8KConsole13charsToOutputE>
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
    800017dc:	9e848493          	addi	s1,s1,-1560 # 8000d1c0 <_ZN8KConsole11initializedE>
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
    80001820:	a1872703          	lw	a4,-1512(a4) # 8000d234 <_ZN8KConsole15inputBufferSizeE>
    80001824:	03200793          	li	a5,50
    80001828:	04f70e63          	beq	a4,a5,80001884 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    8000182c:	ff010113          	addi	sp,sp,-16
    80001830:	00113423          	sd	ra,8(sp)
    80001834:	00813023          	sd	s0,0(sp)
    80001838:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    8000183c:	0000c697          	auipc	a3,0xc
    80001840:	98468693          	addi	a3,a3,-1660 # 8000d1c0 <_ZN8KConsole11initializedE>
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
    800018a8:	91c48493          	addi	s1,s1,-1764 # 8000d1c0 <_ZN8KConsole11initializedE>
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
    80001910:	8b448493          	addi	s1,s1,-1868 # 8000d1c0 <_ZN8KConsole11initializedE>
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

//Semaphore* s12,*s23,*s31;
Thread* nit1, * nit2, * nit3;


void f1(void* end) {
    8000195c:	ff010113          	addi	sp,sp,-16
    80001960:	00113423          	sd	ra,8(sp)
    80001964:	00813023          	sd	s0,0(sp)
    80001968:	01010413          	addi	s0,sp,16

    time_sleep(10);
    8000196c:	00a00513          	li	a0,10
    80001970:	00000097          	auipc	ra,0x0
    80001974:	b98080e7          	jalr	-1128(ra) # 80001508 <_Z10time_sleepm>
    printString("\nGotova nit 1\n");
    80001978:	00008517          	auipc	a0,0x8
    8000197c:	6a850513          	addi	a0,a0,1704 # 8000a020 <CONSOLE_STATUS+0x10>
    80001980:	00005097          	auipc	ra,0x5
    80001984:	b0c080e7          	jalr	-1268(ra) # 8000648c <_Z11printStringPKc>
}
    80001988:	00813083          	ld	ra,8(sp)
    8000198c:	00013403          	ld	s0,0(sp)
    80001990:	01010113          	addi	sp,sp,16
    80001994:	00008067          	ret

0000000080001998 <_Z2f2Pv>:


void f2(void* end) {
    80001998:	ff010113          	addi	sp,sp,-16
    8000199c:	00113423          	sd	ra,8(sp)
    800019a0:	00813023          	sd	s0,0(sp)
    800019a4:	01010413          	addi	s0,sp,16


    printString("\nGotova nit 2\n");
    800019a8:	00008517          	auipc	a0,0x8
    800019ac:	68850513          	addi	a0,a0,1672 # 8000a030 <CONSOLE_STATUS+0x20>
    800019b0:	00005097          	auipc	ra,0x5
    800019b4:	adc080e7          	jalr	-1316(ra) # 8000648c <_Z11printStringPKc>
}
    800019b8:	00813083          	ld	ra,8(sp)
    800019bc:	00013403          	ld	s0,0(sp)
    800019c0:	01010113          	addi	sp,sp,16
    800019c4:	00008067          	ret

00000000800019c8 <_Z2f3Pv>:


void f3(void* end) {
    800019c8:	ff010113          	addi	sp,sp,-16
    800019cc:	00113423          	sd	ra,8(sp)
    800019d0:	00813023          	sd	s0,0(sp)
    800019d4:	01010413          	addi	s0,sp,16

    printString("\nGotova nit3\n");
    800019d8:	00008517          	auipc	a0,0x8
    800019dc:	66850513          	addi	a0,a0,1640 # 8000a040 <CONSOLE_STATUS+0x30>
    800019e0:	00005097          	auipc	ra,0x5
    800019e4:	aac080e7          	jalr	-1364(ra) # 8000648c <_Z11printStringPKc>
}
    800019e8:	00813083          	ld	ra,8(sp)
    800019ec:	00013403          	ld	s0,0(sp)
    800019f0:	01010113          	addi	sp,sp,16
    800019f4:	00008067          	ret

00000000800019f8 <_Z4userPv>:
        printInt(counter++);
        printString("\n");
    }
};

void user(void*) {
    800019f8:	fd010113          	addi	sp,sp,-48
    800019fc:	02113423          	sd	ra,40(sp)
    80001a00:	02813023          	sd	s0,32(sp)
    80001a04:	00913c23          	sd	s1,24(sp)
    80001a08:	01213823          	sd	s2,16(sp)
    80001a0c:	03010413          	addi	s0,sp,48
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    int end = 0;
    80001a10:	fc042e23          	sw	zero,-36(s0)
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    nit1 = new Thread(f1, &end);
    80001a14:	02000513          	li	a0,32
    80001a18:	00001097          	auipc	ra,0x1
    80001a1c:	7fc080e7          	jalr	2044(ra) # 80003214 <_Znwm>
    80001a20:	00050493          	mv	s1,a0
    80001a24:	fdc40613          	addi	a2,s0,-36
    80001a28:	00000597          	auipc	a1,0x0
    80001a2c:	f3458593          	addi	a1,a1,-204 # 8000195c <_Z2f1Pv>
    80001a30:	00002097          	auipc	ra,0x2
    80001a34:	904080e7          	jalr	-1788(ra) # 80003334 <_ZN6ThreadC1EPFvPvES0_>
    80001a38:	0000c797          	auipc	a5,0xc
    80001a3c:	8497b423          	sd	s1,-1976(a5) # 8000d280 <nit1>
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    nit2 = new Thread(f2, &end);
    80001a40:	02000513          	li	a0,32
    80001a44:	00001097          	auipc	ra,0x1
    80001a48:	7d0080e7          	jalr	2000(ra) # 80003214 <_Znwm>
    80001a4c:	00050493          	mv	s1,a0
    80001a50:	fdc40613          	addi	a2,s0,-36
    80001a54:	00000597          	auipc	a1,0x0
    80001a58:	f4458593          	addi	a1,a1,-188 # 80001998 <_Z2f2Pv>
    80001a5c:	00002097          	auipc	ra,0x2
    80001a60:	8d8080e7          	jalr	-1832(ra) # 80003334 <_ZN6ThreadC1EPFvPvES0_>
    80001a64:	0000c797          	auipc	a5,0xc
    80001a68:	8297b223          	sd	s1,-2012(a5) # 8000d288 <nit2>
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    nit3 = new Thread(f3, &end);
    80001a6c:	02000513          	li	a0,32
    80001a70:	00001097          	auipc	ra,0x1
    80001a74:	7a4080e7          	jalr	1956(ra) # 80003214 <_Znwm>
    80001a78:	00050493          	mv	s1,a0
    80001a7c:	fdc40613          	addi	a2,s0,-36
    80001a80:	00000597          	auipc	a1,0x0
    80001a84:	f4858593          	addi	a1,a1,-184 # 800019c8 <_Z2f3Pv>
    80001a88:	00002097          	auipc	ra,0x2
    80001a8c:	8ac080e7          	jalr	-1876(ra) # 80003334 <_ZN6ThreadC1EPFvPvES0_>
    80001a90:	0000c797          	auipc	a5,0xc
    80001a94:	8097b023          	sd	s1,-2048(a5) # 8000d290 <nit3>
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    PeriodicThread* per = new timer();
    80001a98:	03000513          	li	a0,48
    80001a9c:	00001097          	auipc	ra,0x1
    80001aa0:	778080e7          	jalr	1912(ra) # 80003214 <_Znwm>
    80001aa4:	00050493          	mv	s1,a0
    explicit timer() : PeriodicThread(1) {}
    80001aa8:	00100593          	li	a1,1
    80001aac:	00002097          	auipc	ra,0x2
    80001ab0:	b84080e7          	jalr	-1148(ra) # 80003630 <_ZN14PeriodicThreadC1Em>
    80001ab4:	0000b797          	auipc	a5,0xb
    80001ab8:	37c78793          	addi	a5,a5,892 # 8000ce30 <_ZTV5timer+0x10>
    80001abc:	00f4b023          	sd	a5,0(s1)
    80001ac0:	0204a423          	sw	zero,40(s1)
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
//    s31 = new Semaphore(1);
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    nit1->start();
    80001ac4:	0000b917          	auipc	s2,0xb
    80001ac8:	7bc90913          	addi	s2,s2,1980 # 8000d280 <nit1>
    80001acc:	00093503          	ld	a0,0(s2)
    80001ad0:	00002097          	auipc	ra,0x2
    80001ad4:	8fc080e7          	jalr	-1796(ra) # 800033cc <_ZN6Thread5startEv>
    nit3->start();
    80001ad8:	01093503          	ld	a0,16(s2)
    80001adc:	00002097          	auipc	ra,0x2
    80001ae0:	8f0080e7          	jalr	-1808(ra) # 800033cc <_ZN6Thread5startEv>
    nit2->start();
    80001ae4:	00893503          	ld	a0,8(s2)
    80001ae8:	00002097          	auipc	ra,0x2
    80001aec:	8e4080e7          	jalr	-1820(ra) # 800033cc <_ZN6Thread5startEv>
    per->start();
    80001af0:	00048513          	mv	a0,s1
    80001af4:	00002097          	auipc	ra,0x2
    80001af8:	8d8080e7          	jalr	-1832(ra) # 800033cc <_ZN6Thread5startEv>

    nit1->join();
    80001afc:	00093503          	ld	a0,0(s2)
    80001b00:	00002097          	auipc	ra,0x2
    80001b04:	914080e7          	jalr	-1772(ra) # 80003414 <_ZN6Thread4joinEv>
    nit2->join();
    80001b08:	00893503          	ld	a0,8(s2)
    80001b0c:	00002097          	auipc	ra,0x2
    80001b10:	908080e7          	jalr	-1784(ra) # 80003414 <_ZN6Thread4joinEv>
    nit3->join();
    80001b14:	01093503          	ld	a0,16(s2)
    80001b18:	00002097          	auipc	ra,0x2
    80001b1c:	8fc080e7          	jalr	-1796(ra) # 80003414 <_ZN6Thread4joinEv>


    //printString("\nGotove user niti\n");

    //printString("\nSad cu da izadjem iz usera\n");
    per->terminate();
    80001b20:	00048513          	mv	a0,s1
    80001b24:	00002097          	auipc	ra,0x2
    80001b28:	aec080e7          	jalr	-1300(ra) # 80003610 <_ZN14PeriodicThread9terminateEv>

//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    delete nit1;
    80001b2c:	00093503          	ld	a0,0(s2)
    80001b30:	00050863          	beqz	a0,80001b40 <_Z4userPv+0x148>
    80001b34:	00053783          	ld	a5,0(a0)
    80001b38:	0087b783          	ld	a5,8(a5)
    80001b3c:	000780e7          	jalr	a5
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    delete nit2;
    80001b40:	0000b517          	auipc	a0,0xb
    80001b44:	74853503          	ld	a0,1864(a0) # 8000d288 <nit2>
    80001b48:	00050863          	beqz	a0,80001b58 <_Z4userPv+0x160>
    80001b4c:	00053783          	ld	a5,0(a0)
    80001b50:	0087b783          	ld	a5,8(a5)
    80001b54:	000780e7          	jalr	a5
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    delete nit3;
    80001b58:	0000b517          	auipc	a0,0xb
    80001b5c:	73853503          	ld	a0,1848(a0) # 8000d290 <nit3>
    80001b60:	00050863          	beqz	a0,80001b70 <_Z4userPv+0x178>
    80001b64:	00053783          	ld	a5,0(a0)
    80001b68:	0087b783          	ld	a5,8(a5)
    80001b6c:	000780e7          	jalr	a5
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
    per->join();
    80001b70:	00048513          	mv	a0,s1
    80001b74:	00002097          	auipc	ra,0x2
    80001b78:	8a0080e7          	jalr	-1888(ra) # 80003414 <_ZN6Thread4joinEv>
    delete per;
    80001b7c:	00048a63          	beqz	s1,80001b90 <_Z4userPv+0x198>
    80001b80:	0004b783          	ld	a5,0(s1)
    80001b84:	0087b783          	ld	a5,8(a5)
    80001b88:	00048513          	mv	a0,s1
    80001b8c:	000780e7          	jalr	a5
//    delete s23;
//    printInt(KMemory::freeBlocksLeft);
//    printString("\n");
//    delete s31;
//    printInt(KMemory::freeBlocksLeft);
    printString("\n");
    80001b90:	00009517          	auipc	a0,0x9
    80001b94:	ac850513          	addi	a0,a0,-1336 # 8000a658 <CONSOLE_STATUS+0x648>
    80001b98:	00005097          	auipc	ra,0x5
    80001b9c:	8f4080e7          	jalr	-1804(ra) # 8000648c <_Z11printStringPKc>
}
    80001ba0:	02813083          	ld	ra,40(sp)
    80001ba4:	02013403          	ld	s0,32(sp)
    80001ba8:	01813483          	ld	s1,24(sp)
    80001bac:	01013903          	ld	s2,16(sp)
    80001bb0:	03010113          	addi	sp,sp,48
    80001bb4:	00008067          	ret
    80001bb8:	00050913          	mv	s2,a0
    nit1 = new Thread(f1, &end);
    80001bbc:	00048513          	mv	a0,s1
    80001bc0:	00001097          	auipc	ra,0x1
    80001bc4:	6a4080e7          	jalr	1700(ra) # 80003264 <_ZdlPv>
    80001bc8:	00090513          	mv	a0,s2
    80001bcc:	0000d097          	auipc	ra,0xd
    80001bd0:	84c080e7          	jalr	-1972(ra) # 8000e418 <_Unwind_Resume>
    80001bd4:	00050913          	mv	s2,a0
    nit2 = new Thread(f2, &end);
    80001bd8:	00048513          	mv	a0,s1
    80001bdc:	00001097          	auipc	ra,0x1
    80001be0:	688080e7          	jalr	1672(ra) # 80003264 <_ZdlPv>
    80001be4:	00090513          	mv	a0,s2
    80001be8:	0000d097          	auipc	ra,0xd
    80001bec:	830080e7          	jalr	-2000(ra) # 8000e418 <_Unwind_Resume>
    80001bf0:	00050913          	mv	s2,a0
    nit3 = new Thread(f3, &end);
    80001bf4:	00048513          	mv	a0,s1
    80001bf8:	00001097          	auipc	ra,0x1
    80001bfc:	66c080e7          	jalr	1644(ra) # 80003264 <_ZdlPv>
    80001c00:	00090513          	mv	a0,s2
    80001c04:	0000d097          	auipc	ra,0xd
    80001c08:	814080e7          	jalr	-2028(ra) # 8000e418 <_Unwind_Resume>
    80001c0c:	00050913          	mv	s2,a0
    PeriodicThread* per = new timer();
    80001c10:	00048513          	mv	a0,s1
    80001c14:	00001097          	auipc	ra,0x1
    80001c18:	650080e7          	jalr	1616(ra) # 80003264 <_ZdlPv>
    80001c1c:	00090513          	mv	a0,s2
    80001c20:	0000c097          	auipc	ra,0xc
    80001c24:	7f8080e7          	jalr	2040(ra) # 8000e418 <_Unwind_Resume>

0000000080001c28 <_Z5user2Pv>:

void user2(void*) {
    80001c28:	fb010113          	addi	sp,sp,-80
    80001c2c:	04113423          	sd	ra,72(sp)
    80001c30:	04813023          	sd	s0,64(sp)
    80001c34:	02913c23          	sd	s1,56(sp)
    80001c38:	03213823          	sd	s2,48(sp)
    80001c3c:	03313423          	sd	s3,40(sp)
    80001c40:	05010413          	addi	s0,sp,80
    Semaphore* s12, * s23, * s31;
    s12 = new Semaphore(0);
    80001c44:	01000513          	li	a0,16
    80001c48:	00001097          	auipc	ra,0x1
    80001c4c:	5cc080e7          	jalr	1484(ra) # 80003214 <_Znwm>
    80001c50:	00050993          	mv	s3,a0
    80001c54:	00000593          	li	a1,0
    80001c58:	00002097          	auipc	ra,0x2
    80001c5c:	928080e7          	jalr	-1752(ra) # 80003580 <_ZN9SemaphoreC1Ej>
    s23 = new Semaphore(0);
    80001c60:	01000513          	li	a0,16
    80001c64:	00001097          	auipc	ra,0x1
    80001c68:	5b0080e7          	jalr	1456(ra) # 80003214 <_Znwm>
    80001c6c:	00050913          	mv	s2,a0
    80001c70:	00000593          	li	a1,0
    80001c74:	00002097          	auipc	ra,0x2
    80001c78:	90c080e7          	jalr	-1780(ra) # 80003580 <_ZN9SemaphoreC1Ej>
    s31 = new Semaphore(1);
    80001c7c:	01000513          	li	a0,16
    80001c80:	00001097          	auipc	ra,0x1
    80001c84:	594080e7          	jalr	1428(ra) # 80003214 <_Znwm>
    80001c88:	00050493          	mv	s1,a0
    80001c8c:	00100593          	li	a1,1
    80001c90:	00002097          	auipc	ra,0x2
    80001c94:	8f0080e7          	jalr	-1808(ra) # 80003580 <_ZN9SemaphoreC1Ej>
    delete s12;
    80001c98:	00098a63          	beqz	s3,80001cac <_Z5user2Pv+0x84>
    80001c9c:	0009b783          	ld	a5,0(s3)
    80001ca0:	0087b783          	ld	a5,8(a5)
    80001ca4:	00098513          	mv	a0,s3
    80001ca8:	000780e7          	jalr	a5
    delete s23;
    80001cac:	00090a63          	beqz	s2,80001cc0 <_Z5user2Pv+0x98>
    80001cb0:	00093783          	ld	a5,0(s2)
    80001cb4:	0087b783          	ld	a5,8(a5)
    80001cb8:	00090513          	mv	a0,s2
    80001cbc:	000780e7          	jalr	a5
    delete s31;
    80001cc0:	00048a63          	beqz	s1,80001cd4 <_Z5user2Pv+0xac>
    80001cc4:	0004b783          	ld	a5,0(s1)
    80001cc8:	0087b783          	ld	a5,8(a5)
    80001ccc:	00048513          	mv	a0,s1
    80001cd0:	000780e7          	jalr	a5
    printString("\n");
    80001cd4:	00009517          	auipc	a0,0x9
    80001cd8:	98450513          	addi	a0,a0,-1660 # 8000a658 <CONSOLE_STATUS+0x648>
    80001cdc:	00004097          	auipc	ra,0x4
    80001ce0:	7b0080e7          	jalr	1968(ra) # 8000648c <_Z11printStringPKc>

    Thread t(f1, nullptr);
    80001ce4:	00000613          	li	a2,0
    80001ce8:	00000597          	auipc	a1,0x0
    80001cec:	c7458593          	addi	a1,a1,-908 # 8000195c <_Z2f1Pv>
    80001cf0:	fb040493          	addi	s1,s0,-80
    80001cf4:	00048513          	mv	a0,s1
    80001cf8:	00001097          	auipc	ra,0x1
    80001cfc:	63c080e7          	jalr	1596(ra) # 80003334 <_ZN6ThreadC1EPFvPvES0_>
    t.start();
    80001d00:	00048513          	mv	a0,s1
    80001d04:	00001097          	auipc	ra,0x1
    80001d08:	6c8080e7          	jalr	1736(ra) # 800033cc <_ZN6Thread5startEv>
    time_sleep(20);
    80001d0c:	01400513          	li	a0,20
    80001d10:	fffff097          	auipc	ra,0xfffff
    80001d14:	7f8080e7          	jalr	2040(ra) # 80001508 <_Z10time_sleepm>
    Thread* t2 = new Thread(f2,nullptr);
    80001d18:	02000513          	li	a0,32
    80001d1c:	00001097          	auipc	ra,0x1
    80001d20:	4f8080e7          	jalr	1272(ra) # 80003214 <_Znwm>
    80001d24:	00050493          	mv	s1,a0
    80001d28:	00000613          	li	a2,0
    80001d2c:	00000597          	auipc	a1,0x0
    80001d30:	c6c58593          	addi	a1,a1,-916 # 80001998 <_Z2f2Pv>
    80001d34:	00001097          	auipc	ra,0x1
    80001d38:	600080e7          	jalr	1536(ra) # 80003334 <_ZN6ThreadC1EPFvPvES0_>
    t2->start();
    80001d3c:	00048513          	mv	a0,s1
    80001d40:	00001097          	auipc	ra,0x1
    80001d44:	68c080e7          	jalr	1676(ra) # 800033cc <_ZN6Thread5startEv>
    t2->join();
    80001d48:	00048513          	mv	a0,s1
    80001d4c:	00001097          	auipc	ra,0x1
    80001d50:	6c8080e7          	jalr	1736(ra) # 80003414 <_ZN6Thread4joinEv>
    t.join();
    80001d54:	fb040513          	addi	a0,s0,-80
    80001d58:	00001097          	auipc	ra,0x1
    80001d5c:	6bc080e7          	jalr	1724(ra) # 80003414 <_ZN6Thread4joinEv>
    delete t2;
    80001d60:	00048a63          	beqz	s1,80001d74 <_Z5user2Pv+0x14c>
    80001d64:	0004b783          	ld	a5,0(s1)
    80001d68:	0087b783          	ld	a5,8(a5)
    80001d6c:	00048513          	mv	a0,s1
    80001d70:	000780e7          	jalr	a5
    printString("izlazim iz user 2\n");
    80001d74:	00008517          	auipc	a0,0x8
    80001d78:	2dc50513          	addi	a0,a0,732 # 8000a050 <CONSOLE_STATUS+0x40>
    80001d7c:	00004097          	auipc	ra,0x4
    80001d80:	710080e7          	jalr	1808(ra) # 8000648c <_Z11printStringPKc>
    Thread t(f1, nullptr);
    80001d84:	fb040513          	addi	a0,s0,-80
    80001d88:	00001097          	auipc	ra,0x1
    80001d8c:	3d8080e7          	jalr	984(ra) # 80003160 <_ZN6ThreadD1Ev>
    80001d90:	04813083          	ld	ra,72(sp)
    80001d94:	04013403          	ld	s0,64(sp)
    80001d98:	03813483          	ld	s1,56(sp)
    80001d9c:	03013903          	ld	s2,48(sp)
    80001da0:	02813983          	ld	s3,40(sp)
    80001da4:	05010113          	addi	sp,sp,80
    80001da8:	00008067          	ret
    80001dac:	00050493          	mv	s1,a0
    s12 = new Semaphore(0);
    80001db0:	00098513          	mv	a0,s3
    80001db4:	00001097          	auipc	ra,0x1
    80001db8:	4b0080e7          	jalr	1200(ra) # 80003264 <_ZdlPv>
    80001dbc:	00048513          	mv	a0,s1
    80001dc0:	0000c097          	auipc	ra,0xc
    80001dc4:	658080e7          	jalr	1624(ra) # 8000e418 <_Unwind_Resume>
    80001dc8:	00050493          	mv	s1,a0
    s23 = new Semaphore(0);
    80001dcc:	00090513          	mv	a0,s2
    80001dd0:	00001097          	auipc	ra,0x1
    80001dd4:	494080e7          	jalr	1172(ra) # 80003264 <_ZdlPv>
    80001dd8:	00048513          	mv	a0,s1
    80001ddc:	0000c097          	auipc	ra,0xc
    80001de0:	63c080e7          	jalr	1596(ra) # 8000e418 <_Unwind_Resume>
    80001de4:	00050913          	mv	s2,a0
    s31 = new Semaphore(1);
    80001de8:	00048513          	mv	a0,s1
    80001dec:	00001097          	auipc	ra,0x1
    80001df0:	478080e7          	jalr	1144(ra) # 80003264 <_ZdlPv>
    80001df4:	00090513          	mv	a0,s2
    80001df8:	0000c097          	auipc	ra,0xc
    80001dfc:	620080e7          	jalr	1568(ra) # 8000e418 <_Unwind_Resume>
    80001e00:	00050913          	mv	s2,a0
    Thread* t2 = new Thread(f2,nullptr);
    80001e04:	00048513          	mv	a0,s1
    80001e08:	00001097          	auipc	ra,0x1
    80001e0c:	45c080e7          	jalr	1116(ra) # 80003264 <_ZdlPv>
    Thread t(f1, nullptr);
    80001e10:	fb040513          	addi	a0,s0,-80
    80001e14:	00001097          	auipc	ra,0x1
    80001e18:	34c080e7          	jalr	844(ra) # 80003160 <_ZN6ThreadD1Ev>
    80001e1c:	00090513          	mv	a0,s2
    80001e20:	0000c097          	auipc	ra,0xc
    80001e24:	5f8080e7          	jalr	1528(ra) # 8000e418 <_Unwind_Resume>
    80001e28:	00050913          	mv	s2,a0
    80001e2c:	fe5ff06f          	j	80001e10 <_Z5user2Pv+0x1e8>

0000000080001e30 <_ZN5timer18periodicActivationEv>:
    void periodicActivation() override {
    80001e30:	fe010113          	addi	sp,sp,-32
    80001e34:	00113c23          	sd	ra,24(sp)
    80001e38:	00813823          	sd	s0,16(sp)
    80001e3c:	00913423          	sd	s1,8(sp)
    80001e40:	02010413          	addi	s0,sp,32
    80001e44:	00050493          	mv	s1,a0
        printString("Tajmer: ");
    80001e48:	00008517          	auipc	a0,0x8
    80001e4c:	22050513          	addi	a0,a0,544 # 8000a068 <CONSOLE_STATUS+0x58>
    80001e50:	00004097          	auipc	ra,0x4
    80001e54:	63c080e7          	jalr	1596(ra) # 8000648c <_Z11printStringPKc>
        printInt(counter++);
    80001e58:	0284a503          	lw	a0,40(s1)
    80001e5c:	0015079b          	addiw	a5,a0,1
    80001e60:	02f4a423          	sw	a5,40(s1)
    80001e64:	00000613          	li	a2,0
    80001e68:	00a00593          	li	a1,10
    80001e6c:	00004097          	auipc	ra,0x4
    80001e70:	7d0080e7          	jalr	2000(ra) # 8000663c <_Z8printIntiii>
        printString("\n");
    80001e74:	00008517          	auipc	a0,0x8
    80001e78:	7e450513          	addi	a0,a0,2020 # 8000a658 <CONSOLE_STATUS+0x648>
    80001e7c:	00004097          	auipc	ra,0x4
    80001e80:	610080e7          	jalr	1552(ra) # 8000648c <_Z11printStringPKc>
    }
    80001e84:	01813083          	ld	ra,24(sp)
    80001e88:	01013403          	ld	s0,16(sp)
    80001e8c:	00813483          	ld	s1,8(sp)
    80001e90:	02010113          	addi	sp,sp,32
    80001e94:	00008067          	ret

0000000080001e98 <_ZN5timerD1Ev>:
class timer : public PeriodicThread {
    80001e98:	ff010113          	addi	sp,sp,-16
    80001e9c:	00113423          	sd	ra,8(sp)
    80001ea0:	00813023          	sd	s0,0(sp)
    80001ea4:	01010413          	addi	s0,sp,16
private:
    sem_t myHandle;
};


class PeriodicThread : public Thread {
    80001ea8:	0000b797          	auipc	a5,0xb
    80001eac:	2587b783          	ld	a5,600(a5) # 8000d100 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001eb0:	01078793          	addi	a5,a5,16
    80001eb4:	00f53023          	sd	a5,0(a0)
    80001eb8:	00001097          	auipc	ra,0x1
    80001ebc:	2a8080e7          	jalr	680(ra) # 80003160 <_ZN6ThreadD1Ev>
    80001ec0:	00813083          	ld	ra,8(sp)
    80001ec4:	00013403          	ld	s0,0(sp)
    80001ec8:	01010113          	addi	sp,sp,16
    80001ecc:	00008067          	ret

0000000080001ed0 <_ZN5timerD0Ev>:
    80001ed0:	fe010113          	addi	sp,sp,-32
    80001ed4:	00113c23          	sd	ra,24(sp)
    80001ed8:	00813823          	sd	s0,16(sp)
    80001edc:	00913423          	sd	s1,8(sp)
    80001ee0:	02010413          	addi	s0,sp,32
    80001ee4:	00050493          	mv	s1,a0
    80001ee8:	0000b797          	auipc	a5,0xb
    80001eec:	2187b783          	ld	a5,536(a5) # 8000d100 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001ef0:	01078793          	addi	a5,a5,16
    80001ef4:	00f53023          	sd	a5,0(a0)
    80001ef8:	00001097          	auipc	ra,0x1
    80001efc:	268080e7          	jalr	616(ra) # 80003160 <_ZN6ThreadD1Ev>
    80001f00:	00048513          	mv	a0,s1
    80001f04:	00001097          	auipc	ra,0x1
    80001f08:	360080e7          	jalr	864(ra) # 80003264 <_ZdlPv>
    80001f0c:	01813083          	ld	ra,24(sp)
    80001f10:	01013403          	ld	s0,16(sp)
    80001f14:	00813483          	ld	s1,8(sp)
    80001f18:	02010113          	addi	sp,sp,32
    80001f1c:	00008067          	ret

0000000080001f20 <_ZN9Scheduler3putEP3TCB>:

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    80001f20:	ff010113          	addi	sp,sp,-16
    80001f24:	00813423          	sd	s0,8(sp)
    80001f28:	01010413          	addi	s0,sp,16
    if (tail == nullptr) {
    80001f2c:	0000b797          	auipc	a5,0xb
    80001f30:	36c7b783          	ld	a5,876(a5) # 8000d298 <_ZN9Scheduler4tailE>
    80001f34:	02078263          	beqz	a5,80001f58 <_ZN9Scheduler3putEP3TCB+0x38>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    80001f38:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    80001f3c:	0000b797          	auipc	a5,0xb
    80001f40:	34a7be23          	sd	a0,860(a5) # 8000d298 <_ZN9Scheduler4tailE>
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    static TCB* createThread(Body function, void* args, uint64* stack);

    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001f44:	00100793          	li	a5,1
    80001f48:	04f52c23          	sw	a5,88(a0)
    }
    tcb->setStatus(TCB::ACTIVE);
}
    80001f4c:	00813403          	ld	s0,8(sp)
    80001f50:	01010113          	addi	sp,sp,16
    80001f54:	00008067          	ret
        head = tail = tcb;
    80001f58:	0000b797          	auipc	a5,0xb
    80001f5c:	34078793          	addi	a5,a5,832 # 8000d298 <_ZN9Scheduler4tailE>
    80001f60:	00a7b023          	sd	a0,0(a5)
    80001f64:	00a7b423          	sd	a0,8(a5)
    80001f68:	fddff06f          	j	80001f44 <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001f6c <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001f6c:	ff010113          	addi	sp,sp,-16
    80001f70:	00813423          	sd	s0,8(sp)
    80001f74:	01010413          	addi	s0,sp,16
    TCB* firstThread = head;
    80001f78:	0000b717          	auipc	a4,0xb
    80001f7c:	32070713          	addi	a4,a4,800 # 8000d298 <_ZN9Scheduler4tailE>
    80001f80:	00873503          	ld	a0,8(a4)
    head = head->nextInScheduler;
    80001f84:	03053783          	ld	a5,48(a0)
    80001f88:	00f73423          	sd	a5,8(a4)
    if (head == nullptr) {
    80001f8c:	00078a63          	beqz	a5,80001fa0 <_ZN9Scheduler3getEv+0x34>
        tail = head = nullptr;
    }
    firstThread->nextInScheduler = nullptr;
    80001f90:	02053823          	sd	zero,48(a0)
    return firstThread;
}
    80001f94:	00813403          	ld	s0,8(sp)
    80001f98:	01010113          	addi	sp,sp,16
    80001f9c:	00008067          	ret
        tail = head = nullptr;
    80001fa0:	00073423          	sd	zero,8(a4)
    80001fa4:	00073023          	sd	zero,0(a4)
    80001fa8:	fe9ff06f          	j	80001f90 <_ZN9Scheduler3getEv+0x24>

0000000080001fac <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    80001fac:	ff010113          	addi	sp,sp,-16
    80001fb0:	00813423          	sd	s0,8(sp)
    80001fb4:	01010413          	addi	s0,sp,16
    tcb->status = TCB::SLEEPING;
    80001fb8:	00400793          	li	a5,4
    80001fbc:	04f52c23          	sw	a5,88(a0)
    if (sleepingHead == nullptr) {
    80001fc0:	0000b817          	auipc	a6,0xb
    80001fc4:	2e883803          	ld	a6,744(a6) # 8000d2a8 <_ZN9Scheduler12sleepingHeadE>
    80001fc8:	02080863          	beqz	a6,80001ff8 <_ZN9Scheduler10putToSleepEP3TCBm+0x4c>
        tcb->timeToSleep = sleepTime;
        return;
    }
    TCB* prevSleeping = nullptr;
    time_t accumulated = 0;
    TCB* current = sleepingHead;
    80001fcc:	00080793          	mv	a5,a6
    time_t accumulated = 0;
    80001fd0:	00000693          	li	a3,0
    TCB* prevSleeping = nullptr;
    80001fd4:	00000613          	li	a2,0
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001fd8:	02078863          	beqz	a5,80002008 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
    80001fdc:	0387b703          	ld	a4,56(a5)
    80001fe0:	00d70733          	add	a4,a4,a3
    80001fe4:	02b77263          	bgeu	a4,a1,80002008 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
        accumulated += current->timeToSleep;
    80001fe8:	00070693          	mv	a3,a4
        prevSleeping = current;
    80001fec:	00078613          	mv	a2,a5
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001ff0:	0407b783          	ld	a5,64(a5)
    80001ff4:	fe5ff06f          	j	80001fd8 <_ZN9Scheduler10putToSleepEP3TCBm+0x2c>
        sleepingHead = tcb;
    80001ff8:	0000b797          	auipc	a5,0xb
    80001ffc:	2aa7b823          	sd	a0,688(a5) # 8000d2a8 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80002000:	02b53c23          	sd	a1,56(a0)
        return;
    80002004:	02c0006f          	j	80002030 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    }
    if (!prevSleeping) {
    80002008:	02060a63          	beqz	a2,8000203c <_ZN9Scheduler10putToSleepEP3TCBm+0x90>
        sleepingHead = tcb;
        tcb->timeToSleep = sleepTime;
        tcb->nextSleeping->timeToSleep -= sleepTime;
        return;
    }
    tcb->nextSleeping = current;
    8000200c:	04f53023          	sd	a5,64(a0)
    prevSleeping->nextSleeping = tcb;
    80002010:	04a63023          	sd	a0,64(a2)
    tcb->timeToSleep = sleepTime - accumulated;
    80002014:	40d58733          	sub	a4,a1,a3
    80002018:	02e53c23          	sd	a4,56(a0)
    if (current) current->timeToSleep -= sleepTime - accumulated;
    8000201c:	00078a63          	beqz	a5,80002030 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    80002020:	40b686b3          	sub	a3,a3,a1
    80002024:	0387b703          	ld	a4,56(a5)
    80002028:	00d706b3          	add	a3,a4,a3
    8000202c:	02d7bc23          	sd	a3,56(a5)
}
    80002030:	00813403          	ld	s0,8(sp)
    80002034:	01010113          	addi	sp,sp,16
    80002038:	00008067          	ret
        tcb->nextSleeping = sleepingHead;
    8000203c:	05053023          	sd	a6,64(a0)
        sleepingHead = tcb;
    80002040:	0000b797          	auipc	a5,0xb
    80002044:	26a7b423          	sd	a0,616(a5) # 8000d2a8 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80002048:	02b53c23          	sd	a1,56(a0)
        tcb->nextSleeping->timeToSleep -= sleepTime;
    8000204c:	03883683          	ld	a3,56(a6)
    80002050:	40b686b3          	sub	a3,a3,a1
    80002054:	02d83c23          	sd	a3,56(a6)
        return;
    80002058:	fd9ff06f          	j	80002030 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>

000000008000205c <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
    if (!sleepingHead) return;
    8000205c:	0000b797          	auipc	a5,0xb
    80002060:	24c7b783          	ld	a5,588(a5) # 8000d2a8 <_ZN9Scheduler12sleepingHeadE>
    80002064:	06078a63          	beqz	a5,800020d8 <_ZN9Scheduler4wakeEv+0x7c>
    sleepingHead->timeToSleep--;
    80002068:	0387b703          	ld	a4,56(a5)
    8000206c:	fff70713          	addi	a4,a4,-1
    80002070:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80002074:	0000b517          	auipc	a0,0xb
    80002078:	23453503          	ld	a0,564(a0) # 8000d2a8 <_ZN9Scheduler12sleepingHeadE>
    8000207c:	04050e63          	beqz	a0,800020d8 <_ZN9Scheduler4wakeEv+0x7c>
    80002080:	03853783          	ld	a5,56(a0)
    80002084:	04079a63          	bnez	a5,800020d8 <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    80002088:	ff010113          	addi	sp,sp,-16
    8000208c:	00113423          	sd	ra,8(sp)
    80002090:	00813023          	sd	s0,0(sp)
    80002094:	01010413          	addi	s0,sp,16
    80002098:	00c0006f          	j	800020a4 <_ZN9Scheduler4wakeEv+0x48>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    8000209c:	03853783          	ld	a5,56(a0)
    800020a0:	02079463          	bnez	a5,800020c8 <_ZN9Scheduler4wakeEv+0x6c>
        TCB* thread = sleepingHead;
        sleepingHead = sleepingHead->nextSleeping;
    800020a4:	04053783          	ld	a5,64(a0)
    800020a8:	0000b717          	auipc	a4,0xb
    800020ac:	20f73023          	sd	a5,512(a4) # 8000d2a8 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    800020b0:	04053023          	sd	zero,64(a0)
        Scheduler::put(thread);
    800020b4:	00000097          	auipc	ra,0x0
    800020b8:	e6c080e7          	jalr	-404(ra) # 80001f20 <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    800020bc:	0000b517          	auipc	a0,0xb
    800020c0:	1ec53503          	ld	a0,492(a0) # 8000d2a8 <_ZN9Scheduler12sleepingHeadE>
    800020c4:	fc051ce3          	bnez	a0,8000209c <_ZN9Scheduler4wakeEv+0x40>
    }
}
    800020c8:	00813083          	ld	ra,8(sp)
    800020cc:	00013403          	ld	s0,0(sp)
    800020d0:	01010113          	addi	sp,sp,16
    800020d4:	00008067          	ret
    800020d8:	00008067          	ret

00000000800020dc <_ZN7KMemory7kmallocEm>:
    kmalloc(blocksForBitVector);

    initialized = true;
}

void* KMemory::kmalloc(size_t size) {
    800020dc:	ff010113          	addi	sp,sp,-16
    800020e0:	00813423          	sd	s0,8(sp)
    800020e4:	01010413          	addi	s0,sp,16
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    800020e8:	16050063          	beqz	a0,80002248 <_ZN7KMemory7kmallocEm+0x16c>
    800020ec:	0000b797          	auipc	a5,0xb
    800020f0:	1c47b783          	ld	a5,452(a5) # 8000d2b0 <_ZN7KMemory14freeBlocksLeftE>
    800020f4:	14a7ee63          	bltu	a5,a0,80002250 <_ZN7KMemory7kmallocEm+0x174>
    uint64 currentElem = 0;
    uint64 currentBit = 63;
    uint64 firstZeroElem = 0;
    uint64 firstZeroBit = 63;
    uint64 zerosFound = 0;
    bool zeroFound = false;
    800020f8:	00000313          	li	t1,0
    uint64 zerosFound = 0;
    800020fc:	00000713          	li	a4,0
    uint64 firstZeroBit = 63;
    80002100:	03f00813          	li	a6,63
    uint64 firstZeroElem = 0;
    80002104:	00000893          	li	a7,0
    uint64 currentBit = 63;
    80002108:	03f00793          	li	a5,63
    uint64 currentElem = 0;
    8000210c:	00000593          	li	a1,0
    80002110:	0080006f          	j	80002118 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroElem = currentElem;
        } else {
            zerosFound++;
        }
        if (zerosFound == size) break;
        if (currentBit-- == 0) {
    80002114:	00068793          	mv	a5,a3
    while (currentElem < sizeOfBitVectorInUint64) {
    80002118:	0000b697          	auipc	a3,0xb
    8000211c:	1a06b683          	ld	a3,416(a3) # 8000d2b8 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80002120:	08d5fa63          	bgeu	a1,a3,800021b4 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80002124:	03f00693          	li	a3,63
    80002128:	02d78a63          	beq	a5,a3,8000215c <_ZN7KMemory7kmallocEm+0x80>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    8000212c:	00359693          	slli	a3,a1,0x3
    80002130:	0000b617          	auipc	a2,0xb
    80002134:	19063603          	ld	a2,400(a2) # 8000d2c0 <_ZN7KMemory9bitVectorE>
    80002138:	00d606b3          	add	a3,a2,a3
    8000213c:	0006b683          	ld	a3,0(a3)
    //adresa pocetka bit vektora (HEAP_START_ADDR)
    static uint64* bitVector;



    //maska sa 1 na mestu bitPos i ostalim nulama (bitPos=0..63)
    80002140:	00100613          	li	a2,1
    80002144:	00f61633          	sll	a2,a2,a5
    80002148:	00c6f6b3          	and	a3,a3,a2
        if (bit > 0) {
    8000214c:	02069a63          	bnez	a3,80002180 <_ZN7KMemory7kmallocEm+0xa4>
        } else if (!zeroFound) {
    80002150:	04030863          	beqz	t1,800021a0 <_ZN7KMemory7kmallocEm+0xc4>
            zerosFound++;
    80002154:	00170713          	addi	a4,a4,1
    80002158:	0300006f          	j	80002188 <_ZN7KMemory7kmallocEm+0xac>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    8000215c:	00359693          	slli	a3,a1,0x3
    80002160:	0000b617          	auipc	a2,0xb
    80002164:	16063603          	ld	a2,352(a2) # 8000d2c0 <_ZN7KMemory9bitVectorE>
    80002168:	00d606b3          	add	a3,a2,a3
    8000216c:	0006b603          	ld	a2,0(a3)
    80002170:	fff00693          	li	a3,-1
    80002174:	fad61ce3          	bne	a2,a3,8000212c <_ZN7KMemory7kmallocEm+0x50>
            currentElem++;
    80002178:	00158593          	addi	a1,a1,1
            continue;
    8000217c:	f9dff06f          	j	80002118 <_ZN7KMemory7kmallocEm+0x3c>
            zeroFound = false;
    80002180:	00000313          	li	t1,0
            zerosFound = 0;
    80002184:	00000713          	li	a4,0
        if (zerosFound == size) break;
    80002188:	02a70663          	beq	a4,a0,800021b4 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit-- == 0) {
    8000218c:	fff78693          	addi	a3,a5,-1
    80002190:	f80792e3          	bnez	a5,80002114 <_ZN7KMemory7kmallocEm+0x38>
            currentBit = 63;
            currentElem++;
    80002194:	00158593          	addi	a1,a1,1
            currentBit = 63;
    80002198:	03f00793          	li	a5,63
    8000219c:	f7dff06f          	j	80002118 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroBit = currentBit;
    800021a0:	00078813          	mv	a6,a5
            firstZeroElem = currentElem;
    800021a4:	00058893          	mv	a7,a1
            zeroFound = true;
    800021a8:	00100313          	li	t1,1
            zerosFound = 1;
    800021ac:	00100713          	li	a4,1
    800021b0:	fd9ff06f          	j	80002188 <_ZN7KMemory7kmallocEm+0xac>
        }
    }
    if (zerosFound != size) return nullptr;
    800021b4:	0aa71263          	bne	a4,a0,80002258 <_ZN7KMemory7kmallocEm+0x17c>

    //alociranje blokova
    uint64 blockNum = firstZeroElem * 64 + (63 - firstZeroBit);
    800021b8:	00689793          	slli	a5,a7,0x6
    800021bc:	410787b3          	sub	a5,a5,a6
    800021c0:	03f78793          	addi	a5,a5,63
    void* addr = (char*)HEAP_START_ADDR + blockNum * MEM_BLOCK_SIZE;
    800021c4:	0000b697          	auipc	a3,0xb
    800021c8:	f346b683          	ld	a3,-204(a3) # 8000d0f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800021cc:	0006b583          	ld	a1,0(a3)
    800021d0:	00679793          	slli	a5,a5,0x6
    800021d4:	00f585b3          	add	a1,a1,a5
    *(uint64*)addr = size;  //da znamo koliko blokova je alocirano zaredom
    800021d8:	00a5b023          	sd	a0,0(a1)

    //upisivanje 1 u bit vektor
    currentElem = firstZeroElem;
    currentBit = firstZeroBit;
    800021dc:	0080006f          	j	800021e4 <_ZN7KMemory7kmallocEm+0x108>
    while (zerosFound > 0) {
        bitVector[currentElem] |= maskBit(currentBit);
        zerosFound--;
        if (currentBit-- == 0) {
            currentBit = 63;
    800021e0:	00078813          	mv	a6,a5
    while (zerosFound > 0) {
    800021e4:	04070063          	beqz	a4,80002224 <_ZN7KMemory7kmallocEm+0x148>
    800021e8:	00100693          	li	a3,1
    800021ec:	01069633          	sll	a2,a3,a6
        bitVector[currentElem] |= maskBit(currentBit);
    800021f0:	00389793          	slli	a5,a7,0x3
    800021f4:	0000b697          	auipc	a3,0xb
    800021f8:	0cc6b683          	ld	a3,204(a3) # 8000d2c0 <_ZN7KMemory9bitVectorE>
    800021fc:	00f687b3          	add	a5,a3,a5
    80002200:	0007b683          	ld	a3,0(a5)
    80002204:	00c6e6b3          	or	a3,a3,a2
    80002208:	00d7b023          	sd	a3,0(a5)
        zerosFound--;
    8000220c:	fff70713          	addi	a4,a4,-1
        if (currentBit-- == 0) {
    80002210:	fff80793          	addi	a5,a6,-1
    80002214:	fc0816e3          	bnez	a6,800021e0 <_ZN7KMemory7kmallocEm+0x104>
            currentElem++;
    80002218:	00188893          	addi	a7,a7,1
            currentBit = 63;
    8000221c:	03f00793          	li	a5,63
    80002220:	fc1ff06f          	j	800021e0 <_ZN7KMemory7kmallocEm+0x104>
        }
    }
    freeBlocksLeft -= size;
    80002224:	0000b717          	auipc	a4,0xb
    80002228:	08c70713          	addi	a4,a4,140 # 8000d2b0 <_ZN7KMemory14freeBlocksLeftE>
    8000222c:	00073783          	ld	a5,0(a4)
    80002230:	40a78533          	sub	a0,a5,a0
    80002234:	00a73023          	sd	a0,0(a4)
    return (char*)addr + 2 * sizeof(uint64);    //offset 2 da bi bilo zaokruzeno na 16 zbog steka
    80002238:	01058513          	addi	a0,a1,16
}
    8000223c:	00813403          	ld	s0,8(sp)
    80002240:	01010113          	addi	sp,sp,16
    80002244:	00008067          	ret
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80002248:	00000513          	li	a0,0
    8000224c:	ff1ff06f          	j	8000223c <_ZN7KMemory7kmallocEm+0x160>
    80002250:	00000513          	li	a0,0
    80002254:	fe9ff06f          	j	8000223c <_ZN7KMemory7kmallocEm+0x160>
    if (zerosFound != size) return nullptr;
    80002258:	00000513          	li	a0,0
    8000225c:	fe1ff06f          	j	8000223c <_ZN7KMemory7kmallocEm+0x160>

0000000080002260 <_ZN7KMemory16initializeMemoryEv>:
    if (initialized) return;
    80002260:	0000b797          	auipc	a5,0xb
    80002264:	0687c783          	lbu	a5,104(a5) # 8000d2c8 <_ZN7KMemory11initializedE>
    80002268:	0a079863          	bnez	a5,80002318 <_ZN7KMemory16initializeMemoryEv+0xb8>
void KMemory::initializeMemory() {
    8000226c:	ff010113          	addi	sp,sp,-16
    80002270:	00113423          	sd	ra,8(sp)
    80002274:	00813023          	sd	s0,0(sp)
    80002278:	01010413          	addi	s0,sp,16
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    8000227c:	0000b797          	auipc	a5,0xb
    80002280:	ed47b783          	ld	a5,-300(a5) # 8000d150 <_GLOBAL_OFFSET_TABLE_+0x88>
    80002284:	0007b783          	ld	a5,0(a5)
    80002288:	0000b717          	auipc	a4,0xb
    8000228c:	e7073703          	ld	a4,-400(a4) # 8000d0f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002290:	00073603          	ld	a2,0(a4)
    80002294:	40c787b3          	sub	a5,a5,a2
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    80002298:	00c7d793          	srli	a5,a5,0xc
    8000229c:	0000b717          	auipc	a4,0xb
    800022a0:	01470713          	addi	a4,a4,20 # 8000d2b0 <_ZN7KMemory14freeBlocksLeftE>
    800022a4:	00f73423          	sd	a5,8(a4)
    numOfBlocks = sizeOfBitVectorInUint64 * sizeof(uint64) * 8; //da se zaokruzi broj postojecih blokova na umnozak 64
    800022a8:	00679693          	slli	a3,a5,0x6
    800022ac:	02d73023          	sd	a3,32(a4)
    uint64 blocksForBitVector = (sizeOfBitVectorInUint64 * sizeof(uint64) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    800022b0:	00878513          	addi	a0,a5,8
    800022b4:	00351513          	slli	a0,a0,0x3
    800022b8:	fff50513          	addi	a0,a0,-1
    800022bc:	00655513          	srli	a0,a0,0x6
    bitVector = (uint64*)HEAP_START_ADDR;
    800022c0:	00c73823          	sd	a2,16(a4)
    freeBlocksLeft = numOfBlocks;
    800022c4:	00d73023          	sd	a3,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    800022c8:	00000793          	li	a5,0
    800022cc:	0000b717          	auipc	a4,0xb
    800022d0:	fec73703          	ld	a4,-20(a4) # 8000d2b8 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    800022d4:	02e7f063          	bgeu	a5,a4,800022f4 <_ZN7KMemory16initializeMemoryEv+0x94>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    800022d8:	00379693          	slli	a3,a5,0x3
    800022dc:	0000b717          	auipc	a4,0xb
    800022e0:	fe473703          	ld	a4,-28(a4) # 8000d2c0 <_ZN7KMemory9bitVectorE>
    800022e4:	00d70733          	add	a4,a4,a3
    800022e8:	00073023          	sd	zero,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    800022ec:	00178793          	addi	a5,a5,1
    800022f0:	fddff06f          	j	800022cc <_ZN7KMemory16initializeMemoryEv+0x6c>
    kmalloc(blocksForBitVector);
    800022f4:	00000097          	auipc	ra,0x0
    800022f8:	de8080e7          	jalr	-536(ra) # 800020dc <_ZN7KMemory7kmallocEm>
    initialized = true;
    800022fc:	00100793          	li	a5,1
    80002300:	0000b717          	auipc	a4,0xb
    80002304:	fcf70423          	sb	a5,-56(a4) # 8000d2c8 <_ZN7KMemory11initializedE>
}
    80002308:	00813083          	ld	ra,8(sp)
    8000230c:	00013403          	ld	s0,0(sp)
    80002310:	01010113          	addi	sp,sp,16
    80002314:	00008067          	ret
    80002318:	00008067          	ret

000000008000231c <_ZN7KMemory5kfreeEPv>:

int KMemory::kfree(void* ptr) {
    8000231c:	ff010113          	addi	sp,sp,-16
    80002320:	00813423          	sd	s0,8(sp)
    80002324:	01010413          	addi	s0,sp,16
    if (!ptr) return 0;
    80002328:	08050a63          	beqz	a0,800023bc <_ZN7KMemory5kfreeEPv+0xa0>
    ptr = (char*)ptr - 2 * sizeof(uint64);
    8000232c:	ff050793          	addi	a5,a0,-16
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80002330:	0000b717          	auipc	a4,0xb
    80002334:	dc873703          	ld	a4,-568(a4) # 8000d0f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002338:	00073703          	ld	a4,0(a4)
    8000233c:	40e787b3          	sub	a5,a5,a4
    80002340:	03f7f713          	andi	a4,a5,63
    80002344:	08071063          	bnez	a4,800023c4 <_ZN7KMemory5kfreeEPv+0xa8>
    uint64 blocksToFree = *(uint64*)ptr;
    80002348:	ff053583          	ld	a1,-16(a0)
    freeBlocksLeft += blocksToFree;
    8000234c:	0000b697          	auipc	a3,0xb
    80002350:	f6468693          	addi	a3,a3,-156 # 8000d2b0 <_ZN7KMemory14freeBlocksLeftE>
    80002354:	0006b703          	ld	a4,0(a3)
    80002358:	00b70733          	add	a4,a4,a1
    8000235c:	00e6b023          	sd	a4,0(a3)
    uint64 blockNum = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    80002360:	0067d613          	srli	a2,a5,0x6
    uint64 currentElem = blockNum / 64;
    80002364:	00c7d513          	srli	a0,a5,0xc
    uint64 currentBit = 63 - blockNum % 64;
    80002368:	fff64613          	not	a2,a2
    8000236c:	03f67613          	andi	a2,a2,63
    80002370:	0080006f          	j	80002378 <_ZN7KMemory5kfreeEPv+0x5c>
    while (blocksToFree > 0) {
        bitVector[currentElem] &= ~maskBit(currentBit);
        blocksToFree--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80002374:	00078613          	mv	a2,a5
    while (blocksToFree > 0) {
    80002378:	04058a63          	beqz	a1,800023cc <_ZN7KMemory5kfreeEPv+0xb0>
    8000237c:	00100793          	li	a5,1
    80002380:	00c797b3          	sll	a5,a5,a2
        bitVector[currentElem] &= ~maskBit(currentBit);
    80002384:	fff7c793          	not	a5,a5
    80002388:	00351713          	slli	a4,a0,0x3
    8000238c:	0000b697          	auipc	a3,0xb
    80002390:	f346b683          	ld	a3,-204(a3) # 8000d2c0 <_ZN7KMemory9bitVectorE>
    80002394:	00e68733          	add	a4,a3,a4
    80002398:	00073683          	ld	a3,0(a4)
    8000239c:	00f6f7b3          	and	a5,a3,a5
    800023a0:	00f73023          	sd	a5,0(a4)
        blocksToFree--;
    800023a4:	fff58593          	addi	a1,a1,-1
        if (currentBit-- == 0) {
    800023a8:	fff60793          	addi	a5,a2,-1
    800023ac:	fc0614e3          	bnez	a2,80002374 <_ZN7KMemory5kfreeEPv+0x58>
            currentElem++;
    800023b0:	00150513          	addi	a0,a0,1
            currentBit = 63;
    800023b4:	03f00793          	li	a5,63
    800023b8:	fbdff06f          	j	80002374 <_ZN7KMemory5kfreeEPv+0x58>
    if (!ptr) return 0;
    800023bc:	00000513          	li	a0,0
    800023c0:	0100006f          	j	800023d0 <_ZN7KMemory5kfreeEPv+0xb4>
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    800023c4:	fff00513          	li	a0,-1
    800023c8:	0080006f          	j	800023d0 <_ZN7KMemory5kfreeEPv+0xb4>
        }
    }
    return 0;
    800023cc:	00000513          	li	a0,0
}
    800023d0:	00813403          	ld	s0,8(sp)
    800023d4:	01010113          	addi	sp,sp,16
    800023d8:	00008067          	ret

00000000800023dc <main>:

void userMain();

void user(void*);
void user2(void*);
int main() {
    800023dc:	fc010113          	addi	sp,sp,-64
    800023e0:	02113c23          	sd	ra,56(sp)
    800023e4:	02813823          	sd	s0,48(sp)
    800023e8:	02913423          	sd	s1,40(sp)
    800023ec:	03213023          	sd	s2,32(sp)
    800023f0:	01313c23          	sd	s3,24(sp)
    800023f4:	04010413          	addi	s0,sp,64
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    800023f8:	0000b797          	auipc	a5,0xb
    800023fc:	d607b783          	ld	a5,-672(a5) # 8000d158 <_GLOBAL_OFFSET_TABLE_+0x90>
    80002400:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80002404:	00000097          	auipc	ra,0x0
    80002408:	e5c080e7          	jalr	-420(ra) # 80002260 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    8000240c:	fffff097          	auipc	ra,0xfffff
    80002410:	300080e7          	jalr	768(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>

    //pravljenje niti
    thread_t mainHandle;
    Thread* idleHandle = new IdleThread();
    80002414:	02000513          	li	a0,32
    80002418:	00001097          	auipc	ra,0x1
    8000241c:	dfc080e7          	jalr	-516(ra) # 80003214 <_Znwm>
    80002420:	00050913          	mv	s2,a0
    80002424:	00053023          	sd	zero,0(a0)
    80002428:	00053423          	sd	zero,8(a0)
    8000242c:	00053823          	sd	zero,16(a0)
    80002430:	00053c23          	sd	zero,24(a0)
class IdleThread : public Thread {
    80002434:	00001097          	auipc	ra,0x1
    80002438:	0d0080e7          	jalr	208(ra) # 80003504 <_ZN6ThreadC1Ev>
    8000243c:	0000b797          	auipc	a5,0xb
    80002440:	a2c78793          	addi	a5,a5,-1492 # 8000ce68 <_ZTV10IdleThread+0x10>
    80002444:	00f93023          	sd	a5,0(s2)
    Thread* consoleOutputHandle = new KernelConsumer();
    80002448:	02000513          	li	a0,32
    8000244c:	00001097          	auipc	ra,0x1
    80002450:	dc8080e7          	jalr	-568(ra) # 80003214 <_Znwm>
    80002454:	00050493          	mv	s1,a0
    80002458:	00053023          	sd	zero,0(a0)
    8000245c:	00053423          	sd	zero,8(a0)
    80002460:	00053823          	sd	zero,16(a0)
    80002464:	00053c23          	sd	zero,24(a0)
class KernelConsumer : public Thread {
    80002468:	00001097          	auipc	ra,0x1
    8000246c:	09c080e7          	jalr	156(ra) # 80003504 <_ZN6ThreadC1Ev>
    80002470:	0000b797          	auipc	a5,0xb
    80002474:	a2078793          	addi	a5,a5,-1504 # 8000ce90 <_ZTV14KernelConsumer+0x10>
    80002478:	00f4b023          	sd	a5,0(s1)
    //Thread* userThr = new Thread((TCB::Body)userMain, nullptr);
    Thread* userThr = new Thread(user2, nullptr);
    8000247c:	02000513          	li	a0,32
    80002480:	00001097          	auipc	ra,0x1
    80002484:	d94080e7          	jalr	-620(ra) # 80003214 <_Znwm>
    80002488:	00050993          	mv	s3,a0
    8000248c:	00000613          	li	a2,0
    80002490:	0000b597          	auipc	a1,0xb
    80002494:	ca05b583          	ld	a1,-864(a1) # 8000d130 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002498:	00001097          	auipc	ra,0x1
    8000249c:	e9c080e7          	jalr	-356(ra) # 80003334 <_ZN6ThreadC1EPFvPvES0_>
    800024a0:	0580006f          	j	800024f8 <main+0x11c>
    800024a4:	00050493          	mv	s1,a0
    Thread* idleHandle = new IdleThread();
    800024a8:	00090513          	mv	a0,s2
    800024ac:	00001097          	auipc	ra,0x1
    800024b0:	db8080e7          	jalr	-584(ra) # 80003264 <_ZdlPv>
    800024b4:	00048513          	mv	a0,s1
    800024b8:	0000c097          	auipc	ra,0xc
    800024bc:	f60080e7          	jalr	-160(ra) # 8000e418 <_Unwind_Resume>
    800024c0:	00050913          	mv	s2,a0
    Thread* consoleOutputHandle = new KernelConsumer();
    800024c4:	00048513          	mv	a0,s1
    800024c8:	00001097          	auipc	ra,0x1
    800024cc:	d9c080e7          	jalr	-612(ra) # 80003264 <_ZdlPv>
    800024d0:	00090513          	mv	a0,s2
    800024d4:	0000c097          	auipc	ra,0xc
    800024d8:	f44080e7          	jalr	-188(ra) # 8000e418 <_Unwind_Resume>
    800024dc:	00050493          	mv	s1,a0
    Thread* userThr = new Thread(user2, nullptr);
    800024e0:	00098513          	mv	a0,s3
    800024e4:	00001097          	auipc	ra,0x1
    800024e8:	d80080e7          	jalr	-640(ra) # 80003264 <_ZdlPv>
    800024ec:	00048513          	mv	a0,s1
    800024f0:	0000c097          	auipc	ra,0xc
    800024f4:	f28080e7          	jalr	-216(ra) # 8000e418 <_Unwind_Resume>
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    800024f8:	00000613          	li	a2,0
    800024fc:	00000597          	auipc	a1,0x0
    80002500:	ee058593          	addi	a1,a1,-288 # 800023dc <main>
    80002504:	fc840513          	addi	a0,s0,-56
    80002508:	fffff097          	auipc	ra,0xfffff
    8000250c:	efc080e7          	jalr	-260(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80002510:	fc843783          	ld	a5,-56(s0)

    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }
    80002514:	0000b717          	auipc	a4,0xb
    80002518:	c3473703          	ld	a4,-972(a4) # 8000d148 <_GLOBAL_OFFSET_TABLE_+0x80>
    8000251c:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80002520:	00100713          	li	a4,1
    80002524:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    idleHandle->start();
    80002528:	00090513          	mv	a0,s2
    8000252c:	00001097          	auipc	ra,0x1
    80002530:	ea0080e7          	jalr	-352(ra) # 800033cc <_ZN6Thread5startEv>
    consoleOutputHandle->start();
    80002534:	00048513          	mv	a0,s1
    80002538:	00001097          	auipc	ra,0x1
    8000253c:	e94080e7          	jalr	-364(ra) # 800033cc <_ZN6Thread5startEv>
    userThr->start();
    80002540:	00098513          	mv	a0,s3
    80002544:	00001097          	auipc	ra,0x1
    80002548:	e88080e7          	jalr	-376(ra) # 800033cc <_ZN6Thread5startEv>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    8000254c:	00200493          	li	s1,2
    80002550:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    userThr->join();
    80002554:	00098513          	mv	a0,s3
    80002558:	00001097          	auipc	ra,0x1
    8000255c:	ebc080e7          	jalr	-324(ra) # 80003414 <_ZN6Thread4joinEv>
    //stavlja karakter u ulazni bafer; ako je bafer pun, ignorise se
    static void placeInInput(char c);

    //ispis svih preostalih karaktera u izlaznom baferu
    static void flush() {
        __asm__ volatile("li a0, 0x43");
    80002560:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80002564:	00000073          	ecall
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002568:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    8000256c:	00000513          	li	a0,0
    80002570:	03813083          	ld	ra,56(sp)
    80002574:	03013403          	ld	s0,48(sp)
    80002578:	02813483          	ld	s1,40(sp)
    8000257c:	02013903          	ld	s2,32(sp)
    80002580:	01813983          	ld	s3,24(sp)
    80002584:	04010113          	addi	sp,sp,64
    80002588:	00008067          	ret

000000008000258c <_ZN10IdleThread3runEv>:
    void run() override {
    8000258c:	ff010113          	addi	sp,sp,-16
    80002590:	00113423          	sd	ra,8(sp)
    80002594:	00813023          	sd	s0,0(sp)
    80002598:	01010413          	addi	s0,sp,16
        while (1) { thread_dispatch(); }
    8000259c:	fffff097          	auipc	ra,0xfffff
    800025a0:	f24080e7          	jalr	-220(ra) # 800014c0 <_Z15thread_dispatchv>
    800025a4:	ff9ff06f          	j	8000259c <_ZN10IdleThread3runEv+0x10>

00000000800025a8 <_ZN10IdleThreadD1Ev>:
class IdleThread : public Thread {
    800025a8:	ff010113          	addi	sp,sp,-16
    800025ac:	00113423          	sd	ra,8(sp)
    800025b0:	00813023          	sd	s0,0(sp)
    800025b4:	01010413          	addi	s0,sp,16
    800025b8:	0000b797          	auipc	a5,0xb
    800025bc:	8b078793          	addi	a5,a5,-1872 # 8000ce68 <_ZTV10IdleThread+0x10>
    800025c0:	00f53023          	sd	a5,0(a0)
    800025c4:	00001097          	auipc	ra,0x1
    800025c8:	b9c080e7          	jalr	-1124(ra) # 80003160 <_ZN6ThreadD1Ev>
    800025cc:	00813083          	ld	ra,8(sp)
    800025d0:	00013403          	ld	s0,0(sp)
    800025d4:	01010113          	addi	sp,sp,16
    800025d8:	00008067          	ret

00000000800025dc <_ZN10IdleThreadD0Ev>:
    800025dc:	fe010113          	addi	sp,sp,-32
    800025e0:	00113c23          	sd	ra,24(sp)
    800025e4:	00813823          	sd	s0,16(sp)
    800025e8:	00913423          	sd	s1,8(sp)
    800025ec:	02010413          	addi	s0,sp,32
    800025f0:	00050493          	mv	s1,a0
    800025f4:	0000b797          	auipc	a5,0xb
    800025f8:	87478793          	addi	a5,a5,-1932 # 8000ce68 <_ZTV10IdleThread+0x10>
    800025fc:	00f53023          	sd	a5,0(a0)
    80002600:	00001097          	auipc	ra,0x1
    80002604:	b60080e7          	jalr	-1184(ra) # 80003160 <_ZN6ThreadD1Ev>
    80002608:	00048513          	mv	a0,s1
    8000260c:	00001097          	auipc	ra,0x1
    80002610:	c58080e7          	jalr	-936(ra) # 80003264 <_ZdlPv>
    80002614:	01813083          	ld	ra,24(sp)
    80002618:	01013403          	ld	s0,16(sp)
    8000261c:	00813483          	ld	s1,8(sp)
    80002620:	02010113          	addi	sp,sp,32
    80002624:	00008067          	ret

0000000080002628 <_ZN14KernelConsumerD1Ev>:
class KernelConsumer : public Thread {
    80002628:	ff010113          	addi	sp,sp,-16
    8000262c:	00113423          	sd	ra,8(sp)
    80002630:	00813023          	sd	s0,0(sp)
    80002634:	01010413          	addi	s0,sp,16
    80002638:	0000b797          	auipc	a5,0xb
    8000263c:	85878793          	addi	a5,a5,-1960 # 8000ce90 <_ZTV14KernelConsumer+0x10>
    80002640:	00f53023          	sd	a5,0(a0)
    80002644:	00001097          	auipc	ra,0x1
    80002648:	b1c080e7          	jalr	-1252(ra) # 80003160 <_ZN6ThreadD1Ev>
    8000264c:	00813083          	ld	ra,8(sp)
    80002650:	00013403          	ld	s0,0(sp)
    80002654:	01010113          	addi	sp,sp,16
    80002658:	00008067          	ret

000000008000265c <_ZN14KernelConsumerD0Ev>:
    8000265c:	fe010113          	addi	sp,sp,-32
    80002660:	00113c23          	sd	ra,24(sp)
    80002664:	00813823          	sd	s0,16(sp)
    80002668:	00913423          	sd	s1,8(sp)
    8000266c:	02010413          	addi	s0,sp,32
    80002670:	00050493          	mv	s1,a0
    80002674:	0000b797          	auipc	a5,0xb
    80002678:	81c78793          	addi	a5,a5,-2020 # 8000ce90 <_ZTV14KernelConsumer+0x10>
    8000267c:	00f53023          	sd	a5,0(a0)
    80002680:	00001097          	auipc	ra,0x1
    80002684:	ae0080e7          	jalr	-1312(ra) # 80003160 <_ZN6ThreadD1Ev>
    80002688:	00048513          	mv	a0,s1
    8000268c:	00001097          	auipc	ra,0x1
    80002690:	bd8080e7          	jalr	-1064(ra) # 80003264 <_ZdlPv>
    80002694:	01813083          	ld	ra,24(sp)
    80002698:	01013403          	ld	s0,16(sp)
    8000269c:	00813483          	ld	s1,8(sp)
    800026a0:	02010113          	addi	sp,sp,32
    800026a4:	00008067          	ret

00000000800026a8 <_ZN14KernelConsumer3runEv>:
    void run() override {
    800026a8:	ff010113          	addi	sp,sp,-16
    800026ac:	00113423          	sd	ra,8(sp)
    800026b0:	00813023          	sd	s0,0(sp)
    800026b4:	01010413          	addi	s0,sp,16
    800026b8:	0280006f          	j	800026e0 <_ZN14KernelConsumer3runEv+0x38>

    static uint8 getSRvalue() { return *sr; }

    static uint8 getDRvalue() { return *dr; }

    static void setDRvalue(char c) { *dr = c; }
    800026bc:	0000b797          	auipc	a5,0xb
    800026c0:	a6c7b783          	ld	a5,-1428(a5) # 8000d128 <_GLOBAL_OFFSET_TABLE_+0x60>
    800026c4:	0007b783          	ld	a5,0(a5)
    800026c8:	00a78023          	sb	a0,0(a5)
            sem_signal(KConsole::getOutputBufferHasSpace());
    800026cc:	0000b797          	auipc	a5,0xb
    800026d0:	a747b783          	ld	a5,-1420(a5) # 8000d140 <_GLOBAL_OFFSET_TABLE_+0x78>
    800026d4:	0007b503          	ld	a0,0(a5)
    800026d8:	fffff097          	auipc	ra,0xfffff
    800026dc:	ef8080e7          	jalr	-264(ra) # 800015d0 <_Z10sem_signalP4KSem>
            char c = KConsole::getFromOutput();
    800026e0:	fffff097          	auipc	ra,0xfffff
    800026e4:	0e4080e7          	jalr	228(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    800026e8:	0000b797          	auipc	a5,0xb
    800026ec:	a907b783          	ld	a5,-1392(a5) # 8000d178 <_GLOBAL_OFFSET_TABLE_+0xb0>
    800026f0:	0007b783          	ld	a5,0(a5)
    800026f4:	0007c783          	lbu	a5,0(a5)
            while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    800026f8:	0207f793          	andi	a5,a5,32
    800026fc:	fe0786e3          	beqz	a5,800026e8 <_ZN14KernelConsumer3runEv+0x40>
    80002700:	fbdff06f          	j	800026bc <_ZN14KernelConsumer3runEv+0x14>

0000000080002704 <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80002704:	ff010113          	addi	sp,sp,-16
    80002708:	00113423          	sd	ra,8(sp)
    8000270c:	00813023          	sd	s0,0(sp)
    80002710:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80002714:	fffff097          	auipc	ra,0xfffff
    80002718:	dac080e7          	jalr	-596(ra) # 800014c0 <_Z15thread_dispatchv>
    8000271c:	ff9ff06f          	j	80002714 <_Z4idlePv+0x10>

0000000080002720 <_Z22kernelConsumerFunctionPv>:
}

//salje na izlaz karakter iz izlaznog bafera KConsole
void kernelConsumerFunction(void*) {
    80002720:	ff010113          	addi	sp,sp,-16
    80002724:	00113423          	sd	ra,8(sp)
    80002728:	00813023          	sd	s0,0(sp)
    8000272c:	01010413          	addi	s0,sp,16
    80002730:	0280006f          	j	80002758 <_Z22kernelConsumerFunctionPv+0x38>
    static void setDRvalue(char c) { *dr = c; }
    80002734:	0000b797          	auipc	a5,0xb
    80002738:	9f47b783          	ld	a5,-1548(a5) # 8000d128 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000273c:	0007b783          	ld	a5,0(a5)
    80002740:	00a78023          	sb	a0,0(a5)
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
        KConsole::setDRvalue(c);
        sem_signal(KConsole::getOutputBufferHasSpace());
    80002744:	0000b797          	auipc	a5,0xb
    80002748:	9fc7b783          	ld	a5,-1540(a5) # 8000d140 <_GLOBAL_OFFSET_TABLE_+0x78>
    8000274c:	0007b503          	ld	a0,0(a5)
    80002750:	fffff097          	auipc	ra,0xfffff
    80002754:	e80080e7          	jalr	-384(ra) # 800015d0 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80002758:	fffff097          	auipc	ra,0xfffff
    8000275c:	06c080e7          	jalr	108(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    80002760:	0000b797          	auipc	a5,0xb
    80002764:	a187b783          	ld	a5,-1512(a5) # 8000d178 <_GLOBAL_OFFSET_TABLE_+0xb0>
    80002768:	0007b783          	ld	a5,0(a5)
    8000276c:	0007c783          	lbu	a5,0(a5)
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80002770:	0207f793          	andi	a5,a5,32
    80002774:	fe0786e3          	beqz	a5,80002760 <_Z22kernelConsumerFunctionPv+0x40>
    80002778:	fbdff06f          	j	80002734 <_Z22kernelConsumerFunctionPv+0x14>

000000008000277c <_Z5main1v>:
    }
}

int main1() {
    8000277c:	fc010113          	addi	sp,sp,-64
    80002780:	02113c23          	sd	ra,56(sp)
    80002784:	02813823          	sd	s0,48(sp)
    80002788:	02913423          	sd	s1,40(sp)
    8000278c:	04010413          	addi	s0,sp,64
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80002790:	0000b797          	auipc	a5,0xb
    80002794:	9c87b783          	ld	a5,-1592(a5) # 8000d158 <_GLOBAL_OFFSET_TABLE_+0x90>
    80002798:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    8000279c:	00000097          	auipc	ra,0x0
    800027a0:	ac4080e7          	jalr	-1340(ra) # 80002260 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    800027a4:	fffff097          	auipc	ra,0xfffff
    800027a8:	f68080e7          	jalr	-152(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    800027ac:	00000613          	li	a2,0
    800027b0:	0000b597          	auipc	a1,0xb
    800027b4:	9885b583          	ld	a1,-1656(a1) # 8000d138 <_GLOBAL_OFFSET_TABLE_+0x70>
    800027b8:	fd840513          	addi	a0,s0,-40
    800027bc:	fffff097          	auipc	ra,0xfffff
    800027c0:	c48080e7          	jalr	-952(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    800027c4:	fd843783          	ld	a5,-40(s0)
    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }
    800027c8:	0000b717          	auipc	a4,0xb
    800027cc:	98073703          	ld	a4,-1664(a4) # 8000d148 <_GLOBAL_OFFSET_TABLE_+0x80>
    800027d0:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    800027d4:	00100713          	li	a4,1
    800027d8:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    800027dc:	00000613          	li	a2,0
    800027e0:	0000b597          	auipc	a1,0xb
    800027e4:	8f05b583          	ld	a1,-1808(a1) # 8000d0d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    800027e8:	fd040513          	addi	a0,s0,-48
    800027ec:	fffff097          	auipc	ra,0xfffff
    800027f0:	c18080e7          	jalr	-1000(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    800027f4:	00000613          	li	a2,0
    800027f8:	00000597          	auipc	a1,0x0
    800027fc:	f2858593          	addi	a1,a1,-216 # 80002720 <_Z22kernelConsumerFunctionPv>
    80002800:	fc040513          	addi	a0,s0,-64
    80002804:	fffff097          	auipc	ra,0xfffff
    80002808:	c00080e7          	jalr	-1024(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    8000280c:	00000613          	li	a2,0
    80002810:	00000597          	auipc	a1,0x0
    80002814:	ef458593          	addi	a1,a1,-268 # 80002704 <_Z4idlePv>
    80002818:	fc840513          	addi	a0,s0,-56
    8000281c:	fffff097          	auipc	ra,0xfffff
    80002820:	be8080e7          	jalr	-1048(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002824:	00200493          	li	s1,2
    80002828:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    8000282c:	fd043503          	ld	a0,-48(s0)
    80002830:	fffff097          	auipc	ra,0xfffff
    80002834:	cb0080e7          	jalr	-848(ra) # 800014e0 <_Z11thread_joinP3TCB>
        __asm__ volatile("li a0, 0x43");
    80002838:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    8000283c:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002840:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80002844:	00000513          	li	a0,0
    80002848:	03813083          	ld	ra,56(sp)
    8000284c:	03013403          	ld	s0,48(sp)
    80002850:	02813483          	ld	s1,40(sp)
    80002854:	04010113          	addi	sp,sp,64
    80002858:	00008067          	ret

000000008000285c <interruptRoutine>:
#include "../test/printing.hpp"

int main();

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    8000285c:	f9010113          	addi	sp,sp,-112
    80002860:	06113423          	sd	ra,104(sp)
    80002864:	06813023          	sd	s0,96(sp)
    80002868:	04913c23          	sd	s1,88(sp)
    8000286c:	07010413          	addi	s0,sp,112
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002870:	14202373          	csrr	t1,scause
    80002874:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002878:	14102373          	csrr	t1,sepc
    8000287c:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002880:	10002373          	csrr	t1,sstatus
    80002884:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4;
    //uint64 a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002888:	00050313          	mv	t1,a0
    8000288c:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002890:	00058313          	mv	t1,a1
    80002894:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002898:	00060313          	mv	t1,a2
    8000289c:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028a0:	00068313          	mv	t1,a3
    800028a4:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028a8:	00070313          	mv	t1,a4
    800028ac:	fa643023          	sd	t1,-96(s0)
//    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");

    if (scause == 0x9 || scause == 0x8) {
    800028b0:	fd843703          	ld	a4,-40(s0)
    800028b4:	00900793          	li	a5,9
    800028b8:	00f70863          	beq	a4,a5,800028c8 <interruptRoutine+0x6c>
    800028bc:	fd843703          	ld	a4,-40(s0)
    800028c0:	00800793          	li	a5,8
    800028c4:	4cf71263          	bne	a4,a5,80002d88 <interruptRoutine+0x52c>
        //prekid zbog poziva ecall
        switch (a0) {
    800028c8:	fc043703          	ld	a4,-64(s0)
    800028cc:	08100793          	li	a5,129
    800028d0:	3ee7e863          	bltu	a5,a4,80002cc0 <interruptRoutine+0x464>
    800028d4:	fc043783          	ld	a5,-64(s0)
    800028d8:	00279713          	slli	a4,a5,0x2
    800028dc:	00007797          	auipc	a5,0x7
    800028e0:	7f878793          	addi	a5,a5,2040 # 8000a0d4 <CONSOLE_STATUS+0xc4>
    800028e4:	00f707b3          	add	a5,a4,a5
    800028e8:	0007a783          	lw	a5,0(a5)
    800028ec:	0007871b          	sext.w	a4,a5
    800028f0:	00007797          	auipc	a5,0x7
    800028f4:	7e478793          	addi	a5,a5,2020 # 8000a0d4 <CONSOLE_STATUS+0xc4>
    800028f8:	00f707b3          	add	a5,a4,a5
    800028fc:	00078067          	jr	a5
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                KMemory::kmalloc((size_t)a1);
    80002900:	fb843503          	ld	a0,-72(s0)
    80002904:	fffff097          	auipc	ra,0xfffff
    80002908:	7d8080e7          	jalr	2008(ra) # 800020dc <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    8000290c:	04a43823          	sd	a0,80(s0)
                break;
    80002910:	4540006f          	j	80002d64 <interruptRoutine+0x508>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                KMemory::kfree((void*)a1);
    80002914:	fb843783          	ld	a5,-72(s0)
    80002918:	00078513          	mv	a0,a5
    8000291c:	00000097          	auipc	ra,0x0
    80002920:	a00080e7          	jalr	-1536(ra) # 8000231c <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    80002924:	04a43823          	sd	a0,80(s0)
                break;
    80002928:	43c0006f          	j	80002d64 <interruptRoutine+0x508>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    8000292c:	fb043783          	ld	a5,-80(s0)
    80002930:	fa843703          	ld	a4,-88(s0)
    80002934:	fa043683          	ld	a3,-96(s0)
    80002938:	fb843483          	ld	s1,-72(s0)
    8000293c:	00068613          	mv	a2,a3
    80002940:	00070593          	mv	a1,a4
    80002944:	00078513          	mv	a0,a5
    80002948:	00001097          	auipc	ra,0x1
    8000294c:	f78080e7          	jalr	-136(ra) # 800038c0 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002950:	00050793          	mv	a5,a0
    80002954:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80002958:	fb843783          	ld	a5,-72(s0)
    8000295c:	0007b783          	ld	a5,0(a5)
    80002960:	02078863          	beqz	a5,80002990 <interruptRoutine+0x134>
                    if ((TCB::Body)a2 != (TCB::Body)main) {
    80002964:	fb043703          	ld	a4,-80(s0)
    80002968:	0000a797          	auipc	a5,0xa
    8000296c:	7d07b783          	ld	a5,2000(a5) # 8000d138 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002970:	00f70c63          	beq	a4,a5,80002988 <interruptRoutine+0x12c>
                        Scheduler::put(*((thread_t*)a1));
    80002974:	fb843783          	ld	a5,-72(s0)
    80002978:	0007b783          	ld	a5,0(a5)
    8000297c:	00078513          	mv	a0,a5
    80002980:	fffff097          	auipc	ra,0xfffff
    80002984:	5a0080e7          	jalr	1440(ra) # 80001f20 <_ZN9Scheduler3putEP3TCB>
                    }
                    __asm__ volatile("li a0, 0");
    80002988:	00000513          	li	a0,0
    8000298c:	0080006f          	j	80002994 <interruptRoutine+0x138>
                } else {
                    __asm__ volatile("li a0, -1");
    80002990:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002994:	04a43823          	sd	a0,80(s0)
                break;
    80002998:	3cc0006f          	j	80002d64 <interruptRoutine+0x508>
            case 0x12:
                //thread_exit
                TCB::getRunning()->setStatus(TCB::FINISHED);
    8000299c:	00000097          	auipc	ra,0x0
    800029a0:	74c080e7          	jalr	1868(ra) # 800030e8 <_ZN3TCB10getRunningEv>
    800029a4:	00050793          	mv	a5,a0
    800029a8:	00500593          	li	a1,5
    800029ac:	00078513          	mv	a0,a5
    800029b0:	00000097          	auipc	ra,0x0
    800029b4:	6e4080e7          	jalr	1764(ra) # 80003094 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined(TCB::getRunning());
    800029b8:	00000097          	auipc	ra,0x0
    800029bc:	730080e7          	jalr	1840(ra) # 800030e8 <_ZN3TCB10getRunningEv>
    800029c0:	00050793          	mv	a5,a0
    800029c4:	00078513          	mv	a0,a5
    800029c8:	00001097          	auipc	ra,0x1
    800029cc:	030080e7          	jalr	48(ra) # 800039f8 <_ZN3TCB13releaseJoinedEPS_>
                __asm__ volatile("li a0, 0");
    800029d0:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 80(s0)");
    800029d4:	04a43823          	sd	a0,80(s0)
                TCB::dispatch();
    800029d8:	00001097          	auipc	ra,0x1
    800029dc:	dec080e7          	jalr	-532(ra) # 800037c4 <_ZN3TCB8dispatchEv>
                break;
    800029e0:	3840006f          	j	80002d64 <interruptRoutine+0x508>
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
    800029e4:	00001097          	auipc	ra,0x1
    800029e8:	de0080e7          	jalr	-544(ra) # 800037c4 <_ZN3TCB8dispatchEv>
                break;
    800029ec:	3780006f          	j	80002d64 <interruptRoutine+0x508>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    800029f0:	fb843783          	ld	a5,-72(s0)
    800029f4:	00078513          	mv	a0,a5
    800029f8:	00001097          	auipc	ra,0x1
    800029fc:	fac080e7          	jalr	-84(ra) # 800039a4 <_ZN3TCB10threadJoinEPS_>
                TCB::dispatch();
    80002a00:	00001097          	auipc	ra,0x1
    80002a04:	dc4080e7          	jalr	-572(ra) # 800037c4 <_ZN3TCB8dispatchEv>
                break;
    80002a08:	35c0006f          	j	80002d64 <interruptRoutine+0x508>
            case 0x15:
                //destruktor klase Thread, brise nit ciji je handle prosledjen
                //a1 = rucka niti koja se brise
                if(TCB::getRunning()==(thread_t)a1){
    80002a0c:	00000097          	auipc	ra,0x0
    80002a10:	6dc080e7          	jalr	1756(ra) # 800030e8 <_ZN3TCB10getRunningEv>
    80002a14:	00050713          	mv	a4,a0
    80002a18:	fb843783          	ld	a5,-72(s0)
    80002a1c:	40f707b3          	sub	a5,a4,a5
    80002a20:	0017b793          	seqz	a5,a5
    80002a24:	0ff7f793          	andi	a5,a5,255
    80002a28:	04078263          	beqz	a5,80002a6c <interruptRoutine+0x210>
                    TCB::getRunning()->setStatus(TCB::FINISHED);
    80002a2c:	00000097          	auipc	ra,0x0
    80002a30:	6bc080e7          	jalr	1724(ra) # 800030e8 <_ZN3TCB10getRunningEv>
    80002a34:	00050793          	mv	a5,a0
    80002a38:	00500593          	li	a1,5
    80002a3c:	00078513          	mv	a0,a5
    80002a40:	00000097          	auipc	ra,0x0
    80002a44:	654080e7          	jalr	1620(ra) # 80003094 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                    TCB::releaseJoined(TCB::getRunning());
    80002a48:	00000097          	auipc	ra,0x0
    80002a4c:	6a0080e7          	jalr	1696(ra) # 800030e8 <_ZN3TCB10getRunningEv>
    80002a50:	00050793          	mv	a5,a0
    80002a54:	00078513          	mv	a0,a5
    80002a58:	00001097          	auipc	ra,0x1
    80002a5c:	fa0080e7          	jalr	-96(ra) # 800039f8 <_ZN3TCB13releaseJoinedEPS_>
                    TCB::dispatch();
    80002a60:	00001097          	auipc	ra,0x1
    80002a64:	d64080e7          	jalr	-668(ra) # 800037c4 <_ZN3TCB8dispatchEv>
                }
                else{
                    TCB::quitThread((thread_t)a1);
                    TCB::releaseJoined((thread_t)a1);
                }
                break;
    80002a68:	2fc0006f          	j	80002d64 <interruptRoutine+0x508>
                    TCB::quitThread((thread_t)a1);
    80002a6c:	fb843783          	ld	a5,-72(s0)
    80002a70:	00078513          	mv	a0,a5
    80002a74:	00001097          	auipc	ra,0x1
    80002a78:	fd4080e7          	jalr	-44(ra) # 80003a48 <_ZN3TCB10quitThreadEPS_>
                    TCB::releaseJoined((thread_t)a1);
    80002a7c:	fb843783          	ld	a5,-72(s0)
    80002a80:	00078513          	mv	a0,a5
    80002a84:	00001097          	auipc	ra,0x1
    80002a88:	f74080e7          	jalr	-140(ra) # 800039f8 <_ZN3TCB13releaseJoinedEPS_>
                break;
    80002a8c:	2d80006f          	j	80002d64 <interruptRoutine+0x508>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    80002a90:	fb043783          	ld	a5,-80(s0)
    80002a94:	0007879b          	sext.w	a5,a5
    80002a98:	fb843483          	ld	s1,-72(s0)
    80002a9c:	00078513          	mv	a0,a5
    80002aa0:	00001097          	auipc	ra,0x1
    80002aa4:	19c080e7          	jalr	412(ra) # 80003c3c <_ZN4KSem7initSemEj>
    80002aa8:	00050793          	mv	a5,a0
    80002aac:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    80002ab0:	fb843783          	ld	a5,-72(s0)
    80002ab4:	0007b783          	ld	a5,0(a5)
    80002ab8:	00078663          	beqz	a5,80002ac4 <interruptRoutine+0x268>
                    __asm__ volatile("li a0, 0");
    80002abc:	00000513          	li	a0,0
    80002ac0:	0080006f          	j	80002ac8 <interruptRoutine+0x26c>
                } else {
                    __asm__ volatile("li a0, -1");
    80002ac4:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002ac8:	04a43823          	sd	a0,80(s0)
                break;
    80002acc:	2980006f          	j	80002d64 <interruptRoutine+0x508>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    80002ad0:	fb843783          	ld	a5,-72(s0)
    80002ad4:	00078513          	mv	a0,a5
    80002ad8:	00001097          	auipc	ra,0x1
    80002adc:	2b8080e7          	jalr	696(ra) # 80003d90 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    80002ae0:	04a43823          	sd	a0,80(s0)
                delete (sem_t)a1;
    80002ae4:	fb843483          	ld	s1,-72(s0)
    80002ae8:	26048063          	beqz	s1,80002d48 <interruptRoutine+0x4ec>
    80002aec:	00048513          	mv	a0,s1
    80002af0:	00000097          	auipc	ra,0x0
    80002af4:	458080e7          	jalr	1112(ra) # 80002f48 <_ZN4KSemD1Ev>
    80002af8:	00048513          	mv	a0,s1
    80002afc:	00001097          	auipc	ra,0x1
    80002b00:	118080e7          	jalr	280(ra) # 80003c14 <_ZN4KSemdlEPv>
                break;
    80002b04:	2440006f          	j	80002d48 <interruptRoutine+0x4ec>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80002b08:	fb843783          	ld	a5,-72(s0)
    80002b0c:	00078513          	mv	a0,a5
    80002b10:	00001097          	auipc	ra,0x1
    80002b14:	1bc080e7          	jalr	444(ra) # 80003ccc <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002b18:	04a43823          	sd	a0,80(s0)
                break;
    80002b1c:	2480006f          	j	80002d64 <interruptRoutine+0x508>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    80002b20:	fb843783          	ld	a5,-72(s0)
    80002b24:	00078513          	mv	a0,a5
    80002b28:	00001097          	auipc	ra,0x1
    80002b2c:	224080e7          	jalr	548(ra) # 80003d4c <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002b30:	04a43823          	sd	a0,80(s0)
                break;
    80002b34:	2300006f          	j	80002d64 <interruptRoutine+0x508>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    80002b38:	fb843783          	ld	a5,-72(s0)
    80002b3c:	00078663          	beqz	a5,80002b48 <interruptRoutine+0x2ec>
                    __asm__ volatile("li a0, 0");
    80002b40:	00000513          	li	a0,0
    80002b44:	0080006f          	j	80002b4c <interruptRoutine+0x2f0>
                } else {
                    __asm__ volatile("li a0, -1");
    80002b48:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002b4c:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    80002b50:	fb843783          	ld	a5,-72(s0)
    80002b54:	1e078e63          	beqz	a5,80002d50 <interruptRoutine+0x4f4>
                    Scheduler::putToSleep(TCB::getRunning(), (time_t)a1);
    80002b58:	00000097          	auipc	ra,0x0
    80002b5c:	590080e7          	jalr	1424(ra) # 800030e8 <_ZN3TCB10getRunningEv>
    80002b60:	00050793          	mv	a5,a0
    80002b64:	fb843583          	ld	a1,-72(s0)
    80002b68:	00078513          	mv	a0,a5
    80002b6c:	fffff097          	auipc	ra,0xfffff
    80002b70:	440080e7          	jalr	1088(ra) # 80001fac <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::dispatch();
    80002b74:	00001097          	auipc	ra,0x1
    80002b78:	c50080e7          	jalr	-944(ra) # 800037c4 <_ZN3TCB8dispatchEv>
                }
                break;
    80002b7c:	1d40006f          	j	80002d50 <interruptRoutine+0x4f4>
            case 0x41:
                //getc
                KConsole::kgetc();
    80002b80:	fffff097          	auipc	ra,0xfffff
    80002b84:	d78080e7          	jalr	-648(ra) # 800018f8 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002b88:	04a43823          	sd	a0,80(s0)
                break;
    80002b8c:	1d80006f          	j	80002d64 <interruptRoutine+0x508>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    80002b90:	fb843783          	ld	a5,-72(s0)
    80002b94:	0ff7f793          	andi	a5,a5,255
    80002b98:	00078513          	mv	a0,a5
    80002b9c:	fffff097          	auipc	ra,0xfffff
    80002ba0:	cec080e7          	jalr	-788(ra) # 80001888 <_ZN8KConsole5kputcEc>
                break;
    80002ba4:	1c00006f          	j	80002d64 <interruptRoutine+0x508>
            case 0x43:
                //flush izlaznog bafera konzole
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    80002ba8:	00000097          	auipc	ra,0x0
    80002bac:	4a4080e7          	jalr	1188(ra) # 8000304c <_ZN8KConsole13getOutputHeadEv>
    80002bb0:	00050793          	mv	a5,a0
    80002bb4:	00078493          	mv	s1,a5
    80002bb8:	00000097          	auipc	ra,0x0
    80002bbc:	4b8080e7          	jalr	1208(ra) # 80003070 <_ZN8KConsole13getOutputTailEv>
    80002bc0:	00050793          	mv	a5,a0
    80002bc4:	00048713          	mv	a4,s1
    80002bc8:	40f707b3          	sub	a5,a4,a5
    80002bcc:	00f037b3          	snez	a5,a5
    80002bd0:	0ff7f793          	andi	a5,a5,255
    80002bd4:	18078263          	beqz	a5,80002d58 <interruptRoutine+0x4fc>
                    char c = KConsole::getFromOutput();
    80002bd8:	fffff097          	auipc	ra,0xfffff
    80002bdc:	bec080e7          	jalr	-1044(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    80002be0:	00050793          	mv	a5,a0
    80002be4:	f8f40ba3          	sb	a5,-105(s0)
                    while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80002be8:	00000097          	auipc	ra,0x0
    80002bec:	3c8080e7          	jalr	968(ra) # 80002fb0 <_ZN8KConsole10getSRvalueEv>
    80002bf0:	00050793          	mv	a5,a0
    80002bf4:	0207f793          	andi	a5,a5,32
    80002bf8:	0017b793          	seqz	a5,a5
    80002bfc:	0ff7f793          	andi	a5,a5,255
    80002c00:	00078463          	beqz	a5,80002c08 <interruptRoutine+0x3ac>
    80002c04:	fe5ff06f          	j	80002be8 <interruptRoutine+0x38c>
                    KConsole::setDRvalue(c);
    80002c08:	f9744783          	lbu	a5,-105(s0)
    80002c0c:	00078513          	mv	a0,a5
    80002c10:	00000097          	auipc	ra,0x0
    80002c14:	3f0080e7          	jalr	1008(ra) # 80003000 <_ZN8KConsole10setDRvalueEc>
                    sem_signal(KConsole::getOutputBufferHasSpace());
    80002c18:	00000097          	auipc	ra,0x0
    80002c1c:	410080e7          	jalr	1040(ra) # 80003028 <_ZN8KConsole23getOutputBufferHasSpaceEv>
    80002c20:	00050793          	mv	a5,a0
    80002c24:	00078513          	mv	a0,a5
    80002c28:	fffff097          	auipc	ra,0xfffff
    80002c2c:	9a8080e7          	jalr	-1624(ra) # 800015d0 <_Z10sem_signalP4KSem>
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    80002c30:	f79ff06f          	j	80002ba8 <interruptRoutine+0x34c>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002c34:	fb043783          	ld	a5,-80(s0)
    80002c38:	fa843703          	ld	a4,-88(s0)
    80002c3c:	fa043683          	ld	a3,-96(s0)
    80002c40:	fb843483          	ld	s1,-72(s0)
    80002c44:	00068613          	mv	a2,a3
    80002c48:	00070593          	mv	a1,a4
    80002c4c:	00078513          	mv	a0,a5
    80002c50:	00001097          	auipc	ra,0x1
    80002c54:	c70080e7          	jalr	-912(ra) # 800038c0 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002c58:	00050793          	mv	a5,a0
    80002c5c:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80002c60:	fb843783          	ld	a5,-72(s0)
    80002c64:	0007b783          	ld	a5,0(a5)
    80002c68:	00078663          	beqz	a5,80002c74 <interruptRoutine+0x418>
                    __asm__ volatile("li a0, 0");
    80002c6c:	00000513          	li	a0,0
    80002c70:	0080006f          	j	80002c78 <interruptRoutine+0x41c>
                } else {
                    __asm__ volatile("li a0, -1");
    80002c74:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002c78:	04a43823          	sd	a0,80(s0)
                break;
    80002c7c:	0e80006f          	j	80002d64 <interruptRoutine+0x508>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                if (((thread_t)a1)->getBody() != (TCB::Body)main) {
    80002c80:	fb843783          	ld	a5,-72(s0)
    80002c84:	00078513          	mv	a0,a5
    80002c88:	00000097          	auipc	ra,0x0
    80002c8c:	444080e7          	jalr	1092(ra) # 800030cc <_ZN3TCB7getBodyEv>
    80002c90:	00050713          	mv	a4,a0
    80002c94:	0000a797          	auipc	a5,0xa
    80002c98:	4a47b783          	ld	a5,1188(a5) # 8000d138 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002c9c:	40f707b3          	sub	a5,a4,a5
    80002ca0:	00f037b3          	snez	a5,a5
    80002ca4:	0ff7f793          	andi	a5,a5,255
    80002ca8:	0a078c63          	beqz	a5,80002d60 <interruptRoutine+0x504>
                    Scheduler::put((thread_t)a1);
    80002cac:	fb843783          	ld	a5,-72(s0)
    80002cb0:	00078513          	mv	a0,a5
    80002cb4:	fffff097          	auipc	ra,0xfffff
    80002cb8:	26c080e7          	jalr	620(ra) # 80001f20 <_ZN9Scheduler3putEP3TCB>
                }
                break;
    80002cbc:	0a40006f          	j	80002d60 <interruptRoutine+0x504>
            default:
                printString("\nNepostojeci op code: ");
    80002cc0:	00007517          	auipc	a0,0x7
    80002cc4:	3b850513          	addi	a0,a0,952 # 8000a078 <CONSOLE_STATUS+0x68>
    80002cc8:	00003097          	auipc	ra,0x3
    80002ccc:	7c4080e7          	jalr	1988(ra) # 8000648c <_Z11printStringPKc>
                printInt(a0);
    80002cd0:	fc043783          	ld	a5,-64(s0)
    80002cd4:	0007879b          	sext.w	a5,a5
    80002cd8:	00000613          	li	a2,0
    80002cdc:	00a00593          	li	a1,10
    80002ce0:	00078513          	mv	a0,a5
    80002ce4:	00004097          	auipc	ra,0x4
    80002ce8:	958080e7          	jalr	-1704(ra) # 8000663c <_Z8printIntiii>
                printString("\nscause: ");
    80002cec:	00007517          	auipc	a0,0x7
    80002cf0:	3a450513          	addi	a0,a0,932 # 8000a090 <CONSOLE_STATUS+0x80>
    80002cf4:	00003097          	auipc	ra,0x3
    80002cf8:	798080e7          	jalr	1944(ra) # 8000648c <_Z11printStringPKc>
                printInt(scause);
    80002cfc:	fd843783          	ld	a5,-40(s0)
    80002d00:	0007879b          	sext.w	a5,a5
    80002d04:	00000613          	li	a2,0
    80002d08:	00a00593          	li	a1,10
    80002d0c:	00078513          	mv	a0,a5
    80002d10:	00004097          	auipc	ra,0x4
    80002d14:	92c080e7          	jalr	-1748(ra) # 8000663c <_Z8printIntiii>
                printString("\nsepc: ");
    80002d18:	00007517          	auipc	a0,0x7
    80002d1c:	38850513          	addi	a0,a0,904 # 8000a0a0 <CONSOLE_STATUS+0x90>
    80002d20:	00003097          	auipc	ra,0x3
    80002d24:	76c080e7          	jalr	1900(ra) # 8000648c <_Z11printStringPKc>
                printInt(sepc);
    80002d28:	fd043783          	ld	a5,-48(s0)
    80002d2c:	0007879b          	sext.w	a5,a5
    80002d30:	00000613          	li	a2,0
    80002d34:	00a00593          	li	a1,10
    80002d38:	00078513          	mv	a0,a5
    80002d3c:	00004097          	auipc	ra,0x4
    80002d40:	900080e7          	jalr	-1792(ra) # 8000663c <_Z8printIntiii>
                break;
    80002d44:	0200006f          	j	80002d64 <interruptRoutine+0x508>
                break;
    80002d48:	00000013          	nop
    80002d4c:	0180006f          	j	80002d64 <interruptRoutine+0x508>
                break;
    80002d50:	00000013          	nop
    80002d54:	0100006f          	j	80002d64 <interruptRoutine+0x508>
                break;
    80002d58:	00000013          	nop
    80002d5c:	0080006f          	j	80002d64 <interruptRoutine+0x508>
                break;
    80002d60:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    80002d64:	fd043783          	ld	a5,-48(s0)
    80002d68:	00478793          	addi	a5,a5,4
    80002d6c:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002d70:	fd043783          	ld	a5,-48(s0)
    80002d74:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002d78:	fc843783          	ld	a5,-56(s0)
    80002d7c:	10079073          	csrw	sstatus,a5
    80002d80:	00000013          	nop
        printString("\nsepc: ");
        printInt(sepc);
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    }
    80002d84:	1ac0006f          	j	80002f30 <interruptRoutine+0x6d4>
    } else if (scause == 0x8000000000000009) {
    80002d88:	fd843703          	ld	a4,-40(s0)
    80002d8c:	fff00793          	li	a5,-1
    80002d90:	03f79793          	slli	a5,a5,0x3f
    80002d94:	00978793          	addi	a5,a5,9
    80002d98:	08f71463          	bne	a4,a5,80002e20 <interruptRoutine+0x5c4>
        uint64 irq = plic_claim();
    80002d9c:	00005097          	auipc	ra,0x5
    80002da0:	738080e7          	jalr	1848(ra) # 800084d4 <plic_claim>
    80002da4:	00050793          	mv	a5,a0
    80002da8:	f8f43c23          	sd	a5,-104(s0)
        if (irq == CONSOLE_IRQ) {
    80002dac:	f9843703          	ld	a4,-104(s0)
    80002db0:	00a00793          	li	a5,10
    80002db4:	02f71c63          	bne	a4,a5,80002dec <interruptRoutine+0x590>
            if (KConsole::getSRvalue() & CONSOLE_RX_STATUS_BIT) {
    80002db8:	00000097          	auipc	ra,0x0
    80002dbc:	1f8080e7          	jalr	504(ra) # 80002fb0 <_ZN8KConsole10getSRvalueEv>
    80002dc0:	00050793          	mv	a5,a0
    80002dc4:	0017f793          	andi	a5,a5,1
    80002dc8:	00f037b3          	snez	a5,a5
    80002dcc:	0ff7f793          	andi	a5,a5,255
    80002dd0:	00078e63          	beqz	a5,80002dec <interruptRoutine+0x590>
                KConsole::placeInInput(KConsole::getDRvalue());
    80002dd4:	00000097          	auipc	ra,0x0
    80002dd8:	204080e7          	jalr	516(ra) # 80002fd8 <_ZN8KConsole10getDRvalueEv>
    80002ddc:	00050793          	mv	a5,a0
    80002de0:	00078513          	mv	a0,a5
    80002de4:	fffff097          	auipc	ra,0xfffff
    80002de8:	a38080e7          	jalr	-1480(ra) # 8000181c <_ZN8KConsole12placeInInputEc>
        plic_complete(irq);
    80002dec:	f9843783          	ld	a5,-104(s0)
    80002df0:	0007879b          	sext.w	a5,a5
    80002df4:	00078513          	mv	a0,a5
    80002df8:	00005097          	auipc	ra,0x5
    80002dfc:	714080e7          	jalr	1812(ra) # 8000850c <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002e00:	fd043783          	ld	a5,-48(s0)
    80002e04:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002e08:	fc843783          	ld	a5,-56(s0)
    80002e0c:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    80002e10:	20000513          	li	a0,512
    80002e14:	00000097          	auipc	ra,0x0
    80002e18:	180080e7          	jalr	384(ra) # 80002f94 <_ZN5Riscv6mc_sipEm>
    80002e1c:	1140006f          	j	80002f30 <interruptRoutine+0x6d4>
    } else if (scause == 0x8000000000000001) {
    80002e20:	fd843703          	ld	a4,-40(s0)
    80002e24:	fff00793          	li	a5,-1
    80002e28:	03f79793          	slli	a5,a5,0x3f
    80002e2c:	00178793          	addi	a5,a5,1
    80002e30:	08f71463          	bne	a4,a5,80002eb8 <interruptRoutine+0x65c>
        Scheduler::wake();
    80002e34:	fffff097          	auipc	ra,0xfffff
    80002e38:	228080e7          	jalr	552(ra) # 8000205c <_ZN9Scheduler4wakeEv>
        TCB::getRunningTimeSlice()++;
    80002e3c:	00000097          	auipc	ra,0x0
    80002e40:	2d0080e7          	jalr	720(ra) # 8000310c <_ZN3TCB19getRunningTimeSliceEv>
    80002e44:	00050793          	mv	a5,a0
    80002e48:	0007b703          	ld	a4,0(a5)
    80002e4c:	00170713          	addi	a4,a4,1
    80002e50:	00e7b023          	sd	a4,0(a5)
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
    80002e54:	00000097          	auipc	ra,0x0
    80002e58:	2b8080e7          	jalr	696(ra) # 8000310c <_ZN3TCB19getRunningTimeSliceEv>
    80002e5c:	00050793          	mv	a5,a0
    80002e60:	0007b483          	ld	s1,0(a5)
    80002e64:	00000097          	auipc	ra,0x0
    80002e68:	284080e7          	jalr	644(ra) # 800030e8 <_ZN3TCB10getRunningEv>
    80002e6c:	00050793          	mv	a5,a0
    80002e70:	00078513          	mv	a0,a5
    80002e74:	00000097          	auipc	ra,0x0
    80002e78:	23c080e7          	jalr	572(ra) # 800030b0 <_ZN3TCB12getTimeSliceEv>
    80002e7c:	00050793          	mv	a5,a0
    80002e80:	00f4b7b3          	sltu	a5,s1,a5
    80002e84:	0017c793          	xori	a5,a5,1
    80002e88:	0ff7f793          	andi	a5,a5,255
    80002e8c:	00078663          	beqz	a5,80002e98 <interruptRoutine+0x63c>
            TCB::dispatch();
    80002e90:	00001097          	auipc	ra,0x1
    80002e94:	934080e7          	jalr	-1740(ra) # 800037c4 <_ZN3TCB8dispatchEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002e98:	fd043783          	ld	a5,-48(s0)
    80002e9c:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002ea0:	fc843783          	ld	a5,-56(s0)
    80002ea4:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    80002ea8:	00200513          	li	a0,2
    80002eac:	00000097          	auipc	ra,0x0
    80002eb0:	0e8080e7          	jalr	232(ra) # 80002f94 <_ZN5Riscv6mc_sipEm>
    80002eb4:	07c0006f          	j	80002f30 <interruptRoutine+0x6d4>
        printString("\nGreska u prekidnoj rutini\n");
    80002eb8:	00007517          	auipc	a0,0x7
    80002ebc:	1f050513          	addi	a0,a0,496 # 8000a0a8 <CONSOLE_STATUS+0x98>
    80002ec0:	00003097          	auipc	ra,0x3
    80002ec4:	5cc080e7          	jalr	1484(ra) # 8000648c <_Z11printStringPKc>
        printString("scause: ");
    80002ec8:	00007517          	auipc	a0,0x7
    80002ecc:	20050513          	addi	a0,a0,512 # 8000a0c8 <CONSOLE_STATUS+0xb8>
    80002ed0:	00003097          	auipc	ra,0x3
    80002ed4:	5bc080e7          	jalr	1468(ra) # 8000648c <_Z11printStringPKc>
        printInt(scause);
    80002ed8:	fd843783          	ld	a5,-40(s0)
    80002edc:	0007879b          	sext.w	a5,a5
    80002ee0:	00000613          	li	a2,0
    80002ee4:	00a00593          	li	a1,10
    80002ee8:	00078513          	mv	a0,a5
    80002eec:	00003097          	auipc	ra,0x3
    80002ef0:	750080e7          	jalr	1872(ra) # 8000663c <_Z8printIntiii>
        printString("\nsepc: ");
    80002ef4:	00007517          	auipc	a0,0x7
    80002ef8:	1ac50513          	addi	a0,a0,428 # 8000a0a0 <CONSOLE_STATUS+0x90>
    80002efc:	00003097          	auipc	ra,0x3
    80002f00:	590080e7          	jalr	1424(ra) # 8000648c <_Z11printStringPKc>
        printInt(sepc);
    80002f04:	fd043783          	ld	a5,-48(s0)
    80002f08:	0007879b          	sext.w	a5,a5
    80002f0c:	00000613          	li	a2,0
    80002f10:	00a00593          	li	a1,10
    80002f14:	00078513          	mv	a0,a5
    80002f18:	00003097          	auipc	ra,0x3
    80002f1c:	724080e7          	jalr	1828(ra) # 8000663c <_Z8printIntiii>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002f20:	fd043783          	ld	a5,-48(s0)
    80002f24:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002f28:	fc843783          	ld	a5,-56(s0)
    80002f2c:	10079073          	csrw	sstatus,a5
    80002f30:	00000013          	nop
    80002f34:	06813083          	ld	ra,104(sp)
    80002f38:	06013403          	ld	s0,96(sp)
    80002f3c:	05813483          	ld	s1,88(sp)
    80002f40:	07010113          	addi	sp,sp,112
    80002f44:	00008067          	ret

0000000080002f48 <_ZN4KSemD1Ev>:
#define PROJEKAT2023_KSEM_HPP

#include "../h/ThreadQueue.hpp"

//klasa napravljena po uzoru na semafor u skolskom jezgru
class KSem {
    80002f48:	fe010113          	addi	sp,sp,-32
    80002f4c:	00113c23          	sd	ra,24(sp)
    80002f50:	00813823          	sd	s0,16(sp)
    80002f54:	00913423          	sd	s1,8(sp)
    80002f58:	02010413          	addi	s0,sp,32
    80002f5c:	00050493          	mv	s1,a0
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    80002f60:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002f64:	00050e63          	beqz	a0,80002f80 <_ZN4KSemD1Ev+0x38>
            front = front->next;
    80002f68:	00853783          	ld	a5,8(a0)
    80002f6c:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002f70:	fe0508e3          	beqz	a0,80002f60 <_ZN4KSemD1Ev+0x18>
            mem_free(ptr);
    80002f74:	ffffe097          	auipc	ra,0xffffe
    80002f78:	460080e7          	jalr	1120(ra) # 800013d4 <_Z8mem_freePv>
        }
    80002f7c:	fe5ff06f          	j	80002f60 <_ZN4KSemD1Ev+0x18>
    80002f80:	01813083          	ld	ra,24(sp)
    80002f84:	01013403          	ld	s0,16(sp)
    80002f88:	00813483          	ld	s1,8(sp)
    80002f8c:	02010113          	addi	sp,sp,32
    80002f90:	00008067          	ret

0000000080002f94 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002f94:	ff010113          	addi	sp,sp,-16
    80002f98:	00813423          	sd	s0,8(sp)
    80002f9c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80002fa0:	14453073          	csrc	sip,a0
}
    80002fa4:	00813403          	ld	s0,8(sp)
    80002fa8:	01010113          	addi	sp,sp,16
    80002fac:	00008067          	ret

0000000080002fb0 <_ZN8KConsole10getSRvalueEv>:
    static uint8 getSRvalue() { return *sr; }
    80002fb0:	ff010113          	addi	sp,sp,-16
    80002fb4:	00813423          	sd	s0,8(sp)
    80002fb8:	01010413          	addi	s0,sp,16
    80002fbc:	0000a797          	auipc	a5,0xa
    80002fc0:	1bc7b783          	ld	a5,444(a5) # 8000d178 <_GLOBAL_OFFSET_TABLE_+0xb0>
    80002fc4:	0007b783          	ld	a5,0(a5)
    80002fc8:	0007c503          	lbu	a0,0(a5)
    80002fcc:	00813403          	ld	s0,8(sp)
    80002fd0:	01010113          	addi	sp,sp,16
    80002fd4:	00008067          	ret

0000000080002fd8 <_ZN8KConsole10getDRvalueEv>:
    static uint8 getDRvalue() { return *dr; }
    80002fd8:	ff010113          	addi	sp,sp,-16
    80002fdc:	00813423          	sd	s0,8(sp)
    80002fe0:	01010413          	addi	s0,sp,16
    80002fe4:	0000a797          	auipc	a5,0xa
    80002fe8:	1447b783          	ld	a5,324(a5) # 8000d128 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002fec:	0007b783          	ld	a5,0(a5)
    80002ff0:	0007c503          	lbu	a0,0(a5)
    80002ff4:	00813403          	ld	s0,8(sp)
    80002ff8:	01010113          	addi	sp,sp,16
    80002ffc:	00008067          	ret

0000000080003000 <_ZN8KConsole10setDRvalueEc>:
    static void setDRvalue(char c) { *dr = c; }
    80003000:	ff010113          	addi	sp,sp,-16
    80003004:	00813423          	sd	s0,8(sp)
    80003008:	01010413          	addi	s0,sp,16
    8000300c:	0000a797          	auipc	a5,0xa
    80003010:	11c7b783          	ld	a5,284(a5) # 8000d128 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003014:	0007b783          	ld	a5,0(a5)
    80003018:	00a78023          	sb	a0,0(a5)
    8000301c:	00813403          	ld	s0,8(sp)
    80003020:	01010113          	addi	sp,sp,16
    80003024:	00008067          	ret

0000000080003028 <_ZN8KConsole23getOutputBufferHasSpaceEv>:

    static sem_t getOutputBufferHasSpace() { return outputBufferHasSpace; }
    80003028:	ff010113          	addi	sp,sp,-16
    8000302c:	00813423          	sd	s0,8(sp)
    80003030:	01010413          	addi	s0,sp,16
    80003034:	0000a797          	auipc	a5,0xa
    80003038:	10c7b783          	ld	a5,268(a5) # 8000d140 <_GLOBAL_OFFSET_TABLE_+0x78>
    8000303c:	0007b503          	ld	a0,0(a5)
    80003040:	00813403          	ld	s0,8(sp)
    80003044:	01010113          	addi	sp,sp,16
    80003048:	00008067          	ret

000000008000304c <_ZN8KConsole13getOutputHeadEv>:

    static int getOutputHead() { return outputHead; }
    8000304c:	ff010113          	addi	sp,sp,-16
    80003050:	00813423          	sd	s0,8(sp)
    80003054:	01010413          	addi	s0,sp,16
    80003058:	0000a797          	auipc	a5,0xa
    8000305c:	0c07b783          	ld	a5,192(a5) # 8000d118 <_GLOBAL_OFFSET_TABLE_+0x50>
    80003060:	0007a503          	lw	a0,0(a5)
    80003064:	00813403          	ld	s0,8(sp)
    80003068:	01010113          	addi	sp,sp,16
    8000306c:	00008067          	ret

0000000080003070 <_ZN8KConsole13getOutputTailEv>:

    static int getOutputTail() { return outputTail; }
    80003070:	ff010113          	addi	sp,sp,-16
    80003074:	00813423          	sd	s0,8(sp)
    80003078:	01010413          	addi	s0,sp,16
    8000307c:	0000a797          	auipc	a5,0xa
    80003080:	0f47b783          	ld	a5,244(a5) # 8000d170 <_GLOBAL_OFFSET_TABLE_+0xa8>
    80003084:	0007a503          	lw	a0,0(a5)
    80003088:	00813403          	ld	s0,8(sp)
    8000308c:	01010113          	addi	sp,sp,16
    80003090:	00008067          	ret

0000000080003094 <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    80003094:	ff010113          	addi	sp,sp,-16
    80003098:	00813423          	sd	s0,8(sp)
    8000309c:	01010413          	addi	s0,sp,16
    800030a0:	04b52c23          	sw	a1,88(a0)
    800030a4:	00813403          	ld	s0,8(sp)
    800030a8:	01010113          	addi	sp,sp,16
    800030ac:	00008067          	ret

00000000800030b0 <_ZN3TCB12getTimeSliceEv>:
    uint64 getTimeSlice() { return timeSlice; }
    800030b0:	ff010113          	addi	sp,sp,-16
    800030b4:	00813423          	sd	s0,8(sp)
    800030b8:	01010413          	addi	s0,sp,16
    800030bc:	02853503          	ld	a0,40(a0)
    800030c0:	00813403          	ld	s0,8(sp)
    800030c4:	01010113          	addi	sp,sp,16
    800030c8:	00008067          	ret

00000000800030cc <_ZN3TCB7getBodyEv>:
    Body getBody() { return threadFunction; }
    800030cc:	ff010113          	addi	sp,sp,-16
    800030d0:	00813423          	sd	s0,8(sp)
    800030d4:	01010413          	addi	s0,sp,16
    800030d8:	01053503          	ld	a0,16(a0)
    800030dc:	00813403          	ld	s0,8(sp)
    800030e0:	01010113          	addi	sp,sp,16
    800030e4:	00008067          	ret

00000000800030e8 <_ZN3TCB10getRunningEv>:
    void setMySemaphore(KSem* sem) { mySemaphore = sem; }
    800030e8:	ff010113          	addi	sp,sp,-16
    800030ec:	00813423          	sd	s0,8(sp)
    800030f0:	01010413          	addi	s0,sp,16
    800030f4:	0000a797          	auipc	a5,0xa
    800030f8:	0547b783          	ld	a5,84(a5) # 8000d148 <_GLOBAL_OFFSET_TABLE_+0x80>
    800030fc:	0007b503          	ld	a0,0(a5)
    80003100:	00813403          	ld	s0,8(sp)
    80003104:	01010113          	addi	sp,sp,16
    80003108:	00008067          	ret

000000008000310c <_ZN3TCB19getRunningTimeSliceEv>:
    static TCB* getRunning() { return running; }
    8000310c:	ff010113          	addi	sp,sp,-16
    80003110:	00813423          	sd	s0,8(sp)
    80003114:	01010413          	addi	s0,sp,16
    80003118:	0000a517          	auipc	a0,0xa
    8000311c:	fc853503          	ld	a0,-56(a0) # 8000d0e0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003120:	00813403          	ld	s0,8(sp)
    80003124:	01010113          	addi	sp,sp,16
    80003128:	00008067          	ret

000000008000312c <_ZN6Thread7wrapperEPv>:

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
    8000312c:	02050863          	beqz	a0,8000315c <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80003130:	ff010113          	addi	sp,sp,-16
    80003134:	00113423          	sd	ra,8(sp)
    80003138:	00813023          	sd	s0,0(sp)
    8000313c:	01010413          	addi	s0,sp,16
        ((Thread*)thread)->run();
    80003140:	00053783          	ld	a5,0(a0)
    80003144:	0107b783          	ld	a5,16(a5)
    80003148:	000780e7          	jalr	a5
    }
}
    8000314c:	00813083          	ld	ra,8(sp)
    80003150:	00013403          	ld	s0,0(sp)
    80003154:	01010113          	addi	sp,sp,16
    80003158:	00008067          	ret
    8000315c:	00008067          	ret

0000000080003160 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80003160:	fe010113          	addi	sp,sp,-32
    80003164:	00113c23          	sd	ra,24(sp)
    80003168:	00813823          	sd	s0,16(sp)
    8000316c:	00913423          	sd	s1,8(sp)
    80003170:	02010413          	addi	s0,sp,32
    80003174:	00050313          	mv	t1,a0
    80003178:	0000a797          	auipc	a5,0xa
    8000317c:	d4078793          	addi	a5,a5,-704 # 8000ceb8 <_ZTV6Thread+0x10>
    80003180:	00f53023          	sd	a5,0(a0)
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003184:	00853e03          	ld	t3,8(a0)
    80003188:	000e0593          	mv	a1,t3
    __asm__ volatile("li a0, 0x15");
    8000318c:	01500513          	li	a0,21
    __asm__ volatile("ecall");
    80003190:	00000073          	ecall
    delete myHandle;
    80003194:	00833483          	ld	s1,8(t1)
    80003198:	02048863          	beqz	s1,800031c8 <_ZN6ThreadD1Ev+0x68>
        return front == nullptr;
    8000319c:	0484b503          	ld	a0,72(s1)
        while (!isEmpty()) {
    800031a0:	00050e63          	beqz	a0,800031bc <_ZN6ThreadD1Ev+0x5c>
            front = front->next;
    800031a4:	00853783          	ld	a5,8(a0)
    800031a8:	04f4b423          	sd	a5,72(s1)
            delete node;
    800031ac:	fe0508e3          	beqz	a0,8000319c <_ZN6ThreadD1Ev+0x3c>
            mem_free(ptr);
    800031b0:	ffffe097          	auipc	ra,0xffffe
    800031b4:	224080e7          	jalr	548(ra) # 800013d4 <_Z8mem_freePv>
        }
    800031b8:	fe5ff06f          	j	8000319c <_ZN6ThreadD1Ev+0x3c>
    800031bc:	00048513          	mv	a0,s1
    800031c0:	00000097          	auipc	ra,0x0
    800031c4:	7bc080e7          	jalr	1980(ra) # 8000397c <_ZN3TCBdlEPv>
}
    800031c8:	01813083          	ld	ra,24(sp)
    800031cc:	01013403          	ld	s0,16(sp)
    800031d0:	00813483          	ld	s1,8(sp)
    800031d4:	02010113          	addi	sp,sp,32
    800031d8:	00008067          	ret

00000000800031dc <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800031dc:	ff010113          	addi	sp,sp,-16
    800031e0:	00113423          	sd	ra,8(sp)
    800031e4:	00813023          	sd	s0,0(sp)
    800031e8:	01010413          	addi	s0,sp,16
    800031ec:	0000a797          	auipc	a5,0xa
    800031f0:	cf478793          	addi	a5,a5,-780 # 8000cee0 <_ZTV9Semaphore+0x10>
    800031f4:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    800031f8:	00853503          	ld	a0,8(a0)
    800031fc:	ffffe097          	auipc	ra,0xffffe
    80003200:	374080e7          	jalr	884(ra) # 80001570 <_Z9sem_closeP4KSem>
}
    80003204:	00813083          	ld	ra,8(sp)
    80003208:	00013403          	ld	s0,0(sp)
    8000320c:	01010113          	addi	sp,sp,16
    80003210:	00008067          	ret

0000000080003214 <_Znwm>:
void* operator new(size_t size) {
    80003214:	ff010113          	addi	sp,sp,-16
    80003218:	00113423          	sd	ra,8(sp)
    8000321c:	00813023          	sd	s0,0(sp)
    80003220:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003224:	ffffe097          	auipc	ra,0xffffe
    80003228:	170080e7          	jalr	368(ra) # 80001394 <_Z9mem_allocm>
}
    8000322c:	00813083          	ld	ra,8(sp)
    80003230:	00013403          	ld	s0,0(sp)
    80003234:	01010113          	addi	sp,sp,16
    80003238:	00008067          	ret

000000008000323c <_Znam>:
void* operator new[](size_t size) {
    8000323c:	ff010113          	addi	sp,sp,-16
    80003240:	00113423          	sd	ra,8(sp)
    80003244:	00813023          	sd	s0,0(sp)
    80003248:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    8000324c:	ffffe097          	auipc	ra,0xffffe
    80003250:	148080e7          	jalr	328(ra) # 80001394 <_Z9mem_allocm>
}
    80003254:	00813083          	ld	ra,8(sp)
    80003258:	00013403          	ld	s0,0(sp)
    8000325c:	01010113          	addi	sp,sp,16
    80003260:	00008067          	ret

0000000080003264 <_ZdlPv>:
noexcept {
    80003264:	ff010113          	addi	sp,sp,-16
    80003268:	00113423          	sd	ra,8(sp)
    8000326c:	00813023          	sd	s0,0(sp)
    80003270:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80003274:	ffffe097          	auipc	ra,0xffffe
    80003278:	160080e7          	jalr	352(ra) # 800013d4 <_Z8mem_freePv>
}
    8000327c:	00813083          	ld	ra,8(sp)
    80003280:	00013403          	ld	s0,0(sp)
    80003284:	01010113          	addi	sp,sp,16
    80003288:	00008067          	ret

000000008000328c <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    8000328c:	fe010113          	addi	sp,sp,-32
    80003290:	00113c23          	sd	ra,24(sp)
    80003294:	00813823          	sd	s0,16(sp)
    80003298:	00913423          	sd	s1,8(sp)
    8000329c:	02010413          	addi	s0,sp,32
    800032a0:	00050493          	mv	s1,a0
}
    800032a4:	00000097          	auipc	ra,0x0
    800032a8:	f38080e7          	jalr	-200(ra) # 800031dc <_ZN9SemaphoreD1Ev>
    800032ac:	00048513          	mv	a0,s1
    800032b0:	00000097          	auipc	ra,0x0
    800032b4:	fb4080e7          	jalr	-76(ra) # 80003264 <_ZdlPv>
    800032b8:	01813083          	ld	ra,24(sp)
    800032bc:	01013403          	ld	s0,16(sp)
    800032c0:	00813483          	ld	s1,8(sp)
    800032c4:	02010113          	addi	sp,sp,32
    800032c8:	00008067          	ret

00000000800032cc <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800032cc:	fe010113          	addi	sp,sp,-32
    800032d0:	00113c23          	sd	ra,24(sp)
    800032d4:	00813823          	sd	s0,16(sp)
    800032d8:	00913423          	sd	s1,8(sp)
    800032dc:	02010413          	addi	s0,sp,32
    800032e0:	00050493          	mv	s1,a0
}
    800032e4:	00000097          	auipc	ra,0x0
    800032e8:	e7c080e7          	jalr	-388(ra) # 80003160 <_ZN6ThreadD1Ev>
    800032ec:	00048513          	mv	a0,s1
    800032f0:	00000097          	auipc	ra,0x0
    800032f4:	f74080e7          	jalr	-140(ra) # 80003264 <_ZdlPv>
    800032f8:	01813083          	ld	ra,24(sp)
    800032fc:	01013403          	ld	s0,16(sp)
    80003300:	00813483          	ld	s1,8(sp)
    80003304:	02010113          	addi	sp,sp,32
    80003308:	00008067          	ret

000000008000330c <_ZdaPv>:
noexcept {
    8000330c:	ff010113          	addi	sp,sp,-16
    80003310:	00113423          	sd	ra,8(sp)
    80003314:	00813023          	sd	s0,0(sp)
    80003318:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000331c:	ffffe097          	auipc	ra,0xffffe
    80003320:	0b8080e7          	jalr	184(ra) # 800013d4 <_Z8mem_freePv>
}
    80003324:	00813083          	ld	ra,8(sp)
    80003328:	00013403          	ld	s0,0(sp)
    8000332c:	01010113          	addi	sp,sp,16
    80003330:	00008067          	ret

0000000080003334 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80003334:	fd010113          	addi	sp,sp,-48
    80003338:	02113423          	sd	ra,40(sp)
    8000333c:	02813023          	sd	s0,32(sp)
    80003340:	00913c23          	sd	s1,24(sp)
    80003344:	01213823          	sd	s2,16(sp)
    80003348:	01313423          	sd	s3,8(sp)
    8000334c:	03010413          	addi	s0,sp,48
    80003350:	00050493          	mv	s1,a0
    80003354:	00058913          	mv	s2,a1
    80003358:	00060993          	mv	s3,a2
    8000335c:	0000a797          	auipc	a5,0xa
    80003360:	b5c78793          	addi	a5,a5,-1188 # 8000ceb8 <_ZTV6Thread+0x10>
    80003364:	00f53023          	sd	a5,0(a0)
    this->body = body;
    80003368:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    8000336c:	00c53c23          	sd	a2,24(a0)
    if (body != (TCB::Body)main) {
    80003370:	0000a797          	auipc	a5,0xa
    80003374:	dc87b783          	ld	a5,-568(a5) # 8000d138 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003378:	04f58663          	beq	a1,a5,800033c4 <_ZN6ThreadC1EPFvPvES0_+0x90>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    8000337c:	00001537          	lui	a0,0x1
    80003380:	ffffe097          	auipc	ra,0xffffe
    80003384:	014080e7          	jalr	20(ra) # 80001394 <_Z9mem_allocm>
    80003388:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000338c:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003390:	00098693          	mv	a3,s3
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003394:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003398:	00848493          	addi	s1,s1,8
    8000339c:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    800033a0:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    800033a4:	00000073          	ecall
}
    800033a8:	02813083          	ld	ra,40(sp)
    800033ac:	02013403          	ld	s0,32(sp)
    800033b0:	01813483          	ld	s1,24(sp)
    800033b4:	01013903          	ld	s2,16(sp)
    800033b8:	00813983          	ld	s3,8(sp)
    800033bc:	03010113          	addi	sp,sp,48
    800033c0:	00008067          	ret
    uint64* stack = nullptr;
    800033c4:	00000313          	li	t1,0
    800033c8:	fc5ff06f          	j	8000338c <_ZN6ThreadC1EPFvPvES0_+0x58>

00000000800033cc <_ZN6Thread5startEv>:
int Thread::start() {
    800033cc:	ff010113          	addi	sp,sp,-16
    800033d0:	00813423          	sd	s0,8(sp)
    800033d4:	01010413          	addi	s0,sp,16
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    800033d8:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    800033dc:	02030463          	beqz	t1,80003404 <_ZN6Thread5startEv+0x38>
    ThreadStatus getStatus() { return this->status; }
    800033e0:	05832783          	lw	a5,88(t1)
    800033e4:	02079463          	bnez	a5,8000340c <_ZN6Thread5startEv+0x40>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800033e8:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    800033ec:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    800033f0:	00000073          	ecall
    return 0;
    800033f4:	00000513          	li	a0,0
}
    800033f8:	00813403          	ld	s0,8(sp)
    800033fc:	01010113          	addi	sp,sp,16
    80003400:	00008067          	ret
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    80003404:	fff00513          	li	a0,-1
    80003408:	ff1ff06f          	j	800033f8 <_ZN6Thread5startEv+0x2c>
    8000340c:	fff00513          	li	a0,-1
    80003410:	fe9ff06f          	j	800033f8 <_ZN6Thread5startEv+0x2c>

0000000080003414 <_ZN6Thread4joinEv>:
    if (myHandle) thread_join(myHandle);
    80003414:	00853503          	ld	a0,8(a0)
    80003418:	02050663          	beqz	a0,80003444 <_ZN6Thread4joinEv+0x30>
void Thread::join() {
    8000341c:	ff010113          	addi	sp,sp,-16
    80003420:	00113423          	sd	ra,8(sp)
    80003424:	00813023          	sd	s0,0(sp)
    80003428:	01010413          	addi	s0,sp,16
    if (myHandle) thread_join(myHandle);
    8000342c:	ffffe097          	auipc	ra,0xffffe
    80003430:	0b4080e7          	jalr	180(ra) # 800014e0 <_Z11thread_joinP3TCB>
}
    80003434:	00813083          	ld	ra,8(sp)
    80003438:	00013403          	ld	s0,0(sp)
    8000343c:	01010113          	addi	sp,sp,16
    80003440:	00008067          	ret
    80003444:	00008067          	ret

0000000080003448 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80003448:	ff010113          	addi	sp,sp,-16
    8000344c:	00113423          	sd	ra,8(sp)
    80003450:	00813023          	sd	s0,0(sp)
    80003454:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80003458:	ffffe097          	auipc	ra,0xffffe
    8000345c:	068080e7          	jalr	104(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80003460:	00813083          	ld	ra,8(sp)
    80003464:	00013403          	ld	s0,0(sp)
    80003468:	01010113          	addi	sp,sp,16
    8000346c:	00008067          	ret

0000000080003470 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80003470:	ff010113          	addi	sp,sp,-16
    80003474:	00113423          	sd	ra,8(sp)
    80003478:	00813023          	sd	s0,0(sp)
    8000347c:	01010413          	addi	s0,sp,16
    time_sleep(t);
    80003480:	ffffe097          	auipc	ra,0xffffe
    80003484:	088080e7          	jalr	136(ra) # 80001508 <_Z10time_sleepm>
}
    80003488:	00000513          	li	a0,0
    8000348c:	00813083          	ld	ra,8(sp)
    80003490:	00013403          	ld	s0,0(sp)
    80003494:	01010113          	addi	sp,sp,16
    80003498:	00008067          	ret

000000008000349c <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    8000349c:	fe010113          	addi	sp,sp,-32
    800034a0:	00113c23          	sd	ra,24(sp)
    800034a4:	00813823          	sd	s0,16(sp)
    800034a8:	00913423          	sd	s1,8(sp)
    800034ac:	02010413          	addi	s0,sp,32
    800034b0:	00050493          	mv	s1,a0
    while (period != -1UL) {
    800034b4:	0204b703          	ld	a4,32(s1)
    800034b8:	fff00793          	li	a5,-1
    800034bc:	02f70663          	beq	a4,a5,800034e8 <_ZN14PeriodicThread3runEv+0x4c>
        periodicActivation();
    800034c0:	0004b783          	ld	a5,0(s1)
    800034c4:	0187b783          	ld	a5,24(a5)
    800034c8:	00048513          	mv	a0,s1
    800034cc:	000780e7          	jalr	a5
        if (period == -1UL) break;
    800034d0:	0204b503          	ld	a0,32(s1)
    800034d4:	fff00793          	li	a5,-1
    800034d8:	00f50863          	beq	a0,a5,800034e8 <_ZN14PeriodicThread3runEv+0x4c>
        sleep(period);
    800034dc:	00000097          	auipc	ra,0x0
    800034e0:	f94080e7          	jalr	-108(ra) # 80003470 <_ZN6Thread5sleepEm>
    while (period != -1UL) {
    800034e4:	fd1ff06f          	j	800034b4 <_ZN14PeriodicThread3runEv+0x18>
    }
    thread_exit();
    800034e8:	ffffe097          	auipc	ra,0xffffe
    800034ec:	fb0080e7          	jalr	-80(ra) # 80001498 <_Z11thread_exitv>
}
    800034f0:	01813083          	ld	ra,24(sp)
    800034f4:	01013403          	ld	s0,16(sp)
    800034f8:	00813483          	ld	s1,8(sp)
    800034fc:	02010113          	addi	sp,sp,32
    80003500:	00008067          	ret

0000000080003504 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80003504:	fe010113          	addi	sp,sp,-32
    80003508:	00113c23          	sd	ra,24(sp)
    8000350c:	00813823          	sd	s0,16(sp)
    80003510:	00913423          	sd	s1,8(sp)
    80003514:	02010413          	addi	s0,sp,32
    80003518:	00050493          	mv	s1,a0
    8000351c:	0000a797          	auipc	a5,0xa
    80003520:	99c78793          	addi	a5,a5,-1636 # 8000ceb8 <_ZTV6Thread+0x10>
    80003524:	00f53023          	sd	a5,0(a0)
    this->body = wrapper;
    80003528:	00000797          	auipc	a5,0x0
    8000352c:	c0478793          	addi	a5,a5,-1020 # 8000312c <_ZN6Thread7wrapperEPv>
    80003530:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80003534:	00a53c23          	sd	a0,24(a0)
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80003538:	00001537          	lui	a0,0x1
    8000353c:	ffffe097          	auipc	ra,0xffffe
    80003540:	e58080e7          	jalr	-424(ra) # 80001394 <_Z9mem_allocm>
    80003544:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003548:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000354c:	0184b303          	ld	t1,24(s1)
    80003550:	00030693          	mv	a3,t1
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80003554:	0104b303          	ld	t1,16(s1)
    80003558:	00030613          	mv	a2,t1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000355c:	00848493          	addi	s1,s1,8
    80003560:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80003564:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80003568:	00000073          	ecall
}
    8000356c:	01813083          	ld	ra,24(sp)
    80003570:	01013403          	ld	s0,16(sp)
    80003574:	00813483          	ld	s1,8(sp)
    80003578:	02010113          	addi	sp,sp,32
    8000357c:	00008067          	ret

0000000080003580 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80003580:	ff010113          	addi	sp,sp,-16
    80003584:	00113423          	sd	ra,8(sp)
    80003588:	00813023          	sd	s0,0(sp)
    8000358c:	01010413          	addi	s0,sp,16
    80003590:	0000a797          	auipc	a5,0xa
    80003594:	95078793          	addi	a5,a5,-1712 # 8000cee0 <_ZTV9Semaphore+0x10>
    80003598:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle, init);
    8000359c:	00850513          	addi	a0,a0,8
    800035a0:	ffffe097          	auipc	ra,0xffffe
    800035a4:	f98080e7          	jalr	-104(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    800035a8:	00813083          	ld	ra,8(sp)
    800035ac:	00013403          	ld	s0,0(sp)
    800035b0:	01010113          	addi	sp,sp,16
    800035b4:	00008067          	ret

00000000800035b8 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    800035b8:	ff010113          	addi	sp,sp,-16
    800035bc:	00113423          	sd	ra,8(sp)
    800035c0:	00813023          	sd	s0,0(sp)
    800035c4:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    800035c8:	00853503          	ld	a0,8(a0)
    800035cc:	ffffe097          	auipc	ra,0xffffe
    800035d0:	fd4080e7          	jalr	-44(ra) # 800015a0 <_Z8sem_waitP4KSem>
}
    800035d4:	00813083          	ld	ra,8(sp)
    800035d8:	00013403          	ld	s0,0(sp)
    800035dc:	01010113          	addi	sp,sp,16
    800035e0:	00008067          	ret

00000000800035e4 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    800035e4:	ff010113          	addi	sp,sp,-16
    800035e8:	00113423          	sd	ra,8(sp)
    800035ec:	00813023          	sd	s0,0(sp)
    800035f0:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    800035f4:	00853503          	ld	a0,8(a0)
    800035f8:	ffffe097          	auipc	ra,0xffffe
    800035fc:	fd8080e7          	jalr	-40(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80003600:	00813083          	ld	ra,8(sp)
    80003604:	00013403          	ld	s0,0(sp)
    80003608:	01010113          	addi	sp,sp,16
    8000360c:	00008067          	ret

0000000080003610 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80003610:	ff010113          	addi	sp,sp,-16
    80003614:	00813423          	sd	s0,8(sp)
    80003618:	01010413          	addi	s0,sp,16
    this->period = -1;
    8000361c:	fff00793          	li	a5,-1
    80003620:	02f53023          	sd	a5,32(a0)
}
    80003624:	00813403          	ld	s0,8(sp)
    80003628:	01010113          	addi	sp,sp,16
    8000362c:	00008067          	ret

0000000080003630 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    80003630:	fe010113          	addi	sp,sp,-32
    80003634:	00113c23          	sd	ra,24(sp)
    80003638:	00813823          	sd	s0,16(sp)
    8000363c:	00913423          	sd	s1,8(sp)
    80003640:	01213023          	sd	s2,0(sp)
    80003644:	02010413          	addi	s0,sp,32
    80003648:	00050493          	mv	s1,a0
    8000364c:	00058913          	mv	s2,a1
    80003650:	00000097          	auipc	ra,0x0
    80003654:	eb4080e7          	jalr	-332(ra) # 80003504 <_ZN6ThreadC1Ev>
    80003658:	0000a797          	auipc	a5,0xa
    8000365c:	8a878793          	addi	a5,a5,-1880 # 8000cf00 <_ZTV14PeriodicThread+0x10>
    80003660:	00f4b023          	sd	a5,0(s1)
    80003664:	0324b023          	sd	s2,32(s1)
}
    80003668:	01813083          	ld	ra,24(sp)
    8000366c:	01013403          	ld	s0,16(sp)
    80003670:	00813483          	ld	s1,8(sp)
    80003674:	00013903          	ld	s2,0(sp)
    80003678:	02010113          	addi	sp,sp,32
    8000367c:	00008067          	ret

0000000080003680 <_ZN7Console4getcEv>:

char Console::getc() {
    80003680:	ff010113          	addi	sp,sp,-16
    80003684:	00113423          	sd	ra,8(sp)
    80003688:	00813023          	sd	s0,0(sp)
    8000368c:	01010413          	addi	s0,sp,16
    return ::getc();
    80003690:	ffffe097          	auipc	ra,0xffffe
    80003694:	f70080e7          	jalr	-144(ra) # 80001600 <_Z4getcv>
}
    80003698:	00813083          	ld	ra,8(sp)
    8000369c:	00013403          	ld	s0,0(sp)
    800036a0:	01010113          	addi	sp,sp,16
    800036a4:	00008067          	ret

00000000800036a8 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    800036a8:	ff010113          	addi	sp,sp,-16
    800036ac:	00113423          	sd	ra,8(sp)
    800036b0:	00813023          	sd	s0,0(sp)
    800036b4:	01010413          	addi	s0,sp,16
    ::putc(c);
    800036b8:	ffffe097          	auipc	ra,0xffffe
    800036bc:	f70080e7          	jalr	-144(ra) # 80001628 <_Z4putcc>
}
    800036c0:	00813083          	ld	ra,8(sp)
    800036c4:	00013403          	ld	s0,0(sp)
    800036c8:	01010113          	addi	sp,sp,16
    800036cc:	00008067          	ret

00000000800036d0 <_ZN6Thread3runEv>:
    virtual void run() {}
    800036d0:	ff010113          	addi	sp,sp,-16
    800036d4:	00813423          	sd	s0,8(sp)
    800036d8:	01010413          	addi	s0,sp,16
    800036dc:	00813403          	ld	s0,8(sp)
    800036e0:	01010113          	addi	sp,sp,16
    800036e4:	00008067          	ret

00000000800036e8 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    800036e8:	ff010113          	addi	sp,sp,-16
    800036ec:	00813423          	sd	s0,8(sp)
    800036f0:	01010413          	addi	s0,sp,16
    800036f4:	00813403          	ld	s0,8(sp)
    800036f8:	01010113          	addi	sp,sp,16
    800036fc:	00008067          	ret

0000000080003700 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80003700:	ff010113          	addi	sp,sp,-16
    80003704:	00113423          	sd	ra,8(sp)
    80003708:	00813023          	sd	s0,0(sp)
    8000370c:	01010413          	addi	s0,sp,16
    80003710:	00009797          	auipc	a5,0x9
    80003714:	7f078793          	addi	a5,a5,2032 # 8000cf00 <_ZTV14PeriodicThread+0x10>
    80003718:	00f53023          	sd	a5,0(a0)
    8000371c:	00000097          	auipc	ra,0x0
    80003720:	a44080e7          	jalr	-1468(ra) # 80003160 <_ZN6ThreadD1Ev>
    80003724:	00813083          	ld	ra,8(sp)
    80003728:	00013403          	ld	s0,0(sp)
    8000372c:	01010113          	addi	sp,sp,16
    80003730:	00008067          	ret

0000000080003734 <_ZN14PeriodicThreadD0Ev>:
    80003734:	fe010113          	addi	sp,sp,-32
    80003738:	00113c23          	sd	ra,24(sp)
    8000373c:	00813823          	sd	s0,16(sp)
    80003740:	00913423          	sd	s1,8(sp)
    80003744:	02010413          	addi	s0,sp,32
    80003748:	00050493          	mv	s1,a0
    8000374c:	00009797          	auipc	a5,0x9
    80003750:	7b478793          	addi	a5,a5,1972 # 8000cf00 <_ZTV14PeriodicThread+0x10>
    80003754:	00f53023          	sd	a5,0(a0)
    80003758:	00000097          	auipc	ra,0x0
    8000375c:	a08080e7          	jalr	-1528(ra) # 80003160 <_ZN6ThreadD1Ev>
    80003760:	00048513          	mv	a0,s1
    80003764:	00000097          	auipc	ra,0x0
    80003768:	b00080e7          	jalr	-1280(ra) # 80003264 <_ZdlPv>
    8000376c:	01813083          	ld	ra,24(sp)
    80003770:	01013403          	ld	s0,16(sp)
    80003774:	00813483          	ld	s1,8(sp)
    80003778:	02010113          	addi	sp,sp,32
    8000377c:	00008067          	ret

0000000080003780 <_ZN3TCB7wrapperEv>:
    }

    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
}

void TCB::wrapper() {
    80003780:	ff010113          	addi	sp,sp,-16
    80003784:	00113423          	sd	ra,8(sp)
    80003788:	00813023          	sd	s0,0(sp)
    8000378c:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch)
    Riscv::returnFromInterrupt();
    80003790:	00000097          	auipc	ra,0x0
    80003794:	43c080e7          	jalr	1084(ra) # 80003bcc <_ZN5Riscv19returnFromInterruptEv>
    //na dalje se izvrsavamo u user modu (osim za kernel funkcije)
    running->threadFunction(running->args);
    80003798:	0000a797          	auipc	a5,0xa
    8000379c:	b407b783          	ld	a5,-1216(a5) # 8000d2d8 <_ZN3TCB7runningE>
    800037a0:	0107b703          	ld	a4,16(a5)
    800037a4:	0207b503          	ld	a0,32(a5)
    800037a8:	000700e7          	jalr	a4
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    800037ac:	ffffe097          	auipc	ra,0xffffe
    800037b0:	cec080e7          	jalr	-788(ra) # 80001498 <_Z11thread_exitv>
}
    800037b4:	00813083          	ld	ra,8(sp)
    800037b8:	00013403          	ld	s0,0(sp)
    800037bc:	01010113          	addi	sp,sp,16
    800037c0:	00008067          	ret

00000000800037c4 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    800037c4:	fe010113          	addi	sp,sp,-32
    800037c8:	00113c23          	sd	ra,24(sp)
    800037cc:	00813823          	sd	s0,16(sp)
    800037d0:	00913423          	sd	s1,8(sp)
    800037d4:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    800037d8:	0000a497          	auipc	s1,0xa
    800037dc:	b004b483          	ld	s1,-1280(s1) # 8000d2d8 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    800037e0:	0584a783          	lw	a5,88(s1)
    800037e4:	00100713          	li	a4,1
    800037e8:	04e78e63          	beq	a5,a4,80003844 <_ZN3TCB8dispatchEv+0x80>
    } else if (old->status == FINISHED) {
    800037ec:	00500713          	li	a4,5
    800037f0:	06e78263          	beq	a5,a4,80003854 <_ZN3TCB8dispatchEv+0x90>
    TCB::running = Scheduler::get();
    800037f4:	ffffe097          	auipc	ra,0xffffe
    800037f8:	778080e7          	jalr	1912(ra) # 80001f6c <_ZN9Scheduler3getEv>
    800037fc:	00050593          	mv	a1,a0
    80003800:	0000a797          	auipc	a5,0xa
    80003804:	ad878793          	addi	a5,a5,-1320 # 8000d2d8 <_ZN3TCB7runningE>
    80003808:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    8000380c:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == (TCB::Body)main || TCB::running->threadFunction == kernelConsumerFunction ||
    80003810:	01053783          	ld	a5,16(a0)
    80003814:	0000a717          	auipc	a4,0xa
    80003818:	92473703          	ld	a4,-1756(a4) # 8000d138 <_GLOBAL_OFFSET_TABLE_+0x70>
    8000381c:	04e78863          	beq	a5,a4,8000386c <_ZN3TCB8dispatchEv+0xa8>
    80003820:	0000a717          	auipc	a4,0xa
    80003824:	8e873703          	ld	a4,-1816(a4) # 8000d108 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003828:	04e78263          	beq	a5,a4,8000386c <_ZN3TCB8dispatchEv+0xa8>
    8000382c:	0000a717          	auipc	a4,0xa
    80003830:	93c73703          	ld	a4,-1732(a4) # 8000d168 <_GLOBAL_OFFSET_TABLE_+0xa0>
    80003834:	02e78c63          	beq	a5,a4,8000386c <_ZN3TCB8dispatchEv+0xa8>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003838:	10000793          	li	a5,256
    8000383c:	1007b073          	csrc	sstatus,a5
}
    80003840:	0340006f          	j	80003874 <_ZN3TCB8dispatchEv+0xb0>
        Scheduler::put(old);
    80003844:	00048513          	mv	a0,s1
    80003848:	ffffe097          	auipc	ra,0xffffe
    8000384c:	6d8080e7          	jalr	1752(ra) # 80001f20 <_ZN9Scheduler3putEP3TCB>
    80003850:	fa5ff06f          	j	800037f4 <_ZN3TCB8dispatchEv+0x30>
        delete old->stack;
    80003854:	0184b503          	ld	a0,24(s1)
    80003858:	00050663          	beqz	a0,80003864 <_ZN3TCB8dispatchEv+0xa0>
    8000385c:	00000097          	auipc	ra,0x0
    80003860:	a08080e7          	jalr	-1528(ra) # 80003264 <_ZdlPv>
        old->stack = nullptr;
    80003864:	0004bc23          	sd	zero,24(s1)
    80003868:	f8dff06f          	j	800037f4 <_ZN3TCB8dispatchEv+0x30>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    8000386c:	10000793          	li	a5,256
    80003870:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80003874:	00b48863          	beq	s1,a1,80003884 <_ZN3TCB8dispatchEv+0xc0>
    80003878:	00048513          	mv	a0,s1
    8000387c:	ffffe097          	auipc	ra,0xffffe
    80003880:	894080e7          	jalr	-1900(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80003884:	01813083          	ld	ra,24(sp)
    80003888:	01013403          	ld	s0,16(sp)
    8000388c:	00813483          	ld	s1,8(sp)
    80003890:	02010113          	addi	sp,sp,32
    80003894:	00008067          	ret

0000000080003898 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80003898:	ff010113          	addi	sp,sp,-16
    8000389c:	00113423          	sd	ra,8(sp)
    800038a0:	00813023          	sd	s0,0(sp)
    800038a4:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800038a8:	ffffe097          	auipc	ra,0xffffe
    800038ac:	aec080e7          	jalr	-1300(ra) # 80001394 <_Z9mem_allocm>
}
    800038b0:	00813083          	ld	ra,8(sp)
    800038b4:	00013403          	ld	s0,0(sp)
    800038b8:	01010113          	addi	sp,sp,16
    800038bc:	00008067          	ret

00000000800038c0 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    800038c0:	fd010113          	addi	sp,sp,-48
    800038c4:	02113423          	sd	ra,40(sp)
    800038c8:	02813023          	sd	s0,32(sp)
    800038cc:	00913c23          	sd	s1,24(sp)
    800038d0:	01213823          	sd	s2,16(sp)
    800038d4:	01313423          	sd	s3,8(sp)
    800038d8:	03010413          	addi	s0,sp,48
    800038dc:	00050913          	mv	s2,a0
    800038e0:	00058993          	mv	s3,a1
    800038e4:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    800038e8:	07000513          	li	a0,112
    800038ec:	00000097          	auipc	ra,0x0
    800038f0:	fac080e7          	jalr	-84(ra) # 80003898 <_ZN3TCBnwEm>
private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED), mySemaphore(nullptr),
                                                    joiningWithTCB(nullptr) {
    800038f4:	01253823          	sd	s2,16(a0)
    800038f8:	00953c23          	sd	s1,24(a0)
    800038fc:	03353023          	sd	s3,32(a0)
    80003900:	00200793          	li	a5,2
    80003904:	02f53423          	sd	a5,40(a0)
    80003908:	02053823          	sd	zero,48(a0)
    8000390c:	02053c23          	sd	zero,56(a0)
    80003910:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003914:	04053423          	sd	zero,72(a0)
    80003918:	04053823          	sd	zero,80(a0)
    8000391c:	04052c23          	sw	zero,88(a0)
    80003920:	06053023          	sd	zero,96(a0)
    80003924:	06053423          	sd	zero,104(a0)
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80003928:	0000a797          	auipc	a5,0xa
    8000392c:	8107b783          	ld	a5,-2032(a5) # 8000d138 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003930:	02f90e63          	beq	s2,a5,8000396c <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80003934:	00000797          	auipc	a5,0x0
    80003938:	e4c78793          	addi	a5,a5,-436 # 80003780 <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    8000393c:	02048c63          	beqz	s1,80003974 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb4>
    80003940:	00001637          	lui	a2,0x1
    80003944:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    80003948:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    8000394c:	00953423          	sd	s1,8(a0)
}
    80003950:	02813083          	ld	ra,40(sp)
    80003954:	02013403          	ld	s0,32(sp)
    80003958:	01813483          	ld	s1,24(sp)
    8000395c:	01013903          	ld	s2,16(sp)
    80003960:	00813983          	ld	s3,8(sp)
    80003964:	03010113          	addi	sp,sp,48
    80003968:	00008067          	ret
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    8000396c:	00000793          	li	a5,0
    80003970:	fcdff06f          	j	8000393c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x7c>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80003974:	00000493          	li	s1,0
    80003978:	fd1ff06f          	j	80003948 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x88>

000000008000397c <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    8000397c:	ff010113          	addi	sp,sp,-16
    80003980:	00113423          	sd	ra,8(sp)
    80003984:	00813023          	sd	s0,0(sp)
    80003988:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    8000398c:	ffffe097          	auipc	ra,0xffffe
    80003990:	a48080e7          	jalr	-1464(ra) # 800013d4 <_Z8mem_freePv>
}
    80003994:	00813083          	ld	ra,8(sp)
    80003998:	00013403          	ld	s0,0(sp)
    8000399c:	01010113          	addi	sp,sp,16
    800039a0:	00008067          	ret

00000000800039a4 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED || TCB::running == handle) return;
    800039a4:	05852703          	lw	a4,88(a0)
    800039a8:	00500793          	li	a5,5
    800039ac:	04f70463          	beq	a4,a5,800039f4 <_ZN3TCB10threadJoinEPS_+0x50>
    800039b0:	0000a597          	auipc	a1,0xa
    800039b4:	9285b583          	ld	a1,-1752(a1) # 8000d2d8 <_ZN3TCB7runningE>
    800039b8:	02a58e63          	beq	a1,a0,800039f4 <_ZN3TCB10threadJoinEPS_+0x50>
void TCB::threadJoin(TCB* handle) {
    800039bc:	ff010113          	addi	sp,sp,-16
    800039c0:	00113423          	sd	ra,8(sp)
    800039c4:	00813023          	sd	s0,0(sp)
    800039c8:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    800039cc:	00300793          	li	a5,3
    800039d0:	04f5ac23          	sw	a5,88(a1)
    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }
    800039d4:	06a5b423          	sd	a0,104(a1)
    TCB::running->setJoiningWithTCB(handle);
    handle->waitingToJoin.putLast(TCB::running);
    800039d8:	04850513          	addi	a0,a0,72
    800039dc:	ffffe097          	auipc	ra,0xffffe
    800039e0:	860080e7          	jalr	-1952(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
}
    800039e4:	00813083          	ld	ra,8(sp)
    800039e8:	00013403          	ld	s0,0(sp)
    800039ec:	01010113          	addi	sp,sp,16
    800039f0:	00008067          	ret
    800039f4:	00008067          	ret

00000000800039f8 <_ZN3TCB13releaseJoinedEPS_>:

void TCB::releaseJoined(TCB* handle) {
    800039f8:	fe010113          	addi	sp,sp,-32
    800039fc:	00113c23          	sd	ra,24(sp)
    80003a00:	00813823          	sd	s0,16(sp)
    80003a04:	00913423          	sd	s1,8(sp)
    80003a08:	02010413          	addi	s0,sp,32
    80003a0c:	00050493          	mv	s1,a0
        return front == nullptr;
    80003a10:	0484b783          	ld	a5,72(s1)
    while (!handle->waitingToJoin.isEmpty()) {
    80003a14:	02078063          	beqz	a5,80003a34 <_ZN3TCB13releaseJoinedEPS_+0x3c>
        TCB* tcb = handle->waitingToJoin.getFirst();
    80003a18:	04848513          	addi	a0,s1,72
    80003a1c:	ffffe097          	auipc	ra,0xffffe
    80003a20:	88c080e7          	jalr	-1908(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
    80003a24:	06053423          	sd	zero,104(a0)
        tcb->setJoiningWithTCB(nullptr);
        Scheduler::put(tcb);
    80003a28:	ffffe097          	auipc	ra,0xffffe
    80003a2c:	4f8080e7          	jalr	1272(ra) # 80001f20 <_ZN9Scheduler3putEP3TCB>
    while (!handle->waitingToJoin.isEmpty()) {
    80003a30:	fe1ff06f          	j	80003a10 <_ZN3TCB13releaseJoinedEPS_+0x18>
    }
}
    80003a34:	01813083          	ld	ra,24(sp)
    80003a38:	01013403          	ld	s0,16(sp)
    80003a3c:	00813483          	ld	s1,8(sp)
    80003a40:	02010113          	addi	sp,sp,32
    80003a44:	00008067          	ret

0000000080003a48 <_ZN3TCB10quitThreadEPS_>:

void TCB::quitThread(TCB* handle) {
    80003a48:	fe010113          	addi	sp,sp,-32
    80003a4c:	00113c23          	sd	ra,24(sp)
    80003a50:	00813823          	sd	s0,16(sp)
    80003a54:	00913423          	sd	s1,8(sp)
    80003a58:	02010413          	addi	s0,sp,32
    80003a5c:	00050493          	mv	s1,a0
    TCB* prev, * curr;
    switch (handle->status) {
    80003a60:	05852783          	lw	a5,88(a0)
    80003a64:	00300713          	li	a4,3
    80003a68:	10e78063          	beq	a5,a4,80003b68 <_ZN3TCB10quitThreadEPS_+0x120>
    80003a6c:	04f76263          	bltu	a4,a5,80003ab0 <_ZN3TCB10quitThreadEPS_+0x68>
    80003a70:	00100713          	li	a4,1
    80003a74:	06e78263          	beq	a5,a4,80003ad8 <_ZN3TCB10quitThreadEPS_+0x90>
    80003a78:	00200713          	li	a4,2
    80003a7c:	08e79e63          	bne	a5,a4,80003b18 <_ZN3TCB10quitThreadEPS_+0xd0>
            }
            curr->nextInScheduler = nullptr;
            break;
        case BLOCKED:
            //nit blokirana na semaforu, treba da se izbaci iz reda blokiranih na semaforu
            if (handle->mySemaphore->getBlocked()->remove(handle) < 0) {
    80003a80:	06053503          	ld	a0,96(a0)
    80003a84:	00048593          	mv	a1,s1
    80003a88:	00850513          	addi	a0,a0,8
    80003a8c:	ffffe097          	auipc	ra,0xffffe
    80003a90:	87c080e7          	jalr	-1924(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    80003a94:	08054263          	bltz	a0,80003b18 <_ZN3TCB10quitThreadEPS_+0xd0>
                //greska
            } else {
                handle->mySemaphore->increaseVal(1);
    80003a98:	0604b703          	ld	a4,96(s1)

    static void operator delete(void* ptr);

    ThreadQueue* getBlocked() { return &blocked; }

    void increaseVal(int add) { val += add; }
    80003a9c:	00072783          	lw	a5,0(a4)
    80003aa0:	0017879b          	addiw	a5,a5,1
    80003aa4:	00f72023          	sw	a5,0(a4)
                handle->mySemaphore = nullptr;
    80003aa8:	0604b023          	sd	zero,96(s1)
    80003aac:	06c0006f          	j	80003b18 <_ZN3TCB10quitThreadEPS_+0xd0>
    switch (handle->status) {
    80003ab0:	00400713          	li	a4,4
    80003ab4:	06e79263          	bne	a5,a4,80003b18 <_ZN3TCB10quitThreadEPS_+0xd0>

    static TCB* getTail() { return tail; }

    static void setTail(TCB* tcb) { tail = tcb; }

    static TCB* getSleepingHead() { return sleepingHead; }
    80003ab8:	00009797          	auipc	a5,0x9
    80003abc:	6a87b783          	ld	a5,1704(a5) # 8000d160 <_GLOBAL_OFFSET_TABLE_+0x98>
    80003ac0:	0007b783          	ld	a5,0(a5)
                handle->joiningWithTCB = nullptr;
            }
            break;
        case SLEEPING:
            //nit je u redu uspavanih, treba da se izbaci
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    80003ac4:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextSleeping);
    80003ac8:	0c978063          	beq	a5,s1,80003b88 <_ZN3TCB10quitThreadEPS_+0x140>
    80003acc:	00078713          	mv	a4,a5
    80003ad0:	0407b783          	ld	a5,64(a5)
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    80003ad4:	ff5ff06f          	j	80003ac8 <_ZN3TCB10quitThreadEPS_+0x80>
    static TCB* getHead() { return head; }
    80003ad8:	00009797          	auipc	a5,0x9
    80003adc:	6387b783          	ld	a5,1592(a5) # 8000d110 <_GLOBAL_OFFSET_TABLE_+0x48>
    80003ae0:	0007b783          	ld	a5,0(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    80003ae4:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextInScheduler);
    80003ae8:	00978863          	beq	a5,s1,80003af8 <_ZN3TCB10quitThreadEPS_+0xb0>
    80003aec:	00078713          	mv	a4,a5
    80003af0:	0307b783          	ld	a5,48(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    80003af4:	ff5ff06f          	j	80003ae8 <_ZN3TCB10quitThreadEPS_+0xa0>
            if (!prev) {
    80003af8:	04070663          	beqz	a4,80003b44 <_ZN3TCB10quitThreadEPS_+0xfc>
                prev->nextInScheduler = curr->nextInScheduler;
    80003afc:	0307b683          	ld	a3,48(a5)
    80003b00:	02d73823          	sd	a3,48(a4)
    static TCB* getTail() { return tail; }
    80003b04:	00009697          	auipc	a3,0x9
    80003b08:	5ec6b683          	ld	a3,1516(a3) # 8000d0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003b0c:	0006b683          	ld	a3,0(a3)
            if (curr == Scheduler::getTail()) {
    80003b10:	04d78463          	beq	a5,a3,80003b58 <_ZN3TCB10quitThreadEPS_+0x110>
            curr->nextInScheduler = nullptr;
    80003b14:	0207b823          	sd	zero,48(a5)
        case FINISHED:
            break;
        default:
            break;
    }
    handle->status = FINISHED;
    80003b18:	00500793          	li	a5,5
    80003b1c:	04f4ac23          	sw	a5,88(s1)
    delete handle->stack;
    80003b20:	0184b503          	ld	a0,24(s1)
    80003b24:	00050663          	beqz	a0,80003b30 <_ZN3TCB10quitThreadEPS_+0xe8>
    80003b28:	fffff097          	auipc	ra,0xfffff
    80003b2c:	73c080e7          	jalr	1852(ra) # 80003264 <_ZdlPv>
}
    80003b30:	01813083          	ld	ra,24(sp)
    80003b34:	01013403          	ld	s0,16(sp)
    80003b38:	00813483          	ld	s1,8(sp)
    80003b3c:	02010113          	addi	sp,sp,32
    80003b40:	00008067          	ret
                Scheduler::setHead(curr->nextInScheduler);
    80003b44:	0307b603          	ld	a2,48(a5)
    static void setHead(TCB* tcb) { head = tcb; }
    80003b48:	00009697          	auipc	a3,0x9
    80003b4c:	5c86b683          	ld	a3,1480(a3) # 8000d110 <_GLOBAL_OFFSET_TABLE_+0x48>
    80003b50:	00c6b023          	sd	a2,0(a3)
    80003b54:	fb1ff06f          	j	80003b04 <_ZN3TCB10quitThreadEPS_+0xbc>
    static void setTail(TCB* tcb) { tail = tcb; }
    80003b58:	00009697          	auipc	a3,0x9
    80003b5c:	5986b683          	ld	a3,1432(a3) # 8000d0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003b60:	00e6b023          	sd	a4,0(a3)
    80003b64:	fb1ff06f          	j	80003b14 <_ZN3TCB10quitThreadEPS_+0xcc>
            if (handle->joiningWithTCB->getListOfJoiningThreads()->remove(handle) < 0) {
    80003b68:	06853503          	ld	a0,104(a0)
    80003b6c:	00048593          	mv	a1,s1
    80003b70:	04850513          	addi	a0,a0,72
    80003b74:	ffffd097          	auipc	ra,0xffffd
    80003b78:	794080e7          	jalr	1940(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    80003b7c:	f8054ee3          	bltz	a0,80003b18 <_ZN3TCB10quitThreadEPS_+0xd0>
                handle->joiningWithTCB = nullptr;
    80003b80:	0604b423          	sd	zero,104(s1)
    80003b84:	f95ff06f          	j	80003b18 <_ZN3TCB10quitThreadEPS_+0xd0>
            if (!prev) {
    80003b88:	02070863          	beqz	a4,80003bb8 <_ZN3TCB10quitThreadEPS_+0x170>
                prev->nextSleeping = curr->nextSleeping;
    80003b8c:	0407b683          	ld	a3,64(a5)
    80003b90:	04d73023          	sd	a3,64(a4)
            if (curr->nextSleeping) {
    80003b94:	0407b703          	ld	a4,64(a5)
    80003b98:	00070a63          	beqz	a4,80003bac <_ZN3TCB10quitThreadEPS_+0x164>
                curr->nextSleeping->timeToSleep += curr->timeToSleep;
    80003b9c:	0387b603          	ld	a2,56(a5)
    80003ba0:	03873683          	ld	a3,56(a4)
    80003ba4:	00c686b3          	add	a3,a3,a2
    80003ba8:	02d73c23          	sd	a3,56(a4)
            curr->timeToSleep = 0;
    80003bac:	0207bc23          	sd	zero,56(a5)
            curr->nextSleeping = nullptr;
    80003bb0:	0407b023          	sd	zero,64(a5)
            break;
    80003bb4:	f65ff06f          	j	80003b18 <_ZN3TCB10quitThreadEPS_+0xd0>
                Scheduler::setSleepingHead(curr->nextSleeping);
    80003bb8:	0407b683          	ld	a3,64(a5)

    static void setSleepingHead(TCB* tcb) { sleepingHead = tcb; }
    80003bbc:	00009717          	auipc	a4,0x9
    80003bc0:	5a473703          	ld	a4,1444(a4) # 8000d160 <_GLOBAL_OFFSET_TABLE_+0x98>
    80003bc4:	00d73023          	sd	a3,0(a4)
    80003bc8:	fcdff06f          	j	80003b94 <_ZN3TCB10quitThreadEPS_+0x14c>

0000000080003bcc <_ZN5Riscv19returnFromInterruptEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::returnFromInterrupt() {
    80003bcc:	ff010113          	addi	sp,sp,-16
    80003bd0:	00813423          	sd	s0,8(sp)
    80003bd4:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80003bd8:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80003bdc:	10200073          	sret
    80003be0:	00813403          	ld	s0,8(sp)
    80003be4:	01010113          	addi	sp,sp,16
    80003be8:	00008067          	ret

0000000080003bec <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80003bec:	ff010113          	addi	sp,sp,-16
    80003bf0:	00113423          	sd	ra,8(sp)
    80003bf4:	00813023          	sd	s0,0(sp)
    80003bf8:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003bfc:	ffffd097          	auipc	ra,0xffffd
    80003c00:	798080e7          	jalr	1944(ra) # 80001394 <_Z9mem_allocm>
}
    80003c04:	00813083          	ld	ra,8(sp)
    80003c08:	00013403          	ld	s0,0(sp)
    80003c0c:	01010113          	addi	sp,sp,16
    80003c10:	00008067          	ret

0000000080003c14 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80003c14:	ff010113          	addi	sp,sp,-16
    80003c18:	00113423          	sd	ra,8(sp)
    80003c1c:	00813023          	sd	s0,0(sp)
    80003c20:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003c24:	ffffd097          	auipc	ra,0xffffd
    80003c28:	7b0080e7          	jalr	1968(ra) # 800013d4 <_Z8mem_freePv>
}
    80003c2c:	00813083          	ld	ra,8(sp)
    80003c30:	00013403          	ld	s0,0(sp)
    80003c34:	01010113          	addi	sp,sp,16
    80003c38:	00008067          	ret

0000000080003c3c <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003c3c:	fe010113          	addi	sp,sp,-32
    80003c40:	00113c23          	sd	ra,24(sp)
    80003c44:	00813823          	sd	s0,16(sp)
    80003c48:	00913423          	sd	s1,8(sp)
    80003c4c:	02010413          	addi	s0,sp,32
    80003c50:	00050493          	mv	s1,a0
	return new KSem(val);
    80003c54:	01800513          	li	a0,24
    80003c58:	00000097          	auipc	ra,0x0
    80003c5c:	f94080e7          	jalr	-108(ra) # 80003bec <_ZN4KSemnwEm>
    void block();

    void unblock();

private:
    KSem(uint val) : val(val) {}
    80003c60:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003c64:	00053423          	sd	zero,8(a0)
    80003c68:	00053823          	sd	zero,16(a0)
}
    80003c6c:	01813083          	ld	ra,24(sp)
    80003c70:	01013403          	ld	s0,16(sp)
    80003c74:	00813483          	ld	s1,8(sp)
    80003c78:	02010113          	addi	sp,sp,32
    80003c7c:	00008067          	ret

0000000080003c80 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003c80:	ff010113          	addi	sp,sp,-16
    80003c84:	00113423          	sd	ra,8(sp)
    80003c88:	00813023          	sd	s0,0(sp)
    80003c8c:	01010413          	addi	s0,sp,16
    static TCB* getRunning() { return running; }
    80003c90:	00009797          	auipc	a5,0x9
    80003c94:	4b87b783          	ld	a5,1208(a5) # 8000d148 <_GLOBAL_OFFSET_TABLE_+0x80>
    80003c98:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80003c9c:	00200793          	li	a5,2
    80003ca0:	04f5ac23          	sw	a5,88(a1)
    void setMySemaphore(KSem* sem) { mySemaphore = sem; }
    80003ca4:	06a5b023          	sd	a0,96(a1)
    TCB::getRunning()->setStatus(TCB::BLOCKED);
    TCB::getRunning()->setMySemaphore(this);
	blocked.putLast(TCB::getRunning());
    80003ca8:	00850513          	addi	a0,a0,8
    80003cac:	ffffd097          	auipc	ra,0xffffd
    80003cb0:	590080e7          	jalr	1424(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::dispatch();
    80003cb4:	00000097          	auipc	ra,0x0
    80003cb8:	b10080e7          	jalr	-1264(ra) # 800037c4 <_ZN3TCB8dispatchEv>
}
    80003cbc:	00813083          	ld	ra,8(sp)
    80003cc0:	00013403          	ld	s0,0(sp)
    80003cc4:	01010113          	addi	sp,sp,16
    80003cc8:	00008067          	ret

0000000080003ccc <_ZN4KSem4waitEv>:
	if (--val < 0) {
    80003ccc:	00052783          	lw	a5,0(a0)
    80003cd0:	fff7879b          	addiw	a5,a5,-1
    80003cd4:	00f52023          	sw	a5,0(a0)
    80003cd8:	02079713          	slli	a4,a5,0x20
    80003cdc:	00074663          	bltz	a4,80003ce8 <_ZN4KSem4waitEv+0x1c>
	return 0;
    80003ce0:	00000513          	li	a0,0
}
    80003ce4:	00008067          	ret
int KSem::wait() {
    80003ce8:	ff010113          	addi	sp,sp,-16
    80003cec:	00113423          	sd	ra,8(sp)
    80003cf0:	00813023          	sd	s0,0(sp)
    80003cf4:	01010413          	addi	s0,sp,16
		block();
    80003cf8:	00000097          	auipc	ra,0x0
    80003cfc:	f88080e7          	jalr	-120(ra) # 80003c80 <_ZN4KSem5blockEv>
		return -1;
    80003d00:	fff00513          	li	a0,-1
}
    80003d04:	00813083          	ld	ra,8(sp)
    80003d08:	00013403          	ld	s0,0(sp)
    80003d0c:	01010113          	addi	sp,sp,16
    80003d10:	00008067          	ret

0000000080003d14 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003d14:	ff010113          	addi	sp,sp,-16
    80003d18:	00113423          	sd	ra,8(sp)
    80003d1c:	00813023          	sd	s0,0(sp)
    80003d20:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003d24:	00850513          	addi	a0,a0,8
    80003d28:	ffffd097          	auipc	ra,0xffffd
    80003d2c:	580080e7          	jalr	1408(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
    80003d30:	06053023          	sd	zero,96(a0)
    tcb->setMySemaphore(nullptr);
	Scheduler::put(tcb);
    80003d34:	ffffe097          	auipc	ra,0xffffe
    80003d38:	1ec080e7          	jalr	492(ra) # 80001f20 <_ZN9Scheduler3putEP3TCB>
}
    80003d3c:	00813083          	ld	ra,8(sp)
    80003d40:	00013403          	ld	s0,0(sp)
    80003d44:	01010113          	addi	sp,sp,16
    80003d48:	00008067          	ret

0000000080003d4c <_ZN4KSem6signalEv>:
	if (val++ < 0) {
    80003d4c:	00052783          	lw	a5,0(a0)
    80003d50:	0017871b          	addiw	a4,a5,1
    80003d54:	00e52023          	sw	a4,0(a0)
    80003d58:	0007c663          	bltz	a5,80003d64 <_ZN4KSem6signalEv+0x18>
}
    80003d5c:	00000513          	li	a0,0
    80003d60:	00008067          	ret
int KSem::signal() {
    80003d64:	ff010113          	addi	sp,sp,-16
    80003d68:	00113423          	sd	ra,8(sp)
    80003d6c:	00813023          	sd	s0,0(sp)
    80003d70:	01010413          	addi	s0,sp,16
		unblock();
    80003d74:	00000097          	auipc	ra,0x0
    80003d78:	fa0080e7          	jalr	-96(ra) # 80003d14 <_ZN4KSem7unblockEv>
}
    80003d7c:	00000513          	li	a0,0
    80003d80:	00813083          	ld	ra,8(sp)
    80003d84:	00013403          	ld	s0,0(sp)
    80003d88:	01010113          	addi	sp,sp,16
    80003d8c:	00008067          	ret

0000000080003d90 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003d90:	fe010113          	addi	sp,sp,-32
    80003d94:	00113c23          	sd	ra,24(sp)
    80003d98:	00813823          	sd	s0,16(sp)
    80003d9c:	00913423          	sd	s1,8(sp)
    80003da0:	02010413          	addi	s0,sp,32
    80003da4:	00050493          	mv	s1,a0
        return front == nullptr;
    80003da8:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003dac:	00078a63          	beqz	a5,80003dc0 <_ZN4KSem8closeSemEPS_+0x30>
		handle->unblock();
    80003db0:	00048513          	mv	a0,s1
    80003db4:	00000097          	auipc	ra,0x0
    80003db8:	f60080e7          	jalr	-160(ra) # 80003d14 <_ZN4KSem7unblockEv>
	while (!handle->blocked.isEmpty()) {
    80003dbc:	fedff06f          	j	80003da8 <_ZN4KSem8closeSemEPS_+0x18>
	}
	return 0;
}
    80003dc0:	00000513          	li	a0,0
    80003dc4:	01813083          	ld	ra,24(sp)
    80003dc8:	01013403          	ld	s0,16(sp)
    80003dcc:	00813483          	ld	s1,8(sp)
    80003dd0:	02010113          	addi	sp,sp,32
    80003dd4:	00008067          	ret

0000000080003dd8 <_Z13emptyFunctionPv>:
void idle(void*);

void kernelConsumerFunction(void*);


void emptyFunction(void*) {}
    80003dd8:	ff010113          	addi	sp,sp,-16
    80003ddc:	00813423          	sd	s0,8(sp)
    80003de0:	01010413          	addi	s0,sp,16
    80003de4:	00813403          	ld	s0,8(sp)
    80003de8:	01010113          	addi	sp,sp,16
    80003dec:	00008067          	ret

0000000080003df0 <_Z5nit1fPv>:

void nit1f(void*) {
    80003df0:	fe010113          	addi	sp,sp,-32
    80003df4:	00113c23          	sd	ra,24(sp)
    80003df8:	00813823          	sd	s0,16(sp)
    80003dfc:	02010413          	addi	s0,sp,32
    while (true) {
        thread_t handle;
        thread_create(&handle, emptyFunction, nullptr);
    80003e00:	00000613          	li	a2,0
    80003e04:	00000597          	auipc	a1,0x0
    80003e08:	fd458593          	addi	a1,a1,-44 # 80003dd8 <_Z13emptyFunctionPv>
    80003e0c:	fe840513          	addi	a0,s0,-24
    80003e10:	ffffd097          	auipc	ra,0xffffd
    80003e14:	5f4080e7          	jalr	1524(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    while (true) {
    80003e18:	fe9ff06f          	j	80003e00 <_Z5nit1fPv+0x10>

0000000080003e1c <_Z5nit2fPv>:
    }

    printString("\nGotova nit 1\n");
}

void nit2f(void* arg2) {
    80003e1c:	ff010113          	addi	sp,sp,-16
    80003e20:	00113423          	sd	ra,8(sp)
    80003e24:	00813023          	sd	s0,0(sp)
    80003e28:	01010413          	addi	s0,sp,16
    printString("\nGotova nit 2\n");
    80003e2c:	00006517          	auipc	a0,0x6
    80003e30:	20450513          	addi	a0,a0,516 # 8000a030 <CONSOLE_STATUS+0x20>
    80003e34:	00002097          	auipc	ra,0x2
    80003e38:	658080e7          	jalr	1624(ra) # 8000648c <_Z11printStringPKc>
}
    80003e3c:	00813083          	ld	ra,8(sp)
    80003e40:	00013403          	ld	s0,0(sp)
    80003e44:	01010113          	addi	sp,sp,16
    80003e48:	00008067          	ret

0000000080003e4c <_Z5nit3fPv>:


void nit3f(void*) {
    80003e4c:	fe010113          	addi	sp,sp,-32
    80003e50:	00113c23          	sd	ra,24(sp)
    80003e54:	00813823          	sd	s0,16(sp)
    80003e58:	00913423          	sd	s1,8(sp)
    80003e5c:	02010413          	addi	s0,sp,32
    80003e60:	0180006f          	j	80003e78 <_Z5nit3fPv+0x2c>
    char slovo;
    do {
        slovo = getc();
        putc(slovo);
        if (slovo == '\r') putc('\n');
    80003e64:	00a00513          	li	a0,10
    80003e68:	ffffd097          	auipc	ra,0xffffd
    80003e6c:	7c0080e7          	jalr	1984(ra) # 80001628 <_Z4putcc>
    } while (slovo != '0');
    80003e70:	03000793          	li	a5,48
    80003e74:	02f48263          	beq	s1,a5,80003e98 <_Z5nit3fPv+0x4c>
        slovo = getc();
    80003e78:	ffffd097          	auipc	ra,0xffffd
    80003e7c:	788080e7          	jalr	1928(ra) # 80001600 <_Z4getcv>
    80003e80:	00050493          	mv	s1,a0
        putc(slovo);
    80003e84:	ffffd097          	auipc	ra,0xffffd
    80003e88:	7a4080e7          	jalr	1956(ra) # 80001628 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    80003e8c:	00d00793          	li	a5,13
    80003e90:	fef490e3          	bne	s1,a5,80003e70 <_Z5nit3fPv+0x24>
    80003e94:	fd1ff06f          	j	80003e64 <_Z5nit3fPv+0x18>

    printString("\nGotova nit3\n");
    80003e98:	00006517          	auipc	a0,0x6
    80003e9c:	1a850513          	addi	a0,a0,424 # 8000a040 <CONSOLE_STATUS+0x30>
    80003ea0:	00002097          	auipc	ra,0x2
    80003ea4:	5ec080e7          	jalr	1516(ra) # 8000648c <_Z11printStringPKc>
}
    80003ea8:	01813083          	ld	ra,24(sp)
    80003eac:	01013403          	ld	s0,16(sp)
    80003eb0:	00813483          	ld	s1,8(sp)
    80003eb4:	02010113          	addi	sp,sp,32
    80003eb8:	00008067          	ret

0000000080003ebc <_Z5main5v>:


int main5() {
    80003ebc:	fb010113          	addi	sp,sp,-80
    80003ec0:	04113423          	sd	ra,72(sp)
    80003ec4:	04813023          	sd	s0,64(sp)
    80003ec8:	02913c23          	sd	s1,56(sp)
    80003ecc:	05010413          	addi	s0,sp,80
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80003ed0:	00009797          	auipc	a5,0x9
    80003ed4:	2887b783          	ld	a5,648(a5) # 8000d158 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003ed8:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80003edc:	ffffe097          	auipc	ra,0xffffe
    80003ee0:	384080e7          	jalr	900(ra) # 80002260 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80003ee4:	ffffe097          	auipc	ra,0xffffe
    80003ee8:	828080e7          	jalr	-2008(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>

    //testiranje kreiranja niti
    thread_t glavnaNit = nullptr;
    80003eec:	fc043c23          	sd	zero,-40(s0)
    thread_t nit1 = nullptr;
    80003ef0:	fc043823          	sd	zero,-48(s0)
    thread_t nit2 = nullptr;
    80003ef4:	fc043423          	sd	zero,-56(s0)
    thread_t nit3 = nullptr;
    80003ef8:	fc043023          	sd	zero,-64(s0)
    thread_t idleNit = nullptr;
    80003efc:	fa043c23          	sd	zero,-72(s0)
    thread_t kernelConsumerThread = nullptr;
    80003f00:	fa043823          	sd	zero,-80(s0)
    thread_create(&glavnaNit, (TCB::Body)main, nullptr);
    80003f04:	00000613          	li	a2,0
    80003f08:	00009597          	auipc	a1,0x9
    80003f0c:	2305b583          	ld	a1,560(a1) # 8000d138 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003f10:	fd840513          	addi	a0,s0,-40
    80003f14:	ffffd097          	auipc	ra,0xffffd
    80003f18:	4f0080e7          	jalr	1264(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }
    80003f1c:	fd843703          	ld	a4,-40(s0)
    80003f20:	00009797          	auipc	a5,0x9
    80003f24:	2287b783          	ld	a5,552(a5) # 8000d148 <_GLOBAL_OFFSET_TABLE_+0x80>
    80003f28:	00e7b023          	sd	a4,0(a5)
    TCB::setRunning(glavnaNit);
    thread_create(&idleNit, idle, nullptr);
    80003f2c:	00000613          	li	a2,0
    80003f30:	00009597          	auipc	a1,0x9
    80003f34:	2385b583          	ld	a1,568(a1) # 8000d168 <_GLOBAL_OFFSET_TABLE_+0xa0>
    80003f38:	fb840513          	addi	a0,s0,-72
    80003f3c:	ffffd097          	auipc	ra,0xffffd
    80003f40:	4c8080e7          	jalr	1224(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    80003f44:	00000613          	li	a2,0
    80003f48:	00009597          	auipc	a1,0x9
    80003f4c:	1c05b583          	ld	a1,448(a1) # 8000d108 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003f50:	fb040513          	addi	a0,s0,-80
    80003f54:	ffffd097          	auipc	ra,0xffffd
    80003f58:	4b0080e7          	jalr	1200(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>


    thread_create(&nit1, nit1f, nullptr);
    80003f5c:	00000613          	li	a2,0
    80003f60:	00000597          	auipc	a1,0x0
    80003f64:	e9058593          	addi	a1,a1,-368 # 80003df0 <_Z5nit1fPv>
    80003f68:	fd040513          	addi	a0,s0,-48
    80003f6c:	ffffd097          	auipc	ra,0xffffd
    80003f70:	498080e7          	jalr	1176(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit2, nit2f, nullptr);
    80003f74:	00000613          	li	a2,0
    80003f78:	00000597          	auipc	a1,0x0
    80003f7c:	ea458593          	addi	a1,a1,-348 # 80003e1c <_Z5nit2fPv>
    80003f80:	fc840513          	addi	a0,s0,-56
    80003f84:	ffffd097          	auipc	ra,0xffffd
    80003f88:	480080e7          	jalr	1152(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit3, nit3f, nullptr);
    80003f8c:	00000613          	li	a2,0
    80003f90:	00000597          	auipc	a1,0x0
    80003f94:	ebc58593          	addi	a1,a1,-324 # 80003e4c <_Z5nit3fPv>
    80003f98:	fc040513          	addi	a0,s0,-64
    80003f9c:	ffffd097          	auipc	ra,0xffffd
    80003fa0:	468080e7          	jalr	1128(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    80003fa4:	00200493          	li	s1,2
    80003fa8:	1004a073          	csrs	sstatus,s1

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    thread_join(nit1);
    80003fac:	fd043503          	ld	a0,-48(s0)
    80003fb0:	ffffd097          	auipc	ra,0xffffd
    80003fb4:	530080e7          	jalr	1328(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit2);
    80003fb8:	fc843503          	ld	a0,-56(s0)
    80003fbc:	ffffd097          	auipc	ra,0xffffd
    80003fc0:	524080e7          	jalr	1316(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit3);
    80003fc4:	fc043503          	ld	a0,-64(s0)
    80003fc8:	ffffd097          	auipc	ra,0xffffd
    80003fcc:	518080e7          	jalr	1304(ra) # 800014e0 <_Z11thread_joinP3TCB>
    //thread_join(idleNit);

    printString("\nGotove user niti\n");
    80003fd0:	00006517          	auipc	a0,0x6
    80003fd4:	31050513          	addi	a0,a0,784 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80003fd8:	00002097          	auipc	ra,0x2
    80003fdc:	4b4080e7          	jalr	1204(ra) # 8000648c <_Z11printStringPKc>

    printString("\nSad cu da izadjem\n");
    80003fe0:	00006517          	auipc	a0,0x6
    80003fe4:	31850513          	addi	a0,a0,792 # 8000a2f8 <CONSOLE_STATUS+0x2e8>
    80003fe8:	00002097          	auipc	ra,0x2
    80003fec:	4a4080e7          	jalr	1188(ra) # 8000648c <_Z11printStringPKc>
        __asm__ volatile("li a0, 0x43");
    80003ff0:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80003ff4:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003ff8:	1004b073          	csrc	sstatus,s1
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);


    return 0;
    80003ffc:	00000513          	li	a0,0
    80004000:	04813083          	ld	ra,72(sp)
    80004004:	04013403          	ld	s0,64(sp)
    80004008:	03813483          	ld	s1,56(sp)
    8000400c:	05010113          	addi	sp,sp,80
    80004010:	00008067          	ret

0000000080004014 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80004014:	fe010113          	addi	sp,sp,-32
    80004018:	00113c23          	sd	ra,24(sp)
    8000401c:	00813823          	sd	s0,16(sp)
    80004020:	00913423          	sd	s1,8(sp)
    80004024:	01213023          	sd	s2,0(sp)
    80004028:	02010413          	addi	s0,sp,32
    8000402c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004030:	00000913          	li	s2,0
    80004034:	00c0006f          	j	80004040 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80004038:	ffffd097          	auipc	ra,0xffffd
    8000403c:	488080e7          	jalr	1160(ra) # 800014c0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80004040:	ffffd097          	auipc	ra,0xffffd
    80004044:	5c0080e7          	jalr	1472(ra) # 80001600 <_Z4getcv>
    80004048:	0005059b          	sext.w	a1,a0
    8000404c:	02d00793          	li	a5,45
    80004050:	02f58a63          	beq	a1,a5,80004084 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80004054:	0084b503          	ld	a0,8(s1)
    80004058:	00003097          	auipc	ra,0x3
    8000405c:	400080e7          	jalr	1024(ra) # 80007458 <_ZN6Buffer3putEi>
        i++;
    80004060:	0019071b          	addiw	a4,s2,1
    80004064:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004068:	0004a683          	lw	a3,0(s1)
    8000406c:	0026979b          	slliw	a5,a3,0x2
    80004070:	00d787bb          	addw	a5,a5,a3
    80004074:	0017979b          	slliw	a5,a5,0x1
    80004078:	02f767bb          	remw	a5,a4,a5
    8000407c:	fc0792e3          	bnez	a5,80004040 <_ZL16producerKeyboardPv+0x2c>
    80004080:	fb9ff06f          	j	80004038 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80004084:	00100793          	li	a5,1
    80004088:	00009717          	auipc	a4,0x9
    8000408c:	26f72023          	sw	a5,608(a4) # 8000d2e8 <_ZL9threadEnd>
    data->buffer->put('!');
    80004090:	02100593          	li	a1,33
    80004094:	0084b503          	ld	a0,8(s1)
    80004098:	00003097          	auipc	ra,0x3
    8000409c:	3c0080e7          	jalr	960(ra) # 80007458 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800040a0:	0104b503          	ld	a0,16(s1)
    800040a4:	ffffd097          	auipc	ra,0xffffd
    800040a8:	52c080e7          	jalr	1324(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    800040ac:	01813083          	ld	ra,24(sp)
    800040b0:	01013403          	ld	s0,16(sp)
    800040b4:	00813483          	ld	s1,8(sp)
    800040b8:	00013903          	ld	s2,0(sp)
    800040bc:	02010113          	addi	sp,sp,32
    800040c0:	00008067          	ret

00000000800040c4 <_ZL8producerPv>:

static void producer(void *arg) {
    800040c4:	fe010113          	addi	sp,sp,-32
    800040c8:	00113c23          	sd	ra,24(sp)
    800040cc:	00813823          	sd	s0,16(sp)
    800040d0:	00913423          	sd	s1,8(sp)
    800040d4:	01213023          	sd	s2,0(sp)
    800040d8:	02010413          	addi	s0,sp,32
    800040dc:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800040e0:	00000913          	li	s2,0
    800040e4:	00c0006f          	j	800040f0 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800040e8:	ffffd097          	auipc	ra,0xffffd
    800040ec:	3d8080e7          	jalr	984(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    800040f0:	00009797          	auipc	a5,0x9
    800040f4:	1f87a783          	lw	a5,504(a5) # 8000d2e8 <_ZL9threadEnd>
    800040f8:	02079e63          	bnez	a5,80004134 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    800040fc:	0004a583          	lw	a1,0(s1)
    80004100:	0305859b          	addiw	a1,a1,48
    80004104:	0084b503          	ld	a0,8(s1)
    80004108:	00003097          	auipc	ra,0x3
    8000410c:	350080e7          	jalr	848(ra) # 80007458 <_ZN6Buffer3putEi>
        i++;
    80004110:	0019071b          	addiw	a4,s2,1
    80004114:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004118:	0004a683          	lw	a3,0(s1)
    8000411c:	0026979b          	slliw	a5,a3,0x2
    80004120:	00d787bb          	addw	a5,a5,a3
    80004124:	0017979b          	slliw	a5,a5,0x1
    80004128:	02f767bb          	remw	a5,a4,a5
    8000412c:	fc0792e3          	bnez	a5,800040f0 <_ZL8producerPv+0x2c>
    80004130:	fb9ff06f          	j	800040e8 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80004134:	0104b503          	ld	a0,16(s1)
    80004138:	ffffd097          	auipc	ra,0xffffd
    8000413c:	498080e7          	jalr	1176(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80004140:	01813083          	ld	ra,24(sp)
    80004144:	01013403          	ld	s0,16(sp)
    80004148:	00813483          	ld	s1,8(sp)
    8000414c:	00013903          	ld	s2,0(sp)
    80004150:	02010113          	addi	sp,sp,32
    80004154:	00008067          	ret

0000000080004158 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80004158:	fd010113          	addi	sp,sp,-48
    8000415c:	02113423          	sd	ra,40(sp)
    80004160:	02813023          	sd	s0,32(sp)
    80004164:	00913c23          	sd	s1,24(sp)
    80004168:	01213823          	sd	s2,16(sp)
    8000416c:	01313423          	sd	s3,8(sp)
    80004170:	03010413          	addi	s0,sp,48
    80004174:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004178:	00000993          	li	s3,0
    8000417c:	01c0006f          	j	80004198 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80004180:	ffffd097          	auipc	ra,0xffffd
    80004184:	340080e7          	jalr	832(ra) # 800014c0 <_Z15thread_dispatchv>
    80004188:	0500006f          	j	800041d8 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    8000418c:	00a00513          	li	a0,10
    80004190:	ffffd097          	auipc	ra,0xffffd
    80004194:	498080e7          	jalr	1176(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    80004198:	00009797          	auipc	a5,0x9
    8000419c:	1507a783          	lw	a5,336(a5) # 8000d2e8 <_ZL9threadEnd>
    800041a0:	06079063          	bnez	a5,80004200 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800041a4:	00893503          	ld	a0,8(s2)
    800041a8:	00003097          	auipc	ra,0x3
    800041ac:	340080e7          	jalr	832(ra) # 800074e8 <_ZN6Buffer3getEv>
        i++;
    800041b0:	0019849b          	addiw	s1,s3,1
    800041b4:	0004899b          	sext.w	s3,s1
        putc(key);
    800041b8:	0ff57513          	andi	a0,a0,255
    800041bc:	ffffd097          	auipc	ra,0xffffd
    800041c0:	46c080e7          	jalr	1132(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800041c4:	00092703          	lw	a4,0(s2)
    800041c8:	0027179b          	slliw	a5,a4,0x2
    800041cc:	00e787bb          	addw	a5,a5,a4
    800041d0:	02f4e7bb          	remw	a5,s1,a5
    800041d4:	fa0786e3          	beqz	a5,80004180 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800041d8:	05000793          	li	a5,80
    800041dc:	02f4e4bb          	remw	s1,s1,a5
    800041e0:	fa049ce3          	bnez	s1,80004198 <_ZL8consumerPv+0x40>
    800041e4:	fa9ff06f          	j	8000418c <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800041e8:	00893503          	ld	a0,8(s2)
    800041ec:	00003097          	auipc	ra,0x3
    800041f0:	2fc080e7          	jalr	764(ra) # 800074e8 <_ZN6Buffer3getEv>
        putc(key);
    800041f4:	0ff57513          	andi	a0,a0,255
    800041f8:	ffffd097          	auipc	ra,0xffffd
    800041fc:	430080e7          	jalr	1072(ra) # 80001628 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80004200:	00893503          	ld	a0,8(s2)
    80004204:	00003097          	auipc	ra,0x3
    80004208:	370080e7          	jalr	880(ra) # 80007574 <_ZN6Buffer6getCntEv>
    8000420c:	fca04ee3          	bgtz	a0,800041e8 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80004210:	01093503          	ld	a0,16(s2)
    80004214:	ffffd097          	auipc	ra,0xffffd
    80004218:	3bc080e7          	jalr	956(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    8000421c:	02813083          	ld	ra,40(sp)
    80004220:	02013403          	ld	s0,32(sp)
    80004224:	01813483          	ld	s1,24(sp)
    80004228:	01013903          	ld	s2,16(sp)
    8000422c:	00813983          	ld	s3,8(sp)
    80004230:	03010113          	addi	sp,sp,48
    80004234:	00008067          	ret

0000000080004238 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80004238:	f9010113          	addi	sp,sp,-112
    8000423c:	06113423          	sd	ra,104(sp)
    80004240:	06813023          	sd	s0,96(sp)
    80004244:	04913c23          	sd	s1,88(sp)
    80004248:	05213823          	sd	s2,80(sp)
    8000424c:	05313423          	sd	s3,72(sp)
    80004250:	05413023          	sd	s4,64(sp)
    80004254:	03513c23          	sd	s5,56(sp)
    80004258:	03613823          	sd	s6,48(sp)
    8000425c:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80004260:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80004264:	00006517          	auipc	a0,0x6
    80004268:	0ac50513          	addi	a0,a0,172 # 8000a310 <CONSOLE_STATUS+0x300>
    8000426c:	00002097          	auipc	ra,0x2
    80004270:	220080e7          	jalr	544(ra) # 8000648c <_Z11printStringPKc>
    getString(input, 30);
    80004274:	01e00593          	li	a1,30
    80004278:	fa040493          	addi	s1,s0,-96
    8000427c:	00048513          	mv	a0,s1
    80004280:	00002097          	auipc	ra,0x2
    80004284:	294080e7          	jalr	660(ra) # 80006514 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004288:	00048513          	mv	a0,s1
    8000428c:	00002097          	auipc	ra,0x2
    80004290:	360080e7          	jalr	864(ra) # 800065ec <_Z11stringToIntPKc>
    80004294:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80004298:	00006517          	auipc	a0,0x6
    8000429c:	09850513          	addi	a0,a0,152 # 8000a330 <CONSOLE_STATUS+0x320>
    800042a0:	00002097          	auipc	ra,0x2
    800042a4:	1ec080e7          	jalr	492(ra) # 8000648c <_Z11printStringPKc>
    getString(input, 30);
    800042a8:	01e00593          	li	a1,30
    800042ac:	00048513          	mv	a0,s1
    800042b0:	00002097          	auipc	ra,0x2
    800042b4:	264080e7          	jalr	612(ra) # 80006514 <_Z9getStringPci>
    n = stringToInt(input);
    800042b8:	00048513          	mv	a0,s1
    800042bc:	00002097          	auipc	ra,0x2
    800042c0:	330080e7          	jalr	816(ra) # 800065ec <_Z11stringToIntPKc>
    800042c4:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    800042c8:	00006517          	auipc	a0,0x6
    800042cc:	08850513          	addi	a0,a0,136 # 8000a350 <CONSOLE_STATUS+0x340>
    800042d0:	00002097          	auipc	ra,0x2
    800042d4:	1bc080e7          	jalr	444(ra) # 8000648c <_Z11printStringPKc>
	printInt(threadNum);
    800042d8:	00000613          	li	a2,0
    800042dc:	00a00593          	li	a1,10
    800042e0:	00090513          	mv	a0,s2
    800042e4:	00002097          	auipc	ra,0x2
    800042e8:	358080e7          	jalr	856(ra) # 8000663c <_Z8printIntiii>
    printString(" i velicina bafera ");
    800042ec:	00006517          	auipc	a0,0x6
    800042f0:	07c50513          	addi	a0,a0,124 # 8000a368 <CONSOLE_STATUS+0x358>
    800042f4:	00002097          	auipc	ra,0x2
    800042f8:	198080e7          	jalr	408(ra) # 8000648c <_Z11printStringPKc>
	printInt(n);
    800042fc:	00000613          	li	a2,0
    80004300:	00a00593          	li	a1,10
    80004304:	00048513          	mv	a0,s1
    80004308:	00002097          	auipc	ra,0x2
    8000430c:	334080e7          	jalr	820(ra) # 8000663c <_Z8printIntiii>
    printString(".\n");
    80004310:	00006517          	auipc	a0,0x6
    80004314:	07050513          	addi	a0,a0,112 # 8000a380 <CONSOLE_STATUS+0x370>
    80004318:	00002097          	auipc	ra,0x2
    8000431c:	174080e7          	jalr	372(ra) # 8000648c <_Z11printStringPKc>
    if(threadNum > n) {
    80004320:	0324c463          	blt	s1,s2,80004348 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80004324:	03205c63          	blez	s2,8000435c <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80004328:	03800513          	li	a0,56
    8000432c:	fffff097          	auipc	ra,0xfffff
    80004330:	ee8080e7          	jalr	-280(ra) # 80003214 <_Znwm>
    80004334:	00050a13          	mv	s4,a0
    80004338:	00048593          	mv	a1,s1
    8000433c:	00003097          	auipc	ra,0x3
    80004340:	080080e7          	jalr	128(ra) # 800073bc <_ZN6BufferC1Ei>
    80004344:	0300006f          	j	80004374 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004348:	00006517          	auipc	a0,0x6
    8000434c:	04050513          	addi	a0,a0,64 # 8000a388 <CONSOLE_STATUS+0x378>
    80004350:	00002097          	auipc	ra,0x2
    80004354:	13c080e7          	jalr	316(ra) # 8000648c <_Z11printStringPKc>
        return;
    80004358:	0140006f          	j	8000436c <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    8000435c:	00006517          	auipc	a0,0x6
    80004360:	06c50513          	addi	a0,a0,108 # 8000a3c8 <CONSOLE_STATUS+0x3b8>
    80004364:	00002097          	auipc	ra,0x2
    80004368:	128080e7          	jalr	296(ra) # 8000648c <_Z11printStringPKc>
        return;
    8000436c:	000b0113          	mv	sp,s6
    80004370:	1500006f          	j	800044c0 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80004374:	00000593          	li	a1,0
    80004378:	00009517          	auipc	a0,0x9
    8000437c:	f7850513          	addi	a0,a0,-136 # 8000d2f0 <_ZL10waitForAll>
    80004380:	ffffd097          	auipc	ra,0xffffd
    80004384:	1b8080e7          	jalr	440(ra) # 80001538 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80004388:	00391793          	slli	a5,s2,0x3
    8000438c:	00f78793          	addi	a5,a5,15
    80004390:	ff07f793          	andi	a5,a5,-16
    80004394:	40f10133          	sub	sp,sp,a5
    80004398:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    8000439c:	0019071b          	addiw	a4,s2,1
    800043a0:	00171793          	slli	a5,a4,0x1
    800043a4:	00e787b3          	add	a5,a5,a4
    800043a8:	00379793          	slli	a5,a5,0x3
    800043ac:	00f78793          	addi	a5,a5,15
    800043b0:	ff07f793          	andi	a5,a5,-16
    800043b4:	40f10133          	sub	sp,sp,a5
    800043b8:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800043bc:	00191613          	slli	a2,s2,0x1
    800043c0:	012607b3          	add	a5,a2,s2
    800043c4:	00379793          	slli	a5,a5,0x3
    800043c8:	00f987b3          	add	a5,s3,a5
    800043cc:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800043d0:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800043d4:	00009717          	auipc	a4,0x9
    800043d8:	f1c73703          	ld	a4,-228(a4) # 8000d2f0 <_ZL10waitForAll>
    800043dc:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800043e0:	00078613          	mv	a2,a5
    800043e4:	00000597          	auipc	a1,0x0
    800043e8:	d7458593          	addi	a1,a1,-652 # 80004158 <_ZL8consumerPv>
    800043ec:	f9840513          	addi	a0,s0,-104
    800043f0:	ffffd097          	auipc	ra,0xffffd
    800043f4:	014080e7          	jalr	20(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800043f8:	00000493          	li	s1,0
    800043fc:	0280006f          	j	80004424 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80004400:	00000597          	auipc	a1,0x0
    80004404:	c1458593          	addi	a1,a1,-1004 # 80004014 <_ZL16producerKeyboardPv>
                      data + i);
    80004408:	00179613          	slli	a2,a5,0x1
    8000440c:	00f60633          	add	a2,a2,a5
    80004410:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80004414:	00c98633          	add	a2,s3,a2
    80004418:	ffffd097          	auipc	ra,0xffffd
    8000441c:	fec080e7          	jalr	-20(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80004420:	0014849b          	addiw	s1,s1,1
    80004424:	0524d263          	bge	s1,s2,80004468 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80004428:	00149793          	slli	a5,s1,0x1
    8000442c:	009787b3          	add	a5,a5,s1
    80004430:	00379793          	slli	a5,a5,0x3
    80004434:	00f987b3          	add	a5,s3,a5
    80004438:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    8000443c:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80004440:	00009717          	auipc	a4,0x9
    80004444:	eb073703          	ld	a4,-336(a4) # 8000d2f0 <_ZL10waitForAll>
    80004448:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    8000444c:	00048793          	mv	a5,s1
    80004450:	00349513          	slli	a0,s1,0x3
    80004454:	00aa8533          	add	a0,s5,a0
    80004458:	fa9054e3          	blez	s1,80004400 <_Z22producerConsumer_C_APIv+0x1c8>
    8000445c:	00000597          	auipc	a1,0x0
    80004460:	c6858593          	addi	a1,a1,-920 # 800040c4 <_ZL8producerPv>
    80004464:	fa5ff06f          	j	80004408 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80004468:	ffffd097          	auipc	ra,0xffffd
    8000446c:	058080e7          	jalr	88(ra) # 800014c0 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80004470:	00000493          	li	s1,0
    80004474:	00994e63          	blt	s2,s1,80004490 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80004478:	00009517          	auipc	a0,0x9
    8000447c:	e7853503          	ld	a0,-392(a0) # 8000d2f0 <_ZL10waitForAll>
    80004480:	ffffd097          	auipc	ra,0xffffd
    80004484:	120080e7          	jalr	288(ra) # 800015a0 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80004488:	0014849b          	addiw	s1,s1,1
    8000448c:	fe9ff06f          	j	80004474 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80004490:	00009517          	auipc	a0,0x9
    80004494:	e6053503          	ld	a0,-416(a0) # 8000d2f0 <_ZL10waitForAll>
    80004498:	ffffd097          	auipc	ra,0xffffd
    8000449c:	0d8080e7          	jalr	216(ra) # 80001570 <_Z9sem_closeP4KSem>
    delete buffer;
    800044a0:	000a0e63          	beqz	s4,800044bc <_Z22producerConsumer_C_APIv+0x284>
    800044a4:	000a0513          	mv	a0,s4
    800044a8:	00003097          	auipc	ra,0x3
    800044ac:	154080e7          	jalr	340(ra) # 800075fc <_ZN6BufferD1Ev>
    800044b0:	000a0513          	mv	a0,s4
    800044b4:	fffff097          	auipc	ra,0xfffff
    800044b8:	db0080e7          	jalr	-592(ra) # 80003264 <_ZdlPv>
    800044bc:	000b0113          	mv	sp,s6

}
    800044c0:	f9040113          	addi	sp,s0,-112
    800044c4:	06813083          	ld	ra,104(sp)
    800044c8:	06013403          	ld	s0,96(sp)
    800044cc:	05813483          	ld	s1,88(sp)
    800044d0:	05013903          	ld	s2,80(sp)
    800044d4:	04813983          	ld	s3,72(sp)
    800044d8:	04013a03          	ld	s4,64(sp)
    800044dc:	03813a83          	ld	s5,56(sp)
    800044e0:	03013b03          	ld	s6,48(sp)
    800044e4:	07010113          	addi	sp,sp,112
    800044e8:	00008067          	ret
    800044ec:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800044f0:	000a0513          	mv	a0,s4
    800044f4:	fffff097          	auipc	ra,0xfffff
    800044f8:	d70080e7          	jalr	-656(ra) # 80003264 <_ZdlPv>
    800044fc:	00048513          	mv	a0,s1
    80004500:	0000a097          	auipc	ra,0xa
    80004504:	f18080e7          	jalr	-232(ra) # 8000e418 <_Unwind_Resume>

0000000080004508 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004508:	fe010113          	addi	sp,sp,-32
    8000450c:	00113c23          	sd	ra,24(sp)
    80004510:	00813823          	sd	s0,16(sp)
    80004514:	00913423          	sd	s1,8(sp)
    80004518:	01213023          	sd	s2,0(sp)
    8000451c:	02010413          	addi	s0,sp,32
    80004520:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004524:	00100793          	li	a5,1
    80004528:	02a7f863          	bgeu	a5,a0,80004558 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000452c:	00a00793          	li	a5,10
    80004530:	02f577b3          	remu	a5,a0,a5
    80004534:	02078e63          	beqz	a5,80004570 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004538:	fff48513          	addi	a0,s1,-1
    8000453c:	00000097          	auipc	ra,0x0
    80004540:	fcc080e7          	jalr	-52(ra) # 80004508 <_ZL9fibonaccim>
    80004544:	00050913          	mv	s2,a0
    80004548:	ffe48513          	addi	a0,s1,-2
    8000454c:	00000097          	auipc	ra,0x0
    80004550:	fbc080e7          	jalr	-68(ra) # 80004508 <_ZL9fibonaccim>
    80004554:	00a90533          	add	a0,s2,a0
}
    80004558:	01813083          	ld	ra,24(sp)
    8000455c:	01013403          	ld	s0,16(sp)
    80004560:	00813483          	ld	s1,8(sp)
    80004564:	00013903          	ld	s2,0(sp)
    80004568:	02010113          	addi	sp,sp,32
    8000456c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004570:	ffffd097          	auipc	ra,0xffffd
    80004574:	f50080e7          	jalr	-176(ra) # 800014c0 <_Z15thread_dispatchv>
    80004578:	fc1ff06f          	j	80004538 <_ZL9fibonaccim+0x30>

000000008000457c <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    8000457c:	fe010113          	addi	sp,sp,-32
    80004580:	00113c23          	sd	ra,24(sp)
    80004584:	00813823          	sd	s0,16(sp)
    80004588:	00913423          	sd	s1,8(sp)
    8000458c:	01213023          	sd	s2,0(sp)
    80004590:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004594:	00000913          	li	s2,0
    80004598:	0380006f          	j	800045d0 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    8000459c:	ffffd097          	auipc	ra,0xffffd
    800045a0:	f24080e7          	jalr	-220(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800045a4:	00148493          	addi	s1,s1,1
    800045a8:	000027b7          	lui	a5,0x2
    800045ac:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800045b0:	0097ee63          	bltu	a5,s1,800045cc <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800045b4:	00000713          	li	a4,0
    800045b8:	000077b7          	lui	a5,0x7
    800045bc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800045c0:	fce7eee3          	bltu	a5,a4,8000459c <_ZN7WorkerA11workerBodyAEPv+0x20>
    800045c4:	00170713          	addi	a4,a4,1
    800045c8:	ff1ff06f          	j	800045b8 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800045cc:	00190913          	addi	s2,s2,1
    800045d0:	00900793          	li	a5,9
    800045d4:	0527e063          	bltu	a5,s2,80004614 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800045d8:	00006517          	auipc	a0,0x6
    800045dc:	e2050513          	addi	a0,a0,-480 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    800045e0:	00002097          	auipc	ra,0x2
    800045e4:	eac080e7          	jalr	-340(ra) # 8000648c <_Z11printStringPKc>
    800045e8:	00000613          	li	a2,0
    800045ec:	00a00593          	li	a1,10
    800045f0:	0009051b          	sext.w	a0,s2
    800045f4:	00002097          	auipc	ra,0x2
    800045f8:	048080e7          	jalr	72(ra) # 8000663c <_Z8printIntiii>
    800045fc:	00006517          	auipc	a0,0x6
    80004600:	05c50513          	addi	a0,a0,92 # 8000a658 <CONSOLE_STATUS+0x648>
    80004604:	00002097          	auipc	ra,0x2
    80004608:	e88080e7          	jalr	-376(ra) # 8000648c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000460c:	00000493          	li	s1,0
    80004610:	f99ff06f          	j	800045a8 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80004614:	00006517          	auipc	a0,0x6
    80004618:	dec50513          	addi	a0,a0,-532 # 8000a400 <CONSOLE_STATUS+0x3f0>
    8000461c:	00002097          	auipc	ra,0x2
    80004620:	e70080e7          	jalr	-400(ra) # 8000648c <_Z11printStringPKc>
    finishedA = true;
    80004624:	00100793          	li	a5,1
    80004628:	00009717          	auipc	a4,0x9
    8000462c:	ccf70823          	sb	a5,-816(a4) # 8000d2f8 <_ZL9finishedA>
}
    80004630:	01813083          	ld	ra,24(sp)
    80004634:	01013403          	ld	s0,16(sp)
    80004638:	00813483          	ld	s1,8(sp)
    8000463c:	00013903          	ld	s2,0(sp)
    80004640:	02010113          	addi	sp,sp,32
    80004644:	00008067          	ret

0000000080004648 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80004648:	fe010113          	addi	sp,sp,-32
    8000464c:	00113c23          	sd	ra,24(sp)
    80004650:	00813823          	sd	s0,16(sp)
    80004654:	00913423          	sd	s1,8(sp)
    80004658:	01213023          	sd	s2,0(sp)
    8000465c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004660:	00000913          	li	s2,0
    80004664:	0380006f          	j	8000469c <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80004668:	ffffd097          	auipc	ra,0xffffd
    8000466c:	e58080e7          	jalr	-424(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004670:	00148493          	addi	s1,s1,1
    80004674:	000027b7          	lui	a5,0x2
    80004678:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000467c:	0097ee63          	bltu	a5,s1,80004698 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004680:	00000713          	li	a4,0
    80004684:	000077b7          	lui	a5,0x7
    80004688:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000468c:	fce7eee3          	bltu	a5,a4,80004668 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80004690:	00170713          	addi	a4,a4,1
    80004694:	ff1ff06f          	j	80004684 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004698:	00190913          	addi	s2,s2,1
    8000469c:	00f00793          	li	a5,15
    800046a0:	0527e063          	bltu	a5,s2,800046e0 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800046a4:	00006517          	auipc	a0,0x6
    800046a8:	d6c50513          	addi	a0,a0,-660 # 8000a410 <CONSOLE_STATUS+0x400>
    800046ac:	00002097          	auipc	ra,0x2
    800046b0:	de0080e7          	jalr	-544(ra) # 8000648c <_Z11printStringPKc>
    800046b4:	00000613          	li	a2,0
    800046b8:	00a00593          	li	a1,10
    800046bc:	0009051b          	sext.w	a0,s2
    800046c0:	00002097          	auipc	ra,0x2
    800046c4:	f7c080e7          	jalr	-132(ra) # 8000663c <_Z8printIntiii>
    800046c8:	00006517          	auipc	a0,0x6
    800046cc:	f9050513          	addi	a0,a0,-112 # 8000a658 <CONSOLE_STATUS+0x648>
    800046d0:	00002097          	auipc	ra,0x2
    800046d4:	dbc080e7          	jalr	-580(ra) # 8000648c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800046d8:	00000493          	li	s1,0
    800046dc:	f99ff06f          	j	80004674 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800046e0:	00006517          	auipc	a0,0x6
    800046e4:	d3850513          	addi	a0,a0,-712 # 8000a418 <CONSOLE_STATUS+0x408>
    800046e8:	00002097          	auipc	ra,0x2
    800046ec:	da4080e7          	jalr	-604(ra) # 8000648c <_Z11printStringPKc>
    finishedB = true;
    800046f0:	00100793          	li	a5,1
    800046f4:	00009717          	auipc	a4,0x9
    800046f8:	c0f702a3          	sb	a5,-1019(a4) # 8000d2f9 <_ZL9finishedB>
    thread_dispatch();
    800046fc:	ffffd097          	auipc	ra,0xffffd
    80004700:	dc4080e7          	jalr	-572(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80004704:	01813083          	ld	ra,24(sp)
    80004708:	01013403          	ld	s0,16(sp)
    8000470c:	00813483          	ld	s1,8(sp)
    80004710:	00013903          	ld	s2,0(sp)
    80004714:	02010113          	addi	sp,sp,32
    80004718:	00008067          	ret

000000008000471c <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    8000471c:	fe010113          	addi	sp,sp,-32
    80004720:	00113c23          	sd	ra,24(sp)
    80004724:	00813823          	sd	s0,16(sp)
    80004728:	00913423          	sd	s1,8(sp)
    8000472c:	01213023          	sd	s2,0(sp)
    80004730:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004734:	00000493          	li	s1,0
    80004738:	0400006f          	j	80004778 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000473c:	00006517          	auipc	a0,0x6
    80004740:	cec50513          	addi	a0,a0,-788 # 8000a428 <CONSOLE_STATUS+0x418>
    80004744:	00002097          	auipc	ra,0x2
    80004748:	d48080e7          	jalr	-696(ra) # 8000648c <_Z11printStringPKc>
    8000474c:	00000613          	li	a2,0
    80004750:	00a00593          	li	a1,10
    80004754:	00048513          	mv	a0,s1
    80004758:	00002097          	auipc	ra,0x2
    8000475c:	ee4080e7          	jalr	-284(ra) # 8000663c <_Z8printIntiii>
    80004760:	00006517          	auipc	a0,0x6
    80004764:	ef850513          	addi	a0,a0,-264 # 8000a658 <CONSOLE_STATUS+0x648>
    80004768:	00002097          	auipc	ra,0x2
    8000476c:	d24080e7          	jalr	-732(ra) # 8000648c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004770:	0014849b          	addiw	s1,s1,1
    80004774:	0ff4f493          	andi	s1,s1,255
    80004778:	00200793          	li	a5,2
    8000477c:	fc97f0e3          	bgeu	a5,s1,8000473c <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80004780:	00006517          	auipc	a0,0x6
    80004784:	cb050513          	addi	a0,a0,-848 # 8000a430 <CONSOLE_STATUS+0x420>
    80004788:	00002097          	auipc	ra,0x2
    8000478c:	d04080e7          	jalr	-764(ra) # 8000648c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004790:	00700313          	li	t1,7
    thread_dispatch();
    80004794:	ffffd097          	auipc	ra,0xffffd
    80004798:	d2c080e7          	jalr	-724(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000479c:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800047a0:	00006517          	auipc	a0,0x6
    800047a4:	ca050513          	addi	a0,a0,-864 # 8000a440 <CONSOLE_STATUS+0x430>
    800047a8:	00002097          	auipc	ra,0x2
    800047ac:	ce4080e7          	jalr	-796(ra) # 8000648c <_Z11printStringPKc>
    800047b0:	00000613          	li	a2,0
    800047b4:	00a00593          	li	a1,10
    800047b8:	0009051b          	sext.w	a0,s2
    800047bc:	00002097          	auipc	ra,0x2
    800047c0:	e80080e7          	jalr	-384(ra) # 8000663c <_Z8printIntiii>
    800047c4:	00006517          	auipc	a0,0x6
    800047c8:	e9450513          	addi	a0,a0,-364 # 8000a658 <CONSOLE_STATUS+0x648>
    800047cc:	00002097          	auipc	ra,0x2
    800047d0:	cc0080e7          	jalr	-832(ra) # 8000648c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800047d4:	00c00513          	li	a0,12
    800047d8:	00000097          	auipc	ra,0x0
    800047dc:	d30080e7          	jalr	-720(ra) # 80004508 <_ZL9fibonaccim>
    800047e0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800047e4:	00006517          	auipc	a0,0x6
    800047e8:	c6450513          	addi	a0,a0,-924 # 8000a448 <CONSOLE_STATUS+0x438>
    800047ec:	00002097          	auipc	ra,0x2
    800047f0:	ca0080e7          	jalr	-864(ra) # 8000648c <_Z11printStringPKc>
    800047f4:	00000613          	li	a2,0
    800047f8:	00a00593          	li	a1,10
    800047fc:	0009051b          	sext.w	a0,s2
    80004800:	00002097          	auipc	ra,0x2
    80004804:	e3c080e7          	jalr	-452(ra) # 8000663c <_Z8printIntiii>
    80004808:	00006517          	auipc	a0,0x6
    8000480c:	e5050513          	addi	a0,a0,-432 # 8000a658 <CONSOLE_STATUS+0x648>
    80004810:	00002097          	auipc	ra,0x2
    80004814:	c7c080e7          	jalr	-900(ra) # 8000648c <_Z11printStringPKc>
    80004818:	0400006f          	j	80004858 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000481c:	00006517          	auipc	a0,0x6
    80004820:	c0c50513          	addi	a0,a0,-1012 # 8000a428 <CONSOLE_STATUS+0x418>
    80004824:	00002097          	auipc	ra,0x2
    80004828:	c68080e7          	jalr	-920(ra) # 8000648c <_Z11printStringPKc>
    8000482c:	00000613          	li	a2,0
    80004830:	00a00593          	li	a1,10
    80004834:	00048513          	mv	a0,s1
    80004838:	00002097          	auipc	ra,0x2
    8000483c:	e04080e7          	jalr	-508(ra) # 8000663c <_Z8printIntiii>
    80004840:	00006517          	auipc	a0,0x6
    80004844:	e1850513          	addi	a0,a0,-488 # 8000a658 <CONSOLE_STATUS+0x648>
    80004848:	00002097          	auipc	ra,0x2
    8000484c:	c44080e7          	jalr	-956(ra) # 8000648c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004850:	0014849b          	addiw	s1,s1,1
    80004854:	0ff4f493          	andi	s1,s1,255
    80004858:	00500793          	li	a5,5
    8000485c:	fc97f0e3          	bgeu	a5,s1,8000481c <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80004860:	00006517          	auipc	a0,0x6
    80004864:	bf850513          	addi	a0,a0,-1032 # 8000a458 <CONSOLE_STATUS+0x448>
    80004868:	00002097          	auipc	ra,0x2
    8000486c:	c24080e7          	jalr	-988(ra) # 8000648c <_Z11printStringPKc>
    finishedC = true;
    80004870:	00100793          	li	a5,1
    80004874:	00009717          	auipc	a4,0x9
    80004878:	a8f70323          	sb	a5,-1402(a4) # 8000d2fa <_ZL9finishedC>
    thread_dispatch();
    8000487c:	ffffd097          	auipc	ra,0xffffd
    80004880:	c44080e7          	jalr	-956(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80004884:	01813083          	ld	ra,24(sp)
    80004888:	01013403          	ld	s0,16(sp)
    8000488c:	00813483          	ld	s1,8(sp)
    80004890:	00013903          	ld	s2,0(sp)
    80004894:	02010113          	addi	sp,sp,32
    80004898:	00008067          	ret

000000008000489c <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    8000489c:	fe010113          	addi	sp,sp,-32
    800048a0:	00113c23          	sd	ra,24(sp)
    800048a4:	00813823          	sd	s0,16(sp)
    800048a8:	00913423          	sd	s1,8(sp)
    800048ac:	01213023          	sd	s2,0(sp)
    800048b0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800048b4:	00a00493          	li	s1,10
    800048b8:	0400006f          	j	800048f8 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800048bc:	00006517          	auipc	a0,0x6
    800048c0:	bac50513          	addi	a0,a0,-1108 # 8000a468 <CONSOLE_STATUS+0x458>
    800048c4:	00002097          	auipc	ra,0x2
    800048c8:	bc8080e7          	jalr	-1080(ra) # 8000648c <_Z11printStringPKc>
    800048cc:	00000613          	li	a2,0
    800048d0:	00a00593          	li	a1,10
    800048d4:	00048513          	mv	a0,s1
    800048d8:	00002097          	auipc	ra,0x2
    800048dc:	d64080e7          	jalr	-668(ra) # 8000663c <_Z8printIntiii>
    800048e0:	00006517          	auipc	a0,0x6
    800048e4:	d7850513          	addi	a0,a0,-648 # 8000a658 <CONSOLE_STATUS+0x648>
    800048e8:	00002097          	auipc	ra,0x2
    800048ec:	ba4080e7          	jalr	-1116(ra) # 8000648c <_Z11printStringPKc>
    for (; i < 13; i++) {
    800048f0:	0014849b          	addiw	s1,s1,1
    800048f4:	0ff4f493          	andi	s1,s1,255
    800048f8:	00c00793          	li	a5,12
    800048fc:	fc97f0e3          	bgeu	a5,s1,800048bc <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80004900:	00006517          	auipc	a0,0x6
    80004904:	b7050513          	addi	a0,a0,-1168 # 8000a470 <CONSOLE_STATUS+0x460>
    80004908:	00002097          	auipc	ra,0x2
    8000490c:	b84080e7          	jalr	-1148(ra) # 8000648c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004910:	00500313          	li	t1,5
    thread_dispatch();
    80004914:	ffffd097          	auipc	ra,0xffffd
    80004918:	bac080e7          	jalr	-1108(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000491c:	01000513          	li	a0,16
    80004920:	00000097          	auipc	ra,0x0
    80004924:	be8080e7          	jalr	-1048(ra) # 80004508 <_ZL9fibonaccim>
    80004928:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000492c:	00006517          	auipc	a0,0x6
    80004930:	b5450513          	addi	a0,a0,-1196 # 8000a480 <CONSOLE_STATUS+0x470>
    80004934:	00002097          	auipc	ra,0x2
    80004938:	b58080e7          	jalr	-1192(ra) # 8000648c <_Z11printStringPKc>
    8000493c:	00000613          	li	a2,0
    80004940:	00a00593          	li	a1,10
    80004944:	0009051b          	sext.w	a0,s2
    80004948:	00002097          	auipc	ra,0x2
    8000494c:	cf4080e7          	jalr	-780(ra) # 8000663c <_Z8printIntiii>
    80004950:	00006517          	auipc	a0,0x6
    80004954:	d0850513          	addi	a0,a0,-760 # 8000a658 <CONSOLE_STATUS+0x648>
    80004958:	00002097          	auipc	ra,0x2
    8000495c:	b34080e7          	jalr	-1228(ra) # 8000648c <_Z11printStringPKc>
    80004960:	0400006f          	j	800049a0 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004964:	00006517          	auipc	a0,0x6
    80004968:	b0450513          	addi	a0,a0,-1276 # 8000a468 <CONSOLE_STATUS+0x458>
    8000496c:	00002097          	auipc	ra,0x2
    80004970:	b20080e7          	jalr	-1248(ra) # 8000648c <_Z11printStringPKc>
    80004974:	00000613          	li	a2,0
    80004978:	00a00593          	li	a1,10
    8000497c:	00048513          	mv	a0,s1
    80004980:	00002097          	auipc	ra,0x2
    80004984:	cbc080e7          	jalr	-836(ra) # 8000663c <_Z8printIntiii>
    80004988:	00006517          	auipc	a0,0x6
    8000498c:	cd050513          	addi	a0,a0,-816 # 8000a658 <CONSOLE_STATUS+0x648>
    80004990:	00002097          	auipc	ra,0x2
    80004994:	afc080e7          	jalr	-1284(ra) # 8000648c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004998:	0014849b          	addiw	s1,s1,1
    8000499c:	0ff4f493          	andi	s1,s1,255
    800049a0:	00f00793          	li	a5,15
    800049a4:	fc97f0e3          	bgeu	a5,s1,80004964 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800049a8:	00006517          	auipc	a0,0x6
    800049ac:	ae850513          	addi	a0,a0,-1304 # 8000a490 <CONSOLE_STATUS+0x480>
    800049b0:	00002097          	auipc	ra,0x2
    800049b4:	adc080e7          	jalr	-1316(ra) # 8000648c <_Z11printStringPKc>
    finishedD = true;
    800049b8:	00100793          	li	a5,1
    800049bc:	00009717          	auipc	a4,0x9
    800049c0:	92f70fa3          	sb	a5,-1729(a4) # 8000d2fb <_ZL9finishedD>
    thread_dispatch();
    800049c4:	ffffd097          	auipc	ra,0xffffd
    800049c8:	afc080e7          	jalr	-1284(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800049cc:	01813083          	ld	ra,24(sp)
    800049d0:	01013403          	ld	s0,16(sp)
    800049d4:	00813483          	ld	s1,8(sp)
    800049d8:	00013903          	ld	s2,0(sp)
    800049dc:	02010113          	addi	sp,sp,32
    800049e0:	00008067          	ret

00000000800049e4 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800049e4:	fc010113          	addi	sp,sp,-64
    800049e8:	02113c23          	sd	ra,56(sp)
    800049ec:	02813823          	sd	s0,48(sp)
    800049f0:	02913423          	sd	s1,40(sp)
    800049f4:	03213023          	sd	s2,32(sp)
    800049f8:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800049fc:	02000513          	li	a0,32
    80004a00:	fffff097          	auipc	ra,0xfffff
    80004a04:	814080e7          	jalr	-2028(ra) # 80003214 <_Znwm>
    80004a08:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004a0c:	fffff097          	auipc	ra,0xfffff
    80004a10:	af8080e7          	jalr	-1288(ra) # 80003504 <_ZN6ThreadC1Ev>
    80004a14:	00008797          	auipc	a5,0x8
    80004a18:	51c78793          	addi	a5,a5,1308 # 8000cf30 <_ZTV7WorkerA+0x10>
    80004a1c:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004a20:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004a24:	00006517          	auipc	a0,0x6
    80004a28:	a7c50513          	addi	a0,a0,-1412 # 8000a4a0 <CONSOLE_STATUS+0x490>
    80004a2c:	00002097          	auipc	ra,0x2
    80004a30:	a60080e7          	jalr	-1440(ra) # 8000648c <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004a34:	02000513          	li	a0,32
    80004a38:	ffffe097          	auipc	ra,0xffffe
    80004a3c:	7dc080e7          	jalr	2012(ra) # 80003214 <_Znwm>
    80004a40:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004a44:	fffff097          	auipc	ra,0xfffff
    80004a48:	ac0080e7          	jalr	-1344(ra) # 80003504 <_ZN6ThreadC1Ev>
    80004a4c:	00008797          	auipc	a5,0x8
    80004a50:	50c78793          	addi	a5,a5,1292 # 8000cf58 <_ZTV7WorkerB+0x10>
    80004a54:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004a58:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004a5c:	00006517          	auipc	a0,0x6
    80004a60:	a5c50513          	addi	a0,a0,-1444 # 8000a4b8 <CONSOLE_STATUS+0x4a8>
    80004a64:	00002097          	auipc	ra,0x2
    80004a68:	a28080e7          	jalr	-1496(ra) # 8000648c <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004a6c:	02000513          	li	a0,32
    80004a70:	ffffe097          	auipc	ra,0xffffe
    80004a74:	7a4080e7          	jalr	1956(ra) # 80003214 <_Znwm>
    80004a78:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004a7c:	fffff097          	auipc	ra,0xfffff
    80004a80:	a88080e7          	jalr	-1400(ra) # 80003504 <_ZN6ThreadC1Ev>
    80004a84:	00008797          	auipc	a5,0x8
    80004a88:	4fc78793          	addi	a5,a5,1276 # 8000cf80 <_ZTV7WorkerC+0x10>
    80004a8c:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004a90:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80004a94:	00006517          	auipc	a0,0x6
    80004a98:	a3c50513          	addi	a0,a0,-1476 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80004a9c:	00002097          	auipc	ra,0x2
    80004aa0:	9f0080e7          	jalr	-1552(ra) # 8000648c <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004aa4:	02000513          	li	a0,32
    80004aa8:	ffffe097          	auipc	ra,0xffffe
    80004aac:	76c080e7          	jalr	1900(ra) # 80003214 <_Znwm>
    80004ab0:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004ab4:	fffff097          	auipc	ra,0xfffff
    80004ab8:	a50080e7          	jalr	-1456(ra) # 80003504 <_ZN6ThreadC1Ev>
    80004abc:	00008797          	auipc	a5,0x8
    80004ac0:	4ec78793          	addi	a5,a5,1260 # 8000cfa8 <_ZTV7WorkerD+0x10>
    80004ac4:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004ac8:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004acc:	00006517          	auipc	a0,0x6
    80004ad0:	a1c50513          	addi	a0,a0,-1508 # 8000a4e8 <CONSOLE_STATUS+0x4d8>
    80004ad4:	00002097          	auipc	ra,0x2
    80004ad8:	9b8080e7          	jalr	-1608(ra) # 8000648c <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004adc:	00000493          	li	s1,0
    80004ae0:	00300793          	li	a5,3
    80004ae4:	0297c663          	blt	a5,s1,80004b10 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004ae8:	00349793          	slli	a5,s1,0x3
    80004aec:	fe040713          	addi	a4,s0,-32
    80004af0:	00f707b3          	add	a5,a4,a5
    80004af4:	fe07b503          	ld	a0,-32(a5)
    80004af8:	fffff097          	auipc	ra,0xfffff
    80004afc:	8d4080e7          	jalr	-1836(ra) # 800033cc <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80004b00:	0014849b          	addiw	s1,s1,1
    80004b04:	fddff06f          	j	80004ae0 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004b08:	fffff097          	auipc	ra,0xfffff
    80004b0c:	940080e7          	jalr	-1728(ra) # 80003448 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004b10:	00008797          	auipc	a5,0x8
    80004b14:	7e87c783          	lbu	a5,2024(a5) # 8000d2f8 <_ZL9finishedA>
    80004b18:	fe0788e3          	beqz	a5,80004b08 <_Z20Threads_CPP_API_testv+0x124>
    80004b1c:	00008797          	auipc	a5,0x8
    80004b20:	7dd7c783          	lbu	a5,2013(a5) # 8000d2f9 <_ZL9finishedB>
    80004b24:	fe0782e3          	beqz	a5,80004b08 <_Z20Threads_CPP_API_testv+0x124>
    80004b28:	00008797          	auipc	a5,0x8
    80004b2c:	7d27c783          	lbu	a5,2002(a5) # 8000d2fa <_ZL9finishedC>
    80004b30:	fc078ce3          	beqz	a5,80004b08 <_Z20Threads_CPP_API_testv+0x124>
    80004b34:	00008797          	auipc	a5,0x8
    80004b38:	7c77c783          	lbu	a5,1991(a5) # 8000d2fb <_ZL9finishedD>
    80004b3c:	fc0786e3          	beqz	a5,80004b08 <_Z20Threads_CPP_API_testv+0x124>
    80004b40:	fc040493          	addi	s1,s0,-64
    80004b44:	0080006f          	j	80004b4c <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    80004b48:	00848493          	addi	s1,s1,8
    80004b4c:	fe040793          	addi	a5,s0,-32
    80004b50:	08f48663          	beq	s1,a5,80004bdc <_Z20Threads_CPP_API_testv+0x1f8>
    80004b54:	0004b503          	ld	a0,0(s1)
		delete thread;
    80004b58:	fe0508e3          	beqz	a0,80004b48 <_Z20Threads_CPP_API_testv+0x164>
    80004b5c:	00053783          	ld	a5,0(a0)
    80004b60:	0087b783          	ld	a5,8(a5)
    80004b64:	000780e7          	jalr	a5
    80004b68:	fe1ff06f          	j	80004b48 <_Z20Threads_CPP_API_testv+0x164>
    80004b6c:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004b70:	00048513          	mv	a0,s1
    80004b74:	ffffe097          	auipc	ra,0xffffe
    80004b78:	6f0080e7          	jalr	1776(ra) # 80003264 <_ZdlPv>
    80004b7c:	00090513          	mv	a0,s2
    80004b80:	0000a097          	auipc	ra,0xa
    80004b84:	898080e7          	jalr	-1896(ra) # 8000e418 <_Unwind_Resume>
    80004b88:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004b8c:	00048513          	mv	a0,s1
    80004b90:	ffffe097          	auipc	ra,0xffffe
    80004b94:	6d4080e7          	jalr	1748(ra) # 80003264 <_ZdlPv>
    80004b98:	00090513          	mv	a0,s2
    80004b9c:	0000a097          	auipc	ra,0xa
    80004ba0:	87c080e7          	jalr	-1924(ra) # 8000e418 <_Unwind_Resume>
    80004ba4:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004ba8:	00048513          	mv	a0,s1
    80004bac:	ffffe097          	auipc	ra,0xffffe
    80004bb0:	6b8080e7          	jalr	1720(ra) # 80003264 <_ZdlPv>
    80004bb4:	00090513          	mv	a0,s2
    80004bb8:	0000a097          	auipc	ra,0xa
    80004bbc:	860080e7          	jalr	-1952(ra) # 8000e418 <_Unwind_Resume>
    80004bc0:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004bc4:	00048513          	mv	a0,s1
    80004bc8:	ffffe097          	auipc	ra,0xffffe
    80004bcc:	69c080e7          	jalr	1692(ra) # 80003264 <_ZdlPv>
    80004bd0:	00090513          	mv	a0,s2
    80004bd4:	0000a097          	auipc	ra,0xa
    80004bd8:	844080e7          	jalr	-1980(ra) # 8000e418 <_Unwind_Resume>
	}
}
    80004bdc:	03813083          	ld	ra,56(sp)
    80004be0:	03013403          	ld	s0,48(sp)
    80004be4:	02813483          	ld	s1,40(sp)
    80004be8:	02013903          	ld	s2,32(sp)
    80004bec:	04010113          	addi	sp,sp,64
    80004bf0:	00008067          	ret

0000000080004bf4 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004bf4:	ff010113          	addi	sp,sp,-16
    80004bf8:	00113423          	sd	ra,8(sp)
    80004bfc:	00813023          	sd	s0,0(sp)
    80004c00:	01010413          	addi	s0,sp,16
    80004c04:	00008797          	auipc	a5,0x8
    80004c08:	32c78793          	addi	a5,a5,812 # 8000cf30 <_ZTV7WorkerA+0x10>
    80004c0c:	00f53023          	sd	a5,0(a0)
    80004c10:	ffffe097          	auipc	ra,0xffffe
    80004c14:	550080e7          	jalr	1360(ra) # 80003160 <_ZN6ThreadD1Ev>
    80004c18:	00813083          	ld	ra,8(sp)
    80004c1c:	00013403          	ld	s0,0(sp)
    80004c20:	01010113          	addi	sp,sp,16
    80004c24:	00008067          	ret

0000000080004c28 <_ZN7WorkerAD0Ev>:
    80004c28:	fe010113          	addi	sp,sp,-32
    80004c2c:	00113c23          	sd	ra,24(sp)
    80004c30:	00813823          	sd	s0,16(sp)
    80004c34:	00913423          	sd	s1,8(sp)
    80004c38:	02010413          	addi	s0,sp,32
    80004c3c:	00050493          	mv	s1,a0
    80004c40:	00008797          	auipc	a5,0x8
    80004c44:	2f078793          	addi	a5,a5,752 # 8000cf30 <_ZTV7WorkerA+0x10>
    80004c48:	00f53023          	sd	a5,0(a0)
    80004c4c:	ffffe097          	auipc	ra,0xffffe
    80004c50:	514080e7          	jalr	1300(ra) # 80003160 <_ZN6ThreadD1Ev>
    80004c54:	00048513          	mv	a0,s1
    80004c58:	ffffe097          	auipc	ra,0xffffe
    80004c5c:	60c080e7          	jalr	1548(ra) # 80003264 <_ZdlPv>
    80004c60:	01813083          	ld	ra,24(sp)
    80004c64:	01013403          	ld	s0,16(sp)
    80004c68:	00813483          	ld	s1,8(sp)
    80004c6c:	02010113          	addi	sp,sp,32
    80004c70:	00008067          	ret

0000000080004c74 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80004c74:	ff010113          	addi	sp,sp,-16
    80004c78:	00113423          	sd	ra,8(sp)
    80004c7c:	00813023          	sd	s0,0(sp)
    80004c80:	01010413          	addi	s0,sp,16
    80004c84:	00008797          	auipc	a5,0x8
    80004c88:	2d478793          	addi	a5,a5,724 # 8000cf58 <_ZTV7WorkerB+0x10>
    80004c8c:	00f53023          	sd	a5,0(a0)
    80004c90:	ffffe097          	auipc	ra,0xffffe
    80004c94:	4d0080e7          	jalr	1232(ra) # 80003160 <_ZN6ThreadD1Ev>
    80004c98:	00813083          	ld	ra,8(sp)
    80004c9c:	00013403          	ld	s0,0(sp)
    80004ca0:	01010113          	addi	sp,sp,16
    80004ca4:	00008067          	ret

0000000080004ca8 <_ZN7WorkerBD0Ev>:
    80004ca8:	fe010113          	addi	sp,sp,-32
    80004cac:	00113c23          	sd	ra,24(sp)
    80004cb0:	00813823          	sd	s0,16(sp)
    80004cb4:	00913423          	sd	s1,8(sp)
    80004cb8:	02010413          	addi	s0,sp,32
    80004cbc:	00050493          	mv	s1,a0
    80004cc0:	00008797          	auipc	a5,0x8
    80004cc4:	29878793          	addi	a5,a5,664 # 8000cf58 <_ZTV7WorkerB+0x10>
    80004cc8:	00f53023          	sd	a5,0(a0)
    80004ccc:	ffffe097          	auipc	ra,0xffffe
    80004cd0:	494080e7          	jalr	1172(ra) # 80003160 <_ZN6ThreadD1Ev>
    80004cd4:	00048513          	mv	a0,s1
    80004cd8:	ffffe097          	auipc	ra,0xffffe
    80004cdc:	58c080e7          	jalr	1420(ra) # 80003264 <_ZdlPv>
    80004ce0:	01813083          	ld	ra,24(sp)
    80004ce4:	01013403          	ld	s0,16(sp)
    80004ce8:	00813483          	ld	s1,8(sp)
    80004cec:	02010113          	addi	sp,sp,32
    80004cf0:	00008067          	ret

0000000080004cf4 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004cf4:	ff010113          	addi	sp,sp,-16
    80004cf8:	00113423          	sd	ra,8(sp)
    80004cfc:	00813023          	sd	s0,0(sp)
    80004d00:	01010413          	addi	s0,sp,16
    80004d04:	00008797          	auipc	a5,0x8
    80004d08:	27c78793          	addi	a5,a5,636 # 8000cf80 <_ZTV7WorkerC+0x10>
    80004d0c:	00f53023          	sd	a5,0(a0)
    80004d10:	ffffe097          	auipc	ra,0xffffe
    80004d14:	450080e7          	jalr	1104(ra) # 80003160 <_ZN6ThreadD1Ev>
    80004d18:	00813083          	ld	ra,8(sp)
    80004d1c:	00013403          	ld	s0,0(sp)
    80004d20:	01010113          	addi	sp,sp,16
    80004d24:	00008067          	ret

0000000080004d28 <_ZN7WorkerCD0Ev>:
    80004d28:	fe010113          	addi	sp,sp,-32
    80004d2c:	00113c23          	sd	ra,24(sp)
    80004d30:	00813823          	sd	s0,16(sp)
    80004d34:	00913423          	sd	s1,8(sp)
    80004d38:	02010413          	addi	s0,sp,32
    80004d3c:	00050493          	mv	s1,a0
    80004d40:	00008797          	auipc	a5,0x8
    80004d44:	24078793          	addi	a5,a5,576 # 8000cf80 <_ZTV7WorkerC+0x10>
    80004d48:	00f53023          	sd	a5,0(a0)
    80004d4c:	ffffe097          	auipc	ra,0xffffe
    80004d50:	414080e7          	jalr	1044(ra) # 80003160 <_ZN6ThreadD1Ev>
    80004d54:	00048513          	mv	a0,s1
    80004d58:	ffffe097          	auipc	ra,0xffffe
    80004d5c:	50c080e7          	jalr	1292(ra) # 80003264 <_ZdlPv>
    80004d60:	01813083          	ld	ra,24(sp)
    80004d64:	01013403          	ld	s0,16(sp)
    80004d68:	00813483          	ld	s1,8(sp)
    80004d6c:	02010113          	addi	sp,sp,32
    80004d70:	00008067          	ret

0000000080004d74 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004d74:	ff010113          	addi	sp,sp,-16
    80004d78:	00113423          	sd	ra,8(sp)
    80004d7c:	00813023          	sd	s0,0(sp)
    80004d80:	01010413          	addi	s0,sp,16
    80004d84:	00008797          	auipc	a5,0x8
    80004d88:	22478793          	addi	a5,a5,548 # 8000cfa8 <_ZTV7WorkerD+0x10>
    80004d8c:	00f53023          	sd	a5,0(a0)
    80004d90:	ffffe097          	auipc	ra,0xffffe
    80004d94:	3d0080e7          	jalr	976(ra) # 80003160 <_ZN6ThreadD1Ev>
    80004d98:	00813083          	ld	ra,8(sp)
    80004d9c:	00013403          	ld	s0,0(sp)
    80004da0:	01010113          	addi	sp,sp,16
    80004da4:	00008067          	ret

0000000080004da8 <_ZN7WorkerDD0Ev>:
    80004da8:	fe010113          	addi	sp,sp,-32
    80004dac:	00113c23          	sd	ra,24(sp)
    80004db0:	00813823          	sd	s0,16(sp)
    80004db4:	00913423          	sd	s1,8(sp)
    80004db8:	02010413          	addi	s0,sp,32
    80004dbc:	00050493          	mv	s1,a0
    80004dc0:	00008797          	auipc	a5,0x8
    80004dc4:	1e878793          	addi	a5,a5,488 # 8000cfa8 <_ZTV7WorkerD+0x10>
    80004dc8:	00f53023          	sd	a5,0(a0)
    80004dcc:	ffffe097          	auipc	ra,0xffffe
    80004dd0:	394080e7          	jalr	916(ra) # 80003160 <_ZN6ThreadD1Ev>
    80004dd4:	00048513          	mv	a0,s1
    80004dd8:	ffffe097          	auipc	ra,0xffffe
    80004ddc:	48c080e7          	jalr	1164(ra) # 80003264 <_ZdlPv>
    80004de0:	01813083          	ld	ra,24(sp)
    80004de4:	01013403          	ld	s0,16(sp)
    80004de8:	00813483          	ld	s1,8(sp)
    80004dec:	02010113          	addi	sp,sp,32
    80004df0:	00008067          	ret

0000000080004df4 <_ZN7WorkerA3runEv>:
    void run() override {
    80004df4:	ff010113          	addi	sp,sp,-16
    80004df8:	00113423          	sd	ra,8(sp)
    80004dfc:	00813023          	sd	s0,0(sp)
    80004e00:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004e04:	00000593          	li	a1,0
    80004e08:	fffff097          	auipc	ra,0xfffff
    80004e0c:	774080e7          	jalr	1908(ra) # 8000457c <_ZN7WorkerA11workerBodyAEPv>
    }
    80004e10:	00813083          	ld	ra,8(sp)
    80004e14:	00013403          	ld	s0,0(sp)
    80004e18:	01010113          	addi	sp,sp,16
    80004e1c:	00008067          	ret

0000000080004e20 <_ZN7WorkerB3runEv>:
    void run() override {
    80004e20:	ff010113          	addi	sp,sp,-16
    80004e24:	00113423          	sd	ra,8(sp)
    80004e28:	00813023          	sd	s0,0(sp)
    80004e2c:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004e30:	00000593          	li	a1,0
    80004e34:	00000097          	auipc	ra,0x0
    80004e38:	814080e7          	jalr	-2028(ra) # 80004648 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004e3c:	00813083          	ld	ra,8(sp)
    80004e40:	00013403          	ld	s0,0(sp)
    80004e44:	01010113          	addi	sp,sp,16
    80004e48:	00008067          	ret

0000000080004e4c <_ZN7WorkerC3runEv>:
    void run() override {
    80004e4c:	ff010113          	addi	sp,sp,-16
    80004e50:	00113423          	sd	ra,8(sp)
    80004e54:	00813023          	sd	s0,0(sp)
    80004e58:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004e5c:	00000593          	li	a1,0
    80004e60:	00000097          	auipc	ra,0x0
    80004e64:	8bc080e7          	jalr	-1860(ra) # 8000471c <_ZN7WorkerC11workerBodyCEPv>
    }
    80004e68:	00813083          	ld	ra,8(sp)
    80004e6c:	00013403          	ld	s0,0(sp)
    80004e70:	01010113          	addi	sp,sp,16
    80004e74:	00008067          	ret

0000000080004e78 <_ZN7WorkerD3runEv>:
    void run() override {
    80004e78:	ff010113          	addi	sp,sp,-16
    80004e7c:	00113423          	sd	ra,8(sp)
    80004e80:	00813023          	sd	s0,0(sp)
    80004e84:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004e88:	00000593          	li	a1,0
    80004e8c:	00000097          	auipc	ra,0x0
    80004e90:	a10080e7          	jalr	-1520(ra) # 8000489c <_ZN7WorkerD11workerBodyDEPv>
    }
    80004e94:	00813083          	ld	ra,8(sp)
    80004e98:	00013403          	ld	s0,0(sp)
    80004e9c:	01010113          	addi	sp,sp,16
    80004ea0:	00008067          	ret

0000000080004ea4 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004ea4:	f8010113          	addi	sp,sp,-128
    80004ea8:	06113c23          	sd	ra,120(sp)
    80004eac:	06813823          	sd	s0,112(sp)
    80004eb0:	06913423          	sd	s1,104(sp)
    80004eb4:	07213023          	sd	s2,96(sp)
    80004eb8:	05313c23          	sd	s3,88(sp)
    80004ebc:	05413823          	sd	s4,80(sp)
    80004ec0:	05513423          	sd	s5,72(sp)
    80004ec4:	05613023          	sd	s6,64(sp)
    80004ec8:	03713c23          	sd	s7,56(sp)
    80004ecc:	03813823          	sd	s8,48(sp)
    80004ed0:	03913423          	sd	s9,40(sp)
    80004ed4:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004ed8:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004edc:	00005517          	auipc	a0,0x5
    80004ee0:	43450513          	addi	a0,a0,1076 # 8000a310 <CONSOLE_STATUS+0x300>
    80004ee4:	00001097          	auipc	ra,0x1
    80004ee8:	5a8080e7          	jalr	1448(ra) # 8000648c <_Z11printStringPKc>
    getString(input, 30);
    80004eec:	01e00593          	li	a1,30
    80004ef0:	f8040493          	addi	s1,s0,-128
    80004ef4:	00048513          	mv	a0,s1
    80004ef8:	00001097          	auipc	ra,0x1
    80004efc:	61c080e7          	jalr	1564(ra) # 80006514 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004f00:	00048513          	mv	a0,s1
    80004f04:	00001097          	auipc	ra,0x1
    80004f08:	6e8080e7          	jalr	1768(ra) # 800065ec <_Z11stringToIntPKc>
    80004f0c:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004f10:	00005517          	auipc	a0,0x5
    80004f14:	42050513          	addi	a0,a0,1056 # 8000a330 <CONSOLE_STATUS+0x320>
    80004f18:	00001097          	auipc	ra,0x1
    80004f1c:	574080e7          	jalr	1396(ra) # 8000648c <_Z11printStringPKc>
    getString(input, 30);
    80004f20:	01e00593          	li	a1,30
    80004f24:	00048513          	mv	a0,s1
    80004f28:	00001097          	auipc	ra,0x1
    80004f2c:	5ec080e7          	jalr	1516(ra) # 80006514 <_Z9getStringPci>
    n = stringToInt(input);
    80004f30:	00048513          	mv	a0,s1
    80004f34:	00001097          	auipc	ra,0x1
    80004f38:	6b8080e7          	jalr	1720(ra) # 800065ec <_Z11stringToIntPKc>
    80004f3c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004f40:	00005517          	auipc	a0,0x5
    80004f44:	41050513          	addi	a0,a0,1040 # 8000a350 <CONSOLE_STATUS+0x340>
    80004f48:	00001097          	auipc	ra,0x1
    80004f4c:	544080e7          	jalr	1348(ra) # 8000648c <_Z11printStringPKc>
    printInt(threadNum);
    80004f50:	00000613          	li	a2,0
    80004f54:	00a00593          	li	a1,10
    80004f58:	00098513          	mv	a0,s3
    80004f5c:	00001097          	auipc	ra,0x1
    80004f60:	6e0080e7          	jalr	1760(ra) # 8000663c <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004f64:	00005517          	auipc	a0,0x5
    80004f68:	40450513          	addi	a0,a0,1028 # 8000a368 <CONSOLE_STATUS+0x358>
    80004f6c:	00001097          	auipc	ra,0x1
    80004f70:	520080e7          	jalr	1312(ra) # 8000648c <_Z11printStringPKc>
    printInt(n);
    80004f74:	00000613          	li	a2,0
    80004f78:	00a00593          	li	a1,10
    80004f7c:	00048513          	mv	a0,s1
    80004f80:	00001097          	auipc	ra,0x1
    80004f84:	6bc080e7          	jalr	1724(ra) # 8000663c <_Z8printIntiii>
    printString(".\n");
    80004f88:	00005517          	auipc	a0,0x5
    80004f8c:	3f850513          	addi	a0,a0,1016 # 8000a380 <CONSOLE_STATUS+0x370>
    80004f90:	00001097          	auipc	ra,0x1
    80004f94:	4fc080e7          	jalr	1276(ra) # 8000648c <_Z11printStringPKc>
    if (threadNum > n) {
    80004f98:	0334c463          	blt	s1,s3,80004fc0 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004f9c:	03305c63          	blez	s3,80004fd4 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004fa0:	03800513          	li	a0,56
    80004fa4:	ffffe097          	auipc	ra,0xffffe
    80004fa8:	270080e7          	jalr	624(ra) # 80003214 <_Znwm>
    80004fac:	00050a93          	mv	s5,a0
    80004fb0:	00048593          	mv	a1,s1
    80004fb4:	00001097          	auipc	ra,0x1
    80004fb8:	7a8080e7          	jalr	1960(ra) # 8000675c <_ZN9BufferCPPC1Ei>
    80004fbc:	0300006f          	j	80004fec <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004fc0:	00005517          	auipc	a0,0x5
    80004fc4:	3c850513          	addi	a0,a0,968 # 8000a388 <CONSOLE_STATUS+0x378>
    80004fc8:	00001097          	auipc	ra,0x1
    80004fcc:	4c4080e7          	jalr	1220(ra) # 8000648c <_Z11printStringPKc>
        return;
    80004fd0:	0140006f          	j	80004fe4 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004fd4:	00005517          	auipc	a0,0x5
    80004fd8:	3f450513          	addi	a0,a0,1012 # 8000a3c8 <CONSOLE_STATUS+0x3b8>
    80004fdc:	00001097          	auipc	ra,0x1
    80004fe0:	4b0080e7          	jalr	1200(ra) # 8000648c <_Z11printStringPKc>
        return;
    80004fe4:	000c0113          	mv	sp,s8
    80004fe8:	2140006f          	j	800051fc <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004fec:	01000513          	li	a0,16
    80004ff0:	ffffe097          	auipc	ra,0xffffe
    80004ff4:	224080e7          	jalr	548(ra) # 80003214 <_Znwm>
    80004ff8:	00050913          	mv	s2,a0
    80004ffc:	00000593          	li	a1,0
    80005000:	ffffe097          	auipc	ra,0xffffe
    80005004:	580080e7          	jalr	1408(ra) # 80003580 <_ZN9SemaphoreC1Ej>
    80005008:	00008797          	auipc	a5,0x8
    8000500c:	3127b023          	sd	s2,768(a5) # 8000d308 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80005010:	00399793          	slli	a5,s3,0x3
    80005014:	00f78793          	addi	a5,a5,15
    80005018:	ff07f793          	andi	a5,a5,-16
    8000501c:	40f10133          	sub	sp,sp,a5
    80005020:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80005024:	0019871b          	addiw	a4,s3,1
    80005028:	00171793          	slli	a5,a4,0x1
    8000502c:	00e787b3          	add	a5,a5,a4
    80005030:	00379793          	slli	a5,a5,0x3
    80005034:	00f78793          	addi	a5,a5,15
    80005038:	ff07f793          	andi	a5,a5,-16
    8000503c:	40f10133          	sub	sp,sp,a5
    80005040:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80005044:	00199493          	slli	s1,s3,0x1
    80005048:	013484b3          	add	s1,s1,s3
    8000504c:	00349493          	slli	s1,s1,0x3
    80005050:	009b04b3          	add	s1,s6,s1
    80005054:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80005058:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    8000505c:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80005060:	02800513          	li	a0,40
    80005064:	ffffe097          	auipc	ra,0xffffe
    80005068:	1b0080e7          	jalr	432(ra) # 80003214 <_Znwm>
    8000506c:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80005070:	ffffe097          	auipc	ra,0xffffe
    80005074:	494080e7          	jalr	1172(ra) # 80003504 <_ZN6ThreadC1Ev>
    80005078:	00008797          	auipc	a5,0x8
    8000507c:	fa878793          	addi	a5,a5,-88 # 8000d020 <_ZTV8Consumer+0x10>
    80005080:	00fbb023          	sd	a5,0(s7)
    80005084:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80005088:	000b8513          	mv	a0,s7
    8000508c:	ffffe097          	auipc	ra,0xffffe
    80005090:	340080e7          	jalr	832(ra) # 800033cc <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80005094:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80005098:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    8000509c:	00008797          	auipc	a5,0x8
    800050a0:	26c7b783          	ld	a5,620(a5) # 8000d308 <_ZL10waitForAll>
    800050a4:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800050a8:	02800513          	li	a0,40
    800050ac:	ffffe097          	auipc	ra,0xffffe
    800050b0:	168080e7          	jalr	360(ra) # 80003214 <_Znwm>
    800050b4:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800050b8:	ffffe097          	auipc	ra,0xffffe
    800050bc:	44c080e7          	jalr	1100(ra) # 80003504 <_ZN6ThreadC1Ev>
    800050c0:	00008797          	auipc	a5,0x8
    800050c4:	f1078793          	addi	a5,a5,-240 # 8000cfd0 <_ZTV16ProducerKeyborad+0x10>
    800050c8:	00f4b023          	sd	a5,0(s1)
    800050cc:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800050d0:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800050d4:	00048513          	mv	a0,s1
    800050d8:	ffffe097          	auipc	ra,0xffffe
    800050dc:	2f4080e7          	jalr	756(ra) # 800033cc <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800050e0:	00100913          	li	s2,1
    800050e4:	0300006f          	j	80005114 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800050e8:	00008797          	auipc	a5,0x8
    800050ec:	f1078793          	addi	a5,a5,-240 # 8000cff8 <_ZTV8Producer+0x10>
    800050f0:	00fcb023          	sd	a5,0(s9)
    800050f4:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    800050f8:	00391793          	slli	a5,s2,0x3
    800050fc:	00fa07b3          	add	a5,s4,a5
    80005100:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80005104:	000c8513          	mv	a0,s9
    80005108:	ffffe097          	auipc	ra,0xffffe
    8000510c:	2c4080e7          	jalr	708(ra) # 800033cc <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80005110:	0019091b          	addiw	s2,s2,1
    80005114:	05395263          	bge	s2,s3,80005158 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80005118:	00191493          	slli	s1,s2,0x1
    8000511c:	012484b3          	add	s1,s1,s2
    80005120:	00349493          	slli	s1,s1,0x3
    80005124:	009b04b3          	add	s1,s6,s1
    80005128:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    8000512c:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80005130:	00008797          	auipc	a5,0x8
    80005134:	1d87b783          	ld	a5,472(a5) # 8000d308 <_ZL10waitForAll>
    80005138:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    8000513c:	02800513          	li	a0,40
    80005140:	ffffe097          	auipc	ra,0xffffe
    80005144:	0d4080e7          	jalr	212(ra) # 80003214 <_Znwm>
    80005148:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    8000514c:	ffffe097          	auipc	ra,0xffffe
    80005150:	3b8080e7          	jalr	952(ra) # 80003504 <_ZN6ThreadC1Ev>
    80005154:	f95ff06f          	j	800050e8 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80005158:	ffffe097          	auipc	ra,0xffffe
    8000515c:	2f0080e7          	jalr	752(ra) # 80003448 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005160:	00000493          	li	s1,0
    80005164:	0099ce63          	blt	s3,s1,80005180 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80005168:	00008517          	auipc	a0,0x8
    8000516c:	1a053503          	ld	a0,416(a0) # 8000d308 <_ZL10waitForAll>
    80005170:	ffffe097          	auipc	ra,0xffffe
    80005174:	448080e7          	jalr	1096(ra) # 800035b8 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005178:	0014849b          	addiw	s1,s1,1
    8000517c:	fe9ff06f          	j	80005164 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80005180:	00008517          	auipc	a0,0x8
    80005184:	18853503          	ld	a0,392(a0) # 8000d308 <_ZL10waitForAll>
    80005188:	00050863          	beqz	a0,80005198 <_Z20testConsumerProducerv+0x2f4>
    8000518c:	00053783          	ld	a5,0(a0)
    80005190:	0087b783          	ld	a5,8(a5)
    80005194:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80005198:	00000493          	li	s1,0
    8000519c:	0080006f          	j	800051a4 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800051a0:	0014849b          	addiw	s1,s1,1
    800051a4:	0334d263          	bge	s1,s3,800051c8 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800051a8:	00349793          	slli	a5,s1,0x3
    800051ac:	00fa07b3          	add	a5,s4,a5
    800051b0:	0007b503          	ld	a0,0(a5)
    800051b4:	fe0506e3          	beqz	a0,800051a0 <_Z20testConsumerProducerv+0x2fc>
    800051b8:	00053783          	ld	a5,0(a0)
    800051bc:	0087b783          	ld	a5,8(a5)
    800051c0:	000780e7          	jalr	a5
    800051c4:	fddff06f          	j	800051a0 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    800051c8:	000b8a63          	beqz	s7,800051dc <_Z20testConsumerProducerv+0x338>
    800051cc:	000bb783          	ld	a5,0(s7)
    800051d0:	0087b783          	ld	a5,8(a5)
    800051d4:	000b8513          	mv	a0,s7
    800051d8:	000780e7          	jalr	a5
    delete buffer;
    800051dc:	000a8e63          	beqz	s5,800051f8 <_Z20testConsumerProducerv+0x354>
    800051e0:	000a8513          	mv	a0,s5
    800051e4:	00002097          	auipc	ra,0x2
    800051e8:	870080e7          	jalr	-1936(ra) # 80006a54 <_ZN9BufferCPPD1Ev>
    800051ec:	000a8513          	mv	a0,s5
    800051f0:	ffffe097          	auipc	ra,0xffffe
    800051f4:	074080e7          	jalr	116(ra) # 80003264 <_ZdlPv>
    800051f8:	000c0113          	mv	sp,s8
}
    800051fc:	f8040113          	addi	sp,s0,-128
    80005200:	07813083          	ld	ra,120(sp)
    80005204:	07013403          	ld	s0,112(sp)
    80005208:	06813483          	ld	s1,104(sp)
    8000520c:	06013903          	ld	s2,96(sp)
    80005210:	05813983          	ld	s3,88(sp)
    80005214:	05013a03          	ld	s4,80(sp)
    80005218:	04813a83          	ld	s5,72(sp)
    8000521c:	04013b03          	ld	s6,64(sp)
    80005220:	03813b83          	ld	s7,56(sp)
    80005224:	03013c03          	ld	s8,48(sp)
    80005228:	02813c83          	ld	s9,40(sp)
    8000522c:	08010113          	addi	sp,sp,128
    80005230:	00008067          	ret
    80005234:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005238:	000a8513          	mv	a0,s5
    8000523c:	ffffe097          	auipc	ra,0xffffe
    80005240:	028080e7          	jalr	40(ra) # 80003264 <_ZdlPv>
    80005244:	00048513          	mv	a0,s1
    80005248:	00009097          	auipc	ra,0x9
    8000524c:	1d0080e7          	jalr	464(ra) # 8000e418 <_Unwind_Resume>
    80005250:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80005254:	00090513          	mv	a0,s2
    80005258:	ffffe097          	auipc	ra,0xffffe
    8000525c:	00c080e7          	jalr	12(ra) # 80003264 <_ZdlPv>
    80005260:	00048513          	mv	a0,s1
    80005264:	00009097          	auipc	ra,0x9
    80005268:	1b4080e7          	jalr	436(ra) # 8000e418 <_Unwind_Resume>
    8000526c:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80005270:	000b8513          	mv	a0,s7
    80005274:	ffffe097          	auipc	ra,0xffffe
    80005278:	ff0080e7          	jalr	-16(ra) # 80003264 <_ZdlPv>
    8000527c:	00048513          	mv	a0,s1
    80005280:	00009097          	auipc	ra,0x9
    80005284:	198080e7          	jalr	408(ra) # 8000e418 <_Unwind_Resume>
    80005288:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000528c:	00048513          	mv	a0,s1
    80005290:	ffffe097          	auipc	ra,0xffffe
    80005294:	fd4080e7          	jalr	-44(ra) # 80003264 <_ZdlPv>
    80005298:	00090513          	mv	a0,s2
    8000529c:	00009097          	auipc	ra,0x9
    800052a0:	17c080e7          	jalr	380(ra) # 8000e418 <_Unwind_Resume>
    800052a4:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800052a8:	000c8513          	mv	a0,s9
    800052ac:	ffffe097          	auipc	ra,0xffffe
    800052b0:	fb8080e7          	jalr	-72(ra) # 80003264 <_ZdlPv>
    800052b4:	00048513          	mv	a0,s1
    800052b8:	00009097          	auipc	ra,0x9
    800052bc:	160080e7          	jalr	352(ra) # 8000e418 <_Unwind_Resume>

00000000800052c0 <_ZN8Consumer3runEv>:
    void run() override {
    800052c0:	fd010113          	addi	sp,sp,-48
    800052c4:	02113423          	sd	ra,40(sp)
    800052c8:	02813023          	sd	s0,32(sp)
    800052cc:	00913c23          	sd	s1,24(sp)
    800052d0:	01213823          	sd	s2,16(sp)
    800052d4:	01313423          	sd	s3,8(sp)
    800052d8:	03010413          	addi	s0,sp,48
    800052dc:	00050913          	mv	s2,a0
        int i = 0;
    800052e0:	00000993          	li	s3,0
    800052e4:	0100006f          	j	800052f4 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800052e8:	00a00513          	li	a0,10
    800052ec:	ffffe097          	auipc	ra,0xffffe
    800052f0:	3bc080e7          	jalr	956(ra) # 800036a8 <_ZN7Console4putcEc>
        while (!threadEnd) {
    800052f4:	00008797          	auipc	a5,0x8
    800052f8:	00c7a783          	lw	a5,12(a5) # 8000d300 <_ZL9threadEnd>
    800052fc:	04079a63          	bnez	a5,80005350 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80005300:	02093783          	ld	a5,32(s2)
    80005304:	0087b503          	ld	a0,8(a5)
    80005308:	00001097          	auipc	ra,0x1
    8000530c:	638080e7          	jalr	1592(ra) # 80006940 <_ZN9BufferCPP3getEv>
            i++;
    80005310:	0019849b          	addiw	s1,s3,1
    80005314:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80005318:	0ff57513          	andi	a0,a0,255
    8000531c:	ffffe097          	auipc	ra,0xffffe
    80005320:	38c080e7          	jalr	908(ra) # 800036a8 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80005324:	05000793          	li	a5,80
    80005328:	02f4e4bb          	remw	s1,s1,a5
    8000532c:	fc0494e3          	bnez	s1,800052f4 <_ZN8Consumer3runEv+0x34>
    80005330:	fb9ff06f          	j	800052e8 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80005334:	02093783          	ld	a5,32(s2)
    80005338:	0087b503          	ld	a0,8(a5)
    8000533c:	00001097          	auipc	ra,0x1
    80005340:	604080e7          	jalr	1540(ra) # 80006940 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80005344:	0ff57513          	andi	a0,a0,255
    80005348:	ffffe097          	auipc	ra,0xffffe
    8000534c:	360080e7          	jalr	864(ra) # 800036a8 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80005350:	02093783          	ld	a5,32(s2)
    80005354:	0087b503          	ld	a0,8(a5)
    80005358:	00001097          	auipc	ra,0x1
    8000535c:	674080e7          	jalr	1652(ra) # 800069cc <_ZN9BufferCPP6getCntEv>
    80005360:	fca04ae3          	bgtz	a0,80005334 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80005364:	02093783          	ld	a5,32(s2)
    80005368:	0107b503          	ld	a0,16(a5)
    8000536c:	ffffe097          	auipc	ra,0xffffe
    80005370:	278080e7          	jalr	632(ra) # 800035e4 <_ZN9Semaphore6signalEv>
    }
    80005374:	02813083          	ld	ra,40(sp)
    80005378:	02013403          	ld	s0,32(sp)
    8000537c:	01813483          	ld	s1,24(sp)
    80005380:	01013903          	ld	s2,16(sp)
    80005384:	00813983          	ld	s3,8(sp)
    80005388:	03010113          	addi	sp,sp,48
    8000538c:	00008067          	ret

0000000080005390 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80005390:	ff010113          	addi	sp,sp,-16
    80005394:	00113423          	sd	ra,8(sp)
    80005398:	00813023          	sd	s0,0(sp)
    8000539c:	01010413          	addi	s0,sp,16
    800053a0:	00008797          	auipc	a5,0x8
    800053a4:	c8078793          	addi	a5,a5,-896 # 8000d020 <_ZTV8Consumer+0x10>
    800053a8:	00f53023          	sd	a5,0(a0)
    800053ac:	ffffe097          	auipc	ra,0xffffe
    800053b0:	db4080e7          	jalr	-588(ra) # 80003160 <_ZN6ThreadD1Ev>
    800053b4:	00813083          	ld	ra,8(sp)
    800053b8:	00013403          	ld	s0,0(sp)
    800053bc:	01010113          	addi	sp,sp,16
    800053c0:	00008067          	ret

00000000800053c4 <_ZN8ConsumerD0Ev>:
    800053c4:	fe010113          	addi	sp,sp,-32
    800053c8:	00113c23          	sd	ra,24(sp)
    800053cc:	00813823          	sd	s0,16(sp)
    800053d0:	00913423          	sd	s1,8(sp)
    800053d4:	02010413          	addi	s0,sp,32
    800053d8:	00050493          	mv	s1,a0
    800053dc:	00008797          	auipc	a5,0x8
    800053e0:	c4478793          	addi	a5,a5,-956 # 8000d020 <_ZTV8Consumer+0x10>
    800053e4:	00f53023          	sd	a5,0(a0)
    800053e8:	ffffe097          	auipc	ra,0xffffe
    800053ec:	d78080e7          	jalr	-648(ra) # 80003160 <_ZN6ThreadD1Ev>
    800053f0:	00048513          	mv	a0,s1
    800053f4:	ffffe097          	auipc	ra,0xffffe
    800053f8:	e70080e7          	jalr	-400(ra) # 80003264 <_ZdlPv>
    800053fc:	01813083          	ld	ra,24(sp)
    80005400:	01013403          	ld	s0,16(sp)
    80005404:	00813483          	ld	s1,8(sp)
    80005408:	02010113          	addi	sp,sp,32
    8000540c:	00008067          	ret

0000000080005410 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80005410:	ff010113          	addi	sp,sp,-16
    80005414:	00113423          	sd	ra,8(sp)
    80005418:	00813023          	sd	s0,0(sp)
    8000541c:	01010413          	addi	s0,sp,16
    80005420:	00008797          	auipc	a5,0x8
    80005424:	bb078793          	addi	a5,a5,-1104 # 8000cfd0 <_ZTV16ProducerKeyborad+0x10>
    80005428:	00f53023          	sd	a5,0(a0)
    8000542c:	ffffe097          	auipc	ra,0xffffe
    80005430:	d34080e7          	jalr	-716(ra) # 80003160 <_ZN6ThreadD1Ev>
    80005434:	00813083          	ld	ra,8(sp)
    80005438:	00013403          	ld	s0,0(sp)
    8000543c:	01010113          	addi	sp,sp,16
    80005440:	00008067          	ret

0000000080005444 <_ZN16ProducerKeyboradD0Ev>:
    80005444:	fe010113          	addi	sp,sp,-32
    80005448:	00113c23          	sd	ra,24(sp)
    8000544c:	00813823          	sd	s0,16(sp)
    80005450:	00913423          	sd	s1,8(sp)
    80005454:	02010413          	addi	s0,sp,32
    80005458:	00050493          	mv	s1,a0
    8000545c:	00008797          	auipc	a5,0x8
    80005460:	b7478793          	addi	a5,a5,-1164 # 8000cfd0 <_ZTV16ProducerKeyborad+0x10>
    80005464:	00f53023          	sd	a5,0(a0)
    80005468:	ffffe097          	auipc	ra,0xffffe
    8000546c:	cf8080e7          	jalr	-776(ra) # 80003160 <_ZN6ThreadD1Ev>
    80005470:	00048513          	mv	a0,s1
    80005474:	ffffe097          	auipc	ra,0xffffe
    80005478:	df0080e7          	jalr	-528(ra) # 80003264 <_ZdlPv>
    8000547c:	01813083          	ld	ra,24(sp)
    80005480:	01013403          	ld	s0,16(sp)
    80005484:	00813483          	ld	s1,8(sp)
    80005488:	02010113          	addi	sp,sp,32
    8000548c:	00008067          	ret

0000000080005490 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80005490:	ff010113          	addi	sp,sp,-16
    80005494:	00113423          	sd	ra,8(sp)
    80005498:	00813023          	sd	s0,0(sp)
    8000549c:	01010413          	addi	s0,sp,16
    800054a0:	00008797          	auipc	a5,0x8
    800054a4:	b5878793          	addi	a5,a5,-1192 # 8000cff8 <_ZTV8Producer+0x10>
    800054a8:	00f53023          	sd	a5,0(a0)
    800054ac:	ffffe097          	auipc	ra,0xffffe
    800054b0:	cb4080e7          	jalr	-844(ra) # 80003160 <_ZN6ThreadD1Ev>
    800054b4:	00813083          	ld	ra,8(sp)
    800054b8:	00013403          	ld	s0,0(sp)
    800054bc:	01010113          	addi	sp,sp,16
    800054c0:	00008067          	ret

00000000800054c4 <_ZN8ProducerD0Ev>:
    800054c4:	fe010113          	addi	sp,sp,-32
    800054c8:	00113c23          	sd	ra,24(sp)
    800054cc:	00813823          	sd	s0,16(sp)
    800054d0:	00913423          	sd	s1,8(sp)
    800054d4:	02010413          	addi	s0,sp,32
    800054d8:	00050493          	mv	s1,a0
    800054dc:	00008797          	auipc	a5,0x8
    800054e0:	b1c78793          	addi	a5,a5,-1252 # 8000cff8 <_ZTV8Producer+0x10>
    800054e4:	00f53023          	sd	a5,0(a0)
    800054e8:	ffffe097          	auipc	ra,0xffffe
    800054ec:	c78080e7          	jalr	-904(ra) # 80003160 <_ZN6ThreadD1Ev>
    800054f0:	00048513          	mv	a0,s1
    800054f4:	ffffe097          	auipc	ra,0xffffe
    800054f8:	d70080e7          	jalr	-656(ra) # 80003264 <_ZdlPv>
    800054fc:	01813083          	ld	ra,24(sp)
    80005500:	01013403          	ld	s0,16(sp)
    80005504:	00813483          	ld	s1,8(sp)
    80005508:	02010113          	addi	sp,sp,32
    8000550c:	00008067          	ret

0000000080005510 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80005510:	fe010113          	addi	sp,sp,-32
    80005514:	00113c23          	sd	ra,24(sp)
    80005518:	00813823          	sd	s0,16(sp)
    8000551c:	00913423          	sd	s1,8(sp)
    80005520:	02010413          	addi	s0,sp,32
    80005524:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80005528:	ffffc097          	auipc	ra,0xffffc
    8000552c:	0d8080e7          	jalr	216(ra) # 80001600 <_Z4getcv>
    80005530:	0005059b          	sext.w	a1,a0
    80005534:	01b00793          	li	a5,27
    80005538:	00f58c63          	beq	a1,a5,80005550 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    8000553c:	0204b783          	ld	a5,32(s1)
    80005540:	0087b503          	ld	a0,8(a5)
    80005544:	00001097          	auipc	ra,0x1
    80005548:	36c080e7          	jalr	876(ra) # 800068b0 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    8000554c:	fddff06f          	j	80005528 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80005550:	00100793          	li	a5,1
    80005554:	00008717          	auipc	a4,0x8
    80005558:	daf72623          	sw	a5,-596(a4) # 8000d300 <_ZL9threadEnd>
        td->buffer->put('!');
    8000555c:	0204b783          	ld	a5,32(s1)
    80005560:	02100593          	li	a1,33
    80005564:	0087b503          	ld	a0,8(a5)
    80005568:	00001097          	auipc	ra,0x1
    8000556c:	348080e7          	jalr	840(ra) # 800068b0 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80005570:	0204b783          	ld	a5,32(s1)
    80005574:	0107b503          	ld	a0,16(a5)
    80005578:	ffffe097          	auipc	ra,0xffffe
    8000557c:	06c080e7          	jalr	108(ra) # 800035e4 <_ZN9Semaphore6signalEv>
    }
    80005580:	01813083          	ld	ra,24(sp)
    80005584:	01013403          	ld	s0,16(sp)
    80005588:	00813483          	ld	s1,8(sp)
    8000558c:	02010113          	addi	sp,sp,32
    80005590:	00008067          	ret

0000000080005594 <_ZN8Producer3runEv>:
    void run() override {
    80005594:	fe010113          	addi	sp,sp,-32
    80005598:	00113c23          	sd	ra,24(sp)
    8000559c:	00813823          	sd	s0,16(sp)
    800055a0:	00913423          	sd	s1,8(sp)
    800055a4:	01213023          	sd	s2,0(sp)
    800055a8:	02010413          	addi	s0,sp,32
    800055ac:	00050493          	mv	s1,a0
        int i = 0;
    800055b0:	00000913          	li	s2,0
        while (!threadEnd) {
    800055b4:	00008797          	auipc	a5,0x8
    800055b8:	d4c7a783          	lw	a5,-692(a5) # 8000d300 <_ZL9threadEnd>
    800055bc:	04079263          	bnez	a5,80005600 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    800055c0:	0204b783          	ld	a5,32(s1)
    800055c4:	0007a583          	lw	a1,0(a5)
    800055c8:	0305859b          	addiw	a1,a1,48
    800055cc:	0087b503          	ld	a0,8(a5)
    800055d0:	00001097          	auipc	ra,0x1
    800055d4:	2e0080e7          	jalr	736(ra) # 800068b0 <_ZN9BufferCPP3putEi>
            i++;
    800055d8:	0019071b          	addiw	a4,s2,1
    800055dc:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    800055e0:	0204b783          	ld	a5,32(s1)
    800055e4:	0007a783          	lw	a5,0(a5)
    800055e8:	00e787bb          	addw	a5,a5,a4
    800055ec:	00500513          	li	a0,5
    800055f0:	02a7e53b          	remw	a0,a5,a0
    800055f4:	ffffe097          	auipc	ra,0xffffe
    800055f8:	e7c080e7          	jalr	-388(ra) # 80003470 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    800055fc:	fb9ff06f          	j	800055b4 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80005600:	0204b783          	ld	a5,32(s1)
    80005604:	0107b503          	ld	a0,16(a5)
    80005608:	ffffe097          	auipc	ra,0xffffe
    8000560c:	fdc080e7          	jalr	-36(ra) # 800035e4 <_ZN9Semaphore6signalEv>
    }
    80005610:	01813083          	ld	ra,24(sp)
    80005614:	01013403          	ld	s0,16(sp)
    80005618:	00813483          	ld	s1,8(sp)
    8000561c:	00013903          	ld	s2,0(sp)
    80005620:	02010113          	addi	sp,sp,32
    80005624:	00008067          	ret

0000000080005628 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005628:	fe010113          	addi	sp,sp,-32
    8000562c:	00113c23          	sd	ra,24(sp)
    80005630:	00813823          	sd	s0,16(sp)
    80005634:	00913423          	sd	s1,8(sp)
    80005638:	01213023          	sd	s2,0(sp)
    8000563c:	02010413          	addi	s0,sp,32
    80005640:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005644:	00100793          	li	a5,1
    80005648:	02a7f863          	bgeu	a5,a0,80005678 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000564c:	00a00793          	li	a5,10
    80005650:	02f577b3          	remu	a5,a0,a5
    80005654:	02078e63          	beqz	a5,80005690 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005658:	fff48513          	addi	a0,s1,-1
    8000565c:	00000097          	auipc	ra,0x0
    80005660:	fcc080e7          	jalr	-52(ra) # 80005628 <_ZL9fibonaccim>
    80005664:	00050913          	mv	s2,a0
    80005668:	ffe48513          	addi	a0,s1,-2
    8000566c:	00000097          	auipc	ra,0x0
    80005670:	fbc080e7          	jalr	-68(ra) # 80005628 <_ZL9fibonaccim>
    80005674:	00a90533          	add	a0,s2,a0
}
    80005678:	01813083          	ld	ra,24(sp)
    8000567c:	01013403          	ld	s0,16(sp)
    80005680:	00813483          	ld	s1,8(sp)
    80005684:	00013903          	ld	s2,0(sp)
    80005688:	02010113          	addi	sp,sp,32
    8000568c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005690:	ffffc097          	auipc	ra,0xffffc
    80005694:	e30080e7          	jalr	-464(ra) # 800014c0 <_Z15thread_dispatchv>
    80005698:	fc1ff06f          	j	80005658 <_ZL9fibonaccim+0x30>

000000008000569c <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    8000569c:	fe010113          	addi	sp,sp,-32
    800056a0:	00113c23          	sd	ra,24(sp)
    800056a4:	00813823          	sd	s0,16(sp)
    800056a8:	00913423          	sd	s1,8(sp)
    800056ac:	01213023          	sd	s2,0(sp)
    800056b0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800056b4:	00a00493          	li	s1,10
    800056b8:	0400006f          	j	800056f8 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800056bc:	00005517          	auipc	a0,0x5
    800056c0:	dac50513          	addi	a0,a0,-596 # 8000a468 <CONSOLE_STATUS+0x458>
    800056c4:	00001097          	auipc	ra,0x1
    800056c8:	dc8080e7          	jalr	-568(ra) # 8000648c <_Z11printStringPKc>
    800056cc:	00000613          	li	a2,0
    800056d0:	00a00593          	li	a1,10
    800056d4:	00048513          	mv	a0,s1
    800056d8:	00001097          	auipc	ra,0x1
    800056dc:	f64080e7          	jalr	-156(ra) # 8000663c <_Z8printIntiii>
    800056e0:	00005517          	auipc	a0,0x5
    800056e4:	f7850513          	addi	a0,a0,-136 # 8000a658 <CONSOLE_STATUS+0x648>
    800056e8:	00001097          	auipc	ra,0x1
    800056ec:	da4080e7          	jalr	-604(ra) # 8000648c <_Z11printStringPKc>
    for (; i < 13; i++) {
    800056f0:	0014849b          	addiw	s1,s1,1
    800056f4:	0ff4f493          	andi	s1,s1,255
    800056f8:	00c00793          	li	a5,12
    800056fc:	fc97f0e3          	bgeu	a5,s1,800056bc <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005700:	00005517          	auipc	a0,0x5
    80005704:	d7050513          	addi	a0,a0,-656 # 8000a470 <CONSOLE_STATUS+0x460>
    80005708:	00001097          	auipc	ra,0x1
    8000570c:	d84080e7          	jalr	-636(ra) # 8000648c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005710:	00500313          	li	t1,5
    thread_dispatch();
    80005714:	ffffc097          	auipc	ra,0xffffc
    80005718:	dac080e7          	jalr	-596(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000571c:	01000513          	li	a0,16
    80005720:	00000097          	auipc	ra,0x0
    80005724:	f08080e7          	jalr	-248(ra) # 80005628 <_ZL9fibonaccim>
    80005728:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000572c:	00005517          	auipc	a0,0x5
    80005730:	d5450513          	addi	a0,a0,-684 # 8000a480 <CONSOLE_STATUS+0x470>
    80005734:	00001097          	auipc	ra,0x1
    80005738:	d58080e7          	jalr	-680(ra) # 8000648c <_Z11printStringPKc>
    8000573c:	00000613          	li	a2,0
    80005740:	00a00593          	li	a1,10
    80005744:	0009051b          	sext.w	a0,s2
    80005748:	00001097          	auipc	ra,0x1
    8000574c:	ef4080e7          	jalr	-268(ra) # 8000663c <_Z8printIntiii>
    80005750:	00005517          	auipc	a0,0x5
    80005754:	f0850513          	addi	a0,a0,-248 # 8000a658 <CONSOLE_STATUS+0x648>
    80005758:	00001097          	auipc	ra,0x1
    8000575c:	d34080e7          	jalr	-716(ra) # 8000648c <_Z11printStringPKc>
    80005760:	0400006f          	j	800057a0 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005764:	00005517          	auipc	a0,0x5
    80005768:	d0450513          	addi	a0,a0,-764 # 8000a468 <CONSOLE_STATUS+0x458>
    8000576c:	00001097          	auipc	ra,0x1
    80005770:	d20080e7          	jalr	-736(ra) # 8000648c <_Z11printStringPKc>
    80005774:	00000613          	li	a2,0
    80005778:	00a00593          	li	a1,10
    8000577c:	00048513          	mv	a0,s1
    80005780:	00001097          	auipc	ra,0x1
    80005784:	ebc080e7          	jalr	-324(ra) # 8000663c <_Z8printIntiii>
    80005788:	00005517          	auipc	a0,0x5
    8000578c:	ed050513          	addi	a0,a0,-304 # 8000a658 <CONSOLE_STATUS+0x648>
    80005790:	00001097          	auipc	ra,0x1
    80005794:	cfc080e7          	jalr	-772(ra) # 8000648c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005798:	0014849b          	addiw	s1,s1,1
    8000579c:	0ff4f493          	andi	s1,s1,255
    800057a0:	00f00793          	li	a5,15
    800057a4:	fc97f0e3          	bgeu	a5,s1,80005764 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800057a8:	00005517          	auipc	a0,0x5
    800057ac:	ce850513          	addi	a0,a0,-792 # 8000a490 <CONSOLE_STATUS+0x480>
    800057b0:	00001097          	auipc	ra,0x1
    800057b4:	cdc080e7          	jalr	-804(ra) # 8000648c <_Z11printStringPKc>
    finishedD = true;
    800057b8:	00100793          	li	a5,1
    800057bc:	00008717          	auipc	a4,0x8
    800057c0:	b4f70a23          	sb	a5,-1196(a4) # 8000d310 <_ZL9finishedD>
    thread_dispatch();
    800057c4:	ffffc097          	auipc	ra,0xffffc
    800057c8:	cfc080e7          	jalr	-772(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800057cc:	01813083          	ld	ra,24(sp)
    800057d0:	01013403          	ld	s0,16(sp)
    800057d4:	00813483          	ld	s1,8(sp)
    800057d8:	00013903          	ld	s2,0(sp)
    800057dc:	02010113          	addi	sp,sp,32
    800057e0:	00008067          	ret

00000000800057e4 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800057e4:	fe010113          	addi	sp,sp,-32
    800057e8:	00113c23          	sd	ra,24(sp)
    800057ec:	00813823          	sd	s0,16(sp)
    800057f0:	00913423          	sd	s1,8(sp)
    800057f4:	01213023          	sd	s2,0(sp)
    800057f8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800057fc:	00000493          	li	s1,0
    80005800:	0400006f          	j	80005840 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005804:	00005517          	auipc	a0,0x5
    80005808:	c2450513          	addi	a0,a0,-988 # 8000a428 <CONSOLE_STATUS+0x418>
    8000580c:	00001097          	auipc	ra,0x1
    80005810:	c80080e7          	jalr	-896(ra) # 8000648c <_Z11printStringPKc>
    80005814:	00000613          	li	a2,0
    80005818:	00a00593          	li	a1,10
    8000581c:	00048513          	mv	a0,s1
    80005820:	00001097          	auipc	ra,0x1
    80005824:	e1c080e7          	jalr	-484(ra) # 8000663c <_Z8printIntiii>
    80005828:	00005517          	auipc	a0,0x5
    8000582c:	e3050513          	addi	a0,a0,-464 # 8000a658 <CONSOLE_STATUS+0x648>
    80005830:	00001097          	auipc	ra,0x1
    80005834:	c5c080e7          	jalr	-932(ra) # 8000648c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005838:	0014849b          	addiw	s1,s1,1
    8000583c:	0ff4f493          	andi	s1,s1,255
    80005840:	00200793          	li	a5,2
    80005844:	fc97f0e3          	bgeu	a5,s1,80005804 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005848:	00005517          	auipc	a0,0x5
    8000584c:	be850513          	addi	a0,a0,-1048 # 8000a430 <CONSOLE_STATUS+0x420>
    80005850:	00001097          	auipc	ra,0x1
    80005854:	c3c080e7          	jalr	-964(ra) # 8000648c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005858:	00700313          	li	t1,7
    thread_dispatch();
    8000585c:	ffffc097          	auipc	ra,0xffffc
    80005860:	c64080e7          	jalr	-924(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005864:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005868:	00005517          	auipc	a0,0x5
    8000586c:	bd850513          	addi	a0,a0,-1064 # 8000a440 <CONSOLE_STATUS+0x430>
    80005870:	00001097          	auipc	ra,0x1
    80005874:	c1c080e7          	jalr	-996(ra) # 8000648c <_Z11printStringPKc>
    80005878:	00000613          	li	a2,0
    8000587c:	00a00593          	li	a1,10
    80005880:	0009051b          	sext.w	a0,s2
    80005884:	00001097          	auipc	ra,0x1
    80005888:	db8080e7          	jalr	-584(ra) # 8000663c <_Z8printIntiii>
    8000588c:	00005517          	auipc	a0,0x5
    80005890:	dcc50513          	addi	a0,a0,-564 # 8000a658 <CONSOLE_STATUS+0x648>
    80005894:	00001097          	auipc	ra,0x1
    80005898:	bf8080e7          	jalr	-1032(ra) # 8000648c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    8000589c:	00c00513          	li	a0,12
    800058a0:	00000097          	auipc	ra,0x0
    800058a4:	d88080e7          	jalr	-632(ra) # 80005628 <_ZL9fibonaccim>
    800058a8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800058ac:	00005517          	auipc	a0,0x5
    800058b0:	b9c50513          	addi	a0,a0,-1124 # 8000a448 <CONSOLE_STATUS+0x438>
    800058b4:	00001097          	auipc	ra,0x1
    800058b8:	bd8080e7          	jalr	-1064(ra) # 8000648c <_Z11printStringPKc>
    800058bc:	00000613          	li	a2,0
    800058c0:	00a00593          	li	a1,10
    800058c4:	0009051b          	sext.w	a0,s2
    800058c8:	00001097          	auipc	ra,0x1
    800058cc:	d74080e7          	jalr	-652(ra) # 8000663c <_Z8printIntiii>
    800058d0:	00005517          	auipc	a0,0x5
    800058d4:	d8850513          	addi	a0,a0,-632 # 8000a658 <CONSOLE_STATUS+0x648>
    800058d8:	00001097          	auipc	ra,0x1
    800058dc:	bb4080e7          	jalr	-1100(ra) # 8000648c <_Z11printStringPKc>
    800058e0:	0400006f          	j	80005920 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800058e4:	00005517          	auipc	a0,0x5
    800058e8:	b4450513          	addi	a0,a0,-1212 # 8000a428 <CONSOLE_STATUS+0x418>
    800058ec:	00001097          	auipc	ra,0x1
    800058f0:	ba0080e7          	jalr	-1120(ra) # 8000648c <_Z11printStringPKc>
    800058f4:	00000613          	li	a2,0
    800058f8:	00a00593          	li	a1,10
    800058fc:	00048513          	mv	a0,s1
    80005900:	00001097          	auipc	ra,0x1
    80005904:	d3c080e7          	jalr	-708(ra) # 8000663c <_Z8printIntiii>
    80005908:	00005517          	auipc	a0,0x5
    8000590c:	d5050513          	addi	a0,a0,-688 # 8000a658 <CONSOLE_STATUS+0x648>
    80005910:	00001097          	auipc	ra,0x1
    80005914:	b7c080e7          	jalr	-1156(ra) # 8000648c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005918:	0014849b          	addiw	s1,s1,1
    8000591c:	0ff4f493          	andi	s1,s1,255
    80005920:	00500793          	li	a5,5
    80005924:	fc97f0e3          	bgeu	a5,s1,800058e4 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005928:	00005517          	auipc	a0,0x5
    8000592c:	b3050513          	addi	a0,a0,-1232 # 8000a458 <CONSOLE_STATUS+0x448>
    80005930:	00001097          	auipc	ra,0x1
    80005934:	b5c080e7          	jalr	-1188(ra) # 8000648c <_Z11printStringPKc>
    finishedC = true;
    80005938:	00100793          	li	a5,1
    8000593c:	00008717          	auipc	a4,0x8
    80005940:	9cf70aa3          	sb	a5,-1579(a4) # 8000d311 <_ZL9finishedC>
    thread_dispatch();
    80005944:	ffffc097          	auipc	ra,0xffffc
    80005948:	b7c080e7          	jalr	-1156(ra) # 800014c0 <_Z15thread_dispatchv>
}
    8000594c:	01813083          	ld	ra,24(sp)
    80005950:	01013403          	ld	s0,16(sp)
    80005954:	00813483          	ld	s1,8(sp)
    80005958:	00013903          	ld	s2,0(sp)
    8000595c:	02010113          	addi	sp,sp,32
    80005960:	00008067          	ret

0000000080005964 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005964:	fe010113          	addi	sp,sp,-32
    80005968:	00113c23          	sd	ra,24(sp)
    8000596c:	00813823          	sd	s0,16(sp)
    80005970:	00913423          	sd	s1,8(sp)
    80005974:	01213023          	sd	s2,0(sp)
    80005978:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000597c:	00000913          	li	s2,0
    80005980:	0380006f          	j	800059b8 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80005984:	ffffc097          	auipc	ra,0xffffc
    80005988:	b3c080e7          	jalr	-1220(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000598c:	00148493          	addi	s1,s1,1
    80005990:	000027b7          	lui	a5,0x2
    80005994:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005998:	0097ee63          	bltu	a5,s1,800059b4 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000599c:	00000713          	li	a4,0
    800059a0:	000077b7          	lui	a5,0x7
    800059a4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800059a8:	fce7eee3          	bltu	a5,a4,80005984 <_ZL11workerBodyBPv+0x20>
    800059ac:	00170713          	addi	a4,a4,1
    800059b0:	ff1ff06f          	j	800059a0 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800059b4:	00190913          	addi	s2,s2,1
    800059b8:	00f00793          	li	a5,15
    800059bc:	0527e063          	bltu	a5,s2,800059fc <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800059c0:	00005517          	auipc	a0,0x5
    800059c4:	a5050513          	addi	a0,a0,-1456 # 8000a410 <CONSOLE_STATUS+0x400>
    800059c8:	00001097          	auipc	ra,0x1
    800059cc:	ac4080e7          	jalr	-1340(ra) # 8000648c <_Z11printStringPKc>
    800059d0:	00000613          	li	a2,0
    800059d4:	00a00593          	li	a1,10
    800059d8:	0009051b          	sext.w	a0,s2
    800059dc:	00001097          	auipc	ra,0x1
    800059e0:	c60080e7          	jalr	-928(ra) # 8000663c <_Z8printIntiii>
    800059e4:	00005517          	auipc	a0,0x5
    800059e8:	c7450513          	addi	a0,a0,-908 # 8000a658 <CONSOLE_STATUS+0x648>
    800059ec:	00001097          	auipc	ra,0x1
    800059f0:	aa0080e7          	jalr	-1376(ra) # 8000648c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800059f4:	00000493          	li	s1,0
    800059f8:	f99ff06f          	j	80005990 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    800059fc:	00005517          	auipc	a0,0x5
    80005a00:	a1c50513          	addi	a0,a0,-1508 # 8000a418 <CONSOLE_STATUS+0x408>
    80005a04:	00001097          	auipc	ra,0x1
    80005a08:	a88080e7          	jalr	-1400(ra) # 8000648c <_Z11printStringPKc>
    finishedB = true;
    80005a0c:	00100793          	li	a5,1
    80005a10:	00008717          	auipc	a4,0x8
    80005a14:	90f70123          	sb	a5,-1790(a4) # 8000d312 <_ZL9finishedB>
    thread_dispatch();
    80005a18:	ffffc097          	auipc	ra,0xffffc
    80005a1c:	aa8080e7          	jalr	-1368(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80005a20:	01813083          	ld	ra,24(sp)
    80005a24:	01013403          	ld	s0,16(sp)
    80005a28:	00813483          	ld	s1,8(sp)
    80005a2c:	00013903          	ld	s2,0(sp)
    80005a30:	02010113          	addi	sp,sp,32
    80005a34:	00008067          	ret

0000000080005a38 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005a38:	fe010113          	addi	sp,sp,-32
    80005a3c:	00113c23          	sd	ra,24(sp)
    80005a40:	00813823          	sd	s0,16(sp)
    80005a44:	00913423          	sd	s1,8(sp)
    80005a48:	01213023          	sd	s2,0(sp)
    80005a4c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005a50:	00000913          	li	s2,0
    80005a54:	0380006f          	j	80005a8c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005a58:	ffffc097          	auipc	ra,0xffffc
    80005a5c:	a68080e7          	jalr	-1432(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005a60:	00148493          	addi	s1,s1,1
    80005a64:	000027b7          	lui	a5,0x2
    80005a68:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005a6c:	0097ee63          	bltu	a5,s1,80005a88 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005a70:	00000713          	li	a4,0
    80005a74:	000077b7          	lui	a5,0x7
    80005a78:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005a7c:	fce7eee3          	bltu	a5,a4,80005a58 <_ZL11workerBodyAPv+0x20>
    80005a80:	00170713          	addi	a4,a4,1
    80005a84:	ff1ff06f          	j	80005a74 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005a88:	00190913          	addi	s2,s2,1
    80005a8c:	00900793          	li	a5,9
    80005a90:	0527e063          	bltu	a5,s2,80005ad0 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005a94:	00005517          	auipc	a0,0x5
    80005a98:	96450513          	addi	a0,a0,-1692 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    80005a9c:	00001097          	auipc	ra,0x1
    80005aa0:	9f0080e7          	jalr	-1552(ra) # 8000648c <_Z11printStringPKc>
    80005aa4:	00000613          	li	a2,0
    80005aa8:	00a00593          	li	a1,10
    80005aac:	0009051b          	sext.w	a0,s2
    80005ab0:	00001097          	auipc	ra,0x1
    80005ab4:	b8c080e7          	jalr	-1140(ra) # 8000663c <_Z8printIntiii>
    80005ab8:	00005517          	auipc	a0,0x5
    80005abc:	ba050513          	addi	a0,a0,-1120 # 8000a658 <CONSOLE_STATUS+0x648>
    80005ac0:	00001097          	auipc	ra,0x1
    80005ac4:	9cc080e7          	jalr	-1588(ra) # 8000648c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005ac8:	00000493          	li	s1,0
    80005acc:	f99ff06f          	j	80005a64 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005ad0:	00005517          	auipc	a0,0x5
    80005ad4:	93050513          	addi	a0,a0,-1744 # 8000a400 <CONSOLE_STATUS+0x3f0>
    80005ad8:	00001097          	auipc	ra,0x1
    80005adc:	9b4080e7          	jalr	-1612(ra) # 8000648c <_Z11printStringPKc>
    finishedA = true;
    80005ae0:	00100793          	li	a5,1
    80005ae4:	00008717          	auipc	a4,0x8
    80005ae8:	82f707a3          	sb	a5,-2001(a4) # 8000d313 <_ZL9finishedA>
}
    80005aec:	01813083          	ld	ra,24(sp)
    80005af0:	01013403          	ld	s0,16(sp)
    80005af4:	00813483          	ld	s1,8(sp)
    80005af8:	00013903          	ld	s2,0(sp)
    80005afc:	02010113          	addi	sp,sp,32
    80005b00:	00008067          	ret

0000000080005b04 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005b04:	fd010113          	addi	sp,sp,-48
    80005b08:	02113423          	sd	ra,40(sp)
    80005b0c:	02813023          	sd	s0,32(sp)
    80005b10:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005b14:	00000613          	li	a2,0
    80005b18:	00000597          	auipc	a1,0x0
    80005b1c:	f2058593          	addi	a1,a1,-224 # 80005a38 <_ZL11workerBodyAPv>
    80005b20:	fd040513          	addi	a0,s0,-48
    80005b24:	ffffc097          	auipc	ra,0xffffc
    80005b28:	8e0080e7          	jalr	-1824(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005b2c:	00005517          	auipc	a0,0x5
    80005b30:	97450513          	addi	a0,a0,-1676 # 8000a4a0 <CONSOLE_STATUS+0x490>
    80005b34:	00001097          	auipc	ra,0x1
    80005b38:	958080e7          	jalr	-1704(ra) # 8000648c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005b3c:	00000613          	li	a2,0
    80005b40:	00000597          	auipc	a1,0x0
    80005b44:	e2458593          	addi	a1,a1,-476 # 80005964 <_ZL11workerBodyBPv>
    80005b48:	fd840513          	addi	a0,s0,-40
    80005b4c:	ffffc097          	auipc	ra,0xffffc
    80005b50:	8b8080e7          	jalr	-1864(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005b54:	00005517          	auipc	a0,0x5
    80005b58:	96450513          	addi	a0,a0,-1692 # 8000a4b8 <CONSOLE_STATUS+0x4a8>
    80005b5c:	00001097          	auipc	ra,0x1
    80005b60:	930080e7          	jalr	-1744(ra) # 8000648c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005b64:	00000613          	li	a2,0
    80005b68:	00000597          	auipc	a1,0x0
    80005b6c:	c7c58593          	addi	a1,a1,-900 # 800057e4 <_ZL11workerBodyCPv>
    80005b70:	fe040513          	addi	a0,s0,-32
    80005b74:	ffffc097          	auipc	ra,0xffffc
    80005b78:	890080e7          	jalr	-1904(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005b7c:	00005517          	auipc	a0,0x5
    80005b80:	95450513          	addi	a0,a0,-1708 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80005b84:	00001097          	auipc	ra,0x1
    80005b88:	908080e7          	jalr	-1784(ra) # 8000648c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005b8c:	00000613          	li	a2,0
    80005b90:	00000597          	auipc	a1,0x0
    80005b94:	b0c58593          	addi	a1,a1,-1268 # 8000569c <_ZL11workerBodyDPv>
    80005b98:	fe840513          	addi	a0,s0,-24
    80005b9c:	ffffc097          	auipc	ra,0xffffc
    80005ba0:	868080e7          	jalr	-1944(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005ba4:	00005517          	auipc	a0,0x5
    80005ba8:	94450513          	addi	a0,a0,-1724 # 8000a4e8 <CONSOLE_STATUS+0x4d8>
    80005bac:	00001097          	auipc	ra,0x1
    80005bb0:	8e0080e7          	jalr	-1824(ra) # 8000648c <_Z11printStringPKc>
    80005bb4:	00c0006f          	j	80005bc0 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005bb8:	ffffc097          	auipc	ra,0xffffc
    80005bbc:	908080e7          	jalr	-1784(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005bc0:	00007797          	auipc	a5,0x7
    80005bc4:	7537c783          	lbu	a5,1875(a5) # 8000d313 <_ZL9finishedA>
    80005bc8:	fe0788e3          	beqz	a5,80005bb8 <_Z18Threads_C_API_testv+0xb4>
    80005bcc:	00007797          	auipc	a5,0x7
    80005bd0:	7467c783          	lbu	a5,1862(a5) # 8000d312 <_ZL9finishedB>
    80005bd4:	fe0782e3          	beqz	a5,80005bb8 <_Z18Threads_C_API_testv+0xb4>
    80005bd8:	00007797          	auipc	a5,0x7
    80005bdc:	7397c783          	lbu	a5,1849(a5) # 8000d311 <_ZL9finishedC>
    80005be0:	fc078ce3          	beqz	a5,80005bb8 <_Z18Threads_C_API_testv+0xb4>
    80005be4:	00007797          	auipc	a5,0x7
    80005be8:	72c7c783          	lbu	a5,1836(a5) # 8000d310 <_ZL9finishedD>
    80005bec:	fc0786e3          	beqz	a5,80005bb8 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80005bf0:	02813083          	ld	ra,40(sp)
    80005bf4:	02013403          	ld	s0,32(sp)
    80005bf8:	03010113          	addi	sp,sp,48
    80005bfc:	00008067          	ret

0000000080005c00 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80005c00:	fd010113          	addi	sp,sp,-48
    80005c04:	02113423          	sd	ra,40(sp)
    80005c08:	02813023          	sd	s0,32(sp)
    80005c0c:	00913c23          	sd	s1,24(sp)
    80005c10:	01213823          	sd	s2,16(sp)
    80005c14:	01313423          	sd	s3,8(sp)
    80005c18:	03010413          	addi	s0,sp,48
    80005c1c:	00050993          	mv	s3,a0
    80005c20:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005c24:	00000913          	li	s2,0
    80005c28:	00c0006f          	j	80005c34 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005c2c:	ffffe097          	auipc	ra,0xffffe
    80005c30:	81c080e7          	jalr	-2020(ra) # 80003448 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005c34:	ffffc097          	auipc	ra,0xffffc
    80005c38:	9cc080e7          	jalr	-1588(ra) # 80001600 <_Z4getcv>
    80005c3c:	0005059b          	sext.w	a1,a0
    80005c40:	01b00793          	li	a5,27
    80005c44:	02f58a63          	beq	a1,a5,80005c78 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005c48:	0084b503          	ld	a0,8(s1)
    80005c4c:	00001097          	auipc	ra,0x1
    80005c50:	c64080e7          	jalr	-924(ra) # 800068b0 <_ZN9BufferCPP3putEi>
        i++;
    80005c54:	0019071b          	addiw	a4,s2,1
    80005c58:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005c5c:	0004a683          	lw	a3,0(s1)
    80005c60:	0026979b          	slliw	a5,a3,0x2
    80005c64:	00d787bb          	addw	a5,a5,a3
    80005c68:	0017979b          	slliw	a5,a5,0x1
    80005c6c:	02f767bb          	remw	a5,a4,a5
    80005c70:	fc0792e3          	bnez	a5,80005c34 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80005c74:	fb9ff06f          	j	80005c2c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005c78:	00100793          	li	a5,1
    80005c7c:	00007717          	auipc	a4,0x7
    80005c80:	68f72e23          	sw	a5,1692(a4) # 8000d318 <_ZL9threadEnd>
    td->buffer->put('!');
    80005c84:	0209b783          	ld	a5,32(s3)
    80005c88:	02100593          	li	a1,33
    80005c8c:	0087b503          	ld	a0,8(a5)
    80005c90:	00001097          	auipc	ra,0x1
    80005c94:	c20080e7          	jalr	-992(ra) # 800068b0 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005c98:	0104b503          	ld	a0,16(s1)
    80005c9c:	ffffe097          	auipc	ra,0xffffe
    80005ca0:	948080e7          	jalr	-1720(ra) # 800035e4 <_ZN9Semaphore6signalEv>
}
    80005ca4:	02813083          	ld	ra,40(sp)
    80005ca8:	02013403          	ld	s0,32(sp)
    80005cac:	01813483          	ld	s1,24(sp)
    80005cb0:	01013903          	ld	s2,16(sp)
    80005cb4:	00813983          	ld	s3,8(sp)
    80005cb8:	03010113          	addi	sp,sp,48
    80005cbc:	00008067          	ret

0000000080005cc0 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80005cc0:	fe010113          	addi	sp,sp,-32
    80005cc4:	00113c23          	sd	ra,24(sp)
    80005cc8:	00813823          	sd	s0,16(sp)
    80005ccc:	00913423          	sd	s1,8(sp)
    80005cd0:	01213023          	sd	s2,0(sp)
    80005cd4:	02010413          	addi	s0,sp,32
    80005cd8:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005cdc:	00000913          	li	s2,0
    80005ce0:	00c0006f          	j	80005cec <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005ce4:	ffffd097          	auipc	ra,0xffffd
    80005ce8:	764080e7          	jalr	1892(ra) # 80003448 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005cec:	00007797          	auipc	a5,0x7
    80005cf0:	62c7a783          	lw	a5,1580(a5) # 8000d318 <_ZL9threadEnd>
    80005cf4:	02079e63          	bnez	a5,80005d30 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005cf8:	0004a583          	lw	a1,0(s1)
    80005cfc:	0305859b          	addiw	a1,a1,48
    80005d00:	0084b503          	ld	a0,8(s1)
    80005d04:	00001097          	auipc	ra,0x1
    80005d08:	bac080e7          	jalr	-1108(ra) # 800068b0 <_ZN9BufferCPP3putEi>
        i++;
    80005d0c:	0019071b          	addiw	a4,s2,1
    80005d10:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005d14:	0004a683          	lw	a3,0(s1)
    80005d18:	0026979b          	slliw	a5,a3,0x2
    80005d1c:	00d787bb          	addw	a5,a5,a3
    80005d20:	0017979b          	slliw	a5,a5,0x1
    80005d24:	02f767bb          	remw	a5,a4,a5
    80005d28:	fc0792e3          	bnez	a5,80005cec <_ZN12ProducerSync8producerEPv+0x2c>
    80005d2c:	fb9ff06f          	j	80005ce4 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005d30:	0104b503          	ld	a0,16(s1)
    80005d34:	ffffe097          	auipc	ra,0xffffe
    80005d38:	8b0080e7          	jalr	-1872(ra) # 800035e4 <_ZN9Semaphore6signalEv>
}
    80005d3c:	01813083          	ld	ra,24(sp)
    80005d40:	01013403          	ld	s0,16(sp)
    80005d44:	00813483          	ld	s1,8(sp)
    80005d48:	00013903          	ld	s2,0(sp)
    80005d4c:	02010113          	addi	sp,sp,32
    80005d50:	00008067          	ret

0000000080005d54 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005d54:	fd010113          	addi	sp,sp,-48
    80005d58:	02113423          	sd	ra,40(sp)
    80005d5c:	02813023          	sd	s0,32(sp)
    80005d60:	00913c23          	sd	s1,24(sp)
    80005d64:	01213823          	sd	s2,16(sp)
    80005d68:	01313423          	sd	s3,8(sp)
    80005d6c:	01413023          	sd	s4,0(sp)
    80005d70:	03010413          	addi	s0,sp,48
    80005d74:	00050993          	mv	s3,a0
    80005d78:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005d7c:	00000a13          	li	s4,0
    80005d80:	01c0006f          	j	80005d9c <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005d84:	ffffd097          	auipc	ra,0xffffd
    80005d88:	6c4080e7          	jalr	1732(ra) # 80003448 <_ZN6Thread8dispatchEv>
    80005d8c:	0500006f          	j	80005ddc <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005d90:	00a00513          	li	a0,10
    80005d94:	ffffc097          	auipc	ra,0xffffc
    80005d98:	894080e7          	jalr	-1900(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    80005d9c:	00007797          	auipc	a5,0x7
    80005da0:	57c7a783          	lw	a5,1404(a5) # 8000d318 <_ZL9threadEnd>
    80005da4:	06079263          	bnez	a5,80005e08 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005da8:	00893503          	ld	a0,8(s2)
    80005dac:	00001097          	auipc	ra,0x1
    80005db0:	b94080e7          	jalr	-1132(ra) # 80006940 <_ZN9BufferCPP3getEv>
        i++;
    80005db4:	001a049b          	addiw	s1,s4,1
    80005db8:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005dbc:	0ff57513          	andi	a0,a0,255
    80005dc0:	ffffc097          	auipc	ra,0xffffc
    80005dc4:	868080e7          	jalr	-1944(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005dc8:	00092703          	lw	a4,0(s2)
    80005dcc:	0027179b          	slliw	a5,a4,0x2
    80005dd0:	00e787bb          	addw	a5,a5,a4
    80005dd4:	02f4e7bb          	remw	a5,s1,a5
    80005dd8:	fa0786e3          	beqz	a5,80005d84 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005ddc:	05000793          	li	a5,80
    80005de0:	02f4e4bb          	remw	s1,s1,a5
    80005de4:	fa049ce3          	bnez	s1,80005d9c <_ZN12ConsumerSync8consumerEPv+0x48>
    80005de8:	fa9ff06f          	j	80005d90 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005dec:	0209b783          	ld	a5,32(s3)
    80005df0:	0087b503          	ld	a0,8(a5)
    80005df4:	00001097          	auipc	ra,0x1
    80005df8:	b4c080e7          	jalr	-1204(ra) # 80006940 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005dfc:	0ff57513          	andi	a0,a0,255
    80005e00:	ffffe097          	auipc	ra,0xffffe
    80005e04:	8a8080e7          	jalr	-1880(ra) # 800036a8 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005e08:	0209b783          	ld	a5,32(s3)
    80005e0c:	0087b503          	ld	a0,8(a5)
    80005e10:	00001097          	auipc	ra,0x1
    80005e14:	bbc080e7          	jalr	-1092(ra) # 800069cc <_ZN9BufferCPP6getCntEv>
    80005e18:	fca04ae3          	bgtz	a0,80005dec <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005e1c:	01093503          	ld	a0,16(s2)
    80005e20:	ffffd097          	auipc	ra,0xffffd
    80005e24:	7c4080e7          	jalr	1988(ra) # 800035e4 <_ZN9Semaphore6signalEv>
}
    80005e28:	02813083          	ld	ra,40(sp)
    80005e2c:	02013403          	ld	s0,32(sp)
    80005e30:	01813483          	ld	s1,24(sp)
    80005e34:	01013903          	ld	s2,16(sp)
    80005e38:	00813983          	ld	s3,8(sp)
    80005e3c:	00013a03          	ld	s4,0(sp)
    80005e40:	03010113          	addi	sp,sp,48
    80005e44:	00008067          	ret

0000000080005e48 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005e48:	f8010113          	addi	sp,sp,-128
    80005e4c:	06113c23          	sd	ra,120(sp)
    80005e50:	06813823          	sd	s0,112(sp)
    80005e54:	06913423          	sd	s1,104(sp)
    80005e58:	07213023          	sd	s2,96(sp)
    80005e5c:	05313c23          	sd	s3,88(sp)
    80005e60:	05413823          	sd	s4,80(sp)
    80005e64:	05513423          	sd	s5,72(sp)
    80005e68:	05613023          	sd	s6,64(sp)
    80005e6c:	03713c23          	sd	s7,56(sp)
    80005e70:	03813823          	sd	s8,48(sp)
    80005e74:	03913423          	sd	s9,40(sp)
    80005e78:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005e7c:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005e80:	00004517          	auipc	a0,0x4
    80005e84:	49050513          	addi	a0,a0,1168 # 8000a310 <CONSOLE_STATUS+0x300>
    80005e88:	00000097          	auipc	ra,0x0
    80005e8c:	604080e7          	jalr	1540(ra) # 8000648c <_Z11printStringPKc>
    getString(input, 30);
    80005e90:	01e00593          	li	a1,30
    80005e94:	f8040493          	addi	s1,s0,-128
    80005e98:	00048513          	mv	a0,s1
    80005e9c:	00000097          	auipc	ra,0x0
    80005ea0:	678080e7          	jalr	1656(ra) # 80006514 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005ea4:	00048513          	mv	a0,s1
    80005ea8:	00000097          	auipc	ra,0x0
    80005eac:	744080e7          	jalr	1860(ra) # 800065ec <_Z11stringToIntPKc>
    80005eb0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005eb4:	00004517          	auipc	a0,0x4
    80005eb8:	47c50513          	addi	a0,a0,1148 # 8000a330 <CONSOLE_STATUS+0x320>
    80005ebc:	00000097          	auipc	ra,0x0
    80005ec0:	5d0080e7          	jalr	1488(ra) # 8000648c <_Z11printStringPKc>
    getString(input, 30);
    80005ec4:	01e00593          	li	a1,30
    80005ec8:	00048513          	mv	a0,s1
    80005ecc:	00000097          	auipc	ra,0x0
    80005ed0:	648080e7          	jalr	1608(ra) # 80006514 <_Z9getStringPci>
    n = stringToInt(input);
    80005ed4:	00048513          	mv	a0,s1
    80005ed8:	00000097          	auipc	ra,0x0
    80005edc:	714080e7          	jalr	1812(ra) # 800065ec <_Z11stringToIntPKc>
    80005ee0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005ee4:	00004517          	auipc	a0,0x4
    80005ee8:	46c50513          	addi	a0,a0,1132 # 8000a350 <CONSOLE_STATUS+0x340>
    80005eec:	00000097          	auipc	ra,0x0
    80005ef0:	5a0080e7          	jalr	1440(ra) # 8000648c <_Z11printStringPKc>
    80005ef4:	00000613          	li	a2,0
    80005ef8:	00a00593          	li	a1,10
    80005efc:	00090513          	mv	a0,s2
    80005f00:	00000097          	auipc	ra,0x0
    80005f04:	73c080e7          	jalr	1852(ra) # 8000663c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005f08:	00004517          	auipc	a0,0x4
    80005f0c:	46050513          	addi	a0,a0,1120 # 8000a368 <CONSOLE_STATUS+0x358>
    80005f10:	00000097          	auipc	ra,0x0
    80005f14:	57c080e7          	jalr	1404(ra) # 8000648c <_Z11printStringPKc>
    80005f18:	00000613          	li	a2,0
    80005f1c:	00a00593          	li	a1,10
    80005f20:	00048513          	mv	a0,s1
    80005f24:	00000097          	auipc	ra,0x0
    80005f28:	718080e7          	jalr	1816(ra) # 8000663c <_Z8printIntiii>
    printString(".\n");
    80005f2c:	00004517          	auipc	a0,0x4
    80005f30:	45450513          	addi	a0,a0,1108 # 8000a380 <CONSOLE_STATUS+0x370>
    80005f34:	00000097          	auipc	ra,0x0
    80005f38:	558080e7          	jalr	1368(ra) # 8000648c <_Z11printStringPKc>
    if(threadNum > n) {
    80005f3c:	0324c463          	blt	s1,s2,80005f64 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005f40:	03205c63          	blez	s2,80005f78 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005f44:	03800513          	li	a0,56
    80005f48:	ffffd097          	auipc	ra,0xffffd
    80005f4c:	2cc080e7          	jalr	716(ra) # 80003214 <_Znwm>
    80005f50:	00050a93          	mv	s5,a0
    80005f54:	00048593          	mv	a1,s1
    80005f58:	00001097          	auipc	ra,0x1
    80005f5c:	804080e7          	jalr	-2044(ra) # 8000675c <_ZN9BufferCPPC1Ei>
    80005f60:	0300006f          	j	80005f90 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005f64:	00004517          	auipc	a0,0x4
    80005f68:	42450513          	addi	a0,a0,1060 # 8000a388 <CONSOLE_STATUS+0x378>
    80005f6c:	00000097          	auipc	ra,0x0
    80005f70:	520080e7          	jalr	1312(ra) # 8000648c <_Z11printStringPKc>
        return;
    80005f74:	0140006f          	j	80005f88 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005f78:	00004517          	auipc	a0,0x4
    80005f7c:	45050513          	addi	a0,a0,1104 # 8000a3c8 <CONSOLE_STATUS+0x3b8>
    80005f80:	00000097          	auipc	ra,0x0
    80005f84:	50c080e7          	jalr	1292(ra) # 8000648c <_Z11printStringPKc>
        return;
    80005f88:	000b8113          	mv	sp,s7
    80005f8c:	2380006f          	j	800061c4 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005f90:	01000513          	li	a0,16
    80005f94:	ffffd097          	auipc	ra,0xffffd
    80005f98:	280080e7          	jalr	640(ra) # 80003214 <_Znwm>
    80005f9c:	00050493          	mv	s1,a0
    80005fa0:	00000593          	li	a1,0
    80005fa4:	ffffd097          	auipc	ra,0xffffd
    80005fa8:	5dc080e7          	jalr	1500(ra) # 80003580 <_ZN9SemaphoreC1Ej>
    80005fac:	00007797          	auipc	a5,0x7
    80005fb0:	3697ba23          	sd	s1,884(a5) # 8000d320 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005fb4:	00391793          	slli	a5,s2,0x3
    80005fb8:	00f78793          	addi	a5,a5,15
    80005fbc:	ff07f793          	andi	a5,a5,-16
    80005fc0:	40f10133          	sub	sp,sp,a5
    80005fc4:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005fc8:	0019071b          	addiw	a4,s2,1
    80005fcc:	00171793          	slli	a5,a4,0x1
    80005fd0:	00e787b3          	add	a5,a5,a4
    80005fd4:	00379793          	slli	a5,a5,0x3
    80005fd8:	00f78793          	addi	a5,a5,15
    80005fdc:	ff07f793          	andi	a5,a5,-16
    80005fe0:	40f10133          	sub	sp,sp,a5
    80005fe4:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005fe8:	00191c13          	slli	s8,s2,0x1
    80005fec:	012c07b3          	add	a5,s8,s2
    80005ff0:	00379793          	slli	a5,a5,0x3
    80005ff4:	00fa07b3          	add	a5,s4,a5
    80005ff8:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005ffc:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80006000:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80006004:	02800513          	li	a0,40
    80006008:	ffffd097          	auipc	ra,0xffffd
    8000600c:	20c080e7          	jalr	524(ra) # 80003214 <_Znwm>
    80006010:	00050b13          	mv	s6,a0
    80006014:	012c0c33          	add	s8,s8,s2
    80006018:	003c1c13          	slli	s8,s8,0x3
    8000601c:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80006020:	ffffd097          	auipc	ra,0xffffd
    80006024:	4e4080e7          	jalr	1252(ra) # 80003504 <_ZN6ThreadC1Ev>
    80006028:	00007797          	auipc	a5,0x7
    8000602c:	07078793          	addi	a5,a5,112 # 8000d098 <_ZTV12ConsumerSync+0x10>
    80006030:	00fb3023          	sd	a5,0(s6)
    80006034:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80006038:	000b0513          	mv	a0,s6
    8000603c:	ffffd097          	auipc	ra,0xffffd
    80006040:	390080e7          	jalr	912(ra) # 800033cc <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80006044:	00000493          	li	s1,0
    80006048:	0380006f          	j	80006080 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    8000604c:	00007797          	auipc	a5,0x7
    80006050:	02478793          	addi	a5,a5,36 # 8000d070 <_ZTV12ProducerSync+0x10>
    80006054:	00fcb023          	sd	a5,0(s9)
    80006058:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    8000605c:	00349793          	slli	a5,s1,0x3
    80006060:	00f987b3          	add	a5,s3,a5
    80006064:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80006068:	00349793          	slli	a5,s1,0x3
    8000606c:	00f987b3          	add	a5,s3,a5
    80006070:	0007b503          	ld	a0,0(a5)
    80006074:	ffffd097          	auipc	ra,0xffffd
    80006078:	358080e7          	jalr	856(ra) # 800033cc <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000607c:	0014849b          	addiw	s1,s1,1
    80006080:	0b24d063          	bge	s1,s2,80006120 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80006084:	00149793          	slli	a5,s1,0x1
    80006088:	009787b3          	add	a5,a5,s1
    8000608c:	00379793          	slli	a5,a5,0x3
    80006090:	00fa07b3          	add	a5,s4,a5
    80006094:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80006098:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    8000609c:	00007717          	auipc	a4,0x7
    800060a0:	28473703          	ld	a4,644(a4) # 8000d320 <_ZL10waitForAll>
    800060a4:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800060a8:	02905863          	blez	s1,800060d8 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800060ac:	02800513          	li	a0,40
    800060b0:	ffffd097          	auipc	ra,0xffffd
    800060b4:	164080e7          	jalr	356(ra) # 80003214 <_Znwm>
    800060b8:	00050c93          	mv	s9,a0
    800060bc:	00149c13          	slli	s8,s1,0x1
    800060c0:	009c0c33          	add	s8,s8,s1
    800060c4:	003c1c13          	slli	s8,s8,0x3
    800060c8:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800060cc:	ffffd097          	auipc	ra,0xffffd
    800060d0:	438080e7          	jalr	1080(ra) # 80003504 <_ZN6ThreadC1Ev>
    800060d4:	f79ff06f          	j	8000604c <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800060d8:	02800513          	li	a0,40
    800060dc:	ffffd097          	auipc	ra,0xffffd
    800060e0:	138080e7          	jalr	312(ra) # 80003214 <_Znwm>
    800060e4:	00050c93          	mv	s9,a0
    800060e8:	00149c13          	slli	s8,s1,0x1
    800060ec:	009c0c33          	add	s8,s8,s1
    800060f0:	003c1c13          	slli	s8,s8,0x3
    800060f4:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    800060f8:	ffffd097          	auipc	ra,0xffffd
    800060fc:	40c080e7          	jalr	1036(ra) # 80003504 <_ZN6ThreadC1Ev>
    80006100:	00007797          	auipc	a5,0x7
    80006104:	f4878793          	addi	a5,a5,-184 # 8000d048 <_ZTV16ProducerKeyboard+0x10>
    80006108:	00fcb023          	sd	a5,0(s9)
    8000610c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80006110:	00349793          	slli	a5,s1,0x3
    80006114:	00f987b3          	add	a5,s3,a5
    80006118:	0197b023          	sd	s9,0(a5)
    8000611c:	f4dff06f          	j	80006068 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80006120:	ffffd097          	auipc	ra,0xffffd
    80006124:	328080e7          	jalr	808(ra) # 80003448 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80006128:	00000493          	li	s1,0
    8000612c:	00994e63          	blt	s2,s1,80006148 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80006130:	00007517          	auipc	a0,0x7
    80006134:	1f053503          	ld	a0,496(a0) # 8000d320 <_ZL10waitForAll>
    80006138:	ffffd097          	auipc	ra,0xffffd
    8000613c:	480080e7          	jalr	1152(ra) # 800035b8 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80006140:	0014849b          	addiw	s1,s1,1
    80006144:	fe9ff06f          	j	8000612c <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80006148:	00000493          	li	s1,0
    8000614c:	0080006f          	j	80006154 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80006150:	0014849b          	addiw	s1,s1,1
    80006154:	0324d263          	bge	s1,s2,80006178 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80006158:	00349793          	slli	a5,s1,0x3
    8000615c:	00f987b3          	add	a5,s3,a5
    80006160:	0007b503          	ld	a0,0(a5)
    80006164:	fe0506e3          	beqz	a0,80006150 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80006168:	00053783          	ld	a5,0(a0)
    8000616c:	0087b783          	ld	a5,8(a5)
    80006170:	000780e7          	jalr	a5
    80006174:	fddff06f          	j	80006150 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80006178:	000b0a63          	beqz	s6,8000618c <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    8000617c:	000b3783          	ld	a5,0(s6)
    80006180:	0087b783          	ld	a5,8(a5)
    80006184:	000b0513          	mv	a0,s6
    80006188:	000780e7          	jalr	a5
    delete waitForAll;
    8000618c:	00007517          	auipc	a0,0x7
    80006190:	19453503          	ld	a0,404(a0) # 8000d320 <_ZL10waitForAll>
    80006194:	00050863          	beqz	a0,800061a4 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80006198:	00053783          	ld	a5,0(a0)
    8000619c:	0087b783          	ld	a5,8(a5)
    800061a0:	000780e7          	jalr	a5
    delete buffer;
    800061a4:	000a8e63          	beqz	s5,800061c0 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800061a8:	000a8513          	mv	a0,s5
    800061ac:	00001097          	auipc	ra,0x1
    800061b0:	8a8080e7          	jalr	-1880(ra) # 80006a54 <_ZN9BufferCPPD1Ev>
    800061b4:	000a8513          	mv	a0,s5
    800061b8:	ffffd097          	auipc	ra,0xffffd
    800061bc:	0ac080e7          	jalr	172(ra) # 80003264 <_ZdlPv>
    800061c0:	000b8113          	mv	sp,s7

}
    800061c4:	f8040113          	addi	sp,s0,-128
    800061c8:	07813083          	ld	ra,120(sp)
    800061cc:	07013403          	ld	s0,112(sp)
    800061d0:	06813483          	ld	s1,104(sp)
    800061d4:	06013903          	ld	s2,96(sp)
    800061d8:	05813983          	ld	s3,88(sp)
    800061dc:	05013a03          	ld	s4,80(sp)
    800061e0:	04813a83          	ld	s5,72(sp)
    800061e4:	04013b03          	ld	s6,64(sp)
    800061e8:	03813b83          	ld	s7,56(sp)
    800061ec:	03013c03          	ld	s8,48(sp)
    800061f0:	02813c83          	ld	s9,40(sp)
    800061f4:	08010113          	addi	sp,sp,128
    800061f8:	00008067          	ret
    800061fc:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80006200:	000a8513          	mv	a0,s5
    80006204:	ffffd097          	auipc	ra,0xffffd
    80006208:	060080e7          	jalr	96(ra) # 80003264 <_ZdlPv>
    8000620c:	00048513          	mv	a0,s1
    80006210:	00008097          	auipc	ra,0x8
    80006214:	208080e7          	jalr	520(ra) # 8000e418 <_Unwind_Resume>
    80006218:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    8000621c:	00048513          	mv	a0,s1
    80006220:	ffffd097          	auipc	ra,0xffffd
    80006224:	044080e7          	jalr	68(ra) # 80003264 <_ZdlPv>
    80006228:	00090513          	mv	a0,s2
    8000622c:	00008097          	auipc	ra,0x8
    80006230:	1ec080e7          	jalr	492(ra) # 8000e418 <_Unwind_Resume>
    80006234:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80006238:	000b0513          	mv	a0,s6
    8000623c:	ffffd097          	auipc	ra,0xffffd
    80006240:	028080e7          	jalr	40(ra) # 80003264 <_ZdlPv>
    80006244:	00048513          	mv	a0,s1
    80006248:	00008097          	auipc	ra,0x8
    8000624c:	1d0080e7          	jalr	464(ra) # 8000e418 <_Unwind_Resume>
    80006250:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80006254:	000c8513          	mv	a0,s9
    80006258:	ffffd097          	auipc	ra,0xffffd
    8000625c:	00c080e7          	jalr	12(ra) # 80003264 <_ZdlPv>
    80006260:	00048513          	mv	a0,s1
    80006264:	00008097          	auipc	ra,0x8
    80006268:	1b4080e7          	jalr	436(ra) # 8000e418 <_Unwind_Resume>
    8000626c:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80006270:	000c8513          	mv	a0,s9
    80006274:	ffffd097          	auipc	ra,0xffffd
    80006278:	ff0080e7          	jalr	-16(ra) # 80003264 <_ZdlPv>
    8000627c:	00048513          	mv	a0,s1
    80006280:	00008097          	auipc	ra,0x8
    80006284:	198080e7          	jalr	408(ra) # 8000e418 <_Unwind_Resume>

0000000080006288 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80006288:	ff010113          	addi	sp,sp,-16
    8000628c:	00113423          	sd	ra,8(sp)
    80006290:	00813023          	sd	s0,0(sp)
    80006294:	01010413          	addi	s0,sp,16
    80006298:	00007797          	auipc	a5,0x7
    8000629c:	e0078793          	addi	a5,a5,-512 # 8000d098 <_ZTV12ConsumerSync+0x10>
    800062a0:	00f53023          	sd	a5,0(a0)
    800062a4:	ffffd097          	auipc	ra,0xffffd
    800062a8:	ebc080e7          	jalr	-324(ra) # 80003160 <_ZN6ThreadD1Ev>
    800062ac:	00813083          	ld	ra,8(sp)
    800062b0:	00013403          	ld	s0,0(sp)
    800062b4:	01010113          	addi	sp,sp,16
    800062b8:	00008067          	ret

00000000800062bc <_ZN12ConsumerSyncD0Ev>:
    800062bc:	fe010113          	addi	sp,sp,-32
    800062c0:	00113c23          	sd	ra,24(sp)
    800062c4:	00813823          	sd	s0,16(sp)
    800062c8:	00913423          	sd	s1,8(sp)
    800062cc:	02010413          	addi	s0,sp,32
    800062d0:	00050493          	mv	s1,a0
    800062d4:	00007797          	auipc	a5,0x7
    800062d8:	dc478793          	addi	a5,a5,-572 # 8000d098 <_ZTV12ConsumerSync+0x10>
    800062dc:	00f53023          	sd	a5,0(a0)
    800062e0:	ffffd097          	auipc	ra,0xffffd
    800062e4:	e80080e7          	jalr	-384(ra) # 80003160 <_ZN6ThreadD1Ev>
    800062e8:	00048513          	mv	a0,s1
    800062ec:	ffffd097          	auipc	ra,0xffffd
    800062f0:	f78080e7          	jalr	-136(ra) # 80003264 <_ZdlPv>
    800062f4:	01813083          	ld	ra,24(sp)
    800062f8:	01013403          	ld	s0,16(sp)
    800062fc:	00813483          	ld	s1,8(sp)
    80006300:	02010113          	addi	sp,sp,32
    80006304:	00008067          	ret

0000000080006308 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80006308:	ff010113          	addi	sp,sp,-16
    8000630c:	00113423          	sd	ra,8(sp)
    80006310:	00813023          	sd	s0,0(sp)
    80006314:	01010413          	addi	s0,sp,16
    80006318:	00007797          	auipc	a5,0x7
    8000631c:	d5878793          	addi	a5,a5,-680 # 8000d070 <_ZTV12ProducerSync+0x10>
    80006320:	00f53023          	sd	a5,0(a0)
    80006324:	ffffd097          	auipc	ra,0xffffd
    80006328:	e3c080e7          	jalr	-452(ra) # 80003160 <_ZN6ThreadD1Ev>
    8000632c:	00813083          	ld	ra,8(sp)
    80006330:	00013403          	ld	s0,0(sp)
    80006334:	01010113          	addi	sp,sp,16
    80006338:	00008067          	ret

000000008000633c <_ZN12ProducerSyncD0Ev>:
    8000633c:	fe010113          	addi	sp,sp,-32
    80006340:	00113c23          	sd	ra,24(sp)
    80006344:	00813823          	sd	s0,16(sp)
    80006348:	00913423          	sd	s1,8(sp)
    8000634c:	02010413          	addi	s0,sp,32
    80006350:	00050493          	mv	s1,a0
    80006354:	00007797          	auipc	a5,0x7
    80006358:	d1c78793          	addi	a5,a5,-740 # 8000d070 <_ZTV12ProducerSync+0x10>
    8000635c:	00f53023          	sd	a5,0(a0)
    80006360:	ffffd097          	auipc	ra,0xffffd
    80006364:	e00080e7          	jalr	-512(ra) # 80003160 <_ZN6ThreadD1Ev>
    80006368:	00048513          	mv	a0,s1
    8000636c:	ffffd097          	auipc	ra,0xffffd
    80006370:	ef8080e7          	jalr	-264(ra) # 80003264 <_ZdlPv>
    80006374:	01813083          	ld	ra,24(sp)
    80006378:	01013403          	ld	s0,16(sp)
    8000637c:	00813483          	ld	s1,8(sp)
    80006380:	02010113          	addi	sp,sp,32
    80006384:	00008067          	ret

0000000080006388 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80006388:	ff010113          	addi	sp,sp,-16
    8000638c:	00113423          	sd	ra,8(sp)
    80006390:	00813023          	sd	s0,0(sp)
    80006394:	01010413          	addi	s0,sp,16
    80006398:	00007797          	auipc	a5,0x7
    8000639c:	cb078793          	addi	a5,a5,-848 # 8000d048 <_ZTV16ProducerKeyboard+0x10>
    800063a0:	00f53023          	sd	a5,0(a0)
    800063a4:	ffffd097          	auipc	ra,0xffffd
    800063a8:	dbc080e7          	jalr	-580(ra) # 80003160 <_ZN6ThreadD1Ev>
    800063ac:	00813083          	ld	ra,8(sp)
    800063b0:	00013403          	ld	s0,0(sp)
    800063b4:	01010113          	addi	sp,sp,16
    800063b8:	00008067          	ret

00000000800063bc <_ZN16ProducerKeyboardD0Ev>:
    800063bc:	fe010113          	addi	sp,sp,-32
    800063c0:	00113c23          	sd	ra,24(sp)
    800063c4:	00813823          	sd	s0,16(sp)
    800063c8:	00913423          	sd	s1,8(sp)
    800063cc:	02010413          	addi	s0,sp,32
    800063d0:	00050493          	mv	s1,a0
    800063d4:	00007797          	auipc	a5,0x7
    800063d8:	c7478793          	addi	a5,a5,-908 # 8000d048 <_ZTV16ProducerKeyboard+0x10>
    800063dc:	00f53023          	sd	a5,0(a0)
    800063e0:	ffffd097          	auipc	ra,0xffffd
    800063e4:	d80080e7          	jalr	-640(ra) # 80003160 <_ZN6ThreadD1Ev>
    800063e8:	00048513          	mv	a0,s1
    800063ec:	ffffd097          	auipc	ra,0xffffd
    800063f0:	e78080e7          	jalr	-392(ra) # 80003264 <_ZdlPv>
    800063f4:	01813083          	ld	ra,24(sp)
    800063f8:	01013403          	ld	s0,16(sp)
    800063fc:	00813483          	ld	s1,8(sp)
    80006400:	02010113          	addi	sp,sp,32
    80006404:	00008067          	ret

0000000080006408 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80006408:	ff010113          	addi	sp,sp,-16
    8000640c:	00113423          	sd	ra,8(sp)
    80006410:	00813023          	sd	s0,0(sp)
    80006414:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80006418:	02053583          	ld	a1,32(a0)
    8000641c:	fffff097          	auipc	ra,0xfffff
    80006420:	7e4080e7          	jalr	2020(ra) # 80005c00 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80006424:	00813083          	ld	ra,8(sp)
    80006428:	00013403          	ld	s0,0(sp)
    8000642c:	01010113          	addi	sp,sp,16
    80006430:	00008067          	ret

0000000080006434 <_ZN12ProducerSync3runEv>:
    void run() override {
    80006434:	ff010113          	addi	sp,sp,-16
    80006438:	00113423          	sd	ra,8(sp)
    8000643c:	00813023          	sd	s0,0(sp)
    80006440:	01010413          	addi	s0,sp,16
        producer(td);
    80006444:	02053583          	ld	a1,32(a0)
    80006448:	00000097          	auipc	ra,0x0
    8000644c:	878080e7          	jalr	-1928(ra) # 80005cc0 <_ZN12ProducerSync8producerEPv>
    }
    80006450:	00813083          	ld	ra,8(sp)
    80006454:	00013403          	ld	s0,0(sp)
    80006458:	01010113          	addi	sp,sp,16
    8000645c:	00008067          	ret

0000000080006460 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80006460:	ff010113          	addi	sp,sp,-16
    80006464:	00113423          	sd	ra,8(sp)
    80006468:	00813023          	sd	s0,0(sp)
    8000646c:	01010413          	addi	s0,sp,16
        consumer(td);
    80006470:	02053583          	ld	a1,32(a0)
    80006474:	00000097          	auipc	ra,0x0
    80006478:	8e0080e7          	jalr	-1824(ra) # 80005d54 <_ZN12ConsumerSync8consumerEPv>
    }
    8000647c:	00813083          	ld	ra,8(sp)
    80006480:	00013403          	ld	s0,0(sp)
    80006484:	01010113          	addi	sp,sp,16
    80006488:	00008067          	ret

000000008000648c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    8000648c:	fe010113          	addi	sp,sp,-32
    80006490:	00113c23          	sd	ra,24(sp)
    80006494:	00813823          	sd	s0,16(sp)
    80006498:	00913423          	sd	s1,8(sp)
    8000649c:	02010413          	addi	s0,sp,32
    800064a0:	00050493          	mv	s1,a0
    LOCK();
    800064a4:	00100613          	li	a2,1
    800064a8:	00000593          	li	a1,0
    800064ac:	00007517          	auipc	a0,0x7
    800064b0:	e7c50513          	addi	a0,a0,-388 # 8000d328 <lockPrint>
    800064b4:	ffffb097          	auipc	ra,0xffffb
    800064b8:	c70080e7          	jalr	-912(ra) # 80001124 <copy_and_swap>
    800064bc:	00050863          	beqz	a0,800064cc <_Z11printStringPKc+0x40>
    800064c0:	ffffb097          	auipc	ra,0xffffb
    800064c4:	000080e7          	jalr	ra # 800014c0 <_Z15thread_dispatchv>
    800064c8:	fddff06f          	j	800064a4 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800064cc:	0004c503          	lbu	a0,0(s1)
    800064d0:	00050a63          	beqz	a0,800064e4 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    800064d4:	ffffb097          	auipc	ra,0xffffb
    800064d8:	154080e7          	jalr	340(ra) # 80001628 <_Z4putcc>
        string++;
    800064dc:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800064e0:	fedff06f          	j	800064cc <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800064e4:	00000613          	li	a2,0
    800064e8:	00100593          	li	a1,1
    800064ec:	00007517          	auipc	a0,0x7
    800064f0:	e3c50513          	addi	a0,a0,-452 # 8000d328 <lockPrint>
    800064f4:	ffffb097          	auipc	ra,0xffffb
    800064f8:	c30080e7          	jalr	-976(ra) # 80001124 <copy_and_swap>
    800064fc:	fe0514e3          	bnez	a0,800064e4 <_Z11printStringPKc+0x58>
}
    80006500:	01813083          	ld	ra,24(sp)
    80006504:	01013403          	ld	s0,16(sp)
    80006508:	00813483          	ld	s1,8(sp)
    8000650c:	02010113          	addi	sp,sp,32
    80006510:	00008067          	ret

0000000080006514 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80006514:	fd010113          	addi	sp,sp,-48
    80006518:	02113423          	sd	ra,40(sp)
    8000651c:	02813023          	sd	s0,32(sp)
    80006520:	00913c23          	sd	s1,24(sp)
    80006524:	01213823          	sd	s2,16(sp)
    80006528:	01313423          	sd	s3,8(sp)
    8000652c:	01413023          	sd	s4,0(sp)
    80006530:	03010413          	addi	s0,sp,48
    80006534:	00050993          	mv	s3,a0
    80006538:	00058a13          	mv	s4,a1
    LOCK();
    8000653c:	00100613          	li	a2,1
    80006540:	00000593          	li	a1,0
    80006544:	00007517          	auipc	a0,0x7
    80006548:	de450513          	addi	a0,a0,-540 # 8000d328 <lockPrint>
    8000654c:	ffffb097          	auipc	ra,0xffffb
    80006550:	bd8080e7          	jalr	-1064(ra) # 80001124 <copy_and_swap>
    80006554:	00050863          	beqz	a0,80006564 <_Z9getStringPci+0x50>
    80006558:	ffffb097          	auipc	ra,0xffffb
    8000655c:	f68080e7          	jalr	-152(ra) # 800014c0 <_Z15thread_dispatchv>
    80006560:	fddff06f          	j	8000653c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80006564:	00000913          	li	s2,0
    80006568:	00090493          	mv	s1,s2
    8000656c:	0019091b          	addiw	s2,s2,1
    80006570:	03495a63          	bge	s2,s4,800065a4 <_Z9getStringPci+0x90>
        cc = getc();
    80006574:	ffffb097          	auipc	ra,0xffffb
    80006578:	08c080e7          	jalr	140(ra) # 80001600 <_Z4getcv>
        if(cc < 1)
    8000657c:	02050463          	beqz	a0,800065a4 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80006580:	009984b3          	add	s1,s3,s1
    80006584:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80006588:	00a00793          	li	a5,10
    8000658c:	00f50a63          	beq	a0,a5,800065a0 <_Z9getStringPci+0x8c>
    80006590:	00d00793          	li	a5,13
    80006594:	fcf51ae3          	bne	a0,a5,80006568 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80006598:	00090493          	mv	s1,s2
    8000659c:	0080006f          	j	800065a4 <_Z9getStringPci+0x90>
    800065a0:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800065a4:	009984b3          	add	s1,s3,s1
    800065a8:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800065ac:	00000613          	li	a2,0
    800065b0:	00100593          	li	a1,1
    800065b4:	00007517          	auipc	a0,0x7
    800065b8:	d7450513          	addi	a0,a0,-652 # 8000d328 <lockPrint>
    800065bc:	ffffb097          	auipc	ra,0xffffb
    800065c0:	b68080e7          	jalr	-1176(ra) # 80001124 <copy_and_swap>
    800065c4:	fe0514e3          	bnez	a0,800065ac <_Z9getStringPci+0x98>
    return buf;
}
    800065c8:	00098513          	mv	a0,s3
    800065cc:	02813083          	ld	ra,40(sp)
    800065d0:	02013403          	ld	s0,32(sp)
    800065d4:	01813483          	ld	s1,24(sp)
    800065d8:	01013903          	ld	s2,16(sp)
    800065dc:	00813983          	ld	s3,8(sp)
    800065e0:	00013a03          	ld	s4,0(sp)
    800065e4:	03010113          	addi	sp,sp,48
    800065e8:	00008067          	ret

00000000800065ec <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800065ec:	ff010113          	addi	sp,sp,-16
    800065f0:	00813423          	sd	s0,8(sp)
    800065f4:	01010413          	addi	s0,sp,16
    800065f8:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800065fc:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80006600:	0006c603          	lbu	a2,0(a3)
    80006604:	fd06071b          	addiw	a4,a2,-48
    80006608:	0ff77713          	andi	a4,a4,255
    8000660c:	00900793          	li	a5,9
    80006610:	02e7e063          	bltu	a5,a4,80006630 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80006614:	0025179b          	slliw	a5,a0,0x2
    80006618:	00a787bb          	addw	a5,a5,a0
    8000661c:	0017979b          	slliw	a5,a5,0x1
    80006620:	00168693          	addi	a3,a3,1
    80006624:	00c787bb          	addw	a5,a5,a2
    80006628:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    8000662c:	fd5ff06f          	j	80006600 <_Z11stringToIntPKc+0x14>
    return n;
}
    80006630:	00813403          	ld	s0,8(sp)
    80006634:	01010113          	addi	sp,sp,16
    80006638:	00008067          	ret

000000008000663c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    8000663c:	fc010113          	addi	sp,sp,-64
    80006640:	02113c23          	sd	ra,56(sp)
    80006644:	02813823          	sd	s0,48(sp)
    80006648:	02913423          	sd	s1,40(sp)
    8000664c:	03213023          	sd	s2,32(sp)
    80006650:	01313c23          	sd	s3,24(sp)
    80006654:	04010413          	addi	s0,sp,64
    80006658:	00050493          	mv	s1,a0
    8000665c:	00058913          	mv	s2,a1
    80006660:	00060993          	mv	s3,a2
    LOCK();
    80006664:	00100613          	li	a2,1
    80006668:	00000593          	li	a1,0
    8000666c:	00007517          	auipc	a0,0x7
    80006670:	cbc50513          	addi	a0,a0,-836 # 8000d328 <lockPrint>
    80006674:	ffffb097          	auipc	ra,0xffffb
    80006678:	ab0080e7          	jalr	-1360(ra) # 80001124 <copy_and_swap>
    8000667c:	00050863          	beqz	a0,8000668c <_Z8printIntiii+0x50>
    80006680:	ffffb097          	auipc	ra,0xffffb
    80006684:	e40080e7          	jalr	-448(ra) # 800014c0 <_Z15thread_dispatchv>
    80006688:	fddff06f          	j	80006664 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    8000668c:	00098463          	beqz	s3,80006694 <_Z8printIntiii+0x58>
    80006690:	0804c463          	bltz	s1,80006718 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80006694:	0004851b          	sext.w	a0,s1
    neg = 0;
    80006698:	00000593          	li	a1,0
    }

    i = 0;
    8000669c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800066a0:	0009079b          	sext.w	a5,s2
    800066a4:	0325773b          	remuw	a4,a0,s2
    800066a8:	00048613          	mv	a2,s1
    800066ac:	0014849b          	addiw	s1,s1,1
    800066b0:	02071693          	slli	a3,a4,0x20
    800066b4:	0206d693          	srli	a3,a3,0x20
    800066b8:	00007717          	auipc	a4,0x7
    800066bc:	9f870713          	addi	a4,a4,-1544 # 8000d0b0 <digits>
    800066c0:	00d70733          	add	a4,a4,a3
    800066c4:	00074683          	lbu	a3,0(a4)
    800066c8:	fd040713          	addi	a4,s0,-48
    800066cc:	00c70733          	add	a4,a4,a2
    800066d0:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800066d4:	0005071b          	sext.w	a4,a0
    800066d8:	0325553b          	divuw	a0,a0,s2
    800066dc:	fcf772e3          	bgeu	a4,a5,800066a0 <_Z8printIntiii+0x64>
    if(neg)
    800066e0:	00058c63          	beqz	a1,800066f8 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    800066e4:	fd040793          	addi	a5,s0,-48
    800066e8:	009784b3          	add	s1,a5,s1
    800066ec:	02d00793          	li	a5,45
    800066f0:	fef48823          	sb	a5,-16(s1)
    800066f4:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800066f8:	fff4849b          	addiw	s1,s1,-1
    800066fc:	0204c463          	bltz	s1,80006724 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80006700:	fd040793          	addi	a5,s0,-48
    80006704:	009787b3          	add	a5,a5,s1
    80006708:	ff07c503          	lbu	a0,-16(a5)
    8000670c:	ffffb097          	auipc	ra,0xffffb
    80006710:	f1c080e7          	jalr	-228(ra) # 80001628 <_Z4putcc>
    80006714:	fe5ff06f          	j	800066f8 <_Z8printIntiii+0xbc>
        x = -xx;
    80006718:	4090053b          	negw	a0,s1
        neg = 1;
    8000671c:	00100593          	li	a1,1
        x = -xx;
    80006720:	f7dff06f          	j	8000669c <_Z8printIntiii+0x60>

    UNLOCK();
    80006724:	00000613          	li	a2,0
    80006728:	00100593          	li	a1,1
    8000672c:	00007517          	auipc	a0,0x7
    80006730:	bfc50513          	addi	a0,a0,-1028 # 8000d328 <lockPrint>
    80006734:	ffffb097          	auipc	ra,0xffffb
    80006738:	9f0080e7          	jalr	-1552(ra) # 80001124 <copy_and_swap>
    8000673c:	fe0514e3          	bnez	a0,80006724 <_Z8printIntiii+0xe8>
    80006740:	03813083          	ld	ra,56(sp)
    80006744:	03013403          	ld	s0,48(sp)
    80006748:	02813483          	ld	s1,40(sp)
    8000674c:	02013903          	ld	s2,32(sp)
    80006750:	01813983          	ld	s3,24(sp)
    80006754:	04010113          	addi	sp,sp,64
    80006758:	00008067          	ret

000000008000675c <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    8000675c:	fd010113          	addi	sp,sp,-48
    80006760:	02113423          	sd	ra,40(sp)
    80006764:	02813023          	sd	s0,32(sp)
    80006768:	00913c23          	sd	s1,24(sp)
    8000676c:	01213823          	sd	s2,16(sp)
    80006770:	01313423          	sd	s3,8(sp)
    80006774:	03010413          	addi	s0,sp,48
    80006778:	00050493          	mv	s1,a0
    8000677c:	00058913          	mv	s2,a1
    80006780:	0015879b          	addiw	a5,a1,1
    80006784:	0007851b          	sext.w	a0,a5
    80006788:	00f4a023          	sw	a5,0(s1)
    8000678c:	0004a823          	sw	zero,16(s1)
    80006790:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006794:	00251513          	slli	a0,a0,0x2
    80006798:	ffffb097          	auipc	ra,0xffffb
    8000679c:	bfc080e7          	jalr	-1028(ra) # 80001394 <_Z9mem_allocm>
    800067a0:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800067a4:	01000513          	li	a0,16
    800067a8:	ffffd097          	auipc	ra,0xffffd
    800067ac:	a6c080e7          	jalr	-1428(ra) # 80003214 <_Znwm>
    800067b0:	00050993          	mv	s3,a0
    800067b4:	00000593          	li	a1,0
    800067b8:	ffffd097          	auipc	ra,0xffffd
    800067bc:	dc8080e7          	jalr	-568(ra) # 80003580 <_ZN9SemaphoreC1Ej>
    800067c0:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800067c4:	01000513          	li	a0,16
    800067c8:	ffffd097          	auipc	ra,0xffffd
    800067cc:	a4c080e7          	jalr	-1460(ra) # 80003214 <_Znwm>
    800067d0:	00050993          	mv	s3,a0
    800067d4:	00090593          	mv	a1,s2
    800067d8:	ffffd097          	auipc	ra,0xffffd
    800067dc:	da8080e7          	jalr	-600(ra) # 80003580 <_ZN9SemaphoreC1Ej>
    800067e0:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800067e4:	01000513          	li	a0,16
    800067e8:	ffffd097          	auipc	ra,0xffffd
    800067ec:	a2c080e7          	jalr	-1492(ra) # 80003214 <_Znwm>
    800067f0:	00050913          	mv	s2,a0
    800067f4:	00100593          	li	a1,1
    800067f8:	ffffd097          	auipc	ra,0xffffd
    800067fc:	d88080e7          	jalr	-632(ra) # 80003580 <_ZN9SemaphoreC1Ej>
    80006800:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006804:	01000513          	li	a0,16
    80006808:	ffffd097          	auipc	ra,0xffffd
    8000680c:	a0c080e7          	jalr	-1524(ra) # 80003214 <_Znwm>
    80006810:	00050913          	mv	s2,a0
    80006814:	00100593          	li	a1,1
    80006818:	ffffd097          	auipc	ra,0xffffd
    8000681c:	d68080e7          	jalr	-664(ra) # 80003580 <_ZN9SemaphoreC1Ej>
    80006820:	0324b823          	sd	s2,48(s1)
}
    80006824:	02813083          	ld	ra,40(sp)
    80006828:	02013403          	ld	s0,32(sp)
    8000682c:	01813483          	ld	s1,24(sp)
    80006830:	01013903          	ld	s2,16(sp)
    80006834:	00813983          	ld	s3,8(sp)
    80006838:	03010113          	addi	sp,sp,48
    8000683c:	00008067          	ret
    80006840:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006844:	00098513          	mv	a0,s3
    80006848:	ffffd097          	auipc	ra,0xffffd
    8000684c:	a1c080e7          	jalr	-1508(ra) # 80003264 <_ZdlPv>
    80006850:	00048513          	mv	a0,s1
    80006854:	00008097          	auipc	ra,0x8
    80006858:	bc4080e7          	jalr	-1084(ra) # 8000e418 <_Unwind_Resume>
    8000685c:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006860:	00098513          	mv	a0,s3
    80006864:	ffffd097          	auipc	ra,0xffffd
    80006868:	a00080e7          	jalr	-1536(ra) # 80003264 <_ZdlPv>
    8000686c:	00048513          	mv	a0,s1
    80006870:	00008097          	auipc	ra,0x8
    80006874:	ba8080e7          	jalr	-1112(ra) # 8000e418 <_Unwind_Resume>
    80006878:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    8000687c:	00090513          	mv	a0,s2
    80006880:	ffffd097          	auipc	ra,0xffffd
    80006884:	9e4080e7          	jalr	-1564(ra) # 80003264 <_ZdlPv>
    80006888:	00048513          	mv	a0,s1
    8000688c:	00008097          	auipc	ra,0x8
    80006890:	b8c080e7          	jalr	-1140(ra) # 8000e418 <_Unwind_Resume>
    80006894:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006898:	00090513          	mv	a0,s2
    8000689c:	ffffd097          	auipc	ra,0xffffd
    800068a0:	9c8080e7          	jalr	-1592(ra) # 80003264 <_ZdlPv>
    800068a4:	00048513          	mv	a0,s1
    800068a8:	00008097          	auipc	ra,0x8
    800068ac:	b70080e7          	jalr	-1168(ra) # 8000e418 <_Unwind_Resume>

00000000800068b0 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800068b0:	fe010113          	addi	sp,sp,-32
    800068b4:	00113c23          	sd	ra,24(sp)
    800068b8:	00813823          	sd	s0,16(sp)
    800068bc:	00913423          	sd	s1,8(sp)
    800068c0:	01213023          	sd	s2,0(sp)
    800068c4:	02010413          	addi	s0,sp,32
    800068c8:	00050493          	mv	s1,a0
    800068cc:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800068d0:	01853503          	ld	a0,24(a0)
    800068d4:	ffffd097          	auipc	ra,0xffffd
    800068d8:	ce4080e7          	jalr	-796(ra) # 800035b8 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800068dc:	0304b503          	ld	a0,48(s1)
    800068e0:	ffffd097          	auipc	ra,0xffffd
    800068e4:	cd8080e7          	jalr	-808(ra) # 800035b8 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800068e8:	0084b783          	ld	a5,8(s1)
    800068ec:	0144a703          	lw	a4,20(s1)
    800068f0:	00271713          	slli	a4,a4,0x2
    800068f4:	00e787b3          	add	a5,a5,a4
    800068f8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800068fc:	0144a783          	lw	a5,20(s1)
    80006900:	0017879b          	addiw	a5,a5,1
    80006904:	0004a703          	lw	a4,0(s1)
    80006908:	02e7e7bb          	remw	a5,a5,a4
    8000690c:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006910:	0304b503          	ld	a0,48(s1)
    80006914:	ffffd097          	auipc	ra,0xffffd
    80006918:	cd0080e7          	jalr	-816(ra) # 800035e4 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    8000691c:	0204b503          	ld	a0,32(s1)
    80006920:	ffffd097          	auipc	ra,0xffffd
    80006924:	cc4080e7          	jalr	-828(ra) # 800035e4 <_ZN9Semaphore6signalEv>

}
    80006928:	01813083          	ld	ra,24(sp)
    8000692c:	01013403          	ld	s0,16(sp)
    80006930:	00813483          	ld	s1,8(sp)
    80006934:	00013903          	ld	s2,0(sp)
    80006938:	02010113          	addi	sp,sp,32
    8000693c:	00008067          	ret

0000000080006940 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006940:	fe010113          	addi	sp,sp,-32
    80006944:	00113c23          	sd	ra,24(sp)
    80006948:	00813823          	sd	s0,16(sp)
    8000694c:	00913423          	sd	s1,8(sp)
    80006950:	01213023          	sd	s2,0(sp)
    80006954:	02010413          	addi	s0,sp,32
    80006958:	00050493          	mv	s1,a0
    itemAvailable->wait();
    8000695c:	02053503          	ld	a0,32(a0)
    80006960:	ffffd097          	auipc	ra,0xffffd
    80006964:	c58080e7          	jalr	-936(ra) # 800035b8 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006968:	0284b503          	ld	a0,40(s1)
    8000696c:	ffffd097          	auipc	ra,0xffffd
    80006970:	c4c080e7          	jalr	-948(ra) # 800035b8 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80006974:	0084b703          	ld	a4,8(s1)
    80006978:	0104a783          	lw	a5,16(s1)
    8000697c:	00279693          	slli	a3,a5,0x2
    80006980:	00d70733          	add	a4,a4,a3
    80006984:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006988:	0017879b          	addiw	a5,a5,1
    8000698c:	0004a703          	lw	a4,0(s1)
    80006990:	02e7e7bb          	remw	a5,a5,a4
    80006994:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006998:	0284b503          	ld	a0,40(s1)
    8000699c:	ffffd097          	auipc	ra,0xffffd
    800069a0:	c48080e7          	jalr	-952(ra) # 800035e4 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800069a4:	0184b503          	ld	a0,24(s1)
    800069a8:	ffffd097          	auipc	ra,0xffffd
    800069ac:	c3c080e7          	jalr	-964(ra) # 800035e4 <_ZN9Semaphore6signalEv>

    return ret;
}
    800069b0:	00090513          	mv	a0,s2
    800069b4:	01813083          	ld	ra,24(sp)
    800069b8:	01013403          	ld	s0,16(sp)
    800069bc:	00813483          	ld	s1,8(sp)
    800069c0:	00013903          	ld	s2,0(sp)
    800069c4:	02010113          	addi	sp,sp,32
    800069c8:	00008067          	ret

00000000800069cc <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800069cc:	fe010113          	addi	sp,sp,-32
    800069d0:	00113c23          	sd	ra,24(sp)
    800069d4:	00813823          	sd	s0,16(sp)
    800069d8:	00913423          	sd	s1,8(sp)
    800069dc:	01213023          	sd	s2,0(sp)
    800069e0:	02010413          	addi	s0,sp,32
    800069e4:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800069e8:	02853503          	ld	a0,40(a0)
    800069ec:	ffffd097          	auipc	ra,0xffffd
    800069f0:	bcc080e7          	jalr	-1076(ra) # 800035b8 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800069f4:	0304b503          	ld	a0,48(s1)
    800069f8:	ffffd097          	auipc	ra,0xffffd
    800069fc:	bc0080e7          	jalr	-1088(ra) # 800035b8 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006a00:	0144a783          	lw	a5,20(s1)
    80006a04:	0104a903          	lw	s2,16(s1)
    80006a08:	0327ce63          	blt	a5,s2,80006a44 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006a0c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006a10:	0304b503          	ld	a0,48(s1)
    80006a14:	ffffd097          	auipc	ra,0xffffd
    80006a18:	bd0080e7          	jalr	-1072(ra) # 800035e4 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006a1c:	0284b503          	ld	a0,40(s1)
    80006a20:	ffffd097          	auipc	ra,0xffffd
    80006a24:	bc4080e7          	jalr	-1084(ra) # 800035e4 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006a28:	00090513          	mv	a0,s2
    80006a2c:	01813083          	ld	ra,24(sp)
    80006a30:	01013403          	ld	s0,16(sp)
    80006a34:	00813483          	ld	s1,8(sp)
    80006a38:	00013903          	ld	s2,0(sp)
    80006a3c:	02010113          	addi	sp,sp,32
    80006a40:	00008067          	ret
        ret = cap - head + tail;
    80006a44:	0004a703          	lw	a4,0(s1)
    80006a48:	4127093b          	subw	s2,a4,s2
    80006a4c:	00f9093b          	addw	s2,s2,a5
    80006a50:	fc1ff06f          	j	80006a10 <_ZN9BufferCPP6getCntEv+0x44>

0000000080006a54 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006a54:	fe010113          	addi	sp,sp,-32
    80006a58:	00113c23          	sd	ra,24(sp)
    80006a5c:	00813823          	sd	s0,16(sp)
    80006a60:	00913423          	sd	s1,8(sp)
    80006a64:	02010413          	addi	s0,sp,32
    80006a68:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006a6c:	00a00513          	li	a0,10
    80006a70:	ffffd097          	auipc	ra,0xffffd
    80006a74:	c38080e7          	jalr	-968(ra) # 800036a8 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006a78:	00004517          	auipc	a0,0x4
    80006a7c:	a8850513          	addi	a0,a0,-1400 # 8000a500 <CONSOLE_STATUS+0x4f0>
    80006a80:	00000097          	auipc	ra,0x0
    80006a84:	a0c080e7          	jalr	-1524(ra) # 8000648c <_Z11printStringPKc>
    while (getCnt()) {
    80006a88:	00048513          	mv	a0,s1
    80006a8c:	00000097          	auipc	ra,0x0
    80006a90:	f40080e7          	jalr	-192(ra) # 800069cc <_ZN9BufferCPP6getCntEv>
    80006a94:	02050c63          	beqz	a0,80006acc <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006a98:	0084b783          	ld	a5,8(s1)
    80006a9c:	0104a703          	lw	a4,16(s1)
    80006aa0:	00271713          	slli	a4,a4,0x2
    80006aa4:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006aa8:	0007c503          	lbu	a0,0(a5)
    80006aac:	ffffd097          	auipc	ra,0xffffd
    80006ab0:	bfc080e7          	jalr	-1028(ra) # 800036a8 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006ab4:	0104a783          	lw	a5,16(s1)
    80006ab8:	0017879b          	addiw	a5,a5,1
    80006abc:	0004a703          	lw	a4,0(s1)
    80006ac0:	02e7e7bb          	remw	a5,a5,a4
    80006ac4:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006ac8:	fc1ff06f          	j	80006a88 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006acc:	02100513          	li	a0,33
    80006ad0:	ffffd097          	auipc	ra,0xffffd
    80006ad4:	bd8080e7          	jalr	-1064(ra) # 800036a8 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006ad8:	00a00513          	li	a0,10
    80006adc:	ffffd097          	auipc	ra,0xffffd
    80006ae0:	bcc080e7          	jalr	-1076(ra) # 800036a8 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006ae4:	0084b503          	ld	a0,8(s1)
    80006ae8:	ffffb097          	auipc	ra,0xffffb
    80006aec:	8ec080e7          	jalr	-1812(ra) # 800013d4 <_Z8mem_freePv>
    delete itemAvailable;
    80006af0:	0204b503          	ld	a0,32(s1)
    80006af4:	00050863          	beqz	a0,80006b04 <_ZN9BufferCPPD1Ev+0xb0>
    80006af8:	00053783          	ld	a5,0(a0)
    80006afc:	0087b783          	ld	a5,8(a5)
    80006b00:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006b04:	0184b503          	ld	a0,24(s1)
    80006b08:	00050863          	beqz	a0,80006b18 <_ZN9BufferCPPD1Ev+0xc4>
    80006b0c:	00053783          	ld	a5,0(a0)
    80006b10:	0087b783          	ld	a5,8(a5)
    80006b14:	000780e7          	jalr	a5
    delete mutexTail;
    80006b18:	0304b503          	ld	a0,48(s1)
    80006b1c:	00050863          	beqz	a0,80006b2c <_ZN9BufferCPPD1Ev+0xd8>
    80006b20:	00053783          	ld	a5,0(a0)
    80006b24:	0087b783          	ld	a5,8(a5)
    80006b28:	000780e7          	jalr	a5
    delete mutexHead;
    80006b2c:	0284b503          	ld	a0,40(s1)
    80006b30:	00050863          	beqz	a0,80006b40 <_ZN9BufferCPPD1Ev+0xec>
    80006b34:	00053783          	ld	a5,0(a0)
    80006b38:	0087b783          	ld	a5,8(a5)
    80006b3c:	000780e7          	jalr	a5
}
    80006b40:	01813083          	ld	ra,24(sp)
    80006b44:	01013403          	ld	s0,16(sp)
    80006b48:	00813483          	ld	s1,8(sp)
    80006b4c:	02010113          	addi	sp,sp,32
    80006b50:	00008067          	ret

0000000080006b54 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80006b54:	fe010113          	addi	sp,sp,-32
    80006b58:	00113c23          	sd	ra,24(sp)
    80006b5c:	00813823          	sd	s0,16(sp)
    80006b60:	00913423          	sd	s1,8(sp)
    80006b64:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80006b68:	00004517          	auipc	a0,0x4
    80006b6c:	9b050513          	addi	a0,a0,-1616 # 8000a518 <CONSOLE_STATUS+0x508>
    80006b70:	00000097          	auipc	ra,0x0
    80006b74:	91c080e7          	jalr	-1764(ra) # 8000648c <_Z11printStringPKc>
    int test = getc() - '0';
    80006b78:	ffffb097          	auipc	ra,0xffffb
    80006b7c:	a88080e7          	jalr	-1400(ra) # 80001600 <_Z4getcv>
    80006b80:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80006b84:	ffffb097          	auipc	ra,0xffffb
    80006b88:	a7c080e7          	jalr	-1412(ra) # 80001600 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006b8c:	00700793          	li	a5,7
    80006b90:	1097e263          	bltu	a5,s1,80006c94 <_Z8userMainv+0x140>
    80006b94:	00249493          	slli	s1,s1,0x2
    80006b98:	00004717          	auipc	a4,0x4
    80006b9c:	bd870713          	addi	a4,a4,-1064 # 8000a770 <CONSOLE_STATUS+0x760>
    80006ba0:	00e484b3          	add	s1,s1,a4
    80006ba4:	0004a783          	lw	a5,0(s1)
    80006ba8:	00e787b3          	add	a5,a5,a4
    80006bac:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80006bb0:	fffff097          	auipc	ra,0xfffff
    80006bb4:	f54080e7          	jalr	-172(ra) # 80005b04 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006bb8:	00004517          	auipc	a0,0x4
    80006bbc:	98050513          	addi	a0,a0,-1664 # 8000a538 <CONSOLE_STATUS+0x528>
    80006bc0:	00000097          	auipc	ra,0x0
    80006bc4:	8cc080e7          	jalr	-1844(ra) # 8000648c <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006bc8:	01813083          	ld	ra,24(sp)
    80006bcc:	01013403          	ld	s0,16(sp)
    80006bd0:	00813483          	ld	s1,8(sp)
    80006bd4:	02010113          	addi	sp,sp,32
    80006bd8:	00008067          	ret
            Threads_CPP_API_test();
    80006bdc:	ffffe097          	auipc	ra,0xffffe
    80006be0:	e08080e7          	jalr	-504(ra) # 800049e4 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006be4:	00004517          	auipc	a0,0x4
    80006be8:	99450513          	addi	a0,a0,-1644 # 8000a578 <CONSOLE_STATUS+0x568>
    80006bec:	00000097          	auipc	ra,0x0
    80006bf0:	8a0080e7          	jalr	-1888(ra) # 8000648c <_Z11printStringPKc>
            break;
    80006bf4:	fd5ff06f          	j	80006bc8 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006bf8:	ffffd097          	auipc	ra,0xffffd
    80006bfc:	640080e7          	jalr	1600(ra) # 80004238 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006c00:	00004517          	auipc	a0,0x4
    80006c04:	9b850513          	addi	a0,a0,-1608 # 8000a5b8 <CONSOLE_STATUS+0x5a8>
    80006c08:	00000097          	auipc	ra,0x0
    80006c0c:	884080e7          	jalr	-1916(ra) # 8000648c <_Z11printStringPKc>
            break;
    80006c10:	fb9ff06f          	j	80006bc8 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006c14:	fffff097          	auipc	ra,0xfffff
    80006c18:	234080e7          	jalr	564(ra) # 80005e48 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006c1c:	00004517          	auipc	a0,0x4
    80006c20:	9ec50513          	addi	a0,a0,-1556 # 8000a608 <CONSOLE_STATUS+0x5f8>
    80006c24:	00000097          	auipc	ra,0x0
    80006c28:	868080e7          	jalr	-1944(ra) # 8000648c <_Z11printStringPKc>
            break;
    80006c2c:	f9dff06f          	j	80006bc8 <_Z8userMainv+0x74>
            testSleeping();
    80006c30:	00000097          	auipc	ra,0x0
    80006c34:	11c080e7          	jalr	284(ra) # 80006d4c <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006c38:	00004517          	auipc	a0,0x4
    80006c3c:	a2850513          	addi	a0,a0,-1496 # 8000a660 <CONSOLE_STATUS+0x650>
    80006c40:	00000097          	auipc	ra,0x0
    80006c44:	84c080e7          	jalr	-1972(ra) # 8000648c <_Z11printStringPKc>
            break;
    80006c48:	f81ff06f          	j	80006bc8 <_Z8userMainv+0x74>
            testConsumerProducer();
    80006c4c:	ffffe097          	auipc	ra,0xffffe
    80006c50:	258080e7          	jalr	600(ra) # 80004ea4 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006c54:	00004517          	auipc	a0,0x4
    80006c58:	a3c50513          	addi	a0,a0,-1476 # 8000a690 <CONSOLE_STATUS+0x680>
    80006c5c:	00000097          	auipc	ra,0x0
    80006c60:	830080e7          	jalr	-2000(ra) # 8000648c <_Z11printStringPKc>
            break;
    80006c64:	f65ff06f          	j	80006bc8 <_Z8userMainv+0x74>
            System_Mode_test();
    80006c68:	00000097          	auipc	ra,0x0
    80006c6c:	658080e7          	jalr	1624(ra) # 800072c0 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006c70:	00004517          	auipc	a0,0x4
    80006c74:	a6050513          	addi	a0,a0,-1440 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80006c78:	00000097          	auipc	ra,0x0
    80006c7c:	814080e7          	jalr	-2028(ra) # 8000648c <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006c80:	00004517          	auipc	a0,0x4
    80006c84:	a7050513          	addi	a0,a0,-1424 # 8000a6f0 <CONSOLE_STATUS+0x6e0>
    80006c88:	00000097          	auipc	ra,0x0
    80006c8c:	804080e7          	jalr	-2044(ra) # 8000648c <_Z11printStringPKc>
            break;
    80006c90:	f39ff06f          	j	80006bc8 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80006c94:	00004517          	auipc	a0,0x4
    80006c98:	ab450513          	addi	a0,a0,-1356 # 8000a748 <CONSOLE_STATUS+0x738>
    80006c9c:	fffff097          	auipc	ra,0xfffff
    80006ca0:	7f0080e7          	jalr	2032(ra) # 8000648c <_Z11printStringPKc>
    80006ca4:	f25ff06f          	j	80006bc8 <_Z8userMainv+0x74>

0000000080006ca8 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006ca8:	fe010113          	addi	sp,sp,-32
    80006cac:	00113c23          	sd	ra,24(sp)
    80006cb0:	00813823          	sd	s0,16(sp)
    80006cb4:	00913423          	sd	s1,8(sp)
    80006cb8:	01213023          	sd	s2,0(sp)
    80006cbc:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006cc0:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006cc4:	00600493          	li	s1,6
    while (--i > 0) {
    80006cc8:	fff4849b          	addiw	s1,s1,-1
    80006ccc:	04905463          	blez	s1,80006d14 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006cd0:	00004517          	auipc	a0,0x4
    80006cd4:	ac050513          	addi	a0,a0,-1344 # 8000a790 <CONSOLE_STATUS+0x780>
    80006cd8:	fffff097          	auipc	ra,0xfffff
    80006cdc:	7b4080e7          	jalr	1972(ra) # 8000648c <_Z11printStringPKc>
        printInt(sleep_time);
    80006ce0:	00000613          	li	a2,0
    80006ce4:	00a00593          	li	a1,10
    80006ce8:	0009051b          	sext.w	a0,s2
    80006cec:	00000097          	auipc	ra,0x0
    80006cf0:	950080e7          	jalr	-1712(ra) # 8000663c <_Z8printIntiii>
        printString(" !\n");
    80006cf4:	00004517          	auipc	a0,0x4
    80006cf8:	aa450513          	addi	a0,a0,-1372 # 8000a798 <CONSOLE_STATUS+0x788>
    80006cfc:	fffff097          	auipc	ra,0xfffff
    80006d00:	790080e7          	jalr	1936(ra) # 8000648c <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006d04:	00090513          	mv	a0,s2
    80006d08:	ffffb097          	auipc	ra,0xffffb
    80006d0c:	800080e7          	jalr	-2048(ra) # 80001508 <_Z10time_sleepm>
    while (--i > 0) {
    80006d10:	fb9ff06f          	j	80006cc8 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006d14:	00a00793          	li	a5,10
    80006d18:	02f95933          	divu	s2,s2,a5
    80006d1c:	fff90913          	addi	s2,s2,-1
    80006d20:	00006797          	auipc	a5,0x6
    80006d24:	61078793          	addi	a5,a5,1552 # 8000d330 <_ZL8finished>
    80006d28:	01278933          	add	s2,a5,s2
    80006d2c:	00100793          	li	a5,1
    80006d30:	00f90023          	sb	a5,0(s2)
}
    80006d34:	01813083          	ld	ra,24(sp)
    80006d38:	01013403          	ld	s0,16(sp)
    80006d3c:	00813483          	ld	s1,8(sp)
    80006d40:	00013903          	ld	s2,0(sp)
    80006d44:	02010113          	addi	sp,sp,32
    80006d48:	00008067          	ret

0000000080006d4c <_Z12testSleepingv>:

void testSleeping() {
    80006d4c:	fc010113          	addi	sp,sp,-64
    80006d50:	02113c23          	sd	ra,56(sp)
    80006d54:	02813823          	sd	s0,48(sp)
    80006d58:	02913423          	sd	s1,40(sp)
    80006d5c:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006d60:	00a00793          	li	a5,10
    80006d64:	fcf43823          	sd	a5,-48(s0)
    80006d68:	01400793          	li	a5,20
    80006d6c:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006d70:	00000493          	li	s1,0
    80006d74:	02c0006f          	j	80006da0 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006d78:	00349793          	slli	a5,s1,0x3
    80006d7c:	fd040613          	addi	a2,s0,-48
    80006d80:	00f60633          	add	a2,a2,a5
    80006d84:	00000597          	auipc	a1,0x0
    80006d88:	f2458593          	addi	a1,a1,-220 # 80006ca8 <_ZL9sleepyRunPv>
    80006d8c:	fc040513          	addi	a0,s0,-64
    80006d90:	00f50533          	add	a0,a0,a5
    80006d94:	ffffa097          	auipc	ra,0xffffa
    80006d98:	670080e7          	jalr	1648(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006d9c:	0014849b          	addiw	s1,s1,1
    80006da0:	00100793          	li	a5,1
    80006da4:	fc97dae3          	bge	a5,s1,80006d78 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006da8:	00006797          	auipc	a5,0x6
    80006dac:	5887c783          	lbu	a5,1416(a5) # 8000d330 <_ZL8finished>
    80006db0:	fe078ce3          	beqz	a5,80006da8 <_Z12testSleepingv+0x5c>
    80006db4:	00006797          	auipc	a5,0x6
    80006db8:	57d7c783          	lbu	a5,1405(a5) # 8000d331 <_ZL8finished+0x1>
    80006dbc:	fe0786e3          	beqz	a5,80006da8 <_Z12testSleepingv+0x5c>
}
    80006dc0:	03813083          	ld	ra,56(sp)
    80006dc4:	03013403          	ld	s0,48(sp)
    80006dc8:	02813483          	ld	s1,40(sp)
    80006dcc:	04010113          	addi	sp,sp,64
    80006dd0:	00008067          	ret

0000000080006dd4 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006dd4:	fe010113          	addi	sp,sp,-32
    80006dd8:	00113c23          	sd	ra,24(sp)
    80006ddc:	00813823          	sd	s0,16(sp)
    80006de0:	00913423          	sd	s1,8(sp)
    80006de4:	01213023          	sd	s2,0(sp)
    80006de8:	02010413          	addi	s0,sp,32
    80006dec:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006df0:	00100793          	li	a5,1
    80006df4:	02a7f863          	bgeu	a5,a0,80006e24 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006df8:	00a00793          	li	a5,10
    80006dfc:	02f577b3          	remu	a5,a0,a5
    80006e00:	02078e63          	beqz	a5,80006e3c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006e04:	fff48513          	addi	a0,s1,-1
    80006e08:	00000097          	auipc	ra,0x0
    80006e0c:	fcc080e7          	jalr	-52(ra) # 80006dd4 <_ZL9fibonaccim>
    80006e10:	00050913          	mv	s2,a0
    80006e14:	ffe48513          	addi	a0,s1,-2
    80006e18:	00000097          	auipc	ra,0x0
    80006e1c:	fbc080e7          	jalr	-68(ra) # 80006dd4 <_ZL9fibonaccim>
    80006e20:	00a90533          	add	a0,s2,a0
}
    80006e24:	01813083          	ld	ra,24(sp)
    80006e28:	01013403          	ld	s0,16(sp)
    80006e2c:	00813483          	ld	s1,8(sp)
    80006e30:	00013903          	ld	s2,0(sp)
    80006e34:	02010113          	addi	sp,sp,32
    80006e38:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006e3c:	ffffa097          	auipc	ra,0xffffa
    80006e40:	684080e7          	jalr	1668(ra) # 800014c0 <_Z15thread_dispatchv>
    80006e44:	fc1ff06f          	j	80006e04 <_ZL9fibonaccim+0x30>

0000000080006e48 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006e48:	fe010113          	addi	sp,sp,-32
    80006e4c:	00113c23          	sd	ra,24(sp)
    80006e50:	00813823          	sd	s0,16(sp)
    80006e54:	00913423          	sd	s1,8(sp)
    80006e58:	01213023          	sd	s2,0(sp)
    80006e5c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006e60:	00a00493          	li	s1,10
    80006e64:	0400006f          	j	80006ea4 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006e68:	00003517          	auipc	a0,0x3
    80006e6c:	60050513          	addi	a0,a0,1536 # 8000a468 <CONSOLE_STATUS+0x458>
    80006e70:	fffff097          	auipc	ra,0xfffff
    80006e74:	61c080e7          	jalr	1564(ra) # 8000648c <_Z11printStringPKc>
    80006e78:	00000613          	li	a2,0
    80006e7c:	00a00593          	li	a1,10
    80006e80:	00048513          	mv	a0,s1
    80006e84:	fffff097          	auipc	ra,0xfffff
    80006e88:	7b8080e7          	jalr	1976(ra) # 8000663c <_Z8printIntiii>
    80006e8c:	00003517          	auipc	a0,0x3
    80006e90:	7cc50513          	addi	a0,a0,1996 # 8000a658 <CONSOLE_STATUS+0x648>
    80006e94:	fffff097          	auipc	ra,0xfffff
    80006e98:	5f8080e7          	jalr	1528(ra) # 8000648c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006e9c:	0014849b          	addiw	s1,s1,1
    80006ea0:	0ff4f493          	andi	s1,s1,255
    80006ea4:	00c00793          	li	a5,12
    80006ea8:	fc97f0e3          	bgeu	a5,s1,80006e68 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006eac:	00003517          	auipc	a0,0x3
    80006eb0:	5c450513          	addi	a0,a0,1476 # 8000a470 <CONSOLE_STATUS+0x460>
    80006eb4:	fffff097          	auipc	ra,0xfffff
    80006eb8:	5d8080e7          	jalr	1496(ra) # 8000648c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006ebc:	00500313          	li	t1,5
    thread_dispatch();
    80006ec0:	ffffa097          	auipc	ra,0xffffa
    80006ec4:	600080e7          	jalr	1536(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006ec8:	01000513          	li	a0,16
    80006ecc:	00000097          	auipc	ra,0x0
    80006ed0:	f08080e7          	jalr	-248(ra) # 80006dd4 <_ZL9fibonaccim>
    80006ed4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006ed8:	00003517          	auipc	a0,0x3
    80006edc:	5a850513          	addi	a0,a0,1448 # 8000a480 <CONSOLE_STATUS+0x470>
    80006ee0:	fffff097          	auipc	ra,0xfffff
    80006ee4:	5ac080e7          	jalr	1452(ra) # 8000648c <_Z11printStringPKc>
    80006ee8:	00000613          	li	a2,0
    80006eec:	00a00593          	li	a1,10
    80006ef0:	0009051b          	sext.w	a0,s2
    80006ef4:	fffff097          	auipc	ra,0xfffff
    80006ef8:	748080e7          	jalr	1864(ra) # 8000663c <_Z8printIntiii>
    80006efc:	00003517          	auipc	a0,0x3
    80006f00:	75c50513          	addi	a0,a0,1884 # 8000a658 <CONSOLE_STATUS+0x648>
    80006f04:	fffff097          	auipc	ra,0xfffff
    80006f08:	588080e7          	jalr	1416(ra) # 8000648c <_Z11printStringPKc>
    80006f0c:	0400006f          	j	80006f4c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006f10:	00003517          	auipc	a0,0x3
    80006f14:	55850513          	addi	a0,a0,1368 # 8000a468 <CONSOLE_STATUS+0x458>
    80006f18:	fffff097          	auipc	ra,0xfffff
    80006f1c:	574080e7          	jalr	1396(ra) # 8000648c <_Z11printStringPKc>
    80006f20:	00000613          	li	a2,0
    80006f24:	00a00593          	li	a1,10
    80006f28:	00048513          	mv	a0,s1
    80006f2c:	fffff097          	auipc	ra,0xfffff
    80006f30:	710080e7          	jalr	1808(ra) # 8000663c <_Z8printIntiii>
    80006f34:	00003517          	auipc	a0,0x3
    80006f38:	72450513          	addi	a0,a0,1828 # 8000a658 <CONSOLE_STATUS+0x648>
    80006f3c:	fffff097          	auipc	ra,0xfffff
    80006f40:	550080e7          	jalr	1360(ra) # 8000648c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006f44:	0014849b          	addiw	s1,s1,1
    80006f48:	0ff4f493          	andi	s1,s1,255
    80006f4c:	00f00793          	li	a5,15
    80006f50:	fc97f0e3          	bgeu	a5,s1,80006f10 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006f54:	00003517          	auipc	a0,0x3
    80006f58:	53c50513          	addi	a0,a0,1340 # 8000a490 <CONSOLE_STATUS+0x480>
    80006f5c:	fffff097          	auipc	ra,0xfffff
    80006f60:	530080e7          	jalr	1328(ra) # 8000648c <_Z11printStringPKc>
    finishedD = true;
    80006f64:	00100793          	li	a5,1
    80006f68:	00006717          	auipc	a4,0x6
    80006f6c:	3cf70523          	sb	a5,970(a4) # 8000d332 <_ZL9finishedD>
    thread_dispatch();
    80006f70:	ffffa097          	auipc	ra,0xffffa
    80006f74:	550080e7          	jalr	1360(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80006f78:	01813083          	ld	ra,24(sp)
    80006f7c:	01013403          	ld	s0,16(sp)
    80006f80:	00813483          	ld	s1,8(sp)
    80006f84:	00013903          	ld	s2,0(sp)
    80006f88:	02010113          	addi	sp,sp,32
    80006f8c:	00008067          	ret

0000000080006f90 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006f90:	fe010113          	addi	sp,sp,-32
    80006f94:	00113c23          	sd	ra,24(sp)
    80006f98:	00813823          	sd	s0,16(sp)
    80006f9c:	00913423          	sd	s1,8(sp)
    80006fa0:	01213023          	sd	s2,0(sp)
    80006fa4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006fa8:	00000493          	li	s1,0
    80006fac:	0400006f          	j	80006fec <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006fb0:	00003517          	auipc	a0,0x3
    80006fb4:	47850513          	addi	a0,a0,1144 # 8000a428 <CONSOLE_STATUS+0x418>
    80006fb8:	fffff097          	auipc	ra,0xfffff
    80006fbc:	4d4080e7          	jalr	1236(ra) # 8000648c <_Z11printStringPKc>
    80006fc0:	00000613          	li	a2,0
    80006fc4:	00a00593          	li	a1,10
    80006fc8:	00048513          	mv	a0,s1
    80006fcc:	fffff097          	auipc	ra,0xfffff
    80006fd0:	670080e7          	jalr	1648(ra) # 8000663c <_Z8printIntiii>
    80006fd4:	00003517          	auipc	a0,0x3
    80006fd8:	68450513          	addi	a0,a0,1668 # 8000a658 <CONSOLE_STATUS+0x648>
    80006fdc:	fffff097          	auipc	ra,0xfffff
    80006fe0:	4b0080e7          	jalr	1200(ra) # 8000648c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006fe4:	0014849b          	addiw	s1,s1,1
    80006fe8:	0ff4f493          	andi	s1,s1,255
    80006fec:	00200793          	li	a5,2
    80006ff0:	fc97f0e3          	bgeu	a5,s1,80006fb0 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006ff4:	00003517          	auipc	a0,0x3
    80006ff8:	43c50513          	addi	a0,a0,1084 # 8000a430 <CONSOLE_STATUS+0x420>
    80006ffc:	fffff097          	auipc	ra,0xfffff
    80007000:	490080e7          	jalr	1168(ra) # 8000648c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80007004:	00700313          	li	t1,7
    thread_dispatch();
    80007008:	ffffa097          	auipc	ra,0xffffa
    8000700c:	4b8080e7          	jalr	1208(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80007010:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80007014:	00003517          	auipc	a0,0x3
    80007018:	42c50513          	addi	a0,a0,1068 # 8000a440 <CONSOLE_STATUS+0x430>
    8000701c:	fffff097          	auipc	ra,0xfffff
    80007020:	470080e7          	jalr	1136(ra) # 8000648c <_Z11printStringPKc>
    80007024:	00000613          	li	a2,0
    80007028:	00a00593          	li	a1,10
    8000702c:	0009051b          	sext.w	a0,s2
    80007030:	fffff097          	auipc	ra,0xfffff
    80007034:	60c080e7          	jalr	1548(ra) # 8000663c <_Z8printIntiii>
    80007038:	00003517          	auipc	a0,0x3
    8000703c:	62050513          	addi	a0,a0,1568 # 8000a658 <CONSOLE_STATUS+0x648>
    80007040:	fffff097          	auipc	ra,0xfffff
    80007044:	44c080e7          	jalr	1100(ra) # 8000648c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80007048:	00c00513          	li	a0,12
    8000704c:	00000097          	auipc	ra,0x0
    80007050:	d88080e7          	jalr	-632(ra) # 80006dd4 <_ZL9fibonaccim>
    80007054:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80007058:	00003517          	auipc	a0,0x3
    8000705c:	3f050513          	addi	a0,a0,1008 # 8000a448 <CONSOLE_STATUS+0x438>
    80007060:	fffff097          	auipc	ra,0xfffff
    80007064:	42c080e7          	jalr	1068(ra) # 8000648c <_Z11printStringPKc>
    80007068:	00000613          	li	a2,0
    8000706c:	00a00593          	li	a1,10
    80007070:	0009051b          	sext.w	a0,s2
    80007074:	fffff097          	auipc	ra,0xfffff
    80007078:	5c8080e7          	jalr	1480(ra) # 8000663c <_Z8printIntiii>
    8000707c:	00003517          	auipc	a0,0x3
    80007080:	5dc50513          	addi	a0,a0,1500 # 8000a658 <CONSOLE_STATUS+0x648>
    80007084:	fffff097          	auipc	ra,0xfffff
    80007088:	408080e7          	jalr	1032(ra) # 8000648c <_Z11printStringPKc>
    8000708c:	0400006f          	j	800070cc <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80007090:	00003517          	auipc	a0,0x3
    80007094:	39850513          	addi	a0,a0,920 # 8000a428 <CONSOLE_STATUS+0x418>
    80007098:	fffff097          	auipc	ra,0xfffff
    8000709c:	3f4080e7          	jalr	1012(ra) # 8000648c <_Z11printStringPKc>
    800070a0:	00000613          	li	a2,0
    800070a4:	00a00593          	li	a1,10
    800070a8:	00048513          	mv	a0,s1
    800070ac:	fffff097          	auipc	ra,0xfffff
    800070b0:	590080e7          	jalr	1424(ra) # 8000663c <_Z8printIntiii>
    800070b4:	00003517          	auipc	a0,0x3
    800070b8:	5a450513          	addi	a0,a0,1444 # 8000a658 <CONSOLE_STATUS+0x648>
    800070bc:	fffff097          	auipc	ra,0xfffff
    800070c0:	3d0080e7          	jalr	976(ra) # 8000648c <_Z11printStringPKc>
    for (; i < 6; i++) {
    800070c4:	0014849b          	addiw	s1,s1,1
    800070c8:	0ff4f493          	andi	s1,s1,255
    800070cc:	00500793          	li	a5,5
    800070d0:	fc97f0e3          	bgeu	a5,s1,80007090 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800070d4:	00003517          	auipc	a0,0x3
    800070d8:	32c50513          	addi	a0,a0,812 # 8000a400 <CONSOLE_STATUS+0x3f0>
    800070dc:	fffff097          	auipc	ra,0xfffff
    800070e0:	3b0080e7          	jalr	944(ra) # 8000648c <_Z11printStringPKc>
    finishedC = true;
    800070e4:	00100793          	li	a5,1
    800070e8:	00006717          	auipc	a4,0x6
    800070ec:	24f705a3          	sb	a5,587(a4) # 8000d333 <_ZL9finishedC>
    thread_dispatch();
    800070f0:	ffffa097          	auipc	ra,0xffffa
    800070f4:	3d0080e7          	jalr	976(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800070f8:	01813083          	ld	ra,24(sp)
    800070fc:	01013403          	ld	s0,16(sp)
    80007100:	00813483          	ld	s1,8(sp)
    80007104:	00013903          	ld	s2,0(sp)
    80007108:	02010113          	addi	sp,sp,32
    8000710c:	00008067          	ret

0000000080007110 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80007110:	fe010113          	addi	sp,sp,-32
    80007114:	00113c23          	sd	ra,24(sp)
    80007118:	00813823          	sd	s0,16(sp)
    8000711c:	00913423          	sd	s1,8(sp)
    80007120:	01213023          	sd	s2,0(sp)
    80007124:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80007128:	00000913          	li	s2,0
    8000712c:	0400006f          	j	8000716c <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80007130:	ffffa097          	auipc	ra,0xffffa
    80007134:	390080e7          	jalr	912(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80007138:	00148493          	addi	s1,s1,1
    8000713c:	000027b7          	lui	a5,0x2
    80007140:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80007144:	0097ee63          	bltu	a5,s1,80007160 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80007148:	00000713          	li	a4,0
    8000714c:	000077b7          	lui	a5,0x7
    80007150:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80007154:	fce7eee3          	bltu	a5,a4,80007130 <_ZL11workerBodyBPv+0x20>
    80007158:	00170713          	addi	a4,a4,1
    8000715c:	ff1ff06f          	j	8000714c <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80007160:	00a00793          	li	a5,10
    80007164:	04f90663          	beq	s2,a5,800071b0 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80007168:	00190913          	addi	s2,s2,1
    8000716c:	00f00793          	li	a5,15
    80007170:	0527e463          	bltu	a5,s2,800071b8 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80007174:	00003517          	auipc	a0,0x3
    80007178:	29c50513          	addi	a0,a0,668 # 8000a410 <CONSOLE_STATUS+0x400>
    8000717c:	fffff097          	auipc	ra,0xfffff
    80007180:	310080e7          	jalr	784(ra) # 8000648c <_Z11printStringPKc>
    80007184:	00000613          	li	a2,0
    80007188:	00a00593          	li	a1,10
    8000718c:	0009051b          	sext.w	a0,s2
    80007190:	fffff097          	auipc	ra,0xfffff
    80007194:	4ac080e7          	jalr	1196(ra) # 8000663c <_Z8printIntiii>
    80007198:	00003517          	auipc	a0,0x3
    8000719c:	4c050513          	addi	a0,a0,1216 # 8000a658 <CONSOLE_STATUS+0x648>
    800071a0:	fffff097          	auipc	ra,0xfffff
    800071a4:	2ec080e7          	jalr	748(ra) # 8000648c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800071a8:	00000493          	li	s1,0
    800071ac:	f91ff06f          	j	8000713c <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800071b0:	14102ff3          	csrr	t6,sepc
    800071b4:	fb5ff06f          	j	80007168 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800071b8:	00003517          	auipc	a0,0x3
    800071bc:	26050513          	addi	a0,a0,608 # 8000a418 <CONSOLE_STATUS+0x408>
    800071c0:	fffff097          	auipc	ra,0xfffff
    800071c4:	2cc080e7          	jalr	716(ra) # 8000648c <_Z11printStringPKc>
    finishedB = true;
    800071c8:	00100793          	li	a5,1
    800071cc:	00006717          	auipc	a4,0x6
    800071d0:	16f70423          	sb	a5,360(a4) # 8000d334 <_ZL9finishedB>
    thread_dispatch();
    800071d4:	ffffa097          	auipc	ra,0xffffa
    800071d8:	2ec080e7          	jalr	748(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800071dc:	01813083          	ld	ra,24(sp)
    800071e0:	01013403          	ld	s0,16(sp)
    800071e4:	00813483          	ld	s1,8(sp)
    800071e8:	00013903          	ld	s2,0(sp)
    800071ec:	02010113          	addi	sp,sp,32
    800071f0:	00008067          	ret

00000000800071f4 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800071f4:	fe010113          	addi	sp,sp,-32
    800071f8:	00113c23          	sd	ra,24(sp)
    800071fc:	00813823          	sd	s0,16(sp)
    80007200:	00913423          	sd	s1,8(sp)
    80007204:	01213023          	sd	s2,0(sp)
    80007208:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000720c:	00000913          	li	s2,0
    80007210:	0380006f          	j	80007248 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80007214:	ffffa097          	auipc	ra,0xffffa
    80007218:	2ac080e7          	jalr	684(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000721c:	00148493          	addi	s1,s1,1
    80007220:	000027b7          	lui	a5,0x2
    80007224:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80007228:	0097ee63          	bltu	a5,s1,80007244 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000722c:	00000713          	li	a4,0
    80007230:	000077b7          	lui	a5,0x7
    80007234:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80007238:	fce7eee3          	bltu	a5,a4,80007214 <_ZL11workerBodyAPv+0x20>
    8000723c:	00170713          	addi	a4,a4,1
    80007240:	ff1ff06f          	j	80007230 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80007244:	00190913          	addi	s2,s2,1
    80007248:	00900793          	li	a5,9
    8000724c:	0527e063          	bltu	a5,s2,8000728c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80007250:	00003517          	auipc	a0,0x3
    80007254:	1a850513          	addi	a0,a0,424 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    80007258:	fffff097          	auipc	ra,0xfffff
    8000725c:	234080e7          	jalr	564(ra) # 8000648c <_Z11printStringPKc>
    80007260:	00000613          	li	a2,0
    80007264:	00a00593          	li	a1,10
    80007268:	0009051b          	sext.w	a0,s2
    8000726c:	fffff097          	auipc	ra,0xfffff
    80007270:	3d0080e7          	jalr	976(ra) # 8000663c <_Z8printIntiii>
    80007274:	00003517          	auipc	a0,0x3
    80007278:	3e450513          	addi	a0,a0,996 # 8000a658 <CONSOLE_STATUS+0x648>
    8000727c:	fffff097          	auipc	ra,0xfffff
    80007280:	210080e7          	jalr	528(ra) # 8000648c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80007284:	00000493          	li	s1,0
    80007288:	f99ff06f          	j	80007220 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    8000728c:	00003517          	auipc	a0,0x3
    80007290:	17450513          	addi	a0,a0,372 # 8000a400 <CONSOLE_STATUS+0x3f0>
    80007294:	fffff097          	auipc	ra,0xfffff
    80007298:	1f8080e7          	jalr	504(ra) # 8000648c <_Z11printStringPKc>
    finishedA = true;
    8000729c:	00100793          	li	a5,1
    800072a0:	00006717          	auipc	a4,0x6
    800072a4:	08f70aa3          	sb	a5,149(a4) # 8000d335 <_ZL9finishedA>
}
    800072a8:	01813083          	ld	ra,24(sp)
    800072ac:	01013403          	ld	s0,16(sp)
    800072b0:	00813483          	ld	s1,8(sp)
    800072b4:	00013903          	ld	s2,0(sp)
    800072b8:	02010113          	addi	sp,sp,32
    800072bc:	00008067          	ret

00000000800072c0 <_Z16System_Mode_testv>:


void System_Mode_test() {
    800072c0:	fd010113          	addi	sp,sp,-48
    800072c4:	02113423          	sd	ra,40(sp)
    800072c8:	02813023          	sd	s0,32(sp)
    800072cc:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800072d0:	00000613          	li	a2,0
    800072d4:	00000597          	auipc	a1,0x0
    800072d8:	f2058593          	addi	a1,a1,-224 # 800071f4 <_ZL11workerBodyAPv>
    800072dc:	fd040513          	addi	a0,s0,-48
    800072e0:	ffffa097          	auipc	ra,0xffffa
    800072e4:	124080e7          	jalr	292(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800072e8:	00003517          	auipc	a0,0x3
    800072ec:	1b850513          	addi	a0,a0,440 # 8000a4a0 <CONSOLE_STATUS+0x490>
    800072f0:	fffff097          	auipc	ra,0xfffff
    800072f4:	19c080e7          	jalr	412(ra) # 8000648c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800072f8:	00000613          	li	a2,0
    800072fc:	00000597          	auipc	a1,0x0
    80007300:	e1458593          	addi	a1,a1,-492 # 80007110 <_ZL11workerBodyBPv>
    80007304:	fd840513          	addi	a0,s0,-40
    80007308:	ffffa097          	auipc	ra,0xffffa
    8000730c:	0fc080e7          	jalr	252(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80007310:	00003517          	auipc	a0,0x3
    80007314:	1a850513          	addi	a0,a0,424 # 8000a4b8 <CONSOLE_STATUS+0x4a8>
    80007318:	fffff097          	auipc	ra,0xfffff
    8000731c:	174080e7          	jalr	372(ra) # 8000648c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80007320:	00000613          	li	a2,0
    80007324:	00000597          	auipc	a1,0x0
    80007328:	c6c58593          	addi	a1,a1,-916 # 80006f90 <_ZL11workerBodyCPv>
    8000732c:	fe040513          	addi	a0,s0,-32
    80007330:	ffffa097          	auipc	ra,0xffffa
    80007334:	0d4080e7          	jalr	212(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80007338:	00003517          	auipc	a0,0x3
    8000733c:	19850513          	addi	a0,a0,408 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80007340:	fffff097          	auipc	ra,0xfffff
    80007344:	14c080e7          	jalr	332(ra) # 8000648c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80007348:	00000613          	li	a2,0
    8000734c:	00000597          	auipc	a1,0x0
    80007350:	afc58593          	addi	a1,a1,-1284 # 80006e48 <_ZL11workerBodyDPv>
    80007354:	fe840513          	addi	a0,s0,-24
    80007358:	ffffa097          	auipc	ra,0xffffa
    8000735c:	0ac080e7          	jalr	172(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80007360:	00003517          	auipc	a0,0x3
    80007364:	18850513          	addi	a0,a0,392 # 8000a4e8 <CONSOLE_STATUS+0x4d8>
    80007368:	fffff097          	auipc	ra,0xfffff
    8000736c:	124080e7          	jalr	292(ra) # 8000648c <_Z11printStringPKc>
    80007370:	00c0006f          	j	8000737c <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80007374:	ffffa097          	auipc	ra,0xffffa
    80007378:	14c080e7          	jalr	332(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000737c:	00006797          	auipc	a5,0x6
    80007380:	fb97c783          	lbu	a5,-71(a5) # 8000d335 <_ZL9finishedA>
    80007384:	fe0788e3          	beqz	a5,80007374 <_Z16System_Mode_testv+0xb4>
    80007388:	00006797          	auipc	a5,0x6
    8000738c:	fac7c783          	lbu	a5,-84(a5) # 8000d334 <_ZL9finishedB>
    80007390:	fe0782e3          	beqz	a5,80007374 <_Z16System_Mode_testv+0xb4>
    80007394:	00006797          	auipc	a5,0x6
    80007398:	f9f7c783          	lbu	a5,-97(a5) # 8000d333 <_ZL9finishedC>
    8000739c:	fc078ce3          	beqz	a5,80007374 <_Z16System_Mode_testv+0xb4>
    800073a0:	00006797          	auipc	a5,0x6
    800073a4:	f927c783          	lbu	a5,-110(a5) # 8000d332 <_ZL9finishedD>
    800073a8:	fc0786e3          	beqz	a5,80007374 <_Z16System_Mode_testv+0xb4>
    }

}
    800073ac:	02813083          	ld	ra,40(sp)
    800073b0:	02013403          	ld	s0,32(sp)
    800073b4:	03010113          	addi	sp,sp,48
    800073b8:	00008067          	ret

00000000800073bc <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800073bc:	fe010113          	addi	sp,sp,-32
    800073c0:	00113c23          	sd	ra,24(sp)
    800073c4:	00813823          	sd	s0,16(sp)
    800073c8:	00913423          	sd	s1,8(sp)
    800073cc:	01213023          	sd	s2,0(sp)
    800073d0:	02010413          	addi	s0,sp,32
    800073d4:	00050493          	mv	s1,a0
    800073d8:	00058913          	mv	s2,a1
    800073dc:	0015879b          	addiw	a5,a1,1
    800073e0:	0007851b          	sext.w	a0,a5
    800073e4:	00f4a023          	sw	a5,0(s1)
    800073e8:	0004a823          	sw	zero,16(s1)
    800073ec:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800073f0:	00251513          	slli	a0,a0,0x2
    800073f4:	ffffa097          	auipc	ra,0xffffa
    800073f8:	fa0080e7          	jalr	-96(ra) # 80001394 <_Z9mem_allocm>
    800073fc:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80007400:	00000593          	li	a1,0
    80007404:	02048513          	addi	a0,s1,32
    80007408:	ffffa097          	auipc	ra,0xffffa
    8000740c:	130080e7          	jalr	304(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80007410:	00090593          	mv	a1,s2
    80007414:	01848513          	addi	a0,s1,24
    80007418:	ffffa097          	auipc	ra,0xffffa
    8000741c:	120080e7          	jalr	288(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80007420:	00100593          	li	a1,1
    80007424:	02848513          	addi	a0,s1,40
    80007428:	ffffa097          	auipc	ra,0xffffa
    8000742c:	110080e7          	jalr	272(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80007430:	00100593          	li	a1,1
    80007434:	03048513          	addi	a0,s1,48
    80007438:	ffffa097          	auipc	ra,0xffffa
    8000743c:	100080e7          	jalr	256(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    80007440:	01813083          	ld	ra,24(sp)
    80007444:	01013403          	ld	s0,16(sp)
    80007448:	00813483          	ld	s1,8(sp)
    8000744c:	00013903          	ld	s2,0(sp)
    80007450:	02010113          	addi	sp,sp,32
    80007454:	00008067          	ret

0000000080007458 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80007458:	fe010113          	addi	sp,sp,-32
    8000745c:	00113c23          	sd	ra,24(sp)
    80007460:	00813823          	sd	s0,16(sp)
    80007464:	00913423          	sd	s1,8(sp)
    80007468:	01213023          	sd	s2,0(sp)
    8000746c:	02010413          	addi	s0,sp,32
    80007470:	00050493          	mv	s1,a0
    80007474:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80007478:	01853503          	ld	a0,24(a0)
    8000747c:	ffffa097          	auipc	ra,0xffffa
    80007480:	124080e7          	jalr	292(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80007484:	0304b503          	ld	a0,48(s1)
    80007488:	ffffa097          	auipc	ra,0xffffa
    8000748c:	118080e7          	jalr	280(ra) # 800015a0 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80007490:	0084b783          	ld	a5,8(s1)
    80007494:	0144a703          	lw	a4,20(s1)
    80007498:	00271713          	slli	a4,a4,0x2
    8000749c:	00e787b3          	add	a5,a5,a4
    800074a0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800074a4:	0144a783          	lw	a5,20(s1)
    800074a8:	0017879b          	addiw	a5,a5,1
    800074ac:	0004a703          	lw	a4,0(s1)
    800074b0:	02e7e7bb          	remw	a5,a5,a4
    800074b4:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800074b8:	0304b503          	ld	a0,48(s1)
    800074bc:	ffffa097          	auipc	ra,0xffffa
    800074c0:	114080e7          	jalr	276(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    800074c4:	0204b503          	ld	a0,32(s1)
    800074c8:	ffffa097          	auipc	ra,0xffffa
    800074cc:	108080e7          	jalr	264(ra) # 800015d0 <_Z10sem_signalP4KSem>

}
    800074d0:	01813083          	ld	ra,24(sp)
    800074d4:	01013403          	ld	s0,16(sp)
    800074d8:	00813483          	ld	s1,8(sp)
    800074dc:	00013903          	ld	s2,0(sp)
    800074e0:	02010113          	addi	sp,sp,32
    800074e4:	00008067          	ret

00000000800074e8 <_ZN6Buffer3getEv>:

int Buffer::get() {
    800074e8:	fe010113          	addi	sp,sp,-32
    800074ec:	00113c23          	sd	ra,24(sp)
    800074f0:	00813823          	sd	s0,16(sp)
    800074f4:	00913423          	sd	s1,8(sp)
    800074f8:	01213023          	sd	s2,0(sp)
    800074fc:	02010413          	addi	s0,sp,32
    80007500:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80007504:	02053503          	ld	a0,32(a0)
    80007508:	ffffa097          	auipc	ra,0xffffa
    8000750c:	098080e7          	jalr	152(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80007510:	0284b503          	ld	a0,40(s1)
    80007514:	ffffa097          	auipc	ra,0xffffa
    80007518:	08c080e7          	jalr	140(ra) # 800015a0 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    8000751c:	0084b703          	ld	a4,8(s1)
    80007520:	0104a783          	lw	a5,16(s1)
    80007524:	00279693          	slli	a3,a5,0x2
    80007528:	00d70733          	add	a4,a4,a3
    8000752c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80007530:	0017879b          	addiw	a5,a5,1
    80007534:	0004a703          	lw	a4,0(s1)
    80007538:	02e7e7bb          	remw	a5,a5,a4
    8000753c:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80007540:	0284b503          	ld	a0,40(s1)
    80007544:	ffffa097          	auipc	ra,0xffffa
    80007548:	08c080e7          	jalr	140(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    8000754c:	0184b503          	ld	a0,24(s1)
    80007550:	ffffa097          	auipc	ra,0xffffa
    80007554:	080080e7          	jalr	128(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    80007558:	00090513          	mv	a0,s2
    8000755c:	01813083          	ld	ra,24(sp)
    80007560:	01013403          	ld	s0,16(sp)
    80007564:	00813483          	ld	s1,8(sp)
    80007568:	00013903          	ld	s2,0(sp)
    8000756c:	02010113          	addi	sp,sp,32
    80007570:	00008067          	ret

0000000080007574 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80007574:	fe010113          	addi	sp,sp,-32
    80007578:	00113c23          	sd	ra,24(sp)
    8000757c:	00813823          	sd	s0,16(sp)
    80007580:	00913423          	sd	s1,8(sp)
    80007584:	01213023          	sd	s2,0(sp)
    80007588:	02010413          	addi	s0,sp,32
    8000758c:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80007590:	02853503          	ld	a0,40(a0)
    80007594:	ffffa097          	auipc	ra,0xffffa
    80007598:	00c080e7          	jalr	12(ra) # 800015a0 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    8000759c:	0304b503          	ld	a0,48(s1)
    800075a0:	ffffa097          	auipc	ra,0xffffa
    800075a4:	000080e7          	jalr	ra # 800015a0 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    800075a8:	0144a783          	lw	a5,20(s1)
    800075ac:	0104a903          	lw	s2,16(s1)
    800075b0:	0327ce63          	blt	a5,s2,800075ec <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800075b4:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800075b8:	0304b503          	ld	a0,48(s1)
    800075bc:	ffffa097          	auipc	ra,0xffffa
    800075c0:	014080e7          	jalr	20(ra) # 800015d0 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    800075c4:	0284b503          	ld	a0,40(s1)
    800075c8:	ffffa097          	auipc	ra,0xffffa
    800075cc:	008080e7          	jalr	8(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    800075d0:	00090513          	mv	a0,s2
    800075d4:	01813083          	ld	ra,24(sp)
    800075d8:	01013403          	ld	s0,16(sp)
    800075dc:	00813483          	ld	s1,8(sp)
    800075e0:	00013903          	ld	s2,0(sp)
    800075e4:	02010113          	addi	sp,sp,32
    800075e8:	00008067          	ret
        ret = cap - head + tail;
    800075ec:	0004a703          	lw	a4,0(s1)
    800075f0:	4127093b          	subw	s2,a4,s2
    800075f4:	00f9093b          	addw	s2,s2,a5
    800075f8:	fc1ff06f          	j	800075b8 <_ZN6Buffer6getCntEv+0x44>

00000000800075fc <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    800075fc:	fe010113          	addi	sp,sp,-32
    80007600:	00113c23          	sd	ra,24(sp)
    80007604:	00813823          	sd	s0,16(sp)
    80007608:	00913423          	sd	s1,8(sp)
    8000760c:	02010413          	addi	s0,sp,32
    80007610:	00050493          	mv	s1,a0
    putc('\n');
    80007614:	00a00513          	li	a0,10
    80007618:	ffffa097          	auipc	ra,0xffffa
    8000761c:	010080e7          	jalr	16(ra) # 80001628 <_Z4putcc>
    printString("Buffer deleted!\n");
    80007620:	00003517          	auipc	a0,0x3
    80007624:	ee050513          	addi	a0,a0,-288 # 8000a500 <CONSOLE_STATUS+0x4f0>
    80007628:	fffff097          	auipc	ra,0xfffff
    8000762c:	e64080e7          	jalr	-412(ra) # 8000648c <_Z11printStringPKc>
    while (getCnt() > 0) {
    80007630:	00048513          	mv	a0,s1
    80007634:	00000097          	auipc	ra,0x0
    80007638:	f40080e7          	jalr	-192(ra) # 80007574 <_ZN6Buffer6getCntEv>
    8000763c:	02a05c63          	blez	a0,80007674 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80007640:	0084b783          	ld	a5,8(s1)
    80007644:	0104a703          	lw	a4,16(s1)
    80007648:	00271713          	slli	a4,a4,0x2
    8000764c:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80007650:	0007c503          	lbu	a0,0(a5)
    80007654:	ffffa097          	auipc	ra,0xffffa
    80007658:	fd4080e7          	jalr	-44(ra) # 80001628 <_Z4putcc>
        head = (head + 1) % cap;
    8000765c:	0104a783          	lw	a5,16(s1)
    80007660:	0017879b          	addiw	a5,a5,1
    80007664:	0004a703          	lw	a4,0(s1)
    80007668:	02e7e7bb          	remw	a5,a5,a4
    8000766c:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80007670:	fc1ff06f          	j	80007630 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80007674:	02100513          	li	a0,33
    80007678:	ffffa097          	auipc	ra,0xffffa
    8000767c:	fb0080e7          	jalr	-80(ra) # 80001628 <_Z4putcc>
    putc('\n');
    80007680:	00a00513          	li	a0,10
    80007684:	ffffa097          	auipc	ra,0xffffa
    80007688:	fa4080e7          	jalr	-92(ra) # 80001628 <_Z4putcc>
    mem_free(buffer);
    8000768c:	0084b503          	ld	a0,8(s1)
    80007690:	ffffa097          	auipc	ra,0xffffa
    80007694:	d44080e7          	jalr	-700(ra) # 800013d4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80007698:	0204b503          	ld	a0,32(s1)
    8000769c:	ffffa097          	auipc	ra,0xffffa
    800076a0:	ed4080e7          	jalr	-300(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    800076a4:	0184b503          	ld	a0,24(s1)
    800076a8:	ffffa097          	auipc	ra,0xffffa
    800076ac:	ec8080e7          	jalr	-312(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    800076b0:	0304b503          	ld	a0,48(s1)
    800076b4:	ffffa097          	auipc	ra,0xffffa
    800076b8:	ebc080e7          	jalr	-324(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    800076bc:	0284b503          	ld	a0,40(s1)
    800076c0:	ffffa097          	auipc	ra,0xffffa
    800076c4:	eb0080e7          	jalr	-336(ra) # 80001570 <_Z9sem_closeP4KSem>
}
    800076c8:	01813083          	ld	ra,24(sp)
    800076cc:	01013403          	ld	s0,16(sp)
    800076d0:	00813483          	ld	s1,8(sp)
    800076d4:	02010113          	addi	sp,sp,32
    800076d8:	00008067          	ret

00000000800076dc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    800076dc:	fa010113          	addi	sp,sp,-96
    800076e0:	04813c23          	sd	s0,88(sp)
    800076e4:	06010413          	addi	s0,sp,96
    800076e8:	faa43423          	sd	a0,-88(s0)
    800076ec:	00058793          	mv	a5,a1
    800076f0:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    800076f4:	fa843783          	ld	a5,-88(s0)
    800076f8:	00079663          	bnez	a5,80007704 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    800076fc:	00000793          	li	a5,0
    80007700:	2040006f          	j	80007904 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80007704:	fa843783          	ld	a5,-88(s0)
    80007708:	0067d713          	srli	a4,a5,0x6
    8000770c:	fa843783          	ld	a5,-88(s0)
    80007710:	03f7f793          	andi	a5,a5,63
    80007714:	00078663          	beqz	a5,80007720 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80007718:	00100793          	li	a5,1
    8000771c:	0080006f          	j	80007724 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80007720:	00000793          	li	a5,0
    80007724:	00e787b3          	add	a5,a5,a4
    80007728:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    8000772c:	fc843783          	ld	a5,-56(s0)
    80007730:	00679793          	slli	a5,a5,0x6
    80007734:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    80007738:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    8000773c:	00006797          	auipc	a5,0x6
    80007740:	c0478793          	addi	a5,a5,-1020 # 8000d340 <_ZN15MemoryAllocator11freeMemHeadE>
    80007744:	0007b783          	ld	a5,0(a5)
    80007748:	fef43023          	sd	a5,-32(s0)
    8000774c:	fe043783          	ld	a5,-32(s0)
    80007750:	1a078863          	beqz	a5,80007900 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    80007754:	fe043783          	ld	a5,-32(s0)
    80007758:	0087b783          	ld	a5,8(a5)
    8000775c:	fa843703          	ld	a4,-88(s0)
    80007760:	18e7e263          	bltu	a5,a4,800078e4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    80007764:	fe043703          	ld	a4,-32(s0)
    80007768:	fa843783          	ld	a5,-88(s0)
    8000776c:	00f707b3          	add	a5,a4,a5
    80007770:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    80007774:	fe043783          	ld	a5,-32(s0)
    80007778:	0087b703          	ld	a4,8(a5)
    8000777c:	fa843783          	ld	a5,-88(s0)
    80007780:	40f707b3          	sub	a5,a4,a5
    80007784:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80007788:	fb843703          	ld	a4,-72(s0)
    8000778c:	02000793          	li	a5,32
    80007790:	04e7e463          	bltu	a5,a4,800077d8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    80007794:	fa843703          	ld	a4,-88(s0)
    80007798:	fb843783          	ld	a5,-72(s0)
    8000779c:	00f707b3          	add	a5,a4,a5
    800077a0:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    800077a4:	fe843783          	ld	a5,-24(s0)
    800077a8:	00078c63          	beqz	a5,800077c0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    800077ac:	fe043783          	ld	a5,-32(s0)
    800077b0:	0007b703          	ld	a4,0(a5)
    800077b4:	fe843783          	ld	a5,-24(s0)
    800077b8:	00e7b023          	sd	a4,0(a5)
    800077bc:	0600006f          	j	8000781c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    800077c0:	fe043783          	ld	a5,-32(s0)
    800077c4:	0007b703          	ld	a4,0(a5)
    800077c8:	00006797          	auipc	a5,0x6
    800077cc:	b7878793          	addi	a5,a5,-1160 # 8000d340 <_ZN15MemoryAllocator11freeMemHeadE>
    800077d0:	00e7b023          	sd	a4,0(a5)
    800077d4:	0480006f          	j	8000781c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    800077d8:	fc043783          	ld	a5,-64(s0)
    800077dc:	fb843703          	ld	a4,-72(s0)
    800077e0:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    800077e4:	fe043783          	ld	a5,-32(s0)
    800077e8:	0007b703          	ld	a4,0(a5)
    800077ec:	fc043783          	ld	a5,-64(s0)
    800077f0:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    800077f4:	fe843783          	ld	a5,-24(s0)
    800077f8:	00078a63          	beqz	a5,8000780c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    800077fc:	fe843783          	ld	a5,-24(s0)
    80007800:	fc043703          	ld	a4,-64(s0)
    80007804:	00e7b023          	sd	a4,0(a5)
    80007808:	0140006f          	j	8000781c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    8000780c:	00006797          	auipc	a5,0x6
    80007810:	b3478793          	addi	a5,a5,-1228 # 8000d340 <_ZN15MemoryAllocator11freeMemHeadE>
    80007814:	fc043703          	ld	a4,-64(s0)
    80007818:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    8000781c:	fe043783          	ld	a5,-32(s0)
    80007820:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    80007824:	fb043783          	ld	a5,-80(s0)
    80007828:	fa843703          	ld	a4,-88(s0)
    8000782c:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    80007830:	fb043783          	ld	a5,-80(s0)
    80007834:	fa442703          	lw	a4,-92(s0)
    80007838:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    8000783c:	fb043783          	ld	a5,-80(s0)
    80007840:	02078713          	addi	a4,a5,32
    80007844:	fb043783          	ld	a5,-80(s0)
    80007848:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    8000784c:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80007850:	00006797          	auipc	a5,0x6
    80007854:	ae878793          	addi	a5,a5,-1304 # 8000d338 <_ZN15MemoryAllocator11usedMemHeadE>
    80007858:	0007b783          	ld	a5,0(a5)
    8000785c:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80007860:	fd043783          	ld	a5,-48(s0)
    80007864:	02078463          	beqz	a5,8000788c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    80007868:	fd043703          	ld	a4,-48(s0)
    8000786c:	fb043783          	ld	a5,-80(s0)
    80007870:	00f77e63          	bgeu	a4,a5,8000788c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    80007874:	fd043783          	ld	a5,-48(s0)
    80007878:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    8000787c:	fd043783          	ld	a5,-48(s0)
    80007880:	0007b783          	ld	a5,0(a5)
    80007884:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80007888:	fd9ff06f          	j	80007860 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    8000788c:	fd843783          	ld	a5,-40(s0)
    80007890:	02079663          	bnez	a5,800078bc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    80007894:	00006797          	auipc	a5,0x6
    80007898:	aa478793          	addi	a5,a5,-1372 # 8000d338 <_ZN15MemoryAllocator11usedMemHeadE>
    8000789c:	0007b703          	ld	a4,0(a5)
    800078a0:	fb043783          	ld	a5,-80(s0)
    800078a4:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    800078a8:	00006797          	auipc	a5,0x6
    800078ac:	a9078793          	addi	a5,a5,-1392 # 8000d338 <_ZN15MemoryAllocator11usedMemHeadE>
    800078b0:	fb043703          	ld	a4,-80(s0)
    800078b4:	00e7b023          	sd	a4,0(a5)
    800078b8:	0200006f          	j	800078d8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    800078bc:	fd843783          	ld	a5,-40(s0)
    800078c0:	0007b703          	ld	a4,0(a5)
    800078c4:	fb043783          	ld	a5,-80(s0)
    800078c8:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    800078cc:	fd843783          	ld	a5,-40(s0)
    800078d0:	fb043703          	ld	a4,-80(s0)
    800078d4:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    800078d8:	fb043783          	ld	a5,-80(s0)
    800078dc:	0187b783          	ld	a5,24(a5)
    800078e0:	0240006f          	j	80007904 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    800078e4:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    800078e8:	fe043783          	ld	a5,-32(s0)
    800078ec:	fef43423          	sd	a5,-24(s0)
    800078f0:	fe043783          	ld	a5,-32(s0)
    800078f4:	0007b783          	ld	a5,0(a5)
    800078f8:	fef43023          	sd	a5,-32(s0)
    800078fc:	e51ff06f          	j	8000774c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    80007900:	00000793          	li	a5,0
}
    80007904:	00078513          	mv	a0,a5
    80007908:	05813403          	ld	s0,88(sp)
    8000790c:	06010113          	addi	sp,sp,96
    80007910:	00008067          	ret

0000000080007914 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80007914:	fb010113          	addi	sp,sp,-80
    80007918:	04113423          	sd	ra,72(sp)
    8000791c:	04813023          	sd	s0,64(sp)
    80007920:	05010413          	addi	s0,sp,80
    80007924:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    80007928:	fb843783          	ld	a5,-72(s0)
    8000792c:	00079663          	bnez	a5,80007938 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    80007930:	00000793          	li	a5,0
    80007934:	1740006f          	j	80007aa8 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    80007938:	00006797          	auipc	a5,0x6
    8000793c:	a0078793          	addi	a5,a5,-1536 # 8000d338 <_ZN15MemoryAllocator11usedMemHeadE>
    80007940:	0007b783          	ld	a5,0(a5)
    80007944:	00079663          	bnez	a5,80007950 <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    80007948:	fff00793          	li	a5,-1
    8000794c:	15c0006f          	j	80007aa8 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80007950:	fb843783          	ld	a5,-72(s0)
    80007954:	fe078793          	addi	a5,a5,-32
    80007958:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    8000795c:	00006797          	auipc	a5,0x6
    80007960:	9dc78793          	addi	a5,a5,-1572 # 8000d338 <_ZN15MemoryAllocator11usedMemHeadE>
    80007964:	0007b783          	ld	a5,0(a5)
    80007968:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    8000796c:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80007970:	fe843783          	ld	a5,-24(s0)
    80007974:	02078463          	beqz	a5,8000799c <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80007978:	fe843703          	ld	a4,-24(s0)
    8000797c:	fb843783          	ld	a5,-72(s0)
    80007980:	00f70e63          	beq	a4,a5,8000799c <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    80007984:	fe843783          	ld	a5,-24(s0)
    80007988:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    8000798c:	fe843783          	ld	a5,-24(s0)
    80007990:	0007b783          	ld	a5,0(a5)
    80007994:	fef43423          	sd	a5,-24(s0)
    80007998:	fd9ff06f          	j	80007970 <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    8000799c:	fe843703          	ld	a4,-24(s0)
    800079a0:	fb843783          	ld	a5,-72(s0)
    800079a4:	00f70663          	beq	a4,a5,800079b0 <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    800079a8:	fff00793          	li	a5,-1
    800079ac:	0fc0006f          	j	80007aa8 <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    800079b0:	fe043783          	ld	a5,-32(s0)
    800079b4:	00078c63          	beqz	a5,800079cc <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    800079b8:	fe843783          	ld	a5,-24(s0)
    800079bc:	0007b703          	ld	a4,0(a5)
    800079c0:	fe043783          	ld	a5,-32(s0)
    800079c4:	00e7b023          	sd	a4,0(a5)
    800079c8:	0180006f          	j	800079e0 <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    800079cc:	fe843783          	ld	a5,-24(s0)
    800079d0:	0007b703          	ld	a4,0(a5)
    800079d4:	00006797          	auipc	a5,0x6
    800079d8:	96478793          	addi	a5,a5,-1692 # 8000d338 <_ZN15MemoryAllocator11usedMemHeadE>
    800079dc:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    800079e0:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    800079e4:	00006797          	auipc	a5,0x6
    800079e8:	95c78793          	addi	a5,a5,-1700 # 8000d340 <_ZN15MemoryAllocator11freeMemHeadE>
    800079ec:	0007b783          	ld	a5,0(a5)
    800079f0:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    800079f4:	fd043783          	ld	a5,-48(s0)
    800079f8:	02078463          	beqz	a5,80007a20 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    800079fc:	fd043703          	ld	a4,-48(s0)
    80007a00:	fb843783          	ld	a5,-72(s0)
    80007a04:	00f77e63          	bgeu	a4,a5,80007a20 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80007a08:	fd043783          	ld	a5,-48(s0)
    80007a0c:	fcf43c23          	sd	a5,-40(s0)
    80007a10:	fd043783          	ld	a5,-48(s0)
    80007a14:	0007b783          	ld	a5,0(a5)
    80007a18:	fcf43823          	sd	a5,-48(s0)
    80007a1c:	fd9ff06f          	j	800079f4 <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    80007a20:	fb843783          	ld	a5,-72(s0)
    80007a24:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    80007a28:	fb843783          	ld	a5,-72(s0)
    80007a2c:	0087b783          	ld	a5,8(a5)
    80007a30:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    80007a34:	fc843783          	ld	a5,-56(s0)
    80007a38:	fc043703          	ld	a4,-64(s0)
    80007a3c:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    80007a40:	fd843783          	ld	a5,-40(s0)
    80007a44:	02078263          	beqz	a5,80007a68 <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    80007a48:	fd843783          	ld	a5,-40(s0)
    80007a4c:	0007b703          	ld	a4,0(a5)
    80007a50:	fc843783          	ld	a5,-56(s0)
    80007a54:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    80007a58:	fd843783          	ld	a5,-40(s0)
    80007a5c:	fc843703          	ld	a4,-56(s0)
    80007a60:	00e7b023          	sd	a4,0(a5)
    80007a64:	0280006f          	j	80007a8c <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    80007a68:	00006797          	auipc	a5,0x6
    80007a6c:	8d878793          	addi	a5,a5,-1832 # 8000d340 <_ZN15MemoryAllocator11freeMemHeadE>
    80007a70:	0007b703          	ld	a4,0(a5)
    80007a74:	fc843783          	ld	a5,-56(s0)
    80007a78:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    80007a7c:	00006797          	auipc	a5,0x6
    80007a80:	8c478793          	addi	a5,a5,-1852 # 8000d340 <_ZN15MemoryAllocator11freeMemHeadE>
    80007a84:	fc843703          	ld	a4,-56(s0)
    80007a88:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    80007a8c:	fc843503          	ld	a0,-56(s0)
    80007a90:	00000097          	auipc	ra,0x0
    80007a94:	02c080e7          	jalr	44(ra) # 80007abc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    80007a98:	fd843503          	ld	a0,-40(s0)
    80007a9c:	00000097          	auipc	ra,0x0
    80007aa0:	020080e7          	jalr	32(ra) # 80007abc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    80007aa4:	00000793          	li	a5,0
}
    80007aa8:	00078513          	mv	a0,a5
    80007aac:	04813083          	ld	ra,72(sp)
    80007ab0:	04013403          	ld	s0,64(sp)
    80007ab4:	05010113          	addi	sp,sp,80
    80007ab8:	00008067          	ret

0000000080007abc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80007abc:	fc010113          	addi	sp,sp,-64
    80007ac0:	02813c23          	sd	s0,56(sp)
    80007ac4:	04010413          	addi	s0,sp,64
    80007ac8:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    80007acc:	fc843783          	ld	a5,-56(s0)
    80007ad0:	00079663          	bnez	a5,80007adc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    80007ad4:	00000793          	li	a5,0
    80007ad8:	0a00006f          	j	80007b78 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    80007adc:	fc843783          	ld	a5,-56(s0)
    80007ae0:	0007b783          	ld	a5,0(a5)
    80007ae4:	00f037b3          	snez	a5,a5
    80007ae8:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    80007aec:	fc843783          	ld	a5,-56(s0)
    80007af0:	0087b783          	ld	a5,8(a5)
    80007af4:	fc843703          	ld	a4,-56(s0)
    80007af8:	00f707b3          	add	a5,a4,a5
    80007afc:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    80007b00:	fc843783          	ld	a5,-56(s0)
    80007b04:	0007b783          	ld	a5,0(a5)
    80007b08:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    80007b0c:	fe043703          	ld	a4,-32(s0)
    80007b10:	fd843783          	ld	a5,-40(s0)
    80007b14:	40f707b3          	sub	a5,a4,a5
    80007b18:	0017b793          	seqz	a5,a5
    80007b1c:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    80007b20:	fef44783          	lbu	a5,-17(s0)
    80007b24:	0ff7f793          	andi	a5,a5,255
    80007b28:	04078663          	beqz	a5,80007b74 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    80007b2c:	fd744783          	lbu	a5,-41(s0)
    80007b30:	0ff7f793          	andi	a5,a5,255
    80007b34:	04078063          	beqz	a5,80007b74 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    80007b38:	fc843783          	ld	a5,-56(s0)
    80007b3c:	0087b703          	ld	a4,8(a5)
    80007b40:	fc843783          	ld	a5,-56(s0)
    80007b44:	0007b783          	ld	a5,0(a5)
    80007b48:	0087b783          	ld	a5,8(a5)
    80007b4c:	00f70733          	add	a4,a4,a5
    80007b50:	fc843783          	ld	a5,-56(s0)
    80007b54:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    80007b58:	fc843783          	ld	a5,-56(s0)
    80007b5c:	0007b783          	ld	a5,0(a5)
    80007b60:	0007b703          	ld	a4,0(a5)
    80007b64:	fc843783          	ld	a5,-56(s0)
    80007b68:	00e7b023          	sd	a4,0(a5)
        return 1;
    80007b6c:	00100793          	li	a5,1
    80007b70:	0080006f          	j	80007b78 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    80007b74:	00000793          	li	a5,0
}
    80007b78:	00078513          	mv	a0,a5
    80007b7c:	03813403          	ld	s0,56(sp)
    80007b80:	04010113          	addi	sp,sp,64
    80007b84:	00008067          	ret

0000000080007b88 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80007b88:	fe010113          	addi	sp,sp,-32
    80007b8c:	00813c23          	sd	s0,24(sp)
    80007b90:	02010413          	addi	s0,sp,32
    80007b94:	fea43423          	sd	a0,-24(s0)
    80007b98:	00058793          	mv	a5,a1
    80007b9c:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80007ba0:	fe843783          	ld	a5,-24(s0)
    80007ba4:	fe078793          	addi	a5,a5,-32
    80007ba8:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    80007bac:	fe843783          	ld	a5,-24(s0)
    80007bb0:	0107a703          	lw	a4,16(a5)
    80007bb4:	fe442783          	lw	a5,-28(s0)
    80007bb8:	0007879b          	sext.w	a5,a5
    80007bbc:	40e787b3          	sub	a5,a5,a4
    80007bc0:	0017b793          	seqz	a5,a5
    80007bc4:	0ff7f793          	andi	a5,a5,255
}
    80007bc8:	00078513          	mv	a0,a5
    80007bcc:	01813403          	ld	s0,24(sp)
    80007bd0:	02010113          	addi	sp,sp,32
    80007bd4:	00008067          	ret

0000000080007bd8 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    80007bd8:	ff010113          	addi	sp,sp,-16
    80007bdc:	00813423          	sd	s0,8(sp)
    80007be0:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    80007be4:	00005797          	auipc	a5,0x5
    80007be8:	76478793          	addi	a5,a5,1892 # 8000d348 <_ZN15MemoryAllocator11initializedE>
    80007bec:	0007c783          	lbu	a5,0(a5)
    80007bf0:	0017c793          	xori	a5,a5,1
    80007bf4:	0ff7f793          	andi	a5,a5,255
    80007bf8:	06078a63          	beqz	a5,80007c6c <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    80007bfc:	00005797          	auipc	a5,0x5
    80007c00:	4fc7b783          	ld	a5,1276(a5) # 8000d0f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80007c04:	0007b703          	ld	a4,0(a5)
    80007c08:	00005797          	auipc	a5,0x5
    80007c0c:	73878793          	addi	a5,a5,1848 # 8000d340 <_ZN15MemoryAllocator11freeMemHeadE>
    80007c10:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    80007c14:	00005797          	auipc	a5,0x5
    80007c18:	72c78793          	addi	a5,a5,1836 # 8000d340 <_ZN15MemoryAllocator11freeMemHeadE>
    80007c1c:	0007b783          	ld	a5,0(a5)
    80007c20:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    80007c24:	00005797          	auipc	a5,0x5
    80007c28:	52c7b783          	ld	a5,1324(a5) # 8000d150 <_GLOBAL_OFFSET_TABLE_+0x88>
    80007c2c:	0007b703          	ld	a4,0(a5)
    80007c30:	00005797          	auipc	a5,0x5
    80007c34:	4c87b783          	ld	a5,1224(a5) # 8000d0f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80007c38:	0007b783          	ld	a5,0(a5)
    80007c3c:	40f70733          	sub	a4,a4,a5
    80007c40:	00005797          	auipc	a5,0x5
    80007c44:	70078793          	addi	a5,a5,1792 # 8000d340 <_ZN15MemoryAllocator11freeMemHeadE>
    80007c48:	0007b783          	ld	a5,0(a5)
    80007c4c:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    80007c50:	00005797          	auipc	a5,0x5
    80007c54:	6e878793          	addi	a5,a5,1768 # 8000d338 <_ZN15MemoryAllocator11usedMemHeadE>
    80007c58:	0007b023          	sd	zero,0(a5)

        initialized = true;
    80007c5c:	00005797          	auipc	a5,0x5
    80007c60:	6ec78793          	addi	a5,a5,1772 # 8000d348 <_ZN15MemoryAllocator11initializedE>
    80007c64:	00100713          	li	a4,1
    80007c68:	00e78023          	sb	a4,0(a5)
    }
}
    80007c6c:	00000013          	nop
    80007c70:	00813403          	ld	s0,8(sp)
    80007c74:	01010113          	addi	sp,sp,16
    80007c78:	00008067          	ret

0000000080007c7c <start>:
    80007c7c:	ff010113          	addi	sp,sp,-16
    80007c80:	00813423          	sd	s0,8(sp)
    80007c84:	01010413          	addi	s0,sp,16
    80007c88:	300027f3          	csrr	a5,mstatus
    80007c8c:	ffffe737          	lui	a4,0xffffe
    80007c90:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff024f>
    80007c94:	00e7f7b3          	and	a5,a5,a4
    80007c98:	00001737          	lui	a4,0x1
    80007c9c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80007ca0:	00e7e7b3          	or	a5,a5,a4
    80007ca4:	30079073          	csrw	mstatus,a5
    80007ca8:	00000797          	auipc	a5,0x0
    80007cac:	16078793          	addi	a5,a5,352 # 80007e08 <system_main>
    80007cb0:	34179073          	csrw	mepc,a5
    80007cb4:	00000793          	li	a5,0
    80007cb8:	18079073          	csrw	satp,a5
    80007cbc:	000107b7          	lui	a5,0x10
    80007cc0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007cc4:	30279073          	csrw	medeleg,a5
    80007cc8:	30379073          	csrw	mideleg,a5
    80007ccc:	104027f3          	csrr	a5,sie
    80007cd0:	2227e793          	ori	a5,a5,546
    80007cd4:	10479073          	csrw	sie,a5
    80007cd8:	fff00793          	li	a5,-1
    80007cdc:	00a7d793          	srli	a5,a5,0xa
    80007ce0:	3b079073          	csrw	pmpaddr0,a5
    80007ce4:	00f00793          	li	a5,15
    80007ce8:	3a079073          	csrw	pmpcfg0,a5
    80007cec:	f14027f3          	csrr	a5,mhartid
    80007cf0:	0200c737          	lui	a4,0x200c
    80007cf4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007cf8:	0007869b          	sext.w	a3,a5
    80007cfc:	00269713          	slli	a4,a3,0x2
    80007d00:	000f4637          	lui	a2,0xf4
    80007d04:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007d08:	00d70733          	add	a4,a4,a3
    80007d0c:	0037979b          	slliw	a5,a5,0x3
    80007d10:	020046b7          	lui	a3,0x2004
    80007d14:	00d787b3          	add	a5,a5,a3
    80007d18:	00c585b3          	add	a1,a1,a2
    80007d1c:	00371693          	slli	a3,a4,0x3
    80007d20:	00005717          	auipc	a4,0x5
    80007d24:	63070713          	addi	a4,a4,1584 # 8000d350 <timer_scratch>
    80007d28:	00b7b023          	sd	a1,0(a5)
    80007d2c:	00d70733          	add	a4,a4,a3
    80007d30:	00f73c23          	sd	a5,24(a4)
    80007d34:	02c73023          	sd	a2,32(a4)
    80007d38:	34071073          	csrw	mscratch,a4
    80007d3c:	00000797          	auipc	a5,0x0
    80007d40:	6e478793          	addi	a5,a5,1764 # 80008420 <timervec>
    80007d44:	30579073          	csrw	mtvec,a5
    80007d48:	300027f3          	csrr	a5,mstatus
    80007d4c:	0087e793          	ori	a5,a5,8
    80007d50:	30079073          	csrw	mstatus,a5
    80007d54:	304027f3          	csrr	a5,mie
    80007d58:	0807e793          	ori	a5,a5,128
    80007d5c:	30479073          	csrw	mie,a5
    80007d60:	f14027f3          	csrr	a5,mhartid
    80007d64:	0007879b          	sext.w	a5,a5
    80007d68:	00078213          	mv	tp,a5
    80007d6c:	30200073          	mret
    80007d70:	00813403          	ld	s0,8(sp)
    80007d74:	01010113          	addi	sp,sp,16
    80007d78:	00008067          	ret

0000000080007d7c <timerinit>:
    80007d7c:	ff010113          	addi	sp,sp,-16
    80007d80:	00813423          	sd	s0,8(sp)
    80007d84:	01010413          	addi	s0,sp,16
    80007d88:	f14027f3          	csrr	a5,mhartid
    80007d8c:	0200c737          	lui	a4,0x200c
    80007d90:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007d94:	0007869b          	sext.w	a3,a5
    80007d98:	00269713          	slli	a4,a3,0x2
    80007d9c:	000f4637          	lui	a2,0xf4
    80007da0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007da4:	00d70733          	add	a4,a4,a3
    80007da8:	0037979b          	slliw	a5,a5,0x3
    80007dac:	020046b7          	lui	a3,0x2004
    80007db0:	00d787b3          	add	a5,a5,a3
    80007db4:	00c585b3          	add	a1,a1,a2
    80007db8:	00371693          	slli	a3,a4,0x3
    80007dbc:	00005717          	auipc	a4,0x5
    80007dc0:	59470713          	addi	a4,a4,1428 # 8000d350 <timer_scratch>
    80007dc4:	00b7b023          	sd	a1,0(a5)
    80007dc8:	00d70733          	add	a4,a4,a3
    80007dcc:	00f73c23          	sd	a5,24(a4)
    80007dd0:	02c73023          	sd	a2,32(a4)
    80007dd4:	34071073          	csrw	mscratch,a4
    80007dd8:	00000797          	auipc	a5,0x0
    80007ddc:	64878793          	addi	a5,a5,1608 # 80008420 <timervec>
    80007de0:	30579073          	csrw	mtvec,a5
    80007de4:	300027f3          	csrr	a5,mstatus
    80007de8:	0087e793          	ori	a5,a5,8
    80007dec:	30079073          	csrw	mstatus,a5
    80007df0:	304027f3          	csrr	a5,mie
    80007df4:	0807e793          	ori	a5,a5,128
    80007df8:	30479073          	csrw	mie,a5
    80007dfc:	00813403          	ld	s0,8(sp)
    80007e00:	01010113          	addi	sp,sp,16
    80007e04:	00008067          	ret

0000000080007e08 <system_main>:
    80007e08:	fe010113          	addi	sp,sp,-32
    80007e0c:	00813823          	sd	s0,16(sp)
    80007e10:	00913423          	sd	s1,8(sp)
    80007e14:	00113c23          	sd	ra,24(sp)
    80007e18:	02010413          	addi	s0,sp,32
    80007e1c:	00000097          	auipc	ra,0x0
    80007e20:	0c4080e7          	jalr	196(ra) # 80007ee0 <cpuid>
    80007e24:	00005497          	auipc	s1,0x5
    80007e28:	36c48493          	addi	s1,s1,876 # 8000d190 <started>
    80007e2c:	02050263          	beqz	a0,80007e50 <system_main+0x48>
    80007e30:	0004a783          	lw	a5,0(s1)
    80007e34:	0007879b          	sext.w	a5,a5
    80007e38:	fe078ce3          	beqz	a5,80007e30 <system_main+0x28>
    80007e3c:	0ff0000f          	fence
    80007e40:	00003517          	auipc	a0,0x3
    80007e44:	99050513          	addi	a0,a0,-1648 # 8000a7d0 <CONSOLE_STATUS+0x7c0>
    80007e48:	00001097          	auipc	ra,0x1
    80007e4c:	a74080e7          	jalr	-1420(ra) # 800088bc <panic>
    80007e50:	00001097          	auipc	ra,0x1
    80007e54:	9c8080e7          	jalr	-1592(ra) # 80008818 <consoleinit>
    80007e58:	00001097          	auipc	ra,0x1
    80007e5c:	154080e7          	jalr	340(ra) # 80008fac <printfinit>
    80007e60:	00002517          	auipc	a0,0x2
    80007e64:	7f850513          	addi	a0,a0,2040 # 8000a658 <CONSOLE_STATUS+0x648>
    80007e68:	00001097          	auipc	ra,0x1
    80007e6c:	ab0080e7          	jalr	-1360(ra) # 80008918 <__printf>
    80007e70:	00003517          	auipc	a0,0x3
    80007e74:	93050513          	addi	a0,a0,-1744 # 8000a7a0 <CONSOLE_STATUS+0x790>
    80007e78:	00001097          	auipc	ra,0x1
    80007e7c:	aa0080e7          	jalr	-1376(ra) # 80008918 <__printf>
    80007e80:	00002517          	auipc	a0,0x2
    80007e84:	7d850513          	addi	a0,a0,2008 # 8000a658 <CONSOLE_STATUS+0x648>
    80007e88:	00001097          	auipc	ra,0x1
    80007e8c:	a90080e7          	jalr	-1392(ra) # 80008918 <__printf>
    80007e90:	00001097          	auipc	ra,0x1
    80007e94:	4a8080e7          	jalr	1192(ra) # 80009338 <kinit>
    80007e98:	00000097          	auipc	ra,0x0
    80007e9c:	148080e7          	jalr	328(ra) # 80007fe0 <trapinit>
    80007ea0:	00000097          	auipc	ra,0x0
    80007ea4:	16c080e7          	jalr	364(ra) # 8000800c <trapinithart>
    80007ea8:	00000097          	auipc	ra,0x0
    80007eac:	5b8080e7          	jalr	1464(ra) # 80008460 <plicinit>
    80007eb0:	00000097          	auipc	ra,0x0
    80007eb4:	5d8080e7          	jalr	1496(ra) # 80008488 <plicinithart>
    80007eb8:	00000097          	auipc	ra,0x0
    80007ebc:	078080e7          	jalr	120(ra) # 80007f30 <userinit>
    80007ec0:	0ff0000f          	fence
    80007ec4:	00100793          	li	a5,1
    80007ec8:	00003517          	auipc	a0,0x3
    80007ecc:	8f050513          	addi	a0,a0,-1808 # 8000a7b8 <CONSOLE_STATUS+0x7a8>
    80007ed0:	00f4a023          	sw	a5,0(s1)
    80007ed4:	00001097          	auipc	ra,0x1
    80007ed8:	a44080e7          	jalr	-1468(ra) # 80008918 <__printf>
    80007edc:	0000006f          	j	80007edc <system_main+0xd4>

0000000080007ee0 <cpuid>:
    80007ee0:	ff010113          	addi	sp,sp,-16
    80007ee4:	00813423          	sd	s0,8(sp)
    80007ee8:	01010413          	addi	s0,sp,16
    80007eec:	00020513          	mv	a0,tp
    80007ef0:	00813403          	ld	s0,8(sp)
    80007ef4:	0005051b          	sext.w	a0,a0
    80007ef8:	01010113          	addi	sp,sp,16
    80007efc:	00008067          	ret

0000000080007f00 <mycpu>:
    80007f00:	ff010113          	addi	sp,sp,-16
    80007f04:	00813423          	sd	s0,8(sp)
    80007f08:	01010413          	addi	s0,sp,16
    80007f0c:	00020793          	mv	a5,tp
    80007f10:	00813403          	ld	s0,8(sp)
    80007f14:	0007879b          	sext.w	a5,a5
    80007f18:	00779793          	slli	a5,a5,0x7
    80007f1c:	00006517          	auipc	a0,0x6
    80007f20:	46450513          	addi	a0,a0,1124 # 8000e380 <cpus>
    80007f24:	00f50533          	add	a0,a0,a5
    80007f28:	01010113          	addi	sp,sp,16
    80007f2c:	00008067          	ret

0000000080007f30 <userinit>:
    80007f30:	ff010113          	addi	sp,sp,-16
    80007f34:	00813423          	sd	s0,8(sp)
    80007f38:	01010413          	addi	s0,sp,16
    80007f3c:	00813403          	ld	s0,8(sp)
    80007f40:	01010113          	addi	sp,sp,16
    80007f44:	ffffa317          	auipc	t1,0xffffa
    80007f48:	49830067          	jr	1176(t1) # 800023dc <main>

0000000080007f4c <either_copyout>:
    80007f4c:	ff010113          	addi	sp,sp,-16
    80007f50:	00813023          	sd	s0,0(sp)
    80007f54:	00113423          	sd	ra,8(sp)
    80007f58:	01010413          	addi	s0,sp,16
    80007f5c:	02051663          	bnez	a0,80007f88 <either_copyout+0x3c>
    80007f60:	00058513          	mv	a0,a1
    80007f64:	00060593          	mv	a1,a2
    80007f68:	0006861b          	sext.w	a2,a3
    80007f6c:	00002097          	auipc	ra,0x2
    80007f70:	c58080e7          	jalr	-936(ra) # 80009bc4 <__memmove>
    80007f74:	00813083          	ld	ra,8(sp)
    80007f78:	00013403          	ld	s0,0(sp)
    80007f7c:	00000513          	li	a0,0
    80007f80:	01010113          	addi	sp,sp,16
    80007f84:	00008067          	ret
    80007f88:	00003517          	auipc	a0,0x3
    80007f8c:	87050513          	addi	a0,a0,-1936 # 8000a7f8 <CONSOLE_STATUS+0x7e8>
    80007f90:	00001097          	auipc	ra,0x1
    80007f94:	92c080e7          	jalr	-1748(ra) # 800088bc <panic>

0000000080007f98 <either_copyin>:
    80007f98:	ff010113          	addi	sp,sp,-16
    80007f9c:	00813023          	sd	s0,0(sp)
    80007fa0:	00113423          	sd	ra,8(sp)
    80007fa4:	01010413          	addi	s0,sp,16
    80007fa8:	02059463          	bnez	a1,80007fd0 <either_copyin+0x38>
    80007fac:	00060593          	mv	a1,a2
    80007fb0:	0006861b          	sext.w	a2,a3
    80007fb4:	00002097          	auipc	ra,0x2
    80007fb8:	c10080e7          	jalr	-1008(ra) # 80009bc4 <__memmove>
    80007fbc:	00813083          	ld	ra,8(sp)
    80007fc0:	00013403          	ld	s0,0(sp)
    80007fc4:	00000513          	li	a0,0
    80007fc8:	01010113          	addi	sp,sp,16
    80007fcc:	00008067          	ret
    80007fd0:	00003517          	auipc	a0,0x3
    80007fd4:	85050513          	addi	a0,a0,-1968 # 8000a820 <CONSOLE_STATUS+0x810>
    80007fd8:	00001097          	auipc	ra,0x1
    80007fdc:	8e4080e7          	jalr	-1820(ra) # 800088bc <panic>

0000000080007fe0 <trapinit>:
    80007fe0:	ff010113          	addi	sp,sp,-16
    80007fe4:	00813423          	sd	s0,8(sp)
    80007fe8:	01010413          	addi	s0,sp,16
    80007fec:	00813403          	ld	s0,8(sp)
    80007ff0:	00003597          	auipc	a1,0x3
    80007ff4:	85858593          	addi	a1,a1,-1960 # 8000a848 <CONSOLE_STATUS+0x838>
    80007ff8:	00006517          	auipc	a0,0x6
    80007ffc:	40850513          	addi	a0,a0,1032 # 8000e400 <tickslock>
    80008000:	01010113          	addi	sp,sp,16
    80008004:	00001317          	auipc	t1,0x1
    80008008:	5c430067          	jr	1476(t1) # 800095c8 <initlock>

000000008000800c <trapinithart>:
    8000800c:	ff010113          	addi	sp,sp,-16
    80008010:	00813423          	sd	s0,8(sp)
    80008014:	01010413          	addi	s0,sp,16
    80008018:	00000797          	auipc	a5,0x0
    8000801c:	2f878793          	addi	a5,a5,760 # 80008310 <kernelvec>
    80008020:	10579073          	csrw	stvec,a5
    80008024:	00813403          	ld	s0,8(sp)
    80008028:	01010113          	addi	sp,sp,16
    8000802c:	00008067          	ret

0000000080008030 <usertrap>:
    80008030:	ff010113          	addi	sp,sp,-16
    80008034:	00813423          	sd	s0,8(sp)
    80008038:	01010413          	addi	s0,sp,16
    8000803c:	00813403          	ld	s0,8(sp)
    80008040:	01010113          	addi	sp,sp,16
    80008044:	00008067          	ret

0000000080008048 <usertrapret>:
    80008048:	ff010113          	addi	sp,sp,-16
    8000804c:	00813423          	sd	s0,8(sp)
    80008050:	01010413          	addi	s0,sp,16
    80008054:	00813403          	ld	s0,8(sp)
    80008058:	01010113          	addi	sp,sp,16
    8000805c:	00008067          	ret

0000000080008060 <kerneltrap>:
    80008060:	fe010113          	addi	sp,sp,-32
    80008064:	00813823          	sd	s0,16(sp)
    80008068:	00113c23          	sd	ra,24(sp)
    8000806c:	00913423          	sd	s1,8(sp)
    80008070:	02010413          	addi	s0,sp,32
    80008074:	142025f3          	csrr	a1,scause
    80008078:	100027f3          	csrr	a5,sstatus
    8000807c:	0027f793          	andi	a5,a5,2
    80008080:	10079c63          	bnez	a5,80008198 <kerneltrap+0x138>
    80008084:	142027f3          	csrr	a5,scause
    80008088:	0207ce63          	bltz	a5,800080c4 <kerneltrap+0x64>
    8000808c:	00003517          	auipc	a0,0x3
    80008090:	80450513          	addi	a0,a0,-2044 # 8000a890 <CONSOLE_STATUS+0x880>
    80008094:	00001097          	auipc	ra,0x1
    80008098:	884080e7          	jalr	-1916(ra) # 80008918 <__printf>
    8000809c:	141025f3          	csrr	a1,sepc
    800080a0:	14302673          	csrr	a2,stval
    800080a4:	00002517          	auipc	a0,0x2
    800080a8:	7fc50513          	addi	a0,a0,2044 # 8000a8a0 <CONSOLE_STATUS+0x890>
    800080ac:	00001097          	auipc	ra,0x1
    800080b0:	86c080e7          	jalr	-1940(ra) # 80008918 <__printf>
    800080b4:	00003517          	auipc	a0,0x3
    800080b8:	80450513          	addi	a0,a0,-2044 # 8000a8b8 <CONSOLE_STATUS+0x8a8>
    800080bc:	00001097          	auipc	ra,0x1
    800080c0:	800080e7          	jalr	-2048(ra) # 800088bc <panic>
    800080c4:	0ff7f713          	andi	a4,a5,255
    800080c8:	00900693          	li	a3,9
    800080cc:	04d70063          	beq	a4,a3,8000810c <kerneltrap+0xac>
    800080d0:	fff00713          	li	a4,-1
    800080d4:	03f71713          	slli	a4,a4,0x3f
    800080d8:	00170713          	addi	a4,a4,1
    800080dc:	fae798e3          	bne	a5,a4,8000808c <kerneltrap+0x2c>
    800080e0:	00000097          	auipc	ra,0x0
    800080e4:	e00080e7          	jalr	-512(ra) # 80007ee0 <cpuid>
    800080e8:	06050663          	beqz	a0,80008154 <kerneltrap+0xf4>
    800080ec:	144027f3          	csrr	a5,sip
    800080f0:	ffd7f793          	andi	a5,a5,-3
    800080f4:	14479073          	csrw	sip,a5
    800080f8:	01813083          	ld	ra,24(sp)
    800080fc:	01013403          	ld	s0,16(sp)
    80008100:	00813483          	ld	s1,8(sp)
    80008104:	02010113          	addi	sp,sp,32
    80008108:	00008067          	ret
    8000810c:	00000097          	auipc	ra,0x0
    80008110:	3c8080e7          	jalr	968(ra) # 800084d4 <plic_claim>
    80008114:	00a00793          	li	a5,10
    80008118:	00050493          	mv	s1,a0
    8000811c:	06f50863          	beq	a0,a5,8000818c <kerneltrap+0x12c>
    80008120:	fc050ce3          	beqz	a0,800080f8 <kerneltrap+0x98>
    80008124:	00050593          	mv	a1,a0
    80008128:	00002517          	auipc	a0,0x2
    8000812c:	74850513          	addi	a0,a0,1864 # 8000a870 <CONSOLE_STATUS+0x860>
    80008130:	00000097          	auipc	ra,0x0
    80008134:	7e8080e7          	jalr	2024(ra) # 80008918 <__printf>
    80008138:	01013403          	ld	s0,16(sp)
    8000813c:	01813083          	ld	ra,24(sp)
    80008140:	00048513          	mv	a0,s1
    80008144:	00813483          	ld	s1,8(sp)
    80008148:	02010113          	addi	sp,sp,32
    8000814c:	00000317          	auipc	t1,0x0
    80008150:	3c030067          	jr	960(t1) # 8000850c <plic_complete>
    80008154:	00006517          	auipc	a0,0x6
    80008158:	2ac50513          	addi	a0,a0,684 # 8000e400 <tickslock>
    8000815c:	00001097          	auipc	ra,0x1
    80008160:	490080e7          	jalr	1168(ra) # 800095ec <acquire>
    80008164:	00005717          	auipc	a4,0x5
    80008168:	03070713          	addi	a4,a4,48 # 8000d194 <ticks>
    8000816c:	00072783          	lw	a5,0(a4)
    80008170:	00006517          	auipc	a0,0x6
    80008174:	29050513          	addi	a0,a0,656 # 8000e400 <tickslock>
    80008178:	0017879b          	addiw	a5,a5,1
    8000817c:	00f72023          	sw	a5,0(a4)
    80008180:	00001097          	auipc	ra,0x1
    80008184:	538080e7          	jalr	1336(ra) # 800096b8 <release>
    80008188:	f65ff06f          	j	800080ec <kerneltrap+0x8c>
    8000818c:	00001097          	auipc	ra,0x1
    80008190:	094080e7          	jalr	148(ra) # 80009220 <uartintr>
    80008194:	fa5ff06f          	j	80008138 <kerneltrap+0xd8>
    80008198:	00002517          	auipc	a0,0x2
    8000819c:	6b850513          	addi	a0,a0,1720 # 8000a850 <CONSOLE_STATUS+0x840>
    800081a0:	00000097          	auipc	ra,0x0
    800081a4:	71c080e7          	jalr	1820(ra) # 800088bc <panic>

00000000800081a8 <clockintr>:
    800081a8:	fe010113          	addi	sp,sp,-32
    800081ac:	00813823          	sd	s0,16(sp)
    800081b0:	00913423          	sd	s1,8(sp)
    800081b4:	00113c23          	sd	ra,24(sp)
    800081b8:	02010413          	addi	s0,sp,32
    800081bc:	00006497          	auipc	s1,0x6
    800081c0:	24448493          	addi	s1,s1,580 # 8000e400 <tickslock>
    800081c4:	00048513          	mv	a0,s1
    800081c8:	00001097          	auipc	ra,0x1
    800081cc:	424080e7          	jalr	1060(ra) # 800095ec <acquire>
    800081d0:	00005717          	auipc	a4,0x5
    800081d4:	fc470713          	addi	a4,a4,-60 # 8000d194 <ticks>
    800081d8:	00072783          	lw	a5,0(a4)
    800081dc:	01013403          	ld	s0,16(sp)
    800081e0:	01813083          	ld	ra,24(sp)
    800081e4:	00048513          	mv	a0,s1
    800081e8:	0017879b          	addiw	a5,a5,1
    800081ec:	00813483          	ld	s1,8(sp)
    800081f0:	00f72023          	sw	a5,0(a4)
    800081f4:	02010113          	addi	sp,sp,32
    800081f8:	00001317          	auipc	t1,0x1
    800081fc:	4c030067          	jr	1216(t1) # 800096b8 <release>

0000000080008200 <devintr>:
    80008200:	142027f3          	csrr	a5,scause
    80008204:	00000513          	li	a0,0
    80008208:	0007c463          	bltz	a5,80008210 <devintr+0x10>
    8000820c:	00008067          	ret
    80008210:	fe010113          	addi	sp,sp,-32
    80008214:	00813823          	sd	s0,16(sp)
    80008218:	00113c23          	sd	ra,24(sp)
    8000821c:	00913423          	sd	s1,8(sp)
    80008220:	02010413          	addi	s0,sp,32
    80008224:	0ff7f713          	andi	a4,a5,255
    80008228:	00900693          	li	a3,9
    8000822c:	04d70c63          	beq	a4,a3,80008284 <devintr+0x84>
    80008230:	fff00713          	li	a4,-1
    80008234:	03f71713          	slli	a4,a4,0x3f
    80008238:	00170713          	addi	a4,a4,1
    8000823c:	00e78c63          	beq	a5,a4,80008254 <devintr+0x54>
    80008240:	01813083          	ld	ra,24(sp)
    80008244:	01013403          	ld	s0,16(sp)
    80008248:	00813483          	ld	s1,8(sp)
    8000824c:	02010113          	addi	sp,sp,32
    80008250:	00008067          	ret
    80008254:	00000097          	auipc	ra,0x0
    80008258:	c8c080e7          	jalr	-884(ra) # 80007ee0 <cpuid>
    8000825c:	06050663          	beqz	a0,800082c8 <devintr+0xc8>
    80008260:	144027f3          	csrr	a5,sip
    80008264:	ffd7f793          	andi	a5,a5,-3
    80008268:	14479073          	csrw	sip,a5
    8000826c:	01813083          	ld	ra,24(sp)
    80008270:	01013403          	ld	s0,16(sp)
    80008274:	00813483          	ld	s1,8(sp)
    80008278:	00200513          	li	a0,2
    8000827c:	02010113          	addi	sp,sp,32
    80008280:	00008067          	ret
    80008284:	00000097          	auipc	ra,0x0
    80008288:	250080e7          	jalr	592(ra) # 800084d4 <plic_claim>
    8000828c:	00a00793          	li	a5,10
    80008290:	00050493          	mv	s1,a0
    80008294:	06f50663          	beq	a0,a5,80008300 <devintr+0x100>
    80008298:	00100513          	li	a0,1
    8000829c:	fa0482e3          	beqz	s1,80008240 <devintr+0x40>
    800082a0:	00048593          	mv	a1,s1
    800082a4:	00002517          	auipc	a0,0x2
    800082a8:	5cc50513          	addi	a0,a0,1484 # 8000a870 <CONSOLE_STATUS+0x860>
    800082ac:	00000097          	auipc	ra,0x0
    800082b0:	66c080e7          	jalr	1644(ra) # 80008918 <__printf>
    800082b4:	00048513          	mv	a0,s1
    800082b8:	00000097          	auipc	ra,0x0
    800082bc:	254080e7          	jalr	596(ra) # 8000850c <plic_complete>
    800082c0:	00100513          	li	a0,1
    800082c4:	f7dff06f          	j	80008240 <devintr+0x40>
    800082c8:	00006517          	auipc	a0,0x6
    800082cc:	13850513          	addi	a0,a0,312 # 8000e400 <tickslock>
    800082d0:	00001097          	auipc	ra,0x1
    800082d4:	31c080e7          	jalr	796(ra) # 800095ec <acquire>
    800082d8:	00005717          	auipc	a4,0x5
    800082dc:	ebc70713          	addi	a4,a4,-324 # 8000d194 <ticks>
    800082e0:	00072783          	lw	a5,0(a4)
    800082e4:	00006517          	auipc	a0,0x6
    800082e8:	11c50513          	addi	a0,a0,284 # 8000e400 <tickslock>
    800082ec:	0017879b          	addiw	a5,a5,1
    800082f0:	00f72023          	sw	a5,0(a4)
    800082f4:	00001097          	auipc	ra,0x1
    800082f8:	3c4080e7          	jalr	964(ra) # 800096b8 <release>
    800082fc:	f65ff06f          	j	80008260 <devintr+0x60>
    80008300:	00001097          	auipc	ra,0x1
    80008304:	f20080e7          	jalr	-224(ra) # 80009220 <uartintr>
    80008308:	fadff06f          	j	800082b4 <devintr+0xb4>
    8000830c:	0000                	unimp
	...

0000000080008310 <kernelvec>:
    80008310:	f0010113          	addi	sp,sp,-256
    80008314:	00113023          	sd	ra,0(sp)
    80008318:	00213423          	sd	sp,8(sp)
    8000831c:	00313823          	sd	gp,16(sp)
    80008320:	00413c23          	sd	tp,24(sp)
    80008324:	02513023          	sd	t0,32(sp)
    80008328:	02613423          	sd	t1,40(sp)
    8000832c:	02713823          	sd	t2,48(sp)
    80008330:	02813c23          	sd	s0,56(sp)
    80008334:	04913023          	sd	s1,64(sp)
    80008338:	04a13423          	sd	a0,72(sp)
    8000833c:	04b13823          	sd	a1,80(sp)
    80008340:	04c13c23          	sd	a2,88(sp)
    80008344:	06d13023          	sd	a3,96(sp)
    80008348:	06e13423          	sd	a4,104(sp)
    8000834c:	06f13823          	sd	a5,112(sp)
    80008350:	07013c23          	sd	a6,120(sp)
    80008354:	09113023          	sd	a7,128(sp)
    80008358:	09213423          	sd	s2,136(sp)
    8000835c:	09313823          	sd	s3,144(sp)
    80008360:	09413c23          	sd	s4,152(sp)
    80008364:	0b513023          	sd	s5,160(sp)
    80008368:	0b613423          	sd	s6,168(sp)
    8000836c:	0b713823          	sd	s7,176(sp)
    80008370:	0b813c23          	sd	s8,184(sp)
    80008374:	0d913023          	sd	s9,192(sp)
    80008378:	0da13423          	sd	s10,200(sp)
    8000837c:	0db13823          	sd	s11,208(sp)
    80008380:	0dc13c23          	sd	t3,216(sp)
    80008384:	0fd13023          	sd	t4,224(sp)
    80008388:	0fe13423          	sd	t5,232(sp)
    8000838c:	0ff13823          	sd	t6,240(sp)
    80008390:	cd1ff0ef          	jal	ra,80008060 <kerneltrap>
    80008394:	00013083          	ld	ra,0(sp)
    80008398:	00813103          	ld	sp,8(sp)
    8000839c:	01013183          	ld	gp,16(sp)
    800083a0:	02013283          	ld	t0,32(sp)
    800083a4:	02813303          	ld	t1,40(sp)
    800083a8:	03013383          	ld	t2,48(sp)
    800083ac:	03813403          	ld	s0,56(sp)
    800083b0:	04013483          	ld	s1,64(sp)
    800083b4:	04813503          	ld	a0,72(sp)
    800083b8:	05013583          	ld	a1,80(sp)
    800083bc:	05813603          	ld	a2,88(sp)
    800083c0:	06013683          	ld	a3,96(sp)
    800083c4:	06813703          	ld	a4,104(sp)
    800083c8:	07013783          	ld	a5,112(sp)
    800083cc:	07813803          	ld	a6,120(sp)
    800083d0:	08013883          	ld	a7,128(sp)
    800083d4:	08813903          	ld	s2,136(sp)
    800083d8:	09013983          	ld	s3,144(sp)
    800083dc:	09813a03          	ld	s4,152(sp)
    800083e0:	0a013a83          	ld	s5,160(sp)
    800083e4:	0a813b03          	ld	s6,168(sp)
    800083e8:	0b013b83          	ld	s7,176(sp)
    800083ec:	0b813c03          	ld	s8,184(sp)
    800083f0:	0c013c83          	ld	s9,192(sp)
    800083f4:	0c813d03          	ld	s10,200(sp)
    800083f8:	0d013d83          	ld	s11,208(sp)
    800083fc:	0d813e03          	ld	t3,216(sp)
    80008400:	0e013e83          	ld	t4,224(sp)
    80008404:	0e813f03          	ld	t5,232(sp)
    80008408:	0f013f83          	ld	t6,240(sp)
    8000840c:	10010113          	addi	sp,sp,256
    80008410:	10200073          	sret
    80008414:	00000013          	nop
    80008418:	00000013          	nop
    8000841c:	00000013          	nop

0000000080008420 <timervec>:
    80008420:	34051573          	csrrw	a0,mscratch,a0
    80008424:	00b53023          	sd	a1,0(a0)
    80008428:	00c53423          	sd	a2,8(a0)
    8000842c:	00d53823          	sd	a3,16(a0)
    80008430:	01853583          	ld	a1,24(a0)
    80008434:	02053603          	ld	a2,32(a0)
    80008438:	0005b683          	ld	a3,0(a1)
    8000843c:	00c686b3          	add	a3,a3,a2
    80008440:	00d5b023          	sd	a3,0(a1)
    80008444:	00200593          	li	a1,2
    80008448:	14459073          	csrw	sip,a1
    8000844c:	01053683          	ld	a3,16(a0)
    80008450:	00853603          	ld	a2,8(a0)
    80008454:	00053583          	ld	a1,0(a0)
    80008458:	34051573          	csrrw	a0,mscratch,a0
    8000845c:	30200073          	mret

0000000080008460 <plicinit>:
    80008460:	ff010113          	addi	sp,sp,-16
    80008464:	00813423          	sd	s0,8(sp)
    80008468:	01010413          	addi	s0,sp,16
    8000846c:	00813403          	ld	s0,8(sp)
    80008470:	0c0007b7          	lui	a5,0xc000
    80008474:	00100713          	li	a4,1
    80008478:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000847c:	00e7a223          	sw	a4,4(a5)
    80008480:	01010113          	addi	sp,sp,16
    80008484:	00008067          	ret

0000000080008488 <plicinithart>:
    80008488:	ff010113          	addi	sp,sp,-16
    8000848c:	00813023          	sd	s0,0(sp)
    80008490:	00113423          	sd	ra,8(sp)
    80008494:	01010413          	addi	s0,sp,16
    80008498:	00000097          	auipc	ra,0x0
    8000849c:	a48080e7          	jalr	-1464(ra) # 80007ee0 <cpuid>
    800084a0:	0085171b          	slliw	a4,a0,0x8
    800084a4:	0c0027b7          	lui	a5,0xc002
    800084a8:	00e787b3          	add	a5,a5,a4
    800084ac:	40200713          	li	a4,1026
    800084b0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800084b4:	00813083          	ld	ra,8(sp)
    800084b8:	00013403          	ld	s0,0(sp)
    800084bc:	00d5151b          	slliw	a0,a0,0xd
    800084c0:	0c2017b7          	lui	a5,0xc201
    800084c4:	00a78533          	add	a0,a5,a0
    800084c8:	00052023          	sw	zero,0(a0)
    800084cc:	01010113          	addi	sp,sp,16
    800084d0:	00008067          	ret

00000000800084d4 <plic_claim>:
    800084d4:	ff010113          	addi	sp,sp,-16
    800084d8:	00813023          	sd	s0,0(sp)
    800084dc:	00113423          	sd	ra,8(sp)
    800084e0:	01010413          	addi	s0,sp,16
    800084e4:	00000097          	auipc	ra,0x0
    800084e8:	9fc080e7          	jalr	-1540(ra) # 80007ee0 <cpuid>
    800084ec:	00813083          	ld	ra,8(sp)
    800084f0:	00013403          	ld	s0,0(sp)
    800084f4:	00d5151b          	slliw	a0,a0,0xd
    800084f8:	0c2017b7          	lui	a5,0xc201
    800084fc:	00a78533          	add	a0,a5,a0
    80008500:	00452503          	lw	a0,4(a0)
    80008504:	01010113          	addi	sp,sp,16
    80008508:	00008067          	ret

000000008000850c <plic_complete>:
    8000850c:	fe010113          	addi	sp,sp,-32
    80008510:	00813823          	sd	s0,16(sp)
    80008514:	00913423          	sd	s1,8(sp)
    80008518:	00113c23          	sd	ra,24(sp)
    8000851c:	02010413          	addi	s0,sp,32
    80008520:	00050493          	mv	s1,a0
    80008524:	00000097          	auipc	ra,0x0
    80008528:	9bc080e7          	jalr	-1604(ra) # 80007ee0 <cpuid>
    8000852c:	01813083          	ld	ra,24(sp)
    80008530:	01013403          	ld	s0,16(sp)
    80008534:	00d5179b          	slliw	a5,a0,0xd
    80008538:	0c201737          	lui	a4,0xc201
    8000853c:	00f707b3          	add	a5,a4,a5
    80008540:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80008544:	00813483          	ld	s1,8(sp)
    80008548:	02010113          	addi	sp,sp,32
    8000854c:	00008067          	ret

0000000080008550 <consolewrite>:
    80008550:	fb010113          	addi	sp,sp,-80
    80008554:	04813023          	sd	s0,64(sp)
    80008558:	04113423          	sd	ra,72(sp)
    8000855c:	02913c23          	sd	s1,56(sp)
    80008560:	03213823          	sd	s2,48(sp)
    80008564:	03313423          	sd	s3,40(sp)
    80008568:	03413023          	sd	s4,32(sp)
    8000856c:	01513c23          	sd	s5,24(sp)
    80008570:	05010413          	addi	s0,sp,80
    80008574:	06c05c63          	blez	a2,800085ec <consolewrite+0x9c>
    80008578:	00060993          	mv	s3,a2
    8000857c:	00050a13          	mv	s4,a0
    80008580:	00058493          	mv	s1,a1
    80008584:	00000913          	li	s2,0
    80008588:	fff00a93          	li	s5,-1
    8000858c:	01c0006f          	j	800085a8 <consolewrite+0x58>
    80008590:	fbf44503          	lbu	a0,-65(s0)
    80008594:	0019091b          	addiw	s2,s2,1
    80008598:	00148493          	addi	s1,s1,1
    8000859c:	00001097          	auipc	ra,0x1
    800085a0:	a9c080e7          	jalr	-1380(ra) # 80009038 <uartputc>
    800085a4:	03298063          	beq	s3,s2,800085c4 <consolewrite+0x74>
    800085a8:	00048613          	mv	a2,s1
    800085ac:	00100693          	li	a3,1
    800085b0:	000a0593          	mv	a1,s4
    800085b4:	fbf40513          	addi	a0,s0,-65
    800085b8:	00000097          	auipc	ra,0x0
    800085bc:	9e0080e7          	jalr	-1568(ra) # 80007f98 <either_copyin>
    800085c0:	fd5518e3          	bne	a0,s5,80008590 <consolewrite+0x40>
    800085c4:	04813083          	ld	ra,72(sp)
    800085c8:	04013403          	ld	s0,64(sp)
    800085cc:	03813483          	ld	s1,56(sp)
    800085d0:	02813983          	ld	s3,40(sp)
    800085d4:	02013a03          	ld	s4,32(sp)
    800085d8:	01813a83          	ld	s5,24(sp)
    800085dc:	00090513          	mv	a0,s2
    800085e0:	03013903          	ld	s2,48(sp)
    800085e4:	05010113          	addi	sp,sp,80
    800085e8:	00008067          	ret
    800085ec:	00000913          	li	s2,0
    800085f0:	fd5ff06f          	j	800085c4 <consolewrite+0x74>

00000000800085f4 <consoleread>:
    800085f4:	f9010113          	addi	sp,sp,-112
    800085f8:	06813023          	sd	s0,96(sp)
    800085fc:	04913c23          	sd	s1,88(sp)
    80008600:	05213823          	sd	s2,80(sp)
    80008604:	05313423          	sd	s3,72(sp)
    80008608:	05413023          	sd	s4,64(sp)
    8000860c:	03513c23          	sd	s5,56(sp)
    80008610:	03613823          	sd	s6,48(sp)
    80008614:	03713423          	sd	s7,40(sp)
    80008618:	03813023          	sd	s8,32(sp)
    8000861c:	06113423          	sd	ra,104(sp)
    80008620:	01913c23          	sd	s9,24(sp)
    80008624:	07010413          	addi	s0,sp,112
    80008628:	00060b93          	mv	s7,a2
    8000862c:	00050913          	mv	s2,a0
    80008630:	00058c13          	mv	s8,a1
    80008634:	00060b1b          	sext.w	s6,a2
    80008638:	00006497          	auipc	s1,0x6
    8000863c:	df048493          	addi	s1,s1,-528 # 8000e428 <cons>
    80008640:	00400993          	li	s3,4
    80008644:	fff00a13          	li	s4,-1
    80008648:	00a00a93          	li	s5,10
    8000864c:	05705e63          	blez	s7,800086a8 <consoleread+0xb4>
    80008650:	09c4a703          	lw	a4,156(s1)
    80008654:	0984a783          	lw	a5,152(s1)
    80008658:	0007071b          	sext.w	a4,a4
    8000865c:	08e78463          	beq	a5,a4,800086e4 <consoleread+0xf0>
    80008660:	07f7f713          	andi	a4,a5,127
    80008664:	00e48733          	add	a4,s1,a4
    80008668:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000866c:	0017869b          	addiw	a3,a5,1
    80008670:	08d4ac23          	sw	a3,152(s1)
    80008674:	00070c9b          	sext.w	s9,a4
    80008678:	0b370663          	beq	a4,s3,80008724 <consoleread+0x130>
    8000867c:	00100693          	li	a3,1
    80008680:	f9f40613          	addi	a2,s0,-97
    80008684:	000c0593          	mv	a1,s8
    80008688:	00090513          	mv	a0,s2
    8000868c:	f8e40fa3          	sb	a4,-97(s0)
    80008690:	00000097          	auipc	ra,0x0
    80008694:	8bc080e7          	jalr	-1860(ra) # 80007f4c <either_copyout>
    80008698:	01450863          	beq	a0,s4,800086a8 <consoleread+0xb4>
    8000869c:	001c0c13          	addi	s8,s8,1
    800086a0:	fffb8b9b          	addiw	s7,s7,-1
    800086a4:	fb5c94e3          	bne	s9,s5,8000864c <consoleread+0x58>
    800086a8:	000b851b          	sext.w	a0,s7
    800086ac:	06813083          	ld	ra,104(sp)
    800086b0:	06013403          	ld	s0,96(sp)
    800086b4:	05813483          	ld	s1,88(sp)
    800086b8:	05013903          	ld	s2,80(sp)
    800086bc:	04813983          	ld	s3,72(sp)
    800086c0:	04013a03          	ld	s4,64(sp)
    800086c4:	03813a83          	ld	s5,56(sp)
    800086c8:	02813b83          	ld	s7,40(sp)
    800086cc:	02013c03          	ld	s8,32(sp)
    800086d0:	01813c83          	ld	s9,24(sp)
    800086d4:	40ab053b          	subw	a0,s6,a0
    800086d8:	03013b03          	ld	s6,48(sp)
    800086dc:	07010113          	addi	sp,sp,112
    800086e0:	00008067          	ret
    800086e4:	00001097          	auipc	ra,0x1
    800086e8:	1d8080e7          	jalr	472(ra) # 800098bc <push_on>
    800086ec:	0984a703          	lw	a4,152(s1)
    800086f0:	09c4a783          	lw	a5,156(s1)
    800086f4:	0007879b          	sext.w	a5,a5
    800086f8:	fef70ce3          	beq	a4,a5,800086f0 <consoleread+0xfc>
    800086fc:	00001097          	auipc	ra,0x1
    80008700:	234080e7          	jalr	564(ra) # 80009930 <pop_on>
    80008704:	0984a783          	lw	a5,152(s1)
    80008708:	07f7f713          	andi	a4,a5,127
    8000870c:	00e48733          	add	a4,s1,a4
    80008710:	01874703          	lbu	a4,24(a4)
    80008714:	0017869b          	addiw	a3,a5,1
    80008718:	08d4ac23          	sw	a3,152(s1)
    8000871c:	00070c9b          	sext.w	s9,a4
    80008720:	f5371ee3          	bne	a4,s3,8000867c <consoleread+0x88>
    80008724:	000b851b          	sext.w	a0,s7
    80008728:	f96bf2e3          	bgeu	s7,s6,800086ac <consoleread+0xb8>
    8000872c:	08f4ac23          	sw	a5,152(s1)
    80008730:	f7dff06f          	j	800086ac <consoleread+0xb8>

0000000080008734 <consputc>:
    80008734:	10000793          	li	a5,256
    80008738:	00f50663          	beq	a0,a5,80008744 <consputc+0x10>
    8000873c:	00001317          	auipc	t1,0x1
    80008740:	9f430067          	jr	-1548(t1) # 80009130 <uartputc_sync>
    80008744:	ff010113          	addi	sp,sp,-16
    80008748:	00113423          	sd	ra,8(sp)
    8000874c:	00813023          	sd	s0,0(sp)
    80008750:	01010413          	addi	s0,sp,16
    80008754:	00800513          	li	a0,8
    80008758:	00001097          	auipc	ra,0x1
    8000875c:	9d8080e7          	jalr	-1576(ra) # 80009130 <uartputc_sync>
    80008760:	02000513          	li	a0,32
    80008764:	00001097          	auipc	ra,0x1
    80008768:	9cc080e7          	jalr	-1588(ra) # 80009130 <uartputc_sync>
    8000876c:	00013403          	ld	s0,0(sp)
    80008770:	00813083          	ld	ra,8(sp)
    80008774:	00800513          	li	a0,8
    80008778:	01010113          	addi	sp,sp,16
    8000877c:	00001317          	auipc	t1,0x1
    80008780:	9b430067          	jr	-1612(t1) # 80009130 <uartputc_sync>

0000000080008784 <consoleintr>:
    80008784:	fe010113          	addi	sp,sp,-32
    80008788:	00813823          	sd	s0,16(sp)
    8000878c:	00913423          	sd	s1,8(sp)
    80008790:	01213023          	sd	s2,0(sp)
    80008794:	00113c23          	sd	ra,24(sp)
    80008798:	02010413          	addi	s0,sp,32
    8000879c:	00006917          	auipc	s2,0x6
    800087a0:	c8c90913          	addi	s2,s2,-884 # 8000e428 <cons>
    800087a4:	00050493          	mv	s1,a0
    800087a8:	00090513          	mv	a0,s2
    800087ac:	00001097          	auipc	ra,0x1
    800087b0:	e40080e7          	jalr	-448(ra) # 800095ec <acquire>
    800087b4:	02048c63          	beqz	s1,800087ec <consoleintr+0x68>
    800087b8:	0a092783          	lw	a5,160(s2)
    800087bc:	09892703          	lw	a4,152(s2)
    800087c0:	07f00693          	li	a3,127
    800087c4:	40e7873b          	subw	a4,a5,a4
    800087c8:	02e6e263          	bltu	a3,a4,800087ec <consoleintr+0x68>
    800087cc:	00d00713          	li	a4,13
    800087d0:	04e48063          	beq	s1,a4,80008810 <consoleintr+0x8c>
    800087d4:	07f7f713          	andi	a4,a5,127
    800087d8:	00e90733          	add	a4,s2,a4
    800087dc:	0017879b          	addiw	a5,a5,1
    800087e0:	0af92023          	sw	a5,160(s2)
    800087e4:	00970c23          	sb	s1,24(a4)
    800087e8:	08f92e23          	sw	a5,156(s2)
    800087ec:	01013403          	ld	s0,16(sp)
    800087f0:	01813083          	ld	ra,24(sp)
    800087f4:	00813483          	ld	s1,8(sp)
    800087f8:	00013903          	ld	s2,0(sp)
    800087fc:	00006517          	auipc	a0,0x6
    80008800:	c2c50513          	addi	a0,a0,-980 # 8000e428 <cons>
    80008804:	02010113          	addi	sp,sp,32
    80008808:	00001317          	auipc	t1,0x1
    8000880c:	eb030067          	jr	-336(t1) # 800096b8 <release>
    80008810:	00a00493          	li	s1,10
    80008814:	fc1ff06f          	j	800087d4 <consoleintr+0x50>

0000000080008818 <consoleinit>:
    80008818:	fe010113          	addi	sp,sp,-32
    8000881c:	00113c23          	sd	ra,24(sp)
    80008820:	00813823          	sd	s0,16(sp)
    80008824:	00913423          	sd	s1,8(sp)
    80008828:	02010413          	addi	s0,sp,32
    8000882c:	00006497          	auipc	s1,0x6
    80008830:	bfc48493          	addi	s1,s1,-1028 # 8000e428 <cons>
    80008834:	00048513          	mv	a0,s1
    80008838:	00002597          	auipc	a1,0x2
    8000883c:	09058593          	addi	a1,a1,144 # 8000a8c8 <CONSOLE_STATUS+0x8b8>
    80008840:	00001097          	auipc	ra,0x1
    80008844:	d88080e7          	jalr	-632(ra) # 800095c8 <initlock>
    80008848:	00000097          	auipc	ra,0x0
    8000884c:	7ac080e7          	jalr	1964(ra) # 80008ff4 <uartinit>
    80008850:	01813083          	ld	ra,24(sp)
    80008854:	01013403          	ld	s0,16(sp)
    80008858:	00000797          	auipc	a5,0x0
    8000885c:	d9c78793          	addi	a5,a5,-612 # 800085f4 <consoleread>
    80008860:	0af4bc23          	sd	a5,184(s1)
    80008864:	00000797          	auipc	a5,0x0
    80008868:	cec78793          	addi	a5,a5,-788 # 80008550 <consolewrite>
    8000886c:	0cf4b023          	sd	a5,192(s1)
    80008870:	00813483          	ld	s1,8(sp)
    80008874:	02010113          	addi	sp,sp,32
    80008878:	00008067          	ret

000000008000887c <console_read>:
    8000887c:	ff010113          	addi	sp,sp,-16
    80008880:	00813423          	sd	s0,8(sp)
    80008884:	01010413          	addi	s0,sp,16
    80008888:	00813403          	ld	s0,8(sp)
    8000888c:	00006317          	auipc	t1,0x6
    80008890:	c5433303          	ld	t1,-940(t1) # 8000e4e0 <devsw+0x10>
    80008894:	01010113          	addi	sp,sp,16
    80008898:	00030067          	jr	t1

000000008000889c <console_write>:
    8000889c:	ff010113          	addi	sp,sp,-16
    800088a0:	00813423          	sd	s0,8(sp)
    800088a4:	01010413          	addi	s0,sp,16
    800088a8:	00813403          	ld	s0,8(sp)
    800088ac:	00006317          	auipc	t1,0x6
    800088b0:	c3c33303          	ld	t1,-964(t1) # 8000e4e8 <devsw+0x18>
    800088b4:	01010113          	addi	sp,sp,16
    800088b8:	00030067          	jr	t1

00000000800088bc <panic>:
    800088bc:	fe010113          	addi	sp,sp,-32
    800088c0:	00113c23          	sd	ra,24(sp)
    800088c4:	00813823          	sd	s0,16(sp)
    800088c8:	00913423          	sd	s1,8(sp)
    800088cc:	02010413          	addi	s0,sp,32
    800088d0:	00050493          	mv	s1,a0
    800088d4:	00002517          	auipc	a0,0x2
    800088d8:	ffc50513          	addi	a0,a0,-4 # 8000a8d0 <CONSOLE_STATUS+0x8c0>
    800088dc:	00006797          	auipc	a5,0x6
    800088e0:	ca07a623          	sw	zero,-852(a5) # 8000e588 <pr+0x18>
    800088e4:	00000097          	auipc	ra,0x0
    800088e8:	034080e7          	jalr	52(ra) # 80008918 <__printf>
    800088ec:	00048513          	mv	a0,s1
    800088f0:	00000097          	auipc	ra,0x0
    800088f4:	028080e7          	jalr	40(ra) # 80008918 <__printf>
    800088f8:	00002517          	auipc	a0,0x2
    800088fc:	d6050513          	addi	a0,a0,-672 # 8000a658 <CONSOLE_STATUS+0x648>
    80008900:	00000097          	auipc	ra,0x0
    80008904:	018080e7          	jalr	24(ra) # 80008918 <__printf>
    80008908:	00100793          	li	a5,1
    8000890c:	00005717          	auipc	a4,0x5
    80008910:	88f72623          	sw	a5,-1908(a4) # 8000d198 <panicked>
    80008914:	0000006f          	j	80008914 <panic+0x58>

0000000080008918 <__printf>:
    80008918:	f3010113          	addi	sp,sp,-208
    8000891c:	08813023          	sd	s0,128(sp)
    80008920:	07313423          	sd	s3,104(sp)
    80008924:	09010413          	addi	s0,sp,144
    80008928:	05813023          	sd	s8,64(sp)
    8000892c:	08113423          	sd	ra,136(sp)
    80008930:	06913c23          	sd	s1,120(sp)
    80008934:	07213823          	sd	s2,112(sp)
    80008938:	07413023          	sd	s4,96(sp)
    8000893c:	05513c23          	sd	s5,88(sp)
    80008940:	05613823          	sd	s6,80(sp)
    80008944:	05713423          	sd	s7,72(sp)
    80008948:	03913c23          	sd	s9,56(sp)
    8000894c:	03a13823          	sd	s10,48(sp)
    80008950:	03b13423          	sd	s11,40(sp)
    80008954:	00006317          	auipc	t1,0x6
    80008958:	c1c30313          	addi	t1,t1,-996 # 8000e570 <pr>
    8000895c:	01832c03          	lw	s8,24(t1)
    80008960:	00b43423          	sd	a1,8(s0)
    80008964:	00c43823          	sd	a2,16(s0)
    80008968:	00d43c23          	sd	a3,24(s0)
    8000896c:	02e43023          	sd	a4,32(s0)
    80008970:	02f43423          	sd	a5,40(s0)
    80008974:	03043823          	sd	a6,48(s0)
    80008978:	03143c23          	sd	a7,56(s0)
    8000897c:	00050993          	mv	s3,a0
    80008980:	4a0c1663          	bnez	s8,80008e2c <__printf+0x514>
    80008984:	60098c63          	beqz	s3,80008f9c <__printf+0x684>
    80008988:	0009c503          	lbu	a0,0(s3)
    8000898c:	00840793          	addi	a5,s0,8
    80008990:	f6f43c23          	sd	a5,-136(s0)
    80008994:	00000493          	li	s1,0
    80008998:	22050063          	beqz	a0,80008bb8 <__printf+0x2a0>
    8000899c:	00002a37          	lui	s4,0x2
    800089a0:	00018ab7          	lui	s5,0x18
    800089a4:	000f4b37          	lui	s6,0xf4
    800089a8:	00989bb7          	lui	s7,0x989
    800089ac:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800089b0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800089b4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800089b8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800089bc:	00148c9b          	addiw	s9,s1,1
    800089c0:	02500793          	li	a5,37
    800089c4:	01998933          	add	s2,s3,s9
    800089c8:	38f51263          	bne	a0,a5,80008d4c <__printf+0x434>
    800089cc:	00094783          	lbu	a5,0(s2)
    800089d0:	00078c9b          	sext.w	s9,a5
    800089d4:	1e078263          	beqz	a5,80008bb8 <__printf+0x2a0>
    800089d8:	0024849b          	addiw	s1,s1,2
    800089dc:	07000713          	li	a4,112
    800089e0:	00998933          	add	s2,s3,s1
    800089e4:	38e78a63          	beq	a5,a4,80008d78 <__printf+0x460>
    800089e8:	20f76863          	bltu	a4,a5,80008bf8 <__printf+0x2e0>
    800089ec:	42a78863          	beq	a5,a0,80008e1c <__printf+0x504>
    800089f0:	06400713          	li	a4,100
    800089f4:	40e79663          	bne	a5,a4,80008e00 <__printf+0x4e8>
    800089f8:	f7843783          	ld	a5,-136(s0)
    800089fc:	0007a603          	lw	a2,0(a5)
    80008a00:	00878793          	addi	a5,a5,8
    80008a04:	f6f43c23          	sd	a5,-136(s0)
    80008a08:	42064a63          	bltz	a2,80008e3c <__printf+0x524>
    80008a0c:	00a00713          	li	a4,10
    80008a10:	02e677bb          	remuw	a5,a2,a4
    80008a14:	00002d97          	auipc	s11,0x2
    80008a18:	ee4d8d93          	addi	s11,s11,-284 # 8000a8f8 <digits>
    80008a1c:	00900593          	li	a1,9
    80008a20:	0006051b          	sext.w	a0,a2
    80008a24:	00000c93          	li	s9,0
    80008a28:	02079793          	slli	a5,a5,0x20
    80008a2c:	0207d793          	srli	a5,a5,0x20
    80008a30:	00fd87b3          	add	a5,s11,a5
    80008a34:	0007c783          	lbu	a5,0(a5)
    80008a38:	02e656bb          	divuw	a3,a2,a4
    80008a3c:	f8f40023          	sb	a5,-128(s0)
    80008a40:	14c5d863          	bge	a1,a2,80008b90 <__printf+0x278>
    80008a44:	06300593          	li	a1,99
    80008a48:	00100c93          	li	s9,1
    80008a4c:	02e6f7bb          	remuw	a5,a3,a4
    80008a50:	02079793          	slli	a5,a5,0x20
    80008a54:	0207d793          	srli	a5,a5,0x20
    80008a58:	00fd87b3          	add	a5,s11,a5
    80008a5c:	0007c783          	lbu	a5,0(a5)
    80008a60:	02e6d73b          	divuw	a4,a3,a4
    80008a64:	f8f400a3          	sb	a5,-127(s0)
    80008a68:	12a5f463          	bgeu	a1,a0,80008b90 <__printf+0x278>
    80008a6c:	00a00693          	li	a3,10
    80008a70:	00900593          	li	a1,9
    80008a74:	02d777bb          	remuw	a5,a4,a3
    80008a78:	02079793          	slli	a5,a5,0x20
    80008a7c:	0207d793          	srli	a5,a5,0x20
    80008a80:	00fd87b3          	add	a5,s11,a5
    80008a84:	0007c503          	lbu	a0,0(a5)
    80008a88:	02d757bb          	divuw	a5,a4,a3
    80008a8c:	f8a40123          	sb	a0,-126(s0)
    80008a90:	48e5f263          	bgeu	a1,a4,80008f14 <__printf+0x5fc>
    80008a94:	06300513          	li	a0,99
    80008a98:	02d7f5bb          	remuw	a1,a5,a3
    80008a9c:	02059593          	slli	a1,a1,0x20
    80008aa0:	0205d593          	srli	a1,a1,0x20
    80008aa4:	00bd85b3          	add	a1,s11,a1
    80008aa8:	0005c583          	lbu	a1,0(a1)
    80008aac:	02d7d7bb          	divuw	a5,a5,a3
    80008ab0:	f8b401a3          	sb	a1,-125(s0)
    80008ab4:	48e57263          	bgeu	a0,a4,80008f38 <__printf+0x620>
    80008ab8:	3e700513          	li	a0,999
    80008abc:	02d7f5bb          	remuw	a1,a5,a3
    80008ac0:	02059593          	slli	a1,a1,0x20
    80008ac4:	0205d593          	srli	a1,a1,0x20
    80008ac8:	00bd85b3          	add	a1,s11,a1
    80008acc:	0005c583          	lbu	a1,0(a1)
    80008ad0:	02d7d7bb          	divuw	a5,a5,a3
    80008ad4:	f8b40223          	sb	a1,-124(s0)
    80008ad8:	46e57663          	bgeu	a0,a4,80008f44 <__printf+0x62c>
    80008adc:	02d7f5bb          	remuw	a1,a5,a3
    80008ae0:	02059593          	slli	a1,a1,0x20
    80008ae4:	0205d593          	srli	a1,a1,0x20
    80008ae8:	00bd85b3          	add	a1,s11,a1
    80008aec:	0005c583          	lbu	a1,0(a1)
    80008af0:	02d7d7bb          	divuw	a5,a5,a3
    80008af4:	f8b402a3          	sb	a1,-123(s0)
    80008af8:	46ea7863          	bgeu	s4,a4,80008f68 <__printf+0x650>
    80008afc:	02d7f5bb          	remuw	a1,a5,a3
    80008b00:	02059593          	slli	a1,a1,0x20
    80008b04:	0205d593          	srli	a1,a1,0x20
    80008b08:	00bd85b3          	add	a1,s11,a1
    80008b0c:	0005c583          	lbu	a1,0(a1)
    80008b10:	02d7d7bb          	divuw	a5,a5,a3
    80008b14:	f8b40323          	sb	a1,-122(s0)
    80008b18:	3eeaf863          	bgeu	s5,a4,80008f08 <__printf+0x5f0>
    80008b1c:	02d7f5bb          	remuw	a1,a5,a3
    80008b20:	02059593          	slli	a1,a1,0x20
    80008b24:	0205d593          	srli	a1,a1,0x20
    80008b28:	00bd85b3          	add	a1,s11,a1
    80008b2c:	0005c583          	lbu	a1,0(a1)
    80008b30:	02d7d7bb          	divuw	a5,a5,a3
    80008b34:	f8b403a3          	sb	a1,-121(s0)
    80008b38:	42eb7e63          	bgeu	s6,a4,80008f74 <__printf+0x65c>
    80008b3c:	02d7f5bb          	remuw	a1,a5,a3
    80008b40:	02059593          	slli	a1,a1,0x20
    80008b44:	0205d593          	srli	a1,a1,0x20
    80008b48:	00bd85b3          	add	a1,s11,a1
    80008b4c:	0005c583          	lbu	a1,0(a1)
    80008b50:	02d7d7bb          	divuw	a5,a5,a3
    80008b54:	f8b40423          	sb	a1,-120(s0)
    80008b58:	42ebfc63          	bgeu	s7,a4,80008f90 <__printf+0x678>
    80008b5c:	02079793          	slli	a5,a5,0x20
    80008b60:	0207d793          	srli	a5,a5,0x20
    80008b64:	00fd8db3          	add	s11,s11,a5
    80008b68:	000dc703          	lbu	a4,0(s11)
    80008b6c:	00a00793          	li	a5,10
    80008b70:	00900c93          	li	s9,9
    80008b74:	f8e404a3          	sb	a4,-119(s0)
    80008b78:	00065c63          	bgez	a2,80008b90 <__printf+0x278>
    80008b7c:	f9040713          	addi	a4,s0,-112
    80008b80:	00f70733          	add	a4,a4,a5
    80008b84:	02d00693          	li	a3,45
    80008b88:	fed70823          	sb	a3,-16(a4)
    80008b8c:	00078c93          	mv	s9,a5
    80008b90:	f8040793          	addi	a5,s0,-128
    80008b94:	01978cb3          	add	s9,a5,s9
    80008b98:	f7f40d13          	addi	s10,s0,-129
    80008b9c:	000cc503          	lbu	a0,0(s9)
    80008ba0:	fffc8c93          	addi	s9,s9,-1
    80008ba4:	00000097          	auipc	ra,0x0
    80008ba8:	b90080e7          	jalr	-1136(ra) # 80008734 <consputc>
    80008bac:	ffac98e3          	bne	s9,s10,80008b9c <__printf+0x284>
    80008bb0:	00094503          	lbu	a0,0(s2)
    80008bb4:	e00514e3          	bnez	a0,800089bc <__printf+0xa4>
    80008bb8:	1a0c1663          	bnez	s8,80008d64 <__printf+0x44c>
    80008bbc:	08813083          	ld	ra,136(sp)
    80008bc0:	08013403          	ld	s0,128(sp)
    80008bc4:	07813483          	ld	s1,120(sp)
    80008bc8:	07013903          	ld	s2,112(sp)
    80008bcc:	06813983          	ld	s3,104(sp)
    80008bd0:	06013a03          	ld	s4,96(sp)
    80008bd4:	05813a83          	ld	s5,88(sp)
    80008bd8:	05013b03          	ld	s6,80(sp)
    80008bdc:	04813b83          	ld	s7,72(sp)
    80008be0:	04013c03          	ld	s8,64(sp)
    80008be4:	03813c83          	ld	s9,56(sp)
    80008be8:	03013d03          	ld	s10,48(sp)
    80008bec:	02813d83          	ld	s11,40(sp)
    80008bf0:	0d010113          	addi	sp,sp,208
    80008bf4:	00008067          	ret
    80008bf8:	07300713          	li	a4,115
    80008bfc:	1ce78a63          	beq	a5,a4,80008dd0 <__printf+0x4b8>
    80008c00:	07800713          	li	a4,120
    80008c04:	1ee79e63          	bne	a5,a4,80008e00 <__printf+0x4e8>
    80008c08:	f7843783          	ld	a5,-136(s0)
    80008c0c:	0007a703          	lw	a4,0(a5)
    80008c10:	00878793          	addi	a5,a5,8
    80008c14:	f6f43c23          	sd	a5,-136(s0)
    80008c18:	28074263          	bltz	a4,80008e9c <__printf+0x584>
    80008c1c:	00002d97          	auipc	s11,0x2
    80008c20:	cdcd8d93          	addi	s11,s11,-804 # 8000a8f8 <digits>
    80008c24:	00f77793          	andi	a5,a4,15
    80008c28:	00fd87b3          	add	a5,s11,a5
    80008c2c:	0007c683          	lbu	a3,0(a5)
    80008c30:	00f00613          	li	a2,15
    80008c34:	0007079b          	sext.w	a5,a4
    80008c38:	f8d40023          	sb	a3,-128(s0)
    80008c3c:	0047559b          	srliw	a1,a4,0x4
    80008c40:	0047569b          	srliw	a3,a4,0x4
    80008c44:	00000c93          	li	s9,0
    80008c48:	0ee65063          	bge	a2,a4,80008d28 <__printf+0x410>
    80008c4c:	00f6f693          	andi	a3,a3,15
    80008c50:	00dd86b3          	add	a3,s11,a3
    80008c54:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80008c58:	0087d79b          	srliw	a5,a5,0x8
    80008c5c:	00100c93          	li	s9,1
    80008c60:	f8d400a3          	sb	a3,-127(s0)
    80008c64:	0cb67263          	bgeu	a2,a1,80008d28 <__printf+0x410>
    80008c68:	00f7f693          	andi	a3,a5,15
    80008c6c:	00dd86b3          	add	a3,s11,a3
    80008c70:	0006c583          	lbu	a1,0(a3)
    80008c74:	00f00613          	li	a2,15
    80008c78:	0047d69b          	srliw	a3,a5,0x4
    80008c7c:	f8b40123          	sb	a1,-126(s0)
    80008c80:	0047d593          	srli	a1,a5,0x4
    80008c84:	28f67e63          	bgeu	a2,a5,80008f20 <__printf+0x608>
    80008c88:	00f6f693          	andi	a3,a3,15
    80008c8c:	00dd86b3          	add	a3,s11,a3
    80008c90:	0006c503          	lbu	a0,0(a3)
    80008c94:	0087d813          	srli	a6,a5,0x8
    80008c98:	0087d69b          	srliw	a3,a5,0x8
    80008c9c:	f8a401a3          	sb	a0,-125(s0)
    80008ca0:	28b67663          	bgeu	a2,a1,80008f2c <__printf+0x614>
    80008ca4:	00f6f693          	andi	a3,a3,15
    80008ca8:	00dd86b3          	add	a3,s11,a3
    80008cac:	0006c583          	lbu	a1,0(a3)
    80008cb0:	00c7d513          	srli	a0,a5,0xc
    80008cb4:	00c7d69b          	srliw	a3,a5,0xc
    80008cb8:	f8b40223          	sb	a1,-124(s0)
    80008cbc:	29067a63          	bgeu	a2,a6,80008f50 <__printf+0x638>
    80008cc0:	00f6f693          	andi	a3,a3,15
    80008cc4:	00dd86b3          	add	a3,s11,a3
    80008cc8:	0006c583          	lbu	a1,0(a3)
    80008ccc:	0107d813          	srli	a6,a5,0x10
    80008cd0:	0107d69b          	srliw	a3,a5,0x10
    80008cd4:	f8b402a3          	sb	a1,-123(s0)
    80008cd8:	28a67263          	bgeu	a2,a0,80008f5c <__printf+0x644>
    80008cdc:	00f6f693          	andi	a3,a3,15
    80008ce0:	00dd86b3          	add	a3,s11,a3
    80008ce4:	0006c683          	lbu	a3,0(a3)
    80008ce8:	0147d79b          	srliw	a5,a5,0x14
    80008cec:	f8d40323          	sb	a3,-122(s0)
    80008cf0:	21067663          	bgeu	a2,a6,80008efc <__printf+0x5e4>
    80008cf4:	02079793          	slli	a5,a5,0x20
    80008cf8:	0207d793          	srli	a5,a5,0x20
    80008cfc:	00fd8db3          	add	s11,s11,a5
    80008d00:	000dc683          	lbu	a3,0(s11)
    80008d04:	00800793          	li	a5,8
    80008d08:	00700c93          	li	s9,7
    80008d0c:	f8d403a3          	sb	a3,-121(s0)
    80008d10:	00075c63          	bgez	a4,80008d28 <__printf+0x410>
    80008d14:	f9040713          	addi	a4,s0,-112
    80008d18:	00f70733          	add	a4,a4,a5
    80008d1c:	02d00693          	li	a3,45
    80008d20:	fed70823          	sb	a3,-16(a4)
    80008d24:	00078c93          	mv	s9,a5
    80008d28:	f8040793          	addi	a5,s0,-128
    80008d2c:	01978cb3          	add	s9,a5,s9
    80008d30:	f7f40d13          	addi	s10,s0,-129
    80008d34:	000cc503          	lbu	a0,0(s9)
    80008d38:	fffc8c93          	addi	s9,s9,-1
    80008d3c:	00000097          	auipc	ra,0x0
    80008d40:	9f8080e7          	jalr	-1544(ra) # 80008734 <consputc>
    80008d44:	ff9d18e3          	bne	s10,s9,80008d34 <__printf+0x41c>
    80008d48:	0100006f          	j	80008d58 <__printf+0x440>
    80008d4c:	00000097          	auipc	ra,0x0
    80008d50:	9e8080e7          	jalr	-1560(ra) # 80008734 <consputc>
    80008d54:	000c8493          	mv	s1,s9
    80008d58:	00094503          	lbu	a0,0(s2)
    80008d5c:	c60510e3          	bnez	a0,800089bc <__printf+0xa4>
    80008d60:	e40c0ee3          	beqz	s8,80008bbc <__printf+0x2a4>
    80008d64:	00006517          	auipc	a0,0x6
    80008d68:	80c50513          	addi	a0,a0,-2036 # 8000e570 <pr>
    80008d6c:	00001097          	auipc	ra,0x1
    80008d70:	94c080e7          	jalr	-1716(ra) # 800096b8 <release>
    80008d74:	e49ff06f          	j	80008bbc <__printf+0x2a4>
    80008d78:	f7843783          	ld	a5,-136(s0)
    80008d7c:	03000513          	li	a0,48
    80008d80:	01000d13          	li	s10,16
    80008d84:	00878713          	addi	a4,a5,8
    80008d88:	0007bc83          	ld	s9,0(a5)
    80008d8c:	f6e43c23          	sd	a4,-136(s0)
    80008d90:	00000097          	auipc	ra,0x0
    80008d94:	9a4080e7          	jalr	-1628(ra) # 80008734 <consputc>
    80008d98:	07800513          	li	a0,120
    80008d9c:	00000097          	auipc	ra,0x0
    80008da0:	998080e7          	jalr	-1640(ra) # 80008734 <consputc>
    80008da4:	00002d97          	auipc	s11,0x2
    80008da8:	b54d8d93          	addi	s11,s11,-1196 # 8000a8f8 <digits>
    80008dac:	03ccd793          	srli	a5,s9,0x3c
    80008db0:	00fd87b3          	add	a5,s11,a5
    80008db4:	0007c503          	lbu	a0,0(a5)
    80008db8:	fffd0d1b          	addiw	s10,s10,-1
    80008dbc:	004c9c93          	slli	s9,s9,0x4
    80008dc0:	00000097          	auipc	ra,0x0
    80008dc4:	974080e7          	jalr	-1676(ra) # 80008734 <consputc>
    80008dc8:	fe0d12e3          	bnez	s10,80008dac <__printf+0x494>
    80008dcc:	f8dff06f          	j	80008d58 <__printf+0x440>
    80008dd0:	f7843783          	ld	a5,-136(s0)
    80008dd4:	0007bc83          	ld	s9,0(a5)
    80008dd8:	00878793          	addi	a5,a5,8
    80008ddc:	f6f43c23          	sd	a5,-136(s0)
    80008de0:	000c9a63          	bnez	s9,80008df4 <__printf+0x4dc>
    80008de4:	1080006f          	j	80008eec <__printf+0x5d4>
    80008de8:	001c8c93          	addi	s9,s9,1
    80008dec:	00000097          	auipc	ra,0x0
    80008df0:	948080e7          	jalr	-1720(ra) # 80008734 <consputc>
    80008df4:	000cc503          	lbu	a0,0(s9)
    80008df8:	fe0518e3          	bnez	a0,80008de8 <__printf+0x4d0>
    80008dfc:	f5dff06f          	j	80008d58 <__printf+0x440>
    80008e00:	02500513          	li	a0,37
    80008e04:	00000097          	auipc	ra,0x0
    80008e08:	930080e7          	jalr	-1744(ra) # 80008734 <consputc>
    80008e0c:	000c8513          	mv	a0,s9
    80008e10:	00000097          	auipc	ra,0x0
    80008e14:	924080e7          	jalr	-1756(ra) # 80008734 <consputc>
    80008e18:	f41ff06f          	j	80008d58 <__printf+0x440>
    80008e1c:	02500513          	li	a0,37
    80008e20:	00000097          	auipc	ra,0x0
    80008e24:	914080e7          	jalr	-1772(ra) # 80008734 <consputc>
    80008e28:	f31ff06f          	j	80008d58 <__printf+0x440>
    80008e2c:	00030513          	mv	a0,t1
    80008e30:	00000097          	auipc	ra,0x0
    80008e34:	7bc080e7          	jalr	1980(ra) # 800095ec <acquire>
    80008e38:	b4dff06f          	j	80008984 <__printf+0x6c>
    80008e3c:	40c0053b          	negw	a0,a2
    80008e40:	00a00713          	li	a4,10
    80008e44:	02e576bb          	remuw	a3,a0,a4
    80008e48:	00002d97          	auipc	s11,0x2
    80008e4c:	ab0d8d93          	addi	s11,s11,-1360 # 8000a8f8 <digits>
    80008e50:	ff700593          	li	a1,-9
    80008e54:	02069693          	slli	a3,a3,0x20
    80008e58:	0206d693          	srli	a3,a3,0x20
    80008e5c:	00dd86b3          	add	a3,s11,a3
    80008e60:	0006c683          	lbu	a3,0(a3)
    80008e64:	02e557bb          	divuw	a5,a0,a4
    80008e68:	f8d40023          	sb	a3,-128(s0)
    80008e6c:	10b65e63          	bge	a2,a1,80008f88 <__printf+0x670>
    80008e70:	06300593          	li	a1,99
    80008e74:	02e7f6bb          	remuw	a3,a5,a4
    80008e78:	02069693          	slli	a3,a3,0x20
    80008e7c:	0206d693          	srli	a3,a3,0x20
    80008e80:	00dd86b3          	add	a3,s11,a3
    80008e84:	0006c683          	lbu	a3,0(a3)
    80008e88:	02e7d73b          	divuw	a4,a5,a4
    80008e8c:	00200793          	li	a5,2
    80008e90:	f8d400a3          	sb	a3,-127(s0)
    80008e94:	bca5ece3          	bltu	a1,a0,80008a6c <__printf+0x154>
    80008e98:	ce5ff06f          	j	80008b7c <__printf+0x264>
    80008e9c:	40e007bb          	negw	a5,a4
    80008ea0:	00002d97          	auipc	s11,0x2
    80008ea4:	a58d8d93          	addi	s11,s11,-1448 # 8000a8f8 <digits>
    80008ea8:	00f7f693          	andi	a3,a5,15
    80008eac:	00dd86b3          	add	a3,s11,a3
    80008eb0:	0006c583          	lbu	a1,0(a3)
    80008eb4:	ff100613          	li	a2,-15
    80008eb8:	0047d69b          	srliw	a3,a5,0x4
    80008ebc:	f8b40023          	sb	a1,-128(s0)
    80008ec0:	0047d59b          	srliw	a1,a5,0x4
    80008ec4:	0ac75e63          	bge	a4,a2,80008f80 <__printf+0x668>
    80008ec8:	00f6f693          	andi	a3,a3,15
    80008ecc:	00dd86b3          	add	a3,s11,a3
    80008ed0:	0006c603          	lbu	a2,0(a3)
    80008ed4:	00f00693          	li	a3,15
    80008ed8:	0087d79b          	srliw	a5,a5,0x8
    80008edc:	f8c400a3          	sb	a2,-127(s0)
    80008ee0:	d8b6e4e3          	bltu	a3,a1,80008c68 <__printf+0x350>
    80008ee4:	00200793          	li	a5,2
    80008ee8:	e2dff06f          	j	80008d14 <__printf+0x3fc>
    80008eec:	00002c97          	auipc	s9,0x2
    80008ef0:	9ecc8c93          	addi	s9,s9,-1556 # 8000a8d8 <CONSOLE_STATUS+0x8c8>
    80008ef4:	02800513          	li	a0,40
    80008ef8:	ef1ff06f          	j	80008de8 <__printf+0x4d0>
    80008efc:	00700793          	li	a5,7
    80008f00:	00600c93          	li	s9,6
    80008f04:	e0dff06f          	j	80008d10 <__printf+0x3f8>
    80008f08:	00700793          	li	a5,7
    80008f0c:	00600c93          	li	s9,6
    80008f10:	c69ff06f          	j	80008b78 <__printf+0x260>
    80008f14:	00300793          	li	a5,3
    80008f18:	00200c93          	li	s9,2
    80008f1c:	c5dff06f          	j	80008b78 <__printf+0x260>
    80008f20:	00300793          	li	a5,3
    80008f24:	00200c93          	li	s9,2
    80008f28:	de9ff06f          	j	80008d10 <__printf+0x3f8>
    80008f2c:	00400793          	li	a5,4
    80008f30:	00300c93          	li	s9,3
    80008f34:	dddff06f          	j	80008d10 <__printf+0x3f8>
    80008f38:	00400793          	li	a5,4
    80008f3c:	00300c93          	li	s9,3
    80008f40:	c39ff06f          	j	80008b78 <__printf+0x260>
    80008f44:	00500793          	li	a5,5
    80008f48:	00400c93          	li	s9,4
    80008f4c:	c2dff06f          	j	80008b78 <__printf+0x260>
    80008f50:	00500793          	li	a5,5
    80008f54:	00400c93          	li	s9,4
    80008f58:	db9ff06f          	j	80008d10 <__printf+0x3f8>
    80008f5c:	00600793          	li	a5,6
    80008f60:	00500c93          	li	s9,5
    80008f64:	dadff06f          	j	80008d10 <__printf+0x3f8>
    80008f68:	00600793          	li	a5,6
    80008f6c:	00500c93          	li	s9,5
    80008f70:	c09ff06f          	j	80008b78 <__printf+0x260>
    80008f74:	00800793          	li	a5,8
    80008f78:	00700c93          	li	s9,7
    80008f7c:	bfdff06f          	j	80008b78 <__printf+0x260>
    80008f80:	00100793          	li	a5,1
    80008f84:	d91ff06f          	j	80008d14 <__printf+0x3fc>
    80008f88:	00100793          	li	a5,1
    80008f8c:	bf1ff06f          	j	80008b7c <__printf+0x264>
    80008f90:	00900793          	li	a5,9
    80008f94:	00800c93          	li	s9,8
    80008f98:	be1ff06f          	j	80008b78 <__printf+0x260>
    80008f9c:	00002517          	auipc	a0,0x2
    80008fa0:	94450513          	addi	a0,a0,-1724 # 8000a8e0 <CONSOLE_STATUS+0x8d0>
    80008fa4:	00000097          	auipc	ra,0x0
    80008fa8:	918080e7          	jalr	-1768(ra) # 800088bc <panic>

0000000080008fac <printfinit>:
    80008fac:	fe010113          	addi	sp,sp,-32
    80008fb0:	00813823          	sd	s0,16(sp)
    80008fb4:	00913423          	sd	s1,8(sp)
    80008fb8:	00113c23          	sd	ra,24(sp)
    80008fbc:	02010413          	addi	s0,sp,32
    80008fc0:	00005497          	auipc	s1,0x5
    80008fc4:	5b048493          	addi	s1,s1,1456 # 8000e570 <pr>
    80008fc8:	00048513          	mv	a0,s1
    80008fcc:	00002597          	auipc	a1,0x2
    80008fd0:	92458593          	addi	a1,a1,-1756 # 8000a8f0 <CONSOLE_STATUS+0x8e0>
    80008fd4:	00000097          	auipc	ra,0x0
    80008fd8:	5f4080e7          	jalr	1524(ra) # 800095c8 <initlock>
    80008fdc:	01813083          	ld	ra,24(sp)
    80008fe0:	01013403          	ld	s0,16(sp)
    80008fe4:	0004ac23          	sw	zero,24(s1)
    80008fe8:	00813483          	ld	s1,8(sp)
    80008fec:	02010113          	addi	sp,sp,32
    80008ff0:	00008067          	ret

0000000080008ff4 <uartinit>:
    80008ff4:	ff010113          	addi	sp,sp,-16
    80008ff8:	00813423          	sd	s0,8(sp)
    80008ffc:	01010413          	addi	s0,sp,16
    80009000:	100007b7          	lui	a5,0x10000
    80009004:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80009008:	f8000713          	li	a4,-128
    8000900c:	00e781a3          	sb	a4,3(a5)
    80009010:	00300713          	li	a4,3
    80009014:	00e78023          	sb	a4,0(a5)
    80009018:	000780a3          	sb	zero,1(a5)
    8000901c:	00e781a3          	sb	a4,3(a5)
    80009020:	00700693          	li	a3,7
    80009024:	00d78123          	sb	a3,2(a5)
    80009028:	00e780a3          	sb	a4,1(a5)
    8000902c:	00813403          	ld	s0,8(sp)
    80009030:	01010113          	addi	sp,sp,16
    80009034:	00008067          	ret

0000000080009038 <uartputc>:
    80009038:	00004797          	auipc	a5,0x4
    8000903c:	1607a783          	lw	a5,352(a5) # 8000d198 <panicked>
    80009040:	00078463          	beqz	a5,80009048 <uartputc+0x10>
    80009044:	0000006f          	j	80009044 <uartputc+0xc>
    80009048:	fd010113          	addi	sp,sp,-48
    8000904c:	02813023          	sd	s0,32(sp)
    80009050:	00913c23          	sd	s1,24(sp)
    80009054:	01213823          	sd	s2,16(sp)
    80009058:	01313423          	sd	s3,8(sp)
    8000905c:	02113423          	sd	ra,40(sp)
    80009060:	03010413          	addi	s0,sp,48
    80009064:	00004917          	auipc	s2,0x4
    80009068:	13c90913          	addi	s2,s2,316 # 8000d1a0 <uart_tx_r>
    8000906c:	00093783          	ld	a5,0(s2)
    80009070:	00004497          	auipc	s1,0x4
    80009074:	13848493          	addi	s1,s1,312 # 8000d1a8 <uart_tx_w>
    80009078:	0004b703          	ld	a4,0(s1)
    8000907c:	02078693          	addi	a3,a5,32
    80009080:	00050993          	mv	s3,a0
    80009084:	02e69c63          	bne	a3,a4,800090bc <uartputc+0x84>
    80009088:	00001097          	auipc	ra,0x1
    8000908c:	834080e7          	jalr	-1996(ra) # 800098bc <push_on>
    80009090:	00093783          	ld	a5,0(s2)
    80009094:	0004b703          	ld	a4,0(s1)
    80009098:	02078793          	addi	a5,a5,32
    8000909c:	00e79463          	bne	a5,a4,800090a4 <uartputc+0x6c>
    800090a0:	0000006f          	j	800090a0 <uartputc+0x68>
    800090a4:	00001097          	auipc	ra,0x1
    800090a8:	88c080e7          	jalr	-1908(ra) # 80009930 <pop_on>
    800090ac:	00093783          	ld	a5,0(s2)
    800090b0:	0004b703          	ld	a4,0(s1)
    800090b4:	02078693          	addi	a3,a5,32
    800090b8:	fce688e3          	beq	a3,a4,80009088 <uartputc+0x50>
    800090bc:	01f77693          	andi	a3,a4,31
    800090c0:	00005597          	auipc	a1,0x5
    800090c4:	4d058593          	addi	a1,a1,1232 # 8000e590 <uart_tx_buf>
    800090c8:	00d586b3          	add	a3,a1,a3
    800090cc:	00170713          	addi	a4,a4,1
    800090d0:	01368023          	sb	s3,0(a3)
    800090d4:	00e4b023          	sd	a4,0(s1)
    800090d8:	10000637          	lui	a2,0x10000
    800090dc:	02f71063          	bne	a4,a5,800090fc <uartputc+0xc4>
    800090e0:	0340006f          	j	80009114 <uartputc+0xdc>
    800090e4:	00074703          	lbu	a4,0(a4)
    800090e8:	00f93023          	sd	a5,0(s2)
    800090ec:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800090f0:	00093783          	ld	a5,0(s2)
    800090f4:	0004b703          	ld	a4,0(s1)
    800090f8:	00f70e63          	beq	a4,a5,80009114 <uartputc+0xdc>
    800090fc:	00564683          	lbu	a3,5(a2)
    80009100:	01f7f713          	andi	a4,a5,31
    80009104:	00e58733          	add	a4,a1,a4
    80009108:	0206f693          	andi	a3,a3,32
    8000910c:	00178793          	addi	a5,a5,1
    80009110:	fc069ae3          	bnez	a3,800090e4 <uartputc+0xac>
    80009114:	02813083          	ld	ra,40(sp)
    80009118:	02013403          	ld	s0,32(sp)
    8000911c:	01813483          	ld	s1,24(sp)
    80009120:	01013903          	ld	s2,16(sp)
    80009124:	00813983          	ld	s3,8(sp)
    80009128:	03010113          	addi	sp,sp,48
    8000912c:	00008067          	ret

0000000080009130 <uartputc_sync>:
    80009130:	ff010113          	addi	sp,sp,-16
    80009134:	00813423          	sd	s0,8(sp)
    80009138:	01010413          	addi	s0,sp,16
    8000913c:	00004717          	auipc	a4,0x4
    80009140:	05c72703          	lw	a4,92(a4) # 8000d198 <panicked>
    80009144:	02071663          	bnez	a4,80009170 <uartputc_sync+0x40>
    80009148:	00050793          	mv	a5,a0
    8000914c:	100006b7          	lui	a3,0x10000
    80009150:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80009154:	02077713          	andi	a4,a4,32
    80009158:	fe070ce3          	beqz	a4,80009150 <uartputc_sync+0x20>
    8000915c:	0ff7f793          	andi	a5,a5,255
    80009160:	00f68023          	sb	a5,0(a3)
    80009164:	00813403          	ld	s0,8(sp)
    80009168:	01010113          	addi	sp,sp,16
    8000916c:	00008067          	ret
    80009170:	0000006f          	j	80009170 <uartputc_sync+0x40>

0000000080009174 <uartstart>:
    80009174:	ff010113          	addi	sp,sp,-16
    80009178:	00813423          	sd	s0,8(sp)
    8000917c:	01010413          	addi	s0,sp,16
    80009180:	00004617          	auipc	a2,0x4
    80009184:	02060613          	addi	a2,a2,32 # 8000d1a0 <uart_tx_r>
    80009188:	00004517          	auipc	a0,0x4
    8000918c:	02050513          	addi	a0,a0,32 # 8000d1a8 <uart_tx_w>
    80009190:	00063783          	ld	a5,0(a2)
    80009194:	00053703          	ld	a4,0(a0)
    80009198:	04f70263          	beq	a4,a5,800091dc <uartstart+0x68>
    8000919c:	100005b7          	lui	a1,0x10000
    800091a0:	00005817          	auipc	a6,0x5
    800091a4:	3f080813          	addi	a6,a6,1008 # 8000e590 <uart_tx_buf>
    800091a8:	01c0006f          	j	800091c4 <uartstart+0x50>
    800091ac:	0006c703          	lbu	a4,0(a3)
    800091b0:	00f63023          	sd	a5,0(a2)
    800091b4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800091b8:	00063783          	ld	a5,0(a2)
    800091bc:	00053703          	ld	a4,0(a0)
    800091c0:	00f70e63          	beq	a4,a5,800091dc <uartstart+0x68>
    800091c4:	01f7f713          	andi	a4,a5,31
    800091c8:	00e806b3          	add	a3,a6,a4
    800091cc:	0055c703          	lbu	a4,5(a1)
    800091d0:	00178793          	addi	a5,a5,1
    800091d4:	02077713          	andi	a4,a4,32
    800091d8:	fc071ae3          	bnez	a4,800091ac <uartstart+0x38>
    800091dc:	00813403          	ld	s0,8(sp)
    800091e0:	01010113          	addi	sp,sp,16
    800091e4:	00008067          	ret

00000000800091e8 <uartgetc>:
    800091e8:	ff010113          	addi	sp,sp,-16
    800091ec:	00813423          	sd	s0,8(sp)
    800091f0:	01010413          	addi	s0,sp,16
    800091f4:	10000737          	lui	a4,0x10000
    800091f8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800091fc:	0017f793          	andi	a5,a5,1
    80009200:	00078c63          	beqz	a5,80009218 <uartgetc+0x30>
    80009204:	00074503          	lbu	a0,0(a4)
    80009208:	0ff57513          	andi	a0,a0,255
    8000920c:	00813403          	ld	s0,8(sp)
    80009210:	01010113          	addi	sp,sp,16
    80009214:	00008067          	ret
    80009218:	fff00513          	li	a0,-1
    8000921c:	ff1ff06f          	j	8000920c <uartgetc+0x24>

0000000080009220 <uartintr>:
    80009220:	100007b7          	lui	a5,0x10000
    80009224:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80009228:	0017f793          	andi	a5,a5,1
    8000922c:	0a078463          	beqz	a5,800092d4 <uartintr+0xb4>
    80009230:	fe010113          	addi	sp,sp,-32
    80009234:	00813823          	sd	s0,16(sp)
    80009238:	00913423          	sd	s1,8(sp)
    8000923c:	00113c23          	sd	ra,24(sp)
    80009240:	02010413          	addi	s0,sp,32
    80009244:	100004b7          	lui	s1,0x10000
    80009248:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000924c:	0ff57513          	andi	a0,a0,255
    80009250:	fffff097          	auipc	ra,0xfffff
    80009254:	534080e7          	jalr	1332(ra) # 80008784 <consoleintr>
    80009258:	0054c783          	lbu	a5,5(s1)
    8000925c:	0017f793          	andi	a5,a5,1
    80009260:	fe0794e3          	bnez	a5,80009248 <uartintr+0x28>
    80009264:	00004617          	auipc	a2,0x4
    80009268:	f3c60613          	addi	a2,a2,-196 # 8000d1a0 <uart_tx_r>
    8000926c:	00004517          	auipc	a0,0x4
    80009270:	f3c50513          	addi	a0,a0,-196 # 8000d1a8 <uart_tx_w>
    80009274:	00063783          	ld	a5,0(a2)
    80009278:	00053703          	ld	a4,0(a0)
    8000927c:	04f70263          	beq	a4,a5,800092c0 <uartintr+0xa0>
    80009280:	100005b7          	lui	a1,0x10000
    80009284:	00005817          	auipc	a6,0x5
    80009288:	30c80813          	addi	a6,a6,780 # 8000e590 <uart_tx_buf>
    8000928c:	01c0006f          	j	800092a8 <uartintr+0x88>
    80009290:	0006c703          	lbu	a4,0(a3)
    80009294:	00f63023          	sd	a5,0(a2)
    80009298:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000929c:	00063783          	ld	a5,0(a2)
    800092a0:	00053703          	ld	a4,0(a0)
    800092a4:	00f70e63          	beq	a4,a5,800092c0 <uartintr+0xa0>
    800092a8:	01f7f713          	andi	a4,a5,31
    800092ac:	00e806b3          	add	a3,a6,a4
    800092b0:	0055c703          	lbu	a4,5(a1)
    800092b4:	00178793          	addi	a5,a5,1
    800092b8:	02077713          	andi	a4,a4,32
    800092bc:	fc071ae3          	bnez	a4,80009290 <uartintr+0x70>
    800092c0:	01813083          	ld	ra,24(sp)
    800092c4:	01013403          	ld	s0,16(sp)
    800092c8:	00813483          	ld	s1,8(sp)
    800092cc:	02010113          	addi	sp,sp,32
    800092d0:	00008067          	ret
    800092d4:	00004617          	auipc	a2,0x4
    800092d8:	ecc60613          	addi	a2,a2,-308 # 8000d1a0 <uart_tx_r>
    800092dc:	00004517          	auipc	a0,0x4
    800092e0:	ecc50513          	addi	a0,a0,-308 # 8000d1a8 <uart_tx_w>
    800092e4:	00063783          	ld	a5,0(a2)
    800092e8:	00053703          	ld	a4,0(a0)
    800092ec:	04f70263          	beq	a4,a5,80009330 <uartintr+0x110>
    800092f0:	100005b7          	lui	a1,0x10000
    800092f4:	00005817          	auipc	a6,0x5
    800092f8:	29c80813          	addi	a6,a6,668 # 8000e590 <uart_tx_buf>
    800092fc:	01c0006f          	j	80009318 <uartintr+0xf8>
    80009300:	0006c703          	lbu	a4,0(a3)
    80009304:	00f63023          	sd	a5,0(a2)
    80009308:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000930c:	00063783          	ld	a5,0(a2)
    80009310:	00053703          	ld	a4,0(a0)
    80009314:	02f70063          	beq	a4,a5,80009334 <uartintr+0x114>
    80009318:	01f7f713          	andi	a4,a5,31
    8000931c:	00e806b3          	add	a3,a6,a4
    80009320:	0055c703          	lbu	a4,5(a1)
    80009324:	00178793          	addi	a5,a5,1
    80009328:	02077713          	andi	a4,a4,32
    8000932c:	fc071ae3          	bnez	a4,80009300 <uartintr+0xe0>
    80009330:	00008067          	ret
    80009334:	00008067          	ret

0000000080009338 <kinit>:
    80009338:	fc010113          	addi	sp,sp,-64
    8000933c:	02913423          	sd	s1,40(sp)
    80009340:	fffff7b7          	lui	a5,0xfffff
    80009344:	00006497          	auipc	s1,0x6
    80009348:	26b48493          	addi	s1,s1,619 # 8000f5af <end+0xfff>
    8000934c:	02813823          	sd	s0,48(sp)
    80009350:	01313c23          	sd	s3,24(sp)
    80009354:	00f4f4b3          	and	s1,s1,a5
    80009358:	02113c23          	sd	ra,56(sp)
    8000935c:	03213023          	sd	s2,32(sp)
    80009360:	01413823          	sd	s4,16(sp)
    80009364:	01513423          	sd	s5,8(sp)
    80009368:	04010413          	addi	s0,sp,64
    8000936c:	000017b7          	lui	a5,0x1
    80009370:	01100993          	li	s3,17
    80009374:	00f487b3          	add	a5,s1,a5
    80009378:	01b99993          	slli	s3,s3,0x1b
    8000937c:	06f9e063          	bltu	s3,a5,800093dc <kinit+0xa4>
    80009380:	00005a97          	auipc	s5,0x5
    80009384:	230a8a93          	addi	s5,s5,560 # 8000e5b0 <end>
    80009388:	0754ec63          	bltu	s1,s5,80009400 <kinit+0xc8>
    8000938c:	0734fa63          	bgeu	s1,s3,80009400 <kinit+0xc8>
    80009390:	00088a37          	lui	s4,0x88
    80009394:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80009398:	00004917          	auipc	s2,0x4
    8000939c:	e1890913          	addi	s2,s2,-488 # 8000d1b0 <kmem>
    800093a0:	00ca1a13          	slli	s4,s4,0xc
    800093a4:	0140006f          	j	800093b8 <kinit+0x80>
    800093a8:	000017b7          	lui	a5,0x1
    800093ac:	00f484b3          	add	s1,s1,a5
    800093b0:	0554e863          	bltu	s1,s5,80009400 <kinit+0xc8>
    800093b4:	0534f663          	bgeu	s1,s3,80009400 <kinit+0xc8>
    800093b8:	00001637          	lui	a2,0x1
    800093bc:	00100593          	li	a1,1
    800093c0:	00048513          	mv	a0,s1
    800093c4:	00000097          	auipc	ra,0x0
    800093c8:	5e4080e7          	jalr	1508(ra) # 800099a8 <__memset>
    800093cc:	00093783          	ld	a5,0(s2)
    800093d0:	00f4b023          	sd	a5,0(s1)
    800093d4:	00993023          	sd	s1,0(s2)
    800093d8:	fd4498e3          	bne	s1,s4,800093a8 <kinit+0x70>
    800093dc:	03813083          	ld	ra,56(sp)
    800093e0:	03013403          	ld	s0,48(sp)
    800093e4:	02813483          	ld	s1,40(sp)
    800093e8:	02013903          	ld	s2,32(sp)
    800093ec:	01813983          	ld	s3,24(sp)
    800093f0:	01013a03          	ld	s4,16(sp)
    800093f4:	00813a83          	ld	s5,8(sp)
    800093f8:	04010113          	addi	sp,sp,64
    800093fc:	00008067          	ret
    80009400:	00001517          	auipc	a0,0x1
    80009404:	51050513          	addi	a0,a0,1296 # 8000a910 <digits+0x18>
    80009408:	fffff097          	auipc	ra,0xfffff
    8000940c:	4b4080e7          	jalr	1204(ra) # 800088bc <panic>

0000000080009410 <freerange>:
    80009410:	fc010113          	addi	sp,sp,-64
    80009414:	000017b7          	lui	a5,0x1
    80009418:	02913423          	sd	s1,40(sp)
    8000941c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80009420:	009504b3          	add	s1,a0,s1
    80009424:	fffff537          	lui	a0,0xfffff
    80009428:	02813823          	sd	s0,48(sp)
    8000942c:	02113c23          	sd	ra,56(sp)
    80009430:	03213023          	sd	s2,32(sp)
    80009434:	01313c23          	sd	s3,24(sp)
    80009438:	01413823          	sd	s4,16(sp)
    8000943c:	01513423          	sd	s5,8(sp)
    80009440:	01613023          	sd	s6,0(sp)
    80009444:	04010413          	addi	s0,sp,64
    80009448:	00a4f4b3          	and	s1,s1,a0
    8000944c:	00f487b3          	add	a5,s1,a5
    80009450:	06f5e463          	bltu	a1,a5,800094b8 <freerange+0xa8>
    80009454:	00005a97          	auipc	s5,0x5
    80009458:	15ca8a93          	addi	s5,s5,348 # 8000e5b0 <end>
    8000945c:	0954e263          	bltu	s1,s5,800094e0 <freerange+0xd0>
    80009460:	01100993          	li	s3,17
    80009464:	01b99993          	slli	s3,s3,0x1b
    80009468:	0734fc63          	bgeu	s1,s3,800094e0 <freerange+0xd0>
    8000946c:	00058a13          	mv	s4,a1
    80009470:	00004917          	auipc	s2,0x4
    80009474:	d4090913          	addi	s2,s2,-704 # 8000d1b0 <kmem>
    80009478:	00002b37          	lui	s6,0x2
    8000947c:	0140006f          	j	80009490 <freerange+0x80>
    80009480:	000017b7          	lui	a5,0x1
    80009484:	00f484b3          	add	s1,s1,a5
    80009488:	0554ec63          	bltu	s1,s5,800094e0 <freerange+0xd0>
    8000948c:	0534fa63          	bgeu	s1,s3,800094e0 <freerange+0xd0>
    80009490:	00001637          	lui	a2,0x1
    80009494:	00100593          	li	a1,1
    80009498:	00048513          	mv	a0,s1
    8000949c:	00000097          	auipc	ra,0x0
    800094a0:	50c080e7          	jalr	1292(ra) # 800099a8 <__memset>
    800094a4:	00093703          	ld	a4,0(s2)
    800094a8:	016487b3          	add	a5,s1,s6
    800094ac:	00e4b023          	sd	a4,0(s1)
    800094b0:	00993023          	sd	s1,0(s2)
    800094b4:	fcfa76e3          	bgeu	s4,a5,80009480 <freerange+0x70>
    800094b8:	03813083          	ld	ra,56(sp)
    800094bc:	03013403          	ld	s0,48(sp)
    800094c0:	02813483          	ld	s1,40(sp)
    800094c4:	02013903          	ld	s2,32(sp)
    800094c8:	01813983          	ld	s3,24(sp)
    800094cc:	01013a03          	ld	s4,16(sp)
    800094d0:	00813a83          	ld	s5,8(sp)
    800094d4:	00013b03          	ld	s6,0(sp)
    800094d8:	04010113          	addi	sp,sp,64
    800094dc:	00008067          	ret
    800094e0:	00001517          	auipc	a0,0x1
    800094e4:	43050513          	addi	a0,a0,1072 # 8000a910 <digits+0x18>
    800094e8:	fffff097          	auipc	ra,0xfffff
    800094ec:	3d4080e7          	jalr	980(ra) # 800088bc <panic>

00000000800094f0 <kfree>:
    800094f0:	fe010113          	addi	sp,sp,-32
    800094f4:	00813823          	sd	s0,16(sp)
    800094f8:	00113c23          	sd	ra,24(sp)
    800094fc:	00913423          	sd	s1,8(sp)
    80009500:	02010413          	addi	s0,sp,32
    80009504:	03451793          	slli	a5,a0,0x34
    80009508:	04079c63          	bnez	a5,80009560 <kfree+0x70>
    8000950c:	00005797          	auipc	a5,0x5
    80009510:	0a478793          	addi	a5,a5,164 # 8000e5b0 <end>
    80009514:	00050493          	mv	s1,a0
    80009518:	04f56463          	bltu	a0,a5,80009560 <kfree+0x70>
    8000951c:	01100793          	li	a5,17
    80009520:	01b79793          	slli	a5,a5,0x1b
    80009524:	02f57e63          	bgeu	a0,a5,80009560 <kfree+0x70>
    80009528:	00001637          	lui	a2,0x1
    8000952c:	00100593          	li	a1,1
    80009530:	00000097          	auipc	ra,0x0
    80009534:	478080e7          	jalr	1144(ra) # 800099a8 <__memset>
    80009538:	00004797          	auipc	a5,0x4
    8000953c:	c7878793          	addi	a5,a5,-904 # 8000d1b0 <kmem>
    80009540:	0007b703          	ld	a4,0(a5)
    80009544:	01813083          	ld	ra,24(sp)
    80009548:	01013403          	ld	s0,16(sp)
    8000954c:	00e4b023          	sd	a4,0(s1)
    80009550:	0097b023          	sd	s1,0(a5)
    80009554:	00813483          	ld	s1,8(sp)
    80009558:	02010113          	addi	sp,sp,32
    8000955c:	00008067          	ret
    80009560:	00001517          	auipc	a0,0x1
    80009564:	3b050513          	addi	a0,a0,944 # 8000a910 <digits+0x18>
    80009568:	fffff097          	auipc	ra,0xfffff
    8000956c:	354080e7          	jalr	852(ra) # 800088bc <panic>

0000000080009570 <kalloc>:
    80009570:	fe010113          	addi	sp,sp,-32
    80009574:	00813823          	sd	s0,16(sp)
    80009578:	00913423          	sd	s1,8(sp)
    8000957c:	00113c23          	sd	ra,24(sp)
    80009580:	02010413          	addi	s0,sp,32
    80009584:	00004797          	auipc	a5,0x4
    80009588:	c2c78793          	addi	a5,a5,-980 # 8000d1b0 <kmem>
    8000958c:	0007b483          	ld	s1,0(a5)
    80009590:	02048063          	beqz	s1,800095b0 <kalloc+0x40>
    80009594:	0004b703          	ld	a4,0(s1)
    80009598:	00001637          	lui	a2,0x1
    8000959c:	00500593          	li	a1,5
    800095a0:	00048513          	mv	a0,s1
    800095a4:	00e7b023          	sd	a4,0(a5)
    800095a8:	00000097          	auipc	ra,0x0
    800095ac:	400080e7          	jalr	1024(ra) # 800099a8 <__memset>
    800095b0:	01813083          	ld	ra,24(sp)
    800095b4:	01013403          	ld	s0,16(sp)
    800095b8:	00048513          	mv	a0,s1
    800095bc:	00813483          	ld	s1,8(sp)
    800095c0:	02010113          	addi	sp,sp,32
    800095c4:	00008067          	ret

00000000800095c8 <initlock>:
    800095c8:	ff010113          	addi	sp,sp,-16
    800095cc:	00813423          	sd	s0,8(sp)
    800095d0:	01010413          	addi	s0,sp,16
    800095d4:	00813403          	ld	s0,8(sp)
    800095d8:	00b53423          	sd	a1,8(a0)
    800095dc:	00052023          	sw	zero,0(a0)
    800095e0:	00053823          	sd	zero,16(a0)
    800095e4:	01010113          	addi	sp,sp,16
    800095e8:	00008067          	ret

00000000800095ec <acquire>:
    800095ec:	fe010113          	addi	sp,sp,-32
    800095f0:	00813823          	sd	s0,16(sp)
    800095f4:	00913423          	sd	s1,8(sp)
    800095f8:	00113c23          	sd	ra,24(sp)
    800095fc:	01213023          	sd	s2,0(sp)
    80009600:	02010413          	addi	s0,sp,32
    80009604:	00050493          	mv	s1,a0
    80009608:	10002973          	csrr	s2,sstatus
    8000960c:	100027f3          	csrr	a5,sstatus
    80009610:	ffd7f793          	andi	a5,a5,-3
    80009614:	10079073          	csrw	sstatus,a5
    80009618:	fffff097          	auipc	ra,0xfffff
    8000961c:	8e8080e7          	jalr	-1816(ra) # 80007f00 <mycpu>
    80009620:	07852783          	lw	a5,120(a0)
    80009624:	06078e63          	beqz	a5,800096a0 <acquire+0xb4>
    80009628:	fffff097          	auipc	ra,0xfffff
    8000962c:	8d8080e7          	jalr	-1832(ra) # 80007f00 <mycpu>
    80009630:	07852783          	lw	a5,120(a0)
    80009634:	0004a703          	lw	a4,0(s1)
    80009638:	0017879b          	addiw	a5,a5,1
    8000963c:	06f52c23          	sw	a5,120(a0)
    80009640:	04071063          	bnez	a4,80009680 <acquire+0x94>
    80009644:	00100713          	li	a4,1
    80009648:	00070793          	mv	a5,a4
    8000964c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80009650:	0007879b          	sext.w	a5,a5
    80009654:	fe079ae3          	bnez	a5,80009648 <acquire+0x5c>
    80009658:	0ff0000f          	fence
    8000965c:	fffff097          	auipc	ra,0xfffff
    80009660:	8a4080e7          	jalr	-1884(ra) # 80007f00 <mycpu>
    80009664:	01813083          	ld	ra,24(sp)
    80009668:	01013403          	ld	s0,16(sp)
    8000966c:	00a4b823          	sd	a0,16(s1)
    80009670:	00013903          	ld	s2,0(sp)
    80009674:	00813483          	ld	s1,8(sp)
    80009678:	02010113          	addi	sp,sp,32
    8000967c:	00008067          	ret
    80009680:	0104b903          	ld	s2,16(s1)
    80009684:	fffff097          	auipc	ra,0xfffff
    80009688:	87c080e7          	jalr	-1924(ra) # 80007f00 <mycpu>
    8000968c:	faa91ce3          	bne	s2,a0,80009644 <acquire+0x58>
    80009690:	00001517          	auipc	a0,0x1
    80009694:	28850513          	addi	a0,a0,648 # 8000a918 <digits+0x20>
    80009698:	fffff097          	auipc	ra,0xfffff
    8000969c:	224080e7          	jalr	548(ra) # 800088bc <panic>
    800096a0:	00195913          	srli	s2,s2,0x1
    800096a4:	fffff097          	auipc	ra,0xfffff
    800096a8:	85c080e7          	jalr	-1956(ra) # 80007f00 <mycpu>
    800096ac:	00197913          	andi	s2,s2,1
    800096b0:	07252e23          	sw	s2,124(a0)
    800096b4:	f75ff06f          	j	80009628 <acquire+0x3c>

00000000800096b8 <release>:
    800096b8:	fe010113          	addi	sp,sp,-32
    800096bc:	00813823          	sd	s0,16(sp)
    800096c0:	00113c23          	sd	ra,24(sp)
    800096c4:	00913423          	sd	s1,8(sp)
    800096c8:	01213023          	sd	s2,0(sp)
    800096cc:	02010413          	addi	s0,sp,32
    800096d0:	00052783          	lw	a5,0(a0)
    800096d4:	00079a63          	bnez	a5,800096e8 <release+0x30>
    800096d8:	00001517          	auipc	a0,0x1
    800096dc:	24850513          	addi	a0,a0,584 # 8000a920 <digits+0x28>
    800096e0:	fffff097          	auipc	ra,0xfffff
    800096e4:	1dc080e7          	jalr	476(ra) # 800088bc <panic>
    800096e8:	01053903          	ld	s2,16(a0)
    800096ec:	00050493          	mv	s1,a0
    800096f0:	fffff097          	auipc	ra,0xfffff
    800096f4:	810080e7          	jalr	-2032(ra) # 80007f00 <mycpu>
    800096f8:	fea910e3          	bne	s2,a0,800096d8 <release+0x20>
    800096fc:	0004b823          	sd	zero,16(s1)
    80009700:	0ff0000f          	fence
    80009704:	0f50000f          	fence	iorw,ow
    80009708:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000970c:	ffffe097          	auipc	ra,0xffffe
    80009710:	7f4080e7          	jalr	2036(ra) # 80007f00 <mycpu>
    80009714:	100027f3          	csrr	a5,sstatus
    80009718:	0027f793          	andi	a5,a5,2
    8000971c:	04079a63          	bnez	a5,80009770 <release+0xb8>
    80009720:	07852783          	lw	a5,120(a0)
    80009724:	02f05e63          	blez	a5,80009760 <release+0xa8>
    80009728:	fff7871b          	addiw	a4,a5,-1
    8000972c:	06e52c23          	sw	a4,120(a0)
    80009730:	00071c63          	bnez	a4,80009748 <release+0x90>
    80009734:	07c52783          	lw	a5,124(a0)
    80009738:	00078863          	beqz	a5,80009748 <release+0x90>
    8000973c:	100027f3          	csrr	a5,sstatus
    80009740:	0027e793          	ori	a5,a5,2
    80009744:	10079073          	csrw	sstatus,a5
    80009748:	01813083          	ld	ra,24(sp)
    8000974c:	01013403          	ld	s0,16(sp)
    80009750:	00813483          	ld	s1,8(sp)
    80009754:	00013903          	ld	s2,0(sp)
    80009758:	02010113          	addi	sp,sp,32
    8000975c:	00008067          	ret
    80009760:	00001517          	auipc	a0,0x1
    80009764:	1e050513          	addi	a0,a0,480 # 8000a940 <digits+0x48>
    80009768:	fffff097          	auipc	ra,0xfffff
    8000976c:	154080e7          	jalr	340(ra) # 800088bc <panic>
    80009770:	00001517          	auipc	a0,0x1
    80009774:	1b850513          	addi	a0,a0,440 # 8000a928 <digits+0x30>
    80009778:	fffff097          	auipc	ra,0xfffff
    8000977c:	144080e7          	jalr	324(ra) # 800088bc <panic>

0000000080009780 <holding>:
    80009780:	00052783          	lw	a5,0(a0)
    80009784:	00079663          	bnez	a5,80009790 <holding+0x10>
    80009788:	00000513          	li	a0,0
    8000978c:	00008067          	ret
    80009790:	fe010113          	addi	sp,sp,-32
    80009794:	00813823          	sd	s0,16(sp)
    80009798:	00913423          	sd	s1,8(sp)
    8000979c:	00113c23          	sd	ra,24(sp)
    800097a0:	02010413          	addi	s0,sp,32
    800097a4:	01053483          	ld	s1,16(a0)
    800097a8:	ffffe097          	auipc	ra,0xffffe
    800097ac:	758080e7          	jalr	1880(ra) # 80007f00 <mycpu>
    800097b0:	01813083          	ld	ra,24(sp)
    800097b4:	01013403          	ld	s0,16(sp)
    800097b8:	40a48533          	sub	a0,s1,a0
    800097bc:	00153513          	seqz	a0,a0
    800097c0:	00813483          	ld	s1,8(sp)
    800097c4:	02010113          	addi	sp,sp,32
    800097c8:	00008067          	ret

00000000800097cc <push_off>:
    800097cc:	fe010113          	addi	sp,sp,-32
    800097d0:	00813823          	sd	s0,16(sp)
    800097d4:	00113c23          	sd	ra,24(sp)
    800097d8:	00913423          	sd	s1,8(sp)
    800097dc:	02010413          	addi	s0,sp,32
    800097e0:	100024f3          	csrr	s1,sstatus
    800097e4:	100027f3          	csrr	a5,sstatus
    800097e8:	ffd7f793          	andi	a5,a5,-3
    800097ec:	10079073          	csrw	sstatus,a5
    800097f0:	ffffe097          	auipc	ra,0xffffe
    800097f4:	710080e7          	jalr	1808(ra) # 80007f00 <mycpu>
    800097f8:	07852783          	lw	a5,120(a0)
    800097fc:	02078663          	beqz	a5,80009828 <push_off+0x5c>
    80009800:	ffffe097          	auipc	ra,0xffffe
    80009804:	700080e7          	jalr	1792(ra) # 80007f00 <mycpu>
    80009808:	07852783          	lw	a5,120(a0)
    8000980c:	01813083          	ld	ra,24(sp)
    80009810:	01013403          	ld	s0,16(sp)
    80009814:	0017879b          	addiw	a5,a5,1
    80009818:	06f52c23          	sw	a5,120(a0)
    8000981c:	00813483          	ld	s1,8(sp)
    80009820:	02010113          	addi	sp,sp,32
    80009824:	00008067          	ret
    80009828:	0014d493          	srli	s1,s1,0x1
    8000982c:	ffffe097          	auipc	ra,0xffffe
    80009830:	6d4080e7          	jalr	1748(ra) # 80007f00 <mycpu>
    80009834:	0014f493          	andi	s1,s1,1
    80009838:	06952e23          	sw	s1,124(a0)
    8000983c:	fc5ff06f          	j	80009800 <push_off+0x34>

0000000080009840 <pop_off>:
    80009840:	ff010113          	addi	sp,sp,-16
    80009844:	00813023          	sd	s0,0(sp)
    80009848:	00113423          	sd	ra,8(sp)
    8000984c:	01010413          	addi	s0,sp,16
    80009850:	ffffe097          	auipc	ra,0xffffe
    80009854:	6b0080e7          	jalr	1712(ra) # 80007f00 <mycpu>
    80009858:	100027f3          	csrr	a5,sstatus
    8000985c:	0027f793          	andi	a5,a5,2
    80009860:	04079663          	bnez	a5,800098ac <pop_off+0x6c>
    80009864:	07852783          	lw	a5,120(a0)
    80009868:	02f05a63          	blez	a5,8000989c <pop_off+0x5c>
    8000986c:	fff7871b          	addiw	a4,a5,-1
    80009870:	06e52c23          	sw	a4,120(a0)
    80009874:	00071c63          	bnez	a4,8000988c <pop_off+0x4c>
    80009878:	07c52783          	lw	a5,124(a0)
    8000987c:	00078863          	beqz	a5,8000988c <pop_off+0x4c>
    80009880:	100027f3          	csrr	a5,sstatus
    80009884:	0027e793          	ori	a5,a5,2
    80009888:	10079073          	csrw	sstatus,a5
    8000988c:	00813083          	ld	ra,8(sp)
    80009890:	00013403          	ld	s0,0(sp)
    80009894:	01010113          	addi	sp,sp,16
    80009898:	00008067          	ret
    8000989c:	00001517          	auipc	a0,0x1
    800098a0:	0a450513          	addi	a0,a0,164 # 8000a940 <digits+0x48>
    800098a4:	fffff097          	auipc	ra,0xfffff
    800098a8:	018080e7          	jalr	24(ra) # 800088bc <panic>
    800098ac:	00001517          	auipc	a0,0x1
    800098b0:	07c50513          	addi	a0,a0,124 # 8000a928 <digits+0x30>
    800098b4:	fffff097          	auipc	ra,0xfffff
    800098b8:	008080e7          	jalr	8(ra) # 800088bc <panic>

00000000800098bc <push_on>:
    800098bc:	fe010113          	addi	sp,sp,-32
    800098c0:	00813823          	sd	s0,16(sp)
    800098c4:	00113c23          	sd	ra,24(sp)
    800098c8:	00913423          	sd	s1,8(sp)
    800098cc:	02010413          	addi	s0,sp,32
    800098d0:	100024f3          	csrr	s1,sstatus
    800098d4:	100027f3          	csrr	a5,sstatus
    800098d8:	0027e793          	ori	a5,a5,2
    800098dc:	10079073          	csrw	sstatus,a5
    800098e0:	ffffe097          	auipc	ra,0xffffe
    800098e4:	620080e7          	jalr	1568(ra) # 80007f00 <mycpu>
    800098e8:	07852783          	lw	a5,120(a0)
    800098ec:	02078663          	beqz	a5,80009918 <push_on+0x5c>
    800098f0:	ffffe097          	auipc	ra,0xffffe
    800098f4:	610080e7          	jalr	1552(ra) # 80007f00 <mycpu>
    800098f8:	07852783          	lw	a5,120(a0)
    800098fc:	01813083          	ld	ra,24(sp)
    80009900:	01013403          	ld	s0,16(sp)
    80009904:	0017879b          	addiw	a5,a5,1
    80009908:	06f52c23          	sw	a5,120(a0)
    8000990c:	00813483          	ld	s1,8(sp)
    80009910:	02010113          	addi	sp,sp,32
    80009914:	00008067          	ret
    80009918:	0014d493          	srli	s1,s1,0x1
    8000991c:	ffffe097          	auipc	ra,0xffffe
    80009920:	5e4080e7          	jalr	1508(ra) # 80007f00 <mycpu>
    80009924:	0014f493          	andi	s1,s1,1
    80009928:	06952e23          	sw	s1,124(a0)
    8000992c:	fc5ff06f          	j	800098f0 <push_on+0x34>

0000000080009930 <pop_on>:
    80009930:	ff010113          	addi	sp,sp,-16
    80009934:	00813023          	sd	s0,0(sp)
    80009938:	00113423          	sd	ra,8(sp)
    8000993c:	01010413          	addi	s0,sp,16
    80009940:	ffffe097          	auipc	ra,0xffffe
    80009944:	5c0080e7          	jalr	1472(ra) # 80007f00 <mycpu>
    80009948:	100027f3          	csrr	a5,sstatus
    8000994c:	0027f793          	andi	a5,a5,2
    80009950:	04078463          	beqz	a5,80009998 <pop_on+0x68>
    80009954:	07852783          	lw	a5,120(a0)
    80009958:	02f05863          	blez	a5,80009988 <pop_on+0x58>
    8000995c:	fff7879b          	addiw	a5,a5,-1
    80009960:	06f52c23          	sw	a5,120(a0)
    80009964:	07853783          	ld	a5,120(a0)
    80009968:	00079863          	bnez	a5,80009978 <pop_on+0x48>
    8000996c:	100027f3          	csrr	a5,sstatus
    80009970:	ffd7f793          	andi	a5,a5,-3
    80009974:	10079073          	csrw	sstatus,a5
    80009978:	00813083          	ld	ra,8(sp)
    8000997c:	00013403          	ld	s0,0(sp)
    80009980:	01010113          	addi	sp,sp,16
    80009984:	00008067          	ret
    80009988:	00001517          	auipc	a0,0x1
    8000998c:	fe050513          	addi	a0,a0,-32 # 8000a968 <digits+0x70>
    80009990:	fffff097          	auipc	ra,0xfffff
    80009994:	f2c080e7          	jalr	-212(ra) # 800088bc <panic>
    80009998:	00001517          	auipc	a0,0x1
    8000999c:	fb050513          	addi	a0,a0,-80 # 8000a948 <digits+0x50>
    800099a0:	fffff097          	auipc	ra,0xfffff
    800099a4:	f1c080e7          	jalr	-228(ra) # 800088bc <panic>

00000000800099a8 <__memset>:
    800099a8:	ff010113          	addi	sp,sp,-16
    800099ac:	00813423          	sd	s0,8(sp)
    800099b0:	01010413          	addi	s0,sp,16
    800099b4:	1a060e63          	beqz	a2,80009b70 <__memset+0x1c8>
    800099b8:	40a007b3          	neg	a5,a0
    800099bc:	0077f793          	andi	a5,a5,7
    800099c0:	00778693          	addi	a3,a5,7
    800099c4:	00b00813          	li	a6,11
    800099c8:	0ff5f593          	andi	a1,a1,255
    800099cc:	fff6071b          	addiw	a4,a2,-1
    800099d0:	1b06e663          	bltu	a3,a6,80009b7c <__memset+0x1d4>
    800099d4:	1cd76463          	bltu	a4,a3,80009b9c <__memset+0x1f4>
    800099d8:	1a078e63          	beqz	a5,80009b94 <__memset+0x1ec>
    800099dc:	00b50023          	sb	a1,0(a0)
    800099e0:	00100713          	li	a4,1
    800099e4:	1ae78463          	beq	a5,a4,80009b8c <__memset+0x1e4>
    800099e8:	00b500a3          	sb	a1,1(a0)
    800099ec:	00200713          	li	a4,2
    800099f0:	1ae78a63          	beq	a5,a4,80009ba4 <__memset+0x1fc>
    800099f4:	00b50123          	sb	a1,2(a0)
    800099f8:	00300713          	li	a4,3
    800099fc:	18e78463          	beq	a5,a4,80009b84 <__memset+0x1dc>
    80009a00:	00b501a3          	sb	a1,3(a0)
    80009a04:	00400713          	li	a4,4
    80009a08:	1ae78263          	beq	a5,a4,80009bac <__memset+0x204>
    80009a0c:	00b50223          	sb	a1,4(a0)
    80009a10:	00500713          	li	a4,5
    80009a14:	1ae78063          	beq	a5,a4,80009bb4 <__memset+0x20c>
    80009a18:	00b502a3          	sb	a1,5(a0)
    80009a1c:	00700713          	li	a4,7
    80009a20:	18e79e63          	bne	a5,a4,80009bbc <__memset+0x214>
    80009a24:	00b50323          	sb	a1,6(a0)
    80009a28:	00700e93          	li	t4,7
    80009a2c:	00859713          	slli	a4,a1,0x8
    80009a30:	00e5e733          	or	a4,a1,a4
    80009a34:	01059e13          	slli	t3,a1,0x10
    80009a38:	01c76e33          	or	t3,a4,t3
    80009a3c:	01859313          	slli	t1,a1,0x18
    80009a40:	006e6333          	or	t1,t3,t1
    80009a44:	02059893          	slli	a7,a1,0x20
    80009a48:	40f60e3b          	subw	t3,a2,a5
    80009a4c:	011368b3          	or	a7,t1,a7
    80009a50:	02859813          	slli	a6,a1,0x28
    80009a54:	0108e833          	or	a6,a7,a6
    80009a58:	03059693          	slli	a3,a1,0x30
    80009a5c:	003e589b          	srliw	a7,t3,0x3
    80009a60:	00d866b3          	or	a3,a6,a3
    80009a64:	03859713          	slli	a4,a1,0x38
    80009a68:	00389813          	slli	a6,a7,0x3
    80009a6c:	00f507b3          	add	a5,a0,a5
    80009a70:	00e6e733          	or	a4,a3,a4
    80009a74:	000e089b          	sext.w	a7,t3
    80009a78:	00f806b3          	add	a3,a6,a5
    80009a7c:	00e7b023          	sd	a4,0(a5)
    80009a80:	00878793          	addi	a5,a5,8
    80009a84:	fed79ce3          	bne	a5,a3,80009a7c <__memset+0xd4>
    80009a88:	ff8e7793          	andi	a5,t3,-8
    80009a8c:	0007871b          	sext.w	a4,a5
    80009a90:	01d787bb          	addw	a5,a5,t4
    80009a94:	0ce88e63          	beq	a7,a4,80009b70 <__memset+0x1c8>
    80009a98:	00f50733          	add	a4,a0,a5
    80009a9c:	00b70023          	sb	a1,0(a4)
    80009aa0:	0017871b          	addiw	a4,a5,1
    80009aa4:	0cc77663          	bgeu	a4,a2,80009b70 <__memset+0x1c8>
    80009aa8:	00e50733          	add	a4,a0,a4
    80009aac:	00b70023          	sb	a1,0(a4)
    80009ab0:	0027871b          	addiw	a4,a5,2
    80009ab4:	0ac77e63          	bgeu	a4,a2,80009b70 <__memset+0x1c8>
    80009ab8:	00e50733          	add	a4,a0,a4
    80009abc:	00b70023          	sb	a1,0(a4)
    80009ac0:	0037871b          	addiw	a4,a5,3
    80009ac4:	0ac77663          	bgeu	a4,a2,80009b70 <__memset+0x1c8>
    80009ac8:	00e50733          	add	a4,a0,a4
    80009acc:	00b70023          	sb	a1,0(a4)
    80009ad0:	0047871b          	addiw	a4,a5,4
    80009ad4:	08c77e63          	bgeu	a4,a2,80009b70 <__memset+0x1c8>
    80009ad8:	00e50733          	add	a4,a0,a4
    80009adc:	00b70023          	sb	a1,0(a4)
    80009ae0:	0057871b          	addiw	a4,a5,5
    80009ae4:	08c77663          	bgeu	a4,a2,80009b70 <__memset+0x1c8>
    80009ae8:	00e50733          	add	a4,a0,a4
    80009aec:	00b70023          	sb	a1,0(a4)
    80009af0:	0067871b          	addiw	a4,a5,6
    80009af4:	06c77e63          	bgeu	a4,a2,80009b70 <__memset+0x1c8>
    80009af8:	00e50733          	add	a4,a0,a4
    80009afc:	00b70023          	sb	a1,0(a4)
    80009b00:	0077871b          	addiw	a4,a5,7
    80009b04:	06c77663          	bgeu	a4,a2,80009b70 <__memset+0x1c8>
    80009b08:	00e50733          	add	a4,a0,a4
    80009b0c:	00b70023          	sb	a1,0(a4)
    80009b10:	0087871b          	addiw	a4,a5,8
    80009b14:	04c77e63          	bgeu	a4,a2,80009b70 <__memset+0x1c8>
    80009b18:	00e50733          	add	a4,a0,a4
    80009b1c:	00b70023          	sb	a1,0(a4)
    80009b20:	0097871b          	addiw	a4,a5,9
    80009b24:	04c77663          	bgeu	a4,a2,80009b70 <__memset+0x1c8>
    80009b28:	00e50733          	add	a4,a0,a4
    80009b2c:	00b70023          	sb	a1,0(a4)
    80009b30:	00a7871b          	addiw	a4,a5,10
    80009b34:	02c77e63          	bgeu	a4,a2,80009b70 <__memset+0x1c8>
    80009b38:	00e50733          	add	a4,a0,a4
    80009b3c:	00b70023          	sb	a1,0(a4)
    80009b40:	00b7871b          	addiw	a4,a5,11
    80009b44:	02c77663          	bgeu	a4,a2,80009b70 <__memset+0x1c8>
    80009b48:	00e50733          	add	a4,a0,a4
    80009b4c:	00b70023          	sb	a1,0(a4)
    80009b50:	00c7871b          	addiw	a4,a5,12
    80009b54:	00c77e63          	bgeu	a4,a2,80009b70 <__memset+0x1c8>
    80009b58:	00e50733          	add	a4,a0,a4
    80009b5c:	00b70023          	sb	a1,0(a4)
    80009b60:	00d7879b          	addiw	a5,a5,13
    80009b64:	00c7f663          	bgeu	a5,a2,80009b70 <__memset+0x1c8>
    80009b68:	00f507b3          	add	a5,a0,a5
    80009b6c:	00b78023          	sb	a1,0(a5)
    80009b70:	00813403          	ld	s0,8(sp)
    80009b74:	01010113          	addi	sp,sp,16
    80009b78:	00008067          	ret
    80009b7c:	00b00693          	li	a3,11
    80009b80:	e55ff06f          	j	800099d4 <__memset+0x2c>
    80009b84:	00300e93          	li	t4,3
    80009b88:	ea5ff06f          	j	80009a2c <__memset+0x84>
    80009b8c:	00100e93          	li	t4,1
    80009b90:	e9dff06f          	j	80009a2c <__memset+0x84>
    80009b94:	00000e93          	li	t4,0
    80009b98:	e95ff06f          	j	80009a2c <__memset+0x84>
    80009b9c:	00000793          	li	a5,0
    80009ba0:	ef9ff06f          	j	80009a98 <__memset+0xf0>
    80009ba4:	00200e93          	li	t4,2
    80009ba8:	e85ff06f          	j	80009a2c <__memset+0x84>
    80009bac:	00400e93          	li	t4,4
    80009bb0:	e7dff06f          	j	80009a2c <__memset+0x84>
    80009bb4:	00500e93          	li	t4,5
    80009bb8:	e75ff06f          	j	80009a2c <__memset+0x84>
    80009bbc:	00600e93          	li	t4,6
    80009bc0:	e6dff06f          	j	80009a2c <__memset+0x84>

0000000080009bc4 <__memmove>:
    80009bc4:	ff010113          	addi	sp,sp,-16
    80009bc8:	00813423          	sd	s0,8(sp)
    80009bcc:	01010413          	addi	s0,sp,16
    80009bd0:	0e060863          	beqz	a2,80009cc0 <__memmove+0xfc>
    80009bd4:	fff6069b          	addiw	a3,a2,-1
    80009bd8:	0006881b          	sext.w	a6,a3
    80009bdc:	0ea5e863          	bltu	a1,a0,80009ccc <__memmove+0x108>
    80009be0:	00758713          	addi	a4,a1,7
    80009be4:	00a5e7b3          	or	a5,a1,a0
    80009be8:	40a70733          	sub	a4,a4,a0
    80009bec:	0077f793          	andi	a5,a5,7
    80009bf0:	00f73713          	sltiu	a4,a4,15
    80009bf4:	00174713          	xori	a4,a4,1
    80009bf8:	0017b793          	seqz	a5,a5
    80009bfc:	00e7f7b3          	and	a5,a5,a4
    80009c00:	10078863          	beqz	a5,80009d10 <__memmove+0x14c>
    80009c04:	00900793          	li	a5,9
    80009c08:	1107f463          	bgeu	a5,a6,80009d10 <__memmove+0x14c>
    80009c0c:	0036581b          	srliw	a6,a2,0x3
    80009c10:	fff8081b          	addiw	a6,a6,-1
    80009c14:	02081813          	slli	a6,a6,0x20
    80009c18:	01d85893          	srli	a7,a6,0x1d
    80009c1c:	00858813          	addi	a6,a1,8
    80009c20:	00058793          	mv	a5,a1
    80009c24:	00050713          	mv	a4,a0
    80009c28:	01088833          	add	a6,a7,a6
    80009c2c:	0007b883          	ld	a7,0(a5)
    80009c30:	00878793          	addi	a5,a5,8
    80009c34:	00870713          	addi	a4,a4,8
    80009c38:	ff173c23          	sd	a7,-8(a4)
    80009c3c:	ff0798e3          	bne	a5,a6,80009c2c <__memmove+0x68>
    80009c40:	ff867713          	andi	a4,a2,-8
    80009c44:	02071793          	slli	a5,a4,0x20
    80009c48:	0207d793          	srli	a5,a5,0x20
    80009c4c:	00f585b3          	add	a1,a1,a5
    80009c50:	40e686bb          	subw	a3,a3,a4
    80009c54:	00f507b3          	add	a5,a0,a5
    80009c58:	06e60463          	beq	a2,a4,80009cc0 <__memmove+0xfc>
    80009c5c:	0005c703          	lbu	a4,0(a1)
    80009c60:	00e78023          	sb	a4,0(a5)
    80009c64:	04068e63          	beqz	a3,80009cc0 <__memmove+0xfc>
    80009c68:	0015c603          	lbu	a2,1(a1)
    80009c6c:	00100713          	li	a4,1
    80009c70:	00c780a3          	sb	a2,1(a5)
    80009c74:	04e68663          	beq	a3,a4,80009cc0 <__memmove+0xfc>
    80009c78:	0025c603          	lbu	a2,2(a1)
    80009c7c:	00200713          	li	a4,2
    80009c80:	00c78123          	sb	a2,2(a5)
    80009c84:	02e68e63          	beq	a3,a4,80009cc0 <__memmove+0xfc>
    80009c88:	0035c603          	lbu	a2,3(a1)
    80009c8c:	00300713          	li	a4,3
    80009c90:	00c781a3          	sb	a2,3(a5)
    80009c94:	02e68663          	beq	a3,a4,80009cc0 <__memmove+0xfc>
    80009c98:	0045c603          	lbu	a2,4(a1)
    80009c9c:	00400713          	li	a4,4
    80009ca0:	00c78223          	sb	a2,4(a5)
    80009ca4:	00e68e63          	beq	a3,a4,80009cc0 <__memmove+0xfc>
    80009ca8:	0055c603          	lbu	a2,5(a1)
    80009cac:	00500713          	li	a4,5
    80009cb0:	00c782a3          	sb	a2,5(a5)
    80009cb4:	00e68663          	beq	a3,a4,80009cc0 <__memmove+0xfc>
    80009cb8:	0065c703          	lbu	a4,6(a1)
    80009cbc:	00e78323          	sb	a4,6(a5)
    80009cc0:	00813403          	ld	s0,8(sp)
    80009cc4:	01010113          	addi	sp,sp,16
    80009cc8:	00008067          	ret
    80009ccc:	02061713          	slli	a4,a2,0x20
    80009cd0:	02075713          	srli	a4,a4,0x20
    80009cd4:	00e587b3          	add	a5,a1,a4
    80009cd8:	f0f574e3          	bgeu	a0,a5,80009be0 <__memmove+0x1c>
    80009cdc:	02069613          	slli	a2,a3,0x20
    80009ce0:	02065613          	srli	a2,a2,0x20
    80009ce4:	fff64613          	not	a2,a2
    80009ce8:	00e50733          	add	a4,a0,a4
    80009cec:	00c78633          	add	a2,a5,a2
    80009cf0:	fff7c683          	lbu	a3,-1(a5)
    80009cf4:	fff78793          	addi	a5,a5,-1
    80009cf8:	fff70713          	addi	a4,a4,-1
    80009cfc:	00d70023          	sb	a3,0(a4)
    80009d00:	fec798e3          	bne	a5,a2,80009cf0 <__memmove+0x12c>
    80009d04:	00813403          	ld	s0,8(sp)
    80009d08:	01010113          	addi	sp,sp,16
    80009d0c:	00008067          	ret
    80009d10:	02069713          	slli	a4,a3,0x20
    80009d14:	02075713          	srli	a4,a4,0x20
    80009d18:	00170713          	addi	a4,a4,1
    80009d1c:	00e50733          	add	a4,a0,a4
    80009d20:	00050793          	mv	a5,a0
    80009d24:	0005c683          	lbu	a3,0(a1)
    80009d28:	00178793          	addi	a5,a5,1
    80009d2c:	00158593          	addi	a1,a1,1
    80009d30:	fed78fa3          	sb	a3,-1(a5)
    80009d34:	fee798e3          	bne	a5,a4,80009d24 <__memmove+0x160>
    80009d38:	f89ff06f          	j	80009cc0 <__memmove+0xfc>
	...
