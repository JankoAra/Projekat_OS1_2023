
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	d1013103          	ld	sp,-752(sp) # 8000cd10 <_GLOBAL_OFFSET_TABLE_+0x48>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	518070ef          	jal	ra,80007534 <start>

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
    80001084:	010010ef          	jal	ra,80002094 <interruptRoutine>

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
    800013a4:	9807b783          	ld	a5,-1664(a5) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x58>
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
    800015f0:	7347b783          	ld	a5,1844(a5) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x58>
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
    80001684:	7207c783          	lbu	a5,1824(a5) # 8000cda0 <_ZN8KConsole11initializedE>
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
    800016a8:	6fc48493          	addi	s1,s1,1788 # 8000cda0 <_ZN8KConsole11initializedE>
    800016ac:	0000b797          	auipc	a5,0xb
    800016b0:	62c7b783          	ld	a5,1580(a5) # 8000ccd8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800016b4:	0007b783          	ld	a5,0(a5)
    800016b8:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    800016bc:	0000b797          	auipc	a5,0xb
    800016c0:	62c7b783          	ld	a5,1580(a5) # 8000cce8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016c4:	0007b783          	ld	a5,0(a5)
    800016c8:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    800016cc:	03200593          	li	a1,50
    800016d0:	0000b517          	auipc	a0,0xb
    800016d4:	6e850513          	addi	a0,a0,1768 # 8000cdb8 <_ZN8KConsole19inputBufferHasSpaceE>
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	dd4080e7          	jalr	-556(ra) # 800014ac <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016e0:	03200593          	li	a1,50
    800016e4:	0000b517          	auipc	a0,0xb
    800016e8:	6dc50513          	addi	a0,a0,1756 # 8000cdc0 <_ZN8KConsole20outputBufferHasSpaceE>
    800016ec:	00000097          	auipc	ra,0x0
    800016f0:	dc0080e7          	jalr	-576(ra) # 800014ac <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016f4:	00000593          	li	a1,0
    800016f8:	0000b517          	auipc	a0,0xb
    800016fc:	6d050513          	addi	a0,a0,1744 # 8000cdc8 <_ZN8KConsole12charsToInputE>
    80001700:	00000097          	auipc	ra,0x0
    80001704:	dac080e7          	jalr	-596(ra) # 800014ac <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    80001708:	00000593          	li	a1,0
    8000170c:	0000b517          	auipc	a0,0xb
    80001710:	6c450513          	addi	a0,a0,1732 # 8000cdd0 <_ZN8KConsole13charsToOutputE>
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

0000000080001738 <_ZN8KConsole17printConsoleStateEv>:

void KConsole::printConsoleState() {
    80001738:	fe010113          	addi	sp,sp,-32
    8000173c:	00113c23          	sd	ra,24(sp)
    80001740:	00813823          	sd	s0,16(sp)
    80001744:	00913423          	sd	s1,8(sp)
    80001748:	02010413          	addi	s0,sp,32
	printString("CONSOLE_RX = ");
    8000174c:	00009517          	auipc	a0,0x9
    80001750:	8d450513          	addi	a0,a0,-1836 # 8000a020 <CONSOLE_STATUS+0x10>
    80001754:	00004097          	auipc	ra,0x4
    80001758:	5f0080e7          	jalr	1520(ra) # 80005d44 <_Z11printStringPKc>
	printInteger((uint64)dr);
    8000175c:	0000b497          	auipc	s1,0xb
    80001760:	64448493          	addi	s1,s1,1604 # 8000cda0 <_ZN8KConsole11initializedE>
    80001764:	0084b503          	ld	a0,8(s1)
    80001768:	00000097          	auipc	ra,0x0
    8000176c:	250080e7          	jalr	592(ra) # 800019b8 <_Z12printIntegerm>
	printString("\n");
    80001770:	00009517          	auipc	a0,0x9
    80001774:	e3850513          	addi	a0,a0,-456 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80001778:	00004097          	auipc	ra,0x4
    8000177c:	5cc080e7          	jalr	1484(ra) # 80005d44 <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001780:	00009517          	auipc	a0,0x9
    80001784:	8b050513          	addi	a0,a0,-1872 # 8000a030 <CONSOLE_STATUS+0x20>
    80001788:	00004097          	auipc	ra,0x4
    8000178c:	5bc080e7          	jalr	1468(ra) # 80005d44 <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001790:	0104b503          	ld	a0,16(s1)
    80001794:	00000097          	auipc	ra,0x0
    80001798:	224080e7          	jalr	548(ra) # 800019b8 <_Z12printIntegerm>
	printString("\n");
    8000179c:	00009517          	auipc	a0,0x9
    800017a0:	e0c50513          	addi	a0,a0,-500 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    800017a4:	00004097          	auipc	ra,0x4
    800017a8:	5a0080e7          	jalr	1440(ra) # 80005d44 <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    800017ac:	00009517          	auipc	a0,0x9
    800017b0:	89c50513          	addi	a0,a0,-1892 # 8000a048 <CONSOLE_STATUS+0x38>
    800017b4:	00004097          	auipc	ra,0x4
    800017b8:	590080e7          	jalr	1424(ra) # 80005d44 <_Z11printStringPKc>
	printInteger(*dr);
    800017bc:	0084b783          	ld	a5,8(s1)
    800017c0:	0007c503          	lbu	a0,0(a5)
    800017c4:	00000097          	auipc	ra,0x0
    800017c8:	1f4080e7          	jalr	500(ra) # 800019b8 <_Z12printIntegerm>
	printString("\n");
    800017cc:	00009517          	auipc	a0,0x9
    800017d0:	ddc50513          	addi	a0,a0,-548 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    800017d4:	00004097          	auipc	ra,0x4
    800017d8:	570080e7          	jalr	1392(ra) # 80005d44 <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017dc:	00009517          	auipc	a0,0x9
    800017e0:	87c50513          	addi	a0,a0,-1924 # 8000a058 <CONSOLE_STATUS+0x48>
    800017e4:	00004097          	auipc	ra,0x4
    800017e8:	560080e7          	jalr	1376(ra) # 80005d44 <_Z11printStringPKc>
	printInteger(*sr);
    800017ec:	0104b783          	ld	a5,16(s1)
    800017f0:	0007c503          	lbu	a0,0(a5)
    800017f4:	00000097          	auipc	ra,0x0
    800017f8:	1c4080e7          	jalr	452(ra) # 800019b8 <_Z12printIntegerm>
	printString("\n");
    800017fc:	00009517          	auipc	a0,0x9
    80001800:	dac50513          	addi	a0,a0,-596 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80001804:	00004097          	auipc	ra,0x4
    80001808:	540080e7          	jalr	1344(ra) # 80005d44 <_Z11printStringPKc>
}
    8000180c:	01813083          	ld	ra,24(sp)
    80001810:	01013403          	ld	s0,16(sp)
    80001814:	00813483          	ld	s1,8(sp)
    80001818:	02010113          	addi	sp,sp,32
    8000181c:	00008067          	ret

0000000080001820 <_ZN8KConsole13getFromOutputEv>:

char KConsole::getFromOutput() {
    80001820:	fe010113          	addi	sp,sp,-32
    80001824:	00113c23          	sd	ra,24(sp)
    80001828:	00813823          	sd	s0,16(sp)
    8000182c:	00913423          	sd	s1,8(sp)
    80001830:	02010413          	addi	s0,sp,32
	sem_wait(charsToOutput);
    80001834:	0000b497          	auipc	s1,0xb
    80001838:	56c48493          	addi	s1,s1,1388 # 8000cda0 <_ZN8KConsole11initializedE>
    8000183c:	0304b503          	ld	a0,48(s1)
    80001840:	00000097          	auipc	ra,0x0
    80001844:	cd4080e7          	jalr	-812(ra) # 80001514 <_Z8sem_waitP4KSem>
	char c = outputBuffer[outputHead];
    80001848:	0384a783          	lw	a5,56(s1)
    8000184c:	00f48733          	add	a4,s1,a5
	outputHead = (outputHead + 1) % capacity;
    80001850:	0017879b          	addiw	a5,a5,1
    80001854:	03200693          	li	a3,50
    80001858:	02d7e7bb          	remw	a5,a5,a3
    8000185c:	02f4ac23          	sw	a5,56(s1)
	return c;
}
    80001860:	04074503          	lbu	a0,64(a4)
    80001864:	01813083          	ld	ra,24(sp)
    80001868:	01013403          	ld	s0,16(sp)
    8000186c:	00813483          	ld	s1,8(sp)
    80001870:	02010113          	addi	sp,sp,32
    80001874:	00008067          	ret

0000000080001878 <_ZN8KConsole12placeInInputEc>:

void KConsole::placeInInput(char c) {
	if (inputBufferSize == capacity) return;
    80001878:	0000b717          	auipc	a4,0xb
    8000187c:	59c72703          	lw	a4,1436(a4) # 8000ce14 <_ZN8KConsole15inputBufferSizeE>
    80001880:	03200793          	li	a5,50
    80001884:	04f70e63          	beq	a4,a5,800018e0 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    80001888:	ff010113          	addi	sp,sp,-16
    8000188c:	00113423          	sd	ra,8(sp)
    80001890:	00813023          	sd	s0,0(sp)
    80001894:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    80001898:	0000b697          	auipc	a3,0xb
    8000189c:	50868693          	addi	a3,a3,1288 # 8000cda0 <_ZN8KConsole11initializedE>
    800018a0:	0786a783          	lw	a5,120(a3)
    800018a4:	00f68633          	add	a2,a3,a5
    800018a8:	08a60023          	sb	a0,128(a2)
	inputTail = (inputTail + 1) % capacity;
    800018ac:	0017879b          	addiw	a5,a5,1
    800018b0:	03200613          	li	a2,50
    800018b4:	02c7e7bb          	remw	a5,a5,a2
    800018b8:	06f6ac23          	sw	a5,120(a3)
	inputBufferSize++;
    800018bc:	0017071b          	addiw	a4,a4,1
    800018c0:	06e6aa23          	sw	a4,116(a3)
	sem_signal(charsToInput);
    800018c4:	0286b503          	ld	a0,40(a3)
    800018c8:	00000097          	auipc	ra,0x0
    800018cc:	c7c080e7          	jalr	-900(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    800018d0:	00813083          	ld	ra,8(sp)
    800018d4:	00013403          	ld	s0,0(sp)
    800018d8:	01010113          	addi	sp,sp,16
    800018dc:	00008067          	ret
    800018e0:	00008067          	ret

00000000800018e4 <_ZN8KConsole5kputcEc>:

void KConsole::kputc(char c) {
    800018e4:	fe010113          	addi	sp,sp,-32
    800018e8:	00113c23          	sd	ra,24(sp)
    800018ec:	00813823          	sd	s0,16(sp)
    800018f0:	00913423          	sd	s1,8(sp)
    800018f4:	01213023          	sd	s2,0(sp)
    800018f8:	02010413          	addi	s0,sp,32
    800018fc:	00050913          	mv	s2,a0
	sem_wait(outputBufferHasSpace);
    80001900:	0000b497          	auipc	s1,0xb
    80001904:	4a048493          	addi	s1,s1,1184 # 8000cda0 <_ZN8KConsole11initializedE>
    80001908:	0204b503          	ld	a0,32(s1)
    8000190c:	00000097          	auipc	ra,0x0
    80001910:	c08080e7          	jalr	-1016(ra) # 80001514 <_Z8sem_waitP4KSem>
	outputBuffer[outputTail] = c;
    80001914:	0b44a783          	lw	a5,180(s1)
    80001918:	00f48733          	add	a4,s1,a5
    8000191c:	05270023          	sb	s2,64(a4)
	outputTail = (outputTail + 1) % capacity;
    80001920:	0017879b          	addiw	a5,a5,1
    80001924:	03200713          	li	a4,50
    80001928:	02e7e7bb          	remw	a5,a5,a4
    8000192c:	0af4aa23          	sw	a5,180(s1)
	sem_signal(charsToOutput);
    80001930:	0304b503          	ld	a0,48(s1)
    80001934:	00000097          	auipc	ra,0x0
    80001938:	c10080e7          	jalr	-1008(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    8000193c:	01813083          	ld	ra,24(sp)
    80001940:	01013403          	ld	s0,16(sp)
    80001944:	00813483          	ld	s1,8(sp)
    80001948:	00013903          	ld	s2,0(sp)
    8000194c:	02010113          	addi	sp,sp,32
    80001950:	00008067          	ret

0000000080001954 <_ZN8KConsole5kgetcEv>:

char KConsole::kgetc() {
    80001954:	fe010113          	addi	sp,sp,-32
    80001958:	00113c23          	sd	ra,24(sp)
    8000195c:	00813823          	sd	s0,16(sp)
    80001960:	00913423          	sd	s1,8(sp)
    80001964:	02010413          	addi	s0,sp,32
	sem_wait(charsToInput);
    80001968:	0000b497          	auipc	s1,0xb
    8000196c:	43848493          	addi	s1,s1,1080 # 8000cda0 <_ZN8KConsole11initializedE>
    80001970:	0284b503          	ld	a0,40(s1)
    80001974:	00000097          	auipc	ra,0x0
    80001978:	ba0080e7          	jalr	-1120(ra) # 80001514 <_Z8sem_waitP4KSem>
	char c = inputBuffer[inputHead];
    8000197c:	0b84a783          	lw	a5,184(s1)
    80001980:	00f48733          	add	a4,s1,a5
	inputHead = (inputHead + 1) % capacity;
    80001984:	0017879b          	addiw	a5,a5,1
    80001988:	03200693          	li	a3,50
    8000198c:	02d7e7bb          	remw	a5,a5,a3
    80001990:	0af4ac23          	sw	a5,184(s1)
	inputBufferSize--;
    80001994:	0744a783          	lw	a5,116(s1)
    80001998:	fff7879b          	addiw	a5,a5,-1
    8000199c:	06f4aa23          	sw	a5,116(s1)
	return c;
}
    800019a0:	08074503          	lbu	a0,128(a4)
    800019a4:	01813083          	ld	ra,24(sp)
    800019a8:	01013403          	ld	s0,16(sp)
    800019ac:	00813483          	ld	s1,8(sp)
    800019b0:	02010113          	addi	sp,sp,32
    800019b4:	00008067          	ret

00000000800019b8 <_Z12printIntegerm>:
//void println(char const *string) {
//    printString(string);
//    __putc('\n');
//}

void printInteger(uint64 integer) {
    800019b8:	ff010113          	addi	sp,sp,-16
    800019bc:	00813423          	sd	s0,8(sp)
    800019c0:	01010413          	addi	s0,sp,16
    800019c4:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[i]": :[i] "r"(integer):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800019c8:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x91");
    800019cc:	09100513          	li	a0,145

	__asm__ volatile("ecall");
    800019d0:	00000073          	ecall
}
    800019d4:	00813403          	ld	s0,8(sp)
    800019d8:	01010113          	addi	sp,sp,16
    800019dc:	00008067          	ret

00000000800019e0 <_Z9kPrintIntm>:

void kPrintInt(uint64 integer){
    800019e0:	fd010113          	addi	sp,sp,-48
    800019e4:	02113423          	sd	ra,40(sp)
    800019e8:	02813023          	sd	s0,32(sp)
    800019ec:	00913c23          	sd	s1,24(sp)
    800019f0:	03010413          	addi	s0,sp,48
    neg = 0;
    if (integer < 0) {
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    800019f4:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    800019f8:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    800019fc:	00a00613          	li	a2,10
    80001a00:	02c5773b          	remuw	a4,a0,a2
    80001a04:	02071693          	slli	a3,a4,0x20
    80001a08:	0206d693          	srli	a3,a3,0x20
    80001a0c:	00008717          	auipc	a4,0x8
    80001a10:	66470713          	addi	a4,a4,1636 # 8000a070 <_ZZ9kPrintIntmE6digits>
    80001a14:	00d70733          	add	a4,a4,a3
    80001a18:	00074703          	lbu	a4,0(a4)
    80001a1c:	fe040693          	addi	a3,s0,-32
    80001a20:	009687b3          	add	a5,a3,s1
    80001a24:	0014849b          	addiw	s1,s1,1
    80001a28:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80001a2c:	0005071b          	sext.w	a4,a0
    80001a30:	02c5553b          	divuw	a0,a0,a2
    80001a34:	00900793          	li	a5,9
    80001a38:	fce7e2e3          	bltu	a5,a4,800019fc <_Z9kPrintIntm+0x1c>
    if (neg) buf[i++] = '-';

    while (--i >= 0) {
    80001a3c:	fff4849b          	addiw	s1,s1,-1
    80001a40:	0004ce63          	bltz	s1,80001a5c <_Z9kPrintIntm+0x7c>
        putc(buf[i]);
    80001a44:	fe040793          	addi	a5,s0,-32
    80001a48:	009787b3          	add	a5,a5,s1
    80001a4c:	ff07c503          	lbu	a0,-16(a5)
    80001a50:	00000097          	auipc	ra,0x0
    80001a54:	b4c080e7          	jalr	-1204(ra) # 8000159c <_Z4putcc>
    80001a58:	fe5ff06f          	j	80001a3c <_Z9kPrintIntm+0x5c>
    }
}
    80001a5c:	02813083          	ld	ra,40(sp)
    80001a60:	02013403          	ld	s0,32(sp)
    80001a64:	01813483          	ld	s1,24(sp)
    80001a68:	03010113          	addi	sp,sp,48
    80001a6c:	00008067          	ret

0000000080001a70 <_ZN9Scheduler3putEP3TCB>:

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    80001a70:	ff010113          	addi	sp,sp,-16
    80001a74:	00813423          	sd	s0,8(sp)
    80001a78:	01010413          	addi	s0,sp,16
    if (tail == nullptr) {
    80001a7c:	0000b797          	auipc	a5,0xb
    80001a80:	3e47b783          	ld	a5,996(a5) # 8000ce60 <_ZN9Scheduler4tailE>
    80001a84:	02078263          	beqz	a5,80001aa8 <_ZN9Scheduler3putEP3TCB+0x38>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    80001a88:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    80001a8c:	0000b797          	auipc	a5,0xb
    80001a90:	3ca7ba23          	sd	a0,980(a5) # 8000ce60 <_ZN9Scheduler4tailE>
    using Body = void (*)(void*);

    enum ThreadStatus {
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    80001a94:	00100793          	li	a5,1
    80001a98:	04f52c23          	sw	a5,88(a0)
    }
    tcb->setStatus(TCB::ACTIVE);
}
    80001a9c:	00813403          	ld	s0,8(sp)
    80001aa0:	01010113          	addi	sp,sp,16
    80001aa4:	00008067          	ret
        head = tail = tcb;
    80001aa8:	0000b797          	auipc	a5,0xb
    80001aac:	3b878793          	addi	a5,a5,952 # 8000ce60 <_ZN9Scheduler4tailE>
    80001ab0:	00a7b023          	sd	a0,0(a5)
    80001ab4:	00a7b423          	sd	a0,8(a5)
    80001ab8:	fddff06f          	j	80001a94 <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001abc <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001abc:	ff010113          	addi	sp,sp,-16
    80001ac0:	00813423          	sd	s0,8(sp)
    80001ac4:	01010413          	addi	s0,sp,16
    TCB* firstThread = head;
    80001ac8:	0000b717          	auipc	a4,0xb
    80001acc:	39870713          	addi	a4,a4,920 # 8000ce60 <_ZN9Scheduler4tailE>
    80001ad0:	00873503          	ld	a0,8(a4)
    head = head->nextInScheduler;
    80001ad4:	03053783          	ld	a5,48(a0)
    80001ad8:	00f73423          	sd	a5,8(a4)
    if (head == nullptr) {
    80001adc:	00078a63          	beqz	a5,80001af0 <_ZN9Scheduler3getEv+0x34>
        tail = head = nullptr;
    }
    firstThread->nextInScheduler = nullptr;
    80001ae0:	02053823          	sd	zero,48(a0)
    return firstThread;
}
    80001ae4:	00813403          	ld	s0,8(sp)
    80001ae8:	01010113          	addi	sp,sp,16
    80001aec:	00008067          	ret
        tail = head = nullptr;
    80001af0:	00073423          	sd	zero,8(a4)
    80001af4:	00073023          	sd	zero,0(a4)
    80001af8:	fe9ff06f          	j	80001ae0 <_ZN9Scheduler3getEv+0x24>

0000000080001afc <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    80001afc:	ff010113          	addi	sp,sp,-16
    80001b00:	00813423          	sd	s0,8(sp)
    80001b04:	01010413          	addi	s0,sp,16
    tcb->status = TCB::SLEEPING;
    80001b08:	00400793          	li	a5,4
    80001b0c:	04f52c23          	sw	a5,88(a0)
    if (sleepingHead == nullptr) {
    80001b10:	0000b817          	auipc	a6,0xb
    80001b14:	36083803          	ld	a6,864(a6) # 8000ce70 <_ZN9Scheduler12sleepingHeadE>
    80001b18:	02080863          	beqz	a6,80001b48 <_ZN9Scheduler10putToSleepEP3TCBm+0x4c>
        tcb->timeToSleep = sleepTime;
        return;
    }
    TCB* prevSleeping = nullptr;
    time_t accumulated = 0;
    TCB* current = sleepingHead;
    80001b1c:	00080793          	mv	a5,a6
    time_t accumulated = 0;
    80001b20:	00000693          	li	a3,0
    TCB* prevSleeping = nullptr;
    80001b24:	00000613          	li	a2,0
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001b28:	02078863          	beqz	a5,80001b58 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
    80001b2c:	0387b703          	ld	a4,56(a5)
    80001b30:	00d70733          	add	a4,a4,a3
    80001b34:	02b77263          	bgeu	a4,a1,80001b58 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
        accumulated += current->timeToSleep;
    80001b38:	00070693          	mv	a3,a4
        prevSleeping = current;
    80001b3c:	00078613          	mv	a2,a5
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001b40:	0407b783          	ld	a5,64(a5)
    80001b44:	fe5ff06f          	j	80001b28 <_ZN9Scheduler10putToSleepEP3TCBm+0x2c>
        sleepingHead = tcb;
    80001b48:	0000b797          	auipc	a5,0xb
    80001b4c:	32a7b423          	sd	a0,808(a5) # 8000ce70 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80001b50:	02b53c23          	sd	a1,56(a0)
        return;
    80001b54:	02c0006f          	j	80001b80 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    }
    if (!prevSleeping) {
    80001b58:	02060a63          	beqz	a2,80001b8c <_ZN9Scheduler10putToSleepEP3TCBm+0x90>
        sleepingHead = tcb;
        tcb->timeToSleep = sleepTime;
        tcb->nextSleeping->timeToSleep -= sleepTime;
        return;
    }
    tcb->nextSleeping = current;
    80001b5c:	04f53023          	sd	a5,64(a0)
    prevSleeping->nextSleeping = tcb;
    80001b60:	04a63023          	sd	a0,64(a2)
    tcb->timeToSleep = sleepTime - accumulated;
    80001b64:	40d58733          	sub	a4,a1,a3
    80001b68:	02e53c23          	sd	a4,56(a0)
    if (current) current->timeToSleep -= sleepTime - accumulated;
    80001b6c:	00078a63          	beqz	a5,80001b80 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    80001b70:	40b686b3          	sub	a3,a3,a1
    80001b74:	0387b703          	ld	a4,56(a5)
    80001b78:	00d706b3          	add	a3,a4,a3
    80001b7c:	02d7bc23          	sd	a3,56(a5)
}
    80001b80:	00813403          	ld	s0,8(sp)
    80001b84:	01010113          	addi	sp,sp,16
    80001b88:	00008067          	ret
        tcb->nextSleeping = sleepingHead;
    80001b8c:	05053023          	sd	a6,64(a0)
        sleepingHead = tcb;
    80001b90:	0000b797          	auipc	a5,0xb
    80001b94:	2ea7b023          	sd	a0,736(a5) # 8000ce70 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80001b98:	02b53c23          	sd	a1,56(a0)
        tcb->nextSleeping->timeToSleep -= sleepTime;
    80001b9c:	03883683          	ld	a3,56(a6)
    80001ba0:	40b686b3          	sub	a3,a3,a1
    80001ba4:	02d83c23          	sd	a3,56(a6)
        return;
    80001ba8:	fd9ff06f          	j	80001b80 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>

0000000080001bac <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
    if (!sleepingHead) return;
    80001bac:	0000b797          	auipc	a5,0xb
    80001bb0:	2c47b783          	ld	a5,708(a5) # 8000ce70 <_ZN9Scheduler12sleepingHeadE>
    80001bb4:	06078a63          	beqz	a5,80001c28 <_ZN9Scheduler4wakeEv+0x7c>
    sleepingHead->timeToSleep--;
    80001bb8:	0387b703          	ld	a4,56(a5)
    80001bbc:	fff70713          	addi	a4,a4,-1
    80001bc0:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001bc4:	0000b517          	auipc	a0,0xb
    80001bc8:	2ac53503          	ld	a0,684(a0) # 8000ce70 <_ZN9Scheduler12sleepingHeadE>
    80001bcc:	04050e63          	beqz	a0,80001c28 <_ZN9Scheduler4wakeEv+0x7c>
    80001bd0:	03853783          	ld	a5,56(a0)
    80001bd4:	04079a63          	bnez	a5,80001c28 <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    80001bd8:	ff010113          	addi	sp,sp,-16
    80001bdc:	00113423          	sd	ra,8(sp)
    80001be0:	00813023          	sd	s0,0(sp)
    80001be4:	01010413          	addi	s0,sp,16
    80001be8:	00c0006f          	j	80001bf4 <_ZN9Scheduler4wakeEv+0x48>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001bec:	03853783          	ld	a5,56(a0)
    80001bf0:	02079463          	bnez	a5,80001c18 <_ZN9Scheduler4wakeEv+0x6c>
        TCB* thread = sleepingHead;
        sleepingHead = sleepingHead->nextSleeping;
    80001bf4:	04053783          	ld	a5,64(a0)
    80001bf8:	0000b717          	auipc	a4,0xb
    80001bfc:	26f73c23          	sd	a5,632(a4) # 8000ce70 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    80001c00:	04053023          	sd	zero,64(a0)
        Scheduler::put(thread);
    80001c04:	00000097          	auipc	ra,0x0
    80001c08:	e6c080e7          	jalr	-404(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001c0c:	0000b517          	auipc	a0,0xb
    80001c10:	26453503          	ld	a0,612(a0) # 8000ce70 <_ZN9Scheduler12sleepingHeadE>
    80001c14:	fc051ce3          	bnez	a0,80001bec <_ZN9Scheduler4wakeEv+0x40>
    }
}
    80001c18:	00813083          	ld	ra,8(sp)
    80001c1c:	00013403          	ld	s0,0(sp)
    80001c20:	01010113          	addi	sp,sp,16
    80001c24:	00008067          	ret
    80001c28:	00008067          	ret

0000000080001c2c <_ZN7KMemory7kmallocEm>:
    kmalloc(blocksForBitVector);

    initialized = true;
}

void* KMemory::kmalloc(size_t size) {
    80001c2c:	ff010113          	addi	sp,sp,-16
    80001c30:	00813423          	sd	s0,8(sp)
    80001c34:	01010413          	addi	s0,sp,16
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80001c38:	16050063          	beqz	a0,80001d98 <_ZN7KMemory7kmallocEm+0x16c>
    80001c3c:	0000b797          	auipc	a5,0xb
    80001c40:	23c7b783          	ld	a5,572(a5) # 8000ce78 <_ZN7KMemory14freeBlocksLeftE>
    80001c44:	14a7ee63          	bltu	a5,a0,80001da0 <_ZN7KMemory7kmallocEm+0x174>
    uint64 currentElem = 0;
    uint64 currentBit = 63;
    uint64 firstZeroElem = 0;
    uint64 firstZeroBit = 63;
    uint64 zerosFound = 0;
    bool zeroFound = false;
    80001c48:	00000313          	li	t1,0
    uint64 zerosFound = 0;
    80001c4c:	00000713          	li	a4,0
    uint64 firstZeroBit = 63;
    80001c50:	03f00813          	li	a6,63
    uint64 firstZeroElem = 0;
    80001c54:	00000893          	li	a7,0
    uint64 currentBit = 63;
    80001c58:	03f00793          	li	a5,63
    uint64 currentElem = 0;
    80001c5c:	00000593          	li	a1,0
    80001c60:	0080006f          	j	80001c68 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroElem = currentElem;
        } else {
            zerosFound++;
        }
        if (zerosFound == size) break;
        if (currentBit-- == 0) {
    80001c64:	00068793          	mv	a5,a3
    while (currentElem < sizeOfBitVectorInUint64) {
    80001c68:	0000b697          	auipc	a3,0xb
    80001c6c:	2186b683          	ld	a3,536(a3) # 8000ce80 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001c70:	08d5fa63          	bgeu	a1,a3,80001d04 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001c74:	03f00693          	li	a3,63
    80001c78:	02d78a63          	beq	a5,a3,80001cac <_ZN7KMemory7kmallocEm+0x80>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    80001c7c:	00359693          	slli	a3,a1,0x3
    80001c80:	0000b617          	auipc	a2,0xb
    80001c84:	20863603          	ld	a2,520(a2) # 8000ce88 <_ZN7KMemory9bitVectorE>
    80001c88:	00d606b3          	add	a3,a2,a3
    80001c8c:	0006b683          	ld	a3,0(a3)

    static uint64 freeBlocksLeft;

    //maska sa 1 na mestu bitPos i ostalim nulama (bitPos=0..63)
    inline static uint64 maskBit(uint64 bitPos) {
        return (uint64)1 << bitPos;
    80001c90:	00100613          	li	a2,1
    80001c94:	00f61633          	sll	a2,a2,a5
    80001c98:	00c6f6b3          	and	a3,a3,a2
        if (bit > 0) {
    80001c9c:	02069a63          	bnez	a3,80001cd0 <_ZN7KMemory7kmallocEm+0xa4>
        } else if (!zeroFound) {
    80001ca0:	04030863          	beqz	t1,80001cf0 <_ZN7KMemory7kmallocEm+0xc4>
            zerosFound++;
    80001ca4:	00170713          	addi	a4,a4,1
    80001ca8:	0300006f          	j	80001cd8 <_ZN7KMemory7kmallocEm+0xac>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001cac:	00359693          	slli	a3,a1,0x3
    80001cb0:	0000b617          	auipc	a2,0xb
    80001cb4:	1d863603          	ld	a2,472(a2) # 8000ce88 <_ZN7KMemory9bitVectorE>
    80001cb8:	00d606b3          	add	a3,a2,a3
    80001cbc:	0006b603          	ld	a2,0(a3)
    80001cc0:	fff00693          	li	a3,-1
    80001cc4:	fad61ce3          	bne	a2,a3,80001c7c <_ZN7KMemory7kmallocEm+0x50>
            currentElem++;
    80001cc8:	00158593          	addi	a1,a1,1
            continue;
    80001ccc:	f9dff06f          	j	80001c68 <_ZN7KMemory7kmallocEm+0x3c>
            zeroFound = false;
    80001cd0:	00000313          	li	t1,0
            zerosFound = 0;
    80001cd4:	00000713          	li	a4,0
        if (zerosFound == size) break;
    80001cd8:	02a70663          	beq	a4,a0,80001d04 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit-- == 0) {
    80001cdc:	fff78693          	addi	a3,a5,-1
    80001ce0:	f80792e3          	bnez	a5,80001c64 <_ZN7KMemory7kmallocEm+0x38>
            currentBit = 63;
            currentElem++;
    80001ce4:	00158593          	addi	a1,a1,1
            currentBit = 63;
    80001ce8:	03f00793          	li	a5,63
    80001cec:	f7dff06f          	j	80001c68 <_ZN7KMemory7kmallocEm+0x3c>
            firstZeroBit = currentBit;
    80001cf0:	00078813          	mv	a6,a5
            firstZeroElem = currentElem;
    80001cf4:	00058893          	mv	a7,a1
            zeroFound = true;
    80001cf8:	00100313          	li	t1,1
            zerosFound = 1;
    80001cfc:	00100713          	li	a4,1
    80001d00:	fd9ff06f          	j	80001cd8 <_ZN7KMemory7kmallocEm+0xac>
        }
    }
    if (zerosFound != size) return nullptr;
    80001d04:	0aa71263          	bne	a4,a0,80001da8 <_ZN7KMemory7kmallocEm+0x17c>

    //alociranje blokova
    uint64 blockNum = firstZeroElem * 64 + (63 - firstZeroBit);
    80001d08:	00689793          	slli	a5,a7,0x6
    80001d0c:	410787b3          	sub	a5,a5,a6
    80001d10:	03f78793          	addi	a5,a5,63
    void* addr = (char*)HEAP_START_ADDR + blockNum * MEM_BLOCK_SIZE;
    80001d14:	0000b697          	auipc	a3,0xb
    80001d18:	fdc6b683          	ld	a3,-36(a3) # 8000ccf0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001d1c:	0006b583          	ld	a1,0(a3)
    80001d20:	00679793          	slli	a5,a5,0x6
    80001d24:	00f585b3          	add	a1,a1,a5
    *(uint64*)addr = size;  //da znamo koliko blokova je alocirano zaredom
    80001d28:	00a5b023          	sd	a0,0(a1)

    //upisivanje 1 u bit vektor
    currentElem = firstZeroElem;
    currentBit = firstZeroBit;
    80001d2c:	0080006f          	j	80001d34 <_ZN7KMemory7kmallocEm+0x108>
    while (zerosFound > 0) {
        bitVector[currentElem] |= maskBit(currentBit);
        zerosFound--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001d30:	00078813          	mv	a6,a5
    while (zerosFound > 0) {
    80001d34:	04070063          	beqz	a4,80001d74 <_ZN7KMemory7kmallocEm+0x148>
    80001d38:	00100693          	li	a3,1
    80001d3c:	01069633          	sll	a2,a3,a6
        bitVector[currentElem] |= maskBit(currentBit);
    80001d40:	00389793          	slli	a5,a7,0x3
    80001d44:	0000b697          	auipc	a3,0xb
    80001d48:	1446b683          	ld	a3,324(a3) # 8000ce88 <_ZN7KMemory9bitVectorE>
    80001d4c:	00f687b3          	add	a5,a3,a5
    80001d50:	0007b683          	ld	a3,0(a5)
    80001d54:	00c6e6b3          	or	a3,a3,a2
    80001d58:	00d7b023          	sd	a3,0(a5)
        zerosFound--;
    80001d5c:	fff70713          	addi	a4,a4,-1
        if (currentBit-- == 0) {
    80001d60:	fff80793          	addi	a5,a6,-1
    80001d64:	fc0816e3          	bnez	a6,80001d30 <_ZN7KMemory7kmallocEm+0x104>
            currentElem++;
    80001d68:	00188893          	addi	a7,a7,1
            currentBit = 63;
    80001d6c:	03f00793          	li	a5,63
    80001d70:	fc1ff06f          	j	80001d30 <_ZN7KMemory7kmallocEm+0x104>
        }
    }
    freeBlocksLeft -= size;
    80001d74:	0000b717          	auipc	a4,0xb
    80001d78:	10470713          	addi	a4,a4,260 # 8000ce78 <_ZN7KMemory14freeBlocksLeftE>
    80001d7c:	00073783          	ld	a5,0(a4)
    80001d80:	40a78533          	sub	a0,a5,a0
    80001d84:	00a73023          	sd	a0,0(a4)
    return (char*)addr + 2 * sizeof(uint64);    //offset 2 da bi bilo zaokruzeno na 16 zbog steka
    80001d88:	01058513          	addi	a0,a1,16
}
    80001d8c:	00813403          	ld	s0,8(sp)
    80001d90:	01010113          	addi	sp,sp,16
    80001d94:	00008067          	ret
    if (size <= 0 || freeBlocksLeft < size) return nullptr;
    80001d98:	00000513          	li	a0,0
    80001d9c:	ff1ff06f          	j	80001d8c <_ZN7KMemory7kmallocEm+0x160>
    80001da0:	00000513          	li	a0,0
    80001da4:	fe9ff06f          	j	80001d8c <_ZN7KMemory7kmallocEm+0x160>
    if (zerosFound != size) return nullptr;
    80001da8:	00000513          	li	a0,0
    80001dac:	fe1ff06f          	j	80001d8c <_ZN7KMemory7kmallocEm+0x160>

0000000080001db0 <_ZN7KMemory16initializeMemoryEv>:
    if (initialized) return;
    80001db0:	0000b797          	auipc	a5,0xb
    80001db4:	0e07c783          	lbu	a5,224(a5) # 8000ce90 <_ZN7KMemory11initializedE>
    80001db8:	0a079863          	bnez	a5,80001e68 <_ZN7KMemory16initializeMemoryEv+0xb8>
void KMemory::initializeMemory() {
    80001dbc:	ff010113          	addi	sp,sp,-16
    80001dc0:	00113423          	sd	ra,8(sp)
    80001dc4:	00813023          	sd	s0,0(sp)
    80001dc8:	01010413          	addi	s0,sp,16
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001dcc:	0000b797          	auipc	a5,0xb
    80001dd0:	f6c7b783          	ld	a5,-148(a5) # 8000cd38 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001dd4:	0007b783          	ld	a5,0(a5)
    80001dd8:	0000b717          	auipc	a4,0xb
    80001ddc:	f1873703          	ld	a4,-232(a4) # 8000ccf0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001de0:	00073603          	ld	a2,0(a4)
    80001de4:	40c787b3          	sub	a5,a5,a2
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    80001de8:	00c7d793          	srli	a5,a5,0xc
    80001dec:	0000b717          	auipc	a4,0xb
    80001df0:	08c70713          	addi	a4,a4,140 # 8000ce78 <_ZN7KMemory14freeBlocksLeftE>
    80001df4:	00f73423          	sd	a5,8(a4)
    numOfBlocks = sizeOfBitVectorInUint64 * sizeof(uint64) * 8; //da se zaokruzi broj postojecih blokova na umnozak 64
    80001df8:	00679693          	slli	a3,a5,0x6
    80001dfc:	02d73023          	sd	a3,32(a4)
    uint64 blocksForBitVector = (sizeOfBitVectorInUint64 * sizeof(uint64) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80001e00:	00878513          	addi	a0,a5,8
    80001e04:	00351513          	slli	a0,a0,0x3
    80001e08:	fff50513          	addi	a0,a0,-1
    80001e0c:	00655513          	srli	a0,a0,0x6
    bitVector = (uint64*)HEAP_START_ADDR;
    80001e10:	00c73823          	sd	a2,16(a4)
    freeBlocksLeft = numOfBlocks;
    80001e14:	00d73023          	sd	a3,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001e18:	00000793          	li	a5,0
    80001e1c:	0000b717          	auipc	a4,0xb
    80001e20:	06473703          	ld	a4,100(a4) # 8000ce80 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001e24:	02e7f063          	bgeu	a5,a4,80001e44 <_ZN7KMemory16initializeMemoryEv+0x94>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    80001e28:	00379693          	slli	a3,a5,0x3
    80001e2c:	0000b717          	auipc	a4,0xb
    80001e30:	05c73703          	ld	a4,92(a4) # 8000ce88 <_ZN7KMemory9bitVectorE>
    80001e34:	00d70733          	add	a4,a4,a3
    80001e38:	00073023          	sd	zero,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001e3c:	00178793          	addi	a5,a5,1
    80001e40:	fddff06f          	j	80001e1c <_ZN7KMemory16initializeMemoryEv+0x6c>
    kmalloc(blocksForBitVector);
    80001e44:	00000097          	auipc	ra,0x0
    80001e48:	de8080e7          	jalr	-536(ra) # 80001c2c <_ZN7KMemory7kmallocEm>
    initialized = true;
    80001e4c:	00100793          	li	a5,1
    80001e50:	0000b717          	auipc	a4,0xb
    80001e54:	04f70023          	sb	a5,64(a4) # 8000ce90 <_ZN7KMemory11initializedE>
}
    80001e58:	00813083          	ld	ra,8(sp)
    80001e5c:	00013403          	ld	s0,0(sp)
    80001e60:	01010113          	addi	sp,sp,16
    80001e64:	00008067          	ret
    80001e68:	00008067          	ret

0000000080001e6c <_ZN7KMemory5kfreeEPv>:

int KMemory::kfree(void* ptr) {
    80001e6c:	ff010113          	addi	sp,sp,-16
    80001e70:	00813423          	sd	s0,8(sp)
    80001e74:	01010413          	addi	s0,sp,16
    if (!ptr) return 0;
    80001e78:	08050a63          	beqz	a0,80001f0c <_ZN7KMemory5kfreeEPv+0xa0>
    ptr = (char*)ptr - 2 * sizeof(uint64);
    80001e7c:	ff050793          	addi	a5,a0,-16
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001e80:	0000b717          	auipc	a4,0xb
    80001e84:	e7073703          	ld	a4,-400(a4) # 8000ccf0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001e88:	00073703          	ld	a4,0(a4)
    80001e8c:	40e787b3          	sub	a5,a5,a4
    80001e90:	03f7f713          	andi	a4,a5,63
    80001e94:	08071063          	bnez	a4,80001f14 <_ZN7KMemory5kfreeEPv+0xa8>
    uint64 blocksToFree = *(uint64*)ptr;
    80001e98:	ff053583          	ld	a1,-16(a0)
    freeBlocksLeft += blocksToFree;
    80001e9c:	0000b697          	auipc	a3,0xb
    80001ea0:	fdc68693          	addi	a3,a3,-36 # 8000ce78 <_ZN7KMemory14freeBlocksLeftE>
    80001ea4:	0006b703          	ld	a4,0(a3)
    80001ea8:	00b70733          	add	a4,a4,a1
    80001eac:	00e6b023          	sd	a4,0(a3)
    uint64 blockNum = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    80001eb0:	0067d613          	srli	a2,a5,0x6
    uint64 currentElem = blockNum / 64;
    80001eb4:	00c7d513          	srli	a0,a5,0xc
    uint64 currentBit = 63 - blockNum % 64;
    80001eb8:	fff64613          	not	a2,a2
    80001ebc:	03f67613          	andi	a2,a2,63
    80001ec0:	0080006f          	j	80001ec8 <_ZN7KMemory5kfreeEPv+0x5c>
    while (blocksToFree > 0) {
        bitVector[currentElem] &= ~maskBit(currentBit);
        blocksToFree--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001ec4:	00078613          	mv	a2,a5
    while (blocksToFree > 0) {
    80001ec8:	04058a63          	beqz	a1,80001f1c <_ZN7KMemory5kfreeEPv+0xb0>
    80001ecc:	00100793          	li	a5,1
    80001ed0:	00c797b3          	sll	a5,a5,a2
        bitVector[currentElem] &= ~maskBit(currentBit);
    80001ed4:	fff7c793          	not	a5,a5
    80001ed8:	00351713          	slli	a4,a0,0x3
    80001edc:	0000b697          	auipc	a3,0xb
    80001ee0:	fac6b683          	ld	a3,-84(a3) # 8000ce88 <_ZN7KMemory9bitVectorE>
    80001ee4:	00e68733          	add	a4,a3,a4
    80001ee8:	00073683          	ld	a3,0(a4)
    80001eec:	00f6f7b3          	and	a5,a3,a5
    80001ef0:	00f73023          	sd	a5,0(a4)
        blocksToFree--;
    80001ef4:	fff58593          	addi	a1,a1,-1
        if (currentBit-- == 0) {
    80001ef8:	fff60793          	addi	a5,a2,-1
    80001efc:	fc0614e3          	bnez	a2,80001ec4 <_ZN7KMemory5kfreeEPv+0x58>
            currentElem++;
    80001f00:	00150513          	addi	a0,a0,1
            currentBit = 63;
    80001f04:	03f00793          	li	a5,63
    80001f08:	fbdff06f          	j	80001ec4 <_ZN7KMemory5kfreeEPv+0x58>
    if (!ptr) return 0;
    80001f0c:	00000513          	li	a0,0
    80001f10:	0100006f          	j	80001f20 <_ZN7KMemory5kfreeEPv+0xb4>
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001f14:	fff00513          	li	a0,-1
    80001f18:	0080006f          	j	80001f20 <_ZN7KMemory5kfreeEPv+0xb4>
        }
    }
    return 0;
    80001f1c:	00000513          	li	a0,0
}
    80001f20:	00813403          	ld	s0,8(sp)
    80001f24:	01010113          	addi	sp,sp,16
    80001f28:	00008067          	ret

0000000080001f2c <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80001f2c:	ff010113          	addi	sp,sp,-16
    80001f30:	00113423          	sd	ra,8(sp)
    80001f34:	00813023          	sd	s0,0(sp)
    80001f38:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80001f3c:	fffff097          	auipc	ra,0xfffff
    80001f40:	4f8080e7          	jalr	1272(ra) # 80001434 <_Z15thread_dispatchv>
    80001f44:	ff9ff06f          	j	80001f3c <_Z4idlePv+0x10>

0000000080001f48 <_Z22kernelConsumerFunctionPv>:
}

void kernelConsumerFunction(void*) {
    80001f48:	ff010113          	addi	sp,sp,-16
    80001f4c:	00113423          	sd	ra,8(sp)
    80001f50:	00813023          	sd	s0,0(sp)
    80001f54:	01010413          	addi	s0,sp,16
    80001f58:	0280006f          	j	80001f80 <_Z22kernelConsumerFunctionPv+0x38>
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
        *KConsole::dr = c;
    80001f5c:	0000b797          	auipc	a5,0xb
    80001f60:	dbc7b783          	ld	a5,-580(a5) # 8000cd18 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001f64:	0007b783          	ld	a5,0(a5)
    80001f68:	00a78023          	sb	a0,0(a5)
        sem_signal(KConsole::outputBufferHasSpace);
    80001f6c:	0000b797          	auipc	a5,0xb
    80001f70:	dbc7b783          	ld	a5,-580(a5) # 8000cd28 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001f74:	0007b503          	ld	a0,0(a5)
    80001f78:	fffff097          	auipc	ra,0xfffff
    80001f7c:	5cc080e7          	jalr	1484(ra) # 80001544 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001f80:	00000097          	auipc	ra,0x0
    80001f84:	8a0080e7          	jalr	-1888(ra) # 80001820 <_ZN8KConsole13getFromOutputEv>
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
    80001f88:	0000b797          	auipc	a5,0xb
    80001f8c:	dd07b783          	ld	a5,-560(a5) # 8000cd58 <_GLOBAL_OFFSET_TABLE_+0x90>
    80001f90:	0007b783          	ld	a5,0(a5)
    80001f94:	0007c783          	lbu	a5,0(a5)
    80001f98:	0207f793          	andi	a5,a5,32
    80001f9c:	fe0786e3          	beqz	a5,80001f88 <_Z22kernelConsumerFunctionPv+0x40>
    80001fa0:	fbdff06f          	j	80001f5c <_Z22kernelConsumerFunctionPv+0x14>

0000000080001fa4 <_Z5main2v>:
    }
}

int main2() {
    80001fa4:	fd010113          	addi	sp,sp,-48
    80001fa8:	02113423          	sd	ra,40(sp)
    80001fac:	02813023          	sd	s0,32(sp)
    80001fb0:	03010413          	addi	s0,sp,48
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001fb4:	0000b797          	auipc	a5,0xb
    80001fb8:	d8c7b783          	ld	a5,-628(a5) # 8000cd40 <_GLOBAL_OFFSET_TABLE_+0x78>
    80001fbc:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80001fc0:	00000097          	auipc	ra,0x0
    80001fc4:	df0080e7          	jalr	-528(ra) # 80001db0 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001fc8:	fffff097          	auipc	ra,0xfffff
    80001fcc:	6b8080e7          	jalr	1720(ra) # 80001680 <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    80001fd0:	00000613          	li	a2,0
    80001fd4:	0000b597          	auipc	a1,0xb
    80001fd8:	d4c5b583          	ld	a1,-692(a1) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001fdc:	fe840513          	addi	a0,s0,-24
    80001fe0:	fffff097          	auipc	ra,0xfffff
    80001fe4:	398080e7          	jalr	920(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80001fe8:	fe843783          	ld	a5,-24(s0)

    Body getBody() { return threadFunction; }

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }
    80001fec:	0000b717          	auipc	a4,0xb
    80001ff0:	d4473703          	ld	a4,-700(a4) # 8000cd30 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001ff4:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001ff8:	00100713          	li	a4,1
    80001ffc:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    80002000:	00000613          	li	a2,0
    80002004:	0000b597          	auipc	a1,0xb
    80002008:	ccc5b583          	ld	a1,-820(a1) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000200c:	fe040513          	addi	a0,s0,-32
    80002010:	fffff097          	auipc	ra,0xfffff
    80002014:	368080e7          	jalr	872(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80002018:	00000613          	li	a2,0
    8000201c:	00000597          	auipc	a1,0x0
    80002020:	f2c58593          	addi	a1,a1,-212 # 80001f48 <_Z22kernelConsumerFunctionPv>
    80002024:	fd040513          	addi	a0,s0,-48
    80002028:	fffff097          	auipc	ra,0xfffff
    8000202c:	350080e7          	jalr	848(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80002030:	00000613          	li	a2,0
    80002034:	00000597          	auipc	a1,0x0
    80002038:	ef858593          	addi	a1,a1,-264 # 80001f2c <_Z4idlePv>
    8000203c:	fd840513          	addi	a0,s0,-40
    80002040:	fffff097          	auipc	ra,0xfffff
    80002044:	338080e7          	jalr	824(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002048:	00200793          	li	a5,2
    8000204c:	1007a073          	csrs	sstatus,a5

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80002050:	fe043503          	ld	a0,-32(s0)
    80002054:	fffff097          	auipc	ra,0xfffff
    80002058:	400080e7          	jalr	1024(ra) # 80001454 <_Z11thread_joinP3TCB>

    //flush output bafera za konzolu
    while (KConsole::outputHead != KConsole::outputTail) {}
    8000205c:	0000b797          	auipc	a5,0xb
    80002060:	cac7b783          	ld	a5,-852(a5) # 8000cd08 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002064:	0007a703          	lw	a4,0(a5)
    80002068:	0000b797          	auipc	a5,0xb
    8000206c:	ce87b783          	ld	a5,-792(a5) # 8000cd50 <_GLOBAL_OFFSET_TABLE_+0x88>
    80002070:	0007a783          	lw	a5,0(a5)
    80002074:	fef714e3          	bne	a4,a5,8000205c <_Z5main2v+0xb8>
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002078:	00200793          	li	a5,2
    8000207c:	1007b073          	csrc	sstatus,a5

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80002080:	00000513          	li	a0,0
    80002084:	02813083          	ld	ra,40(sp)
    80002088:	02013403          	ld	s0,32(sp)
    8000208c:	03010113          	addi	sp,sp,48
    80002090:	00008067          	ret

0000000080002094 <interruptRoutine>:
#include "../h/Scheduler.hpp"

int main();

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80002094:	f9010113          	addi	sp,sp,-112
    80002098:	06113423          	sd	ra,104(sp)
    8000209c:	06813023          	sd	s0,96(sp)
    800020a0:	04913c23          	sd	s1,88(sp)
    800020a4:	07010413          	addi	s0,sp,112
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020a8:	14202373          	csrr	t1,scause
    800020ac:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020b0:	14102373          	csrr	t1,sepc
    800020b4:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020b8:	10002373          	csrr	t1,sstatus
    800020bc:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4;
    //uint64 a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020c0:	00050313          	mv	t1,a0
    800020c4:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020c8:	00058313          	mv	t1,a1
    800020cc:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020d0:	00060313          	mv	t1,a2
    800020d4:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020d8:	00068313          	mv	t1,a3
    800020dc:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020e0:	00070313          	mv	t1,a4
    800020e4:	fa643023          	sd	t1,-96(s0)
//    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");

    if (scause == 0x9 || scause == 0x8) {
    800020e8:	fd843703          	ld	a4,-40(s0)
    800020ec:	00900793          	li	a5,9
    800020f0:	00f70863          	beq	a4,a5,80002100 <interruptRoutine+0x6c>
    800020f4:	fd843703          	ld	a4,-40(s0)
    800020f8:	00800793          	li	a5,8
    800020fc:	3cf71663          	bne	a4,a5,800024c8 <interruptRoutine+0x434>
        //prekid zbog poziva ecall
        switch (a0) {
    80002100:	fc043703          	ld	a4,-64(s0)
    80002104:	09100793          	li	a5,145
    80002108:	32f70263          	beq	a4,a5,8000242c <interruptRoutine+0x398>
    8000210c:	fc043703          	ld	a4,-64(s0)
    80002110:	09100793          	li	a5,145
    80002114:	32e7e463          	bltu	a5,a4,8000243c <interruptRoutine+0x3a8>
    80002118:	fc043703          	ld	a4,-64(s0)
    8000211c:	08100793          	li	a5,129
    80002120:	2cf70663          	beq	a4,a5,800023ec <interruptRoutine+0x358>
    80002124:	fc043703          	ld	a4,-64(s0)
    80002128:	08100793          	li	a5,129
    8000212c:	30e7e863          	bltu	a5,a4,8000243c <interruptRoutine+0x3a8>
    80002130:	fc043703          	ld	a4,-64(s0)
    80002134:	04200793          	li	a5,66
    80002138:	04e7e263          	bltu	a5,a4,8000217c <interruptRoutine+0xe8>
    8000213c:	fc043783          	ld	a5,-64(s0)
    80002140:	2e078e63          	beqz	a5,8000243c <interruptRoutine+0x3a8>
    80002144:	fc043703          	ld	a4,-64(s0)
    80002148:	04200793          	li	a5,66
    8000214c:	2ee7e863          	bltu	a5,a4,8000243c <interruptRoutine+0x3a8>
    80002150:	fc043783          	ld	a5,-64(s0)
    80002154:	00279713          	slli	a4,a5,0x2
    80002158:	00008797          	auipc	a5,0x8
    8000215c:	f9c78793          	addi	a5,a5,-100 # 8000a0f4 <_ZZ9kPrintIntmE6digits+0x84>
    80002160:	00f707b3          	add	a5,a4,a5
    80002164:	0007a783          	lw	a5,0(a5)
    80002168:	0007871b          	sext.w	a4,a5
    8000216c:	00008797          	auipc	a5,0x8
    80002170:	f8878793          	addi	a5,a5,-120 # 8000a0f4 <_ZZ9kPrintIntmE6digits+0x84>
    80002174:	00f707b3          	add	a5,a4,a5
    80002178:	00078067          	jr	a5
    8000217c:	fc043703          	ld	a4,-64(s0)
    80002180:	08000793          	li	a5,128
    80002184:	20f70e63          	beq	a4,a5,800023a0 <interruptRoutine+0x30c>
    80002188:	2b40006f          	j	8000243c <interruptRoutine+0x3a8>
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                KMemory::kmalloc((size_t)a1);
    8000218c:	fb843503          	ld	a0,-72(s0)
    80002190:	00000097          	auipc	ra,0x0
    80002194:	a9c080e7          	jalr	-1380(ra) # 80001c2c <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    80002198:	04a43823          	sd	a0,80(s0)
                break;
    8000219c:	30c0006f          	j	800024a8 <interruptRoutine+0x414>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                KMemory::kfree((void*)a1);
    800021a0:	fb843783          	ld	a5,-72(s0)
    800021a4:	00078513          	mv	a0,a5
    800021a8:	00000097          	auipc	ra,0x0
    800021ac:	cc4080e7          	jalr	-828(ra) # 80001e6c <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    800021b0:	04a43823          	sd	a0,80(s0)
                break;
    800021b4:	2f40006f          	j	800024a8 <interruptRoutine+0x414>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    800021b8:	fb043783          	ld	a5,-80(s0)
    800021bc:	fa843703          	ld	a4,-88(s0)
    800021c0:	fa043683          	ld	a3,-96(s0)
    800021c4:	fb843483          	ld	s1,-72(s0)
    800021c8:	00068613          	mv	a2,a3
    800021cc:	00070593          	mv	a1,a4
    800021d0:	00078513          	mv	a0,a5
    800021d4:	00001097          	auipc	ra,0x1
    800021d8:	d40080e7          	jalr	-704(ra) # 80002f14 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800021dc:	00050793          	mv	a5,a0
    800021e0:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    800021e4:	fb843783          	ld	a5,-72(s0)
    800021e8:	0007b783          	ld	a5,0(a5)
    800021ec:	02078863          	beqz	a5,8000221c <interruptRoutine+0x188>
                    if ((TCB::Body)a2 != (TCB::Body)main) {
    800021f0:	fb043703          	ld	a4,-80(s0)
    800021f4:	0000b797          	auipc	a5,0xb
    800021f8:	b2c7b783          	ld	a5,-1236(a5) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x58>
    800021fc:	00f70c63          	beq	a4,a5,80002214 <interruptRoutine+0x180>
                        Scheduler::put(*((thread_t*)a1));
    80002200:	fb843783          	ld	a5,-72(s0)
    80002204:	0007b783          	ld	a5,0(a5)
    80002208:	00078513          	mv	a0,a5
    8000220c:	00000097          	auipc	ra,0x0
    80002210:	864080e7          	jalr	-1948(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
                    }
                    __asm__ volatile("li a0, 0");
    80002214:	00000513          	li	a0,0
    80002218:	0080006f          	j	80002220 <interruptRoutine+0x18c>
                } else {
                    __asm__ volatile("li a0, -1");
    8000221c:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002220:	04a43823          	sd	a0,80(s0)
                break;
    80002224:	2840006f          	j	800024a8 <interruptRoutine+0x414>
            case 0x12:
                //thread_exit
                TCB::getRunning()->setStatus(TCB::FINISHED);
    80002228:	00000097          	auipc	ra,0x0
    8000222c:	510080e7          	jalr	1296(ra) # 80002738 <_ZN3TCB10getRunningEv>
    80002230:	00050793          	mv	a5,a0
    80002234:	00500593          	li	a1,5
    80002238:	00078513          	mv	a0,a5
    8000223c:	00000097          	auipc	ra,0x0
    80002240:	4a8080e7          	jalr	1192(ra) # 800026e4 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined();
    80002244:	00001097          	auipc	ra,0x1
    80002248:	dfc080e7          	jalr	-516(ra) # 80003040 <_ZN3TCB13releaseJoinedEv>
                __asm__ volatile("li a0, 0");
    8000224c:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 80(s0)");
    80002250:	04a43823          	sd	a0,80(s0)
                TCB::dispatch();
    80002254:	00001097          	auipc	ra,0x1
    80002258:	be4080e7          	jalr	-1052(ra) # 80002e38 <_ZN3TCB8dispatchEv>
                break;
    8000225c:	24c0006f          	j	800024a8 <interruptRoutine+0x414>
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
    80002260:	00001097          	auipc	ra,0x1
    80002264:	bd8080e7          	jalr	-1064(ra) # 80002e38 <_ZN3TCB8dispatchEv>
                break;
    80002268:	2400006f          	j	800024a8 <interruptRoutine+0x414>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    8000226c:	fb843783          	ld	a5,-72(s0)
    80002270:	00078513          	mv	a0,a5
    80002274:	00001097          	auipc	ra,0x1
    80002278:	d7c080e7          	jalr	-644(ra) # 80002ff0 <_ZN3TCB10threadJoinEPS_>
                TCB::dispatch();
    8000227c:	00001097          	auipc	ra,0x1
    80002280:	bbc080e7          	jalr	-1092(ra) # 80002e38 <_ZN3TCB8dispatchEv>
                break;
    80002284:	2240006f          	j	800024a8 <interruptRoutine+0x414>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    80002288:	fb043783          	ld	a5,-80(s0)
    8000228c:	0007879b          	sext.w	a5,a5
    80002290:	fb843483          	ld	s1,-72(s0)
    80002294:	00078513          	mv	a0,a5
    80002298:	00001097          	auipc	ra,0x1
    8000229c:	eac080e7          	jalr	-340(ra) # 80003144 <_ZN4KSem7initSemEj>
    800022a0:	00050793          	mv	a5,a0
    800022a4:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    800022a8:	fb843783          	ld	a5,-72(s0)
    800022ac:	0007b783          	ld	a5,0(a5)
    800022b0:	00078663          	beqz	a5,800022bc <interruptRoutine+0x228>
                    __asm__ volatile("li a0, 0");
    800022b4:	00000513          	li	a0,0
    800022b8:	0080006f          	j	800022c0 <interruptRoutine+0x22c>
                } else {
                    __asm__ volatile("li a0, -1");
    800022bc:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800022c0:	04a43823          	sd	a0,80(s0)
                break;
    800022c4:	1e40006f          	j	800024a8 <interruptRoutine+0x414>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    800022c8:	fb843783          	ld	a5,-72(s0)
    800022cc:	00078513          	mv	a0,a5
    800022d0:	00001097          	auipc	ra,0x1
    800022d4:	fe8080e7          	jalr	-24(ra) # 800032b8 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    800022d8:	04a43823          	sd	a0,80(s0)
                delete (sem_t)a1;
    800022dc:	fb843483          	ld	s1,-72(s0)
    800022e0:	1a048a63          	beqz	s1,80002494 <interruptRoutine+0x400>
    800022e4:	00048513          	mv	a0,s1
    800022e8:	00000097          	auipc	ra,0x0
    800022ec:	394080e7          	jalr	916(ra) # 8000267c <_ZN4KSemD1Ev>
    800022f0:	00048513          	mv	a0,s1
    800022f4:	00001097          	auipc	ra,0x1
    800022f8:	e28080e7          	jalr	-472(ra) # 8000311c <_ZN4KSemdlEPv>
                break;
    800022fc:	1980006f          	j	80002494 <interruptRoutine+0x400>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80002300:	fb843783          	ld	a5,-72(s0)
    80002304:	00078513          	mv	a0,a5
    80002308:	00001097          	auipc	ra,0x1
    8000230c:	ed0080e7          	jalr	-304(ra) # 800031d8 <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002310:	04a43823          	sd	a0,80(s0)
                break;
    80002314:	1940006f          	j	800024a8 <interruptRoutine+0x414>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    80002318:	fb843783          	ld	a5,-72(s0)
    8000231c:	00078513          	mv	a0,a5
    80002320:	00001097          	auipc	ra,0x1
    80002324:	f44080e7          	jalr	-188(ra) # 80003264 <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002328:	04a43823          	sd	a0,80(s0)
                break;
    8000232c:	17c0006f          	j	800024a8 <interruptRoutine+0x414>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    80002330:	fb843783          	ld	a5,-72(s0)
    80002334:	00078663          	beqz	a5,80002340 <interruptRoutine+0x2ac>
                    __asm__ volatile("li a0, 0");
    80002338:	00000513          	li	a0,0
    8000233c:	0080006f          	j	80002344 <interruptRoutine+0x2b0>
                } else {
                    __asm__ volatile("li a0, -1");
    80002340:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002344:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    80002348:	fb843783          	ld	a5,-72(s0)
    8000234c:	14078863          	beqz	a5,8000249c <interruptRoutine+0x408>
                    Scheduler::putToSleep(TCB::getRunning(), (time_t)a1);
    80002350:	00000097          	auipc	ra,0x0
    80002354:	3e8080e7          	jalr	1000(ra) # 80002738 <_ZN3TCB10getRunningEv>
    80002358:	00050793          	mv	a5,a0
    8000235c:	fb843583          	ld	a1,-72(s0)
    80002360:	00078513          	mv	a0,a5
    80002364:	fffff097          	auipc	ra,0xfffff
    80002368:	798080e7          	jalr	1944(ra) # 80001afc <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::dispatch();
    8000236c:	00001097          	auipc	ra,0x1
    80002370:	acc080e7          	jalr	-1332(ra) # 80002e38 <_ZN3TCB8dispatchEv>
                }
                break;
    80002374:	1280006f          	j	8000249c <interruptRoutine+0x408>
            case 0x41:
                //getc
                KConsole::kgetc();
    80002378:	fffff097          	auipc	ra,0xfffff
    8000237c:	5dc080e7          	jalr	1500(ra) # 80001954 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002380:	04a43823          	sd	a0,80(s0)
                break;
    80002384:	1240006f          	j	800024a8 <interruptRoutine+0x414>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    80002388:	fb843783          	ld	a5,-72(s0)
    8000238c:	0ff7f793          	andi	a5,a5,255
    80002390:	00078513          	mv	a0,a5
    80002394:	fffff097          	auipc	ra,0xfffff
    80002398:	550080e7          	jalr	1360(ra) # 800018e4 <_ZN8KConsole5kputcEc>
                break;
    8000239c:	10c0006f          	j	800024a8 <interruptRoutine+0x414>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    800023a0:	fb043783          	ld	a5,-80(s0)
    800023a4:	fa843703          	ld	a4,-88(s0)
    800023a8:	fa043683          	ld	a3,-96(s0)
    800023ac:	fb843483          	ld	s1,-72(s0)
    800023b0:	00068613          	mv	a2,a3
    800023b4:	00070593          	mv	a1,a4
    800023b8:	00078513          	mv	a0,a5
    800023bc:	00001097          	auipc	ra,0x1
    800023c0:	b58080e7          	jalr	-1192(ra) # 80002f14 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800023c4:	00050793          	mv	a5,a0
    800023c8:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    800023cc:	fb843783          	ld	a5,-72(s0)
    800023d0:	0007b783          	ld	a5,0(a5)
    800023d4:	00078663          	beqz	a5,800023e0 <interruptRoutine+0x34c>
                    __asm__ volatile("li a0, 0");
    800023d8:	00000513          	li	a0,0
    800023dc:	0080006f          	j	800023e4 <interruptRoutine+0x350>
                } else {
                    __asm__ volatile("li a0, -1");
    800023e0:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800023e4:	04a43823          	sd	a0,80(s0)
                break;
    800023e8:	0c00006f          	j	800024a8 <interruptRoutine+0x414>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                if (((thread_t)a1)->getBody() != (TCB::Body)main) {
    800023ec:	fb843783          	ld	a5,-72(s0)
    800023f0:	00078513          	mv	a0,a5
    800023f4:	00000097          	auipc	ra,0x0
    800023f8:	328080e7          	jalr	808(ra) # 8000271c <_ZN3TCB7getBodyEv>
    800023fc:	00050713          	mv	a4,a0
    80002400:	0000b797          	auipc	a5,0xb
    80002404:	9207b783          	ld	a5,-1760(a5) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002408:	40f707b3          	sub	a5,a4,a5
    8000240c:	00f037b3          	snez	a5,a5
    80002410:	0ff7f793          	andi	a5,a5,255
    80002414:	08078863          	beqz	a5,800024a4 <interruptRoutine+0x410>
                    Scheduler::put((thread_t)a1);
    80002418:	fb843783          	ld	a5,-72(s0)
    8000241c:	00078513          	mv	a0,a5
    80002420:	fffff097          	auipc	ra,0xfffff
    80002424:	650080e7          	jalr	1616(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
                }
                break;
    80002428:	07c0006f          	j	800024a4 <interruptRoutine+0x410>
            case 0x91:
                //printInteger
                //a1 = integer za ispis
                kPrintInt(a1);
    8000242c:	fb843503          	ld	a0,-72(s0)
    80002430:	fffff097          	auipc	ra,0xfffff
    80002434:	5b0080e7          	jalr	1456(ra) # 800019e0 <_Z9kPrintIntm>
                break;
    80002438:	0700006f          	j	800024a8 <interruptRoutine+0x414>
            default:
                printString("\nNepostojeci op code: ");
    8000243c:	00008517          	auipc	a0,0x8
    80002440:	c4450513          	addi	a0,a0,-956 # 8000a080 <_ZZ9kPrintIntmE6digits+0x10>
    80002444:	00004097          	auipc	ra,0x4
    80002448:	900080e7          	jalr	-1792(ra) # 80005d44 <_Z11printStringPKc>
                kPrintInt(a0);
    8000244c:	fc043503          	ld	a0,-64(s0)
    80002450:	fffff097          	auipc	ra,0xfffff
    80002454:	590080e7          	jalr	1424(ra) # 800019e0 <_Z9kPrintIntm>
                printString("\nscause: ");
    80002458:	00008517          	auipc	a0,0x8
    8000245c:	c4050513          	addi	a0,a0,-960 # 8000a098 <_ZZ9kPrintIntmE6digits+0x28>
    80002460:	00004097          	auipc	ra,0x4
    80002464:	8e4080e7          	jalr	-1820(ra) # 80005d44 <_Z11printStringPKc>
                kPrintInt(scause);
    80002468:	fd843503          	ld	a0,-40(s0)
    8000246c:	fffff097          	auipc	ra,0xfffff
    80002470:	574080e7          	jalr	1396(ra) # 800019e0 <_Z9kPrintIntm>
                printString("\nsepc: ");
    80002474:	00008517          	auipc	a0,0x8
    80002478:	c3450513          	addi	a0,a0,-972 # 8000a0a8 <_ZZ9kPrintIntmE6digits+0x38>
    8000247c:	00004097          	auipc	ra,0x4
    80002480:	8c8080e7          	jalr	-1848(ra) # 80005d44 <_Z11printStringPKc>
                kPrintInt(sepc);
    80002484:	fd043503          	ld	a0,-48(s0)
    80002488:	fffff097          	auipc	ra,0xfffff
    8000248c:	558080e7          	jalr	1368(ra) # 800019e0 <_Z9kPrintIntm>
                break;
    80002490:	0180006f          	j	800024a8 <interruptRoutine+0x414>
                break;
    80002494:	00000013          	nop
    80002498:	0100006f          	j	800024a8 <interruptRoutine+0x414>
                break;
    8000249c:	00000013          	nop
    800024a0:	0080006f          	j	800024a8 <interruptRoutine+0x414>
                break;
    800024a4:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    800024a8:	fd043783          	ld	a5,-48(s0)
    800024ac:	00478793          	addi	a5,a5,4
    800024b0:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800024b4:	fd043783          	ld	a5,-48(s0)
    800024b8:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800024bc:	fc843783          	ld	a5,-56(s0)
    800024c0:	10079073          	csrw	sstatus,a5
        printString("\nsepc: ");
        kPrintInt(sepc);
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    }
    800024c4:	1a00006f          	j	80002664 <interruptRoutine+0x5d0>
    } else if (scause == 0x8000000000000009) {
    800024c8:	fd843703          	ld	a4,-40(s0)
    800024cc:	fff00793          	li	a5,-1
    800024d0:	03f79793          	slli	a5,a5,0x3f
    800024d4:	00978793          	addi	a5,a5,9
    800024d8:	08f71e63          	bne	a4,a5,80002574 <interruptRoutine+0x4e0>
        uint64 irq = plic_claim();
    800024dc:	00006097          	auipc	ra,0x6
    800024e0:	8b8080e7          	jalr	-1864(ra) # 80007d94 <plic_claim>
    800024e4:	00050793          	mv	a5,a0
    800024e8:	f8f43c23          	sd	a5,-104(s0)
        if (irq == CONSOLE_IRQ) {
    800024ec:	f9843703          	ld	a4,-104(s0)
    800024f0:	00a00793          	li	a5,10
    800024f4:	02f71e63          	bne	a4,a5,80002530 <interruptRoutine+0x49c>
            if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    800024f8:	0000b797          	auipc	a5,0xb
    800024fc:	8607b783          	ld	a5,-1952(a5) # 8000cd58 <_GLOBAL_OFFSET_TABLE_+0x90>
    80002500:	0007b783          	ld	a5,0(a5)
    80002504:	0007c783          	lbu	a5,0(a5)
    80002508:	0017f793          	andi	a5,a5,1
    8000250c:	02078a63          	beqz	a5,80002540 <interruptRoutine+0x4ac>
                KConsole::placeInInput(*KConsole::dr);
    80002510:	0000b797          	auipc	a5,0xb
    80002514:	8087b783          	ld	a5,-2040(a5) # 8000cd18 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002518:	0007b783          	ld	a5,0(a5)
    8000251c:	0007c783          	lbu	a5,0(a5)
    80002520:	00078513          	mv	a0,a5
    80002524:	fffff097          	auipc	ra,0xfffff
    80002528:	354080e7          	jalr	852(ra) # 80001878 <_ZN8KConsole12placeInInputEc>
    8000252c:	0140006f          	j	80002540 <interruptRoutine+0x4ac>
            printString("Neki drugi prekid\n");
    80002530:	00008517          	auipc	a0,0x8
    80002534:	b8050513          	addi	a0,a0,-1152 # 8000a0b0 <_ZZ9kPrintIntmE6digits+0x40>
    80002538:	00004097          	auipc	ra,0x4
    8000253c:	80c080e7          	jalr	-2036(ra) # 80005d44 <_Z11printStringPKc>
        plic_complete(irq);
    80002540:	f9843783          	ld	a5,-104(s0)
    80002544:	0007879b          	sext.w	a5,a5
    80002548:	00078513          	mv	a0,a5
    8000254c:	00006097          	auipc	ra,0x6
    80002550:	880080e7          	jalr	-1920(ra) # 80007dcc <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002554:	fd043783          	ld	a5,-48(s0)
    80002558:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    8000255c:	fc843783          	ld	a5,-56(s0)
    80002560:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    80002564:	20000513          	li	a0,512
    80002568:	00000097          	auipc	ra,0x0
    8000256c:	160080e7          	jalr	352(ra) # 800026c8 <_ZN5Riscv6mc_sipEm>
    80002570:	0f40006f          	j	80002664 <interruptRoutine+0x5d0>
    } else if (scause == 0x8000000000000001) {
    80002574:	fd843703          	ld	a4,-40(s0)
    80002578:	fff00793          	li	a5,-1
    8000257c:	03f79793          	slli	a5,a5,0x3f
    80002580:	00178793          	addi	a5,a5,1
    80002584:	08f71463          	bne	a4,a5,8000260c <interruptRoutine+0x578>
        Scheduler::wake();
    80002588:	fffff097          	auipc	ra,0xfffff
    8000258c:	624080e7          	jalr	1572(ra) # 80001bac <_ZN9Scheduler4wakeEv>
        TCB::getRunningTimeSlice()++;
    80002590:	00000097          	auipc	ra,0x0
    80002594:	1cc080e7          	jalr	460(ra) # 8000275c <_ZN3TCB19getRunningTimeSliceEv>
    80002598:	00050793          	mv	a5,a0
    8000259c:	0007b703          	ld	a4,0(a5)
    800025a0:	00170713          	addi	a4,a4,1
    800025a4:	00e7b023          	sd	a4,0(a5)
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
    800025a8:	00000097          	auipc	ra,0x0
    800025ac:	1b4080e7          	jalr	436(ra) # 8000275c <_ZN3TCB19getRunningTimeSliceEv>
    800025b0:	00050793          	mv	a5,a0
    800025b4:	0007b483          	ld	s1,0(a5)
    800025b8:	00000097          	auipc	ra,0x0
    800025bc:	180080e7          	jalr	384(ra) # 80002738 <_ZN3TCB10getRunningEv>
    800025c0:	00050793          	mv	a5,a0
    800025c4:	00078513          	mv	a0,a5
    800025c8:	00000097          	auipc	ra,0x0
    800025cc:	138080e7          	jalr	312(ra) # 80002700 <_ZN3TCB12getTimeSliceEv>
    800025d0:	00050793          	mv	a5,a0
    800025d4:	00f4b7b3          	sltu	a5,s1,a5
    800025d8:	0017c793          	xori	a5,a5,1
    800025dc:	0ff7f793          	andi	a5,a5,255
    800025e0:	00078663          	beqz	a5,800025ec <interruptRoutine+0x558>
            TCB::dispatch();
    800025e4:	00001097          	auipc	ra,0x1
    800025e8:	854080e7          	jalr	-1964(ra) # 80002e38 <_ZN3TCB8dispatchEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800025ec:	fd043783          	ld	a5,-48(s0)
    800025f0:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800025f4:	fc843783          	ld	a5,-56(s0)
    800025f8:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    800025fc:	00200513          	li	a0,2
    80002600:	00000097          	auipc	ra,0x0
    80002604:	0c8080e7          	jalr	200(ra) # 800026c8 <_ZN5Riscv6mc_sipEm>
    80002608:	05c0006f          	j	80002664 <interruptRoutine+0x5d0>
        printString("\nGreska u prekidnoj rutini\n");
    8000260c:	00008517          	auipc	a0,0x8
    80002610:	abc50513          	addi	a0,a0,-1348 # 8000a0c8 <_ZZ9kPrintIntmE6digits+0x58>
    80002614:	00003097          	auipc	ra,0x3
    80002618:	730080e7          	jalr	1840(ra) # 80005d44 <_Z11printStringPKc>
        printString("scause: ");
    8000261c:	00008517          	auipc	a0,0x8
    80002620:	acc50513          	addi	a0,a0,-1332 # 8000a0e8 <_ZZ9kPrintIntmE6digits+0x78>
    80002624:	00003097          	auipc	ra,0x3
    80002628:	720080e7          	jalr	1824(ra) # 80005d44 <_Z11printStringPKc>
        kPrintInt(scause);
    8000262c:	fd843503          	ld	a0,-40(s0)
    80002630:	fffff097          	auipc	ra,0xfffff
    80002634:	3b0080e7          	jalr	944(ra) # 800019e0 <_Z9kPrintIntm>
        printString("\nsepc: ");
    80002638:	00008517          	auipc	a0,0x8
    8000263c:	a7050513          	addi	a0,a0,-1424 # 8000a0a8 <_ZZ9kPrintIntmE6digits+0x38>
    80002640:	00003097          	auipc	ra,0x3
    80002644:	704080e7          	jalr	1796(ra) # 80005d44 <_Z11printStringPKc>
        kPrintInt(sepc);
    80002648:	fd043503          	ld	a0,-48(s0)
    8000264c:	fffff097          	auipc	ra,0xfffff
    80002650:	394080e7          	jalr	916(ra) # 800019e0 <_Z9kPrintIntm>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002654:	fd043783          	ld	a5,-48(s0)
    80002658:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    8000265c:	fc843783          	ld	a5,-56(s0)
    80002660:	10079073          	csrw	sstatus,a5
    80002664:	00000013          	nop
    80002668:	06813083          	ld	ra,104(sp)
    8000266c:	06013403          	ld	s0,96(sp)
    80002670:	05813483          	ld	s1,88(sp)
    80002674:	07010113          	addi	sp,sp,112
    80002678:	00008067          	ret

000000008000267c <_ZN4KSemD1Ev>:
#define PROJEKAT2023_KSEM_HPP

#include "../h/ThreadQueue.hpp"

//klasa napravljena po uzoru na semafor u skolskom jezgru
class KSem {
    8000267c:	fe010113          	addi	sp,sp,-32
    80002680:	00113c23          	sd	ra,24(sp)
    80002684:	00813823          	sd	s0,16(sp)
    80002688:	00913423          	sd	s1,8(sp)
    8000268c:	02010413          	addi	s0,sp,32
    80002690:	00050493          	mv	s1,a0
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    80002694:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002698:	00050e63          	beqz	a0,800026b4 <_ZN4KSemD1Ev+0x38>
            front = front->next;
    8000269c:	00853783          	ld	a5,8(a0)
    800026a0:	00f4b423          	sd	a5,8(s1)
            delete node;
    800026a4:	fe0508e3          	beqz	a0,80002694 <_ZN4KSemD1Ev+0x18>
            mem_free(ptr);
    800026a8:	fffff097          	auipc	ra,0xfffff
    800026ac:	ca0080e7          	jalr	-864(ra) # 80001348 <_Z8mem_freePv>
        }
    800026b0:	fe5ff06f          	j	80002694 <_ZN4KSemD1Ev+0x18>
    800026b4:	01813083          	ld	ra,24(sp)
    800026b8:	01013403          	ld	s0,16(sp)
    800026bc:	00813483          	ld	s1,8(sp)
    800026c0:	02010113          	addi	sp,sp,32
    800026c4:	00008067          	ret

00000000800026c8 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    800026c8:	ff010113          	addi	sp,sp,-16
    800026cc:	00813423          	sd	s0,8(sp)
    800026d0:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    800026d4:	14453073          	csrc	sip,a0
}
    800026d8:	00813403          	ld	s0,8(sp)
    800026dc:	01010113          	addi	sp,sp,16
    800026e0:	00008067          	ret

00000000800026e4 <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    800026e4:	ff010113          	addi	sp,sp,-16
    800026e8:	00813423          	sd	s0,8(sp)
    800026ec:	01010413          	addi	s0,sp,16
    800026f0:	04b52c23          	sw	a1,88(a0)
    800026f4:	00813403          	ld	s0,8(sp)
    800026f8:	01010113          	addi	sp,sp,16
    800026fc:	00008067          	ret

0000000080002700 <_ZN3TCB12getTimeSliceEv>:
    uint64 getTimeSlice() { return timeSlice; }
    80002700:	ff010113          	addi	sp,sp,-16
    80002704:	00813423          	sd	s0,8(sp)
    80002708:	01010413          	addi	s0,sp,16
    8000270c:	02853503          	ld	a0,40(a0)
    80002710:	00813403          	ld	s0,8(sp)
    80002714:	01010113          	addi	sp,sp,16
    80002718:	00008067          	ret

000000008000271c <_ZN3TCB7getBodyEv>:
    Body getBody() { return threadFunction; }
    8000271c:	ff010113          	addi	sp,sp,-16
    80002720:	00813423          	sd	s0,8(sp)
    80002724:	01010413          	addi	s0,sp,16
    80002728:	01053503          	ld	a0,16(a0)
    8000272c:	00813403          	ld	s0,8(sp)
    80002730:	01010113          	addi	sp,sp,16
    80002734:	00008067          	ret

0000000080002738 <_ZN3TCB10getRunningEv>:
    static TCB* getRunning() { return running; }
    80002738:	ff010113          	addi	sp,sp,-16
    8000273c:	00813423          	sd	s0,8(sp)
    80002740:	01010413          	addi	s0,sp,16
    80002744:	0000a797          	auipc	a5,0xa
    80002748:	5ec7b783          	ld	a5,1516(a5) # 8000cd30 <_GLOBAL_OFFSET_TABLE_+0x68>
    8000274c:	0007b503          	ld	a0,0(a5)
    80002750:	00813403          	ld	s0,8(sp)
    80002754:	01010113          	addi	sp,sp,16
    80002758:	00008067          	ret

000000008000275c <_ZN3TCB19getRunningTimeSliceEv>:

    static uint64 &getRunningTimeSlice() { return runningTimeSlice; }
    8000275c:	ff010113          	addi	sp,sp,-16
    80002760:	00813423          	sd	s0,8(sp)
    80002764:	01010413          	addi	s0,sp,16
    80002768:	0000a517          	auipc	a0,0xa
    8000276c:	57853503          	ld	a0,1400(a0) # 8000cce0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002770:	00813403          	ld	s0,8(sp)
    80002774:	01010113          	addi	sp,sp,16
    80002778:	00008067          	ret

000000008000277c <_ZN6Thread7wrapperEPv>:

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
    8000277c:	02050863          	beqz	a0,800027ac <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80002780:	ff010113          	addi	sp,sp,-16
    80002784:	00113423          	sd	ra,8(sp)
    80002788:	00813023          	sd	s0,0(sp)
    8000278c:	01010413          	addi	s0,sp,16
        ((Thread*)thread)->run();
    80002790:	00053783          	ld	a5,0(a0)
    80002794:	0107b783          	ld	a5,16(a5)
    80002798:	000780e7          	jalr	a5
    }
}
    8000279c:	00813083          	ld	ra,8(sp)
    800027a0:	00013403          	ld	s0,0(sp)
    800027a4:	01010113          	addi	sp,sp,16
    800027a8:	00008067          	ret
    800027ac:	00008067          	ret

00000000800027b0 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800027b0:	fe010113          	addi	sp,sp,-32
    800027b4:	00113c23          	sd	ra,24(sp)
    800027b8:	00813823          	sd	s0,16(sp)
    800027bc:	00913423          	sd	s1,8(sp)
    800027c0:	02010413          	addi	s0,sp,32
    800027c4:	00050493          	mv	s1,a0
    800027c8:	0000a797          	auipc	a5,0xa
    800027cc:	2c078793          	addi	a5,a5,704 # 8000ca88 <_ZTV6Thread+0x10>
    800027d0:	00f53023          	sd	a5,0(a0)
    thread_join(this->myHandle);
    800027d4:	00853503          	ld	a0,8(a0)
    800027d8:	fffff097          	auipc	ra,0xfffff
    800027dc:	c7c080e7          	jalr	-900(ra) # 80001454 <_Z11thread_joinP3TCB>
    delete myHandle;
    800027e0:	0084b483          	ld	s1,8(s1)
    800027e4:	02048863          	beqz	s1,80002814 <_ZN6ThreadD1Ev+0x64>
        return front == nullptr;
    800027e8:	0484b503          	ld	a0,72(s1)
        while (!isEmpty()) {
    800027ec:	00050e63          	beqz	a0,80002808 <_ZN6ThreadD1Ev+0x58>
            front = front->next;
    800027f0:	00853783          	ld	a5,8(a0)
    800027f4:	04f4b423          	sd	a5,72(s1)
            delete node;
    800027f8:	fe0508e3          	beqz	a0,800027e8 <_ZN6ThreadD1Ev+0x38>
            mem_free(ptr);
    800027fc:	fffff097          	auipc	ra,0xfffff
    80002800:	b4c080e7          	jalr	-1204(ra) # 80001348 <_Z8mem_freePv>
        }
    80002804:	fe5ff06f          	j	800027e8 <_ZN6ThreadD1Ev+0x38>
    80002808:	00048513          	mv	a0,s1
    8000280c:	00000097          	auipc	ra,0x0
    80002810:	7bc080e7          	jalr	1980(ra) # 80002fc8 <_ZN3TCBdlEPv>
}
    80002814:	01813083          	ld	ra,24(sp)
    80002818:	01013403          	ld	s0,16(sp)
    8000281c:	00813483          	ld	s1,8(sp)
    80002820:	02010113          	addi	sp,sp,32
    80002824:	00008067          	ret

0000000080002828 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002828:	fe010113          	addi	sp,sp,-32
    8000282c:	00113c23          	sd	ra,24(sp)
    80002830:	00813823          	sd	s0,16(sp)
    80002834:	00913423          	sd	s1,8(sp)
    80002838:	02010413          	addi	s0,sp,32
    8000283c:	00050493          	mv	s1,a0
    80002840:	0000a797          	auipc	a5,0xa
    80002844:	27078793          	addi	a5,a5,624 # 8000cab0 <_ZTV9Semaphore+0x10>
    80002848:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    8000284c:	00853503          	ld	a0,8(a0)
    80002850:	fffff097          	auipc	ra,0xfffff
    80002854:	c94080e7          	jalr	-876(ra) # 800014e4 <_Z9sem_closeP4KSem>
    delete myHandle;
    80002858:	0084b483          	ld	s1,8(s1)
    8000285c:	02048863          	beqz	s1,8000288c <_ZN9SemaphoreD1Ev+0x64>
        return front == nullptr;
    80002860:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002864:	00050e63          	beqz	a0,80002880 <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    80002868:	00853783          	ld	a5,8(a0)
    8000286c:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002870:	fe0508e3          	beqz	a0,80002860 <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    80002874:	fffff097          	auipc	ra,0xfffff
    80002878:	ad4080e7          	jalr	-1324(ra) # 80001348 <_Z8mem_freePv>
        }
    8000287c:	fe5ff06f          	j	80002860 <_ZN9SemaphoreD1Ev+0x38>
    80002880:	00048513          	mv	a0,s1
    80002884:	00001097          	auipc	ra,0x1
    80002888:	898080e7          	jalr	-1896(ra) # 8000311c <_ZN4KSemdlEPv>
}
    8000288c:	01813083          	ld	ra,24(sp)
    80002890:	01013403          	ld	s0,16(sp)
    80002894:	00813483          	ld	s1,8(sp)
    80002898:	02010113          	addi	sp,sp,32
    8000289c:	00008067          	ret

00000000800028a0 <_Znwm>:
void* operator new(size_t size) {
    800028a0:	ff010113          	addi	sp,sp,-16
    800028a4:	00113423          	sd	ra,8(sp)
    800028a8:	00813023          	sd	s0,0(sp)
    800028ac:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800028b0:	fffff097          	auipc	ra,0xfffff
    800028b4:	a58080e7          	jalr	-1448(ra) # 80001308 <_Z9mem_allocm>
}
    800028b8:	00813083          	ld	ra,8(sp)
    800028bc:	00013403          	ld	s0,0(sp)
    800028c0:	01010113          	addi	sp,sp,16
    800028c4:	00008067          	ret

00000000800028c8 <_Znam>:
void* operator new[](size_t size) {
    800028c8:	ff010113          	addi	sp,sp,-16
    800028cc:	00113423          	sd	ra,8(sp)
    800028d0:	00813023          	sd	s0,0(sp)
    800028d4:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800028d8:	fffff097          	auipc	ra,0xfffff
    800028dc:	a30080e7          	jalr	-1488(ra) # 80001308 <_Z9mem_allocm>
}
    800028e0:	00813083          	ld	ra,8(sp)
    800028e4:	00013403          	ld	s0,0(sp)
    800028e8:	01010113          	addi	sp,sp,16
    800028ec:	00008067          	ret

00000000800028f0 <_ZdlPv>:
noexcept {
    800028f0:	ff010113          	addi	sp,sp,-16
    800028f4:	00113423          	sd	ra,8(sp)
    800028f8:	00813023          	sd	s0,0(sp)
    800028fc:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002900:	fffff097          	auipc	ra,0xfffff
    80002904:	a48080e7          	jalr	-1464(ra) # 80001348 <_Z8mem_freePv>
}
    80002908:	00813083          	ld	ra,8(sp)
    8000290c:	00013403          	ld	s0,0(sp)
    80002910:	01010113          	addi	sp,sp,16
    80002914:	00008067          	ret

0000000080002918 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002918:	fe010113          	addi	sp,sp,-32
    8000291c:	00113c23          	sd	ra,24(sp)
    80002920:	00813823          	sd	s0,16(sp)
    80002924:	00913423          	sd	s1,8(sp)
    80002928:	02010413          	addi	s0,sp,32
    8000292c:	00050493          	mv	s1,a0
}
    80002930:	00000097          	auipc	ra,0x0
    80002934:	e80080e7          	jalr	-384(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80002938:	00048513          	mv	a0,s1
    8000293c:	00000097          	auipc	ra,0x0
    80002940:	fb4080e7          	jalr	-76(ra) # 800028f0 <_ZdlPv>
    80002944:	01813083          	ld	ra,24(sp)
    80002948:	01013403          	ld	s0,16(sp)
    8000294c:	00813483          	ld	s1,8(sp)
    80002950:	02010113          	addi	sp,sp,32
    80002954:	00008067          	ret

0000000080002958 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002958:	fe010113          	addi	sp,sp,-32
    8000295c:	00113c23          	sd	ra,24(sp)
    80002960:	00813823          	sd	s0,16(sp)
    80002964:	00913423          	sd	s1,8(sp)
    80002968:	02010413          	addi	s0,sp,32
    8000296c:	00050493          	mv	s1,a0
}
    80002970:	00000097          	auipc	ra,0x0
    80002974:	eb8080e7          	jalr	-328(ra) # 80002828 <_ZN9SemaphoreD1Ev>
    80002978:	00048513          	mv	a0,s1
    8000297c:	00000097          	auipc	ra,0x0
    80002980:	f74080e7          	jalr	-140(ra) # 800028f0 <_ZdlPv>
    80002984:	01813083          	ld	ra,24(sp)
    80002988:	01013403          	ld	s0,16(sp)
    8000298c:	00813483          	ld	s1,8(sp)
    80002990:	02010113          	addi	sp,sp,32
    80002994:	00008067          	ret

0000000080002998 <_ZdaPv>:
noexcept {
    80002998:	ff010113          	addi	sp,sp,-16
    8000299c:	00113423          	sd	ra,8(sp)
    800029a0:	00813023          	sd	s0,0(sp)
    800029a4:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800029a8:	fffff097          	auipc	ra,0xfffff
    800029ac:	9a0080e7          	jalr	-1632(ra) # 80001348 <_Z8mem_freePv>
}
    800029b0:	00813083          	ld	ra,8(sp)
    800029b4:	00013403          	ld	s0,0(sp)
    800029b8:	01010113          	addi	sp,sp,16
    800029bc:	00008067          	ret

00000000800029c0 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    800029c0:	fd010113          	addi	sp,sp,-48
    800029c4:	02113423          	sd	ra,40(sp)
    800029c8:	02813023          	sd	s0,32(sp)
    800029cc:	00913c23          	sd	s1,24(sp)
    800029d0:	01213823          	sd	s2,16(sp)
    800029d4:	01313423          	sd	s3,8(sp)
    800029d8:	03010413          	addi	s0,sp,48
    800029dc:	00050493          	mv	s1,a0
    800029e0:	00058913          	mv	s2,a1
    800029e4:	00060993          	mv	s3,a2
    800029e8:	0000a797          	auipc	a5,0xa
    800029ec:	0a078793          	addi	a5,a5,160 # 8000ca88 <_ZTV6Thread+0x10>
    800029f0:	00f53023          	sd	a5,0(a0)
    this->body = body;
    800029f4:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    800029f8:	00c53c23          	sd	a2,24(a0)
    if (body != (TCB::Body)main) {
    800029fc:	0000a797          	auipc	a5,0xa
    80002a00:	3247b783          	ld	a5,804(a5) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002a04:	04f58663          	beq	a1,a5,80002a50 <_ZN6ThreadC1EPFvPvES0_+0x90>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002a08:	00001537          	lui	a0,0x1
    80002a0c:	fffff097          	auipc	ra,0xfffff
    80002a10:	8fc080e7          	jalr	-1796(ra) # 80001308 <_Z9mem_allocm>
    80002a14:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a18:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a1c:	00098693          	mv	a3,s3
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a20:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a24:	00848493          	addi	s1,s1,8
    80002a28:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002a2c:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002a30:	00000073          	ecall
}
    80002a34:	02813083          	ld	ra,40(sp)
    80002a38:	02013403          	ld	s0,32(sp)
    80002a3c:	01813483          	ld	s1,24(sp)
    80002a40:	01013903          	ld	s2,16(sp)
    80002a44:	00813983          	ld	s3,8(sp)
    80002a48:	03010113          	addi	sp,sp,48
    80002a4c:	00008067          	ret
    uint64* stack = nullptr;
    80002a50:	00000313          	li	t1,0
    80002a54:	fc5ff06f          	j	80002a18 <_ZN6ThreadC1EPFvPvES0_+0x58>

0000000080002a58 <_ZN6Thread5startEv>:
int Thread::start() {
    80002a58:	ff010113          	addi	sp,sp,-16
    80002a5c:	00813423          	sd	s0,8(sp)
    80002a60:	01010413          	addi	s0,sp,16
    if (myHandle == nullptr) return -1;
    80002a64:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002a68:	02030063          	beqz	t1,80002a88 <_ZN6Thread5startEv+0x30>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a6c:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    80002a70:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    80002a74:	00000073          	ecall
    return 0;
    80002a78:	00000513          	li	a0,0
}
    80002a7c:	00813403          	ld	s0,8(sp)
    80002a80:	01010113          	addi	sp,sp,16
    80002a84:	00008067          	ret
    if (myHandle == nullptr) return -1;
    80002a88:	fff00513          	li	a0,-1
    80002a8c:	ff1ff06f          	j	80002a7c <_ZN6Thread5startEv+0x24>

0000000080002a90 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002a90:	ff010113          	addi	sp,sp,-16
    80002a94:	00113423          	sd	ra,8(sp)
    80002a98:	00813023          	sd	s0,0(sp)
    80002a9c:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80002aa0:	00853503          	ld	a0,8(a0)
    80002aa4:	fffff097          	auipc	ra,0xfffff
    80002aa8:	9b0080e7          	jalr	-1616(ra) # 80001454 <_Z11thread_joinP3TCB>
}
    80002aac:	00813083          	ld	ra,8(sp)
    80002ab0:	00013403          	ld	s0,0(sp)
    80002ab4:	01010113          	addi	sp,sp,16
    80002ab8:	00008067          	ret

0000000080002abc <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002abc:	ff010113          	addi	sp,sp,-16
    80002ac0:	00113423          	sd	ra,8(sp)
    80002ac4:	00813023          	sd	s0,0(sp)
    80002ac8:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002acc:	fffff097          	auipc	ra,0xfffff
    80002ad0:	968080e7          	jalr	-1688(ra) # 80001434 <_Z15thread_dispatchv>
}
    80002ad4:	00813083          	ld	ra,8(sp)
    80002ad8:	00013403          	ld	s0,0(sp)
    80002adc:	01010113          	addi	sp,sp,16
    80002ae0:	00008067          	ret

0000000080002ae4 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80002ae4:	ff010113          	addi	sp,sp,-16
    80002ae8:	00113423          	sd	ra,8(sp)
    80002aec:	00813023          	sd	s0,0(sp)
    80002af0:	01010413          	addi	s0,sp,16
    time_sleep(t);
    80002af4:	fffff097          	auipc	ra,0xfffff
    80002af8:	988080e7          	jalr	-1656(ra) # 8000147c <_Z10time_sleepm>
}
    80002afc:	00000513          	li	a0,0
    80002b00:	00813083          	ld	ra,8(sp)
    80002b04:	00013403          	ld	s0,0(sp)
    80002b08:	01010113          	addi	sp,sp,16
    80002b0c:	00008067          	ret

0000000080002b10 <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    80002b10:	fe010113          	addi	sp,sp,-32
    80002b14:	00113c23          	sd	ra,24(sp)
    80002b18:	00813823          	sd	s0,16(sp)
    80002b1c:	00913423          	sd	s1,8(sp)
    80002b20:	02010413          	addi	s0,sp,32
    80002b24:	00050493          	mv	s1,a0
    while (period != -1UL) {
    80002b28:	0204b703          	ld	a4,32(s1)
    80002b2c:	fff00793          	li	a5,-1
    80002b30:	02f70663          	beq	a4,a5,80002b5c <_ZN14PeriodicThread3runEv+0x4c>
        periodicActivation();
    80002b34:	0004b783          	ld	a5,0(s1)
    80002b38:	0187b783          	ld	a5,24(a5)
    80002b3c:	00048513          	mv	a0,s1
    80002b40:	000780e7          	jalr	a5
        if (period == -1UL) break;
    80002b44:	0204b503          	ld	a0,32(s1)
    80002b48:	fff00793          	li	a5,-1
    80002b4c:	00f50863          	beq	a0,a5,80002b5c <_ZN14PeriodicThread3runEv+0x4c>
        sleep(period);
    80002b50:	00000097          	auipc	ra,0x0
    80002b54:	f94080e7          	jalr	-108(ra) # 80002ae4 <_ZN6Thread5sleepEm>
    while (period != -1UL) {
    80002b58:	fd1ff06f          	j	80002b28 <_ZN14PeriodicThread3runEv+0x18>
    }
    thread_exit();
    80002b5c:	fffff097          	auipc	ra,0xfffff
    80002b60:	8b0080e7          	jalr	-1872(ra) # 8000140c <_Z11thread_exitv>
}
    80002b64:	01813083          	ld	ra,24(sp)
    80002b68:	01013403          	ld	s0,16(sp)
    80002b6c:	00813483          	ld	s1,8(sp)
    80002b70:	02010113          	addi	sp,sp,32
    80002b74:	00008067          	ret

0000000080002b78 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002b78:	fe010113          	addi	sp,sp,-32
    80002b7c:	00113c23          	sd	ra,24(sp)
    80002b80:	00813823          	sd	s0,16(sp)
    80002b84:	00913423          	sd	s1,8(sp)
    80002b88:	02010413          	addi	s0,sp,32
    80002b8c:	00050493          	mv	s1,a0
    80002b90:	0000a797          	auipc	a5,0xa
    80002b94:	ef878793          	addi	a5,a5,-264 # 8000ca88 <_ZTV6Thread+0x10>
    80002b98:	00f53023          	sd	a5,0(a0)
    this->body = wrapper;
    80002b9c:	00000797          	auipc	a5,0x0
    80002ba0:	be078793          	addi	a5,a5,-1056 # 8000277c <_ZN6Thread7wrapperEPv>
    80002ba4:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80002ba8:	00a53c23          	sd	a0,24(a0)
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002bac:	00001537          	lui	a0,0x1
    80002bb0:	ffffe097          	auipc	ra,0xffffe
    80002bb4:	758080e7          	jalr	1880(ra) # 80001308 <_Z9mem_allocm>
    80002bb8:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002bbc:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002bc0:	0184b303          	ld	t1,24(s1)
    80002bc4:	00030693          	mv	a3,t1
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002bc8:	0104b303          	ld	t1,16(s1)
    80002bcc:	00030613          	mv	a2,t1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002bd0:	00848493          	addi	s1,s1,8
    80002bd4:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002bd8:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002bdc:	00000073          	ecall
}
    80002be0:	01813083          	ld	ra,24(sp)
    80002be4:	01013403          	ld	s0,16(sp)
    80002be8:	00813483          	ld	s1,8(sp)
    80002bec:	02010113          	addi	sp,sp,32
    80002bf0:	00008067          	ret

0000000080002bf4 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002bf4:	ff010113          	addi	sp,sp,-16
    80002bf8:	00113423          	sd	ra,8(sp)
    80002bfc:	00813023          	sd	s0,0(sp)
    80002c00:	01010413          	addi	s0,sp,16
    80002c04:	0000a797          	auipc	a5,0xa
    80002c08:	eac78793          	addi	a5,a5,-340 # 8000cab0 <_ZTV9Semaphore+0x10>
    80002c0c:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle, init);
    80002c10:	00850513          	addi	a0,a0,8
    80002c14:	fffff097          	auipc	ra,0xfffff
    80002c18:	898080e7          	jalr	-1896(ra) # 800014ac <_Z8sem_openPP4KSemj>
}
    80002c1c:	00813083          	ld	ra,8(sp)
    80002c20:	00013403          	ld	s0,0(sp)
    80002c24:	01010113          	addi	sp,sp,16
    80002c28:	00008067          	ret

0000000080002c2c <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002c2c:	ff010113          	addi	sp,sp,-16
    80002c30:	00113423          	sd	ra,8(sp)
    80002c34:	00813023          	sd	s0,0(sp)
    80002c38:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002c3c:	00853503          	ld	a0,8(a0)
    80002c40:	fffff097          	auipc	ra,0xfffff
    80002c44:	8d4080e7          	jalr	-1836(ra) # 80001514 <_Z8sem_waitP4KSem>
}
    80002c48:	00813083          	ld	ra,8(sp)
    80002c4c:	00013403          	ld	s0,0(sp)
    80002c50:	01010113          	addi	sp,sp,16
    80002c54:	00008067          	ret

0000000080002c58 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002c58:	ff010113          	addi	sp,sp,-16
    80002c5c:	00113423          	sd	ra,8(sp)
    80002c60:	00813023          	sd	s0,0(sp)
    80002c64:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80002c68:	00853503          	ld	a0,8(a0)
    80002c6c:	fffff097          	auipc	ra,0xfffff
    80002c70:	8d8080e7          	jalr	-1832(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    80002c74:	00813083          	ld	ra,8(sp)
    80002c78:	00013403          	ld	s0,0(sp)
    80002c7c:	01010113          	addi	sp,sp,16
    80002c80:	00008067          	ret

0000000080002c84 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002c84:	ff010113          	addi	sp,sp,-16
    80002c88:	00813423          	sd	s0,8(sp)
    80002c8c:	01010413          	addi	s0,sp,16
    this->period = -1;
    80002c90:	fff00793          	li	a5,-1
    80002c94:	02f53023          	sd	a5,32(a0)
}
    80002c98:	00813403          	ld	s0,8(sp)
    80002c9c:	01010113          	addi	sp,sp,16
    80002ca0:	00008067          	ret

0000000080002ca4 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    80002ca4:	fe010113          	addi	sp,sp,-32
    80002ca8:	00113c23          	sd	ra,24(sp)
    80002cac:	00813823          	sd	s0,16(sp)
    80002cb0:	00913423          	sd	s1,8(sp)
    80002cb4:	01213023          	sd	s2,0(sp)
    80002cb8:	02010413          	addi	s0,sp,32
    80002cbc:	00050493          	mv	s1,a0
    80002cc0:	00058913          	mv	s2,a1
    80002cc4:	00000097          	auipc	ra,0x0
    80002cc8:	eb4080e7          	jalr	-332(ra) # 80002b78 <_ZN6ThreadC1Ev>
    80002ccc:	0000a797          	auipc	a5,0xa
    80002cd0:	e0478793          	addi	a5,a5,-508 # 8000cad0 <_ZTV14PeriodicThread+0x10>
    80002cd4:	00f4b023          	sd	a5,0(s1)
    80002cd8:	0324b023          	sd	s2,32(s1)
}
    80002cdc:	01813083          	ld	ra,24(sp)
    80002ce0:	01013403          	ld	s0,16(sp)
    80002ce4:	00813483          	ld	s1,8(sp)
    80002ce8:	00013903          	ld	s2,0(sp)
    80002cec:	02010113          	addi	sp,sp,32
    80002cf0:	00008067          	ret

0000000080002cf4 <_ZN7Console4getcEv>:

char Console::getc() {
    80002cf4:	ff010113          	addi	sp,sp,-16
    80002cf8:	00113423          	sd	ra,8(sp)
    80002cfc:	00813023          	sd	s0,0(sp)
    80002d00:	01010413          	addi	s0,sp,16
    return ::getc();
    80002d04:	fffff097          	auipc	ra,0xfffff
    80002d08:	870080e7          	jalr	-1936(ra) # 80001574 <_Z4getcv>
}
    80002d0c:	00813083          	ld	ra,8(sp)
    80002d10:	00013403          	ld	s0,0(sp)
    80002d14:	01010113          	addi	sp,sp,16
    80002d18:	00008067          	ret

0000000080002d1c <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002d1c:	ff010113          	addi	sp,sp,-16
    80002d20:	00113423          	sd	ra,8(sp)
    80002d24:	00813023          	sd	s0,0(sp)
    80002d28:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002d2c:	fffff097          	auipc	ra,0xfffff
    80002d30:	870080e7          	jalr	-1936(ra) # 8000159c <_Z4putcc>
}
    80002d34:	00813083          	ld	ra,8(sp)
    80002d38:	00013403          	ld	s0,0(sp)
    80002d3c:	01010113          	addi	sp,sp,16
    80002d40:	00008067          	ret

0000000080002d44 <_ZN6Thread3runEv>:
protected:
    //konstruktor koji pravi nit koja izvrsava run metodu, ne stavlja je u Scheduler
    Thread();

    //funkcija koju nit izvrsava, samo ako je nit napravljena podrazumevanim konstruktorom
    virtual void run() {}
    80002d44:	ff010113          	addi	sp,sp,-16
    80002d48:	00813423          	sd	s0,8(sp)
    80002d4c:	01010413          	addi	s0,sp,16
    80002d50:	00813403          	ld	s0,8(sp)
    80002d54:	01010113          	addi	sp,sp,16
    80002d58:	00008067          	ret

0000000080002d5c <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    80002d5c:	ff010113          	addi	sp,sp,-16
    80002d60:	00813423          	sd	s0,8(sp)
    80002d64:	01010413          	addi	s0,sp,16
    80002d68:	00813403          	ld	s0,8(sp)
    80002d6c:	01010113          	addi	sp,sp,16
    80002d70:	00008067          	ret

0000000080002d74 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002d74:	ff010113          	addi	sp,sp,-16
    80002d78:	00113423          	sd	ra,8(sp)
    80002d7c:	00813023          	sd	s0,0(sp)
    80002d80:	01010413          	addi	s0,sp,16
    80002d84:	0000a797          	auipc	a5,0xa
    80002d88:	d4c78793          	addi	a5,a5,-692 # 8000cad0 <_ZTV14PeriodicThread+0x10>
    80002d8c:	00f53023          	sd	a5,0(a0)
    80002d90:	00000097          	auipc	ra,0x0
    80002d94:	a20080e7          	jalr	-1504(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80002d98:	00813083          	ld	ra,8(sp)
    80002d9c:	00013403          	ld	s0,0(sp)
    80002da0:	01010113          	addi	sp,sp,16
    80002da4:	00008067          	ret

0000000080002da8 <_ZN14PeriodicThreadD0Ev>:
    80002da8:	fe010113          	addi	sp,sp,-32
    80002dac:	00113c23          	sd	ra,24(sp)
    80002db0:	00813823          	sd	s0,16(sp)
    80002db4:	00913423          	sd	s1,8(sp)
    80002db8:	02010413          	addi	s0,sp,32
    80002dbc:	00050493          	mv	s1,a0
    80002dc0:	0000a797          	auipc	a5,0xa
    80002dc4:	d1078793          	addi	a5,a5,-752 # 8000cad0 <_ZTV14PeriodicThread+0x10>
    80002dc8:	00f53023          	sd	a5,0(a0)
    80002dcc:	00000097          	auipc	ra,0x0
    80002dd0:	9e4080e7          	jalr	-1564(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80002dd4:	00048513          	mv	a0,s1
    80002dd8:	00000097          	auipc	ra,0x0
    80002ddc:	b18080e7          	jalr	-1256(ra) # 800028f0 <_ZdlPv>
    80002de0:	01813083          	ld	ra,24(sp)
    80002de4:	01013403          	ld	s0,16(sp)
    80002de8:	00813483          	ld	s1,8(sp)
    80002dec:	02010113          	addi	sp,sp,32
    80002df0:	00008067          	ret

0000000080002df4 <_ZN3TCB7wrapperEv>:
    }

    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
}

void TCB::wrapper() {
    80002df4:	ff010113          	addi	sp,sp,-16
    80002df8:	00113423          	sd	ra,8(sp)
    80002dfc:	00813023          	sd	s0,0(sp)
    80002e00:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch)
    Riscv::returnFromInterrupt();
    80002e04:	00000097          	auipc	ra,0x0
    80002e08:	2d0080e7          	jalr	720(ra) # 800030d4 <_ZN5Riscv19returnFromInterruptEv>
    //na dalje se izvrsavamo u user modu (osim za kernel funkcije)
    running->threadFunction(running->args);
    80002e0c:	0000a797          	auipc	a5,0xa
    80002e10:	0947b783          	ld	a5,148(a5) # 8000cea0 <_ZN3TCB7runningE>
    80002e14:	0107b703          	ld	a4,16(a5)
    80002e18:	0207b503          	ld	a0,32(a5)
    80002e1c:	000700e7          	jalr	a4
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    80002e20:	ffffe097          	auipc	ra,0xffffe
    80002e24:	5ec080e7          	jalr	1516(ra) # 8000140c <_Z11thread_exitv>
}
    80002e28:	00813083          	ld	ra,8(sp)
    80002e2c:	00013403          	ld	s0,0(sp)
    80002e30:	01010113          	addi	sp,sp,16
    80002e34:	00008067          	ret

0000000080002e38 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002e38:	fe010113          	addi	sp,sp,-32
    80002e3c:	00113c23          	sd	ra,24(sp)
    80002e40:	00813823          	sd	s0,16(sp)
    80002e44:	00913423          	sd	s1,8(sp)
    80002e48:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    80002e4c:	0000a497          	auipc	s1,0xa
    80002e50:	0544b483          	ld	s1,84(s1) # 8000cea0 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    80002e54:	0584a703          	lw	a4,88(s1)
    80002e58:	00100793          	li	a5,1
    80002e5c:	04f70a63          	beq	a4,a5,80002eb0 <_ZN3TCB8dispatchEv+0x78>
    TCB::running = Scheduler::get();
    80002e60:	fffff097          	auipc	ra,0xfffff
    80002e64:	c5c080e7          	jalr	-932(ra) # 80001abc <_ZN9Scheduler3getEv>
    80002e68:	00050593          	mv	a1,a0
    80002e6c:	0000a797          	auipc	a5,0xa
    80002e70:	03478793          	addi	a5,a5,52 # 8000cea0 <_ZN3TCB7runningE>
    80002e74:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80002e78:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == (TCB::Body)main || TCB::running->threadFunction == kernelConsumerFunction ||
    80002e7c:	01053783          	ld	a5,16(a0)
    80002e80:	0000a717          	auipc	a4,0xa
    80002e84:	ea073703          	ld	a4,-352(a4) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002e88:	02e78c63          	beq	a5,a4,80002ec0 <_ZN3TCB8dispatchEv+0x88>
    80002e8c:	0000a717          	auipc	a4,0xa
    80002e90:	e7473703          	ld	a4,-396(a4) # 8000cd00 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002e94:	02e78663          	beq	a5,a4,80002ec0 <_ZN3TCB8dispatchEv+0x88>
    80002e98:	0000a717          	auipc	a4,0xa
    80002e9c:	eb073703          	ld	a4,-336(a4) # 8000cd48 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002ea0:	02e78063          	beq	a5,a4,80002ec0 <_ZN3TCB8dispatchEv+0x88>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002ea4:	10000793          	li	a5,256
    80002ea8:	1007b073          	csrc	sstatus,a5
}
    80002eac:	01c0006f          	j	80002ec8 <_ZN3TCB8dispatchEv+0x90>
        Scheduler::put(old);
    80002eb0:	00048513          	mv	a0,s1
    80002eb4:	fffff097          	auipc	ra,0xfffff
    80002eb8:	bbc080e7          	jalr	-1092(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
    80002ebc:	fa5ff06f          	j	80002e60 <_ZN3TCB8dispatchEv+0x28>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002ec0:	10000793          	li	a5,256
    80002ec4:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002ec8:	00b48863          	beq	s1,a1,80002ed8 <_ZN3TCB8dispatchEv+0xa0>
    80002ecc:	00048513          	mv	a0,s1
    80002ed0:	ffffe097          	auipc	ra,0xffffe
    80002ed4:	240080e7          	jalr	576(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002ed8:	01813083          	ld	ra,24(sp)
    80002edc:	01013403          	ld	s0,16(sp)
    80002ee0:	00813483          	ld	s1,8(sp)
    80002ee4:	02010113          	addi	sp,sp,32
    80002ee8:	00008067          	ret

0000000080002eec <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002eec:	ff010113          	addi	sp,sp,-16
    80002ef0:	00113423          	sd	ra,8(sp)
    80002ef4:	00813023          	sd	s0,0(sp)
    80002ef8:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002efc:	ffffe097          	auipc	ra,0xffffe
    80002f00:	40c080e7          	jalr	1036(ra) # 80001308 <_Z9mem_allocm>
}
    80002f04:	00813083          	ld	ra,8(sp)
    80002f08:	00013403          	ld	s0,0(sp)
    80002f0c:	01010113          	addi	sp,sp,16
    80002f10:	00008067          	ret

0000000080002f14 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002f14:	fd010113          	addi	sp,sp,-48
    80002f18:	02113423          	sd	ra,40(sp)
    80002f1c:	02813023          	sd	s0,32(sp)
    80002f20:	00913c23          	sd	s1,24(sp)
    80002f24:	01213823          	sd	s2,16(sp)
    80002f28:	01313423          	sd	s3,8(sp)
    80002f2c:	03010413          	addi	s0,sp,48
    80002f30:	00050913          	mv	s2,a0
    80002f34:	00058993          	mv	s3,a1
    80002f38:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    80002f3c:	06000513          	li	a0,96
    80002f40:	00000097          	auipc	ra,0x0
    80002f44:	fac080e7          	jalr	-84(ra) # 80002eec <_ZN3TCBnwEm>

private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED) {
    80002f48:	01253823          	sd	s2,16(a0)
    80002f4c:	00953c23          	sd	s1,24(a0)
    80002f50:	03353023          	sd	s3,32(a0)
    80002f54:	00200793          	li	a5,2
    80002f58:	02f53423          	sd	a5,40(a0)
    80002f5c:	02053823          	sd	zero,48(a0)
    80002f60:	02053c23          	sd	zero,56(a0)
    80002f64:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80002f68:	04053423          	sd	zero,72(a0)
    80002f6c:	04053823          	sd	zero,80(a0)
    80002f70:	04052c23          	sw	zero,88(a0)
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80002f74:	0000a797          	auipc	a5,0xa
    80002f78:	dac7b783          	ld	a5,-596(a5) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002f7c:	02f90e63          	beq	s2,a5,80002fb8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002f80:	00000797          	auipc	a5,0x0
    80002f84:	e7478793          	addi	a5,a5,-396 # 80002df4 <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002f88:	02048c63          	beqz	s1,80002fc0 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002f8c:	00001637          	lui	a2,0x1
    80002f90:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    80002f94:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    80002f98:	00953423          	sd	s1,8(a0)
}
    80002f9c:	02813083          	ld	ra,40(sp)
    80002fa0:	02013403          	ld	s0,32(sp)
    80002fa4:	01813483          	ld	s1,24(sp)
    80002fa8:	01013903          	ld	s2,16(sp)
    80002fac:	00813983          	ld	s3,8(sp)
    80002fb0:	03010113          	addi	sp,sp,48
    80002fb4:	00008067          	ret
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80002fb8:	00000793          	li	a5,0
    80002fbc:	fcdff06f          	j	80002f88 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002fc0:	00000493          	li	s1,0
    80002fc4:	fd1ff06f          	j	80002f94 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x80>

0000000080002fc8 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002fc8:	ff010113          	addi	sp,sp,-16
    80002fcc:	00113423          	sd	ra,8(sp)
    80002fd0:	00813023          	sd	s0,0(sp)
    80002fd4:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002fd8:	ffffe097          	auipc	ra,0xffffe
    80002fdc:	370080e7          	jalr	880(ra) # 80001348 <_Z8mem_freePv>
}
    80002fe0:	00813083          	ld	ra,8(sp)
    80002fe4:	00013403          	ld	s0,0(sp)
    80002fe8:	01010113          	addi	sp,sp,16
    80002fec:	00008067          	ret

0000000080002ff0 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED || TCB::running == handle) return;
    80002ff0:	05852703          	lw	a4,88(a0)
    80002ff4:	00500793          	li	a5,5
    80002ff8:	04f70263          	beq	a4,a5,8000303c <_ZN3TCB10threadJoinEPS_+0x4c>
    80002ffc:	0000a597          	auipc	a1,0xa
    80003000:	ea45b583          	ld	a1,-348(a1) # 8000cea0 <_ZN3TCB7runningE>
    80003004:	02a58c63          	beq	a1,a0,8000303c <_ZN3TCB10threadJoinEPS_+0x4c>
void TCB::threadJoin(TCB* handle) {
    80003008:	ff010113          	addi	sp,sp,-16
    8000300c:	00113423          	sd	ra,8(sp)
    80003010:	00813023          	sd	s0,0(sp)
    80003014:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    80003018:	00300793          	li	a5,3
    8000301c:	04f5ac23          	sw	a5,88(a1)
    handle->waitingToJoin.putLast(TCB::running);
    80003020:	04850513          	addi	a0,a0,72
    80003024:	ffffe097          	auipc	ra,0xffffe
    80003028:	218080e7          	jalr	536(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
}
    8000302c:	00813083          	ld	ra,8(sp)
    80003030:	00013403          	ld	s0,0(sp)
    80003034:	01010113          	addi	sp,sp,16
    80003038:	00008067          	ret
    8000303c:	00008067          	ret

0000000080003040 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80003040:	0000a517          	auipc	a0,0xa
    80003044:	e6053503          	ld	a0,-416(a0) # 8000cea0 <_ZN3TCB7runningE>
        return front == nullptr;
    80003048:	04853783          	ld	a5,72(a0)
    8000304c:	04078463          	beqz	a5,80003094 <_ZN3TCB13releaseJoinedEv+0x54>
void TCB::releaseJoined() {
    80003050:	ff010113          	addi	sp,sp,-16
    80003054:	00113423          	sd	ra,8(sp)
    80003058:	00813023          	sd	s0,0(sp)
    8000305c:	01010413          	addi	s0,sp,16
        TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80003060:	04850513          	addi	a0,a0,72
    80003064:	ffffe097          	auipc	ra,0xffffe
    80003068:	244080e7          	jalr	580(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
        Scheduler::put(tcb);
    8000306c:	fffff097          	auipc	ra,0xfffff
    80003070:	a04080e7          	jalr	-1532(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80003074:	0000a517          	auipc	a0,0xa
    80003078:	e2c53503          	ld	a0,-468(a0) # 8000cea0 <_ZN3TCB7runningE>
    8000307c:	04853783          	ld	a5,72(a0)
    80003080:	fe0790e3          	bnez	a5,80003060 <_ZN3TCB13releaseJoinedEv+0x20>
    }
}
    80003084:	00813083          	ld	ra,8(sp)
    80003088:	00013403          	ld	s0,0(sp)
    8000308c:	01010113          	addi	sp,sp,16
    80003090:	00008067          	ret
    80003094:	00008067          	ret

0000000080003098 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
    //startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
    if (newTcb->threadFunction != (TCB::Body)main) {
    80003098:	01053703          	ld	a4,16(a0)
    8000309c:	0000a797          	auipc	a5,0xa
    800030a0:	c847b783          	ld	a5,-892(a5) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x58>
    800030a4:	02f70663          	beq	a4,a5,800030d0 <_ZN3TCB5startEPS_+0x38>
void TCB::start(TCB* newTcb) {
    800030a8:	ff010113          	addi	sp,sp,-16
    800030ac:	00113423          	sd	ra,8(sp)
    800030b0:	00813023          	sd	s0,0(sp)
    800030b4:	01010413          	addi	s0,sp,16
        Scheduler::put(newTcb);
    800030b8:	fffff097          	auipc	ra,0xfffff
    800030bc:	9b8080e7          	jalr	-1608(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
    }
}
    800030c0:	00813083          	ld	ra,8(sp)
    800030c4:	00013403          	ld	s0,0(sp)
    800030c8:	01010113          	addi	sp,sp,16
    800030cc:	00008067          	ret
    800030d0:	00008067          	ret

00000000800030d4 <_ZN5Riscv19returnFromInterruptEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::returnFromInterrupt() {
    800030d4:	ff010113          	addi	sp,sp,-16
    800030d8:	00813423          	sd	s0,8(sp)
    800030dc:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    800030e0:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    800030e4:	10200073          	sret
    800030e8:	00813403          	ld	s0,8(sp)
    800030ec:	01010113          	addi	sp,sp,16
    800030f0:	00008067          	ret

00000000800030f4 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    800030f4:	ff010113          	addi	sp,sp,-16
    800030f8:	00113423          	sd	ra,8(sp)
    800030fc:	00813023          	sd	s0,0(sp)
    80003100:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003104:	ffffe097          	auipc	ra,0xffffe
    80003108:	204080e7          	jalr	516(ra) # 80001308 <_Z9mem_allocm>
}
    8000310c:	00813083          	ld	ra,8(sp)
    80003110:	00013403          	ld	s0,0(sp)
    80003114:	01010113          	addi	sp,sp,16
    80003118:	00008067          	ret

000000008000311c <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    8000311c:	ff010113          	addi	sp,sp,-16
    80003120:	00113423          	sd	ra,8(sp)
    80003124:	00813023          	sd	s0,0(sp)
    80003128:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    8000312c:	ffffe097          	auipc	ra,0xffffe
    80003130:	21c080e7          	jalr	540(ra) # 80001348 <_Z8mem_freePv>
}
    80003134:	00813083          	ld	ra,8(sp)
    80003138:	00013403          	ld	s0,0(sp)
    8000313c:	01010113          	addi	sp,sp,16
    80003140:	00008067          	ret

0000000080003144 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003144:	fe010113          	addi	sp,sp,-32
    80003148:	00113c23          	sd	ra,24(sp)
    8000314c:	00813823          	sd	s0,16(sp)
    80003150:	00913423          	sd	s1,8(sp)
    80003154:	02010413          	addi	s0,sp,32
    80003158:	00050493          	mv	s1,a0
	return new KSem(val);
    8000315c:	02000513          	li	a0,32
    80003160:	00000097          	auipc	ra,0x0
    80003164:	f94080e7          	jalr	-108(ra) # 800030f4 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    80003168:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    8000316c:	00053423          	sd	zero,8(a0)
    80003170:	00053823          	sd	zero,16(a0)
    80003174:	00100713          	li	a4,1
    80003178:	00e50c23          	sb	a4,24(a0)
}
    8000317c:	01813083          	ld	ra,24(sp)
    80003180:	01013403          	ld	s0,16(sp)
    80003184:	00813483          	ld	s1,8(sp)
    80003188:	02010113          	addi	sp,sp,32
    8000318c:	00008067          	ret

0000000080003190 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003190:	ff010113          	addi	sp,sp,-16
    80003194:	00113423          	sd	ra,8(sp)
    80003198:	00813023          	sd	s0,0(sp)
    8000319c:	01010413          	addi	s0,sp,16

    800031a0:	0000a797          	auipc	a5,0xa
    800031a4:	b907b783          	ld	a5,-1136(a5) # 8000cd30 <_GLOBAL_OFFSET_TABLE_+0x68>
    800031a8:	0007b583          	ld	a1,0(a5)

    800031ac:	00200793          	li	a5,2
    800031b0:	04f5ac23          	sw	a5,88(a1)
    TCB::getRunning()->setStatus(TCB::BLOCKED);
	blocked.putLast(TCB::getRunning());
    800031b4:	00850513          	addi	a0,a0,8
    800031b8:	ffffe097          	auipc	ra,0xffffe
    800031bc:	084080e7          	jalr	132(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::dispatch();
    800031c0:	00000097          	auipc	ra,0x0
    800031c4:	c78080e7          	jalr	-904(ra) # 80002e38 <_ZN3TCB8dispatchEv>
}
    800031c8:	00813083          	ld	ra,8(sp)
    800031cc:	00013403          	ld	s0,0(sp)
    800031d0:	01010113          	addi	sp,sp,16
    800031d4:	00008067          	ret

00000000800031d8 <_ZN4KSem4waitEv>:
	if (!working) return -3;
    800031d8:	01854783          	lbu	a5,24(a0)
    800031dc:	04078663          	beqz	a5,80003228 <_ZN4KSem4waitEv+0x50>
	if (--val < 0) {
    800031e0:	00052783          	lw	a5,0(a0)
    800031e4:	fff7879b          	addiw	a5,a5,-1
    800031e8:	00f52023          	sw	a5,0(a0)
    800031ec:	02079713          	slli	a4,a5,0x20
    800031f0:	00074663          	bltz	a4,800031fc <_ZN4KSem4waitEv+0x24>
	return 0;
    800031f4:	00000513          	li	a0,0
}
    800031f8:	00008067          	ret
int KSem::wait() {
    800031fc:	ff010113          	addi	sp,sp,-16
    80003200:	00113423          	sd	ra,8(sp)
    80003204:	00813023          	sd	s0,0(sp)
    80003208:	01010413          	addi	s0,sp,16
		block();
    8000320c:	00000097          	auipc	ra,0x0
    80003210:	f84080e7          	jalr	-124(ra) # 80003190 <_ZN4KSem5blockEv>
		return -1;
    80003214:	fff00513          	li	a0,-1
}
    80003218:	00813083          	ld	ra,8(sp)
    8000321c:	00013403          	ld	s0,0(sp)
    80003220:	01010113          	addi	sp,sp,16
    80003224:	00008067          	ret
	if (!working) return -3;
    80003228:	ffd00513          	li	a0,-3
    8000322c:	00008067          	ret

0000000080003230 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003230:	ff010113          	addi	sp,sp,-16
    80003234:	00113423          	sd	ra,8(sp)
    80003238:	00813023          	sd	s0,0(sp)
    8000323c:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003240:	00850513          	addi	a0,a0,8
    80003244:	ffffe097          	auipc	ra,0xffffe
    80003248:	064080e7          	jalr	100(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
	Scheduler::put(tcb);
    8000324c:	fffff097          	auipc	ra,0xfffff
    80003250:	824080e7          	jalr	-2012(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
}
    80003254:	00813083          	ld	ra,8(sp)
    80003258:	00013403          	ld	s0,0(sp)
    8000325c:	01010113          	addi	sp,sp,16
    80003260:	00008067          	ret

0000000080003264 <_ZN4KSem6signalEv>:
	if (!working) return -3;
    80003264:	01854783          	lbu	a5,24(a0)
    80003268:	04078463          	beqz	a5,800032b0 <_ZN4KSem6signalEv+0x4c>
	if (val++ < 0) {
    8000326c:	00052783          	lw	a5,0(a0)
    80003270:	0017871b          	addiw	a4,a5,1
    80003274:	00e52023          	sw	a4,0(a0)
    80003278:	0007c663          	bltz	a5,80003284 <_ZN4KSem6signalEv+0x20>
	return 0;
    8000327c:	00000513          	li	a0,0
}
    80003280:	00008067          	ret
int KSem::signal() {
    80003284:	ff010113          	addi	sp,sp,-16
    80003288:	00113423          	sd	ra,8(sp)
    8000328c:	00813023          	sd	s0,0(sp)
    80003290:	01010413          	addi	s0,sp,16
		unblock();
    80003294:	00000097          	auipc	ra,0x0
    80003298:	f9c080e7          	jalr	-100(ra) # 80003230 <_ZN4KSem7unblockEv>
	return 0;
    8000329c:	00000513          	li	a0,0
}
    800032a0:	00813083          	ld	ra,8(sp)
    800032a4:	00013403          	ld	s0,0(sp)
    800032a8:	01010113          	addi	sp,sp,16
    800032ac:	00008067          	ret
	if (!working) return -3;
    800032b0:	ffd00513          	li	a0,-3
    800032b4:	00008067          	ret

00000000800032b8 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    800032b8:	fe010113          	addi	sp,sp,-32
    800032bc:	00113c23          	sd	ra,24(sp)
    800032c0:	00813823          	sd	s0,16(sp)
    800032c4:	00913423          	sd	s1,8(sp)
    800032c8:	02010413          	addi	s0,sp,32
    800032cc:	00050493          	mv	s1,a0
	handle->working = false;
    800032d0:	00050c23          	sb	zero,24(a0)
        return front == nullptr;
    800032d4:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    800032d8:	00078e63          	beqz	a5,800032f4 <_ZN4KSem8closeSemEPS_+0x3c>
		TCB* tcb = handle->blocked.getFirst();
    800032dc:	00848513          	addi	a0,s1,8
    800032e0:	ffffe097          	auipc	ra,0xffffe
    800032e4:	fc8080e7          	jalr	-56(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
		Scheduler::put(tcb);
    800032e8:	ffffe097          	auipc	ra,0xffffe
    800032ec:	788080e7          	jalr	1928(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    800032f0:	fe5ff06f          	j	800032d4 <_ZN4KSem8closeSemEPS_+0x1c>
	}
	return 0;
}
    800032f4:	00000513          	li	a0,0
    800032f8:	01813083          	ld	ra,24(sp)
    800032fc:	01013403          	ld	s0,16(sp)
    80003300:	00813483          	ld	s1,8(sp)
    80003304:	02010113          	addi	sp,sp,32
    80003308:	00008067          	ret

000000008000330c <_Z10testMemoryv>:
    return pok;
}

#pragma GCC optimize("O0")

void testMemory() {
    8000330c:	e6010113          	addi	sp,sp,-416
    80003310:	18113c23          	sd	ra,408(sp)
    80003314:	18813823          	sd	s0,400(sp)
    80003318:	1a010413          	addi	s0,sp,416
    char* pokazivaci[50];
    pokazivaci[0] = nullptr;
    8000331c:	e6043023          	sd	zero,-416(s0)
    pokazivaci[0] = upisi(1024 + 768);
    80003320:	70000513          	li	a0,1792
    80003324:	00000097          	auipc	ra,0x0
    80003328:	3e0080e7          	jalr	992(ra) # 80003704 <_Z5upisim>
    8000332c:	00050793          	mv	a5,a0
    80003330:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    80003334:	e6043783          	ld	a5,-416(s0)
    80003338:	02078c63          	beqz	a5,80003370 <_Z10testMemoryv+0x64>
        if (pokazivaci[0][0] == '8') {
    8000333c:	e6043783          	ld	a5,-416(s0)
    80003340:	0007c783          	lbu	a5,0(a5)
    80003344:	00078713          	mv	a4,a5
    80003348:	03800793          	li	a5,56
    8000334c:	00f71a63          	bne	a4,a5,80003360 <_Z10testMemoryv+0x54>
            printString("nea");
    80003350:	00007517          	auipc	a0,0x7
    80003354:	eb050513          	addi	a0,a0,-336 # 8000a200 <_ZZ9kPrintIntmE6digits+0x190>
    80003358:	00003097          	auipc	ra,0x3
    8000335c:	9ec080e7          	jalr	-1556(ra) # 80005d44 <_Z11printStringPKc>
        }
        MemoryAllocator::kfree(pokazivaci[0]);
    80003360:	e6043783          	ld	a5,-416(s0)
    80003364:	00078513          	mv	a0,a5
    80003368:	00004097          	auipc	ra,0x4
    8000336c:	e64080e7          	jalr	-412(ra) # 800071cc <_ZN15MemoryAllocator5kfreeEPv>
    }


    pokazivaci[0] = upisi(4096);
    80003370:	00001537          	lui	a0,0x1
    80003374:	00000097          	auipc	ra,0x0
    80003378:	390080e7          	jalr	912(ra) # 80003704 <_Z5upisim>
    8000337c:	00050793          	mv	a5,a0
    80003380:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    80003384:	e6043783          	ld	a5,-416(s0)
    80003388:	00078a63          	beqz	a5,8000339c <_Z10testMemoryv+0x90>
        MemoryAllocator::kfree(pokazivaci[0]);
    8000338c:	e6043783          	ld	a5,-416(s0)
    80003390:	00078513          	mv	a0,a5
    80003394:	00004097          	auipc	ra,0x4
    80003398:	e38080e7          	jalr	-456(ra) # 800071cc <_ZN15MemoryAllocator5kfreeEPv>
    }

    pokazivaci[0] = upisi(1024 + 768);
    8000339c:	70000513          	li	a0,1792
    800033a0:	00000097          	auipc	ra,0x0
    800033a4:	364080e7          	jalr	868(ra) # 80003704 <_Z5upisim>
    800033a8:	00050793          	mv	a5,a0
    800033ac:	e6f43023          	sd	a5,-416(s0)
    MemoryAllocator::kfree(pokazivaci[0]);
    800033b0:	e6043783          	ld	a5,-416(s0)
    800033b4:	00078513          	mv	a0,a5
    800033b8:	00004097          	auipc	ra,0x4
    800033bc:	e14080e7          	jalr	-492(ra) # 800071cc <_ZN15MemoryAllocator5kfreeEPv>

}
    800033c0:	00000013          	nop
    800033c4:	19813083          	ld	ra,408(sp)
    800033c8:	19013403          	ld	s0,400(sp)
    800033cc:	1a010113          	addi	sp,sp,416
    800033d0:	00008067          	ret

00000000800033d4 <_Z13emptyFunctionPv>:
public:
    void run() override {
        thread_dispatch();
    }
};
void emptyFunction(void*){}
    800033d4:	fe010113          	addi	sp,sp,-32
    800033d8:	00813c23          	sd	s0,24(sp)
    800033dc:	02010413          	addi	s0,sp,32
    800033e0:	fea43423          	sd	a0,-24(s0)
    800033e4:	00000013          	nop
    800033e8:	01813403          	ld	s0,24(sp)
    800033ec:	02010113          	addi	sp,sp,32
    800033f0:	00008067          	ret

00000000800033f4 <_Z5nit1fPv>:
void nit1f(void*) {
    800033f4:	fd010113          	addi	sp,sp,-48
    800033f8:	02113423          	sd	ra,40(sp)
    800033fc:	02813023          	sd	s0,32(sp)
    80003400:	03010413          	addi	s0,sp,48
    80003404:	fca43c23          	sd	a0,-40(s0)
    while (true) {
        thread_t handle;
        thread_create(&handle, emptyFunction, nullptr);
    80003408:	fe840793          	addi	a5,s0,-24
    8000340c:	00000613          	li	a2,0
    80003410:	00000597          	auipc	a1,0x0
    80003414:	fc458593          	addi	a1,a1,-60 # 800033d4 <_Z13emptyFunctionPv>
    80003418:	00078513          	mv	a0,a5
    8000341c:	ffffe097          	auipc	ra,0xffffe
    80003420:	f5c080e7          	jalr	-164(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    }
    80003424:	fe5ff06f          	j	80003408 <_Z5nit1fPv+0x14>

0000000080003428 <_Z5nit2fPv>:
    void periodicActivation() override {
        printString("Janko\n");
    }
};

void nit2f(void* arg2) {
    80003428:	fc010113          	addi	sp,sp,-64
    8000342c:	02113c23          	sd	ra,56(sp)
    80003430:	02813823          	sd	s0,48(sp)
    80003434:	02913423          	sd	s1,40(sp)
    80003438:	03213023          	sd	s2,32(sp)
    8000343c:	04010413          	addi	s0,sp,64
    80003440:	fca43423          	sd	a0,-56(s0)
    PeriodicThread* pt = new per(10);
    80003444:	02800513          	li	a0,40
    80003448:	fffff097          	auipc	ra,0xfffff
    8000344c:	458080e7          	jalr	1112(ra) # 800028a0 <_Znwm>
    80003450:	00050793          	mv	a5,a0
    80003454:	00078493          	mv	s1,a5
    80003458:	00a00593          	li	a1,10
    8000345c:	00048513          	mv	a0,s1
    80003460:	00000097          	auipc	ra,0x0
    80003464:	300080e7          	jalr	768(ra) # 80003760 <_ZN3perC1Em>
    80003468:	fc943c23          	sd	s1,-40(s0)
    pt->start();
    8000346c:	fd843783          	ld	a5,-40(s0)
    80003470:	00078513          	mv	a0,a5
    80003474:	fffff097          	auipc	ra,0xfffff
    80003478:	5e4080e7          	jalr	1508(ra) # 80002a58 <_ZN6Thread5startEv>
    time_sleep(15);
    8000347c:	00f00513          	li	a0,15
    80003480:	ffffe097          	auipc	ra,0xffffe
    80003484:	ffc080e7          	jalr	-4(ra) # 8000147c <_Z10time_sleepm>
    pt->terminate();
    80003488:	fd843503          	ld	a0,-40(s0)
    8000348c:	fffff097          	auipc	ra,0xfffff
    80003490:	7f8080e7          	jalr	2040(ra) # 80002c84 <_ZN14PeriodicThread9terminateEv>
    printString("\nGotova nit 2\n");
    80003494:	00007517          	auipc	a0,0x7
    80003498:	d7c50513          	addi	a0,a0,-644 # 8000a210 <_ZZ9kPrintIntmE6digits+0x1a0>
    8000349c:	00003097          	auipc	ra,0x3
    800034a0:	8a8080e7          	jalr	-1880(ra) # 80005d44 <_Z11printStringPKc>
}
    800034a4:	0240006f          	j	800034c8 <_Z5nit2fPv+0xa0>
    800034a8:	00050913          	mv	s2,a0
    PeriodicThread* pt = new per(10);
    800034ac:	00048513          	mv	a0,s1
    800034b0:	fffff097          	auipc	ra,0xfffff
    800034b4:	440080e7          	jalr	1088(ra) # 800028f0 <_ZdlPv>
    800034b8:	00090793          	mv	a5,s2
    800034bc:	00078513          	mv	a0,a5
    800034c0:	0000b097          	auipc	ra,0xb
    800034c4:	b28080e7          	jalr	-1240(ra) # 8000dfe8 <_Unwind_Resume>
}
    800034c8:	03813083          	ld	ra,56(sp)
    800034cc:	03013403          	ld	s0,48(sp)
    800034d0:	02813483          	ld	s1,40(sp)
    800034d4:	02013903          	ld	s2,32(sp)
    800034d8:	04010113          	addi	sp,sp,64
    800034dc:	00008067          	ret

00000000800034e0 <_Z5nit3fPv>:


void nit3f(void*) {
    800034e0:	fd010113          	addi	sp,sp,-48
    800034e4:	02113423          	sd	ra,40(sp)
    800034e8:	02813023          	sd	s0,32(sp)
    800034ec:	03010413          	addi	s0,sp,48
    800034f0:	fca43c23          	sd	a0,-40(s0)
    char slovo;
    do {
        slovo = getc();
    800034f4:	ffffe097          	auipc	ra,0xffffe
    800034f8:	080080e7          	jalr	128(ra) # 80001574 <_Z4getcv>
    800034fc:	00050793          	mv	a5,a0
    80003500:	fef407a3          	sb	a5,-17(s0)
        putc(slovo);
    80003504:	fef44783          	lbu	a5,-17(s0)
    80003508:	00078513          	mv	a0,a5
    8000350c:	ffffe097          	auipc	ra,0xffffe
    80003510:	090080e7          	jalr	144(ra) # 8000159c <_Z4putcc>
        if (slovo == '\r') putc('\n');
    80003514:	fef44783          	lbu	a5,-17(s0)
    80003518:	0ff7f713          	andi	a4,a5,255
    8000351c:	00d00793          	li	a5,13
    80003520:	00f71863          	bne	a4,a5,80003530 <_Z5nit3fPv+0x50>
    80003524:	00a00513          	li	a0,10
    80003528:	ffffe097          	auipc	ra,0xffffe
    8000352c:	074080e7          	jalr	116(ra) # 8000159c <_Z4putcc>
    } while (slovo != '0');
    80003530:	fef44783          	lbu	a5,-17(s0)
    80003534:	0ff7f713          	andi	a4,a5,255
    80003538:	03000793          	li	a5,48
    8000353c:	00f70463          	beq	a4,a5,80003544 <_Z5nit3fPv+0x64>
    do {
    80003540:	fb5ff06f          	j	800034f4 <_Z5nit3fPv+0x14>

    printString("\nGotova nit3\n");
    80003544:	00007517          	auipc	a0,0x7
    80003548:	cdc50513          	addi	a0,a0,-804 # 8000a220 <_ZZ9kPrintIntmE6digits+0x1b0>
    8000354c:	00002097          	auipc	ra,0x2
    80003550:	7f8080e7          	jalr	2040(ra) # 80005d44 <_Z11printStringPKc>
}
    80003554:	00000013          	nop
    80003558:	02813083          	ld	ra,40(sp)
    8000355c:	02013403          	ld	s0,32(sp)
    80003560:	03010113          	addi	sp,sp,48
    80003564:	00008067          	ret

0000000080003568 <main>:



int main() {
    80003568:	fc010113          	addi	sp,sp,-64
    8000356c:	02113c23          	sd	ra,56(sp)
    80003570:	02813823          	sd	s0,48(sp)
    80003574:	04010413          	addi	s0,sp,64
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80003578:	00009797          	auipc	a5,0x9
    8000357c:	7c87b783          	ld	a5,1992(a5) # 8000cd40 <_GLOBAL_OFFSET_TABLE_+0x78>
    80003580:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80003584:	fffff097          	auipc	ra,0xfffff
    80003588:	82c080e7          	jalr	-2004(ra) # 80001db0 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    8000358c:	ffffe097          	auipc	ra,0xffffe
    80003590:	0f4080e7          	jalr	244(ra) # 80001680 <_ZN8KConsole12initKConsoleEv>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

    //testiranje kreiranja niti
    thread_t glavnaNit = nullptr;
    80003594:	fe043423          	sd	zero,-24(s0)
    thread_t nit1 = nullptr;
    80003598:	fe043023          	sd	zero,-32(s0)
    thread_t nit2 = nullptr;
    8000359c:	fc043c23          	sd	zero,-40(s0)
    thread_t nit3 = nullptr;
    800035a0:	fc043823          	sd	zero,-48(s0)
    thread_t idleNit = nullptr;
    800035a4:	fc043423          	sd	zero,-56(s0)
    thread_t kernelConsumerThread = nullptr;
    800035a8:	fc043023          	sd	zero,-64(s0)
    thread_create(&glavnaNit, (TCB::Body)main, nullptr);
    800035ac:	fe840793          	addi	a5,s0,-24
    800035b0:	00000613          	li	a2,0
    800035b4:	00000597          	auipc	a1,0x0
    800035b8:	fb458593          	addi	a1,a1,-76 # 80003568 <main>
    800035bc:	00078513          	mv	a0,a5
    800035c0:	ffffe097          	auipc	ra,0xffffe
    800035c4:	db8080e7          	jalr	-584(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(glavnaNit);
    800035c8:	fe843783          	ld	a5,-24(s0)
    800035cc:	00078513          	mv	a0,a5
    800035d0:	00000097          	auipc	ra,0x0
    800035d4:	2d8080e7          	jalr	728(ra) # 800038a8 <_ZN3TCB10setRunningEPS_>
    thread_create(&idleNit, idle, nullptr);
    800035d8:	fc840793          	addi	a5,s0,-56
    800035dc:	00000613          	li	a2,0
    800035e0:	00009597          	auipc	a1,0x9
    800035e4:	7685b583          	ld	a1,1896(a1) # 8000cd48 <_GLOBAL_OFFSET_TABLE_+0x80>
    800035e8:	00078513          	mv	a0,a5
    800035ec:	ffffe097          	auipc	ra,0xffffe
    800035f0:	d8c080e7          	jalr	-628(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    800035f4:	fc040793          	addi	a5,s0,-64
    800035f8:	00000613          	li	a2,0
    800035fc:	00009597          	auipc	a1,0x9
    80003600:	7045b583          	ld	a1,1796(a1) # 8000cd00 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003604:	00078513          	mv	a0,a5
    80003608:	ffffe097          	auipc	ra,0xffffe
    8000360c:	d70080e7          	jalr	-656(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>


    thread_create(&nit1, nit1f, nullptr);
    80003610:	fe040793          	addi	a5,s0,-32
    80003614:	00000613          	li	a2,0
    80003618:	00000597          	auipc	a1,0x0
    8000361c:	ddc58593          	addi	a1,a1,-548 # 800033f4 <_Z5nit1fPv>
    80003620:	00078513          	mv	a0,a5
    80003624:	ffffe097          	auipc	ra,0xffffe
    80003628:	d54080e7          	jalr	-684(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit2, nit2f, nullptr);
    8000362c:	fd840793          	addi	a5,s0,-40
    80003630:	00000613          	li	a2,0
    80003634:	00000597          	auipc	a1,0x0
    80003638:	df458593          	addi	a1,a1,-524 # 80003428 <_Z5nit2fPv>
    8000363c:	00078513          	mv	a0,a5
    80003640:	ffffe097          	auipc	ra,0xffffe
    80003644:	d38080e7          	jalr	-712(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit3, nit3f, nullptr);
    80003648:	fd040793          	addi	a5,s0,-48
    8000364c:	00000613          	li	a2,0
    80003650:	00000597          	auipc	a1,0x0
    80003654:	e9058593          	addi	a1,a1,-368 # 800034e0 <_Z5nit3fPv>
    80003658:	00078513          	mv	a0,a5
    8000365c:	ffffe097          	auipc	ra,0xffffe
    80003660:	d1c080e7          	jalr	-740(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    80003664:	00200513          	li	a0,2
    80003668:	00000097          	auipc	ra,0x0
    8000366c:	208080e7          	jalr	520(ra) # 80003870 <_ZN5Riscv10ms_sstatusEm>

    thread_join(nit1);
    80003670:	fe043783          	ld	a5,-32(s0)
    80003674:	00078513          	mv	a0,a5
    80003678:	ffffe097          	auipc	ra,0xffffe
    8000367c:	ddc080e7          	jalr	-548(ra) # 80001454 <_Z11thread_joinP3TCB>
    thread_join(nit2);
    80003680:	fd843783          	ld	a5,-40(s0)
    80003684:	00078513          	mv	a0,a5
    80003688:	ffffe097          	auipc	ra,0xffffe
    8000368c:	dcc080e7          	jalr	-564(ra) # 80001454 <_Z11thread_joinP3TCB>
    thread_join(nit3);
    80003690:	fd043783          	ld	a5,-48(s0)
    80003694:	00078513          	mv	a0,a5
    80003698:	ffffe097          	auipc	ra,0xffffe
    8000369c:	dbc080e7          	jalr	-580(ra) # 80001454 <_Z11thread_joinP3TCB>
    //thread_join(idleNit);

    printString("\nGotove user niti\n");
    800036a0:	00007517          	auipc	a0,0x7
    800036a4:	b9050513          	addi	a0,a0,-1136 # 8000a230 <_ZZ9kPrintIntmE6digits+0x1c0>
    800036a8:	00002097          	auipc	ra,0x2
    800036ac:	69c080e7          	jalr	1692(ra) # 80005d44 <_Z11printStringPKc>

    printString("\nSad cu da izadjem\n");
    800036b0:	00007517          	auipc	a0,0x7
    800036b4:	b9850513          	addi	a0,a0,-1128 # 8000a248 <_ZZ9kPrintIntmE6digits+0x1d8>
    800036b8:	00002097          	auipc	ra,0x2
    800036bc:	68c080e7          	jalr	1676(ra) # 80005d44 <_Z11printStringPKc>
    while (KConsole::outputHead != KConsole::outputTail) {}
    800036c0:	00009797          	auipc	a5,0x9
    800036c4:	6487b783          	ld	a5,1608(a5) # 8000cd08 <_GLOBAL_OFFSET_TABLE_+0x40>
    800036c8:	0007a703          	lw	a4,0(a5)
    800036cc:	00009797          	auipc	a5,0x9
    800036d0:	6847b783          	ld	a5,1668(a5) # 8000cd50 <_GLOBAL_OFFSET_TABLE_+0x88>
    800036d4:	0007a783          	lw	a5,0(a5)
    800036d8:	00f70463          	beq	a4,a5,800036e0 <main+0x178>
    800036dc:	fe5ff06f          	j	800036c0 <main+0x158>
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    800036e0:	00200513          	li	a0,2
    800036e4:	00000097          	auipc	ra,0x0
    800036e8:	1a8080e7          	jalr	424(ra) # 8000388c <_ZN5Riscv10mc_sstatusEm>


    return 0;
    800036ec:	00000793          	li	a5,0
    800036f0:	00078513          	mv	a0,a5
    800036f4:	03813083          	ld	ra,56(sp)
    800036f8:	03013403          	ld	s0,48(sp)
    800036fc:	04010113          	addi	sp,sp,64
    80003700:	00008067          	ret

0000000080003704 <_Z5upisim>:
char* upisi(size_t alociraj) {
    80003704:	fe010113          	addi	sp,sp,-32
    80003708:	00113c23          	sd	ra,24(sp)
    8000370c:	00813823          	sd	s0,16(sp)
    80003710:	00913423          	sd	s1,8(sp)
    80003714:	02010413          	addi	s0,sp,32
    80003718:	00050493          	mv	s1,a0
    char* pok = (char*)MemoryAllocator::kmalloc(alociraj);
    8000371c:	00300593          	li	a1,3
    80003720:	00004097          	auipc	ra,0x4
    80003724:	874080e7          	jalr	-1932(ra) # 80006f94 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    if (pok) {
    80003728:	02050263          	beqz	a0,8000374c <_Z5upisim+0x48>
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    8000372c:	00000793          	li	a5,0
    80003730:	0140006f          	j	80003744 <_Z5upisim+0x40>
            pok[i] = '8';
    80003734:	00f50733          	add	a4,a0,a5
    80003738:	03800693          	li	a3,56
    8000373c:	00d70023          	sb	a3,0(a4)
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    80003740:	00178793          	addi	a5,a5,1
    80003744:	fe048713          	addi	a4,s1,-32
    80003748:	fee7e6e3          	bltu	a5,a4,80003734 <_Z5upisim+0x30>
}
    8000374c:	01813083          	ld	ra,24(sp)
    80003750:	01013403          	ld	s0,16(sp)
    80003754:	00813483          	ld	s1,8(sp)
    80003758:	02010113          	addi	sp,sp,32
    8000375c:	00008067          	ret

0000000080003760 <_ZN3perC1Em>:
    per(time_t period) : PeriodicThread(period) {}
    80003760:	fe010113          	addi	sp,sp,-32
    80003764:	00113c23          	sd	ra,24(sp)
    80003768:	00813823          	sd	s0,16(sp)
    8000376c:	02010413          	addi	s0,sp,32
    80003770:	fea43423          	sd	a0,-24(s0)
    80003774:	feb43023          	sd	a1,-32(s0)
    80003778:	fe843783          	ld	a5,-24(s0)
    8000377c:	fe043583          	ld	a1,-32(s0)
    80003780:	00078513          	mv	a0,a5
    80003784:	fffff097          	auipc	ra,0xfffff
    80003788:	520080e7          	jalr	1312(ra) # 80002ca4 <_ZN14PeriodicThreadC1Em>
    8000378c:	00009717          	auipc	a4,0x9
    80003790:	37470713          	addi	a4,a4,884 # 8000cb00 <_ZTV3per+0x10>
    80003794:	fe843783          	ld	a5,-24(s0)
    80003798:	00e7b023          	sd	a4,0(a5)
    8000379c:	00000013          	nop
    800037a0:	01813083          	ld	ra,24(sp)
    800037a4:	01013403          	ld	s0,16(sp)
    800037a8:	02010113          	addi	sp,sp,32
    800037ac:	00008067          	ret

00000000800037b0 <_ZN3per18periodicActivationEv>:
    void periodicActivation() override {
    800037b0:	fe010113          	addi	sp,sp,-32
    800037b4:	00113c23          	sd	ra,24(sp)
    800037b8:	00813823          	sd	s0,16(sp)
    800037bc:	02010413          	addi	s0,sp,32
    800037c0:	fea43423          	sd	a0,-24(s0)
        printString("Janko\n");
    800037c4:	00007517          	auipc	a0,0x7
    800037c8:	a4450513          	addi	a0,a0,-1468 # 8000a208 <_ZZ9kPrintIntmE6digits+0x198>
    800037cc:	00002097          	auipc	ra,0x2
    800037d0:	578080e7          	jalr	1400(ra) # 80005d44 <_Z11printStringPKc>
    }
    800037d4:	00000013          	nop
    800037d8:	01813083          	ld	ra,24(sp)
    800037dc:	01013403          	ld	s0,16(sp)
    800037e0:	02010113          	addi	sp,sp,32
    800037e4:	00008067          	ret

00000000800037e8 <_ZN3perD1Ev>:
class per : public PeriodicThread {
    800037e8:	ff010113          	addi	sp,sp,-16
    800037ec:	00113423          	sd	ra,8(sp)
    800037f0:	00813023          	sd	s0,0(sp)
    800037f4:	01010413          	addi	s0,sp,16
    800037f8:	00009797          	auipc	a5,0x9
    800037fc:	5007b783          	ld	a5,1280(a5) # 8000ccf8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003800:	01078793          	addi	a5,a5,16
    80003804:	00f53023          	sd	a5,0(a0)
    80003808:	fffff097          	auipc	ra,0xfffff
    8000380c:	fa8080e7          	jalr	-88(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80003810:	00813083          	ld	ra,8(sp)
    80003814:	00013403          	ld	s0,0(sp)
    80003818:	01010113          	addi	sp,sp,16
    8000381c:	00008067          	ret

0000000080003820 <_ZN3perD0Ev>:
    80003820:	fe010113          	addi	sp,sp,-32
    80003824:	00113c23          	sd	ra,24(sp)
    80003828:	00813823          	sd	s0,16(sp)
    8000382c:	00913423          	sd	s1,8(sp)
    80003830:	02010413          	addi	s0,sp,32
    80003834:	00050493          	mv	s1,a0
    80003838:	00009797          	auipc	a5,0x9
    8000383c:	4c07b783          	ld	a5,1216(a5) # 8000ccf8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003840:	01078793          	addi	a5,a5,16
    80003844:	00f53023          	sd	a5,0(a0)
    80003848:	fffff097          	auipc	ra,0xfffff
    8000384c:	f68080e7          	jalr	-152(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80003850:	00048513          	mv	a0,s1
    80003854:	fffff097          	auipc	ra,0xfffff
    80003858:	09c080e7          	jalr	156(ra) # 800028f0 <_ZdlPv>
    8000385c:	01813083          	ld	ra,24(sp)
    80003860:	01013403          	ld	s0,16(sp)
    80003864:	00813483          	ld	s1,8(sp)
    80003868:	02010113          	addi	sp,sp,32
    8000386c:	00008067          	ret

0000000080003870 <_ZN5Riscv10ms_sstatusEm>:
inline void Riscv::ms_sstatus(uint64 mask) {
    80003870:	ff010113          	addi	sp,sp,-16
    80003874:	00813423          	sd	s0,8(sp)
    80003878:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    8000387c:	10052073          	csrs	sstatus,a0
}
    80003880:	00813403          	ld	s0,8(sp)
    80003884:	01010113          	addi	sp,sp,16
    80003888:	00008067          	ret

000000008000388c <_ZN5Riscv10mc_sstatusEm>:
inline void Riscv::mc_sstatus(uint64 mask) {
    8000388c:	ff010113          	addi	sp,sp,-16
    80003890:	00813423          	sd	s0,8(sp)
    80003894:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003898:	10053073          	csrc	sstatus,a0
}
    8000389c:	00813403          	ld	s0,8(sp)
    800038a0:	01010113          	addi	sp,sp,16
    800038a4:	00008067          	ret

00000000800038a8 <_ZN3TCB10setRunningEPS_>:
    static void setRunning(TCB* newRunning) { running = newRunning; }
    800038a8:	ff010113          	addi	sp,sp,-16
    800038ac:	00813423          	sd	s0,8(sp)
    800038b0:	01010413          	addi	s0,sp,16
    800038b4:	00009797          	auipc	a5,0x9
    800038b8:	47c7b783          	ld	a5,1148(a5) # 8000cd30 <_GLOBAL_OFFSET_TABLE_+0x68>
    800038bc:	00a7b023          	sd	a0,0(a5)
    800038c0:	00813403          	ld	s0,8(sp)
    800038c4:	01010113          	addi	sp,sp,16
    800038c8:	00008067          	ret

00000000800038cc <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    800038cc:	fe010113          	addi	sp,sp,-32
    800038d0:	00113c23          	sd	ra,24(sp)
    800038d4:	00813823          	sd	s0,16(sp)
    800038d8:	00913423          	sd	s1,8(sp)
    800038dc:	01213023          	sd	s2,0(sp)
    800038e0:	02010413          	addi	s0,sp,32
    800038e4:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800038e8:	00000913          	li	s2,0
    800038ec:	00c0006f          	j	800038f8 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800038f0:	ffffe097          	auipc	ra,0xffffe
    800038f4:	b44080e7          	jalr	-1212(ra) # 80001434 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    800038f8:	ffffe097          	auipc	ra,0xffffe
    800038fc:	c7c080e7          	jalr	-900(ra) # 80001574 <_Z4getcv>
    80003900:	0005059b          	sext.w	a1,a0
    80003904:	02d00793          	li	a5,45
    80003908:	02f58a63          	beq	a1,a5,8000393c <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    8000390c:	0084b503          	ld	a0,8(s1)
    80003910:	00003097          	auipc	ra,0x3
    80003914:	400080e7          	jalr	1024(ra) # 80006d10 <_ZN6Buffer3putEi>
        i++;
    80003918:	0019071b          	addiw	a4,s2,1
    8000391c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003920:	0004a683          	lw	a3,0(s1)
    80003924:	0026979b          	slliw	a5,a3,0x2
    80003928:	00d787bb          	addw	a5,a5,a3
    8000392c:	0017979b          	slliw	a5,a5,0x1
    80003930:	02f767bb          	remw	a5,a4,a5
    80003934:	fc0792e3          	bnez	a5,800038f8 <_ZL16producerKeyboardPv+0x2c>
    80003938:	fb9ff06f          	j	800038f0 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    8000393c:	00100793          	li	a5,1
    80003940:	00009717          	auipc	a4,0x9
    80003944:	56f72823          	sw	a5,1392(a4) # 8000ceb0 <_ZL9threadEnd>
    data->buffer->put('!');
    80003948:	02100593          	li	a1,33
    8000394c:	0084b503          	ld	a0,8(s1)
    80003950:	00003097          	auipc	ra,0x3
    80003954:	3c0080e7          	jalr	960(ra) # 80006d10 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003958:	0104b503          	ld	a0,16(s1)
    8000395c:	ffffe097          	auipc	ra,0xffffe
    80003960:	be8080e7          	jalr	-1048(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    80003964:	01813083          	ld	ra,24(sp)
    80003968:	01013403          	ld	s0,16(sp)
    8000396c:	00813483          	ld	s1,8(sp)
    80003970:	00013903          	ld	s2,0(sp)
    80003974:	02010113          	addi	sp,sp,32
    80003978:	00008067          	ret

000000008000397c <_ZL8producerPv>:

static void producer(void *arg) {
    8000397c:	fe010113          	addi	sp,sp,-32
    80003980:	00113c23          	sd	ra,24(sp)
    80003984:	00813823          	sd	s0,16(sp)
    80003988:	00913423          	sd	s1,8(sp)
    8000398c:	01213023          	sd	s2,0(sp)
    80003990:	02010413          	addi	s0,sp,32
    80003994:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003998:	00000913          	li	s2,0
    8000399c:	00c0006f          	j	800039a8 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800039a0:	ffffe097          	auipc	ra,0xffffe
    800039a4:	a94080e7          	jalr	-1388(ra) # 80001434 <_Z15thread_dispatchv>
    while (!threadEnd) {
    800039a8:	00009797          	auipc	a5,0x9
    800039ac:	5087a783          	lw	a5,1288(a5) # 8000ceb0 <_ZL9threadEnd>
    800039b0:	02079e63          	bnez	a5,800039ec <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    800039b4:	0004a583          	lw	a1,0(s1)
    800039b8:	0305859b          	addiw	a1,a1,48
    800039bc:	0084b503          	ld	a0,8(s1)
    800039c0:	00003097          	auipc	ra,0x3
    800039c4:	350080e7          	jalr	848(ra) # 80006d10 <_ZN6Buffer3putEi>
        i++;
    800039c8:	0019071b          	addiw	a4,s2,1
    800039cc:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800039d0:	0004a683          	lw	a3,0(s1)
    800039d4:	0026979b          	slliw	a5,a3,0x2
    800039d8:	00d787bb          	addw	a5,a5,a3
    800039dc:	0017979b          	slliw	a5,a5,0x1
    800039e0:	02f767bb          	remw	a5,a4,a5
    800039e4:	fc0792e3          	bnez	a5,800039a8 <_ZL8producerPv+0x2c>
    800039e8:	fb9ff06f          	j	800039a0 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    800039ec:	0104b503          	ld	a0,16(s1)
    800039f0:	ffffe097          	auipc	ra,0xffffe
    800039f4:	b54080e7          	jalr	-1196(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    800039f8:	01813083          	ld	ra,24(sp)
    800039fc:	01013403          	ld	s0,16(sp)
    80003a00:	00813483          	ld	s1,8(sp)
    80003a04:	00013903          	ld	s2,0(sp)
    80003a08:	02010113          	addi	sp,sp,32
    80003a0c:	00008067          	ret

0000000080003a10 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003a10:	fd010113          	addi	sp,sp,-48
    80003a14:	02113423          	sd	ra,40(sp)
    80003a18:	02813023          	sd	s0,32(sp)
    80003a1c:	00913c23          	sd	s1,24(sp)
    80003a20:	01213823          	sd	s2,16(sp)
    80003a24:	01313423          	sd	s3,8(sp)
    80003a28:	03010413          	addi	s0,sp,48
    80003a2c:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003a30:	00000993          	li	s3,0
    80003a34:	01c0006f          	j	80003a50 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003a38:	ffffe097          	auipc	ra,0xffffe
    80003a3c:	9fc080e7          	jalr	-1540(ra) # 80001434 <_Z15thread_dispatchv>
    80003a40:	0500006f          	j	80003a90 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003a44:	00a00513          	li	a0,10
    80003a48:	ffffe097          	auipc	ra,0xffffe
    80003a4c:	b54080e7          	jalr	-1196(ra) # 8000159c <_Z4putcc>
    while (!threadEnd) {
    80003a50:	00009797          	auipc	a5,0x9
    80003a54:	4607a783          	lw	a5,1120(a5) # 8000ceb0 <_ZL9threadEnd>
    80003a58:	06079063          	bnez	a5,80003ab8 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003a5c:	00893503          	ld	a0,8(s2)
    80003a60:	00003097          	auipc	ra,0x3
    80003a64:	340080e7          	jalr	832(ra) # 80006da0 <_ZN6Buffer3getEv>
        i++;
    80003a68:	0019849b          	addiw	s1,s3,1
    80003a6c:	0004899b          	sext.w	s3,s1
        putc(key);
    80003a70:	0ff57513          	andi	a0,a0,255
    80003a74:	ffffe097          	auipc	ra,0xffffe
    80003a78:	b28080e7          	jalr	-1240(ra) # 8000159c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003a7c:	00092703          	lw	a4,0(s2)
    80003a80:	0027179b          	slliw	a5,a4,0x2
    80003a84:	00e787bb          	addw	a5,a5,a4
    80003a88:	02f4e7bb          	remw	a5,s1,a5
    80003a8c:	fa0786e3          	beqz	a5,80003a38 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003a90:	05000793          	li	a5,80
    80003a94:	02f4e4bb          	remw	s1,s1,a5
    80003a98:	fa049ce3          	bnez	s1,80003a50 <_ZL8consumerPv+0x40>
    80003a9c:	fa9ff06f          	j	80003a44 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003aa0:	00893503          	ld	a0,8(s2)
    80003aa4:	00003097          	auipc	ra,0x3
    80003aa8:	2fc080e7          	jalr	764(ra) # 80006da0 <_ZN6Buffer3getEv>
        putc(key);
    80003aac:	0ff57513          	andi	a0,a0,255
    80003ab0:	ffffe097          	auipc	ra,0xffffe
    80003ab4:	aec080e7          	jalr	-1300(ra) # 8000159c <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003ab8:	00893503          	ld	a0,8(s2)
    80003abc:	00003097          	auipc	ra,0x3
    80003ac0:	370080e7          	jalr	880(ra) # 80006e2c <_ZN6Buffer6getCntEv>
    80003ac4:	fca04ee3          	bgtz	a0,80003aa0 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003ac8:	01093503          	ld	a0,16(s2)
    80003acc:	ffffe097          	auipc	ra,0xffffe
    80003ad0:	a78080e7          	jalr	-1416(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    80003ad4:	02813083          	ld	ra,40(sp)
    80003ad8:	02013403          	ld	s0,32(sp)
    80003adc:	01813483          	ld	s1,24(sp)
    80003ae0:	01013903          	ld	s2,16(sp)
    80003ae4:	00813983          	ld	s3,8(sp)
    80003ae8:	03010113          	addi	sp,sp,48
    80003aec:	00008067          	ret

0000000080003af0 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003af0:	f9010113          	addi	sp,sp,-112
    80003af4:	06113423          	sd	ra,104(sp)
    80003af8:	06813023          	sd	s0,96(sp)
    80003afc:	04913c23          	sd	s1,88(sp)
    80003b00:	05213823          	sd	s2,80(sp)
    80003b04:	05313423          	sd	s3,72(sp)
    80003b08:	05413023          	sd	s4,64(sp)
    80003b0c:	03513c23          	sd	s5,56(sp)
    80003b10:	03613823          	sd	s6,48(sp)
    80003b14:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003b18:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003b1c:	00006517          	auipc	a0,0x6
    80003b20:	74450513          	addi	a0,a0,1860 # 8000a260 <_ZZ9kPrintIntmE6digits+0x1f0>
    80003b24:	00002097          	auipc	ra,0x2
    80003b28:	220080e7          	jalr	544(ra) # 80005d44 <_Z11printStringPKc>
    getString(input, 30);
    80003b2c:	01e00593          	li	a1,30
    80003b30:	fa040493          	addi	s1,s0,-96
    80003b34:	00048513          	mv	a0,s1
    80003b38:	00002097          	auipc	ra,0x2
    80003b3c:	294080e7          	jalr	660(ra) # 80005dcc <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003b40:	00048513          	mv	a0,s1
    80003b44:	00002097          	auipc	ra,0x2
    80003b48:	360080e7          	jalr	864(ra) # 80005ea4 <_Z11stringToIntPKc>
    80003b4c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003b50:	00006517          	auipc	a0,0x6
    80003b54:	73050513          	addi	a0,a0,1840 # 8000a280 <_ZZ9kPrintIntmE6digits+0x210>
    80003b58:	00002097          	auipc	ra,0x2
    80003b5c:	1ec080e7          	jalr	492(ra) # 80005d44 <_Z11printStringPKc>
    getString(input, 30);
    80003b60:	01e00593          	li	a1,30
    80003b64:	00048513          	mv	a0,s1
    80003b68:	00002097          	auipc	ra,0x2
    80003b6c:	264080e7          	jalr	612(ra) # 80005dcc <_Z9getStringPci>
    n = stringToInt(input);
    80003b70:	00048513          	mv	a0,s1
    80003b74:	00002097          	auipc	ra,0x2
    80003b78:	330080e7          	jalr	816(ra) # 80005ea4 <_Z11stringToIntPKc>
    80003b7c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003b80:	00006517          	auipc	a0,0x6
    80003b84:	72050513          	addi	a0,a0,1824 # 8000a2a0 <_ZZ9kPrintIntmE6digits+0x230>
    80003b88:	00002097          	auipc	ra,0x2
    80003b8c:	1bc080e7          	jalr	444(ra) # 80005d44 <_Z11printStringPKc>
	printInt(threadNum);
    80003b90:	00000613          	li	a2,0
    80003b94:	00a00593          	li	a1,10
    80003b98:	00090513          	mv	a0,s2
    80003b9c:	00002097          	auipc	ra,0x2
    80003ba0:	358080e7          	jalr	856(ra) # 80005ef4 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003ba4:	00006517          	auipc	a0,0x6
    80003ba8:	71450513          	addi	a0,a0,1812 # 8000a2b8 <_ZZ9kPrintIntmE6digits+0x248>
    80003bac:	00002097          	auipc	ra,0x2
    80003bb0:	198080e7          	jalr	408(ra) # 80005d44 <_Z11printStringPKc>
	printInt(n);
    80003bb4:	00000613          	li	a2,0
    80003bb8:	00a00593          	li	a1,10
    80003bbc:	00048513          	mv	a0,s1
    80003bc0:	00002097          	auipc	ra,0x2
    80003bc4:	334080e7          	jalr	820(ra) # 80005ef4 <_Z8printIntiii>
    printString(".\n");
    80003bc8:	00006517          	auipc	a0,0x6
    80003bcc:	70850513          	addi	a0,a0,1800 # 8000a2d0 <_ZZ9kPrintIntmE6digits+0x260>
    80003bd0:	00002097          	auipc	ra,0x2
    80003bd4:	174080e7          	jalr	372(ra) # 80005d44 <_Z11printStringPKc>
    if(threadNum > n) {
    80003bd8:	0324c463          	blt	s1,s2,80003c00 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003bdc:	03205c63          	blez	s2,80003c14 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003be0:	03800513          	li	a0,56
    80003be4:	fffff097          	auipc	ra,0xfffff
    80003be8:	cbc080e7          	jalr	-836(ra) # 800028a0 <_Znwm>
    80003bec:	00050a13          	mv	s4,a0
    80003bf0:	00048593          	mv	a1,s1
    80003bf4:	00003097          	auipc	ra,0x3
    80003bf8:	080080e7          	jalr	128(ra) # 80006c74 <_ZN6BufferC1Ei>
    80003bfc:	0300006f          	j	80003c2c <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003c00:	00006517          	auipc	a0,0x6
    80003c04:	6d850513          	addi	a0,a0,1752 # 8000a2d8 <_ZZ9kPrintIntmE6digits+0x268>
    80003c08:	00002097          	auipc	ra,0x2
    80003c0c:	13c080e7          	jalr	316(ra) # 80005d44 <_Z11printStringPKc>
        return;
    80003c10:	0140006f          	j	80003c24 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003c14:	00006517          	auipc	a0,0x6
    80003c18:	70450513          	addi	a0,a0,1796 # 8000a318 <_ZZ9kPrintIntmE6digits+0x2a8>
    80003c1c:	00002097          	auipc	ra,0x2
    80003c20:	128080e7          	jalr	296(ra) # 80005d44 <_Z11printStringPKc>
        return;
    80003c24:	000b0113          	mv	sp,s6
    80003c28:	1500006f          	j	80003d78 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003c2c:	00000593          	li	a1,0
    80003c30:	00009517          	auipc	a0,0x9
    80003c34:	28850513          	addi	a0,a0,648 # 8000ceb8 <_ZL10waitForAll>
    80003c38:	ffffe097          	auipc	ra,0xffffe
    80003c3c:	874080e7          	jalr	-1932(ra) # 800014ac <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003c40:	00391793          	slli	a5,s2,0x3
    80003c44:	00f78793          	addi	a5,a5,15
    80003c48:	ff07f793          	andi	a5,a5,-16
    80003c4c:	40f10133          	sub	sp,sp,a5
    80003c50:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003c54:	0019071b          	addiw	a4,s2,1
    80003c58:	00171793          	slli	a5,a4,0x1
    80003c5c:	00e787b3          	add	a5,a5,a4
    80003c60:	00379793          	slli	a5,a5,0x3
    80003c64:	00f78793          	addi	a5,a5,15
    80003c68:	ff07f793          	andi	a5,a5,-16
    80003c6c:	40f10133          	sub	sp,sp,a5
    80003c70:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003c74:	00191613          	slli	a2,s2,0x1
    80003c78:	012607b3          	add	a5,a2,s2
    80003c7c:	00379793          	slli	a5,a5,0x3
    80003c80:	00f987b3          	add	a5,s3,a5
    80003c84:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003c88:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003c8c:	00009717          	auipc	a4,0x9
    80003c90:	22c73703          	ld	a4,556(a4) # 8000ceb8 <_ZL10waitForAll>
    80003c94:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003c98:	00078613          	mv	a2,a5
    80003c9c:	00000597          	auipc	a1,0x0
    80003ca0:	d7458593          	addi	a1,a1,-652 # 80003a10 <_ZL8consumerPv>
    80003ca4:	f9840513          	addi	a0,s0,-104
    80003ca8:	ffffd097          	auipc	ra,0xffffd
    80003cac:	6d0080e7          	jalr	1744(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003cb0:	00000493          	li	s1,0
    80003cb4:	0280006f          	j	80003cdc <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003cb8:	00000597          	auipc	a1,0x0
    80003cbc:	c1458593          	addi	a1,a1,-1004 # 800038cc <_ZL16producerKeyboardPv>
                      data + i);
    80003cc0:	00179613          	slli	a2,a5,0x1
    80003cc4:	00f60633          	add	a2,a2,a5
    80003cc8:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003ccc:	00c98633          	add	a2,s3,a2
    80003cd0:	ffffd097          	auipc	ra,0xffffd
    80003cd4:	6a8080e7          	jalr	1704(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003cd8:	0014849b          	addiw	s1,s1,1
    80003cdc:	0524d263          	bge	s1,s2,80003d20 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003ce0:	00149793          	slli	a5,s1,0x1
    80003ce4:	009787b3          	add	a5,a5,s1
    80003ce8:	00379793          	slli	a5,a5,0x3
    80003cec:	00f987b3          	add	a5,s3,a5
    80003cf0:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003cf4:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003cf8:	00009717          	auipc	a4,0x9
    80003cfc:	1c073703          	ld	a4,448(a4) # 8000ceb8 <_ZL10waitForAll>
    80003d00:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003d04:	00048793          	mv	a5,s1
    80003d08:	00349513          	slli	a0,s1,0x3
    80003d0c:	00aa8533          	add	a0,s5,a0
    80003d10:	fa9054e3          	blez	s1,80003cb8 <_Z22producerConsumer_C_APIv+0x1c8>
    80003d14:	00000597          	auipc	a1,0x0
    80003d18:	c6858593          	addi	a1,a1,-920 # 8000397c <_ZL8producerPv>
    80003d1c:	fa5ff06f          	j	80003cc0 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003d20:	ffffd097          	auipc	ra,0xffffd
    80003d24:	714080e7          	jalr	1812(ra) # 80001434 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003d28:	00000493          	li	s1,0
    80003d2c:	00994e63          	blt	s2,s1,80003d48 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003d30:	00009517          	auipc	a0,0x9
    80003d34:	18853503          	ld	a0,392(a0) # 8000ceb8 <_ZL10waitForAll>
    80003d38:	ffffd097          	auipc	ra,0xffffd
    80003d3c:	7dc080e7          	jalr	2012(ra) # 80001514 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003d40:	0014849b          	addiw	s1,s1,1
    80003d44:	fe9ff06f          	j	80003d2c <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003d48:	00009517          	auipc	a0,0x9
    80003d4c:	17053503          	ld	a0,368(a0) # 8000ceb8 <_ZL10waitForAll>
    80003d50:	ffffd097          	auipc	ra,0xffffd
    80003d54:	794080e7          	jalr	1940(ra) # 800014e4 <_Z9sem_closeP4KSem>
    delete buffer;
    80003d58:	000a0e63          	beqz	s4,80003d74 <_Z22producerConsumer_C_APIv+0x284>
    80003d5c:	000a0513          	mv	a0,s4
    80003d60:	00003097          	auipc	ra,0x3
    80003d64:	154080e7          	jalr	340(ra) # 80006eb4 <_ZN6BufferD1Ev>
    80003d68:	000a0513          	mv	a0,s4
    80003d6c:	fffff097          	auipc	ra,0xfffff
    80003d70:	b84080e7          	jalr	-1148(ra) # 800028f0 <_ZdlPv>
    80003d74:	000b0113          	mv	sp,s6

}
    80003d78:	f9040113          	addi	sp,s0,-112
    80003d7c:	06813083          	ld	ra,104(sp)
    80003d80:	06013403          	ld	s0,96(sp)
    80003d84:	05813483          	ld	s1,88(sp)
    80003d88:	05013903          	ld	s2,80(sp)
    80003d8c:	04813983          	ld	s3,72(sp)
    80003d90:	04013a03          	ld	s4,64(sp)
    80003d94:	03813a83          	ld	s5,56(sp)
    80003d98:	03013b03          	ld	s6,48(sp)
    80003d9c:	07010113          	addi	sp,sp,112
    80003da0:	00008067          	ret
    80003da4:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003da8:	000a0513          	mv	a0,s4
    80003dac:	fffff097          	auipc	ra,0xfffff
    80003db0:	b44080e7          	jalr	-1212(ra) # 800028f0 <_ZdlPv>
    80003db4:	00048513          	mv	a0,s1
    80003db8:	0000a097          	auipc	ra,0xa
    80003dbc:	230080e7          	jalr	560(ra) # 8000dfe8 <_Unwind_Resume>

0000000080003dc0 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003dc0:	fe010113          	addi	sp,sp,-32
    80003dc4:	00113c23          	sd	ra,24(sp)
    80003dc8:	00813823          	sd	s0,16(sp)
    80003dcc:	00913423          	sd	s1,8(sp)
    80003dd0:	01213023          	sd	s2,0(sp)
    80003dd4:	02010413          	addi	s0,sp,32
    80003dd8:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003ddc:	00100793          	li	a5,1
    80003de0:	02a7f863          	bgeu	a5,a0,80003e10 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003de4:	00a00793          	li	a5,10
    80003de8:	02f577b3          	remu	a5,a0,a5
    80003dec:	02078e63          	beqz	a5,80003e28 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003df0:	fff48513          	addi	a0,s1,-1
    80003df4:	00000097          	auipc	ra,0x0
    80003df8:	fcc080e7          	jalr	-52(ra) # 80003dc0 <_ZL9fibonaccim>
    80003dfc:	00050913          	mv	s2,a0
    80003e00:	ffe48513          	addi	a0,s1,-2
    80003e04:	00000097          	auipc	ra,0x0
    80003e08:	fbc080e7          	jalr	-68(ra) # 80003dc0 <_ZL9fibonaccim>
    80003e0c:	00a90533          	add	a0,s2,a0
}
    80003e10:	01813083          	ld	ra,24(sp)
    80003e14:	01013403          	ld	s0,16(sp)
    80003e18:	00813483          	ld	s1,8(sp)
    80003e1c:	00013903          	ld	s2,0(sp)
    80003e20:	02010113          	addi	sp,sp,32
    80003e24:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003e28:	ffffd097          	auipc	ra,0xffffd
    80003e2c:	60c080e7          	jalr	1548(ra) # 80001434 <_Z15thread_dispatchv>
    80003e30:	fc1ff06f          	j	80003df0 <_ZL9fibonaccim+0x30>

0000000080003e34 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003e34:	fe010113          	addi	sp,sp,-32
    80003e38:	00113c23          	sd	ra,24(sp)
    80003e3c:	00813823          	sd	s0,16(sp)
    80003e40:	00913423          	sd	s1,8(sp)
    80003e44:	01213023          	sd	s2,0(sp)
    80003e48:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003e4c:	00000913          	li	s2,0
    80003e50:	0380006f          	j	80003e88 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003e54:	ffffd097          	auipc	ra,0xffffd
    80003e58:	5e0080e7          	jalr	1504(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003e5c:	00148493          	addi	s1,s1,1
    80003e60:	000027b7          	lui	a5,0x2
    80003e64:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003e68:	0097ee63          	bltu	a5,s1,80003e84 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003e6c:	00000713          	li	a4,0
    80003e70:	000077b7          	lui	a5,0x7
    80003e74:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003e78:	fce7eee3          	bltu	a5,a4,80003e54 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003e7c:	00170713          	addi	a4,a4,1
    80003e80:	ff1ff06f          	j	80003e70 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003e84:	00190913          	addi	s2,s2,1
    80003e88:	00900793          	li	a5,9
    80003e8c:	0527e063          	bltu	a5,s2,80003ecc <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003e90:	00006517          	auipc	a0,0x6
    80003e94:	4b850513          	addi	a0,a0,1208 # 8000a348 <_ZZ9kPrintIntmE6digits+0x2d8>
    80003e98:	00002097          	auipc	ra,0x2
    80003e9c:	eac080e7          	jalr	-340(ra) # 80005d44 <_Z11printStringPKc>
    80003ea0:	00000613          	li	a2,0
    80003ea4:	00a00593          	li	a1,10
    80003ea8:	0009051b          	sext.w	a0,s2
    80003eac:	00002097          	auipc	ra,0x2
    80003eb0:	048080e7          	jalr	72(ra) # 80005ef4 <_Z8printIntiii>
    80003eb4:	00006517          	auipc	a0,0x6
    80003eb8:	6f450513          	addi	a0,a0,1780 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80003ebc:	00002097          	auipc	ra,0x2
    80003ec0:	e88080e7          	jalr	-376(ra) # 80005d44 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003ec4:	00000493          	li	s1,0
    80003ec8:	f99ff06f          	j	80003e60 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003ecc:	00006517          	auipc	a0,0x6
    80003ed0:	48450513          	addi	a0,a0,1156 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80003ed4:	00002097          	auipc	ra,0x2
    80003ed8:	e70080e7          	jalr	-400(ra) # 80005d44 <_Z11printStringPKc>
    finishedA = true;
    80003edc:	00100793          	li	a5,1
    80003ee0:	00009717          	auipc	a4,0x9
    80003ee4:	fef70023          	sb	a5,-32(a4) # 8000cec0 <_ZL9finishedA>
}
    80003ee8:	01813083          	ld	ra,24(sp)
    80003eec:	01013403          	ld	s0,16(sp)
    80003ef0:	00813483          	ld	s1,8(sp)
    80003ef4:	00013903          	ld	s2,0(sp)
    80003ef8:	02010113          	addi	sp,sp,32
    80003efc:	00008067          	ret

0000000080003f00 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003f00:	fe010113          	addi	sp,sp,-32
    80003f04:	00113c23          	sd	ra,24(sp)
    80003f08:	00813823          	sd	s0,16(sp)
    80003f0c:	00913423          	sd	s1,8(sp)
    80003f10:	01213023          	sd	s2,0(sp)
    80003f14:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003f18:	00000913          	li	s2,0
    80003f1c:	0380006f          	j	80003f54 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003f20:	ffffd097          	auipc	ra,0xffffd
    80003f24:	514080e7          	jalr	1300(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003f28:	00148493          	addi	s1,s1,1
    80003f2c:	000027b7          	lui	a5,0x2
    80003f30:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003f34:	0097ee63          	bltu	a5,s1,80003f50 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003f38:	00000713          	li	a4,0
    80003f3c:	000077b7          	lui	a5,0x7
    80003f40:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003f44:	fce7eee3          	bltu	a5,a4,80003f20 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003f48:	00170713          	addi	a4,a4,1
    80003f4c:	ff1ff06f          	j	80003f3c <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003f50:	00190913          	addi	s2,s2,1
    80003f54:	00f00793          	li	a5,15
    80003f58:	0527e063          	bltu	a5,s2,80003f98 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003f5c:	00006517          	auipc	a0,0x6
    80003f60:	40450513          	addi	a0,a0,1028 # 8000a360 <_ZZ9kPrintIntmE6digits+0x2f0>
    80003f64:	00002097          	auipc	ra,0x2
    80003f68:	de0080e7          	jalr	-544(ra) # 80005d44 <_Z11printStringPKc>
    80003f6c:	00000613          	li	a2,0
    80003f70:	00a00593          	li	a1,10
    80003f74:	0009051b          	sext.w	a0,s2
    80003f78:	00002097          	auipc	ra,0x2
    80003f7c:	f7c080e7          	jalr	-132(ra) # 80005ef4 <_Z8printIntiii>
    80003f80:	00006517          	auipc	a0,0x6
    80003f84:	62850513          	addi	a0,a0,1576 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80003f88:	00002097          	auipc	ra,0x2
    80003f8c:	dbc080e7          	jalr	-580(ra) # 80005d44 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003f90:	00000493          	li	s1,0
    80003f94:	f99ff06f          	j	80003f2c <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003f98:	00006517          	auipc	a0,0x6
    80003f9c:	3d050513          	addi	a0,a0,976 # 8000a368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80003fa0:	00002097          	auipc	ra,0x2
    80003fa4:	da4080e7          	jalr	-604(ra) # 80005d44 <_Z11printStringPKc>
    finishedB = true;
    80003fa8:	00100793          	li	a5,1
    80003fac:	00009717          	auipc	a4,0x9
    80003fb0:	f0f70aa3          	sb	a5,-235(a4) # 8000cec1 <_ZL9finishedB>
    thread_dispatch();
    80003fb4:	ffffd097          	auipc	ra,0xffffd
    80003fb8:	480080e7          	jalr	1152(ra) # 80001434 <_Z15thread_dispatchv>
}
    80003fbc:	01813083          	ld	ra,24(sp)
    80003fc0:	01013403          	ld	s0,16(sp)
    80003fc4:	00813483          	ld	s1,8(sp)
    80003fc8:	00013903          	ld	s2,0(sp)
    80003fcc:	02010113          	addi	sp,sp,32
    80003fd0:	00008067          	ret

0000000080003fd4 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003fd4:	fe010113          	addi	sp,sp,-32
    80003fd8:	00113c23          	sd	ra,24(sp)
    80003fdc:	00813823          	sd	s0,16(sp)
    80003fe0:	00913423          	sd	s1,8(sp)
    80003fe4:	01213023          	sd	s2,0(sp)
    80003fe8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003fec:	00000493          	li	s1,0
    80003ff0:	0400006f          	j	80004030 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003ff4:	00006517          	auipc	a0,0x6
    80003ff8:	38450513          	addi	a0,a0,900 # 8000a378 <_ZZ9kPrintIntmE6digits+0x308>
    80003ffc:	00002097          	auipc	ra,0x2
    80004000:	d48080e7          	jalr	-696(ra) # 80005d44 <_Z11printStringPKc>
    80004004:	00000613          	li	a2,0
    80004008:	00a00593          	li	a1,10
    8000400c:	00048513          	mv	a0,s1
    80004010:	00002097          	auipc	ra,0x2
    80004014:	ee4080e7          	jalr	-284(ra) # 80005ef4 <_Z8printIntiii>
    80004018:	00006517          	auipc	a0,0x6
    8000401c:	59050513          	addi	a0,a0,1424 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80004020:	00002097          	auipc	ra,0x2
    80004024:	d24080e7          	jalr	-732(ra) # 80005d44 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004028:	0014849b          	addiw	s1,s1,1
    8000402c:	0ff4f493          	andi	s1,s1,255
    80004030:	00200793          	li	a5,2
    80004034:	fc97f0e3          	bgeu	a5,s1,80003ff4 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80004038:	00006517          	auipc	a0,0x6
    8000403c:	34850513          	addi	a0,a0,840 # 8000a380 <_ZZ9kPrintIntmE6digits+0x310>
    80004040:	00002097          	auipc	ra,0x2
    80004044:	d04080e7          	jalr	-764(ra) # 80005d44 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004048:	00700313          	li	t1,7
    thread_dispatch();
    8000404c:	ffffd097          	auipc	ra,0xffffd
    80004050:	3e8080e7          	jalr	1000(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004054:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80004058:	00006517          	auipc	a0,0x6
    8000405c:	33850513          	addi	a0,a0,824 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80004060:	00002097          	auipc	ra,0x2
    80004064:	ce4080e7          	jalr	-796(ra) # 80005d44 <_Z11printStringPKc>
    80004068:	00000613          	li	a2,0
    8000406c:	00a00593          	li	a1,10
    80004070:	0009051b          	sext.w	a0,s2
    80004074:	00002097          	auipc	ra,0x2
    80004078:	e80080e7          	jalr	-384(ra) # 80005ef4 <_Z8printIntiii>
    8000407c:	00006517          	auipc	a0,0x6
    80004080:	52c50513          	addi	a0,a0,1324 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80004084:	00002097          	auipc	ra,0x2
    80004088:	cc0080e7          	jalr	-832(ra) # 80005d44 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    8000408c:	00c00513          	li	a0,12
    80004090:	00000097          	auipc	ra,0x0
    80004094:	d30080e7          	jalr	-720(ra) # 80003dc0 <_ZL9fibonaccim>
    80004098:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000409c:	00006517          	auipc	a0,0x6
    800040a0:	2fc50513          	addi	a0,a0,764 # 8000a398 <_ZZ9kPrintIntmE6digits+0x328>
    800040a4:	00002097          	auipc	ra,0x2
    800040a8:	ca0080e7          	jalr	-864(ra) # 80005d44 <_Z11printStringPKc>
    800040ac:	00000613          	li	a2,0
    800040b0:	00a00593          	li	a1,10
    800040b4:	0009051b          	sext.w	a0,s2
    800040b8:	00002097          	auipc	ra,0x2
    800040bc:	e3c080e7          	jalr	-452(ra) # 80005ef4 <_Z8printIntiii>
    800040c0:	00006517          	auipc	a0,0x6
    800040c4:	4e850513          	addi	a0,a0,1256 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    800040c8:	00002097          	auipc	ra,0x2
    800040cc:	c7c080e7          	jalr	-900(ra) # 80005d44 <_Z11printStringPKc>
    800040d0:	0400006f          	j	80004110 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800040d4:	00006517          	auipc	a0,0x6
    800040d8:	2a450513          	addi	a0,a0,676 # 8000a378 <_ZZ9kPrintIntmE6digits+0x308>
    800040dc:	00002097          	auipc	ra,0x2
    800040e0:	c68080e7          	jalr	-920(ra) # 80005d44 <_Z11printStringPKc>
    800040e4:	00000613          	li	a2,0
    800040e8:	00a00593          	li	a1,10
    800040ec:	00048513          	mv	a0,s1
    800040f0:	00002097          	auipc	ra,0x2
    800040f4:	e04080e7          	jalr	-508(ra) # 80005ef4 <_Z8printIntiii>
    800040f8:	00006517          	auipc	a0,0x6
    800040fc:	4b050513          	addi	a0,a0,1200 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80004100:	00002097          	auipc	ra,0x2
    80004104:	c44080e7          	jalr	-956(ra) # 80005d44 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004108:	0014849b          	addiw	s1,s1,1
    8000410c:	0ff4f493          	andi	s1,s1,255
    80004110:	00500793          	li	a5,5
    80004114:	fc97f0e3          	bgeu	a5,s1,800040d4 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80004118:	00006517          	auipc	a0,0x6
    8000411c:	29050513          	addi	a0,a0,656 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    80004120:	00002097          	auipc	ra,0x2
    80004124:	c24080e7          	jalr	-988(ra) # 80005d44 <_Z11printStringPKc>
    finishedC = true;
    80004128:	00100793          	li	a5,1
    8000412c:	00009717          	auipc	a4,0x9
    80004130:	d8f70b23          	sb	a5,-618(a4) # 8000cec2 <_ZL9finishedC>
    thread_dispatch();
    80004134:	ffffd097          	auipc	ra,0xffffd
    80004138:	300080e7          	jalr	768(ra) # 80001434 <_Z15thread_dispatchv>
}
    8000413c:	01813083          	ld	ra,24(sp)
    80004140:	01013403          	ld	s0,16(sp)
    80004144:	00813483          	ld	s1,8(sp)
    80004148:	00013903          	ld	s2,0(sp)
    8000414c:	02010113          	addi	sp,sp,32
    80004150:	00008067          	ret

0000000080004154 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80004154:	fe010113          	addi	sp,sp,-32
    80004158:	00113c23          	sd	ra,24(sp)
    8000415c:	00813823          	sd	s0,16(sp)
    80004160:	00913423          	sd	s1,8(sp)
    80004164:	01213023          	sd	s2,0(sp)
    80004168:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000416c:	00a00493          	li	s1,10
    80004170:	0400006f          	j	800041b0 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004174:	00006517          	auipc	a0,0x6
    80004178:	24450513          	addi	a0,a0,580 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    8000417c:	00002097          	auipc	ra,0x2
    80004180:	bc8080e7          	jalr	-1080(ra) # 80005d44 <_Z11printStringPKc>
    80004184:	00000613          	li	a2,0
    80004188:	00a00593          	li	a1,10
    8000418c:	00048513          	mv	a0,s1
    80004190:	00002097          	auipc	ra,0x2
    80004194:	d64080e7          	jalr	-668(ra) # 80005ef4 <_Z8printIntiii>
    80004198:	00006517          	auipc	a0,0x6
    8000419c:	41050513          	addi	a0,a0,1040 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    800041a0:	00002097          	auipc	ra,0x2
    800041a4:	ba4080e7          	jalr	-1116(ra) # 80005d44 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800041a8:	0014849b          	addiw	s1,s1,1
    800041ac:	0ff4f493          	andi	s1,s1,255
    800041b0:	00c00793          	li	a5,12
    800041b4:	fc97f0e3          	bgeu	a5,s1,80004174 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800041b8:	00006517          	auipc	a0,0x6
    800041bc:	20850513          	addi	a0,a0,520 # 8000a3c0 <_ZZ9kPrintIntmE6digits+0x350>
    800041c0:	00002097          	auipc	ra,0x2
    800041c4:	b84080e7          	jalr	-1148(ra) # 80005d44 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800041c8:	00500313          	li	t1,5
    thread_dispatch();
    800041cc:	ffffd097          	auipc	ra,0xffffd
    800041d0:	268080e7          	jalr	616(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800041d4:	01000513          	li	a0,16
    800041d8:	00000097          	auipc	ra,0x0
    800041dc:	be8080e7          	jalr	-1048(ra) # 80003dc0 <_ZL9fibonaccim>
    800041e0:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800041e4:	00006517          	auipc	a0,0x6
    800041e8:	1ec50513          	addi	a0,a0,492 # 8000a3d0 <_ZZ9kPrintIntmE6digits+0x360>
    800041ec:	00002097          	auipc	ra,0x2
    800041f0:	b58080e7          	jalr	-1192(ra) # 80005d44 <_Z11printStringPKc>
    800041f4:	00000613          	li	a2,0
    800041f8:	00a00593          	li	a1,10
    800041fc:	0009051b          	sext.w	a0,s2
    80004200:	00002097          	auipc	ra,0x2
    80004204:	cf4080e7          	jalr	-780(ra) # 80005ef4 <_Z8printIntiii>
    80004208:	00006517          	auipc	a0,0x6
    8000420c:	3a050513          	addi	a0,a0,928 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80004210:	00002097          	auipc	ra,0x2
    80004214:	b34080e7          	jalr	-1228(ra) # 80005d44 <_Z11printStringPKc>
    80004218:	0400006f          	j	80004258 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000421c:	00006517          	auipc	a0,0x6
    80004220:	19c50513          	addi	a0,a0,412 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    80004224:	00002097          	auipc	ra,0x2
    80004228:	b20080e7          	jalr	-1248(ra) # 80005d44 <_Z11printStringPKc>
    8000422c:	00000613          	li	a2,0
    80004230:	00a00593          	li	a1,10
    80004234:	00048513          	mv	a0,s1
    80004238:	00002097          	auipc	ra,0x2
    8000423c:	cbc080e7          	jalr	-836(ra) # 80005ef4 <_Z8printIntiii>
    80004240:	00006517          	auipc	a0,0x6
    80004244:	36850513          	addi	a0,a0,872 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80004248:	00002097          	auipc	ra,0x2
    8000424c:	afc080e7          	jalr	-1284(ra) # 80005d44 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004250:	0014849b          	addiw	s1,s1,1
    80004254:	0ff4f493          	andi	s1,s1,255
    80004258:	00f00793          	li	a5,15
    8000425c:	fc97f0e3          	bgeu	a5,s1,8000421c <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004260:	00006517          	auipc	a0,0x6
    80004264:	18050513          	addi	a0,a0,384 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80004268:	00002097          	auipc	ra,0x2
    8000426c:	adc080e7          	jalr	-1316(ra) # 80005d44 <_Z11printStringPKc>
    finishedD = true;
    80004270:	00100793          	li	a5,1
    80004274:	00009717          	auipc	a4,0x9
    80004278:	c4f707a3          	sb	a5,-945(a4) # 8000cec3 <_ZL9finishedD>
    thread_dispatch();
    8000427c:	ffffd097          	auipc	ra,0xffffd
    80004280:	1b8080e7          	jalr	440(ra) # 80001434 <_Z15thread_dispatchv>
}
    80004284:	01813083          	ld	ra,24(sp)
    80004288:	01013403          	ld	s0,16(sp)
    8000428c:	00813483          	ld	s1,8(sp)
    80004290:	00013903          	ld	s2,0(sp)
    80004294:	02010113          	addi	sp,sp,32
    80004298:	00008067          	ret

000000008000429c <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    8000429c:	fc010113          	addi	sp,sp,-64
    800042a0:	02113c23          	sd	ra,56(sp)
    800042a4:	02813823          	sd	s0,48(sp)
    800042a8:	02913423          	sd	s1,40(sp)
    800042ac:	03213023          	sd	s2,32(sp)
    800042b0:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800042b4:	02000513          	li	a0,32
    800042b8:	ffffe097          	auipc	ra,0xffffe
    800042bc:	5e8080e7          	jalr	1512(ra) # 800028a0 <_Znwm>
    800042c0:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800042c4:	fffff097          	auipc	ra,0xfffff
    800042c8:	8b4080e7          	jalr	-1868(ra) # 80002b78 <_ZN6ThreadC1Ev>
    800042cc:	00009797          	auipc	a5,0x9
    800042d0:	86478793          	addi	a5,a5,-1948 # 8000cb30 <_ZTV7WorkerA+0x10>
    800042d4:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    800042d8:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    800042dc:	00006517          	auipc	a0,0x6
    800042e0:	11450513          	addi	a0,a0,276 # 8000a3f0 <_ZZ9kPrintIntmE6digits+0x380>
    800042e4:	00002097          	auipc	ra,0x2
    800042e8:	a60080e7          	jalr	-1440(ra) # 80005d44 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    800042ec:	02000513          	li	a0,32
    800042f0:	ffffe097          	auipc	ra,0xffffe
    800042f4:	5b0080e7          	jalr	1456(ra) # 800028a0 <_Znwm>
    800042f8:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    800042fc:	fffff097          	auipc	ra,0xfffff
    80004300:	87c080e7          	jalr	-1924(ra) # 80002b78 <_ZN6ThreadC1Ev>
    80004304:	00009797          	auipc	a5,0x9
    80004308:	85478793          	addi	a5,a5,-1964 # 8000cb58 <_ZTV7WorkerB+0x10>
    8000430c:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004310:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004314:	00006517          	auipc	a0,0x6
    80004318:	0f450513          	addi	a0,a0,244 # 8000a408 <_ZZ9kPrintIntmE6digits+0x398>
    8000431c:	00002097          	auipc	ra,0x2
    80004320:	a28080e7          	jalr	-1496(ra) # 80005d44 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004324:	02000513          	li	a0,32
    80004328:	ffffe097          	auipc	ra,0xffffe
    8000432c:	578080e7          	jalr	1400(ra) # 800028a0 <_Znwm>
    80004330:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004334:	fffff097          	auipc	ra,0xfffff
    80004338:	844080e7          	jalr	-1980(ra) # 80002b78 <_ZN6ThreadC1Ev>
    8000433c:	00009797          	auipc	a5,0x9
    80004340:	84478793          	addi	a5,a5,-1980 # 8000cb80 <_ZTV7WorkerC+0x10>
    80004344:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004348:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    8000434c:	00006517          	auipc	a0,0x6
    80004350:	0d450513          	addi	a0,a0,212 # 8000a420 <_ZZ9kPrintIntmE6digits+0x3b0>
    80004354:	00002097          	auipc	ra,0x2
    80004358:	9f0080e7          	jalr	-1552(ra) # 80005d44 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    8000435c:	02000513          	li	a0,32
    80004360:	ffffe097          	auipc	ra,0xffffe
    80004364:	540080e7          	jalr	1344(ra) # 800028a0 <_Znwm>
    80004368:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    8000436c:	fffff097          	auipc	ra,0xfffff
    80004370:	80c080e7          	jalr	-2036(ra) # 80002b78 <_ZN6ThreadC1Ev>
    80004374:	00009797          	auipc	a5,0x9
    80004378:	83478793          	addi	a5,a5,-1996 # 8000cba8 <_ZTV7WorkerD+0x10>
    8000437c:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004380:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004384:	00006517          	auipc	a0,0x6
    80004388:	0b450513          	addi	a0,a0,180 # 8000a438 <_ZZ9kPrintIntmE6digits+0x3c8>
    8000438c:	00002097          	auipc	ra,0x2
    80004390:	9b8080e7          	jalr	-1608(ra) # 80005d44 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004394:	00000493          	li	s1,0
    80004398:	00300793          	li	a5,3
    8000439c:	0297c663          	blt	a5,s1,800043c8 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800043a0:	00349793          	slli	a5,s1,0x3
    800043a4:	fe040713          	addi	a4,s0,-32
    800043a8:	00f707b3          	add	a5,a4,a5
    800043ac:	fe07b503          	ld	a0,-32(a5)
    800043b0:	ffffe097          	auipc	ra,0xffffe
    800043b4:	6a8080e7          	jalr	1704(ra) # 80002a58 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800043b8:	0014849b          	addiw	s1,s1,1
    800043bc:	fddff06f          	j	80004398 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800043c0:	ffffe097          	auipc	ra,0xffffe
    800043c4:	6fc080e7          	jalr	1788(ra) # 80002abc <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800043c8:	00009797          	auipc	a5,0x9
    800043cc:	af87c783          	lbu	a5,-1288(a5) # 8000cec0 <_ZL9finishedA>
    800043d0:	fe0788e3          	beqz	a5,800043c0 <_Z20Threads_CPP_API_testv+0x124>
    800043d4:	00009797          	auipc	a5,0x9
    800043d8:	aed7c783          	lbu	a5,-1299(a5) # 8000cec1 <_ZL9finishedB>
    800043dc:	fe0782e3          	beqz	a5,800043c0 <_Z20Threads_CPP_API_testv+0x124>
    800043e0:	00009797          	auipc	a5,0x9
    800043e4:	ae27c783          	lbu	a5,-1310(a5) # 8000cec2 <_ZL9finishedC>
    800043e8:	fc078ce3          	beqz	a5,800043c0 <_Z20Threads_CPP_API_testv+0x124>
    800043ec:	00009797          	auipc	a5,0x9
    800043f0:	ad77c783          	lbu	a5,-1321(a5) # 8000cec3 <_ZL9finishedD>
    800043f4:	fc0786e3          	beqz	a5,800043c0 <_Z20Threads_CPP_API_testv+0x124>
    800043f8:	fc040493          	addi	s1,s0,-64
    800043fc:	0080006f          	j	80004404 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    80004400:	00848493          	addi	s1,s1,8
    80004404:	fe040793          	addi	a5,s0,-32
    80004408:	08f48663          	beq	s1,a5,80004494 <_Z20Threads_CPP_API_testv+0x1f8>
    8000440c:	0004b503          	ld	a0,0(s1)
		delete thread;
    80004410:	fe0508e3          	beqz	a0,80004400 <_Z20Threads_CPP_API_testv+0x164>
    80004414:	00053783          	ld	a5,0(a0)
    80004418:	0087b783          	ld	a5,8(a5)
    8000441c:	000780e7          	jalr	a5
    80004420:	fe1ff06f          	j	80004400 <_Z20Threads_CPP_API_testv+0x164>
    80004424:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004428:	00048513          	mv	a0,s1
    8000442c:	ffffe097          	auipc	ra,0xffffe
    80004430:	4c4080e7          	jalr	1220(ra) # 800028f0 <_ZdlPv>
    80004434:	00090513          	mv	a0,s2
    80004438:	0000a097          	auipc	ra,0xa
    8000443c:	bb0080e7          	jalr	-1104(ra) # 8000dfe8 <_Unwind_Resume>
    80004440:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004444:	00048513          	mv	a0,s1
    80004448:	ffffe097          	auipc	ra,0xffffe
    8000444c:	4a8080e7          	jalr	1192(ra) # 800028f0 <_ZdlPv>
    80004450:	00090513          	mv	a0,s2
    80004454:	0000a097          	auipc	ra,0xa
    80004458:	b94080e7          	jalr	-1132(ra) # 8000dfe8 <_Unwind_Resume>
    8000445c:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004460:	00048513          	mv	a0,s1
    80004464:	ffffe097          	auipc	ra,0xffffe
    80004468:	48c080e7          	jalr	1164(ra) # 800028f0 <_ZdlPv>
    8000446c:	00090513          	mv	a0,s2
    80004470:	0000a097          	auipc	ra,0xa
    80004474:	b78080e7          	jalr	-1160(ra) # 8000dfe8 <_Unwind_Resume>
    80004478:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    8000447c:	00048513          	mv	a0,s1
    80004480:	ffffe097          	auipc	ra,0xffffe
    80004484:	470080e7          	jalr	1136(ra) # 800028f0 <_ZdlPv>
    80004488:	00090513          	mv	a0,s2
    8000448c:	0000a097          	auipc	ra,0xa
    80004490:	b5c080e7          	jalr	-1188(ra) # 8000dfe8 <_Unwind_Resume>
	}
}
    80004494:	03813083          	ld	ra,56(sp)
    80004498:	03013403          	ld	s0,48(sp)
    8000449c:	02813483          	ld	s1,40(sp)
    800044a0:	02013903          	ld	s2,32(sp)
    800044a4:	04010113          	addi	sp,sp,64
    800044a8:	00008067          	ret

00000000800044ac <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800044ac:	ff010113          	addi	sp,sp,-16
    800044b0:	00113423          	sd	ra,8(sp)
    800044b4:	00813023          	sd	s0,0(sp)
    800044b8:	01010413          	addi	s0,sp,16
    800044bc:	00008797          	auipc	a5,0x8
    800044c0:	67478793          	addi	a5,a5,1652 # 8000cb30 <_ZTV7WorkerA+0x10>
    800044c4:	00f53023          	sd	a5,0(a0)
    800044c8:	ffffe097          	auipc	ra,0xffffe
    800044cc:	2e8080e7          	jalr	744(ra) # 800027b0 <_ZN6ThreadD1Ev>
    800044d0:	00813083          	ld	ra,8(sp)
    800044d4:	00013403          	ld	s0,0(sp)
    800044d8:	01010113          	addi	sp,sp,16
    800044dc:	00008067          	ret

00000000800044e0 <_ZN7WorkerAD0Ev>:
    800044e0:	fe010113          	addi	sp,sp,-32
    800044e4:	00113c23          	sd	ra,24(sp)
    800044e8:	00813823          	sd	s0,16(sp)
    800044ec:	00913423          	sd	s1,8(sp)
    800044f0:	02010413          	addi	s0,sp,32
    800044f4:	00050493          	mv	s1,a0
    800044f8:	00008797          	auipc	a5,0x8
    800044fc:	63878793          	addi	a5,a5,1592 # 8000cb30 <_ZTV7WorkerA+0x10>
    80004500:	00f53023          	sd	a5,0(a0)
    80004504:	ffffe097          	auipc	ra,0xffffe
    80004508:	2ac080e7          	jalr	684(ra) # 800027b0 <_ZN6ThreadD1Ev>
    8000450c:	00048513          	mv	a0,s1
    80004510:	ffffe097          	auipc	ra,0xffffe
    80004514:	3e0080e7          	jalr	992(ra) # 800028f0 <_ZdlPv>
    80004518:	01813083          	ld	ra,24(sp)
    8000451c:	01013403          	ld	s0,16(sp)
    80004520:	00813483          	ld	s1,8(sp)
    80004524:	02010113          	addi	sp,sp,32
    80004528:	00008067          	ret

000000008000452c <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    8000452c:	ff010113          	addi	sp,sp,-16
    80004530:	00113423          	sd	ra,8(sp)
    80004534:	00813023          	sd	s0,0(sp)
    80004538:	01010413          	addi	s0,sp,16
    8000453c:	00008797          	auipc	a5,0x8
    80004540:	61c78793          	addi	a5,a5,1564 # 8000cb58 <_ZTV7WorkerB+0x10>
    80004544:	00f53023          	sd	a5,0(a0)
    80004548:	ffffe097          	auipc	ra,0xffffe
    8000454c:	268080e7          	jalr	616(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80004550:	00813083          	ld	ra,8(sp)
    80004554:	00013403          	ld	s0,0(sp)
    80004558:	01010113          	addi	sp,sp,16
    8000455c:	00008067          	ret

0000000080004560 <_ZN7WorkerBD0Ev>:
    80004560:	fe010113          	addi	sp,sp,-32
    80004564:	00113c23          	sd	ra,24(sp)
    80004568:	00813823          	sd	s0,16(sp)
    8000456c:	00913423          	sd	s1,8(sp)
    80004570:	02010413          	addi	s0,sp,32
    80004574:	00050493          	mv	s1,a0
    80004578:	00008797          	auipc	a5,0x8
    8000457c:	5e078793          	addi	a5,a5,1504 # 8000cb58 <_ZTV7WorkerB+0x10>
    80004580:	00f53023          	sd	a5,0(a0)
    80004584:	ffffe097          	auipc	ra,0xffffe
    80004588:	22c080e7          	jalr	556(ra) # 800027b0 <_ZN6ThreadD1Ev>
    8000458c:	00048513          	mv	a0,s1
    80004590:	ffffe097          	auipc	ra,0xffffe
    80004594:	360080e7          	jalr	864(ra) # 800028f0 <_ZdlPv>
    80004598:	01813083          	ld	ra,24(sp)
    8000459c:	01013403          	ld	s0,16(sp)
    800045a0:	00813483          	ld	s1,8(sp)
    800045a4:	02010113          	addi	sp,sp,32
    800045a8:	00008067          	ret

00000000800045ac <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800045ac:	ff010113          	addi	sp,sp,-16
    800045b0:	00113423          	sd	ra,8(sp)
    800045b4:	00813023          	sd	s0,0(sp)
    800045b8:	01010413          	addi	s0,sp,16
    800045bc:	00008797          	auipc	a5,0x8
    800045c0:	5c478793          	addi	a5,a5,1476 # 8000cb80 <_ZTV7WorkerC+0x10>
    800045c4:	00f53023          	sd	a5,0(a0)
    800045c8:	ffffe097          	auipc	ra,0xffffe
    800045cc:	1e8080e7          	jalr	488(ra) # 800027b0 <_ZN6ThreadD1Ev>
    800045d0:	00813083          	ld	ra,8(sp)
    800045d4:	00013403          	ld	s0,0(sp)
    800045d8:	01010113          	addi	sp,sp,16
    800045dc:	00008067          	ret

00000000800045e0 <_ZN7WorkerCD0Ev>:
    800045e0:	fe010113          	addi	sp,sp,-32
    800045e4:	00113c23          	sd	ra,24(sp)
    800045e8:	00813823          	sd	s0,16(sp)
    800045ec:	00913423          	sd	s1,8(sp)
    800045f0:	02010413          	addi	s0,sp,32
    800045f4:	00050493          	mv	s1,a0
    800045f8:	00008797          	auipc	a5,0x8
    800045fc:	58878793          	addi	a5,a5,1416 # 8000cb80 <_ZTV7WorkerC+0x10>
    80004600:	00f53023          	sd	a5,0(a0)
    80004604:	ffffe097          	auipc	ra,0xffffe
    80004608:	1ac080e7          	jalr	428(ra) # 800027b0 <_ZN6ThreadD1Ev>
    8000460c:	00048513          	mv	a0,s1
    80004610:	ffffe097          	auipc	ra,0xffffe
    80004614:	2e0080e7          	jalr	736(ra) # 800028f0 <_ZdlPv>
    80004618:	01813083          	ld	ra,24(sp)
    8000461c:	01013403          	ld	s0,16(sp)
    80004620:	00813483          	ld	s1,8(sp)
    80004624:	02010113          	addi	sp,sp,32
    80004628:	00008067          	ret

000000008000462c <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    8000462c:	ff010113          	addi	sp,sp,-16
    80004630:	00113423          	sd	ra,8(sp)
    80004634:	00813023          	sd	s0,0(sp)
    80004638:	01010413          	addi	s0,sp,16
    8000463c:	00008797          	auipc	a5,0x8
    80004640:	56c78793          	addi	a5,a5,1388 # 8000cba8 <_ZTV7WorkerD+0x10>
    80004644:	00f53023          	sd	a5,0(a0)
    80004648:	ffffe097          	auipc	ra,0xffffe
    8000464c:	168080e7          	jalr	360(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80004650:	00813083          	ld	ra,8(sp)
    80004654:	00013403          	ld	s0,0(sp)
    80004658:	01010113          	addi	sp,sp,16
    8000465c:	00008067          	ret

0000000080004660 <_ZN7WorkerDD0Ev>:
    80004660:	fe010113          	addi	sp,sp,-32
    80004664:	00113c23          	sd	ra,24(sp)
    80004668:	00813823          	sd	s0,16(sp)
    8000466c:	00913423          	sd	s1,8(sp)
    80004670:	02010413          	addi	s0,sp,32
    80004674:	00050493          	mv	s1,a0
    80004678:	00008797          	auipc	a5,0x8
    8000467c:	53078793          	addi	a5,a5,1328 # 8000cba8 <_ZTV7WorkerD+0x10>
    80004680:	00f53023          	sd	a5,0(a0)
    80004684:	ffffe097          	auipc	ra,0xffffe
    80004688:	12c080e7          	jalr	300(ra) # 800027b0 <_ZN6ThreadD1Ev>
    8000468c:	00048513          	mv	a0,s1
    80004690:	ffffe097          	auipc	ra,0xffffe
    80004694:	260080e7          	jalr	608(ra) # 800028f0 <_ZdlPv>
    80004698:	01813083          	ld	ra,24(sp)
    8000469c:	01013403          	ld	s0,16(sp)
    800046a0:	00813483          	ld	s1,8(sp)
    800046a4:	02010113          	addi	sp,sp,32
    800046a8:	00008067          	ret

00000000800046ac <_ZN7WorkerA3runEv>:
    void run() override {
    800046ac:	ff010113          	addi	sp,sp,-16
    800046b0:	00113423          	sd	ra,8(sp)
    800046b4:	00813023          	sd	s0,0(sp)
    800046b8:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    800046bc:	00000593          	li	a1,0
    800046c0:	fffff097          	auipc	ra,0xfffff
    800046c4:	774080e7          	jalr	1908(ra) # 80003e34 <_ZN7WorkerA11workerBodyAEPv>
    }
    800046c8:	00813083          	ld	ra,8(sp)
    800046cc:	00013403          	ld	s0,0(sp)
    800046d0:	01010113          	addi	sp,sp,16
    800046d4:	00008067          	ret

00000000800046d8 <_ZN7WorkerB3runEv>:
    void run() override {
    800046d8:	ff010113          	addi	sp,sp,-16
    800046dc:	00113423          	sd	ra,8(sp)
    800046e0:	00813023          	sd	s0,0(sp)
    800046e4:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    800046e8:	00000593          	li	a1,0
    800046ec:	00000097          	auipc	ra,0x0
    800046f0:	814080e7          	jalr	-2028(ra) # 80003f00 <_ZN7WorkerB11workerBodyBEPv>
    }
    800046f4:	00813083          	ld	ra,8(sp)
    800046f8:	00013403          	ld	s0,0(sp)
    800046fc:	01010113          	addi	sp,sp,16
    80004700:	00008067          	ret

0000000080004704 <_ZN7WorkerC3runEv>:
    void run() override {
    80004704:	ff010113          	addi	sp,sp,-16
    80004708:	00113423          	sd	ra,8(sp)
    8000470c:	00813023          	sd	s0,0(sp)
    80004710:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004714:	00000593          	li	a1,0
    80004718:	00000097          	auipc	ra,0x0
    8000471c:	8bc080e7          	jalr	-1860(ra) # 80003fd4 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004720:	00813083          	ld	ra,8(sp)
    80004724:	00013403          	ld	s0,0(sp)
    80004728:	01010113          	addi	sp,sp,16
    8000472c:	00008067          	ret

0000000080004730 <_ZN7WorkerD3runEv>:
    void run() override {
    80004730:	ff010113          	addi	sp,sp,-16
    80004734:	00113423          	sd	ra,8(sp)
    80004738:	00813023          	sd	s0,0(sp)
    8000473c:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004740:	00000593          	li	a1,0
    80004744:	00000097          	auipc	ra,0x0
    80004748:	a10080e7          	jalr	-1520(ra) # 80004154 <_ZN7WorkerD11workerBodyDEPv>
    }
    8000474c:	00813083          	ld	ra,8(sp)
    80004750:	00013403          	ld	s0,0(sp)
    80004754:	01010113          	addi	sp,sp,16
    80004758:	00008067          	ret

000000008000475c <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    8000475c:	f8010113          	addi	sp,sp,-128
    80004760:	06113c23          	sd	ra,120(sp)
    80004764:	06813823          	sd	s0,112(sp)
    80004768:	06913423          	sd	s1,104(sp)
    8000476c:	07213023          	sd	s2,96(sp)
    80004770:	05313c23          	sd	s3,88(sp)
    80004774:	05413823          	sd	s4,80(sp)
    80004778:	05513423          	sd	s5,72(sp)
    8000477c:	05613023          	sd	s6,64(sp)
    80004780:	03713c23          	sd	s7,56(sp)
    80004784:	03813823          	sd	s8,48(sp)
    80004788:	03913423          	sd	s9,40(sp)
    8000478c:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004790:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004794:	00006517          	auipc	a0,0x6
    80004798:	acc50513          	addi	a0,a0,-1332 # 8000a260 <_ZZ9kPrintIntmE6digits+0x1f0>
    8000479c:	00001097          	auipc	ra,0x1
    800047a0:	5a8080e7          	jalr	1448(ra) # 80005d44 <_Z11printStringPKc>
    getString(input, 30);
    800047a4:	01e00593          	li	a1,30
    800047a8:	f8040493          	addi	s1,s0,-128
    800047ac:	00048513          	mv	a0,s1
    800047b0:	00001097          	auipc	ra,0x1
    800047b4:	61c080e7          	jalr	1564(ra) # 80005dcc <_Z9getStringPci>
    threadNum = stringToInt(input);
    800047b8:	00048513          	mv	a0,s1
    800047bc:	00001097          	auipc	ra,0x1
    800047c0:	6e8080e7          	jalr	1768(ra) # 80005ea4 <_Z11stringToIntPKc>
    800047c4:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    800047c8:	00006517          	auipc	a0,0x6
    800047cc:	ab850513          	addi	a0,a0,-1352 # 8000a280 <_ZZ9kPrintIntmE6digits+0x210>
    800047d0:	00001097          	auipc	ra,0x1
    800047d4:	574080e7          	jalr	1396(ra) # 80005d44 <_Z11printStringPKc>
    getString(input, 30);
    800047d8:	01e00593          	li	a1,30
    800047dc:	00048513          	mv	a0,s1
    800047e0:	00001097          	auipc	ra,0x1
    800047e4:	5ec080e7          	jalr	1516(ra) # 80005dcc <_Z9getStringPci>
    n = stringToInt(input);
    800047e8:	00048513          	mv	a0,s1
    800047ec:	00001097          	auipc	ra,0x1
    800047f0:	6b8080e7          	jalr	1720(ra) # 80005ea4 <_Z11stringToIntPKc>
    800047f4:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    800047f8:	00006517          	auipc	a0,0x6
    800047fc:	aa850513          	addi	a0,a0,-1368 # 8000a2a0 <_ZZ9kPrintIntmE6digits+0x230>
    80004800:	00001097          	auipc	ra,0x1
    80004804:	544080e7          	jalr	1348(ra) # 80005d44 <_Z11printStringPKc>
    printInt(threadNum);
    80004808:	00000613          	li	a2,0
    8000480c:	00a00593          	li	a1,10
    80004810:	00098513          	mv	a0,s3
    80004814:	00001097          	auipc	ra,0x1
    80004818:	6e0080e7          	jalr	1760(ra) # 80005ef4 <_Z8printIntiii>
    printString(" i velicina bafera ");
    8000481c:	00006517          	auipc	a0,0x6
    80004820:	a9c50513          	addi	a0,a0,-1380 # 8000a2b8 <_ZZ9kPrintIntmE6digits+0x248>
    80004824:	00001097          	auipc	ra,0x1
    80004828:	520080e7          	jalr	1312(ra) # 80005d44 <_Z11printStringPKc>
    printInt(n);
    8000482c:	00000613          	li	a2,0
    80004830:	00a00593          	li	a1,10
    80004834:	00048513          	mv	a0,s1
    80004838:	00001097          	auipc	ra,0x1
    8000483c:	6bc080e7          	jalr	1724(ra) # 80005ef4 <_Z8printIntiii>
    printString(".\n");
    80004840:	00006517          	auipc	a0,0x6
    80004844:	a9050513          	addi	a0,a0,-1392 # 8000a2d0 <_ZZ9kPrintIntmE6digits+0x260>
    80004848:	00001097          	auipc	ra,0x1
    8000484c:	4fc080e7          	jalr	1276(ra) # 80005d44 <_Z11printStringPKc>
    if (threadNum > n) {
    80004850:	0334c463          	blt	s1,s3,80004878 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004854:	03305c63          	blez	s3,8000488c <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004858:	03800513          	li	a0,56
    8000485c:	ffffe097          	auipc	ra,0xffffe
    80004860:	044080e7          	jalr	68(ra) # 800028a0 <_Znwm>
    80004864:	00050a93          	mv	s5,a0
    80004868:	00048593          	mv	a1,s1
    8000486c:	00001097          	auipc	ra,0x1
    80004870:	7a8080e7          	jalr	1960(ra) # 80006014 <_ZN9BufferCPPC1Ei>
    80004874:	0300006f          	j	800048a4 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004878:	00006517          	auipc	a0,0x6
    8000487c:	a6050513          	addi	a0,a0,-1440 # 8000a2d8 <_ZZ9kPrintIntmE6digits+0x268>
    80004880:	00001097          	auipc	ra,0x1
    80004884:	4c4080e7          	jalr	1220(ra) # 80005d44 <_Z11printStringPKc>
        return;
    80004888:	0140006f          	j	8000489c <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    8000488c:	00006517          	auipc	a0,0x6
    80004890:	a8c50513          	addi	a0,a0,-1396 # 8000a318 <_ZZ9kPrintIntmE6digits+0x2a8>
    80004894:	00001097          	auipc	ra,0x1
    80004898:	4b0080e7          	jalr	1200(ra) # 80005d44 <_Z11printStringPKc>
        return;
    8000489c:	000c0113          	mv	sp,s8
    800048a0:	2140006f          	j	80004ab4 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    800048a4:	01000513          	li	a0,16
    800048a8:	ffffe097          	auipc	ra,0xffffe
    800048ac:	ff8080e7          	jalr	-8(ra) # 800028a0 <_Znwm>
    800048b0:	00050913          	mv	s2,a0
    800048b4:	00000593          	li	a1,0
    800048b8:	ffffe097          	auipc	ra,0xffffe
    800048bc:	33c080e7          	jalr	828(ra) # 80002bf4 <_ZN9SemaphoreC1Ej>
    800048c0:	00008797          	auipc	a5,0x8
    800048c4:	6127b823          	sd	s2,1552(a5) # 8000ced0 <_ZL10waitForAll>
    Thread *producers[threadNum];
    800048c8:	00399793          	slli	a5,s3,0x3
    800048cc:	00f78793          	addi	a5,a5,15
    800048d0:	ff07f793          	andi	a5,a5,-16
    800048d4:	40f10133          	sub	sp,sp,a5
    800048d8:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    800048dc:	0019871b          	addiw	a4,s3,1
    800048e0:	00171793          	slli	a5,a4,0x1
    800048e4:	00e787b3          	add	a5,a5,a4
    800048e8:	00379793          	slli	a5,a5,0x3
    800048ec:	00f78793          	addi	a5,a5,15
    800048f0:	ff07f793          	andi	a5,a5,-16
    800048f4:	40f10133          	sub	sp,sp,a5
    800048f8:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    800048fc:	00199493          	slli	s1,s3,0x1
    80004900:	013484b3          	add	s1,s1,s3
    80004904:	00349493          	slli	s1,s1,0x3
    80004908:	009b04b3          	add	s1,s6,s1
    8000490c:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004910:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004914:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004918:	02800513          	li	a0,40
    8000491c:	ffffe097          	auipc	ra,0xffffe
    80004920:	f84080e7          	jalr	-124(ra) # 800028a0 <_Znwm>
    80004924:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004928:	ffffe097          	auipc	ra,0xffffe
    8000492c:	250080e7          	jalr	592(ra) # 80002b78 <_ZN6ThreadC1Ev>
    80004930:	00008797          	auipc	a5,0x8
    80004934:	2f078793          	addi	a5,a5,752 # 8000cc20 <_ZTV8Consumer+0x10>
    80004938:	00fbb023          	sd	a5,0(s7)
    8000493c:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004940:	000b8513          	mv	a0,s7
    80004944:	ffffe097          	auipc	ra,0xffffe
    80004948:	114080e7          	jalr	276(ra) # 80002a58 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    8000494c:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004950:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004954:	00008797          	auipc	a5,0x8
    80004958:	57c7b783          	ld	a5,1404(a5) # 8000ced0 <_ZL10waitForAll>
    8000495c:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004960:	02800513          	li	a0,40
    80004964:	ffffe097          	auipc	ra,0xffffe
    80004968:	f3c080e7          	jalr	-196(ra) # 800028a0 <_Znwm>
    8000496c:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004970:	ffffe097          	auipc	ra,0xffffe
    80004974:	208080e7          	jalr	520(ra) # 80002b78 <_ZN6ThreadC1Ev>
    80004978:	00008797          	auipc	a5,0x8
    8000497c:	25878793          	addi	a5,a5,600 # 8000cbd0 <_ZTV16ProducerKeyborad+0x10>
    80004980:	00f4b023          	sd	a5,0(s1)
    80004984:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004988:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    8000498c:	00048513          	mv	a0,s1
    80004990:	ffffe097          	auipc	ra,0xffffe
    80004994:	0c8080e7          	jalr	200(ra) # 80002a58 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004998:	00100913          	li	s2,1
    8000499c:	0300006f          	j	800049cc <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800049a0:	00008797          	auipc	a5,0x8
    800049a4:	25878793          	addi	a5,a5,600 # 8000cbf8 <_ZTV8Producer+0x10>
    800049a8:	00fcb023          	sd	a5,0(s9)
    800049ac:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    800049b0:	00391793          	slli	a5,s2,0x3
    800049b4:	00fa07b3          	add	a5,s4,a5
    800049b8:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    800049bc:	000c8513          	mv	a0,s9
    800049c0:	ffffe097          	auipc	ra,0xffffe
    800049c4:	098080e7          	jalr	152(ra) # 80002a58 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800049c8:	0019091b          	addiw	s2,s2,1
    800049cc:	05395263          	bge	s2,s3,80004a10 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    800049d0:	00191493          	slli	s1,s2,0x1
    800049d4:	012484b3          	add	s1,s1,s2
    800049d8:	00349493          	slli	s1,s1,0x3
    800049dc:	009b04b3          	add	s1,s6,s1
    800049e0:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    800049e4:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    800049e8:	00008797          	auipc	a5,0x8
    800049ec:	4e87b783          	ld	a5,1256(a5) # 8000ced0 <_ZL10waitForAll>
    800049f0:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    800049f4:	02800513          	li	a0,40
    800049f8:	ffffe097          	auipc	ra,0xffffe
    800049fc:	ea8080e7          	jalr	-344(ra) # 800028a0 <_Znwm>
    80004a00:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004a04:	ffffe097          	auipc	ra,0xffffe
    80004a08:	174080e7          	jalr	372(ra) # 80002b78 <_ZN6ThreadC1Ev>
    80004a0c:	f95ff06f          	j	800049a0 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004a10:	ffffe097          	auipc	ra,0xffffe
    80004a14:	0ac080e7          	jalr	172(ra) # 80002abc <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004a18:	00000493          	li	s1,0
    80004a1c:	0099ce63          	blt	s3,s1,80004a38 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004a20:	00008517          	auipc	a0,0x8
    80004a24:	4b053503          	ld	a0,1200(a0) # 8000ced0 <_ZL10waitForAll>
    80004a28:	ffffe097          	auipc	ra,0xffffe
    80004a2c:	204080e7          	jalr	516(ra) # 80002c2c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004a30:	0014849b          	addiw	s1,s1,1
    80004a34:	fe9ff06f          	j	80004a1c <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004a38:	00008517          	auipc	a0,0x8
    80004a3c:	49853503          	ld	a0,1176(a0) # 8000ced0 <_ZL10waitForAll>
    80004a40:	00050863          	beqz	a0,80004a50 <_Z20testConsumerProducerv+0x2f4>
    80004a44:	00053783          	ld	a5,0(a0)
    80004a48:	0087b783          	ld	a5,8(a5)
    80004a4c:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004a50:	00000493          	li	s1,0
    80004a54:	0080006f          	j	80004a5c <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004a58:	0014849b          	addiw	s1,s1,1
    80004a5c:	0334d263          	bge	s1,s3,80004a80 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004a60:	00349793          	slli	a5,s1,0x3
    80004a64:	00fa07b3          	add	a5,s4,a5
    80004a68:	0007b503          	ld	a0,0(a5)
    80004a6c:	fe0506e3          	beqz	a0,80004a58 <_Z20testConsumerProducerv+0x2fc>
    80004a70:	00053783          	ld	a5,0(a0)
    80004a74:	0087b783          	ld	a5,8(a5)
    80004a78:	000780e7          	jalr	a5
    80004a7c:	fddff06f          	j	80004a58 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004a80:	000b8a63          	beqz	s7,80004a94 <_Z20testConsumerProducerv+0x338>
    80004a84:	000bb783          	ld	a5,0(s7)
    80004a88:	0087b783          	ld	a5,8(a5)
    80004a8c:	000b8513          	mv	a0,s7
    80004a90:	000780e7          	jalr	a5
    delete buffer;
    80004a94:	000a8e63          	beqz	s5,80004ab0 <_Z20testConsumerProducerv+0x354>
    80004a98:	000a8513          	mv	a0,s5
    80004a9c:	00002097          	auipc	ra,0x2
    80004aa0:	870080e7          	jalr	-1936(ra) # 8000630c <_ZN9BufferCPPD1Ev>
    80004aa4:	000a8513          	mv	a0,s5
    80004aa8:	ffffe097          	auipc	ra,0xffffe
    80004aac:	e48080e7          	jalr	-440(ra) # 800028f0 <_ZdlPv>
    80004ab0:	000c0113          	mv	sp,s8
}
    80004ab4:	f8040113          	addi	sp,s0,-128
    80004ab8:	07813083          	ld	ra,120(sp)
    80004abc:	07013403          	ld	s0,112(sp)
    80004ac0:	06813483          	ld	s1,104(sp)
    80004ac4:	06013903          	ld	s2,96(sp)
    80004ac8:	05813983          	ld	s3,88(sp)
    80004acc:	05013a03          	ld	s4,80(sp)
    80004ad0:	04813a83          	ld	s5,72(sp)
    80004ad4:	04013b03          	ld	s6,64(sp)
    80004ad8:	03813b83          	ld	s7,56(sp)
    80004adc:	03013c03          	ld	s8,48(sp)
    80004ae0:	02813c83          	ld	s9,40(sp)
    80004ae4:	08010113          	addi	sp,sp,128
    80004ae8:	00008067          	ret
    80004aec:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004af0:	000a8513          	mv	a0,s5
    80004af4:	ffffe097          	auipc	ra,0xffffe
    80004af8:	dfc080e7          	jalr	-516(ra) # 800028f0 <_ZdlPv>
    80004afc:	00048513          	mv	a0,s1
    80004b00:	00009097          	auipc	ra,0x9
    80004b04:	4e8080e7          	jalr	1256(ra) # 8000dfe8 <_Unwind_Resume>
    80004b08:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004b0c:	00090513          	mv	a0,s2
    80004b10:	ffffe097          	auipc	ra,0xffffe
    80004b14:	de0080e7          	jalr	-544(ra) # 800028f0 <_ZdlPv>
    80004b18:	00048513          	mv	a0,s1
    80004b1c:	00009097          	auipc	ra,0x9
    80004b20:	4cc080e7          	jalr	1228(ra) # 8000dfe8 <_Unwind_Resume>
    80004b24:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004b28:	000b8513          	mv	a0,s7
    80004b2c:	ffffe097          	auipc	ra,0xffffe
    80004b30:	dc4080e7          	jalr	-572(ra) # 800028f0 <_ZdlPv>
    80004b34:	00048513          	mv	a0,s1
    80004b38:	00009097          	auipc	ra,0x9
    80004b3c:	4b0080e7          	jalr	1200(ra) # 8000dfe8 <_Unwind_Resume>
    80004b40:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004b44:	00048513          	mv	a0,s1
    80004b48:	ffffe097          	auipc	ra,0xffffe
    80004b4c:	da8080e7          	jalr	-600(ra) # 800028f0 <_ZdlPv>
    80004b50:	00090513          	mv	a0,s2
    80004b54:	00009097          	auipc	ra,0x9
    80004b58:	494080e7          	jalr	1172(ra) # 8000dfe8 <_Unwind_Resume>
    80004b5c:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004b60:	000c8513          	mv	a0,s9
    80004b64:	ffffe097          	auipc	ra,0xffffe
    80004b68:	d8c080e7          	jalr	-628(ra) # 800028f0 <_ZdlPv>
    80004b6c:	00048513          	mv	a0,s1
    80004b70:	00009097          	auipc	ra,0x9
    80004b74:	478080e7          	jalr	1144(ra) # 8000dfe8 <_Unwind_Resume>

0000000080004b78 <_ZN8Consumer3runEv>:
    void run() override {
    80004b78:	fd010113          	addi	sp,sp,-48
    80004b7c:	02113423          	sd	ra,40(sp)
    80004b80:	02813023          	sd	s0,32(sp)
    80004b84:	00913c23          	sd	s1,24(sp)
    80004b88:	01213823          	sd	s2,16(sp)
    80004b8c:	01313423          	sd	s3,8(sp)
    80004b90:	03010413          	addi	s0,sp,48
    80004b94:	00050913          	mv	s2,a0
        int i = 0;
    80004b98:	00000993          	li	s3,0
    80004b9c:	0100006f          	j	80004bac <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004ba0:	00a00513          	li	a0,10
    80004ba4:	ffffe097          	auipc	ra,0xffffe
    80004ba8:	178080e7          	jalr	376(ra) # 80002d1c <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004bac:	00008797          	auipc	a5,0x8
    80004bb0:	31c7a783          	lw	a5,796(a5) # 8000cec8 <_ZL9threadEnd>
    80004bb4:	04079a63          	bnez	a5,80004c08 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004bb8:	02093783          	ld	a5,32(s2)
    80004bbc:	0087b503          	ld	a0,8(a5)
    80004bc0:	00001097          	auipc	ra,0x1
    80004bc4:	638080e7          	jalr	1592(ra) # 800061f8 <_ZN9BufferCPP3getEv>
            i++;
    80004bc8:	0019849b          	addiw	s1,s3,1
    80004bcc:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004bd0:	0ff57513          	andi	a0,a0,255
    80004bd4:	ffffe097          	auipc	ra,0xffffe
    80004bd8:	148080e7          	jalr	328(ra) # 80002d1c <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004bdc:	05000793          	li	a5,80
    80004be0:	02f4e4bb          	remw	s1,s1,a5
    80004be4:	fc0494e3          	bnez	s1,80004bac <_ZN8Consumer3runEv+0x34>
    80004be8:	fb9ff06f          	j	80004ba0 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004bec:	02093783          	ld	a5,32(s2)
    80004bf0:	0087b503          	ld	a0,8(a5)
    80004bf4:	00001097          	auipc	ra,0x1
    80004bf8:	604080e7          	jalr	1540(ra) # 800061f8 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004bfc:	0ff57513          	andi	a0,a0,255
    80004c00:	ffffe097          	auipc	ra,0xffffe
    80004c04:	11c080e7          	jalr	284(ra) # 80002d1c <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004c08:	02093783          	ld	a5,32(s2)
    80004c0c:	0087b503          	ld	a0,8(a5)
    80004c10:	00001097          	auipc	ra,0x1
    80004c14:	674080e7          	jalr	1652(ra) # 80006284 <_ZN9BufferCPP6getCntEv>
    80004c18:	fca04ae3          	bgtz	a0,80004bec <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004c1c:	02093783          	ld	a5,32(s2)
    80004c20:	0107b503          	ld	a0,16(a5)
    80004c24:	ffffe097          	auipc	ra,0xffffe
    80004c28:	034080e7          	jalr	52(ra) # 80002c58 <_ZN9Semaphore6signalEv>
    }
    80004c2c:	02813083          	ld	ra,40(sp)
    80004c30:	02013403          	ld	s0,32(sp)
    80004c34:	01813483          	ld	s1,24(sp)
    80004c38:	01013903          	ld	s2,16(sp)
    80004c3c:	00813983          	ld	s3,8(sp)
    80004c40:	03010113          	addi	sp,sp,48
    80004c44:	00008067          	ret

0000000080004c48 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004c48:	ff010113          	addi	sp,sp,-16
    80004c4c:	00113423          	sd	ra,8(sp)
    80004c50:	00813023          	sd	s0,0(sp)
    80004c54:	01010413          	addi	s0,sp,16
    80004c58:	00008797          	auipc	a5,0x8
    80004c5c:	fc878793          	addi	a5,a5,-56 # 8000cc20 <_ZTV8Consumer+0x10>
    80004c60:	00f53023          	sd	a5,0(a0)
    80004c64:	ffffe097          	auipc	ra,0xffffe
    80004c68:	b4c080e7          	jalr	-1204(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80004c6c:	00813083          	ld	ra,8(sp)
    80004c70:	00013403          	ld	s0,0(sp)
    80004c74:	01010113          	addi	sp,sp,16
    80004c78:	00008067          	ret

0000000080004c7c <_ZN8ConsumerD0Ev>:
    80004c7c:	fe010113          	addi	sp,sp,-32
    80004c80:	00113c23          	sd	ra,24(sp)
    80004c84:	00813823          	sd	s0,16(sp)
    80004c88:	00913423          	sd	s1,8(sp)
    80004c8c:	02010413          	addi	s0,sp,32
    80004c90:	00050493          	mv	s1,a0
    80004c94:	00008797          	auipc	a5,0x8
    80004c98:	f8c78793          	addi	a5,a5,-116 # 8000cc20 <_ZTV8Consumer+0x10>
    80004c9c:	00f53023          	sd	a5,0(a0)
    80004ca0:	ffffe097          	auipc	ra,0xffffe
    80004ca4:	b10080e7          	jalr	-1264(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80004ca8:	00048513          	mv	a0,s1
    80004cac:	ffffe097          	auipc	ra,0xffffe
    80004cb0:	c44080e7          	jalr	-956(ra) # 800028f0 <_ZdlPv>
    80004cb4:	01813083          	ld	ra,24(sp)
    80004cb8:	01013403          	ld	s0,16(sp)
    80004cbc:	00813483          	ld	s1,8(sp)
    80004cc0:	02010113          	addi	sp,sp,32
    80004cc4:	00008067          	ret

0000000080004cc8 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004cc8:	ff010113          	addi	sp,sp,-16
    80004ccc:	00113423          	sd	ra,8(sp)
    80004cd0:	00813023          	sd	s0,0(sp)
    80004cd4:	01010413          	addi	s0,sp,16
    80004cd8:	00008797          	auipc	a5,0x8
    80004cdc:	ef878793          	addi	a5,a5,-264 # 8000cbd0 <_ZTV16ProducerKeyborad+0x10>
    80004ce0:	00f53023          	sd	a5,0(a0)
    80004ce4:	ffffe097          	auipc	ra,0xffffe
    80004ce8:	acc080e7          	jalr	-1332(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80004cec:	00813083          	ld	ra,8(sp)
    80004cf0:	00013403          	ld	s0,0(sp)
    80004cf4:	01010113          	addi	sp,sp,16
    80004cf8:	00008067          	ret

0000000080004cfc <_ZN16ProducerKeyboradD0Ev>:
    80004cfc:	fe010113          	addi	sp,sp,-32
    80004d00:	00113c23          	sd	ra,24(sp)
    80004d04:	00813823          	sd	s0,16(sp)
    80004d08:	00913423          	sd	s1,8(sp)
    80004d0c:	02010413          	addi	s0,sp,32
    80004d10:	00050493          	mv	s1,a0
    80004d14:	00008797          	auipc	a5,0x8
    80004d18:	ebc78793          	addi	a5,a5,-324 # 8000cbd0 <_ZTV16ProducerKeyborad+0x10>
    80004d1c:	00f53023          	sd	a5,0(a0)
    80004d20:	ffffe097          	auipc	ra,0xffffe
    80004d24:	a90080e7          	jalr	-1392(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80004d28:	00048513          	mv	a0,s1
    80004d2c:	ffffe097          	auipc	ra,0xffffe
    80004d30:	bc4080e7          	jalr	-1084(ra) # 800028f0 <_ZdlPv>
    80004d34:	01813083          	ld	ra,24(sp)
    80004d38:	01013403          	ld	s0,16(sp)
    80004d3c:	00813483          	ld	s1,8(sp)
    80004d40:	02010113          	addi	sp,sp,32
    80004d44:	00008067          	ret

0000000080004d48 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004d48:	ff010113          	addi	sp,sp,-16
    80004d4c:	00113423          	sd	ra,8(sp)
    80004d50:	00813023          	sd	s0,0(sp)
    80004d54:	01010413          	addi	s0,sp,16
    80004d58:	00008797          	auipc	a5,0x8
    80004d5c:	ea078793          	addi	a5,a5,-352 # 8000cbf8 <_ZTV8Producer+0x10>
    80004d60:	00f53023          	sd	a5,0(a0)
    80004d64:	ffffe097          	auipc	ra,0xffffe
    80004d68:	a4c080e7          	jalr	-1460(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80004d6c:	00813083          	ld	ra,8(sp)
    80004d70:	00013403          	ld	s0,0(sp)
    80004d74:	01010113          	addi	sp,sp,16
    80004d78:	00008067          	ret

0000000080004d7c <_ZN8ProducerD0Ev>:
    80004d7c:	fe010113          	addi	sp,sp,-32
    80004d80:	00113c23          	sd	ra,24(sp)
    80004d84:	00813823          	sd	s0,16(sp)
    80004d88:	00913423          	sd	s1,8(sp)
    80004d8c:	02010413          	addi	s0,sp,32
    80004d90:	00050493          	mv	s1,a0
    80004d94:	00008797          	auipc	a5,0x8
    80004d98:	e6478793          	addi	a5,a5,-412 # 8000cbf8 <_ZTV8Producer+0x10>
    80004d9c:	00f53023          	sd	a5,0(a0)
    80004da0:	ffffe097          	auipc	ra,0xffffe
    80004da4:	a10080e7          	jalr	-1520(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80004da8:	00048513          	mv	a0,s1
    80004dac:	ffffe097          	auipc	ra,0xffffe
    80004db0:	b44080e7          	jalr	-1212(ra) # 800028f0 <_ZdlPv>
    80004db4:	01813083          	ld	ra,24(sp)
    80004db8:	01013403          	ld	s0,16(sp)
    80004dbc:	00813483          	ld	s1,8(sp)
    80004dc0:	02010113          	addi	sp,sp,32
    80004dc4:	00008067          	ret

0000000080004dc8 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004dc8:	fe010113          	addi	sp,sp,-32
    80004dcc:	00113c23          	sd	ra,24(sp)
    80004dd0:	00813823          	sd	s0,16(sp)
    80004dd4:	00913423          	sd	s1,8(sp)
    80004dd8:	02010413          	addi	s0,sp,32
    80004ddc:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004de0:	ffffc097          	auipc	ra,0xffffc
    80004de4:	794080e7          	jalr	1940(ra) # 80001574 <_Z4getcv>
    80004de8:	0005059b          	sext.w	a1,a0
    80004dec:	01b00793          	li	a5,27
    80004df0:	00f58c63          	beq	a1,a5,80004e08 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004df4:	0204b783          	ld	a5,32(s1)
    80004df8:	0087b503          	ld	a0,8(a5)
    80004dfc:	00001097          	auipc	ra,0x1
    80004e00:	36c080e7          	jalr	876(ra) # 80006168 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004e04:	fddff06f          	j	80004de0 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004e08:	00100793          	li	a5,1
    80004e0c:	00008717          	auipc	a4,0x8
    80004e10:	0af72e23          	sw	a5,188(a4) # 8000cec8 <_ZL9threadEnd>
        td->buffer->put('!');
    80004e14:	0204b783          	ld	a5,32(s1)
    80004e18:	02100593          	li	a1,33
    80004e1c:	0087b503          	ld	a0,8(a5)
    80004e20:	00001097          	auipc	ra,0x1
    80004e24:	348080e7          	jalr	840(ra) # 80006168 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004e28:	0204b783          	ld	a5,32(s1)
    80004e2c:	0107b503          	ld	a0,16(a5)
    80004e30:	ffffe097          	auipc	ra,0xffffe
    80004e34:	e28080e7          	jalr	-472(ra) # 80002c58 <_ZN9Semaphore6signalEv>
    }
    80004e38:	01813083          	ld	ra,24(sp)
    80004e3c:	01013403          	ld	s0,16(sp)
    80004e40:	00813483          	ld	s1,8(sp)
    80004e44:	02010113          	addi	sp,sp,32
    80004e48:	00008067          	ret

0000000080004e4c <_ZN8Producer3runEv>:
    void run() override {
    80004e4c:	fe010113          	addi	sp,sp,-32
    80004e50:	00113c23          	sd	ra,24(sp)
    80004e54:	00813823          	sd	s0,16(sp)
    80004e58:	00913423          	sd	s1,8(sp)
    80004e5c:	01213023          	sd	s2,0(sp)
    80004e60:	02010413          	addi	s0,sp,32
    80004e64:	00050493          	mv	s1,a0
        int i = 0;
    80004e68:	00000913          	li	s2,0
        while (!threadEnd) {
    80004e6c:	00008797          	auipc	a5,0x8
    80004e70:	05c7a783          	lw	a5,92(a5) # 8000cec8 <_ZL9threadEnd>
    80004e74:	04079263          	bnez	a5,80004eb8 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004e78:	0204b783          	ld	a5,32(s1)
    80004e7c:	0007a583          	lw	a1,0(a5)
    80004e80:	0305859b          	addiw	a1,a1,48
    80004e84:	0087b503          	ld	a0,8(a5)
    80004e88:	00001097          	auipc	ra,0x1
    80004e8c:	2e0080e7          	jalr	736(ra) # 80006168 <_ZN9BufferCPP3putEi>
            i++;
    80004e90:	0019071b          	addiw	a4,s2,1
    80004e94:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004e98:	0204b783          	ld	a5,32(s1)
    80004e9c:	0007a783          	lw	a5,0(a5)
    80004ea0:	00e787bb          	addw	a5,a5,a4
    80004ea4:	00500513          	li	a0,5
    80004ea8:	02a7e53b          	remw	a0,a5,a0
    80004eac:	ffffe097          	auipc	ra,0xffffe
    80004eb0:	c38080e7          	jalr	-968(ra) # 80002ae4 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004eb4:	fb9ff06f          	j	80004e6c <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004eb8:	0204b783          	ld	a5,32(s1)
    80004ebc:	0107b503          	ld	a0,16(a5)
    80004ec0:	ffffe097          	auipc	ra,0xffffe
    80004ec4:	d98080e7          	jalr	-616(ra) # 80002c58 <_ZN9Semaphore6signalEv>
    }
    80004ec8:	01813083          	ld	ra,24(sp)
    80004ecc:	01013403          	ld	s0,16(sp)
    80004ed0:	00813483          	ld	s1,8(sp)
    80004ed4:	00013903          	ld	s2,0(sp)
    80004ed8:	02010113          	addi	sp,sp,32
    80004edc:	00008067          	ret

0000000080004ee0 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004ee0:	fe010113          	addi	sp,sp,-32
    80004ee4:	00113c23          	sd	ra,24(sp)
    80004ee8:	00813823          	sd	s0,16(sp)
    80004eec:	00913423          	sd	s1,8(sp)
    80004ef0:	01213023          	sd	s2,0(sp)
    80004ef4:	02010413          	addi	s0,sp,32
    80004ef8:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004efc:	00100793          	li	a5,1
    80004f00:	02a7f863          	bgeu	a5,a0,80004f30 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004f04:	00a00793          	li	a5,10
    80004f08:	02f577b3          	remu	a5,a0,a5
    80004f0c:	02078e63          	beqz	a5,80004f48 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004f10:	fff48513          	addi	a0,s1,-1
    80004f14:	00000097          	auipc	ra,0x0
    80004f18:	fcc080e7          	jalr	-52(ra) # 80004ee0 <_ZL9fibonaccim>
    80004f1c:	00050913          	mv	s2,a0
    80004f20:	ffe48513          	addi	a0,s1,-2
    80004f24:	00000097          	auipc	ra,0x0
    80004f28:	fbc080e7          	jalr	-68(ra) # 80004ee0 <_ZL9fibonaccim>
    80004f2c:	00a90533          	add	a0,s2,a0
}
    80004f30:	01813083          	ld	ra,24(sp)
    80004f34:	01013403          	ld	s0,16(sp)
    80004f38:	00813483          	ld	s1,8(sp)
    80004f3c:	00013903          	ld	s2,0(sp)
    80004f40:	02010113          	addi	sp,sp,32
    80004f44:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004f48:	ffffc097          	auipc	ra,0xffffc
    80004f4c:	4ec080e7          	jalr	1260(ra) # 80001434 <_Z15thread_dispatchv>
    80004f50:	fc1ff06f          	j	80004f10 <_ZL9fibonaccim+0x30>

0000000080004f54 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004f54:	fe010113          	addi	sp,sp,-32
    80004f58:	00113c23          	sd	ra,24(sp)
    80004f5c:	00813823          	sd	s0,16(sp)
    80004f60:	00913423          	sd	s1,8(sp)
    80004f64:	01213023          	sd	s2,0(sp)
    80004f68:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004f6c:	00a00493          	li	s1,10
    80004f70:	0400006f          	j	80004fb0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004f74:	00005517          	auipc	a0,0x5
    80004f78:	44450513          	addi	a0,a0,1092 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    80004f7c:	00001097          	auipc	ra,0x1
    80004f80:	dc8080e7          	jalr	-568(ra) # 80005d44 <_Z11printStringPKc>
    80004f84:	00000613          	li	a2,0
    80004f88:	00a00593          	li	a1,10
    80004f8c:	00048513          	mv	a0,s1
    80004f90:	00001097          	auipc	ra,0x1
    80004f94:	f64080e7          	jalr	-156(ra) # 80005ef4 <_Z8printIntiii>
    80004f98:	00005517          	auipc	a0,0x5
    80004f9c:	61050513          	addi	a0,a0,1552 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80004fa0:	00001097          	auipc	ra,0x1
    80004fa4:	da4080e7          	jalr	-604(ra) # 80005d44 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004fa8:	0014849b          	addiw	s1,s1,1
    80004fac:	0ff4f493          	andi	s1,s1,255
    80004fb0:	00c00793          	li	a5,12
    80004fb4:	fc97f0e3          	bgeu	a5,s1,80004f74 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004fb8:	00005517          	auipc	a0,0x5
    80004fbc:	40850513          	addi	a0,a0,1032 # 8000a3c0 <_ZZ9kPrintIntmE6digits+0x350>
    80004fc0:	00001097          	auipc	ra,0x1
    80004fc4:	d84080e7          	jalr	-636(ra) # 80005d44 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004fc8:	00500313          	li	t1,5
    thread_dispatch();
    80004fcc:	ffffc097          	auipc	ra,0xffffc
    80004fd0:	468080e7          	jalr	1128(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004fd4:	01000513          	li	a0,16
    80004fd8:	00000097          	auipc	ra,0x0
    80004fdc:	f08080e7          	jalr	-248(ra) # 80004ee0 <_ZL9fibonaccim>
    80004fe0:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004fe4:	00005517          	auipc	a0,0x5
    80004fe8:	3ec50513          	addi	a0,a0,1004 # 8000a3d0 <_ZZ9kPrintIntmE6digits+0x360>
    80004fec:	00001097          	auipc	ra,0x1
    80004ff0:	d58080e7          	jalr	-680(ra) # 80005d44 <_Z11printStringPKc>
    80004ff4:	00000613          	li	a2,0
    80004ff8:	00a00593          	li	a1,10
    80004ffc:	0009051b          	sext.w	a0,s2
    80005000:	00001097          	auipc	ra,0x1
    80005004:	ef4080e7          	jalr	-268(ra) # 80005ef4 <_Z8printIntiii>
    80005008:	00005517          	auipc	a0,0x5
    8000500c:	5a050513          	addi	a0,a0,1440 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80005010:	00001097          	auipc	ra,0x1
    80005014:	d34080e7          	jalr	-716(ra) # 80005d44 <_Z11printStringPKc>
    80005018:	0400006f          	j	80005058 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000501c:	00005517          	auipc	a0,0x5
    80005020:	39c50513          	addi	a0,a0,924 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    80005024:	00001097          	auipc	ra,0x1
    80005028:	d20080e7          	jalr	-736(ra) # 80005d44 <_Z11printStringPKc>
    8000502c:	00000613          	li	a2,0
    80005030:	00a00593          	li	a1,10
    80005034:	00048513          	mv	a0,s1
    80005038:	00001097          	auipc	ra,0x1
    8000503c:	ebc080e7          	jalr	-324(ra) # 80005ef4 <_Z8printIntiii>
    80005040:	00005517          	auipc	a0,0x5
    80005044:	56850513          	addi	a0,a0,1384 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80005048:	00001097          	auipc	ra,0x1
    8000504c:	cfc080e7          	jalr	-772(ra) # 80005d44 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005050:	0014849b          	addiw	s1,s1,1
    80005054:	0ff4f493          	andi	s1,s1,255
    80005058:	00f00793          	li	a5,15
    8000505c:	fc97f0e3          	bgeu	a5,s1,8000501c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005060:	00005517          	auipc	a0,0x5
    80005064:	38050513          	addi	a0,a0,896 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80005068:	00001097          	auipc	ra,0x1
    8000506c:	cdc080e7          	jalr	-804(ra) # 80005d44 <_Z11printStringPKc>
    finishedD = true;
    80005070:	00100793          	li	a5,1
    80005074:	00008717          	auipc	a4,0x8
    80005078:	e6f70223          	sb	a5,-412(a4) # 8000ced8 <_ZL9finishedD>
    thread_dispatch();
    8000507c:	ffffc097          	auipc	ra,0xffffc
    80005080:	3b8080e7          	jalr	952(ra) # 80001434 <_Z15thread_dispatchv>
}
    80005084:	01813083          	ld	ra,24(sp)
    80005088:	01013403          	ld	s0,16(sp)
    8000508c:	00813483          	ld	s1,8(sp)
    80005090:	00013903          	ld	s2,0(sp)
    80005094:	02010113          	addi	sp,sp,32
    80005098:	00008067          	ret

000000008000509c <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    8000509c:	fe010113          	addi	sp,sp,-32
    800050a0:	00113c23          	sd	ra,24(sp)
    800050a4:	00813823          	sd	s0,16(sp)
    800050a8:	00913423          	sd	s1,8(sp)
    800050ac:	01213023          	sd	s2,0(sp)
    800050b0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800050b4:	00000493          	li	s1,0
    800050b8:	0400006f          	j	800050f8 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800050bc:	00005517          	auipc	a0,0x5
    800050c0:	2bc50513          	addi	a0,a0,700 # 8000a378 <_ZZ9kPrintIntmE6digits+0x308>
    800050c4:	00001097          	auipc	ra,0x1
    800050c8:	c80080e7          	jalr	-896(ra) # 80005d44 <_Z11printStringPKc>
    800050cc:	00000613          	li	a2,0
    800050d0:	00a00593          	li	a1,10
    800050d4:	00048513          	mv	a0,s1
    800050d8:	00001097          	auipc	ra,0x1
    800050dc:	e1c080e7          	jalr	-484(ra) # 80005ef4 <_Z8printIntiii>
    800050e0:	00005517          	auipc	a0,0x5
    800050e4:	4c850513          	addi	a0,a0,1224 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    800050e8:	00001097          	auipc	ra,0x1
    800050ec:	c5c080e7          	jalr	-932(ra) # 80005d44 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800050f0:	0014849b          	addiw	s1,s1,1
    800050f4:	0ff4f493          	andi	s1,s1,255
    800050f8:	00200793          	li	a5,2
    800050fc:	fc97f0e3          	bgeu	a5,s1,800050bc <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005100:	00005517          	auipc	a0,0x5
    80005104:	28050513          	addi	a0,a0,640 # 8000a380 <_ZZ9kPrintIntmE6digits+0x310>
    80005108:	00001097          	auipc	ra,0x1
    8000510c:	c3c080e7          	jalr	-964(ra) # 80005d44 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005110:	00700313          	li	t1,7
    thread_dispatch();
    80005114:	ffffc097          	auipc	ra,0xffffc
    80005118:	320080e7          	jalr	800(ra) # 80001434 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000511c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005120:	00005517          	auipc	a0,0x5
    80005124:	27050513          	addi	a0,a0,624 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80005128:	00001097          	auipc	ra,0x1
    8000512c:	c1c080e7          	jalr	-996(ra) # 80005d44 <_Z11printStringPKc>
    80005130:	00000613          	li	a2,0
    80005134:	00a00593          	li	a1,10
    80005138:	0009051b          	sext.w	a0,s2
    8000513c:	00001097          	auipc	ra,0x1
    80005140:	db8080e7          	jalr	-584(ra) # 80005ef4 <_Z8printIntiii>
    80005144:	00005517          	auipc	a0,0x5
    80005148:	46450513          	addi	a0,a0,1124 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    8000514c:	00001097          	auipc	ra,0x1
    80005150:	bf8080e7          	jalr	-1032(ra) # 80005d44 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005154:	00c00513          	li	a0,12
    80005158:	00000097          	auipc	ra,0x0
    8000515c:	d88080e7          	jalr	-632(ra) # 80004ee0 <_ZL9fibonaccim>
    80005160:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005164:	00005517          	auipc	a0,0x5
    80005168:	23450513          	addi	a0,a0,564 # 8000a398 <_ZZ9kPrintIntmE6digits+0x328>
    8000516c:	00001097          	auipc	ra,0x1
    80005170:	bd8080e7          	jalr	-1064(ra) # 80005d44 <_Z11printStringPKc>
    80005174:	00000613          	li	a2,0
    80005178:	00a00593          	li	a1,10
    8000517c:	0009051b          	sext.w	a0,s2
    80005180:	00001097          	auipc	ra,0x1
    80005184:	d74080e7          	jalr	-652(ra) # 80005ef4 <_Z8printIntiii>
    80005188:	00005517          	auipc	a0,0x5
    8000518c:	42050513          	addi	a0,a0,1056 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80005190:	00001097          	auipc	ra,0x1
    80005194:	bb4080e7          	jalr	-1100(ra) # 80005d44 <_Z11printStringPKc>
    80005198:	0400006f          	j	800051d8 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    8000519c:	00005517          	auipc	a0,0x5
    800051a0:	1dc50513          	addi	a0,a0,476 # 8000a378 <_ZZ9kPrintIntmE6digits+0x308>
    800051a4:	00001097          	auipc	ra,0x1
    800051a8:	ba0080e7          	jalr	-1120(ra) # 80005d44 <_Z11printStringPKc>
    800051ac:	00000613          	li	a2,0
    800051b0:	00a00593          	li	a1,10
    800051b4:	00048513          	mv	a0,s1
    800051b8:	00001097          	auipc	ra,0x1
    800051bc:	d3c080e7          	jalr	-708(ra) # 80005ef4 <_Z8printIntiii>
    800051c0:	00005517          	auipc	a0,0x5
    800051c4:	3e850513          	addi	a0,a0,1000 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    800051c8:	00001097          	auipc	ra,0x1
    800051cc:	b7c080e7          	jalr	-1156(ra) # 80005d44 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800051d0:	0014849b          	addiw	s1,s1,1
    800051d4:	0ff4f493          	andi	s1,s1,255
    800051d8:	00500793          	li	a5,5
    800051dc:	fc97f0e3          	bgeu	a5,s1,8000519c <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    800051e0:	00005517          	auipc	a0,0x5
    800051e4:	1c850513          	addi	a0,a0,456 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    800051e8:	00001097          	auipc	ra,0x1
    800051ec:	b5c080e7          	jalr	-1188(ra) # 80005d44 <_Z11printStringPKc>
    finishedC = true;
    800051f0:	00100793          	li	a5,1
    800051f4:	00008717          	auipc	a4,0x8
    800051f8:	cef702a3          	sb	a5,-795(a4) # 8000ced9 <_ZL9finishedC>
    thread_dispatch();
    800051fc:	ffffc097          	auipc	ra,0xffffc
    80005200:	238080e7          	jalr	568(ra) # 80001434 <_Z15thread_dispatchv>
}
    80005204:	01813083          	ld	ra,24(sp)
    80005208:	01013403          	ld	s0,16(sp)
    8000520c:	00813483          	ld	s1,8(sp)
    80005210:	00013903          	ld	s2,0(sp)
    80005214:	02010113          	addi	sp,sp,32
    80005218:	00008067          	ret

000000008000521c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000521c:	fe010113          	addi	sp,sp,-32
    80005220:	00113c23          	sd	ra,24(sp)
    80005224:	00813823          	sd	s0,16(sp)
    80005228:	00913423          	sd	s1,8(sp)
    8000522c:	01213023          	sd	s2,0(sp)
    80005230:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005234:	00000913          	li	s2,0
    80005238:	0380006f          	j	80005270 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    8000523c:	ffffc097          	auipc	ra,0xffffc
    80005240:	1f8080e7          	jalr	504(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005244:	00148493          	addi	s1,s1,1
    80005248:	000027b7          	lui	a5,0x2
    8000524c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005250:	0097ee63          	bltu	a5,s1,8000526c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005254:	00000713          	li	a4,0
    80005258:	000077b7          	lui	a5,0x7
    8000525c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005260:	fce7eee3          	bltu	a5,a4,8000523c <_ZL11workerBodyBPv+0x20>
    80005264:	00170713          	addi	a4,a4,1
    80005268:	ff1ff06f          	j	80005258 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    8000526c:	00190913          	addi	s2,s2,1
    80005270:	00f00793          	li	a5,15
    80005274:	0527e063          	bltu	a5,s2,800052b4 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80005278:	00005517          	auipc	a0,0x5
    8000527c:	0e850513          	addi	a0,a0,232 # 8000a360 <_ZZ9kPrintIntmE6digits+0x2f0>
    80005280:	00001097          	auipc	ra,0x1
    80005284:	ac4080e7          	jalr	-1340(ra) # 80005d44 <_Z11printStringPKc>
    80005288:	00000613          	li	a2,0
    8000528c:	00a00593          	li	a1,10
    80005290:	0009051b          	sext.w	a0,s2
    80005294:	00001097          	auipc	ra,0x1
    80005298:	c60080e7          	jalr	-928(ra) # 80005ef4 <_Z8printIntiii>
    8000529c:	00005517          	auipc	a0,0x5
    800052a0:	30c50513          	addi	a0,a0,780 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    800052a4:	00001097          	auipc	ra,0x1
    800052a8:	aa0080e7          	jalr	-1376(ra) # 80005d44 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800052ac:	00000493          	li	s1,0
    800052b0:	f99ff06f          	j	80005248 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    800052b4:	00005517          	auipc	a0,0x5
    800052b8:	0b450513          	addi	a0,a0,180 # 8000a368 <_ZZ9kPrintIntmE6digits+0x2f8>
    800052bc:	00001097          	auipc	ra,0x1
    800052c0:	a88080e7          	jalr	-1400(ra) # 80005d44 <_Z11printStringPKc>
    finishedB = true;
    800052c4:	00100793          	li	a5,1
    800052c8:	00008717          	auipc	a4,0x8
    800052cc:	c0f70923          	sb	a5,-1006(a4) # 8000ceda <_ZL9finishedB>
    thread_dispatch();
    800052d0:	ffffc097          	auipc	ra,0xffffc
    800052d4:	164080e7          	jalr	356(ra) # 80001434 <_Z15thread_dispatchv>
}
    800052d8:	01813083          	ld	ra,24(sp)
    800052dc:	01013403          	ld	s0,16(sp)
    800052e0:	00813483          	ld	s1,8(sp)
    800052e4:	00013903          	ld	s2,0(sp)
    800052e8:	02010113          	addi	sp,sp,32
    800052ec:	00008067          	ret

00000000800052f0 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800052f0:	fe010113          	addi	sp,sp,-32
    800052f4:	00113c23          	sd	ra,24(sp)
    800052f8:	00813823          	sd	s0,16(sp)
    800052fc:	00913423          	sd	s1,8(sp)
    80005300:	01213023          	sd	s2,0(sp)
    80005304:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005308:	00000913          	li	s2,0
    8000530c:	0380006f          	j	80005344 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005310:	ffffc097          	auipc	ra,0xffffc
    80005314:	124080e7          	jalr	292(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005318:	00148493          	addi	s1,s1,1
    8000531c:	000027b7          	lui	a5,0x2
    80005320:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005324:	0097ee63          	bltu	a5,s1,80005340 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005328:	00000713          	li	a4,0
    8000532c:	000077b7          	lui	a5,0x7
    80005330:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005334:	fce7eee3          	bltu	a5,a4,80005310 <_ZL11workerBodyAPv+0x20>
    80005338:	00170713          	addi	a4,a4,1
    8000533c:	ff1ff06f          	j	8000532c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005340:	00190913          	addi	s2,s2,1
    80005344:	00900793          	li	a5,9
    80005348:	0527e063          	bltu	a5,s2,80005388 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000534c:	00005517          	auipc	a0,0x5
    80005350:	ffc50513          	addi	a0,a0,-4 # 8000a348 <_ZZ9kPrintIntmE6digits+0x2d8>
    80005354:	00001097          	auipc	ra,0x1
    80005358:	9f0080e7          	jalr	-1552(ra) # 80005d44 <_Z11printStringPKc>
    8000535c:	00000613          	li	a2,0
    80005360:	00a00593          	li	a1,10
    80005364:	0009051b          	sext.w	a0,s2
    80005368:	00001097          	auipc	ra,0x1
    8000536c:	b8c080e7          	jalr	-1140(ra) # 80005ef4 <_Z8printIntiii>
    80005370:	00005517          	auipc	a0,0x5
    80005374:	23850513          	addi	a0,a0,568 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80005378:	00001097          	auipc	ra,0x1
    8000537c:	9cc080e7          	jalr	-1588(ra) # 80005d44 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005380:	00000493          	li	s1,0
    80005384:	f99ff06f          	j	8000531c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005388:	00005517          	auipc	a0,0x5
    8000538c:	fc850513          	addi	a0,a0,-56 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80005390:	00001097          	auipc	ra,0x1
    80005394:	9b4080e7          	jalr	-1612(ra) # 80005d44 <_Z11printStringPKc>
    finishedA = true;
    80005398:	00100793          	li	a5,1
    8000539c:	00008717          	auipc	a4,0x8
    800053a0:	b2f70fa3          	sb	a5,-1217(a4) # 8000cedb <_ZL9finishedA>
}
    800053a4:	01813083          	ld	ra,24(sp)
    800053a8:	01013403          	ld	s0,16(sp)
    800053ac:	00813483          	ld	s1,8(sp)
    800053b0:	00013903          	ld	s2,0(sp)
    800053b4:	02010113          	addi	sp,sp,32
    800053b8:	00008067          	ret

00000000800053bc <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800053bc:	fd010113          	addi	sp,sp,-48
    800053c0:	02113423          	sd	ra,40(sp)
    800053c4:	02813023          	sd	s0,32(sp)
    800053c8:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800053cc:	00000613          	li	a2,0
    800053d0:	00000597          	auipc	a1,0x0
    800053d4:	f2058593          	addi	a1,a1,-224 # 800052f0 <_ZL11workerBodyAPv>
    800053d8:	fd040513          	addi	a0,s0,-48
    800053dc:	ffffc097          	auipc	ra,0xffffc
    800053e0:	f9c080e7          	jalr	-100(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800053e4:	00005517          	auipc	a0,0x5
    800053e8:	00c50513          	addi	a0,a0,12 # 8000a3f0 <_ZZ9kPrintIntmE6digits+0x380>
    800053ec:	00001097          	auipc	ra,0x1
    800053f0:	958080e7          	jalr	-1704(ra) # 80005d44 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800053f4:	00000613          	li	a2,0
    800053f8:	00000597          	auipc	a1,0x0
    800053fc:	e2458593          	addi	a1,a1,-476 # 8000521c <_ZL11workerBodyBPv>
    80005400:	fd840513          	addi	a0,s0,-40
    80005404:	ffffc097          	auipc	ra,0xffffc
    80005408:	f74080e7          	jalr	-140(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    8000540c:	00005517          	auipc	a0,0x5
    80005410:	ffc50513          	addi	a0,a0,-4 # 8000a408 <_ZZ9kPrintIntmE6digits+0x398>
    80005414:	00001097          	auipc	ra,0x1
    80005418:	930080e7          	jalr	-1744(ra) # 80005d44 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000541c:	00000613          	li	a2,0
    80005420:	00000597          	auipc	a1,0x0
    80005424:	c7c58593          	addi	a1,a1,-900 # 8000509c <_ZL11workerBodyCPv>
    80005428:	fe040513          	addi	a0,s0,-32
    8000542c:	ffffc097          	auipc	ra,0xffffc
    80005430:	f4c080e7          	jalr	-180(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005434:	00005517          	auipc	a0,0x5
    80005438:	fec50513          	addi	a0,a0,-20 # 8000a420 <_ZZ9kPrintIntmE6digits+0x3b0>
    8000543c:	00001097          	auipc	ra,0x1
    80005440:	908080e7          	jalr	-1784(ra) # 80005d44 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005444:	00000613          	li	a2,0
    80005448:	00000597          	auipc	a1,0x0
    8000544c:	b0c58593          	addi	a1,a1,-1268 # 80004f54 <_ZL11workerBodyDPv>
    80005450:	fe840513          	addi	a0,s0,-24
    80005454:	ffffc097          	auipc	ra,0xffffc
    80005458:	f24080e7          	jalr	-220(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    8000545c:	00005517          	auipc	a0,0x5
    80005460:	fdc50513          	addi	a0,a0,-36 # 8000a438 <_ZZ9kPrintIntmE6digits+0x3c8>
    80005464:	00001097          	auipc	ra,0x1
    80005468:	8e0080e7          	jalr	-1824(ra) # 80005d44 <_Z11printStringPKc>
    8000546c:	00c0006f          	j	80005478 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005470:	ffffc097          	auipc	ra,0xffffc
    80005474:	fc4080e7          	jalr	-60(ra) # 80001434 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005478:	00008797          	auipc	a5,0x8
    8000547c:	a637c783          	lbu	a5,-1437(a5) # 8000cedb <_ZL9finishedA>
    80005480:	fe0788e3          	beqz	a5,80005470 <_Z18Threads_C_API_testv+0xb4>
    80005484:	00008797          	auipc	a5,0x8
    80005488:	a567c783          	lbu	a5,-1450(a5) # 8000ceda <_ZL9finishedB>
    8000548c:	fe0782e3          	beqz	a5,80005470 <_Z18Threads_C_API_testv+0xb4>
    80005490:	00008797          	auipc	a5,0x8
    80005494:	a497c783          	lbu	a5,-1463(a5) # 8000ced9 <_ZL9finishedC>
    80005498:	fc078ce3          	beqz	a5,80005470 <_Z18Threads_C_API_testv+0xb4>
    8000549c:	00008797          	auipc	a5,0x8
    800054a0:	a3c7c783          	lbu	a5,-1476(a5) # 8000ced8 <_ZL9finishedD>
    800054a4:	fc0786e3          	beqz	a5,80005470 <_Z18Threads_C_API_testv+0xb4>
    }

}
    800054a8:	02813083          	ld	ra,40(sp)
    800054ac:	02013403          	ld	s0,32(sp)
    800054b0:	03010113          	addi	sp,sp,48
    800054b4:	00008067          	ret

00000000800054b8 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    800054b8:	fd010113          	addi	sp,sp,-48
    800054bc:	02113423          	sd	ra,40(sp)
    800054c0:	02813023          	sd	s0,32(sp)
    800054c4:	00913c23          	sd	s1,24(sp)
    800054c8:	01213823          	sd	s2,16(sp)
    800054cc:	01313423          	sd	s3,8(sp)
    800054d0:	03010413          	addi	s0,sp,48
    800054d4:	00050993          	mv	s3,a0
    800054d8:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800054dc:	00000913          	li	s2,0
    800054e0:	00c0006f          	j	800054ec <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800054e4:	ffffd097          	auipc	ra,0xffffd
    800054e8:	5d8080e7          	jalr	1496(ra) # 80002abc <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    800054ec:	ffffc097          	auipc	ra,0xffffc
    800054f0:	088080e7          	jalr	136(ra) # 80001574 <_Z4getcv>
    800054f4:	0005059b          	sext.w	a1,a0
    800054f8:	01b00793          	li	a5,27
    800054fc:	02f58a63          	beq	a1,a5,80005530 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005500:	0084b503          	ld	a0,8(s1)
    80005504:	00001097          	auipc	ra,0x1
    80005508:	c64080e7          	jalr	-924(ra) # 80006168 <_ZN9BufferCPP3putEi>
        i++;
    8000550c:	0019071b          	addiw	a4,s2,1
    80005510:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005514:	0004a683          	lw	a3,0(s1)
    80005518:	0026979b          	slliw	a5,a3,0x2
    8000551c:	00d787bb          	addw	a5,a5,a3
    80005520:	0017979b          	slliw	a5,a5,0x1
    80005524:	02f767bb          	remw	a5,a4,a5
    80005528:	fc0792e3          	bnez	a5,800054ec <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    8000552c:	fb9ff06f          	j	800054e4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005530:	00100793          	li	a5,1
    80005534:	00008717          	auipc	a4,0x8
    80005538:	9af72623          	sw	a5,-1620(a4) # 8000cee0 <_ZL9threadEnd>
    td->buffer->put('!');
    8000553c:	0209b783          	ld	a5,32(s3)
    80005540:	02100593          	li	a1,33
    80005544:	0087b503          	ld	a0,8(a5)
    80005548:	00001097          	auipc	ra,0x1
    8000554c:	c20080e7          	jalr	-992(ra) # 80006168 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005550:	0104b503          	ld	a0,16(s1)
    80005554:	ffffd097          	auipc	ra,0xffffd
    80005558:	704080e7          	jalr	1796(ra) # 80002c58 <_ZN9Semaphore6signalEv>
}
    8000555c:	02813083          	ld	ra,40(sp)
    80005560:	02013403          	ld	s0,32(sp)
    80005564:	01813483          	ld	s1,24(sp)
    80005568:	01013903          	ld	s2,16(sp)
    8000556c:	00813983          	ld	s3,8(sp)
    80005570:	03010113          	addi	sp,sp,48
    80005574:	00008067          	ret

0000000080005578 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80005578:	fe010113          	addi	sp,sp,-32
    8000557c:	00113c23          	sd	ra,24(sp)
    80005580:	00813823          	sd	s0,16(sp)
    80005584:	00913423          	sd	s1,8(sp)
    80005588:	01213023          	sd	s2,0(sp)
    8000558c:	02010413          	addi	s0,sp,32
    80005590:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005594:	00000913          	li	s2,0
    80005598:	00c0006f          	j	800055a4 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    8000559c:	ffffd097          	auipc	ra,0xffffd
    800055a0:	520080e7          	jalr	1312(ra) # 80002abc <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800055a4:	00008797          	auipc	a5,0x8
    800055a8:	93c7a783          	lw	a5,-1732(a5) # 8000cee0 <_ZL9threadEnd>
    800055ac:	02079e63          	bnez	a5,800055e8 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    800055b0:	0004a583          	lw	a1,0(s1)
    800055b4:	0305859b          	addiw	a1,a1,48
    800055b8:	0084b503          	ld	a0,8(s1)
    800055bc:	00001097          	auipc	ra,0x1
    800055c0:	bac080e7          	jalr	-1108(ra) # 80006168 <_ZN9BufferCPP3putEi>
        i++;
    800055c4:	0019071b          	addiw	a4,s2,1
    800055c8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800055cc:	0004a683          	lw	a3,0(s1)
    800055d0:	0026979b          	slliw	a5,a3,0x2
    800055d4:	00d787bb          	addw	a5,a5,a3
    800055d8:	0017979b          	slliw	a5,a5,0x1
    800055dc:	02f767bb          	remw	a5,a4,a5
    800055e0:	fc0792e3          	bnez	a5,800055a4 <_ZN12ProducerSync8producerEPv+0x2c>
    800055e4:	fb9ff06f          	j	8000559c <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    800055e8:	0104b503          	ld	a0,16(s1)
    800055ec:	ffffd097          	auipc	ra,0xffffd
    800055f0:	66c080e7          	jalr	1644(ra) # 80002c58 <_ZN9Semaphore6signalEv>
}
    800055f4:	01813083          	ld	ra,24(sp)
    800055f8:	01013403          	ld	s0,16(sp)
    800055fc:	00813483          	ld	s1,8(sp)
    80005600:	00013903          	ld	s2,0(sp)
    80005604:	02010113          	addi	sp,sp,32
    80005608:	00008067          	ret

000000008000560c <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    8000560c:	fd010113          	addi	sp,sp,-48
    80005610:	02113423          	sd	ra,40(sp)
    80005614:	02813023          	sd	s0,32(sp)
    80005618:	00913c23          	sd	s1,24(sp)
    8000561c:	01213823          	sd	s2,16(sp)
    80005620:	01313423          	sd	s3,8(sp)
    80005624:	01413023          	sd	s4,0(sp)
    80005628:	03010413          	addi	s0,sp,48
    8000562c:	00050993          	mv	s3,a0
    80005630:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005634:	00000a13          	li	s4,0
    80005638:	01c0006f          	j	80005654 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    8000563c:	ffffd097          	auipc	ra,0xffffd
    80005640:	480080e7          	jalr	1152(ra) # 80002abc <_ZN6Thread8dispatchEv>
    80005644:	0500006f          	j	80005694 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005648:	00a00513          	li	a0,10
    8000564c:	ffffc097          	auipc	ra,0xffffc
    80005650:	f50080e7          	jalr	-176(ra) # 8000159c <_Z4putcc>
    while (!threadEnd) {
    80005654:	00008797          	auipc	a5,0x8
    80005658:	88c7a783          	lw	a5,-1908(a5) # 8000cee0 <_ZL9threadEnd>
    8000565c:	06079263          	bnez	a5,800056c0 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005660:	00893503          	ld	a0,8(s2)
    80005664:	00001097          	auipc	ra,0x1
    80005668:	b94080e7          	jalr	-1132(ra) # 800061f8 <_ZN9BufferCPP3getEv>
        i++;
    8000566c:	001a049b          	addiw	s1,s4,1
    80005670:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005674:	0ff57513          	andi	a0,a0,255
    80005678:	ffffc097          	auipc	ra,0xffffc
    8000567c:	f24080e7          	jalr	-220(ra) # 8000159c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005680:	00092703          	lw	a4,0(s2)
    80005684:	0027179b          	slliw	a5,a4,0x2
    80005688:	00e787bb          	addw	a5,a5,a4
    8000568c:	02f4e7bb          	remw	a5,s1,a5
    80005690:	fa0786e3          	beqz	a5,8000563c <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005694:	05000793          	li	a5,80
    80005698:	02f4e4bb          	remw	s1,s1,a5
    8000569c:	fa049ce3          	bnez	s1,80005654 <_ZN12ConsumerSync8consumerEPv+0x48>
    800056a0:	fa9ff06f          	j	80005648 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800056a4:	0209b783          	ld	a5,32(s3)
    800056a8:	0087b503          	ld	a0,8(a5)
    800056ac:	00001097          	auipc	ra,0x1
    800056b0:	b4c080e7          	jalr	-1204(ra) # 800061f8 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    800056b4:	0ff57513          	andi	a0,a0,255
    800056b8:	ffffd097          	auipc	ra,0xffffd
    800056bc:	664080e7          	jalr	1636(ra) # 80002d1c <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    800056c0:	0209b783          	ld	a5,32(s3)
    800056c4:	0087b503          	ld	a0,8(a5)
    800056c8:	00001097          	auipc	ra,0x1
    800056cc:	bbc080e7          	jalr	-1092(ra) # 80006284 <_ZN9BufferCPP6getCntEv>
    800056d0:	fca04ae3          	bgtz	a0,800056a4 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    800056d4:	01093503          	ld	a0,16(s2)
    800056d8:	ffffd097          	auipc	ra,0xffffd
    800056dc:	580080e7          	jalr	1408(ra) # 80002c58 <_ZN9Semaphore6signalEv>
}
    800056e0:	02813083          	ld	ra,40(sp)
    800056e4:	02013403          	ld	s0,32(sp)
    800056e8:	01813483          	ld	s1,24(sp)
    800056ec:	01013903          	ld	s2,16(sp)
    800056f0:	00813983          	ld	s3,8(sp)
    800056f4:	00013a03          	ld	s4,0(sp)
    800056f8:	03010113          	addi	sp,sp,48
    800056fc:	00008067          	ret

0000000080005700 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005700:	f8010113          	addi	sp,sp,-128
    80005704:	06113c23          	sd	ra,120(sp)
    80005708:	06813823          	sd	s0,112(sp)
    8000570c:	06913423          	sd	s1,104(sp)
    80005710:	07213023          	sd	s2,96(sp)
    80005714:	05313c23          	sd	s3,88(sp)
    80005718:	05413823          	sd	s4,80(sp)
    8000571c:	05513423          	sd	s5,72(sp)
    80005720:	05613023          	sd	s6,64(sp)
    80005724:	03713c23          	sd	s7,56(sp)
    80005728:	03813823          	sd	s8,48(sp)
    8000572c:	03913423          	sd	s9,40(sp)
    80005730:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005734:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005738:	00005517          	auipc	a0,0x5
    8000573c:	b2850513          	addi	a0,a0,-1240 # 8000a260 <_ZZ9kPrintIntmE6digits+0x1f0>
    80005740:	00000097          	auipc	ra,0x0
    80005744:	604080e7          	jalr	1540(ra) # 80005d44 <_Z11printStringPKc>
    getString(input, 30);
    80005748:	01e00593          	li	a1,30
    8000574c:	f8040493          	addi	s1,s0,-128
    80005750:	00048513          	mv	a0,s1
    80005754:	00000097          	auipc	ra,0x0
    80005758:	678080e7          	jalr	1656(ra) # 80005dcc <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000575c:	00048513          	mv	a0,s1
    80005760:	00000097          	auipc	ra,0x0
    80005764:	744080e7          	jalr	1860(ra) # 80005ea4 <_Z11stringToIntPKc>
    80005768:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000576c:	00005517          	auipc	a0,0x5
    80005770:	b1450513          	addi	a0,a0,-1260 # 8000a280 <_ZZ9kPrintIntmE6digits+0x210>
    80005774:	00000097          	auipc	ra,0x0
    80005778:	5d0080e7          	jalr	1488(ra) # 80005d44 <_Z11printStringPKc>
    getString(input, 30);
    8000577c:	01e00593          	li	a1,30
    80005780:	00048513          	mv	a0,s1
    80005784:	00000097          	auipc	ra,0x0
    80005788:	648080e7          	jalr	1608(ra) # 80005dcc <_Z9getStringPci>
    n = stringToInt(input);
    8000578c:	00048513          	mv	a0,s1
    80005790:	00000097          	auipc	ra,0x0
    80005794:	714080e7          	jalr	1812(ra) # 80005ea4 <_Z11stringToIntPKc>
    80005798:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    8000579c:	00005517          	auipc	a0,0x5
    800057a0:	b0450513          	addi	a0,a0,-1276 # 8000a2a0 <_ZZ9kPrintIntmE6digits+0x230>
    800057a4:	00000097          	auipc	ra,0x0
    800057a8:	5a0080e7          	jalr	1440(ra) # 80005d44 <_Z11printStringPKc>
    800057ac:	00000613          	li	a2,0
    800057b0:	00a00593          	li	a1,10
    800057b4:	00090513          	mv	a0,s2
    800057b8:	00000097          	auipc	ra,0x0
    800057bc:	73c080e7          	jalr	1852(ra) # 80005ef4 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800057c0:	00005517          	auipc	a0,0x5
    800057c4:	af850513          	addi	a0,a0,-1288 # 8000a2b8 <_ZZ9kPrintIntmE6digits+0x248>
    800057c8:	00000097          	auipc	ra,0x0
    800057cc:	57c080e7          	jalr	1404(ra) # 80005d44 <_Z11printStringPKc>
    800057d0:	00000613          	li	a2,0
    800057d4:	00a00593          	li	a1,10
    800057d8:	00048513          	mv	a0,s1
    800057dc:	00000097          	auipc	ra,0x0
    800057e0:	718080e7          	jalr	1816(ra) # 80005ef4 <_Z8printIntiii>
    printString(".\n");
    800057e4:	00005517          	auipc	a0,0x5
    800057e8:	aec50513          	addi	a0,a0,-1300 # 8000a2d0 <_ZZ9kPrintIntmE6digits+0x260>
    800057ec:	00000097          	auipc	ra,0x0
    800057f0:	558080e7          	jalr	1368(ra) # 80005d44 <_Z11printStringPKc>
    if(threadNum > n) {
    800057f4:	0324c463          	blt	s1,s2,8000581c <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    800057f8:	03205c63          	blez	s2,80005830 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800057fc:	03800513          	li	a0,56
    80005800:	ffffd097          	auipc	ra,0xffffd
    80005804:	0a0080e7          	jalr	160(ra) # 800028a0 <_Znwm>
    80005808:	00050a93          	mv	s5,a0
    8000580c:	00048593          	mv	a1,s1
    80005810:	00001097          	auipc	ra,0x1
    80005814:	804080e7          	jalr	-2044(ra) # 80006014 <_ZN9BufferCPPC1Ei>
    80005818:	0300006f          	j	80005848 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000581c:	00005517          	auipc	a0,0x5
    80005820:	abc50513          	addi	a0,a0,-1348 # 8000a2d8 <_ZZ9kPrintIntmE6digits+0x268>
    80005824:	00000097          	auipc	ra,0x0
    80005828:	520080e7          	jalr	1312(ra) # 80005d44 <_Z11printStringPKc>
        return;
    8000582c:	0140006f          	j	80005840 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005830:	00005517          	auipc	a0,0x5
    80005834:	ae850513          	addi	a0,a0,-1304 # 8000a318 <_ZZ9kPrintIntmE6digits+0x2a8>
    80005838:	00000097          	auipc	ra,0x0
    8000583c:	50c080e7          	jalr	1292(ra) # 80005d44 <_Z11printStringPKc>
        return;
    80005840:	000b8113          	mv	sp,s7
    80005844:	2380006f          	j	80005a7c <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005848:	01000513          	li	a0,16
    8000584c:	ffffd097          	auipc	ra,0xffffd
    80005850:	054080e7          	jalr	84(ra) # 800028a0 <_Znwm>
    80005854:	00050493          	mv	s1,a0
    80005858:	00000593          	li	a1,0
    8000585c:	ffffd097          	auipc	ra,0xffffd
    80005860:	398080e7          	jalr	920(ra) # 80002bf4 <_ZN9SemaphoreC1Ej>
    80005864:	00007797          	auipc	a5,0x7
    80005868:	6897b223          	sd	s1,1668(a5) # 8000cee8 <_ZL10waitForAll>
    Thread* threads[threadNum];
    8000586c:	00391793          	slli	a5,s2,0x3
    80005870:	00f78793          	addi	a5,a5,15
    80005874:	ff07f793          	andi	a5,a5,-16
    80005878:	40f10133          	sub	sp,sp,a5
    8000587c:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005880:	0019071b          	addiw	a4,s2,1
    80005884:	00171793          	slli	a5,a4,0x1
    80005888:	00e787b3          	add	a5,a5,a4
    8000588c:	00379793          	slli	a5,a5,0x3
    80005890:	00f78793          	addi	a5,a5,15
    80005894:	ff07f793          	andi	a5,a5,-16
    80005898:	40f10133          	sub	sp,sp,a5
    8000589c:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800058a0:	00191c13          	slli	s8,s2,0x1
    800058a4:	012c07b3          	add	a5,s8,s2
    800058a8:	00379793          	slli	a5,a5,0x3
    800058ac:	00fa07b3          	add	a5,s4,a5
    800058b0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800058b4:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    800058b8:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    800058bc:	02800513          	li	a0,40
    800058c0:	ffffd097          	auipc	ra,0xffffd
    800058c4:	fe0080e7          	jalr	-32(ra) # 800028a0 <_Znwm>
    800058c8:	00050b13          	mv	s6,a0
    800058cc:	012c0c33          	add	s8,s8,s2
    800058d0:	003c1c13          	slli	s8,s8,0x3
    800058d4:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    800058d8:	ffffd097          	auipc	ra,0xffffd
    800058dc:	2a0080e7          	jalr	672(ra) # 80002b78 <_ZN6ThreadC1Ev>
    800058e0:	00007797          	auipc	a5,0x7
    800058e4:	3b878793          	addi	a5,a5,952 # 8000cc98 <_ZTV12ConsumerSync+0x10>
    800058e8:	00fb3023          	sd	a5,0(s6)
    800058ec:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    800058f0:	000b0513          	mv	a0,s6
    800058f4:	ffffd097          	auipc	ra,0xffffd
    800058f8:	164080e7          	jalr	356(ra) # 80002a58 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800058fc:	00000493          	li	s1,0
    80005900:	0380006f          	j	80005938 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005904:	00007797          	auipc	a5,0x7
    80005908:	36c78793          	addi	a5,a5,876 # 8000cc70 <_ZTV12ProducerSync+0x10>
    8000590c:	00fcb023          	sd	a5,0(s9)
    80005910:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005914:	00349793          	slli	a5,s1,0x3
    80005918:	00f987b3          	add	a5,s3,a5
    8000591c:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005920:	00349793          	slli	a5,s1,0x3
    80005924:	00f987b3          	add	a5,s3,a5
    80005928:	0007b503          	ld	a0,0(a5)
    8000592c:	ffffd097          	auipc	ra,0xffffd
    80005930:	12c080e7          	jalr	300(ra) # 80002a58 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005934:	0014849b          	addiw	s1,s1,1
    80005938:	0b24d063          	bge	s1,s2,800059d8 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    8000593c:	00149793          	slli	a5,s1,0x1
    80005940:	009787b3          	add	a5,a5,s1
    80005944:	00379793          	slli	a5,a5,0x3
    80005948:	00fa07b3          	add	a5,s4,a5
    8000594c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005950:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005954:	00007717          	auipc	a4,0x7
    80005958:	59473703          	ld	a4,1428(a4) # 8000cee8 <_ZL10waitForAll>
    8000595c:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005960:	02905863          	blez	s1,80005990 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005964:	02800513          	li	a0,40
    80005968:	ffffd097          	auipc	ra,0xffffd
    8000596c:	f38080e7          	jalr	-200(ra) # 800028a0 <_Znwm>
    80005970:	00050c93          	mv	s9,a0
    80005974:	00149c13          	slli	s8,s1,0x1
    80005978:	009c0c33          	add	s8,s8,s1
    8000597c:	003c1c13          	slli	s8,s8,0x3
    80005980:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005984:	ffffd097          	auipc	ra,0xffffd
    80005988:	1f4080e7          	jalr	500(ra) # 80002b78 <_ZN6ThreadC1Ev>
    8000598c:	f79ff06f          	j	80005904 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005990:	02800513          	li	a0,40
    80005994:	ffffd097          	auipc	ra,0xffffd
    80005998:	f0c080e7          	jalr	-244(ra) # 800028a0 <_Znwm>
    8000599c:	00050c93          	mv	s9,a0
    800059a0:	00149c13          	slli	s8,s1,0x1
    800059a4:	009c0c33          	add	s8,s8,s1
    800059a8:	003c1c13          	slli	s8,s8,0x3
    800059ac:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    800059b0:	ffffd097          	auipc	ra,0xffffd
    800059b4:	1c8080e7          	jalr	456(ra) # 80002b78 <_ZN6ThreadC1Ev>
    800059b8:	00007797          	auipc	a5,0x7
    800059bc:	29078793          	addi	a5,a5,656 # 8000cc48 <_ZTV16ProducerKeyboard+0x10>
    800059c0:	00fcb023          	sd	a5,0(s9)
    800059c4:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    800059c8:	00349793          	slli	a5,s1,0x3
    800059cc:	00f987b3          	add	a5,s3,a5
    800059d0:	0197b023          	sd	s9,0(a5)
    800059d4:	f4dff06f          	j	80005920 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    800059d8:	ffffd097          	auipc	ra,0xffffd
    800059dc:	0e4080e7          	jalr	228(ra) # 80002abc <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800059e0:	00000493          	li	s1,0
    800059e4:	00994e63          	blt	s2,s1,80005a00 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    800059e8:	00007517          	auipc	a0,0x7
    800059ec:	50053503          	ld	a0,1280(a0) # 8000cee8 <_ZL10waitForAll>
    800059f0:	ffffd097          	auipc	ra,0xffffd
    800059f4:	23c080e7          	jalr	572(ra) # 80002c2c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800059f8:	0014849b          	addiw	s1,s1,1
    800059fc:	fe9ff06f          	j	800059e4 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005a00:	00000493          	li	s1,0
    80005a04:	0080006f          	j	80005a0c <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005a08:	0014849b          	addiw	s1,s1,1
    80005a0c:	0324d263          	bge	s1,s2,80005a30 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005a10:	00349793          	slli	a5,s1,0x3
    80005a14:	00f987b3          	add	a5,s3,a5
    80005a18:	0007b503          	ld	a0,0(a5)
    80005a1c:	fe0506e3          	beqz	a0,80005a08 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005a20:	00053783          	ld	a5,0(a0)
    80005a24:	0087b783          	ld	a5,8(a5)
    80005a28:	000780e7          	jalr	a5
    80005a2c:	fddff06f          	j	80005a08 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005a30:	000b0a63          	beqz	s6,80005a44 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005a34:	000b3783          	ld	a5,0(s6)
    80005a38:	0087b783          	ld	a5,8(a5)
    80005a3c:	000b0513          	mv	a0,s6
    80005a40:	000780e7          	jalr	a5
    delete waitForAll;
    80005a44:	00007517          	auipc	a0,0x7
    80005a48:	4a453503          	ld	a0,1188(a0) # 8000cee8 <_ZL10waitForAll>
    80005a4c:	00050863          	beqz	a0,80005a5c <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005a50:	00053783          	ld	a5,0(a0)
    80005a54:	0087b783          	ld	a5,8(a5)
    80005a58:	000780e7          	jalr	a5
    delete buffer;
    80005a5c:	000a8e63          	beqz	s5,80005a78 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005a60:	000a8513          	mv	a0,s5
    80005a64:	00001097          	auipc	ra,0x1
    80005a68:	8a8080e7          	jalr	-1880(ra) # 8000630c <_ZN9BufferCPPD1Ev>
    80005a6c:	000a8513          	mv	a0,s5
    80005a70:	ffffd097          	auipc	ra,0xffffd
    80005a74:	e80080e7          	jalr	-384(ra) # 800028f0 <_ZdlPv>
    80005a78:	000b8113          	mv	sp,s7

}
    80005a7c:	f8040113          	addi	sp,s0,-128
    80005a80:	07813083          	ld	ra,120(sp)
    80005a84:	07013403          	ld	s0,112(sp)
    80005a88:	06813483          	ld	s1,104(sp)
    80005a8c:	06013903          	ld	s2,96(sp)
    80005a90:	05813983          	ld	s3,88(sp)
    80005a94:	05013a03          	ld	s4,80(sp)
    80005a98:	04813a83          	ld	s5,72(sp)
    80005a9c:	04013b03          	ld	s6,64(sp)
    80005aa0:	03813b83          	ld	s7,56(sp)
    80005aa4:	03013c03          	ld	s8,48(sp)
    80005aa8:	02813c83          	ld	s9,40(sp)
    80005aac:	08010113          	addi	sp,sp,128
    80005ab0:	00008067          	ret
    80005ab4:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005ab8:	000a8513          	mv	a0,s5
    80005abc:	ffffd097          	auipc	ra,0xffffd
    80005ac0:	e34080e7          	jalr	-460(ra) # 800028f0 <_ZdlPv>
    80005ac4:	00048513          	mv	a0,s1
    80005ac8:	00008097          	auipc	ra,0x8
    80005acc:	520080e7          	jalr	1312(ra) # 8000dfe8 <_Unwind_Resume>
    80005ad0:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005ad4:	00048513          	mv	a0,s1
    80005ad8:	ffffd097          	auipc	ra,0xffffd
    80005adc:	e18080e7          	jalr	-488(ra) # 800028f0 <_ZdlPv>
    80005ae0:	00090513          	mv	a0,s2
    80005ae4:	00008097          	auipc	ra,0x8
    80005ae8:	504080e7          	jalr	1284(ra) # 8000dfe8 <_Unwind_Resume>
    80005aec:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005af0:	000b0513          	mv	a0,s6
    80005af4:	ffffd097          	auipc	ra,0xffffd
    80005af8:	dfc080e7          	jalr	-516(ra) # 800028f0 <_ZdlPv>
    80005afc:	00048513          	mv	a0,s1
    80005b00:	00008097          	auipc	ra,0x8
    80005b04:	4e8080e7          	jalr	1256(ra) # 8000dfe8 <_Unwind_Resume>
    80005b08:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005b0c:	000c8513          	mv	a0,s9
    80005b10:	ffffd097          	auipc	ra,0xffffd
    80005b14:	de0080e7          	jalr	-544(ra) # 800028f0 <_ZdlPv>
    80005b18:	00048513          	mv	a0,s1
    80005b1c:	00008097          	auipc	ra,0x8
    80005b20:	4cc080e7          	jalr	1228(ra) # 8000dfe8 <_Unwind_Resume>
    80005b24:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005b28:	000c8513          	mv	a0,s9
    80005b2c:	ffffd097          	auipc	ra,0xffffd
    80005b30:	dc4080e7          	jalr	-572(ra) # 800028f0 <_ZdlPv>
    80005b34:	00048513          	mv	a0,s1
    80005b38:	00008097          	auipc	ra,0x8
    80005b3c:	4b0080e7          	jalr	1200(ra) # 8000dfe8 <_Unwind_Resume>

0000000080005b40 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005b40:	ff010113          	addi	sp,sp,-16
    80005b44:	00113423          	sd	ra,8(sp)
    80005b48:	00813023          	sd	s0,0(sp)
    80005b4c:	01010413          	addi	s0,sp,16
    80005b50:	00007797          	auipc	a5,0x7
    80005b54:	14878793          	addi	a5,a5,328 # 8000cc98 <_ZTV12ConsumerSync+0x10>
    80005b58:	00f53023          	sd	a5,0(a0)
    80005b5c:	ffffd097          	auipc	ra,0xffffd
    80005b60:	c54080e7          	jalr	-940(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80005b64:	00813083          	ld	ra,8(sp)
    80005b68:	00013403          	ld	s0,0(sp)
    80005b6c:	01010113          	addi	sp,sp,16
    80005b70:	00008067          	ret

0000000080005b74 <_ZN12ConsumerSyncD0Ev>:
    80005b74:	fe010113          	addi	sp,sp,-32
    80005b78:	00113c23          	sd	ra,24(sp)
    80005b7c:	00813823          	sd	s0,16(sp)
    80005b80:	00913423          	sd	s1,8(sp)
    80005b84:	02010413          	addi	s0,sp,32
    80005b88:	00050493          	mv	s1,a0
    80005b8c:	00007797          	auipc	a5,0x7
    80005b90:	10c78793          	addi	a5,a5,268 # 8000cc98 <_ZTV12ConsumerSync+0x10>
    80005b94:	00f53023          	sd	a5,0(a0)
    80005b98:	ffffd097          	auipc	ra,0xffffd
    80005b9c:	c18080e7          	jalr	-1000(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80005ba0:	00048513          	mv	a0,s1
    80005ba4:	ffffd097          	auipc	ra,0xffffd
    80005ba8:	d4c080e7          	jalr	-692(ra) # 800028f0 <_ZdlPv>
    80005bac:	01813083          	ld	ra,24(sp)
    80005bb0:	01013403          	ld	s0,16(sp)
    80005bb4:	00813483          	ld	s1,8(sp)
    80005bb8:	02010113          	addi	sp,sp,32
    80005bbc:	00008067          	ret

0000000080005bc0 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005bc0:	ff010113          	addi	sp,sp,-16
    80005bc4:	00113423          	sd	ra,8(sp)
    80005bc8:	00813023          	sd	s0,0(sp)
    80005bcc:	01010413          	addi	s0,sp,16
    80005bd0:	00007797          	auipc	a5,0x7
    80005bd4:	0a078793          	addi	a5,a5,160 # 8000cc70 <_ZTV12ProducerSync+0x10>
    80005bd8:	00f53023          	sd	a5,0(a0)
    80005bdc:	ffffd097          	auipc	ra,0xffffd
    80005be0:	bd4080e7          	jalr	-1068(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80005be4:	00813083          	ld	ra,8(sp)
    80005be8:	00013403          	ld	s0,0(sp)
    80005bec:	01010113          	addi	sp,sp,16
    80005bf0:	00008067          	ret

0000000080005bf4 <_ZN12ProducerSyncD0Ev>:
    80005bf4:	fe010113          	addi	sp,sp,-32
    80005bf8:	00113c23          	sd	ra,24(sp)
    80005bfc:	00813823          	sd	s0,16(sp)
    80005c00:	00913423          	sd	s1,8(sp)
    80005c04:	02010413          	addi	s0,sp,32
    80005c08:	00050493          	mv	s1,a0
    80005c0c:	00007797          	auipc	a5,0x7
    80005c10:	06478793          	addi	a5,a5,100 # 8000cc70 <_ZTV12ProducerSync+0x10>
    80005c14:	00f53023          	sd	a5,0(a0)
    80005c18:	ffffd097          	auipc	ra,0xffffd
    80005c1c:	b98080e7          	jalr	-1128(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80005c20:	00048513          	mv	a0,s1
    80005c24:	ffffd097          	auipc	ra,0xffffd
    80005c28:	ccc080e7          	jalr	-820(ra) # 800028f0 <_ZdlPv>
    80005c2c:	01813083          	ld	ra,24(sp)
    80005c30:	01013403          	ld	s0,16(sp)
    80005c34:	00813483          	ld	s1,8(sp)
    80005c38:	02010113          	addi	sp,sp,32
    80005c3c:	00008067          	ret

0000000080005c40 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005c40:	ff010113          	addi	sp,sp,-16
    80005c44:	00113423          	sd	ra,8(sp)
    80005c48:	00813023          	sd	s0,0(sp)
    80005c4c:	01010413          	addi	s0,sp,16
    80005c50:	00007797          	auipc	a5,0x7
    80005c54:	ff878793          	addi	a5,a5,-8 # 8000cc48 <_ZTV16ProducerKeyboard+0x10>
    80005c58:	00f53023          	sd	a5,0(a0)
    80005c5c:	ffffd097          	auipc	ra,0xffffd
    80005c60:	b54080e7          	jalr	-1196(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80005c64:	00813083          	ld	ra,8(sp)
    80005c68:	00013403          	ld	s0,0(sp)
    80005c6c:	01010113          	addi	sp,sp,16
    80005c70:	00008067          	ret

0000000080005c74 <_ZN16ProducerKeyboardD0Ev>:
    80005c74:	fe010113          	addi	sp,sp,-32
    80005c78:	00113c23          	sd	ra,24(sp)
    80005c7c:	00813823          	sd	s0,16(sp)
    80005c80:	00913423          	sd	s1,8(sp)
    80005c84:	02010413          	addi	s0,sp,32
    80005c88:	00050493          	mv	s1,a0
    80005c8c:	00007797          	auipc	a5,0x7
    80005c90:	fbc78793          	addi	a5,a5,-68 # 8000cc48 <_ZTV16ProducerKeyboard+0x10>
    80005c94:	00f53023          	sd	a5,0(a0)
    80005c98:	ffffd097          	auipc	ra,0xffffd
    80005c9c:	b18080e7          	jalr	-1256(ra) # 800027b0 <_ZN6ThreadD1Ev>
    80005ca0:	00048513          	mv	a0,s1
    80005ca4:	ffffd097          	auipc	ra,0xffffd
    80005ca8:	c4c080e7          	jalr	-948(ra) # 800028f0 <_ZdlPv>
    80005cac:	01813083          	ld	ra,24(sp)
    80005cb0:	01013403          	ld	s0,16(sp)
    80005cb4:	00813483          	ld	s1,8(sp)
    80005cb8:	02010113          	addi	sp,sp,32
    80005cbc:	00008067          	ret

0000000080005cc0 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005cc0:	ff010113          	addi	sp,sp,-16
    80005cc4:	00113423          	sd	ra,8(sp)
    80005cc8:	00813023          	sd	s0,0(sp)
    80005ccc:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005cd0:	02053583          	ld	a1,32(a0)
    80005cd4:	fffff097          	auipc	ra,0xfffff
    80005cd8:	7e4080e7          	jalr	2020(ra) # 800054b8 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005cdc:	00813083          	ld	ra,8(sp)
    80005ce0:	00013403          	ld	s0,0(sp)
    80005ce4:	01010113          	addi	sp,sp,16
    80005ce8:	00008067          	ret

0000000080005cec <_ZN12ProducerSync3runEv>:
    void run() override {
    80005cec:	ff010113          	addi	sp,sp,-16
    80005cf0:	00113423          	sd	ra,8(sp)
    80005cf4:	00813023          	sd	s0,0(sp)
    80005cf8:	01010413          	addi	s0,sp,16
        producer(td);
    80005cfc:	02053583          	ld	a1,32(a0)
    80005d00:	00000097          	auipc	ra,0x0
    80005d04:	878080e7          	jalr	-1928(ra) # 80005578 <_ZN12ProducerSync8producerEPv>
    }
    80005d08:	00813083          	ld	ra,8(sp)
    80005d0c:	00013403          	ld	s0,0(sp)
    80005d10:	01010113          	addi	sp,sp,16
    80005d14:	00008067          	ret

0000000080005d18 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005d18:	ff010113          	addi	sp,sp,-16
    80005d1c:	00113423          	sd	ra,8(sp)
    80005d20:	00813023          	sd	s0,0(sp)
    80005d24:	01010413          	addi	s0,sp,16
        consumer(td);
    80005d28:	02053583          	ld	a1,32(a0)
    80005d2c:	00000097          	auipc	ra,0x0
    80005d30:	8e0080e7          	jalr	-1824(ra) # 8000560c <_ZN12ConsumerSync8consumerEPv>
    }
    80005d34:	00813083          	ld	ra,8(sp)
    80005d38:	00013403          	ld	s0,0(sp)
    80005d3c:	01010113          	addi	sp,sp,16
    80005d40:	00008067          	ret

0000000080005d44 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005d44:	fe010113          	addi	sp,sp,-32
    80005d48:	00113c23          	sd	ra,24(sp)
    80005d4c:	00813823          	sd	s0,16(sp)
    80005d50:	00913423          	sd	s1,8(sp)
    80005d54:	02010413          	addi	s0,sp,32
    80005d58:	00050493          	mv	s1,a0
    LOCK();
    80005d5c:	00100613          	li	a2,1
    80005d60:	00000593          	li	a1,0
    80005d64:	00007517          	auipc	a0,0x7
    80005d68:	18c50513          	addi	a0,a0,396 # 8000cef0 <lockPrint>
    80005d6c:	ffffb097          	auipc	ra,0xffffb
    80005d70:	3b8080e7          	jalr	952(ra) # 80001124 <copy_and_swap>
    80005d74:	00050863          	beqz	a0,80005d84 <_Z11printStringPKc+0x40>
    80005d78:	ffffb097          	auipc	ra,0xffffb
    80005d7c:	6bc080e7          	jalr	1724(ra) # 80001434 <_Z15thread_dispatchv>
    80005d80:	fddff06f          	j	80005d5c <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005d84:	0004c503          	lbu	a0,0(s1)
    80005d88:	00050a63          	beqz	a0,80005d9c <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005d8c:	ffffc097          	auipc	ra,0xffffc
    80005d90:	810080e7          	jalr	-2032(ra) # 8000159c <_Z4putcc>
        string++;
    80005d94:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005d98:	fedff06f          	j	80005d84 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005d9c:	00000613          	li	a2,0
    80005da0:	00100593          	li	a1,1
    80005da4:	00007517          	auipc	a0,0x7
    80005da8:	14c50513          	addi	a0,a0,332 # 8000cef0 <lockPrint>
    80005dac:	ffffb097          	auipc	ra,0xffffb
    80005db0:	378080e7          	jalr	888(ra) # 80001124 <copy_and_swap>
    80005db4:	fe0514e3          	bnez	a0,80005d9c <_Z11printStringPKc+0x58>
}
    80005db8:	01813083          	ld	ra,24(sp)
    80005dbc:	01013403          	ld	s0,16(sp)
    80005dc0:	00813483          	ld	s1,8(sp)
    80005dc4:	02010113          	addi	sp,sp,32
    80005dc8:	00008067          	ret

0000000080005dcc <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005dcc:	fd010113          	addi	sp,sp,-48
    80005dd0:	02113423          	sd	ra,40(sp)
    80005dd4:	02813023          	sd	s0,32(sp)
    80005dd8:	00913c23          	sd	s1,24(sp)
    80005ddc:	01213823          	sd	s2,16(sp)
    80005de0:	01313423          	sd	s3,8(sp)
    80005de4:	01413023          	sd	s4,0(sp)
    80005de8:	03010413          	addi	s0,sp,48
    80005dec:	00050993          	mv	s3,a0
    80005df0:	00058a13          	mv	s4,a1
    LOCK();
    80005df4:	00100613          	li	a2,1
    80005df8:	00000593          	li	a1,0
    80005dfc:	00007517          	auipc	a0,0x7
    80005e00:	0f450513          	addi	a0,a0,244 # 8000cef0 <lockPrint>
    80005e04:	ffffb097          	auipc	ra,0xffffb
    80005e08:	320080e7          	jalr	800(ra) # 80001124 <copy_and_swap>
    80005e0c:	00050863          	beqz	a0,80005e1c <_Z9getStringPci+0x50>
    80005e10:	ffffb097          	auipc	ra,0xffffb
    80005e14:	624080e7          	jalr	1572(ra) # 80001434 <_Z15thread_dispatchv>
    80005e18:	fddff06f          	j	80005df4 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005e1c:	00000913          	li	s2,0
    80005e20:	00090493          	mv	s1,s2
    80005e24:	0019091b          	addiw	s2,s2,1
    80005e28:	03495a63          	bge	s2,s4,80005e5c <_Z9getStringPci+0x90>
        cc = getc();
    80005e2c:	ffffb097          	auipc	ra,0xffffb
    80005e30:	748080e7          	jalr	1864(ra) # 80001574 <_Z4getcv>
        if(cc < 1)
    80005e34:	02050463          	beqz	a0,80005e5c <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005e38:	009984b3          	add	s1,s3,s1
    80005e3c:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005e40:	00a00793          	li	a5,10
    80005e44:	00f50a63          	beq	a0,a5,80005e58 <_Z9getStringPci+0x8c>
    80005e48:	00d00793          	li	a5,13
    80005e4c:	fcf51ae3          	bne	a0,a5,80005e20 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005e50:	00090493          	mv	s1,s2
    80005e54:	0080006f          	j	80005e5c <_Z9getStringPci+0x90>
    80005e58:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005e5c:	009984b3          	add	s1,s3,s1
    80005e60:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005e64:	00000613          	li	a2,0
    80005e68:	00100593          	li	a1,1
    80005e6c:	00007517          	auipc	a0,0x7
    80005e70:	08450513          	addi	a0,a0,132 # 8000cef0 <lockPrint>
    80005e74:	ffffb097          	auipc	ra,0xffffb
    80005e78:	2b0080e7          	jalr	688(ra) # 80001124 <copy_and_swap>
    80005e7c:	fe0514e3          	bnez	a0,80005e64 <_Z9getStringPci+0x98>
    return buf;
}
    80005e80:	00098513          	mv	a0,s3
    80005e84:	02813083          	ld	ra,40(sp)
    80005e88:	02013403          	ld	s0,32(sp)
    80005e8c:	01813483          	ld	s1,24(sp)
    80005e90:	01013903          	ld	s2,16(sp)
    80005e94:	00813983          	ld	s3,8(sp)
    80005e98:	00013a03          	ld	s4,0(sp)
    80005e9c:	03010113          	addi	sp,sp,48
    80005ea0:	00008067          	ret

0000000080005ea4 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005ea4:	ff010113          	addi	sp,sp,-16
    80005ea8:	00813423          	sd	s0,8(sp)
    80005eac:	01010413          	addi	s0,sp,16
    80005eb0:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005eb4:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005eb8:	0006c603          	lbu	a2,0(a3)
    80005ebc:	fd06071b          	addiw	a4,a2,-48
    80005ec0:	0ff77713          	andi	a4,a4,255
    80005ec4:	00900793          	li	a5,9
    80005ec8:	02e7e063          	bltu	a5,a4,80005ee8 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005ecc:	0025179b          	slliw	a5,a0,0x2
    80005ed0:	00a787bb          	addw	a5,a5,a0
    80005ed4:	0017979b          	slliw	a5,a5,0x1
    80005ed8:	00168693          	addi	a3,a3,1
    80005edc:	00c787bb          	addw	a5,a5,a2
    80005ee0:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005ee4:	fd5ff06f          	j	80005eb8 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005ee8:	00813403          	ld	s0,8(sp)
    80005eec:	01010113          	addi	sp,sp,16
    80005ef0:	00008067          	ret

0000000080005ef4 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005ef4:	fc010113          	addi	sp,sp,-64
    80005ef8:	02113c23          	sd	ra,56(sp)
    80005efc:	02813823          	sd	s0,48(sp)
    80005f00:	02913423          	sd	s1,40(sp)
    80005f04:	03213023          	sd	s2,32(sp)
    80005f08:	01313c23          	sd	s3,24(sp)
    80005f0c:	04010413          	addi	s0,sp,64
    80005f10:	00050493          	mv	s1,a0
    80005f14:	00058913          	mv	s2,a1
    80005f18:	00060993          	mv	s3,a2
    LOCK();
    80005f1c:	00100613          	li	a2,1
    80005f20:	00000593          	li	a1,0
    80005f24:	00007517          	auipc	a0,0x7
    80005f28:	fcc50513          	addi	a0,a0,-52 # 8000cef0 <lockPrint>
    80005f2c:	ffffb097          	auipc	ra,0xffffb
    80005f30:	1f8080e7          	jalr	504(ra) # 80001124 <copy_and_swap>
    80005f34:	00050863          	beqz	a0,80005f44 <_Z8printIntiii+0x50>
    80005f38:	ffffb097          	auipc	ra,0xffffb
    80005f3c:	4fc080e7          	jalr	1276(ra) # 80001434 <_Z15thread_dispatchv>
    80005f40:	fddff06f          	j	80005f1c <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005f44:	00098463          	beqz	s3,80005f4c <_Z8printIntiii+0x58>
    80005f48:	0804c463          	bltz	s1,80005fd0 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005f4c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005f50:	00000593          	li	a1,0
    }

    i = 0;
    80005f54:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005f58:	0009079b          	sext.w	a5,s2
    80005f5c:	0325773b          	remuw	a4,a0,s2
    80005f60:	00048613          	mv	a2,s1
    80005f64:	0014849b          	addiw	s1,s1,1
    80005f68:	02071693          	slli	a3,a4,0x20
    80005f6c:	0206d693          	srli	a3,a3,0x20
    80005f70:	00007717          	auipc	a4,0x7
    80005f74:	d4070713          	addi	a4,a4,-704 # 8000ccb0 <digits>
    80005f78:	00d70733          	add	a4,a4,a3
    80005f7c:	00074683          	lbu	a3,0(a4)
    80005f80:	fd040713          	addi	a4,s0,-48
    80005f84:	00c70733          	add	a4,a4,a2
    80005f88:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005f8c:	0005071b          	sext.w	a4,a0
    80005f90:	0325553b          	divuw	a0,a0,s2
    80005f94:	fcf772e3          	bgeu	a4,a5,80005f58 <_Z8printIntiii+0x64>
    if(neg)
    80005f98:	00058c63          	beqz	a1,80005fb0 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005f9c:	fd040793          	addi	a5,s0,-48
    80005fa0:	009784b3          	add	s1,a5,s1
    80005fa4:	02d00793          	li	a5,45
    80005fa8:	fef48823          	sb	a5,-16(s1)
    80005fac:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005fb0:	fff4849b          	addiw	s1,s1,-1
    80005fb4:	0204c463          	bltz	s1,80005fdc <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005fb8:	fd040793          	addi	a5,s0,-48
    80005fbc:	009787b3          	add	a5,a5,s1
    80005fc0:	ff07c503          	lbu	a0,-16(a5)
    80005fc4:	ffffb097          	auipc	ra,0xffffb
    80005fc8:	5d8080e7          	jalr	1496(ra) # 8000159c <_Z4putcc>
    80005fcc:	fe5ff06f          	j	80005fb0 <_Z8printIntiii+0xbc>
        x = -xx;
    80005fd0:	4090053b          	negw	a0,s1
        neg = 1;
    80005fd4:	00100593          	li	a1,1
        x = -xx;
    80005fd8:	f7dff06f          	j	80005f54 <_Z8printIntiii+0x60>

    UNLOCK();
    80005fdc:	00000613          	li	a2,0
    80005fe0:	00100593          	li	a1,1
    80005fe4:	00007517          	auipc	a0,0x7
    80005fe8:	f0c50513          	addi	a0,a0,-244 # 8000cef0 <lockPrint>
    80005fec:	ffffb097          	auipc	ra,0xffffb
    80005ff0:	138080e7          	jalr	312(ra) # 80001124 <copy_and_swap>
    80005ff4:	fe0514e3          	bnez	a0,80005fdc <_Z8printIntiii+0xe8>
    80005ff8:	03813083          	ld	ra,56(sp)
    80005ffc:	03013403          	ld	s0,48(sp)
    80006000:	02813483          	ld	s1,40(sp)
    80006004:	02013903          	ld	s2,32(sp)
    80006008:	01813983          	ld	s3,24(sp)
    8000600c:	04010113          	addi	sp,sp,64
    80006010:	00008067          	ret

0000000080006014 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006014:	fd010113          	addi	sp,sp,-48
    80006018:	02113423          	sd	ra,40(sp)
    8000601c:	02813023          	sd	s0,32(sp)
    80006020:	00913c23          	sd	s1,24(sp)
    80006024:	01213823          	sd	s2,16(sp)
    80006028:	01313423          	sd	s3,8(sp)
    8000602c:	03010413          	addi	s0,sp,48
    80006030:	00050493          	mv	s1,a0
    80006034:	00058913          	mv	s2,a1
    80006038:	0015879b          	addiw	a5,a1,1
    8000603c:	0007851b          	sext.w	a0,a5
    80006040:	00f4a023          	sw	a5,0(s1)
    80006044:	0004a823          	sw	zero,16(s1)
    80006048:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000604c:	00251513          	slli	a0,a0,0x2
    80006050:	ffffb097          	auipc	ra,0xffffb
    80006054:	2b8080e7          	jalr	696(ra) # 80001308 <_Z9mem_allocm>
    80006058:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    8000605c:	01000513          	li	a0,16
    80006060:	ffffd097          	auipc	ra,0xffffd
    80006064:	840080e7          	jalr	-1984(ra) # 800028a0 <_Znwm>
    80006068:	00050993          	mv	s3,a0
    8000606c:	00000593          	li	a1,0
    80006070:	ffffd097          	auipc	ra,0xffffd
    80006074:	b84080e7          	jalr	-1148(ra) # 80002bf4 <_ZN9SemaphoreC1Ej>
    80006078:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    8000607c:	01000513          	li	a0,16
    80006080:	ffffd097          	auipc	ra,0xffffd
    80006084:	820080e7          	jalr	-2016(ra) # 800028a0 <_Znwm>
    80006088:	00050993          	mv	s3,a0
    8000608c:	00090593          	mv	a1,s2
    80006090:	ffffd097          	auipc	ra,0xffffd
    80006094:	b64080e7          	jalr	-1180(ra) # 80002bf4 <_ZN9SemaphoreC1Ej>
    80006098:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    8000609c:	01000513          	li	a0,16
    800060a0:	ffffd097          	auipc	ra,0xffffd
    800060a4:	800080e7          	jalr	-2048(ra) # 800028a0 <_Znwm>
    800060a8:	00050913          	mv	s2,a0
    800060ac:	00100593          	li	a1,1
    800060b0:	ffffd097          	auipc	ra,0xffffd
    800060b4:	b44080e7          	jalr	-1212(ra) # 80002bf4 <_ZN9SemaphoreC1Ej>
    800060b8:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800060bc:	01000513          	li	a0,16
    800060c0:	ffffc097          	auipc	ra,0xffffc
    800060c4:	7e0080e7          	jalr	2016(ra) # 800028a0 <_Znwm>
    800060c8:	00050913          	mv	s2,a0
    800060cc:	00100593          	li	a1,1
    800060d0:	ffffd097          	auipc	ra,0xffffd
    800060d4:	b24080e7          	jalr	-1244(ra) # 80002bf4 <_ZN9SemaphoreC1Ej>
    800060d8:	0324b823          	sd	s2,48(s1)
}
    800060dc:	02813083          	ld	ra,40(sp)
    800060e0:	02013403          	ld	s0,32(sp)
    800060e4:	01813483          	ld	s1,24(sp)
    800060e8:	01013903          	ld	s2,16(sp)
    800060ec:	00813983          	ld	s3,8(sp)
    800060f0:	03010113          	addi	sp,sp,48
    800060f4:	00008067          	ret
    800060f8:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    800060fc:	00098513          	mv	a0,s3
    80006100:	ffffc097          	auipc	ra,0xffffc
    80006104:	7f0080e7          	jalr	2032(ra) # 800028f0 <_ZdlPv>
    80006108:	00048513          	mv	a0,s1
    8000610c:	00008097          	auipc	ra,0x8
    80006110:	edc080e7          	jalr	-292(ra) # 8000dfe8 <_Unwind_Resume>
    80006114:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006118:	00098513          	mv	a0,s3
    8000611c:	ffffc097          	auipc	ra,0xffffc
    80006120:	7d4080e7          	jalr	2004(ra) # 800028f0 <_ZdlPv>
    80006124:	00048513          	mv	a0,s1
    80006128:	00008097          	auipc	ra,0x8
    8000612c:	ec0080e7          	jalr	-320(ra) # 8000dfe8 <_Unwind_Resume>
    80006130:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006134:	00090513          	mv	a0,s2
    80006138:	ffffc097          	auipc	ra,0xffffc
    8000613c:	7b8080e7          	jalr	1976(ra) # 800028f0 <_ZdlPv>
    80006140:	00048513          	mv	a0,s1
    80006144:	00008097          	auipc	ra,0x8
    80006148:	ea4080e7          	jalr	-348(ra) # 8000dfe8 <_Unwind_Resume>
    8000614c:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006150:	00090513          	mv	a0,s2
    80006154:	ffffc097          	auipc	ra,0xffffc
    80006158:	79c080e7          	jalr	1948(ra) # 800028f0 <_ZdlPv>
    8000615c:	00048513          	mv	a0,s1
    80006160:	00008097          	auipc	ra,0x8
    80006164:	e88080e7          	jalr	-376(ra) # 8000dfe8 <_Unwind_Resume>

0000000080006168 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80006168:	fe010113          	addi	sp,sp,-32
    8000616c:	00113c23          	sd	ra,24(sp)
    80006170:	00813823          	sd	s0,16(sp)
    80006174:	00913423          	sd	s1,8(sp)
    80006178:	01213023          	sd	s2,0(sp)
    8000617c:	02010413          	addi	s0,sp,32
    80006180:	00050493          	mv	s1,a0
    80006184:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80006188:	01853503          	ld	a0,24(a0)
    8000618c:	ffffd097          	auipc	ra,0xffffd
    80006190:	aa0080e7          	jalr	-1376(ra) # 80002c2c <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80006194:	0304b503          	ld	a0,48(s1)
    80006198:	ffffd097          	auipc	ra,0xffffd
    8000619c:	a94080e7          	jalr	-1388(ra) # 80002c2c <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800061a0:	0084b783          	ld	a5,8(s1)
    800061a4:	0144a703          	lw	a4,20(s1)
    800061a8:	00271713          	slli	a4,a4,0x2
    800061ac:	00e787b3          	add	a5,a5,a4
    800061b0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800061b4:	0144a783          	lw	a5,20(s1)
    800061b8:	0017879b          	addiw	a5,a5,1
    800061bc:	0004a703          	lw	a4,0(s1)
    800061c0:	02e7e7bb          	remw	a5,a5,a4
    800061c4:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    800061c8:	0304b503          	ld	a0,48(s1)
    800061cc:	ffffd097          	auipc	ra,0xffffd
    800061d0:	a8c080e7          	jalr	-1396(ra) # 80002c58 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    800061d4:	0204b503          	ld	a0,32(s1)
    800061d8:	ffffd097          	auipc	ra,0xffffd
    800061dc:	a80080e7          	jalr	-1408(ra) # 80002c58 <_ZN9Semaphore6signalEv>

}
    800061e0:	01813083          	ld	ra,24(sp)
    800061e4:	01013403          	ld	s0,16(sp)
    800061e8:	00813483          	ld	s1,8(sp)
    800061ec:	00013903          	ld	s2,0(sp)
    800061f0:	02010113          	addi	sp,sp,32
    800061f4:	00008067          	ret

00000000800061f8 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    800061f8:	fe010113          	addi	sp,sp,-32
    800061fc:	00113c23          	sd	ra,24(sp)
    80006200:	00813823          	sd	s0,16(sp)
    80006204:	00913423          	sd	s1,8(sp)
    80006208:	01213023          	sd	s2,0(sp)
    8000620c:	02010413          	addi	s0,sp,32
    80006210:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006214:	02053503          	ld	a0,32(a0)
    80006218:	ffffd097          	auipc	ra,0xffffd
    8000621c:	a14080e7          	jalr	-1516(ra) # 80002c2c <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006220:	0284b503          	ld	a0,40(s1)
    80006224:	ffffd097          	auipc	ra,0xffffd
    80006228:	a08080e7          	jalr	-1528(ra) # 80002c2c <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    8000622c:	0084b703          	ld	a4,8(s1)
    80006230:	0104a783          	lw	a5,16(s1)
    80006234:	00279693          	slli	a3,a5,0x2
    80006238:	00d70733          	add	a4,a4,a3
    8000623c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006240:	0017879b          	addiw	a5,a5,1
    80006244:	0004a703          	lw	a4,0(s1)
    80006248:	02e7e7bb          	remw	a5,a5,a4
    8000624c:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006250:	0284b503          	ld	a0,40(s1)
    80006254:	ffffd097          	auipc	ra,0xffffd
    80006258:	a04080e7          	jalr	-1532(ra) # 80002c58 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    8000625c:	0184b503          	ld	a0,24(s1)
    80006260:	ffffd097          	auipc	ra,0xffffd
    80006264:	9f8080e7          	jalr	-1544(ra) # 80002c58 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006268:	00090513          	mv	a0,s2
    8000626c:	01813083          	ld	ra,24(sp)
    80006270:	01013403          	ld	s0,16(sp)
    80006274:	00813483          	ld	s1,8(sp)
    80006278:	00013903          	ld	s2,0(sp)
    8000627c:	02010113          	addi	sp,sp,32
    80006280:	00008067          	ret

0000000080006284 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006284:	fe010113          	addi	sp,sp,-32
    80006288:	00113c23          	sd	ra,24(sp)
    8000628c:	00813823          	sd	s0,16(sp)
    80006290:	00913423          	sd	s1,8(sp)
    80006294:	01213023          	sd	s2,0(sp)
    80006298:	02010413          	addi	s0,sp,32
    8000629c:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800062a0:	02853503          	ld	a0,40(a0)
    800062a4:	ffffd097          	auipc	ra,0xffffd
    800062a8:	988080e7          	jalr	-1656(ra) # 80002c2c <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800062ac:	0304b503          	ld	a0,48(s1)
    800062b0:	ffffd097          	auipc	ra,0xffffd
    800062b4:	97c080e7          	jalr	-1668(ra) # 80002c2c <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800062b8:	0144a783          	lw	a5,20(s1)
    800062bc:	0104a903          	lw	s2,16(s1)
    800062c0:	0327ce63          	blt	a5,s2,800062fc <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    800062c4:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    800062c8:	0304b503          	ld	a0,48(s1)
    800062cc:	ffffd097          	auipc	ra,0xffffd
    800062d0:	98c080e7          	jalr	-1652(ra) # 80002c58 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    800062d4:	0284b503          	ld	a0,40(s1)
    800062d8:	ffffd097          	auipc	ra,0xffffd
    800062dc:	980080e7          	jalr	-1664(ra) # 80002c58 <_ZN9Semaphore6signalEv>

    return ret;
}
    800062e0:	00090513          	mv	a0,s2
    800062e4:	01813083          	ld	ra,24(sp)
    800062e8:	01013403          	ld	s0,16(sp)
    800062ec:	00813483          	ld	s1,8(sp)
    800062f0:	00013903          	ld	s2,0(sp)
    800062f4:	02010113          	addi	sp,sp,32
    800062f8:	00008067          	ret
        ret = cap - head + tail;
    800062fc:	0004a703          	lw	a4,0(s1)
    80006300:	4127093b          	subw	s2,a4,s2
    80006304:	00f9093b          	addw	s2,s2,a5
    80006308:	fc1ff06f          	j	800062c8 <_ZN9BufferCPP6getCntEv+0x44>

000000008000630c <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    8000630c:	fe010113          	addi	sp,sp,-32
    80006310:	00113c23          	sd	ra,24(sp)
    80006314:	00813823          	sd	s0,16(sp)
    80006318:	00913423          	sd	s1,8(sp)
    8000631c:	02010413          	addi	s0,sp,32
    80006320:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006324:	00a00513          	li	a0,10
    80006328:	ffffd097          	auipc	ra,0xffffd
    8000632c:	9f4080e7          	jalr	-1548(ra) # 80002d1c <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006330:	00004517          	auipc	a0,0x4
    80006334:	12050513          	addi	a0,a0,288 # 8000a450 <_ZZ9kPrintIntmE6digits+0x3e0>
    80006338:	00000097          	auipc	ra,0x0
    8000633c:	a0c080e7          	jalr	-1524(ra) # 80005d44 <_Z11printStringPKc>
    while (getCnt()) {
    80006340:	00048513          	mv	a0,s1
    80006344:	00000097          	auipc	ra,0x0
    80006348:	f40080e7          	jalr	-192(ra) # 80006284 <_ZN9BufferCPP6getCntEv>
    8000634c:	02050c63          	beqz	a0,80006384 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006350:	0084b783          	ld	a5,8(s1)
    80006354:	0104a703          	lw	a4,16(s1)
    80006358:	00271713          	slli	a4,a4,0x2
    8000635c:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006360:	0007c503          	lbu	a0,0(a5)
    80006364:	ffffd097          	auipc	ra,0xffffd
    80006368:	9b8080e7          	jalr	-1608(ra) # 80002d1c <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    8000636c:	0104a783          	lw	a5,16(s1)
    80006370:	0017879b          	addiw	a5,a5,1
    80006374:	0004a703          	lw	a4,0(s1)
    80006378:	02e7e7bb          	remw	a5,a5,a4
    8000637c:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006380:	fc1ff06f          	j	80006340 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006384:	02100513          	li	a0,33
    80006388:	ffffd097          	auipc	ra,0xffffd
    8000638c:	994080e7          	jalr	-1644(ra) # 80002d1c <_ZN7Console4putcEc>
    Console::putc('\n');
    80006390:	00a00513          	li	a0,10
    80006394:	ffffd097          	auipc	ra,0xffffd
    80006398:	988080e7          	jalr	-1656(ra) # 80002d1c <_ZN7Console4putcEc>
    mem_free(buffer);
    8000639c:	0084b503          	ld	a0,8(s1)
    800063a0:	ffffb097          	auipc	ra,0xffffb
    800063a4:	fa8080e7          	jalr	-88(ra) # 80001348 <_Z8mem_freePv>
    delete itemAvailable;
    800063a8:	0204b503          	ld	a0,32(s1)
    800063ac:	00050863          	beqz	a0,800063bc <_ZN9BufferCPPD1Ev+0xb0>
    800063b0:	00053783          	ld	a5,0(a0)
    800063b4:	0087b783          	ld	a5,8(a5)
    800063b8:	000780e7          	jalr	a5
    delete spaceAvailable;
    800063bc:	0184b503          	ld	a0,24(s1)
    800063c0:	00050863          	beqz	a0,800063d0 <_ZN9BufferCPPD1Ev+0xc4>
    800063c4:	00053783          	ld	a5,0(a0)
    800063c8:	0087b783          	ld	a5,8(a5)
    800063cc:	000780e7          	jalr	a5
    delete mutexTail;
    800063d0:	0304b503          	ld	a0,48(s1)
    800063d4:	00050863          	beqz	a0,800063e4 <_ZN9BufferCPPD1Ev+0xd8>
    800063d8:	00053783          	ld	a5,0(a0)
    800063dc:	0087b783          	ld	a5,8(a5)
    800063e0:	000780e7          	jalr	a5
    delete mutexHead;
    800063e4:	0284b503          	ld	a0,40(s1)
    800063e8:	00050863          	beqz	a0,800063f8 <_ZN9BufferCPPD1Ev+0xec>
    800063ec:	00053783          	ld	a5,0(a0)
    800063f0:	0087b783          	ld	a5,8(a5)
    800063f4:	000780e7          	jalr	a5
}
    800063f8:	01813083          	ld	ra,24(sp)
    800063fc:	01013403          	ld	s0,16(sp)
    80006400:	00813483          	ld	s1,8(sp)
    80006404:	02010113          	addi	sp,sp,32
    80006408:	00008067          	ret

000000008000640c <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    8000640c:	fe010113          	addi	sp,sp,-32
    80006410:	00113c23          	sd	ra,24(sp)
    80006414:	00813823          	sd	s0,16(sp)
    80006418:	00913423          	sd	s1,8(sp)
    8000641c:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80006420:	00004517          	auipc	a0,0x4
    80006424:	04850513          	addi	a0,a0,72 # 8000a468 <_ZZ9kPrintIntmE6digits+0x3f8>
    80006428:	00000097          	auipc	ra,0x0
    8000642c:	91c080e7          	jalr	-1764(ra) # 80005d44 <_Z11printStringPKc>
    int test = getc() - '0';
    80006430:	ffffb097          	auipc	ra,0xffffb
    80006434:	144080e7          	jalr	324(ra) # 80001574 <_Z4getcv>
    80006438:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    8000643c:	ffffb097          	auipc	ra,0xffffb
    80006440:	138080e7          	jalr	312(ra) # 80001574 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006444:	00700793          	li	a5,7
    80006448:	1097e263          	bltu	a5,s1,8000654c <_Z8userMainv+0x140>
    8000644c:	00249493          	slli	s1,s1,0x2
    80006450:	00004717          	auipc	a4,0x4
    80006454:	27070713          	addi	a4,a4,624 # 8000a6c0 <_ZZ9kPrintIntmE6digits+0x650>
    80006458:	00e484b3          	add	s1,s1,a4
    8000645c:	0004a783          	lw	a5,0(s1)
    80006460:	00e787b3          	add	a5,a5,a4
    80006464:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80006468:	fffff097          	auipc	ra,0xfffff
    8000646c:	f54080e7          	jalr	-172(ra) # 800053bc <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006470:	00004517          	auipc	a0,0x4
    80006474:	01850513          	addi	a0,a0,24 # 8000a488 <_ZZ9kPrintIntmE6digits+0x418>
    80006478:	00000097          	auipc	ra,0x0
    8000647c:	8cc080e7          	jalr	-1844(ra) # 80005d44 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006480:	01813083          	ld	ra,24(sp)
    80006484:	01013403          	ld	s0,16(sp)
    80006488:	00813483          	ld	s1,8(sp)
    8000648c:	02010113          	addi	sp,sp,32
    80006490:	00008067          	ret
            Threads_CPP_API_test();
    80006494:	ffffe097          	auipc	ra,0xffffe
    80006498:	e08080e7          	jalr	-504(ra) # 8000429c <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    8000649c:	00004517          	auipc	a0,0x4
    800064a0:	02c50513          	addi	a0,a0,44 # 8000a4c8 <_ZZ9kPrintIntmE6digits+0x458>
    800064a4:	00000097          	auipc	ra,0x0
    800064a8:	8a0080e7          	jalr	-1888(ra) # 80005d44 <_Z11printStringPKc>
            break;
    800064ac:	fd5ff06f          	j	80006480 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    800064b0:	ffffd097          	auipc	ra,0xffffd
    800064b4:	640080e7          	jalr	1600(ra) # 80003af0 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    800064b8:	00004517          	auipc	a0,0x4
    800064bc:	05050513          	addi	a0,a0,80 # 8000a508 <_ZZ9kPrintIntmE6digits+0x498>
    800064c0:	00000097          	auipc	ra,0x0
    800064c4:	884080e7          	jalr	-1916(ra) # 80005d44 <_Z11printStringPKc>
            break;
    800064c8:	fb9ff06f          	j	80006480 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    800064cc:	fffff097          	auipc	ra,0xfffff
    800064d0:	234080e7          	jalr	564(ra) # 80005700 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    800064d4:	00004517          	auipc	a0,0x4
    800064d8:	08450513          	addi	a0,a0,132 # 8000a558 <_ZZ9kPrintIntmE6digits+0x4e8>
    800064dc:	00000097          	auipc	ra,0x0
    800064e0:	868080e7          	jalr	-1944(ra) # 80005d44 <_Z11printStringPKc>
            break;
    800064e4:	f9dff06f          	j	80006480 <_Z8userMainv+0x74>
            testSleeping();
    800064e8:	00000097          	auipc	ra,0x0
    800064ec:	11c080e7          	jalr	284(ra) # 80006604 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    800064f0:	00004517          	auipc	a0,0x4
    800064f4:	0c050513          	addi	a0,a0,192 # 8000a5b0 <_ZZ9kPrintIntmE6digits+0x540>
    800064f8:	00000097          	auipc	ra,0x0
    800064fc:	84c080e7          	jalr	-1972(ra) # 80005d44 <_Z11printStringPKc>
            break;
    80006500:	f81ff06f          	j	80006480 <_Z8userMainv+0x74>
            testConsumerProducer();
    80006504:	ffffe097          	auipc	ra,0xffffe
    80006508:	258080e7          	jalr	600(ra) # 8000475c <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    8000650c:	00004517          	auipc	a0,0x4
    80006510:	0d450513          	addi	a0,a0,212 # 8000a5e0 <_ZZ9kPrintIntmE6digits+0x570>
    80006514:	00000097          	auipc	ra,0x0
    80006518:	830080e7          	jalr	-2000(ra) # 80005d44 <_Z11printStringPKc>
            break;
    8000651c:	f65ff06f          	j	80006480 <_Z8userMainv+0x74>
            System_Mode_test();
    80006520:	00000097          	auipc	ra,0x0
    80006524:	658080e7          	jalr	1624(ra) # 80006b78 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006528:	00004517          	auipc	a0,0x4
    8000652c:	0f850513          	addi	a0,a0,248 # 8000a620 <_ZZ9kPrintIntmE6digits+0x5b0>
    80006530:	00000097          	auipc	ra,0x0
    80006534:	814080e7          	jalr	-2028(ra) # 80005d44 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006538:	00004517          	auipc	a0,0x4
    8000653c:	10850513          	addi	a0,a0,264 # 8000a640 <_ZZ9kPrintIntmE6digits+0x5d0>
    80006540:	00000097          	auipc	ra,0x0
    80006544:	804080e7          	jalr	-2044(ra) # 80005d44 <_Z11printStringPKc>
            break;
    80006548:	f39ff06f          	j	80006480 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    8000654c:	00004517          	auipc	a0,0x4
    80006550:	14c50513          	addi	a0,a0,332 # 8000a698 <_ZZ9kPrintIntmE6digits+0x628>
    80006554:	fffff097          	auipc	ra,0xfffff
    80006558:	7f0080e7          	jalr	2032(ra) # 80005d44 <_Z11printStringPKc>
    8000655c:	f25ff06f          	j	80006480 <_Z8userMainv+0x74>

0000000080006560 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006560:	fe010113          	addi	sp,sp,-32
    80006564:	00113c23          	sd	ra,24(sp)
    80006568:	00813823          	sd	s0,16(sp)
    8000656c:	00913423          	sd	s1,8(sp)
    80006570:	01213023          	sd	s2,0(sp)
    80006574:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006578:	00053903          	ld	s2,0(a0)
    int i = 6;
    8000657c:	00600493          	li	s1,6
    while (--i > 0) {
    80006580:	fff4849b          	addiw	s1,s1,-1
    80006584:	04905463          	blez	s1,800065cc <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006588:	00004517          	auipc	a0,0x4
    8000658c:	15850513          	addi	a0,a0,344 # 8000a6e0 <_ZZ9kPrintIntmE6digits+0x670>
    80006590:	fffff097          	auipc	ra,0xfffff
    80006594:	7b4080e7          	jalr	1972(ra) # 80005d44 <_Z11printStringPKc>
        printInt(sleep_time);
    80006598:	00000613          	li	a2,0
    8000659c:	00a00593          	li	a1,10
    800065a0:	0009051b          	sext.w	a0,s2
    800065a4:	00000097          	auipc	ra,0x0
    800065a8:	950080e7          	jalr	-1712(ra) # 80005ef4 <_Z8printIntiii>
        printString(" !\n");
    800065ac:	00004517          	auipc	a0,0x4
    800065b0:	13c50513          	addi	a0,a0,316 # 8000a6e8 <_ZZ9kPrintIntmE6digits+0x678>
    800065b4:	fffff097          	auipc	ra,0xfffff
    800065b8:	790080e7          	jalr	1936(ra) # 80005d44 <_Z11printStringPKc>
        time_sleep(sleep_time);
    800065bc:	00090513          	mv	a0,s2
    800065c0:	ffffb097          	auipc	ra,0xffffb
    800065c4:	ebc080e7          	jalr	-324(ra) # 8000147c <_Z10time_sleepm>
    while (--i > 0) {
    800065c8:	fb9ff06f          	j	80006580 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    800065cc:	00a00793          	li	a5,10
    800065d0:	02f95933          	divu	s2,s2,a5
    800065d4:	fff90913          	addi	s2,s2,-1
    800065d8:	00007797          	auipc	a5,0x7
    800065dc:	92078793          	addi	a5,a5,-1760 # 8000cef8 <_ZL8finished>
    800065e0:	01278933          	add	s2,a5,s2
    800065e4:	00100793          	li	a5,1
    800065e8:	00f90023          	sb	a5,0(s2)
}
    800065ec:	01813083          	ld	ra,24(sp)
    800065f0:	01013403          	ld	s0,16(sp)
    800065f4:	00813483          	ld	s1,8(sp)
    800065f8:	00013903          	ld	s2,0(sp)
    800065fc:	02010113          	addi	sp,sp,32
    80006600:	00008067          	ret

0000000080006604 <_Z12testSleepingv>:

void testSleeping() {
    80006604:	fc010113          	addi	sp,sp,-64
    80006608:	02113c23          	sd	ra,56(sp)
    8000660c:	02813823          	sd	s0,48(sp)
    80006610:	02913423          	sd	s1,40(sp)
    80006614:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006618:	00a00793          	li	a5,10
    8000661c:	fcf43823          	sd	a5,-48(s0)
    80006620:	01400793          	li	a5,20
    80006624:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006628:	00000493          	li	s1,0
    8000662c:	02c0006f          	j	80006658 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006630:	00349793          	slli	a5,s1,0x3
    80006634:	fd040613          	addi	a2,s0,-48
    80006638:	00f60633          	add	a2,a2,a5
    8000663c:	00000597          	auipc	a1,0x0
    80006640:	f2458593          	addi	a1,a1,-220 # 80006560 <_ZL9sleepyRunPv>
    80006644:	fc040513          	addi	a0,s0,-64
    80006648:	00f50533          	add	a0,a0,a5
    8000664c:	ffffb097          	auipc	ra,0xffffb
    80006650:	d2c080e7          	jalr	-724(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006654:	0014849b          	addiw	s1,s1,1
    80006658:	00100793          	li	a5,1
    8000665c:	fc97dae3          	bge	a5,s1,80006630 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006660:	00007797          	auipc	a5,0x7
    80006664:	8987c783          	lbu	a5,-1896(a5) # 8000cef8 <_ZL8finished>
    80006668:	fe078ce3          	beqz	a5,80006660 <_Z12testSleepingv+0x5c>
    8000666c:	00007797          	auipc	a5,0x7
    80006670:	88d7c783          	lbu	a5,-1907(a5) # 8000cef9 <_ZL8finished+0x1>
    80006674:	fe0786e3          	beqz	a5,80006660 <_Z12testSleepingv+0x5c>
}
    80006678:	03813083          	ld	ra,56(sp)
    8000667c:	03013403          	ld	s0,48(sp)
    80006680:	02813483          	ld	s1,40(sp)
    80006684:	04010113          	addi	sp,sp,64
    80006688:	00008067          	ret

000000008000668c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000668c:	fe010113          	addi	sp,sp,-32
    80006690:	00113c23          	sd	ra,24(sp)
    80006694:	00813823          	sd	s0,16(sp)
    80006698:	00913423          	sd	s1,8(sp)
    8000669c:	01213023          	sd	s2,0(sp)
    800066a0:	02010413          	addi	s0,sp,32
    800066a4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800066a8:	00100793          	li	a5,1
    800066ac:	02a7f863          	bgeu	a5,a0,800066dc <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800066b0:	00a00793          	li	a5,10
    800066b4:	02f577b3          	remu	a5,a0,a5
    800066b8:	02078e63          	beqz	a5,800066f4 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800066bc:	fff48513          	addi	a0,s1,-1
    800066c0:	00000097          	auipc	ra,0x0
    800066c4:	fcc080e7          	jalr	-52(ra) # 8000668c <_ZL9fibonaccim>
    800066c8:	00050913          	mv	s2,a0
    800066cc:	ffe48513          	addi	a0,s1,-2
    800066d0:	00000097          	auipc	ra,0x0
    800066d4:	fbc080e7          	jalr	-68(ra) # 8000668c <_ZL9fibonaccim>
    800066d8:	00a90533          	add	a0,s2,a0
}
    800066dc:	01813083          	ld	ra,24(sp)
    800066e0:	01013403          	ld	s0,16(sp)
    800066e4:	00813483          	ld	s1,8(sp)
    800066e8:	00013903          	ld	s2,0(sp)
    800066ec:	02010113          	addi	sp,sp,32
    800066f0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800066f4:	ffffb097          	auipc	ra,0xffffb
    800066f8:	d40080e7          	jalr	-704(ra) # 80001434 <_Z15thread_dispatchv>
    800066fc:	fc1ff06f          	j	800066bc <_ZL9fibonaccim+0x30>

0000000080006700 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006700:	fe010113          	addi	sp,sp,-32
    80006704:	00113c23          	sd	ra,24(sp)
    80006708:	00813823          	sd	s0,16(sp)
    8000670c:	00913423          	sd	s1,8(sp)
    80006710:	01213023          	sd	s2,0(sp)
    80006714:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006718:	00a00493          	li	s1,10
    8000671c:	0400006f          	j	8000675c <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006720:	00004517          	auipc	a0,0x4
    80006724:	c9850513          	addi	a0,a0,-872 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    80006728:	fffff097          	auipc	ra,0xfffff
    8000672c:	61c080e7          	jalr	1564(ra) # 80005d44 <_Z11printStringPKc>
    80006730:	00000613          	li	a2,0
    80006734:	00a00593          	li	a1,10
    80006738:	00048513          	mv	a0,s1
    8000673c:	fffff097          	auipc	ra,0xfffff
    80006740:	7b8080e7          	jalr	1976(ra) # 80005ef4 <_Z8printIntiii>
    80006744:	00004517          	auipc	a0,0x4
    80006748:	e6450513          	addi	a0,a0,-412 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    8000674c:	fffff097          	auipc	ra,0xfffff
    80006750:	5f8080e7          	jalr	1528(ra) # 80005d44 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006754:	0014849b          	addiw	s1,s1,1
    80006758:	0ff4f493          	andi	s1,s1,255
    8000675c:	00c00793          	li	a5,12
    80006760:	fc97f0e3          	bgeu	a5,s1,80006720 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006764:	00004517          	auipc	a0,0x4
    80006768:	c5c50513          	addi	a0,a0,-932 # 8000a3c0 <_ZZ9kPrintIntmE6digits+0x350>
    8000676c:	fffff097          	auipc	ra,0xfffff
    80006770:	5d8080e7          	jalr	1496(ra) # 80005d44 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006774:	00500313          	li	t1,5
    thread_dispatch();
    80006778:	ffffb097          	auipc	ra,0xffffb
    8000677c:	cbc080e7          	jalr	-836(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006780:	01000513          	li	a0,16
    80006784:	00000097          	auipc	ra,0x0
    80006788:	f08080e7          	jalr	-248(ra) # 8000668c <_ZL9fibonaccim>
    8000678c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006790:	00004517          	auipc	a0,0x4
    80006794:	c4050513          	addi	a0,a0,-960 # 8000a3d0 <_ZZ9kPrintIntmE6digits+0x360>
    80006798:	fffff097          	auipc	ra,0xfffff
    8000679c:	5ac080e7          	jalr	1452(ra) # 80005d44 <_Z11printStringPKc>
    800067a0:	00000613          	li	a2,0
    800067a4:	00a00593          	li	a1,10
    800067a8:	0009051b          	sext.w	a0,s2
    800067ac:	fffff097          	auipc	ra,0xfffff
    800067b0:	748080e7          	jalr	1864(ra) # 80005ef4 <_Z8printIntiii>
    800067b4:	00004517          	auipc	a0,0x4
    800067b8:	df450513          	addi	a0,a0,-524 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    800067bc:	fffff097          	auipc	ra,0xfffff
    800067c0:	588080e7          	jalr	1416(ra) # 80005d44 <_Z11printStringPKc>
    800067c4:	0400006f          	j	80006804 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800067c8:	00004517          	auipc	a0,0x4
    800067cc:	bf050513          	addi	a0,a0,-1040 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    800067d0:	fffff097          	auipc	ra,0xfffff
    800067d4:	574080e7          	jalr	1396(ra) # 80005d44 <_Z11printStringPKc>
    800067d8:	00000613          	li	a2,0
    800067dc:	00a00593          	li	a1,10
    800067e0:	00048513          	mv	a0,s1
    800067e4:	fffff097          	auipc	ra,0xfffff
    800067e8:	710080e7          	jalr	1808(ra) # 80005ef4 <_Z8printIntiii>
    800067ec:	00004517          	auipc	a0,0x4
    800067f0:	dbc50513          	addi	a0,a0,-580 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    800067f4:	fffff097          	auipc	ra,0xfffff
    800067f8:	550080e7          	jalr	1360(ra) # 80005d44 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800067fc:	0014849b          	addiw	s1,s1,1
    80006800:	0ff4f493          	andi	s1,s1,255
    80006804:	00f00793          	li	a5,15
    80006808:	fc97f0e3          	bgeu	a5,s1,800067c8 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000680c:	00004517          	auipc	a0,0x4
    80006810:	bd450513          	addi	a0,a0,-1068 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80006814:	fffff097          	auipc	ra,0xfffff
    80006818:	530080e7          	jalr	1328(ra) # 80005d44 <_Z11printStringPKc>
    finishedD = true;
    8000681c:	00100793          	li	a5,1
    80006820:	00006717          	auipc	a4,0x6
    80006824:	6cf70d23          	sb	a5,1754(a4) # 8000cefa <_ZL9finishedD>
    thread_dispatch();
    80006828:	ffffb097          	auipc	ra,0xffffb
    8000682c:	c0c080e7          	jalr	-1012(ra) # 80001434 <_Z15thread_dispatchv>
}
    80006830:	01813083          	ld	ra,24(sp)
    80006834:	01013403          	ld	s0,16(sp)
    80006838:	00813483          	ld	s1,8(sp)
    8000683c:	00013903          	ld	s2,0(sp)
    80006840:	02010113          	addi	sp,sp,32
    80006844:	00008067          	ret

0000000080006848 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006848:	fe010113          	addi	sp,sp,-32
    8000684c:	00113c23          	sd	ra,24(sp)
    80006850:	00813823          	sd	s0,16(sp)
    80006854:	00913423          	sd	s1,8(sp)
    80006858:	01213023          	sd	s2,0(sp)
    8000685c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006860:	00000493          	li	s1,0
    80006864:	0400006f          	j	800068a4 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006868:	00004517          	auipc	a0,0x4
    8000686c:	b1050513          	addi	a0,a0,-1264 # 8000a378 <_ZZ9kPrintIntmE6digits+0x308>
    80006870:	fffff097          	auipc	ra,0xfffff
    80006874:	4d4080e7          	jalr	1236(ra) # 80005d44 <_Z11printStringPKc>
    80006878:	00000613          	li	a2,0
    8000687c:	00a00593          	li	a1,10
    80006880:	00048513          	mv	a0,s1
    80006884:	fffff097          	auipc	ra,0xfffff
    80006888:	670080e7          	jalr	1648(ra) # 80005ef4 <_Z8printIntiii>
    8000688c:	00004517          	auipc	a0,0x4
    80006890:	d1c50513          	addi	a0,a0,-740 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80006894:	fffff097          	auipc	ra,0xfffff
    80006898:	4b0080e7          	jalr	1200(ra) # 80005d44 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000689c:	0014849b          	addiw	s1,s1,1
    800068a0:	0ff4f493          	andi	s1,s1,255
    800068a4:	00200793          	li	a5,2
    800068a8:	fc97f0e3          	bgeu	a5,s1,80006868 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800068ac:	00004517          	auipc	a0,0x4
    800068b0:	ad450513          	addi	a0,a0,-1324 # 8000a380 <_ZZ9kPrintIntmE6digits+0x310>
    800068b4:	fffff097          	auipc	ra,0xfffff
    800068b8:	490080e7          	jalr	1168(ra) # 80005d44 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800068bc:	00700313          	li	t1,7
    thread_dispatch();
    800068c0:	ffffb097          	auipc	ra,0xffffb
    800068c4:	b74080e7          	jalr	-1164(ra) # 80001434 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800068c8:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800068cc:	00004517          	auipc	a0,0x4
    800068d0:	ac450513          	addi	a0,a0,-1340 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    800068d4:	fffff097          	auipc	ra,0xfffff
    800068d8:	470080e7          	jalr	1136(ra) # 80005d44 <_Z11printStringPKc>
    800068dc:	00000613          	li	a2,0
    800068e0:	00a00593          	li	a1,10
    800068e4:	0009051b          	sext.w	a0,s2
    800068e8:	fffff097          	auipc	ra,0xfffff
    800068ec:	60c080e7          	jalr	1548(ra) # 80005ef4 <_Z8printIntiii>
    800068f0:	00004517          	auipc	a0,0x4
    800068f4:	cb850513          	addi	a0,a0,-840 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    800068f8:	fffff097          	auipc	ra,0xfffff
    800068fc:	44c080e7          	jalr	1100(ra) # 80005d44 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006900:	00c00513          	li	a0,12
    80006904:	00000097          	auipc	ra,0x0
    80006908:	d88080e7          	jalr	-632(ra) # 8000668c <_ZL9fibonaccim>
    8000690c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006910:	00004517          	auipc	a0,0x4
    80006914:	a8850513          	addi	a0,a0,-1400 # 8000a398 <_ZZ9kPrintIntmE6digits+0x328>
    80006918:	fffff097          	auipc	ra,0xfffff
    8000691c:	42c080e7          	jalr	1068(ra) # 80005d44 <_Z11printStringPKc>
    80006920:	00000613          	li	a2,0
    80006924:	00a00593          	li	a1,10
    80006928:	0009051b          	sext.w	a0,s2
    8000692c:	fffff097          	auipc	ra,0xfffff
    80006930:	5c8080e7          	jalr	1480(ra) # 80005ef4 <_Z8printIntiii>
    80006934:	00004517          	auipc	a0,0x4
    80006938:	c7450513          	addi	a0,a0,-908 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    8000693c:	fffff097          	auipc	ra,0xfffff
    80006940:	408080e7          	jalr	1032(ra) # 80005d44 <_Z11printStringPKc>
    80006944:	0400006f          	j	80006984 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006948:	00004517          	auipc	a0,0x4
    8000694c:	a3050513          	addi	a0,a0,-1488 # 8000a378 <_ZZ9kPrintIntmE6digits+0x308>
    80006950:	fffff097          	auipc	ra,0xfffff
    80006954:	3f4080e7          	jalr	1012(ra) # 80005d44 <_Z11printStringPKc>
    80006958:	00000613          	li	a2,0
    8000695c:	00a00593          	li	a1,10
    80006960:	00048513          	mv	a0,s1
    80006964:	fffff097          	auipc	ra,0xfffff
    80006968:	590080e7          	jalr	1424(ra) # 80005ef4 <_Z8printIntiii>
    8000696c:	00004517          	auipc	a0,0x4
    80006970:	c3c50513          	addi	a0,a0,-964 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80006974:	fffff097          	auipc	ra,0xfffff
    80006978:	3d0080e7          	jalr	976(ra) # 80005d44 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000697c:	0014849b          	addiw	s1,s1,1
    80006980:	0ff4f493          	andi	s1,s1,255
    80006984:	00500793          	li	a5,5
    80006988:	fc97f0e3          	bgeu	a5,s1,80006948 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    8000698c:	00004517          	auipc	a0,0x4
    80006990:	9c450513          	addi	a0,a0,-1596 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80006994:	fffff097          	auipc	ra,0xfffff
    80006998:	3b0080e7          	jalr	944(ra) # 80005d44 <_Z11printStringPKc>
    finishedC = true;
    8000699c:	00100793          	li	a5,1
    800069a0:	00006717          	auipc	a4,0x6
    800069a4:	54f70da3          	sb	a5,1371(a4) # 8000cefb <_ZL9finishedC>
    thread_dispatch();
    800069a8:	ffffb097          	auipc	ra,0xffffb
    800069ac:	a8c080e7          	jalr	-1396(ra) # 80001434 <_Z15thread_dispatchv>
}
    800069b0:	01813083          	ld	ra,24(sp)
    800069b4:	01013403          	ld	s0,16(sp)
    800069b8:	00813483          	ld	s1,8(sp)
    800069bc:	00013903          	ld	s2,0(sp)
    800069c0:	02010113          	addi	sp,sp,32
    800069c4:	00008067          	ret

00000000800069c8 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800069c8:	fe010113          	addi	sp,sp,-32
    800069cc:	00113c23          	sd	ra,24(sp)
    800069d0:	00813823          	sd	s0,16(sp)
    800069d4:	00913423          	sd	s1,8(sp)
    800069d8:	01213023          	sd	s2,0(sp)
    800069dc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800069e0:	00000913          	li	s2,0
    800069e4:	0400006f          	j	80006a24 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    800069e8:	ffffb097          	auipc	ra,0xffffb
    800069ec:	a4c080e7          	jalr	-1460(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800069f0:	00148493          	addi	s1,s1,1
    800069f4:	000027b7          	lui	a5,0x2
    800069f8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800069fc:	0097ee63          	bltu	a5,s1,80006a18 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006a00:	00000713          	li	a4,0
    80006a04:	000077b7          	lui	a5,0x7
    80006a08:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006a0c:	fce7eee3          	bltu	a5,a4,800069e8 <_ZL11workerBodyBPv+0x20>
    80006a10:	00170713          	addi	a4,a4,1
    80006a14:	ff1ff06f          	j	80006a04 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006a18:	00a00793          	li	a5,10
    80006a1c:	04f90663          	beq	s2,a5,80006a68 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006a20:	00190913          	addi	s2,s2,1
    80006a24:	00f00793          	li	a5,15
    80006a28:	0527e463          	bltu	a5,s2,80006a70 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006a2c:	00004517          	auipc	a0,0x4
    80006a30:	93450513          	addi	a0,a0,-1740 # 8000a360 <_ZZ9kPrintIntmE6digits+0x2f0>
    80006a34:	fffff097          	auipc	ra,0xfffff
    80006a38:	310080e7          	jalr	784(ra) # 80005d44 <_Z11printStringPKc>
    80006a3c:	00000613          	li	a2,0
    80006a40:	00a00593          	li	a1,10
    80006a44:	0009051b          	sext.w	a0,s2
    80006a48:	fffff097          	auipc	ra,0xfffff
    80006a4c:	4ac080e7          	jalr	1196(ra) # 80005ef4 <_Z8printIntiii>
    80006a50:	00004517          	auipc	a0,0x4
    80006a54:	b5850513          	addi	a0,a0,-1192 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80006a58:	fffff097          	auipc	ra,0xfffff
    80006a5c:	2ec080e7          	jalr	748(ra) # 80005d44 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006a60:	00000493          	li	s1,0
    80006a64:	f91ff06f          	j	800069f4 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006a68:	14102ff3          	csrr	t6,sepc
    80006a6c:	fb5ff06f          	j	80006a20 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006a70:	00004517          	auipc	a0,0x4
    80006a74:	8f850513          	addi	a0,a0,-1800 # 8000a368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80006a78:	fffff097          	auipc	ra,0xfffff
    80006a7c:	2cc080e7          	jalr	716(ra) # 80005d44 <_Z11printStringPKc>
    finishedB = true;
    80006a80:	00100793          	li	a5,1
    80006a84:	00006717          	auipc	a4,0x6
    80006a88:	46f70c23          	sb	a5,1144(a4) # 8000cefc <_ZL9finishedB>
    thread_dispatch();
    80006a8c:	ffffb097          	auipc	ra,0xffffb
    80006a90:	9a8080e7          	jalr	-1624(ra) # 80001434 <_Z15thread_dispatchv>
}
    80006a94:	01813083          	ld	ra,24(sp)
    80006a98:	01013403          	ld	s0,16(sp)
    80006a9c:	00813483          	ld	s1,8(sp)
    80006aa0:	00013903          	ld	s2,0(sp)
    80006aa4:	02010113          	addi	sp,sp,32
    80006aa8:	00008067          	ret

0000000080006aac <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006aac:	fe010113          	addi	sp,sp,-32
    80006ab0:	00113c23          	sd	ra,24(sp)
    80006ab4:	00813823          	sd	s0,16(sp)
    80006ab8:	00913423          	sd	s1,8(sp)
    80006abc:	01213023          	sd	s2,0(sp)
    80006ac0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006ac4:	00000913          	li	s2,0
    80006ac8:	0380006f          	j	80006b00 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006acc:	ffffb097          	auipc	ra,0xffffb
    80006ad0:	968080e7          	jalr	-1688(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006ad4:	00148493          	addi	s1,s1,1
    80006ad8:	000027b7          	lui	a5,0x2
    80006adc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006ae0:	0097ee63          	bltu	a5,s1,80006afc <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006ae4:	00000713          	li	a4,0
    80006ae8:	000077b7          	lui	a5,0x7
    80006aec:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006af0:	fce7eee3          	bltu	a5,a4,80006acc <_ZL11workerBodyAPv+0x20>
    80006af4:	00170713          	addi	a4,a4,1
    80006af8:	ff1ff06f          	j	80006ae8 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006afc:	00190913          	addi	s2,s2,1
    80006b00:	00900793          	li	a5,9
    80006b04:	0527e063          	bltu	a5,s2,80006b44 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006b08:	00004517          	auipc	a0,0x4
    80006b0c:	84050513          	addi	a0,a0,-1984 # 8000a348 <_ZZ9kPrintIntmE6digits+0x2d8>
    80006b10:	fffff097          	auipc	ra,0xfffff
    80006b14:	234080e7          	jalr	564(ra) # 80005d44 <_Z11printStringPKc>
    80006b18:	00000613          	li	a2,0
    80006b1c:	00a00593          	li	a1,10
    80006b20:	0009051b          	sext.w	a0,s2
    80006b24:	fffff097          	auipc	ra,0xfffff
    80006b28:	3d0080e7          	jalr	976(ra) # 80005ef4 <_Z8printIntiii>
    80006b2c:	00004517          	auipc	a0,0x4
    80006b30:	a7c50513          	addi	a0,a0,-1412 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80006b34:	fffff097          	auipc	ra,0xfffff
    80006b38:	210080e7          	jalr	528(ra) # 80005d44 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006b3c:	00000493          	li	s1,0
    80006b40:	f99ff06f          	j	80006ad8 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006b44:	00004517          	auipc	a0,0x4
    80006b48:	80c50513          	addi	a0,a0,-2036 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80006b4c:	fffff097          	auipc	ra,0xfffff
    80006b50:	1f8080e7          	jalr	504(ra) # 80005d44 <_Z11printStringPKc>
    finishedA = true;
    80006b54:	00100793          	li	a5,1
    80006b58:	00006717          	auipc	a4,0x6
    80006b5c:	3af702a3          	sb	a5,933(a4) # 8000cefd <_ZL9finishedA>
}
    80006b60:	01813083          	ld	ra,24(sp)
    80006b64:	01013403          	ld	s0,16(sp)
    80006b68:	00813483          	ld	s1,8(sp)
    80006b6c:	00013903          	ld	s2,0(sp)
    80006b70:	02010113          	addi	sp,sp,32
    80006b74:	00008067          	ret

0000000080006b78 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006b78:	fd010113          	addi	sp,sp,-48
    80006b7c:	02113423          	sd	ra,40(sp)
    80006b80:	02813023          	sd	s0,32(sp)
    80006b84:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006b88:	00000613          	li	a2,0
    80006b8c:	00000597          	auipc	a1,0x0
    80006b90:	f2058593          	addi	a1,a1,-224 # 80006aac <_ZL11workerBodyAPv>
    80006b94:	fd040513          	addi	a0,s0,-48
    80006b98:	ffffa097          	auipc	ra,0xffffa
    80006b9c:	7e0080e7          	jalr	2016(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006ba0:	00004517          	auipc	a0,0x4
    80006ba4:	85050513          	addi	a0,a0,-1968 # 8000a3f0 <_ZZ9kPrintIntmE6digits+0x380>
    80006ba8:	fffff097          	auipc	ra,0xfffff
    80006bac:	19c080e7          	jalr	412(ra) # 80005d44 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006bb0:	00000613          	li	a2,0
    80006bb4:	00000597          	auipc	a1,0x0
    80006bb8:	e1458593          	addi	a1,a1,-492 # 800069c8 <_ZL11workerBodyBPv>
    80006bbc:	fd840513          	addi	a0,s0,-40
    80006bc0:	ffffa097          	auipc	ra,0xffffa
    80006bc4:	7b8080e7          	jalr	1976(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006bc8:	00004517          	auipc	a0,0x4
    80006bcc:	84050513          	addi	a0,a0,-1984 # 8000a408 <_ZZ9kPrintIntmE6digits+0x398>
    80006bd0:	fffff097          	auipc	ra,0xfffff
    80006bd4:	174080e7          	jalr	372(ra) # 80005d44 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006bd8:	00000613          	li	a2,0
    80006bdc:	00000597          	auipc	a1,0x0
    80006be0:	c6c58593          	addi	a1,a1,-916 # 80006848 <_ZL11workerBodyCPv>
    80006be4:	fe040513          	addi	a0,s0,-32
    80006be8:	ffffa097          	auipc	ra,0xffffa
    80006bec:	790080e7          	jalr	1936(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006bf0:	00004517          	auipc	a0,0x4
    80006bf4:	83050513          	addi	a0,a0,-2000 # 8000a420 <_ZZ9kPrintIntmE6digits+0x3b0>
    80006bf8:	fffff097          	auipc	ra,0xfffff
    80006bfc:	14c080e7          	jalr	332(ra) # 80005d44 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006c00:	00000613          	li	a2,0
    80006c04:	00000597          	auipc	a1,0x0
    80006c08:	afc58593          	addi	a1,a1,-1284 # 80006700 <_ZL11workerBodyDPv>
    80006c0c:	fe840513          	addi	a0,s0,-24
    80006c10:	ffffa097          	auipc	ra,0xffffa
    80006c14:	768080e7          	jalr	1896(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006c18:	00004517          	auipc	a0,0x4
    80006c1c:	82050513          	addi	a0,a0,-2016 # 8000a438 <_ZZ9kPrintIntmE6digits+0x3c8>
    80006c20:	fffff097          	auipc	ra,0xfffff
    80006c24:	124080e7          	jalr	292(ra) # 80005d44 <_Z11printStringPKc>
    80006c28:	00c0006f          	j	80006c34 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006c2c:	ffffb097          	auipc	ra,0xffffb
    80006c30:	808080e7          	jalr	-2040(ra) # 80001434 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006c34:	00006797          	auipc	a5,0x6
    80006c38:	2c97c783          	lbu	a5,713(a5) # 8000cefd <_ZL9finishedA>
    80006c3c:	fe0788e3          	beqz	a5,80006c2c <_Z16System_Mode_testv+0xb4>
    80006c40:	00006797          	auipc	a5,0x6
    80006c44:	2bc7c783          	lbu	a5,700(a5) # 8000cefc <_ZL9finishedB>
    80006c48:	fe0782e3          	beqz	a5,80006c2c <_Z16System_Mode_testv+0xb4>
    80006c4c:	00006797          	auipc	a5,0x6
    80006c50:	2af7c783          	lbu	a5,687(a5) # 8000cefb <_ZL9finishedC>
    80006c54:	fc078ce3          	beqz	a5,80006c2c <_Z16System_Mode_testv+0xb4>
    80006c58:	00006797          	auipc	a5,0x6
    80006c5c:	2a27c783          	lbu	a5,674(a5) # 8000cefa <_ZL9finishedD>
    80006c60:	fc0786e3          	beqz	a5,80006c2c <_Z16System_Mode_testv+0xb4>
    }

}
    80006c64:	02813083          	ld	ra,40(sp)
    80006c68:	02013403          	ld	s0,32(sp)
    80006c6c:	03010113          	addi	sp,sp,48
    80006c70:	00008067          	ret

0000000080006c74 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006c74:	fe010113          	addi	sp,sp,-32
    80006c78:	00113c23          	sd	ra,24(sp)
    80006c7c:	00813823          	sd	s0,16(sp)
    80006c80:	00913423          	sd	s1,8(sp)
    80006c84:	01213023          	sd	s2,0(sp)
    80006c88:	02010413          	addi	s0,sp,32
    80006c8c:	00050493          	mv	s1,a0
    80006c90:	00058913          	mv	s2,a1
    80006c94:	0015879b          	addiw	a5,a1,1
    80006c98:	0007851b          	sext.w	a0,a5
    80006c9c:	00f4a023          	sw	a5,0(s1)
    80006ca0:	0004a823          	sw	zero,16(s1)
    80006ca4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006ca8:	00251513          	slli	a0,a0,0x2
    80006cac:	ffffa097          	auipc	ra,0xffffa
    80006cb0:	65c080e7          	jalr	1628(ra) # 80001308 <_Z9mem_allocm>
    80006cb4:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006cb8:	00000593          	li	a1,0
    80006cbc:	02048513          	addi	a0,s1,32
    80006cc0:	ffffa097          	auipc	ra,0xffffa
    80006cc4:	7ec080e7          	jalr	2028(ra) # 800014ac <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006cc8:	00090593          	mv	a1,s2
    80006ccc:	01848513          	addi	a0,s1,24
    80006cd0:	ffffa097          	auipc	ra,0xffffa
    80006cd4:	7dc080e7          	jalr	2012(ra) # 800014ac <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006cd8:	00100593          	li	a1,1
    80006cdc:	02848513          	addi	a0,s1,40
    80006ce0:	ffffa097          	auipc	ra,0xffffa
    80006ce4:	7cc080e7          	jalr	1996(ra) # 800014ac <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006ce8:	00100593          	li	a1,1
    80006cec:	03048513          	addi	a0,s1,48
    80006cf0:	ffffa097          	auipc	ra,0xffffa
    80006cf4:	7bc080e7          	jalr	1980(ra) # 800014ac <_Z8sem_openPP4KSemj>
}
    80006cf8:	01813083          	ld	ra,24(sp)
    80006cfc:	01013403          	ld	s0,16(sp)
    80006d00:	00813483          	ld	s1,8(sp)
    80006d04:	00013903          	ld	s2,0(sp)
    80006d08:	02010113          	addi	sp,sp,32
    80006d0c:	00008067          	ret

0000000080006d10 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006d10:	fe010113          	addi	sp,sp,-32
    80006d14:	00113c23          	sd	ra,24(sp)
    80006d18:	00813823          	sd	s0,16(sp)
    80006d1c:	00913423          	sd	s1,8(sp)
    80006d20:	01213023          	sd	s2,0(sp)
    80006d24:	02010413          	addi	s0,sp,32
    80006d28:	00050493          	mv	s1,a0
    80006d2c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006d30:	01853503          	ld	a0,24(a0)
    80006d34:	ffffa097          	auipc	ra,0xffffa
    80006d38:	7e0080e7          	jalr	2016(ra) # 80001514 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006d3c:	0304b503          	ld	a0,48(s1)
    80006d40:	ffffa097          	auipc	ra,0xffffa
    80006d44:	7d4080e7          	jalr	2004(ra) # 80001514 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006d48:	0084b783          	ld	a5,8(s1)
    80006d4c:	0144a703          	lw	a4,20(s1)
    80006d50:	00271713          	slli	a4,a4,0x2
    80006d54:	00e787b3          	add	a5,a5,a4
    80006d58:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006d5c:	0144a783          	lw	a5,20(s1)
    80006d60:	0017879b          	addiw	a5,a5,1
    80006d64:	0004a703          	lw	a4,0(s1)
    80006d68:	02e7e7bb          	remw	a5,a5,a4
    80006d6c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006d70:	0304b503          	ld	a0,48(s1)
    80006d74:	ffffa097          	auipc	ra,0xffffa
    80006d78:	7d0080e7          	jalr	2000(ra) # 80001544 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006d7c:	0204b503          	ld	a0,32(s1)
    80006d80:	ffffa097          	auipc	ra,0xffffa
    80006d84:	7c4080e7          	jalr	1988(ra) # 80001544 <_Z10sem_signalP4KSem>

}
    80006d88:	01813083          	ld	ra,24(sp)
    80006d8c:	01013403          	ld	s0,16(sp)
    80006d90:	00813483          	ld	s1,8(sp)
    80006d94:	00013903          	ld	s2,0(sp)
    80006d98:	02010113          	addi	sp,sp,32
    80006d9c:	00008067          	ret

0000000080006da0 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006da0:	fe010113          	addi	sp,sp,-32
    80006da4:	00113c23          	sd	ra,24(sp)
    80006da8:	00813823          	sd	s0,16(sp)
    80006dac:	00913423          	sd	s1,8(sp)
    80006db0:	01213023          	sd	s2,0(sp)
    80006db4:	02010413          	addi	s0,sp,32
    80006db8:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006dbc:	02053503          	ld	a0,32(a0)
    80006dc0:	ffffa097          	auipc	ra,0xffffa
    80006dc4:	754080e7          	jalr	1876(ra) # 80001514 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006dc8:	0284b503          	ld	a0,40(s1)
    80006dcc:	ffffa097          	auipc	ra,0xffffa
    80006dd0:	748080e7          	jalr	1864(ra) # 80001514 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006dd4:	0084b703          	ld	a4,8(s1)
    80006dd8:	0104a783          	lw	a5,16(s1)
    80006ddc:	00279693          	slli	a3,a5,0x2
    80006de0:	00d70733          	add	a4,a4,a3
    80006de4:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006de8:	0017879b          	addiw	a5,a5,1
    80006dec:	0004a703          	lw	a4,0(s1)
    80006df0:	02e7e7bb          	remw	a5,a5,a4
    80006df4:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006df8:	0284b503          	ld	a0,40(s1)
    80006dfc:	ffffa097          	auipc	ra,0xffffa
    80006e00:	748080e7          	jalr	1864(ra) # 80001544 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006e04:	0184b503          	ld	a0,24(s1)
    80006e08:	ffffa097          	auipc	ra,0xffffa
    80006e0c:	73c080e7          	jalr	1852(ra) # 80001544 <_Z10sem_signalP4KSem>

    return ret;
}
    80006e10:	00090513          	mv	a0,s2
    80006e14:	01813083          	ld	ra,24(sp)
    80006e18:	01013403          	ld	s0,16(sp)
    80006e1c:	00813483          	ld	s1,8(sp)
    80006e20:	00013903          	ld	s2,0(sp)
    80006e24:	02010113          	addi	sp,sp,32
    80006e28:	00008067          	ret

0000000080006e2c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006e2c:	fe010113          	addi	sp,sp,-32
    80006e30:	00113c23          	sd	ra,24(sp)
    80006e34:	00813823          	sd	s0,16(sp)
    80006e38:	00913423          	sd	s1,8(sp)
    80006e3c:	01213023          	sd	s2,0(sp)
    80006e40:	02010413          	addi	s0,sp,32
    80006e44:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006e48:	02853503          	ld	a0,40(a0)
    80006e4c:	ffffa097          	auipc	ra,0xffffa
    80006e50:	6c8080e7          	jalr	1736(ra) # 80001514 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006e54:	0304b503          	ld	a0,48(s1)
    80006e58:	ffffa097          	auipc	ra,0xffffa
    80006e5c:	6bc080e7          	jalr	1724(ra) # 80001514 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006e60:	0144a783          	lw	a5,20(s1)
    80006e64:	0104a903          	lw	s2,16(s1)
    80006e68:	0327ce63          	blt	a5,s2,80006ea4 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006e6c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006e70:	0304b503          	ld	a0,48(s1)
    80006e74:	ffffa097          	auipc	ra,0xffffa
    80006e78:	6d0080e7          	jalr	1744(ra) # 80001544 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006e7c:	0284b503          	ld	a0,40(s1)
    80006e80:	ffffa097          	auipc	ra,0xffffa
    80006e84:	6c4080e7          	jalr	1732(ra) # 80001544 <_Z10sem_signalP4KSem>

    return ret;
}
    80006e88:	00090513          	mv	a0,s2
    80006e8c:	01813083          	ld	ra,24(sp)
    80006e90:	01013403          	ld	s0,16(sp)
    80006e94:	00813483          	ld	s1,8(sp)
    80006e98:	00013903          	ld	s2,0(sp)
    80006e9c:	02010113          	addi	sp,sp,32
    80006ea0:	00008067          	ret
        ret = cap - head + tail;
    80006ea4:	0004a703          	lw	a4,0(s1)
    80006ea8:	4127093b          	subw	s2,a4,s2
    80006eac:	00f9093b          	addw	s2,s2,a5
    80006eb0:	fc1ff06f          	j	80006e70 <_ZN6Buffer6getCntEv+0x44>

0000000080006eb4 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006eb4:	fe010113          	addi	sp,sp,-32
    80006eb8:	00113c23          	sd	ra,24(sp)
    80006ebc:	00813823          	sd	s0,16(sp)
    80006ec0:	00913423          	sd	s1,8(sp)
    80006ec4:	02010413          	addi	s0,sp,32
    80006ec8:	00050493          	mv	s1,a0
    putc('\n');
    80006ecc:	00a00513          	li	a0,10
    80006ed0:	ffffa097          	auipc	ra,0xffffa
    80006ed4:	6cc080e7          	jalr	1740(ra) # 8000159c <_Z4putcc>
    printString("Buffer deleted!\n");
    80006ed8:	00003517          	auipc	a0,0x3
    80006edc:	57850513          	addi	a0,a0,1400 # 8000a450 <_ZZ9kPrintIntmE6digits+0x3e0>
    80006ee0:	fffff097          	auipc	ra,0xfffff
    80006ee4:	e64080e7          	jalr	-412(ra) # 80005d44 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006ee8:	00048513          	mv	a0,s1
    80006eec:	00000097          	auipc	ra,0x0
    80006ef0:	f40080e7          	jalr	-192(ra) # 80006e2c <_ZN6Buffer6getCntEv>
    80006ef4:	02a05c63          	blez	a0,80006f2c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006ef8:	0084b783          	ld	a5,8(s1)
    80006efc:	0104a703          	lw	a4,16(s1)
    80006f00:	00271713          	slli	a4,a4,0x2
    80006f04:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006f08:	0007c503          	lbu	a0,0(a5)
    80006f0c:	ffffa097          	auipc	ra,0xffffa
    80006f10:	690080e7          	jalr	1680(ra) # 8000159c <_Z4putcc>
        head = (head + 1) % cap;
    80006f14:	0104a783          	lw	a5,16(s1)
    80006f18:	0017879b          	addiw	a5,a5,1
    80006f1c:	0004a703          	lw	a4,0(s1)
    80006f20:	02e7e7bb          	remw	a5,a5,a4
    80006f24:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006f28:	fc1ff06f          	j	80006ee8 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006f2c:	02100513          	li	a0,33
    80006f30:	ffffa097          	auipc	ra,0xffffa
    80006f34:	66c080e7          	jalr	1644(ra) # 8000159c <_Z4putcc>
    putc('\n');
    80006f38:	00a00513          	li	a0,10
    80006f3c:	ffffa097          	auipc	ra,0xffffa
    80006f40:	660080e7          	jalr	1632(ra) # 8000159c <_Z4putcc>
    mem_free(buffer);
    80006f44:	0084b503          	ld	a0,8(s1)
    80006f48:	ffffa097          	auipc	ra,0xffffa
    80006f4c:	400080e7          	jalr	1024(ra) # 80001348 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006f50:	0204b503          	ld	a0,32(s1)
    80006f54:	ffffa097          	auipc	ra,0xffffa
    80006f58:	590080e7          	jalr	1424(ra) # 800014e4 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006f5c:	0184b503          	ld	a0,24(s1)
    80006f60:	ffffa097          	auipc	ra,0xffffa
    80006f64:	584080e7          	jalr	1412(ra) # 800014e4 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006f68:	0304b503          	ld	a0,48(s1)
    80006f6c:	ffffa097          	auipc	ra,0xffffa
    80006f70:	578080e7          	jalr	1400(ra) # 800014e4 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006f74:	0284b503          	ld	a0,40(s1)
    80006f78:	ffffa097          	auipc	ra,0xffffa
    80006f7c:	56c080e7          	jalr	1388(ra) # 800014e4 <_Z9sem_closeP4KSem>
}
    80006f80:	01813083          	ld	ra,24(sp)
    80006f84:	01013403          	ld	s0,16(sp)
    80006f88:	00813483          	ld	s1,8(sp)
    80006f8c:	02010113          	addi	sp,sp,32
    80006f90:	00008067          	ret

0000000080006f94 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80006f94:	fa010113          	addi	sp,sp,-96
    80006f98:	04813c23          	sd	s0,88(sp)
    80006f9c:	06010413          	addi	s0,sp,96
    80006fa0:	faa43423          	sd	a0,-88(s0)
    80006fa4:	00058793          	mv	a5,a1
    80006fa8:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80006fac:	fa843783          	ld	a5,-88(s0)
    80006fb0:	00079663          	bnez	a5,80006fbc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80006fb4:	00000793          	li	a5,0
    80006fb8:	2040006f          	j	800071bc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80006fbc:	fa843783          	ld	a5,-88(s0)
    80006fc0:	0067d713          	srli	a4,a5,0x6
    80006fc4:	fa843783          	ld	a5,-88(s0)
    80006fc8:	03f7f793          	andi	a5,a5,63
    80006fcc:	00078663          	beqz	a5,80006fd8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80006fd0:	00100793          	li	a5,1
    80006fd4:	0080006f          	j	80006fdc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80006fd8:	00000793          	li	a5,0
    80006fdc:	00e787b3          	add	a5,a5,a4
    80006fe0:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80006fe4:	fc843783          	ld	a5,-56(s0)
    80006fe8:	00679793          	slli	a5,a5,0x6
    80006fec:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    80006ff0:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80006ff4:	00006797          	auipc	a5,0x6
    80006ff8:	f1478793          	addi	a5,a5,-236 # 8000cf08 <_ZN15MemoryAllocator11freeMemHeadE>
    80006ffc:	0007b783          	ld	a5,0(a5)
    80007000:	fef43023          	sd	a5,-32(s0)
    80007004:	fe043783          	ld	a5,-32(s0)
    80007008:	1a078863          	beqz	a5,800071b8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    8000700c:	fe043783          	ld	a5,-32(s0)
    80007010:	0087b783          	ld	a5,8(a5)
    80007014:	fa843703          	ld	a4,-88(s0)
    80007018:	18e7e263          	bltu	a5,a4,8000719c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    8000701c:	fe043703          	ld	a4,-32(s0)
    80007020:	fa843783          	ld	a5,-88(s0)
    80007024:	00f707b3          	add	a5,a4,a5
    80007028:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    8000702c:	fe043783          	ld	a5,-32(s0)
    80007030:	0087b703          	ld	a4,8(a5)
    80007034:	fa843783          	ld	a5,-88(s0)
    80007038:	40f707b3          	sub	a5,a4,a5
    8000703c:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80007040:	fb843703          	ld	a4,-72(s0)
    80007044:	02000793          	li	a5,32
    80007048:	04e7e463          	bltu	a5,a4,80007090 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    8000704c:	fa843703          	ld	a4,-88(s0)
    80007050:	fb843783          	ld	a5,-72(s0)
    80007054:	00f707b3          	add	a5,a4,a5
    80007058:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    8000705c:	fe843783          	ld	a5,-24(s0)
    80007060:	00078c63          	beqz	a5,80007078 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    80007064:	fe043783          	ld	a5,-32(s0)
    80007068:	0007b703          	ld	a4,0(a5)
    8000706c:	fe843783          	ld	a5,-24(s0)
    80007070:	00e7b023          	sd	a4,0(a5)
    80007074:	0600006f          	j	800070d4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    80007078:	fe043783          	ld	a5,-32(s0)
    8000707c:	0007b703          	ld	a4,0(a5)
    80007080:	00006797          	auipc	a5,0x6
    80007084:	e8878793          	addi	a5,a5,-376 # 8000cf08 <_ZN15MemoryAllocator11freeMemHeadE>
    80007088:	00e7b023          	sd	a4,0(a5)
    8000708c:	0480006f          	j	800070d4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    80007090:	fc043783          	ld	a5,-64(s0)
    80007094:	fb843703          	ld	a4,-72(s0)
    80007098:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    8000709c:	fe043783          	ld	a5,-32(s0)
    800070a0:	0007b703          	ld	a4,0(a5)
    800070a4:	fc043783          	ld	a5,-64(s0)
    800070a8:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    800070ac:	fe843783          	ld	a5,-24(s0)
    800070b0:	00078a63          	beqz	a5,800070c4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    800070b4:	fe843783          	ld	a5,-24(s0)
    800070b8:	fc043703          	ld	a4,-64(s0)
    800070bc:	00e7b023          	sd	a4,0(a5)
    800070c0:	0140006f          	j	800070d4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    800070c4:	00006797          	auipc	a5,0x6
    800070c8:	e4478793          	addi	a5,a5,-444 # 8000cf08 <_ZN15MemoryAllocator11freeMemHeadE>
    800070cc:	fc043703          	ld	a4,-64(s0)
    800070d0:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    800070d4:	fe043783          	ld	a5,-32(s0)
    800070d8:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    800070dc:	fb043783          	ld	a5,-80(s0)
    800070e0:	fa843703          	ld	a4,-88(s0)
    800070e4:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    800070e8:	fb043783          	ld	a5,-80(s0)
    800070ec:	fa442703          	lw	a4,-92(s0)
    800070f0:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    800070f4:	fb043783          	ld	a5,-80(s0)
    800070f8:	02078713          	addi	a4,a5,32
    800070fc:	fb043783          	ld	a5,-80(s0)
    80007100:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    80007104:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80007108:	00006797          	auipc	a5,0x6
    8000710c:	df878793          	addi	a5,a5,-520 # 8000cf00 <_ZN15MemoryAllocator11usedMemHeadE>
    80007110:	0007b783          	ld	a5,0(a5)
    80007114:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80007118:	fd043783          	ld	a5,-48(s0)
    8000711c:	02078463          	beqz	a5,80007144 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    80007120:	fd043703          	ld	a4,-48(s0)
    80007124:	fb043783          	ld	a5,-80(s0)
    80007128:	00f77e63          	bgeu	a4,a5,80007144 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    8000712c:	fd043783          	ld	a5,-48(s0)
    80007130:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80007134:	fd043783          	ld	a5,-48(s0)
    80007138:	0007b783          	ld	a5,0(a5)
    8000713c:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80007140:	fd9ff06f          	j	80007118 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    80007144:	fd843783          	ld	a5,-40(s0)
    80007148:	02079663          	bnez	a5,80007174 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    8000714c:	00006797          	auipc	a5,0x6
    80007150:	db478793          	addi	a5,a5,-588 # 8000cf00 <_ZN15MemoryAllocator11usedMemHeadE>
    80007154:	0007b703          	ld	a4,0(a5)
    80007158:	fb043783          	ld	a5,-80(s0)
    8000715c:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    80007160:	00006797          	auipc	a5,0x6
    80007164:	da078793          	addi	a5,a5,-608 # 8000cf00 <_ZN15MemoryAllocator11usedMemHeadE>
    80007168:	fb043703          	ld	a4,-80(s0)
    8000716c:	00e7b023          	sd	a4,0(a5)
    80007170:	0200006f          	j	80007190 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    80007174:	fd843783          	ld	a5,-40(s0)
    80007178:	0007b703          	ld	a4,0(a5)
    8000717c:	fb043783          	ld	a5,-80(s0)
    80007180:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    80007184:	fd843783          	ld	a5,-40(s0)
    80007188:	fb043703          	ld	a4,-80(s0)
    8000718c:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    80007190:	fb043783          	ld	a5,-80(s0)
    80007194:	0187b783          	ld	a5,24(a5)
    80007198:	0240006f          	j	800071bc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    8000719c:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    800071a0:	fe043783          	ld	a5,-32(s0)
    800071a4:	fef43423          	sd	a5,-24(s0)
    800071a8:	fe043783          	ld	a5,-32(s0)
    800071ac:	0007b783          	ld	a5,0(a5)
    800071b0:	fef43023          	sd	a5,-32(s0)
    800071b4:	e51ff06f          	j	80007004 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    800071b8:	00000793          	li	a5,0
}
    800071bc:	00078513          	mv	a0,a5
    800071c0:	05813403          	ld	s0,88(sp)
    800071c4:	06010113          	addi	sp,sp,96
    800071c8:	00008067          	ret

00000000800071cc <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    800071cc:	fb010113          	addi	sp,sp,-80
    800071d0:	04113423          	sd	ra,72(sp)
    800071d4:	04813023          	sd	s0,64(sp)
    800071d8:	05010413          	addi	s0,sp,80
    800071dc:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    800071e0:	fb843783          	ld	a5,-72(s0)
    800071e4:	00079663          	bnez	a5,800071f0 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    800071e8:	00000793          	li	a5,0
    800071ec:	1740006f          	j	80007360 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    800071f0:	00006797          	auipc	a5,0x6
    800071f4:	d1078793          	addi	a5,a5,-752 # 8000cf00 <_ZN15MemoryAllocator11usedMemHeadE>
    800071f8:	0007b783          	ld	a5,0(a5)
    800071fc:	00079663          	bnez	a5,80007208 <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    80007200:	fff00793          	li	a5,-1
    80007204:	15c0006f          	j	80007360 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80007208:	fb843783          	ld	a5,-72(s0)
    8000720c:	fe078793          	addi	a5,a5,-32
    80007210:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    80007214:	00006797          	auipc	a5,0x6
    80007218:	cec78793          	addi	a5,a5,-788 # 8000cf00 <_ZN15MemoryAllocator11usedMemHeadE>
    8000721c:	0007b783          	ld	a5,0(a5)
    80007220:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    80007224:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80007228:	fe843783          	ld	a5,-24(s0)
    8000722c:	02078463          	beqz	a5,80007254 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80007230:	fe843703          	ld	a4,-24(s0)
    80007234:	fb843783          	ld	a5,-72(s0)
    80007238:	00f70e63          	beq	a4,a5,80007254 <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    8000723c:	fe843783          	ld	a5,-24(s0)
    80007240:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80007244:	fe843783          	ld	a5,-24(s0)
    80007248:	0007b783          	ld	a5,0(a5)
    8000724c:	fef43423          	sd	a5,-24(s0)
    80007250:	fd9ff06f          	j	80007228 <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80007254:	fe843703          	ld	a4,-24(s0)
    80007258:	fb843783          	ld	a5,-72(s0)
    8000725c:	00f70663          	beq	a4,a5,80007268 <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80007260:	fff00793          	li	a5,-1
    80007264:	0fc0006f          	j	80007360 <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    80007268:	fe043783          	ld	a5,-32(s0)
    8000726c:	00078c63          	beqz	a5,80007284 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80007270:	fe843783          	ld	a5,-24(s0)
    80007274:	0007b703          	ld	a4,0(a5)
    80007278:	fe043783          	ld	a5,-32(s0)
    8000727c:	00e7b023          	sd	a4,0(a5)
    80007280:	0180006f          	j	80007298 <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    80007284:	fe843783          	ld	a5,-24(s0)
    80007288:	0007b703          	ld	a4,0(a5)
    8000728c:	00006797          	auipc	a5,0x6
    80007290:	c7478793          	addi	a5,a5,-908 # 8000cf00 <_ZN15MemoryAllocator11usedMemHeadE>
    80007294:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    80007298:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    8000729c:	00006797          	auipc	a5,0x6
    800072a0:	c6c78793          	addi	a5,a5,-916 # 8000cf08 <_ZN15MemoryAllocator11freeMemHeadE>
    800072a4:	0007b783          	ld	a5,0(a5)
    800072a8:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    800072ac:	fd043783          	ld	a5,-48(s0)
    800072b0:	02078463          	beqz	a5,800072d8 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    800072b4:	fd043703          	ld	a4,-48(s0)
    800072b8:	fb843783          	ld	a5,-72(s0)
    800072bc:	00f77e63          	bgeu	a4,a5,800072d8 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    800072c0:	fd043783          	ld	a5,-48(s0)
    800072c4:	fcf43c23          	sd	a5,-40(s0)
    800072c8:	fd043783          	ld	a5,-48(s0)
    800072cc:	0007b783          	ld	a5,0(a5)
    800072d0:	fcf43823          	sd	a5,-48(s0)
    800072d4:	fd9ff06f          	j	800072ac <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    800072d8:	fb843783          	ld	a5,-72(s0)
    800072dc:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    800072e0:	fb843783          	ld	a5,-72(s0)
    800072e4:	0087b783          	ld	a5,8(a5)
    800072e8:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    800072ec:	fc843783          	ld	a5,-56(s0)
    800072f0:	fc043703          	ld	a4,-64(s0)
    800072f4:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    800072f8:	fd843783          	ld	a5,-40(s0)
    800072fc:	02078263          	beqz	a5,80007320 <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    80007300:	fd843783          	ld	a5,-40(s0)
    80007304:	0007b703          	ld	a4,0(a5)
    80007308:	fc843783          	ld	a5,-56(s0)
    8000730c:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    80007310:	fd843783          	ld	a5,-40(s0)
    80007314:	fc843703          	ld	a4,-56(s0)
    80007318:	00e7b023          	sd	a4,0(a5)
    8000731c:	0280006f          	j	80007344 <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    80007320:	00006797          	auipc	a5,0x6
    80007324:	be878793          	addi	a5,a5,-1048 # 8000cf08 <_ZN15MemoryAllocator11freeMemHeadE>
    80007328:	0007b703          	ld	a4,0(a5)
    8000732c:	fc843783          	ld	a5,-56(s0)
    80007330:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    80007334:	00006797          	auipc	a5,0x6
    80007338:	bd478793          	addi	a5,a5,-1068 # 8000cf08 <_ZN15MemoryAllocator11freeMemHeadE>
    8000733c:	fc843703          	ld	a4,-56(s0)
    80007340:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    80007344:	fc843503          	ld	a0,-56(s0)
    80007348:	00000097          	auipc	ra,0x0
    8000734c:	02c080e7          	jalr	44(ra) # 80007374 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    80007350:	fd843503          	ld	a0,-40(s0)
    80007354:	00000097          	auipc	ra,0x0
    80007358:	020080e7          	jalr	32(ra) # 80007374 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    8000735c:	00000793          	li	a5,0
}
    80007360:	00078513          	mv	a0,a5
    80007364:	04813083          	ld	ra,72(sp)
    80007368:	04013403          	ld	s0,64(sp)
    8000736c:	05010113          	addi	sp,sp,80
    80007370:	00008067          	ret

0000000080007374 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80007374:	fc010113          	addi	sp,sp,-64
    80007378:	02813c23          	sd	s0,56(sp)
    8000737c:	04010413          	addi	s0,sp,64
    80007380:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    80007384:	fc843783          	ld	a5,-56(s0)
    80007388:	00079663          	bnez	a5,80007394 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    8000738c:	00000793          	li	a5,0
    80007390:	0a00006f          	j	80007430 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    80007394:	fc843783          	ld	a5,-56(s0)
    80007398:	0007b783          	ld	a5,0(a5)
    8000739c:	00f037b3          	snez	a5,a5
    800073a0:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    800073a4:	fc843783          	ld	a5,-56(s0)
    800073a8:	0087b783          	ld	a5,8(a5)
    800073ac:	fc843703          	ld	a4,-56(s0)
    800073b0:	00f707b3          	add	a5,a4,a5
    800073b4:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    800073b8:	fc843783          	ld	a5,-56(s0)
    800073bc:	0007b783          	ld	a5,0(a5)
    800073c0:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    800073c4:	fe043703          	ld	a4,-32(s0)
    800073c8:	fd843783          	ld	a5,-40(s0)
    800073cc:	40f707b3          	sub	a5,a4,a5
    800073d0:	0017b793          	seqz	a5,a5
    800073d4:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    800073d8:	fef44783          	lbu	a5,-17(s0)
    800073dc:	0ff7f793          	andi	a5,a5,255
    800073e0:	04078663          	beqz	a5,8000742c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    800073e4:	fd744783          	lbu	a5,-41(s0)
    800073e8:	0ff7f793          	andi	a5,a5,255
    800073ec:	04078063          	beqz	a5,8000742c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    800073f0:	fc843783          	ld	a5,-56(s0)
    800073f4:	0087b703          	ld	a4,8(a5)
    800073f8:	fc843783          	ld	a5,-56(s0)
    800073fc:	0007b783          	ld	a5,0(a5)
    80007400:	0087b783          	ld	a5,8(a5)
    80007404:	00f70733          	add	a4,a4,a5
    80007408:	fc843783          	ld	a5,-56(s0)
    8000740c:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    80007410:	fc843783          	ld	a5,-56(s0)
    80007414:	0007b783          	ld	a5,0(a5)
    80007418:	0007b703          	ld	a4,0(a5)
    8000741c:	fc843783          	ld	a5,-56(s0)
    80007420:	00e7b023          	sd	a4,0(a5)
        return 1;
    80007424:	00100793          	li	a5,1
    80007428:	0080006f          	j	80007430 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    8000742c:	00000793          	li	a5,0
}
    80007430:	00078513          	mv	a0,a5
    80007434:	03813403          	ld	s0,56(sp)
    80007438:	04010113          	addi	sp,sp,64
    8000743c:	00008067          	ret

0000000080007440 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80007440:	fe010113          	addi	sp,sp,-32
    80007444:	00813c23          	sd	s0,24(sp)
    80007448:	02010413          	addi	s0,sp,32
    8000744c:	fea43423          	sd	a0,-24(s0)
    80007450:	00058793          	mv	a5,a1
    80007454:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80007458:	fe843783          	ld	a5,-24(s0)
    8000745c:	fe078793          	addi	a5,a5,-32
    80007460:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    80007464:	fe843783          	ld	a5,-24(s0)
    80007468:	0107a703          	lw	a4,16(a5)
    8000746c:	fe442783          	lw	a5,-28(s0)
    80007470:	0007879b          	sext.w	a5,a5
    80007474:	40e787b3          	sub	a5,a5,a4
    80007478:	0017b793          	seqz	a5,a5
    8000747c:	0ff7f793          	andi	a5,a5,255
}
    80007480:	00078513          	mv	a0,a5
    80007484:	01813403          	ld	s0,24(sp)
    80007488:	02010113          	addi	sp,sp,32
    8000748c:	00008067          	ret

0000000080007490 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    80007490:	ff010113          	addi	sp,sp,-16
    80007494:	00813423          	sd	s0,8(sp)
    80007498:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    8000749c:	00006797          	auipc	a5,0x6
    800074a0:	a7478793          	addi	a5,a5,-1420 # 8000cf10 <_ZN15MemoryAllocator11initializedE>
    800074a4:	0007c783          	lbu	a5,0(a5)
    800074a8:	0017c793          	xori	a5,a5,1
    800074ac:	0ff7f793          	andi	a5,a5,255
    800074b0:	06078a63          	beqz	a5,80007524 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    800074b4:	00006797          	auipc	a5,0x6
    800074b8:	83c7b783          	ld	a5,-1988(a5) # 8000ccf0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800074bc:	0007b703          	ld	a4,0(a5)
    800074c0:	00006797          	auipc	a5,0x6
    800074c4:	a4878793          	addi	a5,a5,-1464 # 8000cf08 <_ZN15MemoryAllocator11freeMemHeadE>
    800074c8:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    800074cc:	00006797          	auipc	a5,0x6
    800074d0:	a3c78793          	addi	a5,a5,-1476 # 8000cf08 <_ZN15MemoryAllocator11freeMemHeadE>
    800074d4:	0007b783          	ld	a5,0(a5)
    800074d8:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    800074dc:	00006797          	auipc	a5,0x6
    800074e0:	85c7b783          	ld	a5,-1956(a5) # 8000cd38 <_GLOBAL_OFFSET_TABLE_+0x70>
    800074e4:	0007b703          	ld	a4,0(a5)
    800074e8:	00006797          	auipc	a5,0x6
    800074ec:	8087b783          	ld	a5,-2040(a5) # 8000ccf0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800074f0:	0007b783          	ld	a5,0(a5)
    800074f4:	40f70733          	sub	a4,a4,a5
    800074f8:	00006797          	auipc	a5,0x6
    800074fc:	a1078793          	addi	a5,a5,-1520 # 8000cf08 <_ZN15MemoryAllocator11freeMemHeadE>
    80007500:	0007b783          	ld	a5,0(a5)
    80007504:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    80007508:	00006797          	auipc	a5,0x6
    8000750c:	9f878793          	addi	a5,a5,-1544 # 8000cf00 <_ZN15MemoryAllocator11usedMemHeadE>
    80007510:	0007b023          	sd	zero,0(a5)

        initialized = true;
    80007514:	00006797          	auipc	a5,0x6
    80007518:	9fc78793          	addi	a5,a5,-1540 # 8000cf10 <_ZN15MemoryAllocator11initializedE>
    8000751c:	00100713          	li	a4,1
    80007520:	00e78023          	sb	a4,0(a5)
    }
}
    80007524:	00000013          	nop
    80007528:	00813403          	ld	s0,8(sp)
    8000752c:	01010113          	addi	sp,sp,16
    80007530:	00008067          	ret

0000000080007534 <start>:
    80007534:	ff010113          	addi	sp,sp,-16
    80007538:	00813423          	sd	s0,8(sp)
    8000753c:	01010413          	addi	s0,sp,16
    80007540:	300027f3          	csrr	a5,mstatus
    80007544:	ffffe737          	lui	a4,0xffffe
    80007548:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff067f>
    8000754c:	00e7f7b3          	and	a5,a5,a4
    80007550:	00001737          	lui	a4,0x1
    80007554:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80007558:	00e7e7b3          	or	a5,a5,a4
    8000755c:	30079073          	csrw	mstatus,a5
    80007560:	00000797          	auipc	a5,0x0
    80007564:	16078793          	addi	a5,a5,352 # 800076c0 <system_main>
    80007568:	34179073          	csrw	mepc,a5
    8000756c:	00000793          	li	a5,0
    80007570:	18079073          	csrw	satp,a5
    80007574:	000107b7          	lui	a5,0x10
    80007578:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000757c:	30279073          	csrw	medeleg,a5
    80007580:	30379073          	csrw	mideleg,a5
    80007584:	104027f3          	csrr	a5,sie
    80007588:	2227e793          	ori	a5,a5,546
    8000758c:	10479073          	csrw	sie,a5
    80007590:	fff00793          	li	a5,-1
    80007594:	00a7d793          	srli	a5,a5,0xa
    80007598:	3b079073          	csrw	pmpaddr0,a5
    8000759c:	00f00793          	li	a5,15
    800075a0:	3a079073          	csrw	pmpcfg0,a5
    800075a4:	f14027f3          	csrr	a5,mhartid
    800075a8:	0200c737          	lui	a4,0x200c
    800075ac:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800075b0:	0007869b          	sext.w	a3,a5
    800075b4:	00269713          	slli	a4,a3,0x2
    800075b8:	000f4637          	lui	a2,0xf4
    800075bc:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800075c0:	00d70733          	add	a4,a4,a3
    800075c4:	0037979b          	slliw	a5,a5,0x3
    800075c8:	020046b7          	lui	a3,0x2004
    800075cc:	00d787b3          	add	a5,a5,a3
    800075d0:	00c585b3          	add	a1,a1,a2
    800075d4:	00371693          	slli	a3,a4,0x3
    800075d8:	00006717          	auipc	a4,0x6
    800075dc:	94870713          	addi	a4,a4,-1720 # 8000cf20 <timer_scratch>
    800075e0:	00b7b023          	sd	a1,0(a5)
    800075e4:	00d70733          	add	a4,a4,a3
    800075e8:	00f73c23          	sd	a5,24(a4)
    800075ec:	02c73023          	sd	a2,32(a4)
    800075f0:	34071073          	csrw	mscratch,a4
    800075f4:	00000797          	auipc	a5,0x0
    800075f8:	6ec78793          	addi	a5,a5,1772 # 80007ce0 <timervec>
    800075fc:	30579073          	csrw	mtvec,a5
    80007600:	300027f3          	csrr	a5,mstatus
    80007604:	0087e793          	ori	a5,a5,8
    80007608:	30079073          	csrw	mstatus,a5
    8000760c:	304027f3          	csrr	a5,mie
    80007610:	0807e793          	ori	a5,a5,128
    80007614:	30479073          	csrw	mie,a5
    80007618:	f14027f3          	csrr	a5,mhartid
    8000761c:	0007879b          	sext.w	a5,a5
    80007620:	00078213          	mv	tp,a5
    80007624:	30200073          	mret
    80007628:	00813403          	ld	s0,8(sp)
    8000762c:	01010113          	addi	sp,sp,16
    80007630:	00008067          	ret

0000000080007634 <timerinit>:
    80007634:	ff010113          	addi	sp,sp,-16
    80007638:	00813423          	sd	s0,8(sp)
    8000763c:	01010413          	addi	s0,sp,16
    80007640:	f14027f3          	csrr	a5,mhartid
    80007644:	0200c737          	lui	a4,0x200c
    80007648:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000764c:	0007869b          	sext.w	a3,a5
    80007650:	00269713          	slli	a4,a3,0x2
    80007654:	000f4637          	lui	a2,0xf4
    80007658:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000765c:	00d70733          	add	a4,a4,a3
    80007660:	0037979b          	slliw	a5,a5,0x3
    80007664:	020046b7          	lui	a3,0x2004
    80007668:	00d787b3          	add	a5,a5,a3
    8000766c:	00c585b3          	add	a1,a1,a2
    80007670:	00371693          	slli	a3,a4,0x3
    80007674:	00006717          	auipc	a4,0x6
    80007678:	8ac70713          	addi	a4,a4,-1876 # 8000cf20 <timer_scratch>
    8000767c:	00b7b023          	sd	a1,0(a5)
    80007680:	00d70733          	add	a4,a4,a3
    80007684:	00f73c23          	sd	a5,24(a4)
    80007688:	02c73023          	sd	a2,32(a4)
    8000768c:	34071073          	csrw	mscratch,a4
    80007690:	00000797          	auipc	a5,0x0
    80007694:	65078793          	addi	a5,a5,1616 # 80007ce0 <timervec>
    80007698:	30579073          	csrw	mtvec,a5
    8000769c:	300027f3          	csrr	a5,mstatus
    800076a0:	0087e793          	ori	a5,a5,8
    800076a4:	30079073          	csrw	mstatus,a5
    800076a8:	304027f3          	csrr	a5,mie
    800076ac:	0807e793          	ori	a5,a5,128
    800076b0:	30479073          	csrw	mie,a5
    800076b4:	00813403          	ld	s0,8(sp)
    800076b8:	01010113          	addi	sp,sp,16
    800076bc:	00008067          	ret

00000000800076c0 <system_main>:
    800076c0:	fe010113          	addi	sp,sp,-32
    800076c4:	00813823          	sd	s0,16(sp)
    800076c8:	00913423          	sd	s1,8(sp)
    800076cc:	00113c23          	sd	ra,24(sp)
    800076d0:	02010413          	addi	s0,sp,32
    800076d4:	00000097          	auipc	ra,0x0
    800076d8:	0c4080e7          	jalr	196(ra) # 80007798 <cpuid>
    800076dc:	00005497          	auipc	s1,0x5
    800076e0:	69448493          	addi	s1,s1,1684 # 8000cd70 <started>
    800076e4:	02050263          	beqz	a0,80007708 <system_main+0x48>
    800076e8:	0004a783          	lw	a5,0(s1)
    800076ec:	0007879b          	sext.w	a5,a5
    800076f0:	fe078ce3          	beqz	a5,800076e8 <system_main+0x28>
    800076f4:	0ff0000f          	fence
    800076f8:	00003517          	auipc	a0,0x3
    800076fc:	02850513          	addi	a0,a0,40 # 8000a720 <_ZZ9kPrintIntmE6digits+0x6b0>
    80007700:	00001097          	auipc	ra,0x1
    80007704:	a7c080e7          	jalr	-1412(ra) # 8000817c <panic>
    80007708:	00001097          	auipc	ra,0x1
    8000770c:	9d0080e7          	jalr	-1584(ra) # 800080d8 <consoleinit>
    80007710:	00001097          	auipc	ra,0x1
    80007714:	15c080e7          	jalr	348(ra) # 8000886c <printfinit>
    80007718:	00003517          	auipc	a0,0x3
    8000771c:	e9050513          	addi	a0,a0,-368 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80007720:	00001097          	auipc	ra,0x1
    80007724:	ab8080e7          	jalr	-1352(ra) # 800081d8 <__printf>
    80007728:	00003517          	auipc	a0,0x3
    8000772c:	fc850513          	addi	a0,a0,-56 # 8000a6f0 <_ZZ9kPrintIntmE6digits+0x680>
    80007730:	00001097          	auipc	ra,0x1
    80007734:	aa8080e7          	jalr	-1368(ra) # 800081d8 <__printf>
    80007738:	00003517          	auipc	a0,0x3
    8000773c:	e7050513          	addi	a0,a0,-400 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    80007740:	00001097          	auipc	ra,0x1
    80007744:	a98080e7          	jalr	-1384(ra) # 800081d8 <__printf>
    80007748:	00001097          	auipc	ra,0x1
    8000774c:	4b0080e7          	jalr	1200(ra) # 80008bf8 <kinit>
    80007750:	00000097          	auipc	ra,0x0
    80007754:	148080e7          	jalr	328(ra) # 80007898 <trapinit>
    80007758:	00000097          	auipc	ra,0x0
    8000775c:	16c080e7          	jalr	364(ra) # 800078c4 <trapinithart>
    80007760:	00000097          	auipc	ra,0x0
    80007764:	5c0080e7          	jalr	1472(ra) # 80007d20 <plicinit>
    80007768:	00000097          	auipc	ra,0x0
    8000776c:	5e0080e7          	jalr	1504(ra) # 80007d48 <plicinithart>
    80007770:	00000097          	auipc	ra,0x0
    80007774:	078080e7          	jalr	120(ra) # 800077e8 <userinit>
    80007778:	0ff0000f          	fence
    8000777c:	00100793          	li	a5,1
    80007780:	00003517          	auipc	a0,0x3
    80007784:	f8850513          	addi	a0,a0,-120 # 8000a708 <_ZZ9kPrintIntmE6digits+0x698>
    80007788:	00f4a023          	sw	a5,0(s1)
    8000778c:	00001097          	auipc	ra,0x1
    80007790:	a4c080e7          	jalr	-1460(ra) # 800081d8 <__printf>
    80007794:	0000006f          	j	80007794 <system_main+0xd4>

0000000080007798 <cpuid>:
    80007798:	ff010113          	addi	sp,sp,-16
    8000779c:	00813423          	sd	s0,8(sp)
    800077a0:	01010413          	addi	s0,sp,16
    800077a4:	00020513          	mv	a0,tp
    800077a8:	00813403          	ld	s0,8(sp)
    800077ac:	0005051b          	sext.w	a0,a0
    800077b0:	01010113          	addi	sp,sp,16
    800077b4:	00008067          	ret

00000000800077b8 <mycpu>:
    800077b8:	ff010113          	addi	sp,sp,-16
    800077bc:	00813423          	sd	s0,8(sp)
    800077c0:	01010413          	addi	s0,sp,16
    800077c4:	00020793          	mv	a5,tp
    800077c8:	00813403          	ld	s0,8(sp)
    800077cc:	0007879b          	sext.w	a5,a5
    800077d0:	00779793          	slli	a5,a5,0x7
    800077d4:	00006517          	auipc	a0,0x6
    800077d8:	77c50513          	addi	a0,a0,1916 # 8000df50 <cpus>
    800077dc:	00f50533          	add	a0,a0,a5
    800077e0:	01010113          	addi	sp,sp,16
    800077e4:	00008067          	ret

00000000800077e8 <userinit>:
    800077e8:	ff010113          	addi	sp,sp,-16
    800077ec:	00813423          	sd	s0,8(sp)
    800077f0:	01010413          	addi	s0,sp,16
    800077f4:	00813403          	ld	s0,8(sp)
    800077f8:	01010113          	addi	sp,sp,16
    800077fc:	ffffc317          	auipc	t1,0xffffc
    80007800:	d6c30067          	jr	-660(t1) # 80003568 <main>

0000000080007804 <either_copyout>:
    80007804:	ff010113          	addi	sp,sp,-16
    80007808:	00813023          	sd	s0,0(sp)
    8000780c:	00113423          	sd	ra,8(sp)
    80007810:	01010413          	addi	s0,sp,16
    80007814:	02051663          	bnez	a0,80007840 <either_copyout+0x3c>
    80007818:	00058513          	mv	a0,a1
    8000781c:	00060593          	mv	a1,a2
    80007820:	0006861b          	sext.w	a2,a3
    80007824:	00002097          	auipc	ra,0x2
    80007828:	c60080e7          	jalr	-928(ra) # 80009484 <__memmove>
    8000782c:	00813083          	ld	ra,8(sp)
    80007830:	00013403          	ld	s0,0(sp)
    80007834:	00000513          	li	a0,0
    80007838:	01010113          	addi	sp,sp,16
    8000783c:	00008067          	ret
    80007840:	00003517          	auipc	a0,0x3
    80007844:	f0850513          	addi	a0,a0,-248 # 8000a748 <_ZZ9kPrintIntmE6digits+0x6d8>
    80007848:	00001097          	auipc	ra,0x1
    8000784c:	934080e7          	jalr	-1740(ra) # 8000817c <panic>

0000000080007850 <either_copyin>:
    80007850:	ff010113          	addi	sp,sp,-16
    80007854:	00813023          	sd	s0,0(sp)
    80007858:	00113423          	sd	ra,8(sp)
    8000785c:	01010413          	addi	s0,sp,16
    80007860:	02059463          	bnez	a1,80007888 <either_copyin+0x38>
    80007864:	00060593          	mv	a1,a2
    80007868:	0006861b          	sext.w	a2,a3
    8000786c:	00002097          	auipc	ra,0x2
    80007870:	c18080e7          	jalr	-1000(ra) # 80009484 <__memmove>
    80007874:	00813083          	ld	ra,8(sp)
    80007878:	00013403          	ld	s0,0(sp)
    8000787c:	00000513          	li	a0,0
    80007880:	01010113          	addi	sp,sp,16
    80007884:	00008067          	ret
    80007888:	00003517          	auipc	a0,0x3
    8000788c:	ee850513          	addi	a0,a0,-280 # 8000a770 <_ZZ9kPrintIntmE6digits+0x700>
    80007890:	00001097          	auipc	ra,0x1
    80007894:	8ec080e7          	jalr	-1812(ra) # 8000817c <panic>

0000000080007898 <trapinit>:
    80007898:	ff010113          	addi	sp,sp,-16
    8000789c:	00813423          	sd	s0,8(sp)
    800078a0:	01010413          	addi	s0,sp,16
    800078a4:	00813403          	ld	s0,8(sp)
    800078a8:	00003597          	auipc	a1,0x3
    800078ac:	ef058593          	addi	a1,a1,-272 # 8000a798 <_ZZ9kPrintIntmE6digits+0x728>
    800078b0:	00006517          	auipc	a0,0x6
    800078b4:	72050513          	addi	a0,a0,1824 # 8000dfd0 <tickslock>
    800078b8:	01010113          	addi	sp,sp,16
    800078bc:	00001317          	auipc	t1,0x1
    800078c0:	5cc30067          	jr	1484(t1) # 80008e88 <initlock>

00000000800078c4 <trapinithart>:
    800078c4:	ff010113          	addi	sp,sp,-16
    800078c8:	00813423          	sd	s0,8(sp)
    800078cc:	01010413          	addi	s0,sp,16
    800078d0:	00000797          	auipc	a5,0x0
    800078d4:	30078793          	addi	a5,a5,768 # 80007bd0 <kernelvec>
    800078d8:	10579073          	csrw	stvec,a5
    800078dc:	00813403          	ld	s0,8(sp)
    800078e0:	01010113          	addi	sp,sp,16
    800078e4:	00008067          	ret

00000000800078e8 <usertrap>:
    800078e8:	ff010113          	addi	sp,sp,-16
    800078ec:	00813423          	sd	s0,8(sp)
    800078f0:	01010413          	addi	s0,sp,16
    800078f4:	00813403          	ld	s0,8(sp)
    800078f8:	01010113          	addi	sp,sp,16
    800078fc:	00008067          	ret

0000000080007900 <usertrapret>:
    80007900:	ff010113          	addi	sp,sp,-16
    80007904:	00813423          	sd	s0,8(sp)
    80007908:	01010413          	addi	s0,sp,16
    8000790c:	00813403          	ld	s0,8(sp)
    80007910:	01010113          	addi	sp,sp,16
    80007914:	00008067          	ret

0000000080007918 <kerneltrap>:
    80007918:	fe010113          	addi	sp,sp,-32
    8000791c:	00813823          	sd	s0,16(sp)
    80007920:	00113c23          	sd	ra,24(sp)
    80007924:	00913423          	sd	s1,8(sp)
    80007928:	02010413          	addi	s0,sp,32
    8000792c:	142025f3          	csrr	a1,scause
    80007930:	100027f3          	csrr	a5,sstatus
    80007934:	0027f793          	andi	a5,a5,2
    80007938:	10079c63          	bnez	a5,80007a50 <kerneltrap+0x138>
    8000793c:	142027f3          	csrr	a5,scause
    80007940:	0207ce63          	bltz	a5,8000797c <kerneltrap+0x64>
    80007944:	00003517          	auipc	a0,0x3
    80007948:	e9c50513          	addi	a0,a0,-356 # 8000a7e0 <_ZZ9kPrintIntmE6digits+0x770>
    8000794c:	00001097          	auipc	ra,0x1
    80007950:	88c080e7          	jalr	-1908(ra) # 800081d8 <__printf>
    80007954:	141025f3          	csrr	a1,sepc
    80007958:	14302673          	csrr	a2,stval
    8000795c:	00003517          	auipc	a0,0x3
    80007960:	e9450513          	addi	a0,a0,-364 # 8000a7f0 <_ZZ9kPrintIntmE6digits+0x780>
    80007964:	00001097          	auipc	ra,0x1
    80007968:	874080e7          	jalr	-1932(ra) # 800081d8 <__printf>
    8000796c:	00003517          	auipc	a0,0x3
    80007970:	e9c50513          	addi	a0,a0,-356 # 8000a808 <_ZZ9kPrintIntmE6digits+0x798>
    80007974:	00001097          	auipc	ra,0x1
    80007978:	808080e7          	jalr	-2040(ra) # 8000817c <panic>
    8000797c:	0ff7f713          	andi	a4,a5,255
    80007980:	00900693          	li	a3,9
    80007984:	04d70063          	beq	a4,a3,800079c4 <kerneltrap+0xac>
    80007988:	fff00713          	li	a4,-1
    8000798c:	03f71713          	slli	a4,a4,0x3f
    80007990:	00170713          	addi	a4,a4,1
    80007994:	fae798e3          	bne	a5,a4,80007944 <kerneltrap+0x2c>
    80007998:	00000097          	auipc	ra,0x0
    8000799c:	e00080e7          	jalr	-512(ra) # 80007798 <cpuid>
    800079a0:	06050663          	beqz	a0,80007a0c <kerneltrap+0xf4>
    800079a4:	144027f3          	csrr	a5,sip
    800079a8:	ffd7f793          	andi	a5,a5,-3
    800079ac:	14479073          	csrw	sip,a5
    800079b0:	01813083          	ld	ra,24(sp)
    800079b4:	01013403          	ld	s0,16(sp)
    800079b8:	00813483          	ld	s1,8(sp)
    800079bc:	02010113          	addi	sp,sp,32
    800079c0:	00008067          	ret
    800079c4:	00000097          	auipc	ra,0x0
    800079c8:	3d0080e7          	jalr	976(ra) # 80007d94 <plic_claim>
    800079cc:	00a00793          	li	a5,10
    800079d0:	00050493          	mv	s1,a0
    800079d4:	06f50863          	beq	a0,a5,80007a44 <kerneltrap+0x12c>
    800079d8:	fc050ce3          	beqz	a0,800079b0 <kerneltrap+0x98>
    800079dc:	00050593          	mv	a1,a0
    800079e0:	00003517          	auipc	a0,0x3
    800079e4:	de050513          	addi	a0,a0,-544 # 8000a7c0 <_ZZ9kPrintIntmE6digits+0x750>
    800079e8:	00000097          	auipc	ra,0x0
    800079ec:	7f0080e7          	jalr	2032(ra) # 800081d8 <__printf>
    800079f0:	01013403          	ld	s0,16(sp)
    800079f4:	01813083          	ld	ra,24(sp)
    800079f8:	00048513          	mv	a0,s1
    800079fc:	00813483          	ld	s1,8(sp)
    80007a00:	02010113          	addi	sp,sp,32
    80007a04:	00000317          	auipc	t1,0x0
    80007a08:	3c830067          	jr	968(t1) # 80007dcc <plic_complete>
    80007a0c:	00006517          	auipc	a0,0x6
    80007a10:	5c450513          	addi	a0,a0,1476 # 8000dfd0 <tickslock>
    80007a14:	00001097          	auipc	ra,0x1
    80007a18:	498080e7          	jalr	1176(ra) # 80008eac <acquire>
    80007a1c:	00005717          	auipc	a4,0x5
    80007a20:	35870713          	addi	a4,a4,856 # 8000cd74 <ticks>
    80007a24:	00072783          	lw	a5,0(a4)
    80007a28:	00006517          	auipc	a0,0x6
    80007a2c:	5a850513          	addi	a0,a0,1448 # 8000dfd0 <tickslock>
    80007a30:	0017879b          	addiw	a5,a5,1
    80007a34:	00f72023          	sw	a5,0(a4)
    80007a38:	00001097          	auipc	ra,0x1
    80007a3c:	540080e7          	jalr	1344(ra) # 80008f78 <release>
    80007a40:	f65ff06f          	j	800079a4 <kerneltrap+0x8c>
    80007a44:	00001097          	auipc	ra,0x1
    80007a48:	09c080e7          	jalr	156(ra) # 80008ae0 <uartintr>
    80007a4c:	fa5ff06f          	j	800079f0 <kerneltrap+0xd8>
    80007a50:	00003517          	auipc	a0,0x3
    80007a54:	d5050513          	addi	a0,a0,-688 # 8000a7a0 <_ZZ9kPrintIntmE6digits+0x730>
    80007a58:	00000097          	auipc	ra,0x0
    80007a5c:	724080e7          	jalr	1828(ra) # 8000817c <panic>

0000000080007a60 <clockintr>:
    80007a60:	fe010113          	addi	sp,sp,-32
    80007a64:	00813823          	sd	s0,16(sp)
    80007a68:	00913423          	sd	s1,8(sp)
    80007a6c:	00113c23          	sd	ra,24(sp)
    80007a70:	02010413          	addi	s0,sp,32
    80007a74:	00006497          	auipc	s1,0x6
    80007a78:	55c48493          	addi	s1,s1,1372 # 8000dfd0 <tickslock>
    80007a7c:	00048513          	mv	a0,s1
    80007a80:	00001097          	auipc	ra,0x1
    80007a84:	42c080e7          	jalr	1068(ra) # 80008eac <acquire>
    80007a88:	00005717          	auipc	a4,0x5
    80007a8c:	2ec70713          	addi	a4,a4,748 # 8000cd74 <ticks>
    80007a90:	00072783          	lw	a5,0(a4)
    80007a94:	01013403          	ld	s0,16(sp)
    80007a98:	01813083          	ld	ra,24(sp)
    80007a9c:	00048513          	mv	a0,s1
    80007aa0:	0017879b          	addiw	a5,a5,1
    80007aa4:	00813483          	ld	s1,8(sp)
    80007aa8:	00f72023          	sw	a5,0(a4)
    80007aac:	02010113          	addi	sp,sp,32
    80007ab0:	00001317          	auipc	t1,0x1
    80007ab4:	4c830067          	jr	1224(t1) # 80008f78 <release>

0000000080007ab8 <devintr>:
    80007ab8:	142027f3          	csrr	a5,scause
    80007abc:	00000513          	li	a0,0
    80007ac0:	0007c463          	bltz	a5,80007ac8 <devintr+0x10>
    80007ac4:	00008067          	ret
    80007ac8:	fe010113          	addi	sp,sp,-32
    80007acc:	00813823          	sd	s0,16(sp)
    80007ad0:	00113c23          	sd	ra,24(sp)
    80007ad4:	00913423          	sd	s1,8(sp)
    80007ad8:	02010413          	addi	s0,sp,32
    80007adc:	0ff7f713          	andi	a4,a5,255
    80007ae0:	00900693          	li	a3,9
    80007ae4:	04d70c63          	beq	a4,a3,80007b3c <devintr+0x84>
    80007ae8:	fff00713          	li	a4,-1
    80007aec:	03f71713          	slli	a4,a4,0x3f
    80007af0:	00170713          	addi	a4,a4,1
    80007af4:	00e78c63          	beq	a5,a4,80007b0c <devintr+0x54>
    80007af8:	01813083          	ld	ra,24(sp)
    80007afc:	01013403          	ld	s0,16(sp)
    80007b00:	00813483          	ld	s1,8(sp)
    80007b04:	02010113          	addi	sp,sp,32
    80007b08:	00008067          	ret
    80007b0c:	00000097          	auipc	ra,0x0
    80007b10:	c8c080e7          	jalr	-884(ra) # 80007798 <cpuid>
    80007b14:	06050663          	beqz	a0,80007b80 <devintr+0xc8>
    80007b18:	144027f3          	csrr	a5,sip
    80007b1c:	ffd7f793          	andi	a5,a5,-3
    80007b20:	14479073          	csrw	sip,a5
    80007b24:	01813083          	ld	ra,24(sp)
    80007b28:	01013403          	ld	s0,16(sp)
    80007b2c:	00813483          	ld	s1,8(sp)
    80007b30:	00200513          	li	a0,2
    80007b34:	02010113          	addi	sp,sp,32
    80007b38:	00008067          	ret
    80007b3c:	00000097          	auipc	ra,0x0
    80007b40:	258080e7          	jalr	600(ra) # 80007d94 <plic_claim>
    80007b44:	00a00793          	li	a5,10
    80007b48:	00050493          	mv	s1,a0
    80007b4c:	06f50663          	beq	a0,a5,80007bb8 <devintr+0x100>
    80007b50:	00100513          	li	a0,1
    80007b54:	fa0482e3          	beqz	s1,80007af8 <devintr+0x40>
    80007b58:	00048593          	mv	a1,s1
    80007b5c:	00003517          	auipc	a0,0x3
    80007b60:	c6450513          	addi	a0,a0,-924 # 8000a7c0 <_ZZ9kPrintIntmE6digits+0x750>
    80007b64:	00000097          	auipc	ra,0x0
    80007b68:	674080e7          	jalr	1652(ra) # 800081d8 <__printf>
    80007b6c:	00048513          	mv	a0,s1
    80007b70:	00000097          	auipc	ra,0x0
    80007b74:	25c080e7          	jalr	604(ra) # 80007dcc <plic_complete>
    80007b78:	00100513          	li	a0,1
    80007b7c:	f7dff06f          	j	80007af8 <devintr+0x40>
    80007b80:	00006517          	auipc	a0,0x6
    80007b84:	45050513          	addi	a0,a0,1104 # 8000dfd0 <tickslock>
    80007b88:	00001097          	auipc	ra,0x1
    80007b8c:	324080e7          	jalr	804(ra) # 80008eac <acquire>
    80007b90:	00005717          	auipc	a4,0x5
    80007b94:	1e470713          	addi	a4,a4,484 # 8000cd74 <ticks>
    80007b98:	00072783          	lw	a5,0(a4)
    80007b9c:	00006517          	auipc	a0,0x6
    80007ba0:	43450513          	addi	a0,a0,1076 # 8000dfd0 <tickslock>
    80007ba4:	0017879b          	addiw	a5,a5,1
    80007ba8:	00f72023          	sw	a5,0(a4)
    80007bac:	00001097          	auipc	ra,0x1
    80007bb0:	3cc080e7          	jalr	972(ra) # 80008f78 <release>
    80007bb4:	f65ff06f          	j	80007b18 <devintr+0x60>
    80007bb8:	00001097          	auipc	ra,0x1
    80007bbc:	f28080e7          	jalr	-216(ra) # 80008ae0 <uartintr>
    80007bc0:	fadff06f          	j	80007b6c <devintr+0xb4>
	...

0000000080007bd0 <kernelvec>:
    80007bd0:	f0010113          	addi	sp,sp,-256
    80007bd4:	00113023          	sd	ra,0(sp)
    80007bd8:	00213423          	sd	sp,8(sp)
    80007bdc:	00313823          	sd	gp,16(sp)
    80007be0:	00413c23          	sd	tp,24(sp)
    80007be4:	02513023          	sd	t0,32(sp)
    80007be8:	02613423          	sd	t1,40(sp)
    80007bec:	02713823          	sd	t2,48(sp)
    80007bf0:	02813c23          	sd	s0,56(sp)
    80007bf4:	04913023          	sd	s1,64(sp)
    80007bf8:	04a13423          	sd	a0,72(sp)
    80007bfc:	04b13823          	sd	a1,80(sp)
    80007c00:	04c13c23          	sd	a2,88(sp)
    80007c04:	06d13023          	sd	a3,96(sp)
    80007c08:	06e13423          	sd	a4,104(sp)
    80007c0c:	06f13823          	sd	a5,112(sp)
    80007c10:	07013c23          	sd	a6,120(sp)
    80007c14:	09113023          	sd	a7,128(sp)
    80007c18:	09213423          	sd	s2,136(sp)
    80007c1c:	09313823          	sd	s3,144(sp)
    80007c20:	09413c23          	sd	s4,152(sp)
    80007c24:	0b513023          	sd	s5,160(sp)
    80007c28:	0b613423          	sd	s6,168(sp)
    80007c2c:	0b713823          	sd	s7,176(sp)
    80007c30:	0b813c23          	sd	s8,184(sp)
    80007c34:	0d913023          	sd	s9,192(sp)
    80007c38:	0da13423          	sd	s10,200(sp)
    80007c3c:	0db13823          	sd	s11,208(sp)
    80007c40:	0dc13c23          	sd	t3,216(sp)
    80007c44:	0fd13023          	sd	t4,224(sp)
    80007c48:	0fe13423          	sd	t5,232(sp)
    80007c4c:	0ff13823          	sd	t6,240(sp)
    80007c50:	cc9ff0ef          	jal	ra,80007918 <kerneltrap>
    80007c54:	00013083          	ld	ra,0(sp)
    80007c58:	00813103          	ld	sp,8(sp)
    80007c5c:	01013183          	ld	gp,16(sp)
    80007c60:	02013283          	ld	t0,32(sp)
    80007c64:	02813303          	ld	t1,40(sp)
    80007c68:	03013383          	ld	t2,48(sp)
    80007c6c:	03813403          	ld	s0,56(sp)
    80007c70:	04013483          	ld	s1,64(sp)
    80007c74:	04813503          	ld	a0,72(sp)
    80007c78:	05013583          	ld	a1,80(sp)
    80007c7c:	05813603          	ld	a2,88(sp)
    80007c80:	06013683          	ld	a3,96(sp)
    80007c84:	06813703          	ld	a4,104(sp)
    80007c88:	07013783          	ld	a5,112(sp)
    80007c8c:	07813803          	ld	a6,120(sp)
    80007c90:	08013883          	ld	a7,128(sp)
    80007c94:	08813903          	ld	s2,136(sp)
    80007c98:	09013983          	ld	s3,144(sp)
    80007c9c:	09813a03          	ld	s4,152(sp)
    80007ca0:	0a013a83          	ld	s5,160(sp)
    80007ca4:	0a813b03          	ld	s6,168(sp)
    80007ca8:	0b013b83          	ld	s7,176(sp)
    80007cac:	0b813c03          	ld	s8,184(sp)
    80007cb0:	0c013c83          	ld	s9,192(sp)
    80007cb4:	0c813d03          	ld	s10,200(sp)
    80007cb8:	0d013d83          	ld	s11,208(sp)
    80007cbc:	0d813e03          	ld	t3,216(sp)
    80007cc0:	0e013e83          	ld	t4,224(sp)
    80007cc4:	0e813f03          	ld	t5,232(sp)
    80007cc8:	0f013f83          	ld	t6,240(sp)
    80007ccc:	10010113          	addi	sp,sp,256
    80007cd0:	10200073          	sret
    80007cd4:	00000013          	nop
    80007cd8:	00000013          	nop
    80007cdc:	00000013          	nop

0000000080007ce0 <timervec>:
    80007ce0:	34051573          	csrrw	a0,mscratch,a0
    80007ce4:	00b53023          	sd	a1,0(a0)
    80007ce8:	00c53423          	sd	a2,8(a0)
    80007cec:	00d53823          	sd	a3,16(a0)
    80007cf0:	01853583          	ld	a1,24(a0)
    80007cf4:	02053603          	ld	a2,32(a0)
    80007cf8:	0005b683          	ld	a3,0(a1)
    80007cfc:	00c686b3          	add	a3,a3,a2
    80007d00:	00d5b023          	sd	a3,0(a1)
    80007d04:	00200593          	li	a1,2
    80007d08:	14459073          	csrw	sip,a1
    80007d0c:	01053683          	ld	a3,16(a0)
    80007d10:	00853603          	ld	a2,8(a0)
    80007d14:	00053583          	ld	a1,0(a0)
    80007d18:	34051573          	csrrw	a0,mscratch,a0
    80007d1c:	30200073          	mret

0000000080007d20 <plicinit>:
    80007d20:	ff010113          	addi	sp,sp,-16
    80007d24:	00813423          	sd	s0,8(sp)
    80007d28:	01010413          	addi	s0,sp,16
    80007d2c:	00813403          	ld	s0,8(sp)
    80007d30:	0c0007b7          	lui	a5,0xc000
    80007d34:	00100713          	li	a4,1
    80007d38:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80007d3c:	00e7a223          	sw	a4,4(a5)
    80007d40:	01010113          	addi	sp,sp,16
    80007d44:	00008067          	ret

0000000080007d48 <plicinithart>:
    80007d48:	ff010113          	addi	sp,sp,-16
    80007d4c:	00813023          	sd	s0,0(sp)
    80007d50:	00113423          	sd	ra,8(sp)
    80007d54:	01010413          	addi	s0,sp,16
    80007d58:	00000097          	auipc	ra,0x0
    80007d5c:	a40080e7          	jalr	-1472(ra) # 80007798 <cpuid>
    80007d60:	0085171b          	slliw	a4,a0,0x8
    80007d64:	0c0027b7          	lui	a5,0xc002
    80007d68:	00e787b3          	add	a5,a5,a4
    80007d6c:	40200713          	li	a4,1026
    80007d70:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007d74:	00813083          	ld	ra,8(sp)
    80007d78:	00013403          	ld	s0,0(sp)
    80007d7c:	00d5151b          	slliw	a0,a0,0xd
    80007d80:	0c2017b7          	lui	a5,0xc201
    80007d84:	00a78533          	add	a0,a5,a0
    80007d88:	00052023          	sw	zero,0(a0)
    80007d8c:	01010113          	addi	sp,sp,16
    80007d90:	00008067          	ret

0000000080007d94 <plic_claim>:
    80007d94:	ff010113          	addi	sp,sp,-16
    80007d98:	00813023          	sd	s0,0(sp)
    80007d9c:	00113423          	sd	ra,8(sp)
    80007da0:	01010413          	addi	s0,sp,16
    80007da4:	00000097          	auipc	ra,0x0
    80007da8:	9f4080e7          	jalr	-1548(ra) # 80007798 <cpuid>
    80007dac:	00813083          	ld	ra,8(sp)
    80007db0:	00013403          	ld	s0,0(sp)
    80007db4:	00d5151b          	slliw	a0,a0,0xd
    80007db8:	0c2017b7          	lui	a5,0xc201
    80007dbc:	00a78533          	add	a0,a5,a0
    80007dc0:	00452503          	lw	a0,4(a0)
    80007dc4:	01010113          	addi	sp,sp,16
    80007dc8:	00008067          	ret

0000000080007dcc <plic_complete>:
    80007dcc:	fe010113          	addi	sp,sp,-32
    80007dd0:	00813823          	sd	s0,16(sp)
    80007dd4:	00913423          	sd	s1,8(sp)
    80007dd8:	00113c23          	sd	ra,24(sp)
    80007ddc:	02010413          	addi	s0,sp,32
    80007de0:	00050493          	mv	s1,a0
    80007de4:	00000097          	auipc	ra,0x0
    80007de8:	9b4080e7          	jalr	-1612(ra) # 80007798 <cpuid>
    80007dec:	01813083          	ld	ra,24(sp)
    80007df0:	01013403          	ld	s0,16(sp)
    80007df4:	00d5179b          	slliw	a5,a0,0xd
    80007df8:	0c201737          	lui	a4,0xc201
    80007dfc:	00f707b3          	add	a5,a4,a5
    80007e00:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007e04:	00813483          	ld	s1,8(sp)
    80007e08:	02010113          	addi	sp,sp,32
    80007e0c:	00008067          	ret

0000000080007e10 <consolewrite>:
    80007e10:	fb010113          	addi	sp,sp,-80
    80007e14:	04813023          	sd	s0,64(sp)
    80007e18:	04113423          	sd	ra,72(sp)
    80007e1c:	02913c23          	sd	s1,56(sp)
    80007e20:	03213823          	sd	s2,48(sp)
    80007e24:	03313423          	sd	s3,40(sp)
    80007e28:	03413023          	sd	s4,32(sp)
    80007e2c:	01513c23          	sd	s5,24(sp)
    80007e30:	05010413          	addi	s0,sp,80
    80007e34:	06c05c63          	blez	a2,80007eac <consolewrite+0x9c>
    80007e38:	00060993          	mv	s3,a2
    80007e3c:	00050a13          	mv	s4,a0
    80007e40:	00058493          	mv	s1,a1
    80007e44:	00000913          	li	s2,0
    80007e48:	fff00a93          	li	s5,-1
    80007e4c:	01c0006f          	j	80007e68 <consolewrite+0x58>
    80007e50:	fbf44503          	lbu	a0,-65(s0)
    80007e54:	0019091b          	addiw	s2,s2,1
    80007e58:	00148493          	addi	s1,s1,1
    80007e5c:	00001097          	auipc	ra,0x1
    80007e60:	a9c080e7          	jalr	-1380(ra) # 800088f8 <uartputc>
    80007e64:	03298063          	beq	s3,s2,80007e84 <consolewrite+0x74>
    80007e68:	00048613          	mv	a2,s1
    80007e6c:	00100693          	li	a3,1
    80007e70:	000a0593          	mv	a1,s4
    80007e74:	fbf40513          	addi	a0,s0,-65
    80007e78:	00000097          	auipc	ra,0x0
    80007e7c:	9d8080e7          	jalr	-1576(ra) # 80007850 <either_copyin>
    80007e80:	fd5518e3          	bne	a0,s5,80007e50 <consolewrite+0x40>
    80007e84:	04813083          	ld	ra,72(sp)
    80007e88:	04013403          	ld	s0,64(sp)
    80007e8c:	03813483          	ld	s1,56(sp)
    80007e90:	02813983          	ld	s3,40(sp)
    80007e94:	02013a03          	ld	s4,32(sp)
    80007e98:	01813a83          	ld	s5,24(sp)
    80007e9c:	00090513          	mv	a0,s2
    80007ea0:	03013903          	ld	s2,48(sp)
    80007ea4:	05010113          	addi	sp,sp,80
    80007ea8:	00008067          	ret
    80007eac:	00000913          	li	s2,0
    80007eb0:	fd5ff06f          	j	80007e84 <consolewrite+0x74>

0000000080007eb4 <consoleread>:
    80007eb4:	f9010113          	addi	sp,sp,-112
    80007eb8:	06813023          	sd	s0,96(sp)
    80007ebc:	04913c23          	sd	s1,88(sp)
    80007ec0:	05213823          	sd	s2,80(sp)
    80007ec4:	05313423          	sd	s3,72(sp)
    80007ec8:	05413023          	sd	s4,64(sp)
    80007ecc:	03513c23          	sd	s5,56(sp)
    80007ed0:	03613823          	sd	s6,48(sp)
    80007ed4:	03713423          	sd	s7,40(sp)
    80007ed8:	03813023          	sd	s8,32(sp)
    80007edc:	06113423          	sd	ra,104(sp)
    80007ee0:	01913c23          	sd	s9,24(sp)
    80007ee4:	07010413          	addi	s0,sp,112
    80007ee8:	00060b93          	mv	s7,a2
    80007eec:	00050913          	mv	s2,a0
    80007ef0:	00058c13          	mv	s8,a1
    80007ef4:	00060b1b          	sext.w	s6,a2
    80007ef8:	00006497          	auipc	s1,0x6
    80007efc:	10048493          	addi	s1,s1,256 # 8000dff8 <cons>
    80007f00:	00400993          	li	s3,4
    80007f04:	fff00a13          	li	s4,-1
    80007f08:	00a00a93          	li	s5,10
    80007f0c:	05705e63          	blez	s7,80007f68 <consoleread+0xb4>
    80007f10:	09c4a703          	lw	a4,156(s1)
    80007f14:	0984a783          	lw	a5,152(s1)
    80007f18:	0007071b          	sext.w	a4,a4
    80007f1c:	08e78463          	beq	a5,a4,80007fa4 <consoleread+0xf0>
    80007f20:	07f7f713          	andi	a4,a5,127
    80007f24:	00e48733          	add	a4,s1,a4
    80007f28:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80007f2c:	0017869b          	addiw	a3,a5,1
    80007f30:	08d4ac23          	sw	a3,152(s1)
    80007f34:	00070c9b          	sext.w	s9,a4
    80007f38:	0b370663          	beq	a4,s3,80007fe4 <consoleread+0x130>
    80007f3c:	00100693          	li	a3,1
    80007f40:	f9f40613          	addi	a2,s0,-97
    80007f44:	000c0593          	mv	a1,s8
    80007f48:	00090513          	mv	a0,s2
    80007f4c:	f8e40fa3          	sb	a4,-97(s0)
    80007f50:	00000097          	auipc	ra,0x0
    80007f54:	8b4080e7          	jalr	-1868(ra) # 80007804 <either_copyout>
    80007f58:	01450863          	beq	a0,s4,80007f68 <consoleread+0xb4>
    80007f5c:	001c0c13          	addi	s8,s8,1
    80007f60:	fffb8b9b          	addiw	s7,s7,-1
    80007f64:	fb5c94e3          	bne	s9,s5,80007f0c <consoleread+0x58>
    80007f68:	000b851b          	sext.w	a0,s7
    80007f6c:	06813083          	ld	ra,104(sp)
    80007f70:	06013403          	ld	s0,96(sp)
    80007f74:	05813483          	ld	s1,88(sp)
    80007f78:	05013903          	ld	s2,80(sp)
    80007f7c:	04813983          	ld	s3,72(sp)
    80007f80:	04013a03          	ld	s4,64(sp)
    80007f84:	03813a83          	ld	s5,56(sp)
    80007f88:	02813b83          	ld	s7,40(sp)
    80007f8c:	02013c03          	ld	s8,32(sp)
    80007f90:	01813c83          	ld	s9,24(sp)
    80007f94:	40ab053b          	subw	a0,s6,a0
    80007f98:	03013b03          	ld	s6,48(sp)
    80007f9c:	07010113          	addi	sp,sp,112
    80007fa0:	00008067          	ret
    80007fa4:	00001097          	auipc	ra,0x1
    80007fa8:	1d8080e7          	jalr	472(ra) # 8000917c <push_on>
    80007fac:	0984a703          	lw	a4,152(s1)
    80007fb0:	09c4a783          	lw	a5,156(s1)
    80007fb4:	0007879b          	sext.w	a5,a5
    80007fb8:	fef70ce3          	beq	a4,a5,80007fb0 <consoleread+0xfc>
    80007fbc:	00001097          	auipc	ra,0x1
    80007fc0:	234080e7          	jalr	564(ra) # 800091f0 <pop_on>
    80007fc4:	0984a783          	lw	a5,152(s1)
    80007fc8:	07f7f713          	andi	a4,a5,127
    80007fcc:	00e48733          	add	a4,s1,a4
    80007fd0:	01874703          	lbu	a4,24(a4)
    80007fd4:	0017869b          	addiw	a3,a5,1
    80007fd8:	08d4ac23          	sw	a3,152(s1)
    80007fdc:	00070c9b          	sext.w	s9,a4
    80007fe0:	f5371ee3          	bne	a4,s3,80007f3c <consoleread+0x88>
    80007fe4:	000b851b          	sext.w	a0,s7
    80007fe8:	f96bf2e3          	bgeu	s7,s6,80007f6c <consoleread+0xb8>
    80007fec:	08f4ac23          	sw	a5,152(s1)
    80007ff0:	f7dff06f          	j	80007f6c <consoleread+0xb8>

0000000080007ff4 <consputc>:
    80007ff4:	10000793          	li	a5,256
    80007ff8:	00f50663          	beq	a0,a5,80008004 <consputc+0x10>
    80007ffc:	00001317          	auipc	t1,0x1
    80008000:	9f430067          	jr	-1548(t1) # 800089f0 <uartputc_sync>
    80008004:	ff010113          	addi	sp,sp,-16
    80008008:	00113423          	sd	ra,8(sp)
    8000800c:	00813023          	sd	s0,0(sp)
    80008010:	01010413          	addi	s0,sp,16
    80008014:	00800513          	li	a0,8
    80008018:	00001097          	auipc	ra,0x1
    8000801c:	9d8080e7          	jalr	-1576(ra) # 800089f0 <uartputc_sync>
    80008020:	02000513          	li	a0,32
    80008024:	00001097          	auipc	ra,0x1
    80008028:	9cc080e7          	jalr	-1588(ra) # 800089f0 <uartputc_sync>
    8000802c:	00013403          	ld	s0,0(sp)
    80008030:	00813083          	ld	ra,8(sp)
    80008034:	00800513          	li	a0,8
    80008038:	01010113          	addi	sp,sp,16
    8000803c:	00001317          	auipc	t1,0x1
    80008040:	9b430067          	jr	-1612(t1) # 800089f0 <uartputc_sync>

0000000080008044 <consoleintr>:
    80008044:	fe010113          	addi	sp,sp,-32
    80008048:	00813823          	sd	s0,16(sp)
    8000804c:	00913423          	sd	s1,8(sp)
    80008050:	01213023          	sd	s2,0(sp)
    80008054:	00113c23          	sd	ra,24(sp)
    80008058:	02010413          	addi	s0,sp,32
    8000805c:	00006917          	auipc	s2,0x6
    80008060:	f9c90913          	addi	s2,s2,-100 # 8000dff8 <cons>
    80008064:	00050493          	mv	s1,a0
    80008068:	00090513          	mv	a0,s2
    8000806c:	00001097          	auipc	ra,0x1
    80008070:	e40080e7          	jalr	-448(ra) # 80008eac <acquire>
    80008074:	02048c63          	beqz	s1,800080ac <consoleintr+0x68>
    80008078:	0a092783          	lw	a5,160(s2)
    8000807c:	09892703          	lw	a4,152(s2)
    80008080:	07f00693          	li	a3,127
    80008084:	40e7873b          	subw	a4,a5,a4
    80008088:	02e6e263          	bltu	a3,a4,800080ac <consoleintr+0x68>
    8000808c:	00d00713          	li	a4,13
    80008090:	04e48063          	beq	s1,a4,800080d0 <consoleintr+0x8c>
    80008094:	07f7f713          	andi	a4,a5,127
    80008098:	00e90733          	add	a4,s2,a4
    8000809c:	0017879b          	addiw	a5,a5,1
    800080a0:	0af92023          	sw	a5,160(s2)
    800080a4:	00970c23          	sb	s1,24(a4)
    800080a8:	08f92e23          	sw	a5,156(s2)
    800080ac:	01013403          	ld	s0,16(sp)
    800080b0:	01813083          	ld	ra,24(sp)
    800080b4:	00813483          	ld	s1,8(sp)
    800080b8:	00013903          	ld	s2,0(sp)
    800080bc:	00006517          	auipc	a0,0x6
    800080c0:	f3c50513          	addi	a0,a0,-196 # 8000dff8 <cons>
    800080c4:	02010113          	addi	sp,sp,32
    800080c8:	00001317          	auipc	t1,0x1
    800080cc:	eb030067          	jr	-336(t1) # 80008f78 <release>
    800080d0:	00a00493          	li	s1,10
    800080d4:	fc1ff06f          	j	80008094 <consoleintr+0x50>

00000000800080d8 <consoleinit>:
    800080d8:	fe010113          	addi	sp,sp,-32
    800080dc:	00113c23          	sd	ra,24(sp)
    800080e0:	00813823          	sd	s0,16(sp)
    800080e4:	00913423          	sd	s1,8(sp)
    800080e8:	02010413          	addi	s0,sp,32
    800080ec:	00006497          	auipc	s1,0x6
    800080f0:	f0c48493          	addi	s1,s1,-244 # 8000dff8 <cons>
    800080f4:	00048513          	mv	a0,s1
    800080f8:	00002597          	auipc	a1,0x2
    800080fc:	72058593          	addi	a1,a1,1824 # 8000a818 <_ZZ9kPrintIntmE6digits+0x7a8>
    80008100:	00001097          	auipc	ra,0x1
    80008104:	d88080e7          	jalr	-632(ra) # 80008e88 <initlock>
    80008108:	00000097          	auipc	ra,0x0
    8000810c:	7ac080e7          	jalr	1964(ra) # 800088b4 <uartinit>
    80008110:	01813083          	ld	ra,24(sp)
    80008114:	01013403          	ld	s0,16(sp)
    80008118:	00000797          	auipc	a5,0x0
    8000811c:	d9c78793          	addi	a5,a5,-612 # 80007eb4 <consoleread>
    80008120:	0af4bc23          	sd	a5,184(s1)
    80008124:	00000797          	auipc	a5,0x0
    80008128:	cec78793          	addi	a5,a5,-788 # 80007e10 <consolewrite>
    8000812c:	0cf4b023          	sd	a5,192(s1)
    80008130:	00813483          	ld	s1,8(sp)
    80008134:	02010113          	addi	sp,sp,32
    80008138:	00008067          	ret

000000008000813c <console_read>:
    8000813c:	ff010113          	addi	sp,sp,-16
    80008140:	00813423          	sd	s0,8(sp)
    80008144:	01010413          	addi	s0,sp,16
    80008148:	00813403          	ld	s0,8(sp)
    8000814c:	00006317          	auipc	t1,0x6
    80008150:	f6433303          	ld	t1,-156(t1) # 8000e0b0 <devsw+0x10>
    80008154:	01010113          	addi	sp,sp,16
    80008158:	00030067          	jr	t1

000000008000815c <console_write>:
    8000815c:	ff010113          	addi	sp,sp,-16
    80008160:	00813423          	sd	s0,8(sp)
    80008164:	01010413          	addi	s0,sp,16
    80008168:	00813403          	ld	s0,8(sp)
    8000816c:	00006317          	auipc	t1,0x6
    80008170:	f4c33303          	ld	t1,-180(t1) # 8000e0b8 <devsw+0x18>
    80008174:	01010113          	addi	sp,sp,16
    80008178:	00030067          	jr	t1

000000008000817c <panic>:
    8000817c:	fe010113          	addi	sp,sp,-32
    80008180:	00113c23          	sd	ra,24(sp)
    80008184:	00813823          	sd	s0,16(sp)
    80008188:	00913423          	sd	s1,8(sp)
    8000818c:	02010413          	addi	s0,sp,32
    80008190:	00050493          	mv	s1,a0
    80008194:	00002517          	auipc	a0,0x2
    80008198:	68c50513          	addi	a0,a0,1676 # 8000a820 <_ZZ9kPrintIntmE6digits+0x7b0>
    8000819c:	00006797          	auipc	a5,0x6
    800081a0:	fa07ae23          	sw	zero,-68(a5) # 8000e158 <pr+0x18>
    800081a4:	00000097          	auipc	ra,0x0
    800081a8:	034080e7          	jalr	52(ra) # 800081d8 <__printf>
    800081ac:	00048513          	mv	a0,s1
    800081b0:	00000097          	auipc	ra,0x0
    800081b4:	028080e7          	jalr	40(ra) # 800081d8 <__printf>
    800081b8:	00002517          	auipc	a0,0x2
    800081bc:	3f050513          	addi	a0,a0,1008 # 8000a5a8 <_ZZ9kPrintIntmE6digits+0x538>
    800081c0:	00000097          	auipc	ra,0x0
    800081c4:	018080e7          	jalr	24(ra) # 800081d8 <__printf>
    800081c8:	00100793          	li	a5,1
    800081cc:	00005717          	auipc	a4,0x5
    800081d0:	baf72623          	sw	a5,-1108(a4) # 8000cd78 <panicked>
    800081d4:	0000006f          	j	800081d4 <panic+0x58>

00000000800081d8 <__printf>:
    800081d8:	f3010113          	addi	sp,sp,-208
    800081dc:	08813023          	sd	s0,128(sp)
    800081e0:	07313423          	sd	s3,104(sp)
    800081e4:	09010413          	addi	s0,sp,144
    800081e8:	05813023          	sd	s8,64(sp)
    800081ec:	08113423          	sd	ra,136(sp)
    800081f0:	06913c23          	sd	s1,120(sp)
    800081f4:	07213823          	sd	s2,112(sp)
    800081f8:	07413023          	sd	s4,96(sp)
    800081fc:	05513c23          	sd	s5,88(sp)
    80008200:	05613823          	sd	s6,80(sp)
    80008204:	05713423          	sd	s7,72(sp)
    80008208:	03913c23          	sd	s9,56(sp)
    8000820c:	03a13823          	sd	s10,48(sp)
    80008210:	03b13423          	sd	s11,40(sp)
    80008214:	00006317          	auipc	t1,0x6
    80008218:	f2c30313          	addi	t1,t1,-212 # 8000e140 <pr>
    8000821c:	01832c03          	lw	s8,24(t1)
    80008220:	00b43423          	sd	a1,8(s0)
    80008224:	00c43823          	sd	a2,16(s0)
    80008228:	00d43c23          	sd	a3,24(s0)
    8000822c:	02e43023          	sd	a4,32(s0)
    80008230:	02f43423          	sd	a5,40(s0)
    80008234:	03043823          	sd	a6,48(s0)
    80008238:	03143c23          	sd	a7,56(s0)
    8000823c:	00050993          	mv	s3,a0
    80008240:	4a0c1663          	bnez	s8,800086ec <__printf+0x514>
    80008244:	60098c63          	beqz	s3,8000885c <__printf+0x684>
    80008248:	0009c503          	lbu	a0,0(s3)
    8000824c:	00840793          	addi	a5,s0,8
    80008250:	f6f43c23          	sd	a5,-136(s0)
    80008254:	00000493          	li	s1,0
    80008258:	22050063          	beqz	a0,80008478 <__printf+0x2a0>
    8000825c:	00002a37          	lui	s4,0x2
    80008260:	00018ab7          	lui	s5,0x18
    80008264:	000f4b37          	lui	s6,0xf4
    80008268:	00989bb7          	lui	s7,0x989
    8000826c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80008270:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80008274:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80008278:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000827c:	00148c9b          	addiw	s9,s1,1
    80008280:	02500793          	li	a5,37
    80008284:	01998933          	add	s2,s3,s9
    80008288:	38f51263          	bne	a0,a5,8000860c <__printf+0x434>
    8000828c:	00094783          	lbu	a5,0(s2)
    80008290:	00078c9b          	sext.w	s9,a5
    80008294:	1e078263          	beqz	a5,80008478 <__printf+0x2a0>
    80008298:	0024849b          	addiw	s1,s1,2
    8000829c:	07000713          	li	a4,112
    800082a0:	00998933          	add	s2,s3,s1
    800082a4:	38e78a63          	beq	a5,a4,80008638 <__printf+0x460>
    800082a8:	20f76863          	bltu	a4,a5,800084b8 <__printf+0x2e0>
    800082ac:	42a78863          	beq	a5,a0,800086dc <__printf+0x504>
    800082b0:	06400713          	li	a4,100
    800082b4:	40e79663          	bne	a5,a4,800086c0 <__printf+0x4e8>
    800082b8:	f7843783          	ld	a5,-136(s0)
    800082bc:	0007a603          	lw	a2,0(a5)
    800082c0:	00878793          	addi	a5,a5,8
    800082c4:	f6f43c23          	sd	a5,-136(s0)
    800082c8:	42064a63          	bltz	a2,800086fc <__printf+0x524>
    800082cc:	00a00713          	li	a4,10
    800082d0:	02e677bb          	remuw	a5,a2,a4
    800082d4:	00002d97          	auipc	s11,0x2
    800082d8:	574d8d93          	addi	s11,s11,1396 # 8000a848 <digits>
    800082dc:	00900593          	li	a1,9
    800082e0:	0006051b          	sext.w	a0,a2
    800082e4:	00000c93          	li	s9,0
    800082e8:	02079793          	slli	a5,a5,0x20
    800082ec:	0207d793          	srli	a5,a5,0x20
    800082f0:	00fd87b3          	add	a5,s11,a5
    800082f4:	0007c783          	lbu	a5,0(a5)
    800082f8:	02e656bb          	divuw	a3,a2,a4
    800082fc:	f8f40023          	sb	a5,-128(s0)
    80008300:	14c5d863          	bge	a1,a2,80008450 <__printf+0x278>
    80008304:	06300593          	li	a1,99
    80008308:	00100c93          	li	s9,1
    8000830c:	02e6f7bb          	remuw	a5,a3,a4
    80008310:	02079793          	slli	a5,a5,0x20
    80008314:	0207d793          	srli	a5,a5,0x20
    80008318:	00fd87b3          	add	a5,s11,a5
    8000831c:	0007c783          	lbu	a5,0(a5)
    80008320:	02e6d73b          	divuw	a4,a3,a4
    80008324:	f8f400a3          	sb	a5,-127(s0)
    80008328:	12a5f463          	bgeu	a1,a0,80008450 <__printf+0x278>
    8000832c:	00a00693          	li	a3,10
    80008330:	00900593          	li	a1,9
    80008334:	02d777bb          	remuw	a5,a4,a3
    80008338:	02079793          	slli	a5,a5,0x20
    8000833c:	0207d793          	srli	a5,a5,0x20
    80008340:	00fd87b3          	add	a5,s11,a5
    80008344:	0007c503          	lbu	a0,0(a5)
    80008348:	02d757bb          	divuw	a5,a4,a3
    8000834c:	f8a40123          	sb	a0,-126(s0)
    80008350:	48e5f263          	bgeu	a1,a4,800087d4 <__printf+0x5fc>
    80008354:	06300513          	li	a0,99
    80008358:	02d7f5bb          	remuw	a1,a5,a3
    8000835c:	02059593          	slli	a1,a1,0x20
    80008360:	0205d593          	srli	a1,a1,0x20
    80008364:	00bd85b3          	add	a1,s11,a1
    80008368:	0005c583          	lbu	a1,0(a1)
    8000836c:	02d7d7bb          	divuw	a5,a5,a3
    80008370:	f8b401a3          	sb	a1,-125(s0)
    80008374:	48e57263          	bgeu	a0,a4,800087f8 <__printf+0x620>
    80008378:	3e700513          	li	a0,999
    8000837c:	02d7f5bb          	remuw	a1,a5,a3
    80008380:	02059593          	slli	a1,a1,0x20
    80008384:	0205d593          	srli	a1,a1,0x20
    80008388:	00bd85b3          	add	a1,s11,a1
    8000838c:	0005c583          	lbu	a1,0(a1)
    80008390:	02d7d7bb          	divuw	a5,a5,a3
    80008394:	f8b40223          	sb	a1,-124(s0)
    80008398:	46e57663          	bgeu	a0,a4,80008804 <__printf+0x62c>
    8000839c:	02d7f5bb          	remuw	a1,a5,a3
    800083a0:	02059593          	slli	a1,a1,0x20
    800083a4:	0205d593          	srli	a1,a1,0x20
    800083a8:	00bd85b3          	add	a1,s11,a1
    800083ac:	0005c583          	lbu	a1,0(a1)
    800083b0:	02d7d7bb          	divuw	a5,a5,a3
    800083b4:	f8b402a3          	sb	a1,-123(s0)
    800083b8:	46ea7863          	bgeu	s4,a4,80008828 <__printf+0x650>
    800083bc:	02d7f5bb          	remuw	a1,a5,a3
    800083c0:	02059593          	slli	a1,a1,0x20
    800083c4:	0205d593          	srli	a1,a1,0x20
    800083c8:	00bd85b3          	add	a1,s11,a1
    800083cc:	0005c583          	lbu	a1,0(a1)
    800083d0:	02d7d7bb          	divuw	a5,a5,a3
    800083d4:	f8b40323          	sb	a1,-122(s0)
    800083d8:	3eeaf863          	bgeu	s5,a4,800087c8 <__printf+0x5f0>
    800083dc:	02d7f5bb          	remuw	a1,a5,a3
    800083e0:	02059593          	slli	a1,a1,0x20
    800083e4:	0205d593          	srli	a1,a1,0x20
    800083e8:	00bd85b3          	add	a1,s11,a1
    800083ec:	0005c583          	lbu	a1,0(a1)
    800083f0:	02d7d7bb          	divuw	a5,a5,a3
    800083f4:	f8b403a3          	sb	a1,-121(s0)
    800083f8:	42eb7e63          	bgeu	s6,a4,80008834 <__printf+0x65c>
    800083fc:	02d7f5bb          	remuw	a1,a5,a3
    80008400:	02059593          	slli	a1,a1,0x20
    80008404:	0205d593          	srli	a1,a1,0x20
    80008408:	00bd85b3          	add	a1,s11,a1
    8000840c:	0005c583          	lbu	a1,0(a1)
    80008410:	02d7d7bb          	divuw	a5,a5,a3
    80008414:	f8b40423          	sb	a1,-120(s0)
    80008418:	42ebfc63          	bgeu	s7,a4,80008850 <__printf+0x678>
    8000841c:	02079793          	slli	a5,a5,0x20
    80008420:	0207d793          	srli	a5,a5,0x20
    80008424:	00fd8db3          	add	s11,s11,a5
    80008428:	000dc703          	lbu	a4,0(s11)
    8000842c:	00a00793          	li	a5,10
    80008430:	00900c93          	li	s9,9
    80008434:	f8e404a3          	sb	a4,-119(s0)
    80008438:	00065c63          	bgez	a2,80008450 <__printf+0x278>
    8000843c:	f9040713          	addi	a4,s0,-112
    80008440:	00f70733          	add	a4,a4,a5
    80008444:	02d00693          	li	a3,45
    80008448:	fed70823          	sb	a3,-16(a4)
    8000844c:	00078c93          	mv	s9,a5
    80008450:	f8040793          	addi	a5,s0,-128
    80008454:	01978cb3          	add	s9,a5,s9
    80008458:	f7f40d13          	addi	s10,s0,-129
    8000845c:	000cc503          	lbu	a0,0(s9)
    80008460:	fffc8c93          	addi	s9,s9,-1
    80008464:	00000097          	auipc	ra,0x0
    80008468:	b90080e7          	jalr	-1136(ra) # 80007ff4 <consputc>
    8000846c:	ffac98e3          	bne	s9,s10,8000845c <__printf+0x284>
    80008470:	00094503          	lbu	a0,0(s2)
    80008474:	e00514e3          	bnez	a0,8000827c <__printf+0xa4>
    80008478:	1a0c1663          	bnez	s8,80008624 <__printf+0x44c>
    8000847c:	08813083          	ld	ra,136(sp)
    80008480:	08013403          	ld	s0,128(sp)
    80008484:	07813483          	ld	s1,120(sp)
    80008488:	07013903          	ld	s2,112(sp)
    8000848c:	06813983          	ld	s3,104(sp)
    80008490:	06013a03          	ld	s4,96(sp)
    80008494:	05813a83          	ld	s5,88(sp)
    80008498:	05013b03          	ld	s6,80(sp)
    8000849c:	04813b83          	ld	s7,72(sp)
    800084a0:	04013c03          	ld	s8,64(sp)
    800084a4:	03813c83          	ld	s9,56(sp)
    800084a8:	03013d03          	ld	s10,48(sp)
    800084ac:	02813d83          	ld	s11,40(sp)
    800084b0:	0d010113          	addi	sp,sp,208
    800084b4:	00008067          	ret
    800084b8:	07300713          	li	a4,115
    800084bc:	1ce78a63          	beq	a5,a4,80008690 <__printf+0x4b8>
    800084c0:	07800713          	li	a4,120
    800084c4:	1ee79e63          	bne	a5,a4,800086c0 <__printf+0x4e8>
    800084c8:	f7843783          	ld	a5,-136(s0)
    800084cc:	0007a703          	lw	a4,0(a5)
    800084d0:	00878793          	addi	a5,a5,8
    800084d4:	f6f43c23          	sd	a5,-136(s0)
    800084d8:	28074263          	bltz	a4,8000875c <__printf+0x584>
    800084dc:	00002d97          	auipc	s11,0x2
    800084e0:	36cd8d93          	addi	s11,s11,876 # 8000a848 <digits>
    800084e4:	00f77793          	andi	a5,a4,15
    800084e8:	00fd87b3          	add	a5,s11,a5
    800084ec:	0007c683          	lbu	a3,0(a5)
    800084f0:	00f00613          	li	a2,15
    800084f4:	0007079b          	sext.w	a5,a4
    800084f8:	f8d40023          	sb	a3,-128(s0)
    800084fc:	0047559b          	srliw	a1,a4,0x4
    80008500:	0047569b          	srliw	a3,a4,0x4
    80008504:	00000c93          	li	s9,0
    80008508:	0ee65063          	bge	a2,a4,800085e8 <__printf+0x410>
    8000850c:	00f6f693          	andi	a3,a3,15
    80008510:	00dd86b3          	add	a3,s11,a3
    80008514:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80008518:	0087d79b          	srliw	a5,a5,0x8
    8000851c:	00100c93          	li	s9,1
    80008520:	f8d400a3          	sb	a3,-127(s0)
    80008524:	0cb67263          	bgeu	a2,a1,800085e8 <__printf+0x410>
    80008528:	00f7f693          	andi	a3,a5,15
    8000852c:	00dd86b3          	add	a3,s11,a3
    80008530:	0006c583          	lbu	a1,0(a3)
    80008534:	00f00613          	li	a2,15
    80008538:	0047d69b          	srliw	a3,a5,0x4
    8000853c:	f8b40123          	sb	a1,-126(s0)
    80008540:	0047d593          	srli	a1,a5,0x4
    80008544:	28f67e63          	bgeu	a2,a5,800087e0 <__printf+0x608>
    80008548:	00f6f693          	andi	a3,a3,15
    8000854c:	00dd86b3          	add	a3,s11,a3
    80008550:	0006c503          	lbu	a0,0(a3)
    80008554:	0087d813          	srli	a6,a5,0x8
    80008558:	0087d69b          	srliw	a3,a5,0x8
    8000855c:	f8a401a3          	sb	a0,-125(s0)
    80008560:	28b67663          	bgeu	a2,a1,800087ec <__printf+0x614>
    80008564:	00f6f693          	andi	a3,a3,15
    80008568:	00dd86b3          	add	a3,s11,a3
    8000856c:	0006c583          	lbu	a1,0(a3)
    80008570:	00c7d513          	srli	a0,a5,0xc
    80008574:	00c7d69b          	srliw	a3,a5,0xc
    80008578:	f8b40223          	sb	a1,-124(s0)
    8000857c:	29067a63          	bgeu	a2,a6,80008810 <__printf+0x638>
    80008580:	00f6f693          	andi	a3,a3,15
    80008584:	00dd86b3          	add	a3,s11,a3
    80008588:	0006c583          	lbu	a1,0(a3)
    8000858c:	0107d813          	srli	a6,a5,0x10
    80008590:	0107d69b          	srliw	a3,a5,0x10
    80008594:	f8b402a3          	sb	a1,-123(s0)
    80008598:	28a67263          	bgeu	a2,a0,8000881c <__printf+0x644>
    8000859c:	00f6f693          	andi	a3,a3,15
    800085a0:	00dd86b3          	add	a3,s11,a3
    800085a4:	0006c683          	lbu	a3,0(a3)
    800085a8:	0147d79b          	srliw	a5,a5,0x14
    800085ac:	f8d40323          	sb	a3,-122(s0)
    800085b0:	21067663          	bgeu	a2,a6,800087bc <__printf+0x5e4>
    800085b4:	02079793          	slli	a5,a5,0x20
    800085b8:	0207d793          	srli	a5,a5,0x20
    800085bc:	00fd8db3          	add	s11,s11,a5
    800085c0:	000dc683          	lbu	a3,0(s11)
    800085c4:	00800793          	li	a5,8
    800085c8:	00700c93          	li	s9,7
    800085cc:	f8d403a3          	sb	a3,-121(s0)
    800085d0:	00075c63          	bgez	a4,800085e8 <__printf+0x410>
    800085d4:	f9040713          	addi	a4,s0,-112
    800085d8:	00f70733          	add	a4,a4,a5
    800085dc:	02d00693          	li	a3,45
    800085e0:	fed70823          	sb	a3,-16(a4)
    800085e4:	00078c93          	mv	s9,a5
    800085e8:	f8040793          	addi	a5,s0,-128
    800085ec:	01978cb3          	add	s9,a5,s9
    800085f0:	f7f40d13          	addi	s10,s0,-129
    800085f4:	000cc503          	lbu	a0,0(s9)
    800085f8:	fffc8c93          	addi	s9,s9,-1
    800085fc:	00000097          	auipc	ra,0x0
    80008600:	9f8080e7          	jalr	-1544(ra) # 80007ff4 <consputc>
    80008604:	ff9d18e3          	bne	s10,s9,800085f4 <__printf+0x41c>
    80008608:	0100006f          	j	80008618 <__printf+0x440>
    8000860c:	00000097          	auipc	ra,0x0
    80008610:	9e8080e7          	jalr	-1560(ra) # 80007ff4 <consputc>
    80008614:	000c8493          	mv	s1,s9
    80008618:	00094503          	lbu	a0,0(s2)
    8000861c:	c60510e3          	bnez	a0,8000827c <__printf+0xa4>
    80008620:	e40c0ee3          	beqz	s8,8000847c <__printf+0x2a4>
    80008624:	00006517          	auipc	a0,0x6
    80008628:	b1c50513          	addi	a0,a0,-1252 # 8000e140 <pr>
    8000862c:	00001097          	auipc	ra,0x1
    80008630:	94c080e7          	jalr	-1716(ra) # 80008f78 <release>
    80008634:	e49ff06f          	j	8000847c <__printf+0x2a4>
    80008638:	f7843783          	ld	a5,-136(s0)
    8000863c:	03000513          	li	a0,48
    80008640:	01000d13          	li	s10,16
    80008644:	00878713          	addi	a4,a5,8
    80008648:	0007bc83          	ld	s9,0(a5)
    8000864c:	f6e43c23          	sd	a4,-136(s0)
    80008650:	00000097          	auipc	ra,0x0
    80008654:	9a4080e7          	jalr	-1628(ra) # 80007ff4 <consputc>
    80008658:	07800513          	li	a0,120
    8000865c:	00000097          	auipc	ra,0x0
    80008660:	998080e7          	jalr	-1640(ra) # 80007ff4 <consputc>
    80008664:	00002d97          	auipc	s11,0x2
    80008668:	1e4d8d93          	addi	s11,s11,484 # 8000a848 <digits>
    8000866c:	03ccd793          	srli	a5,s9,0x3c
    80008670:	00fd87b3          	add	a5,s11,a5
    80008674:	0007c503          	lbu	a0,0(a5)
    80008678:	fffd0d1b          	addiw	s10,s10,-1
    8000867c:	004c9c93          	slli	s9,s9,0x4
    80008680:	00000097          	auipc	ra,0x0
    80008684:	974080e7          	jalr	-1676(ra) # 80007ff4 <consputc>
    80008688:	fe0d12e3          	bnez	s10,8000866c <__printf+0x494>
    8000868c:	f8dff06f          	j	80008618 <__printf+0x440>
    80008690:	f7843783          	ld	a5,-136(s0)
    80008694:	0007bc83          	ld	s9,0(a5)
    80008698:	00878793          	addi	a5,a5,8
    8000869c:	f6f43c23          	sd	a5,-136(s0)
    800086a0:	000c9a63          	bnez	s9,800086b4 <__printf+0x4dc>
    800086a4:	1080006f          	j	800087ac <__printf+0x5d4>
    800086a8:	001c8c93          	addi	s9,s9,1
    800086ac:	00000097          	auipc	ra,0x0
    800086b0:	948080e7          	jalr	-1720(ra) # 80007ff4 <consputc>
    800086b4:	000cc503          	lbu	a0,0(s9)
    800086b8:	fe0518e3          	bnez	a0,800086a8 <__printf+0x4d0>
    800086bc:	f5dff06f          	j	80008618 <__printf+0x440>
    800086c0:	02500513          	li	a0,37
    800086c4:	00000097          	auipc	ra,0x0
    800086c8:	930080e7          	jalr	-1744(ra) # 80007ff4 <consputc>
    800086cc:	000c8513          	mv	a0,s9
    800086d0:	00000097          	auipc	ra,0x0
    800086d4:	924080e7          	jalr	-1756(ra) # 80007ff4 <consputc>
    800086d8:	f41ff06f          	j	80008618 <__printf+0x440>
    800086dc:	02500513          	li	a0,37
    800086e0:	00000097          	auipc	ra,0x0
    800086e4:	914080e7          	jalr	-1772(ra) # 80007ff4 <consputc>
    800086e8:	f31ff06f          	j	80008618 <__printf+0x440>
    800086ec:	00030513          	mv	a0,t1
    800086f0:	00000097          	auipc	ra,0x0
    800086f4:	7bc080e7          	jalr	1980(ra) # 80008eac <acquire>
    800086f8:	b4dff06f          	j	80008244 <__printf+0x6c>
    800086fc:	40c0053b          	negw	a0,a2
    80008700:	00a00713          	li	a4,10
    80008704:	02e576bb          	remuw	a3,a0,a4
    80008708:	00002d97          	auipc	s11,0x2
    8000870c:	140d8d93          	addi	s11,s11,320 # 8000a848 <digits>
    80008710:	ff700593          	li	a1,-9
    80008714:	02069693          	slli	a3,a3,0x20
    80008718:	0206d693          	srli	a3,a3,0x20
    8000871c:	00dd86b3          	add	a3,s11,a3
    80008720:	0006c683          	lbu	a3,0(a3)
    80008724:	02e557bb          	divuw	a5,a0,a4
    80008728:	f8d40023          	sb	a3,-128(s0)
    8000872c:	10b65e63          	bge	a2,a1,80008848 <__printf+0x670>
    80008730:	06300593          	li	a1,99
    80008734:	02e7f6bb          	remuw	a3,a5,a4
    80008738:	02069693          	slli	a3,a3,0x20
    8000873c:	0206d693          	srli	a3,a3,0x20
    80008740:	00dd86b3          	add	a3,s11,a3
    80008744:	0006c683          	lbu	a3,0(a3)
    80008748:	02e7d73b          	divuw	a4,a5,a4
    8000874c:	00200793          	li	a5,2
    80008750:	f8d400a3          	sb	a3,-127(s0)
    80008754:	bca5ece3          	bltu	a1,a0,8000832c <__printf+0x154>
    80008758:	ce5ff06f          	j	8000843c <__printf+0x264>
    8000875c:	40e007bb          	negw	a5,a4
    80008760:	00002d97          	auipc	s11,0x2
    80008764:	0e8d8d93          	addi	s11,s11,232 # 8000a848 <digits>
    80008768:	00f7f693          	andi	a3,a5,15
    8000876c:	00dd86b3          	add	a3,s11,a3
    80008770:	0006c583          	lbu	a1,0(a3)
    80008774:	ff100613          	li	a2,-15
    80008778:	0047d69b          	srliw	a3,a5,0x4
    8000877c:	f8b40023          	sb	a1,-128(s0)
    80008780:	0047d59b          	srliw	a1,a5,0x4
    80008784:	0ac75e63          	bge	a4,a2,80008840 <__printf+0x668>
    80008788:	00f6f693          	andi	a3,a3,15
    8000878c:	00dd86b3          	add	a3,s11,a3
    80008790:	0006c603          	lbu	a2,0(a3)
    80008794:	00f00693          	li	a3,15
    80008798:	0087d79b          	srliw	a5,a5,0x8
    8000879c:	f8c400a3          	sb	a2,-127(s0)
    800087a0:	d8b6e4e3          	bltu	a3,a1,80008528 <__printf+0x350>
    800087a4:	00200793          	li	a5,2
    800087a8:	e2dff06f          	j	800085d4 <__printf+0x3fc>
    800087ac:	00002c97          	auipc	s9,0x2
    800087b0:	07cc8c93          	addi	s9,s9,124 # 8000a828 <_ZZ9kPrintIntmE6digits+0x7b8>
    800087b4:	02800513          	li	a0,40
    800087b8:	ef1ff06f          	j	800086a8 <__printf+0x4d0>
    800087bc:	00700793          	li	a5,7
    800087c0:	00600c93          	li	s9,6
    800087c4:	e0dff06f          	j	800085d0 <__printf+0x3f8>
    800087c8:	00700793          	li	a5,7
    800087cc:	00600c93          	li	s9,6
    800087d0:	c69ff06f          	j	80008438 <__printf+0x260>
    800087d4:	00300793          	li	a5,3
    800087d8:	00200c93          	li	s9,2
    800087dc:	c5dff06f          	j	80008438 <__printf+0x260>
    800087e0:	00300793          	li	a5,3
    800087e4:	00200c93          	li	s9,2
    800087e8:	de9ff06f          	j	800085d0 <__printf+0x3f8>
    800087ec:	00400793          	li	a5,4
    800087f0:	00300c93          	li	s9,3
    800087f4:	dddff06f          	j	800085d0 <__printf+0x3f8>
    800087f8:	00400793          	li	a5,4
    800087fc:	00300c93          	li	s9,3
    80008800:	c39ff06f          	j	80008438 <__printf+0x260>
    80008804:	00500793          	li	a5,5
    80008808:	00400c93          	li	s9,4
    8000880c:	c2dff06f          	j	80008438 <__printf+0x260>
    80008810:	00500793          	li	a5,5
    80008814:	00400c93          	li	s9,4
    80008818:	db9ff06f          	j	800085d0 <__printf+0x3f8>
    8000881c:	00600793          	li	a5,6
    80008820:	00500c93          	li	s9,5
    80008824:	dadff06f          	j	800085d0 <__printf+0x3f8>
    80008828:	00600793          	li	a5,6
    8000882c:	00500c93          	li	s9,5
    80008830:	c09ff06f          	j	80008438 <__printf+0x260>
    80008834:	00800793          	li	a5,8
    80008838:	00700c93          	li	s9,7
    8000883c:	bfdff06f          	j	80008438 <__printf+0x260>
    80008840:	00100793          	li	a5,1
    80008844:	d91ff06f          	j	800085d4 <__printf+0x3fc>
    80008848:	00100793          	li	a5,1
    8000884c:	bf1ff06f          	j	8000843c <__printf+0x264>
    80008850:	00900793          	li	a5,9
    80008854:	00800c93          	li	s9,8
    80008858:	be1ff06f          	j	80008438 <__printf+0x260>
    8000885c:	00002517          	auipc	a0,0x2
    80008860:	fd450513          	addi	a0,a0,-44 # 8000a830 <_ZZ9kPrintIntmE6digits+0x7c0>
    80008864:	00000097          	auipc	ra,0x0
    80008868:	918080e7          	jalr	-1768(ra) # 8000817c <panic>

000000008000886c <printfinit>:
    8000886c:	fe010113          	addi	sp,sp,-32
    80008870:	00813823          	sd	s0,16(sp)
    80008874:	00913423          	sd	s1,8(sp)
    80008878:	00113c23          	sd	ra,24(sp)
    8000887c:	02010413          	addi	s0,sp,32
    80008880:	00006497          	auipc	s1,0x6
    80008884:	8c048493          	addi	s1,s1,-1856 # 8000e140 <pr>
    80008888:	00048513          	mv	a0,s1
    8000888c:	00002597          	auipc	a1,0x2
    80008890:	fb458593          	addi	a1,a1,-76 # 8000a840 <_ZZ9kPrintIntmE6digits+0x7d0>
    80008894:	00000097          	auipc	ra,0x0
    80008898:	5f4080e7          	jalr	1524(ra) # 80008e88 <initlock>
    8000889c:	01813083          	ld	ra,24(sp)
    800088a0:	01013403          	ld	s0,16(sp)
    800088a4:	0004ac23          	sw	zero,24(s1)
    800088a8:	00813483          	ld	s1,8(sp)
    800088ac:	02010113          	addi	sp,sp,32
    800088b0:	00008067          	ret

00000000800088b4 <uartinit>:
    800088b4:	ff010113          	addi	sp,sp,-16
    800088b8:	00813423          	sd	s0,8(sp)
    800088bc:	01010413          	addi	s0,sp,16
    800088c0:	100007b7          	lui	a5,0x10000
    800088c4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800088c8:	f8000713          	li	a4,-128
    800088cc:	00e781a3          	sb	a4,3(a5)
    800088d0:	00300713          	li	a4,3
    800088d4:	00e78023          	sb	a4,0(a5)
    800088d8:	000780a3          	sb	zero,1(a5)
    800088dc:	00e781a3          	sb	a4,3(a5)
    800088e0:	00700693          	li	a3,7
    800088e4:	00d78123          	sb	a3,2(a5)
    800088e8:	00e780a3          	sb	a4,1(a5)
    800088ec:	00813403          	ld	s0,8(sp)
    800088f0:	01010113          	addi	sp,sp,16
    800088f4:	00008067          	ret

00000000800088f8 <uartputc>:
    800088f8:	00004797          	auipc	a5,0x4
    800088fc:	4807a783          	lw	a5,1152(a5) # 8000cd78 <panicked>
    80008900:	00078463          	beqz	a5,80008908 <uartputc+0x10>
    80008904:	0000006f          	j	80008904 <uartputc+0xc>
    80008908:	fd010113          	addi	sp,sp,-48
    8000890c:	02813023          	sd	s0,32(sp)
    80008910:	00913c23          	sd	s1,24(sp)
    80008914:	01213823          	sd	s2,16(sp)
    80008918:	01313423          	sd	s3,8(sp)
    8000891c:	02113423          	sd	ra,40(sp)
    80008920:	03010413          	addi	s0,sp,48
    80008924:	00004917          	auipc	s2,0x4
    80008928:	45c90913          	addi	s2,s2,1116 # 8000cd80 <uart_tx_r>
    8000892c:	00093783          	ld	a5,0(s2)
    80008930:	00004497          	auipc	s1,0x4
    80008934:	45848493          	addi	s1,s1,1112 # 8000cd88 <uart_tx_w>
    80008938:	0004b703          	ld	a4,0(s1)
    8000893c:	02078693          	addi	a3,a5,32
    80008940:	00050993          	mv	s3,a0
    80008944:	02e69c63          	bne	a3,a4,8000897c <uartputc+0x84>
    80008948:	00001097          	auipc	ra,0x1
    8000894c:	834080e7          	jalr	-1996(ra) # 8000917c <push_on>
    80008950:	00093783          	ld	a5,0(s2)
    80008954:	0004b703          	ld	a4,0(s1)
    80008958:	02078793          	addi	a5,a5,32
    8000895c:	00e79463          	bne	a5,a4,80008964 <uartputc+0x6c>
    80008960:	0000006f          	j	80008960 <uartputc+0x68>
    80008964:	00001097          	auipc	ra,0x1
    80008968:	88c080e7          	jalr	-1908(ra) # 800091f0 <pop_on>
    8000896c:	00093783          	ld	a5,0(s2)
    80008970:	0004b703          	ld	a4,0(s1)
    80008974:	02078693          	addi	a3,a5,32
    80008978:	fce688e3          	beq	a3,a4,80008948 <uartputc+0x50>
    8000897c:	01f77693          	andi	a3,a4,31
    80008980:	00005597          	auipc	a1,0x5
    80008984:	7e058593          	addi	a1,a1,2016 # 8000e160 <uart_tx_buf>
    80008988:	00d586b3          	add	a3,a1,a3
    8000898c:	00170713          	addi	a4,a4,1
    80008990:	01368023          	sb	s3,0(a3)
    80008994:	00e4b023          	sd	a4,0(s1)
    80008998:	10000637          	lui	a2,0x10000
    8000899c:	02f71063          	bne	a4,a5,800089bc <uartputc+0xc4>
    800089a0:	0340006f          	j	800089d4 <uartputc+0xdc>
    800089a4:	00074703          	lbu	a4,0(a4)
    800089a8:	00f93023          	sd	a5,0(s2)
    800089ac:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800089b0:	00093783          	ld	a5,0(s2)
    800089b4:	0004b703          	ld	a4,0(s1)
    800089b8:	00f70e63          	beq	a4,a5,800089d4 <uartputc+0xdc>
    800089bc:	00564683          	lbu	a3,5(a2)
    800089c0:	01f7f713          	andi	a4,a5,31
    800089c4:	00e58733          	add	a4,a1,a4
    800089c8:	0206f693          	andi	a3,a3,32
    800089cc:	00178793          	addi	a5,a5,1
    800089d0:	fc069ae3          	bnez	a3,800089a4 <uartputc+0xac>
    800089d4:	02813083          	ld	ra,40(sp)
    800089d8:	02013403          	ld	s0,32(sp)
    800089dc:	01813483          	ld	s1,24(sp)
    800089e0:	01013903          	ld	s2,16(sp)
    800089e4:	00813983          	ld	s3,8(sp)
    800089e8:	03010113          	addi	sp,sp,48
    800089ec:	00008067          	ret

00000000800089f0 <uartputc_sync>:
    800089f0:	ff010113          	addi	sp,sp,-16
    800089f4:	00813423          	sd	s0,8(sp)
    800089f8:	01010413          	addi	s0,sp,16
    800089fc:	00004717          	auipc	a4,0x4
    80008a00:	37c72703          	lw	a4,892(a4) # 8000cd78 <panicked>
    80008a04:	02071663          	bnez	a4,80008a30 <uartputc_sync+0x40>
    80008a08:	00050793          	mv	a5,a0
    80008a0c:	100006b7          	lui	a3,0x10000
    80008a10:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008a14:	02077713          	andi	a4,a4,32
    80008a18:	fe070ce3          	beqz	a4,80008a10 <uartputc_sync+0x20>
    80008a1c:	0ff7f793          	andi	a5,a5,255
    80008a20:	00f68023          	sb	a5,0(a3)
    80008a24:	00813403          	ld	s0,8(sp)
    80008a28:	01010113          	addi	sp,sp,16
    80008a2c:	00008067          	ret
    80008a30:	0000006f          	j	80008a30 <uartputc_sync+0x40>

0000000080008a34 <uartstart>:
    80008a34:	ff010113          	addi	sp,sp,-16
    80008a38:	00813423          	sd	s0,8(sp)
    80008a3c:	01010413          	addi	s0,sp,16
    80008a40:	00004617          	auipc	a2,0x4
    80008a44:	34060613          	addi	a2,a2,832 # 8000cd80 <uart_tx_r>
    80008a48:	00004517          	auipc	a0,0x4
    80008a4c:	34050513          	addi	a0,a0,832 # 8000cd88 <uart_tx_w>
    80008a50:	00063783          	ld	a5,0(a2)
    80008a54:	00053703          	ld	a4,0(a0)
    80008a58:	04f70263          	beq	a4,a5,80008a9c <uartstart+0x68>
    80008a5c:	100005b7          	lui	a1,0x10000
    80008a60:	00005817          	auipc	a6,0x5
    80008a64:	70080813          	addi	a6,a6,1792 # 8000e160 <uart_tx_buf>
    80008a68:	01c0006f          	j	80008a84 <uartstart+0x50>
    80008a6c:	0006c703          	lbu	a4,0(a3)
    80008a70:	00f63023          	sd	a5,0(a2)
    80008a74:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008a78:	00063783          	ld	a5,0(a2)
    80008a7c:	00053703          	ld	a4,0(a0)
    80008a80:	00f70e63          	beq	a4,a5,80008a9c <uartstart+0x68>
    80008a84:	01f7f713          	andi	a4,a5,31
    80008a88:	00e806b3          	add	a3,a6,a4
    80008a8c:	0055c703          	lbu	a4,5(a1)
    80008a90:	00178793          	addi	a5,a5,1
    80008a94:	02077713          	andi	a4,a4,32
    80008a98:	fc071ae3          	bnez	a4,80008a6c <uartstart+0x38>
    80008a9c:	00813403          	ld	s0,8(sp)
    80008aa0:	01010113          	addi	sp,sp,16
    80008aa4:	00008067          	ret

0000000080008aa8 <uartgetc>:
    80008aa8:	ff010113          	addi	sp,sp,-16
    80008aac:	00813423          	sd	s0,8(sp)
    80008ab0:	01010413          	addi	s0,sp,16
    80008ab4:	10000737          	lui	a4,0x10000
    80008ab8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80008abc:	0017f793          	andi	a5,a5,1
    80008ac0:	00078c63          	beqz	a5,80008ad8 <uartgetc+0x30>
    80008ac4:	00074503          	lbu	a0,0(a4)
    80008ac8:	0ff57513          	andi	a0,a0,255
    80008acc:	00813403          	ld	s0,8(sp)
    80008ad0:	01010113          	addi	sp,sp,16
    80008ad4:	00008067          	ret
    80008ad8:	fff00513          	li	a0,-1
    80008adc:	ff1ff06f          	j	80008acc <uartgetc+0x24>

0000000080008ae0 <uartintr>:
    80008ae0:	100007b7          	lui	a5,0x10000
    80008ae4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008ae8:	0017f793          	andi	a5,a5,1
    80008aec:	0a078463          	beqz	a5,80008b94 <uartintr+0xb4>
    80008af0:	fe010113          	addi	sp,sp,-32
    80008af4:	00813823          	sd	s0,16(sp)
    80008af8:	00913423          	sd	s1,8(sp)
    80008afc:	00113c23          	sd	ra,24(sp)
    80008b00:	02010413          	addi	s0,sp,32
    80008b04:	100004b7          	lui	s1,0x10000
    80008b08:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80008b0c:	0ff57513          	andi	a0,a0,255
    80008b10:	fffff097          	auipc	ra,0xfffff
    80008b14:	534080e7          	jalr	1332(ra) # 80008044 <consoleintr>
    80008b18:	0054c783          	lbu	a5,5(s1)
    80008b1c:	0017f793          	andi	a5,a5,1
    80008b20:	fe0794e3          	bnez	a5,80008b08 <uartintr+0x28>
    80008b24:	00004617          	auipc	a2,0x4
    80008b28:	25c60613          	addi	a2,a2,604 # 8000cd80 <uart_tx_r>
    80008b2c:	00004517          	auipc	a0,0x4
    80008b30:	25c50513          	addi	a0,a0,604 # 8000cd88 <uart_tx_w>
    80008b34:	00063783          	ld	a5,0(a2)
    80008b38:	00053703          	ld	a4,0(a0)
    80008b3c:	04f70263          	beq	a4,a5,80008b80 <uartintr+0xa0>
    80008b40:	100005b7          	lui	a1,0x10000
    80008b44:	00005817          	auipc	a6,0x5
    80008b48:	61c80813          	addi	a6,a6,1564 # 8000e160 <uart_tx_buf>
    80008b4c:	01c0006f          	j	80008b68 <uartintr+0x88>
    80008b50:	0006c703          	lbu	a4,0(a3)
    80008b54:	00f63023          	sd	a5,0(a2)
    80008b58:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008b5c:	00063783          	ld	a5,0(a2)
    80008b60:	00053703          	ld	a4,0(a0)
    80008b64:	00f70e63          	beq	a4,a5,80008b80 <uartintr+0xa0>
    80008b68:	01f7f713          	andi	a4,a5,31
    80008b6c:	00e806b3          	add	a3,a6,a4
    80008b70:	0055c703          	lbu	a4,5(a1)
    80008b74:	00178793          	addi	a5,a5,1
    80008b78:	02077713          	andi	a4,a4,32
    80008b7c:	fc071ae3          	bnez	a4,80008b50 <uartintr+0x70>
    80008b80:	01813083          	ld	ra,24(sp)
    80008b84:	01013403          	ld	s0,16(sp)
    80008b88:	00813483          	ld	s1,8(sp)
    80008b8c:	02010113          	addi	sp,sp,32
    80008b90:	00008067          	ret
    80008b94:	00004617          	auipc	a2,0x4
    80008b98:	1ec60613          	addi	a2,a2,492 # 8000cd80 <uart_tx_r>
    80008b9c:	00004517          	auipc	a0,0x4
    80008ba0:	1ec50513          	addi	a0,a0,492 # 8000cd88 <uart_tx_w>
    80008ba4:	00063783          	ld	a5,0(a2)
    80008ba8:	00053703          	ld	a4,0(a0)
    80008bac:	04f70263          	beq	a4,a5,80008bf0 <uartintr+0x110>
    80008bb0:	100005b7          	lui	a1,0x10000
    80008bb4:	00005817          	auipc	a6,0x5
    80008bb8:	5ac80813          	addi	a6,a6,1452 # 8000e160 <uart_tx_buf>
    80008bbc:	01c0006f          	j	80008bd8 <uartintr+0xf8>
    80008bc0:	0006c703          	lbu	a4,0(a3)
    80008bc4:	00f63023          	sd	a5,0(a2)
    80008bc8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008bcc:	00063783          	ld	a5,0(a2)
    80008bd0:	00053703          	ld	a4,0(a0)
    80008bd4:	02f70063          	beq	a4,a5,80008bf4 <uartintr+0x114>
    80008bd8:	01f7f713          	andi	a4,a5,31
    80008bdc:	00e806b3          	add	a3,a6,a4
    80008be0:	0055c703          	lbu	a4,5(a1)
    80008be4:	00178793          	addi	a5,a5,1
    80008be8:	02077713          	andi	a4,a4,32
    80008bec:	fc071ae3          	bnez	a4,80008bc0 <uartintr+0xe0>
    80008bf0:	00008067          	ret
    80008bf4:	00008067          	ret

0000000080008bf8 <kinit>:
    80008bf8:	fc010113          	addi	sp,sp,-64
    80008bfc:	02913423          	sd	s1,40(sp)
    80008c00:	fffff7b7          	lui	a5,0xfffff
    80008c04:	00006497          	auipc	s1,0x6
    80008c08:	57b48493          	addi	s1,s1,1403 # 8000f17f <end+0xfff>
    80008c0c:	02813823          	sd	s0,48(sp)
    80008c10:	01313c23          	sd	s3,24(sp)
    80008c14:	00f4f4b3          	and	s1,s1,a5
    80008c18:	02113c23          	sd	ra,56(sp)
    80008c1c:	03213023          	sd	s2,32(sp)
    80008c20:	01413823          	sd	s4,16(sp)
    80008c24:	01513423          	sd	s5,8(sp)
    80008c28:	04010413          	addi	s0,sp,64
    80008c2c:	000017b7          	lui	a5,0x1
    80008c30:	01100993          	li	s3,17
    80008c34:	00f487b3          	add	a5,s1,a5
    80008c38:	01b99993          	slli	s3,s3,0x1b
    80008c3c:	06f9e063          	bltu	s3,a5,80008c9c <kinit+0xa4>
    80008c40:	00005a97          	auipc	s5,0x5
    80008c44:	540a8a93          	addi	s5,s5,1344 # 8000e180 <end>
    80008c48:	0754ec63          	bltu	s1,s5,80008cc0 <kinit+0xc8>
    80008c4c:	0734fa63          	bgeu	s1,s3,80008cc0 <kinit+0xc8>
    80008c50:	00088a37          	lui	s4,0x88
    80008c54:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008c58:	00004917          	auipc	s2,0x4
    80008c5c:	13890913          	addi	s2,s2,312 # 8000cd90 <kmem>
    80008c60:	00ca1a13          	slli	s4,s4,0xc
    80008c64:	0140006f          	j	80008c78 <kinit+0x80>
    80008c68:	000017b7          	lui	a5,0x1
    80008c6c:	00f484b3          	add	s1,s1,a5
    80008c70:	0554e863          	bltu	s1,s5,80008cc0 <kinit+0xc8>
    80008c74:	0534f663          	bgeu	s1,s3,80008cc0 <kinit+0xc8>
    80008c78:	00001637          	lui	a2,0x1
    80008c7c:	00100593          	li	a1,1
    80008c80:	00048513          	mv	a0,s1
    80008c84:	00000097          	auipc	ra,0x0
    80008c88:	5e4080e7          	jalr	1508(ra) # 80009268 <__memset>
    80008c8c:	00093783          	ld	a5,0(s2)
    80008c90:	00f4b023          	sd	a5,0(s1)
    80008c94:	00993023          	sd	s1,0(s2)
    80008c98:	fd4498e3          	bne	s1,s4,80008c68 <kinit+0x70>
    80008c9c:	03813083          	ld	ra,56(sp)
    80008ca0:	03013403          	ld	s0,48(sp)
    80008ca4:	02813483          	ld	s1,40(sp)
    80008ca8:	02013903          	ld	s2,32(sp)
    80008cac:	01813983          	ld	s3,24(sp)
    80008cb0:	01013a03          	ld	s4,16(sp)
    80008cb4:	00813a83          	ld	s5,8(sp)
    80008cb8:	04010113          	addi	sp,sp,64
    80008cbc:	00008067          	ret
    80008cc0:	00002517          	auipc	a0,0x2
    80008cc4:	ba050513          	addi	a0,a0,-1120 # 8000a860 <digits+0x18>
    80008cc8:	fffff097          	auipc	ra,0xfffff
    80008ccc:	4b4080e7          	jalr	1204(ra) # 8000817c <panic>

0000000080008cd0 <freerange>:
    80008cd0:	fc010113          	addi	sp,sp,-64
    80008cd4:	000017b7          	lui	a5,0x1
    80008cd8:	02913423          	sd	s1,40(sp)
    80008cdc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008ce0:	009504b3          	add	s1,a0,s1
    80008ce4:	fffff537          	lui	a0,0xfffff
    80008ce8:	02813823          	sd	s0,48(sp)
    80008cec:	02113c23          	sd	ra,56(sp)
    80008cf0:	03213023          	sd	s2,32(sp)
    80008cf4:	01313c23          	sd	s3,24(sp)
    80008cf8:	01413823          	sd	s4,16(sp)
    80008cfc:	01513423          	sd	s5,8(sp)
    80008d00:	01613023          	sd	s6,0(sp)
    80008d04:	04010413          	addi	s0,sp,64
    80008d08:	00a4f4b3          	and	s1,s1,a0
    80008d0c:	00f487b3          	add	a5,s1,a5
    80008d10:	06f5e463          	bltu	a1,a5,80008d78 <freerange+0xa8>
    80008d14:	00005a97          	auipc	s5,0x5
    80008d18:	46ca8a93          	addi	s5,s5,1132 # 8000e180 <end>
    80008d1c:	0954e263          	bltu	s1,s5,80008da0 <freerange+0xd0>
    80008d20:	01100993          	li	s3,17
    80008d24:	01b99993          	slli	s3,s3,0x1b
    80008d28:	0734fc63          	bgeu	s1,s3,80008da0 <freerange+0xd0>
    80008d2c:	00058a13          	mv	s4,a1
    80008d30:	00004917          	auipc	s2,0x4
    80008d34:	06090913          	addi	s2,s2,96 # 8000cd90 <kmem>
    80008d38:	00002b37          	lui	s6,0x2
    80008d3c:	0140006f          	j	80008d50 <freerange+0x80>
    80008d40:	000017b7          	lui	a5,0x1
    80008d44:	00f484b3          	add	s1,s1,a5
    80008d48:	0554ec63          	bltu	s1,s5,80008da0 <freerange+0xd0>
    80008d4c:	0534fa63          	bgeu	s1,s3,80008da0 <freerange+0xd0>
    80008d50:	00001637          	lui	a2,0x1
    80008d54:	00100593          	li	a1,1
    80008d58:	00048513          	mv	a0,s1
    80008d5c:	00000097          	auipc	ra,0x0
    80008d60:	50c080e7          	jalr	1292(ra) # 80009268 <__memset>
    80008d64:	00093703          	ld	a4,0(s2)
    80008d68:	016487b3          	add	a5,s1,s6
    80008d6c:	00e4b023          	sd	a4,0(s1)
    80008d70:	00993023          	sd	s1,0(s2)
    80008d74:	fcfa76e3          	bgeu	s4,a5,80008d40 <freerange+0x70>
    80008d78:	03813083          	ld	ra,56(sp)
    80008d7c:	03013403          	ld	s0,48(sp)
    80008d80:	02813483          	ld	s1,40(sp)
    80008d84:	02013903          	ld	s2,32(sp)
    80008d88:	01813983          	ld	s3,24(sp)
    80008d8c:	01013a03          	ld	s4,16(sp)
    80008d90:	00813a83          	ld	s5,8(sp)
    80008d94:	00013b03          	ld	s6,0(sp)
    80008d98:	04010113          	addi	sp,sp,64
    80008d9c:	00008067          	ret
    80008da0:	00002517          	auipc	a0,0x2
    80008da4:	ac050513          	addi	a0,a0,-1344 # 8000a860 <digits+0x18>
    80008da8:	fffff097          	auipc	ra,0xfffff
    80008dac:	3d4080e7          	jalr	980(ra) # 8000817c <panic>

0000000080008db0 <kfree>:
    80008db0:	fe010113          	addi	sp,sp,-32
    80008db4:	00813823          	sd	s0,16(sp)
    80008db8:	00113c23          	sd	ra,24(sp)
    80008dbc:	00913423          	sd	s1,8(sp)
    80008dc0:	02010413          	addi	s0,sp,32
    80008dc4:	03451793          	slli	a5,a0,0x34
    80008dc8:	04079c63          	bnez	a5,80008e20 <kfree+0x70>
    80008dcc:	00005797          	auipc	a5,0x5
    80008dd0:	3b478793          	addi	a5,a5,948 # 8000e180 <end>
    80008dd4:	00050493          	mv	s1,a0
    80008dd8:	04f56463          	bltu	a0,a5,80008e20 <kfree+0x70>
    80008ddc:	01100793          	li	a5,17
    80008de0:	01b79793          	slli	a5,a5,0x1b
    80008de4:	02f57e63          	bgeu	a0,a5,80008e20 <kfree+0x70>
    80008de8:	00001637          	lui	a2,0x1
    80008dec:	00100593          	li	a1,1
    80008df0:	00000097          	auipc	ra,0x0
    80008df4:	478080e7          	jalr	1144(ra) # 80009268 <__memset>
    80008df8:	00004797          	auipc	a5,0x4
    80008dfc:	f9878793          	addi	a5,a5,-104 # 8000cd90 <kmem>
    80008e00:	0007b703          	ld	a4,0(a5)
    80008e04:	01813083          	ld	ra,24(sp)
    80008e08:	01013403          	ld	s0,16(sp)
    80008e0c:	00e4b023          	sd	a4,0(s1)
    80008e10:	0097b023          	sd	s1,0(a5)
    80008e14:	00813483          	ld	s1,8(sp)
    80008e18:	02010113          	addi	sp,sp,32
    80008e1c:	00008067          	ret
    80008e20:	00002517          	auipc	a0,0x2
    80008e24:	a4050513          	addi	a0,a0,-1472 # 8000a860 <digits+0x18>
    80008e28:	fffff097          	auipc	ra,0xfffff
    80008e2c:	354080e7          	jalr	852(ra) # 8000817c <panic>

0000000080008e30 <kalloc>:
    80008e30:	fe010113          	addi	sp,sp,-32
    80008e34:	00813823          	sd	s0,16(sp)
    80008e38:	00913423          	sd	s1,8(sp)
    80008e3c:	00113c23          	sd	ra,24(sp)
    80008e40:	02010413          	addi	s0,sp,32
    80008e44:	00004797          	auipc	a5,0x4
    80008e48:	f4c78793          	addi	a5,a5,-180 # 8000cd90 <kmem>
    80008e4c:	0007b483          	ld	s1,0(a5)
    80008e50:	02048063          	beqz	s1,80008e70 <kalloc+0x40>
    80008e54:	0004b703          	ld	a4,0(s1)
    80008e58:	00001637          	lui	a2,0x1
    80008e5c:	00500593          	li	a1,5
    80008e60:	00048513          	mv	a0,s1
    80008e64:	00e7b023          	sd	a4,0(a5)
    80008e68:	00000097          	auipc	ra,0x0
    80008e6c:	400080e7          	jalr	1024(ra) # 80009268 <__memset>
    80008e70:	01813083          	ld	ra,24(sp)
    80008e74:	01013403          	ld	s0,16(sp)
    80008e78:	00048513          	mv	a0,s1
    80008e7c:	00813483          	ld	s1,8(sp)
    80008e80:	02010113          	addi	sp,sp,32
    80008e84:	00008067          	ret

0000000080008e88 <initlock>:
    80008e88:	ff010113          	addi	sp,sp,-16
    80008e8c:	00813423          	sd	s0,8(sp)
    80008e90:	01010413          	addi	s0,sp,16
    80008e94:	00813403          	ld	s0,8(sp)
    80008e98:	00b53423          	sd	a1,8(a0)
    80008e9c:	00052023          	sw	zero,0(a0)
    80008ea0:	00053823          	sd	zero,16(a0)
    80008ea4:	01010113          	addi	sp,sp,16
    80008ea8:	00008067          	ret

0000000080008eac <acquire>:
    80008eac:	fe010113          	addi	sp,sp,-32
    80008eb0:	00813823          	sd	s0,16(sp)
    80008eb4:	00913423          	sd	s1,8(sp)
    80008eb8:	00113c23          	sd	ra,24(sp)
    80008ebc:	01213023          	sd	s2,0(sp)
    80008ec0:	02010413          	addi	s0,sp,32
    80008ec4:	00050493          	mv	s1,a0
    80008ec8:	10002973          	csrr	s2,sstatus
    80008ecc:	100027f3          	csrr	a5,sstatus
    80008ed0:	ffd7f793          	andi	a5,a5,-3
    80008ed4:	10079073          	csrw	sstatus,a5
    80008ed8:	fffff097          	auipc	ra,0xfffff
    80008edc:	8e0080e7          	jalr	-1824(ra) # 800077b8 <mycpu>
    80008ee0:	07852783          	lw	a5,120(a0)
    80008ee4:	06078e63          	beqz	a5,80008f60 <acquire+0xb4>
    80008ee8:	fffff097          	auipc	ra,0xfffff
    80008eec:	8d0080e7          	jalr	-1840(ra) # 800077b8 <mycpu>
    80008ef0:	07852783          	lw	a5,120(a0)
    80008ef4:	0004a703          	lw	a4,0(s1)
    80008ef8:	0017879b          	addiw	a5,a5,1
    80008efc:	06f52c23          	sw	a5,120(a0)
    80008f00:	04071063          	bnez	a4,80008f40 <acquire+0x94>
    80008f04:	00100713          	li	a4,1
    80008f08:	00070793          	mv	a5,a4
    80008f0c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008f10:	0007879b          	sext.w	a5,a5
    80008f14:	fe079ae3          	bnez	a5,80008f08 <acquire+0x5c>
    80008f18:	0ff0000f          	fence
    80008f1c:	fffff097          	auipc	ra,0xfffff
    80008f20:	89c080e7          	jalr	-1892(ra) # 800077b8 <mycpu>
    80008f24:	01813083          	ld	ra,24(sp)
    80008f28:	01013403          	ld	s0,16(sp)
    80008f2c:	00a4b823          	sd	a0,16(s1)
    80008f30:	00013903          	ld	s2,0(sp)
    80008f34:	00813483          	ld	s1,8(sp)
    80008f38:	02010113          	addi	sp,sp,32
    80008f3c:	00008067          	ret
    80008f40:	0104b903          	ld	s2,16(s1)
    80008f44:	fffff097          	auipc	ra,0xfffff
    80008f48:	874080e7          	jalr	-1932(ra) # 800077b8 <mycpu>
    80008f4c:	faa91ce3          	bne	s2,a0,80008f04 <acquire+0x58>
    80008f50:	00002517          	auipc	a0,0x2
    80008f54:	91850513          	addi	a0,a0,-1768 # 8000a868 <digits+0x20>
    80008f58:	fffff097          	auipc	ra,0xfffff
    80008f5c:	224080e7          	jalr	548(ra) # 8000817c <panic>
    80008f60:	00195913          	srli	s2,s2,0x1
    80008f64:	fffff097          	auipc	ra,0xfffff
    80008f68:	854080e7          	jalr	-1964(ra) # 800077b8 <mycpu>
    80008f6c:	00197913          	andi	s2,s2,1
    80008f70:	07252e23          	sw	s2,124(a0)
    80008f74:	f75ff06f          	j	80008ee8 <acquire+0x3c>

0000000080008f78 <release>:
    80008f78:	fe010113          	addi	sp,sp,-32
    80008f7c:	00813823          	sd	s0,16(sp)
    80008f80:	00113c23          	sd	ra,24(sp)
    80008f84:	00913423          	sd	s1,8(sp)
    80008f88:	01213023          	sd	s2,0(sp)
    80008f8c:	02010413          	addi	s0,sp,32
    80008f90:	00052783          	lw	a5,0(a0)
    80008f94:	00079a63          	bnez	a5,80008fa8 <release+0x30>
    80008f98:	00002517          	auipc	a0,0x2
    80008f9c:	8d850513          	addi	a0,a0,-1832 # 8000a870 <digits+0x28>
    80008fa0:	fffff097          	auipc	ra,0xfffff
    80008fa4:	1dc080e7          	jalr	476(ra) # 8000817c <panic>
    80008fa8:	01053903          	ld	s2,16(a0)
    80008fac:	00050493          	mv	s1,a0
    80008fb0:	fffff097          	auipc	ra,0xfffff
    80008fb4:	808080e7          	jalr	-2040(ra) # 800077b8 <mycpu>
    80008fb8:	fea910e3          	bne	s2,a0,80008f98 <release+0x20>
    80008fbc:	0004b823          	sd	zero,16(s1)
    80008fc0:	0ff0000f          	fence
    80008fc4:	0f50000f          	fence	iorw,ow
    80008fc8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80008fcc:	ffffe097          	auipc	ra,0xffffe
    80008fd0:	7ec080e7          	jalr	2028(ra) # 800077b8 <mycpu>
    80008fd4:	100027f3          	csrr	a5,sstatus
    80008fd8:	0027f793          	andi	a5,a5,2
    80008fdc:	04079a63          	bnez	a5,80009030 <release+0xb8>
    80008fe0:	07852783          	lw	a5,120(a0)
    80008fe4:	02f05e63          	blez	a5,80009020 <release+0xa8>
    80008fe8:	fff7871b          	addiw	a4,a5,-1
    80008fec:	06e52c23          	sw	a4,120(a0)
    80008ff0:	00071c63          	bnez	a4,80009008 <release+0x90>
    80008ff4:	07c52783          	lw	a5,124(a0)
    80008ff8:	00078863          	beqz	a5,80009008 <release+0x90>
    80008ffc:	100027f3          	csrr	a5,sstatus
    80009000:	0027e793          	ori	a5,a5,2
    80009004:	10079073          	csrw	sstatus,a5
    80009008:	01813083          	ld	ra,24(sp)
    8000900c:	01013403          	ld	s0,16(sp)
    80009010:	00813483          	ld	s1,8(sp)
    80009014:	00013903          	ld	s2,0(sp)
    80009018:	02010113          	addi	sp,sp,32
    8000901c:	00008067          	ret
    80009020:	00002517          	auipc	a0,0x2
    80009024:	87050513          	addi	a0,a0,-1936 # 8000a890 <digits+0x48>
    80009028:	fffff097          	auipc	ra,0xfffff
    8000902c:	154080e7          	jalr	340(ra) # 8000817c <panic>
    80009030:	00002517          	auipc	a0,0x2
    80009034:	84850513          	addi	a0,a0,-1976 # 8000a878 <digits+0x30>
    80009038:	fffff097          	auipc	ra,0xfffff
    8000903c:	144080e7          	jalr	324(ra) # 8000817c <panic>

0000000080009040 <holding>:
    80009040:	00052783          	lw	a5,0(a0)
    80009044:	00079663          	bnez	a5,80009050 <holding+0x10>
    80009048:	00000513          	li	a0,0
    8000904c:	00008067          	ret
    80009050:	fe010113          	addi	sp,sp,-32
    80009054:	00813823          	sd	s0,16(sp)
    80009058:	00913423          	sd	s1,8(sp)
    8000905c:	00113c23          	sd	ra,24(sp)
    80009060:	02010413          	addi	s0,sp,32
    80009064:	01053483          	ld	s1,16(a0)
    80009068:	ffffe097          	auipc	ra,0xffffe
    8000906c:	750080e7          	jalr	1872(ra) # 800077b8 <mycpu>
    80009070:	01813083          	ld	ra,24(sp)
    80009074:	01013403          	ld	s0,16(sp)
    80009078:	40a48533          	sub	a0,s1,a0
    8000907c:	00153513          	seqz	a0,a0
    80009080:	00813483          	ld	s1,8(sp)
    80009084:	02010113          	addi	sp,sp,32
    80009088:	00008067          	ret

000000008000908c <push_off>:
    8000908c:	fe010113          	addi	sp,sp,-32
    80009090:	00813823          	sd	s0,16(sp)
    80009094:	00113c23          	sd	ra,24(sp)
    80009098:	00913423          	sd	s1,8(sp)
    8000909c:	02010413          	addi	s0,sp,32
    800090a0:	100024f3          	csrr	s1,sstatus
    800090a4:	100027f3          	csrr	a5,sstatus
    800090a8:	ffd7f793          	andi	a5,a5,-3
    800090ac:	10079073          	csrw	sstatus,a5
    800090b0:	ffffe097          	auipc	ra,0xffffe
    800090b4:	708080e7          	jalr	1800(ra) # 800077b8 <mycpu>
    800090b8:	07852783          	lw	a5,120(a0)
    800090bc:	02078663          	beqz	a5,800090e8 <push_off+0x5c>
    800090c0:	ffffe097          	auipc	ra,0xffffe
    800090c4:	6f8080e7          	jalr	1784(ra) # 800077b8 <mycpu>
    800090c8:	07852783          	lw	a5,120(a0)
    800090cc:	01813083          	ld	ra,24(sp)
    800090d0:	01013403          	ld	s0,16(sp)
    800090d4:	0017879b          	addiw	a5,a5,1
    800090d8:	06f52c23          	sw	a5,120(a0)
    800090dc:	00813483          	ld	s1,8(sp)
    800090e0:	02010113          	addi	sp,sp,32
    800090e4:	00008067          	ret
    800090e8:	0014d493          	srli	s1,s1,0x1
    800090ec:	ffffe097          	auipc	ra,0xffffe
    800090f0:	6cc080e7          	jalr	1740(ra) # 800077b8 <mycpu>
    800090f4:	0014f493          	andi	s1,s1,1
    800090f8:	06952e23          	sw	s1,124(a0)
    800090fc:	fc5ff06f          	j	800090c0 <push_off+0x34>

0000000080009100 <pop_off>:
    80009100:	ff010113          	addi	sp,sp,-16
    80009104:	00813023          	sd	s0,0(sp)
    80009108:	00113423          	sd	ra,8(sp)
    8000910c:	01010413          	addi	s0,sp,16
    80009110:	ffffe097          	auipc	ra,0xffffe
    80009114:	6a8080e7          	jalr	1704(ra) # 800077b8 <mycpu>
    80009118:	100027f3          	csrr	a5,sstatus
    8000911c:	0027f793          	andi	a5,a5,2
    80009120:	04079663          	bnez	a5,8000916c <pop_off+0x6c>
    80009124:	07852783          	lw	a5,120(a0)
    80009128:	02f05a63          	blez	a5,8000915c <pop_off+0x5c>
    8000912c:	fff7871b          	addiw	a4,a5,-1
    80009130:	06e52c23          	sw	a4,120(a0)
    80009134:	00071c63          	bnez	a4,8000914c <pop_off+0x4c>
    80009138:	07c52783          	lw	a5,124(a0)
    8000913c:	00078863          	beqz	a5,8000914c <pop_off+0x4c>
    80009140:	100027f3          	csrr	a5,sstatus
    80009144:	0027e793          	ori	a5,a5,2
    80009148:	10079073          	csrw	sstatus,a5
    8000914c:	00813083          	ld	ra,8(sp)
    80009150:	00013403          	ld	s0,0(sp)
    80009154:	01010113          	addi	sp,sp,16
    80009158:	00008067          	ret
    8000915c:	00001517          	auipc	a0,0x1
    80009160:	73450513          	addi	a0,a0,1844 # 8000a890 <digits+0x48>
    80009164:	fffff097          	auipc	ra,0xfffff
    80009168:	018080e7          	jalr	24(ra) # 8000817c <panic>
    8000916c:	00001517          	auipc	a0,0x1
    80009170:	70c50513          	addi	a0,a0,1804 # 8000a878 <digits+0x30>
    80009174:	fffff097          	auipc	ra,0xfffff
    80009178:	008080e7          	jalr	8(ra) # 8000817c <panic>

000000008000917c <push_on>:
    8000917c:	fe010113          	addi	sp,sp,-32
    80009180:	00813823          	sd	s0,16(sp)
    80009184:	00113c23          	sd	ra,24(sp)
    80009188:	00913423          	sd	s1,8(sp)
    8000918c:	02010413          	addi	s0,sp,32
    80009190:	100024f3          	csrr	s1,sstatus
    80009194:	100027f3          	csrr	a5,sstatus
    80009198:	0027e793          	ori	a5,a5,2
    8000919c:	10079073          	csrw	sstatus,a5
    800091a0:	ffffe097          	auipc	ra,0xffffe
    800091a4:	618080e7          	jalr	1560(ra) # 800077b8 <mycpu>
    800091a8:	07852783          	lw	a5,120(a0)
    800091ac:	02078663          	beqz	a5,800091d8 <push_on+0x5c>
    800091b0:	ffffe097          	auipc	ra,0xffffe
    800091b4:	608080e7          	jalr	1544(ra) # 800077b8 <mycpu>
    800091b8:	07852783          	lw	a5,120(a0)
    800091bc:	01813083          	ld	ra,24(sp)
    800091c0:	01013403          	ld	s0,16(sp)
    800091c4:	0017879b          	addiw	a5,a5,1
    800091c8:	06f52c23          	sw	a5,120(a0)
    800091cc:	00813483          	ld	s1,8(sp)
    800091d0:	02010113          	addi	sp,sp,32
    800091d4:	00008067          	ret
    800091d8:	0014d493          	srli	s1,s1,0x1
    800091dc:	ffffe097          	auipc	ra,0xffffe
    800091e0:	5dc080e7          	jalr	1500(ra) # 800077b8 <mycpu>
    800091e4:	0014f493          	andi	s1,s1,1
    800091e8:	06952e23          	sw	s1,124(a0)
    800091ec:	fc5ff06f          	j	800091b0 <push_on+0x34>

00000000800091f0 <pop_on>:
    800091f0:	ff010113          	addi	sp,sp,-16
    800091f4:	00813023          	sd	s0,0(sp)
    800091f8:	00113423          	sd	ra,8(sp)
    800091fc:	01010413          	addi	s0,sp,16
    80009200:	ffffe097          	auipc	ra,0xffffe
    80009204:	5b8080e7          	jalr	1464(ra) # 800077b8 <mycpu>
    80009208:	100027f3          	csrr	a5,sstatus
    8000920c:	0027f793          	andi	a5,a5,2
    80009210:	04078463          	beqz	a5,80009258 <pop_on+0x68>
    80009214:	07852783          	lw	a5,120(a0)
    80009218:	02f05863          	blez	a5,80009248 <pop_on+0x58>
    8000921c:	fff7879b          	addiw	a5,a5,-1
    80009220:	06f52c23          	sw	a5,120(a0)
    80009224:	07853783          	ld	a5,120(a0)
    80009228:	00079863          	bnez	a5,80009238 <pop_on+0x48>
    8000922c:	100027f3          	csrr	a5,sstatus
    80009230:	ffd7f793          	andi	a5,a5,-3
    80009234:	10079073          	csrw	sstatus,a5
    80009238:	00813083          	ld	ra,8(sp)
    8000923c:	00013403          	ld	s0,0(sp)
    80009240:	01010113          	addi	sp,sp,16
    80009244:	00008067          	ret
    80009248:	00001517          	auipc	a0,0x1
    8000924c:	67050513          	addi	a0,a0,1648 # 8000a8b8 <digits+0x70>
    80009250:	fffff097          	auipc	ra,0xfffff
    80009254:	f2c080e7          	jalr	-212(ra) # 8000817c <panic>
    80009258:	00001517          	auipc	a0,0x1
    8000925c:	64050513          	addi	a0,a0,1600 # 8000a898 <digits+0x50>
    80009260:	fffff097          	auipc	ra,0xfffff
    80009264:	f1c080e7          	jalr	-228(ra) # 8000817c <panic>

0000000080009268 <__memset>:
    80009268:	ff010113          	addi	sp,sp,-16
    8000926c:	00813423          	sd	s0,8(sp)
    80009270:	01010413          	addi	s0,sp,16
    80009274:	1a060e63          	beqz	a2,80009430 <__memset+0x1c8>
    80009278:	40a007b3          	neg	a5,a0
    8000927c:	0077f793          	andi	a5,a5,7
    80009280:	00778693          	addi	a3,a5,7
    80009284:	00b00813          	li	a6,11
    80009288:	0ff5f593          	andi	a1,a1,255
    8000928c:	fff6071b          	addiw	a4,a2,-1
    80009290:	1b06e663          	bltu	a3,a6,8000943c <__memset+0x1d4>
    80009294:	1cd76463          	bltu	a4,a3,8000945c <__memset+0x1f4>
    80009298:	1a078e63          	beqz	a5,80009454 <__memset+0x1ec>
    8000929c:	00b50023          	sb	a1,0(a0)
    800092a0:	00100713          	li	a4,1
    800092a4:	1ae78463          	beq	a5,a4,8000944c <__memset+0x1e4>
    800092a8:	00b500a3          	sb	a1,1(a0)
    800092ac:	00200713          	li	a4,2
    800092b0:	1ae78a63          	beq	a5,a4,80009464 <__memset+0x1fc>
    800092b4:	00b50123          	sb	a1,2(a0)
    800092b8:	00300713          	li	a4,3
    800092bc:	18e78463          	beq	a5,a4,80009444 <__memset+0x1dc>
    800092c0:	00b501a3          	sb	a1,3(a0)
    800092c4:	00400713          	li	a4,4
    800092c8:	1ae78263          	beq	a5,a4,8000946c <__memset+0x204>
    800092cc:	00b50223          	sb	a1,4(a0)
    800092d0:	00500713          	li	a4,5
    800092d4:	1ae78063          	beq	a5,a4,80009474 <__memset+0x20c>
    800092d8:	00b502a3          	sb	a1,5(a0)
    800092dc:	00700713          	li	a4,7
    800092e0:	18e79e63          	bne	a5,a4,8000947c <__memset+0x214>
    800092e4:	00b50323          	sb	a1,6(a0)
    800092e8:	00700e93          	li	t4,7
    800092ec:	00859713          	slli	a4,a1,0x8
    800092f0:	00e5e733          	or	a4,a1,a4
    800092f4:	01059e13          	slli	t3,a1,0x10
    800092f8:	01c76e33          	or	t3,a4,t3
    800092fc:	01859313          	slli	t1,a1,0x18
    80009300:	006e6333          	or	t1,t3,t1
    80009304:	02059893          	slli	a7,a1,0x20
    80009308:	40f60e3b          	subw	t3,a2,a5
    8000930c:	011368b3          	or	a7,t1,a7
    80009310:	02859813          	slli	a6,a1,0x28
    80009314:	0108e833          	or	a6,a7,a6
    80009318:	03059693          	slli	a3,a1,0x30
    8000931c:	003e589b          	srliw	a7,t3,0x3
    80009320:	00d866b3          	or	a3,a6,a3
    80009324:	03859713          	slli	a4,a1,0x38
    80009328:	00389813          	slli	a6,a7,0x3
    8000932c:	00f507b3          	add	a5,a0,a5
    80009330:	00e6e733          	or	a4,a3,a4
    80009334:	000e089b          	sext.w	a7,t3
    80009338:	00f806b3          	add	a3,a6,a5
    8000933c:	00e7b023          	sd	a4,0(a5)
    80009340:	00878793          	addi	a5,a5,8
    80009344:	fed79ce3          	bne	a5,a3,8000933c <__memset+0xd4>
    80009348:	ff8e7793          	andi	a5,t3,-8
    8000934c:	0007871b          	sext.w	a4,a5
    80009350:	01d787bb          	addw	a5,a5,t4
    80009354:	0ce88e63          	beq	a7,a4,80009430 <__memset+0x1c8>
    80009358:	00f50733          	add	a4,a0,a5
    8000935c:	00b70023          	sb	a1,0(a4)
    80009360:	0017871b          	addiw	a4,a5,1
    80009364:	0cc77663          	bgeu	a4,a2,80009430 <__memset+0x1c8>
    80009368:	00e50733          	add	a4,a0,a4
    8000936c:	00b70023          	sb	a1,0(a4)
    80009370:	0027871b          	addiw	a4,a5,2
    80009374:	0ac77e63          	bgeu	a4,a2,80009430 <__memset+0x1c8>
    80009378:	00e50733          	add	a4,a0,a4
    8000937c:	00b70023          	sb	a1,0(a4)
    80009380:	0037871b          	addiw	a4,a5,3
    80009384:	0ac77663          	bgeu	a4,a2,80009430 <__memset+0x1c8>
    80009388:	00e50733          	add	a4,a0,a4
    8000938c:	00b70023          	sb	a1,0(a4)
    80009390:	0047871b          	addiw	a4,a5,4
    80009394:	08c77e63          	bgeu	a4,a2,80009430 <__memset+0x1c8>
    80009398:	00e50733          	add	a4,a0,a4
    8000939c:	00b70023          	sb	a1,0(a4)
    800093a0:	0057871b          	addiw	a4,a5,5
    800093a4:	08c77663          	bgeu	a4,a2,80009430 <__memset+0x1c8>
    800093a8:	00e50733          	add	a4,a0,a4
    800093ac:	00b70023          	sb	a1,0(a4)
    800093b0:	0067871b          	addiw	a4,a5,6
    800093b4:	06c77e63          	bgeu	a4,a2,80009430 <__memset+0x1c8>
    800093b8:	00e50733          	add	a4,a0,a4
    800093bc:	00b70023          	sb	a1,0(a4)
    800093c0:	0077871b          	addiw	a4,a5,7
    800093c4:	06c77663          	bgeu	a4,a2,80009430 <__memset+0x1c8>
    800093c8:	00e50733          	add	a4,a0,a4
    800093cc:	00b70023          	sb	a1,0(a4)
    800093d0:	0087871b          	addiw	a4,a5,8
    800093d4:	04c77e63          	bgeu	a4,a2,80009430 <__memset+0x1c8>
    800093d8:	00e50733          	add	a4,a0,a4
    800093dc:	00b70023          	sb	a1,0(a4)
    800093e0:	0097871b          	addiw	a4,a5,9
    800093e4:	04c77663          	bgeu	a4,a2,80009430 <__memset+0x1c8>
    800093e8:	00e50733          	add	a4,a0,a4
    800093ec:	00b70023          	sb	a1,0(a4)
    800093f0:	00a7871b          	addiw	a4,a5,10
    800093f4:	02c77e63          	bgeu	a4,a2,80009430 <__memset+0x1c8>
    800093f8:	00e50733          	add	a4,a0,a4
    800093fc:	00b70023          	sb	a1,0(a4)
    80009400:	00b7871b          	addiw	a4,a5,11
    80009404:	02c77663          	bgeu	a4,a2,80009430 <__memset+0x1c8>
    80009408:	00e50733          	add	a4,a0,a4
    8000940c:	00b70023          	sb	a1,0(a4)
    80009410:	00c7871b          	addiw	a4,a5,12
    80009414:	00c77e63          	bgeu	a4,a2,80009430 <__memset+0x1c8>
    80009418:	00e50733          	add	a4,a0,a4
    8000941c:	00b70023          	sb	a1,0(a4)
    80009420:	00d7879b          	addiw	a5,a5,13
    80009424:	00c7f663          	bgeu	a5,a2,80009430 <__memset+0x1c8>
    80009428:	00f507b3          	add	a5,a0,a5
    8000942c:	00b78023          	sb	a1,0(a5)
    80009430:	00813403          	ld	s0,8(sp)
    80009434:	01010113          	addi	sp,sp,16
    80009438:	00008067          	ret
    8000943c:	00b00693          	li	a3,11
    80009440:	e55ff06f          	j	80009294 <__memset+0x2c>
    80009444:	00300e93          	li	t4,3
    80009448:	ea5ff06f          	j	800092ec <__memset+0x84>
    8000944c:	00100e93          	li	t4,1
    80009450:	e9dff06f          	j	800092ec <__memset+0x84>
    80009454:	00000e93          	li	t4,0
    80009458:	e95ff06f          	j	800092ec <__memset+0x84>
    8000945c:	00000793          	li	a5,0
    80009460:	ef9ff06f          	j	80009358 <__memset+0xf0>
    80009464:	00200e93          	li	t4,2
    80009468:	e85ff06f          	j	800092ec <__memset+0x84>
    8000946c:	00400e93          	li	t4,4
    80009470:	e7dff06f          	j	800092ec <__memset+0x84>
    80009474:	00500e93          	li	t4,5
    80009478:	e75ff06f          	j	800092ec <__memset+0x84>
    8000947c:	00600e93          	li	t4,6
    80009480:	e6dff06f          	j	800092ec <__memset+0x84>

0000000080009484 <__memmove>:
    80009484:	ff010113          	addi	sp,sp,-16
    80009488:	00813423          	sd	s0,8(sp)
    8000948c:	01010413          	addi	s0,sp,16
    80009490:	0e060863          	beqz	a2,80009580 <__memmove+0xfc>
    80009494:	fff6069b          	addiw	a3,a2,-1
    80009498:	0006881b          	sext.w	a6,a3
    8000949c:	0ea5e863          	bltu	a1,a0,8000958c <__memmove+0x108>
    800094a0:	00758713          	addi	a4,a1,7
    800094a4:	00a5e7b3          	or	a5,a1,a0
    800094a8:	40a70733          	sub	a4,a4,a0
    800094ac:	0077f793          	andi	a5,a5,7
    800094b0:	00f73713          	sltiu	a4,a4,15
    800094b4:	00174713          	xori	a4,a4,1
    800094b8:	0017b793          	seqz	a5,a5
    800094bc:	00e7f7b3          	and	a5,a5,a4
    800094c0:	10078863          	beqz	a5,800095d0 <__memmove+0x14c>
    800094c4:	00900793          	li	a5,9
    800094c8:	1107f463          	bgeu	a5,a6,800095d0 <__memmove+0x14c>
    800094cc:	0036581b          	srliw	a6,a2,0x3
    800094d0:	fff8081b          	addiw	a6,a6,-1
    800094d4:	02081813          	slli	a6,a6,0x20
    800094d8:	01d85893          	srli	a7,a6,0x1d
    800094dc:	00858813          	addi	a6,a1,8
    800094e0:	00058793          	mv	a5,a1
    800094e4:	00050713          	mv	a4,a0
    800094e8:	01088833          	add	a6,a7,a6
    800094ec:	0007b883          	ld	a7,0(a5)
    800094f0:	00878793          	addi	a5,a5,8
    800094f4:	00870713          	addi	a4,a4,8
    800094f8:	ff173c23          	sd	a7,-8(a4)
    800094fc:	ff0798e3          	bne	a5,a6,800094ec <__memmove+0x68>
    80009500:	ff867713          	andi	a4,a2,-8
    80009504:	02071793          	slli	a5,a4,0x20
    80009508:	0207d793          	srli	a5,a5,0x20
    8000950c:	00f585b3          	add	a1,a1,a5
    80009510:	40e686bb          	subw	a3,a3,a4
    80009514:	00f507b3          	add	a5,a0,a5
    80009518:	06e60463          	beq	a2,a4,80009580 <__memmove+0xfc>
    8000951c:	0005c703          	lbu	a4,0(a1)
    80009520:	00e78023          	sb	a4,0(a5)
    80009524:	04068e63          	beqz	a3,80009580 <__memmove+0xfc>
    80009528:	0015c603          	lbu	a2,1(a1)
    8000952c:	00100713          	li	a4,1
    80009530:	00c780a3          	sb	a2,1(a5)
    80009534:	04e68663          	beq	a3,a4,80009580 <__memmove+0xfc>
    80009538:	0025c603          	lbu	a2,2(a1)
    8000953c:	00200713          	li	a4,2
    80009540:	00c78123          	sb	a2,2(a5)
    80009544:	02e68e63          	beq	a3,a4,80009580 <__memmove+0xfc>
    80009548:	0035c603          	lbu	a2,3(a1)
    8000954c:	00300713          	li	a4,3
    80009550:	00c781a3          	sb	a2,3(a5)
    80009554:	02e68663          	beq	a3,a4,80009580 <__memmove+0xfc>
    80009558:	0045c603          	lbu	a2,4(a1)
    8000955c:	00400713          	li	a4,4
    80009560:	00c78223          	sb	a2,4(a5)
    80009564:	00e68e63          	beq	a3,a4,80009580 <__memmove+0xfc>
    80009568:	0055c603          	lbu	a2,5(a1)
    8000956c:	00500713          	li	a4,5
    80009570:	00c782a3          	sb	a2,5(a5)
    80009574:	00e68663          	beq	a3,a4,80009580 <__memmove+0xfc>
    80009578:	0065c703          	lbu	a4,6(a1)
    8000957c:	00e78323          	sb	a4,6(a5)
    80009580:	00813403          	ld	s0,8(sp)
    80009584:	01010113          	addi	sp,sp,16
    80009588:	00008067          	ret
    8000958c:	02061713          	slli	a4,a2,0x20
    80009590:	02075713          	srli	a4,a4,0x20
    80009594:	00e587b3          	add	a5,a1,a4
    80009598:	f0f574e3          	bgeu	a0,a5,800094a0 <__memmove+0x1c>
    8000959c:	02069613          	slli	a2,a3,0x20
    800095a0:	02065613          	srli	a2,a2,0x20
    800095a4:	fff64613          	not	a2,a2
    800095a8:	00e50733          	add	a4,a0,a4
    800095ac:	00c78633          	add	a2,a5,a2
    800095b0:	fff7c683          	lbu	a3,-1(a5)
    800095b4:	fff78793          	addi	a5,a5,-1
    800095b8:	fff70713          	addi	a4,a4,-1
    800095bc:	00d70023          	sb	a3,0(a4)
    800095c0:	fec798e3          	bne	a5,a2,800095b0 <__memmove+0x12c>
    800095c4:	00813403          	ld	s0,8(sp)
    800095c8:	01010113          	addi	sp,sp,16
    800095cc:	00008067          	ret
    800095d0:	02069713          	slli	a4,a3,0x20
    800095d4:	02075713          	srli	a4,a4,0x20
    800095d8:	00170713          	addi	a4,a4,1
    800095dc:	00e50733          	add	a4,a0,a4
    800095e0:	00050793          	mv	a5,a0
    800095e4:	0005c683          	lbu	a3,0(a1)
    800095e8:	00178793          	addi	a5,a5,1
    800095ec:	00158593          	addi	a1,a1,1
    800095f0:	fed78fa3          	sb	a3,-1(a5)
    800095f4:	fee798e3          	bne	a5,a4,800095e4 <__memmove+0x160>
    800095f8:	f89ff06f          	j	80009580 <__memmove+0xfc>
	...
