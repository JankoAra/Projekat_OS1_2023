
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	d0013103          	ld	sp,-768(sp) # 8000cd00 <_GLOBAL_OFFSET_TABLE_+0x48>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	4cc070ef          	jal	ra,800074e8 <start>

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
    80001084:	7d1000ef          	jal	ra,80002054 <interruptRoutine>

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
    800013a4:	9707b783          	ld	a5,-1680(a5) # 8000cd10 <_GLOBAL_OFFSET_TABLE_+0x58>
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
    800015f0:	7247b783          	ld	a5,1828(a5) # 8000cd10 <_GLOBAL_OFFSET_TABLE_+0x58>
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
    80001684:	7107c783          	lbu	a5,1808(a5) # 8000cd90 <_ZN8KConsole11initializedE>
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
    800016a8:	6ec48493          	addi	s1,s1,1772 # 8000cd90 <_ZN8KConsole11initializedE>
    800016ac:	0000b797          	auipc	a5,0xb
    800016b0:	61c7b783          	ld	a5,1564(a5) # 8000ccc8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800016b4:	0007b783          	ld	a5,0(a5)
    800016b8:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    800016bc:	0000b797          	auipc	a5,0xb
    800016c0:	61c7b783          	ld	a5,1564(a5) # 8000ccd8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016c4:	0007b783          	ld	a5,0(a5)
    800016c8:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    800016cc:	03200593          	li	a1,50
    800016d0:	0000b517          	auipc	a0,0xb
    800016d4:	6d850513          	addi	a0,a0,1752 # 8000cda8 <_ZN8KConsole19inputBufferHasSpaceE>
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	dd4080e7          	jalr	-556(ra) # 800014ac <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016e0:	03200593          	li	a1,50
    800016e4:	0000b517          	auipc	a0,0xb
    800016e8:	6cc50513          	addi	a0,a0,1740 # 8000cdb0 <_ZN8KConsole20outputBufferHasSpaceE>
    800016ec:	00000097          	auipc	ra,0x0
    800016f0:	dc0080e7          	jalr	-576(ra) # 800014ac <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016f4:	00000593          	li	a1,0
    800016f8:	0000b517          	auipc	a0,0xb
    800016fc:	6c050513          	addi	a0,a0,1728 # 8000cdb8 <_ZN8KConsole12charsToInputE>
    80001700:	00000097          	auipc	ra,0x0
    80001704:	dac080e7          	jalr	-596(ra) # 800014ac <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    80001708:	00000593          	li	a1,0
    8000170c:	0000b517          	auipc	a0,0xb
    80001710:	6b450513          	addi	a0,a0,1716 # 8000cdc0 <_ZN8KConsole13charsToOutputE>
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
    80001758:	5a4080e7          	jalr	1444(ra) # 80005cf8 <_Z11printStringPKc>
	printInteger((uint64)dr);
    8000175c:	0000b497          	auipc	s1,0xb
    80001760:	63448493          	addi	s1,s1,1588 # 8000cd90 <_ZN8KConsole11initializedE>
    80001764:	0084b503          	ld	a0,8(s1)
    80001768:	00000097          	auipc	ra,0x0
    8000176c:	250080e7          	jalr	592(ra) # 800019b8 <_Z12printIntegerm>
	printString("\n");
    80001770:	00009517          	auipc	a0,0x9
    80001774:	e4850513          	addi	a0,a0,-440 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80001778:	00004097          	auipc	ra,0x4
    8000177c:	580080e7          	jalr	1408(ra) # 80005cf8 <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001780:	00009517          	auipc	a0,0x9
    80001784:	8b050513          	addi	a0,a0,-1872 # 8000a030 <CONSOLE_STATUS+0x20>
    80001788:	00004097          	auipc	ra,0x4
    8000178c:	570080e7          	jalr	1392(ra) # 80005cf8 <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001790:	0104b503          	ld	a0,16(s1)
    80001794:	00000097          	auipc	ra,0x0
    80001798:	224080e7          	jalr	548(ra) # 800019b8 <_Z12printIntegerm>
	printString("\n");
    8000179c:	00009517          	auipc	a0,0x9
    800017a0:	e1c50513          	addi	a0,a0,-484 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800017a4:	00004097          	auipc	ra,0x4
    800017a8:	554080e7          	jalr	1364(ra) # 80005cf8 <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    800017ac:	00009517          	auipc	a0,0x9
    800017b0:	89c50513          	addi	a0,a0,-1892 # 8000a048 <CONSOLE_STATUS+0x38>
    800017b4:	00004097          	auipc	ra,0x4
    800017b8:	544080e7          	jalr	1348(ra) # 80005cf8 <_Z11printStringPKc>
	printInteger(*dr);
    800017bc:	0084b783          	ld	a5,8(s1)
    800017c0:	0007c503          	lbu	a0,0(a5)
    800017c4:	00000097          	auipc	ra,0x0
    800017c8:	1f4080e7          	jalr	500(ra) # 800019b8 <_Z12printIntegerm>
	printString("\n");
    800017cc:	00009517          	auipc	a0,0x9
    800017d0:	dec50513          	addi	a0,a0,-532 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800017d4:	00004097          	auipc	ra,0x4
    800017d8:	524080e7          	jalr	1316(ra) # 80005cf8 <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017dc:	00009517          	auipc	a0,0x9
    800017e0:	87c50513          	addi	a0,a0,-1924 # 8000a058 <CONSOLE_STATUS+0x48>
    800017e4:	00004097          	auipc	ra,0x4
    800017e8:	514080e7          	jalr	1300(ra) # 80005cf8 <_Z11printStringPKc>
	printInteger(*sr);
    800017ec:	0104b783          	ld	a5,16(s1)
    800017f0:	0007c503          	lbu	a0,0(a5)
    800017f4:	00000097          	auipc	ra,0x0
    800017f8:	1c4080e7          	jalr	452(ra) # 800019b8 <_Z12printIntegerm>
	printString("\n");
    800017fc:	00009517          	auipc	a0,0x9
    80001800:	dbc50513          	addi	a0,a0,-580 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80001804:	00004097          	auipc	ra,0x4
    80001808:	4f4080e7          	jalr	1268(ra) # 80005cf8 <_Z11printStringPKc>
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
    80001838:	55c48493          	addi	s1,s1,1372 # 8000cd90 <_ZN8KConsole11initializedE>
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
    8000187c:	58c72703          	lw	a4,1420(a4) # 8000ce04 <_ZN8KConsole15inputBufferSizeE>
    80001880:	03200793          	li	a5,50
    80001884:	04f70e63          	beq	a4,a5,800018e0 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    80001888:	ff010113          	addi	sp,sp,-16
    8000188c:	00113423          	sd	ra,8(sp)
    80001890:	00813023          	sd	s0,0(sp)
    80001894:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    80001898:	0000b697          	auipc	a3,0xb
    8000189c:	4f868693          	addi	a3,a3,1272 # 8000cd90 <_ZN8KConsole11initializedE>
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
    80001904:	49048493          	addi	s1,s1,1168 # 8000cd90 <_ZN8KConsole11initializedE>
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
    8000196c:	42848493          	addi	s1,s1,1064 # 8000cd90 <_ZN8KConsole11initializedE>
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
    80001a80:	3d47b783          	ld	a5,980(a5) # 8000ce50 <_ZN9Scheduler4tailE>
    80001a84:	02078263          	beqz	a5,80001aa8 <_ZN9Scheduler3putEP3TCB+0x38>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    80001a88:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    80001a8c:	0000b797          	auipc	a5,0xb
    80001a90:	3ca7b223          	sd	a0,964(a5) # 8000ce50 <_ZN9Scheduler4tailE>
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
    80001aac:	3a878793          	addi	a5,a5,936 # 8000ce50 <_ZN9Scheduler4tailE>
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
    80001acc:	38870713          	addi	a4,a4,904 # 8000ce50 <_ZN9Scheduler4tailE>
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
    80001b14:	35083803          	ld	a6,848(a6) # 8000ce60 <_ZN9Scheduler12sleepingHeadE>
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
    80001b4c:	30a7bc23          	sd	a0,792(a5) # 8000ce60 <_ZN9Scheduler12sleepingHeadE>
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
    80001b94:	2ca7b823          	sd	a0,720(a5) # 8000ce60 <_ZN9Scheduler12sleepingHeadE>
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
    80001bb0:	2b47b783          	ld	a5,692(a5) # 8000ce60 <_ZN9Scheduler12sleepingHeadE>
    80001bb4:	06078a63          	beqz	a5,80001c28 <_ZN9Scheduler4wakeEv+0x7c>
    sleepingHead->timeToSleep--;
    80001bb8:	0387b703          	ld	a4,56(a5)
    80001bbc:	fff70713          	addi	a4,a4,-1
    80001bc0:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001bc4:	0000b517          	auipc	a0,0xb
    80001bc8:	29c53503          	ld	a0,668(a0) # 8000ce60 <_ZN9Scheduler12sleepingHeadE>
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
    80001bfc:	26f73423          	sd	a5,616(a4) # 8000ce60 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    80001c00:	04053023          	sd	zero,64(a0)
        Scheduler::put(thread);
    80001c04:	00000097          	auipc	ra,0x0
    80001c08:	e6c080e7          	jalr	-404(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001c0c:	0000b517          	auipc	a0,0xb
    80001c10:	25453503          	ld	a0,596(a0) # 8000ce60 <_ZN9Scheduler12sleepingHeadE>
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
    if (size <= 0) return nullptr;
    80001c38:	14050063          	beqz	a0,80001d78 <_ZN7KMemory7kmallocEm+0x14c>
    uint64 currentElem = 0;
    uint64 currentBit = 63;
    uint64 firstZeroElem = 0;
    uint64 firstZeroBit = 63;
    uint64 zerosFound = 0;
    bool zeroFound = false;
    80001c3c:	00000313          	li	t1,0
    uint64 zerosFound = 0;
    80001c40:	00000713          	li	a4,0
    uint64 firstZeroBit = 63;
    80001c44:	03f00813          	li	a6,63
    uint64 firstZeroElem = 0;
    80001c48:	00000893          	li	a7,0
    uint64 currentBit = 63;
    80001c4c:	03f00793          	li	a5,63
    uint64 currentElem = 0;
    80001c50:	00000593          	li	a1,0
    80001c54:	0080006f          	j	80001c5c <_ZN7KMemory7kmallocEm+0x30>
            firstZeroElem = currentElem;
        } else {
            zerosFound++;
        }
        if (zerosFound == size) break;
        if (currentBit-- == 0) {
    80001c58:	00068793          	mv	a5,a3
    while (currentElem < sizeOfBitVectorInUint64) {
    80001c5c:	0000b697          	auipc	a3,0xb
    80001c60:	20c6b683          	ld	a3,524(a3) # 8000ce68 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001c64:	08d5fa63          	bgeu	a1,a3,80001cf8 <_ZN7KMemory7kmallocEm+0xcc>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001c68:	03f00693          	li	a3,63
    80001c6c:	02d78a63          	beq	a5,a3,80001ca0 <_ZN7KMemory7kmallocEm+0x74>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    80001c70:	00359693          	slli	a3,a1,0x3
    80001c74:	0000b617          	auipc	a2,0xb
    80001c78:	1fc63603          	ld	a2,508(a2) # 8000ce70 <_ZN7KMemory9bitVectorE>
    80001c7c:	00d606b3          	add	a3,a2,a3
    80001c80:	0006b683          	ld	a3,0(a3)
    //adresa pocetka bit vektora (HEAP_START_ADDR)
    static uint64* bitVector;

    //maska sa 1 na mestu bitPos i ostalim nulama (bitPos=0..63)
    inline static uint64 maskBit(uint64 bitPos) {
        return (uint64)1 << bitPos;
    80001c84:	00100613          	li	a2,1
    80001c88:	00f61633          	sll	a2,a2,a5
    80001c8c:	00c6f6b3          	and	a3,a3,a2
        if (bit > 0) {
    80001c90:	02069a63          	bnez	a3,80001cc4 <_ZN7KMemory7kmallocEm+0x98>
        } else if (!zeroFound) {
    80001c94:	04030863          	beqz	t1,80001ce4 <_ZN7KMemory7kmallocEm+0xb8>
            zerosFound++;
    80001c98:	00170713          	addi	a4,a4,1
    80001c9c:	0300006f          	j	80001ccc <_ZN7KMemory7kmallocEm+0xa0>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001ca0:	00359693          	slli	a3,a1,0x3
    80001ca4:	0000b617          	auipc	a2,0xb
    80001ca8:	1cc63603          	ld	a2,460(a2) # 8000ce70 <_ZN7KMemory9bitVectorE>
    80001cac:	00d606b3          	add	a3,a2,a3
    80001cb0:	0006b603          	ld	a2,0(a3)
    80001cb4:	fff00693          	li	a3,-1
    80001cb8:	fad61ce3          	bne	a2,a3,80001c70 <_ZN7KMemory7kmallocEm+0x44>
            currentElem++;
    80001cbc:	00158593          	addi	a1,a1,1
            continue;
    80001cc0:	f9dff06f          	j	80001c5c <_ZN7KMemory7kmallocEm+0x30>
            zeroFound = false;
    80001cc4:	00000313          	li	t1,0
            zerosFound = 0;
    80001cc8:	00000713          	li	a4,0
        if (zerosFound == size) break;
    80001ccc:	02a70663          	beq	a4,a0,80001cf8 <_ZN7KMemory7kmallocEm+0xcc>
        if (currentBit-- == 0) {
    80001cd0:	fff78693          	addi	a3,a5,-1
    80001cd4:	f80792e3          	bnez	a5,80001c58 <_ZN7KMemory7kmallocEm+0x2c>
            currentBit = 63;
            currentElem++;
    80001cd8:	00158593          	addi	a1,a1,1
            currentBit = 63;
    80001cdc:	03f00793          	li	a5,63
    80001ce0:	f7dff06f          	j	80001c5c <_ZN7KMemory7kmallocEm+0x30>
            firstZeroBit = currentBit;
    80001ce4:	00078813          	mv	a6,a5
            firstZeroElem = currentElem;
    80001ce8:	00058893          	mv	a7,a1
            zeroFound = true;
    80001cec:	00100313          	li	t1,1
            zerosFound = 1;
    80001cf0:	00100713          	li	a4,1
    80001cf4:	fd9ff06f          	j	80001ccc <_ZN7KMemory7kmallocEm+0xa0>
        }
    }
    if (zerosFound != size) return nullptr;
    80001cf8:	08a71463          	bne	a4,a0,80001d80 <_ZN7KMemory7kmallocEm+0x154>

    //alociranje blokova
    uint64 blockNum = firstZeroElem * 64 + (63 - firstZeroBit);
    80001cfc:	00689793          	slli	a5,a7,0x6
    80001d00:	410787b3          	sub	a5,a5,a6
    80001d04:	03f78793          	addi	a5,a5,63
    void* addr = (char*)HEAP_START_ADDR + blockNum * MEM_BLOCK_SIZE;
    80001d08:	0000b697          	auipc	a3,0xb
    80001d0c:	fd86b683          	ld	a3,-40(a3) # 8000cce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001d10:	0006b583          	ld	a1,0(a3)
    80001d14:	00679793          	slli	a5,a5,0x6
    80001d18:	00f585b3          	add	a1,a1,a5
    *(uint64*)addr = size;  //da znamo koliko blokova je alocirano zaredom
    80001d1c:	00a5b023          	sd	a0,0(a1)

    //upisivanje 1 u bit vektor
    currentElem = firstZeroElem;
    currentBit = firstZeroBit;
    80001d20:	0080006f          	j	80001d28 <_ZN7KMemory7kmallocEm+0xfc>
    while (zerosFound > 0) {
        bitVector[currentElem] |= maskBit(currentBit);
        zerosFound--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001d24:	00078813          	mv	a6,a5
    while (zerosFound > 0) {
    80001d28:	04070063          	beqz	a4,80001d68 <_ZN7KMemory7kmallocEm+0x13c>
    80001d2c:	00100693          	li	a3,1
    80001d30:	01069633          	sll	a2,a3,a6
        bitVector[currentElem] |= maskBit(currentBit);
    80001d34:	00389793          	slli	a5,a7,0x3
    80001d38:	0000b697          	auipc	a3,0xb
    80001d3c:	1386b683          	ld	a3,312(a3) # 8000ce70 <_ZN7KMemory9bitVectorE>
    80001d40:	00f687b3          	add	a5,a3,a5
    80001d44:	0007b683          	ld	a3,0(a5)
    80001d48:	00c6e6b3          	or	a3,a3,a2
    80001d4c:	00d7b023          	sd	a3,0(a5)
        zerosFound--;
    80001d50:	fff70713          	addi	a4,a4,-1
        if (currentBit-- == 0) {
    80001d54:	fff80793          	addi	a5,a6,-1
    80001d58:	fc0816e3          	bnez	a6,80001d24 <_ZN7KMemory7kmallocEm+0xf8>
            currentElem++;
    80001d5c:	00188893          	addi	a7,a7,1
            currentBit = 63;
    80001d60:	03f00793          	li	a5,63
    80001d64:	fc1ff06f          	j	80001d24 <_ZN7KMemory7kmallocEm+0xf8>
        }
    }
    return (char*)addr + 2 * sizeof(uint64);    //offset 2 da bi bilo zaokruzeno na 16 zbog steka
    80001d68:	01058513          	addi	a0,a1,16
}
    80001d6c:	00813403          	ld	s0,8(sp)
    80001d70:	01010113          	addi	sp,sp,16
    80001d74:	00008067          	ret
    if (size <= 0) return nullptr;
    80001d78:	00000513          	li	a0,0
    80001d7c:	ff1ff06f          	j	80001d6c <_ZN7KMemory7kmallocEm+0x140>
    if (zerosFound != size) return nullptr;
    80001d80:	00000513          	li	a0,0
    80001d84:	fe9ff06f          	j	80001d6c <_ZN7KMemory7kmallocEm+0x140>

0000000080001d88 <_ZN7KMemory16initializeMemoryEv>:
    if (initialized) return;
    80001d88:	0000b797          	auipc	a5,0xb
    80001d8c:	0f07c783          	lbu	a5,240(a5) # 8000ce78 <_ZN7KMemory11initializedE>
    80001d90:	0a079663          	bnez	a5,80001e3c <_ZN7KMemory16initializeMemoryEv+0xb4>
void KMemory::initializeMemory() {
    80001d94:	ff010113          	addi	sp,sp,-16
    80001d98:	00113423          	sd	ra,8(sp)
    80001d9c:	00813023          	sd	s0,0(sp)
    80001da0:	01010413          	addi	s0,sp,16
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001da4:	0000b797          	auipc	a5,0xb
    80001da8:	f847b783          	ld	a5,-124(a5) # 8000cd28 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001dac:	0007b783          	ld	a5,0(a5)
    80001db0:	0000b717          	auipc	a4,0xb
    80001db4:	f3073703          	ld	a4,-208(a4) # 8000cce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001db8:	00073683          	ld	a3,0(a4)
    80001dbc:	40d787b3          	sub	a5,a5,a3
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    80001dc0:	00c7d793          	srli	a5,a5,0xc
    80001dc4:	0000b717          	auipc	a4,0xb
    80001dc8:	0a470713          	addi	a4,a4,164 # 8000ce68 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001dcc:	00f73023          	sd	a5,0(a4)
    numOfBlocks = sizeOfBitVectorInUint64 * sizeof(uint64) * 8; //da se zaokruzi broj postojecih blokova na umnozak 64
    80001dd0:	00679613          	slli	a2,a5,0x6
    80001dd4:	00c73c23          	sd	a2,24(a4)
    uint64 blocksForBitVector = (sizeOfBitVectorInUint64 * sizeof(uint64) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80001dd8:	00878513          	addi	a0,a5,8
    80001ddc:	00351513          	slli	a0,a0,0x3
    80001de0:	fff50513          	addi	a0,a0,-1
    80001de4:	00655513          	srli	a0,a0,0x6
    bitVector = (uint64*)HEAP_START_ADDR;
    80001de8:	00d73423          	sd	a3,8(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001dec:	00000793          	li	a5,0
    80001df0:	0000b717          	auipc	a4,0xb
    80001df4:	07873703          	ld	a4,120(a4) # 8000ce68 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001df8:	02e7f063          	bgeu	a5,a4,80001e18 <_ZN7KMemory16initializeMemoryEv+0x90>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    80001dfc:	00379693          	slli	a3,a5,0x3
    80001e00:	0000b717          	auipc	a4,0xb
    80001e04:	07073703          	ld	a4,112(a4) # 8000ce70 <_ZN7KMemory9bitVectorE>
    80001e08:	00d70733          	add	a4,a4,a3
    80001e0c:	00073023          	sd	zero,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001e10:	00178793          	addi	a5,a5,1
    80001e14:	fddff06f          	j	80001df0 <_ZN7KMemory16initializeMemoryEv+0x68>
    kmalloc(blocksForBitVector);
    80001e18:	00000097          	auipc	ra,0x0
    80001e1c:	e14080e7          	jalr	-492(ra) # 80001c2c <_ZN7KMemory7kmallocEm>
    initialized = true;
    80001e20:	00100793          	li	a5,1
    80001e24:	0000b717          	auipc	a4,0xb
    80001e28:	04f70a23          	sb	a5,84(a4) # 8000ce78 <_ZN7KMemory11initializedE>
}
    80001e2c:	00813083          	ld	ra,8(sp)
    80001e30:	00013403          	ld	s0,0(sp)
    80001e34:	01010113          	addi	sp,sp,16
    80001e38:	00008067          	ret
    80001e3c:	00008067          	ret

0000000080001e40 <_ZN7KMemory5kfreeEPv>:

int KMemory::kfree(void* ptr) {
    80001e40:	ff010113          	addi	sp,sp,-16
    80001e44:	00813423          	sd	s0,8(sp)
    80001e48:	01010413          	addi	s0,sp,16
    if (!ptr) return 0;
    80001e4c:	08050063          	beqz	a0,80001ecc <_ZN7KMemory5kfreeEPv+0x8c>
    ptr = (char*)ptr - 2 * sizeof(uint64);
    80001e50:	ff050793          	addi	a5,a0,-16
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001e54:	0000b717          	auipc	a4,0xb
    80001e58:	e8c73703          	ld	a4,-372(a4) # 8000cce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001e5c:	00073703          	ld	a4,0(a4)
    80001e60:	40e787b3          	sub	a5,a5,a4
    80001e64:	03f7f713          	andi	a4,a5,63
    80001e68:	06071663          	bnez	a4,80001ed4 <_ZN7KMemory5kfreeEPv+0x94>
    uint64 blocksToFree = *(uint64*)ptr;
    80001e6c:	ff053583          	ld	a1,-16(a0)
    uint64 blockNum = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    80001e70:	0067d613          	srli	a2,a5,0x6
    uint64 currentElem = blockNum / 64;
    80001e74:	00c7d513          	srli	a0,a5,0xc
    uint64 currentBit = 63 - blockNum % 64;
    80001e78:	fff64613          	not	a2,a2
    80001e7c:	03f67613          	andi	a2,a2,63
    80001e80:	0080006f          	j	80001e88 <_ZN7KMemory5kfreeEPv+0x48>
    while (blocksToFree > 0) {
        bitVector[currentElem] &= ~maskBit(currentBit);
        blocksToFree--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001e84:	00078613          	mv	a2,a5
    while (blocksToFree > 0) {
    80001e88:	04058a63          	beqz	a1,80001edc <_ZN7KMemory5kfreeEPv+0x9c>
    80001e8c:	00100793          	li	a5,1
    80001e90:	00c797b3          	sll	a5,a5,a2
        bitVector[currentElem] &= ~maskBit(currentBit);
    80001e94:	fff7c793          	not	a5,a5
    80001e98:	00351713          	slli	a4,a0,0x3
    80001e9c:	0000b697          	auipc	a3,0xb
    80001ea0:	fd46b683          	ld	a3,-44(a3) # 8000ce70 <_ZN7KMemory9bitVectorE>
    80001ea4:	00e68733          	add	a4,a3,a4
    80001ea8:	00073683          	ld	a3,0(a4)
    80001eac:	00f6f7b3          	and	a5,a3,a5
    80001eb0:	00f73023          	sd	a5,0(a4)
        blocksToFree--;
    80001eb4:	fff58593          	addi	a1,a1,-1
        if (currentBit-- == 0) {
    80001eb8:	fff60793          	addi	a5,a2,-1
    80001ebc:	fc0614e3          	bnez	a2,80001e84 <_ZN7KMemory5kfreeEPv+0x44>
            currentElem++;
    80001ec0:	00150513          	addi	a0,a0,1
            currentBit = 63;
    80001ec4:	03f00793          	li	a5,63
    80001ec8:	fbdff06f          	j	80001e84 <_ZN7KMemory5kfreeEPv+0x44>
    if (!ptr) return 0;
    80001ecc:	00000513          	li	a0,0
    80001ed0:	0100006f          	j	80001ee0 <_ZN7KMemory5kfreeEPv+0xa0>
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001ed4:	fff00513          	li	a0,-1
    80001ed8:	0080006f          	j	80001ee0 <_ZN7KMemory5kfreeEPv+0xa0>
        }
    }
    return 0;
    80001edc:	00000513          	li	a0,0
}
    80001ee0:	00813403          	ld	s0,8(sp)
    80001ee4:	01010113          	addi	sp,sp,16
    80001ee8:	00008067          	ret

0000000080001eec <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80001eec:	ff010113          	addi	sp,sp,-16
    80001ef0:	00113423          	sd	ra,8(sp)
    80001ef4:	00813023          	sd	s0,0(sp)
    80001ef8:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80001efc:	fffff097          	auipc	ra,0xfffff
    80001f00:	538080e7          	jalr	1336(ra) # 80001434 <_Z15thread_dispatchv>
    80001f04:	ff9ff06f          	j	80001efc <_Z4idlePv+0x10>

0000000080001f08 <_Z22kernelConsumerFunctionPv>:
}

void kernelConsumerFunction(void*) {
    80001f08:	ff010113          	addi	sp,sp,-16
    80001f0c:	00113423          	sd	ra,8(sp)
    80001f10:	00813023          	sd	s0,0(sp)
    80001f14:	01010413          	addi	s0,sp,16
    80001f18:	0280006f          	j	80001f40 <_Z22kernelConsumerFunctionPv+0x38>
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
        *KConsole::dr = c;
    80001f1c:	0000b797          	auipc	a5,0xb
    80001f20:	dec7b783          	ld	a5,-532(a5) # 8000cd08 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001f24:	0007b783          	ld	a5,0(a5)
    80001f28:	00a78023          	sb	a0,0(a5)
        sem_signal(KConsole::outputBufferHasSpace);
    80001f2c:	0000b797          	auipc	a5,0xb
    80001f30:	dec7b783          	ld	a5,-532(a5) # 8000cd18 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001f34:	0007b503          	ld	a0,0(a5)
    80001f38:	fffff097          	auipc	ra,0xfffff
    80001f3c:	60c080e7          	jalr	1548(ra) # 80001544 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001f40:	00000097          	auipc	ra,0x0
    80001f44:	8e0080e7          	jalr	-1824(ra) # 80001820 <_ZN8KConsole13getFromOutputEv>
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
    80001f48:	0000b797          	auipc	a5,0xb
    80001f4c:	e007b783          	ld	a5,-512(a5) # 8000cd48 <_GLOBAL_OFFSET_TABLE_+0x90>
    80001f50:	0007b783          	ld	a5,0(a5)
    80001f54:	0007c783          	lbu	a5,0(a5)
    80001f58:	0207f793          	andi	a5,a5,32
    80001f5c:	fe0786e3          	beqz	a5,80001f48 <_Z22kernelConsumerFunctionPv+0x40>
    80001f60:	fbdff06f          	j	80001f1c <_Z22kernelConsumerFunctionPv+0x14>

0000000080001f64 <main>:
    }
}

int main() {
    80001f64:	fd010113          	addi	sp,sp,-48
    80001f68:	02113423          	sd	ra,40(sp)
    80001f6c:	02813023          	sd	s0,32(sp)
    80001f70:	03010413          	addi	s0,sp,48
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001f74:	0000b797          	auipc	a5,0xb
    80001f78:	dbc7b783          	ld	a5,-580(a5) # 8000cd30 <_GLOBAL_OFFSET_TABLE_+0x78>
    80001f7c:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80001f80:	00000097          	auipc	ra,0x0
    80001f84:	e08080e7          	jalr	-504(ra) # 80001d88 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001f88:	fffff097          	auipc	ra,0xfffff
    80001f8c:	6f8080e7          	jalr	1784(ra) # 80001680 <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    80001f90:	00000613          	li	a2,0
    80001f94:	00000597          	auipc	a1,0x0
    80001f98:	fd058593          	addi	a1,a1,-48 # 80001f64 <main>
    80001f9c:	fe840513          	addi	a0,s0,-24
    80001fa0:	fffff097          	auipc	ra,0xfffff
    80001fa4:	3d8080e7          	jalr	984(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80001fa8:	fe843783          	ld	a5,-24(s0)

    Body getBody() { return threadFunction; }

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }
    80001fac:	0000b717          	auipc	a4,0xb
    80001fb0:	d7473703          	ld	a4,-652(a4) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001fb4:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001fb8:	00100713          	li	a4,1
    80001fbc:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    80001fc0:	00000613          	li	a2,0
    80001fc4:	0000b597          	auipc	a1,0xb
    80001fc8:	cfc5b583          	ld	a1,-772(a1) # 8000ccc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001fcc:	fe040513          	addi	a0,s0,-32
    80001fd0:	fffff097          	auipc	ra,0xfffff
    80001fd4:	3a8080e7          	jalr	936(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80001fd8:	00000613          	li	a2,0
    80001fdc:	00000597          	auipc	a1,0x0
    80001fe0:	f2c58593          	addi	a1,a1,-212 # 80001f08 <_Z22kernelConsumerFunctionPv>
    80001fe4:	fd040513          	addi	a0,s0,-48
    80001fe8:	fffff097          	auipc	ra,0xfffff
    80001fec:	390080e7          	jalr	912(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80001ff0:	00000613          	li	a2,0
    80001ff4:	00000597          	auipc	a1,0x0
    80001ff8:	ef858593          	addi	a1,a1,-264 # 80001eec <_Z4idlePv>
    80001ffc:	fd840513          	addi	a0,s0,-40
    80002000:	fffff097          	auipc	ra,0xfffff
    80002004:	378080e7          	jalr	888(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002008:	00200793          	li	a5,2
    8000200c:	1007a073          	csrs	sstatus,a5

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80002010:	fe043503          	ld	a0,-32(s0)
    80002014:	fffff097          	auipc	ra,0xfffff
    80002018:	440080e7          	jalr	1088(ra) # 80001454 <_Z11thread_joinP3TCB>

    //flush output bafera za konzolu
    while (KConsole::outputHead != KConsole::outputTail) {}
    8000201c:	0000b797          	auipc	a5,0xb
    80002020:	cdc7b783          	ld	a5,-804(a5) # 8000ccf8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002024:	0007a703          	lw	a4,0(a5)
    80002028:	0000b797          	auipc	a5,0xb
    8000202c:	d187b783          	ld	a5,-744(a5) # 8000cd40 <_GLOBAL_OFFSET_TABLE_+0x88>
    80002030:	0007a783          	lw	a5,0(a5)
    80002034:	fef714e3          	bne	a4,a5,8000201c <main+0xb8>
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002038:	00200793          	li	a5,2
    8000203c:	1007b073          	csrc	sstatus,a5

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80002040:	00000513          	li	a0,0
    80002044:	02813083          	ld	ra,40(sp)
    80002048:	02013403          	ld	s0,32(sp)
    8000204c:	03010113          	addi	sp,sp,48
    80002050:	00008067          	ret

0000000080002054 <interruptRoutine>:
#include "../test/printing.hpp"

int main();

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80002054:	f8010113          	addi	sp,sp,-128
    80002058:	06113c23          	sd	ra,120(sp)
    8000205c:	06813823          	sd	s0,112(sp)
    80002060:	06913423          	sd	s1,104(sp)
    80002064:	08010413          	addi	s0,sp,128
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002068:	14202373          	csrr	t1,scause
    8000206c:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002070:	14102373          	csrr	t1,sepc
    80002074:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002078:	10002373          	csrr	t1,sstatus
    8000207c:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4, a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002080:	00050313          	mv	t1,a0
    80002084:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002088:	00058313          	mv	t1,a1
    8000208c:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002090:	00060313          	mv	t1,a2
    80002094:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002098:	00068313          	mv	t1,a3
    8000209c:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020a0:	00070313          	mv	t1,a4
    800020a4:	fa643023          	sd	t1,-96(s0)
    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020a8:	00078313          	mv	t1,a5
    800020ac:	f8643c23          	sd	t1,-104(s0)
    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020b0:	00080313          	mv	t1,a6
    800020b4:	f8643823          	sd	t1,-112(s0)
    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020b8:	00088313          	mv	t1,a7
    800020bc:	f8643423          	sd	t1,-120(s0)

    if (scause == 0x9 || scause == 0x8) {
    800020c0:	fd843703          	ld	a4,-40(s0)
    800020c4:	00900793          	li	a5,9
    800020c8:	00f70863          	beq	a4,a5,800020d8 <interruptRoutine+0x84>
    800020cc:	fd843703          	ld	a4,-40(s0)
    800020d0:	00800793          	li	a5,8
    800020d4:	3cf71663          	bne	a4,a5,800024a0 <interruptRoutine+0x44c>
        //prekid zbog poziva ecall
        switch (a0) {
    800020d8:	fc043703          	ld	a4,-64(s0)
    800020dc:	09100793          	li	a5,145
    800020e0:	32f70263          	beq	a4,a5,80002404 <interruptRoutine+0x3b0>
    800020e4:	fc043703          	ld	a4,-64(s0)
    800020e8:	09100793          	li	a5,145
    800020ec:	32e7e463          	bltu	a5,a4,80002414 <interruptRoutine+0x3c0>
    800020f0:	fc043703          	ld	a4,-64(s0)
    800020f4:	08100793          	li	a5,129
    800020f8:	2cf70663          	beq	a4,a5,800023c4 <interruptRoutine+0x370>
    800020fc:	fc043703          	ld	a4,-64(s0)
    80002100:	08100793          	li	a5,129
    80002104:	30e7e863          	bltu	a5,a4,80002414 <interruptRoutine+0x3c0>
    80002108:	fc043703          	ld	a4,-64(s0)
    8000210c:	04200793          	li	a5,66
    80002110:	04e7e263          	bltu	a5,a4,80002154 <interruptRoutine+0x100>
    80002114:	fc043783          	ld	a5,-64(s0)
    80002118:	2e078e63          	beqz	a5,80002414 <interruptRoutine+0x3c0>
    8000211c:	fc043703          	ld	a4,-64(s0)
    80002120:	04200793          	li	a5,66
    80002124:	2ee7e863          	bltu	a5,a4,80002414 <interruptRoutine+0x3c0>
    80002128:	fc043783          	ld	a5,-64(s0)
    8000212c:	00279713          	slli	a4,a5,0x2
    80002130:	00008797          	auipc	a5,0x8
    80002134:	fc478793          	addi	a5,a5,-60 # 8000a0f4 <_ZZ9kPrintIntmE6digits+0x84>
    80002138:	00f707b3          	add	a5,a4,a5
    8000213c:	0007a783          	lw	a5,0(a5)
    80002140:	0007871b          	sext.w	a4,a5
    80002144:	00008797          	auipc	a5,0x8
    80002148:	fb078793          	addi	a5,a5,-80 # 8000a0f4 <_ZZ9kPrintIntmE6digits+0x84>
    8000214c:	00f707b3          	add	a5,a4,a5
    80002150:	00078067          	jr	a5
    80002154:	fc043703          	ld	a4,-64(s0)
    80002158:	08000793          	li	a5,128
    8000215c:	20f70e63          	beq	a4,a5,80002378 <interruptRoutine+0x324>
    80002160:	2b40006f          	j	80002414 <interruptRoutine+0x3c0>
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                KMemory::kmalloc((size_t)a1);
    80002164:	fb843503          	ld	a0,-72(s0)
    80002168:	00000097          	auipc	ra,0x0
    8000216c:	ac4080e7          	jalr	-1340(ra) # 80001c2c <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    80002170:	04a43823          	sd	a0,80(s0)
                break;
    80002174:	30c0006f          	j	80002480 <interruptRoutine+0x42c>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                KMemory::kfree((void*)a1);
    80002178:	fb843783          	ld	a5,-72(s0)
    8000217c:	00078513          	mv	a0,a5
    80002180:	00000097          	auipc	ra,0x0
    80002184:	cc0080e7          	jalr	-832(ra) # 80001e40 <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    80002188:	04a43823          	sd	a0,80(s0)
                break;
    8000218c:	2f40006f          	j	80002480 <interruptRoutine+0x42c>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002190:	fb043783          	ld	a5,-80(s0)
    80002194:	fa843703          	ld	a4,-88(s0)
    80002198:	fa043683          	ld	a3,-96(s0)
    8000219c:	fb843483          	ld	s1,-72(s0)
    800021a0:	00068613          	mv	a2,a3
    800021a4:	00070593          	mv	a1,a4
    800021a8:	00078513          	mv	a0,a5
    800021ac:	00001097          	auipc	ra,0x1
    800021b0:	d30080e7          	jalr	-720(ra) # 80002edc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800021b4:	00050793          	mv	a5,a0
    800021b8:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    800021bc:	fb843783          	ld	a5,-72(s0)
    800021c0:	0007b783          	ld	a5,0(a5)
    800021c4:	02078863          	beqz	a5,800021f4 <interruptRoutine+0x1a0>
                    if ((TCB::Body)a2 != (TCB::Body)main) {
    800021c8:	fb043703          	ld	a4,-80(s0)
    800021cc:	0000b797          	auipc	a5,0xb
    800021d0:	b447b783          	ld	a5,-1212(a5) # 8000cd10 <_GLOBAL_OFFSET_TABLE_+0x58>
    800021d4:	00f70c63          	beq	a4,a5,800021ec <interruptRoutine+0x198>
                        Scheduler::put(*((thread_t*)a1));
    800021d8:	fb843783          	ld	a5,-72(s0)
    800021dc:	0007b783          	ld	a5,0(a5)
    800021e0:	00078513          	mv	a0,a5
    800021e4:	00000097          	auipc	ra,0x0
    800021e8:	88c080e7          	jalr	-1908(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
                    }
                    __asm__ volatile("li a0, 0");
    800021ec:	00000513          	li	a0,0
    800021f0:	0080006f          	j	800021f8 <interruptRoutine+0x1a4>
                } else {
                    __asm__ volatile("li a0, -1");
    800021f4:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800021f8:	04a43823          	sd	a0,80(s0)
                break;
    800021fc:	2840006f          	j	80002480 <interruptRoutine+0x42c>
            case 0x12:
                //thread_exit
                TCB::getRunning()->setStatus(TCB::FINISHED);
    80002200:	00000097          	auipc	ra,0x0
    80002204:	500080e7          	jalr	1280(ra) # 80002700 <_ZN3TCB10getRunningEv>
    80002208:	00050793          	mv	a5,a0
    8000220c:	00500593          	li	a1,5
    80002210:	00078513          	mv	a0,a5
    80002214:	00000097          	auipc	ra,0x0
    80002218:	498080e7          	jalr	1176(ra) # 800026ac <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined();
    8000221c:	00001097          	auipc	ra,0x1
    80002220:	dec080e7          	jalr	-532(ra) # 80003008 <_ZN3TCB13releaseJoinedEv>
                __asm__ volatile("li a0, 0");
    80002224:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 80(s0)");
    80002228:	04a43823          	sd	a0,80(s0)
                TCB::dispatch();
    8000222c:	00001097          	auipc	ra,0x1
    80002230:	bd4080e7          	jalr	-1068(ra) # 80002e00 <_ZN3TCB8dispatchEv>
                break;
    80002234:	24c0006f          	j	80002480 <interruptRoutine+0x42c>
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
    80002238:	00001097          	auipc	ra,0x1
    8000223c:	bc8080e7          	jalr	-1080(ra) # 80002e00 <_ZN3TCB8dispatchEv>
                break;
    80002240:	2400006f          	j	80002480 <interruptRoutine+0x42c>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    80002244:	fb843783          	ld	a5,-72(s0)
    80002248:	00078513          	mv	a0,a5
    8000224c:	00001097          	auipc	ra,0x1
    80002250:	d6c080e7          	jalr	-660(ra) # 80002fb8 <_ZN3TCB10threadJoinEPS_>
                TCB::dispatch();
    80002254:	00001097          	auipc	ra,0x1
    80002258:	bac080e7          	jalr	-1108(ra) # 80002e00 <_ZN3TCB8dispatchEv>
                break;
    8000225c:	2240006f          	j	80002480 <interruptRoutine+0x42c>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    80002260:	fb043783          	ld	a5,-80(s0)
    80002264:	0007879b          	sext.w	a5,a5
    80002268:	fb843483          	ld	s1,-72(s0)
    8000226c:	00078513          	mv	a0,a5
    80002270:	00001097          	auipc	ra,0x1
    80002274:	e9c080e7          	jalr	-356(ra) # 8000310c <_ZN4KSem7initSemEj>
    80002278:	00050793          	mv	a5,a0
    8000227c:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    80002280:	fb843783          	ld	a5,-72(s0)
    80002284:	0007b783          	ld	a5,0(a5)
    80002288:	00078663          	beqz	a5,80002294 <interruptRoutine+0x240>
                    __asm__ volatile("li a0, 0");
    8000228c:	00000513          	li	a0,0
    80002290:	0080006f          	j	80002298 <interruptRoutine+0x244>
                } else {
                    __asm__ volatile("li a0, -1");
    80002294:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002298:	04a43823          	sd	a0,80(s0)
                break;
    8000229c:	1e40006f          	j	80002480 <interruptRoutine+0x42c>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    800022a0:	fb843783          	ld	a5,-72(s0)
    800022a4:	00078513          	mv	a0,a5
    800022a8:	00001097          	auipc	ra,0x1
    800022ac:	fd8080e7          	jalr	-40(ra) # 80003280 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    800022b0:	04a43823          	sd	a0,80(s0)
                delete (sem_t)a1;
    800022b4:	fb843483          	ld	s1,-72(s0)
    800022b8:	1a048a63          	beqz	s1,8000246c <interruptRoutine+0x418>
    800022bc:	00048513          	mv	a0,s1
    800022c0:	00000097          	auipc	ra,0x0
    800022c4:	384080e7          	jalr	900(ra) # 80002644 <_ZN4KSemD1Ev>
    800022c8:	00048513          	mv	a0,s1
    800022cc:	00001097          	auipc	ra,0x1
    800022d0:	e18080e7          	jalr	-488(ra) # 800030e4 <_ZN4KSemdlEPv>
                break;
    800022d4:	1980006f          	j	8000246c <interruptRoutine+0x418>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    800022d8:	fb843783          	ld	a5,-72(s0)
    800022dc:	00078513          	mv	a0,a5
    800022e0:	00001097          	auipc	ra,0x1
    800022e4:	ec0080e7          	jalr	-320(ra) # 800031a0 <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    800022e8:	04a43823          	sd	a0,80(s0)
                break;
    800022ec:	1940006f          	j	80002480 <interruptRoutine+0x42c>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    800022f0:	fb843783          	ld	a5,-72(s0)
    800022f4:	00078513          	mv	a0,a5
    800022f8:	00001097          	auipc	ra,0x1
    800022fc:	f34080e7          	jalr	-204(ra) # 8000322c <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002300:	04a43823          	sd	a0,80(s0)
                break;
    80002304:	17c0006f          	j	80002480 <interruptRoutine+0x42c>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    80002308:	fb843783          	ld	a5,-72(s0)
    8000230c:	00078663          	beqz	a5,80002318 <interruptRoutine+0x2c4>
                    __asm__ volatile("li a0, 0");
    80002310:	00000513          	li	a0,0
    80002314:	0080006f          	j	8000231c <interruptRoutine+0x2c8>
                } else {
                    __asm__ volatile("li a0, -1");
    80002318:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    8000231c:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    80002320:	fb843783          	ld	a5,-72(s0)
    80002324:	14078863          	beqz	a5,80002474 <interruptRoutine+0x420>
                    Scheduler::putToSleep(TCB::getRunning(), (time_t)a1);
    80002328:	00000097          	auipc	ra,0x0
    8000232c:	3d8080e7          	jalr	984(ra) # 80002700 <_ZN3TCB10getRunningEv>
    80002330:	00050793          	mv	a5,a0
    80002334:	fb843583          	ld	a1,-72(s0)
    80002338:	00078513          	mv	a0,a5
    8000233c:	fffff097          	auipc	ra,0xfffff
    80002340:	7c0080e7          	jalr	1984(ra) # 80001afc <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::dispatch();
    80002344:	00001097          	auipc	ra,0x1
    80002348:	abc080e7          	jalr	-1348(ra) # 80002e00 <_ZN3TCB8dispatchEv>
                }
                break;
    8000234c:	1280006f          	j	80002474 <interruptRoutine+0x420>
            case 0x41:
                //getc
                KConsole::kgetc();
    80002350:	fffff097          	auipc	ra,0xfffff
    80002354:	604080e7          	jalr	1540(ra) # 80001954 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002358:	04a43823          	sd	a0,80(s0)
                break;
    8000235c:	1240006f          	j	80002480 <interruptRoutine+0x42c>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    80002360:	fb843783          	ld	a5,-72(s0)
    80002364:	0ff7f793          	andi	a5,a5,255
    80002368:	00078513          	mv	a0,a5
    8000236c:	fffff097          	auipc	ra,0xfffff
    80002370:	578080e7          	jalr	1400(ra) # 800018e4 <_ZN8KConsole5kputcEc>
                break;
    80002374:	10c0006f          	j	80002480 <interruptRoutine+0x42c>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002378:	fb043783          	ld	a5,-80(s0)
    8000237c:	fa843703          	ld	a4,-88(s0)
    80002380:	fa043683          	ld	a3,-96(s0)
    80002384:	fb843483          	ld	s1,-72(s0)
    80002388:	00068613          	mv	a2,a3
    8000238c:	00070593          	mv	a1,a4
    80002390:	00078513          	mv	a0,a5
    80002394:	00001097          	auipc	ra,0x1
    80002398:	b48080e7          	jalr	-1208(ra) # 80002edc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    8000239c:	00050793          	mv	a5,a0
    800023a0:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    800023a4:	fb843783          	ld	a5,-72(s0)
    800023a8:	0007b783          	ld	a5,0(a5)
    800023ac:	00078663          	beqz	a5,800023b8 <interruptRoutine+0x364>
                    __asm__ volatile("li a0, 0");
    800023b0:	00000513          	li	a0,0
    800023b4:	0080006f          	j	800023bc <interruptRoutine+0x368>
                } else {
                    __asm__ volatile("li a0, -1");
    800023b8:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800023bc:	04a43823          	sd	a0,80(s0)
                break;
    800023c0:	0c00006f          	j	80002480 <interruptRoutine+0x42c>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                if (((thread_t)a1)->getBody() != (TCB::Body)main) {
    800023c4:	fb843783          	ld	a5,-72(s0)
    800023c8:	00078513          	mv	a0,a5
    800023cc:	00000097          	auipc	ra,0x0
    800023d0:	318080e7          	jalr	792(ra) # 800026e4 <_ZN3TCB7getBodyEv>
    800023d4:	00050713          	mv	a4,a0
    800023d8:	0000b797          	auipc	a5,0xb
    800023dc:	9387b783          	ld	a5,-1736(a5) # 8000cd10 <_GLOBAL_OFFSET_TABLE_+0x58>
    800023e0:	40f707b3          	sub	a5,a4,a5
    800023e4:	00f037b3          	snez	a5,a5
    800023e8:	0ff7f793          	andi	a5,a5,255
    800023ec:	08078863          	beqz	a5,8000247c <interruptRoutine+0x428>
                    Scheduler::put((thread_t)a1);
    800023f0:	fb843783          	ld	a5,-72(s0)
    800023f4:	00078513          	mv	a0,a5
    800023f8:	fffff097          	auipc	ra,0xfffff
    800023fc:	678080e7          	jalr	1656(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
                }
                break;
    80002400:	07c0006f          	j	8000247c <interruptRoutine+0x428>
            case 0x91:
                //printInteger
                //a1 = integer za ispis
                kPrintInt(a1);
    80002404:	fb843503          	ld	a0,-72(s0)
    80002408:	fffff097          	auipc	ra,0xfffff
    8000240c:	5d8080e7          	jalr	1496(ra) # 800019e0 <_Z9kPrintIntm>
                break;
    80002410:	0700006f          	j	80002480 <interruptRoutine+0x42c>
            default:
                printString("\nNepostojeci op code: ");
    80002414:	00008517          	auipc	a0,0x8
    80002418:	c6c50513          	addi	a0,a0,-916 # 8000a080 <_ZZ9kPrintIntmE6digits+0x10>
    8000241c:	00004097          	auipc	ra,0x4
    80002420:	8dc080e7          	jalr	-1828(ra) # 80005cf8 <_Z11printStringPKc>
                kPrintInt(a0);
    80002424:	fc043503          	ld	a0,-64(s0)
    80002428:	fffff097          	auipc	ra,0xfffff
    8000242c:	5b8080e7          	jalr	1464(ra) # 800019e0 <_Z9kPrintIntm>
                printString("\nscause: ");
    80002430:	00008517          	auipc	a0,0x8
    80002434:	c6850513          	addi	a0,a0,-920 # 8000a098 <_ZZ9kPrintIntmE6digits+0x28>
    80002438:	00004097          	auipc	ra,0x4
    8000243c:	8c0080e7          	jalr	-1856(ra) # 80005cf8 <_Z11printStringPKc>
                kPrintInt(scause);
    80002440:	fd843503          	ld	a0,-40(s0)
    80002444:	fffff097          	auipc	ra,0xfffff
    80002448:	59c080e7          	jalr	1436(ra) # 800019e0 <_Z9kPrintIntm>
                printString("\nsepc: ");
    8000244c:	00008517          	auipc	a0,0x8
    80002450:	c5c50513          	addi	a0,a0,-932 # 8000a0a8 <_ZZ9kPrintIntmE6digits+0x38>
    80002454:	00004097          	auipc	ra,0x4
    80002458:	8a4080e7          	jalr	-1884(ra) # 80005cf8 <_Z11printStringPKc>
                kPrintInt(sepc);
    8000245c:	fd043503          	ld	a0,-48(s0)
    80002460:	fffff097          	auipc	ra,0xfffff
    80002464:	580080e7          	jalr	1408(ra) # 800019e0 <_Z9kPrintIntm>
                break;
    80002468:	0180006f          	j	80002480 <interruptRoutine+0x42c>
                break;
    8000246c:	00000013          	nop
    80002470:	0100006f          	j	80002480 <interruptRoutine+0x42c>
                break;
    80002474:	00000013          	nop
    80002478:	0080006f          	j	80002480 <interruptRoutine+0x42c>
                break;
    8000247c:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    80002480:	fd043783          	ld	a5,-48(s0)
    80002484:	00478793          	addi	a5,a5,4
    80002488:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    8000248c:	fd043783          	ld	a5,-48(s0)
    80002490:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002494:	fc843783          	ld	a5,-56(s0)
    80002498:	10079073          	csrw	sstatus,a5
        printString("\nsepc: ");
        kPrintInt(sepc);
//        Riscv::mc_sstatus(Riscv::SSTATUS_SPIE);
//        Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    }
    8000249c:	1900006f          	j	8000262c <interruptRoutine+0x5d8>
    } else if (scause == 0x8000000000000009) {
    800024a0:	fd843703          	ld	a4,-40(s0)
    800024a4:	fff00793          	li	a5,-1
    800024a8:	03f79793          	slli	a5,a5,0x3f
    800024ac:	00978793          	addi	a5,a5,9
    800024b0:	08f71e63          	bne	a4,a5,8000254c <interruptRoutine+0x4f8>
        uint64 irq = plic_claim();
    800024b4:	00006097          	auipc	ra,0x6
    800024b8:	890080e7          	jalr	-1904(ra) # 80007d44 <plic_claim>
    800024bc:	00050793          	mv	a5,a0
    800024c0:	f8f43023          	sd	a5,-128(s0)
        if (irq == CONSOLE_IRQ) {
    800024c4:	f8043703          	ld	a4,-128(s0)
    800024c8:	00a00793          	li	a5,10
    800024cc:	02f71e63          	bne	a4,a5,80002508 <interruptRoutine+0x4b4>
            if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    800024d0:	0000b797          	auipc	a5,0xb
    800024d4:	8787b783          	ld	a5,-1928(a5) # 8000cd48 <_GLOBAL_OFFSET_TABLE_+0x90>
    800024d8:	0007b783          	ld	a5,0(a5)
    800024dc:	0007c783          	lbu	a5,0(a5)
    800024e0:	0017f793          	andi	a5,a5,1
    800024e4:	02078a63          	beqz	a5,80002518 <interruptRoutine+0x4c4>
                KConsole::placeInInput(*KConsole::dr);
    800024e8:	0000b797          	auipc	a5,0xb
    800024ec:	8207b783          	ld	a5,-2016(a5) # 8000cd08 <_GLOBAL_OFFSET_TABLE_+0x50>
    800024f0:	0007b783          	ld	a5,0(a5)
    800024f4:	0007c783          	lbu	a5,0(a5)
    800024f8:	00078513          	mv	a0,a5
    800024fc:	fffff097          	auipc	ra,0xfffff
    80002500:	37c080e7          	jalr	892(ra) # 80001878 <_ZN8KConsole12placeInInputEc>
    80002504:	0140006f          	j	80002518 <interruptRoutine+0x4c4>
            printString("Neki drugi prekid\n");
    80002508:	00008517          	auipc	a0,0x8
    8000250c:	ba850513          	addi	a0,a0,-1112 # 8000a0b0 <_ZZ9kPrintIntmE6digits+0x40>
    80002510:	00003097          	auipc	ra,0x3
    80002514:	7e8080e7          	jalr	2024(ra) # 80005cf8 <_Z11printStringPKc>
        plic_complete(irq);
    80002518:	f8043783          	ld	a5,-128(s0)
    8000251c:	0007879b          	sext.w	a5,a5
    80002520:	00078513          	mv	a0,a5
    80002524:	00006097          	auipc	ra,0x6
    80002528:	858080e7          	jalr	-1960(ra) # 80007d7c <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    8000252c:	fd043783          	ld	a5,-48(s0)
    80002530:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002534:	fc843783          	ld	a5,-56(s0)
    80002538:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    8000253c:	20000513          	li	a0,512
    80002540:	00000097          	auipc	ra,0x0
    80002544:	150080e7          	jalr	336(ra) # 80002690 <_ZN5Riscv6mc_sipEm>
    80002548:	0e40006f          	j	8000262c <interruptRoutine+0x5d8>
    } else if (scause == 0x8000000000000001) {
    8000254c:	fd843703          	ld	a4,-40(s0)
    80002550:	fff00793          	li	a5,-1
    80002554:	03f79793          	slli	a5,a5,0x3f
    80002558:	00178793          	addi	a5,a5,1
    8000255c:	08f71463          	bne	a4,a5,800025e4 <interruptRoutine+0x590>
        Scheduler::wake();
    80002560:	fffff097          	auipc	ra,0xfffff
    80002564:	64c080e7          	jalr	1612(ra) # 80001bac <_ZN9Scheduler4wakeEv>
        TCB::getRunningTimeSlice()++;
    80002568:	00000097          	auipc	ra,0x0
    8000256c:	1bc080e7          	jalr	444(ra) # 80002724 <_ZN3TCB19getRunningTimeSliceEv>
    80002570:	00050793          	mv	a5,a0
    80002574:	0007b703          	ld	a4,0(a5)
    80002578:	00170713          	addi	a4,a4,1
    8000257c:	00e7b023          	sd	a4,0(a5)
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
    80002580:	00000097          	auipc	ra,0x0
    80002584:	1a4080e7          	jalr	420(ra) # 80002724 <_ZN3TCB19getRunningTimeSliceEv>
    80002588:	00050793          	mv	a5,a0
    8000258c:	0007b483          	ld	s1,0(a5)
    80002590:	00000097          	auipc	ra,0x0
    80002594:	170080e7          	jalr	368(ra) # 80002700 <_ZN3TCB10getRunningEv>
    80002598:	00050793          	mv	a5,a0
    8000259c:	00078513          	mv	a0,a5
    800025a0:	00000097          	auipc	ra,0x0
    800025a4:	128080e7          	jalr	296(ra) # 800026c8 <_ZN3TCB12getTimeSliceEv>
    800025a8:	00050793          	mv	a5,a0
    800025ac:	00f4b7b3          	sltu	a5,s1,a5
    800025b0:	0017c793          	xori	a5,a5,1
    800025b4:	0ff7f793          	andi	a5,a5,255
    800025b8:	00078663          	beqz	a5,800025c4 <interruptRoutine+0x570>
            TCB::dispatch();
    800025bc:	00001097          	auipc	ra,0x1
    800025c0:	844080e7          	jalr	-1980(ra) # 80002e00 <_ZN3TCB8dispatchEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800025c4:	fd043783          	ld	a5,-48(s0)
    800025c8:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800025cc:	fc843783          	ld	a5,-56(s0)
    800025d0:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    800025d4:	00200513          	li	a0,2
    800025d8:	00000097          	auipc	ra,0x0
    800025dc:	0b8080e7          	jalr	184(ra) # 80002690 <_ZN5Riscv6mc_sipEm>
    800025e0:	04c0006f          	j	8000262c <interruptRoutine+0x5d8>
        printString("\nGreska u prekidnoj rutini\n");
    800025e4:	00008517          	auipc	a0,0x8
    800025e8:	ae450513          	addi	a0,a0,-1308 # 8000a0c8 <_ZZ9kPrintIntmE6digits+0x58>
    800025ec:	00003097          	auipc	ra,0x3
    800025f0:	70c080e7          	jalr	1804(ra) # 80005cf8 <_Z11printStringPKc>
        printString("scause: ");
    800025f4:	00008517          	auipc	a0,0x8
    800025f8:	af450513          	addi	a0,a0,-1292 # 8000a0e8 <_ZZ9kPrintIntmE6digits+0x78>
    800025fc:	00003097          	auipc	ra,0x3
    80002600:	6fc080e7          	jalr	1788(ra) # 80005cf8 <_Z11printStringPKc>
        kPrintInt(scause);
    80002604:	fd843503          	ld	a0,-40(s0)
    80002608:	fffff097          	auipc	ra,0xfffff
    8000260c:	3d8080e7          	jalr	984(ra) # 800019e0 <_Z9kPrintIntm>
        printString("\nsepc: ");
    80002610:	00008517          	auipc	a0,0x8
    80002614:	a9850513          	addi	a0,a0,-1384 # 8000a0a8 <_ZZ9kPrintIntmE6digits+0x38>
    80002618:	00003097          	auipc	ra,0x3
    8000261c:	6e0080e7          	jalr	1760(ra) # 80005cf8 <_Z11printStringPKc>
        kPrintInt(sepc);
    80002620:	fd043503          	ld	a0,-48(s0)
    80002624:	fffff097          	auipc	ra,0xfffff
    80002628:	3bc080e7          	jalr	956(ra) # 800019e0 <_Z9kPrintIntm>
    8000262c:	00000013          	nop
    80002630:	07813083          	ld	ra,120(sp)
    80002634:	07013403          	ld	s0,112(sp)
    80002638:	06813483          	ld	s1,104(sp)
    8000263c:	08010113          	addi	sp,sp,128
    80002640:	00008067          	ret

0000000080002644 <_ZN4KSemD1Ev>:
#define PROJEKAT2023_KSEM_HPP

#include "../h/ThreadQueue.hpp"

//klasa napravljena po uzoru na semafor u skolskom jezgru
class KSem {
    80002644:	fe010113          	addi	sp,sp,-32
    80002648:	00113c23          	sd	ra,24(sp)
    8000264c:	00813823          	sd	s0,16(sp)
    80002650:	00913423          	sd	s1,8(sp)
    80002654:	02010413          	addi	s0,sp,32
    80002658:	00050493          	mv	s1,a0
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    8000265c:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002660:	00050e63          	beqz	a0,8000267c <_ZN4KSemD1Ev+0x38>
            front = front->next;
    80002664:	00853783          	ld	a5,8(a0)
    80002668:	00f4b423          	sd	a5,8(s1)
            delete node;
    8000266c:	fe0508e3          	beqz	a0,8000265c <_ZN4KSemD1Ev+0x18>
            mem_free(ptr);
    80002670:	fffff097          	auipc	ra,0xfffff
    80002674:	cd8080e7          	jalr	-808(ra) # 80001348 <_Z8mem_freePv>
        }
    80002678:	fe5ff06f          	j	8000265c <_ZN4KSemD1Ev+0x18>
    8000267c:	01813083          	ld	ra,24(sp)
    80002680:	01013403          	ld	s0,16(sp)
    80002684:	00813483          	ld	s1,8(sp)
    80002688:	02010113          	addi	sp,sp,32
    8000268c:	00008067          	ret

0000000080002690 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002690:	ff010113          	addi	sp,sp,-16
    80002694:	00813423          	sd	s0,8(sp)
    80002698:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    8000269c:	14453073          	csrc	sip,a0
}
    800026a0:	00813403          	ld	s0,8(sp)
    800026a4:	01010113          	addi	sp,sp,16
    800026a8:	00008067          	ret

00000000800026ac <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    800026ac:	ff010113          	addi	sp,sp,-16
    800026b0:	00813423          	sd	s0,8(sp)
    800026b4:	01010413          	addi	s0,sp,16
    800026b8:	04b52c23          	sw	a1,88(a0)
    800026bc:	00813403          	ld	s0,8(sp)
    800026c0:	01010113          	addi	sp,sp,16
    800026c4:	00008067          	ret

00000000800026c8 <_ZN3TCB12getTimeSliceEv>:
    uint64 getTimeSlice() { return timeSlice; }
    800026c8:	ff010113          	addi	sp,sp,-16
    800026cc:	00813423          	sd	s0,8(sp)
    800026d0:	01010413          	addi	s0,sp,16
    800026d4:	02853503          	ld	a0,40(a0)
    800026d8:	00813403          	ld	s0,8(sp)
    800026dc:	01010113          	addi	sp,sp,16
    800026e0:	00008067          	ret

00000000800026e4 <_ZN3TCB7getBodyEv>:
    Body getBody() { return threadFunction; }
    800026e4:	ff010113          	addi	sp,sp,-16
    800026e8:	00813423          	sd	s0,8(sp)
    800026ec:	01010413          	addi	s0,sp,16
    800026f0:	01053503          	ld	a0,16(a0)
    800026f4:	00813403          	ld	s0,8(sp)
    800026f8:	01010113          	addi	sp,sp,16
    800026fc:	00008067          	ret

0000000080002700 <_ZN3TCB10getRunningEv>:
    static TCB* getRunning() { return running; }
    80002700:	ff010113          	addi	sp,sp,-16
    80002704:	00813423          	sd	s0,8(sp)
    80002708:	01010413          	addi	s0,sp,16
    8000270c:	0000a797          	auipc	a5,0xa
    80002710:	6147b783          	ld	a5,1556(a5) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002714:	0007b503          	ld	a0,0(a5)
    80002718:	00813403          	ld	s0,8(sp)
    8000271c:	01010113          	addi	sp,sp,16
    80002720:	00008067          	ret

0000000080002724 <_ZN3TCB19getRunningTimeSliceEv>:

    static uint64 &getRunningTimeSlice() { return runningTimeSlice; }
    80002724:	ff010113          	addi	sp,sp,-16
    80002728:	00813423          	sd	s0,8(sp)
    8000272c:	01010413          	addi	s0,sp,16
    80002730:	0000a517          	auipc	a0,0xa
    80002734:	5a053503          	ld	a0,1440(a0) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002738:	00813403          	ld	s0,8(sp)
    8000273c:	01010113          	addi	sp,sp,16
    80002740:	00008067          	ret

0000000080002744 <_ZN6Thread7wrapperEPv>:

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
    80002744:	02050863          	beqz	a0,80002774 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80002748:	ff010113          	addi	sp,sp,-16
    8000274c:	00113423          	sd	ra,8(sp)
    80002750:	00813023          	sd	s0,0(sp)
    80002754:	01010413          	addi	s0,sp,16
        ((Thread*)thread)->run();
    80002758:	00053783          	ld	a5,0(a0)
    8000275c:	0107b783          	ld	a5,16(a5)
    80002760:	000780e7          	jalr	a5
    }
}
    80002764:	00813083          	ld	ra,8(sp)
    80002768:	00013403          	ld	s0,0(sp)
    8000276c:	01010113          	addi	sp,sp,16
    80002770:	00008067          	ret
    80002774:	00008067          	ret

0000000080002778 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80002778:	fe010113          	addi	sp,sp,-32
    8000277c:	00113c23          	sd	ra,24(sp)
    80002780:	00813823          	sd	s0,16(sp)
    80002784:	00913423          	sd	s1,8(sp)
    80002788:	02010413          	addi	s0,sp,32
    8000278c:	00050493          	mv	s1,a0
    80002790:	0000a797          	auipc	a5,0xa
    80002794:	2e878793          	addi	a5,a5,744 # 8000ca78 <_ZTV6Thread+0x10>
    80002798:	00f53023          	sd	a5,0(a0)
    thread_join(this->myHandle);
    8000279c:	00853503          	ld	a0,8(a0)
    800027a0:	fffff097          	auipc	ra,0xfffff
    800027a4:	cb4080e7          	jalr	-844(ra) # 80001454 <_Z11thread_joinP3TCB>
    delete myHandle;
    800027a8:	0084b483          	ld	s1,8(s1)
    800027ac:	02048863          	beqz	s1,800027dc <_ZN6ThreadD1Ev+0x64>
        return front == nullptr;
    800027b0:	0484b503          	ld	a0,72(s1)
        while (!isEmpty()) {
    800027b4:	00050e63          	beqz	a0,800027d0 <_ZN6ThreadD1Ev+0x58>
            front = front->next;
    800027b8:	00853783          	ld	a5,8(a0)
    800027bc:	04f4b423          	sd	a5,72(s1)
            delete node;
    800027c0:	fe0508e3          	beqz	a0,800027b0 <_ZN6ThreadD1Ev+0x38>
            mem_free(ptr);
    800027c4:	fffff097          	auipc	ra,0xfffff
    800027c8:	b84080e7          	jalr	-1148(ra) # 80001348 <_Z8mem_freePv>
        }
    800027cc:	fe5ff06f          	j	800027b0 <_ZN6ThreadD1Ev+0x38>
    800027d0:	00048513          	mv	a0,s1
    800027d4:	00000097          	auipc	ra,0x0
    800027d8:	7bc080e7          	jalr	1980(ra) # 80002f90 <_ZN3TCBdlEPv>
}
    800027dc:	01813083          	ld	ra,24(sp)
    800027e0:	01013403          	ld	s0,16(sp)
    800027e4:	00813483          	ld	s1,8(sp)
    800027e8:	02010113          	addi	sp,sp,32
    800027ec:	00008067          	ret

00000000800027f0 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800027f0:	fe010113          	addi	sp,sp,-32
    800027f4:	00113c23          	sd	ra,24(sp)
    800027f8:	00813823          	sd	s0,16(sp)
    800027fc:	00913423          	sd	s1,8(sp)
    80002800:	02010413          	addi	s0,sp,32
    80002804:	00050493          	mv	s1,a0
    80002808:	0000a797          	auipc	a5,0xa
    8000280c:	29878793          	addi	a5,a5,664 # 8000caa0 <_ZTV9Semaphore+0x10>
    80002810:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80002814:	00853503          	ld	a0,8(a0)
    80002818:	fffff097          	auipc	ra,0xfffff
    8000281c:	ccc080e7          	jalr	-820(ra) # 800014e4 <_Z9sem_closeP4KSem>
    delete myHandle;
    80002820:	0084b483          	ld	s1,8(s1)
    80002824:	02048863          	beqz	s1,80002854 <_ZN9SemaphoreD1Ev+0x64>
        return front == nullptr;
    80002828:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    8000282c:	00050e63          	beqz	a0,80002848 <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    80002830:	00853783          	ld	a5,8(a0)
    80002834:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002838:	fe0508e3          	beqz	a0,80002828 <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    8000283c:	fffff097          	auipc	ra,0xfffff
    80002840:	b0c080e7          	jalr	-1268(ra) # 80001348 <_Z8mem_freePv>
        }
    80002844:	fe5ff06f          	j	80002828 <_ZN9SemaphoreD1Ev+0x38>
    80002848:	00048513          	mv	a0,s1
    8000284c:	00001097          	auipc	ra,0x1
    80002850:	898080e7          	jalr	-1896(ra) # 800030e4 <_ZN4KSemdlEPv>
}
    80002854:	01813083          	ld	ra,24(sp)
    80002858:	01013403          	ld	s0,16(sp)
    8000285c:	00813483          	ld	s1,8(sp)
    80002860:	02010113          	addi	sp,sp,32
    80002864:	00008067          	ret

0000000080002868 <_Znwm>:
void* operator new(size_t size) {
    80002868:	ff010113          	addi	sp,sp,-16
    8000286c:	00113423          	sd	ra,8(sp)
    80002870:	00813023          	sd	s0,0(sp)
    80002874:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002878:	fffff097          	auipc	ra,0xfffff
    8000287c:	a90080e7          	jalr	-1392(ra) # 80001308 <_Z9mem_allocm>
}
    80002880:	00813083          	ld	ra,8(sp)
    80002884:	00013403          	ld	s0,0(sp)
    80002888:	01010113          	addi	sp,sp,16
    8000288c:	00008067          	ret

0000000080002890 <_Znam>:
void* operator new[](size_t size) {
    80002890:	ff010113          	addi	sp,sp,-16
    80002894:	00113423          	sd	ra,8(sp)
    80002898:	00813023          	sd	s0,0(sp)
    8000289c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800028a0:	fffff097          	auipc	ra,0xfffff
    800028a4:	a68080e7          	jalr	-1432(ra) # 80001308 <_Z9mem_allocm>
}
    800028a8:	00813083          	ld	ra,8(sp)
    800028ac:	00013403          	ld	s0,0(sp)
    800028b0:	01010113          	addi	sp,sp,16
    800028b4:	00008067          	ret

00000000800028b8 <_ZdlPv>:
noexcept {
    800028b8:	ff010113          	addi	sp,sp,-16
    800028bc:	00113423          	sd	ra,8(sp)
    800028c0:	00813023          	sd	s0,0(sp)
    800028c4:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800028c8:	fffff097          	auipc	ra,0xfffff
    800028cc:	a80080e7          	jalr	-1408(ra) # 80001348 <_Z8mem_freePv>
}
    800028d0:	00813083          	ld	ra,8(sp)
    800028d4:	00013403          	ld	s0,0(sp)
    800028d8:	01010113          	addi	sp,sp,16
    800028dc:	00008067          	ret

00000000800028e0 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800028e0:	fe010113          	addi	sp,sp,-32
    800028e4:	00113c23          	sd	ra,24(sp)
    800028e8:	00813823          	sd	s0,16(sp)
    800028ec:	00913423          	sd	s1,8(sp)
    800028f0:	02010413          	addi	s0,sp,32
    800028f4:	00050493          	mv	s1,a0
}
    800028f8:	00000097          	auipc	ra,0x0
    800028fc:	e80080e7          	jalr	-384(ra) # 80002778 <_ZN6ThreadD1Ev>
    80002900:	00048513          	mv	a0,s1
    80002904:	00000097          	auipc	ra,0x0
    80002908:	fb4080e7          	jalr	-76(ra) # 800028b8 <_ZdlPv>
    8000290c:	01813083          	ld	ra,24(sp)
    80002910:	01013403          	ld	s0,16(sp)
    80002914:	00813483          	ld	s1,8(sp)
    80002918:	02010113          	addi	sp,sp,32
    8000291c:	00008067          	ret

0000000080002920 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002920:	fe010113          	addi	sp,sp,-32
    80002924:	00113c23          	sd	ra,24(sp)
    80002928:	00813823          	sd	s0,16(sp)
    8000292c:	00913423          	sd	s1,8(sp)
    80002930:	02010413          	addi	s0,sp,32
    80002934:	00050493          	mv	s1,a0
}
    80002938:	00000097          	auipc	ra,0x0
    8000293c:	eb8080e7          	jalr	-328(ra) # 800027f0 <_ZN9SemaphoreD1Ev>
    80002940:	00048513          	mv	a0,s1
    80002944:	00000097          	auipc	ra,0x0
    80002948:	f74080e7          	jalr	-140(ra) # 800028b8 <_ZdlPv>
    8000294c:	01813083          	ld	ra,24(sp)
    80002950:	01013403          	ld	s0,16(sp)
    80002954:	00813483          	ld	s1,8(sp)
    80002958:	02010113          	addi	sp,sp,32
    8000295c:	00008067          	ret

0000000080002960 <_ZdaPv>:
noexcept {
    80002960:	ff010113          	addi	sp,sp,-16
    80002964:	00113423          	sd	ra,8(sp)
    80002968:	00813023          	sd	s0,0(sp)
    8000296c:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002970:	fffff097          	auipc	ra,0xfffff
    80002974:	9d8080e7          	jalr	-1576(ra) # 80001348 <_Z8mem_freePv>
}
    80002978:	00813083          	ld	ra,8(sp)
    8000297c:	00013403          	ld	s0,0(sp)
    80002980:	01010113          	addi	sp,sp,16
    80002984:	00008067          	ret

0000000080002988 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80002988:	fd010113          	addi	sp,sp,-48
    8000298c:	02113423          	sd	ra,40(sp)
    80002990:	02813023          	sd	s0,32(sp)
    80002994:	00913c23          	sd	s1,24(sp)
    80002998:	01213823          	sd	s2,16(sp)
    8000299c:	01313423          	sd	s3,8(sp)
    800029a0:	03010413          	addi	s0,sp,48
    800029a4:	00050493          	mv	s1,a0
    800029a8:	00058913          	mv	s2,a1
    800029ac:	00060993          	mv	s3,a2
    800029b0:	0000a797          	auipc	a5,0xa
    800029b4:	0c878793          	addi	a5,a5,200 # 8000ca78 <_ZTV6Thread+0x10>
    800029b8:	00f53023          	sd	a5,0(a0)
    this->body = body;
    800029bc:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    800029c0:	00c53c23          	sd	a2,24(a0)
    if (body != (TCB::Body)main) {
    800029c4:	0000a797          	auipc	a5,0xa
    800029c8:	34c7b783          	ld	a5,844(a5) # 8000cd10 <_GLOBAL_OFFSET_TABLE_+0x58>
    800029cc:	04f58663          	beq	a1,a5,80002a18 <_ZN6ThreadC1EPFvPvES0_+0x90>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800029d0:	00001537          	lui	a0,0x1
    800029d4:	fffff097          	auipc	ra,0xfffff
    800029d8:	934080e7          	jalr	-1740(ra) # 80001308 <_Z9mem_allocm>
    800029dc:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800029e0:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800029e4:	00098693          	mv	a3,s3
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800029e8:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800029ec:	00848493          	addi	s1,s1,8
    800029f0:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    800029f4:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    800029f8:	00000073          	ecall
}
    800029fc:	02813083          	ld	ra,40(sp)
    80002a00:	02013403          	ld	s0,32(sp)
    80002a04:	01813483          	ld	s1,24(sp)
    80002a08:	01013903          	ld	s2,16(sp)
    80002a0c:	00813983          	ld	s3,8(sp)
    80002a10:	03010113          	addi	sp,sp,48
    80002a14:	00008067          	ret
    uint64* stack = nullptr;
    80002a18:	00000313          	li	t1,0
    80002a1c:	fc5ff06f          	j	800029e0 <_ZN6ThreadC1EPFvPvES0_+0x58>

0000000080002a20 <_ZN6Thread5startEv>:
int Thread::start() {
    80002a20:	ff010113          	addi	sp,sp,-16
    80002a24:	00813423          	sd	s0,8(sp)
    80002a28:	01010413          	addi	s0,sp,16
    if (myHandle == nullptr) return -1;
    80002a2c:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002a30:	02030063          	beqz	t1,80002a50 <_ZN6Thread5startEv+0x30>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a34:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    80002a38:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    80002a3c:	00000073          	ecall
    return 0;
    80002a40:	00000513          	li	a0,0
}
    80002a44:	00813403          	ld	s0,8(sp)
    80002a48:	01010113          	addi	sp,sp,16
    80002a4c:	00008067          	ret
    if (myHandle == nullptr) return -1;
    80002a50:	fff00513          	li	a0,-1
    80002a54:	ff1ff06f          	j	80002a44 <_ZN6Thread5startEv+0x24>

0000000080002a58 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002a58:	ff010113          	addi	sp,sp,-16
    80002a5c:	00113423          	sd	ra,8(sp)
    80002a60:	00813023          	sd	s0,0(sp)
    80002a64:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80002a68:	00853503          	ld	a0,8(a0)
    80002a6c:	fffff097          	auipc	ra,0xfffff
    80002a70:	9e8080e7          	jalr	-1560(ra) # 80001454 <_Z11thread_joinP3TCB>
}
    80002a74:	00813083          	ld	ra,8(sp)
    80002a78:	00013403          	ld	s0,0(sp)
    80002a7c:	01010113          	addi	sp,sp,16
    80002a80:	00008067          	ret

0000000080002a84 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002a84:	ff010113          	addi	sp,sp,-16
    80002a88:	00113423          	sd	ra,8(sp)
    80002a8c:	00813023          	sd	s0,0(sp)
    80002a90:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002a94:	fffff097          	auipc	ra,0xfffff
    80002a98:	9a0080e7          	jalr	-1632(ra) # 80001434 <_Z15thread_dispatchv>
}
    80002a9c:	00813083          	ld	ra,8(sp)
    80002aa0:	00013403          	ld	s0,0(sp)
    80002aa4:	01010113          	addi	sp,sp,16
    80002aa8:	00008067          	ret

0000000080002aac <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80002aac:	ff010113          	addi	sp,sp,-16
    80002ab0:	00113423          	sd	ra,8(sp)
    80002ab4:	00813023          	sd	s0,0(sp)
    80002ab8:	01010413          	addi	s0,sp,16
    time_sleep(t);
    80002abc:	fffff097          	auipc	ra,0xfffff
    80002ac0:	9c0080e7          	jalr	-1600(ra) # 8000147c <_Z10time_sleepm>
}
    80002ac4:	00000513          	li	a0,0
    80002ac8:	00813083          	ld	ra,8(sp)
    80002acc:	00013403          	ld	s0,0(sp)
    80002ad0:	01010113          	addi	sp,sp,16
    80002ad4:	00008067          	ret

0000000080002ad8 <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    80002ad8:	fe010113          	addi	sp,sp,-32
    80002adc:	00113c23          	sd	ra,24(sp)
    80002ae0:	00813823          	sd	s0,16(sp)
    80002ae4:	00913423          	sd	s1,8(sp)
    80002ae8:	02010413          	addi	s0,sp,32
    80002aec:	00050493          	mv	s1,a0
    while (period != -1UL) {
    80002af0:	0204b703          	ld	a4,32(s1)
    80002af4:	fff00793          	li	a5,-1
    80002af8:	02f70663          	beq	a4,a5,80002b24 <_ZN14PeriodicThread3runEv+0x4c>
        periodicActivation();
    80002afc:	0004b783          	ld	a5,0(s1)
    80002b00:	0187b783          	ld	a5,24(a5)
    80002b04:	00048513          	mv	a0,s1
    80002b08:	000780e7          	jalr	a5
        if (period == -1UL) break;
    80002b0c:	0204b503          	ld	a0,32(s1)
    80002b10:	fff00793          	li	a5,-1
    80002b14:	00f50863          	beq	a0,a5,80002b24 <_ZN14PeriodicThread3runEv+0x4c>
        sleep(period);
    80002b18:	00000097          	auipc	ra,0x0
    80002b1c:	f94080e7          	jalr	-108(ra) # 80002aac <_ZN6Thread5sleepEm>
    while (period != -1UL) {
    80002b20:	fd1ff06f          	j	80002af0 <_ZN14PeriodicThread3runEv+0x18>
    }
    thread_exit();
    80002b24:	fffff097          	auipc	ra,0xfffff
    80002b28:	8e8080e7          	jalr	-1816(ra) # 8000140c <_Z11thread_exitv>
}
    80002b2c:	01813083          	ld	ra,24(sp)
    80002b30:	01013403          	ld	s0,16(sp)
    80002b34:	00813483          	ld	s1,8(sp)
    80002b38:	02010113          	addi	sp,sp,32
    80002b3c:	00008067          	ret

0000000080002b40 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002b40:	fe010113          	addi	sp,sp,-32
    80002b44:	00113c23          	sd	ra,24(sp)
    80002b48:	00813823          	sd	s0,16(sp)
    80002b4c:	00913423          	sd	s1,8(sp)
    80002b50:	02010413          	addi	s0,sp,32
    80002b54:	00050493          	mv	s1,a0
    80002b58:	0000a797          	auipc	a5,0xa
    80002b5c:	f2078793          	addi	a5,a5,-224 # 8000ca78 <_ZTV6Thread+0x10>
    80002b60:	00f53023          	sd	a5,0(a0)
    this->body = wrapper;
    80002b64:	00000797          	auipc	a5,0x0
    80002b68:	be078793          	addi	a5,a5,-1056 # 80002744 <_ZN6Thread7wrapperEPv>
    80002b6c:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80002b70:	00a53c23          	sd	a0,24(a0)
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002b74:	00001537          	lui	a0,0x1
    80002b78:	ffffe097          	auipc	ra,0xffffe
    80002b7c:	790080e7          	jalr	1936(ra) # 80001308 <_Z9mem_allocm>
    80002b80:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002b84:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002b88:	0184b303          	ld	t1,24(s1)
    80002b8c:	00030693          	mv	a3,t1
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002b90:	0104b303          	ld	t1,16(s1)
    80002b94:	00030613          	mv	a2,t1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002b98:	00848493          	addi	s1,s1,8
    80002b9c:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002ba0:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002ba4:	00000073          	ecall
}
    80002ba8:	01813083          	ld	ra,24(sp)
    80002bac:	01013403          	ld	s0,16(sp)
    80002bb0:	00813483          	ld	s1,8(sp)
    80002bb4:	02010113          	addi	sp,sp,32
    80002bb8:	00008067          	ret

0000000080002bbc <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002bbc:	ff010113          	addi	sp,sp,-16
    80002bc0:	00113423          	sd	ra,8(sp)
    80002bc4:	00813023          	sd	s0,0(sp)
    80002bc8:	01010413          	addi	s0,sp,16
    80002bcc:	0000a797          	auipc	a5,0xa
    80002bd0:	ed478793          	addi	a5,a5,-300 # 8000caa0 <_ZTV9Semaphore+0x10>
    80002bd4:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle, init);
    80002bd8:	00850513          	addi	a0,a0,8
    80002bdc:	fffff097          	auipc	ra,0xfffff
    80002be0:	8d0080e7          	jalr	-1840(ra) # 800014ac <_Z8sem_openPP4KSemj>
}
    80002be4:	00813083          	ld	ra,8(sp)
    80002be8:	00013403          	ld	s0,0(sp)
    80002bec:	01010113          	addi	sp,sp,16
    80002bf0:	00008067          	ret

0000000080002bf4 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002bf4:	ff010113          	addi	sp,sp,-16
    80002bf8:	00113423          	sd	ra,8(sp)
    80002bfc:	00813023          	sd	s0,0(sp)
    80002c00:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002c04:	00853503          	ld	a0,8(a0)
    80002c08:	fffff097          	auipc	ra,0xfffff
    80002c0c:	90c080e7          	jalr	-1780(ra) # 80001514 <_Z8sem_waitP4KSem>
}
    80002c10:	00813083          	ld	ra,8(sp)
    80002c14:	00013403          	ld	s0,0(sp)
    80002c18:	01010113          	addi	sp,sp,16
    80002c1c:	00008067          	ret

0000000080002c20 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002c20:	ff010113          	addi	sp,sp,-16
    80002c24:	00113423          	sd	ra,8(sp)
    80002c28:	00813023          	sd	s0,0(sp)
    80002c2c:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80002c30:	00853503          	ld	a0,8(a0)
    80002c34:	fffff097          	auipc	ra,0xfffff
    80002c38:	910080e7          	jalr	-1776(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    80002c3c:	00813083          	ld	ra,8(sp)
    80002c40:	00013403          	ld	s0,0(sp)
    80002c44:	01010113          	addi	sp,sp,16
    80002c48:	00008067          	ret

0000000080002c4c <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002c4c:	ff010113          	addi	sp,sp,-16
    80002c50:	00813423          	sd	s0,8(sp)
    80002c54:	01010413          	addi	s0,sp,16
    this->period = -1;
    80002c58:	fff00793          	li	a5,-1
    80002c5c:	02f53023          	sd	a5,32(a0)
}
    80002c60:	00813403          	ld	s0,8(sp)
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
    80002c90:	eb4080e7          	jalr	-332(ra) # 80002b40 <_ZN6ThreadC1Ev>
    80002c94:	0000a797          	auipc	a5,0xa
    80002c98:	e2c78793          	addi	a5,a5,-468 # 8000cac0 <_ZTV14PeriodicThread+0x10>
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
    80002cd0:	8a8080e7          	jalr	-1880(ra) # 80001574 <_Z4getcv>
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
    80002cf8:	8a8080e7          	jalr	-1880(ra) # 8000159c <_Z4putcc>
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
    80002d50:	d7478793          	addi	a5,a5,-652 # 8000cac0 <_ZTV14PeriodicThread+0x10>
    80002d54:	00f53023          	sd	a5,0(a0)
    80002d58:	00000097          	auipc	ra,0x0
    80002d5c:	a20080e7          	jalr	-1504(ra) # 80002778 <_ZN6ThreadD1Ev>
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
    80002d8c:	d3878793          	addi	a5,a5,-712 # 8000cac0 <_ZTV14PeriodicThread+0x10>
    80002d90:	00f53023          	sd	a5,0(a0)
    80002d94:	00000097          	auipc	ra,0x0
    80002d98:	9e4080e7          	jalr	-1564(ra) # 80002778 <_ZN6ThreadD1Ev>
    80002d9c:	00048513          	mv	a0,s1
    80002da0:	00000097          	auipc	ra,0x0
    80002da4:	b18080e7          	jalr	-1256(ra) # 800028b8 <_ZdlPv>
    80002da8:	01813083          	ld	ra,24(sp)
    80002dac:	01013403          	ld	s0,16(sp)
    80002db0:	00813483          	ld	s1,8(sp)
    80002db4:	02010113          	addi	sp,sp,32
    80002db8:	00008067          	ret

0000000080002dbc <_ZN3TCB7wrapperEv>:
    }

    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
}

void TCB::wrapper() {
    80002dbc:	ff010113          	addi	sp,sp,-16
    80002dc0:	00113423          	sd	ra,8(sp)
    80002dc4:	00813023          	sd	s0,0(sp)
    80002dc8:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch)
    Riscv::returnFromInterrupt();
    80002dcc:	00000097          	auipc	ra,0x0
    80002dd0:	2d0080e7          	jalr	720(ra) # 8000309c <_ZN5Riscv19returnFromInterruptEv>
    //na dalje se izvrsavamo u user modu (osim za kernel funkcije)
    running->threadFunction(running->args);
    80002dd4:	0000a797          	auipc	a5,0xa
    80002dd8:	0b47b783          	ld	a5,180(a5) # 8000ce88 <_ZN3TCB7runningE>
    80002ddc:	0107b703          	ld	a4,16(a5)
    80002de0:	0207b503          	ld	a0,32(a5)
    80002de4:	000700e7          	jalr	a4
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    80002de8:	ffffe097          	auipc	ra,0xffffe
    80002dec:	624080e7          	jalr	1572(ra) # 8000140c <_Z11thread_exitv>
}
    80002df0:	00813083          	ld	ra,8(sp)
    80002df4:	00013403          	ld	s0,0(sp)
    80002df8:	01010113          	addi	sp,sp,16
    80002dfc:	00008067          	ret

0000000080002e00 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002e00:	fe010113          	addi	sp,sp,-32
    80002e04:	00113c23          	sd	ra,24(sp)
    80002e08:	00813823          	sd	s0,16(sp)
    80002e0c:	00913423          	sd	s1,8(sp)
    80002e10:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    80002e14:	0000a497          	auipc	s1,0xa
    80002e18:	0744b483          	ld	s1,116(s1) # 8000ce88 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    80002e1c:	0584a703          	lw	a4,88(s1)
    80002e20:	00100793          	li	a5,1
    80002e24:	04f70a63          	beq	a4,a5,80002e78 <_ZN3TCB8dispatchEv+0x78>
    TCB::running = Scheduler::get();
    80002e28:	fffff097          	auipc	ra,0xfffff
    80002e2c:	c94080e7          	jalr	-876(ra) # 80001abc <_ZN9Scheduler3getEv>
    80002e30:	00050593          	mv	a1,a0
    80002e34:	0000a797          	auipc	a5,0xa
    80002e38:	05478793          	addi	a5,a5,84 # 8000ce88 <_ZN3TCB7runningE>
    80002e3c:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80002e40:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == (TCB::Body)main || TCB::running->threadFunction == kernelConsumerFunction ||
    80002e44:	01053783          	ld	a5,16(a0)
    80002e48:	0000a717          	auipc	a4,0xa
    80002e4c:	ec873703          	ld	a4,-312(a4) # 8000cd10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002e50:	02e78c63          	beq	a5,a4,80002e88 <_ZN3TCB8dispatchEv+0x88>
    80002e54:	0000a717          	auipc	a4,0xa
    80002e58:	e9c73703          	ld	a4,-356(a4) # 8000ccf0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002e5c:	02e78663          	beq	a5,a4,80002e88 <_ZN3TCB8dispatchEv+0x88>
    80002e60:	0000a717          	auipc	a4,0xa
    80002e64:	ed873703          	ld	a4,-296(a4) # 8000cd38 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002e68:	02e78063          	beq	a5,a4,80002e88 <_ZN3TCB8dispatchEv+0x88>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002e6c:	10000793          	li	a5,256
    80002e70:	1007b073          	csrc	sstatus,a5
}
    80002e74:	01c0006f          	j	80002e90 <_ZN3TCB8dispatchEv+0x90>
        Scheduler::put(old);
    80002e78:	00048513          	mv	a0,s1
    80002e7c:	fffff097          	auipc	ra,0xfffff
    80002e80:	bf4080e7          	jalr	-1036(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
    80002e84:	fa5ff06f          	j	80002e28 <_ZN3TCB8dispatchEv+0x28>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002e88:	10000793          	li	a5,256
    80002e8c:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002e90:	00b48863          	beq	s1,a1,80002ea0 <_ZN3TCB8dispatchEv+0xa0>
    80002e94:	00048513          	mv	a0,s1
    80002e98:	ffffe097          	auipc	ra,0xffffe
    80002e9c:	278080e7          	jalr	632(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002ea0:	01813083          	ld	ra,24(sp)
    80002ea4:	01013403          	ld	s0,16(sp)
    80002ea8:	00813483          	ld	s1,8(sp)
    80002eac:	02010113          	addi	sp,sp,32
    80002eb0:	00008067          	ret

0000000080002eb4 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002eb4:	ff010113          	addi	sp,sp,-16
    80002eb8:	00113423          	sd	ra,8(sp)
    80002ebc:	00813023          	sd	s0,0(sp)
    80002ec0:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002ec4:	ffffe097          	auipc	ra,0xffffe
    80002ec8:	444080e7          	jalr	1092(ra) # 80001308 <_Z9mem_allocm>
}
    80002ecc:	00813083          	ld	ra,8(sp)
    80002ed0:	00013403          	ld	s0,0(sp)
    80002ed4:	01010113          	addi	sp,sp,16
    80002ed8:	00008067          	ret

0000000080002edc <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002edc:	fd010113          	addi	sp,sp,-48
    80002ee0:	02113423          	sd	ra,40(sp)
    80002ee4:	02813023          	sd	s0,32(sp)
    80002ee8:	00913c23          	sd	s1,24(sp)
    80002eec:	01213823          	sd	s2,16(sp)
    80002ef0:	01313423          	sd	s3,8(sp)
    80002ef4:	03010413          	addi	s0,sp,48
    80002ef8:	00050913          	mv	s2,a0
    80002efc:	00058993          	mv	s3,a1
    80002f00:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    80002f04:	06000513          	li	a0,96
    80002f08:	00000097          	auipc	ra,0x0
    80002f0c:	fac080e7          	jalr	-84(ra) # 80002eb4 <_ZN3TCBnwEm>

private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED) {
    80002f10:	01253823          	sd	s2,16(a0)
    80002f14:	00953c23          	sd	s1,24(a0)
    80002f18:	03353023          	sd	s3,32(a0)
    80002f1c:	00200793          	li	a5,2
    80002f20:	02f53423          	sd	a5,40(a0)
    80002f24:	02053823          	sd	zero,48(a0)
    80002f28:	02053c23          	sd	zero,56(a0)
    80002f2c:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80002f30:	04053423          	sd	zero,72(a0)
    80002f34:	04053823          	sd	zero,80(a0)
    80002f38:	04052c23          	sw	zero,88(a0)
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80002f3c:	0000a797          	auipc	a5,0xa
    80002f40:	dd47b783          	ld	a5,-556(a5) # 8000cd10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002f44:	02f90e63          	beq	s2,a5,80002f80 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002f48:	00000797          	auipc	a5,0x0
    80002f4c:	e7478793          	addi	a5,a5,-396 # 80002dbc <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002f50:	02048c63          	beqz	s1,80002f88 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002f54:	00001637          	lui	a2,0x1
    80002f58:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    80002f5c:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    80002f60:	00953423          	sd	s1,8(a0)
}
    80002f64:	02813083          	ld	ra,40(sp)
    80002f68:	02013403          	ld	s0,32(sp)
    80002f6c:	01813483          	ld	s1,24(sp)
    80002f70:	01013903          	ld	s2,16(sp)
    80002f74:	00813983          	ld	s3,8(sp)
    80002f78:	03010113          	addi	sp,sp,48
    80002f7c:	00008067          	ret
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80002f80:	00000793          	li	a5,0
    80002f84:	fcdff06f          	j	80002f50 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002f88:	00000493          	li	s1,0
    80002f8c:	fd1ff06f          	j	80002f5c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x80>

0000000080002f90 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002f90:	ff010113          	addi	sp,sp,-16
    80002f94:	00113423          	sd	ra,8(sp)
    80002f98:	00813023          	sd	s0,0(sp)
    80002f9c:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002fa0:	ffffe097          	auipc	ra,0xffffe
    80002fa4:	3a8080e7          	jalr	936(ra) # 80001348 <_Z8mem_freePv>
}
    80002fa8:	00813083          	ld	ra,8(sp)
    80002fac:	00013403          	ld	s0,0(sp)
    80002fb0:	01010113          	addi	sp,sp,16
    80002fb4:	00008067          	ret

0000000080002fb8 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED || TCB::running == handle) return;
    80002fb8:	05852703          	lw	a4,88(a0)
    80002fbc:	00500793          	li	a5,5
    80002fc0:	04f70263          	beq	a4,a5,80003004 <_ZN3TCB10threadJoinEPS_+0x4c>
    80002fc4:	0000a597          	auipc	a1,0xa
    80002fc8:	ec45b583          	ld	a1,-316(a1) # 8000ce88 <_ZN3TCB7runningE>
    80002fcc:	02a58c63          	beq	a1,a0,80003004 <_ZN3TCB10threadJoinEPS_+0x4c>
void TCB::threadJoin(TCB* handle) {
    80002fd0:	ff010113          	addi	sp,sp,-16
    80002fd4:	00113423          	sd	ra,8(sp)
    80002fd8:	00813023          	sd	s0,0(sp)
    80002fdc:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    80002fe0:	00300793          	li	a5,3
    80002fe4:	04f5ac23          	sw	a5,88(a1)
    handle->waitingToJoin.putLast(TCB::running);
    80002fe8:	04850513          	addi	a0,a0,72
    80002fec:	ffffe097          	auipc	ra,0xffffe
    80002ff0:	250080e7          	jalr	592(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002ff4:	00813083          	ld	ra,8(sp)
    80002ff8:	00013403          	ld	s0,0(sp)
    80002ffc:	01010113          	addi	sp,sp,16
    80003000:	00008067          	ret
    80003004:	00008067          	ret

0000000080003008 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80003008:	0000a517          	auipc	a0,0xa
    8000300c:	e8053503          	ld	a0,-384(a0) # 8000ce88 <_ZN3TCB7runningE>
        return front == nullptr;
    80003010:	04853783          	ld	a5,72(a0)
    80003014:	04078463          	beqz	a5,8000305c <_ZN3TCB13releaseJoinedEv+0x54>
void TCB::releaseJoined() {
    80003018:	ff010113          	addi	sp,sp,-16
    8000301c:	00113423          	sd	ra,8(sp)
    80003020:	00813023          	sd	s0,0(sp)
    80003024:	01010413          	addi	s0,sp,16
        TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80003028:	04850513          	addi	a0,a0,72
    8000302c:	ffffe097          	auipc	ra,0xffffe
    80003030:	27c080e7          	jalr	636(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
        Scheduler::put(tcb);
    80003034:	fffff097          	auipc	ra,0xfffff
    80003038:	a3c080e7          	jalr	-1476(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
    while (!TCB::running->waitingToJoin.isEmpty()) {
    8000303c:	0000a517          	auipc	a0,0xa
    80003040:	e4c53503          	ld	a0,-436(a0) # 8000ce88 <_ZN3TCB7runningE>
    80003044:	04853783          	ld	a5,72(a0)
    80003048:	fe0790e3          	bnez	a5,80003028 <_ZN3TCB13releaseJoinedEv+0x20>
    }
}
    8000304c:	00813083          	ld	ra,8(sp)
    80003050:	00013403          	ld	s0,0(sp)
    80003054:	01010113          	addi	sp,sp,16
    80003058:	00008067          	ret
    8000305c:	00008067          	ret

0000000080003060 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
    //startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
    if (newTcb->threadFunction != (TCB::Body)main) {
    80003060:	01053703          	ld	a4,16(a0)
    80003064:	0000a797          	auipc	a5,0xa
    80003068:	cac7b783          	ld	a5,-852(a5) # 8000cd10 <_GLOBAL_OFFSET_TABLE_+0x58>
    8000306c:	02f70663          	beq	a4,a5,80003098 <_ZN3TCB5startEPS_+0x38>
void TCB::start(TCB* newTcb) {
    80003070:	ff010113          	addi	sp,sp,-16
    80003074:	00113423          	sd	ra,8(sp)
    80003078:	00813023          	sd	s0,0(sp)
    8000307c:	01010413          	addi	s0,sp,16
        Scheduler::put(newTcb);
    80003080:	fffff097          	auipc	ra,0xfffff
    80003084:	9f0080e7          	jalr	-1552(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
    }
}
    80003088:	00813083          	ld	ra,8(sp)
    8000308c:	00013403          	ld	s0,0(sp)
    80003090:	01010113          	addi	sp,sp,16
    80003094:	00008067          	ret
    80003098:	00008067          	ret

000000008000309c <_ZN5Riscv19returnFromInterruptEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::returnFromInterrupt() {
    8000309c:	ff010113          	addi	sp,sp,-16
    800030a0:	00813423          	sd	s0,8(sp)
    800030a4:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    800030a8:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    800030ac:	10200073          	sret
    800030b0:	00813403          	ld	s0,8(sp)
    800030b4:	01010113          	addi	sp,sp,16
    800030b8:	00008067          	ret

00000000800030bc <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    800030bc:	ff010113          	addi	sp,sp,-16
    800030c0:	00113423          	sd	ra,8(sp)
    800030c4:	00813023          	sd	s0,0(sp)
    800030c8:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800030cc:	ffffe097          	auipc	ra,0xffffe
    800030d0:	23c080e7          	jalr	572(ra) # 80001308 <_Z9mem_allocm>
}
    800030d4:	00813083          	ld	ra,8(sp)
    800030d8:	00013403          	ld	s0,0(sp)
    800030dc:	01010113          	addi	sp,sp,16
    800030e0:	00008067          	ret

00000000800030e4 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    800030e4:	ff010113          	addi	sp,sp,-16
    800030e8:	00113423          	sd	ra,8(sp)
    800030ec:	00813023          	sd	s0,0(sp)
    800030f0:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    800030f4:	ffffe097          	auipc	ra,0xffffe
    800030f8:	254080e7          	jalr	596(ra) # 80001348 <_Z8mem_freePv>
}
    800030fc:	00813083          	ld	ra,8(sp)
    80003100:	00013403          	ld	s0,0(sp)
    80003104:	01010113          	addi	sp,sp,16
    80003108:	00008067          	ret

000000008000310c <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    8000310c:	fe010113          	addi	sp,sp,-32
    80003110:	00113c23          	sd	ra,24(sp)
    80003114:	00813823          	sd	s0,16(sp)
    80003118:	00913423          	sd	s1,8(sp)
    8000311c:	02010413          	addi	s0,sp,32
    80003120:	00050493          	mv	s1,a0
	return new KSem(val);
    80003124:	02000513          	li	a0,32
    80003128:	00000097          	auipc	ra,0x0
    8000312c:	f94080e7          	jalr	-108(ra) # 800030bc <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    80003130:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003134:	00053423          	sd	zero,8(a0)
    80003138:	00053823          	sd	zero,16(a0)
    8000313c:	00100713          	li	a4,1
    80003140:	00e50c23          	sb	a4,24(a0)
}
    80003144:	01813083          	ld	ra,24(sp)
    80003148:	01013403          	ld	s0,16(sp)
    8000314c:	00813483          	ld	s1,8(sp)
    80003150:	02010113          	addi	sp,sp,32
    80003154:	00008067          	ret

0000000080003158 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003158:	ff010113          	addi	sp,sp,-16
    8000315c:	00113423          	sd	ra,8(sp)
    80003160:	00813023          	sd	s0,0(sp)
    80003164:	01010413          	addi	s0,sp,16

    80003168:	0000a797          	auipc	a5,0xa
    8000316c:	bb87b783          	ld	a5,-1096(a5) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003170:	0007b583          	ld	a1,0(a5)

    80003174:	00200793          	li	a5,2
    80003178:	04f5ac23          	sw	a5,88(a1)
    TCB::getRunning()->setStatus(TCB::BLOCKED);
	blocked.putLast(TCB::getRunning());
    8000317c:	00850513          	addi	a0,a0,8
    80003180:	ffffe097          	auipc	ra,0xffffe
    80003184:	0bc080e7          	jalr	188(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::dispatch();
    80003188:	00000097          	auipc	ra,0x0
    8000318c:	c78080e7          	jalr	-904(ra) # 80002e00 <_ZN3TCB8dispatchEv>
}
    80003190:	00813083          	ld	ra,8(sp)
    80003194:	00013403          	ld	s0,0(sp)
    80003198:	01010113          	addi	sp,sp,16
    8000319c:	00008067          	ret

00000000800031a0 <_ZN4KSem4waitEv>:
	if (!working) return -3;
    800031a0:	01854783          	lbu	a5,24(a0)
    800031a4:	04078663          	beqz	a5,800031f0 <_ZN4KSem4waitEv+0x50>
	if (--val < 0) {
    800031a8:	00052783          	lw	a5,0(a0)
    800031ac:	fff7879b          	addiw	a5,a5,-1
    800031b0:	00f52023          	sw	a5,0(a0)
    800031b4:	02079713          	slli	a4,a5,0x20
    800031b8:	00074663          	bltz	a4,800031c4 <_ZN4KSem4waitEv+0x24>
	return 0;
    800031bc:	00000513          	li	a0,0
}
    800031c0:	00008067          	ret
int KSem::wait() {
    800031c4:	ff010113          	addi	sp,sp,-16
    800031c8:	00113423          	sd	ra,8(sp)
    800031cc:	00813023          	sd	s0,0(sp)
    800031d0:	01010413          	addi	s0,sp,16
		block();
    800031d4:	00000097          	auipc	ra,0x0
    800031d8:	f84080e7          	jalr	-124(ra) # 80003158 <_ZN4KSem5blockEv>
		return -1;
    800031dc:	fff00513          	li	a0,-1
}
    800031e0:	00813083          	ld	ra,8(sp)
    800031e4:	00013403          	ld	s0,0(sp)
    800031e8:	01010113          	addi	sp,sp,16
    800031ec:	00008067          	ret
	if (!working) return -3;
    800031f0:	ffd00513          	li	a0,-3
    800031f4:	00008067          	ret

00000000800031f8 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    800031f8:	ff010113          	addi	sp,sp,-16
    800031fc:	00113423          	sd	ra,8(sp)
    80003200:	00813023          	sd	s0,0(sp)
    80003204:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003208:	00850513          	addi	a0,a0,8
    8000320c:	ffffe097          	auipc	ra,0xffffe
    80003210:	09c080e7          	jalr	156(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
	Scheduler::put(tcb);
    80003214:	fffff097          	auipc	ra,0xfffff
    80003218:	85c080e7          	jalr	-1956(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
}
    8000321c:	00813083          	ld	ra,8(sp)
    80003220:	00013403          	ld	s0,0(sp)
    80003224:	01010113          	addi	sp,sp,16
    80003228:	00008067          	ret

000000008000322c <_ZN4KSem6signalEv>:
	if (!working) return -3;
    8000322c:	01854783          	lbu	a5,24(a0)
    80003230:	04078463          	beqz	a5,80003278 <_ZN4KSem6signalEv+0x4c>
	if (val++ < 0) {
    80003234:	00052783          	lw	a5,0(a0)
    80003238:	0017871b          	addiw	a4,a5,1
    8000323c:	00e52023          	sw	a4,0(a0)
    80003240:	0007c663          	bltz	a5,8000324c <_ZN4KSem6signalEv+0x20>
	return 0;
    80003244:	00000513          	li	a0,0
}
    80003248:	00008067          	ret
int KSem::signal() {
    8000324c:	ff010113          	addi	sp,sp,-16
    80003250:	00113423          	sd	ra,8(sp)
    80003254:	00813023          	sd	s0,0(sp)
    80003258:	01010413          	addi	s0,sp,16
		unblock();
    8000325c:	00000097          	auipc	ra,0x0
    80003260:	f9c080e7          	jalr	-100(ra) # 800031f8 <_ZN4KSem7unblockEv>
	return 0;
    80003264:	00000513          	li	a0,0
}
    80003268:	00813083          	ld	ra,8(sp)
    8000326c:	00013403          	ld	s0,0(sp)
    80003270:	01010113          	addi	sp,sp,16
    80003274:	00008067          	ret
	if (!working) return -3;
    80003278:	ffd00513          	li	a0,-3
    8000327c:	00008067          	ret

0000000080003280 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003280:	fe010113          	addi	sp,sp,-32
    80003284:	00113c23          	sd	ra,24(sp)
    80003288:	00813823          	sd	s0,16(sp)
    8000328c:	00913423          	sd	s1,8(sp)
    80003290:	02010413          	addi	s0,sp,32
    80003294:	00050493          	mv	s1,a0
	handle->working = false;
    80003298:	00050c23          	sb	zero,24(a0)
        return front == nullptr;
    8000329c:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    800032a0:	00078e63          	beqz	a5,800032bc <_ZN4KSem8closeSemEPS_+0x3c>
		TCB* tcb = handle->blocked.getFirst();
    800032a4:	00848513          	addi	a0,s1,8
    800032a8:	ffffe097          	auipc	ra,0xffffe
    800032ac:	000080e7          	jalr	ra # 800012a8 <_ZN11ThreadQueue8getFirstEv>
		Scheduler::put(tcb);
    800032b0:	ffffe097          	auipc	ra,0xffffe
    800032b4:	7c0080e7          	jalr	1984(ra) # 80001a70 <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    800032b8:	fe5ff06f          	j	8000329c <_ZN4KSem8closeSemEPS_+0x1c>
	}
	return 0;
}
    800032bc:	00000513          	li	a0,0
    800032c0:	01813083          	ld	ra,24(sp)
    800032c4:	01013403          	ld	s0,16(sp)
    800032c8:	00813483          	ld	s1,8(sp)
    800032cc:	02010113          	addi	sp,sp,32
    800032d0:	00008067          	ret

00000000800032d4 <_Z10testMemoryv>:
    return pok;
}

#pragma GCC optimize("O0")

void testMemory() {
    800032d4:	e6010113          	addi	sp,sp,-416
    800032d8:	18113c23          	sd	ra,408(sp)
    800032dc:	18813823          	sd	s0,400(sp)
    800032e0:	1a010413          	addi	s0,sp,416
    char* pokazivaci[50];
    pokazivaci[0] = nullptr;
    800032e4:	e6043023          	sd	zero,-416(s0)
    pokazivaci[0] = upisi(1024 + 768);
    800032e8:	70000513          	li	a0,1792
    800032ec:	00000097          	auipc	ra,0x0
    800032f0:	3cc080e7          	jalr	972(ra) # 800036b8 <_Z5upisim>
    800032f4:	00050793          	mv	a5,a0
    800032f8:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    800032fc:	e6043783          	ld	a5,-416(s0)
    80003300:	02078c63          	beqz	a5,80003338 <_Z10testMemoryv+0x64>
        if (pokazivaci[0][0] == '8') {
    80003304:	e6043783          	ld	a5,-416(s0)
    80003308:	0007c783          	lbu	a5,0(a5)
    8000330c:	00078713          	mv	a4,a5
    80003310:	03800793          	li	a5,56
    80003314:	00f71a63          	bne	a4,a5,80003328 <_Z10testMemoryv+0x54>
            printString("nea");
    80003318:	00007517          	auipc	a0,0x7
    8000331c:	ee850513          	addi	a0,a0,-280 # 8000a200 <_ZZ9kPrintIntmE6digits+0x190>
    80003320:	00003097          	auipc	ra,0x3
    80003324:	9d8080e7          	jalr	-1576(ra) # 80005cf8 <_Z11printStringPKc>
        }
        MemoryAllocator::kfree(pokazivaci[0]);
    80003328:	e6043783          	ld	a5,-416(s0)
    8000332c:	00078513          	mv	a0,a5
    80003330:	00004097          	auipc	ra,0x4
    80003334:	e50080e7          	jalr	-432(ra) # 80007180 <_ZN15MemoryAllocator5kfreeEPv>
    }


    pokazivaci[0] = upisi(4096);
    80003338:	00001537          	lui	a0,0x1
    8000333c:	00000097          	auipc	ra,0x0
    80003340:	37c080e7          	jalr	892(ra) # 800036b8 <_Z5upisim>
    80003344:	00050793          	mv	a5,a0
    80003348:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    8000334c:	e6043783          	ld	a5,-416(s0)
    80003350:	00078a63          	beqz	a5,80003364 <_Z10testMemoryv+0x90>
        MemoryAllocator::kfree(pokazivaci[0]);
    80003354:	e6043783          	ld	a5,-416(s0)
    80003358:	00078513          	mv	a0,a5
    8000335c:	00004097          	auipc	ra,0x4
    80003360:	e24080e7          	jalr	-476(ra) # 80007180 <_ZN15MemoryAllocator5kfreeEPv>
    }

    pokazivaci[0] = upisi(1024 + 768);
    80003364:	70000513          	li	a0,1792
    80003368:	00000097          	auipc	ra,0x0
    8000336c:	350080e7          	jalr	848(ra) # 800036b8 <_Z5upisim>
    80003370:	00050793          	mv	a5,a0
    80003374:	e6f43023          	sd	a5,-416(s0)
    MemoryAllocator::kfree(pokazivaci[0]);
    80003378:	e6043783          	ld	a5,-416(s0)
    8000337c:	00078513          	mv	a0,a5
    80003380:	00004097          	auipc	ra,0x4
    80003384:	e00080e7          	jalr	-512(ra) # 80007180 <_ZN15MemoryAllocator5kfreeEPv>

}
    80003388:	00000013          	nop
    8000338c:	19813083          	ld	ra,408(sp)
    80003390:	19013403          	ld	s0,400(sp)
    80003394:	1a010113          	addi	sp,sp,416
    80003398:	00008067          	ret

000000008000339c <_Z5nit1fPv>:
public:
    void run() override{
        thread_dispatch();
    }
};
void nit1f(void*) {
    8000339c:	fe010113          	addi	sp,sp,-32
    800033a0:	00113c23          	sd	ra,24(sp)
    800033a4:	00813823          	sd	s0,16(sp)
    800033a8:	02010413          	addi	s0,sp,32
    800033ac:	fea43423          	sd	a0,-24(s0)
//    while (true) {
//        Thread* i = new idlethr();
//        if(!i)break;
//    }

    printString("\nGotova nit 1\n");
    800033b0:	00007517          	auipc	a0,0x7
    800033b4:	e5850513          	addi	a0,a0,-424 # 8000a208 <_ZZ9kPrintIntmE6digits+0x198>
    800033b8:	00003097          	auipc	ra,0x3
    800033bc:	940080e7          	jalr	-1728(ra) # 80005cf8 <_Z11printStringPKc>
}
    800033c0:	00000013          	nop
    800033c4:	01813083          	ld	ra,24(sp)
    800033c8:	01013403          	ld	s0,16(sp)
    800033cc:	02010113          	addi	sp,sp,32
    800033d0:	00008067          	ret

00000000800033d4 <_Z5nit2fPv>:
    void periodicActivation() override {
        printString("Janko\n");
    }
};

void nit2f(void* arg2) {
    800033d4:	fc010113          	addi	sp,sp,-64
    800033d8:	02113c23          	sd	ra,56(sp)
    800033dc:	02813823          	sd	s0,48(sp)
    800033e0:	02913423          	sd	s1,40(sp)
    800033e4:	03213023          	sd	s2,32(sp)
    800033e8:	04010413          	addi	s0,sp,64
    800033ec:	fca43423          	sd	a0,-56(s0)
    PeriodicThread* pt = new per(10);
    800033f0:	02800513          	li	a0,40
    800033f4:	fffff097          	auipc	ra,0xfffff
    800033f8:	474080e7          	jalr	1140(ra) # 80002868 <_Znwm>
    800033fc:	00050793          	mv	a5,a0
    80003400:	00078493          	mv	s1,a5
    80003404:	00a00593          	li	a1,10
    80003408:	00048513          	mv	a0,s1
    8000340c:	00000097          	auipc	ra,0x0
    80003410:	308080e7          	jalr	776(ra) # 80003714 <_ZN3perC1Em>
    80003414:	fc943c23          	sd	s1,-40(s0)
    pt->start();
    80003418:	fd843783          	ld	a5,-40(s0)
    8000341c:	00078513          	mv	a0,a5
    80003420:	fffff097          	auipc	ra,0xfffff
    80003424:	600080e7          	jalr	1536(ra) # 80002a20 <_ZN6Thread5startEv>
    Riscv::ms_sstatus(Riscv::SSTATUS_SPIE);
    80003428:	02000513          	li	a0,32
    8000342c:	00000097          	auipc	ra,0x0
    80003430:	3f8080e7          	jalr	1016(ra) # 80003824 <_ZN5Riscv10ms_sstatusEm>
    time_sleep(15);
    80003434:	00f00513          	li	a0,15
    80003438:	ffffe097          	auipc	ra,0xffffe
    8000343c:	044080e7          	jalr	68(ra) # 8000147c <_Z10time_sleepm>
    pt->terminate();
    80003440:	fd843503          	ld	a0,-40(s0)
    80003444:	00000097          	auipc	ra,0x0
    80003448:	808080e7          	jalr	-2040(ra) # 80002c4c <_ZN14PeriodicThread9terminateEv>
    printString("\nGotova nit 2\n");
    8000344c:	00007517          	auipc	a0,0x7
    80003450:	dd450513          	addi	a0,a0,-556 # 8000a220 <_ZZ9kPrintIntmE6digits+0x1b0>
    80003454:	00003097          	auipc	ra,0x3
    80003458:	8a4080e7          	jalr	-1884(ra) # 80005cf8 <_Z11printStringPKc>
}
    8000345c:	0240006f          	j	80003480 <_Z5nit2fPv+0xac>
    80003460:	00050913          	mv	s2,a0
    PeriodicThread* pt = new per(10);
    80003464:	00048513          	mv	a0,s1
    80003468:	fffff097          	auipc	ra,0xfffff
    8000346c:	450080e7          	jalr	1104(ra) # 800028b8 <_ZdlPv>
    80003470:	00090793          	mv	a5,s2
    80003474:	00078513          	mv	a0,a5
    80003478:	0000b097          	auipc	ra,0xb
    8000347c:	b50080e7          	jalr	-1200(ra) # 8000dfc8 <_Unwind_Resume>
}
    80003480:	03813083          	ld	ra,56(sp)
    80003484:	03013403          	ld	s0,48(sp)
    80003488:	02813483          	ld	s1,40(sp)
    8000348c:	02013903          	ld	s2,32(sp)
    80003490:	04010113          	addi	sp,sp,64
    80003494:	00008067          	ret

0000000080003498 <_Z5nit3fPv>:


void nit3f(void*) {
    80003498:	fd010113          	addi	sp,sp,-48
    8000349c:	02113423          	sd	ra,40(sp)
    800034a0:	02813023          	sd	s0,32(sp)
    800034a4:	03010413          	addi	s0,sp,48
    800034a8:	fca43c23          	sd	a0,-40(s0)
    char slovo;
    do {
        slovo = getc();
    800034ac:	ffffe097          	auipc	ra,0xffffe
    800034b0:	0c8080e7          	jalr	200(ra) # 80001574 <_Z4getcv>
    800034b4:	00050793          	mv	a5,a0
    800034b8:	fef407a3          	sb	a5,-17(s0)
        putc(slovo);
    800034bc:	fef44783          	lbu	a5,-17(s0)
    800034c0:	00078513          	mv	a0,a5
    800034c4:	ffffe097          	auipc	ra,0xffffe
    800034c8:	0d8080e7          	jalr	216(ra) # 8000159c <_Z4putcc>
        if (slovo == '\r') putc('\n');
    800034cc:	fef44783          	lbu	a5,-17(s0)
    800034d0:	0ff7f713          	andi	a4,a5,255
    800034d4:	00d00793          	li	a5,13
    800034d8:	00f71863          	bne	a4,a5,800034e8 <_Z5nit3fPv+0x50>
    800034dc:	00a00513          	li	a0,10
    800034e0:	ffffe097          	auipc	ra,0xffffe
    800034e4:	0bc080e7          	jalr	188(ra) # 8000159c <_Z4putcc>
    } while (slovo != '0');
    800034e8:	fef44783          	lbu	a5,-17(s0)
    800034ec:	0ff7f713          	andi	a4,a5,255
    800034f0:	03000793          	li	a5,48
    800034f4:	00f70463          	beq	a4,a5,800034fc <_Z5nit3fPv+0x64>
    do {
    800034f8:	fb5ff06f          	j	800034ac <_Z5nit3fPv+0x14>

    printString("\nGotova nit3\n");
    800034fc:	00007517          	auipc	a0,0x7
    80003500:	d3450513          	addi	a0,a0,-716 # 8000a230 <_ZZ9kPrintIntmE6digits+0x1c0>
    80003504:	00002097          	auipc	ra,0x2
    80003508:	7f4080e7          	jalr	2036(ra) # 80005cf8 <_Z11printStringPKc>
}
    8000350c:	00000013          	nop
    80003510:	02813083          	ld	ra,40(sp)
    80003514:	02013403          	ld	s0,32(sp)
    80003518:	03010113          	addi	sp,sp,48
    8000351c:	00008067          	ret

0000000080003520 <_Z5main2v>:

int main2() {
    80003520:	fc010113          	addi	sp,sp,-64
    80003524:	02113c23          	sd	ra,56(sp)
    80003528:	02813823          	sd	s0,48(sp)
    8000352c:	04010413          	addi	s0,sp,64
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80003530:	0000a797          	auipc	a5,0xa
    80003534:	8007b783          	ld	a5,-2048(a5) # 8000cd30 <_GLOBAL_OFFSET_TABLE_+0x78>
    80003538:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    8000353c:	fffff097          	auipc	ra,0xfffff
    80003540:	84c080e7          	jalr	-1972(ra) # 80001d88 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80003544:	ffffe097          	auipc	ra,0xffffe
    80003548:	13c080e7          	jalr	316(ra) # 80001680 <_ZN8KConsole12initKConsoleEv>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

    //testiranje kreiranja niti
    thread_t glavnaNit = nullptr;
    8000354c:	fe043423          	sd	zero,-24(s0)
    thread_t nit1 = nullptr;
    80003550:	fe043023          	sd	zero,-32(s0)
    thread_t nit2 = nullptr;
    80003554:	fc043c23          	sd	zero,-40(s0)
    thread_t nit3 = nullptr;
    80003558:	fc043823          	sd	zero,-48(s0)
    thread_t idleNit = nullptr;
    8000355c:	fc043423          	sd	zero,-56(s0)
    thread_t kernelConsumerThread = nullptr;
    80003560:	fc043023          	sd	zero,-64(s0)
    thread_create(&glavnaNit, nullptr, nullptr);
    80003564:	fe840793          	addi	a5,s0,-24
    80003568:	00000613          	li	a2,0
    8000356c:	00000593          	li	a1,0
    80003570:	00078513          	mv	a0,a5
    80003574:	ffffe097          	auipc	ra,0xffffe
    80003578:	e04080e7          	jalr	-508(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(glavnaNit);
    8000357c:	fe843783          	ld	a5,-24(s0)
    80003580:	00078513          	mv	a0,a5
    80003584:	00000097          	auipc	ra,0x0
    80003588:	2d8080e7          	jalr	728(ra) # 8000385c <_ZN3TCB10setRunningEPS_>
    thread_create(&idleNit, idle, nullptr);
    8000358c:	fc840793          	addi	a5,s0,-56
    80003590:	00000613          	li	a2,0
    80003594:	00009597          	auipc	a1,0x9
    80003598:	7a45b583          	ld	a1,1956(a1) # 8000cd38 <_GLOBAL_OFFSET_TABLE_+0x80>
    8000359c:	00078513          	mv	a0,a5
    800035a0:	ffffe097          	auipc	ra,0xffffe
    800035a4:	dd8080e7          	jalr	-552(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    800035a8:	fc040793          	addi	a5,s0,-64
    800035ac:	00000613          	li	a2,0
    800035b0:	00009597          	auipc	a1,0x9
    800035b4:	7405b583          	ld	a1,1856(a1) # 8000ccf0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800035b8:	00078513          	mv	a0,a5
    800035bc:	ffffe097          	auipc	ra,0xffffe
    800035c0:	dbc080e7          	jalr	-580(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>


    thread_create(&nit1, nit1f, nullptr);
    800035c4:	fe040793          	addi	a5,s0,-32
    800035c8:	00000613          	li	a2,0
    800035cc:	00000597          	auipc	a1,0x0
    800035d0:	dd058593          	addi	a1,a1,-560 # 8000339c <_Z5nit1fPv>
    800035d4:	00078513          	mv	a0,a5
    800035d8:	ffffe097          	auipc	ra,0xffffe
    800035dc:	da0080e7          	jalr	-608(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit2, nit2f, nullptr);
    800035e0:	fd840793          	addi	a5,s0,-40
    800035e4:	00000613          	li	a2,0
    800035e8:	00000597          	auipc	a1,0x0
    800035ec:	dec58593          	addi	a1,a1,-532 # 800033d4 <_Z5nit2fPv>
    800035f0:	00078513          	mv	a0,a5
    800035f4:	ffffe097          	auipc	ra,0xffffe
    800035f8:	d84080e7          	jalr	-636(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit3, nit3f, nullptr);
    800035fc:	fd040793          	addi	a5,s0,-48
    80003600:	00000613          	li	a2,0
    80003604:	00000597          	auipc	a1,0x0
    80003608:	e9458593          	addi	a1,a1,-364 # 80003498 <_Z5nit3fPv>
    8000360c:	00078513          	mv	a0,a5
    80003610:	ffffe097          	auipc	ra,0xffffe
    80003614:	d68080e7          	jalr	-664(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    80003618:	00200513          	li	a0,2
    8000361c:	00000097          	auipc	ra,0x0
    80003620:	208080e7          	jalr	520(ra) # 80003824 <_ZN5Riscv10ms_sstatusEm>

    thread_join(nit1);
    80003624:	fe043783          	ld	a5,-32(s0)
    80003628:	00078513          	mv	a0,a5
    8000362c:	ffffe097          	auipc	ra,0xffffe
    80003630:	e28080e7          	jalr	-472(ra) # 80001454 <_Z11thread_joinP3TCB>
    thread_join(nit2);
    80003634:	fd843783          	ld	a5,-40(s0)
    80003638:	00078513          	mv	a0,a5
    8000363c:	ffffe097          	auipc	ra,0xffffe
    80003640:	e18080e7          	jalr	-488(ra) # 80001454 <_Z11thread_joinP3TCB>
    thread_join(nit3);
    80003644:	fd043783          	ld	a5,-48(s0)
    80003648:	00078513          	mv	a0,a5
    8000364c:	ffffe097          	auipc	ra,0xffffe
    80003650:	e08080e7          	jalr	-504(ra) # 80001454 <_Z11thread_joinP3TCB>
    //thread_join(idleNit);

    printString("\nGotove user niti\n");
    80003654:	00007517          	auipc	a0,0x7
    80003658:	bec50513          	addi	a0,a0,-1044 # 8000a240 <_ZZ9kPrintIntmE6digits+0x1d0>
    8000365c:	00002097          	auipc	ra,0x2
    80003660:	69c080e7          	jalr	1692(ra) # 80005cf8 <_Z11printStringPKc>

    printString("\nSad cu da izadjem\n");
    80003664:	00007517          	auipc	a0,0x7
    80003668:	bf450513          	addi	a0,a0,-1036 # 8000a258 <_ZZ9kPrintIntmE6digits+0x1e8>
    8000366c:	00002097          	auipc	ra,0x2
    80003670:	68c080e7          	jalr	1676(ra) # 80005cf8 <_Z11printStringPKc>
    while (KConsole::outputHead != KConsole::outputTail) {}
    80003674:	00009797          	auipc	a5,0x9
    80003678:	6847b783          	ld	a5,1668(a5) # 8000ccf8 <_GLOBAL_OFFSET_TABLE_+0x40>
    8000367c:	0007a703          	lw	a4,0(a5)
    80003680:	00009797          	auipc	a5,0x9
    80003684:	6c07b783          	ld	a5,1728(a5) # 8000cd40 <_GLOBAL_OFFSET_TABLE_+0x88>
    80003688:	0007a783          	lw	a5,0(a5)
    8000368c:	00f70463          	beq	a4,a5,80003694 <_Z5main2v+0x174>
    80003690:	fe5ff06f          	j	80003674 <_Z5main2v+0x154>
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80003694:	00200513          	li	a0,2
    80003698:	00000097          	auipc	ra,0x0
    8000369c:	1a8080e7          	jalr	424(ra) # 80003840 <_ZN5Riscv10mc_sstatusEm>


    return 0;
    800036a0:	00000793          	li	a5,0
    800036a4:	00078513          	mv	a0,a5
    800036a8:	03813083          	ld	ra,56(sp)
    800036ac:	03013403          	ld	s0,48(sp)
    800036b0:	04010113          	addi	sp,sp,64
    800036b4:	00008067          	ret

00000000800036b8 <_Z5upisim>:
char* upisi(size_t alociraj) {
    800036b8:	fe010113          	addi	sp,sp,-32
    800036bc:	00113c23          	sd	ra,24(sp)
    800036c0:	00813823          	sd	s0,16(sp)
    800036c4:	00913423          	sd	s1,8(sp)
    800036c8:	02010413          	addi	s0,sp,32
    800036cc:	00050493          	mv	s1,a0
    char* pok = (char*)MemoryAllocator::kmalloc(alociraj);
    800036d0:	00300593          	li	a1,3
    800036d4:	00004097          	auipc	ra,0x4
    800036d8:	874080e7          	jalr	-1932(ra) # 80006f48 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    if (pok) {
    800036dc:	02050263          	beqz	a0,80003700 <_Z5upisim+0x48>
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    800036e0:	00000793          	li	a5,0
    800036e4:	0140006f          	j	800036f8 <_Z5upisim+0x40>
            pok[i] = '8';
    800036e8:	00f50733          	add	a4,a0,a5
    800036ec:	03800693          	li	a3,56
    800036f0:	00d70023          	sb	a3,0(a4)
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    800036f4:	00178793          	addi	a5,a5,1
    800036f8:	fe048713          	addi	a4,s1,-32
    800036fc:	fee7e6e3          	bltu	a5,a4,800036e8 <_Z5upisim+0x30>
}
    80003700:	01813083          	ld	ra,24(sp)
    80003704:	01013403          	ld	s0,16(sp)
    80003708:	00813483          	ld	s1,8(sp)
    8000370c:	02010113          	addi	sp,sp,32
    80003710:	00008067          	ret

0000000080003714 <_ZN3perC1Em>:
    per(time_t period) : PeriodicThread(period) {}
    80003714:	fe010113          	addi	sp,sp,-32
    80003718:	00113c23          	sd	ra,24(sp)
    8000371c:	00813823          	sd	s0,16(sp)
    80003720:	02010413          	addi	s0,sp,32
    80003724:	fea43423          	sd	a0,-24(s0)
    80003728:	feb43023          	sd	a1,-32(s0)
    8000372c:	fe843783          	ld	a5,-24(s0)
    80003730:	fe043583          	ld	a1,-32(s0)
    80003734:	00078513          	mv	a0,a5
    80003738:	fffff097          	auipc	ra,0xfffff
    8000373c:	534080e7          	jalr	1332(ra) # 80002c6c <_ZN14PeriodicThreadC1Em>
    80003740:	00009717          	auipc	a4,0x9
    80003744:	3b070713          	addi	a4,a4,944 # 8000caf0 <_ZTV3per+0x10>
    80003748:	fe843783          	ld	a5,-24(s0)
    8000374c:	00e7b023          	sd	a4,0(a5)
    80003750:	00000013          	nop
    80003754:	01813083          	ld	ra,24(sp)
    80003758:	01013403          	ld	s0,16(sp)
    8000375c:	02010113          	addi	sp,sp,32
    80003760:	00008067          	ret

0000000080003764 <_ZN3per18periodicActivationEv>:
    void periodicActivation() override {
    80003764:	fe010113          	addi	sp,sp,-32
    80003768:	00113c23          	sd	ra,24(sp)
    8000376c:	00813823          	sd	s0,16(sp)
    80003770:	02010413          	addi	s0,sp,32
    80003774:	fea43423          	sd	a0,-24(s0)
        printString("Janko\n");
    80003778:	00007517          	auipc	a0,0x7
    8000377c:	aa050513          	addi	a0,a0,-1376 # 8000a218 <_ZZ9kPrintIntmE6digits+0x1a8>
    80003780:	00002097          	auipc	ra,0x2
    80003784:	578080e7          	jalr	1400(ra) # 80005cf8 <_Z11printStringPKc>
    }
    80003788:	00000013          	nop
    8000378c:	01813083          	ld	ra,24(sp)
    80003790:	01013403          	ld	s0,16(sp)
    80003794:	02010113          	addi	sp,sp,32
    80003798:	00008067          	ret

000000008000379c <_ZN3perD1Ev>:
class per : public PeriodicThread {
    8000379c:	ff010113          	addi	sp,sp,-16
    800037a0:	00113423          	sd	ra,8(sp)
    800037a4:	00813023          	sd	s0,0(sp)
    800037a8:	01010413          	addi	s0,sp,16
    800037ac:	00009797          	auipc	a5,0x9
    800037b0:	53c7b783          	ld	a5,1340(a5) # 8000cce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800037b4:	01078793          	addi	a5,a5,16
    800037b8:	00f53023          	sd	a5,0(a0)
    800037bc:	fffff097          	auipc	ra,0xfffff
    800037c0:	fbc080e7          	jalr	-68(ra) # 80002778 <_ZN6ThreadD1Ev>
    800037c4:	00813083          	ld	ra,8(sp)
    800037c8:	00013403          	ld	s0,0(sp)
    800037cc:	01010113          	addi	sp,sp,16
    800037d0:	00008067          	ret

00000000800037d4 <_ZN3perD0Ev>:
    800037d4:	fe010113          	addi	sp,sp,-32
    800037d8:	00113c23          	sd	ra,24(sp)
    800037dc:	00813823          	sd	s0,16(sp)
    800037e0:	00913423          	sd	s1,8(sp)
    800037e4:	02010413          	addi	s0,sp,32
    800037e8:	00050493          	mv	s1,a0
    800037ec:	00009797          	auipc	a5,0x9
    800037f0:	4fc7b783          	ld	a5,1276(a5) # 8000cce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800037f4:	01078793          	addi	a5,a5,16
    800037f8:	00f53023          	sd	a5,0(a0)
    800037fc:	fffff097          	auipc	ra,0xfffff
    80003800:	f7c080e7          	jalr	-132(ra) # 80002778 <_ZN6ThreadD1Ev>
    80003804:	00048513          	mv	a0,s1
    80003808:	fffff097          	auipc	ra,0xfffff
    8000380c:	0b0080e7          	jalr	176(ra) # 800028b8 <_ZdlPv>
    80003810:	01813083          	ld	ra,24(sp)
    80003814:	01013403          	ld	s0,16(sp)
    80003818:	00813483          	ld	s1,8(sp)
    8000381c:	02010113          	addi	sp,sp,32
    80003820:	00008067          	ret

0000000080003824 <_ZN5Riscv10ms_sstatusEm>:
inline void Riscv::ms_sstatus(uint64 mask) {
    80003824:	ff010113          	addi	sp,sp,-16
    80003828:	00813423          	sd	s0,8(sp)
    8000382c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80003830:	10052073          	csrs	sstatus,a0
}
    80003834:	00813403          	ld	s0,8(sp)
    80003838:	01010113          	addi	sp,sp,16
    8000383c:	00008067          	ret

0000000080003840 <_ZN5Riscv10mc_sstatusEm>:
inline void Riscv::mc_sstatus(uint64 mask) {
    80003840:	ff010113          	addi	sp,sp,-16
    80003844:	00813423          	sd	s0,8(sp)
    80003848:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    8000384c:	10053073          	csrc	sstatus,a0
}
    80003850:	00813403          	ld	s0,8(sp)
    80003854:	01010113          	addi	sp,sp,16
    80003858:	00008067          	ret

000000008000385c <_ZN3TCB10setRunningEPS_>:
    static void setRunning(TCB* newRunning) { running = newRunning; }
    8000385c:	ff010113          	addi	sp,sp,-16
    80003860:	00813423          	sd	s0,8(sp)
    80003864:	01010413          	addi	s0,sp,16
    80003868:	00009797          	auipc	a5,0x9
    8000386c:	4b87b783          	ld	a5,1208(a5) # 8000cd20 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003870:	00a7b023          	sd	a0,0(a5)
    80003874:	00813403          	ld	s0,8(sp)
    80003878:	01010113          	addi	sp,sp,16
    8000387c:	00008067          	ret

0000000080003880 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003880:	fe010113          	addi	sp,sp,-32
    80003884:	00113c23          	sd	ra,24(sp)
    80003888:	00813823          	sd	s0,16(sp)
    8000388c:	00913423          	sd	s1,8(sp)
    80003890:	01213023          	sd	s2,0(sp)
    80003894:	02010413          	addi	s0,sp,32
    80003898:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000389c:	00000913          	li	s2,0
    800038a0:	00c0006f          	j	800038ac <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800038a4:	ffffe097          	auipc	ra,0xffffe
    800038a8:	b90080e7          	jalr	-1136(ra) # 80001434 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    800038ac:	ffffe097          	auipc	ra,0xffffe
    800038b0:	cc8080e7          	jalr	-824(ra) # 80001574 <_Z4getcv>
    800038b4:	0005059b          	sext.w	a1,a0
    800038b8:	02d00793          	li	a5,45
    800038bc:	02f58a63          	beq	a1,a5,800038f0 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800038c0:	0084b503          	ld	a0,8(s1)
    800038c4:	00003097          	auipc	ra,0x3
    800038c8:	400080e7          	jalr	1024(ra) # 80006cc4 <_ZN6Buffer3putEi>
        i++;
    800038cc:	0019071b          	addiw	a4,s2,1
    800038d0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800038d4:	0004a683          	lw	a3,0(s1)
    800038d8:	0026979b          	slliw	a5,a3,0x2
    800038dc:	00d787bb          	addw	a5,a5,a3
    800038e0:	0017979b          	slliw	a5,a5,0x1
    800038e4:	02f767bb          	remw	a5,a4,a5
    800038e8:	fc0792e3          	bnez	a5,800038ac <_ZL16producerKeyboardPv+0x2c>
    800038ec:	fb9ff06f          	j	800038a4 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800038f0:	00100793          	li	a5,1
    800038f4:	00009717          	auipc	a4,0x9
    800038f8:	5af72223          	sw	a5,1444(a4) # 8000ce98 <_ZL9threadEnd>
    data->buffer->put('!');
    800038fc:	02100593          	li	a1,33
    80003900:	0084b503          	ld	a0,8(s1)
    80003904:	00003097          	auipc	ra,0x3
    80003908:	3c0080e7          	jalr	960(ra) # 80006cc4 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    8000390c:	0104b503          	ld	a0,16(s1)
    80003910:	ffffe097          	auipc	ra,0xffffe
    80003914:	c34080e7          	jalr	-972(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    80003918:	01813083          	ld	ra,24(sp)
    8000391c:	01013403          	ld	s0,16(sp)
    80003920:	00813483          	ld	s1,8(sp)
    80003924:	00013903          	ld	s2,0(sp)
    80003928:	02010113          	addi	sp,sp,32
    8000392c:	00008067          	ret

0000000080003930 <_ZL8producerPv>:

static void producer(void *arg) {
    80003930:	fe010113          	addi	sp,sp,-32
    80003934:	00113c23          	sd	ra,24(sp)
    80003938:	00813823          	sd	s0,16(sp)
    8000393c:	00913423          	sd	s1,8(sp)
    80003940:	01213023          	sd	s2,0(sp)
    80003944:	02010413          	addi	s0,sp,32
    80003948:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000394c:	00000913          	li	s2,0
    80003950:	00c0006f          	j	8000395c <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003954:	ffffe097          	auipc	ra,0xffffe
    80003958:	ae0080e7          	jalr	-1312(ra) # 80001434 <_Z15thread_dispatchv>
    while (!threadEnd) {
    8000395c:	00009797          	auipc	a5,0x9
    80003960:	53c7a783          	lw	a5,1340(a5) # 8000ce98 <_ZL9threadEnd>
    80003964:	02079e63          	bnez	a5,800039a0 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003968:	0004a583          	lw	a1,0(s1)
    8000396c:	0305859b          	addiw	a1,a1,48
    80003970:	0084b503          	ld	a0,8(s1)
    80003974:	00003097          	auipc	ra,0x3
    80003978:	350080e7          	jalr	848(ra) # 80006cc4 <_ZN6Buffer3putEi>
        i++;
    8000397c:	0019071b          	addiw	a4,s2,1
    80003980:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003984:	0004a683          	lw	a3,0(s1)
    80003988:	0026979b          	slliw	a5,a3,0x2
    8000398c:	00d787bb          	addw	a5,a5,a3
    80003990:	0017979b          	slliw	a5,a5,0x1
    80003994:	02f767bb          	remw	a5,a4,a5
    80003998:	fc0792e3          	bnez	a5,8000395c <_ZL8producerPv+0x2c>
    8000399c:	fb9ff06f          	j	80003954 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    800039a0:	0104b503          	ld	a0,16(s1)
    800039a4:	ffffe097          	auipc	ra,0xffffe
    800039a8:	ba0080e7          	jalr	-1120(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    800039ac:	01813083          	ld	ra,24(sp)
    800039b0:	01013403          	ld	s0,16(sp)
    800039b4:	00813483          	ld	s1,8(sp)
    800039b8:	00013903          	ld	s2,0(sp)
    800039bc:	02010113          	addi	sp,sp,32
    800039c0:	00008067          	ret

00000000800039c4 <_ZL8consumerPv>:

static void consumer(void *arg) {
    800039c4:	fd010113          	addi	sp,sp,-48
    800039c8:	02113423          	sd	ra,40(sp)
    800039cc:	02813023          	sd	s0,32(sp)
    800039d0:	00913c23          	sd	s1,24(sp)
    800039d4:	01213823          	sd	s2,16(sp)
    800039d8:	01313423          	sd	s3,8(sp)
    800039dc:	03010413          	addi	s0,sp,48
    800039e0:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800039e4:	00000993          	li	s3,0
    800039e8:	01c0006f          	j	80003a04 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800039ec:	ffffe097          	auipc	ra,0xffffe
    800039f0:	a48080e7          	jalr	-1464(ra) # 80001434 <_Z15thread_dispatchv>
    800039f4:	0500006f          	j	80003a44 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800039f8:	00a00513          	li	a0,10
    800039fc:	ffffe097          	auipc	ra,0xffffe
    80003a00:	ba0080e7          	jalr	-1120(ra) # 8000159c <_Z4putcc>
    while (!threadEnd) {
    80003a04:	00009797          	auipc	a5,0x9
    80003a08:	4947a783          	lw	a5,1172(a5) # 8000ce98 <_ZL9threadEnd>
    80003a0c:	06079063          	bnez	a5,80003a6c <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003a10:	00893503          	ld	a0,8(s2)
    80003a14:	00003097          	auipc	ra,0x3
    80003a18:	340080e7          	jalr	832(ra) # 80006d54 <_ZN6Buffer3getEv>
        i++;
    80003a1c:	0019849b          	addiw	s1,s3,1
    80003a20:	0004899b          	sext.w	s3,s1
        putc(key);
    80003a24:	0ff57513          	andi	a0,a0,255
    80003a28:	ffffe097          	auipc	ra,0xffffe
    80003a2c:	b74080e7          	jalr	-1164(ra) # 8000159c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003a30:	00092703          	lw	a4,0(s2)
    80003a34:	0027179b          	slliw	a5,a4,0x2
    80003a38:	00e787bb          	addw	a5,a5,a4
    80003a3c:	02f4e7bb          	remw	a5,s1,a5
    80003a40:	fa0786e3          	beqz	a5,800039ec <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003a44:	05000793          	li	a5,80
    80003a48:	02f4e4bb          	remw	s1,s1,a5
    80003a4c:	fa049ce3          	bnez	s1,80003a04 <_ZL8consumerPv+0x40>
    80003a50:	fa9ff06f          	j	800039f8 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003a54:	00893503          	ld	a0,8(s2)
    80003a58:	00003097          	auipc	ra,0x3
    80003a5c:	2fc080e7          	jalr	764(ra) # 80006d54 <_ZN6Buffer3getEv>
        putc(key);
    80003a60:	0ff57513          	andi	a0,a0,255
    80003a64:	ffffe097          	auipc	ra,0xffffe
    80003a68:	b38080e7          	jalr	-1224(ra) # 8000159c <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003a6c:	00893503          	ld	a0,8(s2)
    80003a70:	00003097          	auipc	ra,0x3
    80003a74:	370080e7          	jalr	880(ra) # 80006de0 <_ZN6Buffer6getCntEv>
    80003a78:	fca04ee3          	bgtz	a0,80003a54 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003a7c:	01093503          	ld	a0,16(s2)
    80003a80:	ffffe097          	auipc	ra,0xffffe
    80003a84:	ac4080e7          	jalr	-1340(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    80003a88:	02813083          	ld	ra,40(sp)
    80003a8c:	02013403          	ld	s0,32(sp)
    80003a90:	01813483          	ld	s1,24(sp)
    80003a94:	01013903          	ld	s2,16(sp)
    80003a98:	00813983          	ld	s3,8(sp)
    80003a9c:	03010113          	addi	sp,sp,48
    80003aa0:	00008067          	ret

0000000080003aa4 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003aa4:	f9010113          	addi	sp,sp,-112
    80003aa8:	06113423          	sd	ra,104(sp)
    80003aac:	06813023          	sd	s0,96(sp)
    80003ab0:	04913c23          	sd	s1,88(sp)
    80003ab4:	05213823          	sd	s2,80(sp)
    80003ab8:	05313423          	sd	s3,72(sp)
    80003abc:	05413023          	sd	s4,64(sp)
    80003ac0:	03513c23          	sd	s5,56(sp)
    80003ac4:	03613823          	sd	s6,48(sp)
    80003ac8:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003acc:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003ad0:	00006517          	auipc	a0,0x6
    80003ad4:	7a050513          	addi	a0,a0,1952 # 8000a270 <_ZZ9kPrintIntmE6digits+0x200>
    80003ad8:	00002097          	auipc	ra,0x2
    80003adc:	220080e7          	jalr	544(ra) # 80005cf8 <_Z11printStringPKc>
    getString(input, 30);
    80003ae0:	01e00593          	li	a1,30
    80003ae4:	fa040493          	addi	s1,s0,-96
    80003ae8:	00048513          	mv	a0,s1
    80003aec:	00002097          	auipc	ra,0x2
    80003af0:	294080e7          	jalr	660(ra) # 80005d80 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003af4:	00048513          	mv	a0,s1
    80003af8:	00002097          	auipc	ra,0x2
    80003afc:	360080e7          	jalr	864(ra) # 80005e58 <_Z11stringToIntPKc>
    80003b00:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003b04:	00006517          	auipc	a0,0x6
    80003b08:	78c50513          	addi	a0,a0,1932 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    80003b0c:	00002097          	auipc	ra,0x2
    80003b10:	1ec080e7          	jalr	492(ra) # 80005cf8 <_Z11printStringPKc>
    getString(input, 30);
    80003b14:	01e00593          	li	a1,30
    80003b18:	00048513          	mv	a0,s1
    80003b1c:	00002097          	auipc	ra,0x2
    80003b20:	264080e7          	jalr	612(ra) # 80005d80 <_Z9getStringPci>
    n = stringToInt(input);
    80003b24:	00048513          	mv	a0,s1
    80003b28:	00002097          	auipc	ra,0x2
    80003b2c:	330080e7          	jalr	816(ra) # 80005e58 <_Z11stringToIntPKc>
    80003b30:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003b34:	00006517          	auipc	a0,0x6
    80003b38:	77c50513          	addi	a0,a0,1916 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    80003b3c:	00002097          	auipc	ra,0x2
    80003b40:	1bc080e7          	jalr	444(ra) # 80005cf8 <_Z11printStringPKc>
	printInt(threadNum);
    80003b44:	00000613          	li	a2,0
    80003b48:	00a00593          	li	a1,10
    80003b4c:	00090513          	mv	a0,s2
    80003b50:	00002097          	auipc	ra,0x2
    80003b54:	358080e7          	jalr	856(ra) # 80005ea8 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003b58:	00006517          	auipc	a0,0x6
    80003b5c:	77050513          	addi	a0,a0,1904 # 8000a2c8 <_ZZ9kPrintIntmE6digits+0x258>
    80003b60:	00002097          	auipc	ra,0x2
    80003b64:	198080e7          	jalr	408(ra) # 80005cf8 <_Z11printStringPKc>
	printInt(n);
    80003b68:	00000613          	li	a2,0
    80003b6c:	00a00593          	li	a1,10
    80003b70:	00048513          	mv	a0,s1
    80003b74:	00002097          	auipc	ra,0x2
    80003b78:	334080e7          	jalr	820(ra) # 80005ea8 <_Z8printIntiii>
    printString(".\n");
    80003b7c:	00006517          	auipc	a0,0x6
    80003b80:	76450513          	addi	a0,a0,1892 # 8000a2e0 <_ZZ9kPrintIntmE6digits+0x270>
    80003b84:	00002097          	auipc	ra,0x2
    80003b88:	174080e7          	jalr	372(ra) # 80005cf8 <_Z11printStringPKc>
    if(threadNum > n) {
    80003b8c:	0324c463          	blt	s1,s2,80003bb4 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003b90:	03205c63          	blez	s2,80003bc8 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003b94:	03800513          	li	a0,56
    80003b98:	fffff097          	auipc	ra,0xfffff
    80003b9c:	cd0080e7          	jalr	-816(ra) # 80002868 <_Znwm>
    80003ba0:	00050a13          	mv	s4,a0
    80003ba4:	00048593          	mv	a1,s1
    80003ba8:	00003097          	auipc	ra,0x3
    80003bac:	080080e7          	jalr	128(ra) # 80006c28 <_ZN6BufferC1Ei>
    80003bb0:	0300006f          	j	80003be0 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003bb4:	00006517          	auipc	a0,0x6
    80003bb8:	73450513          	addi	a0,a0,1844 # 8000a2e8 <_ZZ9kPrintIntmE6digits+0x278>
    80003bbc:	00002097          	auipc	ra,0x2
    80003bc0:	13c080e7          	jalr	316(ra) # 80005cf8 <_Z11printStringPKc>
        return;
    80003bc4:	0140006f          	j	80003bd8 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003bc8:	00006517          	auipc	a0,0x6
    80003bcc:	76050513          	addi	a0,a0,1888 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80003bd0:	00002097          	auipc	ra,0x2
    80003bd4:	128080e7          	jalr	296(ra) # 80005cf8 <_Z11printStringPKc>
        return;
    80003bd8:	000b0113          	mv	sp,s6
    80003bdc:	1500006f          	j	80003d2c <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003be0:	00000593          	li	a1,0
    80003be4:	00009517          	auipc	a0,0x9
    80003be8:	2bc50513          	addi	a0,a0,700 # 8000cea0 <_ZL10waitForAll>
    80003bec:	ffffe097          	auipc	ra,0xffffe
    80003bf0:	8c0080e7          	jalr	-1856(ra) # 800014ac <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003bf4:	00391793          	slli	a5,s2,0x3
    80003bf8:	00f78793          	addi	a5,a5,15
    80003bfc:	ff07f793          	andi	a5,a5,-16
    80003c00:	40f10133          	sub	sp,sp,a5
    80003c04:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003c08:	0019071b          	addiw	a4,s2,1
    80003c0c:	00171793          	slli	a5,a4,0x1
    80003c10:	00e787b3          	add	a5,a5,a4
    80003c14:	00379793          	slli	a5,a5,0x3
    80003c18:	00f78793          	addi	a5,a5,15
    80003c1c:	ff07f793          	andi	a5,a5,-16
    80003c20:	40f10133          	sub	sp,sp,a5
    80003c24:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003c28:	00191613          	slli	a2,s2,0x1
    80003c2c:	012607b3          	add	a5,a2,s2
    80003c30:	00379793          	slli	a5,a5,0x3
    80003c34:	00f987b3          	add	a5,s3,a5
    80003c38:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003c3c:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003c40:	00009717          	auipc	a4,0x9
    80003c44:	26073703          	ld	a4,608(a4) # 8000cea0 <_ZL10waitForAll>
    80003c48:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003c4c:	00078613          	mv	a2,a5
    80003c50:	00000597          	auipc	a1,0x0
    80003c54:	d7458593          	addi	a1,a1,-652 # 800039c4 <_ZL8consumerPv>
    80003c58:	f9840513          	addi	a0,s0,-104
    80003c5c:	ffffd097          	auipc	ra,0xffffd
    80003c60:	71c080e7          	jalr	1820(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003c64:	00000493          	li	s1,0
    80003c68:	0280006f          	j	80003c90 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003c6c:	00000597          	auipc	a1,0x0
    80003c70:	c1458593          	addi	a1,a1,-1004 # 80003880 <_ZL16producerKeyboardPv>
                      data + i);
    80003c74:	00179613          	slli	a2,a5,0x1
    80003c78:	00f60633          	add	a2,a2,a5
    80003c7c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003c80:	00c98633          	add	a2,s3,a2
    80003c84:	ffffd097          	auipc	ra,0xffffd
    80003c88:	6f4080e7          	jalr	1780(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003c8c:	0014849b          	addiw	s1,s1,1
    80003c90:	0524d263          	bge	s1,s2,80003cd4 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003c94:	00149793          	slli	a5,s1,0x1
    80003c98:	009787b3          	add	a5,a5,s1
    80003c9c:	00379793          	slli	a5,a5,0x3
    80003ca0:	00f987b3          	add	a5,s3,a5
    80003ca4:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003ca8:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003cac:	00009717          	auipc	a4,0x9
    80003cb0:	1f473703          	ld	a4,500(a4) # 8000cea0 <_ZL10waitForAll>
    80003cb4:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003cb8:	00048793          	mv	a5,s1
    80003cbc:	00349513          	slli	a0,s1,0x3
    80003cc0:	00aa8533          	add	a0,s5,a0
    80003cc4:	fa9054e3          	blez	s1,80003c6c <_Z22producerConsumer_C_APIv+0x1c8>
    80003cc8:	00000597          	auipc	a1,0x0
    80003ccc:	c6858593          	addi	a1,a1,-920 # 80003930 <_ZL8producerPv>
    80003cd0:	fa5ff06f          	j	80003c74 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003cd4:	ffffd097          	auipc	ra,0xffffd
    80003cd8:	760080e7          	jalr	1888(ra) # 80001434 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003cdc:	00000493          	li	s1,0
    80003ce0:	00994e63          	blt	s2,s1,80003cfc <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003ce4:	00009517          	auipc	a0,0x9
    80003ce8:	1bc53503          	ld	a0,444(a0) # 8000cea0 <_ZL10waitForAll>
    80003cec:	ffffe097          	auipc	ra,0xffffe
    80003cf0:	828080e7          	jalr	-2008(ra) # 80001514 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003cf4:	0014849b          	addiw	s1,s1,1
    80003cf8:	fe9ff06f          	j	80003ce0 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003cfc:	00009517          	auipc	a0,0x9
    80003d00:	1a453503          	ld	a0,420(a0) # 8000cea0 <_ZL10waitForAll>
    80003d04:	ffffd097          	auipc	ra,0xffffd
    80003d08:	7e0080e7          	jalr	2016(ra) # 800014e4 <_Z9sem_closeP4KSem>
    delete buffer;
    80003d0c:	000a0e63          	beqz	s4,80003d28 <_Z22producerConsumer_C_APIv+0x284>
    80003d10:	000a0513          	mv	a0,s4
    80003d14:	00003097          	auipc	ra,0x3
    80003d18:	154080e7          	jalr	340(ra) # 80006e68 <_ZN6BufferD1Ev>
    80003d1c:	000a0513          	mv	a0,s4
    80003d20:	fffff097          	auipc	ra,0xfffff
    80003d24:	b98080e7          	jalr	-1128(ra) # 800028b8 <_ZdlPv>
    80003d28:	000b0113          	mv	sp,s6

}
    80003d2c:	f9040113          	addi	sp,s0,-112
    80003d30:	06813083          	ld	ra,104(sp)
    80003d34:	06013403          	ld	s0,96(sp)
    80003d38:	05813483          	ld	s1,88(sp)
    80003d3c:	05013903          	ld	s2,80(sp)
    80003d40:	04813983          	ld	s3,72(sp)
    80003d44:	04013a03          	ld	s4,64(sp)
    80003d48:	03813a83          	ld	s5,56(sp)
    80003d4c:	03013b03          	ld	s6,48(sp)
    80003d50:	07010113          	addi	sp,sp,112
    80003d54:	00008067          	ret
    80003d58:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003d5c:	000a0513          	mv	a0,s4
    80003d60:	fffff097          	auipc	ra,0xfffff
    80003d64:	b58080e7          	jalr	-1192(ra) # 800028b8 <_ZdlPv>
    80003d68:	00048513          	mv	a0,s1
    80003d6c:	0000a097          	auipc	ra,0xa
    80003d70:	25c080e7          	jalr	604(ra) # 8000dfc8 <_Unwind_Resume>

0000000080003d74 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003d74:	fe010113          	addi	sp,sp,-32
    80003d78:	00113c23          	sd	ra,24(sp)
    80003d7c:	00813823          	sd	s0,16(sp)
    80003d80:	00913423          	sd	s1,8(sp)
    80003d84:	01213023          	sd	s2,0(sp)
    80003d88:	02010413          	addi	s0,sp,32
    80003d8c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003d90:	00100793          	li	a5,1
    80003d94:	02a7f863          	bgeu	a5,a0,80003dc4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003d98:	00a00793          	li	a5,10
    80003d9c:	02f577b3          	remu	a5,a0,a5
    80003da0:	02078e63          	beqz	a5,80003ddc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003da4:	fff48513          	addi	a0,s1,-1
    80003da8:	00000097          	auipc	ra,0x0
    80003dac:	fcc080e7          	jalr	-52(ra) # 80003d74 <_ZL9fibonaccim>
    80003db0:	00050913          	mv	s2,a0
    80003db4:	ffe48513          	addi	a0,s1,-2
    80003db8:	00000097          	auipc	ra,0x0
    80003dbc:	fbc080e7          	jalr	-68(ra) # 80003d74 <_ZL9fibonaccim>
    80003dc0:	00a90533          	add	a0,s2,a0
}
    80003dc4:	01813083          	ld	ra,24(sp)
    80003dc8:	01013403          	ld	s0,16(sp)
    80003dcc:	00813483          	ld	s1,8(sp)
    80003dd0:	00013903          	ld	s2,0(sp)
    80003dd4:	02010113          	addi	sp,sp,32
    80003dd8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003ddc:	ffffd097          	auipc	ra,0xffffd
    80003de0:	658080e7          	jalr	1624(ra) # 80001434 <_Z15thread_dispatchv>
    80003de4:	fc1ff06f          	j	80003da4 <_ZL9fibonaccim+0x30>

0000000080003de8 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003de8:	fe010113          	addi	sp,sp,-32
    80003dec:	00113c23          	sd	ra,24(sp)
    80003df0:	00813823          	sd	s0,16(sp)
    80003df4:	00913423          	sd	s1,8(sp)
    80003df8:	01213023          	sd	s2,0(sp)
    80003dfc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003e00:	00000913          	li	s2,0
    80003e04:	0380006f          	j	80003e3c <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003e08:	ffffd097          	auipc	ra,0xffffd
    80003e0c:	62c080e7          	jalr	1580(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003e10:	00148493          	addi	s1,s1,1
    80003e14:	000027b7          	lui	a5,0x2
    80003e18:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003e1c:	0097ee63          	bltu	a5,s1,80003e38 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003e20:	00000713          	li	a4,0
    80003e24:	000077b7          	lui	a5,0x7
    80003e28:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003e2c:	fce7eee3          	bltu	a5,a4,80003e08 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003e30:	00170713          	addi	a4,a4,1
    80003e34:	ff1ff06f          	j	80003e24 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003e38:	00190913          	addi	s2,s2,1
    80003e3c:	00900793          	li	a5,9
    80003e40:	0527e063          	bltu	a5,s2,80003e80 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003e44:	00006517          	auipc	a0,0x6
    80003e48:	51450513          	addi	a0,a0,1300 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80003e4c:	00002097          	auipc	ra,0x2
    80003e50:	eac080e7          	jalr	-340(ra) # 80005cf8 <_Z11printStringPKc>
    80003e54:	00000613          	li	a2,0
    80003e58:	00a00593          	li	a1,10
    80003e5c:	0009051b          	sext.w	a0,s2
    80003e60:	00002097          	auipc	ra,0x2
    80003e64:	048080e7          	jalr	72(ra) # 80005ea8 <_Z8printIntiii>
    80003e68:	00006517          	auipc	a0,0x6
    80003e6c:	75050513          	addi	a0,a0,1872 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80003e70:	00002097          	auipc	ra,0x2
    80003e74:	e88080e7          	jalr	-376(ra) # 80005cf8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003e78:	00000493          	li	s1,0
    80003e7c:	f99ff06f          	j	80003e14 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003e80:	00006517          	auipc	a0,0x6
    80003e84:	4e050513          	addi	a0,a0,1248 # 8000a360 <_ZZ9kPrintIntmE6digits+0x2f0>
    80003e88:	00002097          	auipc	ra,0x2
    80003e8c:	e70080e7          	jalr	-400(ra) # 80005cf8 <_Z11printStringPKc>
    finishedA = true;
    80003e90:	00100793          	li	a5,1
    80003e94:	00009717          	auipc	a4,0x9
    80003e98:	00f70a23          	sb	a5,20(a4) # 8000cea8 <_ZL9finishedA>
}
    80003e9c:	01813083          	ld	ra,24(sp)
    80003ea0:	01013403          	ld	s0,16(sp)
    80003ea4:	00813483          	ld	s1,8(sp)
    80003ea8:	00013903          	ld	s2,0(sp)
    80003eac:	02010113          	addi	sp,sp,32
    80003eb0:	00008067          	ret

0000000080003eb4 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003eb4:	fe010113          	addi	sp,sp,-32
    80003eb8:	00113c23          	sd	ra,24(sp)
    80003ebc:	00813823          	sd	s0,16(sp)
    80003ec0:	00913423          	sd	s1,8(sp)
    80003ec4:	01213023          	sd	s2,0(sp)
    80003ec8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003ecc:	00000913          	li	s2,0
    80003ed0:	0380006f          	j	80003f08 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003ed4:	ffffd097          	auipc	ra,0xffffd
    80003ed8:	560080e7          	jalr	1376(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003edc:	00148493          	addi	s1,s1,1
    80003ee0:	000027b7          	lui	a5,0x2
    80003ee4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003ee8:	0097ee63          	bltu	a5,s1,80003f04 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003eec:	00000713          	li	a4,0
    80003ef0:	000077b7          	lui	a5,0x7
    80003ef4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003ef8:	fce7eee3          	bltu	a5,a4,80003ed4 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003efc:	00170713          	addi	a4,a4,1
    80003f00:	ff1ff06f          	j	80003ef0 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003f04:	00190913          	addi	s2,s2,1
    80003f08:	00f00793          	li	a5,15
    80003f0c:	0527e063          	bltu	a5,s2,80003f4c <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003f10:	00006517          	auipc	a0,0x6
    80003f14:	46050513          	addi	a0,a0,1120 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    80003f18:	00002097          	auipc	ra,0x2
    80003f1c:	de0080e7          	jalr	-544(ra) # 80005cf8 <_Z11printStringPKc>
    80003f20:	00000613          	li	a2,0
    80003f24:	00a00593          	li	a1,10
    80003f28:	0009051b          	sext.w	a0,s2
    80003f2c:	00002097          	auipc	ra,0x2
    80003f30:	f7c080e7          	jalr	-132(ra) # 80005ea8 <_Z8printIntiii>
    80003f34:	00006517          	auipc	a0,0x6
    80003f38:	68450513          	addi	a0,a0,1668 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80003f3c:	00002097          	auipc	ra,0x2
    80003f40:	dbc080e7          	jalr	-580(ra) # 80005cf8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003f44:	00000493          	li	s1,0
    80003f48:	f99ff06f          	j	80003ee0 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003f4c:	00006517          	auipc	a0,0x6
    80003f50:	42c50513          	addi	a0,a0,1068 # 8000a378 <_ZZ9kPrintIntmE6digits+0x308>
    80003f54:	00002097          	auipc	ra,0x2
    80003f58:	da4080e7          	jalr	-604(ra) # 80005cf8 <_Z11printStringPKc>
    finishedB = true;
    80003f5c:	00100793          	li	a5,1
    80003f60:	00009717          	auipc	a4,0x9
    80003f64:	f4f704a3          	sb	a5,-183(a4) # 8000cea9 <_ZL9finishedB>
    thread_dispatch();
    80003f68:	ffffd097          	auipc	ra,0xffffd
    80003f6c:	4cc080e7          	jalr	1228(ra) # 80001434 <_Z15thread_dispatchv>
}
    80003f70:	01813083          	ld	ra,24(sp)
    80003f74:	01013403          	ld	s0,16(sp)
    80003f78:	00813483          	ld	s1,8(sp)
    80003f7c:	00013903          	ld	s2,0(sp)
    80003f80:	02010113          	addi	sp,sp,32
    80003f84:	00008067          	ret

0000000080003f88 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003f88:	fe010113          	addi	sp,sp,-32
    80003f8c:	00113c23          	sd	ra,24(sp)
    80003f90:	00813823          	sd	s0,16(sp)
    80003f94:	00913423          	sd	s1,8(sp)
    80003f98:	01213023          	sd	s2,0(sp)
    80003f9c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003fa0:	00000493          	li	s1,0
    80003fa4:	0400006f          	j	80003fe4 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003fa8:	00006517          	auipc	a0,0x6
    80003fac:	3e050513          	addi	a0,a0,992 # 8000a388 <_ZZ9kPrintIntmE6digits+0x318>
    80003fb0:	00002097          	auipc	ra,0x2
    80003fb4:	d48080e7          	jalr	-696(ra) # 80005cf8 <_Z11printStringPKc>
    80003fb8:	00000613          	li	a2,0
    80003fbc:	00a00593          	li	a1,10
    80003fc0:	00048513          	mv	a0,s1
    80003fc4:	00002097          	auipc	ra,0x2
    80003fc8:	ee4080e7          	jalr	-284(ra) # 80005ea8 <_Z8printIntiii>
    80003fcc:	00006517          	auipc	a0,0x6
    80003fd0:	5ec50513          	addi	a0,a0,1516 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80003fd4:	00002097          	auipc	ra,0x2
    80003fd8:	d24080e7          	jalr	-732(ra) # 80005cf8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003fdc:	0014849b          	addiw	s1,s1,1
    80003fe0:	0ff4f493          	andi	s1,s1,255
    80003fe4:	00200793          	li	a5,2
    80003fe8:	fc97f0e3          	bgeu	a5,s1,80003fa8 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003fec:	00006517          	auipc	a0,0x6
    80003ff0:	3a450513          	addi	a0,a0,932 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80003ff4:	00002097          	auipc	ra,0x2
    80003ff8:	d04080e7          	jalr	-764(ra) # 80005cf8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003ffc:	00700313          	li	t1,7
    thread_dispatch();
    80004000:	ffffd097          	auipc	ra,0xffffd
    80004004:	434080e7          	jalr	1076(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004008:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    8000400c:	00006517          	auipc	a0,0x6
    80004010:	39450513          	addi	a0,a0,916 # 8000a3a0 <_ZZ9kPrintIntmE6digits+0x330>
    80004014:	00002097          	auipc	ra,0x2
    80004018:	ce4080e7          	jalr	-796(ra) # 80005cf8 <_Z11printStringPKc>
    8000401c:	00000613          	li	a2,0
    80004020:	00a00593          	li	a1,10
    80004024:	0009051b          	sext.w	a0,s2
    80004028:	00002097          	auipc	ra,0x2
    8000402c:	e80080e7          	jalr	-384(ra) # 80005ea8 <_Z8printIntiii>
    80004030:	00006517          	auipc	a0,0x6
    80004034:	58850513          	addi	a0,a0,1416 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80004038:	00002097          	auipc	ra,0x2
    8000403c:	cc0080e7          	jalr	-832(ra) # 80005cf8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80004040:	00c00513          	li	a0,12
    80004044:	00000097          	auipc	ra,0x0
    80004048:	d30080e7          	jalr	-720(ra) # 80003d74 <_ZL9fibonaccim>
    8000404c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004050:	00006517          	auipc	a0,0x6
    80004054:	35850513          	addi	a0,a0,856 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    80004058:	00002097          	auipc	ra,0x2
    8000405c:	ca0080e7          	jalr	-864(ra) # 80005cf8 <_Z11printStringPKc>
    80004060:	00000613          	li	a2,0
    80004064:	00a00593          	li	a1,10
    80004068:	0009051b          	sext.w	a0,s2
    8000406c:	00002097          	auipc	ra,0x2
    80004070:	e3c080e7          	jalr	-452(ra) # 80005ea8 <_Z8printIntiii>
    80004074:	00006517          	auipc	a0,0x6
    80004078:	54450513          	addi	a0,a0,1348 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    8000407c:	00002097          	auipc	ra,0x2
    80004080:	c7c080e7          	jalr	-900(ra) # 80005cf8 <_Z11printStringPKc>
    80004084:	0400006f          	j	800040c4 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004088:	00006517          	auipc	a0,0x6
    8000408c:	30050513          	addi	a0,a0,768 # 8000a388 <_ZZ9kPrintIntmE6digits+0x318>
    80004090:	00002097          	auipc	ra,0x2
    80004094:	c68080e7          	jalr	-920(ra) # 80005cf8 <_Z11printStringPKc>
    80004098:	00000613          	li	a2,0
    8000409c:	00a00593          	li	a1,10
    800040a0:	00048513          	mv	a0,s1
    800040a4:	00002097          	auipc	ra,0x2
    800040a8:	e04080e7          	jalr	-508(ra) # 80005ea8 <_Z8printIntiii>
    800040ac:	00006517          	auipc	a0,0x6
    800040b0:	50c50513          	addi	a0,a0,1292 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800040b4:	00002097          	auipc	ra,0x2
    800040b8:	c44080e7          	jalr	-956(ra) # 80005cf8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800040bc:	0014849b          	addiw	s1,s1,1
    800040c0:	0ff4f493          	andi	s1,s1,255
    800040c4:	00500793          	li	a5,5
    800040c8:	fc97f0e3          	bgeu	a5,s1,80004088 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    800040cc:	00006517          	auipc	a0,0x6
    800040d0:	2ec50513          	addi	a0,a0,748 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    800040d4:	00002097          	auipc	ra,0x2
    800040d8:	c24080e7          	jalr	-988(ra) # 80005cf8 <_Z11printStringPKc>
    finishedC = true;
    800040dc:	00100793          	li	a5,1
    800040e0:	00009717          	auipc	a4,0x9
    800040e4:	dcf70523          	sb	a5,-566(a4) # 8000ceaa <_ZL9finishedC>
    thread_dispatch();
    800040e8:	ffffd097          	auipc	ra,0xffffd
    800040ec:	34c080e7          	jalr	844(ra) # 80001434 <_Z15thread_dispatchv>
}
    800040f0:	01813083          	ld	ra,24(sp)
    800040f4:	01013403          	ld	s0,16(sp)
    800040f8:	00813483          	ld	s1,8(sp)
    800040fc:	00013903          	ld	s2,0(sp)
    80004100:	02010113          	addi	sp,sp,32
    80004104:	00008067          	ret

0000000080004108 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80004108:	fe010113          	addi	sp,sp,-32
    8000410c:	00113c23          	sd	ra,24(sp)
    80004110:	00813823          	sd	s0,16(sp)
    80004114:	00913423          	sd	s1,8(sp)
    80004118:	01213023          	sd	s2,0(sp)
    8000411c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004120:	00a00493          	li	s1,10
    80004124:	0400006f          	j	80004164 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004128:	00006517          	auipc	a0,0x6
    8000412c:	2a050513          	addi	a0,a0,672 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80004130:	00002097          	auipc	ra,0x2
    80004134:	bc8080e7          	jalr	-1080(ra) # 80005cf8 <_Z11printStringPKc>
    80004138:	00000613          	li	a2,0
    8000413c:	00a00593          	li	a1,10
    80004140:	00048513          	mv	a0,s1
    80004144:	00002097          	auipc	ra,0x2
    80004148:	d64080e7          	jalr	-668(ra) # 80005ea8 <_Z8printIntiii>
    8000414c:	00006517          	auipc	a0,0x6
    80004150:	46c50513          	addi	a0,a0,1132 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80004154:	00002097          	auipc	ra,0x2
    80004158:	ba4080e7          	jalr	-1116(ra) # 80005cf8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000415c:	0014849b          	addiw	s1,s1,1
    80004160:	0ff4f493          	andi	s1,s1,255
    80004164:	00c00793          	li	a5,12
    80004168:	fc97f0e3          	bgeu	a5,s1,80004128 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    8000416c:	00006517          	auipc	a0,0x6
    80004170:	26450513          	addi	a0,a0,612 # 8000a3d0 <_ZZ9kPrintIntmE6digits+0x360>
    80004174:	00002097          	auipc	ra,0x2
    80004178:	b84080e7          	jalr	-1148(ra) # 80005cf8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000417c:	00500313          	li	t1,5
    thread_dispatch();
    80004180:	ffffd097          	auipc	ra,0xffffd
    80004184:	2b4080e7          	jalr	692(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004188:	01000513          	li	a0,16
    8000418c:	00000097          	auipc	ra,0x0
    80004190:	be8080e7          	jalr	-1048(ra) # 80003d74 <_ZL9fibonaccim>
    80004194:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004198:	00006517          	auipc	a0,0x6
    8000419c:	24850513          	addi	a0,a0,584 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    800041a0:	00002097          	auipc	ra,0x2
    800041a4:	b58080e7          	jalr	-1192(ra) # 80005cf8 <_Z11printStringPKc>
    800041a8:	00000613          	li	a2,0
    800041ac:	00a00593          	li	a1,10
    800041b0:	0009051b          	sext.w	a0,s2
    800041b4:	00002097          	auipc	ra,0x2
    800041b8:	cf4080e7          	jalr	-780(ra) # 80005ea8 <_Z8printIntiii>
    800041bc:	00006517          	auipc	a0,0x6
    800041c0:	3fc50513          	addi	a0,a0,1020 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800041c4:	00002097          	auipc	ra,0x2
    800041c8:	b34080e7          	jalr	-1228(ra) # 80005cf8 <_Z11printStringPKc>
    800041cc:	0400006f          	j	8000420c <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800041d0:	00006517          	auipc	a0,0x6
    800041d4:	1f850513          	addi	a0,a0,504 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    800041d8:	00002097          	auipc	ra,0x2
    800041dc:	b20080e7          	jalr	-1248(ra) # 80005cf8 <_Z11printStringPKc>
    800041e0:	00000613          	li	a2,0
    800041e4:	00a00593          	li	a1,10
    800041e8:	00048513          	mv	a0,s1
    800041ec:	00002097          	auipc	ra,0x2
    800041f0:	cbc080e7          	jalr	-836(ra) # 80005ea8 <_Z8printIntiii>
    800041f4:	00006517          	auipc	a0,0x6
    800041f8:	3c450513          	addi	a0,a0,964 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800041fc:	00002097          	auipc	ra,0x2
    80004200:	afc080e7          	jalr	-1284(ra) # 80005cf8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004204:	0014849b          	addiw	s1,s1,1
    80004208:	0ff4f493          	andi	s1,s1,255
    8000420c:	00f00793          	li	a5,15
    80004210:	fc97f0e3          	bgeu	a5,s1,800041d0 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004214:	00006517          	auipc	a0,0x6
    80004218:	1dc50513          	addi	a0,a0,476 # 8000a3f0 <_ZZ9kPrintIntmE6digits+0x380>
    8000421c:	00002097          	auipc	ra,0x2
    80004220:	adc080e7          	jalr	-1316(ra) # 80005cf8 <_Z11printStringPKc>
    finishedD = true;
    80004224:	00100793          	li	a5,1
    80004228:	00009717          	auipc	a4,0x9
    8000422c:	c8f701a3          	sb	a5,-893(a4) # 8000ceab <_ZL9finishedD>
    thread_dispatch();
    80004230:	ffffd097          	auipc	ra,0xffffd
    80004234:	204080e7          	jalr	516(ra) # 80001434 <_Z15thread_dispatchv>
}
    80004238:	01813083          	ld	ra,24(sp)
    8000423c:	01013403          	ld	s0,16(sp)
    80004240:	00813483          	ld	s1,8(sp)
    80004244:	00013903          	ld	s2,0(sp)
    80004248:	02010113          	addi	sp,sp,32
    8000424c:	00008067          	ret

0000000080004250 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80004250:	fc010113          	addi	sp,sp,-64
    80004254:	02113c23          	sd	ra,56(sp)
    80004258:	02813823          	sd	s0,48(sp)
    8000425c:	02913423          	sd	s1,40(sp)
    80004260:	03213023          	sd	s2,32(sp)
    80004264:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80004268:	02000513          	li	a0,32
    8000426c:	ffffe097          	auipc	ra,0xffffe
    80004270:	5fc080e7          	jalr	1532(ra) # 80002868 <_Znwm>
    80004274:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004278:	fffff097          	auipc	ra,0xfffff
    8000427c:	8c8080e7          	jalr	-1848(ra) # 80002b40 <_ZN6ThreadC1Ev>
    80004280:	00009797          	auipc	a5,0x9
    80004284:	8a078793          	addi	a5,a5,-1888 # 8000cb20 <_ZTV7WorkerA+0x10>
    80004288:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    8000428c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004290:	00006517          	auipc	a0,0x6
    80004294:	17050513          	addi	a0,a0,368 # 8000a400 <_ZZ9kPrintIntmE6digits+0x390>
    80004298:	00002097          	auipc	ra,0x2
    8000429c:	a60080e7          	jalr	-1440(ra) # 80005cf8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    800042a0:	02000513          	li	a0,32
    800042a4:	ffffe097          	auipc	ra,0xffffe
    800042a8:	5c4080e7          	jalr	1476(ra) # 80002868 <_Znwm>
    800042ac:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    800042b0:	fffff097          	auipc	ra,0xfffff
    800042b4:	890080e7          	jalr	-1904(ra) # 80002b40 <_ZN6ThreadC1Ev>
    800042b8:	00009797          	auipc	a5,0x9
    800042bc:	89078793          	addi	a5,a5,-1904 # 8000cb48 <_ZTV7WorkerB+0x10>
    800042c0:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    800042c4:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800042c8:	00006517          	auipc	a0,0x6
    800042cc:	15050513          	addi	a0,a0,336 # 8000a418 <_ZZ9kPrintIntmE6digits+0x3a8>
    800042d0:	00002097          	auipc	ra,0x2
    800042d4:	a28080e7          	jalr	-1496(ra) # 80005cf8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800042d8:	02000513          	li	a0,32
    800042dc:	ffffe097          	auipc	ra,0xffffe
    800042e0:	58c080e7          	jalr	1420(ra) # 80002868 <_Znwm>
    800042e4:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800042e8:	fffff097          	auipc	ra,0xfffff
    800042ec:	858080e7          	jalr	-1960(ra) # 80002b40 <_ZN6ThreadC1Ev>
    800042f0:	00009797          	auipc	a5,0x9
    800042f4:	88078793          	addi	a5,a5,-1920 # 8000cb70 <_ZTV7WorkerC+0x10>
    800042f8:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800042fc:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80004300:	00006517          	auipc	a0,0x6
    80004304:	13050513          	addi	a0,a0,304 # 8000a430 <_ZZ9kPrintIntmE6digits+0x3c0>
    80004308:	00002097          	auipc	ra,0x2
    8000430c:	9f0080e7          	jalr	-1552(ra) # 80005cf8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004310:	02000513          	li	a0,32
    80004314:	ffffe097          	auipc	ra,0xffffe
    80004318:	554080e7          	jalr	1364(ra) # 80002868 <_Znwm>
    8000431c:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004320:	fffff097          	auipc	ra,0xfffff
    80004324:	820080e7          	jalr	-2016(ra) # 80002b40 <_ZN6ThreadC1Ev>
    80004328:	00009797          	auipc	a5,0x9
    8000432c:	87078793          	addi	a5,a5,-1936 # 8000cb98 <_ZTV7WorkerD+0x10>
    80004330:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004334:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004338:	00006517          	auipc	a0,0x6
    8000433c:	11050513          	addi	a0,a0,272 # 8000a448 <_ZZ9kPrintIntmE6digits+0x3d8>
    80004340:	00002097          	auipc	ra,0x2
    80004344:	9b8080e7          	jalr	-1608(ra) # 80005cf8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004348:	00000493          	li	s1,0
    8000434c:	00300793          	li	a5,3
    80004350:	0297c663          	blt	a5,s1,8000437c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004354:	00349793          	slli	a5,s1,0x3
    80004358:	fe040713          	addi	a4,s0,-32
    8000435c:	00f707b3          	add	a5,a4,a5
    80004360:	fe07b503          	ld	a0,-32(a5)
    80004364:	ffffe097          	auipc	ra,0xffffe
    80004368:	6bc080e7          	jalr	1724(ra) # 80002a20 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    8000436c:	0014849b          	addiw	s1,s1,1
    80004370:	fddff06f          	j	8000434c <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004374:	ffffe097          	auipc	ra,0xffffe
    80004378:	710080e7          	jalr	1808(ra) # 80002a84 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000437c:	00009797          	auipc	a5,0x9
    80004380:	b2c7c783          	lbu	a5,-1236(a5) # 8000cea8 <_ZL9finishedA>
    80004384:	fe0788e3          	beqz	a5,80004374 <_Z20Threads_CPP_API_testv+0x124>
    80004388:	00009797          	auipc	a5,0x9
    8000438c:	b217c783          	lbu	a5,-1247(a5) # 8000cea9 <_ZL9finishedB>
    80004390:	fe0782e3          	beqz	a5,80004374 <_Z20Threads_CPP_API_testv+0x124>
    80004394:	00009797          	auipc	a5,0x9
    80004398:	b167c783          	lbu	a5,-1258(a5) # 8000ceaa <_ZL9finishedC>
    8000439c:	fc078ce3          	beqz	a5,80004374 <_Z20Threads_CPP_API_testv+0x124>
    800043a0:	00009797          	auipc	a5,0x9
    800043a4:	b0b7c783          	lbu	a5,-1269(a5) # 8000ceab <_ZL9finishedD>
    800043a8:	fc0786e3          	beqz	a5,80004374 <_Z20Threads_CPP_API_testv+0x124>
    800043ac:	fc040493          	addi	s1,s0,-64
    800043b0:	0080006f          	j	800043b8 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    800043b4:	00848493          	addi	s1,s1,8
    800043b8:	fe040793          	addi	a5,s0,-32
    800043bc:	08f48663          	beq	s1,a5,80004448 <_Z20Threads_CPP_API_testv+0x1f8>
    800043c0:	0004b503          	ld	a0,0(s1)
		delete thread;
    800043c4:	fe0508e3          	beqz	a0,800043b4 <_Z20Threads_CPP_API_testv+0x164>
    800043c8:	00053783          	ld	a5,0(a0)
    800043cc:	0087b783          	ld	a5,8(a5)
    800043d0:	000780e7          	jalr	a5
    800043d4:	fe1ff06f          	j	800043b4 <_Z20Threads_CPP_API_testv+0x164>
    800043d8:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800043dc:	00048513          	mv	a0,s1
    800043e0:	ffffe097          	auipc	ra,0xffffe
    800043e4:	4d8080e7          	jalr	1240(ra) # 800028b8 <_ZdlPv>
    800043e8:	00090513          	mv	a0,s2
    800043ec:	0000a097          	auipc	ra,0xa
    800043f0:	bdc080e7          	jalr	-1060(ra) # 8000dfc8 <_Unwind_Resume>
    800043f4:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800043f8:	00048513          	mv	a0,s1
    800043fc:	ffffe097          	auipc	ra,0xffffe
    80004400:	4bc080e7          	jalr	1212(ra) # 800028b8 <_ZdlPv>
    80004404:	00090513          	mv	a0,s2
    80004408:	0000a097          	auipc	ra,0xa
    8000440c:	bc0080e7          	jalr	-1088(ra) # 8000dfc8 <_Unwind_Resume>
    80004410:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004414:	00048513          	mv	a0,s1
    80004418:	ffffe097          	auipc	ra,0xffffe
    8000441c:	4a0080e7          	jalr	1184(ra) # 800028b8 <_ZdlPv>
    80004420:	00090513          	mv	a0,s2
    80004424:	0000a097          	auipc	ra,0xa
    80004428:	ba4080e7          	jalr	-1116(ra) # 8000dfc8 <_Unwind_Resume>
    8000442c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004430:	00048513          	mv	a0,s1
    80004434:	ffffe097          	auipc	ra,0xffffe
    80004438:	484080e7          	jalr	1156(ra) # 800028b8 <_ZdlPv>
    8000443c:	00090513          	mv	a0,s2
    80004440:	0000a097          	auipc	ra,0xa
    80004444:	b88080e7          	jalr	-1144(ra) # 8000dfc8 <_Unwind_Resume>
	}
}
    80004448:	03813083          	ld	ra,56(sp)
    8000444c:	03013403          	ld	s0,48(sp)
    80004450:	02813483          	ld	s1,40(sp)
    80004454:	02013903          	ld	s2,32(sp)
    80004458:	04010113          	addi	sp,sp,64
    8000445c:	00008067          	ret

0000000080004460 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004460:	ff010113          	addi	sp,sp,-16
    80004464:	00113423          	sd	ra,8(sp)
    80004468:	00813023          	sd	s0,0(sp)
    8000446c:	01010413          	addi	s0,sp,16
    80004470:	00008797          	auipc	a5,0x8
    80004474:	6b078793          	addi	a5,a5,1712 # 8000cb20 <_ZTV7WorkerA+0x10>
    80004478:	00f53023          	sd	a5,0(a0)
    8000447c:	ffffe097          	auipc	ra,0xffffe
    80004480:	2fc080e7          	jalr	764(ra) # 80002778 <_ZN6ThreadD1Ev>
    80004484:	00813083          	ld	ra,8(sp)
    80004488:	00013403          	ld	s0,0(sp)
    8000448c:	01010113          	addi	sp,sp,16
    80004490:	00008067          	ret

0000000080004494 <_ZN7WorkerAD0Ev>:
    80004494:	fe010113          	addi	sp,sp,-32
    80004498:	00113c23          	sd	ra,24(sp)
    8000449c:	00813823          	sd	s0,16(sp)
    800044a0:	00913423          	sd	s1,8(sp)
    800044a4:	02010413          	addi	s0,sp,32
    800044a8:	00050493          	mv	s1,a0
    800044ac:	00008797          	auipc	a5,0x8
    800044b0:	67478793          	addi	a5,a5,1652 # 8000cb20 <_ZTV7WorkerA+0x10>
    800044b4:	00f53023          	sd	a5,0(a0)
    800044b8:	ffffe097          	auipc	ra,0xffffe
    800044bc:	2c0080e7          	jalr	704(ra) # 80002778 <_ZN6ThreadD1Ev>
    800044c0:	00048513          	mv	a0,s1
    800044c4:	ffffe097          	auipc	ra,0xffffe
    800044c8:	3f4080e7          	jalr	1012(ra) # 800028b8 <_ZdlPv>
    800044cc:	01813083          	ld	ra,24(sp)
    800044d0:	01013403          	ld	s0,16(sp)
    800044d4:	00813483          	ld	s1,8(sp)
    800044d8:	02010113          	addi	sp,sp,32
    800044dc:	00008067          	ret

00000000800044e0 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800044e0:	ff010113          	addi	sp,sp,-16
    800044e4:	00113423          	sd	ra,8(sp)
    800044e8:	00813023          	sd	s0,0(sp)
    800044ec:	01010413          	addi	s0,sp,16
    800044f0:	00008797          	auipc	a5,0x8
    800044f4:	65878793          	addi	a5,a5,1624 # 8000cb48 <_ZTV7WorkerB+0x10>
    800044f8:	00f53023          	sd	a5,0(a0)
    800044fc:	ffffe097          	auipc	ra,0xffffe
    80004500:	27c080e7          	jalr	636(ra) # 80002778 <_ZN6ThreadD1Ev>
    80004504:	00813083          	ld	ra,8(sp)
    80004508:	00013403          	ld	s0,0(sp)
    8000450c:	01010113          	addi	sp,sp,16
    80004510:	00008067          	ret

0000000080004514 <_ZN7WorkerBD0Ev>:
    80004514:	fe010113          	addi	sp,sp,-32
    80004518:	00113c23          	sd	ra,24(sp)
    8000451c:	00813823          	sd	s0,16(sp)
    80004520:	00913423          	sd	s1,8(sp)
    80004524:	02010413          	addi	s0,sp,32
    80004528:	00050493          	mv	s1,a0
    8000452c:	00008797          	auipc	a5,0x8
    80004530:	61c78793          	addi	a5,a5,1564 # 8000cb48 <_ZTV7WorkerB+0x10>
    80004534:	00f53023          	sd	a5,0(a0)
    80004538:	ffffe097          	auipc	ra,0xffffe
    8000453c:	240080e7          	jalr	576(ra) # 80002778 <_ZN6ThreadD1Ev>
    80004540:	00048513          	mv	a0,s1
    80004544:	ffffe097          	auipc	ra,0xffffe
    80004548:	374080e7          	jalr	884(ra) # 800028b8 <_ZdlPv>
    8000454c:	01813083          	ld	ra,24(sp)
    80004550:	01013403          	ld	s0,16(sp)
    80004554:	00813483          	ld	s1,8(sp)
    80004558:	02010113          	addi	sp,sp,32
    8000455c:	00008067          	ret

0000000080004560 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004560:	ff010113          	addi	sp,sp,-16
    80004564:	00113423          	sd	ra,8(sp)
    80004568:	00813023          	sd	s0,0(sp)
    8000456c:	01010413          	addi	s0,sp,16
    80004570:	00008797          	auipc	a5,0x8
    80004574:	60078793          	addi	a5,a5,1536 # 8000cb70 <_ZTV7WorkerC+0x10>
    80004578:	00f53023          	sd	a5,0(a0)
    8000457c:	ffffe097          	auipc	ra,0xffffe
    80004580:	1fc080e7          	jalr	508(ra) # 80002778 <_ZN6ThreadD1Ev>
    80004584:	00813083          	ld	ra,8(sp)
    80004588:	00013403          	ld	s0,0(sp)
    8000458c:	01010113          	addi	sp,sp,16
    80004590:	00008067          	ret

0000000080004594 <_ZN7WorkerCD0Ev>:
    80004594:	fe010113          	addi	sp,sp,-32
    80004598:	00113c23          	sd	ra,24(sp)
    8000459c:	00813823          	sd	s0,16(sp)
    800045a0:	00913423          	sd	s1,8(sp)
    800045a4:	02010413          	addi	s0,sp,32
    800045a8:	00050493          	mv	s1,a0
    800045ac:	00008797          	auipc	a5,0x8
    800045b0:	5c478793          	addi	a5,a5,1476 # 8000cb70 <_ZTV7WorkerC+0x10>
    800045b4:	00f53023          	sd	a5,0(a0)
    800045b8:	ffffe097          	auipc	ra,0xffffe
    800045bc:	1c0080e7          	jalr	448(ra) # 80002778 <_ZN6ThreadD1Ev>
    800045c0:	00048513          	mv	a0,s1
    800045c4:	ffffe097          	auipc	ra,0xffffe
    800045c8:	2f4080e7          	jalr	756(ra) # 800028b8 <_ZdlPv>
    800045cc:	01813083          	ld	ra,24(sp)
    800045d0:	01013403          	ld	s0,16(sp)
    800045d4:	00813483          	ld	s1,8(sp)
    800045d8:	02010113          	addi	sp,sp,32
    800045dc:	00008067          	ret

00000000800045e0 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800045e0:	ff010113          	addi	sp,sp,-16
    800045e4:	00113423          	sd	ra,8(sp)
    800045e8:	00813023          	sd	s0,0(sp)
    800045ec:	01010413          	addi	s0,sp,16
    800045f0:	00008797          	auipc	a5,0x8
    800045f4:	5a878793          	addi	a5,a5,1448 # 8000cb98 <_ZTV7WorkerD+0x10>
    800045f8:	00f53023          	sd	a5,0(a0)
    800045fc:	ffffe097          	auipc	ra,0xffffe
    80004600:	17c080e7          	jalr	380(ra) # 80002778 <_ZN6ThreadD1Ev>
    80004604:	00813083          	ld	ra,8(sp)
    80004608:	00013403          	ld	s0,0(sp)
    8000460c:	01010113          	addi	sp,sp,16
    80004610:	00008067          	ret

0000000080004614 <_ZN7WorkerDD0Ev>:
    80004614:	fe010113          	addi	sp,sp,-32
    80004618:	00113c23          	sd	ra,24(sp)
    8000461c:	00813823          	sd	s0,16(sp)
    80004620:	00913423          	sd	s1,8(sp)
    80004624:	02010413          	addi	s0,sp,32
    80004628:	00050493          	mv	s1,a0
    8000462c:	00008797          	auipc	a5,0x8
    80004630:	56c78793          	addi	a5,a5,1388 # 8000cb98 <_ZTV7WorkerD+0x10>
    80004634:	00f53023          	sd	a5,0(a0)
    80004638:	ffffe097          	auipc	ra,0xffffe
    8000463c:	140080e7          	jalr	320(ra) # 80002778 <_ZN6ThreadD1Ev>
    80004640:	00048513          	mv	a0,s1
    80004644:	ffffe097          	auipc	ra,0xffffe
    80004648:	274080e7          	jalr	628(ra) # 800028b8 <_ZdlPv>
    8000464c:	01813083          	ld	ra,24(sp)
    80004650:	01013403          	ld	s0,16(sp)
    80004654:	00813483          	ld	s1,8(sp)
    80004658:	02010113          	addi	sp,sp,32
    8000465c:	00008067          	ret

0000000080004660 <_ZN7WorkerA3runEv>:
    void run() override {
    80004660:	ff010113          	addi	sp,sp,-16
    80004664:	00113423          	sd	ra,8(sp)
    80004668:	00813023          	sd	s0,0(sp)
    8000466c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004670:	00000593          	li	a1,0
    80004674:	fffff097          	auipc	ra,0xfffff
    80004678:	774080e7          	jalr	1908(ra) # 80003de8 <_ZN7WorkerA11workerBodyAEPv>
    }
    8000467c:	00813083          	ld	ra,8(sp)
    80004680:	00013403          	ld	s0,0(sp)
    80004684:	01010113          	addi	sp,sp,16
    80004688:	00008067          	ret

000000008000468c <_ZN7WorkerB3runEv>:
    void run() override {
    8000468c:	ff010113          	addi	sp,sp,-16
    80004690:	00113423          	sd	ra,8(sp)
    80004694:	00813023          	sd	s0,0(sp)
    80004698:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    8000469c:	00000593          	li	a1,0
    800046a0:	00000097          	auipc	ra,0x0
    800046a4:	814080e7          	jalr	-2028(ra) # 80003eb4 <_ZN7WorkerB11workerBodyBEPv>
    }
    800046a8:	00813083          	ld	ra,8(sp)
    800046ac:	00013403          	ld	s0,0(sp)
    800046b0:	01010113          	addi	sp,sp,16
    800046b4:	00008067          	ret

00000000800046b8 <_ZN7WorkerC3runEv>:
    void run() override {
    800046b8:	ff010113          	addi	sp,sp,-16
    800046bc:	00113423          	sd	ra,8(sp)
    800046c0:	00813023          	sd	s0,0(sp)
    800046c4:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800046c8:	00000593          	li	a1,0
    800046cc:	00000097          	auipc	ra,0x0
    800046d0:	8bc080e7          	jalr	-1860(ra) # 80003f88 <_ZN7WorkerC11workerBodyCEPv>
    }
    800046d4:	00813083          	ld	ra,8(sp)
    800046d8:	00013403          	ld	s0,0(sp)
    800046dc:	01010113          	addi	sp,sp,16
    800046e0:	00008067          	ret

00000000800046e4 <_ZN7WorkerD3runEv>:
    void run() override {
    800046e4:	ff010113          	addi	sp,sp,-16
    800046e8:	00113423          	sd	ra,8(sp)
    800046ec:	00813023          	sd	s0,0(sp)
    800046f0:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800046f4:	00000593          	li	a1,0
    800046f8:	00000097          	auipc	ra,0x0
    800046fc:	a10080e7          	jalr	-1520(ra) # 80004108 <_ZN7WorkerD11workerBodyDEPv>
    }
    80004700:	00813083          	ld	ra,8(sp)
    80004704:	00013403          	ld	s0,0(sp)
    80004708:	01010113          	addi	sp,sp,16
    8000470c:	00008067          	ret

0000000080004710 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004710:	f8010113          	addi	sp,sp,-128
    80004714:	06113c23          	sd	ra,120(sp)
    80004718:	06813823          	sd	s0,112(sp)
    8000471c:	06913423          	sd	s1,104(sp)
    80004720:	07213023          	sd	s2,96(sp)
    80004724:	05313c23          	sd	s3,88(sp)
    80004728:	05413823          	sd	s4,80(sp)
    8000472c:	05513423          	sd	s5,72(sp)
    80004730:	05613023          	sd	s6,64(sp)
    80004734:	03713c23          	sd	s7,56(sp)
    80004738:	03813823          	sd	s8,48(sp)
    8000473c:	03913423          	sd	s9,40(sp)
    80004740:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004744:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004748:	00006517          	auipc	a0,0x6
    8000474c:	b2850513          	addi	a0,a0,-1240 # 8000a270 <_ZZ9kPrintIntmE6digits+0x200>
    80004750:	00001097          	auipc	ra,0x1
    80004754:	5a8080e7          	jalr	1448(ra) # 80005cf8 <_Z11printStringPKc>
    getString(input, 30);
    80004758:	01e00593          	li	a1,30
    8000475c:	f8040493          	addi	s1,s0,-128
    80004760:	00048513          	mv	a0,s1
    80004764:	00001097          	auipc	ra,0x1
    80004768:	61c080e7          	jalr	1564(ra) # 80005d80 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000476c:	00048513          	mv	a0,s1
    80004770:	00001097          	auipc	ra,0x1
    80004774:	6e8080e7          	jalr	1768(ra) # 80005e58 <_Z11stringToIntPKc>
    80004778:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    8000477c:	00006517          	auipc	a0,0x6
    80004780:	b1450513          	addi	a0,a0,-1260 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    80004784:	00001097          	auipc	ra,0x1
    80004788:	574080e7          	jalr	1396(ra) # 80005cf8 <_Z11printStringPKc>
    getString(input, 30);
    8000478c:	01e00593          	li	a1,30
    80004790:	00048513          	mv	a0,s1
    80004794:	00001097          	auipc	ra,0x1
    80004798:	5ec080e7          	jalr	1516(ra) # 80005d80 <_Z9getStringPci>
    n = stringToInt(input);
    8000479c:	00048513          	mv	a0,s1
    800047a0:	00001097          	auipc	ra,0x1
    800047a4:	6b8080e7          	jalr	1720(ra) # 80005e58 <_Z11stringToIntPKc>
    800047a8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    800047ac:	00006517          	auipc	a0,0x6
    800047b0:	b0450513          	addi	a0,a0,-1276 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    800047b4:	00001097          	auipc	ra,0x1
    800047b8:	544080e7          	jalr	1348(ra) # 80005cf8 <_Z11printStringPKc>
    printInt(threadNum);
    800047bc:	00000613          	li	a2,0
    800047c0:	00a00593          	li	a1,10
    800047c4:	00098513          	mv	a0,s3
    800047c8:	00001097          	auipc	ra,0x1
    800047cc:	6e0080e7          	jalr	1760(ra) # 80005ea8 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800047d0:	00006517          	auipc	a0,0x6
    800047d4:	af850513          	addi	a0,a0,-1288 # 8000a2c8 <_ZZ9kPrintIntmE6digits+0x258>
    800047d8:	00001097          	auipc	ra,0x1
    800047dc:	520080e7          	jalr	1312(ra) # 80005cf8 <_Z11printStringPKc>
    printInt(n);
    800047e0:	00000613          	li	a2,0
    800047e4:	00a00593          	li	a1,10
    800047e8:	00048513          	mv	a0,s1
    800047ec:	00001097          	auipc	ra,0x1
    800047f0:	6bc080e7          	jalr	1724(ra) # 80005ea8 <_Z8printIntiii>
    printString(".\n");
    800047f4:	00006517          	auipc	a0,0x6
    800047f8:	aec50513          	addi	a0,a0,-1300 # 8000a2e0 <_ZZ9kPrintIntmE6digits+0x270>
    800047fc:	00001097          	auipc	ra,0x1
    80004800:	4fc080e7          	jalr	1276(ra) # 80005cf8 <_Z11printStringPKc>
    if (threadNum > n) {
    80004804:	0334c463          	blt	s1,s3,8000482c <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004808:	03305c63          	blez	s3,80004840 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000480c:	03800513          	li	a0,56
    80004810:	ffffe097          	auipc	ra,0xffffe
    80004814:	058080e7          	jalr	88(ra) # 80002868 <_Znwm>
    80004818:	00050a93          	mv	s5,a0
    8000481c:	00048593          	mv	a1,s1
    80004820:	00001097          	auipc	ra,0x1
    80004824:	7a8080e7          	jalr	1960(ra) # 80005fc8 <_ZN9BufferCPPC1Ei>
    80004828:	0300006f          	j	80004858 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000482c:	00006517          	auipc	a0,0x6
    80004830:	abc50513          	addi	a0,a0,-1348 # 8000a2e8 <_ZZ9kPrintIntmE6digits+0x278>
    80004834:	00001097          	auipc	ra,0x1
    80004838:	4c4080e7          	jalr	1220(ra) # 80005cf8 <_Z11printStringPKc>
        return;
    8000483c:	0140006f          	j	80004850 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004840:	00006517          	auipc	a0,0x6
    80004844:	ae850513          	addi	a0,a0,-1304 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80004848:	00001097          	auipc	ra,0x1
    8000484c:	4b0080e7          	jalr	1200(ra) # 80005cf8 <_Z11printStringPKc>
        return;
    80004850:	000c0113          	mv	sp,s8
    80004854:	2140006f          	j	80004a68 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004858:	01000513          	li	a0,16
    8000485c:	ffffe097          	auipc	ra,0xffffe
    80004860:	00c080e7          	jalr	12(ra) # 80002868 <_Znwm>
    80004864:	00050913          	mv	s2,a0
    80004868:	00000593          	li	a1,0
    8000486c:	ffffe097          	auipc	ra,0xffffe
    80004870:	350080e7          	jalr	848(ra) # 80002bbc <_ZN9SemaphoreC1Ej>
    80004874:	00008797          	auipc	a5,0x8
    80004878:	6527b223          	sd	s2,1604(a5) # 8000ceb8 <_ZL10waitForAll>
    Thread *producers[threadNum];
    8000487c:	00399793          	slli	a5,s3,0x3
    80004880:	00f78793          	addi	a5,a5,15
    80004884:	ff07f793          	andi	a5,a5,-16
    80004888:	40f10133          	sub	sp,sp,a5
    8000488c:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004890:	0019871b          	addiw	a4,s3,1
    80004894:	00171793          	slli	a5,a4,0x1
    80004898:	00e787b3          	add	a5,a5,a4
    8000489c:	00379793          	slli	a5,a5,0x3
    800048a0:	00f78793          	addi	a5,a5,15
    800048a4:	ff07f793          	andi	a5,a5,-16
    800048a8:	40f10133          	sub	sp,sp,a5
    800048ac:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    800048b0:	00199493          	slli	s1,s3,0x1
    800048b4:	013484b3          	add	s1,s1,s3
    800048b8:	00349493          	slli	s1,s1,0x3
    800048bc:	009b04b3          	add	s1,s6,s1
    800048c0:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    800048c4:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    800048c8:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800048cc:	02800513          	li	a0,40
    800048d0:	ffffe097          	auipc	ra,0xffffe
    800048d4:	f98080e7          	jalr	-104(ra) # 80002868 <_Znwm>
    800048d8:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    800048dc:	ffffe097          	auipc	ra,0xffffe
    800048e0:	264080e7          	jalr	612(ra) # 80002b40 <_ZN6ThreadC1Ev>
    800048e4:	00008797          	auipc	a5,0x8
    800048e8:	32c78793          	addi	a5,a5,812 # 8000cc10 <_ZTV8Consumer+0x10>
    800048ec:	00fbb023          	sd	a5,0(s7)
    800048f0:	029bb023          	sd	s1,32(s7)
    consumer->start();
    800048f4:	000b8513          	mv	a0,s7
    800048f8:	ffffe097          	auipc	ra,0xffffe
    800048fc:	128080e7          	jalr	296(ra) # 80002a20 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004900:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004904:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004908:	00008797          	auipc	a5,0x8
    8000490c:	5b07b783          	ld	a5,1456(a5) # 8000ceb8 <_ZL10waitForAll>
    80004910:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004914:	02800513          	li	a0,40
    80004918:	ffffe097          	auipc	ra,0xffffe
    8000491c:	f50080e7          	jalr	-176(ra) # 80002868 <_Znwm>
    80004920:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004924:	ffffe097          	auipc	ra,0xffffe
    80004928:	21c080e7          	jalr	540(ra) # 80002b40 <_ZN6ThreadC1Ev>
    8000492c:	00008797          	auipc	a5,0x8
    80004930:	29478793          	addi	a5,a5,660 # 8000cbc0 <_ZTV16ProducerKeyborad+0x10>
    80004934:	00f4b023          	sd	a5,0(s1)
    80004938:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000493c:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004940:	00048513          	mv	a0,s1
    80004944:	ffffe097          	auipc	ra,0xffffe
    80004948:	0dc080e7          	jalr	220(ra) # 80002a20 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000494c:	00100913          	li	s2,1
    80004950:	0300006f          	j	80004980 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004954:	00008797          	auipc	a5,0x8
    80004958:	29478793          	addi	a5,a5,660 # 8000cbe8 <_ZTV8Producer+0x10>
    8000495c:	00fcb023          	sd	a5,0(s9)
    80004960:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004964:	00391793          	slli	a5,s2,0x3
    80004968:	00fa07b3          	add	a5,s4,a5
    8000496c:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004970:	000c8513          	mv	a0,s9
    80004974:	ffffe097          	auipc	ra,0xffffe
    80004978:	0ac080e7          	jalr	172(ra) # 80002a20 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000497c:	0019091b          	addiw	s2,s2,1
    80004980:	05395263          	bge	s2,s3,800049c4 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004984:	00191493          	slli	s1,s2,0x1
    80004988:	012484b3          	add	s1,s1,s2
    8000498c:	00349493          	slli	s1,s1,0x3
    80004990:	009b04b3          	add	s1,s6,s1
    80004994:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004998:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    8000499c:	00008797          	auipc	a5,0x8
    800049a0:	51c7b783          	ld	a5,1308(a5) # 8000ceb8 <_ZL10waitForAll>
    800049a4:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    800049a8:	02800513          	li	a0,40
    800049ac:	ffffe097          	auipc	ra,0xffffe
    800049b0:	ebc080e7          	jalr	-324(ra) # 80002868 <_Znwm>
    800049b4:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800049b8:	ffffe097          	auipc	ra,0xffffe
    800049bc:	188080e7          	jalr	392(ra) # 80002b40 <_ZN6ThreadC1Ev>
    800049c0:	f95ff06f          	j	80004954 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    800049c4:	ffffe097          	auipc	ra,0xffffe
    800049c8:	0c0080e7          	jalr	192(ra) # 80002a84 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800049cc:	00000493          	li	s1,0
    800049d0:	0099ce63          	blt	s3,s1,800049ec <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    800049d4:	00008517          	auipc	a0,0x8
    800049d8:	4e453503          	ld	a0,1252(a0) # 8000ceb8 <_ZL10waitForAll>
    800049dc:	ffffe097          	auipc	ra,0xffffe
    800049e0:	218080e7          	jalr	536(ra) # 80002bf4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800049e4:	0014849b          	addiw	s1,s1,1
    800049e8:	fe9ff06f          	j	800049d0 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    800049ec:	00008517          	auipc	a0,0x8
    800049f0:	4cc53503          	ld	a0,1228(a0) # 8000ceb8 <_ZL10waitForAll>
    800049f4:	00050863          	beqz	a0,80004a04 <_Z20testConsumerProducerv+0x2f4>
    800049f8:	00053783          	ld	a5,0(a0)
    800049fc:	0087b783          	ld	a5,8(a5)
    80004a00:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004a04:	00000493          	li	s1,0
    80004a08:	0080006f          	j	80004a10 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004a0c:	0014849b          	addiw	s1,s1,1
    80004a10:	0334d263          	bge	s1,s3,80004a34 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004a14:	00349793          	slli	a5,s1,0x3
    80004a18:	00fa07b3          	add	a5,s4,a5
    80004a1c:	0007b503          	ld	a0,0(a5)
    80004a20:	fe0506e3          	beqz	a0,80004a0c <_Z20testConsumerProducerv+0x2fc>
    80004a24:	00053783          	ld	a5,0(a0)
    80004a28:	0087b783          	ld	a5,8(a5)
    80004a2c:	000780e7          	jalr	a5
    80004a30:	fddff06f          	j	80004a0c <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004a34:	000b8a63          	beqz	s7,80004a48 <_Z20testConsumerProducerv+0x338>
    80004a38:	000bb783          	ld	a5,0(s7)
    80004a3c:	0087b783          	ld	a5,8(a5)
    80004a40:	000b8513          	mv	a0,s7
    80004a44:	000780e7          	jalr	a5
    delete buffer;
    80004a48:	000a8e63          	beqz	s5,80004a64 <_Z20testConsumerProducerv+0x354>
    80004a4c:	000a8513          	mv	a0,s5
    80004a50:	00002097          	auipc	ra,0x2
    80004a54:	870080e7          	jalr	-1936(ra) # 800062c0 <_ZN9BufferCPPD1Ev>
    80004a58:	000a8513          	mv	a0,s5
    80004a5c:	ffffe097          	auipc	ra,0xffffe
    80004a60:	e5c080e7          	jalr	-420(ra) # 800028b8 <_ZdlPv>
    80004a64:	000c0113          	mv	sp,s8
}
    80004a68:	f8040113          	addi	sp,s0,-128
    80004a6c:	07813083          	ld	ra,120(sp)
    80004a70:	07013403          	ld	s0,112(sp)
    80004a74:	06813483          	ld	s1,104(sp)
    80004a78:	06013903          	ld	s2,96(sp)
    80004a7c:	05813983          	ld	s3,88(sp)
    80004a80:	05013a03          	ld	s4,80(sp)
    80004a84:	04813a83          	ld	s5,72(sp)
    80004a88:	04013b03          	ld	s6,64(sp)
    80004a8c:	03813b83          	ld	s7,56(sp)
    80004a90:	03013c03          	ld	s8,48(sp)
    80004a94:	02813c83          	ld	s9,40(sp)
    80004a98:	08010113          	addi	sp,sp,128
    80004a9c:	00008067          	ret
    80004aa0:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004aa4:	000a8513          	mv	a0,s5
    80004aa8:	ffffe097          	auipc	ra,0xffffe
    80004aac:	e10080e7          	jalr	-496(ra) # 800028b8 <_ZdlPv>
    80004ab0:	00048513          	mv	a0,s1
    80004ab4:	00009097          	auipc	ra,0x9
    80004ab8:	514080e7          	jalr	1300(ra) # 8000dfc8 <_Unwind_Resume>
    80004abc:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004ac0:	00090513          	mv	a0,s2
    80004ac4:	ffffe097          	auipc	ra,0xffffe
    80004ac8:	df4080e7          	jalr	-524(ra) # 800028b8 <_ZdlPv>
    80004acc:	00048513          	mv	a0,s1
    80004ad0:	00009097          	auipc	ra,0x9
    80004ad4:	4f8080e7          	jalr	1272(ra) # 8000dfc8 <_Unwind_Resume>
    80004ad8:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004adc:	000b8513          	mv	a0,s7
    80004ae0:	ffffe097          	auipc	ra,0xffffe
    80004ae4:	dd8080e7          	jalr	-552(ra) # 800028b8 <_ZdlPv>
    80004ae8:	00048513          	mv	a0,s1
    80004aec:	00009097          	auipc	ra,0x9
    80004af0:	4dc080e7          	jalr	1244(ra) # 8000dfc8 <_Unwind_Resume>
    80004af4:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004af8:	00048513          	mv	a0,s1
    80004afc:	ffffe097          	auipc	ra,0xffffe
    80004b00:	dbc080e7          	jalr	-580(ra) # 800028b8 <_ZdlPv>
    80004b04:	00090513          	mv	a0,s2
    80004b08:	00009097          	auipc	ra,0x9
    80004b0c:	4c0080e7          	jalr	1216(ra) # 8000dfc8 <_Unwind_Resume>
    80004b10:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004b14:	000c8513          	mv	a0,s9
    80004b18:	ffffe097          	auipc	ra,0xffffe
    80004b1c:	da0080e7          	jalr	-608(ra) # 800028b8 <_ZdlPv>
    80004b20:	00048513          	mv	a0,s1
    80004b24:	00009097          	auipc	ra,0x9
    80004b28:	4a4080e7          	jalr	1188(ra) # 8000dfc8 <_Unwind_Resume>

0000000080004b2c <_ZN8Consumer3runEv>:
    void run() override {
    80004b2c:	fd010113          	addi	sp,sp,-48
    80004b30:	02113423          	sd	ra,40(sp)
    80004b34:	02813023          	sd	s0,32(sp)
    80004b38:	00913c23          	sd	s1,24(sp)
    80004b3c:	01213823          	sd	s2,16(sp)
    80004b40:	01313423          	sd	s3,8(sp)
    80004b44:	03010413          	addi	s0,sp,48
    80004b48:	00050913          	mv	s2,a0
        int i = 0;
    80004b4c:	00000993          	li	s3,0
    80004b50:	0100006f          	j	80004b60 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004b54:	00a00513          	li	a0,10
    80004b58:	ffffe097          	auipc	ra,0xffffe
    80004b5c:	18c080e7          	jalr	396(ra) # 80002ce4 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004b60:	00008797          	auipc	a5,0x8
    80004b64:	3507a783          	lw	a5,848(a5) # 8000ceb0 <_ZL9threadEnd>
    80004b68:	04079a63          	bnez	a5,80004bbc <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004b6c:	02093783          	ld	a5,32(s2)
    80004b70:	0087b503          	ld	a0,8(a5)
    80004b74:	00001097          	auipc	ra,0x1
    80004b78:	638080e7          	jalr	1592(ra) # 800061ac <_ZN9BufferCPP3getEv>
            i++;
    80004b7c:	0019849b          	addiw	s1,s3,1
    80004b80:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004b84:	0ff57513          	andi	a0,a0,255
    80004b88:	ffffe097          	auipc	ra,0xffffe
    80004b8c:	15c080e7          	jalr	348(ra) # 80002ce4 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004b90:	05000793          	li	a5,80
    80004b94:	02f4e4bb          	remw	s1,s1,a5
    80004b98:	fc0494e3          	bnez	s1,80004b60 <_ZN8Consumer3runEv+0x34>
    80004b9c:	fb9ff06f          	j	80004b54 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004ba0:	02093783          	ld	a5,32(s2)
    80004ba4:	0087b503          	ld	a0,8(a5)
    80004ba8:	00001097          	auipc	ra,0x1
    80004bac:	604080e7          	jalr	1540(ra) # 800061ac <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004bb0:	0ff57513          	andi	a0,a0,255
    80004bb4:	ffffe097          	auipc	ra,0xffffe
    80004bb8:	130080e7          	jalr	304(ra) # 80002ce4 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004bbc:	02093783          	ld	a5,32(s2)
    80004bc0:	0087b503          	ld	a0,8(a5)
    80004bc4:	00001097          	auipc	ra,0x1
    80004bc8:	674080e7          	jalr	1652(ra) # 80006238 <_ZN9BufferCPP6getCntEv>
    80004bcc:	fca04ae3          	bgtz	a0,80004ba0 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004bd0:	02093783          	ld	a5,32(s2)
    80004bd4:	0107b503          	ld	a0,16(a5)
    80004bd8:	ffffe097          	auipc	ra,0xffffe
    80004bdc:	048080e7          	jalr	72(ra) # 80002c20 <_ZN9Semaphore6signalEv>
    }
    80004be0:	02813083          	ld	ra,40(sp)
    80004be4:	02013403          	ld	s0,32(sp)
    80004be8:	01813483          	ld	s1,24(sp)
    80004bec:	01013903          	ld	s2,16(sp)
    80004bf0:	00813983          	ld	s3,8(sp)
    80004bf4:	03010113          	addi	sp,sp,48
    80004bf8:	00008067          	ret

0000000080004bfc <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004bfc:	ff010113          	addi	sp,sp,-16
    80004c00:	00113423          	sd	ra,8(sp)
    80004c04:	00813023          	sd	s0,0(sp)
    80004c08:	01010413          	addi	s0,sp,16
    80004c0c:	00008797          	auipc	a5,0x8
    80004c10:	00478793          	addi	a5,a5,4 # 8000cc10 <_ZTV8Consumer+0x10>
    80004c14:	00f53023          	sd	a5,0(a0)
    80004c18:	ffffe097          	auipc	ra,0xffffe
    80004c1c:	b60080e7          	jalr	-1184(ra) # 80002778 <_ZN6ThreadD1Ev>
    80004c20:	00813083          	ld	ra,8(sp)
    80004c24:	00013403          	ld	s0,0(sp)
    80004c28:	01010113          	addi	sp,sp,16
    80004c2c:	00008067          	ret

0000000080004c30 <_ZN8ConsumerD0Ev>:
    80004c30:	fe010113          	addi	sp,sp,-32
    80004c34:	00113c23          	sd	ra,24(sp)
    80004c38:	00813823          	sd	s0,16(sp)
    80004c3c:	00913423          	sd	s1,8(sp)
    80004c40:	02010413          	addi	s0,sp,32
    80004c44:	00050493          	mv	s1,a0
    80004c48:	00008797          	auipc	a5,0x8
    80004c4c:	fc878793          	addi	a5,a5,-56 # 8000cc10 <_ZTV8Consumer+0x10>
    80004c50:	00f53023          	sd	a5,0(a0)
    80004c54:	ffffe097          	auipc	ra,0xffffe
    80004c58:	b24080e7          	jalr	-1244(ra) # 80002778 <_ZN6ThreadD1Ev>
    80004c5c:	00048513          	mv	a0,s1
    80004c60:	ffffe097          	auipc	ra,0xffffe
    80004c64:	c58080e7          	jalr	-936(ra) # 800028b8 <_ZdlPv>
    80004c68:	01813083          	ld	ra,24(sp)
    80004c6c:	01013403          	ld	s0,16(sp)
    80004c70:	00813483          	ld	s1,8(sp)
    80004c74:	02010113          	addi	sp,sp,32
    80004c78:	00008067          	ret

0000000080004c7c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004c7c:	ff010113          	addi	sp,sp,-16
    80004c80:	00113423          	sd	ra,8(sp)
    80004c84:	00813023          	sd	s0,0(sp)
    80004c88:	01010413          	addi	s0,sp,16
    80004c8c:	00008797          	auipc	a5,0x8
    80004c90:	f3478793          	addi	a5,a5,-204 # 8000cbc0 <_ZTV16ProducerKeyborad+0x10>
    80004c94:	00f53023          	sd	a5,0(a0)
    80004c98:	ffffe097          	auipc	ra,0xffffe
    80004c9c:	ae0080e7          	jalr	-1312(ra) # 80002778 <_ZN6ThreadD1Ev>
    80004ca0:	00813083          	ld	ra,8(sp)
    80004ca4:	00013403          	ld	s0,0(sp)
    80004ca8:	01010113          	addi	sp,sp,16
    80004cac:	00008067          	ret

0000000080004cb0 <_ZN16ProducerKeyboradD0Ev>:
    80004cb0:	fe010113          	addi	sp,sp,-32
    80004cb4:	00113c23          	sd	ra,24(sp)
    80004cb8:	00813823          	sd	s0,16(sp)
    80004cbc:	00913423          	sd	s1,8(sp)
    80004cc0:	02010413          	addi	s0,sp,32
    80004cc4:	00050493          	mv	s1,a0
    80004cc8:	00008797          	auipc	a5,0x8
    80004ccc:	ef878793          	addi	a5,a5,-264 # 8000cbc0 <_ZTV16ProducerKeyborad+0x10>
    80004cd0:	00f53023          	sd	a5,0(a0)
    80004cd4:	ffffe097          	auipc	ra,0xffffe
    80004cd8:	aa4080e7          	jalr	-1372(ra) # 80002778 <_ZN6ThreadD1Ev>
    80004cdc:	00048513          	mv	a0,s1
    80004ce0:	ffffe097          	auipc	ra,0xffffe
    80004ce4:	bd8080e7          	jalr	-1064(ra) # 800028b8 <_ZdlPv>
    80004ce8:	01813083          	ld	ra,24(sp)
    80004cec:	01013403          	ld	s0,16(sp)
    80004cf0:	00813483          	ld	s1,8(sp)
    80004cf4:	02010113          	addi	sp,sp,32
    80004cf8:	00008067          	ret

0000000080004cfc <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004cfc:	ff010113          	addi	sp,sp,-16
    80004d00:	00113423          	sd	ra,8(sp)
    80004d04:	00813023          	sd	s0,0(sp)
    80004d08:	01010413          	addi	s0,sp,16
    80004d0c:	00008797          	auipc	a5,0x8
    80004d10:	edc78793          	addi	a5,a5,-292 # 8000cbe8 <_ZTV8Producer+0x10>
    80004d14:	00f53023          	sd	a5,0(a0)
    80004d18:	ffffe097          	auipc	ra,0xffffe
    80004d1c:	a60080e7          	jalr	-1440(ra) # 80002778 <_ZN6ThreadD1Ev>
    80004d20:	00813083          	ld	ra,8(sp)
    80004d24:	00013403          	ld	s0,0(sp)
    80004d28:	01010113          	addi	sp,sp,16
    80004d2c:	00008067          	ret

0000000080004d30 <_ZN8ProducerD0Ev>:
    80004d30:	fe010113          	addi	sp,sp,-32
    80004d34:	00113c23          	sd	ra,24(sp)
    80004d38:	00813823          	sd	s0,16(sp)
    80004d3c:	00913423          	sd	s1,8(sp)
    80004d40:	02010413          	addi	s0,sp,32
    80004d44:	00050493          	mv	s1,a0
    80004d48:	00008797          	auipc	a5,0x8
    80004d4c:	ea078793          	addi	a5,a5,-352 # 8000cbe8 <_ZTV8Producer+0x10>
    80004d50:	00f53023          	sd	a5,0(a0)
    80004d54:	ffffe097          	auipc	ra,0xffffe
    80004d58:	a24080e7          	jalr	-1500(ra) # 80002778 <_ZN6ThreadD1Ev>
    80004d5c:	00048513          	mv	a0,s1
    80004d60:	ffffe097          	auipc	ra,0xffffe
    80004d64:	b58080e7          	jalr	-1192(ra) # 800028b8 <_ZdlPv>
    80004d68:	01813083          	ld	ra,24(sp)
    80004d6c:	01013403          	ld	s0,16(sp)
    80004d70:	00813483          	ld	s1,8(sp)
    80004d74:	02010113          	addi	sp,sp,32
    80004d78:	00008067          	ret

0000000080004d7c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004d7c:	fe010113          	addi	sp,sp,-32
    80004d80:	00113c23          	sd	ra,24(sp)
    80004d84:	00813823          	sd	s0,16(sp)
    80004d88:	00913423          	sd	s1,8(sp)
    80004d8c:	02010413          	addi	s0,sp,32
    80004d90:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004d94:	ffffc097          	auipc	ra,0xffffc
    80004d98:	7e0080e7          	jalr	2016(ra) # 80001574 <_Z4getcv>
    80004d9c:	0005059b          	sext.w	a1,a0
    80004da0:	01b00793          	li	a5,27
    80004da4:	00f58c63          	beq	a1,a5,80004dbc <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004da8:	0204b783          	ld	a5,32(s1)
    80004dac:	0087b503          	ld	a0,8(a5)
    80004db0:	00001097          	auipc	ra,0x1
    80004db4:	36c080e7          	jalr	876(ra) # 8000611c <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004db8:	fddff06f          	j	80004d94 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004dbc:	00100793          	li	a5,1
    80004dc0:	00008717          	auipc	a4,0x8
    80004dc4:	0ef72823          	sw	a5,240(a4) # 8000ceb0 <_ZL9threadEnd>
        td->buffer->put('!');
    80004dc8:	0204b783          	ld	a5,32(s1)
    80004dcc:	02100593          	li	a1,33
    80004dd0:	0087b503          	ld	a0,8(a5)
    80004dd4:	00001097          	auipc	ra,0x1
    80004dd8:	348080e7          	jalr	840(ra) # 8000611c <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004ddc:	0204b783          	ld	a5,32(s1)
    80004de0:	0107b503          	ld	a0,16(a5)
    80004de4:	ffffe097          	auipc	ra,0xffffe
    80004de8:	e3c080e7          	jalr	-452(ra) # 80002c20 <_ZN9Semaphore6signalEv>
    }
    80004dec:	01813083          	ld	ra,24(sp)
    80004df0:	01013403          	ld	s0,16(sp)
    80004df4:	00813483          	ld	s1,8(sp)
    80004df8:	02010113          	addi	sp,sp,32
    80004dfc:	00008067          	ret

0000000080004e00 <_ZN8Producer3runEv>:
    void run() override {
    80004e00:	fe010113          	addi	sp,sp,-32
    80004e04:	00113c23          	sd	ra,24(sp)
    80004e08:	00813823          	sd	s0,16(sp)
    80004e0c:	00913423          	sd	s1,8(sp)
    80004e10:	01213023          	sd	s2,0(sp)
    80004e14:	02010413          	addi	s0,sp,32
    80004e18:	00050493          	mv	s1,a0
        int i = 0;
    80004e1c:	00000913          	li	s2,0
        while (!threadEnd) {
    80004e20:	00008797          	auipc	a5,0x8
    80004e24:	0907a783          	lw	a5,144(a5) # 8000ceb0 <_ZL9threadEnd>
    80004e28:	04079263          	bnez	a5,80004e6c <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004e2c:	0204b783          	ld	a5,32(s1)
    80004e30:	0007a583          	lw	a1,0(a5)
    80004e34:	0305859b          	addiw	a1,a1,48
    80004e38:	0087b503          	ld	a0,8(a5)
    80004e3c:	00001097          	auipc	ra,0x1
    80004e40:	2e0080e7          	jalr	736(ra) # 8000611c <_ZN9BufferCPP3putEi>
            i++;
    80004e44:	0019071b          	addiw	a4,s2,1
    80004e48:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004e4c:	0204b783          	ld	a5,32(s1)
    80004e50:	0007a783          	lw	a5,0(a5)
    80004e54:	00e787bb          	addw	a5,a5,a4
    80004e58:	00500513          	li	a0,5
    80004e5c:	02a7e53b          	remw	a0,a5,a0
    80004e60:	ffffe097          	auipc	ra,0xffffe
    80004e64:	c4c080e7          	jalr	-948(ra) # 80002aac <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004e68:	fb9ff06f          	j	80004e20 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004e6c:	0204b783          	ld	a5,32(s1)
    80004e70:	0107b503          	ld	a0,16(a5)
    80004e74:	ffffe097          	auipc	ra,0xffffe
    80004e78:	dac080e7          	jalr	-596(ra) # 80002c20 <_ZN9Semaphore6signalEv>
    }
    80004e7c:	01813083          	ld	ra,24(sp)
    80004e80:	01013403          	ld	s0,16(sp)
    80004e84:	00813483          	ld	s1,8(sp)
    80004e88:	00013903          	ld	s2,0(sp)
    80004e8c:	02010113          	addi	sp,sp,32
    80004e90:	00008067          	ret

0000000080004e94 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004e94:	fe010113          	addi	sp,sp,-32
    80004e98:	00113c23          	sd	ra,24(sp)
    80004e9c:	00813823          	sd	s0,16(sp)
    80004ea0:	00913423          	sd	s1,8(sp)
    80004ea4:	01213023          	sd	s2,0(sp)
    80004ea8:	02010413          	addi	s0,sp,32
    80004eac:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004eb0:	00100793          	li	a5,1
    80004eb4:	02a7f863          	bgeu	a5,a0,80004ee4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004eb8:	00a00793          	li	a5,10
    80004ebc:	02f577b3          	remu	a5,a0,a5
    80004ec0:	02078e63          	beqz	a5,80004efc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004ec4:	fff48513          	addi	a0,s1,-1
    80004ec8:	00000097          	auipc	ra,0x0
    80004ecc:	fcc080e7          	jalr	-52(ra) # 80004e94 <_ZL9fibonaccim>
    80004ed0:	00050913          	mv	s2,a0
    80004ed4:	ffe48513          	addi	a0,s1,-2
    80004ed8:	00000097          	auipc	ra,0x0
    80004edc:	fbc080e7          	jalr	-68(ra) # 80004e94 <_ZL9fibonaccim>
    80004ee0:	00a90533          	add	a0,s2,a0
}
    80004ee4:	01813083          	ld	ra,24(sp)
    80004ee8:	01013403          	ld	s0,16(sp)
    80004eec:	00813483          	ld	s1,8(sp)
    80004ef0:	00013903          	ld	s2,0(sp)
    80004ef4:	02010113          	addi	sp,sp,32
    80004ef8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004efc:	ffffc097          	auipc	ra,0xffffc
    80004f00:	538080e7          	jalr	1336(ra) # 80001434 <_Z15thread_dispatchv>
    80004f04:	fc1ff06f          	j	80004ec4 <_ZL9fibonaccim+0x30>

0000000080004f08 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004f08:	fe010113          	addi	sp,sp,-32
    80004f0c:	00113c23          	sd	ra,24(sp)
    80004f10:	00813823          	sd	s0,16(sp)
    80004f14:	00913423          	sd	s1,8(sp)
    80004f18:	01213023          	sd	s2,0(sp)
    80004f1c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004f20:	00a00493          	li	s1,10
    80004f24:	0400006f          	j	80004f64 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004f28:	00005517          	auipc	a0,0x5
    80004f2c:	4a050513          	addi	a0,a0,1184 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80004f30:	00001097          	auipc	ra,0x1
    80004f34:	dc8080e7          	jalr	-568(ra) # 80005cf8 <_Z11printStringPKc>
    80004f38:	00000613          	li	a2,0
    80004f3c:	00a00593          	li	a1,10
    80004f40:	00048513          	mv	a0,s1
    80004f44:	00001097          	auipc	ra,0x1
    80004f48:	f64080e7          	jalr	-156(ra) # 80005ea8 <_Z8printIntiii>
    80004f4c:	00005517          	auipc	a0,0x5
    80004f50:	66c50513          	addi	a0,a0,1644 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80004f54:	00001097          	auipc	ra,0x1
    80004f58:	da4080e7          	jalr	-604(ra) # 80005cf8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004f5c:	0014849b          	addiw	s1,s1,1
    80004f60:	0ff4f493          	andi	s1,s1,255
    80004f64:	00c00793          	li	a5,12
    80004f68:	fc97f0e3          	bgeu	a5,s1,80004f28 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004f6c:	00005517          	auipc	a0,0x5
    80004f70:	46450513          	addi	a0,a0,1124 # 8000a3d0 <_ZZ9kPrintIntmE6digits+0x360>
    80004f74:	00001097          	auipc	ra,0x1
    80004f78:	d84080e7          	jalr	-636(ra) # 80005cf8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004f7c:	00500313          	li	t1,5
    thread_dispatch();
    80004f80:	ffffc097          	auipc	ra,0xffffc
    80004f84:	4b4080e7          	jalr	1204(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004f88:	01000513          	li	a0,16
    80004f8c:	00000097          	auipc	ra,0x0
    80004f90:	f08080e7          	jalr	-248(ra) # 80004e94 <_ZL9fibonaccim>
    80004f94:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004f98:	00005517          	auipc	a0,0x5
    80004f9c:	44850513          	addi	a0,a0,1096 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80004fa0:	00001097          	auipc	ra,0x1
    80004fa4:	d58080e7          	jalr	-680(ra) # 80005cf8 <_Z11printStringPKc>
    80004fa8:	00000613          	li	a2,0
    80004fac:	00a00593          	li	a1,10
    80004fb0:	0009051b          	sext.w	a0,s2
    80004fb4:	00001097          	auipc	ra,0x1
    80004fb8:	ef4080e7          	jalr	-268(ra) # 80005ea8 <_Z8printIntiii>
    80004fbc:	00005517          	auipc	a0,0x5
    80004fc0:	5fc50513          	addi	a0,a0,1532 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80004fc4:	00001097          	auipc	ra,0x1
    80004fc8:	d34080e7          	jalr	-716(ra) # 80005cf8 <_Z11printStringPKc>
    80004fcc:	0400006f          	j	8000500c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004fd0:	00005517          	auipc	a0,0x5
    80004fd4:	3f850513          	addi	a0,a0,1016 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80004fd8:	00001097          	auipc	ra,0x1
    80004fdc:	d20080e7          	jalr	-736(ra) # 80005cf8 <_Z11printStringPKc>
    80004fe0:	00000613          	li	a2,0
    80004fe4:	00a00593          	li	a1,10
    80004fe8:	00048513          	mv	a0,s1
    80004fec:	00001097          	auipc	ra,0x1
    80004ff0:	ebc080e7          	jalr	-324(ra) # 80005ea8 <_Z8printIntiii>
    80004ff4:	00005517          	auipc	a0,0x5
    80004ff8:	5c450513          	addi	a0,a0,1476 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80004ffc:	00001097          	auipc	ra,0x1
    80005000:	cfc080e7          	jalr	-772(ra) # 80005cf8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005004:	0014849b          	addiw	s1,s1,1
    80005008:	0ff4f493          	andi	s1,s1,255
    8000500c:	00f00793          	li	a5,15
    80005010:	fc97f0e3          	bgeu	a5,s1,80004fd0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005014:	00005517          	auipc	a0,0x5
    80005018:	3dc50513          	addi	a0,a0,988 # 8000a3f0 <_ZZ9kPrintIntmE6digits+0x380>
    8000501c:	00001097          	auipc	ra,0x1
    80005020:	cdc080e7          	jalr	-804(ra) # 80005cf8 <_Z11printStringPKc>
    finishedD = true;
    80005024:	00100793          	li	a5,1
    80005028:	00008717          	auipc	a4,0x8
    8000502c:	e8f70c23          	sb	a5,-360(a4) # 8000cec0 <_ZL9finishedD>
    thread_dispatch();
    80005030:	ffffc097          	auipc	ra,0xffffc
    80005034:	404080e7          	jalr	1028(ra) # 80001434 <_Z15thread_dispatchv>
}
    80005038:	01813083          	ld	ra,24(sp)
    8000503c:	01013403          	ld	s0,16(sp)
    80005040:	00813483          	ld	s1,8(sp)
    80005044:	00013903          	ld	s2,0(sp)
    80005048:	02010113          	addi	sp,sp,32
    8000504c:	00008067          	ret

0000000080005050 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005050:	fe010113          	addi	sp,sp,-32
    80005054:	00113c23          	sd	ra,24(sp)
    80005058:	00813823          	sd	s0,16(sp)
    8000505c:	00913423          	sd	s1,8(sp)
    80005060:	01213023          	sd	s2,0(sp)
    80005064:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005068:	00000493          	li	s1,0
    8000506c:	0400006f          	j	800050ac <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005070:	00005517          	auipc	a0,0x5
    80005074:	31850513          	addi	a0,a0,792 # 8000a388 <_ZZ9kPrintIntmE6digits+0x318>
    80005078:	00001097          	auipc	ra,0x1
    8000507c:	c80080e7          	jalr	-896(ra) # 80005cf8 <_Z11printStringPKc>
    80005080:	00000613          	li	a2,0
    80005084:	00a00593          	li	a1,10
    80005088:	00048513          	mv	a0,s1
    8000508c:	00001097          	auipc	ra,0x1
    80005090:	e1c080e7          	jalr	-484(ra) # 80005ea8 <_Z8printIntiii>
    80005094:	00005517          	auipc	a0,0x5
    80005098:	52450513          	addi	a0,a0,1316 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    8000509c:	00001097          	auipc	ra,0x1
    800050a0:	c5c080e7          	jalr	-932(ra) # 80005cf8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800050a4:	0014849b          	addiw	s1,s1,1
    800050a8:	0ff4f493          	andi	s1,s1,255
    800050ac:	00200793          	li	a5,2
    800050b0:	fc97f0e3          	bgeu	a5,s1,80005070 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800050b4:	00005517          	auipc	a0,0x5
    800050b8:	2dc50513          	addi	a0,a0,732 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    800050bc:	00001097          	auipc	ra,0x1
    800050c0:	c3c080e7          	jalr	-964(ra) # 80005cf8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800050c4:	00700313          	li	t1,7
    thread_dispatch();
    800050c8:	ffffc097          	auipc	ra,0xffffc
    800050cc:	36c080e7          	jalr	876(ra) # 80001434 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800050d0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800050d4:	00005517          	auipc	a0,0x5
    800050d8:	2cc50513          	addi	a0,a0,716 # 8000a3a0 <_ZZ9kPrintIntmE6digits+0x330>
    800050dc:	00001097          	auipc	ra,0x1
    800050e0:	c1c080e7          	jalr	-996(ra) # 80005cf8 <_Z11printStringPKc>
    800050e4:	00000613          	li	a2,0
    800050e8:	00a00593          	li	a1,10
    800050ec:	0009051b          	sext.w	a0,s2
    800050f0:	00001097          	auipc	ra,0x1
    800050f4:	db8080e7          	jalr	-584(ra) # 80005ea8 <_Z8printIntiii>
    800050f8:	00005517          	auipc	a0,0x5
    800050fc:	4c050513          	addi	a0,a0,1216 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80005100:	00001097          	auipc	ra,0x1
    80005104:	bf8080e7          	jalr	-1032(ra) # 80005cf8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005108:	00c00513          	li	a0,12
    8000510c:	00000097          	auipc	ra,0x0
    80005110:	d88080e7          	jalr	-632(ra) # 80004e94 <_ZL9fibonaccim>
    80005114:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005118:	00005517          	auipc	a0,0x5
    8000511c:	29050513          	addi	a0,a0,656 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    80005120:	00001097          	auipc	ra,0x1
    80005124:	bd8080e7          	jalr	-1064(ra) # 80005cf8 <_Z11printStringPKc>
    80005128:	00000613          	li	a2,0
    8000512c:	00a00593          	li	a1,10
    80005130:	0009051b          	sext.w	a0,s2
    80005134:	00001097          	auipc	ra,0x1
    80005138:	d74080e7          	jalr	-652(ra) # 80005ea8 <_Z8printIntiii>
    8000513c:	00005517          	auipc	a0,0x5
    80005140:	47c50513          	addi	a0,a0,1148 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80005144:	00001097          	auipc	ra,0x1
    80005148:	bb4080e7          	jalr	-1100(ra) # 80005cf8 <_Z11printStringPKc>
    8000514c:	0400006f          	j	8000518c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005150:	00005517          	auipc	a0,0x5
    80005154:	23850513          	addi	a0,a0,568 # 8000a388 <_ZZ9kPrintIntmE6digits+0x318>
    80005158:	00001097          	auipc	ra,0x1
    8000515c:	ba0080e7          	jalr	-1120(ra) # 80005cf8 <_Z11printStringPKc>
    80005160:	00000613          	li	a2,0
    80005164:	00a00593          	li	a1,10
    80005168:	00048513          	mv	a0,s1
    8000516c:	00001097          	auipc	ra,0x1
    80005170:	d3c080e7          	jalr	-708(ra) # 80005ea8 <_Z8printIntiii>
    80005174:	00005517          	auipc	a0,0x5
    80005178:	44450513          	addi	a0,a0,1092 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    8000517c:	00001097          	auipc	ra,0x1
    80005180:	b7c080e7          	jalr	-1156(ra) # 80005cf8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005184:	0014849b          	addiw	s1,s1,1
    80005188:	0ff4f493          	andi	s1,s1,255
    8000518c:	00500793          	li	a5,5
    80005190:	fc97f0e3          	bgeu	a5,s1,80005150 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005194:	00005517          	auipc	a0,0x5
    80005198:	22450513          	addi	a0,a0,548 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    8000519c:	00001097          	auipc	ra,0x1
    800051a0:	b5c080e7          	jalr	-1188(ra) # 80005cf8 <_Z11printStringPKc>
    finishedC = true;
    800051a4:	00100793          	li	a5,1
    800051a8:	00008717          	auipc	a4,0x8
    800051ac:	d0f70ca3          	sb	a5,-743(a4) # 8000cec1 <_ZL9finishedC>
    thread_dispatch();
    800051b0:	ffffc097          	auipc	ra,0xffffc
    800051b4:	284080e7          	jalr	644(ra) # 80001434 <_Z15thread_dispatchv>
}
    800051b8:	01813083          	ld	ra,24(sp)
    800051bc:	01013403          	ld	s0,16(sp)
    800051c0:	00813483          	ld	s1,8(sp)
    800051c4:	00013903          	ld	s2,0(sp)
    800051c8:	02010113          	addi	sp,sp,32
    800051cc:	00008067          	ret

00000000800051d0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800051d0:	fe010113          	addi	sp,sp,-32
    800051d4:	00113c23          	sd	ra,24(sp)
    800051d8:	00813823          	sd	s0,16(sp)
    800051dc:	00913423          	sd	s1,8(sp)
    800051e0:	01213023          	sd	s2,0(sp)
    800051e4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800051e8:	00000913          	li	s2,0
    800051ec:	0380006f          	j	80005224 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    800051f0:	ffffc097          	auipc	ra,0xffffc
    800051f4:	244080e7          	jalr	580(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800051f8:	00148493          	addi	s1,s1,1
    800051fc:	000027b7          	lui	a5,0x2
    80005200:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005204:	0097ee63          	bltu	a5,s1,80005220 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005208:	00000713          	li	a4,0
    8000520c:	000077b7          	lui	a5,0x7
    80005210:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005214:	fce7eee3          	bltu	a5,a4,800051f0 <_ZL11workerBodyBPv+0x20>
    80005218:	00170713          	addi	a4,a4,1
    8000521c:	ff1ff06f          	j	8000520c <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80005220:	00190913          	addi	s2,s2,1
    80005224:	00f00793          	li	a5,15
    80005228:	0527e063          	bltu	a5,s2,80005268 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    8000522c:	00005517          	auipc	a0,0x5
    80005230:	14450513          	addi	a0,a0,324 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    80005234:	00001097          	auipc	ra,0x1
    80005238:	ac4080e7          	jalr	-1340(ra) # 80005cf8 <_Z11printStringPKc>
    8000523c:	00000613          	li	a2,0
    80005240:	00a00593          	li	a1,10
    80005244:	0009051b          	sext.w	a0,s2
    80005248:	00001097          	auipc	ra,0x1
    8000524c:	c60080e7          	jalr	-928(ra) # 80005ea8 <_Z8printIntiii>
    80005250:	00005517          	auipc	a0,0x5
    80005254:	36850513          	addi	a0,a0,872 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80005258:	00001097          	auipc	ra,0x1
    8000525c:	aa0080e7          	jalr	-1376(ra) # 80005cf8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005260:	00000493          	li	s1,0
    80005264:	f99ff06f          	j	800051fc <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80005268:	00005517          	auipc	a0,0x5
    8000526c:	11050513          	addi	a0,a0,272 # 8000a378 <_ZZ9kPrintIntmE6digits+0x308>
    80005270:	00001097          	auipc	ra,0x1
    80005274:	a88080e7          	jalr	-1400(ra) # 80005cf8 <_Z11printStringPKc>
    finishedB = true;
    80005278:	00100793          	li	a5,1
    8000527c:	00008717          	auipc	a4,0x8
    80005280:	c4f70323          	sb	a5,-954(a4) # 8000cec2 <_ZL9finishedB>
    thread_dispatch();
    80005284:	ffffc097          	auipc	ra,0xffffc
    80005288:	1b0080e7          	jalr	432(ra) # 80001434 <_Z15thread_dispatchv>
}
    8000528c:	01813083          	ld	ra,24(sp)
    80005290:	01013403          	ld	s0,16(sp)
    80005294:	00813483          	ld	s1,8(sp)
    80005298:	00013903          	ld	s2,0(sp)
    8000529c:	02010113          	addi	sp,sp,32
    800052a0:	00008067          	ret

00000000800052a4 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800052a4:	fe010113          	addi	sp,sp,-32
    800052a8:	00113c23          	sd	ra,24(sp)
    800052ac:	00813823          	sd	s0,16(sp)
    800052b0:	00913423          	sd	s1,8(sp)
    800052b4:	01213023          	sd	s2,0(sp)
    800052b8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800052bc:	00000913          	li	s2,0
    800052c0:	0380006f          	j	800052f8 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800052c4:	ffffc097          	auipc	ra,0xffffc
    800052c8:	170080e7          	jalr	368(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800052cc:	00148493          	addi	s1,s1,1
    800052d0:	000027b7          	lui	a5,0x2
    800052d4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800052d8:	0097ee63          	bltu	a5,s1,800052f4 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800052dc:	00000713          	li	a4,0
    800052e0:	000077b7          	lui	a5,0x7
    800052e4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800052e8:	fce7eee3          	bltu	a5,a4,800052c4 <_ZL11workerBodyAPv+0x20>
    800052ec:	00170713          	addi	a4,a4,1
    800052f0:	ff1ff06f          	j	800052e0 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800052f4:	00190913          	addi	s2,s2,1
    800052f8:	00900793          	li	a5,9
    800052fc:	0527e063          	bltu	a5,s2,8000533c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005300:	00005517          	auipc	a0,0x5
    80005304:	05850513          	addi	a0,a0,88 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80005308:	00001097          	auipc	ra,0x1
    8000530c:	9f0080e7          	jalr	-1552(ra) # 80005cf8 <_Z11printStringPKc>
    80005310:	00000613          	li	a2,0
    80005314:	00a00593          	li	a1,10
    80005318:	0009051b          	sext.w	a0,s2
    8000531c:	00001097          	auipc	ra,0x1
    80005320:	b8c080e7          	jalr	-1140(ra) # 80005ea8 <_Z8printIntiii>
    80005324:	00005517          	auipc	a0,0x5
    80005328:	29450513          	addi	a0,a0,660 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    8000532c:	00001097          	auipc	ra,0x1
    80005330:	9cc080e7          	jalr	-1588(ra) # 80005cf8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005334:	00000493          	li	s1,0
    80005338:	f99ff06f          	j	800052d0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    8000533c:	00005517          	auipc	a0,0x5
    80005340:	02450513          	addi	a0,a0,36 # 8000a360 <_ZZ9kPrintIntmE6digits+0x2f0>
    80005344:	00001097          	auipc	ra,0x1
    80005348:	9b4080e7          	jalr	-1612(ra) # 80005cf8 <_Z11printStringPKc>
    finishedA = true;
    8000534c:	00100793          	li	a5,1
    80005350:	00008717          	auipc	a4,0x8
    80005354:	b6f709a3          	sb	a5,-1165(a4) # 8000cec3 <_ZL9finishedA>
}
    80005358:	01813083          	ld	ra,24(sp)
    8000535c:	01013403          	ld	s0,16(sp)
    80005360:	00813483          	ld	s1,8(sp)
    80005364:	00013903          	ld	s2,0(sp)
    80005368:	02010113          	addi	sp,sp,32
    8000536c:	00008067          	ret

0000000080005370 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005370:	fd010113          	addi	sp,sp,-48
    80005374:	02113423          	sd	ra,40(sp)
    80005378:	02813023          	sd	s0,32(sp)
    8000537c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005380:	00000613          	li	a2,0
    80005384:	00000597          	auipc	a1,0x0
    80005388:	f2058593          	addi	a1,a1,-224 # 800052a4 <_ZL11workerBodyAPv>
    8000538c:	fd040513          	addi	a0,s0,-48
    80005390:	ffffc097          	auipc	ra,0xffffc
    80005394:	fe8080e7          	jalr	-24(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005398:	00005517          	auipc	a0,0x5
    8000539c:	06850513          	addi	a0,a0,104 # 8000a400 <_ZZ9kPrintIntmE6digits+0x390>
    800053a0:	00001097          	auipc	ra,0x1
    800053a4:	958080e7          	jalr	-1704(ra) # 80005cf8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800053a8:	00000613          	li	a2,0
    800053ac:	00000597          	auipc	a1,0x0
    800053b0:	e2458593          	addi	a1,a1,-476 # 800051d0 <_ZL11workerBodyBPv>
    800053b4:	fd840513          	addi	a0,s0,-40
    800053b8:	ffffc097          	auipc	ra,0xffffc
    800053bc:	fc0080e7          	jalr	-64(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800053c0:	00005517          	auipc	a0,0x5
    800053c4:	05850513          	addi	a0,a0,88 # 8000a418 <_ZZ9kPrintIntmE6digits+0x3a8>
    800053c8:	00001097          	auipc	ra,0x1
    800053cc:	930080e7          	jalr	-1744(ra) # 80005cf8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800053d0:	00000613          	li	a2,0
    800053d4:	00000597          	auipc	a1,0x0
    800053d8:	c7c58593          	addi	a1,a1,-900 # 80005050 <_ZL11workerBodyCPv>
    800053dc:	fe040513          	addi	a0,s0,-32
    800053e0:	ffffc097          	auipc	ra,0xffffc
    800053e4:	f98080e7          	jalr	-104(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800053e8:	00005517          	auipc	a0,0x5
    800053ec:	04850513          	addi	a0,a0,72 # 8000a430 <_ZZ9kPrintIntmE6digits+0x3c0>
    800053f0:	00001097          	auipc	ra,0x1
    800053f4:	908080e7          	jalr	-1784(ra) # 80005cf8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800053f8:	00000613          	li	a2,0
    800053fc:	00000597          	auipc	a1,0x0
    80005400:	b0c58593          	addi	a1,a1,-1268 # 80004f08 <_ZL11workerBodyDPv>
    80005404:	fe840513          	addi	a0,s0,-24
    80005408:	ffffc097          	auipc	ra,0xffffc
    8000540c:	f70080e7          	jalr	-144(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005410:	00005517          	auipc	a0,0x5
    80005414:	03850513          	addi	a0,a0,56 # 8000a448 <_ZZ9kPrintIntmE6digits+0x3d8>
    80005418:	00001097          	auipc	ra,0x1
    8000541c:	8e0080e7          	jalr	-1824(ra) # 80005cf8 <_Z11printStringPKc>
    80005420:	00c0006f          	j	8000542c <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005424:	ffffc097          	auipc	ra,0xffffc
    80005428:	010080e7          	jalr	16(ra) # 80001434 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000542c:	00008797          	auipc	a5,0x8
    80005430:	a977c783          	lbu	a5,-1385(a5) # 8000cec3 <_ZL9finishedA>
    80005434:	fe0788e3          	beqz	a5,80005424 <_Z18Threads_C_API_testv+0xb4>
    80005438:	00008797          	auipc	a5,0x8
    8000543c:	a8a7c783          	lbu	a5,-1398(a5) # 8000cec2 <_ZL9finishedB>
    80005440:	fe0782e3          	beqz	a5,80005424 <_Z18Threads_C_API_testv+0xb4>
    80005444:	00008797          	auipc	a5,0x8
    80005448:	a7d7c783          	lbu	a5,-1411(a5) # 8000cec1 <_ZL9finishedC>
    8000544c:	fc078ce3          	beqz	a5,80005424 <_Z18Threads_C_API_testv+0xb4>
    80005450:	00008797          	auipc	a5,0x8
    80005454:	a707c783          	lbu	a5,-1424(a5) # 8000cec0 <_ZL9finishedD>
    80005458:	fc0786e3          	beqz	a5,80005424 <_Z18Threads_C_API_testv+0xb4>
    }

}
    8000545c:	02813083          	ld	ra,40(sp)
    80005460:	02013403          	ld	s0,32(sp)
    80005464:	03010113          	addi	sp,sp,48
    80005468:	00008067          	ret

000000008000546c <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    8000546c:	fd010113          	addi	sp,sp,-48
    80005470:	02113423          	sd	ra,40(sp)
    80005474:	02813023          	sd	s0,32(sp)
    80005478:	00913c23          	sd	s1,24(sp)
    8000547c:	01213823          	sd	s2,16(sp)
    80005480:	01313423          	sd	s3,8(sp)
    80005484:	03010413          	addi	s0,sp,48
    80005488:	00050993          	mv	s3,a0
    8000548c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005490:	00000913          	li	s2,0
    80005494:	00c0006f          	j	800054a0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005498:	ffffd097          	auipc	ra,0xffffd
    8000549c:	5ec080e7          	jalr	1516(ra) # 80002a84 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    800054a0:	ffffc097          	auipc	ra,0xffffc
    800054a4:	0d4080e7          	jalr	212(ra) # 80001574 <_Z4getcv>
    800054a8:	0005059b          	sext.w	a1,a0
    800054ac:	01b00793          	li	a5,27
    800054b0:	02f58a63          	beq	a1,a5,800054e4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    800054b4:	0084b503          	ld	a0,8(s1)
    800054b8:	00001097          	auipc	ra,0x1
    800054bc:	c64080e7          	jalr	-924(ra) # 8000611c <_ZN9BufferCPP3putEi>
        i++;
    800054c0:	0019071b          	addiw	a4,s2,1
    800054c4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800054c8:	0004a683          	lw	a3,0(s1)
    800054cc:	0026979b          	slliw	a5,a3,0x2
    800054d0:	00d787bb          	addw	a5,a5,a3
    800054d4:	0017979b          	slliw	a5,a5,0x1
    800054d8:	02f767bb          	remw	a5,a4,a5
    800054dc:	fc0792e3          	bnez	a5,800054a0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800054e0:	fb9ff06f          	j	80005498 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800054e4:	00100793          	li	a5,1
    800054e8:	00008717          	auipc	a4,0x8
    800054ec:	9ef72023          	sw	a5,-1568(a4) # 8000cec8 <_ZL9threadEnd>
    td->buffer->put('!');
    800054f0:	0209b783          	ld	a5,32(s3)
    800054f4:	02100593          	li	a1,33
    800054f8:	0087b503          	ld	a0,8(a5)
    800054fc:	00001097          	auipc	ra,0x1
    80005500:	c20080e7          	jalr	-992(ra) # 8000611c <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005504:	0104b503          	ld	a0,16(s1)
    80005508:	ffffd097          	auipc	ra,0xffffd
    8000550c:	718080e7          	jalr	1816(ra) # 80002c20 <_ZN9Semaphore6signalEv>
}
    80005510:	02813083          	ld	ra,40(sp)
    80005514:	02013403          	ld	s0,32(sp)
    80005518:	01813483          	ld	s1,24(sp)
    8000551c:	01013903          	ld	s2,16(sp)
    80005520:	00813983          	ld	s3,8(sp)
    80005524:	03010113          	addi	sp,sp,48
    80005528:	00008067          	ret

000000008000552c <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    8000552c:	fe010113          	addi	sp,sp,-32
    80005530:	00113c23          	sd	ra,24(sp)
    80005534:	00813823          	sd	s0,16(sp)
    80005538:	00913423          	sd	s1,8(sp)
    8000553c:	01213023          	sd	s2,0(sp)
    80005540:	02010413          	addi	s0,sp,32
    80005544:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005548:	00000913          	li	s2,0
    8000554c:	00c0006f          	j	80005558 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005550:	ffffd097          	auipc	ra,0xffffd
    80005554:	534080e7          	jalr	1332(ra) # 80002a84 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005558:	00008797          	auipc	a5,0x8
    8000555c:	9707a783          	lw	a5,-1680(a5) # 8000cec8 <_ZL9threadEnd>
    80005560:	02079e63          	bnez	a5,8000559c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005564:	0004a583          	lw	a1,0(s1)
    80005568:	0305859b          	addiw	a1,a1,48
    8000556c:	0084b503          	ld	a0,8(s1)
    80005570:	00001097          	auipc	ra,0x1
    80005574:	bac080e7          	jalr	-1108(ra) # 8000611c <_ZN9BufferCPP3putEi>
        i++;
    80005578:	0019071b          	addiw	a4,s2,1
    8000557c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005580:	0004a683          	lw	a3,0(s1)
    80005584:	0026979b          	slliw	a5,a3,0x2
    80005588:	00d787bb          	addw	a5,a5,a3
    8000558c:	0017979b          	slliw	a5,a5,0x1
    80005590:	02f767bb          	remw	a5,a4,a5
    80005594:	fc0792e3          	bnez	a5,80005558 <_ZN12ProducerSync8producerEPv+0x2c>
    80005598:	fb9ff06f          	j	80005550 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    8000559c:	0104b503          	ld	a0,16(s1)
    800055a0:	ffffd097          	auipc	ra,0xffffd
    800055a4:	680080e7          	jalr	1664(ra) # 80002c20 <_ZN9Semaphore6signalEv>
}
    800055a8:	01813083          	ld	ra,24(sp)
    800055ac:	01013403          	ld	s0,16(sp)
    800055b0:	00813483          	ld	s1,8(sp)
    800055b4:	00013903          	ld	s2,0(sp)
    800055b8:	02010113          	addi	sp,sp,32
    800055bc:	00008067          	ret

00000000800055c0 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    800055c0:	fd010113          	addi	sp,sp,-48
    800055c4:	02113423          	sd	ra,40(sp)
    800055c8:	02813023          	sd	s0,32(sp)
    800055cc:	00913c23          	sd	s1,24(sp)
    800055d0:	01213823          	sd	s2,16(sp)
    800055d4:	01313423          	sd	s3,8(sp)
    800055d8:	01413023          	sd	s4,0(sp)
    800055dc:	03010413          	addi	s0,sp,48
    800055e0:	00050993          	mv	s3,a0
    800055e4:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800055e8:	00000a13          	li	s4,0
    800055ec:	01c0006f          	j	80005608 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800055f0:	ffffd097          	auipc	ra,0xffffd
    800055f4:	494080e7          	jalr	1172(ra) # 80002a84 <_ZN6Thread8dispatchEv>
    800055f8:	0500006f          	j	80005648 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800055fc:	00a00513          	li	a0,10
    80005600:	ffffc097          	auipc	ra,0xffffc
    80005604:	f9c080e7          	jalr	-100(ra) # 8000159c <_Z4putcc>
    while (!threadEnd) {
    80005608:	00008797          	auipc	a5,0x8
    8000560c:	8c07a783          	lw	a5,-1856(a5) # 8000cec8 <_ZL9threadEnd>
    80005610:	06079263          	bnez	a5,80005674 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005614:	00893503          	ld	a0,8(s2)
    80005618:	00001097          	auipc	ra,0x1
    8000561c:	b94080e7          	jalr	-1132(ra) # 800061ac <_ZN9BufferCPP3getEv>
        i++;
    80005620:	001a049b          	addiw	s1,s4,1
    80005624:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005628:	0ff57513          	andi	a0,a0,255
    8000562c:	ffffc097          	auipc	ra,0xffffc
    80005630:	f70080e7          	jalr	-144(ra) # 8000159c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005634:	00092703          	lw	a4,0(s2)
    80005638:	0027179b          	slliw	a5,a4,0x2
    8000563c:	00e787bb          	addw	a5,a5,a4
    80005640:	02f4e7bb          	remw	a5,s1,a5
    80005644:	fa0786e3          	beqz	a5,800055f0 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005648:	05000793          	li	a5,80
    8000564c:	02f4e4bb          	remw	s1,s1,a5
    80005650:	fa049ce3          	bnez	s1,80005608 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005654:	fa9ff06f          	j	800055fc <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005658:	0209b783          	ld	a5,32(s3)
    8000565c:	0087b503          	ld	a0,8(a5)
    80005660:	00001097          	auipc	ra,0x1
    80005664:	b4c080e7          	jalr	-1204(ra) # 800061ac <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005668:	0ff57513          	andi	a0,a0,255
    8000566c:	ffffd097          	auipc	ra,0xffffd
    80005670:	678080e7          	jalr	1656(ra) # 80002ce4 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005674:	0209b783          	ld	a5,32(s3)
    80005678:	0087b503          	ld	a0,8(a5)
    8000567c:	00001097          	auipc	ra,0x1
    80005680:	bbc080e7          	jalr	-1092(ra) # 80006238 <_ZN9BufferCPP6getCntEv>
    80005684:	fca04ae3          	bgtz	a0,80005658 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005688:	01093503          	ld	a0,16(s2)
    8000568c:	ffffd097          	auipc	ra,0xffffd
    80005690:	594080e7          	jalr	1428(ra) # 80002c20 <_ZN9Semaphore6signalEv>
}
    80005694:	02813083          	ld	ra,40(sp)
    80005698:	02013403          	ld	s0,32(sp)
    8000569c:	01813483          	ld	s1,24(sp)
    800056a0:	01013903          	ld	s2,16(sp)
    800056a4:	00813983          	ld	s3,8(sp)
    800056a8:	00013a03          	ld	s4,0(sp)
    800056ac:	03010113          	addi	sp,sp,48
    800056b0:	00008067          	ret

00000000800056b4 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    800056b4:	f8010113          	addi	sp,sp,-128
    800056b8:	06113c23          	sd	ra,120(sp)
    800056bc:	06813823          	sd	s0,112(sp)
    800056c0:	06913423          	sd	s1,104(sp)
    800056c4:	07213023          	sd	s2,96(sp)
    800056c8:	05313c23          	sd	s3,88(sp)
    800056cc:	05413823          	sd	s4,80(sp)
    800056d0:	05513423          	sd	s5,72(sp)
    800056d4:	05613023          	sd	s6,64(sp)
    800056d8:	03713c23          	sd	s7,56(sp)
    800056dc:	03813823          	sd	s8,48(sp)
    800056e0:	03913423          	sd	s9,40(sp)
    800056e4:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800056e8:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800056ec:	00005517          	auipc	a0,0x5
    800056f0:	b8450513          	addi	a0,a0,-1148 # 8000a270 <_ZZ9kPrintIntmE6digits+0x200>
    800056f4:	00000097          	auipc	ra,0x0
    800056f8:	604080e7          	jalr	1540(ra) # 80005cf8 <_Z11printStringPKc>
    getString(input, 30);
    800056fc:	01e00593          	li	a1,30
    80005700:	f8040493          	addi	s1,s0,-128
    80005704:	00048513          	mv	a0,s1
    80005708:	00000097          	auipc	ra,0x0
    8000570c:	678080e7          	jalr	1656(ra) # 80005d80 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005710:	00048513          	mv	a0,s1
    80005714:	00000097          	auipc	ra,0x0
    80005718:	744080e7          	jalr	1860(ra) # 80005e58 <_Z11stringToIntPKc>
    8000571c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005720:	00005517          	auipc	a0,0x5
    80005724:	b7050513          	addi	a0,a0,-1168 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    80005728:	00000097          	auipc	ra,0x0
    8000572c:	5d0080e7          	jalr	1488(ra) # 80005cf8 <_Z11printStringPKc>
    getString(input, 30);
    80005730:	01e00593          	li	a1,30
    80005734:	00048513          	mv	a0,s1
    80005738:	00000097          	auipc	ra,0x0
    8000573c:	648080e7          	jalr	1608(ra) # 80005d80 <_Z9getStringPci>
    n = stringToInt(input);
    80005740:	00048513          	mv	a0,s1
    80005744:	00000097          	auipc	ra,0x0
    80005748:	714080e7          	jalr	1812(ra) # 80005e58 <_Z11stringToIntPKc>
    8000574c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005750:	00005517          	auipc	a0,0x5
    80005754:	b6050513          	addi	a0,a0,-1184 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    80005758:	00000097          	auipc	ra,0x0
    8000575c:	5a0080e7          	jalr	1440(ra) # 80005cf8 <_Z11printStringPKc>
    80005760:	00000613          	li	a2,0
    80005764:	00a00593          	li	a1,10
    80005768:	00090513          	mv	a0,s2
    8000576c:	00000097          	auipc	ra,0x0
    80005770:	73c080e7          	jalr	1852(ra) # 80005ea8 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005774:	00005517          	auipc	a0,0x5
    80005778:	b5450513          	addi	a0,a0,-1196 # 8000a2c8 <_ZZ9kPrintIntmE6digits+0x258>
    8000577c:	00000097          	auipc	ra,0x0
    80005780:	57c080e7          	jalr	1404(ra) # 80005cf8 <_Z11printStringPKc>
    80005784:	00000613          	li	a2,0
    80005788:	00a00593          	li	a1,10
    8000578c:	00048513          	mv	a0,s1
    80005790:	00000097          	auipc	ra,0x0
    80005794:	718080e7          	jalr	1816(ra) # 80005ea8 <_Z8printIntiii>
    printString(".\n");
    80005798:	00005517          	auipc	a0,0x5
    8000579c:	b4850513          	addi	a0,a0,-1208 # 8000a2e0 <_ZZ9kPrintIntmE6digits+0x270>
    800057a0:	00000097          	auipc	ra,0x0
    800057a4:	558080e7          	jalr	1368(ra) # 80005cf8 <_Z11printStringPKc>
    if(threadNum > n) {
    800057a8:	0324c463          	blt	s1,s2,800057d0 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    800057ac:	03205c63          	blez	s2,800057e4 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800057b0:	03800513          	li	a0,56
    800057b4:	ffffd097          	auipc	ra,0xffffd
    800057b8:	0b4080e7          	jalr	180(ra) # 80002868 <_Znwm>
    800057bc:	00050a93          	mv	s5,a0
    800057c0:	00048593          	mv	a1,s1
    800057c4:	00001097          	auipc	ra,0x1
    800057c8:	804080e7          	jalr	-2044(ra) # 80005fc8 <_ZN9BufferCPPC1Ei>
    800057cc:	0300006f          	j	800057fc <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800057d0:	00005517          	auipc	a0,0x5
    800057d4:	b1850513          	addi	a0,a0,-1256 # 8000a2e8 <_ZZ9kPrintIntmE6digits+0x278>
    800057d8:	00000097          	auipc	ra,0x0
    800057dc:	520080e7          	jalr	1312(ra) # 80005cf8 <_Z11printStringPKc>
        return;
    800057e0:	0140006f          	j	800057f4 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800057e4:	00005517          	auipc	a0,0x5
    800057e8:	b4450513          	addi	a0,a0,-1212 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    800057ec:	00000097          	auipc	ra,0x0
    800057f0:	50c080e7          	jalr	1292(ra) # 80005cf8 <_Z11printStringPKc>
        return;
    800057f4:	000b8113          	mv	sp,s7
    800057f8:	2380006f          	j	80005a30 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800057fc:	01000513          	li	a0,16
    80005800:	ffffd097          	auipc	ra,0xffffd
    80005804:	068080e7          	jalr	104(ra) # 80002868 <_Znwm>
    80005808:	00050493          	mv	s1,a0
    8000580c:	00000593          	li	a1,0
    80005810:	ffffd097          	auipc	ra,0xffffd
    80005814:	3ac080e7          	jalr	940(ra) # 80002bbc <_ZN9SemaphoreC1Ej>
    80005818:	00007797          	auipc	a5,0x7
    8000581c:	6a97bc23          	sd	s1,1720(a5) # 8000ced0 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005820:	00391793          	slli	a5,s2,0x3
    80005824:	00f78793          	addi	a5,a5,15
    80005828:	ff07f793          	andi	a5,a5,-16
    8000582c:	40f10133          	sub	sp,sp,a5
    80005830:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005834:	0019071b          	addiw	a4,s2,1
    80005838:	00171793          	slli	a5,a4,0x1
    8000583c:	00e787b3          	add	a5,a5,a4
    80005840:	00379793          	slli	a5,a5,0x3
    80005844:	00f78793          	addi	a5,a5,15
    80005848:	ff07f793          	andi	a5,a5,-16
    8000584c:	40f10133          	sub	sp,sp,a5
    80005850:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005854:	00191c13          	slli	s8,s2,0x1
    80005858:	012c07b3          	add	a5,s8,s2
    8000585c:	00379793          	slli	a5,a5,0x3
    80005860:	00fa07b3          	add	a5,s4,a5
    80005864:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005868:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    8000586c:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005870:	02800513          	li	a0,40
    80005874:	ffffd097          	auipc	ra,0xffffd
    80005878:	ff4080e7          	jalr	-12(ra) # 80002868 <_Znwm>
    8000587c:	00050b13          	mv	s6,a0
    80005880:	012c0c33          	add	s8,s8,s2
    80005884:	003c1c13          	slli	s8,s8,0x3
    80005888:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    8000588c:	ffffd097          	auipc	ra,0xffffd
    80005890:	2b4080e7          	jalr	692(ra) # 80002b40 <_ZN6ThreadC1Ev>
    80005894:	00007797          	auipc	a5,0x7
    80005898:	3f478793          	addi	a5,a5,1012 # 8000cc88 <_ZTV12ConsumerSync+0x10>
    8000589c:	00fb3023          	sd	a5,0(s6)
    800058a0:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    800058a4:	000b0513          	mv	a0,s6
    800058a8:	ffffd097          	auipc	ra,0xffffd
    800058ac:	178080e7          	jalr	376(ra) # 80002a20 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800058b0:	00000493          	li	s1,0
    800058b4:	0380006f          	j	800058ec <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800058b8:	00007797          	auipc	a5,0x7
    800058bc:	3a878793          	addi	a5,a5,936 # 8000cc60 <_ZTV12ProducerSync+0x10>
    800058c0:	00fcb023          	sd	a5,0(s9)
    800058c4:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    800058c8:	00349793          	slli	a5,s1,0x3
    800058cc:	00f987b3          	add	a5,s3,a5
    800058d0:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800058d4:	00349793          	slli	a5,s1,0x3
    800058d8:	00f987b3          	add	a5,s3,a5
    800058dc:	0007b503          	ld	a0,0(a5)
    800058e0:	ffffd097          	auipc	ra,0xffffd
    800058e4:	140080e7          	jalr	320(ra) # 80002a20 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800058e8:	0014849b          	addiw	s1,s1,1
    800058ec:	0b24d063          	bge	s1,s2,8000598c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800058f0:	00149793          	slli	a5,s1,0x1
    800058f4:	009787b3          	add	a5,a5,s1
    800058f8:	00379793          	slli	a5,a5,0x3
    800058fc:	00fa07b3          	add	a5,s4,a5
    80005900:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005904:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005908:	00007717          	auipc	a4,0x7
    8000590c:	5c873703          	ld	a4,1480(a4) # 8000ced0 <_ZL10waitForAll>
    80005910:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005914:	02905863          	blez	s1,80005944 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005918:	02800513          	li	a0,40
    8000591c:	ffffd097          	auipc	ra,0xffffd
    80005920:	f4c080e7          	jalr	-180(ra) # 80002868 <_Znwm>
    80005924:	00050c93          	mv	s9,a0
    80005928:	00149c13          	slli	s8,s1,0x1
    8000592c:	009c0c33          	add	s8,s8,s1
    80005930:	003c1c13          	slli	s8,s8,0x3
    80005934:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005938:	ffffd097          	auipc	ra,0xffffd
    8000593c:	208080e7          	jalr	520(ra) # 80002b40 <_ZN6ThreadC1Ev>
    80005940:	f79ff06f          	j	800058b8 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005944:	02800513          	li	a0,40
    80005948:	ffffd097          	auipc	ra,0xffffd
    8000594c:	f20080e7          	jalr	-224(ra) # 80002868 <_Znwm>
    80005950:	00050c93          	mv	s9,a0
    80005954:	00149c13          	slli	s8,s1,0x1
    80005958:	009c0c33          	add	s8,s8,s1
    8000595c:	003c1c13          	slli	s8,s8,0x3
    80005960:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005964:	ffffd097          	auipc	ra,0xffffd
    80005968:	1dc080e7          	jalr	476(ra) # 80002b40 <_ZN6ThreadC1Ev>
    8000596c:	00007797          	auipc	a5,0x7
    80005970:	2cc78793          	addi	a5,a5,716 # 8000cc38 <_ZTV16ProducerKeyboard+0x10>
    80005974:	00fcb023          	sd	a5,0(s9)
    80005978:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    8000597c:	00349793          	slli	a5,s1,0x3
    80005980:	00f987b3          	add	a5,s3,a5
    80005984:	0197b023          	sd	s9,0(a5)
    80005988:	f4dff06f          	j	800058d4 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    8000598c:	ffffd097          	auipc	ra,0xffffd
    80005990:	0f8080e7          	jalr	248(ra) # 80002a84 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005994:	00000493          	li	s1,0
    80005998:	00994e63          	blt	s2,s1,800059b4 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    8000599c:	00007517          	auipc	a0,0x7
    800059a0:	53453503          	ld	a0,1332(a0) # 8000ced0 <_ZL10waitForAll>
    800059a4:	ffffd097          	auipc	ra,0xffffd
    800059a8:	250080e7          	jalr	592(ra) # 80002bf4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800059ac:	0014849b          	addiw	s1,s1,1
    800059b0:	fe9ff06f          	j	80005998 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    800059b4:	00000493          	li	s1,0
    800059b8:	0080006f          	j	800059c0 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    800059bc:	0014849b          	addiw	s1,s1,1
    800059c0:	0324d263          	bge	s1,s2,800059e4 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    800059c4:	00349793          	slli	a5,s1,0x3
    800059c8:	00f987b3          	add	a5,s3,a5
    800059cc:	0007b503          	ld	a0,0(a5)
    800059d0:	fe0506e3          	beqz	a0,800059bc <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800059d4:	00053783          	ld	a5,0(a0)
    800059d8:	0087b783          	ld	a5,8(a5)
    800059dc:	000780e7          	jalr	a5
    800059e0:	fddff06f          	j	800059bc <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800059e4:	000b0a63          	beqz	s6,800059f8 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800059e8:	000b3783          	ld	a5,0(s6)
    800059ec:	0087b783          	ld	a5,8(a5)
    800059f0:	000b0513          	mv	a0,s6
    800059f4:	000780e7          	jalr	a5
    delete waitForAll;
    800059f8:	00007517          	auipc	a0,0x7
    800059fc:	4d853503          	ld	a0,1240(a0) # 8000ced0 <_ZL10waitForAll>
    80005a00:	00050863          	beqz	a0,80005a10 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005a04:	00053783          	ld	a5,0(a0)
    80005a08:	0087b783          	ld	a5,8(a5)
    80005a0c:	000780e7          	jalr	a5
    delete buffer;
    80005a10:	000a8e63          	beqz	s5,80005a2c <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005a14:	000a8513          	mv	a0,s5
    80005a18:	00001097          	auipc	ra,0x1
    80005a1c:	8a8080e7          	jalr	-1880(ra) # 800062c0 <_ZN9BufferCPPD1Ev>
    80005a20:	000a8513          	mv	a0,s5
    80005a24:	ffffd097          	auipc	ra,0xffffd
    80005a28:	e94080e7          	jalr	-364(ra) # 800028b8 <_ZdlPv>
    80005a2c:	000b8113          	mv	sp,s7

}
    80005a30:	f8040113          	addi	sp,s0,-128
    80005a34:	07813083          	ld	ra,120(sp)
    80005a38:	07013403          	ld	s0,112(sp)
    80005a3c:	06813483          	ld	s1,104(sp)
    80005a40:	06013903          	ld	s2,96(sp)
    80005a44:	05813983          	ld	s3,88(sp)
    80005a48:	05013a03          	ld	s4,80(sp)
    80005a4c:	04813a83          	ld	s5,72(sp)
    80005a50:	04013b03          	ld	s6,64(sp)
    80005a54:	03813b83          	ld	s7,56(sp)
    80005a58:	03013c03          	ld	s8,48(sp)
    80005a5c:	02813c83          	ld	s9,40(sp)
    80005a60:	08010113          	addi	sp,sp,128
    80005a64:	00008067          	ret
    80005a68:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005a6c:	000a8513          	mv	a0,s5
    80005a70:	ffffd097          	auipc	ra,0xffffd
    80005a74:	e48080e7          	jalr	-440(ra) # 800028b8 <_ZdlPv>
    80005a78:	00048513          	mv	a0,s1
    80005a7c:	00008097          	auipc	ra,0x8
    80005a80:	54c080e7          	jalr	1356(ra) # 8000dfc8 <_Unwind_Resume>
    80005a84:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005a88:	00048513          	mv	a0,s1
    80005a8c:	ffffd097          	auipc	ra,0xffffd
    80005a90:	e2c080e7          	jalr	-468(ra) # 800028b8 <_ZdlPv>
    80005a94:	00090513          	mv	a0,s2
    80005a98:	00008097          	auipc	ra,0x8
    80005a9c:	530080e7          	jalr	1328(ra) # 8000dfc8 <_Unwind_Resume>
    80005aa0:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005aa4:	000b0513          	mv	a0,s6
    80005aa8:	ffffd097          	auipc	ra,0xffffd
    80005aac:	e10080e7          	jalr	-496(ra) # 800028b8 <_ZdlPv>
    80005ab0:	00048513          	mv	a0,s1
    80005ab4:	00008097          	auipc	ra,0x8
    80005ab8:	514080e7          	jalr	1300(ra) # 8000dfc8 <_Unwind_Resume>
    80005abc:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005ac0:	000c8513          	mv	a0,s9
    80005ac4:	ffffd097          	auipc	ra,0xffffd
    80005ac8:	df4080e7          	jalr	-524(ra) # 800028b8 <_ZdlPv>
    80005acc:	00048513          	mv	a0,s1
    80005ad0:	00008097          	auipc	ra,0x8
    80005ad4:	4f8080e7          	jalr	1272(ra) # 8000dfc8 <_Unwind_Resume>
    80005ad8:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005adc:	000c8513          	mv	a0,s9
    80005ae0:	ffffd097          	auipc	ra,0xffffd
    80005ae4:	dd8080e7          	jalr	-552(ra) # 800028b8 <_ZdlPv>
    80005ae8:	00048513          	mv	a0,s1
    80005aec:	00008097          	auipc	ra,0x8
    80005af0:	4dc080e7          	jalr	1244(ra) # 8000dfc8 <_Unwind_Resume>

0000000080005af4 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005af4:	ff010113          	addi	sp,sp,-16
    80005af8:	00113423          	sd	ra,8(sp)
    80005afc:	00813023          	sd	s0,0(sp)
    80005b00:	01010413          	addi	s0,sp,16
    80005b04:	00007797          	auipc	a5,0x7
    80005b08:	18478793          	addi	a5,a5,388 # 8000cc88 <_ZTV12ConsumerSync+0x10>
    80005b0c:	00f53023          	sd	a5,0(a0)
    80005b10:	ffffd097          	auipc	ra,0xffffd
    80005b14:	c68080e7          	jalr	-920(ra) # 80002778 <_ZN6ThreadD1Ev>
    80005b18:	00813083          	ld	ra,8(sp)
    80005b1c:	00013403          	ld	s0,0(sp)
    80005b20:	01010113          	addi	sp,sp,16
    80005b24:	00008067          	ret

0000000080005b28 <_ZN12ConsumerSyncD0Ev>:
    80005b28:	fe010113          	addi	sp,sp,-32
    80005b2c:	00113c23          	sd	ra,24(sp)
    80005b30:	00813823          	sd	s0,16(sp)
    80005b34:	00913423          	sd	s1,8(sp)
    80005b38:	02010413          	addi	s0,sp,32
    80005b3c:	00050493          	mv	s1,a0
    80005b40:	00007797          	auipc	a5,0x7
    80005b44:	14878793          	addi	a5,a5,328 # 8000cc88 <_ZTV12ConsumerSync+0x10>
    80005b48:	00f53023          	sd	a5,0(a0)
    80005b4c:	ffffd097          	auipc	ra,0xffffd
    80005b50:	c2c080e7          	jalr	-980(ra) # 80002778 <_ZN6ThreadD1Ev>
    80005b54:	00048513          	mv	a0,s1
    80005b58:	ffffd097          	auipc	ra,0xffffd
    80005b5c:	d60080e7          	jalr	-672(ra) # 800028b8 <_ZdlPv>
    80005b60:	01813083          	ld	ra,24(sp)
    80005b64:	01013403          	ld	s0,16(sp)
    80005b68:	00813483          	ld	s1,8(sp)
    80005b6c:	02010113          	addi	sp,sp,32
    80005b70:	00008067          	ret

0000000080005b74 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005b74:	ff010113          	addi	sp,sp,-16
    80005b78:	00113423          	sd	ra,8(sp)
    80005b7c:	00813023          	sd	s0,0(sp)
    80005b80:	01010413          	addi	s0,sp,16
    80005b84:	00007797          	auipc	a5,0x7
    80005b88:	0dc78793          	addi	a5,a5,220 # 8000cc60 <_ZTV12ProducerSync+0x10>
    80005b8c:	00f53023          	sd	a5,0(a0)
    80005b90:	ffffd097          	auipc	ra,0xffffd
    80005b94:	be8080e7          	jalr	-1048(ra) # 80002778 <_ZN6ThreadD1Ev>
    80005b98:	00813083          	ld	ra,8(sp)
    80005b9c:	00013403          	ld	s0,0(sp)
    80005ba0:	01010113          	addi	sp,sp,16
    80005ba4:	00008067          	ret

0000000080005ba8 <_ZN12ProducerSyncD0Ev>:
    80005ba8:	fe010113          	addi	sp,sp,-32
    80005bac:	00113c23          	sd	ra,24(sp)
    80005bb0:	00813823          	sd	s0,16(sp)
    80005bb4:	00913423          	sd	s1,8(sp)
    80005bb8:	02010413          	addi	s0,sp,32
    80005bbc:	00050493          	mv	s1,a0
    80005bc0:	00007797          	auipc	a5,0x7
    80005bc4:	0a078793          	addi	a5,a5,160 # 8000cc60 <_ZTV12ProducerSync+0x10>
    80005bc8:	00f53023          	sd	a5,0(a0)
    80005bcc:	ffffd097          	auipc	ra,0xffffd
    80005bd0:	bac080e7          	jalr	-1108(ra) # 80002778 <_ZN6ThreadD1Ev>
    80005bd4:	00048513          	mv	a0,s1
    80005bd8:	ffffd097          	auipc	ra,0xffffd
    80005bdc:	ce0080e7          	jalr	-800(ra) # 800028b8 <_ZdlPv>
    80005be0:	01813083          	ld	ra,24(sp)
    80005be4:	01013403          	ld	s0,16(sp)
    80005be8:	00813483          	ld	s1,8(sp)
    80005bec:	02010113          	addi	sp,sp,32
    80005bf0:	00008067          	ret

0000000080005bf4 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005bf4:	ff010113          	addi	sp,sp,-16
    80005bf8:	00113423          	sd	ra,8(sp)
    80005bfc:	00813023          	sd	s0,0(sp)
    80005c00:	01010413          	addi	s0,sp,16
    80005c04:	00007797          	auipc	a5,0x7
    80005c08:	03478793          	addi	a5,a5,52 # 8000cc38 <_ZTV16ProducerKeyboard+0x10>
    80005c0c:	00f53023          	sd	a5,0(a0)
    80005c10:	ffffd097          	auipc	ra,0xffffd
    80005c14:	b68080e7          	jalr	-1176(ra) # 80002778 <_ZN6ThreadD1Ev>
    80005c18:	00813083          	ld	ra,8(sp)
    80005c1c:	00013403          	ld	s0,0(sp)
    80005c20:	01010113          	addi	sp,sp,16
    80005c24:	00008067          	ret

0000000080005c28 <_ZN16ProducerKeyboardD0Ev>:
    80005c28:	fe010113          	addi	sp,sp,-32
    80005c2c:	00113c23          	sd	ra,24(sp)
    80005c30:	00813823          	sd	s0,16(sp)
    80005c34:	00913423          	sd	s1,8(sp)
    80005c38:	02010413          	addi	s0,sp,32
    80005c3c:	00050493          	mv	s1,a0
    80005c40:	00007797          	auipc	a5,0x7
    80005c44:	ff878793          	addi	a5,a5,-8 # 8000cc38 <_ZTV16ProducerKeyboard+0x10>
    80005c48:	00f53023          	sd	a5,0(a0)
    80005c4c:	ffffd097          	auipc	ra,0xffffd
    80005c50:	b2c080e7          	jalr	-1236(ra) # 80002778 <_ZN6ThreadD1Ev>
    80005c54:	00048513          	mv	a0,s1
    80005c58:	ffffd097          	auipc	ra,0xffffd
    80005c5c:	c60080e7          	jalr	-928(ra) # 800028b8 <_ZdlPv>
    80005c60:	01813083          	ld	ra,24(sp)
    80005c64:	01013403          	ld	s0,16(sp)
    80005c68:	00813483          	ld	s1,8(sp)
    80005c6c:	02010113          	addi	sp,sp,32
    80005c70:	00008067          	ret

0000000080005c74 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005c74:	ff010113          	addi	sp,sp,-16
    80005c78:	00113423          	sd	ra,8(sp)
    80005c7c:	00813023          	sd	s0,0(sp)
    80005c80:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005c84:	02053583          	ld	a1,32(a0)
    80005c88:	fffff097          	auipc	ra,0xfffff
    80005c8c:	7e4080e7          	jalr	2020(ra) # 8000546c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005c90:	00813083          	ld	ra,8(sp)
    80005c94:	00013403          	ld	s0,0(sp)
    80005c98:	01010113          	addi	sp,sp,16
    80005c9c:	00008067          	ret

0000000080005ca0 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005ca0:	ff010113          	addi	sp,sp,-16
    80005ca4:	00113423          	sd	ra,8(sp)
    80005ca8:	00813023          	sd	s0,0(sp)
    80005cac:	01010413          	addi	s0,sp,16
        producer(td);
    80005cb0:	02053583          	ld	a1,32(a0)
    80005cb4:	00000097          	auipc	ra,0x0
    80005cb8:	878080e7          	jalr	-1928(ra) # 8000552c <_ZN12ProducerSync8producerEPv>
    }
    80005cbc:	00813083          	ld	ra,8(sp)
    80005cc0:	00013403          	ld	s0,0(sp)
    80005cc4:	01010113          	addi	sp,sp,16
    80005cc8:	00008067          	ret

0000000080005ccc <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005ccc:	ff010113          	addi	sp,sp,-16
    80005cd0:	00113423          	sd	ra,8(sp)
    80005cd4:	00813023          	sd	s0,0(sp)
    80005cd8:	01010413          	addi	s0,sp,16
        consumer(td);
    80005cdc:	02053583          	ld	a1,32(a0)
    80005ce0:	00000097          	auipc	ra,0x0
    80005ce4:	8e0080e7          	jalr	-1824(ra) # 800055c0 <_ZN12ConsumerSync8consumerEPv>
    }
    80005ce8:	00813083          	ld	ra,8(sp)
    80005cec:	00013403          	ld	s0,0(sp)
    80005cf0:	01010113          	addi	sp,sp,16
    80005cf4:	00008067          	ret

0000000080005cf8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005cf8:	fe010113          	addi	sp,sp,-32
    80005cfc:	00113c23          	sd	ra,24(sp)
    80005d00:	00813823          	sd	s0,16(sp)
    80005d04:	00913423          	sd	s1,8(sp)
    80005d08:	02010413          	addi	s0,sp,32
    80005d0c:	00050493          	mv	s1,a0
    LOCK();
    80005d10:	00100613          	li	a2,1
    80005d14:	00000593          	li	a1,0
    80005d18:	00007517          	auipc	a0,0x7
    80005d1c:	1c050513          	addi	a0,a0,448 # 8000ced8 <lockPrint>
    80005d20:	ffffb097          	auipc	ra,0xffffb
    80005d24:	404080e7          	jalr	1028(ra) # 80001124 <copy_and_swap>
    80005d28:	00050863          	beqz	a0,80005d38 <_Z11printStringPKc+0x40>
    80005d2c:	ffffb097          	auipc	ra,0xffffb
    80005d30:	708080e7          	jalr	1800(ra) # 80001434 <_Z15thread_dispatchv>
    80005d34:	fddff06f          	j	80005d10 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005d38:	0004c503          	lbu	a0,0(s1)
    80005d3c:	00050a63          	beqz	a0,80005d50 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005d40:	ffffc097          	auipc	ra,0xffffc
    80005d44:	85c080e7          	jalr	-1956(ra) # 8000159c <_Z4putcc>
        string++;
    80005d48:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005d4c:	fedff06f          	j	80005d38 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005d50:	00000613          	li	a2,0
    80005d54:	00100593          	li	a1,1
    80005d58:	00007517          	auipc	a0,0x7
    80005d5c:	18050513          	addi	a0,a0,384 # 8000ced8 <lockPrint>
    80005d60:	ffffb097          	auipc	ra,0xffffb
    80005d64:	3c4080e7          	jalr	964(ra) # 80001124 <copy_and_swap>
    80005d68:	fe0514e3          	bnez	a0,80005d50 <_Z11printStringPKc+0x58>
}
    80005d6c:	01813083          	ld	ra,24(sp)
    80005d70:	01013403          	ld	s0,16(sp)
    80005d74:	00813483          	ld	s1,8(sp)
    80005d78:	02010113          	addi	sp,sp,32
    80005d7c:	00008067          	ret

0000000080005d80 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005d80:	fd010113          	addi	sp,sp,-48
    80005d84:	02113423          	sd	ra,40(sp)
    80005d88:	02813023          	sd	s0,32(sp)
    80005d8c:	00913c23          	sd	s1,24(sp)
    80005d90:	01213823          	sd	s2,16(sp)
    80005d94:	01313423          	sd	s3,8(sp)
    80005d98:	01413023          	sd	s4,0(sp)
    80005d9c:	03010413          	addi	s0,sp,48
    80005da0:	00050993          	mv	s3,a0
    80005da4:	00058a13          	mv	s4,a1
    LOCK();
    80005da8:	00100613          	li	a2,1
    80005dac:	00000593          	li	a1,0
    80005db0:	00007517          	auipc	a0,0x7
    80005db4:	12850513          	addi	a0,a0,296 # 8000ced8 <lockPrint>
    80005db8:	ffffb097          	auipc	ra,0xffffb
    80005dbc:	36c080e7          	jalr	876(ra) # 80001124 <copy_and_swap>
    80005dc0:	00050863          	beqz	a0,80005dd0 <_Z9getStringPci+0x50>
    80005dc4:	ffffb097          	auipc	ra,0xffffb
    80005dc8:	670080e7          	jalr	1648(ra) # 80001434 <_Z15thread_dispatchv>
    80005dcc:	fddff06f          	j	80005da8 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005dd0:	00000913          	li	s2,0
    80005dd4:	00090493          	mv	s1,s2
    80005dd8:	0019091b          	addiw	s2,s2,1
    80005ddc:	03495a63          	bge	s2,s4,80005e10 <_Z9getStringPci+0x90>
        cc = getc();
    80005de0:	ffffb097          	auipc	ra,0xffffb
    80005de4:	794080e7          	jalr	1940(ra) # 80001574 <_Z4getcv>
        if(cc < 1)
    80005de8:	02050463          	beqz	a0,80005e10 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005dec:	009984b3          	add	s1,s3,s1
    80005df0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005df4:	00a00793          	li	a5,10
    80005df8:	00f50a63          	beq	a0,a5,80005e0c <_Z9getStringPci+0x8c>
    80005dfc:	00d00793          	li	a5,13
    80005e00:	fcf51ae3          	bne	a0,a5,80005dd4 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005e04:	00090493          	mv	s1,s2
    80005e08:	0080006f          	j	80005e10 <_Z9getStringPci+0x90>
    80005e0c:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005e10:	009984b3          	add	s1,s3,s1
    80005e14:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005e18:	00000613          	li	a2,0
    80005e1c:	00100593          	li	a1,1
    80005e20:	00007517          	auipc	a0,0x7
    80005e24:	0b850513          	addi	a0,a0,184 # 8000ced8 <lockPrint>
    80005e28:	ffffb097          	auipc	ra,0xffffb
    80005e2c:	2fc080e7          	jalr	764(ra) # 80001124 <copy_and_swap>
    80005e30:	fe0514e3          	bnez	a0,80005e18 <_Z9getStringPci+0x98>
    return buf;
}
    80005e34:	00098513          	mv	a0,s3
    80005e38:	02813083          	ld	ra,40(sp)
    80005e3c:	02013403          	ld	s0,32(sp)
    80005e40:	01813483          	ld	s1,24(sp)
    80005e44:	01013903          	ld	s2,16(sp)
    80005e48:	00813983          	ld	s3,8(sp)
    80005e4c:	00013a03          	ld	s4,0(sp)
    80005e50:	03010113          	addi	sp,sp,48
    80005e54:	00008067          	ret

0000000080005e58 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005e58:	ff010113          	addi	sp,sp,-16
    80005e5c:	00813423          	sd	s0,8(sp)
    80005e60:	01010413          	addi	s0,sp,16
    80005e64:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005e68:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005e6c:	0006c603          	lbu	a2,0(a3)
    80005e70:	fd06071b          	addiw	a4,a2,-48
    80005e74:	0ff77713          	andi	a4,a4,255
    80005e78:	00900793          	li	a5,9
    80005e7c:	02e7e063          	bltu	a5,a4,80005e9c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005e80:	0025179b          	slliw	a5,a0,0x2
    80005e84:	00a787bb          	addw	a5,a5,a0
    80005e88:	0017979b          	slliw	a5,a5,0x1
    80005e8c:	00168693          	addi	a3,a3,1
    80005e90:	00c787bb          	addw	a5,a5,a2
    80005e94:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005e98:	fd5ff06f          	j	80005e6c <_Z11stringToIntPKc+0x14>
    return n;
}
    80005e9c:	00813403          	ld	s0,8(sp)
    80005ea0:	01010113          	addi	sp,sp,16
    80005ea4:	00008067          	ret

0000000080005ea8 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005ea8:	fc010113          	addi	sp,sp,-64
    80005eac:	02113c23          	sd	ra,56(sp)
    80005eb0:	02813823          	sd	s0,48(sp)
    80005eb4:	02913423          	sd	s1,40(sp)
    80005eb8:	03213023          	sd	s2,32(sp)
    80005ebc:	01313c23          	sd	s3,24(sp)
    80005ec0:	04010413          	addi	s0,sp,64
    80005ec4:	00050493          	mv	s1,a0
    80005ec8:	00058913          	mv	s2,a1
    80005ecc:	00060993          	mv	s3,a2
    LOCK();
    80005ed0:	00100613          	li	a2,1
    80005ed4:	00000593          	li	a1,0
    80005ed8:	00007517          	auipc	a0,0x7
    80005edc:	00050513          	mv	a0,a0
    80005ee0:	ffffb097          	auipc	ra,0xffffb
    80005ee4:	244080e7          	jalr	580(ra) # 80001124 <copy_and_swap>
    80005ee8:	00050863          	beqz	a0,80005ef8 <_Z8printIntiii+0x50>
    80005eec:	ffffb097          	auipc	ra,0xffffb
    80005ef0:	548080e7          	jalr	1352(ra) # 80001434 <_Z15thread_dispatchv>
    80005ef4:	fddff06f          	j	80005ed0 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005ef8:	00098463          	beqz	s3,80005f00 <_Z8printIntiii+0x58>
    80005efc:	0804c463          	bltz	s1,80005f84 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005f00:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005f04:	00000593          	li	a1,0
    }

    i = 0;
    80005f08:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005f0c:	0009079b          	sext.w	a5,s2
    80005f10:	0325773b          	remuw	a4,a0,s2
    80005f14:	00048613          	mv	a2,s1
    80005f18:	0014849b          	addiw	s1,s1,1
    80005f1c:	02071693          	slli	a3,a4,0x20
    80005f20:	0206d693          	srli	a3,a3,0x20
    80005f24:	00007717          	auipc	a4,0x7
    80005f28:	d7c70713          	addi	a4,a4,-644 # 8000cca0 <digits>
    80005f2c:	00d70733          	add	a4,a4,a3
    80005f30:	00074683          	lbu	a3,0(a4)
    80005f34:	fd040713          	addi	a4,s0,-48
    80005f38:	00c70733          	add	a4,a4,a2
    80005f3c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005f40:	0005071b          	sext.w	a4,a0
    80005f44:	0325553b          	divuw	a0,a0,s2
    80005f48:	fcf772e3          	bgeu	a4,a5,80005f0c <_Z8printIntiii+0x64>
    if(neg)
    80005f4c:	00058c63          	beqz	a1,80005f64 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005f50:	fd040793          	addi	a5,s0,-48
    80005f54:	009784b3          	add	s1,a5,s1
    80005f58:	02d00793          	li	a5,45
    80005f5c:	fef48823          	sb	a5,-16(s1)
    80005f60:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005f64:	fff4849b          	addiw	s1,s1,-1
    80005f68:	0204c463          	bltz	s1,80005f90 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005f6c:	fd040793          	addi	a5,s0,-48
    80005f70:	009787b3          	add	a5,a5,s1
    80005f74:	ff07c503          	lbu	a0,-16(a5)
    80005f78:	ffffb097          	auipc	ra,0xffffb
    80005f7c:	624080e7          	jalr	1572(ra) # 8000159c <_Z4putcc>
    80005f80:	fe5ff06f          	j	80005f64 <_Z8printIntiii+0xbc>
        x = -xx;
    80005f84:	4090053b          	negw	a0,s1
        neg = 1;
    80005f88:	00100593          	li	a1,1
        x = -xx;
    80005f8c:	f7dff06f          	j	80005f08 <_Z8printIntiii+0x60>

    UNLOCK();
    80005f90:	00000613          	li	a2,0
    80005f94:	00100593          	li	a1,1
    80005f98:	00007517          	auipc	a0,0x7
    80005f9c:	f4050513          	addi	a0,a0,-192 # 8000ced8 <lockPrint>
    80005fa0:	ffffb097          	auipc	ra,0xffffb
    80005fa4:	184080e7          	jalr	388(ra) # 80001124 <copy_and_swap>
    80005fa8:	fe0514e3          	bnez	a0,80005f90 <_Z8printIntiii+0xe8>
    80005fac:	03813083          	ld	ra,56(sp)
    80005fb0:	03013403          	ld	s0,48(sp)
    80005fb4:	02813483          	ld	s1,40(sp)
    80005fb8:	02013903          	ld	s2,32(sp)
    80005fbc:	01813983          	ld	s3,24(sp)
    80005fc0:	04010113          	addi	sp,sp,64
    80005fc4:	00008067          	ret

0000000080005fc8 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005fc8:	fd010113          	addi	sp,sp,-48
    80005fcc:	02113423          	sd	ra,40(sp)
    80005fd0:	02813023          	sd	s0,32(sp)
    80005fd4:	00913c23          	sd	s1,24(sp)
    80005fd8:	01213823          	sd	s2,16(sp)
    80005fdc:	01313423          	sd	s3,8(sp)
    80005fe0:	03010413          	addi	s0,sp,48
    80005fe4:	00050493          	mv	s1,a0
    80005fe8:	00058913          	mv	s2,a1
    80005fec:	0015879b          	addiw	a5,a1,1
    80005ff0:	0007851b          	sext.w	a0,a5
    80005ff4:	00f4a023          	sw	a5,0(s1)
    80005ff8:	0004a823          	sw	zero,16(s1)
    80005ffc:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006000:	00251513          	slli	a0,a0,0x2
    80006004:	ffffb097          	auipc	ra,0xffffb
    80006008:	304080e7          	jalr	772(ra) # 80001308 <_Z9mem_allocm>
    8000600c:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006010:	01000513          	li	a0,16
    80006014:	ffffd097          	auipc	ra,0xffffd
    80006018:	854080e7          	jalr	-1964(ra) # 80002868 <_Znwm>
    8000601c:	00050993          	mv	s3,a0
    80006020:	00000593          	li	a1,0
    80006024:	ffffd097          	auipc	ra,0xffffd
    80006028:	b98080e7          	jalr	-1128(ra) # 80002bbc <_ZN9SemaphoreC1Ej>
    8000602c:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80006030:	01000513          	li	a0,16
    80006034:	ffffd097          	auipc	ra,0xffffd
    80006038:	834080e7          	jalr	-1996(ra) # 80002868 <_Znwm>
    8000603c:	00050993          	mv	s3,a0
    80006040:	00090593          	mv	a1,s2
    80006044:	ffffd097          	auipc	ra,0xffffd
    80006048:	b78080e7          	jalr	-1160(ra) # 80002bbc <_ZN9SemaphoreC1Ej>
    8000604c:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80006050:	01000513          	li	a0,16
    80006054:	ffffd097          	auipc	ra,0xffffd
    80006058:	814080e7          	jalr	-2028(ra) # 80002868 <_Znwm>
    8000605c:	00050913          	mv	s2,a0
    80006060:	00100593          	li	a1,1
    80006064:	ffffd097          	auipc	ra,0xffffd
    80006068:	b58080e7          	jalr	-1192(ra) # 80002bbc <_ZN9SemaphoreC1Ej>
    8000606c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006070:	01000513          	li	a0,16
    80006074:	ffffc097          	auipc	ra,0xffffc
    80006078:	7f4080e7          	jalr	2036(ra) # 80002868 <_Znwm>
    8000607c:	00050913          	mv	s2,a0
    80006080:	00100593          	li	a1,1
    80006084:	ffffd097          	auipc	ra,0xffffd
    80006088:	b38080e7          	jalr	-1224(ra) # 80002bbc <_ZN9SemaphoreC1Ej>
    8000608c:	0324b823          	sd	s2,48(s1)
}
    80006090:	02813083          	ld	ra,40(sp)
    80006094:	02013403          	ld	s0,32(sp)
    80006098:	01813483          	ld	s1,24(sp)
    8000609c:	01013903          	ld	s2,16(sp)
    800060a0:	00813983          	ld	s3,8(sp)
    800060a4:	03010113          	addi	sp,sp,48
    800060a8:	00008067          	ret
    800060ac:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    800060b0:	00098513          	mv	a0,s3
    800060b4:	ffffd097          	auipc	ra,0xffffd
    800060b8:	804080e7          	jalr	-2044(ra) # 800028b8 <_ZdlPv>
    800060bc:	00048513          	mv	a0,s1
    800060c0:	00008097          	auipc	ra,0x8
    800060c4:	f08080e7          	jalr	-248(ra) # 8000dfc8 <_Unwind_Resume>
    800060c8:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800060cc:	00098513          	mv	a0,s3
    800060d0:	ffffc097          	auipc	ra,0xffffc
    800060d4:	7e8080e7          	jalr	2024(ra) # 800028b8 <_ZdlPv>
    800060d8:	00048513          	mv	a0,s1
    800060dc:	00008097          	auipc	ra,0x8
    800060e0:	eec080e7          	jalr	-276(ra) # 8000dfc8 <_Unwind_Resume>
    800060e4:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800060e8:	00090513          	mv	a0,s2
    800060ec:	ffffc097          	auipc	ra,0xffffc
    800060f0:	7cc080e7          	jalr	1996(ra) # 800028b8 <_ZdlPv>
    800060f4:	00048513          	mv	a0,s1
    800060f8:	00008097          	auipc	ra,0x8
    800060fc:	ed0080e7          	jalr	-304(ra) # 8000dfc8 <_Unwind_Resume>
    80006100:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006104:	00090513          	mv	a0,s2
    80006108:	ffffc097          	auipc	ra,0xffffc
    8000610c:	7b0080e7          	jalr	1968(ra) # 800028b8 <_ZdlPv>
    80006110:	00048513          	mv	a0,s1
    80006114:	00008097          	auipc	ra,0x8
    80006118:	eb4080e7          	jalr	-332(ra) # 8000dfc8 <_Unwind_Resume>

000000008000611c <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    8000611c:	fe010113          	addi	sp,sp,-32
    80006120:	00113c23          	sd	ra,24(sp)
    80006124:	00813823          	sd	s0,16(sp)
    80006128:	00913423          	sd	s1,8(sp)
    8000612c:	01213023          	sd	s2,0(sp)
    80006130:	02010413          	addi	s0,sp,32
    80006134:	00050493          	mv	s1,a0
    80006138:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    8000613c:	01853503          	ld	a0,24(a0)
    80006140:	ffffd097          	auipc	ra,0xffffd
    80006144:	ab4080e7          	jalr	-1356(ra) # 80002bf4 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80006148:	0304b503          	ld	a0,48(s1)
    8000614c:	ffffd097          	auipc	ra,0xffffd
    80006150:	aa8080e7          	jalr	-1368(ra) # 80002bf4 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80006154:	0084b783          	ld	a5,8(s1)
    80006158:	0144a703          	lw	a4,20(s1)
    8000615c:	00271713          	slli	a4,a4,0x2
    80006160:	00e787b3          	add	a5,a5,a4
    80006164:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006168:	0144a783          	lw	a5,20(s1)
    8000616c:	0017879b          	addiw	a5,a5,1
    80006170:	0004a703          	lw	a4,0(s1)
    80006174:	02e7e7bb          	remw	a5,a5,a4
    80006178:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    8000617c:	0304b503          	ld	a0,48(s1)
    80006180:	ffffd097          	auipc	ra,0xffffd
    80006184:	aa0080e7          	jalr	-1376(ra) # 80002c20 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006188:	0204b503          	ld	a0,32(s1)
    8000618c:	ffffd097          	auipc	ra,0xffffd
    80006190:	a94080e7          	jalr	-1388(ra) # 80002c20 <_ZN9Semaphore6signalEv>

}
    80006194:	01813083          	ld	ra,24(sp)
    80006198:	01013403          	ld	s0,16(sp)
    8000619c:	00813483          	ld	s1,8(sp)
    800061a0:	00013903          	ld	s2,0(sp)
    800061a4:	02010113          	addi	sp,sp,32
    800061a8:	00008067          	ret

00000000800061ac <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    800061ac:	fe010113          	addi	sp,sp,-32
    800061b0:	00113c23          	sd	ra,24(sp)
    800061b4:	00813823          	sd	s0,16(sp)
    800061b8:	00913423          	sd	s1,8(sp)
    800061bc:	01213023          	sd	s2,0(sp)
    800061c0:	02010413          	addi	s0,sp,32
    800061c4:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800061c8:	02053503          	ld	a0,32(a0)
    800061cc:	ffffd097          	auipc	ra,0xffffd
    800061d0:	a28080e7          	jalr	-1496(ra) # 80002bf4 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    800061d4:	0284b503          	ld	a0,40(s1)
    800061d8:	ffffd097          	auipc	ra,0xffffd
    800061dc:	a1c080e7          	jalr	-1508(ra) # 80002bf4 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    800061e0:	0084b703          	ld	a4,8(s1)
    800061e4:	0104a783          	lw	a5,16(s1)
    800061e8:	00279693          	slli	a3,a5,0x2
    800061ec:	00d70733          	add	a4,a4,a3
    800061f0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800061f4:	0017879b          	addiw	a5,a5,1
    800061f8:	0004a703          	lw	a4,0(s1)
    800061fc:	02e7e7bb          	remw	a5,a5,a4
    80006200:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006204:	0284b503          	ld	a0,40(s1)
    80006208:	ffffd097          	auipc	ra,0xffffd
    8000620c:	a18080e7          	jalr	-1512(ra) # 80002c20 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006210:	0184b503          	ld	a0,24(s1)
    80006214:	ffffd097          	auipc	ra,0xffffd
    80006218:	a0c080e7          	jalr	-1524(ra) # 80002c20 <_ZN9Semaphore6signalEv>

    return ret;
}
    8000621c:	00090513          	mv	a0,s2
    80006220:	01813083          	ld	ra,24(sp)
    80006224:	01013403          	ld	s0,16(sp)
    80006228:	00813483          	ld	s1,8(sp)
    8000622c:	00013903          	ld	s2,0(sp)
    80006230:	02010113          	addi	sp,sp,32
    80006234:	00008067          	ret

0000000080006238 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006238:	fe010113          	addi	sp,sp,-32
    8000623c:	00113c23          	sd	ra,24(sp)
    80006240:	00813823          	sd	s0,16(sp)
    80006244:	00913423          	sd	s1,8(sp)
    80006248:	01213023          	sd	s2,0(sp)
    8000624c:	02010413          	addi	s0,sp,32
    80006250:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006254:	02853503          	ld	a0,40(a0)
    80006258:	ffffd097          	auipc	ra,0xffffd
    8000625c:	99c080e7          	jalr	-1636(ra) # 80002bf4 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006260:	0304b503          	ld	a0,48(s1)
    80006264:	ffffd097          	auipc	ra,0xffffd
    80006268:	990080e7          	jalr	-1648(ra) # 80002bf4 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    8000626c:	0144a783          	lw	a5,20(s1)
    80006270:	0104a903          	lw	s2,16(s1)
    80006274:	0327ce63          	blt	a5,s2,800062b0 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006278:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    8000627c:	0304b503          	ld	a0,48(s1)
    80006280:	ffffd097          	auipc	ra,0xffffd
    80006284:	9a0080e7          	jalr	-1632(ra) # 80002c20 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006288:	0284b503          	ld	a0,40(s1)
    8000628c:	ffffd097          	auipc	ra,0xffffd
    80006290:	994080e7          	jalr	-1644(ra) # 80002c20 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006294:	00090513          	mv	a0,s2
    80006298:	01813083          	ld	ra,24(sp)
    8000629c:	01013403          	ld	s0,16(sp)
    800062a0:	00813483          	ld	s1,8(sp)
    800062a4:	00013903          	ld	s2,0(sp)
    800062a8:	02010113          	addi	sp,sp,32
    800062ac:	00008067          	ret
        ret = cap - head + tail;
    800062b0:	0004a703          	lw	a4,0(s1)
    800062b4:	4127093b          	subw	s2,a4,s2
    800062b8:	00f9093b          	addw	s2,s2,a5
    800062bc:	fc1ff06f          	j	8000627c <_ZN9BufferCPP6getCntEv+0x44>

00000000800062c0 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800062c0:	fe010113          	addi	sp,sp,-32
    800062c4:	00113c23          	sd	ra,24(sp)
    800062c8:	00813823          	sd	s0,16(sp)
    800062cc:	00913423          	sd	s1,8(sp)
    800062d0:	02010413          	addi	s0,sp,32
    800062d4:	00050493          	mv	s1,a0
    Console::putc('\n');
    800062d8:	00a00513          	li	a0,10
    800062dc:	ffffd097          	auipc	ra,0xffffd
    800062e0:	a08080e7          	jalr	-1528(ra) # 80002ce4 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800062e4:	00004517          	auipc	a0,0x4
    800062e8:	17c50513          	addi	a0,a0,380 # 8000a460 <_ZZ9kPrintIntmE6digits+0x3f0>
    800062ec:	00000097          	auipc	ra,0x0
    800062f0:	a0c080e7          	jalr	-1524(ra) # 80005cf8 <_Z11printStringPKc>
    while (getCnt()) {
    800062f4:	00048513          	mv	a0,s1
    800062f8:	00000097          	auipc	ra,0x0
    800062fc:	f40080e7          	jalr	-192(ra) # 80006238 <_ZN9BufferCPP6getCntEv>
    80006300:	02050c63          	beqz	a0,80006338 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006304:	0084b783          	ld	a5,8(s1)
    80006308:	0104a703          	lw	a4,16(s1)
    8000630c:	00271713          	slli	a4,a4,0x2
    80006310:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006314:	0007c503          	lbu	a0,0(a5)
    80006318:	ffffd097          	auipc	ra,0xffffd
    8000631c:	9cc080e7          	jalr	-1588(ra) # 80002ce4 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006320:	0104a783          	lw	a5,16(s1)
    80006324:	0017879b          	addiw	a5,a5,1
    80006328:	0004a703          	lw	a4,0(s1)
    8000632c:	02e7e7bb          	remw	a5,a5,a4
    80006330:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006334:	fc1ff06f          	j	800062f4 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006338:	02100513          	li	a0,33
    8000633c:	ffffd097          	auipc	ra,0xffffd
    80006340:	9a8080e7          	jalr	-1624(ra) # 80002ce4 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006344:	00a00513          	li	a0,10
    80006348:	ffffd097          	auipc	ra,0xffffd
    8000634c:	99c080e7          	jalr	-1636(ra) # 80002ce4 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006350:	0084b503          	ld	a0,8(s1)
    80006354:	ffffb097          	auipc	ra,0xffffb
    80006358:	ff4080e7          	jalr	-12(ra) # 80001348 <_Z8mem_freePv>
    delete itemAvailable;
    8000635c:	0204b503          	ld	a0,32(s1)
    80006360:	00050863          	beqz	a0,80006370 <_ZN9BufferCPPD1Ev+0xb0>
    80006364:	00053783          	ld	a5,0(a0)
    80006368:	0087b783          	ld	a5,8(a5)
    8000636c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006370:	0184b503          	ld	a0,24(s1)
    80006374:	00050863          	beqz	a0,80006384 <_ZN9BufferCPPD1Ev+0xc4>
    80006378:	00053783          	ld	a5,0(a0)
    8000637c:	0087b783          	ld	a5,8(a5)
    80006380:	000780e7          	jalr	a5
    delete mutexTail;
    80006384:	0304b503          	ld	a0,48(s1)
    80006388:	00050863          	beqz	a0,80006398 <_ZN9BufferCPPD1Ev+0xd8>
    8000638c:	00053783          	ld	a5,0(a0)
    80006390:	0087b783          	ld	a5,8(a5)
    80006394:	000780e7          	jalr	a5
    delete mutexHead;
    80006398:	0284b503          	ld	a0,40(s1)
    8000639c:	00050863          	beqz	a0,800063ac <_ZN9BufferCPPD1Ev+0xec>
    800063a0:	00053783          	ld	a5,0(a0)
    800063a4:	0087b783          	ld	a5,8(a5)
    800063a8:	000780e7          	jalr	a5
}
    800063ac:	01813083          	ld	ra,24(sp)
    800063b0:	01013403          	ld	s0,16(sp)
    800063b4:	00813483          	ld	s1,8(sp)
    800063b8:	02010113          	addi	sp,sp,32
    800063bc:	00008067          	ret

00000000800063c0 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    800063c0:	fe010113          	addi	sp,sp,-32
    800063c4:	00113c23          	sd	ra,24(sp)
    800063c8:	00813823          	sd	s0,16(sp)
    800063cc:	00913423          	sd	s1,8(sp)
    800063d0:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    800063d4:	00004517          	auipc	a0,0x4
    800063d8:	0a450513          	addi	a0,a0,164 # 8000a478 <_ZZ9kPrintIntmE6digits+0x408>
    800063dc:	00000097          	auipc	ra,0x0
    800063e0:	91c080e7          	jalr	-1764(ra) # 80005cf8 <_Z11printStringPKc>
    int test = getc() - '0';
    800063e4:	ffffb097          	auipc	ra,0xffffb
    800063e8:	190080e7          	jalr	400(ra) # 80001574 <_Z4getcv>
    800063ec:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800063f0:	ffffb097          	auipc	ra,0xffffb
    800063f4:	184080e7          	jalr	388(ra) # 80001574 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800063f8:	00700793          	li	a5,7
    800063fc:	1097e263          	bltu	a5,s1,80006500 <_Z8userMainv+0x140>
    80006400:	00249493          	slli	s1,s1,0x2
    80006404:	00004717          	auipc	a4,0x4
    80006408:	2cc70713          	addi	a4,a4,716 # 8000a6d0 <_ZZ9kPrintIntmE6digits+0x660>
    8000640c:	00e484b3          	add	s1,s1,a4
    80006410:	0004a783          	lw	a5,0(s1)
    80006414:	00e787b3          	add	a5,a5,a4
    80006418:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    8000641c:	fffff097          	auipc	ra,0xfffff
    80006420:	f54080e7          	jalr	-172(ra) # 80005370 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006424:	00004517          	auipc	a0,0x4
    80006428:	07450513          	addi	a0,a0,116 # 8000a498 <_ZZ9kPrintIntmE6digits+0x428>
    8000642c:	00000097          	auipc	ra,0x0
    80006430:	8cc080e7          	jalr	-1844(ra) # 80005cf8 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006434:	01813083          	ld	ra,24(sp)
    80006438:	01013403          	ld	s0,16(sp)
    8000643c:	00813483          	ld	s1,8(sp)
    80006440:	02010113          	addi	sp,sp,32
    80006444:	00008067          	ret
            Threads_CPP_API_test();
    80006448:	ffffe097          	auipc	ra,0xffffe
    8000644c:	e08080e7          	jalr	-504(ra) # 80004250 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006450:	00004517          	auipc	a0,0x4
    80006454:	08850513          	addi	a0,a0,136 # 8000a4d8 <_ZZ9kPrintIntmE6digits+0x468>
    80006458:	00000097          	auipc	ra,0x0
    8000645c:	8a0080e7          	jalr	-1888(ra) # 80005cf8 <_Z11printStringPKc>
            break;
    80006460:	fd5ff06f          	j	80006434 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006464:	ffffd097          	auipc	ra,0xffffd
    80006468:	640080e7          	jalr	1600(ra) # 80003aa4 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    8000646c:	00004517          	auipc	a0,0x4
    80006470:	0ac50513          	addi	a0,a0,172 # 8000a518 <_ZZ9kPrintIntmE6digits+0x4a8>
    80006474:	00000097          	auipc	ra,0x0
    80006478:	884080e7          	jalr	-1916(ra) # 80005cf8 <_Z11printStringPKc>
            break;
    8000647c:	fb9ff06f          	j	80006434 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006480:	fffff097          	auipc	ra,0xfffff
    80006484:	234080e7          	jalr	564(ra) # 800056b4 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006488:	00004517          	auipc	a0,0x4
    8000648c:	0e050513          	addi	a0,a0,224 # 8000a568 <_ZZ9kPrintIntmE6digits+0x4f8>
    80006490:	00000097          	auipc	ra,0x0
    80006494:	868080e7          	jalr	-1944(ra) # 80005cf8 <_Z11printStringPKc>
            break;
    80006498:	f9dff06f          	j	80006434 <_Z8userMainv+0x74>
            testSleeping();
    8000649c:	00000097          	auipc	ra,0x0
    800064a0:	11c080e7          	jalr	284(ra) # 800065b8 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    800064a4:	00004517          	auipc	a0,0x4
    800064a8:	11c50513          	addi	a0,a0,284 # 8000a5c0 <_ZZ9kPrintIntmE6digits+0x550>
    800064ac:	00000097          	auipc	ra,0x0
    800064b0:	84c080e7          	jalr	-1972(ra) # 80005cf8 <_Z11printStringPKc>
            break;
    800064b4:	f81ff06f          	j	80006434 <_Z8userMainv+0x74>
            testConsumerProducer();
    800064b8:	ffffe097          	auipc	ra,0xffffe
    800064bc:	258080e7          	jalr	600(ra) # 80004710 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    800064c0:	00004517          	auipc	a0,0x4
    800064c4:	13050513          	addi	a0,a0,304 # 8000a5f0 <_ZZ9kPrintIntmE6digits+0x580>
    800064c8:	00000097          	auipc	ra,0x0
    800064cc:	830080e7          	jalr	-2000(ra) # 80005cf8 <_Z11printStringPKc>
            break;
    800064d0:	f65ff06f          	j	80006434 <_Z8userMainv+0x74>
            System_Mode_test();
    800064d4:	00000097          	auipc	ra,0x0
    800064d8:	658080e7          	jalr	1624(ra) # 80006b2c <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    800064dc:	00004517          	auipc	a0,0x4
    800064e0:	15450513          	addi	a0,a0,340 # 8000a630 <_ZZ9kPrintIntmE6digits+0x5c0>
    800064e4:	00000097          	auipc	ra,0x0
    800064e8:	814080e7          	jalr	-2028(ra) # 80005cf8 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800064ec:	00004517          	auipc	a0,0x4
    800064f0:	16450513          	addi	a0,a0,356 # 8000a650 <_ZZ9kPrintIntmE6digits+0x5e0>
    800064f4:	00000097          	auipc	ra,0x0
    800064f8:	804080e7          	jalr	-2044(ra) # 80005cf8 <_Z11printStringPKc>
            break;
    800064fc:	f39ff06f          	j	80006434 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80006500:	00004517          	auipc	a0,0x4
    80006504:	1a850513          	addi	a0,a0,424 # 8000a6a8 <_ZZ9kPrintIntmE6digits+0x638>
    80006508:	fffff097          	auipc	ra,0xfffff
    8000650c:	7f0080e7          	jalr	2032(ra) # 80005cf8 <_Z11printStringPKc>
    80006510:	f25ff06f          	j	80006434 <_Z8userMainv+0x74>

0000000080006514 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006514:	fe010113          	addi	sp,sp,-32
    80006518:	00113c23          	sd	ra,24(sp)
    8000651c:	00813823          	sd	s0,16(sp)
    80006520:	00913423          	sd	s1,8(sp)
    80006524:	01213023          	sd	s2,0(sp)
    80006528:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    8000652c:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006530:	00600493          	li	s1,6
    while (--i > 0) {
    80006534:	fff4849b          	addiw	s1,s1,-1
    80006538:	04905463          	blez	s1,80006580 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    8000653c:	00004517          	auipc	a0,0x4
    80006540:	1b450513          	addi	a0,a0,436 # 8000a6f0 <_ZZ9kPrintIntmE6digits+0x680>
    80006544:	fffff097          	auipc	ra,0xfffff
    80006548:	7b4080e7          	jalr	1972(ra) # 80005cf8 <_Z11printStringPKc>
        printInt(sleep_time);
    8000654c:	00000613          	li	a2,0
    80006550:	00a00593          	li	a1,10
    80006554:	0009051b          	sext.w	a0,s2
    80006558:	00000097          	auipc	ra,0x0
    8000655c:	950080e7          	jalr	-1712(ra) # 80005ea8 <_Z8printIntiii>
        printString(" !\n");
    80006560:	00004517          	auipc	a0,0x4
    80006564:	19850513          	addi	a0,a0,408 # 8000a6f8 <_ZZ9kPrintIntmE6digits+0x688>
    80006568:	fffff097          	auipc	ra,0xfffff
    8000656c:	790080e7          	jalr	1936(ra) # 80005cf8 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006570:	00090513          	mv	a0,s2
    80006574:	ffffb097          	auipc	ra,0xffffb
    80006578:	f08080e7          	jalr	-248(ra) # 8000147c <_Z10time_sleepm>
    while (--i > 0) {
    8000657c:	fb9ff06f          	j	80006534 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006580:	00a00793          	li	a5,10
    80006584:	02f95933          	divu	s2,s2,a5
    80006588:	fff90913          	addi	s2,s2,-1
    8000658c:	00007797          	auipc	a5,0x7
    80006590:	95478793          	addi	a5,a5,-1708 # 8000cee0 <_ZL8finished>
    80006594:	01278933          	add	s2,a5,s2
    80006598:	00100793          	li	a5,1
    8000659c:	00f90023          	sb	a5,0(s2)
}
    800065a0:	01813083          	ld	ra,24(sp)
    800065a4:	01013403          	ld	s0,16(sp)
    800065a8:	00813483          	ld	s1,8(sp)
    800065ac:	00013903          	ld	s2,0(sp)
    800065b0:	02010113          	addi	sp,sp,32
    800065b4:	00008067          	ret

00000000800065b8 <_Z12testSleepingv>:

void testSleeping() {
    800065b8:	fc010113          	addi	sp,sp,-64
    800065bc:	02113c23          	sd	ra,56(sp)
    800065c0:	02813823          	sd	s0,48(sp)
    800065c4:	02913423          	sd	s1,40(sp)
    800065c8:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800065cc:	00a00793          	li	a5,10
    800065d0:	fcf43823          	sd	a5,-48(s0)
    800065d4:	01400793          	li	a5,20
    800065d8:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800065dc:	00000493          	li	s1,0
    800065e0:	02c0006f          	j	8000660c <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800065e4:	00349793          	slli	a5,s1,0x3
    800065e8:	fd040613          	addi	a2,s0,-48
    800065ec:	00f60633          	add	a2,a2,a5
    800065f0:	00000597          	auipc	a1,0x0
    800065f4:	f2458593          	addi	a1,a1,-220 # 80006514 <_ZL9sleepyRunPv>
    800065f8:	fc040513          	addi	a0,s0,-64
    800065fc:	00f50533          	add	a0,a0,a5
    80006600:	ffffb097          	auipc	ra,0xffffb
    80006604:	d78080e7          	jalr	-648(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006608:	0014849b          	addiw	s1,s1,1
    8000660c:	00100793          	li	a5,1
    80006610:	fc97dae3          	bge	a5,s1,800065e4 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006614:	00007797          	auipc	a5,0x7
    80006618:	8cc7c783          	lbu	a5,-1844(a5) # 8000cee0 <_ZL8finished>
    8000661c:	fe078ce3          	beqz	a5,80006614 <_Z12testSleepingv+0x5c>
    80006620:	00007797          	auipc	a5,0x7
    80006624:	8c17c783          	lbu	a5,-1855(a5) # 8000cee1 <_ZL8finished+0x1>
    80006628:	fe0786e3          	beqz	a5,80006614 <_Z12testSleepingv+0x5c>
}
    8000662c:	03813083          	ld	ra,56(sp)
    80006630:	03013403          	ld	s0,48(sp)
    80006634:	02813483          	ld	s1,40(sp)
    80006638:	04010113          	addi	sp,sp,64
    8000663c:	00008067          	ret

0000000080006640 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006640:	fe010113          	addi	sp,sp,-32
    80006644:	00113c23          	sd	ra,24(sp)
    80006648:	00813823          	sd	s0,16(sp)
    8000664c:	00913423          	sd	s1,8(sp)
    80006650:	01213023          	sd	s2,0(sp)
    80006654:	02010413          	addi	s0,sp,32
    80006658:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000665c:	00100793          	li	a5,1
    80006660:	02a7f863          	bgeu	a5,a0,80006690 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006664:	00a00793          	li	a5,10
    80006668:	02f577b3          	remu	a5,a0,a5
    8000666c:	02078e63          	beqz	a5,800066a8 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006670:	fff48513          	addi	a0,s1,-1
    80006674:	00000097          	auipc	ra,0x0
    80006678:	fcc080e7          	jalr	-52(ra) # 80006640 <_ZL9fibonaccim>
    8000667c:	00050913          	mv	s2,a0
    80006680:	ffe48513          	addi	a0,s1,-2
    80006684:	00000097          	auipc	ra,0x0
    80006688:	fbc080e7          	jalr	-68(ra) # 80006640 <_ZL9fibonaccim>
    8000668c:	00a90533          	add	a0,s2,a0
}
    80006690:	01813083          	ld	ra,24(sp)
    80006694:	01013403          	ld	s0,16(sp)
    80006698:	00813483          	ld	s1,8(sp)
    8000669c:	00013903          	ld	s2,0(sp)
    800066a0:	02010113          	addi	sp,sp,32
    800066a4:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800066a8:	ffffb097          	auipc	ra,0xffffb
    800066ac:	d8c080e7          	jalr	-628(ra) # 80001434 <_Z15thread_dispatchv>
    800066b0:	fc1ff06f          	j	80006670 <_ZL9fibonaccim+0x30>

00000000800066b4 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800066b4:	fe010113          	addi	sp,sp,-32
    800066b8:	00113c23          	sd	ra,24(sp)
    800066bc:	00813823          	sd	s0,16(sp)
    800066c0:	00913423          	sd	s1,8(sp)
    800066c4:	01213023          	sd	s2,0(sp)
    800066c8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800066cc:	00a00493          	li	s1,10
    800066d0:	0400006f          	j	80006710 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800066d4:	00004517          	auipc	a0,0x4
    800066d8:	cf450513          	addi	a0,a0,-780 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    800066dc:	fffff097          	auipc	ra,0xfffff
    800066e0:	61c080e7          	jalr	1564(ra) # 80005cf8 <_Z11printStringPKc>
    800066e4:	00000613          	li	a2,0
    800066e8:	00a00593          	li	a1,10
    800066ec:	00048513          	mv	a0,s1
    800066f0:	fffff097          	auipc	ra,0xfffff
    800066f4:	7b8080e7          	jalr	1976(ra) # 80005ea8 <_Z8printIntiii>
    800066f8:	00004517          	auipc	a0,0x4
    800066fc:	ec050513          	addi	a0,a0,-320 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80006700:	fffff097          	auipc	ra,0xfffff
    80006704:	5f8080e7          	jalr	1528(ra) # 80005cf8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006708:	0014849b          	addiw	s1,s1,1
    8000670c:	0ff4f493          	andi	s1,s1,255
    80006710:	00c00793          	li	a5,12
    80006714:	fc97f0e3          	bgeu	a5,s1,800066d4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006718:	00004517          	auipc	a0,0x4
    8000671c:	cb850513          	addi	a0,a0,-840 # 8000a3d0 <_ZZ9kPrintIntmE6digits+0x360>
    80006720:	fffff097          	auipc	ra,0xfffff
    80006724:	5d8080e7          	jalr	1496(ra) # 80005cf8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006728:	00500313          	li	t1,5
    thread_dispatch();
    8000672c:	ffffb097          	auipc	ra,0xffffb
    80006730:	d08080e7          	jalr	-760(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006734:	01000513          	li	a0,16
    80006738:	00000097          	auipc	ra,0x0
    8000673c:	f08080e7          	jalr	-248(ra) # 80006640 <_ZL9fibonaccim>
    80006740:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006744:	00004517          	auipc	a0,0x4
    80006748:	c9c50513          	addi	a0,a0,-868 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    8000674c:	fffff097          	auipc	ra,0xfffff
    80006750:	5ac080e7          	jalr	1452(ra) # 80005cf8 <_Z11printStringPKc>
    80006754:	00000613          	li	a2,0
    80006758:	00a00593          	li	a1,10
    8000675c:	0009051b          	sext.w	a0,s2
    80006760:	fffff097          	auipc	ra,0xfffff
    80006764:	748080e7          	jalr	1864(ra) # 80005ea8 <_Z8printIntiii>
    80006768:	00004517          	auipc	a0,0x4
    8000676c:	e5050513          	addi	a0,a0,-432 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80006770:	fffff097          	auipc	ra,0xfffff
    80006774:	588080e7          	jalr	1416(ra) # 80005cf8 <_Z11printStringPKc>
    80006778:	0400006f          	j	800067b8 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000677c:	00004517          	auipc	a0,0x4
    80006780:	c4c50513          	addi	a0,a0,-948 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80006784:	fffff097          	auipc	ra,0xfffff
    80006788:	574080e7          	jalr	1396(ra) # 80005cf8 <_Z11printStringPKc>
    8000678c:	00000613          	li	a2,0
    80006790:	00a00593          	li	a1,10
    80006794:	00048513          	mv	a0,s1
    80006798:	fffff097          	auipc	ra,0xfffff
    8000679c:	710080e7          	jalr	1808(ra) # 80005ea8 <_Z8printIntiii>
    800067a0:	00004517          	auipc	a0,0x4
    800067a4:	e1850513          	addi	a0,a0,-488 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800067a8:	fffff097          	auipc	ra,0xfffff
    800067ac:	550080e7          	jalr	1360(ra) # 80005cf8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800067b0:	0014849b          	addiw	s1,s1,1
    800067b4:	0ff4f493          	andi	s1,s1,255
    800067b8:	00f00793          	li	a5,15
    800067bc:	fc97f0e3          	bgeu	a5,s1,8000677c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800067c0:	00004517          	auipc	a0,0x4
    800067c4:	c3050513          	addi	a0,a0,-976 # 8000a3f0 <_ZZ9kPrintIntmE6digits+0x380>
    800067c8:	fffff097          	auipc	ra,0xfffff
    800067cc:	530080e7          	jalr	1328(ra) # 80005cf8 <_Z11printStringPKc>
    finishedD = true;
    800067d0:	00100793          	li	a5,1
    800067d4:	00006717          	auipc	a4,0x6
    800067d8:	70f70723          	sb	a5,1806(a4) # 8000cee2 <_ZL9finishedD>
    thread_dispatch();
    800067dc:	ffffb097          	auipc	ra,0xffffb
    800067e0:	c58080e7          	jalr	-936(ra) # 80001434 <_Z15thread_dispatchv>
}
    800067e4:	01813083          	ld	ra,24(sp)
    800067e8:	01013403          	ld	s0,16(sp)
    800067ec:	00813483          	ld	s1,8(sp)
    800067f0:	00013903          	ld	s2,0(sp)
    800067f4:	02010113          	addi	sp,sp,32
    800067f8:	00008067          	ret

00000000800067fc <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800067fc:	fe010113          	addi	sp,sp,-32
    80006800:	00113c23          	sd	ra,24(sp)
    80006804:	00813823          	sd	s0,16(sp)
    80006808:	00913423          	sd	s1,8(sp)
    8000680c:	01213023          	sd	s2,0(sp)
    80006810:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006814:	00000493          	li	s1,0
    80006818:	0400006f          	j	80006858 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    8000681c:	00004517          	auipc	a0,0x4
    80006820:	b6c50513          	addi	a0,a0,-1172 # 8000a388 <_ZZ9kPrintIntmE6digits+0x318>
    80006824:	fffff097          	auipc	ra,0xfffff
    80006828:	4d4080e7          	jalr	1236(ra) # 80005cf8 <_Z11printStringPKc>
    8000682c:	00000613          	li	a2,0
    80006830:	00a00593          	li	a1,10
    80006834:	00048513          	mv	a0,s1
    80006838:	fffff097          	auipc	ra,0xfffff
    8000683c:	670080e7          	jalr	1648(ra) # 80005ea8 <_Z8printIntiii>
    80006840:	00004517          	auipc	a0,0x4
    80006844:	d7850513          	addi	a0,a0,-648 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80006848:	fffff097          	auipc	ra,0xfffff
    8000684c:	4b0080e7          	jalr	1200(ra) # 80005cf8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006850:	0014849b          	addiw	s1,s1,1
    80006854:	0ff4f493          	andi	s1,s1,255
    80006858:	00200793          	li	a5,2
    8000685c:	fc97f0e3          	bgeu	a5,s1,8000681c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006860:	00004517          	auipc	a0,0x4
    80006864:	b3050513          	addi	a0,a0,-1232 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80006868:	fffff097          	auipc	ra,0xfffff
    8000686c:	490080e7          	jalr	1168(ra) # 80005cf8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006870:	00700313          	li	t1,7
    thread_dispatch();
    80006874:	ffffb097          	auipc	ra,0xffffb
    80006878:	bc0080e7          	jalr	-1088(ra) # 80001434 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000687c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006880:	00004517          	auipc	a0,0x4
    80006884:	b2050513          	addi	a0,a0,-1248 # 8000a3a0 <_ZZ9kPrintIntmE6digits+0x330>
    80006888:	fffff097          	auipc	ra,0xfffff
    8000688c:	470080e7          	jalr	1136(ra) # 80005cf8 <_Z11printStringPKc>
    80006890:	00000613          	li	a2,0
    80006894:	00a00593          	li	a1,10
    80006898:	0009051b          	sext.w	a0,s2
    8000689c:	fffff097          	auipc	ra,0xfffff
    800068a0:	60c080e7          	jalr	1548(ra) # 80005ea8 <_Z8printIntiii>
    800068a4:	00004517          	auipc	a0,0x4
    800068a8:	d1450513          	addi	a0,a0,-748 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800068ac:	fffff097          	auipc	ra,0xfffff
    800068b0:	44c080e7          	jalr	1100(ra) # 80005cf8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800068b4:	00c00513          	li	a0,12
    800068b8:	00000097          	auipc	ra,0x0
    800068bc:	d88080e7          	jalr	-632(ra) # 80006640 <_ZL9fibonaccim>
    800068c0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800068c4:	00004517          	auipc	a0,0x4
    800068c8:	ae450513          	addi	a0,a0,-1308 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    800068cc:	fffff097          	auipc	ra,0xfffff
    800068d0:	42c080e7          	jalr	1068(ra) # 80005cf8 <_Z11printStringPKc>
    800068d4:	00000613          	li	a2,0
    800068d8:	00a00593          	li	a1,10
    800068dc:	0009051b          	sext.w	a0,s2
    800068e0:	fffff097          	auipc	ra,0xfffff
    800068e4:	5c8080e7          	jalr	1480(ra) # 80005ea8 <_Z8printIntiii>
    800068e8:	00004517          	auipc	a0,0x4
    800068ec:	cd050513          	addi	a0,a0,-816 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800068f0:	fffff097          	auipc	ra,0xfffff
    800068f4:	408080e7          	jalr	1032(ra) # 80005cf8 <_Z11printStringPKc>
    800068f8:	0400006f          	j	80006938 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800068fc:	00004517          	auipc	a0,0x4
    80006900:	a8c50513          	addi	a0,a0,-1396 # 8000a388 <_ZZ9kPrintIntmE6digits+0x318>
    80006904:	fffff097          	auipc	ra,0xfffff
    80006908:	3f4080e7          	jalr	1012(ra) # 80005cf8 <_Z11printStringPKc>
    8000690c:	00000613          	li	a2,0
    80006910:	00a00593          	li	a1,10
    80006914:	00048513          	mv	a0,s1
    80006918:	fffff097          	auipc	ra,0xfffff
    8000691c:	590080e7          	jalr	1424(ra) # 80005ea8 <_Z8printIntiii>
    80006920:	00004517          	auipc	a0,0x4
    80006924:	c9850513          	addi	a0,a0,-872 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80006928:	fffff097          	auipc	ra,0xfffff
    8000692c:	3d0080e7          	jalr	976(ra) # 80005cf8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006930:	0014849b          	addiw	s1,s1,1
    80006934:	0ff4f493          	andi	s1,s1,255
    80006938:	00500793          	li	a5,5
    8000693c:	fc97f0e3          	bgeu	a5,s1,800068fc <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006940:	00004517          	auipc	a0,0x4
    80006944:	a2050513          	addi	a0,a0,-1504 # 8000a360 <_ZZ9kPrintIntmE6digits+0x2f0>
    80006948:	fffff097          	auipc	ra,0xfffff
    8000694c:	3b0080e7          	jalr	944(ra) # 80005cf8 <_Z11printStringPKc>
    finishedC = true;
    80006950:	00100793          	li	a5,1
    80006954:	00006717          	auipc	a4,0x6
    80006958:	58f707a3          	sb	a5,1423(a4) # 8000cee3 <_ZL9finishedC>
    thread_dispatch();
    8000695c:	ffffb097          	auipc	ra,0xffffb
    80006960:	ad8080e7          	jalr	-1320(ra) # 80001434 <_Z15thread_dispatchv>
}
    80006964:	01813083          	ld	ra,24(sp)
    80006968:	01013403          	ld	s0,16(sp)
    8000696c:	00813483          	ld	s1,8(sp)
    80006970:	00013903          	ld	s2,0(sp)
    80006974:	02010113          	addi	sp,sp,32
    80006978:	00008067          	ret

000000008000697c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000697c:	fe010113          	addi	sp,sp,-32
    80006980:	00113c23          	sd	ra,24(sp)
    80006984:	00813823          	sd	s0,16(sp)
    80006988:	00913423          	sd	s1,8(sp)
    8000698c:	01213023          	sd	s2,0(sp)
    80006990:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006994:	00000913          	li	s2,0
    80006998:	0400006f          	j	800069d8 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    8000699c:	ffffb097          	auipc	ra,0xffffb
    800069a0:	a98080e7          	jalr	-1384(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800069a4:	00148493          	addi	s1,s1,1
    800069a8:	000027b7          	lui	a5,0x2
    800069ac:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800069b0:	0097ee63          	bltu	a5,s1,800069cc <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800069b4:	00000713          	li	a4,0
    800069b8:	000077b7          	lui	a5,0x7
    800069bc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800069c0:	fce7eee3          	bltu	a5,a4,8000699c <_ZL11workerBodyBPv+0x20>
    800069c4:	00170713          	addi	a4,a4,1
    800069c8:	ff1ff06f          	j	800069b8 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    800069cc:	00a00793          	li	a5,10
    800069d0:	04f90663          	beq	s2,a5,80006a1c <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    800069d4:	00190913          	addi	s2,s2,1
    800069d8:	00f00793          	li	a5,15
    800069dc:	0527e463          	bltu	a5,s2,80006a24 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    800069e0:	00004517          	auipc	a0,0x4
    800069e4:	99050513          	addi	a0,a0,-1648 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    800069e8:	fffff097          	auipc	ra,0xfffff
    800069ec:	310080e7          	jalr	784(ra) # 80005cf8 <_Z11printStringPKc>
    800069f0:	00000613          	li	a2,0
    800069f4:	00a00593          	li	a1,10
    800069f8:	0009051b          	sext.w	a0,s2
    800069fc:	fffff097          	auipc	ra,0xfffff
    80006a00:	4ac080e7          	jalr	1196(ra) # 80005ea8 <_Z8printIntiii>
    80006a04:	00004517          	auipc	a0,0x4
    80006a08:	bb450513          	addi	a0,a0,-1100 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80006a0c:	fffff097          	auipc	ra,0xfffff
    80006a10:	2ec080e7          	jalr	748(ra) # 80005cf8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006a14:	00000493          	li	s1,0
    80006a18:	f91ff06f          	j	800069a8 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006a1c:	14102ff3          	csrr	t6,sepc
    80006a20:	fb5ff06f          	j	800069d4 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006a24:	00004517          	auipc	a0,0x4
    80006a28:	95450513          	addi	a0,a0,-1708 # 8000a378 <_ZZ9kPrintIntmE6digits+0x308>
    80006a2c:	fffff097          	auipc	ra,0xfffff
    80006a30:	2cc080e7          	jalr	716(ra) # 80005cf8 <_Z11printStringPKc>
    finishedB = true;
    80006a34:	00100793          	li	a5,1
    80006a38:	00006717          	auipc	a4,0x6
    80006a3c:	4af70623          	sb	a5,1196(a4) # 8000cee4 <_ZL9finishedB>
    thread_dispatch();
    80006a40:	ffffb097          	auipc	ra,0xffffb
    80006a44:	9f4080e7          	jalr	-1548(ra) # 80001434 <_Z15thread_dispatchv>
}
    80006a48:	01813083          	ld	ra,24(sp)
    80006a4c:	01013403          	ld	s0,16(sp)
    80006a50:	00813483          	ld	s1,8(sp)
    80006a54:	00013903          	ld	s2,0(sp)
    80006a58:	02010113          	addi	sp,sp,32
    80006a5c:	00008067          	ret

0000000080006a60 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006a60:	fe010113          	addi	sp,sp,-32
    80006a64:	00113c23          	sd	ra,24(sp)
    80006a68:	00813823          	sd	s0,16(sp)
    80006a6c:	00913423          	sd	s1,8(sp)
    80006a70:	01213023          	sd	s2,0(sp)
    80006a74:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006a78:	00000913          	li	s2,0
    80006a7c:	0380006f          	j	80006ab4 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006a80:	ffffb097          	auipc	ra,0xffffb
    80006a84:	9b4080e7          	jalr	-1612(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006a88:	00148493          	addi	s1,s1,1
    80006a8c:	000027b7          	lui	a5,0x2
    80006a90:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006a94:	0097ee63          	bltu	a5,s1,80006ab0 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006a98:	00000713          	li	a4,0
    80006a9c:	000077b7          	lui	a5,0x7
    80006aa0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006aa4:	fce7eee3          	bltu	a5,a4,80006a80 <_ZL11workerBodyAPv+0x20>
    80006aa8:	00170713          	addi	a4,a4,1
    80006aac:	ff1ff06f          	j	80006a9c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006ab0:	00190913          	addi	s2,s2,1
    80006ab4:	00900793          	li	a5,9
    80006ab8:	0527e063          	bltu	a5,s2,80006af8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006abc:	00004517          	auipc	a0,0x4
    80006ac0:	89c50513          	addi	a0,a0,-1892 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80006ac4:	fffff097          	auipc	ra,0xfffff
    80006ac8:	234080e7          	jalr	564(ra) # 80005cf8 <_Z11printStringPKc>
    80006acc:	00000613          	li	a2,0
    80006ad0:	00a00593          	li	a1,10
    80006ad4:	0009051b          	sext.w	a0,s2
    80006ad8:	fffff097          	auipc	ra,0xfffff
    80006adc:	3d0080e7          	jalr	976(ra) # 80005ea8 <_Z8printIntiii>
    80006ae0:	00004517          	auipc	a0,0x4
    80006ae4:	ad850513          	addi	a0,a0,-1320 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80006ae8:	fffff097          	auipc	ra,0xfffff
    80006aec:	210080e7          	jalr	528(ra) # 80005cf8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006af0:	00000493          	li	s1,0
    80006af4:	f99ff06f          	j	80006a8c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006af8:	00004517          	auipc	a0,0x4
    80006afc:	86850513          	addi	a0,a0,-1944 # 8000a360 <_ZZ9kPrintIntmE6digits+0x2f0>
    80006b00:	fffff097          	auipc	ra,0xfffff
    80006b04:	1f8080e7          	jalr	504(ra) # 80005cf8 <_Z11printStringPKc>
    finishedA = true;
    80006b08:	00100793          	li	a5,1
    80006b0c:	00006717          	auipc	a4,0x6
    80006b10:	3cf70ca3          	sb	a5,985(a4) # 8000cee5 <_ZL9finishedA>
}
    80006b14:	01813083          	ld	ra,24(sp)
    80006b18:	01013403          	ld	s0,16(sp)
    80006b1c:	00813483          	ld	s1,8(sp)
    80006b20:	00013903          	ld	s2,0(sp)
    80006b24:	02010113          	addi	sp,sp,32
    80006b28:	00008067          	ret

0000000080006b2c <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006b2c:	fd010113          	addi	sp,sp,-48
    80006b30:	02113423          	sd	ra,40(sp)
    80006b34:	02813023          	sd	s0,32(sp)
    80006b38:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006b3c:	00000613          	li	a2,0
    80006b40:	00000597          	auipc	a1,0x0
    80006b44:	f2058593          	addi	a1,a1,-224 # 80006a60 <_ZL11workerBodyAPv>
    80006b48:	fd040513          	addi	a0,s0,-48
    80006b4c:	ffffb097          	auipc	ra,0xffffb
    80006b50:	82c080e7          	jalr	-2004(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006b54:	00004517          	auipc	a0,0x4
    80006b58:	8ac50513          	addi	a0,a0,-1876 # 8000a400 <_ZZ9kPrintIntmE6digits+0x390>
    80006b5c:	fffff097          	auipc	ra,0xfffff
    80006b60:	19c080e7          	jalr	412(ra) # 80005cf8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006b64:	00000613          	li	a2,0
    80006b68:	00000597          	auipc	a1,0x0
    80006b6c:	e1458593          	addi	a1,a1,-492 # 8000697c <_ZL11workerBodyBPv>
    80006b70:	fd840513          	addi	a0,s0,-40
    80006b74:	ffffb097          	auipc	ra,0xffffb
    80006b78:	804080e7          	jalr	-2044(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006b7c:	00004517          	auipc	a0,0x4
    80006b80:	89c50513          	addi	a0,a0,-1892 # 8000a418 <_ZZ9kPrintIntmE6digits+0x3a8>
    80006b84:	fffff097          	auipc	ra,0xfffff
    80006b88:	174080e7          	jalr	372(ra) # 80005cf8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006b8c:	00000613          	li	a2,0
    80006b90:	00000597          	auipc	a1,0x0
    80006b94:	c6c58593          	addi	a1,a1,-916 # 800067fc <_ZL11workerBodyCPv>
    80006b98:	fe040513          	addi	a0,s0,-32
    80006b9c:	ffffa097          	auipc	ra,0xffffa
    80006ba0:	7dc080e7          	jalr	2012(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006ba4:	00004517          	auipc	a0,0x4
    80006ba8:	88c50513          	addi	a0,a0,-1908 # 8000a430 <_ZZ9kPrintIntmE6digits+0x3c0>
    80006bac:	fffff097          	auipc	ra,0xfffff
    80006bb0:	14c080e7          	jalr	332(ra) # 80005cf8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006bb4:	00000613          	li	a2,0
    80006bb8:	00000597          	auipc	a1,0x0
    80006bbc:	afc58593          	addi	a1,a1,-1284 # 800066b4 <_ZL11workerBodyDPv>
    80006bc0:	fe840513          	addi	a0,s0,-24
    80006bc4:	ffffa097          	auipc	ra,0xffffa
    80006bc8:	7b4080e7          	jalr	1972(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006bcc:	00004517          	auipc	a0,0x4
    80006bd0:	87c50513          	addi	a0,a0,-1924 # 8000a448 <_ZZ9kPrintIntmE6digits+0x3d8>
    80006bd4:	fffff097          	auipc	ra,0xfffff
    80006bd8:	124080e7          	jalr	292(ra) # 80005cf8 <_Z11printStringPKc>
    80006bdc:	00c0006f          	j	80006be8 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006be0:	ffffb097          	auipc	ra,0xffffb
    80006be4:	854080e7          	jalr	-1964(ra) # 80001434 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006be8:	00006797          	auipc	a5,0x6
    80006bec:	2fd7c783          	lbu	a5,765(a5) # 8000cee5 <_ZL9finishedA>
    80006bf0:	fe0788e3          	beqz	a5,80006be0 <_Z16System_Mode_testv+0xb4>
    80006bf4:	00006797          	auipc	a5,0x6
    80006bf8:	2f07c783          	lbu	a5,752(a5) # 8000cee4 <_ZL9finishedB>
    80006bfc:	fe0782e3          	beqz	a5,80006be0 <_Z16System_Mode_testv+0xb4>
    80006c00:	00006797          	auipc	a5,0x6
    80006c04:	2e37c783          	lbu	a5,739(a5) # 8000cee3 <_ZL9finishedC>
    80006c08:	fc078ce3          	beqz	a5,80006be0 <_Z16System_Mode_testv+0xb4>
    80006c0c:	00006797          	auipc	a5,0x6
    80006c10:	2d67c783          	lbu	a5,726(a5) # 8000cee2 <_ZL9finishedD>
    80006c14:	fc0786e3          	beqz	a5,80006be0 <_Z16System_Mode_testv+0xb4>
    }

}
    80006c18:	02813083          	ld	ra,40(sp)
    80006c1c:	02013403          	ld	s0,32(sp)
    80006c20:	03010113          	addi	sp,sp,48
    80006c24:	00008067          	ret

0000000080006c28 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006c28:	fe010113          	addi	sp,sp,-32
    80006c2c:	00113c23          	sd	ra,24(sp)
    80006c30:	00813823          	sd	s0,16(sp)
    80006c34:	00913423          	sd	s1,8(sp)
    80006c38:	01213023          	sd	s2,0(sp)
    80006c3c:	02010413          	addi	s0,sp,32
    80006c40:	00050493          	mv	s1,a0
    80006c44:	00058913          	mv	s2,a1
    80006c48:	0015879b          	addiw	a5,a1,1
    80006c4c:	0007851b          	sext.w	a0,a5
    80006c50:	00f4a023          	sw	a5,0(s1)
    80006c54:	0004a823          	sw	zero,16(s1)
    80006c58:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006c5c:	00251513          	slli	a0,a0,0x2
    80006c60:	ffffa097          	auipc	ra,0xffffa
    80006c64:	6a8080e7          	jalr	1704(ra) # 80001308 <_Z9mem_allocm>
    80006c68:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006c6c:	00000593          	li	a1,0
    80006c70:	02048513          	addi	a0,s1,32
    80006c74:	ffffb097          	auipc	ra,0xffffb
    80006c78:	838080e7          	jalr	-1992(ra) # 800014ac <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006c7c:	00090593          	mv	a1,s2
    80006c80:	01848513          	addi	a0,s1,24
    80006c84:	ffffb097          	auipc	ra,0xffffb
    80006c88:	828080e7          	jalr	-2008(ra) # 800014ac <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006c8c:	00100593          	li	a1,1
    80006c90:	02848513          	addi	a0,s1,40
    80006c94:	ffffb097          	auipc	ra,0xffffb
    80006c98:	818080e7          	jalr	-2024(ra) # 800014ac <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006c9c:	00100593          	li	a1,1
    80006ca0:	03048513          	addi	a0,s1,48
    80006ca4:	ffffb097          	auipc	ra,0xffffb
    80006ca8:	808080e7          	jalr	-2040(ra) # 800014ac <_Z8sem_openPP4KSemj>
}
    80006cac:	01813083          	ld	ra,24(sp)
    80006cb0:	01013403          	ld	s0,16(sp)
    80006cb4:	00813483          	ld	s1,8(sp)
    80006cb8:	00013903          	ld	s2,0(sp)
    80006cbc:	02010113          	addi	sp,sp,32
    80006cc0:	00008067          	ret

0000000080006cc4 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006cc4:	fe010113          	addi	sp,sp,-32
    80006cc8:	00113c23          	sd	ra,24(sp)
    80006ccc:	00813823          	sd	s0,16(sp)
    80006cd0:	00913423          	sd	s1,8(sp)
    80006cd4:	01213023          	sd	s2,0(sp)
    80006cd8:	02010413          	addi	s0,sp,32
    80006cdc:	00050493          	mv	s1,a0
    80006ce0:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006ce4:	01853503          	ld	a0,24(a0)
    80006ce8:	ffffb097          	auipc	ra,0xffffb
    80006cec:	82c080e7          	jalr	-2004(ra) # 80001514 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006cf0:	0304b503          	ld	a0,48(s1)
    80006cf4:	ffffb097          	auipc	ra,0xffffb
    80006cf8:	820080e7          	jalr	-2016(ra) # 80001514 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006cfc:	0084b783          	ld	a5,8(s1)
    80006d00:	0144a703          	lw	a4,20(s1)
    80006d04:	00271713          	slli	a4,a4,0x2
    80006d08:	00e787b3          	add	a5,a5,a4
    80006d0c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006d10:	0144a783          	lw	a5,20(s1)
    80006d14:	0017879b          	addiw	a5,a5,1
    80006d18:	0004a703          	lw	a4,0(s1)
    80006d1c:	02e7e7bb          	remw	a5,a5,a4
    80006d20:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006d24:	0304b503          	ld	a0,48(s1)
    80006d28:	ffffb097          	auipc	ra,0xffffb
    80006d2c:	81c080e7          	jalr	-2020(ra) # 80001544 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006d30:	0204b503          	ld	a0,32(s1)
    80006d34:	ffffb097          	auipc	ra,0xffffb
    80006d38:	810080e7          	jalr	-2032(ra) # 80001544 <_Z10sem_signalP4KSem>

}
    80006d3c:	01813083          	ld	ra,24(sp)
    80006d40:	01013403          	ld	s0,16(sp)
    80006d44:	00813483          	ld	s1,8(sp)
    80006d48:	00013903          	ld	s2,0(sp)
    80006d4c:	02010113          	addi	sp,sp,32
    80006d50:	00008067          	ret

0000000080006d54 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006d54:	fe010113          	addi	sp,sp,-32
    80006d58:	00113c23          	sd	ra,24(sp)
    80006d5c:	00813823          	sd	s0,16(sp)
    80006d60:	00913423          	sd	s1,8(sp)
    80006d64:	01213023          	sd	s2,0(sp)
    80006d68:	02010413          	addi	s0,sp,32
    80006d6c:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006d70:	02053503          	ld	a0,32(a0)
    80006d74:	ffffa097          	auipc	ra,0xffffa
    80006d78:	7a0080e7          	jalr	1952(ra) # 80001514 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006d7c:	0284b503          	ld	a0,40(s1)
    80006d80:	ffffa097          	auipc	ra,0xffffa
    80006d84:	794080e7          	jalr	1940(ra) # 80001514 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006d88:	0084b703          	ld	a4,8(s1)
    80006d8c:	0104a783          	lw	a5,16(s1)
    80006d90:	00279693          	slli	a3,a5,0x2
    80006d94:	00d70733          	add	a4,a4,a3
    80006d98:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006d9c:	0017879b          	addiw	a5,a5,1
    80006da0:	0004a703          	lw	a4,0(s1)
    80006da4:	02e7e7bb          	remw	a5,a5,a4
    80006da8:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006dac:	0284b503          	ld	a0,40(s1)
    80006db0:	ffffa097          	auipc	ra,0xffffa
    80006db4:	794080e7          	jalr	1940(ra) # 80001544 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006db8:	0184b503          	ld	a0,24(s1)
    80006dbc:	ffffa097          	auipc	ra,0xffffa
    80006dc0:	788080e7          	jalr	1928(ra) # 80001544 <_Z10sem_signalP4KSem>

    return ret;
}
    80006dc4:	00090513          	mv	a0,s2
    80006dc8:	01813083          	ld	ra,24(sp)
    80006dcc:	01013403          	ld	s0,16(sp)
    80006dd0:	00813483          	ld	s1,8(sp)
    80006dd4:	00013903          	ld	s2,0(sp)
    80006dd8:	02010113          	addi	sp,sp,32
    80006ddc:	00008067          	ret

0000000080006de0 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006de0:	fe010113          	addi	sp,sp,-32
    80006de4:	00113c23          	sd	ra,24(sp)
    80006de8:	00813823          	sd	s0,16(sp)
    80006dec:	00913423          	sd	s1,8(sp)
    80006df0:	01213023          	sd	s2,0(sp)
    80006df4:	02010413          	addi	s0,sp,32
    80006df8:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006dfc:	02853503          	ld	a0,40(a0)
    80006e00:	ffffa097          	auipc	ra,0xffffa
    80006e04:	714080e7          	jalr	1812(ra) # 80001514 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006e08:	0304b503          	ld	a0,48(s1)
    80006e0c:	ffffa097          	auipc	ra,0xffffa
    80006e10:	708080e7          	jalr	1800(ra) # 80001514 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006e14:	0144a783          	lw	a5,20(s1)
    80006e18:	0104a903          	lw	s2,16(s1)
    80006e1c:	0327ce63          	blt	a5,s2,80006e58 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006e20:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006e24:	0304b503          	ld	a0,48(s1)
    80006e28:	ffffa097          	auipc	ra,0xffffa
    80006e2c:	71c080e7          	jalr	1820(ra) # 80001544 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006e30:	0284b503          	ld	a0,40(s1)
    80006e34:	ffffa097          	auipc	ra,0xffffa
    80006e38:	710080e7          	jalr	1808(ra) # 80001544 <_Z10sem_signalP4KSem>

    return ret;
}
    80006e3c:	00090513          	mv	a0,s2
    80006e40:	01813083          	ld	ra,24(sp)
    80006e44:	01013403          	ld	s0,16(sp)
    80006e48:	00813483          	ld	s1,8(sp)
    80006e4c:	00013903          	ld	s2,0(sp)
    80006e50:	02010113          	addi	sp,sp,32
    80006e54:	00008067          	ret
        ret = cap - head + tail;
    80006e58:	0004a703          	lw	a4,0(s1)
    80006e5c:	4127093b          	subw	s2,a4,s2
    80006e60:	00f9093b          	addw	s2,s2,a5
    80006e64:	fc1ff06f          	j	80006e24 <_ZN6Buffer6getCntEv+0x44>

0000000080006e68 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006e68:	fe010113          	addi	sp,sp,-32
    80006e6c:	00113c23          	sd	ra,24(sp)
    80006e70:	00813823          	sd	s0,16(sp)
    80006e74:	00913423          	sd	s1,8(sp)
    80006e78:	02010413          	addi	s0,sp,32
    80006e7c:	00050493          	mv	s1,a0
    putc('\n');
    80006e80:	00a00513          	li	a0,10
    80006e84:	ffffa097          	auipc	ra,0xffffa
    80006e88:	718080e7          	jalr	1816(ra) # 8000159c <_Z4putcc>
    printString("Buffer deleted!\n");
    80006e8c:	00003517          	auipc	a0,0x3
    80006e90:	5d450513          	addi	a0,a0,1492 # 8000a460 <_ZZ9kPrintIntmE6digits+0x3f0>
    80006e94:	fffff097          	auipc	ra,0xfffff
    80006e98:	e64080e7          	jalr	-412(ra) # 80005cf8 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006e9c:	00048513          	mv	a0,s1
    80006ea0:	00000097          	auipc	ra,0x0
    80006ea4:	f40080e7          	jalr	-192(ra) # 80006de0 <_ZN6Buffer6getCntEv>
    80006ea8:	02a05c63          	blez	a0,80006ee0 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006eac:	0084b783          	ld	a5,8(s1)
    80006eb0:	0104a703          	lw	a4,16(s1)
    80006eb4:	00271713          	slli	a4,a4,0x2
    80006eb8:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006ebc:	0007c503          	lbu	a0,0(a5)
    80006ec0:	ffffa097          	auipc	ra,0xffffa
    80006ec4:	6dc080e7          	jalr	1756(ra) # 8000159c <_Z4putcc>
        head = (head + 1) % cap;
    80006ec8:	0104a783          	lw	a5,16(s1)
    80006ecc:	0017879b          	addiw	a5,a5,1
    80006ed0:	0004a703          	lw	a4,0(s1)
    80006ed4:	02e7e7bb          	remw	a5,a5,a4
    80006ed8:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006edc:	fc1ff06f          	j	80006e9c <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006ee0:	02100513          	li	a0,33
    80006ee4:	ffffa097          	auipc	ra,0xffffa
    80006ee8:	6b8080e7          	jalr	1720(ra) # 8000159c <_Z4putcc>
    putc('\n');
    80006eec:	00a00513          	li	a0,10
    80006ef0:	ffffa097          	auipc	ra,0xffffa
    80006ef4:	6ac080e7          	jalr	1708(ra) # 8000159c <_Z4putcc>
    mem_free(buffer);
    80006ef8:	0084b503          	ld	a0,8(s1)
    80006efc:	ffffa097          	auipc	ra,0xffffa
    80006f00:	44c080e7          	jalr	1100(ra) # 80001348 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006f04:	0204b503          	ld	a0,32(s1)
    80006f08:	ffffa097          	auipc	ra,0xffffa
    80006f0c:	5dc080e7          	jalr	1500(ra) # 800014e4 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006f10:	0184b503          	ld	a0,24(s1)
    80006f14:	ffffa097          	auipc	ra,0xffffa
    80006f18:	5d0080e7          	jalr	1488(ra) # 800014e4 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006f1c:	0304b503          	ld	a0,48(s1)
    80006f20:	ffffa097          	auipc	ra,0xffffa
    80006f24:	5c4080e7          	jalr	1476(ra) # 800014e4 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006f28:	0284b503          	ld	a0,40(s1)
    80006f2c:	ffffa097          	auipc	ra,0xffffa
    80006f30:	5b8080e7          	jalr	1464(ra) # 800014e4 <_Z9sem_closeP4KSem>
}
    80006f34:	01813083          	ld	ra,24(sp)
    80006f38:	01013403          	ld	s0,16(sp)
    80006f3c:	00813483          	ld	s1,8(sp)
    80006f40:	02010113          	addi	sp,sp,32
    80006f44:	00008067          	ret

0000000080006f48 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80006f48:	fa010113          	addi	sp,sp,-96
    80006f4c:	04813c23          	sd	s0,88(sp)
    80006f50:	06010413          	addi	s0,sp,96
    80006f54:	faa43423          	sd	a0,-88(s0)
    80006f58:	00058793          	mv	a5,a1
    80006f5c:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80006f60:	fa843783          	ld	a5,-88(s0)
    80006f64:	00079663          	bnez	a5,80006f70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80006f68:	00000793          	li	a5,0
    80006f6c:	2040006f          	j	80007170 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80006f70:	fa843783          	ld	a5,-88(s0)
    80006f74:	0067d713          	srli	a4,a5,0x6
    80006f78:	fa843783          	ld	a5,-88(s0)
    80006f7c:	03f7f793          	andi	a5,a5,63
    80006f80:	00078663          	beqz	a5,80006f8c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80006f84:	00100793          	li	a5,1
    80006f88:	0080006f          	j	80006f90 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80006f8c:	00000793          	li	a5,0
    80006f90:	00e787b3          	add	a5,a5,a4
    80006f94:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80006f98:	fc843783          	ld	a5,-56(s0)
    80006f9c:	00679793          	slli	a5,a5,0x6
    80006fa0:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    80006fa4:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80006fa8:	00006797          	auipc	a5,0x6
    80006fac:	f4878793          	addi	a5,a5,-184 # 8000cef0 <_ZN15MemoryAllocator11freeMemHeadE>
    80006fb0:	0007b783          	ld	a5,0(a5)
    80006fb4:	fef43023          	sd	a5,-32(s0)
    80006fb8:	fe043783          	ld	a5,-32(s0)
    80006fbc:	1a078863          	beqz	a5,8000716c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    80006fc0:	fe043783          	ld	a5,-32(s0)
    80006fc4:	0087b783          	ld	a5,8(a5)
    80006fc8:	fa843703          	ld	a4,-88(s0)
    80006fcc:	18e7e263          	bltu	a5,a4,80007150 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    80006fd0:	fe043703          	ld	a4,-32(s0)
    80006fd4:	fa843783          	ld	a5,-88(s0)
    80006fd8:	00f707b3          	add	a5,a4,a5
    80006fdc:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    80006fe0:	fe043783          	ld	a5,-32(s0)
    80006fe4:	0087b703          	ld	a4,8(a5)
    80006fe8:	fa843783          	ld	a5,-88(s0)
    80006fec:	40f707b3          	sub	a5,a4,a5
    80006ff0:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80006ff4:	fb843703          	ld	a4,-72(s0)
    80006ff8:	02000793          	li	a5,32
    80006ffc:	04e7e463          	bltu	a5,a4,80007044 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    80007000:	fa843703          	ld	a4,-88(s0)
    80007004:	fb843783          	ld	a5,-72(s0)
    80007008:	00f707b3          	add	a5,a4,a5
    8000700c:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    80007010:	fe843783          	ld	a5,-24(s0)
    80007014:	00078c63          	beqz	a5,8000702c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    80007018:	fe043783          	ld	a5,-32(s0)
    8000701c:	0007b703          	ld	a4,0(a5)
    80007020:	fe843783          	ld	a5,-24(s0)
    80007024:	00e7b023          	sd	a4,0(a5)
    80007028:	0600006f          	j	80007088 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    8000702c:	fe043783          	ld	a5,-32(s0)
    80007030:	0007b703          	ld	a4,0(a5)
    80007034:	00006797          	auipc	a5,0x6
    80007038:	ebc78793          	addi	a5,a5,-324 # 8000cef0 <_ZN15MemoryAllocator11freeMemHeadE>
    8000703c:	00e7b023          	sd	a4,0(a5)
    80007040:	0480006f          	j	80007088 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    80007044:	fc043783          	ld	a5,-64(s0)
    80007048:	fb843703          	ld	a4,-72(s0)
    8000704c:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    80007050:	fe043783          	ld	a5,-32(s0)
    80007054:	0007b703          	ld	a4,0(a5)
    80007058:	fc043783          	ld	a5,-64(s0)
    8000705c:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    80007060:	fe843783          	ld	a5,-24(s0)
    80007064:	00078a63          	beqz	a5,80007078 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    80007068:	fe843783          	ld	a5,-24(s0)
    8000706c:	fc043703          	ld	a4,-64(s0)
    80007070:	00e7b023          	sd	a4,0(a5)
    80007074:	0140006f          	j	80007088 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    80007078:	00006797          	auipc	a5,0x6
    8000707c:	e7878793          	addi	a5,a5,-392 # 8000cef0 <_ZN15MemoryAllocator11freeMemHeadE>
    80007080:	fc043703          	ld	a4,-64(s0)
    80007084:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    80007088:	fe043783          	ld	a5,-32(s0)
    8000708c:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    80007090:	fb043783          	ld	a5,-80(s0)
    80007094:	fa843703          	ld	a4,-88(s0)
    80007098:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    8000709c:	fb043783          	ld	a5,-80(s0)
    800070a0:	fa442703          	lw	a4,-92(s0)
    800070a4:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    800070a8:	fb043783          	ld	a5,-80(s0)
    800070ac:	02078713          	addi	a4,a5,32
    800070b0:	fb043783          	ld	a5,-80(s0)
    800070b4:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    800070b8:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    800070bc:	00006797          	auipc	a5,0x6
    800070c0:	e2c78793          	addi	a5,a5,-468 # 8000cee8 <_ZN15MemoryAllocator11usedMemHeadE>
    800070c4:	0007b783          	ld	a5,0(a5)
    800070c8:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    800070cc:	fd043783          	ld	a5,-48(s0)
    800070d0:	02078463          	beqz	a5,800070f8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    800070d4:	fd043703          	ld	a4,-48(s0)
    800070d8:	fb043783          	ld	a5,-80(s0)
    800070dc:	00f77e63          	bgeu	a4,a5,800070f8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    800070e0:	fd043783          	ld	a5,-48(s0)
    800070e4:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    800070e8:	fd043783          	ld	a5,-48(s0)
    800070ec:	0007b783          	ld	a5,0(a5)
    800070f0:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    800070f4:	fd9ff06f          	j	800070cc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    800070f8:	fd843783          	ld	a5,-40(s0)
    800070fc:	02079663          	bnez	a5,80007128 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    80007100:	00006797          	auipc	a5,0x6
    80007104:	de878793          	addi	a5,a5,-536 # 8000cee8 <_ZN15MemoryAllocator11usedMemHeadE>
    80007108:	0007b703          	ld	a4,0(a5)
    8000710c:	fb043783          	ld	a5,-80(s0)
    80007110:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    80007114:	00006797          	auipc	a5,0x6
    80007118:	dd478793          	addi	a5,a5,-556 # 8000cee8 <_ZN15MemoryAllocator11usedMemHeadE>
    8000711c:	fb043703          	ld	a4,-80(s0)
    80007120:	00e7b023          	sd	a4,0(a5)
    80007124:	0200006f          	j	80007144 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    80007128:	fd843783          	ld	a5,-40(s0)
    8000712c:	0007b703          	ld	a4,0(a5)
    80007130:	fb043783          	ld	a5,-80(s0)
    80007134:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    80007138:	fd843783          	ld	a5,-40(s0)
    8000713c:	fb043703          	ld	a4,-80(s0)
    80007140:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    80007144:	fb043783          	ld	a5,-80(s0)
    80007148:	0187b783          	ld	a5,24(a5)
    8000714c:	0240006f          	j	80007170 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    80007150:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80007154:	fe043783          	ld	a5,-32(s0)
    80007158:	fef43423          	sd	a5,-24(s0)
    8000715c:	fe043783          	ld	a5,-32(s0)
    80007160:	0007b783          	ld	a5,0(a5)
    80007164:	fef43023          	sd	a5,-32(s0)
    80007168:	e51ff06f          	j	80006fb8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    8000716c:	00000793          	li	a5,0
}
    80007170:	00078513          	mv	a0,a5
    80007174:	05813403          	ld	s0,88(sp)
    80007178:	06010113          	addi	sp,sp,96
    8000717c:	00008067          	ret

0000000080007180 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80007180:	fb010113          	addi	sp,sp,-80
    80007184:	04113423          	sd	ra,72(sp)
    80007188:	04813023          	sd	s0,64(sp)
    8000718c:	05010413          	addi	s0,sp,80
    80007190:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    80007194:	fb843783          	ld	a5,-72(s0)
    80007198:	00079663          	bnez	a5,800071a4 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    8000719c:	00000793          	li	a5,0
    800071a0:	1740006f          	j	80007314 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    800071a4:	00006797          	auipc	a5,0x6
    800071a8:	d4478793          	addi	a5,a5,-700 # 8000cee8 <_ZN15MemoryAllocator11usedMemHeadE>
    800071ac:	0007b783          	ld	a5,0(a5)
    800071b0:	00079663          	bnez	a5,800071bc <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    800071b4:	fff00793          	li	a5,-1
    800071b8:	15c0006f          	j	80007314 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    800071bc:	fb843783          	ld	a5,-72(s0)
    800071c0:	fe078793          	addi	a5,a5,-32
    800071c4:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    800071c8:	00006797          	auipc	a5,0x6
    800071cc:	d2078793          	addi	a5,a5,-736 # 8000cee8 <_ZN15MemoryAllocator11usedMemHeadE>
    800071d0:	0007b783          	ld	a5,0(a5)
    800071d4:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    800071d8:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    800071dc:	fe843783          	ld	a5,-24(s0)
    800071e0:	02078463          	beqz	a5,80007208 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    800071e4:	fe843703          	ld	a4,-24(s0)
    800071e8:	fb843783          	ld	a5,-72(s0)
    800071ec:	00f70e63          	beq	a4,a5,80007208 <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    800071f0:	fe843783          	ld	a5,-24(s0)
    800071f4:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    800071f8:	fe843783          	ld	a5,-24(s0)
    800071fc:	0007b783          	ld	a5,0(a5)
    80007200:	fef43423          	sd	a5,-24(s0)
    80007204:	fd9ff06f          	j	800071dc <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80007208:	fe843703          	ld	a4,-24(s0)
    8000720c:	fb843783          	ld	a5,-72(s0)
    80007210:	00f70663          	beq	a4,a5,8000721c <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80007214:	fff00793          	li	a5,-1
    80007218:	0fc0006f          	j	80007314 <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    8000721c:	fe043783          	ld	a5,-32(s0)
    80007220:	00078c63          	beqz	a5,80007238 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80007224:	fe843783          	ld	a5,-24(s0)
    80007228:	0007b703          	ld	a4,0(a5)
    8000722c:	fe043783          	ld	a5,-32(s0)
    80007230:	00e7b023          	sd	a4,0(a5)
    80007234:	0180006f          	j	8000724c <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    80007238:	fe843783          	ld	a5,-24(s0)
    8000723c:	0007b703          	ld	a4,0(a5)
    80007240:	00006797          	auipc	a5,0x6
    80007244:	ca878793          	addi	a5,a5,-856 # 8000cee8 <_ZN15MemoryAllocator11usedMemHeadE>
    80007248:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    8000724c:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    80007250:	00006797          	auipc	a5,0x6
    80007254:	ca078793          	addi	a5,a5,-864 # 8000cef0 <_ZN15MemoryAllocator11freeMemHeadE>
    80007258:	0007b783          	ld	a5,0(a5)
    8000725c:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    80007260:	fd043783          	ld	a5,-48(s0)
    80007264:	02078463          	beqz	a5,8000728c <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80007268:	fd043703          	ld	a4,-48(s0)
    8000726c:	fb843783          	ld	a5,-72(s0)
    80007270:	00f77e63          	bgeu	a4,a5,8000728c <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80007274:	fd043783          	ld	a5,-48(s0)
    80007278:	fcf43c23          	sd	a5,-40(s0)
    8000727c:	fd043783          	ld	a5,-48(s0)
    80007280:	0007b783          	ld	a5,0(a5)
    80007284:	fcf43823          	sd	a5,-48(s0)
    80007288:	fd9ff06f          	j	80007260 <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    8000728c:	fb843783          	ld	a5,-72(s0)
    80007290:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    80007294:	fb843783          	ld	a5,-72(s0)
    80007298:	0087b783          	ld	a5,8(a5)
    8000729c:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    800072a0:	fc843783          	ld	a5,-56(s0)
    800072a4:	fc043703          	ld	a4,-64(s0)
    800072a8:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    800072ac:	fd843783          	ld	a5,-40(s0)
    800072b0:	02078263          	beqz	a5,800072d4 <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    800072b4:	fd843783          	ld	a5,-40(s0)
    800072b8:	0007b703          	ld	a4,0(a5)
    800072bc:	fc843783          	ld	a5,-56(s0)
    800072c0:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    800072c4:	fd843783          	ld	a5,-40(s0)
    800072c8:	fc843703          	ld	a4,-56(s0)
    800072cc:	00e7b023          	sd	a4,0(a5)
    800072d0:	0280006f          	j	800072f8 <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    800072d4:	00006797          	auipc	a5,0x6
    800072d8:	c1c78793          	addi	a5,a5,-996 # 8000cef0 <_ZN15MemoryAllocator11freeMemHeadE>
    800072dc:	0007b703          	ld	a4,0(a5)
    800072e0:	fc843783          	ld	a5,-56(s0)
    800072e4:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    800072e8:	00006797          	auipc	a5,0x6
    800072ec:	c0878793          	addi	a5,a5,-1016 # 8000cef0 <_ZN15MemoryAllocator11freeMemHeadE>
    800072f0:	fc843703          	ld	a4,-56(s0)
    800072f4:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    800072f8:	fc843503          	ld	a0,-56(s0)
    800072fc:	00000097          	auipc	ra,0x0
    80007300:	02c080e7          	jalr	44(ra) # 80007328 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    80007304:	fd843503          	ld	a0,-40(s0)
    80007308:	00000097          	auipc	ra,0x0
    8000730c:	020080e7          	jalr	32(ra) # 80007328 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    80007310:	00000793          	li	a5,0
}
    80007314:	00078513          	mv	a0,a5
    80007318:	04813083          	ld	ra,72(sp)
    8000731c:	04013403          	ld	s0,64(sp)
    80007320:	05010113          	addi	sp,sp,80
    80007324:	00008067          	ret

0000000080007328 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80007328:	fc010113          	addi	sp,sp,-64
    8000732c:	02813c23          	sd	s0,56(sp)
    80007330:	04010413          	addi	s0,sp,64
    80007334:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    80007338:	fc843783          	ld	a5,-56(s0)
    8000733c:	00079663          	bnez	a5,80007348 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    80007340:	00000793          	li	a5,0
    80007344:	0a00006f          	j	800073e4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    80007348:	fc843783          	ld	a5,-56(s0)
    8000734c:	0007b783          	ld	a5,0(a5)
    80007350:	00f037b3          	snez	a5,a5
    80007354:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    80007358:	fc843783          	ld	a5,-56(s0)
    8000735c:	0087b783          	ld	a5,8(a5)
    80007360:	fc843703          	ld	a4,-56(s0)
    80007364:	00f707b3          	add	a5,a4,a5
    80007368:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    8000736c:	fc843783          	ld	a5,-56(s0)
    80007370:	0007b783          	ld	a5,0(a5)
    80007374:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    80007378:	fe043703          	ld	a4,-32(s0)
    8000737c:	fd843783          	ld	a5,-40(s0)
    80007380:	40f707b3          	sub	a5,a4,a5
    80007384:	0017b793          	seqz	a5,a5
    80007388:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    8000738c:	fef44783          	lbu	a5,-17(s0)
    80007390:	0ff7f793          	andi	a5,a5,255
    80007394:	04078663          	beqz	a5,800073e0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    80007398:	fd744783          	lbu	a5,-41(s0)
    8000739c:	0ff7f793          	andi	a5,a5,255
    800073a0:	04078063          	beqz	a5,800073e0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    800073a4:	fc843783          	ld	a5,-56(s0)
    800073a8:	0087b703          	ld	a4,8(a5)
    800073ac:	fc843783          	ld	a5,-56(s0)
    800073b0:	0007b783          	ld	a5,0(a5)
    800073b4:	0087b783          	ld	a5,8(a5)
    800073b8:	00f70733          	add	a4,a4,a5
    800073bc:	fc843783          	ld	a5,-56(s0)
    800073c0:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    800073c4:	fc843783          	ld	a5,-56(s0)
    800073c8:	0007b783          	ld	a5,0(a5)
    800073cc:	0007b703          	ld	a4,0(a5)
    800073d0:	fc843783          	ld	a5,-56(s0)
    800073d4:	00e7b023          	sd	a4,0(a5)
        return 1;
    800073d8:	00100793          	li	a5,1
    800073dc:	0080006f          	j	800073e4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    800073e0:	00000793          	li	a5,0
}
    800073e4:	00078513          	mv	a0,a5
    800073e8:	03813403          	ld	s0,56(sp)
    800073ec:	04010113          	addi	sp,sp,64
    800073f0:	00008067          	ret

00000000800073f4 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    800073f4:	fe010113          	addi	sp,sp,-32
    800073f8:	00813c23          	sd	s0,24(sp)
    800073fc:	02010413          	addi	s0,sp,32
    80007400:	fea43423          	sd	a0,-24(s0)
    80007404:	00058793          	mv	a5,a1
    80007408:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    8000740c:	fe843783          	ld	a5,-24(s0)
    80007410:	fe078793          	addi	a5,a5,-32
    80007414:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    80007418:	fe843783          	ld	a5,-24(s0)
    8000741c:	0107a703          	lw	a4,16(a5)
    80007420:	fe442783          	lw	a5,-28(s0)
    80007424:	0007879b          	sext.w	a5,a5
    80007428:	40e787b3          	sub	a5,a5,a4
    8000742c:	0017b793          	seqz	a5,a5
    80007430:	0ff7f793          	andi	a5,a5,255
}
    80007434:	00078513          	mv	a0,a5
    80007438:	01813403          	ld	s0,24(sp)
    8000743c:	02010113          	addi	sp,sp,32
    80007440:	00008067          	ret

0000000080007444 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    80007444:	ff010113          	addi	sp,sp,-16
    80007448:	00813423          	sd	s0,8(sp)
    8000744c:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    80007450:	00006797          	auipc	a5,0x6
    80007454:	aa878793          	addi	a5,a5,-1368 # 8000cef8 <_ZN15MemoryAllocator11initializedE>
    80007458:	0007c783          	lbu	a5,0(a5)
    8000745c:	0017c793          	xori	a5,a5,1
    80007460:	0ff7f793          	andi	a5,a5,255
    80007464:	06078a63          	beqz	a5,800074d8 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    80007468:	00006797          	auipc	a5,0x6
    8000746c:	8787b783          	ld	a5,-1928(a5) # 8000cce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80007470:	0007b703          	ld	a4,0(a5)
    80007474:	00006797          	auipc	a5,0x6
    80007478:	a7c78793          	addi	a5,a5,-1412 # 8000cef0 <_ZN15MemoryAllocator11freeMemHeadE>
    8000747c:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    80007480:	00006797          	auipc	a5,0x6
    80007484:	a7078793          	addi	a5,a5,-1424 # 8000cef0 <_ZN15MemoryAllocator11freeMemHeadE>
    80007488:	0007b783          	ld	a5,0(a5)
    8000748c:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    80007490:	00006797          	auipc	a5,0x6
    80007494:	8987b783          	ld	a5,-1896(a5) # 8000cd28 <_GLOBAL_OFFSET_TABLE_+0x70>
    80007498:	0007b703          	ld	a4,0(a5)
    8000749c:	00006797          	auipc	a5,0x6
    800074a0:	8447b783          	ld	a5,-1980(a5) # 8000cce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800074a4:	0007b783          	ld	a5,0(a5)
    800074a8:	40f70733          	sub	a4,a4,a5
    800074ac:	00006797          	auipc	a5,0x6
    800074b0:	a4478793          	addi	a5,a5,-1468 # 8000cef0 <_ZN15MemoryAllocator11freeMemHeadE>
    800074b4:	0007b783          	ld	a5,0(a5)
    800074b8:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    800074bc:	00006797          	auipc	a5,0x6
    800074c0:	a2c78793          	addi	a5,a5,-1492 # 8000cee8 <_ZN15MemoryAllocator11usedMemHeadE>
    800074c4:	0007b023          	sd	zero,0(a5)

        initialized = true;
    800074c8:	00006797          	auipc	a5,0x6
    800074cc:	a3078793          	addi	a5,a5,-1488 # 8000cef8 <_ZN15MemoryAllocator11initializedE>
    800074d0:	00100713          	li	a4,1
    800074d4:	00e78023          	sb	a4,0(a5)
    }
}
    800074d8:	00000013          	nop
    800074dc:	00813403          	ld	s0,8(sp)
    800074e0:	01010113          	addi	sp,sp,16
    800074e4:	00008067          	ret

00000000800074e8 <start>:
    800074e8:	ff010113          	addi	sp,sp,-16
    800074ec:	00813423          	sd	s0,8(sp)
    800074f0:	01010413          	addi	s0,sp,16
    800074f4:	300027f3          	csrr	a5,mstatus
    800074f8:	ffffe737          	lui	a4,0xffffe
    800074fc:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff069f>
    80007500:	00e7f7b3          	and	a5,a5,a4
    80007504:	00001737          	lui	a4,0x1
    80007508:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    8000750c:	00e7e7b3          	or	a5,a5,a4
    80007510:	30079073          	csrw	mstatus,a5
    80007514:	00000797          	auipc	a5,0x0
    80007518:	16078793          	addi	a5,a5,352 # 80007674 <system_main>
    8000751c:	34179073          	csrw	mepc,a5
    80007520:	00000793          	li	a5,0
    80007524:	18079073          	csrw	satp,a5
    80007528:	000107b7          	lui	a5,0x10
    8000752c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007530:	30279073          	csrw	medeleg,a5
    80007534:	30379073          	csrw	mideleg,a5
    80007538:	104027f3          	csrr	a5,sie
    8000753c:	2227e793          	ori	a5,a5,546
    80007540:	10479073          	csrw	sie,a5
    80007544:	fff00793          	li	a5,-1
    80007548:	00a7d793          	srli	a5,a5,0xa
    8000754c:	3b079073          	csrw	pmpaddr0,a5
    80007550:	00f00793          	li	a5,15
    80007554:	3a079073          	csrw	pmpcfg0,a5
    80007558:	f14027f3          	csrr	a5,mhartid
    8000755c:	0200c737          	lui	a4,0x200c
    80007560:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007564:	0007869b          	sext.w	a3,a5
    80007568:	00269713          	slli	a4,a3,0x2
    8000756c:	000f4637          	lui	a2,0xf4
    80007570:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007574:	00d70733          	add	a4,a4,a3
    80007578:	0037979b          	slliw	a5,a5,0x3
    8000757c:	020046b7          	lui	a3,0x2004
    80007580:	00d787b3          	add	a5,a5,a3
    80007584:	00c585b3          	add	a1,a1,a2
    80007588:	00371693          	slli	a3,a4,0x3
    8000758c:	00006717          	auipc	a4,0x6
    80007590:	97470713          	addi	a4,a4,-1676 # 8000cf00 <timer_scratch>
    80007594:	00b7b023          	sd	a1,0(a5)
    80007598:	00d70733          	add	a4,a4,a3
    8000759c:	00f73c23          	sd	a5,24(a4)
    800075a0:	02c73023          	sd	a2,32(a4)
    800075a4:	34071073          	csrw	mscratch,a4
    800075a8:	00000797          	auipc	a5,0x0
    800075ac:	6e878793          	addi	a5,a5,1768 # 80007c90 <timervec>
    800075b0:	30579073          	csrw	mtvec,a5
    800075b4:	300027f3          	csrr	a5,mstatus
    800075b8:	0087e793          	ori	a5,a5,8
    800075bc:	30079073          	csrw	mstatus,a5
    800075c0:	304027f3          	csrr	a5,mie
    800075c4:	0807e793          	ori	a5,a5,128
    800075c8:	30479073          	csrw	mie,a5
    800075cc:	f14027f3          	csrr	a5,mhartid
    800075d0:	0007879b          	sext.w	a5,a5
    800075d4:	00078213          	mv	tp,a5
    800075d8:	30200073          	mret
    800075dc:	00813403          	ld	s0,8(sp)
    800075e0:	01010113          	addi	sp,sp,16
    800075e4:	00008067          	ret

00000000800075e8 <timerinit>:
    800075e8:	ff010113          	addi	sp,sp,-16
    800075ec:	00813423          	sd	s0,8(sp)
    800075f0:	01010413          	addi	s0,sp,16
    800075f4:	f14027f3          	csrr	a5,mhartid
    800075f8:	0200c737          	lui	a4,0x200c
    800075fc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007600:	0007869b          	sext.w	a3,a5
    80007604:	00269713          	slli	a4,a3,0x2
    80007608:	000f4637          	lui	a2,0xf4
    8000760c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007610:	00d70733          	add	a4,a4,a3
    80007614:	0037979b          	slliw	a5,a5,0x3
    80007618:	020046b7          	lui	a3,0x2004
    8000761c:	00d787b3          	add	a5,a5,a3
    80007620:	00c585b3          	add	a1,a1,a2
    80007624:	00371693          	slli	a3,a4,0x3
    80007628:	00006717          	auipc	a4,0x6
    8000762c:	8d870713          	addi	a4,a4,-1832 # 8000cf00 <timer_scratch>
    80007630:	00b7b023          	sd	a1,0(a5)
    80007634:	00d70733          	add	a4,a4,a3
    80007638:	00f73c23          	sd	a5,24(a4)
    8000763c:	02c73023          	sd	a2,32(a4)
    80007640:	34071073          	csrw	mscratch,a4
    80007644:	00000797          	auipc	a5,0x0
    80007648:	64c78793          	addi	a5,a5,1612 # 80007c90 <timervec>
    8000764c:	30579073          	csrw	mtvec,a5
    80007650:	300027f3          	csrr	a5,mstatus
    80007654:	0087e793          	ori	a5,a5,8
    80007658:	30079073          	csrw	mstatus,a5
    8000765c:	304027f3          	csrr	a5,mie
    80007660:	0807e793          	ori	a5,a5,128
    80007664:	30479073          	csrw	mie,a5
    80007668:	00813403          	ld	s0,8(sp)
    8000766c:	01010113          	addi	sp,sp,16
    80007670:	00008067          	ret

0000000080007674 <system_main>:
    80007674:	fe010113          	addi	sp,sp,-32
    80007678:	00813823          	sd	s0,16(sp)
    8000767c:	00913423          	sd	s1,8(sp)
    80007680:	00113c23          	sd	ra,24(sp)
    80007684:	02010413          	addi	s0,sp,32
    80007688:	00000097          	auipc	ra,0x0
    8000768c:	0c4080e7          	jalr	196(ra) # 8000774c <cpuid>
    80007690:	00005497          	auipc	s1,0x5
    80007694:	6d048493          	addi	s1,s1,1744 # 8000cd60 <started>
    80007698:	02050263          	beqz	a0,800076bc <system_main+0x48>
    8000769c:	0004a783          	lw	a5,0(s1)
    800076a0:	0007879b          	sext.w	a5,a5
    800076a4:	fe078ce3          	beqz	a5,8000769c <system_main+0x28>
    800076a8:	0ff0000f          	fence
    800076ac:	00003517          	auipc	a0,0x3
    800076b0:	08450513          	addi	a0,a0,132 # 8000a730 <_ZZ9kPrintIntmE6digits+0x6c0>
    800076b4:	00001097          	auipc	ra,0x1
    800076b8:	a78080e7          	jalr	-1416(ra) # 8000812c <panic>
    800076bc:	00001097          	auipc	ra,0x1
    800076c0:	9cc080e7          	jalr	-1588(ra) # 80008088 <consoleinit>
    800076c4:	00001097          	auipc	ra,0x1
    800076c8:	158080e7          	jalr	344(ra) # 8000881c <printfinit>
    800076cc:	00003517          	auipc	a0,0x3
    800076d0:	eec50513          	addi	a0,a0,-276 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800076d4:	00001097          	auipc	ra,0x1
    800076d8:	ab4080e7          	jalr	-1356(ra) # 80008188 <__printf>
    800076dc:	00003517          	auipc	a0,0x3
    800076e0:	02450513          	addi	a0,a0,36 # 8000a700 <_ZZ9kPrintIntmE6digits+0x690>
    800076e4:	00001097          	auipc	ra,0x1
    800076e8:	aa4080e7          	jalr	-1372(ra) # 80008188 <__printf>
    800076ec:	00003517          	auipc	a0,0x3
    800076f0:	ecc50513          	addi	a0,a0,-308 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800076f4:	00001097          	auipc	ra,0x1
    800076f8:	a94080e7          	jalr	-1388(ra) # 80008188 <__printf>
    800076fc:	00001097          	auipc	ra,0x1
    80007700:	4ac080e7          	jalr	1196(ra) # 80008ba8 <kinit>
    80007704:	00000097          	auipc	ra,0x0
    80007708:	148080e7          	jalr	328(ra) # 8000784c <trapinit>
    8000770c:	00000097          	auipc	ra,0x0
    80007710:	16c080e7          	jalr	364(ra) # 80007878 <trapinithart>
    80007714:	00000097          	auipc	ra,0x0
    80007718:	5bc080e7          	jalr	1468(ra) # 80007cd0 <plicinit>
    8000771c:	00000097          	auipc	ra,0x0
    80007720:	5dc080e7          	jalr	1500(ra) # 80007cf8 <plicinithart>
    80007724:	00000097          	auipc	ra,0x0
    80007728:	078080e7          	jalr	120(ra) # 8000779c <userinit>
    8000772c:	0ff0000f          	fence
    80007730:	00100793          	li	a5,1
    80007734:	00003517          	auipc	a0,0x3
    80007738:	fe450513          	addi	a0,a0,-28 # 8000a718 <_ZZ9kPrintIntmE6digits+0x6a8>
    8000773c:	00f4a023          	sw	a5,0(s1)
    80007740:	00001097          	auipc	ra,0x1
    80007744:	a48080e7          	jalr	-1464(ra) # 80008188 <__printf>
    80007748:	0000006f          	j	80007748 <system_main+0xd4>

000000008000774c <cpuid>:
    8000774c:	ff010113          	addi	sp,sp,-16
    80007750:	00813423          	sd	s0,8(sp)
    80007754:	01010413          	addi	s0,sp,16
    80007758:	00020513          	mv	a0,tp
    8000775c:	00813403          	ld	s0,8(sp)
    80007760:	0005051b          	sext.w	a0,a0
    80007764:	01010113          	addi	sp,sp,16
    80007768:	00008067          	ret

000000008000776c <mycpu>:
    8000776c:	ff010113          	addi	sp,sp,-16
    80007770:	00813423          	sd	s0,8(sp)
    80007774:	01010413          	addi	s0,sp,16
    80007778:	00020793          	mv	a5,tp
    8000777c:	00813403          	ld	s0,8(sp)
    80007780:	0007879b          	sext.w	a5,a5
    80007784:	00779793          	slli	a5,a5,0x7
    80007788:	00006517          	auipc	a0,0x6
    8000778c:	7a850513          	addi	a0,a0,1960 # 8000df30 <cpus>
    80007790:	00f50533          	add	a0,a0,a5
    80007794:	01010113          	addi	sp,sp,16
    80007798:	00008067          	ret

000000008000779c <userinit>:
    8000779c:	ff010113          	addi	sp,sp,-16
    800077a0:	00813423          	sd	s0,8(sp)
    800077a4:	01010413          	addi	s0,sp,16
    800077a8:	00813403          	ld	s0,8(sp)
    800077ac:	01010113          	addi	sp,sp,16
    800077b0:	ffffa317          	auipc	t1,0xffffa
    800077b4:	7b430067          	jr	1972(t1) # 80001f64 <main>

00000000800077b8 <either_copyout>:
    800077b8:	ff010113          	addi	sp,sp,-16
    800077bc:	00813023          	sd	s0,0(sp)
    800077c0:	00113423          	sd	ra,8(sp)
    800077c4:	01010413          	addi	s0,sp,16
    800077c8:	02051663          	bnez	a0,800077f4 <either_copyout+0x3c>
    800077cc:	00058513          	mv	a0,a1
    800077d0:	00060593          	mv	a1,a2
    800077d4:	0006861b          	sext.w	a2,a3
    800077d8:	00002097          	auipc	ra,0x2
    800077dc:	c5c080e7          	jalr	-932(ra) # 80009434 <__memmove>
    800077e0:	00813083          	ld	ra,8(sp)
    800077e4:	00013403          	ld	s0,0(sp)
    800077e8:	00000513          	li	a0,0
    800077ec:	01010113          	addi	sp,sp,16
    800077f0:	00008067          	ret
    800077f4:	00003517          	auipc	a0,0x3
    800077f8:	f6450513          	addi	a0,a0,-156 # 8000a758 <_ZZ9kPrintIntmE6digits+0x6e8>
    800077fc:	00001097          	auipc	ra,0x1
    80007800:	930080e7          	jalr	-1744(ra) # 8000812c <panic>

0000000080007804 <either_copyin>:
    80007804:	ff010113          	addi	sp,sp,-16
    80007808:	00813023          	sd	s0,0(sp)
    8000780c:	00113423          	sd	ra,8(sp)
    80007810:	01010413          	addi	s0,sp,16
    80007814:	02059463          	bnez	a1,8000783c <either_copyin+0x38>
    80007818:	00060593          	mv	a1,a2
    8000781c:	0006861b          	sext.w	a2,a3
    80007820:	00002097          	auipc	ra,0x2
    80007824:	c14080e7          	jalr	-1004(ra) # 80009434 <__memmove>
    80007828:	00813083          	ld	ra,8(sp)
    8000782c:	00013403          	ld	s0,0(sp)
    80007830:	00000513          	li	a0,0
    80007834:	01010113          	addi	sp,sp,16
    80007838:	00008067          	ret
    8000783c:	00003517          	auipc	a0,0x3
    80007840:	f4450513          	addi	a0,a0,-188 # 8000a780 <_ZZ9kPrintIntmE6digits+0x710>
    80007844:	00001097          	auipc	ra,0x1
    80007848:	8e8080e7          	jalr	-1816(ra) # 8000812c <panic>

000000008000784c <trapinit>:
    8000784c:	ff010113          	addi	sp,sp,-16
    80007850:	00813423          	sd	s0,8(sp)
    80007854:	01010413          	addi	s0,sp,16
    80007858:	00813403          	ld	s0,8(sp)
    8000785c:	00003597          	auipc	a1,0x3
    80007860:	f4c58593          	addi	a1,a1,-180 # 8000a7a8 <_ZZ9kPrintIntmE6digits+0x738>
    80007864:	00006517          	auipc	a0,0x6
    80007868:	74c50513          	addi	a0,a0,1868 # 8000dfb0 <tickslock>
    8000786c:	01010113          	addi	sp,sp,16
    80007870:	00001317          	auipc	t1,0x1
    80007874:	5c830067          	jr	1480(t1) # 80008e38 <initlock>

0000000080007878 <trapinithart>:
    80007878:	ff010113          	addi	sp,sp,-16
    8000787c:	00813423          	sd	s0,8(sp)
    80007880:	01010413          	addi	s0,sp,16
    80007884:	00000797          	auipc	a5,0x0
    80007888:	2fc78793          	addi	a5,a5,764 # 80007b80 <kernelvec>
    8000788c:	10579073          	csrw	stvec,a5
    80007890:	00813403          	ld	s0,8(sp)
    80007894:	01010113          	addi	sp,sp,16
    80007898:	00008067          	ret

000000008000789c <usertrap>:
    8000789c:	ff010113          	addi	sp,sp,-16
    800078a0:	00813423          	sd	s0,8(sp)
    800078a4:	01010413          	addi	s0,sp,16
    800078a8:	00813403          	ld	s0,8(sp)
    800078ac:	01010113          	addi	sp,sp,16
    800078b0:	00008067          	ret

00000000800078b4 <usertrapret>:
    800078b4:	ff010113          	addi	sp,sp,-16
    800078b8:	00813423          	sd	s0,8(sp)
    800078bc:	01010413          	addi	s0,sp,16
    800078c0:	00813403          	ld	s0,8(sp)
    800078c4:	01010113          	addi	sp,sp,16
    800078c8:	00008067          	ret

00000000800078cc <kerneltrap>:
    800078cc:	fe010113          	addi	sp,sp,-32
    800078d0:	00813823          	sd	s0,16(sp)
    800078d4:	00113c23          	sd	ra,24(sp)
    800078d8:	00913423          	sd	s1,8(sp)
    800078dc:	02010413          	addi	s0,sp,32
    800078e0:	142025f3          	csrr	a1,scause
    800078e4:	100027f3          	csrr	a5,sstatus
    800078e8:	0027f793          	andi	a5,a5,2
    800078ec:	10079c63          	bnez	a5,80007a04 <kerneltrap+0x138>
    800078f0:	142027f3          	csrr	a5,scause
    800078f4:	0207ce63          	bltz	a5,80007930 <kerneltrap+0x64>
    800078f8:	00003517          	auipc	a0,0x3
    800078fc:	ef850513          	addi	a0,a0,-264 # 8000a7f0 <_ZZ9kPrintIntmE6digits+0x780>
    80007900:	00001097          	auipc	ra,0x1
    80007904:	888080e7          	jalr	-1912(ra) # 80008188 <__printf>
    80007908:	141025f3          	csrr	a1,sepc
    8000790c:	14302673          	csrr	a2,stval
    80007910:	00003517          	auipc	a0,0x3
    80007914:	ef050513          	addi	a0,a0,-272 # 8000a800 <_ZZ9kPrintIntmE6digits+0x790>
    80007918:	00001097          	auipc	ra,0x1
    8000791c:	870080e7          	jalr	-1936(ra) # 80008188 <__printf>
    80007920:	00003517          	auipc	a0,0x3
    80007924:	ef850513          	addi	a0,a0,-264 # 8000a818 <_ZZ9kPrintIntmE6digits+0x7a8>
    80007928:	00001097          	auipc	ra,0x1
    8000792c:	804080e7          	jalr	-2044(ra) # 8000812c <panic>
    80007930:	0ff7f713          	andi	a4,a5,255
    80007934:	00900693          	li	a3,9
    80007938:	04d70063          	beq	a4,a3,80007978 <kerneltrap+0xac>
    8000793c:	fff00713          	li	a4,-1
    80007940:	03f71713          	slli	a4,a4,0x3f
    80007944:	00170713          	addi	a4,a4,1
    80007948:	fae798e3          	bne	a5,a4,800078f8 <kerneltrap+0x2c>
    8000794c:	00000097          	auipc	ra,0x0
    80007950:	e00080e7          	jalr	-512(ra) # 8000774c <cpuid>
    80007954:	06050663          	beqz	a0,800079c0 <kerneltrap+0xf4>
    80007958:	144027f3          	csrr	a5,sip
    8000795c:	ffd7f793          	andi	a5,a5,-3
    80007960:	14479073          	csrw	sip,a5
    80007964:	01813083          	ld	ra,24(sp)
    80007968:	01013403          	ld	s0,16(sp)
    8000796c:	00813483          	ld	s1,8(sp)
    80007970:	02010113          	addi	sp,sp,32
    80007974:	00008067          	ret
    80007978:	00000097          	auipc	ra,0x0
    8000797c:	3cc080e7          	jalr	972(ra) # 80007d44 <plic_claim>
    80007980:	00a00793          	li	a5,10
    80007984:	00050493          	mv	s1,a0
    80007988:	06f50863          	beq	a0,a5,800079f8 <kerneltrap+0x12c>
    8000798c:	fc050ce3          	beqz	a0,80007964 <kerneltrap+0x98>
    80007990:	00050593          	mv	a1,a0
    80007994:	00003517          	auipc	a0,0x3
    80007998:	e3c50513          	addi	a0,a0,-452 # 8000a7d0 <_ZZ9kPrintIntmE6digits+0x760>
    8000799c:	00000097          	auipc	ra,0x0
    800079a0:	7ec080e7          	jalr	2028(ra) # 80008188 <__printf>
    800079a4:	01013403          	ld	s0,16(sp)
    800079a8:	01813083          	ld	ra,24(sp)
    800079ac:	00048513          	mv	a0,s1
    800079b0:	00813483          	ld	s1,8(sp)
    800079b4:	02010113          	addi	sp,sp,32
    800079b8:	00000317          	auipc	t1,0x0
    800079bc:	3c430067          	jr	964(t1) # 80007d7c <plic_complete>
    800079c0:	00006517          	auipc	a0,0x6
    800079c4:	5f050513          	addi	a0,a0,1520 # 8000dfb0 <tickslock>
    800079c8:	00001097          	auipc	ra,0x1
    800079cc:	494080e7          	jalr	1172(ra) # 80008e5c <acquire>
    800079d0:	00005717          	auipc	a4,0x5
    800079d4:	39470713          	addi	a4,a4,916 # 8000cd64 <ticks>
    800079d8:	00072783          	lw	a5,0(a4)
    800079dc:	00006517          	auipc	a0,0x6
    800079e0:	5d450513          	addi	a0,a0,1492 # 8000dfb0 <tickslock>
    800079e4:	0017879b          	addiw	a5,a5,1
    800079e8:	00f72023          	sw	a5,0(a4)
    800079ec:	00001097          	auipc	ra,0x1
    800079f0:	53c080e7          	jalr	1340(ra) # 80008f28 <release>
    800079f4:	f65ff06f          	j	80007958 <kerneltrap+0x8c>
    800079f8:	00001097          	auipc	ra,0x1
    800079fc:	098080e7          	jalr	152(ra) # 80008a90 <uartintr>
    80007a00:	fa5ff06f          	j	800079a4 <kerneltrap+0xd8>
    80007a04:	00003517          	auipc	a0,0x3
    80007a08:	dac50513          	addi	a0,a0,-596 # 8000a7b0 <_ZZ9kPrintIntmE6digits+0x740>
    80007a0c:	00000097          	auipc	ra,0x0
    80007a10:	720080e7          	jalr	1824(ra) # 8000812c <panic>

0000000080007a14 <clockintr>:
    80007a14:	fe010113          	addi	sp,sp,-32
    80007a18:	00813823          	sd	s0,16(sp)
    80007a1c:	00913423          	sd	s1,8(sp)
    80007a20:	00113c23          	sd	ra,24(sp)
    80007a24:	02010413          	addi	s0,sp,32
    80007a28:	00006497          	auipc	s1,0x6
    80007a2c:	58848493          	addi	s1,s1,1416 # 8000dfb0 <tickslock>
    80007a30:	00048513          	mv	a0,s1
    80007a34:	00001097          	auipc	ra,0x1
    80007a38:	428080e7          	jalr	1064(ra) # 80008e5c <acquire>
    80007a3c:	00005717          	auipc	a4,0x5
    80007a40:	32870713          	addi	a4,a4,808 # 8000cd64 <ticks>
    80007a44:	00072783          	lw	a5,0(a4)
    80007a48:	01013403          	ld	s0,16(sp)
    80007a4c:	01813083          	ld	ra,24(sp)
    80007a50:	00048513          	mv	a0,s1
    80007a54:	0017879b          	addiw	a5,a5,1
    80007a58:	00813483          	ld	s1,8(sp)
    80007a5c:	00f72023          	sw	a5,0(a4)
    80007a60:	02010113          	addi	sp,sp,32
    80007a64:	00001317          	auipc	t1,0x1
    80007a68:	4c430067          	jr	1220(t1) # 80008f28 <release>

0000000080007a6c <devintr>:
    80007a6c:	142027f3          	csrr	a5,scause
    80007a70:	00000513          	li	a0,0
    80007a74:	0007c463          	bltz	a5,80007a7c <devintr+0x10>
    80007a78:	00008067          	ret
    80007a7c:	fe010113          	addi	sp,sp,-32
    80007a80:	00813823          	sd	s0,16(sp)
    80007a84:	00113c23          	sd	ra,24(sp)
    80007a88:	00913423          	sd	s1,8(sp)
    80007a8c:	02010413          	addi	s0,sp,32
    80007a90:	0ff7f713          	andi	a4,a5,255
    80007a94:	00900693          	li	a3,9
    80007a98:	04d70c63          	beq	a4,a3,80007af0 <devintr+0x84>
    80007a9c:	fff00713          	li	a4,-1
    80007aa0:	03f71713          	slli	a4,a4,0x3f
    80007aa4:	00170713          	addi	a4,a4,1
    80007aa8:	00e78c63          	beq	a5,a4,80007ac0 <devintr+0x54>
    80007aac:	01813083          	ld	ra,24(sp)
    80007ab0:	01013403          	ld	s0,16(sp)
    80007ab4:	00813483          	ld	s1,8(sp)
    80007ab8:	02010113          	addi	sp,sp,32
    80007abc:	00008067          	ret
    80007ac0:	00000097          	auipc	ra,0x0
    80007ac4:	c8c080e7          	jalr	-884(ra) # 8000774c <cpuid>
    80007ac8:	06050663          	beqz	a0,80007b34 <devintr+0xc8>
    80007acc:	144027f3          	csrr	a5,sip
    80007ad0:	ffd7f793          	andi	a5,a5,-3
    80007ad4:	14479073          	csrw	sip,a5
    80007ad8:	01813083          	ld	ra,24(sp)
    80007adc:	01013403          	ld	s0,16(sp)
    80007ae0:	00813483          	ld	s1,8(sp)
    80007ae4:	00200513          	li	a0,2
    80007ae8:	02010113          	addi	sp,sp,32
    80007aec:	00008067          	ret
    80007af0:	00000097          	auipc	ra,0x0
    80007af4:	254080e7          	jalr	596(ra) # 80007d44 <plic_claim>
    80007af8:	00a00793          	li	a5,10
    80007afc:	00050493          	mv	s1,a0
    80007b00:	06f50663          	beq	a0,a5,80007b6c <devintr+0x100>
    80007b04:	00100513          	li	a0,1
    80007b08:	fa0482e3          	beqz	s1,80007aac <devintr+0x40>
    80007b0c:	00048593          	mv	a1,s1
    80007b10:	00003517          	auipc	a0,0x3
    80007b14:	cc050513          	addi	a0,a0,-832 # 8000a7d0 <_ZZ9kPrintIntmE6digits+0x760>
    80007b18:	00000097          	auipc	ra,0x0
    80007b1c:	670080e7          	jalr	1648(ra) # 80008188 <__printf>
    80007b20:	00048513          	mv	a0,s1
    80007b24:	00000097          	auipc	ra,0x0
    80007b28:	258080e7          	jalr	600(ra) # 80007d7c <plic_complete>
    80007b2c:	00100513          	li	a0,1
    80007b30:	f7dff06f          	j	80007aac <devintr+0x40>
    80007b34:	00006517          	auipc	a0,0x6
    80007b38:	47c50513          	addi	a0,a0,1148 # 8000dfb0 <tickslock>
    80007b3c:	00001097          	auipc	ra,0x1
    80007b40:	320080e7          	jalr	800(ra) # 80008e5c <acquire>
    80007b44:	00005717          	auipc	a4,0x5
    80007b48:	22070713          	addi	a4,a4,544 # 8000cd64 <ticks>
    80007b4c:	00072783          	lw	a5,0(a4)
    80007b50:	00006517          	auipc	a0,0x6
    80007b54:	46050513          	addi	a0,a0,1120 # 8000dfb0 <tickslock>
    80007b58:	0017879b          	addiw	a5,a5,1
    80007b5c:	00f72023          	sw	a5,0(a4)
    80007b60:	00001097          	auipc	ra,0x1
    80007b64:	3c8080e7          	jalr	968(ra) # 80008f28 <release>
    80007b68:	f65ff06f          	j	80007acc <devintr+0x60>
    80007b6c:	00001097          	auipc	ra,0x1
    80007b70:	f24080e7          	jalr	-220(ra) # 80008a90 <uartintr>
    80007b74:	fadff06f          	j	80007b20 <devintr+0xb4>
	...

0000000080007b80 <kernelvec>:
    80007b80:	f0010113          	addi	sp,sp,-256
    80007b84:	00113023          	sd	ra,0(sp)
    80007b88:	00213423          	sd	sp,8(sp)
    80007b8c:	00313823          	sd	gp,16(sp)
    80007b90:	00413c23          	sd	tp,24(sp)
    80007b94:	02513023          	sd	t0,32(sp)
    80007b98:	02613423          	sd	t1,40(sp)
    80007b9c:	02713823          	sd	t2,48(sp)
    80007ba0:	02813c23          	sd	s0,56(sp)
    80007ba4:	04913023          	sd	s1,64(sp)
    80007ba8:	04a13423          	sd	a0,72(sp)
    80007bac:	04b13823          	sd	a1,80(sp)
    80007bb0:	04c13c23          	sd	a2,88(sp)
    80007bb4:	06d13023          	sd	a3,96(sp)
    80007bb8:	06e13423          	sd	a4,104(sp)
    80007bbc:	06f13823          	sd	a5,112(sp)
    80007bc0:	07013c23          	sd	a6,120(sp)
    80007bc4:	09113023          	sd	a7,128(sp)
    80007bc8:	09213423          	sd	s2,136(sp)
    80007bcc:	09313823          	sd	s3,144(sp)
    80007bd0:	09413c23          	sd	s4,152(sp)
    80007bd4:	0b513023          	sd	s5,160(sp)
    80007bd8:	0b613423          	sd	s6,168(sp)
    80007bdc:	0b713823          	sd	s7,176(sp)
    80007be0:	0b813c23          	sd	s8,184(sp)
    80007be4:	0d913023          	sd	s9,192(sp)
    80007be8:	0da13423          	sd	s10,200(sp)
    80007bec:	0db13823          	sd	s11,208(sp)
    80007bf0:	0dc13c23          	sd	t3,216(sp)
    80007bf4:	0fd13023          	sd	t4,224(sp)
    80007bf8:	0fe13423          	sd	t5,232(sp)
    80007bfc:	0ff13823          	sd	t6,240(sp)
    80007c00:	ccdff0ef          	jal	ra,800078cc <kerneltrap>
    80007c04:	00013083          	ld	ra,0(sp)
    80007c08:	00813103          	ld	sp,8(sp)
    80007c0c:	01013183          	ld	gp,16(sp)
    80007c10:	02013283          	ld	t0,32(sp)
    80007c14:	02813303          	ld	t1,40(sp)
    80007c18:	03013383          	ld	t2,48(sp)
    80007c1c:	03813403          	ld	s0,56(sp)
    80007c20:	04013483          	ld	s1,64(sp)
    80007c24:	04813503          	ld	a0,72(sp)
    80007c28:	05013583          	ld	a1,80(sp)
    80007c2c:	05813603          	ld	a2,88(sp)
    80007c30:	06013683          	ld	a3,96(sp)
    80007c34:	06813703          	ld	a4,104(sp)
    80007c38:	07013783          	ld	a5,112(sp)
    80007c3c:	07813803          	ld	a6,120(sp)
    80007c40:	08013883          	ld	a7,128(sp)
    80007c44:	08813903          	ld	s2,136(sp)
    80007c48:	09013983          	ld	s3,144(sp)
    80007c4c:	09813a03          	ld	s4,152(sp)
    80007c50:	0a013a83          	ld	s5,160(sp)
    80007c54:	0a813b03          	ld	s6,168(sp)
    80007c58:	0b013b83          	ld	s7,176(sp)
    80007c5c:	0b813c03          	ld	s8,184(sp)
    80007c60:	0c013c83          	ld	s9,192(sp)
    80007c64:	0c813d03          	ld	s10,200(sp)
    80007c68:	0d013d83          	ld	s11,208(sp)
    80007c6c:	0d813e03          	ld	t3,216(sp)
    80007c70:	0e013e83          	ld	t4,224(sp)
    80007c74:	0e813f03          	ld	t5,232(sp)
    80007c78:	0f013f83          	ld	t6,240(sp)
    80007c7c:	10010113          	addi	sp,sp,256
    80007c80:	10200073          	sret
    80007c84:	00000013          	nop
    80007c88:	00000013          	nop
    80007c8c:	00000013          	nop

0000000080007c90 <timervec>:
    80007c90:	34051573          	csrrw	a0,mscratch,a0
    80007c94:	00b53023          	sd	a1,0(a0)
    80007c98:	00c53423          	sd	a2,8(a0)
    80007c9c:	00d53823          	sd	a3,16(a0)
    80007ca0:	01853583          	ld	a1,24(a0)
    80007ca4:	02053603          	ld	a2,32(a0)
    80007ca8:	0005b683          	ld	a3,0(a1)
    80007cac:	00c686b3          	add	a3,a3,a2
    80007cb0:	00d5b023          	sd	a3,0(a1)
    80007cb4:	00200593          	li	a1,2
    80007cb8:	14459073          	csrw	sip,a1
    80007cbc:	01053683          	ld	a3,16(a0)
    80007cc0:	00853603          	ld	a2,8(a0)
    80007cc4:	00053583          	ld	a1,0(a0)
    80007cc8:	34051573          	csrrw	a0,mscratch,a0
    80007ccc:	30200073          	mret

0000000080007cd0 <plicinit>:
    80007cd0:	ff010113          	addi	sp,sp,-16
    80007cd4:	00813423          	sd	s0,8(sp)
    80007cd8:	01010413          	addi	s0,sp,16
    80007cdc:	00813403          	ld	s0,8(sp)
    80007ce0:	0c0007b7          	lui	a5,0xc000
    80007ce4:	00100713          	li	a4,1
    80007ce8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80007cec:	00e7a223          	sw	a4,4(a5)
    80007cf0:	01010113          	addi	sp,sp,16
    80007cf4:	00008067          	ret

0000000080007cf8 <plicinithart>:
    80007cf8:	ff010113          	addi	sp,sp,-16
    80007cfc:	00813023          	sd	s0,0(sp)
    80007d00:	00113423          	sd	ra,8(sp)
    80007d04:	01010413          	addi	s0,sp,16
    80007d08:	00000097          	auipc	ra,0x0
    80007d0c:	a44080e7          	jalr	-1468(ra) # 8000774c <cpuid>
    80007d10:	0085171b          	slliw	a4,a0,0x8
    80007d14:	0c0027b7          	lui	a5,0xc002
    80007d18:	00e787b3          	add	a5,a5,a4
    80007d1c:	40200713          	li	a4,1026
    80007d20:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007d24:	00813083          	ld	ra,8(sp)
    80007d28:	00013403          	ld	s0,0(sp)
    80007d2c:	00d5151b          	slliw	a0,a0,0xd
    80007d30:	0c2017b7          	lui	a5,0xc201
    80007d34:	00a78533          	add	a0,a5,a0
    80007d38:	00052023          	sw	zero,0(a0)
    80007d3c:	01010113          	addi	sp,sp,16
    80007d40:	00008067          	ret

0000000080007d44 <plic_claim>:
    80007d44:	ff010113          	addi	sp,sp,-16
    80007d48:	00813023          	sd	s0,0(sp)
    80007d4c:	00113423          	sd	ra,8(sp)
    80007d50:	01010413          	addi	s0,sp,16
    80007d54:	00000097          	auipc	ra,0x0
    80007d58:	9f8080e7          	jalr	-1544(ra) # 8000774c <cpuid>
    80007d5c:	00813083          	ld	ra,8(sp)
    80007d60:	00013403          	ld	s0,0(sp)
    80007d64:	00d5151b          	slliw	a0,a0,0xd
    80007d68:	0c2017b7          	lui	a5,0xc201
    80007d6c:	00a78533          	add	a0,a5,a0
    80007d70:	00452503          	lw	a0,4(a0)
    80007d74:	01010113          	addi	sp,sp,16
    80007d78:	00008067          	ret

0000000080007d7c <plic_complete>:
    80007d7c:	fe010113          	addi	sp,sp,-32
    80007d80:	00813823          	sd	s0,16(sp)
    80007d84:	00913423          	sd	s1,8(sp)
    80007d88:	00113c23          	sd	ra,24(sp)
    80007d8c:	02010413          	addi	s0,sp,32
    80007d90:	00050493          	mv	s1,a0
    80007d94:	00000097          	auipc	ra,0x0
    80007d98:	9b8080e7          	jalr	-1608(ra) # 8000774c <cpuid>
    80007d9c:	01813083          	ld	ra,24(sp)
    80007da0:	01013403          	ld	s0,16(sp)
    80007da4:	00d5179b          	slliw	a5,a0,0xd
    80007da8:	0c201737          	lui	a4,0xc201
    80007dac:	00f707b3          	add	a5,a4,a5
    80007db0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007db4:	00813483          	ld	s1,8(sp)
    80007db8:	02010113          	addi	sp,sp,32
    80007dbc:	00008067          	ret

0000000080007dc0 <consolewrite>:
    80007dc0:	fb010113          	addi	sp,sp,-80
    80007dc4:	04813023          	sd	s0,64(sp)
    80007dc8:	04113423          	sd	ra,72(sp)
    80007dcc:	02913c23          	sd	s1,56(sp)
    80007dd0:	03213823          	sd	s2,48(sp)
    80007dd4:	03313423          	sd	s3,40(sp)
    80007dd8:	03413023          	sd	s4,32(sp)
    80007ddc:	01513c23          	sd	s5,24(sp)
    80007de0:	05010413          	addi	s0,sp,80
    80007de4:	06c05c63          	blez	a2,80007e5c <consolewrite+0x9c>
    80007de8:	00060993          	mv	s3,a2
    80007dec:	00050a13          	mv	s4,a0
    80007df0:	00058493          	mv	s1,a1
    80007df4:	00000913          	li	s2,0
    80007df8:	fff00a93          	li	s5,-1
    80007dfc:	01c0006f          	j	80007e18 <consolewrite+0x58>
    80007e00:	fbf44503          	lbu	a0,-65(s0)
    80007e04:	0019091b          	addiw	s2,s2,1
    80007e08:	00148493          	addi	s1,s1,1
    80007e0c:	00001097          	auipc	ra,0x1
    80007e10:	a9c080e7          	jalr	-1380(ra) # 800088a8 <uartputc>
    80007e14:	03298063          	beq	s3,s2,80007e34 <consolewrite+0x74>
    80007e18:	00048613          	mv	a2,s1
    80007e1c:	00100693          	li	a3,1
    80007e20:	000a0593          	mv	a1,s4
    80007e24:	fbf40513          	addi	a0,s0,-65
    80007e28:	00000097          	auipc	ra,0x0
    80007e2c:	9dc080e7          	jalr	-1572(ra) # 80007804 <either_copyin>
    80007e30:	fd5518e3          	bne	a0,s5,80007e00 <consolewrite+0x40>
    80007e34:	04813083          	ld	ra,72(sp)
    80007e38:	04013403          	ld	s0,64(sp)
    80007e3c:	03813483          	ld	s1,56(sp)
    80007e40:	02813983          	ld	s3,40(sp)
    80007e44:	02013a03          	ld	s4,32(sp)
    80007e48:	01813a83          	ld	s5,24(sp)
    80007e4c:	00090513          	mv	a0,s2
    80007e50:	03013903          	ld	s2,48(sp)
    80007e54:	05010113          	addi	sp,sp,80
    80007e58:	00008067          	ret
    80007e5c:	00000913          	li	s2,0
    80007e60:	fd5ff06f          	j	80007e34 <consolewrite+0x74>

0000000080007e64 <consoleread>:
    80007e64:	f9010113          	addi	sp,sp,-112
    80007e68:	06813023          	sd	s0,96(sp)
    80007e6c:	04913c23          	sd	s1,88(sp)
    80007e70:	05213823          	sd	s2,80(sp)
    80007e74:	05313423          	sd	s3,72(sp)
    80007e78:	05413023          	sd	s4,64(sp)
    80007e7c:	03513c23          	sd	s5,56(sp)
    80007e80:	03613823          	sd	s6,48(sp)
    80007e84:	03713423          	sd	s7,40(sp)
    80007e88:	03813023          	sd	s8,32(sp)
    80007e8c:	06113423          	sd	ra,104(sp)
    80007e90:	01913c23          	sd	s9,24(sp)
    80007e94:	07010413          	addi	s0,sp,112
    80007e98:	00060b93          	mv	s7,a2
    80007e9c:	00050913          	mv	s2,a0
    80007ea0:	00058c13          	mv	s8,a1
    80007ea4:	00060b1b          	sext.w	s6,a2
    80007ea8:	00006497          	auipc	s1,0x6
    80007eac:	13048493          	addi	s1,s1,304 # 8000dfd8 <cons>
    80007eb0:	00400993          	li	s3,4
    80007eb4:	fff00a13          	li	s4,-1
    80007eb8:	00a00a93          	li	s5,10
    80007ebc:	05705e63          	blez	s7,80007f18 <consoleread+0xb4>
    80007ec0:	09c4a703          	lw	a4,156(s1)
    80007ec4:	0984a783          	lw	a5,152(s1)
    80007ec8:	0007071b          	sext.w	a4,a4
    80007ecc:	08e78463          	beq	a5,a4,80007f54 <consoleread+0xf0>
    80007ed0:	07f7f713          	andi	a4,a5,127
    80007ed4:	00e48733          	add	a4,s1,a4
    80007ed8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80007edc:	0017869b          	addiw	a3,a5,1
    80007ee0:	08d4ac23          	sw	a3,152(s1)
    80007ee4:	00070c9b          	sext.w	s9,a4
    80007ee8:	0b370663          	beq	a4,s3,80007f94 <consoleread+0x130>
    80007eec:	00100693          	li	a3,1
    80007ef0:	f9f40613          	addi	a2,s0,-97
    80007ef4:	000c0593          	mv	a1,s8
    80007ef8:	00090513          	mv	a0,s2
    80007efc:	f8e40fa3          	sb	a4,-97(s0)
    80007f00:	00000097          	auipc	ra,0x0
    80007f04:	8b8080e7          	jalr	-1864(ra) # 800077b8 <either_copyout>
    80007f08:	01450863          	beq	a0,s4,80007f18 <consoleread+0xb4>
    80007f0c:	001c0c13          	addi	s8,s8,1
    80007f10:	fffb8b9b          	addiw	s7,s7,-1
    80007f14:	fb5c94e3          	bne	s9,s5,80007ebc <consoleread+0x58>
    80007f18:	000b851b          	sext.w	a0,s7
    80007f1c:	06813083          	ld	ra,104(sp)
    80007f20:	06013403          	ld	s0,96(sp)
    80007f24:	05813483          	ld	s1,88(sp)
    80007f28:	05013903          	ld	s2,80(sp)
    80007f2c:	04813983          	ld	s3,72(sp)
    80007f30:	04013a03          	ld	s4,64(sp)
    80007f34:	03813a83          	ld	s5,56(sp)
    80007f38:	02813b83          	ld	s7,40(sp)
    80007f3c:	02013c03          	ld	s8,32(sp)
    80007f40:	01813c83          	ld	s9,24(sp)
    80007f44:	40ab053b          	subw	a0,s6,a0
    80007f48:	03013b03          	ld	s6,48(sp)
    80007f4c:	07010113          	addi	sp,sp,112
    80007f50:	00008067          	ret
    80007f54:	00001097          	auipc	ra,0x1
    80007f58:	1d8080e7          	jalr	472(ra) # 8000912c <push_on>
    80007f5c:	0984a703          	lw	a4,152(s1)
    80007f60:	09c4a783          	lw	a5,156(s1)
    80007f64:	0007879b          	sext.w	a5,a5
    80007f68:	fef70ce3          	beq	a4,a5,80007f60 <consoleread+0xfc>
    80007f6c:	00001097          	auipc	ra,0x1
    80007f70:	234080e7          	jalr	564(ra) # 800091a0 <pop_on>
    80007f74:	0984a783          	lw	a5,152(s1)
    80007f78:	07f7f713          	andi	a4,a5,127
    80007f7c:	00e48733          	add	a4,s1,a4
    80007f80:	01874703          	lbu	a4,24(a4)
    80007f84:	0017869b          	addiw	a3,a5,1
    80007f88:	08d4ac23          	sw	a3,152(s1)
    80007f8c:	00070c9b          	sext.w	s9,a4
    80007f90:	f5371ee3          	bne	a4,s3,80007eec <consoleread+0x88>
    80007f94:	000b851b          	sext.w	a0,s7
    80007f98:	f96bf2e3          	bgeu	s7,s6,80007f1c <consoleread+0xb8>
    80007f9c:	08f4ac23          	sw	a5,152(s1)
    80007fa0:	f7dff06f          	j	80007f1c <consoleread+0xb8>

0000000080007fa4 <consputc>:
    80007fa4:	10000793          	li	a5,256
    80007fa8:	00f50663          	beq	a0,a5,80007fb4 <consputc+0x10>
    80007fac:	00001317          	auipc	t1,0x1
    80007fb0:	9f430067          	jr	-1548(t1) # 800089a0 <uartputc_sync>
    80007fb4:	ff010113          	addi	sp,sp,-16
    80007fb8:	00113423          	sd	ra,8(sp)
    80007fbc:	00813023          	sd	s0,0(sp)
    80007fc0:	01010413          	addi	s0,sp,16
    80007fc4:	00800513          	li	a0,8
    80007fc8:	00001097          	auipc	ra,0x1
    80007fcc:	9d8080e7          	jalr	-1576(ra) # 800089a0 <uartputc_sync>
    80007fd0:	02000513          	li	a0,32
    80007fd4:	00001097          	auipc	ra,0x1
    80007fd8:	9cc080e7          	jalr	-1588(ra) # 800089a0 <uartputc_sync>
    80007fdc:	00013403          	ld	s0,0(sp)
    80007fe0:	00813083          	ld	ra,8(sp)
    80007fe4:	00800513          	li	a0,8
    80007fe8:	01010113          	addi	sp,sp,16
    80007fec:	00001317          	auipc	t1,0x1
    80007ff0:	9b430067          	jr	-1612(t1) # 800089a0 <uartputc_sync>

0000000080007ff4 <consoleintr>:
    80007ff4:	fe010113          	addi	sp,sp,-32
    80007ff8:	00813823          	sd	s0,16(sp)
    80007ffc:	00913423          	sd	s1,8(sp)
    80008000:	01213023          	sd	s2,0(sp)
    80008004:	00113c23          	sd	ra,24(sp)
    80008008:	02010413          	addi	s0,sp,32
    8000800c:	00006917          	auipc	s2,0x6
    80008010:	fcc90913          	addi	s2,s2,-52 # 8000dfd8 <cons>
    80008014:	00050493          	mv	s1,a0
    80008018:	00090513          	mv	a0,s2
    8000801c:	00001097          	auipc	ra,0x1
    80008020:	e40080e7          	jalr	-448(ra) # 80008e5c <acquire>
    80008024:	02048c63          	beqz	s1,8000805c <consoleintr+0x68>
    80008028:	0a092783          	lw	a5,160(s2)
    8000802c:	09892703          	lw	a4,152(s2)
    80008030:	07f00693          	li	a3,127
    80008034:	40e7873b          	subw	a4,a5,a4
    80008038:	02e6e263          	bltu	a3,a4,8000805c <consoleintr+0x68>
    8000803c:	00d00713          	li	a4,13
    80008040:	04e48063          	beq	s1,a4,80008080 <consoleintr+0x8c>
    80008044:	07f7f713          	andi	a4,a5,127
    80008048:	00e90733          	add	a4,s2,a4
    8000804c:	0017879b          	addiw	a5,a5,1
    80008050:	0af92023          	sw	a5,160(s2)
    80008054:	00970c23          	sb	s1,24(a4)
    80008058:	08f92e23          	sw	a5,156(s2)
    8000805c:	01013403          	ld	s0,16(sp)
    80008060:	01813083          	ld	ra,24(sp)
    80008064:	00813483          	ld	s1,8(sp)
    80008068:	00013903          	ld	s2,0(sp)
    8000806c:	00006517          	auipc	a0,0x6
    80008070:	f6c50513          	addi	a0,a0,-148 # 8000dfd8 <cons>
    80008074:	02010113          	addi	sp,sp,32
    80008078:	00001317          	auipc	t1,0x1
    8000807c:	eb030067          	jr	-336(t1) # 80008f28 <release>
    80008080:	00a00493          	li	s1,10
    80008084:	fc1ff06f          	j	80008044 <consoleintr+0x50>

0000000080008088 <consoleinit>:
    80008088:	fe010113          	addi	sp,sp,-32
    8000808c:	00113c23          	sd	ra,24(sp)
    80008090:	00813823          	sd	s0,16(sp)
    80008094:	00913423          	sd	s1,8(sp)
    80008098:	02010413          	addi	s0,sp,32
    8000809c:	00006497          	auipc	s1,0x6
    800080a0:	f3c48493          	addi	s1,s1,-196 # 8000dfd8 <cons>
    800080a4:	00048513          	mv	a0,s1
    800080a8:	00002597          	auipc	a1,0x2
    800080ac:	78058593          	addi	a1,a1,1920 # 8000a828 <_ZZ9kPrintIntmE6digits+0x7b8>
    800080b0:	00001097          	auipc	ra,0x1
    800080b4:	d88080e7          	jalr	-632(ra) # 80008e38 <initlock>
    800080b8:	00000097          	auipc	ra,0x0
    800080bc:	7ac080e7          	jalr	1964(ra) # 80008864 <uartinit>
    800080c0:	01813083          	ld	ra,24(sp)
    800080c4:	01013403          	ld	s0,16(sp)
    800080c8:	00000797          	auipc	a5,0x0
    800080cc:	d9c78793          	addi	a5,a5,-612 # 80007e64 <consoleread>
    800080d0:	0af4bc23          	sd	a5,184(s1)
    800080d4:	00000797          	auipc	a5,0x0
    800080d8:	cec78793          	addi	a5,a5,-788 # 80007dc0 <consolewrite>
    800080dc:	0cf4b023          	sd	a5,192(s1)
    800080e0:	00813483          	ld	s1,8(sp)
    800080e4:	02010113          	addi	sp,sp,32
    800080e8:	00008067          	ret

00000000800080ec <console_read>:
    800080ec:	ff010113          	addi	sp,sp,-16
    800080f0:	00813423          	sd	s0,8(sp)
    800080f4:	01010413          	addi	s0,sp,16
    800080f8:	00813403          	ld	s0,8(sp)
    800080fc:	00006317          	auipc	t1,0x6
    80008100:	f9433303          	ld	t1,-108(t1) # 8000e090 <devsw+0x10>
    80008104:	01010113          	addi	sp,sp,16
    80008108:	00030067          	jr	t1

000000008000810c <console_write>:
    8000810c:	ff010113          	addi	sp,sp,-16
    80008110:	00813423          	sd	s0,8(sp)
    80008114:	01010413          	addi	s0,sp,16
    80008118:	00813403          	ld	s0,8(sp)
    8000811c:	00006317          	auipc	t1,0x6
    80008120:	f7c33303          	ld	t1,-132(t1) # 8000e098 <devsw+0x18>
    80008124:	01010113          	addi	sp,sp,16
    80008128:	00030067          	jr	t1

000000008000812c <panic>:
    8000812c:	fe010113          	addi	sp,sp,-32
    80008130:	00113c23          	sd	ra,24(sp)
    80008134:	00813823          	sd	s0,16(sp)
    80008138:	00913423          	sd	s1,8(sp)
    8000813c:	02010413          	addi	s0,sp,32
    80008140:	00050493          	mv	s1,a0
    80008144:	00002517          	auipc	a0,0x2
    80008148:	6ec50513          	addi	a0,a0,1772 # 8000a830 <_ZZ9kPrintIntmE6digits+0x7c0>
    8000814c:	00006797          	auipc	a5,0x6
    80008150:	fe07a623          	sw	zero,-20(a5) # 8000e138 <pr+0x18>
    80008154:	00000097          	auipc	ra,0x0
    80008158:	034080e7          	jalr	52(ra) # 80008188 <__printf>
    8000815c:	00048513          	mv	a0,s1
    80008160:	00000097          	auipc	ra,0x0
    80008164:	028080e7          	jalr	40(ra) # 80008188 <__printf>
    80008168:	00002517          	auipc	a0,0x2
    8000816c:	45050513          	addi	a0,a0,1104 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80008170:	00000097          	auipc	ra,0x0
    80008174:	018080e7          	jalr	24(ra) # 80008188 <__printf>
    80008178:	00100793          	li	a5,1
    8000817c:	00005717          	auipc	a4,0x5
    80008180:	bef72623          	sw	a5,-1044(a4) # 8000cd68 <panicked>
    80008184:	0000006f          	j	80008184 <panic+0x58>

0000000080008188 <__printf>:
    80008188:	f3010113          	addi	sp,sp,-208
    8000818c:	08813023          	sd	s0,128(sp)
    80008190:	07313423          	sd	s3,104(sp)
    80008194:	09010413          	addi	s0,sp,144
    80008198:	05813023          	sd	s8,64(sp)
    8000819c:	08113423          	sd	ra,136(sp)
    800081a0:	06913c23          	sd	s1,120(sp)
    800081a4:	07213823          	sd	s2,112(sp)
    800081a8:	07413023          	sd	s4,96(sp)
    800081ac:	05513c23          	sd	s5,88(sp)
    800081b0:	05613823          	sd	s6,80(sp)
    800081b4:	05713423          	sd	s7,72(sp)
    800081b8:	03913c23          	sd	s9,56(sp)
    800081bc:	03a13823          	sd	s10,48(sp)
    800081c0:	03b13423          	sd	s11,40(sp)
    800081c4:	00006317          	auipc	t1,0x6
    800081c8:	f5c30313          	addi	t1,t1,-164 # 8000e120 <pr>
    800081cc:	01832c03          	lw	s8,24(t1)
    800081d0:	00b43423          	sd	a1,8(s0)
    800081d4:	00c43823          	sd	a2,16(s0)
    800081d8:	00d43c23          	sd	a3,24(s0)
    800081dc:	02e43023          	sd	a4,32(s0)
    800081e0:	02f43423          	sd	a5,40(s0)
    800081e4:	03043823          	sd	a6,48(s0)
    800081e8:	03143c23          	sd	a7,56(s0)
    800081ec:	00050993          	mv	s3,a0
    800081f0:	4a0c1663          	bnez	s8,8000869c <__printf+0x514>
    800081f4:	60098c63          	beqz	s3,8000880c <__printf+0x684>
    800081f8:	0009c503          	lbu	a0,0(s3)
    800081fc:	00840793          	addi	a5,s0,8
    80008200:	f6f43c23          	sd	a5,-136(s0)
    80008204:	00000493          	li	s1,0
    80008208:	22050063          	beqz	a0,80008428 <__printf+0x2a0>
    8000820c:	00002a37          	lui	s4,0x2
    80008210:	00018ab7          	lui	s5,0x18
    80008214:	000f4b37          	lui	s6,0xf4
    80008218:	00989bb7          	lui	s7,0x989
    8000821c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80008220:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80008224:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80008228:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000822c:	00148c9b          	addiw	s9,s1,1
    80008230:	02500793          	li	a5,37
    80008234:	01998933          	add	s2,s3,s9
    80008238:	38f51263          	bne	a0,a5,800085bc <__printf+0x434>
    8000823c:	00094783          	lbu	a5,0(s2)
    80008240:	00078c9b          	sext.w	s9,a5
    80008244:	1e078263          	beqz	a5,80008428 <__printf+0x2a0>
    80008248:	0024849b          	addiw	s1,s1,2
    8000824c:	07000713          	li	a4,112
    80008250:	00998933          	add	s2,s3,s1
    80008254:	38e78a63          	beq	a5,a4,800085e8 <__printf+0x460>
    80008258:	20f76863          	bltu	a4,a5,80008468 <__printf+0x2e0>
    8000825c:	42a78863          	beq	a5,a0,8000868c <__printf+0x504>
    80008260:	06400713          	li	a4,100
    80008264:	40e79663          	bne	a5,a4,80008670 <__printf+0x4e8>
    80008268:	f7843783          	ld	a5,-136(s0)
    8000826c:	0007a603          	lw	a2,0(a5)
    80008270:	00878793          	addi	a5,a5,8
    80008274:	f6f43c23          	sd	a5,-136(s0)
    80008278:	42064a63          	bltz	a2,800086ac <__printf+0x524>
    8000827c:	00a00713          	li	a4,10
    80008280:	02e677bb          	remuw	a5,a2,a4
    80008284:	00002d97          	auipc	s11,0x2
    80008288:	5d4d8d93          	addi	s11,s11,1492 # 8000a858 <digits>
    8000828c:	00900593          	li	a1,9
    80008290:	0006051b          	sext.w	a0,a2
    80008294:	00000c93          	li	s9,0
    80008298:	02079793          	slli	a5,a5,0x20
    8000829c:	0207d793          	srli	a5,a5,0x20
    800082a0:	00fd87b3          	add	a5,s11,a5
    800082a4:	0007c783          	lbu	a5,0(a5)
    800082a8:	02e656bb          	divuw	a3,a2,a4
    800082ac:	f8f40023          	sb	a5,-128(s0)
    800082b0:	14c5d863          	bge	a1,a2,80008400 <__printf+0x278>
    800082b4:	06300593          	li	a1,99
    800082b8:	00100c93          	li	s9,1
    800082bc:	02e6f7bb          	remuw	a5,a3,a4
    800082c0:	02079793          	slli	a5,a5,0x20
    800082c4:	0207d793          	srli	a5,a5,0x20
    800082c8:	00fd87b3          	add	a5,s11,a5
    800082cc:	0007c783          	lbu	a5,0(a5)
    800082d0:	02e6d73b          	divuw	a4,a3,a4
    800082d4:	f8f400a3          	sb	a5,-127(s0)
    800082d8:	12a5f463          	bgeu	a1,a0,80008400 <__printf+0x278>
    800082dc:	00a00693          	li	a3,10
    800082e0:	00900593          	li	a1,9
    800082e4:	02d777bb          	remuw	a5,a4,a3
    800082e8:	02079793          	slli	a5,a5,0x20
    800082ec:	0207d793          	srli	a5,a5,0x20
    800082f0:	00fd87b3          	add	a5,s11,a5
    800082f4:	0007c503          	lbu	a0,0(a5)
    800082f8:	02d757bb          	divuw	a5,a4,a3
    800082fc:	f8a40123          	sb	a0,-126(s0)
    80008300:	48e5f263          	bgeu	a1,a4,80008784 <__printf+0x5fc>
    80008304:	06300513          	li	a0,99
    80008308:	02d7f5bb          	remuw	a1,a5,a3
    8000830c:	02059593          	slli	a1,a1,0x20
    80008310:	0205d593          	srli	a1,a1,0x20
    80008314:	00bd85b3          	add	a1,s11,a1
    80008318:	0005c583          	lbu	a1,0(a1)
    8000831c:	02d7d7bb          	divuw	a5,a5,a3
    80008320:	f8b401a3          	sb	a1,-125(s0)
    80008324:	48e57263          	bgeu	a0,a4,800087a8 <__printf+0x620>
    80008328:	3e700513          	li	a0,999
    8000832c:	02d7f5bb          	remuw	a1,a5,a3
    80008330:	02059593          	slli	a1,a1,0x20
    80008334:	0205d593          	srli	a1,a1,0x20
    80008338:	00bd85b3          	add	a1,s11,a1
    8000833c:	0005c583          	lbu	a1,0(a1)
    80008340:	02d7d7bb          	divuw	a5,a5,a3
    80008344:	f8b40223          	sb	a1,-124(s0)
    80008348:	46e57663          	bgeu	a0,a4,800087b4 <__printf+0x62c>
    8000834c:	02d7f5bb          	remuw	a1,a5,a3
    80008350:	02059593          	slli	a1,a1,0x20
    80008354:	0205d593          	srli	a1,a1,0x20
    80008358:	00bd85b3          	add	a1,s11,a1
    8000835c:	0005c583          	lbu	a1,0(a1)
    80008360:	02d7d7bb          	divuw	a5,a5,a3
    80008364:	f8b402a3          	sb	a1,-123(s0)
    80008368:	46ea7863          	bgeu	s4,a4,800087d8 <__printf+0x650>
    8000836c:	02d7f5bb          	remuw	a1,a5,a3
    80008370:	02059593          	slli	a1,a1,0x20
    80008374:	0205d593          	srli	a1,a1,0x20
    80008378:	00bd85b3          	add	a1,s11,a1
    8000837c:	0005c583          	lbu	a1,0(a1)
    80008380:	02d7d7bb          	divuw	a5,a5,a3
    80008384:	f8b40323          	sb	a1,-122(s0)
    80008388:	3eeaf863          	bgeu	s5,a4,80008778 <__printf+0x5f0>
    8000838c:	02d7f5bb          	remuw	a1,a5,a3
    80008390:	02059593          	slli	a1,a1,0x20
    80008394:	0205d593          	srli	a1,a1,0x20
    80008398:	00bd85b3          	add	a1,s11,a1
    8000839c:	0005c583          	lbu	a1,0(a1)
    800083a0:	02d7d7bb          	divuw	a5,a5,a3
    800083a4:	f8b403a3          	sb	a1,-121(s0)
    800083a8:	42eb7e63          	bgeu	s6,a4,800087e4 <__printf+0x65c>
    800083ac:	02d7f5bb          	remuw	a1,a5,a3
    800083b0:	02059593          	slli	a1,a1,0x20
    800083b4:	0205d593          	srli	a1,a1,0x20
    800083b8:	00bd85b3          	add	a1,s11,a1
    800083bc:	0005c583          	lbu	a1,0(a1)
    800083c0:	02d7d7bb          	divuw	a5,a5,a3
    800083c4:	f8b40423          	sb	a1,-120(s0)
    800083c8:	42ebfc63          	bgeu	s7,a4,80008800 <__printf+0x678>
    800083cc:	02079793          	slli	a5,a5,0x20
    800083d0:	0207d793          	srli	a5,a5,0x20
    800083d4:	00fd8db3          	add	s11,s11,a5
    800083d8:	000dc703          	lbu	a4,0(s11)
    800083dc:	00a00793          	li	a5,10
    800083e0:	00900c93          	li	s9,9
    800083e4:	f8e404a3          	sb	a4,-119(s0)
    800083e8:	00065c63          	bgez	a2,80008400 <__printf+0x278>
    800083ec:	f9040713          	addi	a4,s0,-112
    800083f0:	00f70733          	add	a4,a4,a5
    800083f4:	02d00693          	li	a3,45
    800083f8:	fed70823          	sb	a3,-16(a4)
    800083fc:	00078c93          	mv	s9,a5
    80008400:	f8040793          	addi	a5,s0,-128
    80008404:	01978cb3          	add	s9,a5,s9
    80008408:	f7f40d13          	addi	s10,s0,-129
    8000840c:	000cc503          	lbu	a0,0(s9)
    80008410:	fffc8c93          	addi	s9,s9,-1
    80008414:	00000097          	auipc	ra,0x0
    80008418:	b90080e7          	jalr	-1136(ra) # 80007fa4 <consputc>
    8000841c:	ffac98e3          	bne	s9,s10,8000840c <__printf+0x284>
    80008420:	00094503          	lbu	a0,0(s2)
    80008424:	e00514e3          	bnez	a0,8000822c <__printf+0xa4>
    80008428:	1a0c1663          	bnez	s8,800085d4 <__printf+0x44c>
    8000842c:	08813083          	ld	ra,136(sp)
    80008430:	08013403          	ld	s0,128(sp)
    80008434:	07813483          	ld	s1,120(sp)
    80008438:	07013903          	ld	s2,112(sp)
    8000843c:	06813983          	ld	s3,104(sp)
    80008440:	06013a03          	ld	s4,96(sp)
    80008444:	05813a83          	ld	s5,88(sp)
    80008448:	05013b03          	ld	s6,80(sp)
    8000844c:	04813b83          	ld	s7,72(sp)
    80008450:	04013c03          	ld	s8,64(sp)
    80008454:	03813c83          	ld	s9,56(sp)
    80008458:	03013d03          	ld	s10,48(sp)
    8000845c:	02813d83          	ld	s11,40(sp)
    80008460:	0d010113          	addi	sp,sp,208
    80008464:	00008067          	ret
    80008468:	07300713          	li	a4,115
    8000846c:	1ce78a63          	beq	a5,a4,80008640 <__printf+0x4b8>
    80008470:	07800713          	li	a4,120
    80008474:	1ee79e63          	bne	a5,a4,80008670 <__printf+0x4e8>
    80008478:	f7843783          	ld	a5,-136(s0)
    8000847c:	0007a703          	lw	a4,0(a5)
    80008480:	00878793          	addi	a5,a5,8
    80008484:	f6f43c23          	sd	a5,-136(s0)
    80008488:	28074263          	bltz	a4,8000870c <__printf+0x584>
    8000848c:	00002d97          	auipc	s11,0x2
    80008490:	3ccd8d93          	addi	s11,s11,972 # 8000a858 <digits>
    80008494:	00f77793          	andi	a5,a4,15
    80008498:	00fd87b3          	add	a5,s11,a5
    8000849c:	0007c683          	lbu	a3,0(a5)
    800084a0:	00f00613          	li	a2,15
    800084a4:	0007079b          	sext.w	a5,a4
    800084a8:	f8d40023          	sb	a3,-128(s0)
    800084ac:	0047559b          	srliw	a1,a4,0x4
    800084b0:	0047569b          	srliw	a3,a4,0x4
    800084b4:	00000c93          	li	s9,0
    800084b8:	0ee65063          	bge	a2,a4,80008598 <__printf+0x410>
    800084bc:	00f6f693          	andi	a3,a3,15
    800084c0:	00dd86b3          	add	a3,s11,a3
    800084c4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800084c8:	0087d79b          	srliw	a5,a5,0x8
    800084cc:	00100c93          	li	s9,1
    800084d0:	f8d400a3          	sb	a3,-127(s0)
    800084d4:	0cb67263          	bgeu	a2,a1,80008598 <__printf+0x410>
    800084d8:	00f7f693          	andi	a3,a5,15
    800084dc:	00dd86b3          	add	a3,s11,a3
    800084e0:	0006c583          	lbu	a1,0(a3)
    800084e4:	00f00613          	li	a2,15
    800084e8:	0047d69b          	srliw	a3,a5,0x4
    800084ec:	f8b40123          	sb	a1,-126(s0)
    800084f0:	0047d593          	srli	a1,a5,0x4
    800084f4:	28f67e63          	bgeu	a2,a5,80008790 <__printf+0x608>
    800084f8:	00f6f693          	andi	a3,a3,15
    800084fc:	00dd86b3          	add	a3,s11,a3
    80008500:	0006c503          	lbu	a0,0(a3)
    80008504:	0087d813          	srli	a6,a5,0x8
    80008508:	0087d69b          	srliw	a3,a5,0x8
    8000850c:	f8a401a3          	sb	a0,-125(s0)
    80008510:	28b67663          	bgeu	a2,a1,8000879c <__printf+0x614>
    80008514:	00f6f693          	andi	a3,a3,15
    80008518:	00dd86b3          	add	a3,s11,a3
    8000851c:	0006c583          	lbu	a1,0(a3)
    80008520:	00c7d513          	srli	a0,a5,0xc
    80008524:	00c7d69b          	srliw	a3,a5,0xc
    80008528:	f8b40223          	sb	a1,-124(s0)
    8000852c:	29067a63          	bgeu	a2,a6,800087c0 <__printf+0x638>
    80008530:	00f6f693          	andi	a3,a3,15
    80008534:	00dd86b3          	add	a3,s11,a3
    80008538:	0006c583          	lbu	a1,0(a3)
    8000853c:	0107d813          	srli	a6,a5,0x10
    80008540:	0107d69b          	srliw	a3,a5,0x10
    80008544:	f8b402a3          	sb	a1,-123(s0)
    80008548:	28a67263          	bgeu	a2,a0,800087cc <__printf+0x644>
    8000854c:	00f6f693          	andi	a3,a3,15
    80008550:	00dd86b3          	add	a3,s11,a3
    80008554:	0006c683          	lbu	a3,0(a3)
    80008558:	0147d79b          	srliw	a5,a5,0x14
    8000855c:	f8d40323          	sb	a3,-122(s0)
    80008560:	21067663          	bgeu	a2,a6,8000876c <__printf+0x5e4>
    80008564:	02079793          	slli	a5,a5,0x20
    80008568:	0207d793          	srli	a5,a5,0x20
    8000856c:	00fd8db3          	add	s11,s11,a5
    80008570:	000dc683          	lbu	a3,0(s11)
    80008574:	00800793          	li	a5,8
    80008578:	00700c93          	li	s9,7
    8000857c:	f8d403a3          	sb	a3,-121(s0)
    80008580:	00075c63          	bgez	a4,80008598 <__printf+0x410>
    80008584:	f9040713          	addi	a4,s0,-112
    80008588:	00f70733          	add	a4,a4,a5
    8000858c:	02d00693          	li	a3,45
    80008590:	fed70823          	sb	a3,-16(a4)
    80008594:	00078c93          	mv	s9,a5
    80008598:	f8040793          	addi	a5,s0,-128
    8000859c:	01978cb3          	add	s9,a5,s9
    800085a0:	f7f40d13          	addi	s10,s0,-129
    800085a4:	000cc503          	lbu	a0,0(s9)
    800085a8:	fffc8c93          	addi	s9,s9,-1
    800085ac:	00000097          	auipc	ra,0x0
    800085b0:	9f8080e7          	jalr	-1544(ra) # 80007fa4 <consputc>
    800085b4:	ff9d18e3          	bne	s10,s9,800085a4 <__printf+0x41c>
    800085b8:	0100006f          	j	800085c8 <__printf+0x440>
    800085bc:	00000097          	auipc	ra,0x0
    800085c0:	9e8080e7          	jalr	-1560(ra) # 80007fa4 <consputc>
    800085c4:	000c8493          	mv	s1,s9
    800085c8:	00094503          	lbu	a0,0(s2)
    800085cc:	c60510e3          	bnez	a0,8000822c <__printf+0xa4>
    800085d0:	e40c0ee3          	beqz	s8,8000842c <__printf+0x2a4>
    800085d4:	00006517          	auipc	a0,0x6
    800085d8:	b4c50513          	addi	a0,a0,-1204 # 8000e120 <pr>
    800085dc:	00001097          	auipc	ra,0x1
    800085e0:	94c080e7          	jalr	-1716(ra) # 80008f28 <release>
    800085e4:	e49ff06f          	j	8000842c <__printf+0x2a4>
    800085e8:	f7843783          	ld	a5,-136(s0)
    800085ec:	03000513          	li	a0,48
    800085f0:	01000d13          	li	s10,16
    800085f4:	00878713          	addi	a4,a5,8
    800085f8:	0007bc83          	ld	s9,0(a5)
    800085fc:	f6e43c23          	sd	a4,-136(s0)
    80008600:	00000097          	auipc	ra,0x0
    80008604:	9a4080e7          	jalr	-1628(ra) # 80007fa4 <consputc>
    80008608:	07800513          	li	a0,120
    8000860c:	00000097          	auipc	ra,0x0
    80008610:	998080e7          	jalr	-1640(ra) # 80007fa4 <consputc>
    80008614:	00002d97          	auipc	s11,0x2
    80008618:	244d8d93          	addi	s11,s11,580 # 8000a858 <digits>
    8000861c:	03ccd793          	srli	a5,s9,0x3c
    80008620:	00fd87b3          	add	a5,s11,a5
    80008624:	0007c503          	lbu	a0,0(a5)
    80008628:	fffd0d1b          	addiw	s10,s10,-1
    8000862c:	004c9c93          	slli	s9,s9,0x4
    80008630:	00000097          	auipc	ra,0x0
    80008634:	974080e7          	jalr	-1676(ra) # 80007fa4 <consputc>
    80008638:	fe0d12e3          	bnez	s10,8000861c <__printf+0x494>
    8000863c:	f8dff06f          	j	800085c8 <__printf+0x440>
    80008640:	f7843783          	ld	a5,-136(s0)
    80008644:	0007bc83          	ld	s9,0(a5)
    80008648:	00878793          	addi	a5,a5,8
    8000864c:	f6f43c23          	sd	a5,-136(s0)
    80008650:	000c9a63          	bnez	s9,80008664 <__printf+0x4dc>
    80008654:	1080006f          	j	8000875c <__printf+0x5d4>
    80008658:	001c8c93          	addi	s9,s9,1
    8000865c:	00000097          	auipc	ra,0x0
    80008660:	948080e7          	jalr	-1720(ra) # 80007fa4 <consputc>
    80008664:	000cc503          	lbu	a0,0(s9)
    80008668:	fe0518e3          	bnez	a0,80008658 <__printf+0x4d0>
    8000866c:	f5dff06f          	j	800085c8 <__printf+0x440>
    80008670:	02500513          	li	a0,37
    80008674:	00000097          	auipc	ra,0x0
    80008678:	930080e7          	jalr	-1744(ra) # 80007fa4 <consputc>
    8000867c:	000c8513          	mv	a0,s9
    80008680:	00000097          	auipc	ra,0x0
    80008684:	924080e7          	jalr	-1756(ra) # 80007fa4 <consputc>
    80008688:	f41ff06f          	j	800085c8 <__printf+0x440>
    8000868c:	02500513          	li	a0,37
    80008690:	00000097          	auipc	ra,0x0
    80008694:	914080e7          	jalr	-1772(ra) # 80007fa4 <consputc>
    80008698:	f31ff06f          	j	800085c8 <__printf+0x440>
    8000869c:	00030513          	mv	a0,t1
    800086a0:	00000097          	auipc	ra,0x0
    800086a4:	7bc080e7          	jalr	1980(ra) # 80008e5c <acquire>
    800086a8:	b4dff06f          	j	800081f4 <__printf+0x6c>
    800086ac:	40c0053b          	negw	a0,a2
    800086b0:	00a00713          	li	a4,10
    800086b4:	02e576bb          	remuw	a3,a0,a4
    800086b8:	00002d97          	auipc	s11,0x2
    800086bc:	1a0d8d93          	addi	s11,s11,416 # 8000a858 <digits>
    800086c0:	ff700593          	li	a1,-9
    800086c4:	02069693          	slli	a3,a3,0x20
    800086c8:	0206d693          	srli	a3,a3,0x20
    800086cc:	00dd86b3          	add	a3,s11,a3
    800086d0:	0006c683          	lbu	a3,0(a3)
    800086d4:	02e557bb          	divuw	a5,a0,a4
    800086d8:	f8d40023          	sb	a3,-128(s0)
    800086dc:	10b65e63          	bge	a2,a1,800087f8 <__printf+0x670>
    800086e0:	06300593          	li	a1,99
    800086e4:	02e7f6bb          	remuw	a3,a5,a4
    800086e8:	02069693          	slli	a3,a3,0x20
    800086ec:	0206d693          	srli	a3,a3,0x20
    800086f0:	00dd86b3          	add	a3,s11,a3
    800086f4:	0006c683          	lbu	a3,0(a3)
    800086f8:	02e7d73b          	divuw	a4,a5,a4
    800086fc:	00200793          	li	a5,2
    80008700:	f8d400a3          	sb	a3,-127(s0)
    80008704:	bca5ece3          	bltu	a1,a0,800082dc <__printf+0x154>
    80008708:	ce5ff06f          	j	800083ec <__printf+0x264>
    8000870c:	40e007bb          	negw	a5,a4
    80008710:	00002d97          	auipc	s11,0x2
    80008714:	148d8d93          	addi	s11,s11,328 # 8000a858 <digits>
    80008718:	00f7f693          	andi	a3,a5,15
    8000871c:	00dd86b3          	add	a3,s11,a3
    80008720:	0006c583          	lbu	a1,0(a3)
    80008724:	ff100613          	li	a2,-15
    80008728:	0047d69b          	srliw	a3,a5,0x4
    8000872c:	f8b40023          	sb	a1,-128(s0)
    80008730:	0047d59b          	srliw	a1,a5,0x4
    80008734:	0ac75e63          	bge	a4,a2,800087f0 <__printf+0x668>
    80008738:	00f6f693          	andi	a3,a3,15
    8000873c:	00dd86b3          	add	a3,s11,a3
    80008740:	0006c603          	lbu	a2,0(a3)
    80008744:	00f00693          	li	a3,15
    80008748:	0087d79b          	srliw	a5,a5,0x8
    8000874c:	f8c400a3          	sb	a2,-127(s0)
    80008750:	d8b6e4e3          	bltu	a3,a1,800084d8 <__printf+0x350>
    80008754:	00200793          	li	a5,2
    80008758:	e2dff06f          	j	80008584 <__printf+0x3fc>
    8000875c:	00002c97          	auipc	s9,0x2
    80008760:	0dcc8c93          	addi	s9,s9,220 # 8000a838 <_ZZ9kPrintIntmE6digits+0x7c8>
    80008764:	02800513          	li	a0,40
    80008768:	ef1ff06f          	j	80008658 <__printf+0x4d0>
    8000876c:	00700793          	li	a5,7
    80008770:	00600c93          	li	s9,6
    80008774:	e0dff06f          	j	80008580 <__printf+0x3f8>
    80008778:	00700793          	li	a5,7
    8000877c:	00600c93          	li	s9,6
    80008780:	c69ff06f          	j	800083e8 <__printf+0x260>
    80008784:	00300793          	li	a5,3
    80008788:	00200c93          	li	s9,2
    8000878c:	c5dff06f          	j	800083e8 <__printf+0x260>
    80008790:	00300793          	li	a5,3
    80008794:	00200c93          	li	s9,2
    80008798:	de9ff06f          	j	80008580 <__printf+0x3f8>
    8000879c:	00400793          	li	a5,4
    800087a0:	00300c93          	li	s9,3
    800087a4:	dddff06f          	j	80008580 <__printf+0x3f8>
    800087a8:	00400793          	li	a5,4
    800087ac:	00300c93          	li	s9,3
    800087b0:	c39ff06f          	j	800083e8 <__printf+0x260>
    800087b4:	00500793          	li	a5,5
    800087b8:	00400c93          	li	s9,4
    800087bc:	c2dff06f          	j	800083e8 <__printf+0x260>
    800087c0:	00500793          	li	a5,5
    800087c4:	00400c93          	li	s9,4
    800087c8:	db9ff06f          	j	80008580 <__printf+0x3f8>
    800087cc:	00600793          	li	a5,6
    800087d0:	00500c93          	li	s9,5
    800087d4:	dadff06f          	j	80008580 <__printf+0x3f8>
    800087d8:	00600793          	li	a5,6
    800087dc:	00500c93          	li	s9,5
    800087e0:	c09ff06f          	j	800083e8 <__printf+0x260>
    800087e4:	00800793          	li	a5,8
    800087e8:	00700c93          	li	s9,7
    800087ec:	bfdff06f          	j	800083e8 <__printf+0x260>
    800087f0:	00100793          	li	a5,1
    800087f4:	d91ff06f          	j	80008584 <__printf+0x3fc>
    800087f8:	00100793          	li	a5,1
    800087fc:	bf1ff06f          	j	800083ec <__printf+0x264>
    80008800:	00900793          	li	a5,9
    80008804:	00800c93          	li	s9,8
    80008808:	be1ff06f          	j	800083e8 <__printf+0x260>
    8000880c:	00002517          	auipc	a0,0x2
    80008810:	03450513          	addi	a0,a0,52 # 8000a840 <_ZZ9kPrintIntmE6digits+0x7d0>
    80008814:	00000097          	auipc	ra,0x0
    80008818:	918080e7          	jalr	-1768(ra) # 8000812c <panic>

000000008000881c <printfinit>:
    8000881c:	fe010113          	addi	sp,sp,-32
    80008820:	00813823          	sd	s0,16(sp)
    80008824:	00913423          	sd	s1,8(sp)
    80008828:	00113c23          	sd	ra,24(sp)
    8000882c:	02010413          	addi	s0,sp,32
    80008830:	00006497          	auipc	s1,0x6
    80008834:	8f048493          	addi	s1,s1,-1808 # 8000e120 <pr>
    80008838:	00048513          	mv	a0,s1
    8000883c:	00002597          	auipc	a1,0x2
    80008840:	01458593          	addi	a1,a1,20 # 8000a850 <_ZZ9kPrintIntmE6digits+0x7e0>
    80008844:	00000097          	auipc	ra,0x0
    80008848:	5f4080e7          	jalr	1524(ra) # 80008e38 <initlock>
    8000884c:	01813083          	ld	ra,24(sp)
    80008850:	01013403          	ld	s0,16(sp)
    80008854:	0004ac23          	sw	zero,24(s1)
    80008858:	00813483          	ld	s1,8(sp)
    8000885c:	02010113          	addi	sp,sp,32
    80008860:	00008067          	ret

0000000080008864 <uartinit>:
    80008864:	ff010113          	addi	sp,sp,-16
    80008868:	00813423          	sd	s0,8(sp)
    8000886c:	01010413          	addi	s0,sp,16
    80008870:	100007b7          	lui	a5,0x10000
    80008874:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008878:	f8000713          	li	a4,-128
    8000887c:	00e781a3          	sb	a4,3(a5)
    80008880:	00300713          	li	a4,3
    80008884:	00e78023          	sb	a4,0(a5)
    80008888:	000780a3          	sb	zero,1(a5)
    8000888c:	00e781a3          	sb	a4,3(a5)
    80008890:	00700693          	li	a3,7
    80008894:	00d78123          	sb	a3,2(a5)
    80008898:	00e780a3          	sb	a4,1(a5)
    8000889c:	00813403          	ld	s0,8(sp)
    800088a0:	01010113          	addi	sp,sp,16
    800088a4:	00008067          	ret

00000000800088a8 <uartputc>:
    800088a8:	00004797          	auipc	a5,0x4
    800088ac:	4c07a783          	lw	a5,1216(a5) # 8000cd68 <panicked>
    800088b0:	00078463          	beqz	a5,800088b8 <uartputc+0x10>
    800088b4:	0000006f          	j	800088b4 <uartputc+0xc>
    800088b8:	fd010113          	addi	sp,sp,-48
    800088bc:	02813023          	sd	s0,32(sp)
    800088c0:	00913c23          	sd	s1,24(sp)
    800088c4:	01213823          	sd	s2,16(sp)
    800088c8:	01313423          	sd	s3,8(sp)
    800088cc:	02113423          	sd	ra,40(sp)
    800088d0:	03010413          	addi	s0,sp,48
    800088d4:	00004917          	auipc	s2,0x4
    800088d8:	49c90913          	addi	s2,s2,1180 # 8000cd70 <uart_tx_r>
    800088dc:	00093783          	ld	a5,0(s2)
    800088e0:	00004497          	auipc	s1,0x4
    800088e4:	49848493          	addi	s1,s1,1176 # 8000cd78 <uart_tx_w>
    800088e8:	0004b703          	ld	a4,0(s1)
    800088ec:	02078693          	addi	a3,a5,32
    800088f0:	00050993          	mv	s3,a0
    800088f4:	02e69c63          	bne	a3,a4,8000892c <uartputc+0x84>
    800088f8:	00001097          	auipc	ra,0x1
    800088fc:	834080e7          	jalr	-1996(ra) # 8000912c <push_on>
    80008900:	00093783          	ld	a5,0(s2)
    80008904:	0004b703          	ld	a4,0(s1)
    80008908:	02078793          	addi	a5,a5,32
    8000890c:	00e79463          	bne	a5,a4,80008914 <uartputc+0x6c>
    80008910:	0000006f          	j	80008910 <uartputc+0x68>
    80008914:	00001097          	auipc	ra,0x1
    80008918:	88c080e7          	jalr	-1908(ra) # 800091a0 <pop_on>
    8000891c:	00093783          	ld	a5,0(s2)
    80008920:	0004b703          	ld	a4,0(s1)
    80008924:	02078693          	addi	a3,a5,32
    80008928:	fce688e3          	beq	a3,a4,800088f8 <uartputc+0x50>
    8000892c:	01f77693          	andi	a3,a4,31
    80008930:	00006597          	auipc	a1,0x6
    80008934:	81058593          	addi	a1,a1,-2032 # 8000e140 <uart_tx_buf>
    80008938:	00d586b3          	add	a3,a1,a3
    8000893c:	00170713          	addi	a4,a4,1
    80008940:	01368023          	sb	s3,0(a3)
    80008944:	00e4b023          	sd	a4,0(s1)
    80008948:	10000637          	lui	a2,0x10000
    8000894c:	02f71063          	bne	a4,a5,8000896c <uartputc+0xc4>
    80008950:	0340006f          	j	80008984 <uartputc+0xdc>
    80008954:	00074703          	lbu	a4,0(a4)
    80008958:	00f93023          	sd	a5,0(s2)
    8000895c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008960:	00093783          	ld	a5,0(s2)
    80008964:	0004b703          	ld	a4,0(s1)
    80008968:	00f70e63          	beq	a4,a5,80008984 <uartputc+0xdc>
    8000896c:	00564683          	lbu	a3,5(a2)
    80008970:	01f7f713          	andi	a4,a5,31
    80008974:	00e58733          	add	a4,a1,a4
    80008978:	0206f693          	andi	a3,a3,32
    8000897c:	00178793          	addi	a5,a5,1
    80008980:	fc069ae3          	bnez	a3,80008954 <uartputc+0xac>
    80008984:	02813083          	ld	ra,40(sp)
    80008988:	02013403          	ld	s0,32(sp)
    8000898c:	01813483          	ld	s1,24(sp)
    80008990:	01013903          	ld	s2,16(sp)
    80008994:	00813983          	ld	s3,8(sp)
    80008998:	03010113          	addi	sp,sp,48
    8000899c:	00008067          	ret

00000000800089a0 <uartputc_sync>:
    800089a0:	ff010113          	addi	sp,sp,-16
    800089a4:	00813423          	sd	s0,8(sp)
    800089a8:	01010413          	addi	s0,sp,16
    800089ac:	00004717          	auipc	a4,0x4
    800089b0:	3bc72703          	lw	a4,956(a4) # 8000cd68 <panicked>
    800089b4:	02071663          	bnez	a4,800089e0 <uartputc_sync+0x40>
    800089b8:	00050793          	mv	a5,a0
    800089bc:	100006b7          	lui	a3,0x10000
    800089c0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800089c4:	02077713          	andi	a4,a4,32
    800089c8:	fe070ce3          	beqz	a4,800089c0 <uartputc_sync+0x20>
    800089cc:	0ff7f793          	andi	a5,a5,255
    800089d0:	00f68023          	sb	a5,0(a3)
    800089d4:	00813403          	ld	s0,8(sp)
    800089d8:	01010113          	addi	sp,sp,16
    800089dc:	00008067          	ret
    800089e0:	0000006f          	j	800089e0 <uartputc_sync+0x40>

00000000800089e4 <uartstart>:
    800089e4:	ff010113          	addi	sp,sp,-16
    800089e8:	00813423          	sd	s0,8(sp)
    800089ec:	01010413          	addi	s0,sp,16
    800089f0:	00004617          	auipc	a2,0x4
    800089f4:	38060613          	addi	a2,a2,896 # 8000cd70 <uart_tx_r>
    800089f8:	00004517          	auipc	a0,0x4
    800089fc:	38050513          	addi	a0,a0,896 # 8000cd78 <uart_tx_w>
    80008a00:	00063783          	ld	a5,0(a2)
    80008a04:	00053703          	ld	a4,0(a0)
    80008a08:	04f70263          	beq	a4,a5,80008a4c <uartstart+0x68>
    80008a0c:	100005b7          	lui	a1,0x10000
    80008a10:	00005817          	auipc	a6,0x5
    80008a14:	73080813          	addi	a6,a6,1840 # 8000e140 <uart_tx_buf>
    80008a18:	01c0006f          	j	80008a34 <uartstart+0x50>
    80008a1c:	0006c703          	lbu	a4,0(a3)
    80008a20:	00f63023          	sd	a5,0(a2)
    80008a24:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008a28:	00063783          	ld	a5,0(a2)
    80008a2c:	00053703          	ld	a4,0(a0)
    80008a30:	00f70e63          	beq	a4,a5,80008a4c <uartstart+0x68>
    80008a34:	01f7f713          	andi	a4,a5,31
    80008a38:	00e806b3          	add	a3,a6,a4
    80008a3c:	0055c703          	lbu	a4,5(a1)
    80008a40:	00178793          	addi	a5,a5,1
    80008a44:	02077713          	andi	a4,a4,32
    80008a48:	fc071ae3          	bnez	a4,80008a1c <uartstart+0x38>
    80008a4c:	00813403          	ld	s0,8(sp)
    80008a50:	01010113          	addi	sp,sp,16
    80008a54:	00008067          	ret

0000000080008a58 <uartgetc>:
    80008a58:	ff010113          	addi	sp,sp,-16
    80008a5c:	00813423          	sd	s0,8(sp)
    80008a60:	01010413          	addi	s0,sp,16
    80008a64:	10000737          	lui	a4,0x10000
    80008a68:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80008a6c:	0017f793          	andi	a5,a5,1
    80008a70:	00078c63          	beqz	a5,80008a88 <uartgetc+0x30>
    80008a74:	00074503          	lbu	a0,0(a4)
    80008a78:	0ff57513          	andi	a0,a0,255
    80008a7c:	00813403          	ld	s0,8(sp)
    80008a80:	01010113          	addi	sp,sp,16
    80008a84:	00008067          	ret
    80008a88:	fff00513          	li	a0,-1
    80008a8c:	ff1ff06f          	j	80008a7c <uartgetc+0x24>

0000000080008a90 <uartintr>:
    80008a90:	100007b7          	lui	a5,0x10000
    80008a94:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008a98:	0017f793          	andi	a5,a5,1
    80008a9c:	0a078463          	beqz	a5,80008b44 <uartintr+0xb4>
    80008aa0:	fe010113          	addi	sp,sp,-32
    80008aa4:	00813823          	sd	s0,16(sp)
    80008aa8:	00913423          	sd	s1,8(sp)
    80008aac:	00113c23          	sd	ra,24(sp)
    80008ab0:	02010413          	addi	s0,sp,32
    80008ab4:	100004b7          	lui	s1,0x10000
    80008ab8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80008abc:	0ff57513          	andi	a0,a0,255
    80008ac0:	fffff097          	auipc	ra,0xfffff
    80008ac4:	534080e7          	jalr	1332(ra) # 80007ff4 <consoleintr>
    80008ac8:	0054c783          	lbu	a5,5(s1)
    80008acc:	0017f793          	andi	a5,a5,1
    80008ad0:	fe0794e3          	bnez	a5,80008ab8 <uartintr+0x28>
    80008ad4:	00004617          	auipc	a2,0x4
    80008ad8:	29c60613          	addi	a2,a2,668 # 8000cd70 <uart_tx_r>
    80008adc:	00004517          	auipc	a0,0x4
    80008ae0:	29c50513          	addi	a0,a0,668 # 8000cd78 <uart_tx_w>
    80008ae4:	00063783          	ld	a5,0(a2)
    80008ae8:	00053703          	ld	a4,0(a0)
    80008aec:	04f70263          	beq	a4,a5,80008b30 <uartintr+0xa0>
    80008af0:	100005b7          	lui	a1,0x10000
    80008af4:	00005817          	auipc	a6,0x5
    80008af8:	64c80813          	addi	a6,a6,1612 # 8000e140 <uart_tx_buf>
    80008afc:	01c0006f          	j	80008b18 <uartintr+0x88>
    80008b00:	0006c703          	lbu	a4,0(a3)
    80008b04:	00f63023          	sd	a5,0(a2)
    80008b08:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008b0c:	00063783          	ld	a5,0(a2)
    80008b10:	00053703          	ld	a4,0(a0)
    80008b14:	00f70e63          	beq	a4,a5,80008b30 <uartintr+0xa0>
    80008b18:	01f7f713          	andi	a4,a5,31
    80008b1c:	00e806b3          	add	a3,a6,a4
    80008b20:	0055c703          	lbu	a4,5(a1)
    80008b24:	00178793          	addi	a5,a5,1
    80008b28:	02077713          	andi	a4,a4,32
    80008b2c:	fc071ae3          	bnez	a4,80008b00 <uartintr+0x70>
    80008b30:	01813083          	ld	ra,24(sp)
    80008b34:	01013403          	ld	s0,16(sp)
    80008b38:	00813483          	ld	s1,8(sp)
    80008b3c:	02010113          	addi	sp,sp,32
    80008b40:	00008067          	ret
    80008b44:	00004617          	auipc	a2,0x4
    80008b48:	22c60613          	addi	a2,a2,556 # 8000cd70 <uart_tx_r>
    80008b4c:	00004517          	auipc	a0,0x4
    80008b50:	22c50513          	addi	a0,a0,556 # 8000cd78 <uart_tx_w>
    80008b54:	00063783          	ld	a5,0(a2)
    80008b58:	00053703          	ld	a4,0(a0)
    80008b5c:	04f70263          	beq	a4,a5,80008ba0 <uartintr+0x110>
    80008b60:	100005b7          	lui	a1,0x10000
    80008b64:	00005817          	auipc	a6,0x5
    80008b68:	5dc80813          	addi	a6,a6,1500 # 8000e140 <uart_tx_buf>
    80008b6c:	01c0006f          	j	80008b88 <uartintr+0xf8>
    80008b70:	0006c703          	lbu	a4,0(a3)
    80008b74:	00f63023          	sd	a5,0(a2)
    80008b78:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008b7c:	00063783          	ld	a5,0(a2)
    80008b80:	00053703          	ld	a4,0(a0)
    80008b84:	02f70063          	beq	a4,a5,80008ba4 <uartintr+0x114>
    80008b88:	01f7f713          	andi	a4,a5,31
    80008b8c:	00e806b3          	add	a3,a6,a4
    80008b90:	0055c703          	lbu	a4,5(a1)
    80008b94:	00178793          	addi	a5,a5,1
    80008b98:	02077713          	andi	a4,a4,32
    80008b9c:	fc071ae3          	bnez	a4,80008b70 <uartintr+0xe0>
    80008ba0:	00008067          	ret
    80008ba4:	00008067          	ret

0000000080008ba8 <kinit>:
    80008ba8:	fc010113          	addi	sp,sp,-64
    80008bac:	02913423          	sd	s1,40(sp)
    80008bb0:	fffff7b7          	lui	a5,0xfffff
    80008bb4:	00006497          	auipc	s1,0x6
    80008bb8:	5ab48493          	addi	s1,s1,1451 # 8000f15f <end+0xfff>
    80008bbc:	02813823          	sd	s0,48(sp)
    80008bc0:	01313c23          	sd	s3,24(sp)
    80008bc4:	00f4f4b3          	and	s1,s1,a5
    80008bc8:	02113c23          	sd	ra,56(sp)
    80008bcc:	03213023          	sd	s2,32(sp)
    80008bd0:	01413823          	sd	s4,16(sp)
    80008bd4:	01513423          	sd	s5,8(sp)
    80008bd8:	04010413          	addi	s0,sp,64
    80008bdc:	000017b7          	lui	a5,0x1
    80008be0:	01100993          	li	s3,17
    80008be4:	00f487b3          	add	a5,s1,a5
    80008be8:	01b99993          	slli	s3,s3,0x1b
    80008bec:	06f9e063          	bltu	s3,a5,80008c4c <kinit+0xa4>
    80008bf0:	00005a97          	auipc	s5,0x5
    80008bf4:	570a8a93          	addi	s5,s5,1392 # 8000e160 <end>
    80008bf8:	0754ec63          	bltu	s1,s5,80008c70 <kinit+0xc8>
    80008bfc:	0734fa63          	bgeu	s1,s3,80008c70 <kinit+0xc8>
    80008c00:	00088a37          	lui	s4,0x88
    80008c04:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008c08:	00004917          	auipc	s2,0x4
    80008c0c:	17890913          	addi	s2,s2,376 # 8000cd80 <kmem>
    80008c10:	00ca1a13          	slli	s4,s4,0xc
    80008c14:	0140006f          	j	80008c28 <kinit+0x80>
    80008c18:	000017b7          	lui	a5,0x1
    80008c1c:	00f484b3          	add	s1,s1,a5
    80008c20:	0554e863          	bltu	s1,s5,80008c70 <kinit+0xc8>
    80008c24:	0534f663          	bgeu	s1,s3,80008c70 <kinit+0xc8>
    80008c28:	00001637          	lui	a2,0x1
    80008c2c:	00100593          	li	a1,1
    80008c30:	00048513          	mv	a0,s1
    80008c34:	00000097          	auipc	ra,0x0
    80008c38:	5e4080e7          	jalr	1508(ra) # 80009218 <__memset>
    80008c3c:	00093783          	ld	a5,0(s2)
    80008c40:	00f4b023          	sd	a5,0(s1)
    80008c44:	00993023          	sd	s1,0(s2)
    80008c48:	fd4498e3          	bne	s1,s4,80008c18 <kinit+0x70>
    80008c4c:	03813083          	ld	ra,56(sp)
    80008c50:	03013403          	ld	s0,48(sp)
    80008c54:	02813483          	ld	s1,40(sp)
    80008c58:	02013903          	ld	s2,32(sp)
    80008c5c:	01813983          	ld	s3,24(sp)
    80008c60:	01013a03          	ld	s4,16(sp)
    80008c64:	00813a83          	ld	s5,8(sp)
    80008c68:	04010113          	addi	sp,sp,64
    80008c6c:	00008067          	ret
    80008c70:	00002517          	auipc	a0,0x2
    80008c74:	c0050513          	addi	a0,a0,-1024 # 8000a870 <digits+0x18>
    80008c78:	fffff097          	auipc	ra,0xfffff
    80008c7c:	4b4080e7          	jalr	1204(ra) # 8000812c <panic>

0000000080008c80 <freerange>:
    80008c80:	fc010113          	addi	sp,sp,-64
    80008c84:	000017b7          	lui	a5,0x1
    80008c88:	02913423          	sd	s1,40(sp)
    80008c8c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008c90:	009504b3          	add	s1,a0,s1
    80008c94:	fffff537          	lui	a0,0xfffff
    80008c98:	02813823          	sd	s0,48(sp)
    80008c9c:	02113c23          	sd	ra,56(sp)
    80008ca0:	03213023          	sd	s2,32(sp)
    80008ca4:	01313c23          	sd	s3,24(sp)
    80008ca8:	01413823          	sd	s4,16(sp)
    80008cac:	01513423          	sd	s5,8(sp)
    80008cb0:	01613023          	sd	s6,0(sp)
    80008cb4:	04010413          	addi	s0,sp,64
    80008cb8:	00a4f4b3          	and	s1,s1,a0
    80008cbc:	00f487b3          	add	a5,s1,a5
    80008cc0:	06f5e463          	bltu	a1,a5,80008d28 <freerange+0xa8>
    80008cc4:	00005a97          	auipc	s5,0x5
    80008cc8:	49ca8a93          	addi	s5,s5,1180 # 8000e160 <end>
    80008ccc:	0954e263          	bltu	s1,s5,80008d50 <freerange+0xd0>
    80008cd0:	01100993          	li	s3,17
    80008cd4:	01b99993          	slli	s3,s3,0x1b
    80008cd8:	0734fc63          	bgeu	s1,s3,80008d50 <freerange+0xd0>
    80008cdc:	00058a13          	mv	s4,a1
    80008ce0:	00004917          	auipc	s2,0x4
    80008ce4:	0a090913          	addi	s2,s2,160 # 8000cd80 <kmem>
    80008ce8:	00002b37          	lui	s6,0x2
    80008cec:	0140006f          	j	80008d00 <freerange+0x80>
    80008cf0:	000017b7          	lui	a5,0x1
    80008cf4:	00f484b3          	add	s1,s1,a5
    80008cf8:	0554ec63          	bltu	s1,s5,80008d50 <freerange+0xd0>
    80008cfc:	0534fa63          	bgeu	s1,s3,80008d50 <freerange+0xd0>
    80008d00:	00001637          	lui	a2,0x1
    80008d04:	00100593          	li	a1,1
    80008d08:	00048513          	mv	a0,s1
    80008d0c:	00000097          	auipc	ra,0x0
    80008d10:	50c080e7          	jalr	1292(ra) # 80009218 <__memset>
    80008d14:	00093703          	ld	a4,0(s2)
    80008d18:	016487b3          	add	a5,s1,s6
    80008d1c:	00e4b023          	sd	a4,0(s1)
    80008d20:	00993023          	sd	s1,0(s2)
    80008d24:	fcfa76e3          	bgeu	s4,a5,80008cf0 <freerange+0x70>
    80008d28:	03813083          	ld	ra,56(sp)
    80008d2c:	03013403          	ld	s0,48(sp)
    80008d30:	02813483          	ld	s1,40(sp)
    80008d34:	02013903          	ld	s2,32(sp)
    80008d38:	01813983          	ld	s3,24(sp)
    80008d3c:	01013a03          	ld	s4,16(sp)
    80008d40:	00813a83          	ld	s5,8(sp)
    80008d44:	00013b03          	ld	s6,0(sp)
    80008d48:	04010113          	addi	sp,sp,64
    80008d4c:	00008067          	ret
    80008d50:	00002517          	auipc	a0,0x2
    80008d54:	b2050513          	addi	a0,a0,-1248 # 8000a870 <digits+0x18>
    80008d58:	fffff097          	auipc	ra,0xfffff
    80008d5c:	3d4080e7          	jalr	980(ra) # 8000812c <panic>

0000000080008d60 <kfree>:
    80008d60:	fe010113          	addi	sp,sp,-32
    80008d64:	00813823          	sd	s0,16(sp)
    80008d68:	00113c23          	sd	ra,24(sp)
    80008d6c:	00913423          	sd	s1,8(sp)
    80008d70:	02010413          	addi	s0,sp,32
    80008d74:	03451793          	slli	a5,a0,0x34
    80008d78:	04079c63          	bnez	a5,80008dd0 <kfree+0x70>
    80008d7c:	00005797          	auipc	a5,0x5
    80008d80:	3e478793          	addi	a5,a5,996 # 8000e160 <end>
    80008d84:	00050493          	mv	s1,a0
    80008d88:	04f56463          	bltu	a0,a5,80008dd0 <kfree+0x70>
    80008d8c:	01100793          	li	a5,17
    80008d90:	01b79793          	slli	a5,a5,0x1b
    80008d94:	02f57e63          	bgeu	a0,a5,80008dd0 <kfree+0x70>
    80008d98:	00001637          	lui	a2,0x1
    80008d9c:	00100593          	li	a1,1
    80008da0:	00000097          	auipc	ra,0x0
    80008da4:	478080e7          	jalr	1144(ra) # 80009218 <__memset>
    80008da8:	00004797          	auipc	a5,0x4
    80008dac:	fd878793          	addi	a5,a5,-40 # 8000cd80 <kmem>
    80008db0:	0007b703          	ld	a4,0(a5)
    80008db4:	01813083          	ld	ra,24(sp)
    80008db8:	01013403          	ld	s0,16(sp)
    80008dbc:	00e4b023          	sd	a4,0(s1)
    80008dc0:	0097b023          	sd	s1,0(a5)
    80008dc4:	00813483          	ld	s1,8(sp)
    80008dc8:	02010113          	addi	sp,sp,32
    80008dcc:	00008067          	ret
    80008dd0:	00002517          	auipc	a0,0x2
    80008dd4:	aa050513          	addi	a0,a0,-1376 # 8000a870 <digits+0x18>
    80008dd8:	fffff097          	auipc	ra,0xfffff
    80008ddc:	354080e7          	jalr	852(ra) # 8000812c <panic>

0000000080008de0 <kalloc>:
    80008de0:	fe010113          	addi	sp,sp,-32
    80008de4:	00813823          	sd	s0,16(sp)
    80008de8:	00913423          	sd	s1,8(sp)
    80008dec:	00113c23          	sd	ra,24(sp)
    80008df0:	02010413          	addi	s0,sp,32
    80008df4:	00004797          	auipc	a5,0x4
    80008df8:	f8c78793          	addi	a5,a5,-116 # 8000cd80 <kmem>
    80008dfc:	0007b483          	ld	s1,0(a5)
    80008e00:	02048063          	beqz	s1,80008e20 <kalloc+0x40>
    80008e04:	0004b703          	ld	a4,0(s1)
    80008e08:	00001637          	lui	a2,0x1
    80008e0c:	00500593          	li	a1,5
    80008e10:	00048513          	mv	a0,s1
    80008e14:	00e7b023          	sd	a4,0(a5)
    80008e18:	00000097          	auipc	ra,0x0
    80008e1c:	400080e7          	jalr	1024(ra) # 80009218 <__memset>
    80008e20:	01813083          	ld	ra,24(sp)
    80008e24:	01013403          	ld	s0,16(sp)
    80008e28:	00048513          	mv	a0,s1
    80008e2c:	00813483          	ld	s1,8(sp)
    80008e30:	02010113          	addi	sp,sp,32
    80008e34:	00008067          	ret

0000000080008e38 <initlock>:
    80008e38:	ff010113          	addi	sp,sp,-16
    80008e3c:	00813423          	sd	s0,8(sp)
    80008e40:	01010413          	addi	s0,sp,16
    80008e44:	00813403          	ld	s0,8(sp)
    80008e48:	00b53423          	sd	a1,8(a0)
    80008e4c:	00052023          	sw	zero,0(a0)
    80008e50:	00053823          	sd	zero,16(a0)
    80008e54:	01010113          	addi	sp,sp,16
    80008e58:	00008067          	ret

0000000080008e5c <acquire>:
    80008e5c:	fe010113          	addi	sp,sp,-32
    80008e60:	00813823          	sd	s0,16(sp)
    80008e64:	00913423          	sd	s1,8(sp)
    80008e68:	00113c23          	sd	ra,24(sp)
    80008e6c:	01213023          	sd	s2,0(sp)
    80008e70:	02010413          	addi	s0,sp,32
    80008e74:	00050493          	mv	s1,a0
    80008e78:	10002973          	csrr	s2,sstatus
    80008e7c:	100027f3          	csrr	a5,sstatus
    80008e80:	ffd7f793          	andi	a5,a5,-3
    80008e84:	10079073          	csrw	sstatus,a5
    80008e88:	fffff097          	auipc	ra,0xfffff
    80008e8c:	8e4080e7          	jalr	-1820(ra) # 8000776c <mycpu>
    80008e90:	07852783          	lw	a5,120(a0)
    80008e94:	06078e63          	beqz	a5,80008f10 <acquire+0xb4>
    80008e98:	fffff097          	auipc	ra,0xfffff
    80008e9c:	8d4080e7          	jalr	-1836(ra) # 8000776c <mycpu>
    80008ea0:	07852783          	lw	a5,120(a0)
    80008ea4:	0004a703          	lw	a4,0(s1)
    80008ea8:	0017879b          	addiw	a5,a5,1
    80008eac:	06f52c23          	sw	a5,120(a0)
    80008eb0:	04071063          	bnez	a4,80008ef0 <acquire+0x94>
    80008eb4:	00100713          	li	a4,1
    80008eb8:	00070793          	mv	a5,a4
    80008ebc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008ec0:	0007879b          	sext.w	a5,a5
    80008ec4:	fe079ae3          	bnez	a5,80008eb8 <acquire+0x5c>
    80008ec8:	0ff0000f          	fence
    80008ecc:	fffff097          	auipc	ra,0xfffff
    80008ed0:	8a0080e7          	jalr	-1888(ra) # 8000776c <mycpu>
    80008ed4:	01813083          	ld	ra,24(sp)
    80008ed8:	01013403          	ld	s0,16(sp)
    80008edc:	00a4b823          	sd	a0,16(s1)
    80008ee0:	00013903          	ld	s2,0(sp)
    80008ee4:	00813483          	ld	s1,8(sp)
    80008ee8:	02010113          	addi	sp,sp,32
    80008eec:	00008067          	ret
    80008ef0:	0104b903          	ld	s2,16(s1)
    80008ef4:	fffff097          	auipc	ra,0xfffff
    80008ef8:	878080e7          	jalr	-1928(ra) # 8000776c <mycpu>
    80008efc:	faa91ce3          	bne	s2,a0,80008eb4 <acquire+0x58>
    80008f00:	00002517          	auipc	a0,0x2
    80008f04:	97850513          	addi	a0,a0,-1672 # 8000a878 <digits+0x20>
    80008f08:	fffff097          	auipc	ra,0xfffff
    80008f0c:	224080e7          	jalr	548(ra) # 8000812c <panic>
    80008f10:	00195913          	srli	s2,s2,0x1
    80008f14:	fffff097          	auipc	ra,0xfffff
    80008f18:	858080e7          	jalr	-1960(ra) # 8000776c <mycpu>
    80008f1c:	00197913          	andi	s2,s2,1
    80008f20:	07252e23          	sw	s2,124(a0)
    80008f24:	f75ff06f          	j	80008e98 <acquire+0x3c>

0000000080008f28 <release>:
    80008f28:	fe010113          	addi	sp,sp,-32
    80008f2c:	00813823          	sd	s0,16(sp)
    80008f30:	00113c23          	sd	ra,24(sp)
    80008f34:	00913423          	sd	s1,8(sp)
    80008f38:	01213023          	sd	s2,0(sp)
    80008f3c:	02010413          	addi	s0,sp,32
    80008f40:	00052783          	lw	a5,0(a0)
    80008f44:	00079a63          	bnez	a5,80008f58 <release+0x30>
    80008f48:	00002517          	auipc	a0,0x2
    80008f4c:	93850513          	addi	a0,a0,-1736 # 8000a880 <digits+0x28>
    80008f50:	fffff097          	auipc	ra,0xfffff
    80008f54:	1dc080e7          	jalr	476(ra) # 8000812c <panic>
    80008f58:	01053903          	ld	s2,16(a0)
    80008f5c:	00050493          	mv	s1,a0
    80008f60:	fffff097          	auipc	ra,0xfffff
    80008f64:	80c080e7          	jalr	-2036(ra) # 8000776c <mycpu>
    80008f68:	fea910e3          	bne	s2,a0,80008f48 <release+0x20>
    80008f6c:	0004b823          	sd	zero,16(s1)
    80008f70:	0ff0000f          	fence
    80008f74:	0f50000f          	fence	iorw,ow
    80008f78:	0804a02f          	amoswap.w	zero,zero,(s1)
    80008f7c:	ffffe097          	auipc	ra,0xffffe
    80008f80:	7f0080e7          	jalr	2032(ra) # 8000776c <mycpu>
    80008f84:	100027f3          	csrr	a5,sstatus
    80008f88:	0027f793          	andi	a5,a5,2
    80008f8c:	04079a63          	bnez	a5,80008fe0 <release+0xb8>
    80008f90:	07852783          	lw	a5,120(a0)
    80008f94:	02f05e63          	blez	a5,80008fd0 <release+0xa8>
    80008f98:	fff7871b          	addiw	a4,a5,-1
    80008f9c:	06e52c23          	sw	a4,120(a0)
    80008fa0:	00071c63          	bnez	a4,80008fb8 <release+0x90>
    80008fa4:	07c52783          	lw	a5,124(a0)
    80008fa8:	00078863          	beqz	a5,80008fb8 <release+0x90>
    80008fac:	100027f3          	csrr	a5,sstatus
    80008fb0:	0027e793          	ori	a5,a5,2
    80008fb4:	10079073          	csrw	sstatus,a5
    80008fb8:	01813083          	ld	ra,24(sp)
    80008fbc:	01013403          	ld	s0,16(sp)
    80008fc0:	00813483          	ld	s1,8(sp)
    80008fc4:	00013903          	ld	s2,0(sp)
    80008fc8:	02010113          	addi	sp,sp,32
    80008fcc:	00008067          	ret
    80008fd0:	00002517          	auipc	a0,0x2
    80008fd4:	8d050513          	addi	a0,a0,-1840 # 8000a8a0 <digits+0x48>
    80008fd8:	fffff097          	auipc	ra,0xfffff
    80008fdc:	154080e7          	jalr	340(ra) # 8000812c <panic>
    80008fe0:	00002517          	auipc	a0,0x2
    80008fe4:	8a850513          	addi	a0,a0,-1880 # 8000a888 <digits+0x30>
    80008fe8:	fffff097          	auipc	ra,0xfffff
    80008fec:	144080e7          	jalr	324(ra) # 8000812c <panic>

0000000080008ff0 <holding>:
    80008ff0:	00052783          	lw	a5,0(a0)
    80008ff4:	00079663          	bnez	a5,80009000 <holding+0x10>
    80008ff8:	00000513          	li	a0,0
    80008ffc:	00008067          	ret
    80009000:	fe010113          	addi	sp,sp,-32
    80009004:	00813823          	sd	s0,16(sp)
    80009008:	00913423          	sd	s1,8(sp)
    8000900c:	00113c23          	sd	ra,24(sp)
    80009010:	02010413          	addi	s0,sp,32
    80009014:	01053483          	ld	s1,16(a0)
    80009018:	ffffe097          	auipc	ra,0xffffe
    8000901c:	754080e7          	jalr	1876(ra) # 8000776c <mycpu>
    80009020:	01813083          	ld	ra,24(sp)
    80009024:	01013403          	ld	s0,16(sp)
    80009028:	40a48533          	sub	a0,s1,a0
    8000902c:	00153513          	seqz	a0,a0
    80009030:	00813483          	ld	s1,8(sp)
    80009034:	02010113          	addi	sp,sp,32
    80009038:	00008067          	ret

000000008000903c <push_off>:
    8000903c:	fe010113          	addi	sp,sp,-32
    80009040:	00813823          	sd	s0,16(sp)
    80009044:	00113c23          	sd	ra,24(sp)
    80009048:	00913423          	sd	s1,8(sp)
    8000904c:	02010413          	addi	s0,sp,32
    80009050:	100024f3          	csrr	s1,sstatus
    80009054:	100027f3          	csrr	a5,sstatus
    80009058:	ffd7f793          	andi	a5,a5,-3
    8000905c:	10079073          	csrw	sstatus,a5
    80009060:	ffffe097          	auipc	ra,0xffffe
    80009064:	70c080e7          	jalr	1804(ra) # 8000776c <mycpu>
    80009068:	07852783          	lw	a5,120(a0)
    8000906c:	02078663          	beqz	a5,80009098 <push_off+0x5c>
    80009070:	ffffe097          	auipc	ra,0xffffe
    80009074:	6fc080e7          	jalr	1788(ra) # 8000776c <mycpu>
    80009078:	07852783          	lw	a5,120(a0)
    8000907c:	01813083          	ld	ra,24(sp)
    80009080:	01013403          	ld	s0,16(sp)
    80009084:	0017879b          	addiw	a5,a5,1
    80009088:	06f52c23          	sw	a5,120(a0)
    8000908c:	00813483          	ld	s1,8(sp)
    80009090:	02010113          	addi	sp,sp,32
    80009094:	00008067          	ret
    80009098:	0014d493          	srli	s1,s1,0x1
    8000909c:	ffffe097          	auipc	ra,0xffffe
    800090a0:	6d0080e7          	jalr	1744(ra) # 8000776c <mycpu>
    800090a4:	0014f493          	andi	s1,s1,1
    800090a8:	06952e23          	sw	s1,124(a0)
    800090ac:	fc5ff06f          	j	80009070 <push_off+0x34>

00000000800090b0 <pop_off>:
    800090b0:	ff010113          	addi	sp,sp,-16
    800090b4:	00813023          	sd	s0,0(sp)
    800090b8:	00113423          	sd	ra,8(sp)
    800090bc:	01010413          	addi	s0,sp,16
    800090c0:	ffffe097          	auipc	ra,0xffffe
    800090c4:	6ac080e7          	jalr	1708(ra) # 8000776c <mycpu>
    800090c8:	100027f3          	csrr	a5,sstatus
    800090cc:	0027f793          	andi	a5,a5,2
    800090d0:	04079663          	bnez	a5,8000911c <pop_off+0x6c>
    800090d4:	07852783          	lw	a5,120(a0)
    800090d8:	02f05a63          	blez	a5,8000910c <pop_off+0x5c>
    800090dc:	fff7871b          	addiw	a4,a5,-1
    800090e0:	06e52c23          	sw	a4,120(a0)
    800090e4:	00071c63          	bnez	a4,800090fc <pop_off+0x4c>
    800090e8:	07c52783          	lw	a5,124(a0)
    800090ec:	00078863          	beqz	a5,800090fc <pop_off+0x4c>
    800090f0:	100027f3          	csrr	a5,sstatus
    800090f4:	0027e793          	ori	a5,a5,2
    800090f8:	10079073          	csrw	sstatus,a5
    800090fc:	00813083          	ld	ra,8(sp)
    80009100:	00013403          	ld	s0,0(sp)
    80009104:	01010113          	addi	sp,sp,16
    80009108:	00008067          	ret
    8000910c:	00001517          	auipc	a0,0x1
    80009110:	79450513          	addi	a0,a0,1940 # 8000a8a0 <digits+0x48>
    80009114:	fffff097          	auipc	ra,0xfffff
    80009118:	018080e7          	jalr	24(ra) # 8000812c <panic>
    8000911c:	00001517          	auipc	a0,0x1
    80009120:	76c50513          	addi	a0,a0,1900 # 8000a888 <digits+0x30>
    80009124:	fffff097          	auipc	ra,0xfffff
    80009128:	008080e7          	jalr	8(ra) # 8000812c <panic>

000000008000912c <push_on>:
    8000912c:	fe010113          	addi	sp,sp,-32
    80009130:	00813823          	sd	s0,16(sp)
    80009134:	00113c23          	sd	ra,24(sp)
    80009138:	00913423          	sd	s1,8(sp)
    8000913c:	02010413          	addi	s0,sp,32
    80009140:	100024f3          	csrr	s1,sstatus
    80009144:	100027f3          	csrr	a5,sstatus
    80009148:	0027e793          	ori	a5,a5,2
    8000914c:	10079073          	csrw	sstatus,a5
    80009150:	ffffe097          	auipc	ra,0xffffe
    80009154:	61c080e7          	jalr	1564(ra) # 8000776c <mycpu>
    80009158:	07852783          	lw	a5,120(a0)
    8000915c:	02078663          	beqz	a5,80009188 <push_on+0x5c>
    80009160:	ffffe097          	auipc	ra,0xffffe
    80009164:	60c080e7          	jalr	1548(ra) # 8000776c <mycpu>
    80009168:	07852783          	lw	a5,120(a0)
    8000916c:	01813083          	ld	ra,24(sp)
    80009170:	01013403          	ld	s0,16(sp)
    80009174:	0017879b          	addiw	a5,a5,1
    80009178:	06f52c23          	sw	a5,120(a0)
    8000917c:	00813483          	ld	s1,8(sp)
    80009180:	02010113          	addi	sp,sp,32
    80009184:	00008067          	ret
    80009188:	0014d493          	srli	s1,s1,0x1
    8000918c:	ffffe097          	auipc	ra,0xffffe
    80009190:	5e0080e7          	jalr	1504(ra) # 8000776c <mycpu>
    80009194:	0014f493          	andi	s1,s1,1
    80009198:	06952e23          	sw	s1,124(a0)
    8000919c:	fc5ff06f          	j	80009160 <push_on+0x34>

00000000800091a0 <pop_on>:
    800091a0:	ff010113          	addi	sp,sp,-16
    800091a4:	00813023          	sd	s0,0(sp)
    800091a8:	00113423          	sd	ra,8(sp)
    800091ac:	01010413          	addi	s0,sp,16
    800091b0:	ffffe097          	auipc	ra,0xffffe
    800091b4:	5bc080e7          	jalr	1468(ra) # 8000776c <mycpu>
    800091b8:	100027f3          	csrr	a5,sstatus
    800091bc:	0027f793          	andi	a5,a5,2
    800091c0:	04078463          	beqz	a5,80009208 <pop_on+0x68>
    800091c4:	07852783          	lw	a5,120(a0)
    800091c8:	02f05863          	blez	a5,800091f8 <pop_on+0x58>
    800091cc:	fff7879b          	addiw	a5,a5,-1
    800091d0:	06f52c23          	sw	a5,120(a0)
    800091d4:	07853783          	ld	a5,120(a0)
    800091d8:	00079863          	bnez	a5,800091e8 <pop_on+0x48>
    800091dc:	100027f3          	csrr	a5,sstatus
    800091e0:	ffd7f793          	andi	a5,a5,-3
    800091e4:	10079073          	csrw	sstatus,a5
    800091e8:	00813083          	ld	ra,8(sp)
    800091ec:	00013403          	ld	s0,0(sp)
    800091f0:	01010113          	addi	sp,sp,16
    800091f4:	00008067          	ret
    800091f8:	00001517          	auipc	a0,0x1
    800091fc:	6d050513          	addi	a0,a0,1744 # 8000a8c8 <digits+0x70>
    80009200:	fffff097          	auipc	ra,0xfffff
    80009204:	f2c080e7          	jalr	-212(ra) # 8000812c <panic>
    80009208:	00001517          	auipc	a0,0x1
    8000920c:	6a050513          	addi	a0,a0,1696 # 8000a8a8 <digits+0x50>
    80009210:	fffff097          	auipc	ra,0xfffff
    80009214:	f1c080e7          	jalr	-228(ra) # 8000812c <panic>

0000000080009218 <__memset>:
    80009218:	ff010113          	addi	sp,sp,-16
    8000921c:	00813423          	sd	s0,8(sp)
    80009220:	01010413          	addi	s0,sp,16
    80009224:	1a060e63          	beqz	a2,800093e0 <__memset+0x1c8>
    80009228:	40a007b3          	neg	a5,a0
    8000922c:	0077f793          	andi	a5,a5,7
    80009230:	00778693          	addi	a3,a5,7
    80009234:	00b00813          	li	a6,11
    80009238:	0ff5f593          	andi	a1,a1,255
    8000923c:	fff6071b          	addiw	a4,a2,-1
    80009240:	1b06e663          	bltu	a3,a6,800093ec <__memset+0x1d4>
    80009244:	1cd76463          	bltu	a4,a3,8000940c <__memset+0x1f4>
    80009248:	1a078e63          	beqz	a5,80009404 <__memset+0x1ec>
    8000924c:	00b50023          	sb	a1,0(a0)
    80009250:	00100713          	li	a4,1
    80009254:	1ae78463          	beq	a5,a4,800093fc <__memset+0x1e4>
    80009258:	00b500a3          	sb	a1,1(a0)
    8000925c:	00200713          	li	a4,2
    80009260:	1ae78a63          	beq	a5,a4,80009414 <__memset+0x1fc>
    80009264:	00b50123          	sb	a1,2(a0)
    80009268:	00300713          	li	a4,3
    8000926c:	18e78463          	beq	a5,a4,800093f4 <__memset+0x1dc>
    80009270:	00b501a3          	sb	a1,3(a0)
    80009274:	00400713          	li	a4,4
    80009278:	1ae78263          	beq	a5,a4,8000941c <__memset+0x204>
    8000927c:	00b50223          	sb	a1,4(a0)
    80009280:	00500713          	li	a4,5
    80009284:	1ae78063          	beq	a5,a4,80009424 <__memset+0x20c>
    80009288:	00b502a3          	sb	a1,5(a0)
    8000928c:	00700713          	li	a4,7
    80009290:	18e79e63          	bne	a5,a4,8000942c <__memset+0x214>
    80009294:	00b50323          	sb	a1,6(a0)
    80009298:	00700e93          	li	t4,7
    8000929c:	00859713          	slli	a4,a1,0x8
    800092a0:	00e5e733          	or	a4,a1,a4
    800092a4:	01059e13          	slli	t3,a1,0x10
    800092a8:	01c76e33          	or	t3,a4,t3
    800092ac:	01859313          	slli	t1,a1,0x18
    800092b0:	006e6333          	or	t1,t3,t1
    800092b4:	02059893          	slli	a7,a1,0x20
    800092b8:	40f60e3b          	subw	t3,a2,a5
    800092bc:	011368b3          	or	a7,t1,a7
    800092c0:	02859813          	slli	a6,a1,0x28
    800092c4:	0108e833          	or	a6,a7,a6
    800092c8:	03059693          	slli	a3,a1,0x30
    800092cc:	003e589b          	srliw	a7,t3,0x3
    800092d0:	00d866b3          	or	a3,a6,a3
    800092d4:	03859713          	slli	a4,a1,0x38
    800092d8:	00389813          	slli	a6,a7,0x3
    800092dc:	00f507b3          	add	a5,a0,a5
    800092e0:	00e6e733          	or	a4,a3,a4
    800092e4:	000e089b          	sext.w	a7,t3
    800092e8:	00f806b3          	add	a3,a6,a5
    800092ec:	00e7b023          	sd	a4,0(a5)
    800092f0:	00878793          	addi	a5,a5,8
    800092f4:	fed79ce3          	bne	a5,a3,800092ec <__memset+0xd4>
    800092f8:	ff8e7793          	andi	a5,t3,-8
    800092fc:	0007871b          	sext.w	a4,a5
    80009300:	01d787bb          	addw	a5,a5,t4
    80009304:	0ce88e63          	beq	a7,a4,800093e0 <__memset+0x1c8>
    80009308:	00f50733          	add	a4,a0,a5
    8000930c:	00b70023          	sb	a1,0(a4)
    80009310:	0017871b          	addiw	a4,a5,1
    80009314:	0cc77663          	bgeu	a4,a2,800093e0 <__memset+0x1c8>
    80009318:	00e50733          	add	a4,a0,a4
    8000931c:	00b70023          	sb	a1,0(a4)
    80009320:	0027871b          	addiw	a4,a5,2
    80009324:	0ac77e63          	bgeu	a4,a2,800093e0 <__memset+0x1c8>
    80009328:	00e50733          	add	a4,a0,a4
    8000932c:	00b70023          	sb	a1,0(a4)
    80009330:	0037871b          	addiw	a4,a5,3
    80009334:	0ac77663          	bgeu	a4,a2,800093e0 <__memset+0x1c8>
    80009338:	00e50733          	add	a4,a0,a4
    8000933c:	00b70023          	sb	a1,0(a4)
    80009340:	0047871b          	addiw	a4,a5,4
    80009344:	08c77e63          	bgeu	a4,a2,800093e0 <__memset+0x1c8>
    80009348:	00e50733          	add	a4,a0,a4
    8000934c:	00b70023          	sb	a1,0(a4)
    80009350:	0057871b          	addiw	a4,a5,5
    80009354:	08c77663          	bgeu	a4,a2,800093e0 <__memset+0x1c8>
    80009358:	00e50733          	add	a4,a0,a4
    8000935c:	00b70023          	sb	a1,0(a4)
    80009360:	0067871b          	addiw	a4,a5,6
    80009364:	06c77e63          	bgeu	a4,a2,800093e0 <__memset+0x1c8>
    80009368:	00e50733          	add	a4,a0,a4
    8000936c:	00b70023          	sb	a1,0(a4)
    80009370:	0077871b          	addiw	a4,a5,7
    80009374:	06c77663          	bgeu	a4,a2,800093e0 <__memset+0x1c8>
    80009378:	00e50733          	add	a4,a0,a4
    8000937c:	00b70023          	sb	a1,0(a4)
    80009380:	0087871b          	addiw	a4,a5,8
    80009384:	04c77e63          	bgeu	a4,a2,800093e0 <__memset+0x1c8>
    80009388:	00e50733          	add	a4,a0,a4
    8000938c:	00b70023          	sb	a1,0(a4)
    80009390:	0097871b          	addiw	a4,a5,9
    80009394:	04c77663          	bgeu	a4,a2,800093e0 <__memset+0x1c8>
    80009398:	00e50733          	add	a4,a0,a4
    8000939c:	00b70023          	sb	a1,0(a4)
    800093a0:	00a7871b          	addiw	a4,a5,10
    800093a4:	02c77e63          	bgeu	a4,a2,800093e0 <__memset+0x1c8>
    800093a8:	00e50733          	add	a4,a0,a4
    800093ac:	00b70023          	sb	a1,0(a4)
    800093b0:	00b7871b          	addiw	a4,a5,11
    800093b4:	02c77663          	bgeu	a4,a2,800093e0 <__memset+0x1c8>
    800093b8:	00e50733          	add	a4,a0,a4
    800093bc:	00b70023          	sb	a1,0(a4)
    800093c0:	00c7871b          	addiw	a4,a5,12
    800093c4:	00c77e63          	bgeu	a4,a2,800093e0 <__memset+0x1c8>
    800093c8:	00e50733          	add	a4,a0,a4
    800093cc:	00b70023          	sb	a1,0(a4)
    800093d0:	00d7879b          	addiw	a5,a5,13
    800093d4:	00c7f663          	bgeu	a5,a2,800093e0 <__memset+0x1c8>
    800093d8:	00f507b3          	add	a5,a0,a5
    800093dc:	00b78023          	sb	a1,0(a5)
    800093e0:	00813403          	ld	s0,8(sp)
    800093e4:	01010113          	addi	sp,sp,16
    800093e8:	00008067          	ret
    800093ec:	00b00693          	li	a3,11
    800093f0:	e55ff06f          	j	80009244 <__memset+0x2c>
    800093f4:	00300e93          	li	t4,3
    800093f8:	ea5ff06f          	j	8000929c <__memset+0x84>
    800093fc:	00100e93          	li	t4,1
    80009400:	e9dff06f          	j	8000929c <__memset+0x84>
    80009404:	00000e93          	li	t4,0
    80009408:	e95ff06f          	j	8000929c <__memset+0x84>
    8000940c:	00000793          	li	a5,0
    80009410:	ef9ff06f          	j	80009308 <__memset+0xf0>
    80009414:	00200e93          	li	t4,2
    80009418:	e85ff06f          	j	8000929c <__memset+0x84>
    8000941c:	00400e93          	li	t4,4
    80009420:	e7dff06f          	j	8000929c <__memset+0x84>
    80009424:	00500e93          	li	t4,5
    80009428:	e75ff06f          	j	8000929c <__memset+0x84>
    8000942c:	00600e93          	li	t4,6
    80009430:	e6dff06f          	j	8000929c <__memset+0x84>

0000000080009434 <__memmove>:
    80009434:	ff010113          	addi	sp,sp,-16
    80009438:	00813423          	sd	s0,8(sp)
    8000943c:	01010413          	addi	s0,sp,16
    80009440:	0e060863          	beqz	a2,80009530 <__memmove+0xfc>
    80009444:	fff6069b          	addiw	a3,a2,-1
    80009448:	0006881b          	sext.w	a6,a3
    8000944c:	0ea5e863          	bltu	a1,a0,8000953c <__memmove+0x108>
    80009450:	00758713          	addi	a4,a1,7
    80009454:	00a5e7b3          	or	a5,a1,a0
    80009458:	40a70733          	sub	a4,a4,a0
    8000945c:	0077f793          	andi	a5,a5,7
    80009460:	00f73713          	sltiu	a4,a4,15
    80009464:	00174713          	xori	a4,a4,1
    80009468:	0017b793          	seqz	a5,a5
    8000946c:	00e7f7b3          	and	a5,a5,a4
    80009470:	10078863          	beqz	a5,80009580 <__memmove+0x14c>
    80009474:	00900793          	li	a5,9
    80009478:	1107f463          	bgeu	a5,a6,80009580 <__memmove+0x14c>
    8000947c:	0036581b          	srliw	a6,a2,0x3
    80009480:	fff8081b          	addiw	a6,a6,-1
    80009484:	02081813          	slli	a6,a6,0x20
    80009488:	01d85893          	srli	a7,a6,0x1d
    8000948c:	00858813          	addi	a6,a1,8
    80009490:	00058793          	mv	a5,a1
    80009494:	00050713          	mv	a4,a0
    80009498:	01088833          	add	a6,a7,a6
    8000949c:	0007b883          	ld	a7,0(a5)
    800094a0:	00878793          	addi	a5,a5,8
    800094a4:	00870713          	addi	a4,a4,8
    800094a8:	ff173c23          	sd	a7,-8(a4)
    800094ac:	ff0798e3          	bne	a5,a6,8000949c <__memmove+0x68>
    800094b0:	ff867713          	andi	a4,a2,-8
    800094b4:	02071793          	slli	a5,a4,0x20
    800094b8:	0207d793          	srli	a5,a5,0x20
    800094bc:	00f585b3          	add	a1,a1,a5
    800094c0:	40e686bb          	subw	a3,a3,a4
    800094c4:	00f507b3          	add	a5,a0,a5
    800094c8:	06e60463          	beq	a2,a4,80009530 <__memmove+0xfc>
    800094cc:	0005c703          	lbu	a4,0(a1)
    800094d0:	00e78023          	sb	a4,0(a5)
    800094d4:	04068e63          	beqz	a3,80009530 <__memmove+0xfc>
    800094d8:	0015c603          	lbu	a2,1(a1)
    800094dc:	00100713          	li	a4,1
    800094e0:	00c780a3          	sb	a2,1(a5)
    800094e4:	04e68663          	beq	a3,a4,80009530 <__memmove+0xfc>
    800094e8:	0025c603          	lbu	a2,2(a1)
    800094ec:	00200713          	li	a4,2
    800094f0:	00c78123          	sb	a2,2(a5)
    800094f4:	02e68e63          	beq	a3,a4,80009530 <__memmove+0xfc>
    800094f8:	0035c603          	lbu	a2,3(a1)
    800094fc:	00300713          	li	a4,3
    80009500:	00c781a3          	sb	a2,3(a5)
    80009504:	02e68663          	beq	a3,a4,80009530 <__memmove+0xfc>
    80009508:	0045c603          	lbu	a2,4(a1)
    8000950c:	00400713          	li	a4,4
    80009510:	00c78223          	sb	a2,4(a5)
    80009514:	00e68e63          	beq	a3,a4,80009530 <__memmove+0xfc>
    80009518:	0055c603          	lbu	a2,5(a1)
    8000951c:	00500713          	li	a4,5
    80009520:	00c782a3          	sb	a2,5(a5)
    80009524:	00e68663          	beq	a3,a4,80009530 <__memmove+0xfc>
    80009528:	0065c703          	lbu	a4,6(a1)
    8000952c:	00e78323          	sb	a4,6(a5)
    80009530:	00813403          	ld	s0,8(sp)
    80009534:	01010113          	addi	sp,sp,16
    80009538:	00008067          	ret
    8000953c:	02061713          	slli	a4,a2,0x20
    80009540:	02075713          	srli	a4,a4,0x20
    80009544:	00e587b3          	add	a5,a1,a4
    80009548:	f0f574e3          	bgeu	a0,a5,80009450 <__memmove+0x1c>
    8000954c:	02069613          	slli	a2,a3,0x20
    80009550:	02065613          	srli	a2,a2,0x20
    80009554:	fff64613          	not	a2,a2
    80009558:	00e50733          	add	a4,a0,a4
    8000955c:	00c78633          	add	a2,a5,a2
    80009560:	fff7c683          	lbu	a3,-1(a5)
    80009564:	fff78793          	addi	a5,a5,-1
    80009568:	fff70713          	addi	a4,a4,-1
    8000956c:	00d70023          	sb	a3,0(a4)
    80009570:	fec798e3          	bne	a5,a2,80009560 <__memmove+0x12c>
    80009574:	00813403          	ld	s0,8(sp)
    80009578:	01010113          	addi	sp,sp,16
    8000957c:	00008067          	ret
    80009580:	02069713          	slli	a4,a3,0x20
    80009584:	02075713          	srli	a4,a4,0x20
    80009588:	00170713          	addi	a4,a4,1
    8000958c:	00e50733          	add	a4,a0,a4
    80009590:	00050793          	mv	a5,a0
    80009594:	0005c683          	lbu	a3,0(a1)
    80009598:	00178793          	addi	a5,a5,1
    8000959c:	00158593          	addi	a1,a1,1
    800095a0:	fed78fa3          	sb	a3,-1(a5)
    800095a4:	fee798e3          	bne	a5,a4,80009594 <__memmove+0x160>
    800095a8:	f89ff06f          	j	80009530 <__memmove+0xfc>
	...
