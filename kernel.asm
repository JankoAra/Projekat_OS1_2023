
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	08013103          	ld	sp,128(sp) # 8000d080 <_GLOBAL_OFFSET_TABLE_+0x58>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	3d1070ef          	jal	ra,80007bec <start>

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
    80001084:	6ed000ef          	jal	ra,80001f70 <interruptRoutine>

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
    80001430:	c647b783          	ld	a5,-924(a5) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x68>
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
    8000167c:	a187b783          	ld	a5,-1512(a5) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x68>
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
    80001710:	a147c783          	lbu	a5,-1516(a5) # 8000d120 <_ZN8KConsole11initializedE>
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
    80001734:	9f048493          	addi	s1,s1,-1552 # 8000d120 <_ZN8KConsole11initializedE>
    80001738:	0000c797          	auipc	a5,0xc
    8000173c:	9007b783          	ld	a5,-1792(a5) # 8000d038 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001740:	0007b783          	ld	a5,0(a5)
    80001744:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    80001748:	0000c797          	auipc	a5,0xc
    8000174c:	9007b783          	ld	a5,-1792(a5) # 8000d048 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001750:	0007b783          	ld	a5,0(a5)
    80001754:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    80001758:	03200593          	li	a1,50
    8000175c:	0000c517          	auipc	a0,0xc
    80001760:	9dc50513          	addi	a0,a0,-1572 # 8000d138 <_ZN8KConsole19inputBufferHasSpaceE>
    80001764:	00000097          	auipc	ra,0x0
    80001768:	dd4080e7          	jalr	-556(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    8000176c:	03200593          	li	a1,50
    80001770:	0000c517          	auipc	a0,0xc
    80001774:	9d050513          	addi	a0,a0,-1584 # 8000d140 <_ZN8KConsole20outputBufferHasSpaceE>
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	dc0080e7          	jalr	-576(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    80001780:	00000593          	li	a1,0
    80001784:	0000c517          	auipc	a0,0xc
    80001788:	9c450513          	addi	a0,a0,-1596 # 8000d148 <_ZN8KConsole12charsToInputE>
    8000178c:	00000097          	auipc	ra,0x0
    80001790:	dac080e7          	jalr	-596(ra) # 80001538 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    80001794:	00000593          	li	a1,0
    80001798:	0000c517          	auipc	a0,0xc
    8000179c:	9b850513          	addi	a0,a0,-1608 # 8000d150 <_ZN8KConsole13charsToOutputE>
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
    800017dc:	94848493          	addi	s1,s1,-1720 # 8000d120 <_ZN8KConsole11initializedE>
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
    80001820:	97872703          	lw	a4,-1672(a4) # 8000d194 <_ZN8KConsole15inputBufferSizeE>
    80001824:	03200793          	li	a5,50
    80001828:	04f70e63          	beq	a4,a5,80001884 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    8000182c:	ff010113          	addi	sp,sp,-16
    80001830:	00113423          	sd	ra,8(sp)
    80001834:	00813023          	sd	s0,0(sp)
    80001838:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    8000183c:	0000c697          	auipc	a3,0xc
    80001840:	8e468693          	addi	a3,a3,-1820 # 8000d120 <_ZN8KConsole11initializedE>
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
    800018a8:	87c48493          	addi	s1,s1,-1924 # 8000d120 <_ZN8KConsole11initializedE>
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
    80001910:	81448493          	addi	s1,s1,-2028 # 8000d120 <_ZN8KConsole11initializedE>
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
    80001968:	0000c797          	auipc	a5,0xc
    8000196c:	8787b783          	ld	a5,-1928(a5) # 8000d1e0 <_ZN9Scheduler4tailE>
    80001970:	02078263          	beqz	a5,80001994 <_ZN9Scheduler3putEP3TCB+0x38>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    80001974:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    80001978:	0000c797          	auipc	a5,0xc
    8000197c:	86a7b423          	sd	a0,-1944(a5) # 8000d1e0 <_ZN9Scheduler4tailE>
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    static TCB* createThread(Body function, void* args, uint64* stack);

    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001980:	00100793          	li	a5,1
    80001984:	04f52c23          	sw	a5,88(a0)
    }
    tcb->setStatus(TCB::ACTIVE);
}
    80001988:	00813403          	ld	s0,8(sp)
    8000198c:	01010113          	addi	sp,sp,16
    80001990:	00008067          	ret
        head = tail = tcb;
    80001994:	0000c797          	auipc	a5,0xc
    80001998:	84c78793          	addi	a5,a5,-1972 # 8000d1e0 <_ZN9Scheduler4tailE>
    8000199c:	00a7b023          	sd	a0,0(a5)
    800019a0:	00a7b423          	sd	a0,8(a5)
    800019a4:	fddff06f          	j	80001980 <_ZN9Scheduler3putEP3TCB+0x24>

00000000800019a8 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    800019a8:	ff010113          	addi	sp,sp,-16
    800019ac:	00813423          	sd	s0,8(sp)
    800019b0:	01010413          	addi	s0,sp,16
    TCB* firstThread = head;
    800019b4:	0000c717          	auipc	a4,0xc
    800019b8:	82c70713          	addi	a4,a4,-2004 # 8000d1e0 <_ZN9Scheduler4tailE>
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
    80001a00:	7f483803          	ld	a6,2036(a6) # 8000d1f0 <_ZN9Scheduler12sleepingHeadE>
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
    80001a38:	7aa7be23          	sd	a0,1980(a5) # 8000d1f0 <_ZN9Scheduler12sleepingHeadE>
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
    80001a80:	76a7ba23          	sd	a0,1908(a5) # 8000d1f0 <_ZN9Scheduler12sleepingHeadE>
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
    80001a9c:	7587b783          	ld	a5,1880(a5) # 8000d1f0 <_ZN9Scheduler12sleepingHeadE>
    80001aa0:	06078a63          	beqz	a5,80001b14 <_ZN9Scheduler4wakeEv+0x7c>
    sleepingHead->timeToSleep--;
    80001aa4:	0387b703          	ld	a4,56(a5)
    80001aa8:	fff70713          	addi	a4,a4,-1
    80001aac:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001ab0:	0000b517          	auipc	a0,0xb
    80001ab4:	74053503          	ld	a0,1856(a0) # 8000d1f0 <_ZN9Scheduler12sleepingHeadE>
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
    80001ae8:	70f73623          	sd	a5,1804(a4) # 8000d1f0 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    80001aec:	04053023          	sd	zero,64(a0)
        Scheduler::put(thread);
    80001af0:	00000097          	auipc	ra,0x0
    80001af4:	e6c080e7          	jalr	-404(ra) # 8000195c <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001af8:	0000b517          	auipc	a0,0xb
    80001afc:	6f853503          	ld	a0,1784(a0) # 8000d1f0 <_ZN9Scheduler12sleepingHeadE>
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
    80001b2c:	6d07b783          	ld	a5,1744(a5) # 8000d1f8 <_ZN7KMemory14freeBlocksLeftE>
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
    80001b58:	6ac6b683          	ld	a3,1708(a3) # 8000d200 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001b5c:	08d5fa63          	bgeu	a1,a3,80001bf0 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001b60:	03f00693          	li	a3,63
    80001b64:	02d78a63          	beq	a5,a3,80001b98 <_ZN7KMemory7kmallocEm+0x80>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    80001b68:	00359693          	slli	a3,a1,0x3
    80001b6c:	0000b617          	auipc	a2,0xb
    80001b70:	69c63603          	ld	a2,1692(a2) # 8000d208 <_ZN7KMemory9bitVectorE>
    80001b74:	00d606b3          	add	a3,a2,a3
    80001b78:	0006b683          	ld	a3,0(a3)
    //adresa pocetka bit vektora (HEAP_START_ADDR)
    static uint64* bitVector;

    static uint64 freeBlocksLeft;

    //maska sa 1 na mestu bitPos i ostalim nulama (bitPos=0..63)
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
    80001ba0:	66c63603          	ld	a2,1644(a2) # 8000d208 <_ZN7KMemory9bitVectorE>
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
    80001c04:	4586b683          	ld	a3,1112(a3) # 8000d058 <_GLOBAL_OFFSET_TABLE_+0x30>
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
    80001c34:	5d86b683          	ld	a3,1496(a3) # 8000d208 <_ZN7KMemory9bitVectorE>
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
    80001c64:	59870713          	addi	a4,a4,1432 # 8000d1f8 <_ZN7KMemory14freeBlocksLeftE>
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
    80001ca0:	5747c783          	lbu	a5,1396(a5) # 8000d210 <_ZN7KMemory11initializedE>
    80001ca4:	0a079863          	bnez	a5,80001d54 <_ZN7KMemory16initializeMemoryEv+0xb8>
void KMemory::initializeMemory() {
    80001ca8:	ff010113          	addi	sp,sp,-16
    80001cac:	00113423          	sd	ra,8(sp)
    80001cb0:	00813023          	sd	s0,0(sp)
    80001cb4:	01010413          	addi	s0,sp,16
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001cb8:	0000b797          	auipc	a5,0xb
    80001cbc:	3f07b783          	ld	a5,1008(a5) # 8000d0a8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001cc0:	0007b783          	ld	a5,0(a5)
    80001cc4:	0000b717          	auipc	a4,0xb
    80001cc8:	39473703          	ld	a4,916(a4) # 8000d058 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001ccc:	00073603          	ld	a2,0(a4)
    80001cd0:	40c787b3          	sub	a5,a5,a2
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    80001cd4:	00c7d793          	srli	a5,a5,0xc
    80001cd8:	0000b717          	auipc	a4,0xb
    80001cdc:	52070713          	addi	a4,a4,1312 # 8000d1f8 <_ZN7KMemory14freeBlocksLeftE>
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
    80001d0c:	4f873703          	ld	a4,1272(a4) # 8000d200 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001d10:	02e7f063          	bgeu	a5,a4,80001d30 <_ZN7KMemory16initializeMemoryEv+0x94>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    80001d14:	00379693          	slli	a3,a5,0x3
    80001d18:	0000b717          	auipc	a4,0xb
    80001d1c:	4f073703          	ld	a4,1264(a4) # 8000d208 <_ZN7KMemory9bitVectorE>
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
    80001d40:	4cf70a23          	sb	a5,1236(a4) # 8000d210 <_ZN7KMemory11initializedE>
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
    80001d70:	2ec73703          	ld	a4,748(a4) # 8000d058 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001d74:	00073703          	ld	a4,0(a4)
    80001d78:	40e787b3          	sub	a5,a5,a4
    80001d7c:	03f7f713          	andi	a4,a5,63
    80001d80:	08071063          	bnez	a4,80001e00 <_ZN7KMemory5kfreeEPv+0xa8>
    uint64 blocksToFree = *(uint64*)ptr;
    80001d84:	ff053583          	ld	a1,-16(a0)
    freeBlocksLeft += blocksToFree;
    80001d88:	0000b697          	auipc	a3,0xb
    80001d8c:	47068693          	addi	a3,a3,1136 # 8000d1f8 <_ZN7KMemory14freeBlocksLeftE>
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
    80001dcc:	4406b683          	ld	a3,1088(a3) # 8000d208 <_ZN7KMemory9bitVectorE>
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

0000000080001e18 <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80001e18:	ff010113          	addi	sp,sp,-16
    80001e1c:	00113423          	sd	ra,8(sp)
    80001e20:	00813023          	sd	s0,0(sp)
    80001e24:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80001e28:	fffff097          	auipc	ra,0xfffff
    80001e2c:	698080e7          	jalr	1688(ra) # 800014c0 <_Z15thread_dispatchv>
    80001e30:	ff9ff06f          	j	80001e28 <_Z4idlePv+0x10>

0000000080001e34 <_Z22kernelConsumerFunctionPv>:
}

//salje na izlaz karakter iz izlaznog bafera KConsole
void kernelConsumerFunction(void*) {
    80001e34:	ff010113          	addi	sp,sp,-16
    80001e38:	00113423          	sd	ra,8(sp)
    80001e3c:	00813023          	sd	s0,0(sp)
    80001e40:	01010413          	addi	s0,sp,16
    80001e44:	0280006f          	j	80001e6c <_Z22kernelConsumerFunctionPv+0x38>

    static uint8 getSRvalue() { return *sr; }

    static uint8 getDRvalue() { return *dr; }

    static void setDRvalue(char c) { *dr = c; }
    80001e48:	0000b797          	auipc	a5,0xb
    80001e4c:	2407b783          	ld	a5,576(a5) # 8000d088 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001e50:	0007b783          	ld	a5,0(a5)
    80001e54:	00a78023          	sb	a0,0(a5)
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
        KConsole::setDRvalue(c);
        sem_signal(KConsole::getOutputBufferHasSpace());
    80001e58:	0000b797          	auipc	a5,0xb
    80001e5c:	2407b783          	ld	a5,576(a5) # 8000d098 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001e60:	0007b503          	ld	a0,0(a5)
    80001e64:	fffff097          	auipc	ra,0xfffff
    80001e68:	76c080e7          	jalr	1900(ra) # 800015d0 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001e6c:	00000097          	auipc	ra,0x0
    80001e70:	958080e7          	jalr	-1704(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    80001e74:	0000b797          	auipc	a5,0xb
    80001e78:	25c7b783          	ld	a5,604(a5) # 8000d0d0 <_GLOBAL_OFFSET_TABLE_+0xa8>
    80001e7c:	0007b783          	ld	a5,0(a5)
    80001e80:	0007c783          	lbu	a5,0(a5)
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80001e84:	0207f793          	andi	a5,a5,32
    80001e88:	fe0786e3          	beqz	a5,80001e74 <_Z22kernelConsumerFunctionPv+0x40>
    80001e8c:	fbdff06f          	j	80001e48 <_Z22kernelConsumerFunctionPv+0x14>

0000000080001e90 <main>:
    }
}

int main() {
    80001e90:	fc010113          	addi	sp,sp,-64
    80001e94:	02113c23          	sd	ra,56(sp)
    80001e98:	02813823          	sd	s0,48(sp)
    80001e9c:	02913423          	sd	s1,40(sp)
    80001ea0:	04010413          	addi	s0,sp,64
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001ea4:	0000b797          	auipc	a5,0xb
    80001ea8:	20c7b783          	ld	a5,524(a5) # 8000d0b0 <_GLOBAL_OFFSET_TABLE_+0x88>
    80001eac:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80001eb0:	00000097          	auipc	ra,0x0
    80001eb4:	dec080e7          	jalr	-532(ra) # 80001c9c <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001eb8:	00000097          	auipc	ra,0x0
    80001ebc:	854080e7          	jalr	-1964(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    80001ec0:	00000613          	li	a2,0
    80001ec4:	00000597          	auipc	a1,0x0
    80001ec8:	fcc58593          	addi	a1,a1,-52 # 80001e90 <main>
    80001ecc:	fd840513          	addi	a0,s0,-40
    80001ed0:	fffff097          	auipc	ra,0xfffff
    80001ed4:	534080e7          	jalr	1332(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80001ed8:	fd843783          	ld	a5,-40(s0)

    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }
    80001edc:	0000b717          	auipc	a4,0xb
    80001ee0:	1c473703          	ld	a4,452(a4) # 8000d0a0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80001ee4:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001ee8:	00100713          	li	a4,1
    80001eec:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    80001ef0:	00000613          	li	a2,0
    80001ef4:	0000b597          	auipc	a1,0xb
    80001ef8:	13c5b583          	ld	a1,316(a1) # 8000d030 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001efc:	fd040513          	addi	a0,s0,-48
    80001f00:	fffff097          	auipc	ra,0xfffff
    80001f04:	504080e7          	jalr	1284(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80001f08:	00000613          	li	a2,0
    80001f0c:	00000597          	auipc	a1,0x0
    80001f10:	f2858593          	addi	a1,a1,-216 # 80001e34 <_Z22kernelConsumerFunctionPv>
    80001f14:	fc040513          	addi	a0,s0,-64
    80001f18:	fffff097          	auipc	ra,0xfffff
    80001f1c:	4ec080e7          	jalr	1260(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80001f20:	00000613          	li	a2,0
    80001f24:	00000597          	auipc	a1,0x0
    80001f28:	ef458593          	addi	a1,a1,-268 # 80001e18 <_Z4idlePv>
    80001f2c:	fc840513          	addi	a0,s0,-56
    80001f30:	fffff097          	auipc	ra,0xfffff
    80001f34:	4d4080e7          	jalr	1236(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001f38:	00200493          	li	s1,2
    80001f3c:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80001f40:	fd043503          	ld	a0,-48(s0)
    80001f44:	fffff097          	auipc	ra,0xfffff
    80001f48:	59c080e7          	jalr	1436(ra) # 800014e0 <_Z11thread_joinP3TCB>
        __asm__ volatile("li a0, 0x43");
    80001f4c:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80001f50:	00000073          	ecall
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001f54:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80001f58:	00000513          	li	a0,0
    80001f5c:	03813083          	ld	ra,56(sp)
    80001f60:	03013403          	ld	s0,48(sp)
    80001f64:	02813483          	ld	s1,40(sp)
    80001f68:	04010113          	addi	sp,sp,64
    80001f6c:	00008067          	ret

0000000080001f70 <interruptRoutine>:
//#include "../test/printing.hpp"

int main();

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001f70:	f9010113          	addi	sp,sp,-112
    80001f74:	06113423          	sd	ra,104(sp)
    80001f78:	06813023          	sd	s0,96(sp)
    80001f7c:	04913c23          	sd	s1,88(sp)
    80001f80:	07010413          	addi	s0,sp,112
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f84:	14202373          	csrr	t1,scause
    80001f88:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f8c:	14102373          	csrr	t1,sepc
    80001f90:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f94:	10002373          	csrr	t1,sstatus
    80001f98:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4;
    //uint64 a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f9c:	00050313          	mv	t1,a0
    80001fa0:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001fa4:	00058313          	mv	t1,a1
    80001fa8:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001fac:	00060313          	mv	t1,a2
    80001fb0:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001fb4:	00068313          	mv	t1,a3
    80001fb8:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001fbc:	00070313          	mv	t1,a4
    80001fc0:	fa643023          	sd	t1,-96(s0)
//    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");

    if (scause == 0x9 || scause == 0x8) {
    80001fc4:	fd843703          	ld	a4,-40(s0)
    80001fc8:	00900793          	li	a5,9
    80001fcc:	00f70863          	beq	a4,a5,80001fdc <interruptRoutine+0x6c>
    80001fd0:	fd843703          	ld	a4,-40(s0)
    80001fd4:	00800793          	li	a5,8
    80001fd8:	44f71263          	bne	a4,a5,8000241c <interruptRoutine+0x4ac>
        //prekid zbog poziva ecall
        switch (a0) {
    80001fdc:	fc043703          	ld	a4,-64(s0)
    80001fe0:	08100793          	li	a5,129
    80001fe4:	3ee7e863          	bltu	a5,a4,800023d4 <interruptRoutine+0x464>
    80001fe8:	fc043783          	ld	a5,-64(s0)
    80001fec:	00279713          	slli	a4,a5,0x2
    80001ff0:	00008797          	auipc	a5,0x8
    80001ff4:	03078793          	addi	a5,a5,48 # 8000a020 <CONSOLE_STATUS+0x10>
    80001ff8:	00f707b3          	add	a5,a4,a5
    80001ffc:	0007a783          	lw	a5,0(a5)
    80002000:	0007871b          	sext.w	a4,a5
    80002004:	00008797          	auipc	a5,0x8
    80002008:	01c78793          	addi	a5,a5,28 # 8000a020 <CONSOLE_STATUS+0x10>
    8000200c:	00f707b3          	add	a5,a4,a5
    80002010:	00078067          	jr	a5
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                KMemory::kmalloc((size_t)a1);
    80002014:	fb843503          	ld	a0,-72(s0)
    80002018:	00000097          	auipc	ra,0x0
    8000201c:	b00080e7          	jalr	-1280(ra) # 80001b18 <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    80002020:	04a43823          	sd	a0,80(s0)
                break;
    80002024:	3d40006f          	j	800023f8 <interruptRoutine+0x488>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                KMemory::kfree((void*)a1);
    80002028:	fb843783          	ld	a5,-72(s0)
    8000202c:	00078513          	mv	a0,a5
    80002030:	00000097          	auipc	ra,0x0
    80002034:	d28080e7          	jalr	-728(ra) # 80001d58 <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    80002038:	04a43823          	sd	a0,80(s0)
                break;
    8000203c:	3bc0006f          	j	800023f8 <interruptRoutine+0x488>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002040:	fb043783          	ld	a5,-80(s0)
    80002044:	fa843703          	ld	a4,-88(s0)
    80002048:	fa043683          	ld	a3,-96(s0)
    8000204c:	fb843483          	ld	s1,-72(s0)
    80002050:	00068613          	mv	a2,a3
    80002054:	00070593          	mv	a1,a4
    80002058:	00078513          	mv	a0,a5
    8000205c:	00001097          	auipc	ra,0x1
    80002060:	ea8080e7          	jalr	-344(ra) # 80002f04 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002064:	00050793          	mv	a5,a0
    80002068:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    8000206c:	fb843783          	ld	a5,-72(s0)
    80002070:	0007b783          	ld	a5,0(a5)
    80002074:	02078863          	beqz	a5,800020a4 <interruptRoutine+0x134>
                    if ((TCB::Body)a2 != (TCB::Body)main) {
    80002078:	fb043703          	ld	a4,-80(s0)
    8000207c:	0000b797          	auipc	a5,0xb
    80002080:	0147b783          	ld	a5,20(a5) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002084:	00f70c63          	beq	a4,a5,8000209c <interruptRoutine+0x12c>
                        Scheduler::put(*((thread_t*)a1));
    80002088:	fb843783          	ld	a5,-72(s0)
    8000208c:	0007b783          	ld	a5,0(a5)
    80002090:	00078513          	mv	a0,a5
    80002094:	00000097          	auipc	ra,0x0
    80002098:	8c8080e7          	jalr	-1848(ra) # 8000195c <_ZN9Scheduler3putEP3TCB>
                    }
                    __asm__ volatile("li a0, 0");
    8000209c:	00000513          	li	a0,0
    800020a0:	0080006f          	j	800020a8 <interruptRoutine+0x138>
                } else {
                    __asm__ volatile("li a0, -1");
    800020a4:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800020a8:	04a43823          	sd	a0,80(s0)
                break;
    800020ac:	34c0006f          	j	800023f8 <interruptRoutine+0x488>
            case 0x12:
                //thread_exit
                TCB::getRunning()->setStatus(TCB::FINISHED);
    800020b0:	00000097          	auipc	ra,0x0
    800020b4:	664080e7          	jalr	1636(ra) # 80002714 <_ZN3TCB10getRunningEv>
    800020b8:	00050793          	mv	a5,a0
    800020bc:	00500593          	li	a1,5
    800020c0:	00078513          	mv	a0,a5
    800020c4:	00000097          	auipc	ra,0x0
    800020c8:	5fc080e7          	jalr	1532(ra) # 800026c0 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined(TCB::getRunning());
    800020cc:	00000097          	auipc	ra,0x0
    800020d0:	648080e7          	jalr	1608(ra) # 80002714 <_ZN3TCB10getRunningEv>
    800020d4:	00050793          	mv	a5,a0
    800020d8:	00078513          	mv	a0,a5
    800020dc:	00001097          	auipc	ra,0x1
    800020e0:	f60080e7          	jalr	-160(ra) # 8000303c <_ZN3TCB13releaseJoinedEPS_>
                __asm__ volatile("li a0, 0");
    800020e4:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 80(s0)");
    800020e8:	04a43823          	sd	a0,80(s0)
                TCB::dispatch();
    800020ec:	00001097          	auipc	ra,0x1
    800020f0:	d58080e7          	jalr	-680(ra) # 80002e44 <_ZN3TCB8dispatchEv>
                break;
    800020f4:	3040006f          	j	800023f8 <interruptRoutine+0x488>
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
    800020f8:	00001097          	auipc	ra,0x1
    800020fc:	d4c080e7          	jalr	-692(ra) # 80002e44 <_ZN3TCB8dispatchEv>
                break;
    80002100:	2f80006f          	j	800023f8 <interruptRoutine+0x488>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    80002104:	fb843783          	ld	a5,-72(s0)
    80002108:	00078513          	mv	a0,a5
    8000210c:	00001097          	auipc	ra,0x1
    80002110:	edc080e7          	jalr	-292(ra) # 80002fe8 <_ZN3TCB10threadJoinEPS_>
                TCB::dispatch();
    80002114:	00001097          	auipc	ra,0x1
    80002118:	d30080e7          	jalr	-720(ra) # 80002e44 <_ZN3TCB8dispatchEv>
                break;
    8000211c:	2dc0006f          	j	800023f8 <interruptRoutine+0x488>
            case 0x15:
                //destruktor klase Thread, brise nit ciji je handle prosledjen
                //a1 = rucka niti koja se brise
                if (TCB::getRunning() == (thread_t)a1) {
    80002120:	00000097          	auipc	ra,0x0
    80002124:	5f4080e7          	jalr	1524(ra) # 80002714 <_ZN3TCB10getRunningEv>
    80002128:	00050713          	mv	a4,a0
    8000212c:	fb843783          	ld	a5,-72(s0)
    80002130:	40f707b3          	sub	a5,a4,a5
    80002134:	0017b793          	seqz	a5,a5
    80002138:	0ff7f793          	andi	a5,a5,255
    8000213c:	04078263          	beqz	a5,80002180 <interruptRoutine+0x210>
                    TCB::getRunning()->setStatus(TCB::FINISHED);
    80002140:	00000097          	auipc	ra,0x0
    80002144:	5d4080e7          	jalr	1492(ra) # 80002714 <_ZN3TCB10getRunningEv>
    80002148:	00050793          	mv	a5,a0
    8000214c:	00500593          	li	a1,5
    80002150:	00078513          	mv	a0,a5
    80002154:	00000097          	auipc	ra,0x0
    80002158:	56c080e7          	jalr	1388(ra) # 800026c0 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                    TCB::releaseJoined(TCB::getRunning());
    8000215c:	00000097          	auipc	ra,0x0
    80002160:	5b8080e7          	jalr	1464(ra) # 80002714 <_ZN3TCB10getRunningEv>
    80002164:	00050793          	mv	a5,a0
    80002168:	00078513          	mv	a0,a5
    8000216c:	00001097          	auipc	ra,0x1
    80002170:	ed0080e7          	jalr	-304(ra) # 8000303c <_ZN3TCB13releaseJoinedEPS_>
                    TCB::dispatch();
    80002174:	00001097          	auipc	ra,0x1
    80002178:	cd0080e7          	jalr	-816(ra) # 80002e44 <_ZN3TCB8dispatchEv>
                } else {
                    TCB::quitThread((thread_t)a1);
                    TCB::releaseJoined((thread_t)a1);
                }
                break;
    8000217c:	27c0006f          	j	800023f8 <interruptRoutine+0x488>
                    TCB::quitThread((thread_t)a1);
    80002180:	fb843783          	ld	a5,-72(s0)
    80002184:	00078513          	mv	a0,a5
    80002188:	00001097          	auipc	ra,0x1
    8000218c:	f04080e7          	jalr	-252(ra) # 8000308c <_ZN3TCB10quitThreadEPS_>
                    TCB::releaseJoined((thread_t)a1);
    80002190:	fb843783          	ld	a5,-72(s0)
    80002194:	00078513          	mv	a0,a5
    80002198:	00001097          	auipc	ra,0x1
    8000219c:	ea4080e7          	jalr	-348(ra) # 8000303c <_ZN3TCB13releaseJoinedEPS_>
                break;
    800021a0:	2580006f          	j	800023f8 <interruptRoutine+0x488>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    800021a4:	fb043783          	ld	a5,-80(s0)
    800021a8:	0007879b          	sext.w	a5,a5
    800021ac:	fb843483          	ld	s1,-72(s0)
    800021b0:	00078513          	mv	a0,a5
    800021b4:	00001097          	auipc	ra,0x1
    800021b8:	0cc080e7          	jalr	204(ra) # 80003280 <_ZN4KSem7initSemEj>
    800021bc:	00050793          	mv	a5,a0
    800021c0:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    800021c4:	fb843783          	ld	a5,-72(s0)
    800021c8:	0007b783          	ld	a5,0(a5)
    800021cc:	00078663          	beqz	a5,800021d8 <interruptRoutine+0x268>
                    __asm__ volatile("li a0, 0");
    800021d0:	00000513          	li	a0,0
    800021d4:	0080006f          	j	800021dc <interruptRoutine+0x26c>
                } else {
                    __asm__ volatile("li a0, -1");
    800021d8:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800021dc:	04a43823          	sd	a0,80(s0)
                break;
    800021e0:	2180006f          	j	800023f8 <interruptRoutine+0x488>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    800021e4:	fb843783          	ld	a5,-72(s0)
    800021e8:	00078513          	mv	a0,a5
    800021ec:	00001097          	auipc	ra,0x1
    800021f0:	1e8080e7          	jalr	488(ra) # 800033d4 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    800021f4:	04a43823          	sd	a0,80(s0)
                delete (sem_t)a1;
    800021f8:	fb843483          	ld	s1,-72(s0)
    800021fc:	1e048063          	beqz	s1,800023dc <interruptRoutine+0x46c>
    80002200:	00048513          	mv	a0,s1
    80002204:	00000097          	auipc	ra,0x0
    80002208:	370080e7          	jalr	880(ra) # 80002574 <_ZN4KSemD1Ev>
    8000220c:	00048513          	mv	a0,s1
    80002210:	00001097          	auipc	ra,0x1
    80002214:	048080e7          	jalr	72(ra) # 80003258 <_ZN4KSemdlEPv>
                break;
    80002218:	1c40006f          	j	800023dc <interruptRoutine+0x46c>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    8000221c:	fb843783          	ld	a5,-72(s0)
    80002220:	00078513          	mv	a0,a5
    80002224:	00001097          	auipc	ra,0x1
    80002228:	0ec080e7          	jalr	236(ra) # 80003310 <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    8000222c:	04a43823          	sd	a0,80(s0)
                break;
    80002230:	1c80006f          	j	800023f8 <interruptRoutine+0x488>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    80002234:	fb843783          	ld	a5,-72(s0)
    80002238:	00078513          	mv	a0,a5
    8000223c:	00001097          	auipc	ra,0x1
    80002240:	154080e7          	jalr	340(ra) # 80003390 <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002244:	04a43823          	sd	a0,80(s0)
                break;
    80002248:	1b00006f          	j	800023f8 <interruptRoutine+0x488>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    8000224c:	fb843783          	ld	a5,-72(s0)
    80002250:	00078663          	beqz	a5,8000225c <interruptRoutine+0x2ec>
                    __asm__ volatile("li a0, 0");
    80002254:	00000513          	li	a0,0
    80002258:	0080006f          	j	80002260 <interruptRoutine+0x2f0>
                } else {
                    __asm__ volatile("li a0, -1");
    8000225c:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002260:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    80002264:	fb843783          	ld	a5,-72(s0)
    80002268:	16078e63          	beqz	a5,800023e4 <interruptRoutine+0x474>
                    Scheduler::putToSleep(TCB::getRunning(), (time_t)a1);
    8000226c:	00000097          	auipc	ra,0x0
    80002270:	4a8080e7          	jalr	1192(ra) # 80002714 <_ZN3TCB10getRunningEv>
    80002274:	00050793          	mv	a5,a0
    80002278:	fb843583          	ld	a1,-72(s0)
    8000227c:	00078513          	mv	a0,a5
    80002280:	fffff097          	auipc	ra,0xfffff
    80002284:	768080e7          	jalr	1896(ra) # 800019e8 <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::dispatch();
    80002288:	00001097          	auipc	ra,0x1
    8000228c:	bbc080e7          	jalr	-1092(ra) # 80002e44 <_ZN3TCB8dispatchEv>
                }
                break;
    80002290:	1540006f          	j	800023e4 <interruptRoutine+0x474>
            case 0x41:
                //getc
                KConsole::kgetc();
    80002294:	fffff097          	auipc	ra,0xfffff
    80002298:	664080e7          	jalr	1636(ra) # 800018f8 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    8000229c:	04a43823          	sd	a0,80(s0)
                break;
    800022a0:	1580006f          	j	800023f8 <interruptRoutine+0x488>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    800022a4:	fb843783          	ld	a5,-72(s0)
    800022a8:	0ff7f793          	andi	a5,a5,255
    800022ac:	00078513          	mv	a0,a5
    800022b0:	fffff097          	auipc	ra,0xfffff
    800022b4:	5d8080e7          	jalr	1496(ra) # 80001888 <_ZN8KConsole5kputcEc>
                break;
    800022b8:	1400006f          	j	800023f8 <interruptRoutine+0x488>
            case 0x43:
                //flush izlaznog bafera konzole
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    800022bc:	00000097          	auipc	ra,0x0
    800022c0:	3bc080e7          	jalr	956(ra) # 80002678 <_ZN8KConsole13getOutputHeadEv>
    800022c4:	00050793          	mv	a5,a0
    800022c8:	00078493          	mv	s1,a5
    800022cc:	00000097          	auipc	ra,0x0
    800022d0:	3d0080e7          	jalr	976(ra) # 8000269c <_ZN8KConsole13getOutputTailEv>
    800022d4:	00050793          	mv	a5,a0
    800022d8:	00048713          	mv	a4,s1
    800022dc:	40f707b3          	sub	a5,a4,a5
    800022e0:	00f037b3          	snez	a5,a5
    800022e4:	0ff7f793          	andi	a5,a5,255
    800022e8:	10078263          	beqz	a5,800023ec <interruptRoutine+0x47c>
                    char c = KConsole::getFromOutput();
    800022ec:	fffff097          	auipc	ra,0xfffff
    800022f0:	4d8080e7          	jalr	1240(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    800022f4:	00050793          	mv	a5,a0
    800022f8:	f8f40ba3          	sb	a5,-105(s0)
                    while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    800022fc:	00000097          	auipc	ra,0x0
    80002300:	2e0080e7          	jalr	736(ra) # 800025dc <_ZN8KConsole10getSRvalueEv>
    80002304:	00050793          	mv	a5,a0
    80002308:	0207f793          	andi	a5,a5,32
    8000230c:	0017b793          	seqz	a5,a5
    80002310:	0ff7f793          	andi	a5,a5,255
    80002314:	00078463          	beqz	a5,8000231c <interruptRoutine+0x3ac>
    80002318:	fe5ff06f          	j	800022fc <interruptRoutine+0x38c>
                    KConsole::setDRvalue(c);
    8000231c:	f9744783          	lbu	a5,-105(s0)
    80002320:	00078513          	mv	a0,a5
    80002324:	00000097          	auipc	ra,0x0
    80002328:	308080e7          	jalr	776(ra) # 8000262c <_ZN8KConsole10setDRvalueEc>
                    sem_signal(KConsole::getOutputBufferHasSpace());
    8000232c:	00000097          	auipc	ra,0x0
    80002330:	328080e7          	jalr	808(ra) # 80002654 <_ZN8KConsole23getOutputBufferHasSpaceEv>
    80002334:	00050793          	mv	a5,a0
    80002338:	00078513          	mv	a0,a5
    8000233c:	fffff097          	auipc	ra,0xfffff
    80002340:	294080e7          	jalr	660(ra) # 800015d0 <_Z10sem_signalP4KSem>
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    80002344:	f79ff06f          	j	800022bc <interruptRoutine+0x34c>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002348:	fb043783          	ld	a5,-80(s0)
    8000234c:	fa843703          	ld	a4,-88(s0)
    80002350:	fa043683          	ld	a3,-96(s0)
    80002354:	fb843483          	ld	s1,-72(s0)
    80002358:	00068613          	mv	a2,a3
    8000235c:	00070593          	mv	a1,a4
    80002360:	00078513          	mv	a0,a5
    80002364:	00001097          	auipc	ra,0x1
    80002368:	ba0080e7          	jalr	-1120(ra) # 80002f04 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    8000236c:	00050793          	mv	a5,a0
    80002370:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80002374:	fb843783          	ld	a5,-72(s0)
    80002378:	0007b783          	ld	a5,0(a5)
    8000237c:	00078663          	beqz	a5,80002388 <interruptRoutine+0x418>
                    __asm__ volatile("li a0, 0");
    80002380:	00000513          	li	a0,0
    80002384:	0080006f          	j	8000238c <interruptRoutine+0x41c>
                } else {
                    __asm__ volatile("li a0, -1");
    80002388:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    8000238c:	04a43823          	sd	a0,80(s0)
                break;
    80002390:	0680006f          	j	800023f8 <interruptRoutine+0x488>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                if (((thread_t)a1)->getBody() != (TCB::Body)main) {
    80002394:	fb843783          	ld	a5,-72(s0)
    80002398:	00078513          	mv	a0,a5
    8000239c:	00000097          	auipc	ra,0x0
    800023a0:	35c080e7          	jalr	860(ra) # 800026f8 <_ZN3TCB7getBodyEv>
    800023a4:	00050713          	mv	a4,a0
    800023a8:	0000b797          	auipc	a5,0xb
    800023ac:	ce87b783          	ld	a5,-792(a5) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x68>
    800023b0:	40f707b3          	sub	a5,a4,a5
    800023b4:	00f037b3          	snez	a5,a5
    800023b8:	0ff7f793          	andi	a5,a5,255
    800023bc:	02078c63          	beqz	a5,800023f4 <interruptRoutine+0x484>
                    Scheduler::put((thread_t)a1);
    800023c0:	fb843783          	ld	a5,-72(s0)
    800023c4:	00078513          	mv	a0,a5
    800023c8:	fffff097          	auipc	ra,0xfffff
    800023cc:	594080e7          	jalr	1428(ra) # 8000195c <_ZN9Scheduler3putEP3TCB>
                }
                break;
    800023d0:	0240006f          	j	800023f4 <interruptRoutine+0x484>
//                printInt(a0);
//                printString("\nscause: ");
//                printInt(scause);
//                printString("\nsepc: ");
//                printInt(sepc);
                break;
    800023d4:	00000013          	nop
    800023d8:	0200006f          	j	800023f8 <interruptRoutine+0x488>
                break;
    800023dc:	00000013          	nop
    800023e0:	0180006f          	j	800023f8 <interruptRoutine+0x488>
                break;
    800023e4:	00000013          	nop
    800023e8:	0100006f          	j	800023f8 <interruptRoutine+0x488>
                break;
    800023ec:	00000013          	nop
    800023f0:	0080006f          	j	800023f8 <interruptRoutine+0x488>
                break;
    800023f4:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    800023f8:	fd043783          	ld	a5,-48(s0)
    800023fc:	00478793          	addi	a5,a5,4
    80002400:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002404:	fd043783          	ld	a5,-48(s0)
    80002408:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    8000240c:	fc843783          	ld	a5,-56(s0)
    80002410:	10079073          	csrw	sstatus,a5
    80002414:	00000013          	nop
//        printString("\nsepc: ");
//        printInt(sepc);
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    }
    80002418:	1440006f          	j	8000255c <interruptRoutine+0x5ec>
    } else if (scause == 0x8000000000000009) {
    8000241c:	fd843703          	ld	a4,-40(s0)
    80002420:	fff00793          	li	a5,-1
    80002424:	03f79793          	slli	a5,a5,0x3f
    80002428:	00978793          	addi	a5,a5,9
    8000242c:	08f71463          	bne	a4,a5,800024b4 <interruptRoutine+0x544>
        uint64 irq = plic_claim();
    80002430:	00006097          	auipc	ra,0x6
    80002434:	014080e7          	jalr	20(ra) # 80008444 <plic_claim>
    80002438:	00050793          	mv	a5,a0
    8000243c:	f8f43c23          	sd	a5,-104(s0)
        if (irq == CONSOLE_IRQ) {
    80002440:	f9843703          	ld	a4,-104(s0)
    80002444:	00a00793          	li	a5,10
    80002448:	02f71c63          	bne	a4,a5,80002480 <interruptRoutine+0x510>
            if (KConsole::getSRvalue() & CONSOLE_RX_STATUS_BIT) {
    8000244c:	00000097          	auipc	ra,0x0
    80002450:	190080e7          	jalr	400(ra) # 800025dc <_ZN8KConsole10getSRvalueEv>
    80002454:	00050793          	mv	a5,a0
    80002458:	0017f793          	andi	a5,a5,1
    8000245c:	00f037b3          	snez	a5,a5
    80002460:	0ff7f793          	andi	a5,a5,255
    80002464:	00078e63          	beqz	a5,80002480 <interruptRoutine+0x510>
                KConsole::placeInInput(KConsole::getDRvalue());
    80002468:	00000097          	auipc	ra,0x0
    8000246c:	19c080e7          	jalr	412(ra) # 80002604 <_ZN8KConsole10getDRvalueEv>
    80002470:	00050793          	mv	a5,a0
    80002474:	00078513          	mv	a0,a5
    80002478:	fffff097          	auipc	ra,0xfffff
    8000247c:	3a4080e7          	jalr	932(ra) # 8000181c <_ZN8KConsole12placeInInputEc>
        plic_complete(irq);
    80002480:	f9843783          	ld	a5,-104(s0)
    80002484:	0007879b          	sext.w	a5,a5
    80002488:	00078513          	mv	a0,a5
    8000248c:	00006097          	auipc	ra,0x6
    80002490:	ff0080e7          	jalr	-16(ra) # 8000847c <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002494:	fd043783          	ld	a5,-48(s0)
    80002498:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    8000249c:	fc843783          	ld	a5,-56(s0)
    800024a0:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    800024a4:	20000513          	li	a0,512
    800024a8:	00000097          	auipc	ra,0x0
    800024ac:	118080e7          	jalr	280(ra) # 800025c0 <_ZN5Riscv6mc_sipEm>
    800024b0:	0ac0006f          	j	8000255c <interruptRoutine+0x5ec>
    } else if (scause == 0x8000000000000001) {
    800024b4:	fd843703          	ld	a4,-40(s0)
    800024b8:	fff00793          	li	a5,-1
    800024bc:	03f79793          	slli	a5,a5,0x3f
    800024c0:	00178793          	addi	a5,a5,1
    800024c4:	08f71463          	bne	a4,a5,8000254c <interruptRoutine+0x5dc>
        Scheduler::wake();
    800024c8:	fffff097          	auipc	ra,0xfffff
    800024cc:	5d0080e7          	jalr	1488(ra) # 80001a98 <_ZN9Scheduler4wakeEv>
        TCB::getRunningTimeSlice()++;
    800024d0:	00000097          	auipc	ra,0x0
    800024d4:	268080e7          	jalr	616(ra) # 80002738 <_ZN3TCB19getRunningTimeSliceEv>
    800024d8:	00050793          	mv	a5,a0
    800024dc:	0007b703          	ld	a4,0(a5)
    800024e0:	00170713          	addi	a4,a4,1
    800024e4:	00e7b023          	sd	a4,0(a5)
        Riscv::mc_sip(Riscv::SIP_SSIP);
    800024e8:	00200513          	li	a0,2
    800024ec:	00000097          	auipc	ra,0x0
    800024f0:	0d4080e7          	jalr	212(ra) # 800025c0 <_ZN5Riscv6mc_sipEm>
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
    800024f4:	00000097          	auipc	ra,0x0
    800024f8:	244080e7          	jalr	580(ra) # 80002738 <_ZN3TCB19getRunningTimeSliceEv>
    800024fc:	00050793          	mv	a5,a0
    80002500:	0007b483          	ld	s1,0(a5)
    80002504:	00000097          	auipc	ra,0x0
    80002508:	210080e7          	jalr	528(ra) # 80002714 <_ZN3TCB10getRunningEv>
    8000250c:	00050793          	mv	a5,a0
    80002510:	00078513          	mv	a0,a5
    80002514:	00000097          	auipc	ra,0x0
    80002518:	1c8080e7          	jalr	456(ra) # 800026dc <_ZN3TCB12getTimeSliceEv>
    8000251c:	00050793          	mv	a5,a0
    80002520:	00f4b7b3          	sltu	a5,s1,a5
    80002524:	0017c793          	xori	a5,a5,1
    80002528:	0ff7f793          	andi	a5,a5,255
    8000252c:	00078663          	beqz	a5,80002538 <interruptRoutine+0x5c8>
            TCB::dispatch();
    80002530:	00001097          	auipc	ra,0x1
    80002534:	914080e7          	jalr	-1772(ra) # 80002e44 <_ZN3TCB8dispatchEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002538:	fd043783          	ld	a5,-48(s0)
    8000253c:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002540:	fc843783          	ld	a5,-56(s0)
    80002544:	10079073          	csrw	sstatus,a5
    80002548:	0140006f          	j	8000255c <interruptRoutine+0x5ec>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    8000254c:	fd043783          	ld	a5,-48(s0)
    80002550:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002554:	fc843783          	ld	a5,-56(s0)
    80002558:	10079073          	csrw	sstatus,a5
    8000255c:	00000013          	nop
    80002560:	06813083          	ld	ra,104(sp)
    80002564:	06013403          	ld	s0,96(sp)
    80002568:	05813483          	ld	s1,88(sp)
    8000256c:	07010113          	addi	sp,sp,112
    80002570:	00008067          	ret

0000000080002574 <_ZN4KSemD1Ev>:
#define PROJEKAT2023_KSEM_HPP

#include "../h/ThreadQueue.hpp"

//klasa napravljena po uzoru na semafor u skolskom jezgru
class KSem {
    80002574:	fe010113          	addi	sp,sp,-32
    80002578:	00113c23          	sd	ra,24(sp)
    8000257c:	00813823          	sd	s0,16(sp)
    80002580:	00913423          	sd	s1,8(sp)
    80002584:	02010413          	addi	s0,sp,32
    80002588:	00050493          	mv	s1,a0
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    8000258c:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002590:	00050e63          	beqz	a0,800025ac <_ZN4KSemD1Ev+0x38>
            front = front->next;
    80002594:	00853783          	ld	a5,8(a0)
    80002598:	00f4b423          	sd	a5,8(s1)
            delete node;
    8000259c:	fe0508e3          	beqz	a0,8000258c <_ZN4KSemD1Ev+0x18>
            mem_free(ptr);
    800025a0:	fffff097          	auipc	ra,0xfffff
    800025a4:	e34080e7          	jalr	-460(ra) # 800013d4 <_Z8mem_freePv>
        }
    800025a8:	fe5ff06f          	j	8000258c <_ZN4KSemD1Ev+0x18>
    800025ac:	01813083          	ld	ra,24(sp)
    800025b0:	01013403          	ld	s0,16(sp)
    800025b4:	00813483          	ld	s1,8(sp)
    800025b8:	02010113          	addi	sp,sp,32
    800025bc:	00008067          	ret

00000000800025c0 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    800025c0:	ff010113          	addi	sp,sp,-16
    800025c4:	00813423          	sd	s0,8(sp)
    800025c8:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    800025cc:	14453073          	csrc	sip,a0
}
    800025d0:	00813403          	ld	s0,8(sp)
    800025d4:	01010113          	addi	sp,sp,16
    800025d8:	00008067          	ret

00000000800025dc <_ZN8KConsole10getSRvalueEv>:
    static uint8 getSRvalue() { return *sr; }
    800025dc:	ff010113          	addi	sp,sp,-16
    800025e0:	00813423          	sd	s0,8(sp)
    800025e4:	01010413          	addi	s0,sp,16
    800025e8:	0000b797          	auipc	a5,0xb
    800025ec:	ae87b783          	ld	a5,-1304(a5) # 8000d0d0 <_GLOBAL_OFFSET_TABLE_+0xa8>
    800025f0:	0007b783          	ld	a5,0(a5)
    800025f4:	0007c503          	lbu	a0,0(a5)
    800025f8:	00813403          	ld	s0,8(sp)
    800025fc:	01010113          	addi	sp,sp,16
    80002600:	00008067          	ret

0000000080002604 <_ZN8KConsole10getDRvalueEv>:
    static uint8 getDRvalue() { return *dr; }
    80002604:	ff010113          	addi	sp,sp,-16
    80002608:	00813423          	sd	s0,8(sp)
    8000260c:	01010413          	addi	s0,sp,16
    80002610:	0000b797          	auipc	a5,0xb
    80002614:	a787b783          	ld	a5,-1416(a5) # 8000d088 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002618:	0007b783          	ld	a5,0(a5)
    8000261c:	0007c503          	lbu	a0,0(a5)
    80002620:	00813403          	ld	s0,8(sp)
    80002624:	01010113          	addi	sp,sp,16
    80002628:	00008067          	ret

000000008000262c <_ZN8KConsole10setDRvalueEc>:
    static void setDRvalue(char c) { *dr = c; }
    8000262c:	ff010113          	addi	sp,sp,-16
    80002630:	00813423          	sd	s0,8(sp)
    80002634:	01010413          	addi	s0,sp,16
    80002638:	0000b797          	auipc	a5,0xb
    8000263c:	a507b783          	ld	a5,-1456(a5) # 8000d088 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002640:	0007b783          	ld	a5,0(a5)
    80002644:	00a78023          	sb	a0,0(a5)
    80002648:	00813403          	ld	s0,8(sp)
    8000264c:	01010113          	addi	sp,sp,16
    80002650:	00008067          	ret

0000000080002654 <_ZN8KConsole23getOutputBufferHasSpaceEv>:

    static sem_t getOutputBufferHasSpace() { return outputBufferHasSpace; }
    80002654:	ff010113          	addi	sp,sp,-16
    80002658:	00813423          	sd	s0,8(sp)
    8000265c:	01010413          	addi	s0,sp,16
    80002660:	0000b797          	auipc	a5,0xb
    80002664:	a387b783          	ld	a5,-1480(a5) # 8000d098 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002668:	0007b503          	ld	a0,0(a5)
    8000266c:	00813403          	ld	s0,8(sp)
    80002670:	01010113          	addi	sp,sp,16
    80002674:	00008067          	ret

0000000080002678 <_ZN8KConsole13getOutputHeadEv>:

    static int getOutputHead() { return outputHead; }
    80002678:	ff010113          	addi	sp,sp,-16
    8000267c:	00813423          	sd	s0,8(sp)
    80002680:	01010413          	addi	s0,sp,16
    80002684:	0000b797          	auipc	a5,0xb
    80002688:	9f47b783          	ld	a5,-1548(a5) # 8000d078 <_GLOBAL_OFFSET_TABLE_+0x50>
    8000268c:	0007a503          	lw	a0,0(a5)
    80002690:	00813403          	ld	s0,8(sp)
    80002694:	01010113          	addi	sp,sp,16
    80002698:	00008067          	ret

000000008000269c <_ZN8KConsole13getOutputTailEv>:

    static int getOutputTail() { return outputTail; }
    8000269c:	ff010113          	addi	sp,sp,-16
    800026a0:	00813423          	sd	s0,8(sp)
    800026a4:	01010413          	addi	s0,sp,16
    800026a8:	0000b797          	auipc	a5,0xb
    800026ac:	a207b783          	ld	a5,-1504(a5) # 8000d0c8 <_GLOBAL_OFFSET_TABLE_+0xa0>
    800026b0:	0007a503          	lw	a0,0(a5)
    800026b4:	00813403          	ld	s0,8(sp)
    800026b8:	01010113          	addi	sp,sp,16
    800026bc:	00008067          	ret

00000000800026c0 <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    800026c0:	ff010113          	addi	sp,sp,-16
    800026c4:	00813423          	sd	s0,8(sp)
    800026c8:	01010413          	addi	s0,sp,16
    800026cc:	04b52c23          	sw	a1,88(a0)
    800026d0:	00813403          	ld	s0,8(sp)
    800026d4:	01010113          	addi	sp,sp,16
    800026d8:	00008067          	ret

00000000800026dc <_ZN3TCB12getTimeSliceEv>:
    uint64 getTimeSlice() { return timeSlice; }
    800026dc:	ff010113          	addi	sp,sp,-16
    800026e0:	00813423          	sd	s0,8(sp)
    800026e4:	01010413          	addi	s0,sp,16
    800026e8:	02853503          	ld	a0,40(a0)
    800026ec:	00813403          	ld	s0,8(sp)
    800026f0:	01010113          	addi	sp,sp,16
    800026f4:	00008067          	ret

00000000800026f8 <_ZN3TCB7getBodyEv>:
    Body getBody() { return threadFunction; }
    800026f8:	ff010113          	addi	sp,sp,-16
    800026fc:	00813423          	sd	s0,8(sp)
    80002700:	01010413          	addi	s0,sp,16
    80002704:	01053503          	ld	a0,16(a0)
    80002708:	00813403          	ld	s0,8(sp)
    8000270c:	01010113          	addi	sp,sp,16
    80002710:	00008067          	ret

0000000080002714 <_ZN3TCB10getRunningEv>:
    static TCB* getRunning() { return running; }
    80002714:	ff010113          	addi	sp,sp,-16
    80002718:	00813423          	sd	s0,8(sp)
    8000271c:	01010413          	addi	s0,sp,16
    80002720:	0000b797          	auipc	a5,0xb
    80002724:	9807b783          	ld	a5,-1664(a5) # 8000d0a0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80002728:	0007b503          	ld	a0,0(a5)
    8000272c:	00813403          	ld	s0,8(sp)
    80002730:	01010113          	addi	sp,sp,16
    80002734:	00008067          	ret

0000000080002738 <_ZN3TCB19getRunningTimeSliceEv>:

    static uint64 &getRunningTimeSlice() { return runningTimeSlice; }
    80002738:	ff010113          	addi	sp,sp,-16
    8000273c:	00813423          	sd	s0,8(sp)
    80002740:	01010413          	addi	s0,sp,16
    80002744:	0000b517          	auipc	a0,0xb
    80002748:	8fc53503          	ld	a0,-1796(a0) # 8000d040 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000274c:	00813403          	ld	s0,8(sp)
    80002750:	01010113          	addi	sp,sp,16
    80002754:	00008067          	ret

0000000080002758 <_ZN6Thread7wrapperEPv>:

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
    80002758:	02050863          	beqz	a0,80002788 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    8000275c:	ff010113          	addi	sp,sp,-16
    80002760:	00113423          	sd	ra,8(sp)
    80002764:	00813023          	sd	s0,0(sp)
    80002768:	01010413          	addi	s0,sp,16
        ((Thread*)thread)->run();
    8000276c:	00053783          	ld	a5,0(a0)
    80002770:	0107b783          	ld	a5,16(a5)
    80002774:	000780e7          	jalr	a5
    }
}
    80002778:	00813083          	ld	ra,8(sp)
    8000277c:	00013403          	ld	s0,0(sp)
    80002780:	01010113          	addi	sp,sp,16
    80002784:	00008067          	ret
    80002788:	00008067          	ret

000000008000278c <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    8000278c:	fe010113          	addi	sp,sp,-32
    80002790:	00113c23          	sd	ra,24(sp)
    80002794:	00813823          	sd	s0,16(sp)
    80002798:	00913423          	sd	s1,8(sp)
    8000279c:	02010413          	addi	s0,sp,32
    800027a0:	00050313          	mv	t1,a0
    800027a4:	0000a797          	auipc	a5,0xa
    800027a8:	5f478793          	addi	a5,a5,1524 # 8000cd98 <_ZTV6Thread+0x10>
    800027ac:	00f53023          	sd	a5,0(a0)
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800027b0:	00853e03          	ld	t3,8(a0)
    800027b4:	000e0593          	mv	a1,t3
    __asm__ volatile("li a0, 0x15");
    800027b8:	01500513          	li	a0,21
    __asm__ volatile("ecall");
    800027bc:	00000073          	ecall
    delete myHandle;
    800027c0:	00833483          	ld	s1,8(t1)
    800027c4:	02048863          	beqz	s1,800027f4 <_ZN6ThreadD1Ev+0x68>
        return front == nullptr;
    800027c8:	0484b503          	ld	a0,72(s1)
        while (!isEmpty()) {
    800027cc:	00050e63          	beqz	a0,800027e8 <_ZN6ThreadD1Ev+0x5c>
            front = front->next;
    800027d0:	00853783          	ld	a5,8(a0)
    800027d4:	04f4b423          	sd	a5,72(s1)
            delete node;
    800027d8:	fe0508e3          	beqz	a0,800027c8 <_ZN6ThreadD1Ev+0x3c>
            mem_free(ptr);
    800027dc:	fffff097          	auipc	ra,0xfffff
    800027e0:	bf8080e7          	jalr	-1032(ra) # 800013d4 <_Z8mem_freePv>
        }
    800027e4:	fe5ff06f          	j	800027c8 <_ZN6ThreadD1Ev+0x3c>
    800027e8:	00048513          	mv	a0,s1
    800027ec:	00000097          	auipc	ra,0x0
    800027f0:	7d4080e7          	jalr	2004(ra) # 80002fc0 <_ZN3TCBdlEPv>
}
    800027f4:	01813083          	ld	ra,24(sp)
    800027f8:	01013403          	ld	s0,16(sp)
    800027fc:	00813483          	ld	s1,8(sp)
    80002800:	02010113          	addi	sp,sp,32
    80002804:	00008067          	ret

0000000080002808 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002808:	ff010113          	addi	sp,sp,-16
    8000280c:	00113423          	sd	ra,8(sp)
    80002810:	00813023          	sd	s0,0(sp)
    80002814:	01010413          	addi	s0,sp,16
    80002818:	0000a797          	auipc	a5,0xa
    8000281c:	5a878793          	addi	a5,a5,1448 # 8000cdc0 <_ZTV9Semaphore+0x10>
    80002820:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80002824:	00853503          	ld	a0,8(a0)
    80002828:	fffff097          	auipc	ra,0xfffff
    8000282c:	d48080e7          	jalr	-696(ra) # 80001570 <_Z9sem_closeP4KSem>
}
    80002830:	00813083          	ld	ra,8(sp)
    80002834:	00013403          	ld	s0,0(sp)
    80002838:	01010113          	addi	sp,sp,16
    8000283c:	00008067          	ret

0000000080002840 <_Znwm>:
void* operator new(size_t size) {
    80002840:	ff010113          	addi	sp,sp,-16
    80002844:	00113423          	sd	ra,8(sp)
    80002848:	00813023          	sd	s0,0(sp)
    8000284c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002850:	fffff097          	auipc	ra,0xfffff
    80002854:	b44080e7          	jalr	-1212(ra) # 80001394 <_Z9mem_allocm>
}
    80002858:	00813083          	ld	ra,8(sp)
    8000285c:	00013403          	ld	s0,0(sp)
    80002860:	01010113          	addi	sp,sp,16
    80002864:	00008067          	ret

0000000080002868 <_Znam>:
void* operator new[](size_t size) {
    80002868:	ff010113          	addi	sp,sp,-16
    8000286c:	00113423          	sd	ra,8(sp)
    80002870:	00813023          	sd	s0,0(sp)
    80002874:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002878:	fffff097          	auipc	ra,0xfffff
    8000287c:	b1c080e7          	jalr	-1252(ra) # 80001394 <_Z9mem_allocm>
}
    80002880:	00813083          	ld	ra,8(sp)
    80002884:	00013403          	ld	s0,0(sp)
    80002888:	01010113          	addi	sp,sp,16
    8000288c:	00008067          	ret

0000000080002890 <_ZdlPv>:
noexcept {
    80002890:	ff010113          	addi	sp,sp,-16
    80002894:	00113423          	sd	ra,8(sp)
    80002898:	00813023          	sd	s0,0(sp)
    8000289c:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800028a0:	fffff097          	auipc	ra,0xfffff
    800028a4:	b34080e7          	jalr	-1228(ra) # 800013d4 <_Z8mem_freePv>
}
    800028a8:	00813083          	ld	ra,8(sp)
    800028ac:	00013403          	ld	s0,0(sp)
    800028b0:	01010113          	addi	sp,sp,16
    800028b4:	00008067          	ret

00000000800028b8 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800028b8:	fe010113          	addi	sp,sp,-32
    800028bc:	00113c23          	sd	ra,24(sp)
    800028c0:	00813823          	sd	s0,16(sp)
    800028c4:	00913423          	sd	s1,8(sp)
    800028c8:	02010413          	addi	s0,sp,32
    800028cc:	00050493          	mv	s1,a0
}
    800028d0:	00000097          	auipc	ra,0x0
    800028d4:	f38080e7          	jalr	-200(ra) # 80002808 <_ZN9SemaphoreD1Ev>
    800028d8:	00048513          	mv	a0,s1
    800028dc:	00000097          	auipc	ra,0x0
    800028e0:	fb4080e7          	jalr	-76(ra) # 80002890 <_ZdlPv>
    800028e4:	01813083          	ld	ra,24(sp)
    800028e8:	01013403          	ld	s0,16(sp)
    800028ec:	00813483          	ld	s1,8(sp)
    800028f0:	02010113          	addi	sp,sp,32
    800028f4:	00008067          	ret

00000000800028f8 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800028f8:	fe010113          	addi	sp,sp,-32
    800028fc:	00113c23          	sd	ra,24(sp)
    80002900:	00813823          	sd	s0,16(sp)
    80002904:	00913423          	sd	s1,8(sp)
    80002908:	02010413          	addi	s0,sp,32
    8000290c:	00050493          	mv	s1,a0
}
    80002910:	00000097          	auipc	ra,0x0
    80002914:	e7c080e7          	jalr	-388(ra) # 8000278c <_ZN6ThreadD1Ev>
    80002918:	00048513          	mv	a0,s1
    8000291c:	00000097          	auipc	ra,0x0
    80002920:	f74080e7          	jalr	-140(ra) # 80002890 <_ZdlPv>
    80002924:	01813083          	ld	ra,24(sp)
    80002928:	01013403          	ld	s0,16(sp)
    8000292c:	00813483          	ld	s1,8(sp)
    80002930:	02010113          	addi	sp,sp,32
    80002934:	00008067          	ret

0000000080002938 <_ZdaPv>:
noexcept {
    80002938:	ff010113          	addi	sp,sp,-16
    8000293c:	00113423          	sd	ra,8(sp)
    80002940:	00813023          	sd	s0,0(sp)
    80002944:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002948:	fffff097          	auipc	ra,0xfffff
    8000294c:	a8c080e7          	jalr	-1396(ra) # 800013d4 <_Z8mem_freePv>
}
    80002950:	00813083          	ld	ra,8(sp)
    80002954:	00013403          	ld	s0,0(sp)
    80002958:	01010113          	addi	sp,sp,16
    8000295c:	00008067          	ret

0000000080002960 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80002960:	fd010113          	addi	sp,sp,-48
    80002964:	02113423          	sd	ra,40(sp)
    80002968:	02813023          	sd	s0,32(sp)
    8000296c:	00913c23          	sd	s1,24(sp)
    80002970:	01213823          	sd	s2,16(sp)
    80002974:	01313423          	sd	s3,8(sp)
    80002978:	03010413          	addi	s0,sp,48
    8000297c:	00050493          	mv	s1,a0
    80002980:	00058913          	mv	s2,a1
    80002984:	00060993          	mv	s3,a2
    80002988:	0000a797          	auipc	a5,0xa
    8000298c:	41078793          	addi	a5,a5,1040 # 8000cd98 <_ZTV6Thread+0x10>
    80002990:	00f53023          	sd	a5,0(a0)
    this->body = body;
    80002994:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    80002998:	00c53c23          	sd	a2,24(a0)
    if (body != (TCB::Body)main) {
    8000299c:	0000a797          	auipc	a5,0xa
    800029a0:	6f47b783          	ld	a5,1780(a5) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x68>
    800029a4:	04f58663          	beq	a1,a5,800029f0 <_ZN6ThreadC1EPFvPvES0_+0x90>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800029a8:	00001537          	lui	a0,0x1
    800029ac:	fffff097          	auipc	ra,0xfffff
    800029b0:	9e8080e7          	jalr	-1560(ra) # 80001394 <_Z9mem_allocm>
    800029b4:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800029b8:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800029bc:	00098693          	mv	a3,s3
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800029c0:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800029c4:	00848493          	addi	s1,s1,8
    800029c8:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    800029cc:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    800029d0:	00000073          	ecall
}
    800029d4:	02813083          	ld	ra,40(sp)
    800029d8:	02013403          	ld	s0,32(sp)
    800029dc:	01813483          	ld	s1,24(sp)
    800029e0:	01013903          	ld	s2,16(sp)
    800029e4:	00813983          	ld	s3,8(sp)
    800029e8:	03010113          	addi	sp,sp,48
    800029ec:	00008067          	ret
    uint64* stack = nullptr;
    800029f0:	00000313          	li	t1,0
    800029f4:	fc5ff06f          	j	800029b8 <_ZN6ThreadC1EPFvPvES0_+0x58>

00000000800029f8 <_ZN6Thread5startEv>:
int Thread::start() {
    800029f8:	ff010113          	addi	sp,sp,-16
    800029fc:	00813423          	sd	s0,8(sp)
    80002a00:	01010413          	addi	s0,sp,16
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    80002a04:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002a08:	02030463          	beqz	t1,80002a30 <_ZN6Thread5startEv+0x38>
    ThreadStatus getStatus() { return this->status; }
    80002a0c:	05832783          	lw	a5,88(t1)
    80002a10:	02079463          	bnez	a5,80002a38 <_ZN6Thread5startEv+0x40>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a14:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    80002a18:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    80002a1c:	00000073          	ecall
    return 0;
    80002a20:	00000513          	li	a0,0
}
    80002a24:	00813403          	ld	s0,8(sp)
    80002a28:	01010113          	addi	sp,sp,16
    80002a2c:	00008067          	ret
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    80002a30:	fff00513          	li	a0,-1
    80002a34:	ff1ff06f          	j	80002a24 <_ZN6Thread5startEv+0x2c>
    80002a38:	fff00513          	li	a0,-1
    80002a3c:	fe9ff06f          	j	80002a24 <_ZN6Thread5startEv+0x2c>

0000000080002a40 <_ZN6Thread4joinEv>:
    if (myHandle) thread_join(myHandle);
    80002a40:	00853503          	ld	a0,8(a0)
    80002a44:	02050663          	beqz	a0,80002a70 <_ZN6Thread4joinEv+0x30>
void Thread::join() {
    80002a48:	ff010113          	addi	sp,sp,-16
    80002a4c:	00113423          	sd	ra,8(sp)
    80002a50:	00813023          	sd	s0,0(sp)
    80002a54:	01010413          	addi	s0,sp,16
    if (myHandle) thread_join(myHandle);
    80002a58:	fffff097          	auipc	ra,0xfffff
    80002a5c:	a88080e7          	jalr	-1400(ra) # 800014e0 <_Z11thread_joinP3TCB>
}
    80002a60:	00813083          	ld	ra,8(sp)
    80002a64:	00013403          	ld	s0,0(sp)
    80002a68:	01010113          	addi	sp,sp,16
    80002a6c:	00008067          	ret
    80002a70:	00008067          	ret

0000000080002a74 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002a74:	ff010113          	addi	sp,sp,-16
    80002a78:	00113423          	sd	ra,8(sp)
    80002a7c:	00813023          	sd	s0,0(sp)
    80002a80:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002a84:	fffff097          	auipc	ra,0xfffff
    80002a88:	a3c080e7          	jalr	-1476(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80002a8c:	00813083          	ld	ra,8(sp)
    80002a90:	00013403          	ld	s0,0(sp)
    80002a94:	01010113          	addi	sp,sp,16
    80002a98:	00008067          	ret

0000000080002a9c <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80002a9c:	ff010113          	addi	sp,sp,-16
    80002aa0:	00113423          	sd	ra,8(sp)
    80002aa4:	00813023          	sd	s0,0(sp)
    80002aa8:	01010413          	addi	s0,sp,16
    time_sleep(t);
    80002aac:	fffff097          	auipc	ra,0xfffff
    80002ab0:	a5c080e7          	jalr	-1444(ra) # 80001508 <_Z10time_sleepm>
}
    80002ab4:	00000513          	li	a0,0
    80002ab8:	00813083          	ld	ra,8(sp)
    80002abc:	00013403          	ld	s0,0(sp)
    80002ac0:	01010113          	addi	sp,sp,16
    80002ac4:	00008067          	ret

0000000080002ac8 <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    80002ac8:	fe010113          	addi	sp,sp,-32
    80002acc:	00113c23          	sd	ra,24(sp)
    80002ad0:	00813823          	sd	s0,16(sp)
    80002ad4:	00913423          	sd	s1,8(sp)
    80002ad8:	02010413          	addi	s0,sp,32
    80002adc:	00050493          	mv	s1,a0
    while (period != -1UL) {
    80002ae0:	0204b703          	ld	a4,32(s1)
    80002ae4:	fff00793          	li	a5,-1
    80002ae8:	02f70663          	beq	a4,a5,80002b14 <_ZN14PeriodicThread3runEv+0x4c>
        periodicActivation();
    80002aec:	0004b783          	ld	a5,0(s1)
    80002af0:	0187b783          	ld	a5,24(a5)
    80002af4:	00048513          	mv	a0,s1
    80002af8:	000780e7          	jalr	a5
        if (period == -1UL) break;
    80002afc:	0204b503          	ld	a0,32(s1)
    80002b00:	fff00793          	li	a5,-1
    80002b04:	00f50863          	beq	a0,a5,80002b14 <_ZN14PeriodicThread3runEv+0x4c>
        sleep(period);
    80002b08:	00000097          	auipc	ra,0x0
    80002b0c:	f94080e7          	jalr	-108(ra) # 80002a9c <_ZN6Thread5sleepEm>
    while (period != -1UL) {
    80002b10:	fd1ff06f          	j	80002ae0 <_ZN14PeriodicThread3runEv+0x18>
    }
    thread_exit();
    80002b14:	fffff097          	auipc	ra,0xfffff
    80002b18:	984080e7          	jalr	-1660(ra) # 80001498 <_Z11thread_exitv>
}
    80002b1c:	01813083          	ld	ra,24(sp)
    80002b20:	01013403          	ld	s0,16(sp)
    80002b24:	00813483          	ld	s1,8(sp)
    80002b28:	02010113          	addi	sp,sp,32
    80002b2c:	00008067          	ret

0000000080002b30 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002b30:	fe010113          	addi	sp,sp,-32
    80002b34:	00113c23          	sd	ra,24(sp)
    80002b38:	00813823          	sd	s0,16(sp)
    80002b3c:	00913423          	sd	s1,8(sp)
    80002b40:	02010413          	addi	s0,sp,32
    80002b44:	00050493          	mv	s1,a0
    80002b48:	0000a797          	auipc	a5,0xa
    80002b4c:	25078793          	addi	a5,a5,592 # 8000cd98 <_ZTV6Thread+0x10>
    80002b50:	00f53023          	sd	a5,0(a0)
    this->body = wrapper;
    80002b54:	00000797          	auipc	a5,0x0
    80002b58:	c0478793          	addi	a5,a5,-1020 # 80002758 <_ZN6Thread7wrapperEPv>
    80002b5c:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80002b60:	00a53c23          	sd	a0,24(a0)
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002b64:	00001537          	lui	a0,0x1
    80002b68:	fffff097          	auipc	ra,0xfffff
    80002b6c:	82c080e7          	jalr	-2004(ra) # 80001394 <_Z9mem_allocm>
    80002b70:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002b74:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002b78:	0184b303          	ld	t1,24(s1)
    80002b7c:	00030693          	mv	a3,t1
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002b80:	0104b303          	ld	t1,16(s1)
    80002b84:	00030613          	mv	a2,t1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002b88:	00848493          	addi	s1,s1,8
    80002b8c:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002b90:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002b94:	00000073          	ecall
}
    80002b98:	01813083          	ld	ra,24(sp)
    80002b9c:	01013403          	ld	s0,16(sp)
    80002ba0:	00813483          	ld	s1,8(sp)
    80002ba4:	02010113          	addi	sp,sp,32
    80002ba8:	00008067          	ret

0000000080002bac <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002bac:	ff010113          	addi	sp,sp,-16
    80002bb0:	00113423          	sd	ra,8(sp)
    80002bb4:	00813023          	sd	s0,0(sp)
    80002bb8:	01010413          	addi	s0,sp,16
    80002bbc:	0000a797          	auipc	a5,0xa
    80002bc0:	20478793          	addi	a5,a5,516 # 8000cdc0 <_ZTV9Semaphore+0x10>
    80002bc4:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle, init);
    80002bc8:	00850513          	addi	a0,a0,8
    80002bcc:	fffff097          	auipc	ra,0xfffff
    80002bd0:	96c080e7          	jalr	-1684(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    80002bd4:	00813083          	ld	ra,8(sp)
    80002bd8:	00013403          	ld	s0,0(sp)
    80002bdc:	01010113          	addi	sp,sp,16
    80002be0:	00008067          	ret

0000000080002be4 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002be4:	ff010113          	addi	sp,sp,-16
    80002be8:	00113423          	sd	ra,8(sp)
    80002bec:	00813023          	sd	s0,0(sp)
    80002bf0:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002bf4:	00853503          	ld	a0,8(a0)
    80002bf8:	fffff097          	auipc	ra,0xfffff
    80002bfc:	9a8080e7          	jalr	-1624(ra) # 800015a0 <_Z8sem_waitP4KSem>
}
    80002c00:	00813083          	ld	ra,8(sp)
    80002c04:	00013403          	ld	s0,0(sp)
    80002c08:	01010113          	addi	sp,sp,16
    80002c0c:	00008067          	ret

0000000080002c10 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002c10:	ff010113          	addi	sp,sp,-16
    80002c14:	00113423          	sd	ra,8(sp)
    80002c18:	00813023          	sd	s0,0(sp)
    80002c1c:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80002c20:	00853503          	ld	a0,8(a0)
    80002c24:	fffff097          	auipc	ra,0xfffff
    80002c28:	9ac080e7          	jalr	-1620(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80002c2c:	00813083          	ld	ra,8(sp)
    80002c30:	00013403          	ld	s0,0(sp)
    80002c34:	01010113          	addi	sp,sp,16
    80002c38:	00008067          	ret

0000000080002c3c <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002c3c:	ff010113          	addi	sp,sp,-16
    80002c40:	00113423          	sd	ra,8(sp)
    80002c44:	00813023          	sd	s0,0(sp)
    80002c48:	01010413          	addi	s0,sp,16
    this->period = -1;
    80002c4c:	fff00793          	li	a5,-1
    80002c50:	02f53023          	sd	a5,32(a0)
    join();
    80002c54:	00000097          	auipc	ra,0x0
    80002c58:	dec080e7          	jalr	-532(ra) # 80002a40 <_ZN6Thread4joinEv>
}
    80002c5c:	00813083          	ld	ra,8(sp)
    80002c60:	00013403          	ld	s0,0(sp)
    80002c64:	01010113          	addi	sp,sp,16
    80002c68:	00008067          	ret

0000000080002c6c <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    80002c6c:	fe010113          	addi	sp,sp,-32
    80002c70:	00113c23          	sd	ra,24(sp)
    80002c74:	00813823          	sd	s0,16(sp)
    80002c78:	00913423          	sd	s1,8(sp)
    80002c7c:	01213023          	sd	s2,0(sp)
    80002c80:	02010413          	addi	s0,sp,32
    80002c84:	00050493          	mv	s1,a0
    80002c88:	00058913          	mv	s2,a1
    80002c8c:	00000097          	auipc	ra,0x0
    80002c90:	ea4080e7          	jalr	-348(ra) # 80002b30 <_ZN6ThreadC1Ev>
    80002c94:	0000a797          	auipc	a5,0xa
    80002c98:	14c78793          	addi	a5,a5,332 # 8000cde0 <_ZTV14PeriodicThread+0x10>
    80002c9c:	00f4b023          	sd	a5,0(s1)
    80002ca0:	0324b023          	sd	s2,32(s1)
}
    80002ca4:	01813083          	ld	ra,24(sp)
    80002ca8:	01013403          	ld	s0,16(sp)
    80002cac:	00813483          	ld	s1,8(sp)
    80002cb0:	00013903          	ld	s2,0(sp)
    80002cb4:	02010113          	addi	sp,sp,32
    80002cb8:	00008067          	ret

0000000080002cbc <_ZN7Console4getcEv>:

char Console::getc() {
    80002cbc:	ff010113          	addi	sp,sp,-16
    80002cc0:	00113423          	sd	ra,8(sp)
    80002cc4:	00813023          	sd	s0,0(sp)
    80002cc8:	01010413          	addi	s0,sp,16
    return ::getc();
    80002ccc:	fffff097          	auipc	ra,0xfffff
    80002cd0:	934080e7          	jalr	-1740(ra) # 80001600 <_Z4getcv>
}
    80002cd4:	00813083          	ld	ra,8(sp)
    80002cd8:	00013403          	ld	s0,0(sp)
    80002cdc:	01010113          	addi	sp,sp,16
    80002ce0:	00008067          	ret

0000000080002ce4 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002ce4:	ff010113          	addi	sp,sp,-16
    80002ce8:	00113423          	sd	ra,8(sp)
    80002cec:	00813023          	sd	s0,0(sp)
    80002cf0:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002cf4:	fffff097          	auipc	ra,0xfffff
    80002cf8:	934080e7          	jalr	-1740(ra) # 80001628 <_Z4putcc>
}
    80002cfc:	00813083          	ld	ra,8(sp)
    80002d00:	00013403          	ld	s0,0(sp)
    80002d04:	01010113          	addi	sp,sp,16
    80002d08:	00008067          	ret

0000000080002d0c <_ZN6Thread3runEv>:
protected:
    //konstruktor koji pravi nit koja izvrsava run metodu, ne stavlja je u Scheduler
    Thread();

    //funkcija koju nit izvrsava, samo ako je nit napravljena podrazumevanim konstruktorom
    virtual void run() {}
    80002d0c:	ff010113          	addi	sp,sp,-16
    80002d10:	00813423          	sd	s0,8(sp)
    80002d14:	01010413          	addi	s0,sp,16
    80002d18:	00813403          	ld	s0,8(sp)
    80002d1c:	01010113          	addi	sp,sp,16
    80002d20:	00008067          	ret

0000000080002d24 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    80002d24:	ff010113          	addi	sp,sp,-16
    80002d28:	00813423          	sd	s0,8(sp)
    80002d2c:	01010413          	addi	s0,sp,16
    80002d30:	00813403          	ld	s0,8(sp)
    80002d34:	01010113          	addi	sp,sp,16
    80002d38:	00008067          	ret

0000000080002d3c <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002d3c:	ff010113          	addi	sp,sp,-16
    80002d40:	00113423          	sd	ra,8(sp)
    80002d44:	00813023          	sd	s0,0(sp)
    80002d48:	01010413          	addi	s0,sp,16
    80002d4c:	0000a797          	auipc	a5,0xa
    80002d50:	09478793          	addi	a5,a5,148 # 8000cde0 <_ZTV14PeriodicThread+0x10>
    80002d54:	00f53023          	sd	a5,0(a0)
    80002d58:	00000097          	auipc	ra,0x0
    80002d5c:	a34080e7          	jalr	-1484(ra) # 8000278c <_ZN6ThreadD1Ev>
    80002d60:	00813083          	ld	ra,8(sp)
    80002d64:	00013403          	ld	s0,0(sp)
    80002d68:	01010113          	addi	sp,sp,16
    80002d6c:	00008067          	ret

0000000080002d70 <_ZN14PeriodicThreadD0Ev>:
    80002d70:	fe010113          	addi	sp,sp,-32
    80002d74:	00113c23          	sd	ra,24(sp)
    80002d78:	00813823          	sd	s0,16(sp)
    80002d7c:	00913423          	sd	s1,8(sp)
    80002d80:	02010413          	addi	s0,sp,32
    80002d84:	00050493          	mv	s1,a0
    80002d88:	0000a797          	auipc	a5,0xa
    80002d8c:	05878793          	addi	a5,a5,88 # 8000cde0 <_ZTV14PeriodicThread+0x10>
    80002d90:	00f53023          	sd	a5,0(a0)
    80002d94:	00000097          	auipc	ra,0x0
    80002d98:	9f8080e7          	jalr	-1544(ra) # 8000278c <_ZN6ThreadD1Ev>
    80002d9c:	00048513          	mv	a0,s1
    80002da0:	00000097          	auipc	ra,0x0
    80002da4:	af0080e7          	jalr	-1296(ra) # 80002890 <_ZdlPv>
    80002da8:	01813083          	ld	ra,24(sp)
    80002dac:	01013403          	ld	s0,16(sp)
    80002db0:	00813483          	ld	s1,8(sp)
    80002db4:	02010113          	addi	sp,sp,32
    80002db8:	00008067          	ret

0000000080002dbc <_ZN3TCB7wrapperEv>:
    TCB::runningTimeSlice = 0;

    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
}

void TCB::wrapper() {
    80002dbc:	ff010113          	addi	sp,sp,-16
    80002dc0:	00113423          	sd	ra,8(sp)
    80002dc4:	00813023          	sd	s0,0(sp)
    80002dc8:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch)

    //sada biramo u kom rezimu ce se izvrsavati nit, upisom bita SSTATUS_SPP
    //ako treba da se izvrsava kernel nit, povratak je u sistemski rezim, inace u korisnicki
    if (TCB::running->threadFunction == (TCB::Body)main || TCB::running->threadFunction == kernelConsumerFunction ||
    80002dcc:	0000a797          	auipc	a5,0xa
    80002dd0:	4547b783          	ld	a5,1108(a5) # 8000d220 <_ZN3TCB7runningE>
    80002dd4:	0107b783          	ld	a5,16(a5)
    80002dd8:	0000a717          	auipc	a4,0xa
    80002ddc:	2b873703          	ld	a4,696(a4) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002de0:	02e78463          	beq	a5,a4,80002e08 <_ZN3TCB7wrapperEv+0x4c>
    80002de4:	0000a717          	auipc	a4,0xa
    80002de8:	28473703          	ld	a4,644(a4) # 8000d068 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002dec:	00e78e63          	beq	a5,a4,80002e08 <_ZN3TCB7wrapperEv+0x4c>
    80002df0:	0000a717          	auipc	a4,0xa
    80002df4:	2d073703          	ld	a4,720(a4) # 8000d0c0 <_GLOBAL_OFFSET_TABLE_+0x98>
    80002df8:	00e78863          	beq	a5,a4,80002e08 <_ZN3TCB7wrapperEv+0x4c>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002dfc:	10000793          	li	a5,256
    80002e00:	1007b073          	csrc	sstatus,a5
}
    80002e04:	00c0006f          	j	80002e10 <_ZN3TCB7wrapperEv+0x54>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002e08:	10000793          	li	a5,256
    80002e0c:	1007a073          	csrs	sstatus,a5
        TCB::running->threadFunction == idle) {
        Riscv::ms_sstatus(Riscv::SSTATUS_SPP);
    } else {
        Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    }
    Riscv::returnFromInterrupt();
    80002e10:	00000097          	auipc	ra,0x0
    80002e14:	400080e7          	jalr	1024(ra) # 80003210 <_ZN5Riscv19returnFromInterruptEv>
    //na dalje se izvrsavamo u user modu (osim za kernel funkcije)
    running->threadFunction(running->args);
    80002e18:	0000a797          	auipc	a5,0xa
    80002e1c:	4087b783          	ld	a5,1032(a5) # 8000d220 <_ZN3TCB7runningE>
    80002e20:	0107b703          	ld	a4,16(a5)
    80002e24:	0207b503          	ld	a0,32(a5)
    80002e28:	000700e7          	jalr	a4
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    80002e2c:	ffffe097          	auipc	ra,0xffffe
    80002e30:	66c080e7          	jalr	1644(ra) # 80001498 <_Z11thread_exitv>
}
    80002e34:	00813083          	ld	ra,8(sp)
    80002e38:	00013403          	ld	s0,0(sp)
    80002e3c:	01010113          	addi	sp,sp,16
    80002e40:	00008067          	ret

0000000080002e44 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002e44:	fe010113          	addi	sp,sp,-32
    80002e48:	00113c23          	sd	ra,24(sp)
    80002e4c:	00813823          	sd	s0,16(sp)
    80002e50:	00913423          	sd	s1,8(sp)
    80002e54:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    80002e58:	0000a497          	auipc	s1,0xa
    80002e5c:	3c84b483          	ld	s1,968(s1) # 8000d220 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    80002e60:	0584a783          	lw	a5,88(s1)
    80002e64:	00100713          	li	a4,1
    80002e68:	04e78663          	beq	a5,a4,80002eb4 <_ZN3TCB8dispatchEv+0x70>
    } else if (old->status == FINISHED) {
    80002e6c:	00500713          	li	a4,5
    80002e70:	04e78a63          	beq	a5,a4,80002ec4 <_ZN3TCB8dispatchEv+0x80>
    TCB::running = Scheduler::get();
    80002e74:	fffff097          	auipc	ra,0xfffff
    80002e78:	b34080e7          	jalr	-1228(ra) # 800019a8 <_ZN9Scheduler3getEv>
    80002e7c:	00050593          	mv	a1,a0
    80002e80:	0000a797          	auipc	a5,0xa
    80002e84:	3a078793          	addi	a5,a5,928 # 8000d220 <_ZN3TCB7runningE>
    80002e88:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80002e8c:	0007b423          	sd	zero,8(a5)
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002e90:	00a48863          	beq	s1,a0,80002ea0 <_ZN3TCB8dispatchEv+0x5c>
    80002e94:	00048513          	mv	a0,s1
    80002e98:	ffffe097          	auipc	ra,0xffffe
    80002e9c:	278080e7          	jalr	632(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002ea0:	01813083          	ld	ra,24(sp)
    80002ea4:	01013403          	ld	s0,16(sp)
    80002ea8:	00813483          	ld	s1,8(sp)
    80002eac:	02010113          	addi	sp,sp,32
    80002eb0:	00008067          	ret
        Scheduler::put(old);
    80002eb4:	00048513          	mv	a0,s1
    80002eb8:	fffff097          	auipc	ra,0xfffff
    80002ebc:	aa4080e7          	jalr	-1372(ra) # 8000195c <_ZN9Scheduler3putEP3TCB>
    80002ec0:	fb5ff06f          	j	80002e74 <_ZN3TCB8dispatchEv+0x30>
        delete old->stack;
    80002ec4:	0184b503          	ld	a0,24(s1)
    80002ec8:	00050663          	beqz	a0,80002ed4 <_ZN3TCB8dispatchEv+0x90>
    80002ecc:	00000097          	auipc	ra,0x0
    80002ed0:	9c4080e7          	jalr	-1596(ra) # 80002890 <_ZdlPv>
        old->stack = nullptr;
    80002ed4:	0004bc23          	sd	zero,24(s1)
    80002ed8:	f9dff06f          	j	80002e74 <_ZN3TCB8dispatchEv+0x30>

0000000080002edc <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002edc:	ff010113          	addi	sp,sp,-16
    80002ee0:	00113423          	sd	ra,8(sp)
    80002ee4:	00813023          	sd	s0,0(sp)
    80002ee8:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002eec:	ffffe097          	auipc	ra,0xffffe
    80002ef0:	4a8080e7          	jalr	1192(ra) # 80001394 <_Z9mem_allocm>
}
    80002ef4:	00813083          	ld	ra,8(sp)
    80002ef8:	00013403          	ld	s0,0(sp)
    80002efc:	01010113          	addi	sp,sp,16
    80002f00:	00008067          	ret

0000000080002f04 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002f04:	fd010113          	addi	sp,sp,-48
    80002f08:	02113423          	sd	ra,40(sp)
    80002f0c:	02813023          	sd	s0,32(sp)
    80002f10:	00913c23          	sd	s1,24(sp)
    80002f14:	01213823          	sd	s2,16(sp)
    80002f18:	01313423          	sd	s3,8(sp)
    80002f1c:	03010413          	addi	s0,sp,48
    80002f20:	00050913          	mv	s2,a0
    80002f24:	00058993          	mv	s3,a1
    80002f28:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    80002f2c:	07000513          	li	a0,112
    80002f30:	00000097          	auipc	ra,0x0
    80002f34:	fac080e7          	jalr	-84(ra) # 80002edc <_ZN3TCBnwEm>
private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED), mySemaphore(nullptr),
                                                    joiningWithTCB(nullptr) {
    80002f38:	01253823          	sd	s2,16(a0)
    80002f3c:	00953c23          	sd	s1,24(a0)
    80002f40:	03353023          	sd	s3,32(a0)
    80002f44:	00200793          	li	a5,2
    80002f48:	02f53423          	sd	a5,40(a0)
    80002f4c:	02053823          	sd	zero,48(a0)
    80002f50:	02053c23          	sd	zero,56(a0)
    80002f54:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80002f58:	04053423          	sd	zero,72(a0)
    80002f5c:	04053823          	sd	zero,80(a0)
    80002f60:	04052c23          	sw	zero,88(a0)
    80002f64:	06053023          	sd	zero,96(a0)
    80002f68:	06053423          	sd	zero,104(a0)
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80002f6c:	0000a797          	auipc	a5,0xa
    80002f70:	1247b783          	ld	a5,292(a5) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002f74:	02f90e63          	beq	s2,a5,80002fb0 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002f78:	00000797          	auipc	a5,0x0
    80002f7c:	e4478793          	addi	a5,a5,-444 # 80002dbc <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002f80:	02048c63          	beqz	s1,80002fb8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb4>
    80002f84:	00001637          	lui	a2,0x1
    80002f88:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    80002f8c:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    80002f90:	00953423          	sd	s1,8(a0)
}
    80002f94:	02813083          	ld	ra,40(sp)
    80002f98:	02013403          	ld	s0,32(sp)
    80002f9c:	01813483          	ld	s1,24(sp)
    80002fa0:	01013903          	ld	s2,16(sp)
    80002fa4:	00813983          	ld	s3,8(sp)
    80002fa8:	03010113          	addi	sp,sp,48
    80002fac:	00008067          	ret
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80002fb0:	00000793          	li	a5,0
    80002fb4:	fcdff06f          	j	80002f80 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x7c>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002fb8:	00000493          	li	s1,0
    80002fbc:	fd1ff06f          	j	80002f8c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x88>

0000000080002fc0 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002fc0:	ff010113          	addi	sp,sp,-16
    80002fc4:	00113423          	sd	ra,8(sp)
    80002fc8:	00813023          	sd	s0,0(sp)
    80002fcc:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002fd0:	ffffe097          	auipc	ra,0xffffe
    80002fd4:	404080e7          	jalr	1028(ra) # 800013d4 <_Z8mem_freePv>
}
    80002fd8:	00813083          	ld	ra,8(sp)
    80002fdc:	00013403          	ld	s0,0(sp)
    80002fe0:	01010113          	addi	sp,sp,16
    80002fe4:	00008067          	ret

0000000080002fe8 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED || TCB::running == handle) return;
    80002fe8:	05852703          	lw	a4,88(a0)
    80002fec:	00500793          	li	a5,5
    80002ff0:	04f70463          	beq	a4,a5,80003038 <_ZN3TCB10threadJoinEPS_+0x50>
    80002ff4:	0000a597          	auipc	a1,0xa
    80002ff8:	22c5b583          	ld	a1,556(a1) # 8000d220 <_ZN3TCB7runningE>
    80002ffc:	02a58e63          	beq	a1,a0,80003038 <_ZN3TCB10threadJoinEPS_+0x50>
void TCB::threadJoin(TCB* handle) {
    80003000:	ff010113          	addi	sp,sp,-16
    80003004:	00113423          	sd	ra,8(sp)
    80003008:	00813023          	sd	s0,0(sp)
    8000300c:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    80003010:	00300793          	li	a5,3
    80003014:	04f5ac23          	sw	a5,88(a1)
    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }
    80003018:	06a5b423          	sd	a0,104(a1)
    TCB::running->setJoiningWithTCB(handle);
    handle->waitingToJoin.putLast(TCB::running);
    8000301c:	04850513          	addi	a0,a0,72
    80003020:	ffffe097          	auipc	ra,0xffffe
    80003024:	21c080e7          	jalr	540(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
}
    80003028:	00813083          	ld	ra,8(sp)
    8000302c:	00013403          	ld	s0,0(sp)
    80003030:	01010113          	addi	sp,sp,16
    80003034:	00008067          	ret
    80003038:	00008067          	ret

000000008000303c <_ZN3TCB13releaseJoinedEPS_>:

void TCB::releaseJoined(TCB* handle) {
    8000303c:	fe010113          	addi	sp,sp,-32
    80003040:	00113c23          	sd	ra,24(sp)
    80003044:	00813823          	sd	s0,16(sp)
    80003048:	00913423          	sd	s1,8(sp)
    8000304c:	02010413          	addi	s0,sp,32
    80003050:	00050493          	mv	s1,a0
        return front == nullptr;
    80003054:	0484b783          	ld	a5,72(s1)
    while (!handle->waitingToJoin.isEmpty()) {
    80003058:	02078063          	beqz	a5,80003078 <_ZN3TCB13releaseJoinedEPS_+0x3c>
        TCB* tcb = handle->waitingToJoin.getFirst();
    8000305c:	04848513          	addi	a0,s1,72
    80003060:	ffffe097          	auipc	ra,0xffffe
    80003064:	248080e7          	jalr	584(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
    80003068:	06053423          	sd	zero,104(a0)
        tcb->setJoiningWithTCB(nullptr);
        Scheduler::put(tcb);
    8000306c:	fffff097          	auipc	ra,0xfffff
    80003070:	8f0080e7          	jalr	-1808(ra) # 8000195c <_ZN9Scheduler3putEP3TCB>
    while (!handle->waitingToJoin.isEmpty()) {
    80003074:	fe1ff06f          	j	80003054 <_ZN3TCB13releaseJoinedEPS_+0x18>
    }
}
    80003078:	01813083          	ld	ra,24(sp)
    8000307c:	01013403          	ld	s0,16(sp)
    80003080:	00813483          	ld	s1,8(sp)
    80003084:	02010113          	addi	sp,sp,32
    80003088:	00008067          	ret

000000008000308c <_ZN3TCB10quitThreadEPS_>:

void TCB::quitThread(TCB* handle) {
    8000308c:	fe010113          	addi	sp,sp,-32
    80003090:	00113c23          	sd	ra,24(sp)
    80003094:	00813823          	sd	s0,16(sp)
    80003098:	00913423          	sd	s1,8(sp)
    8000309c:	02010413          	addi	s0,sp,32
    800030a0:	00050493          	mv	s1,a0
    TCB* prev, * curr;
    switch (handle->status) {
    800030a4:	05852783          	lw	a5,88(a0)
    800030a8:	00300713          	li	a4,3
    800030ac:	10e78063          	beq	a5,a4,800031ac <_ZN3TCB10quitThreadEPS_+0x120>
    800030b0:	04f76263          	bltu	a4,a5,800030f4 <_ZN3TCB10quitThreadEPS_+0x68>
    800030b4:	00100713          	li	a4,1
    800030b8:	06e78263          	beq	a5,a4,8000311c <_ZN3TCB10quitThreadEPS_+0x90>
    800030bc:	00200713          	li	a4,2
    800030c0:	08e79e63          	bne	a5,a4,8000315c <_ZN3TCB10quitThreadEPS_+0xd0>
            }
            curr->nextInScheduler = nullptr;
            break;
        case BLOCKED:
            //nit blokirana na semaforu, treba da se izbaci iz reda blokiranih na semaforu
            if (handle->mySemaphore->getBlocked()->remove(handle) < 0) {
    800030c4:	06053503          	ld	a0,96(a0)
    800030c8:	00048593          	mv	a1,s1
    800030cc:	00850513          	addi	a0,a0,8
    800030d0:	ffffe097          	auipc	ra,0xffffe
    800030d4:	238080e7          	jalr	568(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    800030d8:	08054263          	bltz	a0,8000315c <_ZN3TCB10quitThreadEPS_+0xd0>
                //greska
            } else {
                handle->mySemaphore->increaseVal(1);
    800030dc:	0604b703          	ld	a4,96(s1)

    static void operator delete(void* ptr);

    ThreadQueue* getBlocked() { return &blocked; }

    void increaseVal(int add) { val += add; }
    800030e0:	00072783          	lw	a5,0(a4)
    800030e4:	0017879b          	addiw	a5,a5,1
    800030e8:	00f72023          	sw	a5,0(a4)
                handle->mySemaphore = nullptr;
    800030ec:	0604b023          	sd	zero,96(s1)
    800030f0:	06c0006f          	j	8000315c <_ZN3TCB10quitThreadEPS_+0xd0>
    switch (handle->status) {
    800030f4:	00400713          	li	a4,4
    800030f8:	06e79263          	bne	a5,a4,8000315c <_ZN3TCB10quitThreadEPS_+0xd0>

    static TCB* getTail() { return tail; }

    static void setTail(TCB* tcb) { tail = tcb; }

    static TCB* getSleepingHead() { return sleepingHead; }
    800030fc:	0000a797          	auipc	a5,0xa
    80003100:	fbc7b783          	ld	a5,-68(a5) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003104:	0007b783          	ld	a5,0(a5)
                handle->joiningWithTCB = nullptr;
            }
            break;
        case SLEEPING:
            //nit je u redu uspavanih, treba da se izbaci
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    80003108:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextSleeping);
    8000310c:	0c978063          	beq	a5,s1,800031cc <_ZN3TCB10quitThreadEPS_+0x140>
    80003110:	00078713          	mv	a4,a5
    80003114:	0407b783          	ld	a5,64(a5)
            for (prev = nullptr, curr = Scheduler::getSleepingHead();
    80003118:	ff5ff06f          	j	8000310c <_ZN3TCB10quitThreadEPS_+0x80>
    static TCB* getHead() { return head; }
    8000311c:	0000a797          	auipc	a5,0xa
    80003120:	f547b783          	ld	a5,-172(a5) # 8000d070 <_GLOBAL_OFFSET_TABLE_+0x48>
    80003124:	0007b783          	ld	a5,0(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    80003128:	00000713          	li	a4,0
                 curr != handle; prev = curr, curr = curr->nextInScheduler);
    8000312c:	00978863          	beq	a5,s1,8000313c <_ZN3TCB10quitThreadEPS_+0xb0>
    80003130:	00078713          	mv	a4,a5
    80003134:	0307b783          	ld	a5,48(a5)
            for (prev = nullptr, curr = Scheduler::getHead();
    80003138:	ff5ff06f          	j	8000312c <_ZN3TCB10quitThreadEPS_+0xa0>
            if (!prev) {
    8000313c:	04070663          	beqz	a4,80003188 <_ZN3TCB10quitThreadEPS_+0xfc>
                prev->nextInScheduler = curr->nextInScheduler;
    80003140:	0307b683          	ld	a3,48(a5)
    80003144:	02d73823          	sd	a3,48(a4)
    static TCB* getTail() { return tail; }
    80003148:	0000a697          	auipc	a3,0xa
    8000314c:	f086b683          	ld	a3,-248(a3) # 8000d050 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003150:	0006b683          	ld	a3,0(a3)
            if (curr == Scheduler::getTail()) {
    80003154:	04d78463          	beq	a5,a3,8000319c <_ZN3TCB10quitThreadEPS_+0x110>
            curr->nextInScheduler = nullptr;
    80003158:	0207b823          	sd	zero,48(a5)
        case FINISHED:
            break;
        default:
            break;
    }
    handle->status = FINISHED;
    8000315c:	00500793          	li	a5,5
    80003160:	04f4ac23          	sw	a5,88(s1)
    delete handle->stack;
    80003164:	0184b503          	ld	a0,24(s1)
    80003168:	00050663          	beqz	a0,80003174 <_ZN3TCB10quitThreadEPS_+0xe8>
    8000316c:	fffff097          	auipc	ra,0xfffff
    80003170:	724080e7          	jalr	1828(ra) # 80002890 <_ZdlPv>
}
    80003174:	01813083          	ld	ra,24(sp)
    80003178:	01013403          	ld	s0,16(sp)
    8000317c:	00813483          	ld	s1,8(sp)
    80003180:	02010113          	addi	sp,sp,32
    80003184:	00008067          	ret
                Scheduler::setHead(curr->nextInScheduler);
    80003188:	0307b603          	ld	a2,48(a5)
    static void setHead(TCB* tcb) { head = tcb; }
    8000318c:	0000a697          	auipc	a3,0xa
    80003190:	ee46b683          	ld	a3,-284(a3) # 8000d070 <_GLOBAL_OFFSET_TABLE_+0x48>
    80003194:	00c6b023          	sd	a2,0(a3)
    80003198:	fb1ff06f          	j	80003148 <_ZN3TCB10quitThreadEPS_+0xbc>
    static void setTail(TCB* tcb) { tail = tcb; }
    8000319c:	0000a697          	auipc	a3,0xa
    800031a0:	eb46b683          	ld	a3,-332(a3) # 8000d050 <_GLOBAL_OFFSET_TABLE_+0x28>
    800031a4:	00e6b023          	sd	a4,0(a3)
    800031a8:	fb1ff06f          	j	80003158 <_ZN3TCB10quitThreadEPS_+0xcc>
            if (handle->joiningWithTCB->getListOfJoiningThreads()->remove(handle) < 0) {
    800031ac:	06853503          	ld	a0,104(a0)
    800031b0:	00048593          	mv	a1,s1
    800031b4:	04850513          	addi	a0,a0,72
    800031b8:	ffffe097          	auipc	ra,0xffffe
    800031bc:	150080e7          	jalr	336(ra) # 80001308 <_ZN11ThreadQueue6removeEP3TCB>
    800031c0:	f8054ee3          	bltz	a0,8000315c <_ZN3TCB10quitThreadEPS_+0xd0>
                handle->joiningWithTCB = nullptr;
    800031c4:	0604b423          	sd	zero,104(s1)
    800031c8:	f95ff06f          	j	8000315c <_ZN3TCB10quitThreadEPS_+0xd0>
            if (!prev) {
    800031cc:	02070863          	beqz	a4,800031fc <_ZN3TCB10quitThreadEPS_+0x170>
                prev->nextSleeping = curr->nextSleeping;
    800031d0:	0407b683          	ld	a3,64(a5)
    800031d4:	04d73023          	sd	a3,64(a4)
            if (curr->nextSleeping) {
    800031d8:	0407b703          	ld	a4,64(a5)
    800031dc:	00070a63          	beqz	a4,800031f0 <_ZN3TCB10quitThreadEPS_+0x164>
                curr->nextSleeping->timeToSleep += curr->timeToSleep;
    800031e0:	0387b603          	ld	a2,56(a5)
    800031e4:	03873683          	ld	a3,56(a4)
    800031e8:	00c686b3          	add	a3,a3,a2
    800031ec:	02d73c23          	sd	a3,56(a4)
            curr->timeToSleep = 0;
    800031f0:	0207bc23          	sd	zero,56(a5)
            curr->nextSleeping = nullptr;
    800031f4:	0407b023          	sd	zero,64(a5)
            break;
    800031f8:	f65ff06f          	j	8000315c <_ZN3TCB10quitThreadEPS_+0xd0>
                Scheduler::setSleepingHead(curr->nextSleeping);
    800031fc:	0407b683          	ld	a3,64(a5)

    static void setSleepingHead(TCB* tcb) { sleepingHead = tcb; }
    80003200:	0000a717          	auipc	a4,0xa
    80003204:	eb873703          	ld	a4,-328(a4) # 8000d0b8 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003208:	00d73023          	sd	a3,0(a4)
    8000320c:	fcdff06f          	j	800031d8 <_ZN3TCB10quitThreadEPS_+0x14c>

0000000080003210 <_ZN5Riscv19returnFromInterruptEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::returnFromInterrupt() {
    80003210:	ff010113          	addi	sp,sp,-16
    80003214:	00813423          	sd	s0,8(sp)
    80003218:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    8000321c:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80003220:	10200073          	sret
    80003224:	00813403          	ld	s0,8(sp)
    80003228:	01010113          	addi	sp,sp,16
    8000322c:	00008067          	ret

0000000080003230 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80003230:	ff010113          	addi	sp,sp,-16
    80003234:	00113423          	sd	ra,8(sp)
    80003238:	00813023          	sd	s0,0(sp)
    8000323c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003240:	ffffe097          	auipc	ra,0xffffe
    80003244:	154080e7          	jalr	340(ra) # 80001394 <_Z9mem_allocm>
}
    80003248:	00813083          	ld	ra,8(sp)
    8000324c:	00013403          	ld	s0,0(sp)
    80003250:	01010113          	addi	sp,sp,16
    80003254:	00008067          	ret

0000000080003258 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80003258:	ff010113          	addi	sp,sp,-16
    8000325c:	00113423          	sd	ra,8(sp)
    80003260:	00813023          	sd	s0,0(sp)
    80003264:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003268:	ffffe097          	auipc	ra,0xffffe
    8000326c:	16c080e7          	jalr	364(ra) # 800013d4 <_Z8mem_freePv>
}
    80003270:	00813083          	ld	ra,8(sp)
    80003274:	00013403          	ld	s0,0(sp)
    80003278:	01010113          	addi	sp,sp,16
    8000327c:	00008067          	ret

0000000080003280 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003280:	fe010113          	addi	sp,sp,-32
    80003284:	00113c23          	sd	ra,24(sp)
    80003288:	00813823          	sd	s0,16(sp)
    8000328c:	00913423          	sd	s1,8(sp)
    80003290:	02010413          	addi	s0,sp,32
    80003294:	00050493          	mv	s1,a0
	return new KSem(val);
    80003298:	01800513          	li	a0,24
    8000329c:	00000097          	auipc	ra,0x0
    800032a0:	f94080e7          	jalr	-108(ra) # 80003230 <_ZN4KSemnwEm>
    void block();

    void unblock();

private:
    KSem(uint val) : val(val) {}
    800032a4:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    800032a8:	00053423          	sd	zero,8(a0)
    800032ac:	00053823          	sd	zero,16(a0)
}
    800032b0:	01813083          	ld	ra,24(sp)
    800032b4:	01013403          	ld	s0,16(sp)
    800032b8:	00813483          	ld	s1,8(sp)
    800032bc:	02010113          	addi	sp,sp,32
    800032c0:	00008067          	ret

00000000800032c4 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    800032c4:	ff010113          	addi	sp,sp,-16
    800032c8:	00113423          	sd	ra,8(sp)
    800032cc:	00813023          	sd	s0,0(sp)
    800032d0:	01010413          	addi	s0,sp,16
    static TCB* getRunning() { return running; }
    800032d4:	0000a797          	auipc	a5,0xa
    800032d8:	dcc7b783          	ld	a5,-564(a5) # 8000d0a0 <_GLOBAL_OFFSET_TABLE_+0x78>
    800032dc:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    800032e0:	00200793          	li	a5,2
    800032e4:	04f5ac23          	sw	a5,88(a1)
    void setMySemaphore(KSem* sem) { mySemaphore = sem; }
    800032e8:	06a5b023          	sd	a0,96(a1)
    TCB::getRunning()->setStatus(TCB::BLOCKED);
    TCB::getRunning()->setMySemaphore(this);
	blocked.putLast(TCB::getRunning());
    800032ec:	00850513          	addi	a0,a0,8
    800032f0:	ffffe097          	auipc	ra,0xffffe
    800032f4:	f4c080e7          	jalr	-180(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::dispatch();
    800032f8:	00000097          	auipc	ra,0x0
    800032fc:	b4c080e7          	jalr	-1204(ra) # 80002e44 <_ZN3TCB8dispatchEv>
}
    80003300:	00813083          	ld	ra,8(sp)
    80003304:	00013403          	ld	s0,0(sp)
    80003308:	01010113          	addi	sp,sp,16
    8000330c:	00008067          	ret

0000000080003310 <_ZN4KSem4waitEv>:
	if (--val < 0) {
    80003310:	00052783          	lw	a5,0(a0)
    80003314:	fff7879b          	addiw	a5,a5,-1
    80003318:	00f52023          	sw	a5,0(a0)
    8000331c:	02079713          	slli	a4,a5,0x20
    80003320:	00074663          	bltz	a4,8000332c <_ZN4KSem4waitEv+0x1c>
	return 0;
    80003324:	00000513          	li	a0,0
}
    80003328:	00008067          	ret
int KSem::wait() {
    8000332c:	ff010113          	addi	sp,sp,-16
    80003330:	00113423          	sd	ra,8(sp)
    80003334:	00813023          	sd	s0,0(sp)
    80003338:	01010413          	addi	s0,sp,16
		block();
    8000333c:	00000097          	auipc	ra,0x0
    80003340:	f88080e7          	jalr	-120(ra) # 800032c4 <_ZN4KSem5blockEv>
		return -1;
    80003344:	fff00513          	li	a0,-1
}
    80003348:	00813083          	ld	ra,8(sp)
    8000334c:	00013403          	ld	s0,0(sp)
    80003350:	01010113          	addi	sp,sp,16
    80003354:	00008067          	ret

0000000080003358 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003358:	ff010113          	addi	sp,sp,-16
    8000335c:	00113423          	sd	ra,8(sp)
    80003360:	00813023          	sd	s0,0(sp)
    80003364:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003368:	00850513          	addi	a0,a0,8
    8000336c:	ffffe097          	auipc	ra,0xffffe
    80003370:	f3c080e7          	jalr	-196(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
    80003374:	06053023          	sd	zero,96(a0)
    tcb->setMySemaphore(nullptr);
	Scheduler::put(tcb);
    80003378:	ffffe097          	auipc	ra,0xffffe
    8000337c:	5e4080e7          	jalr	1508(ra) # 8000195c <_ZN9Scheduler3putEP3TCB>
}
    80003380:	00813083          	ld	ra,8(sp)
    80003384:	00013403          	ld	s0,0(sp)
    80003388:	01010113          	addi	sp,sp,16
    8000338c:	00008067          	ret

0000000080003390 <_ZN4KSem6signalEv>:
	if (val++ < 0) {
    80003390:	00052783          	lw	a5,0(a0)
    80003394:	0017871b          	addiw	a4,a5,1
    80003398:	00e52023          	sw	a4,0(a0)
    8000339c:	0007c663          	bltz	a5,800033a8 <_ZN4KSem6signalEv+0x18>
}
    800033a0:	00000513          	li	a0,0
    800033a4:	00008067          	ret
int KSem::signal() {
    800033a8:	ff010113          	addi	sp,sp,-16
    800033ac:	00113423          	sd	ra,8(sp)
    800033b0:	00813023          	sd	s0,0(sp)
    800033b4:	01010413          	addi	s0,sp,16
		unblock();
    800033b8:	00000097          	auipc	ra,0x0
    800033bc:	fa0080e7          	jalr	-96(ra) # 80003358 <_ZN4KSem7unblockEv>
}
    800033c0:	00000513          	li	a0,0
    800033c4:	00813083          	ld	ra,8(sp)
    800033c8:	00013403          	ld	s0,0(sp)
    800033cc:	01010113          	addi	sp,sp,16
    800033d0:	00008067          	ret

00000000800033d4 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    800033d4:	fe010113          	addi	sp,sp,-32
    800033d8:	00113c23          	sd	ra,24(sp)
    800033dc:	00813823          	sd	s0,16(sp)
    800033e0:	00913423          	sd	s1,8(sp)
    800033e4:	02010413          	addi	s0,sp,32
    800033e8:	00050493          	mv	s1,a0
        return front == nullptr;
    800033ec:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    800033f0:	00078a63          	beqz	a5,80003404 <_ZN4KSem8closeSemEPS_+0x30>
		handle->unblock();
    800033f4:	00048513          	mv	a0,s1
    800033f8:	00000097          	auipc	ra,0x0
    800033fc:	f60080e7          	jalr	-160(ra) # 80003358 <_ZN4KSem7unblockEv>
	while (!handle->blocked.isEmpty()) {
    80003400:	fedff06f          	j	800033ec <_ZN4KSem8closeSemEPS_+0x18>
	}
	return 0;
}
    80003404:	00000513          	li	a0,0
    80003408:	01813083          	ld	ra,24(sp)
    8000340c:	01013403          	ld	s0,16(sp)
    80003410:	00813483          	ld	s1,8(sp)
    80003414:	02010113          	addi	sp,sp,32
    80003418:	00008067          	ret

000000008000341c <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    8000341c:	fe010113          	addi	sp,sp,-32
    80003420:	00113c23          	sd	ra,24(sp)
    80003424:	00813823          	sd	s0,16(sp)
    80003428:	00913423          	sd	s1,8(sp)
    8000342c:	01213023          	sd	s2,0(sp)
    80003430:	02010413          	addi	s0,sp,32
    80003434:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003438:	00000913          	li	s2,0
    8000343c:	00c0006f          	j	80003448 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003440:	ffffe097          	auipc	ra,0xffffe
    80003444:	080080e7          	jalr	128(ra) # 800014c0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80003448:	ffffe097          	auipc	ra,0xffffe
    8000344c:	1b8080e7          	jalr	440(ra) # 80001600 <_Z4getcv>
    80003450:	0005059b          	sext.w	a1,a0
    80003454:	02d00793          	li	a5,45
    80003458:	02f58a63          	beq	a1,a5,8000348c <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    8000345c:	0084b503          	ld	a0,8(s1)
    80003460:	00003097          	auipc	ra,0x3
    80003464:	400080e7          	jalr	1024(ra) # 80006860 <_ZN6Buffer3putEi>
        i++;
    80003468:	0019071b          	addiw	a4,s2,1
    8000346c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003470:	0004a683          	lw	a3,0(s1)
    80003474:	0026979b          	slliw	a5,a3,0x2
    80003478:	00d787bb          	addw	a5,a5,a3
    8000347c:	0017979b          	slliw	a5,a5,0x1
    80003480:	02f767bb          	remw	a5,a4,a5
    80003484:	fc0792e3          	bnez	a5,80003448 <_ZL16producerKeyboardPv+0x2c>
    80003488:	fb9ff06f          	j	80003440 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    8000348c:	00100793          	li	a5,1
    80003490:	0000a717          	auipc	a4,0xa
    80003494:	daf72023          	sw	a5,-608(a4) # 8000d230 <_ZL9threadEnd>
    data->buffer->put('!');
    80003498:	02100593          	li	a1,33
    8000349c:	0084b503          	ld	a0,8(s1)
    800034a0:	00003097          	auipc	ra,0x3
    800034a4:	3c0080e7          	jalr	960(ra) # 80006860 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800034a8:	0104b503          	ld	a0,16(s1)
    800034ac:	ffffe097          	auipc	ra,0xffffe
    800034b0:	124080e7          	jalr	292(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    800034b4:	01813083          	ld	ra,24(sp)
    800034b8:	01013403          	ld	s0,16(sp)
    800034bc:	00813483          	ld	s1,8(sp)
    800034c0:	00013903          	ld	s2,0(sp)
    800034c4:	02010113          	addi	sp,sp,32
    800034c8:	00008067          	ret

00000000800034cc <_ZL8producerPv>:

static void producer(void *arg) {
    800034cc:	fe010113          	addi	sp,sp,-32
    800034d0:	00113c23          	sd	ra,24(sp)
    800034d4:	00813823          	sd	s0,16(sp)
    800034d8:	00913423          	sd	s1,8(sp)
    800034dc:	01213023          	sd	s2,0(sp)
    800034e0:	02010413          	addi	s0,sp,32
    800034e4:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800034e8:	00000913          	li	s2,0
    800034ec:	00c0006f          	j	800034f8 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800034f0:	ffffe097          	auipc	ra,0xffffe
    800034f4:	fd0080e7          	jalr	-48(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    800034f8:	0000a797          	auipc	a5,0xa
    800034fc:	d387a783          	lw	a5,-712(a5) # 8000d230 <_ZL9threadEnd>
    80003500:	02079e63          	bnez	a5,8000353c <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003504:	0004a583          	lw	a1,0(s1)
    80003508:	0305859b          	addiw	a1,a1,48
    8000350c:	0084b503          	ld	a0,8(s1)
    80003510:	00003097          	auipc	ra,0x3
    80003514:	350080e7          	jalr	848(ra) # 80006860 <_ZN6Buffer3putEi>
        i++;
    80003518:	0019071b          	addiw	a4,s2,1
    8000351c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003520:	0004a683          	lw	a3,0(s1)
    80003524:	0026979b          	slliw	a5,a3,0x2
    80003528:	00d787bb          	addw	a5,a5,a3
    8000352c:	0017979b          	slliw	a5,a5,0x1
    80003530:	02f767bb          	remw	a5,a4,a5
    80003534:	fc0792e3          	bnez	a5,800034f8 <_ZL8producerPv+0x2c>
    80003538:	fb9ff06f          	j	800034f0 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    8000353c:	0104b503          	ld	a0,16(s1)
    80003540:	ffffe097          	auipc	ra,0xffffe
    80003544:	090080e7          	jalr	144(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80003548:	01813083          	ld	ra,24(sp)
    8000354c:	01013403          	ld	s0,16(sp)
    80003550:	00813483          	ld	s1,8(sp)
    80003554:	00013903          	ld	s2,0(sp)
    80003558:	02010113          	addi	sp,sp,32
    8000355c:	00008067          	ret

0000000080003560 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003560:	fd010113          	addi	sp,sp,-48
    80003564:	02113423          	sd	ra,40(sp)
    80003568:	02813023          	sd	s0,32(sp)
    8000356c:	00913c23          	sd	s1,24(sp)
    80003570:	01213823          	sd	s2,16(sp)
    80003574:	01313423          	sd	s3,8(sp)
    80003578:	03010413          	addi	s0,sp,48
    8000357c:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003580:	00000993          	li	s3,0
    80003584:	01c0006f          	j	800035a0 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003588:	ffffe097          	auipc	ra,0xffffe
    8000358c:	f38080e7          	jalr	-200(ra) # 800014c0 <_Z15thread_dispatchv>
    80003590:	0500006f          	j	800035e0 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003594:	00a00513          	li	a0,10
    80003598:	ffffe097          	auipc	ra,0xffffe
    8000359c:	090080e7          	jalr	144(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    800035a0:	0000a797          	auipc	a5,0xa
    800035a4:	c907a783          	lw	a5,-880(a5) # 8000d230 <_ZL9threadEnd>
    800035a8:	06079063          	bnez	a5,80003608 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800035ac:	00893503          	ld	a0,8(s2)
    800035b0:	00003097          	auipc	ra,0x3
    800035b4:	340080e7          	jalr	832(ra) # 800068f0 <_ZN6Buffer3getEv>
        i++;
    800035b8:	0019849b          	addiw	s1,s3,1
    800035bc:	0004899b          	sext.w	s3,s1
        putc(key);
    800035c0:	0ff57513          	andi	a0,a0,255
    800035c4:	ffffe097          	auipc	ra,0xffffe
    800035c8:	064080e7          	jalr	100(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800035cc:	00092703          	lw	a4,0(s2)
    800035d0:	0027179b          	slliw	a5,a4,0x2
    800035d4:	00e787bb          	addw	a5,a5,a4
    800035d8:	02f4e7bb          	remw	a5,s1,a5
    800035dc:	fa0786e3          	beqz	a5,80003588 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800035e0:	05000793          	li	a5,80
    800035e4:	02f4e4bb          	remw	s1,s1,a5
    800035e8:	fa049ce3          	bnez	s1,800035a0 <_ZL8consumerPv+0x40>
    800035ec:	fa9ff06f          	j	80003594 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800035f0:	00893503          	ld	a0,8(s2)
    800035f4:	00003097          	auipc	ra,0x3
    800035f8:	2fc080e7          	jalr	764(ra) # 800068f0 <_ZN6Buffer3getEv>
        putc(key);
    800035fc:	0ff57513          	andi	a0,a0,255
    80003600:	ffffe097          	auipc	ra,0xffffe
    80003604:	028080e7          	jalr	40(ra) # 80001628 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003608:	00893503          	ld	a0,8(s2)
    8000360c:	00003097          	auipc	ra,0x3
    80003610:	370080e7          	jalr	880(ra) # 8000697c <_ZN6Buffer6getCntEv>
    80003614:	fca04ee3          	bgtz	a0,800035f0 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003618:	01093503          	ld	a0,16(s2)
    8000361c:	ffffe097          	auipc	ra,0xffffe
    80003620:	fb4080e7          	jalr	-76(ra) # 800015d0 <_Z10sem_signalP4KSem>
}
    80003624:	02813083          	ld	ra,40(sp)
    80003628:	02013403          	ld	s0,32(sp)
    8000362c:	01813483          	ld	s1,24(sp)
    80003630:	01013903          	ld	s2,16(sp)
    80003634:	00813983          	ld	s3,8(sp)
    80003638:	03010113          	addi	sp,sp,48
    8000363c:	00008067          	ret

0000000080003640 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003640:	f9010113          	addi	sp,sp,-112
    80003644:	06113423          	sd	ra,104(sp)
    80003648:	06813023          	sd	s0,96(sp)
    8000364c:	04913c23          	sd	s1,88(sp)
    80003650:	05213823          	sd	s2,80(sp)
    80003654:	05313423          	sd	s3,72(sp)
    80003658:	05413023          	sd	s4,64(sp)
    8000365c:	03513c23          	sd	s5,56(sp)
    80003660:	03613823          	sd	s6,48(sp)
    80003664:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003668:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    8000366c:	00007517          	auipc	a0,0x7
    80003670:	bbc50513          	addi	a0,a0,-1092 # 8000a228 <CONSOLE_STATUS+0x218>
    80003674:	00002097          	auipc	ra,0x2
    80003678:	220080e7          	jalr	544(ra) # 80005894 <_Z11printStringPKc>
    getString(input, 30);
    8000367c:	01e00593          	li	a1,30
    80003680:	fa040493          	addi	s1,s0,-96
    80003684:	00048513          	mv	a0,s1
    80003688:	00002097          	auipc	ra,0x2
    8000368c:	294080e7          	jalr	660(ra) # 8000591c <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003690:	00048513          	mv	a0,s1
    80003694:	00002097          	auipc	ra,0x2
    80003698:	360080e7          	jalr	864(ra) # 800059f4 <_Z11stringToIntPKc>
    8000369c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800036a0:	00007517          	auipc	a0,0x7
    800036a4:	ba850513          	addi	a0,a0,-1112 # 8000a248 <CONSOLE_STATUS+0x238>
    800036a8:	00002097          	auipc	ra,0x2
    800036ac:	1ec080e7          	jalr	492(ra) # 80005894 <_Z11printStringPKc>
    getString(input, 30);
    800036b0:	01e00593          	li	a1,30
    800036b4:	00048513          	mv	a0,s1
    800036b8:	00002097          	auipc	ra,0x2
    800036bc:	264080e7          	jalr	612(ra) # 8000591c <_Z9getStringPci>
    n = stringToInt(input);
    800036c0:	00048513          	mv	a0,s1
    800036c4:	00002097          	auipc	ra,0x2
    800036c8:	330080e7          	jalr	816(ra) # 800059f4 <_Z11stringToIntPKc>
    800036cc:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    800036d0:	00007517          	auipc	a0,0x7
    800036d4:	b9850513          	addi	a0,a0,-1128 # 8000a268 <CONSOLE_STATUS+0x258>
    800036d8:	00002097          	auipc	ra,0x2
    800036dc:	1bc080e7          	jalr	444(ra) # 80005894 <_Z11printStringPKc>
	printInt(threadNum);
    800036e0:	00000613          	li	a2,0
    800036e4:	00a00593          	li	a1,10
    800036e8:	00090513          	mv	a0,s2
    800036ec:	00002097          	auipc	ra,0x2
    800036f0:	358080e7          	jalr	856(ra) # 80005a44 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800036f4:	00007517          	auipc	a0,0x7
    800036f8:	b8c50513          	addi	a0,a0,-1140 # 8000a280 <CONSOLE_STATUS+0x270>
    800036fc:	00002097          	auipc	ra,0x2
    80003700:	198080e7          	jalr	408(ra) # 80005894 <_Z11printStringPKc>
	printInt(n);
    80003704:	00000613          	li	a2,0
    80003708:	00a00593          	li	a1,10
    8000370c:	00048513          	mv	a0,s1
    80003710:	00002097          	auipc	ra,0x2
    80003714:	334080e7          	jalr	820(ra) # 80005a44 <_Z8printIntiii>
    printString(".\n");
    80003718:	00007517          	auipc	a0,0x7
    8000371c:	b8050513          	addi	a0,a0,-1152 # 8000a298 <CONSOLE_STATUS+0x288>
    80003720:	00002097          	auipc	ra,0x2
    80003724:	174080e7          	jalr	372(ra) # 80005894 <_Z11printStringPKc>
    if(threadNum > n) {
    80003728:	0324c463          	blt	s1,s2,80003750 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    8000372c:	03205c63          	blez	s2,80003764 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003730:	03800513          	li	a0,56
    80003734:	fffff097          	auipc	ra,0xfffff
    80003738:	10c080e7          	jalr	268(ra) # 80002840 <_Znwm>
    8000373c:	00050a13          	mv	s4,a0
    80003740:	00048593          	mv	a1,s1
    80003744:	00003097          	auipc	ra,0x3
    80003748:	080080e7          	jalr	128(ra) # 800067c4 <_ZN6BufferC1Ei>
    8000374c:	0300006f          	j	8000377c <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003750:	00007517          	auipc	a0,0x7
    80003754:	b5050513          	addi	a0,a0,-1200 # 8000a2a0 <CONSOLE_STATUS+0x290>
    80003758:	00002097          	auipc	ra,0x2
    8000375c:	13c080e7          	jalr	316(ra) # 80005894 <_Z11printStringPKc>
        return;
    80003760:	0140006f          	j	80003774 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003764:	00007517          	auipc	a0,0x7
    80003768:	b7c50513          	addi	a0,a0,-1156 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    8000376c:	00002097          	auipc	ra,0x2
    80003770:	128080e7          	jalr	296(ra) # 80005894 <_Z11printStringPKc>
        return;
    80003774:	000b0113          	mv	sp,s6
    80003778:	1500006f          	j	800038c8 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    8000377c:	00000593          	li	a1,0
    80003780:	0000a517          	auipc	a0,0xa
    80003784:	ab850513          	addi	a0,a0,-1352 # 8000d238 <_ZL10waitForAll>
    80003788:	ffffe097          	auipc	ra,0xffffe
    8000378c:	db0080e7          	jalr	-592(ra) # 80001538 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003790:	00391793          	slli	a5,s2,0x3
    80003794:	00f78793          	addi	a5,a5,15
    80003798:	ff07f793          	andi	a5,a5,-16
    8000379c:	40f10133          	sub	sp,sp,a5
    800037a0:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800037a4:	0019071b          	addiw	a4,s2,1
    800037a8:	00171793          	slli	a5,a4,0x1
    800037ac:	00e787b3          	add	a5,a5,a4
    800037b0:	00379793          	slli	a5,a5,0x3
    800037b4:	00f78793          	addi	a5,a5,15
    800037b8:	ff07f793          	andi	a5,a5,-16
    800037bc:	40f10133          	sub	sp,sp,a5
    800037c0:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800037c4:	00191613          	slli	a2,s2,0x1
    800037c8:	012607b3          	add	a5,a2,s2
    800037cc:	00379793          	slli	a5,a5,0x3
    800037d0:	00f987b3          	add	a5,s3,a5
    800037d4:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800037d8:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800037dc:	0000a717          	auipc	a4,0xa
    800037e0:	a5c73703          	ld	a4,-1444(a4) # 8000d238 <_ZL10waitForAll>
    800037e4:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800037e8:	00078613          	mv	a2,a5
    800037ec:	00000597          	auipc	a1,0x0
    800037f0:	d7458593          	addi	a1,a1,-652 # 80003560 <_ZL8consumerPv>
    800037f4:	f9840513          	addi	a0,s0,-104
    800037f8:	ffffe097          	auipc	ra,0xffffe
    800037fc:	c0c080e7          	jalr	-1012(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003800:	00000493          	li	s1,0
    80003804:	0280006f          	j	8000382c <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003808:	00000597          	auipc	a1,0x0
    8000380c:	c1458593          	addi	a1,a1,-1004 # 8000341c <_ZL16producerKeyboardPv>
                      data + i);
    80003810:	00179613          	slli	a2,a5,0x1
    80003814:	00f60633          	add	a2,a2,a5
    80003818:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    8000381c:	00c98633          	add	a2,s3,a2
    80003820:	ffffe097          	auipc	ra,0xffffe
    80003824:	be4080e7          	jalr	-1052(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003828:	0014849b          	addiw	s1,s1,1
    8000382c:	0524d263          	bge	s1,s2,80003870 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003830:	00149793          	slli	a5,s1,0x1
    80003834:	009787b3          	add	a5,a5,s1
    80003838:	00379793          	slli	a5,a5,0x3
    8000383c:	00f987b3          	add	a5,s3,a5
    80003840:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003844:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003848:	0000a717          	auipc	a4,0xa
    8000384c:	9f073703          	ld	a4,-1552(a4) # 8000d238 <_ZL10waitForAll>
    80003850:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003854:	00048793          	mv	a5,s1
    80003858:	00349513          	slli	a0,s1,0x3
    8000385c:	00aa8533          	add	a0,s5,a0
    80003860:	fa9054e3          	blez	s1,80003808 <_Z22producerConsumer_C_APIv+0x1c8>
    80003864:	00000597          	auipc	a1,0x0
    80003868:	c6858593          	addi	a1,a1,-920 # 800034cc <_ZL8producerPv>
    8000386c:	fa5ff06f          	j	80003810 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003870:	ffffe097          	auipc	ra,0xffffe
    80003874:	c50080e7          	jalr	-944(ra) # 800014c0 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003878:	00000493          	li	s1,0
    8000387c:	00994e63          	blt	s2,s1,80003898 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003880:	0000a517          	auipc	a0,0xa
    80003884:	9b853503          	ld	a0,-1608(a0) # 8000d238 <_ZL10waitForAll>
    80003888:	ffffe097          	auipc	ra,0xffffe
    8000388c:	d18080e7          	jalr	-744(ra) # 800015a0 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003890:	0014849b          	addiw	s1,s1,1
    80003894:	fe9ff06f          	j	8000387c <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003898:	0000a517          	auipc	a0,0xa
    8000389c:	9a053503          	ld	a0,-1632(a0) # 8000d238 <_ZL10waitForAll>
    800038a0:	ffffe097          	auipc	ra,0xffffe
    800038a4:	cd0080e7          	jalr	-816(ra) # 80001570 <_Z9sem_closeP4KSem>
    delete buffer;
    800038a8:	000a0e63          	beqz	s4,800038c4 <_Z22producerConsumer_C_APIv+0x284>
    800038ac:	000a0513          	mv	a0,s4
    800038b0:	00003097          	auipc	ra,0x3
    800038b4:	154080e7          	jalr	340(ra) # 80006a04 <_ZN6BufferD1Ev>
    800038b8:	000a0513          	mv	a0,s4
    800038bc:	fffff097          	auipc	ra,0xfffff
    800038c0:	fd4080e7          	jalr	-44(ra) # 80002890 <_ZdlPv>
    800038c4:	000b0113          	mv	sp,s6

}
    800038c8:	f9040113          	addi	sp,s0,-112
    800038cc:	06813083          	ld	ra,104(sp)
    800038d0:	06013403          	ld	s0,96(sp)
    800038d4:	05813483          	ld	s1,88(sp)
    800038d8:	05013903          	ld	s2,80(sp)
    800038dc:	04813983          	ld	s3,72(sp)
    800038e0:	04013a03          	ld	s4,64(sp)
    800038e4:	03813a83          	ld	s5,56(sp)
    800038e8:	03013b03          	ld	s6,48(sp)
    800038ec:	07010113          	addi	sp,sp,112
    800038f0:	00008067          	ret
    800038f4:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800038f8:	000a0513          	mv	a0,s4
    800038fc:	fffff097          	auipc	ra,0xfffff
    80003900:	f94080e7          	jalr	-108(ra) # 80002890 <_ZdlPv>
    80003904:	00048513          	mv	a0,s1
    80003908:	0000b097          	auipc	ra,0xb
    8000390c:	a70080e7          	jalr	-1424(ra) # 8000e378 <_Unwind_Resume>

0000000080003910 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003910:	fe010113          	addi	sp,sp,-32
    80003914:	00113c23          	sd	ra,24(sp)
    80003918:	00813823          	sd	s0,16(sp)
    8000391c:	00913423          	sd	s1,8(sp)
    80003920:	01213023          	sd	s2,0(sp)
    80003924:	02010413          	addi	s0,sp,32
    80003928:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000392c:	00100793          	li	a5,1
    80003930:	02a7f863          	bgeu	a5,a0,80003960 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003934:	00a00793          	li	a5,10
    80003938:	02f577b3          	remu	a5,a0,a5
    8000393c:	02078e63          	beqz	a5,80003978 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003940:	fff48513          	addi	a0,s1,-1
    80003944:	00000097          	auipc	ra,0x0
    80003948:	fcc080e7          	jalr	-52(ra) # 80003910 <_ZL9fibonaccim>
    8000394c:	00050913          	mv	s2,a0
    80003950:	ffe48513          	addi	a0,s1,-2
    80003954:	00000097          	auipc	ra,0x0
    80003958:	fbc080e7          	jalr	-68(ra) # 80003910 <_ZL9fibonaccim>
    8000395c:	00a90533          	add	a0,s2,a0
}
    80003960:	01813083          	ld	ra,24(sp)
    80003964:	01013403          	ld	s0,16(sp)
    80003968:	00813483          	ld	s1,8(sp)
    8000396c:	00013903          	ld	s2,0(sp)
    80003970:	02010113          	addi	sp,sp,32
    80003974:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003978:	ffffe097          	auipc	ra,0xffffe
    8000397c:	b48080e7          	jalr	-1208(ra) # 800014c0 <_Z15thread_dispatchv>
    80003980:	fc1ff06f          	j	80003940 <_ZL9fibonaccim+0x30>

0000000080003984 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003984:	fe010113          	addi	sp,sp,-32
    80003988:	00113c23          	sd	ra,24(sp)
    8000398c:	00813823          	sd	s0,16(sp)
    80003990:	00913423          	sd	s1,8(sp)
    80003994:	01213023          	sd	s2,0(sp)
    80003998:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000399c:	00000913          	li	s2,0
    800039a0:	0380006f          	j	800039d8 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800039a4:	ffffe097          	auipc	ra,0xffffe
    800039a8:	b1c080e7          	jalr	-1252(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800039ac:	00148493          	addi	s1,s1,1
    800039b0:	000027b7          	lui	a5,0x2
    800039b4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800039b8:	0097ee63          	bltu	a5,s1,800039d4 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800039bc:	00000713          	li	a4,0
    800039c0:	000077b7          	lui	a5,0x7
    800039c4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800039c8:	fce7eee3          	bltu	a5,a4,800039a4 <_ZN7WorkerA11workerBodyAEPv+0x20>
    800039cc:	00170713          	addi	a4,a4,1
    800039d0:	ff1ff06f          	j	800039c0 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800039d4:	00190913          	addi	s2,s2,1
    800039d8:	00900793          	li	a5,9
    800039dc:	0527e063          	bltu	a5,s2,80003a1c <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800039e0:	00007517          	auipc	a0,0x7
    800039e4:	93050513          	addi	a0,a0,-1744 # 8000a310 <CONSOLE_STATUS+0x300>
    800039e8:	00002097          	auipc	ra,0x2
    800039ec:	eac080e7          	jalr	-340(ra) # 80005894 <_Z11printStringPKc>
    800039f0:	00000613          	li	a2,0
    800039f4:	00a00593          	li	a1,10
    800039f8:	0009051b          	sext.w	a0,s2
    800039fc:	00002097          	auipc	ra,0x2
    80003a00:	048080e7          	jalr	72(ra) # 80005a44 <_Z8printIntiii>
    80003a04:	00007517          	auipc	a0,0x7
    80003a08:	b6c50513          	addi	a0,a0,-1172 # 8000a570 <CONSOLE_STATUS+0x560>
    80003a0c:	00002097          	auipc	ra,0x2
    80003a10:	e88080e7          	jalr	-376(ra) # 80005894 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003a14:	00000493          	li	s1,0
    80003a18:	f99ff06f          	j	800039b0 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003a1c:	00007517          	auipc	a0,0x7
    80003a20:	8fc50513          	addi	a0,a0,-1796 # 8000a318 <CONSOLE_STATUS+0x308>
    80003a24:	00002097          	auipc	ra,0x2
    80003a28:	e70080e7          	jalr	-400(ra) # 80005894 <_Z11printStringPKc>
    finishedA = true;
    80003a2c:	00100793          	li	a5,1
    80003a30:	0000a717          	auipc	a4,0xa
    80003a34:	80f70823          	sb	a5,-2032(a4) # 8000d240 <_ZL9finishedA>
}
    80003a38:	01813083          	ld	ra,24(sp)
    80003a3c:	01013403          	ld	s0,16(sp)
    80003a40:	00813483          	ld	s1,8(sp)
    80003a44:	00013903          	ld	s2,0(sp)
    80003a48:	02010113          	addi	sp,sp,32
    80003a4c:	00008067          	ret

0000000080003a50 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003a50:	fe010113          	addi	sp,sp,-32
    80003a54:	00113c23          	sd	ra,24(sp)
    80003a58:	00813823          	sd	s0,16(sp)
    80003a5c:	00913423          	sd	s1,8(sp)
    80003a60:	01213023          	sd	s2,0(sp)
    80003a64:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003a68:	00000913          	li	s2,0
    80003a6c:	0380006f          	j	80003aa4 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003a70:	ffffe097          	auipc	ra,0xffffe
    80003a74:	a50080e7          	jalr	-1456(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003a78:	00148493          	addi	s1,s1,1
    80003a7c:	000027b7          	lui	a5,0x2
    80003a80:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003a84:	0097ee63          	bltu	a5,s1,80003aa0 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003a88:	00000713          	li	a4,0
    80003a8c:	000077b7          	lui	a5,0x7
    80003a90:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003a94:	fce7eee3          	bltu	a5,a4,80003a70 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003a98:	00170713          	addi	a4,a4,1
    80003a9c:	ff1ff06f          	j	80003a8c <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003aa0:	00190913          	addi	s2,s2,1
    80003aa4:	00f00793          	li	a5,15
    80003aa8:	0527e063          	bltu	a5,s2,80003ae8 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003aac:	00007517          	auipc	a0,0x7
    80003ab0:	87c50513          	addi	a0,a0,-1924 # 8000a328 <CONSOLE_STATUS+0x318>
    80003ab4:	00002097          	auipc	ra,0x2
    80003ab8:	de0080e7          	jalr	-544(ra) # 80005894 <_Z11printStringPKc>
    80003abc:	00000613          	li	a2,0
    80003ac0:	00a00593          	li	a1,10
    80003ac4:	0009051b          	sext.w	a0,s2
    80003ac8:	00002097          	auipc	ra,0x2
    80003acc:	f7c080e7          	jalr	-132(ra) # 80005a44 <_Z8printIntiii>
    80003ad0:	00007517          	auipc	a0,0x7
    80003ad4:	aa050513          	addi	a0,a0,-1376 # 8000a570 <CONSOLE_STATUS+0x560>
    80003ad8:	00002097          	auipc	ra,0x2
    80003adc:	dbc080e7          	jalr	-580(ra) # 80005894 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003ae0:	00000493          	li	s1,0
    80003ae4:	f99ff06f          	j	80003a7c <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003ae8:	00007517          	auipc	a0,0x7
    80003aec:	84850513          	addi	a0,a0,-1976 # 8000a330 <CONSOLE_STATUS+0x320>
    80003af0:	00002097          	auipc	ra,0x2
    80003af4:	da4080e7          	jalr	-604(ra) # 80005894 <_Z11printStringPKc>
    finishedB = true;
    80003af8:	00100793          	li	a5,1
    80003afc:	00009717          	auipc	a4,0x9
    80003b00:	74f702a3          	sb	a5,1861(a4) # 8000d241 <_ZL9finishedB>
    thread_dispatch();
    80003b04:	ffffe097          	auipc	ra,0xffffe
    80003b08:	9bc080e7          	jalr	-1604(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80003b0c:	01813083          	ld	ra,24(sp)
    80003b10:	01013403          	ld	s0,16(sp)
    80003b14:	00813483          	ld	s1,8(sp)
    80003b18:	00013903          	ld	s2,0(sp)
    80003b1c:	02010113          	addi	sp,sp,32
    80003b20:	00008067          	ret

0000000080003b24 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003b24:	fe010113          	addi	sp,sp,-32
    80003b28:	00113c23          	sd	ra,24(sp)
    80003b2c:	00813823          	sd	s0,16(sp)
    80003b30:	00913423          	sd	s1,8(sp)
    80003b34:	01213023          	sd	s2,0(sp)
    80003b38:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003b3c:	00000493          	li	s1,0
    80003b40:	0400006f          	j	80003b80 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003b44:	00006517          	auipc	a0,0x6
    80003b48:	7fc50513          	addi	a0,a0,2044 # 8000a340 <CONSOLE_STATUS+0x330>
    80003b4c:	00002097          	auipc	ra,0x2
    80003b50:	d48080e7          	jalr	-696(ra) # 80005894 <_Z11printStringPKc>
    80003b54:	00000613          	li	a2,0
    80003b58:	00a00593          	li	a1,10
    80003b5c:	00048513          	mv	a0,s1
    80003b60:	00002097          	auipc	ra,0x2
    80003b64:	ee4080e7          	jalr	-284(ra) # 80005a44 <_Z8printIntiii>
    80003b68:	00007517          	auipc	a0,0x7
    80003b6c:	a0850513          	addi	a0,a0,-1528 # 8000a570 <CONSOLE_STATUS+0x560>
    80003b70:	00002097          	auipc	ra,0x2
    80003b74:	d24080e7          	jalr	-732(ra) # 80005894 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003b78:	0014849b          	addiw	s1,s1,1
    80003b7c:	0ff4f493          	andi	s1,s1,255
    80003b80:	00200793          	li	a5,2
    80003b84:	fc97f0e3          	bgeu	a5,s1,80003b44 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003b88:	00006517          	auipc	a0,0x6
    80003b8c:	7c050513          	addi	a0,a0,1984 # 8000a348 <CONSOLE_STATUS+0x338>
    80003b90:	00002097          	auipc	ra,0x2
    80003b94:	d04080e7          	jalr	-764(ra) # 80005894 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003b98:	00700313          	li	t1,7
    thread_dispatch();
    80003b9c:	ffffe097          	auipc	ra,0xffffe
    80003ba0:	924080e7          	jalr	-1756(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003ba4:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003ba8:	00006517          	auipc	a0,0x6
    80003bac:	7b050513          	addi	a0,a0,1968 # 8000a358 <CONSOLE_STATUS+0x348>
    80003bb0:	00002097          	auipc	ra,0x2
    80003bb4:	ce4080e7          	jalr	-796(ra) # 80005894 <_Z11printStringPKc>
    80003bb8:	00000613          	li	a2,0
    80003bbc:	00a00593          	li	a1,10
    80003bc0:	0009051b          	sext.w	a0,s2
    80003bc4:	00002097          	auipc	ra,0x2
    80003bc8:	e80080e7          	jalr	-384(ra) # 80005a44 <_Z8printIntiii>
    80003bcc:	00007517          	auipc	a0,0x7
    80003bd0:	9a450513          	addi	a0,a0,-1628 # 8000a570 <CONSOLE_STATUS+0x560>
    80003bd4:	00002097          	auipc	ra,0x2
    80003bd8:	cc0080e7          	jalr	-832(ra) # 80005894 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003bdc:	00c00513          	li	a0,12
    80003be0:	00000097          	auipc	ra,0x0
    80003be4:	d30080e7          	jalr	-720(ra) # 80003910 <_ZL9fibonaccim>
    80003be8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003bec:	00006517          	auipc	a0,0x6
    80003bf0:	77450513          	addi	a0,a0,1908 # 8000a360 <CONSOLE_STATUS+0x350>
    80003bf4:	00002097          	auipc	ra,0x2
    80003bf8:	ca0080e7          	jalr	-864(ra) # 80005894 <_Z11printStringPKc>
    80003bfc:	00000613          	li	a2,0
    80003c00:	00a00593          	li	a1,10
    80003c04:	0009051b          	sext.w	a0,s2
    80003c08:	00002097          	auipc	ra,0x2
    80003c0c:	e3c080e7          	jalr	-452(ra) # 80005a44 <_Z8printIntiii>
    80003c10:	00007517          	auipc	a0,0x7
    80003c14:	96050513          	addi	a0,a0,-1696 # 8000a570 <CONSOLE_STATUS+0x560>
    80003c18:	00002097          	auipc	ra,0x2
    80003c1c:	c7c080e7          	jalr	-900(ra) # 80005894 <_Z11printStringPKc>
    80003c20:	0400006f          	j	80003c60 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003c24:	00006517          	auipc	a0,0x6
    80003c28:	71c50513          	addi	a0,a0,1820 # 8000a340 <CONSOLE_STATUS+0x330>
    80003c2c:	00002097          	auipc	ra,0x2
    80003c30:	c68080e7          	jalr	-920(ra) # 80005894 <_Z11printStringPKc>
    80003c34:	00000613          	li	a2,0
    80003c38:	00a00593          	li	a1,10
    80003c3c:	00048513          	mv	a0,s1
    80003c40:	00002097          	auipc	ra,0x2
    80003c44:	e04080e7          	jalr	-508(ra) # 80005a44 <_Z8printIntiii>
    80003c48:	00007517          	auipc	a0,0x7
    80003c4c:	92850513          	addi	a0,a0,-1752 # 8000a570 <CONSOLE_STATUS+0x560>
    80003c50:	00002097          	auipc	ra,0x2
    80003c54:	c44080e7          	jalr	-956(ra) # 80005894 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003c58:	0014849b          	addiw	s1,s1,1
    80003c5c:	0ff4f493          	andi	s1,s1,255
    80003c60:	00500793          	li	a5,5
    80003c64:	fc97f0e3          	bgeu	a5,s1,80003c24 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80003c68:	00006517          	auipc	a0,0x6
    80003c6c:	70850513          	addi	a0,a0,1800 # 8000a370 <CONSOLE_STATUS+0x360>
    80003c70:	00002097          	auipc	ra,0x2
    80003c74:	c24080e7          	jalr	-988(ra) # 80005894 <_Z11printStringPKc>
    finishedC = true;
    80003c78:	00100793          	li	a5,1
    80003c7c:	00009717          	auipc	a4,0x9
    80003c80:	5cf70323          	sb	a5,1478(a4) # 8000d242 <_ZL9finishedC>
    thread_dispatch();
    80003c84:	ffffe097          	auipc	ra,0xffffe
    80003c88:	83c080e7          	jalr	-1988(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80003c8c:	01813083          	ld	ra,24(sp)
    80003c90:	01013403          	ld	s0,16(sp)
    80003c94:	00813483          	ld	s1,8(sp)
    80003c98:	00013903          	ld	s2,0(sp)
    80003c9c:	02010113          	addi	sp,sp,32
    80003ca0:	00008067          	ret

0000000080003ca4 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003ca4:	fe010113          	addi	sp,sp,-32
    80003ca8:	00113c23          	sd	ra,24(sp)
    80003cac:	00813823          	sd	s0,16(sp)
    80003cb0:	00913423          	sd	s1,8(sp)
    80003cb4:	01213023          	sd	s2,0(sp)
    80003cb8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003cbc:	00a00493          	li	s1,10
    80003cc0:	0400006f          	j	80003d00 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003cc4:	00006517          	auipc	a0,0x6
    80003cc8:	6bc50513          	addi	a0,a0,1724 # 8000a380 <CONSOLE_STATUS+0x370>
    80003ccc:	00002097          	auipc	ra,0x2
    80003cd0:	bc8080e7          	jalr	-1080(ra) # 80005894 <_Z11printStringPKc>
    80003cd4:	00000613          	li	a2,0
    80003cd8:	00a00593          	li	a1,10
    80003cdc:	00048513          	mv	a0,s1
    80003ce0:	00002097          	auipc	ra,0x2
    80003ce4:	d64080e7          	jalr	-668(ra) # 80005a44 <_Z8printIntiii>
    80003ce8:	00007517          	auipc	a0,0x7
    80003cec:	88850513          	addi	a0,a0,-1912 # 8000a570 <CONSOLE_STATUS+0x560>
    80003cf0:	00002097          	auipc	ra,0x2
    80003cf4:	ba4080e7          	jalr	-1116(ra) # 80005894 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003cf8:	0014849b          	addiw	s1,s1,1
    80003cfc:	0ff4f493          	andi	s1,s1,255
    80003d00:	00c00793          	li	a5,12
    80003d04:	fc97f0e3          	bgeu	a5,s1,80003cc4 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003d08:	00006517          	auipc	a0,0x6
    80003d0c:	68050513          	addi	a0,a0,1664 # 8000a388 <CONSOLE_STATUS+0x378>
    80003d10:	00002097          	auipc	ra,0x2
    80003d14:	b84080e7          	jalr	-1148(ra) # 80005894 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003d18:	00500313          	li	t1,5
    thread_dispatch();
    80003d1c:	ffffd097          	auipc	ra,0xffffd
    80003d20:	7a4080e7          	jalr	1956(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003d24:	01000513          	li	a0,16
    80003d28:	00000097          	auipc	ra,0x0
    80003d2c:	be8080e7          	jalr	-1048(ra) # 80003910 <_ZL9fibonaccim>
    80003d30:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003d34:	00006517          	auipc	a0,0x6
    80003d38:	66450513          	addi	a0,a0,1636 # 8000a398 <CONSOLE_STATUS+0x388>
    80003d3c:	00002097          	auipc	ra,0x2
    80003d40:	b58080e7          	jalr	-1192(ra) # 80005894 <_Z11printStringPKc>
    80003d44:	00000613          	li	a2,0
    80003d48:	00a00593          	li	a1,10
    80003d4c:	0009051b          	sext.w	a0,s2
    80003d50:	00002097          	auipc	ra,0x2
    80003d54:	cf4080e7          	jalr	-780(ra) # 80005a44 <_Z8printIntiii>
    80003d58:	00007517          	auipc	a0,0x7
    80003d5c:	81850513          	addi	a0,a0,-2024 # 8000a570 <CONSOLE_STATUS+0x560>
    80003d60:	00002097          	auipc	ra,0x2
    80003d64:	b34080e7          	jalr	-1228(ra) # 80005894 <_Z11printStringPKc>
    80003d68:	0400006f          	j	80003da8 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003d6c:	00006517          	auipc	a0,0x6
    80003d70:	61450513          	addi	a0,a0,1556 # 8000a380 <CONSOLE_STATUS+0x370>
    80003d74:	00002097          	auipc	ra,0x2
    80003d78:	b20080e7          	jalr	-1248(ra) # 80005894 <_Z11printStringPKc>
    80003d7c:	00000613          	li	a2,0
    80003d80:	00a00593          	li	a1,10
    80003d84:	00048513          	mv	a0,s1
    80003d88:	00002097          	auipc	ra,0x2
    80003d8c:	cbc080e7          	jalr	-836(ra) # 80005a44 <_Z8printIntiii>
    80003d90:	00006517          	auipc	a0,0x6
    80003d94:	7e050513          	addi	a0,a0,2016 # 8000a570 <CONSOLE_STATUS+0x560>
    80003d98:	00002097          	auipc	ra,0x2
    80003d9c:	afc080e7          	jalr	-1284(ra) # 80005894 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003da0:	0014849b          	addiw	s1,s1,1
    80003da4:	0ff4f493          	andi	s1,s1,255
    80003da8:	00f00793          	li	a5,15
    80003dac:	fc97f0e3          	bgeu	a5,s1,80003d6c <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003db0:	00006517          	auipc	a0,0x6
    80003db4:	5f850513          	addi	a0,a0,1528 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80003db8:	00002097          	auipc	ra,0x2
    80003dbc:	adc080e7          	jalr	-1316(ra) # 80005894 <_Z11printStringPKc>
    finishedD = true;
    80003dc0:	00100793          	li	a5,1
    80003dc4:	00009717          	auipc	a4,0x9
    80003dc8:	46f70fa3          	sb	a5,1151(a4) # 8000d243 <_ZL9finishedD>
    thread_dispatch();
    80003dcc:	ffffd097          	auipc	ra,0xffffd
    80003dd0:	6f4080e7          	jalr	1780(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80003dd4:	01813083          	ld	ra,24(sp)
    80003dd8:	01013403          	ld	s0,16(sp)
    80003ddc:	00813483          	ld	s1,8(sp)
    80003de0:	00013903          	ld	s2,0(sp)
    80003de4:	02010113          	addi	sp,sp,32
    80003de8:	00008067          	ret

0000000080003dec <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003dec:	fc010113          	addi	sp,sp,-64
    80003df0:	02113c23          	sd	ra,56(sp)
    80003df4:	02813823          	sd	s0,48(sp)
    80003df8:	02913423          	sd	s1,40(sp)
    80003dfc:	03213023          	sd	s2,32(sp)
    80003e00:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003e04:	02000513          	li	a0,32
    80003e08:	fffff097          	auipc	ra,0xfffff
    80003e0c:	a38080e7          	jalr	-1480(ra) # 80002840 <_Znwm>
    80003e10:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003e14:	fffff097          	auipc	ra,0xfffff
    80003e18:	d1c080e7          	jalr	-740(ra) # 80002b30 <_ZN6ThreadC1Ev>
    80003e1c:	00009797          	auipc	a5,0x9
    80003e20:	ff478793          	addi	a5,a5,-12 # 8000ce10 <_ZTV7WorkerA+0x10>
    80003e24:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003e28:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003e2c:	00006517          	auipc	a0,0x6
    80003e30:	58c50513          	addi	a0,a0,1420 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    80003e34:	00002097          	auipc	ra,0x2
    80003e38:	a60080e7          	jalr	-1440(ra) # 80005894 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003e3c:	02000513          	li	a0,32
    80003e40:	fffff097          	auipc	ra,0xfffff
    80003e44:	a00080e7          	jalr	-1536(ra) # 80002840 <_Znwm>
    80003e48:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003e4c:	fffff097          	auipc	ra,0xfffff
    80003e50:	ce4080e7          	jalr	-796(ra) # 80002b30 <_ZN6ThreadC1Ev>
    80003e54:	00009797          	auipc	a5,0x9
    80003e58:	fe478793          	addi	a5,a5,-28 # 8000ce38 <_ZTV7WorkerB+0x10>
    80003e5c:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003e60:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003e64:	00006517          	auipc	a0,0x6
    80003e68:	56c50513          	addi	a0,a0,1388 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80003e6c:	00002097          	auipc	ra,0x2
    80003e70:	a28080e7          	jalr	-1496(ra) # 80005894 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003e74:	02000513          	li	a0,32
    80003e78:	fffff097          	auipc	ra,0xfffff
    80003e7c:	9c8080e7          	jalr	-1592(ra) # 80002840 <_Znwm>
    80003e80:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003e84:	fffff097          	auipc	ra,0xfffff
    80003e88:	cac080e7          	jalr	-852(ra) # 80002b30 <_ZN6ThreadC1Ev>
    80003e8c:	00009797          	auipc	a5,0x9
    80003e90:	fd478793          	addi	a5,a5,-44 # 8000ce60 <_ZTV7WorkerC+0x10>
    80003e94:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003e98:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003e9c:	00006517          	auipc	a0,0x6
    80003ea0:	54c50513          	addi	a0,a0,1356 # 8000a3e8 <CONSOLE_STATUS+0x3d8>
    80003ea4:	00002097          	auipc	ra,0x2
    80003ea8:	9f0080e7          	jalr	-1552(ra) # 80005894 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80003eac:	02000513          	li	a0,32
    80003eb0:	fffff097          	auipc	ra,0xfffff
    80003eb4:	990080e7          	jalr	-1648(ra) # 80002840 <_Znwm>
    80003eb8:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80003ebc:	fffff097          	auipc	ra,0xfffff
    80003ec0:	c74080e7          	jalr	-908(ra) # 80002b30 <_ZN6ThreadC1Ev>
    80003ec4:	00009797          	auipc	a5,0x9
    80003ec8:	fc478793          	addi	a5,a5,-60 # 8000ce88 <_ZTV7WorkerD+0x10>
    80003ecc:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80003ed0:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80003ed4:	00006517          	auipc	a0,0x6
    80003ed8:	52c50513          	addi	a0,a0,1324 # 8000a400 <CONSOLE_STATUS+0x3f0>
    80003edc:	00002097          	auipc	ra,0x2
    80003ee0:	9b8080e7          	jalr	-1608(ra) # 80005894 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80003ee4:	00000493          	li	s1,0
    80003ee8:	00300793          	li	a5,3
    80003eec:	0297c663          	blt	a5,s1,80003f18 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80003ef0:	00349793          	slli	a5,s1,0x3
    80003ef4:	fe040713          	addi	a4,s0,-32
    80003ef8:	00f707b3          	add	a5,a4,a5
    80003efc:	fe07b503          	ld	a0,-32(a5)
    80003f00:	fffff097          	auipc	ra,0xfffff
    80003f04:	af8080e7          	jalr	-1288(ra) # 800029f8 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80003f08:	0014849b          	addiw	s1,s1,1
    80003f0c:	fddff06f          	j	80003ee8 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80003f10:	fffff097          	auipc	ra,0xfffff
    80003f14:	b64080e7          	jalr	-1180(ra) # 80002a74 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003f18:	00009797          	auipc	a5,0x9
    80003f1c:	3287c783          	lbu	a5,808(a5) # 8000d240 <_ZL9finishedA>
    80003f20:	fe0788e3          	beqz	a5,80003f10 <_Z20Threads_CPP_API_testv+0x124>
    80003f24:	00009797          	auipc	a5,0x9
    80003f28:	31d7c783          	lbu	a5,797(a5) # 8000d241 <_ZL9finishedB>
    80003f2c:	fe0782e3          	beqz	a5,80003f10 <_Z20Threads_CPP_API_testv+0x124>
    80003f30:	00009797          	auipc	a5,0x9
    80003f34:	3127c783          	lbu	a5,786(a5) # 8000d242 <_ZL9finishedC>
    80003f38:	fc078ce3          	beqz	a5,80003f10 <_Z20Threads_CPP_API_testv+0x124>
    80003f3c:	00009797          	auipc	a5,0x9
    80003f40:	3077c783          	lbu	a5,775(a5) # 8000d243 <_ZL9finishedD>
    80003f44:	fc0786e3          	beqz	a5,80003f10 <_Z20Threads_CPP_API_testv+0x124>
    80003f48:	fc040493          	addi	s1,s0,-64
    80003f4c:	0080006f          	j	80003f54 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    80003f50:	00848493          	addi	s1,s1,8
    80003f54:	fe040793          	addi	a5,s0,-32
    80003f58:	08f48663          	beq	s1,a5,80003fe4 <_Z20Threads_CPP_API_testv+0x1f8>
    80003f5c:	0004b503          	ld	a0,0(s1)
		delete thread;
    80003f60:	fe0508e3          	beqz	a0,80003f50 <_Z20Threads_CPP_API_testv+0x164>
    80003f64:	00053783          	ld	a5,0(a0)
    80003f68:	0087b783          	ld	a5,8(a5)
    80003f6c:	000780e7          	jalr	a5
    80003f70:	fe1ff06f          	j	80003f50 <_Z20Threads_CPP_API_testv+0x164>
    80003f74:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003f78:	00048513          	mv	a0,s1
    80003f7c:	fffff097          	auipc	ra,0xfffff
    80003f80:	914080e7          	jalr	-1772(ra) # 80002890 <_ZdlPv>
    80003f84:	00090513          	mv	a0,s2
    80003f88:	0000a097          	auipc	ra,0xa
    80003f8c:	3f0080e7          	jalr	1008(ra) # 8000e378 <_Unwind_Resume>
    80003f90:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003f94:	00048513          	mv	a0,s1
    80003f98:	fffff097          	auipc	ra,0xfffff
    80003f9c:	8f8080e7          	jalr	-1800(ra) # 80002890 <_ZdlPv>
    80003fa0:	00090513          	mv	a0,s2
    80003fa4:	0000a097          	auipc	ra,0xa
    80003fa8:	3d4080e7          	jalr	980(ra) # 8000e378 <_Unwind_Resume>
    80003fac:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80003fb0:	00048513          	mv	a0,s1
    80003fb4:	fffff097          	auipc	ra,0xfffff
    80003fb8:	8dc080e7          	jalr	-1828(ra) # 80002890 <_ZdlPv>
    80003fbc:	00090513          	mv	a0,s2
    80003fc0:	0000a097          	auipc	ra,0xa
    80003fc4:	3b8080e7          	jalr	952(ra) # 8000e378 <_Unwind_Resume>
    80003fc8:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80003fcc:	00048513          	mv	a0,s1
    80003fd0:	fffff097          	auipc	ra,0xfffff
    80003fd4:	8c0080e7          	jalr	-1856(ra) # 80002890 <_ZdlPv>
    80003fd8:	00090513          	mv	a0,s2
    80003fdc:	0000a097          	auipc	ra,0xa
    80003fe0:	39c080e7          	jalr	924(ra) # 8000e378 <_Unwind_Resume>
	}
}
    80003fe4:	03813083          	ld	ra,56(sp)
    80003fe8:	03013403          	ld	s0,48(sp)
    80003fec:	02813483          	ld	s1,40(sp)
    80003ff0:	02013903          	ld	s2,32(sp)
    80003ff4:	04010113          	addi	sp,sp,64
    80003ff8:	00008067          	ret

0000000080003ffc <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80003ffc:	ff010113          	addi	sp,sp,-16
    80004000:	00113423          	sd	ra,8(sp)
    80004004:	00813023          	sd	s0,0(sp)
    80004008:	01010413          	addi	s0,sp,16
    8000400c:	00009797          	auipc	a5,0x9
    80004010:	e0478793          	addi	a5,a5,-508 # 8000ce10 <_ZTV7WorkerA+0x10>
    80004014:	00f53023          	sd	a5,0(a0)
    80004018:	ffffe097          	auipc	ra,0xffffe
    8000401c:	774080e7          	jalr	1908(ra) # 8000278c <_ZN6ThreadD1Ev>
    80004020:	00813083          	ld	ra,8(sp)
    80004024:	00013403          	ld	s0,0(sp)
    80004028:	01010113          	addi	sp,sp,16
    8000402c:	00008067          	ret

0000000080004030 <_ZN7WorkerAD0Ev>:
    80004030:	fe010113          	addi	sp,sp,-32
    80004034:	00113c23          	sd	ra,24(sp)
    80004038:	00813823          	sd	s0,16(sp)
    8000403c:	00913423          	sd	s1,8(sp)
    80004040:	02010413          	addi	s0,sp,32
    80004044:	00050493          	mv	s1,a0
    80004048:	00009797          	auipc	a5,0x9
    8000404c:	dc878793          	addi	a5,a5,-568 # 8000ce10 <_ZTV7WorkerA+0x10>
    80004050:	00f53023          	sd	a5,0(a0)
    80004054:	ffffe097          	auipc	ra,0xffffe
    80004058:	738080e7          	jalr	1848(ra) # 8000278c <_ZN6ThreadD1Ev>
    8000405c:	00048513          	mv	a0,s1
    80004060:	fffff097          	auipc	ra,0xfffff
    80004064:	830080e7          	jalr	-2000(ra) # 80002890 <_ZdlPv>
    80004068:	01813083          	ld	ra,24(sp)
    8000406c:	01013403          	ld	s0,16(sp)
    80004070:	00813483          	ld	s1,8(sp)
    80004074:	02010113          	addi	sp,sp,32
    80004078:	00008067          	ret

000000008000407c <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    8000407c:	ff010113          	addi	sp,sp,-16
    80004080:	00113423          	sd	ra,8(sp)
    80004084:	00813023          	sd	s0,0(sp)
    80004088:	01010413          	addi	s0,sp,16
    8000408c:	00009797          	auipc	a5,0x9
    80004090:	dac78793          	addi	a5,a5,-596 # 8000ce38 <_ZTV7WorkerB+0x10>
    80004094:	00f53023          	sd	a5,0(a0)
    80004098:	ffffe097          	auipc	ra,0xffffe
    8000409c:	6f4080e7          	jalr	1780(ra) # 8000278c <_ZN6ThreadD1Ev>
    800040a0:	00813083          	ld	ra,8(sp)
    800040a4:	00013403          	ld	s0,0(sp)
    800040a8:	01010113          	addi	sp,sp,16
    800040ac:	00008067          	ret

00000000800040b0 <_ZN7WorkerBD0Ev>:
    800040b0:	fe010113          	addi	sp,sp,-32
    800040b4:	00113c23          	sd	ra,24(sp)
    800040b8:	00813823          	sd	s0,16(sp)
    800040bc:	00913423          	sd	s1,8(sp)
    800040c0:	02010413          	addi	s0,sp,32
    800040c4:	00050493          	mv	s1,a0
    800040c8:	00009797          	auipc	a5,0x9
    800040cc:	d7078793          	addi	a5,a5,-656 # 8000ce38 <_ZTV7WorkerB+0x10>
    800040d0:	00f53023          	sd	a5,0(a0)
    800040d4:	ffffe097          	auipc	ra,0xffffe
    800040d8:	6b8080e7          	jalr	1720(ra) # 8000278c <_ZN6ThreadD1Ev>
    800040dc:	00048513          	mv	a0,s1
    800040e0:	ffffe097          	auipc	ra,0xffffe
    800040e4:	7b0080e7          	jalr	1968(ra) # 80002890 <_ZdlPv>
    800040e8:	01813083          	ld	ra,24(sp)
    800040ec:	01013403          	ld	s0,16(sp)
    800040f0:	00813483          	ld	s1,8(sp)
    800040f4:	02010113          	addi	sp,sp,32
    800040f8:	00008067          	ret

00000000800040fc <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800040fc:	ff010113          	addi	sp,sp,-16
    80004100:	00113423          	sd	ra,8(sp)
    80004104:	00813023          	sd	s0,0(sp)
    80004108:	01010413          	addi	s0,sp,16
    8000410c:	00009797          	auipc	a5,0x9
    80004110:	d5478793          	addi	a5,a5,-684 # 8000ce60 <_ZTV7WorkerC+0x10>
    80004114:	00f53023          	sd	a5,0(a0)
    80004118:	ffffe097          	auipc	ra,0xffffe
    8000411c:	674080e7          	jalr	1652(ra) # 8000278c <_ZN6ThreadD1Ev>
    80004120:	00813083          	ld	ra,8(sp)
    80004124:	00013403          	ld	s0,0(sp)
    80004128:	01010113          	addi	sp,sp,16
    8000412c:	00008067          	ret

0000000080004130 <_ZN7WorkerCD0Ev>:
    80004130:	fe010113          	addi	sp,sp,-32
    80004134:	00113c23          	sd	ra,24(sp)
    80004138:	00813823          	sd	s0,16(sp)
    8000413c:	00913423          	sd	s1,8(sp)
    80004140:	02010413          	addi	s0,sp,32
    80004144:	00050493          	mv	s1,a0
    80004148:	00009797          	auipc	a5,0x9
    8000414c:	d1878793          	addi	a5,a5,-744 # 8000ce60 <_ZTV7WorkerC+0x10>
    80004150:	00f53023          	sd	a5,0(a0)
    80004154:	ffffe097          	auipc	ra,0xffffe
    80004158:	638080e7          	jalr	1592(ra) # 8000278c <_ZN6ThreadD1Ev>
    8000415c:	00048513          	mv	a0,s1
    80004160:	ffffe097          	auipc	ra,0xffffe
    80004164:	730080e7          	jalr	1840(ra) # 80002890 <_ZdlPv>
    80004168:	01813083          	ld	ra,24(sp)
    8000416c:	01013403          	ld	s0,16(sp)
    80004170:	00813483          	ld	s1,8(sp)
    80004174:	02010113          	addi	sp,sp,32
    80004178:	00008067          	ret

000000008000417c <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    8000417c:	ff010113          	addi	sp,sp,-16
    80004180:	00113423          	sd	ra,8(sp)
    80004184:	00813023          	sd	s0,0(sp)
    80004188:	01010413          	addi	s0,sp,16
    8000418c:	00009797          	auipc	a5,0x9
    80004190:	cfc78793          	addi	a5,a5,-772 # 8000ce88 <_ZTV7WorkerD+0x10>
    80004194:	00f53023          	sd	a5,0(a0)
    80004198:	ffffe097          	auipc	ra,0xffffe
    8000419c:	5f4080e7          	jalr	1524(ra) # 8000278c <_ZN6ThreadD1Ev>
    800041a0:	00813083          	ld	ra,8(sp)
    800041a4:	00013403          	ld	s0,0(sp)
    800041a8:	01010113          	addi	sp,sp,16
    800041ac:	00008067          	ret

00000000800041b0 <_ZN7WorkerDD0Ev>:
    800041b0:	fe010113          	addi	sp,sp,-32
    800041b4:	00113c23          	sd	ra,24(sp)
    800041b8:	00813823          	sd	s0,16(sp)
    800041bc:	00913423          	sd	s1,8(sp)
    800041c0:	02010413          	addi	s0,sp,32
    800041c4:	00050493          	mv	s1,a0
    800041c8:	00009797          	auipc	a5,0x9
    800041cc:	cc078793          	addi	a5,a5,-832 # 8000ce88 <_ZTV7WorkerD+0x10>
    800041d0:	00f53023          	sd	a5,0(a0)
    800041d4:	ffffe097          	auipc	ra,0xffffe
    800041d8:	5b8080e7          	jalr	1464(ra) # 8000278c <_ZN6ThreadD1Ev>
    800041dc:	00048513          	mv	a0,s1
    800041e0:	ffffe097          	auipc	ra,0xffffe
    800041e4:	6b0080e7          	jalr	1712(ra) # 80002890 <_ZdlPv>
    800041e8:	01813083          	ld	ra,24(sp)
    800041ec:	01013403          	ld	s0,16(sp)
    800041f0:	00813483          	ld	s1,8(sp)
    800041f4:	02010113          	addi	sp,sp,32
    800041f8:	00008067          	ret

00000000800041fc <_ZN7WorkerA3runEv>:
    void run() override {
    800041fc:	ff010113          	addi	sp,sp,-16
    80004200:	00113423          	sd	ra,8(sp)
    80004204:	00813023          	sd	s0,0(sp)
    80004208:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    8000420c:	00000593          	li	a1,0
    80004210:	fffff097          	auipc	ra,0xfffff
    80004214:	774080e7          	jalr	1908(ra) # 80003984 <_ZN7WorkerA11workerBodyAEPv>
    }
    80004218:	00813083          	ld	ra,8(sp)
    8000421c:	00013403          	ld	s0,0(sp)
    80004220:	01010113          	addi	sp,sp,16
    80004224:	00008067          	ret

0000000080004228 <_ZN7WorkerB3runEv>:
    void run() override {
    80004228:	ff010113          	addi	sp,sp,-16
    8000422c:	00113423          	sd	ra,8(sp)
    80004230:	00813023          	sd	s0,0(sp)
    80004234:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004238:	00000593          	li	a1,0
    8000423c:	00000097          	auipc	ra,0x0
    80004240:	814080e7          	jalr	-2028(ra) # 80003a50 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004244:	00813083          	ld	ra,8(sp)
    80004248:	00013403          	ld	s0,0(sp)
    8000424c:	01010113          	addi	sp,sp,16
    80004250:	00008067          	ret

0000000080004254 <_ZN7WorkerC3runEv>:
    void run() override {
    80004254:	ff010113          	addi	sp,sp,-16
    80004258:	00113423          	sd	ra,8(sp)
    8000425c:	00813023          	sd	s0,0(sp)
    80004260:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004264:	00000593          	li	a1,0
    80004268:	00000097          	auipc	ra,0x0
    8000426c:	8bc080e7          	jalr	-1860(ra) # 80003b24 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004270:	00813083          	ld	ra,8(sp)
    80004274:	00013403          	ld	s0,0(sp)
    80004278:	01010113          	addi	sp,sp,16
    8000427c:	00008067          	ret

0000000080004280 <_ZN7WorkerD3runEv>:
    void run() override {
    80004280:	ff010113          	addi	sp,sp,-16
    80004284:	00113423          	sd	ra,8(sp)
    80004288:	00813023          	sd	s0,0(sp)
    8000428c:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004290:	00000593          	li	a1,0
    80004294:	00000097          	auipc	ra,0x0
    80004298:	a10080e7          	jalr	-1520(ra) # 80003ca4 <_ZN7WorkerD11workerBodyDEPv>
    }
    8000429c:	00813083          	ld	ra,8(sp)
    800042a0:	00013403          	ld	s0,0(sp)
    800042a4:	01010113          	addi	sp,sp,16
    800042a8:	00008067          	ret

00000000800042ac <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800042ac:	f8010113          	addi	sp,sp,-128
    800042b0:	06113c23          	sd	ra,120(sp)
    800042b4:	06813823          	sd	s0,112(sp)
    800042b8:	06913423          	sd	s1,104(sp)
    800042bc:	07213023          	sd	s2,96(sp)
    800042c0:	05313c23          	sd	s3,88(sp)
    800042c4:	05413823          	sd	s4,80(sp)
    800042c8:	05513423          	sd	s5,72(sp)
    800042cc:	05613023          	sd	s6,64(sp)
    800042d0:	03713c23          	sd	s7,56(sp)
    800042d4:	03813823          	sd	s8,48(sp)
    800042d8:	03913423          	sd	s9,40(sp)
    800042dc:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800042e0:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800042e4:	00006517          	auipc	a0,0x6
    800042e8:	f4450513          	addi	a0,a0,-188 # 8000a228 <CONSOLE_STATUS+0x218>
    800042ec:	00001097          	auipc	ra,0x1
    800042f0:	5a8080e7          	jalr	1448(ra) # 80005894 <_Z11printStringPKc>
    getString(input, 30);
    800042f4:	01e00593          	li	a1,30
    800042f8:	f8040493          	addi	s1,s0,-128
    800042fc:	00048513          	mv	a0,s1
    80004300:	00001097          	auipc	ra,0x1
    80004304:	61c080e7          	jalr	1564(ra) # 8000591c <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004308:	00048513          	mv	a0,s1
    8000430c:	00001097          	auipc	ra,0x1
    80004310:	6e8080e7          	jalr	1768(ra) # 800059f4 <_Z11stringToIntPKc>
    80004314:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004318:	00006517          	auipc	a0,0x6
    8000431c:	f3050513          	addi	a0,a0,-208 # 8000a248 <CONSOLE_STATUS+0x238>
    80004320:	00001097          	auipc	ra,0x1
    80004324:	574080e7          	jalr	1396(ra) # 80005894 <_Z11printStringPKc>
    getString(input, 30);
    80004328:	01e00593          	li	a1,30
    8000432c:	00048513          	mv	a0,s1
    80004330:	00001097          	auipc	ra,0x1
    80004334:	5ec080e7          	jalr	1516(ra) # 8000591c <_Z9getStringPci>
    n = stringToInt(input);
    80004338:	00048513          	mv	a0,s1
    8000433c:	00001097          	auipc	ra,0x1
    80004340:	6b8080e7          	jalr	1720(ra) # 800059f4 <_Z11stringToIntPKc>
    80004344:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004348:	00006517          	auipc	a0,0x6
    8000434c:	f2050513          	addi	a0,a0,-224 # 8000a268 <CONSOLE_STATUS+0x258>
    80004350:	00001097          	auipc	ra,0x1
    80004354:	544080e7          	jalr	1348(ra) # 80005894 <_Z11printStringPKc>
    printInt(threadNum);
    80004358:	00000613          	li	a2,0
    8000435c:	00a00593          	li	a1,10
    80004360:	00098513          	mv	a0,s3
    80004364:	00001097          	auipc	ra,0x1
    80004368:	6e0080e7          	jalr	1760(ra) # 80005a44 <_Z8printIntiii>
    printString(" i velicina bafera ");
    8000436c:	00006517          	auipc	a0,0x6
    80004370:	f1450513          	addi	a0,a0,-236 # 8000a280 <CONSOLE_STATUS+0x270>
    80004374:	00001097          	auipc	ra,0x1
    80004378:	520080e7          	jalr	1312(ra) # 80005894 <_Z11printStringPKc>
    printInt(n);
    8000437c:	00000613          	li	a2,0
    80004380:	00a00593          	li	a1,10
    80004384:	00048513          	mv	a0,s1
    80004388:	00001097          	auipc	ra,0x1
    8000438c:	6bc080e7          	jalr	1724(ra) # 80005a44 <_Z8printIntiii>
    printString(".\n");
    80004390:	00006517          	auipc	a0,0x6
    80004394:	f0850513          	addi	a0,a0,-248 # 8000a298 <CONSOLE_STATUS+0x288>
    80004398:	00001097          	auipc	ra,0x1
    8000439c:	4fc080e7          	jalr	1276(ra) # 80005894 <_Z11printStringPKc>
    if (threadNum > n) {
    800043a0:	0334c463          	blt	s1,s3,800043c8 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800043a4:	03305c63          	blez	s3,800043dc <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800043a8:	03800513          	li	a0,56
    800043ac:	ffffe097          	auipc	ra,0xffffe
    800043b0:	494080e7          	jalr	1172(ra) # 80002840 <_Znwm>
    800043b4:	00050a93          	mv	s5,a0
    800043b8:	00048593          	mv	a1,s1
    800043bc:	00001097          	auipc	ra,0x1
    800043c0:	7a8080e7          	jalr	1960(ra) # 80005b64 <_ZN9BufferCPPC1Ei>
    800043c4:	0300006f          	j	800043f4 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800043c8:	00006517          	auipc	a0,0x6
    800043cc:	ed850513          	addi	a0,a0,-296 # 8000a2a0 <CONSOLE_STATUS+0x290>
    800043d0:	00001097          	auipc	ra,0x1
    800043d4:	4c4080e7          	jalr	1220(ra) # 80005894 <_Z11printStringPKc>
        return;
    800043d8:	0140006f          	j	800043ec <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800043dc:	00006517          	auipc	a0,0x6
    800043e0:	f0450513          	addi	a0,a0,-252 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800043e4:	00001097          	auipc	ra,0x1
    800043e8:	4b0080e7          	jalr	1200(ra) # 80005894 <_Z11printStringPKc>
        return;
    800043ec:	000c0113          	mv	sp,s8
    800043f0:	2140006f          	j	80004604 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    800043f4:	01000513          	li	a0,16
    800043f8:	ffffe097          	auipc	ra,0xffffe
    800043fc:	448080e7          	jalr	1096(ra) # 80002840 <_Znwm>
    80004400:	00050913          	mv	s2,a0
    80004404:	00000593          	li	a1,0
    80004408:	ffffe097          	auipc	ra,0xffffe
    8000440c:	7a4080e7          	jalr	1956(ra) # 80002bac <_ZN9SemaphoreC1Ej>
    80004410:	00009797          	auipc	a5,0x9
    80004414:	e527b023          	sd	s2,-448(a5) # 8000d250 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004418:	00399793          	slli	a5,s3,0x3
    8000441c:	00f78793          	addi	a5,a5,15
    80004420:	ff07f793          	andi	a5,a5,-16
    80004424:	40f10133          	sub	sp,sp,a5
    80004428:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    8000442c:	0019871b          	addiw	a4,s3,1
    80004430:	00171793          	slli	a5,a4,0x1
    80004434:	00e787b3          	add	a5,a5,a4
    80004438:	00379793          	slli	a5,a5,0x3
    8000443c:	00f78793          	addi	a5,a5,15
    80004440:	ff07f793          	andi	a5,a5,-16
    80004444:	40f10133          	sub	sp,sp,a5
    80004448:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    8000444c:	00199493          	slli	s1,s3,0x1
    80004450:	013484b3          	add	s1,s1,s3
    80004454:	00349493          	slli	s1,s1,0x3
    80004458:	009b04b3          	add	s1,s6,s1
    8000445c:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004460:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004464:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004468:	02800513          	li	a0,40
    8000446c:	ffffe097          	auipc	ra,0xffffe
    80004470:	3d4080e7          	jalr	980(ra) # 80002840 <_Znwm>
    80004474:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004478:	ffffe097          	auipc	ra,0xffffe
    8000447c:	6b8080e7          	jalr	1720(ra) # 80002b30 <_ZN6ThreadC1Ev>
    80004480:	00009797          	auipc	a5,0x9
    80004484:	a8078793          	addi	a5,a5,-1408 # 8000cf00 <_ZTV8Consumer+0x10>
    80004488:	00fbb023          	sd	a5,0(s7)
    8000448c:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004490:	000b8513          	mv	a0,s7
    80004494:	ffffe097          	auipc	ra,0xffffe
    80004498:	564080e7          	jalr	1380(ra) # 800029f8 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    8000449c:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800044a0:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800044a4:	00009797          	auipc	a5,0x9
    800044a8:	dac7b783          	ld	a5,-596(a5) # 8000d250 <_ZL10waitForAll>
    800044ac:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800044b0:	02800513          	li	a0,40
    800044b4:	ffffe097          	auipc	ra,0xffffe
    800044b8:	38c080e7          	jalr	908(ra) # 80002840 <_Znwm>
    800044bc:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800044c0:	ffffe097          	auipc	ra,0xffffe
    800044c4:	670080e7          	jalr	1648(ra) # 80002b30 <_ZN6ThreadC1Ev>
    800044c8:	00009797          	auipc	a5,0x9
    800044cc:	9e878793          	addi	a5,a5,-1560 # 8000ceb0 <_ZTV16ProducerKeyborad+0x10>
    800044d0:	00f4b023          	sd	a5,0(s1)
    800044d4:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800044d8:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800044dc:	00048513          	mv	a0,s1
    800044e0:	ffffe097          	auipc	ra,0xffffe
    800044e4:	518080e7          	jalr	1304(ra) # 800029f8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800044e8:	00100913          	li	s2,1
    800044ec:	0300006f          	j	8000451c <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800044f0:	00009797          	auipc	a5,0x9
    800044f4:	9e878793          	addi	a5,a5,-1560 # 8000ced8 <_ZTV8Producer+0x10>
    800044f8:	00fcb023          	sd	a5,0(s9)
    800044fc:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004500:	00391793          	slli	a5,s2,0x3
    80004504:	00fa07b3          	add	a5,s4,a5
    80004508:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    8000450c:	000c8513          	mv	a0,s9
    80004510:	ffffe097          	auipc	ra,0xffffe
    80004514:	4e8080e7          	jalr	1256(ra) # 800029f8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004518:	0019091b          	addiw	s2,s2,1
    8000451c:	05395263          	bge	s2,s3,80004560 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004520:	00191493          	slli	s1,s2,0x1
    80004524:	012484b3          	add	s1,s1,s2
    80004528:	00349493          	slli	s1,s1,0x3
    8000452c:	009b04b3          	add	s1,s6,s1
    80004530:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004534:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004538:	00009797          	auipc	a5,0x9
    8000453c:	d187b783          	ld	a5,-744(a5) # 8000d250 <_ZL10waitForAll>
    80004540:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004544:	02800513          	li	a0,40
    80004548:	ffffe097          	auipc	ra,0xffffe
    8000454c:	2f8080e7          	jalr	760(ra) # 80002840 <_Znwm>
    80004550:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004554:	ffffe097          	auipc	ra,0xffffe
    80004558:	5dc080e7          	jalr	1500(ra) # 80002b30 <_ZN6ThreadC1Ev>
    8000455c:	f95ff06f          	j	800044f0 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004560:	ffffe097          	auipc	ra,0xffffe
    80004564:	514080e7          	jalr	1300(ra) # 80002a74 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004568:	00000493          	li	s1,0
    8000456c:	0099ce63          	blt	s3,s1,80004588 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004570:	00009517          	auipc	a0,0x9
    80004574:	ce053503          	ld	a0,-800(a0) # 8000d250 <_ZL10waitForAll>
    80004578:	ffffe097          	auipc	ra,0xffffe
    8000457c:	66c080e7          	jalr	1644(ra) # 80002be4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004580:	0014849b          	addiw	s1,s1,1
    80004584:	fe9ff06f          	j	8000456c <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004588:	00009517          	auipc	a0,0x9
    8000458c:	cc853503          	ld	a0,-824(a0) # 8000d250 <_ZL10waitForAll>
    80004590:	00050863          	beqz	a0,800045a0 <_Z20testConsumerProducerv+0x2f4>
    80004594:	00053783          	ld	a5,0(a0)
    80004598:	0087b783          	ld	a5,8(a5)
    8000459c:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800045a0:	00000493          	li	s1,0
    800045a4:	0080006f          	j	800045ac <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800045a8:	0014849b          	addiw	s1,s1,1
    800045ac:	0334d263          	bge	s1,s3,800045d0 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800045b0:	00349793          	slli	a5,s1,0x3
    800045b4:	00fa07b3          	add	a5,s4,a5
    800045b8:	0007b503          	ld	a0,0(a5)
    800045bc:	fe0506e3          	beqz	a0,800045a8 <_Z20testConsumerProducerv+0x2fc>
    800045c0:	00053783          	ld	a5,0(a0)
    800045c4:	0087b783          	ld	a5,8(a5)
    800045c8:	000780e7          	jalr	a5
    800045cc:	fddff06f          	j	800045a8 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    800045d0:	000b8a63          	beqz	s7,800045e4 <_Z20testConsumerProducerv+0x338>
    800045d4:	000bb783          	ld	a5,0(s7)
    800045d8:	0087b783          	ld	a5,8(a5)
    800045dc:	000b8513          	mv	a0,s7
    800045e0:	000780e7          	jalr	a5
    delete buffer;
    800045e4:	000a8e63          	beqz	s5,80004600 <_Z20testConsumerProducerv+0x354>
    800045e8:	000a8513          	mv	a0,s5
    800045ec:	00002097          	auipc	ra,0x2
    800045f0:	870080e7          	jalr	-1936(ra) # 80005e5c <_ZN9BufferCPPD1Ev>
    800045f4:	000a8513          	mv	a0,s5
    800045f8:	ffffe097          	auipc	ra,0xffffe
    800045fc:	298080e7          	jalr	664(ra) # 80002890 <_ZdlPv>
    80004600:	000c0113          	mv	sp,s8
}
    80004604:	f8040113          	addi	sp,s0,-128
    80004608:	07813083          	ld	ra,120(sp)
    8000460c:	07013403          	ld	s0,112(sp)
    80004610:	06813483          	ld	s1,104(sp)
    80004614:	06013903          	ld	s2,96(sp)
    80004618:	05813983          	ld	s3,88(sp)
    8000461c:	05013a03          	ld	s4,80(sp)
    80004620:	04813a83          	ld	s5,72(sp)
    80004624:	04013b03          	ld	s6,64(sp)
    80004628:	03813b83          	ld	s7,56(sp)
    8000462c:	03013c03          	ld	s8,48(sp)
    80004630:	02813c83          	ld	s9,40(sp)
    80004634:	08010113          	addi	sp,sp,128
    80004638:	00008067          	ret
    8000463c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004640:	000a8513          	mv	a0,s5
    80004644:	ffffe097          	auipc	ra,0xffffe
    80004648:	24c080e7          	jalr	588(ra) # 80002890 <_ZdlPv>
    8000464c:	00048513          	mv	a0,s1
    80004650:	0000a097          	auipc	ra,0xa
    80004654:	d28080e7          	jalr	-728(ra) # 8000e378 <_Unwind_Resume>
    80004658:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    8000465c:	00090513          	mv	a0,s2
    80004660:	ffffe097          	auipc	ra,0xffffe
    80004664:	230080e7          	jalr	560(ra) # 80002890 <_ZdlPv>
    80004668:	00048513          	mv	a0,s1
    8000466c:	0000a097          	auipc	ra,0xa
    80004670:	d0c080e7          	jalr	-756(ra) # 8000e378 <_Unwind_Resume>
    80004674:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004678:	000b8513          	mv	a0,s7
    8000467c:	ffffe097          	auipc	ra,0xffffe
    80004680:	214080e7          	jalr	532(ra) # 80002890 <_ZdlPv>
    80004684:	00048513          	mv	a0,s1
    80004688:	0000a097          	auipc	ra,0xa
    8000468c:	cf0080e7          	jalr	-784(ra) # 8000e378 <_Unwind_Resume>
    80004690:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004694:	00048513          	mv	a0,s1
    80004698:	ffffe097          	auipc	ra,0xffffe
    8000469c:	1f8080e7          	jalr	504(ra) # 80002890 <_ZdlPv>
    800046a0:	00090513          	mv	a0,s2
    800046a4:	0000a097          	auipc	ra,0xa
    800046a8:	cd4080e7          	jalr	-812(ra) # 8000e378 <_Unwind_Resume>
    800046ac:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800046b0:	000c8513          	mv	a0,s9
    800046b4:	ffffe097          	auipc	ra,0xffffe
    800046b8:	1dc080e7          	jalr	476(ra) # 80002890 <_ZdlPv>
    800046bc:	00048513          	mv	a0,s1
    800046c0:	0000a097          	auipc	ra,0xa
    800046c4:	cb8080e7          	jalr	-840(ra) # 8000e378 <_Unwind_Resume>

00000000800046c8 <_ZN8Consumer3runEv>:
    void run() override {
    800046c8:	fd010113          	addi	sp,sp,-48
    800046cc:	02113423          	sd	ra,40(sp)
    800046d0:	02813023          	sd	s0,32(sp)
    800046d4:	00913c23          	sd	s1,24(sp)
    800046d8:	01213823          	sd	s2,16(sp)
    800046dc:	01313423          	sd	s3,8(sp)
    800046e0:	03010413          	addi	s0,sp,48
    800046e4:	00050913          	mv	s2,a0
        int i = 0;
    800046e8:	00000993          	li	s3,0
    800046ec:	0100006f          	j	800046fc <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800046f0:	00a00513          	li	a0,10
    800046f4:	ffffe097          	auipc	ra,0xffffe
    800046f8:	5f0080e7          	jalr	1520(ra) # 80002ce4 <_ZN7Console4putcEc>
        while (!threadEnd) {
    800046fc:	00009797          	auipc	a5,0x9
    80004700:	b4c7a783          	lw	a5,-1204(a5) # 8000d248 <_ZL9threadEnd>
    80004704:	04079a63          	bnez	a5,80004758 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004708:	02093783          	ld	a5,32(s2)
    8000470c:	0087b503          	ld	a0,8(a5)
    80004710:	00001097          	auipc	ra,0x1
    80004714:	638080e7          	jalr	1592(ra) # 80005d48 <_ZN9BufferCPP3getEv>
            i++;
    80004718:	0019849b          	addiw	s1,s3,1
    8000471c:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004720:	0ff57513          	andi	a0,a0,255
    80004724:	ffffe097          	auipc	ra,0xffffe
    80004728:	5c0080e7          	jalr	1472(ra) # 80002ce4 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    8000472c:	05000793          	li	a5,80
    80004730:	02f4e4bb          	remw	s1,s1,a5
    80004734:	fc0494e3          	bnez	s1,800046fc <_ZN8Consumer3runEv+0x34>
    80004738:	fb9ff06f          	j	800046f0 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    8000473c:	02093783          	ld	a5,32(s2)
    80004740:	0087b503          	ld	a0,8(a5)
    80004744:	00001097          	auipc	ra,0x1
    80004748:	604080e7          	jalr	1540(ra) # 80005d48 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    8000474c:	0ff57513          	andi	a0,a0,255
    80004750:	ffffe097          	auipc	ra,0xffffe
    80004754:	594080e7          	jalr	1428(ra) # 80002ce4 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004758:	02093783          	ld	a5,32(s2)
    8000475c:	0087b503          	ld	a0,8(a5)
    80004760:	00001097          	auipc	ra,0x1
    80004764:	674080e7          	jalr	1652(ra) # 80005dd4 <_ZN9BufferCPP6getCntEv>
    80004768:	fca04ae3          	bgtz	a0,8000473c <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    8000476c:	02093783          	ld	a5,32(s2)
    80004770:	0107b503          	ld	a0,16(a5)
    80004774:	ffffe097          	auipc	ra,0xffffe
    80004778:	49c080e7          	jalr	1180(ra) # 80002c10 <_ZN9Semaphore6signalEv>
    }
    8000477c:	02813083          	ld	ra,40(sp)
    80004780:	02013403          	ld	s0,32(sp)
    80004784:	01813483          	ld	s1,24(sp)
    80004788:	01013903          	ld	s2,16(sp)
    8000478c:	00813983          	ld	s3,8(sp)
    80004790:	03010113          	addi	sp,sp,48
    80004794:	00008067          	ret

0000000080004798 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004798:	ff010113          	addi	sp,sp,-16
    8000479c:	00113423          	sd	ra,8(sp)
    800047a0:	00813023          	sd	s0,0(sp)
    800047a4:	01010413          	addi	s0,sp,16
    800047a8:	00008797          	auipc	a5,0x8
    800047ac:	75878793          	addi	a5,a5,1880 # 8000cf00 <_ZTV8Consumer+0x10>
    800047b0:	00f53023          	sd	a5,0(a0)
    800047b4:	ffffe097          	auipc	ra,0xffffe
    800047b8:	fd8080e7          	jalr	-40(ra) # 8000278c <_ZN6ThreadD1Ev>
    800047bc:	00813083          	ld	ra,8(sp)
    800047c0:	00013403          	ld	s0,0(sp)
    800047c4:	01010113          	addi	sp,sp,16
    800047c8:	00008067          	ret

00000000800047cc <_ZN8ConsumerD0Ev>:
    800047cc:	fe010113          	addi	sp,sp,-32
    800047d0:	00113c23          	sd	ra,24(sp)
    800047d4:	00813823          	sd	s0,16(sp)
    800047d8:	00913423          	sd	s1,8(sp)
    800047dc:	02010413          	addi	s0,sp,32
    800047e0:	00050493          	mv	s1,a0
    800047e4:	00008797          	auipc	a5,0x8
    800047e8:	71c78793          	addi	a5,a5,1820 # 8000cf00 <_ZTV8Consumer+0x10>
    800047ec:	00f53023          	sd	a5,0(a0)
    800047f0:	ffffe097          	auipc	ra,0xffffe
    800047f4:	f9c080e7          	jalr	-100(ra) # 8000278c <_ZN6ThreadD1Ev>
    800047f8:	00048513          	mv	a0,s1
    800047fc:	ffffe097          	auipc	ra,0xffffe
    80004800:	094080e7          	jalr	148(ra) # 80002890 <_ZdlPv>
    80004804:	01813083          	ld	ra,24(sp)
    80004808:	01013403          	ld	s0,16(sp)
    8000480c:	00813483          	ld	s1,8(sp)
    80004810:	02010113          	addi	sp,sp,32
    80004814:	00008067          	ret

0000000080004818 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004818:	ff010113          	addi	sp,sp,-16
    8000481c:	00113423          	sd	ra,8(sp)
    80004820:	00813023          	sd	s0,0(sp)
    80004824:	01010413          	addi	s0,sp,16
    80004828:	00008797          	auipc	a5,0x8
    8000482c:	68878793          	addi	a5,a5,1672 # 8000ceb0 <_ZTV16ProducerKeyborad+0x10>
    80004830:	00f53023          	sd	a5,0(a0)
    80004834:	ffffe097          	auipc	ra,0xffffe
    80004838:	f58080e7          	jalr	-168(ra) # 8000278c <_ZN6ThreadD1Ev>
    8000483c:	00813083          	ld	ra,8(sp)
    80004840:	00013403          	ld	s0,0(sp)
    80004844:	01010113          	addi	sp,sp,16
    80004848:	00008067          	ret

000000008000484c <_ZN16ProducerKeyboradD0Ev>:
    8000484c:	fe010113          	addi	sp,sp,-32
    80004850:	00113c23          	sd	ra,24(sp)
    80004854:	00813823          	sd	s0,16(sp)
    80004858:	00913423          	sd	s1,8(sp)
    8000485c:	02010413          	addi	s0,sp,32
    80004860:	00050493          	mv	s1,a0
    80004864:	00008797          	auipc	a5,0x8
    80004868:	64c78793          	addi	a5,a5,1612 # 8000ceb0 <_ZTV16ProducerKeyborad+0x10>
    8000486c:	00f53023          	sd	a5,0(a0)
    80004870:	ffffe097          	auipc	ra,0xffffe
    80004874:	f1c080e7          	jalr	-228(ra) # 8000278c <_ZN6ThreadD1Ev>
    80004878:	00048513          	mv	a0,s1
    8000487c:	ffffe097          	auipc	ra,0xffffe
    80004880:	014080e7          	jalr	20(ra) # 80002890 <_ZdlPv>
    80004884:	01813083          	ld	ra,24(sp)
    80004888:	01013403          	ld	s0,16(sp)
    8000488c:	00813483          	ld	s1,8(sp)
    80004890:	02010113          	addi	sp,sp,32
    80004894:	00008067          	ret

0000000080004898 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004898:	ff010113          	addi	sp,sp,-16
    8000489c:	00113423          	sd	ra,8(sp)
    800048a0:	00813023          	sd	s0,0(sp)
    800048a4:	01010413          	addi	s0,sp,16
    800048a8:	00008797          	auipc	a5,0x8
    800048ac:	63078793          	addi	a5,a5,1584 # 8000ced8 <_ZTV8Producer+0x10>
    800048b0:	00f53023          	sd	a5,0(a0)
    800048b4:	ffffe097          	auipc	ra,0xffffe
    800048b8:	ed8080e7          	jalr	-296(ra) # 8000278c <_ZN6ThreadD1Ev>
    800048bc:	00813083          	ld	ra,8(sp)
    800048c0:	00013403          	ld	s0,0(sp)
    800048c4:	01010113          	addi	sp,sp,16
    800048c8:	00008067          	ret

00000000800048cc <_ZN8ProducerD0Ev>:
    800048cc:	fe010113          	addi	sp,sp,-32
    800048d0:	00113c23          	sd	ra,24(sp)
    800048d4:	00813823          	sd	s0,16(sp)
    800048d8:	00913423          	sd	s1,8(sp)
    800048dc:	02010413          	addi	s0,sp,32
    800048e0:	00050493          	mv	s1,a0
    800048e4:	00008797          	auipc	a5,0x8
    800048e8:	5f478793          	addi	a5,a5,1524 # 8000ced8 <_ZTV8Producer+0x10>
    800048ec:	00f53023          	sd	a5,0(a0)
    800048f0:	ffffe097          	auipc	ra,0xffffe
    800048f4:	e9c080e7          	jalr	-356(ra) # 8000278c <_ZN6ThreadD1Ev>
    800048f8:	00048513          	mv	a0,s1
    800048fc:	ffffe097          	auipc	ra,0xffffe
    80004900:	f94080e7          	jalr	-108(ra) # 80002890 <_ZdlPv>
    80004904:	01813083          	ld	ra,24(sp)
    80004908:	01013403          	ld	s0,16(sp)
    8000490c:	00813483          	ld	s1,8(sp)
    80004910:	02010113          	addi	sp,sp,32
    80004914:	00008067          	ret

0000000080004918 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004918:	fe010113          	addi	sp,sp,-32
    8000491c:	00113c23          	sd	ra,24(sp)
    80004920:	00813823          	sd	s0,16(sp)
    80004924:	00913423          	sd	s1,8(sp)
    80004928:	02010413          	addi	s0,sp,32
    8000492c:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004930:	ffffd097          	auipc	ra,0xffffd
    80004934:	cd0080e7          	jalr	-816(ra) # 80001600 <_Z4getcv>
    80004938:	0005059b          	sext.w	a1,a0
    8000493c:	01b00793          	li	a5,27
    80004940:	00f58c63          	beq	a1,a5,80004958 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004944:	0204b783          	ld	a5,32(s1)
    80004948:	0087b503          	ld	a0,8(a5)
    8000494c:	00001097          	auipc	ra,0x1
    80004950:	36c080e7          	jalr	876(ra) # 80005cb8 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004954:	fddff06f          	j	80004930 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004958:	00100793          	li	a5,1
    8000495c:	00009717          	auipc	a4,0x9
    80004960:	8ef72623          	sw	a5,-1812(a4) # 8000d248 <_ZL9threadEnd>
        td->buffer->put('!');
    80004964:	0204b783          	ld	a5,32(s1)
    80004968:	02100593          	li	a1,33
    8000496c:	0087b503          	ld	a0,8(a5)
    80004970:	00001097          	auipc	ra,0x1
    80004974:	348080e7          	jalr	840(ra) # 80005cb8 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004978:	0204b783          	ld	a5,32(s1)
    8000497c:	0107b503          	ld	a0,16(a5)
    80004980:	ffffe097          	auipc	ra,0xffffe
    80004984:	290080e7          	jalr	656(ra) # 80002c10 <_ZN9Semaphore6signalEv>
    }
    80004988:	01813083          	ld	ra,24(sp)
    8000498c:	01013403          	ld	s0,16(sp)
    80004990:	00813483          	ld	s1,8(sp)
    80004994:	02010113          	addi	sp,sp,32
    80004998:	00008067          	ret

000000008000499c <_ZN8Producer3runEv>:
    void run() override {
    8000499c:	fe010113          	addi	sp,sp,-32
    800049a0:	00113c23          	sd	ra,24(sp)
    800049a4:	00813823          	sd	s0,16(sp)
    800049a8:	00913423          	sd	s1,8(sp)
    800049ac:	01213023          	sd	s2,0(sp)
    800049b0:	02010413          	addi	s0,sp,32
    800049b4:	00050493          	mv	s1,a0
        int i = 0;
    800049b8:	00000913          	li	s2,0
        while (!threadEnd) {
    800049bc:	00009797          	auipc	a5,0x9
    800049c0:	88c7a783          	lw	a5,-1908(a5) # 8000d248 <_ZL9threadEnd>
    800049c4:	04079263          	bnez	a5,80004a08 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    800049c8:	0204b783          	ld	a5,32(s1)
    800049cc:	0007a583          	lw	a1,0(a5)
    800049d0:	0305859b          	addiw	a1,a1,48
    800049d4:	0087b503          	ld	a0,8(a5)
    800049d8:	00001097          	auipc	ra,0x1
    800049dc:	2e0080e7          	jalr	736(ra) # 80005cb8 <_ZN9BufferCPP3putEi>
            i++;
    800049e0:	0019071b          	addiw	a4,s2,1
    800049e4:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    800049e8:	0204b783          	ld	a5,32(s1)
    800049ec:	0007a783          	lw	a5,0(a5)
    800049f0:	00e787bb          	addw	a5,a5,a4
    800049f4:	00500513          	li	a0,5
    800049f8:	02a7e53b          	remw	a0,a5,a0
    800049fc:	ffffe097          	auipc	ra,0xffffe
    80004a00:	0a0080e7          	jalr	160(ra) # 80002a9c <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004a04:	fb9ff06f          	j	800049bc <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004a08:	0204b783          	ld	a5,32(s1)
    80004a0c:	0107b503          	ld	a0,16(a5)
    80004a10:	ffffe097          	auipc	ra,0xffffe
    80004a14:	200080e7          	jalr	512(ra) # 80002c10 <_ZN9Semaphore6signalEv>
    }
    80004a18:	01813083          	ld	ra,24(sp)
    80004a1c:	01013403          	ld	s0,16(sp)
    80004a20:	00813483          	ld	s1,8(sp)
    80004a24:	00013903          	ld	s2,0(sp)
    80004a28:	02010113          	addi	sp,sp,32
    80004a2c:	00008067          	ret

0000000080004a30 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004a30:	fe010113          	addi	sp,sp,-32
    80004a34:	00113c23          	sd	ra,24(sp)
    80004a38:	00813823          	sd	s0,16(sp)
    80004a3c:	00913423          	sd	s1,8(sp)
    80004a40:	01213023          	sd	s2,0(sp)
    80004a44:	02010413          	addi	s0,sp,32
    80004a48:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004a4c:	00100793          	li	a5,1
    80004a50:	02a7f863          	bgeu	a5,a0,80004a80 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004a54:	00a00793          	li	a5,10
    80004a58:	02f577b3          	remu	a5,a0,a5
    80004a5c:	02078e63          	beqz	a5,80004a98 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004a60:	fff48513          	addi	a0,s1,-1
    80004a64:	00000097          	auipc	ra,0x0
    80004a68:	fcc080e7          	jalr	-52(ra) # 80004a30 <_ZL9fibonaccim>
    80004a6c:	00050913          	mv	s2,a0
    80004a70:	ffe48513          	addi	a0,s1,-2
    80004a74:	00000097          	auipc	ra,0x0
    80004a78:	fbc080e7          	jalr	-68(ra) # 80004a30 <_ZL9fibonaccim>
    80004a7c:	00a90533          	add	a0,s2,a0
}
    80004a80:	01813083          	ld	ra,24(sp)
    80004a84:	01013403          	ld	s0,16(sp)
    80004a88:	00813483          	ld	s1,8(sp)
    80004a8c:	00013903          	ld	s2,0(sp)
    80004a90:	02010113          	addi	sp,sp,32
    80004a94:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004a98:	ffffd097          	auipc	ra,0xffffd
    80004a9c:	a28080e7          	jalr	-1496(ra) # 800014c0 <_Z15thread_dispatchv>
    80004aa0:	fc1ff06f          	j	80004a60 <_ZL9fibonaccim+0x30>

0000000080004aa4 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004aa4:	fe010113          	addi	sp,sp,-32
    80004aa8:	00113c23          	sd	ra,24(sp)
    80004aac:	00813823          	sd	s0,16(sp)
    80004ab0:	00913423          	sd	s1,8(sp)
    80004ab4:	01213023          	sd	s2,0(sp)
    80004ab8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004abc:	00a00493          	li	s1,10
    80004ac0:	0400006f          	j	80004b00 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004ac4:	00006517          	auipc	a0,0x6
    80004ac8:	8bc50513          	addi	a0,a0,-1860 # 8000a380 <CONSOLE_STATUS+0x370>
    80004acc:	00001097          	auipc	ra,0x1
    80004ad0:	dc8080e7          	jalr	-568(ra) # 80005894 <_Z11printStringPKc>
    80004ad4:	00000613          	li	a2,0
    80004ad8:	00a00593          	li	a1,10
    80004adc:	00048513          	mv	a0,s1
    80004ae0:	00001097          	auipc	ra,0x1
    80004ae4:	f64080e7          	jalr	-156(ra) # 80005a44 <_Z8printIntiii>
    80004ae8:	00006517          	auipc	a0,0x6
    80004aec:	a8850513          	addi	a0,a0,-1400 # 8000a570 <CONSOLE_STATUS+0x560>
    80004af0:	00001097          	auipc	ra,0x1
    80004af4:	da4080e7          	jalr	-604(ra) # 80005894 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004af8:	0014849b          	addiw	s1,s1,1
    80004afc:	0ff4f493          	andi	s1,s1,255
    80004b00:	00c00793          	li	a5,12
    80004b04:	fc97f0e3          	bgeu	a5,s1,80004ac4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004b08:	00006517          	auipc	a0,0x6
    80004b0c:	88050513          	addi	a0,a0,-1920 # 8000a388 <CONSOLE_STATUS+0x378>
    80004b10:	00001097          	auipc	ra,0x1
    80004b14:	d84080e7          	jalr	-636(ra) # 80005894 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004b18:	00500313          	li	t1,5
    thread_dispatch();
    80004b1c:	ffffd097          	auipc	ra,0xffffd
    80004b20:	9a4080e7          	jalr	-1628(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004b24:	01000513          	li	a0,16
    80004b28:	00000097          	auipc	ra,0x0
    80004b2c:	f08080e7          	jalr	-248(ra) # 80004a30 <_ZL9fibonaccim>
    80004b30:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004b34:	00006517          	auipc	a0,0x6
    80004b38:	86450513          	addi	a0,a0,-1948 # 8000a398 <CONSOLE_STATUS+0x388>
    80004b3c:	00001097          	auipc	ra,0x1
    80004b40:	d58080e7          	jalr	-680(ra) # 80005894 <_Z11printStringPKc>
    80004b44:	00000613          	li	a2,0
    80004b48:	00a00593          	li	a1,10
    80004b4c:	0009051b          	sext.w	a0,s2
    80004b50:	00001097          	auipc	ra,0x1
    80004b54:	ef4080e7          	jalr	-268(ra) # 80005a44 <_Z8printIntiii>
    80004b58:	00006517          	auipc	a0,0x6
    80004b5c:	a1850513          	addi	a0,a0,-1512 # 8000a570 <CONSOLE_STATUS+0x560>
    80004b60:	00001097          	auipc	ra,0x1
    80004b64:	d34080e7          	jalr	-716(ra) # 80005894 <_Z11printStringPKc>
    80004b68:	0400006f          	j	80004ba8 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004b6c:	00006517          	auipc	a0,0x6
    80004b70:	81450513          	addi	a0,a0,-2028 # 8000a380 <CONSOLE_STATUS+0x370>
    80004b74:	00001097          	auipc	ra,0x1
    80004b78:	d20080e7          	jalr	-736(ra) # 80005894 <_Z11printStringPKc>
    80004b7c:	00000613          	li	a2,0
    80004b80:	00a00593          	li	a1,10
    80004b84:	00048513          	mv	a0,s1
    80004b88:	00001097          	auipc	ra,0x1
    80004b8c:	ebc080e7          	jalr	-324(ra) # 80005a44 <_Z8printIntiii>
    80004b90:	00006517          	auipc	a0,0x6
    80004b94:	9e050513          	addi	a0,a0,-1568 # 8000a570 <CONSOLE_STATUS+0x560>
    80004b98:	00001097          	auipc	ra,0x1
    80004b9c:	cfc080e7          	jalr	-772(ra) # 80005894 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004ba0:	0014849b          	addiw	s1,s1,1
    80004ba4:	0ff4f493          	andi	s1,s1,255
    80004ba8:	00f00793          	li	a5,15
    80004bac:	fc97f0e3          	bgeu	a5,s1,80004b6c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004bb0:	00005517          	auipc	a0,0x5
    80004bb4:	7f850513          	addi	a0,a0,2040 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80004bb8:	00001097          	auipc	ra,0x1
    80004bbc:	cdc080e7          	jalr	-804(ra) # 80005894 <_Z11printStringPKc>
    finishedD = true;
    80004bc0:	00100793          	li	a5,1
    80004bc4:	00008717          	auipc	a4,0x8
    80004bc8:	68f70a23          	sb	a5,1684(a4) # 8000d258 <_ZL9finishedD>
    thread_dispatch();
    80004bcc:	ffffd097          	auipc	ra,0xffffd
    80004bd0:	8f4080e7          	jalr	-1804(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80004bd4:	01813083          	ld	ra,24(sp)
    80004bd8:	01013403          	ld	s0,16(sp)
    80004bdc:	00813483          	ld	s1,8(sp)
    80004be0:	00013903          	ld	s2,0(sp)
    80004be4:	02010113          	addi	sp,sp,32
    80004be8:	00008067          	ret

0000000080004bec <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004bec:	fe010113          	addi	sp,sp,-32
    80004bf0:	00113c23          	sd	ra,24(sp)
    80004bf4:	00813823          	sd	s0,16(sp)
    80004bf8:	00913423          	sd	s1,8(sp)
    80004bfc:	01213023          	sd	s2,0(sp)
    80004c00:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004c04:	00000493          	li	s1,0
    80004c08:	0400006f          	j	80004c48 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004c0c:	00005517          	auipc	a0,0x5
    80004c10:	73450513          	addi	a0,a0,1844 # 8000a340 <CONSOLE_STATUS+0x330>
    80004c14:	00001097          	auipc	ra,0x1
    80004c18:	c80080e7          	jalr	-896(ra) # 80005894 <_Z11printStringPKc>
    80004c1c:	00000613          	li	a2,0
    80004c20:	00a00593          	li	a1,10
    80004c24:	00048513          	mv	a0,s1
    80004c28:	00001097          	auipc	ra,0x1
    80004c2c:	e1c080e7          	jalr	-484(ra) # 80005a44 <_Z8printIntiii>
    80004c30:	00006517          	auipc	a0,0x6
    80004c34:	94050513          	addi	a0,a0,-1728 # 8000a570 <CONSOLE_STATUS+0x560>
    80004c38:	00001097          	auipc	ra,0x1
    80004c3c:	c5c080e7          	jalr	-932(ra) # 80005894 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004c40:	0014849b          	addiw	s1,s1,1
    80004c44:	0ff4f493          	andi	s1,s1,255
    80004c48:	00200793          	li	a5,2
    80004c4c:	fc97f0e3          	bgeu	a5,s1,80004c0c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004c50:	00005517          	auipc	a0,0x5
    80004c54:	6f850513          	addi	a0,a0,1784 # 8000a348 <CONSOLE_STATUS+0x338>
    80004c58:	00001097          	auipc	ra,0x1
    80004c5c:	c3c080e7          	jalr	-964(ra) # 80005894 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004c60:	00700313          	li	t1,7
    thread_dispatch();
    80004c64:	ffffd097          	auipc	ra,0xffffd
    80004c68:	85c080e7          	jalr	-1956(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004c6c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004c70:	00005517          	auipc	a0,0x5
    80004c74:	6e850513          	addi	a0,a0,1768 # 8000a358 <CONSOLE_STATUS+0x348>
    80004c78:	00001097          	auipc	ra,0x1
    80004c7c:	c1c080e7          	jalr	-996(ra) # 80005894 <_Z11printStringPKc>
    80004c80:	00000613          	li	a2,0
    80004c84:	00a00593          	li	a1,10
    80004c88:	0009051b          	sext.w	a0,s2
    80004c8c:	00001097          	auipc	ra,0x1
    80004c90:	db8080e7          	jalr	-584(ra) # 80005a44 <_Z8printIntiii>
    80004c94:	00006517          	auipc	a0,0x6
    80004c98:	8dc50513          	addi	a0,a0,-1828 # 8000a570 <CONSOLE_STATUS+0x560>
    80004c9c:	00001097          	auipc	ra,0x1
    80004ca0:	bf8080e7          	jalr	-1032(ra) # 80005894 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004ca4:	00c00513          	li	a0,12
    80004ca8:	00000097          	auipc	ra,0x0
    80004cac:	d88080e7          	jalr	-632(ra) # 80004a30 <_ZL9fibonaccim>
    80004cb0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004cb4:	00005517          	auipc	a0,0x5
    80004cb8:	6ac50513          	addi	a0,a0,1708 # 8000a360 <CONSOLE_STATUS+0x350>
    80004cbc:	00001097          	auipc	ra,0x1
    80004cc0:	bd8080e7          	jalr	-1064(ra) # 80005894 <_Z11printStringPKc>
    80004cc4:	00000613          	li	a2,0
    80004cc8:	00a00593          	li	a1,10
    80004ccc:	0009051b          	sext.w	a0,s2
    80004cd0:	00001097          	auipc	ra,0x1
    80004cd4:	d74080e7          	jalr	-652(ra) # 80005a44 <_Z8printIntiii>
    80004cd8:	00006517          	auipc	a0,0x6
    80004cdc:	89850513          	addi	a0,a0,-1896 # 8000a570 <CONSOLE_STATUS+0x560>
    80004ce0:	00001097          	auipc	ra,0x1
    80004ce4:	bb4080e7          	jalr	-1100(ra) # 80005894 <_Z11printStringPKc>
    80004ce8:	0400006f          	j	80004d28 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004cec:	00005517          	auipc	a0,0x5
    80004cf0:	65450513          	addi	a0,a0,1620 # 8000a340 <CONSOLE_STATUS+0x330>
    80004cf4:	00001097          	auipc	ra,0x1
    80004cf8:	ba0080e7          	jalr	-1120(ra) # 80005894 <_Z11printStringPKc>
    80004cfc:	00000613          	li	a2,0
    80004d00:	00a00593          	li	a1,10
    80004d04:	00048513          	mv	a0,s1
    80004d08:	00001097          	auipc	ra,0x1
    80004d0c:	d3c080e7          	jalr	-708(ra) # 80005a44 <_Z8printIntiii>
    80004d10:	00006517          	auipc	a0,0x6
    80004d14:	86050513          	addi	a0,a0,-1952 # 8000a570 <CONSOLE_STATUS+0x560>
    80004d18:	00001097          	auipc	ra,0x1
    80004d1c:	b7c080e7          	jalr	-1156(ra) # 80005894 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004d20:	0014849b          	addiw	s1,s1,1
    80004d24:	0ff4f493          	andi	s1,s1,255
    80004d28:	00500793          	li	a5,5
    80004d2c:	fc97f0e3          	bgeu	a5,s1,80004cec <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80004d30:	00005517          	auipc	a0,0x5
    80004d34:	64050513          	addi	a0,a0,1600 # 8000a370 <CONSOLE_STATUS+0x360>
    80004d38:	00001097          	auipc	ra,0x1
    80004d3c:	b5c080e7          	jalr	-1188(ra) # 80005894 <_Z11printStringPKc>
    finishedC = true;
    80004d40:	00100793          	li	a5,1
    80004d44:	00008717          	auipc	a4,0x8
    80004d48:	50f70aa3          	sb	a5,1301(a4) # 8000d259 <_ZL9finishedC>
    thread_dispatch();
    80004d4c:	ffffc097          	auipc	ra,0xffffc
    80004d50:	774080e7          	jalr	1908(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80004d54:	01813083          	ld	ra,24(sp)
    80004d58:	01013403          	ld	s0,16(sp)
    80004d5c:	00813483          	ld	s1,8(sp)
    80004d60:	00013903          	ld	s2,0(sp)
    80004d64:	02010113          	addi	sp,sp,32
    80004d68:	00008067          	ret

0000000080004d6c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004d6c:	fe010113          	addi	sp,sp,-32
    80004d70:	00113c23          	sd	ra,24(sp)
    80004d74:	00813823          	sd	s0,16(sp)
    80004d78:	00913423          	sd	s1,8(sp)
    80004d7c:	01213023          	sd	s2,0(sp)
    80004d80:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004d84:	00000913          	li	s2,0
    80004d88:	0380006f          	j	80004dc0 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004d8c:	ffffc097          	auipc	ra,0xffffc
    80004d90:	734080e7          	jalr	1844(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004d94:	00148493          	addi	s1,s1,1
    80004d98:	000027b7          	lui	a5,0x2
    80004d9c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004da0:	0097ee63          	bltu	a5,s1,80004dbc <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004da4:	00000713          	li	a4,0
    80004da8:	000077b7          	lui	a5,0x7
    80004dac:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004db0:	fce7eee3          	bltu	a5,a4,80004d8c <_ZL11workerBodyBPv+0x20>
    80004db4:	00170713          	addi	a4,a4,1
    80004db8:	ff1ff06f          	j	80004da8 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004dbc:	00190913          	addi	s2,s2,1
    80004dc0:	00f00793          	li	a5,15
    80004dc4:	0527e063          	bltu	a5,s2,80004e04 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004dc8:	00005517          	auipc	a0,0x5
    80004dcc:	56050513          	addi	a0,a0,1376 # 8000a328 <CONSOLE_STATUS+0x318>
    80004dd0:	00001097          	auipc	ra,0x1
    80004dd4:	ac4080e7          	jalr	-1340(ra) # 80005894 <_Z11printStringPKc>
    80004dd8:	00000613          	li	a2,0
    80004ddc:	00a00593          	li	a1,10
    80004de0:	0009051b          	sext.w	a0,s2
    80004de4:	00001097          	auipc	ra,0x1
    80004de8:	c60080e7          	jalr	-928(ra) # 80005a44 <_Z8printIntiii>
    80004dec:	00005517          	auipc	a0,0x5
    80004df0:	78450513          	addi	a0,a0,1924 # 8000a570 <CONSOLE_STATUS+0x560>
    80004df4:	00001097          	auipc	ra,0x1
    80004df8:	aa0080e7          	jalr	-1376(ra) # 80005894 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004dfc:	00000493          	li	s1,0
    80004e00:	f99ff06f          	j	80004d98 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004e04:	00005517          	auipc	a0,0x5
    80004e08:	52c50513          	addi	a0,a0,1324 # 8000a330 <CONSOLE_STATUS+0x320>
    80004e0c:	00001097          	auipc	ra,0x1
    80004e10:	a88080e7          	jalr	-1400(ra) # 80005894 <_Z11printStringPKc>
    finishedB = true;
    80004e14:	00100793          	li	a5,1
    80004e18:	00008717          	auipc	a4,0x8
    80004e1c:	44f70123          	sb	a5,1090(a4) # 8000d25a <_ZL9finishedB>
    thread_dispatch();
    80004e20:	ffffc097          	auipc	ra,0xffffc
    80004e24:	6a0080e7          	jalr	1696(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80004e28:	01813083          	ld	ra,24(sp)
    80004e2c:	01013403          	ld	s0,16(sp)
    80004e30:	00813483          	ld	s1,8(sp)
    80004e34:	00013903          	ld	s2,0(sp)
    80004e38:	02010113          	addi	sp,sp,32
    80004e3c:	00008067          	ret

0000000080004e40 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004e40:	fe010113          	addi	sp,sp,-32
    80004e44:	00113c23          	sd	ra,24(sp)
    80004e48:	00813823          	sd	s0,16(sp)
    80004e4c:	00913423          	sd	s1,8(sp)
    80004e50:	01213023          	sd	s2,0(sp)
    80004e54:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004e58:	00000913          	li	s2,0
    80004e5c:	0380006f          	j	80004e94 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004e60:	ffffc097          	auipc	ra,0xffffc
    80004e64:	660080e7          	jalr	1632(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004e68:	00148493          	addi	s1,s1,1
    80004e6c:	000027b7          	lui	a5,0x2
    80004e70:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004e74:	0097ee63          	bltu	a5,s1,80004e90 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004e78:	00000713          	li	a4,0
    80004e7c:	000077b7          	lui	a5,0x7
    80004e80:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004e84:	fce7eee3          	bltu	a5,a4,80004e60 <_ZL11workerBodyAPv+0x20>
    80004e88:	00170713          	addi	a4,a4,1
    80004e8c:	ff1ff06f          	j	80004e7c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004e90:	00190913          	addi	s2,s2,1
    80004e94:	00900793          	li	a5,9
    80004e98:	0527e063          	bltu	a5,s2,80004ed8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004e9c:	00005517          	auipc	a0,0x5
    80004ea0:	47450513          	addi	a0,a0,1140 # 8000a310 <CONSOLE_STATUS+0x300>
    80004ea4:	00001097          	auipc	ra,0x1
    80004ea8:	9f0080e7          	jalr	-1552(ra) # 80005894 <_Z11printStringPKc>
    80004eac:	00000613          	li	a2,0
    80004eb0:	00a00593          	li	a1,10
    80004eb4:	0009051b          	sext.w	a0,s2
    80004eb8:	00001097          	auipc	ra,0x1
    80004ebc:	b8c080e7          	jalr	-1140(ra) # 80005a44 <_Z8printIntiii>
    80004ec0:	00005517          	auipc	a0,0x5
    80004ec4:	6b050513          	addi	a0,a0,1712 # 8000a570 <CONSOLE_STATUS+0x560>
    80004ec8:	00001097          	auipc	ra,0x1
    80004ecc:	9cc080e7          	jalr	-1588(ra) # 80005894 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004ed0:	00000493          	li	s1,0
    80004ed4:	f99ff06f          	j	80004e6c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80004ed8:	00005517          	auipc	a0,0x5
    80004edc:	44050513          	addi	a0,a0,1088 # 8000a318 <CONSOLE_STATUS+0x308>
    80004ee0:	00001097          	auipc	ra,0x1
    80004ee4:	9b4080e7          	jalr	-1612(ra) # 80005894 <_Z11printStringPKc>
    finishedA = true;
    80004ee8:	00100793          	li	a5,1
    80004eec:	00008717          	auipc	a4,0x8
    80004ef0:	36f707a3          	sb	a5,879(a4) # 8000d25b <_ZL9finishedA>
}
    80004ef4:	01813083          	ld	ra,24(sp)
    80004ef8:	01013403          	ld	s0,16(sp)
    80004efc:	00813483          	ld	s1,8(sp)
    80004f00:	00013903          	ld	s2,0(sp)
    80004f04:	02010113          	addi	sp,sp,32
    80004f08:	00008067          	ret

0000000080004f0c <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004f0c:	fd010113          	addi	sp,sp,-48
    80004f10:	02113423          	sd	ra,40(sp)
    80004f14:	02813023          	sd	s0,32(sp)
    80004f18:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004f1c:	00000613          	li	a2,0
    80004f20:	00000597          	auipc	a1,0x0
    80004f24:	f2058593          	addi	a1,a1,-224 # 80004e40 <_ZL11workerBodyAPv>
    80004f28:	fd040513          	addi	a0,s0,-48
    80004f2c:	ffffc097          	auipc	ra,0xffffc
    80004f30:	4d8080e7          	jalr	1240(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80004f34:	00005517          	auipc	a0,0x5
    80004f38:	48450513          	addi	a0,a0,1156 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    80004f3c:	00001097          	auipc	ra,0x1
    80004f40:	958080e7          	jalr	-1704(ra) # 80005894 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80004f44:	00000613          	li	a2,0
    80004f48:	00000597          	auipc	a1,0x0
    80004f4c:	e2458593          	addi	a1,a1,-476 # 80004d6c <_ZL11workerBodyBPv>
    80004f50:	fd840513          	addi	a0,s0,-40
    80004f54:	ffffc097          	auipc	ra,0xffffc
    80004f58:	4b0080e7          	jalr	1200(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80004f5c:	00005517          	auipc	a0,0x5
    80004f60:	47450513          	addi	a0,a0,1140 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80004f64:	00001097          	auipc	ra,0x1
    80004f68:	930080e7          	jalr	-1744(ra) # 80005894 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004f6c:	00000613          	li	a2,0
    80004f70:	00000597          	auipc	a1,0x0
    80004f74:	c7c58593          	addi	a1,a1,-900 # 80004bec <_ZL11workerBodyCPv>
    80004f78:	fe040513          	addi	a0,s0,-32
    80004f7c:	ffffc097          	auipc	ra,0xffffc
    80004f80:	488080e7          	jalr	1160(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80004f84:	00005517          	auipc	a0,0x5
    80004f88:	46450513          	addi	a0,a0,1124 # 8000a3e8 <CONSOLE_STATUS+0x3d8>
    80004f8c:	00001097          	auipc	ra,0x1
    80004f90:	908080e7          	jalr	-1784(ra) # 80005894 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80004f94:	00000613          	li	a2,0
    80004f98:	00000597          	auipc	a1,0x0
    80004f9c:	b0c58593          	addi	a1,a1,-1268 # 80004aa4 <_ZL11workerBodyDPv>
    80004fa0:	fe840513          	addi	a0,s0,-24
    80004fa4:	ffffc097          	auipc	ra,0xffffc
    80004fa8:	460080e7          	jalr	1120(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80004fac:	00005517          	auipc	a0,0x5
    80004fb0:	45450513          	addi	a0,a0,1108 # 8000a400 <CONSOLE_STATUS+0x3f0>
    80004fb4:	00001097          	auipc	ra,0x1
    80004fb8:	8e0080e7          	jalr	-1824(ra) # 80005894 <_Z11printStringPKc>
    80004fbc:	00c0006f          	j	80004fc8 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004fc0:	ffffc097          	auipc	ra,0xffffc
    80004fc4:	500080e7          	jalr	1280(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004fc8:	00008797          	auipc	a5,0x8
    80004fcc:	2937c783          	lbu	a5,659(a5) # 8000d25b <_ZL9finishedA>
    80004fd0:	fe0788e3          	beqz	a5,80004fc0 <_Z18Threads_C_API_testv+0xb4>
    80004fd4:	00008797          	auipc	a5,0x8
    80004fd8:	2867c783          	lbu	a5,646(a5) # 8000d25a <_ZL9finishedB>
    80004fdc:	fe0782e3          	beqz	a5,80004fc0 <_Z18Threads_C_API_testv+0xb4>
    80004fe0:	00008797          	auipc	a5,0x8
    80004fe4:	2797c783          	lbu	a5,633(a5) # 8000d259 <_ZL9finishedC>
    80004fe8:	fc078ce3          	beqz	a5,80004fc0 <_Z18Threads_C_API_testv+0xb4>
    80004fec:	00008797          	auipc	a5,0x8
    80004ff0:	26c7c783          	lbu	a5,620(a5) # 8000d258 <_ZL9finishedD>
    80004ff4:	fc0786e3          	beqz	a5,80004fc0 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80004ff8:	02813083          	ld	ra,40(sp)
    80004ffc:	02013403          	ld	s0,32(sp)
    80005000:	03010113          	addi	sp,sp,48
    80005004:	00008067          	ret

0000000080005008 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80005008:	fd010113          	addi	sp,sp,-48
    8000500c:	02113423          	sd	ra,40(sp)
    80005010:	02813023          	sd	s0,32(sp)
    80005014:	00913c23          	sd	s1,24(sp)
    80005018:	01213823          	sd	s2,16(sp)
    8000501c:	01313423          	sd	s3,8(sp)
    80005020:	03010413          	addi	s0,sp,48
    80005024:	00050993          	mv	s3,a0
    80005028:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000502c:	00000913          	li	s2,0
    80005030:	00c0006f          	j	8000503c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005034:	ffffe097          	auipc	ra,0xffffe
    80005038:	a40080e7          	jalr	-1472(ra) # 80002a74 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    8000503c:	ffffc097          	auipc	ra,0xffffc
    80005040:	5c4080e7          	jalr	1476(ra) # 80001600 <_Z4getcv>
    80005044:	0005059b          	sext.w	a1,a0
    80005048:	01b00793          	li	a5,27
    8000504c:	02f58a63          	beq	a1,a5,80005080 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005050:	0084b503          	ld	a0,8(s1)
    80005054:	00001097          	auipc	ra,0x1
    80005058:	c64080e7          	jalr	-924(ra) # 80005cb8 <_ZN9BufferCPP3putEi>
        i++;
    8000505c:	0019071b          	addiw	a4,s2,1
    80005060:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005064:	0004a683          	lw	a3,0(s1)
    80005068:	0026979b          	slliw	a5,a3,0x2
    8000506c:	00d787bb          	addw	a5,a5,a3
    80005070:	0017979b          	slliw	a5,a5,0x1
    80005074:	02f767bb          	remw	a5,a4,a5
    80005078:	fc0792e3          	bnez	a5,8000503c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    8000507c:	fb9ff06f          	j	80005034 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005080:	00100793          	li	a5,1
    80005084:	00008717          	auipc	a4,0x8
    80005088:	1cf72e23          	sw	a5,476(a4) # 8000d260 <_ZL9threadEnd>
    td->buffer->put('!');
    8000508c:	0209b783          	ld	a5,32(s3)
    80005090:	02100593          	li	a1,33
    80005094:	0087b503          	ld	a0,8(a5)
    80005098:	00001097          	auipc	ra,0x1
    8000509c:	c20080e7          	jalr	-992(ra) # 80005cb8 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800050a0:	0104b503          	ld	a0,16(s1)
    800050a4:	ffffe097          	auipc	ra,0xffffe
    800050a8:	b6c080e7          	jalr	-1172(ra) # 80002c10 <_ZN9Semaphore6signalEv>
}
    800050ac:	02813083          	ld	ra,40(sp)
    800050b0:	02013403          	ld	s0,32(sp)
    800050b4:	01813483          	ld	s1,24(sp)
    800050b8:	01013903          	ld	s2,16(sp)
    800050bc:	00813983          	ld	s3,8(sp)
    800050c0:	03010113          	addi	sp,sp,48
    800050c4:	00008067          	ret

00000000800050c8 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800050c8:	fe010113          	addi	sp,sp,-32
    800050cc:	00113c23          	sd	ra,24(sp)
    800050d0:	00813823          	sd	s0,16(sp)
    800050d4:	00913423          	sd	s1,8(sp)
    800050d8:	01213023          	sd	s2,0(sp)
    800050dc:	02010413          	addi	s0,sp,32
    800050e0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800050e4:	00000913          	li	s2,0
    800050e8:	00c0006f          	j	800050f4 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800050ec:	ffffe097          	auipc	ra,0xffffe
    800050f0:	988080e7          	jalr	-1656(ra) # 80002a74 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800050f4:	00008797          	auipc	a5,0x8
    800050f8:	16c7a783          	lw	a5,364(a5) # 8000d260 <_ZL9threadEnd>
    800050fc:	02079e63          	bnez	a5,80005138 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005100:	0004a583          	lw	a1,0(s1)
    80005104:	0305859b          	addiw	a1,a1,48
    80005108:	0084b503          	ld	a0,8(s1)
    8000510c:	00001097          	auipc	ra,0x1
    80005110:	bac080e7          	jalr	-1108(ra) # 80005cb8 <_ZN9BufferCPP3putEi>
        i++;
    80005114:	0019071b          	addiw	a4,s2,1
    80005118:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000511c:	0004a683          	lw	a3,0(s1)
    80005120:	0026979b          	slliw	a5,a3,0x2
    80005124:	00d787bb          	addw	a5,a5,a3
    80005128:	0017979b          	slliw	a5,a5,0x1
    8000512c:	02f767bb          	remw	a5,a4,a5
    80005130:	fc0792e3          	bnez	a5,800050f4 <_ZN12ProducerSync8producerEPv+0x2c>
    80005134:	fb9ff06f          	j	800050ec <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005138:	0104b503          	ld	a0,16(s1)
    8000513c:	ffffe097          	auipc	ra,0xffffe
    80005140:	ad4080e7          	jalr	-1324(ra) # 80002c10 <_ZN9Semaphore6signalEv>
}
    80005144:	01813083          	ld	ra,24(sp)
    80005148:	01013403          	ld	s0,16(sp)
    8000514c:	00813483          	ld	s1,8(sp)
    80005150:	00013903          	ld	s2,0(sp)
    80005154:	02010113          	addi	sp,sp,32
    80005158:	00008067          	ret

000000008000515c <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    8000515c:	fd010113          	addi	sp,sp,-48
    80005160:	02113423          	sd	ra,40(sp)
    80005164:	02813023          	sd	s0,32(sp)
    80005168:	00913c23          	sd	s1,24(sp)
    8000516c:	01213823          	sd	s2,16(sp)
    80005170:	01313423          	sd	s3,8(sp)
    80005174:	01413023          	sd	s4,0(sp)
    80005178:	03010413          	addi	s0,sp,48
    8000517c:	00050993          	mv	s3,a0
    80005180:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005184:	00000a13          	li	s4,0
    80005188:	01c0006f          	j	800051a4 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    8000518c:	ffffe097          	auipc	ra,0xffffe
    80005190:	8e8080e7          	jalr	-1816(ra) # 80002a74 <_ZN6Thread8dispatchEv>
    80005194:	0500006f          	j	800051e4 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005198:	00a00513          	li	a0,10
    8000519c:	ffffc097          	auipc	ra,0xffffc
    800051a0:	48c080e7          	jalr	1164(ra) # 80001628 <_Z4putcc>
    while (!threadEnd) {
    800051a4:	00008797          	auipc	a5,0x8
    800051a8:	0bc7a783          	lw	a5,188(a5) # 8000d260 <_ZL9threadEnd>
    800051ac:	06079263          	bnez	a5,80005210 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800051b0:	00893503          	ld	a0,8(s2)
    800051b4:	00001097          	auipc	ra,0x1
    800051b8:	b94080e7          	jalr	-1132(ra) # 80005d48 <_ZN9BufferCPP3getEv>
        i++;
    800051bc:	001a049b          	addiw	s1,s4,1
    800051c0:	00048a1b          	sext.w	s4,s1
        putc(key);
    800051c4:	0ff57513          	andi	a0,a0,255
    800051c8:	ffffc097          	auipc	ra,0xffffc
    800051cc:	460080e7          	jalr	1120(ra) # 80001628 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800051d0:	00092703          	lw	a4,0(s2)
    800051d4:	0027179b          	slliw	a5,a4,0x2
    800051d8:	00e787bb          	addw	a5,a5,a4
    800051dc:	02f4e7bb          	remw	a5,s1,a5
    800051e0:	fa0786e3          	beqz	a5,8000518c <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800051e4:	05000793          	li	a5,80
    800051e8:	02f4e4bb          	remw	s1,s1,a5
    800051ec:	fa049ce3          	bnez	s1,800051a4 <_ZN12ConsumerSync8consumerEPv+0x48>
    800051f0:	fa9ff06f          	j	80005198 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800051f4:	0209b783          	ld	a5,32(s3)
    800051f8:	0087b503          	ld	a0,8(a5)
    800051fc:	00001097          	auipc	ra,0x1
    80005200:	b4c080e7          	jalr	-1204(ra) # 80005d48 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005204:	0ff57513          	andi	a0,a0,255
    80005208:	ffffe097          	auipc	ra,0xffffe
    8000520c:	adc080e7          	jalr	-1316(ra) # 80002ce4 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005210:	0209b783          	ld	a5,32(s3)
    80005214:	0087b503          	ld	a0,8(a5)
    80005218:	00001097          	auipc	ra,0x1
    8000521c:	bbc080e7          	jalr	-1092(ra) # 80005dd4 <_ZN9BufferCPP6getCntEv>
    80005220:	fca04ae3          	bgtz	a0,800051f4 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005224:	01093503          	ld	a0,16(s2)
    80005228:	ffffe097          	auipc	ra,0xffffe
    8000522c:	9e8080e7          	jalr	-1560(ra) # 80002c10 <_ZN9Semaphore6signalEv>
}
    80005230:	02813083          	ld	ra,40(sp)
    80005234:	02013403          	ld	s0,32(sp)
    80005238:	01813483          	ld	s1,24(sp)
    8000523c:	01013903          	ld	s2,16(sp)
    80005240:	00813983          	ld	s3,8(sp)
    80005244:	00013a03          	ld	s4,0(sp)
    80005248:	03010113          	addi	sp,sp,48
    8000524c:	00008067          	ret

0000000080005250 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005250:	f8010113          	addi	sp,sp,-128
    80005254:	06113c23          	sd	ra,120(sp)
    80005258:	06813823          	sd	s0,112(sp)
    8000525c:	06913423          	sd	s1,104(sp)
    80005260:	07213023          	sd	s2,96(sp)
    80005264:	05313c23          	sd	s3,88(sp)
    80005268:	05413823          	sd	s4,80(sp)
    8000526c:	05513423          	sd	s5,72(sp)
    80005270:	05613023          	sd	s6,64(sp)
    80005274:	03713c23          	sd	s7,56(sp)
    80005278:	03813823          	sd	s8,48(sp)
    8000527c:	03913423          	sd	s9,40(sp)
    80005280:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005284:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005288:	00005517          	auipc	a0,0x5
    8000528c:	fa050513          	addi	a0,a0,-96 # 8000a228 <CONSOLE_STATUS+0x218>
    80005290:	00000097          	auipc	ra,0x0
    80005294:	604080e7          	jalr	1540(ra) # 80005894 <_Z11printStringPKc>
    getString(input, 30);
    80005298:	01e00593          	li	a1,30
    8000529c:	f8040493          	addi	s1,s0,-128
    800052a0:	00048513          	mv	a0,s1
    800052a4:	00000097          	auipc	ra,0x0
    800052a8:	678080e7          	jalr	1656(ra) # 8000591c <_Z9getStringPci>
    threadNum = stringToInt(input);
    800052ac:	00048513          	mv	a0,s1
    800052b0:	00000097          	auipc	ra,0x0
    800052b4:	744080e7          	jalr	1860(ra) # 800059f4 <_Z11stringToIntPKc>
    800052b8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800052bc:	00005517          	auipc	a0,0x5
    800052c0:	f8c50513          	addi	a0,a0,-116 # 8000a248 <CONSOLE_STATUS+0x238>
    800052c4:	00000097          	auipc	ra,0x0
    800052c8:	5d0080e7          	jalr	1488(ra) # 80005894 <_Z11printStringPKc>
    getString(input, 30);
    800052cc:	01e00593          	li	a1,30
    800052d0:	00048513          	mv	a0,s1
    800052d4:	00000097          	auipc	ra,0x0
    800052d8:	648080e7          	jalr	1608(ra) # 8000591c <_Z9getStringPci>
    n = stringToInt(input);
    800052dc:	00048513          	mv	a0,s1
    800052e0:	00000097          	auipc	ra,0x0
    800052e4:	714080e7          	jalr	1812(ra) # 800059f4 <_Z11stringToIntPKc>
    800052e8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800052ec:	00005517          	auipc	a0,0x5
    800052f0:	f7c50513          	addi	a0,a0,-132 # 8000a268 <CONSOLE_STATUS+0x258>
    800052f4:	00000097          	auipc	ra,0x0
    800052f8:	5a0080e7          	jalr	1440(ra) # 80005894 <_Z11printStringPKc>
    800052fc:	00000613          	li	a2,0
    80005300:	00a00593          	li	a1,10
    80005304:	00090513          	mv	a0,s2
    80005308:	00000097          	auipc	ra,0x0
    8000530c:	73c080e7          	jalr	1852(ra) # 80005a44 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005310:	00005517          	auipc	a0,0x5
    80005314:	f7050513          	addi	a0,a0,-144 # 8000a280 <CONSOLE_STATUS+0x270>
    80005318:	00000097          	auipc	ra,0x0
    8000531c:	57c080e7          	jalr	1404(ra) # 80005894 <_Z11printStringPKc>
    80005320:	00000613          	li	a2,0
    80005324:	00a00593          	li	a1,10
    80005328:	00048513          	mv	a0,s1
    8000532c:	00000097          	auipc	ra,0x0
    80005330:	718080e7          	jalr	1816(ra) # 80005a44 <_Z8printIntiii>
    printString(".\n");
    80005334:	00005517          	auipc	a0,0x5
    80005338:	f6450513          	addi	a0,a0,-156 # 8000a298 <CONSOLE_STATUS+0x288>
    8000533c:	00000097          	auipc	ra,0x0
    80005340:	558080e7          	jalr	1368(ra) # 80005894 <_Z11printStringPKc>
    if(threadNum > n) {
    80005344:	0324c463          	blt	s1,s2,8000536c <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005348:	03205c63          	blez	s2,80005380 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000534c:	03800513          	li	a0,56
    80005350:	ffffd097          	auipc	ra,0xffffd
    80005354:	4f0080e7          	jalr	1264(ra) # 80002840 <_Znwm>
    80005358:	00050a93          	mv	s5,a0
    8000535c:	00048593          	mv	a1,s1
    80005360:	00001097          	auipc	ra,0x1
    80005364:	804080e7          	jalr	-2044(ra) # 80005b64 <_ZN9BufferCPPC1Ei>
    80005368:	0300006f          	j	80005398 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000536c:	00005517          	auipc	a0,0x5
    80005370:	f3450513          	addi	a0,a0,-204 # 8000a2a0 <CONSOLE_STATUS+0x290>
    80005374:	00000097          	auipc	ra,0x0
    80005378:	520080e7          	jalr	1312(ra) # 80005894 <_Z11printStringPKc>
        return;
    8000537c:	0140006f          	j	80005390 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005380:	00005517          	auipc	a0,0x5
    80005384:	f6050513          	addi	a0,a0,-160 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80005388:	00000097          	auipc	ra,0x0
    8000538c:	50c080e7          	jalr	1292(ra) # 80005894 <_Z11printStringPKc>
        return;
    80005390:	000b8113          	mv	sp,s7
    80005394:	2380006f          	j	800055cc <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005398:	01000513          	li	a0,16
    8000539c:	ffffd097          	auipc	ra,0xffffd
    800053a0:	4a4080e7          	jalr	1188(ra) # 80002840 <_Znwm>
    800053a4:	00050493          	mv	s1,a0
    800053a8:	00000593          	li	a1,0
    800053ac:	ffffe097          	auipc	ra,0xffffe
    800053b0:	800080e7          	jalr	-2048(ra) # 80002bac <_ZN9SemaphoreC1Ej>
    800053b4:	00008797          	auipc	a5,0x8
    800053b8:	ea97ba23          	sd	s1,-332(a5) # 8000d268 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800053bc:	00391793          	slli	a5,s2,0x3
    800053c0:	00f78793          	addi	a5,a5,15
    800053c4:	ff07f793          	andi	a5,a5,-16
    800053c8:	40f10133          	sub	sp,sp,a5
    800053cc:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800053d0:	0019071b          	addiw	a4,s2,1
    800053d4:	00171793          	slli	a5,a4,0x1
    800053d8:	00e787b3          	add	a5,a5,a4
    800053dc:	00379793          	slli	a5,a5,0x3
    800053e0:	00f78793          	addi	a5,a5,15
    800053e4:	ff07f793          	andi	a5,a5,-16
    800053e8:	40f10133          	sub	sp,sp,a5
    800053ec:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800053f0:	00191c13          	slli	s8,s2,0x1
    800053f4:	012c07b3          	add	a5,s8,s2
    800053f8:	00379793          	slli	a5,a5,0x3
    800053fc:	00fa07b3          	add	a5,s4,a5
    80005400:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005404:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005408:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    8000540c:	02800513          	li	a0,40
    80005410:	ffffd097          	auipc	ra,0xffffd
    80005414:	430080e7          	jalr	1072(ra) # 80002840 <_Znwm>
    80005418:	00050b13          	mv	s6,a0
    8000541c:	012c0c33          	add	s8,s8,s2
    80005420:	003c1c13          	slli	s8,s8,0x3
    80005424:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005428:	ffffd097          	auipc	ra,0xffffd
    8000542c:	708080e7          	jalr	1800(ra) # 80002b30 <_ZN6ThreadC1Ev>
    80005430:	00008797          	auipc	a5,0x8
    80005434:	b4878793          	addi	a5,a5,-1208 # 8000cf78 <_ZTV12ConsumerSync+0x10>
    80005438:	00fb3023          	sd	a5,0(s6)
    8000543c:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005440:	000b0513          	mv	a0,s6
    80005444:	ffffd097          	auipc	ra,0xffffd
    80005448:	5b4080e7          	jalr	1460(ra) # 800029f8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000544c:	00000493          	li	s1,0
    80005450:	0380006f          	j	80005488 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005454:	00008797          	auipc	a5,0x8
    80005458:	afc78793          	addi	a5,a5,-1284 # 8000cf50 <_ZTV12ProducerSync+0x10>
    8000545c:	00fcb023          	sd	a5,0(s9)
    80005460:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005464:	00349793          	slli	a5,s1,0x3
    80005468:	00f987b3          	add	a5,s3,a5
    8000546c:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005470:	00349793          	slli	a5,s1,0x3
    80005474:	00f987b3          	add	a5,s3,a5
    80005478:	0007b503          	ld	a0,0(a5)
    8000547c:	ffffd097          	auipc	ra,0xffffd
    80005480:	57c080e7          	jalr	1404(ra) # 800029f8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005484:	0014849b          	addiw	s1,s1,1
    80005488:	0b24d063          	bge	s1,s2,80005528 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    8000548c:	00149793          	slli	a5,s1,0x1
    80005490:	009787b3          	add	a5,a5,s1
    80005494:	00379793          	slli	a5,a5,0x3
    80005498:	00fa07b3          	add	a5,s4,a5
    8000549c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800054a0:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800054a4:	00008717          	auipc	a4,0x8
    800054a8:	dc473703          	ld	a4,-572(a4) # 8000d268 <_ZL10waitForAll>
    800054ac:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800054b0:	02905863          	blez	s1,800054e0 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800054b4:	02800513          	li	a0,40
    800054b8:	ffffd097          	auipc	ra,0xffffd
    800054bc:	388080e7          	jalr	904(ra) # 80002840 <_Znwm>
    800054c0:	00050c93          	mv	s9,a0
    800054c4:	00149c13          	slli	s8,s1,0x1
    800054c8:	009c0c33          	add	s8,s8,s1
    800054cc:	003c1c13          	slli	s8,s8,0x3
    800054d0:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800054d4:	ffffd097          	auipc	ra,0xffffd
    800054d8:	65c080e7          	jalr	1628(ra) # 80002b30 <_ZN6ThreadC1Ev>
    800054dc:	f79ff06f          	j	80005454 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800054e0:	02800513          	li	a0,40
    800054e4:	ffffd097          	auipc	ra,0xffffd
    800054e8:	35c080e7          	jalr	860(ra) # 80002840 <_Znwm>
    800054ec:	00050c93          	mv	s9,a0
    800054f0:	00149c13          	slli	s8,s1,0x1
    800054f4:	009c0c33          	add	s8,s8,s1
    800054f8:	003c1c13          	slli	s8,s8,0x3
    800054fc:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005500:	ffffd097          	auipc	ra,0xffffd
    80005504:	630080e7          	jalr	1584(ra) # 80002b30 <_ZN6ThreadC1Ev>
    80005508:	00008797          	auipc	a5,0x8
    8000550c:	a2078793          	addi	a5,a5,-1504 # 8000cf28 <_ZTV16ProducerKeyboard+0x10>
    80005510:	00fcb023          	sd	a5,0(s9)
    80005514:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005518:	00349793          	slli	a5,s1,0x3
    8000551c:	00f987b3          	add	a5,s3,a5
    80005520:	0197b023          	sd	s9,0(a5)
    80005524:	f4dff06f          	j	80005470 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005528:	ffffd097          	auipc	ra,0xffffd
    8000552c:	54c080e7          	jalr	1356(ra) # 80002a74 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005530:	00000493          	li	s1,0
    80005534:	00994e63          	blt	s2,s1,80005550 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005538:	00008517          	auipc	a0,0x8
    8000553c:	d3053503          	ld	a0,-720(a0) # 8000d268 <_ZL10waitForAll>
    80005540:	ffffd097          	auipc	ra,0xffffd
    80005544:	6a4080e7          	jalr	1700(ra) # 80002be4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005548:	0014849b          	addiw	s1,s1,1
    8000554c:	fe9ff06f          	j	80005534 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005550:	00000493          	li	s1,0
    80005554:	0080006f          	j	8000555c <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005558:	0014849b          	addiw	s1,s1,1
    8000555c:	0324d263          	bge	s1,s2,80005580 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005560:	00349793          	slli	a5,s1,0x3
    80005564:	00f987b3          	add	a5,s3,a5
    80005568:	0007b503          	ld	a0,0(a5)
    8000556c:	fe0506e3          	beqz	a0,80005558 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005570:	00053783          	ld	a5,0(a0)
    80005574:	0087b783          	ld	a5,8(a5)
    80005578:	000780e7          	jalr	a5
    8000557c:	fddff06f          	j	80005558 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005580:	000b0a63          	beqz	s6,80005594 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005584:	000b3783          	ld	a5,0(s6)
    80005588:	0087b783          	ld	a5,8(a5)
    8000558c:	000b0513          	mv	a0,s6
    80005590:	000780e7          	jalr	a5
    delete waitForAll;
    80005594:	00008517          	auipc	a0,0x8
    80005598:	cd453503          	ld	a0,-812(a0) # 8000d268 <_ZL10waitForAll>
    8000559c:	00050863          	beqz	a0,800055ac <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800055a0:	00053783          	ld	a5,0(a0)
    800055a4:	0087b783          	ld	a5,8(a5)
    800055a8:	000780e7          	jalr	a5
    delete buffer;
    800055ac:	000a8e63          	beqz	s5,800055c8 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800055b0:	000a8513          	mv	a0,s5
    800055b4:	00001097          	auipc	ra,0x1
    800055b8:	8a8080e7          	jalr	-1880(ra) # 80005e5c <_ZN9BufferCPPD1Ev>
    800055bc:	000a8513          	mv	a0,s5
    800055c0:	ffffd097          	auipc	ra,0xffffd
    800055c4:	2d0080e7          	jalr	720(ra) # 80002890 <_ZdlPv>
    800055c8:	000b8113          	mv	sp,s7

}
    800055cc:	f8040113          	addi	sp,s0,-128
    800055d0:	07813083          	ld	ra,120(sp)
    800055d4:	07013403          	ld	s0,112(sp)
    800055d8:	06813483          	ld	s1,104(sp)
    800055dc:	06013903          	ld	s2,96(sp)
    800055e0:	05813983          	ld	s3,88(sp)
    800055e4:	05013a03          	ld	s4,80(sp)
    800055e8:	04813a83          	ld	s5,72(sp)
    800055ec:	04013b03          	ld	s6,64(sp)
    800055f0:	03813b83          	ld	s7,56(sp)
    800055f4:	03013c03          	ld	s8,48(sp)
    800055f8:	02813c83          	ld	s9,40(sp)
    800055fc:	08010113          	addi	sp,sp,128
    80005600:	00008067          	ret
    80005604:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005608:	000a8513          	mv	a0,s5
    8000560c:	ffffd097          	auipc	ra,0xffffd
    80005610:	284080e7          	jalr	644(ra) # 80002890 <_ZdlPv>
    80005614:	00048513          	mv	a0,s1
    80005618:	00009097          	auipc	ra,0x9
    8000561c:	d60080e7          	jalr	-672(ra) # 8000e378 <_Unwind_Resume>
    80005620:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005624:	00048513          	mv	a0,s1
    80005628:	ffffd097          	auipc	ra,0xffffd
    8000562c:	268080e7          	jalr	616(ra) # 80002890 <_ZdlPv>
    80005630:	00090513          	mv	a0,s2
    80005634:	00009097          	auipc	ra,0x9
    80005638:	d44080e7          	jalr	-700(ra) # 8000e378 <_Unwind_Resume>
    8000563c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005640:	000b0513          	mv	a0,s6
    80005644:	ffffd097          	auipc	ra,0xffffd
    80005648:	24c080e7          	jalr	588(ra) # 80002890 <_ZdlPv>
    8000564c:	00048513          	mv	a0,s1
    80005650:	00009097          	auipc	ra,0x9
    80005654:	d28080e7          	jalr	-728(ra) # 8000e378 <_Unwind_Resume>
    80005658:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    8000565c:	000c8513          	mv	a0,s9
    80005660:	ffffd097          	auipc	ra,0xffffd
    80005664:	230080e7          	jalr	560(ra) # 80002890 <_ZdlPv>
    80005668:	00048513          	mv	a0,s1
    8000566c:	00009097          	auipc	ra,0x9
    80005670:	d0c080e7          	jalr	-756(ra) # 8000e378 <_Unwind_Resume>
    80005674:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005678:	000c8513          	mv	a0,s9
    8000567c:	ffffd097          	auipc	ra,0xffffd
    80005680:	214080e7          	jalr	532(ra) # 80002890 <_ZdlPv>
    80005684:	00048513          	mv	a0,s1
    80005688:	00009097          	auipc	ra,0x9
    8000568c:	cf0080e7          	jalr	-784(ra) # 8000e378 <_Unwind_Resume>

0000000080005690 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005690:	ff010113          	addi	sp,sp,-16
    80005694:	00113423          	sd	ra,8(sp)
    80005698:	00813023          	sd	s0,0(sp)
    8000569c:	01010413          	addi	s0,sp,16
    800056a0:	00008797          	auipc	a5,0x8
    800056a4:	8d878793          	addi	a5,a5,-1832 # 8000cf78 <_ZTV12ConsumerSync+0x10>
    800056a8:	00f53023          	sd	a5,0(a0)
    800056ac:	ffffd097          	auipc	ra,0xffffd
    800056b0:	0e0080e7          	jalr	224(ra) # 8000278c <_ZN6ThreadD1Ev>
    800056b4:	00813083          	ld	ra,8(sp)
    800056b8:	00013403          	ld	s0,0(sp)
    800056bc:	01010113          	addi	sp,sp,16
    800056c0:	00008067          	ret

00000000800056c4 <_ZN12ConsumerSyncD0Ev>:
    800056c4:	fe010113          	addi	sp,sp,-32
    800056c8:	00113c23          	sd	ra,24(sp)
    800056cc:	00813823          	sd	s0,16(sp)
    800056d0:	00913423          	sd	s1,8(sp)
    800056d4:	02010413          	addi	s0,sp,32
    800056d8:	00050493          	mv	s1,a0
    800056dc:	00008797          	auipc	a5,0x8
    800056e0:	89c78793          	addi	a5,a5,-1892 # 8000cf78 <_ZTV12ConsumerSync+0x10>
    800056e4:	00f53023          	sd	a5,0(a0)
    800056e8:	ffffd097          	auipc	ra,0xffffd
    800056ec:	0a4080e7          	jalr	164(ra) # 8000278c <_ZN6ThreadD1Ev>
    800056f0:	00048513          	mv	a0,s1
    800056f4:	ffffd097          	auipc	ra,0xffffd
    800056f8:	19c080e7          	jalr	412(ra) # 80002890 <_ZdlPv>
    800056fc:	01813083          	ld	ra,24(sp)
    80005700:	01013403          	ld	s0,16(sp)
    80005704:	00813483          	ld	s1,8(sp)
    80005708:	02010113          	addi	sp,sp,32
    8000570c:	00008067          	ret

0000000080005710 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005710:	ff010113          	addi	sp,sp,-16
    80005714:	00113423          	sd	ra,8(sp)
    80005718:	00813023          	sd	s0,0(sp)
    8000571c:	01010413          	addi	s0,sp,16
    80005720:	00008797          	auipc	a5,0x8
    80005724:	83078793          	addi	a5,a5,-2000 # 8000cf50 <_ZTV12ProducerSync+0x10>
    80005728:	00f53023          	sd	a5,0(a0)
    8000572c:	ffffd097          	auipc	ra,0xffffd
    80005730:	060080e7          	jalr	96(ra) # 8000278c <_ZN6ThreadD1Ev>
    80005734:	00813083          	ld	ra,8(sp)
    80005738:	00013403          	ld	s0,0(sp)
    8000573c:	01010113          	addi	sp,sp,16
    80005740:	00008067          	ret

0000000080005744 <_ZN12ProducerSyncD0Ev>:
    80005744:	fe010113          	addi	sp,sp,-32
    80005748:	00113c23          	sd	ra,24(sp)
    8000574c:	00813823          	sd	s0,16(sp)
    80005750:	00913423          	sd	s1,8(sp)
    80005754:	02010413          	addi	s0,sp,32
    80005758:	00050493          	mv	s1,a0
    8000575c:	00007797          	auipc	a5,0x7
    80005760:	7f478793          	addi	a5,a5,2036 # 8000cf50 <_ZTV12ProducerSync+0x10>
    80005764:	00f53023          	sd	a5,0(a0)
    80005768:	ffffd097          	auipc	ra,0xffffd
    8000576c:	024080e7          	jalr	36(ra) # 8000278c <_ZN6ThreadD1Ev>
    80005770:	00048513          	mv	a0,s1
    80005774:	ffffd097          	auipc	ra,0xffffd
    80005778:	11c080e7          	jalr	284(ra) # 80002890 <_ZdlPv>
    8000577c:	01813083          	ld	ra,24(sp)
    80005780:	01013403          	ld	s0,16(sp)
    80005784:	00813483          	ld	s1,8(sp)
    80005788:	02010113          	addi	sp,sp,32
    8000578c:	00008067          	ret

0000000080005790 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005790:	ff010113          	addi	sp,sp,-16
    80005794:	00113423          	sd	ra,8(sp)
    80005798:	00813023          	sd	s0,0(sp)
    8000579c:	01010413          	addi	s0,sp,16
    800057a0:	00007797          	auipc	a5,0x7
    800057a4:	78878793          	addi	a5,a5,1928 # 8000cf28 <_ZTV16ProducerKeyboard+0x10>
    800057a8:	00f53023          	sd	a5,0(a0)
    800057ac:	ffffd097          	auipc	ra,0xffffd
    800057b0:	fe0080e7          	jalr	-32(ra) # 8000278c <_ZN6ThreadD1Ev>
    800057b4:	00813083          	ld	ra,8(sp)
    800057b8:	00013403          	ld	s0,0(sp)
    800057bc:	01010113          	addi	sp,sp,16
    800057c0:	00008067          	ret

00000000800057c4 <_ZN16ProducerKeyboardD0Ev>:
    800057c4:	fe010113          	addi	sp,sp,-32
    800057c8:	00113c23          	sd	ra,24(sp)
    800057cc:	00813823          	sd	s0,16(sp)
    800057d0:	00913423          	sd	s1,8(sp)
    800057d4:	02010413          	addi	s0,sp,32
    800057d8:	00050493          	mv	s1,a0
    800057dc:	00007797          	auipc	a5,0x7
    800057e0:	74c78793          	addi	a5,a5,1868 # 8000cf28 <_ZTV16ProducerKeyboard+0x10>
    800057e4:	00f53023          	sd	a5,0(a0)
    800057e8:	ffffd097          	auipc	ra,0xffffd
    800057ec:	fa4080e7          	jalr	-92(ra) # 8000278c <_ZN6ThreadD1Ev>
    800057f0:	00048513          	mv	a0,s1
    800057f4:	ffffd097          	auipc	ra,0xffffd
    800057f8:	09c080e7          	jalr	156(ra) # 80002890 <_ZdlPv>
    800057fc:	01813083          	ld	ra,24(sp)
    80005800:	01013403          	ld	s0,16(sp)
    80005804:	00813483          	ld	s1,8(sp)
    80005808:	02010113          	addi	sp,sp,32
    8000580c:	00008067          	ret

0000000080005810 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005810:	ff010113          	addi	sp,sp,-16
    80005814:	00113423          	sd	ra,8(sp)
    80005818:	00813023          	sd	s0,0(sp)
    8000581c:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005820:	02053583          	ld	a1,32(a0)
    80005824:	fffff097          	auipc	ra,0xfffff
    80005828:	7e4080e7          	jalr	2020(ra) # 80005008 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    8000582c:	00813083          	ld	ra,8(sp)
    80005830:	00013403          	ld	s0,0(sp)
    80005834:	01010113          	addi	sp,sp,16
    80005838:	00008067          	ret

000000008000583c <_ZN12ProducerSync3runEv>:
    void run() override {
    8000583c:	ff010113          	addi	sp,sp,-16
    80005840:	00113423          	sd	ra,8(sp)
    80005844:	00813023          	sd	s0,0(sp)
    80005848:	01010413          	addi	s0,sp,16
        producer(td);
    8000584c:	02053583          	ld	a1,32(a0)
    80005850:	00000097          	auipc	ra,0x0
    80005854:	878080e7          	jalr	-1928(ra) # 800050c8 <_ZN12ProducerSync8producerEPv>
    }
    80005858:	00813083          	ld	ra,8(sp)
    8000585c:	00013403          	ld	s0,0(sp)
    80005860:	01010113          	addi	sp,sp,16
    80005864:	00008067          	ret

0000000080005868 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005868:	ff010113          	addi	sp,sp,-16
    8000586c:	00113423          	sd	ra,8(sp)
    80005870:	00813023          	sd	s0,0(sp)
    80005874:	01010413          	addi	s0,sp,16
        consumer(td);
    80005878:	02053583          	ld	a1,32(a0)
    8000587c:	00000097          	auipc	ra,0x0
    80005880:	8e0080e7          	jalr	-1824(ra) # 8000515c <_ZN12ConsumerSync8consumerEPv>
    }
    80005884:	00813083          	ld	ra,8(sp)
    80005888:	00013403          	ld	s0,0(sp)
    8000588c:	01010113          	addi	sp,sp,16
    80005890:	00008067          	ret

0000000080005894 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005894:	fe010113          	addi	sp,sp,-32
    80005898:	00113c23          	sd	ra,24(sp)
    8000589c:	00813823          	sd	s0,16(sp)
    800058a0:	00913423          	sd	s1,8(sp)
    800058a4:	02010413          	addi	s0,sp,32
    800058a8:	00050493          	mv	s1,a0
    LOCK();
    800058ac:	00100613          	li	a2,1
    800058b0:	00000593          	li	a1,0
    800058b4:	00008517          	auipc	a0,0x8
    800058b8:	9bc50513          	addi	a0,a0,-1604 # 8000d270 <lockPrint>
    800058bc:	ffffc097          	auipc	ra,0xffffc
    800058c0:	868080e7          	jalr	-1944(ra) # 80001124 <copy_and_swap>
    800058c4:	00050863          	beqz	a0,800058d4 <_Z11printStringPKc+0x40>
    800058c8:	ffffc097          	auipc	ra,0xffffc
    800058cc:	bf8080e7          	jalr	-1032(ra) # 800014c0 <_Z15thread_dispatchv>
    800058d0:	fddff06f          	j	800058ac <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800058d4:	0004c503          	lbu	a0,0(s1)
    800058d8:	00050a63          	beqz	a0,800058ec <_Z11printStringPKc+0x58>
    {
        putc(*string);
    800058dc:	ffffc097          	auipc	ra,0xffffc
    800058e0:	d4c080e7          	jalr	-692(ra) # 80001628 <_Z4putcc>
        string++;
    800058e4:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800058e8:	fedff06f          	j	800058d4 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800058ec:	00000613          	li	a2,0
    800058f0:	00100593          	li	a1,1
    800058f4:	00008517          	auipc	a0,0x8
    800058f8:	97c50513          	addi	a0,a0,-1668 # 8000d270 <lockPrint>
    800058fc:	ffffc097          	auipc	ra,0xffffc
    80005900:	828080e7          	jalr	-2008(ra) # 80001124 <copy_and_swap>
    80005904:	fe0514e3          	bnez	a0,800058ec <_Z11printStringPKc+0x58>
}
    80005908:	01813083          	ld	ra,24(sp)
    8000590c:	01013403          	ld	s0,16(sp)
    80005910:	00813483          	ld	s1,8(sp)
    80005914:	02010113          	addi	sp,sp,32
    80005918:	00008067          	ret

000000008000591c <_Z9getStringPci>:

char* getString(char *buf, int max) {
    8000591c:	fd010113          	addi	sp,sp,-48
    80005920:	02113423          	sd	ra,40(sp)
    80005924:	02813023          	sd	s0,32(sp)
    80005928:	00913c23          	sd	s1,24(sp)
    8000592c:	01213823          	sd	s2,16(sp)
    80005930:	01313423          	sd	s3,8(sp)
    80005934:	01413023          	sd	s4,0(sp)
    80005938:	03010413          	addi	s0,sp,48
    8000593c:	00050993          	mv	s3,a0
    80005940:	00058a13          	mv	s4,a1
    LOCK();
    80005944:	00100613          	li	a2,1
    80005948:	00000593          	li	a1,0
    8000594c:	00008517          	auipc	a0,0x8
    80005950:	92450513          	addi	a0,a0,-1756 # 8000d270 <lockPrint>
    80005954:	ffffb097          	auipc	ra,0xffffb
    80005958:	7d0080e7          	jalr	2000(ra) # 80001124 <copy_and_swap>
    8000595c:	00050863          	beqz	a0,8000596c <_Z9getStringPci+0x50>
    80005960:	ffffc097          	auipc	ra,0xffffc
    80005964:	b60080e7          	jalr	-1184(ra) # 800014c0 <_Z15thread_dispatchv>
    80005968:	fddff06f          	j	80005944 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    8000596c:	00000913          	li	s2,0
    80005970:	00090493          	mv	s1,s2
    80005974:	0019091b          	addiw	s2,s2,1
    80005978:	03495a63          	bge	s2,s4,800059ac <_Z9getStringPci+0x90>
        cc = getc();
    8000597c:	ffffc097          	auipc	ra,0xffffc
    80005980:	c84080e7          	jalr	-892(ra) # 80001600 <_Z4getcv>
        if(cc < 1)
    80005984:	02050463          	beqz	a0,800059ac <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005988:	009984b3          	add	s1,s3,s1
    8000598c:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005990:	00a00793          	li	a5,10
    80005994:	00f50a63          	beq	a0,a5,800059a8 <_Z9getStringPci+0x8c>
    80005998:	00d00793          	li	a5,13
    8000599c:	fcf51ae3          	bne	a0,a5,80005970 <_Z9getStringPci+0x54>
        buf[i++] = c;
    800059a0:	00090493          	mv	s1,s2
    800059a4:	0080006f          	j	800059ac <_Z9getStringPci+0x90>
    800059a8:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800059ac:	009984b3          	add	s1,s3,s1
    800059b0:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800059b4:	00000613          	li	a2,0
    800059b8:	00100593          	li	a1,1
    800059bc:	00008517          	auipc	a0,0x8
    800059c0:	8b450513          	addi	a0,a0,-1868 # 8000d270 <lockPrint>
    800059c4:	ffffb097          	auipc	ra,0xffffb
    800059c8:	760080e7          	jalr	1888(ra) # 80001124 <copy_and_swap>
    800059cc:	fe0514e3          	bnez	a0,800059b4 <_Z9getStringPci+0x98>
    return buf;
}
    800059d0:	00098513          	mv	a0,s3
    800059d4:	02813083          	ld	ra,40(sp)
    800059d8:	02013403          	ld	s0,32(sp)
    800059dc:	01813483          	ld	s1,24(sp)
    800059e0:	01013903          	ld	s2,16(sp)
    800059e4:	00813983          	ld	s3,8(sp)
    800059e8:	00013a03          	ld	s4,0(sp)
    800059ec:	03010113          	addi	sp,sp,48
    800059f0:	00008067          	ret

00000000800059f4 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800059f4:	ff010113          	addi	sp,sp,-16
    800059f8:	00813423          	sd	s0,8(sp)
    800059fc:	01010413          	addi	s0,sp,16
    80005a00:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005a04:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005a08:	0006c603          	lbu	a2,0(a3)
    80005a0c:	fd06071b          	addiw	a4,a2,-48
    80005a10:	0ff77713          	andi	a4,a4,255
    80005a14:	00900793          	li	a5,9
    80005a18:	02e7e063          	bltu	a5,a4,80005a38 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005a1c:	0025179b          	slliw	a5,a0,0x2
    80005a20:	00a787bb          	addw	a5,a5,a0
    80005a24:	0017979b          	slliw	a5,a5,0x1
    80005a28:	00168693          	addi	a3,a3,1
    80005a2c:	00c787bb          	addw	a5,a5,a2
    80005a30:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005a34:	fd5ff06f          	j	80005a08 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005a38:	00813403          	ld	s0,8(sp)
    80005a3c:	01010113          	addi	sp,sp,16
    80005a40:	00008067          	ret

0000000080005a44 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005a44:	fc010113          	addi	sp,sp,-64
    80005a48:	02113c23          	sd	ra,56(sp)
    80005a4c:	02813823          	sd	s0,48(sp)
    80005a50:	02913423          	sd	s1,40(sp)
    80005a54:	03213023          	sd	s2,32(sp)
    80005a58:	01313c23          	sd	s3,24(sp)
    80005a5c:	04010413          	addi	s0,sp,64
    80005a60:	00050493          	mv	s1,a0
    80005a64:	00058913          	mv	s2,a1
    80005a68:	00060993          	mv	s3,a2
    LOCK();
    80005a6c:	00100613          	li	a2,1
    80005a70:	00000593          	li	a1,0
    80005a74:	00007517          	auipc	a0,0x7
    80005a78:	7fc50513          	addi	a0,a0,2044 # 8000d270 <lockPrint>
    80005a7c:	ffffb097          	auipc	ra,0xffffb
    80005a80:	6a8080e7          	jalr	1704(ra) # 80001124 <copy_and_swap>
    80005a84:	00050863          	beqz	a0,80005a94 <_Z8printIntiii+0x50>
    80005a88:	ffffc097          	auipc	ra,0xffffc
    80005a8c:	a38080e7          	jalr	-1480(ra) # 800014c0 <_Z15thread_dispatchv>
    80005a90:	fddff06f          	j	80005a6c <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005a94:	00098463          	beqz	s3,80005a9c <_Z8printIntiii+0x58>
    80005a98:	0804c463          	bltz	s1,80005b20 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005a9c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005aa0:	00000593          	li	a1,0
    }

    i = 0;
    80005aa4:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005aa8:	0009079b          	sext.w	a5,s2
    80005aac:	0325773b          	remuw	a4,a0,s2
    80005ab0:	00048613          	mv	a2,s1
    80005ab4:	0014849b          	addiw	s1,s1,1
    80005ab8:	02071693          	slli	a3,a4,0x20
    80005abc:	0206d693          	srli	a3,a3,0x20
    80005ac0:	00007717          	auipc	a4,0x7
    80005ac4:	4d070713          	addi	a4,a4,1232 # 8000cf90 <digits>
    80005ac8:	00d70733          	add	a4,a4,a3
    80005acc:	00074683          	lbu	a3,0(a4)
    80005ad0:	fd040713          	addi	a4,s0,-48
    80005ad4:	00c70733          	add	a4,a4,a2
    80005ad8:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005adc:	0005071b          	sext.w	a4,a0
    80005ae0:	0325553b          	divuw	a0,a0,s2
    80005ae4:	fcf772e3          	bgeu	a4,a5,80005aa8 <_Z8printIntiii+0x64>
    if(neg)
    80005ae8:	00058c63          	beqz	a1,80005b00 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005aec:	fd040793          	addi	a5,s0,-48
    80005af0:	009784b3          	add	s1,a5,s1
    80005af4:	02d00793          	li	a5,45
    80005af8:	fef48823          	sb	a5,-16(s1)
    80005afc:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005b00:	fff4849b          	addiw	s1,s1,-1
    80005b04:	0204c463          	bltz	s1,80005b2c <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005b08:	fd040793          	addi	a5,s0,-48
    80005b0c:	009787b3          	add	a5,a5,s1
    80005b10:	ff07c503          	lbu	a0,-16(a5)
    80005b14:	ffffc097          	auipc	ra,0xffffc
    80005b18:	b14080e7          	jalr	-1260(ra) # 80001628 <_Z4putcc>
    80005b1c:	fe5ff06f          	j	80005b00 <_Z8printIntiii+0xbc>
        x = -xx;
    80005b20:	4090053b          	negw	a0,s1
        neg = 1;
    80005b24:	00100593          	li	a1,1
        x = -xx;
    80005b28:	f7dff06f          	j	80005aa4 <_Z8printIntiii+0x60>

    UNLOCK();
    80005b2c:	00000613          	li	a2,0
    80005b30:	00100593          	li	a1,1
    80005b34:	00007517          	auipc	a0,0x7
    80005b38:	73c50513          	addi	a0,a0,1852 # 8000d270 <lockPrint>
    80005b3c:	ffffb097          	auipc	ra,0xffffb
    80005b40:	5e8080e7          	jalr	1512(ra) # 80001124 <copy_and_swap>
    80005b44:	fe0514e3          	bnez	a0,80005b2c <_Z8printIntiii+0xe8>
    80005b48:	03813083          	ld	ra,56(sp)
    80005b4c:	03013403          	ld	s0,48(sp)
    80005b50:	02813483          	ld	s1,40(sp)
    80005b54:	02013903          	ld	s2,32(sp)
    80005b58:	01813983          	ld	s3,24(sp)
    80005b5c:	04010113          	addi	sp,sp,64
    80005b60:	00008067          	ret

0000000080005b64 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005b64:	fd010113          	addi	sp,sp,-48
    80005b68:	02113423          	sd	ra,40(sp)
    80005b6c:	02813023          	sd	s0,32(sp)
    80005b70:	00913c23          	sd	s1,24(sp)
    80005b74:	01213823          	sd	s2,16(sp)
    80005b78:	01313423          	sd	s3,8(sp)
    80005b7c:	03010413          	addi	s0,sp,48
    80005b80:	00050493          	mv	s1,a0
    80005b84:	00058913          	mv	s2,a1
    80005b88:	0015879b          	addiw	a5,a1,1
    80005b8c:	0007851b          	sext.w	a0,a5
    80005b90:	00f4a023          	sw	a5,0(s1)
    80005b94:	0004a823          	sw	zero,16(s1)
    80005b98:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005b9c:	00251513          	slli	a0,a0,0x2
    80005ba0:	ffffb097          	auipc	ra,0xffffb
    80005ba4:	7f4080e7          	jalr	2036(ra) # 80001394 <_Z9mem_allocm>
    80005ba8:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005bac:	01000513          	li	a0,16
    80005bb0:	ffffd097          	auipc	ra,0xffffd
    80005bb4:	c90080e7          	jalr	-880(ra) # 80002840 <_Znwm>
    80005bb8:	00050993          	mv	s3,a0
    80005bbc:	00000593          	li	a1,0
    80005bc0:	ffffd097          	auipc	ra,0xffffd
    80005bc4:	fec080e7          	jalr	-20(ra) # 80002bac <_ZN9SemaphoreC1Ej>
    80005bc8:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005bcc:	01000513          	li	a0,16
    80005bd0:	ffffd097          	auipc	ra,0xffffd
    80005bd4:	c70080e7          	jalr	-912(ra) # 80002840 <_Znwm>
    80005bd8:	00050993          	mv	s3,a0
    80005bdc:	00090593          	mv	a1,s2
    80005be0:	ffffd097          	auipc	ra,0xffffd
    80005be4:	fcc080e7          	jalr	-52(ra) # 80002bac <_ZN9SemaphoreC1Ej>
    80005be8:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005bec:	01000513          	li	a0,16
    80005bf0:	ffffd097          	auipc	ra,0xffffd
    80005bf4:	c50080e7          	jalr	-944(ra) # 80002840 <_Znwm>
    80005bf8:	00050913          	mv	s2,a0
    80005bfc:	00100593          	li	a1,1
    80005c00:	ffffd097          	auipc	ra,0xffffd
    80005c04:	fac080e7          	jalr	-84(ra) # 80002bac <_ZN9SemaphoreC1Ej>
    80005c08:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005c0c:	01000513          	li	a0,16
    80005c10:	ffffd097          	auipc	ra,0xffffd
    80005c14:	c30080e7          	jalr	-976(ra) # 80002840 <_Znwm>
    80005c18:	00050913          	mv	s2,a0
    80005c1c:	00100593          	li	a1,1
    80005c20:	ffffd097          	auipc	ra,0xffffd
    80005c24:	f8c080e7          	jalr	-116(ra) # 80002bac <_ZN9SemaphoreC1Ej>
    80005c28:	0324b823          	sd	s2,48(s1)
}
    80005c2c:	02813083          	ld	ra,40(sp)
    80005c30:	02013403          	ld	s0,32(sp)
    80005c34:	01813483          	ld	s1,24(sp)
    80005c38:	01013903          	ld	s2,16(sp)
    80005c3c:	00813983          	ld	s3,8(sp)
    80005c40:	03010113          	addi	sp,sp,48
    80005c44:	00008067          	ret
    80005c48:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005c4c:	00098513          	mv	a0,s3
    80005c50:	ffffd097          	auipc	ra,0xffffd
    80005c54:	c40080e7          	jalr	-960(ra) # 80002890 <_ZdlPv>
    80005c58:	00048513          	mv	a0,s1
    80005c5c:	00008097          	auipc	ra,0x8
    80005c60:	71c080e7          	jalr	1820(ra) # 8000e378 <_Unwind_Resume>
    80005c64:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005c68:	00098513          	mv	a0,s3
    80005c6c:	ffffd097          	auipc	ra,0xffffd
    80005c70:	c24080e7          	jalr	-988(ra) # 80002890 <_ZdlPv>
    80005c74:	00048513          	mv	a0,s1
    80005c78:	00008097          	auipc	ra,0x8
    80005c7c:	700080e7          	jalr	1792(ra) # 8000e378 <_Unwind_Resume>
    80005c80:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005c84:	00090513          	mv	a0,s2
    80005c88:	ffffd097          	auipc	ra,0xffffd
    80005c8c:	c08080e7          	jalr	-1016(ra) # 80002890 <_ZdlPv>
    80005c90:	00048513          	mv	a0,s1
    80005c94:	00008097          	auipc	ra,0x8
    80005c98:	6e4080e7          	jalr	1764(ra) # 8000e378 <_Unwind_Resume>
    80005c9c:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005ca0:	00090513          	mv	a0,s2
    80005ca4:	ffffd097          	auipc	ra,0xffffd
    80005ca8:	bec080e7          	jalr	-1044(ra) # 80002890 <_ZdlPv>
    80005cac:	00048513          	mv	a0,s1
    80005cb0:	00008097          	auipc	ra,0x8
    80005cb4:	6c8080e7          	jalr	1736(ra) # 8000e378 <_Unwind_Resume>

0000000080005cb8 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005cb8:	fe010113          	addi	sp,sp,-32
    80005cbc:	00113c23          	sd	ra,24(sp)
    80005cc0:	00813823          	sd	s0,16(sp)
    80005cc4:	00913423          	sd	s1,8(sp)
    80005cc8:	01213023          	sd	s2,0(sp)
    80005ccc:	02010413          	addi	s0,sp,32
    80005cd0:	00050493          	mv	s1,a0
    80005cd4:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005cd8:	01853503          	ld	a0,24(a0)
    80005cdc:	ffffd097          	auipc	ra,0xffffd
    80005ce0:	f08080e7          	jalr	-248(ra) # 80002be4 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005ce4:	0304b503          	ld	a0,48(s1)
    80005ce8:	ffffd097          	auipc	ra,0xffffd
    80005cec:	efc080e7          	jalr	-260(ra) # 80002be4 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005cf0:	0084b783          	ld	a5,8(s1)
    80005cf4:	0144a703          	lw	a4,20(s1)
    80005cf8:	00271713          	slli	a4,a4,0x2
    80005cfc:	00e787b3          	add	a5,a5,a4
    80005d00:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005d04:	0144a783          	lw	a5,20(s1)
    80005d08:	0017879b          	addiw	a5,a5,1
    80005d0c:	0004a703          	lw	a4,0(s1)
    80005d10:	02e7e7bb          	remw	a5,a5,a4
    80005d14:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005d18:	0304b503          	ld	a0,48(s1)
    80005d1c:	ffffd097          	auipc	ra,0xffffd
    80005d20:	ef4080e7          	jalr	-268(ra) # 80002c10 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005d24:	0204b503          	ld	a0,32(s1)
    80005d28:	ffffd097          	auipc	ra,0xffffd
    80005d2c:	ee8080e7          	jalr	-280(ra) # 80002c10 <_ZN9Semaphore6signalEv>

}
    80005d30:	01813083          	ld	ra,24(sp)
    80005d34:	01013403          	ld	s0,16(sp)
    80005d38:	00813483          	ld	s1,8(sp)
    80005d3c:	00013903          	ld	s2,0(sp)
    80005d40:	02010113          	addi	sp,sp,32
    80005d44:	00008067          	ret

0000000080005d48 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005d48:	fe010113          	addi	sp,sp,-32
    80005d4c:	00113c23          	sd	ra,24(sp)
    80005d50:	00813823          	sd	s0,16(sp)
    80005d54:	00913423          	sd	s1,8(sp)
    80005d58:	01213023          	sd	s2,0(sp)
    80005d5c:	02010413          	addi	s0,sp,32
    80005d60:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005d64:	02053503          	ld	a0,32(a0)
    80005d68:	ffffd097          	auipc	ra,0xffffd
    80005d6c:	e7c080e7          	jalr	-388(ra) # 80002be4 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005d70:	0284b503          	ld	a0,40(s1)
    80005d74:	ffffd097          	auipc	ra,0xffffd
    80005d78:	e70080e7          	jalr	-400(ra) # 80002be4 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005d7c:	0084b703          	ld	a4,8(s1)
    80005d80:	0104a783          	lw	a5,16(s1)
    80005d84:	00279693          	slli	a3,a5,0x2
    80005d88:	00d70733          	add	a4,a4,a3
    80005d8c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005d90:	0017879b          	addiw	a5,a5,1
    80005d94:	0004a703          	lw	a4,0(s1)
    80005d98:	02e7e7bb          	remw	a5,a5,a4
    80005d9c:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005da0:	0284b503          	ld	a0,40(s1)
    80005da4:	ffffd097          	auipc	ra,0xffffd
    80005da8:	e6c080e7          	jalr	-404(ra) # 80002c10 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005dac:	0184b503          	ld	a0,24(s1)
    80005db0:	ffffd097          	auipc	ra,0xffffd
    80005db4:	e60080e7          	jalr	-416(ra) # 80002c10 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005db8:	00090513          	mv	a0,s2
    80005dbc:	01813083          	ld	ra,24(sp)
    80005dc0:	01013403          	ld	s0,16(sp)
    80005dc4:	00813483          	ld	s1,8(sp)
    80005dc8:	00013903          	ld	s2,0(sp)
    80005dcc:	02010113          	addi	sp,sp,32
    80005dd0:	00008067          	ret

0000000080005dd4 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005dd4:	fe010113          	addi	sp,sp,-32
    80005dd8:	00113c23          	sd	ra,24(sp)
    80005ddc:	00813823          	sd	s0,16(sp)
    80005de0:	00913423          	sd	s1,8(sp)
    80005de4:	01213023          	sd	s2,0(sp)
    80005de8:	02010413          	addi	s0,sp,32
    80005dec:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005df0:	02853503          	ld	a0,40(a0)
    80005df4:	ffffd097          	auipc	ra,0xffffd
    80005df8:	df0080e7          	jalr	-528(ra) # 80002be4 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005dfc:	0304b503          	ld	a0,48(s1)
    80005e00:	ffffd097          	auipc	ra,0xffffd
    80005e04:	de4080e7          	jalr	-540(ra) # 80002be4 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005e08:	0144a783          	lw	a5,20(s1)
    80005e0c:	0104a903          	lw	s2,16(s1)
    80005e10:	0327ce63          	blt	a5,s2,80005e4c <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80005e14:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005e18:	0304b503          	ld	a0,48(s1)
    80005e1c:	ffffd097          	auipc	ra,0xffffd
    80005e20:	df4080e7          	jalr	-524(ra) # 80002c10 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80005e24:	0284b503          	ld	a0,40(s1)
    80005e28:	ffffd097          	auipc	ra,0xffffd
    80005e2c:	de8080e7          	jalr	-536(ra) # 80002c10 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005e30:	00090513          	mv	a0,s2
    80005e34:	01813083          	ld	ra,24(sp)
    80005e38:	01013403          	ld	s0,16(sp)
    80005e3c:	00813483          	ld	s1,8(sp)
    80005e40:	00013903          	ld	s2,0(sp)
    80005e44:	02010113          	addi	sp,sp,32
    80005e48:	00008067          	ret
        ret = cap - head + tail;
    80005e4c:	0004a703          	lw	a4,0(s1)
    80005e50:	4127093b          	subw	s2,a4,s2
    80005e54:	00f9093b          	addw	s2,s2,a5
    80005e58:	fc1ff06f          	j	80005e18 <_ZN9BufferCPP6getCntEv+0x44>

0000000080005e5c <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80005e5c:	fe010113          	addi	sp,sp,-32
    80005e60:	00113c23          	sd	ra,24(sp)
    80005e64:	00813823          	sd	s0,16(sp)
    80005e68:	00913423          	sd	s1,8(sp)
    80005e6c:	02010413          	addi	s0,sp,32
    80005e70:	00050493          	mv	s1,a0
    Console::putc('\n');
    80005e74:	00a00513          	li	a0,10
    80005e78:	ffffd097          	auipc	ra,0xffffd
    80005e7c:	e6c080e7          	jalr	-404(ra) # 80002ce4 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80005e80:	00004517          	auipc	a0,0x4
    80005e84:	59850513          	addi	a0,a0,1432 # 8000a418 <CONSOLE_STATUS+0x408>
    80005e88:	00000097          	auipc	ra,0x0
    80005e8c:	a0c080e7          	jalr	-1524(ra) # 80005894 <_Z11printStringPKc>
    while (getCnt()) {
    80005e90:	00048513          	mv	a0,s1
    80005e94:	00000097          	auipc	ra,0x0
    80005e98:	f40080e7          	jalr	-192(ra) # 80005dd4 <_ZN9BufferCPP6getCntEv>
    80005e9c:	02050c63          	beqz	a0,80005ed4 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80005ea0:	0084b783          	ld	a5,8(s1)
    80005ea4:	0104a703          	lw	a4,16(s1)
    80005ea8:	00271713          	slli	a4,a4,0x2
    80005eac:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80005eb0:	0007c503          	lbu	a0,0(a5)
    80005eb4:	ffffd097          	auipc	ra,0xffffd
    80005eb8:	e30080e7          	jalr	-464(ra) # 80002ce4 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80005ebc:	0104a783          	lw	a5,16(s1)
    80005ec0:	0017879b          	addiw	a5,a5,1
    80005ec4:	0004a703          	lw	a4,0(s1)
    80005ec8:	02e7e7bb          	remw	a5,a5,a4
    80005ecc:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80005ed0:	fc1ff06f          	j	80005e90 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80005ed4:	02100513          	li	a0,33
    80005ed8:	ffffd097          	auipc	ra,0xffffd
    80005edc:	e0c080e7          	jalr	-500(ra) # 80002ce4 <_ZN7Console4putcEc>
    Console::putc('\n');
    80005ee0:	00a00513          	li	a0,10
    80005ee4:	ffffd097          	auipc	ra,0xffffd
    80005ee8:	e00080e7          	jalr	-512(ra) # 80002ce4 <_ZN7Console4putcEc>
    mem_free(buffer);
    80005eec:	0084b503          	ld	a0,8(s1)
    80005ef0:	ffffb097          	auipc	ra,0xffffb
    80005ef4:	4e4080e7          	jalr	1252(ra) # 800013d4 <_Z8mem_freePv>
    delete itemAvailable;
    80005ef8:	0204b503          	ld	a0,32(s1)
    80005efc:	00050863          	beqz	a0,80005f0c <_ZN9BufferCPPD1Ev+0xb0>
    80005f00:	00053783          	ld	a5,0(a0)
    80005f04:	0087b783          	ld	a5,8(a5)
    80005f08:	000780e7          	jalr	a5
    delete spaceAvailable;
    80005f0c:	0184b503          	ld	a0,24(s1)
    80005f10:	00050863          	beqz	a0,80005f20 <_ZN9BufferCPPD1Ev+0xc4>
    80005f14:	00053783          	ld	a5,0(a0)
    80005f18:	0087b783          	ld	a5,8(a5)
    80005f1c:	000780e7          	jalr	a5
    delete mutexTail;
    80005f20:	0304b503          	ld	a0,48(s1)
    80005f24:	00050863          	beqz	a0,80005f34 <_ZN9BufferCPPD1Ev+0xd8>
    80005f28:	00053783          	ld	a5,0(a0)
    80005f2c:	0087b783          	ld	a5,8(a5)
    80005f30:	000780e7          	jalr	a5
    delete mutexHead;
    80005f34:	0284b503          	ld	a0,40(s1)
    80005f38:	00050863          	beqz	a0,80005f48 <_ZN9BufferCPPD1Ev+0xec>
    80005f3c:	00053783          	ld	a5,0(a0)
    80005f40:	0087b783          	ld	a5,8(a5)
    80005f44:	000780e7          	jalr	a5
}
    80005f48:	01813083          	ld	ra,24(sp)
    80005f4c:	01013403          	ld	s0,16(sp)
    80005f50:	00813483          	ld	s1,8(sp)
    80005f54:	02010113          	addi	sp,sp,32
    80005f58:	00008067          	ret

0000000080005f5c <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80005f5c:	fe010113          	addi	sp,sp,-32
    80005f60:	00113c23          	sd	ra,24(sp)
    80005f64:	00813823          	sd	s0,16(sp)
    80005f68:	00913423          	sd	s1,8(sp)
    80005f6c:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80005f70:	00004517          	auipc	a0,0x4
    80005f74:	4c050513          	addi	a0,a0,1216 # 8000a430 <CONSOLE_STATUS+0x420>
    80005f78:	00000097          	auipc	ra,0x0
    80005f7c:	91c080e7          	jalr	-1764(ra) # 80005894 <_Z11printStringPKc>
    int test = getc() - '0';
    80005f80:	ffffb097          	auipc	ra,0xffffb
    80005f84:	680080e7          	jalr	1664(ra) # 80001600 <_Z4getcv>
    80005f88:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80005f8c:	ffffb097          	auipc	ra,0xffffb
    80005f90:	674080e7          	jalr	1652(ra) # 80001600 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80005f94:	00700793          	li	a5,7
    80005f98:	1097e263          	bltu	a5,s1,8000609c <_Z8userMainv+0x140>
    80005f9c:	00249493          	slli	s1,s1,0x2
    80005fa0:	00004717          	auipc	a4,0x4
    80005fa4:	6e870713          	addi	a4,a4,1768 # 8000a688 <CONSOLE_STATUS+0x678>
    80005fa8:	00e484b3          	add	s1,s1,a4
    80005fac:	0004a783          	lw	a5,0(s1)
    80005fb0:	00e787b3          	add	a5,a5,a4
    80005fb4:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80005fb8:	fffff097          	auipc	ra,0xfffff
    80005fbc:	f54080e7          	jalr	-172(ra) # 80004f0c <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80005fc0:	00004517          	auipc	a0,0x4
    80005fc4:	49050513          	addi	a0,a0,1168 # 8000a450 <CONSOLE_STATUS+0x440>
    80005fc8:	00000097          	auipc	ra,0x0
    80005fcc:	8cc080e7          	jalr	-1844(ra) # 80005894 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80005fd0:	01813083          	ld	ra,24(sp)
    80005fd4:	01013403          	ld	s0,16(sp)
    80005fd8:	00813483          	ld	s1,8(sp)
    80005fdc:	02010113          	addi	sp,sp,32
    80005fe0:	00008067          	ret
            Threads_CPP_API_test();
    80005fe4:	ffffe097          	auipc	ra,0xffffe
    80005fe8:	e08080e7          	jalr	-504(ra) # 80003dec <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80005fec:	00004517          	auipc	a0,0x4
    80005ff0:	4a450513          	addi	a0,a0,1188 # 8000a490 <CONSOLE_STATUS+0x480>
    80005ff4:	00000097          	auipc	ra,0x0
    80005ff8:	8a0080e7          	jalr	-1888(ra) # 80005894 <_Z11printStringPKc>
            break;
    80005ffc:	fd5ff06f          	j	80005fd0 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006000:	ffffd097          	auipc	ra,0xffffd
    80006004:	640080e7          	jalr	1600(ra) # 80003640 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006008:	00004517          	auipc	a0,0x4
    8000600c:	4c850513          	addi	a0,a0,1224 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80006010:	00000097          	auipc	ra,0x0
    80006014:	884080e7          	jalr	-1916(ra) # 80005894 <_Z11printStringPKc>
            break;
    80006018:	fb9ff06f          	j	80005fd0 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    8000601c:	fffff097          	auipc	ra,0xfffff
    80006020:	234080e7          	jalr	564(ra) # 80005250 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006024:	00004517          	auipc	a0,0x4
    80006028:	4fc50513          	addi	a0,a0,1276 # 8000a520 <CONSOLE_STATUS+0x510>
    8000602c:	00000097          	auipc	ra,0x0
    80006030:	868080e7          	jalr	-1944(ra) # 80005894 <_Z11printStringPKc>
            break;
    80006034:	f9dff06f          	j	80005fd0 <_Z8userMainv+0x74>
            testSleeping();
    80006038:	00000097          	auipc	ra,0x0
    8000603c:	11c080e7          	jalr	284(ra) # 80006154 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006040:	00004517          	auipc	a0,0x4
    80006044:	53850513          	addi	a0,a0,1336 # 8000a578 <CONSOLE_STATUS+0x568>
    80006048:	00000097          	auipc	ra,0x0
    8000604c:	84c080e7          	jalr	-1972(ra) # 80005894 <_Z11printStringPKc>
            break;
    80006050:	f81ff06f          	j	80005fd0 <_Z8userMainv+0x74>
            testConsumerProducer();
    80006054:	ffffe097          	auipc	ra,0xffffe
    80006058:	258080e7          	jalr	600(ra) # 800042ac <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    8000605c:	00004517          	auipc	a0,0x4
    80006060:	54c50513          	addi	a0,a0,1356 # 8000a5a8 <CONSOLE_STATUS+0x598>
    80006064:	00000097          	auipc	ra,0x0
    80006068:	830080e7          	jalr	-2000(ra) # 80005894 <_Z11printStringPKc>
            break;
    8000606c:	f65ff06f          	j	80005fd0 <_Z8userMainv+0x74>
            System_Mode_test();
    80006070:	00000097          	auipc	ra,0x0
    80006074:	658080e7          	jalr	1624(ra) # 800066c8 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006078:	00004517          	auipc	a0,0x4
    8000607c:	57050513          	addi	a0,a0,1392 # 8000a5e8 <CONSOLE_STATUS+0x5d8>
    80006080:	00000097          	auipc	ra,0x0
    80006084:	814080e7          	jalr	-2028(ra) # 80005894 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006088:	00004517          	auipc	a0,0x4
    8000608c:	58050513          	addi	a0,a0,1408 # 8000a608 <CONSOLE_STATUS+0x5f8>
    80006090:	00000097          	auipc	ra,0x0
    80006094:	804080e7          	jalr	-2044(ra) # 80005894 <_Z11printStringPKc>
            break;
    80006098:	f39ff06f          	j	80005fd0 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    8000609c:	00004517          	auipc	a0,0x4
    800060a0:	5c450513          	addi	a0,a0,1476 # 8000a660 <CONSOLE_STATUS+0x650>
    800060a4:	fffff097          	auipc	ra,0xfffff
    800060a8:	7f0080e7          	jalr	2032(ra) # 80005894 <_Z11printStringPKc>
    800060ac:	f25ff06f          	j	80005fd0 <_Z8userMainv+0x74>

00000000800060b0 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void* arg) {
    800060b0:	fe010113          	addi	sp,sp,-32
    800060b4:	00113c23          	sd	ra,24(sp)
    800060b8:	00813823          	sd	s0,16(sp)
    800060bc:	00913423          	sd	s1,8(sp)
    800060c0:	01213023          	sd	s2,0(sp)
    800060c4:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t*)arg);
    800060c8:	00053903          	ld	s2,0(a0)
    int i = 6;
    800060cc:	00600493          	li	s1,6
    while (--i > 0) {
    800060d0:	fff4849b          	addiw	s1,s1,-1
    800060d4:	04905463          	blez	s1,8000611c <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    800060d8:	00004517          	auipc	a0,0x4
    800060dc:	5d050513          	addi	a0,a0,1488 # 8000a6a8 <CONSOLE_STATUS+0x698>
    800060e0:	fffff097          	auipc	ra,0xfffff
    800060e4:	7b4080e7          	jalr	1972(ra) # 80005894 <_Z11printStringPKc>
        printInt(sleep_time);
    800060e8:	00000613          	li	a2,0
    800060ec:	00a00593          	li	a1,10
    800060f0:	0009051b          	sext.w	a0,s2
    800060f4:	00000097          	auipc	ra,0x0
    800060f8:	950080e7          	jalr	-1712(ra) # 80005a44 <_Z8printIntiii>
        printString(" !\n");
    800060fc:	00004517          	auipc	a0,0x4
    80006100:	5b450513          	addi	a0,a0,1460 # 8000a6b0 <CONSOLE_STATUS+0x6a0>
    80006104:	fffff097          	auipc	ra,0xfffff
    80006108:	790080e7          	jalr	1936(ra) # 80005894 <_Z11printStringPKc>
        time_sleep(sleep_time);
    8000610c:	00090513          	mv	a0,s2
    80006110:	ffffb097          	auipc	ra,0xffffb
    80006114:	3f8080e7          	jalr	1016(ra) # 80001508 <_Z10time_sleepm>
    while (--i > 0) {
    80006118:	fb9ff06f          	j	800060d0 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time / 10 - 1] = true;
    8000611c:	00a00793          	li	a5,10
    80006120:	02f95933          	divu	s2,s2,a5
    80006124:	fff90913          	addi	s2,s2,-1
    80006128:	00007797          	auipc	a5,0x7
    8000612c:	15078793          	addi	a5,a5,336 # 8000d278 <_ZL8finished>
    80006130:	01278933          	add	s2,a5,s2
    80006134:	00100793          	li	a5,1
    80006138:	00f90023          	sb	a5,0(s2)
}
    8000613c:	01813083          	ld	ra,24(sp)
    80006140:	01013403          	ld	s0,16(sp)
    80006144:	00813483          	ld	s1,8(sp)
    80006148:	00013903          	ld	s2,0(sp)
    8000614c:	02010113          	addi	sp,sp,32
    80006150:	00008067          	ret

0000000080006154 <_Z12testSleepingv>:
        printInt(counter++);
        printString("\n");
    }
};

void testSleeping() {
    80006154:	fc010113          	addi	sp,sp,-64
    80006158:	02113c23          	sd	ra,56(sp)
    8000615c:	02813823          	sd	s0,48(sp)
    80006160:	02913423          	sd	s1,40(sp)
    80006164:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006168:	00a00793          	li	a5,10
    8000616c:	fcf43823          	sd	a5,-48(s0)
    80006170:	01400793          	li	a5,20
    80006174:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];
    //timer t;
    //t.start();
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006178:	00000493          	li	s1,0
    8000617c:	02c0006f          	j	800061a8 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006180:	00349793          	slli	a5,s1,0x3
    80006184:	fd040613          	addi	a2,s0,-48
    80006188:	00f60633          	add	a2,a2,a5
    8000618c:	00000597          	auipc	a1,0x0
    80006190:	f2458593          	addi	a1,a1,-220 # 800060b0 <_ZL9sleepyRunPv>
    80006194:	fc040513          	addi	a0,s0,-64
    80006198:	00f50533          	add	a0,a0,a5
    8000619c:	ffffb097          	auipc	ra,0xffffb
    800061a0:	268080e7          	jalr	616(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800061a4:	0014849b          	addiw	s1,s1,1
    800061a8:	00100793          	li	a5,1
    800061ac:	fc97dae3          	bge	a5,s1,80006180 <_Z12testSleepingv+0x2c>
    }
    while (!(finished[0] && finished[1])) {}
    800061b0:	00007797          	auipc	a5,0x7
    800061b4:	0c87c783          	lbu	a5,200(a5) # 8000d278 <_ZL8finished>
    800061b8:	fe078ce3          	beqz	a5,800061b0 <_Z12testSleepingv+0x5c>
    800061bc:	00007797          	auipc	a5,0x7
    800061c0:	0bd7c783          	lbu	a5,189(a5) # 8000d279 <_ZL8finished+0x1>
    800061c4:	fe0786e3          	beqz	a5,800061b0 <_Z12testSleepingv+0x5c>
    //t.terminate();
    //t.join();
}
    800061c8:	03813083          	ld	ra,56(sp)
    800061cc:	03013403          	ld	s0,48(sp)
    800061d0:	02813483          	ld	s1,40(sp)
    800061d4:	04010113          	addi	sp,sp,64
    800061d8:	00008067          	ret

00000000800061dc <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800061dc:	fe010113          	addi	sp,sp,-32
    800061e0:	00113c23          	sd	ra,24(sp)
    800061e4:	00813823          	sd	s0,16(sp)
    800061e8:	00913423          	sd	s1,8(sp)
    800061ec:	01213023          	sd	s2,0(sp)
    800061f0:	02010413          	addi	s0,sp,32
    800061f4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800061f8:	00100793          	li	a5,1
    800061fc:	02a7f863          	bgeu	a5,a0,8000622c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006200:	00a00793          	li	a5,10
    80006204:	02f577b3          	remu	a5,a0,a5
    80006208:	02078e63          	beqz	a5,80006244 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000620c:	fff48513          	addi	a0,s1,-1
    80006210:	00000097          	auipc	ra,0x0
    80006214:	fcc080e7          	jalr	-52(ra) # 800061dc <_ZL9fibonaccim>
    80006218:	00050913          	mv	s2,a0
    8000621c:	ffe48513          	addi	a0,s1,-2
    80006220:	00000097          	auipc	ra,0x0
    80006224:	fbc080e7          	jalr	-68(ra) # 800061dc <_ZL9fibonaccim>
    80006228:	00a90533          	add	a0,s2,a0
}
    8000622c:	01813083          	ld	ra,24(sp)
    80006230:	01013403          	ld	s0,16(sp)
    80006234:	00813483          	ld	s1,8(sp)
    80006238:	00013903          	ld	s2,0(sp)
    8000623c:	02010113          	addi	sp,sp,32
    80006240:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006244:	ffffb097          	auipc	ra,0xffffb
    80006248:	27c080e7          	jalr	636(ra) # 800014c0 <_Z15thread_dispatchv>
    8000624c:	fc1ff06f          	j	8000620c <_ZL9fibonaccim+0x30>

0000000080006250 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006250:	fe010113          	addi	sp,sp,-32
    80006254:	00113c23          	sd	ra,24(sp)
    80006258:	00813823          	sd	s0,16(sp)
    8000625c:	00913423          	sd	s1,8(sp)
    80006260:	01213023          	sd	s2,0(sp)
    80006264:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006268:	00a00493          	li	s1,10
    8000626c:	0400006f          	j	800062ac <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006270:	00004517          	auipc	a0,0x4
    80006274:	11050513          	addi	a0,a0,272 # 8000a380 <CONSOLE_STATUS+0x370>
    80006278:	fffff097          	auipc	ra,0xfffff
    8000627c:	61c080e7          	jalr	1564(ra) # 80005894 <_Z11printStringPKc>
    80006280:	00000613          	li	a2,0
    80006284:	00a00593          	li	a1,10
    80006288:	00048513          	mv	a0,s1
    8000628c:	fffff097          	auipc	ra,0xfffff
    80006290:	7b8080e7          	jalr	1976(ra) # 80005a44 <_Z8printIntiii>
    80006294:	00004517          	auipc	a0,0x4
    80006298:	2dc50513          	addi	a0,a0,732 # 8000a570 <CONSOLE_STATUS+0x560>
    8000629c:	fffff097          	auipc	ra,0xfffff
    800062a0:	5f8080e7          	jalr	1528(ra) # 80005894 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800062a4:	0014849b          	addiw	s1,s1,1
    800062a8:	0ff4f493          	andi	s1,s1,255
    800062ac:	00c00793          	li	a5,12
    800062b0:	fc97f0e3          	bgeu	a5,s1,80006270 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800062b4:	00004517          	auipc	a0,0x4
    800062b8:	0d450513          	addi	a0,a0,212 # 8000a388 <CONSOLE_STATUS+0x378>
    800062bc:	fffff097          	auipc	ra,0xfffff
    800062c0:	5d8080e7          	jalr	1496(ra) # 80005894 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800062c4:	00500313          	li	t1,5
    thread_dispatch();
    800062c8:	ffffb097          	auipc	ra,0xffffb
    800062cc:	1f8080e7          	jalr	504(ra) # 800014c0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800062d0:	01000513          	li	a0,16
    800062d4:	00000097          	auipc	ra,0x0
    800062d8:	f08080e7          	jalr	-248(ra) # 800061dc <_ZL9fibonaccim>
    800062dc:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800062e0:	00004517          	auipc	a0,0x4
    800062e4:	0b850513          	addi	a0,a0,184 # 8000a398 <CONSOLE_STATUS+0x388>
    800062e8:	fffff097          	auipc	ra,0xfffff
    800062ec:	5ac080e7          	jalr	1452(ra) # 80005894 <_Z11printStringPKc>
    800062f0:	00000613          	li	a2,0
    800062f4:	00a00593          	li	a1,10
    800062f8:	0009051b          	sext.w	a0,s2
    800062fc:	fffff097          	auipc	ra,0xfffff
    80006300:	748080e7          	jalr	1864(ra) # 80005a44 <_Z8printIntiii>
    80006304:	00004517          	auipc	a0,0x4
    80006308:	26c50513          	addi	a0,a0,620 # 8000a570 <CONSOLE_STATUS+0x560>
    8000630c:	fffff097          	auipc	ra,0xfffff
    80006310:	588080e7          	jalr	1416(ra) # 80005894 <_Z11printStringPKc>
    80006314:	0400006f          	j	80006354 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006318:	00004517          	auipc	a0,0x4
    8000631c:	06850513          	addi	a0,a0,104 # 8000a380 <CONSOLE_STATUS+0x370>
    80006320:	fffff097          	auipc	ra,0xfffff
    80006324:	574080e7          	jalr	1396(ra) # 80005894 <_Z11printStringPKc>
    80006328:	00000613          	li	a2,0
    8000632c:	00a00593          	li	a1,10
    80006330:	00048513          	mv	a0,s1
    80006334:	fffff097          	auipc	ra,0xfffff
    80006338:	710080e7          	jalr	1808(ra) # 80005a44 <_Z8printIntiii>
    8000633c:	00004517          	auipc	a0,0x4
    80006340:	23450513          	addi	a0,a0,564 # 8000a570 <CONSOLE_STATUS+0x560>
    80006344:	fffff097          	auipc	ra,0xfffff
    80006348:	550080e7          	jalr	1360(ra) # 80005894 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000634c:	0014849b          	addiw	s1,s1,1
    80006350:	0ff4f493          	andi	s1,s1,255
    80006354:	00f00793          	li	a5,15
    80006358:	fc97f0e3          	bgeu	a5,s1,80006318 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000635c:	00004517          	auipc	a0,0x4
    80006360:	04c50513          	addi	a0,a0,76 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80006364:	fffff097          	auipc	ra,0xfffff
    80006368:	530080e7          	jalr	1328(ra) # 80005894 <_Z11printStringPKc>
    finishedD = true;
    8000636c:	00100793          	li	a5,1
    80006370:	00007717          	auipc	a4,0x7
    80006374:	f0f70523          	sb	a5,-246(a4) # 8000d27a <_ZL9finishedD>
    thread_dispatch();
    80006378:	ffffb097          	auipc	ra,0xffffb
    8000637c:	148080e7          	jalr	328(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80006380:	01813083          	ld	ra,24(sp)
    80006384:	01013403          	ld	s0,16(sp)
    80006388:	00813483          	ld	s1,8(sp)
    8000638c:	00013903          	ld	s2,0(sp)
    80006390:	02010113          	addi	sp,sp,32
    80006394:	00008067          	ret

0000000080006398 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006398:	fe010113          	addi	sp,sp,-32
    8000639c:	00113c23          	sd	ra,24(sp)
    800063a0:	00813823          	sd	s0,16(sp)
    800063a4:	00913423          	sd	s1,8(sp)
    800063a8:	01213023          	sd	s2,0(sp)
    800063ac:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800063b0:	00000493          	li	s1,0
    800063b4:	0400006f          	j	800063f4 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800063b8:	00004517          	auipc	a0,0x4
    800063bc:	f8850513          	addi	a0,a0,-120 # 8000a340 <CONSOLE_STATUS+0x330>
    800063c0:	fffff097          	auipc	ra,0xfffff
    800063c4:	4d4080e7          	jalr	1236(ra) # 80005894 <_Z11printStringPKc>
    800063c8:	00000613          	li	a2,0
    800063cc:	00a00593          	li	a1,10
    800063d0:	00048513          	mv	a0,s1
    800063d4:	fffff097          	auipc	ra,0xfffff
    800063d8:	670080e7          	jalr	1648(ra) # 80005a44 <_Z8printIntiii>
    800063dc:	00004517          	auipc	a0,0x4
    800063e0:	19450513          	addi	a0,a0,404 # 8000a570 <CONSOLE_STATUS+0x560>
    800063e4:	fffff097          	auipc	ra,0xfffff
    800063e8:	4b0080e7          	jalr	1200(ra) # 80005894 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800063ec:	0014849b          	addiw	s1,s1,1
    800063f0:	0ff4f493          	andi	s1,s1,255
    800063f4:	00200793          	li	a5,2
    800063f8:	fc97f0e3          	bgeu	a5,s1,800063b8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800063fc:	00004517          	auipc	a0,0x4
    80006400:	f4c50513          	addi	a0,a0,-180 # 8000a348 <CONSOLE_STATUS+0x338>
    80006404:	fffff097          	auipc	ra,0xfffff
    80006408:	490080e7          	jalr	1168(ra) # 80005894 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000640c:	00700313          	li	t1,7
    thread_dispatch();
    80006410:	ffffb097          	auipc	ra,0xffffb
    80006414:	0b0080e7          	jalr	176(ra) # 800014c0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006418:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    8000641c:	00004517          	auipc	a0,0x4
    80006420:	f3c50513          	addi	a0,a0,-196 # 8000a358 <CONSOLE_STATUS+0x348>
    80006424:	fffff097          	auipc	ra,0xfffff
    80006428:	470080e7          	jalr	1136(ra) # 80005894 <_Z11printStringPKc>
    8000642c:	00000613          	li	a2,0
    80006430:	00a00593          	li	a1,10
    80006434:	0009051b          	sext.w	a0,s2
    80006438:	fffff097          	auipc	ra,0xfffff
    8000643c:	60c080e7          	jalr	1548(ra) # 80005a44 <_Z8printIntiii>
    80006440:	00004517          	auipc	a0,0x4
    80006444:	13050513          	addi	a0,a0,304 # 8000a570 <CONSOLE_STATUS+0x560>
    80006448:	fffff097          	auipc	ra,0xfffff
    8000644c:	44c080e7          	jalr	1100(ra) # 80005894 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006450:	00c00513          	li	a0,12
    80006454:	00000097          	auipc	ra,0x0
    80006458:	d88080e7          	jalr	-632(ra) # 800061dc <_ZL9fibonaccim>
    8000645c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006460:	00004517          	auipc	a0,0x4
    80006464:	f0050513          	addi	a0,a0,-256 # 8000a360 <CONSOLE_STATUS+0x350>
    80006468:	fffff097          	auipc	ra,0xfffff
    8000646c:	42c080e7          	jalr	1068(ra) # 80005894 <_Z11printStringPKc>
    80006470:	00000613          	li	a2,0
    80006474:	00a00593          	li	a1,10
    80006478:	0009051b          	sext.w	a0,s2
    8000647c:	fffff097          	auipc	ra,0xfffff
    80006480:	5c8080e7          	jalr	1480(ra) # 80005a44 <_Z8printIntiii>
    80006484:	00004517          	auipc	a0,0x4
    80006488:	0ec50513          	addi	a0,a0,236 # 8000a570 <CONSOLE_STATUS+0x560>
    8000648c:	fffff097          	auipc	ra,0xfffff
    80006490:	408080e7          	jalr	1032(ra) # 80005894 <_Z11printStringPKc>
    80006494:	0400006f          	j	800064d4 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006498:	00004517          	auipc	a0,0x4
    8000649c:	ea850513          	addi	a0,a0,-344 # 8000a340 <CONSOLE_STATUS+0x330>
    800064a0:	fffff097          	auipc	ra,0xfffff
    800064a4:	3f4080e7          	jalr	1012(ra) # 80005894 <_Z11printStringPKc>
    800064a8:	00000613          	li	a2,0
    800064ac:	00a00593          	li	a1,10
    800064b0:	00048513          	mv	a0,s1
    800064b4:	fffff097          	auipc	ra,0xfffff
    800064b8:	590080e7          	jalr	1424(ra) # 80005a44 <_Z8printIntiii>
    800064bc:	00004517          	auipc	a0,0x4
    800064c0:	0b450513          	addi	a0,a0,180 # 8000a570 <CONSOLE_STATUS+0x560>
    800064c4:	fffff097          	auipc	ra,0xfffff
    800064c8:	3d0080e7          	jalr	976(ra) # 80005894 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800064cc:	0014849b          	addiw	s1,s1,1
    800064d0:	0ff4f493          	andi	s1,s1,255
    800064d4:	00500793          	li	a5,5
    800064d8:	fc97f0e3          	bgeu	a5,s1,80006498 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800064dc:	00004517          	auipc	a0,0x4
    800064e0:	e3c50513          	addi	a0,a0,-452 # 8000a318 <CONSOLE_STATUS+0x308>
    800064e4:	fffff097          	auipc	ra,0xfffff
    800064e8:	3b0080e7          	jalr	944(ra) # 80005894 <_Z11printStringPKc>
    finishedC = true;
    800064ec:	00100793          	li	a5,1
    800064f0:	00007717          	auipc	a4,0x7
    800064f4:	d8f705a3          	sb	a5,-629(a4) # 8000d27b <_ZL9finishedC>
    thread_dispatch();
    800064f8:	ffffb097          	auipc	ra,0xffffb
    800064fc:	fc8080e7          	jalr	-56(ra) # 800014c0 <_Z15thread_dispatchv>
}
    80006500:	01813083          	ld	ra,24(sp)
    80006504:	01013403          	ld	s0,16(sp)
    80006508:	00813483          	ld	s1,8(sp)
    8000650c:	00013903          	ld	s2,0(sp)
    80006510:	02010113          	addi	sp,sp,32
    80006514:	00008067          	ret

0000000080006518 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006518:	fe010113          	addi	sp,sp,-32
    8000651c:	00113c23          	sd	ra,24(sp)
    80006520:	00813823          	sd	s0,16(sp)
    80006524:	00913423          	sd	s1,8(sp)
    80006528:	01213023          	sd	s2,0(sp)
    8000652c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006530:	00000913          	li	s2,0
    80006534:	0400006f          	j	80006574 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006538:	ffffb097          	auipc	ra,0xffffb
    8000653c:	f88080e7          	jalr	-120(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006540:	00148493          	addi	s1,s1,1
    80006544:	000027b7          	lui	a5,0x2
    80006548:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000654c:	0097ee63          	bltu	a5,s1,80006568 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006550:	00000713          	li	a4,0
    80006554:	000077b7          	lui	a5,0x7
    80006558:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000655c:	fce7eee3          	bltu	a5,a4,80006538 <_ZL11workerBodyBPv+0x20>
    80006560:	00170713          	addi	a4,a4,1
    80006564:	ff1ff06f          	j	80006554 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006568:	00a00793          	li	a5,10
    8000656c:	04f90663          	beq	s2,a5,800065b8 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006570:	00190913          	addi	s2,s2,1
    80006574:	00f00793          	li	a5,15
    80006578:	0527e463          	bltu	a5,s2,800065c0 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    8000657c:	00004517          	auipc	a0,0x4
    80006580:	dac50513          	addi	a0,a0,-596 # 8000a328 <CONSOLE_STATUS+0x318>
    80006584:	fffff097          	auipc	ra,0xfffff
    80006588:	310080e7          	jalr	784(ra) # 80005894 <_Z11printStringPKc>
    8000658c:	00000613          	li	a2,0
    80006590:	00a00593          	li	a1,10
    80006594:	0009051b          	sext.w	a0,s2
    80006598:	fffff097          	auipc	ra,0xfffff
    8000659c:	4ac080e7          	jalr	1196(ra) # 80005a44 <_Z8printIntiii>
    800065a0:	00004517          	auipc	a0,0x4
    800065a4:	fd050513          	addi	a0,a0,-48 # 8000a570 <CONSOLE_STATUS+0x560>
    800065a8:	fffff097          	auipc	ra,0xfffff
    800065ac:	2ec080e7          	jalr	748(ra) # 80005894 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800065b0:	00000493          	li	s1,0
    800065b4:	f91ff06f          	j	80006544 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800065b8:	14102ff3          	csrr	t6,sepc
    800065bc:	fb5ff06f          	j	80006570 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800065c0:	00004517          	auipc	a0,0x4
    800065c4:	d7050513          	addi	a0,a0,-656 # 8000a330 <CONSOLE_STATUS+0x320>
    800065c8:	fffff097          	auipc	ra,0xfffff
    800065cc:	2cc080e7          	jalr	716(ra) # 80005894 <_Z11printStringPKc>
    finishedB = true;
    800065d0:	00100793          	li	a5,1
    800065d4:	00007717          	auipc	a4,0x7
    800065d8:	caf70423          	sb	a5,-856(a4) # 8000d27c <_ZL9finishedB>
    thread_dispatch();
    800065dc:	ffffb097          	auipc	ra,0xffffb
    800065e0:	ee4080e7          	jalr	-284(ra) # 800014c0 <_Z15thread_dispatchv>
}
    800065e4:	01813083          	ld	ra,24(sp)
    800065e8:	01013403          	ld	s0,16(sp)
    800065ec:	00813483          	ld	s1,8(sp)
    800065f0:	00013903          	ld	s2,0(sp)
    800065f4:	02010113          	addi	sp,sp,32
    800065f8:	00008067          	ret

00000000800065fc <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800065fc:	fe010113          	addi	sp,sp,-32
    80006600:	00113c23          	sd	ra,24(sp)
    80006604:	00813823          	sd	s0,16(sp)
    80006608:	00913423          	sd	s1,8(sp)
    8000660c:	01213023          	sd	s2,0(sp)
    80006610:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006614:	00000913          	li	s2,0
    80006618:	0380006f          	j	80006650 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    8000661c:	ffffb097          	auipc	ra,0xffffb
    80006620:	ea4080e7          	jalr	-348(ra) # 800014c0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006624:	00148493          	addi	s1,s1,1
    80006628:	000027b7          	lui	a5,0x2
    8000662c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006630:	0097ee63          	bltu	a5,s1,8000664c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006634:	00000713          	li	a4,0
    80006638:	000077b7          	lui	a5,0x7
    8000663c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006640:	fce7eee3          	bltu	a5,a4,8000661c <_ZL11workerBodyAPv+0x20>
    80006644:	00170713          	addi	a4,a4,1
    80006648:	ff1ff06f          	j	80006638 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000664c:	00190913          	addi	s2,s2,1
    80006650:	00900793          	li	a5,9
    80006654:	0527e063          	bltu	a5,s2,80006694 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006658:	00004517          	auipc	a0,0x4
    8000665c:	cb850513          	addi	a0,a0,-840 # 8000a310 <CONSOLE_STATUS+0x300>
    80006660:	fffff097          	auipc	ra,0xfffff
    80006664:	234080e7          	jalr	564(ra) # 80005894 <_Z11printStringPKc>
    80006668:	00000613          	li	a2,0
    8000666c:	00a00593          	li	a1,10
    80006670:	0009051b          	sext.w	a0,s2
    80006674:	fffff097          	auipc	ra,0xfffff
    80006678:	3d0080e7          	jalr	976(ra) # 80005a44 <_Z8printIntiii>
    8000667c:	00004517          	auipc	a0,0x4
    80006680:	ef450513          	addi	a0,a0,-268 # 8000a570 <CONSOLE_STATUS+0x560>
    80006684:	fffff097          	auipc	ra,0xfffff
    80006688:	210080e7          	jalr	528(ra) # 80005894 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000668c:	00000493          	li	s1,0
    80006690:	f99ff06f          	j	80006628 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006694:	00004517          	auipc	a0,0x4
    80006698:	c8450513          	addi	a0,a0,-892 # 8000a318 <CONSOLE_STATUS+0x308>
    8000669c:	fffff097          	auipc	ra,0xfffff
    800066a0:	1f8080e7          	jalr	504(ra) # 80005894 <_Z11printStringPKc>
    finishedA = true;
    800066a4:	00100793          	li	a5,1
    800066a8:	00007717          	auipc	a4,0x7
    800066ac:	bcf70aa3          	sb	a5,-1067(a4) # 8000d27d <_ZL9finishedA>
}
    800066b0:	01813083          	ld	ra,24(sp)
    800066b4:	01013403          	ld	s0,16(sp)
    800066b8:	00813483          	ld	s1,8(sp)
    800066bc:	00013903          	ld	s2,0(sp)
    800066c0:	02010113          	addi	sp,sp,32
    800066c4:	00008067          	ret

00000000800066c8 <_Z16System_Mode_testv>:


void System_Mode_test() {
    800066c8:	fd010113          	addi	sp,sp,-48
    800066cc:	02113423          	sd	ra,40(sp)
    800066d0:	02813023          	sd	s0,32(sp)
    800066d4:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800066d8:	00000613          	li	a2,0
    800066dc:	00000597          	auipc	a1,0x0
    800066e0:	f2058593          	addi	a1,a1,-224 # 800065fc <_ZL11workerBodyAPv>
    800066e4:	fd040513          	addi	a0,s0,-48
    800066e8:	ffffb097          	auipc	ra,0xffffb
    800066ec:	d1c080e7          	jalr	-740(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800066f0:	00004517          	auipc	a0,0x4
    800066f4:	cc850513          	addi	a0,a0,-824 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    800066f8:	fffff097          	auipc	ra,0xfffff
    800066fc:	19c080e7          	jalr	412(ra) # 80005894 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006700:	00000613          	li	a2,0
    80006704:	00000597          	auipc	a1,0x0
    80006708:	e1458593          	addi	a1,a1,-492 # 80006518 <_ZL11workerBodyBPv>
    8000670c:	fd840513          	addi	a0,s0,-40
    80006710:	ffffb097          	auipc	ra,0xffffb
    80006714:	cf4080e7          	jalr	-780(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006718:	00004517          	auipc	a0,0x4
    8000671c:	cb850513          	addi	a0,a0,-840 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80006720:	fffff097          	auipc	ra,0xfffff
    80006724:	174080e7          	jalr	372(ra) # 80005894 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006728:	00000613          	li	a2,0
    8000672c:	00000597          	auipc	a1,0x0
    80006730:	c6c58593          	addi	a1,a1,-916 # 80006398 <_ZL11workerBodyCPv>
    80006734:	fe040513          	addi	a0,s0,-32
    80006738:	ffffb097          	auipc	ra,0xffffb
    8000673c:	ccc080e7          	jalr	-820(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006740:	00004517          	auipc	a0,0x4
    80006744:	ca850513          	addi	a0,a0,-856 # 8000a3e8 <CONSOLE_STATUS+0x3d8>
    80006748:	fffff097          	auipc	ra,0xfffff
    8000674c:	14c080e7          	jalr	332(ra) # 80005894 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006750:	00000613          	li	a2,0
    80006754:	00000597          	auipc	a1,0x0
    80006758:	afc58593          	addi	a1,a1,-1284 # 80006250 <_ZL11workerBodyDPv>
    8000675c:	fe840513          	addi	a0,s0,-24
    80006760:	ffffb097          	auipc	ra,0xffffb
    80006764:	ca4080e7          	jalr	-860(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006768:	00004517          	auipc	a0,0x4
    8000676c:	c9850513          	addi	a0,a0,-872 # 8000a400 <CONSOLE_STATUS+0x3f0>
    80006770:	fffff097          	auipc	ra,0xfffff
    80006774:	124080e7          	jalr	292(ra) # 80005894 <_Z11printStringPKc>
    80006778:	00c0006f          	j	80006784 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    8000677c:	ffffb097          	auipc	ra,0xffffb
    80006780:	d44080e7          	jalr	-700(ra) # 800014c0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006784:	00007797          	auipc	a5,0x7
    80006788:	af97c783          	lbu	a5,-1287(a5) # 8000d27d <_ZL9finishedA>
    8000678c:	fe0788e3          	beqz	a5,8000677c <_Z16System_Mode_testv+0xb4>
    80006790:	00007797          	auipc	a5,0x7
    80006794:	aec7c783          	lbu	a5,-1300(a5) # 8000d27c <_ZL9finishedB>
    80006798:	fe0782e3          	beqz	a5,8000677c <_Z16System_Mode_testv+0xb4>
    8000679c:	00007797          	auipc	a5,0x7
    800067a0:	adf7c783          	lbu	a5,-1313(a5) # 8000d27b <_ZL9finishedC>
    800067a4:	fc078ce3          	beqz	a5,8000677c <_Z16System_Mode_testv+0xb4>
    800067a8:	00007797          	auipc	a5,0x7
    800067ac:	ad27c783          	lbu	a5,-1326(a5) # 8000d27a <_ZL9finishedD>
    800067b0:	fc0786e3          	beqz	a5,8000677c <_Z16System_Mode_testv+0xb4>
    }

}
    800067b4:	02813083          	ld	ra,40(sp)
    800067b8:	02013403          	ld	s0,32(sp)
    800067bc:	03010113          	addi	sp,sp,48
    800067c0:	00008067          	ret

00000000800067c4 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800067c4:	fe010113          	addi	sp,sp,-32
    800067c8:	00113c23          	sd	ra,24(sp)
    800067cc:	00813823          	sd	s0,16(sp)
    800067d0:	00913423          	sd	s1,8(sp)
    800067d4:	01213023          	sd	s2,0(sp)
    800067d8:	02010413          	addi	s0,sp,32
    800067dc:	00050493          	mv	s1,a0
    800067e0:	00058913          	mv	s2,a1
    800067e4:	0015879b          	addiw	a5,a1,1
    800067e8:	0007851b          	sext.w	a0,a5
    800067ec:	00f4a023          	sw	a5,0(s1)
    800067f0:	0004a823          	sw	zero,16(s1)
    800067f4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800067f8:	00251513          	slli	a0,a0,0x2
    800067fc:	ffffb097          	auipc	ra,0xffffb
    80006800:	b98080e7          	jalr	-1128(ra) # 80001394 <_Z9mem_allocm>
    80006804:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006808:	00000593          	li	a1,0
    8000680c:	02048513          	addi	a0,s1,32
    80006810:	ffffb097          	auipc	ra,0xffffb
    80006814:	d28080e7          	jalr	-728(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006818:	00090593          	mv	a1,s2
    8000681c:	01848513          	addi	a0,s1,24
    80006820:	ffffb097          	auipc	ra,0xffffb
    80006824:	d18080e7          	jalr	-744(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006828:	00100593          	li	a1,1
    8000682c:	02848513          	addi	a0,s1,40
    80006830:	ffffb097          	auipc	ra,0xffffb
    80006834:	d08080e7          	jalr	-760(ra) # 80001538 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006838:	00100593          	li	a1,1
    8000683c:	03048513          	addi	a0,s1,48
    80006840:	ffffb097          	auipc	ra,0xffffb
    80006844:	cf8080e7          	jalr	-776(ra) # 80001538 <_Z8sem_openPP4KSemj>
}
    80006848:	01813083          	ld	ra,24(sp)
    8000684c:	01013403          	ld	s0,16(sp)
    80006850:	00813483          	ld	s1,8(sp)
    80006854:	00013903          	ld	s2,0(sp)
    80006858:	02010113          	addi	sp,sp,32
    8000685c:	00008067          	ret

0000000080006860 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006860:	fe010113          	addi	sp,sp,-32
    80006864:	00113c23          	sd	ra,24(sp)
    80006868:	00813823          	sd	s0,16(sp)
    8000686c:	00913423          	sd	s1,8(sp)
    80006870:	01213023          	sd	s2,0(sp)
    80006874:	02010413          	addi	s0,sp,32
    80006878:	00050493          	mv	s1,a0
    8000687c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006880:	01853503          	ld	a0,24(a0)
    80006884:	ffffb097          	auipc	ra,0xffffb
    80006888:	d1c080e7          	jalr	-740(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    8000688c:	0304b503          	ld	a0,48(s1)
    80006890:	ffffb097          	auipc	ra,0xffffb
    80006894:	d10080e7          	jalr	-752(ra) # 800015a0 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006898:	0084b783          	ld	a5,8(s1)
    8000689c:	0144a703          	lw	a4,20(s1)
    800068a0:	00271713          	slli	a4,a4,0x2
    800068a4:	00e787b3          	add	a5,a5,a4
    800068a8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800068ac:	0144a783          	lw	a5,20(s1)
    800068b0:	0017879b          	addiw	a5,a5,1
    800068b4:	0004a703          	lw	a4,0(s1)
    800068b8:	02e7e7bb          	remw	a5,a5,a4
    800068bc:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800068c0:	0304b503          	ld	a0,48(s1)
    800068c4:	ffffb097          	auipc	ra,0xffffb
    800068c8:	d0c080e7          	jalr	-756(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    800068cc:	0204b503          	ld	a0,32(s1)
    800068d0:	ffffb097          	auipc	ra,0xffffb
    800068d4:	d00080e7          	jalr	-768(ra) # 800015d0 <_Z10sem_signalP4KSem>

}
    800068d8:	01813083          	ld	ra,24(sp)
    800068dc:	01013403          	ld	s0,16(sp)
    800068e0:	00813483          	ld	s1,8(sp)
    800068e4:	00013903          	ld	s2,0(sp)
    800068e8:	02010113          	addi	sp,sp,32
    800068ec:	00008067          	ret

00000000800068f0 <_ZN6Buffer3getEv>:

int Buffer::get() {
    800068f0:	fe010113          	addi	sp,sp,-32
    800068f4:	00113c23          	sd	ra,24(sp)
    800068f8:	00813823          	sd	s0,16(sp)
    800068fc:	00913423          	sd	s1,8(sp)
    80006900:	01213023          	sd	s2,0(sp)
    80006904:	02010413          	addi	s0,sp,32
    80006908:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    8000690c:	02053503          	ld	a0,32(a0)
    80006910:	ffffb097          	auipc	ra,0xffffb
    80006914:	c90080e7          	jalr	-880(ra) # 800015a0 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006918:	0284b503          	ld	a0,40(s1)
    8000691c:	ffffb097          	auipc	ra,0xffffb
    80006920:	c84080e7          	jalr	-892(ra) # 800015a0 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006924:	0084b703          	ld	a4,8(s1)
    80006928:	0104a783          	lw	a5,16(s1)
    8000692c:	00279693          	slli	a3,a5,0x2
    80006930:	00d70733          	add	a4,a4,a3
    80006934:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006938:	0017879b          	addiw	a5,a5,1
    8000693c:	0004a703          	lw	a4,0(s1)
    80006940:	02e7e7bb          	remw	a5,a5,a4
    80006944:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006948:	0284b503          	ld	a0,40(s1)
    8000694c:	ffffb097          	auipc	ra,0xffffb
    80006950:	c84080e7          	jalr	-892(ra) # 800015d0 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006954:	0184b503          	ld	a0,24(s1)
    80006958:	ffffb097          	auipc	ra,0xffffb
    8000695c:	c78080e7          	jalr	-904(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    80006960:	00090513          	mv	a0,s2
    80006964:	01813083          	ld	ra,24(sp)
    80006968:	01013403          	ld	s0,16(sp)
    8000696c:	00813483          	ld	s1,8(sp)
    80006970:	00013903          	ld	s2,0(sp)
    80006974:	02010113          	addi	sp,sp,32
    80006978:	00008067          	ret

000000008000697c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    8000697c:	fe010113          	addi	sp,sp,-32
    80006980:	00113c23          	sd	ra,24(sp)
    80006984:	00813823          	sd	s0,16(sp)
    80006988:	00913423          	sd	s1,8(sp)
    8000698c:	01213023          	sd	s2,0(sp)
    80006990:	02010413          	addi	s0,sp,32
    80006994:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006998:	02853503          	ld	a0,40(a0)
    8000699c:	ffffb097          	auipc	ra,0xffffb
    800069a0:	c04080e7          	jalr	-1020(ra) # 800015a0 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    800069a4:	0304b503          	ld	a0,48(s1)
    800069a8:	ffffb097          	auipc	ra,0xffffb
    800069ac:	bf8080e7          	jalr	-1032(ra) # 800015a0 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    800069b0:	0144a783          	lw	a5,20(s1)
    800069b4:	0104a903          	lw	s2,16(s1)
    800069b8:	0327ce63          	blt	a5,s2,800069f4 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800069bc:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800069c0:	0304b503          	ld	a0,48(s1)
    800069c4:	ffffb097          	auipc	ra,0xffffb
    800069c8:	c0c080e7          	jalr	-1012(ra) # 800015d0 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    800069cc:	0284b503          	ld	a0,40(s1)
    800069d0:	ffffb097          	auipc	ra,0xffffb
    800069d4:	c00080e7          	jalr	-1024(ra) # 800015d0 <_Z10sem_signalP4KSem>

    return ret;
}
    800069d8:	00090513          	mv	a0,s2
    800069dc:	01813083          	ld	ra,24(sp)
    800069e0:	01013403          	ld	s0,16(sp)
    800069e4:	00813483          	ld	s1,8(sp)
    800069e8:	00013903          	ld	s2,0(sp)
    800069ec:	02010113          	addi	sp,sp,32
    800069f0:	00008067          	ret
        ret = cap - head + tail;
    800069f4:	0004a703          	lw	a4,0(s1)
    800069f8:	4127093b          	subw	s2,a4,s2
    800069fc:	00f9093b          	addw	s2,s2,a5
    80006a00:	fc1ff06f          	j	800069c0 <_ZN6Buffer6getCntEv+0x44>

0000000080006a04 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006a04:	fe010113          	addi	sp,sp,-32
    80006a08:	00113c23          	sd	ra,24(sp)
    80006a0c:	00813823          	sd	s0,16(sp)
    80006a10:	00913423          	sd	s1,8(sp)
    80006a14:	02010413          	addi	s0,sp,32
    80006a18:	00050493          	mv	s1,a0
    putc('\n');
    80006a1c:	00a00513          	li	a0,10
    80006a20:	ffffb097          	auipc	ra,0xffffb
    80006a24:	c08080e7          	jalr	-1016(ra) # 80001628 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006a28:	00004517          	auipc	a0,0x4
    80006a2c:	9f050513          	addi	a0,a0,-1552 # 8000a418 <CONSOLE_STATUS+0x408>
    80006a30:	fffff097          	auipc	ra,0xfffff
    80006a34:	e64080e7          	jalr	-412(ra) # 80005894 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006a38:	00048513          	mv	a0,s1
    80006a3c:	00000097          	auipc	ra,0x0
    80006a40:	f40080e7          	jalr	-192(ra) # 8000697c <_ZN6Buffer6getCntEv>
    80006a44:	02a05c63          	blez	a0,80006a7c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006a48:	0084b783          	ld	a5,8(s1)
    80006a4c:	0104a703          	lw	a4,16(s1)
    80006a50:	00271713          	slli	a4,a4,0x2
    80006a54:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006a58:	0007c503          	lbu	a0,0(a5)
    80006a5c:	ffffb097          	auipc	ra,0xffffb
    80006a60:	bcc080e7          	jalr	-1076(ra) # 80001628 <_Z4putcc>
        head = (head + 1) % cap;
    80006a64:	0104a783          	lw	a5,16(s1)
    80006a68:	0017879b          	addiw	a5,a5,1
    80006a6c:	0004a703          	lw	a4,0(s1)
    80006a70:	02e7e7bb          	remw	a5,a5,a4
    80006a74:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006a78:	fc1ff06f          	j	80006a38 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006a7c:	02100513          	li	a0,33
    80006a80:	ffffb097          	auipc	ra,0xffffb
    80006a84:	ba8080e7          	jalr	-1112(ra) # 80001628 <_Z4putcc>
    putc('\n');
    80006a88:	00a00513          	li	a0,10
    80006a8c:	ffffb097          	auipc	ra,0xffffb
    80006a90:	b9c080e7          	jalr	-1124(ra) # 80001628 <_Z4putcc>
    mem_free(buffer);
    80006a94:	0084b503          	ld	a0,8(s1)
    80006a98:	ffffb097          	auipc	ra,0xffffb
    80006a9c:	93c080e7          	jalr	-1732(ra) # 800013d4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006aa0:	0204b503          	ld	a0,32(s1)
    80006aa4:	ffffb097          	auipc	ra,0xffffb
    80006aa8:	acc080e7          	jalr	-1332(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006aac:	0184b503          	ld	a0,24(s1)
    80006ab0:	ffffb097          	auipc	ra,0xffffb
    80006ab4:	ac0080e7          	jalr	-1344(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006ab8:	0304b503          	ld	a0,48(s1)
    80006abc:	ffffb097          	auipc	ra,0xffffb
    80006ac0:	ab4080e7          	jalr	-1356(ra) # 80001570 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006ac4:	0284b503          	ld	a0,40(s1)
    80006ac8:	ffffb097          	auipc	ra,0xffffb
    80006acc:	aa8080e7          	jalr	-1368(ra) # 80001570 <_Z9sem_closeP4KSem>
}
    80006ad0:	01813083          	ld	ra,24(sp)
    80006ad4:	01013403          	ld	s0,16(sp)
    80006ad8:	00813483          	ld	s1,8(sp)
    80006adc:	02010113          	addi	sp,sp,32
    80006ae0:	00008067          	ret

0000000080006ae4 <_Z6sumRowPv>:
    int len;
    int num;
};

void sumRow(void* rowd) {
    if (!rowd) return;
    80006ae4:	0c050063          	beqz	a0,80006ba4 <_Z6sumRowPv+0xc0>
void sumRow(void* rowd) {
    80006ae8:	fd010113          	addi	sp,sp,-48
    80006aec:	02113423          	sd	ra,40(sp)
    80006af0:	02813023          	sd	s0,32(sp)
    80006af4:	00913c23          	sd	s1,24(sp)
    80006af8:	03010413          	addi	s0,sp,48
    rowdesc rd = *(rowdesc*)rowd;
    80006afc:	00053783          	ld	a5,0(a0)
    80006b00:	fcf43823          	sd	a5,-48(s0)
    80006b04:	00853783          	ld	a5,8(a0)
    80006b08:	fcf43c23          	sd	a5,-40(s0)
    uint64 sum = 0;
    for (int i = 0; i < rd.len; i++) {
    80006b0c:	00000793          	li	a5,0
    uint64 sum = 0;
    80006b10:	00000493          	li	s1,0
    for (int i = 0; i < rd.len; i++) {
    80006b14:	fd842703          	lw	a4,-40(s0)
    80006b18:	02e7d063          	bge	a5,a4,80006b38 <_Z6sumRowPv+0x54>
        sum += rd.row[i];
    80006b1c:	00379693          	slli	a3,a5,0x3
    80006b20:	fd043703          	ld	a4,-48(s0)
    80006b24:	00d70733          	add	a4,a4,a3
    80006b28:	00073703          	ld	a4,0(a4)
    80006b2c:	00e484b3          	add	s1,s1,a4
    for (int i = 0; i < rd.len; i++) {
    80006b30:	0017879b          	addiw	a5,a5,1
    80006b34:	fe1ff06f          	j	80006b14 <_Z6sumRowPv+0x30>
    }
    printString("Suma reda ");
    80006b38:	00004517          	auipc	a0,0x4
    80006b3c:	b8050513          	addi	a0,a0,-1152 # 8000a6b8 <CONSOLE_STATUS+0x6a8>
    80006b40:	fffff097          	auipc	ra,0xfffff
    80006b44:	d54080e7          	jalr	-684(ra) # 80005894 <_Z11printStringPKc>
    printInt(rd.num);
    80006b48:	00000613          	li	a2,0
    80006b4c:	00a00593          	li	a1,10
    80006b50:	fdc42503          	lw	a0,-36(s0)
    80006b54:	fffff097          	auipc	ra,0xfffff
    80006b58:	ef0080e7          	jalr	-272(ra) # 80005a44 <_Z8printIntiii>
    printString(". = ");
    80006b5c:	00004517          	auipc	a0,0x4
    80006b60:	b6c50513          	addi	a0,a0,-1172 # 8000a6c8 <CONSOLE_STATUS+0x6b8>
    80006b64:	fffff097          	auipc	ra,0xfffff
    80006b68:	d30080e7          	jalr	-720(ra) # 80005894 <_Z11printStringPKc>
    printInt(sum);
    80006b6c:	00000613          	li	a2,0
    80006b70:	00a00593          	li	a1,10
    80006b74:	0004851b          	sext.w	a0,s1
    80006b78:	fffff097          	auipc	ra,0xfffff
    80006b7c:	ecc080e7          	jalr	-308(ra) # 80005a44 <_Z8printIntiii>
    printString("\n");
    80006b80:	00004517          	auipc	a0,0x4
    80006b84:	9f050513          	addi	a0,a0,-1552 # 8000a570 <CONSOLE_STATUS+0x560>
    80006b88:	fffff097          	auipc	ra,0xfffff
    80006b8c:	d0c080e7          	jalr	-756(ra) # 80005894 <_Z11printStringPKc>
}
    80006b90:	02813083          	ld	ra,40(sp)
    80006b94:	02013403          	ld	s0,32(sp)
    80006b98:	01813483          	ld	s1,24(sp)
    80006b9c:	03010113          	addi	sp,sp,48
    80006ba0:	00008067          	ret
    80006ba4:	00008067          	ret

0000000080006ba8 <_ZL2f3Pv>:
static void f3(void* end) {
    80006ba8:	fe010113          	addi	sp,sp,-32
    80006bac:	00113c23          	sd	ra,24(sp)
    80006bb0:	00813823          	sd	s0,16(sp)
    80006bb4:	00913423          	sd	s1,8(sp)
    80006bb8:	01213023          	sd	s2,0(sp)
    80006bbc:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t*)end);
    80006bc0:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006bc4:	00600493          	li	s1,6
    while (--i > 0) {
    80006bc8:	fff4849b          	addiw	s1,s1,-1
    80006bcc:	04905463          	blez	s1,80006c14 <_ZL2f3Pv+0x6c>
        printString("Hello ");
    80006bd0:	00004517          	auipc	a0,0x4
    80006bd4:	ad850513          	addi	a0,a0,-1320 # 8000a6a8 <CONSOLE_STATUS+0x698>
    80006bd8:	fffff097          	auipc	ra,0xfffff
    80006bdc:	cbc080e7          	jalr	-836(ra) # 80005894 <_Z11printStringPKc>
        printInt(sleep_time);
    80006be0:	00000613          	li	a2,0
    80006be4:	00a00593          	li	a1,10
    80006be8:	0009051b          	sext.w	a0,s2
    80006bec:	fffff097          	auipc	ra,0xfffff
    80006bf0:	e58080e7          	jalr	-424(ra) # 80005a44 <_Z8printIntiii>
        printString(" !\n");
    80006bf4:	00004517          	auipc	a0,0x4
    80006bf8:	abc50513          	addi	a0,a0,-1348 # 8000a6b0 <CONSOLE_STATUS+0x6a0>
    80006bfc:	fffff097          	auipc	ra,0xfffff
    80006c00:	c98080e7          	jalr	-872(ra) # 80005894 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006c04:	00090513          	mv	a0,s2
    80006c08:	ffffb097          	auipc	ra,0xffffb
    80006c0c:	900080e7          	jalr	-1792(ra) # 80001508 <_Z10time_sleepm>
    while (--i > 0) {
    80006c10:	fb9ff06f          	j	80006bc8 <_ZL2f3Pv+0x20>
}
    80006c14:	01813083          	ld	ra,24(sp)
    80006c18:	01013403          	ld	s0,16(sp)
    80006c1c:	00813483          	ld	s1,8(sp)
    80006c20:	00013903          	ld	s2,0(sp)
    80006c24:	02010113          	addi	sp,sp,32
    80006c28:	00008067          	ret

0000000080006c2c <_Z4factm>:
    if (i <= 1) return 1;
    80006c2c:	00100793          	li	a5,1
    80006c30:	04a7fa63          	bgeu	a5,a0,80006c84 <_Z4factm+0x58>
uint64 fact(uint64 i) {
    80006c34:	fe010113          	addi	sp,sp,-32
    80006c38:	00113c23          	sd	ra,24(sp)
    80006c3c:	00813823          	sd	s0,16(sp)
    80006c40:	00913423          	sd	s1,8(sp)
    80006c44:	02010413          	addi	s0,sp,32
    80006c48:	00050493          	mv	s1,a0
    if (i % 2) thread_dispatch();
    80006c4c:	00157793          	andi	a5,a0,1
    80006c50:	02079463          	bnez	a5,80006c78 <_Z4factm+0x4c>
    return i * fact(i - 1);
    80006c54:	fff48513          	addi	a0,s1,-1
    80006c58:	00000097          	auipc	ra,0x0
    80006c5c:	fd4080e7          	jalr	-44(ra) # 80006c2c <_Z4factm>
    80006c60:	02a48533          	mul	a0,s1,a0
}
    80006c64:	01813083          	ld	ra,24(sp)
    80006c68:	01013403          	ld	s0,16(sp)
    80006c6c:	00813483          	ld	s1,8(sp)
    80006c70:	02010113          	addi	sp,sp,32
    80006c74:	00008067          	ret
    if (i % 2) thread_dispatch();
    80006c78:	ffffb097          	auipc	ra,0xffffb
    80006c7c:	848080e7          	jalr	-1976(ra) # 800014c0 <_Z15thread_dispatchv>
    80006c80:	fd5ff06f          	j	80006c54 <_Z4factm+0x28>
    if (i <= 1) return 1;
    80006c84:	00100513          	li	a0,1
}
    80006c88:	00008067          	ret

0000000080006c8c <_Z2f1Pv>:
void f1(void* end) {
    80006c8c:	fe010113          	addi	sp,sp,-32
    80006c90:	00113c23          	sd	ra,24(sp)
    80006c94:	00813823          	sd	s0,16(sp)
    80006c98:	00913423          	sd	s1,8(sp)
    80006c9c:	02010413          	addi	s0,sp,32
    uint64 i = fact(*(uint64*)end);
    80006ca0:	00053503          	ld	a0,0(a0)
    80006ca4:	00000097          	auipc	ra,0x0
    80006ca8:	f88080e7          	jalr	-120(ra) # 80006c2c <_Z4factm>
    80006cac:	00050493          	mv	s1,a0
    printString("f1: i=");
    80006cb0:	00004517          	auipc	a0,0x4
    80006cb4:	a2050513          	addi	a0,a0,-1504 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80006cb8:	fffff097          	auipc	ra,0xfffff
    80006cbc:	bdc080e7          	jalr	-1060(ra) # 80005894 <_Z11printStringPKc>
    printInt(i);
    80006cc0:	00000613          	li	a2,0
    80006cc4:	00a00593          	li	a1,10
    80006cc8:	0004851b          	sext.w	a0,s1
    80006ccc:	fffff097          	auipc	ra,0xfffff
    80006cd0:	d78080e7          	jalr	-648(ra) # 80005a44 <_Z8printIntiii>
    printString("\nGotova nit 1\n");
    80006cd4:	00004517          	auipc	a0,0x4
    80006cd8:	a0450513          	addi	a0,a0,-1532 # 8000a6d8 <CONSOLE_STATUS+0x6c8>
    80006cdc:	fffff097          	auipc	ra,0xfffff
    80006ce0:	bb8080e7          	jalr	-1096(ra) # 80005894 <_Z11printStringPKc>
}
    80006ce4:	01813083          	ld	ra,24(sp)
    80006ce8:	01013403          	ld	s0,16(sp)
    80006cec:	00813483          	ld	s1,8(sp)
    80006cf0:	02010113          	addi	sp,sp,32
    80006cf4:	00008067          	ret

0000000080006cf8 <_Z2f2Pv>:
void f2(void* end) {
    80006cf8:	fe010113          	addi	sp,sp,-32
    80006cfc:	00113c23          	sd	ra,24(sp)
    80006d00:	00813823          	sd	s0,16(sp)
    80006d04:	00913423          	sd	s1,8(sp)
    80006d08:	02010413          	addi	s0,sp,32
    uint64 i = fact(20);
    80006d0c:	01400513          	li	a0,20
    80006d10:	00000097          	auipc	ra,0x0
    80006d14:	f1c080e7          	jalr	-228(ra) # 80006c2c <_Z4factm>
    80006d18:	00050493          	mv	s1,a0
    printString("f2: i=");
    80006d1c:	00004517          	auipc	a0,0x4
    80006d20:	9cc50513          	addi	a0,a0,-1588 # 8000a6e8 <CONSOLE_STATUS+0x6d8>
    80006d24:	fffff097          	auipc	ra,0xfffff
    80006d28:	b70080e7          	jalr	-1168(ra) # 80005894 <_Z11printStringPKc>
    printInt(i);
    80006d2c:	00000613          	li	a2,0
    80006d30:	00a00593          	li	a1,10
    80006d34:	0004851b          	sext.w	a0,s1
    80006d38:	fffff097          	auipc	ra,0xfffff
    80006d3c:	d0c080e7          	jalr	-756(ra) # 80005a44 <_Z8printIntiii>
    printString("\nGotova nit 2\n");
    80006d40:	00004517          	auipc	a0,0x4
    80006d44:	9b050513          	addi	a0,a0,-1616 # 8000a6f0 <CONSOLE_STATUS+0x6e0>
    80006d48:	fffff097          	auipc	ra,0xfffff
    80006d4c:	b4c080e7          	jalr	-1204(ra) # 80005894 <_Z11printStringPKc>
}
    80006d50:	01813083          	ld	ra,24(sp)
    80006d54:	01013403          	ld	s0,16(sp)
    80006d58:	00813483          	ld	s1,8(sp)
    80006d5c:	02010113          	addi	sp,sp,32
    80006d60:	00008067          	ret

0000000080006d64 <_Z4userPv>:

void user(void*) {
    80006d64:	bd010113          	addi	sp,sp,-1072
    80006d68:	42113423          	sd	ra,1064(sp)
    80006d6c:	42813023          	sd	s0,1056(sp)
    80006d70:	40913c23          	sd	s1,1048(sp)
    80006d74:	41213823          	sd	s2,1040(sp)
    80006d78:	43010413          	addi	s0,sp,1072
    const int dim = 10;
    uint64 matrix[dim][dim];
    for (int i = 0; i < dim; i++) {
    80006d7c:	00000913          	li	s2,0
    80006d80:	09c0006f          	j	80006e1c <_Z4userPv+0xb8>
        for (int j = 0; j < dim; j++) {
            matrix[i][j] = ((i * 10 + j) * ((i+j) * j ^ i<<j)) % 100;
            printInt(matrix[i][j]);
            if (j == dim - 1) printString("\n");
    80006d84:	00003517          	auipc	a0,0x3
    80006d88:	7ec50513          	addi	a0,a0,2028 # 8000a570 <CONSOLE_STATUS+0x560>
    80006d8c:	fffff097          	auipc	ra,0xfffff
    80006d90:	b08080e7          	jalr	-1272(ra) # 80005894 <_Z11printStringPKc>
        for (int j = 0; j < dim; j++) {
    80006d94:	0014849b          	addiw	s1,s1,1
    80006d98:	00900793          	li	a5,9
    80006d9c:	0697ce63          	blt	a5,s1,80006e18 <_Z4userPv+0xb4>
            matrix[i][j] = ((i * 10 + j) * ((i+j) * j ^ i<<j)) % 100;
    80006da0:	0029179b          	slliw	a5,s2,0x2
    80006da4:	012787bb          	addw	a5,a5,s2
    80006da8:	0017951b          	slliw	a0,a5,0x1
    80006dac:	0095053b          	addw	a0,a0,s1
    80006db0:	009907bb          	addw	a5,s2,s1
    80006db4:	029787bb          	mulw	a5,a5,s1
    80006db8:	0099173b          	sllw	a4,s2,s1
    80006dbc:	00e7c7b3          	xor	a5,a5,a4
    80006dc0:	02f5053b          	mulw	a0,a0,a5
    80006dc4:	06400793          	li	a5,100
    80006dc8:	02f5653b          	remw	a0,a0,a5
    80006dcc:	00291713          	slli	a4,s2,0x2
    80006dd0:	01270733          	add	a4,a4,s2
    80006dd4:	00171793          	slli	a5,a4,0x1
    80006dd8:	009787b3          	add	a5,a5,s1
    80006ddc:	00379793          	slli	a5,a5,0x3
    80006de0:	fe040713          	addi	a4,s0,-32
    80006de4:	00f707b3          	add	a5,a4,a5
    80006de8:	cea7b023          	sd	a0,-800(a5)
            printInt(matrix[i][j]);
    80006dec:	00000613          	li	a2,0
    80006df0:	00a00593          	li	a1,10
    80006df4:	fffff097          	auipc	ra,0xfffff
    80006df8:	c50080e7          	jalr	-944(ra) # 80005a44 <_Z8printIntiii>
            if (j == dim - 1) printString("\n");
    80006dfc:	00900793          	li	a5,9
    80006e00:	f8f482e3          	beq	s1,a5,80006d84 <_Z4userPv+0x20>
            else printString(" ");
    80006e04:	00004517          	auipc	a0,0x4
    80006e08:	8fc50513          	addi	a0,a0,-1796 # 8000a700 <CONSOLE_STATUS+0x6f0>
    80006e0c:	fffff097          	auipc	ra,0xfffff
    80006e10:	a88080e7          	jalr	-1400(ra) # 80005894 <_Z11printStringPKc>
    80006e14:	f81ff06f          	j	80006d94 <_Z4userPv+0x30>
    for (int i = 0; i < dim; i++) {
    80006e18:	0019091b          	addiw	s2,s2,1
    80006e1c:	00900793          	li	a5,9
    80006e20:	0127c663          	blt	a5,s2,80006e2c <_Z4userPv+0xc8>
        for (int j = 0; j < dim; j++) {
    80006e24:	00000493          	li	s1,0
    80006e28:	f71ff06f          	j	80006d98 <_Z4userPv+0x34>
        }
    }
    thread_t handles[dim];
    rowdesc rds[dim];
    for (int i = 0; i < dim; i++) {
    80006e2c:	00000493          	li	s1,0
    80006e30:	00900793          	li	a5,9
    80006e34:	0697c063          	blt	a5,s1,80006e94 <_Z4userPv+0x130>

        rds[i].row = matrix[i];
    80006e38:	00249793          	slli	a5,s1,0x2
    80006e3c:	009787b3          	add	a5,a5,s1
    80006e40:	00479693          	slli	a3,a5,0x4
    80006e44:	cc040713          	addi	a4,s0,-832
    80006e48:	00d70733          	add	a4,a4,a3
    80006e4c:	00449693          	slli	a3,s1,0x4
    80006e50:	fe040793          	addi	a5,s0,-32
    80006e54:	00d787b3          	add	a5,a5,a3
    80006e58:	bee7b823          	sd	a4,-1040(a5)
        rds[i].len = dim;
    80006e5c:	00a00713          	li	a4,10
    80006e60:	bee7ac23          	sw	a4,-1032(a5)
        rds[i].num = i;
    80006e64:	be97ae23          	sw	s1,-1028(a5)
        thread_create(&handles[i], sumRow, &rds[i]);
    80006e68:	00349793          	slli	a5,s1,0x3
    80006e6c:	bd040613          	addi	a2,s0,-1072
    80006e70:	00d60633          	add	a2,a2,a3
    80006e74:	00000597          	auipc	a1,0x0
    80006e78:	c7058593          	addi	a1,a1,-912 # 80006ae4 <_Z6sumRowPv>
    80006e7c:	c7040513          	addi	a0,s0,-912
    80006e80:	00f50533          	add	a0,a0,a5
    80006e84:	ffffa097          	auipc	ra,0xffffa
    80006e88:	580080e7          	jalr	1408(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < dim; i++) {
    80006e8c:	0014849b          	addiw	s1,s1,1
    80006e90:	fa1ff06f          	j	80006e30 <_Z4userPv+0xcc>
    }
    for (int i = 0; i < dim; i++) {
    80006e94:	00000493          	li	s1,0
    80006e98:	00900793          	li	a5,9
    80006e9c:	0297c263          	blt	a5,s1,80006ec0 <_Z4userPv+0x15c>
        thread_join(handles[i]);
    80006ea0:	00349793          	slli	a5,s1,0x3
    80006ea4:	fe040713          	addi	a4,s0,-32
    80006ea8:	00f707b3          	add	a5,a4,a5
    80006eac:	c907b503          	ld	a0,-880(a5)
    80006eb0:	ffffa097          	auipc	ra,0xffffa
    80006eb4:	630080e7          	jalr	1584(ra) # 800014e0 <_Z11thread_joinP3TCB>
    for (int i = 0; i < dim; i++) {
    80006eb8:	0014849b          	addiw	s1,s1,1
    80006ebc:	fddff06f          	j	80006e98 <_Z4userPv+0x134>
    }
}
    80006ec0:	42813083          	ld	ra,1064(sp)
    80006ec4:	42013403          	ld	s0,1056(sp)
    80006ec8:	41813483          	ld	s1,1048(sp)
    80006ecc:	41013903          	ld	s2,1040(sp)
    80006ed0:	43010113          	addi	sp,sp,1072
    80006ed4:	00008067          	ret

0000000080006ed8 <_Z5user2Pv>:

void user2(void*) {
    80006ed8:	f9010113          	addi	sp,sp,-112
    80006edc:	06113423          	sd	ra,104(sp)
    80006ee0:	06813023          	sd	s0,96(sp)
    80006ee4:	04913c23          	sd	s1,88(sp)
    80006ee8:	07010413          	addi	s0,sp,112
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006eec:	00a00793          	li	a5,10
    80006ef0:	fcf43823          	sd	a5,-48(s0)
    80006ef4:	01400793          	li	a5,20
    80006ef8:	fcf43c23          	sd	a5,-40(s0)
    explicit timer1() : PeriodicThread(1) {}
    80006efc:	00100593          	li	a1,1
    80006f00:	f9040493          	addi	s1,s0,-112
    80006f04:	00048513          	mv	a0,s1
    80006f08:	ffffc097          	auipc	ra,0xffffc
    80006f0c:	d64080e7          	jalr	-668(ra) # 80002c6c <_ZN14PeriodicThreadC1Em>
    80006f10:	00006797          	auipc	a5,0x6
    80006f14:	0a878793          	addi	a5,a5,168 # 8000cfb8 <_ZTV6timer1+0x10>
    80006f18:	f8f43823          	sd	a5,-112(s0)
    80006f1c:	fa042c23          	sw	zero,-72(s0)
    thread_t sleepyThread[sleepy_thread_count];
    timer1 t;
    t.start();
    80006f20:	00048513          	mv	a0,s1
    80006f24:	ffffc097          	auipc	ra,0xffffc
    80006f28:	ad4080e7          	jalr	-1324(ra) # 800029f8 <_ZN6Thread5startEv>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006f2c:	00000493          	li	s1,0
    80006f30:	0080006f          	j	80006f38 <_Z5user2Pv+0x60>
    80006f34:	0014849b          	addiw	s1,s1,1
    80006f38:	00100793          	li	a5,1
    80006f3c:	0297c663          	blt	a5,s1,80006f68 <_Z5user2Pv+0x90>
        thread_create(&sleepyThread[i], f3, sleep_times + i);
    80006f40:	00349513          	slli	a0,s1,0x3
    80006f44:	fd040613          	addi	a2,s0,-48
    80006f48:	00a60633          	add	a2,a2,a0
    80006f4c:	00000597          	auipc	a1,0x0
    80006f50:	c5c58593          	addi	a1,a1,-932 # 80006ba8 <_ZL2f3Pv>
    80006f54:	fc040793          	addi	a5,s0,-64
    80006f58:	00a78533          	add	a0,a5,a0
    80006f5c:	ffffa097          	auipc	ra,0xffffa
    80006f60:	4a8080e7          	jalr	1192(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    80006f64:	fd1ff06f          	j	80006f34 <_Z5user2Pv+0x5c>
    }

    thread_join(sleepyThread[0]);
    80006f68:	fc043503          	ld	a0,-64(s0)
    80006f6c:	ffffa097          	auipc	ra,0xffffa
    80006f70:	574080e7          	jalr	1396(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(sleepyThread[1]);
    80006f74:	fc843503          	ld	a0,-56(s0)
    80006f78:	ffffa097          	auipc	ra,0xffffa
    80006f7c:	568080e7          	jalr	1384(ra) # 800014e0 <_Z11thread_joinP3TCB>
    t.terminate();
    80006f80:	f9040513          	addi	a0,s0,-112
    80006f84:	ffffc097          	auipc	ra,0xffffc
    80006f88:	cb8080e7          	jalr	-840(ra) # 80002c3c <_ZN14PeriodicThread9terminateEv>
    //t.join();
    printString("izlazim iz user 2\n");
    80006f8c:	00003517          	auipc	a0,0x3
    80006f90:	77c50513          	addi	a0,a0,1916 # 8000a708 <CONSOLE_STATUS+0x6f8>
    80006f94:	fffff097          	auipc	ra,0xfffff
    80006f98:	900080e7          	jalr	-1792(ra) # 80005894 <_Z11printStringPKc>
private:
    sem_t myHandle;
};


class PeriodicThread : public Thread {
    80006f9c:	00006797          	auipc	a5,0x6
    80006fa0:	0c47b783          	ld	a5,196(a5) # 8000d060 <_GLOBAL_OFFSET_TABLE_+0x38>
    80006fa4:	01078793          	addi	a5,a5,16
    80006fa8:	f8f43823          	sd	a5,-112(s0)
    80006fac:	f9040513          	addi	a0,s0,-112
    80006fb0:	ffffb097          	auipc	ra,0xffffb
    80006fb4:	7dc080e7          	jalr	2012(ra) # 8000278c <_ZN6ThreadD1Ev>
    80006fb8:	06813083          	ld	ra,104(sp)
    80006fbc:	06013403          	ld	s0,96(sp)
    80006fc0:	05813483          	ld	s1,88(sp)
    80006fc4:	07010113          	addi	sp,sp,112
    80006fc8:	00008067          	ret
    80006fcc:	00050493          	mv	s1,a0
    80006fd0:	00006797          	auipc	a5,0x6
    80006fd4:	0907b783          	ld	a5,144(a5) # 8000d060 <_GLOBAL_OFFSET_TABLE_+0x38>
    80006fd8:	01078793          	addi	a5,a5,16
    80006fdc:	f8f43823          	sd	a5,-112(s0)
    80006fe0:	f9040513          	addi	a0,s0,-112
    80006fe4:	ffffb097          	auipc	ra,0xffffb
    80006fe8:	7a8080e7          	jalr	1960(ra) # 8000278c <_ZN6ThreadD1Ev>
    80006fec:	00048513          	mv	a0,s1
    80006ff0:	00007097          	auipc	ra,0x7
    80006ff4:	388080e7          	jalr	904(ra) # 8000e378 <_Unwind_Resume>

0000000080006ff8 <_ZN6timer118periodicActivationEv>:
    void periodicActivation() override {
    80006ff8:	fe010113          	addi	sp,sp,-32
    80006ffc:	00113c23          	sd	ra,24(sp)
    80007000:	00813823          	sd	s0,16(sp)
    80007004:	00913423          	sd	s1,8(sp)
    80007008:	02010413          	addi	s0,sp,32
    8000700c:	00050493          	mv	s1,a0
        printString("Tajmer: ");
    80007010:	00003517          	auipc	a0,0x3
    80007014:	71050513          	addi	a0,a0,1808 # 8000a720 <CONSOLE_STATUS+0x710>
    80007018:	fffff097          	auipc	ra,0xfffff
    8000701c:	87c080e7          	jalr	-1924(ra) # 80005894 <_Z11printStringPKc>
        printInt(counter++);
    80007020:	0284a503          	lw	a0,40(s1)
    80007024:	0015079b          	addiw	a5,a0,1
    80007028:	02f4a423          	sw	a5,40(s1)
    8000702c:	00000613          	li	a2,0
    80007030:	00a00593          	li	a1,10
    80007034:	fffff097          	auipc	ra,0xfffff
    80007038:	a10080e7          	jalr	-1520(ra) # 80005a44 <_Z8printIntiii>
        printString("\n");
    8000703c:	00003517          	auipc	a0,0x3
    80007040:	53450513          	addi	a0,a0,1332 # 8000a570 <CONSOLE_STATUS+0x560>
    80007044:	fffff097          	auipc	ra,0xfffff
    80007048:	850080e7          	jalr	-1968(ra) # 80005894 <_Z11printStringPKc>
    }
    8000704c:	01813083          	ld	ra,24(sp)
    80007050:	01013403          	ld	s0,16(sp)
    80007054:	00813483          	ld	s1,8(sp)
    80007058:	02010113          	addi	sp,sp,32
    8000705c:	00008067          	ret

0000000080007060 <_ZN6timer1D1Ev>:
class timer1 : public PeriodicThread {
    80007060:	ff010113          	addi	sp,sp,-16
    80007064:	00113423          	sd	ra,8(sp)
    80007068:	00813023          	sd	s0,0(sp)
    8000706c:	01010413          	addi	s0,sp,16
    80007070:	00006797          	auipc	a5,0x6
    80007074:	ff07b783          	ld	a5,-16(a5) # 8000d060 <_GLOBAL_OFFSET_TABLE_+0x38>
    80007078:	01078793          	addi	a5,a5,16
    8000707c:	00f53023          	sd	a5,0(a0)
    80007080:	ffffb097          	auipc	ra,0xffffb
    80007084:	70c080e7          	jalr	1804(ra) # 8000278c <_ZN6ThreadD1Ev>
    80007088:	00813083          	ld	ra,8(sp)
    8000708c:	00013403          	ld	s0,0(sp)
    80007090:	01010113          	addi	sp,sp,16
    80007094:	00008067          	ret

0000000080007098 <_ZN6timer1D0Ev>:
    80007098:	fe010113          	addi	sp,sp,-32
    8000709c:	00113c23          	sd	ra,24(sp)
    800070a0:	00813823          	sd	s0,16(sp)
    800070a4:	00913423          	sd	s1,8(sp)
    800070a8:	02010413          	addi	s0,sp,32
    800070ac:	00050493          	mv	s1,a0
    800070b0:	00006797          	auipc	a5,0x6
    800070b4:	fb07b783          	ld	a5,-80(a5) # 8000d060 <_GLOBAL_OFFSET_TABLE_+0x38>
    800070b8:	01078793          	addi	a5,a5,16
    800070bc:	00f53023          	sd	a5,0(a0)
    800070c0:	ffffb097          	auipc	ra,0xffffb
    800070c4:	6cc080e7          	jalr	1740(ra) # 8000278c <_ZN6ThreadD1Ev>
    800070c8:	00048513          	mv	a0,s1
    800070cc:	ffffb097          	auipc	ra,0xffffb
    800070d0:	7c4080e7          	jalr	1988(ra) # 80002890 <_ZdlPv>
    800070d4:	01813083          	ld	ra,24(sp)
    800070d8:	01013403          	ld	s0,16(sp)
    800070dc:	00813483          	ld	s1,8(sp)
    800070e0:	02010113          	addi	sp,sp,32
    800070e4:	00008067          	ret

00000000800070e8 <_Z7maincppv>:

void userMain();

void user(void*);
void user2(void*);
int maincpp() {
    800070e8:	fc010113          	addi	sp,sp,-64
    800070ec:	02113c23          	sd	ra,56(sp)
    800070f0:	02813823          	sd	s0,48(sp)
    800070f4:	02913423          	sd	s1,40(sp)
    800070f8:	03213023          	sd	s2,32(sp)
    800070fc:	01313c23          	sd	s3,24(sp)
    80007100:	04010413          	addi	s0,sp,64
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80007104:	00006797          	auipc	a5,0x6
    80007108:	fac7b783          	ld	a5,-84(a5) # 8000d0b0 <_GLOBAL_OFFSET_TABLE_+0x88>
    8000710c:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80007110:	ffffb097          	auipc	ra,0xffffb
    80007114:	b8c080e7          	jalr	-1140(ra) # 80001c9c <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80007118:	ffffa097          	auipc	ra,0xffffa
    8000711c:	5f4080e7          	jalr	1524(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>

    //pravljenje niti
    thread_t mainHandle;
    Thread* idleHandle = new IdleThread();
    80007120:	02000513          	li	a0,32
    80007124:	ffffb097          	auipc	ra,0xffffb
    80007128:	71c080e7          	jalr	1820(ra) # 80002840 <_Znwm>
    8000712c:	00050913          	mv	s2,a0
    80007130:	00053023          	sd	zero,0(a0)
    80007134:	00053423          	sd	zero,8(a0)
    80007138:	00053823          	sd	zero,16(a0)
    8000713c:	00053c23          	sd	zero,24(a0)
class IdleThread : public Thread {
    80007140:	ffffc097          	auipc	ra,0xffffc
    80007144:	9f0080e7          	jalr	-1552(ra) # 80002b30 <_ZN6ThreadC1Ev>
    80007148:	00006797          	auipc	a5,0x6
    8000714c:	ea078793          	addi	a5,a5,-352 # 8000cfe8 <_ZTV10IdleThread+0x10>
    80007150:	00f93023          	sd	a5,0(s2)
    Thread* consoleOutputHandle = new KernelConsumer();
    80007154:	02000513          	li	a0,32
    80007158:	ffffb097          	auipc	ra,0xffffb
    8000715c:	6e8080e7          	jalr	1768(ra) # 80002840 <_Znwm>
    80007160:	00050493          	mv	s1,a0
    80007164:	00053023          	sd	zero,0(a0)
    80007168:	00053423          	sd	zero,8(a0)
    8000716c:	00053823          	sd	zero,16(a0)
    80007170:	00053c23          	sd	zero,24(a0)
class KernelConsumer : public Thread {
    80007174:	ffffc097          	auipc	ra,0xffffc
    80007178:	9bc080e7          	jalr	-1604(ra) # 80002b30 <_ZN6ThreadC1Ev>
    8000717c:	00006797          	auipc	a5,0x6
    80007180:	e9478793          	addi	a5,a5,-364 # 8000d010 <_ZTV14KernelConsumer+0x10>
    80007184:	00f4b023          	sd	a5,0(s1)
    Thread* userThr = new Thread((TCB::Body)userMain, nullptr);
    80007188:	02000513          	li	a0,32
    8000718c:	ffffb097          	auipc	ra,0xffffb
    80007190:	6b4080e7          	jalr	1716(ra) # 80002840 <_Znwm>
    80007194:	00050993          	mv	s3,a0
    80007198:	00000613          	li	a2,0
    8000719c:	00006597          	auipc	a1,0x6
    800071a0:	e945b583          	ld	a1,-364(a1) # 8000d030 <_GLOBAL_OFFSET_TABLE_+0x8>
    800071a4:	ffffb097          	auipc	ra,0xffffb
    800071a8:	7bc080e7          	jalr	1980(ra) # 80002960 <_ZN6ThreadC1EPFvPvES0_>
    800071ac:	0580006f          	j	80007204 <_Z7maincppv+0x11c>
    800071b0:	00050493          	mv	s1,a0
    Thread* idleHandle = new IdleThread();
    800071b4:	00090513          	mv	a0,s2
    800071b8:	ffffb097          	auipc	ra,0xffffb
    800071bc:	6d8080e7          	jalr	1752(ra) # 80002890 <_ZdlPv>
    800071c0:	00048513          	mv	a0,s1
    800071c4:	00007097          	auipc	ra,0x7
    800071c8:	1b4080e7          	jalr	436(ra) # 8000e378 <_Unwind_Resume>
    800071cc:	00050913          	mv	s2,a0
    Thread* consoleOutputHandle = new KernelConsumer();
    800071d0:	00048513          	mv	a0,s1
    800071d4:	ffffb097          	auipc	ra,0xffffb
    800071d8:	6bc080e7          	jalr	1724(ra) # 80002890 <_ZdlPv>
    800071dc:	00090513          	mv	a0,s2
    800071e0:	00007097          	auipc	ra,0x7
    800071e4:	198080e7          	jalr	408(ra) # 8000e378 <_Unwind_Resume>
    800071e8:	00050493          	mv	s1,a0
    Thread* userThr = new Thread((TCB::Body)userMain, nullptr);
    800071ec:	00098513          	mv	a0,s3
    800071f0:	ffffb097          	auipc	ra,0xffffb
    800071f4:	6a0080e7          	jalr	1696(ra) # 80002890 <_ZdlPv>
    800071f8:	00048513          	mv	a0,s1
    800071fc:	00007097          	auipc	ra,0x7
    80007200:	17c080e7          	jalr	380(ra) # 8000e378 <_Unwind_Resume>
    //Thread* userThr = new Thread(user, nullptr);
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    80007204:	00000613          	li	a2,0
    80007208:	00006597          	auipc	a1,0x6
    8000720c:	e885b583          	ld	a1,-376(a1) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x68>
    80007210:	fc840513          	addi	a0,s0,-56
    80007214:	ffffa097          	auipc	ra,0xffffa
    80007218:	1f0080e7          	jalr	496(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    8000721c:	fc843783          	ld	a5,-56(s0)

    void setJoiningWithTCB(TCB* tcb) { joiningWithTCB = tcb; }

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }
    80007220:	00006717          	auipc	a4,0x6
    80007224:	e8073703          	ld	a4,-384(a4) # 8000d0a0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80007228:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    8000722c:	00100713          	li	a4,1
    80007230:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    idleHandle->start();
    80007234:	00090513          	mv	a0,s2
    80007238:	ffffb097          	auipc	ra,0xffffb
    8000723c:	7c0080e7          	jalr	1984(ra) # 800029f8 <_ZN6Thread5startEv>
    consoleOutputHandle->start();
    80007240:	00048513          	mv	a0,s1
    80007244:	ffffb097          	auipc	ra,0xffffb
    80007248:	7b4080e7          	jalr	1972(ra) # 800029f8 <_ZN6Thread5startEv>
    userThr->start();
    8000724c:	00098513          	mv	a0,s3
    80007250:	ffffb097          	auipc	ra,0xffffb
    80007254:	7a8080e7          	jalr	1960(ra) # 800029f8 <_ZN6Thread5startEv>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80007258:	00200493          	li	s1,2
    8000725c:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    userThr->join();
    80007260:	00098513          	mv	a0,s3
    80007264:	ffffb097          	auipc	ra,0xffffb
    80007268:	7dc080e7          	jalr	2012(ra) # 80002a40 <_ZN6Thread4joinEv>
    //stavlja karakter u ulazni bafer; ako je bafer pun, ignorise se
    static void placeInInput(char c);

    //ispis svih preostalih karaktera u izlaznom baferu
    static void flush() {
        __asm__ volatile("li a0, 0x43");
    8000726c:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80007270:	00000073          	ecall
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80007274:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80007278:	00000513          	li	a0,0
    8000727c:	03813083          	ld	ra,56(sp)
    80007280:	03013403          	ld	s0,48(sp)
    80007284:	02813483          	ld	s1,40(sp)
    80007288:	02013903          	ld	s2,32(sp)
    8000728c:	01813983          	ld	s3,24(sp)
    80007290:	04010113          	addi	sp,sp,64
    80007294:	00008067          	ret

0000000080007298 <_ZN10IdleThread3runEv>:
    void run() override {
    80007298:	ff010113          	addi	sp,sp,-16
    8000729c:	00113423          	sd	ra,8(sp)
    800072a0:	00813023          	sd	s0,0(sp)
    800072a4:	01010413          	addi	s0,sp,16
        while (1) { thread_dispatch(); }
    800072a8:	ffffa097          	auipc	ra,0xffffa
    800072ac:	218080e7          	jalr	536(ra) # 800014c0 <_Z15thread_dispatchv>
    800072b0:	ff9ff06f          	j	800072a8 <_ZN10IdleThread3runEv+0x10>

00000000800072b4 <_ZN10IdleThreadD1Ev>:
class IdleThread : public Thread {
    800072b4:	ff010113          	addi	sp,sp,-16
    800072b8:	00113423          	sd	ra,8(sp)
    800072bc:	00813023          	sd	s0,0(sp)
    800072c0:	01010413          	addi	s0,sp,16
    800072c4:	00006797          	auipc	a5,0x6
    800072c8:	d2478793          	addi	a5,a5,-732 # 8000cfe8 <_ZTV10IdleThread+0x10>
    800072cc:	00f53023          	sd	a5,0(a0)
    800072d0:	ffffb097          	auipc	ra,0xffffb
    800072d4:	4bc080e7          	jalr	1212(ra) # 8000278c <_ZN6ThreadD1Ev>
    800072d8:	00813083          	ld	ra,8(sp)
    800072dc:	00013403          	ld	s0,0(sp)
    800072e0:	01010113          	addi	sp,sp,16
    800072e4:	00008067          	ret

00000000800072e8 <_ZN10IdleThreadD0Ev>:
    800072e8:	fe010113          	addi	sp,sp,-32
    800072ec:	00113c23          	sd	ra,24(sp)
    800072f0:	00813823          	sd	s0,16(sp)
    800072f4:	00913423          	sd	s1,8(sp)
    800072f8:	02010413          	addi	s0,sp,32
    800072fc:	00050493          	mv	s1,a0
    80007300:	00006797          	auipc	a5,0x6
    80007304:	ce878793          	addi	a5,a5,-792 # 8000cfe8 <_ZTV10IdleThread+0x10>
    80007308:	00f53023          	sd	a5,0(a0)
    8000730c:	ffffb097          	auipc	ra,0xffffb
    80007310:	480080e7          	jalr	1152(ra) # 8000278c <_ZN6ThreadD1Ev>
    80007314:	00048513          	mv	a0,s1
    80007318:	ffffb097          	auipc	ra,0xffffb
    8000731c:	578080e7          	jalr	1400(ra) # 80002890 <_ZdlPv>
    80007320:	01813083          	ld	ra,24(sp)
    80007324:	01013403          	ld	s0,16(sp)
    80007328:	00813483          	ld	s1,8(sp)
    8000732c:	02010113          	addi	sp,sp,32
    80007330:	00008067          	ret

0000000080007334 <_ZN14KernelConsumerD1Ev>:
class KernelConsumer : public Thread {
    80007334:	ff010113          	addi	sp,sp,-16
    80007338:	00113423          	sd	ra,8(sp)
    8000733c:	00813023          	sd	s0,0(sp)
    80007340:	01010413          	addi	s0,sp,16
    80007344:	00006797          	auipc	a5,0x6
    80007348:	ccc78793          	addi	a5,a5,-820 # 8000d010 <_ZTV14KernelConsumer+0x10>
    8000734c:	00f53023          	sd	a5,0(a0)
    80007350:	ffffb097          	auipc	ra,0xffffb
    80007354:	43c080e7          	jalr	1084(ra) # 8000278c <_ZN6ThreadD1Ev>
    80007358:	00813083          	ld	ra,8(sp)
    8000735c:	00013403          	ld	s0,0(sp)
    80007360:	01010113          	addi	sp,sp,16
    80007364:	00008067          	ret

0000000080007368 <_ZN14KernelConsumerD0Ev>:
    80007368:	fe010113          	addi	sp,sp,-32
    8000736c:	00113c23          	sd	ra,24(sp)
    80007370:	00813823          	sd	s0,16(sp)
    80007374:	00913423          	sd	s1,8(sp)
    80007378:	02010413          	addi	s0,sp,32
    8000737c:	00050493          	mv	s1,a0
    80007380:	00006797          	auipc	a5,0x6
    80007384:	c9078793          	addi	a5,a5,-880 # 8000d010 <_ZTV14KernelConsumer+0x10>
    80007388:	00f53023          	sd	a5,0(a0)
    8000738c:	ffffb097          	auipc	ra,0xffffb
    80007390:	400080e7          	jalr	1024(ra) # 8000278c <_ZN6ThreadD1Ev>
    80007394:	00048513          	mv	a0,s1
    80007398:	ffffb097          	auipc	ra,0xffffb
    8000739c:	4f8080e7          	jalr	1272(ra) # 80002890 <_ZdlPv>
    800073a0:	01813083          	ld	ra,24(sp)
    800073a4:	01013403          	ld	s0,16(sp)
    800073a8:	00813483          	ld	s1,8(sp)
    800073ac:	02010113          	addi	sp,sp,32
    800073b0:	00008067          	ret

00000000800073b4 <_ZN14KernelConsumer3runEv>:
    void run() override {
    800073b4:	ff010113          	addi	sp,sp,-16
    800073b8:	00113423          	sd	ra,8(sp)
    800073bc:	00813023          	sd	s0,0(sp)
    800073c0:	01010413          	addi	s0,sp,16
    800073c4:	0280006f          	j	800073ec <_ZN14KernelConsumer3runEv+0x38>

    static uint8 getSRvalue() { return *sr; }

    static uint8 getDRvalue() { return *dr; }

    static void setDRvalue(char c) { *dr = c; }
    800073c8:	00006797          	auipc	a5,0x6
    800073cc:	cc07b783          	ld	a5,-832(a5) # 8000d088 <_GLOBAL_OFFSET_TABLE_+0x60>
    800073d0:	0007b783          	ld	a5,0(a5)
    800073d4:	00a78023          	sb	a0,0(a5)
            sem_signal(KConsole::getOutputBufferHasSpace());
    800073d8:	00006797          	auipc	a5,0x6
    800073dc:	cc07b783          	ld	a5,-832(a5) # 8000d098 <_GLOBAL_OFFSET_TABLE_+0x70>
    800073e0:	0007b503          	ld	a0,0(a5)
    800073e4:	ffffa097          	auipc	ra,0xffffa
    800073e8:	1ec080e7          	jalr	492(ra) # 800015d0 <_Z10sem_signalP4KSem>
            char c = KConsole::getFromOutput();
    800073ec:	ffffa097          	auipc	ra,0xffffa
    800073f0:	3d8080e7          	jalr	984(ra) # 800017c4 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    800073f4:	00006797          	auipc	a5,0x6
    800073f8:	cdc7b783          	ld	a5,-804(a5) # 8000d0d0 <_GLOBAL_OFFSET_TABLE_+0xa8>
    800073fc:	0007b783          	ld	a5,0(a5)
    80007400:	0007c783          	lbu	a5,0(a5)
            while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80007404:	0207f793          	andi	a5,a5,32
    80007408:	fe0786e3          	beqz	a5,800073f4 <_ZN14KernelConsumer3runEv+0x40>
    8000740c:	fbdff06f          	j	800073c8 <_ZN14KernelConsumer3runEv+0x14>

0000000080007410 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80007410:	fa010113          	addi	sp,sp,-96
    80007414:	04813c23          	sd	s0,88(sp)
    80007418:	06010413          	addi	s0,sp,96
    8000741c:	faa43423          	sd	a0,-88(s0)
    80007420:	00058793          	mv	a5,a1
    80007424:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80007428:	fa843783          	ld	a5,-88(s0)
    8000742c:	00079663          	bnez	a5,80007438 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80007430:	00000793          	li	a5,0
    80007434:	2040006f          	j	80007638 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80007438:	fa843783          	ld	a5,-88(s0)
    8000743c:	0067d713          	srli	a4,a5,0x6
    80007440:	fa843783          	ld	a5,-88(s0)
    80007444:	03f7f793          	andi	a5,a5,63
    80007448:	00078663          	beqz	a5,80007454 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    8000744c:	00100793          	li	a5,1
    80007450:	0080006f          	j	80007458 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80007454:	00000793          	li	a5,0
    80007458:	00e787b3          	add	a5,a5,a4
    8000745c:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80007460:	fc843783          	ld	a5,-56(s0)
    80007464:	00679793          	slli	a5,a5,0x6
    80007468:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    8000746c:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80007470:	00006797          	auipc	a5,0x6
    80007474:	e3078793          	addi	a5,a5,-464 # 8000d2a0 <_ZN15MemoryAllocator11freeMemHeadE>
    80007478:	0007b783          	ld	a5,0(a5)
    8000747c:	fef43023          	sd	a5,-32(s0)
    80007480:	fe043783          	ld	a5,-32(s0)
    80007484:	1a078863          	beqz	a5,80007634 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    80007488:	fe043783          	ld	a5,-32(s0)
    8000748c:	0087b783          	ld	a5,8(a5)
    80007490:	fa843703          	ld	a4,-88(s0)
    80007494:	18e7e263          	bltu	a5,a4,80007618 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    80007498:	fe043703          	ld	a4,-32(s0)
    8000749c:	fa843783          	ld	a5,-88(s0)
    800074a0:	00f707b3          	add	a5,a4,a5
    800074a4:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    800074a8:	fe043783          	ld	a5,-32(s0)
    800074ac:	0087b703          	ld	a4,8(a5)
    800074b0:	fa843783          	ld	a5,-88(s0)
    800074b4:	40f707b3          	sub	a5,a4,a5
    800074b8:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    800074bc:	fb843703          	ld	a4,-72(s0)
    800074c0:	02000793          	li	a5,32
    800074c4:	04e7e463          	bltu	a5,a4,8000750c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    800074c8:	fa843703          	ld	a4,-88(s0)
    800074cc:	fb843783          	ld	a5,-72(s0)
    800074d0:	00f707b3          	add	a5,a4,a5
    800074d4:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    800074d8:	fe843783          	ld	a5,-24(s0)
    800074dc:	00078c63          	beqz	a5,800074f4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    800074e0:	fe043783          	ld	a5,-32(s0)
    800074e4:	0007b703          	ld	a4,0(a5)
    800074e8:	fe843783          	ld	a5,-24(s0)
    800074ec:	00e7b023          	sd	a4,0(a5)
    800074f0:	0600006f          	j	80007550 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    800074f4:	fe043783          	ld	a5,-32(s0)
    800074f8:	0007b703          	ld	a4,0(a5)
    800074fc:	00006797          	auipc	a5,0x6
    80007500:	da478793          	addi	a5,a5,-604 # 8000d2a0 <_ZN15MemoryAllocator11freeMemHeadE>
    80007504:	00e7b023          	sd	a4,0(a5)
    80007508:	0480006f          	j	80007550 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    8000750c:	fc043783          	ld	a5,-64(s0)
    80007510:	fb843703          	ld	a4,-72(s0)
    80007514:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    80007518:	fe043783          	ld	a5,-32(s0)
    8000751c:	0007b703          	ld	a4,0(a5)
    80007520:	fc043783          	ld	a5,-64(s0)
    80007524:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    80007528:	fe843783          	ld	a5,-24(s0)
    8000752c:	00078a63          	beqz	a5,80007540 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    80007530:	fe843783          	ld	a5,-24(s0)
    80007534:	fc043703          	ld	a4,-64(s0)
    80007538:	00e7b023          	sd	a4,0(a5)
    8000753c:	0140006f          	j	80007550 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    80007540:	00006797          	auipc	a5,0x6
    80007544:	d6078793          	addi	a5,a5,-672 # 8000d2a0 <_ZN15MemoryAllocator11freeMemHeadE>
    80007548:	fc043703          	ld	a4,-64(s0)
    8000754c:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    80007550:	fe043783          	ld	a5,-32(s0)
    80007554:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    80007558:	fb043783          	ld	a5,-80(s0)
    8000755c:	fa843703          	ld	a4,-88(s0)
    80007560:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    80007564:	fb043783          	ld	a5,-80(s0)
    80007568:	fa442703          	lw	a4,-92(s0)
    8000756c:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    80007570:	fb043783          	ld	a5,-80(s0)
    80007574:	02078713          	addi	a4,a5,32
    80007578:	fb043783          	ld	a5,-80(s0)
    8000757c:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    80007580:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80007584:	00006797          	auipc	a5,0x6
    80007588:	d1478793          	addi	a5,a5,-748 # 8000d298 <_ZN15MemoryAllocator11usedMemHeadE>
    8000758c:	0007b783          	ld	a5,0(a5)
    80007590:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80007594:	fd043783          	ld	a5,-48(s0)
    80007598:	02078463          	beqz	a5,800075c0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    8000759c:	fd043703          	ld	a4,-48(s0)
    800075a0:	fb043783          	ld	a5,-80(s0)
    800075a4:	00f77e63          	bgeu	a4,a5,800075c0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    800075a8:	fd043783          	ld	a5,-48(s0)
    800075ac:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    800075b0:	fd043783          	ld	a5,-48(s0)
    800075b4:	0007b783          	ld	a5,0(a5)
    800075b8:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    800075bc:	fd9ff06f          	j	80007594 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    800075c0:	fd843783          	ld	a5,-40(s0)
    800075c4:	02079663          	bnez	a5,800075f0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    800075c8:	00006797          	auipc	a5,0x6
    800075cc:	cd078793          	addi	a5,a5,-816 # 8000d298 <_ZN15MemoryAllocator11usedMemHeadE>
    800075d0:	0007b703          	ld	a4,0(a5)
    800075d4:	fb043783          	ld	a5,-80(s0)
    800075d8:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    800075dc:	00006797          	auipc	a5,0x6
    800075e0:	cbc78793          	addi	a5,a5,-836 # 8000d298 <_ZN15MemoryAllocator11usedMemHeadE>
    800075e4:	fb043703          	ld	a4,-80(s0)
    800075e8:	00e7b023          	sd	a4,0(a5)
    800075ec:	0200006f          	j	8000760c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    800075f0:	fd843783          	ld	a5,-40(s0)
    800075f4:	0007b703          	ld	a4,0(a5)
    800075f8:	fb043783          	ld	a5,-80(s0)
    800075fc:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    80007600:	fd843783          	ld	a5,-40(s0)
    80007604:	fb043703          	ld	a4,-80(s0)
    80007608:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    8000760c:	fb043783          	ld	a5,-80(s0)
    80007610:	0187b783          	ld	a5,24(a5)
    80007614:	0240006f          	j	80007638 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    80007618:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    8000761c:	fe043783          	ld	a5,-32(s0)
    80007620:	fef43423          	sd	a5,-24(s0)
    80007624:	fe043783          	ld	a5,-32(s0)
    80007628:	0007b783          	ld	a5,0(a5)
    8000762c:	fef43023          	sd	a5,-32(s0)
    80007630:	e51ff06f          	j	80007480 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    80007634:	00000793          	li	a5,0
}
    80007638:	00078513          	mv	a0,a5
    8000763c:	05813403          	ld	s0,88(sp)
    80007640:	06010113          	addi	sp,sp,96
    80007644:	00008067          	ret

0000000080007648 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80007648:	fb010113          	addi	sp,sp,-80
    8000764c:	04113423          	sd	ra,72(sp)
    80007650:	04813023          	sd	s0,64(sp)
    80007654:	05010413          	addi	s0,sp,80
    80007658:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    8000765c:	fb843783          	ld	a5,-72(s0)
    80007660:	00079663          	bnez	a5,8000766c <_ZN15MemoryAllocator5kfreeEPv+0x24>
    80007664:	00000793          	li	a5,0
    80007668:	1740006f          	j	800077dc <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    8000766c:	00006797          	auipc	a5,0x6
    80007670:	c2c78793          	addi	a5,a5,-980 # 8000d298 <_ZN15MemoryAllocator11usedMemHeadE>
    80007674:	0007b783          	ld	a5,0(a5)
    80007678:	00079663          	bnez	a5,80007684 <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    8000767c:	fff00793          	li	a5,-1
    80007680:	15c0006f          	j	800077dc <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80007684:	fb843783          	ld	a5,-72(s0)
    80007688:	fe078793          	addi	a5,a5,-32
    8000768c:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    80007690:	00006797          	auipc	a5,0x6
    80007694:	c0878793          	addi	a5,a5,-1016 # 8000d298 <_ZN15MemoryAllocator11usedMemHeadE>
    80007698:	0007b783          	ld	a5,0(a5)
    8000769c:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    800076a0:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    800076a4:	fe843783          	ld	a5,-24(s0)
    800076a8:	02078463          	beqz	a5,800076d0 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    800076ac:	fe843703          	ld	a4,-24(s0)
    800076b0:	fb843783          	ld	a5,-72(s0)
    800076b4:	00f70e63          	beq	a4,a5,800076d0 <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    800076b8:	fe843783          	ld	a5,-24(s0)
    800076bc:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    800076c0:	fe843783          	ld	a5,-24(s0)
    800076c4:	0007b783          	ld	a5,0(a5)
    800076c8:	fef43423          	sd	a5,-24(s0)
    800076cc:	fd9ff06f          	j	800076a4 <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    800076d0:	fe843703          	ld	a4,-24(s0)
    800076d4:	fb843783          	ld	a5,-72(s0)
    800076d8:	00f70663          	beq	a4,a5,800076e4 <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    800076dc:	fff00793          	li	a5,-1
    800076e0:	0fc0006f          	j	800077dc <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    800076e4:	fe043783          	ld	a5,-32(s0)
    800076e8:	00078c63          	beqz	a5,80007700 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    800076ec:	fe843783          	ld	a5,-24(s0)
    800076f0:	0007b703          	ld	a4,0(a5)
    800076f4:	fe043783          	ld	a5,-32(s0)
    800076f8:	00e7b023          	sd	a4,0(a5)
    800076fc:	0180006f          	j	80007714 <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    80007700:	fe843783          	ld	a5,-24(s0)
    80007704:	0007b703          	ld	a4,0(a5)
    80007708:	00006797          	auipc	a5,0x6
    8000770c:	b9078793          	addi	a5,a5,-1136 # 8000d298 <_ZN15MemoryAllocator11usedMemHeadE>
    80007710:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    80007714:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    80007718:	00006797          	auipc	a5,0x6
    8000771c:	b8878793          	addi	a5,a5,-1144 # 8000d2a0 <_ZN15MemoryAllocator11freeMemHeadE>
    80007720:	0007b783          	ld	a5,0(a5)
    80007724:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    80007728:	fd043783          	ld	a5,-48(s0)
    8000772c:	02078463          	beqz	a5,80007754 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80007730:	fd043703          	ld	a4,-48(s0)
    80007734:	fb843783          	ld	a5,-72(s0)
    80007738:	00f77e63          	bgeu	a4,a5,80007754 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    8000773c:	fd043783          	ld	a5,-48(s0)
    80007740:	fcf43c23          	sd	a5,-40(s0)
    80007744:	fd043783          	ld	a5,-48(s0)
    80007748:	0007b783          	ld	a5,0(a5)
    8000774c:	fcf43823          	sd	a5,-48(s0)
    80007750:	fd9ff06f          	j	80007728 <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    80007754:	fb843783          	ld	a5,-72(s0)
    80007758:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    8000775c:	fb843783          	ld	a5,-72(s0)
    80007760:	0087b783          	ld	a5,8(a5)
    80007764:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    80007768:	fc843783          	ld	a5,-56(s0)
    8000776c:	fc043703          	ld	a4,-64(s0)
    80007770:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    80007774:	fd843783          	ld	a5,-40(s0)
    80007778:	02078263          	beqz	a5,8000779c <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    8000777c:	fd843783          	ld	a5,-40(s0)
    80007780:	0007b703          	ld	a4,0(a5)
    80007784:	fc843783          	ld	a5,-56(s0)
    80007788:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    8000778c:	fd843783          	ld	a5,-40(s0)
    80007790:	fc843703          	ld	a4,-56(s0)
    80007794:	00e7b023          	sd	a4,0(a5)
    80007798:	0280006f          	j	800077c0 <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    8000779c:	00006797          	auipc	a5,0x6
    800077a0:	b0478793          	addi	a5,a5,-1276 # 8000d2a0 <_ZN15MemoryAllocator11freeMemHeadE>
    800077a4:	0007b703          	ld	a4,0(a5)
    800077a8:	fc843783          	ld	a5,-56(s0)
    800077ac:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    800077b0:	00006797          	auipc	a5,0x6
    800077b4:	af078793          	addi	a5,a5,-1296 # 8000d2a0 <_ZN15MemoryAllocator11freeMemHeadE>
    800077b8:	fc843703          	ld	a4,-56(s0)
    800077bc:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    800077c0:	fc843503          	ld	a0,-56(s0)
    800077c4:	00000097          	auipc	ra,0x0
    800077c8:	02c080e7          	jalr	44(ra) # 800077f0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    800077cc:	fd843503          	ld	a0,-40(s0)
    800077d0:	00000097          	auipc	ra,0x0
    800077d4:	020080e7          	jalr	32(ra) # 800077f0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    800077d8:	00000793          	li	a5,0
}
    800077dc:	00078513          	mv	a0,a5
    800077e0:	04813083          	ld	ra,72(sp)
    800077e4:	04013403          	ld	s0,64(sp)
    800077e8:	05010113          	addi	sp,sp,80
    800077ec:	00008067          	ret

00000000800077f0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    800077f0:	fc010113          	addi	sp,sp,-64
    800077f4:	02813c23          	sd	s0,56(sp)
    800077f8:	04010413          	addi	s0,sp,64
    800077fc:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    80007800:	fc843783          	ld	a5,-56(s0)
    80007804:	00079663          	bnez	a5,80007810 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    80007808:	00000793          	li	a5,0
    8000780c:	0a00006f          	j	800078ac <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    80007810:	fc843783          	ld	a5,-56(s0)
    80007814:	0007b783          	ld	a5,0(a5)
    80007818:	00f037b3          	snez	a5,a5
    8000781c:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    80007820:	fc843783          	ld	a5,-56(s0)
    80007824:	0087b783          	ld	a5,8(a5)
    80007828:	fc843703          	ld	a4,-56(s0)
    8000782c:	00f707b3          	add	a5,a4,a5
    80007830:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    80007834:	fc843783          	ld	a5,-56(s0)
    80007838:	0007b783          	ld	a5,0(a5)
    8000783c:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    80007840:	fe043703          	ld	a4,-32(s0)
    80007844:	fd843783          	ld	a5,-40(s0)
    80007848:	40f707b3          	sub	a5,a4,a5
    8000784c:	0017b793          	seqz	a5,a5
    80007850:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    80007854:	fef44783          	lbu	a5,-17(s0)
    80007858:	0ff7f793          	andi	a5,a5,255
    8000785c:	04078663          	beqz	a5,800078a8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    80007860:	fd744783          	lbu	a5,-41(s0)
    80007864:	0ff7f793          	andi	a5,a5,255
    80007868:	04078063          	beqz	a5,800078a8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    8000786c:	fc843783          	ld	a5,-56(s0)
    80007870:	0087b703          	ld	a4,8(a5)
    80007874:	fc843783          	ld	a5,-56(s0)
    80007878:	0007b783          	ld	a5,0(a5)
    8000787c:	0087b783          	ld	a5,8(a5)
    80007880:	00f70733          	add	a4,a4,a5
    80007884:	fc843783          	ld	a5,-56(s0)
    80007888:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    8000788c:	fc843783          	ld	a5,-56(s0)
    80007890:	0007b783          	ld	a5,0(a5)
    80007894:	0007b703          	ld	a4,0(a5)
    80007898:	fc843783          	ld	a5,-56(s0)
    8000789c:	00e7b023          	sd	a4,0(a5)
        return 1;
    800078a0:	00100793          	li	a5,1
    800078a4:	0080006f          	j	800078ac <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    800078a8:	00000793          	li	a5,0
}
    800078ac:	00078513          	mv	a0,a5
    800078b0:	03813403          	ld	s0,56(sp)
    800078b4:	04010113          	addi	sp,sp,64
    800078b8:	00008067          	ret

00000000800078bc <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    800078bc:	fe010113          	addi	sp,sp,-32
    800078c0:	00813c23          	sd	s0,24(sp)
    800078c4:	02010413          	addi	s0,sp,32
    800078c8:	fea43423          	sd	a0,-24(s0)
    800078cc:	00058793          	mv	a5,a1
    800078d0:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    800078d4:	fe843783          	ld	a5,-24(s0)
    800078d8:	fe078793          	addi	a5,a5,-32
    800078dc:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    800078e0:	fe843783          	ld	a5,-24(s0)
    800078e4:	0107a703          	lw	a4,16(a5)
    800078e8:	fe442783          	lw	a5,-28(s0)
    800078ec:	0007879b          	sext.w	a5,a5
    800078f0:	40e787b3          	sub	a5,a5,a4
    800078f4:	0017b793          	seqz	a5,a5
    800078f8:	0ff7f793          	andi	a5,a5,255
}
    800078fc:	00078513          	mv	a0,a5
    80007900:	01813403          	ld	s0,24(sp)
    80007904:	02010113          	addi	sp,sp,32
    80007908:	00008067          	ret

000000008000790c <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    8000790c:	ff010113          	addi	sp,sp,-16
    80007910:	00813423          	sd	s0,8(sp)
    80007914:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    80007918:	00006797          	auipc	a5,0x6
    8000791c:	99078793          	addi	a5,a5,-1648 # 8000d2a8 <_ZN15MemoryAllocator11initializedE>
    80007920:	0007c783          	lbu	a5,0(a5)
    80007924:	0017c793          	xori	a5,a5,1
    80007928:	0ff7f793          	andi	a5,a5,255
    8000792c:	06078a63          	beqz	a5,800079a0 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    80007930:	00005797          	auipc	a5,0x5
    80007934:	7287b783          	ld	a5,1832(a5) # 8000d058 <_GLOBAL_OFFSET_TABLE_+0x30>
    80007938:	0007b703          	ld	a4,0(a5)
    8000793c:	00006797          	auipc	a5,0x6
    80007940:	96478793          	addi	a5,a5,-1692 # 8000d2a0 <_ZN15MemoryAllocator11freeMemHeadE>
    80007944:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    80007948:	00006797          	auipc	a5,0x6
    8000794c:	95878793          	addi	a5,a5,-1704 # 8000d2a0 <_ZN15MemoryAllocator11freeMemHeadE>
    80007950:	0007b783          	ld	a5,0(a5)
    80007954:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    80007958:	00005797          	auipc	a5,0x5
    8000795c:	7507b783          	ld	a5,1872(a5) # 8000d0a8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80007960:	0007b703          	ld	a4,0(a5)
    80007964:	00005797          	auipc	a5,0x5
    80007968:	6f47b783          	ld	a5,1780(a5) # 8000d058 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000796c:	0007b783          	ld	a5,0(a5)
    80007970:	40f70733          	sub	a4,a4,a5
    80007974:	00006797          	auipc	a5,0x6
    80007978:	92c78793          	addi	a5,a5,-1748 # 8000d2a0 <_ZN15MemoryAllocator11freeMemHeadE>
    8000797c:	0007b783          	ld	a5,0(a5)
    80007980:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    80007984:	00006797          	auipc	a5,0x6
    80007988:	91478793          	addi	a5,a5,-1772 # 8000d298 <_ZN15MemoryAllocator11usedMemHeadE>
    8000798c:	0007b023          	sd	zero,0(a5)

        initialized = true;
    80007990:	00006797          	auipc	a5,0x6
    80007994:	91878793          	addi	a5,a5,-1768 # 8000d2a8 <_ZN15MemoryAllocator11initializedE>
    80007998:	00100713          	li	a4,1
    8000799c:	00e78023          	sb	a4,0(a5)
    }
}
    800079a0:	00000013          	nop
    800079a4:	00813403          	ld	s0,8(sp)
    800079a8:	01010113          	addi	sp,sp,16
    800079ac:	00008067          	ret

00000000800079b0 <_Z13emptyFunctionPv>:
void idle(void*);

void kernelConsumerFunction(void*);


void emptyFunction(void*) {}
    800079b0:	ff010113          	addi	sp,sp,-16
    800079b4:	00813423          	sd	s0,8(sp)
    800079b8:	01010413          	addi	s0,sp,16
    800079bc:	00813403          	ld	s0,8(sp)
    800079c0:	01010113          	addi	sp,sp,16
    800079c4:	00008067          	ret

00000000800079c8 <_Z5nit1fPv>:

void nit1f(void*) {
    800079c8:	fe010113          	addi	sp,sp,-32
    800079cc:	00113c23          	sd	ra,24(sp)
    800079d0:	00813823          	sd	s0,16(sp)
    800079d4:	02010413          	addi	s0,sp,32
    while (true) {
        thread_t handle;
        thread_create(&handle, emptyFunction, nullptr);
    800079d8:	00000613          	li	a2,0
    800079dc:	00000597          	auipc	a1,0x0
    800079e0:	fd458593          	addi	a1,a1,-44 # 800079b0 <_Z13emptyFunctionPv>
    800079e4:	fe840513          	addi	a0,s0,-24
    800079e8:	ffffa097          	auipc	ra,0xffffa
    800079ec:	a1c080e7          	jalr	-1508(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    while (true) {
    800079f0:	fe9ff06f          	j	800079d8 <_Z5nit1fPv+0x10>

00000000800079f4 <_Z5nit2fPv>:
    }

    printString("\nGotova nit 1\n");
}

void nit2f(void* arg2) {
    800079f4:	ff010113          	addi	sp,sp,-16
    800079f8:	00113423          	sd	ra,8(sp)
    800079fc:	00813023          	sd	s0,0(sp)
    80007a00:	01010413          	addi	s0,sp,16
    printString("\nGotova nit 2\n");
    80007a04:	00003517          	auipc	a0,0x3
    80007a08:	cec50513          	addi	a0,a0,-788 # 8000a6f0 <CONSOLE_STATUS+0x6e0>
    80007a0c:	ffffe097          	auipc	ra,0xffffe
    80007a10:	e88080e7          	jalr	-376(ra) # 80005894 <_Z11printStringPKc>
}
    80007a14:	00813083          	ld	ra,8(sp)
    80007a18:	00013403          	ld	s0,0(sp)
    80007a1c:	01010113          	addi	sp,sp,16
    80007a20:	00008067          	ret

0000000080007a24 <_Z5nit3fPv>:


void nit3f(void*) {
    80007a24:	fe010113          	addi	sp,sp,-32
    80007a28:	00113c23          	sd	ra,24(sp)
    80007a2c:	00813823          	sd	s0,16(sp)
    80007a30:	00913423          	sd	s1,8(sp)
    80007a34:	02010413          	addi	s0,sp,32
    80007a38:	0180006f          	j	80007a50 <_Z5nit3fPv+0x2c>
    char slovo;
    do {
        slovo = getc();
        putc(slovo);
        if (slovo == '\r') putc('\n');
    80007a3c:	00a00513          	li	a0,10
    80007a40:	ffffa097          	auipc	ra,0xffffa
    80007a44:	be8080e7          	jalr	-1048(ra) # 80001628 <_Z4putcc>
    } while (slovo != '0');
    80007a48:	03000793          	li	a5,48
    80007a4c:	02f48263          	beq	s1,a5,80007a70 <_Z5nit3fPv+0x4c>
        slovo = getc();
    80007a50:	ffffa097          	auipc	ra,0xffffa
    80007a54:	bb0080e7          	jalr	-1104(ra) # 80001600 <_Z4getcv>
    80007a58:	00050493          	mv	s1,a0
        putc(slovo);
    80007a5c:	ffffa097          	auipc	ra,0xffffa
    80007a60:	bcc080e7          	jalr	-1076(ra) # 80001628 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    80007a64:	00d00793          	li	a5,13
    80007a68:	fef490e3          	bne	s1,a5,80007a48 <_Z5nit3fPv+0x24>
    80007a6c:	fd1ff06f          	j	80007a3c <_Z5nit3fPv+0x18>

    printString("\nGotova nit3\n");
    80007a70:	00003517          	auipc	a0,0x3
    80007a74:	cc050513          	addi	a0,a0,-832 # 8000a730 <CONSOLE_STATUS+0x720>
    80007a78:	ffffe097          	auipc	ra,0xffffe
    80007a7c:	e1c080e7          	jalr	-484(ra) # 80005894 <_Z11printStringPKc>
}
    80007a80:	01813083          	ld	ra,24(sp)
    80007a84:	01013403          	ld	s0,16(sp)
    80007a88:	00813483          	ld	s1,8(sp)
    80007a8c:	02010113          	addi	sp,sp,32
    80007a90:	00008067          	ret

0000000080007a94 <_Z5main5v>:


int main5() {
    80007a94:	fb010113          	addi	sp,sp,-80
    80007a98:	04113423          	sd	ra,72(sp)
    80007a9c:	04813023          	sd	s0,64(sp)
    80007aa0:	02913c23          	sd	s1,56(sp)
    80007aa4:	05010413          	addi	s0,sp,80
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80007aa8:	00005797          	auipc	a5,0x5
    80007aac:	6087b783          	ld	a5,1544(a5) # 8000d0b0 <_GLOBAL_OFFSET_TABLE_+0x88>
    80007ab0:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80007ab4:	ffffa097          	auipc	ra,0xffffa
    80007ab8:	1e8080e7          	jalr	488(ra) # 80001c9c <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80007abc:	ffffa097          	auipc	ra,0xffffa
    80007ac0:	c50080e7          	jalr	-944(ra) # 8000170c <_ZN8KConsole12initKConsoleEv>

    //testiranje kreiranja niti
    thread_t glavnaNit = nullptr;
    80007ac4:	fc043c23          	sd	zero,-40(s0)
    thread_t nit1 = nullptr;
    80007ac8:	fc043823          	sd	zero,-48(s0)
    thread_t nit2 = nullptr;
    80007acc:	fc043423          	sd	zero,-56(s0)
    thread_t nit3 = nullptr;
    80007ad0:	fc043023          	sd	zero,-64(s0)
    thread_t idleNit = nullptr;
    80007ad4:	fa043c23          	sd	zero,-72(s0)
    thread_t kernelConsumerThread = nullptr;
    80007ad8:	fa043823          	sd	zero,-80(s0)
    thread_create(&glavnaNit, (TCB::Body)main, nullptr);
    80007adc:	00000613          	li	a2,0
    80007ae0:	00005597          	auipc	a1,0x5
    80007ae4:	5b05b583          	ld	a1,1456(a1) # 8000d090 <_GLOBAL_OFFSET_TABLE_+0x68>
    80007ae8:	fd840513          	addi	a0,s0,-40
    80007aec:	ffffa097          	auipc	ra,0xffffa
    80007af0:	918080e7          	jalr	-1768(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    static void setRunning(TCB* newRunning) { running = newRunning; }
    80007af4:	fd843703          	ld	a4,-40(s0)
    80007af8:	00005797          	auipc	a5,0x5
    80007afc:	5a87b783          	ld	a5,1448(a5) # 8000d0a0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80007b00:	00e7b023          	sd	a4,0(a5)
    TCB::setRunning(glavnaNit);
    thread_create(&idleNit, idle, nullptr);
    80007b04:	00000613          	li	a2,0
    80007b08:	00005597          	auipc	a1,0x5
    80007b0c:	5b85b583          	ld	a1,1464(a1) # 8000d0c0 <_GLOBAL_OFFSET_TABLE_+0x98>
    80007b10:	fb840513          	addi	a0,s0,-72
    80007b14:	ffffa097          	auipc	ra,0xffffa
    80007b18:	8f0080e7          	jalr	-1808(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    80007b1c:	00000613          	li	a2,0
    80007b20:	00005597          	auipc	a1,0x5
    80007b24:	5485b583          	ld	a1,1352(a1) # 8000d068 <_GLOBAL_OFFSET_TABLE_+0x40>
    80007b28:	fb040513          	addi	a0,s0,-80
    80007b2c:	ffffa097          	auipc	ra,0xffffa
    80007b30:	8d8080e7          	jalr	-1832(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>


    thread_create(&nit1, nit1f, nullptr);
    80007b34:	00000613          	li	a2,0
    80007b38:	00000597          	auipc	a1,0x0
    80007b3c:	e9058593          	addi	a1,a1,-368 # 800079c8 <_Z5nit1fPv>
    80007b40:	fd040513          	addi	a0,s0,-48
    80007b44:	ffffa097          	auipc	ra,0xffffa
    80007b48:	8c0080e7          	jalr	-1856(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit2, nit2f, nullptr);
    80007b4c:	00000613          	li	a2,0
    80007b50:	00000597          	auipc	a1,0x0
    80007b54:	ea458593          	addi	a1,a1,-348 # 800079f4 <_Z5nit2fPv>
    80007b58:	fc840513          	addi	a0,s0,-56
    80007b5c:	ffffa097          	auipc	ra,0xffffa
    80007b60:	8a8080e7          	jalr	-1880(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit3, nit3f, nullptr);
    80007b64:	00000613          	li	a2,0
    80007b68:	00000597          	auipc	a1,0x0
    80007b6c:	ebc58593          	addi	a1,a1,-324 # 80007a24 <_Z5nit3fPv>
    80007b70:	fc040513          	addi	a0,s0,-64
    80007b74:	ffffa097          	auipc	ra,0xffffa
    80007b78:	890080e7          	jalr	-1904(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80007b7c:	00200493          	li	s1,2
    80007b80:	1004a073          	csrs	sstatus,s1

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    thread_join(nit1);
    80007b84:	fd043503          	ld	a0,-48(s0)
    80007b88:	ffffa097          	auipc	ra,0xffffa
    80007b8c:	958080e7          	jalr	-1704(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit2);
    80007b90:	fc843503          	ld	a0,-56(s0)
    80007b94:	ffffa097          	auipc	ra,0xffffa
    80007b98:	94c080e7          	jalr	-1716(ra) # 800014e0 <_Z11thread_joinP3TCB>
    thread_join(nit3);
    80007b9c:	fc043503          	ld	a0,-64(s0)
    80007ba0:	ffffa097          	auipc	ra,0xffffa
    80007ba4:	940080e7          	jalr	-1728(ra) # 800014e0 <_Z11thread_joinP3TCB>
    //thread_join(idleNit);

    printString("\nGotove user niti\n");
    80007ba8:	00003517          	auipc	a0,0x3
    80007bac:	b9850513          	addi	a0,a0,-1128 # 8000a740 <CONSOLE_STATUS+0x730>
    80007bb0:	ffffe097          	auipc	ra,0xffffe
    80007bb4:	ce4080e7          	jalr	-796(ra) # 80005894 <_Z11printStringPKc>

    printString("\nSad cu da izadjem\n");
    80007bb8:	00003517          	auipc	a0,0x3
    80007bbc:	ba050513          	addi	a0,a0,-1120 # 8000a758 <CONSOLE_STATUS+0x748>
    80007bc0:	ffffe097          	auipc	ra,0xffffe
    80007bc4:	cd4080e7          	jalr	-812(ra) # 80005894 <_Z11printStringPKc>
        __asm__ volatile("li a0, 0x43");
    80007bc8:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80007bcc:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80007bd0:	1004b073          	csrc	sstatus,s1
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);


    return 0;
    80007bd4:	00000513          	li	a0,0
    80007bd8:	04813083          	ld	ra,72(sp)
    80007bdc:	04013403          	ld	s0,64(sp)
    80007be0:	03813483          	ld	s1,56(sp)
    80007be4:	05010113          	addi	sp,sp,80
    80007be8:	00008067          	ret

0000000080007bec <start>:
    80007bec:	ff010113          	addi	sp,sp,-16
    80007bf0:	00813423          	sd	s0,8(sp)
    80007bf4:	01010413          	addi	s0,sp,16
    80007bf8:	300027f3          	csrr	a5,mstatus
    80007bfc:	ffffe737          	lui	a4,0xffffe
    80007c00:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff02ef>
    80007c04:	00e7f7b3          	and	a5,a5,a4
    80007c08:	00001737          	lui	a4,0x1
    80007c0c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80007c10:	00e7e7b3          	or	a5,a5,a4
    80007c14:	30079073          	csrw	mstatus,a5
    80007c18:	00000797          	auipc	a5,0x0
    80007c1c:	16078793          	addi	a5,a5,352 # 80007d78 <system_main>
    80007c20:	34179073          	csrw	mepc,a5
    80007c24:	00000793          	li	a5,0
    80007c28:	18079073          	csrw	satp,a5
    80007c2c:	000107b7          	lui	a5,0x10
    80007c30:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007c34:	30279073          	csrw	medeleg,a5
    80007c38:	30379073          	csrw	mideleg,a5
    80007c3c:	104027f3          	csrr	a5,sie
    80007c40:	2227e793          	ori	a5,a5,546
    80007c44:	10479073          	csrw	sie,a5
    80007c48:	fff00793          	li	a5,-1
    80007c4c:	00a7d793          	srli	a5,a5,0xa
    80007c50:	3b079073          	csrw	pmpaddr0,a5
    80007c54:	00f00793          	li	a5,15
    80007c58:	3a079073          	csrw	pmpcfg0,a5
    80007c5c:	f14027f3          	csrr	a5,mhartid
    80007c60:	0200c737          	lui	a4,0x200c
    80007c64:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007c68:	0007869b          	sext.w	a3,a5
    80007c6c:	00269713          	slli	a4,a3,0x2
    80007c70:	000f4637          	lui	a2,0xf4
    80007c74:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007c78:	00d70733          	add	a4,a4,a3
    80007c7c:	0037979b          	slliw	a5,a5,0x3
    80007c80:	020046b7          	lui	a3,0x2004
    80007c84:	00d787b3          	add	a5,a5,a3
    80007c88:	00c585b3          	add	a1,a1,a2
    80007c8c:	00371693          	slli	a3,a4,0x3
    80007c90:	00005717          	auipc	a4,0x5
    80007c94:	62070713          	addi	a4,a4,1568 # 8000d2b0 <timer_scratch>
    80007c98:	00b7b023          	sd	a1,0(a5)
    80007c9c:	00d70733          	add	a4,a4,a3
    80007ca0:	00f73c23          	sd	a5,24(a4)
    80007ca4:	02c73023          	sd	a2,32(a4)
    80007ca8:	34071073          	csrw	mscratch,a4
    80007cac:	00000797          	auipc	a5,0x0
    80007cb0:	6e478793          	addi	a5,a5,1764 # 80008390 <timervec>
    80007cb4:	30579073          	csrw	mtvec,a5
    80007cb8:	300027f3          	csrr	a5,mstatus
    80007cbc:	0087e793          	ori	a5,a5,8
    80007cc0:	30079073          	csrw	mstatus,a5
    80007cc4:	304027f3          	csrr	a5,mie
    80007cc8:	0807e793          	ori	a5,a5,128
    80007ccc:	30479073          	csrw	mie,a5
    80007cd0:	f14027f3          	csrr	a5,mhartid
    80007cd4:	0007879b          	sext.w	a5,a5
    80007cd8:	00078213          	mv	tp,a5
    80007cdc:	30200073          	mret
    80007ce0:	00813403          	ld	s0,8(sp)
    80007ce4:	01010113          	addi	sp,sp,16
    80007ce8:	00008067          	ret

0000000080007cec <timerinit>:
    80007cec:	ff010113          	addi	sp,sp,-16
    80007cf0:	00813423          	sd	s0,8(sp)
    80007cf4:	01010413          	addi	s0,sp,16
    80007cf8:	f14027f3          	csrr	a5,mhartid
    80007cfc:	0200c737          	lui	a4,0x200c
    80007d00:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007d04:	0007869b          	sext.w	a3,a5
    80007d08:	00269713          	slli	a4,a3,0x2
    80007d0c:	000f4637          	lui	a2,0xf4
    80007d10:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007d14:	00d70733          	add	a4,a4,a3
    80007d18:	0037979b          	slliw	a5,a5,0x3
    80007d1c:	020046b7          	lui	a3,0x2004
    80007d20:	00d787b3          	add	a5,a5,a3
    80007d24:	00c585b3          	add	a1,a1,a2
    80007d28:	00371693          	slli	a3,a4,0x3
    80007d2c:	00005717          	auipc	a4,0x5
    80007d30:	58470713          	addi	a4,a4,1412 # 8000d2b0 <timer_scratch>
    80007d34:	00b7b023          	sd	a1,0(a5)
    80007d38:	00d70733          	add	a4,a4,a3
    80007d3c:	00f73c23          	sd	a5,24(a4)
    80007d40:	02c73023          	sd	a2,32(a4)
    80007d44:	34071073          	csrw	mscratch,a4
    80007d48:	00000797          	auipc	a5,0x0
    80007d4c:	64878793          	addi	a5,a5,1608 # 80008390 <timervec>
    80007d50:	30579073          	csrw	mtvec,a5
    80007d54:	300027f3          	csrr	a5,mstatus
    80007d58:	0087e793          	ori	a5,a5,8
    80007d5c:	30079073          	csrw	mstatus,a5
    80007d60:	304027f3          	csrr	a5,mie
    80007d64:	0807e793          	ori	a5,a5,128
    80007d68:	30479073          	csrw	mie,a5
    80007d6c:	00813403          	ld	s0,8(sp)
    80007d70:	01010113          	addi	sp,sp,16
    80007d74:	00008067          	ret

0000000080007d78 <system_main>:
    80007d78:	fe010113          	addi	sp,sp,-32
    80007d7c:	00813823          	sd	s0,16(sp)
    80007d80:	00913423          	sd	s1,8(sp)
    80007d84:	00113c23          	sd	ra,24(sp)
    80007d88:	02010413          	addi	s0,sp,32
    80007d8c:	00000097          	auipc	ra,0x0
    80007d90:	0c4080e7          	jalr	196(ra) # 80007e50 <cpuid>
    80007d94:	00005497          	auipc	s1,0x5
    80007d98:	35c48493          	addi	s1,s1,860 # 8000d0f0 <started>
    80007d9c:	02050263          	beqz	a0,80007dc0 <system_main+0x48>
    80007da0:	0004a783          	lw	a5,0(s1)
    80007da4:	0007879b          	sext.w	a5,a5
    80007da8:	fe078ce3          	beqz	a5,80007da0 <system_main+0x28>
    80007dac:	0ff0000f          	fence
    80007db0:	00003517          	auipc	a0,0x3
    80007db4:	9f050513          	addi	a0,a0,-1552 # 8000a7a0 <CONSOLE_STATUS+0x790>
    80007db8:	00001097          	auipc	ra,0x1
    80007dbc:	a74080e7          	jalr	-1420(ra) # 8000882c <panic>
    80007dc0:	00001097          	auipc	ra,0x1
    80007dc4:	9c8080e7          	jalr	-1592(ra) # 80008788 <consoleinit>
    80007dc8:	00001097          	auipc	ra,0x1
    80007dcc:	154080e7          	jalr	340(ra) # 80008f1c <printfinit>
    80007dd0:	00002517          	auipc	a0,0x2
    80007dd4:	7a050513          	addi	a0,a0,1952 # 8000a570 <CONSOLE_STATUS+0x560>
    80007dd8:	00001097          	auipc	ra,0x1
    80007ddc:	ab0080e7          	jalr	-1360(ra) # 80008888 <__printf>
    80007de0:	00003517          	auipc	a0,0x3
    80007de4:	99050513          	addi	a0,a0,-1648 # 8000a770 <CONSOLE_STATUS+0x760>
    80007de8:	00001097          	auipc	ra,0x1
    80007dec:	aa0080e7          	jalr	-1376(ra) # 80008888 <__printf>
    80007df0:	00002517          	auipc	a0,0x2
    80007df4:	78050513          	addi	a0,a0,1920 # 8000a570 <CONSOLE_STATUS+0x560>
    80007df8:	00001097          	auipc	ra,0x1
    80007dfc:	a90080e7          	jalr	-1392(ra) # 80008888 <__printf>
    80007e00:	00001097          	auipc	ra,0x1
    80007e04:	4a8080e7          	jalr	1192(ra) # 800092a8 <kinit>
    80007e08:	00000097          	auipc	ra,0x0
    80007e0c:	148080e7          	jalr	328(ra) # 80007f50 <trapinit>
    80007e10:	00000097          	auipc	ra,0x0
    80007e14:	16c080e7          	jalr	364(ra) # 80007f7c <trapinithart>
    80007e18:	00000097          	auipc	ra,0x0
    80007e1c:	5b8080e7          	jalr	1464(ra) # 800083d0 <plicinit>
    80007e20:	00000097          	auipc	ra,0x0
    80007e24:	5d8080e7          	jalr	1496(ra) # 800083f8 <plicinithart>
    80007e28:	00000097          	auipc	ra,0x0
    80007e2c:	078080e7          	jalr	120(ra) # 80007ea0 <userinit>
    80007e30:	0ff0000f          	fence
    80007e34:	00100793          	li	a5,1
    80007e38:	00003517          	auipc	a0,0x3
    80007e3c:	95050513          	addi	a0,a0,-1712 # 8000a788 <CONSOLE_STATUS+0x778>
    80007e40:	00f4a023          	sw	a5,0(s1)
    80007e44:	00001097          	auipc	ra,0x1
    80007e48:	a44080e7          	jalr	-1468(ra) # 80008888 <__printf>
    80007e4c:	0000006f          	j	80007e4c <system_main+0xd4>

0000000080007e50 <cpuid>:
    80007e50:	ff010113          	addi	sp,sp,-16
    80007e54:	00813423          	sd	s0,8(sp)
    80007e58:	01010413          	addi	s0,sp,16
    80007e5c:	00020513          	mv	a0,tp
    80007e60:	00813403          	ld	s0,8(sp)
    80007e64:	0005051b          	sext.w	a0,a0
    80007e68:	01010113          	addi	sp,sp,16
    80007e6c:	00008067          	ret

0000000080007e70 <mycpu>:
    80007e70:	ff010113          	addi	sp,sp,-16
    80007e74:	00813423          	sd	s0,8(sp)
    80007e78:	01010413          	addi	s0,sp,16
    80007e7c:	00020793          	mv	a5,tp
    80007e80:	00813403          	ld	s0,8(sp)
    80007e84:	0007879b          	sext.w	a5,a5
    80007e88:	00779793          	slli	a5,a5,0x7
    80007e8c:	00006517          	auipc	a0,0x6
    80007e90:	45450513          	addi	a0,a0,1108 # 8000e2e0 <cpus>
    80007e94:	00f50533          	add	a0,a0,a5
    80007e98:	01010113          	addi	sp,sp,16
    80007e9c:	00008067          	ret

0000000080007ea0 <userinit>:
    80007ea0:	ff010113          	addi	sp,sp,-16
    80007ea4:	00813423          	sd	s0,8(sp)
    80007ea8:	01010413          	addi	s0,sp,16
    80007eac:	00813403          	ld	s0,8(sp)
    80007eb0:	01010113          	addi	sp,sp,16
    80007eb4:	ffffa317          	auipc	t1,0xffffa
    80007eb8:	fdc30067          	jr	-36(t1) # 80001e90 <main>

0000000080007ebc <either_copyout>:
    80007ebc:	ff010113          	addi	sp,sp,-16
    80007ec0:	00813023          	sd	s0,0(sp)
    80007ec4:	00113423          	sd	ra,8(sp)
    80007ec8:	01010413          	addi	s0,sp,16
    80007ecc:	02051663          	bnez	a0,80007ef8 <either_copyout+0x3c>
    80007ed0:	00058513          	mv	a0,a1
    80007ed4:	00060593          	mv	a1,a2
    80007ed8:	0006861b          	sext.w	a2,a3
    80007edc:	00002097          	auipc	ra,0x2
    80007ee0:	c58080e7          	jalr	-936(ra) # 80009b34 <__memmove>
    80007ee4:	00813083          	ld	ra,8(sp)
    80007ee8:	00013403          	ld	s0,0(sp)
    80007eec:	00000513          	li	a0,0
    80007ef0:	01010113          	addi	sp,sp,16
    80007ef4:	00008067          	ret
    80007ef8:	00003517          	auipc	a0,0x3
    80007efc:	8d050513          	addi	a0,a0,-1840 # 8000a7c8 <CONSOLE_STATUS+0x7b8>
    80007f00:	00001097          	auipc	ra,0x1
    80007f04:	92c080e7          	jalr	-1748(ra) # 8000882c <panic>

0000000080007f08 <either_copyin>:
    80007f08:	ff010113          	addi	sp,sp,-16
    80007f0c:	00813023          	sd	s0,0(sp)
    80007f10:	00113423          	sd	ra,8(sp)
    80007f14:	01010413          	addi	s0,sp,16
    80007f18:	02059463          	bnez	a1,80007f40 <either_copyin+0x38>
    80007f1c:	00060593          	mv	a1,a2
    80007f20:	0006861b          	sext.w	a2,a3
    80007f24:	00002097          	auipc	ra,0x2
    80007f28:	c10080e7          	jalr	-1008(ra) # 80009b34 <__memmove>
    80007f2c:	00813083          	ld	ra,8(sp)
    80007f30:	00013403          	ld	s0,0(sp)
    80007f34:	00000513          	li	a0,0
    80007f38:	01010113          	addi	sp,sp,16
    80007f3c:	00008067          	ret
    80007f40:	00003517          	auipc	a0,0x3
    80007f44:	8b050513          	addi	a0,a0,-1872 # 8000a7f0 <CONSOLE_STATUS+0x7e0>
    80007f48:	00001097          	auipc	ra,0x1
    80007f4c:	8e4080e7          	jalr	-1820(ra) # 8000882c <panic>

0000000080007f50 <trapinit>:
    80007f50:	ff010113          	addi	sp,sp,-16
    80007f54:	00813423          	sd	s0,8(sp)
    80007f58:	01010413          	addi	s0,sp,16
    80007f5c:	00813403          	ld	s0,8(sp)
    80007f60:	00003597          	auipc	a1,0x3
    80007f64:	8b858593          	addi	a1,a1,-1864 # 8000a818 <CONSOLE_STATUS+0x808>
    80007f68:	00006517          	auipc	a0,0x6
    80007f6c:	3f850513          	addi	a0,a0,1016 # 8000e360 <tickslock>
    80007f70:	01010113          	addi	sp,sp,16
    80007f74:	00001317          	auipc	t1,0x1
    80007f78:	5c430067          	jr	1476(t1) # 80009538 <initlock>

0000000080007f7c <trapinithart>:
    80007f7c:	ff010113          	addi	sp,sp,-16
    80007f80:	00813423          	sd	s0,8(sp)
    80007f84:	01010413          	addi	s0,sp,16
    80007f88:	00000797          	auipc	a5,0x0
    80007f8c:	2f878793          	addi	a5,a5,760 # 80008280 <kernelvec>
    80007f90:	10579073          	csrw	stvec,a5
    80007f94:	00813403          	ld	s0,8(sp)
    80007f98:	01010113          	addi	sp,sp,16
    80007f9c:	00008067          	ret

0000000080007fa0 <usertrap>:
    80007fa0:	ff010113          	addi	sp,sp,-16
    80007fa4:	00813423          	sd	s0,8(sp)
    80007fa8:	01010413          	addi	s0,sp,16
    80007fac:	00813403          	ld	s0,8(sp)
    80007fb0:	01010113          	addi	sp,sp,16
    80007fb4:	00008067          	ret

0000000080007fb8 <usertrapret>:
    80007fb8:	ff010113          	addi	sp,sp,-16
    80007fbc:	00813423          	sd	s0,8(sp)
    80007fc0:	01010413          	addi	s0,sp,16
    80007fc4:	00813403          	ld	s0,8(sp)
    80007fc8:	01010113          	addi	sp,sp,16
    80007fcc:	00008067          	ret

0000000080007fd0 <kerneltrap>:
    80007fd0:	fe010113          	addi	sp,sp,-32
    80007fd4:	00813823          	sd	s0,16(sp)
    80007fd8:	00113c23          	sd	ra,24(sp)
    80007fdc:	00913423          	sd	s1,8(sp)
    80007fe0:	02010413          	addi	s0,sp,32
    80007fe4:	142025f3          	csrr	a1,scause
    80007fe8:	100027f3          	csrr	a5,sstatus
    80007fec:	0027f793          	andi	a5,a5,2
    80007ff0:	10079c63          	bnez	a5,80008108 <kerneltrap+0x138>
    80007ff4:	142027f3          	csrr	a5,scause
    80007ff8:	0207ce63          	bltz	a5,80008034 <kerneltrap+0x64>
    80007ffc:	00003517          	auipc	a0,0x3
    80008000:	86450513          	addi	a0,a0,-1948 # 8000a860 <CONSOLE_STATUS+0x850>
    80008004:	00001097          	auipc	ra,0x1
    80008008:	884080e7          	jalr	-1916(ra) # 80008888 <__printf>
    8000800c:	141025f3          	csrr	a1,sepc
    80008010:	14302673          	csrr	a2,stval
    80008014:	00003517          	auipc	a0,0x3
    80008018:	85c50513          	addi	a0,a0,-1956 # 8000a870 <CONSOLE_STATUS+0x860>
    8000801c:	00001097          	auipc	ra,0x1
    80008020:	86c080e7          	jalr	-1940(ra) # 80008888 <__printf>
    80008024:	00003517          	auipc	a0,0x3
    80008028:	86450513          	addi	a0,a0,-1948 # 8000a888 <CONSOLE_STATUS+0x878>
    8000802c:	00001097          	auipc	ra,0x1
    80008030:	800080e7          	jalr	-2048(ra) # 8000882c <panic>
    80008034:	0ff7f713          	andi	a4,a5,255
    80008038:	00900693          	li	a3,9
    8000803c:	04d70063          	beq	a4,a3,8000807c <kerneltrap+0xac>
    80008040:	fff00713          	li	a4,-1
    80008044:	03f71713          	slli	a4,a4,0x3f
    80008048:	00170713          	addi	a4,a4,1
    8000804c:	fae798e3          	bne	a5,a4,80007ffc <kerneltrap+0x2c>
    80008050:	00000097          	auipc	ra,0x0
    80008054:	e00080e7          	jalr	-512(ra) # 80007e50 <cpuid>
    80008058:	06050663          	beqz	a0,800080c4 <kerneltrap+0xf4>
    8000805c:	144027f3          	csrr	a5,sip
    80008060:	ffd7f793          	andi	a5,a5,-3
    80008064:	14479073          	csrw	sip,a5
    80008068:	01813083          	ld	ra,24(sp)
    8000806c:	01013403          	ld	s0,16(sp)
    80008070:	00813483          	ld	s1,8(sp)
    80008074:	02010113          	addi	sp,sp,32
    80008078:	00008067          	ret
    8000807c:	00000097          	auipc	ra,0x0
    80008080:	3c8080e7          	jalr	968(ra) # 80008444 <plic_claim>
    80008084:	00a00793          	li	a5,10
    80008088:	00050493          	mv	s1,a0
    8000808c:	06f50863          	beq	a0,a5,800080fc <kerneltrap+0x12c>
    80008090:	fc050ce3          	beqz	a0,80008068 <kerneltrap+0x98>
    80008094:	00050593          	mv	a1,a0
    80008098:	00002517          	auipc	a0,0x2
    8000809c:	7a850513          	addi	a0,a0,1960 # 8000a840 <CONSOLE_STATUS+0x830>
    800080a0:	00000097          	auipc	ra,0x0
    800080a4:	7e8080e7          	jalr	2024(ra) # 80008888 <__printf>
    800080a8:	01013403          	ld	s0,16(sp)
    800080ac:	01813083          	ld	ra,24(sp)
    800080b0:	00048513          	mv	a0,s1
    800080b4:	00813483          	ld	s1,8(sp)
    800080b8:	02010113          	addi	sp,sp,32
    800080bc:	00000317          	auipc	t1,0x0
    800080c0:	3c030067          	jr	960(t1) # 8000847c <plic_complete>
    800080c4:	00006517          	auipc	a0,0x6
    800080c8:	29c50513          	addi	a0,a0,668 # 8000e360 <tickslock>
    800080cc:	00001097          	auipc	ra,0x1
    800080d0:	490080e7          	jalr	1168(ra) # 8000955c <acquire>
    800080d4:	00005717          	auipc	a4,0x5
    800080d8:	02070713          	addi	a4,a4,32 # 8000d0f4 <ticks>
    800080dc:	00072783          	lw	a5,0(a4)
    800080e0:	00006517          	auipc	a0,0x6
    800080e4:	28050513          	addi	a0,a0,640 # 8000e360 <tickslock>
    800080e8:	0017879b          	addiw	a5,a5,1
    800080ec:	00f72023          	sw	a5,0(a4)
    800080f0:	00001097          	auipc	ra,0x1
    800080f4:	538080e7          	jalr	1336(ra) # 80009628 <release>
    800080f8:	f65ff06f          	j	8000805c <kerneltrap+0x8c>
    800080fc:	00001097          	auipc	ra,0x1
    80008100:	094080e7          	jalr	148(ra) # 80009190 <uartintr>
    80008104:	fa5ff06f          	j	800080a8 <kerneltrap+0xd8>
    80008108:	00002517          	auipc	a0,0x2
    8000810c:	71850513          	addi	a0,a0,1816 # 8000a820 <CONSOLE_STATUS+0x810>
    80008110:	00000097          	auipc	ra,0x0
    80008114:	71c080e7          	jalr	1820(ra) # 8000882c <panic>

0000000080008118 <clockintr>:
    80008118:	fe010113          	addi	sp,sp,-32
    8000811c:	00813823          	sd	s0,16(sp)
    80008120:	00913423          	sd	s1,8(sp)
    80008124:	00113c23          	sd	ra,24(sp)
    80008128:	02010413          	addi	s0,sp,32
    8000812c:	00006497          	auipc	s1,0x6
    80008130:	23448493          	addi	s1,s1,564 # 8000e360 <tickslock>
    80008134:	00048513          	mv	a0,s1
    80008138:	00001097          	auipc	ra,0x1
    8000813c:	424080e7          	jalr	1060(ra) # 8000955c <acquire>
    80008140:	00005717          	auipc	a4,0x5
    80008144:	fb470713          	addi	a4,a4,-76 # 8000d0f4 <ticks>
    80008148:	00072783          	lw	a5,0(a4)
    8000814c:	01013403          	ld	s0,16(sp)
    80008150:	01813083          	ld	ra,24(sp)
    80008154:	00048513          	mv	a0,s1
    80008158:	0017879b          	addiw	a5,a5,1
    8000815c:	00813483          	ld	s1,8(sp)
    80008160:	00f72023          	sw	a5,0(a4)
    80008164:	02010113          	addi	sp,sp,32
    80008168:	00001317          	auipc	t1,0x1
    8000816c:	4c030067          	jr	1216(t1) # 80009628 <release>

0000000080008170 <devintr>:
    80008170:	142027f3          	csrr	a5,scause
    80008174:	00000513          	li	a0,0
    80008178:	0007c463          	bltz	a5,80008180 <devintr+0x10>
    8000817c:	00008067          	ret
    80008180:	fe010113          	addi	sp,sp,-32
    80008184:	00813823          	sd	s0,16(sp)
    80008188:	00113c23          	sd	ra,24(sp)
    8000818c:	00913423          	sd	s1,8(sp)
    80008190:	02010413          	addi	s0,sp,32
    80008194:	0ff7f713          	andi	a4,a5,255
    80008198:	00900693          	li	a3,9
    8000819c:	04d70c63          	beq	a4,a3,800081f4 <devintr+0x84>
    800081a0:	fff00713          	li	a4,-1
    800081a4:	03f71713          	slli	a4,a4,0x3f
    800081a8:	00170713          	addi	a4,a4,1
    800081ac:	00e78c63          	beq	a5,a4,800081c4 <devintr+0x54>
    800081b0:	01813083          	ld	ra,24(sp)
    800081b4:	01013403          	ld	s0,16(sp)
    800081b8:	00813483          	ld	s1,8(sp)
    800081bc:	02010113          	addi	sp,sp,32
    800081c0:	00008067          	ret
    800081c4:	00000097          	auipc	ra,0x0
    800081c8:	c8c080e7          	jalr	-884(ra) # 80007e50 <cpuid>
    800081cc:	06050663          	beqz	a0,80008238 <devintr+0xc8>
    800081d0:	144027f3          	csrr	a5,sip
    800081d4:	ffd7f793          	andi	a5,a5,-3
    800081d8:	14479073          	csrw	sip,a5
    800081dc:	01813083          	ld	ra,24(sp)
    800081e0:	01013403          	ld	s0,16(sp)
    800081e4:	00813483          	ld	s1,8(sp)
    800081e8:	00200513          	li	a0,2
    800081ec:	02010113          	addi	sp,sp,32
    800081f0:	00008067          	ret
    800081f4:	00000097          	auipc	ra,0x0
    800081f8:	250080e7          	jalr	592(ra) # 80008444 <plic_claim>
    800081fc:	00a00793          	li	a5,10
    80008200:	00050493          	mv	s1,a0
    80008204:	06f50663          	beq	a0,a5,80008270 <devintr+0x100>
    80008208:	00100513          	li	a0,1
    8000820c:	fa0482e3          	beqz	s1,800081b0 <devintr+0x40>
    80008210:	00048593          	mv	a1,s1
    80008214:	00002517          	auipc	a0,0x2
    80008218:	62c50513          	addi	a0,a0,1580 # 8000a840 <CONSOLE_STATUS+0x830>
    8000821c:	00000097          	auipc	ra,0x0
    80008220:	66c080e7          	jalr	1644(ra) # 80008888 <__printf>
    80008224:	00048513          	mv	a0,s1
    80008228:	00000097          	auipc	ra,0x0
    8000822c:	254080e7          	jalr	596(ra) # 8000847c <plic_complete>
    80008230:	00100513          	li	a0,1
    80008234:	f7dff06f          	j	800081b0 <devintr+0x40>
    80008238:	00006517          	auipc	a0,0x6
    8000823c:	12850513          	addi	a0,a0,296 # 8000e360 <tickslock>
    80008240:	00001097          	auipc	ra,0x1
    80008244:	31c080e7          	jalr	796(ra) # 8000955c <acquire>
    80008248:	00005717          	auipc	a4,0x5
    8000824c:	eac70713          	addi	a4,a4,-340 # 8000d0f4 <ticks>
    80008250:	00072783          	lw	a5,0(a4)
    80008254:	00006517          	auipc	a0,0x6
    80008258:	10c50513          	addi	a0,a0,268 # 8000e360 <tickslock>
    8000825c:	0017879b          	addiw	a5,a5,1
    80008260:	00f72023          	sw	a5,0(a4)
    80008264:	00001097          	auipc	ra,0x1
    80008268:	3c4080e7          	jalr	964(ra) # 80009628 <release>
    8000826c:	f65ff06f          	j	800081d0 <devintr+0x60>
    80008270:	00001097          	auipc	ra,0x1
    80008274:	f20080e7          	jalr	-224(ra) # 80009190 <uartintr>
    80008278:	fadff06f          	j	80008224 <devintr+0xb4>
    8000827c:	0000                	unimp
	...

0000000080008280 <kernelvec>:
    80008280:	f0010113          	addi	sp,sp,-256
    80008284:	00113023          	sd	ra,0(sp)
    80008288:	00213423          	sd	sp,8(sp)
    8000828c:	00313823          	sd	gp,16(sp)
    80008290:	00413c23          	sd	tp,24(sp)
    80008294:	02513023          	sd	t0,32(sp)
    80008298:	02613423          	sd	t1,40(sp)
    8000829c:	02713823          	sd	t2,48(sp)
    800082a0:	02813c23          	sd	s0,56(sp)
    800082a4:	04913023          	sd	s1,64(sp)
    800082a8:	04a13423          	sd	a0,72(sp)
    800082ac:	04b13823          	sd	a1,80(sp)
    800082b0:	04c13c23          	sd	a2,88(sp)
    800082b4:	06d13023          	sd	a3,96(sp)
    800082b8:	06e13423          	sd	a4,104(sp)
    800082bc:	06f13823          	sd	a5,112(sp)
    800082c0:	07013c23          	sd	a6,120(sp)
    800082c4:	09113023          	sd	a7,128(sp)
    800082c8:	09213423          	sd	s2,136(sp)
    800082cc:	09313823          	sd	s3,144(sp)
    800082d0:	09413c23          	sd	s4,152(sp)
    800082d4:	0b513023          	sd	s5,160(sp)
    800082d8:	0b613423          	sd	s6,168(sp)
    800082dc:	0b713823          	sd	s7,176(sp)
    800082e0:	0b813c23          	sd	s8,184(sp)
    800082e4:	0d913023          	sd	s9,192(sp)
    800082e8:	0da13423          	sd	s10,200(sp)
    800082ec:	0db13823          	sd	s11,208(sp)
    800082f0:	0dc13c23          	sd	t3,216(sp)
    800082f4:	0fd13023          	sd	t4,224(sp)
    800082f8:	0fe13423          	sd	t5,232(sp)
    800082fc:	0ff13823          	sd	t6,240(sp)
    80008300:	cd1ff0ef          	jal	ra,80007fd0 <kerneltrap>
    80008304:	00013083          	ld	ra,0(sp)
    80008308:	00813103          	ld	sp,8(sp)
    8000830c:	01013183          	ld	gp,16(sp)
    80008310:	02013283          	ld	t0,32(sp)
    80008314:	02813303          	ld	t1,40(sp)
    80008318:	03013383          	ld	t2,48(sp)
    8000831c:	03813403          	ld	s0,56(sp)
    80008320:	04013483          	ld	s1,64(sp)
    80008324:	04813503          	ld	a0,72(sp)
    80008328:	05013583          	ld	a1,80(sp)
    8000832c:	05813603          	ld	a2,88(sp)
    80008330:	06013683          	ld	a3,96(sp)
    80008334:	06813703          	ld	a4,104(sp)
    80008338:	07013783          	ld	a5,112(sp)
    8000833c:	07813803          	ld	a6,120(sp)
    80008340:	08013883          	ld	a7,128(sp)
    80008344:	08813903          	ld	s2,136(sp)
    80008348:	09013983          	ld	s3,144(sp)
    8000834c:	09813a03          	ld	s4,152(sp)
    80008350:	0a013a83          	ld	s5,160(sp)
    80008354:	0a813b03          	ld	s6,168(sp)
    80008358:	0b013b83          	ld	s7,176(sp)
    8000835c:	0b813c03          	ld	s8,184(sp)
    80008360:	0c013c83          	ld	s9,192(sp)
    80008364:	0c813d03          	ld	s10,200(sp)
    80008368:	0d013d83          	ld	s11,208(sp)
    8000836c:	0d813e03          	ld	t3,216(sp)
    80008370:	0e013e83          	ld	t4,224(sp)
    80008374:	0e813f03          	ld	t5,232(sp)
    80008378:	0f013f83          	ld	t6,240(sp)
    8000837c:	10010113          	addi	sp,sp,256
    80008380:	10200073          	sret
    80008384:	00000013          	nop
    80008388:	00000013          	nop
    8000838c:	00000013          	nop

0000000080008390 <timervec>:
    80008390:	34051573          	csrrw	a0,mscratch,a0
    80008394:	00b53023          	sd	a1,0(a0)
    80008398:	00c53423          	sd	a2,8(a0)
    8000839c:	00d53823          	sd	a3,16(a0)
    800083a0:	01853583          	ld	a1,24(a0)
    800083a4:	02053603          	ld	a2,32(a0)
    800083a8:	0005b683          	ld	a3,0(a1)
    800083ac:	00c686b3          	add	a3,a3,a2
    800083b0:	00d5b023          	sd	a3,0(a1)
    800083b4:	00200593          	li	a1,2
    800083b8:	14459073          	csrw	sip,a1
    800083bc:	01053683          	ld	a3,16(a0)
    800083c0:	00853603          	ld	a2,8(a0)
    800083c4:	00053583          	ld	a1,0(a0)
    800083c8:	34051573          	csrrw	a0,mscratch,a0
    800083cc:	30200073          	mret

00000000800083d0 <plicinit>:
    800083d0:	ff010113          	addi	sp,sp,-16
    800083d4:	00813423          	sd	s0,8(sp)
    800083d8:	01010413          	addi	s0,sp,16
    800083dc:	00813403          	ld	s0,8(sp)
    800083e0:	0c0007b7          	lui	a5,0xc000
    800083e4:	00100713          	li	a4,1
    800083e8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800083ec:	00e7a223          	sw	a4,4(a5)
    800083f0:	01010113          	addi	sp,sp,16
    800083f4:	00008067          	ret

00000000800083f8 <plicinithart>:
    800083f8:	ff010113          	addi	sp,sp,-16
    800083fc:	00813023          	sd	s0,0(sp)
    80008400:	00113423          	sd	ra,8(sp)
    80008404:	01010413          	addi	s0,sp,16
    80008408:	00000097          	auipc	ra,0x0
    8000840c:	a48080e7          	jalr	-1464(ra) # 80007e50 <cpuid>
    80008410:	0085171b          	slliw	a4,a0,0x8
    80008414:	0c0027b7          	lui	a5,0xc002
    80008418:	00e787b3          	add	a5,a5,a4
    8000841c:	40200713          	li	a4,1026
    80008420:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80008424:	00813083          	ld	ra,8(sp)
    80008428:	00013403          	ld	s0,0(sp)
    8000842c:	00d5151b          	slliw	a0,a0,0xd
    80008430:	0c2017b7          	lui	a5,0xc201
    80008434:	00a78533          	add	a0,a5,a0
    80008438:	00052023          	sw	zero,0(a0)
    8000843c:	01010113          	addi	sp,sp,16
    80008440:	00008067          	ret

0000000080008444 <plic_claim>:
    80008444:	ff010113          	addi	sp,sp,-16
    80008448:	00813023          	sd	s0,0(sp)
    8000844c:	00113423          	sd	ra,8(sp)
    80008450:	01010413          	addi	s0,sp,16
    80008454:	00000097          	auipc	ra,0x0
    80008458:	9fc080e7          	jalr	-1540(ra) # 80007e50 <cpuid>
    8000845c:	00813083          	ld	ra,8(sp)
    80008460:	00013403          	ld	s0,0(sp)
    80008464:	00d5151b          	slliw	a0,a0,0xd
    80008468:	0c2017b7          	lui	a5,0xc201
    8000846c:	00a78533          	add	a0,a5,a0
    80008470:	00452503          	lw	a0,4(a0)
    80008474:	01010113          	addi	sp,sp,16
    80008478:	00008067          	ret

000000008000847c <plic_complete>:
    8000847c:	fe010113          	addi	sp,sp,-32
    80008480:	00813823          	sd	s0,16(sp)
    80008484:	00913423          	sd	s1,8(sp)
    80008488:	00113c23          	sd	ra,24(sp)
    8000848c:	02010413          	addi	s0,sp,32
    80008490:	00050493          	mv	s1,a0
    80008494:	00000097          	auipc	ra,0x0
    80008498:	9bc080e7          	jalr	-1604(ra) # 80007e50 <cpuid>
    8000849c:	01813083          	ld	ra,24(sp)
    800084a0:	01013403          	ld	s0,16(sp)
    800084a4:	00d5179b          	slliw	a5,a0,0xd
    800084a8:	0c201737          	lui	a4,0xc201
    800084ac:	00f707b3          	add	a5,a4,a5
    800084b0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800084b4:	00813483          	ld	s1,8(sp)
    800084b8:	02010113          	addi	sp,sp,32
    800084bc:	00008067          	ret

00000000800084c0 <consolewrite>:
    800084c0:	fb010113          	addi	sp,sp,-80
    800084c4:	04813023          	sd	s0,64(sp)
    800084c8:	04113423          	sd	ra,72(sp)
    800084cc:	02913c23          	sd	s1,56(sp)
    800084d0:	03213823          	sd	s2,48(sp)
    800084d4:	03313423          	sd	s3,40(sp)
    800084d8:	03413023          	sd	s4,32(sp)
    800084dc:	01513c23          	sd	s5,24(sp)
    800084e0:	05010413          	addi	s0,sp,80
    800084e4:	06c05c63          	blez	a2,8000855c <consolewrite+0x9c>
    800084e8:	00060993          	mv	s3,a2
    800084ec:	00050a13          	mv	s4,a0
    800084f0:	00058493          	mv	s1,a1
    800084f4:	00000913          	li	s2,0
    800084f8:	fff00a93          	li	s5,-1
    800084fc:	01c0006f          	j	80008518 <consolewrite+0x58>
    80008500:	fbf44503          	lbu	a0,-65(s0)
    80008504:	0019091b          	addiw	s2,s2,1
    80008508:	00148493          	addi	s1,s1,1
    8000850c:	00001097          	auipc	ra,0x1
    80008510:	a9c080e7          	jalr	-1380(ra) # 80008fa8 <uartputc>
    80008514:	03298063          	beq	s3,s2,80008534 <consolewrite+0x74>
    80008518:	00048613          	mv	a2,s1
    8000851c:	00100693          	li	a3,1
    80008520:	000a0593          	mv	a1,s4
    80008524:	fbf40513          	addi	a0,s0,-65
    80008528:	00000097          	auipc	ra,0x0
    8000852c:	9e0080e7          	jalr	-1568(ra) # 80007f08 <either_copyin>
    80008530:	fd5518e3          	bne	a0,s5,80008500 <consolewrite+0x40>
    80008534:	04813083          	ld	ra,72(sp)
    80008538:	04013403          	ld	s0,64(sp)
    8000853c:	03813483          	ld	s1,56(sp)
    80008540:	02813983          	ld	s3,40(sp)
    80008544:	02013a03          	ld	s4,32(sp)
    80008548:	01813a83          	ld	s5,24(sp)
    8000854c:	00090513          	mv	a0,s2
    80008550:	03013903          	ld	s2,48(sp)
    80008554:	05010113          	addi	sp,sp,80
    80008558:	00008067          	ret
    8000855c:	00000913          	li	s2,0
    80008560:	fd5ff06f          	j	80008534 <consolewrite+0x74>

0000000080008564 <consoleread>:
    80008564:	f9010113          	addi	sp,sp,-112
    80008568:	06813023          	sd	s0,96(sp)
    8000856c:	04913c23          	sd	s1,88(sp)
    80008570:	05213823          	sd	s2,80(sp)
    80008574:	05313423          	sd	s3,72(sp)
    80008578:	05413023          	sd	s4,64(sp)
    8000857c:	03513c23          	sd	s5,56(sp)
    80008580:	03613823          	sd	s6,48(sp)
    80008584:	03713423          	sd	s7,40(sp)
    80008588:	03813023          	sd	s8,32(sp)
    8000858c:	06113423          	sd	ra,104(sp)
    80008590:	01913c23          	sd	s9,24(sp)
    80008594:	07010413          	addi	s0,sp,112
    80008598:	00060b93          	mv	s7,a2
    8000859c:	00050913          	mv	s2,a0
    800085a0:	00058c13          	mv	s8,a1
    800085a4:	00060b1b          	sext.w	s6,a2
    800085a8:	00006497          	auipc	s1,0x6
    800085ac:	de048493          	addi	s1,s1,-544 # 8000e388 <cons>
    800085b0:	00400993          	li	s3,4
    800085b4:	fff00a13          	li	s4,-1
    800085b8:	00a00a93          	li	s5,10
    800085bc:	05705e63          	blez	s7,80008618 <consoleread+0xb4>
    800085c0:	09c4a703          	lw	a4,156(s1)
    800085c4:	0984a783          	lw	a5,152(s1)
    800085c8:	0007071b          	sext.w	a4,a4
    800085cc:	08e78463          	beq	a5,a4,80008654 <consoleread+0xf0>
    800085d0:	07f7f713          	andi	a4,a5,127
    800085d4:	00e48733          	add	a4,s1,a4
    800085d8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800085dc:	0017869b          	addiw	a3,a5,1
    800085e0:	08d4ac23          	sw	a3,152(s1)
    800085e4:	00070c9b          	sext.w	s9,a4
    800085e8:	0b370663          	beq	a4,s3,80008694 <consoleread+0x130>
    800085ec:	00100693          	li	a3,1
    800085f0:	f9f40613          	addi	a2,s0,-97
    800085f4:	000c0593          	mv	a1,s8
    800085f8:	00090513          	mv	a0,s2
    800085fc:	f8e40fa3          	sb	a4,-97(s0)
    80008600:	00000097          	auipc	ra,0x0
    80008604:	8bc080e7          	jalr	-1860(ra) # 80007ebc <either_copyout>
    80008608:	01450863          	beq	a0,s4,80008618 <consoleread+0xb4>
    8000860c:	001c0c13          	addi	s8,s8,1
    80008610:	fffb8b9b          	addiw	s7,s7,-1
    80008614:	fb5c94e3          	bne	s9,s5,800085bc <consoleread+0x58>
    80008618:	000b851b          	sext.w	a0,s7
    8000861c:	06813083          	ld	ra,104(sp)
    80008620:	06013403          	ld	s0,96(sp)
    80008624:	05813483          	ld	s1,88(sp)
    80008628:	05013903          	ld	s2,80(sp)
    8000862c:	04813983          	ld	s3,72(sp)
    80008630:	04013a03          	ld	s4,64(sp)
    80008634:	03813a83          	ld	s5,56(sp)
    80008638:	02813b83          	ld	s7,40(sp)
    8000863c:	02013c03          	ld	s8,32(sp)
    80008640:	01813c83          	ld	s9,24(sp)
    80008644:	40ab053b          	subw	a0,s6,a0
    80008648:	03013b03          	ld	s6,48(sp)
    8000864c:	07010113          	addi	sp,sp,112
    80008650:	00008067          	ret
    80008654:	00001097          	auipc	ra,0x1
    80008658:	1d8080e7          	jalr	472(ra) # 8000982c <push_on>
    8000865c:	0984a703          	lw	a4,152(s1)
    80008660:	09c4a783          	lw	a5,156(s1)
    80008664:	0007879b          	sext.w	a5,a5
    80008668:	fef70ce3          	beq	a4,a5,80008660 <consoleread+0xfc>
    8000866c:	00001097          	auipc	ra,0x1
    80008670:	234080e7          	jalr	564(ra) # 800098a0 <pop_on>
    80008674:	0984a783          	lw	a5,152(s1)
    80008678:	07f7f713          	andi	a4,a5,127
    8000867c:	00e48733          	add	a4,s1,a4
    80008680:	01874703          	lbu	a4,24(a4)
    80008684:	0017869b          	addiw	a3,a5,1
    80008688:	08d4ac23          	sw	a3,152(s1)
    8000868c:	00070c9b          	sext.w	s9,a4
    80008690:	f5371ee3          	bne	a4,s3,800085ec <consoleread+0x88>
    80008694:	000b851b          	sext.w	a0,s7
    80008698:	f96bf2e3          	bgeu	s7,s6,8000861c <consoleread+0xb8>
    8000869c:	08f4ac23          	sw	a5,152(s1)
    800086a0:	f7dff06f          	j	8000861c <consoleread+0xb8>

00000000800086a4 <consputc>:
    800086a4:	10000793          	li	a5,256
    800086a8:	00f50663          	beq	a0,a5,800086b4 <consputc+0x10>
    800086ac:	00001317          	auipc	t1,0x1
    800086b0:	9f430067          	jr	-1548(t1) # 800090a0 <uartputc_sync>
    800086b4:	ff010113          	addi	sp,sp,-16
    800086b8:	00113423          	sd	ra,8(sp)
    800086bc:	00813023          	sd	s0,0(sp)
    800086c0:	01010413          	addi	s0,sp,16
    800086c4:	00800513          	li	a0,8
    800086c8:	00001097          	auipc	ra,0x1
    800086cc:	9d8080e7          	jalr	-1576(ra) # 800090a0 <uartputc_sync>
    800086d0:	02000513          	li	a0,32
    800086d4:	00001097          	auipc	ra,0x1
    800086d8:	9cc080e7          	jalr	-1588(ra) # 800090a0 <uartputc_sync>
    800086dc:	00013403          	ld	s0,0(sp)
    800086e0:	00813083          	ld	ra,8(sp)
    800086e4:	00800513          	li	a0,8
    800086e8:	01010113          	addi	sp,sp,16
    800086ec:	00001317          	auipc	t1,0x1
    800086f0:	9b430067          	jr	-1612(t1) # 800090a0 <uartputc_sync>

00000000800086f4 <consoleintr>:
    800086f4:	fe010113          	addi	sp,sp,-32
    800086f8:	00813823          	sd	s0,16(sp)
    800086fc:	00913423          	sd	s1,8(sp)
    80008700:	01213023          	sd	s2,0(sp)
    80008704:	00113c23          	sd	ra,24(sp)
    80008708:	02010413          	addi	s0,sp,32
    8000870c:	00006917          	auipc	s2,0x6
    80008710:	c7c90913          	addi	s2,s2,-900 # 8000e388 <cons>
    80008714:	00050493          	mv	s1,a0
    80008718:	00090513          	mv	a0,s2
    8000871c:	00001097          	auipc	ra,0x1
    80008720:	e40080e7          	jalr	-448(ra) # 8000955c <acquire>
    80008724:	02048c63          	beqz	s1,8000875c <consoleintr+0x68>
    80008728:	0a092783          	lw	a5,160(s2)
    8000872c:	09892703          	lw	a4,152(s2)
    80008730:	07f00693          	li	a3,127
    80008734:	40e7873b          	subw	a4,a5,a4
    80008738:	02e6e263          	bltu	a3,a4,8000875c <consoleintr+0x68>
    8000873c:	00d00713          	li	a4,13
    80008740:	04e48063          	beq	s1,a4,80008780 <consoleintr+0x8c>
    80008744:	07f7f713          	andi	a4,a5,127
    80008748:	00e90733          	add	a4,s2,a4
    8000874c:	0017879b          	addiw	a5,a5,1
    80008750:	0af92023          	sw	a5,160(s2)
    80008754:	00970c23          	sb	s1,24(a4)
    80008758:	08f92e23          	sw	a5,156(s2)
    8000875c:	01013403          	ld	s0,16(sp)
    80008760:	01813083          	ld	ra,24(sp)
    80008764:	00813483          	ld	s1,8(sp)
    80008768:	00013903          	ld	s2,0(sp)
    8000876c:	00006517          	auipc	a0,0x6
    80008770:	c1c50513          	addi	a0,a0,-996 # 8000e388 <cons>
    80008774:	02010113          	addi	sp,sp,32
    80008778:	00001317          	auipc	t1,0x1
    8000877c:	eb030067          	jr	-336(t1) # 80009628 <release>
    80008780:	00a00493          	li	s1,10
    80008784:	fc1ff06f          	j	80008744 <consoleintr+0x50>

0000000080008788 <consoleinit>:
    80008788:	fe010113          	addi	sp,sp,-32
    8000878c:	00113c23          	sd	ra,24(sp)
    80008790:	00813823          	sd	s0,16(sp)
    80008794:	00913423          	sd	s1,8(sp)
    80008798:	02010413          	addi	s0,sp,32
    8000879c:	00006497          	auipc	s1,0x6
    800087a0:	bec48493          	addi	s1,s1,-1044 # 8000e388 <cons>
    800087a4:	00048513          	mv	a0,s1
    800087a8:	00002597          	auipc	a1,0x2
    800087ac:	0f058593          	addi	a1,a1,240 # 8000a898 <CONSOLE_STATUS+0x888>
    800087b0:	00001097          	auipc	ra,0x1
    800087b4:	d88080e7          	jalr	-632(ra) # 80009538 <initlock>
    800087b8:	00000097          	auipc	ra,0x0
    800087bc:	7ac080e7          	jalr	1964(ra) # 80008f64 <uartinit>
    800087c0:	01813083          	ld	ra,24(sp)
    800087c4:	01013403          	ld	s0,16(sp)
    800087c8:	00000797          	auipc	a5,0x0
    800087cc:	d9c78793          	addi	a5,a5,-612 # 80008564 <consoleread>
    800087d0:	0af4bc23          	sd	a5,184(s1)
    800087d4:	00000797          	auipc	a5,0x0
    800087d8:	cec78793          	addi	a5,a5,-788 # 800084c0 <consolewrite>
    800087dc:	0cf4b023          	sd	a5,192(s1)
    800087e0:	00813483          	ld	s1,8(sp)
    800087e4:	02010113          	addi	sp,sp,32
    800087e8:	00008067          	ret

00000000800087ec <console_read>:
    800087ec:	ff010113          	addi	sp,sp,-16
    800087f0:	00813423          	sd	s0,8(sp)
    800087f4:	01010413          	addi	s0,sp,16
    800087f8:	00813403          	ld	s0,8(sp)
    800087fc:	00006317          	auipc	t1,0x6
    80008800:	c4433303          	ld	t1,-956(t1) # 8000e440 <devsw+0x10>
    80008804:	01010113          	addi	sp,sp,16
    80008808:	00030067          	jr	t1

000000008000880c <console_write>:
    8000880c:	ff010113          	addi	sp,sp,-16
    80008810:	00813423          	sd	s0,8(sp)
    80008814:	01010413          	addi	s0,sp,16
    80008818:	00813403          	ld	s0,8(sp)
    8000881c:	00006317          	auipc	t1,0x6
    80008820:	c2c33303          	ld	t1,-980(t1) # 8000e448 <devsw+0x18>
    80008824:	01010113          	addi	sp,sp,16
    80008828:	00030067          	jr	t1

000000008000882c <panic>:
    8000882c:	fe010113          	addi	sp,sp,-32
    80008830:	00113c23          	sd	ra,24(sp)
    80008834:	00813823          	sd	s0,16(sp)
    80008838:	00913423          	sd	s1,8(sp)
    8000883c:	02010413          	addi	s0,sp,32
    80008840:	00050493          	mv	s1,a0
    80008844:	00002517          	auipc	a0,0x2
    80008848:	05c50513          	addi	a0,a0,92 # 8000a8a0 <CONSOLE_STATUS+0x890>
    8000884c:	00006797          	auipc	a5,0x6
    80008850:	c807ae23          	sw	zero,-868(a5) # 8000e4e8 <pr+0x18>
    80008854:	00000097          	auipc	ra,0x0
    80008858:	034080e7          	jalr	52(ra) # 80008888 <__printf>
    8000885c:	00048513          	mv	a0,s1
    80008860:	00000097          	auipc	ra,0x0
    80008864:	028080e7          	jalr	40(ra) # 80008888 <__printf>
    80008868:	00002517          	auipc	a0,0x2
    8000886c:	d0850513          	addi	a0,a0,-760 # 8000a570 <CONSOLE_STATUS+0x560>
    80008870:	00000097          	auipc	ra,0x0
    80008874:	018080e7          	jalr	24(ra) # 80008888 <__printf>
    80008878:	00100793          	li	a5,1
    8000887c:	00005717          	auipc	a4,0x5
    80008880:	86f72e23          	sw	a5,-1924(a4) # 8000d0f8 <panicked>
    80008884:	0000006f          	j	80008884 <panic+0x58>

0000000080008888 <__printf>:
    80008888:	f3010113          	addi	sp,sp,-208
    8000888c:	08813023          	sd	s0,128(sp)
    80008890:	07313423          	sd	s3,104(sp)
    80008894:	09010413          	addi	s0,sp,144
    80008898:	05813023          	sd	s8,64(sp)
    8000889c:	08113423          	sd	ra,136(sp)
    800088a0:	06913c23          	sd	s1,120(sp)
    800088a4:	07213823          	sd	s2,112(sp)
    800088a8:	07413023          	sd	s4,96(sp)
    800088ac:	05513c23          	sd	s5,88(sp)
    800088b0:	05613823          	sd	s6,80(sp)
    800088b4:	05713423          	sd	s7,72(sp)
    800088b8:	03913c23          	sd	s9,56(sp)
    800088bc:	03a13823          	sd	s10,48(sp)
    800088c0:	03b13423          	sd	s11,40(sp)
    800088c4:	00006317          	auipc	t1,0x6
    800088c8:	c0c30313          	addi	t1,t1,-1012 # 8000e4d0 <pr>
    800088cc:	01832c03          	lw	s8,24(t1)
    800088d0:	00b43423          	sd	a1,8(s0)
    800088d4:	00c43823          	sd	a2,16(s0)
    800088d8:	00d43c23          	sd	a3,24(s0)
    800088dc:	02e43023          	sd	a4,32(s0)
    800088e0:	02f43423          	sd	a5,40(s0)
    800088e4:	03043823          	sd	a6,48(s0)
    800088e8:	03143c23          	sd	a7,56(s0)
    800088ec:	00050993          	mv	s3,a0
    800088f0:	4a0c1663          	bnez	s8,80008d9c <__printf+0x514>
    800088f4:	60098c63          	beqz	s3,80008f0c <__printf+0x684>
    800088f8:	0009c503          	lbu	a0,0(s3)
    800088fc:	00840793          	addi	a5,s0,8
    80008900:	f6f43c23          	sd	a5,-136(s0)
    80008904:	00000493          	li	s1,0
    80008908:	22050063          	beqz	a0,80008b28 <__printf+0x2a0>
    8000890c:	00002a37          	lui	s4,0x2
    80008910:	00018ab7          	lui	s5,0x18
    80008914:	000f4b37          	lui	s6,0xf4
    80008918:	00989bb7          	lui	s7,0x989
    8000891c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80008920:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80008924:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80008928:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000892c:	00148c9b          	addiw	s9,s1,1
    80008930:	02500793          	li	a5,37
    80008934:	01998933          	add	s2,s3,s9
    80008938:	38f51263          	bne	a0,a5,80008cbc <__printf+0x434>
    8000893c:	00094783          	lbu	a5,0(s2)
    80008940:	00078c9b          	sext.w	s9,a5
    80008944:	1e078263          	beqz	a5,80008b28 <__printf+0x2a0>
    80008948:	0024849b          	addiw	s1,s1,2
    8000894c:	07000713          	li	a4,112
    80008950:	00998933          	add	s2,s3,s1
    80008954:	38e78a63          	beq	a5,a4,80008ce8 <__printf+0x460>
    80008958:	20f76863          	bltu	a4,a5,80008b68 <__printf+0x2e0>
    8000895c:	42a78863          	beq	a5,a0,80008d8c <__printf+0x504>
    80008960:	06400713          	li	a4,100
    80008964:	40e79663          	bne	a5,a4,80008d70 <__printf+0x4e8>
    80008968:	f7843783          	ld	a5,-136(s0)
    8000896c:	0007a603          	lw	a2,0(a5)
    80008970:	00878793          	addi	a5,a5,8
    80008974:	f6f43c23          	sd	a5,-136(s0)
    80008978:	42064a63          	bltz	a2,80008dac <__printf+0x524>
    8000897c:	00a00713          	li	a4,10
    80008980:	02e677bb          	remuw	a5,a2,a4
    80008984:	00002d97          	auipc	s11,0x2
    80008988:	f44d8d93          	addi	s11,s11,-188 # 8000a8c8 <digits>
    8000898c:	00900593          	li	a1,9
    80008990:	0006051b          	sext.w	a0,a2
    80008994:	00000c93          	li	s9,0
    80008998:	02079793          	slli	a5,a5,0x20
    8000899c:	0207d793          	srli	a5,a5,0x20
    800089a0:	00fd87b3          	add	a5,s11,a5
    800089a4:	0007c783          	lbu	a5,0(a5)
    800089a8:	02e656bb          	divuw	a3,a2,a4
    800089ac:	f8f40023          	sb	a5,-128(s0)
    800089b0:	14c5d863          	bge	a1,a2,80008b00 <__printf+0x278>
    800089b4:	06300593          	li	a1,99
    800089b8:	00100c93          	li	s9,1
    800089bc:	02e6f7bb          	remuw	a5,a3,a4
    800089c0:	02079793          	slli	a5,a5,0x20
    800089c4:	0207d793          	srli	a5,a5,0x20
    800089c8:	00fd87b3          	add	a5,s11,a5
    800089cc:	0007c783          	lbu	a5,0(a5)
    800089d0:	02e6d73b          	divuw	a4,a3,a4
    800089d4:	f8f400a3          	sb	a5,-127(s0)
    800089d8:	12a5f463          	bgeu	a1,a0,80008b00 <__printf+0x278>
    800089dc:	00a00693          	li	a3,10
    800089e0:	00900593          	li	a1,9
    800089e4:	02d777bb          	remuw	a5,a4,a3
    800089e8:	02079793          	slli	a5,a5,0x20
    800089ec:	0207d793          	srli	a5,a5,0x20
    800089f0:	00fd87b3          	add	a5,s11,a5
    800089f4:	0007c503          	lbu	a0,0(a5)
    800089f8:	02d757bb          	divuw	a5,a4,a3
    800089fc:	f8a40123          	sb	a0,-126(s0)
    80008a00:	48e5f263          	bgeu	a1,a4,80008e84 <__printf+0x5fc>
    80008a04:	06300513          	li	a0,99
    80008a08:	02d7f5bb          	remuw	a1,a5,a3
    80008a0c:	02059593          	slli	a1,a1,0x20
    80008a10:	0205d593          	srli	a1,a1,0x20
    80008a14:	00bd85b3          	add	a1,s11,a1
    80008a18:	0005c583          	lbu	a1,0(a1)
    80008a1c:	02d7d7bb          	divuw	a5,a5,a3
    80008a20:	f8b401a3          	sb	a1,-125(s0)
    80008a24:	48e57263          	bgeu	a0,a4,80008ea8 <__printf+0x620>
    80008a28:	3e700513          	li	a0,999
    80008a2c:	02d7f5bb          	remuw	a1,a5,a3
    80008a30:	02059593          	slli	a1,a1,0x20
    80008a34:	0205d593          	srli	a1,a1,0x20
    80008a38:	00bd85b3          	add	a1,s11,a1
    80008a3c:	0005c583          	lbu	a1,0(a1)
    80008a40:	02d7d7bb          	divuw	a5,a5,a3
    80008a44:	f8b40223          	sb	a1,-124(s0)
    80008a48:	46e57663          	bgeu	a0,a4,80008eb4 <__printf+0x62c>
    80008a4c:	02d7f5bb          	remuw	a1,a5,a3
    80008a50:	02059593          	slli	a1,a1,0x20
    80008a54:	0205d593          	srli	a1,a1,0x20
    80008a58:	00bd85b3          	add	a1,s11,a1
    80008a5c:	0005c583          	lbu	a1,0(a1)
    80008a60:	02d7d7bb          	divuw	a5,a5,a3
    80008a64:	f8b402a3          	sb	a1,-123(s0)
    80008a68:	46ea7863          	bgeu	s4,a4,80008ed8 <__printf+0x650>
    80008a6c:	02d7f5bb          	remuw	a1,a5,a3
    80008a70:	02059593          	slli	a1,a1,0x20
    80008a74:	0205d593          	srli	a1,a1,0x20
    80008a78:	00bd85b3          	add	a1,s11,a1
    80008a7c:	0005c583          	lbu	a1,0(a1)
    80008a80:	02d7d7bb          	divuw	a5,a5,a3
    80008a84:	f8b40323          	sb	a1,-122(s0)
    80008a88:	3eeaf863          	bgeu	s5,a4,80008e78 <__printf+0x5f0>
    80008a8c:	02d7f5bb          	remuw	a1,a5,a3
    80008a90:	02059593          	slli	a1,a1,0x20
    80008a94:	0205d593          	srli	a1,a1,0x20
    80008a98:	00bd85b3          	add	a1,s11,a1
    80008a9c:	0005c583          	lbu	a1,0(a1)
    80008aa0:	02d7d7bb          	divuw	a5,a5,a3
    80008aa4:	f8b403a3          	sb	a1,-121(s0)
    80008aa8:	42eb7e63          	bgeu	s6,a4,80008ee4 <__printf+0x65c>
    80008aac:	02d7f5bb          	remuw	a1,a5,a3
    80008ab0:	02059593          	slli	a1,a1,0x20
    80008ab4:	0205d593          	srli	a1,a1,0x20
    80008ab8:	00bd85b3          	add	a1,s11,a1
    80008abc:	0005c583          	lbu	a1,0(a1)
    80008ac0:	02d7d7bb          	divuw	a5,a5,a3
    80008ac4:	f8b40423          	sb	a1,-120(s0)
    80008ac8:	42ebfc63          	bgeu	s7,a4,80008f00 <__printf+0x678>
    80008acc:	02079793          	slli	a5,a5,0x20
    80008ad0:	0207d793          	srli	a5,a5,0x20
    80008ad4:	00fd8db3          	add	s11,s11,a5
    80008ad8:	000dc703          	lbu	a4,0(s11)
    80008adc:	00a00793          	li	a5,10
    80008ae0:	00900c93          	li	s9,9
    80008ae4:	f8e404a3          	sb	a4,-119(s0)
    80008ae8:	00065c63          	bgez	a2,80008b00 <__printf+0x278>
    80008aec:	f9040713          	addi	a4,s0,-112
    80008af0:	00f70733          	add	a4,a4,a5
    80008af4:	02d00693          	li	a3,45
    80008af8:	fed70823          	sb	a3,-16(a4)
    80008afc:	00078c93          	mv	s9,a5
    80008b00:	f8040793          	addi	a5,s0,-128
    80008b04:	01978cb3          	add	s9,a5,s9
    80008b08:	f7f40d13          	addi	s10,s0,-129
    80008b0c:	000cc503          	lbu	a0,0(s9)
    80008b10:	fffc8c93          	addi	s9,s9,-1
    80008b14:	00000097          	auipc	ra,0x0
    80008b18:	b90080e7          	jalr	-1136(ra) # 800086a4 <consputc>
    80008b1c:	ffac98e3          	bne	s9,s10,80008b0c <__printf+0x284>
    80008b20:	00094503          	lbu	a0,0(s2)
    80008b24:	e00514e3          	bnez	a0,8000892c <__printf+0xa4>
    80008b28:	1a0c1663          	bnez	s8,80008cd4 <__printf+0x44c>
    80008b2c:	08813083          	ld	ra,136(sp)
    80008b30:	08013403          	ld	s0,128(sp)
    80008b34:	07813483          	ld	s1,120(sp)
    80008b38:	07013903          	ld	s2,112(sp)
    80008b3c:	06813983          	ld	s3,104(sp)
    80008b40:	06013a03          	ld	s4,96(sp)
    80008b44:	05813a83          	ld	s5,88(sp)
    80008b48:	05013b03          	ld	s6,80(sp)
    80008b4c:	04813b83          	ld	s7,72(sp)
    80008b50:	04013c03          	ld	s8,64(sp)
    80008b54:	03813c83          	ld	s9,56(sp)
    80008b58:	03013d03          	ld	s10,48(sp)
    80008b5c:	02813d83          	ld	s11,40(sp)
    80008b60:	0d010113          	addi	sp,sp,208
    80008b64:	00008067          	ret
    80008b68:	07300713          	li	a4,115
    80008b6c:	1ce78a63          	beq	a5,a4,80008d40 <__printf+0x4b8>
    80008b70:	07800713          	li	a4,120
    80008b74:	1ee79e63          	bne	a5,a4,80008d70 <__printf+0x4e8>
    80008b78:	f7843783          	ld	a5,-136(s0)
    80008b7c:	0007a703          	lw	a4,0(a5)
    80008b80:	00878793          	addi	a5,a5,8
    80008b84:	f6f43c23          	sd	a5,-136(s0)
    80008b88:	28074263          	bltz	a4,80008e0c <__printf+0x584>
    80008b8c:	00002d97          	auipc	s11,0x2
    80008b90:	d3cd8d93          	addi	s11,s11,-708 # 8000a8c8 <digits>
    80008b94:	00f77793          	andi	a5,a4,15
    80008b98:	00fd87b3          	add	a5,s11,a5
    80008b9c:	0007c683          	lbu	a3,0(a5)
    80008ba0:	00f00613          	li	a2,15
    80008ba4:	0007079b          	sext.w	a5,a4
    80008ba8:	f8d40023          	sb	a3,-128(s0)
    80008bac:	0047559b          	srliw	a1,a4,0x4
    80008bb0:	0047569b          	srliw	a3,a4,0x4
    80008bb4:	00000c93          	li	s9,0
    80008bb8:	0ee65063          	bge	a2,a4,80008c98 <__printf+0x410>
    80008bbc:	00f6f693          	andi	a3,a3,15
    80008bc0:	00dd86b3          	add	a3,s11,a3
    80008bc4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80008bc8:	0087d79b          	srliw	a5,a5,0x8
    80008bcc:	00100c93          	li	s9,1
    80008bd0:	f8d400a3          	sb	a3,-127(s0)
    80008bd4:	0cb67263          	bgeu	a2,a1,80008c98 <__printf+0x410>
    80008bd8:	00f7f693          	andi	a3,a5,15
    80008bdc:	00dd86b3          	add	a3,s11,a3
    80008be0:	0006c583          	lbu	a1,0(a3)
    80008be4:	00f00613          	li	a2,15
    80008be8:	0047d69b          	srliw	a3,a5,0x4
    80008bec:	f8b40123          	sb	a1,-126(s0)
    80008bf0:	0047d593          	srli	a1,a5,0x4
    80008bf4:	28f67e63          	bgeu	a2,a5,80008e90 <__printf+0x608>
    80008bf8:	00f6f693          	andi	a3,a3,15
    80008bfc:	00dd86b3          	add	a3,s11,a3
    80008c00:	0006c503          	lbu	a0,0(a3)
    80008c04:	0087d813          	srli	a6,a5,0x8
    80008c08:	0087d69b          	srliw	a3,a5,0x8
    80008c0c:	f8a401a3          	sb	a0,-125(s0)
    80008c10:	28b67663          	bgeu	a2,a1,80008e9c <__printf+0x614>
    80008c14:	00f6f693          	andi	a3,a3,15
    80008c18:	00dd86b3          	add	a3,s11,a3
    80008c1c:	0006c583          	lbu	a1,0(a3)
    80008c20:	00c7d513          	srli	a0,a5,0xc
    80008c24:	00c7d69b          	srliw	a3,a5,0xc
    80008c28:	f8b40223          	sb	a1,-124(s0)
    80008c2c:	29067a63          	bgeu	a2,a6,80008ec0 <__printf+0x638>
    80008c30:	00f6f693          	andi	a3,a3,15
    80008c34:	00dd86b3          	add	a3,s11,a3
    80008c38:	0006c583          	lbu	a1,0(a3)
    80008c3c:	0107d813          	srli	a6,a5,0x10
    80008c40:	0107d69b          	srliw	a3,a5,0x10
    80008c44:	f8b402a3          	sb	a1,-123(s0)
    80008c48:	28a67263          	bgeu	a2,a0,80008ecc <__printf+0x644>
    80008c4c:	00f6f693          	andi	a3,a3,15
    80008c50:	00dd86b3          	add	a3,s11,a3
    80008c54:	0006c683          	lbu	a3,0(a3)
    80008c58:	0147d79b          	srliw	a5,a5,0x14
    80008c5c:	f8d40323          	sb	a3,-122(s0)
    80008c60:	21067663          	bgeu	a2,a6,80008e6c <__printf+0x5e4>
    80008c64:	02079793          	slli	a5,a5,0x20
    80008c68:	0207d793          	srli	a5,a5,0x20
    80008c6c:	00fd8db3          	add	s11,s11,a5
    80008c70:	000dc683          	lbu	a3,0(s11)
    80008c74:	00800793          	li	a5,8
    80008c78:	00700c93          	li	s9,7
    80008c7c:	f8d403a3          	sb	a3,-121(s0)
    80008c80:	00075c63          	bgez	a4,80008c98 <__printf+0x410>
    80008c84:	f9040713          	addi	a4,s0,-112
    80008c88:	00f70733          	add	a4,a4,a5
    80008c8c:	02d00693          	li	a3,45
    80008c90:	fed70823          	sb	a3,-16(a4)
    80008c94:	00078c93          	mv	s9,a5
    80008c98:	f8040793          	addi	a5,s0,-128
    80008c9c:	01978cb3          	add	s9,a5,s9
    80008ca0:	f7f40d13          	addi	s10,s0,-129
    80008ca4:	000cc503          	lbu	a0,0(s9)
    80008ca8:	fffc8c93          	addi	s9,s9,-1
    80008cac:	00000097          	auipc	ra,0x0
    80008cb0:	9f8080e7          	jalr	-1544(ra) # 800086a4 <consputc>
    80008cb4:	ff9d18e3          	bne	s10,s9,80008ca4 <__printf+0x41c>
    80008cb8:	0100006f          	j	80008cc8 <__printf+0x440>
    80008cbc:	00000097          	auipc	ra,0x0
    80008cc0:	9e8080e7          	jalr	-1560(ra) # 800086a4 <consputc>
    80008cc4:	000c8493          	mv	s1,s9
    80008cc8:	00094503          	lbu	a0,0(s2)
    80008ccc:	c60510e3          	bnez	a0,8000892c <__printf+0xa4>
    80008cd0:	e40c0ee3          	beqz	s8,80008b2c <__printf+0x2a4>
    80008cd4:	00005517          	auipc	a0,0x5
    80008cd8:	7fc50513          	addi	a0,a0,2044 # 8000e4d0 <pr>
    80008cdc:	00001097          	auipc	ra,0x1
    80008ce0:	94c080e7          	jalr	-1716(ra) # 80009628 <release>
    80008ce4:	e49ff06f          	j	80008b2c <__printf+0x2a4>
    80008ce8:	f7843783          	ld	a5,-136(s0)
    80008cec:	03000513          	li	a0,48
    80008cf0:	01000d13          	li	s10,16
    80008cf4:	00878713          	addi	a4,a5,8
    80008cf8:	0007bc83          	ld	s9,0(a5)
    80008cfc:	f6e43c23          	sd	a4,-136(s0)
    80008d00:	00000097          	auipc	ra,0x0
    80008d04:	9a4080e7          	jalr	-1628(ra) # 800086a4 <consputc>
    80008d08:	07800513          	li	a0,120
    80008d0c:	00000097          	auipc	ra,0x0
    80008d10:	998080e7          	jalr	-1640(ra) # 800086a4 <consputc>
    80008d14:	00002d97          	auipc	s11,0x2
    80008d18:	bb4d8d93          	addi	s11,s11,-1100 # 8000a8c8 <digits>
    80008d1c:	03ccd793          	srli	a5,s9,0x3c
    80008d20:	00fd87b3          	add	a5,s11,a5
    80008d24:	0007c503          	lbu	a0,0(a5)
    80008d28:	fffd0d1b          	addiw	s10,s10,-1
    80008d2c:	004c9c93          	slli	s9,s9,0x4
    80008d30:	00000097          	auipc	ra,0x0
    80008d34:	974080e7          	jalr	-1676(ra) # 800086a4 <consputc>
    80008d38:	fe0d12e3          	bnez	s10,80008d1c <__printf+0x494>
    80008d3c:	f8dff06f          	j	80008cc8 <__printf+0x440>
    80008d40:	f7843783          	ld	a5,-136(s0)
    80008d44:	0007bc83          	ld	s9,0(a5)
    80008d48:	00878793          	addi	a5,a5,8
    80008d4c:	f6f43c23          	sd	a5,-136(s0)
    80008d50:	000c9a63          	bnez	s9,80008d64 <__printf+0x4dc>
    80008d54:	1080006f          	j	80008e5c <__printf+0x5d4>
    80008d58:	001c8c93          	addi	s9,s9,1
    80008d5c:	00000097          	auipc	ra,0x0
    80008d60:	948080e7          	jalr	-1720(ra) # 800086a4 <consputc>
    80008d64:	000cc503          	lbu	a0,0(s9)
    80008d68:	fe0518e3          	bnez	a0,80008d58 <__printf+0x4d0>
    80008d6c:	f5dff06f          	j	80008cc8 <__printf+0x440>
    80008d70:	02500513          	li	a0,37
    80008d74:	00000097          	auipc	ra,0x0
    80008d78:	930080e7          	jalr	-1744(ra) # 800086a4 <consputc>
    80008d7c:	000c8513          	mv	a0,s9
    80008d80:	00000097          	auipc	ra,0x0
    80008d84:	924080e7          	jalr	-1756(ra) # 800086a4 <consputc>
    80008d88:	f41ff06f          	j	80008cc8 <__printf+0x440>
    80008d8c:	02500513          	li	a0,37
    80008d90:	00000097          	auipc	ra,0x0
    80008d94:	914080e7          	jalr	-1772(ra) # 800086a4 <consputc>
    80008d98:	f31ff06f          	j	80008cc8 <__printf+0x440>
    80008d9c:	00030513          	mv	a0,t1
    80008da0:	00000097          	auipc	ra,0x0
    80008da4:	7bc080e7          	jalr	1980(ra) # 8000955c <acquire>
    80008da8:	b4dff06f          	j	800088f4 <__printf+0x6c>
    80008dac:	40c0053b          	negw	a0,a2
    80008db0:	00a00713          	li	a4,10
    80008db4:	02e576bb          	remuw	a3,a0,a4
    80008db8:	00002d97          	auipc	s11,0x2
    80008dbc:	b10d8d93          	addi	s11,s11,-1264 # 8000a8c8 <digits>
    80008dc0:	ff700593          	li	a1,-9
    80008dc4:	02069693          	slli	a3,a3,0x20
    80008dc8:	0206d693          	srli	a3,a3,0x20
    80008dcc:	00dd86b3          	add	a3,s11,a3
    80008dd0:	0006c683          	lbu	a3,0(a3)
    80008dd4:	02e557bb          	divuw	a5,a0,a4
    80008dd8:	f8d40023          	sb	a3,-128(s0)
    80008ddc:	10b65e63          	bge	a2,a1,80008ef8 <__printf+0x670>
    80008de0:	06300593          	li	a1,99
    80008de4:	02e7f6bb          	remuw	a3,a5,a4
    80008de8:	02069693          	slli	a3,a3,0x20
    80008dec:	0206d693          	srli	a3,a3,0x20
    80008df0:	00dd86b3          	add	a3,s11,a3
    80008df4:	0006c683          	lbu	a3,0(a3)
    80008df8:	02e7d73b          	divuw	a4,a5,a4
    80008dfc:	00200793          	li	a5,2
    80008e00:	f8d400a3          	sb	a3,-127(s0)
    80008e04:	bca5ece3          	bltu	a1,a0,800089dc <__printf+0x154>
    80008e08:	ce5ff06f          	j	80008aec <__printf+0x264>
    80008e0c:	40e007bb          	negw	a5,a4
    80008e10:	00002d97          	auipc	s11,0x2
    80008e14:	ab8d8d93          	addi	s11,s11,-1352 # 8000a8c8 <digits>
    80008e18:	00f7f693          	andi	a3,a5,15
    80008e1c:	00dd86b3          	add	a3,s11,a3
    80008e20:	0006c583          	lbu	a1,0(a3)
    80008e24:	ff100613          	li	a2,-15
    80008e28:	0047d69b          	srliw	a3,a5,0x4
    80008e2c:	f8b40023          	sb	a1,-128(s0)
    80008e30:	0047d59b          	srliw	a1,a5,0x4
    80008e34:	0ac75e63          	bge	a4,a2,80008ef0 <__printf+0x668>
    80008e38:	00f6f693          	andi	a3,a3,15
    80008e3c:	00dd86b3          	add	a3,s11,a3
    80008e40:	0006c603          	lbu	a2,0(a3)
    80008e44:	00f00693          	li	a3,15
    80008e48:	0087d79b          	srliw	a5,a5,0x8
    80008e4c:	f8c400a3          	sb	a2,-127(s0)
    80008e50:	d8b6e4e3          	bltu	a3,a1,80008bd8 <__printf+0x350>
    80008e54:	00200793          	li	a5,2
    80008e58:	e2dff06f          	j	80008c84 <__printf+0x3fc>
    80008e5c:	00002c97          	auipc	s9,0x2
    80008e60:	a4cc8c93          	addi	s9,s9,-1460 # 8000a8a8 <CONSOLE_STATUS+0x898>
    80008e64:	02800513          	li	a0,40
    80008e68:	ef1ff06f          	j	80008d58 <__printf+0x4d0>
    80008e6c:	00700793          	li	a5,7
    80008e70:	00600c93          	li	s9,6
    80008e74:	e0dff06f          	j	80008c80 <__printf+0x3f8>
    80008e78:	00700793          	li	a5,7
    80008e7c:	00600c93          	li	s9,6
    80008e80:	c69ff06f          	j	80008ae8 <__printf+0x260>
    80008e84:	00300793          	li	a5,3
    80008e88:	00200c93          	li	s9,2
    80008e8c:	c5dff06f          	j	80008ae8 <__printf+0x260>
    80008e90:	00300793          	li	a5,3
    80008e94:	00200c93          	li	s9,2
    80008e98:	de9ff06f          	j	80008c80 <__printf+0x3f8>
    80008e9c:	00400793          	li	a5,4
    80008ea0:	00300c93          	li	s9,3
    80008ea4:	dddff06f          	j	80008c80 <__printf+0x3f8>
    80008ea8:	00400793          	li	a5,4
    80008eac:	00300c93          	li	s9,3
    80008eb0:	c39ff06f          	j	80008ae8 <__printf+0x260>
    80008eb4:	00500793          	li	a5,5
    80008eb8:	00400c93          	li	s9,4
    80008ebc:	c2dff06f          	j	80008ae8 <__printf+0x260>
    80008ec0:	00500793          	li	a5,5
    80008ec4:	00400c93          	li	s9,4
    80008ec8:	db9ff06f          	j	80008c80 <__printf+0x3f8>
    80008ecc:	00600793          	li	a5,6
    80008ed0:	00500c93          	li	s9,5
    80008ed4:	dadff06f          	j	80008c80 <__printf+0x3f8>
    80008ed8:	00600793          	li	a5,6
    80008edc:	00500c93          	li	s9,5
    80008ee0:	c09ff06f          	j	80008ae8 <__printf+0x260>
    80008ee4:	00800793          	li	a5,8
    80008ee8:	00700c93          	li	s9,7
    80008eec:	bfdff06f          	j	80008ae8 <__printf+0x260>
    80008ef0:	00100793          	li	a5,1
    80008ef4:	d91ff06f          	j	80008c84 <__printf+0x3fc>
    80008ef8:	00100793          	li	a5,1
    80008efc:	bf1ff06f          	j	80008aec <__printf+0x264>
    80008f00:	00900793          	li	a5,9
    80008f04:	00800c93          	li	s9,8
    80008f08:	be1ff06f          	j	80008ae8 <__printf+0x260>
    80008f0c:	00002517          	auipc	a0,0x2
    80008f10:	9a450513          	addi	a0,a0,-1628 # 8000a8b0 <CONSOLE_STATUS+0x8a0>
    80008f14:	00000097          	auipc	ra,0x0
    80008f18:	918080e7          	jalr	-1768(ra) # 8000882c <panic>

0000000080008f1c <printfinit>:
    80008f1c:	fe010113          	addi	sp,sp,-32
    80008f20:	00813823          	sd	s0,16(sp)
    80008f24:	00913423          	sd	s1,8(sp)
    80008f28:	00113c23          	sd	ra,24(sp)
    80008f2c:	02010413          	addi	s0,sp,32
    80008f30:	00005497          	auipc	s1,0x5
    80008f34:	5a048493          	addi	s1,s1,1440 # 8000e4d0 <pr>
    80008f38:	00048513          	mv	a0,s1
    80008f3c:	00002597          	auipc	a1,0x2
    80008f40:	98458593          	addi	a1,a1,-1660 # 8000a8c0 <CONSOLE_STATUS+0x8b0>
    80008f44:	00000097          	auipc	ra,0x0
    80008f48:	5f4080e7          	jalr	1524(ra) # 80009538 <initlock>
    80008f4c:	01813083          	ld	ra,24(sp)
    80008f50:	01013403          	ld	s0,16(sp)
    80008f54:	0004ac23          	sw	zero,24(s1)
    80008f58:	00813483          	ld	s1,8(sp)
    80008f5c:	02010113          	addi	sp,sp,32
    80008f60:	00008067          	ret

0000000080008f64 <uartinit>:
    80008f64:	ff010113          	addi	sp,sp,-16
    80008f68:	00813423          	sd	s0,8(sp)
    80008f6c:	01010413          	addi	s0,sp,16
    80008f70:	100007b7          	lui	a5,0x10000
    80008f74:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008f78:	f8000713          	li	a4,-128
    80008f7c:	00e781a3          	sb	a4,3(a5)
    80008f80:	00300713          	li	a4,3
    80008f84:	00e78023          	sb	a4,0(a5)
    80008f88:	000780a3          	sb	zero,1(a5)
    80008f8c:	00e781a3          	sb	a4,3(a5)
    80008f90:	00700693          	li	a3,7
    80008f94:	00d78123          	sb	a3,2(a5)
    80008f98:	00e780a3          	sb	a4,1(a5)
    80008f9c:	00813403          	ld	s0,8(sp)
    80008fa0:	01010113          	addi	sp,sp,16
    80008fa4:	00008067          	ret

0000000080008fa8 <uartputc>:
    80008fa8:	00004797          	auipc	a5,0x4
    80008fac:	1507a783          	lw	a5,336(a5) # 8000d0f8 <panicked>
    80008fb0:	00078463          	beqz	a5,80008fb8 <uartputc+0x10>
    80008fb4:	0000006f          	j	80008fb4 <uartputc+0xc>
    80008fb8:	fd010113          	addi	sp,sp,-48
    80008fbc:	02813023          	sd	s0,32(sp)
    80008fc0:	00913c23          	sd	s1,24(sp)
    80008fc4:	01213823          	sd	s2,16(sp)
    80008fc8:	01313423          	sd	s3,8(sp)
    80008fcc:	02113423          	sd	ra,40(sp)
    80008fd0:	03010413          	addi	s0,sp,48
    80008fd4:	00004917          	auipc	s2,0x4
    80008fd8:	12c90913          	addi	s2,s2,300 # 8000d100 <uart_tx_r>
    80008fdc:	00093783          	ld	a5,0(s2)
    80008fe0:	00004497          	auipc	s1,0x4
    80008fe4:	12848493          	addi	s1,s1,296 # 8000d108 <uart_tx_w>
    80008fe8:	0004b703          	ld	a4,0(s1)
    80008fec:	02078693          	addi	a3,a5,32
    80008ff0:	00050993          	mv	s3,a0
    80008ff4:	02e69c63          	bne	a3,a4,8000902c <uartputc+0x84>
    80008ff8:	00001097          	auipc	ra,0x1
    80008ffc:	834080e7          	jalr	-1996(ra) # 8000982c <push_on>
    80009000:	00093783          	ld	a5,0(s2)
    80009004:	0004b703          	ld	a4,0(s1)
    80009008:	02078793          	addi	a5,a5,32
    8000900c:	00e79463          	bne	a5,a4,80009014 <uartputc+0x6c>
    80009010:	0000006f          	j	80009010 <uartputc+0x68>
    80009014:	00001097          	auipc	ra,0x1
    80009018:	88c080e7          	jalr	-1908(ra) # 800098a0 <pop_on>
    8000901c:	00093783          	ld	a5,0(s2)
    80009020:	0004b703          	ld	a4,0(s1)
    80009024:	02078693          	addi	a3,a5,32
    80009028:	fce688e3          	beq	a3,a4,80008ff8 <uartputc+0x50>
    8000902c:	01f77693          	andi	a3,a4,31
    80009030:	00005597          	auipc	a1,0x5
    80009034:	4c058593          	addi	a1,a1,1216 # 8000e4f0 <uart_tx_buf>
    80009038:	00d586b3          	add	a3,a1,a3
    8000903c:	00170713          	addi	a4,a4,1
    80009040:	01368023          	sb	s3,0(a3)
    80009044:	00e4b023          	sd	a4,0(s1)
    80009048:	10000637          	lui	a2,0x10000
    8000904c:	02f71063          	bne	a4,a5,8000906c <uartputc+0xc4>
    80009050:	0340006f          	j	80009084 <uartputc+0xdc>
    80009054:	00074703          	lbu	a4,0(a4)
    80009058:	00f93023          	sd	a5,0(s2)
    8000905c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80009060:	00093783          	ld	a5,0(s2)
    80009064:	0004b703          	ld	a4,0(s1)
    80009068:	00f70e63          	beq	a4,a5,80009084 <uartputc+0xdc>
    8000906c:	00564683          	lbu	a3,5(a2)
    80009070:	01f7f713          	andi	a4,a5,31
    80009074:	00e58733          	add	a4,a1,a4
    80009078:	0206f693          	andi	a3,a3,32
    8000907c:	00178793          	addi	a5,a5,1
    80009080:	fc069ae3          	bnez	a3,80009054 <uartputc+0xac>
    80009084:	02813083          	ld	ra,40(sp)
    80009088:	02013403          	ld	s0,32(sp)
    8000908c:	01813483          	ld	s1,24(sp)
    80009090:	01013903          	ld	s2,16(sp)
    80009094:	00813983          	ld	s3,8(sp)
    80009098:	03010113          	addi	sp,sp,48
    8000909c:	00008067          	ret

00000000800090a0 <uartputc_sync>:
    800090a0:	ff010113          	addi	sp,sp,-16
    800090a4:	00813423          	sd	s0,8(sp)
    800090a8:	01010413          	addi	s0,sp,16
    800090ac:	00004717          	auipc	a4,0x4
    800090b0:	04c72703          	lw	a4,76(a4) # 8000d0f8 <panicked>
    800090b4:	02071663          	bnez	a4,800090e0 <uartputc_sync+0x40>
    800090b8:	00050793          	mv	a5,a0
    800090bc:	100006b7          	lui	a3,0x10000
    800090c0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800090c4:	02077713          	andi	a4,a4,32
    800090c8:	fe070ce3          	beqz	a4,800090c0 <uartputc_sync+0x20>
    800090cc:	0ff7f793          	andi	a5,a5,255
    800090d0:	00f68023          	sb	a5,0(a3)
    800090d4:	00813403          	ld	s0,8(sp)
    800090d8:	01010113          	addi	sp,sp,16
    800090dc:	00008067          	ret
    800090e0:	0000006f          	j	800090e0 <uartputc_sync+0x40>

00000000800090e4 <uartstart>:
    800090e4:	ff010113          	addi	sp,sp,-16
    800090e8:	00813423          	sd	s0,8(sp)
    800090ec:	01010413          	addi	s0,sp,16
    800090f0:	00004617          	auipc	a2,0x4
    800090f4:	01060613          	addi	a2,a2,16 # 8000d100 <uart_tx_r>
    800090f8:	00004517          	auipc	a0,0x4
    800090fc:	01050513          	addi	a0,a0,16 # 8000d108 <uart_tx_w>
    80009100:	00063783          	ld	a5,0(a2)
    80009104:	00053703          	ld	a4,0(a0)
    80009108:	04f70263          	beq	a4,a5,8000914c <uartstart+0x68>
    8000910c:	100005b7          	lui	a1,0x10000
    80009110:	00005817          	auipc	a6,0x5
    80009114:	3e080813          	addi	a6,a6,992 # 8000e4f0 <uart_tx_buf>
    80009118:	01c0006f          	j	80009134 <uartstart+0x50>
    8000911c:	0006c703          	lbu	a4,0(a3)
    80009120:	00f63023          	sd	a5,0(a2)
    80009124:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80009128:	00063783          	ld	a5,0(a2)
    8000912c:	00053703          	ld	a4,0(a0)
    80009130:	00f70e63          	beq	a4,a5,8000914c <uartstart+0x68>
    80009134:	01f7f713          	andi	a4,a5,31
    80009138:	00e806b3          	add	a3,a6,a4
    8000913c:	0055c703          	lbu	a4,5(a1)
    80009140:	00178793          	addi	a5,a5,1
    80009144:	02077713          	andi	a4,a4,32
    80009148:	fc071ae3          	bnez	a4,8000911c <uartstart+0x38>
    8000914c:	00813403          	ld	s0,8(sp)
    80009150:	01010113          	addi	sp,sp,16
    80009154:	00008067          	ret

0000000080009158 <uartgetc>:
    80009158:	ff010113          	addi	sp,sp,-16
    8000915c:	00813423          	sd	s0,8(sp)
    80009160:	01010413          	addi	s0,sp,16
    80009164:	10000737          	lui	a4,0x10000
    80009168:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000916c:	0017f793          	andi	a5,a5,1
    80009170:	00078c63          	beqz	a5,80009188 <uartgetc+0x30>
    80009174:	00074503          	lbu	a0,0(a4)
    80009178:	0ff57513          	andi	a0,a0,255
    8000917c:	00813403          	ld	s0,8(sp)
    80009180:	01010113          	addi	sp,sp,16
    80009184:	00008067          	ret
    80009188:	fff00513          	li	a0,-1
    8000918c:	ff1ff06f          	j	8000917c <uartgetc+0x24>

0000000080009190 <uartintr>:
    80009190:	100007b7          	lui	a5,0x10000
    80009194:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80009198:	0017f793          	andi	a5,a5,1
    8000919c:	0a078463          	beqz	a5,80009244 <uartintr+0xb4>
    800091a0:	fe010113          	addi	sp,sp,-32
    800091a4:	00813823          	sd	s0,16(sp)
    800091a8:	00913423          	sd	s1,8(sp)
    800091ac:	00113c23          	sd	ra,24(sp)
    800091b0:	02010413          	addi	s0,sp,32
    800091b4:	100004b7          	lui	s1,0x10000
    800091b8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800091bc:	0ff57513          	andi	a0,a0,255
    800091c0:	fffff097          	auipc	ra,0xfffff
    800091c4:	534080e7          	jalr	1332(ra) # 800086f4 <consoleintr>
    800091c8:	0054c783          	lbu	a5,5(s1)
    800091cc:	0017f793          	andi	a5,a5,1
    800091d0:	fe0794e3          	bnez	a5,800091b8 <uartintr+0x28>
    800091d4:	00004617          	auipc	a2,0x4
    800091d8:	f2c60613          	addi	a2,a2,-212 # 8000d100 <uart_tx_r>
    800091dc:	00004517          	auipc	a0,0x4
    800091e0:	f2c50513          	addi	a0,a0,-212 # 8000d108 <uart_tx_w>
    800091e4:	00063783          	ld	a5,0(a2)
    800091e8:	00053703          	ld	a4,0(a0)
    800091ec:	04f70263          	beq	a4,a5,80009230 <uartintr+0xa0>
    800091f0:	100005b7          	lui	a1,0x10000
    800091f4:	00005817          	auipc	a6,0x5
    800091f8:	2fc80813          	addi	a6,a6,764 # 8000e4f0 <uart_tx_buf>
    800091fc:	01c0006f          	j	80009218 <uartintr+0x88>
    80009200:	0006c703          	lbu	a4,0(a3)
    80009204:	00f63023          	sd	a5,0(a2)
    80009208:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000920c:	00063783          	ld	a5,0(a2)
    80009210:	00053703          	ld	a4,0(a0)
    80009214:	00f70e63          	beq	a4,a5,80009230 <uartintr+0xa0>
    80009218:	01f7f713          	andi	a4,a5,31
    8000921c:	00e806b3          	add	a3,a6,a4
    80009220:	0055c703          	lbu	a4,5(a1)
    80009224:	00178793          	addi	a5,a5,1
    80009228:	02077713          	andi	a4,a4,32
    8000922c:	fc071ae3          	bnez	a4,80009200 <uartintr+0x70>
    80009230:	01813083          	ld	ra,24(sp)
    80009234:	01013403          	ld	s0,16(sp)
    80009238:	00813483          	ld	s1,8(sp)
    8000923c:	02010113          	addi	sp,sp,32
    80009240:	00008067          	ret
    80009244:	00004617          	auipc	a2,0x4
    80009248:	ebc60613          	addi	a2,a2,-324 # 8000d100 <uart_tx_r>
    8000924c:	00004517          	auipc	a0,0x4
    80009250:	ebc50513          	addi	a0,a0,-324 # 8000d108 <uart_tx_w>
    80009254:	00063783          	ld	a5,0(a2)
    80009258:	00053703          	ld	a4,0(a0)
    8000925c:	04f70263          	beq	a4,a5,800092a0 <uartintr+0x110>
    80009260:	100005b7          	lui	a1,0x10000
    80009264:	00005817          	auipc	a6,0x5
    80009268:	28c80813          	addi	a6,a6,652 # 8000e4f0 <uart_tx_buf>
    8000926c:	01c0006f          	j	80009288 <uartintr+0xf8>
    80009270:	0006c703          	lbu	a4,0(a3)
    80009274:	00f63023          	sd	a5,0(a2)
    80009278:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000927c:	00063783          	ld	a5,0(a2)
    80009280:	00053703          	ld	a4,0(a0)
    80009284:	02f70063          	beq	a4,a5,800092a4 <uartintr+0x114>
    80009288:	01f7f713          	andi	a4,a5,31
    8000928c:	00e806b3          	add	a3,a6,a4
    80009290:	0055c703          	lbu	a4,5(a1)
    80009294:	00178793          	addi	a5,a5,1
    80009298:	02077713          	andi	a4,a4,32
    8000929c:	fc071ae3          	bnez	a4,80009270 <uartintr+0xe0>
    800092a0:	00008067          	ret
    800092a4:	00008067          	ret

00000000800092a8 <kinit>:
    800092a8:	fc010113          	addi	sp,sp,-64
    800092ac:	02913423          	sd	s1,40(sp)
    800092b0:	fffff7b7          	lui	a5,0xfffff
    800092b4:	00006497          	auipc	s1,0x6
    800092b8:	25b48493          	addi	s1,s1,603 # 8000f50f <end+0xfff>
    800092bc:	02813823          	sd	s0,48(sp)
    800092c0:	01313c23          	sd	s3,24(sp)
    800092c4:	00f4f4b3          	and	s1,s1,a5
    800092c8:	02113c23          	sd	ra,56(sp)
    800092cc:	03213023          	sd	s2,32(sp)
    800092d0:	01413823          	sd	s4,16(sp)
    800092d4:	01513423          	sd	s5,8(sp)
    800092d8:	04010413          	addi	s0,sp,64
    800092dc:	000017b7          	lui	a5,0x1
    800092e0:	01100993          	li	s3,17
    800092e4:	00f487b3          	add	a5,s1,a5
    800092e8:	01b99993          	slli	s3,s3,0x1b
    800092ec:	06f9e063          	bltu	s3,a5,8000934c <kinit+0xa4>
    800092f0:	00005a97          	auipc	s5,0x5
    800092f4:	220a8a93          	addi	s5,s5,544 # 8000e510 <end>
    800092f8:	0754ec63          	bltu	s1,s5,80009370 <kinit+0xc8>
    800092fc:	0734fa63          	bgeu	s1,s3,80009370 <kinit+0xc8>
    80009300:	00088a37          	lui	s4,0x88
    80009304:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80009308:	00004917          	auipc	s2,0x4
    8000930c:	e0890913          	addi	s2,s2,-504 # 8000d110 <kmem>
    80009310:	00ca1a13          	slli	s4,s4,0xc
    80009314:	0140006f          	j	80009328 <kinit+0x80>
    80009318:	000017b7          	lui	a5,0x1
    8000931c:	00f484b3          	add	s1,s1,a5
    80009320:	0554e863          	bltu	s1,s5,80009370 <kinit+0xc8>
    80009324:	0534f663          	bgeu	s1,s3,80009370 <kinit+0xc8>
    80009328:	00001637          	lui	a2,0x1
    8000932c:	00100593          	li	a1,1
    80009330:	00048513          	mv	a0,s1
    80009334:	00000097          	auipc	ra,0x0
    80009338:	5e4080e7          	jalr	1508(ra) # 80009918 <__memset>
    8000933c:	00093783          	ld	a5,0(s2)
    80009340:	00f4b023          	sd	a5,0(s1)
    80009344:	00993023          	sd	s1,0(s2)
    80009348:	fd4498e3          	bne	s1,s4,80009318 <kinit+0x70>
    8000934c:	03813083          	ld	ra,56(sp)
    80009350:	03013403          	ld	s0,48(sp)
    80009354:	02813483          	ld	s1,40(sp)
    80009358:	02013903          	ld	s2,32(sp)
    8000935c:	01813983          	ld	s3,24(sp)
    80009360:	01013a03          	ld	s4,16(sp)
    80009364:	00813a83          	ld	s5,8(sp)
    80009368:	04010113          	addi	sp,sp,64
    8000936c:	00008067          	ret
    80009370:	00001517          	auipc	a0,0x1
    80009374:	57050513          	addi	a0,a0,1392 # 8000a8e0 <digits+0x18>
    80009378:	fffff097          	auipc	ra,0xfffff
    8000937c:	4b4080e7          	jalr	1204(ra) # 8000882c <panic>

0000000080009380 <freerange>:
    80009380:	fc010113          	addi	sp,sp,-64
    80009384:	000017b7          	lui	a5,0x1
    80009388:	02913423          	sd	s1,40(sp)
    8000938c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80009390:	009504b3          	add	s1,a0,s1
    80009394:	fffff537          	lui	a0,0xfffff
    80009398:	02813823          	sd	s0,48(sp)
    8000939c:	02113c23          	sd	ra,56(sp)
    800093a0:	03213023          	sd	s2,32(sp)
    800093a4:	01313c23          	sd	s3,24(sp)
    800093a8:	01413823          	sd	s4,16(sp)
    800093ac:	01513423          	sd	s5,8(sp)
    800093b0:	01613023          	sd	s6,0(sp)
    800093b4:	04010413          	addi	s0,sp,64
    800093b8:	00a4f4b3          	and	s1,s1,a0
    800093bc:	00f487b3          	add	a5,s1,a5
    800093c0:	06f5e463          	bltu	a1,a5,80009428 <freerange+0xa8>
    800093c4:	00005a97          	auipc	s5,0x5
    800093c8:	14ca8a93          	addi	s5,s5,332 # 8000e510 <end>
    800093cc:	0954e263          	bltu	s1,s5,80009450 <freerange+0xd0>
    800093d0:	01100993          	li	s3,17
    800093d4:	01b99993          	slli	s3,s3,0x1b
    800093d8:	0734fc63          	bgeu	s1,s3,80009450 <freerange+0xd0>
    800093dc:	00058a13          	mv	s4,a1
    800093e0:	00004917          	auipc	s2,0x4
    800093e4:	d3090913          	addi	s2,s2,-720 # 8000d110 <kmem>
    800093e8:	00002b37          	lui	s6,0x2
    800093ec:	0140006f          	j	80009400 <freerange+0x80>
    800093f0:	000017b7          	lui	a5,0x1
    800093f4:	00f484b3          	add	s1,s1,a5
    800093f8:	0554ec63          	bltu	s1,s5,80009450 <freerange+0xd0>
    800093fc:	0534fa63          	bgeu	s1,s3,80009450 <freerange+0xd0>
    80009400:	00001637          	lui	a2,0x1
    80009404:	00100593          	li	a1,1
    80009408:	00048513          	mv	a0,s1
    8000940c:	00000097          	auipc	ra,0x0
    80009410:	50c080e7          	jalr	1292(ra) # 80009918 <__memset>
    80009414:	00093703          	ld	a4,0(s2)
    80009418:	016487b3          	add	a5,s1,s6
    8000941c:	00e4b023          	sd	a4,0(s1)
    80009420:	00993023          	sd	s1,0(s2)
    80009424:	fcfa76e3          	bgeu	s4,a5,800093f0 <freerange+0x70>
    80009428:	03813083          	ld	ra,56(sp)
    8000942c:	03013403          	ld	s0,48(sp)
    80009430:	02813483          	ld	s1,40(sp)
    80009434:	02013903          	ld	s2,32(sp)
    80009438:	01813983          	ld	s3,24(sp)
    8000943c:	01013a03          	ld	s4,16(sp)
    80009440:	00813a83          	ld	s5,8(sp)
    80009444:	00013b03          	ld	s6,0(sp)
    80009448:	04010113          	addi	sp,sp,64
    8000944c:	00008067          	ret
    80009450:	00001517          	auipc	a0,0x1
    80009454:	49050513          	addi	a0,a0,1168 # 8000a8e0 <digits+0x18>
    80009458:	fffff097          	auipc	ra,0xfffff
    8000945c:	3d4080e7          	jalr	980(ra) # 8000882c <panic>

0000000080009460 <kfree>:
    80009460:	fe010113          	addi	sp,sp,-32
    80009464:	00813823          	sd	s0,16(sp)
    80009468:	00113c23          	sd	ra,24(sp)
    8000946c:	00913423          	sd	s1,8(sp)
    80009470:	02010413          	addi	s0,sp,32
    80009474:	03451793          	slli	a5,a0,0x34
    80009478:	04079c63          	bnez	a5,800094d0 <kfree+0x70>
    8000947c:	00005797          	auipc	a5,0x5
    80009480:	09478793          	addi	a5,a5,148 # 8000e510 <end>
    80009484:	00050493          	mv	s1,a0
    80009488:	04f56463          	bltu	a0,a5,800094d0 <kfree+0x70>
    8000948c:	01100793          	li	a5,17
    80009490:	01b79793          	slli	a5,a5,0x1b
    80009494:	02f57e63          	bgeu	a0,a5,800094d0 <kfree+0x70>
    80009498:	00001637          	lui	a2,0x1
    8000949c:	00100593          	li	a1,1
    800094a0:	00000097          	auipc	ra,0x0
    800094a4:	478080e7          	jalr	1144(ra) # 80009918 <__memset>
    800094a8:	00004797          	auipc	a5,0x4
    800094ac:	c6878793          	addi	a5,a5,-920 # 8000d110 <kmem>
    800094b0:	0007b703          	ld	a4,0(a5)
    800094b4:	01813083          	ld	ra,24(sp)
    800094b8:	01013403          	ld	s0,16(sp)
    800094bc:	00e4b023          	sd	a4,0(s1)
    800094c0:	0097b023          	sd	s1,0(a5)
    800094c4:	00813483          	ld	s1,8(sp)
    800094c8:	02010113          	addi	sp,sp,32
    800094cc:	00008067          	ret
    800094d0:	00001517          	auipc	a0,0x1
    800094d4:	41050513          	addi	a0,a0,1040 # 8000a8e0 <digits+0x18>
    800094d8:	fffff097          	auipc	ra,0xfffff
    800094dc:	354080e7          	jalr	852(ra) # 8000882c <panic>

00000000800094e0 <kalloc>:
    800094e0:	fe010113          	addi	sp,sp,-32
    800094e4:	00813823          	sd	s0,16(sp)
    800094e8:	00913423          	sd	s1,8(sp)
    800094ec:	00113c23          	sd	ra,24(sp)
    800094f0:	02010413          	addi	s0,sp,32
    800094f4:	00004797          	auipc	a5,0x4
    800094f8:	c1c78793          	addi	a5,a5,-996 # 8000d110 <kmem>
    800094fc:	0007b483          	ld	s1,0(a5)
    80009500:	02048063          	beqz	s1,80009520 <kalloc+0x40>
    80009504:	0004b703          	ld	a4,0(s1)
    80009508:	00001637          	lui	a2,0x1
    8000950c:	00500593          	li	a1,5
    80009510:	00048513          	mv	a0,s1
    80009514:	00e7b023          	sd	a4,0(a5)
    80009518:	00000097          	auipc	ra,0x0
    8000951c:	400080e7          	jalr	1024(ra) # 80009918 <__memset>
    80009520:	01813083          	ld	ra,24(sp)
    80009524:	01013403          	ld	s0,16(sp)
    80009528:	00048513          	mv	a0,s1
    8000952c:	00813483          	ld	s1,8(sp)
    80009530:	02010113          	addi	sp,sp,32
    80009534:	00008067          	ret

0000000080009538 <initlock>:
    80009538:	ff010113          	addi	sp,sp,-16
    8000953c:	00813423          	sd	s0,8(sp)
    80009540:	01010413          	addi	s0,sp,16
    80009544:	00813403          	ld	s0,8(sp)
    80009548:	00b53423          	sd	a1,8(a0)
    8000954c:	00052023          	sw	zero,0(a0)
    80009550:	00053823          	sd	zero,16(a0)
    80009554:	01010113          	addi	sp,sp,16
    80009558:	00008067          	ret

000000008000955c <acquire>:
    8000955c:	fe010113          	addi	sp,sp,-32
    80009560:	00813823          	sd	s0,16(sp)
    80009564:	00913423          	sd	s1,8(sp)
    80009568:	00113c23          	sd	ra,24(sp)
    8000956c:	01213023          	sd	s2,0(sp)
    80009570:	02010413          	addi	s0,sp,32
    80009574:	00050493          	mv	s1,a0
    80009578:	10002973          	csrr	s2,sstatus
    8000957c:	100027f3          	csrr	a5,sstatus
    80009580:	ffd7f793          	andi	a5,a5,-3
    80009584:	10079073          	csrw	sstatus,a5
    80009588:	fffff097          	auipc	ra,0xfffff
    8000958c:	8e8080e7          	jalr	-1816(ra) # 80007e70 <mycpu>
    80009590:	07852783          	lw	a5,120(a0)
    80009594:	06078e63          	beqz	a5,80009610 <acquire+0xb4>
    80009598:	fffff097          	auipc	ra,0xfffff
    8000959c:	8d8080e7          	jalr	-1832(ra) # 80007e70 <mycpu>
    800095a0:	07852783          	lw	a5,120(a0)
    800095a4:	0004a703          	lw	a4,0(s1)
    800095a8:	0017879b          	addiw	a5,a5,1
    800095ac:	06f52c23          	sw	a5,120(a0)
    800095b0:	04071063          	bnez	a4,800095f0 <acquire+0x94>
    800095b4:	00100713          	li	a4,1
    800095b8:	00070793          	mv	a5,a4
    800095bc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800095c0:	0007879b          	sext.w	a5,a5
    800095c4:	fe079ae3          	bnez	a5,800095b8 <acquire+0x5c>
    800095c8:	0ff0000f          	fence
    800095cc:	fffff097          	auipc	ra,0xfffff
    800095d0:	8a4080e7          	jalr	-1884(ra) # 80007e70 <mycpu>
    800095d4:	01813083          	ld	ra,24(sp)
    800095d8:	01013403          	ld	s0,16(sp)
    800095dc:	00a4b823          	sd	a0,16(s1)
    800095e0:	00013903          	ld	s2,0(sp)
    800095e4:	00813483          	ld	s1,8(sp)
    800095e8:	02010113          	addi	sp,sp,32
    800095ec:	00008067          	ret
    800095f0:	0104b903          	ld	s2,16(s1)
    800095f4:	fffff097          	auipc	ra,0xfffff
    800095f8:	87c080e7          	jalr	-1924(ra) # 80007e70 <mycpu>
    800095fc:	faa91ce3          	bne	s2,a0,800095b4 <acquire+0x58>
    80009600:	00001517          	auipc	a0,0x1
    80009604:	2e850513          	addi	a0,a0,744 # 8000a8e8 <digits+0x20>
    80009608:	fffff097          	auipc	ra,0xfffff
    8000960c:	224080e7          	jalr	548(ra) # 8000882c <panic>
    80009610:	00195913          	srli	s2,s2,0x1
    80009614:	fffff097          	auipc	ra,0xfffff
    80009618:	85c080e7          	jalr	-1956(ra) # 80007e70 <mycpu>
    8000961c:	00197913          	andi	s2,s2,1
    80009620:	07252e23          	sw	s2,124(a0)
    80009624:	f75ff06f          	j	80009598 <acquire+0x3c>

0000000080009628 <release>:
    80009628:	fe010113          	addi	sp,sp,-32
    8000962c:	00813823          	sd	s0,16(sp)
    80009630:	00113c23          	sd	ra,24(sp)
    80009634:	00913423          	sd	s1,8(sp)
    80009638:	01213023          	sd	s2,0(sp)
    8000963c:	02010413          	addi	s0,sp,32
    80009640:	00052783          	lw	a5,0(a0)
    80009644:	00079a63          	bnez	a5,80009658 <release+0x30>
    80009648:	00001517          	auipc	a0,0x1
    8000964c:	2a850513          	addi	a0,a0,680 # 8000a8f0 <digits+0x28>
    80009650:	fffff097          	auipc	ra,0xfffff
    80009654:	1dc080e7          	jalr	476(ra) # 8000882c <panic>
    80009658:	01053903          	ld	s2,16(a0)
    8000965c:	00050493          	mv	s1,a0
    80009660:	fffff097          	auipc	ra,0xfffff
    80009664:	810080e7          	jalr	-2032(ra) # 80007e70 <mycpu>
    80009668:	fea910e3          	bne	s2,a0,80009648 <release+0x20>
    8000966c:	0004b823          	sd	zero,16(s1)
    80009670:	0ff0000f          	fence
    80009674:	0f50000f          	fence	iorw,ow
    80009678:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000967c:	ffffe097          	auipc	ra,0xffffe
    80009680:	7f4080e7          	jalr	2036(ra) # 80007e70 <mycpu>
    80009684:	100027f3          	csrr	a5,sstatus
    80009688:	0027f793          	andi	a5,a5,2
    8000968c:	04079a63          	bnez	a5,800096e0 <release+0xb8>
    80009690:	07852783          	lw	a5,120(a0)
    80009694:	02f05e63          	blez	a5,800096d0 <release+0xa8>
    80009698:	fff7871b          	addiw	a4,a5,-1
    8000969c:	06e52c23          	sw	a4,120(a0)
    800096a0:	00071c63          	bnez	a4,800096b8 <release+0x90>
    800096a4:	07c52783          	lw	a5,124(a0)
    800096a8:	00078863          	beqz	a5,800096b8 <release+0x90>
    800096ac:	100027f3          	csrr	a5,sstatus
    800096b0:	0027e793          	ori	a5,a5,2
    800096b4:	10079073          	csrw	sstatus,a5
    800096b8:	01813083          	ld	ra,24(sp)
    800096bc:	01013403          	ld	s0,16(sp)
    800096c0:	00813483          	ld	s1,8(sp)
    800096c4:	00013903          	ld	s2,0(sp)
    800096c8:	02010113          	addi	sp,sp,32
    800096cc:	00008067          	ret
    800096d0:	00001517          	auipc	a0,0x1
    800096d4:	24050513          	addi	a0,a0,576 # 8000a910 <digits+0x48>
    800096d8:	fffff097          	auipc	ra,0xfffff
    800096dc:	154080e7          	jalr	340(ra) # 8000882c <panic>
    800096e0:	00001517          	auipc	a0,0x1
    800096e4:	21850513          	addi	a0,a0,536 # 8000a8f8 <digits+0x30>
    800096e8:	fffff097          	auipc	ra,0xfffff
    800096ec:	144080e7          	jalr	324(ra) # 8000882c <panic>

00000000800096f0 <holding>:
    800096f0:	00052783          	lw	a5,0(a0)
    800096f4:	00079663          	bnez	a5,80009700 <holding+0x10>
    800096f8:	00000513          	li	a0,0
    800096fc:	00008067          	ret
    80009700:	fe010113          	addi	sp,sp,-32
    80009704:	00813823          	sd	s0,16(sp)
    80009708:	00913423          	sd	s1,8(sp)
    8000970c:	00113c23          	sd	ra,24(sp)
    80009710:	02010413          	addi	s0,sp,32
    80009714:	01053483          	ld	s1,16(a0)
    80009718:	ffffe097          	auipc	ra,0xffffe
    8000971c:	758080e7          	jalr	1880(ra) # 80007e70 <mycpu>
    80009720:	01813083          	ld	ra,24(sp)
    80009724:	01013403          	ld	s0,16(sp)
    80009728:	40a48533          	sub	a0,s1,a0
    8000972c:	00153513          	seqz	a0,a0
    80009730:	00813483          	ld	s1,8(sp)
    80009734:	02010113          	addi	sp,sp,32
    80009738:	00008067          	ret

000000008000973c <push_off>:
    8000973c:	fe010113          	addi	sp,sp,-32
    80009740:	00813823          	sd	s0,16(sp)
    80009744:	00113c23          	sd	ra,24(sp)
    80009748:	00913423          	sd	s1,8(sp)
    8000974c:	02010413          	addi	s0,sp,32
    80009750:	100024f3          	csrr	s1,sstatus
    80009754:	100027f3          	csrr	a5,sstatus
    80009758:	ffd7f793          	andi	a5,a5,-3
    8000975c:	10079073          	csrw	sstatus,a5
    80009760:	ffffe097          	auipc	ra,0xffffe
    80009764:	710080e7          	jalr	1808(ra) # 80007e70 <mycpu>
    80009768:	07852783          	lw	a5,120(a0)
    8000976c:	02078663          	beqz	a5,80009798 <push_off+0x5c>
    80009770:	ffffe097          	auipc	ra,0xffffe
    80009774:	700080e7          	jalr	1792(ra) # 80007e70 <mycpu>
    80009778:	07852783          	lw	a5,120(a0)
    8000977c:	01813083          	ld	ra,24(sp)
    80009780:	01013403          	ld	s0,16(sp)
    80009784:	0017879b          	addiw	a5,a5,1
    80009788:	06f52c23          	sw	a5,120(a0)
    8000978c:	00813483          	ld	s1,8(sp)
    80009790:	02010113          	addi	sp,sp,32
    80009794:	00008067          	ret
    80009798:	0014d493          	srli	s1,s1,0x1
    8000979c:	ffffe097          	auipc	ra,0xffffe
    800097a0:	6d4080e7          	jalr	1748(ra) # 80007e70 <mycpu>
    800097a4:	0014f493          	andi	s1,s1,1
    800097a8:	06952e23          	sw	s1,124(a0)
    800097ac:	fc5ff06f          	j	80009770 <push_off+0x34>

00000000800097b0 <pop_off>:
    800097b0:	ff010113          	addi	sp,sp,-16
    800097b4:	00813023          	sd	s0,0(sp)
    800097b8:	00113423          	sd	ra,8(sp)
    800097bc:	01010413          	addi	s0,sp,16
    800097c0:	ffffe097          	auipc	ra,0xffffe
    800097c4:	6b0080e7          	jalr	1712(ra) # 80007e70 <mycpu>
    800097c8:	100027f3          	csrr	a5,sstatus
    800097cc:	0027f793          	andi	a5,a5,2
    800097d0:	04079663          	bnez	a5,8000981c <pop_off+0x6c>
    800097d4:	07852783          	lw	a5,120(a0)
    800097d8:	02f05a63          	blez	a5,8000980c <pop_off+0x5c>
    800097dc:	fff7871b          	addiw	a4,a5,-1
    800097e0:	06e52c23          	sw	a4,120(a0)
    800097e4:	00071c63          	bnez	a4,800097fc <pop_off+0x4c>
    800097e8:	07c52783          	lw	a5,124(a0)
    800097ec:	00078863          	beqz	a5,800097fc <pop_off+0x4c>
    800097f0:	100027f3          	csrr	a5,sstatus
    800097f4:	0027e793          	ori	a5,a5,2
    800097f8:	10079073          	csrw	sstatus,a5
    800097fc:	00813083          	ld	ra,8(sp)
    80009800:	00013403          	ld	s0,0(sp)
    80009804:	01010113          	addi	sp,sp,16
    80009808:	00008067          	ret
    8000980c:	00001517          	auipc	a0,0x1
    80009810:	10450513          	addi	a0,a0,260 # 8000a910 <digits+0x48>
    80009814:	fffff097          	auipc	ra,0xfffff
    80009818:	018080e7          	jalr	24(ra) # 8000882c <panic>
    8000981c:	00001517          	auipc	a0,0x1
    80009820:	0dc50513          	addi	a0,a0,220 # 8000a8f8 <digits+0x30>
    80009824:	fffff097          	auipc	ra,0xfffff
    80009828:	008080e7          	jalr	8(ra) # 8000882c <panic>

000000008000982c <push_on>:
    8000982c:	fe010113          	addi	sp,sp,-32
    80009830:	00813823          	sd	s0,16(sp)
    80009834:	00113c23          	sd	ra,24(sp)
    80009838:	00913423          	sd	s1,8(sp)
    8000983c:	02010413          	addi	s0,sp,32
    80009840:	100024f3          	csrr	s1,sstatus
    80009844:	100027f3          	csrr	a5,sstatus
    80009848:	0027e793          	ori	a5,a5,2
    8000984c:	10079073          	csrw	sstatus,a5
    80009850:	ffffe097          	auipc	ra,0xffffe
    80009854:	620080e7          	jalr	1568(ra) # 80007e70 <mycpu>
    80009858:	07852783          	lw	a5,120(a0)
    8000985c:	02078663          	beqz	a5,80009888 <push_on+0x5c>
    80009860:	ffffe097          	auipc	ra,0xffffe
    80009864:	610080e7          	jalr	1552(ra) # 80007e70 <mycpu>
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
    80009890:	5e4080e7          	jalr	1508(ra) # 80007e70 <mycpu>
    80009894:	0014f493          	andi	s1,s1,1
    80009898:	06952e23          	sw	s1,124(a0)
    8000989c:	fc5ff06f          	j	80009860 <push_on+0x34>

00000000800098a0 <pop_on>:
    800098a0:	ff010113          	addi	sp,sp,-16
    800098a4:	00813023          	sd	s0,0(sp)
    800098a8:	00113423          	sd	ra,8(sp)
    800098ac:	01010413          	addi	s0,sp,16
    800098b0:	ffffe097          	auipc	ra,0xffffe
    800098b4:	5c0080e7          	jalr	1472(ra) # 80007e70 <mycpu>
    800098b8:	100027f3          	csrr	a5,sstatus
    800098bc:	0027f793          	andi	a5,a5,2
    800098c0:	04078463          	beqz	a5,80009908 <pop_on+0x68>
    800098c4:	07852783          	lw	a5,120(a0)
    800098c8:	02f05863          	blez	a5,800098f8 <pop_on+0x58>
    800098cc:	fff7879b          	addiw	a5,a5,-1
    800098d0:	06f52c23          	sw	a5,120(a0)
    800098d4:	07853783          	ld	a5,120(a0)
    800098d8:	00079863          	bnez	a5,800098e8 <pop_on+0x48>
    800098dc:	100027f3          	csrr	a5,sstatus
    800098e0:	ffd7f793          	andi	a5,a5,-3
    800098e4:	10079073          	csrw	sstatus,a5
    800098e8:	00813083          	ld	ra,8(sp)
    800098ec:	00013403          	ld	s0,0(sp)
    800098f0:	01010113          	addi	sp,sp,16
    800098f4:	00008067          	ret
    800098f8:	00001517          	auipc	a0,0x1
    800098fc:	04050513          	addi	a0,a0,64 # 8000a938 <digits+0x70>
    80009900:	fffff097          	auipc	ra,0xfffff
    80009904:	f2c080e7          	jalr	-212(ra) # 8000882c <panic>
    80009908:	00001517          	auipc	a0,0x1
    8000990c:	01050513          	addi	a0,a0,16 # 8000a918 <digits+0x50>
    80009910:	fffff097          	auipc	ra,0xfffff
    80009914:	f1c080e7          	jalr	-228(ra) # 8000882c <panic>

0000000080009918 <__memset>:
    80009918:	ff010113          	addi	sp,sp,-16
    8000991c:	00813423          	sd	s0,8(sp)
    80009920:	01010413          	addi	s0,sp,16
    80009924:	1a060e63          	beqz	a2,80009ae0 <__memset+0x1c8>
    80009928:	40a007b3          	neg	a5,a0
    8000992c:	0077f793          	andi	a5,a5,7
    80009930:	00778693          	addi	a3,a5,7
    80009934:	00b00813          	li	a6,11
    80009938:	0ff5f593          	andi	a1,a1,255
    8000993c:	fff6071b          	addiw	a4,a2,-1
    80009940:	1b06e663          	bltu	a3,a6,80009aec <__memset+0x1d4>
    80009944:	1cd76463          	bltu	a4,a3,80009b0c <__memset+0x1f4>
    80009948:	1a078e63          	beqz	a5,80009b04 <__memset+0x1ec>
    8000994c:	00b50023          	sb	a1,0(a0)
    80009950:	00100713          	li	a4,1
    80009954:	1ae78463          	beq	a5,a4,80009afc <__memset+0x1e4>
    80009958:	00b500a3          	sb	a1,1(a0)
    8000995c:	00200713          	li	a4,2
    80009960:	1ae78a63          	beq	a5,a4,80009b14 <__memset+0x1fc>
    80009964:	00b50123          	sb	a1,2(a0)
    80009968:	00300713          	li	a4,3
    8000996c:	18e78463          	beq	a5,a4,80009af4 <__memset+0x1dc>
    80009970:	00b501a3          	sb	a1,3(a0)
    80009974:	00400713          	li	a4,4
    80009978:	1ae78263          	beq	a5,a4,80009b1c <__memset+0x204>
    8000997c:	00b50223          	sb	a1,4(a0)
    80009980:	00500713          	li	a4,5
    80009984:	1ae78063          	beq	a5,a4,80009b24 <__memset+0x20c>
    80009988:	00b502a3          	sb	a1,5(a0)
    8000998c:	00700713          	li	a4,7
    80009990:	18e79e63          	bne	a5,a4,80009b2c <__memset+0x214>
    80009994:	00b50323          	sb	a1,6(a0)
    80009998:	00700e93          	li	t4,7
    8000999c:	00859713          	slli	a4,a1,0x8
    800099a0:	00e5e733          	or	a4,a1,a4
    800099a4:	01059e13          	slli	t3,a1,0x10
    800099a8:	01c76e33          	or	t3,a4,t3
    800099ac:	01859313          	slli	t1,a1,0x18
    800099b0:	006e6333          	or	t1,t3,t1
    800099b4:	02059893          	slli	a7,a1,0x20
    800099b8:	40f60e3b          	subw	t3,a2,a5
    800099bc:	011368b3          	or	a7,t1,a7
    800099c0:	02859813          	slli	a6,a1,0x28
    800099c4:	0108e833          	or	a6,a7,a6
    800099c8:	03059693          	slli	a3,a1,0x30
    800099cc:	003e589b          	srliw	a7,t3,0x3
    800099d0:	00d866b3          	or	a3,a6,a3
    800099d4:	03859713          	slli	a4,a1,0x38
    800099d8:	00389813          	slli	a6,a7,0x3
    800099dc:	00f507b3          	add	a5,a0,a5
    800099e0:	00e6e733          	or	a4,a3,a4
    800099e4:	000e089b          	sext.w	a7,t3
    800099e8:	00f806b3          	add	a3,a6,a5
    800099ec:	00e7b023          	sd	a4,0(a5)
    800099f0:	00878793          	addi	a5,a5,8
    800099f4:	fed79ce3          	bne	a5,a3,800099ec <__memset+0xd4>
    800099f8:	ff8e7793          	andi	a5,t3,-8
    800099fc:	0007871b          	sext.w	a4,a5
    80009a00:	01d787bb          	addw	a5,a5,t4
    80009a04:	0ce88e63          	beq	a7,a4,80009ae0 <__memset+0x1c8>
    80009a08:	00f50733          	add	a4,a0,a5
    80009a0c:	00b70023          	sb	a1,0(a4)
    80009a10:	0017871b          	addiw	a4,a5,1
    80009a14:	0cc77663          	bgeu	a4,a2,80009ae0 <__memset+0x1c8>
    80009a18:	00e50733          	add	a4,a0,a4
    80009a1c:	00b70023          	sb	a1,0(a4)
    80009a20:	0027871b          	addiw	a4,a5,2
    80009a24:	0ac77e63          	bgeu	a4,a2,80009ae0 <__memset+0x1c8>
    80009a28:	00e50733          	add	a4,a0,a4
    80009a2c:	00b70023          	sb	a1,0(a4)
    80009a30:	0037871b          	addiw	a4,a5,3
    80009a34:	0ac77663          	bgeu	a4,a2,80009ae0 <__memset+0x1c8>
    80009a38:	00e50733          	add	a4,a0,a4
    80009a3c:	00b70023          	sb	a1,0(a4)
    80009a40:	0047871b          	addiw	a4,a5,4
    80009a44:	08c77e63          	bgeu	a4,a2,80009ae0 <__memset+0x1c8>
    80009a48:	00e50733          	add	a4,a0,a4
    80009a4c:	00b70023          	sb	a1,0(a4)
    80009a50:	0057871b          	addiw	a4,a5,5
    80009a54:	08c77663          	bgeu	a4,a2,80009ae0 <__memset+0x1c8>
    80009a58:	00e50733          	add	a4,a0,a4
    80009a5c:	00b70023          	sb	a1,0(a4)
    80009a60:	0067871b          	addiw	a4,a5,6
    80009a64:	06c77e63          	bgeu	a4,a2,80009ae0 <__memset+0x1c8>
    80009a68:	00e50733          	add	a4,a0,a4
    80009a6c:	00b70023          	sb	a1,0(a4)
    80009a70:	0077871b          	addiw	a4,a5,7
    80009a74:	06c77663          	bgeu	a4,a2,80009ae0 <__memset+0x1c8>
    80009a78:	00e50733          	add	a4,a0,a4
    80009a7c:	00b70023          	sb	a1,0(a4)
    80009a80:	0087871b          	addiw	a4,a5,8
    80009a84:	04c77e63          	bgeu	a4,a2,80009ae0 <__memset+0x1c8>
    80009a88:	00e50733          	add	a4,a0,a4
    80009a8c:	00b70023          	sb	a1,0(a4)
    80009a90:	0097871b          	addiw	a4,a5,9
    80009a94:	04c77663          	bgeu	a4,a2,80009ae0 <__memset+0x1c8>
    80009a98:	00e50733          	add	a4,a0,a4
    80009a9c:	00b70023          	sb	a1,0(a4)
    80009aa0:	00a7871b          	addiw	a4,a5,10
    80009aa4:	02c77e63          	bgeu	a4,a2,80009ae0 <__memset+0x1c8>
    80009aa8:	00e50733          	add	a4,a0,a4
    80009aac:	00b70023          	sb	a1,0(a4)
    80009ab0:	00b7871b          	addiw	a4,a5,11
    80009ab4:	02c77663          	bgeu	a4,a2,80009ae0 <__memset+0x1c8>
    80009ab8:	00e50733          	add	a4,a0,a4
    80009abc:	00b70023          	sb	a1,0(a4)
    80009ac0:	00c7871b          	addiw	a4,a5,12
    80009ac4:	00c77e63          	bgeu	a4,a2,80009ae0 <__memset+0x1c8>
    80009ac8:	00e50733          	add	a4,a0,a4
    80009acc:	00b70023          	sb	a1,0(a4)
    80009ad0:	00d7879b          	addiw	a5,a5,13
    80009ad4:	00c7f663          	bgeu	a5,a2,80009ae0 <__memset+0x1c8>
    80009ad8:	00f507b3          	add	a5,a0,a5
    80009adc:	00b78023          	sb	a1,0(a5)
    80009ae0:	00813403          	ld	s0,8(sp)
    80009ae4:	01010113          	addi	sp,sp,16
    80009ae8:	00008067          	ret
    80009aec:	00b00693          	li	a3,11
    80009af0:	e55ff06f          	j	80009944 <__memset+0x2c>
    80009af4:	00300e93          	li	t4,3
    80009af8:	ea5ff06f          	j	8000999c <__memset+0x84>
    80009afc:	00100e93          	li	t4,1
    80009b00:	e9dff06f          	j	8000999c <__memset+0x84>
    80009b04:	00000e93          	li	t4,0
    80009b08:	e95ff06f          	j	8000999c <__memset+0x84>
    80009b0c:	00000793          	li	a5,0
    80009b10:	ef9ff06f          	j	80009a08 <__memset+0xf0>
    80009b14:	00200e93          	li	t4,2
    80009b18:	e85ff06f          	j	8000999c <__memset+0x84>
    80009b1c:	00400e93          	li	t4,4
    80009b20:	e7dff06f          	j	8000999c <__memset+0x84>
    80009b24:	00500e93          	li	t4,5
    80009b28:	e75ff06f          	j	8000999c <__memset+0x84>
    80009b2c:	00600e93          	li	t4,6
    80009b30:	e6dff06f          	j	8000999c <__memset+0x84>

0000000080009b34 <__memmove>:
    80009b34:	ff010113          	addi	sp,sp,-16
    80009b38:	00813423          	sd	s0,8(sp)
    80009b3c:	01010413          	addi	s0,sp,16
    80009b40:	0e060863          	beqz	a2,80009c30 <__memmove+0xfc>
    80009b44:	fff6069b          	addiw	a3,a2,-1
    80009b48:	0006881b          	sext.w	a6,a3
    80009b4c:	0ea5e863          	bltu	a1,a0,80009c3c <__memmove+0x108>
    80009b50:	00758713          	addi	a4,a1,7
    80009b54:	00a5e7b3          	or	a5,a1,a0
    80009b58:	40a70733          	sub	a4,a4,a0
    80009b5c:	0077f793          	andi	a5,a5,7
    80009b60:	00f73713          	sltiu	a4,a4,15
    80009b64:	00174713          	xori	a4,a4,1
    80009b68:	0017b793          	seqz	a5,a5
    80009b6c:	00e7f7b3          	and	a5,a5,a4
    80009b70:	10078863          	beqz	a5,80009c80 <__memmove+0x14c>
    80009b74:	00900793          	li	a5,9
    80009b78:	1107f463          	bgeu	a5,a6,80009c80 <__memmove+0x14c>
    80009b7c:	0036581b          	srliw	a6,a2,0x3
    80009b80:	fff8081b          	addiw	a6,a6,-1
    80009b84:	02081813          	slli	a6,a6,0x20
    80009b88:	01d85893          	srli	a7,a6,0x1d
    80009b8c:	00858813          	addi	a6,a1,8
    80009b90:	00058793          	mv	a5,a1
    80009b94:	00050713          	mv	a4,a0
    80009b98:	01088833          	add	a6,a7,a6
    80009b9c:	0007b883          	ld	a7,0(a5)
    80009ba0:	00878793          	addi	a5,a5,8
    80009ba4:	00870713          	addi	a4,a4,8
    80009ba8:	ff173c23          	sd	a7,-8(a4)
    80009bac:	ff0798e3          	bne	a5,a6,80009b9c <__memmove+0x68>
    80009bb0:	ff867713          	andi	a4,a2,-8
    80009bb4:	02071793          	slli	a5,a4,0x20
    80009bb8:	0207d793          	srli	a5,a5,0x20
    80009bbc:	00f585b3          	add	a1,a1,a5
    80009bc0:	40e686bb          	subw	a3,a3,a4
    80009bc4:	00f507b3          	add	a5,a0,a5
    80009bc8:	06e60463          	beq	a2,a4,80009c30 <__memmove+0xfc>
    80009bcc:	0005c703          	lbu	a4,0(a1)
    80009bd0:	00e78023          	sb	a4,0(a5)
    80009bd4:	04068e63          	beqz	a3,80009c30 <__memmove+0xfc>
    80009bd8:	0015c603          	lbu	a2,1(a1)
    80009bdc:	00100713          	li	a4,1
    80009be0:	00c780a3          	sb	a2,1(a5)
    80009be4:	04e68663          	beq	a3,a4,80009c30 <__memmove+0xfc>
    80009be8:	0025c603          	lbu	a2,2(a1)
    80009bec:	00200713          	li	a4,2
    80009bf0:	00c78123          	sb	a2,2(a5)
    80009bf4:	02e68e63          	beq	a3,a4,80009c30 <__memmove+0xfc>
    80009bf8:	0035c603          	lbu	a2,3(a1)
    80009bfc:	00300713          	li	a4,3
    80009c00:	00c781a3          	sb	a2,3(a5)
    80009c04:	02e68663          	beq	a3,a4,80009c30 <__memmove+0xfc>
    80009c08:	0045c603          	lbu	a2,4(a1)
    80009c0c:	00400713          	li	a4,4
    80009c10:	00c78223          	sb	a2,4(a5)
    80009c14:	00e68e63          	beq	a3,a4,80009c30 <__memmove+0xfc>
    80009c18:	0055c603          	lbu	a2,5(a1)
    80009c1c:	00500713          	li	a4,5
    80009c20:	00c782a3          	sb	a2,5(a5)
    80009c24:	00e68663          	beq	a3,a4,80009c30 <__memmove+0xfc>
    80009c28:	0065c703          	lbu	a4,6(a1)
    80009c2c:	00e78323          	sb	a4,6(a5)
    80009c30:	00813403          	ld	s0,8(sp)
    80009c34:	01010113          	addi	sp,sp,16
    80009c38:	00008067          	ret
    80009c3c:	02061713          	slli	a4,a2,0x20
    80009c40:	02075713          	srli	a4,a4,0x20
    80009c44:	00e587b3          	add	a5,a1,a4
    80009c48:	f0f574e3          	bgeu	a0,a5,80009b50 <__memmove+0x1c>
    80009c4c:	02069613          	slli	a2,a3,0x20
    80009c50:	02065613          	srli	a2,a2,0x20
    80009c54:	fff64613          	not	a2,a2
    80009c58:	00e50733          	add	a4,a0,a4
    80009c5c:	00c78633          	add	a2,a5,a2
    80009c60:	fff7c683          	lbu	a3,-1(a5)
    80009c64:	fff78793          	addi	a5,a5,-1
    80009c68:	fff70713          	addi	a4,a4,-1
    80009c6c:	00d70023          	sb	a3,0(a4)
    80009c70:	fec798e3          	bne	a5,a2,80009c60 <__memmove+0x12c>
    80009c74:	00813403          	ld	s0,8(sp)
    80009c78:	01010113          	addi	sp,sp,16
    80009c7c:	00008067          	ret
    80009c80:	02069713          	slli	a4,a3,0x20
    80009c84:	02075713          	srli	a4,a4,0x20
    80009c88:	00170713          	addi	a4,a4,1
    80009c8c:	00e50733          	add	a4,a0,a4
    80009c90:	00050793          	mv	a5,a0
    80009c94:	0005c683          	lbu	a3,0(a1)
    80009c98:	00178793          	addi	a5,a5,1
    80009c9c:	00158593          	addi	a1,a1,1
    80009ca0:	fed78fa3          	sb	a3,-1(a5)
    80009ca4:	fee798e3          	bne	a5,a4,80009c94 <__memmove+0x160>
    80009ca8:	f89ff06f          	j	80009c30 <__memmove+0xfc>
	...
