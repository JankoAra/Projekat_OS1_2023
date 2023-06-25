
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	b9013103          	ld	sp,-1136(sp) # 8000cb90 <_GLOBAL_OFFSET_TABLE_+0x48>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	1ac070ef          	jal	ra,800071c8 <start>

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
    80001084:	671000ef          	jal	ra,80001ef4 <interruptRoutine>

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

void ThreadQueue::putLast(TCB *tcb) {
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
    80001264:	0a8080e7          	jalr	168(ra) # 80001308 <_Z9mem_allocm>
        Node(TCB* d) : data(d), next(nullptr) {}
    80001268:	01253023          	sd	s2,0(a0)
    8000126c:	00053423          	sd	zero,8(a0)
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    80001270:	0004b783          	ld	a5,0(s1)
    Node *newNode = new Node(tcb);
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

TCB *ThreadQueue::getFirst() {
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
    Node *node = front;
    TCB *tcb = node->data;
    800012c8:	00053483          	ld	s1,0(a0)
    front = front->next;
    800012cc:	00853703          	ld	a4,8(a0)
    800012d0:	00e7b023          	sd	a4,0(a5)
    if (front == nullptr) {
    800012d4:	02070263          	beqz	a4,800012f8 <_ZN11ThreadQueue8getFirstEv+0x50>
            mem_free(ptr);
    800012d8:	00000097          	auipc	ra,0x0
    800012dc:	070080e7          	jalr	112(ra) # 80001348 <_Z8mem_freePv>
        back = nullptr;
    }
    delete node;
    return tcb;
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

0000000080001308 <_Z9mem_allocm>:
//poziv ecall, prelazak u sistemski rezim i odlazak u prekidnu rutinu
inline void scall() {
    __asm__ volatile("ecall");
}

void* mem_alloc(size_t size) {
    80001308:	ff010113          	addi	sp,sp,-16
    8000130c:	00813423          	sd	s0,8(sp)
    80001310:	01010413          	addi	s0,sp,16
    //na size se dodaje zaglavlje segmenta
    //size += sizeof(MemoryAllocator::UsedMemSegment);
    size += 2 * sizeof(uint64);
    80001314:	01050513          	addi	a0,a0,16
    //size je u bajtovima, pretvara se u blokove
    size = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001318:	00655313          	srli	t1,a0,0x6
    8000131c:	03f57513          	andi	a0,a0,63
    80001320:	00050463          	beqz	a0,80001328 <_Z9mem_allocm+0x20>
    80001324:	00100513          	li	a0,1
    80001328:	00a30333          	add	t1,t1,a0

    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[size]": :[size] "r"(size):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000132c:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x01");
    80001330:	00100513          	li	a0,1
    __asm__ volatile("ecall");
    80001334:	00000073          	ecall
    scall();

    //vraceni pokazivac pokazuje iza zaglavlja koriscenog segmenta,
    //na prvu adresu u koju korisnik sme nesto upisati
    void* ret;
    __asm__ volatile("mv %[ptr], a0":[ptr] "=r"(ret));
    80001338:	00050513          	mv	a0,a0
    return ret;
}
    8000133c:	00813403          	ld	s0,8(sp)
    80001340:	01010113          	addi	sp,sp,16
    80001344:	00008067          	ret

0000000080001348 <_Z8mem_freePv>:

int mem_free(void* ptr) {
    80001348:	ff010113          	addi	sp,sp,-16
    8000134c:	00813423          	sd	s0,8(sp)
    80001350:	01010413          	addi	s0,sp,16
    80001354:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(ptr):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001358:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x02");
    8000135c:	00200513          	li	a0,2
    __asm__ volatile("ecall");
    80001360:	00000073          	ecall
    //a1 = pokazivac na memoriju koju treba dealocirati, dobijen pomocu mem_alloc

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001364:	00050513          	mv	a0,a0
    return status;
}
    80001368:	0005051b          	sext.w	a0,a0
    8000136c:	00813403          	ld	s0,8(sp)
    80001370:	01010113          	addi	sp,sp,16
    80001374:	00008067          	ret

0000000080001378 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void (* start_routine)(void*), void* arg) {
    80001378:	fd010113          	addi	sp,sp,-48
    8000137c:	02113423          	sd	ra,40(sp)
    80001380:	02813023          	sd	s0,32(sp)
    80001384:	00913c23          	sd	s1,24(sp)
    80001388:	01213823          	sd	s2,16(sp)
    8000138c:	01313423          	sd	s3,8(sp)
    80001390:	03010413          	addi	s0,sp,48
    80001394:	00050913          	mv	s2,a0
    80001398:	00058493          	mv	s1,a1
    8000139c:	00060993          	mv	s3,a2
    //stvaranje steka ako se ne radi o main kernel niti, posto ona automatski ima stek
    uint64* stack = nullptr;
    if (start_routine != (TCB::Body)main) {
    800013a0:	0000c797          	auipc	a5,0xc
    800013a4:	8007b783          	ld	a5,-2048(a5) # 8000cba0 <_GLOBAL_OFFSET_TABLE_+0x58>
    800013a8:	04f58a63          	beq	a1,a5,800013fc <_Z13thread_createPP3TCBPFvPvES2_+0x84>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800013ac:	00001537          	lui	a0,0x1
    800013b0:	00000097          	auipc	ra,0x0
    800013b4:	f58080e7          	jalr	-168(ra) # 80001308 <_Z9mem_allocm>
    800013b8:	00050313          	mv	t1,a0
        if(!stack) return -1;
    800013bc:	04050463          	beqz	a0,80001404 <_Z13thread_createPP3TCBPFvPvES2_+0x8c>
    }
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013c0:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013c4:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2, %[function]": :[function] "r"(
            start_routine):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013c8:	00048613          	mv	a2,s1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013cc:	00090593          	mv	a1,s2
    __asm__ volatile("li a0, 0x11");
    800013d0:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    800013d4:	00000073          	ecall
    //a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800013d8:	00050513          	mv	a0,a0
    800013dc:	0005051b          	sext.w	a0,a0
    return status;
}
    800013e0:	02813083          	ld	ra,40(sp)
    800013e4:	02013403          	ld	s0,32(sp)
    800013e8:	01813483          	ld	s1,24(sp)
    800013ec:	01013903          	ld	s2,16(sp)
    800013f0:	00813983          	ld	s3,8(sp)
    800013f4:	03010113          	addi	sp,sp,48
    800013f8:	00008067          	ret
    uint64* stack = nullptr;
    800013fc:	00000313          	li	t1,0
    80001400:	fc1ff06f          	j	800013c0 <_Z13thread_createPP3TCBPFvPvES2_+0x48>
        if(!stack) return -1;
    80001404:	fff00513          	li	a0,-1
    80001408:	fd9ff06f          	j	800013e0 <_Z13thread_createPP3TCBPFvPvES2_+0x68>

000000008000140c <_Z11thread_exitv>:

int thread_exit() {
    8000140c:	ff010113          	addi	sp,sp,-16
    80001410:	00813423          	sd	s0,8(sp)
    80001414:	01010413          	addi	s0,sp,16
    //nema argumenata, samo kod sistemskog poziva
    __asm__ volatile("li a0, 0x12");
    80001418:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    8000141c:	00000073          	ecall

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001420:	00050513          	mv	a0,a0
    return status;
}
    80001424:	0005051b          	sext.w	a0,a0
    80001428:	00813403          	ld	s0,8(sp)
    8000142c:	01010113          	addi	sp,sp,16
    80001430:	00008067          	ret

0000000080001434 <_Z15thread_dispatchv>:

void thread_dispatch() {
    80001434:	ff010113          	addi	sp,sp,-16
    80001438:	00813423          	sd	s0,8(sp)
    8000143c:	01010413          	addi	s0,sp,16
    //nema argumenata, samo kod sistemskog poziva
    __asm__ volatile("li a0, 0x13");
    80001440:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    80001444:	00000073          	ecall

    scall();
    //nema povratne vrednosti
}
    80001448:	00813403          	ld	s0,8(sp)
    8000144c:	01010113          	addi	sp,sp,16
    80001450:	00008067          	ret

0000000080001454 <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle) {
    80001454:	ff010113          	addi	sp,sp,-16
    80001458:	00813423          	sd	s0,8(sp)
    8000145c:	01010413          	addi	s0,sp,16
    80001460:	00050313          	mv	t1,a0
//stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001464:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x14");
    80001468:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    8000146c:	00000073          	ecall
    //a0 = 0x14
    //a1 = rucka niti na koju se ceka

    scall();
}
    80001470:	00813403          	ld	s0,8(sp)
    80001474:	01010113          	addi	sp,sp,16
    80001478:	00008067          	ret

000000008000147c <_Z10time_sleepm>:

int time_sleep(time_t timerPeriods) {
    8000147c:	ff010113          	addi	sp,sp,-16
    80001480:	00813423          	sd	s0,8(sp)
    80001484:	01010413          	addi	s0,sp,16
    80001488:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[time]": :[time] "r"(timerPeriods):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000148c:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x31");
    80001490:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    80001494:	00000073          	ecall
    //a1 = broj perioda tajmera na koji se uspavljuje nit

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001498:	00050513          	mv	a0,a0
    return status;
}
    8000149c:	0005051b          	sext.w	a0,a0
    800014a0:	00813403          	ld	s0,8(sp)
    800014a4:	01010113          	addi	sp,sp,16
    800014a8:	00008067          	ret

00000000800014ac <_Z8sem_openPP4KSemj>:

int sem_open(sem_t* handle, unsigned int init) {
    800014ac:	ff010113          	addi	sp,sp,-16
    800014b0:	00813423          	sd	s0,8(sp)
    800014b4:	01010413          	addi	s0,sp,16
    800014b8:	00050313          	mv	t1,a0
    800014bc:	00058e13          	mv	t3,a1
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a2, %[val]": :[val] "r"(init):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800014c0:	000e0613          	mv	a2,t3
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800014c4:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x21");
    800014c8:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    800014cc:	00000073          	ecall

    scall();

    //status == 0 ako je uspesno kreiran semafor; status == -1 ako nije
    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800014d0:	00050513          	mv	a0,a0
    return status;
}
    800014d4:	0005051b          	sext.w	a0,a0
    800014d8:	00813403          	ld	s0,8(sp)
    800014dc:	01010113          	addi	sp,sp,16
    800014e0:	00008067          	ret

00000000800014e4 <_Z9sem_closeP4KSem>:

int sem_close(sem_t handle) {
    800014e4:	ff010113          	addi	sp,sp,-16
    800014e8:	00813423          	sd	s0,8(sp)
    800014ec:	01010413          	addi	s0,sp,16
    800014f0:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800014f4:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x22");
    800014f8:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    800014fc:	00000073          	ecall
    //a1 = rucka semafora (pokazivac na semafor u kernelu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001500:	00050513          	mv	a0,a0
    return status;
}
    80001504:	0005051b          	sext.w	a0,a0
    80001508:	00813403          	ld	s0,8(sp)
    8000150c:	01010113          	addi	sp,sp,16
    80001510:	00008067          	ret

0000000080001514 <_Z8sem_waitP4KSem>:

int sem_wait(sem_t id) {
    80001514:	ff010113          	addi	sp,sp,-16
    80001518:	00813423          	sd	s0,8(sp)
    8000151c:	01010413          	addi	s0,sp,16
    80001520:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(id):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001524:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x23");
    80001528:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    8000152c:	00000073          	ecall
    //a1 = rucka semafora (pokazivac na semafor u kernelu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001530:	00050513          	mv	a0,a0
    return status;
}
    80001534:	0005051b          	sext.w	a0,a0
    80001538:	00813403          	ld	s0,8(sp)
    8000153c:	01010113          	addi	sp,sp,16
    80001540:	00008067          	ret

0000000080001544 <_Z10sem_signalP4KSem>:

int sem_signal(sem_t id) {
    80001544:	ff010113          	addi	sp,sp,-16
    80001548:	00813423          	sd	s0,8(sp)
    8000154c:	01010413          	addi	s0,sp,16
    80001550:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(id):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001554:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x24");
    80001558:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    8000155c:	00000073          	ecall
    //a1 = rucka semafora (pokazivac na semafor u kernelu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001560:	00050513          	mv	a0,a0
    return status;
}
    80001564:	0005051b          	sext.w	a0,a0
    80001568:	00813403          	ld	s0,8(sp)
    8000156c:	01010113          	addi	sp,sp,16
    80001570:	00008067          	ret

0000000080001574 <_Z4getcv>:

char getc() {
    80001574:	ff010113          	addi	sp,sp,-16
    80001578:	00813423          	sd	s0,8(sp)
    8000157c:	01010413          	addi	s0,sp,16
    //nema argumenata
    __asm__ volatile("li a0, 0x41");
    80001580:	04100513          	li	a0,65
    __asm__ volatile("ecall");
    80001584:	00000073          	ecall

    scall();

    char character;
    __asm__ volatile("mv %[c], a0":[c] "=r"(character));
    80001588:	00050513          	mv	a0,a0
    return character;
}
    8000158c:	0ff57513          	andi	a0,a0,255
    80001590:	00813403          	ld	s0,8(sp)
    80001594:	01010113          	addi	sp,sp,16
    80001598:	00008067          	ret

000000008000159c <_Z4putcc>:

void putc(char c) {
    8000159c:	ff010113          	addi	sp,sp,-16
    800015a0:	00813423          	sd	s0,8(sp)
    800015a4:	01010413          	addi	s0,sp,16
    800015a8:	00050313          	mv	t1,a0
    //stavljanje argumenata
    __asm__ volatile("mv a1, %[c]": :[c] "r"(c):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015ac:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x42");
    800015b0:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    800015b4:	00000073          	ecall

    scall();
    //nema povratne vrednosti
}
    800015b8:	00813403          	ld	s0,8(sp)
    800015bc:	01010113          	addi	sp,sp,16
    800015c0:	00008067          	ret

00000000800015c4 <_Z12thread_allocPP3TCBPFvPvES2_>:

int thread_alloc(thread_t* handle, TCB::Body function, void* arg) {
    800015c4:	fd010113          	addi	sp,sp,-48
    800015c8:	02113423          	sd	ra,40(sp)
    800015cc:	02813023          	sd	s0,32(sp)
    800015d0:	00913c23          	sd	s1,24(sp)
    800015d4:	01213823          	sd	s2,16(sp)
    800015d8:	01313423          	sd	s3,8(sp)
    800015dc:	03010413          	addi	s0,sp,48
    800015e0:	00050913          	mv	s2,a0
    800015e4:	00058493          	mv	s1,a1
    800015e8:	00060993          	mv	s3,a2
    //stvaranje steka ako se ne radi o main kernel niti, posto ona automatski ima stek
    uint64* stack = nullptr;
    if (function != (TCB::Body)main) {
    800015ec:	0000b797          	auipc	a5,0xb
    800015f0:	5b47b783          	ld	a5,1460(a5) # 8000cba0 <_GLOBAL_OFFSET_TABLE_+0x58>
    800015f4:	04f58a63          	beq	a1,a5,80001648 <_Z12thread_allocPP3TCBPFvPvES2_+0x84>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800015f8:	00001537          	lui	a0,0x1
    800015fc:	00000097          	auipc	ra,0x0
    80001600:	d0c080e7          	jalr	-756(ra) # 80001308 <_Z9mem_allocm>
    80001604:	00050313          	mv	t1,a0
        if(!stack) return -1;
    80001608:	04050463          	beqz	a0,80001650 <_Z12thread_allocPP3TCBPFvPvES2_+0x8c>
    }
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000160c:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001610:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2, %[function]": :[function] "r"(
            function):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001614:	00048613          	mv	a2,s1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001618:	00090593          	mv	a1,s2
    __asm__ volatile("li a0, 0x80");
    8000161c:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80001620:	00000073          	ecall
    //a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001624:	00050513          	mv	a0,a0
    80001628:	0005051b          	sext.w	a0,a0
    return status;
}
    8000162c:	02813083          	ld	ra,40(sp)
    80001630:	02013403          	ld	s0,32(sp)
    80001634:	01813483          	ld	s1,24(sp)
    80001638:	01013903          	ld	s2,16(sp)
    8000163c:	00813983          	ld	s3,8(sp)
    80001640:	03010113          	addi	sp,sp,48
    80001644:	00008067          	ret
    uint64* stack = nullptr;
    80001648:	00000313          	li	t1,0
    8000164c:	fc1ff06f          	j	8000160c <_Z12thread_allocPP3TCBPFvPvES2_+0x48>
        if(!stack) return -1;
    80001650:	fff00513          	li	a0,-1
    80001654:	fd9ff06f          	j	8000162c <_Z12thread_allocPP3TCBPFvPvES2_+0x68>

0000000080001658 <_Z12thread_startP3TCB>:

void thread_start(thread_t handle) {
    80001658:	ff010113          	addi	sp,sp,-16
    8000165c:	00813423          	sd	s0,8(sp)
    80001660:	01010413          	addi	s0,sp,16
    80001664:	00050313          	mv	t1,a0
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001668:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    8000166c:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    80001670:	00000073          	ecall

    scall();
}
    80001674:	00813403          	ld	s0,8(sp)
    80001678:	01010113          	addi	sp,sp,16
    8000167c:	00008067          	ret

0000000080001680 <_ZN8KConsole12initKConsoleEv>:
int KConsole::inputBufferSize = 0;
char KConsole::inputBuffer[];
char KConsole::outputBuffer[];

void KConsole::initKConsole() {
	if (initialized) return;
    80001680:	0000b797          	auipc	a5,0xb
    80001684:	5a07c783          	lbu	a5,1440(a5) # 8000cc20 <_ZN8KConsole11initializedE>
    80001688:	00078463          	beqz	a5,80001690 <_ZN8KConsole12initKConsoleEv+0x10>
    8000168c:	00008067          	ret
void KConsole::initKConsole() {
    80001690:	fe010113          	addi	sp,sp,-32
    80001694:	00113c23          	sd	ra,24(sp)
    80001698:	00813823          	sd	s0,16(sp)
    8000169c:	00913423          	sd	s1,8(sp)
    800016a0:	02010413          	addi	s0,sp,32
	dr = (char*)CONSOLE_RX_DATA;
    800016a4:	0000b497          	auipc	s1,0xb
    800016a8:	57c48493          	addi	s1,s1,1404 # 8000cc20 <_ZN8KConsole11initializedE>
    800016ac:	0000b797          	auipc	a5,0xb
    800016b0:	4ac7b783          	ld	a5,1196(a5) # 8000cb58 <_GLOBAL_OFFSET_TABLE_+0x10>
    800016b4:	0007b783          	ld	a5,0(a5)
    800016b8:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    800016bc:	0000b797          	auipc	a5,0xb
    800016c0:	4ac7b783          	ld	a5,1196(a5) # 8000cb68 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016c4:	0007b783          	ld	a5,0(a5)
    800016c8:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    800016cc:	06400593          	li	a1,100
    800016d0:	0000b517          	auipc	a0,0xb
    800016d4:	56850513          	addi	a0,a0,1384 # 8000cc38 <_ZN8KConsole19inputBufferHasSpaceE>
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	dd4080e7          	jalr	-556(ra) # 800014ac <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016e0:	06400593          	li	a1,100
    800016e4:	0000b517          	auipc	a0,0xb
    800016e8:	55c50513          	addi	a0,a0,1372 # 8000cc40 <_ZN8KConsole20outputBufferHasSpaceE>
    800016ec:	00000097          	auipc	ra,0x0
    800016f0:	dc0080e7          	jalr	-576(ra) # 800014ac <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016f4:	00000593          	li	a1,0
    800016f8:	0000b517          	auipc	a0,0xb
    800016fc:	55050513          	addi	a0,a0,1360 # 8000cc48 <_ZN8KConsole12charsToInputE>
    80001700:	00000097          	auipc	ra,0x0
    80001704:	dac080e7          	jalr	-596(ra) # 800014ac <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    80001708:	00000593          	li	a1,0
    8000170c:	0000b517          	auipc	a0,0xb
    80001710:	54450513          	addi	a0,a0,1348 # 8000cc50 <_ZN8KConsole13charsToOutputE>
    80001714:	00000097          	auipc	ra,0x0
    80001718:	d98080e7          	jalr	-616(ra) # 800014ac <_Z8sem_openPP4KSemj>
	initialized = true;
    8000171c:	00100793          	li	a5,1
    80001720:	00f48023          	sb	a5,0(s1)
}
    80001724:	01813083          	ld	ra,24(sp)
    80001728:	01013403          	ld	s0,16(sp)
    8000172c:	00813483          	ld	s1,8(sp)
    80001730:	02010113          	addi	sp,sp,32
    80001734:	00008067          	ret

0000000080001738 <_ZN8KConsole13getFromOutputEv>:

char KConsole::getFromOutput() {
    80001738:	fe010113          	addi	sp,sp,-32
    8000173c:	00113c23          	sd	ra,24(sp)
    80001740:	00813823          	sd	s0,16(sp)
    80001744:	00913423          	sd	s1,8(sp)
    80001748:	02010413          	addi	s0,sp,32
	sem_wait(charsToOutput);
    8000174c:	0000b497          	auipc	s1,0xb
    80001750:	4d448493          	addi	s1,s1,1236 # 8000cc20 <_ZN8KConsole11initializedE>
    80001754:	0304b503          	ld	a0,48(s1)
    80001758:	00000097          	auipc	ra,0x0
    8000175c:	dbc080e7          	jalr	-580(ra) # 80001514 <_Z8sem_waitP4KSem>
	char c = outputBuffer[outputHead];
    80001760:	0384a783          	lw	a5,56(s1)
    80001764:	00f48733          	add	a4,s1,a5
	outputHead = (outputHead + 1) % capacity;
    80001768:	0017879b          	addiw	a5,a5,1
    8000176c:	06400693          	li	a3,100
    80001770:	02d7e7bb          	remw	a5,a5,a3
    80001774:	02f4ac23          	sw	a5,56(s1)
	return c;
}
    80001778:	04074503          	lbu	a0,64(a4)
    8000177c:	01813083          	ld	ra,24(sp)
    80001780:	01013403          	ld	s0,16(sp)
    80001784:	00813483          	ld	s1,8(sp)
    80001788:	02010113          	addi	sp,sp,32
    8000178c:	00008067          	ret

0000000080001790 <_ZN8KConsole12placeInInputEc>:

void KConsole::placeInInput(char c) {
	if (inputBufferSize == capacity) return;
    80001790:	0000b717          	auipc	a4,0xb
    80001794:	53472703          	lw	a4,1332(a4) # 8000ccc4 <_ZN8KConsole15inputBufferSizeE>
    80001798:	06400793          	li	a5,100
    8000179c:	04f70e63          	beq	a4,a5,800017f8 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    800017a0:	ff010113          	addi	sp,sp,-16
    800017a4:	00113423          	sd	ra,8(sp)
    800017a8:	00813023          	sd	s0,0(sp)
    800017ac:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    800017b0:	0000b697          	auipc	a3,0xb
    800017b4:	47068693          	addi	a3,a3,1136 # 8000cc20 <_ZN8KConsole11initializedE>
    800017b8:	0a86a783          	lw	a5,168(a3)
    800017bc:	00f68633          	add	a2,a3,a5
    800017c0:	0aa60823          	sb	a0,176(a2)
	inputTail = (inputTail + 1) % capacity;
    800017c4:	0017879b          	addiw	a5,a5,1
    800017c8:	06400613          	li	a2,100
    800017cc:	02c7e7bb          	remw	a5,a5,a2
    800017d0:	0af6a423          	sw	a5,168(a3)
	inputBufferSize++;
    800017d4:	0017071b          	addiw	a4,a4,1
    800017d8:	0ae6a223          	sw	a4,164(a3)
	sem_signal(charsToInput);
    800017dc:	0286b503          	ld	a0,40(a3)
    800017e0:	00000097          	auipc	ra,0x0
    800017e4:	d64080e7          	jalr	-668(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    800017e8:	00813083          	ld	ra,8(sp)
    800017ec:	00013403          	ld	s0,0(sp)
    800017f0:	01010113          	addi	sp,sp,16
    800017f4:	00008067          	ret
    800017f8:	00008067          	ret

00000000800017fc <_ZN8KConsole5kputcEc>:

void KConsole::kputc(char c) {
    800017fc:	fe010113          	addi	sp,sp,-32
    80001800:	00113c23          	sd	ra,24(sp)
    80001804:	00813823          	sd	s0,16(sp)
    80001808:	00913423          	sd	s1,8(sp)
    8000180c:	01213023          	sd	s2,0(sp)
    80001810:	02010413          	addi	s0,sp,32
    80001814:	00050913          	mv	s2,a0
	sem_wait(outputBufferHasSpace);
    80001818:	0000b497          	auipc	s1,0xb
    8000181c:	40848493          	addi	s1,s1,1032 # 8000cc20 <_ZN8KConsole11initializedE>
    80001820:	0204b503          	ld	a0,32(s1)
    80001824:	00000097          	auipc	ra,0x0
    80001828:	cf0080e7          	jalr	-784(ra) # 80001514 <_Z8sem_waitP4KSem>
	outputBuffer[outputTail] = c;
    8000182c:	1144a783          	lw	a5,276(s1)
    80001830:	00f48733          	add	a4,s1,a5
    80001834:	05270023          	sb	s2,64(a4)
	outputTail = (outputTail + 1) % capacity;
    80001838:	0017879b          	addiw	a5,a5,1
    8000183c:	06400713          	li	a4,100
    80001840:	02e7e7bb          	remw	a5,a5,a4
    80001844:	10f4aa23          	sw	a5,276(s1)
	sem_signal(charsToOutput);
    80001848:	0304b503          	ld	a0,48(s1)
    8000184c:	00000097          	auipc	ra,0x0
    80001850:	cf8080e7          	jalr	-776(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    80001854:	01813083          	ld	ra,24(sp)
    80001858:	01013403          	ld	s0,16(sp)
    8000185c:	00813483          	ld	s1,8(sp)
    80001860:	00013903          	ld	s2,0(sp)
    80001864:	02010113          	addi	sp,sp,32
    80001868:	00008067          	ret

000000008000186c <_ZN8KConsole5kgetcEv>:

char KConsole::kgetc() {
    8000186c:	fe010113          	addi	sp,sp,-32
    80001870:	00113c23          	sd	ra,24(sp)
    80001874:	00813823          	sd	s0,16(sp)
    80001878:	00913423          	sd	s1,8(sp)
    8000187c:	02010413          	addi	s0,sp,32
	sem_wait(charsToInput);
    80001880:	0000b497          	auipc	s1,0xb
    80001884:	3a048493          	addi	s1,s1,928 # 8000cc20 <_ZN8KConsole11initializedE>
    80001888:	0284b503          	ld	a0,40(s1)
    8000188c:	00000097          	auipc	ra,0x0
    80001890:	c88080e7          	jalr	-888(ra) # 80001514 <_Z8sem_waitP4KSem>
	char c = inputBuffer[inputHead];
    80001894:	1184a783          	lw	a5,280(s1)
    80001898:	00f48733          	add	a4,s1,a5
	inputHead = (inputHead + 1) % capacity;
    8000189c:	0017879b          	addiw	a5,a5,1
    800018a0:	06400693          	li	a3,100
    800018a4:	02d7e7bb          	remw	a5,a5,a3
    800018a8:	10f4ac23          	sw	a5,280(s1)
	inputBufferSize--;
    800018ac:	0a44a783          	lw	a5,164(s1)
    800018b0:	fff7879b          	addiw	a5,a5,-1
    800018b4:	0af4a223          	sw	a5,164(s1)
	return c;
}
    800018b8:	0b074503          	lbu	a0,176(a4)
    800018bc:	01813083          	ld	ra,24(sp)
    800018c0:	01013403          	ld	s0,16(sp)
    800018c4:	00813483          	ld	s1,8(sp)
    800018c8:	02010113          	addi	sp,sp,32
    800018cc:	00008067          	ret

00000000800018d0 <_ZN9Scheduler3putEP3TCB>:

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    800018d0:	ff010113          	addi	sp,sp,-16
    800018d4:	00813423          	sd	s0,8(sp)
    800018d8:	01010413          	addi	s0,sp,16
    if (tail == nullptr) {
    800018dc:	0000b797          	auipc	a5,0xb
    800018e0:	4647b783          	ld	a5,1124(a5) # 8000cd40 <_ZN9Scheduler4tailE>
    800018e4:	02078263          	beqz	a5,80001908 <_ZN9Scheduler3putEP3TCB+0x38>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    800018e8:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    800018ec:	0000b797          	auipc	a5,0xb
    800018f0:	44a7ba23          	sd	a0,1108(a5) # 8000cd40 <_ZN9Scheduler4tailE>

    enum ThreadStatus {
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    void setStatus(ThreadStatus stat) { this->status = stat; }
    800018f4:	00100793          	li	a5,1
    800018f8:	04f52c23          	sw	a5,88(a0)
    }
    tcb->setStatus(TCB::ACTIVE);
}
    800018fc:	00813403          	ld	s0,8(sp)
    80001900:	01010113          	addi	sp,sp,16
    80001904:	00008067          	ret
        head = tail = tcb;
    80001908:	0000b797          	auipc	a5,0xb
    8000190c:	43878793          	addi	a5,a5,1080 # 8000cd40 <_ZN9Scheduler4tailE>
    80001910:	00a7b023          	sd	a0,0(a5)
    80001914:	00a7b423          	sd	a0,8(a5)
    80001918:	fddff06f          	j	800018f4 <_ZN9Scheduler3putEP3TCB+0x24>

000000008000191c <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    8000191c:	ff010113          	addi	sp,sp,-16
    80001920:	00813423          	sd	s0,8(sp)
    80001924:	01010413          	addi	s0,sp,16
    TCB* firstThread = head;
    80001928:	0000b717          	auipc	a4,0xb
    8000192c:	41870713          	addi	a4,a4,1048 # 8000cd40 <_ZN9Scheduler4tailE>
    80001930:	00873503          	ld	a0,8(a4)
    head = head->nextInScheduler;
    80001934:	03053783          	ld	a5,48(a0)
    80001938:	00f73423          	sd	a5,8(a4)
    if (head == nullptr) {
    8000193c:	00078a63          	beqz	a5,80001950 <_ZN9Scheduler3getEv+0x34>
        tail = head = nullptr;
    }
    firstThread->nextInScheduler = nullptr;
    80001940:	02053823          	sd	zero,48(a0)
    return firstThread;
}
    80001944:	00813403          	ld	s0,8(sp)
    80001948:	01010113          	addi	sp,sp,16
    8000194c:	00008067          	ret
        tail = head = nullptr;
    80001950:	00073423          	sd	zero,8(a4)
    80001954:	00073023          	sd	zero,0(a4)
    80001958:	fe9ff06f          	j	80001940 <_ZN9Scheduler3getEv+0x24>

000000008000195c <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    8000195c:	ff010113          	addi	sp,sp,-16
    80001960:	00813423          	sd	s0,8(sp)
    80001964:	01010413          	addi	s0,sp,16
    tcb->status = TCB::SLEEPING;
    80001968:	00400793          	li	a5,4
    8000196c:	04f52c23          	sw	a5,88(a0)
    if (sleepingHead == nullptr) {
    80001970:	0000b817          	auipc	a6,0xb
    80001974:	3e083803          	ld	a6,992(a6) # 8000cd50 <_ZN9Scheduler12sleepingHeadE>
    80001978:	02080863          	beqz	a6,800019a8 <_ZN9Scheduler10putToSleepEP3TCBm+0x4c>
        tcb->timeToSleep = sleepTime;
        return;
    }
    TCB* prevSleeping = nullptr;
    time_t accumulated = 0;
    TCB* current = sleepingHead;
    8000197c:	00080793          	mv	a5,a6
    time_t accumulated = 0;
    80001980:	00000693          	li	a3,0
    TCB* prevSleeping = nullptr;
    80001984:	00000613          	li	a2,0
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001988:	02078863          	beqz	a5,800019b8 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
    8000198c:	0387b703          	ld	a4,56(a5)
    80001990:	00d70733          	add	a4,a4,a3
    80001994:	02b77263          	bgeu	a4,a1,800019b8 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
        accumulated += current->timeToSleep;
    80001998:	00070693          	mv	a3,a4
        prevSleeping = current;
    8000199c:	00078613          	mv	a2,a5
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    800019a0:	0407b783          	ld	a5,64(a5)
    800019a4:	fe5ff06f          	j	80001988 <_ZN9Scheduler10putToSleepEP3TCBm+0x2c>
        sleepingHead = tcb;
    800019a8:	0000b797          	auipc	a5,0xb
    800019ac:	3aa7b423          	sd	a0,936(a5) # 8000cd50 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    800019b0:	02b53c23          	sd	a1,56(a0)
        return;
    800019b4:	02c0006f          	j	800019e0 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    }
    if (!prevSleeping) {
    800019b8:	02060a63          	beqz	a2,800019ec <_ZN9Scheduler10putToSleepEP3TCBm+0x90>
        sleepingHead = tcb;
        tcb->timeToSleep = sleepTime;
        tcb->nextSleeping->timeToSleep -= sleepTime;
        return;
    }
    tcb->nextSleeping = current;
    800019bc:	04f53023          	sd	a5,64(a0)
    prevSleeping->nextSleeping = tcb;
    800019c0:	04a63023          	sd	a0,64(a2)
    tcb->timeToSleep = sleepTime - accumulated;
    800019c4:	40d58733          	sub	a4,a1,a3
    800019c8:	02e53c23          	sd	a4,56(a0)
    if (current) current->timeToSleep -= sleepTime - accumulated;
    800019cc:	00078a63          	beqz	a5,800019e0 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    800019d0:	40b686b3          	sub	a3,a3,a1
    800019d4:	0387b703          	ld	a4,56(a5)
    800019d8:	00d706b3          	add	a3,a4,a3
    800019dc:	02d7bc23          	sd	a3,56(a5)
}
    800019e0:	00813403          	ld	s0,8(sp)
    800019e4:	01010113          	addi	sp,sp,16
    800019e8:	00008067          	ret
        tcb->nextSleeping = sleepingHead;
    800019ec:	05053023          	sd	a6,64(a0)
        sleepingHead = tcb;
    800019f0:	0000b797          	auipc	a5,0xb
    800019f4:	36a7b023          	sd	a0,864(a5) # 8000cd50 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    800019f8:	02b53c23          	sd	a1,56(a0)
        tcb->nextSleeping->timeToSleep -= sleepTime;
    800019fc:	03883683          	ld	a3,56(a6)
    80001a00:	40b686b3          	sub	a3,a3,a1
    80001a04:	02d83c23          	sd	a3,56(a6)
        return;
    80001a08:	fd9ff06f          	j	800019e0 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>

0000000080001a0c <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
    if (!sleepingHead) return;
    80001a0c:	0000b797          	auipc	a5,0xb
    80001a10:	3447b783          	ld	a5,836(a5) # 8000cd50 <_ZN9Scheduler12sleepingHeadE>
    80001a14:	06078a63          	beqz	a5,80001a88 <_ZN9Scheduler4wakeEv+0x7c>
    sleepingHead->timeToSleep--;
    80001a18:	0387b703          	ld	a4,56(a5)
    80001a1c:	fff70713          	addi	a4,a4,-1
    80001a20:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001a24:	0000b517          	auipc	a0,0xb
    80001a28:	32c53503          	ld	a0,812(a0) # 8000cd50 <_ZN9Scheduler12sleepingHeadE>
    80001a2c:	04050e63          	beqz	a0,80001a88 <_ZN9Scheduler4wakeEv+0x7c>
    80001a30:	03853783          	ld	a5,56(a0)
    80001a34:	04079a63          	bnez	a5,80001a88 <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    80001a38:	ff010113          	addi	sp,sp,-16
    80001a3c:	00113423          	sd	ra,8(sp)
    80001a40:	00813023          	sd	s0,0(sp)
    80001a44:	01010413          	addi	s0,sp,16
    80001a48:	00c0006f          	j	80001a54 <_ZN9Scheduler4wakeEv+0x48>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001a4c:	03853783          	ld	a5,56(a0)
    80001a50:	02079463          	bnez	a5,80001a78 <_ZN9Scheduler4wakeEv+0x6c>
        TCB* thread = sleepingHead;
        sleepingHead = sleepingHead->nextSleeping;
    80001a54:	04053783          	ld	a5,64(a0)
    80001a58:	0000b717          	auipc	a4,0xb
    80001a5c:	2ef73c23          	sd	a5,760(a4) # 8000cd50 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    80001a60:	04053023          	sd	zero,64(a0)
        Scheduler::put(thread);
    80001a64:	00000097          	auipc	ra,0x0
    80001a68:	e6c080e7          	jalr	-404(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001a6c:	0000b517          	auipc	a0,0xb
    80001a70:	2e453503          	ld	a0,740(a0) # 8000cd50 <_ZN9Scheduler12sleepingHeadE>
    80001a74:	fc051ce3          	bnez	a0,80001a4c <_ZN9Scheduler4wakeEv+0x40>
    }
}
    80001a78:	00813083          	ld	ra,8(sp)
    80001a7c:	00013403          	ld	s0,0(sp)
    80001a80:	01010113          	addi	sp,sp,16
    80001a84:	00008067          	ret
    80001a88:	00008067          	ret

0000000080001a8c <_ZN7KMemory7kmallocEm>:
    kmalloc(blocksForBitVector);

    initialized = true;
}

void* KMemory::kmalloc(size_t size) {
    80001a8c:	ff010113          	addi	sp,sp,-16
    80001a90:	00813423          	sd	s0,8(sp)
    80001a94:	01010413          	addi	s0,sp,16
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80001a98:	16050063          	beqz	a0,80001bf8 <_ZN7KMemory7kmallocEm+0x16c>
    80001a9c:	0000b797          	auipc	a5,0xb
    80001aa0:	2bc7b783          	ld	a5,700(a5) # 8000cd58 <_ZN7KMemory14freeBlocksLeftE>
    80001aa4:	14a7ee63          	bltu	a5,a0,80001c00 <_ZN7KMemory7kmallocEm+0x174>
    uint64 currentElem = 0;
    uint64 currentBit = 63;
    uint64 firstZeroElem = 0;
    uint64 firstZeroBit = 63;
    uint64 zerosFound = 0;
    bool zeroFound = false;
    80001aa8:	00000313          	li	t1,0
    uint64 zerosFound = 0;
    80001aac:	00000713          	li	a4,0
    uint64 firstZeroBit = 63;
    80001ab0:	03f00813          	li	a6,63
    uint64 firstZeroElem = 0;
    80001ab4:	00000893          	li	a7,0
    uint64 currentBit = 63;
    80001ab8:	03f00793          	li	a5,63
    uint64 currentElem = 0;
    80001abc:	00000593          	li	a1,0
    80001ac0:	0080006f          	j	80001ac8 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroElem = currentElem;
        } else {
            zerosFound++;
        }
        if (zerosFound == size) break;
        if (currentBit-- == 0) {
    80001ac4:	00068793          	mv	a5,a3
    while (currentElem < sizeOfBitVectorInUint64) {
    80001ac8:	0000b697          	auipc	a3,0xb
    80001acc:	2986b683          	ld	a3,664(a3) # 8000cd60 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001ad0:	08d5fa63          	bgeu	a1,a3,80001b64 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001ad4:	03f00693          	li	a3,63
    80001ad8:	02d78a63          	beq	a5,a3,80001b0c <_ZN7KMemory7kmallocEm+0x80>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    80001adc:	00359693          	slli	a3,a1,0x3
    80001ae0:	0000b617          	auipc	a2,0xb
    80001ae4:	28863603          	ld	a2,648(a2) # 8000cd68 <_ZN7KMemory9bitVectorE>
    80001ae8:	00d606b3          	add	a3,a2,a3
    80001aec:	0006b683          	ld	a3,0(a3)

    static uint64 freeBlocksLeft;

    //maska sa 1 na mestu bitPos i ostalim nulama (bitPos=0..63)
    inline static uint64 maskBit(uint64 bitPos) {
        return (uint64)1 << bitPos;
    80001af0:	00100613          	li	a2,1
    80001af4:	00f61633          	sll	a2,a2,a5
    80001af8:	00c6f6b3          	and	a3,a3,a2
        if (bit > 0) {
    80001afc:	02069a63          	bnez	a3,80001b30 <_ZN7KMemory7kmallocEm+0xa4>
        } else if (!zeroFound) {
    80001b00:	04030863          	beqz	t1,80001b50 <_ZN7KMemory7kmallocEm+0xc4>
            zerosFound++;
    80001b04:	00170713          	addi	a4,a4,1
    80001b08:	0300006f          	j	80001b38 <_ZN7KMemory7kmallocEm+0xac>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001b0c:	00359693          	slli	a3,a1,0x3
    80001b10:	0000b617          	auipc	a2,0xb
    80001b14:	25863603          	ld	a2,600(a2) # 8000cd68 <_ZN7KMemory9bitVectorE>
    80001b18:	00d606b3          	add	a3,a2,a3
    80001b1c:	0006b603          	ld	a2,0(a3)
    80001b20:	fff00693          	li	a3,-1
    80001b24:	fad61ce3          	bne	a2,a3,80001adc <_ZN7KMemory7kmallocEm+0x50>
            currentElem++;
    80001b28:	00158593          	addi	a1,a1,1
            continue;
    80001b2c:	f9dff06f          	j	80001ac8 <_ZN7KMemory7kmallocEm+0x3c>
            zeroFound = false;
    80001b30:	00000313          	li	t1,0
            zerosFound = 0;
    80001b34:	00000713          	li	a4,0
        if (zerosFound == size) break;
    80001b38:	02a70663          	beq	a4,a0,80001b64 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit-- == 0) {
    80001b3c:	fff78693          	addi	a3,a5,-1
    80001b40:	f80792e3          	bnez	a5,80001ac4 <_ZN7KMemory7kmallocEm+0x38>
            currentBit = 63;
            currentElem++;
    80001b44:	00158593          	addi	a1,a1,1
            currentBit = 63;
    80001b48:	03f00793          	li	a5,63
    80001b4c:	f7dff06f          	j	80001ac8 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroBit = currentBit;
    80001b50:	00078813          	mv	a6,a5
            firstZeroElem = currentElem;
    80001b54:	00058893          	mv	a7,a1
            zeroFound = true;
    80001b58:	00100313          	li	t1,1
            zerosFound = 1;
    80001b5c:	00100713          	li	a4,1
    80001b60:	fd9ff06f          	j	80001b38 <_ZN7KMemory7kmallocEm+0xac>
        }
    }
    if (zerosFound != size) return nullptr;
    80001b64:	0aa71263          	bne	a4,a0,80001c08 <_ZN7KMemory7kmallocEm+0x17c>

    //alociranje blokova
    uint64 blockNum = firstZeroElem * 64 + (63 - firstZeroBit);
    80001b68:	00689793          	slli	a5,a7,0x6
    80001b6c:	410787b3          	sub	a5,a5,a6
    80001b70:	03f78793          	addi	a5,a5,63
    void* addr = (char*)HEAP_START_ADDR + blockNum * MEM_BLOCK_SIZE;
    80001b74:	0000b697          	auipc	a3,0xb
    80001b78:	ffc6b683          	ld	a3,-4(a3) # 8000cb70 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001b7c:	0006b583          	ld	a1,0(a3)
    80001b80:	00679793          	slli	a5,a5,0x6
    80001b84:	00f585b3          	add	a1,a1,a5
    *(uint64*)addr = size;  //da znamo koliko blokova je alocirano zaredom
    80001b88:	00a5b023          	sd	a0,0(a1)

    //upisivanje 1 u bit vektor
    currentElem = firstZeroElem;
    currentBit = firstZeroBit;
    80001b8c:	0080006f          	j	80001b94 <_ZN7KMemory7kmallocEm+0x108>
    while (zerosFound > 0) {
        bitVector[currentElem] |= maskBit(currentBit);
        zerosFound--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001b90:	00078813          	mv	a6,a5
    while (zerosFound > 0) {
    80001b94:	04070063          	beqz	a4,80001bd4 <_ZN7KMemory7kmallocEm+0x148>
    80001b98:	00100693          	li	a3,1
    80001b9c:	01069633          	sll	a2,a3,a6
        bitVector[currentElem] |= maskBit(currentBit);
    80001ba0:	00389793          	slli	a5,a7,0x3
    80001ba4:	0000b697          	auipc	a3,0xb
    80001ba8:	1c46b683          	ld	a3,452(a3) # 8000cd68 <_ZN7KMemory9bitVectorE>
    80001bac:	00f687b3          	add	a5,a3,a5
    80001bb0:	0007b683          	ld	a3,0(a5)
    80001bb4:	00c6e6b3          	or	a3,a3,a2
    80001bb8:	00d7b023          	sd	a3,0(a5)
        zerosFound--;
    80001bbc:	fff70713          	addi	a4,a4,-1
        if (currentBit-- == 0) {
    80001bc0:	fff80793          	addi	a5,a6,-1
    80001bc4:	fc0816e3          	bnez	a6,80001b90 <_ZN7KMemory7kmallocEm+0x104>
            currentElem++;
    80001bc8:	00188893          	addi	a7,a7,1
            currentBit = 63;
    80001bcc:	03f00793          	li	a5,63
    80001bd0:	fc1ff06f          	j	80001b90 <_ZN7KMemory7kmallocEm+0x104>
        }
    }
    freeBlocksLeft -= size;
    80001bd4:	0000b717          	auipc	a4,0xb
    80001bd8:	18470713          	addi	a4,a4,388 # 8000cd58 <_ZN7KMemory14freeBlocksLeftE>
    80001bdc:	00073783          	ld	a5,0(a4)
    80001be0:	40a78533          	sub	a0,a5,a0
    80001be4:	00a73023          	sd	a0,0(a4)
    return (char*)addr + 2 * sizeof(uint64);    //offset 2 da bi bilo zaokruzeno na 16 zbog steka
    80001be8:	01058513          	addi	a0,a1,16
}
    80001bec:	00813403          	ld	s0,8(sp)
    80001bf0:	01010113          	addi	sp,sp,16
    80001bf4:	00008067          	ret
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80001bf8:	00000513          	li	a0,0
    80001bfc:	ff1ff06f          	j	80001bec <_ZN7KMemory7kmallocEm+0x160>
    80001c00:	00000513          	li	a0,0
    80001c04:	fe9ff06f          	j	80001bec <_ZN7KMemory7kmallocEm+0x160>
    if (zerosFound != size) return nullptr;
    80001c08:	00000513          	li	a0,0
    80001c0c:	fe1ff06f          	j	80001bec <_ZN7KMemory7kmallocEm+0x160>

0000000080001c10 <_ZN7KMemory16initializeMemoryEv>:
    if (initialized) return;
    80001c10:	0000b797          	auipc	a5,0xb
    80001c14:	1607c783          	lbu	a5,352(a5) # 8000cd70 <_ZN7KMemory11initializedE>
    80001c18:	0a079863          	bnez	a5,80001cc8 <_ZN7KMemory16initializeMemoryEv+0xb8>
void KMemory::initializeMemory() {
    80001c1c:	ff010113          	addi	sp,sp,-16
    80001c20:	00113423          	sd	ra,8(sp)
    80001c24:	00813023          	sd	s0,0(sp)
    80001c28:	01010413          	addi	s0,sp,16
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001c2c:	0000b797          	auipc	a5,0xb
    80001c30:	f8c7b783          	ld	a5,-116(a5) # 8000cbb8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001c34:	0007b783          	ld	a5,0(a5)
    80001c38:	0000b717          	auipc	a4,0xb
    80001c3c:	f3873703          	ld	a4,-200(a4) # 8000cb70 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c40:	00073603          	ld	a2,0(a4)
    80001c44:	40c787b3          	sub	a5,a5,a2
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    80001c48:	00c7d793          	srli	a5,a5,0xc
    80001c4c:	0000b717          	auipc	a4,0xb
    80001c50:	10c70713          	addi	a4,a4,268 # 8000cd58 <_ZN7KMemory14freeBlocksLeftE>
    80001c54:	00f73423          	sd	a5,8(a4)
    numOfBlocks = sizeOfBitVectorInUint64 * sizeof(uint64) * 8; //da se zaokruzi broj postojecih blokova na umnozak 64
    80001c58:	00679693          	slli	a3,a5,0x6
    80001c5c:	02d73023          	sd	a3,32(a4)
    uint64 blocksForBitVector = (sizeOfBitVectorInUint64 * sizeof(uint64) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80001c60:	00878513          	addi	a0,a5,8
    80001c64:	00351513          	slli	a0,a0,0x3
    80001c68:	fff50513          	addi	a0,a0,-1
    80001c6c:	00655513          	srli	a0,a0,0x6
    bitVector = (uint64*)HEAP_START_ADDR;
    80001c70:	00c73823          	sd	a2,16(a4)
    freeBlocksLeft = numOfBlocks;
    80001c74:	00d73023          	sd	a3,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001c78:	00000793          	li	a5,0
    80001c7c:	0000b717          	auipc	a4,0xb
    80001c80:	0e473703          	ld	a4,228(a4) # 8000cd60 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001c84:	02e7f063          	bgeu	a5,a4,80001ca4 <_ZN7KMemory16initializeMemoryEv+0x94>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    80001c88:	00379693          	slli	a3,a5,0x3
    80001c8c:	0000b717          	auipc	a4,0xb
    80001c90:	0dc73703          	ld	a4,220(a4) # 8000cd68 <_ZN7KMemory9bitVectorE>
    80001c94:	00d70733          	add	a4,a4,a3
    80001c98:	00073023          	sd	zero,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001c9c:	00178793          	addi	a5,a5,1
    80001ca0:	fddff06f          	j	80001c7c <_ZN7KMemory16initializeMemoryEv+0x6c>
    kmalloc(blocksForBitVector);
    80001ca4:	00000097          	auipc	ra,0x0
    80001ca8:	de8080e7          	jalr	-536(ra) # 80001a8c <_ZN7KMemory7kmallocEm>
    initialized = true;
    80001cac:	00100793          	li	a5,1
    80001cb0:	0000b717          	auipc	a4,0xb
    80001cb4:	0cf70023          	sb	a5,192(a4) # 8000cd70 <_ZN7KMemory11initializedE>
}
    80001cb8:	00813083          	ld	ra,8(sp)
    80001cbc:	00013403          	ld	s0,0(sp)
    80001cc0:	01010113          	addi	sp,sp,16
    80001cc4:	00008067          	ret
    80001cc8:	00008067          	ret

0000000080001ccc <_ZN7KMemory5kfreeEPv>:

int KMemory::kfree(void* ptr) {
    80001ccc:	ff010113          	addi	sp,sp,-16
    80001cd0:	00813423          	sd	s0,8(sp)
    80001cd4:	01010413          	addi	s0,sp,16
    if (!ptr) return 0;
    80001cd8:	08050a63          	beqz	a0,80001d6c <_ZN7KMemory5kfreeEPv+0xa0>
    ptr = (char*)ptr - 2 * sizeof(uint64);
    80001cdc:	ff050793          	addi	a5,a0,-16
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001ce0:	0000b717          	auipc	a4,0xb
    80001ce4:	e9073703          	ld	a4,-368(a4) # 8000cb70 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001ce8:	00073703          	ld	a4,0(a4)
    80001cec:	40e787b3          	sub	a5,a5,a4
    80001cf0:	03f7f713          	andi	a4,a5,63
    80001cf4:	08071063          	bnez	a4,80001d74 <_ZN7KMemory5kfreeEPv+0xa8>
    uint64 blocksToFree = *(uint64*)ptr;
    80001cf8:	ff053583          	ld	a1,-16(a0)
    freeBlocksLeft += blocksToFree;
    80001cfc:	0000b697          	auipc	a3,0xb
    80001d00:	05c68693          	addi	a3,a3,92 # 8000cd58 <_ZN7KMemory14freeBlocksLeftE>
    80001d04:	0006b703          	ld	a4,0(a3)
    80001d08:	00b70733          	add	a4,a4,a1
    80001d0c:	00e6b023          	sd	a4,0(a3)
    uint64 blockNum = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    80001d10:	0067d613          	srli	a2,a5,0x6
    uint64 currentElem = blockNum / 64;
    80001d14:	00c7d513          	srli	a0,a5,0xc
    uint64 currentBit = 63 - blockNum % 64;
    80001d18:	fff64613          	not	a2,a2
    80001d1c:	03f67613          	andi	a2,a2,63
    80001d20:	0080006f          	j	80001d28 <_ZN7KMemory5kfreeEPv+0x5c>
    while (blocksToFree > 0) {
        bitVector[currentElem] &= ~maskBit(currentBit);
        blocksToFree--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001d24:	00078613          	mv	a2,a5
    while (blocksToFree > 0) {
    80001d28:	04058a63          	beqz	a1,80001d7c <_ZN7KMemory5kfreeEPv+0xb0>
    80001d2c:	00100793          	li	a5,1
    80001d30:	00c797b3          	sll	a5,a5,a2
        bitVector[currentElem] &= ~maskBit(currentBit);
    80001d34:	fff7c793          	not	a5,a5
    80001d38:	00351713          	slli	a4,a0,0x3
    80001d3c:	0000b697          	auipc	a3,0xb
    80001d40:	02c6b683          	ld	a3,44(a3) # 8000cd68 <_ZN7KMemory9bitVectorE>
    80001d44:	00e68733          	add	a4,a3,a4
    80001d48:	00073683          	ld	a3,0(a4)
    80001d4c:	00f6f7b3          	and	a5,a3,a5
    80001d50:	00f73023          	sd	a5,0(a4)
        blocksToFree--;
    80001d54:	fff58593          	addi	a1,a1,-1
        if (currentBit-- == 0) {
    80001d58:	fff60793          	addi	a5,a2,-1
    80001d5c:	fc0614e3          	bnez	a2,80001d24 <_ZN7KMemory5kfreeEPv+0x58>
            currentElem++;
    80001d60:	00150513          	addi	a0,a0,1
            currentBit = 63;
    80001d64:	03f00793          	li	a5,63
    80001d68:	fbdff06f          	j	80001d24 <_ZN7KMemory5kfreeEPv+0x58>
    if (!ptr) return 0;
    80001d6c:	00000513          	li	a0,0
    80001d70:	0100006f          	j	80001d80 <_ZN7KMemory5kfreeEPv+0xb4>
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001d74:	fff00513          	li	a0,-1
    80001d78:	0080006f          	j	80001d80 <_ZN7KMemory5kfreeEPv+0xb4>
        }
    }
    return 0;
    80001d7c:	00000513          	li	a0,0
}
    80001d80:	00813403          	ld	s0,8(sp)
    80001d84:	01010113          	addi	sp,sp,16
    80001d88:	00008067          	ret

0000000080001d8c <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80001d8c:	ff010113          	addi	sp,sp,-16
    80001d90:	00113423          	sd	ra,8(sp)
    80001d94:	00813023          	sd	s0,0(sp)
    80001d98:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80001d9c:	fffff097          	auipc	ra,0xfffff
    80001da0:	698080e7          	jalr	1688(ra) # 80001434 <_Z15thread_dispatchv>
    80001da4:	ff9ff06f          	j	80001d9c <_Z4idlePv+0x10>

0000000080001da8 <_Z22kernelConsumerFunctionPv>:
}

//salje na izlaz karakter iz izlaznog bafera KConsole
void kernelConsumerFunction(void*) {
    80001da8:	ff010113          	addi	sp,sp,-16
    80001dac:	00113423          	sd	ra,8(sp)
    80001db0:	00813023          	sd	s0,0(sp)
    80001db4:	01010413          	addi	s0,sp,16
    80001db8:	0280006f          	j	80001de0 <_Z22kernelConsumerFunctionPv+0x38>
    static void placeInInput(char c);

    static uint8 getSRvalue() { return *sr; }

    static uint8 getDRvalue() { return *dr; }

    80001dbc:	0000b797          	auipc	a5,0xb
    80001dc0:	ddc7b783          	ld	a5,-548(a5) # 8000cb98 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001dc4:	0007b783          	ld	a5,0(a5)
    80001dc8:	00a78023          	sb	a0,0(a5)
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
        KConsole::setDRvalue(c);
        sem_signal(KConsole::getOutputBufferHasSpace());
    80001dcc:	0000b797          	auipc	a5,0xb
    80001dd0:	ddc7b783          	ld	a5,-548(a5) # 8000cba8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001dd4:	0007b503          	ld	a0,0(a5)
    80001dd8:	fffff097          	auipc	ra,0xfffff
    80001ddc:	76c080e7          	jalr	1900(ra) # 80001544 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001de0:	00000097          	auipc	ra,0x0
    80001de4:	958080e7          	jalr	-1704(ra) # 80001738 <_ZN8KConsole13getFromOutputEv>

    80001de8:	0000b797          	auipc	a5,0xb
    80001dec:	df07b783          	ld	a5,-528(a5) # 8000cbd8 <_GLOBAL_OFFSET_TABLE_+0x90>
    80001df0:	0007b783          	ld	a5,0(a5)
    80001df4:	0007c783          	lbu	a5,0(a5)
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80001df8:	0207f793          	andi	a5,a5,32
    80001dfc:	fe0786e3          	beqz	a5,80001de8 <_Z22kernelConsumerFunctionPv+0x40>
    80001e00:	fbdff06f          	j	80001dbc <_Z22kernelConsumerFunctionPv+0x14>

0000000080001e04 <main>:
    }
}

int main() {
    80001e04:	fd010113          	addi	sp,sp,-48
    80001e08:	02113423          	sd	ra,40(sp)
    80001e0c:	02813023          	sd	s0,32(sp)
    80001e10:	03010413          	addi	s0,sp,48
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001e14:	0000b797          	auipc	a5,0xb
    80001e18:	dac7b783          	ld	a5,-596(a5) # 8000cbc0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80001e1c:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80001e20:	00000097          	auipc	ra,0x0
    80001e24:	df0080e7          	jalr	-528(ra) # 80001c10 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001e28:	00000097          	auipc	ra,0x0
    80001e2c:	858080e7          	jalr	-1960(ra) # 80001680 <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    80001e30:	00000613          	li	a2,0
    80001e34:	00000597          	auipc	a1,0x0
    80001e38:	fd058593          	addi	a1,a1,-48 # 80001e04 <main>
    80001e3c:	fe840513          	addi	a0,s0,-24
    80001e40:	fffff097          	auipc	ra,0xfffff
    80001e44:	538080e7          	jalr	1336(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80001e48:	fe843783          	ld	a5,-24(s0)

    Body getBody() { return threadFunction; }

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }
    80001e4c:	0000b717          	auipc	a4,0xb
    80001e50:	d6473703          	ld	a4,-668(a4) # 8000cbb0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001e54:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001e58:	00100713          	li	a4,1
    80001e5c:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    80001e60:	00000613          	li	a2,0
    80001e64:	0000b597          	auipc	a1,0xb
    80001e68:	cec5b583          	ld	a1,-788(a1) # 8000cb50 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001e6c:	fe040513          	addi	a0,s0,-32
    80001e70:	fffff097          	auipc	ra,0xfffff
    80001e74:	508080e7          	jalr	1288(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80001e78:	00000613          	li	a2,0
    80001e7c:	00000597          	auipc	a1,0x0
    80001e80:	f2c58593          	addi	a1,a1,-212 # 80001da8 <_Z22kernelConsumerFunctionPv>
    80001e84:	fd040513          	addi	a0,s0,-48
    80001e88:	fffff097          	auipc	ra,0xfffff
    80001e8c:	4f0080e7          	jalr	1264(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80001e90:	00000613          	li	a2,0
    80001e94:	00000597          	auipc	a1,0x0
    80001e98:	ef858593          	addi	a1,a1,-264 # 80001d8c <_Z4idlePv>
    80001e9c:	fd840513          	addi	a0,s0,-40
    80001ea0:	fffff097          	auipc	ra,0xfffff
    80001ea4:	4d8080e7          	jalr	1240(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001ea8:	00200793          	li	a5,2
    80001eac:	1007a073          	csrs	sstatus,a5

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80001eb0:	fe043503          	ld	a0,-32(s0)
    80001eb4:	fffff097          	auipc	ra,0xfffff
    80001eb8:	5a0080e7          	jalr	1440(ra) # 80001454 <_Z11thread_joinP3TCB>
    static void setDRvalue(char c) { *dr = c; }

    static sem_t getOutputBufferHasSpace() { return outputBufferHasSpace; }

    80001ebc:	0000b797          	auipc	a5,0xb
    80001ec0:	ccc7b783          	ld	a5,-820(a5) # 8000cb88 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001ec4:	0007a703          	lw	a4,0(a5)
    static int getOutputHead() { return outputHead; }

    80001ec8:	0000b797          	auipc	a5,0xb
    80001ecc:	d087b783          	ld	a5,-760(a5) # 8000cbd0 <_GLOBAL_OFFSET_TABLE_+0x88>
    80001ed0:	0007a783          	lw	a5,0(a5)

    //flush output bafera za konzolu
    while (KConsole::getOutputHead() != KConsole::getOutputTail()) {}
    80001ed4:	fef714e3          	bne	a4,a5,80001ebc <main+0xb8>
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001ed8:	00200793          	li	a5,2
    80001edc:	1007b073          	csrc	sstatus,a5

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80001ee0:	00000513          	li	a0,0
    80001ee4:	02813083          	ld	ra,40(sp)
    80001ee8:	02013403          	ld	s0,32(sp)
    80001eec:	03010113          	addi	sp,sp,48
    80001ef0:	00008067          	ret

0000000080001ef4 <interruptRoutine>:
#include "../h/Scheduler.hpp"

int main();

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001ef4:	f9010113          	addi	sp,sp,-112
    80001ef8:	06113423          	sd	ra,104(sp)
    80001efc:	06813023          	sd	s0,96(sp)
    80001f00:	04913c23          	sd	s1,88(sp)
    80001f04:	07010413          	addi	s0,sp,112
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f08:	14202373          	csrr	t1,scause
    80001f0c:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f10:	14102373          	csrr	t1,sepc
    80001f14:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f18:	10002373          	csrr	t1,sstatus
    80001f1c:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4;
    //uint64 a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f20:	00050313          	mv	t1,a0
    80001f24:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f28:	00058313          	mv	t1,a1
    80001f2c:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f30:	00060313          	mv	t1,a2
    80001f34:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f38:	00068313          	mv	t1,a3
    80001f3c:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f40:	00070313          	mv	t1,a4
    80001f44:	fa643023          	sd	t1,-96(s0)
//    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");

    if (scause == 0x9 || scause == 0x8) {
    80001f48:	fd843703          	ld	a4,-40(s0)
    80001f4c:	00900793          	li	a5,9
    80001f50:	00f70863          	beq	a4,a5,80001f60 <interruptRoutine+0x6c>
    80001f54:	fd843703          	ld	a4,-40(s0)
    80001f58:	00800793          	li	a5,8
    80001f5c:	3cf71a63          	bne	a4,a5,80002330 <interruptRoutine+0x43c>
        //prekid zbog poziva ecall
        switch (a0) {
    80001f60:	fc043703          	ld	a4,-64(s0)
    80001f64:	08100793          	li	a5,129
    80001f68:	2cf70663          	beq	a4,a5,80002234 <interruptRoutine+0x340>
    80001f6c:	fc043703          	ld	a4,-64(s0)
    80001f70:	08100793          	li	a5,129
    80001f74:	30e7e063          	bltu	a5,a4,80002274 <interruptRoutine+0x380>
    80001f78:	fc043703          	ld	a4,-64(s0)
    80001f7c:	04200793          	li	a5,66
    80001f80:	04e7e263          	bltu	a5,a4,80001fc4 <interruptRoutine+0xd0>
    80001f84:	fc043783          	ld	a5,-64(s0)
    80001f88:	2e078663          	beqz	a5,80002274 <interruptRoutine+0x380>
    80001f8c:	fc043703          	ld	a4,-64(s0)
    80001f90:	04200793          	li	a5,66
    80001f94:	2ee7e063          	bltu	a5,a4,80002274 <interruptRoutine+0x380>
    80001f98:	fc043783          	ld	a5,-64(s0)
    80001f9c:	00279713          	slli	a4,a5,0x2
    80001fa0:	00008797          	auipc	a5,0x8
    80001fa4:	0f478793          	addi	a5,a5,244 # 8000a094 <CONSOLE_STATUS+0x84>
    80001fa8:	00f707b3          	add	a5,a4,a5
    80001fac:	0007a783          	lw	a5,0(a5)
    80001fb0:	0007871b          	sext.w	a4,a5
    80001fb4:	00008797          	auipc	a5,0x8
    80001fb8:	0e078793          	addi	a5,a5,224 # 8000a094 <CONSOLE_STATUS+0x84>
    80001fbc:	00f707b3          	add	a5,a4,a5
    80001fc0:	00078067          	jr	a5
    80001fc4:	fc043703          	ld	a4,-64(s0)
    80001fc8:	08000793          	li	a5,128
    80001fcc:	20f70e63          	beq	a4,a5,800021e8 <interruptRoutine+0x2f4>
    80001fd0:	2a40006f          	j	80002274 <interruptRoutine+0x380>
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                KMemory::kmalloc((size_t)a1);
    80001fd4:	fb843503          	ld	a0,-72(s0)
    80001fd8:	00000097          	auipc	ra,0x0
    80001fdc:	ab4080e7          	jalr	-1356(ra) # 80001a8c <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    80001fe0:	04a43823          	sd	a0,80(s0)
                break;
    80001fe4:	32c0006f          	j	80002310 <interruptRoutine+0x41c>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                KMemory::kfree((void*)a1);
    80001fe8:	fb843783          	ld	a5,-72(s0)
    80001fec:	00078513          	mv	a0,a5
    80001ff0:	00000097          	auipc	ra,0x0
    80001ff4:	cdc080e7          	jalr	-804(ra) # 80001ccc <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    80001ff8:	04a43823          	sd	a0,80(s0)
                break;
    80001ffc:	3140006f          	j	80002310 <interruptRoutine+0x41c>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002000:	fb043783          	ld	a5,-80(s0)
    80002004:	fa843703          	ld	a4,-88(s0)
    80002008:	fa043683          	ld	a3,-96(s0)
    8000200c:	fb843483          	ld	s1,-72(s0)
    80002010:	00068613          	mv	a2,a3
    80002014:	00070593          	mv	a1,a4
    80002018:	00078513          	mv	a0,a5
    8000201c:	00001097          	auipc	ra,0x1
    80002020:	dd0080e7          	jalr	-560(ra) # 80002dec <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002024:	00050793          	mv	a5,a0
    80002028:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    8000202c:	fb843783          	ld	a5,-72(s0)
    80002030:	0007b783          	ld	a5,0(a5)
    80002034:	02078863          	beqz	a5,80002064 <interruptRoutine+0x170>
                    if ((TCB::Body)a2 != (TCB::Body)main) {
    80002038:	fb043703          	ld	a4,-80(s0)
    8000203c:	0000b797          	auipc	a5,0xb
    80002040:	b647b783          	ld	a5,-1180(a5) # 8000cba0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002044:	00f70c63          	beq	a4,a5,8000205c <interruptRoutine+0x168>
                        Scheduler::put(*((thread_t*)a1));
    80002048:	fb843783          	ld	a5,-72(s0)
    8000204c:	0007b783          	ld	a5,0(a5)
    80002050:	00078513          	mv	a0,a5
    80002054:	00000097          	auipc	ra,0x0
    80002058:	87c080e7          	jalr	-1924(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
                    }
                    __asm__ volatile("li a0, 0");
    8000205c:	00000513          	li	a0,0
    80002060:	0080006f          	j	80002068 <interruptRoutine+0x174>
                } else {
                    __asm__ volatile("li a0, -1");
    80002064:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002068:	04a43823          	sd	a0,80(s0)
                break;
    8000206c:	2a40006f          	j	80002310 <interruptRoutine+0x41c>
            case 0x12:
                //thread_exit
                TCB::getRunning()->setStatus(TCB::FINISHED);
    80002070:	00000097          	auipc	ra,0x0
    80002074:	5a0080e7          	jalr	1440(ra) # 80002610 <_ZN3TCB10getRunningEv>
    80002078:	00050793          	mv	a5,a0
    8000207c:	00500593          	li	a1,5
    80002080:	00078513          	mv	a0,a5
    80002084:	00000097          	auipc	ra,0x0
    80002088:	538080e7          	jalr	1336(ra) # 800025bc <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined();
    8000208c:	00001097          	auipc	ra,0x1
    80002090:	e8c080e7          	jalr	-372(ra) # 80002f18 <_ZN3TCB13releaseJoinedEv>
                __asm__ volatile("li a0, 0");
    80002094:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 80(s0)");
    80002098:	04a43823          	sd	a0,80(s0)
                TCB::dispatch();
    8000209c:	00001097          	auipc	ra,0x1
    800020a0:	c74080e7          	jalr	-908(ra) # 80002d10 <_ZN3TCB8dispatchEv>
                break;
    800020a4:	26c0006f          	j	80002310 <interruptRoutine+0x41c>
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
    800020a8:	00001097          	auipc	ra,0x1
    800020ac:	c68080e7          	jalr	-920(ra) # 80002d10 <_ZN3TCB8dispatchEv>
                break;
    800020b0:	2600006f          	j	80002310 <interruptRoutine+0x41c>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    800020b4:	fb843783          	ld	a5,-72(s0)
    800020b8:	00078513          	mv	a0,a5
    800020bc:	00001097          	auipc	ra,0x1
    800020c0:	e0c080e7          	jalr	-500(ra) # 80002ec8 <_ZN3TCB10threadJoinEPS_>
                TCB::dispatch();
    800020c4:	00001097          	auipc	ra,0x1
    800020c8:	c4c080e7          	jalr	-948(ra) # 80002d10 <_ZN3TCB8dispatchEv>
                break;
    800020cc:	2440006f          	j	80002310 <interruptRoutine+0x41c>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    800020d0:	fb043783          	ld	a5,-80(s0)
    800020d4:	0007879b          	sext.w	a5,a5
    800020d8:	fb843483          	ld	s1,-72(s0)
    800020dc:	00078513          	mv	a0,a5
    800020e0:	00001097          	auipc	ra,0x1
    800020e4:	f3c080e7          	jalr	-196(ra) # 8000301c <_ZN4KSem7initSemEj>
    800020e8:	00050793          	mv	a5,a0
    800020ec:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    800020f0:	fb843783          	ld	a5,-72(s0)
    800020f4:	0007b783          	ld	a5,0(a5)
    800020f8:	00078663          	beqz	a5,80002104 <interruptRoutine+0x210>
                    __asm__ volatile("li a0, 0");
    800020fc:	00000513          	li	a0,0
    80002100:	0080006f          	j	80002108 <interruptRoutine+0x214>
                } else {
                    __asm__ volatile("li a0, -1");
    80002104:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002108:	04a43823          	sd	a0,80(s0)
                break;
    8000210c:	2040006f          	j	80002310 <interruptRoutine+0x41c>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    80002110:	fb843783          	ld	a5,-72(s0)
    80002114:	00078513          	mv	a0,a5
    80002118:	00001097          	auipc	ra,0x1
    8000211c:	078080e7          	jalr	120(ra) # 80003190 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    80002120:	04a43823          	sd	a0,80(s0)
                delete (sem_t)a1;
    80002124:	fb843483          	ld	s1,-72(s0)
    80002128:	1c048a63          	beqz	s1,800022fc <interruptRoutine+0x408>
    8000212c:	00048513          	mv	a0,s1
    80002130:	00000097          	auipc	ra,0x0
    80002134:	3d4080e7          	jalr	980(ra) # 80002504 <_ZN4KSemD1Ev>
    80002138:	00048513          	mv	a0,s1
    8000213c:	00001097          	auipc	ra,0x1
    80002140:	eb8080e7          	jalr	-328(ra) # 80002ff4 <_ZN4KSemdlEPv>
                break;
    80002144:	1b80006f          	j	800022fc <interruptRoutine+0x408>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80002148:	fb843783          	ld	a5,-72(s0)
    8000214c:	00078513          	mv	a0,a5
    80002150:	00001097          	auipc	ra,0x1
    80002154:	f60080e7          	jalr	-160(ra) # 800030b0 <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002158:	04a43823          	sd	a0,80(s0)
                break;
    8000215c:	1b40006f          	j	80002310 <interruptRoutine+0x41c>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    80002160:	fb843783          	ld	a5,-72(s0)
    80002164:	00078513          	mv	a0,a5
    80002168:	00001097          	auipc	ra,0x1
    8000216c:	fd4080e7          	jalr	-44(ra) # 8000313c <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002170:	04a43823          	sd	a0,80(s0)
                break;
    80002174:	19c0006f          	j	80002310 <interruptRoutine+0x41c>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    80002178:	fb843783          	ld	a5,-72(s0)
    8000217c:	00078663          	beqz	a5,80002188 <interruptRoutine+0x294>
                    __asm__ volatile("li a0, 0");
    80002180:	00000513          	li	a0,0
    80002184:	0080006f          	j	8000218c <interruptRoutine+0x298>
                } else {
                    __asm__ volatile("li a0, -1");
    80002188:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    8000218c:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    80002190:	fb843783          	ld	a5,-72(s0)
    80002194:	16078863          	beqz	a5,80002304 <interruptRoutine+0x410>
                    Scheduler::putToSleep(TCB::getRunning(), (time_t)a1);
    80002198:	00000097          	auipc	ra,0x0
    8000219c:	478080e7          	jalr	1144(ra) # 80002610 <_ZN3TCB10getRunningEv>
    800021a0:	00050793          	mv	a5,a0
    800021a4:	fb843583          	ld	a1,-72(s0)
    800021a8:	00078513          	mv	a0,a5
    800021ac:	fffff097          	auipc	ra,0xfffff
    800021b0:	7b0080e7          	jalr	1968(ra) # 8000195c <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::dispatch();
    800021b4:	00001097          	auipc	ra,0x1
    800021b8:	b5c080e7          	jalr	-1188(ra) # 80002d10 <_ZN3TCB8dispatchEv>
                }
                break;
    800021bc:	1480006f          	j	80002304 <interruptRoutine+0x410>
            case 0x41:
                //getc
                KConsole::kgetc();
    800021c0:	fffff097          	auipc	ra,0xfffff
    800021c4:	6ac080e7          	jalr	1708(ra) # 8000186c <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    800021c8:	04a43823          	sd	a0,80(s0)
                break;
    800021cc:	1440006f          	j	80002310 <interruptRoutine+0x41c>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    800021d0:	fb843783          	ld	a5,-72(s0)
    800021d4:	0ff7f793          	andi	a5,a5,255
    800021d8:	00078513          	mv	a0,a5
    800021dc:	fffff097          	auipc	ra,0xfffff
    800021e0:	620080e7          	jalr	1568(ra) # 800017fc <_ZN8KConsole5kputcEc>
                break;
    800021e4:	12c0006f          	j	80002310 <interruptRoutine+0x41c>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    800021e8:	fb043783          	ld	a5,-80(s0)
    800021ec:	fa843703          	ld	a4,-88(s0)
    800021f0:	fa043683          	ld	a3,-96(s0)
    800021f4:	fb843483          	ld	s1,-72(s0)
    800021f8:	00068613          	mv	a2,a3
    800021fc:	00070593          	mv	a1,a4
    80002200:	00078513          	mv	a0,a5
    80002204:	00001097          	auipc	ra,0x1
    80002208:	be8080e7          	jalr	-1048(ra) # 80002dec <_ZN3TCB12createThreadEPFvPvES0_Pm>
    8000220c:	00050793          	mv	a5,a0
    80002210:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80002214:	fb843783          	ld	a5,-72(s0)
    80002218:	0007b783          	ld	a5,0(a5)
    8000221c:	00078663          	beqz	a5,80002228 <interruptRoutine+0x334>
                    __asm__ volatile("li a0, 0");
    80002220:	00000513          	li	a0,0
    80002224:	0080006f          	j	8000222c <interruptRoutine+0x338>
                } else {
                    __asm__ volatile("li a0, -1");
    80002228:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    8000222c:	04a43823          	sd	a0,80(s0)
                break;
    80002230:	0e00006f          	j	80002310 <interruptRoutine+0x41c>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                if (((thread_t)a1)->getBody() != (TCB::Body)main) {
    80002234:	fb843783          	ld	a5,-72(s0)
    80002238:	00078513          	mv	a0,a5
    8000223c:	00000097          	auipc	ra,0x0
    80002240:	3b8080e7          	jalr	952(ra) # 800025f4 <_ZN3TCB7getBodyEv>
    80002244:	00050713          	mv	a4,a0
    80002248:	0000b797          	auipc	a5,0xb
    8000224c:	9587b783          	ld	a5,-1704(a5) # 8000cba0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002250:	40f707b3          	sub	a5,a4,a5
    80002254:	00f037b3          	snez	a5,a5
    80002258:	0ff7f793          	andi	a5,a5,255
    8000225c:	0a078863          	beqz	a5,8000230c <interruptRoutine+0x418>
                    Scheduler::put((thread_t)a1);
    80002260:	fb843783          	ld	a5,-72(s0)
    80002264:	00078513          	mv	a0,a5
    80002268:	fffff097          	auipc	ra,0xfffff
    8000226c:	668080e7          	jalr	1640(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
                }
                break;
    80002270:	09c0006f          	j	8000230c <interruptRoutine+0x418>
            default:
                printString("\nNepostojeci op code: ");
    80002274:	00008517          	auipc	a0,0x8
    80002278:	dac50513          	addi	a0,a0,-596 # 8000a020 <CONSOLE_STATUS+0x10>
    8000227c:	00003097          	auipc	ra,0x3
    80002280:	75c080e7          	jalr	1884(ra) # 800059d8 <_Z11printStringPKc>
                printInt(a0);
    80002284:	fc043783          	ld	a5,-64(s0)
    80002288:	0007879b          	sext.w	a5,a5
    8000228c:	00000613          	li	a2,0
    80002290:	00a00593          	li	a1,10
    80002294:	00078513          	mv	a0,a5
    80002298:	00004097          	auipc	ra,0x4
    8000229c:	8f0080e7          	jalr	-1808(ra) # 80005b88 <_Z8printIntiii>
                printString("\nscause: ");
    800022a0:	00008517          	auipc	a0,0x8
    800022a4:	d9850513          	addi	a0,a0,-616 # 8000a038 <CONSOLE_STATUS+0x28>
    800022a8:	00003097          	auipc	ra,0x3
    800022ac:	730080e7          	jalr	1840(ra) # 800059d8 <_Z11printStringPKc>
                printInt(scause);
    800022b0:	fd843783          	ld	a5,-40(s0)
    800022b4:	0007879b          	sext.w	a5,a5
    800022b8:	00000613          	li	a2,0
    800022bc:	00a00593          	li	a1,10
    800022c0:	00078513          	mv	a0,a5
    800022c4:	00004097          	auipc	ra,0x4
    800022c8:	8c4080e7          	jalr	-1852(ra) # 80005b88 <_Z8printIntiii>
                printString("\nsepc: ");
    800022cc:	00008517          	auipc	a0,0x8
    800022d0:	d7c50513          	addi	a0,a0,-644 # 8000a048 <CONSOLE_STATUS+0x38>
    800022d4:	00003097          	auipc	ra,0x3
    800022d8:	704080e7          	jalr	1796(ra) # 800059d8 <_Z11printStringPKc>
                printInt(sepc);
    800022dc:	fd043783          	ld	a5,-48(s0)
    800022e0:	0007879b          	sext.w	a5,a5
    800022e4:	00000613          	li	a2,0
    800022e8:	00a00593          	li	a1,10
    800022ec:	00078513          	mv	a0,a5
    800022f0:	00004097          	auipc	ra,0x4
    800022f4:	898080e7          	jalr	-1896(ra) # 80005b88 <_Z8printIntiii>
                break;
    800022f8:	0180006f          	j	80002310 <interruptRoutine+0x41c>
                break;
    800022fc:	00000013          	nop
    80002300:	0100006f          	j	80002310 <interruptRoutine+0x41c>
                break;
    80002304:	00000013          	nop
    80002308:	0080006f          	j	80002310 <interruptRoutine+0x41c>
                break;
    8000230c:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    80002310:	fd043783          	ld	a5,-48(s0)
    80002314:	00478793          	addi	a5,a5,4
    80002318:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    8000231c:	fd043783          	ld	a5,-48(s0)
    80002320:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002324:	fc843783          	ld	a5,-56(s0)
    80002328:	10079073          	csrw	sstatus,a5
        printString("\nsepc: ");
        printInt(sepc);
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    }
    8000232c:	1c00006f          	j	800024ec <interruptRoutine+0x5f8>
    } else if (scause == 0x8000000000000009) {
    80002330:	fd843703          	ld	a4,-40(s0)
    80002334:	fff00793          	li	a5,-1
    80002338:	03f79793          	slli	a5,a5,0x3f
    8000233c:	00978793          	addi	a5,a5,9
    80002340:	08f71e63          	bne	a4,a5,800023dc <interruptRoutine+0x4e8>
        uint64 irq = plic_claim();
    80002344:	00005097          	auipc	ra,0x5
    80002348:	6e0080e7          	jalr	1760(ra) # 80007a24 <plic_claim>
    8000234c:	00050793          	mv	a5,a0
    80002350:	f8f43c23          	sd	a5,-104(s0)
        if (irq == CONSOLE_IRQ) {
    80002354:	f9843703          	ld	a4,-104(s0)
    80002358:	00a00793          	li	a5,10
    8000235c:	02f71e63          	bne	a4,a5,80002398 <interruptRoutine+0x4a4>
            if (KConsole::getSRvalue() & CONSOLE_RX_STATUS_BIT) {
    80002360:	00000097          	auipc	ra,0x0
    80002364:	20c080e7          	jalr	524(ra) # 8000256c <_ZN8KConsole10getSRvalueEv>
    80002368:	00050793          	mv	a5,a0
    8000236c:	0017f793          	andi	a5,a5,1
    80002370:	00f037b3          	snez	a5,a5
    80002374:	0ff7f793          	andi	a5,a5,255
    80002378:	02078863          	beqz	a5,800023a8 <interruptRoutine+0x4b4>
                KConsole::placeInInput(KConsole::getDRvalue());
    8000237c:	00000097          	auipc	ra,0x0
    80002380:	218080e7          	jalr	536(ra) # 80002594 <_ZN8KConsole10getDRvalueEv>
    80002384:	00050793          	mv	a5,a0
    80002388:	00078513          	mv	a0,a5
    8000238c:	fffff097          	auipc	ra,0xfffff
    80002390:	404080e7          	jalr	1028(ra) # 80001790 <_ZN8KConsole12placeInInputEc>
    80002394:	0140006f          	j	800023a8 <interruptRoutine+0x4b4>
            printString("Neki drugi prekid\n");
    80002398:	00008517          	auipc	a0,0x8
    8000239c:	cb850513          	addi	a0,a0,-840 # 8000a050 <CONSOLE_STATUS+0x40>
    800023a0:	00003097          	auipc	ra,0x3
    800023a4:	638080e7          	jalr	1592(ra) # 800059d8 <_Z11printStringPKc>
        plic_complete(irq);
    800023a8:	f9843783          	ld	a5,-104(s0)
    800023ac:	0007879b          	sext.w	a5,a5
    800023b0:	00078513          	mv	a0,a5
    800023b4:	00005097          	auipc	ra,0x5
    800023b8:	6a8080e7          	jalr	1704(ra) # 80007a5c <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800023bc:	fd043783          	ld	a5,-48(s0)
    800023c0:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800023c4:	fc843783          	ld	a5,-56(s0)
    800023c8:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    800023cc:	20000513          	li	a0,512
    800023d0:	00000097          	auipc	ra,0x0
    800023d4:	180080e7          	jalr	384(ra) # 80002550 <_ZN5Riscv6mc_sipEm>
    800023d8:	1140006f          	j	800024ec <interruptRoutine+0x5f8>
    } else if (scause == 0x8000000000000001) {
    800023dc:	fd843703          	ld	a4,-40(s0)
    800023e0:	fff00793          	li	a5,-1
    800023e4:	03f79793          	slli	a5,a5,0x3f
    800023e8:	00178793          	addi	a5,a5,1
    800023ec:	08f71463          	bne	a4,a5,80002474 <interruptRoutine+0x580>
        Scheduler::wake();
    800023f0:	fffff097          	auipc	ra,0xfffff
    800023f4:	61c080e7          	jalr	1564(ra) # 80001a0c <_ZN9Scheduler4wakeEv>
        TCB::getRunningTimeSlice()++;
    800023f8:	00000097          	auipc	ra,0x0
    800023fc:	23c080e7          	jalr	572(ra) # 80002634 <_ZN3TCB19getRunningTimeSliceEv>
    80002400:	00050793          	mv	a5,a0
    80002404:	0007b703          	ld	a4,0(a5)
    80002408:	00170713          	addi	a4,a4,1
    8000240c:	00e7b023          	sd	a4,0(a5)
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
    80002410:	00000097          	auipc	ra,0x0
    80002414:	224080e7          	jalr	548(ra) # 80002634 <_ZN3TCB19getRunningTimeSliceEv>
    80002418:	00050793          	mv	a5,a0
    8000241c:	0007b483          	ld	s1,0(a5)
    80002420:	00000097          	auipc	ra,0x0
    80002424:	1f0080e7          	jalr	496(ra) # 80002610 <_ZN3TCB10getRunningEv>
    80002428:	00050793          	mv	a5,a0
    8000242c:	00078513          	mv	a0,a5
    80002430:	00000097          	auipc	ra,0x0
    80002434:	1a8080e7          	jalr	424(ra) # 800025d8 <_ZN3TCB12getTimeSliceEv>
    80002438:	00050793          	mv	a5,a0
    8000243c:	00f4b7b3          	sltu	a5,s1,a5
    80002440:	0017c793          	xori	a5,a5,1
    80002444:	0ff7f793          	andi	a5,a5,255
    80002448:	00078663          	beqz	a5,80002454 <interruptRoutine+0x560>
            TCB::dispatch();
    8000244c:	00001097          	auipc	ra,0x1
    80002450:	8c4080e7          	jalr	-1852(ra) # 80002d10 <_ZN3TCB8dispatchEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002454:	fd043783          	ld	a5,-48(s0)
    80002458:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    8000245c:	fc843783          	ld	a5,-56(s0)
    80002460:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    80002464:	00200513          	li	a0,2
    80002468:	00000097          	auipc	ra,0x0
    8000246c:	0e8080e7          	jalr	232(ra) # 80002550 <_ZN5Riscv6mc_sipEm>
    80002470:	07c0006f          	j	800024ec <interruptRoutine+0x5f8>
        printString("\nGreska u prekidnoj rutini\n");
    80002474:	00008517          	auipc	a0,0x8
    80002478:	bf450513          	addi	a0,a0,-1036 # 8000a068 <CONSOLE_STATUS+0x58>
    8000247c:	00003097          	auipc	ra,0x3
    80002480:	55c080e7          	jalr	1372(ra) # 800059d8 <_Z11printStringPKc>
        printString("scause: ");
    80002484:	00008517          	auipc	a0,0x8
    80002488:	c0450513          	addi	a0,a0,-1020 # 8000a088 <CONSOLE_STATUS+0x78>
    8000248c:	00003097          	auipc	ra,0x3
    80002490:	54c080e7          	jalr	1356(ra) # 800059d8 <_Z11printStringPKc>
        printInt(scause);
    80002494:	fd843783          	ld	a5,-40(s0)
    80002498:	0007879b          	sext.w	a5,a5
    8000249c:	00000613          	li	a2,0
    800024a0:	00a00593          	li	a1,10
    800024a4:	00078513          	mv	a0,a5
    800024a8:	00003097          	auipc	ra,0x3
    800024ac:	6e0080e7          	jalr	1760(ra) # 80005b88 <_Z8printIntiii>
        printString("\nsepc: ");
    800024b0:	00008517          	auipc	a0,0x8
    800024b4:	b9850513          	addi	a0,a0,-1128 # 8000a048 <CONSOLE_STATUS+0x38>
    800024b8:	00003097          	auipc	ra,0x3
    800024bc:	520080e7          	jalr	1312(ra) # 800059d8 <_Z11printStringPKc>
        printInt(sepc);
    800024c0:	fd043783          	ld	a5,-48(s0)
    800024c4:	0007879b          	sext.w	a5,a5
    800024c8:	00000613          	li	a2,0
    800024cc:	00a00593          	li	a1,10
    800024d0:	00078513          	mv	a0,a5
    800024d4:	00003097          	auipc	ra,0x3
    800024d8:	6b4080e7          	jalr	1716(ra) # 80005b88 <_Z8printIntiii>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800024dc:	fd043783          	ld	a5,-48(s0)
    800024e0:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800024e4:	fc843783          	ld	a5,-56(s0)
    800024e8:	10079073          	csrw	sstatus,a5
    800024ec:	00000013          	nop
    800024f0:	06813083          	ld	ra,104(sp)
    800024f4:	06013403          	ld	s0,96(sp)
    800024f8:	05813483          	ld	s1,88(sp)
    800024fc:	07010113          	addi	sp,sp,112
    80002500:	00008067          	ret

0000000080002504 <_ZN4KSemD1Ev>:
#define PROJEKAT2023_KSEM_HPP

#include "../h/ThreadQueue.hpp"

//klasa napravljena po uzoru na semafor u skolskom jezgru
class KSem {
    80002504:	fe010113          	addi	sp,sp,-32
    80002508:	00113c23          	sd	ra,24(sp)
    8000250c:	00813823          	sd	s0,16(sp)
    80002510:	00913423          	sd	s1,8(sp)
    80002514:	02010413          	addi	s0,sp,32
    80002518:	00050493          	mv	s1,a0
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    8000251c:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002520:	00050e63          	beqz	a0,8000253c <_ZN4KSemD1Ev+0x38>
            front = front->next;
    80002524:	00853783          	ld	a5,8(a0)
    80002528:	00f4b423          	sd	a5,8(s1)
            delete node;
    8000252c:	fe0508e3          	beqz	a0,8000251c <_ZN4KSemD1Ev+0x18>
            mem_free(ptr);
    80002530:	fffff097          	auipc	ra,0xfffff
    80002534:	e18080e7          	jalr	-488(ra) # 80001348 <_Z8mem_freePv>
        }
    80002538:	fe5ff06f          	j	8000251c <_ZN4KSemD1Ev+0x18>
    8000253c:	01813083          	ld	ra,24(sp)
    80002540:	01013403          	ld	s0,16(sp)
    80002544:	00813483          	ld	s1,8(sp)
    80002548:	02010113          	addi	sp,sp,32
    8000254c:	00008067          	ret

0000000080002550 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002550:	ff010113          	addi	sp,sp,-16
    80002554:	00813423          	sd	s0,8(sp)
    80002558:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    8000255c:	14453073          	csrc	sip,a0
}
    80002560:	00813403          	ld	s0,8(sp)
    80002564:	01010113          	addi	sp,sp,16
    80002568:	00008067          	ret

000000008000256c <_ZN8KConsole10getSRvalueEv>:
    static uint8 getSRvalue() { return *sr; }
    8000256c:	ff010113          	addi	sp,sp,-16
    80002570:	00813423          	sd	s0,8(sp)
    80002574:	01010413          	addi	s0,sp,16
    80002578:	0000a797          	auipc	a5,0xa
    8000257c:	6607b783          	ld	a5,1632(a5) # 8000cbd8 <_GLOBAL_OFFSET_TABLE_+0x90>
    80002580:	0007b783          	ld	a5,0(a5)
    80002584:	0007c503          	lbu	a0,0(a5)
    80002588:	00813403          	ld	s0,8(sp)
    8000258c:	01010113          	addi	sp,sp,16
    80002590:	00008067          	ret

0000000080002594 <_ZN8KConsole10getDRvalueEv>:
    static uint8 getDRvalue() { return *dr; }
    80002594:	ff010113          	addi	sp,sp,-16
    80002598:	00813423          	sd	s0,8(sp)
    8000259c:	01010413          	addi	s0,sp,16
    800025a0:	0000a797          	auipc	a5,0xa
    800025a4:	5f87b783          	ld	a5,1528(a5) # 8000cb98 <_GLOBAL_OFFSET_TABLE_+0x50>
    800025a8:	0007b783          	ld	a5,0(a5)
    800025ac:	0007c503          	lbu	a0,0(a5)
    800025b0:	00813403          	ld	s0,8(sp)
    800025b4:	01010113          	addi	sp,sp,16
    800025b8:	00008067          	ret

00000000800025bc <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    800025bc:	ff010113          	addi	sp,sp,-16
    800025c0:	00813423          	sd	s0,8(sp)
    800025c4:	01010413          	addi	s0,sp,16
    800025c8:	04b52c23          	sw	a1,88(a0)
    800025cc:	00813403          	ld	s0,8(sp)
    800025d0:	01010113          	addi	sp,sp,16
    800025d4:	00008067          	ret

00000000800025d8 <_ZN3TCB12getTimeSliceEv>:
    uint64 getTimeSlice() { return timeSlice; }
    800025d8:	ff010113          	addi	sp,sp,-16
    800025dc:	00813423          	sd	s0,8(sp)
    800025e0:	01010413          	addi	s0,sp,16
    800025e4:	02853503          	ld	a0,40(a0)
    800025e8:	00813403          	ld	s0,8(sp)
    800025ec:	01010113          	addi	sp,sp,16
    800025f0:	00008067          	ret

00000000800025f4 <_ZN3TCB7getBodyEv>:
    Body getBody() { return threadFunction; }
    800025f4:	ff010113          	addi	sp,sp,-16
    800025f8:	00813423          	sd	s0,8(sp)
    800025fc:	01010413          	addi	s0,sp,16
    80002600:	01053503          	ld	a0,16(a0)
    80002604:	00813403          	ld	s0,8(sp)
    80002608:	01010113          	addi	sp,sp,16
    8000260c:	00008067          	ret

0000000080002610 <_ZN3TCB10getRunningEv>:
    static TCB* getRunning() { return running; }
    80002610:	ff010113          	addi	sp,sp,-16
    80002614:	00813423          	sd	s0,8(sp)
    80002618:	01010413          	addi	s0,sp,16
    8000261c:	0000a797          	auipc	a5,0xa
    80002620:	5947b783          	ld	a5,1428(a5) # 8000cbb0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002624:	0007b503          	ld	a0,0(a5)
    80002628:	00813403          	ld	s0,8(sp)
    8000262c:	01010113          	addi	sp,sp,16
    80002630:	00008067          	ret

0000000080002634 <_ZN3TCB19getRunningTimeSliceEv>:

    static uint64 &getRunningTimeSlice() { return runningTimeSlice; }
    80002634:	ff010113          	addi	sp,sp,-16
    80002638:	00813423          	sd	s0,8(sp)
    8000263c:	01010413          	addi	s0,sp,16
    80002640:	0000a517          	auipc	a0,0xa
    80002644:	52053503          	ld	a0,1312(a0) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002648:	00813403          	ld	s0,8(sp)
    8000264c:	01010113          	addi	sp,sp,16
    80002650:	00008067          	ret

0000000080002654 <_ZN6Thread7wrapperEPv>:

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
    80002654:	02050863          	beqz	a0,80002684 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80002658:	ff010113          	addi	sp,sp,-16
    8000265c:	00113423          	sd	ra,8(sp)
    80002660:	00813023          	sd	s0,0(sp)
    80002664:	01010413          	addi	s0,sp,16
        ((Thread*)thread)->run();
    80002668:	00053783          	ld	a5,0(a0)
    8000266c:	0107b783          	ld	a5,16(a5)
    80002670:	000780e7          	jalr	a5
    }
}
    80002674:	00813083          	ld	ra,8(sp)
    80002678:	00013403          	ld	s0,0(sp)
    8000267c:	01010113          	addi	sp,sp,16
    80002680:	00008067          	ret
    80002684:	00008067          	ret

0000000080002688 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80002688:	fe010113          	addi	sp,sp,-32
    8000268c:	00113c23          	sd	ra,24(sp)
    80002690:	00813823          	sd	s0,16(sp)
    80002694:	00913423          	sd	s1,8(sp)
    80002698:	02010413          	addi	s0,sp,32
    8000269c:	00050493          	mv	s1,a0
    800026a0:	0000a797          	auipc	a5,0xa
    800026a4:	26878793          	addi	a5,a5,616 # 8000c908 <_ZTV6Thread+0x10>
    800026a8:	00f53023          	sd	a5,0(a0)
    thread_join(this->myHandle);
    800026ac:	00853503          	ld	a0,8(a0)
    800026b0:	fffff097          	auipc	ra,0xfffff
    800026b4:	da4080e7          	jalr	-604(ra) # 80001454 <_Z11thread_joinP3TCB>
    delete myHandle;
    800026b8:	0084b483          	ld	s1,8(s1)
    800026bc:	02048863          	beqz	s1,800026ec <_ZN6ThreadD1Ev+0x64>
        return front == nullptr;
    800026c0:	0484b503          	ld	a0,72(s1)
        while (!isEmpty()) {
    800026c4:	00050e63          	beqz	a0,800026e0 <_ZN6ThreadD1Ev+0x58>
            front = front->next;
    800026c8:	00853783          	ld	a5,8(a0)
    800026cc:	04f4b423          	sd	a5,72(s1)
            delete node;
    800026d0:	fe0508e3          	beqz	a0,800026c0 <_ZN6ThreadD1Ev+0x38>
            mem_free(ptr);
    800026d4:	fffff097          	auipc	ra,0xfffff
    800026d8:	c74080e7          	jalr	-908(ra) # 80001348 <_Z8mem_freePv>
        }
    800026dc:	fe5ff06f          	j	800026c0 <_ZN6ThreadD1Ev+0x38>
    800026e0:	00048513          	mv	a0,s1
    800026e4:	00000097          	auipc	ra,0x0
    800026e8:	7bc080e7          	jalr	1980(ra) # 80002ea0 <_ZN3TCBdlEPv>
}
    800026ec:	01813083          	ld	ra,24(sp)
    800026f0:	01013403          	ld	s0,16(sp)
    800026f4:	00813483          	ld	s1,8(sp)
    800026f8:	02010113          	addi	sp,sp,32
    800026fc:	00008067          	ret

0000000080002700 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002700:	fe010113          	addi	sp,sp,-32
    80002704:	00113c23          	sd	ra,24(sp)
    80002708:	00813823          	sd	s0,16(sp)
    8000270c:	00913423          	sd	s1,8(sp)
    80002710:	02010413          	addi	s0,sp,32
    80002714:	00050493          	mv	s1,a0
    80002718:	0000a797          	auipc	a5,0xa
    8000271c:	21878793          	addi	a5,a5,536 # 8000c930 <_ZTV9Semaphore+0x10>
    80002720:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80002724:	00853503          	ld	a0,8(a0)
    80002728:	fffff097          	auipc	ra,0xfffff
    8000272c:	dbc080e7          	jalr	-580(ra) # 800014e4 <_Z9sem_closeP4KSem>
    delete myHandle;
    80002730:	0084b483          	ld	s1,8(s1)
    80002734:	02048863          	beqz	s1,80002764 <_ZN9SemaphoreD1Ev+0x64>
        return front == nullptr;
    80002738:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    8000273c:	00050e63          	beqz	a0,80002758 <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    80002740:	00853783          	ld	a5,8(a0)
    80002744:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002748:	fe0508e3          	beqz	a0,80002738 <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    8000274c:	fffff097          	auipc	ra,0xfffff
    80002750:	bfc080e7          	jalr	-1028(ra) # 80001348 <_Z8mem_freePv>
        }
    80002754:	fe5ff06f          	j	80002738 <_ZN9SemaphoreD1Ev+0x38>
    80002758:	00048513          	mv	a0,s1
    8000275c:	00001097          	auipc	ra,0x1
    80002760:	898080e7          	jalr	-1896(ra) # 80002ff4 <_ZN4KSemdlEPv>
}
    80002764:	01813083          	ld	ra,24(sp)
    80002768:	01013403          	ld	s0,16(sp)
    8000276c:	00813483          	ld	s1,8(sp)
    80002770:	02010113          	addi	sp,sp,32
    80002774:	00008067          	ret

0000000080002778 <_Znwm>:
void* operator new(size_t size) {
    80002778:	ff010113          	addi	sp,sp,-16
    8000277c:	00113423          	sd	ra,8(sp)
    80002780:	00813023          	sd	s0,0(sp)
    80002784:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002788:	fffff097          	auipc	ra,0xfffff
    8000278c:	b80080e7          	jalr	-1152(ra) # 80001308 <_Z9mem_allocm>
}
    80002790:	00813083          	ld	ra,8(sp)
    80002794:	00013403          	ld	s0,0(sp)
    80002798:	01010113          	addi	sp,sp,16
    8000279c:	00008067          	ret

00000000800027a0 <_Znam>:
void* operator new[](size_t size) {
    800027a0:	ff010113          	addi	sp,sp,-16
    800027a4:	00113423          	sd	ra,8(sp)
    800027a8:	00813023          	sd	s0,0(sp)
    800027ac:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800027b0:	fffff097          	auipc	ra,0xfffff
    800027b4:	b58080e7          	jalr	-1192(ra) # 80001308 <_Z9mem_allocm>
}
    800027b8:	00813083          	ld	ra,8(sp)
    800027bc:	00013403          	ld	s0,0(sp)
    800027c0:	01010113          	addi	sp,sp,16
    800027c4:	00008067          	ret

00000000800027c8 <_ZdlPv>:
noexcept {
    800027c8:	ff010113          	addi	sp,sp,-16
    800027cc:	00113423          	sd	ra,8(sp)
    800027d0:	00813023          	sd	s0,0(sp)
    800027d4:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800027d8:	fffff097          	auipc	ra,0xfffff
    800027dc:	b70080e7          	jalr	-1168(ra) # 80001348 <_Z8mem_freePv>
}
    800027e0:	00813083          	ld	ra,8(sp)
    800027e4:	00013403          	ld	s0,0(sp)
    800027e8:	01010113          	addi	sp,sp,16
    800027ec:	00008067          	ret

00000000800027f0 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800027f0:	fe010113          	addi	sp,sp,-32
    800027f4:	00113c23          	sd	ra,24(sp)
    800027f8:	00813823          	sd	s0,16(sp)
    800027fc:	00913423          	sd	s1,8(sp)
    80002800:	02010413          	addi	s0,sp,32
    80002804:	00050493          	mv	s1,a0
}
    80002808:	00000097          	auipc	ra,0x0
    8000280c:	e80080e7          	jalr	-384(ra) # 80002688 <_ZN6ThreadD1Ev>
    80002810:	00048513          	mv	a0,s1
    80002814:	00000097          	auipc	ra,0x0
    80002818:	fb4080e7          	jalr	-76(ra) # 800027c8 <_ZdlPv>
    8000281c:	01813083          	ld	ra,24(sp)
    80002820:	01013403          	ld	s0,16(sp)
    80002824:	00813483          	ld	s1,8(sp)
    80002828:	02010113          	addi	sp,sp,32
    8000282c:	00008067          	ret

0000000080002830 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002830:	fe010113          	addi	sp,sp,-32
    80002834:	00113c23          	sd	ra,24(sp)
    80002838:	00813823          	sd	s0,16(sp)
    8000283c:	00913423          	sd	s1,8(sp)
    80002840:	02010413          	addi	s0,sp,32
    80002844:	00050493          	mv	s1,a0
}
    80002848:	00000097          	auipc	ra,0x0
    8000284c:	eb8080e7          	jalr	-328(ra) # 80002700 <_ZN9SemaphoreD1Ev>
    80002850:	00048513          	mv	a0,s1
    80002854:	00000097          	auipc	ra,0x0
    80002858:	f74080e7          	jalr	-140(ra) # 800027c8 <_ZdlPv>
    8000285c:	01813083          	ld	ra,24(sp)
    80002860:	01013403          	ld	s0,16(sp)
    80002864:	00813483          	ld	s1,8(sp)
    80002868:	02010113          	addi	sp,sp,32
    8000286c:	00008067          	ret

0000000080002870 <_ZdaPv>:
noexcept {
    80002870:	ff010113          	addi	sp,sp,-16
    80002874:	00113423          	sd	ra,8(sp)
    80002878:	00813023          	sd	s0,0(sp)
    8000287c:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002880:	fffff097          	auipc	ra,0xfffff
    80002884:	ac8080e7          	jalr	-1336(ra) # 80001348 <_Z8mem_freePv>
}
    80002888:	00813083          	ld	ra,8(sp)
    8000288c:	00013403          	ld	s0,0(sp)
    80002890:	01010113          	addi	sp,sp,16
    80002894:	00008067          	ret

0000000080002898 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80002898:	fd010113          	addi	sp,sp,-48
    8000289c:	02113423          	sd	ra,40(sp)
    800028a0:	02813023          	sd	s0,32(sp)
    800028a4:	00913c23          	sd	s1,24(sp)
    800028a8:	01213823          	sd	s2,16(sp)
    800028ac:	01313423          	sd	s3,8(sp)
    800028b0:	03010413          	addi	s0,sp,48
    800028b4:	00050493          	mv	s1,a0
    800028b8:	00058913          	mv	s2,a1
    800028bc:	00060993          	mv	s3,a2
    800028c0:	0000a797          	auipc	a5,0xa
    800028c4:	04878793          	addi	a5,a5,72 # 8000c908 <_ZTV6Thread+0x10>
    800028c8:	00f53023          	sd	a5,0(a0)
    this->body = body;
    800028cc:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    800028d0:	00c53c23          	sd	a2,24(a0)
    if (body != (TCB::Body)main) {
    800028d4:	0000a797          	auipc	a5,0xa
    800028d8:	2cc7b783          	ld	a5,716(a5) # 8000cba0 <_GLOBAL_OFFSET_TABLE_+0x58>
    800028dc:	04f58663          	beq	a1,a5,80002928 <_ZN6ThreadC1EPFvPvES0_+0x90>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800028e0:	00001537          	lui	a0,0x1
    800028e4:	fffff097          	auipc	ra,0xfffff
    800028e8:	a24080e7          	jalr	-1500(ra) # 80001308 <_Z9mem_allocm>
    800028ec:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028f0:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028f4:	00098693          	mv	a3,s3
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028f8:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028fc:	00848493          	addi	s1,s1,8
    80002900:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002904:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002908:	00000073          	ecall
}
    8000290c:	02813083          	ld	ra,40(sp)
    80002910:	02013403          	ld	s0,32(sp)
    80002914:	01813483          	ld	s1,24(sp)
    80002918:	01013903          	ld	s2,16(sp)
    8000291c:	00813983          	ld	s3,8(sp)
    80002920:	03010113          	addi	sp,sp,48
    80002924:	00008067          	ret
    uint64* stack = nullptr;
    80002928:	00000313          	li	t1,0
    8000292c:	fc5ff06f          	j	800028f0 <_ZN6ThreadC1EPFvPvES0_+0x58>

0000000080002930 <_ZN6Thread5startEv>:
int Thread::start() {
    80002930:	ff010113          	addi	sp,sp,-16
    80002934:	00813423          	sd	s0,8(sp)
    80002938:	01010413          	addi	s0,sp,16
    if (myHandle == nullptr) return -1;
    8000293c:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002940:	02030063          	beqz	t1,80002960 <_ZN6Thread5startEv+0x30>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002944:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    80002948:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    8000294c:	00000073          	ecall
    return 0;
    80002950:	00000513          	li	a0,0
}
    80002954:	00813403          	ld	s0,8(sp)
    80002958:	01010113          	addi	sp,sp,16
    8000295c:	00008067          	ret
    if (myHandle == nullptr) return -1;
    80002960:	fff00513          	li	a0,-1
    80002964:	ff1ff06f          	j	80002954 <_ZN6Thread5startEv+0x24>

0000000080002968 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002968:	ff010113          	addi	sp,sp,-16
    8000296c:	00113423          	sd	ra,8(sp)
    80002970:	00813023          	sd	s0,0(sp)
    80002974:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80002978:	00853503          	ld	a0,8(a0)
    8000297c:	fffff097          	auipc	ra,0xfffff
    80002980:	ad8080e7          	jalr	-1320(ra) # 80001454 <_Z11thread_joinP3TCB>
}
    80002984:	00813083          	ld	ra,8(sp)
    80002988:	00013403          	ld	s0,0(sp)
    8000298c:	01010113          	addi	sp,sp,16
    80002990:	00008067          	ret

0000000080002994 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002994:	ff010113          	addi	sp,sp,-16
    80002998:	00113423          	sd	ra,8(sp)
    8000299c:	00813023          	sd	s0,0(sp)
    800029a0:	01010413          	addi	s0,sp,16
    thread_dispatch();
    800029a4:	fffff097          	auipc	ra,0xfffff
    800029a8:	a90080e7          	jalr	-1392(ra) # 80001434 <_Z15thread_dispatchv>
}
    800029ac:	00813083          	ld	ra,8(sp)
    800029b0:	00013403          	ld	s0,0(sp)
    800029b4:	01010113          	addi	sp,sp,16
    800029b8:	00008067          	ret

00000000800029bc <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    800029bc:	ff010113          	addi	sp,sp,-16
    800029c0:	00113423          	sd	ra,8(sp)
    800029c4:	00813023          	sd	s0,0(sp)
    800029c8:	01010413          	addi	s0,sp,16
    time_sleep(t);
    800029cc:	fffff097          	auipc	ra,0xfffff
    800029d0:	ab0080e7          	jalr	-1360(ra) # 8000147c <_Z10time_sleepm>
}
    800029d4:	00000513          	li	a0,0
    800029d8:	00813083          	ld	ra,8(sp)
    800029dc:	00013403          	ld	s0,0(sp)
    800029e0:	01010113          	addi	sp,sp,16
    800029e4:	00008067          	ret

00000000800029e8 <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    800029e8:	fe010113          	addi	sp,sp,-32
    800029ec:	00113c23          	sd	ra,24(sp)
    800029f0:	00813823          	sd	s0,16(sp)
    800029f4:	00913423          	sd	s1,8(sp)
    800029f8:	02010413          	addi	s0,sp,32
    800029fc:	00050493          	mv	s1,a0
    while (period != -1UL) {
    80002a00:	0204b703          	ld	a4,32(s1)
    80002a04:	fff00793          	li	a5,-1
    80002a08:	02f70663          	beq	a4,a5,80002a34 <_ZN14PeriodicThread3runEv+0x4c>
        periodicActivation();
    80002a0c:	0004b783          	ld	a5,0(s1)
    80002a10:	0187b783          	ld	a5,24(a5)
    80002a14:	00048513          	mv	a0,s1
    80002a18:	000780e7          	jalr	a5
        if (period == -1UL) break;
    80002a1c:	0204b503          	ld	a0,32(s1)
    80002a20:	fff00793          	li	a5,-1
    80002a24:	00f50863          	beq	a0,a5,80002a34 <_ZN14PeriodicThread3runEv+0x4c>
        sleep(period);
    80002a28:	00000097          	auipc	ra,0x0
    80002a2c:	f94080e7          	jalr	-108(ra) # 800029bc <_ZN6Thread5sleepEm>
    while (period != -1UL) {
    80002a30:	fd1ff06f          	j	80002a00 <_ZN14PeriodicThread3runEv+0x18>
    }
    thread_exit();
    80002a34:	fffff097          	auipc	ra,0xfffff
    80002a38:	9d8080e7          	jalr	-1576(ra) # 8000140c <_Z11thread_exitv>
}
    80002a3c:	01813083          	ld	ra,24(sp)
    80002a40:	01013403          	ld	s0,16(sp)
    80002a44:	00813483          	ld	s1,8(sp)
    80002a48:	02010113          	addi	sp,sp,32
    80002a4c:	00008067          	ret

0000000080002a50 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002a50:	fe010113          	addi	sp,sp,-32
    80002a54:	00113c23          	sd	ra,24(sp)
    80002a58:	00813823          	sd	s0,16(sp)
    80002a5c:	00913423          	sd	s1,8(sp)
    80002a60:	02010413          	addi	s0,sp,32
    80002a64:	00050493          	mv	s1,a0
    80002a68:	0000a797          	auipc	a5,0xa
    80002a6c:	ea078793          	addi	a5,a5,-352 # 8000c908 <_ZTV6Thread+0x10>
    80002a70:	00f53023          	sd	a5,0(a0)
    this->body = wrapper;
    80002a74:	00000797          	auipc	a5,0x0
    80002a78:	be078793          	addi	a5,a5,-1056 # 80002654 <_ZN6Thread7wrapperEPv>
    80002a7c:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80002a80:	00a53c23          	sd	a0,24(a0)
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002a84:	00001537          	lui	a0,0x1
    80002a88:	fffff097          	auipc	ra,0xfffff
    80002a8c:	880080e7          	jalr	-1920(ra) # 80001308 <_Z9mem_allocm>
    80002a90:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a94:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a98:	0184b303          	ld	t1,24(s1)
    80002a9c:	00030693          	mv	a3,t1
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002aa0:	0104b303          	ld	t1,16(s1)
    80002aa4:	00030613          	mv	a2,t1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002aa8:	00848493          	addi	s1,s1,8
    80002aac:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002ab0:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002ab4:	00000073          	ecall
}
    80002ab8:	01813083          	ld	ra,24(sp)
    80002abc:	01013403          	ld	s0,16(sp)
    80002ac0:	00813483          	ld	s1,8(sp)
    80002ac4:	02010113          	addi	sp,sp,32
    80002ac8:	00008067          	ret

0000000080002acc <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002acc:	ff010113          	addi	sp,sp,-16
    80002ad0:	00113423          	sd	ra,8(sp)
    80002ad4:	00813023          	sd	s0,0(sp)
    80002ad8:	01010413          	addi	s0,sp,16
    80002adc:	0000a797          	auipc	a5,0xa
    80002ae0:	e5478793          	addi	a5,a5,-428 # 8000c930 <_ZTV9Semaphore+0x10>
    80002ae4:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle, init);
    80002ae8:	00850513          	addi	a0,a0,8
    80002aec:	fffff097          	auipc	ra,0xfffff
    80002af0:	9c0080e7          	jalr	-1600(ra) # 800014ac <_Z8sem_openPP4KSemj>
}
    80002af4:	00813083          	ld	ra,8(sp)
    80002af8:	00013403          	ld	s0,0(sp)
    80002afc:	01010113          	addi	sp,sp,16
    80002b00:	00008067          	ret

0000000080002b04 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002b04:	ff010113          	addi	sp,sp,-16
    80002b08:	00113423          	sd	ra,8(sp)
    80002b0c:	00813023          	sd	s0,0(sp)
    80002b10:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002b14:	00853503          	ld	a0,8(a0)
    80002b18:	fffff097          	auipc	ra,0xfffff
    80002b1c:	9fc080e7          	jalr	-1540(ra) # 80001514 <_Z8sem_waitP4KSem>
}
    80002b20:	00813083          	ld	ra,8(sp)
    80002b24:	00013403          	ld	s0,0(sp)
    80002b28:	01010113          	addi	sp,sp,16
    80002b2c:	00008067          	ret

0000000080002b30 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002b30:	ff010113          	addi	sp,sp,-16
    80002b34:	00113423          	sd	ra,8(sp)
    80002b38:	00813023          	sd	s0,0(sp)
    80002b3c:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80002b40:	00853503          	ld	a0,8(a0)
    80002b44:	fffff097          	auipc	ra,0xfffff
    80002b48:	a00080e7          	jalr	-1536(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    80002b4c:	00813083          	ld	ra,8(sp)
    80002b50:	00013403          	ld	s0,0(sp)
    80002b54:	01010113          	addi	sp,sp,16
    80002b58:	00008067          	ret

0000000080002b5c <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002b5c:	ff010113          	addi	sp,sp,-16
    80002b60:	00813423          	sd	s0,8(sp)
    80002b64:	01010413          	addi	s0,sp,16
    this->period = -1;
    80002b68:	fff00793          	li	a5,-1
    80002b6c:	02f53023          	sd	a5,32(a0)
}
    80002b70:	00813403          	ld	s0,8(sp)
    80002b74:	01010113          	addi	sp,sp,16
    80002b78:	00008067          	ret

0000000080002b7c <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    80002b7c:	fe010113          	addi	sp,sp,-32
    80002b80:	00113c23          	sd	ra,24(sp)
    80002b84:	00813823          	sd	s0,16(sp)
    80002b88:	00913423          	sd	s1,8(sp)
    80002b8c:	01213023          	sd	s2,0(sp)
    80002b90:	02010413          	addi	s0,sp,32
    80002b94:	00050493          	mv	s1,a0
    80002b98:	00058913          	mv	s2,a1
    80002b9c:	00000097          	auipc	ra,0x0
    80002ba0:	eb4080e7          	jalr	-332(ra) # 80002a50 <_ZN6ThreadC1Ev>
    80002ba4:	0000a797          	auipc	a5,0xa
    80002ba8:	dac78793          	addi	a5,a5,-596 # 8000c950 <_ZTV14PeriodicThread+0x10>
    80002bac:	00f4b023          	sd	a5,0(s1)
    80002bb0:	0324b023          	sd	s2,32(s1)
}
    80002bb4:	01813083          	ld	ra,24(sp)
    80002bb8:	01013403          	ld	s0,16(sp)
    80002bbc:	00813483          	ld	s1,8(sp)
    80002bc0:	00013903          	ld	s2,0(sp)
    80002bc4:	02010113          	addi	sp,sp,32
    80002bc8:	00008067          	ret

0000000080002bcc <_ZN7Console4getcEv>:

char Console::getc() {
    80002bcc:	ff010113          	addi	sp,sp,-16
    80002bd0:	00113423          	sd	ra,8(sp)
    80002bd4:	00813023          	sd	s0,0(sp)
    80002bd8:	01010413          	addi	s0,sp,16
    return ::getc();
    80002bdc:	fffff097          	auipc	ra,0xfffff
    80002be0:	998080e7          	jalr	-1640(ra) # 80001574 <_Z4getcv>
}
    80002be4:	00813083          	ld	ra,8(sp)
    80002be8:	00013403          	ld	s0,0(sp)
    80002bec:	01010113          	addi	sp,sp,16
    80002bf0:	00008067          	ret

0000000080002bf4 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002bf4:	ff010113          	addi	sp,sp,-16
    80002bf8:	00113423          	sd	ra,8(sp)
    80002bfc:	00813023          	sd	s0,0(sp)
    80002c00:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002c04:	fffff097          	auipc	ra,0xfffff
    80002c08:	998080e7          	jalr	-1640(ra) # 8000159c <_Z4putcc>
}
    80002c0c:	00813083          	ld	ra,8(sp)
    80002c10:	00013403          	ld	s0,0(sp)
    80002c14:	01010113          	addi	sp,sp,16
    80002c18:	00008067          	ret

0000000080002c1c <_ZN6Thread3runEv>:
protected:
    //konstruktor koji pravi nit koja izvrsava run metodu, ne stavlja je u Scheduler
    Thread();

    //funkcija koju nit izvrsava, samo ako je nit napravljena podrazumevanim konstruktorom
    virtual void run() {}
    80002c1c:	ff010113          	addi	sp,sp,-16
    80002c20:	00813423          	sd	s0,8(sp)
    80002c24:	01010413          	addi	s0,sp,16
    80002c28:	00813403          	ld	s0,8(sp)
    80002c2c:	01010113          	addi	sp,sp,16
    80002c30:	00008067          	ret

0000000080002c34 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    80002c34:	ff010113          	addi	sp,sp,-16
    80002c38:	00813423          	sd	s0,8(sp)
    80002c3c:	01010413          	addi	s0,sp,16
    80002c40:	00813403          	ld	s0,8(sp)
    80002c44:	01010113          	addi	sp,sp,16
    80002c48:	00008067          	ret

0000000080002c4c <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002c4c:	ff010113          	addi	sp,sp,-16
    80002c50:	00113423          	sd	ra,8(sp)
    80002c54:	00813023          	sd	s0,0(sp)
    80002c58:	01010413          	addi	s0,sp,16
    80002c5c:	0000a797          	auipc	a5,0xa
    80002c60:	cf478793          	addi	a5,a5,-780 # 8000c950 <_ZTV14PeriodicThread+0x10>
    80002c64:	00f53023          	sd	a5,0(a0)
    80002c68:	00000097          	auipc	ra,0x0
    80002c6c:	a20080e7          	jalr	-1504(ra) # 80002688 <_ZN6ThreadD1Ev>
    80002c70:	00813083          	ld	ra,8(sp)
    80002c74:	00013403          	ld	s0,0(sp)
    80002c78:	01010113          	addi	sp,sp,16
    80002c7c:	00008067          	ret

0000000080002c80 <_ZN14PeriodicThreadD0Ev>:
    80002c80:	fe010113          	addi	sp,sp,-32
    80002c84:	00113c23          	sd	ra,24(sp)
    80002c88:	00813823          	sd	s0,16(sp)
    80002c8c:	00913423          	sd	s1,8(sp)
    80002c90:	02010413          	addi	s0,sp,32
    80002c94:	00050493          	mv	s1,a0
    80002c98:	0000a797          	auipc	a5,0xa
    80002c9c:	cb878793          	addi	a5,a5,-840 # 8000c950 <_ZTV14PeriodicThread+0x10>
    80002ca0:	00f53023          	sd	a5,0(a0)
    80002ca4:	00000097          	auipc	ra,0x0
    80002ca8:	9e4080e7          	jalr	-1564(ra) # 80002688 <_ZN6ThreadD1Ev>
    80002cac:	00048513          	mv	a0,s1
    80002cb0:	00000097          	auipc	ra,0x0
    80002cb4:	b18080e7          	jalr	-1256(ra) # 800027c8 <_ZdlPv>
    80002cb8:	01813083          	ld	ra,24(sp)
    80002cbc:	01013403          	ld	s0,16(sp)
    80002cc0:	00813483          	ld	s1,8(sp)
    80002cc4:	02010113          	addi	sp,sp,32
    80002cc8:	00008067          	ret

0000000080002ccc <_ZN3TCB7wrapperEv>:
    }

    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
}

void TCB::wrapper() {
    80002ccc:	ff010113          	addi	sp,sp,-16
    80002cd0:	00113423          	sd	ra,8(sp)
    80002cd4:	00813023          	sd	s0,0(sp)
    80002cd8:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch)
    Riscv::returnFromInterrupt();
    80002cdc:	00000097          	auipc	ra,0x0
    80002ce0:	2d0080e7          	jalr	720(ra) # 80002fac <_ZN5Riscv19returnFromInterruptEv>
    //na dalje se izvrsavamo u user modu (osim za kernel funkcije)
    running->threadFunction(running->args);
    80002ce4:	0000a797          	auipc	a5,0xa
    80002ce8:	09c7b783          	ld	a5,156(a5) # 8000cd80 <_ZN3TCB7runningE>
    80002cec:	0107b703          	ld	a4,16(a5)
    80002cf0:	0207b503          	ld	a0,32(a5)
    80002cf4:	000700e7          	jalr	a4
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    80002cf8:	ffffe097          	auipc	ra,0xffffe
    80002cfc:	714080e7          	jalr	1812(ra) # 8000140c <_Z11thread_exitv>
}
    80002d00:	00813083          	ld	ra,8(sp)
    80002d04:	00013403          	ld	s0,0(sp)
    80002d08:	01010113          	addi	sp,sp,16
    80002d0c:	00008067          	ret

0000000080002d10 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002d10:	fe010113          	addi	sp,sp,-32
    80002d14:	00113c23          	sd	ra,24(sp)
    80002d18:	00813823          	sd	s0,16(sp)
    80002d1c:	00913423          	sd	s1,8(sp)
    80002d20:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    80002d24:	0000a497          	auipc	s1,0xa
    80002d28:	05c4b483          	ld	s1,92(s1) # 8000cd80 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    80002d2c:	0584a703          	lw	a4,88(s1)
    80002d30:	00100793          	li	a5,1
    80002d34:	04f70a63          	beq	a4,a5,80002d88 <_ZN3TCB8dispatchEv+0x78>
    TCB::running = Scheduler::get();
    80002d38:	fffff097          	auipc	ra,0xfffff
    80002d3c:	be4080e7          	jalr	-1052(ra) # 8000191c <_ZN9Scheduler3getEv>
    80002d40:	00050593          	mv	a1,a0
    80002d44:	0000a797          	auipc	a5,0xa
    80002d48:	03c78793          	addi	a5,a5,60 # 8000cd80 <_ZN3TCB7runningE>
    80002d4c:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80002d50:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == (TCB::Body)main || TCB::running->threadFunction == kernelConsumerFunction ||
    80002d54:	01053783          	ld	a5,16(a0)
    80002d58:	0000a717          	auipc	a4,0xa
    80002d5c:	e4873703          	ld	a4,-440(a4) # 8000cba0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002d60:	02e78c63          	beq	a5,a4,80002d98 <_ZN3TCB8dispatchEv+0x88>
    80002d64:	0000a717          	auipc	a4,0xa
    80002d68:	e1c73703          	ld	a4,-484(a4) # 8000cb80 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002d6c:	02e78663          	beq	a5,a4,80002d98 <_ZN3TCB8dispatchEv+0x88>
    80002d70:	0000a717          	auipc	a4,0xa
    80002d74:	e5873703          	ld	a4,-424(a4) # 8000cbc8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002d78:	02e78063          	beq	a5,a4,80002d98 <_ZN3TCB8dispatchEv+0x88>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002d7c:	10000793          	li	a5,256
    80002d80:	1007b073          	csrc	sstatus,a5
}
    80002d84:	01c0006f          	j	80002da0 <_ZN3TCB8dispatchEv+0x90>
        Scheduler::put(old);
    80002d88:	00048513          	mv	a0,s1
    80002d8c:	fffff097          	auipc	ra,0xfffff
    80002d90:	b44080e7          	jalr	-1212(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
    80002d94:	fa5ff06f          	j	80002d38 <_ZN3TCB8dispatchEv+0x28>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002d98:	10000793          	li	a5,256
    80002d9c:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002da0:	00b48863          	beq	s1,a1,80002db0 <_ZN3TCB8dispatchEv+0xa0>
    80002da4:	00048513          	mv	a0,s1
    80002da8:	ffffe097          	auipc	ra,0xffffe
    80002dac:	368080e7          	jalr	872(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002db0:	01813083          	ld	ra,24(sp)
    80002db4:	01013403          	ld	s0,16(sp)
    80002db8:	00813483          	ld	s1,8(sp)
    80002dbc:	02010113          	addi	sp,sp,32
    80002dc0:	00008067          	ret

0000000080002dc4 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002dc4:	ff010113          	addi	sp,sp,-16
    80002dc8:	00113423          	sd	ra,8(sp)
    80002dcc:	00813023          	sd	s0,0(sp)
    80002dd0:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002dd4:	ffffe097          	auipc	ra,0xffffe
    80002dd8:	534080e7          	jalr	1332(ra) # 80001308 <_Z9mem_allocm>
}
    80002ddc:	00813083          	ld	ra,8(sp)
    80002de0:	00013403          	ld	s0,0(sp)
    80002de4:	01010113          	addi	sp,sp,16
    80002de8:	00008067          	ret

0000000080002dec <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002dec:	fd010113          	addi	sp,sp,-48
    80002df0:	02113423          	sd	ra,40(sp)
    80002df4:	02813023          	sd	s0,32(sp)
    80002df8:	00913c23          	sd	s1,24(sp)
    80002dfc:	01213823          	sd	s2,16(sp)
    80002e00:	01313423          	sd	s3,8(sp)
    80002e04:	03010413          	addi	s0,sp,48
    80002e08:	00050913          	mv	s2,a0
    80002e0c:	00058993          	mv	s3,a1
    80002e10:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    80002e14:	06000513          	li	a0,96
    80002e18:	00000097          	auipc	ra,0x0
    80002e1c:	fac080e7          	jalr	-84(ra) # 80002dc4 <_ZN3TCBnwEm>

private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED) {
    80002e20:	01253823          	sd	s2,16(a0)
    80002e24:	00953c23          	sd	s1,24(a0)
    80002e28:	03353023          	sd	s3,32(a0)
    80002e2c:	00200793          	li	a5,2
    80002e30:	02f53423          	sd	a5,40(a0)
    80002e34:	02053823          	sd	zero,48(a0)
    80002e38:	02053c23          	sd	zero,56(a0)
    80002e3c:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80002e40:	04053423          	sd	zero,72(a0)
    80002e44:	04053823          	sd	zero,80(a0)
    80002e48:	04052c23          	sw	zero,88(a0)
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80002e4c:	0000a797          	auipc	a5,0xa
    80002e50:	d547b783          	ld	a5,-684(a5) # 8000cba0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002e54:	02f90e63          	beq	s2,a5,80002e90 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002e58:	00000797          	auipc	a5,0x0
    80002e5c:	e7478793          	addi	a5,a5,-396 # 80002ccc <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002e60:	02048c63          	beqz	s1,80002e98 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002e64:	00001637          	lui	a2,0x1
    80002e68:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    80002e6c:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    80002e70:	00953423          	sd	s1,8(a0)
}
    80002e74:	02813083          	ld	ra,40(sp)
    80002e78:	02013403          	ld	s0,32(sp)
    80002e7c:	01813483          	ld	s1,24(sp)
    80002e80:	01013903          	ld	s2,16(sp)
    80002e84:	00813983          	ld	s3,8(sp)
    80002e88:	03010113          	addi	sp,sp,48
    80002e8c:	00008067          	ret
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80002e90:	00000793          	li	a5,0
    80002e94:	fcdff06f          	j	80002e60 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002e98:	00000493          	li	s1,0
    80002e9c:	fd1ff06f          	j	80002e6c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x80>

0000000080002ea0 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002ea0:	ff010113          	addi	sp,sp,-16
    80002ea4:	00113423          	sd	ra,8(sp)
    80002ea8:	00813023          	sd	s0,0(sp)
    80002eac:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002eb0:	ffffe097          	auipc	ra,0xffffe
    80002eb4:	498080e7          	jalr	1176(ra) # 80001348 <_Z8mem_freePv>
}
    80002eb8:	00813083          	ld	ra,8(sp)
    80002ebc:	00013403          	ld	s0,0(sp)
    80002ec0:	01010113          	addi	sp,sp,16
    80002ec4:	00008067          	ret

0000000080002ec8 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED || TCB::running == handle) return;
    80002ec8:	05852703          	lw	a4,88(a0)
    80002ecc:	00500793          	li	a5,5
    80002ed0:	04f70263          	beq	a4,a5,80002f14 <_ZN3TCB10threadJoinEPS_+0x4c>
    80002ed4:	0000a597          	auipc	a1,0xa
    80002ed8:	eac5b583          	ld	a1,-340(a1) # 8000cd80 <_ZN3TCB7runningE>
    80002edc:	02a58c63          	beq	a1,a0,80002f14 <_ZN3TCB10threadJoinEPS_+0x4c>
void TCB::threadJoin(TCB* handle) {
    80002ee0:	ff010113          	addi	sp,sp,-16
    80002ee4:	00113423          	sd	ra,8(sp)
    80002ee8:	00813023          	sd	s0,0(sp)
    80002eec:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    80002ef0:	00300793          	li	a5,3
    80002ef4:	04f5ac23          	sw	a5,88(a1)
    handle->waitingToJoin.putLast(TCB::running);
    80002ef8:	04850513          	addi	a0,a0,72
    80002efc:	ffffe097          	auipc	ra,0xffffe
    80002f00:	340080e7          	jalr	832(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002f04:	00813083          	ld	ra,8(sp)
    80002f08:	00013403          	ld	s0,0(sp)
    80002f0c:	01010113          	addi	sp,sp,16
    80002f10:	00008067          	ret
    80002f14:	00008067          	ret

0000000080002f18 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80002f18:	0000a517          	auipc	a0,0xa
    80002f1c:	e6853503          	ld	a0,-408(a0) # 8000cd80 <_ZN3TCB7runningE>
        return front == nullptr;
    80002f20:	04853783          	ld	a5,72(a0)
    80002f24:	04078463          	beqz	a5,80002f6c <_ZN3TCB13releaseJoinedEv+0x54>
void TCB::releaseJoined() {
    80002f28:	ff010113          	addi	sp,sp,-16
    80002f2c:	00113423          	sd	ra,8(sp)
    80002f30:	00813023          	sd	s0,0(sp)
    80002f34:	01010413          	addi	s0,sp,16
        TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002f38:	04850513          	addi	a0,a0,72
    80002f3c:	ffffe097          	auipc	ra,0xffffe
    80002f40:	36c080e7          	jalr	876(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
        Scheduler::put(tcb);
    80002f44:	fffff097          	auipc	ra,0xfffff
    80002f48:	98c080e7          	jalr	-1652(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80002f4c:	0000a517          	auipc	a0,0xa
    80002f50:	e3453503          	ld	a0,-460(a0) # 8000cd80 <_ZN3TCB7runningE>
    80002f54:	04853783          	ld	a5,72(a0)
    80002f58:	fe0790e3          	bnez	a5,80002f38 <_ZN3TCB13releaseJoinedEv+0x20>
    }
}
    80002f5c:	00813083          	ld	ra,8(sp)
    80002f60:	00013403          	ld	s0,0(sp)
    80002f64:	01010113          	addi	sp,sp,16
    80002f68:	00008067          	ret
    80002f6c:	00008067          	ret

0000000080002f70 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
    //startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
    if (newTcb->threadFunction != (TCB::Body)main) {
    80002f70:	01053703          	ld	a4,16(a0)
    80002f74:	0000a797          	auipc	a5,0xa
    80002f78:	c2c7b783          	ld	a5,-980(a5) # 8000cba0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002f7c:	02f70663          	beq	a4,a5,80002fa8 <_ZN3TCB5startEPS_+0x38>
void TCB::start(TCB* newTcb) {
    80002f80:	ff010113          	addi	sp,sp,-16
    80002f84:	00113423          	sd	ra,8(sp)
    80002f88:	00813023          	sd	s0,0(sp)
    80002f8c:	01010413          	addi	s0,sp,16
        Scheduler::put(newTcb);
    80002f90:	fffff097          	auipc	ra,0xfffff
    80002f94:	940080e7          	jalr	-1728(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
    }
}
    80002f98:	00813083          	ld	ra,8(sp)
    80002f9c:	00013403          	ld	s0,0(sp)
    80002fa0:	01010113          	addi	sp,sp,16
    80002fa4:	00008067          	ret
    80002fa8:	00008067          	ret

0000000080002fac <_ZN5Riscv19returnFromInterruptEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::returnFromInterrupt() {
    80002fac:	ff010113          	addi	sp,sp,-16
    80002fb0:	00813423          	sd	s0,8(sp)
    80002fb4:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002fb8:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002fbc:	10200073          	sret
    80002fc0:	00813403          	ld	s0,8(sp)
    80002fc4:	01010113          	addi	sp,sp,16
    80002fc8:	00008067          	ret

0000000080002fcc <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80002fcc:	ff010113          	addi	sp,sp,-16
    80002fd0:	00113423          	sd	ra,8(sp)
    80002fd4:	00813023          	sd	s0,0(sp)
    80002fd8:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002fdc:	ffffe097          	auipc	ra,0xffffe
    80002fe0:	32c080e7          	jalr	812(ra) # 80001308 <_Z9mem_allocm>
}
    80002fe4:	00813083          	ld	ra,8(sp)
    80002fe8:	00013403          	ld	s0,0(sp)
    80002fec:	01010113          	addi	sp,sp,16
    80002ff0:	00008067          	ret

0000000080002ff4 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80002ff4:	ff010113          	addi	sp,sp,-16
    80002ff8:	00113423          	sd	ra,8(sp)
    80002ffc:	00813023          	sd	s0,0(sp)
    80003000:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003004:	ffffe097          	auipc	ra,0xffffe
    80003008:	344080e7          	jalr	836(ra) # 80001348 <_Z8mem_freePv>
}
    8000300c:	00813083          	ld	ra,8(sp)
    80003010:	00013403          	ld	s0,0(sp)
    80003014:	01010113          	addi	sp,sp,16
    80003018:	00008067          	ret

000000008000301c <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    8000301c:	fe010113          	addi	sp,sp,-32
    80003020:	00113c23          	sd	ra,24(sp)
    80003024:	00813823          	sd	s0,16(sp)
    80003028:	00913423          	sd	s1,8(sp)
    8000302c:	02010413          	addi	s0,sp,32
    80003030:	00050493          	mv	s1,a0
	return new KSem(val);
    80003034:	02000513          	li	a0,32
    80003038:	00000097          	auipc	ra,0x0
    8000303c:	f94080e7          	jalr	-108(ra) # 80002fcc <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    80003040:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003044:	00053423          	sd	zero,8(a0)
    80003048:	00053823          	sd	zero,16(a0)
    8000304c:	00100713          	li	a4,1
    80003050:	00e50c23          	sb	a4,24(a0)
}
    80003054:	01813083          	ld	ra,24(sp)
    80003058:	01013403          	ld	s0,16(sp)
    8000305c:	00813483          	ld	s1,8(sp)
    80003060:	02010113          	addi	sp,sp,32
    80003064:	00008067          	ret

0000000080003068 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003068:	ff010113          	addi	sp,sp,-16
    8000306c:	00113423          	sd	ra,8(sp)
    80003070:	00813023          	sd	s0,0(sp)
    80003074:	01010413          	addi	s0,sp,16
    static TCB* getRunning() { return running; }
    80003078:	0000a797          	auipc	a5,0xa
    8000307c:	b387b783          	ld	a5,-1224(a5) # 8000cbb0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003080:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80003084:	00200793          	li	a5,2
    80003088:	04f5ac23          	sw	a5,88(a1)
    TCB::getRunning()->setStatus(TCB::BLOCKED);
	blocked.putLast(TCB::getRunning());
    8000308c:	00850513          	addi	a0,a0,8
    80003090:	ffffe097          	auipc	ra,0xffffe
    80003094:	1ac080e7          	jalr	428(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::dispatch();
    80003098:	00000097          	auipc	ra,0x0
    8000309c:	c78080e7          	jalr	-904(ra) # 80002d10 <_ZN3TCB8dispatchEv>
}
    800030a0:	00813083          	ld	ra,8(sp)
    800030a4:	00013403          	ld	s0,0(sp)
    800030a8:	01010113          	addi	sp,sp,16
    800030ac:	00008067          	ret

00000000800030b0 <_ZN4KSem4waitEv>:
	if (!working) return -3;
    800030b0:	01854783          	lbu	a5,24(a0)
    800030b4:	04078663          	beqz	a5,80003100 <_ZN4KSem4waitEv+0x50>
	if (--val < 0) {
    800030b8:	00052783          	lw	a5,0(a0)
    800030bc:	fff7879b          	addiw	a5,a5,-1
    800030c0:	00f52023          	sw	a5,0(a0)
    800030c4:	02079713          	slli	a4,a5,0x20
    800030c8:	00074663          	bltz	a4,800030d4 <_ZN4KSem4waitEv+0x24>
	return 0;
    800030cc:	00000513          	li	a0,0
}
    800030d0:	00008067          	ret
int KSem::wait() {
    800030d4:	ff010113          	addi	sp,sp,-16
    800030d8:	00113423          	sd	ra,8(sp)
    800030dc:	00813023          	sd	s0,0(sp)
    800030e0:	01010413          	addi	s0,sp,16
		block();
    800030e4:	00000097          	auipc	ra,0x0
    800030e8:	f84080e7          	jalr	-124(ra) # 80003068 <_ZN4KSem5blockEv>
		return -1;
    800030ec:	fff00513          	li	a0,-1
}
    800030f0:	00813083          	ld	ra,8(sp)
    800030f4:	00013403          	ld	s0,0(sp)
    800030f8:	01010113          	addi	sp,sp,16
    800030fc:	00008067          	ret
	if (!working) return -3;
    80003100:	ffd00513          	li	a0,-3
    80003104:	00008067          	ret

0000000080003108 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003108:	ff010113          	addi	sp,sp,-16
    8000310c:	00113423          	sd	ra,8(sp)
    80003110:	00813023          	sd	s0,0(sp)
    80003114:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003118:	00850513          	addi	a0,a0,8
    8000311c:	ffffe097          	auipc	ra,0xffffe
    80003120:	18c080e7          	jalr	396(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
	Scheduler::put(tcb);
    80003124:	ffffe097          	auipc	ra,0xffffe
    80003128:	7ac080e7          	jalr	1964(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
}
    8000312c:	00813083          	ld	ra,8(sp)
    80003130:	00013403          	ld	s0,0(sp)
    80003134:	01010113          	addi	sp,sp,16
    80003138:	00008067          	ret

000000008000313c <_ZN4KSem6signalEv>:
	if (!working) return -3;
    8000313c:	01854783          	lbu	a5,24(a0)
    80003140:	04078463          	beqz	a5,80003188 <_ZN4KSem6signalEv+0x4c>
	if (val++ < 0) {
    80003144:	00052783          	lw	a5,0(a0)
    80003148:	0017871b          	addiw	a4,a5,1
    8000314c:	00e52023          	sw	a4,0(a0)
    80003150:	0007c663          	bltz	a5,8000315c <_ZN4KSem6signalEv+0x20>
	return 0;
    80003154:	00000513          	li	a0,0
}
    80003158:	00008067          	ret
int KSem::signal() {
    8000315c:	ff010113          	addi	sp,sp,-16
    80003160:	00113423          	sd	ra,8(sp)
    80003164:	00813023          	sd	s0,0(sp)
    80003168:	01010413          	addi	s0,sp,16
		unblock();
    8000316c:	00000097          	auipc	ra,0x0
    80003170:	f9c080e7          	jalr	-100(ra) # 80003108 <_ZN4KSem7unblockEv>
	return 0;
    80003174:	00000513          	li	a0,0
}
    80003178:	00813083          	ld	ra,8(sp)
    8000317c:	00013403          	ld	s0,0(sp)
    80003180:	01010113          	addi	sp,sp,16
    80003184:	00008067          	ret
	if (!working) return -3;
    80003188:	ffd00513          	li	a0,-3
    8000318c:	00008067          	ret

0000000080003190 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003190:	fe010113          	addi	sp,sp,-32
    80003194:	00113c23          	sd	ra,24(sp)
    80003198:	00813823          	sd	s0,16(sp)
    8000319c:	00913423          	sd	s1,8(sp)
    800031a0:	02010413          	addi	s0,sp,32
    800031a4:	00050493          	mv	s1,a0
	handle->working = false;
    800031a8:	00050c23          	sb	zero,24(a0)
        return front == nullptr;
    800031ac:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    800031b0:	00078e63          	beqz	a5,800031cc <_ZN4KSem8closeSemEPS_+0x3c>
		TCB* tcb = handle->blocked.getFirst();
    800031b4:	00848513          	addi	a0,s1,8
    800031b8:	ffffe097          	auipc	ra,0xffffe
    800031bc:	0f0080e7          	jalr	240(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
		Scheduler::put(tcb);
    800031c0:	ffffe097          	auipc	ra,0xffffe
    800031c4:	710080e7          	jalr	1808(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    800031c8:	fe5ff06f          	j	800031ac <_ZN4KSem8closeSemEPS_+0x1c>
	}
	return 0;
}
    800031cc:	00000513          	li	a0,0
    800031d0:	01813083          	ld	ra,24(sp)
    800031d4:	01013403          	ld	s0,16(sp)
    800031d8:	00813483          	ld	s1,8(sp)
    800031dc:	02010113          	addi	sp,sp,32
    800031e0:	00008067          	ret

00000000800031e4 <_Z13emptyFunctionPv>:
    void run() override {
        thread_dispatch();
    }
};

void emptyFunction(void*) {}
    800031e4:	ff010113          	addi	sp,sp,-16
    800031e8:	00813423          	sd	s0,8(sp)
    800031ec:	01010413          	addi	s0,sp,16
    800031f0:	00813403          	ld	s0,8(sp)
    800031f4:	01010113          	addi	sp,sp,16
    800031f8:	00008067          	ret

00000000800031fc <_Z5nit1fPv>:

void nit1f(void*) {
    800031fc:	fe010113          	addi	sp,sp,-32
    80003200:	00113c23          	sd	ra,24(sp)
    80003204:	00813823          	sd	s0,16(sp)
    80003208:	02010413          	addi	s0,sp,32
    while (true) {
        thread_t handle;
        thread_create(&handle, emptyFunction, nullptr);
    8000320c:	00000613          	li	a2,0
    80003210:	00000597          	auipc	a1,0x0
    80003214:	fd458593          	addi	a1,a1,-44 # 800031e4 <_Z13emptyFunctionPv>
    80003218:	fe840513          	addi	a0,s0,-24
    8000321c:	ffffe097          	auipc	ra,0xffffe
    80003220:	15c080e7          	jalr	348(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    while (true) {
    80003224:	fe9ff06f          	j	8000320c <_Z5nit1fPv+0x10>

0000000080003228 <_Z5nit2fPv>:
    void periodicActivation() override {
        printString("Janko\n");
    }
};

void nit2f(void* arg2) {
    80003228:	fe010113          	addi	sp,sp,-32
    8000322c:	00113c23          	sd	ra,24(sp)
    80003230:	00813823          	sd	s0,16(sp)
    80003234:	00913423          	sd	s1,8(sp)
    80003238:	01213023          	sd	s2,0(sp)
    8000323c:	02010413          	addi	s0,sp,32
    PeriodicThread* pt = new per(10);
    80003240:	02800513          	li	a0,40
    80003244:	fffff097          	auipc	ra,0xfffff
    80003248:	534080e7          	jalr	1332(ra) # 80002778 <_Znwm>
    8000324c:	00050493          	mv	s1,a0
    per(time_t period) : PeriodicThread(period) {}
    80003250:	00a00593          	li	a1,10
    80003254:	00000097          	auipc	ra,0x0
    80003258:	928080e7          	jalr	-1752(ra) # 80002b7c <_ZN14PeriodicThreadC1Em>
    8000325c:	00009797          	auipc	a5,0x9
    80003260:	72478793          	addi	a5,a5,1828 # 8000c980 <_ZTV3per+0x10>
    80003264:	00f4b023          	sd	a5,0(s1)
    pt->start();
    80003268:	00048513          	mv	a0,s1
    8000326c:	fffff097          	auipc	ra,0xfffff
    80003270:	6c4080e7          	jalr	1732(ra) # 80002930 <_ZN6Thread5startEv>
    time_sleep(15);
    80003274:	00f00513          	li	a0,15
    80003278:	ffffe097          	auipc	ra,0xffffe
    8000327c:	204080e7          	jalr	516(ra) # 8000147c <_Z10time_sleepm>
    pt->terminate();
    80003280:	00048513          	mv	a0,s1
    80003284:	00000097          	auipc	ra,0x0
    80003288:	8d8080e7          	jalr	-1832(ra) # 80002b5c <_ZN14PeriodicThread9terminateEv>
    printString("\nGotova nit 2\n");
    8000328c:	00007517          	auipc	a0,0x7
    80003290:	f1c50513          	addi	a0,a0,-228 # 8000a1a8 <CONSOLE_STATUS+0x198>
    80003294:	00002097          	auipc	ra,0x2
    80003298:	744080e7          	jalr	1860(ra) # 800059d8 <_Z11printStringPKc>
}
    8000329c:	01813083          	ld	ra,24(sp)
    800032a0:	01013403          	ld	s0,16(sp)
    800032a4:	00813483          	ld	s1,8(sp)
    800032a8:	00013903          	ld	s2,0(sp)
    800032ac:	02010113          	addi	sp,sp,32
    800032b0:	00008067          	ret
    800032b4:	00050913          	mv	s2,a0
    PeriodicThread* pt = new per(10);
    800032b8:	00048513          	mv	a0,s1
    800032bc:	fffff097          	auipc	ra,0xfffff
    800032c0:	50c080e7          	jalr	1292(ra) # 800027c8 <_ZdlPv>
    800032c4:	00090513          	mv	a0,s2
    800032c8:	0000b097          	auipc	ra,0xb
    800032cc:	c00080e7          	jalr	-1024(ra) # 8000dec8 <_Unwind_Resume>

00000000800032d0 <_Z5nit3fPv>:


void nit3f(void*) {
    800032d0:	fe010113          	addi	sp,sp,-32
    800032d4:	00113c23          	sd	ra,24(sp)
    800032d8:	00813823          	sd	s0,16(sp)
    800032dc:	00913423          	sd	s1,8(sp)
    800032e0:	02010413          	addi	s0,sp,32
    800032e4:	0180006f          	j	800032fc <_Z5nit3fPv+0x2c>
    char slovo;
    do {
        slovo = getc();
        putc(slovo);
        if (slovo == '\r') putc('\n');
    800032e8:	00a00513          	li	a0,10
    800032ec:	ffffe097          	auipc	ra,0xffffe
    800032f0:	2b0080e7          	jalr	688(ra) # 8000159c <_Z4putcc>
    } while (slovo != '0');
    800032f4:	03000793          	li	a5,48
    800032f8:	02f48263          	beq	s1,a5,8000331c <_Z5nit3fPv+0x4c>
        slovo = getc();
    800032fc:	ffffe097          	auipc	ra,0xffffe
    80003300:	278080e7          	jalr	632(ra) # 80001574 <_Z4getcv>
    80003304:	00050493          	mv	s1,a0
        putc(slovo);
    80003308:	ffffe097          	auipc	ra,0xffffe
    8000330c:	294080e7          	jalr	660(ra) # 8000159c <_Z4putcc>
        if (slovo == '\r') putc('\n');
    80003310:	00d00793          	li	a5,13
    80003314:	fef490e3          	bne	s1,a5,800032f4 <_Z5nit3fPv+0x24>
    80003318:	fd1ff06f          	j	800032e8 <_Z5nit3fPv+0x18>

    printString("\nGotova nit3\n");
    8000331c:	00007517          	auipc	a0,0x7
    80003320:	e9c50513          	addi	a0,a0,-356 # 8000a1b8 <CONSOLE_STATUS+0x1a8>
    80003324:	00002097          	auipc	ra,0x2
    80003328:	6b4080e7          	jalr	1716(ra) # 800059d8 <_Z11printStringPKc>
}
    8000332c:	01813083          	ld	ra,24(sp)
    80003330:	01013403          	ld	s0,16(sp)
    80003334:	00813483          	ld	s1,8(sp)
    80003338:	02010113          	addi	sp,sp,32
    8000333c:	00008067          	ret

0000000080003340 <_Z5main2v>:


int main2() {
    80003340:	fc010113          	addi	sp,sp,-64
    80003344:	02113c23          	sd	ra,56(sp)
    80003348:	02813823          	sd	s0,48(sp)
    8000334c:	04010413          	addi	s0,sp,64
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80003350:	0000a797          	auipc	a5,0xa
    80003354:	8707b783          	ld	a5,-1936(a5) # 8000cbc0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80003358:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    8000335c:	fffff097          	auipc	ra,0xfffff
    80003360:	8b4080e7          	jalr	-1868(ra) # 80001c10 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80003364:	ffffe097          	auipc	ra,0xffffe
    80003368:	31c080e7          	jalr	796(ra) # 80001680 <_ZN8KConsole12initKConsoleEv>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

    //testiranje kreiranja niti
    thread_t glavnaNit = nullptr;
    8000336c:	fe043423          	sd	zero,-24(s0)
    thread_t nit1 = nullptr;
    80003370:	fe043023          	sd	zero,-32(s0)
    thread_t nit2 = nullptr;
    80003374:	fc043c23          	sd	zero,-40(s0)
    thread_t nit3 = nullptr;
    80003378:	fc043823          	sd	zero,-48(s0)
    thread_t idleNit = nullptr;
    8000337c:	fc043423          	sd	zero,-56(s0)
    thread_t kernelConsumerThread = nullptr;
    80003380:	fc043023          	sd	zero,-64(s0)
    thread_create(&glavnaNit, (TCB::Body)main, nullptr);
    80003384:	00000613          	li	a2,0
    80003388:	0000a597          	auipc	a1,0xa
    8000338c:	8185b583          	ld	a1,-2024(a1) # 8000cba0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80003390:	fe840513          	addi	a0,s0,-24
    80003394:	ffffe097          	auipc	ra,0xffffe
    80003398:	fe4080e7          	jalr	-28(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    static void setRunning(TCB* newRunning) { running = newRunning; }
    8000339c:	fe843703          	ld	a4,-24(s0)
    800033a0:	0000a797          	auipc	a5,0xa
    800033a4:	8107b783          	ld	a5,-2032(a5) # 8000cbb0 <_GLOBAL_OFFSET_TABLE_+0x68>
    800033a8:	00e7b023          	sd	a4,0(a5)
    TCB::setRunning(glavnaNit);
    thread_create(&idleNit, idle, nullptr);
    800033ac:	00000613          	li	a2,0
    800033b0:	0000a597          	auipc	a1,0xa
    800033b4:	8185b583          	ld	a1,-2024(a1) # 8000cbc8 <_GLOBAL_OFFSET_TABLE_+0x80>
    800033b8:	fc840513          	addi	a0,s0,-56
    800033bc:	ffffe097          	auipc	ra,0xffffe
    800033c0:	fbc080e7          	jalr	-68(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    800033c4:	00000613          	li	a2,0
    800033c8:	00009597          	auipc	a1,0x9
    800033cc:	7b85b583          	ld	a1,1976(a1) # 8000cb80 <_GLOBAL_OFFSET_TABLE_+0x38>
    800033d0:	fc040513          	addi	a0,s0,-64
    800033d4:	ffffe097          	auipc	ra,0xffffe
    800033d8:	fa4080e7          	jalr	-92(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>


    thread_create(&nit1, nit1f, nullptr);
    800033dc:	00000613          	li	a2,0
    800033e0:	00000597          	auipc	a1,0x0
    800033e4:	e1c58593          	addi	a1,a1,-484 # 800031fc <_Z5nit1fPv>
    800033e8:	fe040513          	addi	a0,s0,-32
    800033ec:	ffffe097          	auipc	ra,0xffffe
    800033f0:	f8c080e7          	jalr	-116(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit2, nit2f, nullptr);
    800033f4:	00000613          	li	a2,0
    800033f8:	00000597          	auipc	a1,0x0
    800033fc:	e3058593          	addi	a1,a1,-464 # 80003228 <_Z5nit2fPv>
    80003400:	fd840513          	addi	a0,s0,-40
    80003404:	ffffe097          	auipc	ra,0xffffe
    80003408:	f74080e7          	jalr	-140(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit3, nit3f, nullptr);
    8000340c:	00000613          	li	a2,0
    80003410:	00000597          	auipc	a1,0x0
    80003414:	ec058593          	addi	a1,a1,-320 # 800032d0 <_Z5nit3fPv>
    80003418:	fd040513          	addi	a0,s0,-48
    8000341c:	ffffe097          	auipc	ra,0xffffe
    80003420:	f5c080e7          	jalr	-164(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    80003424:	00200793          	li	a5,2
    80003428:	1007a073          	csrs	sstatus,a5

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    thread_join(nit1);
    8000342c:	fe043503          	ld	a0,-32(s0)
    80003430:	ffffe097          	auipc	ra,0xffffe
    80003434:	024080e7          	jalr	36(ra) # 80001454 <_Z11thread_joinP3TCB>
    thread_join(nit2);
    80003438:	fd843503          	ld	a0,-40(s0)
    8000343c:	ffffe097          	auipc	ra,0xffffe
    80003440:	018080e7          	jalr	24(ra) # 80001454 <_Z11thread_joinP3TCB>
    thread_join(nit3);
    80003444:	fd043503          	ld	a0,-48(s0)
    80003448:	ffffe097          	auipc	ra,0xffffe
    8000344c:	00c080e7          	jalr	12(ra) # 80001454 <_Z11thread_joinP3TCB>
    //thread_join(idleNit);

    printString("\nGotove user niti\n");
    80003450:	00007517          	auipc	a0,0x7
    80003454:	d7850513          	addi	a0,a0,-648 # 8000a1c8 <CONSOLE_STATUS+0x1b8>
    80003458:	00002097          	auipc	ra,0x2
    8000345c:	580080e7          	jalr	1408(ra) # 800059d8 <_Z11printStringPKc>

    printString("\nSad cu da izadjem\n");
    80003460:	00007517          	auipc	a0,0x7
    80003464:	d8050513          	addi	a0,a0,-640 # 8000a1e0 <CONSOLE_STATUS+0x1d0>
    80003468:	00002097          	auipc	ra,0x2
    8000346c:	570080e7          	jalr	1392(ra) # 800059d8 <_Z11printStringPKc>

    80003470:	00009797          	auipc	a5,0x9
    80003474:	7187b783          	ld	a5,1816(a5) # 8000cb88 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003478:	0007a703          	lw	a4,0(a5)

    8000347c:	00009797          	auipc	a5,0x9
    80003480:	7547b783          	ld	a5,1876(a5) # 8000cbd0 <_GLOBAL_OFFSET_TABLE_+0x88>
    80003484:	0007a783          	lw	a5,0(a5)
    while (KConsole::getOutputHead() != KConsole::getOutputTail()) {}
    80003488:	fef714e3          	bne	a4,a5,80003470 <_Z5main2v+0x130>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    8000348c:	00200793          	li	a5,2
    80003490:	1007b073          	csrc	sstatus,a5
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);


    return 0;
    80003494:	00000513          	li	a0,0
    80003498:	03813083          	ld	ra,56(sp)
    8000349c:	03013403          	ld	s0,48(sp)
    800034a0:	04010113          	addi	sp,sp,64
    800034a4:	00008067          	ret

00000000800034a8 <_ZN3per18periodicActivationEv>:
    void periodicActivation() override {
    800034a8:	ff010113          	addi	sp,sp,-16
    800034ac:	00113423          	sd	ra,8(sp)
    800034b0:	00813023          	sd	s0,0(sp)
    800034b4:	01010413          	addi	s0,sp,16
        printString("Janko\n");
    800034b8:	00007517          	auipc	a0,0x7
    800034bc:	ce850513          	addi	a0,a0,-792 # 8000a1a0 <CONSOLE_STATUS+0x190>
    800034c0:	00002097          	auipc	ra,0x2
    800034c4:	518080e7          	jalr	1304(ra) # 800059d8 <_Z11printStringPKc>
    }
    800034c8:	00813083          	ld	ra,8(sp)
    800034cc:	00013403          	ld	s0,0(sp)
    800034d0:	01010113          	addi	sp,sp,16
    800034d4:	00008067          	ret

00000000800034d8 <_ZN3perD1Ev>:
class per : public PeriodicThread {
    800034d8:	ff010113          	addi	sp,sp,-16
    800034dc:	00113423          	sd	ra,8(sp)
    800034e0:	00813023          	sd	s0,0(sp)
    800034e4:	01010413          	addi	s0,sp,16
    800034e8:	00009797          	auipc	a5,0x9
    800034ec:	6907b783          	ld	a5,1680(a5) # 8000cb78 <_GLOBAL_OFFSET_TABLE_+0x30>
    800034f0:	01078793          	addi	a5,a5,16
    800034f4:	00f53023          	sd	a5,0(a0)
    800034f8:	fffff097          	auipc	ra,0xfffff
    800034fc:	190080e7          	jalr	400(ra) # 80002688 <_ZN6ThreadD1Ev>
    80003500:	00813083          	ld	ra,8(sp)
    80003504:	00013403          	ld	s0,0(sp)
    80003508:	01010113          	addi	sp,sp,16
    8000350c:	00008067          	ret

0000000080003510 <_ZN3perD0Ev>:
    80003510:	fe010113          	addi	sp,sp,-32
    80003514:	00113c23          	sd	ra,24(sp)
    80003518:	00813823          	sd	s0,16(sp)
    8000351c:	00913423          	sd	s1,8(sp)
    80003520:	02010413          	addi	s0,sp,32
    80003524:	00050493          	mv	s1,a0
    80003528:	00009797          	auipc	a5,0x9
    8000352c:	6507b783          	ld	a5,1616(a5) # 8000cb78 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003530:	01078793          	addi	a5,a5,16
    80003534:	00f53023          	sd	a5,0(a0)
    80003538:	fffff097          	auipc	ra,0xfffff
    8000353c:	150080e7          	jalr	336(ra) # 80002688 <_ZN6ThreadD1Ev>
    80003540:	00048513          	mv	a0,s1
    80003544:	fffff097          	auipc	ra,0xfffff
    80003548:	284080e7          	jalr	644(ra) # 800027c8 <_ZdlPv>
    8000354c:	01813083          	ld	ra,24(sp)
    80003550:	01013403          	ld	s0,16(sp)
    80003554:	00813483          	ld	s1,8(sp)
    80003558:	02010113          	addi	sp,sp,32
    8000355c:	00008067          	ret

0000000080003560 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003560:	fe010113          	addi	sp,sp,-32
    80003564:	00113c23          	sd	ra,24(sp)
    80003568:	00813823          	sd	s0,16(sp)
    8000356c:	00913423          	sd	s1,8(sp)
    80003570:	01213023          	sd	s2,0(sp)
    80003574:	02010413          	addi	s0,sp,32
    80003578:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000357c:	00000913          	li	s2,0
    80003580:	00c0006f          	j	8000358c <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003584:	ffffe097          	auipc	ra,0xffffe
    80003588:	eb0080e7          	jalr	-336(ra) # 80001434 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    8000358c:	ffffe097          	auipc	ra,0xffffe
    80003590:	fe8080e7          	jalr	-24(ra) # 80001574 <_Z4getcv>
    80003594:	0005059b          	sext.w	a1,a0
    80003598:	02d00793          	li	a5,45
    8000359c:	02f58a63          	beq	a1,a5,800035d0 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800035a0:	0084b503          	ld	a0,8(s1)
    800035a4:	00003097          	auipc	ra,0x3
    800035a8:	400080e7          	jalr	1024(ra) # 800069a4 <_ZN6Buffer3putEi>
        i++;
    800035ac:	0019071b          	addiw	a4,s2,1
    800035b0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800035b4:	0004a683          	lw	a3,0(s1)
    800035b8:	0026979b          	slliw	a5,a3,0x2
    800035bc:	00d787bb          	addw	a5,a5,a3
    800035c0:	0017979b          	slliw	a5,a5,0x1
    800035c4:	02f767bb          	remw	a5,a4,a5
    800035c8:	fc0792e3          	bnez	a5,8000358c <_ZL16producerKeyboardPv+0x2c>
    800035cc:	fb9ff06f          	j	80003584 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800035d0:	00100793          	li	a5,1
    800035d4:	00009717          	auipc	a4,0x9
    800035d8:	7af72e23          	sw	a5,1980(a4) # 8000cd90 <_ZL9threadEnd>
    data->buffer->put('!');
    800035dc:	02100593          	li	a1,33
    800035e0:	0084b503          	ld	a0,8(s1)
    800035e4:	00003097          	auipc	ra,0x3
    800035e8:	3c0080e7          	jalr	960(ra) # 800069a4 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800035ec:	0104b503          	ld	a0,16(s1)
    800035f0:	ffffe097          	auipc	ra,0xffffe
    800035f4:	f54080e7          	jalr	-172(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    800035f8:	01813083          	ld	ra,24(sp)
    800035fc:	01013403          	ld	s0,16(sp)
    80003600:	00813483          	ld	s1,8(sp)
    80003604:	00013903          	ld	s2,0(sp)
    80003608:	02010113          	addi	sp,sp,32
    8000360c:	00008067          	ret

0000000080003610 <_ZL8producerPv>:

static void producer(void *arg) {
    80003610:	fe010113          	addi	sp,sp,-32
    80003614:	00113c23          	sd	ra,24(sp)
    80003618:	00813823          	sd	s0,16(sp)
    8000361c:	00913423          	sd	s1,8(sp)
    80003620:	01213023          	sd	s2,0(sp)
    80003624:	02010413          	addi	s0,sp,32
    80003628:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000362c:	00000913          	li	s2,0
    80003630:	00c0006f          	j	8000363c <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003634:	ffffe097          	auipc	ra,0xffffe
    80003638:	e00080e7          	jalr	-512(ra) # 80001434 <_Z15thread_dispatchv>
    while (!threadEnd) {
    8000363c:	00009797          	auipc	a5,0x9
    80003640:	7547a783          	lw	a5,1876(a5) # 8000cd90 <_ZL9threadEnd>
    80003644:	02079e63          	bnez	a5,80003680 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003648:	0004a583          	lw	a1,0(s1)
    8000364c:	0305859b          	addiw	a1,a1,48
    80003650:	0084b503          	ld	a0,8(s1)
    80003654:	00003097          	auipc	ra,0x3
    80003658:	350080e7          	jalr	848(ra) # 800069a4 <_ZN6Buffer3putEi>
        i++;
    8000365c:	0019071b          	addiw	a4,s2,1
    80003660:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003664:	0004a683          	lw	a3,0(s1)
    80003668:	0026979b          	slliw	a5,a3,0x2
    8000366c:	00d787bb          	addw	a5,a5,a3
    80003670:	0017979b          	slliw	a5,a5,0x1
    80003674:	02f767bb          	remw	a5,a4,a5
    80003678:	fc0792e3          	bnez	a5,8000363c <_ZL8producerPv+0x2c>
    8000367c:	fb9ff06f          	j	80003634 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003680:	0104b503          	ld	a0,16(s1)
    80003684:	ffffe097          	auipc	ra,0xffffe
    80003688:	ec0080e7          	jalr	-320(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    8000368c:	01813083          	ld	ra,24(sp)
    80003690:	01013403          	ld	s0,16(sp)
    80003694:	00813483          	ld	s1,8(sp)
    80003698:	00013903          	ld	s2,0(sp)
    8000369c:	02010113          	addi	sp,sp,32
    800036a0:	00008067          	ret

00000000800036a4 <_ZL8consumerPv>:

static void consumer(void *arg) {
    800036a4:	fd010113          	addi	sp,sp,-48
    800036a8:	02113423          	sd	ra,40(sp)
    800036ac:	02813023          	sd	s0,32(sp)
    800036b0:	00913c23          	sd	s1,24(sp)
    800036b4:	01213823          	sd	s2,16(sp)
    800036b8:	01313423          	sd	s3,8(sp)
    800036bc:	03010413          	addi	s0,sp,48
    800036c0:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800036c4:	00000993          	li	s3,0
    800036c8:	01c0006f          	j	800036e4 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800036cc:	ffffe097          	auipc	ra,0xffffe
    800036d0:	d68080e7          	jalr	-664(ra) # 80001434 <_Z15thread_dispatchv>
    800036d4:	0500006f          	j	80003724 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800036d8:	00a00513          	li	a0,10
    800036dc:	ffffe097          	auipc	ra,0xffffe
    800036e0:	ec0080e7          	jalr	-320(ra) # 8000159c <_Z4putcc>
    while (!threadEnd) {
    800036e4:	00009797          	auipc	a5,0x9
    800036e8:	6ac7a783          	lw	a5,1708(a5) # 8000cd90 <_ZL9threadEnd>
    800036ec:	06079063          	bnez	a5,8000374c <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800036f0:	00893503          	ld	a0,8(s2)
    800036f4:	00003097          	auipc	ra,0x3
    800036f8:	340080e7          	jalr	832(ra) # 80006a34 <_ZN6Buffer3getEv>
        i++;
    800036fc:	0019849b          	addiw	s1,s3,1
    80003700:	0004899b          	sext.w	s3,s1
        putc(key);
    80003704:	0ff57513          	andi	a0,a0,255
    80003708:	ffffe097          	auipc	ra,0xffffe
    8000370c:	e94080e7          	jalr	-364(ra) # 8000159c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003710:	00092703          	lw	a4,0(s2)
    80003714:	0027179b          	slliw	a5,a4,0x2
    80003718:	00e787bb          	addw	a5,a5,a4
    8000371c:	02f4e7bb          	remw	a5,s1,a5
    80003720:	fa0786e3          	beqz	a5,800036cc <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003724:	05000793          	li	a5,80
    80003728:	02f4e4bb          	remw	s1,s1,a5
    8000372c:	fa049ce3          	bnez	s1,800036e4 <_ZL8consumerPv+0x40>
    80003730:	fa9ff06f          	j	800036d8 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003734:	00893503          	ld	a0,8(s2)
    80003738:	00003097          	auipc	ra,0x3
    8000373c:	2fc080e7          	jalr	764(ra) # 80006a34 <_ZN6Buffer3getEv>
        putc(key);
    80003740:	0ff57513          	andi	a0,a0,255
    80003744:	ffffe097          	auipc	ra,0xffffe
    80003748:	e58080e7          	jalr	-424(ra) # 8000159c <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    8000374c:	00893503          	ld	a0,8(s2)
    80003750:	00003097          	auipc	ra,0x3
    80003754:	370080e7          	jalr	880(ra) # 80006ac0 <_ZN6Buffer6getCntEv>
    80003758:	fca04ee3          	bgtz	a0,80003734 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    8000375c:	01093503          	ld	a0,16(s2)
    80003760:	ffffe097          	auipc	ra,0xffffe
    80003764:	de4080e7          	jalr	-540(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    80003768:	02813083          	ld	ra,40(sp)
    8000376c:	02013403          	ld	s0,32(sp)
    80003770:	01813483          	ld	s1,24(sp)
    80003774:	01013903          	ld	s2,16(sp)
    80003778:	00813983          	ld	s3,8(sp)
    8000377c:	03010113          	addi	sp,sp,48
    80003780:	00008067          	ret

0000000080003784 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003784:	f9010113          	addi	sp,sp,-112
    80003788:	06113423          	sd	ra,104(sp)
    8000378c:	06813023          	sd	s0,96(sp)
    80003790:	04913c23          	sd	s1,88(sp)
    80003794:	05213823          	sd	s2,80(sp)
    80003798:	05313423          	sd	s3,72(sp)
    8000379c:	05413023          	sd	s4,64(sp)
    800037a0:	03513c23          	sd	s5,56(sp)
    800037a4:	03613823          	sd	s6,48(sp)
    800037a8:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800037ac:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800037b0:	00007517          	auipc	a0,0x7
    800037b4:	a4850513          	addi	a0,a0,-1464 # 8000a1f8 <CONSOLE_STATUS+0x1e8>
    800037b8:	00002097          	auipc	ra,0x2
    800037bc:	220080e7          	jalr	544(ra) # 800059d8 <_Z11printStringPKc>
    getString(input, 30);
    800037c0:	01e00593          	li	a1,30
    800037c4:	fa040493          	addi	s1,s0,-96
    800037c8:	00048513          	mv	a0,s1
    800037cc:	00002097          	auipc	ra,0x2
    800037d0:	294080e7          	jalr	660(ra) # 80005a60 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800037d4:	00048513          	mv	a0,s1
    800037d8:	00002097          	auipc	ra,0x2
    800037dc:	360080e7          	jalr	864(ra) # 80005b38 <_Z11stringToIntPKc>
    800037e0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800037e4:	00007517          	auipc	a0,0x7
    800037e8:	a3450513          	addi	a0,a0,-1484 # 8000a218 <CONSOLE_STATUS+0x208>
    800037ec:	00002097          	auipc	ra,0x2
    800037f0:	1ec080e7          	jalr	492(ra) # 800059d8 <_Z11printStringPKc>
    getString(input, 30);
    800037f4:	01e00593          	li	a1,30
    800037f8:	00048513          	mv	a0,s1
    800037fc:	00002097          	auipc	ra,0x2
    80003800:	264080e7          	jalr	612(ra) # 80005a60 <_Z9getStringPci>
    n = stringToInt(input);
    80003804:	00048513          	mv	a0,s1
    80003808:	00002097          	auipc	ra,0x2
    8000380c:	330080e7          	jalr	816(ra) # 80005b38 <_Z11stringToIntPKc>
    80003810:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003814:	00007517          	auipc	a0,0x7
    80003818:	a2450513          	addi	a0,a0,-1500 # 8000a238 <CONSOLE_STATUS+0x228>
    8000381c:	00002097          	auipc	ra,0x2
    80003820:	1bc080e7          	jalr	444(ra) # 800059d8 <_Z11printStringPKc>
	printInt(threadNum);
    80003824:	00000613          	li	a2,0
    80003828:	00a00593          	li	a1,10
    8000382c:	00090513          	mv	a0,s2
    80003830:	00002097          	auipc	ra,0x2
    80003834:	358080e7          	jalr	856(ra) # 80005b88 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003838:	00007517          	auipc	a0,0x7
    8000383c:	a1850513          	addi	a0,a0,-1512 # 8000a250 <CONSOLE_STATUS+0x240>
    80003840:	00002097          	auipc	ra,0x2
    80003844:	198080e7          	jalr	408(ra) # 800059d8 <_Z11printStringPKc>
	printInt(n);
    80003848:	00000613          	li	a2,0
    8000384c:	00a00593          	li	a1,10
    80003850:	00048513          	mv	a0,s1
    80003854:	00002097          	auipc	ra,0x2
    80003858:	334080e7          	jalr	820(ra) # 80005b88 <_Z8printIntiii>
    printString(".\n");
    8000385c:	00007517          	auipc	a0,0x7
    80003860:	a0c50513          	addi	a0,a0,-1524 # 8000a268 <CONSOLE_STATUS+0x258>
    80003864:	00002097          	auipc	ra,0x2
    80003868:	174080e7          	jalr	372(ra) # 800059d8 <_Z11printStringPKc>
    if(threadNum > n) {
    8000386c:	0324c463          	blt	s1,s2,80003894 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003870:	03205c63          	blez	s2,800038a8 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003874:	03800513          	li	a0,56
    80003878:	fffff097          	auipc	ra,0xfffff
    8000387c:	f00080e7          	jalr	-256(ra) # 80002778 <_Znwm>
    80003880:	00050a13          	mv	s4,a0
    80003884:	00048593          	mv	a1,s1
    80003888:	00003097          	auipc	ra,0x3
    8000388c:	080080e7          	jalr	128(ra) # 80006908 <_ZN6BufferC1Ei>
    80003890:	0300006f          	j	800038c0 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003894:	00007517          	auipc	a0,0x7
    80003898:	9dc50513          	addi	a0,a0,-1572 # 8000a270 <CONSOLE_STATUS+0x260>
    8000389c:	00002097          	auipc	ra,0x2
    800038a0:	13c080e7          	jalr	316(ra) # 800059d8 <_Z11printStringPKc>
        return;
    800038a4:	0140006f          	j	800038b8 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800038a8:	00007517          	auipc	a0,0x7
    800038ac:	a0850513          	addi	a0,a0,-1528 # 8000a2b0 <CONSOLE_STATUS+0x2a0>
    800038b0:	00002097          	auipc	ra,0x2
    800038b4:	128080e7          	jalr	296(ra) # 800059d8 <_Z11printStringPKc>
        return;
    800038b8:	000b0113          	mv	sp,s6
    800038bc:	1500006f          	j	80003a0c <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    800038c0:	00000593          	li	a1,0
    800038c4:	00009517          	auipc	a0,0x9
    800038c8:	4d450513          	addi	a0,a0,1236 # 8000cd98 <_ZL10waitForAll>
    800038cc:	ffffe097          	auipc	ra,0xffffe
    800038d0:	be0080e7          	jalr	-1056(ra) # 800014ac <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    800038d4:	00391793          	slli	a5,s2,0x3
    800038d8:	00f78793          	addi	a5,a5,15
    800038dc:	ff07f793          	andi	a5,a5,-16
    800038e0:	40f10133          	sub	sp,sp,a5
    800038e4:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800038e8:	0019071b          	addiw	a4,s2,1
    800038ec:	00171793          	slli	a5,a4,0x1
    800038f0:	00e787b3          	add	a5,a5,a4
    800038f4:	00379793          	slli	a5,a5,0x3
    800038f8:	00f78793          	addi	a5,a5,15
    800038fc:	ff07f793          	andi	a5,a5,-16
    80003900:	40f10133          	sub	sp,sp,a5
    80003904:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003908:	00191613          	slli	a2,s2,0x1
    8000390c:	012607b3          	add	a5,a2,s2
    80003910:	00379793          	slli	a5,a5,0x3
    80003914:	00f987b3          	add	a5,s3,a5
    80003918:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    8000391c:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003920:	00009717          	auipc	a4,0x9
    80003924:	47873703          	ld	a4,1144(a4) # 8000cd98 <_ZL10waitForAll>
    80003928:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    8000392c:	00078613          	mv	a2,a5
    80003930:	00000597          	auipc	a1,0x0
    80003934:	d7458593          	addi	a1,a1,-652 # 800036a4 <_ZL8consumerPv>
    80003938:	f9840513          	addi	a0,s0,-104
    8000393c:	ffffe097          	auipc	ra,0xffffe
    80003940:	a3c080e7          	jalr	-1476(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003944:	00000493          	li	s1,0
    80003948:	0280006f          	j	80003970 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    8000394c:	00000597          	auipc	a1,0x0
    80003950:	c1458593          	addi	a1,a1,-1004 # 80003560 <_ZL16producerKeyboardPv>
                      data + i);
    80003954:	00179613          	slli	a2,a5,0x1
    80003958:	00f60633          	add	a2,a2,a5
    8000395c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003960:	00c98633          	add	a2,s3,a2
    80003964:	ffffe097          	auipc	ra,0xffffe
    80003968:	a14080e7          	jalr	-1516(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000396c:	0014849b          	addiw	s1,s1,1
    80003970:	0524d263          	bge	s1,s2,800039b4 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003974:	00149793          	slli	a5,s1,0x1
    80003978:	009787b3          	add	a5,a5,s1
    8000397c:	00379793          	slli	a5,a5,0x3
    80003980:	00f987b3          	add	a5,s3,a5
    80003984:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003988:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    8000398c:	00009717          	auipc	a4,0x9
    80003990:	40c73703          	ld	a4,1036(a4) # 8000cd98 <_ZL10waitForAll>
    80003994:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003998:	00048793          	mv	a5,s1
    8000399c:	00349513          	slli	a0,s1,0x3
    800039a0:	00aa8533          	add	a0,s5,a0
    800039a4:	fa9054e3          	blez	s1,8000394c <_Z22producerConsumer_C_APIv+0x1c8>
    800039a8:	00000597          	auipc	a1,0x0
    800039ac:	c6858593          	addi	a1,a1,-920 # 80003610 <_ZL8producerPv>
    800039b0:	fa5ff06f          	j	80003954 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800039b4:	ffffe097          	auipc	ra,0xffffe
    800039b8:	a80080e7          	jalr	-1408(ra) # 80001434 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    800039bc:	00000493          	li	s1,0
    800039c0:	00994e63          	blt	s2,s1,800039dc <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    800039c4:	00009517          	auipc	a0,0x9
    800039c8:	3d453503          	ld	a0,980(a0) # 8000cd98 <_ZL10waitForAll>
    800039cc:	ffffe097          	auipc	ra,0xffffe
    800039d0:	b48080e7          	jalr	-1208(ra) # 80001514 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    800039d4:	0014849b          	addiw	s1,s1,1
    800039d8:	fe9ff06f          	j	800039c0 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    800039dc:	00009517          	auipc	a0,0x9
    800039e0:	3bc53503          	ld	a0,956(a0) # 8000cd98 <_ZL10waitForAll>
    800039e4:	ffffe097          	auipc	ra,0xffffe
    800039e8:	b00080e7          	jalr	-1280(ra) # 800014e4 <_Z9sem_closeP4KSem>
    delete buffer;
    800039ec:	000a0e63          	beqz	s4,80003a08 <_Z22producerConsumer_C_APIv+0x284>
    800039f0:	000a0513          	mv	a0,s4
    800039f4:	00003097          	auipc	ra,0x3
    800039f8:	154080e7          	jalr	340(ra) # 80006b48 <_ZN6BufferD1Ev>
    800039fc:	000a0513          	mv	a0,s4
    80003a00:	fffff097          	auipc	ra,0xfffff
    80003a04:	dc8080e7          	jalr	-568(ra) # 800027c8 <_ZdlPv>
    80003a08:	000b0113          	mv	sp,s6

}
    80003a0c:	f9040113          	addi	sp,s0,-112
    80003a10:	06813083          	ld	ra,104(sp)
    80003a14:	06013403          	ld	s0,96(sp)
    80003a18:	05813483          	ld	s1,88(sp)
    80003a1c:	05013903          	ld	s2,80(sp)
    80003a20:	04813983          	ld	s3,72(sp)
    80003a24:	04013a03          	ld	s4,64(sp)
    80003a28:	03813a83          	ld	s5,56(sp)
    80003a2c:	03013b03          	ld	s6,48(sp)
    80003a30:	07010113          	addi	sp,sp,112
    80003a34:	00008067          	ret
    80003a38:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003a3c:	000a0513          	mv	a0,s4
    80003a40:	fffff097          	auipc	ra,0xfffff
    80003a44:	d88080e7          	jalr	-632(ra) # 800027c8 <_ZdlPv>
    80003a48:	00048513          	mv	a0,s1
    80003a4c:	0000a097          	auipc	ra,0xa
    80003a50:	47c080e7          	jalr	1148(ra) # 8000dec8 <_Unwind_Resume>

0000000080003a54 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003a54:	fe010113          	addi	sp,sp,-32
    80003a58:	00113c23          	sd	ra,24(sp)
    80003a5c:	00813823          	sd	s0,16(sp)
    80003a60:	00913423          	sd	s1,8(sp)
    80003a64:	01213023          	sd	s2,0(sp)
    80003a68:	02010413          	addi	s0,sp,32
    80003a6c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003a70:	00100793          	li	a5,1
    80003a74:	02a7f863          	bgeu	a5,a0,80003aa4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003a78:	00a00793          	li	a5,10
    80003a7c:	02f577b3          	remu	a5,a0,a5
    80003a80:	02078e63          	beqz	a5,80003abc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003a84:	fff48513          	addi	a0,s1,-1
    80003a88:	00000097          	auipc	ra,0x0
    80003a8c:	fcc080e7          	jalr	-52(ra) # 80003a54 <_ZL9fibonaccim>
    80003a90:	00050913          	mv	s2,a0
    80003a94:	ffe48513          	addi	a0,s1,-2
    80003a98:	00000097          	auipc	ra,0x0
    80003a9c:	fbc080e7          	jalr	-68(ra) # 80003a54 <_ZL9fibonaccim>
    80003aa0:	00a90533          	add	a0,s2,a0
}
    80003aa4:	01813083          	ld	ra,24(sp)
    80003aa8:	01013403          	ld	s0,16(sp)
    80003aac:	00813483          	ld	s1,8(sp)
    80003ab0:	00013903          	ld	s2,0(sp)
    80003ab4:	02010113          	addi	sp,sp,32
    80003ab8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003abc:	ffffe097          	auipc	ra,0xffffe
    80003ac0:	978080e7          	jalr	-1672(ra) # 80001434 <_Z15thread_dispatchv>
    80003ac4:	fc1ff06f          	j	80003a84 <_ZL9fibonaccim+0x30>

0000000080003ac8 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003ac8:	fe010113          	addi	sp,sp,-32
    80003acc:	00113c23          	sd	ra,24(sp)
    80003ad0:	00813823          	sd	s0,16(sp)
    80003ad4:	00913423          	sd	s1,8(sp)
    80003ad8:	01213023          	sd	s2,0(sp)
    80003adc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003ae0:	00000913          	li	s2,0
    80003ae4:	0380006f          	j	80003b1c <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003ae8:	ffffe097          	auipc	ra,0xffffe
    80003aec:	94c080e7          	jalr	-1716(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003af0:	00148493          	addi	s1,s1,1
    80003af4:	000027b7          	lui	a5,0x2
    80003af8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003afc:	0097ee63          	bltu	a5,s1,80003b18 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003b00:	00000713          	li	a4,0
    80003b04:	000077b7          	lui	a5,0x7
    80003b08:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003b0c:	fce7eee3          	bltu	a5,a4,80003ae8 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003b10:	00170713          	addi	a4,a4,1
    80003b14:	ff1ff06f          	j	80003b04 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003b18:	00190913          	addi	s2,s2,1
    80003b1c:	00900793          	li	a5,9
    80003b20:	0527e063          	bltu	a5,s2,80003b60 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003b24:	00006517          	auipc	a0,0x6
    80003b28:	7bc50513          	addi	a0,a0,1980 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80003b2c:	00002097          	auipc	ra,0x2
    80003b30:	eac080e7          	jalr	-340(ra) # 800059d8 <_Z11printStringPKc>
    80003b34:	00000613          	li	a2,0
    80003b38:	00a00593          	li	a1,10
    80003b3c:	0009051b          	sext.w	a0,s2
    80003b40:	00002097          	auipc	ra,0x2
    80003b44:	048080e7          	jalr	72(ra) # 80005b88 <_Z8printIntiii>
    80003b48:	00007517          	auipc	a0,0x7
    80003b4c:	9f850513          	addi	a0,a0,-1544 # 8000a540 <CONSOLE_STATUS+0x530>
    80003b50:	00002097          	auipc	ra,0x2
    80003b54:	e88080e7          	jalr	-376(ra) # 800059d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003b58:	00000493          	li	s1,0
    80003b5c:	f99ff06f          	j	80003af4 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003b60:	00006517          	auipc	a0,0x6
    80003b64:	78850513          	addi	a0,a0,1928 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    80003b68:	00002097          	auipc	ra,0x2
    80003b6c:	e70080e7          	jalr	-400(ra) # 800059d8 <_Z11printStringPKc>
    finishedA = true;
    80003b70:	00100793          	li	a5,1
    80003b74:	00009717          	auipc	a4,0x9
    80003b78:	22f70623          	sb	a5,556(a4) # 8000cda0 <_ZL9finishedA>
}
    80003b7c:	01813083          	ld	ra,24(sp)
    80003b80:	01013403          	ld	s0,16(sp)
    80003b84:	00813483          	ld	s1,8(sp)
    80003b88:	00013903          	ld	s2,0(sp)
    80003b8c:	02010113          	addi	sp,sp,32
    80003b90:	00008067          	ret

0000000080003b94 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003b94:	fe010113          	addi	sp,sp,-32
    80003b98:	00113c23          	sd	ra,24(sp)
    80003b9c:	00813823          	sd	s0,16(sp)
    80003ba0:	00913423          	sd	s1,8(sp)
    80003ba4:	01213023          	sd	s2,0(sp)
    80003ba8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003bac:	00000913          	li	s2,0
    80003bb0:	0380006f          	j	80003be8 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003bb4:	ffffe097          	auipc	ra,0xffffe
    80003bb8:	880080e7          	jalr	-1920(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003bbc:	00148493          	addi	s1,s1,1
    80003bc0:	000027b7          	lui	a5,0x2
    80003bc4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003bc8:	0097ee63          	bltu	a5,s1,80003be4 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003bcc:	00000713          	li	a4,0
    80003bd0:	000077b7          	lui	a5,0x7
    80003bd4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003bd8:	fce7eee3          	bltu	a5,a4,80003bb4 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003bdc:	00170713          	addi	a4,a4,1
    80003be0:	ff1ff06f          	j	80003bd0 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003be4:	00190913          	addi	s2,s2,1
    80003be8:	00f00793          	li	a5,15
    80003bec:	0527e063          	bltu	a5,s2,80003c2c <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003bf0:	00006517          	auipc	a0,0x6
    80003bf4:	70850513          	addi	a0,a0,1800 # 8000a2f8 <CONSOLE_STATUS+0x2e8>
    80003bf8:	00002097          	auipc	ra,0x2
    80003bfc:	de0080e7          	jalr	-544(ra) # 800059d8 <_Z11printStringPKc>
    80003c00:	00000613          	li	a2,0
    80003c04:	00a00593          	li	a1,10
    80003c08:	0009051b          	sext.w	a0,s2
    80003c0c:	00002097          	auipc	ra,0x2
    80003c10:	f7c080e7          	jalr	-132(ra) # 80005b88 <_Z8printIntiii>
    80003c14:	00007517          	auipc	a0,0x7
    80003c18:	92c50513          	addi	a0,a0,-1748 # 8000a540 <CONSOLE_STATUS+0x530>
    80003c1c:	00002097          	auipc	ra,0x2
    80003c20:	dbc080e7          	jalr	-580(ra) # 800059d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003c24:	00000493          	li	s1,0
    80003c28:	f99ff06f          	j	80003bc0 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003c2c:	00006517          	auipc	a0,0x6
    80003c30:	6d450513          	addi	a0,a0,1748 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80003c34:	00002097          	auipc	ra,0x2
    80003c38:	da4080e7          	jalr	-604(ra) # 800059d8 <_Z11printStringPKc>
    finishedB = true;
    80003c3c:	00100793          	li	a5,1
    80003c40:	00009717          	auipc	a4,0x9
    80003c44:	16f700a3          	sb	a5,353(a4) # 8000cda1 <_ZL9finishedB>
    thread_dispatch();
    80003c48:	ffffd097          	auipc	ra,0xffffd
    80003c4c:	7ec080e7          	jalr	2028(ra) # 80001434 <_Z15thread_dispatchv>
}
    80003c50:	01813083          	ld	ra,24(sp)
    80003c54:	01013403          	ld	s0,16(sp)
    80003c58:	00813483          	ld	s1,8(sp)
    80003c5c:	00013903          	ld	s2,0(sp)
    80003c60:	02010113          	addi	sp,sp,32
    80003c64:	00008067          	ret

0000000080003c68 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003c68:	fe010113          	addi	sp,sp,-32
    80003c6c:	00113c23          	sd	ra,24(sp)
    80003c70:	00813823          	sd	s0,16(sp)
    80003c74:	00913423          	sd	s1,8(sp)
    80003c78:	01213023          	sd	s2,0(sp)
    80003c7c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003c80:	00000493          	li	s1,0
    80003c84:	0400006f          	j	80003cc4 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003c88:	00006517          	auipc	a0,0x6
    80003c8c:	68850513          	addi	a0,a0,1672 # 8000a310 <CONSOLE_STATUS+0x300>
    80003c90:	00002097          	auipc	ra,0x2
    80003c94:	d48080e7          	jalr	-696(ra) # 800059d8 <_Z11printStringPKc>
    80003c98:	00000613          	li	a2,0
    80003c9c:	00a00593          	li	a1,10
    80003ca0:	00048513          	mv	a0,s1
    80003ca4:	00002097          	auipc	ra,0x2
    80003ca8:	ee4080e7          	jalr	-284(ra) # 80005b88 <_Z8printIntiii>
    80003cac:	00007517          	auipc	a0,0x7
    80003cb0:	89450513          	addi	a0,a0,-1900 # 8000a540 <CONSOLE_STATUS+0x530>
    80003cb4:	00002097          	auipc	ra,0x2
    80003cb8:	d24080e7          	jalr	-732(ra) # 800059d8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003cbc:	0014849b          	addiw	s1,s1,1
    80003cc0:	0ff4f493          	andi	s1,s1,255
    80003cc4:	00200793          	li	a5,2
    80003cc8:	fc97f0e3          	bgeu	a5,s1,80003c88 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003ccc:	00006517          	auipc	a0,0x6
    80003cd0:	64c50513          	addi	a0,a0,1612 # 8000a318 <CONSOLE_STATUS+0x308>
    80003cd4:	00002097          	auipc	ra,0x2
    80003cd8:	d04080e7          	jalr	-764(ra) # 800059d8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003cdc:	00700313          	li	t1,7
    thread_dispatch();
    80003ce0:	ffffd097          	auipc	ra,0xffffd
    80003ce4:	754080e7          	jalr	1876(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003ce8:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003cec:	00006517          	auipc	a0,0x6
    80003cf0:	63c50513          	addi	a0,a0,1596 # 8000a328 <CONSOLE_STATUS+0x318>
    80003cf4:	00002097          	auipc	ra,0x2
    80003cf8:	ce4080e7          	jalr	-796(ra) # 800059d8 <_Z11printStringPKc>
    80003cfc:	00000613          	li	a2,0
    80003d00:	00a00593          	li	a1,10
    80003d04:	0009051b          	sext.w	a0,s2
    80003d08:	00002097          	auipc	ra,0x2
    80003d0c:	e80080e7          	jalr	-384(ra) # 80005b88 <_Z8printIntiii>
    80003d10:	00007517          	auipc	a0,0x7
    80003d14:	83050513          	addi	a0,a0,-2000 # 8000a540 <CONSOLE_STATUS+0x530>
    80003d18:	00002097          	auipc	ra,0x2
    80003d1c:	cc0080e7          	jalr	-832(ra) # 800059d8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003d20:	00c00513          	li	a0,12
    80003d24:	00000097          	auipc	ra,0x0
    80003d28:	d30080e7          	jalr	-720(ra) # 80003a54 <_ZL9fibonaccim>
    80003d2c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003d30:	00006517          	auipc	a0,0x6
    80003d34:	60050513          	addi	a0,a0,1536 # 8000a330 <CONSOLE_STATUS+0x320>
    80003d38:	00002097          	auipc	ra,0x2
    80003d3c:	ca0080e7          	jalr	-864(ra) # 800059d8 <_Z11printStringPKc>
    80003d40:	00000613          	li	a2,0
    80003d44:	00a00593          	li	a1,10
    80003d48:	0009051b          	sext.w	a0,s2
    80003d4c:	00002097          	auipc	ra,0x2
    80003d50:	e3c080e7          	jalr	-452(ra) # 80005b88 <_Z8printIntiii>
    80003d54:	00006517          	auipc	a0,0x6
    80003d58:	7ec50513          	addi	a0,a0,2028 # 8000a540 <CONSOLE_STATUS+0x530>
    80003d5c:	00002097          	auipc	ra,0x2
    80003d60:	c7c080e7          	jalr	-900(ra) # 800059d8 <_Z11printStringPKc>
    80003d64:	0400006f          	j	80003da4 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003d68:	00006517          	auipc	a0,0x6
    80003d6c:	5a850513          	addi	a0,a0,1448 # 8000a310 <CONSOLE_STATUS+0x300>
    80003d70:	00002097          	auipc	ra,0x2
    80003d74:	c68080e7          	jalr	-920(ra) # 800059d8 <_Z11printStringPKc>
    80003d78:	00000613          	li	a2,0
    80003d7c:	00a00593          	li	a1,10
    80003d80:	00048513          	mv	a0,s1
    80003d84:	00002097          	auipc	ra,0x2
    80003d88:	e04080e7          	jalr	-508(ra) # 80005b88 <_Z8printIntiii>
    80003d8c:	00006517          	auipc	a0,0x6
    80003d90:	7b450513          	addi	a0,a0,1972 # 8000a540 <CONSOLE_STATUS+0x530>
    80003d94:	00002097          	auipc	ra,0x2
    80003d98:	c44080e7          	jalr	-956(ra) # 800059d8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003d9c:	0014849b          	addiw	s1,s1,1
    80003da0:	0ff4f493          	andi	s1,s1,255
    80003da4:	00500793          	li	a5,5
    80003da8:	fc97f0e3          	bgeu	a5,s1,80003d68 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80003dac:	00006517          	auipc	a0,0x6
    80003db0:	59450513          	addi	a0,a0,1428 # 8000a340 <CONSOLE_STATUS+0x330>
    80003db4:	00002097          	auipc	ra,0x2
    80003db8:	c24080e7          	jalr	-988(ra) # 800059d8 <_Z11printStringPKc>
    finishedC = true;
    80003dbc:	00100793          	li	a5,1
    80003dc0:	00009717          	auipc	a4,0x9
    80003dc4:	fef70123          	sb	a5,-30(a4) # 8000cda2 <_ZL9finishedC>
    thread_dispatch();
    80003dc8:	ffffd097          	auipc	ra,0xffffd
    80003dcc:	66c080e7          	jalr	1644(ra) # 80001434 <_Z15thread_dispatchv>
}
    80003dd0:	01813083          	ld	ra,24(sp)
    80003dd4:	01013403          	ld	s0,16(sp)
    80003dd8:	00813483          	ld	s1,8(sp)
    80003ddc:	00013903          	ld	s2,0(sp)
    80003de0:	02010113          	addi	sp,sp,32
    80003de4:	00008067          	ret

0000000080003de8 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003de8:	fe010113          	addi	sp,sp,-32
    80003dec:	00113c23          	sd	ra,24(sp)
    80003df0:	00813823          	sd	s0,16(sp)
    80003df4:	00913423          	sd	s1,8(sp)
    80003df8:	01213023          	sd	s2,0(sp)
    80003dfc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003e00:	00a00493          	li	s1,10
    80003e04:	0400006f          	j	80003e44 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003e08:	00006517          	auipc	a0,0x6
    80003e0c:	54850513          	addi	a0,a0,1352 # 8000a350 <CONSOLE_STATUS+0x340>
    80003e10:	00002097          	auipc	ra,0x2
    80003e14:	bc8080e7          	jalr	-1080(ra) # 800059d8 <_Z11printStringPKc>
    80003e18:	00000613          	li	a2,0
    80003e1c:	00a00593          	li	a1,10
    80003e20:	00048513          	mv	a0,s1
    80003e24:	00002097          	auipc	ra,0x2
    80003e28:	d64080e7          	jalr	-668(ra) # 80005b88 <_Z8printIntiii>
    80003e2c:	00006517          	auipc	a0,0x6
    80003e30:	71450513          	addi	a0,a0,1812 # 8000a540 <CONSOLE_STATUS+0x530>
    80003e34:	00002097          	auipc	ra,0x2
    80003e38:	ba4080e7          	jalr	-1116(ra) # 800059d8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003e3c:	0014849b          	addiw	s1,s1,1
    80003e40:	0ff4f493          	andi	s1,s1,255
    80003e44:	00c00793          	li	a5,12
    80003e48:	fc97f0e3          	bgeu	a5,s1,80003e08 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003e4c:	00006517          	auipc	a0,0x6
    80003e50:	50c50513          	addi	a0,a0,1292 # 8000a358 <CONSOLE_STATUS+0x348>
    80003e54:	00002097          	auipc	ra,0x2
    80003e58:	b84080e7          	jalr	-1148(ra) # 800059d8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003e5c:	00500313          	li	t1,5
    thread_dispatch();
    80003e60:	ffffd097          	auipc	ra,0xffffd
    80003e64:	5d4080e7          	jalr	1492(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003e68:	01000513          	li	a0,16
    80003e6c:	00000097          	auipc	ra,0x0
    80003e70:	be8080e7          	jalr	-1048(ra) # 80003a54 <_ZL9fibonaccim>
    80003e74:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003e78:	00006517          	auipc	a0,0x6
    80003e7c:	4f050513          	addi	a0,a0,1264 # 8000a368 <CONSOLE_STATUS+0x358>
    80003e80:	00002097          	auipc	ra,0x2
    80003e84:	b58080e7          	jalr	-1192(ra) # 800059d8 <_Z11printStringPKc>
    80003e88:	00000613          	li	a2,0
    80003e8c:	00a00593          	li	a1,10
    80003e90:	0009051b          	sext.w	a0,s2
    80003e94:	00002097          	auipc	ra,0x2
    80003e98:	cf4080e7          	jalr	-780(ra) # 80005b88 <_Z8printIntiii>
    80003e9c:	00006517          	auipc	a0,0x6
    80003ea0:	6a450513          	addi	a0,a0,1700 # 8000a540 <CONSOLE_STATUS+0x530>
    80003ea4:	00002097          	auipc	ra,0x2
    80003ea8:	b34080e7          	jalr	-1228(ra) # 800059d8 <_Z11printStringPKc>
    80003eac:	0400006f          	j	80003eec <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003eb0:	00006517          	auipc	a0,0x6
    80003eb4:	4a050513          	addi	a0,a0,1184 # 8000a350 <CONSOLE_STATUS+0x340>
    80003eb8:	00002097          	auipc	ra,0x2
    80003ebc:	b20080e7          	jalr	-1248(ra) # 800059d8 <_Z11printStringPKc>
    80003ec0:	00000613          	li	a2,0
    80003ec4:	00a00593          	li	a1,10
    80003ec8:	00048513          	mv	a0,s1
    80003ecc:	00002097          	auipc	ra,0x2
    80003ed0:	cbc080e7          	jalr	-836(ra) # 80005b88 <_Z8printIntiii>
    80003ed4:	00006517          	auipc	a0,0x6
    80003ed8:	66c50513          	addi	a0,a0,1644 # 8000a540 <CONSOLE_STATUS+0x530>
    80003edc:	00002097          	auipc	ra,0x2
    80003ee0:	afc080e7          	jalr	-1284(ra) # 800059d8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003ee4:	0014849b          	addiw	s1,s1,1
    80003ee8:	0ff4f493          	andi	s1,s1,255
    80003eec:	00f00793          	li	a5,15
    80003ef0:	fc97f0e3          	bgeu	a5,s1,80003eb0 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003ef4:	00006517          	auipc	a0,0x6
    80003ef8:	48450513          	addi	a0,a0,1156 # 8000a378 <CONSOLE_STATUS+0x368>
    80003efc:	00002097          	auipc	ra,0x2
    80003f00:	adc080e7          	jalr	-1316(ra) # 800059d8 <_Z11printStringPKc>
    finishedD = true;
    80003f04:	00100793          	li	a5,1
    80003f08:	00009717          	auipc	a4,0x9
    80003f0c:	e8f70da3          	sb	a5,-357(a4) # 8000cda3 <_ZL9finishedD>
    thread_dispatch();
    80003f10:	ffffd097          	auipc	ra,0xffffd
    80003f14:	524080e7          	jalr	1316(ra) # 80001434 <_Z15thread_dispatchv>
}
    80003f18:	01813083          	ld	ra,24(sp)
    80003f1c:	01013403          	ld	s0,16(sp)
    80003f20:	00813483          	ld	s1,8(sp)
    80003f24:	00013903          	ld	s2,0(sp)
    80003f28:	02010113          	addi	sp,sp,32
    80003f2c:	00008067          	ret

0000000080003f30 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003f30:	fc010113          	addi	sp,sp,-64
    80003f34:	02113c23          	sd	ra,56(sp)
    80003f38:	02813823          	sd	s0,48(sp)
    80003f3c:	02913423          	sd	s1,40(sp)
    80003f40:	03213023          	sd	s2,32(sp)
    80003f44:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003f48:	02000513          	li	a0,32
    80003f4c:	fffff097          	auipc	ra,0xfffff
    80003f50:	82c080e7          	jalr	-2004(ra) # 80002778 <_Znwm>
    80003f54:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003f58:	fffff097          	auipc	ra,0xfffff
    80003f5c:	af8080e7          	jalr	-1288(ra) # 80002a50 <_ZN6ThreadC1Ev>
    80003f60:	00009797          	auipc	a5,0x9
    80003f64:	a5078793          	addi	a5,a5,-1456 # 8000c9b0 <_ZTV7WorkerA+0x10>
    80003f68:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003f6c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003f70:	00006517          	auipc	a0,0x6
    80003f74:	41850513          	addi	a0,a0,1048 # 8000a388 <CONSOLE_STATUS+0x378>
    80003f78:	00002097          	auipc	ra,0x2
    80003f7c:	a60080e7          	jalr	-1440(ra) # 800059d8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003f80:	02000513          	li	a0,32
    80003f84:	ffffe097          	auipc	ra,0xffffe
    80003f88:	7f4080e7          	jalr	2036(ra) # 80002778 <_Znwm>
    80003f8c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003f90:	fffff097          	auipc	ra,0xfffff
    80003f94:	ac0080e7          	jalr	-1344(ra) # 80002a50 <_ZN6ThreadC1Ev>
    80003f98:	00009797          	auipc	a5,0x9
    80003f9c:	a4078793          	addi	a5,a5,-1472 # 8000c9d8 <_ZTV7WorkerB+0x10>
    80003fa0:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003fa4:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003fa8:	00006517          	auipc	a0,0x6
    80003fac:	3f850513          	addi	a0,a0,1016 # 8000a3a0 <CONSOLE_STATUS+0x390>
    80003fb0:	00002097          	auipc	ra,0x2
    80003fb4:	a28080e7          	jalr	-1496(ra) # 800059d8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003fb8:	02000513          	li	a0,32
    80003fbc:	ffffe097          	auipc	ra,0xffffe
    80003fc0:	7bc080e7          	jalr	1980(ra) # 80002778 <_Znwm>
    80003fc4:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003fc8:	fffff097          	auipc	ra,0xfffff
    80003fcc:	a88080e7          	jalr	-1400(ra) # 80002a50 <_ZN6ThreadC1Ev>
    80003fd0:	00009797          	auipc	a5,0x9
    80003fd4:	a3078793          	addi	a5,a5,-1488 # 8000ca00 <_ZTV7WorkerC+0x10>
    80003fd8:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003fdc:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003fe0:	00006517          	auipc	a0,0x6
    80003fe4:	3d850513          	addi	a0,a0,984 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    80003fe8:	00002097          	auipc	ra,0x2
    80003fec:	9f0080e7          	jalr	-1552(ra) # 800059d8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80003ff0:	02000513          	li	a0,32
    80003ff4:	ffffe097          	auipc	ra,0xffffe
    80003ff8:	784080e7          	jalr	1924(ra) # 80002778 <_Znwm>
    80003ffc:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004000:	fffff097          	auipc	ra,0xfffff
    80004004:	a50080e7          	jalr	-1456(ra) # 80002a50 <_ZN6ThreadC1Ev>
    80004008:	00009797          	auipc	a5,0x9
    8000400c:	a2078793          	addi	a5,a5,-1504 # 8000ca28 <_ZTV7WorkerD+0x10>
    80004010:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004014:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004018:	00006517          	auipc	a0,0x6
    8000401c:	3b850513          	addi	a0,a0,952 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80004020:	00002097          	auipc	ra,0x2
    80004024:	9b8080e7          	jalr	-1608(ra) # 800059d8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004028:	00000493          	li	s1,0
    8000402c:	00300793          	li	a5,3
    80004030:	0297c663          	blt	a5,s1,8000405c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004034:	00349793          	slli	a5,s1,0x3
    80004038:	fe040713          	addi	a4,s0,-32
    8000403c:	00f707b3          	add	a5,a4,a5
    80004040:	fe07b503          	ld	a0,-32(a5)
    80004044:	fffff097          	auipc	ra,0xfffff
    80004048:	8ec080e7          	jalr	-1812(ra) # 80002930 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    8000404c:	0014849b          	addiw	s1,s1,1
    80004050:	fddff06f          	j	8000402c <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004054:	fffff097          	auipc	ra,0xfffff
    80004058:	940080e7          	jalr	-1728(ra) # 80002994 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000405c:	00009797          	auipc	a5,0x9
    80004060:	d447c783          	lbu	a5,-700(a5) # 8000cda0 <_ZL9finishedA>
    80004064:	fe0788e3          	beqz	a5,80004054 <_Z20Threads_CPP_API_testv+0x124>
    80004068:	00009797          	auipc	a5,0x9
    8000406c:	d397c783          	lbu	a5,-711(a5) # 8000cda1 <_ZL9finishedB>
    80004070:	fe0782e3          	beqz	a5,80004054 <_Z20Threads_CPP_API_testv+0x124>
    80004074:	00009797          	auipc	a5,0x9
    80004078:	d2e7c783          	lbu	a5,-722(a5) # 8000cda2 <_ZL9finishedC>
    8000407c:	fc078ce3          	beqz	a5,80004054 <_Z20Threads_CPP_API_testv+0x124>
    80004080:	00009797          	auipc	a5,0x9
    80004084:	d237c783          	lbu	a5,-733(a5) # 8000cda3 <_ZL9finishedD>
    80004088:	fc0786e3          	beqz	a5,80004054 <_Z20Threads_CPP_API_testv+0x124>
    8000408c:	fc040493          	addi	s1,s0,-64
    80004090:	0080006f          	j	80004098 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    80004094:	00848493          	addi	s1,s1,8
    80004098:	fe040793          	addi	a5,s0,-32
    8000409c:	08f48663          	beq	s1,a5,80004128 <_Z20Threads_CPP_API_testv+0x1f8>
    800040a0:	0004b503          	ld	a0,0(s1)
		delete thread;
    800040a4:	fe0508e3          	beqz	a0,80004094 <_Z20Threads_CPP_API_testv+0x164>
    800040a8:	00053783          	ld	a5,0(a0)
    800040ac:	0087b783          	ld	a5,8(a5)
    800040b0:	000780e7          	jalr	a5
    800040b4:	fe1ff06f          	j	80004094 <_Z20Threads_CPP_API_testv+0x164>
    800040b8:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800040bc:	00048513          	mv	a0,s1
    800040c0:	ffffe097          	auipc	ra,0xffffe
    800040c4:	708080e7          	jalr	1800(ra) # 800027c8 <_ZdlPv>
    800040c8:	00090513          	mv	a0,s2
    800040cc:	0000a097          	auipc	ra,0xa
    800040d0:	dfc080e7          	jalr	-516(ra) # 8000dec8 <_Unwind_Resume>
    800040d4:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800040d8:	00048513          	mv	a0,s1
    800040dc:	ffffe097          	auipc	ra,0xffffe
    800040e0:	6ec080e7          	jalr	1772(ra) # 800027c8 <_ZdlPv>
    800040e4:	00090513          	mv	a0,s2
    800040e8:	0000a097          	auipc	ra,0xa
    800040ec:	de0080e7          	jalr	-544(ra) # 8000dec8 <_Unwind_Resume>
    800040f0:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800040f4:	00048513          	mv	a0,s1
    800040f8:	ffffe097          	auipc	ra,0xffffe
    800040fc:	6d0080e7          	jalr	1744(ra) # 800027c8 <_ZdlPv>
    80004100:	00090513          	mv	a0,s2
    80004104:	0000a097          	auipc	ra,0xa
    80004108:	dc4080e7          	jalr	-572(ra) # 8000dec8 <_Unwind_Resume>
    8000410c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004110:	00048513          	mv	a0,s1
    80004114:	ffffe097          	auipc	ra,0xffffe
    80004118:	6b4080e7          	jalr	1716(ra) # 800027c8 <_ZdlPv>
    8000411c:	00090513          	mv	a0,s2
    80004120:	0000a097          	auipc	ra,0xa
    80004124:	da8080e7          	jalr	-600(ra) # 8000dec8 <_Unwind_Resume>
	}
}
    80004128:	03813083          	ld	ra,56(sp)
    8000412c:	03013403          	ld	s0,48(sp)
    80004130:	02813483          	ld	s1,40(sp)
    80004134:	02013903          	ld	s2,32(sp)
    80004138:	04010113          	addi	sp,sp,64
    8000413c:	00008067          	ret

0000000080004140 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004140:	ff010113          	addi	sp,sp,-16
    80004144:	00113423          	sd	ra,8(sp)
    80004148:	00813023          	sd	s0,0(sp)
    8000414c:	01010413          	addi	s0,sp,16
    80004150:	00009797          	auipc	a5,0x9
    80004154:	86078793          	addi	a5,a5,-1952 # 8000c9b0 <_ZTV7WorkerA+0x10>
    80004158:	00f53023          	sd	a5,0(a0)
    8000415c:	ffffe097          	auipc	ra,0xffffe
    80004160:	52c080e7          	jalr	1324(ra) # 80002688 <_ZN6ThreadD1Ev>
    80004164:	00813083          	ld	ra,8(sp)
    80004168:	00013403          	ld	s0,0(sp)
    8000416c:	01010113          	addi	sp,sp,16
    80004170:	00008067          	ret

0000000080004174 <_ZN7WorkerAD0Ev>:
    80004174:	fe010113          	addi	sp,sp,-32
    80004178:	00113c23          	sd	ra,24(sp)
    8000417c:	00813823          	sd	s0,16(sp)
    80004180:	00913423          	sd	s1,8(sp)
    80004184:	02010413          	addi	s0,sp,32
    80004188:	00050493          	mv	s1,a0
    8000418c:	00009797          	auipc	a5,0x9
    80004190:	82478793          	addi	a5,a5,-2012 # 8000c9b0 <_ZTV7WorkerA+0x10>
    80004194:	00f53023          	sd	a5,0(a0)
    80004198:	ffffe097          	auipc	ra,0xffffe
    8000419c:	4f0080e7          	jalr	1264(ra) # 80002688 <_ZN6ThreadD1Ev>
    800041a0:	00048513          	mv	a0,s1
    800041a4:	ffffe097          	auipc	ra,0xffffe
    800041a8:	624080e7          	jalr	1572(ra) # 800027c8 <_ZdlPv>
    800041ac:	01813083          	ld	ra,24(sp)
    800041b0:	01013403          	ld	s0,16(sp)
    800041b4:	00813483          	ld	s1,8(sp)
    800041b8:	02010113          	addi	sp,sp,32
    800041bc:	00008067          	ret

00000000800041c0 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800041c0:	ff010113          	addi	sp,sp,-16
    800041c4:	00113423          	sd	ra,8(sp)
    800041c8:	00813023          	sd	s0,0(sp)
    800041cc:	01010413          	addi	s0,sp,16
    800041d0:	00009797          	auipc	a5,0x9
    800041d4:	80878793          	addi	a5,a5,-2040 # 8000c9d8 <_ZTV7WorkerB+0x10>
    800041d8:	00f53023          	sd	a5,0(a0)
    800041dc:	ffffe097          	auipc	ra,0xffffe
    800041e0:	4ac080e7          	jalr	1196(ra) # 80002688 <_ZN6ThreadD1Ev>
    800041e4:	00813083          	ld	ra,8(sp)
    800041e8:	00013403          	ld	s0,0(sp)
    800041ec:	01010113          	addi	sp,sp,16
    800041f0:	00008067          	ret

00000000800041f4 <_ZN7WorkerBD0Ev>:
    800041f4:	fe010113          	addi	sp,sp,-32
    800041f8:	00113c23          	sd	ra,24(sp)
    800041fc:	00813823          	sd	s0,16(sp)
    80004200:	00913423          	sd	s1,8(sp)
    80004204:	02010413          	addi	s0,sp,32
    80004208:	00050493          	mv	s1,a0
    8000420c:	00008797          	auipc	a5,0x8
    80004210:	7cc78793          	addi	a5,a5,1996 # 8000c9d8 <_ZTV7WorkerB+0x10>
    80004214:	00f53023          	sd	a5,0(a0)
    80004218:	ffffe097          	auipc	ra,0xffffe
    8000421c:	470080e7          	jalr	1136(ra) # 80002688 <_ZN6ThreadD1Ev>
    80004220:	00048513          	mv	a0,s1
    80004224:	ffffe097          	auipc	ra,0xffffe
    80004228:	5a4080e7          	jalr	1444(ra) # 800027c8 <_ZdlPv>
    8000422c:	01813083          	ld	ra,24(sp)
    80004230:	01013403          	ld	s0,16(sp)
    80004234:	00813483          	ld	s1,8(sp)
    80004238:	02010113          	addi	sp,sp,32
    8000423c:	00008067          	ret

0000000080004240 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004240:	ff010113          	addi	sp,sp,-16
    80004244:	00113423          	sd	ra,8(sp)
    80004248:	00813023          	sd	s0,0(sp)
    8000424c:	01010413          	addi	s0,sp,16
    80004250:	00008797          	auipc	a5,0x8
    80004254:	7b078793          	addi	a5,a5,1968 # 8000ca00 <_ZTV7WorkerC+0x10>
    80004258:	00f53023          	sd	a5,0(a0)
    8000425c:	ffffe097          	auipc	ra,0xffffe
    80004260:	42c080e7          	jalr	1068(ra) # 80002688 <_ZN6ThreadD1Ev>
    80004264:	00813083          	ld	ra,8(sp)
    80004268:	00013403          	ld	s0,0(sp)
    8000426c:	01010113          	addi	sp,sp,16
    80004270:	00008067          	ret

0000000080004274 <_ZN7WorkerCD0Ev>:
    80004274:	fe010113          	addi	sp,sp,-32
    80004278:	00113c23          	sd	ra,24(sp)
    8000427c:	00813823          	sd	s0,16(sp)
    80004280:	00913423          	sd	s1,8(sp)
    80004284:	02010413          	addi	s0,sp,32
    80004288:	00050493          	mv	s1,a0
    8000428c:	00008797          	auipc	a5,0x8
    80004290:	77478793          	addi	a5,a5,1908 # 8000ca00 <_ZTV7WorkerC+0x10>
    80004294:	00f53023          	sd	a5,0(a0)
    80004298:	ffffe097          	auipc	ra,0xffffe
    8000429c:	3f0080e7          	jalr	1008(ra) # 80002688 <_ZN6ThreadD1Ev>
    800042a0:	00048513          	mv	a0,s1
    800042a4:	ffffe097          	auipc	ra,0xffffe
    800042a8:	524080e7          	jalr	1316(ra) # 800027c8 <_ZdlPv>
    800042ac:	01813083          	ld	ra,24(sp)
    800042b0:	01013403          	ld	s0,16(sp)
    800042b4:	00813483          	ld	s1,8(sp)
    800042b8:	02010113          	addi	sp,sp,32
    800042bc:	00008067          	ret

00000000800042c0 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800042c0:	ff010113          	addi	sp,sp,-16
    800042c4:	00113423          	sd	ra,8(sp)
    800042c8:	00813023          	sd	s0,0(sp)
    800042cc:	01010413          	addi	s0,sp,16
    800042d0:	00008797          	auipc	a5,0x8
    800042d4:	75878793          	addi	a5,a5,1880 # 8000ca28 <_ZTV7WorkerD+0x10>
    800042d8:	00f53023          	sd	a5,0(a0)
    800042dc:	ffffe097          	auipc	ra,0xffffe
    800042e0:	3ac080e7          	jalr	940(ra) # 80002688 <_ZN6ThreadD1Ev>
    800042e4:	00813083          	ld	ra,8(sp)
    800042e8:	00013403          	ld	s0,0(sp)
    800042ec:	01010113          	addi	sp,sp,16
    800042f0:	00008067          	ret

00000000800042f4 <_ZN7WorkerDD0Ev>:
    800042f4:	fe010113          	addi	sp,sp,-32
    800042f8:	00113c23          	sd	ra,24(sp)
    800042fc:	00813823          	sd	s0,16(sp)
    80004300:	00913423          	sd	s1,8(sp)
    80004304:	02010413          	addi	s0,sp,32
    80004308:	00050493          	mv	s1,a0
    8000430c:	00008797          	auipc	a5,0x8
    80004310:	71c78793          	addi	a5,a5,1820 # 8000ca28 <_ZTV7WorkerD+0x10>
    80004314:	00f53023          	sd	a5,0(a0)
    80004318:	ffffe097          	auipc	ra,0xffffe
    8000431c:	370080e7          	jalr	880(ra) # 80002688 <_ZN6ThreadD1Ev>
    80004320:	00048513          	mv	a0,s1
    80004324:	ffffe097          	auipc	ra,0xffffe
    80004328:	4a4080e7          	jalr	1188(ra) # 800027c8 <_ZdlPv>
    8000432c:	01813083          	ld	ra,24(sp)
    80004330:	01013403          	ld	s0,16(sp)
    80004334:	00813483          	ld	s1,8(sp)
    80004338:	02010113          	addi	sp,sp,32
    8000433c:	00008067          	ret

0000000080004340 <_ZN7WorkerA3runEv>:
    void run() override {
    80004340:	ff010113          	addi	sp,sp,-16
    80004344:	00113423          	sd	ra,8(sp)
    80004348:	00813023          	sd	s0,0(sp)
    8000434c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004350:	00000593          	li	a1,0
    80004354:	fffff097          	auipc	ra,0xfffff
    80004358:	774080e7          	jalr	1908(ra) # 80003ac8 <_ZN7WorkerA11workerBodyAEPv>
    }
    8000435c:	00813083          	ld	ra,8(sp)
    80004360:	00013403          	ld	s0,0(sp)
    80004364:	01010113          	addi	sp,sp,16
    80004368:	00008067          	ret

000000008000436c <_ZN7WorkerB3runEv>:
    void run() override {
    8000436c:	ff010113          	addi	sp,sp,-16
    80004370:	00113423          	sd	ra,8(sp)
    80004374:	00813023          	sd	s0,0(sp)
    80004378:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    8000437c:	00000593          	li	a1,0
    80004380:	00000097          	auipc	ra,0x0
    80004384:	814080e7          	jalr	-2028(ra) # 80003b94 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004388:	00813083          	ld	ra,8(sp)
    8000438c:	00013403          	ld	s0,0(sp)
    80004390:	01010113          	addi	sp,sp,16
    80004394:	00008067          	ret

0000000080004398 <_ZN7WorkerC3runEv>:
    void run() override {
    80004398:	ff010113          	addi	sp,sp,-16
    8000439c:	00113423          	sd	ra,8(sp)
    800043a0:	00813023          	sd	s0,0(sp)
    800043a4:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800043a8:	00000593          	li	a1,0
    800043ac:	00000097          	auipc	ra,0x0
    800043b0:	8bc080e7          	jalr	-1860(ra) # 80003c68 <_ZN7WorkerC11workerBodyCEPv>
    }
    800043b4:	00813083          	ld	ra,8(sp)
    800043b8:	00013403          	ld	s0,0(sp)
    800043bc:	01010113          	addi	sp,sp,16
    800043c0:	00008067          	ret

00000000800043c4 <_ZN7WorkerD3runEv>:
    void run() override {
    800043c4:	ff010113          	addi	sp,sp,-16
    800043c8:	00113423          	sd	ra,8(sp)
    800043cc:	00813023          	sd	s0,0(sp)
    800043d0:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800043d4:	00000593          	li	a1,0
    800043d8:	00000097          	auipc	ra,0x0
    800043dc:	a10080e7          	jalr	-1520(ra) # 80003de8 <_ZN7WorkerD11workerBodyDEPv>
    }
    800043e0:	00813083          	ld	ra,8(sp)
    800043e4:	00013403          	ld	s0,0(sp)
    800043e8:	01010113          	addi	sp,sp,16
    800043ec:	00008067          	ret

00000000800043f0 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800043f0:	f8010113          	addi	sp,sp,-128
    800043f4:	06113c23          	sd	ra,120(sp)
    800043f8:	06813823          	sd	s0,112(sp)
    800043fc:	06913423          	sd	s1,104(sp)
    80004400:	07213023          	sd	s2,96(sp)
    80004404:	05313c23          	sd	s3,88(sp)
    80004408:	05413823          	sd	s4,80(sp)
    8000440c:	05513423          	sd	s5,72(sp)
    80004410:	05613023          	sd	s6,64(sp)
    80004414:	03713c23          	sd	s7,56(sp)
    80004418:	03813823          	sd	s8,48(sp)
    8000441c:	03913423          	sd	s9,40(sp)
    80004420:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004424:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004428:	00006517          	auipc	a0,0x6
    8000442c:	dd050513          	addi	a0,a0,-560 # 8000a1f8 <CONSOLE_STATUS+0x1e8>
    80004430:	00001097          	auipc	ra,0x1
    80004434:	5a8080e7          	jalr	1448(ra) # 800059d8 <_Z11printStringPKc>
    getString(input, 30);
    80004438:	01e00593          	li	a1,30
    8000443c:	f8040493          	addi	s1,s0,-128
    80004440:	00048513          	mv	a0,s1
    80004444:	00001097          	auipc	ra,0x1
    80004448:	61c080e7          	jalr	1564(ra) # 80005a60 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000444c:	00048513          	mv	a0,s1
    80004450:	00001097          	auipc	ra,0x1
    80004454:	6e8080e7          	jalr	1768(ra) # 80005b38 <_Z11stringToIntPKc>
    80004458:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    8000445c:	00006517          	auipc	a0,0x6
    80004460:	dbc50513          	addi	a0,a0,-580 # 8000a218 <CONSOLE_STATUS+0x208>
    80004464:	00001097          	auipc	ra,0x1
    80004468:	574080e7          	jalr	1396(ra) # 800059d8 <_Z11printStringPKc>
    getString(input, 30);
    8000446c:	01e00593          	li	a1,30
    80004470:	00048513          	mv	a0,s1
    80004474:	00001097          	auipc	ra,0x1
    80004478:	5ec080e7          	jalr	1516(ra) # 80005a60 <_Z9getStringPci>
    n = stringToInt(input);
    8000447c:	00048513          	mv	a0,s1
    80004480:	00001097          	auipc	ra,0x1
    80004484:	6b8080e7          	jalr	1720(ra) # 80005b38 <_Z11stringToIntPKc>
    80004488:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    8000448c:	00006517          	auipc	a0,0x6
    80004490:	dac50513          	addi	a0,a0,-596 # 8000a238 <CONSOLE_STATUS+0x228>
    80004494:	00001097          	auipc	ra,0x1
    80004498:	544080e7          	jalr	1348(ra) # 800059d8 <_Z11printStringPKc>
    printInt(threadNum);
    8000449c:	00000613          	li	a2,0
    800044a0:	00a00593          	li	a1,10
    800044a4:	00098513          	mv	a0,s3
    800044a8:	00001097          	auipc	ra,0x1
    800044ac:	6e0080e7          	jalr	1760(ra) # 80005b88 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800044b0:	00006517          	auipc	a0,0x6
    800044b4:	da050513          	addi	a0,a0,-608 # 8000a250 <CONSOLE_STATUS+0x240>
    800044b8:	00001097          	auipc	ra,0x1
    800044bc:	520080e7          	jalr	1312(ra) # 800059d8 <_Z11printStringPKc>
    printInt(n);
    800044c0:	00000613          	li	a2,0
    800044c4:	00a00593          	li	a1,10
    800044c8:	00048513          	mv	a0,s1
    800044cc:	00001097          	auipc	ra,0x1
    800044d0:	6bc080e7          	jalr	1724(ra) # 80005b88 <_Z8printIntiii>
    printString(".\n");
    800044d4:	00006517          	auipc	a0,0x6
    800044d8:	d9450513          	addi	a0,a0,-620 # 8000a268 <CONSOLE_STATUS+0x258>
    800044dc:	00001097          	auipc	ra,0x1
    800044e0:	4fc080e7          	jalr	1276(ra) # 800059d8 <_Z11printStringPKc>
    if (threadNum > n) {
    800044e4:	0334c463          	blt	s1,s3,8000450c <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800044e8:	03305c63          	blez	s3,80004520 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800044ec:	03800513          	li	a0,56
    800044f0:	ffffe097          	auipc	ra,0xffffe
    800044f4:	288080e7          	jalr	648(ra) # 80002778 <_Znwm>
    800044f8:	00050a93          	mv	s5,a0
    800044fc:	00048593          	mv	a1,s1
    80004500:	00001097          	auipc	ra,0x1
    80004504:	7a8080e7          	jalr	1960(ra) # 80005ca8 <_ZN9BufferCPPC1Ei>
    80004508:	0300006f          	j	80004538 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000450c:	00006517          	auipc	a0,0x6
    80004510:	d6450513          	addi	a0,a0,-668 # 8000a270 <CONSOLE_STATUS+0x260>
    80004514:	00001097          	auipc	ra,0x1
    80004518:	4c4080e7          	jalr	1220(ra) # 800059d8 <_Z11printStringPKc>
        return;
    8000451c:	0140006f          	j	80004530 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004520:	00006517          	auipc	a0,0x6
    80004524:	d9050513          	addi	a0,a0,-624 # 8000a2b0 <CONSOLE_STATUS+0x2a0>
    80004528:	00001097          	auipc	ra,0x1
    8000452c:	4b0080e7          	jalr	1200(ra) # 800059d8 <_Z11printStringPKc>
        return;
    80004530:	000c0113          	mv	sp,s8
    80004534:	2140006f          	j	80004748 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004538:	01000513          	li	a0,16
    8000453c:	ffffe097          	auipc	ra,0xffffe
    80004540:	23c080e7          	jalr	572(ra) # 80002778 <_Znwm>
    80004544:	00050913          	mv	s2,a0
    80004548:	00000593          	li	a1,0
    8000454c:	ffffe097          	auipc	ra,0xffffe
    80004550:	580080e7          	jalr	1408(ra) # 80002acc <_ZN9SemaphoreC1Ej>
    80004554:	00009797          	auipc	a5,0x9
    80004558:	8527be23          	sd	s2,-1956(a5) # 8000cdb0 <_ZL10waitForAll>
    Thread *producers[threadNum];
    8000455c:	00399793          	slli	a5,s3,0x3
    80004560:	00f78793          	addi	a5,a5,15
    80004564:	ff07f793          	andi	a5,a5,-16
    80004568:	40f10133          	sub	sp,sp,a5
    8000456c:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004570:	0019871b          	addiw	a4,s3,1
    80004574:	00171793          	slli	a5,a4,0x1
    80004578:	00e787b3          	add	a5,a5,a4
    8000457c:	00379793          	slli	a5,a5,0x3
    80004580:	00f78793          	addi	a5,a5,15
    80004584:	ff07f793          	andi	a5,a5,-16
    80004588:	40f10133          	sub	sp,sp,a5
    8000458c:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004590:	00199493          	slli	s1,s3,0x1
    80004594:	013484b3          	add	s1,s1,s3
    80004598:	00349493          	slli	s1,s1,0x3
    8000459c:	009b04b3          	add	s1,s6,s1
    800045a0:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    800045a4:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    800045a8:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800045ac:	02800513          	li	a0,40
    800045b0:	ffffe097          	auipc	ra,0xffffe
    800045b4:	1c8080e7          	jalr	456(ra) # 80002778 <_Znwm>
    800045b8:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    800045bc:	ffffe097          	auipc	ra,0xffffe
    800045c0:	494080e7          	jalr	1172(ra) # 80002a50 <_ZN6ThreadC1Ev>
    800045c4:	00008797          	auipc	a5,0x8
    800045c8:	4dc78793          	addi	a5,a5,1244 # 8000caa0 <_ZTV8Consumer+0x10>
    800045cc:	00fbb023          	sd	a5,0(s7)
    800045d0:	029bb023          	sd	s1,32(s7)
    consumer->start();
    800045d4:	000b8513          	mv	a0,s7
    800045d8:	ffffe097          	auipc	ra,0xffffe
    800045dc:	358080e7          	jalr	856(ra) # 80002930 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800045e0:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800045e4:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800045e8:	00008797          	auipc	a5,0x8
    800045ec:	7c87b783          	ld	a5,1992(a5) # 8000cdb0 <_ZL10waitForAll>
    800045f0:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800045f4:	02800513          	li	a0,40
    800045f8:	ffffe097          	auipc	ra,0xffffe
    800045fc:	180080e7          	jalr	384(ra) # 80002778 <_Znwm>
    80004600:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004604:	ffffe097          	auipc	ra,0xffffe
    80004608:	44c080e7          	jalr	1100(ra) # 80002a50 <_ZN6ThreadC1Ev>
    8000460c:	00008797          	auipc	a5,0x8
    80004610:	44478793          	addi	a5,a5,1092 # 8000ca50 <_ZTV16ProducerKeyborad+0x10>
    80004614:	00f4b023          	sd	a5,0(s1)
    80004618:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000461c:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004620:	00048513          	mv	a0,s1
    80004624:	ffffe097          	auipc	ra,0xffffe
    80004628:	30c080e7          	jalr	780(ra) # 80002930 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000462c:	00100913          	li	s2,1
    80004630:	0300006f          	j	80004660 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004634:	00008797          	auipc	a5,0x8
    80004638:	44478793          	addi	a5,a5,1092 # 8000ca78 <_ZTV8Producer+0x10>
    8000463c:	00fcb023          	sd	a5,0(s9)
    80004640:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004644:	00391793          	slli	a5,s2,0x3
    80004648:	00fa07b3          	add	a5,s4,a5
    8000464c:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004650:	000c8513          	mv	a0,s9
    80004654:	ffffe097          	auipc	ra,0xffffe
    80004658:	2dc080e7          	jalr	732(ra) # 80002930 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000465c:	0019091b          	addiw	s2,s2,1
    80004660:	05395263          	bge	s2,s3,800046a4 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004664:	00191493          	slli	s1,s2,0x1
    80004668:	012484b3          	add	s1,s1,s2
    8000466c:	00349493          	slli	s1,s1,0x3
    80004670:	009b04b3          	add	s1,s6,s1
    80004674:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004678:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    8000467c:	00008797          	auipc	a5,0x8
    80004680:	7347b783          	ld	a5,1844(a5) # 8000cdb0 <_ZL10waitForAll>
    80004684:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004688:	02800513          	li	a0,40
    8000468c:	ffffe097          	auipc	ra,0xffffe
    80004690:	0ec080e7          	jalr	236(ra) # 80002778 <_Znwm>
    80004694:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004698:	ffffe097          	auipc	ra,0xffffe
    8000469c:	3b8080e7          	jalr	952(ra) # 80002a50 <_ZN6ThreadC1Ev>
    800046a0:	f95ff06f          	j	80004634 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    800046a4:	ffffe097          	auipc	ra,0xffffe
    800046a8:	2f0080e7          	jalr	752(ra) # 80002994 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800046ac:	00000493          	li	s1,0
    800046b0:	0099ce63          	blt	s3,s1,800046cc <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    800046b4:	00008517          	auipc	a0,0x8
    800046b8:	6fc53503          	ld	a0,1788(a0) # 8000cdb0 <_ZL10waitForAll>
    800046bc:	ffffe097          	auipc	ra,0xffffe
    800046c0:	448080e7          	jalr	1096(ra) # 80002b04 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800046c4:	0014849b          	addiw	s1,s1,1
    800046c8:	fe9ff06f          	j	800046b0 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    800046cc:	00008517          	auipc	a0,0x8
    800046d0:	6e453503          	ld	a0,1764(a0) # 8000cdb0 <_ZL10waitForAll>
    800046d4:	00050863          	beqz	a0,800046e4 <_Z20testConsumerProducerv+0x2f4>
    800046d8:	00053783          	ld	a5,0(a0)
    800046dc:	0087b783          	ld	a5,8(a5)
    800046e0:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800046e4:	00000493          	li	s1,0
    800046e8:	0080006f          	j	800046f0 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800046ec:	0014849b          	addiw	s1,s1,1
    800046f0:	0334d263          	bge	s1,s3,80004714 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800046f4:	00349793          	slli	a5,s1,0x3
    800046f8:	00fa07b3          	add	a5,s4,a5
    800046fc:	0007b503          	ld	a0,0(a5)
    80004700:	fe0506e3          	beqz	a0,800046ec <_Z20testConsumerProducerv+0x2fc>
    80004704:	00053783          	ld	a5,0(a0)
    80004708:	0087b783          	ld	a5,8(a5)
    8000470c:	000780e7          	jalr	a5
    80004710:	fddff06f          	j	800046ec <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004714:	000b8a63          	beqz	s7,80004728 <_Z20testConsumerProducerv+0x338>
    80004718:	000bb783          	ld	a5,0(s7)
    8000471c:	0087b783          	ld	a5,8(a5)
    80004720:	000b8513          	mv	a0,s7
    80004724:	000780e7          	jalr	a5
    delete buffer;
    80004728:	000a8e63          	beqz	s5,80004744 <_Z20testConsumerProducerv+0x354>
    8000472c:	000a8513          	mv	a0,s5
    80004730:	00002097          	auipc	ra,0x2
    80004734:	870080e7          	jalr	-1936(ra) # 80005fa0 <_ZN9BufferCPPD1Ev>
    80004738:	000a8513          	mv	a0,s5
    8000473c:	ffffe097          	auipc	ra,0xffffe
    80004740:	08c080e7          	jalr	140(ra) # 800027c8 <_ZdlPv>
    80004744:	000c0113          	mv	sp,s8
}
    80004748:	f8040113          	addi	sp,s0,-128
    8000474c:	07813083          	ld	ra,120(sp)
    80004750:	07013403          	ld	s0,112(sp)
    80004754:	06813483          	ld	s1,104(sp)
    80004758:	06013903          	ld	s2,96(sp)
    8000475c:	05813983          	ld	s3,88(sp)
    80004760:	05013a03          	ld	s4,80(sp)
    80004764:	04813a83          	ld	s5,72(sp)
    80004768:	04013b03          	ld	s6,64(sp)
    8000476c:	03813b83          	ld	s7,56(sp)
    80004770:	03013c03          	ld	s8,48(sp)
    80004774:	02813c83          	ld	s9,40(sp)
    80004778:	08010113          	addi	sp,sp,128
    8000477c:	00008067          	ret
    80004780:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004784:	000a8513          	mv	a0,s5
    80004788:	ffffe097          	auipc	ra,0xffffe
    8000478c:	040080e7          	jalr	64(ra) # 800027c8 <_ZdlPv>
    80004790:	00048513          	mv	a0,s1
    80004794:	00009097          	auipc	ra,0x9
    80004798:	734080e7          	jalr	1844(ra) # 8000dec8 <_Unwind_Resume>
    8000479c:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    800047a0:	00090513          	mv	a0,s2
    800047a4:	ffffe097          	auipc	ra,0xffffe
    800047a8:	024080e7          	jalr	36(ra) # 800027c8 <_ZdlPv>
    800047ac:	00048513          	mv	a0,s1
    800047b0:	00009097          	auipc	ra,0x9
    800047b4:	718080e7          	jalr	1816(ra) # 8000dec8 <_Unwind_Resume>
    800047b8:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800047bc:	000b8513          	mv	a0,s7
    800047c0:	ffffe097          	auipc	ra,0xffffe
    800047c4:	008080e7          	jalr	8(ra) # 800027c8 <_ZdlPv>
    800047c8:	00048513          	mv	a0,s1
    800047cc:	00009097          	auipc	ra,0x9
    800047d0:	6fc080e7          	jalr	1788(ra) # 8000dec8 <_Unwind_Resume>
    800047d4:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800047d8:	00048513          	mv	a0,s1
    800047dc:	ffffe097          	auipc	ra,0xffffe
    800047e0:	fec080e7          	jalr	-20(ra) # 800027c8 <_ZdlPv>
    800047e4:	00090513          	mv	a0,s2
    800047e8:	00009097          	auipc	ra,0x9
    800047ec:	6e0080e7          	jalr	1760(ra) # 8000dec8 <_Unwind_Resume>
    800047f0:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800047f4:	000c8513          	mv	a0,s9
    800047f8:	ffffe097          	auipc	ra,0xffffe
    800047fc:	fd0080e7          	jalr	-48(ra) # 800027c8 <_ZdlPv>
    80004800:	00048513          	mv	a0,s1
    80004804:	00009097          	auipc	ra,0x9
    80004808:	6c4080e7          	jalr	1732(ra) # 8000dec8 <_Unwind_Resume>

000000008000480c <_ZN8Consumer3runEv>:
    void run() override {
    8000480c:	fd010113          	addi	sp,sp,-48
    80004810:	02113423          	sd	ra,40(sp)
    80004814:	02813023          	sd	s0,32(sp)
    80004818:	00913c23          	sd	s1,24(sp)
    8000481c:	01213823          	sd	s2,16(sp)
    80004820:	01313423          	sd	s3,8(sp)
    80004824:	03010413          	addi	s0,sp,48
    80004828:	00050913          	mv	s2,a0
        int i = 0;
    8000482c:	00000993          	li	s3,0
    80004830:	0100006f          	j	80004840 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004834:	00a00513          	li	a0,10
    80004838:	ffffe097          	auipc	ra,0xffffe
    8000483c:	3bc080e7          	jalr	956(ra) # 80002bf4 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004840:	00008797          	auipc	a5,0x8
    80004844:	5687a783          	lw	a5,1384(a5) # 8000cda8 <_ZL9threadEnd>
    80004848:	04079a63          	bnez	a5,8000489c <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    8000484c:	02093783          	ld	a5,32(s2)
    80004850:	0087b503          	ld	a0,8(a5)
    80004854:	00001097          	auipc	ra,0x1
    80004858:	638080e7          	jalr	1592(ra) # 80005e8c <_ZN9BufferCPP3getEv>
            i++;
    8000485c:	0019849b          	addiw	s1,s3,1
    80004860:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004864:	0ff57513          	andi	a0,a0,255
    80004868:	ffffe097          	auipc	ra,0xffffe
    8000486c:	38c080e7          	jalr	908(ra) # 80002bf4 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004870:	05000793          	li	a5,80
    80004874:	02f4e4bb          	remw	s1,s1,a5
    80004878:	fc0494e3          	bnez	s1,80004840 <_ZN8Consumer3runEv+0x34>
    8000487c:	fb9ff06f          	j	80004834 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004880:	02093783          	ld	a5,32(s2)
    80004884:	0087b503          	ld	a0,8(a5)
    80004888:	00001097          	auipc	ra,0x1
    8000488c:	604080e7          	jalr	1540(ra) # 80005e8c <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004890:	0ff57513          	andi	a0,a0,255
    80004894:	ffffe097          	auipc	ra,0xffffe
    80004898:	360080e7          	jalr	864(ra) # 80002bf4 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    8000489c:	02093783          	ld	a5,32(s2)
    800048a0:	0087b503          	ld	a0,8(a5)
    800048a4:	00001097          	auipc	ra,0x1
    800048a8:	674080e7          	jalr	1652(ra) # 80005f18 <_ZN9BufferCPP6getCntEv>
    800048ac:	fca04ae3          	bgtz	a0,80004880 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    800048b0:	02093783          	ld	a5,32(s2)
    800048b4:	0107b503          	ld	a0,16(a5)
    800048b8:	ffffe097          	auipc	ra,0xffffe
    800048bc:	278080e7          	jalr	632(ra) # 80002b30 <_ZN9Semaphore6signalEv>
    }
    800048c0:	02813083          	ld	ra,40(sp)
    800048c4:	02013403          	ld	s0,32(sp)
    800048c8:	01813483          	ld	s1,24(sp)
    800048cc:	01013903          	ld	s2,16(sp)
    800048d0:	00813983          	ld	s3,8(sp)
    800048d4:	03010113          	addi	sp,sp,48
    800048d8:	00008067          	ret

00000000800048dc <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    800048dc:	ff010113          	addi	sp,sp,-16
    800048e0:	00113423          	sd	ra,8(sp)
    800048e4:	00813023          	sd	s0,0(sp)
    800048e8:	01010413          	addi	s0,sp,16
    800048ec:	00008797          	auipc	a5,0x8
    800048f0:	1b478793          	addi	a5,a5,436 # 8000caa0 <_ZTV8Consumer+0x10>
    800048f4:	00f53023          	sd	a5,0(a0)
    800048f8:	ffffe097          	auipc	ra,0xffffe
    800048fc:	d90080e7          	jalr	-624(ra) # 80002688 <_ZN6ThreadD1Ev>
    80004900:	00813083          	ld	ra,8(sp)
    80004904:	00013403          	ld	s0,0(sp)
    80004908:	01010113          	addi	sp,sp,16
    8000490c:	00008067          	ret

0000000080004910 <_ZN8ConsumerD0Ev>:
    80004910:	fe010113          	addi	sp,sp,-32
    80004914:	00113c23          	sd	ra,24(sp)
    80004918:	00813823          	sd	s0,16(sp)
    8000491c:	00913423          	sd	s1,8(sp)
    80004920:	02010413          	addi	s0,sp,32
    80004924:	00050493          	mv	s1,a0
    80004928:	00008797          	auipc	a5,0x8
    8000492c:	17878793          	addi	a5,a5,376 # 8000caa0 <_ZTV8Consumer+0x10>
    80004930:	00f53023          	sd	a5,0(a0)
    80004934:	ffffe097          	auipc	ra,0xffffe
    80004938:	d54080e7          	jalr	-684(ra) # 80002688 <_ZN6ThreadD1Ev>
    8000493c:	00048513          	mv	a0,s1
    80004940:	ffffe097          	auipc	ra,0xffffe
    80004944:	e88080e7          	jalr	-376(ra) # 800027c8 <_ZdlPv>
    80004948:	01813083          	ld	ra,24(sp)
    8000494c:	01013403          	ld	s0,16(sp)
    80004950:	00813483          	ld	s1,8(sp)
    80004954:	02010113          	addi	sp,sp,32
    80004958:	00008067          	ret

000000008000495c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    8000495c:	ff010113          	addi	sp,sp,-16
    80004960:	00113423          	sd	ra,8(sp)
    80004964:	00813023          	sd	s0,0(sp)
    80004968:	01010413          	addi	s0,sp,16
    8000496c:	00008797          	auipc	a5,0x8
    80004970:	0e478793          	addi	a5,a5,228 # 8000ca50 <_ZTV16ProducerKeyborad+0x10>
    80004974:	00f53023          	sd	a5,0(a0)
    80004978:	ffffe097          	auipc	ra,0xffffe
    8000497c:	d10080e7          	jalr	-752(ra) # 80002688 <_ZN6ThreadD1Ev>
    80004980:	00813083          	ld	ra,8(sp)
    80004984:	00013403          	ld	s0,0(sp)
    80004988:	01010113          	addi	sp,sp,16
    8000498c:	00008067          	ret

0000000080004990 <_ZN16ProducerKeyboradD0Ev>:
    80004990:	fe010113          	addi	sp,sp,-32
    80004994:	00113c23          	sd	ra,24(sp)
    80004998:	00813823          	sd	s0,16(sp)
    8000499c:	00913423          	sd	s1,8(sp)
    800049a0:	02010413          	addi	s0,sp,32
    800049a4:	00050493          	mv	s1,a0
    800049a8:	00008797          	auipc	a5,0x8
    800049ac:	0a878793          	addi	a5,a5,168 # 8000ca50 <_ZTV16ProducerKeyborad+0x10>
    800049b0:	00f53023          	sd	a5,0(a0)
    800049b4:	ffffe097          	auipc	ra,0xffffe
    800049b8:	cd4080e7          	jalr	-812(ra) # 80002688 <_ZN6ThreadD1Ev>
    800049bc:	00048513          	mv	a0,s1
    800049c0:	ffffe097          	auipc	ra,0xffffe
    800049c4:	e08080e7          	jalr	-504(ra) # 800027c8 <_ZdlPv>
    800049c8:	01813083          	ld	ra,24(sp)
    800049cc:	01013403          	ld	s0,16(sp)
    800049d0:	00813483          	ld	s1,8(sp)
    800049d4:	02010113          	addi	sp,sp,32
    800049d8:	00008067          	ret

00000000800049dc <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    800049dc:	ff010113          	addi	sp,sp,-16
    800049e0:	00113423          	sd	ra,8(sp)
    800049e4:	00813023          	sd	s0,0(sp)
    800049e8:	01010413          	addi	s0,sp,16
    800049ec:	00008797          	auipc	a5,0x8
    800049f0:	08c78793          	addi	a5,a5,140 # 8000ca78 <_ZTV8Producer+0x10>
    800049f4:	00f53023          	sd	a5,0(a0)
    800049f8:	ffffe097          	auipc	ra,0xffffe
    800049fc:	c90080e7          	jalr	-880(ra) # 80002688 <_ZN6ThreadD1Ev>
    80004a00:	00813083          	ld	ra,8(sp)
    80004a04:	00013403          	ld	s0,0(sp)
    80004a08:	01010113          	addi	sp,sp,16
    80004a0c:	00008067          	ret

0000000080004a10 <_ZN8ProducerD0Ev>:
    80004a10:	fe010113          	addi	sp,sp,-32
    80004a14:	00113c23          	sd	ra,24(sp)
    80004a18:	00813823          	sd	s0,16(sp)
    80004a1c:	00913423          	sd	s1,8(sp)
    80004a20:	02010413          	addi	s0,sp,32
    80004a24:	00050493          	mv	s1,a0
    80004a28:	00008797          	auipc	a5,0x8
    80004a2c:	05078793          	addi	a5,a5,80 # 8000ca78 <_ZTV8Producer+0x10>
    80004a30:	00f53023          	sd	a5,0(a0)
    80004a34:	ffffe097          	auipc	ra,0xffffe
    80004a38:	c54080e7          	jalr	-940(ra) # 80002688 <_ZN6ThreadD1Ev>
    80004a3c:	00048513          	mv	a0,s1
    80004a40:	ffffe097          	auipc	ra,0xffffe
    80004a44:	d88080e7          	jalr	-632(ra) # 800027c8 <_ZdlPv>
    80004a48:	01813083          	ld	ra,24(sp)
    80004a4c:	01013403          	ld	s0,16(sp)
    80004a50:	00813483          	ld	s1,8(sp)
    80004a54:	02010113          	addi	sp,sp,32
    80004a58:	00008067          	ret

0000000080004a5c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004a5c:	fe010113          	addi	sp,sp,-32
    80004a60:	00113c23          	sd	ra,24(sp)
    80004a64:	00813823          	sd	s0,16(sp)
    80004a68:	00913423          	sd	s1,8(sp)
    80004a6c:	02010413          	addi	s0,sp,32
    80004a70:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004a74:	ffffd097          	auipc	ra,0xffffd
    80004a78:	b00080e7          	jalr	-1280(ra) # 80001574 <_Z4getcv>
    80004a7c:	0005059b          	sext.w	a1,a0
    80004a80:	01b00793          	li	a5,27
    80004a84:	00f58c63          	beq	a1,a5,80004a9c <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004a88:	0204b783          	ld	a5,32(s1)
    80004a8c:	0087b503          	ld	a0,8(a5)
    80004a90:	00001097          	auipc	ra,0x1
    80004a94:	36c080e7          	jalr	876(ra) # 80005dfc <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004a98:	fddff06f          	j	80004a74 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004a9c:	00100793          	li	a5,1
    80004aa0:	00008717          	auipc	a4,0x8
    80004aa4:	30f72423          	sw	a5,776(a4) # 8000cda8 <_ZL9threadEnd>
        td->buffer->put('!');
    80004aa8:	0204b783          	ld	a5,32(s1)
    80004aac:	02100593          	li	a1,33
    80004ab0:	0087b503          	ld	a0,8(a5)
    80004ab4:	00001097          	auipc	ra,0x1
    80004ab8:	348080e7          	jalr	840(ra) # 80005dfc <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004abc:	0204b783          	ld	a5,32(s1)
    80004ac0:	0107b503          	ld	a0,16(a5)
    80004ac4:	ffffe097          	auipc	ra,0xffffe
    80004ac8:	06c080e7          	jalr	108(ra) # 80002b30 <_ZN9Semaphore6signalEv>
    }
    80004acc:	01813083          	ld	ra,24(sp)
    80004ad0:	01013403          	ld	s0,16(sp)
    80004ad4:	00813483          	ld	s1,8(sp)
    80004ad8:	02010113          	addi	sp,sp,32
    80004adc:	00008067          	ret

0000000080004ae0 <_ZN8Producer3runEv>:
    void run() override {
    80004ae0:	fe010113          	addi	sp,sp,-32
    80004ae4:	00113c23          	sd	ra,24(sp)
    80004ae8:	00813823          	sd	s0,16(sp)
    80004aec:	00913423          	sd	s1,8(sp)
    80004af0:	01213023          	sd	s2,0(sp)
    80004af4:	02010413          	addi	s0,sp,32
    80004af8:	00050493          	mv	s1,a0
        int i = 0;
    80004afc:	00000913          	li	s2,0
        while (!threadEnd) {
    80004b00:	00008797          	auipc	a5,0x8
    80004b04:	2a87a783          	lw	a5,680(a5) # 8000cda8 <_ZL9threadEnd>
    80004b08:	04079263          	bnez	a5,80004b4c <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004b0c:	0204b783          	ld	a5,32(s1)
    80004b10:	0007a583          	lw	a1,0(a5)
    80004b14:	0305859b          	addiw	a1,a1,48
    80004b18:	0087b503          	ld	a0,8(a5)
    80004b1c:	00001097          	auipc	ra,0x1
    80004b20:	2e0080e7          	jalr	736(ra) # 80005dfc <_ZN9BufferCPP3putEi>
            i++;
    80004b24:	0019071b          	addiw	a4,s2,1
    80004b28:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004b2c:	0204b783          	ld	a5,32(s1)
    80004b30:	0007a783          	lw	a5,0(a5)
    80004b34:	00e787bb          	addw	a5,a5,a4
    80004b38:	00500513          	li	a0,5
    80004b3c:	02a7e53b          	remw	a0,a5,a0
    80004b40:	ffffe097          	auipc	ra,0xffffe
    80004b44:	e7c080e7          	jalr	-388(ra) # 800029bc <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004b48:	fb9ff06f          	j	80004b00 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004b4c:	0204b783          	ld	a5,32(s1)
    80004b50:	0107b503          	ld	a0,16(a5)
    80004b54:	ffffe097          	auipc	ra,0xffffe
    80004b58:	fdc080e7          	jalr	-36(ra) # 80002b30 <_ZN9Semaphore6signalEv>
    }
    80004b5c:	01813083          	ld	ra,24(sp)
    80004b60:	01013403          	ld	s0,16(sp)
    80004b64:	00813483          	ld	s1,8(sp)
    80004b68:	00013903          	ld	s2,0(sp)
    80004b6c:	02010113          	addi	sp,sp,32
    80004b70:	00008067          	ret

0000000080004b74 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004b74:	fe010113          	addi	sp,sp,-32
    80004b78:	00113c23          	sd	ra,24(sp)
    80004b7c:	00813823          	sd	s0,16(sp)
    80004b80:	00913423          	sd	s1,8(sp)
    80004b84:	01213023          	sd	s2,0(sp)
    80004b88:	02010413          	addi	s0,sp,32
    80004b8c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004b90:	00100793          	li	a5,1
    80004b94:	02a7f863          	bgeu	a5,a0,80004bc4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004b98:	00a00793          	li	a5,10
    80004b9c:	02f577b3          	remu	a5,a0,a5
    80004ba0:	02078e63          	beqz	a5,80004bdc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004ba4:	fff48513          	addi	a0,s1,-1
    80004ba8:	00000097          	auipc	ra,0x0
    80004bac:	fcc080e7          	jalr	-52(ra) # 80004b74 <_ZL9fibonaccim>
    80004bb0:	00050913          	mv	s2,a0
    80004bb4:	ffe48513          	addi	a0,s1,-2
    80004bb8:	00000097          	auipc	ra,0x0
    80004bbc:	fbc080e7          	jalr	-68(ra) # 80004b74 <_ZL9fibonaccim>
    80004bc0:	00a90533          	add	a0,s2,a0
}
    80004bc4:	01813083          	ld	ra,24(sp)
    80004bc8:	01013403          	ld	s0,16(sp)
    80004bcc:	00813483          	ld	s1,8(sp)
    80004bd0:	00013903          	ld	s2,0(sp)
    80004bd4:	02010113          	addi	sp,sp,32
    80004bd8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004bdc:	ffffd097          	auipc	ra,0xffffd
    80004be0:	858080e7          	jalr	-1960(ra) # 80001434 <_Z15thread_dispatchv>
    80004be4:	fc1ff06f          	j	80004ba4 <_ZL9fibonaccim+0x30>

0000000080004be8 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004be8:	fe010113          	addi	sp,sp,-32
    80004bec:	00113c23          	sd	ra,24(sp)
    80004bf0:	00813823          	sd	s0,16(sp)
    80004bf4:	00913423          	sd	s1,8(sp)
    80004bf8:	01213023          	sd	s2,0(sp)
    80004bfc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004c00:	00a00493          	li	s1,10
    80004c04:	0400006f          	j	80004c44 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004c08:	00005517          	auipc	a0,0x5
    80004c0c:	74850513          	addi	a0,a0,1864 # 8000a350 <CONSOLE_STATUS+0x340>
    80004c10:	00001097          	auipc	ra,0x1
    80004c14:	dc8080e7          	jalr	-568(ra) # 800059d8 <_Z11printStringPKc>
    80004c18:	00000613          	li	a2,0
    80004c1c:	00a00593          	li	a1,10
    80004c20:	00048513          	mv	a0,s1
    80004c24:	00001097          	auipc	ra,0x1
    80004c28:	f64080e7          	jalr	-156(ra) # 80005b88 <_Z8printIntiii>
    80004c2c:	00006517          	auipc	a0,0x6
    80004c30:	91450513          	addi	a0,a0,-1772 # 8000a540 <CONSOLE_STATUS+0x530>
    80004c34:	00001097          	auipc	ra,0x1
    80004c38:	da4080e7          	jalr	-604(ra) # 800059d8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004c3c:	0014849b          	addiw	s1,s1,1
    80004c40:	0ff4f493          	andi	s1,s1,255
    80004c44:	00c00793          	li	a5,12
    80004c48:	fc97f0e3          	bgeu	a5,s1,80004c08 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004c4c:	00005517          	auipc	a0,0x5
    80004c50:	70c50513          	addi	a0,a0,1804 # 8000a358 <CONSOLE_STATUS+0x348>
    80004c54:	00001097          	auipc	ra,0x1
    80004c58:	d84080e7          	jalr	-636(ra) # 800059d8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004c5c:	00500313          	li	t1,5
    thread_dispatch();
    80004c60:	ffffc097          	auipc	ra,0xffffc
    80004c64:	7d4080e7          	jalr	2004(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004c68:	01000513          	li	a0,16
    80004c6c:	00000097          	auipc	ra,0x0
    80004c70:	f08080e7          	jalr	-248(ra) # 80004b74 <_ZL9fibonaccim>
    80004c74:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004c78:	00005517          	auipc	a0,0x5
    80004c7c:	6f050513          	addi	a0,a0,1776 # 8000a368 <CONSOLE_STATUS+0x358>
    80004c80:	00001097          	auipc	ra,0x1
    80004c84:	d58080e7          	jalr	-680(ra) # 800059d8 <_Z11printStringPKc>
    80004c88:	00000613          	li	a2,0
    80004c8c:	00a00593          	li	a1,10
    80004c90:	0009051b          	sext.w	a0,s2
    80004c94:	00001097          	auipc	ra,0x1
    80004c98:	ef4080e7          	jalr	-268(ra) # 80005b88 <_Z8printIntiii>
    80004c9c:	00006517          	auipc	a0,0x6
    80004ca0:	8a450513          	addi	a0,a0,-1884 # 8000a540 <CONSOLE_STATUS+0x530>
    80004ca4:	00001097          	auipc	ra,0x1
    80004ca8:	d34080e7          	jalr	-716(ra) # 800059d8 <_Z11printStringPKc>
    80004cac:	0400006f          	j	80004cec <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004cb0:	00005517          	auipc	a0,0x5
    80004cb4:	6a050513          	addi	a0,a0,1696 # 8000a350 <CONSOLE_STATUS+0x340>
    80004cb8:	00001097          	auipc	ra,0x1
    80004cbc:	d20080e7          	jalr	-736(ra) # 800059d8 <_Z11printStringPKc>
    80004cc0:	00000613          	li	a2,0
    80004cc4:	00a00593          	li	a1,10
    80004cc8:	00048513          	mv	a0,s1
    80004ccc:	00001097          	auipc	ra,0x1
    80004cd0:	ebc080e7          	jalr	-324(ra) # 80005b88 <_Z8printIntiii>
    80004cd4:	00006517          	auipc	a0,0x6
    80004cd8:	86c50513          	addi	a0,a0,-1940 # 8000a540 <CONSOLE_STATUS+0x530>
    80004cdc:	00001097          	auipc	ra,0x1
    80004ce0:	cfc080e7          	jalr	-772(ra) # 800059d8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004ce4:	0014849b          	addiw	s1,s1,1
    80004ce8:	0ff4f493          	andi	s1,s1,255
    80004cec:	00f00793          	li	a5,15
    80004cf0:	fc97f0e3          	bgeu	a5,s1,80004cb0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004cf4:	00005517          	auipc	a0,0x5
    80004cf8:	68450513          	addi	a0,a0,1668 # 8000a378 <CONSOLE_STATUS+0x368>
    80004cfc:	00001097          	auipc	ra,0x1
    80004d00:	cdc080e7          	jalr	-804(ra) # 800059d8 <_Z11printStringPKc>
    finishedD = true;
    80004d04:	00100793          	li	a5,1
    80004d08:	00008717          	auipc	a4,0x8
    80004d0c:	0af70823          	sb	a5,176(a4) # 8000cdb8 <_ZL9finishedD>
    thread_dispatch();
    80004d10:	ffffc097          	auipc	ra,0xffffc
    80004d14:	724080e7          	jalr	1828(ra) # 80001434 <_Z15thread_dispatchv>
}
    80004d18:	01813083          	ld	ra,24(sp)
    80004d1c:	01013403          	ld	s0,16(sp)
    80004d20:	00813483          	ld	s1,8(sp)
    80004d24:	00013903          	ld	s2,0(sp)
    80004d28:	02010113          	addi	sp,sp,32
    80004d2c:	00008067          	ret

0000000080004d30 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004d30:	fe010113          	addi	sp,sp,-32
    80004d34:	00113c23          	sd	ra,24(sp)
    80004d38:	00813823          	sd	s0,16(sp)
    80004d3c:	00913423          	sd	s1,8(sp)
    80004d40:	01213023          	sd	s2,0(sp)
    80004d44:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004d48:	00000493          	li	s1,0
    80004d4c:	0400006f          	j	80004d8c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004d50:	00005517          	auipc	a0,0x5
    80004d54:	5c050513          	addi	a0,a0,1472 # 8000a310 <CONSOLE_STATUS+0x300>
    80004d58:	00001097          	auipc	ra,0x1
    80004d5c:	c80080e7          	jalr	-896(ra) # 800059d8 <_Z11printStringPKc>
    80004d60:	00000613          	li	a2,0
    80004d64:	00a00593          	li	a1,10
    80004d68:	00048513          	mv	a0,s1
    80004d6c:	00001097          	auipc	ra,0x1
    80004d70:	e1c080e7          	jalr	-484(ra) # 80005b88 <_Z8printIntiii>
    80004d74:	00005517          	auipc	a0,0x5
    80004d78:	7cc50513          	addi	a0,a0,1996 # 8000a540 <CONSOLE_STATUS+0x530>
    80004d7c:	00001097          	auipc	ra,0x1
    80004d80:	c5c080e7          	jalr	-932(ra) # 800059d8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004d84:	0014849b          	addiw	s1,s1,1
    80004d88:	0ff4f493          	andi	s1,s1,255
    80004d8c:	00200793          	li	a5,2
    80004d90:	fc97f0e3          	bgeu	a5,s1,80004d50 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004d94:	00005517          	auipc	a0,0x5
    80004d98:	58450513          	addi	a0,a0,1412 # 8000a318 <CONSOLE_STATUS+0x308>
    80004d9c:	00001097          	auipc	ra,0x1
    80004da0:	c3c080e7          	jalr	-964(ra) # 800059d8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004da4:	00700313          	li	t1,7
    thread_dispatch();
    80004da8:	ffffc097          	auipc	ra,0xffffc
    80004dac:	68c080e7          	jalr	1676(ra) # 80001434 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004db0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004db4:	00005517          	auipc	a0,0x5
    80004db8:	57450513          	addi	a0,a0,1396 # 8000a328 <CONSOLE_STATUS+0x318>
    80004dbc:	00001097          	auipc	ra,0x1
    80004dc0:	c1c080e7          	jalr	-996(ra) # 800059d8 <_Z11printStringPKc>
    80004dc4:	00000613          	li	a2,0
    80004dc8:	00a00593          	li	a1,10
    80004dcc:	0009051b          	sext.w	a0,s2
    80004dd0:	00001097          	auipc	ra,0x1
    80004dd4:	db8080e7          	jalr	-584(ra) # 80005b88 <_Z8printIntiii>
    80004dd8:	00005517          	auipc	a0,0x5
    80004ddc:	76850513          	addi	a0,a0,1896 # 8000a540 <CONSOLE_STATUS+0x530>
    80004de0:	00001097          	auipc	ra,0x1
    80004de4:	bf8080e7          	jalr	-1032(ra) # 800059d8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004de8:	00c00513          	li	a0,12
    80004dec:	00000097          	auipc	ra,0x0
    80004df0:	d88080e7          	jalr	-632(ra) # 80004b74 <_ZL9fibonaccim>
    80004df4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004df8:	00005517          	auipc	a0,0x5
    80004dfc:	53850513          	addi	a0,a0,1336 # 8000a330 <CONSOLE_STATUS+0x320>
    80004e00:	00001097          	auipc	ra,0x1
    80004e04:	bd8080e7          	jalr	-1064(ra) # 800059d8 <_Z11printStringPKc>
    80004e08:	00000613          	li	a2,0
    80004e0c:	00a00593          	li	a1,10
    80004e10:	0009051b          	sext.w	a0,s2
    80004e14:	00001097          	auipc	ra,0x1
    80004e18:	d74080e7          	jalr	-652(ra) # 80005b88 <_Z8printIntiii>
    80004e1c:	00005517          	auipc	a0,0x5
    80004e20:	72450513          	addi	a0,a0,1828 # 8000a540 <CONSOLE_STATUS+0x530>
    80004e24:	00001097          	auipc	ra,0x1
    80004e28:	bb4080e7          	jalr	-1100(ra) # 800059d8 <_Z11printStringPKc>
    80004e2c:	0400006f          	j	80004e6c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004e30:	00005517          	auipc	a0,0x5
    80004e34:	4e050513          	addi	a0,a0,1248 # 8000a310 <CONSOLE_STATUS+0x300>
    80004e38:	00001097          	auipc	ra,0x1
    80004e3c:	ba0080e7          	jalr	-1120(ra) # 800059d8 <_Z11printStringPKc>
    80004e40:	00000613          	li	a2,0
    80004e44:	00a00593          	li	a1,10
    80004e48:	00048513          	mv	a0,s1
    80004e4c:	00001097          	auipc	ra,0x1
    80004e50:	d3c080e7          	jalr	-708(ra) # 80005b88 <_Z8printIntiii>
    80004e54:	00005517          	auipc	a0,0x5
    80004e58:	6ec50513          	addi	a0,a0,1772 # 8000a540 <CONSOLE_STATUS+0x530>
    80004e5c:	00001097          	auipc	ra,0x1
    80004e60:	b7c080e7          	jalr	-1156(ra) # 800059d8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004e64:	0014849b          	addiw	s1,s1,1
    80004e68:	0ff4f493          	andi	s1,s1,255
    80004e6c:	00500793          	li	a5,5
    80004e70:	fc97f0e3          	bgeu	a5,s1,80004e30 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80004e74:	00005517          	auipc	a0,0x5
    80004e78:	4cc50513          	addi	a0,a0,1228 # 8000a340 <CONSOLE_STATUS+0x330>
    80004e7c:	00001097          	auipc	ra,0x1
    80004e80:	b5c080e7          	jalr	-1188(ra) # 800059d8 <_Z11printStringPKc>
    finishedC = true;
    80004e84:	00100793          	li	a5,1
    80004e88:	00008717          	auipc	a4,0x8
    80004e8c:	f2f708a3          	sb	a5,-207(a4) # 8000cdb9 <_ZL9finishedC>
    thread_dispatch();
    80004e90:	ffffc097          	auipc	ra,0xffffc
    80004e94:	5a4080e7          	jalr	1444(ra) # 80001434 <_Z15thread_dispatchv>
}
    80004e98:	01813083          	ld	ra,24(sp)
    80004e9c:	01013403          	ld	s0,16(sp)
    80004ea0:	00813483          	ld	s1,8(sp)
    80004ea4:	00013903          	ld	s2,0(sp)
    80004ea8:	02010113          	addi	sp,sp,32
    80004eac:	00008067          	ret

0000000080004eb0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004eb0:	fe010113          	addi	sp,sp,-32
    80004eb4:	00113c23          	sd	ra,24(sp)
    80004eb8:	00813823          	sd	s0,16(sp)
    80004ebc:	00913423          	sd	s1,8(sp)
    80004ec0:	01213023          	sd	s2,0(sp)
    80004ec4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004ec8:	00000913          	li	s2,0
    80004ecc:	0380006f          	j	80004f04 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004ed0:	ffffc097          	auipc	ra,0xffffc
    80004ed4:	564080e7          	jalr	1380(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004ed8:	00148493          	addi	s1,s1,1
    80004edc:	000027b7          	lui	a5,0x2
    80004ee0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004ee4:	0097ee63          	bltu	a5,s1,80004f00 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004ee8:	00000713          	li	a4,0
    80004eec:	000077b7          	lui	a5,0x7
    80004ef0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004ef4:	fce7eee3          	bltu	a5,a4,80004ed0 <_ZL11workerBodyBPv+0x20>
    80004ef8:	00170713          	addi	a4,a4,1
    80004efc:	ff1ff06f          	j	80004eec <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004f00:	00190913          	addi	s2,s2,1
    80004f04:	00f00793          	li	a5,15
    80004f08:	0527e063          	bltu	a5,s2,80004f48 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004f0c:	00005517          	auipc	a0,0x5
    80004f10:	3ec50513          	addi	a0,a0,1004 # 8000a2f8 <CONSOLE_STATUS+0x2e8>
    80004f14:	00001097          	auipc	ra,0x1
    80004f18:	ac4080e7          	jalr	-1340(ra) # 800059d8 <_Z11printStringPKc>
    80004f1c:	00000613          	li	a2,0
    80004f20:	00a00593          	li	a1,10
    80004f24:	0009051b          	sext.w	a0,s2
    80004f28:	00001097          	auipc	ra,0x1
    80004f2c:	c60080e7          	jalr	-928(ra) # 80005b88 <_Z8printIntiii>
    80004f30:	00005517          	auipc	a0,0x5
    80004f34:	61050513          	addi	a0,a0,1552 # 8000a540 <CONSOLE_STATUS+0x530>
    80004f38:	00001097          	auipc	ra,0x1
    80004f3c:	aa0080e7          	jalr	-1376(ra) # 800059d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004f40:	00000493          	li	s1,0
    80004f44:	f99ff06f          	j	80004edc <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004f48:	00005517          	auipc	a0,0x5
    80004f4c:	3b850513          	addi	a0,a0,952 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80004f50:	00001097          	auipc	ra,0x1
    80004f54:	a88080e7          	jalr	-1400(ra) # 800059d8 <_Z11printStringPKc>
    finishedB = true;
    80004f58:	00100793          	li	a5,1
    80004f5c:	00008717          	auipc	a4,0x8
    80004f60:	e4f70f23          	sb	a5,-418(a4) # 8000cdba <_ZL9finishedB>
    thread_dispatch();
    80004f64:	ffffc097          	auipc	ra,0xffffc
    80004f68:	4d0080e7          	jalr	1232(ra) # 80001434 <_Z15thread_dispatchv>
}
    80004f6c:	01813083          	ld	ra,24(sp)
    80004f70:	01013403          	ld	s0,16(sp)
    80004f74:	00813483          	ld	s1,8(sp)
    80004f78:	00013903          	ld	s2,0(sp)
    80004f7c:	02010113          	addi	sp,sp,32
    80004f80:	00008067          	ret

0000000080004f84 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004f84:	fe010113          	addi	sp,sp,-32
    80004f88:	00113c23          	sd	ra,24(sp)
    80004f8c:	00813823          	sd	s0,16(sp)
    80004f90:	00913423          	sd	s1,8(sp)
    80004f94:	01213023          	sd	s2,0(sp)
    80004f98:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004f9c:	00000913          	li	s2,0
    80004fa0:	0380006f          	j	80004fd8 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004fa4:	ffffc097          	auipc	ra,0xffffc
    80004fa8:	490080e7          	jalr	1168(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004fac:	00148493          	addi	s1,s1,1
    80004fb0:	000027b7          	lui	a5,0x2
    80004fb4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004fb8:	0097ee63          	bltu	a5,s1,80004fd4 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004fbc:	00000713          	li	a4,0
    80004fc0:	000077b7          	lui	a5,0x7
    80004fc4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004fc8:	fce7eee3          	bltu	a5,a4,80004fa4 <_ZL11workerBodyAPv+0x20>
    80004fcc:	00170713          	addi	a4,a4,1
    80004fd0:	ff1ff06f          	j	80004fc0 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004fd4:	00190913          	addi	s2,s2,1
    80004fd8:	00900793          	li	a5,9
    80004fdc:	0527e063          	bltu	a5,s2,8000501c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004fe0:	00005517          	auipc	a0,0x5
    80004fe4:	30050513          	addi	a0,a0,768 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80004fe8:	00001097          	auipc	ra,0x1
    80004fec:	9f0080e7          	jalr	-1552(ra) # 800059d8 <_Z11printStringPKc>
    80004ff0:	00000613          	li	a2,0
    80004ff4:	00a00593          	li	a1,10
    80004ff8:	0009051b          	sext.w	a0,s2
    80004ffc:	00001097          	auipc	ra,0x1
    80005000:	b8c080e7          	jalr	-1140(ra) # 80005b88 <_Z8printIntiii>
    80005004:	00005517          	auipc	a0,0x5
    80005008:	53c50513          	addi	a0,a0,1340 # 8000a540 <CONSOLE_STATUS+0x530>
    8000500c:	00001097          	auipc	ra,0x1
    80005010:	9cc080e7          	jalr	-1588(ra) # 800059d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005014:	00000493          	li	s1,0
    80005018:	f99ff06f          	j	80004fb0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    8000501c:	00005517          	auipc	a0,0x5
    80005020:	2cc50513          	addi	a0,a0,716 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    80005024:	00001097          	auipc	ra,0x1
    80005028:	9b4080e7          	jalr	-1612(ra) # 800059d8 <_Z11printStringPKc>
    finishedA = true;
    8000502c:	00100793          	li	a5,1
    80005030:	00008717          	auipc	a4,0x8
    80005034:	d8f705a3          	sb	a5,-629(a4) # 8000cdbb <_ZL9finishedA>
}
    80005038:	01813083          	ld	ra,24(sp)
    8000503c:	01013403          	ld	s0,16(sp)
    80005040:	00813483          	ld	s1,8(sp)
    80005044:	00013903          	ld	s2,0(sp)
    80005048:	02010113          	addi	sp,sp,32
    8000504c:	00008067          	ret

0000000080005050 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005050:	fd010113          	addi	sp,sp,-48
    80005054:	02113423          	sd	ra,40(sp)
    80005058:	02813023          	sd	s0,32(sp)
    8000505c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005060:	00000613          	li	a2,0
    80005064:	00000597          	auipc	a1,0x0
    80005068:	f2058593          	addi	a1,a1,-224 # 80004f84 <_ZL11workerBodyAPv>
    8000506c:	fd040513          	addi	a0,s0,-48
    80005070:	ffffc097          	auipc	ra,0xffffc
    80005074:	308080e7          	jalr	776(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005078:	00005517          	auipc	a0,0x5
    8000507c:	31050513          	addi	a0,a0,784 # 8000a388 <CONSOLE_STATUS+0x378>
    80005080:	00001097          	auipc	ra,0x1
    80005084:	958080e7          	jalr	-1704(ra) # 800059d8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005088:	00000613          	li	a2,0
    8000508c:	00000597          	auipc	a1,0x0
    80005090:	e2458593          	addi	a1,a1,-476 # 80004eb0 <_ZL11workerBodyBPv>
    80005094:	fd840513          	addi	a0,s0,-40
    80005098:	ffffc097          	auipc	ra,0xffffc
    8000509c:	2e0080e7          	jalr	736(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800050a0:	00005517          	auipc	a0,0x5
    800050a4:	30050513          	addi	a0,a0,768 # 8000a3a0 <CONSOLE_STATUS+0x390>
    800050a8:	00001097          	auipc	ra,0x1
    800050ac:	930080e7          	jalr	-1744(ra) # 800059d8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800050b0:	00000613          	li	a2,0
    800050b4:	00000597          	auipc	a1,0x0
    800050b8:	c7c58593          	addi	a1,a1,-900 # 80004d30 <_ZL11workerBodyCPv>
    800050bc:	fe040513          	addi	a0,s0,-32
    800050c0:	ffffc097          	auipc	ra,0xffffc
    800050c4:	2b8080e7          	jalr	696(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800050c8:	00005517          	auipc	a0,0x5
    800050cc:	2f050513          	addi	a0,a0,752 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    800050d0:	00001097          	auipc	ra,0x1
    800050d4:	908080e7          	jalr	-1784(ra) # 800059d8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800050d8:	00000613          	li	a2,0
    800050dc:	00000597          	auipc	a1,0x0
    800050e0:	b0c58593          	addi	a1,a1,-1268 # 80004be8 <_ZL11workerBodyDPv>
    800050e4:	fe840513          	addi	a0,s0,-24
    800050e8:	ffffc097          	auipc	ra,0xffffc
    800050ec:	290080e7          	jalr	656(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800050f0:	00005517          	auipc	a0,0x5
    800050f4:	2e050513          	addi	a0,a0,736 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    800050f8:	00001097          	auipc	ra,0x1
    800050fc:	8e0080e7          	jalr	-1824(ra) # 800059d8 <_Z11printStringPKc>
    80005100:	00c0006f          	j	8000510c <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005104:	ffffc097          	auipc	ra,0xffffc
    80005108:	330080e7          	jalr	816(ra) # 80001434 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000510c:	00008797          	auipc	a5,0x8
    80005110:	caf7c783          	lbu	a5,-849(a5) # 8000cdbb <_ZL9finishedA>
    80005114:	fe0788e3          	beqz	a5,80005104 <_Z18Threads_C_API_testv+0xb4>
    80005118:	00008797          	auipc	a5,0x8
    8000511c:	ca27c783          	lbu	a5,-862(a5) # 8000cdba <_ZL9finishedB>
    80005120:	fe0782e3          	beqz	a5,80005104 <_Z18Threads_C_API_testv+0xb4>
    80005124:	00008797          	auipc	a5,0x8
    80005128:	c957c783          	lbu	a5,-875(a5) # 8000cdb9 <_ZL9finishedC>
    8000512c:	fc078ce3          	beqz	a5,80005104 <_Z18Threads_C_API_testv+0xb4>
    80005130:	00008797          	auipc	a5,0x8
    80005134:	c887c783          	lbu	a5,-888(a5) # 8000cdb8 <_ZL9finishedD>
    80005138:	fc0786e3          	beqz	a5,80005104 <_Z18Threads_C_API_testv+0xb4>
    }

}
    8000513c:	02813083          	ld	ra,40(sp)
    80005140:	02013403          	ld	s0,32(sp)
    80005144:	03010113          	addi	sp,sp,48
    80005148:	00008067          	ret

000000008000514c <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    8000514c:	fd010113          	addi	sp,sp,-48
    80005150:	02113423          	sd	ra,40(sp)
    80005154:	02813023          	sd	s0,32(sp)
    80005158:	00913c23          	sd	s1,24(sp)
    8000515c:	01213823          	sd	s2,16(sp)
    80005160:	01313423          	sd	s3,8(sp)
    80005164:	03010413          	addi	s0,sp,48
    80005168:	00050993          	mv	s3,a0
    8000516c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005170:	00000913          	li	s2,0
    80005174:	00c0006f          	j	80005180 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005178:	ffffe097          	auipc	ra,0xffffe
    8000517c:	81c080e7          	jalr	-2020(ra) # 80002994 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005180:	ffffc097          	auipc	ra,0xffffc
    80005184:	3f4080e7          	jalr	1012(ra) # 80001574 <_Z4getcv>
    80005188:	0005059b          	sext.w	a1,a0
    8000518c:	01b00793          	li	a5,27
    80005190:	02f58a63          	beq	a1,a5,800051c4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005194:	0084b503          	ld	a0,8(s1)
    80005198:	00001097          	auipc	ra,0x1
    8000519c:	c64080e7          	jalr	-924(ra) # 80005dfc <_ZN9BufferCPP3putEi>
        i++;
    800051a0:	0019071b          	addiw	a4,s2,1
    800051a4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800051a8:	0004a683          	lw	a3,0(s1)
    800051ac:	0026979b          	slliw	a5,a3,0x2
    800051b0:	00d787bb          	addw	a5,a5,a3
    800051b4:	0017979b          	slliw	a5,a5,0x1
    800051b8:	02f767bb          	remw	a5,a4,a5
    800051bc:	fc0792e3          	bnez	a5,80005180 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800051c0:	fb9ff06f          	j	80005178 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800051c4:	00100793          	li	a5,1
    800051c8:	00008717          	auipc	a4,0x8
    800051cc:	bef72c23          	sw	a5,-1032(a4) # 8000cdc0 <_ZL9threadEnd>
    td->buffer->put('!');
    800051d0:	0209b783          	ld	a5,32(s3)
    800051d4:	02100593          	li	a1,33
    800051d8:	0087b503          	ld	a0,8(a5)
    800051dc:	00001097          	auipc	ra,0x1
    800051e0:	c20080e7          	jalr	-992(ra) # 80005dfc <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800051e4:	0104b503          	ld	a0,16(s1)
    800051e8:	ffffe097          	auipc	ra,0xffffe
    800051ec:	948080e7          	jalr	-1720(ra) # 80002b30 <_ZN9Semaphore6signalEv>
}
    800051f0:	02813083          	ld	ra,40(sp)
    800051f4:	02013403          	ld	s0,32(sp)
    800051f8:	01813483          	ld	s1,24(sp)
    800051fc:	01013903          	ld	s2,16(sp)
    80005200:	00813983          	ld	s3,8(sp)
    80005204:	03010113          	addi	sp,sp,48
    80005208:	00008067          	ret

000000008000520c <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    8000520c:	fe010113          	addi	sp,sp,-32
    80005210:	00113c23          	sd	ra,24(sp)
    80005214:	00813823          	sd	s0,16(sp)
    80005218:	00913423          	sd	s1,8(sp)
    8000521c:	01213023          	sd	s2,0(sp)
    80005220:	02010413          	addi	s0,sp,32
    80005224:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005228:	00000913          	li	s2,0
    8000522c:	00c0006f          	j	80005238 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005230:	ffffd097          	auipc	ra,0xffffd
    80005234:	764080e7          	jalr	1892(ra) # 80002994 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005238:	00008797          	auipc	a5,0x8
    8000523c:	b887a783          	lw	a5,-1144(a5) # 8000cdc0 <_ZL9threadEnd>
    80005240:	02079e63          	bnez	a5,8000527c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005244:	0004a583          	lw	a1,0(s1)
    80005248:	0305859b          	addiw	a1,a1,48
    8000524c:	0084b503          	ld	a0,8(s1)
    80005250:	00001097          	auipc	ra,0x1
    80005254:	bac080e7          	jalr	-1108(ra) # 80005dfc <_ZN9BufferCPP3putEi>
        i++;
    80005258:	0019071b          	addiw	a4,s2,1
    8000525c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005260:	0004a683          	lw	a3,0(s1)
    80005264:	0026979b          	slliw	a5,a3,0x2
    80005268:	00d787bb          	addw	a5,a5,a3
    8000526c:	0017979b          	slliw	a5,a5,0x1
    80005270:	02f767bb          	remw	a5,a4,a5
    80005274:	fc0792e3          	bnez	a5,80005238 <_ZN12ProducerSync8producerEPv+0x2c>
    80005278:	fb9ff06f          	j	80005230 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    8000527c:	0104b503          	ld	a0,16(s1)
    80005280:	ffffe097          	auipc	ra,0xffffe
    80005284:	8b0080e7          	jalr	-1872(ra) # 80002b30 <_ZN9Semaphore6signalEv>
}
    80005288:	01813083          	ld	ra,24(sp)
    8000528c:	01013403          	ld	s0,16(sp)
    80005290:	00813483          	ld	s1,8(sp)
    80005294:	00013903          	ld	s2,0(sp)
    80005298:	02010113          	addi	sp,sp,32
    8000529c:	00008067          	ret

00000000800052a0 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    800052a0:	fd010113          	addi	sp,sp,-48
    800052a4:	02113423          	sd	ra,40(sp)
    800052a8:	02813023          	sd	s0,32(sp)
    800052ac:	00913c23          	sd	s1,24(sp)
    800052b0:	01213823          	sd	s2,16(sp)
    800052b4:	01313423          	sd	s3,8(sp)
    800052b8:	01413023          	sd	s4,0(sp)
    800052bc:	03010413          	addi	s0,sp,48
    800052c0:	00050993          	mv	s3,a0
    800052c4:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800052c8:	00000a13          	li	s4,0
    800052cc:	01c0006f          	j	800052e8 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800052d0:	ffffd097          	auipc	ra,0xffffd
    800052d4:	6c4080e7          	jalr	1732(ra) # 80002994 <_ZN6Thread8dispatchEv>
    800052d8:	0500006f          	j	80005328 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800052dc:	00a00513          	li	a0,10
    800052e0:	ffffc097          	auipc	ra,0xffffc
    800052e4:	2bc080e7          	jalr	700(ra) # 8000159c <_Z4putcc>
    while (!threadEnd) {
    800052e8:	00008797          	auipc	a5,0x8
    800052ec:	ad87a783          	lw	a5,-1320(a5) # 8000cdc0 <_ZL9threadEnd>
    800052f0:	06079263          	bnez	a5,80005354 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800052f4:	00893503          	ld	a0,8(s2)
    800052f8:	00001097          	auipc	ra,0x1
    800052fc:	b94080e7          	jalr	-1132(ra) # 80005e8c <_ZN9BufferCPP3getEv>
        i++;
    80005300:	001a049b          	addiw	s1,s4,1
    80005304:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005308:	0ff57513          	andi	a0,a0,255
    8000530c:	ffffc097          	auipc	ra,0xffffc
    80005310:	290080e7          	jalr	656(ra) # 8000159c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005314:	00092703          	lw	a4,0(s2)
    80005318:	0027179b          	slliw	a5,a4,0x2
    8000531c:	00e787bb          	addw	a5,a5,a4
    80005320:	02f4e7bb          	remw	a5,s1,a5
    80005324:	fa0786e3          	beqz	a5,800052d0 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005328:	05000793          	li	a5,80
    8000532c:	02f4e4bb          	remw	s1,s1,a5
    80005330:	fa049ce3          	bnez	s1,800052e8 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005334:	fa9ff06f          	j	800052dc <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005338:	0209b783          	ld	a5,32(s3)
    8000533c:	0087b503          	ld	a0,8(a5)
    80005340:	00001097          	auipc	ra,0x1
    80005344:	b4c080e7          	jalr	-1204(ra) # 80005e8c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005348:	0ff57513          	andi	a0,a0,255
    8000534c:	ffffe097          	auipc	ra,0xffffe
    80005350:	8a8080e7          	jalr	-1880(ra) # 80002bf4 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005354:	0209b783          	ld	a5,32(s3)
    80005358:	0087b503          	ld	a0,8(a5)
    8000535c:	00001097          	auipc	ra,0x1
    80005360:	bbc080e7          	jalr	-1092(ra) # 80005f18 <_ZN9BufferCPP6getCntEv>
    80005364:	fca04ae3          	bgtz	a0,80005338 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005368:	01093503          	ld	a0,16(s2)
    8000536c:	ffffd097          	auipc	ra,0xffffd
    80005370:	7c4080e7          	jalr	1988(ra) # 80002b30 <_ZN9Semaphore6signalEv>
}
    80005374:	02813083          	ld	ra,40(sp)
    80005378:	02013403          	ld	s0,32(sp)
    8000537c:	01813483          	ld	s1,24(sp)
    80005380:	01013903          	ld	s2,16(sp)
    80005384:	00813983          	ld	s3,8(sp)
    80005388:	00013a03          	ld	s4,0(sp)
    8000538c:	03010113          	addi	sp,sp,48
    80005390:	00008067          	ret

0000000080005394 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005394:	f8010113          	addi	sp,sp,-128
    80005398:	06113c23          	sd	ra,120(sp)
    8000539c:	06813823          	sd	s0,112(sp)
    800053a0:	06913423          	sd	s1,104(sp)
    800053a4:	07213023          	sd	s2,96(sp)
    800053a8:	05313c23          	sd	s3,88(sp)
    800053ac:	05413823          	sd	s4,80(sp)
    800053b0:	05513423          	sd	s5,72(sp)
    800053b4:	05613023          	sd	s6,64(sp)
    800053b8:	03713c23          	sd	s7,56(sp)
    800053bc:	03813823          	sd	s8,48(sp)
    800053c0:	03913423          	sd	s9,40(sp)
    800053c4:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800053c8:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800053cc:	00005517          	auipc	a0,0x5
    800053d0:	e2c50513          	addi	a0,a0,-468 # 8000a1f8 <CONSOLE_STATUS+0x1e8>
    800053d4:	00000097          	auipc	ra,0x0
    800053d8:	604080e7          	jalr	1540(ra) # 800059d8 <_Z11printStringPKc>
    getString(input, 30);
    800053dc:	01e00593          	li	a1,30
    800053e0:	f8040493          	addi	s1,s0,-128
    800053e4:	00048513          	mv	a0,s1
    800053e8:	00000097          	auipc	ra,0x0
    800053ec:	678080e7          	jalr	1656(ra) # 80005a60 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800053f0:	00048513          	mv	a0,s1
    800053f4:	00000097          	auipc	ra,0x0
    800053f8:	744080e7          	jalr	1860(ra) # 80005b38 <_Z11stringToIntPKc>
    800053fc:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005400:	00005517          	auipc	a0,0x5
    80005404:	e1850513          	addi	a0,a0,-488 # 8000a218 <CONSOLE_STATUS+0x208>
    80005408:	00000097          	auipc	ra,0x0
    8000540c:	5d0080e7          	jalr	1488(ra) # 800059d8 <_Z11printStringPKc>
    getString(input, 30);
    80005410:	01e00593          	li	a1,30
    80005414:	00048513          	mv	a0,s1
    80005418:	00000097          	auipc	ra,0x0
    8000541c:	648080e7          	jalr	1608(ra) # 80005a60 <_Z9getStringPci>
    n = stringToInt(input);
    80005420:	00048513          	mv	a0,s1
    80005424:	00000097          	auipc	ra,0x0
    80005428:	714080e7          	jalr	1812(ra) # 80005b38 <_Z11stringToIntPKc>
    8000542c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005430:	00005517          	auipc	a0,0x5
    80005434:	e0850513          	addi	a0,a0,-504 # 8000a238 <CONSOLE_STATUS+0x228>
    80005438:	00000097          	auipc	ra,0x0
    8000543c:	5a0080e7          	jalr	1440(ra) # 800059d8 <_Z11printStringPKc>
    80005440:	00000613          	li	a2,0
    80005444:	00a00593          	li	a1,10
    80005448:	00090513          	mv	a0,s2
    8000544c:	00000097          	auipc	ra,0x0
    80005450:	73c080e7          	jalr	1852(ra) # 80005b88 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005454:	00005517          	auipc	a0,0x5
    80005458:	dfc50513          	addi	a0,a0,-516 # 8000a250 <CONSOLE_STATUS+0x240>
    8000545c:	00000097          	auipc	ra,0x0
    80005460:	57c080e7          	jalr	1404(ra) # 800059d8 <_Z11printStringPKc>
    80005464:	00000613          	li	a2,0
    80005468:	00a00593          	li	a1,10
    8000546c:	00048513          	mv	a0,s1
    80005470:	00000097          	auipc	ra,0x0
    80005474:	718080e7          	jalr	1816(ra) # 80005b88 <_Z8printIntiii>
    printString(".\n");
    80005478:	00005517          	auipc	a0,0x5
    8000547c:	df050513          	addi	a0,a0,-528 # 8000a268 <CONSOLE_STATUS+0x258>
    80005480:	00000097          	auipc	ra,0x0
    80005484:	558080e7          	jalr	1368(ra) # 800059d8 <_Z11printStringPKc>
    if(threadNum > n) {
    80005488:	0324c463          	blt	s1,s2,800054b0 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    8000548c:	03205c63          	blez	s2,800054c4 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005490:	03800513          	li	a0,56
    80005494:	ffffd097          	auipc	ra,0xffffd
    80005498:	2e4080e7          	jalr	740(ra) # 80002778 <_Znwm>
    8000549c:	00050a93          	mv	s5,a0
    800054a0:	00048593          	mv	a1,s1
    800054a4:	00001097          	auipc	ra,0x1
    800054a8:	804080e7          	jalr	-2044(ra) # 80005ca8 <_ZN9BufferCPPC1Ei>
    800054ac:	0300006f          	j	800054dc <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800054b0:	00005517          	auipc	a0,0x5
    800054b4:	dc050513          	addi	a0,a0,-576 # 8000a270 <CONSOLE_STATUS+0x260>
    800054b8:	00000097          	auipc	ra,0x0
    800054bc:	520080e7          	jalr	1312(ra) # 800059d8 <_Z11printStringPKc>
        return;
    800054c0:	0140006f          	j	800054d4 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800054c4:	00005517          	auipc	a0,0x5
    800054c8:	dec50513          	addi	a0,a0,-532 # 8000a2b0 <CONSOLE_STATUS+0x2a0>
    800054cc:	00000097          	auipc	ra,0x0
    800054d0:	50c080e7          	jalr	1292(ra) # 800059d8 <_Z11printStringPKc>
        return;
    800054d4:	000b8113          	mv	sp,s7
    800054d8:	2380006f          	j	80005710 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800054dc:	01000513          	li	a0,16
    800054e0:	ffffd097          	auipc	ra,0xffffd
    800054e4:	298080e7          	jalr	664(ra) # 80002778 <_Znwm>
    800054e8:	00050493          	mv	s1,a0
    800054ec:	00000593          	li	a1,0
    800054f0:	ffffd097          	auipc	ra,0xffffd
    800054f4:	5dc080e7          	jalr	1500(ra) # 80002acc <_ZN9SemaphoreC1Ej>
    800054f8:	00008797          	auipc	a5,0x8
    800054fc:	8c97b823          	sd	s1,-1840(a5) # 8000cdc8 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005500:	00391793          	slli	a5,s2,0x3
    80005504:	00f78793          	addi	a5,a5,15
    80005508:	ff07f793          	andi	a5,a5,-16
    8000550c:	40f10133          	sub	sp,sp,a5
    80005510:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005514:	0019071b          	addiw	a4,s2,1
    80005518:	00171793          	slli	a5,a4,0x1
    8000551c:	00e787b3          	add	a5,a5,a4
    80005520:	00379793          	slli	a5,a5,0x3
    80005524:	00f78793          	addi	a5,a5,15
    80005528:	ff07f793          	andi	a5,a5,-16
    8000552c:	40f10133          	sub	sp,sp,a5
    80005530:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005534:	00191c13          	slli	s8,s2,0x1
    80005538:	012c07b3          	add	a5,s8,s2
    8000553c:	00379793          	slli	a5,a5,0x3
    80005540:	00fa07b3          	add	a5,s4,a5
    80005544:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005548:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    8000554c:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005550:	02800513          	li	a0,40
    80005554:	ffffd097          	auipc	ra,0xffffd
    80005558:	224080e7          	jalr	548(ra) # 80002778 <_Znwm>
    8000555c:	00050b13          	mv	s6,a0
    80005560:	012c0c33          	add	s8,s8,s2
    80005564:	003c1c13          	slli	s8,s8,0x3
    80005568:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    8000556c:	ffffd097          	auipc	ra,0xffffd
    80005570:	4e4080e7          	jalr	1252(ra) # 80002a50 <_ZN6ThreadC1Ev>
    80005574:	00007797          	auipc	a5,0x7
    80005578:	5a478793          	addi	a5,a5,1444 # 8000cb18 <_ZTV12ConsumerSync+0x10>
    8000557c:	00fb3023          	sd	a5,0(s6)
    80005580:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005584:	000b0513          	mv	a0,s6
    80005588:	ffffd097          	auipc	ra,0xffffd
    8000558c:	3a8080e7          	jalr	936(ra) # 80002930 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005590:	00000493          	li	s1,0
    80005594:	0380006f          	j	800055cc <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005598:	00007797          	auipc	a5,0x7
    8000559c:	55878793          	addi	a5,a5,1368 # 8000caf0 <_ZTV12ProducerSync+0x10>
    800055a0:	00fcb023          	sd	a5,0(s9)
    800055a4:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    800055a8:	00349793          	slli	a5,s1,0x3
    800055ac:	00f987b3          	add	a5,s3,a5
    800055b0:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800055b4:	00349793          	slli	a5,s1,0x3
    800055b8:	00f987b3          	add	a5,s3,a5
    800055bc:	0007b503          	ld	a0,0(a5)
    800055c0:	ffffd097          	auipc	ra,0xffffd
    800055c4:	370080e7          	jalr	880(ra) # 80002930 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800055c8:	0014849b          	addiw	s1,s1,1
    800055cc:	0b24d063          	bge	s1,s2,8000566c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800055d0:	00149793          	slli	a5,s1,0x1
    800055d4:	009787b3          	add	a5,a5,s1
    800055d8:	00379793          	slli	a5,a5,0x3
    800055dc:	00fa07b3          	add	a5,s4,a5
    800055e0:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800055e4:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800055e8:	00007717          	auipc	a4,0x7
    800055ec:	7e073703          	ld	a4,2016(a4) # 8000cdc8 <_ZL10waitForAll>
    800055f0:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800055f4:	02905863          	blez	s1,80005624 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800055f8:	02800513          	li	a0,40
    800055fc:	ffffd097          	auipc	ra,0xffffd
    80005600:	17c080e7          	jalr	380(ra) # 80002778 <_Znwm>
    80005604:	00050c93          	mv	s9,a0
    80005608:	00149c13          	slli	s8,s1,0x1
    8000560c:	009c0c33          	add	s8,s8,s1
    80005610:	003c1c13          	slli	s8,s8,0x3
    80005614:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005618:	ffffd097          	auipc	ra,0xffffd
    8000561c:	438080e7          	jalr	1080(ra) # 80002a50 <_ZN6ThreadC1Ev>
    80005620:	f79ff06f          	j	80005598 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005624:	02800513          	li	a0,40
    80005628:	ffffd097          	auipc	ra,0xffffd
    8000562c:	150080e7          	jalr	336(ra) # 80002778 <_Znwm>
    80005630:	00050c93          	mv	s9,a0
    80005634:	00149c13          	slli	s8,s1,0x1
    80005638:	009c0c33          	add	s8,s8,s1
    8000563c:	003c1c13          	slli	s8,s8,0x3
    80005640:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005644:	ffffd097          	auipc	ra,0xffffd
    80005648:	40c080e7          	jalr	1036(ra) # 80002a50 <_ZN6ThreadC1Ev>
    8000564c:	00007797          	auipc	a5,0x7
    80005650:	47c78793          	addi	a5,a5,1148 # 8000cac8 <_ZTV16ProducerKeyboard+0x10>
    80005654:	00fcb023          	sd	a5,0(s9)
    80005658:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    8000565c:	00349793          	slli	a5,s1,0x3
    80005660:	00f987b3          	add	a5,s3,a5
    80005664:	0197b023          	sd	s9,0(a5)
    80005668:	f4dff06f          	j	800055b4 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    8000566c:	ffffd097          	auipc	ra,0xffffd
    80005670:	328080e7          	jalr	808(ra) # 80002994 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005674:	00000493          	li	s1,0
    80005678:	00994e63          	blt	s2,s1,80005694 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    8000567c:	00007517          	auipc	a0,0x7
    80005680:	74c53503          	ld	a0,1868(a0) # 8000cdc8 <_ZL10waitForAll>
    80005684:	ffffd097          	auipc	ra,0xffffd
    80005688:	480080e7          	jalr	1152(ra) # 80002b04 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000568c:	0014849b          	addiw	s1,s1,1
    80005690:	fe9ff06f          	j	80005678 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005694:	00000493          	li	s1,0
    80005698:	0080006f          	j	800056a0 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    8000569c:	0014849b          	addiw	s1,s1,1
    800056a0:	0324d263          	bge	s1,s2,800056c4 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    800056a4:	00349793          	slli	a5,s1,0x3
    800056a8:	00f987b3          	add	a5,s3,a5
    800056ac:	0007b503          	ld	a0,0(a5)
    800056b0:	fe0506e3          	beqz	a0,8000569c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800056b4:	00053783          	ld	a5,0(a0)
    800056b8:	0087b783          	ld	a5,8(a5)
    800056bc:	000780e7          	jalr	a5
    800056c0:	fddff06f          	j	8000569c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800056c4:	000b0a63          	beqz	s6,800056d8 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800056c8:	000b3783          	ld	a5,0(s6)
    800056cc:	0087b783          	ld	a5,8(a5)
    800056d0:	000b0513          	mv	a0,s6
    800056d4:	000780e7          	jalr	a5
    delete waitForAll;
    800056d8:	00007517          	auipc	a0,0x7
    800056dc:	6f053503          	ld	a0,1776(a0) # 8000cdc8 <_ZL10waitForAll>
    800056e0:	00050863          	beqz	a0,800056f0 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800056e4:	00053783          	ld	a5,0(a0)
    800056e8:	0087b783          	ld	a5,8(a5)
    800056ec:	000780e7          	jalr	a5
    delete buffer;
    800056f0:	000a8e63          	beqz	s5,8000570c <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800056f4:	000a8513          	mv	a0,s5
    800056f8:	00001097          	auipc	ra,0x1
    800056fc:	8a8080e7          	jalr	-1880(ra) # 80005fa0 <_ZN9BufferCPPD1Ev>
    80005700:	000a8513          	mv	a0,s5
    80005704:	ffffd097          	auipc	ra,0xffffd
    80005708:	0c4080e7          	jalr	196(ra) # 800027c8 <_ZdlPv>
    8000570c:	000b8113          	mv	sp,s7

}
    80005710:	f8040113          	addi	sp,s0,-128
    80005714:	07813083          	ld	ra,120(sp)
    80005718:	07013403          	ld	s0,112(sp)
    8000571c:	06813483          	ld	s1,104(sp)
    80005720:	06013903          	ld	s2,96(sp)
    80005724:	05813983          	ld	s3,88(sp)
    80005728:	05013a03          	ld	s4,80(sp)
    8000572c:	04813a83          	ld	s5,72(sp)
    80005730:	04013b03          	ld	s6,64(sp)
    80005734:	03813b83          	ld	s7,56(sp)
    80005738:	03013c03          	ld	s8,48(sp)
    8000573c:	02813c83          	ld	s9,40(sp)
    80005740:	08010113          	addi	sp,sp,128
    80005744:	00008067          	ret
    80005748:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000574c:	000a8513          	mv	a0,s5
    80005750:	ffffd097          	auipc	ra,0xffffd
    80005754:	078080e7          	jalr	120(ra) # 800027c8 <_ZdlPv>
    80005758:	00048513          	mv	a0,s1
    8000575c:	00008097          	auipc	ra,0x8
    80005760:	76c080e7          	jalr	1900(ra) # 8000dec8 <_Unwind_Resume>
    80005764:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005768:	00048513          	mv	a0,s1
    8000576c:	ffffd097          	auipc	ra,0xffffd
    80005770:	05c080e7          	jalr	92(ra) # 800027c8 <_ZdlPv>
    80005774:	00090513          	mv	a0,s2
    80005778:	00008097          	auipc	ra,0x8
    8000577c:	750080e7          	jalr	1872(ra) # 8000dec8 <_Unwind_Resume>
    80005780:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005784:	000b0513          	mv	a0,s6
    80005788:	ffffd097          	auipc	ra,0xffffd
    8000578c:	040080e7          	jalr	64(ra) # 800027c8 <_ZdlPv>
    80005790:	00048513          	mv	a0,s1
    80005794:	00008097          	auipc	ra,0x8
    80005798:	734080e7          	jalr	1844(ra) # 8000dec8 <_Unwind_Resume>
    8000579c:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    800057a0:	000c8513          	mv	a0,s9
    800057a4:	ffffd097          	auipc	ra,0xffffd
    800057a8:	024080e7          	jalr	36(ra) # 800027c8 <_ZdlPv>
    800057ac:	00048513          	mv	a0,s1
    800057b0:	00008097          	auipc	ra,0x8
    800057b4:	718080e7          	jalr	1816(ra) # 8000dec8 <_Unwind_Resume>
    800057b8:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800057bc:	000c8513          	mv	a0,s9
    800057c0:	ffffd097          	auipc	ra,0xffffd
    800057c4:	008080e7          	jalr	8(ra) # 800027c8 <_ZdlPv>
    800057c8:	00048513          	mv	a0,s1
    800057cc:	00008097          	auipc	ra,0x8
    800057d0:	6fc080e7          	jalr	1788(ra) # 8000dec8 <_Unwind_Resume>

00000000800057d4 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800057d4:	ff010113          	addi	sp,sp,-16
    800057d8:	00113423          	sd	ra,8(sp)
    800057dc:	00813023          	sd	s0,0(sp)
    800057e0:	01010413          	addi	s0,sp,16
    800057e4:	00007797          	auipc	a5,0x7
    800057e8:	33478793          	addi	a5,a5,820 # 8000cb18 <_ZTV12ConsumerSync+0x10>
    800057ec:	00f53023          	sd	a5,0(a0)
    800057f0:	ffffd097          	auipc	ra,0xffffd
    800057f4:	e98080e7          	jalr	-360(ra) # 80002688 <_ZN6ThreadD1Ev>
    800057f8:	00813083          	ld	ra,8(sp)
    800057fc:	00013403          	ld	s0,0(sp)
    80005800:	01010113          	addi	sp,sp,16
    80005804:	00008067          	ret

0000000080005808 <_ZN12ConsumerSyncD0Ev>:
    80005808:	fe010113          	addi	sp,sp,-32
    8000580c:	00113c23          	sd	ra,24(sp)
    80005810:	00813823          	sd	s0,16(sp)
    80005814:	00913423          	sd	s1,8(sp)
    80005818:	02010413          	addi	s0,sp,32
    8000581c:	00050493          	mv	s1,a0
    80005820:	00007797          	auipc	a5,0x7
    80005824:	2f878793          	addi	a5,a5,760 # 8000cb18 <_ZTV12ConsumerSync+0x10>
    80005828:	00f53023          	sd	a5,0(a0)
    8000582c:	ffffd097          	auipc	ra,0xffffd
    80005830:	e5c080e7          	jalr	-420(ra) # 80002688 <_ZN6ThreadD1Ev>
    80005834:	00048513          	mv	a0,s1
    80005838:	ffffd097          	auipc	ra,0xffffd
    8000583c:	f90080e7          	jalr	-112(ra) # 800027c8 <_ZdlPv>
    80005840:	01813083          	ld	ra,24(sp)
    80005844:	01013403          	ld	s0,16(sp)
    80005848:	00813483          	ld	s1,8(sp)
    8000584c:	02010113          	addi	sp,sp,32
    80005850:	00008067          	ret

0000000080005854 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005854:	ff010113          	addi	sp,sp,-16
    80005858:	00113423          	sd	ra,8(sp)
    8000585c:	00813023          	sd	s0,0(sp)
    80005860:	01010413          	addi	s0,sp,16
    80005864:	00007797          	auipc	a5,0x7
    80005868:	28c78793          	addi	a5,a5,652 # 8000caf0 <_ZTV12ProducerSync+0x10>
    8000586c:	00f53023          	sd	a5,0(a0)
    80005870:	ffffd097          	auipc	ra,0xffffd
    80005874:	e18080e7          	jalr	-488(ra) # 80002688 <_ZN6ThreadD1Ev>
    80005878:	00813083          	ld	ra,8(sp)
    8000587c:	00013403          	ld	s0,0(sp)
    80005880:	01010113          	addi	sp,sp,16
    80005884:	00008067          	ret

0000000080005888 <_ZN12ProducerSyncD0Ev>:
    80005888:	fe010113          	addi	sp,sp,-32
    8000588c:	00113c23          	sd	ra,24(sp)
    80005890:	00813823          	sd	s0,16(sp)
    80005894:	00913423          	sd	s1,8(sp)
    80005898:	02010413          	addi	s0,sp,32
    8000589c:	00050493          	mv	s1,a0
    800058a0:	00007797          	auipc	a5,0x7
    800058a4:	25078793          	addi	a5,a5,592 # 8000caf0 <_ZTV12ProducerSync+0x10>
    800058a8:	00f53023          	sd	a5,0(a0)
    800058ac:	ffffd097          	auipc	ra,0xffffd
    800058b0:	ddc080e7          	jalr	-548(ra) # 80002688 <_ZN6ThreadD1Ev>
    800058b4:	00048513          	mv	a0,s1
    800058b8:	ffffd097          	auipc	ra,0xffffd
    800058bc:	f10080e7          	jalr	-240(ra) # 800027c8 <_ZdlPv>
    800058c0:	01813083          	ld	ra,24(sp)
    800058c4:	01013403          	ld	s0,16(sp)
    800058c8:	00813483          	ld	s1,8(sp)
    800058cc:	02010113          	addi	sp,sp,32
    800058d0:	00008067          	ret

00000000800058d4 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800058d4:	ff010113          	addi	sp,sp,-16
    800058d8:	00113423          	sd	ra,8(sp)
    800058dc:	00813023          	sd	s0,0(sp)
    800058e0:	01010413          	addi	s0,sp,16
    800058e4:	00007797          	auipc	a5,0x7
    800058e8:	1e478793          	addi	a5,a5,484 # 8000cac8 <_ZTV16ProducerKeyboard+0x10>
    800058ec:	00f53023          	sd	a5,0(a0)
    800058f0:	ffffd097          	auipc	ra,0xffffd
    800058f4:	d98080e7          	jalr	-616(ra) # 80002688 <_ZN6ThreadD1Ev>
    800058f8:	00813083          	ld	ra,8(sp)
    800058fc:	00013403          	ld	s0,0(sp)
    80005900:	01010113          	addi	sp,sp,16
    80005904:	00008067          	ret

0000000080005908 <_ZN16ProducerKeyboardD0Ev>:
    80005908:	fe010113          	addi	sp,sp,-32
    8000590c:	00113c23          	sd	ra,24(sp)
    80005910:	00813823          	sd	s0,16(sp)
    80005914:	00913423          	sd	s1,8(sp)
    80005918:	02010413          	addi	s0,sp,32
    8000591c:	00050493          	mv	s1,a0
    80005920:	00007797          	auipc	a5,0x7
    80005924:	1a878793          	addi	a5,a5,424 # 8000cac8 <_ZTV16ProducerKeyboard+0x10>
    80005928:	00f53023          	sd	a5,0(a0)
    8000592c:	ffffd097          	auipc	ra,0xffffd
    80005930:	d5c080e7          	jalr	-676(ra) # 80002688 <_ZN6ThreadD1Ev>
    80005934:	00048513          	mv	a0,s1
    80005938:	ffffd097          	auipc	ra,0xffffd
    8000593c:	e90080e7          	jalr	-368(ra) # 800027c8 <_ZdlPv>
    80005940:	01813083          	ld	ra,24(sp)
    80005944:	01013403          	ld	s0,16(sp)
    80005948:	00813483          	ld	s1,8(sp)
    8000594c:	02010113          	addi	sp,sp,32
    80005950:	00008067          	ret

0000000080005954 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005954:	ff010113          	addi	sp,sp,-16
    80005958:	00113423          	sd	ra,8(sp)
    8000595c:	00813023          	sd	s0,0(sp)
    80005960:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005964:	02053583          	ld	a1,32(a0)
    80005968:	fffff097          	auipc	ra,0xfffff
    8000596c:	7e4080e7          	jalr	2020(ra) # 8000514c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005970:	00813083          	ld	ra,8(sp)
    80005974:	00013403          	ld	s0,0(sp)
    80005978:	01010113          	addi	sp,sp,16
    8000597c:	00008067          	ret

0000000080005980 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005980:	ff010113          	addi	sp,sp,-16
    80005984:	00113423          	sd	ra,8(sp)
    80005988:	00813023          	sd	s0,0(sp)
    8000598c:	01010413          	addi	s0,sp,16
        producer(td);
    80005990:	02053583          	ld	a1,32(a0)
    80005994:	00000097          	auipc	ra,0x0
    80005998:	878080e7          	jalr	-1928(ra) # 8000520c <_ZN12ProducerSync8producerEPv>
    }
    8000599c:	00813083          	ld	ra,8(sp)
    800059a0:	00013403          	ld	s0,0(sp)
    800059a4:	01010113          	addi	sp,sp,16
    800059a8:	00008067          	ret

00000000800059ac <_ZN12ConsumerSync3runEv>:
    void run() override {
    800059ac:	ff010113          	addi	sp,sp,-16
    800059b0:	00113423          	sd	ra,8(sp)
    800059b4:	00813023          	sd	s0,0(sp)
    800059b8:	01010413          	addi	s0,sp,16
        consumer(td);
    800059bc:	02053583          	ld	a1,32(a0)
    800059c0:	00000097          	auipc	ra,0x0
    800059c4:	8e0080e7          	jalr	-1824(ra) # 800052a0 <_ZN12ConsumerSync8consumerEPv>
    }
    800059c8:	00813083          	ld	ra,8(sp)
    800059cc:	00013403          	ld	s0,0(sp)
    800059d0:	01010113          	addi	sp,sp,16
    800059d4:	00008067          	ret

00000000800059d8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800059d8:	fe010113          	addi	sp,sp,-32
    800059dc:	00113c23          	sd	ra,24(sp)
    800059e0:	00813823          	sd	s0,16(sp)
    800059e4:	00913423          	sd	s1,8(sp)
    800059e8:	02010413          	addi	s0,sp,32
    800059ec:	00050493          	mv	s1,a0
    LOCK();
    800059f0:	00100613          	li	a2,1
    800059f4:	00000593          	li	a1,0
    800059f8:	00007517          	auipc	a0,0x7
    800059fc:	3d850513          	addi	a0,a0,984 # 8000cdd0 <lockPrint>
    80005a00:	ffffb097          	auipc	ra,0xffffb
    80005a04:	724080e7          	jalr	1828(ra) # 80001124 <copy_and_swap>
    80005a08:	00050863          	beqz	a0,80005a18 <_Z11printStringPKc+0x40>
    80005a0c:	ffffc097          	auipc	ra,0xffffc
    80005a10:	a28080e7          	jalr	-1496(ra) # 80001434 <_Z15thread_dispatchv>
    80005a14:	fddff06f          	j	800059f0 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005a18:	0004c503          	lbu	a0,0(s1)
    80005a1c:	00050a63          	beqz	a0,80005a30 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005a20:	ffffc097          	auipc	ra,0xffffc
    80005a24:	b7c080e7          	jalr	-1156(ra) # 8000159c <_Z4putcc>
        string++;
    80005a28:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005a2c:	fedff06f          	j	80005a18 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005a30:	00000613          	li	a2,0
    80005a34:	00100593          	li	a1,1
    80005a38:	00007517          	auipc	a0,0x7
    80005a3c:	39850513          	addi	a0,a0,920 # 8000cdd0 <lockPrint>
    80005a40:	ffffb097          	auipc	ra,0xffffb
    80005a44:	6e4080e7          	jalr	1764(ra) # 80001124 <copy_and_swap>
    80005a48:	fe0514e3          	bnez	a0,80005a30 <_Z11printStringPKc+0x58>
}
    80005a4c:	01813083          	ld	ra,24(sp)
    80005a50:	01013403          	ld	s0,16(sp)
    80005a54:	00813483          	ld	s1,8(sp)
    80005a58:	02010113          	addi	sp,sp,32
    80005a5c:	00008067          	ret

0000000080005a60 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005a60:	fd010113          	addi	sp,sp,-48
    80005a64:	02113423          	sd	ra,40(sp)
    80005a68:	02813023          	sd	s0,32(sp)
    80005a6c:	00913c23          	sd	s1,24(sp)
    80005a70:	01213823          	sd	s2,16(sp)
    80005a74:	01313423          	sd	s3,8(sp)
    80005a78:	01413023          	sd	s4,0(sp)
    80005a7c:	03010413          	addi	s0,sp,48
    80005a80:	00050993          	mv	s3,a0
    80005a84:	00058a13          	mv	s4,a1
    LOCK();
    80005a88:	00100613          	li	a2,1
    80005a8c:	00000593          	li	a1,0
    80005a90:	00007517          	auipc	a0,0x7
    80005a94:	34050513          	addi	a0,a0,832 # 8000cdd0 <lockPrint>
    80005a98:	ffffb097          	auipc	ra,0xffffb
    80005a9c:	68c080e7          	jalr	1676(ra) # 80001124 <copy_and_swap>
    80005aa0:	00050863          	beqz	a0,80005ab0 <_Z9getStringPci+0x50>
    80005aa4:	ffffc097          	auipc	ra,0xffffc
    80005aa8:	990080e7          	jalr	-1648(ra) # 80001434 <_Z15thread_dispatchv>
    80005aac:	fddff06f          	j	80005a88 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005ab0:	00000913          	li	s2,0
    80005ab4:	00090493          	mv	s1,s2
    80005ab8:	0019091b          	addiw	s2,s2,1
    80005abc:	03495a63          	bge	s2,s4,80005af0 <_Z9getStringPci+0x90>
        cc = getc();
    80005ac0:	ffffc097          	auipc	ra,0xffffc
    80005ac4:	ab4080e7          	jalr	-1356(ra) # 80001574 <_Z4getcv>
        if(cc < 1)
    80005ac8:	02050463          	beqz	a0,80005af0 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005acc:	009984b3          	add	s1,s3,s1
    80005ad0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005ad4:	00a00793          	li	a5,10
    80005ad8:	00f50a63          	beq	a0,a5,80005aec <_Z9getStringPci+0x8c>
    80005adc:	00d00793          	li	a5,13
    80005ae0:	fcf51ae3          	bne	a0,a5,80005ab4 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005ae4:	00090493          	mv	s1,s2
    80005ae8:	0080006f          	j	80005af0 <_Z9getStringPci+0x90>
    80005aec:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005af0:	009984b3          	add	s1,s3,s1
    80005af4:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005af8:	00000613          	li	a2,0
    80005afc:	00100593          	li	a1,1
    80005b00:	00007517          	auipc	a0,0x7
    80005b04:	2d050513          	addi	a0,a0,720 # 8000cdd0 <lockPrint>
    80005b08:	ffffb097          	auipc	ra,0xffffb
    80005b0c:	61c080e7          	jalr	1564(ra) # 80001124 <copy_and_swap>
    80005b10:	fe0514e3          	bnez	a0,80005af8 <_Z9getStringPci+0x98>
    return buf;
}
    80005b14:	00098513          	mv	a0,s3
    80005b18:	02813083          	ld	ra,40(sp)
    80005b1c:	02013403          	ld	s0,32(sp)
    80005b20:	01813483          	ld	s1,24(sp)
    80005b24:	01013903          	ld	s2,16(sp)
    80005b28:	00813983          	ld	s3,8(sp)
    80005b2c:	00013a03          	ld	s4,0(sp)
    80005b30:	03010113          	addi	sp,sp,48
    80005b34:	00008067          	ret

0000000080005b38 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005b38:	ff010113          	addi	sp,sp,-16
    80005b3c:	00813423          	sd	s0,8(sp)
    80005b40:	01010413          	addi	s0,sp,16
    80005b44:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005b48:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005b4c:	0006c603          	lbu	a2,0(a3)
    80005b50:	fd06071b          	addiw	a4,a2,-48
    80005b54:	0ff77713          	andi	a4,a4,255
    80005b58:	00900793          	li	a5,9
    80005b5c:	02e7e063          	bltu	a5,a4,80005b7c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005b60:	0025179b          	slliw	a5,a0,0x2
    80005b64:	00a787bb          	addw	a5,a5,a0
    80005b68:	0017979b          	slliw	a5,a5,0x1
    80005b6c:	00168693          	addi	a3,a3,1
    80005b70:	00c787bb          	addw	a5,a5,a2
    80005b74:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005b78:	fd5ff06f          	j	80005b4c <_Z11stringToIntPKc+0x14>
    return n;
}
    80005b7c:	00813403          	ld	s0,8(sp)
    80005b80:	01010113          	addi	sp,sp,16
    80005b84:	00008067          	ret

0000000080005b88 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005b88:	fc010113          	addi	sp,sp,-64
    80005b8c:	02113c23          	sd	ra,56(sp)
    80005b90:	02813823          	sd	s0,48(sp)
    80005b94:	02913423          	sd	s1,40(sp)
    80005b98:	03213023          	sd	s2,32(sp)
    80005b9c:	01313c23          	sd	s3,24(sp)
    80005ba0:	04010413          	addi	s0,sp,64
    80005ba4:	00050493          	mv	s1,a0
    80005ba8:	00058913          	mv	s2,a1
    80005bac:	00060993          	mv	s3,a2
    LOCK();
    80005bb0:	00100613          	li	a2,1
    80005bb4:	00000593          	li	a1,0
    80005bb8:	00007517          	auipc	a0,0x7
    80005bbc:	21850513          	addi	a0,a0,536 # 8000cdd0 <lockPrint>
    80005bc0:	ffffb097          	auipc	ra,0xffffb
    80005bc4:	564080e7          	jalr	1380(ra) # 80001124 <copy_and_swap>
    80005bc8:	00050863          	beqz	a0,80005bd8 <_Z8printIntiii+0x50>
    80005bcc:	ffffc097          	auipc	ra,0xffffc
    80005bd0:	868080e7          	jalr	-1944(ra) # 80001434 <_Z15thread_dispatchv>
    80005bd4:	fddff06f          	j	80005bb0 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005bd8:	00098463          	beqz	s3,80005be0 <_Z8printIntiii+0x58>
    80005bdc:	0804c463          	bltz	s1,80005c64 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005be0:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005be4:	00000593          	li	a1,0
    }

    i = 0;
    80005be8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005bec:	0009079b          	sext.w	a5,s2
    80005bf0:	0325773b          	remuw	a4,a0,s2
    80005bf4:	00048613          	mv	a2,s1
    80005bf8:	0014849b          	addiw	s1,s1,1
    80005bfc:	02071693          	slli	a3,a4,0x20
    80005c00:	0206d693          	srli	a3,a3,0x20
    80005c04:	00007717          	auipc	a4,0x7
    80005c08:	f2c70713          	addi	a4,a4,-212 # 8000cb30 <digits>
    80005c0c:	00d70733          	add	a4,a4,a3
    80005c10:	00074683          	lbu	a3,0(a4)
    80005c14:	fd040713          	addi	a4,s0,-48
    80005c18:	00c70733          	add	a4,a4,a2
    80005c1c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005c20:	0005071b          	sext.w	a4,a0
    80005c24:	0325553b          	divuw	a0,a0,s2
    80005c28:	fcf772e3          	bgeu	a4,a5,80005bec <_Z8printIntiii+0x64>
    if(neg)
    80005c2c:	00058c63          	beqz	a1,80005c44 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005c30:	fd040793          	addi	a5,s0,-48
    80005c34:	009784b3          	add	s1,a5,s1
    80005c38:	02d00793          	li	a5,45
    80005c3c:	fef48823          	sb	a5,-16(s1)
    80005c40:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005c44:	fff4849b          	addiw	s1,s1,-1
    80005c48:	0204c463          	bltz	s1,80005c70 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005c4c:	fd040793          	addi	a5,s0,-48
    80005c50:	009787b3          	add	a5,a5,s1
    80005c54:	ff07c503          	lbu	a0,-16(a5)
    80005c58:	ffffc097          	auipc	ra,0xffffc
    80005c5c:	944080e7          	jalr	-1724(ra) # 8000159c <_Z4putcc>
    80005c60:	fe5ff06f          	j	80005c44 <_Z8printIntiii+0xbc>
        x = -xx;
    80005c64:	4090053b          	negw	a0,s1
        neg = 1;
    80005c68:	00100593          	li	a1,1
        x = -xx;
    80005c6c:	f7dff06f          	j	80005be8 <_Z8printIntiii+0x60>

    UNLOCK();
    80005c70:	00000613          	li	a2,0
    80005c74:	00100593          	li	a1,1
    80005c78:	00007517          	auipc	a0,0x7
    80005c7c:	15850513          	addi	a0,a0,344 # 8000cdd0 <lockPrint>
    80005c80:	ffffb097          	auipc	ra,0xffffb
    80005c84:	4a4080e7          	jalr	1188(ra) # 80001124 <copy_and_swap>
    80005c88:	fe0514e3          	bnez	a0,80005c70 <_Z8printIntiii+0xe8>
    80005c8c:	03813083          	ld	ra,56(sp)
    80005c90:	03013403          	ld	s0,48(sp)
    80005c94:	02813483          	ld	s1,40(sp)
    80005c98:	02013903          	ld	s2,32(sp)
    80005c9c:	01813983          	ld	s3,24(sp)
    80005ca0:	04010113          	addi	sp,sp,64
    80005ca4:	00008067          	ret

0000000080005ca8 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005ca8:	fd010113          	addi	sp,sp,-48
    80005cac:	02113423          	sd	ra,40(sp)
    80005cb0:	02813023          	sd	s0,32(sp)
    80005cb4:	00913c23          	sd	s1,24(sp)
    80005cb8:	01213823          	sd	s2,16(sp)
    80005cbc:	01313423          	sd	s3,8(sp)
    80005cc0:	03010413          	addi	s0,sp,48
    80005cc4:	00050493          	mv	s1,a0
    80005cc8:	00058913          	mv	s2,a1
    80005ccc:	0015879b          	addiw	a5,a1,1
    80005cd0:	0007851b          	sext.w	a0,a5
    80005cd4:	00f4a023          	sw	a5,0(s1)
    80005cd8:	0004a823          	sw	zero,16(s1)
    80005cdc:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005ce0:	00251513          	slli	a0,a0,0x2
    80005ce4:	ffffb097          	auipc	ra,0xffffb
    80005ce8:	624080e7          	jalr	1572(ra) # 80001308 <_Z9mem_allocm>
    80005cec:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005cf0:	01000513          	li	a0,16
    80005cf4:	ffffd097          	auipc	ra,0xffffd
    80005cf8:	a84080e7          	jalr	-1404(ra) # 80002778 <_Znwm>
    80005cfc:	00050993          	mv	s3,a0
    80005d00:	00000593          	li	a1,0
    80005d04:	ffffd097          	auipc	ra,0xffffd
    80005d08:	dc8080e7          	jalr	-568(ra) # 80002acc <_ZN9SemaphoreC1Ej>
    80005d0c:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005d10:	01000513          	li	a0,16
    80005d14:	ffffd097          	auipc	ra,0xffffd
    80005d18:	a64080e7          	jalr	-1436(ra) # 80002778 <_Znwm>
    80005d1c:	00050993          	mv	s3,a0
    80005d20:	00090593          	mv	a1,s2
    80005d24:	ffffd097          	auipc	ra,0xffffd
    80005d28:	da8080e7          	jalr	-600(ra) # 80002acc <_ZN9SemaphoreC1Ej>
    80005d2c:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005d30:	01000513          	li	a0,16
    80005d34:	ffffd097          	auipc	ra,0xffffd
    80005d38:	a44080e7          	jalr	-1468(ra) # 80002778 <_Znwm>
    80005d3c:	00050913          	mv	s2,a0
    80005d40:	00100593          	li	a1,1
    80005d44:	ffffd097          	auipc	ra,0xffffd
    80005d48:	d88080e7          	jalr	-632(ra) # 80002acc <_ZN9SemaphoreC1Ej>
    80005d4c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005d50:	01000513          	li	a0,16
    80005d54:	ffffd097          	auipc	ra,0xffffd
    80005d58:	a24080e7          	jalr	-1500(ra) # 80002778 <_Znwm>
    80005d5c:	00050913          	mv	s2,a0
    80005d60:	00100593          	li	a1,1
    80005d64:	ffffd097          	auipc	ra,0xffffd
    80005d68:	d68080e7          	jalr	-664(ra) # 80002acc <_ZN9SemaphoreC1Ej>
    80005d6c:	0324b823          	sd	s2,48(s1)
}
    80005d70:	02813083          	ld	ra,40(sp)
    80005d74:	02013403          	ld	s0,32(sp)
    80005d78:	01813483          	ld	s1,24(sp)
    80005d7c:	01013903          	ld	s2,16(sp)
    80005d80:	00813983          	ld	s3,8(sp)
    80005d84:	03010113          	addi	sp,sp,48
    80005d88:	00008067          	ret
    80005d8c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005d90:	00098513          	mv	a0,s3
    80005d94:	ffffd097          	auipc	ra,0xffffd
    80005d98:	a34080e7          	jalr	-1484(ra) # 800027c8 <_ZdlPv>
    80005d9c:	00048513          	mv	a0,s1
    80005da0:	00008097          	auipc	ra,0x8
    80005da4:	128080e7          	jalr	296(ra) # 8000dec8 <_Unwind_Resume>
    80005da8:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005dac:	00098513          	mv	a0,s3
    80005db0:	ffffd097          	auipc	ra,0xffffd
    80005db4:	a18080e7          	jalr	-1512(ra) # 800027c8 <_ZdlPv>
    80005db8:	00048513          	mv	a0,s1
    80005dbc:	00008097          	auipc	ra,0x8
    80005dc0:	10c080e7          	jalr	268(ra) # 8000dec8 <_Unwind_Resume>
    80005dc4:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005dc8:	00090513          	mv	a0,s2
    80005dcc:	ffffd097          	auipc	ra,0xffffd
    80005dd0:	9fc080e7          	jalr	-1540(ra) # 800027c8 <_ZdlPv>
    80005dd4:	00048513          	mv	a0,s1
    80005dd8:	00008097          	auipc	ra,0x8
    80005ddc:	0f0080e7          	jalr	240(ra) # 8000dec8 <_Unwind_Resume>
    80005de0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005de4:	00090513          	mv	a0,s2
    80005de8:	ffffd097          	auipc	ra,0xffffd
    80005dec:	9e0080e7          	jalr	-1568(ra) # 800027c8 <_ZdlPv>
    80005df0:	00048513          	mv	a0,s1
    80005df4:	00008097          	auipc	ra,0x8
    80005df8:	0d4080e7          	jalr	212(ra) # 8000dec8 <_Unwind_Resume>

0000000080005dfc <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005dfc:	fe010113          	addi	sp,sp,-32
    80005e00:	00113c23          	sd	ra,24(sp)
    80005e04:	00813823          	sd	s0,16(sp)
    80005e08:	00913423          	sd	s1,8(sp)
    80005e0c:	01213023          	sd	s2,0(sp)
    80005e10:	02010413          	addi	s0,sp,32
    80005e14:	00050493          	mv	s1,a0
    80005e18:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005e1c:	01853503          	ld	a0,24(a0)
    80005e20:	ffffd097          	auipc	ra,0xffffd
    80005e24:	ce4080e7          	jalr	-796(ra) # 80002b04 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005e28:	0304b503          	ld	a0,48(s1)
    80005e2c:	ffffd097          	auipc	ra,0xffffd
    80005e30:	cd8080e7          	jalr	-808(ra) # 80002b04 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005e34:	0084b783          	ld	a5,8(s1)
    80005e38:	0144a703          	lw	a4,20(s1)
    80005e3c:	00271713          	slli	a4,a4,0x2
    80005e40:	00e787b3          	add	a5,a5,a4
    80005e44:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005e48:	0144a783          	lw	a5,20(s1)
    80005e4c:	0017879b          	addiw	a5,a5,1
    80005e50:	0004a703          	lw	a4,0(s1)
    80005e54:	02e7e7bb          	remw	a5,a5,a4
    80005e58:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005e5c:	0304b503          	ld	a0,48(s1)
    80005e60:	ffffd097          	auipc	ra,0xffffd
    80005e64:	cd0080e7          	jalr	-816(ra) # 80002b30 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005e68:	0204b503          	ld	a0,32(s1)
    80005e6c:	ffffd097          	auipc	ra,0xffffd
    80005e70:	cc4080e7          	jalr	-828(ra) # 80002b30 <_ZN9Semaphore6signalEv>

}
    80005e74:	01813083          	ld	ra,24(sp)
    80005e78:	01013403          	ld	s0,16(sp)
    80005e7c:	00813483          	ld	s1,8(sp)
    80005e80:	00013903          	ld	s2,0(sp)
    80005e84:	02010113          	addi	sp,sp,32
    80005e88:	00008067          	ret

0000000080005e8c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005e8c:	fe010113          	addi	sp,sp,-32
    80005e90:	00113c23          	sd	ra,24(sp)
    80005e94:	00813823          	sd	s0,16(sp)
    80005e98:	00913423          	sd	s1,8(sp)
    80005e9c:	01213023          	sd	s2,0(sp)
    80005ea0:	02010413          	addi	s0,sp,32
    80005ea4:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005ea8:	02053503          	ld	a0,32(a0)
    80005eac:	ffffd097          	auipc	ra,0xffffd
    80005eb0:	c58080e7          	jalr	-936(ra) # 80002b04 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005eb4:	0284b503          	ld	a0,40(s1)
    80005eb8:	ffffd097          	auipc	ra,0xffffd
    80005ebc:	c4c080e7          	jalr	-948(ra) # 80002b04 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005ec0:	0084b703          	ld	a4,8(s1)
    80005ec4:	0104a783          	lw	a5,16(s1)
    80005ec8:	00279693          	slli	a3,a5,0x2
    80005ecc:	00d70733          	add	a4,a4,a3
    80005ed0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005ed4:	0017879b          	addiw	a5,a5,1
    80005ed8:	0004a703          	lw	a4,0(s1)
    80005edc:	02e7e7bb          	remw	a5,a5,a4
    80005ee0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005ee4:	0284b503          	ld	a0,40(s1)
    80005ee8:	ffffd097          	auipc	ra,0xffffd
    80005eec:	c48080e7          	jalr	-952(ra) # 80002b30 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005ef0:	0184b503          	ld	a0,24(s1)
    80005ef4:	ffffd097          	auipc	ra,0xffffd
    80005ef8:	c3c080e7          	jalr	-964(ra) # 80002b30 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005efc:	00090513          	mv	a0,s2
    80005f00:	01813083          	ld	ra,24(sp)
    80005f04:	01013403          	ld	s0,16(sp)
    80005f08:	00813483          	ld	s1,8(sp)
    80005f0c:	00013903          	ld	s2,0(sp)
    80005f10:	02010113          	addi	sp,sp,32
    80005f14:	00008067          	ret

0000000080005f18 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005f18:	fe010113          	addi	sp,sp,-32
    80005f1c:	00113c23          	sd	ra,24(sp)
    80005f20:	00813823          	sd	s0,16(sp)
    80005f24:	00913423          	sd	s1,8(sp)
    80005f28:	01213023          	sd	s2,0(sp)
    80005f2c:	02010413          	addi	s0,sp,32
    80005f30:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005f34:	02853503          	ld	a0,40(a0)
    80005f38:	ffffd097          	auipc	ra,0xffffd
    80005f3c:	bcc080e7          	jalr	-1076(ra) # 80002b04 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005f40:	0304b503          	ld	a0,48(s1)
    80005f44:	ffffd097          	auipc	ra,0xffffd
    80005f48:	bc0080e7          	jalr	-1088(ra) # 80002b04 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005f4c:	0144a783          	lw	a5,20(s1)
    80005f50:	0104a903          	lw	s2,16(s1)
    80005f54:	0327ce63          	blt	a5,s2,80005f90 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80005f58:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005f5c:	0304b503          	ld	a0,48(s1)
    80005f60:	ffffd097          	auipc	ra,0xffffd
    80005f64:	bd0080e7          	jalr	-1072(ra) # 80002b30 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80005f68:	0284b503          	ld	a0,40(s1)
    80005f6c:	ffffd097          	auipc	ra,0xffffd
    80005f70:	bc4080e7          	jalr	-1084(ra) # 80002b30 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005f74:	00090513          	mv	a0,s2
    80005f78:	01813083          	ld	ra,24(sp)
    80005f7c:	01013403          	ld	s0,16(sp)
    80005f80:	00813483          	ld	s1,8(sp)
    80005f84:	00013903          	ld	s2,0(sp)
    80005f88:	02010113          	addi	sp,sp,32
    80005f8c:	00008067          	ret
        ret = cap - head + tail;
    80005f90:	0004a703          	lw	a4,0(s1)
    80005f94:	4127093b          	subw	s2,a4,s2
    80005f98:	00f9093b          	addw	s2,s2,a5
    80005f9c:	fc1ff06f          	j	80005f5c <_ZN9BufferCPP6getCntEv+0x44>

0000000080005fa0 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80005fa0:	fe010113          	addi	sp,sp,-32
    80005fa4:	00113c23          	sd	ra,24(sp)
    80005fa8:	00813823          	sd	s0,16(sp)
    80005fac:	00913423          	sd	s1,8(sp)
    80005fb0:	02010413          	addi	s0,sp,32
    80005fb4:	00050493          	mv	s1,a0
    Console::putc('\n');
    80005fb8:	00a00513          	li	a0,10
    80005fbc:	ffffd097          	auipc	ra,0xffffd
    80005fc0:	c38080e7          	jalr	-968(ra) # 80002bf4 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80005fc4:	00004517          	auipc	a0,0x4
    80005fc8:	42450513          	addi	a0,a0,1060 # 8000a3e8 <CONSOLE_STATUS+0x3d8>
    80005fcc:	00000097          	auipc	ra,0x0
    80005fd0:	a0c080e7          	jalr	-1524(ra) # 800059d8 <_Z11printStringPKc>
    while (getCnt()) {
    80005fd4:	00048513          	mv	a0,s1
    80005fd8:	00000097          	auipc	ra,0x0
    80005fdc:	f40080e7          	jalr	-192(ra) # 80005f18 <_ZN9BufferCPP6getCntEv>
    80005fe0:	02050c63          	beqz	a0,80006018 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80005fe4:	0084b783          	ld	a5,8(s1)
    80005fe8:	0104a703          	lw	a4,16(s1)
    80005fec:	00271713          	slli	a4,a4,0x2
    80005ff0:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80005ff4:	0007c503          	lbu	a0,0(a5)
    80005ff8:	ffffd097          	auipc	ra,0xffffd
    80005ffc:	bfc080e7          	jalr	-1028(ra) # 80002bf4 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006000:	0104a783          	lw	a5,16(s1)
    80006004:	0017879b          	addiw	a5,a5,1
    80006008:	0004a703          	lw	a4,0(s1)
    8000600c:	02e7e7bb          	remw	a5,a5,a4
    80006010:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006014:	fc1ff06f          	j	80005fd4 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006018:	02100513          	li	a0,33
    8000601c:	ffffd097          	auipc	ra,0xffffd
    80006020:	bd8080e7          	jalr	-1064(ra) # 80002bf4 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006024:	00a00513          	li	a0,10
    80006028:	ffffd097          	auipc	ra,0xffffd
    8000602c:	bcc080e7          	jalr	-1076(ra) # 80002bf4 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006030:	0084b503          	ld	a0,8(s1)
    80006034:	ffffb097          	auipc	ra,0xffffb
    80006038:	314080e7          	jalr	788(ra) # 80001348 <_Z8mem_freePv>
    delete itemAvailable;
    8000603c:	0204b503          	ld	a0,32(s1)
    80006040:	00050863          	beqz	a0,80006050 <_ZN9BufferCPPD1Ev+0xb0>
    80006044:	00053783          	ld	a5,0(a0)
    80006048:	0087b783          	ld	a5,8(a5)
    8000604c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006050:	0184b503          	ld	a0,24(s1)
    80006054:	00050863          	beqz	a0,80006064 <_ZN9BufferCPPD1Ev+0xc4>
    80006058:	00053783          	ld	a5,0(a0)
    8000605c:	0087b783          	ld	a5,8(a5)
    80006060:	000780e7          	jalr	a5
    delete mutexTail;
    80006064:	0304b503          	ld	a0,48(s1)
    80006068:	00050863          	beqz	a0,80006078 <_ZN9BufferCPPD1Ev+0xd8>
    8000606c:	00053783          	ld	a5,0(a0)
    80006070:	0087b783          	ld	a5,8(a5)
    80006074:	000780e7          	jalr	a5
    delete mutexHead;
    80006078:	0284b503          	ld	a0,40(s1)
    8000607c:	00050863          	beqz	a0,8000608c <_ZN9BufferCPPD1Ev+0xec>
    80006080:	00053783          	ld	a5,0(a0)
    80006084:	0087b783          	ld	a5,8(a5)
    80006088:	000780e7          	jalr	a5
}
    8000608c:	01813083          	ld	ra,24(sp)
    80006090:	01013403          	ld	s0,16(sp)
    80006094:	00813483          	ld	s1,8(sp)
    80006098:	02010113          	addi	sp,sp,32
    8000609c:	00008067          	ret

00000000800060a0 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    800060a0:	fe010113          	addi	sp,sp,-32
    800060a4:	00113c23          	sd	ra,24(sp)
    800060a8:	00813823          	sd	s0,16(sp)
    800060ac:	00913423          	sd	s1,8(sp)
    800060b0:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    800060b4:	00004517          	auipc	a0,0x4
    800060b8:	34c50513          	addi	a0,a0,844 # 8000a400 <CONSOLE_STATUS+0x3f0>
    800060bc:	00000097          	auipc	ra,0x0
    800060c0:	91c080e7          	jalr	-1764(ra) # 800059d8 <_Z11printStringPKc>
    int test = getc() - '0';
    800060c4:	ffffb097          	auipc	ra,0xffffb
    800060c8:	4b0080e7          	jalr	1200(ra) # 80001574 <_Z4getcv>
    800060cc:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800060d0:	ffffb097          	auipc	ra,0xffffb
    800060d4:	4a4080e7          	jalr	1188(ra) # 80001574 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800060d8:	00700793          	li	a5,7
    800060dc:	1097e263          	bltu	a5,s1,800061e0 <_Z8userMainv+0x140>
    800060e0:	00249493          	slli	s1,s1,0x2
    800060e4:	00004717          	auipc	a4,0x4
    800060e8:	57470713          	addi	a4,a4,1396 # 8000a658 <CONSOLE_STATUS+0x648>
    800060ec:	00e484b3          	add	s1,s1,a4
    800060f0:	0004a783          	lw	a5,0(s1)
    800060f4:	00e787b3          	add	a5,a5,a4
    800060f8:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    800060fc:	fffff097          	auipc	ra,0xfffff
    80006100:	f54080e7          	jalr	-172(ra) # 80005050 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006104:	00004517          	auipc	a0,0x4
    80006108:	31c50513          	addi	a0,a0,796 # 8000a420 <CONSOLE_STATUS+0x410>
    8000610c:	00000097          	auipc	ra,0x0
    80006110:	8cc080e7          	jalr	-1844(ra) # 800059d8 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006114:	01813083          	ld	ra,24(sp)
    80006118:	01013403          	ld	s0,16(sp)
    8000611c:	00813483          	ld	s1,8(sp)
    80006120:	02010113          	addi	sp,sp,32
    80006124:	00008067          	ret
            Threads_CPP_API_test();
    80006128:	ffffe097          	auipc	ra,0xffffe
    8000612c:	e08080e7          	jalr	-504(ra) # 80003f30 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006130:	00004517          	auipc	a0,0x4
    80006134:	33050513          	addi	a0,a0,816 # 8000a460 <CONSOLE_STATUS+0x450>
    80006138:	00000097          	auipc	ra,0x0
    8000613c:	8a0080e7          	jalr	-1888(ra) # 800059d8 <_Z11printStringPKc>
            break;
    80006140:	fd5ff06f          	j	80006114 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006144:	ffffd097          	auipc	ra,0xffffd
    80006148:	640080e7          	jalr	1600(ra) # 80003784 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    8000614c:	00004517          	auipc	a0,0x4
    80006150:	35450513          	addi	a0,a0,852 # 8000a4a0 <CONSOLE_STATUS+0x490>
    80006154:	00000097          	auipc	ra,0x0
    80006158:	884080e7          	jalr	-1916(ra) # 800059d8 <_Z11printStringPKc>
            break;
    8000615c:	fb9ff06f          	j	80006114 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006160:	fffff097          	auipc	ra,0xfffff
    80006164:	234080e7          	jalr	564(ra) # 80005394 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006168:	00004517          	auipc	a0,0x4
    8000616c:	38850513          	addi	a0,a0,904 # 8000a4f0 <CONSOLE_STATUS+0x4e0>
    80006170:	00000097          	auipc	ra,0x0
    80006174:	868080e7          	jalr	-1944(ra) # 800059d8 <_Z11printStringPKc>
            break;
    80006178:	f9dff06f          	j	80006114 <_Z8userMainv+0x74>
            testSleeping();
    8000617c:	00000097          	auipc	ra,0x0
    80006180:	11c080e7          	jalr	284(ra) # 80006298 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006184:	00004517          	auipc	a0,0x4
    80006188:	3c450513          	addi	a0,a0,964 # 8000a548 <CONSOLE_STATUS+0x538>
    8000618c:	00000097          	auipc	ra,0x0
    80006190:	84c080e7          	jalr	-1972(ra) # 800059d8 <_Z11printStringPKc>
            break;
    80006194:	f81ff06f          	j	80006114 <_Z8userMainv+0x74>
            testConsumerProducer();
    80006198:	ffffe097          	auipc	ra,0xffffe
    8000619c:	258080e7          	jalr	600(ra) # 800043f0 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    800061a0:	00004517          	auipc	a0,0x4
    800061a4:	3d850513          	addi	a0,a0,984 # 8000a578 <CONSOLE_STATUS+0x568>
    800061a8:	00000097          	auipc	ra,0x0
    800061ac:	830080e7          	jalr	-2000(ra) # 800059d8 <_Z11printStringPKc>
            break;
    800061b0:	f65ff06f          	j	80006114 <_Z8userMainv+0x74>
            System_Mode_test();
    800061b4:	00000097          	auipc	ra,0x0
    800061b8:	658080e7          	jalr	1624(ra) # 8000680c <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    800061bc:	00004517          	auipc	a0,0x4
    800061c0:	3fc50513          	addi	a0,a0,1020 # 8000a5b8 <CONSOLE_STATUS+0x5a8>
    800061c4:	00000097          	auipc	ra,0x0
    800061c8:	814080e7          	jalr	-2028(ra) # 800059d8 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800061cc:	00004517          	auipc	a0,0x4
    800061d0:	40c50513          	addi	a0,a0,1036 # 8000a5d8 <CONSOLE_STATUS+0x5c8>
    800061d4:	00000097          	auipc	ra,0x0
    800061d8:	804080e7          	jalr	-2044(ra) # 800059d8 <_Z11printStringPKc>
            break;
    800061dc:	f39ff06f          	j	80006114 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    800061e0:	00004517          	auipc	a0,0x4
    800061e4:	45050513          	addi	a0,a0,1104 # 8000a630 <CONSOLE_STATUS+0x620>
    800061e8:	fffff097          	auipc	ra,0xfffff
    800061ec:	7f0080e7          	jalr	2032(ra) # 800059d8 <_Z11printStringPKc>
    800061f0:	f25ff06f          	j	80006114 <_Z8userMainv+0x74>

00000000800061f4 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800061f4:	fe010113          	addi	sp,sp,-32
    800061f8:	00113c23          	sd	ra,24(sp)
    800061fc:	00813823          	sd	s0,16(sp)
    80006200:	00913423          	sd	s1,8(sp)
    80006204:	01213023          	sd	s2,0(sp)
    80006208:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    8000620c:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006210:	00600493          	li	s1,6
    while (--i > 0) {
    80006214:	fff4849b          	addiw	s1,s1,-1
    80006218:	04905463          	blez	s1,80006260 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    8000621c:	00004517          	auipc	a0,0x4
    80006220:	45c50513          	addi	a0,a0,1116 # 8000a678 <CONSOLE_STATUS+0x668>
    80006224:	fffff097          	auipc	ra,0xfffff
    80006228:	7b4080e7          	jalr	1972(ra) # 800059d8 <_Z11printStringPKc>
        printInt(sleep_time);
    8000622c:	00000613          	li	a2,0
    80006230:	00a00593          	li	a1,10
    80006234:	0009051b          	sext.w	a0,s2
    80006238:	00000097          	auipc	ra,0x0
    8000623c:	950080e7          	jalr	-1712(ra) # 80005b88 <_Z8printIntiii>
        printString(" !\n");
    80006240:	00004517          	auipc	a0,0x4
    80006244:	44050513          	addi	a0,a0,1088 # 8000a680 <CONSOLE_STATUS+0x670>
    80006248:	fffff097          	auipc	ra,0xfffff
    8000624c:	790080e7          	jalr	1936(ra) # 800059d8 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006250:	00090513          	mv	a0,s2
    80006254:	ffffb097          	auipc	ra,0xffffb
    80006258:	228080e7          	jalr	552(ra) # 8000147c <_Z10time_sleepm>
    while (--i > 0) {
    8000625c:	fb9ff06f          	j	80006214 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006260:	00a00793          	li	a5,10
    80006264:	02f95933          	divu	s2,s2,a5
    80006268:	fff90913          	addi	s2,s2,-1
    8000626c:	00007797          	auipc	a5,0x7
    80006270:	b6c78793          	addi	a5,a5,-1172 # 8000cdd8 <_ZL8finished>
    80006274:	01278933          	add	s2,a5,s2
    80006278:	00100793          	li	a5,1
    8000627c:	00f90023          	sb	a5,0(s2)
}
    80006280:	01813083          	ld	ra,24(sp)
    80006284:	01013403          	ld	s0,16(sp)
    80006288:	00813483          	ld	s1,8(sp)
    8000628c:	00013903          	ld	s2,0(sp)
    80006290:	02010113          	addi	sp,sp,32
    80006294:	00008067          	ret

0000000080006298 <_Z12testSleepingv>:

void testSleeping() {
    80006298:	fc010113          	addi	sp,sp,-64
    8000629c:	02113c23          	sd	ra,56(sp)
    800062a0:	02813823          	sd	s0,48(sp)
    800062a4:	02913423          	sd	s1,40(sp)
    800062a8:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800062ac:	00a00793          	li	a5,10
    800062b0:	fcf43823          	sd	a5,-48(s0)
    800062b4:	01400793          	li	a5,20
    800062b8:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800062bc:	00000493          	li	s1,0
    800062c0:	02c0006f          	j	800062ec <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800062c4:	00349793          	slli	a5,s1,0x3
    800062c8:	fd040613          	addi	a2,s0,-48
    800062cc:	00f60633          	add	a2,a2,a5
    800062d0:	00000597          	auipc	a1,0x0
    800062d4:	f2458593          	addi	a1,a1,-220 # 800061f4 <_ZL9sleepyRunPv>
    800062d8:	fc040513          	addi	a0,s0,-64
    800062dc:	00f50533          	add	a0,a0,a5
    800062e0:	ffffb097          	auipc	ra,0xffffb
    800062e4:	098080e7          	jalr	152(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800062e8:	0014849b          	addiw	s1,s1,1
    800062ec:	00100793          	li	a5,1
    800062f0:	fc97dae3          	bge	a5,s1,800062c4 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800062f4:	00007797          	auipc	a5,0x7
    800062f8:	ae47c783          	lbu	a5,-1308(a5) # 8000cdd8 <_ZL8finished>
    800062fc:	fe078ce3          	beqz	a5,800062f4 <_Z12testSleepingv+0x5c>
    80006300:	00007797          	auipc	a5,0x7
    80006304:	ad97c783          	lbu	a5,-1319(a5) # 8000cdd9 <_ZL8finished+0x1>
    80006308:	fe0786e3          	beqz	a5,800062f4 <_Z12testSleepingv+0x5c>
}
    8000630c:	03813083          	ld	ra,56(sp)
    80006310:	03013403          	ld	s0,48(sp)
    80006314:	02813483          	ld	s1,40(sp)
    80006318:	04010113          	addi	sp,sp,64
    8000631c:	00008067          	ret

0000000080006320 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006320:	fe010113          	addi	sp,sp,-32
    80006324:	00113c23          	sd	ra,24(sp)
    80006328:	00813823          	sd	s0,16(sp)
    8000632c:	00913423          	sd	s1,8(sp)
    80006330:	01213023          	sd	s2,0(sp)
    80006334:	02010413          	addi	s0,sp,32
    80006338:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000633c:	00100793          	li	a5,1
    80006340:	02a7f863          	bgeu	a5,a0,80006370 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006344:	00a00793          	li	a5,10
    80006348:	02f577b3          	remu	a5,a0,a5
    8000634c:	02078e63          	beqz	a5,80006388 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006350:	fff48513          	addi	a0,s1,-1
    80006354:	00000097          	auipc	ra,0x0
    80006358:	fcc080e7          	jalr	-52(ra) # 80006320 <_ZL9fibonaccim>
    8000635c:	00050913          	mv	s2,a0
    80006360:	ffe48513          	addi	a0,s1,-2
    80006364:	00000097          	auipc	ra,0x0
    80006368:	fbc080e7          	jalr	-68(ra) # 80006320 <_ZL9fibonaccim>
    8000636c:	00a90533          	add	a0,s2,a0
}
    80006370:	01813083          	ld	ra,24(sp)
    80006374:	01013403          	ld	s0,16(sp)
    80006378:	00813483          	ld	s1,8(sp)
    8000637c:	00013903          	ld	s2,0(sp)
    80006380:	02010113          	addi	sp,sp,32
    80006384:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006388:	ffffb097          	auipc	ra,0xffffb
    8000638c:	0ac080e7          	jalr	172(ra) # 80001434 <_Z15thread_dispatchv>
    80006390:	fc1ff06f          	j	80006350 <_ZL9fibonaccim+0x30>

0000000080006394 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006394:	fe010113          	addi	sp,sp,-32
    80006398:	00113c23          	sd	ra,24(sp)
    8000639c:	00813823          	sd	s0,16(sp)
    800063a0:	00913423          	sd	s1,8(sp)
    800063a4:	01213023          	sd	s2,0(sp)
    800063a8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800063ac:	00a00493          	li	s1,10
    800063b0:	0400006f          	j	800063f0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800063b4:	00004517          	auipc	a0,0x4
    800063b8:	f9c50513          	addi	a0,a0,-100 # 8000a350 <CONSOLE_STATUS+0x340>
    800063bc:	fffff097          	auipc	ra,0xfffff
    800063c0:	61c080e7          	jalr	1564(ra) # 800059d8 <_Z11printStringPKc>
    800063c4:	00000613          	li	a2,0
    800063c8:	00a00593          	li	a1,10
    800063cc:	00048513          	mv	a0,s1
    800063d0:	fffff097          	auipc	ra,0xfffff
    800063d4:	7b8080e7          	jalr	1976(ra) # 80005b88 <_Z8printIntiii>
    800063d8:	00004517          	auipc	a0,0x4
    800063dc:	16850513          	addi	a0,a0,360 # 8000a540 <CONSOLE_STATUS+0x530>
    800063e0:	fffff097          	auipc	ra,0xfffff
    800063e4:	5f8080e7          	jalr	1528(ra) # 800059d8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800063e8:	0014849b          	addiw	s1,s1,1
    800063ec:	0ff4f493          	andi	s1,s1,255
    800063f0:	00c00793          	li	a5,12
    800063f4:	fc97f0e3          	bgeu	a5,s1,800063b4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800063f8:	00004517          	auipc	a0,0x4
    800063fc:	f6050513          	addi	a0,a0,-160 # 8000a358 <CONSOLE_STATUS+0x348>
    80006400:	fffff097          	auipc	ra,0xfffff
    80006404:	5d8080e7          	jalr	1496(ra) # 800059d8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006408:	00500313          	li	t1,5
    thread_dispatch();
    8000640c:	ffffb097          	auipc	ra,0xffffb
    80006410:	028080e7          	jalr	40(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006414:	01000513          	li	a0,16
    80006418:	00000097          	auipc	ra,0x0
    8000641c:	f08080e7          	jalr	-248(ra) # 80006320 <_ZL9fibonaccim>
    80006420:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006424:	00004517          	auipc	a0,0x4
    80006428:	f4450513          	addi	a0,a0,-188 # 8000a368 <CONSOLE_STATUS+0x358>
    8000642c:	fffff097          	auipc	ra,0xfffff
    80006430:	5ac080e7          	jalr	1452(ra) # 800059d8 <_Z11printStringPKc>
    80006434:	00000613          	li	a2,0
    80006438:	00a00593          	li	a1,10
    8000643c:	0009051b          	sext.w	a0,s2
    80006440:	fffff097          	auipc	ra,0xfffff
    80006444:	748080e7          	jalr	1864(ra) # 80005b88 <_Z8printIntiii>
    80006448:	00004517          	auipc	a0,0x4
    8000644c:	0f850513          	addi	a0,a0,248 # 8000a540 <CONSOLE_STATUS+0x530>
    80006450:	fffff097          	auipc	ra,0xfffff
    80006454:	588080e7          	jalr	1416(ra) # 800059d8 <_Z11printStringPKc>
    80006458:	0400006f          	j	80006498 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000645c:	00004517          	auipc	a0,0x4
    80006460:	ef450513          	addi	a0,a0,-268 # 8000a350 <CONSOLE_STATUS+0x340>
    80006464:	fffff097          	auipc	ra,0xfffff
    80006468:	574080e7          	jalr	1396(ra) # 800059d8 <_Z11printStringPKc>
    8000646c:	00000613          	li	a2,0
    80006470:	00a00593          	li	a1,10
    80006474:	00048513          	mv	a0,s1
    80006478:	fffff097          	auipc	ra,0xfffff
    8000647c:	710080e7          	jalr	1808(ra) # 80005b88 <_Z8printIntiii>
    80006480:	00004517          	auipc	a0,0x4
    80006484:	0c050513          	addi	a0,a0,192 # 8000a540 <CONSOLE_STATUS+0x530>
    80006488:	fffff097          	auipc	ra,0xfffff
    8000648c:	550080e7          	jalr	1360(ra) # 800059d8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006490:	0014849b          	addiw	s1,s1,1
    80006494:	0ff4f493          	andi	s1,s1,255
    80006498:	00f00793          	li	a5,15
    8000649c:	fc97f0e3          	bgeu	a5,s1,8000645c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800064a0:	00004517          	auipc	a0,0x4
    800064a4:	ed850513          	addi	a0,a0,-296 # 8000a378 <CONSOLE_STATUS+0x368>
    800064a8:	fffff097          	auipc	ra,0xfffff
    800064ac:	530080e7          	jalr	1328(ra) # 800059d8 <_Z11printStringPKc>
    finishedD = true;
    800064b0:	00100793          	li	a5,1
    800064b4:	00007717          	auipc	a4,0x7
    800064b8:	92f70323          	sb	a5,-1754(a4) # 8000cdda <_ZL9finishedD>
    thread_dispatch();
    800064bc:	ffffb097          	auipc	ra,0xffffb
    800064c0:	f78080e7          	jalr	-136(ra) # 80001434 <_Z15thread_dispatchv>
}
    800064c4:	01813083          	ld	ra,24(sp)
    800064c8:	01013403          	ld	s0,16(sp)
    800064cc:	00813483          	ld	s1,8(sp)
    800064d0:	00013903          	ld	s2,0(sp)
    800064d4:	02010113          	addi	sp,sp,32
    800064d8:	00008067          	ret

00000000800064dc <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800064dc:	fe010113          	addi	sp,sp,-32
    800064e0:	00113c23          	sd	ra,24(sp)
    800064e4:	00813823          	sd	s0,16(sp)
    800064e8:	00913423          	sd	s1,8(sp)
    800064ec:	01213023          	sd	s2,0(sp)
    800064f0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800064f4:	00000493          	li	s1,0
    800064f8:	0400006f          	j	80006538 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800064fc:	00004517          	auipc	a0,0x4
    80006500:	e1450513          	addi	a0,a0,-492 # 8000a310 <CONSOLE_STATUS+0x300>
    80006504:	fffff097          	auipc	ra,0xfffff
    80006508:	4d4080e7          	jalr	1236(ra) # 800059d8 <_Z11printStringPKc>
    8000650c:	00000613          	li	a2,0
    80006510:	00a00593          	li	a1,10
    80006514:	00048513          	mv	a0,s1
    80006518:	fffff097          	auipc	ra,0xfffff
    8000651c:	670080e7          	jalr	1648(ra) # 80005b88 <_Z8printIntiii>
    80006520:	00004517          	auipc	a0,0x4
    80006524:	02050513          	addi	a0,a0,32 # 8000a540 <CONSOLE_STATUS+0x530>
    80006528:	fffff097          	auipc	ra,0xfffff
    8000652c:	4b0080e7          	jalr	1200(ra) # 800059d8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006530:	0014849b          	addiw	s1,s1,1
    80006534:	0ff4f493          	andi	s1,s1,255
    80006538:	00200793          	li	a5,2
    8000653c:	fc97f0e3          	bgeu	a5,s1,800064fc <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006540:	00004517          	auipc	a0,0x4
    80006544:	dd850513          	addi	a0,a0,-552 # 8000a318 <CONSOLE_STATUS+0x308>
    80006548:	fffff097          	auipc	ra,0xfffff
    8000654c:	490080e7          	jalr	1168(ra) # 800059d8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006550:	00700313          	li	t1,7
    thread_dispatch();
    80006554:	ffffb097          	auipc	ra,0xffffb
    80006558:	ee0080e7          	jalr	-288(ra) # 80001434 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000655c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006560:	00004517          	auipc	a0,0x4
    80006564:	dc850513          	addi	a0,a0,-568 # 8000a328 <CONSOLE_STATUS+0x318>
    80006568:	fffff097          	auipc	ra,0xfffff
    8000656c:	470080e7          	jalr	1136(ra) # 800059d8 <_Z11printStringPKc>
    80006570:	00000613          	li	a2,0
    80006574:	00a00593          	li	a1,10
    80006578:	0009051b          	sext.w	a0,s2
    8000657c:	fffff097          	auipc	ra,0xfffff
    80006580:	60c080e7          	jalr	1548(ra) # 80005b88 <_Z8printIntiii>
    80006584:	00004517          	auipc	a0,0x4
    80006588:	fbc50513          	addi	a0,a0,-68 # 8000a540 <CONSOLE_STATUS+0x530>
    8000658c:	fffff097          	auipc	ra,0xfffff
    80006590:	44c080e7          	jalr	1100(ra) # 800059d8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006594:	00c00513          	li	a0,12
    80006598:	00000097          	auipc	ra,0x0
    8000659c:	d88080e7          	jalr	-632(ra) # 80006320 <_ZL9fibonaccim>
    800065a0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800065a4:	00004517          	auipc	a0,0x4
    800065a8:	d8c50513          	addi	a0,a0,-628 # 8000a330 <CONSOLE_STATUS+0x320>
    800065ac:	fffff097          	auipc	ra,0xfffff
    800065b0:	42c080e7          	jalr	1068(ra) # 800059d8 <_Z11printStringPKc>
    800065b4:	00000613          	li	a2,0
    800065b8:	00a00593          	li	a1,10
    800065bc:	0009051b          	sext.w	a0,s2
    800065c0:	fffff097          	auipc	ra,0xfffff
    800065c4:	5c8080e7          	jalr	1480(ra) # 80005b88 <_Z8printIntiii>
    800065c8:	00004517          	auipc	a0,0x4
    800065cc:	f7850513          	addi	a0,a0,-136 # 8000a540 <CONSOLE_STATUS+0x530>
    800065d0:	fffff097          	auipc	ra,0xfffff
    800065d4:	408080e7          	jalr	1032(ra) # 800059d8 <_Z11printStringPKc>
    800065d8:	0400006f          	j	80006618 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800065dc:	00004517          	auipc	a0,0x4
    800065e0:	d3450513          	addi	a0,a0,-716 # 8000a310 <CONSOLE_STATUS+0x300>
    800065e4:	fffff097          	auipc	ra,0xfffff
    800065e8:	3f4080e7          	jalr	1012(ra) # 800059d8 <_Z11printStringPKc>
    800065ec:	00000613          	li	a2,0
    800065f0:	00a00593          	li	a1,10
    800065f4:	00048513          	mv	a0,s1
    800065f8:	fffff097          	auipc	ra,0xfffff
    800065fc:	590080e7          	jalr	1424(ra) # 80005b88 <_Z8printIntiii>
    80006600:	00004517          	auipc	a0,0x4
    80006604:	f4050513          	addi	a0,a0,-192 # 8000a540 <CONSOLE_STATUS+0x530>
    80006608:	fffff097          	auipc	ra,0xfffff
    8000660c:	3d0080e7          	jalr	976(ra) # 800059d8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006610:	0014849b          	addiw	s1,s1,1
    80006614:	0ff4f493          	andi	s1,s1,255
    80006618:	00500793          	li	a5,5
    8000661c:	fc97f0e3          	bgeu	a5,s1,800065dc <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006620:	00004517          	auipc	a0,0x4
    80006624:	cc850513          	addi	a0,a0,-824 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    80006628:	fffff097          	auipc	ra,0xfffff
    8000662c:	3b0080e7          	jalr	944(ra) # 800059d8 <_Z11printStringPKc>
    finishedC = true;
    80006630:	00100793          	li	a5,1
    80006634:	00006717          	auipc	a4,0x6
    80006638:	7af703a3          	sb	a5,1959(a4) # 8000cddb <_ZL9finishedC>
    thread_dispatch();
    8000663c:	ffffb097          	auipc	ra,0xffffb
    80006640:	df8080e7          	jalr	-520(ra) # 80001434 <_Z15thread_dispatchv>
}
    80006644:	01813083          	ld	ra,24(sp)
    80006648:	01013403          	ld	s0,16(sp)
    8000664c:	00813483          	ld	s1,8(sp)
    80006650:	00013903          	ld	s2,0(sp)
    80006654:	02010113          	addi	sp,sp,32
    80006658:	00008067          	ret

000000008000665c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000665c:	fe010113          	addi	sp,sp,-32
    80006660:	00113c23          	sd	ra,24(sp)
    80006664:	00813823          	sd	s0,16(sp)
    80006668:	00913423          	sd	s1,8(sp)
    8000666c:	01213023          	sd	s2,0(sp)
    80006670:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006674:	00000913          	li	s2,0
    80006678:	0400006f          	j	800066b8 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    8000667c:	ffffb097          	auipc	ra,0xffffb
    80006680:	db8080e7          	jalr	-584(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006684:	00148493          	addi	s1,s1,1
    80006688:	000027b7          	lui	a5,0x2
    8000668c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006690:	0097ee63          	bltu	a5,s1,800066ac <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006694:	00000713          	li	a4,0
    80006698:	000077b7          	lui	a5,0x7
    8000669c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800066a0:	fce7eee3          	bltu	a5,a4,8000667c <_ZL11workerBodyBPv+0x20>
    800066a4:	00170713          	addi	a4,a4,1
    800066a8:	ff1ff06f          	j	80006698 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    800066ac:	00a00793          	li	a5,10
    800066b0:	04f90663          	beq	s2,a5,800066fc <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    800066b4:	00190913          	addi	s2,s2,1
    800066b8:	00f00793          	li	a5,15
    800066bc:	0527e463          	bltu	a5,s2,80006704 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    800066c0:	00004517          	auipc	a0,0x4
    800066c4:	c3850513          	addi	a0,a0,-968 # 8000a2f8 <CONSOLE_STATUS+0x2e8>
    800066c8:	fffff097          	auipc	ra,0xfffff
    800066cc:	310080e7          	jalr	784(ra) # 800059d8 <_Z11printStringPKc>
    800066d0:	00000613          	li	a2,0
    800066d4:	00a00593          	li	a1,10
    800066d8:	0009051b          	sext.w	a0,s2
    800066dc:	fffff097          	auipc	ra,0xfffff
    800066e0:	4ac080e7          	jalr	1196(ra) # 80005b88 <_Z8printIntiii>
    800066e4:	00004517          	auipc	a0,0x4
    800066e8:	e5c50513          	addi	a0,a0,-420 # 8000a540 <CONSOLE_STATUS+0x530>
    800066ec:	fffff097          	auipc	ra,0xfffff
    800066f0:	2ec080e7          	jalr	748(ra) # 800059d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800066f4:	00000493          	li	s1,0
    800066f8:	f91ff06f          	j	80006688 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800066fc:	14102ff3          	csrr	t6,sepc
    80006700:	fb5ff06f          	j	800066b4 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006704:	00004517          	auipc	a0,0x4
    80006708:	bfc50513          	addi	a0,a0,-1028 # 8000a300 <CONSOLE_STATUS+0x2f0>
    8000670c:	fffff097          	auipc	ra,0xfffff
    80006710:	2cc080e7          	jalr	716(ra) # 800059d8 <_Z11printStringPKc>
    finishedB = true;
    80006714:	00100793          	li	a5,1
    80006718:	00006717          	auipc	a4,0x6
    8000671c:	6cf70223          	sb	a5,1732(a4) # 8000cddc <_ZL9finishedB>
    thread_dispatch();
    80006720:	ffffb097          	auipc	ra,0xffffb
    80006724:	d14080e7          	jalr	-748(ra) # 80001434 <_Z15thread_dispatchv>
}
    80006728:	01813083          	ld	ra,24(sp)
    8000672c:	01013403          	ld	s0,16(sp)
    80006730:	00813483          	ld	s1,8(sp)
    80006734:	00013903          	ld	s2,0(sp)
    80006738:	02010113          	addi	sp,sp,32
    8000673c:	00008067          	ret

0000000080006740 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006740:	fe010113          	addi	sp,sp,-32
    80006744:	00113c23          	sd	ra,24(sp)
    80006748:	00813823          	sd	s0,16(sp)
    8000674c:	00913423          	sd	s1,8(sp)
    80006750:	01213023          	sd	s2,0(sp)
    80006754:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006758:	00000913          	li	s2,0
    8000675c:	0380006f          	j	80006794 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006760:	ffffb097          	auipc	ra,0xffffb
    80006764:	cd4080e7          	jalr	-812(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006768:	00148493          	addi	s1,s1,1
    8000676c:	000027b7          	lui	a5,0x2
    80006770:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006774:	0097ee63          	bltu	a5,s1,80006790 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006778:	00000713          	li	a4,0
    8000677c:	000077b7          	lui	a5,0x7
    80006780:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006784:	fce7eee3          	bltu	a5,a4,80006760 <_ZL11workerBodyAPv+0x20>
    80006788:	00170713          	addi	a4,a4,1
    8000678c:	ff1ff06f          	j	8000677c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006790:	00190913          	addi	s2,s2,1
    80006794:	00900793          	li	a5,9
    80006798:	0527e063          	bltu	a5,s2,800067d8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000679c:	00004517          	auipc	a0,0x4
    800067a0:	b4450513          	addi	a0,a0,-1212 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800067a4:	fffff097          	auipc	ra,0xfffff
    800067a8:	234080e7          	jalr	564(ra) # 800059d8 <_Z11printStringPKc>
    800067ac:	00000613          	li	a2,0
    800067b0:	00a00593          	li	a1,10
    800067b4:	0009051b          	sext.w	a0,s2
    800067b8:	fffff097          	auipc	ra,0xfffff
    800067bc:	3d0080e7          	jalr	976(ra) # 80005b88 <_Z8printIntiii>
    800067c0:	00004517          	auipc	a0,0x4
    800067c4:	d8050513          	addi	a0,a0,-640 # 8000a540 <CONSOLE_STATUS+0x530>
    800067c8:	fffff097          	auipc	ra,0xfffff
    800067cc:	210080e7          	jalr	528(ra) # 800059d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800067d0:	00000493          	li	s1,0
    800067d4:	f99ff06f          	j	8000676c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800067d8:	00004517          	auipc	a0,0x4
    800067dc:	b1050513          	addi	a0,a0,-1264 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    800067e0:	fffff097          	auipc	ra,0xfffff
    800067e4:	1f8080e7          	jalr	504(ra) # 800059d8 <_Z11printStringPKc>
    finishedA = true;
    800067e8:	00100793          	li	a5,1
    800067ec:	00006717          	auipc	a4,0x6
    800067f0:	5ef708a3          	sb	a5,1521(a4) # 8000cddd <_ZL9finishedA>
}
    800067f4:	01813083          	ld	ra,24(sp)
    800067f8:	01013403          	ld	s0,16(sp)
    800067fc:	00813483          	ld	s1,8(sp)
    80006800:	00013903          	ld	s2,0(sp)
    80006804:	02010113          	addi	sp,sp,32
    80006808:	00008067          	ret

000000008000680c <_Z16System_Mode_testv>:


void System_Mode_test() {
    8000680c:	fd010113          	addi	sp,sp,-48
    80006810:	02113423          	sd	ra,40(sp)
    80006814:	02813023          	sd	s0,32(sp)
    80006818:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    8000681c:	00000613          	li	a2,0
    80006820:	00000597          	auipc	a1,0x0
    80006824:	f2058593          	addi	a1,a1,-224 # 80006740 <_ZL11workerBodyAPv>
    80006828:	fd040513          	addi	a0,s0,-48
    8000682c:	ffffb097          	auipc	ra,0xffffb
    80006830:	b4c080e7          	jalr	-1204(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006834:	00004517          	auipc	a0,0x4
    80006838:	b5450513          	addi	a0,a0,-1196 # 8000a388 <CONSOLE_STATUS+0x378>
    8000683c:	fffff097          	auipc	ra,0xfffff
    80006840:	19c080e7          	jalr	412(ra) # 800059d8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006844:	00000613          	li	a2,0
    80006848:	00000597          	auipc	a1,0x0
    8000684c:	e1458593          	addi	a1,a1,-492 # 8000665c <_ZL11workerBodyBPv>
    80006850:	fd840513          	addi	a0,s0,-40
    80006854:	ffffb097          	auipc	ra,0xffffb
    80006858:	b24080e7          	jalr	-1244(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    8000685c:	00004517          	auipc	a0,0x4
    80006860:	b4450513          	addi	a0,a0,-1212 # 8000a3a0 <CONSOLE_STATUS+0x390>
    80006864:	fffff097          	auipc	ra,0xfffff
    80006868:	174080e7          	jalr	372(ra) # 800059d8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000686c:	00000613          	li	a2,0
    80006870:	00000597          	auipc	a1,0x0
    80006874:	c6c58593          	addi	a1,a1,-916 # 800064dc <_ZL11workerBodyCPv>
    80006878:	fe040513          	addi	a0,s0,-32
    8000687c:	ffffb097          	auipc	ra,0xffffb
    80006880:	afc080e7          	jalr	-1284(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006884:	00004517          	auipc	a0,0x4
    80006888:	b3450513          	addi	a0,a0,-1228 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    8000688c:	fffff097          	auipc	ra,0xfffff
    80006890:	14c080e7          	jalr	332(ra) # 800059d8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006894:	00000613          	li	a2,0
    80006898:	00000597          	auipc	a1,0x0
    8000689c:	afc58593          	addi	a1,a1,-1284 # 80006394 <_ZL11workerBodyDPv>
    800068a0:	fe840513          	addi	a0,s0,-24
    800068a4:	ffffb097          	auipc	ra,0xffffb
    800068a8:	ad4080e7          	jalr	-1324(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800068ac:	00004517          	auipc	a0,0x4
    800068b0:	b2450513          	addi	a0,a0,-1244 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    800068b4:	fffff097          	auipc	ra,0xfffff
    800068b8:	124080e7          	jalr	292(ra) # 800059d8 <_Z11printStringPKc>
    800068bc:	00c0006f          	j	800068c8 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800068c0:	ffffb097          	auipc	ra,0xffffb
    800068c4:	b74080e7          	jalr	-1164(ra) # 80001434 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800068c8:	00006797          	auipc	a5,0x6
    800068cc:	5157c783          	lbu	a5,1301(a5) # 8000cddd <_ZL9finishedA>
    800068d0:	fe0788e3          	beqz	a5,800068c0 <_Z16System_Mode_testv+0xb4>
    800068d4:	00006797          	auipc	a5,0x6
    800068d8:	5087c783          	lbu	a5,1288(a5) # 8000cddc <_ZL9finishedB>
    800068dc:	fe0782e3          	beqz	a5,800068c0 <_Z16System_Mode_testv+0xb4>
    800068e0:	00006797          	auipc	a5,0x6
    800068e4:	4fb7c783          	lbu	a5,1275(a5) # 8000cddb <_ZL9finishedC>
    800068e8:	fc078ce3          	beqz	a5,800068c0 <_Z16System_Mode_testv+0xb4>
    800068ec:	00006797          	auipc	a5,0x6
    800068f0:	4ee7c783          	lbu	a5,1262(a5) # 8000cdda <_ZL9finishedD>
    800068f4:	fc0786e3          	beqz	a5,800068c0 <_Z16System_Mode_testv+0xb4>
    }

}
    800068f8:	02813083          	ld	ra,40(sp)
    800068fc:	02013403          	ld	s0,32(sp)
    80006900:	03010113          	addi	sp,sp,48
    80006904:	00008067          	ret

0000000080006908 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006908:	fe010113          	addi	sp,sp,-32
    8000690c:	00113c23          	sd	ra,24(sp)
    80006910:	00813823          	sd	s0,16(sp)
    80006914:	00913423          	sd	s1,8(sp)
    80006918:	01213023          	sd	s2,0(sp)
    8000691c:	02010413          	addi	s0,sp,32
    80006920:	00050493          	mv	s1,a0
    80006924:	00058913          	mv	s2,a1
    80006928:	0015879b          	addiw	a5,a1,1
    8000692c:	0007851b          	sext.w	a0,a5
    80006930:	00f4a023          	sw	a5,0(s1)
    80006934:	0004a823          	sw	zero,16(s1)
    80006938:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000693c:	00251513          	slli	a0,a0,0x2
    80006940:	ffffb097          	auipc	ra,0xffffb
    80006944:	9c8080e7          	jalr	-1592(ra) # 80001308 <_Z9mem_allocm>
    80006948:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    8000694c:	00000593          	li	a1,0
    80006950:	02048513          	addi	a0,s1,32
    80006954:	ffffb097          	auipc	ra,0xffffb
    80006958:	b58080e7          	jalr	-1192(ra) # 800014ac <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    8000695c:	00090593          	mv	a1,s2
    80006960:	01848513          	addi	a0,s1,24
    80006964:	ffffb097          	auipc	ra,0xffffb
    80006968:	b48080e7          	jalr	-1208(ra) # 800014ac <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    8000696c:	00100593          	li	a1,1
    80006970:	02848513          	addi	a0,s1,40
    80006974:	ffffb097          	auipc	ra,0xffffb
    80006978:	b38080e7          	jalr	-1224(ra) # 800014ac <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    8000697c:	00100593          	li	a1,1
    80006980:	03048513          	addi	a0,s1,48
    80006984:	ffffb097          	auipc	ra,0xffffb
    80006988:	b28080e7          	jalr	-1240(ra) # 800014ac <_Z8sem_openPP4KSemj>
}
    8000698c:	01813083          	ld	ra,24(sp)
    80006990:	01013403          	ld	s0,16(sp)
    80006994:	00813483          	ld	s1,8(sp)
    80006998:	00013903          	ld	s2,0(sp)
    8000699c:	02010113          	addi	sp,sp,32
    800069a0:	00008067          	ret

00000000800069a4 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800069a4:	fe010113          	addi	sp,sp,-32
    800069a8:	00113c23          	sd	ra,24(sp)
    800069ac:	00813823          	sd	s0,16(sp)
    800069b0:	00913423          	sd	s1,8(sp)
    800069b4:	01213023          	sd	s2,0(sp)
    800069b8:	02010413          	addi	s0,sp,32
    800069bc:	00050493          	mv	s1,a0
    800069c0:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800069c4:	01853503          	ld	a0,24(a0)
    800069c8:	ffffb097          	auipc	ra,0xffffb
    800069cc:	b4c080e7          	jalr	-1204(ra) # 80001514 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    800069d0:	0304b503          	ld	a0,48(s1)
    800069d4:	ffffb097          	auipc	ra,0xffffb
    800069d8:	b40080e7          	jalr	-1216(ra) # 80001514 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    800069dc:	0084b783          	ld	a5,8(s1)
    800069e0:	0144a703          	lw	a4,20(s1)
    800069e4:	00271713          	slli	a4,a4,0x2
    800069e8:	00e787b3          	add	a5,a5,a4
    800069ec:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800069f0:	0144a783          	lw	a5,20(s1)
    800069f4:	0017879b          	addiw	a5,a5,1
    800069f8:	0004a703          	lw	a4,0(s1)
    800069fc:	02e7e7bb          	remw	a5,a5,a4
    80006a00:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006a04:	0304b503          	ld	a0,48(s1)
    80006a08:	ffffb097          	auipc	ra,0xffffb
    80006a0c:	b3c080e7          	jalr	-1220(ra) # 80001544 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006a10:	0204b503          	ld	a0,32(s1)
    80006a14:	ffffb097          	auipc	ra,0xffffb
    80006a18:	b30080e7          	jalr	-1232(ra) # 80001544 <_Z10sem_signalP4KSem>

}
    80006a1c:	01813083          	ld	ra,24(sp)
    80006a20:	01013403          	ld	s0,16(sp)
    80006a24:	00813483          	ld	s1,8(sp)
    80006a28:	00013903          	ld	s2,0(sp)
    80006a2c:	02010113          	addi	sp,sp,32
    80006a30:	00008067          	ret

0000000080006a34 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006a34:	fe010113          	addi	sp,sp,-32
    80006a38:	00113c23          	sd	ra,24(sp)
    80006a3c:	00813823          	sd	s0,16(sp)
    80006a40:	00913423          	sd	s1,8(sp)
    80006a44:	01213023          	sd	s2,0(sp)
    80006a48:	02010413          	addi	s0,sp,32
    80006a4c:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006a50:	02053503          	ld	a0,32(a0)
    80006a54:	ffffb097          	auipc	ra,0xffffb
    80006a58:	ac0080e7          	jalr	-1344(ra) # 80001514 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006a5c:	0284b503          	ld	a0,40(s1)
    80006a60:	ffffb097          	auipc	ra,0xffffb
    80006a64:	ab4080e7          	jalr	-1356(ra) # 80001514 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006a68:	0084b703          	ld	a4,8(s1)
    80006a6c:	0104a783          	lw	a5,16(s1)
    80006a70:	00279693          	slli	a3,a5,0x2
    80006a74:	00d70733          	add	a4,a4,a3
    80006a78:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006a7c:	0017879b          	addiw	a5,a5,1
    80006a80:	0004a703          	lw	a4,0(s1)
    80006a84:	02e7e7bb          	remw	a5,a5,a4
    80006a88:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006a8c:	0284b503          	ld	a0,40(s1)
    80006a90:	ffffb097          	auipc	ra,0xffffb
    80006a94:	ab4080e7          	jalr	-1356(ra) # 80001544 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006a98:	0184b503          	ld	a0,24(s1)
    80006a9c:	ffffb097          	auipc	ra,0xffffb
    80006aa0:	aa8080e7          	jalr	-1368(ra) # 80001544 <_Z10sem_signalP4KSem>

    return ret;
}
    80006aa4:	00090513          	mv	a0,s2
    80006aa8:	01813083          	ld	ra,24(sp)
    80006aac:	01013403          	ld	s0,16(sp)
    80006ab0:	00813483          	ld	s1,8(sp)
    80006ab4:	00013903          	ld	s2,0(sp)
    80006ab8:	02010113          	addi	sp,sp,32
    80006abc:	00008067          	ret

0000000080006ac0 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006ac0:	fe010113          	addi	sp,sp,-32
    80006ac4:	00113c23          	sd	ra,24(sp)
    80006ac8:	00813823          	sd	s0,16(sp)
    80006acc:	00913423          	sd	s1,8(sp)
    80006ad0:	01213023          	sd	s2,0(sp)
    80006ad4:	02010413          	addi	s0,sp,32
    80006ad8:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006adc:	02853503          	ld	a0,40(a0)
    80006ae0:	ffffb097          	auipc	ra,0xffffb
    80006ae4:	a34080e7          	jalr	-1484(ra) # 80001514 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006ae8:	0304b503          	ld	a0,48(s1)
    80006aec:	ffffb097          	auipc	ra,0xffffb
    80006af0:	a28080e7          	jalr	-1496(ra) # 80001514 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006af4:	0144a783          	lw	a5,20(s1)
    80006af8:	0104a903          	lw	s2,16(s1)
    80006afc:	0327ce63          	blt	a5,s2,80006b38 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006b00:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006b04:	0304b503          	ld	a0,48(s1)
    80006b08:	ffffb097          	auipc	ra,0xffffb
    80006b0c:	a3c080e7          	jalr	-1476(ra) # 80001544 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006b10:	0284b503          	ld	a0,40(s1)
    80006b14:	ffffb097          	auipc	ra,0xffffb
    80006b18:	a30080e7          	jalr	-1488(ra) # 80001544 <_Z10sem_signalP4KSem>

    return ret;
}
    80006b1c:	00090513          	mv	a0,s2
    80006b20:	01813083          	ld	ra,24(sp)
    80006b24:	01013403          	ld	s0,16(sp)
    80006b28:	00813483          	ld	s1,8(sp)
    80006b2c:	00013903          	ld	s2,0(sp)
    80006b30:	02010113          	addi	sp,sp,32
    80006b34:	00008067          	ret
        ret = cap - head + tail;
    80006b38:	0004a703          	lw	a4,0(s1)
    80006b3c:	4127093b          	subw	s2,a4,s2
    80006b40:	00f9093b          	addw	s2,s2,a5
    80006b44:	fc1ff06f          	j	80006b04 <_ZN6Buffer6getCntEv+0x44>

0000000080006b48 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006b48:	fe010113          	addi	sp,sp,-32
    80006b4c:	00113c23          	sd	ra,24(sp)
    80006b50:	00813823          	sd	s0,16(sp)
    80006b54:	00913423          	sd	s1,8(sp)
    80006b58:	02010413          	addi	s0,sp,32
    80006b5c:	00050493          	mv	s1,a0
    putc('\n');
    80006b60:	00a00513          	li	a0,10
    80006b64:	ffffb097          	auipc	ra,0xffffb
    80006b68:	a38080e7          	jalr	-1480(ra) # 8000159c <_Z4putcc>
    printString("Buffer deleted!\n");
    80006b6c:	00004517          	auipc	a0,0x4
    80006b70:	87c50513          	addi	a0,a0,-1924 # 8000a3e8 <CONSOLE_STATUS+0x3d8>
    80006b74:	fffff097          	auipc	ra,0xfffff
    80006b78:	e64080e7          	jalr	-412(ra) # 800059d8 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006b7c:	00048513          	mv	a0,s1
    80006b80:	00000097          	auipc	ra,0x0
    80006b84:	f40080e7          	jalr	-192(ra) # 80006ac0 <_ZN6Buffer6getCntEv>
    80006b88:	02a05c63          	blez	a0,80006bc0 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006b8c:	0084b783          	ld	a5,8(s1)
    80006b90:	0104a703          	lw	a4,16(s1)
    80006b94:	00271713          	slli	a4,a4,0x2
    80006b98:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006b9c:	0007c503          	lbu	a0,0(a5)
    80006ba0:	ffffb097          	auipc	ra,0xffffb
    80006ba4:	9fc080e7          	jalr	-1540(ra) # 8000159c <_Z4putcc>
        head = (head + 1) % cap;
    80006ba8:	0104a783          	lw	a5,16(s1)
    80006bac:	0017879b          	addiw	a5,a5,1
    80006bb0:	0004a703          	lw	a4,0(s1)
    80006bb4:	02e7e7bb          	remw	a5,a5,a4
    80006bb8:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006bbc:	fc1ff06f          	j	80006b7c <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006bc0:	02100513          	li	a0,33
    80006bc4:	ffffb097          	auipc	ra,0xffffb
    80006bc8:	9d8080e7          	jalr	-1576(ra) # 8000159c <_Z4putcc>
    putc('\n');
    80006bcc:	00a00513          	li	a0,10
    80006bd0:	ffffb097          	auipc	ra,0xffffb
    80006bd4:	9cc080e7          	jalr	-1588(ra) # 8000159c <_Z4putcc>
    mem_free(buffer);
    80006bd8:	0084b503          	ld	a0,8(s1)
    80006bdc:	ffffa097          	auipc	ra,0xffffa
    80006be0:	76c080e7          	jalr	1900(ra) # 80001348 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006be4:	0204b503          	ld	a0,32(s1)
    80006be8:	ffffb097          	auipc	ra,0xffffb
    80006bec:	8fc080e7          	jalr	-1796(ra) # 800014e4 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006bf0:	0184b503          	ld	a0,24(s1)
    80006bf4:	ffffb097          	auipc	ra,0xffffb
    80006bf8:	8f0080e7          	jalr	-1808(ra) # 800014e4 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006bfc:	0304b503          	ld	a0,48(s1)
    80006c00:	ffffb097          	auipc	ra,0xffffb
    80006c04:	8e4080e7          	jalr	-1820(ra) # 800014e4 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006c08:	0284b503          	ld	a0,40(s1)
    80006c0c:	ffffb097          	auipc	ra,0xffffb
    80006c10:	8d8080e7          	jalr	-1832(ra) # 800014e4 <_Z9sem_closeP4KSem>
}
    80006c14:	01813083          	ld	ra,24(sp)
    80006c18:	01013403          	ld	s0,16(sp)
    80006c1c:	00813483          	ld	s1,8(sp)
    80006c20:	02010113          	addi	sp,sp,32
    80006c24:	00008067          	ret

0000000080006c28 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80006c28:	fa010113          	addi	sp,sp,-96
    80006c2c:	04813c23          	sd	s0,88(sp)
    80006c30:	06010413          	addi	s0,sp,96
    80006c34:	faa43423          	sd	a0,-88(s0)
    80006c38:	00058793          	mv	a5,a1
    80006c3c:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80006c40:	fa843783          	ld	a5,-88(s0)
    80006c44:	00079663          	bnez	a5,80006c50 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80006c48:	00000793          	li	a5,0
    80006c4c:	2040006f          	j	80006e50 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80006c50:	fa843783          	ld	a5,-88(s0)
    80006c54:	0067d713          	srli	a4,a5,0x6
    80006c58:	fa843783          	ld	a5,-88(s0)
    80006c5c:	03f7f793          	andi	a5,a5,63
    80006c60:	00078663          	beqz	a5,80006c6c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80006c64:	00100793          	li	a5,1
    80006c68:	0080006f          	j	80006c70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80006c6c:	00000793          	li	a5,0
    80006c70:	00e787b3          	add	a5,a5,a4
    80006c74:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80006c78:	fc843783          	ld	a5,-56(s0)
    80006c7c:	00679793          	slli	a5,a5,0x6
    80006c80:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    80006c84:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80006c88:	00006797          	auipc	a5,0x6
    80006c8c:	16078793          	addi	a5,a5,352 # 8000cde8 <_ZN15MemoryAllocator11freeMemHeadE>
    80006c90:	0007b783          	ld	a5,0(a5)
    80006c94:	fef43023          	sd	a5,-32(s0)
    80006c98:	fe043783          	ld	a5,-32(s0)
    80006c9c:	1a078863          	beqz	a5,80006e4c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    80006ca0:	fe043783          	ld	a5,-32(s0)
    80006ca4:	0087b783          	ld	a5,8(a5)
    80006ca8:	fa843703          	ld	a4,-88(s0)
    80006cac:	18e7e263          	bltu	a5,a4,80006e30 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    80006cb0:	fe043703          	ld	a4,-32(s0)
    80006cb4:	fa843783          	ld	a5,-88(s0)
    80006cb8:	00f707b3          	add	a5,a4,a5
    80006cbc:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    80006cc0:	fe043783          	ld	a5,-32(s0)
    80006cc4:	0087b703          	ld	a4,8(a5)
    80006cc8:	fa843783          	ld	a5,-88(s0)
    80006ccc:	40f707b3          	sub	a5,a4,a5
    80006cd0:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80006cd4:	fb843703          	ld	a4,-72(s0)
    80006cd8:	02000793          	li	a5,32
    80006cdc:	04e7e463          	bltu	a5,a4,80006d24 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    80006ce0:	fa843703          	ld	a4,-88(s0)
    80006ce4:	fb843783          	ld	a5,-72(s0)
    80006ce8:	00f707b3          	add	a5,a4,a5
    80006cec:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    80006cf0:	fe843783          	ld	a5,-24(s0)
    80006cf4:	00078c63          	beqz	a5,80006d0c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    80006cf8:	fe043783          	ld	a5,-32(s0)
    80006cfc:	0007b703          	ld	a4,0(a5)
    80006d00:	fe843783          	ld	a5,-24(s0)
    80006d04:	00e7b023          	sd	a4,0(a5)
    80006d08:	0600006f          	j	80006d68 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    80006d0c:	fe043783          	ld	a5,-32(s0)
    80006d10:	0007b703          	ld	a4,0(a5)
    80006d14:	00006797          	auipc	a5,0x6
    80006d18:	0d478793          	addi	a5,a5,212 # 8000cde8 <_ZN15MemoryAllocator11freeMemHeadE>
    80006d1c:	00e7b023          	sd	a4,0(a5)
    80006d20:	0480006f          	j	80006d68 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    80006d24:	fc043783          	ld	a5,-64(s0)
    80006d28:	fb843703          	ld	a4,-72(s0)
    80006d2c:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    80006d30:	fe043783          	ld	a5,-32(s0)
    80006d34:	0007b703          	ld	a4,0(a5)
    80006d38:	fc043783          	ld	a5,-64(s0)
    80006d3c:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    80006d40:	fe843783          	ld	a5,-24(s0)
    80006d44:	00078a63          	beqz	a5,80006d58 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    80006d48:	fe843783          	ld	a5,-24(s0)
    80006d4c:	fc043703          	ld	a4,-64(s0)
    80006d50:	00e7b023          	sd	a4,0(a5)
    80006d54:	0140006f          	j	80006d68 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    80006d58:	00006797          	auipc	a5,0x6
    80006d5c:	09078793          	addi	a5,a5,144 # 8000cde8 <_ZN15MemoryAllocator11freeMemHeadE>
    80006d60:	fc043703          	ld	a4,-64(s0)
    80006d64:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    80006d68:	fe043783          	ld	a5,-32(s0)
    80006d6c:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    80006d70:	fb043783          	ld	a5,-80(s0)
    80006d74:	fa843703          	ld	a4,-88(s0)
    80006d78:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    80006d7c:	fb043783          	ld	a5,-80(s0)
    80006d80:	fa442703          	lw	a4,-92(s0)
    80006d84:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    80006d88:	fb043783          	ld	a5,-80(s0)
    80006d8c:	02078713          	addi	a4,a5,32
    80006d90:	fb043783          	ld	a5,-80(s0)
    80006d94:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    80006d98:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80006d9c:	00006797          	auipc	a5,0x6
    80006da0:	04478793          	addi	a5,a5,68 # 8000cde0 <_ZN15MemoryAllocator11usedMemHeadE>
    80006da4:	0007b783          	ld	a5,0(a5)
    80006da8:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80006dac:	fd043783          	ld	a5,-48(s0)
    80006db0:	02078463          	beqz	a5,80006dd8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    80006db4:	fd043703          	ld	a4,-48(s0)
    80006db8:	fb043783          	ld	a5,-80(s0)
    80006dbc:	00f77e63          	bgeu	a4,a5,80006dd8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    80006dc0:	fd043783          	ld	a5,-48(s0)
    80006dc4:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80006dc8:	fd043783          	ld	a5,-48(s0)
    80006dcc:	0007b783          	ld	a5,0(a5)
    80006dd0:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80006dd4:	fd9ff06f          	j	80006dac <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    80006dd8:	fd843783          	ld	a5,-40(s0)
    80006ddc:	02079663          	bnez	a5,80006e08 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    80006de0:	00006797          	auipc	a5,0x6
    80006de4:	00078793          	mv	a5,a5
    80006de8:	0007b703          	ld	a4,0(a5) # 8000cde0 <_ZN15MemoryAllocator11usedMemHeadE>
    80006dec:	fb043783          	ld	a5,-80(s0)
    80006df0:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    80006df4:	00006797          	auipc	a5,0x6
    80006df8:	fec78793          	addi	a5,a5,-20 # 8000cde0 <_ZN15MemoryAllocator11usedMemHeadE>
    80006dfc:	fb043703          	ld	a4,-80(s0)
    80006e00:	00e7b023          	sd	a4,0(a5)
    80006e04:	0200006f          	j	80006e24 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    80006e08:	fd843783          	ld	a5,-40(s0)
    80006e0c:	0007b703          	ld	a4,0(a5)
    80006e10:	fb043783          	ld	a5,-80(s0)
    80006e14:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    80006e18:	fd843783          	ld	a5,-40(s0)
    80006e1c:	fb043703          	ld	a4,-80(s0)
    80006e20:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    80006e24:	fb043783          	ld	a5,-80(s0)
    80006e28:	0187b783          	ld	a5,24(a5)
    80006e2c:	0240006f          	j	80006e50 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    80006e30:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80006e34:	fe043783          	ld	a5,-32(s0)
    80006e38:	fef43423          	sd	a5,-24(s0)
    80006e3c:	fe043783          	ld	a5,-32(s0)
    80006e40:	0007b783          	ld	a5,0(a5)
    80006e44:	fef43023          	sd	a5,-32(s0)
    80006e48:	e51ff06f          	j	80006c98 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    80006e4c:	00000793          	li	a5,0
}
    80006e50:	00078513          	mv	a0,a5
    80006e54:	05813403          	ld	s0,88(sp)
    80006e58:	06010113          	addi	sp,sp,96
    80006e5c:	00008067          	ret

0000000080006e60 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80006e60:	fb010113          	addi	sp,sp,-80
    80006e64:	04113423          	sd	ra,72(sp)
    80006e68:	04813023          	sd	s0,64(sp)
    80006e6c:	05010413          	addi	s0,sp,80
    80006e70:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    80006e74:	fb843783          	ld	a5,-72(s0)
    80006e78:	00079663          	bnez	a5,80006e84 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    80006e7c:	00000793          	li	a5,0
    80006e80:	1740006f          	j	80006ff4 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    80006e84:	00006797          	auipc	a5,0x6
    80006e88:	f5c78793          	addi	a5,a5,-164 # 8000cde0 <_ZN15MemoryAllocator11usedMemHeadE>
    80006e8c:	0007b783          	ld	a5,0(a5)
    80006e90:	00079663          	bnez	a5,80006e9c <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    80006e94:	fff00793          	li	a5,-1
    80006e98:	15c0006f          	j	80006ff4 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80006e9c:	fb843783          	ld	a5,-72(s0)
    80006ea0:	fe078793          	addi	a5,a5,-32
    80006ea4:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    80006ea8:	00006797          	auipc	a5,0x6
    80006eac:	f3878793          	addi	a5,a5,-200 # 8000cde0 <_ZN15MemoryAllocator11usedMemHeadE>
    80006eb0:	0007b783          	ld	a5,0(a5)
    80006eb4:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    80006eb8:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80006ebc:	fe843783          	ld	a5,-24(s0)
    80006ec0:	02078463          	beqz	a5,80006ee8 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80006ec4:	fe843703          	ld	a4,-24(s0)
    80006ec8:	fb843783          	ld	a5,-72(s0)
    80006ecc:	00f70e63          	beq	a4,a5,80006ee8 <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    80006ed0:	fe843783          	ld	a5,-24(s0)
    80006ed4:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80006ed8:	fe843783          	ld	a5,-24(s0)
    80006edc:	0007b783          	ld	a5,0(a5)
    80006ee0:	fef43423          	sd	a5,-24(s0)
    80006ee4:	fd9ff06f          	j	80006ebc <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80006ee8:	fe843703          	ld	a4,-24(s0)
    80006eec:	fb843783          	ld	a5,-72(s0)
    80006ef0:	00f70663          	beq	a4,a5,80006efc <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80006ef4:	fff00793          	li	a5,-1
    80006ef8:	0fc0006f          	j	80006ff4 <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    80006efc:	fe043783          	ld	a5,-32(s0)
    80006f00:	00078c63          	beqz	a5,80006f18 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80006f04:	fe843783          	ld	a5,-24(s0)
    80006f08:	0007b703          	ld	a4,0(a5)
    80006f0c:	fe043783          	ld	a5,-32(s0)
    80006f10:	00e7b023          	sd	a4,0(a5)
    80006f14:	0180006f          	j	80006f2c <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    80006f18:	fe843783          	ld	a5,-24(s0)
    80006f1c:	0007b703          	ld	a4,0(a5)
    80006f20:	00006797          	auipc	a5,0x6
    80006f24:	ec078793          	addi	a5,a5,-320 # 8000cde0 <_ZN15MemoryAllocator11usedMemHeadE>
    80006f28:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    80006f2c:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    80006f30:	00006797          	auipc	a5,0x6
    80006f34:	eb878793          	addi	a5,a5,-328 # 8000cde8 <_ZN15MemoryAllocator11freeMemHeadE>
    80006f38:	0007b783          	ld	a5,0(a5)
    80006f3c:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    80006f40:	fd043783          	ld	a5,-48(s0)
    80006f44:	02078463          	beqz	a5,80006f6c <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80006f48:	fd043703          	ld	a4,-48(s0)
    80006f4c:	fb843783          	ld	a5,-72(s0)
    80006f50:	00f77e63          	bgeu	a4,a5,80006f6c <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80006f54:	fd043783          	ld	a5,-48(s0)
    80006f58:	fcf43c23          	sd	a5,-40(s0)
    80006f5c:	fd043783          	ld	a5,-48(s0)
    80006f60:	0007b783          	ld	a5,0(a5)
    80006f64:	fcf43823          	sd	a5,-48(s0)
    80006f68:	fd9ff06f          	j	80006f40 <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    80006f6c:	fb843783          	ld	a5,-72(s0)
    80006f70:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    80006f74:	fb843783          	ld	a5,-72(s0)
    80006f78:	0087b783          	ld	a5,8(a5)
    80006f7c:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    80006f80:	fc843783          	ld	a5,-56(s0)
    80006f84:	fc043703          	ld	a4,-64(s0)
    80006f88:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    80006f8c:	fd843783          	ld	a5,-40(s0)
    80006f90:	02078263          	beqz	a5,80006fb4 <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    80006f94:	fd843783          	ld	a5,-40(s0)
    80006f98:	0007b703          	ld	a4,0(a5)
    80006f9c:	fc843783          	ld	a5,-56(s0)
    80006fa0:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    80006fa4:	fd843783          	ld	a5,-40(s0)
    80006fa8:	fc843703          	ld	a4,-56(s0)
    80006fac:	00e7b023          	sd	a4,0(a5)
    80006fb0:	0280006f          	j	80006fd8 <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    80006fb4:	00006797          	auipc	a5,0x6
    80006fb8:	e3478793          	addi	a5,a5,-460 # 8000cde8 <_ZN15MemoryAllocator11freeMemHeadE>
    80006fbc:	0007b703          	ld	a4,0(a5)
    80006fc0:	fc843783          	ld	a5,-56(s0)
    80006fc4:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    80006fc8:	00006797          	auipc	a5,0x6
    80006fcc:	e2078793          	addi	a5,a5,-480 # 8000cde8 <_ZN15MemoryAllocator11freeMemHeadE>
    80006fd0:	fc843703          	ld	a4,-56(s0)
    80006fd4:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    80006fd8:	fc843503          	ld	a0,-56(s0)
    80006fdc:	00000097          	auipc	ra,0x0
    80006fe0:	02c080e7          	jalr	44(ra) # 80007008 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    80006fe4:	fd843503          	ld	a0,-40(s0)
    80006fe8:	00000097          	auipc	ra,0x0
    80006fec:	020080e7          	jalr	32(ra) # 80007008 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    80006ff0:	00000793          	li	a5,0
}
    80006ff4:	00078513          	mv	a0,a5
    80006ff8:	04813083          	ld	ra,72(sp)
    80006ffc:	04013403          	ld	s0,64(sp)
    80007000:	05010113          	addi	sp,sp,80
    80007004:	00008067          	ret

0000000080007008 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80007008:	fc010113          	addi	sp,sp,-64
    8000700c:	02813c23          	sd	s0,56(sp)
    80007010:	04010413          	addi	s0,sp,64
    80007014:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    80007018:	fc843783          	ld	a5,-56(s0)
    8000701c:	00079663          	bnez	a5,80007028 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    80007020:	00000793          	li	a5,0
    80007024:	0a00006f          	j	800070c4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    80007028:	fc843783          	ld	a5,-56(s0)
    8000702c:	0007b783          	ld	a5,0(a5)
    80007030:	00f037b3          	snez	a5,a5
    80007034:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    80007038:	fc843783          	ld	a5,-56(s0)
    8000703c:	0087b783          	ld	a5,8(a5)
    80007040:	fc843703          	ld	a4,-56(s0)
    80007044:	00f707b3          	add	a5,a4,a5
    80007048:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    8000704c:	fc843783          	ld	a5,-56(s0)
    80007050:	0007b783          	ld	a5,0(a5)
    80007054:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    80007058:	fe043703          	ld	a4,-32(s0)
    8000705c:	fd843783          	ld	a5,-40(s0)
    80007060:	40f707b3          	sub	a5,a4,a5
    80007064:	0017b793          	seqz	a5,a5
    80007068:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    8000706c:	fef44783          	lbu	a5,-17(s0)
    80007070:	0ff7f793          	andi	a5,a5,255
    80007074:	04078663          	beqz	a5,800070c0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    80007078:	fd744783          	lbu	a5,-41(s0)
    8000707c:	0ff7f793          	andi	a5,a5,255
    80007080:	04078063          	beqz	a5,800070c0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    80007084:	fc843783          	ld	a5,-56(s0)
    80007088:	0087b703          	ld	a4,8(a5)
    8000708c:	fc843783          	ld	a5,-56(s0)
    80007090:	0007b783          	ld	a5,0(a5)
    80007094:	0087b783          	ld	a5,8(a5)
    80007098:	00f70733          	add	a4,a4,a5
    8000709c:	fc843783          	ld	a5,-56(s0)
    800070a0:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    800070a4:	fc843783          	ld	a5,-56(s0)
    800070a8:	0007b783          	ld	a5,0(a5)
    800070ac:	0007b703          	ld	a4,0(a5)
    800070b0:	fc843783          	ld	a5,-56(s0)
    800070b4:	00e7b023          	sd	a4,0(a5)
        return 1;
    800070b8:	00100793          	li	a5,1
    800070bc:	0080006f          	j	800070c4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    800070c0:	00000793          	li	a5,0
}
    800070c4:	00078513          	mv	a0,a5
    800070c8:	03813403          	ld	s0,56(sp)
    800070cc:	04010113          	addi	sp,sp,64
    800070d0:	00008067          	ret

00000000800070d4 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    800070d4:	fe010113          	addi	sp,sp,-32
    800070d8:	00813c23          	sd	s0,24(sp)
    800070dc:	02010413          	addi	s0,sp,32
    800070e0:	fea43423          	sd	a0,-24(s0)
    800070e4:	00058793          	mv	a5,a1
    800070e8:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    800070ec:	fe843783          	ld	a5,-24(s0)
    800070f0:	fe078793          	addi	a5,a5,-32
    800070f4:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    800070f8:	fe843783          	ld	a5,-24(s0)
    800070fc:	0107a703          	lw	a4,16(a5)
    80007100:	fe442783          	lw	a5,-28(s0)
    80007104:	0007879b          	sext.w	a5,a5
    80007108:	40e787b3          	sub	a5,a5,a4
    8000710c:	0017b793          	seqz	a5,a5
    80007110:	0ff7f793          	andi	a5,a5,255
}
    80007114:	00078513          	mv	a0,a5
    80007118:	01813403          	ld	s0,24(sp)
    8000711c:	02010113          	addi	sp,sp,32
    80007120:	00008067          	ret

0000000080007124 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    80007124:	ff010113          	addi	sp,sp,-16
    80007128:	00813423          	sd	s0,8(sp)
    8000712c:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    80007130:	00006797          	auipc	a5,0x6
    80007134:	cc078793          	addi	a5,a5,-832 # 8000cdf0 <_ZN15MemoryAllocator11initializedE>
    80007138:	0007c783          	lbu	a5,0(a5)
    8000713c:	0017c793          	xori	a5,a5,1
    80007140:	0ff7f793          	andi	a5,a5,255
    80007144:	06078a63          	beqz	a5,800071b8 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    80007148:	00006797          	auipc	a5,0x6
    8000714c:	a287b783          	ld	a5,-1496(a5) # 8000cb70 <_GLOBAL_OFFSET_TABLE_+0x28>
    80007150:	0007b703          	ld	a4,0(a5)
    80007154:	00006797          	auipc	a5,0x6
    80007158:	c9478793          	addi	a5,a5,-876 # 8000cde8 <_ZN15MemoryAllocator11freeMemHeadE>
    8000715c:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    80007160:	00006797          	auipc	a5,0x6
    80007164:	c8878793          	addi	a5,a5,-888 # 8000cde8 <_ZN15MemoryAllocator11freeMemHeadE>
    80007168:	0007b783          	ld	a5,0(a5)
    8000716c:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    80007170:	00006797          	auipc	a5,0x6
    80007174:	a487b783          	ld	a5,-1464(a5) # 8000cbb8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80007178:	0007b703          	ld	a4,0(a5)
    8000717c:	00006797          	auipc	a5,0x6
    80007180:	9f47b783          	ld	a5,-1548(a5) # 8000cb70 <_GLOBAL_OFFSET_TABLE_+0x28>
    80007184:	0007b783          	ld	a5,0(a5)
    80007188:	40f70733          	sub	a4,a4,a5
    8000718c:	00006797          	auipc	a5,0x6
    80007190:	c5c78793          	addi	a5,a5,-932 # 8000cde8 <_ZN15MemoryAllocator11freeMemHeadE>
    80007194:	0007b783          	ld	a5,0(a5)
    80007198:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    8000719c:	00006797          	auipc	a5,0x6
    800071a0:	c4478793          	addi	a5,a5,-956 # 8000cde0 <_ZN15MemoryAllocator11usedMemHeadE>
    800071a4:	0007b023          	sd	zero,0(a5)

        initialized = true;
    800071a8:	00006797          	auipc	a5,0x6
    800071ac:	c4878793          	addi	a5,a5,-952 # 8000cdf0 <_ZN15MemoryAllocator11initializedE>
    800071b0:	00100713          	li	a4,1
    800071b4:	00e78023          	sb	a4,0(a5)
    }
}
    800071b8:	00000013          	nop
    800071bc:	00813403          	ld	s0,8(sp)
    800071c0:	01010113          	addi	sp,sp,16
    800071c4:	00008067          	ret

00000000800071c8 <start>:
    800071c8:	ff010113          	addi	sp,sp,-16
    800071cc:	00813423          	sd	s0,8(sp)
    800071d0:	01010413          	addi	s0,sp,16
    800071d4:	300027f3          	csrr	a5,mstatus
    800071d8:	ffffe737          	lui	a4,0xffffe
    800071dc:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff079f>
    800071e0:	00e7f7b3          	and	a5,a5,a4
    800071e4:	00001737          	lui	a4,0x1
    800071e8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800071ec:	00e7e7b3          	or	a5,a5,a4
    800071f0:	30079073          	csrw	mstatus,a5
    800071f4:	00000797          	auipc	a5,0x0
    800071f8:	16078793          	addi	a5,a5,352 # 80007354 <system_main>
    800071fc:	34179073          	csrw	mepc,a5
    80007200:	00000793          	li	a5,0
    80007204:	18079073          	csrw	satp,a5
    80007208:	000107b7          	lui	a5,0x10
    8000720c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007210:	30279073          	csrw	medeleg,a5
    80007214:	30379073          	csrw	mideleg,a5
    80007218:	104027f3          	csrr	a5,sie
    8000721c:	2227e793          	ori	a5,a5,546
    80007220:	10479073          	csrw	sie,a5
    80007224:	fff00793          	li	a5,-1
    80007228:	00a7d793          	srli	a5,a5,0xa
    8000722c:	3b079073          	csrw	pmpaddr0,a5
    80007230:	00f00793          	li	a5,15
    80007234:	3a079073          	csrw	pmpcfg0,a5
    80007238:	f14027f3          	csrr	a5,mhartid
    8000723c:	0200c737          	lui	a4,0x200c
    80007240:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007244:	0007869b          	sext.w	a3,a5
    80007248:	00269713          	slli	a4,a3,0x2
    8000724c:	000f4637          	lui	a2,0xf4
    80007250:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007254:	00d70733          	add	a4,a4,a3
    80007258:	0037979b          	slliw	a5,a5,0x3
    8000725c:	020046b7          	lui	a3,0x2004
    80007260:	00d787b3          	add	a5,a5,a3
    80007264:	00c585b3          	add	a1,a1,a2
    80007268:	00371693          	slli	a3,a4,0x3
    8000726c:	00006717          	auipc	a4,0x6
    80007270:	b9470713          	addi	a4,a4,-1132 # 8000ce00 <timer_scratch>
    80007274:	00b7b023          	sd	a1,0(a5)
    80007278:	00d70733          	add	a4,a4,a3
    8000727c:	00f73c23          	sd	a5,24(a4)
    80007280:	02c73023          	sd	a2,32(a4)
    80007284:	34071073          	csrw	mscratch,a4
    80007288:	00000797          	auipc	a5,0x0
    8000728c:	6e878793          	addi	a5,a5,1768 # 80007970 <timervec>
    80007290:	30579073          	csrw	mtvec,a5
    80007294:	300027f3          	csrr	a5,mstatus
    80007298:	0087e793          	ori	a5,a5,8
    8000729c:	30079073          	csrw	mstatus,a5
    800072a0:	304027f3          	csrr	a5,mie
    800072a4:	0807e793          	ori	a5,a5,128
    800072a8:	30479073          	csrw	mie,a5
    800072ac:	f14027f3          	csrr	a5,mhartid
    800072b0:	0007879b          	sext.w	a5,a5
    800072b4:	00078213          	mv	tp,a5
    800072b8:	30200073          	mret
    800072bc:	00813403          	ld	s0,8(sp)
    800072c0:	01010113          	addi	sp,sp,16
    800072c4:	00008067          	ret

00000000800072c8 <timerinit>:
    800072c8:	ff010113          	addi	sp,sp,-16
    800072cc:	00813423          	sd	s0,8(sp)
    800072d0:	01010413          	addi	s0,sp,16
    800072d4:	f14027f3          	csrr	a5,mhartid
    800072d8:	0200c737          	lui	a4,0x200c
    800072dc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800072e0:	0007869b          	sext.w	a3,a5
    800072e4:	00269713          	slli	a4,a3,0x2
    800072e8:	000f4637          	lui	a2,0xf4
    800072ec:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800072f0:	00d70733          	add	a4,a4,a3
    800072f4:	0037979b          	slliw	a5,a5,0x3
    800072f8:	020046b7          	lui	a3,0x2004
    800072fc:	00d787b3          	add	a5,a5,a3
    80007300:	00c585b3          	add	a1,a1,a2
    80007304:	00371693          	slli	a3,a4,0x3
    80007308:	00006717          	auipc	a4,0x6
    8000730c:	af870713          	addi	a4,a4,-1288 # 8000ce00 <timer_scratch>
    80007310:	00b7b023          	sd	a1,0(a5)
    80007314:	00d70733          	add	a4,a4,a3
    80007318:	00f73c23          	sd	a5,24(a4)
    8000731c:	02c73023          	sd	a2,32(a4)
    80007320:	34071073          	csrw	mscratch,a4
    80007324:	00000797          	auipc	a5,0x0
    80007328:	64c78793          	addi	a5,a5,1612 # 80007970 <timervec>
    8000732c:	30579073          	csrw	mtvec,a5
    80007330:	300027f3          	csrr	a5,mstatus
    80007334:	0087e793          	ori	a5,a5,8
    80007338:	30079073          	csrw	mstatus,a5
    8000733c:	304027f3          	csrr	a5,mie
    80007340:	0807e793          	ori	a5,a5,128
    80007344:	30479073          	csrw	mie,a5
    80007348:	00813403          	ld	s0,8(sp)
    8000734c:	01010113          	addi	sp,sp,16
    80007350:	00008067          	ret

0000000080007354 <system_main>:
    80007354:	fe010113          	addi	sp,sp,-32
    80007358:	00813823          	sd	s0,16(sp)
    8000735c:	00913423          	sd	s1,8(sp)
    80007360:	00113c23          	sd	ra,24(sp)
    80007364:	02010413          	addi	s0,sp,32
    80007368:	00000097          	auipc	ra,0x0
    8000736c:	0c4080e7          	jalr	196(ra) # 8000742c <cpuid>
    80007370:	00006497          	auipc	s1,0x6
    80007374:	88048493          	addi	s1,s1,-1920 # 8000cbf0 <started>
    80007378:	02050263          	beqz	a0,8000739c <system_main+0x48>
    8000737c:	0004a783          	lw	a5,0(s1)
    80007380:	0007879b          	sext.w	a5,a5
    80007384:	fe078ce3          	beqz	a5,8000737c <system_main+0x28>
    80007388:	0ff0000f          	fence
    8000738c:	00003517          	auipc	a0,0x3
    80007390:	32c50513          	addi	a0,a0,812 # 8000a6b8 <CONSOLE_STATUS+0x6a8>
    80007394:	00001097          	auipc	ra,0x1
    80007398:	a78080e7          	jalr	-1416(ra) # 80007e0c <panic>
    8000739c:	00001097          	auipc	ra,0x1
    800073a0:	9cc080e7          	jalr	-1588(ra) # 80007d68 <consoleinit>
    800073a4:	00001097          	auipc	ra,0x1
    800073a8:	158080e7          	jalr	344(ra) # 800084fc <printfinit>
    800073ac:	00003517          	auipc	a0,0x3
    800073b0:	19450513          	addi	a0,a0,404 # 8000a540 <CONSOLE_STATUS+0x530>
    800073b4:	00001097          	auipc	ra,0x1
    800073b8:	ab4080e7          	jalr	-1356(ra) # 80007e68 <__printf>
    800073bc:	00003517          	auipc	a0,0x3
    800073c0:	2cc50513          	addi	a0,a0,716 # 8000a688 <CONSOLE_STATUS+0x678>
    800073c4:	00001097          	auipc	ra,0x1
    800073c8:	aa4080e7          	jalr	-1372(ra) # 80007e68 <__printf>
    800073cc:	00003517          	auipc	a0,0x3
    800073d0:	17450513          	addi	a0,a0,372 # 8000a540 <CONSOLE_STATUS+0x530>
    800073d4:	00001097          	auipc	ra,0x1
    800073d8:	a94080e7          	jalr	-1388(ra) # 80007e68 <__printf>
    800073dc:	00001097          	auipc	ra,0x1
    800073e0:	4ac080e7          	jalr	1196(ra) # 80008888 <kinit>
    800073e4:	00000097          	auipc	ra,0x0
    800073e8:	148080e7          	jalr	328(ra) # 8000752c <trapinit>
    800073ec:	00000097          	auipc	ra,0x0
    800073f0:	16c080e7          	jalr	364(ra) # 80007558 <trapinithart>
    800073f4:	00000097          	auipc	ra,0x0
    800073f8:	5bc080e7          	jalr	1468(ra) # 800079b0 <plicinit>
    800073fc:	00000097          	auipc	ra,0x0
    80007400:	5dc080e7          	jalr	1500(ra) # 800079d8 <plicinithart>
    80007404:	00000097          	auipc	ra,0x0
    80007408:	078080e7          	jalr	120(ra) # 8000747c <userinit>
    8000740c:	0ff0000f          	fence
    80007410:	00100793          	li	a5,1
    80007414:	00003517          	auipc	a0,0x3
    80007418:	28c50513          	addi	a0,a0,652 # 8000a6a0 <CONSOLE_STATUS+0x690>
    8000741c:	00f4a023          	sw	a5,0(s1)
    80007420:	00001097          	auipc	ra,0x1
    80007424:	a48080e7          	jalr	-1464(ra) # 80007e68 <__printf>
    80007428:	0000006f          	j	80007428 <system_main+0xd4>

000000008000742c <cpuid>:
    8000742c:	ff010113          	addi	sp,sp,-16
    80007430:	00813423          	sd	s0,8(sp)
    80007434:	01010413          	addi	s0,sp,16
    80007438:	00020513          	mv	a0,tp
    8000743c:	00813403          	ld	s0,8(sp)
    80007440:	0005051b          	sext.w	a0,a0
    80007444:	01010113          	addi	sp,sp,16
    80007448:	00008067          	ret

000000008000744c <mycpu>:
    8000744c:	ff010113          	addi	sp,sp,-16
    80007450:	00813423          	sd	s0,8(sp)
    80007454:	01010413          	addi	s0,sp,16
    80007458:	00020793          	mv	a5,tp
    8000745c:	00813403          	ld	s0,8(sp)
    80007460:	0007879b          	sext.w	a5,a5
    80007464:	00779793          	slli	a5,a5,0x7
    80007468:	00007517          	auipc	a0,0x7
    8000746c:	9c850513          	addi	a0,a0,-1592 # 8000de30 <cpus>
    80007470:	00f50533          	add	a0,a0,a5
    80007474:	01010113          	addi	sp,sp,16
    80007478:	00008067          	ret

000000008000747c <userinit>:
    8000747c:	ff010113          	addi	sp,sp,-16
    80007480:	00813423          	sd	s0,8(sp)
    80007484:	01010413          	addi	s0,sp,16
    80007488:	00813403          	ld	s0,8(sp)
    8000748c:	01010113          	addi	sp,sp,16
    80007490:	ffffb317          	auipc	t1,0xffffb
    80007494:	97430067          	jr	-1676(t1) # 80001e04 <main>

0000000080007498 <either_copyout>:
    80007498:	ff010113          	addi	sp,sp,-16
    8000749c:	00813023          	sd	s0,0(sp)
    800074a0:	00113423          	sd	ra,8(sp)
    800074a4:	01010413          	addi	s0,sp,16
    800074a8:	02051663          	bnez	a0,800074d4 <either_copyout+0x3c>
    800074ac:	00058513          	mv	a0,a1
    800074b0:	00060593          	mv	a1,a2
    800074b4:	0006861b          	sext.w	a2,a3
    800074b8:	00002097          	auipc	ra,0x2
    800074bc:	c5c080e7          	jalr	-932(ra) # 80009114 <__memmove>
    800074c0:	00813083          	ld	ra,8(sp)
    800074c4:	00013403          	ld	s0,0(sp)
    800074c8:	00000513          	li	a0,0
    800074cc:	01010113          	addi	sp,sp,16
    800074d0:	00008067          	ret
    800074d4:	00003517          	auipc	a0,0x3
    800074d8:	20c50513          	addi	a0,a0,524 # 8000a6e0 <CONSOLE_STATUS+0x6d0>
    800074dc:	00001097          	auipc	ra,0x1
    800074e0:	930080e7          	jalr	-1744(ra) # 80007e0c <panic>

00000000800074e4 <either_copyin>:
    800074e4:	ff010113          	addi	sp,sp,-16
    800074e8:	00813023          	sd	s0,0(sp)
    800074ec:	00113423          	sd	ra,8(sp)
    800074f0:	01010413          	addi	s0,sp,16
    800074f4:	02059463          	bnez	a1,8000751c <either_copyin+0x38>
    800074f8:	00060593          	mv	a1,a2
    800074fc:	0006861b          	sext.w	a2,a3
    80007500:	00002097          	auipc	ra,0x2
    80007504:	c14080e7          	jalr	-1004(ra) # 80009114 <__memmove>
    80007508:	00813083          	ld	ra,8(sp)
    8000750c:	00013403          	ld	s0,0(sp)
    80007510:	00000513          	li	a0,0
    80007514:	01010113          	addi	sp,sp,16
    80007518:	00008067          	ret
    8000751c:	00003517          	auipc	a0,0x3
    80007520:	1ec50513          	addi	a0,a0,492 # 8000a708 <CONSOLE_STATUS+0x6f8>
    80007524:	00001097          	auipc	ra,0x1
    80007528:	8e8080e7          	jalr	-1816(ra) # 80007e0c <panic>

000000008000752c <trapinit>:
    8000752c:	ff010113          	addi	sp,sp,-16
    80007530:	00813423          	sd	s0,8(sp)
    80007534:	01010413          	addi	s0,sp,16
    80007538:	00813403          	ld	s0,8(sp)
    8000753c:	00003597          	auipc	a1,0x3
    80007540:	1f458593          	addi	a1,a1,500 # 8000a730 <CONSOLE_STATUS+0x720>
    80007544:	00007517          	auipc	a0,0x7
    80007548:	96c50513          	addi	a0,a0,-1684 # 8000deb0 <tickslock>
    8000754c:	01010113          	addi	sp,sp,16
    80007550:	00001317          	auipc	t1,0x1
    80007554:	5c830067          	jr	1480(t1) # 80008b18 <initlock>

0000000080007558 <trapinithart>:
    80007558:	ff010113          	addi	sp,sp,-16
    8000755c:	00813423          	sd	s0,8(sp)
    80007560:	01010413          	addi	s0,sp,16
    80007564:	00000797          	auipc	a5,0x0
    80007568:	2fc78793          	addi	a5,a5,764 # 80007860 <kernelvec>
    8000756c:	10579073          	csrw	stvec,a5
    80007570:	00813403          	ld	s0,8(sp)
    80007574:	01010113          	addi	sp,sp,16
    80007578:	00008067          	ret

000000008000757c <usertrap>:
    8000757c:	ff010113          	addi	sp,sp,-16
    80007580:	00813423          	sd	s0,8(sp)
    80007584:	01010413          	addi	s0,sp,16
    80007588:	00813403          	ld	s0,8(sp)
    8000758c:	01010113          	addi	sp,sp,16
    80007590:	00008067          	ret

0000000080007594 <usertrapret>:
    80007594:	ff010113          	addi	sp,sp,-16
    80007598:	00813423          	sd	s0,8(sp)
    8000759c:	01010413          	addi	s0,sp,16
    800075a0:	00813403          	ld	s0,8(sp)
    800075a4:	01010113          	addi	sp,sp,16
    800075a8:	00008067          	ret

00000000800075ac <kerneltrap>:
    800075ac:	fe010113          	addi	sp,sp,-32
    800075b0:	00813823          	sd	s0,16(sp)
    800075b4:	00113c23          	sd	ra,24(sp)
    800075b8:	00913423          	sd	s1,8(sp)
    800075bc:	02010413          	addi	s0,sp,32
    800075c0:	142025f3          	csrr	a1,scause
    800075c4:	100027f3          	csrr	a5,sstatus
    800075c8:	0027f793          	andi	a5,a5,2
    800075cc:	10079c63          	bnez	a5,800076e4 <kerneltrap+0x138>
    800075d0:	142027f3          	csrr	a5,scause
    800075d4:	0207ce63          	bltz	a5,80007610 <kerneltrap+0x64>
    800075d8:	00003517          	auipc	a0,0x3
    800075dc:	1a050513          	addi	a0,a0,416 # 8000a778 <CONSOLE_STATUS+0x768>
    800075e0:	00001097          	auipc	ra,0x1
    800075e4:	888080e7          	jalr	-1912(ra) # 80007e68 <__printf>
    800075e8:	141025f3          	csrr	a1,sepc
    800075ec:	14302673          	csrr	a2,stval
    800075f0:	00003517          	auipc	a0,0x3
    800075f4:	19850513          	addi	a0,a0,408 # 8000a788 <CONSOLE_STATUS+0x778>
    800075f8:	00001097          	auipc	ra,0x1
    800075fc:	870080e7          	jalr	-1936(ra) # 80007e68 <__printf>
    80007600:	00003517          	auipc	a0,0x3
    80007604:	1a050513          	addi	a0,a0,416 # 8000a7a0 <CONSOLE_STATUS+0x790>
    80007608:	00001097          	auipc	ra,0x1
    8000760c:	804080e7          	jalr	-2044(ra) # 80007e0c <panic>
    80007610:	0ff7f713          	andi	a4,a5,255
    80007614:	00900693          	li	a3,9
    80007618:	04d70063          	beq	a4,a3,80007658 <kerneltrap+0xac>
    8000761c:	fff00713          	li	a4,-1
    80007620:	03f71713          	slli	a4,a4,0x3f
    80007624:	00170713          	addi	a4,a4,1
    80007628:	fae798e3          	bne	a5,a4,800075d8 <kerneltrap+0x2c>
    8000762c:	00000097          	auipc	ra,0x0
    80007630:	e00080e7          	jalr	-512(ra) # 8000742c <cpuid>
    80007634:	06050663          	beqz	a0,800076a0 <kerneltrap+0xf4>
    80007638:	144027f3          	csrr	a5,sip
    8000763c:	ffd7f793          	andi	a5,a5,-3
    80007640:	14479073          	csrw	sip,a5
    80007644:	01813083          	ld	ra,24(sp)
    80007648:	01013403          	ld	s0,16(sp)
    8000764c:	00813483          	ld	s1,8(sp)
    80007650:	02010113          	addi	sp,sp,32
    80007654:	00008067          	ret
    80007658:	00000097          	auipc	ra,0x0
    8000765c:	3cc080e7          	jalr	972(ra) # 80007a24 <plic_claim>
    80007660:	00a00793          	li	a5,10
    80007664:	00050493          	mv	s1,a0
    80007668:	06f50863          	beq	a0,a5,800076d8 <kerneltrap+0x12c>
    8000766c:	fc050ce3          	beqz	a0,80007644 <kerneltrap+0x98>
    80007670:	00050593          	mv	a1,a0
    80007674:	00003517          	auipc	a0,0x3
    80007678:	0e450513          	addi	a0,a0,228 # 8000a758 <CONSOLE_STATUS+0x748>
    8000767c:	00000097          	auipc	ra,0x0
    80007680:	7ec080e7          	jalr	2028(ra) # 80007e68 <__printf>
    80007684:	01013403          	ld	s0,16(sp)
    80007688:	01813083          	ld	ra,24(sp)
    8000768c:	00048513          	mv	a0,s1
    80007690:	00813483          	ld	s1,8(sp)
    80007694:	02010113          	addi	sp,sp,32
    80007698:	00000317          	auipc	t1,0x0
    8000769c:	3c430067          	jr	964(t1) # 80007a5c <plic_complete>
    800076a0:	00007517          	auipc	a0,0x7
    800076a4:	81050513          	addi	a0,a0,-2032 # 8000deb0 <tickslock>
    800076a8:	00001097          	auipc	ra,0x1
    800076ac:	494080e7          	jalr	1172(ra) # 80008b3c <acquire>
    800076b0:	00005717          	auipc	a4,0x5
    800076b4:	54470713          	addi	a4,a4,1348 # 8000cbf4 <ticks>
    800076b8:	00072783          	lw	a5,0(a4)
    800076bc:	00006517          	auipc	a0,0x6
    800076c0:	7f450513          	addi	a0,a0,2036 # 8000deb0 <tickslock>
    800076c4:	0017879b          	addiw	a5,a5,1
    800076c8:	00f72023          	sw	a5,0(a4)
    800076cc:	00001097          	auipc	ra,0x1
    800076d0:	53c080e7          	jalr	1340(ra) # 80008c08 <release>
    800076d4:	f65ff06f          	j	80007638 <kerneltrap+0x8c>
    800076d8:	00001097          	auipc	ra,0x1
    800076dc:	098080e7          	jalr	152(ra) # 80008770 <uartintr>
    800076e0:	fa5ff06f          	j	80007684 <kerneltrap+0xd8>
    800076e4:	00003517          	auipc	a0,0x3
    800076e8:	05450513          	addi	a0,a0,84 # 8000a738 <CONSOLE_STATUS+0x728>
    800076ec:	00000097          	auipc	ra,0x0
    800076f0:	720080e7          	jalr	1824(ra) # 80007e0c <panic>

00000000800076f4 <clockintr>:
    800076f4:	fe010113          	addi	sp,sp,-32
    800076f8:	00813823          	sd	s0,16(sp)
    800076fc:	00913423          	sd	s1,8(sp)
    80007700:	00113c23          	sd	ra,24(sp)
    80007704:	02010413          	addi	s0,sp,32
    80007708:	00006497          	auipc	s1,0x6
    8000770c:	7a848493          	addi	s1,s1,1960 # 8000deb0 <tickslock>
    80007710:	00048513          	mv	a0,s1
    80007714:	00001097          	auipc	ra,0x1
    80007718:	428080e7          	jalr	1064(ra) # 80008b3c <acquire>
    8000771c:	00005717          	auipc	a4,0x5
    80007720:	4d870713          	addi	a4,a4,1240 # 8000cbf4 <ticks>
    80007724:	00072783          	lw	a5,0(a4)
    80007728:	01013403          	ld	s0,16(sp)
    8000772c:	01813083          	ld	ra,24(sp)
    80007730:	00048513          	mv	a0,s1
    80007734:	0017879b          	addiw	a5,a5,1
    80007738:	00813483          	ld	s1,8(sp)
    8000773c:	00f72023          	sw	a5,0(a4)
    80007740:	02010113          	addi	sp,sp,32
    80007744:	00001317          	auipc	t1,0x1
    80007748:	4c430067          	jr	1220(t1) # 80008c08 <release>

000000008000774c <devintr>:
    8000774c:	142027f3          	csrr	a5,scause
    80007750:	00000513          	li	a0,0
    80007754:	0007c463          	bltz	a5,8000775c <devintr+0x10>
    80007758:	00008067          	ret
    8000775c:	fe010113          	addi	sp,sp,-32
    80007760:	00813823          	sd	s0,16(sp)
    80007764:	00113c23          	sd	ra,24(sp)
    80007768:	00913423          	sd	s1,8(sp)
    8000776c:	02010413          	addi	s0,sp,32
    80007770:	0ff7f713          	andi	a4,a5,255
    80007774:	00900693          	li	a3,9
    80007778:	04d70c63          	beq	a4,a3,800077d0 <devintr+0x84>
    8000777c:	fff00713          	li	a4,-1
    80007780:	03f71713          	slli	a4,a4,0x3f
    80007784:	00170713          	addi	a4,a4,1
    80007788:	00e78c63          	beq	a5,a4,800077a0 <devintr+0x54>
    8000778c:	01813083          	ld	ra,24(sp)
    80007790:	01013403          	ld	s0,16(sp)
    80007794:	00813483          	ld	s1,8(sp)
    80007798:	02010113          	addi	sp,sp,32
    8000779c:	00008067          	ret
    800077a0:	00000097          	auipc	ra,0x0
    800077a4:	c8c080e7          	jalr	-884(ra) # 8000742c <cpuid>
    800077a8:	06050663          	beqz	a0,80007814 <devintr+0xc8>
    800077ac:	144027f3          	csrr	a5,sip
    800077b0:	ffd7f793          	andi	a5,a5,-3
    800077b4:	14479073          	csrw	sip,a5
    800077b8:	01813083          	ld	ra,24(sp)
    800077bc:	01013403          	ld	s0,16(sp)
    800077c0:	00813483          	ld	s1,8(sp)
    800077c4:	00200513          	li	a0,2
    800077c8:	02010113          	addi	sp,sp,32
    800077cc:	00008067          	ret
    800077d0:	00000097          	auipc	ra,0x0
    800077d4:	254080e7          	jalr	596(ra) # 80007a24 <plic_claim>
    800077d8:	00a00793          	li	a5,10
    800077dc:	00050493          	mv	s1,a0
    800077e0:	06f50663          	beq	a0,a5,8000784c <devintr+0x100>
    800077e4:	00100513          	li	a0,1
    800077e8:	fa0482e3          	beqz	s1,8000778c <devintr+0x40>
    800077ec:	00048593          	mv	a1,s1
    800077f0:	00003517          	auipc	a0,0x3
    800077f4:	f6850513          	addi	a0,a0,-152 # 8000a758 <CONSOLE_STATUS+0x748>
    800077f8:	00000097          	auipc	ra,0x0
    800077fc:	670080e7          	jalr	1648(ra) # 80007e68 <__printf>
    80007800:	00048513          	mv	a0,s1
    80007804:	00000097          	auipc	ra,0x0
    80007808:	258080e7          	jalr	600(ra) # 80007a5c <plic_complete>
    8000780c:	00100513          	li	a0,1
    80007810:	f7dff06f          	j	8000778c <devintr+0x40>
    80007814:	00006517          	auipc	a0,0x6
    80007818:	69c50513          	addi	a0,a0,1692 # 8000deb0 <tickslock>
    8000781c:	00001097          	auipc	ra,0x1
    80007820:	320080e7          	jalr	800(ra) # 80008b3c <acquire>
    80007824:	00005717          	auipc	a4,0x5
    80007828:	3d070713          	addi	a4,a4,976 # 8000cbf4 <ticks>
    8000782c:	00072783          	lw	a5,0(a4)
    80007830:	00006517          	auipc	a0,0x6
    80007834:	68050513          	addi	a0,a0,1664 # 8000deb0 <tickslock>
    80007838:	0017879b          	addiw	a5,a5,1
    8000783c:	00f72023          	sw	a5,0(a4)
    80007840:	00001097          	auipc	ra,0x1
    80007844:	3c8080e7          	jalr	968(ra) # 80008c08 <release>
    80007848:	f65ff06f          	j	800077ac <devintr+0x60>
    8000784c:	00001097          	auipc	ra,0x1
    80007850:	f24080e7          	jalr	-220(ra) # 80008770 <uartintr>
    80007854:	fadff06f          	j	80007800 <devintr+0xb4>
	...

0000000080007860 <kernelvec>:
    80007860:	f0010113          	addi	sp,sp,-256
    80007864:	00113023          	sd	ra,0(sp)
    80007868:	00213423          	sd	sp,8(sp)
    8000786c:	00313823          	sd	gp,16(sp)
    80007870:	00413c23          	sd	tp,24(sp)
    80007874:	02513023          	sd	t0,32(sp)
    80007878:	02613423          	sd	t1,40(sp)
    8000787c:	02713823          	sd	t2,48(sp)
    80007880:	02813c23          	sd	s0,56(sp)
    80007884:	04913023          	sd	s1,64(sp)
    80007888:	04a13423          	sd	a0,72(sp)
    8000788c:	04b13823          	sd	a1,80(sp)
    80007890:	04c13c23          	sd	a2,88(sp)
    80007894:	06d13023          	sd	a3,96(sp)
    80007898:	06e13423          	sd	a4,104(sp)
    8000789c:	06f13823          	sd	a5,112(sp)
    800078a0:	07013c23          	sd	a6,120(sp)
    800078a4:	09113023          	sd	a7,128(sp)
    800078a8:	09213423          	sd	s2,136(sp)
    800078ac:	09313823          	sd	s3,144(sp)
    800078b0:	09413c23          	sd	s4,152(sp)
    800078b4:	0b513023          	sd	s5,160(sp)
    800078b8:	0b613423          	sd	s6,168(sp)
    800078bc:	0b713823          	sd	s7,176(sp)
    800078c0:	0b813c23          	sd	s8,184(sp)
    800078c4:	0d913023          	sd	s9,192(sp)
    800078c8:	0da13423          	sd	s10,200(sp)
    800078cc:	0db13823          	sd	s11,208(sp)
    800078d0:	0dc13c23          	sd	t3,216(sp)
    800078d4:	0fd13023          	sd	t4,224(sp)
    800078d8:	0fe13423          	sd	t5,232(sp)
    800078dc:	0ff13823          	sd	t6,240(sp)
    800078e0:	ccdff0ef          	jal	ra,800075ac <kerneltrap>
    800078e4:	00013083          	ld	ra,0(sp)
    800078e8:	00813103          	ld	sp,8(sp)
    800078ec:	01013183          	ld	gp,16(sp)
    800078f0:	02013283          	ld	t0,32(sp)
    800078f4:	02813303          	ld	t1,40(sp)
    800078f8:	03013383          	ld	t2,48(sp)
    800078fc:	03813403          	ld	s0,56(sp)
    80007900:	04013483          	ld	s1,64(sp)
    80007904:	04813503          	ld	a0,72(sp)
    80007908:	05013583          	ld	a1,80(sp)
    8000790c:	05813603          	ld	a2,88(sp)
    80007910:	06013683          	ld	a3,96(sp)
    80007914:	06813703          	ld	a4,104(sp)
    80007918:	07013783          	ld	a5,112(sp)
    8000791c:	07813803          	ld	a6,120(sp)
    80007920:	08013883          	ld	a7,128(sp)
    80007924:	08813903          	ld	s2,136(sp)
    80007928:	09013983          	ld	s3,144(sp)
    8000792c:	09813a03          	ld	s4,152(sp)
    80007930:	0a013a83          	ld	s5,160(sp)
    80007934:	0a813b03          	ld	s6,168(sp)
    80007938:	0b013b83          	ld	s7,176(sp)
    8000793c:	0b813c03          	ld	s8,184(sp)
    80007940:	0c013c83          	ld	s9,192(sp)
    80007944:	0c813d03          	ld	s10,200(sp)
    80007948:	0d013d83          	ld	s11,208(sp)
    8000794c:	0d813e03          	ld	t3,216(sp)
    80007950:	0e013e83          	ld	t4,224(sp)
    80007954:	0e813f03          	ld	t5,232(sp)
    80007958:	0f013f83          	ld	t6,240(sp)
    8000795c:	10010113          	addi	sp,sp,256
    80007960:	10200073          	sret
    80007964:	00000013          	nop
    80007968:	00000013          	nop
    8000796c:	00000013          	nop

0000000080007970 <timervec>:
    80007970:	34051573          	csrrw	a0,mscratch,a0
    80007974:	00b53023          	sd	a1,0(a0)
    80007978:	00c53423          	sd	a2,8(a0)
    8000797c:	00d53823          	sd	a3,16(a0)
    80007980:	01853583          	ld	a1,24(a0)
    80007984:	02053603          	ld	a2,32(a0)
    80007988:	0005b683          	ld	a3,0(a1)
    8000798c:	00c686b3          	add	a3,a3,a2
    80007990:	00d5b023          	sd	a3,0(a1)
    80007994:	00200593          	li	a1,2
    80007998:	14459073          	csrw	sip,a1
    8000799c:	01053683          	ld	a3,16(a0)
    800079a0:	00853603          	ld	a2,8(a0)
    800079a4:	00053583          	ld	a1,0(a0)
    800079a8:	34051573          	csrrw	a0,mscratch,a0
    800079ac:	30200073          	mret

00000000800079b0 <plicinit>:
    800079b0:	ff010113          	addi	sp,sp,-16
    800079b4:	00813423          	sd	s0,8(sp)
    800079b8:	01010413          	addi	s0,sp,16
    800079bc:	00813403          	ld	s0,8(sp)
    800079c0:	0c0007b7          	lui	a5,0xc000
    800079c4:	00100713          	li	a4,1
    800079c8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800079cc:	00e7a223          	sw	a4,4(a5)
    800079d0:	01010113          	addi	sp,sp,16
    800079d4:	00008067          	ret

00000000800079d8 <plicinithart>:
    800079d8:	ff010113          	addi	sp,sp,-16
    800079dc:	00813023          	sd	s0,0(sp)
    800079e0:	00113423          	sd	ra,8(sp)
    800079e4:	01010413          	addi	s0,sp,16
    800079e8:	00000097          	auipc	ra,0x0
    800079ec:	a44080e7          	jalr	-1468(ra) # 8000742c <cpuid>
    800079f0:	0085171b          	slliw	a4,a0,0x8
    800079f4:	0c0027b7          	lui	a5,0xc002
    800079f8:	00e787b3          	add	a5,a5,a4
    800079fc:	40200713          	li	a4,1026
    80007a00:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007a04:	00813083          	ld	ra,8(sp)
    80007a08:	00013403          	ld	s0,0(sp)
    80007a0c:	00d5151b          	slliw	a0,a0,0xd
    80007a10:	0c2017b7          	lui	a5,0xc201
    80007a14:	00a78533          	add	a0,a5,a0
    80007a18:	00052023          	sw	zero,0(a0)
    80007a1c:	01010113          	addi	sp,sp,16
    80007a20:	00008067          	ret

0000000080007a24 <plic_claim>:
    80007a24:	ff010113          	addi	sp,sp,-16
    80007a28:	00813023          	sd	s0,0(sp)
    80007a2c:	00113423          	sd	ra,8(sp)
    80007a30:	01010413          	addi	s0,sp,16
    80007a34:	00000097          	auipc	ra,0x0
    80007a38:	9f8080e7          	jalr	-1544(ra) # 8000742c <cpuid>
    80007a3c:	00813083          	ld	ra,8(sp)
    80007a40:	00013403          	ld	s0,0(sp)
    80007a44:	00d5151b          	slliw	a0,a0,0xd
    80007a48:	0c2017b7          	lui	a5,0xc201
    80007a4c:	00a78533          	add	a0,a5,a0
    80007a50:	00452503          	lw	a0,4(a0)
    80007a54:	01010113          	addi	sp,sp,16
    80007a58:	00008067          	ret

0000000080007a5c <plic_complete>:
    80007a5c:	fe010113          	addi	sp,sp,-32
    80007a60:	00813823          	sd	s0,16(sp)
    80007a64:	00913423          	sd	s1,8(sp)
    80007a68:	00113c23          	sd	ra,24(sp)
    80007a6c:	02010413          	addi	s0,sp,32
    80007a70:	00050493          	mv	s1,a0
    80007a74:	00000097          	auipc	ra,0x0
    80007a78:	9b8080e7          	jalr	-1608(ra) # 8000742c <cpuid>
    80007a7c:	01813083          	ld	ra,24(sp)
    80007a80:	01013403          	ld	s0,16(sp)
    80007a84:	00d5179b          	slliw	a5,a0,0xd
    80007a88:	0c201737          	lui	a4,0xc201
    80007a8c:	00f707b3          	add	a5,a4,a5
    80007a90:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007a94:	00813483          	ld	s1,8(sp)
    80007a98:	02010113          	addi	sp,sp,32
    80007a9c:	00008067          	ret

0000000080007aa0 <consolewrite>:
    80007aa0:	fb010113          	addi	sp,sp,-80
    80007aa4:	04813023          	sd	s0,64(sp)
    80007aa8:	04113423          	sd	ra,72(sp)
    80007aac:	02913c23          	sd	s1,56(sp)
    80007ab0:	03213823          	sd	s2,48(sp)
    80007ab4:	03313423          	sd	s3,40(sp)
    80007ab8:	03413023          	sd	s4,32(sp)
    80007abc:	01513c23          	sd	s5,24(sp)
    80007ac0:	05010413          	addi	s0,sp,80
    80007ac4:	06c05c63          	blez	a2,80007b3c <consolewrite+0x9c>
    80007ac8:	00060993          	mv	s3,a2
    80007acc:	00050a13          	mv	s4,a0
    80007ad0:	00058493          	mv	s1,a1
    80007ad4:	00000913          	li	s2,0
    80007ad8:	fff00a93          	li	s5,-1
    80007adc:	01c0006f          	j	80007af8 <consolewrite+0x58>
    80007ae0:	fbf44503          	lbu	a0,-65(s0)
    80007ae4:	0019091b          	addiw	s2,s2,1
    80007ae8:	00148493          	addi	s1,s1,1
    80007aec:	00001097          	auipc	ra,0x1
    80007af0:	a9c080e7          	jalr	-1380(ra) # 80008588 <uartputc>
    80007af4:	03298063          	beq	s3,s2,80007b14 <consolewrite+0x74>
    80007af8:	00048613          	mv	a2,s1
    80007afc:	00100693          	li	a3,1
    80007b00:	000a0593          	mv	a1,s4
    80007b04:	fbf40513          	addi	a0,s0,-65
    80007b08:	00000097          	auipc	ra,0x0
    80007b0c:	9dc080e7          	jalr	-1572(ra) # 800074e4 <either_copyin>
    80007b10:	fd5518e3          	bne	a0,s5,80007ae0 <consolewrite+0x40>
    80007b14:	04813083          	ld	ra,72(sp)
    80007b18:	04013403          	ld	s0,64(sp)
    80007b1c:	03813483          	ld	s1,56(sp)
    80007b20:	02813983          	ld	s3,40(sp)
    80007b24:	02013a03          	ld	s4,32(sp)
    80007b28:	01813a83          	ld	s5,24(sp)
    80007b2c:	00090513          	mv	a0,s2
    80007b30:	03013903          	ld	s2,48(sp)
    80007b34:	05010113          	addi	sp,sp,80
    80007b38:	00008067          	ret
    80007b3c:	00000913          	li	s2,0
    80007b40:	fd5ff06f          	j	80007b14 <consolewrite+0x74>

0000000080007b44 <consoleread>:
    80007b44:	f9010113          	addi	sp,sp,-112
    80007b48:	06813023          	sd	s0,96(sp)
    80007b4c:	04913c23          	sd	s1,88(sp)
    80007b50:	05213823          	sd	s2,80(sp)
    80007b54:	05313423          	sd	s3,72(sp)
    80007b58:	05413023          	sd	s4,64(sp)
    80007b5c:	03513c23          	sd	s5,56(sp)
    80007b60:	03613823          	sd	s6,48(sp)
    80007b64:	03713423          	sd	s7,40(sp)
    80007b68:	03813023          	sd	s8,32(sp)
    80007b6c:	06113423          	sd	ra,104(sp)
    80007b70:	01913c23          	sd	s9,24(sp)
    80007b74:	07010413          	addi	s0,sp,112
    80007b78:	00060b93          	mv	s7,a2
    80007b7c:	00050913          	mv	s2,a0
    80007b80:	00058c13          	mv	s8,a1
    80007b84:	00060b1b          	sext.w	s6,a2
    80007b88:	00006497          	auipc	s1,0x6
    80007b8c:	35048493          	addi	s1,s1,848 # 8000ded8 <cons>
    80007b90:	00400993          	li	s3,4
    80007b94:	fff00a13          	li	s4,-1
    80007b98:	00a00a93          	li	s5,10
    80007b9c:	05705e63          	blez	s7,80007bf8 <consoleread+0xb4>
    80007ba0:	09c4a703          	lw	a4,156(s1)
    80007ba4:	0984a783          	lw	a5,152(s1)
    80007ba8:	0007071b          	sext.w	a4,a4
    80007bac:	08e78463          	beq	a5,a4,80007c34 <consoleread+0xf0>
    80007bb0:	07f7f713          	andi	a4,a5,127
    80007bb4:	00e48733          	add	a4,s1,a4
    80007bb8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80007bbc:	0017869b          	addiw	a3,a5,1
    80007bc0:	08d4ac23          	sw	a3,152(s1)
    80007bc4:	00070c9b          	sext.w	s9,a4
    80007bc8:	0b370663          	beq	a4,s3,80007c74 <consoleread+0x130>
    80007bcc:	00100693          	li	a3,1
    80007bd0:	f9f40613          	addi	a2,s0,-97
    80007bd4:	000c0593          	mv	a1,s8
    80007bd8:	00090513          	mv	a0,s2
    80007bdc:	f8e40fa3          	sb	a4,-97(s0)
    80007be0:	00000097          	auipc	ra,0x0
    80007be4:	8b8080e7          	jalr	-1864(ra) # 80007498 <either_copyout>
    80007be8:	01450863          	beq	a0,s4,80007bf8 <consoleread+0xb4>
    80007bec:	001c0c13          	addi	s8,s8,1
    80007bf0:	fffb8b9b          	addiw	s7,s7,-1
    80007bf4:	fb5c94e3          	bne	s9,s5,80007b9c <consoleread+0x58>
    80007bf8:	000b851b          	sext.w	a0,s7
    80007bfc:	06813083          	ld	ra,104(sp)
    80007c00:	06013403          	ld	s0,96(sp)
    80007c04:	05813483          	ld	s1,88(sp)
    80007c08:	05013903          	ld	s2,80(sp)
    80007c0c:	04813983          	ld	s3,72(sp)
    80007c10:	04013a03          	ld	s4,64(sp)
    80007c14:	03813a83          	ld	s5,56(sp)
    80007c18:	02813b83          	ld	s7,40(sp)
    80007c1c:	02013c03          	ld	s8,32(sp)
    80007c20:	01813c83          	ld	s9,24(sp)
    80007c24:	40ab053b          	subw	a0,s6,a0
    80007c28:	03013b03          	ld	s6,48(sp)
    80007c2c:	07010113          	addi	sp,sp,112
    80007c30:	00008067          	ret
    80007c34:	00001097          	auipc	ra,0x1
    80007c38:	1d8080e7          	jalr	472(ra) # 80008e0c <push_on>
    80007c3c:	0984a703          	lw	a4,152(s1)
    80007c40:	09c4a783          	lw	a5,156(s1)
    80007c44:	0007879b          	sext.w	a5,a5
    80007c48:	fef70ce3          	beq	a4,a5,80007c40 <consoleread+0xfc>
    80007c4c:	00001097          	auipc	ra,0x1
    80007c50:	234080e7          	jalr	564(ra) # 80008e80 <pop_on>
    80007c54:	0984a783          	lw	a5,152(s1)
    80007c58:	07f7f713          	andi	a4,a5,127
    80007c5c:	00e48733          	add	a4,s1,a4
    80007c60:	01874703          	lbu	a4,24(a4)
    80007c64:	0017869b          	addiw	a3,a5,1
    80007c68:	08d4ac23          	sw	a3,152(s1)
    80007c6c:	00070c9b          	sext.w	s9,a4
    80007c70:	f5371ee3          	bne	a4,s3,80007bcc <consoleread+0x88>
    80007c74:	000b851b          	sext.w	a0,s7
    80007c78:	f96bf2e3          	bgeu	s7,s6,80007bfc <consoleread+0xb8>
    80007c7c:	08f4ac23          	sw	a5,152(s1)
    80007c80:	f7dff06f          	j	80007bfc <consoleread+0xb8>

0000000080007c84 <consputc>:
    80007c84:	10000793          	li	a5,256
    80007c88:	00f50663          	beq	a0,a5,80007c94 <consputc+0x10>
    80007c8c:	00001317          	auipc	t1,0x1
    80007c90:	9f430067          	jr	-1548(t1) # 80008680 <uartputc_sync>
    80007c94:	ff010113          	addi	sp,sp,-16
    80007c98:	00113423          	sd	ra,8(sp)
    80007c9c:	00813023          	sd	s0,0(sp)
    80007ca0:	01010413          	addi	s0,sp,16
    80007ca4:	00800513          	li	a0,8
    80007ca8:	00001097          	auipc	ra,0x1
    80007cac:	9d8080e7          	jalr	-1576(ra) # 80008680 <uartputc_sync>
    80007cb0:	02000513          	li	a0,32
    80007cb4:	00001097          	auipc	ra,0x1
    80007cb8:	9cc080e7          	jalr	-1588(ra) # 80008680 <uartputc_sync>
    80007cbc:	00013403          	ld	s0,0(sp)
    80007cc0:	00813083          	ld	ra,8(sp)
    80007cc4:	00800513          	li	a0,8
    80007cc8:	01010113          	addi	sp,sp,16
    80007ccc:	00001317          	auipc	t1,0x1
    80007cd0:	9b430067          	jr	-1612(t1) # 80008680 <uartputc_sync>

0000000080007cd4 <consoleintr>:
    80007cd4:	fe010113          	addi	sp,sp,-32
    80007cd8:	00813823          	sd	s0,16(sp)
    80007cdc:	00913423          	sd	s1,8(sp)
    80007ce0:	01213023          	sd	s2,0(sp)
    80007ce4:	00113c23          	sd	ra,24(sp)
    80007ce8:	02010413          	addi	s0,sp,32
    80007cec:	00006917          	auipc	s2,0x6
    80007cf0:	1ec90913          	addi	s2,s2,492 # 8000ded8 <cons>
    80007cf4:	00050493          	mv	s1,a0
    80007cf8:	00090513          	mv	a0,s2
    80007cfc:	00001097          	auipc	ra,0x1
    80007d00:	e40080e7          	jalr	-448(ra) # 80008b3c <acquire>
    80007d04:	02048c63          	beqz	s1,80007d3c <consoleintr+0x68>
    80007d08:	0a092783          	lw	a5,160(s2)
    80007d0c:	09892703          	lw	a4,152(s2)
    80007d10:	07f00693          	li	a3,127
    80007d14:	40e7873b          	subw	a4,a5,a4
    80007d18:	02e6e263          	bltu	a3,a4,80007d3c <consoleintr+0x68>
    80007d1c:	00d00713          	li	a4,13
    80007d20:	04e48063          	beq	s1,a4,80007d60 <consoleintr+0x8c>
    80007d24:	07f7f713          	andi	a4,a5,127
    80007d28:	00e90733          	add	a4,s2,a4
    80007d2c:	0017879b          	addiw	a5,a5,1
    80007d30:	0af92023          	sw	a5,160(s2)
    80007d34:	00970c23          	sb	s1,24(a4)
    80007d38:	08f92e23          	sw	a5,156(s2)
    80007d3c:	01013403          	ld	s0,16(sp)
    80007d40:	01813083          	ld	ra,24(sp)
    80007d44:	00813483          	ld	s1,8(sp)
    80007d48:	00013903          	ld	s2,0(sp)
    80007d4c:	00006517          	auipc	a0,0x6
    80007d50:	18c50513          	addi	a0,a0,396 # 8000ded8 <cons>
    80007d54:	02010113          	addi	sp,sp,32
    80007d58:	00001317          	auipc	t1,0x1
    80007d5c:	eb030067          	jr	-336(t1) # 80008c08 <release>
    80007d60:	00a00493          	li	s1,10
    80007d64:	fc1ff06f          	j	80007d24 <consoleintr+0x50>

0000000080007d68 <consoleinit>:
    80007d68:	fe010113          	addi	sp,sp,-32
    80007d6c:	00113c23          	sd	ra,24(sp)
    80007d70:	00813823          	sd	s0,16(sp)
    80007d74:	00913423          	sd	s1,8(sp)
    80007d78:	02010413          	addi	s0,sp,32
    80007d7c:	00006497          	auipc	s1,0x6
    80007d80:	15c48493          	addi	s1,s1,348 # 8000ded8 <cons>
    80007d84:	00048513          	mv	a0,s1
    80007d88:	00003597          	auipc	a1,0x3
    80007d8c:	a2858593          	addi	a1,a1,-1496 # 8000a7b0 <CONSOLE_STATUS+0x7a0>
    80007d90:	00001097          	auipc	ra,0x1
    80007d94:	d88080e7          	jalr	-632(ra) # 80008b18 <initlock>
    80007d98:	00000097          	auipc	ra,0x0
    80007d9c:	7ac080e7          	jalr	1964(ra) # 80008544 <uartinit>
    80007da0:	01813083          	ld	ra,24(sp)
    80007da4:	01013403          	ld	s0,16(sp)
    80007da8:	00000797          	auipc	a5,0x0
    80007dac:	d9c78793          	addi	a5,a5,-612 # 80007b44 <consoleread>
    80007db0:	0af4bc23          	sd	a5,184(s1)
    80007db4:	00000797          	auipc	a5,0x0
    80007db8:	cec78793          	addi	a5,a5,-788 # 80007aa0 <consolewrite>
    80007dbc:	0cf4b023          	sd	a5,192(s1)
    80007dc0:	00813483          	ld	s1,8(sp)
    80007dc4:	02010113          	addi	sp,sp,32
    80007dc8:	00008067          	ret

0000000080007dcc <console_read>:
    80007dcc:	ff010113          	addi	sp,sp,-16
    80007dd0:	00813423          	sd	s0,8(sp)
    80007dd4:	01010413          	addi	s0,sp,16
    80007dd8:	00813403          	ld	s0,8(sp)
    80007ddc:	00006317          	auipc	t1,0x6
    80007de0:	1b433303          	ld	t1,436(t1) # 8000df90 <devsw+0x10>
    80007de4:	01010113          	addi	sp,sp,16
    80007de8:	00030067          	jr	t1

0000000080007dec <console_write>:
    80007dec:	ff010113          	addi	sp,sp,-16
    80007df0:	00813423          	sd	s0,8(sp)
    80007df4:	01010413          	addi	s0,sp,16
    80007df8:	00813403          	ld	s0,8(sp)
    80007dfc:	00006317          	auipc	t1,0x6
    80007e00:	19c33303          	ld	t1,412(t1) # 8000df98 <devsw+0x18>
    80007e04:	01010113          	addi	sp,sp,16
    80007e08:	00030067          	jr	t1

0000000080007e0c <panic>:
    80007e0c:	fe010113          	addi	sp,sp,-32
    80007e10:	00113c23          	sd	ra,24(sp)
    80007e14:	00813823          	sd	s0,16(sp)
    80007e18:	00913423          	sd	s1,8(sp)
    80007e1c:	02010413          	addi	s0,sp,32
    80007e20:	00050493          	mv	s1,a0
    80007e24:	00003517          	auipc	a0,0x3
    80007e28:	99450513          	addi	a0,a0,-1644 # 8000a7b8 <CONSOLE_STATUS+0x7a8>
    80007e2c:	00006797          	auipc	a5,0x6
    80007e30:	2007a623          	sw	zero,524(a5) # 8000e038 <pr+0x18>
    80007e34:	00000097          	auipc	ra,0x0
    80007e38:	034080e7          	jalr	52(ra) # 80007e68 <__printf>
    80007e3c:	00048513          	mv	a0,s1
    80007e40:	00000097          	auipc	ra,0x0
    80007e44:	028080e7          	jalr	40(ra) # 80007e68 <__printf>
    80007e48:	00002517          	auipc	a0,0x2
    80007e4c:	6f850513          	addi	a0,a0,1784 # 8000a540 <CONSOLE_STATUS+0x530>
    80007e50:	00000097          	auipc	ra,0x0
    80007e54:	018080e7          	jalr	24(ra) # 80007e68 <__printf>
    80007e58:	00100793          	li	a5,1
    80007e5c:	00005717          	auipc	a4,0x5
    80007e60:	d8f72e23          	sw	a5,-612(a4) # 8000cbf8 <panicked>
    80007e64:	0000006f          	j	80007e64 <panic+0x58>

0000000080007e68 <__printf>:
    80007e68:	f3010113          	addi	sp,sp,-208
    80007e6c:	08813023          	sd	s0,128(sp)
    80007e70:	07313423          	sd	s3,104(sp)
    80007e74:	09010413          	addi	s0,sp,144
    80007e78:	05813023          	sd	s8,64(sp)
    80007e7c:	08113423          	sd	ra,136(sp)
    80007e80:	06913c23          	sd	s1,120(sp)
    80007e84:	07213823          	sd	s2,112(sp)
    80007e88:	07413023          	sd	s4,96(sp)
    80007e8c:	05513c23          	sd	s5,88(sp)
    80007e90:	05613823          	sd	s6,80(sp)
    80007e94:	05713423          	sd	s7,72(sp)
    80007e98:	03913c23          	sd	s9,56(sp)
    80007e9c:	03a13823          	sd	s10,48(sp)
    80007ea0:	03b13423          	sd	s11,40(sp)
    80007ea4:	00006317          	auipc	t1,0x6
    80007ea8:	17c30313          	addi	t1,t1,380 # 8000e020 <pr>
    80007eac:	01832c03          	lw	s8,24(t1)
    80007eb0:	00b43423          	sd	a1,8(s0)
    80007eb4:	00c43823          	sd	a2,16(s0)
    80007eb8:	00d43c23          	sd	a3,24(s0)
    80007ebc:	02e43023          	sd	a4,32(s0)
    80007ec0:	02f43423          	sd	a5,40(s0)
    80007ec4:	03043823          	sd	a6,48(s0)
    80007ec8:	03143c23          	sd	a7,56(s0)
    80007ecc:	00050993          	mv	s3,a0
    80007ed0:	4a0c1663          	bnez	s8,8000837c <__printf+0x514>
    80007ed4:	60098c63          	beqz	s3,800084ec <__printf+0x684>
    80007ed8:	0009c503          	lbu	a0,0(s3)
    80007edc:	00840793          	addi	a5,s0,8
    80007ee0:	f6f43c23          	sd	a5,-136(s0)
    80007ee4:	00000493          	li	s1,0
    80007ee8:	22050063          	beqz	a0,80008108 <__printf+0x2a0>
    80007eec:	00002a37          	lui	s4,0x2
    80007ef0:	00018ab7          	lui	s5,0x18
    80007ef4:	000f4b37          	lui	s6,0xf4
    80007ef8:	00989bb7          	lui	s7,0x989
    80007efc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007f00:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007f04:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007f08:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007f0c:	00148c9b          	addiw	s9,s1,1
    80007f10:	02500793          	li	a5,37
    80007f14:	01998933          	add	s2,s3,s9
    80007f18:	38f51263          	bne	a0,a5,8000829c <__printf+0x434>
    80007f1c:	00094783          	lbu	a5,0(s2)
    80007f20:	00078c9b          	sext.w	s9,a5
    80007f24:	1e078263          	beqz	a5,80008108 <__printf+0x2a0>
    80007f28:	0024849b          	addiw	s1,s1,2
    80007f2c:	07000713          	li	a4,112
    80007f30:	00998933          	add	s2,s3,s1
    80007f34:	38e78a63          	beq	a5,a4,800082c8 <__printf+0x460>
    80007f38:	20f76863          	bltu	a4,a5,80008148 <__printf+0x2e0>
    80007f3c:	42a78863          	beq	a5,a0,8000836c <__printf+0x504>
    80007f40:	06400713          	li	a4,100
    80007f44:	40e79663          	bne	a5,a4,80008350 <__printf+0x4e8>
    80007f48:	f7843783          	ld	a5,-136(s0)
    80007f4c:	0007a603          	lw	a2,0(a5)
    80007f50:	00878793          	addi	a5,a5,8
    80007f54:	f6f43c23          	sd	a5,-136(s0)
    80007f58:	42064a63          	bltz	a2,8000838c <__printf+0x524>
    80007f5c:	00a00713          	li	a4,10
    80007f60:	02e677bb          	remuw	a5,a2,a4
    80007f64:	00003d97          	auipc	s11,0x3
    80007f68:	87cd8d93          	addi	s11,s11,-1924 # 8000a7e0 <digits>
    80007f6c:	00900593          	li	a1,9
    80007f70:	0006051b          	sext.w	a0,a2
    80007f74:	00000c93          	li	s9,0
    80007f78:	02079793          	slli	a5,a5,0x20
    80007f7c:	0207d793          	srli	a5,a5,0x20
    80007f80:	00fd87b3          	add	a5,s11,a5
    80007f84:	0007c783          	lbu	a5,0(a5)
    80007f88:	02e656bb          	divuw	a3,a2,a4
    80007f8c:	f8f40023          	sb	a5,-128(s0)
    80007f90:	14c5d863          	bge	a1,a2,800080e0 <__printf+0x278>
    80007f94:	06300593          	li	a1,99
    80007f98:	00100c93          	li	s9,1
    80007f9c:	02e6f7bb          	remuw	a5,a3,a4
    80007fa0:	02079793          	slli	a5,a5,0x20
    80007fa4:	0207d793          	srli	a5,a5,0x20
    80007fa8:	00fd87b3          	add	a5,s11,a5
    80007fac:	0007c783          	lbu	a5,0(a5)
    80007fb0:	02e6d73b          	divuw	a4,a3,a4
    80007fb4:	f8f400a3          	sb	a5,-127(s0)
    80007fb8:	12a5f463          	bgeu	a1,a0,800080e0 <__printf+0x278>
    80007fbc:	00a00693          	li	a3,10
    80007fc0:	00900593          	li	a1,9
    80007fc4:	02d777bb          	remuw	a5,a4,a3
    80007fc8:	02079793          	slli	a5,a5,0x20
    80007fcc:	0207d793          	srli	a5,a5,0x20
    80007fd0:	00fd87b3          	add	a5,s11,a5
    80007fd4:	0007c503          	lbu	a0,0(a5)
    80007fd8:	02d757bb          	divuw	a5,a4,a3
    80007fdc:	f8a40123          	sb	a0,-126(s0)
    80007fe0:	48e5f263          	bgeu	a1,a4,80008464 <__printf+0x5fc>
    80007fe4:	06300513          	li	a0,99
    80007fe8:	02d7f5bb          	remuw	a1,a5,a3
    80007fec:	02059593          	slli	a1,a1,0x20
    80007ff0:	0205d593          	srli	a1,a1,0x20
    80007ff4:	00bd85b3          	add	a1,s11,a1
    80007ff8:	0005c583          	lbu	a1,0(a1)
    80007ffc:	02d7d7bb          	divuw	a5,a5,a3
    80008000:	f8b401a3          	sb	a1,-125(s0)
    80008004:	48e57263          	bgeu	a0,a4,80008488 <__printf+0x620>
    80008008:	3e700513          	li	a0,999
    8000800c:	02d7f5bb          	remuw	a1,a5,a3
    80008010:	02059593          	slli	a1,a1,0x20
    80008014:	0205d593          	srli	a1,a1,0x20
    80008018:	00bd85b3          	add	a1,s11,a1
    8000801c:	0005c583          	lbu	a1,0(a1)
    80008020:	02d7d7bb          	divuw	a5,a5,a3
    80008024:	f8b40223          	sb	a1,-124(s0)
    80008028:	46e57663          	bgeu	a0,a4,80008494 <__printf+0x62c>
    8000802c:	02d7f5bb          	remuw	a1,a5,a3
    80008030:	02059593          	slli	a1,a1,0x20
    80008034:	0205d593          	srli	a1,a1,0x20
    80008038:	00bd85b3          	add	a1,s11,a1
    8000803c:	0005c583          	lbu	a1,0(a1)
    80008040:	02d7d7bb          	divuw	a5,a5,a3
    80008044:	f8b402a3          	sb	a1,-123(s0)
    80008048:	46ea7863          	bgeu	s4,a4,800084b8 <__printf+0x650>
    8000804c:	02d7f5bb          	remuw	a1,a5,a3
    80008050:	02059593          	slli	a1,a1,0x20
    80008054:	0205d593          	srli	a1,a1,0x20
    80008058:	00bd85b3          	add	a1,s11,a1
    8000805c:	0005c583          	lbu	a1,0(a1)
    80008060:	02d7d7bb          	divuw	a5,a5,a3
    80008064:	f8b40323          	sb	a1,-122(s0)
    80008068:	3eeaf863          	bgeu	s5,a4,80008458 <__printf+0x5f0>
    8000806c:	02d7f5bb          	remuw	a1,a5,a3
    80008070:	02059593          	slli	a1,a1,0x20
    80008074:	0205d593          	srli	a1,a1,0x20
    80008078:	00bd85b3          	add	a1,s11,a1
    8000807c:	0005c583          	lbu	a1,0(a1)
    80008080:	02d7d7bb          	divuw	a5,a5,a3
    80008084:	f8b403a3          	sb	a1,-121(s0)
    80008088:	42eb7e63          	bgeu	s6,a4,800084c4 <__printf+0x65c>
    8000808c:	02d7f5bb          	remuw	a1,a5,a3
    80008090:	02059593          	slli	a1,a1,0x20
    80008094:	0205d593          	srli	a1,a1,0x20
    80008098:	00bd85b3          	add	a1,s11,a1
    8000809c:	0005c583          	lbu	a1,0(a1)
    800080a0:	02d7d7bb          	divuw	a5,a5,a3
    800080a4:	f8b40423          	sb	a1,-120(s0)
    800080a8:	42ebfc63          	bgeu	s7,a4,800084e0 <__printf+0x678>
    800080ac:	02079793          	slli	a5,a5,0x20
    800080b0:	0207d793          	srli	a5,a5,0x20
    800080b4:	00fd8db3          	add	s11,s11,a5
    800080b8:	000dc703          	lbu	a4,0(s11)
    800080bc:	00a00793          	li	a5,10
    800080c0:	00900c93          	li	s9,9
    800080c4:	f8e404a3          	sb	a4,-119(s0)
    800080c8:	00065c63          	bgez	a2,800080e0 <__printf+0x278>
    800080cc:	f9040713          	addi	a4,s0,-112
    800080d0:	00f70733          	add	a4,a4,a5
    800080d4:	02d00693          	li	a3,45
    800080d8:	fed70823          	sb	a3,-16(a4)
    800080dc:	00078c93          	mv	s9,a5
    800080e0:	f8040793          	addi	a5,s0,-128
    800080e4:	01978cb3          	add	s9,a5,s9
    800080e8:	f7f40d13          	addi	s10,s0,-129
    800080ec:	000cc503          	lbu	a0,0(s9)
    800080f0:	fffc8c93          	addi	s9,s9,-1
    800080f4:	00000097          	auipc	ra,0x0
    800080f8:	b90080e7          	jalr	-1136(ra) # 80007c84 <consputc>
    800080fc:	ffac98e3          	bne	s9,s10,800080ec <__printf+0x284>
    80008100:	00094503          	lbu	a0,0(s2)
    80008104:	e00514e3          	bnez	a0,80007f0c <__printf+0xa4>
    80008108:	1a0c1663          	bnez	s8,800082b4 <__printf+0x44c>
    8000810c:	08813083          	ld	ra,136(sp)
    80008110:	08013403          	ld	s0,128(sp)
    80008114:	07813483          	ld	s1,120(sp)
    80008118:	07013903          	ld	s2,112(sp)
    8000811c:	06813983          	ld	s3,104(sp)
    80008120:	06013a03          	ld	s4,96(sp)
    80008124:	05813a83          	ld	s5,88(sp)
    80008128:	05013b03          	ld	s6,80(sp)
    8000812c:	04813b83          	ld	s7,72(sp)
    80008130:	04013c03          	ld	s8,64(sp)
    80008134:	03813c83          	ld	s9,56(sp)
    80008138:	03013d03          	ld	s10,48(sp)
    8000813c:	02813d83          	ld	s11,40(sp)
    80008140:	0d010113          	addi	sp,sp,208
    80008144:	00008067          	ret
    80008148:	07300713          	li	a4,115
    8000814c:	1ce78a63          	beq	a5,a4,80008320 <__printf+0x4b8>
    80008150:	07800713          	li	a4,120
    80008154:	1ee79e63          	bne	a5,a4,80008350 <__printf+0x4e8>
    80008158:	f7843783          	ld	a5,-136(s0)
    8000815c:	0007a703          	lw	a4,0(a5)
    80008160:	00878793          	addi	a5,a5,8
    80008164:	f6f43c23          	sd	a5,-136(s0)
    80008168:	28074263          	bltz	a4,800083ec <__printf+0x584>
    8000816c:	00002d97          	auipc	s11,0x2
    80008170:	674d8d93          	addi	s11,s11,1652 # 8000a7e0 <digits>
    80008174:	00f77793          	andi	a5,a4,15
    80008178:	00fd87b3          	add	a5,s11,a5
    8000817c:	0007c683          	lbu	a3,0(a5)
    80008180:	00f00613          	li	a2,15
    80008184:	0007079b          	sext.w	a5,a4
    80008188:	f8d40023          	sb	a3,-128(s0)
    8000818c:	0047559b          	srliw	a1,a4,0x4
    80008190:	0047569b          	srliw	a3,a4,0x4
    80008194:	00000c93          	li	s9,0
    80008198:	0ee65063          	bge	a2,a4,80008278 <__printf+0x410>
    8000819c:	00f6f693          	andi	a3,a3,15
    800081a0:	00dd86b3          	add	a3,s11,a3
    800081a4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800081a8:	0087d79b          	srliw	a5,a5,0x8
    800081ac:	00100c93          	li	s9,1
    800081b0:	f8d400a3          	sb	a3,-127(s0)
    800081b4:	0cb67263          	bgeu	a2,a1,80008278 <__printf+0x410>
    800081b8:	00f7f693          	andi	a3,a5,15
    800081bc:	00dd86b3          	add	a3,s11,a3
    800081c0:	0006c583          	lbu	a1,0(a3)
    800081c4:	00f00613          	li	a2,15
    800081c8:	0047d69b          	srliw	a3,a5,0x4
    800081cc:	f8b40123          	sb	a1,-126(s0)
    800081d0:	0047d593          	srli	a1,a5,0x4
    800081d4:	28f67e63          	bgeu	a2,a5,80008470 <__printf+0x608>
    800081d8:	00f6f693          	andi	a3,a3,15
    800081dc:	00dd86b3          	add	a3,s11,a3
    800081e0:	0006c503          	lbu	a0,0(a3)
    800081e4:	0087d813          	srli	a6,a5,0x8
    800081e8:	0087d69b          	srliw	a3,a5,0x8
    800081ec:	f8a401a3          	sb	a0,-125(s0)
    800081f0:	28b67663          	bgeu	a2,a1,8000847c <__printf+0x614>
    800081f4:	00f6f693          	andi	a3,a3,15
    800081f8:	00dd86b3          	add	a3,s11,a3
    800081fc:	0006c583          	lbu	a1,0(a3)
    80008200:	00c7d513          	srli	a0,a5,0xc
    80008204:	00c7d69b          	srliw	a3,a5,0xc
    80008208:	f8b40223          	sb	a1,-124(s0)
    8000820c:	29067a63          	bgeu	a2,a6,800084a0 <__printf+0x638>
    80008210:	00f6f693          	andi	a3,a3,15
    80008214:	00dd86b3          	add	a3,s11,a3
    80008218:	0006c583          	lbu	a1,0(a3)
    8000821c:	0107d813          	srli	a6,a5,0x10
    80008220:	0107d69b          	srliw	a3,a5,0x10
    80008224:	f8b402a3          	sb	a1,-123(s0)
    80008228:	28a67263          	bgeu	a2,a0,800084ac <__printf+0x644>
    8000822c:	00f6f693          	andi	a3,a3,15
    80008230:	00dd86b3          	add	a3,s11,a3
    80008234:	0006c683          	lbu	a3,0(a3)
    80008238:	0147d79b          	srliw	a5,a5,0x14
    8000823c:	f8d40323          	sb	a3,-122(s0)
    80008240:	21067663          	bgeu	a2,a6,8000844c <__printf+0x5e4>
    80008244:	02079793          	slli	a5,a5,0x20
    80008248:	0207d793          	srli	a5,a5,0x20
    8000824c:	00fd8db3          	add	s11,s11,a5
    80008250:	000dc683          	lbu	a3,0(s11)
    80008254:	00800793          	li	a5,8
    80008258:	00700c93          	li	s9,7
    8000825c:	f8d403a3          	sb	a3,-121(s0)
    80008260:	00075c63          	bgez	a4,80008278 <__printf+0x410>
    80008264:	f9040713          	addi	a4,s0,-112
    80008268:	00f70733          	add	a4,a4,a5
    8000826c:	02d00693          	li	a3,45
    80008270:	fed70823          	sb	a3,-16(a4)
    80008274:	00078c93          	mv	s9,a5
    80008278:	f8040793          	addi	a5,s0,-128
    8000827c:	01978cb3          	add	s9,a5,s9
    80008280:	f7f40d13          	addi	s10,s0,-129
    80008284:	000cc503          	lbu	a0,0(s9)
    80008288:	fffc8c93          	addi	s9,s9,-1
    8000828c:	00000097          	auipc	ra,0x0
    80008290:	9f8080e7          	jalr	-1544(ra) # 80007c84 <consputc>
    80008294:	ff9d18e3          	bne	s10,s9,80008284 <__printf+0x41c>
    80008298:	0100006f          	j	800082a8 <__printf+0x440>
    8000829c:	00000097          	auipc	ra,0x0
    800082a0:	9e8080e7          	jalr	-1560(ra) # 80007c84 <consputc>
    800082a4:	000c8493          	mv	s1,s9
    800082a8:	00094503          	lbu	a0,0(s2)
    800082ac:	c60510e3          	bnez	a0,80007f0c <__printf+0xa4>
    800082b0:	e40c0ee3          	beqz	s8,8000810c <__printf+0x2a4>
    800082b4:	00006517          	auipc	a0,0x6
    800082b8:	d6c50513          	addi	a0,a0,-660 # 8000e020 <pr>
    800082bc:	00001097          	auipc	ra,0x1
    800082c0:	94c080e7          	jalr	-1716(ra) # 80008c08 <release>
    800082c4:	e49ff06f          	j	8000810c <__printf+0x2a4>
    800082c8:	f7843783          	ld	a5,-136(s0)
    800082cc:	03000513          	li	a0,48
    800082d0:	01000d13          	li	s10,16
    800082d4:	00878713          	addi	a4,a5,8
    800082d8:	0007bc83          	ld	s9,0(a5)
    800082dc:	f6e43c23          	sd	a4,-136(s0)
    800082e0:	00000097          	auipc	ra,0x0
    800082e4:	9a4080e7          	jalr	-1628(ra) # 80007c84 <consputc>
    800082e8:	07800513          	li	a0,120
    800082ec:	00000097          	auipc	ra,0x0
    800082f0:	998080e7          	jalr	-1640(ra) # 80007c84 <consputc>
    800082f4:	00002d97          	auipc	s11,0x2
    800082f8:	4ecd8d93          	addi	s11,s11,1260 # 8000a7e0 <digits>
    800082fc:	03ccd793          	srli	a5,s9,0x3c
    80008300:	00fd87b3          	add	a5,s11,a5
    80008304:	0007c503          	lbu	a0,0(a5)
    80008308:	fffd0d1b          	addiw	s10,s10,-1
    8000830c:	004c9c93          	slli	s9,s9,0x4
    80008310:	00000097          	auipc	ra,0x0
    80008314:	974080e7          	jalr	-1676(ra) # 80007c84 <consputc>
    80008318:	fe0d12e3          	bnez	s10,800082fc <__printf+0x494>
    8000831c:	f8dff06f          	j	800082a8 <__printf+0x440>
    80008320:	f7843783          	ld	a5,-136(s0)
    80008324:	0007bc83          	ld	s9,0(a5)
    80008328:	00878793          	addi	a5,a5,8
    8000832c:	f6f43c23          	sd	a5,-136(s0)
    80008330:	000c9a63          	bnez	s9,80008344 <__printf+0x4dc>
    80008334:	1080006f          	j	8000843c <__printf+0x5d4>
    80008338:	001c8c93          	addi	s9,s9,1
    8000833c:	00000097          	auipc	ra,0x0
    80008340:	948080e7          	jalr	-1720(ra) # 80007c84 <consputc>
    80008344:	000cc503          	lbu	a0,0(s9)
    80008348:	fe0518e3          	bnez	a0,80008338 <__printf+0x4d0>
    8000834c:	f5dff06f          	j	800082a8 <__printf+0x440>
    80008350:	02500513          	li	a0,37
    80008354:	00000097          	auipc	ra,0x0
    80008358:	930080e7          	jalr	-1744(ra) # 80007c84 <consputc>
    8000835c:	000c8513          	mv	a0,s9
    80008360:	00000097          	auipc	ra,0x0
    80008364:	924080e7          	jalr	-1756(ra) # 80007c84 <consputc>
    80008368:	f41ff06f          	j	800082a8 <__printf+0x440>
    8000836c:	02500513          	li	a0,37
    80008370:	00000097          	auipc	ra,0x0
    80008374:	914080e7          	jalr	-1772(ra) # 80007c84 <consputc>
    80008378:	f31ff06f          	j	800082a8 <__printf+0x440>
    8000837c:	00030513          	mv	a0,t1
    80008380:	00000097          	auipc	ra,0x0
    80008384:	7bc080e7          	jalr	1980(ra) # 80008b3c <acquire>
    80008388:	b4dff06f          	j	80007ed4 <__printf+0x6c>
    8000838c:	40c0053b          	negw	a0,a2
    80008390:	00a00713          	li	a4,10
    80008394:	02e576bb          	remuw	a3,a0,a4
    80008398:	00002d97          	auipc	s11,0x2
    8000839c:	448d8d93          	addi	s11,s11,1096 # 8000a7e0 <digits>
    800083a0:	ff700593          	li	a1,-9
    800083a4:	02069693          	slli	a3,a3,0x20
    800083a8:	0206d693          	srli	a3,a3,0x20
    800083ac:	00dd86b3          	add	a3,s11,a3
    800083b0:	0006c683          	lbu	a3,0(a3)
    800083b4:	02e557bb          	divuw	a5,a0,a4
    800083b8:	f8d40023          	sb	a3,-128(s0)
    800083bc:	10b65e63          	bge	a2,a1,800084d8 <__printf+0x670>
    800083c0:	06300593          	li	a1,99
    800083c4:	02e7f6bb          	remuw	a3,a5,a4
    800083c8:	02069693          	slli	a3,a3,0x20
    800083cc:	0206d693          	srli	a3,a3,0x20
    800083d0:	00dd86b3          	add	a3,s11,a3
    800083d4:	0006c683          	lbu	a3,0(a3)
    800083d8:	02e7d73b          	divuw	a4,a5,a4
    800083dc:	00200793          	li	a5,2
    800083e0:	f8d400a3          	sb	a3,-127(s0)
    800083e4:	bca5ece3          	bltu	a1,a0,80007fbc <__printf+0x154>
    800083e8:	ce5ff06f          	j	800080cc <__printf+0x264>
    800083ec:	40e007bb          	negw	a5,a4
    800083f0:	00002d97          	auipc	s11,0x2
    800083f4:	3f0d8d93          	addi	s11,s11,1008 # 8000a7e0 <digits>
    800083f8:	00f7f693          	andi	a3,a5,15
    800083fc:	00dd86b3          	add	a3,s11,a3
    80008400:	0006c583          	lbu	a1,0(a3)
    80008404:	ff100613          	li	a2,-15
    80008408:	0047d69b          	srliw	a3,a5,0x4
    8000840c:	f8b40023          	sb	a1,-128(s0)
    80008410:	0047d59b          	srliw	a1,a5,0x4
    80008414:	0ac75e63          	bge	a4,a2,800084d0 <__printf+0x668>
    80008418:	00f6f693          	andi	a3,a3,15
    8000841c:	00dd86b3          	add	a3,s11,a3
    80008420:	0006c603          	lbu	a2,0(a3)
    80008424:	00f00693          	li	a3,15
    80008428:	0087d79b          	srliw	a5,a5,0x8
    8000842c:	f8c400a3          	sb	a2,-127(s0)
    80008430:	d8b6e4e3          	bltu	a3,a1,800081b8 <__printf+0x350>
    80008434:	00200793          	li	a5,2
    80008438:	e2dff06f          	j	80008264 <__printf+0x3fc>
    8000843c:	00002c97          	auipc	s9,0x2
    80008440:	384c8c93          	addi	s9,s9,900 # 8000a7c0 <CONSOLE_STATUS+0x7b0>
    80008444:	02800513          	li	a0,40
    80008448:	ef1ff06f          	j	80008338 <__printf+0x4d0>
    8000844c:	00700793          	li	a5,7
    80008450:	00600c93          	li	s9,6
    80008454:	e0dff06f          	j	80008260 <__printf+0x3f8>
    80008458:	00700793          	li	a5,7
    8000845c:	00600c93          	li	s9,6
    80008460:	c69ff06f          	j	800080c8 <__printf+0x260>
    80008464:	00300793          	li	a5,3
    80008468:	00200c93          	li	s9,2
    8000846c:	c5dff06f          	j	800080c8 <__printf+0x260>
    80008470:	00300793          	li	a5,3
    80008474:	00200c93          	li	s9,2
    80008478:	de9ff06f          	j	80008260 <__printf+0x3f8>
    8000847c:	00400793          	li	a5,4
    80008480:	00300c93          	li	s9,3
    80008484:	dddff06f          	j	80008260 <__printf+0x3f8>
    80008488:	00400793          	li	a5,4
    8000848c:	00300c93          	li	s9,3
    80008490:	c39ff06f          	j	800080c8 <__printf+0x260>
    80008494:	00500793          	li	a5,5
    80008498:	00400c93          	li	s9,4
    8000849c:	c2dff06f          	j	800080c8 <__printf+0x260>
    800084a0:	00500793          	li	a5,5
    800084a4:	00400c93          	li	s9,4
    800084a8:	db9ff06f          	j	80008260 <__printf+0x3f8>
    800084ac:	00600793          	li	a5,6
    800084b0:	00500c93          	li	s9,5
    800084b4:	dadff06f          	j	80008260 <__printf+0x3f8>
    800084b8:	00600793          	li	a5,6
    800084bc:	00500c93          	li	s9,5
    800084c0:	c09ff06f          	j	800080c8 <__printf+0x260>
    800084c4:	00800793          	li	a5,8
    800084c8:	00700c93          	li	s9,7
    800084cc:	bfdff06f          	j	800080c8 <__printf+0x260>
    800084d0:	00100793          	li	a5,1
    800084d4:	d91ff06f          	j	80008264 <__printf+0x3fc>
    800084d8:	00100793          	li	a5,1
    800084dc:	bf1ff06f          	j	800080cc <__printf+0x264>
    800084e0:	00900793          	li	a5,9
    800084e4:	00800c93          	li	s9,8
    800084e8:	be1ff06f          	j	800080c8 <__printf+0x260>
    800084ec:	00002517          	auipc	a0,0x2
    800084f0:	2dc50513          	addi	a0,a0,732 # 8000a7c8 <CONSOLE_STATUS+0x7b8>
    800084f4:	00000097          	auipc	ra,0x0
    800084f8:	918080e7          	jalr	-1768(ra) # 80007e0c <panic>

00000000800084fc <printfinit>:
    800084fc:	fe010113          	addi	sp,sp,-32
    80008500:	00813823          	sd	s0,16(sp)
    80008504:	00913423          	sd	s1,8(sp)
    80008508:	00113c23          	sd	ra,24(sp)
    8000850c:	02010413          	addi	s0,sp,32
    80008510:	00006497          	auipc	s1,0x6
    80008514:	b1048493          	addi	s1,s1,-1264 # 8000e020 <pr>
    80008518:	00048513          	mv	a0,s1
    8000851c:	00002597          	auipc	a1,0x2
    80008520:	2bc58593          	addi	a1,a1,700 # 8000a7d8 <CONSOLE_STATUS+0x7c8>
    80008524:	00000097          	auipc	ra,0x0
    80008528:	5f4080e7          	jalr	1524(ra) # 80008b18 <initlock>
    8000852c:	01813083          	ld	ra,24(sp)
    80008530:	01013403          	ld	s0,16(sp)
    80008534:	0004ac23          	sw	zero,24(s1)
    80008538:	00813483          	ld	s1,8(sp)
    8000853c:	02010113          	addi	sp,sp,32
    80008540:	00008067          	ret

0000000080008544 <uartinit>:
    80008544:	ff010113          	addi	sp,sp,-16
    80008548:	00813423          	sd	s0,8(sp)
    8000854c:	01010413          	addi	s0,sp,16
    80008550:	100007b7          	lui	a5,0x10000
    80008554:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008558:	f8000713          	li	a4,-128
    8000855c:	00e781a3          	sb	a4,3(a5)
    80008560:	00300713          	li	a4,3
    80008564:	00e78023          	sb	a4,0(a5)
    80008568:	000780a3          	sb	zero,1(a5)
    8000856c:	00e781a3          	sb	a4,3(a5)
    80008570:	00700693          	li	a3,7
    80008574:	00d78123          	sb	a3,2(a5)
    80008578:	00e780a3          	sb	a4,1(a5)
    8000857c:	00813403          	ld	s0,8(sp)
    80008580:	01010113          	addi	sp,sp,16
    80008584:	00008067          	ret

0000000080008588 <uartputc>:
    80008588:	00004797          	auipc	a5,0x4
    8000858c:	6707a783          	lw	a5,1648(a5) # 8000cbf8 <panicked>
    80008590:	00078463          	beqz	a5,80008598 <uartputc+0x10>
    80008594:	0000006f          	j	80008594 <uartputc+0xc>
    80008598:	fd010113          	addi	sp,sp,-48
    8000859c:	02813023          	sd	s0,32(sp)
    800085a0:	00913c23          	sd	s1,24(sp)
    800085a4:	01213823          	sd	s2,16(sp)
    800085a8:	01313423          	sd	s3,8(sp)
    800085ac:	02113423          	sd	ra,40(sp)
    800085b0:	03010413          	addi	s0,sp,48
    800085b4:	00004917          	auipc	s2,0x4
    800085b8:	64c90913          	addi	s2,s2,1612 # 8000cc00 <uart_tx_r>
    800085bc:	00093783          	ld	a5,0(s2)
    800085c0:	00004497          	auipc	s1,0x4
    800085c4:	64848493          	addi	s1,s1,1608 # 8000cc08 <uart_tx_w>
    800085c8:	0004b703          	ld	a4,0(s1)
    800085cc:	02078693          	addi	a3,a5,32
    800085d0:	00050993          	mv	s3,a0
    800085d4:	02e69c63          	bne	a3,a4,8000860c <uartputc+0x84>
    800085d8:	00001097          	auipc	ra,0x1
    800085dc:	834080e7          	jalr	-1996(ra) # 80008e0c <push_on>
    800085e0:	00093783          	ld	a5,0(s2)
    800085e4:	0004b703          	ld	a4,0(s1)
    800085e8:	02078793          	addi	a5,a5,32
    800085ec:	00e79463          	bne	a5,a4,800085f4 <uartputc+0x6c>
    800085f0:	0000006f          	j	800085f0 <uartputc+0x68>
    800085f4:	00001097          	auipc	ra,0x1
    800085f8:	88c080e7          	jalr	-1908(ra) # 80008e80 <pop_on>
    800085fc:	00093783          	ld	a5,0(s2)
    80008600:	0004b703          	ld	a4,0(s1)
    80008604:	02078693          	addi	a3,a5,32
    80008608:	fce688e3          	beq	a3,a4,800085d8 <uartputc+0x50>
    8000860c:	01f77693          	andi	a3,a4,31
    80008610:	00006597          	auipc	a1,0x6
    80008614:	a3058593          	addi	a1,a1,-1488 # 8000e040 <uart_tx_buf>
    80008618:	00d586b3          	add	a3,a1,a3
    8000861c:	00170713          	addi	a4,a4,1
    80008620:	01368023          	sb	s3,0(a3)
    80008624:	00e4b023          	sd	a4,0(s1)
    80008628:	10000637          	lui	a2,0x10000
    8000862c:	02f71063          	bne	a4,a5,8000864c <uartputc+0xc4>
    80008630:	0340006f          	j	80008664 <uartputc+0xdc>
    80008634:	00074703          	lbu	a4,0(a4)
    80008638:	00f93023          	sd	a5,0(s2)
    8000863c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008640:	00093783          	ld	a5,0(s2)
    80008644:	0004b703          	ld	a4,0(s1)
    80008648:	00f70e63          	beq	a4,a5,80008664 <uartputc+0xdc>
    8000864c:	00564683          	lbu	a3,5(a2)
    80008650:	01f7f713          	andi	a4,a5,31
    80008654:	00e58733          	add	a4,a1,a4
    80008658:	0206f693          	andi	a3,a3,32
    8000865c:	00178793          	addi	a5,a5,1
    80008660:	fc069ae3          	bnez	a3,80008634 <uartputc+0xac>
    80008664:	02813083          	ld	ra,40(sp)
    80008668:	02013403          	ld	s0,32(sp)
    8000866c:	01813483          	ld	s1,24(sp)
    80008670:	01013903          	ld	s2,16(sp)
    80008674:	00813983          	ld	s3,8(sp)
    80008678:	03010113          	addi	sp,sp,48
    8000867c:	00008067          	ret

0000000080008680 <uartputc_sync>:
    80008680:	ff010113          	addi	sp,sp,-16
    80008684:	00813423          	sd	s0,8(sp)
    80008688:	01010413          	addi	s0,sp,16
    8000868c:	00004717          	auipc	a4,0x4
    80008690:	56c72703          	lw	a4,1388(a4) # 8000cbf8 <panicked>
    80008694:	02071663          	bnez	a4,800086c0 <uartputc_sync+0x40>
    80008698:	00050793          	mv	a5,a0
    8000869c:	100006b7          	lui	a3,0x10000
    800086a0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800086a4:	02077713          	andi	a4,a4,32
    800086a8:	fe070ce3          	beqz	a4,800086a0 <uartputc_sync+0x20>
    800086ac:	0ff7f793          	andi	a5,a5,255
    800086b0:	00f68023          	sb	a5,0(a3)
    800086b4:	00813403          	ld	s0,8(sp)
    800086b8:	01010113          	addi	sp,sp,16
    800086bc:	00008067          	ret
    800086c0:	0000006f          	j	800086c0 <uartputc_sync+0x40>

00000000800086c4 <uartstart>:
    800086c4:	ff010113          	addi	sp,sp,-16
    800086c8:	00813423          	sd	s0,8(sp)
    800086cc:	01010413          	addi	s0,sp,16
    800086d0:	00004617          	auipc	a2,0x4
    800086d4:	53060613          	addi	a2,a2,1328 # 8000cc00 <uart_tx_r>
    800086d8:	00004517          	auipc	a0,0x4
    800086dc:	53050513          	addi	a0,a0,1328 # 8000cc08 <uart_tx_w>
    800086e0:	00063783          	ld	a5,0(a2)
    800086e4:	00053703          	ld	a4,0(a0)
    800086e8:	04f70263          	beq	a4,a5,8000872c <uartstart+0x68>
    800086ec:	100005b7          	lui	a1,0x10000
    800086f0:	00006817          	auipc	a6,0x6
    800086f4:	95080813          	addi	a6,a6,-1712 # 8000e040 <uart_tx_buf>
    800086f8:	01c0006f          	j	80008714 <uartstart+0x50>
    800086fc:	0006c703          	lbu	a4,0(a3)
    80008700:	00f63023          	sd	a5,0(a2)
    80008704:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008708:	00063783          	ld	a5,0(a2)
    8000870c:	00053703          	ld	a4,0(a0)
    80008710:	00f70e63          	beq	a4,a5,8000872c <uartstart+0x68>
    80008714:	01f7f713          	andi	a4,a5,31
    80008718:	00e806b3          	add	a3,a6,a4
    8000871c:	0055c703          	lbu	a4,5(a1)
    80008720:	00178793          	addi	a5,a5,1
    80008724:	02077713          	andi	a4,a4,32
    80008728:	fc071ae3          	bnez	a4,800086fc <uartstart+0x38>
    8000872c:	00813403          	ld	s0,8(sp)
    80008730:	01010113          	addi	sp,sp,16
    80008734:	00008067          	ret

0000000080008738 <uartgetc>:
    80008738:	ff010113          	addi	sp,sp,-16
    8000873c:	00813423          	sd	s0,8(sp)
    80008740:	01010413          	addi	s0,sp,16
    80008744:	10000737          	lui	a4,0x10000
    80008748:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000874c:	0017f793          	andi	a5,a5,1
    80008750:	00078c63          	beqz	a5,80008768 <uartgetc+0x30>
    80008754:	00074503          	lbu	a0,0(a4)
    80008758:	0ff57513          	andi	a0,a0,255
    8000875c:	00813403          	ld	s0,8(sp)
    80008760:	01010113          	addi	sp,sp,16
    80008764:	00008067          	ret
    80008768:	fff00513          	li	a0,-1
    8000876c:	ff1ff06f          	j	8000875c <uartgetc+0x24>

0000000080008770 <uartintr>:
    80008770:	100007b7          	lui	a5,0x10000
    80008774:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008778:	0017f793          	andi	a5,a5,1
    8000877c:	0a078463          	beqz	a5,80008824 <uartintr+0xb4>
    80008780:	fe010113          	addi	sp,sp,-32
    80008784:	00813823          	sd	s0,16(sp)
    80008788:	00913423          	sd	s1,8(sp)
    8000878c:	00113c23          	sd	ra,24(sp)
    80008790:	02010413          	addi	s0,sp,32
    80008794:	100004b7          	lui	s1,0x10000
    80008798:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000879c:	0ff57513          	andi	a0,a0,255
    800087a0:	fffff097          	auipc	ra,0xfffff
    800087a4:	534080e7          	jalr	1332(ra) # 80007cd4 <consoleintr>
    800087a8:	0054c783          	lbu	a5,5(s1)
    800087ac:	0017f793          	andi	a5,a5,1
    800087b0:	fe0794e3          	bnez	a5,80008798 <uartintr+0x28>
    800087b4:	00004617          	auipc	a2,0x4
    800087b8:	44c60613          	addi	a2,a2,1100 # 8000cc00 <uart_tx_r>
    800087bc:	00004517          	auipc	a0,0x4
    800087c0:	44c50513          	addi	a0,a0,1100 # 8000cc08 <uart_tx_w>
    800087c4:	00063783          	ld	a5,0(a2)
    800087c8:	00053703          	ld	a4,0(a0)
    800087cc:	04f70263          	beq	a4,a5,80008810 <uartintr+0xa0>
    800087d0:	100005b7          	lui	a1,0x10000
    800087d4:	00006817          	auipc	a6,0x6
    800087d8:	86c80813          	addi	a6,a6,-1940 # 8000e040 <uart_tx_buf>
    800087dc:	01c0006f          	j	800087f8 <uartintr+0x88>
    800087e0:	0006c703          	lbu	a4,0(a3)
    800087e4:	00f63023          	sd	a5,0(a2)
    800087e8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800087ec:	00063783          	ld	a5,0(a2)
    800087f0:	00053703          	ld	a4,0(a0)
    800087f4:	00f70e63          	beq	a4,a5,80008810 <uartintr+0xa0>
    800087f8:	01f7f713          	andi	a4,a5,31
    800087fc:	00e806b3          	add	a3,a6,a4
    80008800:	0055c703          	lbu	a4,5(a1)
    80008804:	00178793          	addi	a5,a5,1
    80008808:	02077713          	andi	a4,a4,32
    8000880c:	fc071ae3          	bnez	a4,800087e0 <uartintr+0x70>
    80008810:	01813083          	ld	ra,24(sp)
    80008814:	01013403          	ld	s0,16(sp)
    80008818:	00813483          	ld	s1,8(sp)
    8000881c:	02010113          	addi	sp,sp,32
    80008820:	00008067          	ret
    80008824:	00004617          	auipc	a2,0x4
    80008828:	3dc60613          	addi	a2,a2,988 # 8000cc00 <uart_tx_r>
    8000882c:	00004517          	auipc	a0,0x4
    80008830:	3dc50513          	addi	a0,a0,988 # 8000cc08 <uart_tx_w>
    80008834:	00063783          	ld	a5,0(a2)
    80008838:	00053703          	ld	a4,0(a0)
    8000883c:	04f70263          	beq	a4,a5,80008880 <uartintr+0x110>
    80008840:	100005b7          	lui	a1,0x10000
    80008844:	00005817          	auipc	a6,0x5
    80008848:	7fc80813          	addi	a6,a6,2044 # 8000e040 <uart_tx_buf>
    8000884c:	01c0006f          	j	80008868 <uartintr+0xf8>
    80008850:	0006c703          	lbu	a4,0(a3)
    80008854:	00f63023          	sd	a5,0(a2)
    80008858:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000885c:	00063783          	ld	a5,0(a2)
    80008860:	00053703          	ld	a4,0(a0)
    80008864:	02f70063          	beq	a4,a5,80008884 <uartintr+0x114>
    80008868:	01f7f713          	andi	a4,a5,31
    8000886c:	00e806b3          	add	a3,a6,a4
    80008870:	0055c703          	lbu	a4,5(a1)
    80008874:	00178793          	addi	a5,a5,1
    80008878:	02077713          	andi	a4,a4,32
    8000887c:	fc071ae3          	bnez	a4,80008850 <uartintr+0xe0>
    80008880:	00008067          	ret
    80008884:	00008067          	ret

0000000080008888 <kinit>:
    80008888:	fc010113          	addi	sp,sp,-64
    8000888c:	02913423          	sd	s1,40(sp)
    80008890:	fffff7b7          	lui	a5,0xfffff
    80008894:	00006497          	auipc	s1,0x6
    80008898:	7cb48493          	addi	s1,s1,1995 # 8000f05f <end+0xfff>
    8000889c:	02813823          	sd	s0,48(sp)
    800088a0:	01313c23          	sd	s3,24(sp)
    800088a4:	00f4f4b3          	and	s1,s1,a5
    800088a8:	02113c23          	sd	ra,56(sp)
    800088ac:	03213023          	sd	s2,32(sp)
    800088b0:	01413823          	sd	s4,16(sp)
    800088b4:	01513423          	sd	s5,8(sp)
    800088b8:	04010413          	addi	s0,sp,64
    800088bc:	000017b7          	lui	a5,0x1
    800088c0:	01100993          	li	s3,17
    800088c4:	00f487b3          	add	a5,s1,a5
    800088c8:	01b99993          	slli	s3,s3,0x1b
    800088cc:	06f9e063          	bltu	s3,a5,8000892c <kinit+0xa4>
    800088d0:	00005a97          	auipc	s5,0x5
    800088d4:	790a8a93          	addi	s5,s5,1936 # 8000e060 <end>
    800088d8:	0754ec63          	bltu	s1,s5,80008950 <kinit+0xc8>
    800088dc:	0734fa63          	bgeu	s1,s3,80008950 <kinit+0xc8>
    800088e0:	00088a37          	lui	s4,0x88
    800088e4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800088e8:	00004917          	auipc	s2,0x4
    800088ec:	32890913          	addi	s2,s2,808 # 8000cc10 <kmem>
    800088f0:	00ca1a13          	slli	s4,s4,0xc
    800088f4:	0140006f          	j	80008908 <kinit+0x80>
    800088f8:	000017b7          	lui	a5,0x1
    800088fc:	00f484b3          	add	s1,s1,a5
    80008900:	0554e863          	bltu	s1,s5,80008950 <kinit+0xc8>
    80008904:	0534f663          	bgeu	s1,s3,80008950 <kinit+0xc8>
    80008908:	00001637          	lui	a2,0x1
    8000890c:	00100593          	li	a1,1
    80008910:	00048513          	mv	a0,s1
    80008914:	00000097          	auipc	ra,0x0
    80008918:	5e4080e7          	jalr	1508(ra) # 80008ef8 <__memset>
    8000891c:	00093783          	ld	a5,0(s2)
    80008920:	00f4b023          	sd	a5,0(s1)
    80008924:	00993023          	sd	s1,0(s2)
    80008928:	fd4498e3          	bne	s1,s4,800088f8 <kinit+0x70>
    8000892c:	03813083          	ld	ra,56(sp)
    80008930:	03013403          	ld	s0,48(sp)
    80008934:	02813483          	ld	s1,40(sp)
    80008938:	02013903          	ld	s2,32(sp)
    8000893c:	01813983          	ld	s3,24(sp)
    80008940:	01013a03          	ld	s4,16(sp)
    80008944:	00813a83          	ld	s5,8(sp)
    80008948:	04010113          	addi	sp,sp,64
    8000894c:	00008067          	ret
    80008950:	00002517          	auipc	a0,0x2
    80008954:	ea850513          	addi	a0,a0,-344 # 8000a7f8 <digits+0x18>
    80008958:	fffff097          	auipc	ra,0xfffff
    8000895c:	4b4080e7          	jalr	1204(ra) # 80007e0c <panic>

0000000080008960 <freerange>:
    80008960:	fc010113          	addi	sp,sp,-64
    80008964:	000017b7          	lui	a5,0x1
    80008968:	02913423          	sd	s1,40(sp)
    8000896c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008970:	009504b3          	add	s1,a0,s1
    80008974:	fffff537          	lui	a0,0xfffff
    80008978:	02813823          	sd	s0,48(sp)
    8000897c:	02113c23          	sd	ra,56(sp)
    80008980:	03213023          	sd	s2,32(sp)
    80008984:	01313c23          	sd	s3,24(sp)
    80008988:	01413823          	sd	s4,16(sp)
    8000898c:	01513423          	sd	s5,8(sp)
    80008990:	01613023          	sd	s6,0(sp)
    80008994:	04010413          	addi	s0,sp,64
    80008998:	00a4f4b3          	and	s1,s1,a0
    8000899c:	00f487b3          	add	a5,s1,a5
    800089a0:	06f5e463          	bltu	a1,a5,80008a08 <freerange+0xa8>
    800089a4:	00005a97          	auipc	s5,0x5
    800089a8:	6bca8a93          	addi	s5,s5,1724 # 8000e060 <end>
    800089ac:	0954e263          	bltu	s1,s5,80008a30 <freerange+0xd0>
    800089b0:	01100993          	li	s3,17
    800089b4:	01b99993          	slli	s3,s3,0x1b
    800089b8:	0734fc63          	bgeu	s1,s3,80008a30 <freerange+0xd0>
    800089bc:	00058a13          	mv	s4,a1
    800089c0:	00004917          	auipc	s2,0x4
    800089c4:	25090913          	addi	s2,s2,592 # 8000cc10 <kmem>
    800089c8:	00002b37          	lui	s6,0x2
    800089cc:	0140006f          	j	800089e0 <freerange+0x80>
    800089d0:	000017b7          	lui	a5,0x1
    800089d4:	00f484b3          	add	s1,s1,a5
    800089d8:	0554ec63          	bltu	s1,s5,80008a30 <freerange+0xd0>
    800089dc:	0534fa63          	bgeu	s1,s3,80008a30 <freerange+0xd0>
    800089e0:	00001637          	lui	a2,0x1
    800089e4:	00100593          	li	a1,1
    800089e8:	00048513          	mv	a0,s1
    800089ec:	00000097          	auipc	ra,0x0
    800089f0:	50c080e7          	jalr	1292(ra) # 80008ef8 <__memset>
    800089f4:	00093703          	ld	a4,0(s2)
    800089f8:	016487b3          	add	a5,s1,s6
    800089fc:	00e4b023          	sd	a4,0(s1)
    80008a00:	00993023          	sd	s1,0(s2)
    80008a04:	fcfa76e3          	bgeu	s4,a5,800089d0 <freerange+0x70>
    80008a08:	03813083          	ld	ra,56(sp)
    80008a0c:	03013403          	ld	s0,48(sp)
    80008a10:	02813483          	ld	s1,40(sp)
    80008a14:	02013903          	ld	s2,32(sp)
    80008a18:	01813983          	ld	s3,24(sp)
    80008a1c:	01013a03          	ld	s4,16(sp)
    80008a20:	00813a83          	ld	s5,8(sp)
    80008a24:	00013b03          	ld	s6,0(sp)
    80008a28:	04010113          	addi	sp,sp,64
    80008a2c:	00008067          	ret
    80008a30:	00002517          	auipc	a0,0x2
    80008a34:	dc850513          	addi	a0,a0,-568 # 8000a7f8 <digits+0x18>
    80008a38:	fffff097          	auipc	ra,0xfffff
    80008a3c:	3d4080e7          	jalr	980(ra) # 80007e0c <panic>

0000000080008a40 <kfree>:
    80008a40:	fe010113          	addi	sp,sp,-32
    80008a44:	00813823          	sd	s0,16(sp)
    80008a48:	00113c23          	sd	ra,24(sp)
    80008a4c:	00913423          	sd	s1,8(sp)
    80008a50:	02010413          	addi	s0,sp,32
    80008a54:	03451793          	slli	a5,a0,0x34
    80008a58:	04079c63          	bnez	a5,80008ab0 <kfree+0x70>
    80008a5c:	00005797          	auipc	a5,0x5
    80008a60:	60478793          	addi	a5,a5,1540 # 8000e060 <end>
    80008a64:	00050493          	mv	s1,a0
    80008a68:	04f56463          	bltu	a0,a5,80008ab0 <kfree+0x70>
    80008a6c:	01100793          	li	a5,17
    80008a70:	01b79793          	slli	a5,a5,0x1b
    80008a74:	02f57e63          	bgeu	a0,a5,80008ab0 <kfree+0x70>
    80008a78:	00001637          	lui	a2,0x1
    80008a7c:	00100593          	li	a1,1
    80008a80:	00000097          	auipc	ra,0x0
    80008a84:	478080e7          	jalr	1144(ra) # 80008ef8 <__memset>
    80008a88:	00004797          	auipc	a5,0x4
    80008a8c:	18878793          	addi	a5,a5,392 # 8000cc10 <kmem>
    80008a90:	0007b703          	ld	a4,0(a5)
    80008a94:	01813083          	ld	ra,24(sp)
    80008a98:	01013403          	ld	s0,16(sp)
    80008a9c:	00e4b023          	sd	a4,0(s1)
    80008aa0:	0097b023          	sd	s1,0(a5)
    80008aa4:	00813483          	ld	s1,8(sp)
    80008aa8:	02010113          	addi	sp,sp,32
    80008aac:	00008067          	ret
    80008ab0:	00002517          	auipc	a0,0x2
    80008ab4:	d4850513          	addi	a0,a0,-696 # 8000a7f8 <digits+0x18>
    80008ab8:	fffff097          	auipc	ra,0xfffff
    80008abc:	354080e7          	jalr	852(ra) # 80007e0c <panic>

0000000080008ac0 <kalloc>:
    80008ac0:	fe010113          	addi	sp,sp,-32
    80008ac4:	00813823          	sd	s0,16(sp)
    80008ac8:	00913423          	sd	s1,8(sp)
    80008acc:	00113c23          	sd	ra,24(sp)
    80008ad0:	02010413          	addi	s0,sp,32
    80008ad4:	00004797          	auipc	a5,0x4
    80008ad8:	13c78793          	addi	a5,a5,316 # 8000cc10 <kmem>
    80008adc:	0007b483          	ld	s1,0(a5)
    80008ae0:	02048063          	beqz	s1,80008b00 <kalloc+0x40>
    80008ae4:	0004b703          	ld	a4,0(s1)
    80008ae8:	00001637          	lui	a2,0x1
    80008aec:	00500593          	li	a1,5
    80008af0:	00048513          	mv	a0,s1
    80008af4:	00e7b023          	sd	a4,0(a5)
    80008af8:	00000097          	auipc	ra,0x0
    80008afc:	400080e7          	jalr	1024(ra) # 80008ef8 <__memset>
    80008b00:	01813083          	ld	ra,24(sp)
    80008b04:	01013403          	ld	s0,16(sp)
    80008b08:	00048513          	mv	a0,s1
    80008b0c:	00813483          	ld	s1,8(sp)
    80008b10:	02010113          	addi	sp,sp,32
    80008b14:	00008067          	ret

0000000080008b18 <initlock>:
    80008b18:	ff010113          	addi	sp,sp,-16
    80008b1c:	00813423          	sd	s0,8(sp)
    80008b20:	01010413          	addi	s0,sp,16
    80008b24:	00813403          	ld	s0,8(sp)
    80008b28:	00b53423          	sd	a1,8(a0)
    80008b2c:	00052023          	sw	zero,0(a0)
    80008b30:	00053823          	sd	zero,16(a0)
    80008b34:	01010113          	addi	sp,sp,16
    80008b38:	00008067          	ret

0000000080008b3c <acquire>:
    80008b3c:	fe010113          	addi	sp,sp,-32
    80008b40:	00813823          	sd	s0,16(sp)
    80008b44:	00913423          	sd	s1,8(sp)
    80008b48:	00113c23          	sd	ra,24(sp)
    80008b4c:	01213023          	sd	s2,0(sp)
    80008b50:	02010413          	addi	s0,sp,32
    80008b54:	00050493          	mv	s1,a0
    80008b58:	10002973          	csrr	s2,sstatus
    80008b5c:	100027f3          	csrr	a5,sstatus
    80008b60:	ffd7f793          	andi	a5,a5,-3
    80008b64:	10079073          	csrw	sstatus,a5
    80008b68:	fffff097          	auipc	ra,0xfffff
    80008b6c:	8e4080e7          	jalr	-1820(ra) # 8000744c <mycpu>
    80008b70:	07852783          	lw	a5,120(a0)
    80008b74:	06078e63          	beqz	a5,80008bf0 <acquire+0xb4>
    80008b78:	fffff097          	auipc	ra,0xfffff
    80008b7c:	8d4080e7          	jalr	-1836(ra) # 8000744c <mycpu>
    80008b80:	07852783          	lw	a5,120(a0)
    80008b84:	0004a703          	lw	a4,0(s1)
    80008b88:	0017879b          	addiw	a5,a5,1
    80008b8c:	06f52c23          	sw	a5,120(a0)
    80008b90:	04071063          	bnez	a4,80008bd0 <acquire+0x94>
    80008b94:	00100713          	li	a4,1
    80008b98:	00070793          	mv	a5,a4
    80008b9c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008ba0:	0007879b          	sext.w	a5,a5
    80008ba4:	fe079ae3          	bnez	a5,80008b98 <acquire+0x5c>
    80008ba8:	0ff0000f          	fence
    80008bac:	fffff097          	auipc	ra,0xfffff
    80008bb0:	8a0080e7          	jalr	-1888(ra) # 8000744c <mycpu>
    80008bb4:	01813083          	ld	ra,24(sp)
    80008bb8:	01013403          	ld	s0,16(sp)
    80008bbc:	00a4b823          	sd	a0,16(s1)
    80008bc0:	00013903          	ld	s2,0(sp)
    80008bc4:	00813483          	ld	s1,8(sp)
    80008bc8:	02010113          	addi	sp,sp,32
    80008bcc:	00008067          	ret
    80008bd0:	0104b903          	ld	s2,16(s1)
    80008bd4:	fffff097          	auipc	ra,0xfffff
    80008bd8:	878080e7          	jalr	-1928(ra) # 8000744c <mycpu>
    80008bdc:	faa91ce3          	bne	s2,a0,80008b94 <acquire+0x58>
    80008be0:	00002517          	auipc	a0,0x2
    80008be4:	c2050513          	addi	a0,a0,-992 # 8000a800 <digits+0x20>
    80008be8:	fffff097          	auipc	ra,0xfffff
    80008bec:	224080e7          	jalr	548(ra) # 80007e0c <panic>
    80008bf0:	00195913          	srli	s2,s2,0x1
    80008bf4:	fffff097          	auipc	ra,0xfffff
    80008bf8:	858080e7          	jalr	-1960(ra) # 8000744c <mycpu>
    80008bfc:	00197913          	andi	s2,s2,1
    80008c00:	07252e23          	sw	s2,124(a0)
    80008c04:	f75ff06f          	j	80008b78 <acquire+0x3c>

0000000080008c08 <release>:
    80008c08:	fe010113          	addi	sp,sp,-32
    80008c0c:	00813823          	sd	s0,16(sp)
    80008c10:	00113c23          	sd	ra,24(sp)
    80008c14:	00913423          	sd	s1,8(sp)
    80008c18:	01213023          	sd	s2,0(sp)
    80008c1c:	02010413          	addi	s0,sp,32
    80008c20:	00052783          	lw	a5,0(a0)
    80008c24:	00079a63          	bnez	a5,80008c38 <release+0x30>
    80008c28:	00002517          	auipc	a0,0x2
    80008c2c:	be050513          	addi	a0,a0,-1056 # 8000a808 <digits+0x28>
    80008c30:	fffff097          	auipc	ra,0xfffff
    80008c34:	1dc080e7          	jalr	476(ra) # 80007e0c <panic>
    80008c38:	01053903          	ld	s2,16(a0)
    80008c3c:	00050493          	mv	s1,a0
    80008c40:	fffff097          	auipc	ra,0xfffff
    80008c44:	80c080e7          	jalr	-2036(ra) # 8000744c <mycpu>
    80008c48:	fea910e3          	bne	s2,a0,80008c28 <release+0x20>
    80008c4c:	0004b823          	sd	zero,16(s1)
    80008c50:	0ff0000f          	fence
    80008c54:	0f50000f          	fence	iorw,ow
    80008c58:	0804a02f          	amoswap.w	zero,zero,(s1)
    80008c5c:	ffffe097          	auipc	ra,0xffffe
    80008c60:	7f0080e7          	jalr	2032(ra) # 8000744c <mycpu>
    80008c64:	100027f3          	csrr	a5,sstatus
    80008c68:	0027f793          	andi	a5,a5,2
    80008c6c:	04079a63          	bnez	a5,80008cc0 <release+0xb8>
    80008c70:	07852783          	lw	a5,120(a0)
    80008c74:	02f05e63          	blez	a5,80008cb0 <release+0xa8>
    80008c78:	fff7871b          	addiw	a4,a5,-1
    80008c7c:	06e52c23          	sw	a4,120(a0)
    80008c80:	00071c63          	bnez	a4,80008c98 <release+0x90>
    80008c84:	07c52783          	lw	a5,124(a0)
    80008c88:	00078863          	beqz	a5,80008c98 <release+0x90>
    80008c8c:	100027f3          	csrr	a5,sstatus
    80008c90:	0027e793          	ori	a5,a5,2
    80008c94:	10079073          	csrw	sstatus,a5
    80008c98:	01813083          	ld	ra,24(sp)
    80008c9c:	01013403          	ld	s0,16(sp)
    80008ca0:	00813483          	ld	s1,8(sp)
    80008ca4:	00013903          	ld	s2,0(sp)
    80008ca8:	02010113          	addi	sp,sp,32
    80008cac:	00008067          	ret
    80008cb0:	00002517          	auipc	a0,0x2
    80008cb4:	b7850513          	addi	a0,a0,-1160 # 8000a828 <digits+0x48>
    80008cb8:	fffff097          	auipc	ra,0xfffff
    80008cbc:	154080e7          	jalr	340(ra) # 80007e0c <panic>
    80008cc0:	00002517          	auipc	a0,0x2
    80008cc4:	b5050513          	addi	a0,a0,-1200 # 8000a810 <digits+0x30>
    80008cc8:	fffff097          	auipc	ra,0xfffff
    80008ccc:	144080e7          	jalr	324(ra) # 80007e0c <panic>

0000000080008cd0 <holding>:
    80008cd0:	00052783          	lw	a5,0(a0)
    80008cd4:	00079663          	bnez	a5,80008ce0 <holding+0x10>
    80008cd8:	00000513          	li	a0,0
    80008cdc:	00008067          	ret
    80008ce0:	fe010113          	addi	sp,sp,-32
    80008ce4:	00813823          	sd	s0,16(sp)
    80008ce8:	00913423          	sd	s1,8(sp)
    80008cec:	00113c23          	sd	ra,24(sp)
    80008cf0:	02010413          	addi	s0,sp,32
    80008cf4:	01053483          	ld	s1,16(a0)
    80008cf8:	ffffe097          	auipc	ra,0xffffe
    80008cfc:	754080e7          	jalr	1876(ra) # 8000744c <mycpu>
    80008d00:	01813083          	ld	ra,24(sp)
    80008d04:	01013403          	ld	s0,16(sp)
    80008d08:	40a48533          	sub	a0,s1,a0
    80008d0c:	00153513          	seqz	a0,a0
    80008d10:	00813483          	ld	s1,8(sp)
    80008d14:	02010113          	addi	sp,sp,32
    80008d18:	00008067          	ret

0000000080008d1c <push_off>:
    80008d1c:	fe010113          	addi	sp,sp,-32
    80008d20:	00813823          	sd	s0,16(sp)
    80008d24:	00113c23          	sd	ra,24(sp)
    80008d28:	00913423          	sd	s1,8(sp)
    80008d2c:	02010413          	addi	s0,sp,32
    80008d30:	100024f3          	csrr	s1,sstatus
    80008d34:	100027f3          	csrr	a5,sstatus
    80008d38:	ffd7f793          	andi	a5,a5,-3
    80008d3c:	10079073          	csrw	sstatus,a5
    80008d40:	ffffe097          	auipc	ra,0xffffe
    80008d44:	70c080e7          	jalr	1804(ra) # 8000744c <mycpu>
    80008d48:	07852783          	lw	a5,120(a0)
    80008d4c:	02078663          	beqz	a5,80008d78 <push_off+0x5c>
    80008d50:	ffffe097          	auipc	ra,0xffffe
    80008d54:	6fc080e7          	jalr	1788(ra) # 8000744c <mycpu>
    80008d58:	07852783          	lw	a5,120(a0)
    80008d5c:	01813083          	ld	ra,24(sp)
    80008d60:	01013403          	ld	s0,16(sp)
    80008d64:	0017879b          	addiw	a5,a5,1
    80008d68:	06f52c23          	sw	a5,120(a0)
    80008d6c:	00813483          	ld	s1,8(sp)
    80008d70:	02010113          	addi	sp,sp,32
    80008d74:	00008067          	ret
    80008d78:	0014d493          	srli	s1,s1,0x1
    80008d7c:	ffffe097          	auipc	ra,0xffffe
    80008d80:	6d0080e7          	jalr	1744(ra) # 8000744c <mycpu>
    80008d84:	0014f493          	andi	s1,s1,1
    80008d88:	06952e23          	sw	s1,124(a0)
    80008d8c:	fc5ff06f          	j	80008d50 <push_off+0x34>

0000000080008d90 <pop_off>:
    80008d90:	ff010113          	addi	sp,sp,-16
    80008d94:	00813023          	sd	s0,0(sp)
    80008d98:	00113423          	sd	ra,8(sp)
    80008d9c:	01010413          	addi	s0,sp,16
    80008da0:	ffffe097          	auipc	ra,0xffffe
    80008da4:	6ac080e7          	jalr	1708(ra) # 8000744c <mycpu>
    80008da8:	100027f3          	csrr	a5,sstatus
    80008dac:	0027f793          	andi	a5,a5,2
    80008db0:	04079663          	bnez	a5,80008dfc <pop_off+0x6c>
    80008db4:	07852783          	lw	a5,120(a0)
    80008db8:	02f05a63          	blez	a5,80008dec <pop_off+0x5c>
    80008dbc:	fff7871b          	addiw	a4,a5,-1
    80008dc0:	06e52c23          	sw	a4,120(a0)
    80008dc4:	00071c63          	bnez	a4,80008ddc <pop_off+0x4c>
    80008dc8:	07c52783          	lw	a5,124(a0)
    80008dcc:	00078863          	beqz	a5,80008ddc <pop_off+0x4c>
    80008dd0:	100027f3          	csrr	a5,sstatus
    80008dd4:	0027e793          	ori	a5,a5,2
    80008dd8:	10079073          	csrw	sstatus,a5
    80008ddc:	00813083          	ld	ra,8(sp)
    80008de0:	00013403          	ld	s0,0(sp)
    80008de4:	01010113          	addi	sp,sp,16
    80008de8:	00008067          	ret
    80008dec:	00002517          	auipc	a0,0x2
    80008df0:	a3c50513          	addi	a0,a0,-1476 # 8000a828 <digits+0x48>
    80008df4:	fffff097          	auipc	ra,0xfffff
    80008df8:	018080e7          	jalr	24(ra) # 80007e0c <panic>
    80008dfc:	00002517          	auipc	a0,0x2
    80008e00:	a1450513          	addi	a0,a0,-1516 # 8000a810 <digits+0x30>
    80008e04:	fffff097          	auipc	ra,0xfffff
    80008e08:	008080e7          	jalr	8(ra) # 80007e0c <panic>

0000000080008e0c <push_on>:
    80008e0c:	fe010113          	addi	sp,sp,-32
    80008e10:	00813823          	sd	s0,16(sp)
    80008e14:	00113c23          	sd	ra,24(sp)
    80008e18:	00913423          	sd	s1,8(sp)
    80008e1c:	02010413          	addi	s0,sp,32
    80008e20:	100024f3          	csrr	s1,sstatus
    80008e24:	100027f3          	csrr	a5,sstatus
    80008e28:	0027e793          	ori	a5,a5,2
    80008e2c:	10079073          	csrw	sstatus,a5
    80008e30:	ffffe097          	auipc	ra,0xffffe
    80008e34:	61c080e7          	jalr	1564(ra) # 8000744c <mycpu>
    80008e38:	07852783          	lw	a5,120(a0)
    80008e3c:	02078663          	beqz	a5,80008e68 <push_on+0x5c>
    80008e40:	ffffe097          	auipc	ra,0xffffe
    80008e44:	60c080e7          	jalr	1548(ra) # 8000744c <mycpu>
    80008e48:	07852783          	lw	a5,120(a0)
    80008e4c:	01813083          	ld	ra,24(sp)
    80008e50:	01013403          	ld	s0,16(sp)
    80008e54:	0017879b          	addiw	a5,a5,1
    80008e58:	06f52c23          	sw	a5,120(a0)
    80008e5c:	00813483          	ld	s1,8(sp)
    80008e60:	02010113          	addi	sp,sp,32
    80008e64:	00008067          	ret
    80008e68:	0014d493          	srli	s1,s1,0x1
    80008e6c:	ffffe097          	auipc	ra,0xffffe
    80008e70:	5e0080e7          	jalr	1504(ra) # 8000744c <mycpu>
    80008e74:	0014f493          	andi	s1,s1,1
    80008e78:	06952e23          	sw	s1,124(a0)
    80008e7c:	fc5ff06f          	j	80008e40 <push_on+0x34>

0000000080008e80 <pop_on>:
    80008e80:	ff010113          	addi	sp,sp,-16
    80008e84:	00813023          	sd	s0,0(sp)
    80008e88:	00113423          	sd	ra,8(sp)
    80008e8c:	01010413          	addi	s0,sp,16
    80008e90:	ffffe097          	auipc	ra,0xffffe
    80008e94:	5bc080e7          	jalr	1468(ra) # 8000744c <mycpu>
    80008e98:	100027f3          	csrr	a5,sstatus
    80008e9c:	0027f793          	andi	a5,a5,2
    80008ea0:	04078463          	beqz	a5,80008ee8 <pop_on+0x68>
    80008ea4:	07852783          	lw	a5,120(a0)
    80008ea8:	02f05863          	blez	a5,80008ed8 <pop_on+0x58>
    80008eac:	fff7879b          	addiw	a5,a5,-1
    80008eb0:	06f52c23          	sw	a5,120(a0)
    80008eb4:	07853783          	ld	a5,120(a0)
    80008eb8:	00079863          	bnez	a5,80008ec8 <pop_on+0x48>
    80008ebc:	100027f3          	csrr	a5,sstatus
    80008ec0:	ffd7f793          	andi	a5,a5,-3
    80008ec4:	10079073          	csrw	sstatus,a5
    80008ec8:	00813083          	ld	ra,8(sp)
    80008ecc:	00013403          	ld	s0,0(sp)
    80008ed0:	01010113          	addi	sp,sp,16
    80008ed4:	00008067          	ret
    80008ed8:	00002517          	auipc	a0,0x2
    80008edc:	97850513          	addi	a0,a0,-1672 # 8000a850 <digits+0x70>
    80008ee0:	fffff097          	auipc	ra,0xfffff
    80008ee4:	f2c080e7          	jalr	-212(ra) # 80007e0c <panic>
    80008ee8:	00002517          	auipc	a0,0x2
    80008eec:	94850513          	addi	a0,a0,-1720 # 8000a830 <digits+0x50>
    80008ef0:	fffff097          	auipc	ra,0xfffff
    80008ef4:	f1c080e7          	jalr	-228(ra) # 80007e0c <panic>

0000000080008ef8 <__memset>:
    80008ef8:	ff010113          	addi	sp,sp,-16
    80008efc:	00813423          	sd	s0,8(sp)
    80008f00:	01010413          	addi	s0,sp,16
    80008f04:	1a060e63          	beqz	a2,800090c0 <__memset+0x1c8>
    80008f08:	40a007b3          	neg	a5,a0
    80008f0c:	0077f793          	andi	a5,a5,7
    80008f10:	00778693          	addi	a3,a5,7
    80008f14:	00b00813          	li	a6,11
    80008f18:	0ff5f593          	andi	a1,a1,255
    80008f1c:	fff6071b          	addiw	a4,a2,-1
    80008f20:	1b06e663          	bltu	a3,a6,800090cc <__memset+0x1d4>
    80008f24:	1cd76463          	bltu	a4,a3,800090ec <__memset+0x1f4>
    80008f28:	1a078e63          	beqz	a5,800090e4 <__memset+0x1ec>
    80008f2c:	00b50023          	sb	a1,0(a0)
    80008f30:	00100713          	li	a4,1
    80008f34:	1ae78463          	beq	a5,a4,800090dc <__memset+0x1e4>
    80008f38:	00b500a3          	sb	a1,1(a0)
    80008f3c:	00200713          	li	a4,2
    80008f40:	1ae78a63          	beq	a5,a4,800090f4 <__memset+0x1fc>
    80008f44:	00b50123          	sb	a1,2(a0)
    80008f48:	00300713          	li	a4,3
    80008f4c:	18e78463          	beq	a5,a4,800090d4 <__memset+0x1dc>
    80008f50:	00b501a3          	sb	a1,3(a0)
    80008f54:	00400713          	li	a4,4
    80008f58:	1ae78263          	beq	a5,a4,800090fc <__memset+0x204>
    80008f5c:	00b50223          	sb	a1,4(a0)
    80008f60:	00500713          	li	a4,5
    80008f64:	1ae78063          	beq	a5,a4,80009104 <__memset+0x20c>
    80008f68:	00b502a3          	sb	a1,5(a0)
    80008f6c:	00700713          	li	a4,7
    80008f70:	18e79e63          	bne	a5,a4,8000910c <__memset+0x214>
    80008f74:	00b50323          	sb	a1,6(a0)
    80008f78:	00700e93          	li	t4,7
    80008f7c:	00859713          	slli	a4,a1,0x8
    80008f80:	00e5e733          	or	a4,a1,a4
    80008f84:	01059e13          	slli	t3,a1,0x10
    80008f88:	01c76e33          	or	t3,a4,t3
    80008f8c:	01859313          	slli	t1,a1,0x18
    80008f90:	006e6333          	or	t1,t3,t1
    80008f94:	02059893          	slli	a7,a1,0x20
    80008f98:	40f60e3b          	subw	t3,a2,a5
    80008f9c:	011368b3          	or	a7,t1,a7
    80008fa0:	02859813          	slli	a6,a1,0x28
    80008fa4:	0108e833          	or	a6,a7,a6
    80008fa8:	03059693          	slli	a3,a1,0x30
    80008fac:	003e589b          	srliw	a7,t3,0x3
    80008fb0:	00d866b3          	or	a3,a6,a3
    80008fb4:	03859713          	slli	a4,a1,0x38
    80008fb8:	00389813          	slli	a6,a7,0x3
    80008fbc:	00f507b3          	add	a5,a0,a5
    80008fc0:	00e6e733          	or	a4,a3,a4
    80008fc4:	000e089b          	sext.w	a7,t3
    80008fc8:	00f806b3          	add	a3,a6,a5
    80008fcc:	00e7b023          	sd	a4,0(a5)
    80008fd0:	00878793          	addi	a5,a5,8
    80008fd4:	fed79ce3          	bne	a5,a3,80008fcc <__memset+0xd4>
    80008fd8:	ff8e7793          	andi	a5,t3,-8
    80008fdc:	0007871b          	sext.w	a4,a5
    80008fe0:	01d787bb          	addw	a5,a5,t4
    80008fe4:	0ce88e63          	beq	a7,a4,800090c0 <__memset+0x1c8>
    80008fe8:	00f50733          	add	a4,a0,a5
    80008fec:	00b70023          	sb	a1,0(a4)
    80008ff0:	0017871b          	addiw	a4,a5,1
    80008ff4:	0cc77663          	bgeu	a4,a2,800090c0 <__memset+0x1c8>
    80008ff8:	00e50733          	add	a4,a0,a4
    80008ffc:	00b70023          	sb	a1,0(a4)
    80009000:	0027871b          	addiw	a4,a5,2
    80009004:	0ac77e63          	bgeu	a4,a2,800090c0 <__memset+0x1c8>
    80009008:	00e50733          	add	a4,a0,a4
    8000900c:	00b70023          	sb	a1,0(a4)
    80009010:	0037871b          	addiw	a4,a5,3
    80009014:	0ac77663          	bgeu	a4,a2,800090c0 <__memset+0x1c8>
    80009018:	00e50733          	add	a4,a0,a4
    8000901c:	00b70023          	sb	a1,0(a4)
    80009020:	0047871b          	addiw	a4,a5,4
    80009024:	08c77e63          	bgeu	a4,a2,800090c0 <__memset+0x1c8>
    80009028:	00e50733          	add	a4,a0,a4
    8000902c:	00b70023          	sb	a1,0(a4)
    80009030:	0057871b          	addiw	a4,a5,5
    80009034:	08c77663          	bgeu	a4,a2,800090c0 <__memset+0x1c8>
    80009038:	00e50733          	add	a4,a0,a4
    8000903c:	00b70023          	sb	a1,0(a4)
    80009040:	0067871b          	addiw	a4,a5,6
    80009044:	06c77e63          	bgeu	a4,a2,800090c0 <__memset+0x1c8>
    80009048:	00e50733          	add	a4,a0,a4
    8000904c:	00b70023          	sb	a1,0(a4)
    80009050:	0077871b          	addiw	a4,a5,7
    80009054:	06c77663          	bgeu	a4,a2,800090c0 <__memset+0x1c8>
    80009058:	00e50733          	add	a4,a0,a4
    8000905c:	00b70023          	sb	a1,0(a4)
    80009060:	0087871b          	addiw	a4,a5,8
    80009064:	04c77e63          	bgeu	a4,a2,800090c0 <__memset+0x1c8>
    80009068:	00e50733          	add	a4,a0,a4
    8000906c:	00b70023          	sb	a1,0(a4)
    80009070:	0097871b          	addiw	a4,a5,9
    80009074:	04c77663          	bgeu	a4,a2,800090c0 <__memset+0x1c8>
    80009078:	00e50733          	add	a4,a0,a4
    8000907c:	00b70023          	sb	a1,0(a4)
    80009080:	00a7871b          	addiw	a4,a5,10
    80009084:	02c77e63          	bgeu	a4,a2,800090c0 <__memset+0x1c8>
    80009088:	00e50733          	add	a4,a0,a4
    8000908c:	00b70023          	sb	a1,0(a4)
    80009090:	00b7871b          	addiw	a4,a5,11
    80009094:	02c77663          	bgeu	a4,a2,800090c0 <__memset+0x1c8>
    80009098:	00e50733          	add	a4,a0,a4
    8000909c:	00b70023          	sb	a1,0(a4)
    800090a0:	00c7871b          	addiw	a4,a5,12
    800090a4:	00c77e63          	bgeu	a4,a2,800090c0 <__memset+0x1c8>
    800090a8:	00e50733          	add	a4,a0,a4
    800090ac:	00b70023          	sb	a1,0(a4)
    800090b0:	00d7879b          	addiw	a5,a5,13
    800090b4:	00c7f663          	bgeu	a5,a2,800090c0 <__memset+0x1c8>
    800090b8:	00f507b3          	add	a5,a0,a5
    800090bc:	00b78023          	sb	a1,0(a5)
    800090c0:	00813403          	ld	s0,8(sp)
    800090c4:	01010113          	addi	sp,sp,16
    800090c8:	00008067          	ret
    800090cc:	00b00693          	li	a3,11
    800090d0:	e55ff06f          	j	80008f24 <__memset+0x2c>
    800090d4:	00300e93          	li	t4,3
    800090d8:	ea5ff06f          	j	80008f7c <__memset+0x84>
    800090dc:	00100e93          	li	t4,1
    800090e0:	e9dff06f          	j	80008f7c <__memset+0x84>
    800090e4:	00000e93          	li	t4,0
    800090e8:	e95ff06f          	j	80008f7c <__memset+0x84>
    800090ec:	00000793          	li	a5,0
    800090f0:	ef9ff06f          	j	80008fe8 <__memset+0xf0>
    800090f4:	00200e93          	li	t4,2
    800090f8:	e85ff06f          	j	80008f7c <__memset+0x84>
    800090fc:	00400e93          	li	t4,4
    80009100:	e7dff06f          	j	80008f7c <__memset+0x84>
    80009104:	00500e93          	li	t4,5
    80009108:	e75ff06f          	j	80008f7c <__memset+0x84>
    8000910c:	00600e93          	li	t4,6
    80009110:	e6dff06f          	j	80008f7c <__memset+0x84>

0000000080009114 <__memmove>:
    80009114:	ff010113          	addi	sp,sp,-16
    80009118:	00813423          	sd	s0,8(sp)
    8000911c:	01010413          	addi	s0,sp,16
    80009120:	0e060863          	beqz	a2,80009210 <__memmove+0xfc>
    80009124:	fff6069b          	addiw	a3,a2,-1
    80009128:	0006881b          	sext.w	a6,a3
    8000912c:	0ea5e863          	bltu	a1,a0,8000921c <__memmove+0x108>
    80009130:	00758713          	addi	a4,a1,7
    80009134:	00a5e7b3          	or	a5,a1,a0
    80009138:	40a70733          	sub	a4,a4,a0
    8000913c:	0077f793          	andi	a5,a5,7
    80009140:	00f73713          	sltiu	a4,a4,15
    80009144:	00174713          	xori	a4,a4,1
    80009148:	0017b793          	seqz	a5,a5
    8000914c:	00e7f7b3          	and	a5,a5,a4
    80009150:	10078863          	beqz	a5,80009260 <__memmove+0x14c>
    80009154:	00900793          	li	a5,9
    80009158:	1107f463          	bgeu	a5,a6,80009260 <__memmove+0x14c>
    8000915c:	0036581b          	srliw	a6,a2,0x3
    80009160:	fff8081b          	addiw	a6,a6,-1
    80009164:	02081813          	slli	a6,a6,0x20
    80009168:	01d85893          	srli	a7,a6,0x1d
    8000916c:	00858813          	addi	a6,a1,8
    80009170:	00058793          	mv	a5,a1
    80009174:	00050713          	mv	a4,a0
    80009178:	01088833          	add	a6,a7,a6
    8000917c:	0007b883          	ld	a7,0(a5)
    80009180:	00878793          	addi	a5,a5,8
    80009184:	00870713          	addi	a4,a4,8
    80009188:	ff173c23          	sd	a7,-8(a4)
    8000918c:	ff0798e3          	bne	a5,a6,8000917c <__memmove+0x68>
    80009190:	ff867713          	andi	a4,a2,-8
    80009194:	02071793          	slli	a5,a4,0x20
    80009198:	0207d793          	srli	a5,a5,0x20
    8000919c:	00f585b3          	add	a1,a1,a5
    800091a0:	40e686bb          	subw	a3,a3,a4
    800091a4:	00f507b3          	add	a5,a0,a5
    800091a8:	06e60463          	beq	a2,a4,80009210 <__memmove+0xfc>
    800091ac:	0005c703          	lbu	a4,0(a1)
    800091b0:	00e78023          	sb	a4,0(a5)
    800091b4:	04068e63          	beqz	a3,80009210 <__memmove+0xfc>
    800091b8:	0015c603          	lbu	a2,1(a1)
    800091bc:	00100713          	li	a4,1
    800091c0:	00c780a3          	sb	a2,1(a5)
    800091c4:	04e68663          	beq	a3,a4,80009210 <__memmove+0xfc>
    800091c8:	0025c603          	lbu	a2,2(a1)
    800091cc:	00200713          	li	a4,2
    800091d0:	00c78123          	sb	a2,2(a5)
    800091d4:	02e68e63          	beq	a3,a4,80009210 <__memmove+0xfc>
    800091d8:	0035c603          	lbu	a2,3(a1)
    800091dc:	00300713          	li	a4,3
    800091e0:	00c781a3          	sb	a2,3(a5)
    800091e4:	02e68663          	beq	a3,a4,80009210 <__memmove+0xfc>
    800091e8:	0045c603          	lbu	a2,4(a1)
    800091ec:	00400713          	li	a4,4
    800091f0:	00c78223          	sb	a2,4(a5)
    800091f4:	00e68e63          	beq	a3,a4,80009210 <__memmove+0xfc>
    800091f8:	0055c603          	lbu	a2,5(a1)
    800091fc:	00500713          	li	a4,5
    80009200:	00c782a3          	sb	a2,5(a5)
    80009204:	00e68663          	beq	a3,a4,80009210 <__memmove+0xfc>
    80009208:	0065c703          	lbu	a4,6(a1)
    8000920c:	00e78323          	sb	a4,6(a5)
    80009210:	00813403          	ld	s0,8(sp)
    80009214:	01010113          	addi	sp,sp,16
    80009218:	00008067          	ret
    8000921c:	02061713          	slli	a4,a2,0x20
    80009220:	02075713          	srli	a4,a4,0x20
    80009224:	00e587b3          	add	a5,a1,a4
    80009228:	f0f574e3          	bgeu	a0,a5,80009130 <__memmove+0x1c>
    8000922c:	02069613          	slli	a2,a3,0x20
    80009230:	02065613          	srli	a2,a2,0x20
    80009234:	fff64613          	not	a2,a2
    80009238:	00e50733          	add	a4,a0,a4
    8000923c:	00c78633          	add	a2,a5,a2
    80009240:	fff7c683          	lbu	a3,-1(a5)
    80009244:	fff78793          	addi	a5,a5,-1
    80009248:	fff70713          	addi	a4,a4,-1
    8000924c:	00d70023          	sb	a3,0(a4)
    80009250:	fec798e3          	bne	a5,a2,80009240 <__memmove+0x12c>
    80009254:	00813403          	ld	s0,8(sp)
    80009258:	01010113          	addi	sp,sp,16
    8000925c:	00008067          	ret
    80009260:	02069713          	slli	a4,a3,0x20
    80009264:	02075713          	srli	a4,a4,0x20
    80009268:	00170713          	addi	a4,a4,1
    8000926c:	00e50733          	add	a4,a0,a4
    80009270:	00050793          	mv	a5,a0
    80009274:	0005c683          	lbu	a3,0(a1)
    80009278:	00178793          	addi	a5,a5,1
    8000927c:	00158593          	addi	a1,a1,1
    80009280:	fed78fa3          	sb	a3,-1(a5)
    80009284:	fee798e3          	bne	a5,a4,80009274 <__memmove+0x160>
    80009288:	f89ff06f          	j	80009210 <__memmove+0xfc>
	...
