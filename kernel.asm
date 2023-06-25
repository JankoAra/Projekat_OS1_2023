
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	c4013103          	ld	sp,-960(sp) # 8000cc40 <_GLOBAL_OFFSET_TABLE_+0x48>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	2b8070ef          	jal	ra,800072d4 <start>

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
    80001084:	661000ef          	jal	ra,80001ee4 <interruptRoutine>

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
    800013a4:	8b07b783          	ld	a5,-1872(a5) # 8000cc50 <_GLOBAL_OFFSET_TABLE_+0x58>
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
    800015f0:	6647b783          	ld	a5,1636(a5) # 8000cc50 <_GLOBAL_OFFSET_TABLE_+0x58>
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
    80001684:	6507c783          	lbu	a5,1616(a5) # 8000ccd0 <_ZN8KConsole11initializedE>
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
    800016a8:	62c48493          	addi	s1,s1,1580 # 8000ccd0 <_ZN8KConsole11initializedE>
    800016ac:	0000b797          	auipc	a5,0xb
    800016b0:	55c7b783          	ld	a5,1372(a5) # 8000cc08 <_GLOBAL_OFFSET_TABLE_+0x10>
    800016b4:	0007b783          	ld	a5,0(a5)
    800016b8:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    800016bc:	0000b797          	auipc	a5,0xb
    800016c0:	55c7b783          	ld	a5,1372(a5) # 8000cc18 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016c4:	0007b783          	ld	a5,0(a5)
    800016c8:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    800016cc:	06400593          	li	a1,100
    800016d0:	0000b517          	auipc	a0,0xb
    800016d4:	61850513          	addi	a0,a0,1560 # 8000cce8 <_ZN8KConsole19inputBufferHasSpaceE>
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	dd4080e7          	jalr	-556(ra) # 800014ac <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016e0:	06400593          	li	a1,100
    800016e4:	0000b517          	auipc	a0,0xb
    800016e8:	60c50513          	addi	a0,a0,1548 # 8000ccf0 <_ZN8KConsole20outputBufferHasSpaceE>
    800016ec:	00000097          	auipc	ra,0x0
    800016f0:	dc0080e7          	jalr	-576(ra) # 800014ac <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016f4:	00000593          	li	a1,0
    800016f8:	0000b517          	auipc	a0,0xb
    800016fc:	60050513          	addi	a0,a0,1536 # 8000ccf8 <_ZN8KConsole12charsToInputE>
    80001700:	00000097          	auipc	ra,0x0
    80001704:	dac080e7          	jalr	-596(ra) # 800014ac <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    80001708:	00000593          	li	a1,0
    8000170c:	0000b517          	auipc	a0,0xb
    80001710:	5f450513          	addi	a0,a0,1524 # 8000cd00 <_ZN8KConsole13charsToOutputE>
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
    80001750:	58448493          	addi	s1,s1,1412 # 8000ccd0 <_ZN8KConsole11initializedE>
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
    80001794:	5e472703          	lw	a4,1508(a4) # 8000cd74 <_ZN8KConsole15inputBufferSizeE>
    80001798:	06400793          	li	a5,100
    8000179c:	04f70e63          	beq	a4,a5,800017f8 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    800017a0:	ff010113          	addi	sp,sp,-16
    800017a4:	00113423          	sd	ra,8(sp)
    800017a8:	00813023          	sd	s0,0(sp)
    800017ac:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    800017b0:	0000b697          	auipc	a3,0xb
    800017b4:	52068693          	addi	a3,a3,1312 # 8000ccd0 <_ZN8KConsole11initializedE>
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
    8000181c:	4b848493          	addi	s1,s1,1208 # 8000ccd0 <_ZN8KConsole11initializedE>
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
    80001884:	45048493          	addi	s1,s1,1104 # 8000ccd0 <_ZN8KConsole11initializedE>
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
    800018e0:	5147b783          	ld	a5,1300(a5) # 8000cdf0 <_ZN9Scheduler4tailE>
    800018e4:	02078263          	beqz	a5,80001908 <_ZN9Scheduler3putEP3TCB+0x38>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    800018e8:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    800018ec:	0000b797          	auipc	a5,0xb
    800018f0:	50a7b223          	sd	a0,1284(a5) # 8000cdf0 <_ZN9Scheduler4tailE>

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
    8000190c:	4e878793          	addi	a5,a5,1256 # 8000cdf0 <_ZN9Scheduler4tailE>
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
    8000192c:	4c870713          	addi	a4,a4,1224 # 8000cdf0 <_ZN9Scheduler4tailE>
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
    80001974:	49083803          	ld	a6,1168(a6) # 8000ce00 <_ZN9Scheduler12sleepingHeadE>
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
    800019ac:	44a7bc23          	sd	a0,1112(a5) # 8000ce00 <_ZN9Scheduler12sleepingHeadE>
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
    800019f4:	40a7b823          	sd	a0,1040(a5) # 8000ce00 <_ZN9Scheduler12sleepingHeadE>
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
    80001a10:	3f47b783          	ld	a5,1012(a5) # 8000ce00 <_ZN9Scheduler12sleepingHeadE>
    80001a14:	06078a63          	beqz	a5,80001a88 <_ZN9Scheduler4wakeEv+0x7c>
    sleepingHead->timeToSleep--;
    80001a18:	0387b703          	ld	a4,56(a5)
    80001a1c:	fff70713          	addi	a4,a4,-1
    80001a20:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001a24:	0000b517          	auipc	a0,0xb
    80001a28:	3dc53503          	ld	a0,988(a0) # 8000ce00 <_ZN9Scheduler12sleepingHeadE>
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
    80001a5c:	3af73423          	sd	a5,936(a4) # 8000ce00 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    80001a60:	04053023          	sd	zero,64(a0)
        Scheduler::put(thread);
    80001a64:	00000097          	auipc	ra,0x0
    80001a68:	e6c080e7          	jalr	-404(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001a6c:	0000b517          	auipc	a0,0xb
    80001a70:	39453503          	ld	a0,916(a0) # 8000ce00 <_ZN9Scheduler12sleepingHeadE>
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
    80001aa0:	36c7b783          	ld	a5,876(a5) # 8000ce08 <_ZN7KMemory14freeBlocksLeftE>
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
    80001acc:	3486b683          	ld	a3,840(a3) # 8000ce10 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001ad0:	08d5fa63          	bgeu	a1,a3,80001b64 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001ad4:	03f00693          	li	a3,63
    80001ad8:	02d78a63          	beq	a5,a3,80001b0c <_ZN7KMemory7kmallocEm+0x80>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    80001adc:	00359693          	slli	a3,a1,0x3
    80001ae0:	0000b617          	auipc	a2,0xb
    80001ae4:	33863603          	ld	a2,824(a2) # 8000ce18 <_ZN7KMemory9bitVectorE>
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
    80001b14:	30863603          	ld	a2,776(a2) # 8000ce18 <_ZN7KMemory9bitVectorE>
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
    80001b78:	0ac6b683          	ld	a3,172(a3) # 8000cc20 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80001ba8:	2746b683          	ld	a3,628(a3) # 8000ce18 <_ZN7KMemory9bitVectorE>
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
    80001bd8:	23470713          	addi	a4,a4,564 # 8000ce08 <_ZN7KMemory14freeBlocksLeftE>
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
    80001c14:	2107c783          	lbu	a5,528(a5) # 8000ce20 <_ZN7KMemory11initializedE>
    80001c18:	0a079863          	bnez	a5,80001cc8 <_ZN7KMemory16initializeMemoryEv+0xb8>
void KMemory::initializeMemory() {
    80001c1c:	ff010113          	addi	sp,sp,-16
    80001c20:	00113423          	sd	ra,8(sp)
    80001c24:	00813023          	sd	s0,0(sp)
    80001c28:	01010413          	addi	s0,sp,16
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001c2c:	0000b797          	auipc	a5,0xb
    80001c30:	03c7b783          	ld	a5,60(a5) # 8000cc68 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001c34:	0007b783          	ld	a5,0(a5)
    80001c38:	0000b717          	auipc	a4,0xb
    80001c3c:	fe873703          	ld	a4,-24(a4) # 8000cc20 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c40:	00073603          	ld	a2,0(a4)
    80001c44:	40c787b3          	sub	a5,a5,a2
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    80001c48:	00c7d793          	srli	a5,a5,0xc
    80001c4c:	0000b717          	auipc	a4,0xb
    80001c50:	1bc70713          	addi	a4,a4,444 # 8000ce08 <_ZN7KMemory14freeBlocksLeftE>
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
    80001c80:	19473703          	ld	a4,404(a4) # 8000ce10 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001c84:	02e7f063          	bgeu	a5,a4,80001ca4 <_ZN7KMemory16initializeMemoryEv+0x94>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    80001c88:	00379693          	slli	a3,a5,0x3
    80001c8c:	0000b717          	auipc	a4,0xb
    80001c90:	18c73703          	ld	a4,396(a4) # 8000ce18 <_ZN7KMemory9bitVectorE>
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
    80001cb4:	16f70823          	sb	a5,368(a4) # 8000ce20 <_ZN7KMemory11initializedE>
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
    80001ce4:	f4073703          	ld	a4,-192(a4) # 8000cc20 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001ce8:	00073703          	ld	a4,0(a4)
    80001cec:	40e787b3          	sub	a5,a5,a4
    80001cf0:	03f7f713          	andi	a4,a5,63
    80001cf4:	08071063          	bnez	a4,80001d74 <_ZN7KMemory5kfreeEPv+0xa8>
    uint64 blocksToFree = *(uint64*)ptr;
    80001cf8:	ff053583          	ld	a1,-16(a0)
    freeBlocksLeft += blocksToFree;
    80001cfc:	0000b697          	auipc	a3,0xb
    80001d00:	10c68693          	addi	a3,a3,268 # 8000ce08 <_ZN7KMemory14freeBlocksLeftE>
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
    80001d40:	0dc6b683          	ld	a3,220(a3) # 8000ce18 <_ZN7KMemory9bitVectorE>
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

    static uint8 getSRvalue() { return *sr; }

    static uint8 getDRvalue() { return *dr; }

    static void setDRvalue(char c) { *dr = c; }
    80001dbc:	0000b797          	auipc	a5,0xb
    80001dc0:	e8c7b783          	ld	a5,-372(a5) # 8000cc48 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001dc4:	0007b783          	ld	a5,0(a5)
    80001dc8:	00a78023          	sb	a0,0(a5)
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
        KConsole::setDRvalue(c);
        sem_signal(KConsole::getOutputBufferHasSpace());
    80001dcc:	0000b797          	auipc	a5,0xb
    80001dd0:	e8c7b783          	ld	a5,-372(a5) # 8000cc58 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001dd4:	0007b503          	ld	a0,0(a5)
    80001dd8:	fffff097          	auipc	ra,0xfffff
    80001ddc:	76c080e7          	jalr	1900(ra) # 80001544 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001de0:	00000097          	auipc	ra,0x0
    80001de4:	958080e7          	jalr	-1704(ra) # 80001738 <_ZN8KConsole13getFromOutputEv>
    static uint8 getSRvalue() { return *sr; }
    80001de8:	0000b797          	auipc	a5,0xb
    80001dec:	ea07b783          	ld	a5,-352(a5) # 8000cc88 <_GLOBAL_OFFSET_TABLE_+0x90>
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
    80001e04:	fc010113          	addi	sp,sp,-64
    80001e08:	02113c23          	sd	ra,56(sp)
    80001e0c:	02813823          	sd	s0,48(sp)
    80001e10:	02913423          	sd	s1,40(sp)
    80001e14:	04010413          	addi	s0,sp,64
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001e18:	0000b797          	auipc	a5,0xb
    80001e1c:	e587b783          	ld	a5,-424(a5) # 8000cc70 <_GLOBAL_OFFSET_TABLE_+0x78>
    80001e20:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80001e24:	00000097          	auipc	ra,0x0
    80001e28:	dec080e7          	jalr	-532(ra) # 80001c10 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001e2c:	00000097          	auipc	ra,0x0
    80001e30:	854080e7          	jalr	-1964(ra) # 80001680 <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, (TCB::Body)main, nullptr);
    80001e34:	00000613          	li	a2,0
    80001e38:	00000597          	auipc	a1,0x0
    80001e3c:	fcc58593          	addi	a1,a1,-52 # 80001e04 <main>
    80001e40:	fd840513          	addi	a0,s0,-40
    80001e44:	fffff097          	auipc	ra,0xfffff
    80001e48:	534080e7          	jalr	1332(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80001e4c:	fd843783          	ld	a5,-40(s0)

    Body getBody() { return threadFunction; }

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }
    80001e50:	0000b717          	auipc	a4,0xb
    80001e54:	e1073703          	ld	a4,-496(a4) # 8000cc60 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001e58:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001e5c:	00100713          	li	a4,1
    80001e60:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    80001e64:	00000613          	li	a2,0
    80001e68:	0000b597          	auipc	a1,0xb
    80001e6c:	d985b583          	ld	a1,-616(a1) # 8000cc00 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001e70:	fd040513          	addi	a0,s0,-48
    80001e74:	fffff097          	auipc	ra,0xfffff
    80001e78:	504080e7          	jalr	1284(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80001e7c:	00000613          	li	a2,0
    80001e80:	00000597          	auipc	a1,0x0
    80001e84:	f2858593          	addi	a1,a1,-216 # 80001da8 <_Z22kernelConsumerFunctionPv>
    80001e88:	fc040513          	addi	a0,s0,-64
    80001e8c:	fffff097          	auipc	ra,0xfffff
    80001e90:	4ec080e7          	jalr	1260(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80001e94:	00000613          	li	a2,0
    80001e98:	00000597          	auipc	a1,0x0
    80001e9c:	ef458593          	addi	a1,a1,-268 # 80001d8c <_Z4idlePv>
    80001ea0:	fc840513          	addi	a0,s0,-56
    80001ea4:	fffff097          	auipc	ra,0xfffff
    80001ea8:	4d4080e7          	jalr	1236(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001eac:	00200493          	li	s1,2
    80001eb0:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80001eb4:	fd043503          	ld	a0,-48(s0)
    80001eb8:	fffff097          	auipc	ra,0xfffff
    80001ebc:	59c080e7          	jalr	1436(ra) # 80001454 <_Z11thread_joinP3TCB>
        __asm__ volatile("li a0, 0x43");
    80001ec0:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80001ec4:	00000073          	ecall
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001ec8:	1004b073          	csrc	sstatus,s1

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80001ecc:	00000513          	li	a0,0
    80001ed0:	03813083          	ld	ra,56(sp)
    80001ed4:	03013403          	ld	s0,48(sp)
    80001ed8:	02813483          	ld	s1,40(sp)
    80001edc:	04010113          	addi	sp,sp,64
    80001ee0:	00008067          	ret

0000000080001ee4 <interruptRoutine>:
#include "../h/Scheduler.hpp"

int main();

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001ee4:	f9010113          	addi	sp,sp,-112
    80001ee8:	06113423          	sd	ra,104(sp)
    80001eec:	06813023          	sd	s0,96(sp)
    80001ef0:	04913c23          	sd	s1,88(sp)
    80001ef4:	07010413          	addi	s0,sp,112
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ef8:	14202373          	csrr	t1,scause
    80001efc:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f00:	14102373          	csrr	t1,sepc
    80001f04:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f08:	10002373          	csrr	t1,sstatus
    80001f0c:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4;
    //uint64 a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f10:	00050313          	mv	t1,a0
    80001f14:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f18:	00058313          	mv	t1,a1
    80001f1c:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f20:	00060313          	mv	t1,a2
    80001f24:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f28:	00068313          	mv	t1,a3
    80001f2c:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001f30:	00070313          	mv	t1,a4
    80001f34:	fa643023          	sd	t1,-96(s0)
//    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
//    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");

    if (scause == 0x9 || scause == 0x8) {
    80001f38:	fd843703          	ld	a4,-40(s0)
    80001f3c:	00900793          	li	a5,9
    80001f40:	00f70863          	beq	a4,a5,80001f50 <interruptRoutine+0x6c>
    80001f44:	fd843703          	ld	a4,-40(s0)
    80001f48:	00800793          	li	a5,8
    80001f4c:	46f71663          	bne	a4,a5,800023b8 <interruptRoutine+0x4d4>
        //prekid zbog poziva ecall
        switch (a0) {
    80001f50:	fc043703          	ld	a4,-64(s0)
    80001f54:	08100793          	li	a5,129
    80001f58:	34f70c63          	beq	a4,a5,800022b0 <interruptRoutine+0x3cc>
    80001f5c:	fc043703          	ld	a4,-64(s0)
    80001f60:	08100793          	li	a5,129
    80001f64:	38e7e663          	bltu	a5,a4,800022f0 <interruptRoutine+0x40c>
    80001f68:	fc043703          	ld	a4,-64(s0)
    80001f6c:	04300793          	li	a5,67
    80001f70:	04e7e263          	bltu	a5,a4,80001fb4 <interruptRoutine+0xd0>
    80001f74:	fc043783          	ld	a5,-64(s0)
    80001f78:	36078c63          	beqz	a5,800022f0 <interruptRoutine+0x40c>
    80001f7c:	fc043703          	ld	a4,-64(s0)
    80001f80:	04300793          	li	a5,67
    80001f84:	36e7e663          	bltu	a5,a4,800022f0 <interruptRoutine+0x40c>
    80001f88:	fc043783          	ld	a5,-64(s0)
    80001f8c:	00279713          	slli	a4,a5,0x2
    80001f90:	00008797          	auipc	a5,0x8
    80001f94:	10478793          	addi	a5,a5,260 # 8000a094 <CONSOLE_STATUS+0x84>
    80001f98:	00f707b3          	add	a5,a4,a5
    80001f9c:	0007a783          	lw	a5,0(a5)
    80001fa0:	0007871b          	sext.w	a4,a5
    80001fa4:	00008797          	auipc	a5,0x8
    80001fa8:	0f078793          	addi	a5,a5,240 # 8000a094 <CONSOLE_STATUS+0x84>
    80001fac:	00f707b3          	add	a5,a4,a5
    80001fb0:	00078067          	jr	a5
    80001fb4:	fc043703          	ld	a4,-64(s0)
    80001fb8:	08000793          	li	a5,128
    80001fbc:	2af70463          	beq	a4,a5,80002264 <interruptRoutine+0x380>
    80001fc0:	3300006f          	j	800022f0 <interruptRoutine+0x40c>
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                KMemory::kmalloc((size_t)a1);
    80001fc4:	fb843503          	ld	a0,-72(s0)
    80001fc8:	00000097          	auipc	ra,0x0
    80001fcc:	ac4080e7          	jalr	-1340(ra) # 80001a8c <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    80001fd0:	04a43823          	sd	a0,80(s0)
                break;
    80001fd4:	3c00006f          	j	80002394 <interruptRoutine+0x4b0>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                KMemory::kfree((void*)a1);
    80001fd8:	fb843783          	ld	a5,-72(s0)
    80001fdc:	00078513          	mv	a0,a5
    80001fe0:	00000097          	auipc	ra,0x0
    80001fe4:	cec080e7          	jalr	-788(ra) # 80001ccc <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    80001fe8:	04a43823          	sd	a0,80(s0)
                break;
    80001fec:	3a80006f          	j	80002394 <interruptRoutine+0x4b0>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80001ff0:	fb043783          	ld	a5,-80(s0)
    80001ff4:	fa843703          	ld	a4,-88(s0)
    80001ff8:	fa043683          	ld	a3,-96(s0)
    80001ffc:	fb843483          	ld	s1,-72(s0)
    80002000:	00068613          	mv	a2,a3
    80002004:	00070593          	mv	a1,a4
    80002008:	00078513          	mv	a0,a5
    8000200c:	00001097          	auipc	ra,0x1
    80002010:	efc080e7          	jalr	-260(ra) # 80002f08 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002014:	00050793          	mv	a5,a0
    80002018:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    8000201c:	fb843783          	ld	a5,-72(s0)
    80002020:	0007b783          	ld	a5,0(a5)
    80002024:	02078863          	beqz	a5,80002054 <interruptRoutine+0x170>
                    if ((TCB::Body)a2 != (TCB::Body)main) {
    80002028:	fb043703          	ld	a4,-80(s0)
    8000202c:	0000b797          	auipc	a5,0xb
    80002030:	c247b783          	ld	a5,-988(a5) # 8000cc50 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002034:	00f70c63          	beq	a4,a5,8000204c <interruptRoutine+0x168>
                        Scheduler::put(*((thread_t*)a1));
    80002038:	fb843783          	ld	a5,-72(s0)
    8000203c:	0007b783          	ld	a5,0(a5)
    80002040:	00078513          	mv	a0,a5
    80002044:	00000097          	auipc	ra,0x0
    80002048:	88c080e7          	jalr	-1908(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
                    }
                    __asm__ volatile("li a0, 0");
    8000204c:	00000513          	li	a0,0
    80002050:	0080006f          	j	80002058 <interruptRoutine+0x174>
                } else {
                    __asm__ volatile("li a0, -1");
    80002054:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002058:	04a43823          	sd	a0,80(s0)
                break;
    8000205c:	3380006f          	j	80002394 <interruptRoutine+0x4b0>
            case 0x12:
                //thread_exit
                TCB::getRunning()->setStatus(TCB::FINISHED);
    80002060:	00000097          	auipc	ra,0x0
    80002064:	6cc080e7          	jalr	1740(ra) # 8000272c <_ZN3TCB10getRunningEv>
    80002068:	00050793          	mv	a5,a0
    8000206c:	00500593          	li	a1,5
    80002070:	00078513          	mv	a0,a5
    80002074:	00000097          	auipc	ra,0x0
    80002078:	664080e7          	jalr	1636(ra) # 800026d8 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined();
    8000207c:	00001097          	auipc	ra,0x1
    80002080:	fb8080e7          	jalr	-72(ra) # 80003034 <_ZN3TCB13releaseJoinedEv>
                __asm__ volatile("li a0, 0");
    80002084:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 80(s0)");
    80002088:	04a43823          	sd	a0,80(s0)
                TCB::dispatch();
    8000208c:	00001097          	auipc	ra,0x1
    80002090:	da0080e7          	jalr	-608(ra) # 80002e2c <_ZN3TCB8dispatchEv>
                break;
    80002094:	3000006f          	j	80002394 <interruptRoutine+0x4b0>
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
    80002098:	00001097          	auipc	ra,0x1
    8000209c:	d94080e7          	jalr	-620(ra) # 80002e2c <_ZN3TCB8dispatchEv>
                break;
    800020a0:	2f40006f          	j	80002394 <interruptRoutine+0x4b0>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    800020a4:	fb843783          	ld	a5,-72(s0)
    800020a8:	00078513          	mv	a0,a5
    800020ac:	00001097          	auipc	ra,0x1
    800020b0:	f38080e7          	jalr	-200(ra) # 80002fe4 <_ZN3TCB10threadJoinEPS_>
                TCB::dispatch();
    800020b4:	00001097          	auipc	ra,0x1
    800020b8:	d78080e7          	jalr	-648(ra) # 80002e2c <_ZN3TCB8dispatchEv>
                break;
    800020bc:	2d80006f          	j	80002394 <interruptRoutine+0x4b0>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    800020c0:	fb043783          	ld	a5,-80(s0)
    800020c4:	0007879b          	sext.w	a5,a5
    800020c8:	fb843483          	ld	s1,-72(s0)
    800020cc:	00078513          	mv	a0,a5
    800020d0:	00001097          	auipc	ra,0x1
    800020d4:	068080e7          	jalr	104(ra) # 80003138 <_ZN4KSem7initSemEj>
    800020d8:	00050793          	mv	a5,a0
    800020dc:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    800020e0:	fb843783          	ld	a5,-72(s0)
    800020e4:	0007b783          	ld	a5,0(a5)
    800020e8:	00078663          	beqz	a5,800020f4 <interruptRoutine+0x210>
                    __asm__ volatile("li a0, 0");
    800020ec:	00000513          	li	a0,0
    800020f0:	0080006f          	j	800020f8 <interruptRoutine+0x214>
                } else {
                    __asm__ volatile("li a0, -1");
    800020f4:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800020f8:	04a43823          	sd	a0,80(s0)
                break;
    800020fc:	2980006f          	j	80002394 <interruptRoutine+0x4b0>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    80002100:	fb843783          	ld	a5,-72(s0)
    80002104:	00078513          	mv	a0,a5
    80002108:	00001097          	auipc	ra,0x1
    8000210c:	1a4080e7          	jalr	420(ra) # 800032ac <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    80002110:	04a43823          	sd	a0,80(s0)
                delete (sem_t)a1;
    80002114:	fb843483          	ld	s1,-72(s0)
    80002118:	26048063          	beqz	s1,80002378 <interruptRoutine+0x494>
    8000211c:	00048513          	mv	a0,s1
    80002120:	00000097          	auipc	ra,0x0
    80002124:	46c080e7          	jalr	1132(ra) # 8000258c <_ZN4KSemD1Ev>
    80002128:	00048513          	mv	a0,s1
    8000212c:	00001097          	auipc	ra,0x1
    80002130:	fe4080e7          	jalr	-28(ra) # 80003110 <_ZN4KSemdlEPv>
                break;
    80002134:	2440006f          	j	80002378 <interruptRoutine+0x494>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80002138:	fb843783          	ld	a5,-72(s0)
    8000213c:	00078513          	mv	a0,a5
    80002140:	00001097          	auipc	ra,0x1
    80002144:	08c080e7          	jalr	140(ra) # 800031cc <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002148:	04a43823          	sd	a0,80(s0)
                break;
    8000214c:	2480006f          	j	80002394 <interruptRoutine+0x4b0>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    80002150:	fb843783          	ld	a5,-72(s0)
    80002154:	00078513          	mv	a0,a5
    80002158:	00001097          	auipc	ra,0x1
    8000215c:	100080e7          	jalr	256(ra) # 80003258 <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002160:	04a43823          	sd	a0,80(s0)
                break;
    80002164:	2300006f          	j	80002394 <interruptRoutine+0x4b0>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    80002168:	fb843783          	ld	a5,-72(s0)
    8000216c:	00078663          	beqz	a5,80002178 <interruptRoutine+0x294>
                    __asm__ volatile("li a0, 0");
    80002170:	00000513          	li	a0,0
    80002174:	0080006f          	j	8000217c <interruptRoutine+0x298>
                } else {
                    __asm__ volatile("li a0, -1");
    80002178:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    8000217c:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    80002180:	fb843783          	ld	a5,-72(s0)
    80002184:	1e078e63          	beqz	a5,80002380 <interruptRoutine+0x49c>
                    Scheduler::putToSleep(TCB::getRunning(), (time_t)a1);
    80002188:	00000097          	auipc	ra,0x0
    8000218c:	5a4080e7          	jalr	1444(ra) # 8000272c <_ZN3TCB10getRunningEv>
    80002190:	00050793          	mv	a5,a0
    80002194:	fb843583          	ld	a1,-72(s0)
    80002198:	00078513          	mv	a0,a5
    8000219c:	fffff097          	auipc	ra,0xfffff
    800021a0:	7c0080e7          	jalr	1984(ra) # 8000195c <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::dispatch();
    800021a4:	00001097          	auipc	ra,0x1
    800021a8:	c88080e7          	jalr	-888(ra) # 80002e2c <_ZN3TCB8dispatchEv>
                }
                break;
    800021ac:	1d40006f          	j	80002380 <interruptRoutine+0x49c>
            case 0x41:
                //getc
                KConsole::kgetc();
    800021b0:	fffff097          	auipc	ra,0xfffff
    800021b4:	6bc080e7          	jalr	1724(ra) # 8000186c <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    800021b8:	04a43823          	sd	a0,80(s0)
                break;
    800021bc:	1d80006f          	j	80002394 <interruptRoutine+0x4b0>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    800021c0:	fb843783          	ld	a5,-72(s0)
    800021c4:	0ff7f793          	andi	a5,a5,255
    800021c8:	00078513          	mv	a0,a5
    800021cc:	fffff097          	auipc	ra,0xfffff
    800021d0:	630080e7          	jalr	1584(ra) # 800017fc <_ZN8KConsole5kputcEc>
                break;
    800021d4:	1c00006f          	j	80002394 <interruptRoutine+0x4b0>
            case 0x43:
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    800021d8:	00000097          	auipc	ra,0x0
    800021dc:	4b8080e7          	jalr	1208(ra) # 80002690 <_ZN8KConsole13getOutputHeadEv>
    800021e0:	00050793          	mv	a5,a0
    800021e4:	00078493          	mv	s1,a5
    800021e8:	00000097          	auipc	ra,0x0
    800021ec:	4cc080e7          	jalr	1228(ra) # 800026b4 <_ZN8KConsole13getOutputTailEv>
    800021f0:	00050793          	mv	a5,a0
    800021f4:	00048713          	mv	a4,s1
    800021f8:	40f707b3          	sub	a5,a4,a5
    800021fc:	00f037b3          	snez	a5,a5
    80002200:	0ff7f793          	andi	a5,a5,255
    80002204:	18078263          	beqz	a5,80002388 <interruptRoutine+0x4a4>
                    char c = KConsole::getFromOutput();
    80002208:	fffff097          	auipc	ra,0xfffff
    8000220c:	530080e7          	jalr	1328(ra) # 80001738 <_ZN8KConsole13getFromOutputEv>
    80002210:	00050793          	mv	a5,a0
    80002214:	f8f40ba3          	sb	a5,-105(s0)
                    while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
    80002218:	00000097          	auipc	ra,0x0
    8000221c:	3dc080e7          	jalr	988(ra) # 800025f4 <_ZN8KConsole10getSRvalueEv>
    80002220:	00050793          	mv	a5,a0
    80002224:	0207f793          	andi	a5,a5,32
    80002228:	0017b793          	seqz	a5,a5
    8000222c:	0ff7f793          	andi	a5,a5,255
    80002230:	00078463          	beqz	a5,80002238 <interruptRoutine+0x354>
    80002234:	fe5ff06f          	j	80002218 <interruptRoutine+0x334>
                    KConsole::setDRvalue(c);
    80002238:	f9744783          	lbu	a5,-105(s0)
    8000223c:	00078513          	mv	a0,a5
    80002240:	00000097          	auipc	ra,0x0
    80002244:	404080e7          	jalr	1028(ra) # 80002644 <_ZN8KConsole10setDRvalueEc>
                    sem_signal(KConsole::getOutputBufferHasSpace());
    80002248:	00000097          	auipc	ra,0x0
    8000224c:	424080e7          	jalr	1060(ra) # 8000266c <_ZN8KConsole23getOutputBufferHasSpaceEv>
    80002250:	00050793          	mv	a5,a0
    80002254:	00078513          	mv	a0,a5
    80002258:	fffff097          	auipc	ra,0xfffff
    8000225c:	2ec080e7          	jalr	748(ra) # 80001544 <_Z10sem_signalP4KSem>
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    80002260:	f79ff06f          	j	800021d8 <interruptRoutine+0x2f4>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002264:	fb043783          	ld	a5,-80(s0)
    80002268:	fa843703          	ld	a4,-88(s0)
    8000226c:	fa043683          	ld	a3,-96(s0)
    80002270:	fb843483          	ld	s1,-72(s0)
    80002274:	00068613          	mv	a2,a3
    80002278:	00070593          	mv	a1,a4
    8000227c:	00078513          	mv	a0,a5
    80002280:	00001097          	auipc	ra,0x1
    80002284:	c88080e7          	jalr	-888(ra) # 80002f08 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002288:	00050793          	mv	a5,a0
    8000228c:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    80002290:	fb843783          	ld	a5,-72(s0)
    80002294:	0007b783          	ld	a5,0(a5)
    80002298:	00078663          	beqz	a5,800022a4 <interruptRoutine+0x3c0>
                    __asm__ volatile("li a0, 0");
    8000229c:	00000513          	li	a0,0
    800022a0:	0080006f          	j	800022a8 <interruptRoutine+0x3c4>
                } else {
                    __asm__ volatile("li a0, -1");
    800022a4:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800022a8:	04a43823          	sd	a0,80(s0)
                break;
    800022ac:	0e80006f          	j	80002394 <interruptRoutine+0x4b0>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                if (((thread_t)a1)->getBody() != (TCB::Body)main) {
    800022b0:	fb843783          	ld	a5,-72(s0)
    800022b4:	00078513          	mv	a0,a5
    800022b8:	00000097          	auipc	ra,0x0
    800022bc:	458080e7          	jalr	1112(ra) # 80002710 <_ZN3TCB7getBodyEv>
    800022c0:	00050713          	mv	a4,a0
    800022c4:	0000b797          	auipc	a5,0xb
    800022c8:	98c7b783          	ld	a5,-1652(a5) # 8000cc50 <_GLOBAL_OFFSET_TABLE_+0x58>
    800022cc:	40f707b3          	sub	a5,a4,a5
    800022d0:	00f037b3          	snez	a5,a5
    800022d4:	0ff7f793          	andi	a5,a5,255
    800022d8:	0a078c63          	beqz	a5,80002390 <interruptRoutine+0x4ac>
                    Scheduler::put((thread_t)a1);
    800022dc:	fb843783          	ld	a5,-72(s0)
    800022e0:	00078513          	mv	a0,a5
    800022e4:	fffff097          	auipc	ra,0xfffff
    800022e8:	5ec080e7          	jalr	1516(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
                }
                break;
    800022ec:	0a40006f          	j	80002390 <interruptRoutine+0x4ac>
            default:
                printString("\nNepostojeci op code: ");
    800022f0:	00008517          	auipc	a0,0x8
    800022f4:	d3050513          	addi	a0,a0,-720 # 8000a020 <CONSOLE_STATUS+0x10>
    800022f8:	00003097          	auipc	ra,0x3
    800022fc:	7ec080e7          	jalr	2028(ra) # 80005ae4 <_Z11printStringPKc>
                printInt(a0);
    80002300:	fc043783          	ld	a5,-64(s0)
    80002304:	0007879b          	sext.w	a5,a5
    80002308:	00000613          	li	a2,0
    8000230c:	00a00593          	li	a1,10
    80002310:	00078513          	mv	a0,a5
    80002314:	00004097          	auipc	ra,0x4
    80002318:	980080e7          	jalr	-1664(ra) # 80005c94 <_Z8printIntiii>
                printString("\nscause: ");
    8000231c:	00008517          	auipc	a0,0x8
    80002320:	d1c50513          	addi	a0,a0,-740 # 8000a038 <CONSOLE_STATUS+0x28>
    80002324:	00003097          	auipc	ra,0x3
    80002328:	7c0080e7          	jalr	1984(ra) # 80005ae4 <_Z11printStringPKc>
                printInt(scause);
    8000232c:	fd843783          	ld	a5,-40(s0)
    80002330:	0007879b          	sext.w	a5,a5
    80002334:	00000613          	li	a2,0
    80002338:	00a00593          	li	a1,10
    8000233c:	00078513          	mv	a0,a5
    80002340:	00004097          	auipc	ra,0x4
    80002344:	954080e7          	jalr	-1708(ra) # 80005c94 <_Z8printIntiii>
                printString("\nsepc: ");
    80002348:	00008517          	auipc	a0,0x8
    8000234c:	d0050513          	addi	a0,a0,-768 # 8000a048 <CONSOLE_STATUS+0x38>
    80002350:	00003097          	auipc	ra,0x3
    80002354:	794080e7          	jalr	1940(ra) # 80005ae4 <_Z11printStringPKc>
                printInt(sepc);
    80002358:	fd043783          	ld	a5,-48(s0)
    8000235c:	0007879b          	sext.w	a5,a5
    80002360:	00000613          	li	a2,0
    80002364:	00a00593          	li	a1,10
    80002368:	00078513          	mv	a0,a5
    8000236c:	00004097          	auipc	ra,0x4
    80002370:	928080e7          	jalr	-1752(ra) # 80005c94 <_Z8printIntiii>
                break;
    80002374:	0200006f          	j	80002394 <interruptRoutine+0x4b0>
                break;
    80002378:	00000013          	nop
    8000237c:	0180006f          	j	80002394 <interruptRoutine+0x4b0>
                break;
    80002380:	00000013          	nop
    80002384:	0100006f          	j	80002394 <interruptRoutine+0x4b0>
                break;
    80002388:	00000013          	nop
    8000238c:	0080006f          	j	80002394 <interruptRoutine+0x4b0>
                break;
    80002390:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    80002394:	fd043783          	ld	a5,-48(s0)
    80002398:	00478793          	addi	a5,a5,4
    8000239c:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800023a0:	fd043783          	ld	a5,-48(s0)
    800023a4:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800023a8:	fc843783          	ld	a5,-56(s0)
    800023ac:	10079073          	csrw	sstatus,a5
    800023b0:	00000013          	nop
        printString("\nsepc: ");
        printInt(sepc);
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    }
    800023b4:	1c00006f          	j	80002574 <interruptRoutine+0x690>
    } else if (scause == 0x8000000000000009) {
    800023b8:	fd843703          	ld	a4,-40(s0)
    800023bc:	fff00793          	li	a5,-1
    800023c0:	03f79793          	slli	a5,a5,0x3f
    800023c4:	00978793          	addi	a5,a5,9
    800023c8:	08f71e63          	bne	a4,a5,80002464 <interruptRoutine+0x580>
        uint64 irq = plic_claim();
    800023cc:	00005097          	auipc	ra,0x5
    800023d0:	768080e7          	jalr	1896(ra) # 80007b34 <plic_claim>
    800023d4:	00050793          	mv	a5,a0
    800023d8:	f8f43c23          	sd	a5,-104(s0)
        if (irq == CONSOLE_IRQ) {
    800023dc:	f9843703          	ld	a4,-104(s0)
    800023e0:	00a00793          	li	a5,10
    800023e4:	02f71e63          	bne	a4,a5,80002420 <interruptRoutine+0x53c>
            if (KConsole::getSRvalue() & CONSOLE_RX_STATUS_BIT) {
    800023e8:	00000097          	auipc	ra,0x0
    800023ec:	20c080e7          	jalr	524(ra) # 800025f4 <_ZN8KConsole10getSRvalueEv>
    800023f0:	00050793          	mv	a5,a0
    800023f4:	0017f793          	andi	a5,a5,1
    800023f8:	00f037b3          	snez	a5,a5
    800023fc:	0ff7f793          	andi	a5,a5,255
    80002400:	02078863          	beqz	a5,80002430 <interruptRoutine+0x54c>
                KConsole::placeInInput(KConsole::getDRvalue());
    80002404:	00000097          	auipc	ra,0x0
    80002408:	218080e7          	jalr	536(ra) # 8000261c <_ZN8KConsole10getDRvalueEv>
    8000240c:	00050793          	mv	a5,a0
    80002410:	00078513          	mv	a0,a5
    80002414:	fffff097          	auipc	ra,0xfffff
    80002418:	37c080e7          	jalr	892(ra) # 80001790 <_ZN8KConsole12placeInInputEc>
    8000241c:	0140006f          	j	80002430 <interruptRoutine+0x54c>
            printString("Neki drugi prekid\n");
    80002420:	00008517          	auipc	a0,0x8
    80002424:	c3050513          	addi	a0,a0,-976 # 8000a050 <CONSOLE_STATUS+0x40>
    80002428:	00003097          	auipc	ra,0x3
    8000242c:	6bc080e7          	jalr	1724(ra) # 80005ae4 <_Z11printStringPKc>
        plic_complete(irq);
    80002430:	f9843783          	ld	a5,-104(s0)
    80002434:	0007879b          	sext.w	a5,a5
    80002438:	00078513          	mv	a0,a5
    8000243c:	00005097          	auipc	ra,0x5
    80002440:	730080e7          	jalr	1840(ra) # 80007b6c <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002444:	fd043783          	ld	a5,-48(s0)
    80002448:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    8000244c:	fc843783          	ld	a5,-56(s0)
    80002450:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    80002454:	20000513          	li	a0,512
    80002458:	00000097          	auipc	ra,0x0
    8000245c:	180080e7          	jalr	384(ra) # 800025d8 <_ZN5Riscv6mc_sipEm>
    80002460:	1140006f          	j	80002574 <interruptRoutine+0x690>
    } else if (scause == 0x8000000000000001) {
    80002464:	fd843703          	ld	a4,-40(s0)
    80002468:	fff00793          	li	a5,-1
    8000246c:	03f79793          	slli	a5,a5,0x3f
    80002470:	00178793          	addi	a5,a5,1
    80002474:	08f71463          	bne	a4,a5,800024fc <interruptRoutine+0x618>
        Scheduler::wake();
    80002478:	fffff097          	auipc	ra,0xfffff
    8000247c:	594080e7          	jalr	1428(ra) # 80001a0c <_ZN9Scheduler4wakeEv>
        TCB::getRunningTimeSlice()++;
    80002480:	00000097          	auipc	ra,0x0
    80002484:	2d0080e7          	jalr	720(ra) # 80002750 <_ZN3TCB19getRunningTimeSliceEv>
    80002488:	00050793          	mv	a5,a0
    8000248c:	0007b703          	ld	a4,0(a5)
    80002490:	00170713          	addi	a4,a4,1
    80002494:	00e7b023          	sd	a4,0(a5)
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
    80002498:	00000097          	auipc	ra,0x0
    8000249c:	2b8080e7          	jalr	696(ra) # 80002750 <_ZN3TCB19getRunningTimeSliceEv>
    800024a0:	00050793          	mv	a5,a0
    800024a4:	0007b483          	ld	s1,0(a5)
    800024a8:	00000097          	auipc	ra,0x0
    800024ac:	284080e7          	jalr	644(ra) # 8000272c <_ZN3TCB10getRunningEv>
    800024b0:	00050793          	mv	a5,a0
    800024b4:	00078513          	mv	a0,a5
    800024b8:	00000097          	auipc	ra,0x0
    800024bc:	23c080e7          	jalr	572(ra) # 800026f4 <_ZN3TCB12getTimeSliceEv>
    800024c0:	00050793          	mv	a5,a0
    800024c4:	00f4b7b3          	sltu	a5,s1,a5
    800024c8:	0017c793          	xori	a5,a5,1
    800024cc:	0ff7f793          	andi	a5,a5,255
    800024d0:	00078663          	beqz	a5,800024dc <interruptRoutine+0x5f8>
            TCB::dispatch();
    800024d4:	00001097          	auipc	ra,0x1
    800024d8:	958080e7          	jalr	-1704(ra) # 80002e2c <_ZN3TCB8dispatchEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800024dc:	fd043783          	ld	a5,-48(s0)
    800024e0:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800024e4:	fc843783          	ld	a5,-56(s0)
    800024e8:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    800024ec:	00200513          	li	a0,2
    800024f0:	00000097          	auipc	ra,0x0
    800024f4:	0e8080e7          	jalr	232(ra) # 800025d8 <_ZN5Riscv6mc_sipEm>
    800024f8:	07c0006f          	j	80002574 <interruptRoutine+0x690>
        printString("\nGreska u prekidnoj rutini\n");
    800024fc:	00008517          	auipc	a0,0x8
    80002500:	b6c50513          	addi	a0,a0,-1172 # 8000a068 <CONSOLE_STATUS+0x58>
    80002504:	00003097          	auipc	ra,0x3
    80002508:	5e0080e7          	jalr	1504(ra) # 80005ae4 <_Z11printStringPKc>
        printString("scause: ");
    8000250c:	00008517          	auipc	a0,0x8
    80002510:	b7c50513          	addi	a0,a0,-1156 # 8000a088 <CONSOLE_STATUS+0x78>
    80002514:	00003097          	auipc	ra,0x3
    80002518:	5d0080e7          	jalr	1488(ra) # 80005ae4 <_Z11printStringPKc>
        printInt(scause);
    8000251c:	fd843783          	ld	a5,-40(s0)
    80002520:	0007879b          	sext.w	a5,a5
    80002524:	00000613          	li	a2,0
    80002528:	00a00593          	li	a1,10
    8000252c:	00078513          	mv	a0,a5
    80002530:	00003097          	auipc	ra,0x3
    80002534:	764080e7          	jalr	1892(ra) # 80005c94 <_Z8printIntiii>
        printString("\nsepc: ");
    80002538:	00008517          	auipc	a0,0x8
    8000253c:	b1050513          	addi	a0,a0,-1264 # 8000a048 <CONSOLE_STATUS+0x38>
    80002540:	00003097          	auipc	ra,0x3
    80002544:	5a4080e7          	jalr	1444(ra) # 80005ae4 <_Z11printStringPKc>
        printInt(sepc);
    80002548:	fd043783          	ld	a5,-48(s0)
    8000254c:	0007879b          	sext.w	a5,a5
    80002550:	00000613          	li	a2,0
    80002554:	00a00593          	li	a1,10
    80002558:	00078513          	mv	a0,a5
    8000255c:	00003097          	auipc	ra,0x3
    80002560:	738080e7          	jalr	1848(ra) # 80005c94 <_Z8printIntiii>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002564:	fd043783          	ld	a5,-48(s0)
    80002568:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    8000256c:	fc843783          	ld	a5,-56(s0)
    80002570:	10079073          	csrw	sstatus,a5
    80002574:	00000013          	nop
    80002578:	06813083          	ld	ra,104(sp)
    8000257c:	06013403          	ld	s0,96(sp)
    80002580:	05813483          	ld	s1,88(sp)
    80002584:	07010113          	addi	sp,sp,112
    80002588:	00008067          	ret

000000008000258c <_ZN4KSemD1Ev>:
#define PROJEKAT2023_KSEM_HPP

#include "../h/ThreadQueue.hpp"

//klasa napravljena po uzoru na semafor u skolskom jezgru
class KSem {
    8000258c:	fe010113          	addi	sp,sp,-32
    80002590:	00113c23          	sd	ra,24(sp)
    80002594:	00813823          	sd	s0,16(sp)
    80002598:	00913423          	sd	s1,8(sp)
    8000259c:	02010413          	addi	s0,sp,32
    800025a0:	00050493          	mv	s1,a0
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    800025a4:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    800025a8:	00050e63          	beqz	a0,800025c4 <_ZN4KSemD1Ev+0x38>
            front = front->next;
    800025ac:	00853783          	ld	a5,8(a0)
    800025b0:	00f4b423          	sd	a5,8(s1)
            delete node;
    800025b4:	fe0508e3          	beqz	a0,800025a4 <_ZN4KSemD1Ev+0x18>
            mem_free(ptr);
    800025b8:	fffff097          	auipc	ra,0xfffff
    800025bc:	d90080e7          	jalr	-624(ra) # 80001348 <_Z8mem_freePv>
        }
    800025c0:	fe5ff06f          	j	800025a4 <_ZN4KSemD1Ev+0x18>
    800025c4:	01813083          	ld	ra,24(sp)
    800025c8:	01013403          	ld	s0,16(sp)
    800025cc:	00813483          	ld	s1,8(sp)
    800025d0:	02010113          	addi	sp,sp,32
    800025d4:	00008067          	ret

00000000800025d8 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    800025d8:	ff010113          	addi	sp,sp,-16
    800025dc:	00813423          	sd	s0,8(sp)
    800025e0:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    800025e4:	14453073          	csrc	sip,a0
}
    800025e8:	00813403          	ld	s0,8(sp)
    800025ec:	01010113          	addi	sp,sp,16
    800025f0:	00008067          	ret

00000000800025f4 <_ZN8KConsole10getSRvalueEv>:
    static uint8 getSRvalue() { return *sr; }
    800025f4:	ff010113          	addi	sp,sp,-16
    800025f8:	00813423          	sd	s0,8(sp)
    800025fc:	01010413          	addi	s0,sp,16
    80002600:	0000a797          	auipc	a5,0xa
    80002604:	6887b783          	ld	a5,1672(a5) # 8000cc88 <_GLOBAL_OFFSET_TABLE_+0x90>
    80002608:	0007b783          	ld	a5,0(a5)
    8000260c:	0007c503          	lbu	a0,0(a5)
    80002610:	00813403          	ld	s0,8(sp)
    80002614:	01010113          	addi	sp,sp,16
    80002618:	00008067          	ret

000000008000261c <_ZN8KConsole10getDRvalueEv>:
    static uint8 getDRvalue() { return *dr; }
    8000261c:	ff010113          	addi	sp,sp,-16
    80002620:	00813423          	sd	s0,8(sp)
    80002624:	01010413          	addi	s0,sp,16
    80002628:	0000a797          	auipc	a5,0xa
    8000262c:	6207b783          	ld	a5,1568(a5) # 8000cc48 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002630:	0007b783          	ld	a5,0(a5)
    80002634:	0007c503          	lbu	a0,0(a5)
    80002638:	00813403          	ld	s0,8(sp)
    8000263c:	01010113          	addi	sp,sp,16
    80002640:	00008067          	ret

0000000080002644 <_ZN8KConsole10setDRvalueEc>:
    static void setDRvalue(char c) { *dr = c; }
    80002644:	ff010113          	addi	sp,sp,-16
    80002648:	00813423          	sd	s0,8(sp)
    8000264c:	01010413          	addi	s0,sp,16
    80002650:	0000a797          	auipc	a5,0xa
    80002654:	5f87b783          	ld	a5,1528(a5) # 8000cc48 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002658:	0007b783          	ld	a5,0(a5)
    8000265c:	00a78023          	sb	a0,0(a5)
    80002660:	00813403          	ld	s0,8(sp)
    80002664:	01010113          	addi	sp,sp,16
    80002668:	00008067          	ret

000000008000266c <_ZN8KConsole23getOutputBufferHasSpaceEv>:

    static sem_t getOutputBufferHasSpace() { return outputBufferHasSpace; }
    8000266c:	ff010113          	addi	sp,sp,-16
    80002670:	00813423          	sd	s0,8(sp)
    80002674:	01010413          	addi	s0,sp,16
    80002678:	0000a797          	auipc	a5,0xa
    8000267c:	5e07b783          	ld	a5,1504(a5) # 8000cc58 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002680:	0007b503          	ld	a0,0(a5)
    80002684:	00813403          	ld	s0,8(sp)
    80002688:	01010113          	addi	sp,sp,16
    8000268c:	00008067          	ret

0000000080002690 <_ZN8KConsole13getOutputHeadEv>:

    static int getOutputHead() { return outputHead; }
    80002690:	ff010113          	addi	sp,sp,-16
    80002694:	00813423          	sd	s0,8(sp)
    80002698:	01010413          	addi	s0,sp,16
    8000269c:	0000a797          	auipc	a5,0xa
    800026a0:	59c7b783          	ld	a5,1436(a5) # 8000cc38 <_GLOBAL_OFFSET_TABLE_+0x40>
    800026a4:	0007a503          	lw	a0,0(a5)
    800026a8:	00813403          	ld	s0,8(sp)
    800026ac:	01010113          	addi	sp,sp,16
    800026b0:	00008067          	ret

00000000800026b4 <_ZN8KConsole13getOutputTailEv>:

    static int getOutputTail() { return outputTail; }
    800026b4:	ff010113          	addi	sp,sp,-16
    800026b8:	00813423          	sd	s0,8(sp)
    800026bc:	01010413          	addi	s0,sp,16
    800026c0:	0000a797          	auipc	a5,0xa
    800026c4:	5c07b783          	ld	a5,1472(a5) # 8000cc80 <_GLOBAL_OFFSET_TABLE_+0x88>
    800026c8:	0007a503          	lw	a0,0(a5)
    800026cc:	00813403          	ld	s0,8(sp)
    800026d0:	01010113          	addi	sp,sp,16
    800026d4:	00008067          	ret

00000000800026d8 <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    800026d8:	ff010113          	addi	sp,sp,-16
    800026dc:	00813423          	sd	s0,8(sp)
    800026e0:	01010413          	addi	s0,sp,16
    800026e4:	04b52c23          	sw	a1,88(a0)
    800026e8:	00813403          	ld	s0,8(sp)
    800026ec:	01010113          	addi	sp,sp,16
    800026f0:	00008067          	ret

00000000800026f4 <_ZN3TCB12getTimeSliceEv>:
    uint64 getTimeSlice() { return timeSlice; }
    800026f4:	ff010113          	addi	sp,sp,-16
    800026f8:	00813423          	sd	s0,8(sp)
    800026fc:	01010413          	addi	s0,sp,16
    80002700:	02853503          	ld	a0,40(a0)
    80002704:	00813403          	ld	s0,8(sp)
    80002708:	01010113          	addi	sp,sp,16
    8000270c:	00008067          	ret

0000000080002710 <_ZN3TCB7getBodyEv>:
    Body getBody() { return threadFunction; }
    80002710:	ff010113          	addi	sp,sp,-16
    80002714:	00813423          	sd	s0,8(sp)
    80002718:	01010413          	addi	s0,sp,16
    8000271c:	01053503          	ld	a0,16(a0)
    80002720:	00813403          	ld	s0,8(sp)
    80002724:	01010113          	addi	sp,sp,16
    80002728:	00008067          	ret

000000008000272c <_ZN3TCB10getRunningEv>:
    static TCB* getRunning() { return running; }
    8000272c:	ff010113          	addi	sp,sp,-16
    80002730:	00813423          	sd	s0,8(sp)
    80002734:	01010413          	addi	s0,sp,16
    80002738:	0000a797          	auipc	a5,0xa
    8000273c:	5287b783          	ld	a5,1320(a5) # 8000cc60 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002740:	0007b503          	ld	a0,0(a5)
    80002744:	00813403          	ld	s0,8(sp)
    80002748:	01010113          	addi	sp,sp,16
    8000274c:	00008067          	ret

0000000080002750 <_ZN3TCB19getRunningTimeSliceEv>:

    static uint64 &getRunningTimeSlice() { return runningTimeSlice; }
    80002750:	ff010113          	addi	sp,sp,-16
    80002754:	00813423          	sd	s0,8(sp)
    80002758:	01010413          	addi	s0,sp,16
    8000275c:	0000a517          	auipc	a0,0xa
    80002760:	4b453503          	ld	a0,1204(a0) # 8000cc10 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002764:	00813403          	ld	s0,8(sp)
    80002768:	01010113          	addi	sp,sp,16
    8000276c:	00008067          	ret

0000000080002770 <_ZN6Thread7wrapperEPv>:

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
    80002770:	02050863          	beqz	a0,800027a0 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80002774:	ff010113          	addi	sp,sp,-16
    80002778:	00113423          	sd	ra,8(sp)
    8000277c:	00813023          	sd	s0,0(sp)
    80002780:	01010413          	addi	s0,sp,16
        ((Thread*)thread)->run();
    80002784:	00053783          	ld	a5,0(a0)
    80002788:	0107b783          	ld	a5,16(a5)
    8000278c:	000780e7          	jalr	a5
    }
}
    80002790:	00813083          	ld	ra,8(sp)
    80002794:	00013403          	ld	s0,0(sp)
    80002798:	01010113          	addi	sp,sp,16
    8000279c:	00008067          	ret
    800027a0:	00008067          	ret

00000000800027a4 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800027a4:	fe010113          	addi	sp,sp,-32
    800027a8:	00113c23          	sd	ra,24(sp)
    800027ac:	00813823          	sd	s0,16(sp)
    800027b0:	00913423          	sd	s1,8(sp)
    800027b4:	02010413          	addi	s0,sp,32
    800027b8:	00050493          	mv	s1,a0
    800027bc:	0000a797          	auipc	a5,0xa
    800027c0:	1fc78793          	addi	a5,a5,508 # 8000c9b8 <_ZTV6Thread+0x10>
    800027c4:	00f53023          	sd	a5,0(a0)
    thread_join(this->myHandle);
    800027c8:	00853503          	ld	a0,8(a0)
    800027cc:	fffff097          	auipc	ra,0xfffff
    800027d0:	c88080e7          	jalr	-888(ra) # 80001454 <_Z11thread_joinP3TCB>
    delete myHandle;
    800027d4:	0084b483          	ld	s1,8(s1)
    800027d8:	02048863          	beqz	s1,80002808 <_ZN6ThreadD1Ev+0x64>
        return front == nullptr;
    800027dc:	0484b503          	ld	a0,72(s1)
        while (!isEmpty()) {
    800027e0:	00050e63          	beqz	a0,800027fc <_ZN6ThreadD1Ev+0x58>
            front = front->next;
    800027e4:	00853783          	ld	a5,8(a0)
    800027e8:	04f4b423          	sd	a5,72(s1)
            delete node;
    800027ec:	fe0508e3          	beqz	a0,800027dc <_ZN6ThreadD1Ev+0x38>
            mem_free(ptr);
    800027f0:	fffff097          	auipc	ra,0xfffff
    800027f4:	b58080e7          	jalr	-1192(ra) # 80001348 <_Z8mem_freePv>
        }
    800027f8:	fe5ff06f          	j	800027dc <_ZN6ThreadD1Ev+0x38>
    800027fc:	00048513          	mv	a0,s1
    80002800:	00000097          	auipc	ra,0x0
    80002804:	7bc080e7          	jalr	1980(ra) # 80002fbc <_ZN3TCBdlEPv>
}
    80002808:	01813083          	ld	ra,24(sp)
    8000280c:	01013403          	ld	s0,16(sp)
    80002810:	00813483          	ld	s1,8(sp)
    80002814:	02010113          	addi	sp,sp,32
    80002818:	00008067          	ret

000000008000281c <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    8000281c:	fe010113          	addi	sp,sp,-32
    80002820:	00113c23          	sd	ra,24(sp)
    80002824:	00813823          	sd	s0,16(sp)
    80002828:	00913423          	sd	s1,8(sp)
    8000282c:	02010413          	addi	s0,sp,32
    80002830:	00050493          	mv	s1,a0
    80002834:	0000a797          	auipc	a5,0xa
    80002838:	1ac78793          	addi	a5,a5,428 # 8000c9e0 <_ZTV9Semaphore+0x10>
    8000283c:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80002840:	00853503          	ld	a0,8(a0)
    80002844:	fffff097          	auipc	ra,0xfffff
    80002848:	ca0080e7          	jalr	-864(ra) # 800014e4 <_Z9sem_closeP4KSem>
    delete myHandle;
    8000284c:	0084b483          	ld	s1,8(s1)
    80002850:	02048863          	beqz	s1,80002880 <_ZN9SemaphoreD1Ev+0x64>
        return front == nullptr;
    80002854:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002858:	00050e63          	beqz	a0,80002874 <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    8000285c:	00853783          	ld	a5,8(a0)
    80002860:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002864:	fe0508e3          	beqz	a0,80002854 <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    80002868:	fffff097          	auipc	ra,0xfffff
    8000286c:	ae0080e7          	jalr	-1312(ra) # 80001348 <_Z8mem_freePv>
        }
    80002870:	fe5ff06f          	j	80002854 <_ZN9SemaphoreD1Ev+0x38>
    80002874:	00048513          	mv	a0,s1
    80002878:	00001097          	auipc	ra,0x1
    8000287c:	898080e7          	jalr	-1896(ra) # 80003110 <_ZN4KSemdlEPv>
}
    80002880:	01813083          	ld	ra,24(sp)
    80002884:	01013403          	ld	s0,16(sp)
    80002888:	00813483          	ld	s1,8(sp)
    8000288c:	02010113          	addi	sp,sp,32
    80002890:	00008067          	ret

0000000080002894 <_Znwm>:
void* operator new(size_t size) {
    80002894:	ff010113          	addi	sp,sp,-16
    80002898:	00113423          	sd	ra,8(sp)
    8000289c:	00813023          	sd	s0,0(sp)
    800028a0:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800028a4:	fffff097          	auipc	ra,0xfffff
    800028a8:	a64080e7          	jalr	-1436(ra) # 80001308 <_Z9mem_allocm>
}
    800028ac:	00813083          	ld	ra,8(sp)
    800028b0:	00013403          	ld	s0,0(sp)
    800028b4:	01010113          	addi	sp,sp,16
    800028b8:	00008067          	ret

00000000800028bc <_Znam>:
void* operator new[](size_t size) {
    800028bc:	ff010113          	addi	sp,sp,-16
    800028c0:	00113423          	sd	ra,8(sp)
    800028c4:	00813023          	sd	s0,0(sp)
    800028c8:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800028cc:	fffff097          	auipc	ra,0xfffff
    800028d0:	a3c080e7          	jalr	-1476(ra) # 80001308 <_Z9mem_allocm>
}
    800028d4:	00813083          	ld	ra,8(sp)
    800028d8:	00013403          	ld	s0,0(sp)
    800028dc:	01010113          	addi	sp,sp,16
    800028e0:	00008067          	ret

00000000800028e4 <_ZdlPv>:
noexcept {
    800028e4:	ff010113          	addi	sp,sp,-16
    800028e8:	00113423          	sd	ra,8(sp)
    800028ec:	00813023          	sd	s0,0(sp)
    800028f0:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800028f4:	fffff097          	auipc	ra,0xfffff
    800028f8:	a54080e7          	jalr	-1452(ra) # 80001348 <_Z8mem_freePv>
}
    800028fc:	00813083          	ld	ra,8(sp)
    80002900:	00013403          	ld	s0,0(sp)
    80002904:	01010113          	addi	sp,sp,16
    80002908:	00008067          	ret

000000008000290c <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    8000290c:	fe010113          	addi	sp,sp,-32
    80002910:	00113c23          	sd	ra,24(sp)
    80002914:	00813823          	sd	s0,16(sp)
    80002918:	00913423          	sd	s1,8(sp)
    8000291c:	02010413          	addi	s0,sp,32
    80002920:	00050493          	mv	s1,a0
}
    80002924:	00000097          	auipc	ra,0x0
    80002928:	e80080e7          	jalr	-384(ra) # 800027a4 <_ZN6ThreadD1Ev>
    8000292c:	00048513          	mv	a0,s1
    80002930:	00000097          	auipc	ra,0x0
    80002934:	fb4080e7          	jalr	-76(ra) # 800028e4 <_ZdlPv>
    80002938:	01813083          	ld	ra,24(sp)
    8000293c:	01013403          	ld	s0,16(sp)
    80002940:	00813483          	ld	s1,8(sp)
    80002944:	02010113          	addi	sp,sp,32
    80002948:	00008067          	ret

000000008000294c <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    8000294c:	fe010113          	addi	sp,sp,-32
    80002950:	00113c23          	sd	ra,24(sp)
    80002954:	00813823          	sd	s0,16(sp)
    80002958:	00913423          	sd	s1,8(sp)
    8000295c:	02010413          	addi	s0,sp,32
    80002960:	00050493          	mv	s1,a0
}
    80002964:	00000097          	auipc	ra,0x0
    80002968:	eb8080e7          	jalr	-328(ra) # 8000281c <_ZN9SemaphoreD1Ev>
    8000296c:	00048513          	mv	a0,s1
    80002970:	00000097          	auipc	ra,0x0
    80002974:	f74080e7          	jalr	-140(ra) # 800028e4 <_ZdlPv>
    80002978:	01813083          	ld	ra,24(sp)
    8000297c:	01013403          	ld	s0,16(sp)
    80002980:	00813483          	ld	s1,8(sp)
    80002984:	02010113          	addi	sp,sp,32
    80002988:	00008067          	ret

000000008000298c <_ZdaPv>:
noexcept {
    8000298c:	ff010113          	addi	sp,sp,-16
    80002990:	00113423          	sd	ra,8(sp)
    80002994:	00813023          	sd	s0,0(sp)
    80002998:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000299c:	fffff097          	auipc	ra,0xfffff
    800029a0:	9ac080e7          	jalr	-1620(ra) # 80001348 <_Z8mem_freePv>
}
    800029a4:	00813083          	ld	ra,8(sp)
    800029a8:	00013403          	ld	s0,0(sp)
    800029ac:	01010113          	addi	sp,sp,16
    800029b0:	00008067          	ret

00000000800029b4 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    800029b4:	fd010113          	addi	sp,sp,-48
    800029b8:	02113423          	sd	ra,40(sp)
    800029bc:	02813023          	sd	s0,32(sp)
    800029c0:	00913c23          	sd	s1,24(sp)
    800029c4:	01213823          	sd	s2,16(sp)
    800029c8:	01313423          	sd	s3,8(sp)
    800029cc:	03010413          	addi	s0,sp,48
    800029d0:	00050493          	mv	s1,a0
    800029d4:	00058913          	mv	s2,a1
    800029d8:	00060993          	mv	s3,a2
    800029dc:	0000a797          	auipc	a5,0xa
    800029e0:	fdc78793          	addi	a5,a5,-36 # 8000c9b8 <_ZTV6Thread+0x10>
    800029e4:	00f53023          	sd	a5,0(a0)
    this->body = body;
    800029e8:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    800029ec:	00c53c23          	sd	a2,24(a0)
    if (body != (TCB::Body)main) {
    800029f0:	0000a797          	auipc	a5,0xa
    800029f4:	2607b783          	ld	a5,608(a5) # 8000cc50 <_GLOBAL_OFFSET_TABLE_+0x58>
    800029f8:	04f58663          	beq	a1,a5,80002a44 <_ZN6ThreadC1EPFvPvES0_+0x90>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800029fc:	00001537          	lui	a0,0x1
    80002a00:	fffff097          	auipc	ra,0xfffff
    80002a04:	908080e7          	jalr	-1784(ra) # 80001308 <_Z9mem_allocm>
    80002a08:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a0c:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a10:	00098693          	mv	a3,s3
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a14:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a18:	00848493          	addi	s1,s1,8
    80002a1c:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002a20:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002a24:	00000073          	ecall
}
    80002a28:	02813083          	ld	ra,40(sp)
    80002a2c:	02013403          	ld	s0,32(sp)
    80002a30:	01813483          	ld	s1,24(sp)
    80002a34:	01013903          	ld	s2,16(sp)
    80002a38:	00813983          	ld	s3,8(sp)
    80002a3c:	03010113          	addi	sp,sp,48
    80002a40:	00008067          	ret
    uint64* stack = nullptr;
    80002a44:	00000313          	li	t1,0
    80002a48:	fc5ff06f          	j	80002a0c <_ZN6ThreadC1EPFvPvES0_+0x58>

0000000080002a4c <_ZN6Thread5startEv>:
int Thread::start() {
    80002a4c:	ff010113          	addi	sp,sp,-16
    80002a50:	00813423          	sd	s0,8(sp)
    80002a54:	01010413          	addi	s0,sp,16
    if (myHandle == nullptr) return -1;
    80002a58:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002a5c:	02030063          	beqz	t1,80002a7c <_ZN6Thread5startEv+0x30>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a60:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    80002a64:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    80002a68:	00000073          	ecall
    return 0;
    80002a6c:	00000513          	li	a0,0
}
    80002a70:	00813403          	ld	s0,8(sp)
    80002a74:	01010113          	addi	sp,sp,16
    80002a78:	00008067          	ret
    if (myHandle == nullptr) return -1;
    80002a7c:	fff00513          	li	a0,-1
    80002a80:	ff1ff06f          	j	80002a70 <_ZN6Thread5startEv+0x24>

0000000080002a84 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002a84:	ff010113          	addi	sp,sp,-16
    80002a88:	00113423          	sd	ra,8(sp)
    80002a8c:	00813023          	sd	s0,0(sp)
    80002a90:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80002a94:	00853503          	ld	a0,8(a0)
    80002a98:	fffff097          	auipc	ra,0xfffff
    80002a9c:	9bc080e7          	jalr	-1604(ra) # 80001454 <_Z11thread_joinP3TCB>
}
    80002aa0:	00813083          	ld	ra,8(sp)
    80002aa4:	00013403          	ld	s0,0(sp)
    80002aa8:	01010113          	addi	sp,sp,16
    80002aac:	00008067          	ret

0000000080002ab0 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002ab0:	ff010113          	addi	sp,sp,-16
    80002ab4:	00113423          	sd	ra,8(sp)
    80002ab8:	00813023          	sd	s0,0(sp)
    80002abc:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002ac0:	fffff097          	auipc	ra,0xfffff
    80002ac4:	974080e7          	jalr	-1676(ra) # 80001434 <_Z15thread_dispatchv>
}
    80002ac8:	00813083          	ld	ra,8(sp)
    80002acc:	00013403          	ld	s0,0(sp)
    80002ad0:	01010113          	addi	sp,sp,16
    80002ad4:	00008067          	ret

0000000080002ad8 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80002ad8:	ff010113          	addi	sp,sp,-16
    80002adc:	00113423          	sd	ra,8(sp)
    80002ae0:	00813023          	sd	s0,0(sp)
    80002ae4:	01010413          	addi	s0,sp,16
    time_sleep(t);
    80002ae8:	fffff097          	auipc	ra,0xfffff
    80002aec:	994080e7          	jalr	-1644(ra) # 8000147c <_Z10time_sleepm>
}
    80002af0:	00000513          	li	a0,0
    80002af4:	00813083          	ld	ra,8(sp)
    80002af8:	00013403          	ld	s0,0(sp)
    80002afc:	01010113          	addi	sp,sp,16
    80002b00:	00008067          	ret

0000000080002b04 <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    80002b04:	fe010113          	addi	sp,sp,-32
    80002b08:	00113c23          	sd	ra,24(sp)
    80002b0c:	00813823          	sd	s0,16(sp)
    80002b10:	00913423          	sd	s1,8(sp)
    80002b14:	02010413          	addi	s0,sp,32
    80002b18:	00050493          	mv	s1,a0
    while (period != -1UL) {
    80002b1c:	0204b703          	ld	a4,32(s1)
    80002b20:	fff00793          	li	a5,-1
    80002b24:	02f70663          	beq	a4,a5,80002b50 <_ZN14PeriodicThread3runEv+0x4c>
        periodicActivation();
    80002b28:	0004b783          	ld	a5,0(s1)
    80002b2c:	0187b783          	ld	a5,24(a5)
    80002b30:	00048513          	mv	a0,s1
    80002b34:	000780e7          	jalr	a5
        if (period == -1UL) break;
    80002b38:	0204b503          	ld	a0,32(s1)
    80002b3c:	fff00793          	li	a5,-1
    80002b40:	00f50863          	beq	a0,a5,80002b50 <_ZN14PeriodicThread3runEv+0x4c>
        sleep(period);
    80002b44:	00000097          	auipc	ra,0x0
    80002b48:	f94080e7          	jalr	-108(ra) # 80002ad8 <_ZN6Thread5sleepEm>
    while (period != -1UL) {
    80002b4c:	fd1ff06f          	j	80002b1c <_ZN14PeriodicThread3runEv+0x18>
    }
    thread_exit();
    80002b50:	fffff097          	auipc	ra,0xfffff
    80002b54:	8bc080e7          	jalr	-1860(ra) # 8000140c <_Z11thread_exitv>
}
    80002b58:	01813083          	ld	ra,24(sp)
    80002b5c:	01013403          	ld	s0,16(sp)
    80002b60:	00813483          	ld	s1,8(sp)
    80002b64:	02010113          	addi	sp,sp,32
    80002b68:	00008067          	ret

0000000080002b6c <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002b6c:	fe010113          	addi	sp,sp,-32
    80002b70:	00113c23          	sd	ra,24(sp)
    80002b74:	00813823          	sd	s0,16(sp)
    80002b78:	00913423          	sd	s1,8(sp)
    80002b7c:	02010413          	addi	s0,sp,32
    80002b80:	00050493          	mv	s1,a0
    80002b84:	0000a797          	auipc	a5,0xa
    80002b88:	e3478793          	addi	a5,a5,-460 # 8000c9b8 <_ZTV6Thread+0x10>
    80002b8c:	00f53023          	sd	a5,0(a0)
    this->body = wrapper;
    80002b90:	00000797          	auipc	a5,0x0
    80002b94:	be078793          	addi	a5,a5,-1056 # 80002770 <_ZN6Thread7wrapperEPv>
    80002b98:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80002b9c:	00a53c23          	sd	a0,24(a0)
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002ba0:	00001537          	lui	a0,0x1
    80002ba4:	ffffe097          	auipc	ra,0xffffe
    80002ba8:	764080e7          	jalr	1892(ra) # 80001308 <_Z9mem_allocm>
    80002bac:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002bb0:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002bb4:	0184b303          	ld	t1,24(s1)
    80002bb8:	00030693          	mv	a3,t1
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002bbc:	0104b303          	ld	t1,16(s1)
    80002bc0:	00030613          	mv	a2,t1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002bc4:	00848493          	addi	s1,s1,8
    80002bc8:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002bcc:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002bd0:	00000073          	ecall
}
    80002bd4:	01813083          	ld	ra,24(sp)
    80002bd8:	01013403          	ld	s0,16(sp)
    80002bdc:	00813483          	ld	s1,8(sp)
    80002be0:	02010113          	addi	sp,sp,32
    80002be4:	00008067          	ret

0000000080002be8 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002be8:	ff010113          	addi	sp,sp,-16
    80002bec:	00113423          	sd	ra,8(sp)
    80002bf0:	00813023          	sd	s0,0(sp)
    80002bf4:	01010413          	addi	s0,sp,16
    80002bf8:	0000a797          	auipc	a5,0xa
    80002bfc:	de878793          	addi	a5,a5,-536 # 8000c9e0 <_ZTV9Semaphore+0x10>
    80002c00:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle, init);
    80002c04:	00850513          	addi	a0,a0,8
    80002c08:	fffff097          	auipc	ra,0xfffff
    80002c0c:	8a4080e7          	jalr	-1884(ra) # 800014ac <_Z8sem_openPP4KSemj>
}
    80002c10:	00813083          	ld	ra,8(sp)
    80002c14:	00013403          	ld	s0,0(sp)
    80002c18:	01010113          	addi	sp,sp,16
    80002c1c:	00008067          	ret

0000000080002c20 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002c20:	ff010113          	addi	sp,sp,-16
    80002c24:	00113423          	sd	ra,8(sp)
    80002c28:	00813023          	sd	s0,0(sp)
    80002c2c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002c30:	00853503          	ld	a0,8(a0)
    80002c34:	fffff097          	auipc	ra,0xfffff
    80002c38:	8e0080e7          	jalr	-1824(ra) # 80001514 <_Z8sem_waitP4KSem>
}
    80002c3c:	00813083          	ld	ra,8(sp)
    80002c40:	00013403          	ld	s0,0(sp)
    80002c44:	01010113          	addi	sp,sp,16
    80002c48:	00008067          	ret

0000000080002c4c <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002c4c:	ff010113          	addi	sp,sp,-16
    80002c50:	00113423          	sd	ra,8(sp)
    80002c54:	00813023          	sd	s0,0(sp)
    80002c58:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80002c5c:	00853503          	ld	a0,8(a0)
    80002c60:	fffff097          	auipc	ra,0xfffff
    80002c64:	8e4080e7          	jalr	-1820(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    80002c68:	00813083          	ld	ra,8(sp)
    80002c6c:	00013403          	ld	s0,0(sp)
    80002c70:	01010113          	addi	sp,sp,16
    80002c74:	00008067          	ret

0000000080002c78 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002c78:	ff010113          	addi	sp,sp,-16
    80002c7c:	00813423          	sd	s0,8(sp)
    80002c80:	01010413          	addi	s0,sp,16
    this->period = -1;
    80002c84:	fff00793          	li	a5,-1
    80002c88:	02f53023          	sd	a5,32(a0)
}
    80002c8c:	00813403          	ld	s0,8(sp)
    80002c90:	01010113          	addi	sp,sp,16
    80002c94:	00008067          	ret

0000000080002c98 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    80002c98:	fe010113          	addi	sp,sp,-32
    80002c9c:	00113c23          	sd	ra,24(sp)
    80002ca0:	00813823          	sd	s0,16(sp)
    80002ca4:	00913423          	sd	s1,8(sp)
    80002ca8:	01213023          	sd	s2,0(sp)
    80002cac:	02010413          	addi	s0,sp,32
    80002cb0:	00050493          	mv	s1,a0
    80002cb4:	00058913          	mv	s2,a1
    80002cb8:	00000097          	auipc	ra,0x0
    80002cbc:	eb4080e7          	jalr	-332(ra) # 80002b6c <_ZN6ThreadC1Ev>
    80002cc0:	0000a797          	auipc	a5,0xa
    80002cc4:	d4078793          	addi	a5,a5,-704 # 8000ca00 <_ZTV14PeriodicThread+0x10>
    80002cc8:	00f4b023          	sd	a5,0(s1)
    80002ccc:	0324b023          	sd	s2,32(s1)
}
    80002cd0:	01813083          	ld	ra,24(sp)
    80002cd4:	01013403          	ld	s0,16(sp)
    80002cd8:	00813483          	ld	s1,8(sp)
    80002cdc:	00013903          	ld	s2,0(sp)
    80002ce0:	02010113          	addi	sp,sp,32
    80002ce4:	00008067          	ret

0000000080002ce8 <_ZN7Console4getcEv>:

char Console::getc() {
    80002ce8:	ff010113          	addi	sp,sp,-16
    80002cec:	00113423          	sd	ra,8(sp)
    80002cf0:	00813023          	sd	s0,0(sp)
    80002cf4:	01010413          	addi	s0,sp,16
    return ::getc();
    80002cf8:	fffff097          	auipc	ra,0xfffff
    80002cfc:	87c080e7          	jalr	-1924(ra) # 80001574 <_Z4getcv>
}
    80002d00:	00813083          	ld	ra,8(sp)
    80002d04:	00013403          	ld	s0,0(sp)
    80002d08:	01010113          	addi	sp,sp,16
    80002d0c:	00008067          	ret

0000000080002d10 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002d10:	ff010113          	addi	sp,sp,-16
    80002d14:	00113423          	sd	ra,8(sp)
    80002d18:	00813023          	sd	s0,0(sp)
    80002d1c:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002d20:	fffff097          	auipc	ra,0xfffff
    80002d24:	87c080e7          	jalr	-1924(ra) # 8000159c <_Z4putcc>
}
    80002d28:	00813083          	ld	ra,8(sp)
    80002d2c:	00013403          	ld	s0,0(sp)
    80002d30:	01010113          	addi	sp,sp,16
    80002d34:	00008067          	ret

0000000080002d38 <_ZN6Thread3runEv>:
protected:
    //konstruktor koji pravi nit koja izvrsava run metodu, ne stavlja je u Scheduler
    Thread();

    //funkcija koju nit izvrsava, samo ako je nit napravljena podrazumevanim konstruktorom
    virtual void run() {}
    80002d38:	ff010113          	addi	sp,sp,-16
    80002d3c:	00813423          	sd	s0,8(sp)
    80002d40:	01010413          	addi	s0,sp,16
    80002d44:	00813403          	ld	s0,8(sp)
    80002d48:	01010113          	addi	sp,sp,16
    80002d4c:	00008067          	ret

0000000080002d50 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    80002d50:	ff010113          	addi	sp,sp,-16
    80002d54:	00813423          	sd	s0,8(sp)
    80002d58:	01010413          	addi	s0,sp,16
    80002d5c:	00813403          	ld	s0,8(sp)
    80002d60:	01010113          	addi	sp,sp,16
    80002d64:	00008067          	ret

0000000080002d68 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002d68:	ff010113          	addi	sp,sp,-16
    80002d6c:	00113423          	sd	ra,8(sp)
    80002d70:	00813023          	sd	s0,0(sp)
    80002d74:	01010413          	addi	s0,sp,16
    80002d78:	0000a797          	auipc	a5,0xa
    80002d7c:	c8878793          	addi	a5,a5,-888 # 8000ca00 <_ZTV14PeriodicThread+0x10>
    80002d80:	00f53023          	sd	a5,0(a0)
    80002d84:	00000097          	auipc	ra,0x0
    80002d88:	a20080e7          	jalr	-1504(ra) # 800027a4 <_ZN6ThreadD1Ev>
    80002d8c:	00813083          	ld	ra,8(sp)
    80002d90:	00013403          	ld	s0,0(sp)
    80002d94:	01010113          	addi	sp,sp,16
    80002d98:	00008067          	ret

0000000080002d9c <_ZN14PeriodicThreadD0Ev>:
    80002d9c:	fe010113          	addi	sp,sp,-32
    80002da0:	00113c23          	sd	ra,24(sp)
    80002da4:	00813823          	sd	s0,16(sp)
    80002da8:	00913423          	sd	s1,8(sp)
    80002dac:	02010413          	addi	s0,sp,32
    80002db0:	00050493          	mv	s1,a0
    80002db4:	0000a797          	auipc	a5,0xa
    80002db8:	c4c78793          	addi	a5,a5,-948 # 8000ca00 <_ZTV14PeriodicThread+0x10>
    80002dbc:	00f53023          	sd	a5,0(a0)
    80002dc0:	00000097          	auipc	ra,0x0
    80002dc4:	9e4080e7          	jalr	-1564(ra) # 800027a4 <_ZN6ThreadD1Ev>
    80002dc8:	00048513          	mv	a0,s1
    80002dcc:	00000097          	auipc	ra,0x0
    80002dd0:	b18080e7          	jalr	-1256(ra) # 800028e4 <_ZdlPv>
    80002dd4:	01813083          	ld	ra,24(sp)
    80002dd8:	01013403          	ld	s0,16(sp)
    80002ddc:	00813483          	ld	s1,8(sp)
    80002de0:	02010113          	addi	sp,sp,32
    80002de4:	00008067          	ret

0000000080002de8 <_ZN3TCB7wrapperEv>:
    }

    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
}

void TCB::wrapper() {
    80002de8:	ff010113          	addi	sp,sp,-16
    80002dec:	00113423          	sd	ra,8(sp)
    80002df0:	00813023          	sd	s0,0(sp)
    80002df4:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch)
    Riscv::returnFromInterrupt();
    80002df8:	00000097          	auipc	ra,0x0
    80002dfc:	2d0080e7          	jalr	720(ra) # 800030c8 <_ZN5Riscv19returnFromInterruptEv>
    //na dalje se izvrsavamo u user modu (osim za kernel funkcije)
    running->threadFunction(running->args);
    80002e00:	0000a797          	auipc	a5,0xa
    80002e04:	0307b783          	ld	a5,48(a5) # 8000ce30 <_ZN3TCB7runningE>
    80002e08:	0107b703          	ld	a4,16(a5)
    80002e0c:	0207b503          	ld	a0,32(a5)
    80002e10:	000700e7          	jalr	a4
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    80002e14:	ffffe097          	auipc	ra,0xffffe
    80002e18:	5f8080e7          	jalr	1528(ra) # 8000140c <_Z11thread_exitv>
}
    80002e1c:	00813083          	ld	ra,8(sp)
    80002e20:	00013403          	ld	s0,0(sp)
    80002e24:	01010113          	addi	sp,sp,16
    80002e28:	00008067          	ret

0000000080002e2c <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002e2c:	fe010113          	addi	sp,sp,-32
    80002e30:	00113c23          	sd	ra,24(sp)
    80002e34:	00813823          	sd	s0,16(sp)
    80002e38:	00913423          	sd	s1,8(sp)
    80002e3c:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    80002e40:	0000a497          	auipc	s1,0xa
    80002e44:	ff04b483          	ld	s1,-16(s1) # 8000ce30 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    80002e48:	0584a703          	lw	a4,88(s1)
    80002e4c:	00100793          	li	a5,1
    80002e50:	04f70a63          	beq	a4,a5,80002ea4 <_ZN3TCB8dispatchEv+0x78>
    TCB::running = Scheduler::get();
    80002e54:	fffff097          	auipc	ra,0xfffff
    80002e58:	ac8080e7          	jalr	-1336(ra) # 8000191c <_ZN9Scheduler3getEv>
    80002e5c:	00050593          	mv	a1,a0
    80002e60:	0000a797          	auipc	a5,0xa
    80002e64:	fd078793          	addi	a5,a5,-48 # 8000ce30 <_ZN3TCB7runningE>
    80002e68:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80002e6c:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == (TCB::Body)main || TCB::running->threadFunction == kernelConsumerFunction ||
    80002e70:	01053783          	ld	a5,16(a0)
    80002e74:	0000a717          	auipc	a4,0xa
    80002e78:	ddc73703          	ld	a4,-548(a4) # 8000cc50 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002e7c:	02e78c63          	beq	a5,a4,80002eb4 <_ZN3TCB8dispatchEv+0x88>
    80002e80:	0000a717          	auipc	a4,0xa
    80002e84:	db073703          	ld	a4,-592(a4) # 8000cc30 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002e88:	02e78663          	beq	a5,a4,80002eb4 <_ZN3TCB8dispatchEv+0x88>
    80002e8c:	0000a717          	auipc	a4,0xa
    80002e90:	dec73703          	ld	a4,-532(a4) # 8000cc78 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002e94:	02e78063          	beq	a5,a4,80002eb4 <_ZN3TCB8dispatchEv+0x88>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002e98:	10000793          	li	a5,256
    80002e9c:	1007b073          	csrc	sstatus,a5
}
    80002ea0:	01c0006f          	j	80002ebc <_ZN3TCB8dispatchEv+0x90>
        Scheduler::put(old);
    80002ea4:	00048513          	mv	a0,s1
    80002ea8:	fffff097          	auipc	ra,0xfffff
    80002eac:	a28080e7          	jalr	-1496(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
    80002eb0:	fa5ff06f          	j	80002e54 <_ZN3TCB8dispatchEv+0x28>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002eb4:	10000793          	li	a5,256
    80002eb8:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002ebc:	00b48863          	beq	s1,a1,80002ecc <_ZN3TCB8dispatchEv+0xa0>
    80002ec0:	00048513          	mv	a0,s1
    80002ec4:	ffffe097          	auipc	ra,0xffffe
    80002ec8:	24c080e7          	jalr	588(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002ecc:	01813083          	ld	ra,24(sp)
    80002ed0:	01013403          	ld	s0,16(sp)
    80002ed4:	00813483          	ld	s1,8(sp)
    80002ed8:	02010113          	addi	sp,sp,32
    80002edc:	00008067          	ret

0000000080002ee0 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002ee0:	ff010113          	addi	sp,sp,-16
    80002ee4:	00113423          	sd	ra,8(sp)
    80002ee8:	00813023          	sd	s0,0(sp)
    80002eec:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002ef0:	ffffe097          	auipc	ra,0xffffe
    80002ef4:	418080e7          	jalr	1048(ra) # 80001308 <_Z9mem_allocm>
}
    80002ef8:	00813083          	ld	ra,8(sp)
    80002efc:	00013403          	ld	s0,0(sp)
    80002f00:	01010113          	addi	sp,sp,16
    80002f04:	00008067          	ret

0000000080002f08 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002f08:	fd010113          	addi	sp,sp,-48
    80002f0c:	02113423          	sd	ra,40(sp)
    80002f10:	02813023          	sd	s0,32(sp)
    80002f14:	00913c23          	sd	s1,24(sp)
    80002f18:	01213823          	sd	s2,16(sp)
    80002f1c:	01313423          	sd	s3,8(sp)
    80002f20:	03010413          	addi	s0,sp,48
    80002f24:	00050913          	mv	s2,a0
    80002f28:	00058993          	mv	s3,a1
    80002f2c:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    80002f30:	06000513          	li	a0,96
    80002f34:	00000097          	auipc	ra,0x0
    80002f38:	fac080e7          	jalr	-84(ra) # 80002ee0 <_ZN3TCBnwEm>

private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED) {
    80002f3c:	01253823          	sd	s2,16(a0)
    80002f40:	00953c23          	sd	s1,24(a0)
    80002f44:	03353023          	sd	s3,32(a0)
    80002f48:	00200793          	li	a5,2
    80002f4c:	02f53423          	sd	a5,40(a0)
    80002f50:	02053823          	sd	zero,48(a0)
    80002f54:	02053c23          	sd	zero,56(a0)
    80002f58:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80002f5c:	04053423          	sd	zero,72(a0)
    80002f60:	04053823          	sd	zero,80(a0)
    80002f64:	04052c23          	sw	zero,88(a0)
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80002f68:	0000a797          	auipc	a5,0xa
    80002f6c:	ce87b783          	ld	a5,-792(a5) # 8000cc50 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002f70:	02f90e63          	beq	s2,a5,80002fac <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002f74:	00000797          	auipc	a5,0x0
    80002f78:	e7478793          	addi	a5,a5,-396 # 80002de8 <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002f7c:	02048c63          	beqz	s1,80002fb4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002f80:	00001637          	lui	a2,0x1
    80002f84:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    80002f88:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    80002f8c:	00953423          	sd	s1,8(a0)
}
    80002f90:	02813083          	ld	ra,40(sp)
    80002f94:	02013403          	ld	s0,32(sp)
    80002f98:	01813483          	ld	s1,24(sp)
    80002f9c:	01013903          	ld	s2,16(sp)
    80002fa0:	00813983          	ld	s3,8(sp)
    80002fa4:	03010113          	addi	sp,sp,48
    80002fa8:	00008067          	ret
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80002fac:	00000793          	li	a5,0
    80002fb0:	fcdff06f          	j	80002f7c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002fb4:	00000493          	li	s1,0
    80002fb8:	fd1ff06f          	j	80002f88 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x80>

0000000080002fbc <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002fbc:	ff010113          	addi	sp,sp,-16
    80002fc0:	00113423          	sd	ra,8(sp)
    80002fc4:	00813023          	sd	s0,0(sp)
    80002fc8:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002fcc:	ffffe097          	auipc	ra,0xffffe
    80002fd0:	37c080e7          	jalr	892(ra) # 80001348 <_Z8mem_freePv>
}
    80002fd4:	00813083          	ld	ra,8(sp)
    80002fd8:	00013403          	ld	s0,0(sp)
    80002fdc:	01010113          	addi	sp,sp,16
    80002fe0:	00008067          	ret

0000000080002fe4 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED || TCB::running == handle) return;
    80002fe4:	05852703          	lw	a4,88(a0)
    80002fe8:	00500793          	li	a5,5
    80002fec:	04f70263          	beq	a4,a5,80003030 <_ZN3TCB10threadJoinEPS_+0x4c>
    80002ff0:	0000a597          	auipc	a1,0xa
    80002ff4:	e405b583          	ld	a1,-448(a1) # 8000ce30 <_ZN3TCB7runningE>
    80002ff8:	02a58c63          	beq	a1,a0,80003030 <_ZN3TCB10threadJoinEPS_+0x4c>
void TCB::threadJoin(TCB* handle) {
    80002ffc:	ff010113          	addi	sp,sp,-16
    80003000:	00113423          	sd	ra,8(sp)
    80003004:	00813023          	sd	s0,0(sp)
    80003008:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    8000300c:	00300793          	li	a5,3
    80003010:	04f5ac23          	sw	a5,88(a1)
    handle->waitingToJoin.putLast(TCB::running);
    80003014:	04850513          	addi	a0,a0,72
    80003018:	ffffe097          	auipc	ra,0xffffe
    8000301c:	224080e7          	jalr	548(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
}
    80003020:	00813083          	ld	ra,8(sp)
    80003024:	00013403          	ld	s0,0(sp)
    80003028:	01010113          	addi	sp,sp,16
    8000302c:	00008067          	ret
    80003030:	00008067          	ret

0000000080003034 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80003034:	0000a517          	auipc	a0,0xa
    80003038:	dfc53503          	ld	a0,-516(a0) # 8000ce30 <_ZN3TCB7runningE>
        return front == nullptr;
    8000303c:	04853783          	ld	a5,72(a0)
    80003040:	04078463          	beqz	a5,80003088 <_ZN3TCB13releaseJoinedEv+0x54>
void TCB::releaseJoined() {
    80003044:	ff010113          	addi	sp,sp,-16
    80003048:	00113423          	sd	ra,8(sp)
    8000304c:	00813023          	sd	s0,0(sp)
    80003050:	01010413          	addi	s0,sp,16
        TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80003054:	04850513          	addi	a0,a0,72
    80003058:	ffffe097          	auipc	ra,0xffffe
    8000305c:	250080e7          	jalr	592(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
        Scheduler::put(tcb);
    80003060:	fffff097          	auipc	ra,0xfffff
    80003064:	870080e7          	jalr	-1936(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80003068:	0000a517          	auipc	a0,0xa
    8000306c:	dc853503          	ld	a0,-568(a0) # 8000ce30 <_ZN3TCB7runningE>
    80003070:	04853783          	ld	a5,72(a0)
    80003074:	fe0790e3          	bnez	a5,80003054 <_ZN3TCB13releaseJoinedEv+0x20>
    }
}
    80003078:	00813083          	ld	ra,8(sp)
    8000307c:	00013403          	ld	s0,0(sp)
    80003080:	01010113          	addi	sp,sp,16
    80003084:	00008067          	ret
    80003088:	00008067          	ret

000000008000308c <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
    //startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
    if (newTcb->threadFunction != (TCB::Body)main) {
    8000308c:	01053703          	ld	a4,16(a0)
    80003090:	0000a797          	auipc	a5,0xa
    80003094:	bc07b783          	ld	a5,-1088(a5) # 8000cc50 <_GLOBAL_OFFSET_TABLE_+0x58>
    80003098:	02f70663          	beq	a4,a5,800030c4 <_ZN3TCB5startEPS_+0x38>
void TCB::start(TCB* newTcb) {
    8000309c:	ff010113          	addi	sp,sp,-16
    800030a0:	00113423          	sd	ra,8(sp)
    800030a4:	00813023          	sd	s0,0(sp)
    800030a8:	01010413          	addi	s0,sp,16
        Scheduler::put(newTcb);
    800030ac:	fffff097          	auipc	ra,0xfffff
    800030b0:	824080e7          	jalr	-2012(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
    }
}
    800030b4:	00813083          	ld	ra,8(sp)
    800030b8:	00013403          	ld	s0,0(sp)
    800030bc:	01010113          	addi	sp,sp,16
    800030c0:	00008067          	ret
    800030c4:	00008067          	ret

00000000800030c8 <_ZN5Riscv19returnFromInterruptEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::returnFromInterrupt() {
    800030c8:	ff010113          	addi	sp,sp,-16
    800030cc:	00813423          	sd	s0,8(sp)
    800030d0:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    800030d4:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    800030d8:	10200073          	sret
    800030dc:	00813403          	ld	s0,8(sp)
    800030e0:	01010113          	addi	sp,sp,16
    800030e4:	00008067          	ret

00000000800030e8 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    800030e8:	ff010113          	addi	sp,sp,-16
    800030ec:	00113423          	sd	ra,8(sp)
    800030f0:	00813023          	sd	s0,0(sp)
    800030f4:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800030f8:	ffffe097          	auipc	ra,0xffffe
    800030fc:	210080e7          	jalr	528(ra) # 80001308 <_Z9mem_allocm>
}
    80003100:	00813083          	ld	ra,8(sp)
    80003104:	00013403          	ld	s0,0(sp)
    80003108:	01010113          	addi	sp,sp,16
    8000310c:	00008067          	ret

0000000080003110 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80003110:	ff010113          	addi	sp,sp,-16
    80003114:	00113423          	sd	ra,8(sp)
    80003118:	00813023          	sd	s0,0(sp)
    8000311c:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003120:	ffffe097          	auipc	ra,0xffffe
    80003124:	228080e7          	jalr	552(ra) # 80001348 <_Z8mem_freePv>
}
    80003128:	00813083          	ld	ra,8(sp)
    8000312c:	00013403          	ld	s0,0(sp)
    80003130:	01010113          	addi	sp,sp,16
    80003134:	00008067          	ret

0000000080003138 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003138:	fe010113          	addi	sp,sp,-32
    8000313c:	00113c23          	sd	ra,24(sp)
    80003140:	00813823          	sd	s0,16(sp)
    80003144:	00913423          	sd	s1,8(sp)
    80003148:	02010413          	addi	s0,sp,32
    8000314c:	00050493          	mv	s1,a0
	return new KSem(val);
    80003150:	02000513          	li	a0,32
    80003154:	00000097          	auipc	ra,0x0
    80003158:	f94080e7          	jalr	-108(ra) # 800030e8 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    8000315c:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003160:	00053423          	sd	zero,8(a0)
    80003164:	00053823          	sd	zero,16(a0)
    80003168:	00100713          	li	a4,1
    8000316c:	00e50c23          	sb	a4,24(a0)
}
    80003170:	01813083          	ld	ra,24(sp)
    80003174:	01013403          	ld	s0,16(sp)
    80003178:	00813483          	ld	s1,8(sp)
    8000317c:	02010113          	addi	sp,sp,32
    80003180:	00008067          	ret

0000000080003184 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003184:	ff010113          	addi	sp,sp,-16
    80003188:	00113423          	sd	ra,8(sp)
    8000318c:	00813023          	sd	s0,0(sp)
    80003190:	01010413          	addi	s0,sp,16
    static TCB* getRunning() { return running; }
    80003194:	0000a797          	auipc	a5,0xa
    80003198:	acc7b783          	ld	a5,-1332(a5) # 8000cc60 <_GLOBAL_OFFSET_TABLE_+0x68>
    8000319c:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    800031a0:	00200793          	li	a5,2
    800031a4:	04f5ac23          	sw	a5,88(a1)
    TCB::getRunning()->setStatus(TCB::BLOCKED);
	blocked.putLast(TCB::getRunning());
    800031a8:	00850513          	addi	a0,a0,8
    800031ac:	ffffe097          	auipc	ra,0xffffe
    800031b0:	090080e7          	jalr	144(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::dispatch();
    800031b4:	00000097          	auipc	ra,0x0
    800031b8:	c78080e7          	jalr	-904(ra) # 80002e2c <_ZN3TCB8dispatchEv>
}
    800031bc:	00813083          	ld	ra,8(sp)
    800031c0:	00013403          	ld	s0,0(sp)
    800031c4:	01010113          	addi	sp,sp,16
    800031c8:	00008067          	ret

00000000800031cc <_ZN4KSem4waitEv>:
	if (!working) return -3;
    800031cc:	01854783          	lbu	a5,24(a0)
    800031d0:	04078663          	beqz	a5,8000321c <_ZN4KSem4waitEv+0x50>
	if (--val < 0) {
    800031d4:	00052783          	lw	a5,0(a0)
    800031d8:	fff7879b          	addiw	a5,a5,-1
    800031dc:	00f52023          	sw	a5,0(a0)
    800031e0:	02079713          	slli	a4,a5,0x20
    800031e4:	00074663          	bltz	a4,800031f0 <_ZN4KSem4waitEv+0x24>
	return 0;
    800031e8:	00000513          	li	a0,0
}
    800031ec:	00008067          	ret
int KSem::wait() {
    800031f0:	ff010113          	addi	sp,sp,-16
    800031f4:	00113423          	sd	ra,8(sp)
    800031f8:	00813023          	sd	s0,0(sp)
    800031fc:	01010413          	addi	s0,sp,16
		block();
    80003200:	00000097          	auipc	ra,0x0
    80003204:	f84080e7          	jalr	-124(ra) # 80003184 <_ZN4KSem5blockEv>
		return -1;
    80003208:	fff00513          	li	a0,-1
}
    8000320c:	00813083          	ld	ra,8(sp)
    80003210:	00013403          	ld	s0,0(sp)
    80003214:	01010113          	addi	sp,sp,16
    80003218:	00008067          	ret
	if (!working) return -3;
    8000321c:	ffd00513          	li	a0,-3
    80003220:	00008067          	ret

0000000080003224 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    80003224:	ff010113          	addi	sp,sp,-16
    80003228:	00113423          	sd	ra,8(sp)
    8000322c:	00813023          	sd	s0,0(sp)
    80003230:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    80003234:	00850513          	addi	a0,a0,8
    80003238:	ffffe097          	auipc	ra,0xffffe
    8000323c:	070080e7          	jalr	112(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
	Scheduler::put(tcb);
    80003240:	ffffe097          	auipc	ra,0xffffe
    80003244:	690080e7          	jalr	1680(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
}
    80003248:	00813083          	ld	ra,8(sp)
    8000324c:	00013403          	ld	s0,0(sp)
    80003250:	01010113          	addi	sp,sp,16
    80003254:	00008067          	ret

0000000080003258 <_ZN4KSem6signalEv>:
	if (!working) return -3;
    80003258:	01854783          	lbu	a5,24(a0)
    8000325c:	04078463          	beqz	a5,800032a4 <_ZN4KSem6signalEv+0x4c>
	if (val++ < 0) {
    80003260:	00052783          	lw	a5,0(a0)
    80003264:	0017871b          	addiw	a4,a5,1
    80003268:	00e52023          	sw	a4,0(a0)
    8000326c:	0007c663          	bltz	a5,80003278 <_ZN4KSem6signalEv+0x20>
	return 0;
    80003270:	00000513          	li	a0,0
}
    80003274:	00008067          	ret
int KSem::signal() {
    80003278:	ff010113          	addi	sp,sp,-16
    8000327c:	00113423          	sd	ra,8(sp)
    80003280:	00813023          	sd	s0,0(sp)
    80003284:	01010413          	addi	s0,sp,16
		unblock();
    80003288:	00000097          	auipc	ra,0x0
    8000328c:	f9c080e7          	jalr	-100(ra) # 80003224 <_ZN4KSem7unblockEv>
	return 0;
    80003290:	00000513          	li	a0,0
}
    80003294:	00813083          	ld	ra,8(sp)
    80003298:	00013403          	ld	s0,0(sp)
    8000329c:	01010113          	addi	sp,sp,16
    800032a0:	00008067          	ret
	if (!working) return -3;
    800032a4:	ffd00513          	li	a0,-3
    800032a8:	00008067          	ret

00000000800032ac <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    800032ac:	fe010113          	addi	sp,sp,-32
    800032b0:	00113c23          	sd	ra,24(sp)
    800032b4:	00813823          	sd	s0,16(sp)
    800032b8:	00913423          	sd	s1,8(sp)
    800032bc:	02010413          	addi	s0,sp,32
    800032c0:	00050493          	mv	s1,a0
	handle->working = false;
    800032c4:	00050c23          	sb	zero,24(a0)
        return front == nullptr;
    800032c8:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    800032cc:	00078e63          	beqz	a5,800032e8 <_ZN4KSem8closeSemEPS_+0x3c>
		TCB* tcb = handle->blocked.getFirst();
    800032d0:	00848513          	addi	a0,s1,8
    800032d4:	ffffe097          	auipc	ra,0xffffe
    800032d8:	fd4080e7          	jalr	-44(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
		Scheduler::put(tcb);
    800032dc:	ffffe097          	auipc	ra,0xffffe
    800032e0:	5f4080e7          	jalr	1524(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    800032e4:	fe5ff06f          	j	800032c8 <_ZN4KSem8closeSemEPS_+0x1c>
	}
	return 0;
}
    800032e8:	00000513          	li	a0,0
    800032ec:	01813083          	ld	ra,24(sp)
    800032f0:	01013403          	ld	s0,16(sp)
    800032f4:	00813483          	ld	s1,8(sp)
    800032f8:	02010113          	addi	sp,sp,32
    800032fc:	00008067          	ret

0000000080003300 <_Z13emptyFunctionPv>:
    void run() override {
        thread_dispatch();
    }
};

void emptyFunction(void*) {}
    80003300:	ff010113          	addi	sp,sp,-16
    80003304:	00813423          	sd	s0,8(sp)
    80003308:	01010413          	addi	s0,sp,16
    8000330c:	00813403          	ld	s0,8(sp)
    80003310:	01010113          	addi	sp,sp,16
    80003314:	00008067          	ret

0000000080003318 <_Z5nit1fPv>:

void nit1f(void*) {
    80003318:	fe010113          	addi	sp,sp,-32
    8000331c:	00113c23          	sd	ra,24(sp)
    80003320:	00813823          	sd	s0,16(sp)
    80003324:	02010413          	addi	s0,sp,32
    while (true) {
        thread_t handle;
        thread_create(&handle, emptyFunction, nullptr);
    80003328:	00000613          	li	a2,0
    8000332c:	00000597          	auipc	a1,0x0
    80003330:	fd458593          	addi	a1,a1,-44 # 80003300 <_Z13emptyFunctionPv>
    80003334:	fe840513          	addi	a0,s0,-24
    80003338:	ffffe097          	auipc	ra,0xffffe
    8000333c:	040080e7          	jalr	64(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    while (true) {
    80003340:	fe9ff06f          	j	80003328 <_Z5nit1fPv+0x10>

0000000080003344 <_Z5nit2fPv>:
    void periodicActivation() override {
        printString("Janko\n");
    }
};

void nit2f(void* arg2) {
    80003344:	fe010113          	addi	sp,sp,-32
    80003348:	00113c23          	sd	ra,24(sp)
    8000334c:	00813823          	sd	s0,16(sp)
    80003350:	00913423          	sd	s1,8(sp)
    80003354:	01213023          	sd	s2,0(sp)
    80003358:	02010413          	addi	s0,sp,32
    PeriodicThread* pt = new per(10);
    8000335c:	02800513          	li	a0,40
    80003360:	fffff097          	auipc	ra,0xfffff
    80003364:	534080e7          	jalr	1332(ra) # 80002894 <_Znwm>
    80003368:	00050493          	mv	s1,a0
    per(time_t period) : PeriodicThread(period) {}
    8000336c:	00a00593          	li	a1,10
    80003370:	00000097          	auipc	ra,0x0
    80003374:	928080e7          	jalr	-1752(ra) # 80002c98 <_ZN14PeriodicThreadC1Em>
    80003378:	00009797          	auipc	a5,0x9
    8000337c:	6b878793          	addi	a5,a5,1720 # 8000ca30 <_ZTV3per+0x10>
    80003380:	00f4b023          	sd	a5,0(s1)
    pt->start();
    80003384:	00048513          	mv	a0,s1
    80003388:	fffff097          	auipc	ra,0xfffff
    8000338c:	6c4080e7          	jalr	1732(ra) # 80002a4c <_ZN6Thread5startEv>
    time_sleep(15);
    80003390:	00f00513          	li	a0,15
    80003394:	ffffe097          	auipc	ra,0xffffe
    80003398:	0e8080e7          	jalr	232(ra) # 8000147c <_Z10time_sleepm>
    pt->terminate();
    8000339c:	00048513          	mv	a0,s1
    800033a0:	00000097          	auipc	ra,0x0
    800033a4:	8d8080e7          	jalr	-1832(ra) # 80002c78 <_ZN14PeriodicThread9terminateEv>
    printString("\nGotova nit 2\n");
    800033a8:	00007517          	auipc	a0,0x7
    800033ac:	e0850513          	addi	a0,a0,-504 # 8000a1b0 <CONSOLE_STATUS+0x1a0>
    800033b0:	00002097          	auipc	ra,0x2
    800033b4:	734080e7          	jalr	1844(ra) # 80005ae4 <_Z11printStringPKc>
}
    800033b8:	01813083          	ld	ra,24(sp)
    800033bc:	01013403          	ld	s0,16(sp)
    800033c0:	00813483          	ld	s1,8(sp)
    800033c4:	00013903          	ld	s2,0(sp)
    800033c8:	02010113          	addi	sp,sp,32
    800033cc:	00008067          	ret
    800033d0:	00050913          	mv	s2,a0
    PeriodicThread* pt = new per(10);
    800033d4:	00048513          	mv	a0,s1
    800033d8:	fffff097          	auipc	ra,0xfffff
    800033dc:	50c080e7          	jalr	1292(ra) # 800028e4 <_ZdlPv>
    800033e0:	00090513          	mv	a0,s2
    800033e4:	0000b097          	auipc	ra,0xb
    800033e8:	b94080e7          	jalr	-1132(ra) # 8000df78 <_Unwind_Resume>

00000000800033ec <_Z5nit3fPv>:


void nit3f(void*) {
    800033ec:	fe010113          	addi	sp,sp,-32
    800033f0:	00113c23          	sd	ra,24(sp)
    800033f4:	00813823          	sd	s0,16(sp)
    800033f8:	00913423          	sd	s1,8(sp)
    800033fc:	02010413          	addi	s0,sp,32
    80003400:	0180006f          	j	80003418 <_Z5nit3fPv+0x2c>
    char slovo;
    do {
        slovo = getc();
        putc(slovo);
        if (slovo == '\r') putc('\n');
    80003404:	00a00513          	li	a0,10
    80003408:	ffffe097          	auipc	ra,0xffffe
    8000340c:	194080e7          	jalr	404(ra) # 8000159c <_Z4putcc>
    } while (slovo != '0');
    80003410:	03000793          	li	a5,48
    80003414:	02f48263          	beq	s1,a5,80003438 <_Z5nit3fPv+0x4c>
        slovo = getc();
    80003418:	ffffe097          	auipc	ra,0xffffe
    8000341c:	15c080e7          	jalr	348(ra) # 80001574 <_Z4getcv>
    80003420:	00050493          	mv	s1,a0
        putc(slovo);
    80003424:	ffffe097          	auipc	ra,0xffffe
    80003428:	178080e7          	jalr	376(ra) # 8000159c <_Z4putcc>
        if (slovo == '\r') putc('\n');
    8000342c:	00d00793          	li	a5,13
    80003430:	fef490e3          	bne	s1,a5,80003410 <_Z5nit3fPv+0x24>
    80003434:	fd1ff06f          	j	80003404 <_Z5nit3fPv+0x18>

    printString("\nGotova nit3\n");
    80003438:	00007517          	auipc	a0,0x7
    8000343c:	d8850513          	addi	a0,a0,-632 # 8000a1c0 <CONSOLE_STATUS+0x1b0>
    80003440:	00002097          	auipc	ra,0x2
    80003444:	6a4080e7          	jalr	1700(ra) # 80005ae4 <_Z11printStringPKc>
}
    80003448:	01813083          	ld	ra,24(sp)
    8000344c:	01013403          	ld	s0,16(sp)
    80003450:	00813483          	ld	s1,8(sp)
    80003454:	02010113          	addi	sp,sp,32
    80003458:	00008067          	ret

000000008000345c <_Z5main2v>:


int main2() {
    8000345c:	fb010113          	addi	sp,sp,-80
    80003460:	04113423          	sd	ra,72(sp)
    80003464:	04813023          	sd	s0,64(sp)
    80003468:	02913c23          	sd	s1,56(sp)
    8000346c:	05010413          	addi	s0,sp,80
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80003470:	0000a797          	auipc	a5,0xa
    80003474:	8007b783          	ld	a5,-2048(a5) # 8000cc70 <_GLOBAL_OFFSET_TABLE_+0x78>
    80003478:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    8000347c:	ffffe097          	auipc	ra,0xffffe
    80003480:	794080e7          	jalr	1940(ra) # 80001c10 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80003484:	ffffe097          	auipc	ra,0xffffe
    80003488:	1fc080e7          	jalr	508(ra) # 80001680 <_ZN8KConsole12initKConsoleEv>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

    //testiranje kreiranja niti
    thread_t glavnaNit = nullptr;
    8000348c:	fc043c23          	sd	zero,-40(s0)
    thread_t nit1 = nullptr;
    80003490:	fc043823          	sd	zero,-48(s0)
    thread_t nit2 = nullptr;
    80003494:	fc043423          	sd	zero,-56(s0)
    thread_t nit3 = nullptr;
    80003498:	fc043023          	sd	zero,-64(s0)
    thread_t idleNit = nullptr;
    8000349c:	fa043c23          	sd	zero,-72(s0)
    thread_t kernelConsumerThread = nullptr;
    800034a0:	fa043823          	sd	zero,-80(s0)
    thread_create(&glavnaNit, (TCB::Body)main, nullptr);
    800034a4:	00000613          	li	a2,0
    800034a8:	00009597          	auipc	a1,0x9
    800034ac:	7a85b583          	ld	a1,1960(a1) # 8000cc50 <_GLOBAL_OFFSET_TABLE_+0x58>
    800034b0:	fd840513          	addi	a0,s0,-40
    800034b4:	ffffe097          	auipc	ra,0xffffe
    800034b8:	ec4080e7          	jalr	-316(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    static void setRunning(TCB* newRunning) { running = newRunning; }
    800034bc:	fd843703          	ld	a4,-40(s0)
    800034c0:	00009797          	auipc	a5,0x9
    800034c4:	7a07b783          	ld	a5,1952(a5) # 8000cc60 <_GLOBAL_OFFSET_TABLE_+0x68>
    800034c8:	00e7b023          	sd	a4,0(a5)
    TCB::setRunning(glavnaNit);
    thread_create(&idleNit, idle, nullptr);
    800034cc:	00000613          	li	a2,0
    800034d0:	00009597          	auipc	a1,0x9
    800034d4:	7a85b583          	ld	a1,1960(a1) # 8000cc78 <_GLOBAL_OFFSET_TABLE_+0x80>
    800034d8:	fb840513          	addi	a0,s0,-72
    800034dc:	ffffe097          	auipc	ra,0xffffe
    800034e0:	e9c080e7          	jalr	-356(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    800034e4:	00000613          	li	a2,0
    800034e8:	00009597          	auipc	a1,0x9
    800034ec:	7485b583          	ld	a1,1864(a1) # 8000cc30 <_GLOBAL_OFFSET_TABLE_+0x38>
    800034f0:	fb040513          	addi	a0,s0,-80
    800034f4:	ffffe097          	auipc	ra,0xffffe
    800034f8:	e84080e7          	jalr	-380(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>


    thread_create(&nit1, nit1f, nullptr);
    800034fc:	00000613          	li	a2,0
    80003500:	00000597          	auipc	a1,0x0
    80003504:	e1858593          	addi	a1,a1,-488 # 80003318 <_Z5nit1fPv>
    80003508:	fd040513          	addi	a0,s0,-48
    8000350c:	ffffe097          	auipc	ra,0xffffe
    80003510:	e6c080e7          	jalr	-404(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit2, nit2f, nullptr);
    80003514:	00000613          	li	a2,0
    80003518:	00000597          	auipc	a1,0x0
    8000351c:	e2c58593          	addi	a1,a1,-468 # 80003344 <_Z5nit2fPv>
    80003520:	fc840513          	addi	a0,s0,-56
    80003524:	ffffe097          	auipc	ra,0xffffe
    80003528:	e54080e7          	jalr	-428(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit3, nit3f, nullptr);
    8000352c:	00000613          	li	a2,0
    80003530:	00000597          	auipc	a1,0x0
    80003534:	ebc58593          	addi	a1,a1,-324 # 800033ec <_Z5nit3fPv>
    80003538:	fc040513          	addi	a0,s0,-64
    8000353c:	ffffe097          	auipc	ra,0xffffe
    80003540:	e3c080e7          	jalr	-452(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    80003544:	00200493          	li	s1,2
    80003548:	1004a073          	csrs	sstatus,s1

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    thread_join(nit1);
    8000354c:	fd043503          	ld	a0,-48(s0)
    80003550:	ffffe097          	auipc	ra,0xffffe
    80003554:	f04080e7          	jalr	-252(ra) # 80001454 <_Z11thread_joinP3TCB>
    thread_join(nit2);
    80003558:	fc843503          	ld	a0,-56(s0)
    8000355c:	ffffe097          	auipc	ra,0xffffe
    80003560:	ef8080e7          	jalr	-264(ra) # 80001454 <_Z11thread_joinP3TCB>
    thread_join(nit3);
    80003564:	fc043503          	ld	a0,-64(s0)
    80003568:	ffffe097          	auipc	ra,0xffffe
    8000356c:	eec080e7          	jalr	-276(ra) # 80001454 <_Z11thread_joinP3TCB>
    //thread_join(idleNit);

    printString("\nGotove user niti\n");
    80003570:	00007517          	auipc	a0,0x7
    80003574:	c6050513          	addi	a0,a0,-928 # 8000a1d0 <CONSOLE_STATUS+0x1c0>
    80003578:	00002097          	auipc	ra,0x2
    8000357c:	56c080e7          	jalr	1388(ra) # 80005ae4 <_Z11printStringPKc>

    printString("\nSad cu da izadjem\n");
    80003580:	00007517          	auipc	a0,0x7
    80003584:	c6850513          	addi	a0,a0,-920 # 8000a1e8 <CONSOLE_STATUS+0x1d8>
    80003588:	00002097          	auipc	ra,0x2
    8000358c:	55c080e7          	jalr	1372(ra) # 80005ae4 <_Z11printStringPKc>
        __asm__ volatile("li a0, 0x43");
    80003590:	04300513          	li	a0,67
        __asm__ volatile("ecall");
    80003594:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003598:	1004b073          	csrc	sstatus,s1
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);


    return 0;
    8000359c:	00000513          	li	a0,0
    800035a0:	04813083          	ld	ra,72(sp)
    800035a4:	04013403          	ld	s0,64(sp)
    800035a8:	03813483          	ld	s1,56(sp)
    800035ac:	05010113          	addi	sp,sp,80
    800035b0:	00008067          	ret

00000000800035b4 <_ZN3per18periodicActivationEv>:
    void periodicActivation() override {
    800035b4:	ff010113          	addi	sp,sp,-16
    800035b8:	00113423          	sd	ra,8(sp)
    800035bc:	00813023          	sd	s0,0(sp)
    800035c0:	01010413          	addi	s0,sp,16
        printString("Janko\n");
    800035c4:	00007517          	auipc	a0,0x7
    800035c8:	be450513          	addi	a0,a0,-1052 # 8000a1a8 <CONSOLE_STATUS+0x198>
    800035cc:	00002097          	auipc	ra,0x2
    800035d0:	518080e7          	jalr	1304(ra) # 80005ae4 <_Z11printStringPKc>
    }
    800035d4:	00813083          	ld	ra,8(sp)
    800035d8:	00013403          	ld	s0,0(sp)
    800035dc:	01010113          	addi	sp,sp,16
    800035e0:	00008067          	ret

00000000800035e4 <_ZN3perD1Ev>:
class per : public PeriodicThread {
    800035e4:	ff010113          	addi	sp,sp,-16
    800035e8:	00113423          	sd	ra,8(sp)
    800035ec:	00813023          	sd	s0,0(sp)
    800035f0:	01010413          	addi	s0,sp,16
    800035f4:	00009797          	auipc	a5,0x9
    800035f8:	6347b783          	ld	a5,1588(a5) # 8000cc28 <_GLOBAL_OFFSET_TABLE_+0x30>
    800035fc:	01078793          	addi	a5,a5,16
    80003600:	00f53023          	sd	a5,0(a0)
    80003604:	fffff097          	auipc	ra,0xfffff
    80003608:	1a0080e7          	jalr	416(ra) # 800027a4 <_ZN6ThreadD1Ev>
    8000360c:	00813083          	ld	ra,8(sp)
    80003610:	00013403          	ld	s0,0(sp)
    80003614:	01010113          	addi	sp,sp,16
    80003618:	00008067          	ret

000000008000361c <_ZN3perD0Ev>:
    8000361c:	fe010113          	addi	sp,sp,-32
    80003620:	00113c23          	sd	ra,24(sp)
    80003624:	00813823          	sd	s0,16(sp)
    80003628:	00913423          	sd	s1,8(sp)
    8000362c:	02010413          	addi	s0,sp,32
    80003630:	00050493          	mv	s1,a0
    80003634:	00009797          	auipc	a5,0x9
    80003638:	5f47b783          	ld	a5,1524(a5) # 8000cc28 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000363c:	01078793          	addi	a5,a5,16
    80003640:	00f53023          	sd	a5,0(a0)
    80003644:	fffff097          	auipc	ra,0xfffff
    80003648:	160080e7          	jalr	352(ra) # 800027a4 <_ZN6ThreadD1Ev>
    8000364c:	00048513          	mv	a0,s1
    80003650:	fffff097          	auipc	ra,0xfffff
    80003654:	294080e7          	jalr	660(ra) # 800028e4 <_ZdlPv>
    80003658:	01813083          	ld	ra,24(sp)
    8000365c:	01013403          	ld	s0,16(sp)
    80003660:	00813483          	ld	s1,8(sp)
    80003664:	02010113          	addi	sp,sp,32
    80003668:	00008067          	ret

000000008000366c <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    8000366c:	fe010113          	addi	sp,sp,-32
    80003670:	00113c23          	sd	ra,24(sp)
    80003674:	00813823          	sd	s0,16(sp)
    80003678:	00913423          	sd	s1,8(sp)
    8000367c:	01213023          	sd	s2,0(sp)
    80003680:	02010413          	addi	s0,sp,32
    80003684:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003688:	00000913          	li	s2,0
    8000368c:	00c0006f          	j	80003698 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003690:	ffffe097          	auipc	ra,0xffffe
    80003694:	da4080e7          	jalr	-604(ra) # 80001434 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80003698:	ffffe097          	auipc	ra,0xffffe
    8000369c:	edc080e7          	jalr	-292(ra) # 80001574 <_Z4getcv>
    800036a0:	0005059b          	sext.w	a1,a0
    800036a4:	02d00793          	li	a5,45
    800036a8:	02f58a63          	beq	a1,a5,800036dc <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800036ac:	0084b503          	ld	a0,8(s1)
    800036b0:	00003097          	auipc	ra,0x3
    800036b4:	400080e7          	jalr	1024(ra) # 80006ab0 <_ZN6Buffer3putEi>
        i++;
    800036b8:	0019071b          	addiw	a4,s2,1
    800036bc:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800036c0:	0004a683          	lw	a3,0(s1)
    800036c4:	0026979b          	slliw	a5,a3,0x2
    800036c8:	00d787bb          	addw	a5,a5,a3
    800036cc:	0017979b          	slliw	a5,a5,0x1
    800036d0:	02f767bb          	remw	a5,a4,a5
    800036d4:	fc0792e3          	bnez	a5,80003698 <_ZL16producerKeyboardPv+0x2c>
    800036d8:	fb9ff06f          	j	80003690 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800036dc:	00100793          	li	a5,1
    800036e0:	00009717          	auipc	a4,0x9
    800036e4:	76f72023          	sw	a5,1888(a4) # 8000ce40 <_ZL9threadEnd>
    data->buffer->put('!');
    800036e8:	02100593          	li	a1,33
    800036ec:	0084b503          	ld	a0,8(s1)
    800036f0:	00003097          	auipc	ra,0x3
    800036f4:	3c0080e7          	jalr	960(ra) # 80006ab0 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800036f8:	0104b503          	ld	a0,16(s1)
    800036fc:	ffffe097          	auipc	ra,0xffffe
    80003700:	e48080e7          	jalr	-440(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    80003704:	01813083          	ld	ra,24(sp)
    80003708:	01013403          	ld	s0,16(sp)
    8000370c:	00813483          	ld	s1,8(sp)
    80003710:	00013903          	ld	s2,0(sp)
    80003714:	02010113          	addi	sp,sp,32
    80003718:	00008067          	ret

000000008000371c <_ZL8producerPv>:

static void producer(void *arg) {
    8000371c:	fe010113          	addi	sp,sp,-32
    80003720:	00113c23          	sd	ra,24(sp)
    80003724:	00813823          	sd	s0,16(sp)
    80003728:	00913423          	sd	s1,8(sp)
    8000372c:	01213023          	sd	s2,0(sp)
    80003730:	02010413          	addi	s0,sp,32
    80003734:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003738:	00000913          	li	s2,0
    8000373c:	00c0006f          	j	80003748 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003740:	ffffe097          	auipc	ra,0xffffe
    80003744:	cf4080e7          	jalr	-780(ra) # 80001434 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003748:	00009797          	auipc	a5,0x9
    8000374c:	6f87a783          	lw	a5,1784(a5) # 8000ce40 <_ZL9threadEnd>
    80003750:	02079e63          	bnez	a5,8000378c <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003754:	0004a583          	lw	a1,0(s1)
    80003758:	0305859b          	addiw	a1,a1,48
    8000375c:	0084b503          	ld	a0,8(s1)
    80003760:	00003097          	auipc	ra,0x3
    80003764:	350080e7          	jalr	848(ra) # 80006ab0 <_ZN6Buffer3putEi>
        i++;
    80003768:	0019071b          	addiw	a4,s2,1
    8000376c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003770:	0004a683          	lw	a3,0(s1)
    80003774:	0026979b          	slliw	a5,a3,0x2
    80003778:	00d787bb          	addw	a5,a5,a3
    8000377c:	0017979b          	slliw	a5,a5,0x1
    80003780:	02f767bb          	remw	a5,a4,a5
    80003784:	fc0792e3          	bnez	a5,80003748 <_ZL8producerPv+0x2c>
    80003788:	fb9ff06f          	j	80003740 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    8000378c:	0104b503          	ld	a0,16(s1)
    80003790:	ffffe097          	auipc	ra,0xffffe
    80003794:	db4080e7          	jalr	-588(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    80003798:	01813083          	ld	ra,24(sp)
    8000379c:	01013403          	ld	s0,16(sp)
    800037a0:	00813483          	ld	s1,8(sp)
    800037a4:	00013903          	ld	s2,0(sp)
    800037a8:	02010113          	addi	sp,sp,32
    800037ac:	00008067          	ret

00000000800037b0 <_ZL8consumerPv>:

static void consumer(void *arg) {
    800037b0:	fd010113          	addi	sp,sp,-48
    800037b4:	02113423          	sd	ra,40(sp)
    800037b8:	02813023          	sd	s0,32(sp)
    800037bc:	00913c23          	sd	s1,24(sp)
    800037c0:	01213823          	sd	s2,16(sp)
    800037c4:	01313423          	sd	s3,8(sp)
    800037c8:	03010413          	addi	s0,sp,48
    800037cc:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800037d0:	00000993          	li	s3,0
    800037d4:	01c0006f          	j	800037f0 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800037d8:	ffffe097          	auipc	ra,0xffffe
    800037dc:	c5c080e7          	jalr	-932(ra) # 80001434 <_Z15thread_dispatchv>
    800037e0:	0500006f          	j	80003830 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800037e4:	00a00513          	li	a0,10
    800037e8:	ffffe097          	auipc	ra,0xffffe
    800037ec:	db4080e7          	jalr	-588(ra) # 8000159c <_Z4putcc>
    while (!threadEnd) {
    800037f0:	00009797          	auipc	a5,0x9
    800037f4:	6507a783          	lw	a5,1616(a5) # 8000ce40 <_ZL9threadEnd>
    800037f8:	06079063          	bnez	a5,80003858 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800037fc:	00893503          	ld	a0,8(s2)
    80003800:	00003097          	auipc	ra,0x3
    80003804:	340080e7          	jalr	832(ra) # 80006b40 <_ZN6Buffer3getEv>
        i++;
    80003808:	0019849b          	addiw	s1,s3,1
    8000380c:	0004899b          	sext.w	s3,s1
        putc(key);
    80003810:	0ff57513          	andi	a0,a0,255
    80003814:	ffffe097          	auipc	ra,0xffffe
    80003818:	d88080e7          	jalr	-632(ra) # 8000159c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    8000381c:	00092703          	lw	a4,0(s2)
    80003820:	0027179b          	slliw	a5,a4,0x2
    80003824:	00e787bb          	addw	a5,a5,a4
    80003828:	02f4e7bb          	remw	a5,s1,a5
    8000382c:	fa0786e3          	beqz	a5,800037d8 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003830:	05000793          	li	a5,80
    80003834:	02f4e4bb          	remw	s1,s1,a5
    80003838:	fa049ce3          	bnez	s1,800037f0 <_ZL8consumerPv+0x40>
    8000383c:	fa9ff06f          	j	800037e4 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003840:	00893503          	ld	a0,8(s2)
    80003844:	00003097          	auipc	ra,0x3
    80003848:	2fc080e7          	jalr	764(ra) # 80006b40 <_ZN6Buffer3getEv>
        putc(key);
    8000384c:	0ff57513          	andi	a0,a0,255
    80003850:	ffffe097          	auipc	ra,0xffffe
    80003854:	d4c080e7          	jalr	-692(ra) # 8000159c <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003858:	00893503          	ld	a0,8(s2)
    8000385c:	00003097          	auipc	ra,0x3
    80003860:	370080e7          	jalr	880(ra) # 80006bcc <_ZN6Buffer6getCntEv>
    80003864:	fca04ee3          	bgtz	a0,80003840 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003868:	01093503          	ld	a0,16(s2)
    8000386c:	ffffe097          	auipc	ra,0xffffe
    80003870:	cd8080e7          	jalr	-808(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    80003874:	02813083          	ld	ra,40(sp)
    80003878:	02013403          	ld	s0,32(sp)
    8000387c:	01813483          	ld	s1,24(sp)
    80003880:	01013903          	ld	s2,16(sp)
    80003884:	00813983          	ld	s3,8(sp)
    80003888:	03010113          	addi	sp,sp,48
    8000388c:	00008067          	ret

0000000080003890 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003890:	f9010113          	addi	sp,sp,-112
    80003894:	06113423          	sd	ra,104(sp)
    80003898:	06813023          	sd	s0,96(sp)
    8000389c:	04913c23          	sd	s1,88(sp)
    800038a0:	05213823          	sd	s2,80(sp)
    800038a4:	05313423          	sd	s3,72(sp)
    800038a8:	05413023          	sd	s4,64(sp)
    800038ac:	03513c23          	sd	s5,56(sp)
    800038b0:	03613823          	sd	s6,48(sp)
    800038b4:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800038b8:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800038bc:	00007517          	auipc	a0,0x7
    800038c0:	94450513          	addi	a0,a0,-1724 # 8000a200 <CONSOLE_STATUS+0x1f0>
    800038c4:	00002097          	auipc	ra,0x2
    800038c8:	220080e7          	jalr	544(ra) # 80005ae4 <_Z11printStringPKc>
    getString(input, 30);
    800038cc:	01e00593          	li	a1,30
    800038d0:	fa040493          	addi	s1,s0,-96
    800038d4:	00048513          	mv	a0,s1
    800038d8:	00002097          	auipc	ra,0x2
    800038dc:	294080e7          	jalr	660(ra) # 80005b6c <_Z9getStringPci>
    threadNum = stringToInt(input);
    800038e0:	00048513          	mv	a0,s1
    800038e4:	00002097          	auipc	ra,0x2
    800038e8:	360080e7          	jalr	864(ra) # 80005c44 <_Z11stringToIntPKc>
    800038ec:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800038f0:	00007517          	auipc	a0,0x7
    800038f4:	93050513          	addi	a0,a0,-1744 # 8000a220 <CONSOLE_STATUS+0x210>
    800038f8:	00002097          	auipc	ra,0x2
    800038fc:	1ec080e7          	jalr	492(ra) # 80005ae4 <_Z11printStringPKc>
    getString(input, 30);
    80003900:	01e00593          	li	a1,30
    80003904:	00048513          	mv	a0,s1
    80003908:	00002097          	auipc	ra,0x2
    8000390c:	264080e7          	jalr	612(ra) # 80005b6c <_Z9getStringPci>
    n = stringToInt(input);
    80003910:	00048513          	mv	a0,s1
    80003914:	00002097          	auipc	ra,0x2
    80003918:	330080e7          	jalr	816(ra) # 80005c44 <_Z11stringToIntPKc>
    8000391c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003920:	00007517          	auipc	a0,0x7
    80003924:	92050513          	addi	a0,a0,-1760 # 8000a240 <CONSOLE_STATUS+0x230>
    80003928:	00002097          	auipc	ra,0x2
    8000392c:	1bc080e7          	jalr	444(ra) # 80005ae4 <_Z11printStringPKc>
	printInt(threadNum);
    80003930:	00000613          	li	a2,0
    80003934:	00a00593          	li	a1,10
    80003938:	00090513          	mv	a0,s2
    8000393c:	00002097          	auipc	ra,0x2
    80003940:	358080e7          	jalr	856(ra) # 80005c94 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003944:	00007517          	auipc	a0,0x7
    80003948:	91450513          	addi	a0,a0,-1772 # 8000a258 <CONSOLE_STATUS+0x248>
    8000394c:	00002097          	auipc	ra,0x2
    80003950:	198080e7          	jalr	408(ra) # 80005ae4 <_Z11printStringPKc>
	printInt(n);
    80003954:	00000613          	li	a2,0
    80003958:	00a00593          	li	a1,10
    8000395c:	00048513          	mv	a0,s1
    80003960:	00002097          	auipc	ra,0x2
    80003964:	334080e7          	jalr	820(ra) # 80005c94 <_Z8printIntiii>
    printString(".\n");
    80003968:	00007517          	auipc	a0,0x7
    8000396c:	90850513          	addi	a0,a0,-1784 # 8000a270 <CONSOLE_STATUS+0x260>
    80003970:	00002097          	auipc	ra,0x2
    80003974:	174080e7          	jalr	372(ra) # 80005ae4 <_Z11printStringPKc>
    if(threadNum > n) {
    80003978:	0324c463          	blt	s1,s2,800039a0 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    8000397c:	03205c63          	blez	s2,800039b4 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003980:	03800513          	li	a0,56
    80003984:	fffff097          	auipc	ra,0xfffff
    80003988:	f10080e7          	jalr	-240(ra) # 80002894 <_Znwm>
    8000398c:	00050a13          	mv	s4,a0
    80003990:	00048593          	mv	a1,s1
    80003994:	00003097          	auipc	ra,0x3
    80003998:	080080e7          	jalr	128(ra) # 80006a14 <_ZN6BufferC1Ei>
    8000399c:	0300006f          	j	800039cc <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800039a0:	00007517          	auipc	a0,0x7
    800039a4:	8d850513          	addi	a0,a0,-1832 # 8000a278 <CONSOLE_STATUS+0x268>
    800039a8:	00002097          	auipc	ra,0x2
    800039ac:	13c080e7          	jalr	316(ra) # 80005ae4 <_Z11printStringPKc>
        return;
    800039b0:	0140006f          	j	800039c4 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800039b4:	00007517          	auipc	a0,0x7
    800039b8:	90450513          	addi	a0,a0,-1788 # 8000a2b8 <CONSOLE_STATUS+0x2a8>
    800039bc:	00002097          	auipc	ra,0x2
    800039c0:	128080e7          	jalr	296(ra) # 80005ae4 <_Z11printStringPKc>
        return;
    800039c4:	000b0113          	mv	sp,s6
    800039c8:	1500006f          	j	80003b18 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    800039cc:	00000593          	li	a1,0
    800039d0:	00009517          	auipc	a0,0x9
    800039d4:	47850513          	addi	a0,a0,1144 # 8000ce48 <_ZL10waitForAll>
    800039d8:	ffffe097          	auipc	ra,0xffffe
    800039dc:	ad4080e7          	jalr	-1324(ra) # 800014ac <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    800039e0:	00391793          	slli	a5,s2,0x3
    800039e4:	00f78793          	addi	a5,a5,15
    800039e8:	ff07f793          	andi	a5,a5,-16
    800039ec:	40f10133          	sub	sp,sp,a5
    800039f0:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800039f4:	0019071b          	addiw	a4,s2,1
    800039f8:	00171793          	slli	a5,a4,0x1
    800039fc:	00e787b3          	add	a5,a5,a4
    80003a00:	00379793          	slli	a5,a5,0x3
    80003a04:	00f78793          	addi	a5,a5,15
    80003a08:	ff07f793          	andi	a5,a5,-16
    80003a0c:	40f10133          	sub	sp,sp,a5
    80003a10:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003a14:	00191613          	slli	a2,s2,0x1
    80003a18:	012607b3          	add	a5,a2,s2
    80003a1c:	00379793          	slli	a5,a5,0x3
    80003a20:	00f987b3          	add	a5,s3,a5
    80003a24:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003a28:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003a2c:	00009717          	auipc	a4,0x9
    80003a30:	41c73703          	ld	a4,1052(a4) # 8000ce48 <_ZL10waitForAll>
    80003a34:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003a38:	00078613          	mv	a2,a5
    80003a3c:	00000597          	auipc	a1,0x0
    80003a40:	d7458593          	addi	a1,a1,-652 # 800037b0 <_ZL8consumerPv>
    80003a44:	f9840513          	addi	a0,s0,-104
    80003a48:	ffffe097          	auipc	ra,0xffffe
    80003a4c:	930080e7          	jalr	-1744(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003a50:	00000493          	li	s1,0
    80003a54:	0280006f          	j	80003a7c <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003a58:	00000597          	auipc	a1,0x0
    80003a5c:	c1458593          	addi	a1,a1,-1004 # 8000366c <_ZL16producerKeyboardPv>
                      data + i);
    80003a60:	00179613          	slli	a2,a5,0x1
    80003a64:	00f60633          	add	a2,a2,a5
    80003a68:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003a6c:	00c98633          	add	a2,s3,a2
    80003a70:	ffffe097          	auipc	ra,0xffffe
    80003a74:	908080e7          	jalr	-1784(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003a78:	0014849b          	addiw	s1,s1,1
    80003a7c:	0524d263          	bge	s1,s2,80003ac0 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003a80:	00149793          	slli	a5,s1,0x1
    80003a84:	009787b3          	add	a5,a5,s1
    80003a88:	00379793          	slli	a5,a5,0x3
    80003a8c:	00f987b3          	add	a5,s3,a5
    80003a90:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003a94:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003a98:	00009717          	auipc	a4,0x9
    80003a9c:	3b073703          	ld	a4,944(a4) # 8000ce48 <_ZL10waitForAll>
    80003aa0:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003aa4:	00048793          	mv	a5,s1
    80003aa8:	00349513          	slli	a0,s1,0x3
    80003aac:	00aa8533          	add	a0,s5,a0
    80003ab0:	fa9054e3          	blez	s1,80003a58 <_Z22producerConsumer_C_APIv+0x1c8>
    80003ab4:	00000597          	auipc	a1,0x0
    80003ab8:	c6858593          	addi	a1,a1,-920 # 8000371c <_ZL8producerPv>
    80003abc:	fa5ff06f          	j	80003a60 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003ac0:	ffffe097          	auipc	ra,0xffffe
    80003ac4:	974080e7          	jalr	-1676(ra) # 80001434 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003ac8:	00000493          	li	s1,0
    80003acc:	00994e63          	blt	s2,s1,80003ae8 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003ad0:	00009517          	auipc	a0,0x9
    80003ad4:	37853503          	ld	a0,888(a0) # 8000ce48 <_ZL10waitForAll>
    80003ad8:	ffffe097          	auipc	ra,0xffffe
    80003adc:	a3c080e7          	jalr	-1476(ra) # 80001514 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003ae0:	0014849b          	addiw	s1,s1,1
    80003ae4:	fe9ff06f          	j	80003acc <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003ae8:	00009517          	auipc	a0,0x9
    80003aec:	36053503          	ld	a0,864(a0) # 8000ce48 <_ZL10waitForAll>
    80003af0:	ffffe097          	auipc	ra,0xffffe
    80003af4:	9f4080e7          	jalr	-1548(ra) # 800014e4 <_Z9sem_closeP4KSem>
    delete buffer;
    80003af8:	000a0e63          	beqz	s4,80003b14 <_Z22producerConsumer_C_APIv+0x284>
    80003afc:	000a0513          	mv	a0,s4
    80003b00:	00003097          	auipc	ra,0x3
    80003b04:	154080e7          	jalr	340(ra) # 80006c54 <_ZN6BufferD1Ev>
    80003b08:	000a0513          	mv	a0,s4
    80003b0c:	fffff097          	auipc	ra,0xfffff
    80003b10:	dd8080e7          	jalr	-552(ra) # 800028e4 <_ZdlPv>
    80003b14:	000b0113          	mv	sp,s6

}
    80003b18:	f9040113          	addi	sp,s0,-112
    80003b1c:	06813083          	ld	ra,104(sp)
    80003b20:	06013403          	ld	s0,96(sp)
    80003b24:	05813483          	ld	s1,88(sp)
    80003b28:	05013903          	ld	s2,80(sp)
    80003b2c:	04813983          	ld	s3,72(sp)
    80003b30:	04013a03          	ld	s4,64(sp)
    80003b34:	03813a83          	ld	s5,56(sp)
    80003b38:	03013b03          	ld	s6,48(sp)
    80003b3c:	07010113          	addi	sp,sp,112
    80003b40:	00008067          	ret
    80003b44:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003b48:	000a0513          	mv	a0,s4
    80003b4c:	fffff097          	auipc	ra,0xfffff
    80003b50:	d98080e7          	jalr	-616(ra) # 800028e4 <_ZdlPv>
    80003b54:	00048513          	mv	a0,s1
    80003b58:	0000a097          	auipc	ra,0xa
    80003b5c:	420080e7          	jalr	1056(ra) # 8000df78 <_Unwind_Resume>

0000000080003b60 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003b60:	fe010113          	addi	sp,sp,-32
    80003b64:	00113c23          	sd	ra,24(sp)
    80003b68:	00813823          	sd	s0,16(sp)
    80003b6c:	00913423          	sd	s1,8(sp)
    80003b70:	01213023          	sd	s2,0(sp)
    80003b74:	02010413          	addi	s0,sp,32
    80003b78:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003b7c:	00100793          	li	a5,1
    80003b80:	02a7f863          	bgeu	a5,a0,80003bb0 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003b84:	00a00793          	li	a5,10
    80003b88:	02f577b3          	remu	a5,a0,a5
    80003b8c:	02078e63          	beqz	a5,80003bc8 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003b90:	fff48513          	addi	a0,s1,-1
    80003b94:	00000097          	auipc	ra,0x0
    80003b98:	fcc080e7          	jalr	-52(ra) # 80003b60 <_ZL9fibonaccim>
    80003b9c:	00050913          	mv	s2,a0
    80003ba0:	ffe48513          	addi	a0,s1,-2
    80003ba4:	00000097          	auipc	ra,0x0
    80003ba8:	fbc080e7          	jalr	-68(ra) # 80003b60 <_ZL9fibonaccim>
    80003bac:	00a90533          	add	a0,s2,a0
}
    80003bb0:	01813083          	ld	ra,24(sp)
    80003bb4:	01013403          	ld	s0,16(sp)
    80003bb8:	00813483          	ld	s1,8(sp)
    80003bbc:	00013903          	ld	s2,0(sp)
    80003bc0:	02010113          	addi	sp,sp,32
    80003bc4:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003bc8:	ffffe097          	auipc	ra,0xffffe
    80003bcc:	86c080e7          	jalr	-1940(ra) # 80001434 <_Z15thread_dispatchv>
    80003bd0:	fc1ff06f          	j	80003b90 <_ZL9fibonaccim+0x30>

0000000080003bd4 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003bd4:	fe010113          	addi	sp,sp,-32
    80003bd8:	00113c23          	sd	ra,24(sp)
    80003bdc:	00813823          	sd	s0,16(sp)
    80003be0:	00913423          	sd	s1,8(sp)
    80003be4:	01213023          	sd	s2,0(sp)
    80003be8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003bec:	00000913          	li	s2,0
    80003bf0:	0380006f          	j	80003c28 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003bf4:	ffffe097          	auipc	ra,0xffffe
    80003bf8:	840080e7          	jalr	-1984(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003bfc:	00148493          	addi	s1,s1,1
    80003c00:	000027b7          	lui	a5,0x2
    80003c04:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003c08:	0097ee63          	bltu	a5,s1,80003c24 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003c0c:	00000713          	li	a4,0
    80003c10:	000077b7          	lui	a5,0x7
    80003c14:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003c18:	fce7eee3          	bltu	a5,a4,80003bf4 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003c1c:	00170713          	addi	a4,a4,1
    80003c20:	ff1ff06f          	j	80003c10 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003c24:	00190913          	addi	s2,s2,1
    80003c28:	00900793          	li	a5,9
    80003c2c:	0527e063          	bltu	a5,s2,80003c6c <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003c30:	00006517          	auipc	a0,0x6
    80003c34:	6b850513          	addi	a0,a0,1720 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    80003c38:	00002097          	auipc	ra,0x2
    80003c3c:	eac080e7          	jalr	-340(ra) # 80005ae4 <_Z11printStringPKc>
    80003c40:	00000613          	li	a2,0
    80003c44:	00a00593          	li	a1,10
    80003c48:	0009051b          	sext.w	a0,s2
    80003c4c:	00002097          	auipc	ra,0x2
    80003c50:	048080e7          	jalr	72(ra) # 80005c94 <_Z8printIntiii>
    80003c54:	00007517          	auipc	a0,0x7
    80003c58:	8f450513          	addi	a0,a0,-1804 # 8000a548 <CONSOLE_STATUS+0x538>
    80003c5c:	00002097          	auipc	ra,0x2
    80003c60:	e88080e7          	jalr	-376(ra) # 80005ae4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003c64:	00000493          	li	s1,0
    80003c68:	f99ff06f          	j	80003c00 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003c6c:	00006517          	auipc	a0,0x6
    80003c70:	68450513          	addi	a0,a0,1668 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    80003c74:	00002097          	auipc	ra,0x2
    80003c78:	e70080e7          	jalr	-400(ra) # 80005ae4 <_Z11printStringPKc>
    finishedA = true;
    80003c7c:	00100793          	li	a5,1
    80003c80:	00009717          	auipc	a4,0x9
    80003c84:	1cf70823          	sb	a5,464(a4) # 8000ce50 <_ZL9finishedA>
}
    80003c88:	01813083          	ld	ra,24(sp)
    80003c8c:	01013403          	ld	s0,16(sp)
    80003c90:	00813483          	ld	s1,8(sp)
    80003c94:	00013903          	ld	s2,0(sp)
    80003c98:	02010113          	addi	sp,sp,32
    80003c9c:	00008067          	ret

0000000080003ca0 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003ca0:	fe010113          	addi	sp,sp,-32
    80003ca4:	00113c23          	sd	ra,24(sp)
    80003ca8:	00813823          	sd	s0,16(sp)
    80003cac:	00913423          	sd	s1,8(sp)
    80003cb0:	01213023          	sd	s2,0(sp)
    80003cb4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003cb8:	00000913          	li	s2,0
    80003cbc:	0380006f          	j	80003cf4 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003cc0:	ffffd097          	auipc	ra,0xffffd
    80003cc4:	774080e7          	jalr	1908(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003cc8:	00148493          	addi	s1,s1,1
    80003ccc:	000027b7          	lui	a5,0x2
    80003cd0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003cd4:	0097ee63          	bltu	a5,s1,80003cf0 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003cd8:	00000713          	li	a4,0
    80003cdc:	000077b7          	lui	a5,0x7
    80003ce0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003ce4:	fce7eee3          	bltu	a5,a4,80003cc0 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003ce8:	00170713          	addi	a4,a4,1
    80003cec:	ff1ff06f          	j	80003cdc <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003cf0:	00190913          	addi	s2,s2,1
    80003cf4:	00f00793          	li	a5,15
    80003cf8:	0527e063          	bltu	a5,s2,80003d38 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003cfc:	00006517          	auipc	a0,0x6
    80003d00:	60450513          	addi	a0,a0,1540 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80003d04:	00002097          	auipc	ra,0x2
    80003d08:	de0080e7          	jalr	-544(ra) # 80005ae4 <_Z11printStringPKc>
    80003d0c:	00000613          	li	a2,0
    80003d10:	00a00593          	li	a1,10
    80003d14:	0009051b          	sext.w	a0,s2
    80003d18:	00002097          	auipc	ra,0x2
    80003d1c:	f7c080e7          	jalr	-132(ra) # 80005c94 <_Z8printIntiii>
    80003d20:	00007517          	auipc	a0,0x7
    80003d24:	82850513          	addi	a0,a0,-2008 # 8000a548 <CONSOLE_STATUS+0x538>
    80003d28:	00002097          	auipc	ra,0x2
    80003d2c:	dbc080e7          	jalr	-580(ra) # 80005ae4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003d30:	00000493          	li	s1,0
    80003d34:	f99ff06f          	j	80003ccc <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003d38:	00006517          	auipc	a0,0x6
    80003d3c:	5d050513          	addi	a0,a0,1488 # 8000a308 <CONSOLE_STATUS+0x2f8>
    80003d40:	00002097          	auipc	ra,0x2
    80003d44:	da4080e7          	jalr	-604(ra) # 80005ae4 <_Z11printStringPKc>
    finishedB = true;
    80003d48:	00100793          	li	a5,1
    80003d4c:	00009717          	auipc	a4,0x9
    80003d50:	10f702a3          	sb	a5,261(a4) # 8000ce51 <_ZL9finishedB>
    thread_dispatch();
    80003d54:	ffffd097          	auipc	ra,0xffffd
    80003d58:	6e0080e7          	jalr	1760(ra) # 80001434 <_Z15thread_dispatchv>
}
    80003d5c:	01813083          	ld	ra,24(sp)
    80003d60:	01013403          	ld	s0,16(sp)
    80003d64:	00813483          	ld	s1,8(sp)
    80003d68:	00013903          	ld	s2,0(sp)
    80003d6c:	02010113          	addi	sp,sp,32
    80003d70:	00008067          	ret

0000000080003d74 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003d74:	fe010113          	addi	sp,sp,-32
    80003d78:	00113c23          	sd	ra,24(sp)
    80003d7c:	00813823          	sd	s0,16(sp)
    80003d80:	00913423          	sd	s1,8(sp)
    80003d84:	01213023          	sd	s2,0(sp)
    80003d88:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003d8c:	00000493          	li	s1,0
    80003d90:	0400006f          	j	80003dd0 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003d94:	00006517          	auipc	a0,0x6
    80003d98:	58450513          	addi	a0,a0,1412 # 8000a318 <CONSOLE_STATUS+0x308>
    80003d9c:	00002097          	auipc	ra,0x2
    80003da0:	d48080e7          	jalr	-696(ra) # 80005ae4 <_Z11printStringPKc>
    80003da4:	00000613          	li	a2,0
    80003da8:	00a00593          	li	a1,10
    80003dac:	00048513          	mv	a0,s1
    80003db0:	00002097          	auipc	ra,0x2
    80003db4:	ee4080e7          	jalr	-284(ra) # 80005c94 <_Z8printIntiii>
    80003db8:	00006517          	auipc	a0,0x6
    80003dbc:	79050513          	addi	a0,a0,1936 # 8000a548 <CONSOLE_STATUS+0x538>
    80003dc0:	00002097          	auipc	ra,0x2
    80003dc4:	d24080e7          	jalr	-732(ra) # 80005ae4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003dc8:	0014849b          	addiw	s1,s1,1
    80003dcc:	0ff4f493          	andi	s1,s1,255
    80003dd0:	00200793          	li	a5,2
    80003dd4:	fc97f0e3          	bgeu	a5,s1,80003d94 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003dd8:	00006517          	auipc	a0,0x6
    80003ddc:	54850513          	addi	a0,a0,1352 # 8000a320 <CONSOLE_STATUS+0x310>
    80003de0:	00002097          	auipc	ra,0x2
    80003de4:	d04080e7          	jalr	-764(ra) # 80005ae4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003de8:	00700313          	li	t1,7
    thread_dispatch();
    80003dec:	ffffd097          	auipc	ra,0xffffd
    80003df0:	648080e7          	jalr	1608(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003df4:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003df8:	00006517          	auipc	a0,0x6
    80003dfc:	53850513          	addi	a0,a0,1336 # 8000a330 <CONSOLE_STATUS+0x320>
    80003e00:	00002097          	auipc	ra,0x2
    80003e04:	ce4080e7          	jalr	-796(ra) # 80005ae4 <_Z11printStringPKc>
    80003e08:	00000613          	li	a2,0
    80003e0c:	00a00593          	li	a1,10
    80003e10:	0009051b          	sext.w	a0,s2
    80003e14:	00002097          	auipc	ra,0x2
    80003e18:	e80080e7          	jalr	-384(ra) # 80005c94 <_Z8printIntiii>
    80003e1c:	00006517          	auipc	a0,0x6
    80003e20:	72c50513          	addi	a0,a0,1836 # 8000a548 <CONSOLE_STATUS+0x538>
    80003e24:	00002097          	auipc	ra,0x2
    80003e28:	cc0080e7          	jalr	-832(ra) # 80005ae4 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003e2c:	00c00513          	li	a0,12
    80003e30:	00000097          	auipc	ra,0x0
    80003e34:	d30080e7          	jalr	-720(ra) # 80003b60 <_ZL9fibonaccim>
    80003e38:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003e3c:	00006517          	auipc	a0,0x6
    80003e40:	4fc50513          	addi	a0,a0,1276 # 8000a338 <CONSOLE_STATUS+0x328>
    80003e44:	00002097          	auipc	ra,0x2
    80003e48:	ca0080e7          	jalr	-864(ra) # 80005ae4 <_Z11printStringPKc>
    80003e4c:	00000613          	li	a2,0
    80003e50:	00a00593          	li	a1,10
    80003e54:	0009051b          	sext.w	a0,s2
    80003e58:	00002097          	auipc	ra,0x2
    80003e5c:	e3c080e7          	jalr	-452(ra) # 80005c94 <_Z8printIntiii>
    80003e60:	00006517          	auipc	a0,0x6
    80003e64:	6e850513          	addi	a0,a0,1768 # 8000a548 <CONSOLE_STATUS+0x538>
    80003e68:	00002097          	auipc	ra,0x2
    80003e6c:	c7c080e7          	jalr	-900(ra) # 80005ae4 <_Z11printStringPKc>
    80003e70:	0400006f          	j	80003eb0 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003e74:	00006517          	auipc	a0,0x6
    80003e78:	4a450513          	addi	a0,a0,1188 # 8000a318 <CONSOLE_STATUS+0x308>
    80003e7c:	00002097          	auipc	ra,0x2
    80003e80:	c68080e7          	jalr	-920(ra) # 80005ae4 <_Z11printStringPKc>
    80003e84:	00000613          	li	a2,0
    80003e88:	00a00593          	li	a1,10
    80003e8c:	00048513          	mv	a0,s1
    80003e90:	00002097          	auipc	ra,0x2
    80003e94:	e04080e7          	jalr	-508(ra) # 80005c94 <_Z8printIntiii>
    80003e98:	00006517          	auipc	a0,0x6
    80003e9c:	6b050513          	addi	a0,a0,1712 # 8000a548 <CONSOLE_STATUS+0x538>
    80003ea0:	00002097          	auipc	ra,0x2
    80003ea4:	c44080e7          	jalr	-956(ra) # 80005ae4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003ea8:	0014849b          	addiw	s1,s1,1
    80003eac:	0ff4f493          	andi	s1,s1,255
    80003eb0:	00500793          	li	a5,5
    80003eb4:	fc97f0e3          	bgeu	a5,s1,80003e74 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80003eb8:	00006517          	auipc	a0,0x6
    80003ebc:	49050513          	addi	a0,a0,1168 # 8000a348 <CONSOLE_STATUS+0x338>
    80003ec0:	00002097          	auipc	ra,0x2
    80003ec4:	c24080e7          	jalr	-988(ra) # 80005ae4 <_Z11printStringPKc>
    finishedC = true;
    80003ec8:	00100793          	li	a5,1
    80003ecc:	00009717          	auipc	a4,0x9
    80003ed0:	f8f70323          	sb	a5,-122(a4) # 8000ce52 <_ZL9finishedC>
    thread_dispatch();
    80003ed4:	ffffd097          	auipc	ra,0xffffd
    80003ed8:	560080e7          	jalr	1376(ra) # 80001434 <_Z15thread_dispatchv>
}
    80003edc:	01813083          	ld	ra,24(sp)
    80003ee0:	01013403          	ld	s0,16(sp)
    80003ee4:	00813483          	ld	s1,8(sp)
    80003ee8:	00013903          	ld	s2,0(sp)
    80003eec:	02010113          	addi	sp,sp,32
    80003ef0:	00008067          	ret

0000000080003ef4 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003ef4:	fe010113          	addi	sp,sp,-32
    80003ef8:	00113c23          	sd	ra,24(sp)
    80003efc:	00813823          	sd	s0,16(sp)
    80003f00:	00913423          	sd	s1,8(sp)
    80003f04:	01213023          	sd	s2,0(sp)
    80003f08:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003f0c:	00a00493          	li	s1,10
    80003f10:	0400006f          	j	80003f50 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003f14:	00006517          	auipc	a0,0x6
    80003f18:	44450513          	addi	a0,a0,1092 # 8000a358 <CONSOLE_STATUS+0x348>
    80003f1c:	00002097          	auipc	ra,0x2
    80003f20:	bc8080e7          	jalr	-1080(ra) # 80005ae4 <_Z11printStringPKc>
    80003f24:	00000613          	li	a2,0
    80003f28:	00a00593          	li	a1,10
    80003f2c:	00048513          	mv	a0,s1
    80003f30:	00002097          	auipc	ra,0x2
    80003f34:	d64080e7          	jalr	-668(ra) # 80005c94 <_Z8printIntiii>
    80003f38:	00006517          	auipc	a0,0x6
    80003f3c:	61050513          	addi	a0,a0,1552 # 8000a548 <CONSOLE_STATUS+0x538>
    80003f40:	00002097          	auipc	ra,0x2
    80003f44:	ba4080e7          	jalr	-1116(ra) # 80005ae4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003f48:	0014849b          	addiw	s1,s1,1
    80003f4c:	0ff4f493          	andi	s1,s1,255
    80003f50:	00c00793          	li	a5,12
    80003f54:	fc97f0e3          	bgeu	a5,s1,80003f14 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003f58:	00006517          	auipc	a0,0x6
    80003f5c:	40850513          	addi	a0,a0,1032 # 8000a360 <CONSOLE_STATUS+0x350>
    80003f60:	00002097          	auipc	ra,0x2
    80003f64:	b84080e7          	jalr	-1148(ra) # 80005ae4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003f68:	00500313          	li	t1,5
    thread_dispatch();
    80003f6c:	ffffd097          	auipc	ra,0xffffd
    80003f70:	4c8080e7          	jalr	1224(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003f74:	01000513          	li	a0,16
    80003f78:	00000097          	auipc	ra,0x0
    80003f7c:	be8080e7          	jalr	-1048(ra) # 80003b60 <_ZL9fibonaccim>
    80003f80:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003f84:	00006517          	auipc	a0,0x6
    80003f88:	3ec50513          	addi	a0,a0,1004 # 8000a370 <CONSOLE_STATUS+0x360>
    80003f8c:	00002097          	auipc	ra,0x2
    80003f90:	b58080e7          	jalr	-1192(ra) # 80005ae4 <_Z11printStringPKc>
    80003f94:	00000613          	li	a2,0
    80003f98:	00a00593          	li	a1,10
    80003f9c:	0009051b          	sext.w	a0,s2
    80003fa0:	00002097          	auipc	ra,0x2
    80003fa4:	cf4080e7          	jalr	-780(ra) # 80005c94 <_Z8printIntiii>
    80003fa8:	00006517          	auipc	a0,0x6
    80003fac:	5a050513          	addi	a0,a0,1440 # 8000a548 <CONSOLE_STATUS+0x538>
    80003fb0:	00002097          	auipc	ra,0x2
    80003fb4:	b34080e7          	jalr	-1228(ra) # 80005ae4 <_Z11printStringPKc>
    80003fb8:	0400006f          	j	80003ff8 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003fbc:	00006517          	auipc	a0,0x6
    80003fc0:	39c50513          	addi	a0,a0,924 # 8000a358 <CONSOLE_STATUS+0x348>
    80003fc4:	00002097          	auipc	ra,0x2
    80003fc8:	b20080e7          	jalr	-1248(ra) # 80005ae4 <_Z11printStringPKc>
    80003fcc:	00000613          	li	a2,0
    80003fd0:	00a00593          	li	a1,10
    80003fd4:	00048513          	mv	a0,s1
    80003fd8:	00002097          	auipc	ra,0x2
    80003fdc:	cbc080e7          	jalr	-836(ra) # 80005c94 <_Z8printIntiii>
    80003fe0:	00006517          	auipc	a0,0x6
    80003fe4:	56850513          	addi	a0,a0,1384 # 8000a548 <CONSOLE_STATUS+0x538>
    80003fe8:	00002097          	auipc	ra,0x2
    80003fec:	afc080e7          	jalr	-1284(ra) # 80005ae4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003ff0:	0014849b          	addiw	s1,s1,1
    80003ff4:	0ff4f493          	andi	s1,s1,255
    80003ff8:	00f00793          	li	a5,15
    80003ffc:	fc97f0e3          	bgeu	a5,s1,80003fbc <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004000:	00006517          	auipc	a0,0x6
    80004004:	38050513          	addi	a0,a0,896 # 8000a380 <CONSOLE_STATUS+0x370>
    80004008:	00002097          	auipc	ra,0x2
    8000400c:	adc080e7          	jalr	-1316(ra) # 80005ae4 <_Z11printStringPKc>
    finishedD = true;
    80004010:	00100793          	li	a5,1
    80004014:	00009717          	auipc	a4,0x9
    80004018:	e2f70fa3          	sb	a5,-449(a4) # 8000ce53 <_ZL9finishedD>
    thread_dispatch();
    8000401c:	ffffd097          	auipc	ra,0xffffd
    80004020:	418080e7          	jalr	1048(ra) # 80001434 <_Z15thread_dispatchv>
}
    80004024:	01813083          	ld	ra,24(sp)
    80004028:	01013403          	ld	s0,16(sp)
    8000402c:	00813483          	ld	s1,8(sp)
    80004030:	00013903          	ld	s2,0(sp)
    80004034:	02010113          	addi	sp,sp,32
    80004038:	00008067          	ret

000000008000403c <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    8000403c:	fc010113          	addi	sp,sp,-64
    80004040:	02113c23          	sd	ra,56(sp)
    80004044:	02813823          	sd	s0,48(sp)
    80004048:	02913423          	sd	s1,40(sp)
    8000404c:	03213023          	sd	s2,32(sp)
    80004050:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80004054:	02000513          	li	a0,32
    80004058:	fffff097          	auipc	ra,0xfffff
    8000405c:	83c080e7          	jalr	-1988(ra) # 80002894 <_Znwm>
    80004060:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004064:	fffff097          	auipc	ra,0xfffff
    80004068:	b08080e7          	jalr	-1272(ra) # 80002b6c <_ZN6ThreadC1Ev>
    8000406c:	00009797          	auipc	a5,0x9
    80004070:	9f478793          	addi	a5,a5,-1548 # 8000ca60 <_ZTV7WorkerA+0x10>
    80004074:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004078:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    8000407c:	00006517          	auipc	a0,0x6
    80004080:	31450513          	addi	a0,a0,788 # 8000a390 <CONSOLE_STATUS+0x380>
    80004084:	00002097          	auipc	ra,0x2
    80004088:	a60080e7          	jalr	-1440(ra) # 80005ae4 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    8000408c:	02000513          	li	a0,32
    80004090:	fffff097          	auipc	ra,0xfffff
    80004094:	804080e7          	jalr	-2044(ra) # 80002894 <_Znwm>
    80004098:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    8000409c:	fffff097          	auipc	ra,0xfffff
    800040a0:	ad0080e7          	jalr	-1328(ra) # 80002b6c <_ZN6ThreadC1Ev>
    800040a4:	00009797          	auipc	a5,0x9
    800040a8:	9e478793          	addi	a5,a5,-1564 # 8000ca88 <_ZTV7WorkerB+0x10>
    800040ac:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    800040b0:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800040b4:	00006517          	auipc	a0,0x6
    800040b8:	2f450513          	addi	a0,a0,756 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800040bc:	00002097          	auipc	ra,0x2
    800040c0:	a28080e7          	jalr	-1496(ra) # 80005ae4 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800040c4:	02000513          	li	a0,32
    800040c8:	ffffe097          	auipc	ra,0xffffe
    800040cc:	7cc080e7          	jalr	1996(ra) # 80002894 <_Znwm>
    800040d0:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800040d4:	fffff097          	auipc	ra,0xfffff
    800040d8:	a98080e7          	jalr	-1384(ra) # 80002b6c <_ZN6ThreadC1Ev>
    800040dc:	00009797          	auipc	a5,0x9
    800040e0:	9d478793          	addi	a5,a5,-1580 # 8000cab0 <_ZTV7WorkerC+0x10>
    800040e4:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800040e8:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800040ec:	00006517          	auipc	a0,0x6
    800040f0:	2d450513          	addi	a0,a0,724 # 8000a3c0 <CONSOLE_STATUS+0x3b0>
    800040f4:	00002097          	auipc	ra,0x2
    800040f8:	9f0080e7          	jalr	-1552(ra) # 80005ae4 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800040fc:	02000513          	li	a0,32
    80004100:	ffffe097          	auipc	ra,0xffffe
    80004104:	794080e7          	jalr	1940(ra) # 80002894 <_Znwm>
    80004108:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    8000410c:	fffff097          	auipc	ra,0xfffff
    80004110:	a60080e7          	jalr	-1440(ra) # 80002b6c <_ZN6ThreadC1Ev>
    80004114:	00009797          	auipc	a5,0x9
    80004118:	9c478793          	addi	a5,a5,-1596 # 8000cad8 <_ZTV7WorkerD+0x10>
    8000411c:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004120:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004124:	00006517          	auipc	a0,0x6
    80004128:	2b450513          	addi	a0,a0,692 # 8000a3d8 <CONSOLE_STATUS+0x3c8>
    8000412c:	00002097          	auipc	ra,0x2
    80004130:	9b8080e7          	jalr	-1608(ra) # 80005ae4 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004134:	00000493          	li	s1,0
    80004138:	00300793          	li	a5,3
    8000413c:	0297c663          	blt	a5,s1,80004168 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004140:	00349793          	slli	a5,s1,0x3
    80004144:	fe040713          	addi	a4,s0,-32
    80004148:	00f707b3          	add	a5,a4,a5
    8000414c:	fe07b503          	ld	a0,-32(a5)
    80004150:	fffff097          	auipc	ra,0xfffff
    80004154:	8fc080e7          	jalr	-1796(ra) # 80002a4c <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80004158:	0014849b          	addiw	s1,s1,1
    8000415c:	fddff06f          	j	80004138 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004160:	fffff097          	auipc	ra,0xfffff
    80004164:	950080e7          	jalr	-1712(ra) # 80002ab0 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004168:	00009797          	auipc	a5,0x9
    8000416c:	ce87c783          	lbu	a5,-792(a5) # 8000ce50 <_ZL9finishedA>
    80004170:	fe0788e3          	beqz	a5,80004160 <_Z20Threads_CPP_API_testv+0x124>
    80004174:	00009797          	auipc	a5,0x9
    80004178:	cdd7c783          	lbu	a5,-803(a5) # 8000ce51 <_ZL9finishedB>
    8000417c:	fe0782e3          	beqz	a5,80004160 <_Z20Threads_CPP_API_testv+0x124>
    80004180:	00009797          	auipc	a5,0x9
    80004184:	cd27c783          	lbu	a5,-814(a5) # 8000ce52 <_ZL9finishedC>
    80004188:	fc078ce3          	beqz	a5,80004160 <_Z20Threads_CPP_API_testv+0x124>
    8000418c:	00009797          	auipc	a5,0x9
    80004190:	cc77c783          	lbu	a5,-825(a5) # 8000ce53 <_ZL9finishedD>
    80004194:	fc0786e3          	beqz	a5,80004160 <_Z20Threads_CPP_API_testv+0x124>
    80004198:	fc040493          	addi	s1,s0,-64
    8000419c:	0080006f          	j	800041a4 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    800041a0:	00848493          	addi	s1,s1,8
    800041a4:	fe040793          	addi	a5,s0,-32
    800041a8:	08f48663          	beq	s1,a5,80004234 <_Z20Threads_CPP_API_testv+0x1f8>
    800041ac:	0004b503          	ld	a0,0(s1)
		delete thread;
    800041b0:	fe0508e3          	beqz	a0,800041a0 <_Z20Threads_CPP_API_testv+0x164>
    800041b4:	00053783          	ld	a5,0(a0)
    800041b8:	0087b783          	ld	a5,8(a5)
    800041bc:	000780e7          	jalr	a5
    800041c0:	fe1ff06f          	j	800041a0 <_Z20Threads_CPP_API_testv+0x164>
    800041c4:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800041c8:	00048513          	mv	a0,s1
    800041cc:	ffffe097          	auipc	ra,0xffffe
    800041d0:	718080e7          	jalr	1816(ra) # 800028e4 <_ZdlPv>
    800041d4:	00090513          	mv	a0,s2
    800041d8:	0000a097          	auipc	ra,0xa
    800041dc:	da0080e7          	jalr	-608(ra) # 8000df78 <_Unwind_Resume>
    800041e0:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800041e4:	00048513          	mv	a0,s1
    800041e8:	ffffe097          	auipc	ra,0xffffe
    800041ec:	6fc080e7          	jalr	1788(ra) # 800028e4 <_ZdlPv>
    800041f0:	00090513          	mv	a0,s2
    800041f4:	0000a097          	auipc	ra,0xa
    800041f8:	d84080e7          	jalr	-636(ra) # 8000df78 <_Unwind_Resume>
    800041fc:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004200:	00048513          	mv	a0,s1
    80004204:	ffffe097          	auipc	ra,0xffffe
    80004208:	6e0080e7          	jalr	1760(ra) # 800028e4 <_ZdlPv>
    8000420c:	00090513          	mv	a0,s2
    80004210:	0000a097          	auipc	ra,0xa
    80004214:	d68080e7          	jalr	-664(ra) # 8000df78 <_Unwind_Resume>
    80004218:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    8000421c:	00048513          	mv	a0,s1
    80004220:	ffffe097          	auipc	ra,0xffffe
    80004224:	6c4080e7          	jalr	1732(ra) # 800028e4 <_ZdlPv>
    80004228:	00090513          	mv	a0,s2
    8000422c:	0000a097          	auipc	ra,0xa
    80004230:	d4c080e7          	jalr	-692(ra) # 8000df78 <_Unwind_Resume>
	}
}
    80004234:	03813083          	ld	ra,56(sp)
    80004238:	03013403          	ld	s0,48(sp)
    8000423c:	02813483          	ld	s1,40(sp)
    80004240:	02013903          	ld	s2,32(sp)
    80004244:	04010113          	addi	sp,sp,64
    80004248:	00008067          	ret

000000008000424c <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    8000424c:	ff010113          	addi	sp,sp,-16
    80004250:	00113423          	sd	ra,8(sp)
    80004254:	00813023          	sd	s0,0(sp)
    80004258:	01010413          	addi	s0,sp,16
    8000425c:	00009797          	auipc	a5,0x9
    80004260:	80478793          	addi	a5,a5,-2044 # 8000ca60 <_ZTV7WorkerA+0x10>
    80004264:	00f53023          	sd	a5,0(a0)
    80004268:	ffffe097          	auipc	ra,0xffffe
    8000426c:	53c080e7          	jalr	1340(ra) # 800027a4 <_ZN6ThreadD1Ev>
    80004270:	00813083          	ld	ra,8(sp)
    80004274:	00013403          	ld	s0,0(sp)
    80004278:	01010113          	addi	sp,sp,16
    8000427c:	00008067          	ret

0000000080004280 <_ZN7WorkerAD0Ev>:
    80004280:	fe010113          	addi	sp,sp,-32
    80004284:	00113c23          	sd	ra,24(sp)
    80004288:	00813823          	sd	s0,16(sp)
    8000428c:	00913423          	sd	s1,8(sp)
    80004290:	02010413          	addi	s0,sp,32
    80004294:	00050493          	mv	s1,a0
    80004298:	00008797          	auipc	a5,0x8
    8000429c:	7c878793          	addi	a5,a5,1992 # 8000ca60 <_ZTV7WorkerA+0x10>
    800042a0:	00f53023          	sd	a5,0(a0)
    800042a4:	ffffe097          	auipc	ra,0xffffe
    800042a8:	500080e7          	jalr	1280(ra) # 800027a4 <_ZN6ThreadD1Ev>
    800042ac:	00048513          	mv	a0,s1
    800042b0:	ffffe097          	auipc	ra,0xffffe
    800042b4:	634080e7          	jalr	1588(ra) # 800028e4 <_ZdlPv>
    800042b8:	01813083          	ld	ra,24(sp)
    800042bc:	01013403          	ld	s0,16(sp)
    800042c0:	00813483          	ld	s1,8(sp)
    800042c4:	02010113          	addi	sp,sp,32
    800042c8:	00008067          	ret

00000000800042cc <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800042cc:	ff010113          	addi	sp,sp,-16
    800042d0:	00113423          	sd	ra,8(sp)
    800042d4:	00813023          	sd	s0,0(sp)
    800042d8:	01010413          	addi	s0,sp,16
    800042dc:	00008797          	auipc	a5,0x8
    800042e0:	7ac78793          	addi	a5,a5,1964 # 8000ca88 <_ZTV7WorkerB+0x10>
    800042e4:	00f53023          	sd	a5,0(a0)
    800042e8:	ffffe097          	auipc	ra,0xffffe
    800042ec:	4bc080e7          	jalr	1212(ra) # 800027a4 <_ZN6ThreadD1Ev>
    800042f0:	00813083          	ld	ra,8(sp)
    800042f4:	00013403          	ld	s0,0(sp)
    800042f8:	01010113          	addi	sp,sp,16
    800042fc:	00008067          	ret

0000000080004300 <_ZN7WorkerBD0Ev>:
    80004300:	fe010113          	addi	sp,sp,-32
    80004304:	00113c23          	sd	ra,24(sp)
    80004308:	00813823          	sd	s0,16(sp)
    8000430c:	00913423          	sd	s1,8(sp)
    80004310:	02010413          	addi	s0,sp,32
    80004314:	00050493          	mv	s1,a0
    80004318:	00008797          	auipc	a5,0x8
    8000431c:	77078793          	addi	a5,a5,1904 # 8000ca88 <_ZTV7WorkerB+0x10>
    80004320:	00f53023          	sd	a5,0(a0)
    80004324:	ffffe097          	auipc	ra,0xffffe
    80004328:	480080e7          	jalr	1152(ra) # 800027a4 <_ZN6ThreadD1Ev>
    8000432c:	00048513          	mv	a0,s1
    80004330:	ffffe097          	auipc	ra,0xffffe
    80004334:	5b4080e7          	jalr	1460(ra) # 800028e4 <_ZdlPv>
    80004338:	01813083          	ld	ra,24(sp)
    8000433c:	01013403          	ld	s0,16(sp)
    80004340:	00813483          	ld	s1,8(sp)
    80004344:	02010113          	addi	sp,sp,32
    80004348:	00008067          	ret

000000008000434c <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    8000434c:	ff010113          	addi	sp,sp,-16
    80004350:	00113423          	sd	ra,8(sp)
    80004354:	00813023          	sd	s0,0(sp)
    80004358:	01010413          	addi	s0,sp,16
    8000435c:	00008797          	auipc	a5,0x8
    80004360:	75478793          	addi	a5,a5,1876 # 8000cab0 <_ZTV7WorkerC+0x10>
    80004364:	00f53023          	sd	a5,0(a0)
    80004368:	ffffe097          	auipc	ra,0xffffe
    8000436c:	43c080e7          	jalr	1084(ra) # 800027a4 <_ZN6ThreadD1Ev>
    80004370:	00813083          	ld	ra,8(sp)
    80004374:	00013403          	ld	s0,0(sp)
    80004378:	01010113          	addi	sp,sp,16
    8000437c:	00008067          	ret

0000000080004380 <_ZN7WorkerCD0Ev>:
    80004380:	fe010113          	addi	sp,sp,-32
    80004384:	00113c23          	sd	ra,24(sp)
    80004388:	00813823          	sd	s0,16(sp)
    8000438c:	00913423          	sd	s1,8(sp)
    80004390:	02010413          	addi	s0,sp,32
    80004394:	00050493          	mv	s1,a0
    80004398:	00008797          	auipc	a5,0x8
    8000439c:	71878793          	addi	a5,a5,1816 # 8000cab0 <_ZTV7WorkerC+0x10>
    800043a0:	00f53023          	sd	a5,0(a0)
    800043a4:	ffffe097          	auipc	ra,0xffffe
    800043a8:	400080e7          	jalr	1024(ra) # 800027a4 <_ZN6ThreadD1Ev>
    800043ac:	00048513          	mv	a0,s1
    800043b0:	ffffe097          	auipc	ra,0xffffe
    800043b4:	534080e7          	jalr	1332(ra) # 800028e4 <_ZdlPv>
    800043b8:	01813083          	ld	ra,24(sp)
    800043bc:	01013403          	ld	s0,16(sp)
    800043c0:	00813483          	ld	s1,8(sp)
    800043c4:	02010113          	addi	sp,sp,32
    800043c8:	00008067          	ret

00000000800043cc <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800043cc:	ff010113          	addi	sp,sp,-16
    800043d0:	00113423          	sd	ra,8(sp)
    800043d4:	00813023          	sd	s0,0(sp)
    800043d8:	01010413          	addi	s0,sp,16
    800043dc:	00008797          	auipc	a5,0x8
    800043e0:	6fc78793          	addi	a5,a5,1788 # 8000cad8 <_ZTV7WorkerD+0x10>
    800043e4:	00f53023          	sd	a5,0(a0)
    800043e8:	ffffe097          	auipc	ra,0xffffe
    800043ec:	3bc080e7          	jalr	956(ra) # 800027a4 <_ZN6ThreadD1Ev>
    800043f0:	00813083          	ld	ra,8(sp)
    800043f4:	00013403          	ld	s0,0(sp)
    800043f8:	01010113          	addi	sp,sp,16
    800043fc:	00008067          	ret

0000000080004400 <_ZN7WorkerDD0Ev>:
    80004400:	fe010113          	addi	sp,sp,-32
    80004404:	00113c23          	sd	ra,24(sp)
    80004408:	00813823          	sd	s0,16(sp)
    8000440c:	00913423          	sd	s1,8(sp)
    80004410:	02010413          	addi	s0,sp,32
    80004414:	00050493          	mv	s1,a0
    80004418:	00008797          	auipc	a5,0x8
    8000441c:	6c078793          	addi	a5,a5,1728 # 8000cad8 <_ZTV7WorkerD+0x10>
    80004420:	00f53023          	sd	a5,0(a0)
    80004424:	ffffe097          	auipc	ra,0xffffe
    80004428:	380080e7          	jalr	896(ra) # 800027a4 <_ZN6ThreadD1Ev>
    8000442c:	00048513          	mv	a0,s1
    80004430:	ffffe097          	auipc	ra,0xffffe
    80004434:	4b4080e7          	jalr	1204(ra) # 800028e4 <_ZdlPv>
    80004438:	01813083          	ld	ra,24(sp)
    8000443c:	01013403          	ld	s0,16(sp)
    80004440:	00813483          	ld	s1,8(sp)
    80004444:	02010113          	addi	sp,sp,32
    80004448:	00008067          	ret

000000008000444c <_ZN7WorkerA3runEv>:
    void run() override {
    8000444c:	ff010113          	addi	sp,sp,-16
    80004450:	00113423          	sd	ra,8(sp)
    80004454:	00813023          	sd	s0,0(sp)
    80004458:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    8000445c:	00000593          	li	a1,0
    80004460:	fffff097          	auipc	ra,0xfffff
    80004464:	774080e7          	jalr	1908(ra) # 80003bd4 <_ZN7WorkerA11workerBodyAEPv>
    }
    80004468:	00813083          	ld	ra,8(sp)
    8000446c:	00013403          	ld	s0,0(sp)
    80004470:	01010113          	addi	sp,sp,16
    80004474:	00008067          	ret

0000000080004478 <_ZN7WorkerB3runEv>:
    void run() override {
    80004478:	ff010113          	addi	sp,sp,-16
    8000447c:	00113423          	sd	ra,8(sp)
    80004480:	00813023          	sd	s0,0(sp)
    80004484:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004488:	00000593          	li	a1,0
    8000448c:	00000097          	auipc	ra,0x0
    80004490:	814080e7          	jalr	-2028(ra) # 80003ca0 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004494:	00813083          	ld	ra,8(sp)
    80004498:	00013403          	ld	s0,0(sp)
    8000449c:	01010113          	addi	sp,sp,16
    800044a0:	00008067          	ret

00000000800044a4 <_ZN7WorkerC3runEv>:
    void run() override {
    800044a4:	ff010113          	addi	sp,sp,-16
    800044a8:	00113423          	sd	ra,8(sp)
    800044ac:	00813023          	sd	s0,0(sp)
    800044b0:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800044b4:	00000593          	li	a1,0
    800044b8:	00000097          	auipc	ra,0x0
    800044bc:	8bc080e7          	jalr	-1860(ra) # 80003d74 <_ZN7WorkerC11workerBodyCEPv>
    }
    800044c0:	00813083          	ld	ra,8(sp)
    800044c4:	00013403          	ld	s0,0(sp)
    800044c8:	01010113          	addi	sp,sp,16
    800044cc:	00008067          	ret

00000000800044d0 <_ZN7WorkerD3runEv>:
    void run() override {
    800044d0:	ff010113          	addi	sp,sp,-16
    800044d4:	00113423          	sd	ra,8(sp)
    800044d8:	00813023          	sd	s0,0(sp)
    800044dc:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800044e0:	00000593          	li	a1,0
    800044e4:	00000097          	auipc	ra,0x0
    800044e8:	a10080e7          	jalr	-1520(ra) # 80003ef4 <_ZN7WorkerD11workerBodyDEPv>
    }
    800044ec:	00813083          	ld	ra,8(sp)
    800044f0:	00013403          	ld	s0,0(sp)
    800044f4:	01010113          	addi	sp,sp,16
    800044f8:	00008067          	ret

00000000800044fc <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800044fc:	f8010113          	addi	sp,sp,-128
    80004500:	06113c23          	sd	ra,120(sp)
    80004504:	06813823          	sd	s0,112(sp)
    80004508:	06913423          	sd	s1,104(sp)
    8000450c:	07213023          	sd	s2,96(sp)
    80004510:	05313c23          	sd	s3,88(sp)
    80004514:	05413823          	sd	s4,80(sp)
    80004518:	05513423          	sd	s5,72(sp)
    8000451c:	05613023          	sd	s6,64(sp)
    80004520:	03713c23          	sd	s7,56(sp)
    80004524:	03813823          	sd	s8,48(sp)
    80004528:	03913423          	sd	s9,40(sp)
    8000452c:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004530:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004534:	00006517          	auipc	a0,0x6
    80004538:	ccc50513          	addi	a0,a0,-820 # 8000a200 <CONSOLE_STATUS+0x1f0>
    8000453c:	00001097          	auipc	ra,0x1
    80004540:	5a8080e7          	jalr	1448(ra) # 80005ae4 <_Z11printStringPKc>
    getString(input, 30);
    80004544:	01e00593          	li	a1,30
    80004548:	f8040493          	addi	s1,s0,-128
    8000454c:	00048513          	mv	a0,s1
    80004550:	00001097          	auipc	ra,0x1
    80004554:	61c080e7          	jalr	1564(ra) # 80005b6c <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004558:	00048513          	mv	a0,s1
    8000455c:	00001097          	auipc	ra,0x1
    80004560:	6e8080e7          	jalr	1768(ra) # 80005c44 <_Z11stringToIntPKc>
    80004564:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004568:	00006517          	auipc	a0,0x6
    8000456c:	cb850513          	addi	a0,a0,-840 # 8000a220 <CONSOLE_STATUS+0x210>
    80004570:	00001097          	auipc	ra,0x1
    80004574:	574080e7          	jalr	1396(ra) # 80005ae4 <_Z11printStringPKc>
    getString(input, 30);
    80004578:	01e00593          	li	a1,30
    8000457c:	00048513          	mv	a0,s1
    80004580:	00001097          	auipc	ra,0x1
    80004584:	5ec080e7          	jalr	1516(ra) # 80005b6c <_Z9getStringPci>
    n = stringToInt(input);
    80004588:	00048513          	mv	a0,s1
    8000458c:	00001097          	auipc	ra,0x1
    80004590:	6b8080e7          	jalr	1720(ra) # 80005c44 <_Z11stringToIntPKc>
    80004594:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004598:	00006517          	auipc	a0,0x6
    8000459c:	ca850513          	addi	a0,a0,-856 # 8000a240 <CONSOLE_STATUS+0x230>
    800045a0:	00001097          	auipc	ra,0x1
    800045a4:	544080e7          	jalr	1348(ra) # 80005ae4 <_Z11printStringPKc>
    printInt(threadNum);
    800045a8:	00000613          	li	a2,0
    800045ac:	00a00593          	li	a1,10
    800045b0:	00098513          	mv	a0,s3
    800045b4:	00001097          	auipc	ra,0x1
    800045b8:	6e0080e7          	jalr	1760(ra) # 80005c94 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800045bc:	00006517          	auipc	a0,0x6
    800045c0:	c9c50513          	addi	a0,a0,-868 # 8000a258 <CONSOLE_STATUS+0x248>
    800045c4:	00001097          	auipc	ra,0x1
    800045c8:	520080e7          	jalr	1312(ra) # 80005ae4 <_Z11printStringPKc>
    printInt(n);
    800045cc:	00000613          	li	a2,0
    800045d0:	00a00593          	li	a1,10
    800045d4:	00048513          	mv	a0,s1
    800045d8:	00001097          	auipc	ra,0x1
    800045dc:	6bc080e7          	jalr	1724(ra) # 80005c94 <_Z8printIntiii>
    printString(".\n");
    800045e0:	00006517          	auipc	a0,0x6
    800045e4:	c9050513          	addi	a0,a0,-880 # 8000a270 <CONSOLE_STATUS+0x260>
    800045e8:	00001097          	auipc	ra,0x1
    800045ec:	4fc080e7          	jalr	1276(ra) # 80005ae4 <_Z11printStringPKc>
    if (threadNum > n) {
    800045f0:	0334c463          	blt	s1,s3,80004618 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800045f4:	03305c63          	blez	s3,8000462c <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800045f8:	03800513          	li	a0,56
    800045fc:	ffffe097          	auipc	ra,0xffffe
    80004600:	298080e7          	jalr	664(ra) # 80002894 <_Znwm>
    80004604:	00050a93          	mv	s5,a0
    80004608:	00048593          	mv	a1,s1
    8000460c:	00001097          	auipc	ra,0x1
    80004610:	7a8080e7          	jalr	1960(ra) # 80005db4 <_ZN9BufferCPPC1Ei>
    80004614:	0300006f          	j	80004644 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004618:	00006517          	auipc	a0,0x6
    8000461c:	c6050513          	addi	a0,a0,-928 # 8000a278 <CONSOLE_STATUS+0x268>
    80004620:	00001097          	auipc	ra,0x1
    80004624:	4c4080e7          	jalr	1220(ra) # 80005ae4 <_Z11printStringPKc>
        return;
    80004628:	0140006f          	j	8000463c <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    8000462c:	00006517          	auipc	a0,0x6
    80004630:	c8c50513          	addi	a0,a0,-884 # 8000a2b8 <CONSOLE_STATUS+0x2a8>
    80004634:	00001097          	auipc	ra,0x1
    80004638:	4b0080e7          	jalr	1200(ra) # 80005ae4 <_Z11printStringPKc>
        return;
    8000463c:	000c0113          	mv	sp,s8
    80004640:	2140006f          	j	80004854 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004644:	01000513          	li	a0,16
    80004648:	ffffe097          	auipc	ra,0xffffe
    8000464c:	24c080e7          	jalr	588(ra) # 80002894 <_Znwm>
    80004650:	00050913          	mv	s2,a0
    80004654:	00000593          	li	a1,0
    80004658:	ffffe097          	auipc	ra,0xffffe
    8000465c:	590080e7          	jalr	1424(ra) # 80002be8 <_ZN9SemaphoreC1Ej>
    80004660:	00009797          	auipc	a5,0x9
    80004664:	8127b023          	sd	s2,-2048(a5) # 8000ce60 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004668:	00399793          	slli	a5,s3,0x3
    8000466c:	00f78793          	addi	a5,a5,15
    80004670:	ff07f793          	andi	a5,a5,-16
    80004674:	40f10133          	sub	sp,sp,a5
    80004678:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    8000467c:	0019871b          	addiw	a4,s3,1
    80004680:	00171793          	slli	a5,a4,0x1
    80004684:	00e787b3          	add	a5,a5,a4
    80004688:	00379793          	slli	a5,a5,0x3
    8000468c:	00f78793          	addi	a5,a5,15
    80004690:	ff07f793          	andi	a5,a5,-16
    80004694:	40f10133          	sub	sp,sp,a5
    80004698:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    8000469c:	00199493          	slli	s1,s3,0x1
    800046a0:	013484b3          	add	s1,s1,s3
    800046a4:	00349493          	slli	s1,s1,0x3
    800046a8:	009b04b3          	add	s1,s6,s1
    800046ac:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    800046b0:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    800046b4:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800046b8:	02800513          	li	a0,40
    800046bc:	ffffe097          	auipc	ra,0xffffe
    800046c0:	1d8080e7          	jalr	472(ra) # 80002894 <_Znwm>
    800046c4:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    800046c8:	ffffe097          	auipc	ra,0xffffe
    800046cc:	4a4080e7          	jalr	1188(ra) # 80002b6c <_ZN6ThreadC1Ev>
    800046d0:	00008797          	auipc	a5,0x8
    800046d4:	48078793          	addi	a5,a5,1152 # 8000cb50 <_ZTV8Consumer+0x10>
    800046d8:	00fbb023          	sd	a5,0(s7)
    800046dc:	029bb023          	sd	s1,32(s7)
    consumer->start();
    800046e0:	000b8513          	mv	a0,s7
    800046e4:	ffffe097          	auipc	ra,0xffffe
    800046e8:	368080e7          	jalr	872(ra) # 80002a4c <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800046ec:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800046f0:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800046f4:	00008797          	auipc	a5,0x8
    800046f8:	76c7b783          	ld	a5,1900(a5) # 8000ce60 <_ZL10waitForAll>
    800046fc:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004700:	02800513          	li	a0,40
    80004704:	ffffe097          	auipc	ra,0xffffe
    80004708:	190080e7          	jalr	400(ra) # 80002894 <_Znwm>
    8000470c:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004710:	ffffe097          	auipc	ra,0xffffe
    80004714:	45c080e7          	jalr	1116(ra) # 80002b6c <_ZN6ThreadC1Ev>
    80004718:	00008797          	auipc	a5,0x8
    8000471c:	3e878793          	addi	a5,a5,1000 # 8000cb00 <_ZTV16ProducerKeyborad+0x10>
    80004720:	00f4b023          	sd	a5,0(s1)
    80004724:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004728:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    8000472c:	00048513          	mv	a0,s1
    80004730:	ffffe097          	auipc	ra,0xffffe
    80004734:	31c080e7          	jalr	796(ra) # 80002a4c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004738:	00100913          	li	s2,1
    8000473c:	0300006f          	j	8000476c <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004740:	00008797          	auipc	a5,0x8
    80004744:	3e878793          	addi	a5,a5,1000 # 8000cb28 <_ZTV8Producer+0x10>
    80004748:	00fcb023          	sd	a5,0(s9)
    8000474c:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004750:	00391793          	slli	a5,s2,0x3
    80004754:	00fa07b3          	add	a5,s4,a5
    80004758:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    8000475c:	000c8513          	mv	a0,s9
    80004760:	ffffe097          	auipc	ra,0xffffe
    80004764:	2ec080e7          	jalr	748(ra) # 80002a4c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004768:	0019091b          	addiw	s2,s2,1
    8000476c:	05395263          	bge	s2,s3,800047b0 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004770:	00191493          	slli	s1,s2,0x1
    80004774:	012484b3          	add	s1,s1,s2
    80004778:	00349493          	slli	s1,s1,0x3
    8000477c:	009b04b3          	add	s1,s6,s1
    80004780:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004784:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004788:	00008797          	auipc	a5,0x8
    8000478c:	6d87b783          	ld	a5,1752(a5) # 8000ce60 <_ZL10waitForAll>
    80004790:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004794:	02800513          	li	a0,40
    80004798:	ffffe097          	auipc	ra,0xffffe
    8000479c:	0fc080e7          	jalr	252(ra) # 80002894 <_Znwm>
    800047a0:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800047a4:	ffffe097          	auipc	ra,0xffffe
    800047a8:	3c8080e7          	jalr	968(ra) # 80002b6c <_ZN6ThreadC1Ev>
    800047ac:	f95ff06f          	j	80004740 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    800047b0:	ffffe097          	auipc	ra,0xffffe
    800047b4:	300080e7          	jalr	768(ra) # 80002ab0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800047b8:	00000493          	li	s1,0
    800047bc:	0099ce63          	blt	s3,s1,800047d8 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    800047c0:	00008517          	auipc	a0,0x8
    800047c4:	6a053503          	ld	a0,1696(a0) # 8000ce60 <_ZL10waitForAll>
    800047c8:	ffffe097          	auipc	ra,0xffffe
    800047cc:	458080e7          	jalr	1112(ra) # 80002c20 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800047d0:	0014849b          	addiw	s1,s1,1
    800047d4:	fe9ff06f          	j	800047bc <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    800047d8:	00008517          	auipc	a0,0x8
    800047dc:	68853503          	ld	a0,1672(a0) # 8000ce60 <_ZL10waitForAll>
    800047e0:	00050863          	beqz	a0,800047f0 <_Z20testConsumerProducerv+0x2f4>
    800047e4:	00053783          	ld	a5,0(a0)
    800047e8:	0087b783          	ld	a5,8(a5)
    800047ec:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800047f0:	00000493          	li	s1,0
    800047f4:	0080006f          	j	800047fc <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800047f8:	0014849b          	addiw	s1,s1,1
    800047fc:	0334d263          	bge	s1,s3,80004820 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004800:	00349793          	slli	a5,s1,0x3
    80004804:	00fa07b3          	add	a5,s4,a5
    80004808:	0007b503          	ld	a0,0(a5)
    8000480c:	fe0506e3          	beqz	a0,800047f8 <_Z20testConsumerProducerv+0x2fc>
    80004810:	00053783          	ld	a5,0(a0)
    80004814:	0087b783          	ld	a5,8(a5)
    80004818:	000780e7          	jalr	a5
    8000481c:	fddff06f          	j	800047f8 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004820:	000b8a63          	beqz	s7,80004834 <_Z20testConsumerProducerv+0x338>
    80004824:	000bb783          	ld	a5,0(s7)
    80004828:	0087b783          	ld	a5,8(a5)
    8000482c:	000b8513          	mv	a0,s7
    80004830:	000780e7          	jalr	a5
    delete buffer;
    80004834:	000a8e63          	beqz	s5,80004850 <_Z20testConsumerProducerv+0x354>
    80004838:	000a8513          	mv	a0,s5
    8000483c:	00002097          	auipc	ra,0x2
    80004840:	870080e7          	jalr	-1936(ra) # 800060ac <_ZN9BufferCPPD1Ev>
    80004844:	000a8513          	mv	a0,s5
    80004848:	ffffe097          	auipc	ra,0xffffe
    8000484c:	09c080e7          	jalr	156(ra) # 800028e4 <_ZdlPv>
    80004850:	000c0113          	mv	sp,s8
}
    80004854:	f8040113          	addi	sp,s0,-128
    80004858:	07813083          	ld	ra,120(sp)
    8000485c:	07013403          	ld	s0,112(sp)
    80004860:	06813483          	ld	s1,104(sp)
    80004864:	06013903          	ld	s2,96(sp)
    80004868:	05813983          	ld	s3,88(sp)
    8000486c:	05013a03          	ld	s4,80(sp)
    80004870:	04813a83          	ld	s5,72(sp)
    80004874:	04013b03          	ld	s6,64(sp)
    80004878:	03813b83          	ld	s7,56(sp)
    8000487c:	03013c03          	ld	s8,48(sp)
    80004880:	02813c83          	ld	s9,40(sp)
    80004884:	08010113          	addi	sp,sp,128
    80004888:	00008067          	ret
    8000488c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004890:	000a8513          	mv	a0,s5
    80004894:	ffffe097          	auipc	ra,0xffffe
    80004898:	050080e7          	jalr	80(ra) # 800028e4 <_ZdlPv>
    8000489c:	00048513          	mv	a0,s1
    800048a0:	00009097          	auipc	ra,0x9
    800048a4:	6d8080e7          	jalr	1752(ra) # 8000df78 <_Unwind_Resume>
    800048a8:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    800048ac:	00090513          	mv	a0,s2
    800048b0:	ffffe097          	auipc	ra,0xffffe
    800048b4:	034080e7          	jalr	52(ra) # 800028e4 <_ZdlPv>
    800048b8:	00048513          	mv	a0,s1
    800048bc:	00009097          	auipc	ra,0x9
    800048c0:	6bc080e7          	jalr	1724(ra) # 8000df78 <_Unwind_Resume>
    800048c4:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800048c8:	000b8513          	mv	a0,s7
    800048cc:	ffffe097          	auipc	ra,0xffffe
    800048d0:	018080e7          	jalr	24(ra) # 800028e4 <_ZdlPv>
    800048d4:	00048513          	mv	a0,s1
    800048d8:	00009097          	auipc	ra,0x9
    800048dc:	6a0080e7          	jalr	1696(ra) # 8000df78 <_Unwind_Resume>
    800048e0:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800048e4:	00048513          	mv	a0,s1
    800048e8:	ffffe097          	auipc	ra,0xffffe
    800048ec:	ffc080e7          	jalr	-4(ra) # 800028e4 <_ZdlPv>
    800048f0:	00090513          	mv	a0,s2
    800048f4:	00009097          	auipc	ra,0x9
    800048f8:	684080e7          	jalr	1668(ra) # 8000df78 <_Unwind_Resume>
    800048fc:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004900:	000c8513          	mv	a0,s9
    80004904:	ffffe097          	auipc	ra,0xffffe
    80004908:	fe0080e7          	jalr	-32(ra) # 800028e4 <_ZdlPv>
    8000490c:	00048513          	mv	a0,s1
    80004910:	00009097          	auipc	ra,0x9
    80004914:	668080e7          	jalr	1640(ra) # 8000df78 <_Unwind_Resume>

0000000080004918 <_ZN8Consumer3runEv>:
    void run() override {
    80004918:	fd010113          	addi	sp,sp,-48
    8000491c:	02113423          	sd	ra,40(sp)
    80004920:	02813023          	sd	s0,32(sp)
    80004924:	00913c23          	sd	s1,24(sp)
    80004928:	01213823          	sd	s2,16(sp)
    8000492c:	01313423          	sd	s3,8(sp)
    80004930:	03010413          	addi	s0,sp,48
    80004934:	00050913          	mv	s2,a0
        int i = 0;
    80004938:	00000993          	li	s3,0
    8000493c:	0100006f          	j	8000494c <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004940:	00a00513          	li	a0,10
    80004944:	ffffe097          	auipc	ra,0xffffe
    80004948:	3cc080e7          	jalr	972(ra) # 80002d10 <_ZN7Console4putcEc>
        while (!threadEnd) {
    8000494c:	00008797          	auipc	a5,0x8
    80004950:	50c7a783          	lw	a5,1292(a5) # 8000ce58 <_ZL9threadEnd>
    80004954:	04079a63          	bnez	a5,800049a8 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004958:	02093783          	ld	a5,32(s2)
    8000495c:	0087b503          	ld	a0,8(a5)
    80004960:	00001097          	auipc	ra,0x1
    80004964:	638080e7          	jalr	1592(ra) # 80005f98 <_ZN9BufferCPP3getEv>
            i++;
    80004968:	0019849b          	addiw	s1,s3,1
    8000496c:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004970:	0ff57513          	andi	a0,a0,255
    80004974:	ffffe097          	auipc	ra,0xffffe
    80004978:	39c080e7          	jalr	924(ra) # 80002d10 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    8000497c:	05000793          	li	a5,80
    80004980:	02f4e4bb          	remw	s1,s1,a5
    80004984:	fc0494e3          	bnez	s1,8000494c <_ZN8Consumer3runEv+0x34>
    80004988:	fb9ff06f          	j	80004940 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    8000498c:	02093783          	ld	a5,32(s2)
    80004990:	0087b503          	ld	a0,8(a5)
    80004994:	00001097          	auipc	ra,0x1
    80004998:	604080e7          	jalr	1540(ra) # 80005f98 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    8000499c:	0ff57513          	andi	a0,a0,255
    800049a0:	ffffe097          	auipc	ra,0xffffe
    800049a4:	370080e7          	jalr	880(ra) # 80002d10 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    800049a8:	02093783          	ld	a5,32(s2)
    800049ac:	0087b503          	ld	a0,8(a5)
    800049b0:	00001097          	auipc	ra,0x1
    800049b4:	674080e7          	jalr	1652(ra) # 80006024 <_ZN9BufferCPP6getCntEv>
    800049b8:	fca04ae3          	bgtz	a0,8000498c <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    800049bc:	02093783          	ld	a5,32(s2)
    800049c0:	0107b503          	ld	a0,16(a5)
    800049c4:	ffffe097          	auipc	ra,0xffffe
    800049c8:	288080e7          	jalr	648(ra) # 80002c4c <_ZN9Semaphore6signalEv>
    }
    800049cc:	02813083          	ld	ra,40(sp)
    800049d0:	02013403          	ld	s0,32(sp)
    800049d4:	01813483          	ld	s1,24(sp)
    800049d8:	01013903          	ld	s2,16(sp)
    800049dc:	00813983          	ld	s3,8(sp)
    800049e0:	03010113          	addi	sp,sp,48
    800049e4:	00008067          	ret

00000000800049e8 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    800049e8:	ff010113          	addi	sp,sp,-16
    800049ec:	00113423          	sd	ra,8(sp)
    800049f0:	00813023          	sd	s0,0(sp)
    800049f4:	01010413          	addi	s0,sp,16
    800049f8:	00008797          	auipc	a5,0x8
    800049fc:	15878793          	addi	a5,a5,344 # 8000cb50 <_ZTV8Consumer+0x10>
    80004a00:	00f53023          	sd	a5,0(a0)
    80004a04:	ffffe097          	auipc	ra,0xffffe
    80004a08:	da0080e7          	jalr	-608(ra) # 800027a4 <_ZN6ThreadD1Ev>
    80004a0c:	00813083          	ld	ra,8(sp)
    80004a10:	00013403          	ld	s0,0(sp)
    80004a14:	01010113          	addi	sp,sp,16
    80004a18:	00008067          	ret

0000000080004a1c <_ZN8ConsumerD0Ev>:
    80004a1c:	fe010113          	addi	sp,sp,-32
    80004a20:	00113c23          	sd	ra,24(sp)
    80004a24:	00813823          	sd	s0,16(sp)
    80004a28:	00913423          	sd	s1,8(sp)
    80004a2c:	02010413          	addi	s0,sp,32
    80004a30:	00050493          	mv	s1,a0
    80004a34:	00008797          	auipc	a5,0x8
    80004a38:	11c78793          	addi	a5,a5,284 # 8000cb50 <_ZTV8Consumer+0x10>
    80004a3c:	00f53023          	sd	a5,0(a0)
    80004a40:	ffffe097          	auipc	ra,0xffffe
    80004a44:	d64080e7          	jalr	-668(ra) # 800027a4 <_ZN6ThreadD1Ev>
    80004a48:	00048513          	mv	a0,s1
    80004a4c:	ffffe097          	auipc	ra,0xffffe
    80004a50:	e98080e7          	jalr	-360(ra) # 800028e4 <_ZdlPv>
    80004a54:	01813083          	ld	ra,24(sp)
    80004a58:	01013403          	ld	s0,16(sp)
    80004a5c:	00813483          	ld	s1,8(sp)
    80004a60:	02010113          	addi	sp,sp,32
    80004a64:	00008067          	ret

0000000080004a68 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004a68:	ff010113          	addi	sp,sp,-16
    80004a6c:	00113423          	sd	ra,8(sp)
    80004a70:	00813023          	sd	s0,0(sp)
    80004a74:	01010413          	addi	s0,sp,16
    80004a78:	00008797          	auipc	a5,0x8
    80004a7c:	08878793          	addi	a5,a5,136 # 8000cb00 <_ZTV16ProducerKeyborad+0x10>
    80004a80:	00f53023          	sd	a5,0(a0)
    80004a84:	ffffe097          	auipc	ra,0xffffe
    80004a88:	d20080e7          	jalr	-736(ra) # 800027a4 <_ZN6ThreadD1Ev>
    80004a8c:	00813083          	ld	ra,8(sp)
    80004a90:	00013403          	ld	s0,0(sp)
    80004a94:	01010113          	addi	sp,sp,16
    80004a98:	00008067          	ret

0000000080004a9c <_ZN16ProducerKeyboradD0Ev>:
    80004a9c:	fe010113          	addi	sp,sp,-32
    80004aa0:	00113c23          	sd	ra,24(sp)
    80004aa4:	00813823          	sd	s0,16(sp)
    80004aa8:	00913423          	sd	s1,8(sp)
    80004aac:	02010413          	addi	s0,sp,32
    80004ab0:	00050493          	mv	s1,a0
    80004ab4:	00008797          	auipc	a5,0x8
    80004ab8:	04c78793          	addi	a5,a5,76 # 8000cb00 <_ZTV16ProducerKeyborad+0x10>
    80004abc:	00f53023          	sd	a5,0(a0)
    80004ac0:	ffffe097          	auipc	ra,0xffffe
    80004ac4:	ce4080e7          	jalr	-796(ra) # 800027a4 <_ZN6ThreadD1Ev>
    80004ac8:	00048513          	mv	a0,s1
    80004acc:	ffffe097          	auipc	ra,0xffffe
    80004ad0:	e18080e7          	jalr	-488(ra) # 800028e4 <_ZdlPv>
    80004ad4:	01813083          	ld	ra,24(sp)
    80004ad8:	01013403          	ld	s0,16(sp)
    80004adc:	00813483          	ld	s1,8(sp)
    80004ae0:	02010113          	addi	sp,sp,32
    80004ae4:	00008067          	ret

0000000080004ae8 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004ae8:	ff010113          	addi	sp,sp,-16
    80004aec:	00113423          	sd	ra,8(sp)
    80004af0:	00813023          	sd	s0,0(sp)
    80004af4:	01010413          	addi	s0,sp,16
    80004af8:	00008797          	auipc	a5,0x8
    80004afc:	03078793          	addi	a5,a5,48 # 8000cb28 <_ZTV8Producer+0x10>
    80004b00:	00f53023          	sd	a5,0(a0)
    80004b04:	ffffe097          	auipc	ra,0xffffe
    80004b08:	ca0080e7          	jalr	-864(ra) # 800027a4 <_ZN6ThreadD1Ev>
    80004b0c:	00813083          	ld	ra,8(sp)
    80004b10:	00013403          	ld	s0,0(sp)
    80004b14:	01010113          	addi	sp,sp,16
    80004b18:	00008067          	ret

0000000080004b1c <_ZN8ProducerD0Ev>:
    80004b1c:	fe010113          	addi	sp,sp,-32
    80004b20:	00113c23          	sd	ra,24(sp)
    80004b24:	00813823          	sd	s0,16(sp)
    80004b28:	00913423          	sd	s1,8(sp)
    80004b2c:	02010413          	addi	s0,sp,32
    80004b30:	00050493          	mv	s1,a0
    80004b34:	00008797          	auipc	a5,0x8
    80004b38:	ff478793          	addi	a5,a5,-12 # 8000cb28 <_ZTV8Producer+0x10>
    80004b3c:	00f53023          	sd	a5,0(a0)
    80004b40:	ffffe097          	auipc	ra,0xffffe
    80004b44:	c64080e7          	jalr	-924(ra) # 800027a4 <_ZN6ThreadD1Ev>
    80004b48:	00048513          	mv	a0,s1
    80004b4c:	ffffe097          	auipc	ra,0xffffe
    80004b50:	d98080e7          	jalr	-616(ra) # 800028e4 <_ZdlPv>
    80004b54:	01813083          	ld	ra,24(sp)
    80004b58:	01013403          	ld	s0,16(sp)
    80004b5c:	00813483          	ld	s1,8(sp)
    80004b60:	02010113          	addi	sp,sp,32
    80004b64:	00008067          	ret

0000000080004b68 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004b68:	fe010113          	addi	sp,sp,-32
    80004b6c:	00113c23          	sd	ra,24(sp)
    80004b70:	00813823          	sd	s0,16(sp)
    80004b74:	00913423          	sd	s1,8(sp)
    80004b78:	02010413          	addi	s0,sp,32
    80004b7c:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004b80:	ffffd097          	auipc	ra,0xffffd
    80004b84:	9f4080e7          	jalr	-1548(ra) # 80001574 <_Z4getcv>
    80004b88:	0005059b          	sext.w	a1,a0
    80004b8c:	01b00793          	li	a5,27
    80004b90:	00f58c63          	beq	a1,a5,80004ba8 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004b94:	0204b783          	ld	a5,32(s1)
    80004b98:	0087b503          	ld	a0,8(a5)
    80004b9c:	00001097          	auipc	ra,0x1
    80004ba0:	36c080e7          	jalr	876(ra) # 80005f08 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004ba4:	fddff06f          	j	80004b80 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004ba8:	00100793          	li	a5,1
    80004bac:	00008717          	auipc	a4,0x8
    80004bb0:	2af72623          	sw	a5,684(a4) # 8000ce58 <_ZL9threadEnd>
        td->buffer->put('!');
    80004bb4:	0204b783          	ld	a5,32(s1)
    80004bb8:	02100593          	li	a1,33
    80004bbc:	0087b503          	ld	a0,8(a5)
    80004bc0:	00001097          	auipc	ra,0x1
    80004bc4:	348080e7          	jalr	840(ra) # 80005f08 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004bc8:	0204b783          	ld	a5,32(s1)
    80004bcc:	0107b503          	ld	a0,16(a5)
    80004bd0:	ffffe097          	auipc	ra,0xffffe
    80004bd4:	07c080e7          	jalr	124(ra) # 80002c4c <_ZN9Semaphore6signalEv>
    }
    80004bd8:	01813083          	ld	ra,24(sp)
    80004bdc:	01013403          	ld	s0,16(sp)
    80004be0:	00813483          	ld	s1,8(sp)
    80004be4:	02010113          	addi	sp,sp,32
    80004be8:	00008067          	ret

0000000080004bec <_ZN8Producer3runEv>:
    void run() override {
    80004bec:	fe010113          	addi	sp,sp,-32
    80004bf0:	00113c23          	sd	ra,24(sp)
    80004bf4:	00813823          	sd	s0,16(sp)
    80004bf8:	00913423          	sd	s1,8(sp)
    80004bfc:	01213023          	sd	s2,0(sp)
    80004c00:	02010413          	addi	s0,sp,32
    80004c04:	00050493          	mv	s1,a0
        int i = 0;
    80004c08:	00000913          	li	s2,0
        while (!threadEnd) {
    80004c0c:	00008797          	auipc	a5,0x8
    80004c10:	24c7a783          	lw	a5,588(a5) # 8000ce58 <_ZL9threadEnd>
    80004c14:	04079263          	bnez	a5,80004c58 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004c18:	0204b783          	ld	a5,32(s1)
    80004c1c:	0007a583          	lw	a1,0(a5)
    80004c20:	0305859b          	addiw	a1,a1,48
    80004c24:	0087b503          	ld	a0,8(a5)
    80004c28:	00001097          	auipc	ra,0x1
    80004c2c:	2e0080e7          	jalr	736(ra) # 80005f08 <_ZN9BufferCPP3putEi>
            i++;
    80004c30:	0019071b          	addiw	a4,s2,1
    80004c34:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004c38:	0204b783          	ld	a5,32(s1)
    80004c3c:	0007a783          	lw	a5,0(a5)
    80004c40:	00e787bb          	addw	a5,a5,a4
    80004c44:	00500513          	li	a0,5
    80004c48:	02a7e53b          	remw	a0,a5,a0
    80004c4c:	ffffe097          	auipc	ra,0xffffe
    80004c50:	e8c080e7          	jalr	-372(ra) # 80002ad8 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004c54:	fb9ff06f          	j	80004c0c <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004c58:	0204b783          	ld	a5,32(s1)
    80004c5c:	0107b503          	ld	a0,16(a5)
    80004c60:	ffffe097          	auipc	ra,0xffffe
    80004c64:	fec080e7          	jalr	-20(ra) # 80002c4c <_ZN9Semaphore6signalEv>
    }
    80004c68:	01813083          	ld	ra,24(sp)
    80004c6c:	01013403          	ld	s0,16(sp)
    80004c70:	00813483          	ld	s1,8(sp)
    80004c74:	00013903          	ld	s2,0(sp)
    80004c78:	02010113          	addi	sp,sp,32
    80004c7c:	00008067          	ret

0000000080004c80 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004c80:	fe010113          	addi	sp,sp,-32
    80004c84:	00113c23          	sd	ra,24(sp)
    80004c88:	00813823          	sd	s0,16(sp)
    80004c8c:	00913423          	sd	s1,8(sp)
    80004c90:	01213023          	sd	s2,0(sp)
    80004c94:	02010413          	addi	s0,sp,32
    80004c98:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004c9c:	00100793          	li	a5,1
    80004ca0:	02a7f863          	bgeu	a5,a0,80004cd0 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004ca4:	00a00793          	li	a5,10
    80004ca8:	02f577b3          	remu	a5,a0,a5
    80004cac:	02078e63          	beqz	a5,80004ce8 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004cb0:	fff48513          	addi	a0,s1,-1
    80004cb4:	00000097          	auipc	ra,0x0
    80004cb8:	fcc080e7          	jalr	-52(ra) # 80004c80 <_ZL9fibonaccim>
    80004cbc:	00050913          	mv	s2,a0
    80004cc0:	ffe48513          	addi	a0,s1,-2
    80004cc4:	00000097          	auipc	ra,0x0
    80004cc8:	fbc080e7          	jalr	-68(ra) # 80004c80 <_ZL9fibonaccim>
    80004ccc:	00a90533          	add	a0,s2,a0
}
    80004cd0:	01813083          	ld	ra,24(sp)
    80004cd4:	01013403          	ld	s0,16(sp)
    80004cd8:	00813483          	ld	s1,8(sp)
    80004cdc:	00013903          	ld	s2,0(sp)
    80004ce0:	02010113          	addi	sp,sp,32
    80004ce4:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004ce8:	ffffc097          	auipc	ra,0xffffc
    80004cec:	74c080e7          	jalr	1868(ra) # 80001434 <_Z15thread_dispatchv>
    80004cf0:	fc1ff06f          	j	80004cb0 <_ZL9fibonaccim+0x30>

0000000080004cf4 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004cf4:	fe010113          	addi	sp,sp,-32
    80004cf8:	00113c23          	sd	ra,24(sp)
    80004cfc:	00813823          	sd	s0,16(sp)
    80004d00:	00913423          	sd	s1,8(sp)
    80004d04:	01213023          	sd	s2,0(sp)
    80004d08:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004d0c:	00a00493          	li	s1,10
    80004d10:	0400006f          	j	80004d50 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004d14:	00005517          	auipc	a0,0x5
    80004d18:	64450513          	addi	a0,a0,1604 # 8000a358 <CONSOLE_STATUS+0x348>
    80004d1c:	00001097          	auipc	ra,0x1
    80004d20:	dc8080e7          	jalr	-568(ra) # 80005ae4 <_Z11printStringPKc>
    80004d24:	00000613          	li	a2,0
    80004d28:	00a00593          	li	a1,10
    80004d2c:	00048513          	mv	a0,s1
    80004d30:	00001097          	auipc	ra,0x1
    80004d34:	f64080e7          	jalr	-156(ra) # 80005c94 <_Z8printIntiii>
    80004d38:	00006517          	auipc	a0,0x6
    80004d3c:	81050513          	addi	a0,a0,-2032 # 8000a548 <CONSOLE_STATUS+0x538>
    80004d40:	00001097          	auipc	ra,0x1
    80004d44:	da4080e7          	jalr	-604(ra) # 80005ae4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004d48:	0014849b          	addiw	s1,s1,1
    80004d4c:	0ff4f493          	andi	s1,s1,255
    80004d50:	00c00793          	li	a5,12
    80004d54:	fc97f0e3          	bgeu	a5,s1,80004d14 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004d58:	00005517          	auipc	a0,0x5
    80004d5c:	60850513          	addi	a0,a0,1544 # 8000a360 <CONSOLE_STATUS+0x350>
    80004d60:	00001097          	auipc	ra,0x1
    80004d64:	d84080e7          	jalr	-636(ra) # 80005ae4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004d68:	00500313          	li	t1,5
    thread_dispatch();
    80004d6c:	ffffc097          	auipc	ra,0xffffc
    80004d70:	6c8080e7          	jalr	1736(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004d74:	01000513          	li	a0,16
    80004d78:	00000097          	auipc	ra,0x0
    80004d7c:	f08080e7          	jalr	-248(ra) # 80004c80 <_ZL9fibonaccim>
    80004d80:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004d84:	00005517          	auipc	a0,0x5
    80004d88:	5ec50513          	addi	a0,a0,1516 # 8000a370 <CONSOLE_STATUS+0x360>
    80004d8c:	00001097          	auipc	ra,0x1
    80004d90:	d58080e7          	jalr	-680(ra) # 80005ae4 <_Z11printStringPKc>
    80004d94:	00000613          	li	a2,0
    80004d98:	00a00593          	li	a1,10
    80004d9c:	0009051b          	sext.w	a0,s2
    80004da0:	00001097          	auipc	ra,0x1
    80004da4:	ef4080e7          	jalr	-268(ra) # 80005c94 <_Z8printIntiii>
    80004da8:	00005517          	auipc	a0,0x5
    80004dac:	7a050513          	addi	a0,a0,1952 # 8000a548 <CONSOLE_STATUS+0x538>
    80004db0:	00001097          	auipc	ra,0x1
    80004db4:	d34080e7          	jalr	-716(ra) # 80005ae4 <_Z11printStringPKc>
    80004db8:	0400006f          	j	80004df8 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004dbc:	00005517          	auipc	a0,0x5
    80004dc0:	59c50513          	addi	a0,a0,1436 # 8000a358 <CONSOLE_STATUS+0x348>
    80004dc4:	00001097          	auipc	ra,0x1
    80004dc8:	d20080e7          	jalr	-736(ra) # 80005ae4 <_Z11printStringPKc>
    80004dcc:	00000613          	li	a2,0
    80004dd0:	00a00593          	li	a1,10
    80004dd4:	00048513          	mv	a0,s1
    80004dd8:	00001097          	auipc	ra,0x1
    80004ddc:	ebc080e7          	jalr	-324(ra) # 80005c94 <_Z8printIntiii>
    80004de0:	00005517          	auipc	a0,0x5
    80004de4:	76850513          	addi	a0,a0,1896 # 8000a548 <CONSOLE_STATUS+0x538>
    80004de8:	00001097          	auipc	ra,0x1
    80004dec:	cfc080e7          	jalr	-772(ra) # 80005ae4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004df0:	0014849b          	addiw	s1,s1,1
    80004df4:	0ff4f493          	andi	s1,s1,255
    80004df8:	00f00793          	li	a5,15
    80004dfc:	fc97f0e3          	bgeu	a5,s1,80004dbc <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004e00:	00005517          	auipc	a0,0x5
    80004e04:	58050513          	addi	a0,a0,1408 # 8000a380 <CONSOLE_STATUS+0x370>
    80004e08:	00001097          	auipc	ra,0x1
    80004e0c:	cdc080e7          	jalr	-804(ra) # 80005ae4 <_Z11printStringPKc>
    finishedD = true;
    80004e10:	00100793          	li	a5,1
    80004e14:	00008717          	auipc	a4,0x8
    80004e18:	04f70a23          	sb	a5,84(a4) # 8000ce68 <_ZL9finishedD>
    thread_dispatch();
    80004e1c:	ffffc097          	auipc	ra,0xffffc
    80004e20:	618080e7          	jalr	1560(ra) # 80001434 <_Z15thread_dispatchv>
}
    80004e24:	01813083          	ld	ra,24(sp)
    80004e28:	01013403          	ld	s0,16(sp)
    80004e2c:	00813483          	ld	s1,8(sp)
    80004e30:	00013903          	ld	s2,0(sp)
    80004e34:	02010113          	addi	sp,sp,32
    80004e38:	00008067          	ret

0000000080004e3c <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004e3c:	fe010113          	addi	sp,sp,-32
    80004e40:	00113c23          	sd	ra,24(sp)
    80004e44:	00813823          	sd	s0,16(sp)
    80004e48:	00913423          	sd	s1,8(sp)
    80004e4c:	01213023          	sd	s2,0(sp)
    80004e50:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004e54:	00000493          	li	s1,0
    80004e58:	0400006f          	j	80004e98 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004e5c:	00005517          	auipc	a0,0x5
    80004e60:	4bc50513          	addi	a0,a0,1212 # 8000a318 <CONSOLE_STATUS+0x308>
    80004e64:	00001097          	auipc	ra,0x1
    80004e68:	c80080e7          	jalr	-896(ra) # 80005ae4 <_Z11printStringPKc>
    80004e6c:	00000613          	li	a2,0
    80004e70:	00a00593          	li	a1,10
    80004e74:	00048513          	mv	a0,s1
    80004e78:	00001097          	auipc	ra,0x1
    80004e7c:	e1c080e7          	jalr	-484(ra) # 80005c94 <_Z8printIntiii>
    80004e80:	00005517          	auipc	a0,0x5
    80004e84:	6c850513          	addi	a0,a0,1736 # 8000a548 <CONSOLE_STATUS+0x538>
    80004e88:	00001097          	auipc	ra,0x1
    80004e8c:	c5c080e7          	jalr	-932(ra) # 80005ae4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004e90:	0014849b          	addiw	s1,s1,1
    80004e94:	0ff4f493          	andi	s1,s1,255
    80004e98:	00200793          	li	a5,2
    80004e9c:	fc97f0e3          	bgeu	a5,s1,80004e5c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004ea0:	00005517          	auipc	a0,0x5
    80004ea4:	48050513          	addi	a0,a0,1152 # 8000a320 <CONSOLE_STATUS+0x310>
    80004ea8:	00001097          	auipc	ra,0x1
    80004eac:	c3c080e7          	jalr	-964(ra) # 80005ae4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004eb0:	00700313          	li	t1,7
    thread_dispatch();
    80004eb4:	ffffc097          	auipc	ra,0xffffc
    80004eb8:	580080e7          	jalr	1408(ra) # 80001434 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004ebc:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004ec0:	00005517          	auipc	a0,0x5
    80004ec4:	47050513          	addi	a0,a0,1136 # 8000a330 <CONSOLE_STATUS+0x320>
    80004ec8:	00001097          	auipc	ra,0x1
    80004ecc:	c1c080e7          	jalr	-996(ra) # 80005ae4 <_Z11printStringPKc>
    80004ed0:	00000613          	li	a2,0
    80004ed4:	00a00593          	li	a1,10
    80004ed8:	0009051b          	sext.w	a0,s2
    80004edc:	00001097          	auipc	ra,0x1
    80004ee0:	db8080e7          	jalr	-584(ra) # 80005c94 <_Z8printIntiii>
    80004ee4:	00005517          	auipc	a0,0x5
    80004ee8:	66450513          	addi	a0,a0,1636 # 8000a548 <CONSOLE_STATUS+0x538>
    80004eec:	00001097          	auipc	ra,0x1
    80004ef0:	bf8080e7          	jalr	-1032(ra) # 80005ae4 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004ef4:	00c00513          	li	a0,12
    80004ef8:	00000097          	auipc	ra,0x0
    80004efc:	d88080e7          	jalr	-632(ra) # 80004c80 <_ZL9fibonaccim>
    80004f00:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004f04:	00005517          	auipc	a0,0x5
    80004f08:	43450513          	addi	a0,a0,1076 # 8000a338 <CONSOLE_STATUS+0x328>
    80004f0c:	00001097          	auipc	ra,0x1
    80004f10:	bd8080e7          	jalr	-1064(ra) # 80005ae4 <_Z11printStringPKc>
    80004f14:	00000613          	li	a2,0
    80004f18:	00a00593          	li	a1,10
    80004f1c:	0009051b          	sext.w	a0,s2
    80004f20:	00001097          	auipc	ra,0x1
    80004f24:	d74080e7          	jalr	-652(ra) # 80005c94 <_Z8printIntiii>
    80004f28:	00005517          	auipc	a0,0x5
    80004f2c:	62050513          	addi	a0,a0,1568 # 8000a548 <CONSOLE_STATUS+0x538>
    80004f30:	00001097          	auipc	ra,0x1
    80004f34:	bb4080e7          	jalr	-1100(ra) # 80005ae4 <_Z11printStringPKc>
    80004f38:	0400006f          	j	80004f78 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004f3c:	00005517          	auipc	a0,0x5
    80004f40:	3dc50513          	addi	a0,a0,988 # 8000a318 <CONSOLE_STATUS+0x308>
    80004f44:	00001097          	auipc	ra,0x1
    80004f48:	ba0080e7          	jalr	-1120(ra) # 80005ae4 <_Z11printStringPKc>
    80004f4c:	00000613          	li	a2,0
    80004f50:	00a00593          	li	a1,10
    80004f54:	00048513          	mv	a0,s1
    80004f58:	00001097          	auipc	ra,0x1
    80004f5c:	d3c080e7          	jalr	-708(ra) # 80005c94 <_Z8printIntiii>
    80004f60:	00005517          	auipc	a0,0x5
    80004f64:	5e850513          	addi	a0,a0,1512 # 8000a548 <CONSOLE_STATUS+0x538>
    80004f68:	00001097          	auipc	ra,0x1
    80004f6c:	b7c080e7          	jalr	-1156(ra) # 80005ae4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004f70:	0014849b          	addiw	s1,s1,1
    80004f74:	0ff4f493          	andi	s1,s1,255
    80004f78:	00500793          	li	a5,5
    80004f7c:	fc97f0e3          	bgeu	a5,s1,80004f3c <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80004f80:	00005517          	auipc	a0,0x5
    80004f84:	3c850513          	addi	a0,a0,968 # 8000a348 <CONSOLE_STATUS+0x338>
    80004f88:	00001097          	auipc	ra,0x1
    80004f8c:	b5c080e7          	jalr	-1188(ra) # 80005ae4 <_Z11printStringPKc>
    finishedC = true;
    80004f90:	00100793          	li	a5,1
    80004f94:	00008717          	auipc	a4,0x8
    80004f98:	ecf70aa3          	sb	a5,-299(a4) # 8000ce69 <_ZL9finishedC>
    thread_dispatch();
    80004f9c:	ffffc097          	auipc	ra,0xffffc
    80004fa0:	498080e7          	jalr	1176(ra) # 80001434 <_Z15thread_dispatchv>
}
    80004fa4:	01813083          	ld	ra,24(sp)
    80004fa8:	01013403          	ld	s0,16(sp)
    80004fac:	00813483          	ld	s1,8(sp)
    80004fb0:	00013903          	ld	s2,0(sp)
    80004fb4:	02010113          	addi	sp,sp,32
    80004fb8:	00008067          	ret

0000000080004fbc <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004fbc:	fe010113          	addi	sp,sp,-32
    80004fc0:	00113c23          	sd	ra,24(sp)
    80004fc4:	00813823          	sd	s0,16(sp)
    80004fc8:	00913423          	sd	s1,8(sp)
    80004fcc:	01213023          	sd	s2,0(sp)
    80004fd0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004fd4:	00000913          	li	s2,0
    80004fd8:	0380006f          	j	80005010 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004fdc:	ffffc097          	auipc	ra,0xffffc
    80004fe0:	458080e7          	jalr	1112(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004fe4:	00148493          	addi	s1,s1,1
    80004fe8:	000027b7          	lui	a5,0x2
    80004fec:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004ff0:	0097ee63          	bltu	a5,s1,8000500c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004ff4:	00000713          	li	a4,0
    80004ff8:	000077b7          	lui	a5,0x7
    80004ffc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005000:	fce7eee3          	bltu	a5,a4,80004fdc <_ZL11workerBodyBPv+0x20>
    80005004:	00170713          	addi	a4,a4,1
    80005008:	ff1ff06f          	j	80004ff8 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    8000500c:	00190913          	addi	s2,s2,1
    80005010:	00f00793          	li	a5,15
    80005014:	0527e063          	bltu	a5,s2,80005054 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80005018:	00005517          	auipc	a0,0x5
    8000501c:	2e850513          	addi	a0,a0,744 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80005020:	00001097          	auipc	ra,0x1
    80005024:	ac4080e7          	jalr	-1340(ra) # 80005ae4 <_Z11printStringPKc>
    80005028:	00000613          	li	a2,0
    8000502c:	00a00593          	li	a1,10
    80005030:	0009051b          	sext.w	a0,s2
    80005034:	00001097          	auipc	ra,0x1
    80005038:	c60080e7          	jalr	-928(ra) # 80005c94 <_Z8printIntiii>
    8000503c:	00005517          	auipc	a0,0x5
    80005040:	50c50513          	addi	a0,a0,1292 # 8000a548 <CONSOLE_STATUS+0x538>
    80005044:	00001097          	auipc	ra,0x1
    80005048:	aa0080e7          	jalr	-1376(ra) # 80005ae4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000504c:	00000493          	li	s1,0
    80005050:	f99ff06f          	j	80004fe8 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80005054:	00005517          	auipc	a0,0x5
    80005058:	2b450513          	addi	a0,a0,692 # 8000a308 <CONSOLE_STATUS+0x2f8>
    8000505c:	00001097          	auipc	ra,0x1
    80005060:	a88080e7          	jalr	-1400(ra) # 80005ae4 <_Z11printStringPKc>
    finishedB = true;
    80005064:	00100793          	li	a5,1
    80005068:	00008717          	auipc	a4,0x8
    8000506c:	e0f70123          	sb	a5,-510(a4) # 8000ce6a <_ZL9finishedB>
    thread_dispatch();
    80005070:	ffffc097          	auipc	ra,0xffffc
    80005074:	3c4080e7          	jalr	964(ra) # 80001434 <_Z15thread_dispatchv>
}
    80005078:	01813083          	ld	ra,24(sp)
    8000507c:	01013403          	ld	s0,16(sp)
    80005080:	00813483          	ld	s1,8(sp)
    80005084:	00013903          	ld	s2,0(sp)
    80005088:	02010113          	addi	sp,sp,32
    8000508c:	00008067          	ret

0000000080005090 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005090:	fe010113          	addi	sp,sp,-32
    80005094:	00113c23          	sd	ra,24(sp)
    80005098:	00813823          	sd	s0,16(sp)
    8000509c:	00913423          	sd	s1,8(sp)
    800050a0:	01213023          	sd	s2,0(sp)
    800050a4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800050a8:	00000913          	li	s2,0
    800050ac:	0380006f          	j	800050e4 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800050b0:	ffffc097          	auipc	ra,0xffffc
    800050b4:	384080e7          	jalr	900(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800050b8:	00148493          	addi	s1,s1,1
    800050bc:	000027b7          	lui	a5,0x2
    800050c0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800050c4:	0097ee63          	bltu	a5,s1,800050e0 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800050c8:	00000713          	li	a4,0
    800050cc:	000077b7          	lui	a5,0x7
    800050d0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800050d4:	fce7eee3          	bltu	a5,a4,800050b0 <_ZL11workerBodyAPv+0x20>
    800050d8:	00170713          	addi	a4,a4,1
    800050dc:	ff1ff06f          	j	800050cc <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800050e0:	00190913          	addi	s2,s2,1
    800050e4:	00900793          	li	a5,9
    800050e8:	0527e063          	bltu	a5,s2,80005128 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800050ec:	00005517          	auipc	a0,0x5
    800050f0:	1fc50513          	addi	a0,a0,508 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    800050f4:	00001097          	auipc	ra,0x1
    800050f8:	9f0080e7          	jalr	-1552(ra) # 80005ae4 <_Z11printStringPKc>
    800050fc:	00000613          	li	a2,0
    80005100:	00a00593          	li	a1,10
    80005104:	0009051b          	sext.w	a0,s2
    80005108:	00001097          	auipc	ra,0x1
    8000510c:	b8c080e7          	jalr	-1140(ra) # 80005c94 <_Z8printIntiii>
    80005110:	00005517          	auipc	a0,0x5
    80005114:	43850513          	addi	a0,a0,1080 # 8000a548 <CONSOLE_STATUS+0x538>
    80005118:	00001097          	auipc	ra,0x1
    8000511c:	9cc080e7          	jalr	-1588(ra) # 80005ae4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005120:	00000493          	li	s1,0
    80005124:	f99ff06f          	j	800050bc <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005128:	00005517          	auipc	a0,0x5
    8000512c:	1c850513          	addi	a0,a0,456 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    80005130:	00001097          	auipc	ra,0x1
    80005134:	9b4080e7          	jalr	-1612(ra) # 80005ae4 <_Z11printStringPKc>
    finishedA = true;
    80005138:	00100793          	li	a5,1
    8000513c:	00008717          	auipc	a4,0x8
    80005140:	d2f707a3          	sb	a5,-721(a4) # 8000ce6b <_ZL9finishedA>
}
    80005144:	01813083          	ld	ra,24(sp)
    80005148:	01013403          	ld	s0,16(sp)
    8000514c:	00813483          	ld	s1,8(sp)
    80005150:	00013903          	ld	s2,0(sp)
    80005154:	02010113          	addi	sp,sp,32
    80005158:	00008067          	ret

000000008000515c <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    8000515c:	fd010113          	addi	sp,sp,-48
    80005160:	02113423          	sd	ra,40(sp)
    80005164:	02813023          	sd	s0,32(sp)
    80005168:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    8000516c:	00000613          	li	a2,0
    80005170:	00000597          	auipc	a1,0x0
    80005174:	f2058593          	addi	a1,a1,-224 # 80005090 <_ZL11workerBodyAPv>
    80005178:	fd040513          	addi	a0,s0,-48
    8000517c:	ffffc097          	auipc	ra,0xffffc
    80005180:	1fc080e7          	jalr	508(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005184:	00005517          	auipc	a0,0x5
    80005188:	20c50513          	addi	a0,a0,524 # 8000a390 <CONSOLE_STATUS+0x380>
    8000518c:	00001097          	auipc	ra,0x1
    80005190:	958080e7          	jalr	-1704(ra) # 80005ae4 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005194:	00000613          	li	a2,0
    80005198:	00000597          	auipc	a1,0x0
    8000519c:	e2458593          	addi	a1,a1,-476 # 80004fbc <_ZL11workerBodyBPv>
    800051a0:	fd840513          	addi	a0,s0,-40
    800051a4:	ffffc097          	auipc	ra,0xffffc
    800051a8:	1d4080e7          	jalr	468(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800051ac:	00005517          	auipc	a0,0x5
    800051b0:	1fc50513          	addi	a0,a0,508 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800051b4:	00001097          	auipc	ra,0x1
    800051b8:	930080e7          	jalr	-1744(ra) # 80005ae4 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800051bc:	00000613          	li	a2,0
    800051c0:	00000597          	auipc	a1,0x0
    800051c4:	c7c58593          	addi	a1,a1,-900 # 80004e3c <_ZL11workerBodyCPv>
    800051c8:	fe040513          	addi	a0,s0,-32
    800051cc:	ffffc097          	auipc	ra,0xffffc
    800051d0:	1ac080e7          	jalr	428(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800051d4:	00005517          	auipc	a0,0x5
    800051d8:	1ec50513          	addi	a0,a0,492 # 8000a3c0 <CONSOLE_STATUS+0x3b0>
    800051dc:	00001097          	auipc	ra,0x1
    800051e0:	908080e7          	jalr	-1784(ra) # 80005ae4 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800051e4:	00000613          	li	a2,0
    800051e8:	00000597          	auipc	a1,0x0
    800051ec:	b0c58593          	addi	a1,a1,-1268 # 80004cf4 <_ZL11workerBodyDPv>
    800051f0:	fe840513          	addi	a0,s0,-24
    800051f4:	ffffc097          	auipc	ra,0xffffc
    800051f8:	184080e7          	jalr	388(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800051fc:	00005517          	auipc	a0,0x5
    80005200:	1dc50513          	addi	a0,a0,476 # 8000a3d8 <CONSOLE_STATUS+0x3c8>
    80005204:	00001097          	auipc	ra,0x1
    80005208:	8e0080e7          	jalr	-1824(ra) # 80005ae4 <_Z11printStringPKc>
    8000520c:	00c0006f          	j	80005218 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005210:	ffffc097          	auipc	ra,0xffffc
    80005214:	224080e7          	jalr	548(ra) # 80001434 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005218:	00008797          	auipc	a5,0x8
    8000521c:	c537c783          	lbu	a5,-941(a5) # 8000ce6b <_ZL9finishedA>
    80005220:	fe0788e3          	beqz	a5,80005210 <_Z18Threads_C_API_testv+0xb4>
    80005224:	00008797          	auipc	a5,0x8
    80005228:	c467c783          	lbu	a5,-954(a5) # 8000ce6a <_ZL9finishedB>
    8000522c:	fe0782e3          	beqz	a5,80005210 <_Z18Threads_C_API_testv+0xb4>
    80005230:	00008797          	auipc	a5,0x8
    80005234:	c397c783          	lbu	a5,-967(a5) # 8000ce69 <_ZL9finishedC>
    80005238:	fc078ce3          	beqz	a5,80005210 <_Z18Threads_C_API_testv+0xb4>
    8000523c:	00008797          	auipc	a5,0x8
    80005240:	c2c7c783          	lbu	a5,-980(a5) # 8000ce68 <_ZL9finishedD>
    80005244:	fc0786e3          	beqz	a5,80005210 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80005248:	02813083          	ld	ra,40(sp)
    8000524c:	02013403          	ld	s0,32(sp)
    80005250:	03010113          	addi	sp,sp,48
    80005254:	00008067          	ret

0000000080005258 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80005258:	fd010113          	addi	sp,sp,-48
    8000525c:	02113423          	sd	ra,40(sp)
    80005260:	02813023          	sd	s0,32(sp)
    80005264:	00913c23          	sd	s1,24(sp)
    80005268:	01213823          	sd	s2,16(sp)
    8000526c:	01313423          	sd	s3,8(sp)
    80005270:	03010413          	addi	s0,sp,48
    80005274:	00050993          	mv	s3,a0
    80005278:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000527c:	00000913          	li	s2,0
    80005280:	00c0006f          	j	8000528c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005284:	ffffe097          	auipc	ra,0xffffe
    80005288:	82c080e7          	jalr	-2004(ra) # 80002ab0 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    8000528c:	ffffc097          	auipc	ra,0xffffc
    80005290:	2e8080e7          	jalr	744(ra) # 80001574 <_Z4getcv>
    80005294:	0005059b          	sext.w	a1,a0
    80005298:	01b00793          	li	a5,27
    8000529c:	02f58a63          	beq	a1,a5,800052d0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    800052a0:	0084b503          	ld	a0,8(s1)
    800052a4:	00001097          	auipc	ra,0x1
    800052a8:	c64080e7          	jalr	-924(ra) # 80005f08 <_ZN9BufferCPP3putEi>
        i++;
    800052ac:	0019071b          	addiw	a4,s2,1
    800052b0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800052b4:	0004a683          	lw	a3,0(s1)
    800052b8:	0026979b          	slliw	a5,a3,0x2
    800052bc:	00d787bb          	addw	a5,a5,a3
    800052c0:	0017979b          	slliw	a5,a5,0x1
    800052c4:	02f767bb          	remw	a5,a4,a5
    800052c8:	fc0792e3          	bnez	a5,8000528c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800052cc:	fb9ff06f          	j	80005284 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800052d0:	00100793          	li	a5,1
    800052d4:	00008717          	auipc	a4,0x8
    800052d8:	b8f72e23          	sw	a5,-1124(a4) # 8000ce70 <_ZL9threadEnd>
    td->buffer->put('!');
    800052dc:	0209b783          	ld	a5,32(s3)
    800052e0:	02100593          	li	a1,33
    800052e4:	0087b503          	ld	a0,8(a5)
    800052e8:	00001097          	auipc	ra,0x1
    800052ec:	c20080e7          	jalr	-992(ra) # 80005f08 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800052f0:	0104b503          	ld	a0,16(s1)
    800052f4:	ffffe097          	auipc	ra,0xffffe
    800052f8:	958080e7          	jalr	-1704(ra) # 80002c4c <_ZN9Semaphore6signalEv>
}
    800052fc:	02813083          	ld	ra,40(sp)
    80005300:	02013403          	ld	s0,32(sp)
    80005304:	01813483          	ld	s1,24(sp)
    80005308:	01013903          	ld	s2,16(sp)
    8000530c:	00813983          	ld	s3,8(sp)
    80005310:	03010113          	addi	sp,sp,48
    80005314:	00008067          	ret

0000000080005318 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80005318:	fe010113          	addi	sp,sp,-32
    8000531c:	00113c23          	sd	ra,24(sp)
    80005320:	00813823          	sd	s0,16(sp)
    80005324:	00913423          	sd	s1,8(sp)
    80005328:	01213023          	sd	s2,0(sp)
    8000532c:	02010413          	addi	s0,sp,32
    80005330:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005334:	00000913          	li	s2,0
    80005338:	00c0006f          	j	80005344 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    8000533c:	ffffd097          	auipc	ra,0xffffd
    80005340:	774080e7          	jalr	1908(ra) # 80002ab0 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005344:	00008797          	auipc	a5,0x8
    80005348:	b2c7a783          	lw	a5,-1236(a5) # 8000ce70 <_ZL9threadEnd>
    8000534c:	02079e63          	bnez	a5,80005388 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005350:	0004a583          	lw	a1,0(s1)
    80005354:	0305859b          	addiw	a1,a1,48
    80005358:	0084b503          	ld	a0,8(s1)
    8000535c:	00001097          	auipc	ra,0x1
    80005360:	bac080e7          	jalr	-1108(ra) # 80005f08 <_ZN9BufferCPP3putEi>
        i++;
    80005364:	0019071b          	addiw	a4,s2,1
    80005368:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000536c:	0004a683          	lw	a3,0(s1)
    80005370:	0026979b          	slliw	a5,a3,0x2
    80005374:	00d787bb          	addw	a5,a5,a3
    80005378:	0017979b          	slliw	a5,a5,0x1
    8000537c:	02f767bb          	remw	a5,a4,a5
    80005380:	fc0792e3          	bnez	a5,80005344 <_ZN12ProducerSync8producerEPv+0x2c>
    80005384:	fb9ff06f          	j	8000533c <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005388:	0104b503          	ld	a0,16(s1)
    8000538c:	ffffe097          	auipc	ra,0xffffe
    80005390:	8c0080e7          	jalr	-1856(ra) # 80002c4c <_ZN9Semaphore6signalEv>
}
    80005394:	01813083          	ld	ra,24(sp)
    80005398:	01013403          	ld	s0,16(sp)
    8000539c:	00813483          	ld	s1,8(sp)
    800053a0:	00013903          	ld	s2,0(sp)
    800053a4:	02010113          	addi	sp,sp,32
    800053a8:	00008067          	ret

00000000800053ac <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    800053ac:	fd010113          	addi	sp,sp,-48
    800053b0:	02113423          	sd	ra,40(sp)
    800053b4:	02813023          	sd	s0,32(sp)
    800053b8:	00913c23          	sd	s1,24(sp)
    800053bc:	01213823          	sd	s2,16(sp)
    800053c0:	01313423          	sd	s3,8(sp)
    800053c4:	01413023          	sd	s4,0(sp)
    800053c8:	03010413          	addi	s0,sp,48
    800053cc:	00050993          	mv	s3,a0
    800053d0:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800053d4:	00000a13          	li	s4,0
    800053d8:	01c0006f          	j	800053f4 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800053dc:	ffffd097          	auipc	ra,0xffffd
    800053e0:	6d4080e7          	jalr	1748(ra) # 80002ab0 <_ZN6Thread8dispatchEv>
    800053e4:	0500006f          	j	80005434 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800053e8:	00a00513          	li	a0,10
    800053ec:	ffffc097          	auipc	ra,0xffffc
    800053f0:	1b0080e7          	jalr	432(ra) # 8000159c <_Z4putcc>
    while (!threadEnd) {
    800053f4:	00008797          	auipc	a5,0x8
    800053f8:	a7c7a783          	lw	a5,-1412(a5) # 8000ce70 <_ZL9threadEnd>
    800053fc:	06079263          	bnez	a5,80005460 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005400:	00893503          	ld	a0,8(s2)
    80005404:	00001097          	auipc	ra,0x1
    80005408:	b94080e7          	jalr	-1132(ra) # 80005f98 <_ZN9BufferCPP3getEv>
        i++;
    8000540c:	001a049b          	addiw	s1,s4,1
    80005410:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005414:	0ff57513          	andi	a0,a0,255
    80005418:	ffffc097          	auipc	ra,0xffffc
    8000541c:	184080e7          	jalr	388(ra) # 8000159c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005420:	00092703          	lw	a4,0(s2)
    80005424:	0027179b          	slliw	a5,a4,0x2
    80005428:	00e787bb          	addw	a5,a5,a4
    8000542c:	02f4e7bb          	remw	a5,s1,a5
    80005430:	fa0786e3          	beqz	a5,800053dc <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005434:	05000793          	li	a5,80
    80005438:	02f4e4bb          	remw	s1,s1,a5
    8000543c:	fa049ce3          	bnez	s1,800053f4 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005440:	fa9ff06f          	j	800053e8 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005444:	0209b783          	ld	a5,32(s3)
    80005448:	0087b503          	ld	a0,8(a5)
    8000544c:	00001097          	auipc	ra,0x1
    80005450:	b4c080e7          	jalr	-1204(ra) # 80005f98 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005454:	0ff57513          	andi	a0,a0,255
    80005458:	ffffe097          	auipc	ra,0xffffe
    8000545c:	8b8080e7          	jalr	-1864(ra) # 80002d10 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005460:	0209b783          	ld	a5,32(s3)
    80005464:	0087b503          	ld	a0,8(a5)
    80005468:	00001097          	auipc	ra,0x1
    8000546c:	bbc080e7          	jalr	-1092(ra) # 80006024 <_ZN9BufferCPP6getCntEv>
    80005470:	fca04ae3          	bgtz	a0,80005444 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005474:	01093503          	ld	a0,16(s2)
    80005478:	ffffd097          	auipc	ra,0xffffd
    8000547c:	7d4080e7          	jalr	2004(ra) # 80002c4c <_ZN9Semaphore6signalEv>
}
    80005480:	02813083          	ld	ra,40(sp)
    80005484:	02013403          	ld	s0,32(sp)
    80005488:	01813483          	ld	s1,24(sp)
    8000548c:	01013903          	ld	s2,16(sp)
    80005490:	00813983          	ld	s3,8(sp)
    80005494:	00013a03          	ld	s4,0(sp)
    80005498:	03010113          	addi	sp,sp,48
    8000549c:	00008067          	ret

00000000800054a0 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    800054a0:	f8010113          	addi	sp,sp,-128
    800054a4:	06113c23          	sd	ra,120(sp)
    800054a8:	06813823          	sd	s0,112(sp)
    800054ac:	06913423          	sd	s1,104(sp)
    800054b0:	07213023          	sd	s2,96(sp)
    800054b4:	05313c23          	sd	s3,88(sp)
    800054b8:	05413823          	sd	s4,80(sp)
    800054bc:	05513423          	sd	s5,72(sp)
    800054c0:	05613023          	sd	s6,64(sp)
    800054c4:	03713c23          	sd	s7,56(sp)
    800054c8:	03813823          	sd	s8,48(sp)
    800054cc:	03913423          	sd	s9,40(sp)
    800054d0:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800054d4:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800054d8:	00005517          	auipc	a0,0x5
    800054dc:	d2850513          	addi	a0,a0,-728 # 8000a200 <CONSOLE_STATUS+0x1f0>
    800054e0:	00000097          	auipc	ra,0x0
    800054e4:	604080e7          	jalr	1540(ra) # 80005ae4 <_Z11printStringPKc>
    getString(input, 30);
    800054e8:	01e00593          	li	a1,30
    800054ec:	f8040493          	addi	s1,s0,-128
    800054f0:	00048513          	mv	a0,s1
    800054f4:	00000097          	auipc	ra,0x0
    800054f8:	678080e7          	jalr	1656(ra) # 80005b6c <_Z9getStringPci>
    threadNum = stringToInt(input);
    800054fc:	00048513          	mv	a0,s1
    80005500:	00000097          	auipc	ra,0x0
    80005504:	744080e7          	jalr	1860(ra) # 80005c44 <_Z11stringToIntPKc>
    80005508:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000550c:	00005517          	auipc	a0,0x5
    80005510:	d1450513          	addi	a0,a0,-748 # 8000a220 <CONSOLE_STATUS+0x210>
    80005514:	00000097          	auipc	ra,0x0
    80005518:	5d0080e7          	jalr	1488(ra) # 80005ae4 <_Z11printStringPKc>
    getString(input, 30);
    8000551c:	01e00593          	li	a1,30
    80005520:	00048513          	mv	a0,s1
    80005524:	00000097          	auipc	ra,0x0
    80005528:	648080e7          	jalr	1608(ra) # 80005b6c <_Z9getStringPci>
    n = stringToInt(input);
    8000552c:	00048513          	mv	a0,s1
    80005530:	00000097          	auipc	ra,0x0
    80005534:	714080e7          	jalr	1812(ra) # 80005c44 <_Z11stringToIntPKc>
    80005538:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    8000553c:	00005517          	auipc	a0,0x5
    80005540:	d0450513          	addi	a0,a0,-764 # 8000a240 <CONSOLE_STATUS+0x230>
    80005544:	00000097          	auipc	ra,0x0
    80005548:	5a0080e7          	jalr	1440(ra) # 80005ae4 <_Z11printStringPKc>
    8000554c:	00000613          	li	a2,0
    80005550:	00a00593          	li	a1,10
    80005554:	00090513          	mv	a0,s2
    80005558:	00000097          	auipc	ra,0x0
    8000555c:	73c080e7          	jalr	1852(ra) # 80005c94 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005560:	00005517          	auipc	a0,0x5
    80005564:	cf850513          	addi	a0,a0,-776 # 8000a258 <CONSOLE_STATUS+0x248>
    80005568:	00000097          	auipc	ra,0x0
    8000556c:	57c080e7          	jalr	1404(ra) # 80005ae4 <_Z11printStringPKc>
    80005570:	00000613          	li	a2,0
    80005574:	00a00593          	li	a1,10
    80005578:	00048513          	mv	a0,s1
    8000557c:	00000097          	auipc	ra,0x0
    80005580:	718080e7          	jalr	1816(ra) # 80005c94 <_Z8printIntiii>
    printString(".\n");
    80005584:	00005517          	auipc	a0,0x5
    80005588:	cec50513          	addi	a0,a0,-788 # 8000a270 <CONSOLE_STATUS+0x260>
    8000558c:	00000097          	auipc	ra,0x0
    80005590:	558080e7          	jalr	1368(ra) # 80005ae4 <_Z11printStringPKc>
    if(threadNum > n) {
    80005594:	0324c463          	blt	s1,s2,800055bc <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005598:	03205c63          	blez	s2,800055d0 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000559c:	03800513          	li	a0,56
    800055a0:	ffffd097          	auipc	ra,0xffffd
    800055a4:	2f4080e7          	jalr	756(ra) # 80002894 <_Znwm>
    800055a8:	00050a93          	mv	s5,a0
    800055ac:	00048593          	mv	a1,s1
    800055b0:	00001097          	auipc	ra,0x1
    800055b4:	804080e7          	jalr	-2044(ra) # 80005db4 <_ZN9BufferCPPC1Ei>
    800055b8:	0300006f          	j	800055e8 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800055bc:	00005517          	auipc	a0,0x5
    800055c0:	cbc50513          	addi	a0,a0,-836 # 8000a278 <CONSOLE_STATUS+0x268>
    800055c4:	00000097          	auipc	ra,0x0
    800055c8:	520080e7          	jalr	1312(ra) # 80005ae4 <_Z11printStringPKc>
        return;
    800055cc:	0140006f          	j	800055e0 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800055d0:	00005517          	auipc	a0,0x5
    800055d4:	ce850513          	addi	a0,a0,-792 # 8000a2b8 <CONSOLE_STATUS+0x2a8>
    800055d8:	00000097          	auipc	ra,0x0
    800055dc:	50c080e7          	jalr	1292(ra) # 80005ae4 <_Z11printStringPKc>
        return;
    800055e0:	000b8113          	mv	sp,s7
    800055e4:	2380006f          	j	8000581c <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800055e8:	01000513          	li	a0,16
    800055ec:	ffffd097          	auipc	ra,0xffffd
    800055f0:	2a8080e7          	jalr	680(ra) # 80002894 <_Znwm>
    800055f4:	00050493          	mv	s1,a0
    800055f8:	00000593          	li	a1,0
    800055fc:	ffffd097          	auipc	ra,0xffffd
    80005600:	5ec080e7          	jalr	1516(ra) # 80002be8 <_ZN9SemaphoreC1Ej>
    80005604:	00008797          	auipc	a5,0x8
    80005608:	8697ba23          	sd	s1,-1932(a5) # 8000ce78 <_ZL10waitForAll>
    Thread* threads[threadNum];
    8000560c:	00391793          	slli	a5,s2,0x3
    80005610:	00f78793          	addi	a5,a5,15
    80005614:	ff07f793          	andi	a5,a5,-16
    80005618:	40f10133          	sub	sp,sp,a5
    8000561c:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005620:	0019071b          	addiw	a4,s2,1
    80005624:	00171793          	slli	a5,a4,0x1
    80005628:	00e787b3          	add	a5,a5,a4
    8000562c:	00379793          	slli	a5,a5,0x3
    80005630:	00f78793          	addi	a5,a5,15
    80005634:	ff07f793          	andi	a5,a5,-16
    80005638:	40f10133          	sub	sp,sp,a5
    8000563c:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005640:	00191c13          	slli	s8,s2,0x1
    80005644:	012c07b3          	add	a5,s8,s2
    80005648:	00379793          	slli	a5,a5,0x3
    8000564c:	00fa07b3          	add	a5,s4,a5
    80005650:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005654:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005658:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    8000565c:	02800513          	li	a0,40
    80005660:	ffffd097          	auipc	ra,0xffffd
    80005664:	234080e7          	jalr	564(ra) # 80002894 <_Znwm>
    80005668:	00050b13          	mv	s6,a0
    8000566c:	012c0c33          	add	s8,s8,s2
    80005670:	003c1c13          	slli	s8,s8,0x3
    80005674:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005678:	ffffd097          	auipc	ra,0xffffd
    8000567c:	4f4080e7          	jalr	1268(ra) # 80002b6c <_ZN6ThreadC1Ev>
    80005680:	00007797          	auipc	a5,0x7
    80005684:	54878793          	addi	a5,a5,1352 # 8000cbc8 <_ZTV12ConsumerSync+0x10>
    80005688:	00fb3023          	sd	a5,0(s6)
    8000568c:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005690:	000b0513          	mv	a0,s6
    80005694:	ffffd097          	auipc	ra,0xffffd
    80005698:	3b8080e7          	jalr	952(ra) # 80002a4c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000569c:	00000493          	li	s1,0
    800056a0:	0380006f          	j	800056d8 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800056a4:	00007797          	auipc	a5,0x7
    800056a8:	4fc78793          	addi	a5,a5,1276 # 8000cba0 <_ZTV12ProducerSync+0x10>
    800056ac:	00fcb023          	sd	a5,0(s9)
    800056b0:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    800056b4:	00349793          	slli	a5,s1,0x3
    800056b8:	00f987b3          	add	a5,s3,a5
    800056bc:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800056c0:	00349793          	slli	a5,s1,0x3
    800056c4:	00f987b3          	add	a5,s3,a5
    800056c8:	0007b503          	ld	a0,0(a5)
    800056cc:	ffffd097          	auipc	ra,0xffffd
    800056d0:	380080e7          	jalr	896(ra) # 80002a4c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800056d4:	0014849b          	addiw	s1,s1,1
    800056d8:	0b24d063          	bge	s1,s2,80005778 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800056dc:	00149793          	slli	a5,s1,0x1
    800056e0:	009787b3          	add	a5,a5,s1
    800056e4:	00379793          	slli	a5,a5,0x3
    800056e8:	00fa07b3          	add	a5,s4,a5
    800056ec:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800056f0:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800056f4:	00007717          	auipc	a4,0x7
    800056f8:	78473703          	ld	a4,1924(a4) # 8000ce78 <_ZL10waitForAll>
    800056fc:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005700:	02905863          	blez	s1,80005730 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005704:	02800513          	li	a0,40
    80005708:	ffffd097          	auipc	ra,0xffffd
    8000570c:	18c080e7          	jalr	396(ra) # 80002894 <_Znwm>
    80005710:	00050c93          	mv	s9,a0
    80005714:	00149c13          	slli	s8,s1,0x1
    80005718:	009c0c33          	add	s8,s8,s1
    8000571c:	003c1c13          	slli	s8,s8,0x3
    80005720:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005724:	ffffd097          	auipc	ra,0xffffd
    80005728:	448080e7          	jalr	1096(ra) # 80002b6c <_ZN6ThreadC1Ev>
    8000572c:	f79ff06f          	j	800056a4 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005730:	02800513          	li	a0,40
    80005734:	ffffd097          	auipc	ra,0xffffd
    80005738:	160080e7          	jalr	352(ra) # 80002894 <_Znwm>
    8000573c:	00050c93          	mv	s9,a0
    80005740:	00149c13          	slli	s8,s1,0x1
    80005744:	009c0c33          	add	s8,s8,s1
    80005748:	003c1c13          	slli	s8,s8,0x3
    8000574c:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005750:	ffffd097          	auipc	ra,0xffffd
    80005754:	41c080e7          	jalr	1052(ra) # 80002b6c <_ZN6ThreadC1Ev>
    80005758:	00007797          	auipc	a5,0x7
    8000575c:	42078793          	addi	a5,a5,1056 # 8000cb78 <_ZTV16ProducerKeyboard+0x10>
    80005760:	00fcb023          	sd	a5,0(s9)
    80005764:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005768:	00349793          	slli	a5,s1,0x3
    8000576c:	00f987b3          	add	a5,s3,a5
    80005770:	0197b023          	sd	s9,0(a5)
    80005774:	f4dff06f          	j	800056c0 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005778:	ffffd097          	auipc	ra,0xffffd
    8000577c:	338080e7          	jalr	824(ra) # 80002ab0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005780:	00000493          	li	s1,0
    80005784:	00994e63          	blt	s2,s1,800057a0 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005788:	00007517          	auipc	a0,0x7
    8000578c:	6f053503          	ld	a0,1776(a0) # 8000ce78 <_ZL10waitForAll>
    80005790:	ffffd097          	auipc	ra,0xffffd
    80005794:	490080e7          	jalr	1168(ra) # 80002c20 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005798:	0014849b          	addiw	s1,s1,1
    8000579c:	fe9ff06f          	j	80005784 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    800057a0:	00000493          	li	s1,0
    800057a4:	0080006f          	j	800057ac <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    800057a8:	0014849b          	addiw	s1,s1,1
    800057ac:	0324d263          	bge	s1,s2,800057d0 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    800057b0:	00349793          	slli	a5,s1,0x3
    800057b4:	00f987b3          	add	a5,s3,a5
    800057b8:	0007b503          	ld	a0,0(a5)
    800057bc:	fe0506e3          	beqz	a0,800057a8 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800057c0:	00053783          	ld	a5,0(a0)
    800057c4:	0087b783          	ld	a5,8(a5)
    800057c8:	000780e7          	jalr	a5
    800057cc:	fddff06f          	j	800057a8 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800057d0:	000b0a63          	beqz	s6,800057e4 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800057d4:	000b3783          	ld	a5,0(s6)
    800057d8:	0087b783          	ld	a5,8(a5)
    800057dc:	000b0513          	mv	a0,s6
    800057e0:	000780e7          	jalr	a5
    delete waitForAll;
    800057e4:	00007517          	auipc	a0,0x7
    800057e8:	69453503          	ld	a0,1684(a0) # 8000ce78 <_ZL10waitForAll>
    800057ec:	00050863          	beqz	a0,800057fc <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800057f0:	00053783          	ld	a5,0(a0)
    800057f4:	0087b783          	ld	a5,8(a5)
    800057f8:	000780e7          	jalr	a5
    delete buffer;
    800057fc:	000a8e63          	beqz	s5,80005818 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005800:	000a8513          	mv	a0,s5
    80005804:	00001097          	auipc	ra,0x1
    80005808:	8a8080e7          	jalr	-1880(ra) # 800060ac <_ZN9BufferCPPD1Ev>
    8000580c:	000a8513          	mv	a0,s5
    80005810:	ffffd097          	auipc	ra,0xffffd
    80005814:	0d4080e7          	jalr	212(ra) # 800028e4 <_ZdlPv>
    80005818:	000b8113          	mv	sp,s7

}
    8000581c:	f8040113          	addi	sp,s0,-128
    80005820:	07813083          	ld	ra,120(sp)
    80005824:	07013403          	ld	s0,112(sp)
    80005828:	06813483          	ld	s1,104(sp)
    8000582c:	06013903          	ld	s2,96(sp)
    80005830:	05813983          	ld	s3,88(sp)
    80005834:	05013a03          	ld	s4,80(sp)
    80005838:	04813a83          	ld	s5,72(sp)
    8000583c:	04013b03          	ld	s6,64(sp)
    80005840:	03813b83          	ld	s7,56(sp)
    80005844:	03013c03          	ld	s8,48(sp)
    80005848:	02813c83          	ld	s9,40(sp)
    8000584c:	08010113          	addi	sp,sp,128
    80005850:	00008067          	ret
    80005854:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005858:	000a8513          	mv	a0,s5
    8000585c:	ffffd097          	auipc	ra,0xffffd
    80005860:	088080e7          	jalr	136(ra) # 800028e4 <_ZdlPv>
    80005864:	00048513          	mv	a0,s1
    80005868:	00008097          	auipc	ra,0x8
    8000586c:	710080e7          	jalr	1808(ra) # 8000df78 <_Unwind_Resume>
    80005870:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005874:	00048513          	mv	a0,s1
    80005878:	ffffd097          	auipc	ra,0xffffd
    8000587c:	06c080e7          	jalr	108(ra) # 800028e4 <_ZdlPv>
    80005880:	00090513          	mv	a0,s2
    80005884:	00008097          	auipc	ra,0x8
    80005888:	6f4080e7          	jalr	1780(ra) # 8000df78 <_Unwind_Resume>
    8000588c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005890:	000b0513          	mv	a0,s6
    80005894:	ffffd097          	auipc	ra,0xffffd
    80005898:	050080e7          	jalr	80(ra) # 800028e4 <_ZdlPv>
    8000589c:	00048513          	mv	a0,s1
    800058a0:	00008097          	auipc	ra,0x8
    800058a4:	6d8080e7          	jalr	1752(ra) # 8000df78 <_Unwind_Resume>
    800058a8:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    800058ac:	000c8513          	mv	a0,s9
    800058b0:	ffffd097          	auipc	ra,0xffffd
    800058b4:	034080e7          	jalr	52(ra) # 800028e4 <_ZdlPv>
    800058b8:	00048513          	mv	a0,s1
    800058bc:	00008097          	auipc	ra,0x8
    800058c0:	6bc080e7          	jalr	1724(ra) # 8000df78 <_Unwind_Resume>
    800058c4:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800058c8:	000c8513          	mv	a0,s9
    800058cc:	ffffd097          	auipc	ra,0xffffd
    800058d0:	018080e7          	jalr	24(ra) # 800028e4 <_ZdlPv>
    800058d4:	00048513          	mv	a0,s1
    800058d8:	00008097          	auipc	ra,0x8
    800058dc:	6a0080e7          	jalr	1696(ra) # 8000df78 <_Unwind_Resume>

00000000800058e0 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800058e0:	ff010113          	addi	sp,sp,-16
    800058e4:	00113423          	sd	ra,8(sp)
    800058e8:	00813023          	sd	s0,0(sp)
    800058ec:	01010413          	addi	s0,sp,16
    800058f0:	00007797          	auipc	a5,0x7
    800058f4:	2d878793          	addi	a5,a5,728 # 8000cbc8 <_ZTV12ConsumerSync+0x10>
    800058f8:	00f53023          	sd	a5,0(a0)
    800058fc:	ffffd097          	auipc	ra,0xffffd
    80005900:	ea8080e7          	jalr	-344(ra) # 800027a4 <_ZN6ThreadD1Ev>
    80005904:	00813083          	ld	ra,8(sp)
    80005908:	00013403          	ld	s0,0(sp)
    8000590c:	01010113          	addi	sp,sp,16
    80005910:	00008067          	ret

0000000080005914 <_ZN12ConsumerSyncD0Ev>:
    80005914:	fe010113          	addi	sp,sp,-32
    80005918:	00113c23          	sd	ra,24(sp)
    8000591c:	00813823          	sd	s0,16(sp)
    80005920:	00913423          	sd	s1,8(sp)
    80005924:	02010413          	addi	s0,sp,32
    80005928:	00050493          	mv	s1,a0
    8000592c:	00007797          	auipc	a5,0x7
    80005930:	29c78793          	addi	a5,a5,668 # 8000cbc8 <_ZTV12ConsumerSync+0x10>
    80005934:	00f53023          	sd	a5,0(a0)
    80005938:	ffffd097          	auipc	ra,0xffffd
    8000593c:	e6c080e7          	jalr	-404(ra) # 800027a4 <_ZN6ThreadD1Ev>
    80005940:	00048513          	mv	a0,s1
    80005944:	ffffd097          	auipc	ra,0xffffd
    80005948:	fa0080e7          	jalr	-96(ra) # 800028e4 <_ZdlPv>
    8000594c:	01813083          	ld	ra,24(sp)
    80005950:	01013403          	ld	s0,16(sp)
    80005954:	00813483          	ld	s1,8(sp)
    80005958:	02010113          	addi	sp,sp,32
    8000595c:	00008067          	ret

0000000080005960 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005960:	ff010113          	addi	sp,sp,-16
    80005964:	00113423          	sd	ra,8(sp)
    80005968:	00813023          	sd	s0,0(sp)
    8000596c:	01010413          	addi	s0,sp,16
    80005970:	00007797          	auipc	a5,0x7
    80005974:	23078793          	addi	a5,a5,560 # 8000cba0 <_ZTV12ProducerSync+0x10>
    80005978:	00f53023          	sd	a5,0(a0)
    8000597c:	ffffd097          	auipc	ra,0xffffd
    80005980:	e28080e7          	jalr	-472(ra) # 800027a4 <_ZN6ThreadD1Ev>
    80005984:	00813083          	ld	ra,8(sp)
    80005988:	00013403          	ld	s0,0(sp)
    8000598c:	01010113          	addi	sp,sp,16
    80005990:	00008067          	ret

0000000080005994 <_ZN12ProducerSyncD0Ev>:
    80005994:	fe010113          	addi	sp,sp,-32
    80005998:	00113c23          	sd	ra,24(sp)
    8000599c:	00813823          	sd	s0,16(sp)
    800059a0:	00913423          	sd	s1,8(sp)
    800059a4:	02010413          	addi	s0,sp,32
    800059a8:	00050493          	mv	s1,a0
    800059ac:	00007797          	auipc	a5,0x7
    800059b0:	1f478793          	addi	a5,a5,500 # 8000cba0 <_ZTV12ProducerSync+0x10>
    800059b4:	00f53023          	sd	a5,0(a0)
    800059b8:	ffffd097          	auipc	ra,0xffffd
    800059bc:	dec080e7          	jalr	-532(ra) # 800027a4 <_ZN6ThreadD1Ev>
    800059c0:	00048513          	mv	a0,s1
    800059c4:	ffffd097          	auipc	ra,0xffffd
    800059c8:	f20080e7          	jalr	-224(ra) # 800028e4 <_ZdlPv>
    800059cc:	01813083          	ld	ra,24(sp)
    800059d0:	01013403          	ld	s0,16(sp)
    800059d4:	00813483          	ld	s1,8(sp)
    800059d8:	02010113          	addi	sp,sp,32
    800059dc:	00008067          	ret

00000000800059e0 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800059e0:	ff010113          	addi	sp,sp,-16
    800059e4:	00113423          	sd	ra,8(sp)
    800059e8:	00813023          	sd	s0,0(sp)
    800059ec:	01010413          	addi	s0,sp,16
    800059f0:	00007797          	auipc	a5,0x7
    800059f4:	18878793          	addi	a5,a5,392 # 8000cb78 <_ZTV16ProducerKeyboard+0x10>
    800059f8:	00f53023          	sd	a5,0(a0)
    800059fc:	ffffd097          	auipc	ra,0xffffd
    80005a00:	da8080e7          	jalr	-600(ra) # 800027a4 <_ZN6ThreadD1Ev>
    80005a04:	00813083          	ld	ra,8(sp)
    80005a08:	00013403          	ld	s0,0(sp)
    80005a0c:	01010113          	addi	sp,sp,16
    80005a10:	00008067          	ret

0000000080005a14 <_ZN16ProducerKeyboardD0Ev>:
    80005a14:	fe010113          	addi	sp,sp,-32
    80005a18:	00113c23          	sd	ra,24(sp)
    80005a1c:	00813823          	sd	s0,16(sp)
    80005a20:	00913423          	sd	s1,8(sp)
    80005a24:	02010413          	addi	s0,sp,32
    80005a28:	00050493          	mv	s1,a0
    80005a2c:	00007797          	auipc	a5,0x7
    80005a30:	14c78793          	addi	a5,a5,332 # 8000cb78 <_ZTV16ProducerKeyboard+0x10>
    80005a34:	00f53023          	sd	a5,0(a0)
    80005a38:	ffffd097          	auipc	ra,0xffffd
    80005a3c:	d6c080e7          	jalr	-660(ra) # 800027a4 <_ZN6ThreadD1Ev>
    80005a40:	00048513          	mv	a0,s1
    80005a44:	ffffd097          	auipc	ra,0xffffd
    80005a48:	ea0080e7          	jalr	-352(ra) # 800028e4 <_ZdlPv>
    80005a4c:	01813083          	ld	ra,24(sp)
    80005a50:	01013403          	ld	s0,16(sp)
    80005a54:	00813483          	ld	s1,8(sp)
    80005a58:	02010113          	addi	sp,sp,32
    80005a5c:	00008067          	ret

0000000080005a60 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005a60:	ff010113          	addi	sp,sp,-16
    80005a64:	00113423          	sd	ra,8(sp)
    80005a68:	00813023          	sd	s0,0(sp)
    80005a6c:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005a70:	02053583          	ld	a1,32(a0)
    80005a74:	fffff097          	auipc	ra,0xfffff
    80005a78:	7e4080e7          	jalr	2020(ra) # 80005258 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005a7c:	00813083          	ld	ra,8(sp)
    80005a80:	00013403          	ld	s0,0(sp)
    80005a84:	01010113          	addi	sp,sp,16
    80005a88:	00008067          	ret

0000000080005a8c <_ZN12ProducerSync3runEv>:
    void run() override {
    80005a8c:	ff010113          	addi	sp,sp,-16
    80005a90:	00113423          	sd	ra,8(sp)
    80005a94:	00813023          	sd	s0,0(sp)
    80005a98:	01010413          	addi	s0,sp,16
        producer(td);
    80005a9c:	02053583          	ld	a1,32(a0)
    80005aa0:	00000097          	auipc	ra,0x0
    80005aa4:	878080e7          	jalr	-1928(ra) # 80005318 <_ZN12ProducerSync8producerEPv>
    }
    80005aa8:	00813083          	ld	ra,8(sp)
    80005aac:	00013403          	ld	s0,0(sp)
    80005ab0:	01010113          	addi	sp,sp,16
    80005ab4:	00008067          	ret

0000000080005ab8 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005ab8:	ff010113          	addi	sp,sp,-16
    80005abc:	00113423          	sd	ra,8(sp)
    80005ac0:	00813023          	sd	s0,0(sp)
    80005ac4:	01010413          	addi	s0,sp,16
        consumer(td);
    80005ac8:	02053583          	ld	a1,32(a0)
    80005acc:	00000097          	auipc	ra,0x0
    80005ad0:	8e0080e7          	jalr	-1824(ra) # 800053ac <_ZN12ConsumerSync8consumerEPv>
    }
    80005ad4:	00813083          	ld	ra,8(sp)
    80005ad8:	00013403          	ld	s0,0(sp)
    80005adc:	01010113          	addi	sp,sp,16
    80005ae0:	00008067          	ret

0000000080005ae4 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005ae4:	fe010113          	addi	sp,sp,-32
    80005ae8:	00113c23          	sd	ra,24(sp)
    80005aec:	00813823          	sd	s0,16(sp)
    80005af0:	00913423          	sd	s1,8(sp)
    80005af4:	02010413          	addi	s0,sp,32
    80005af8:	00050493          	mv	s1,a0
    LOCK();
    80005afc:	00100613          	li	a2,1
    80005b00:	00000593          	li	a1,0
    80005b04:	00007517          	auipc	a0,0x7
    80005b08:	37c50513          	addi	a0,a0,892 # 8000ce80 <lockPrint>
    80005b0c:	ffffb097          	auipc	ra,0xffffb
    80005b10:	618080e7          	jalr	1560(ra) # 80001124 <copy_and_swap>
    80005b14:	00050863          	beqz	a0,80005b24 <_Z11printStringPKc+0x40>
    80005b18:	ffffc097          	auipc	ra,0xffffc
    80005b1c:	91c080e7          	jalr	-1764(ra) # 80001434 <_Z15thread_dispatchv>
    80005b20:	fddff06f          	j	80005afc <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005b24:	0004c503          	lbu	a0,0(s1)
    80005b28:	00050a63          	beqz	a0,80005b3c <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005b2c:	ffffc097          	auipc	ra,0xffffc
    80005b30:	a70080e7          	jalr	-1424(ra) # 8000159c <_Z4putcc>
        string++;
    80005b34:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005b38:	fedff06f          	j	80005b24 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005b3c:	00000613          	li	a2,0
    80005b40:	00100593          	li	a1,1
    80005b44:	00007517          	auipc	a0,0x7
    80005b48:	33c50513          	addi	a0,a0,828 # 8000ce80 <lockPrint>
    80005b4c:	ffffb097          	auipc	ra,0xffffb
    80005b50:	5d8080e7          	jalr	1496(ra) # 80001124 <copy_and_swap>
    80005b54:	fe0514e3          	bnez	a0,80005b3c <_Z11printStringPKc+0x58>
}
    80005b58:	01813083          	ld	ra,24(sp)
    80005b5c:	01013403          	ld	s0,16(sp)
    80005b60:	00813483          	ld	s1,8(sp)
    80005b64:	02010113          	addi	sp,sp,32
    80005b68:	00008067          	ret

0000000080005b6c <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005b6c:	fd010113          	addi	sp,sp,-48
    80005b70:	02113423          	sd	ra,40(sp)
    80005b74:	02813023          	sd	s0,32(sp)
    80005b78:	00913c23          	sd	s1,24(sp)
    80005b7c:	01213823          	sd	s2,16(sp)
    80005b80:	01313423          	sd	s3,8(sp)
    80005b84:	01413023          	sd	s4,0(sp)
    80005b88:	03010413          	addi	s0,sp,48
    80005b8c:	00050993          	mv	s3,a0
    80005b90:	00058a13          	mv	s4,a1
    LOCK();
    80005b94:	00100613          	li	a2,1
    80005b98:	00000593          	li	a1,0
    80005b9c:	00007517          	auipc	a0,0x7
    80005ba0:	2e450513          	addi	a0,a0,740 # 8000ce80 <lockPrint>
    80005ba4:	ffffb097          	auipc	ra,0xffffb
    80005ba8:	580080e7          	jalr	1408(ra) # 80001124 <copy_and_swap>
    80005bac:	00050863          	beqz	a0,80005bbc <_Z9getStringPci+0x50>
    80005bb0:	ffffc097          	auipc	ra,0xffffc
    80005bb4:	884080e7          	jalr	-1916(ra) # 80001434 <_Z15thread_dispatchv>
    80005bb8:	fddff06f          	j	80005b94 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005bbc:	00000913          	li	s2,0
    80005bc0:	00090493          	mv	s1,s2
    80005bc4:	0019091b          	addiw	s2,s2,1
    80005bc8:	03495a63          	bge	s2,s4,80005bfc <_Z9getStringPci+0x90>
        cc = getc();
    80005bcc:	ffffc097          	auipc	ra,0xffffc
    80005bd0:	9a8080e7          	jalr	-1624(ra) # 80001574 <_Z4getcv>
        if(cc < 1)
    80005bd4:	02050463          	beqz	a0,80005bfc <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005bd8:	009984b3          	add	s1,s3,s1
    80005bdc:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005be0:	00a00793          	li	a5,10
    80005be4:	00f50a63          	beq	a0,a5,80005bf8 <_Z9getStringPci+0x8c>
    80005be8:	00d00793          	li	a5,13
    80005bec:	fcf51ae3          	bne	a0,a5,80005bc0 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005bf0:	00090493          	mv	s1,s2
    80005bf4:	0080006f          	j	80005bfc <_Z9getStringPci+0x90>
    80005bf8:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005bfc:	009984b3          	add	s1,s3,s1
    80005c00:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005c04:	00000613          	li	a2,0
    80005c08:	00100593          	li	a1,1
    80005c0c:	00007517          	auipc	a0,0x7
    80005c10:	27450513          	addi	a0,a0,628 # 8000ce80 <lockPrint>
    80005c14:	ffffb097          	auipc	ra,0xffffb
    80005c18:	510080e7          	jalr	1296(ra) # 80001124 <copy_and_swap>
    80005c1c:	fe0514e3          	bnez	a0,80005c04 <_Z9getStringPci+0x98>
    return buf;
}
    80005c20:	00098513          	mv	a0,s3
    80005c24:	02813083          	ld	ra,40(sp)
    80005c28:	02013403          	ld	s0,32(sp)
    80005c2c:	01813483          	ld	s1,24(sp)
    80005c30:	01013903          	ld	s2,16(sp)
    80005c34:	00813983          	ld	s3,8(sp)
    80005c38:	00013a03          	ld	s4,0(sp)
    80005c3c:	03010113          	addi	sp,sp,48
    80005c40:	00008067          	ret

0000000080005c44 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005c44:	ff010113          	addi	sp,sp,-16
    80005c48:	00813423          	sd	s0,8(sp)
    80005c4c:	01010413          	addi	s0,sp,16
    80005c50:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005c54:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005c58:	0006c603          	lbu	a2,0(a3)
    80005c5c:	fd06071b          	addiw	a4,a2,-48
    80005c60:	0ff77713          	andi	a4,a4,255
    80005c64:	00900793          	li	a5,9
    80005c68:	02e7e063          	bltu	a5,a4,80005c88 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005c6c:	0025179b          	slliw	a5,a0,0x2
    80005c70:	00a787bb          	addw	a5,a5,a0
    80005c74:	0017979b          	slliw	a5,a5,0x1
    80005c78:	00168693          	addi	a3,a3,1
    80005c7c:	00c787bb          	addw	a5,a5,a2
    80005c80:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005c84:	fd5ff06f          	j	80005c58 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005c88:	00813403          	ld	s0,8(sp)
    80005c8c:	01010113          	addi	sp,sp,16
    80005c90:	00008067          	ret

0000000080005c94 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005c94:	fc010113          	addi	sp,sp,-64
    80005c98:	02113c23          	sd	ra,56(sp)
    80005c9c:	02813823          	sd	s0,48(sp)
    80005ca0:	02913423          	sd	s1,40(sp)
    80005ca4:	03213023          	sd	s2,32(sp)
    80005ca8:	01313c23          	sd	s3,24(sp)
    80005cac:	04010413          	addi	s0,sp,64
    80005cb0:	00050493          	mv	s1,a0
    80005cb4:	00058913          	mv	s2,a1
    80005cb8:	00060993          	mv	s3,a2
    LOCK();
    80005cbc:	00100613          	li	a2,1
    80005cc0:	00000593          	li	a1,0
    80005cc4:	00007517          	auipc	a0,0x7
    80005cc8:	1bc50513          	addi	a0,a0,444 # 8000ce80 <lockPrint>
    80005ccc:	ffffb097          	auipc	ra,0xffffb
    80005cd0:	458080e7          	jalr	1112(ra) # 80001124 <copy_and_swap>
    80005cd4:	00050863          	beqz	a0,80005ce4 <_Z8printIntiii+0x50>
    80005cd8:	ffffb097          	auipc	ra,0xffffb
    80005cdc:	75c080e7          	jalr	1884(ra) # 80001434 <_Z15thread_dispatchv>
    80005ce0:	fddff06f          	j	80005cbc <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005ce4:	00098463          	beqz	s3,80005cec <_Z8printIntiii+0x58>
    80005ce8:	0804c463          	bltz	s1,80005d70 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005cec:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005cf0:	00000593          	li	a1,0
    }

    i = 0;
    80005cf4:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005cf8:	0009079b          	sext.w	a5,s2
    80005cfc:	0325773b          	remuw	a4,a0,s2
    80005d00:	00048613          	mv	a2,s1
    80005d04:	0014849b          	addiw	s1,s1,1
    80005d08:	02071693          	slli	a3,a4,0x20
    80005d0c:	0206d693          	srli	a3,a3,0x20
    80005d10:	00007717          	auipc	a4,0x7
    80005d14:	ed070713          	addi	a4,a4,-304 # 8000cbe0 <digits>
    80005d18:	00d70733          	add	a4,a4,a3
    80005d1c:	00074683          	lbu	a3,0(a4)
    80005d20:	fd040713          	addi	a4,s0,-48
    80005d24:	00c70733          	add	a4,a4,a2
    80005d28:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005d2c:	0005071b          	sext.w	a4,a0
    80005d30:	0325553b          	divuw	a0,a0,s2
    80005d34:	fcf772e3          	bgeu	a4,a5,80005cf8 <_Z8printIntiii+0x64>
    if(neg)
    80005d38:	00058c63          	beqz	a1,80005d50 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005d3c:	fd040793          	addi	a5,s0,-48
    80005d40:	009784b3          	add	s1,a5,s1
    80005d44:	02d00793          	li	a5,45
    80005d48:	fef48823          	sb	a5,-16(s1)
    80005d4c:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005d50:	fff4849b          	addiw	s1,s1,-1
    80005d54:	0204c463          	bltz	s1,80005d7c <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005d58:	fd040793          	addi	a5,s0,-48
    80005d5c:	009787b3          	add	a5,a5,s1
    80005d60:	ff07c503          	lbu	a0,-16(a5)
    80005d64:	ffffc097          	auipc	ra,0xffffc
    80005d68:	838080e7          	jalr	-1992(ra) # 8000159c <_Z4putcc>
    80005d6c:	fe5ff06f          	j	80005d50 <_Z8printIntiii+0xbc>
        x = -xx;
    80005d70:	4090053b          	negw	a0,s1
        neg = 1;
    80005d74:	00100593          	li	a1,1
        x = -xx;
    80005d78:	f7dff06f          	j	80005cf4 <_Z8printIntiii+0x60>

    UNLOCK();
    80005d7c:	00000613          	li	a2,0
    80005d80:	00100593          	li	a1,1
    80005d84:	00007517          	auipc	a0,0x7
    80005d88:	0fc50513          	addi	a0,a0,252 # 8000ce80 <lockPrint>
    80005d8c:	ffffb097          	auipc	ra,0xffffb
    80005d90:	398080e7          	jalr	920(ra) # 80001124 <copy_and_swap>
    80005d94:	fe0514e3          	bnez	a0,80005d7c <_Z8printIntiii+0xe8>
    80005d98:	03813083          	ld	ra,56(sp)
    80005d9c:	03013403          	ld	s0,48(sp)
    80005da0:	02813483          	ld	s1,40(sp)
    80005da4:	02013903          	ld	s2,32(sp)
    80005da8:	01813983          	ld	s3,24(sp)
    80005dac:	04010113          	addi	sp,sp,64
    80005db0:	00008067          	ret

0000000080005db4 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005db4:	fd010113          	addi	sp,sp,-48
    80005db8:	02113423          	sd	ra,40(sp)
    80005dbc:	02813023          	sd	s0,32(sp)
    80005dc0:	00913c23          	sd	s1,24(sp)
    80005dc4:	01213823          	sd	s2,16(sp)
    80005dc8:	01313423          	sd	s3,8(sp)
    80005dcc:	03010413          	addi	s0,sp,48
    80005dd0:	00050493          	mv	s1,a0
    80005dd4:	00058913          	mv	s2,a1
    80005dd8:	0015879b          	addiw	a5,a1,1
    80005ddc:	0007851b          	sext.w	a0,a5
    80005de0:	00f4a023          	sw	a5,0(s1)
    80005de4:	0004a823          	sw	zero,16(s1)
    80005de8:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005dec:	00251513          	slli	a0,a0,0x2
    80005df0:	ffffb097          	auipc	ra,0xffffb
    80005df4:	518080e7          	jalr	1304(ra) # 80001308 <_Z9mem_allocm>
    80005df8:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005dfc:	01000513          	li	a0,16
    80005e00:	ffffd097          	auipc	ra,0xffffd
    80005e04:	a94080e7          	jalr	-1388(ra) # 80002894 <_Znwm>
    80005e08:	00050993          	mv	s3,a0
    80005e0c:	00000593          	li	a1,0
    80005e10:	ffffd097          	auipc	ra,0xffffd
    80005e14:	dd8080e7          	jalr	-552(ra) # 80002be8 <_ZN9SemaphoreC1Ej>
    80005e18:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005e1c:	01000513          	li	a0,16
    80005e20:	ffffd097          	auipc	ra,0xffffd
    80005e24:	a74080e7          	jalr	-1420(ra) # 80002894 <_Znwm>
    80005e28:	00050993          	mv	s3,a0
    80005e2c:	00090593          	mv	a1,s2
    80005e30:	ffffd097          	auipc	ra,0xffffd
    80005e34:	db8080e7          	jalr	-584(ra) # 80002be8 <_ZN9SemaphoreC1Ej>
    80005e38:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005e3c:	01000513          	li	a0,16
    80005e40:	ffffd097          	auipc	ra,0xffffd
    80005e44:	a54080e7          	jalr	-1452(ra) # 80002894 <_Znwm>
    80005e48:	00050913          	mv	s2,a0
    80005e4c:	00100593          	li	a1,1
    80005e50:	ffffd097          	auipc	ra,0xffffd
    80005e54:	d98080e7          	jalr	-616(ra) # 80002be8 <_ZN9SemaphoreC1Ej>
    80005e58:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005e5c:	01000513          	li	a0,16
    80005e60:	ffffd097          	auipc	ra,0xffffd
    80005e64:	a34080e7          	jalr	-1484(ra) # 80002894 <_Znwm>
    80005e68:	00050913          	mv	s2,a0
    80005e6c:	00100593          	li	a1,1
    80005e70:	ffffd097          	auipc	ra,0xffffd
    80005e74:	d78080e7          	jalr	-648(ra) # 80002be8 <_ZN9SemaphoreC1Ej>
    80005e78:	0324b823          	sd	s2,48(s1)
}
    80005e7c:	02813083          	ld	ra,40(sp)
    80005e80:	02013403          	ld	s0,32(sp)
    80005e84:	01813483          	ld	s1,24(sp)
    80005e88:	01013903          	ld	s2,16(sp)
    80005e8c:	00813983          	ld	s3,8(sp)
    80005e90:	03010113          	addi	sp,sp,48
    80005e94:	00008067          	ret
    80005e98:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005e9c:	00098513          	mv	a0,s3
    80005ea0:	ffffd097          	auipc	ra,0xffffd
    80005ea4:	a44080e7          	jalr	-1468(ra) # 800028e4 <_ZdlPv>
    80005ea8:	00048513          	mv	a0,s1
    80005eac:	00008097          	auipc	ra,0x8
    80005eb0:	0cc080e7          	jalr	204(ra) # 8000df78 <_Unwind_Resume>
    80005eb4:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005eb8:	00098513          	mv	a0,s3
    80005ebc:	ffffd097          	auipc	ra,0xffffd
    80005ec0:	a28080e7          	jalr	-1496(ra) # 800028e4 <_ZdlPv>
    80005ec4:	00048513          	mv	a0,s1
    80005ec8:	00008097          	auipc	ra,0x8
    80005ecc:	0b0080e7          	jalr	176(ra) # 8000df78 <_Unwind_Resume>
    80005ed0:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005ed4:	00090513          	mv	a0,s2
    80005ed8:	ffffd097          	auipc	ra,0xffffd
    80005edc:	a0c080e7          	jalr	-1524(ra) # 800028e4 <_ZdlPv>
    80005ee0:	00048513          	mv	a0,s1
    80005ee4:	00008097          	auipc	ra,0x8
    80005ee8:	094080e7          	jalr	148(ra) # 8000df78 <_Unwind_Resume>
    80005eec:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005ef0:	00090513          	mv	a0,s2
    80005ef4:	ffffd097          	auipc	ra,0xffffd
    80005ef8:	9f0080e7          	jalr	-1552(ra) # 800028e4 <_ZdlPv>
    80005efc:	00048513          	mv	a0,s1
    80005f00:	00008097          	auipc	ra,0x8
    80005f04:	078080e7          	jalr	120(ra) # 8000df78 <_Unwind_Resume>

0000000080005f08 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005f08:	fe010113          	addi	sp,sp,-32
    80005f0c:	00113c23          	sd	ra,24(sp)
    80005f10:	00813823          	sd	s0,16(sp)
    80005f14:	00913423          	sd	s1,8(sp)
    80005f18:	01213023          	sd	s2,0(sp)
    80005f1c:	02010413          	addi	s0,sp,32
    80005f20:	00050493          	mv	s1,a0
    80005f24:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005f28:	01853503          	ld	a0,24(a0)
    80005f2c:	ffffd097          	auipc	ra,0xffffd
    80005f30:	cf4080e7          	jalr	-780(ra) # 80002c20 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005f34:	0304b503          	ld	a0,48(s1)
    80005f38:	ffffd097          	auipc	ra,0xffffd
    80005f3c:	ce8080e7          	jalr	-792(ra) # 80002c20 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005f40:	0084b783          	ld	a5,8(s1)
    80005f44:	0144a703          	lw	a4,20(s1)
    80005f48:	00271713          	slli	a4,a4,0x2
    80005f4c:	00e787b3          	add	a5,a5,a4
    80005f50:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005f54:	0144a783          	lw	a5,20(s1)
    80005f58:	0017879b          	addiw	a5,a5,1
    80005f5c:	0004a703          	lw	a4,0(s1)
    80005f60:	02e7e7bb          	remw	a5,a5,a4
    80005f64:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005f68:	0304b503          	ld	a0,48(s1)
    80005f6c:	ffffd097          	auipc	ra,0xffffd
    80005f70:	ce0080e7          	jalr	-800(ra) # 80002c4c <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005f74:	0204b503          	ld	a0,32(s1)
    80005f78:	ffffd097          	auipc	ra,0xffffd
    80005f7c:	cd4080e7          	jalr	-812(ra) # 80002c4c <_ZN9Semaphore6signalEv>

}
    80005f80:	01813083          	ld	ra,24(sp)
    80005f84:	01013403          	ld	s0,16(sp)
    80005f88:	00813483          	ld	s1,8(sp)
    80005f8c:	00013903          	ld	s2,0(sp)
    80005f90:	02010113          	addi	sp,sp,32
    80005f94:	00008067          	ret

0000000080005f98 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005f98:	fe010113          	addi	sp,sp,-32
    80005f9c:	00113c23          	sd	ra,24(sp)
    80005fa0:	00813823          	sd	s0,16(sp)
    80005fa4:	00913423          	sd	s1,8(sp)
    80005fa8:	01213023          	sd	s2,0(sp)
    80005fac:	02010413          	addi	s0,sp,32
    80005fb0:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005fb4:	02053503          	ld	a0,32(a0)
    80005fb8:	ffffd097          	auipc	ra,0xffffd
    80005fbc:	c68080e7          	jalr	-920(ra) # 80002c20 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005fc0:	0284b503          	ld	a0,40(s1)
    80005fc4:	ffffd097          	auipc	ra,0xffffd
    80005fc8:	c5c080e7          	jalr	-932(ra) # 80002c20 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005fcc:	0084b703          	ld	a4,8(s1)
    80005fd0:	0104a783          	lw	a5,16(s1)
    80005fd4:	00279693          	slli	a3,a5,0x2
    80005fd8:	00d70733          	add	a4,a4,a3
    80005fdc:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005fe0:	0017879b          	addiw	a5,a5,1
    80005fe4:	0004a703          	lw	a4,0(s1)
    80005fe8:	02e7e7bb          	remw	a5,a5,a4
    80005fec:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005ff0:	0284b503          	ld	a0,40(s1)
    80005ff4:	ffffd097          	auipc	ra,0xffffd
    80005ff8:	c58080e7          	jalr	-936(ra) # 80002c4c <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005ffc:	0184b503          	ld	a0,24(s1)
    80006000:	ffffd097          	auipc	ra,0xffffd
    80006004:	c4c080e7          	jalr	-948(ra) # 80002c4c <_ZN9Semaphore6signalEv>

    return ret;
}
    80006008:	00090513          	mv	a0,s2
    8000600c:	01813083          	ld	ra,24(sp)
    80006010:	01013403          	ld	s0,16(sp)
    80006014:	00813483          	ld	s1,8(sp)
    80006018:	00013903          	ld	s2,0(sp)
    8000601c:	02010113          	addi	sp,sp,32
    80006020:	00008067          	ret

0000000080006024 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006024:	fe010113          	addi	sp,sp,-32
    80006028:	00113c23          	sd	ra,24(sp)
    8000602c:	00813823          	sd	s0,16(sp)
    80006030:	00913423          	sd	s1,8(sp)
    80006034:	01213023          	sd	s2,0(sp)
    80006038:	02010413          	addi	s0,sp,32
    8000603c:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006040:	02853503          	ld	a0,40(a0)
    80006044:	ffffd097          	auipc	ra,0xffffd
    80006048:	bdc080e7          	jalr	-1060(ra) # 80002c20 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    8000604c:	0304b503          	ld	a0,48(s1)
    80006050:	ffffd097          	auipc	ra,0xffffd
    80006054:	bd0080e7          	jalr	-1072(ra) # 80002c20 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006058:	0144a783          	lw	a5,20(s1)
    8000605c:	0104a903          	lw	s2,16(s1)
    80006060:	0327ce63          	blt	a5,s2,8000609c <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006064:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006068:	0304b503          	ld	a0,48(s1)
    8000606c:	ffffd097          	auipc	ra,0xffffd
    80006070:	be0080e7          	jalr	-1056(ra) # 80002c4c <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006074:	0284b503          	ld	a0,40(s1)
    80006078:	ffffd097          	auipc	ra,0xffffd
    8000607c:	bd4080e7          	jalr	-1068(ra) # 80002c4c <_ZN9Semaphore6signalEv>

    return ret;
}
    80006080:	00090513          	mv	a0,s2
    80006084:	01813083          	ld	ra,24(sp)
    80006088:	01013403          	ld	s0,16(sp)
    8000608c:	00813483          	ld	s1,8(sp)
    80006090:	00013903          	ld	s2,0(sp)
    80006094:	02010113          	addi	sp,sp,32
    80006098:	00008067          	ret
        ret = cap - head + tail;
    8000609c:	0004a703          	lw	a4,0(s1)
    800060a0:	4127093b          	subw	s2,a4,s2
    800060a4:	00f9093b          	addw	s2,s2,a5
    800060a8:	fc1ff06f          	j	80006068 <_ZN9BufferCPP6getCntEv+0x44>

00000000800060ac <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800060ac:	fe010113          	addi	sp,sp,-32
    800060b0:	00113c23          	sd	ra,24(sp)
    800060b4:	00813823          	sd	s0,16(sp)
    800060b8:	00913423          	sd	s1,8(sp)
    800060bc:	02010413          	addi	s0,sp,32
    800060c0:	00050493          	mv	s1,a0
    Console::putc('\n');
    800060c4:	00a00513          	li	a0,10
    800060c8:	ffffd097          	auipc	ra,0xffffd
    800060cc:	c48080e7          	jalr	-952(ra) # 80002d10 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800060d0:	00004517          	auipc	a0,0x4
    800060d4:	32050513          	addi	a0,a0,800 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    800060d8:	00000097          	auipc	ra,0x0
    800060dc:	a0c080e7          	jalr	-1524(ra) # 80005ae4 <_Z11printStringPKc>
    while (getCnt()) {
    800060e0:	00048513          	mv	a0,s1
    800060e4:	00000097          	auipc	ra,0x0
    800060e8:	f40080e7          	jalr	-192(ra) # 80006024 <_ZN9BufferCPP6getCntEv>
    800060ec:	02050c63          	beqz	a0,80006124 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800060f0:	0084b783          	ld	a5,8(s1)
    800060f4:	0104a703          	lw	a4,16(s1)
    800060f8:	00271713          	slli	a4,a4,0x2
    800060fc:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006100:	0007c503          	lbu	a0,0(a5)
    80006104:	ffffd097          	auipc	ra,0xffffd
    80006108:	c0c080e7          	jalr	-1012(ra) # 80002d10 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    8000610c:	0104a783          	lw	a5,16(s1)
    80006110:	0017879b          	addiw	a5,a5,1
    80006114:	0004a703          	lw	a4,0(s1)
    80006118:	02e7e7bb          	remw	a5,a5,a4
    8000611c:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006120:	fc1ff06f          	j	800060e0 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006124:	02100513          	li	a0,33
    80006128:	ffffd097          	auipc	ra,0xffffd
    8000612c:	be8080e7          	jalr	-1048(ra) # 80002d10 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006130:	00a00513          	li	a0,10
    80006134:	ffffd097          	auipc	ra,0xffffd
    80006138:	bdc080e7          	jalr	-1060(ra) # 80002d10 <_ZN7Console4putcEc>
    mem_free(buffer);
    8000613c:	0084b503          	ld	a0,8(s1)
    80006140:	ffffb097          	auipc	ra,0xffffb
    80006144:	208080e7          	jalr	520(ra) # 80001348 <_Z8mem_freePv>
    delete itemAvailable;
    80006148:	0204b503          	ld	a0,32(s1)
    8000614c:	00050863          	beqz	a0,8000615c <_ZN9BufferCPPD1Ev+0xb0>
    80006150:	00053783          	ld	a5,0(a0)
    80006154:	0087b783          	ld	a5,8(a5)
    80006158:	000780e7          	jalr	a5
    delete spaceAvailable;
    8000615c:	0184b503          	ld	a0,24(s1)
    80006160:	00050863          	beqz	a0,80006170 <_ZN9BufferCPPD1Ev+0xc4>
    80006164:	00053783          	ld	a5,0(a0)
    80006168:	0087b783          	ld	a5,8(a5)
    8000616c:	000780e7          	jalr	a5
    delete mutexTail;
    80006170:	0304b503          	ld	a0,48(s1)
    80006174:	00050863          	beqz	a0,80006184 <_ZN9BufferCPPD1Ev+0xd8>
    80006178:	00053783          	ld	a5,0(a0)
    8000617c:	0087b783          	ld	a5,8(a5)
    80006180:	000780e7          	jalr	a5
    delete mutexHead;
    80006184:	0284b503          	ld	a0,40(s1)
    80006188:	00050863          	beqz	a0,80006198 <_ZN9BufferCPPD1Ev+0xec>
    8000618c:	00053783          	ld	a5,0(a0)
    80006190:	0087b783          	ld	a5,8(a5)
    80006194:	000780e7          	jalr	a5
}
    80006198:	01813083          	ld	ra,24(sp)
    8000619c:	01013403          	ld	s0,16(sp)
    800061a0:	00813483          	ld	s1,8(sp)
    800061a4:	02010113          	addi	sp,sp,32
    800061a8:	00008067          	ret

00000000800061ac <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    800061ac:	fe010113          	addi	sp,sp,-32
    800061b0:	00113c23          	sd	ra,24(sp)
    800061b4:	00813823          	sd	s0,16(sp)
    800061b8:	00913423          	sd	s1,8(sp)
    800061bc:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    800061c0:	00004517          	auipc	a0,0x4
    800061c4:	24850513          	addi	a0,a0,584 # 8000a408 <CONSOLE_STATUS+0x3f8>
    800061c8:	00000097          	auipc	ra,0x0
    800061cc:	91c080e7          	jalr	-1764(ra) # 80005ae4 <_Z11printStringPKc>
    int test = getc() - '0';
    800061d0:	ffffb097          	auipc	ra,0xffffb
    800061d4:	3a4080e7          	jalr	932(ra) # 80001574 <_Z4getcv>
    800061d8:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800061dc:	ffffb097          	auipc	ra,0xffffb
    800061e0:	398080e7          	jalr	920(ra) # 80001574 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800061e4:	00700793          	li	a5,7
    800061e8:	1097e263          	bltu	a5,s1,800062ec <_Z8userMainv+0x140>
    800061ec:	00249493          	slli	s1,s1,0x2
    800061f0:	00004717          	auipc	a4,0x4
    800061f4:	47070713          	addi	a4,a4,1136 # 8000a660 <CONSOLE_STATUS+0x650>
    800061f8:	00e484b3          	add	s1,s1,a4
    800061fc:	0004a783          	lw	a5,0(s1)
    80006200:	00e787b3          	add	a5,a5,a4
    80006204:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80006208:	fffff097          	auipc	ra,0xfffff
    8000620c:	f54080e7          	jalr	-172(ra) # 8000515c <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006210:	00004517          	auipc	a0,0x4
    80006214:	21850513          	addi	a0,a0,536 # 8000a428 <CONSOLE_STATUS+0x418>
    80006218:	00000097          	auipc	ra,0x0
    8000621c:	8cc080e7          	jalr	-1844(ra) # 80005ae4 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006220:	01813083          	ld	ra,24(sp)
    80006224:	01013403          	ld	s0,16(sp)
    80006228:	00813483          	ld	s1,8(sp)
    8000622c:	02010113          	addi	sp,sp,32
    80006230:	00008067          	ret
            Threads_CPP_API_test();
    80006234:	ffffe097          	auipc	ra,0xffffe
    80006238:	e08080e7          	jalr	-504(ra) # 8000403c <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    8000623c:	00004517          	auipc	a0,0x4
    80006240:	22c50513          	addi	a0,a0,556 # 8000a468 <CONSOLE_STATUS+0x458>
    80006244:	00000097          	auipc	ra,0x0
    80006248:	8a0080e7          	jalr	-1888(ra) # 80005ae4 <_Z11printStringPKc>
            break;
    8000624c:	fd5ff06f          	j	80006220 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006250:	ffffd097          	auipc	ra,0xffffd
    80006254:	640080e7          	jalr	1600(ra) # 80003890 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006258:	00004517          	auipc	a0,0x4
    8000625c:	25050513          	addi	a0,a0,592 # 8000a4a8 <CONSOLE_STATUS+0x498>
    80006260:	00000097          	auipc	ra,0x0
    80006264:	884080e7          	jalr	-1916(ra) # 80005ae4 <_Z11printStringPKc>
            break;
    80006268:	fb9ff06f          	j	80006220 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    8000626c:	fffff097          	auipc	ra,0xfffff
    80006270:	234080e7          	jalr	564(ra) # 800054a0 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006274:	00004517          	auipc	a0,0x4
    80006278:	28450513          	addi	a0,a0,644 # 8000a4f8 <CONSOLE_STATUS+0x4e8>
    8000627c:	00000097          	auipc	ra,0x0
    80006280:	868080e7          	jalr	-1944(ra) # 80005ae4 <_Z11printStringPKc>
            break;
    80006284:	f9dff06f          	j	80006220 <_Z8userMainv+0x74>
            testSleeping();
    80006288:	00000097          	auipc	ra,0x0
    8000628c:	11c080e7          	jalr	284(ra) # 800063a4 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006290:	00004517          	auipc	a0,0x4
    80006294:	2c050513          	addi	a0,a0,704 # 8000a550 <CONSOLE_STATUS+0x540>
    80006298:	00000097          	auipc	ra,0x0
    8000629c:	84c080e7          	jalr	-1972(ra) # 80005ae4 <_Z11printStringPKc>
            break;
    800062a0:	f81ff06f          	j	80006220 <_Z8userMainv+0x74>
            testConsumerProducer();
    800062a4:	ffffe097          	auipc	ra,0xffffe
    800062a8:	258080e7          	jalr	600(ra) # 800044fc <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    800062ac:	00004517          	auipc	a0,0x4
    800062b0:	2d450513          	addi	a0,a0,724 # 8000a580 <CONSOLE_STATUS+0x570>
    800062b4:	00000097          	auipc	ra,0x0
    800062b8:	830080e7          	jalr	-2000(ra) # 80005ae4 <_Z11printStringPKc>
            break;
    800062bc:	f65ff06f          	j	80006220 <_Z8userMainv+0x74>
            System_Mode_test();
    800062c0:	00000097          	auipc	ra,0x0
    800062c4:	658080e7          	jalr	1624(ra) # 80006918 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    800062c8:	00004517          	auipc	a0,0x4
    800062cc:	2f850513          	addi	a0,a0,760 # 8000a5c0 <CONSOLE_STATUS+0x5b0>
    800062d0:	00000097          	auipc	ra,0x0
    800062d4:	814080e7          	jalr	-2028(ra) # 80005ae4 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800062d8:	00004517          	auipc	a0,0x4
    800062dc:	30850513          	addi	a0,a0,776 # 8000a5e0 <CONSOLE_STATUS+0x5d0>
    800062e0:	00000097          	auipc	ra,0x0
    800062e4:	804080e7          	jalr	-2044(ra) # 80005ae4 <_Z11printStringPKc>
            break;
    800062e8:	f39ff06f          	j	80006220 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    800062ec:	00004517          	auipc	a0,0x4
    800062f0:	34c50513          	addi	a0,a0,844 # 8000a638 <CONSOLE_STATUS+0x628>
    800062f4:	fffff097          	auipc	ra,0xfffff
    800062f8:	7f0080e7          	jalr	2032(ra) # 80005ae4 <_Z11printStringPKc>
    800062fc:	f25ff06f          	j	80006220 <_Z8userMainv+0x74>

0000000080006300 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006300:	fe010113          	addi	sp,sp,-32
    80006304:	00113c23          	sd	ra,24(sp)
    80006308:	00813823          	sd	s0,16(sp)
    8000630c:	00913423          	sd	s1,8(sp)
    80006310:	01213023          	sd	s2,0(sp)
    80006314:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006318:	00053903          	ld	s2,0(a0)
    int i = 6;
    8000631c:	00600493          	li	s1,6
    while (--i > 0) {
    80006320:	fff4849b          	addiw	s1,s1,-1
    80006324:	04905463          	blez	s1,8000636c <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006328:	00004517          	auipc	a0,0x4
    8000632c:	35850513          	addi	a0,a0,856 # 8000a680 <CONSOLE_STATUS+0x670>
    80006330:	fffff097          	auipc	ra,0xfffff
    80006334:	7b4080e7          	jalr	1972(ra) # 80005ae4 <_Z11printStringPKc>
        printInt(sleep_time);
    80006338:	00000613          	li	a2,0
    8000633c:	00a00593          	li	a1,10
    80006340:	0009051b          	sext.w	a0,s2
    80006344:	00000097          	auipc	ra,0x0
    80006348:	950080e7          	jalr	-1712(ra) # 80005c94 <_Z8printIntiii>
        printString(" !\n");
    8000634c:	00004517          	auipc	a0,0x4
    80006350:	33c50513          	addi	a0,a0,828 # 8000a688 <CONSOLE_STATUS+0x678>
    80006354:	fffff097          	auipc	ra,0xfffff
    80006358:	790080e7          	jalr	1936(ra) # 80005ae4 <_Z11printStringPKc>
        time_sleep(sleep_time);
    8000635c:	00090513          	mv	a0,s2
    80006360:	ffffb097          	auipc	ra,0xffffb
    80006364:	11c080e7          	jalr	284(ra) # 8000147c <_Z10time_sleepm>
    while (--i > 0) {
    80006368:	fb9ff06f          	j	80006320 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    8000636c:	00a00793          	li	a5,10
    80006370:	02f95933          	divu	s2,s2,a5
    80006374:	fff90913          	addi	s2,s2,-1
    80006378:	00007797          	auipc	a5,0x7
    8000637c:	b1078793          	addi	a5,a5,-1264 # 8000ce88 <_ZL8finished>
    80006380:	01278933          	add	s2,a5,s2
    80006384:	00100793          	li	a5,1
    80006388:	00f90023          	sb	a5,0(s2)
}
    8000638c:	01813083          	ld	ra,24(sp)
    80006390:	01013403          	ld	s0,16(sp)
    80006394:	00813483          	ld	s1,8(sp)
    80006398:	00013903          	ld	s2,0(sp)
    8000639c:	02010113          	addi	sp,sp,32
    800063a0:	00008067          	ret

00000000800063a4 <_Z12testSleepingv>:

void testSleeping() {
    800063a4:	fc010113          	addi	sp,sp,-64
    800063a8:	02113c23          	sd	ra,56(sp)
    800063ac:	02813823          	sd	s0,48(sp)
    800063b0:	02913423          	sd	s1,40(sp)
    800063b4:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800063b8:	00a00793          	li	a5,10
    800063bc:	fcf43823          	sd	a5,-48(s0)
    800063c0:	01400793          	li	a5,20
    800063c4:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800063c8:	00000493          	li	s1,0
    800063cc:	02c0006f          	j	800063f8 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800063d0:	00349793          	slli	a5,s1,0x3
    800063d4:	fd040613          	addi	a2,s0,-48
    800063d8:	00f60633          	add	a2,a2,a5
    800063dc:	00000597          	auipc	a1,0x0
    800063e0:	f2458593          	addi	a1,a1,-220 # 80006300 <_ZL9sleepyRunPv>
    800063e4:	fc040513          	addi	a0,s0,-64
    800063e8:	00f50533          	add	a0,a0,a5
    800063ec:	ffffb097          	auipc	ra,0xffffb
    800063f0:	f8c080e7          	jalr	-116(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800063f4:	0014849b          	addiw	s1,s1,1
    800063f8:	00100793          	li	a5,1
    800063fc:	fc97dae3          	bge	a5,s1,800063d0 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006400:	00007797          	auipc	a5,0x7
    80006404:	a887c783          	lbu	a5,-1400(a5) # 8000ce88 <_ZL8finished>
    80006408:	fe078ce3          	beqz	a5,80006400 <_Z12testSleepingv+0x5c>
    8000640c:	00007797          	auipc	a5,0x7
    80006410:	a7d7c783          	lbu	a5,-1411(a5) # 8000ce89 <_ZL8finished+0x1>
    80006414:	fe0786e3          	beqz	a5,80006400 <_Z12testSleepingv+0x5c>
}
    80006418:	03813083          	ld	ra,56(sp)
    8000641c:	03013403          	ld	s0,48(sp)
    80006420:	02813483          	ld	s1,40(sp)
    80006424:	04010113          	addi	sp,sp,64
    80006428:	00008067          	ret

000000008000642c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000642c:	fe010113          	addi	sp,sp,-32
    80006430:	00113c23          	sd	ra,24(sp)
    80006434:	00813823          	sd	s0,16(sp)
    80006438:	00913423          	sd	s1,8(sp)
    8000643c:	01213023          	sd	s2,0(sp)
    80006440:	02010413          	addi	s0,sp,32
    80006444:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006448:	00100793          	li	a5,1
    8000644c:	02a7f863          	bgeu	a5,a0,8000647c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006450:	00a00793          	li	a5,10
    80006454:	02f577b3          	remu	a5,a0,a5
    80006458:	02078e63          	beqz	a5,80006494 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000645c:	fff48513          	addi	a0,s1,-1
    80006460:	00000097          	auipc	ra,0x0
    80006464:	fcc080e7          	jalr	-52(ra) # 8000642c <_ZL9fibonaccim>
    80006468:	00050913          	mv	s2,a0
    8000646c:	ffe48513          	addi	a0,s1,-2
    80006470:	00000097          	auipc	ra,0x0
    80006474:	fbc080e7          	jalr	-68(ra) # 8000642c <_ZL9fibonaccim>
    80006478:	00a90533          	add	a0,s2,a0
}
    8000647c:	01813083          	ld	ra,24(sp)
    80006480:	01013403          	ld	s0,16(sp)
    80006484:	00813483          	ld	s1,8(sp)
    80006488:	00013903          	ld	s2,0(sp)
    8000648c:	02010113          	addi	sp,sp,32
    80006490:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006494:	ffffb097          	auipc	ra,0xffffb
    80006498:	fa0080e7          	jalr	-96(ra) # 80001434 <_Z15thread_dispatchv>
    8000649c:	fc1ff06f          	j	8000645c <_ZL9fibonaccim+0x30>

00000000800064a0 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800064a0:	fe010113          	addi	sp,sp,-32
    800064a4:	00113c23          	sd	ra,24(sp)
    800064a8:	00813823          	sd	s0,16(sp)
    800064ac:	00913423          	sd	s1,8(sp)
    800064b0:	01213023          	sd	s2,0(sp)
    800064b4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800064b8:	00a00493          	li	s1,10
    800064bc:	0400006f          	j	800064fc <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800064c0:	00004517          	auipc	a0,0x4
    800064c4:	e9850513          	addi	a0,a0,-360 # 8000a358 <CONSOLE_STATUS+0x348>
    800064c8:	fffff097          	auipc	ra,0xfffff
    800064cc:	61c080e7          	jalr	1564(ra) # 80005ae4 <_Z11printStringPKc>
    800064d0:	00000613          	li	a2,0
    800064d4:	00a00593          	li	a1,10
    800064d8:	00048513          	mv	a0,s1
    800064dc:	fffff097          	auipc	ra,0xfffff
    800064e0:	7b8080e7          	jalr	1976(ra) # 80005c94 <_Z8printIntiii>
    800064e4:	00004517          	auipc	a0,0x4
    800064e8:	06450513          	addi	a0,a0,100 # 8000a548 <CONSOLE_STATUS+0x538>
    800064ec:	fffff097          	auipc	ra,0xfffff
    800064f0:	5f8080e7          	jalr	1528(ra) # 80005ae4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800064f4:	0014849b          	addiw	s1,s1,1
    800064f8:	0ff4f493          	andi	s1,s1,255
    800064fc:	00c00793          	li	a5,12
    80006500:	fc97f0e3          	bgeu	a5,s1,800064c0 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006504:	00004517          	auipc	a0,0x4
    80006508:	e5c50513          	addi	a0,a0,-420 # 8000a360 <CONSOLE_STATUS+0x350>
    8000650c:	fffff097          	auipc	ra,0xfffff
    80006510:	5d8080e7          	jalr	1496(ra) # 80005ae4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006514:	00500313          	li	t1,5
    thread_dispatch();
    80006518:	ffffb097          	auipc	ra,0xffffb
    8000651c:	f1c080e7          	jalr	-228(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006520:	01000513          	li	a0,16
    80006524:	00000097          	auipc	ra,0x0
    80006528:	f08080e7          	jalr	-248(ra) # 8000642c <_ZL9fibonaccim>
    8000652c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006530:	00004517          	auipc	a0,0x4
    80006534:	e4050513          	addi	a0,a0,-448 # 8000a370 <CONSOLE_STATUS+0x360>
    80006538:	fffff097          	auipc	ra,0xfffff
    8000653c:	5ac080e7          	jalr	1452(ra) # 80005ae4 <_Z11printStringPKc>
    80006540:	00000613          	li	a2,0
    80006544:	00a00593          	li	a1,10
    80006548:	0009051b          	sext.w	a0,s2
    8000654c:	fffff097          	auipc	ra,0xfffff
    80006550:	748080e7          	jalr	1864(ra) # 80005c94 <_Z8printIntiii>
    80006554:	00004517          	auipc	a0,0x4
    80006558:	ff450513          	addi	a0,a0,-12 # 8000a548 <CONSOLE_STATUS+0x538>
    8000655c:	fffff097          	auipc	ra,0xfffff
    80006560:	588080e7          	jalr	1416(ra) # 80005ae4 <_Z11printStringPKc>
    80006564:	0400006f          	j	800065a4 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006568:	00004517          	auipc	a0,0x4
    8000656c:	df050513          	addi	a0,a0,-528 # 8000a358 <CONSOLE_STATUS+0x348>
    80006570:	fffff097          	auipc	ra,0xfffff
    80006574:	574080e7          	jalr	1396(ra) # 80005ae4 <_Z11printStringPKc>
    80006578:	00000613          	li	a2,0
    8000657c:	00a00593          	li	a1,10
    80006580:	00048513          	mv	a0,s1
    80006584:	fffff097          	auipc	ra,0xfffff
    80006588:	710080e7          	jalr	1808(ra) # 80005c94 <_Z8printIntiii>
    8000658c:	00004517          	auipc	a0,0x4
    80006590:	fbc50513          	addi	a0,a0,-68 # 8000a548 <CONSOLE_STATUS+0x538>
    80006594:	fffff097          	auipc	ra,0xfffff
    80006598:	550080e7          	jalr	1360(ra) # 80005ae4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000659c:	0014849b          	addiw	s1,s1,1
    800065a0:	0ff4f493          	andi	s1,s1,255
    800065a4:	00f00793          	li	a5,15
    800065a8:	fc97f0e3          	bgeu	a5,s1,80006568 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800065ac:	00004517          	auipc	a0,0x4
    800065b0:	dd450513          	addi	a0,a0,-556 # 8000a380 <CONSOLE_STATUS+0x370>
    800065b4:	fffff097          	auipc	ra,0xfffff
    800065b8:	530080e7          	jalr	1328(ra) # 80005ae4 <_Z11printStringPKc>
    finishedD = true;
    800065bc:	00100793          	li	a5,1
    800065c0:	00007717          	auipc	a4,0x7
    800065c4:	8cf70523          	sb	a5,-1846(a4) # 8000ce8a <_ZL9finishedD>
    thread_dispatch();
    800065c8:	ffffb097          	auipc	ra,0xffffb
    800065cc:	e6c080e7          	jalr	-404(ra) # 80001434 <_Z15thread_dispatchv>
}
    800065d0:	01813083          	ld	ra,24(sp)
    800065d4:	01013403          	ld	s0,16(sp)
    800065d8:	00813483          	ld	s1,8(sp)
    800065dc:	00013903          	ld	s2,0(sp)
    800065e0:	02010113          	addi	sp,sp,32
    800065e4:	00008067          	ret

00000000800065e8 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800065e8:	fe010113          	addi	sp,sp,-32
    800065ec:	00113c23          	sd	ra,24(sp)
    800065f0:	00813823          	sd	s0,16(sp)
    800065f4:	00913423          	sd	s1,8(sp)
    800065f8:	01213023          	sd	s2,0(sp)
    800065fc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006600:	00000493          	li	s1,0
    80006604:	0400006f          	j	80006644 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006608:	00004517          	auipc	a0,0x4
    8000660c:	d1050513          	addi	a0,a0,-752 # 8000a318 <CONSOLE_STATUS+0x308>
    80006610:	fffff097          	auipc	ra,0xfffff
    80006614:	4d4080e7          	jalr	1236(ra) # 80005ae4 <_Z11printStringPKc>
    80006618:	00000613          	li	a2,0
    8000661c:	00a00593          	li	a1,10
    80006620:	00048513          	mv	a0,s1
    80006624:	fffff097          	auipc	ra,0xfffff
    80006628:	670080e7          	jalr	1648(ra) # 80005c94 <_Z8printIntiii>
    8000662c:	00004517          	auipc	a0,0x4
    80006630:	f1c50513          	addi	a0,a0,-228 # 8000a548 <CONSOLE_STATUS+0x538>
    80006634:	fffff097          	auipc	ra,0xfffff
    80006638:	4b0080e7          	jalr	1200(ra) # 80005ae4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000663c:	0014849b          	addiw	s1,s1,1
    80006640:	0ff4f493          	andi	s1,s1,255
    80006644:	00200793          	li	a5,2
    80006648:	fc97f0e3          	bgeu	a5,s1,80006608 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    8000664c:	00004517          	auipc	a0,0x4
    80006650:	cd450513          	addi	a0,a0,-812 # 8000a320 <CONSOLE_STATUS+0x310>
    80006654:	fffff097          	auipc	ra,0xfffff
    80006658:	490080e7          	jalr	1168(ra) # 80005ae4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000665c:	00700313          	li	t1,7
    thread_dispatch();
    80006660:	ffffb097          	auipc	ra,0xffffb
    80006664:	dd4080e7          	jalr	-556(ra) # 80001434 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006668:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    8000666c:	00004517          	auipc	a0,0x4
    80006670:	cc450513          	addi	a0,a0,-828 # 8000a330 <CONSOLE_STATUS+0x320>
    80006674:	fffff097          	auipc	ra,0xfffff
    80006678:	470080e7          	jalr	1136(ra) # 80005ae4 <_Z11printStringPKc>
    8000667c:	00000613          	li	a2,0
    80006680:	00a00593          	li	a1,10
    80006684:	0009051b          	sext.w	a0,s2
    80006688:	fffff097          	auipc	ra,0xfffff
    8000668c:	60c080e7          	jalr	1548(ra) # 80005c94 <_Z8printIntiii>
    80006690:	00004517          	auipc	a0,0x4
    80006694:	eb850513          	addi	a0,a0,-328 # 8000a548 <CONSOLE_STATUS+0x538>
    80006698:	fffff097          	auipc	ra,0xfffff
    8000669c:	44c080e7          	jalr	1100(ra) # 80005ae4 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800066a0:	00c00513          	li	a0,12
    800066a4:	00000097          	auipc	ra,0x0
    800066a8:	d88080e7          	jalr	-632(ra) # 8000642c <_ZL9fibonaccim>
    800066ac:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800066b0:	00004517          	auipc	a0,0x4
    800066b4:	c8850513          	addi	a0,a0,-888 # 8000a338 <CONSOLE_STATUS+0x328>
    800066b8:	fffff097          	auipc	ra,0xfffff
    800066bc:	42c080e7          	jalr	1068(ra) # 80005ae4 <_Z11printStringPKc>
    800066c0:	00000613          	li	a2,0
    800066c4:	00a00593          	li	a1,10
    800066c8:	0009051b          	sext.w	a0,s2
    800066cc:	fffff097          	auipc	ra,0xfffff
    800066d0:	5c8080e7          	jalr	1480(ra) # 80005c94 <_Z8printIntiii>
    800066d4:	00004517          	auipc	a0,0x4
    800066d8:	e7450513          	addi	a0,a0,-396 # 8000a548 <CONSOLE_STATUS+0x538>
    800066dc:	fffff097          	auipc	ra,0xfffff
    800066e0:	408080e7          	jalr	1032(ra) # 80005ae4 <_Z11printStringPKc>
    800066e4:	0400006f          	j	80006724 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800066e8:	00004517          	auipc	a0,0x4
    800066ec:	c3050513          	addi	a0,a0,-976 # 8000a318 <CONSOLE_STATUS+0x308>
    800066f0:	fffff097          	auipc	ra,0xfffff
    800066f4:	3f4080e7          	jalr	1012(ra) # 80005ae4 <_Z11printStringPKc>
    800066f8:	00000613          	li	a2,0
    800066fc:	00a00593          	li	a1,10
    80006700:	00048513          	mv	a0,s1
    80006704:	fffff097          	auipc	ra,0xfffff
    80006708:	590080e7          	jalr	1424(ra) # 80005c94 <_Z8printIntiii>
    8000670c:	00004517          	auipc	a0,0x4
    80006710:	e3c50513          	addi	a0,a0,-452 # 8000a548 <CONSOLE_STATUS+0x538>
    80006714:	fffff097          	auipc	ra,0xfffff
    80006718:	3d0080e7          	jalr	976(ra) # 80005ae4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000671c:	0014849b          	addiw	s1,s1,1
    80006720:	0ff4f493          	andi	s1,s1,255
    80006724:	00500793          	li	a5,5
    80006728:	fc97f0e3          	bgeu	a5,s1,800066e8 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    8000672c:	00004517          	auipc	a0,0x4
    80006730:	bc450513          	addi	a0,a0,-1084 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    80006734:	fffff097          	auipc	ra,0xfffff
    80006738:	3b0080e7          	jalr	944(ra) # 80005ae4 <_Z11printStringPKc>
    finishedC = true;
    8000673c:	00100793          	li	a5,1
    80006740:	00006717          	auipc	a4,0x6
    80006744:	74f705a3          	sb	a5,1867(a4) # 8000ce8b <_ZL9finishedC>
    thread_dispatch();
    80006748:	ffffb097          	auipc	ra,0xffffb
    8000674c:	cec080e7          	jalr	-788(ra) # 80001434 <_Z15thread_dispatchv>
}
    80006750:	01813083          	ld	ra,24(sp)
    80006754:	01013403          	ld	s0,16(sp)
    80006758:	00813483          	ld	s1,8(sp)
    8000675c:	00013903          	ld	s2,0(sp)
    80006760:	02010113          	addi	sp,sp,32
    80006764:	00008067          	ret

0000000080006768 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006768:	fe010113          	addi	sp,sp,-32
    8000676c:	00113c23          	sd	ra,24(sp)
    80006770:	00813823          	sd	s0,16(sp)
    80006774:	00913423          	sd	s1,8(sp)
    80006778:	01213023          	sd	s2,0(sp)
    8000677c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006780:	00000913          	li	s2,0
    80006784:	0400006f          	j	800067c4 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006788:	ffffb097          	auipc	ra,0xffffb
    8000678c:	cac080e7          	jalr	-852(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006790:	00148493          	addi	s1,s1,1
    80006794:	000027b7          	lui	a5,0x2
    80006798:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000679c:	0097ee63          	bltu	a5,s1,800067b8 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800067a0:	00000713          	li	a4,0
    800067a4:	000077b7          	lui	a5,0x7
    800067a8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800067ac:	fce7eee3          	bltu	a5,a4,80006788 <_ZL11workerBodyBPv+0x20>
    800067b0:	00170713          	addi	a4,a4,1
    800067b4:	ff1ff06f          	j	800067a4 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    800067b8:	00a00793          	li	a5,10
    800067bc:	04f90663          	beq	s2,a5,80006808 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    800067c0:	00190913          	addi	s2,s2,1
    800067c4:	00f00793          	li	a5,15
    800067c8:	0527e463          	bltu	a5,s2,80006810 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    800067cc:	00004517          	auipc	a0,0x4
    800067d0:	b3450513          	addi	a0,a0,-1228 # 8000a300 <CONSOLE_STATUS+0x2f0>
    800067d4:	fffff097          	auipc	ra,0xfffff
    800067d8:	310080e7          	jalr	784(ra) # 80005ae4 <_Z11printStringPKc>
    800067dc:	00000613          	li	a2,0
    800067e0:	00a00593          	li	a1,10
    800067e4:	0009051b          	sext.w	a0,s2
    800067e8:	fffff097          	auipc	ra,0xfffff
    800067ec:	4ac080e7          	jalr	1196(ra) # 80005c94 <_Z8printIntiii>
    800067f0:	00004517          	auipc	a0,0x4
    800067f4:	d5850513          	addi	a0,a0,-680 # 8000a548 <CONSOLE_STATUS+0x538>
    800067f8:	fffff097          	auipc	ra,0xfffff
    800067fc:	2ec080e7          	jalr	748(ra) # 80005ae4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006800:	00000493          	li	s1,0
    80006804:	f91ff06f          	j	80006794 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006808:	14102ff3          	csrr	t6,sepc
    8000680c:	fb5ff06f          	j	800067c0 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006810:	00004517          	auipc	a0,0x4
    80006814:	af850513          	addi	a0,a0,-1288 # 8000a308 <CONSOLE_STATUS+0x2f8>
    80006818:	fffff097          	auipc	ra,0xfffff
    8000681c:	2cc080e7          	jalr	716(ra) # 80005ae4 <_Z11printStringPKc>
    finishedB = true;
    80006820:	00100793          	li	a5,1
    80006824:	00006717          	auipc	a4,0x6
    80006828:	66f70423          	sb	a5,1640(a4) # 8000ce8c <_ZL9finishedB>
    thread_dispatch();
    8000682c:	ffffb097          	auipc	ra,0xffffb
    80006830:	c08080e7          	jalr	-1016(ra) # 80001434 <_Z15thread_dispatchv>
}
    80006834:	01813083          	ld	ra,24(sp)
    80006838:	01013403          	ld	s0,16(sp)
    8000683c:	00813483          	ld	s1,8(sp)
    80006840:	00013903          	ld	s2,0(sp)
    80006844:	02010113          	addi	sp,sp,32
    80006848:	00008067          	ret

000000008000684c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    8000684c:	fe010113          	addi	sp,sp,-32
    80006850:	00113c23          	sd	ra,24(sp)
    80006854:	00813823          	sd	s0,16(sp)
    80006858:	00913423          	sd	s1,8(sp)
    8000685c:	01213023          	sd	s2,0(sp)
    80006860:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006864:	00000913          	li	s2,0
    80006868:	0380006f          	j	800068a0 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    8000686c:	ffffb097          	auipc	ra,0xffffb
    80006870:	bc8080e7          	jalr	-1080(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006874:	00148493          	addi	s1,s1,1
    80006878:	000027b7          	lui	a5,0x2
    8000687c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006880:	0097ee63          	bltu	a5,s1,8000689c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006884:	00000713          	li	a4,0
    80006888:	000077b7          	lui	a5,0x7
    8000688c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006890:	fce7eee3          	bltu	a5,a4,8000686c <_ZL11workerBodyAPv+0x20>
    80006894:	00170713          	addi	a4,a4,1
    80006898:	ff1ff06f          	j	80006888 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000689c:	00190913          	addi	s2,s2,1
    800068a0:	00900793          	li	a5,9
    800068a4:	0527e063          	bltu	a5,s2,800068e4 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800068a8:	00004517          	auipc	a0,0x4
    800068ac:	a4050513          	addi	a0,a0,-1472 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    800068b0:	fffff097          	auipc	ra,0xfffff
    800068b4:	234080e7          	jalr	564(ra) # 80005ae4 <_Z11printStringPKc>
    800068b8:	00000613          	li	a2,0
    800068bc:	00a00593          	li	a1,10
    800068c0:	0009051b          	sext.w	a0,s2
    800068c4:	fffff097          	auipc	ra,0xfffff
    800068c8:	3d0080e7          	jalr	976(ra) # 80005c94 <_Z8printIntiii>
    800068cc:	00004517          	auipc	a0,0x4
    800068d0:	c7c50513          	addi	a0,a0,-900 # 8000a548 <CONSOLE_STATUS+0x538>
    800068d4:	fffff097          	auipc	ra,0xfffff
    800068d8:	210080e7          	jalr	528(ra) # 80005ae4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800068dc:	00000493          	li	s1,0
    800068e0:	f99ff06f          	j	80006878 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800068e4:	00004517          	auipc	a0,0x4
    800068e8:	a0c50513          	addi	a0,a0,-1524 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    800068ec:	fffff097          	auipc	ra,0xfffff
    800068f0:	1f8080e7          	jalr	504(ra) # 80005ae4 <_Z11printStringPKc>
    finishedA = true;
    800068f4:	00100793          	li	a5,1
    800068f8:	00006717          	auipc	a4,0x6
    800068fc:	58f70aa3          	sb	a5,1429(a4) # 8000ce8d <_ZL9finishedA>
}
    80006900:	01813083          	ld	ra,24(sp)
    80006904:	01013403          	ld	s0,16(sp)
    80006908:	00813483          	ld	s1,8(sp)
    8000690c:	00013903          	ld	s2,0(sp)
    80006910:	02010113          	addi	sp,sp,32
    80006914:	00008067          	ret

0000000080006918 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006918:	fd010113          	addi	sp,sp,-48
    8000691c:	02113423          	sd	ra,40(sp)
    80006920:	02813023          	sd	s0,32(sp)
    80006924:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006928:	00000613          	li	a2,0
    8000692c:	00000597          	auipc	a1,0x0
    80006930:	f2058593          	addi	a1,a1,-224 # 8000684c <_ZL11workerBodyAPv>
    80006934:	fd040513          	addi	a0,s0,-48
    80006938:	ffffb097          	auipc	ra,0xffffb
    8000693c:	a40080e7          	jalr	-1472(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006940:	00004517          	auipc	a0,0x4
    80006944:	a5050513          	addi	a0,a0,-1456 # 8000a390 <CONSOLE_STATUS+0x380>
    80006948:	fffff097          	auipc	ra,0xfffff
    8000694c:	19c080e7          	jalr	412(ra) # 80005ae4 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006950:	00000613          	li	a2,0
    80006954:	00000597          	auipc	a1,0x0
    80006958:	e1458593          	addi	a1,a1,-492 # 80006768 <_ZL11workerBodyBPv>
    8000695c:	fd840513          	addi	a0,s0,-40
    80006960:	ffffb097          	auipc	ra,0xffffb
    80006964:	a18080e7          	jalr	-1512(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006968:	00004517          	auipc	a0,0x4
    8000696c:	a4050513          	addi	a0,a0,-1472 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80006970:	fffff097          	auipc	ra,0xfffff
    80006974:	174080e7          	jalr	372(ra) # 80005ae4 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006978:	00000613          	li	a2,0
    8000697c:	00000597          	auipc	a1,0x0
    80006980:	c6c58593          	addi	a1,a1,-916 # 800065e8 <_ZL11workerBodyCPv>
    80006984:	fe040513          	addi	a0,s0,-32
    80006988:	ffffb097          	auipc	ra,0xffffb
    8000698c:	9f0080e7          	jalr	-1552(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006990:	00004517          	auipc	a0,0x4
    80006994:	a3050513          	addi	a0,a0,-1488 # 8000a3c0 <CONSOLE_STATUS+0x3b0>
    80006998:	fffff097          	auipc	ra,0xfffff
    8000699c:	14c080e7          	jalr	332(ra) # 80005ae4 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800069a0:	00000613          	li	a2,0
    800069a4:	00000597          	auipc	a1,0x0
    800069a8:	afc58593          	addi	a1,a1,-1284 # 800064a0 <_ZL11workerBodyDPv>
    800069ac:	fe840513          	addi	a0,s0,-24
    800069b0:	ffffb097          	auipc	ra,0xffffb
    800069b4:	9c8080e7          	jalr	-1592(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800069b8:	00004517          	auipc	a0,0x4
    800069bc:	a2050513          	addi	a0,a0,-1504 # 8000a3d8 <CONSOLE_STATUS+0x3c8>
    800069c0:	fffff097          	auipc	ra,0xfffff
    800069c4:	124080e7          	jalr	292(ra) # 80005ae4 <_Z11printStringPKc>
    800069c8:	00c0006f          	j	800069d4 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800069cc:	ffffb097          	auipc	ra,0xffffb
    800069d0:	a68080e7          	jalr	-1432(ra) # 80001434 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800069d4:	00006797          	auipc	a5,0x6
    800069d8:	4b97c783          	lbu	a5,1209(a5) # 8000ce8d <_ZL9finishedA>
    800069dc:	fe0788e3          	beqz	a5,800069cc <_Z16System_Mode_testv+0xb4>
    800069e0:	00006797          	auipc	a5,0x6
    800069e4:	4ac7c783          	lbu	a5,1196(a5) # 8000ce8c <_ZL9finishedB>
    800069e8:	fe0782e3          	beqz	a5,800069cc <_Z16System_Mode_testv+0xb4>
    800069ec:	00006797          	auipc	a5,0x6
    800069f0:	49f7c783          	lbu	a5,1183(a5) # 8000ce8b <_ZL9finishedC>
    800069f4:	fc078ce3          	beqz	a5,800069cc <_Z16System_Mode_testv+0xb4>
    800069f8:	00006797          	auipc	a5,0x6
    800069fc:	4927c783          	lbu	a5,1170(a5) # 8000ce8a <_ZL9finishedD>
    80006a00:	fc0786e3          	beqz	a5,800069cc <_Z16System_Mode_testv+0xb4>
    }

}
    80006a04:	02813083          	ld	ra,40(sp)
    80006a08:	02013403          	ld	s0,32(sp)
    80006a0c:	03010113          	addi	sp,sp,48
    80006a10:	00008067          	ret

0000000080006a14 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006a14:	fe010113          	addi	sp,sp,-32
    80006a18:	00113c23          	sd	ra,24(sp)
    80006a1c:	00813823          	sd	s0,16(sp)
    80006a20:	00913423          	sd	s1,8(sp)
    80006a24:	01213023          	sd	s2,0(sp)
    80006a28:	02010413          	addi	s0,sp,32
    80006a2c:	00050493          	mv	s1,a0
    80006a30:	00058913          	mv	s2,a1
    80006a34:	0015879b          	addiw	a5,a1,1
    80006a38:	0007851b          	sext.w	a0,a5
    80006a3c:	00f4a023          	sw	a5,0(s1)
    80006a40:	0004a823          	sw	zero,16(s1)
    80006a44:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006a48:	00251513          	slli	a0,a0,0x2
    80006a4c:	ffffb097          	auipc	ra,0xffffb
    80006a50:	8bc080e7          	jalr	-1860(ra) # 80001308 <_Z9mem_allocm>
    80006a54:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006a58:	00000593          	li	a1,0
    80006a5c:	02048513          	addi	a0,s1,32
    80006a60:	ffffb097          	auipc	ra,0xffffb
    80006a64:	a4c080e7          	jalr	-1460(ra) # 800014ac <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006a68:	00090593          	mv	a1,s2
    80006a6c:	01848513          	addi	a0,s1,24
    80006a70:	ffffb097          	auipc	ra,0xffffb
    80006a74:	a3c080e7          	jalr	-1476(ra) # 800014ac <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006a78:	00100593          	li	a1,1
    80006a7c:	02848513          	addi	a0,s1,40
    80006a80:	ffffb097          	auipc	ra,0xffffb
    80006a84:	a2c080e7          	jalr	-1492(ra) # 800014ac <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006a88:	00100593          	li	a1,1
    80006a8c:	03048513          	addi	a0,s1,48
    80006a90:	ffffb097          	auipc	ra,0xffffb
    80006a94:	a1c080e7          	jalr	-1508(ra) # 800014ac <_Z8sem_openPP4KSemj>
}
    80006a98:	01813083          	ld	ra,24(sp)
    80006a9c:	01013403          	ld	s0,16(sp)
    80006aa0:	00813483          	ld	s1,8(sp)
    80006aa4:	00013903          	ld	s2,0(sp)
    80006aa8:	02010113          	addi	sp,sp,32
    80006aac:	00008067          	ret

0000000080006ab0 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006ab0:	fe010113          	addi	sp,sp,-32
    80006ab4:	00113c23          	sd	ra,24(sp)
    80006ab8:	00813823          	sd	s0,16(sp)
    80006abc:	00913423          	sd	s1,8(sp)
    80006ac0:	01213023          	sd	s2,0(sp)
    80006ac4:	02010413          	addi	s0,sp,32
    80006ac8:	00050493          	mv	s1,a0
    80006acc:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006ad0:	01853503          	ld	a0,24(a0)
    80006ad4:	ffffb097          	auipc	ra,0xffffb
    80006ad8:	a40080e7          	jalr	-1472(ra) # 80001514 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006adc:	0304b503          	ld	a0,48(s1)
    80006ae0:	ffffb097          	auipc	ra,0xffffb
    80006ae4:	a34080e7          	jalr	-1484(ra) # 80001514 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006ae8:	0084b783          	ld	a5,8(s1)
    80006aec:	0144a703          	lw	a4,20(s1)
    80006af0:	00271713          	slli	a4,a4,0x2
    80006af4:	00e787b3          	add	a5,a5,a4
    80006af8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006afc:	0144a783          	lw	a5,20(s1)
    80006b00:	0017879b          	addiw	a5,a5,1
    80006b04:	0004a703          	lw	a4,0(s1)
    80006b08:	02e7e7bb          	remw	a5,a5,a4
    80006b0c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006b10:	0304b503          	ld	a0,48(s1)
    80006b14:	ffffb097          	auipc	ra,0xffffb
    80006b18:	a30080e7          	jalr	-1488(ra) # 80001544 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006b1c:	0204b503          	ld	a0,32(s1)
    80006b20:	ffffb097          	auipc	ra,0xffffb
    80006b24:	a24080e7          	jalr	-1500(ra) # 80001544 <_Z10sem_signalP4KSem>

}
    80006b28:	01813083          	ld	ra,24(sp)
    80006b2c:	01013403          	ld	s0,16(sp)
    80006b30:	00813483          	ld	s1,8(sp)
    80006b34:	00013903          	ld	s2,0(sp)
    80006b38:	02010113          	addi	sp,sp,32
    80006b3c:	00008067          	ret

0000000080006b40 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006b40:	fe010113          	addi	sp,sp,-32
    80006b44:	00113c23          	sd	ra,24(sp)
    80006b48:	00813823          	sd	s0,16(sp)
    80006b4c:	00913423          	sd	s1,8(sp)
    80006b50:	01213023          	sd	s2,0(sp)
    80006b54:	02010413          	addi	s0,sp,32
    80006b58:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006b5c:	02053503          	ld	a0,32(a0)
    80006b60:	ffffb097          	auipc	ra,0xffffb
    80006b64:	9b4080e7          	jalr	-1612(ra) # 80001514 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006b68:	0284b503          	ld	a0,40(s1)
    80006b6c:	ffffb097          	auipc	ra,0xffffb
    80006b70:	9a8080e7          	jalr	-1624(ra) # 80001514 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006b74:	0084b703          	ld	a4,8(s1)
    80006b78:	0104a783          	lw	a5,16(s1)
    80006b7c:	00279693          	slli	a3,a5,0x2
    80006b80:	00d70733          	add	a4,a4,a3
    80006b84:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006b88:	0017879b          	addiw	a5,a5,1
    80006b8c:	0004a703          	lw	a4,0(s1)
    80006b90:	02e7e7bb          	remw	a5,a5,a4
    80006b94:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006b98:	0284b503          	ld	a0,40(s1)
    80006b9c:	ffffb097          	auipc	ra,0xffffb
    80006ba0:	9a8080e7          	jalr	-1624(ra) # 80001544 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006ba4:	0184b503          	ld	a0,24(s1)
    80006ba8:	ffffb097          	auipc	ra,0xffffb
    80006bac:	99c080e7          	jalr	-1636(ra) # 80001544 <_Z10sem_signalP4KSem>

    return ret;
}
    80006bb0:	00090513          	mv	a0,s2
    80006bb4:	01813083          	ld	ra,24(sp)
    80006bb8:	01013403          	ld	s0,16(sp)
    80006bbc:	00813483          	ld	s1,8(sp)
    80006bc0:	00013903          	ld	s2,0(sp)
    80006bc4:	02010113          	addi	sp,sp,32
    80006bc8:	00008067          	ret

0000000080006bcc <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006bcc:	fe010113          	addi	sp,sp,-32
    80006bd0:	00113c23          	sd	ra,24(sp)
    80006bd4:	00813823          	sd	s0,16(sp)
    80006bd8:	00913423          	sd	s1,8(sp)
    80006bdc:	01213023          	sd	s2,0(sp)
    80006be0:	02010413          	addi	s0,sp,32
    80006be4:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006be8:	02853503          	ld	a0,40(a0)
    80006bec:	ffffb097          	auipc	ra,0xffffb
    80006bf0:	928080e7          	jalr	-1752(ra) # 80001514 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006bf4:	0304b503          	ld	a0,48(s1)
    80006bf8:	ffffb097          	auipc	ra,0xffffb
    80006bfc:	91c080e7          	jalr	-1764(ra) # 80001514 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006c00:	0144a783          	lw	a5,20(s1)
    80006c04:	0104a903          	lw	s2,16(s1)
    80006c08:	0327ce63          	blt	a5,s2,80006c44 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006c0c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006c10:	0304b503          	ld	a0,48(s1)
    80006c14:	ffffb097          	auipc	ra,0xffffb
    80006c18:	930080e7          	jalr	-1744(ra) # 80001544 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006c1c:	0284b503          	ld	a0,40(s1)
    80006c20:	ffffb097          	auipc	ra,0xffffb
    80006c24:	924080e7          	jalr	-1756(ra) # 80001544 <_Z10sem_signalP4KSem>

    return ret;
}
    80006c28:	00090513          	mv	a0,s2
    80006c2c:	01813083          	ld	ra,24(sp)
    80006c30:	01013403          	ld	s0,16(sp)
    80006c34:	00813483          	ld	s1,8(sp)
    80006c38:	00013903          	ld	s2,0(sp)
    80006c3c:	02010113          	addi	sp,sp,32
    80006c40:	00008067          	ret
        ret = cap - head + tail;
    80006c44:	0004a703          	lw	a4,0(s1)
    80006c48:	4127093b          	subw	s2,a4,s2
    80006c4c:	00f9093b          	addw	s2,s2,a5
    80006c50:	fc1ff06f          	j	80006c10 <_ZN6Buffer6getCntEv+0x44>

0000000080006c54 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006c54:	fe010113          	addi	sp,sp,-32
    80006c58:	00113c23          	sd	ra,24(sp)
    80006c5c:	00813823          	sd	s0,16(sp)
    80006c60:	00913423          	sd	s1,8(sp)
    80006c64:	02010413          	addi	s0,sp,32
    80006c68:	00050493          	mv	s1,a0
    putc('\n');
    80006c6c:	00a00513          	li	a0,10
    80006c70:	ffffb097          	auipc	ra,0xffffb
    80006c74:	92c080e7          	jalr	-1748(ra) # 8000159c <_Z4putcc>
    printString("Buffer deleted!\n");
    80006c78:	00003517          	auipc	a0,0x3
    80006c7c:	77850513          	addi	a0,a0,1912 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    80006c80:	fffff097          	auipc	ra,0xfffff
    80006c84:	e64080e7          	jalr	-412(ra) # 80005ae4 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006c88:	00048513          	mv	a0,s1
    80006c8c:	00000097          	auipc	ra,0x0
    80006c90:	f40080e7          	jalr	-192(ra) # 80006bcc <_ZN6Buffer6getCntEv>
    80006c94:	02a05c63          	blez	a0,80006ccc <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006c98:	0084b783          	ld	a5,8(s1)
    80006c9c:	0104a703          	lw	a4,16(s1)
    80006ca0:	00271713          	slli	a4,a4,0x2
    80006ca4:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006ca8:	0007c503          	lbu	a0,0(a5)
    80006cac:	ffffb097          	auipc	ra,0xffffb
    80006cb0:	8f0080e7          	jalr	-1808(ra) # 8000159c <_Z4putcc>
        head = (head + 1) % cap;
    80006cb4:	0104a783          	lw	a5,16(s1)
    80006cb8:	0017879b          	addiw	a5,a5,1
    80006cbc:	0004a703          	lw	a4,0(s1)
    80006cc0:	02e7e7bb          	remw	a5,a5,a4
    80006cc4:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006cc8:	fc1ff06f          	j	80006c88 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006ccc:	02100513          	li	a0,33
    80006cd0:	ffffb097          	auipc	ra,0xffffb
    80006cd4:	8cc080e7          	jalr	-1844(ra) # 8000159c <_Z4putcc>
    putc('\n');
    80006cd8:	00a00513          	li	a0,10
    80006cdc:	ffffb097          	auipc	ra,0xffffb
    80006ce0:	8c0080e7          	jalr	-1856(ra) # 8000159c <_Z4putcc>
    mem_free(buffer);
    80006ce4:	0084b503          	ld	a0,8(s1)
    80006ce8:	ffffa097          	auipc	ra,0xffffa
    80006cec:	660080e7          	jalr	1632(ra) # 80001348 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006cf0:	0204b503          	ld	a0,32(s1)
    80006cf4:	ffffa097          	auipc	ra,0xffffa
    80006cf8:	7f0080e7          	jalr	2032(ra) # 800014e4 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006cfc:	0184b503          	ld	a0,24(s1)
    80006d00:	ffffa097          	auipc	ra,0xffffa
    80006d04:	7e4080e7          	jalr	2020(ra) # 800014e4 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006d08:	0304b503          	ld	a0,48(s1)
    80006d0c:	ffffa097          	auipc	ra,0xffffa
    80006d10:	7d8080e7          	jalr	2008(ra) # 800014e4 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006d14:	0284b503          	ld	a0,40(s1)
    80006d18:	ffffa097          	auipc	ra,0xffffa
    80006d1c:	7cc080e7          	jalr	1996(ra) # 800014e4 <_Z9sem_closeP4KSem>
}
    80006d20:	01813083          	ld	ra,24(sp)
    80006d24:	01013403          	ld	s0,16(sp)
    80006d28:	00813483          	ld	s1,8(sp)
    80006d2c:	02010113          	addi	sp,sp,32
    80006d30:	00008067          	ret

0000000080006d34 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80006d34:	fa010113          	addi	sp,sp,-96
    80006d38:	04813c23          	sd	s0,88(sp)
    80006d3c:	06010413          	addi	s0,sp,96
    80006d40:	faa43423          	sd	a0,-88(s0)
    80006d44:	00058793          	mv	a5,a1
    80006d48:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80006d4c:	fa843783          	ld	a5,-88(s0)
    80006d50:	00079663          	bnez	a5,80006d5c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80006d54:	00000793          	li	a5,0
    80006d58:	2040006f          	j	80006f5c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80006d5c:	fa843783          	ld	a5,-88(s0)
    80006d60:	0067d713          	srli	a4,a5,0x6
    80006d64:	fa843783          	ld	a5,-88(s0)
    80006d68:	03f7f793          	andi	a5,a5,63
    80006d6c:	00078663          	beqz	a5,80006d78 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80006d70:	00100793          	li	a5,1
    80006d74:	0080006f          	j	80006d7c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80006d78:	00000793          	li	a5,0
    80006d7c:	00e787b3          	add	a5,a5,a4
    80006d80:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80006d84:	fc843783          	ld	a5,-56(s0)
    80006d88:	00679793          	slli	a5,a5,0x6
    80006d8c:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    80006d90:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80006d94:	00006797          	auipc	a5,0x6
    80006d98:	10478793          	addi	a5,a5,260 # 8000ce98 <_ZN15MemoryAllocator11freeMemHeadE>
    80006d9c:	0007b783          	ld	a5,0(a5)
    80006da0:	fef43023          	sd	a5,-32(s0)
    80006da4:	fe043783          	ld	a5,-32(s0)
    80006da8:	1a078863          	beqz	a5,80006f58 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    80006dac:	fe043783          	ld	a5,-32(s0)
    80006db0:	0087b783          	ld	a5,8(a5)
    80006db4:	fa843703          	ld	a4,-88(s0)
    80006db8:	18e7e263          	bltu	a5,a4,80006f3c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    80006dbc:	fe043703          	ld	a4,-32(s0)
    80006dc0:	fa843783          	ld	a5,-88(s0)
    80006dc4:	00f707b3          	add	a5,a4,a5
    80006dc8:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    80006dcc:	fe043783          	ld	a5,-32(s0)
    80006dd0:	0087b703          	ld	a4,8(a5)
    80006dd4:	fa843783          	ld	a5,-88(s0)
    80006dd8:	40f707b3          	sub	a5,a4,a5
    80006ddc:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80006de0:	fb843703          	ld	a4,-72(s0)
    80006de4:	02000793          	li	a5,32
    80006de8:	04e7e463          	bltu	a5,a4,80006e30 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    80006dec:	fa843703          	ld	a4,-88(s0)
    80006df0:	fb843783          	ld	a5,-72(s0)
    80006df4:	00f707b3          	add	a5,a4,a5
    80006df8:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    80006dfc:	fe843783          	ld	a5,-24(s0)
    80006e00:	00078c63          	beqz	a5,80006e18 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    80006e04:	fe043783          	ld	a5,-32(s0)
    80006e08:	0007b703          	ld	a4,0(a5)
    80006e0c:	fe843783          	ld	a5,-24(s0)
    80006e10:	00e7b023          	sd	a4,0(a5)
    80006e14:	0600006f          	j	80006e74 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    80006e18:	fe043783          	ld	a5,-32(s0)
    80006e1c:	0007b703          	ld	a4,0(a5)
    80006e20:	00006797          	auipc	a5,0x6
    80006e24:	07878793          	addi	a5,a5,120 # 8000ce98 <_ZN15MemoryAllocator11freeMemHeadE>
    80006e28:	00e7b023          	sd	a4,0(a5)
    80006e2c:	0480006f          	j	80006e74 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    80006e30:	fc043783          	ld	a5,-64(s0)
    80006e34:	fb843703          	ld	a4,-72(s0)
    80006e38:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    80006e3c:	fe043783          	ld	a5,-32(s0)
    80006e40:	0007b703          	ld	a4,0(a5)
    80006e44:	fc043783          	ld	a5,-64(s0)
    80006e48:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    80006e4c:	fe843783          	ld	a5,-24(s0)
    80006e50:	00078a63          	beqz	a5,80006e64 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    80006e54:	fe843783          	ld	a5,-24(s0)
    80006e58:	fc043703          	ld	a4,-64(s0)
    80006e5c:	00e7b023          	sd	a4,0(a5)
    80006e60:	0140006f          	j	80006e74 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    80006e64:	00006797          	auipc	a5,0x6
    80006e68:	03478793          	addi	a5,a5,52 # 8000ce98 <_ZN15MemoryAllocator11freeMemHeadE>
    80006e6c:	fc043703          	ld	a4,-64(s0)
    80006e70:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    80006e74:	fe043783          	ld	a5,-32(s0)
    80006e78:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    80006e7c:	fb043783          	ld	a5,-80(s0)
    80006e80:	fa843703          	ld	a4,-88(s0)
    80006e84:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    80006e88:	fb043783          	ld	a5,-80(s0)
    80006e8c:	fa442703          	lw	a4,-92(s0)
    80006e90:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    80006e94:	fb043783          	ld	a5,-80(s0)
    80006e98:	02078713          	addi	a4,a5,32
    80006e9c:	fb043783          	ld	a5,-80(s0)
    80006ea0:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    80006ea4:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80006ea8:	00006797          	auipc	a5,0x6
    80006eac:	fe878793          	addi	a5,a5,-24 # 8000ce90 <_ZN15MemoryAllocator11usedMemHeadE>
    80006eb0:	0007b783          	ld	a5,0(a5)
    80006eb4:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80006eb8:	fd043783          	ld	a5,-48(s0)
    80006ebc:	02078463          	beqz	a5,80006ee4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    80006ec0:	fd043703          	ld	a4,-48(s0)
    80006ec4:	fb043783          	ld	a5,-80(s0)
    80006ec8:	00f77e63          	bgeu	a4,a5,80006ee4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    80006ecc:	fd043783          	ld	a5,-48(s0)
    80006ed0:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80006ed4:	fd043783          	ld	a5,-48(s0)
    80006ed8:	0007b783          	ld	a5,0(a5)
    80006edc:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80006ee0:	fd9ff06f          	j	80006eb8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    80006ee4:	fd843783          	ld	a5,-40(s0)
    80006ee8:	02079663          	bnez	a5,80006f14 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    80006eec:	00006797          	auipc	a5,0x6
    80006ef0:	fa478793          	addi	a5,a5,-92 # 8000ce90 <_ZN15MemoryAllocator11usedMemHeadE>
    80006ef4:	0007b703          	ld	a4,0(a5)
    80006ef8:	fb043783          	ld	a5,-80(s0)
    80006efc:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    80006f00:	00006797          	auipc	a5,0x6
    80006f04:	f9078793          	addi	a5,a5,-112 # 8000ce90 <_ZN15MemoryAllocator11usedMemHeadE>
    80006f08:	fb043703          	ld	a4,-80(s0)
    80006f0c:	00e7b023          	sd	a4,0(a5)
    80006f10:	0200006f          	j	80006f30 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    80006f14:	fd843783          	ld	a5,-40(s0)
    80006f18:	0007b703          	ld	a4,0(a5)
    80006f1c:	fb043783          	ld	a5,-80(s0)
    80006f20:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    80006f24:	fd843783          	ld	a5,-40(s0)
    80006f28:	fb043703          	ld	a4,-80(s0)
    80006f2c:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    80006f30:	fb043783          	ld	a5,-80(s0)
    80006f34:	0187b783          	ld	a5,24(a5)
    80006f38:	0240006f          	j	80006f5c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    80006f3c:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80006f40:	fe043783          	ld	a5,-32(s0)
    80006f44:	fef43423          	sd	a5,-24(s0)
    80006f48:	fe043783          	ld	a5,-32(s0)
    80006f4c:	0007b783          	ld	a5,0(a5)
    80006f50:	fef43023          	sd	a5,-32(s0)
    80006f54:	e51ff06f          	j	80006da4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    80006f58:	00000793          	li	a5,0
}
    80006f5c:	00078513          	mv	a0,a5
    80006f60:	05813403          	ld	s0,88(sp)
    80006f64:	06010113          	addi	sp,sp,96
    80006f68:	00008067          	ret

0000000080006f6c <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80006f6c:	fb010113          	addi	sp,sp,-80
    80006f70:	04113423          	sd	ra,72(sp)
    80006f74:	04813023          	sd	s0,64(sp)
    80006f78:	05010413          	addi	s0,sp,80
    80006f7c:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    80006f80:	fb843783          	ld	a5,-72(s0)
    80006f84:	00079663          	bnez	a5,80006f90 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    80006f88:	00000793          	li	a5,0
    80006f8c:	1740006f          	j	80007100 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    80006f90:	00006797          	auipc	a5,0x6
    80006f94:	f0078793          	addi	a5,a5,-256 # 8000ce90 <_ZN15MemoryAllocator11usedMemHeadE>
    80006f98:	0007b783          	ld	a5,0(a5)
    80006f9c:	00079663          	bnez	a5,80006fa8 <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    80006fa0:	fff00793          	li	a5,-1
    80006fa4:	15c0006f          	j	80007100 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80006fa8:	fb843783          	ld	a5,-72(s0)
    80006fac:	fe078793          	addi	a5,a5,-32
    80006fb0:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    80006fb4:	00006797          	auipc	a5,0x6
    80006fb8:	edc78793          	addi	a5,a5,-292 # 8000ce90 <_ZN15MemoryAllocator11usedMemHeadE>
    80006fbc:	0007b783          	ld	a5,0(a5)
    80006fc0:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    80006fc4:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80006fc8:	fe843783          	ld	a5,-24(s0)
    80006fcc:	02078463          	beqz	a5,80006ff4 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80006fd0:	fe843703          	ld	a4,-24(s0)
    80006fd4:	fb843783          	ld	a5,-72(s0)
    80006fd8:	00f70e63          	beq	a4,a5,80006ff4 <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    80006fdc:	fe843783          	ld	a5,-24(s0)
    80006fe0:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80006fe4:	fe843783          	ld	a5,-24(s0)
    80006fe8:	0007b783          	ld	a5,0(a5)
    80006fec:	fef43423          	sd	a5,-24(s0)
    80006ff0:	fd9ff06f          	j	80006fc8 <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80006ff4:	fe843703          	ld	a4,-24(s0)
    80006ff8:	fb843783          	ld	a5,-72(s0)
    80006ffc:	00f70663          	beq	a4,a5,80007008 <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80007000:	fff00793          	li	a5,-1
    80007004:	0fc0006f          	j	80007100 <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    80007008:	fe043783          	ld	a5,-32(s0)
    8000700c:	00078c63          	beqz	a5,80007024 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80007010:	fe843783          	ld	a5,-24(s0)
    80007014:	0007b703          	ld	a4,0(a5)
    80007018:	fe043783          	ld	a5,-32(s0)
    8000701c:	00e7b023          	sd	a4,0(a5)
    80007020:	0180006f          	j	80007038 <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    80007024:	fe843783          	ld	a5,-24(s0)
    80007028:	0007b703          	ld	a4,0(a5)
    8000702c:	00006797          	auipc	a5,0x6
    80007030:	e6478793          	addi	a5,a5,-412 # 8000ce90 <_ZN15MemoryAllocator11usedMemHeadE>
    80007034:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    80007038:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    8000703c:	00006797          	auipc	a5,0x6
    80007040:	e5c78793          	addi	a5,a5,-420 # 8000ce98 <_ZN15MemoryAllocator11freeMemHeadE>
    80007044:	0007b783          	ld	a5,0(a5)
    80007048:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    8000704c:	fd043783          	ld	a5,-48(s0)
    80007050:	02078463          	beqz	a5,80007078 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80007054:	fd043703          	ld	a4,-48(s0)
    80007058:	fb843783          	ld	a5,-72(s0)
    8000705c:	00f77e63          	bgeu	a4,a5,80007078 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80007060:	fd043783          	ld	a5,-48(s0)
    80007064:	fcf43c23          	sd	a5,-40(s0)
    80007068:	fd043783          	ld	a5,-48(s0)
    8000706c:	0007b783          	ld	a5,0(a5)
    80007070:	fcf43823          	sd	a5,-48(s0)
    80007074:	fd9ff06f          	j	8000704c <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    80007078:	fb843783          	ld	a5,-72(s0)
    8000707c:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    80007080:	fb843783          	ld	a5,-72(s0)
    80007084:	0087b783          	ld	a5,8(a5)
    80007088:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    8000708c:	fc843783          	ld	a5,-56(s0)
    80007090:	fc043703          	ld	a4,-64(s0)
    80007094:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    80007098:	fd843783          	ld	a5,-40(s0)
    8000709c:	02078263          	beqz	a5,800070c0 <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    800070a0:	fd843783          	ld	a5,-40(s0)
    800070a4:	0007b703          	ld	a4,0(a5)
    800070a8:	fc843783          	ld	a5,-56(s0)
    800070ac:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    800070b0:	fd843783          	ld	a5,-40(s0)
    800070b4:	fc843703          	ld	a4,-56(s0)
    800070b8:	00e7b023          	sd	a4,0(a5)
    800070bc:	0280006f          	j	800070e4 <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    800070c0:	00006797          	auipc	a5,0x6
    800070c4:	dd878793          	addi	a5,a5,-552 # 8000ce98 <_ZN15MemoryAllocator11freeMemHeadE>
    800070c8:	0007b703          	ld	a4,0(a5)
    800070cc:	fc843783          	ld	a5,-56(s0)
    800070d0:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    800070d4:	00006797          	auipc	a5,0x6
    800070d8:	dc478793          	addi	a5,a5,-572 # 8000ce98 <_ZN15MemoryAllocator11freeMemHeadE>
    800070dc:	fc843703          	ld	a4,-56(s0)
    800070e0:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    800070e4:	fc843503          	ld	a0,-56(s0)
    800070e8:	00000097          	auipc	ra,0x0
    800070ec:	02c080e7          	jalr	44(ra) # 80007114 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    800070f0:	fd843503          	ld	a0,-40(s0)
    800070f4:	00000097          	auipc	ra,0x0
    800070f8:	020080e7          	jalr	32(ra) # 80007114 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    800070fc:	00000793          	li	a5,0
}
    80007100:	00078513          	mv	a0,a5
    80007104:	04813083          	ld	ra,72(sp)
    80007108:	04013403          	ld	s0,64(sp)
    8000710c:	05010113          	addi	sp,sp,80
    80007110:	00008067          	ret

0000000080007114 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80007114:	fc010113          	addi	sp,sp,-64
    80007118:	02813c23          	sd	s0,56(sp)
    8000711c:	04010413          	addi	s0,sp,64
    80007120:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    80007124:	fc843783          	ld	a5,-56(s0)
    80007128:	00079663          	bnez	a5,80007134 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    8000712c:	00000793          	li	a5,0
    80007130:	0a00006f          	j	800071d0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    80007134:	fc843783          	ld	a5,-56(s0)
    80007138:	0007b783          	ld	a5,0(a5)
    8000713c:	00f037b3          	snez	a5,a5
    80007140:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    80007144:	fc843783          	ld	a5,-56(s0)
    80007148:	0087b783          	ld	a5,8(a5)
    8000714c:	fc843703          	ld	a4,-56(s0)
    80007150:	00f707b3          	add	a5,a4,a5
    80007154:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    80007158:	fc843783          	ld	a5,-56(s0)
    8000715c:	0007b783          	ld	a5,0(a5)
    80007160:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    80007164:	fe043703          	ld	a4,-32(s0)
    80007168:	fd843783          	ld	a5,-40(s0)
    8000716c:	40f707b3          	sub	a5,a4,a5
    80007170:	0017b793          	seqz	a5,a5
    80007174:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    80007178:	fef44783          	lbu	a5,-17(s0)
    8000717c:	0ff7f793          	andi	a5,a5,255
    80007180:	04078663          	beqz	a5,800071cc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    80007184:	fd744783          	lbu	a5,-41(s0)
    80007188:	0ff7f793          	andi	a5,a5,255
    8000718c:	04078063          	beqz	a5,800071cc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    80007190:	fc843783          	ld	a5,-56(s0)
    80007194:	0087b703          	ld	a4,8(a5)
    80007198:	fc843783          	ld	a5,-56(s0)
    8000719c:	0007b783          	ld	a5,0(a5)
    800071a0:	0087b783          	ld	a5,8(a5)
    800071a4:	00f70733          	add	a4,a4,a5
    800071a8:	fc843783          	ld	a5,-56(s0)
    800071ac:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    800071b0:	fc843783          	ld	a5,-56(s0)
    800071b4:	0007b783          	ld	a5,0(a5)
    800071b8:	0007b703          	ld	a4,0(a5)
    800071bc:	fc843783          	ld	a5,-56(s0)
    800071c0:	00e7b023          	sd	a4,0(a5)
        return 1;
    800071c4:	00100793          	li	a5,1
    800071c8:	0080006f          	j	800071d0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    800071cc:	00000793          	li	a5,0
}
    800071d0:	00078513          	mv	a0,a5
    800071d4:	03813403          	ld	s0,56(sp)
    800071d8:	04010113          	addi	sp,sp,64
    800071dc:	00008067          	ret

00000000800071e0 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    800071e0:	fe010113          	addi	sp,sp,-32
    800071e4:	00813c23          	sd	s0,24(sp)
    800071e8:	02010413          	addi	s0,sp,32
    800071ec:	fea43423          	sd	a0,-24(s0)
    800071f0:	00058793          	mv	a5,a1
    800071f4:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    800071f8:	fe843783          	ld	a5,-24(s0)
    800071fc:	fe078793          	addi	a5,a5,-32
    80007200:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    80007204:	fe843783          	ld	a5,-24(s0)
    80007208:	0107a703          	lw	a4,16(a5)
    8000720c:	fe442783          	lw	a5,-28(s0)
    80007210:	0007879b          	sext.w	a5,a5
    80007214:	40e787b3          	sub	a5,a5,a4
    80007218:	0017b793          	seqz	a5,a5
    8000721c:	0ff7f793          	andi	a5,a5,255
}
    80007220:	00078513          	mv	a0,a5
    80007224:	01813403          	ld	s0,24(sp)
    80007228:	02010113          	addi	sp,sp,32
    8000722c:	00008067          	ret

0000000080007230 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    80007230:	ff010113          	addi	sp,sp,-16
    80007234:	00813423          	sd	s0,8(sp)
    80007238:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    8000723c:	00006797          	auipc	a5,0x6
    80007240:	c6478793          	addi	a5,a5,-924 # 8000cea0 <_ZN15MemoryAllocator11initializedE>
    80007244:	0007c783          	lbu	a5,0(a5)
    80007248:	0017c793          	xori	a5,a5,1
    8000724c:	0ff7f793          	andi	a5,a5,255
    80007250:	06078a63          	beqz	a5,800072c4 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    80007254:	00006797          	auipc	a5,0x6
    80007258:	9cc7b783          	ld	a5,-1588(a5) # 8000cc20 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000725c:	0007b703          	ld	a4,0(a5)
    80007260:	00006797          	auipc	a5,0x6
    80007264:	c3878793          	addi	a5,a5,-968 # 8000ce98 <_ZN15MemoryAllocator11freeMemHeadE>
    80007268:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    8000726c:	00006797          	auipc	a5,0x6
    80007270:	c2c78793          	addi	a5,a5,-980 # 8000ce98 <_ZN15MemoryAllocator11freeMemHeadE>
    80007274:	0007b783          	ld	a5,0(a5)
    80007278:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    8000727c:	00006797          	auipc	a5,0x6
    80007280:	9ec7b783          	ld	a5,-1556(a5) # 8000cc68 <_GLOBAL_OFFSET_TABLE_+0x70>
    80007284:	0007b703          	ld	a4,0(a5)
    80007288:	00006797          	auipc	a5,0x6
    8000728c:	9987b783          	ld	a5,-1640(a5) # 8000cc20 <_GLOBAL_OFFSET_TABLE_+0x28>
    80007290:	0007b783          	ld	a5,0(a5)
    80007294:	40f70733          	sub	a4,a4,a5
    80007298:	00006797          	auipc	a5,0x6
    8000729c:	c0078793          	addi	a5,a5,-1024 # 8000ce98 <_ZN15MemoryAllocator11freeMemHeadE>
    800072a0:	0007b783          	ld	a5,0(a5)
    800072a4:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    800072a8:	00006797          	auipc	a5,0x6
    800072ac:	be878793          	addi	a5,a5,-1048 # 8000ce90 <_ZN15MemoryAllocator11usedMemHeadE>
    800072b0:	0007b023          	sd	zero,0(a5)

        initialized = true;
    800072b4:	00006797          	auipc	a5,0x6
    800072b8:	bec78793          	addi	a5,a5,-1044 # 8000cea0 <_ZN15MemoryAllocator11initializedE>
    800072bc:	00100713          	li	a4,1
    800072c0:	00e78023          	sb	a4,0(a5)
    }
}
    800072c4:	00000013          	nop
    800072c8:	00813403          	ld	s0,8(sp)
    800072cc:	01010113          	addi	sp,sp,16
    800072d0:	00008067          	ret

00000000800072d4 <start>:
    800072d4:	ff010113          	addi	sp,sp,-16
    800072d8:	00813423          	sd	s0,8(sp)
    800072dc:	01010413          	addi	s0,sp,16
    800072e0:	300027f3          	csrr	a5,mstatus
    800072e4:	ffffe737          	lui	a4,0xffffe
    800072e8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff06ef>
    800072ec:	00e7f7b3          	and	a5,a5,a4
    800072f0:	00001737          	lui	a4,0x1
    800072f4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800072f8:	00e7e7b3          	or	a5,a5,a4
    800072fc:	30079073          	csrw	mstatus,a5
    80007300:	00000797          	auipc	a5,0x0
    80007304:	16078793          	addi	a5,a5,352 # 80007460 <system_main>
    80007308:	34179073          	csrw	mepc,a5
    8000730c:	00000793          	li	a5,0
    80007310:	18079073          	csrw	satp,a5
    80007314:	000107b7          	lui	a5,0x10
    80007318:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000731c:	30279073          	csrw	medeleg,a5
    80007320:	30379073          	csrw	mideleg,a5
    80007324:	104027f3          	csrr	a5,sie
    80007328:	2227e793          	ori	a5,a5,546
    8000732c:	10479073          	csrw	sie,a5
    80007330:	fff00793          	li	a5,-1
    80007334:	00a7d793          	srli	a5,a5,0xa
    80007338:	3b079073          	csrw	pmpaddr0,a5
    8000733c:	00f00793          	li	a5,15
    80007340:	3a079073          	csrw	pmpcfg0,a5
    80007344:	f14027f3          	csrr	a5,mhartid
    80007348:	0200c737          	lui	a4,0x200c
    8000734c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007350:	0007869b          	sext.w	a3,a5
    80007354:	00269713          	slli	a4,a3,0x2
    80007358:	000f4637          	lui	a2,0xf4
    8000735c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007360:	00d70733          	add	a4,a4,a3
    80007364:	0037979b          	slliw	a5,a5,0x3
    80007368:	020046b7          	lui	a3,0x2004
    8000736c:	00d787b3          	add	a5,a5,a3
    80007370:	00c585b3          	add	a1,a1,a2
    80007374:	00371693          	slli	a3,a4,0x3
    80007378:	00006717          	auipc	a4,0x6
    8000737c:	b3870713          	addi	a4,a4,-1224 # 8000ceb0 <timer_scratch>
    80007380:	00b7b023          	sd	a1,0(a5)
    80007384:	00d70733          	add	a4,a4,a3
    80007388:	00f73c23          	sd	a5,24(a4)
    8000738c:	02c73023          	sd	a2,32(a4)
    80007390:	34071073          	csrw	mscratch,a4
    80007394:	00000797          	auipc	a5,0x0
    80007398:	6ec78793          	addi	a5,a5,1772 # 80007a80 <timervec>
    8000739c:	30579073          	csrw	mtvec,a5
    800073a0:	300027f3          	csrr	a5,mstatus
    800073a4:	0087e793          	ori	a5,a5,8
    800073a8:	30079073          	csrw	mstatus,a5
    800073ac:	304027f3          	csrr	a5,mie
    800073b0:	0807e793          	ori	a5,a5,128
    800073b4:	30479073          	csrw	mie,a5
    800073b8:	f14027f3          	csrr	a5,mhartid
    800073bc:	0007879b          	sext.w	a5,a5
    800073c0:	00078213          	mv	tp,a5
    800073c4:	30200073          	mret
    800073c8:	00813403          	ld	s0,8(sp)
    800073cc:	01010113          	addi	sp,sp,16
    800073d0:	00008067          	ret

00000000800073d4 <timerinit>:
    800073d4:	ff010113          	addi	sp,sp,-16
    800073d8:	00813423          	sd	s0,8(sp)
    800073dc:	01010413          	addi	s0,sp,16
    800073e0:	f14027f3          	csrr	a5,mhartid
    800073e4:	0200c737          	lui	a4,0x200c
    800073e8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800073ec:	0007869b          	sext.w	a3,a5
    800073f0:	00269713          	slli	a4,a3,0x2
    800073f4:	000f4637          	lui	a2,0xf4
    800073f8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800073fc:	00d70733          	add	a4,a4,a3
    80007400:	0037979b          	slliw	a5,a5,0x3
    80007404:	020046b7          	lui	a3,0x2004
    80007408:	00d787b3          	add	a5,a5,a3
    8000740c:	00c585b3          	add	a1,a1,a2
    80007410:	00371693          	slli	a3,a4,0x3
    80007414:	00006717          	auipc	a4,0x6
    80007418:	a9c70713          	addi	a4,a4,-1380 # 8000ceb0 <timer_scratch>
    8000741c:	00b7b023          	sd	a1,0(a5)
    80007420:	00d70733          	add	a4,a4,a3
    80007424:	00f73c23          	sd	a5,24(a4)
    80007428:	02c73023          	sd	a2,32(a4)
    8000742c:	34071073          	csrw	mscratch,a4
    80007430:	00000797          	auipc	a5,0x0
    80007434:	65078793          	addi	a5,a5,1616 # 80007a80 <timervec>
    80007438:	30579073          	csrw	mtvec,a5
    8000743c:	300027f3          	csrr	a5,mstatus
    80007440:	0087e793          	ori	a5,a5,8
    80007444:	30079073          	csrw	mstatus,a5
    80007448:	304027f3          	csrr	a5,mie
    8000744c:	0807e793          	ori	a5,a5,128
    80007450:	30479073          	csrw	mie,a5
    80007454:	00813403          	ld	s0,8(sp)
    80007458:	01010113          	addi	sp,sp,16
    8000745c:	00008067          	ret

0000000080007460 <system_main>:
    80007460:	fe010113          	addi	sp,sp,-32
    80007464:	00813823          	sd	s0,16(sp)
    80007468:	00913423          	sd	s1,8(sp)
    8000746c:	00113c23          	sd	ra,24(sp)
    80007470:	02010413          	addi	s0,sp,32
    80007474:	00000097          	auipc	ra,0x0
    80007478:	0c4080e7          	jalr	196(ra) # 80007538 <cpuid>
    8000747c:	00006497          	auipc	s1,0x6
    80007480:	82448493          	addi	s1,s1,-2012 # 8000cca0 <started>
    80007484:	02050263          	beqz	a0,800074a8 <system_main+0x48>
    80007488:	0004a783          	lw	a5,0(s1)
    8000748c:	0007879b          	sext.w	a5,a5
    80007490:	fe078ce3          	beqz	a5,80007488 <system_main+0x28>
    80007494:	0ff0000f          	fence
    80007498:	00003517          	auipc	a0,0x3
    8000749c:	22850513          	addi	a0,a0,552 # 8000a6c0 <CONSOLE_STATUS+0x6b0>
    800074a0:	00001097          	auipc	ra,0x1
    800074a4:	a7c080e7          	jalr	-1412(ra) # 80007f1c <panic>
    800074a8:	00001097          	auipc	ra,0x1
    800074ac:	9d0080e7          	jalr	-1584(ra) # 80007e78 <consoleinit>
    800074b0:	00001097          	auipc	ra,0x1
    800074b4:	15c080e7          	jalr	348(ra) # 8000860c <printfinit>
    800074b8:	00003517          	auipc	a0,0x3
    800074bc:	09050513          	addi	a0,a0,144 # 8000a548 <CONSOLE_STATUS+0x538>
    800074c0:	00001097          	auipc	ra,0x1
    800074c4:	ab8080e7          	jalr	-1352(ra) # 80007f78 <__printf>
    800074c8:	00003517          	auipc	a0,0x3
    800074cc:	1c850513          	addi	a0,a0,456 # 8000a690 <CONSOLE_STATUS+0x680>
    800074d0:	00001097          	auipc	ra,0x1
    800074d4:	aa8080e7          	jalr	-1368(ra) # 80007f78 <__printf>
    800074d8:	00003517          	auipc	a0,0x3
    800074dc:	07050513          	addi	a0,a0,112 # 8000a548 <CONSOLE_STATUS+0x538>
    800074e0:	00001097          	auipc	ra,0x1
    800074e4:	a98080e7          	jalr	-1384(ra) # 80007f78 <__printf>
    800074e8:	00001097          	auipc	ra,0x1
    800074ec:	4b0080e7          	jalr	1200(ra) # 80008998 <kinit>
    800074f0:	00000097          	auipc	ra,0x0
    800074f4:	148080e7          	jalr	328(ra) # 80007638 <trapinit>
    800074f8:	00000097          	auipc	ra,0x0
    800074fc:	16c080e7          	jalr	364(ra) # 80007664 <trapinithart>
    80007500:	00000097          	auipc	ra,0x0
    80007504:	5c0080e7          	jalr	1472(ra) # 80007ac0 <plicinit>
    80007508:	00000097          	auipc	ra,0x0
    8000750c:	5e0080e7          	jalr	1504(ra) # 80007ae8 <plicinithart>
    80007510:	00000097          	auipc	ra,0x0
    80007514:	078080e7          	jalr	120(ra) # 80007588 <userinit>
    80007518:	0ff0000f          	fence
    8000751c:	00100793          	li	a5,1
    80007520:	00003517          	auipc	a0,0x3
    80007524:	18850513          	addi	a0,a0,392 # 8000a6a8 <CONSOLE_STATUS+0x698>
    80007528:	00f4a023          	sw	a5,0(s1)
    8000752c:	00001097          	auipc	ra,0x1
    80007530:	a4c080e7          	jalr	-1460(ra) # 80007f78 <__printf>
    80007534:	0000006f          	j	80007534 <system_main+0xd4>

0000000080007538 <cpuid>:
    80007538:	ff010113          	addi	sp,sp,-16
    8000753c:	00813423          	sd	s0,8(sp)
    80007540:	01010413          	addi	s0,sp,16
    80007544:	00020513          	mv	a0,tp
    80007548:	00813403          	ld	s0,8(sp)
    8000754c:	0005051b          	sext.w	a0,a0
    80007550:	01010113          	addi	sp,sp,16
    80007554:	00008067          	ret

0000000080007558 <mycpu>:
    80007558:	ff010113          	addi	sp,sp,-16
    8000755c:	00813423          	sd	s0,8(sp)
    80007560:	01010413          	addi	s0,sp,16
    80007564:	00020793          	mv	a5,tp
    80007568:	00813403          	ld	s0,8(sp)
    8000756c:	0007879b          	sext.w	a5,a5
    80007570:	00779793          	slli	a5,a5,0x7
    80007574:	00007517          	auipc	a0,0x7
    80007578:	96c50513          	addi	a0,a0,-1684 # 8000dee0 <cpus>
    8000757c:	00f50533          	add	a0,a0,a5
    80007580:	01010113          	addi	sp,sp,16
    80007584:	00008067          	ret

0000000080007588 <userinit>:
    80007588:	ff010113          	addi	sp,sp,-16
    8000758c:	00813423          	sd	s0,8(sp)
    80007590:	01010413          	addi	s0,sp,16
    80007594:	00813403          	ld	s0,8(sp)
    80007598:	01010113          	addi	sp,sp,16
    8000759c:	ffffb317          	auipc	t1,0xffffb
    800075a0:	86830067          	jr	-1944(t1) # 80001e04 <main>

00000000800075a4 <either_copyout>:
    800075a4:	ff010113          	addi	sp,sp,-16
    800075a8:	00813023          	sd	s0,0(sp)
    800075ac:	00113423          	sd	ra,8(sp)
    800075b0:	01010413          	addi	s0,sp,16
    800075b4:	02051663          	bnez	a0,800075e0 <either_copyout+0x3c>
    800075b8:	00058513          	mv	a0,a1
    800075bc:	00060593          	mv	a1,a2
    800075c0:	0006861b          	sext.w	a2,a3
    800075c4:	00002097          	auipc	ra,0x2
    800075c8:	c60080e7          	jalr	-928(ra) # 80009224 <__memmove>
    800075cc:	00813083          	ld	ra,8(sp)
    800075d0:	00013403          	ld	s0,0(sp)
    800075d4:	00000513          	li	a0,0
    800075d8:	01010113          	addi	sp,sp,16
    800075dc:	00008067          	ret
    800075e0:	00003517          	auipc	a0,0x3
    800075e4:	10850513          	addi	a0,a0,264 # 8000a6e8 <CONSOLE_STATUS+0x6d8>
    800075e8:	00001097          	auipc	ra,0x1
    800075ec:	934080e7          	jalr	-1740(ra) # 80007f1c <panic>

00000000800075f0 <either_copyin>:
    800075f0:	ff010113          	addi	sp,sp,-16
    800075f4:	00813023          	sd	s0,0(sp)
    800075f8:	00113423          	sd	ra,8(sp)
    800075fc:	01010413          	addi	s0,sp,16
    80007600:	02059463          	bnez	a1,80007628 <either_copyin+0x38>
    80007604:	00060593          	mv	a1,a2
    80007608:	0006861b          	sext.w	a2,a3
    8000760c:	00002097          	auipc	ra,0x2
    80007610:	c18080e7          	jalr	-1000(ra) # 80009224 <__memmove>
    80007614:	00813083          	ld	ra,8(sp)
    80007618:	00013403          	ld	s0,0(sp)
    8000761c:	00000513          	li	a0,0
    80007620:	01010113          	addi	sp,sp,16
    80007624:	00008067          	ret
    80007628:	00003517          	auipc	a0,0x3
    8000762c:	0e850513          	addi	a0,a0,232 # 8000a710 <CONSOLE_STATUS+0x700>
    80007630:	00001097          	auipc	ra,0x1
    80007634:	8ec080e7          	jalr	-1812(ra) # 80007f1c <panic>

0000000080007638 <trapinit>:
    80007638:	ff010113          	addi	sp,sp,-16
    8000763c:	00813423          	sd	s0,8(sp)
    80007640:	01010413          	addi	s0,sp,16
    80007644:	00813403          	ld	s0,8(sp)
    80007648:	00003597          	auipc	a1,0x3
    8000764c:	0f058593          	addi	a1,a1,240 # 8000a738 <CONSOLE_STATUS+0x728>
    80007650:	00007517          	auipc	a0,0x7
    80007654:	91050513          	addi	a0,a0,-1776 # 8000df60 <tickslock>
    80007658:	01010113          	addi	sp,sp,16
    8000765c:	00001317          	auipc	t1,0x1
    80007660:	5cc30067          	jr	1484(t1) # 80008c28 <initlock>

0000000080007664 <trapinithart>:
    80007664:	ff010113          	addi	sp,sp,-16
    80007668:	00813423          	sd	s0,8(sp)
    8000766c:	01010413          	addi	s0,sp,16
    80007670:	00000797          	auipc	a5,0x0
    80007674:	30078793          	addi	a5,a5,768 # 80007970 <kernelvec>
    80007678:	10579073          	csrw	stvec,a5
    8000767c:	00813403          	ld	s0,8(sp)
    80007680:	01010113          	addi	sp,sp,16
    80007684:	00008067          	ret

0000000080007688 <usertrap>:
    80007688:	ff010113          	addi	sp,sp,-16
    8000768c:	00813423          	sd	s0,8(sp)
    80007690:	01010413          	addi	s0,sp,16
    80007694:	00813403          	ld	s0,8(sp)
    80007698:	01010113          	addi	sp,sp,16
    8000769c:	00008067          	ret

00000000800076a0 <usertrapret>:
    800076a0:	ff010113          	addi	sp,sp,-16
    800076a4:	00813423          	sd	s0,8(sp)
    800076a8:	01010413          	addi	s0,sp,16
    800076ac:	00813403          	ld	s0,8(sp)
    800076b0:	01010113          	addi	sp,sp,16
    800076b4:	00008067          	ret

00000000800076b8 <kerneltrap>:
    800076b8:	fe010113          	addi	sp,sp,-32
    800076bc:	00813823          	sd	s0,16(sp)
    800076c0:	00113c23          	sd	ra,24(sp)
    800076c4:	00913423          	sd	s1,8(sp)
    800076c8:	02010413          	addi	s0,sp,32
    800076cc:	142025f3          	csrr	a1,scause
    800076d0:	100027f3          	csrr	a5,sstatus
    800076d4:	0027f793          	andi	a5,a5,2
    800076d8:	10079c63          	bnez	a5,800077f0 <kerneltrap+0x138>
    800076dc:	142027f3          	csrr	a5,scause
    800076e0:	0207ce63          	bltz	a5,8000771c <kerneltrap+0x64>
    800076e4:	00003517          	auipc	a0,0x3
    800076e8:	09c50513          	addi	a0,a0,156 # 8000a780 <CONSOLE_STATUS+0x770>
    800076ec:	00001097          	auipc	ra,0x1
    800076f0:	88c080e7          	jalr	-1908(ra) # 80007f78 <__printf>
    800076f4:	141025f3          	csrr	a1,sepc
    800076f8:	14302673          	csrr	a2,stval
    800076fc:	00003517          	auipc	a0,0x3
    80007700:	09450513          	addi	a0,a0,148 # 8000a790 <CONSOLE_STATUS+0x780>
    80007704:	00001097          	auipc	ra,0x1
    80007708:	874080e7          	jalr	-1932(ra) # 80007f78 <__printf>
    8000770c:	00003517          	auipc	a0,0x3
    80007710:	09c50513          	addi	a0,a0,156 # 8000a7a8 <CONSOLE_STATUS+0x798>
    80007714:	00001097          	auipc	ra,0x1
    80007718:	808080e7          	jalr	-2040(ra) # 80007f1c <panic>
    8000771c:	0ff7f713          	andi	a4,a5,255
    80007720:	00900693          	li	a3,9
    80007724:	04d70063          	beq	a4,a3,80007764 <kerneltrap+0xac>
    80007728:	fff00713          	li	a4,-1
    8000772c:	03f71713          	slli	a4,a4,0x3f
    80007730:	00170713          	addi	a4,a4,1
    80007734:	fae798e3          	bne	a5,a4,800076e4 <kerneltrap+0x2c>
    80007738:	00000097          	auipc	ra,0x0
    8000773c:	e00080e7          	jalr	-512(ra) # 80007538 <cpuid>
    80007740:	06050663          	beqz	a0,800077ac <kerneltrap+0xf4>
    80007744:	144027f3          	csrr	a5,sip
    80007748:	ffd7f793          	andi	a5,a5,-3
    8000774c:	14479073          	csrw	sip,a5
    80007750:	01813083          	ld	ra,24(sp)
    80007754:	01013403          	ld	s0,16(sp)
    80007758:	00813483          	ld	s1,8(sp)
    8000775c:	02010113          	addi	sp,sp,32
    80007760:	00008067          	ret
    80007764:	00000097          	auipc	ra,0x0
    80007768:	3d0080e7          	jalr	976(ra) # 80007b34 <plic_claim>
    8000776c:	00a00793          	li	a5,10
    80007770:	00050493          	mv	s1,a0
    80007774:	06f50863          	beq	a0,a5,800077e4 <kerneltrap+0x12c>
    80007778:	fc050ce3          	beqz	a0,80007750 <kerneltrap+0x98>
    8000777c:	00050593          	mv	a1,a0
    80007780:	00003517          	auipc	a0,0x3
    80007784:	fe050513          	addi	a0,a0,-32 # 8000a760 <CONSOLE_STATUS+0x750>
    80007788:	00000097          	auipc	ra,0x0
    8000778c:	7f0080e7          	jalr	2032(ra) # 80007f78 <__printf>
    80007790:	01013403          	ld	s0,16(sp)
    80007794:	01813083          	ld	ra,24(sp)
    80007798:	00048513          	mv	a0,s1
    8000779c:	00813483          	ld	s1,8(sp)
    800077a0:	02010113          	addi	sp,sp,32
    800077a4:	00000317          	auipc	t1,0x0
    800077a8:	3c830067          	jr	968(t1) # 80007b6c <plic_complete>
    800077ac:	00006517          	auipc	a0,0x6
    800077b0:	7b450513          	addi	a0,a0,1972 # 8000df60 <tickslock>
    800077b4:	00001097          	auipc	ra,0x1
    800077b8:	498080e7          	jalr	1176(ra) # 80008c4c <acquire>
    800077bc:	00005717          	auipc	a4,0x5
    800077c0:	4e870713          	addi	a4,a4,1256 # 8000cca4 <ticks>
    800077c4:	00072783          	lw	a5,0(a4)
    800077c8:	00006517          	auipc	a0,0x6
    800077cc:	79850513          	addi	a0,a0,1944 # 8000df60 <tickslock>
    800077d0:	0017879b          	addiw	a5,a5,1
    800077d4:	00f72023          	sw	a5,0(a4)
    800077d8:	00001097          	auipc	ra,0x1
    800077dc:	540080e7          	jalr	1344(ra) # 80008d18 <release>
    800077e0:	f65ff06f          	j	80007744 <kerneltrap+0x8c>
    800077e4:	00001097          	auipc	ra,0x1
    800077e8:	09c080e7          	jalr	156(ra) # 80008880 <uartintr>
    800077ec:	fa5ff06f          	j	80007790 <kerneltrap+0xd8>
    800077f0:	00003517          	auipc	a0,0x3
    800077f4:	f5050513          	addi	a0,a0,-176 # 8000a740 <CONSOLE_STATUS+0x730>
    800077f8:	00000097          	auipc	ra,0x0
    800077fc:	724080e7          	jalr	1828(ra) # 80007f1c <panic>

0000000080007800 <clockintr>:
    80007800:	fe010113          	addi	sp,sp,-32
    80007804:	00813823          	sd	s0,16(sp)
    80007808:	00913423          	sd	s1,8(sp)
    8000780c:	00113c23          	sd	ra,24(sp)
    80007810:	02010413          	addi	s0,sp,32
    80007814:	00006497          	auipc	s1,0x6
    80007818:	74c48493          	addi	s1,s1,1868 # 8000df60 <tickslock>
    8000781c:	00048513          	mv	a0,s1
    80007820:	00001097          	auipc	ra,0x1
    80007824:	42c080e7          	jalr	1068(ra) # 80008c4c <acquire>
    80007828:	00005717          	auipc	a4,0x5
    8000782c:	47c70713          	addi	a4,a4,1148 # 8000cca4 <ticks>
    80007830:	00072783          	lw	a5,0(a4)
    80007834:	01013403          	ld	s0,16(sp)
    80007838:	01813083          	ld	ra,24(sp)
    8000783c:	00048513          	mv	a0,s1
    80007840:	0017879b          	addiw	a5,a5,1
    80007844:	00813483          	ld	s1,8(sp)
    80007848:	00f72023          	sw	a5,0(a4)
    8000784c:	02010113          	addi	sp,sp,32
    80007850:	00001317          	auipc	t1,0x1
    80007854:	4c830067          	jr	1224(t1) # 80008d18 <release>

0000000080007858 <devintr>:
    80007858:	142027f3          	csrr	a5,scause
    8000785c:	00000513          	li	a0,0
    80007860:	0007c463          	bltz	a5,80007868 <devintr+0x10>
    80007864:	00008067          	ret
    80007868:	fe010113          	addi	sp,sp,-32
    8000786c:	00813823          	sd	s0,16(sp)
    80007870:	00113c23          	sd	ra,24(sp)
    80007874:	00913423          	sd	s1,8(sp)
    80007878:	02010413          	addi	s0,sp,32
    8000787c:	0ff7f713          	andi	a4,a5,255
    80007880:	00900693          	li	a3,9
    80007884:	04d70c63          	beq	a4,a3,800078dc <devintr+0x84>
    80007888:	fff00713          	li	a4,-1
    8000788c:	03f71713          	slli	a4,a4,0x3f
    80007890:	00170713          	addi	a4,a4,1
    80007894:	00e78c63          	beq	a5,a4,800078ac <devintr+0x54>
    80007898:	01813083          	ld	ra,24(sp)
    8000789c:	01013403          	ld	s0,16(sp)
    800078a0:	00813483          	ld	s1,8(sp)
    800078a4:	02010113          	addi	sp,sp,32
    800078a8:	00008067          	ret
    800078ac:	00000097          	auipc	ra,0x0
    800078b0:	c8c080e7          	jalr	-884(ra) # 80007538 <cpuid>
    800078b4:	06050663          	beqz	a0,80007920 <devintr+0xc8>
    800078b8:	144027f3          	csrr	a5,sip
    800078bc:	ffd7f793          	andi	a5,a5,-3
    800078c0:	14479073          	csrw	sip,a5
    800078c4:	01813083          	ld	ra,24(sp)
    800078c8:	01013403          	ld	s0,16(sp)
    800078cc:	00813483          	ld	s1,8(sp)
    800078d0:	00200513          	li	a0,2
    800078d4:	02010113          	addi	sp,sp,32
    800078d8:	00008067          	ret
    800078dc:	00000097          	auipc	ra,0x0
    800078e0:	258080e7          	jalr	600(ra) # 80007b34 <plic_claim>
    800078e4:	00a00793          	li	a5,10
    800078e8:	00050493          	mv	s1,a0
    800078ec:	06f50663          	beq	a0,a5,80007958 <devintr+0x100>
    800078f0:	00100513          	li	a0,1
    800078f4:	fa0482e3          	beqz	s1,80007898 <devintr+0x40>
    800078f8:	00048593          	mv	a1,s1
    800078fc:	00003517          	auipc	a0,0x3
    80007900:	e6450513          	addi	a0,a0,-412 # 8000a760 <CONSOLE_STATUS+0x750>
    80007904:	00000097          	auipc	ra,0x0
    80007908:	674080e7          	jalr	1652(ra) # 80007f78 <__printf>
    8000790c:	00048513          	mv	a0,s1
    80007910:	00000097          	auipc	ra,0x0
    80007914:	25c080e7          	jalr	604(ra) # 80007b6c <plic_complete>
    80007918:	00100513          	li	a0,1
    8000791c:	f7dff06f          	j	80007898 <devintr+0x40>
    80007920:	00006517          	auipc	a0,0x6
    80007924:	64050513          	addi	a0,a0,1600 # 8000df60 <tickslock>
    80007928:	00001097          	auipc	ra,0x1
    8000792c:	324080e7          	jalr	804(ra) # 80008c4c <acquire>
    80007930:	00005717          	auipc	a4,0x5
    80007934:	37470713          	addi	a4,a4,884 # 8000cca4 <ticks>
    80007938:	00072783          	lw	a5,0(a4)
    8000793c:	00006517          	auipc	a0,0x6
    80007940:	62450513          	addi	a0,a0,1572 # 8000df60 <tickslock>
    80007944:	0017879b          	addiw	a5,a5,1
    80007948:	00f72023          	sw	a5,0(a4)
    8000794c:	00001097          	auipc	ra,0x1
    80007950:	3cc080e7          	jalr	972(ra) # 80008d18 <release>
    80007954:	f65ff06f          	j	800078b8 <devintr+0x60>
    80007958:	00001097          	auipc	ra,0x1
    8000795c:	f28080e7          	jalr	-216(ra) # 80008880 <uartintr>
    80007960:	fadff06f          	j	8000790c <devintr+0xb4>
	...

0000000080007970 <kernelvec>:
    80007970:	f0010113          	addi	sp,sp,-256
    80007974:	00113023          	sd	ra,0(sp)
    80007978:	00213423          	sd	sp,8(sp)
    8000797c:	00313823          	sd	gp,16(sp)
    80007980:	00413c23          	sd	tp,24(sp)
    80007984:	02513023          	sd	t0,32(sp)
    80007988:	02613423          	sd	t1,40(sp)
    8000798c:	02713823          	sd	t2,48(sp)
    80007990:	02813c23          	sd	s0,56(sp)
    80007994:	04913023          	sd	s1,64(sp)
    80007998:	04a13423          	sd	a0,72(sp)
    8000799c:	04b13823          	sd	a1,80(sp)
    800079a0:	04c13c23          	sd	a2,88(sp)
    800079a4:	06d13023          	sd	a3,96(sp)
    800079a8:	06e13423          	sd	a4,104(sp)
    800079ac:	06f13823          	sd	a5,112(sp)
    800079b0:	07013c23          	sd	a6,120(sp)
    800079b4:	09113023          	sd	a7,128(sp)
    800079b8:	09213423          	sd	s2,136(sp)
    800079bc:	09313823          	sd	s3,144(sp)
    800079c0:	09413c23          	sd	s4,152(sp)
    800079c4:	0b513023          	sd	s5,160(sp)
    800079c8:	0b613423          	sd	s6,168(sp)
    800079cc:	0b713823          	sd	s7,176(sp)
    800079d0:	0b813c23          	sd	s8,184(sp)
    800079d4:	0d913023          	sd	s9,192(sp)
    800079d8:	0da13423          	sd	s10,200(sp)
    800079dc:	0db13823          	sd	s11,208(sp)
    800079e0:	0dc13c23          	sd	t3,216(sp)
    800079e4:	0fd13023          	sd	t4,224(sp)
    800079e8:	0fe13423          	sd	t5,232(sp)
    800079ec:	0ff13823          	sd	t6,240(sp)
    800079f0:	cc9ff0ef          	jal	ra,800076b8 <kerneltrap>
    800079f4:	00013083          	ld	ra,0(sp)
    800079f8:	00813103          	ld	sp,8(sp)
    800079fc:	01013183          	ld	gp,16(sp)
    80007a00:	02013283          	ld	t0,32(sp)
    80007a04:	02813303          	ld	t1,40(sp)
    80007a08:	03013383          	ld	t2,48(sp)
    80007a0c:	03813403          	ld	s0,56(sp)
    80007a10:	04013483          	ld	s1,64(sp)
    80007a14:	04813503          	ld	a0,72(sp)
    80007a18:	05013583          	ld	a1,80(sp)
    80007a1c:	05813603          	ld	a2,88(sp)
    80007a20:	06013683          	ld	a3,96(sp)
    80007a24:	06813703          	ld	a4,104(sp)
    80007a28:	07013783          	ld	a5,112(sp)
    80007a2c:	07813803          	ld	a6,120(sp)
    80007a30:	08013883          	ld	a7,128(sp)
    80007a34:	08813903          	ld	s2,136(sp)
    80007a38:	09013983          	ld	s3,144(sp)
    80007a3c:	09813a03          	ld	s4,152(sp)
    80007a40:	0a013a83          	ld	s5,160(sp)
    80007a44:	0a813b03          	ld	s6,168(sp)
    80007a48:	0b013b83          	ld	s7,176(sp)
    80007a4c:	0b813c03          	ld	s8,184(sp)
    80007a50:	0c013c83          	ld	s9,192(sp)
    80007a54:	0c813d03          	ld	s10,200(sp)
    80007a58:	0d013d83          	ld	s11,208(sp)
    80007a5c:	0d813e03          	ld	t3,216(sp)
    80007a60:	0e013e83          	ld	t4,224(sp)
    80007a64:	0e813f03          	ld	t5,232(sp)
    80007a68:	0f013f83          	ld	t6,240(sp)
    80007a6c:	10010113          	addi	sp,sp,256
    80007a70:	10200073          	sret
    80007a74:	00000013          	nop
    80007a78:	00000013          	nop
    80007a7c:	00000013          	nop

0000000080007a80 <timervec>:
    80007a80:	34051573          	csrrw	a0,mscratch,a0
    80007a84:	00b53023          	sd	a1,0(a0)
    80007a88:	00c53423          	sd	a2,8(a0)
    80007a8c:	00d53823          	sd	a3,16(a0)
    80007a90:	01853583          	ld	a1,24(a0)
    80007a94:	02053603          	ld	a2,32(a0)
    80007a98:	0005b683          	ld	a3,0(a1)
    80007a9c:	00c686b3          	add	a3,a3,a2
    80007aa0:	00d5b023          	sd	a3,0(a1)
    80007aa4:	00200593          	li	a1,2
    80007aa8:	14459073          	csrw	sip,a1
    80007aac:	01053683          	ld	a3,16(a0)
    80007ab0:	00853603          	ld	a2,8(a0)
    80007ab4:	00053583          	ld	a1,0(a0)
    80007ab8:	34051573          	csrrw	a0,mscratch,a0
    80007abc:	30200073          	mret

0000000080007ac0 <plicinit>:
    80007ac0:	ff010113          	addi	sp,sp,-16
    80007ac4:	00813423          	sd	s0,8(sp)
    80007ac8:	01010413          	addi	s0,sp,16
    80007acc:	00813403          	ld	s0,8(sp)
    80007ad0:	0c0007b7          	lui	a5,0xc000
    80007ad4:	00100713          	li	a4,1
    80007ad8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80007adc:	00e7a223          	sw	a4,4(a5)
    80007ae0:	01010113          	addi	sp,sp,16
    80007ae4:	00008067          	ret

0000000080007ae8 <plicinithart>:
    80007ae8:	ff010113          	addi	sp,sp,-16
    80007aec:	00813023          	sd	s0,0(sp)
    80007af0:	00113423          	sd	ra,8(sp)
    80007af4:	01010413          	addi	s0,sp,16
    80007af8:	00000097          	auipc	ra,0x0
    80007afc:	a40080e7          	jalr	-1472(ra) # 80007538 <cpuid>
    80007b00:	0085171b          	slliw	a4,a0,0x8
    80007b04:	0c0027b7          	lui	a5,0xc002
    80007b08:	00e787b3          	add	a5,a5,a4
    80007b0c:	40200713          	li	a4,1026
    80007b10:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007b14:	00813083          	ld	ra,8(sp)
    80007b18:	00013403          	ld	s0,0(sp)
    80007b1c:	00d5151b          	slliw	a0,a0,0xd
    80007b20:	0c2017b7          	lui	a5,0xc201
    80007b24:	00a78533          	add	a0,a5,a0
    80007b28:	00052023          	sw	zero,0(a0)
    80007b2c:	01010113          	addi	sp,sp,16
    80007b30:	00008067          	ret

0000000080007b34 <plic_claim>:
    80007b34:	ff010113          	addi	sp,sp,-16
    80007b38:	00813023          	sd	s0,0(sp)
    80007b3c:	00113423          	sd	ra,8(sp)
    80007b40:	01010413          	addi	s0,sp,16
    80007b44:	00000097          	auipc	ra,0x0
    80007b48:	9f4080e7          	jalr	-1548(ra) # 80007538 <cpuid>
    80007b4c:	00813083          	ld	ra,8(sp)
    80007b50:	00013403          	ld	s0,0(sp)
    80007b54:	00d5151b          	slliw	a0,a0,0xd
    80007b58:	0c2017b7          	lui	a5,0xc201
    80007b5c:	00a78533          	add	a0,a5,a0
    80007b60:	00452503          	lw	a0,4(a0)
    80007b64:	01010113          	addi	sp,sp,16
    80007b68:	00008067          	ret

0000000080007b6c <plic_complete>:
    80007b6c:	fe010113          	addi	sp,sp,-32
    80007b70:	00813823          	sd	s0,16(sp)
    80007b74:	00913423          	sd	s1,8(sp)
    80007b78:	00113c23          	sd	ra,24(sp)
    80007b7c:	02010413          	addi	s0,sp,32
    80007b80:	00050493          	mv	s1,a0
    80007b84:	00000097          	auipc	ra,0x0
    80007b88:	9b4080e7          	jalr	-1612(ra) # 80007538 <cpuid>
    80007b8c:	01813083          	ld	ra,24(sp)
    80007b90:	01013403          	ld	s0,16(sp)
    80007b94:	00d5179b          	slliw	a5,a0,0xd
    80007b98:	0c201737          	lui	a4,0xc201
    80007b9c:	00f707b3          	add	a5,a4,a5
    80007ba0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007ba4:	00813483          	ld	s1,8(sp)
    80007ba8:	02010113          	addi	sp,sp,32
    80007bac:	00008067          	ret

0000000080007bb0 <consolewrite>:
    80007bb0:	fb010113          	addi	sp,sp,-80
    80007bb4:	04813023          	sd	s0,64(sp)
    80007bb8:	04113423          	sd	ra,72(sp)
    80007bbc:	02913c23          	sd	s1,56(sp)
    80007bc0:	03213823          	sd	s2,48(sp)
    80007bc4:	03313423          	sd	s3,40(sp)
    80007bc8:	03413023          	sd	s4,32(sp)
    80007bcc:	01513c23          	sd	s5,24(sp)
    80007bd0:	05010413          	addi	s0,sp,80
    80007bd4:	06c05c63          	blez	a2,80007c4c <consolewrite+0x9c>
    80007bd8:	00060993          	mv	s3,a2
    80007bdc:	00050a13          	mv	s4,a0
    80007be0:	00058493          	mv	s1,a1
    80007be4:	00000913          	li	s2,0
    80007be8:	fff00a93          	li	s5,-1
    80007bec:	01c0006f          	j	80007c08 <consolewrite+0x58>
    80007bf0:	fbf44503          	lbu	a0,-65(s0)
    80007bf4:	0019091b          	addiw	s2,s2,1
    80007bf8:	00148493          	addi	s1,s1,1
    80007bfc:	00001097          	auipc	ra,0x1
    80007c00:	a9c080e7          	jalr	-1380(ra) # 80008698 <uartputc>
    80007c04:	03298063          	beq	s3,s2,80007c24 <consolewrite+0x74>
    80007c08:	00048613          	mv	a2,s1
    80007c0c:	00100693          	li	a3,1
    80007c10:	000a0593          	mv	a1,s4
    80007c14:	fbf40513          	addi	a0,s0,-65
    80007c18:	00000097          	auipc	ra,0x0
    80007c1c:	9d8080e7          	jalr	-1576(ra) # 800075f0 <either_copyin>
    80007c20:	fd5518e3          	bne	a0,s5,80007bf0 <consolewrite+0x40>
    80007c24:	04813083          	ld	ra,72(sp)
    80007c28:	04013403          	ld	s0,64(sp)
    80007c2c:	03813483          	ld	s1,56(sp)
    80007c30:	02813983          	ld	s3,40(sp)
    80007c34:	02013a03          	ld	s4,32(sp)
    80007c38:	01813a83          	ld	s5,24(sp)
    80007c3c:	00090513          	mv	a0,s2
    80007c40:	03013903          	ld	s2,48(sp)
    80007c44:	05010113          	addi	sp,sp,80
    80007c48:	00008067          	ret
    80007c4c:	00000913          	li	s2,0
    80007c50:	fd5ff06f          	j	80007c24 <consolewrite+0x74>

0000000080007c54 <consoleread>:
    80007c54:	f9010113          	addi	sp,sp,-112
    80007c58:	06813023          	sd	s0,96(sp)
    80007c5c:	04913c23          	sd	s1,88(sp)
    80007c60:	05213823          	sd	s2,80(sp)
    80007c64:	05313423          	sd	s3,72(sp)
    80007c68:	05413023          	sd	s4,64(sp)
    80007c6c:	03513c23          	sd	s5,56(sp)
    80007c70:	03613823          	sd	s6,48(sp)
    80007c74:	03713423          	sd	s7,40(sp)
    80007c78:	03813023          	sd	s8,32(sp)
    80007c7c:	06113423          	sd	ra,104(sp)
    80007c80:	01913c23          	sd	s9,24(sp)
    80007c84:	07010413          	addi	s0,sp,112
    80007c88:	00060b93          	mv	s7,a2
    80007c8c:	00050913          	mv	s2,a0
    80007c90:	00058c13          	mv	s8,a1
    80007c94:	00060b1b          	sext.w	s6,a2
    80007c98:	00006497          	auipc	s1,0x6
    80007c9c:	2f048493          	addi	s1,s1,752 # 8000df88 <cons>
    80007ca0:	00400993          	li	s3,4
    80007ca4:	fff00a13          	li	s4,-1
    80007ca8:	00a00a93          	li	s5,10
    80007cac:	05705e63          	blez	s7,80007d08 <consoleread+0xb4>
    80007cb0:	09c4a703          	lw	a4,156(s1)
    80007cb4:	0984a783          	lw	a5,152(s1)
    80007cb8:	0007071b          	sext.w	a4,a4
    80007cbc:	08e78463          	beq	a5,a4,80007d44 <consoleread+0xf0>
    80007cc0:	07f7f713          	andi	a4,a5,127
    80007cc4:	00e48733          	add	a4,s1,a4
    80007cc8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80007ccc:	0017869b          	addiw	a3,a5,1
    80007cd0:	08d4ac23          	sw	a3,152(s1)
    80007cd4:	00070c9b          	sext.w	s9,a4
    80007cd8:	0b370663          	beq	a4,s3,80007d84 <consoleread+0x130>
    80007cdc:	00100693          	li	a3,1
    80007ce0:	f9f40613          	addi	a2,s0,-97
    80007ce4:	000c0593          	mv	a1,s8
    80007ce8:	00090513          	mv	a0,s2
    80007cec:	f8e40fa3          	sb	a4,-97(s0)
    80007cf0:	00000097          	auipc	ra,0x0
    80007cf4:	8b4080e7          	jalr	-1868(ra) # 800075a4 <either_copyout>
    80007cf8:	01450863          	beq	a0,s4,80007d08 <consoleread+0xb4>
    80007cfc:	001c0c13          	addi	s8,s8,1
    80007d00:	fffb8b9b          	addiw	s7,s7,-1
    80007d04:	fb5c94e3          	bne	s9,s5,80007cac <consoleread+0x58>
    80007d08:	000b851b          	sext.w	a0,s7
    80007d0c:	06813083          	ld	ra,104(sp)
    80007d10:	06013403          	ld	s0,96(sp)
    80007d14:	05813483          	ld	s1,88(sp)
    80007d18:	05013903          	ld	s2,80(sp)
    80007d1c:	04813983          	ld	s3,72(sp)
    80007d20:	04013a03          	ld	s4,64(sp)
    80007d24:	03813a83          	ld	s5,56(sp)
    80007d28:	02813b83          	ld	s7,40(sp)
    80007d2c:	02013c03          	ld	s8,32(sp)
    80007d30:	01813c83          	ld	s9,24(sp)
    80007d34:	40ab053b          	subw	a0,s6,a0
    80007d38:	03013b03          	ld	s6,48(sp)
    80007d3c:	07010113          	addi	sp,sp,112
    80007d40:	00008067          	ret
    80007d44:	00001097          	auipc	ra,0x1
    80007d48:	1d8080e7          	jalr	472(ra) # 80008f1c <push_on>
    80007d4c:	0984a703          	lw	a4,152(s1)
    80007d50:	09c4a783          	lw	a5,156(s1)
    80007d54:	0007879b          	sext.w	a5,a5
    80007d58:	fef70ce3          	beq	a4,a5,80007d50 <consoleread+0xfc>
    80007d5c:	00001097          	auipc	ra,0x1
    80007d60:	234080e7          	jalr	564(ra) # 80008f90 <pop_on>
    80007d64:	0984a783          	lw	a5,152(s1)
    80007d68:	07f7f713          	andi	a4,a5,127
    80007d6c:	00e48733          	add	a4,s1,a4
    80007d70:	01874703          	lbu	a4,24(a4)
    80007d74:	0017869b          	addiw	a3,a5,1
    80007d78:	08d4ac23          	sw	a3,152(s1)
    80007d7c:	00070c9b          	sext.w	s9,a4
    80007d80:	f5371ee3          	bne	a4,s3,80007cdc <consoleread+0x88>
    80007d84:	000b851b          	sext.w	a0,s7
    80007d88:	f96bf2e3          	bgeu	s7,s6,80007d0c <consoleread+0xb8>
    80007d8c:	08f4ac23          	sw	a5,152(s1)
    80007d90:	f7dff06f          	j	80007d0c <consoleread+0xb8>

0000000080007d94 <consputc>:
    80007d94:	10000793          	li	a5,256
    80007d98:	00f50663          	beq	a0,a5,80007da4 <consputc+0x10>
    80007d9c:	00001317          	auipc	t1,0x1
    80007da0:	9f430067          	jr	-1548(t1) # 80008790 <uartputc_sync>
    80007da4:	ff010113          	addi	sp,sp,-16
    80007da8:	00113423          	sd	ra,8(sp)
    80007dac:	00813023          	sd	s0,0(sp)
    80007db0:	01010413          	addi	s0,sp,16
    80007db4:	00800513          	li	a0,8
    80007db8:	00001097          	auipc	ra,0x1
    80007dbc:	9d8080e7          	jalr	-1576(ra) # 80008790 <uartputc_sync>
    80007dc0:	02000513          	li	a0,32
    80007dc4:	00001097          	auipc	ra,0x1
    80007dc8:	9cc080e7          	jalr	-1588(ra) # 80008790 <uartputc_sync>
    80007dcc:	00013403          	ld	s0,0(sp)
    80007dd0:	00813083          	ld	ra,8(sp)
    80007dd4:	00800513          	li	a0,8
    80007dd8:	01010113          	addi	sp,sp,16
    80007ddc:	00001317          	auipc	t1,0x1
    80007de0:	9b430067          	jr	-1612(t1) # 80008790 <uartputc_sync>

0000000080007de4 <consoleintr>:
    80007de4:	fe010113          	addi	sp,sp,-32
    80007de8:	00813823          	sd	s0,16(sp)
    80007dec:	00913423          	sd	s1,8(sp)
    80007df0:	01213023          	sd	s2,0(sp)
    80007df4:	00113c23          	sd	ra,24(sp)
    80007df8:	02010413          	addi	s0,sp,32
    80007dfc:	00006917          	auipc	s2,0x6
    80007e00:	18c90913          	addi	s2,s2,396 # 8000df88 <cons>
    80007e04:	00050493          	mv	s1,a0
    80007e08:	00090513          	mv	a0,s2
    80007e0c:	00001097          	auipc	ra,0x1
    80007e10:	e40080e7          	jalr	-448(ra) # 80008c4c <acquire>
    80007e14:	02048c63          	beqz	s1,80007e4c <consoleintr+0x68>
    80007e18:	0a092783          	lw	a5,160(s2)
    80007e1c:	09892703          	lw	a4,152(s2)
    80007e20:	07f00693          	li	a3,127
    80007e24:	40e7873b          	subw	a4,a5,a4
    80007e28:	02e6e263          	bltu	a3,a4,80007e4c <consoleintr+0x68>
    80007e2c:	00d00713          	li	a4,13
    80007e30:	04e48063          	beq	s1,a4,80007e70 <consoleintr+0x8c>
    80007e34:	07f7f713          	andi	a4,a5,127
    80007e38:	00e90733          	add	a4,s2,a4
    80007e3c:	0017879b          	addiw	a5,a5,1
    80007e40:	0af92023          	sw	a5,160(s2)
    80007e44:	00970c23          	sb	s1,24(a4)
    80007e48:	08f92e23          	sw	a5,156(s2)
    80007e4c:	01013403          	ld	s0,16(sp)
    80007e50:	01813083          	ld	ra,24(sp)
    80007e54:	00813483          	ld	s1,8(sp)
    80007e58:	00013903          	ld	s2,0(sp)
    80007e5c:	00006517          	auipc	a0,0x6
    80007e60:	12c50513          	addi	a0,a0,300 # 8000df88 <cons>
    80007e64:	02010113          	addi	sp,sp,32
    80007e68:	00001317          	auipc	t1,0x1
    80007e6c:	eb030067          	jr	-336(t1) # 80008d18 <release>
    80007e70:	00a00493          	li	s1,10
    80007e74:	fc1ff06f          	j	80007e34 <consoleintr+0x50>

0000000080007e78 <consoleinit>:
    80007e78:	fe010113          	addi	sp,sp,-32
    80007e7c:	00113c23          	sd	ra,24(sp)
    80007e80:	00813823          	sd	s0,16(sp)
    80007e84:	00913423          	sd	s1,8(sp)
    80007e88:	02010413          	addi	s0,sp,32
    80007e8c:	00006497          	auipc	s1,0x6
    80007e90:	0fc48493          	addi	s1,s1,252 # 8000df88 <cons>
    80007e94:	00048513          	mv	a0,s1
    80007e98:	00003597          	auipc	a1,0x3
    80007e9c:	92058593          	addi	a1,a1,-1760 # 8000a7b8 <CONSOLE_STATUS+0x7a8>
    80007ea0:	00001097          	auipc	ra,0x1
    80007ea4:	d88080e7          	jalr	-632(ra) # 80008c28 <initlock>
    80007ea8:	00000097          	auipc	ra,0x0
    80007eac:	7ac080e7          	jalr	1964(ra) # 80008654 <uartinit>
    80007eb0:	01813083          	ld	ra,24(sp)
    80007eb4:	01013403          	ld	s0,16(sp)
    80007eb8:	00000797          	auipc	a5,0x0
    80007ebc:	d9c78793          	addi	a5,a5,-612 # 80007c54 <consoleread>
    80007ec0:	0af4bc23          	sd	a5,184(s1)
    80007ec4:	00000797          	auipc	a5,0x0
    80007ec8:	cec78793          	addi	a5,a5,-788 # 80007bb0 <consolewrite>
    80007ecc:	0cf4b023          	sd	a5,192(s1)
    80007ed0:	00813483          	ld	s1,8(sp)
    80007ed4:	02010113          	addi	sp,sp,32
    80007ed8:	00008067          	ret

0000000080007edc <console_read>:
    80007edc:	ff010113          	addi	sp,sp,-16
    80007ee0:	00813423          	sd	s0,8(sp)
    80007ee4:	01010413          	addi	s0,sp,16
    80007ee8:	00813403          	ld	s0,8(sp)
    80007eec:	00006317          	auipc	t1,0x6
    80007ef0:	15433303          	ld	t1,340(t1) # 8000e040 <devsw+0x10>
    80007ef4:	01010113          	addi	sp,sp,16
    80007ef8:	00030067          	jr	t1

0000000080007efc <console_write>:
    80007efc:	ff010113          	addi	sp,sp,-16
    80007f00:	00813423          	sd	s0,8(sp)
    80007f04:	01010413          	addi	s0,sp,16
    80007f08:	00813403          	ld	s0,8(sp)
    80007f0c:	00006317          	auipc	t1,0x6
    80007f10:	13c33303          	ld	t1,316(t1) # 8000e048 <devsw+0x18>
    80007f14:	01010113          	addi	sp,sp,16
    80007f18:	00030067          	jr	t1

0000000080007f1c <panic>:
    80007f1c:	fe010113          	addi	sp,sp,-32
    80007f20:	00113c23          	sd	ra,24(sp)
    80007f24:	00813823          	sd	s0,16(sp)
    80007f28:	00913423          	sd	s1,8(sp)
    80007f2c:	02010413          	addi	s0,sp,32
    80007f30:	00050493          	mv	s1,a0
    80007f34:	00003517          	auipc	a0,0x3
    80007f38:	88c50513          	addi	a0,a0,-1908 # 8000a7c0 <CONSOLE_STATUS+0x7b0>
    80007f3c:	00006797          	auipc	a5,0x6
    80007f40:	1a07a623          	sw	zero,428(a5) # 8000e0e8 <pr+0x18>
    80007f44:	00000097          	auipc	ra,0x0
    80007f48:	034080e7          	jalr	52(ra) # 80007f78 <__printf>
    80007f4c:	00048513          	mv	a0,s1
    80007f50:	00000097          	auipc	ra,0x0
    80007f54:	028080e7          	jalr	40(ra) # 80007f78 <__printf>
    80007f58:	00002517          	auipc	a0,0x2
    80007f5c:	5f050513          	addi	a0,a0,1520 # 8000a548 <CONSOLE_STATUS+0x538>
    80007f60:	00000097          	auipc	ra,0x0
    80007f64:	018080e7          	jalr	24(ra) # 80007f78 <__printf>
    80007f68:	00100793          	li	a5,1
    80007f6c:	00005717          	auipc	a4,0x5
    80007f70:	d2f72e23          	sw	a5,-708(a4) # 8000cca8 <panicked>
    80007f74:	0000006f          	j	80007f74 <panic+0x58>

0000000080007f78 <__printf>:
    80007f78:	f3010113          	addi	sp,sp,-208
    80007f7c:	08813023          	sd	s0,128(sp)
    80007f80:	07313423          	sd	s3,104(sp)
    80007f84:	09010413          	addi	s0,sp,144
    80007f88:	05813023          	sd	s8,64(sp)
    80007f8c:	08113423          	sd	ra,136(sp)
    80007f90:	06913c23          	sd	s1,120(sp)
    80007f94:	07213823          	sd	s2,112(sp)
    80007f98:	07413023          	sd	s4,96(sp)
    80007f9c:	05513c23          	sd	s5,88(sp)
    80007fa0:	05613823          	sd	s6,80(sp)
    80007fa4:	05713423          	sd	s7,72(sp)
    80007fa8:	03913c23          	sd	s9,56(sp)
    80007fac:	03a13823          	sd	s10,48(sp)
    80007fb0:	03b13423          	sd	s11,40(sp)
    80007fb4:	00006317          	auipc	t1,0x6
    80007fb8:	11c30313          	addi	t1,t1,284 # 8000e0d0 <pr>
    80007fbc:	01832c03          	lw	s8,24(t1)
    80007fc0:	00b43423          	sd	a1,8(s0)
    80007fc4:	00c43823          	sd	a2,16(s0)
    80007fc8:	00d43c23          	sd	a3,24(s0)
    80007fcc:	02e43023          	sd	a4,32(s0)
    80007fd0:	02f43423          	sd	a5,40(s0)
    80007fd4:	03043823          	sd	a6,48(s0)
    80007fd8:	03143c23          	sd	a7,56(s0)
    80007fdc:	00050993          	mv	s3,a0
    80007fe0:	4a0c1663          	bnez	s8,8000848c <__printf+0x514>
    80007fe4:	60098c63          	beqz	s3,800085fc <__printf+0x684>
    80007fe8:	0009c503          	lbu	a0,0(s3)
    80007fec:	00840793          	addi	a5,s0,8
    80007ff0:	f6f43c23          	sd	a5,-136(s0)
    80007ff4:	00000493          	li	s1,0
    80007ff8:	22050063          	beqz	a0,80008218 <__printf+0x2a0>
    80007ffc:	00002a37          	lui	s4,0x2
    80008000:	00018ab7          	lui	s5,0x18
    80008004:	000f4b37          	lui	s6,0xf4
    80008008:	00989bb7          	lui	s7,0x989
    8000800c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80008010:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80008014:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80008018:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000801c:	00148c9b          	addiw	s9,s1,1
    80008020:	02500793          	li	a5,37
    80008024:	01998933          	add	s2,s3,s9
    80008028:	38f51263          	bne	a0,a5,800083ac <__printf+0x434>
    8000802c:	00094783          	lbu	a5,0(s2)
    80008030:	00078c9b          	sext.w	s9,a5
    80008034:	1e078263          	beqz	a5,80008218 <__printf+0x2a0>
    80008038:	0024849b          	addiw	s1,s1,2
    8000803c:	07000713          	li	a4,112
    80008040:	00998933          	add	s2,s3,s1
    80008044:	38e78a63          	beq	a5,a4,800083d8 <__printf+0x460>
    80008048:	20f76863          	bltu	a4,a5,80008258 <__printf+0x2e0>
    8000804c:	42a78863          	beq	a5,a0,8000847c <__printf+0x504>
    80008050:	06400713          	li	a4,100
    80008054:	40e79663          	bne	a5,a4,80008460 <__printf+0x4e8>
    80008058:	f7843783          	ld	a5,-136(s0)
    8000805c:	0007a603          	lw	a2,0(a5)
    80008060:	00878793          	addi	a5,a5,8
    80008064:	f6f43c23          	sd	a5,-136(s0)
    80008068:	42064a63          	bltz	a2,8000849c <__printf+0x524>
    8000806c:	00a00713          	li	a4,10
    80008070:	02e677bb          	remuw	a5,a2,a4
    80008074:	00002d97          	auipc	s11,0x2
    80008078:	774d8d93          	addi	s11,s11,1908 # 8000a7e8 <digits>
    8000807c:	00900593          	li	a1,9
    80008080:	0006051b          	sext.w	a0,a2
    80008084:	00000c93          	li	s9,0
    80008088:	02079793          	slli	a5,a5,0x20
    8000808c:	0207d793          	srli	a5,a5,0x20
    80008090:	00fd87b3          	add	a5,s11,a5
    80008094:	0007c783          	lbu	a5,0(a5)
    80008098:	02e656bb          	divuw	a3,a2,a4
    8000809c:	f8f40023          	sb	a5,-128(s0)
    800080a0:	14c5d863          	bge	a1,a2,800081f0 <__printf+0x278>
    800080a4:	06300593          	li	a1,99
    800080a8:	00100c93          	li	s9,1
    800080ac:	02e6f7bb          	remuw	a5,a3,a4
    800080b0:	02079793          	slli	a5,a5,0x20
    800080b4:	0207d793          	srli	a5,a5,0x20
    800080b8:	00fd87b3          	add	a5,s11,a5
    800080bc:	0007c783          	lbu	a5,0(a5)
    800080c0:	02e6d73b          	divuw	a4,a3,a4
    800080c4:	f8f400a3          	sb	a5,-127(s0)
    800080c8:	12a5f463          	bgeu	a1,a0,800081f0 <__printf+0x278>
    800080cc:	00a00693          	li	a3,10
    800080d0:	00900593          	li	a1,9
    800080d4:	02d777bb          	remuw	a5,a4,a3
    800080d8:	02079793          	slli	a5,a5,0x20
    800080dc:	0207d793          	srli	a5,a5,0x20
    800080e0:	00fd87b3          	add	a5,s11,a5
    800080e4:	0007c503          	lbu	a0,0(a5)
    800080e8:	02d757bb          	divuw	a5,a4,a3
    800080ec:	f8a40123          	sb	a0,-126(s0)
    800080f0:	48e5f263          	bgeu	a1,a4,80008574 <__printf+0x5fc>
    800080f4:	06300513          	li	a0,99
    800080f8:	02d7f5bb          	remuw	a1,a5,a3
    800080fc:	02059593          	slli	a1,a1,0x20
    80008100:	0205d593          	srli	a1,a1,0x20
    80008104:	00bd85b3          	add	a1,s11,a1
    80008108:	0005c583          	lbu	a1,0(a1)
    8000810c:	02d7d7bb          	divuw	a5,a5,a3
    80008110:	f8b401a3          	sb	a1,-125(s0)
    80008114:	48e57263          	bgeu	a0,a4,80008598 <__printf+0x620>
    80008118:	3e700513          	li	a0,999
    8000811c:	02d7f5bb          	remuw	a1,a5,a3
    80008120:	02059593          	slli	a1,a1,0x20
    80008124:	0205d593          	srli	a1,a1,0x20
    80008128:	00bd85b3          	add	a1,s11,a1
    8000812c:	0005c583          	lbu	a1,0(a1)
    80008130:	02d7d7bb          	divuw	a5,a5,a3
    80008134:	f8b40223          	sb	a1,-124(s0)
    80008138:	46e57663          	bgeu	a0,a4,800085a4 <__printf+0x62c>
    8000813c:	02d7f5bb          	remuw	a1,a5,a3
    80008140:	02059593          	slli	a1,a1,0x20
    80008144:	0205d593          	srli	a1,a1,0x20
    80008148:	00bd85b3          	add	a1,s11,a1
    8000814c:	0005c583          	lbu	a1,0(a1)
    80008150:	02d7d7bb          	divuw	a5,a5,a3
    80008154:	f8b402a3          	sb	a1,-123(s0)
    80008158:	46ea7863          	bgeu	s4,a4,800085c8 <__printf+0x650>
    8000815c:	02d7f5bb          	remuw	a1,a5,a3
    80008160:	02059593          	slli	a1,a1,0x20
    80008164:	0205d593          	srli	a1,a1,0x20
    80008168:	00bd85b3          	add	a1,s11,a1
    8000816c:	0005c583          	lbu	a1,0(a1)
    80008170:	02d7d7bb          	divuw	a5,a5,a3
    80008174:	f8b40323          	sb	a1,-122(s0)
    80008178:	3eeaf863          	bgeu	s5,a4,80008568 <__printf+0x5f0>
    8000817c:	02d7f5bb          	remuw	a1,a5,a3
    80008180:	02059593          	slli	a1,a1,0x20
    80008184:	0205d593          	srli	a1,a1,0x20
    80008188:	00bd85b3          	add	a1,s11,a1
    8000818c:	0005c583          	lbu	a1,0(a1)
    80008190:	02d7d7bb          	divuw	a5,a5,a3
    80008194:	f8b403a3          	sb	a1,-121(s0)
    80008198:	42eb7e63          	bgeu	s6,a4,800085d4 <__printf+0x65c>
    8000819c:	02d7f5bb          	remuw	a1,a5,a3
    800081a0:	02059593          	slli	a1,a1,0x20
    800081a4:	0205d593          	srli	a1,a1,0x20
    800081a8:	00bd85b3          	add	a1,s11,a1
    800081ac:	0005c583          	lbu	a1,0(a1)
    800081b0:	02d7d7bb          	divuw	a5,a5,a3
    800081b4:	f8b40423          	sb	a1,-120(s0)
    800081b8:	42ebfc63          	bgeu	s7,a4,800085f0 <__printf+0x678>
    800081bc:	02079793          	slli	a5,a5,0x20
    800081c0:	0207d793          	srli	a5,a5,0x20
    800081c4:	00fd8db3          	add	s11,s11,a5
    800081c8:	000dc703          	lbu	a4,0(s11)
    800081cc:	00a00793          	li	a5,10
    800081d0:	00900c93          	li	s9,9
    800081d4:	f8e404a3          	sb	a4,-119(s0)
    800081d8:	00065c63          	bgez	a2,800081f0 <__printf+0x278>
    800081dc:	f9040713          	addi	a4,s0,-112
    800081e0:	00f70733          	add	a4,a4,a5
    800081e4:	02d00693          	li	a3,45
    800081e8:	fed70823          	sb	a3,-16(a4)
    800081ec:	00078c93          	mv	s9,a5
    800081f0:	f8040793          	addi	a5,s0,-128
    800081f4:	01978cb3          	add	s9,a5,s9
    800081f8:	f7f40d13          	addi	s10,s0,-129
    800081fc:	000cc503          	lbu	a0,0(s9)
    80008200:	fffc8c93          	addi	s9,s9,-1
    80008204:	00000097          	auipc	ra,0x0
    80008208:	b90080e7          	jalr	-1136(ra) # 80007d94 <consputc>
    8000820c:	ffac98e3          	bne	s9,s10,800081fc <__printf+0x284>
    80008210:	00094503          	lbu	a0,0(s2)
    80008214:	e00514e3          	bnez	a0,8000801c <__printf+0xa4>
    80008218:	1a0c1663          	bnez	s8,800083c4 <__printf+0x44c>
    8000821c:	08813083          	ld	ra,136(sp)
    80008220:	08013403          	ld	s0,128(sp)
    80008224:	07813483          	ld	s1,120(sp)
    80008228:	07013903          	ld	s2,112(sp)
    8000822c:	06813983          	ld	s3,104(sp)
    80008230:	06013a03          	ld	s4,96(sp)
    80008234:	05813a83          	ld	s5,88(sp)
    80008238:	05013b03          	ld	s6,80(sp)
    8000823c:	04813b83          	ld	s7,72(sp)
    80008240:	04013c03          	ld	s8,64(sp)
    80008244:	03813c83          	ld	s9,56(sp)
    80008248:	03013d03          	ld	s10,48(sp)
    8000824c:	02813d83          	ld	s11,40(sp)
    80008250:	0d010113          	addi	sp,sp,208
    80008254:	00008067          	ret
    80008258:	07300713          	li	a4,115
    8000825c:	1ce78a63          	beq	a5,a4,80008430 <__printf+0x4b8>
    80008260:	07800713          	li	a4,120
    80008264:	1ee79e63          	bne	a5,a4,80008460 <__printf+0x4e8>
    80008268:	f7843783          	ld	a5,-136(s0)
    8000826c:	0007a703          	lw	a4,0(a5)
    80008270:	00878793          	addi	a5,a5,8
    80008274:	f6f43c23          	sd	a5,-136(s0)
    80008278:	28074263          	bltz	a4,800084fc <__printf+0x584>
    8000827c:	00002d97          	auipc	s11,0x2
    80008280:	56cd8d93          	addi	s11,s11,1388 # 8000a7e8 <digits>
    80008284:	00f77793          	andi	a5,a4,15
    80008288:	00fd87b3          	add	a5,s11,a5
    8000828c:	0007c683          	lbu	a3,0(a5)
    80008290:	00f00613          	li	a2,15
    80008294:	0007079b          	sext.w	a5,a4
    80008298:	f8d40023          	sb	a3,-128(s0)
    8000829c:	0047559b          	srliw	a1,a4,0x4
    800082a0:	0047569b          	srliw	a3,a4,0x4
    800082a4:	00000c93          	li	s9,0
    800082a8:	0ee65063          	bge	a2,a4,80008388 <__printf+0x410>
    800082ac:	00f6f693          	andi	a3,a3,15
    800082b0:	00dd86b3          	add	a3,s11,a3
    800082b4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800082b8:	0087d79b          	srliw	a5,a5,0x8
    800082bc:	00100c93          	li	s9,1
    800082c0:	f8d400a3          	sb	a3,-127(s0)
    800082c4:	0cb67263          	bgeu	a2,a1,80008388 <__printf+0x410>
    800082c8:	00f7f693          	andi	a3,a5,15
    800082cc:	00dd86b3          	add	a3,s11,a3
    800082d0:	0006c583          	lbu	a1,0(a3)
    800082d4:	00f00613          	li	a2,15
    800082d8:	0047d69b          	srliw	a3,a5,0x4
    800082dc:	f8b40123          	sb	a1,-126(s0)
    800082e0:	0047d593          	srli	a1,a5,0x4
    800082e4:	28f67e63          	bgeu	a2,a5,80008580 <__printf+0x608>
    800082e8:	00f6f693          	andi	a3,a3,15
    800082ec:	00dd86b3          	add	a3,s11,a3
    800082f0:	0006c503          	lbu	a0,0(a3)
    800082f4:	0087d813          	srli	a6,a5,0x8
    800082f8:	0087d69b          	srliw	a3,a5,0x8
    800082fc:	f8a401a3          	sb	a0,-125(s0)
    80008300:	28b67663          	bgeu	a2,a1,8000858c <__printf+0x614>
    80008304:	00f6f693          	andi	a3,a3,15
    80008308:	00dd86b3          	add	a3,s11,a3
    8000830c:	0006c583          	lbu	a1,0(a3)
    80008310:	00c7d513          	srli	a0,a5,0xc
    80008314:	00c7d69b          	srliw	a3,a5,0xc
    80008318:	f8b40223          	sb	a1,-124(s0)
    8000831c:	29067a63          	bgeu	a2,a6,800085b0 <__printf+0x638>
    80008320:	00f6f693          	andi	a3,a3,15
    80008324:	00dd86b3          	add	a3,s11,a3
    80008328:	0006c583          	lbu	a1,0(a3)
    8000832c:	0107d813          	srli	a6,a5,0x10
    80008330:	0107d69b          	srliw	a3,a5,0x10
    80008334:	f8b402a3          	sb	a1,-123(s0)
    80008338:	28a67263          	bgeu	a2,a0,800085bc <__printf+0x644>
    8000833c:	00f6f693          	andi	a3,a3,15
    80008340:	00dd86b3          	add	a3,s11,a3
    80008344:	0006c683          	lbu	a3,0(a3)
    80008348:	0147d79b          	srliw	a5,a5,0x14
    8000834c:	f8d40323          	sb	a3,-122(s0)
    80008350:	21067663          	bgeu	a2,a6,8000855c <__printf+0x5e4>
    80008354:	02079793          	slli	a5,a5,0x20
    80008358:	0207d793          	srli	a5,a5,0x20
    8000835c:	00fd8db3          	add	s11,s11,a5
    80008360:	000dc683          	lbu	a3,0(s11)
    80008364:	00800793          	li	a5,8
    80008368:	00700c93          	li	s9,7
    8000836c:	f8d403a3          	sb	a3,-121(s0)
    80008370:	00075c63          	bgez	a4,80008388 <__printf+0x410>
    80008374:	f9040713          	addi	a4,s0,-112
    80008378:	00f70733          	add	a4,a4,a5
    8000837c:	02d00693          	li	a3,45
    80008380:	fed70823          	sb	a3,-16(a4)
    80008384:	00078c93          	mv	s9,a5
    80008388:	f8040793          	addi	a5,s0,-128
    8000838c:	01978cb3          	add	s9,a5,s9
    80008390:	f7f40d13          	addi	s10,s0,-129
    80008394:	000cc503          	lbu	a0,0(s9)
    80008398:	fffc8c93          	addi	s9,s9,-1
    8000839c:	00000097          	auipc	ra,0x0
    800083a0:	9f8080e7          	jalr	-1544(ra) # 80007d94 <consputc>
    800083a4:	ff9d18e3          	bne	s10,s9,80008394 <__printf+0x41c>
    800083a8:	0100006f          	j	800083b8 <__printf+0x440>
    800083ac:	00000097          	auipc	ra,0x0
    800083b0:	9e8080e7          	jalr	-1560(ra) # 80007d94 <consputc>
    800083b4:	000c8493          	mv	s1,s9
    800083b8:	00094503          	lbu	a0,0(s2)
    800083bc:	c60510e3          	bnez	a0,8000801c <__printf+0xa4>
    800083c0:	e40c0ee3          	beqz	s8,8000821c <__printf+0x2a4>
    800083c4:	00006517          	auipc	a0,0x6
    800083c8:	d0c50513          	addi	a0,a0,-756 # 8000e0d0 <pr>
    800083cc:	00001097          	auipc	ra,0x1
    800083d0:	94c080e7          	jalr	-1716(ra) # 80008d18 <release>
    800083d4:	e49ff06f          	j	8000821c <__printf+0x2a4>
    800083d8:	f7843783          	ld	a5,-136(s0)
    800083dc:	03000513          	li	a0,48
    800083e0:	01000d13          	li	s10,16
    800083e4:	00878713          	addi	a4,a5,8
    800083e8:	0007bc83          	ld	s9,0(a5)
    800083ec:	f6e43c23          	sd	a4,-136(s0)
    800083f0:	00000097          	auipc	ra,0x0
    800083f4:	9a4080e7          	jalr	-1628(ra) # 80007d94 <consputc>
    800083f8:	07800513          	li	a0,120
    800083fc:	00000097          	auipc	ra,0x0
    80008400:	998080e7          	jalr	-1640(ra) # 80007d94 <consputc>
    80008404:	00002d97          	auipc	s11,0x2
    80008408:	3e4d8d93          	addi	s11,s11,996 # 8000a7e8 <digits>
    8000840c:	03ccd793          	srli	a5,s9,0x3c
    80008410:	00fd87b3          	add	a5,s11,a5
    80008414:	0007c503          	lbu	a0,0(a5)
    80008418:	fffd0d1b          	addiw	s10,s10,-1
    8000841c:	004c9c93          	slli	s9,s9,0x4
    80008420:	00000097          	auipc	ra,0x0
    80008424:	974080e7          	jalr	-1676(ra) # 80007d94 <consputc>
    80008428:	fe0d12e3          	bnez	s10,8000840c <__printf+0x494>
    8000842c:	f8dff06f          	j	800083b8 <__printf+0x440>
    80008430:	f7843783          	ld	a5,-136(s0)
    80008434:	0007bc83          	ld	s9,0(a5)
    80008438:	00878793          	addi	a5,a5,8
    8000843c:	f6f43c23          	sd	a5,-136(s0)
    80008440:	000c9a63          	bnez	s9,80008454 <__printf+0x4dc>
    80008444:	1080006f          	j	8000854c <__printf+0x5d4>
    80008448:	001c8c93          	addi	s9,s9,1
    8000844c:	00000097          	auipc	ra,0x0
    80008450:	948080e7          	jalr	-1720(ra) # 80007d94 <consputc>
    80008454:	000cc503          	lbu	a0,0(s9)
    80008458:	fe0518e3          	bnez	a0,80008448 <__printf+0x4d0>
    8000845c:	f5dff06f          	j	800083b8 <__printf+0x440>
    80008460:	02500513          	li	a0,37
    80008464:	00000097          	auipc	ra,0x0
    80008468:	930080e7          	jalr	-1744(ra) # 80007d94 <consputc>
    8000846c:	000c8513          	mv	a0,s9
    80008470:	00000097          	auipc	ra,0x0
    80008474:	924080e7          	jalr	-1756(ra) # 80007d94 <consputc>
    80008478:	f41ff06f          	j	800083b8 <__printf+0x440>
    8000847c:	02500513          	li	a0,37
    80008480:	00000097          	auipc	ra,0x0
    80008484:	914080e7          	jalr	-1772(ra) # 80007d94 <consputc>
    80008488:	f31ff06f          	j	800083b8 <__printf+0x440>
    8000848c:	00030513          	mv	a0,t1
    80008490:	00000097          	auipc	ra,0x0
    80008494:	7bc080e7          	jalr	1980(ra) # 80008c4c <acquire>
    80008498:	b4dff06f          	j	80007fe4 <__printf+0x6c>
    8000849c:	40c0053b          	negw	a0,a2
    800084a0:	00a00713          	li	a4,10
    800084a4:	02e576bb          	remuw	a3,a0,a4
    800084a8:	00002d97          	auipc	s11,0x2
    800084ac:	340d8d93          	addi	s11,s11,832 # 8000a7e8 <digits>
    800084b0:	ff700593          	li	a1,-9
    800084b4:	02069693          	slli	a3,a3,0x20
    800084b8:	0206d693          	srli	a3,a3,0x20
    800084bc:	00dd86b3          	add	a3,s11,a3
    800084c0:	0006c683          	lbu	a3,0(a3)
    800084c4:	02e557bb          	divuw	a5,a0,a4
    800084c8:	f8d40023          	sb	a3,-128(s0)
    800084cc:	10b65e63          	bge	a2,a1,800085e8 <__printf+0x670>
    800084d0:	06300593          	li	a1,99
    800084d4:	02e7f6bb          	remuw	a3,a5,a4
    800084d8:	02069693          	slli	a3,a3,0x20
    800084dc:	0206d693          	srli	a3,a3,0x20
    800084e0:	00dd86b3          	add	a3,s11,a3
    800084e4:	0006c683          	lbu	a3,0(a3)
    800084e8:	02e7d73b          	divuw	a4,a5,a4
    800084ec:	00200793          	li	a5,2
    800084f0:	f8d400a3          	sb	a3,-127(s0)
    800084f4:	bca5ece3          	bltu	a1,a0,800080cc <__printf+0x154>
    800084f8:	ce5ff06f          	j	800081dc <__printf+0x264>
    800084fc:	40e007bb          	negw	a5,a4
    80008500:	00002d97          	auipc	s11,0x2
    80008504:	2e8d8d93          	addi	s11,s11,744 # 8000a7e8 <digits>
    80008508:	00f7f693          	andi	a3,a5,15
    8000850c:	00dd86b3          	add	a3,s11,a3
    80008510:	0006c583          	lbu	a1,0(a3)
    80008514:	ff100613          	li	a2,-15
    80008518:	0047d69b          	srliw	a3,a5,0x4
    8000851c:	f8b40023          	sb	a1,-128(s0)
    80008520:	0047d59b          	srliw	a1,a5,0x4
    80008524:	0ac75e63          	bge	a4,a2,800085e0 <__printf+0x668>
    80008528:	00f6f693          	andi	a3,a3,15
    8000852c:	00dd86b3          	add	a3,s11,a3
    80008530:	0006c603          	lbu	a2,0(a3)
    80008534:	00f00693          	li	a3,15
    80008538:	0087d79b          	srliw	a5,a5,0x8
    8000853c:	f8c400a3          	sb	a2,-127(s0)
    80008540:	d8b6e4e3          	bltu	a3,a1,800082c8 <__printf+0x350>
    80008544:	00200793          	li	a5,2
    80008548:	e2dff06f          	j	80008374 <__printf+0x3fc>
    8000854c:	00002c97          	auipc	s9,0x2
    80008550:	27cc8c93          	addi	s9,s9,636 # 8000a7c8 <CONSOLE_STATUS+0x7b8>
    80008554:	02800513          	li	a0,40
    80008558:	ef1ff06f          	j	80008448 <__printf+0x4d0>
    8000855c:	00700793          	li	a5,7
    80008560:	00600c93          	li	s9,6
    80008564:	e0dff06f          	j	80008370 <__printf+0x3f8>
    80008568:	00700793          	li	a5,7
    8000856c:	00600c93          	li	s9,6
    80008570:	c69ff06f          	j	800081d8 <__printf+0x260>
    80008574:	00300793          	li	a5,3
    80008578:	00200c93          	li	s9,2
    8000857c:	c5dff06f          	j	800081d8 <__printf+0x260>
    80008580:	00300793          	li	a5,3
    80008584:	00200c93          	li	s9,2
    80008588:	de9ff06f          	j	80008370 <__printf+0x3f8>
    8000858c:	00400793          	li	a5,4
    80008590:	00300c93          	li	s9,3
    80008594:	dddff06f          	j	80008370 <__printf+0x3f8>
    80008598:	00400793          	li	a5,4
    8000859c:	00300c93          	li	s9,3
    800085a0:	c39ff06f          	j	800081d8 <__printf+0x260>
    800085a4:	00500793          	li	a5,5
    800085a8:	00400c93          	li	s9,4
    800085ac:	c2dff06f          	j	800081d8 <__printf+0x260>
    800085b0:	00500793          	li	a5,5
    800085b4:	00400c93          	li	s9,4
    800085b8:	db9ff06f          	j	80008370 <__printf+0x3f8>
    800085bc:	00600793          	li	a5,6
    800085c0:	00500c93          	li	s9,5
    800085c4:	dadff06f          	j	80008370 <__printf+0x3f8>
    800085c8:	00600793          	li	a5,6
    800085cc:	00500c93          	li	s9,5
    800085d0:	c09ff06f          	j	800081d8 <__printf+0x260>
    800085d4:	00800793          	li	a5,8
    800085d8:	00700c93          	li	s9,7
    800085dc:	bfdff06f          	j	800081d8 <__printf+0x260>
    800085e0:	00100793          	li	a5,1
    800085e4:	d91ff06f          	j	80008374 <__printf+0x3fc>
    800085e8:	00100793          	li	a5,1
    800085ec:	bf1ff06f          	j	800081dc <__printf+0x264>
    800085f0:	00900793          	li	a5,9
    800085f4:	00800c93          	li	s9,8
    800085f8:	be1ff06f          	j	800081d8 <__printf+0x260>
    800085fc:	00002517          	auipc	a0,0x2
    80008600:	1d450513          	addi	a0,a0,468 # 8000a7d0 <CONSOLE_STATUS+0x7c0>
    80008604:	00000097          	auipc	ra,0x0
    80008608:	918080e7          	jalr	-1768(ra) # 80007f1c <panic>

000000008000860c <printfinit>:
    8000860c:	fe010113          	addi	sp,sp,-32
    80008610:	00813823          	sd	s0,16(sp)
    80008614:	00913423          	sd	s1,8(sp)
    80008618:	00113c23          	sd	ra,24(sp)
    8000861c:	02010413          	addi	s0,sp,32
    80008620:	00006497          	auipc	s1,0x6
    80008624:	ab048493          	addi	s1,s1,-1360 # 8000e0d0 <pr>
    80008628:	00048513          	mv	a0,s1
    8000862c:	00002597          	auipc	a1,0x2
    80008630:	1b458593          	addi	a1,a1,436 # 8000a7e0 <CONSOLE_STATUS+0x7d0>
    80008634:	00000097          	auipc	ra,0x0
    80008638:	5f4080e7          	jalr	1524(ra) # 80008c28 <initlock>
    8000863c:	01813083          	ld	ra,24(sp)
    80008640:	01013403          	ld	s0,16(sp)
    80008644:	0004ac23          	sw	zero,24(s1)
    80008648:	00813483          	ld	s1,8(sp)
    8000864c:	02010113          	addi	sp,sp,32
    80008650:	00008067          	ret

0000000080008654 <uartinit>:
    80008654:	ff010113          	addi	sp,sp,-16
    80008658:	00813423          	sd	s0,8(sp)
    8000865c:	01010413          	addi	s0,sp,16
    80008660:	100007b7          	lui	a5,0x10000
    80008664:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008668:	f8000713          	li	a4,-128
    8000866c:	00e781a3          	sb	a4,3(a5)
    80008670:	00300713          	li	a4,3
    80008674:	00e78023          	sb	a4,0(a5)
    80008678:	000780a3          	sb	zero,1(a5)
    8000867c:	00e781a3          	sb	a4,3(a5)
    80008680:	00700693          	li	a3,7
    80008684:	00d78123          	sb	a3,2(a5)
    80008688:	00e780a3          	sb	a4,1(a5)
    8000868c:	00813403          	ld	s0,8(sp)
    80008690:	01010113          	addi	sp,sp,16
    80008694:	00008067          	ret

0000000080008698 <uartputc>:
    80008698:	00004797          	auipc	a5,0x4
    8000869c:	6107a783          	lw	a5,1552(a5) # 8000cca8 <panicked>
    800086a0:	00078463          	beqz	a5,800086a8 <uartputc+0x10>
    800086a4:	0000006f          	j	800086a4 <uartputc+0xc>
    800086a8:	fd010113          	addi	sp,sp,-48
    800086ac:	02813023          	sd	s0,32(sp)
    800086b0:	00913c23          	sd	s1,24(sp)
    800086b4:	01213823          	sd	s2,16(sp)
    800086b8:	01313423          	sd	s3,8(sp)
    800086bc:	02113423          	sd	ra,40(sp)
    800086c0:	03010413          	addi	s0,sp,48
    800086c4:	00004917          	auipc	s2,0x4
    800086c8:	5ec90913          	addi	s2,s2,1516 # 8000ccb0 <uart_tx_r>
    800086cc:	00093783          	ld	a5,0(s2)
    800086d0:	00004497          	auipc	s1,0x4
    800086d4:	5e848493          	addi	s1,s1,1512 # 8000ccb8 <uart_tx_w>
    800086d8:	0004b703          	ld	a4,0(s1)
    800086dc:	02078693          	addi	a3,a5,32
    800086e0:	00050993          	mv	s3,a0
    800086e4:	02e69c63          	bne	a3,a4,8000871c <uartputc+0x84>
    800086e8:	00001097          	auipc	ra,0x1
    800086ec:	834080e7          	jalr	-1996(ra) # 80008f1c <push_on>
    800086f0:	00093783          	ld	a5,0(s2)
    800086f4:	0004b703          	ld	a4,0(s1)
    800086f8:	02078793          	addi	a5,a5,32
    800086fc:	00e79463          	bne	a5,a4,80008704 <uartputc+0x6c>
    80008700:	0000006f          	j	80008700 <uartputc+0x68>
    80008704:	00001097          	auipc	ra,0x1
    80008708:	88c080e7          	jalr	-1908(ra) # 80008f90 <pop_on>
    8000870c:	00093783          	ld	a5,0(s2)
    80008710:	0004b703          	ld	a4,0(s1)
    80008714:	02078693          	addi	a3,a5,32
    80008718:	fce688e3          	beq	a3,a4,800086e8 <uartputc+0x50>
    8000871c:	01f77693          	andi	a3,a4,31
    80008720:	00006597          	auipc	a1,0x6
    80008724:	9d058593          	addi	a1,a1,-1584 # 8000e0f0 <uart_tx_buf>
    80008728:	00d586b3          	add	a3,a1,a3
    8000872c:	00170713          	addi	a4,a4,1
    80008730:	01368023          	sb	s3,0(a3)
    80008734:	00e4b023          	sd	a4,0(s1)
    80008738:	10000637          	lui	a2,0x10000
    8000873c:	02f71063          	bne	a4,a5,8000875c <uartputc+0xc4>
    80008740:	0340006f          	j	80008774 <uartputc+0xdc>
    80008744:	00074703          	lbu	a4,0(a4)
    80008748:	00f93023          	sd	a5,0(s2)
    8000874c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008750:	00093783          	ld	a5,0(s2)
    80008754:	0004b703          	ld	a4,0(s1)
    80008758:	00f70e63          	beq	a4,a5,80008774 <uartputc+0xdc>
    8000875c:	00564683          	lbu	a3,5(a2)
    80008760:	01f7f713          	andi	a4,a5,31
    80008764:	00e58733          	add	a4,a1,a4
    80008768:	0206f693          	andi	a3,a3,32
    8000876c:	00178793          	addi	a5,a5,1
    80008770:	fc069ae3          	bnez	a3,80008744 <uartputc+0xac>
    80008774:	02813083          	ld	ra,40(sp)
    80008778:	02013403          	ld	s0,32(sp)
    8000877c:	01813483          	ld	s1,24(sp)
    80008780:	01013903          	ld	s2,16(sp)
    80008784:	00813983          	ld	s3,8(sp)
    80008788:	03010113          	addi	sp,sp,48
    8000878c:	00008067          	ret

0000000080008790 <uartputc_sync>:
    80008790:	ff010113          	addi	sp,sp,-16
    80008794:	00813423          	sd	s0,8(sp)
    80008798:	01010413          	addi	s0,sp,16
    8000879c:	00004717          	auipc	a4,0x4
    800087a0:	50c72703          	lw	a4,1292(a4) # 8000cca8 <panicked>
    800087a4:	02071663          	bnez	a4,800087d0 <uartputc_sync+0x40>
    800087a8:	00050793          	mv	a5,a0
    800087ac:	100006b7          	lui	a3,0x10000
    800087b0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800087b4:	02077713          	andi	a4,a4,32
    800087b8:	fe070ce3          	beqz	a4,800087b0 <uartputc_sync+0x20>
    800087bc:	0ff7f793          	andi	a5,a5,255
    800087c0:	00f68023          	sb	a5,0(a3)
    800087c4:	00813403          	ld	s0,8(sp)
    800087c8:	01010113          	addi	sp,sp,16
    800087cc:	00008067          	ret
    800087d0:	0000006f          	j	800087d0 <uartputc_sync+0x40>

00000000800087d4 <uartstart>:
    800087d4:	ff010113          	addi	sp,sp,-16
    800087d8:	00813423          	sd	s0,8(sp)
    800087dc:	01010413          	addi	s0,sp,16
    800087e0:	00004617          	auipc	a2,0x4
    800087e4:	4d060613          	addi	a2,a2,1232 # 8000ccb0 <uart_tx_r>
    800087e8:	00004517          	auipc	a0,0x4
    800087ec:	4d050513          	addi	a0,a0,1232 # 8000ccb8 <uart_tx_w>
    800087f0:	00063783          	ld	a5,0(a2)
    800087f4:	00053703          	ld	a4,0(a0)
    800087f8:	04f70263          	beq	a4,a5,8000883c <uartstart+0x68>
    800087fc:	100005b7          	lui	a1,0x10000
    80008800:	00006817          	auipc	a6,0x6
    80008804:	8f080813          	addi	a6,a6,-1808 # 8000e0f0 <uart_tx_buf>
    80008808:	01c0006f          	j	80008824 <uartstart+0x50>
    8000880c:	0006c703          	lbu	a4,0(a3)
    80008810:	00f63023          	sd	a5,0(a2)
    80008814:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008818:	00063783          	ld	a5,0(a2)
    8000881c:	00053703          	ld	a4,0(a0)
    80008820:	00f70e63          	beq	a4,a5,8000883c <uartstart+0x68>
    80008824:	01f7f713          	andi	a4,a5,31
    80008828:	00e806b3          	add	a3,a6,a4
    8000882c:	0055c703          	lbu	a4,5(a1)
    80008830:	00178793          	addi	a5,a5,1
    80008834:	02077713          	andi	a4,a4,32
    80008838:	fc071ae3          	bnez	a4,8000880c <uartstart+0x38>
    8000883c:	00813403          	ld	s0,8(sp)
    80008840:	01010113          	addi	sp,sp,16
    80008844:	00008067          	ret

0000000080008848 <uartgetc>:
    80008848:	ff010113          	addi	sp,sp,-16
    8000884c:	00813423          	sd	s0,8(sp)
    80008850:	01010413          	addi	s0,sp,16
    80008854:	10000737          	lui	a4,0x10000
    80008858:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000885c:	0017f793          	andi	a5,a5,1
    80008860:	00078c63          	beqz	a5,80008878 <uartgetc+0x30>
    80008864:	00074503          	lbu	a0,0(a4)
    80008868:	0ff57513          	andi	a0,a0,255
    8000886c:	00813403          	ld	s0,8(sp)
    80008870:	01010113          	addi	sp,sp,16
    80008874:	00008067          	ret
    80008878:	fff00513          	li	a0,-1
    8000887c:	ff1ff06f          	j	8000886c <uartgetc+0x24>

0000000080008880 <uartintr>:
    80008880:	100007b7          	lui	a5,0x10000
    80008884:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008888:	0017f793          	andi	a5,a5,1
    8000888c:	0a078463          	beqz	a5,80008934 <uartintr+0xb4>
    80008890:	fe010113          	addi	sp,sp,-32
    80008894:	00813823          	sd	s0,16(sp)
    80008898:	00913423          	sd	s1,8(sp)
    8000889c:	00113c23          	sd	ra,24(sp)
    800088a0:	02010413          	addi	s0,sp,32
    800088a4:	100004b7          	lui	s1,0x10000
    800088a8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800088ac:	0ff57513          	andi	a0,a0,255
    800088b0:	fffff097          	auipc	ra,0xfffff
    800088b4:	534080e7          	jalr	1332(ra) # 80007de4 <consoleintr>
    800088b8:	0054c783          	lbu	a5,5(s1)
    800088bc:	0017f793          	andi	a5,a5,1
    800088c0:	fe0794e3          	bnez	a5,800088a8 <uartintr+0x28>
    800088c4:	00004617          	auipc	a2,0x4
    800088c8:	3ec60613          	addi	a2,a2,1004 # 8000ccb0 <uart_tx_r>
    800088cc:	00004517          	auipc	a0,0x4
    800088d0:	3ec50513          	addi	a0,a0,1004 # 8000ccb8 <uart_tx_w>
    800088d4:	00063783          	ld	a5,0(a2)
    800088d8:	00053703          	ld	a4,0(a0)
    800088dc:	04f70263          	beq	a4,a5,80008920 <uartintr+0xa0>
    800088e0:	100005b7          	lui	a1,0x10000
    800088e4:	00006817          	auipc	a6,0x6
    800088e8:	80c80813          	addi	a6,a6,-2036 # 8000e0f0 <uart_tx_buf>
    800088ec:	01c0006f          	j	80008908 <uartintr+0x88>
    800088f0:	0006c703          	lbu	a4,0(a3)
    800088f4:	00f63023          	sd	a5,0(a2)
    800088f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800088fc:	00063783          	ld	a5,0(a2)
    80008900:	00053703          	ld	a4,0(a0)
    80008904:	00f70e63          	beq	a4,a5,80008920 <uartintr+0xa0>
    80008908:	01f7f713          	andi	a4,a5,31
    8000890c:	00e806b3          	add	a3,a6,a4
    80008910:	0055c703          	lbu	a4,5(a1)
    80008914:	00178793          	addi	a5,a5,1
    80008918:	02077713          	andi	a4,a4,32
    8000891c:	fc071ae3          	bnez	a4,800088f0 <uartintr+0x70>
    80008920:	01813083          	ld	ra,24(sp)
    80008924:	01013403          	ld	s0,16(sp)
    80008928:	00813483          	ld	s1,8(sp)
    8000892c:	02010113          	addi	sp,sp,32
    80008930:	00008067          	ret
    80008934:	00004617          	auipc	a2,0x4
    80008938:	37c60613          	addi	a2,a2,892 # 8000ccb0 <uart_tx_r>
    8000893c:	00004517          	auipc	a0,0x4
    80008940:	37c50513          	addi	a0,a0,892 # 8000ccb8 <uart_tx_w>
    80008944:	00063783          	ld	a5,0(a2)
    80008948:	00053703          	ld	a4,0(a0)
    8000894c:	04f70263          	beq	a4,a5,80008990 <uartintr+0x110>
    80008950:	100005b7          	lui	a1,0x10000
    80008954:	00005817          	auipc	a6,0x5
    80008958:	79c80813          	addi	a6,a6,1948 # 8000e0f0 <uart_tx_buf>
    8000895c:	01c0006f          	j	80008978 <uartintr+0xf8>
    80008960:	0006c703          	lbu	a4,0(a3)
    80008964:	00f63023          	sd	a5,0(a2)
    80008968:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000896c:	00063783          	ld	a5,0(a2)
    80008970:	00053703          	ld	a4,0(a0)
    80008974:	02f70063          	beq	a4,a5,80008994 <uartintr+0x114>
    80008978:	01f7f713          	andi	a4,a5,31
    8000897c:	00e806b3          	add	a3,a6,a4
    80008980:	0055c703          	lbu	a4,5(a1)
    80008984:	00178793          	addi	a5,a5,1
    80008988:	02077713          	andi	a4,a4,32
    8000898c:	fc071ae3          	bnez	a4,80008960 <uartintr+0xe0>
    80008990:	00008067          	ret
    80008994:	00008067          	ret

0000000080008998 <kinit>:
    80008998:	fc010113          	addi	sp,sp,-64
    8000899c:	02913423          	sd	s1,40(sp)
    800089a0:	fffff7b7          	lui	a5,0xfffff
    800089a4:	00006497          	auipc	s1,0x6
    800089a8:	76b48493          	addi	s1,s1,1899 # 8000f10f <end+0xfff>
    800089ac:	02813823          	sd	s0,48(sp)
    800089b0:	01313c23          	sd	s3,24(sp)
    800089b4:	00f4f4b3          	and	s1,s1,a5
    800089b8:	02113c23          	sd	ra,56(sp)
    800089bc:	03213023          	sd	s2,32(sp)
    800089c0:	01413823          	sd	s4,16(sp)
    800089c4:	01513423          	sd	s5,8(sp)
    800089c8:	04010413          	addi	s0,sp,64
    800089cc:	000017b7          	lui	a5,0x1
    800089d0:	01100993          	li	s3,17
    800089d4:	00f487b3          	add	a5,s1,a5
    800089d8:	01b99993          	slli	s3,s3,0x1b
    800089dc:	06f9e063          	bltu	s3,a5,80008a3c <kinit+0xa4>
    800089e0:	00005a97          	auipc	s5,0x5
    800089e4:	730a8a93          	addi	s5,s5,1840 # 8000e110 <end>
    800089e8:	0754ec63          	bltu	s1,s5,80008a60 <kinit+0xc8>
    800089ec:	0734fa63          	bgeu	s1,s3,80008a60 <kinit+0xc8>
    800089f0:	00088a37          	lui	s4,0x88
    800089f4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800089f8:	00004917          	auipc	s2,0x4
    800089fc:	2c890913          	addi	s2,s2,712 # 8000ccc0 <kmem>
    80008a00:	00ca1a13          	slli	s4,s4,0xc
    80008a04:	0140006f          	j	80008a18 <kinit+0x80>
    80008a08:	000017b7          	lui	a5,0x1
    80008a0c:	00f484b3          	add	s1,s1,a5
    80008a10:	0554e863          	bltu	s1,s5,80008a60 <kinit+0xc8>
    80008a14:	0534f663          	bgeu	s1,s3,80008a60 <kinit+0xc8>
    80008a18:	00001637          	lui	a2,0x1
    80008a1c:	00100593          	li	a1,1
    80008a20:	00048513          	mv	a0,s1
    80008a24:	00000097          	auipc	ra,0x0
    80008a28:	5e4080e7          	jalr	1508(ra) # 80009008 <__memset>
    80008a2c:	00093783          	ld	a5,0(s2)
    80008a30:	00f4b023          	sd	a5,0(s1)
    80008a34:	00993023          	sd	s1,0(s2)
    80008a38:	fd4498e3          	bne	s1,s4,80008a08 <kinit+0x70>
    80008a3c:	03813083          	ld	ra,56(sp)
    80008a40:	03013403          	ld	s0,48(sp)
    80008a44:	02813483          	ld	s1,40(sp)
    80008a48:	02013903          	ld	s2,32(sp)
    80008a4c:	01813983          	ld	s3,24(sp)
    80008a50:	01013a03          	ld	s4,16(sp)
    80008a54:	00813a83          	ld	s5,8(sp)
    80008a58:	04010113          	addi	sp,sp,64
    80008a5c:	00008067          	ret
    80008a60:	00002517          	auipc	a0,0x2
    80008a64:	da050513          	addi	a0,a0,-608 # 8000a800 <digits+0x18>
    80008a68:	fffff097          	auipc	ra,0xfffff
    80008a6c:	4b4080e7          	jalr	1204(ra) # 80007f1c <panic>

0000000080008a70 <freerange>:
    80008a70:	fc010113          	addi	sp,sp,-64
    80008a74:	000017b7          	lui	a5,0x1
    80008a78:	02913423          	sd	s1,40(sp)
    80008a7c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008a80:	009504b3          	add	s1,a0,s1
    80008a84:	fffff537          	lui	a0,0xfffff
    80008a88:	02813823          	sd	s0,48(sp)
    80008a8c:	02113c23          	sd	ra,56(sp)
    80008a90:	03213023          	sd	s2,32(sp)
    80008a94:	01313c23          	sd	s3,24(sp)
    80008a98:	01413823          	sd	s4,16(sp)
    80008a9c:	01513423          	sd	s5,8(sp)
    80008aa0:	01613023          	sd	s6,0(sp)
    80008aa4:	04010413          	addi	s0,sp,64
    80008aa8:	00a4f4b3          	and	s1,s1,a0
    80008aac:	00f487b3          	add	a5,s1,a5
    80008ab0:	06f5e463          	bltu	a1,a5,80008b18 <freerange+0xa8>
    80008ab4:	00005a97          	auipc	s5,0x5
    80008ab8:	65ca8a93          	addi	s5,s5,1628 # 8000e110 <end>
    80008abc:	0954e263          	bltu	s1,s5,80008b40 <freerange+0xd0>
    80008ac0:	01100993          	li	s3,17
    80008ac4:	01b99993          	slli	s3,s3,0x1b
    80008ac8:	0734fc63          	bgeu	s1,s3,80008b40 <freerange+0xd0>
    80008acc:	00058a13          	mv	s4,a1
    80008ad0:	00004917          	auipc	s2,0x4
    80008ad4:	1f090913          	addi	s2,s2,496 # 8000ccc0 <kmem>
    80008ad8:	00002b37          	lui	s6,0x2
    80008adc:	0140006f          	j	80008af0 <freerange+0x80>
    80008ae0:	000017b7          	lui	a5,0x1
    80008ae4:	00f484b3          	add	s1,s1,a5
    80008ae8:	0554ec63          	bltu	s1,s5,80008b40 <freerange+0xd0>
    80008aec:	0534fa63          	bgeu	s1,s3,80008b40 <freerange+0xd0>
    80008af0:	00001637          	lui	a2,0x1
    80008af4:	00100593          	li	a1,1
    80008af8:	00048513          	mv	a0,s1
    80008afc:	00000097          	auipc	ra,0x0
    80008b00:	50c080e7          	jalr	1292(ra) # 80009008 <__memset>
    80008b04:	00093703          	ld	a4,0(s2)
    80008b08:	016487b3          	add	a5,s1,s6
    80008b0c:	00e4b023          	sd	a4,0(s1)
    80008b10:	00993023          	sd	s1,0(s2)
    80008b14:	fcfa76e3          	bgeu	s4,a5,80008ae0 <freerange+0x70>
    80008b18:	03813083          	ld	ra,56(sp)
    80008b1c:	03013403          	ld	s0,48(sp)
    80008b20:	02813483          	ld	s1,40(sp)
    80008b24:	02013903          	ld	s2,32(sp)
    80008b28:	01813983          	ld	s3,24(sp)
    80008b2c:	01013a03          	ld	s4,16(sp)
    80008b30:	00813a83          	ld	s5,8(sp)
    80008b34:	00013b03          	ld	s6,0(sp)
    80008b38:	04010113          	addi	sp,sp,64
    80008b3c:	00008067          	ret
    80008b40:	00002517          	auipc	a0,0x2
    80008b44:	cc050513          	addi	a0,a0,-832 # 8000a800 <digits+0x18>
    80008b48:	fffff097          	auipc	ra,0xfffff
    80008b4c:	3d4080e7          	jalr	980(ra) # 80007f1c <panic>

0000000080008b50 <kfree>:
    80008b50:	fe010113          	addi	sp,sp,-32
    80008b54:	00813823          	sd	s0,16(sp)
    80008b58:	00113c23          	sd	ra,24(sp)
    80008b5c:	00913423          	sd	s1,8(sp)
    80008b60:	02010413          	addi	s0,sp,32
    80008b64:	03451793          	slli	a5,a0,0x34
    80008b68:	04079c63          	bnez	a5,80008bc0 <kfree+0x70>
    80008b6c:	00005797          	auipc	a5,0x5
    80008b70:	5a478793          	addi	a5,a5,1444 # 8000e110 <end>
    80008b74:	00050493          	mv	s1,a0
    80008b78:	04f56463          	bltu	a0,a5,80008bc0 <kfree+0x70>
    80008b7c:	01100793          	li	a5,17
    80008b80:	01b79793          	slli	a5,a5,0x1b
    80008b84:	02f57e63          	bgeu	a0,a5,80008bc0 <kfree+0x70>
    80008b88:	00001637          	lui	a2,0x1
    80008b8c:	00100593          	li	a1,1
    80008b90:	00000097          	auipc	ra,0x0
    80008b94:	478080e7          	jalr	1144(ra) # 80009008 <__memset>
    80008b98:	00004797          	auipc	a5,0x4
    80008b9c:	12878793          	addi	a5,a5,296 # 8000ccc0 <kmem>
    80008ba0:	0007b703          	ld	a4,0(a5)
    80008ba4:	01813083          	ld	ra,24(sp)
    80008ba8:	01013403          	ld	s0,16(sp)
    80008bac:	00e4b023          	sd	a4,0(s1)
    80008bb0:	0097b023          	sd	s1,0(a5)
    80008bb4:	00813483          	ld	s1,8(sp)
    80008bb8:	02010113          	addi	sp,sp,32
    80008bbc:	00008067          	ret
    80008bc0:	00002517          	auipc	a0,0x2
    80008bc4:	c4050513          	addi	a0,a0,-960 # 8000a800 <digits+0x18>
    80008bc8:	fffff097          	auipc	ra,0xfffff
    80008bcc:	354080e7          	jalr	852(ra) # 80007f1c <panic>

0000000080008bd0 <kalloc>:
    80008bd0:	fe010113          	addi	sp,sp,-32
    80008bd4:	00813823          	sd	s0,16(sp)
    80008bd8:	00913423          	sd	s1,8(sp)
    80008bdc:	00113c23          	sd	ra,24(sp)
    80008be0:	02010413          	addi	s0,sp,32
    80008be4:	00004797          	auipc	a5,0x4
    80008be8:	0dc78793          	addi	a5,a5,220 # 8000ccc0 <kmem>
    80008bec:	0007b483          	ld	s1,0(a5)
    80008bf0:	02048063          	beqz	s1,80008c10 <kalloc+0x40>
    80008bf4:	0004b703          	ld	a4,0(s1)
    80008bf8:	00001637          	lui	a2,0x1
    80008bfc:	00500593          	li	a1,5
    80008c00:	00048513          	mv	a0,s1
    80008c04:	00e7b023          	sd	a4,0(a5)
    80008c08:	00000097          	auipc	ra,0x0
    80008c0c:	400080e7          	jalr	1024(ra) # 80009008 <__memset>
    80008c10:	01813083          	ld	ra,24(sp)
    80008c14:	01013403          	ld	s0,16(sp)
    80008c18:	00048513          	mv	a0,s1
    80008c1c:	00813483          	ld	s1,8(sp)
    80008c20:	02010113          	addi	sp,sp,32
    80008c24:	00008067          	ret

0000000080008c28 <initlock>:
    80008c28:	ff010113          	addi	sp,sp,-16
    80008c2c:	00813423          	sd	s0,8(sp)
    80008c30:	01010413          	addi	s0,sp,16
    80008c34:	00813403          	ld	s0,8(sp)
    80008c38:	00b53423          	sd	a1,8(a0)
    80008c3c:	00052023          	sw	zero,0(a0)
    80008c40:	00053823          	sd	zero,16(a0)
    80008c44:	01010113          	addi	sp,sp,16
    80008c48:	00008067          	ret

0000000080008c4c <acquire>:
    80008c4c:	fe010113          	addi	sp,sp,-32
    80008c50:	00813823          	sd	s0,16(sp)
    80008c54:	00913423          	sd	s1,8(sp)
    80008c58:	00113c23          	sd	ra,24(sp)
    80008c5c:	01213023          	sd	s2,0(sp)
    80008c60:	02010413          	addi	s0,sp,32
    80008c64:	00050493          	mv	s1,a0
    80008c68:	10002973          	csrr	s2,sstatus
    80008c6c:	100027f3          	csrr	a5,sstatus
    80008c70:	ffd7f793          	andi	a5,a5,-3
    80008c74:	10079073          	csrw	sstatus,a5
    80008c78:	fffff097          	auipc	ra,0xfffff
    80008c7c:	8e0080e7          	jalr	-1824(ra) # 80007558 <mycpu>
    80008c80:	07852783          	lw	a5,120(a0)
    80008c84:	06078e63          	beqz	a5,80008d00 <acquire+0xb4>
    80008c88:	fffff097          	auipc	ra,0xfffff
    80008c8c:	8d0080e7          	jalr	-1840(ra) # 80007558 <mycpu>
    80008c90:	07852783          	lw	a5,120(a0)
    80008c94:	0004a703          	lw	a4,0(s1)
    80008c98:	0017879b          	addiw	a5,a5,1
    80008c9c:	06f52c23          	sw	a5,120(a0)
    80008ca0:	04071063          	bnez	a4,80008ce0 <acquire+0x94>
    80008ca4:	00100713          	li	a4,1
    80008ca8:	00070793          	mv	a5,a4
    80008cac:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008cb0:	0007879b          	sext.w	a5,a5
    80008cb4:	fe079ae3          	bnez	a5,80008ca8 <acquire+0x5c>
    80008cb8:	0ff0000f          	fence
    80008cbc:	fffff097          	auipc	ra,0xfffff
    80008cc0:	89c080e7          	jalr	-1892(ra) # 80007558 <mycpu>
    80008cc4:	01813083          	ld	ra,24(sp)
    80008cc8:	01013403          	ld	s0,16(sp)
    80008ccc:	00a4b823          	sd	a0,16(s1)
    80008cd0:	00013903          	ld	s2,0(sp)
    80008cd4:	00813483          	ld	s1,8(sp)
    80008cd8:	02010113          	addi	sp,sp,32
    80008cdc:	00008067          	ret
    80008ce0:	0104b903          	ld	s2,16(s1)
    80008ce4:	fffff097          	auipc	ra,0xfffff
    80008ce8:	874080e7          	jalr	-1932(ra) # 80007558 <mycpu>
    80008cec:	faa91ce3          	bne	s2,a0,80008ca4 <acquire+0x58>
    80008cf0:	00002517          	auipc	a0,0x2
    80008cf4:	b1850513          	addi	a0,a0,-1256 # 8000a808 <digits+0x20>
    80008cf8:	fffff097          	auipc	ra,0xfffff
    80008cfc:	224080e7          	jalr	548(ra) # 80007f1c <panic>
    80008d00:	00195913          	srli	s2,s2,0x1
    80008d04:	fffff097          	auipc	ra,0xfffff
    80008d08:	854080e7          	jalr	-1964(ra) # 80007558 <mycpu>
    80008d0c:	00197913          	andi	s2,s2,1
    80008d10:	07252e23          	sw	s2,124(a0)
    80008d14:	f75ff06f          	j	80008c88 <acquire+0x3c>

0000000080008d18 <release>:
    80008d18:	fe010113          	addi	sp,sp,-32
    80008d1c:	00813823          	sd	s0,16(sp)
    80008d20:	00113c23          	sd	ra,24(sp)
    80008d24:	00913423          	sd	s1,8(sp)
    80008d28:	01213023          	sd	s2,0(sp)
    80008d2c:	02010413          	addi	s0,sp,32
    80008d30:	00052783          	lw	a5,0(a0)
    80008d34:	00079a63          	bnez	a5,80008d48 <release+0x30>
    80008d38:	00002517          	auipc	a0,0x2
    80008d3c:	ad850513          	addi	a0,a0,-1320 # 8000a810 <digits+0x28>
    80008d40:	fffff097          	auipc	ra,0xfffff
    80008d44:	1dc080e7          	jalr	476(ra) # 80007f1c <panic>
    80008d48:	01053903          	ld	s2,16(a0)
    80008d4c:	00050493          	mv	s1,a0
    80008d50:	fffff097          	auipc	ra,0xfffff
    80008d54:	808080e7          	jalr	-2040(ra) # 80007558 <mycpu>
    80008d58:	fea910e3          	bne	s2,a0,80008d38 <release+0x20>
    80008d5c:	0004b823          	sd	zero,16(s1)
    80008d60:	0ff0000f          	fence
    80008d64:	0f50000f          	fence	iorw,ow
    80008d68:	0804a02f          	amoswap.w	zero,zero,(s1)
    80008d6c:	ffffe097          	auipc	ra,0xffffe
    80008d70:	7ec080e7          	jalr	2028(ra) # 80007558 <mycpu>
    80008d74:	100027f3          	csrr	a5,sstatus
    80008d78:	0027f793          	andi	a5,a5,2
    80008d7c:	04079a63          	bnez	a5,80008dd0 <release+0xb8>
    80008d80:	07852783          	lw	a5,120(a0)
    80008d84:	02f05e63          	blez	a5,80008dc0 <release+0xa8>
    80008d88:	fff7871b          	addiw	a4,a5,-1
    80008d8c:	06e52c23          	sw	a4,120(a0)
    80008d90:	00071c63          	bnez	a4,80008da8 <release+0x90>
    80008d94:	07c52783          	lw	a5,124(a0)
    80008d98:	00078863          	beqz	a5,80008da8 <release+0x90>
    80008d9c:	100027f3          	csrr	a5,sstatus
    80008da0:	0027e793          	ori	a5,a5,2
    80008da4:	10079073          	csrw	sstatus,a5
    80008da8:	01813083          	ld	ra,24(sp)
    80008dac:	01013403          	ld	s0,16(sp)
    80008db0:	00813483          	ld	s1,8(sp)
    80008db4:	00013903          	ld	s2,0(sp)
    80008db8:	02010113          	addi	sp,sp,32
    80008dbc:	00008067          	ret
    80008dc0:	00002517          	auipc	a0,0x2
    80008dc4:	a7050513          	addi	a0,a0,-1424 # 8000a830 <digits+0x48>
    80008dc8:	fffff097          	auipc	ra,0xfffff
    80008dcc:	154080e7          	jalr	340(ra) # 80007f1c <panic>
    80008dd0:	00002517          	auipc	a0,0x2
    80008dd4:	a4850513          	addi	a0,a0,-1464 # 8000a818 <digits+0x30>
    80008dd8:	fffff097          	auipc	ra,0xfffff
    80008ddc:	144080e7          	jalr	324(ra) # 80007f1c <panic>

0000000080008de0 <holding>:
    80008de0:	00052783          	lw	a5,0(a0)
    80008de4:	00079663          	bnez	a5,80008df0 <holding+0x10>
    80008de8:	00000513          	li	a0,0
    80008dec:	00008067          	ret
    80008df0:	fe010113          	addi	sp,sp,-32
    80008df4:	00813823          	sd	s0,16(sp)
    80008df8:	00913423          	sd	s1,8(sp)
    80008dfc:	00113c23          	sd	ra,24(sp)
    80008e00:	02010413          	addi	s0,sp,32
    80008e04:	01053483          	ld	s1,16(a0)
    80008e08:	ffffe097          	auipc	ra,0xffffe
    80008e0c:	750080e7          	jalr	1872(ra) # 80007558 <mycpu>
    80008e10:	01813083          	ld	ra,24(sp)
    80008e14:	01013403          	ld	s0,16(sp)
    80008e18:	40a48533          	sub	a0,s1,a0
    80008e1c:	00153513          	seqz	a0,a0
    80008e20:	00813483          	ld	s1,8(sp)
    80008e24:	02010113          	addi	sp,sp,32
    80008e28:	00008067          	ret

0000000080008e2c <push_off>:
    80008e2c:	fe010113          	addi	sp,sp,-32
    80008e30:	00813823          	sd	s0,16(sp)
    80008e34:	00113c23          	sd	ra,24(sp)
    80008e38:	00913423          	sd	s1,8(sp)
    80008e3c:	02010413          	addi	s0,sp,32
    80008e40:	100024f3          	csrr	s1,sstatus
    80008e44:	100027f3          	csrr	a5,sstatus
    80008e48:	ffd7f793          	andi	a5,a5,-3
    80008e4c:	10079073          	csrw	sstatus,a5
    80008e50:	ffffe097          	auipc	ra,0xffffe
    80008e54:	708080e7          	jalr	1800(ra) # 80007558 <mycpu>
    80008e58:	07852783          	lw	a5,120(a0)
    80008e5c:	02078663          	beqz	a5,80008e88 <push_off+0x5c>
    80008e60:	ffffe097          	auipc	ra,0xffffe
    80008e64:	6f8080e7          	jalr	1784(ra) # 80007558 <mycpu>
    80008e68:	07852783          	lw	a5,120(a0)
    80008e6c:	01813083          	ld	ra,24(sp)
    80008e70:	01013403          	ld	s0,16(sp)
    80008e74:	0017879b          	addiw	a5,a5,1
    80008e78:	06f52c23          	sw	a5,120(a0)
    80008e7c:	00813483          	ld	s1,8(sp)
    80008e80:	02010113          	addi	sp,sp,32
    80008e84:	00008067          	ret
    80008e88:	0014d493          	srli	s1,s1,0x1
    80008e8c:	ffffe097          	auipc	ra,0xffffe
    80008e90:	6cc080e7          	jalr	1740(ra) # 80007558 <mycpu>
    80008e94:	0014f493          	andi	s1,s1,1
    80008e98:	06952e23          	sw	s1,124(a0)
    80008e9c:	fc5ff06f          	j	80008e60 <push_off+0x34>

0000000080008ea0 <pop_off>:
    80008ea0:	ff010113          	addi	sp,sp,-16
    80008ea4:	00813023          	sd	s0,0(sp)
    80008ea8:	00113423          	sd	ra,8(sp)
    80008eac:	01010413          	addi	s0,sp,16
    80008eb0:	ffffe097          	auipc	ra,0xffffe
    80008eb4:	6a8080e7          	jalr	1704(ra) # 80007558 <mycpu>
    80008eb8:	100027f3          	csrr	a5,sstatus
    80008ebc:	0027f793          	andi	a5,a5,2
    80008ec0:	04079663          	bnez	a5,80008f0c <pop_off+0x6c>
    80008ec4:	07852783          	lw	a5,120(a0)
    80008ec8:	02f05a63          	blez	a5,80008efc <pop_off+0x5c>
    80008ecc:	fff7871b          	addiw	a4,a5,-1
    80008ed0:	06e52c23          	sw	a4,120(a0)
    80008ed4:	00071c63          	bnez	a4,80008eec <pop_off+0x4c>
    80008ed8:	07c52783          	lw	a5,124(a0)
    80008edc:	00078863          	beqz	a5,80008eec <pop_off+0x4c>
    80008ee0:	100027f3          	csrr	a5,sstatus
    80008ee4:	0027e793          	ori	a5,a5,2
    80008ee8:	10079073          	csrw	sstatus,a5
    80008eec:	00813083          	ld	ra,8(sp)
    80008ef0:	00013403          	ld	s0,0(sp)
    80008ef4:	01010113          	addi	sp,sp,16
    80008ef8:	00008067          	ret
    80008efc:	00002517          	auipc	a0,0x2
    80008f00:	93450513          	addi	a0,a0,-1740 # 8000a830 <digits+0x48>
    80008f04:	fffff097          	auipc	ra,0xfffff
    80008f08:	018080e7          	jalr	24(ra) # 80007f1c <panic>
    80008f0c:	00002517          	auipc	a0,0x2
    80008f10:	90c50513          	addi	a0,a0,-1780 # 8000a818 <digits+0x30>
    80008f14:	fffff097          	auipc	ra,0xfffff
    80008f18:	008080e7          	jalr	8(ra) # 80007f1c <panic>

0000000080008f1c <push_on>:
    80008f1c:	fe010113          	addi	sp,sp,-32
    80008f20:	00813823          	sd	s0,16(sp)
    80008f24:	00113c23          	sd	ra,24(sp)
    80008f28:	00913423          	sd	s1,8(sp)
    80008f2c:	02010413          	addi	s0,sp,32
    80008f30:	100024f3          	csrr	s1,sstatus
    80008f34:	100027f3          	csrr	a5,sstatus
    80008f38:	0027e793          	ori	a5,a5,2
    80008f3c:	10079073          	csrw	sstatus,a5
    80008f40:	ffffe097          	auipc	ra,0xffffe
    80008f44:	618080e7          	jalr	1560(ra) # 80007558 <mycpu>
    80008f48:	07852783          	lw	a5,120(a0)
    80008f4c:	02078663          	beqz	a5,80008f78 <push_on+0x5c>
    80008f50:	ffffe097          	auipc	ra,0xffffe
    80008f54:	608080e7          	jalr	1544(ra) # 80007558 <mycpu>
    80008f58:	07852783          	lw	a5,120(a0)
    80008f5c:	01813083          	ld	ra,24(sp)
    80008f60:	01013403          	ld	s0,16(sp)
    80008f64:	0017879b          	addiw	a5,a5,1
    80008f68:	06f52c23          	sw	a5,120(a0)
    80008f6c:	00813483          	ld	s1,8(sp)
    80008f70:	02010113          	addi	sp,sp,32
    80008f74:	00008067          	ret
    80008f78:	0014d493          	srli	s1,s1,0x1
    80008f7c:	ffffe097          	auipc	ra,0xffffe
    80008f80:	5dc080e7          	jalr	1500(ra) # 80007558 <mycpu>
    80008f84:	0014f493          	andi	s1,s1,1
    80008f88:	06952e23          	sw	s1,124(a0)
    80008f8c:	fc5ff06f          	j	80008f50 <push_on+0x34>

0000000080008f90 <pop_on>:
    80008f90:	ff010113          	addi	sp,sp,-16
    80008f94:	00813023          	sd	s0,0(sp)
    80008f98:	00113423          	sd	ra,8(sp)
    80008f9c:	01010413          	addi	s0,sp,16
    80008fa0:	ffffe097          	auipc	ra,0xffffe
    80008fa4:	5b8080e7          	jalr	1464(ra) # 80007558 <mycpu>
    80008fa8:	100027f3          	csrr	a5,sstatus
    80008fac:	0027f793          	andi	a5,a5,2
    80008fb0:	04078463          	beqz	a5,80008ff8 <pop_on+0x68>
    80008fb4:	07852783          	lw	a5,120(a0)
    80008fb8:	02f05863          	blez	a5,80008fe8 <pop_on+0x58>
    80008fbc:	fff7879b          	addiw	a5,a5,-1
    80008fc0:	06f52c23          	sw	a5,120(a0)
    80008fc4:	07853783          	ld	a5,120(a0)
    80008fc8:	00079863          	bnez	a5,80008fd8 <pop_on+0x48>
    80008fcc:	100027f3          	csrr	a5,sstatus
    80008fd0:	ffd7f793          	andi	a5,a5,-3
    80008fd4:	10079073          	csrw	sstatus,a5
    80008fd8:	00813083          	ld	ra,8(sp)
    80008fdc:	00013403          	ld	s0,0(sp)
    80008fe0:	01010113          	addi	sp,sp,16
    80008fe4:	00008067          	ret
    80008fe8:	00002517          	auipc	a0,0x2
    80008fec:	87050513          	addi	a0,a0,-1936 # 8000a858 <digits+0x70>
    80008ff0:	fffff097          	auipc	ra,0xfffff
    80008ff4:	f2c080e7          	jalr	-212(ra) # 80007f1c <panic>
    80008ff8:	00002517          	auipc	a0,0x2
    80008ffc:	84050513          	addi	a0,a0,-1984 # 8000a838 <digits+0x50>
    80009000:	fffff097          	auipc	ra,0xfffff
    80009004:	f1c080e7          	jalr	-228(ra) # 80007f1c <panic>

0000000080009008 <__memset>:
    80009008:	ff010113          	addi	sp,sp,-16
    8000900c:	00813423          	sd	s0,8(sp)
    80009010:	01010413          	addi	s0,sp,16
    80009014:	1a060e63          	beqz	a2,800091d0 <__memset+0x1c8>
    80009018:	40a007b3          	neg	a5,a0
    8000901c:	0077f793          	andi	a5,a5,7
    80009020:	00778693          	addi	a3,a5,7
    80009024:	00b00813          	li	a6,11
    80009028:	0ff5f593          	andi	a1,a1,255
    8000902c:	fff6071b          	addiw	a4,a2,-1
    80009030:	1b06e663          	bltu	a3,a6,800091dc <__memset+0x1d4>
    80009034:	1cd76463          	bltu	a4,a3,800091fc <__memset+0x1f4>
    80009038:	1a078e63          	beqz	a5,800091f4 <__memset+0x1ec>
    8000903c:	00b50023          	sb	a1,0(a0)
    80009040:	00100713          	li	a4,1
    80009044:	1ae78463          	beq	a5,a4,800091ec <__memset+0x1e4>
    80009048:	00b500a3          	sb	a1,1(a0)
    8000904c:	00200713          	li	a4,2
    80009050:	1ae78a63          	beq	a5,a4,80009204 <__memset+0x1fc>
    80009054:	00b50123          	sb	a1,2(a0)
    80009058:	00300713          	li	a4,3
    8000905c:	18e78463          	beq	a5,a4,800091e4 <__memset+0x1dc>
    80009060:	00b501a3          	sb	a1,3(a0)
    80009064:	00400713          	li	a4,4
    80009068:	1ae78263          	beq	a5,a4,8000920c <__memset+0x204>
    8000906c:	00b50223          	sb	a1,4(a0)
    80009070:	00500713          	li	a4,5
    80009074:	1ae78063          	beq	a5,a4,80009214 <__memset+0x20c>
    80009078:	00b502a3          	sb	a1,5(a0)
    8000907c:	00700713          	li	a4,7
    80009080:	18e79e63          	bne	a5,a4,8000921c <__memset+0x214>
    80009084:	00b50323          	sb	a1,6(a0)
    80009088:	00700e93          	li	t4,7
    8000908c:	00859713          	slli	a4,a1,0x8
    80009090:	00e5e733          	or	a4,a1,a4
    80009094:	01059e13          	slli	t3,a1,0x10
    80009098:	01c76e33          	or	t3,a4,t3
    8000909c:	01859313          	slli	t1,a1,0x18
    800090a0:	006e6333          	or	t1,t3,t1
    800090a4:	02059893          	slli	a7,a1,0x20
    800090a8:	40f60e3b          	subw	t3,a2,a5
    800090ac:	011368b3          	or	a7,t1,a7
    800090b0:	02859813          	slli	a6,a1,0x28
    800090b4:	0108e833          	or	a6,a7,a6
    800090b8:	03059693          	slli	a3,a1,0x30
    800090bc:	003e589b          	srliw	a7,t3,0x3
    800090c0:	00d866b3          	or	a3,a6,a3
    800090c4:	03859713          	slli	a4,a1,0x38
    800090c8:	00389813          	slli	a6,a7,0x3
    800090cc:	00f507b3          	add	a5,a0,a5
    800090d0:	00e6e733          	or	a4,a3,a4
    800090d4:	000e089b          	sext.w	a7,t3
    800090d8:	00f806b3          	add	a3,a6,a5
    800090dc:	00e7b023          	sd	a4,0(a5)
    800090e0:	00878793          	addi	a5,a5,8
    800090e4:	fed79ce3          	bne	a5,a3,800090dc <__memset+0xd4>
    800090e8:	ff8e7793          	andi	a5,t3,-8
    800090ec:	0007871b          	sext.w	a4,a5
    800090f0:	01d787bb          	addw	a5,a5,t4
    800090f4:	0ce88e63          	beq	a7,a4,800091d0 <__memset+0x1c8>
    800090f8:	00f50733          	add	a4,a0,a5
    800090fc:	00b70023          	sb	a1,0(a4)
    80009100:	0017871b          	addiw	a4,a5,1
    80009104:	0cc77663          	bgeu	a4,a2,800091d0 <__memset+0x1c8>
    80009108:	00e50733          	add	a4,a0,a4
    8000910c:	00b70023          	sb	a1,0(a4)
    80009110:	0027871b          	addiw	a4,a5,2
    80009114:	0ac77e63          	bgeu	a4,a2,800091d0 <__memset+0x1c8>
    80009118:	00e50733          	add	a4,a0,a4
    8000911c:	00b70023          	sb	a1,0(a4)
    80009120:	0037871b          	addiw	a4,a5,3
    80009124:	0ac77663          	bgeu	a4,a2,800091d0 <__memset+0x1c8>
    80009128:	00e50733          	add	a4,a0,a4
    8000912c:	00b70023          	sb	a1,0(a4)
    80009130:	0047871b          	addiw	a4,a5,4
    80009134:	08c77e63          	bgeu	a4,a2,800091d0 <__memset+0x1c8>
    80009138:	00e50733          	add	a4,a0,a4
    8000913c:	00b70023          	sb	a1,0(a4)
    80009140:	0057871b          	addiw	a4,a5,5
    80009144:	08c77663          	bgeu	a4,a2,800091d0 <__memset+0x1c8>
    80009148:	00e50733          	add	a4,a0,a4
    8000914c:	00b70023          	sb	a1,0(a4)
    80009150:	0067871b          	addiw	a4,a5,6
    80009154:	06c77e63          	bgeu	a4,a2,800091d0 <__memset+0x1c8>
    80009158:	00e50733          	add	a4,a0,a4
    8000915c:	00b70023          	sb	a1,0(a4)
    80009160:	0077871b          	addiw	a4,a5,7
    80009164:	06c77663          	bgeu	a4,a2,800091d0 <__memset+0x1c8>
    80009168:	00e50733          	add	a4,a0,a4
    8000916c:	00b70023          	sb	a1,0(a4)
    80009170:	0087871b          	addiw	a4,a5,8
    80009174:	04c77e63          	bgeu	a4,a2,800091d0 <__memset+0x1c8>
    80009178:	00e50733          	add	a4,a0,a4
    8000917c:	00b70023          	sb	a1,0(a4)
    80009180:	0097871b          	addiw	a4,a5,9
    80009184:	04c77663          	bgeu	a4,a2,800091d0 <__memset+0x1c8>
    80009188:	00e50733          	add	a4,a0,a4
    8000918c:	00b70023          	sb	a1,0(a4)
    80009190:	00a7871b          	addiw	a4,a5,10
    80009194:	02c77e63          	bgeu	a4,a2,800091d0 <__memset+0x1c8>
    80009198:	00e50733          	add	a4,a0,a4
    8000919c:	00b70023          	sb	a1,0(a4)
    800091a0:	00b7871b          	addiw	a4,a5,11
    800091a4:	02c77663          	bgeu	a4,a2,800091d0 <__memset+0x1c8>
    800091a8:	00e50733          	add	a4,a0,a4
    800091ac:	00b70023          	sb	a1,0(a4)
    800091b0:	00c7871b          	addiw	a4,a5,12
    800091b4:	00c77e63          	bgeu	a4,a2,800091d0 <__memset+0x1c8>
    800091b8:	00e50733          	add	a4,a0,a4
    800091bc:	00b70023          	sb	a1,0(a4)
    800091c0:	00d7879b          	addiw	a5,a5,13
    800091c4:	00c7f663          	bgeu	a5,a2,800091d0 <__memset+0x1c8>
    800091c8:	00f507b3          	add	a5,a0,a5
    800091cc:	00b78023          	sb	a1,0(a5)
    800091d0:	00813403          	ld	s0,8(sp)
    800091d4:	01010113          	addi	sp,sp,16
    800091d8:	00008067          	ret
    800091dc:	00b00693          	li	a3,11
    800091e0:	e55ff06f          	j	80009034 <__memset+0x2c>
    800091e4:	00300e93          	li	t4,3
    800091e8:	ea5ff06f          	j	8000908c <__memset+0x84>
    800091ec:	00100e93          	li	t4,1
    800091f0:	e9dff06f          	j	8000908c <__memset+0x84>
    800091f4:	00000e93          	li	t4,0
    800091f8:	e95ff06f          	j	8000908c <__memset+0x84>
    800091fc:	00000793          	li	a5,0
    80009200:	ef9ff06f          	j	800090f8 <__memset+0xf0>
    80009204:	00200e93          	li	t4,2
    80009208:	e85ff06f          	j	8000908c <__memset+0x84>
    8000920c:	00400e93          	li	t4,4
    80009210:	e7dff06f          	j	8000908c <__memset+0x84>
    80009214:	00500e93          	li	t4,5
    80009218:	e75ff06f          	j	8000908c <__memset+0x84>
    8000921c:	00600e93          	li	t4,6
    80009220:	e6dff06f          	j	8000908c <__memset+0x84>

0000000080009224 <__memmove>:
    80009224:	ff010113          	addi	sp,sp,-16
    80009228:	00813423          	sd	s0,8(sp)
    8000922c:	01010413          	addi	s0,sp,16
    80009230:	0e060863          	beqz	a2,80009320 <__memmove+0xfc>
    80009234:	fff6069b          	addiw	a3,a2,-1
    80009238:	0006881b          	sext.w	a6,a3
    8000923c:	0ea5e863          	bltu	a1,a0,8000932c <__memmove+0x108>
    80009240:	00758713          	addi	a4,a1,7
    80009244:	00a5e7b3          	or	a5,a1,a0
    80009248:	40a70733          	sub	a4,a4,a0
    8000924c:	0077f793          	andi	a5,a5,7
    80009250:	00f73713          	sltiu	a4,a4,15
    80009254:	00174713          	xori	a4,a4,1
    80009258:	0017b793          	seqz	a5,a5
    8000925c:	00e7f7b3          	and	a5,a5,a4
    80009260:	10078863          	beqz	a5,80009370 <__memmove+0x14c>
    80009264:	00900793          	li	a5,9
    80009268:	1107f463          	bgeu	a5,a6,80009370 <__memmove+0x14c>
    8000926c:	0036581b          	srliw	a6,a2,0x3
    80009270:	fff8081b          	addiw	a6,a6,-1
    80009274:	02081813          	slli	a6,a6,0x20
    80009278:	01d85893          	srli	a7,a6,0x1d
    8000927c:	00858813          	addi	a6,a1,8
    80009280:	00058793          	mv	a5,a1
    80009284:	00050713          	mv	a4,a0
    80009288:	01088833          	add	a6,a7,a6
    8000928c:	0007b883          	ld	a7,0(a5)
    80009290:	00878793          	addi	a5,a5,8
    80009294:	00870713          	addi	a4,a4,8
    80009298:	ff173c23          	sd	a7,-8(a4)
    8000929c:	ff0798e3          	bne	a5,a6,8000928c <__memmove+0x68>
    800092a0:	ff867713          	andi	a4,a2,-8
    800092a4:	02071793          	slli	a5,a4,0x20
    800092a8:	0207d793          	srli	a5,a5,0x20
    800092ac:	00f585b3          	add	a1,a1,a5
    800092b0:	40e686bb          	subw	a3,a3,a4
    800092b4:	00f507b3          	add	a5,a0,a5
    800092b8:	06e60463          	beq	a2,a4,80009320 <__memmove+0xfc>
    800092bc:	0005c703          	lbu	a4,0(a1)
    800092c0:	00e78023          	sb	a4,0(a5)
    800092c4:	04068e63          	beqz	a3,80009320 <__memmove+0xfc>
    800092c8:	0015c603          	lbu	a2,1(a1)
    800092cc:	00100713          	li	a4,1
    800092d0:	00c780a3          	sb	a2,1(a5)
    800092d4:	04e68663          	beq	a3,a4,80009320 <__memmove+0xfc>
    800092d8:	0025c603          	lbu	a2,2(a1)
    800092dc:	00200713          	li	a4,2
    800092e0:	00c78123          	sb	a2,2(a5)
    800092e4:	02e68e63          	beq	a3,a4,80009320 <__memmove+0xfc>
    800092e8:	0035c603          	lbu	a2,3(a1)
    800092ec:	00300713          	li	a4,3
    800092f0:	00c781a3          	sb	a2,3(a5)
    800092f4:	02e68663          	beq	a3,a4,80009320 <__memmove+0xfc>
    800092f8:	0045c603          	lbu	a2,4(a1)
    800092fc:	00400713          	li	a4,4
    80009300:	00c78223          	sb	a2,4(a5)
    80009304:	00e68e63          	beq	a3,a4,80009320 <__memmove+0xfc>
    80009308:	0055c603          	lbu	a2,5(a1)
    8000930c:	00500713          	li	a4,5
    80009310:	00c782a3          	sb	a2,5(a5)
    80009314:	00e68663          	beq	a3,a4,80009320 <__memmove+0xfc>
    80009318:	0065c703          	lbu	a4,6(a1)
    8000931c:	00e78323          	sb	a4,6(a5)
    80009320:	00813403          	ld	s0,8(sp)
    80009324:	01010113          	addi	sp,sp,16
    80009328:	00008067          	ret
    8000932c:	02061713          	slli	a4,a2,0x20
    80009330:	02075713          	srli	a4,a4,0x20
    80009334:	00e587b3          	add	a5,a1,a4
    80009338:	f0f574e3          	bgeu	a0,a5,80009240 <__memmove+0x1c>
    8000933c:	02069613          	slli	a2,a3,0x20
    80009340:	02065613          	srli	a2,a2,0x20
    80009344:	fff64613          	not	a2,a2
    80009348:	00e50733          	add	a4,a0,a4
    8000934c:	00c78633          	add	a2,a5,a2
    80009350:	fff7c683          	lbu	a3,-1(a5)
    80009354:	fff78793          	addi	a5,a5,-1
    80009358:	fff70713          	addi	a4,a4,-1
    8000935c:	00d70023          	sb	a3,0(a4)
    80009360:	fec798e3          	bne	a5,a2,80009350 <__memmove+0x12c>
    80009364:	00813403          	ld	s0,8(sp)
    80009368:	01010113          	addi	sp,sp,16
    8000936c:	00008067          	ret
    80009370:	02069713          	slli	a4,a3,0x20
    80009374:	02075713          	srli	a4,a4,0x20
    80009378:	00170713          	addi	a4,a4,1
    8000937c:	00e50733          	add	a4,a0,a4
    80009380:	00050793          	mv	a5,a0
    80009384:	0005c683          	lbu	a3,0(a1)
    80009388:	00178793          	addi	a5,a5,1
    8000938c:	00158593          	addi	a1,a1,1
    80009390:	fed78fa3          	sb	a3,-1(a5)
    80009394:	fee798e3          	bne	a5,a4,80009384 <__memmove+0x160>
    80009398:	f89ff06f          	j	80009320 <__memmove+0xfc>
	...
