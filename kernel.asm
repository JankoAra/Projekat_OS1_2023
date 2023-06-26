
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	c0013103          	ld	sp,-1024(sp) # 8000cc00 <_GLOBAL_OFFSET_TABLE_+0x48>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	26c070ef          	jal	ra,80007288 <start>

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
    800013a4:	8707b783          	ld	a5,-1936(a5) # 8000cc10 <_GLOBAL_OFFSET_TABLE_+0x58>
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
    800015f0:	6247b783          	ld	a5,1572(a5) # 8000cc10 <_GLOBAL_OFFSET_TABLE_+0x58>
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
    80001684:	6107c783          	lbu	a5,1552(a5) # 8000cc90 <_ZN8KConsole11initializedE>
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
    800016a8:	5ec48493          	addi	s1,s1,1516 # 8000cc90 <_ZN8KConsole11initializedE>
    800016ac:	0000b797          	auipc	a5,0xb
    800016b0:	51c7b783          	ld	a5,1308(a5) # 8000cbc8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800016b4:	0007b783          	ld	a5,0(a5)
    800016b8:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    800016bc:	0000b797          	auipc	a5,0xb
    800016c0:	51c7b783          	ld	a5,1308(a5) # 8000cbd8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016c4:	0007b783          	ld	a5,0(a5)
    800016c8:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    800016cc:	03200593          	li	a1,50
    800016d0:	0000b517          	auipc	a0,0xb
    800016d4:	5d850513          	addi	a0,a0,1496 # 8000cca8 <_ZN8KConsole19inputBufferHasSpaceE>
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	dd4080e7          	jalr	-556(ra) # 800014ac <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016e0:	03200593          	li	a1,50
    800016e4:	0000b517          	auipc	a0,0xb
    800016e8:	5cc50513          	addi	a0,a0,1484 # 8000ccb0 <_ZN8KConsole20outputBufferHasSpaceE>
    800016ec:	00000097          	auipc	ra,0x0
    800016f0:	dc0080e7          	jalr	-576(ra) # 800014ac <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016f4:	00000593          	li	a1,0
    800016f8:	0000b517          	auipc	a0,0xb
    800016fc:	5c050513          	addi	a0,a0,1472 # 8000ccb8 <_ZN8KConsole12charsToInputE>
    80001700:	00000097          	auipc	ra,0x0
    80001704:	dac080e7          	jalr	-596(ra) # 800014ac <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    80001708:	00000593          	li	a1,0
    8000170c:	0000b517          	auipc	a0,0xb
    80001710:	5b450513          	addi	a0,a0,1460 # 8000ccc0 <_ZN8KConsole13charsToOutputE>
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
    80001750:	54448493          	addi	s1,s1,1348 # 8000cc90 <_ZN8KConsole11initializedE>
    80001754:	0304b503          	ld	a0,48(s1)
    80001758:	00000097          	auipc	ra,0x0
    8000175c:	dbc080e7          	jalr	-580(ra) # 80001514 <_Z8sem_waitP4KSem>
	char c = outputBuffer[outputHead];
    80001760:	0384a783          	lw	a5,56(s1)
    80001764:	00f48733          	add	a4,s1,a5
	outputHead = (outputHead + 1) % capacity;
    80001768:	0017879b          	addiw	a5,a5,1
    8000176c:	03200693          	li	a3,50
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
    80001794:	57472703          	lw	a4,1396(a4) # 8000cd04 <_ZN8KConsole15inputBufferSizeE>
    80001798:	03200793          	li	a5,50
    8000179c:	04f70e63          	beq	a4,a5,800017f8 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    800017a0:	ff010113          	addi	sp,sp,-16
    800017a4:	00113423          	sd	ra,8(sp)
    800017a8:	00813023          	sd	s0,0(sp)
    800017ac:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    800017b0:	0000b697          	auipc	a3,0xb
    800017b4:	4e068693          	addi	a3,a3,1248 # 8000cc90 <_ZN8KConsole11initializedE>
    800017b8:	0786a783          	lw	a5,120(a3)
    800017bc:	00f68633          	add	a2,a3,a5
    800017c0:	08a60023          	sb	a0,128(a2)
	inputTail = (inputTail + 1) % capacity;
    800017c4:	0017879b          	addiw	a5,a5,1
    800017c8:	03200613          	li	a2,50
    800017cc:	02c7e7bb          	remw	a5,a5,a2
    800017d0:	06f6ac23          	sw	a5,120(a3)
	inputBufferSize++;
    800017d4:	0017071b          	addiw	a4,a4,1
    800017d8:	06e6aa23          	sw	a4,116(a3)
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
    8000181c:	47848493          	addi	s1,s1,1144 # 8000cc90 <_ZN8KConsole11initializedE>
    80001820:	0204b503          	ld	a0,32(s1)
    80001824:	00000097          	auipc	ra,0x0
    80001828:	cf0080e7          	jalr	-784(ra) # 80001514 <_Z8sem_waitP4KSem>
	outputBuffer[outputTail] = c;
    8000182c:	0b44a783          	lw	a5,180(s1)
    80001830:	00f48733          	add	a4,s1,a5
    80001834:	05270023          	sb	s2,64(a4)
	outputTail = (outputTail + 1) % capacity;
    80001838:	0017879b          	addiw	a5,a5,1
    8000183c:	03200713          	li	a4,50
    80001840:	02e7e7bb          	remw	a5,a5,a4
    80001844:	0af4aa23          	sw	a5,180(s1)
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
    80001884:	41048493          	addi	s1,s1,1040 # 8000cc90 <_ZN8KConsole11initializedE>
    80001888:	0284b503          	ld	a0,40(s1)
    8000188c:	00000097          	auipc	ra,0x0
    80001890:	c88080e7          	jalr	-888(ra) # 80001514 <_Z8sem_waitP4KSem>
	char c = inputBuffer[inputHead];
    80001894:	0b84a783          	lw	a5,184(s1)
    80001898:	00f48733          	add	a4,s1,a5
	inputHead = (inputHead + 1) % capacity;
    8000189c:	0017879b          	addiw	a5,a5,1
    800018a0:	03200693          	li	a3,50
    800018a4:	02d7e7bb          	remw	a5,a5,a3
    800018a8:	0af4ac23          	sw	a5,184(s1)
	inputBufferSize--;
    800018ac:	0744a783          	lw	a5,116(s1)
    800018b0:	fff7879b          	addiw	a5,a5,-1
    800018b4:	06f4aa23          	sw	a5,116(s1)
	return c;
}
    800018b8:	08074503          	lbu	a0,128(a4)
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
    800018e0:	4747b783          	ld	a5,1140(a5) # 8000cd50 <_ZN9Scheduler4tailE>
    800018e4:	02078263          	beqz	a5,80001908 <_ZN9Scheduler3putEP3TCB+0x38>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    800018e8:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    800018ec:	0000b797          	auipc	a5,0xb
    800018f0:	46a7b223          	sd	a0,1124(a5) # 8000cd50 <_ZN9Scheduler4tailE>
    using Body = void (*)(void*);

    enum ThreadStatus {
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

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
    8000190c:	44878793          	addi	a5,a5,1096 # 8000cd50 <_ZN9Scheduler4tailE>
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
    8000192c:	42870713          	addi	a4,a4,1064 # 8000cd50 <_ZN9Scheduler4tailE>
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
    80001974:	3f083803          	ld	a6,1008(a6) # 8000cd60 <_ZN9Scheduler12sleepingHeadE>
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
    800019ac:	3aa7bc23          	sd	a0,952(a5) # 8000cd60 <_ZN9Scheduler12sleepingHeadE>
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
    800019f4:	36a7b823          	sd	a0,880(a5) # 8000cd60 <_ZN9Scheduler12sleepingHeadE>
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
    80001a10:	3547b783          	ld	a5,852(a5) # 8000cd60 <_ZN9Scheduler12sleepingHeadE>
    80001a14:	06078a63          	beqz	a5,80001a88 <_ZN9Scheduler4wakeEv+0x7c>
    sleepingHead->timeToSleep--;
    80001a18:	0387b703          	ld	a4,56(a5)
    80001a1c:	fff70713          	addi	a4,a4,-1
    80001a20:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001a24:	0000b517          	auipc	a0,0xb
    80001a28:	33c53503          	ld	a0,828(a0) # 8000cd60 <_ZN9Scheduler12sleepingHeadE>
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
    80001a5c:	30f73423          	sd	a5,776(a4) # 8000cd60 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    80001a60:	04053023          	sd	zero,64(a0)
        Scheduler::put(thread);
    80001a64:	00000097          	auipc	ra,0x0
    80001a68:	e6c080e7          	jalr	-404(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001a6c:	0000b517          	auipc	a0,0xb
    80001a70:	2f453503          	ld	a0,756(a0) # 8000cd60 <_ZN9Scheduler12sleepingHeadE>
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
    80001aa0:	2cc7b783          	ld	a5,716(a5) # 8000cd68 <_ZN7KMemory14freeBlocksLeftE>
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
    80001acc:	2a86b683          	ld	a3,680(a3) # 8000cd70 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001ad0:	08d5fa63          	bgeu	a1,a3,80001b64 <_ZN7KMemory7kmallocEm+0xd8>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001ad4:	03f00693          	li	a3,63
    80001ad8:	02d78a63          	beq	a5,a3,80001b0c <_ZN7KMemory7kmallocEm+0x80>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    80001adc:	00359693          	slli	a3,a1,0x3
    80001ae0:	0000b617          	auipc	a2,0xb
    80001ae4:	29863603          	ld	a2,664(a2) # 8000cd78 <_ZN7KMemory9bitVectorE>
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
    80001b14:	26863603          	ld	a2,616(a2) # 8000cd78 <_ZN7KMemory9bitVectorE>
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
    80001b78:	06c6b683          	ld	a3,108(a3) # 8000cbe0 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80001ba8:	1d46b683          	ld	a3,468(a3) # 8000cd78 <_ZN7KMemory9bitVectorE>
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
    80001bd8:	19470713          	addi	a4,a4,404 # 8000cd68 <_ZN7KMemory14freeBlocksLeftE>
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
    80001c14:	1707c783          	lbu	a5,368(a5) # 8000cd80 <_ZN7KMemory11initializedE>
    80001c18:	0a079863          	bnez	a5,80001cc8 <_ZN7KMemory16initializeMemoryEv+0xb8>
void KMemory::initializeMemory() {
    80001c1c:	ff010113          	addi	sp,sp,-16
    80001c20:	00113423          	sd	ra,8(sp)
    80001c24:	00813023          	sd	s0,0(sp)
    80001c28:	01010413          	addi	s0,sp,16
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001c2c:	0000b797          	auipc	a5,0xb
    80001c30:	ffc7b783          	ld	a5,-4(a5) # 8000cc28 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001c34:	0007b783          	ld	a5,0(a5)
    80001c38:	0000b717          	auipc	a4,0xb
    80001c3c:	fa873703          	ld	a4,-88(a4) # 8000cbe0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c40:	00073603          	ld	a2,0(a4)
    80001c44:	40c787b3          	sub	a5,a5,a2
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    80001c48:	00c7d793          	srli	a5,a5,0xc
    80001c4c:	0000b717          	auipc	a4,0xb
    80001c50:	11c70713          	addi	a4,a4,284 # 8000cd68 <_ZN7KMemory14freeBlocksLeftE>
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
    80001c80:	0f473703          	ld	a4,244(a4) # 8000cd70 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001c84:	02e7f063          	bgeu	a5,a4,80001ca4 <_ZN7KMemory16initializeMemoryEv+0x94>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    80001c88:	00379693          	slli	a3,a5,0x3
    80001c8c:	0000b717          	auipc	a4,0xb
    80001c90:	0ec73703          	ld	a4,236(a4) # 8000cd78 <_ZN7KMemory9bitVectorE>
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
    80001cb4:	0cf70823          	sb	a5,208(a4) # 8000cd80 <_ZN7KMemory11initializedE>
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
    80001ce4:	f0073703          	ld	a4,-256(a4) # 8000cbe0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001ce8:	00073703          	ld	a4,0(a4)
    80001cec:	40e787b3          	sub	a5,a5,a4
    80001cf0:	03f7f713          	andi	a4,a5,63
    80001cf4:	08071063          	bnez	a4,80001d74 <_ZN7KMemory5kfreeEPv+0xa8>
    uint64 blocksToFree = *(uint64*)ptr;
    80001cf8:	ff053583          	ld	a1,-16(a0)
    freeBlocksLeft += blocksToFree;
    80001cfc:	0000b697          	auipc	a3,0xb
    80001d00:	06c68693          	addi	a3,a3,108 # 8000cd68 <_ZN7KMemory14freeBlocksLeftE>
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
    80001d40:	03c6b683          	ld	a3,60(a3) # 8000cd78 <_ZN7KMemory9bitVectorE>
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
    }

    static uint8 getSRvalue() { return *sr; }

    static uint8 getDRvalue() { return *dr; }

    80001dbc:	0000b797          	auipc	a5,0xb
    80001dc0:	e4c7b783          	ld	a5,-436(a5) # 8000cc08 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001dc4:	0007b783          	ld	a5,0(a5)
    80001dc8:	00a78023          	sb	a0,0(a5)
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(KConsole::getSRvalue() & CONSOLE_TX_STATUS_BIT)) {}
        KConsole::setDRvalue(c);
        sem_signal(KConsole::getOutputBufferHasSpace());
    80001dcc:	0000b797          	auipc	a5,0xb
    80001dd0:	e4c7b783          	ld	a5,-436(a5) # 8000cc18 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001dd4:	0007b503          	ld	a0,0(a5)
    80001dd8:	fffff097          	auipc	ra,0xfffff
    80001ddc:	76c080e7          	jalr	1900(ra) # 80001544 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001de0:	00000097          	auipc	ra,0x0
    80001de4:	958080e7          	jalr	-1704(ra) # 80001738 <_ZN8KConsole13getFromOutputEv>

    80001de8:	0000b797          	auipc	a5,0xb
    80001dec:	e607b783          	ld	a5,-416(a5) # 8000cc48 <_GLOBAL_OFFSET_TABLE_+0x90>
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
    80001e1c:	e187b783          	ld	a5,-488(a5) # 8000cc30 <_GLOBAL_OFFSET_TABLE_+0x78>
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
    80001e54:	dd073703          	ld	a4,-560(a4) # 8000cc20 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001e58:	00f73023          	sd	a5,0(a4)

    80001e5c:	00100713          	li	a4,1
    80001e60:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body)userMain, nullptr);
    80001e64:	00000613          	li	a2,0
    80001e68:	0000b597          	auipc	a1,0xb
    80001e6c:	d585b583          	ld	a1,-680(a1) # 8000cbc0 <_GLOBAL_OFFSET_TABLE_+0x8>
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

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
}

inline void Riscv::mc_sstatus(uint64 mask) {
    80001eac:	00200493          	li	s1,2
    80001eb0:	1004a073          	csrs	sstatus,s1

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80001eb4:	fd043503          	ld	a0,-48(s0)
    80001eb8:	fffff097          	auipc	ra,0xfffff
    80001ebc:	59c080e7          	jalr	1436(ra) # 80001454 <_Z11thread_joinP3TCB>
    static void flush() {
    80001ec0:	04300513          	li	a0,67
        __asm__ volatile("li a0, 0x43");
    80001ec4:	00000073          	ecall
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
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
#include "../test/printing.hpp"

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
    80001f94:	0ec78793          	addi	a5,a5,236 # 8000a07c <CONSOLE_STATUS+0x6c>
    80001f98:	00f707b3          	add	a5,a4,a5
    80001f9c:	0007a783          	lw	a5,0(a5)
    80001fa0:	0007871b          	sext.w	a4,a5
    80001fa4:	00008797          	auipc	a5,0x8
    80001fa8:	0d878793          	addi	a5,a5,216 # 8000a07c <CONSOLE_STATUS+0x6c>
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
    80002010:	f18080e7          	jalr	-232(ra) # 80002f24 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002014:	00050793          	mv	a5,a0
    80002018:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    8000201c:	fb843783          	ld	a5,-72(s0)
    80002020:	0007b783          	ld	a5,0(a5)
    80002024:	02078863          	beqz	a5,80002054 <interruptRoutine+0x170>
                    if ((TCB::Body)a2 != (TCB::Body)main) {
    80002028:	fb043703          	ld	a4,-80(s0)
    8000202c:	0000b797          	auipc	a5,0xb
    80002030:	be47b783          	ld	a5,-1052(a5) # 8000cc10 <_GLOBAL_OFFSET_TABLE_+0x58>
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
    80002064:	6b8080e7          	jalr	1720(ra) # 80002718 <_ZN3TCB10getRunningEv>
    80002068:	00050793          	mv	a5,a0
    8000206c:	00500593          	li	a1,5
    80002070:	00078513          	mv	a0,a5
    80002074:	00000097          	auipc	ra,0x0
    80002078:	650080e7          	jalr	1616(ra) # 800026c4 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined();
    8000207c:	00001097          	auipc	ra,0x1
    80002080:	fd4080e7          	jalr	-44(ra) # 80003050 <_ZN3TCB13releaseJoinedEv>
                __asm__ volatile("li a0, 0");
    80002084:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 80(s0)");
    80002088:	04a43823          	sd	a0,80(s0)
                TCB::dispatch();
    8000208c:	00001097          	auipc	ra,0x1
    80002090:	d9c080e7          	jalr	-612(ra) # 80002e28 <_ZN3TCB8dispatchEv>
                break;
    80002094:	3000006f          	j	80002394 <interruptRoutine+0x4b0>
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
    80002098:	00001097          	auipc	ra,0x1
    8000209c:	d90080e7          	jalr	-624(ra) # 80002e28 <_ZN3TCB8dispatchEv>
                break;
    800020a0:	2f40006f          	j	80002394 <interruptRoutine+0x4b0>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    800020a4:	fb843783          	ld	a5,-72(s0)
    800020a8:	00078513          	mv	a0,a5
    800020ac:	00001097          	auipc	ra,0x1
    800020b0:	f54080e7          	jalr	-172(ra) # 80003000 <_ZN3TCB10threadJoinEPS_>
                TCB::dispatch();
    800020b4:	00001097          	auipc	ra,0x1
    800020b8:	d74080e7          	jalr	-652(ra) # 80002e28 <_ZN3TCB8dispatchEv>
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
    800020d4:	048080e7          	jalr	72(ra) # 80003118 <_ZN4KSem7initSemEj>
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
    8000210c:	15c080e7          	jalr	348(ra) # 80003264 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    80002110:	04a43823          	sd	a0,80(s0)
                delete (sem_t)a1;
    80002114:	fb843483          	ld	s1,-72(s0)
    80002118:	26048063          	beqz	s1,80002378 <interruptRoutine+0x494>
    8000211c:	00048513          	mv	a0,s1
    80002120:	00000097          	auipc	ra,0x0
    80002124:	458080e7          	jalr	1112(ra) # 80002578 <_ZN4KSemD1Ev>
    80002128:	00048513          	mv	a0,s1
    8000212c:	00001097          	auipc	ra,0x1
    80002130:	fc4080e7          	jalr	-60(ra) # 800030f0 <_ZN4KSemdlEPv>
                break;
    80002134:	2440006f          	j	80002378 <interruptRoutine+0x494>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80002138:	fb843783          	ld	a5,-72(s0)
    8000213c:	00078513          	mv	a0,a5
    80002140:	00001097          	auipc	ra,0x1
    80002144:	064080e7          	jalr	100(ra) # 800031a4 <_ZN4KSem4waitEv>
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
    8000215c:	0c8080e7          	jalr	200(ra) # 80003220 <_ZN4KSem6signalEv>
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
    8000218c:	590080e7          	jalr	1424(ra) # 80002718 <_ZN3TCB10getRunningEv>
    80002190:	00050793          	mv	a5,a0
    80002194:	fb843583          	ld	a1,-72(s0)
    80002198:	00078513          	mv	a0,a5
    8000219c:	fffff097          	auipc	ra,0xfffff
    800021a0:	7c0080e7          	jalr	1984(ra) # 8000195c <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::dispatch();
    800021a4:	00001097          	auipc	ra,0x1
    800021a8:	c84080e7          	jalr	-892(ra) # 80002e28 <_ZN3TCB8dispatchEv>
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
                //flush izlaznog bafera konzole
                while (KConsole::getOutputHead() != KConsole::getOutputTail()) {
    800021d8:	00000097          	auipc	ra,0x0
    800021dc:	4a4080e7          	jalr	1188(ra) # 8000267c <_ZN8KConsole13getOutputHeadEv>
    800021e0:	00050793          	mv	a5,a0
    800021e4:	00078493          	mv	s1,a5
    800021e8:	00000097          	auipc	ra,0x0
    800021ec:	4b8080e7          	jalr	1208(ra) # 800026a0 <_ZN8KConsole13getOutputTailEv>
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
    8000221c:	3c8080e7          	jalr	968(ra) # 800025e0 <_ZN8KConsole10getSRvalueEv>
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
    80002244:	3f0080e7          	jalr	1008(ra) # 80002630 <_ZN8KConsole10setDRvalueEc>
                    sem_signal(KConsole::getOutputBufferHasSpace());
    80002248:	00000097          	auipc	ra,0x0
    8000224c:	410080e7          	jalr	1040(ra) # 80002658 <_ZN8KConsole23getOutputBufferHasSpaceEv>
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
    80002284:	ca4080e7          	jalr	-860(ra) # 80002f24 <_ZN3TCB12createThreadEPFvPvES0_Pm>
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
    800022bc:	444080e7          	jalr	1092(ra) # 800026fc <_ZN3TCB7getBodyEv>
    800022c0:	00050713          	mv	a4,a0
    800022c4:	0000b797          	auipc	a5,0xb
    800022c8:	94c7b783          	ld	a5,-1716(a5) # 8000cc10 <_GLOBAL_OFFSET_TABLE_+0x58>
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
    800022fc:	7a0080e7          	jalr	1952(ra) # 80005a98 <_Z11printStringPKc>
                printInt(a0);
    80002300:	fc043783          	ld	a5,-64(s0)
    80002304:	0007879b          	sext.w	a5,a5
    80002308:	00000613          	li	a2,0
    8000230c:	00a00593          	li	a1,10
    80002310:	00078513          	mv	a0,a5
    80002314:	00004097          	auipc	ra,0x4
    80002318:	934080e7          	jalr	-1740(ra) # 80005c48 <_Z8printIntiii>
                printString("\nscause: ");
    8000231c:	00008517          	auipc	a0,0x8
    80002320:	d1c50513          	addi	a0,a0,-740 # 8000a038 <CONSOLE_STATUS+0x28>
    80002324:	00003097          	auipc	ra,0x3
    80002328:	774080e7          	jalr	1908(ra) # 80005a98 <_Z11printStringPKc>
                printInt(scause);
    8000232c:	fd843783          	ld	a5,-40(s0)
    80002330:	0007879b          	sext.w	a5,a5
    80002334:	00000613          	li	a2,0
    80002338:	00a00593          	li	a1,10
    8000233c:	00078513          	mv	a0,a5
    80002340:	00004097          	auipc	ra,0x4
    80002344:	908080e7          	jalr	-1784(ra) # 80005c48 <_Z8printIntiii>
                printString("\nsepc: ");
    80002348:	00008517          	auipc	a0,0x8
    8000234c:	d0050513          	addi	a0,a0,-768 # 8000a048 <CONSOLE_STATUS+0x38>
    80002350:	00003097          	auipc	ra,0x3
    80002354:	748080e7          	jalr	1864(ra) # 80005a98 <_Z11printStringPKc>
                printInt(sepc);
    80002358:	fd043783          	ld	a5,-48(s0)
    8000235c:	0007879b          	sext.w	a5,a5
    80002360:	00000613          	li	a2,0
    80002364:	00a00593          	li	a1,10
    80002368:	00078513          	mv	a0,a5
    8000236c:	00004097          	auipc	ra,0x4
    80002370:	8dc080e7          	jalr	-1828(ra) # 80005c48 <_Z8printIntiii>
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
    800023b4:	1ac0006f          	j	80002560 <interruptRoutine+0x67c>
    } else if (scause == 0x8000000000000009) {
    800023b8:	fd843703          	ld	a4,-40(s0)
    800023bc:	fff00793          	li	a5,-1
    800023c0:	03f79793          	slli	a5,a5,0x3f
    800023c4:	00978793          	addi	a5,a5,9
    800023c8:	08f71463          	bne	a4,a5,80002450 <interruptRoutine+0x56c>
        uint64 irq = plic_claim();
    800023cc:	00005097          	auipc	ra,0x5
    800023d0:	718080e7          	jalr	1816(ra) # 80007ae4 <plic_claim>
    800023d4:	00050793          	mv	a5,a0
    800023d8:	f8f43c23          	sd	a5,-104(s0)
        if (irq == CONSOLE_IRQ) {
    800023dc:	f9843703          	ld	a4,-104(s0)
    800023e0:	00a00793          	li	a5,10
    800023e4:	02f71c63          	bne	a4,a5,8000241c <interruptRoutine+0x538>
            if (KConsole::getSRvalue() & CONSOLE_RX_STATUS_BIT) {
    800023e8:	00000097          	auipc	ra,0x0
    800023ec:	1f8080e7          	jalr	504(ra) # 800025e0 <_ZN8KConsole10getSRvalueEv>
    800023f0:	00050793          	mv	a5,a0
    800023f4:	0017f793          	andi	a5,a5,1
    800023f8:	00f037b3          	snez	a5,a5
    800023fc:	0ff7f793          	andi	a5,a5,255
    80002400:	00078e63          	beqz	a5,8000241c <interruptRoutine+0x538>
                KConsole::placeInInput(KConsole::getDRvalue());
    80002404:	00000097          	auipc	ra,0x0
    80002408:	204080e7          	jalr	516(ra) # 80002608 <_ZN8KConsole10getDRvalueEv>
    8000240c:	00050793          	mv	a5,a0
    80002410:	00078513          	mv	a0,a5
    80002414:	fffff097          	auipc	ra,0xfffff
    80002418:	37c080e7          	jalr	892(ra) # 80001790 <_ZN8KConsole12placeInInputEc>
        plic_complete(irq);
    8000241c:	f9843783          	ld	a5,-104(s0)
    80002420:	0007879b          	sext.w	a5,a5
    80002424:	00078513          	mv	a0,a5
    80002428:	00005097          	auipc	ra,0x5
    8000242c:	6f4080e7          	jalr	1780(ra) # 80007b1c <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002430:	fd043783          	ld	a5,-48(s0)
    80002434:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002438:	fc843783          	ld	a5,-56(s0)
    8000243c:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    80002440:	20000513          	li	a0,512
    80002444:	00000097          	auipc	ra,0x0
    80002448:	180080e7          	jalr	384(ra) # 800025c4 <_ZN5Riscv6mc_sipEm>
    8000244c:	1140006f          	j	80002560 <interruptRoutine+0x67c>
    } else if (scause == 0x8000000000000001) {
    80002450:	fd843703          	ld	a4,-40(s0)
    80002454:	fff00793          	li	a5,-1
    80002458:	03f79793          	slli	a5,a5,0x3f
    8000245c:	00178793          	addi	a5,a5,1
    80002460:	08f71463          	bne	a4,a5,800024e8 <interruptRoutine+0x604>
        Scheduler::wake();
    80002464:	fffff097          	auipc	ra,0xfffff
    80002468:	5a8080e7          	jalr	1448(ra) # 80001a0c <_ZN9Scheduler4wakeEv>
        TCB::getRunningTimeSlice()++;
    8000246c:	00000097          	auipc	ra,0x0
    80002470:	2d0080e7          	jalr	720(ra) # 8000273c <_ZN3TCB19getRunningTimeSliceEv>
    80002474:	00050793          	mv	a5,a0
    80002478:	0007b703          	ld	a4,0(a5)
    8000247c:	00170713          	addi	a4,a4,1
    80002480:	00e7b023          	sd	a4,0(a5)
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
    80002484:	00000097          	auipc	ra,0x0
    80002488:	2b8080e7          	jalr	696(ra) # 8000273c <_ZN3TCB19getRunningTimeSliceEv>
    8000248c:	00050793          	mv	a5,a0
    80002490:	0007b483          	ld	s1,0(a5)
    80002494:	00000097          	auipc	ra,0x0
    80002498:	284080e7          	jalr	644(ra) # 80002718 <_ZN3TCB10getRunningEv>
    8000249c:	00050793          	mv	a5,a0
    800024a0:	00078513          	mv	a0,a5
    800024a4:	00000097          	auipc	ra,0x0
    800024a8:	23c080e7          	jalr	572(ra) # 800026e0 <_ZN3TCB12getTimeSliceEv>
    800024ac:	00050793          	mv	a5,a0
    800024b0:	00f4b7b3          	sltu	a5,s1,a5
    800024b4:	0017c793          	xori	a5,a5,1
    800024b8:	0ff7f793          	andi	a5,a5,255
    800024bc:	00078663          	beqz	a5,800024c8 <interruptRoutine+0x5e4>
            TCB::dispatch();
    800024c0:	00001097          	auipc	ra,0x1
    800024c4:	968080e7          	jalr	-1688(ra) # 80002e28 <_ZN3TCB8dispatchEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800024c8:	fd043783          	ld	a5,-48(s0)
    800024cc:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800024d0:	fc843783          	ld	a5,-56(s0)
    800024d4:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    800024d8:	00200513          	li	a0,2
    800024dc:	00000097          	auipc	ra,0x0
    800024e0:	0e8080e7          	jalr	232(ra) # 800025c4 <_ZN5Riscv6mc_sipEm>
    800024e4:	07c0006f          	j	80002560 <interruptRoutine+0x67c>
        printString("\nGreska u prekidnoj rutini\n");
    800024e8:	00008517          	auipc	a0,0x8
    800024ec:	b6850513          	addi	a0,a0,-1176 # 8000a050 <CONSOLE_STATUS+0x40>
    800024f0:	00003097          	auipc	ra,0x3
    800024f4:	5a8080e7          	jalr	1448(ra) # 80005a98 <_Z11printStringPKc>
        printString("scause: ");
    800024f8:	00008517          	auipc	a0,0x8
    800024fc:	b7850513          	addi	a0,a0,-1160 # 8000a070 <CONSOLE_STATUS+0x60>
    80002500:	00003097          	auipc	ra,0x3
    80002504:	598080e7          	jalr	1432(ra) # 80005a98 <_Z11printStringPKc>
        printInt(scause);
    80002508:	fd843783          	ld	a5,-40(s0)
    8000250c:	0007879b          	sext.w	a5,a5
    80002510:	00000613          	li	a2,0
    80002514:	00a00593          	li	a1,10
    80002518:	00078513          	mv	a0,a5
    8000251c:	00003097          	auipc	ra,0x3
    80002520:	72c080e7          	jalr	1836(ra) # 80005c48 <_Z8printIntiii>
        printString("\nsepc: ");
    80002524:	00008517          	auipc	a0,0x8
    80002528:	b2450513          	addi	a0,a0,-1244 # 8000a048 <CONSOLE_STATUS+0x38>
    8000252c:	00003097          	auipc	ra,0x3
    80002530:	56c080e7          	jalr	1388(ra) # 80005a98 <_Z11printStringPKc>
        printInt(sepc);
    80002534:	fd043783          	ld	a5,-48(s0)
    80002538:	0007879b          	sext.w	a5,a5
    8000253c:	00000613          	li	a2,0
    80002540:	00a00593          	li	a1,10
    80002544:	00078513          	mv	a0,a5
    80002548:	00003097          	auipc	ra,0x3
    8000254c:	700080e7          	jalr	1792(ra) # 80005c48 <_Z8printIntiii>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002550:	fd043783          	ld	a5,-48(s0)
    80002554:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002558:	fc843783          	ld	a5,-56(s0)
    8000255c:	10079073          	csrw	sstatus,a5
    80002560:	00000013          	nop
    80002564:	06813083          	ld	ra,104(sp)
    80002568:	06013403          	ld	s0,96(sp)
    8000256c:	05813483          	ld	s1,88(sp)
    80002570:	07010113          	addi	sp,sp,112
    80002574:	00008067          	ret

0000000080002578 <_ZN4KSemD1Ev>:
#define PROJEKAT2023_KSEM_HPP

#include "../h/ThreadQueue.hpp"

//klasa napravljena po uzoru na semafor u skolskom jezgru
class KSem {
    80002578:	fe010113          	addi	sp,sp,-32
    8000257c:	00113c23          	sd	ra,24(sp)
    80002580:	00813823          	sd	s0,16(sp)
    80002584:	00913423          	sd	s1,8(sp)
    80002588:	02010413          	addi	s0,sp,32
    8000258c:	00050493          	mv	s1,a0
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    80002590:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002594:	00050e63          	beqz	a0,800025b0 <_ZN4KSemD1Ev+0x38>
            front = front->next;
    80002598:	00853783          	ld	a5,8(a0)
    8000259c:	00f4b423          	sd	a5,8(s1)
            delete node;
    800025a0:	fe0508e3          	beqz	a0,80002590 <_ZN4KSemD1Ev+0x18>
            mem_free(ptr);
    800025a4:	fffff097          	auipc	ra,0xfffff
    800025a8:	da4080e7          	jalr	-604(ra) # 80001348 <_Z8mem_freePv>
        }
    800025ac:	fe5ff06f          	j	80002590 <_ZN4KSemD1Ev+0x18>
    800025b0:	01813083          	ld	ra,24(sp)
    800025b4:	01013403          	ld	s0,16(sp)
    800025b8:	00813483          	ld	s1,8(sp)
    800025bc:	02010113          	addi	sp,sp,32
    800025c0:	00008067          	ret

00000000800025c4 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    800025c4:	ff010113          	addi	sp,sp,-16
    800025c8:	00813423          	sd	s0,8(sp)
    800025cc:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    800025d0:	14453073          	csrc	sip,a0
}
    800025d4:	00813403          	ld	s0,8(sp)
    800025d8:	01010113          	addi	sp,sp,16
    800025dc:	00008067          	ret

00000000800025e0 <_ZN8KConsole10getSRvalueEv>:
    static uint8 getSRvalue() { return *sr; }
    800025e0:	ff010113          	addi	sp,sp,-16
    800025e4:	00813423          	sd	s0,8(sp)
    800025e8:	01010413          	addi	s0,sp,16
    800025ec:	0000a797          	auipc	a5,0xa
    800025f0:	65c7b783          	ld	a5,1628(a5) # 8000cc48 <_GLOBAL_OFFSET_TABLE_+0x90>
    800025f4:	0007b783          	ld	a5,0(a5)
    800025f8:	0007c503          	lbu	a0,0(a5)
    800025fc:	00813403          	ld	s0,8(sp)
    80002600:	01010113          	addi	sp,sp,16
    80002604:	00008067          	ret

0000000080002608 <_ZN8KConsole10getDRvalueEv>:
    static uint8 getDRvalue() { return *dr; }
    80002608:	ff010113          	addi	sp,sp,-16
    8000260c:	00813423          	sd	s0,8(sp)
    80002610:	01010413          	addi	s0,sp,16
    80002614:	0000a797          	auipc	a5,0xa
    80002618:	5f47b783          	ld	a5,1524(a5) # 8000cc08 <_GLOBAL_OFFSET_TABLE_+0x50>
    8000261c:	0007b783          	ld	a5,0(a5)
    80002620:	0007c503          	lbu	a0,0(a5)
    80002624:	00813403          	ld	s0,8(sp)
    80002628:	01010113          	addi	sp,sp,16
    8000262c:	00008067          	ret

0000000080002630 <_ZN8KConsole10setDRvalueEc>:
    static void setDRvalue(char c) { *dr = c; }
    80002630:	ff010113          	addi	sp,sp,-16
    80002634:	00813423          	sd	s0,8(sp)
    80002638:	01010413          	addi	s0,sp,16
    8000263c:	0000a797          	auipc	a5,0xa
    80002640:	5cc7b783          	ld	a5,1484(a5) # 8000cc08 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002644:	0007b783          	ld	a5,0(a5)
    80002648:	00a78023          	sb	a0,0(a5)
    8000264c:	00813403          	ld	s0,8(sp)
    80002650:	01010113          	addi	sp,sp,16
    80002654:	00008067          	ret

0000000080002658 <_ZN8KConsole23getOutputBufferHasSpaceEv>:

    static sem_t getOutputBufferHasSpace() { return outputBufferHasSpace; }
    80002658:	ff010113          	addi	sp,sp,-16
    8000265c:	00813423          	sd	s0,8(sp)
    80002660:	01010413          	addi	s0,sp,16
    80002664:	0000a797          	auipc	a5,0xa
    80002668:	5b47b783          	ld	a5,1460(a5) # 8000cc18 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000266c:	0007b503          	ld	a0,0(a5)
    80002670:	00813403          	ld	s0,8(sp)
    80002674:	01010113          	addi	sp,sp,16
    80002678:	00008067          	ret

000000008000267c <_ZN8KConsole13getOutputHeadEv>:

    static int getOutputHead() { return outputHead; }
    8000267c:	ff010113          	addi	sp,sp,-16
    80002680:	00813423          	sd	s0,8(sp)
    80002684:	01010413          	addi	s0,sp,16
    80002688:	0000a797          	auipc	a5,0xa
    8000268c:	5707b783          	ld	a5,1392(a5) # 8000cbf8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002690:	0007a503          	lw	a0,0(a5)
    80002694:	00813403          	ld	s0,8(sp)
    80002698:	01010113          	addi	sp,sp,16
    8000269c:	00008067          	ret

00000000800026a0 <_ZN8KConsole13getOutputTailEv>:

    static int getOutputTail() { return outputTail; }
    800026a0:	ff010113          	addi	sp,sp,-16
    800026a4:	00813423          	sd	s0,8(sp)
    800026a8:	01010413          	addi	s0,sp,16
    800026ac:	0000a797          	auipc	a5,0xa
    800026b0:	5947b783          	ld	a5,1428(a5) # 8000cc40 <_GLOBAL_OFFSET_TABLE_+0x88>
    800026b4:	0007a503          	lw	a0,0(a5)
    800026b8:	00813403          	ld	s0,8(sp)
    800026bc:	01010113          	addi	sp,sp,16
    800026c0:	00008067          	ret

00000000800026c4 <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    void setStatus(ThreadStatus stat) { this->status = stat; }
    800026c4:	ff010113          	addi	sp,sp,-16
    800026c8:	00813423          	sd	s0,8(sp)
    800026cc:	01010413          	addi	s0,sp,16
    800026d0:	04b52c23          	sw	a1,88(a0)
    800026d4:	00813403          	ld	s0,8(sp)
    800026d8:	01010113          	addi	sp,sp,16
    800026dc:	00008067          	ret

00000000800026e0 <_ZN3TCB12getTimeSliceEv>:
    uint64 getTimeSlice() { return timeSlice; }
    800026e0:	ff010113          	addi	sp,sp,-16
    800026e4:	00813423          	sd	s0,8(sp)
    800026e8:	01010413          	addi	s0,sp,16
    800026ec:	02853503          	ld	a0,40(a0)
    800026f0:	00813403          	ld	s0,8(sp)
    800026f4:	01010113          	addi	sp,sp,16
    800026f8:	00008067          	ret

00000000800026fc <_ZN3TCB7getBodyEv>:
    Body getBody() { return threadFunction; }
    800026fc:	ff010113          	addi	sp,sp,-16
    80002700:	00813423          	sd	s0,8(sp)
    80002704:	01010413          	addi	s0,sp,16
    80002708:	01053503          	ld	a0,16(a0)
    8000270c:	00813403          	ld	s0,8(sp)
    80002710:	01010113          	addi	sp,sp,16
    80002714:	00008067          	ret

0000000080002718 <_ZN3TCB10getRunningEv>:
    static TCB* getRunning() { return running; }
    80002718:	ff010113          	addi	sp,sp,-16
    8000271c:	00813423          	sd	s0,8(sp)
    80002720:	01010413          	addi	s0,sp,16
    80002724:	0000a797          	auipc	a5,0xa
    80002728:	4fc7b783          	ld	a5,1276(a5) # 8000cc20 <_GLOBAL_OFFSET_TABLE_+0x68>
    8000272c:	0007b503          	ld	a0,0(a5)
    80002730:	00813403          	ld	s0,8(sp)
    80002734:	01010113          	addi	sp,sp,16
    80002738:	00008067          	ret

000000008000273c <_ZN3TCB19getRunningTimeSliceEv>:
    static uint64 &getRunningTimeSlice() { return runningTimeSlice; }
    8000273c:	ff010113          	addi	sp,sp,-16
    80002740:	00813423          	sd	s0,8(sp)
    80002744:	01010413          	addi	s0,sp,16
    80002748:	0000a517          	auipc	a0,0xa
    8000274c:	48853503          	ld	a0,1160(a0) # 8000cbd0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002750:	00813403          	ld	s0,8(sp)
    80002754:	01010113          	addi	sp,sp,16
    80002758:	00008067          	ret

000000008000275c <_ZN6Thread7wrapperEPv>:

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
    8000275c:	02050863          	beqz	a0,8000278c <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80002760:	ff010113          	addi	sp,sp,-16
    80002764:	00113423          	sd	ra,8(sp)
    80002768:	00813023          	sd	s0,0(sp)
    8000276c:	01010413          	addi	s0,sp,16
        ((Thread*)thread)->run();
    80002770:	00053783          	ld	a5,0(a0)
    80002774:	0107b783          	ld	a5,16(a5)
    80002778:	000780e7          	jalr	a5
    }
}
    8000277c:	00813083          	ld	ra,8(sp)
    80002780:	00013403          	ld	s0,0(sp)
    80002784:	01010113          	addi	sp,sp,16
    80002788:	00008067          	ret
    8000278c:	00008067          	ret

0000000080002790 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80002790:	fe010113          	addi	sp,sp,-32
    80002794:	00113c23          	sd	ra,24(sp)
    80002798:	00813823          	sd	s0,16(sp)
    8000279c:	00913423          	sd	s1,8(sp)
    800027a0:	02010413          	addi	s0,sp,32
    800027a4:	00050493          	mv	s1,a0
    800027a8:	0000a797          	auipc	a5,0xa
    800027ac:	1d078793          	addi	a5,a5,464 # 8000c978 <_ZTV6Thread+0x10>
    800027b0:	00f53023          	sd	a5,0(a0)
    thread_join(this->myHandle);
    800027b4:	00853503          	ld	a0,8(a0)
    800027b8:	fffff097          	auipc	ra,0xfffff
    800027bc:	c9c080e7          	jalr	-868(ra) # 80001454 <_Z11thread_joinP3TCB>
    delete myHandle;
    800027c0:	0084b483          	ld	s1,8(s1)
    800027c4:	02048863          	beqz	s1,800027f4 <_ZN6ThreadD1Ev+0x64>
        return front == nullptr;
    800027c8:	0484b503          	ld	a0,72(s1)
        while (!isEmpty()) {
    800027cc:	00050e63          	beqz	a0,800027e8 <_ZN6ThreadD1Ev+0x58>
            front = front->next;
    800027d0:	00853783          	ld	a5,8(a0)
    800027d4:	04f4b423          	sd	a5,72(s1)
            delete node;
    800027d8:	fe0508e3          	beqz	a0,800027c8 <_ZN6ThreadD1Ev+0x38>
            mem_free(ptr);
    800027dc:	fffff097          	auipc	ra,0xfffff
    800027e0:	b6c080e7          	jalr	-1172(ra) # 80001348 <_Z8mem_freePv>
        }
    800027e4:	fe5ff06f          	j	800027c8 <_ZN6ThreadD1Ev+0x38>
    800027e8:	00048513          	mv	a0,s1
    800027ec:	00000097          	auipc	ra,0x0
    800027f0:	7ec080e7          	jalr	2028(ra) # 80002fd8 <_ZN3TCBdlEPv>
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
    80002808:	fe010113          	addi	sp,sp,-32
    8000280c:	00113c23          	sd	ra,24(sp)
    80002810:	00813823          	sd	s0,16(sp)
    80002814:	00913423          	sd	s1,8(sp)
    80002818:	02010413          	addi	s0,sp,32
    8000281c:	00050493          	mv	s1,a0
    80002820:	0000a797          	auipc	a5,0xa
    80002824:	18078793          	addi	a5,a5,384 # 8000c9a0 <_ZTV9Semaphore+0x10>
    80002828:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    8000282c:	00853503          	ld	a0,8(a0)
    80002830:	fffff097          	auipc	ra,0xfffff
    80002834:	cb4080e7          	jalr	-844(ra) # 800014e4 <_Z9sem_closeP4KSem>
    delete myHandle;
    80002838:	0084b483          	ld	s1,8(s1)
    8000283c:	02048863          	beqz	s1,8000286c <_ZN9SemaphoreD1Ev+0x64>
        return front == nullptr;
    80002840:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002844:	00050e63          	beqz	a0,80002860 <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    80002848:	00853783          	ld	a5,8(a0)
    8000284c:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002850:	fe0508e3          	beqz	a0,80002840 <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    80002854:	fffff097          	auipc	ra,0xfffff
    80002858:	af4080e7          	jalr	-1292(ra) # 80001348 <_Z8mem_freePv>
        }
    8000285c:	fe5ff06f          	j	80002840 <_ZN9SemaphoreD1Ev+0x38>
    80002860:	00048513          	mv	a0,s1
    80002864:	00001097          	auipc	ra,0x1
    80002868:	88c080e7          	jalr	-1908(ra) # 800030f0 <_ZN4KSemdlEPv>
}
    8000286c:	01813083          	ld	ra,24(sp)
    80002870:	01013403          	ld	s0,16(sp)
    80002874:	00813483          	ld	s1,8(sp)
    80002878:	02010113          	addi	sp,sp,32
    8000287c:	00008067          	ret

0000000080002880 <_Znwm>:
void* operator new(size_t size) {
    80002880:	ff010113          	addi	sp,sp,-16
    80002884:	00113423          	sd	ra,8(sp)
    80002888:	00813023          	sd	s0,0(sp)
    8000288c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002890:	fffff097          	auipc	ra,0xfffff
    80002894:	a78080e7          	jalr	-1416(ra) # 80001308 <_Z9mem_allocm>
}
    80002898:	00813083          	ld	ra,8(sp)
    8000289c:	00013403          	ld	s0,0(sp)
    800028a0:	01010113          	addi	sp,sp,16
    800028a4:	00008067          	ret

00000000800028a8 <_Znam>:
void* operator new[](size_t size) {
    800028a8:	ff010113          	addi	sp,sp,-16
    800028ac:	00113423          	sd	ra,8(sp)
    800028b0:	00813023          	sd	s0,0(sp)
    800028b4:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800028b8:	fffff097          	auipc	ra,0xfffff
    800028bc:	a50080e7          	jalr	-1456(ra) # 80001308 <_Z9mem_allocm>
}
    800028c0:	00813083          	ld	ra,8(sp)
    800028c4:	00013403          	ld	s0,0(sp)
    800028c8:	01010113          	addi	sp,sp,16
    800028cc:	00008067          	ret

00000000800028d0 <_ZdlPv>:
noexcept {
    800028d0:	ff010113          	addi	sp,sp,-16
    800028d4:	00113423          	sd	ra,8(sp)
    800028d8:	00813023          	sd	s0,0(sp)
    800028dc:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800028e0:	fffff097          	auipc	ra,0xfffff
    800028e4:	a68080e7          	jalr	-1432(ra) # 80001348 <_Z8mem_freePv>
}
    800028e8:	00813083          	ld	ra,8(sp)
    800028ec:	00013403          	ld	s0,0(sp)
    800028f0:	01010113          	addi	sp,sp,16
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
    80002914:	e80080e7          	jalr	-384(ra) # 80002790 <_ZN6ThreadD1Ev>
    80002918:	00048513          	mv	a0,s1
    8000291c:	00000097          	auipc	ra,0x0
    80002920:	fb4080e7          	jalr	-76(ra) # 800028d0 <_ZdlPv>
    80002924:	01813083          	ld	ra,24(sp)
    80002928:	01013403          	ld	s0,16(sp)
    8000292c:	00813483          	ld	s1,8(sp)
    80002930:	02010113          	addi	sp,sp,32
    80002934:	00008067          	ret

0000000080002938 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002938:	fe010113          	addi	sp,sp,-32
    8000293c:	00113c23          	sd	ra,24(sp)
    80002940:	00813823          	sd	s0,16(sp)
    80002944:	00913423          	sd	s1,8(sp)
    80002948:	02010413          	addi	s0,sp,32
    8000294c:	00050493          	mv	s1,a0
}
    80002950:	00000097          	auipc	ra,0x0
    80002954:	eb8080e7          	jalr	-328(ra) # 80002808 <_ZN9SemaphoreD1Ev>
    80002958:	00048513          	mv	a0,s1
    8000295c:	00000097          	auipc	ra,0x0
    80002960:	f74080e7          	jalr	-140(ra) # 800028d0 <_ZdlPv>
    80002964:	01813083          	ld	ra,24(sp)
    80002968:	01013403          	ld	s0,16(sp)
    8000296c:	00813483          	ld	s1,8(sp)
    80002970:	02010113          	addi	sp,sp,32
    80002974:	00008067          	ret

0000000080002978 <_ZdaPv>:
noexcept {
    80002978:	ff010113          	addi	sp,sp,-16
    8000297c:	00113423          	sd	ra,8(sp)
    80002980:	00813023          	sd	s0,0(sp)
    80002984:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002988:	fffff097          	auipc	ra,0xfffff
    8000298c:	9c0080e7          	jalr	-1600(ra) # 80001348 <_Z8mem_freePv>
}
    80002990:	00813083          	ld	ra,8(sp)
    80002994:	00013403          	ld	s0,0(sp)
    80002998:	01010113          	addi	sp,sp,16
    8000299c:	00008067          	ret

00000000800029a0 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    800029a0:	fd010113          	addi	sp,sp,-48
    800029a4:	02113423          	sd	ra,40(sp)
    800029a8:	02813023          	sd	s0,32(sp)
    800029ac:	00913c23          	sd	s1,24(sp)
    800029b0:	01213823          	sd	s2,16(sp)
    800029b4:	01313423          	sd	s3,8(sp)
    800029b8:	03010413          	addi	s0,sp,48
    800029bc:	00050493          	mv	s1,a0
    800029c0:	00058913          	mv	s2,a1
    800029c4:	00060993          	mv	s3,a2
    800029c8:	0000a797          	auipc	a5,0xa
    800029cc:	fb078793          	addi	a5,a5,-80 # 8000c978 <_ZTV6Thread+0x10>
    800029d0:	00f53023          	sd	a5,0(a0)
    this->body = body;
    800029d4:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    800029d8:	00c53c23          	sd	a2,24(a0)
    if (body != (TCB::Body)main) {
    800029dc:	0000a797          	auipc	a5,0xa
    800029e0:	2347b783          	ld	a5,564(a5) # 8000cc10 <_GLOBAL_OFFSET_TABLE_+0x58>
    800029e4:	04f58663          	beq	a1,a5,80002a30 <_ZN6ThreadC1EPFvPvES0_+0x90>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800029e8:	00001537          	lui	a0,0x1
    800029ec:	fffff097          	auipc	ra,0xfffff
    800029f0:	91c080e7          	jalr	-1764(ra) # 80001308 <_Z9mem_allocm>
    800029f4:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800029f8:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800029fc:	00098693          	mv	a3,s3
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a00:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a04:	00848493          	addi	s1,s1,8
    80002a08:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002a0c:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002a10:	00000073          	ecall
}
    80002a14:	02813083          	ld	ra,40(sp)
    80002a18:	02013403          	ld	s0,32(sp)
    80002a1c:	01813483          	ld	s1,24(sp)
    80002a20:	01013903          	ld	s2,16(sp)
    80002a24:	00813983          	ld	s3,8(sp)
    80002a28:	03010113          	addi	sp,sp,48
    80002a2c:	00008067          	ret
    uint64* stack = nullptr;
    80002a30:	00000313          	li	t1,0
    80002a34:	fc5ff06f          	j	800029f8 <_ZN6ThreadC1EPFvPvES0_+0x58>

0000000080002a38 <_ZN6Thread5startEv>:
int Thread::start() {
    80002a38:	ff010113          	addi	sp,sp,-16
    80002a3c:	00813423          	sd	s0,8(sp)
    80002a40:	01010413          	addi	s0,sp,16
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    80002a44:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002a48:	02030463          	beqz	t1,80002a70 <_ZN6Thread5startEv+0x38>
    ThreadStatus getStatus() { return this->status; }
    80002a4c:	05832783          	lw	a5,88(t1)
    80002a50:	02079463          	bnez	a5,80002a78 <_ZN6Thread5startEv+0x40>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a54:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    80002a58:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    80002a5c:	00000073          	ecall
    return 0;
    80002a60:	00000513          	li	a0,0
}
    80002a64:	00813403          	ld	s0,8(sp)
    80002a68:	01010113          	addi	sp,sp,16
    80002a6c:	00008067          	ret
    if (myHandle == nullptr || myHandle->getStatus() != TCB::CREATED) return -1;
    80002a70:	fff00513          	li	a0,-1
    80002a74:	ff1ff06f          	j	80002a64 <_ZN6Thread5startEv+0x2c>
    80002a78:	fff00513          	li	a0,-1
    80002a7c:	fe9ff06f          	j	80002a64 <_ZN6Thread5startEv+0x2c>

0000000080002a80 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002a80:	ff010113          	addi	sp,sp,-16
    80002a84:	00113423          	sd	ra,8(sp)
    80002a88:	00813023          	sd	s0,0(sp)
    80002a8c:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80002a90:	00853503          	ld	a0,8(a0)
    80002a94:	fffff097          	auipc	ra,0xfffff
    80002a98:	9c0080e7          	jalr	-1600(ra) # 80001454 <_Z11thread_joinP3TCB>
}
    80002a9c:	00813083          	ld	ra,8(sp)
    80002aa0:	00013403          	ld	s0,0(sp)
    80002aa4:	01010113          	addi	sp,sp,16
    80002aa8:	00008067          	ret

0000000080002aac <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002aac:	ff010113          	addi	sp,sp,-16
    80002ab0:	00113423          	sd	ra,8(sp)
    80002ab4:	00813023          	sd	s0,0(sp)
    80002ab8:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002abc:	fffff097          	auipc	ra,0xfffff
    80002ac0:	978080e7          	jalr	-1672(ra) # 80001434 <_Z15thread_dispatchv>
}
    80002ac4:	00813083          	ld	ra,8(sp)
    80002ac8:	00013403          	ld	s0,0(sp)
    80002acc:	01010113          	addi	sp,sp,16
    80002ad0:	00008067          	ret

0000000080002ad4 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80002ad4:	ff010113          	addi	sp,sp,-16
    80002ad8:	00113423          	sd	ra,8(sp)
    80002adc:	00813023          	sd	s0,0(sp)
    80002ae0:	01010413          	addi	s0,sp,16
    time_sleep(t);
    80002ae4:	fffff097          	auipc	ra,0xfffff
    80002ae8:	998080e7          	jalr	-1640(ra) # 8000147c <_Z10time_sleepm>
}
    80002aec:	00000513          	li	a0,0
    80002af0:	00813083          	ld	ra,8(sp)
    80002af4:	00013403          	ld	s0,0(sp)
    80002af8:	01010113          	addi	sp,sp,16
    80002afc:	00008067          	ret

0000000080002b00 <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    80002b00:	fe010113          	addi	sp,sp,-32
    80002b04:	00113c23          	sd	ra,24(sp)
    80002b08:	00813823          	sd	s0,16(sp)
    80002b0c:	00913423          	sd	s1,8(sp)
    80002b10:	02010413          	addi	s0,sp,32
    80002b14:	00050493          	mv	s1,a0
    while (period != -1UL) {
    80002b18:	0204b703          	ld	a4,32(s1)
    80002b1c:	fff00793          	li	a5,-1
    80002b20:	02f70663          	beq	a4,a5,80002b4c <_ZN14PeriodicThread3runEv+0x4c>
        periodicActivation();
    80002b24:	0004b783          	ld	a5,0(s1)
    80002b28:	0187b783          	ld	a5,24(a5)
    80002b2c:	00048513          	mv	a0,s1
    80002b30:	000780e7          	jalr	a5
        if (period == -1UL) break;
    80002b34:	0204b503          	ld	a0,32(s1)
    80002b38:	fff00793          	li	a5,-1
    80002b3c:	00f50863          	beq	a0,a5,80002b4c <_ZN14PeriodicThread3runEv+0x4c>
        sleep(period);
    80002b40:	00000097          	auipc	ra,0x0
    80002b44:	f94080e7          	jalr	-108(ra) # 80002ad4 <_ZN6Thread5sleepEm>
    while (period != -1UL) {
    80002b48:	fd1ff06f          	j	80002b18 <_ZN14PeriodicThread3runEv+0x18>
    }
    thread_exit();
    80002b4c:	fffff097          	auipc	ra,0xfffff
    80002b50:	8c0080e7          	jalr	-1856(ra) # 8000140c <_Z11thread_exitv>
}
    80002b54:	01813083          	ld	ra,24(sp)
    80002b58:	01013403          	ld	s0,16(sp)
    80002b5c:	00813483          	ld	s1,8(sp)
    80002b60:	02010113          	addi	sp,sp,32
    80002b64:	00008067          	ret

0000000080002b68 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002b68:	fe010113          	addi	sp,sp,-32
    80002b6c:	00113c23          	sd	ra,24(sp)
    80002b70:	00813823          	sd	s0,16(sp)
    80002b74:	00913423          	sd	s1,8(sp)
    80002b78:	02010413          	addi	s0,sp,32
    80002b7c:	00050493          	mv	s1,a0
    80002b80:	0000a797          	auipc	a5,0xa
    80002b84:	df878793          	addi	a5,a5,-520 # 8000c978 <_ZTV6Thread+0x10>
    80002b88:	00f53023          	sd	a5,0(a0)
    this->body = wrapper;
    80002b8c:	00000797          	auipc	a5,0x0
    80002b90:	bd078793          	addi	a5,a5,-1072 # 8000275c <_ZN6Thread7wrapperEPv>
    80002b94:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80002b98:	00a53c23          	sd	a0,24(a0)
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002b9c:	00001537          	lui	a0,0x1
    80002ba0:	ffffe097          	auipc	ra,0xffffe
    80002ba4:	768080e7          	jalr	1896(ra) # 80001308 <_Z9mem_allocm>
    80002ba8:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002bac:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002bb0:	0184b303          	ld	t1,24(s1)
    80002bb4:	00030693          	mv	a3,t1
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002bb8:	0104b303          	ld	t1,16(s1)
    80002bbc:	00030613          	mv	a2,t1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002bc0:	00848493          	addi	s1,s1,8
    80002bc4:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002bc8:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002bcc:	00000073          	ecall
}
    80002bd0:	01813083          	ld	ra,24(sp)
    80002bd4:	01013403          	ld	s0,16(sp)
    80002bd8:	00813483          	ld	s1,8(sp)
    80002bdc:	02010113          	addi	sp,sp,32
    80002be0:	00008067          	ret

0000000080002be4 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002be4:	ff010113          	addi	sp,sp,-16
    80002be8:	00113423          	sd	ra,8(sp)
    80002bec:	00813023          	sd	s0,0(sp)
    80002bf0:	01010413          	addi	s0,sp,16
    80002bf4:	0000a797          	auipc	a5,0xa
    80002bf8:	dac78793          	addi	a5,a5,-596 # 8000c9a0 <_ZTV9Semaphore+0x10>
    80002bfc:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle, init);
    80002c00:	00850513          	addi	a0,a0,8
    80002c04:	fffff097          	auipc	ra,0xfffff
    80002c08:	8a8080e7          	jalr	-1880(ra) # 800014ac <_Z8sem_openPP4KSemj>
}
    80002c0c:	00813083          	ld	ra,8(sp)
    80002c10:	00013403          	ld	s0,0(sp)
    80002c14:	01010113          	addi	sp,sp,16
    80002c18:	00008067          	ret

0000000080002c1c <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002c1c:	ff010113          	addi	sp,sp,-16
    80002c20:	00113423          	sd	ra,8(sp)
    80002c24:	00813023          	sd	s0,0(sp)
    80002c28:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002c2c:	00853503          	ld	a0,8(a0)
    80002c30:	fffff097          	auipc	ra,0xfffff
    80002c34:	8e4080e7          	jalr	-1820(ra) # 80001514 <_Z8sem_waitP4KSem>
}
    80002c38:	00813083          	ld	ra,8(sp)
    80002c3c:	00013403          	ld	s0,0(sp)
    80002c40:	01010113          	addi	sp,sp,16
    80002c44:	00008067          	ret

0000000080002c48 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002c48:	ff010113          	addi	sp,sp,-16
    80002c4c:	00113423          	sd	ra,8(sp)
    80002c50:	00813023          	sd	s0,0(sp)
    80002c54:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80002c58:	00853503          	ld	a0,8(a0)
    80002c5c:	fffff097          	auipc	ra,0xfffff
    80002c60:	8e8080e7          	jalr	-1816(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    80002c64:	00813083          	ld	ra,8(sp)
    80002c68:	00013403          	ld	s0,0(sp)
    80002c6c:	01010113          	addi	sp,sp,16
    80002c70:	00008067          	ret

0000000080002c74 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002c74:	ff010113          	addi	sp,sp,-16
    80002c78:	00813423          	sd	s0,8(sp)
    80002c7c:	01010413          	addi	s0,sp,16
    this->period = -1;
    80002c80:	fff00793          	li	a5,-1
    80002c84:	02f53023          	sd	a5,32(a0)
}
    80002c88:	00813403          	ld	s0,8(sp)
    80002c8c:	01010113          	addi	sp,sp,16
    80002c90:	00008067          	ret

0000000080002c94 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    80002c94:	fe010113          	addi	sp,sp,-32
    80002c98:	00113c23          	sd	ra,24(sp)
    80002c9c:	00813823          	sd	s0,16(sp)
    80002ca0:	00913423          	sd	s1,8(sp)
    80002ca4:	01213023          	sd	s2,0(sp)
    80002ca8:	02010413          	addi	s0,sp,32
    80002cac:	00050493          	mv	s1,a0
    80002cb0:	00058913          	mv	s2,a1
    80002cb4:	00000097          	auipc	ra,0x0
    80002cb8:	eb4080e7          	jalr	-332(ra) # 80002b68 <_ZN6ThreadC1Ev>
    80002cbc:	0000a797          	auipc	a5,0xa
    80002cc0:	d0478793          	addi	a5,a5,-764 # 8000c9c0 <_ZTV14PeriodicThread+0x10>
    80002cc4:	00f4b023          	sd	a5,0(s1)
    80002cc8:	0324b023          	sd	s2,32(s1)
}
    80002ccc:	01813083          	ld	ra,24(sp)
    80002cd0:	01013403          	ld	s0,16(sp)
    80002cd4:	00813483          	ld	s1,8(sp)
    80002cd8:	00013903          	ld	s2,0(sp)
    80002cdc:	02010113          	addi	sp,sp,32
    80002ce0:	00008067          	ret

0000000080002ce4 <_ZN7Console4getcEv>:

char Console::getc() {
    80002ce4:	ff010113          	addi	sp,sp,-16
    80002ce8:	00113423          	sd	ra,8(sp)
    80002cec:	00813023          	sd	s0,0(sp)
    80002cf0:	01010413          	addi	s0,sp,16
    return ::getc();
    80002cf4:	fffff097          	auipc	ra,0xfffff
    80002cf8:	880080e7          	jalr	-1920(ra) # 80001574 <_Z4getcv>
}
    80002cfc:	00813083          	ld	ra,8(sp)
    80002d00:	00013403          	ld	s0,0(sp)
    80002d04:	01010113          	addi	sp,sp,16
    80002d08:	00008067          	ret

0000000080002d0c <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002d0c:	ff010113          	addi	sp,sp,-16
    80002d10:	00113423          	sd	ra,8(sp)
    80002d14:	00813023          	sd	s0,0(sp)
    80002d18:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002d1c:	fffff097          	auipc	ra,0xfffff
    80002d20:	880080e7          	jalr	-1920(ra) # 8000159c <_Z4putcc>
}
    80002d24:	00813083          	ld	ra,8(sp)
    80002d28:	00013403          	ld	s0,0(sp)
    80002d2c:	01010113          	addi	sp,sp,16
    80002d30:	00008067          	ret

0000000080002d34 <_ZN6Thread3runEv>:
protected:
    //konstruktor koji pravi nit koja izvrsava run metodu, ne stavlja je u Scheduler
    Thread();

    //funkcija koju nit izvrsava, samo ako je nit napravljena podrazumevanim konstruktorom
    virtual void run() {}
    80002d34:	ff010113          	addi	sp,sp,-16
    80002d38:	00813423          	sd	s0,8(sp)
    80002d3c:	01010413          	addi	s0,sp,16
    80002d40:	00813403          	ld	s0,8(sp)
    80002d44:	01010113          	addi	sp,sp,16
    80002d48:	00008067          	ret

0000000080002d4c <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    80002d4c:	ff010113          	addi	sp,sp,-16
    80002d50:	00813423          	sd	s0,8(sp)
    80002d54:	01010413          	addi	s0,sp,16
    80002d58:	00813403          	ld	s0,8(sp)
    80002d5c:	01010113          	addi	sp,sp,16
    80002d60:	00008067          	ret

0000000080002d64 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002d64:	ff010113          	addi	sp,sp,-16
    80002d68:	00113423          	sd	ra,8(sp)
    80002d6c:	00813023          	sd	s0,0(sp)
    80002d70:	01010413          	addi	s0,sp,16
    80002d74:	0000a797          	auipc	a5,0xa
    80002d78:	c4c78793          	addi	a5,a5,-948 # 8000c9c0 <_ZTV14PeriodicThread+0x10>
    80002d7c:	00f53023          	sd	a5,0(a0)
    80002d80:	00000097          	auipc	ra,0x0
    80002d84:	a10080e7          	jalr	-1520(ra) # 80002790 <_ZN6ThreadD1Ev>
    80002d88:	00813083          	ld	ra,8(sp)
    80002d8c:	00013403          	ld	s0,0(sp)
    80002d90:	01010113          	addi	sp,sp,16
    80002d94:	00008067          	ret

0000000080002d98 <_ZN14PeriodicThreadD0Ev>:
    80002d98:	fe010113          	addi	sp,sp,-32
    80002d9c:	00113c23          	sd	ra,24(sp)
    80002da0:	00813823          	sd	s0,16(sp)
    80002da4:	00913423          	sd	s1,8(sp)
    80002da8:	02010413          	addi	s0,sp,32
    80002dac:	00050493          	mv	s1,a0
    80002db0:	0000a797          	auipc	a5,0xa
    80002db4:	c1078793          	addi	a5,a5,-1008 # 8000c9c0 <_ZTV14PeriodicThread+0x10>
    80002db8:	00f53023          	sd	a5,0(a0)
    80002dbc:	00000097          	auipc	ra,0x0
    80002dc0:	9d4080e7          	jalr	-1580(ra) # 80002790 <_ZN6ThreadD1Ev>
    80002dc4:	00048513          	mv	a0,s1
    80002dc8:	00000097          	auipc	ra,0x0
    80002dcc:	b08080e7          	jalr	-1272(ra) # 800028d0 <_ZdlPv>
    80002dd0:	01813083          	ld	ra,24(sp)
    80002dd4:	01013403          	ld	s0,16(sp)
    80002dd8:	00813483          	ld	s1,8(sp)
    80002ddc:	02010113          	addi	sp,sp,32
    80002de0:	00008067          	ret

0000000080002de4 <_ZN3TCB7wrapperEv>:
    }

    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
}

void TCB::wrapper() {
    80002de4:	ff010113          	addi	sp,sp,-16
    80002de8:	00113423          	sd	ra,8(sp)
    80002dec:	00813023          	sd	s0,0(sp)
    80002df0:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch)
    Riscv::returnFromInterrupt();
    80002df4:	00000097          	auipc	ra,0x0
    80002df8:	2b4080e7          	jalr	692(ra) # 800030a8 <_ZN5Riscv19returnFromInterruptEv>
    //na dalje se izvrsavamo u user modu (osim za kernel funkcije)
    running->threadFunction(running->args);
    80002dfc:	0000a797          	auipc	a5,0xa
    80002e00:	f947b783          	ld	a5,-108(a5) # 8000cd90 <_ZN3TCB7runningE>
    80002e04:	0107b703          	ld	a4,16(a5)
    80002e08:	0207b503          	ld	a0,32(a5)
    80002e0c:	000700e7          	jalr	a4
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    80002e10:	ffffe097          	auipc	ra,0xffffe
    80002e14:	5fc080e7          	jalr	1532(ra) # 8000140c <_Z11thread_exitv>
}
    80002e18:	00813083          	ld	ra,8(sp)
    80002e1c:	00013403          	ld	s0,0(sp)
    80002e20:	01010113          	addi	sp,sp,16
    80002e24:	00008067          	ret

0000000080002e28 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002e28:	fe010113          	addi	sp,sp,-32
    80002e2c:	00113c23          	sd	ra,24(sp)
    80002e30:	00813823          	sd	s0,16(sp)
    80002e34:	00913423          	sd	s1,8(sp)
    80002e38:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    80002e3c:	0000a497          	auipc	s1,0xa
    80002e40:	f544b483          	ld	s1,-172(s1) # 8000cd90 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    80002e44:	0584a783          	lw	a5,88(s1)
    80002e48:	00100713          	li	a4,1
    80002e4c:	04e78e63          	beq	a5,a4,80002ea8 <_ZN3TCB8dispatchEv+0x80>
    } else if (old->status == FINISHED) {
    80002e50:	00500713          	li	a4,5
    80002e54:	06e78263          	beq	a5,a4,80002eb8 <_ZN3TCB8dispatchEv+0x90>
    TCB::running = Scheduler::get();
    80002e58:	fffff097          	auipc	ra,0xfffff
    80002e5c:	ac4080e7          	jalr	-1340(ra) # 8000191c <_ZN9Scheduler3getEv>
    80002e60:	00050593          	mv	a1,a0
    80002e64:	0000a797          	auipc	a5,0xa
    80002e68:	f2c78793          	addi	a5,a5,-212 # 8000cd90 <_ZN3TCB7runningE>
    80002e6c:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80002e70:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == (TCB::Body)main || TCB::running->threadFunction == kernelConsumerFunction ||
    80002e74:	01053783          	ld	a5,16(a0)
    80002e78:	0000a717          	auipc	a4,0xa
    80002e7c:	d9873703          	ld	a4,-616(a4) # 8000cc10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002e80:	04e78863          	beq	a5,a4,80002ed0 <_ZN3TCB8dispatchEv+0xa8>
    80002e84:	0000a717          	auipc	a4,0xa
    80002e88:	d6c73703          	ld	a4,-660(a4) # 8000cbf0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002e8c:	04e78263          	beq	a5,a4,80002ed0 <_ZN3TCB8dispatchEv+0xa8>
    80002e90:	0000a717          	auipc	a4,0xa
    80002e94:	da873703          	ld	a4,-600(a4) # 8000cc38 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002e98:	02e78c63          	beq	a5,a4,80002ed0 <_ZN3TCB8dispatchEv+0xa8>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002e9c:	10000793          	li	a5,256
    80002ea0:	1007b073          	csrc	sstatus,a5
}
    80002ea4:	0340006f          	j	80002ed8 <_ZN3TCB8dispatchEv+0xb0>
        Scheduler::put(old);
    80002ea8:	00048513          	mv	a0,s1
    80002eac:	fffff097          	auipc	ra,0xfffff
    80002eb0:	a24080e7          	jalr	-1500(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
    80002eb4:	fa5ff06f          	j	80002e58 <_ZN3TCB8dispatchEv+0x30>
        delete old->stack;
    80002eb8:	0184b503          	ld	a0,24(s1)
    80002ebc:	00050663          	beqz	a0,80002ec8 <_ZN3TCB8dispatchEv+0xa0>
    80002ec0:	00000097          	auipc	ra,0x0
    80002ec4:	a10080e7          	jalr	-1520(ra) # 800028d0 <_ZdlPv>
        old->stack = nullptr;
    80002ec8:	0004bc23          	sd	zero,24(s1)
    80002ecc:	f8dff06f          	j	80002e58 <_ZN3TCB8dispatchEv+0x30>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002ed0:	10000793          	li	a5,256
    80002ed4:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002ed8:	00b48863          	beq	s1,a1,80002ee8 <_ZN3TCB8dispatchEv+0xc0>
    80002edc:	00048513          	mv	a0,s1
    80002ee0:	ffffe097          	auipc	ra,0xffffe
    80002ee4:	230080e7          	jalr	560(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002ee8:	01813083          	ld	ra,24(sp)
    80002eec:	01013403          	ld	s0,16(sp)
    80002ef0:	00813483          	ld	s1,8(sp)
    80002ef4:	02010113          	addi	sp,sp,32
    80002ef8:	00008067          	ret

0000000080002efc <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002efc:	ff010113          	addi	sp,sp,-16
    80002f00:	00113423          	sd	ra,8(sp)
    80002f04:	00813023          	sd	s0,0(sp)
    80002f08:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002f0c:	ffffe097          	auipc	ra,0xffffe
    80002f10:	3fc080e7          	jalr	1020(ra) # 80001308 <_Z9mem_allocm>
}
    80002f14:	00813083          	ld	ra,8(sp)
    80002f18:	00013403          	ld	s0,0(sp)
    80002f1c:	01010113          	addi	sp,sp,16
    80002f20:	00008067          	ret

0000000080002f24 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002f24:	fd010113          	addi	sp,sp,-48
    80002f28:	02113423          	sd	ra,40(sp)
    80002f2c:	02813023          	sd	s0,32(sp)
    80002f30:	00913c23          	sd	s1,24(sp)
    80002f34:	01213823          	sd	s2,16(sp)
    80002f38:	01313423          	sd	s3,8(sp)
    80002f3c:	03010413          	addi	s0,sp,48
    80002f40:	00050913          	mv	s2,a0
    80002f44:	00058993          	mv	s3,a1
    80002f48:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    80002f4c:	06000513          	li	a0,96
    80002f50:	00000097          	auipc	ra,0x0
    80002f54:	fac080e7          	jalr	-84(ra) # 80002efc <_ZN3TCBnwEm>

private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED) {
    80002f58:	01253823          	sd	s2,16(a0)
    80002f5c:	00953c23          	sd	s1,24(a0)
    80002f60:	03353023          	sd	s3,32(a0)
    80002f64:	00200793          	li	a5,2
    80002f68:	02f53423          	sd	a5,40(a0)
    80002f6c:	02053823          	sd	zero,48(a0)
    80002f70:	02053c23          	sd	zero,56(a0)
    80002f74:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80002f78:	04053423          	sd	zero,72(a0)
    80002f7c:	04053823          	sd	zero,80(a0)
    80002f80:	04052c23          	sw	zero,88(a0)
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80002f84:	0000a797          	auipc	a5,0xa
    80002f88:	c8c7b783          	ld	a5,-884(a5) # 8000cc10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002f8c:	02f90e63          	beq	s2,a5,80002fc8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002f90:	00000797          	auipc	a5,0x0
    80002f94:	e5478793          	addi	a5,a5,-428 # 80002de4 <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002f98:	02048c63          	beqz	s1,80002fd0 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xac>
    80002f9c:	00001637          	lui	a2,0x1
    80002fa0:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    80002fa4:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    80002fa8:	00953423          	sd	s1,8(a0)
}
    80002fac:	02813083          	ld	ra,40(sp)
    80002fb0:	02013403          	ld	s0,32(sp)
    80002fb4:	01813483          	ld	s1,24(sp)
    80002fb8:	01013903          	ld	s2,16(sp)
    80002fbc:	00813983          	ld	s3,8(sp)
    80002fc0:	03010113          	addi	sp,sp,48
    80002fc4:	00008067          	ret
        uint64 startRa = threadFunction != (TCB::Body)main ? (uint64)&wrapper : 0;
    80002fc8:	00000793          	li	a5,0
    80002fcc:	fcdff06f          	j	80002f98 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002fd0:	00000493          	li	s1,0
    80002fd4:	fd1ff06f          	j	80002fa4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x80>

0000000080002fd8 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002fd8:	ff010113          	addi	sp,sp,-16
    80002fdc:	00113423          	sd	ra,8(sp)
    80002fe0:	00813023          	sd	s0,0(sp)
    80002fe4:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002fe8:	ffffe097          	auipc	ra,0xffffe
    80002fec:	360080e7          	jalr	864(ra) # 80001348 <_Z8mem_freePv>
}
    80002ff0:	00813083          	ld	ra,8(sp)
    80002ff4:	00013403          	ld	s0,0(sp)
    80002ff8:	01010113          	addi	sp,sp,16
    80002ffc:	00008067          	ret

0000000080003000 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED || TCB::running == handle) return;
    80003000:	05852703          	lw	a4,88(a0)
    80003004:	00500793          	li	a5,5
    80003008:	04f70263          	beq	a4,a5,8000304c <_ZN3TCB10threadJoinEPS_+0x4c>
    8000300c:	0000a597          	auipc	a1,0xa
    80003010:	d845b583          	ld	a1,-636(a1) # 8000cd90 <_ZN3TCB7runningE>
    80003014:	02a58c63          	beq	a1,a0,8000304c <_ZN3TCB10threadJoinEPS_+0x4c>
void TCB::threadJoin(TCB* handle) {
    80003018:	ff010113          	addi	sp,sp,-16
    8000301c:	00113423          	sd	ra,8(sp)
    80003020:	00813023          	sd	s0,0(sp)
    80003024:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    80003028:	00300793          	li	a5,3
    8000302c:	04f5ac23          	sw	a5,88(a1)
    handle->waitingToJoin.putLast(TCB::running);
    80003030:	04850513          	addi	a0,a0,72
    80003034:	ffffe097          	auipc	ra,0xffffe
    80003038:	208080e7          	jalr	520(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
}
    8000303c:	00813083          	ld	ra,8(sp)
    80003040:	00013403          	ld	s0,0(sp)
    80003044:	01010113          	addi	sp,sp,16
    80003048:	00008067          	ret
    8000304c:	00008067          	ret

0000000080003050 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80003050:	0000a517          	auipc	a0,0xa
    80003054:	d4053503          	ld	a0,-704(a0) # 8000cd90 <_ZN3TCB7runningE>
        return front == nullptr;
    80003058:	04853783          	ld	a5,72(a0)
    8000305c:	04078463          	beqz	a5,800030a4 <_ZN3TCB13releaseJoinedEv+0x54>
void TCB::releaseJoined() {
    80003060:	ff010113          	addi	sp,sp,-16
    80003064:	00113423          	sd	ra,8(sp)
    80003068:	00813023          	sd	s0,0(sp)
    8000306c:	01010413          	addi	s0,sp,16
        TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80003070:	04850513          	addi	a0,a0,72
    80003074:	ffffe097          	auipc	ra,0xffffe
    80003078:	234080e7          	jalr	564(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
        Scheduler::put(tcb);
    8000307c:	fffff097          	auipc	ra,0xfffff
    80003080:	854080e7          	jalr	-1964(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80003084:	0000a517          	auipc	a0,0xa
    80003088:	d0c53503          	ld	a0,-756(a0) # 8000cd90 <_ZN3TCB7runningE>
    8000308c:	04853783          	ld	a5,72(a0)
    80003090:	fe0790e3          	bnez	a5,80003070 <_ZN3TCB13releaseJoinedEv+0x20>
    }
}
    80003094:	00813083          	ld	ra,8(sp)
    80003098:	00013403          	ld	s0,0(sp)
    8000309c:	01010113          	addi	sp,sp,16
    800030a0:	00008067          	ret
    800030a4:	00008067          	ret

00000000800030a8 <_ZN5Riscv19returnFromInterruptEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::returnFromInterrupt() {
    800030a8:	ff010113          	addi	sp,sp,-16
    800030ac:	00813423          	sd	s0,8(sp)
    800030b0:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    800030b4:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    800030b8:	10200073          	sret
    800030bc:	00813403          	ld	s0,8(sp)
    800030c0:	01010113          	addi	sp,sp,16
    800030c4:	00008067          	ret

00000000800030c8 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    800030c8:	ff010113          	addi	sp,sp,-16
    800030cc:	00113423          	sd	ra,8(sp)
    800030d0:	00813023          	sd	s0,0(sp)
    800030d4:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800030d8:	ffffe097          	auipc	ra,0xffffe
    800030dc:	230080e7          	jalr	560(ra) # 80001308 <_Z9mem_allocm>
}
    800030e0:	00813083          	ld	ra,8(sp)
    800030e4:	00013403          	ld	s0,0(sp)
    800030e8:	01010113          	addi	sp,sp,16
    800030ec:	00008067          	ret

00000000800030f0 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    800030f0:	ff010113          	addi	sp,sp,-16
    800030f4:	00113423          	sd	ra,8(sp)
    800030f8:	00813023          	sd	s0,0(sp)
    800030fc:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80003100:	ffffe097          	auipc	ra,0xffffe
    80003104:	248080e7          	jalr	584(ra) # 80001348 <_Z8mem_freePv>
}
    80003108:	00813083          	ld	ra,8(sp)
    8000310c:	00013403          	ld	s0,0(sp)
    80003110:	01010113          	addi	sp,sp,16
    80003114:	00008067          	ret

0000000080003118 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003118:	fe010113          	addi	sp,sp,-32
    8000311c:	00113c23          	sd	ra,24(sp)
    80003120:	00813823          	sd	s0,16(sp)
    80003124:	00913423          	sd	s1,8(sp)
    80003128:	02010413          	addi	s0,sp,32
    8000312c:	00050493          	mv	s1,a0
	return new KSem(val);
    80003130:	01800513          	li	a0,24
    80003134:	00000097          	auipc	ra,0x0
    80003138:	f94080e7          	jalr	-108(ra) # 800030c8 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val) {}
    8000313c:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003140:	00053423          	sd	zero,8(a0)
    80003144:	00053823          	sd	zero,16(a0)
}
    80003148:	01813083          	ld	ra,24(sp)
    8000314c:	01013403          	ld	s0,16(sp)
    80003150:	00813483          	ld	s1,8(sp)
    80003154:	02010113          	addi	sp,sp,32
    80003158:	00008067          	ret

000000008000315c <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    8000315c:	ff010113          	addi	sp,sp,-16
    80003160:	00113423          	sd	ra,8(sp)
    80003164:	00813023          	sd	s0,0(sp)
    80003168:	01010413          	addi	s0,sp,16
    static TCB* getRunning() { return running; }
    8000316c:	0000a797          	auipc	a5,0xa
    80003170:	ab47b783          	ld	a5,-1356(a5) # 8000cc20 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003174:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80003178:	00200793          	li	a5,2
    8000317c:	04f5ac23          	sw	a5,88(a1)
    TCB::getRunning()->setStatus(TCB::BLOCKED);
	blocked.putLast(TCB::getRunning());
    80003180:	00850513          	addi	a0,a0,8
    80003184:	ffffe097          	auipc	ra,0xffffe
    80003188:	0b8080e7          	jalr	184(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::dispatch();
    8000318c:	00000097          	auipc	ra,0x0
    80003190:	c9c080e7          	jalr	-868(ra) # 80002e28 <_ZN3TCB8dispatchEv>
}
    80003194:	00813083          	ld	ra,8(sp)
    80003198:	00013403          	ld	s0,0(sp)
    8000319c:	01010113          	addi	sp,sp,16
    800031a0:	00008067          	ret

00000000800031a4 <_ZN4KSem4waitEv>:
	if (--val < 0) {
    800031a4:	00052783          	lw	a5,0(a0)
    800031a8:	fff7879b          	addiw	a5,a5,-1
    800031ac:	00f52023          	sw	a5,0(a0)
    800031b0:	02079713          	slli	a4,a5,0x20
    800031b4:	00074663          	bltz	a4,800031c0 <_ZN4KSem4waitEv+0x1c>
	return 0;
    800031b8:	00000513          	li	a0,0
}
    800031bc:	00008067          	ret
int KSem::wait() {
    800031c0:	ff010113          	addi	sp,sp,-16
    800031c4:	00113423          	sd	ra,8(sp)
    800031c8:	00813023          	sd	s0,0(sp)
    800031cc:	01010413          	addi	s0,sp,16
		block();
    800031d0:	00000097          	auipc	ra,0x0
    800031d4:	f8c080e7          	jalr	-116(ra) # 8000315c <_ZN4KSem5blockEv>
		return -1;
    800031d8:	fff00513          	li	a0,-1
}
    800031dc:	00813083          	ld	ra,8(sp)
    800031e0:	00013403          	ld	s0,0(sp)
    800031e4:	01010113          	addi	sp,sp,16
    800031e8:	00008067          	ret

00000000800031ec <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    800031ec:	ff010113          	addi	sp,sp,-16
    800031f0:	00113423          	sd	ra,8(sp)
    800031f4:	00813023          	sd	s0,0(sp)
    800031f8:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    800031fc:	00850513          	addi	a0,a0,8
    80003200:	ffffe097          	auipc	ra,0xffffe
    80003204:	0a8080e7          	jalr	168(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
	Scheduler::put(tcb);
    80003208:	ffffe097          	auipc	ra,0xffffe
    8000320c:	6c8080e7          	jalr	1736(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
}
    80003210:	00813083          	ld	ra,8(sp)
    80003214:	00013403          	ld	s0,0(sp)
    80003218:	01010113          	addi	sp,sp,16
    8000321c:	00008067          	ret

0000000080003220 <_ZN4KSem6signalEv>:
	if (val++ < 0) {
    80003220:	00052783          	lw	a5,0(a0)
    80003224:	0017871b          	addiw	a4,a5,1
    80003228:	00e52023          	sw	a4,0(a0)
    8000322c:	0007c663          	bltz	a5,80003238 <_ZN4KSem6signalEv+0x18>
}
    80003230:	00000513          	li	a0,0
    80003234:	00008067          	ret
int KSem::signal() {
    80003238:	ff010113          	addi	sp,sp,-16
    8000323c:	00113423          	sd	ra,8(sp)
    80003240:	00813023          	sd	s0,0(sp)
    80003244:	01010413          	addi	s0,sp,16
		unblock();
    80003248:	00000097          	auipc	ra,0x0
    8000324c:	fa4080e7          	jalr	-92(ra) # 800031ec <_ZN4KSem7unblockEv>
}
    80003250:	00000513          	li	a0,0
    80003254:	00813083          	ld	ra,8(sp)
    80003258:	00013403          	ld	s0,0(sp)
    8000325c:	01010113          	addi	sp,sp,16
    80003260:	00008067          	ret

0000000080003264 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003264:	fe010113          	addi	sp,sp,-32
    80003268:	00113c23          	sd	ra,24(sp)
    8000326c:	00813823          	sd	s0,16(sp)
    80003270:	00913423          	sd	s1,8(sp)
    80003274:	02010413          	addi	s0,sp,32
    80003278:	00050493          	mv	s1,a0
        return front == nullptr;
    8000327c:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003280:	00078e63          	beqz	a5,8000329c <_ZN4KSem8closeSemEPS_+0x38>
		TCB* tcb = handle->blocked.getFirst();
    80003284:	00848513          	addi	a0,s1,8
    80003288:	ffffe097          	auipc	ra,0xffffe
    8000328c:	020080e7          	jalr	32(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
		Scheduler::put(tcb);
    80003290:	ffffe097          	auipc	ra,0xffffe
    80003294:	640080e7          	jalr	1600(ra) # 800018d0 <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    80003298:	fe5ff06f          	j	8000327c <_ZN4KSem8closeSemEPS_+0x18>
	}
	return 0;
}
    8000329c:	00000513          	li	a0,0
    800032a0:	01813083          	ld	ra,24(sp)
    800032a4:	01013403          	ld	s0,16(sp)
    800032a8:	00813483          	ld	s1,8(sp)
    800032ac:	02010113          	addi	sp,sp,32
    800032b0:	00008067          	ret

00000000800032b4 <_Z13emptyFunctionPv>:
    void run() override {
        thread_dispatch();
    }
};

void emptyFunction(void*) {}
    800032b4:	ff010113          	addi	sp,sp,-16
    800032b8:	00813423          	sd	s0,8(sp)
    800032bc:	01010413          	addi	s0,sp,16
    800032c0:	00813403          	ld	s0,8(sp)
    800032c4:	01010113          	addi	sp,sp,16
    800032c8:	00008067          	ret

00000000800032cc <_Z5nit1fPv>:

void nit1f(void*) {
    800032cc:	fe010113          	addi	sp,sp,-32
    800032d0:	00113c23          	sd	ra,24(sp)
    800032d4:	00813823          	sd	s0,16(sp)
    800032d8:	02010413          	addi	s0,sp,32
    while (true) {
        thread_t handle;
        thread_create(&handle, emptyFunction, nullptr);
    800032dc:	00000613          	li	a2,0
    800032e0:	00000597          	auipc	a1,0x0
    800032e4:	fd458593          	addi	a1,a1,-44 # 800032b4 <_Z13emptyFunctionPv>
    800032e8:	fe840513          	addi	a0,s0,-24
    800032ec:	ffffe097          	auipc	ra,0xffffe
    800032f0:	08c080e7          	jalr	140(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    while (true) {
    800032f4:	fe9ff06f          	j	800032dc <_Z5nit1fPv+0x10>

00000000800032f8 <_Z5nit2fPv>:
    void periodicActivation() override {
        printString("Janko\n");
    }
};

void nit2f(void* arg2) {
    800032f8:	fe010113          	addi	sp,sp,-32
    800032fc:	00113c23          	sd	ra,24(sp)
    80003300:	00813823          	sd	s0,16(sp)
    80003304:	00913423          	sd	s1,8(sp)
    80003308:	01213023          	sd	s2,0(sp)
    8000330c:	02010413          	addi	s0,sp,32
    PeriodicThread* pt = new per(10);
    80003310:	02800513          	li	a0,40
    80003314:	fffff097          	auipc	ra,0xfffff
    80003318:	56c080e7          	jalr	1388(ra) # 80002880 <_Znwm>
    8000331c:	00050493          	mv	s1,a0
    per(time_t period) : PeriodicThread(period) {}
    80003320:	00a00593          	li	a1,10
    80003324:	00000097          	auipc	ra,0x0
    80003328:	970080e7          	jalr	-1680(ra) # 80002c94 <_ZN14PeriodicThreadC1Em>
    8000332c:	00009797          	auipc	a5,0x9
    80003330:	6c478793          	addi	a5,a5,1732 # 8000c9f0 <_ZTV3per+0x10>
    80003334:	00f4b023          	sd	a5,0(s1)
    pt->start();
    80003338:	00048513          	mv	a0,s1
    8000333c:	fffff097          	auipc	ra,0xfffff
    80003340:	6fc080e7          	jalr	1788(ra) # 80002a38 <_ZN6Thread5startEv>
    time_sleep(15);
    80003344:	00f00513          	li	a0,15
    80003348:	ffffe097          	auipc	ra,0xffffe
    8000334c:	134080e7          	jalr	308(ra) # 8000147c <_Z10time_sleepm>
    pt->terminate();
    80003350:	00048513          	mv	a0,s1
    80003354:	00000097          	auipc	ra,0x0
    80003358:	920080e7          	jalr	-1760(ra) # 80002c74 <_ZN14PeriodicThread9terminateEv>
    printString("\nGotova nit 2\n");
    8000335c:	00007517          	auipc	a0,0x7
    80003360:	e3c50513          	addi	a0,a0,-452 # 8000a198 <CONSOLE_STATUS+0x188>
    80003364:	00002097          	auipc	ra,0x2
    80003368:	734080e7          	jalr	1844(ra) # 80005a98 <_Z11printStringPKc>
}
    8000336c:	01813083          	ld	ra,24(sp)
    80003370:	01013403          	ld	s0,16(sp)
    80003374:	00813483          	ld	s1,8(sp)
    80003378:	00013903          	ld	s2,0(sp)
    8000337c:	02010113          	addi	sp,sp,32
    80003380:	00008067          	ret
    80003384:	00050913          	mv	s2,a0
    PeriodicThread* pt = new per(10);
    80003388:	00048513          	mv	a0,s1
    8000338c:	fffff097          	auipc	ra,0xfffff
    80003390:	544080e7          	jalr	1348(ra) # 800028d0 <_ZdlPv>
    80003394:	00090513          	mv	a0,s2
    80003398:	0000b097          	auipc	ra,0xb
    8000339c:	b40080e7          	jalr	-1216(ra) # 8000ded8 <_Unwind_Resume>

00000000800033a0 <_Z5nit3fPv>:


void nit3f(void*) {
    800033a0:	fe010113          	addi	sp,sp,-32
    800033a4:	00113c23          	sd	ra,24(sp)
    800033a8:	00813823          	sd	s0,16(sp)
    800033ac:	00913423          	sd	s1,8(sp)
    800033b0:	02010413          	addi	s0,sp,32
    800033b4:	0180006f          	j	800033cc <_Z5nit3fPv+0x2c>
    char slovo;
    do {
        slovo = getc();
        putc(slovo);
        if (slovo == '\r') putc('\n');
    800033b8:	00a00513          	li	a0,10
    800033bc:	ffffe097          	auipc	ra,0xffffe
    800033c0:	1e0080e7          	jalr	480(ra) # 8000159c <_Z4putcc>
    } while (slovo != '0');
    800033c4:	03000793          	li	a5,48
    800033c8:	02f48263          	beq	s1,a5,800033ec <_Z5nit3fPv+0x4c>
        slovo = getc();
    800033cc:	ffffe097          	auipc	ra,0xffffe
    800033d0:	1a8080e7          	jalr	424(ra) # 80001574 <_Z4getcv>
    800033d4:	00050493          	mv	s1,a0
        putc(slovo);
    800033d8:	ffffe097          	auipc	ra,0xffffe
    800033dc:	1c4080e7          	jalr	452(ra) # 8000159c <_Z4putcc>
        if (slovo == '\r') putc('\n');
    800033e0:	00d00793          	li	a5,13
    800033e4:	fef490e3          	bne	s1,a5,800033c4 <_Z5nit3fPv+0x24>
    800033e8:	fd1ff06f          	j	800033b8 <_Z5nit3fPv+0x18>

    printString("\nGotova nit3\n");
    800033ec:	00007517          	auipc	a0,0x7
    800033f0:	dbc50513          	addi	a0,a0,-580 # 8000a1a8 <CONSOLE_STATUS+0x198>
    800033f4:	00002097          	auipc	ra,0x2
    800033f8:	6a4080e7          	jalr	1700(ra) # 80005a98 <_Z11printStringPKc>
}
    800033fc:	01813083          	ld	ra,24(sp)
    80003400:	01013403          	ld	s0,16(sp)
    80003404:	00813483          	ld	s1,8(sp)
    80003408:	02010113          	addi	sp,sp,32
    8000340c:	00008067          	ret

0000000080003410 <_Z5main2v>:


int main2() {
    80003410:	fb010113          	addi	sp,sp,-80
    80003414:	04113423          	sd	ra,72(sp)
    80003418:	04813023          	sd	s0,64(sp)
    8000341c:	02913c23          	sd	s1,56(sp)
    80003420:	05010413          	addi	s0,sp,80
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80003424:	0000a797          	auipc	a5,0xa
    80003428:	80c7b783          	ld	a5,-2036(a5) # 8000cc30 <_GLOBAL_OFFSET_TABLE_+0x78>
    8000342c:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80003430:	ffffe097          	auipc	ra,0xffffe
    80003434:	7e0080e7          	jalr	2016(ra) # 80001c10 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80003438:	ffffe097          	auipc	ra,0xffffe
    8000343c:	248080e7          	jalr	584(ra) # 80001680 <_ZN8KConsole12initKConsoleEv>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

    //testiranje kreiranja niti
    thread_t glavnaNit = nullptr;
    80003440:	fc043c23          	sd	zero,-40(s0)
    thread_t nit1 = nullptr;
    80003444:	fc043823          	sd	zero,-48(s0)
    thread_t nit2 = nullptr;
    80003448:	fc043423          	sd	zero,-56(s0)
    thread_t nit3 = nullptr;
    8000344c:	fc043023          	sd	zero,-64(s0)
    thread_t idleNit = nullptr;
    80003450:	fa043c23          	sd	zero,-72(s0)
    thread_t kernelConsumerThread = nullptr;
    80003454:	fa043823          	sd	zero,-80(s0)
    thread_create(&glavnaNit, (TCB::Body)main, nullptr);
    80003458:	00000613          	li	a2,0
    8000345c:	00009597          	auipc	a1,0x9
    80003460:	7b45b583          	ld	a1,1972(a1) # 8000cc10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80003464:	fd840513          	addi	a0,s0,-40
    80003468:	ffffe097          	auipc	ra,0xffffe
    8000346c:	f10080e7          	jalr	-240(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>

    80003470:	fd843703          	ld	a4,-40(s0)
    80003474:	00009797          	auipc	a5,0x9
    80003478:	7ac7b783          	ld	a5,1964(a5) # 8000cc20 <_GLOBAL_OFFSET_TABLE_+0x68>
    8000347c:	00e7b023          	sd	a4,0(a5)
    TCB::setRunning(glavnaNit);
    thread_create(&idleNit, idle, nullptr);
    80003480:	00000613          	li	a2,0
    80003484:	00009597          	auipc	a1,0x9
    80003488:	7b45b583          	ld	a1,1972(a1) # 8000cc38 <_GLOBAL_OFFSET_TABLE_+0x80>
    8000348c:	fb840513          	addi	a0,s0,-72
    80003490:	ffffe097          	auipc	ra,0xffffe
    80003494:	ee8080e7          	jalr	-280(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    80003498:	00000613          	li	a2,0
    8000349c:	00009597          	auipc	a1,0x9
    800034a0:	7545b583          	ld	a1,1876(a1) # 8000cbf0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800034a4:	fb040513          	addi	a0,s0,-80
    800034a8:	ffffe097          	auipc	ra,0xffffe
    800034ac:	ed0080e7          	jalr	-304(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>


    thread_create(&nit1, nit1f, nullptr);
    800034b0:	00000613          	li	a2,0
    800034b4:	00000597          	auipc	a1,0x0
    800034b8:	e1858593          	addi	a1,a1,-488 # 800032cc <_Z5nit1fPv>
    800034bc:	fd040513          	addi	a0,s0,-48
    800034c0:	ffffe097          	auipc	ra,0xffffe
    800034c4:	eb8080e7          	jalr	-328(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit2, nit2f, nullptr);
    800034c8:	00000613          	li	a2,0
    800034cc:	00000597          	auipc	a1,0x0
    800034d0:	e2c58593          	addi	a1,a1,-468 # 800032f8 <_Z5nit2fPv>
    800034d4:	fc840513          	addi	a0,s0,-56
    800034d8:	ffffe097          	auipc	ra,0xffffe
    800034dc:	ea0080e7          	jalr	-352(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&nit3, nit3f, nullptr);
    800034e0:	00000613          	li	a2,0
    800034e4:	00000597          	auipc	a1,0x0
    800034e8:	ebc58593          	addi	a1,a1,-324 # 800033a0 <_Z5nit3fPv>
    800034ec:	fc040513          	addi	a0,s0,-64
    800034f0:	ffffe097          	auipc	ra,0xffffe
    800034f4:	e88080e7          	jalr	-376(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::mc_sstatus(uint64 mask) {
    800034f8:	00200493          	li	s1,2
    800034fc:	1004a073          	csrs	sstatus,s1

    //omoguci prekide
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    thread_join(nit1);
    80003500:	fd043503          	ld	a0,-48(s0)
    80003504:	ffffe097          	auipc	ra,0xffffe
    80003508:	f50080e7          	jalr	-176(ra) # 80001454 <_Z11thread_joinP3TCB>
    thread_join(nit2);
    8000350c:	fc843503          	ld	a0,-56(s0)
    80003510:	ffffe097          	auipc	ra,0xffffe
    80003514:	f44080e7          	jalr	-188(ra) # 80001454 <_Z11thread_joinP3TCB>
    thread_join(nit3);
    80003518:	fc043503          	ld	a0,-64(s0)
    8000351c:	ffffe097          	auipc	ra,0xffffe
    80003520:	f38080e7          	jalr	-200(ra) # 80001454 <_Z11thread_joinP3TCB>
    //thread_join(idleNit);

    printString("\nGotove user niti\n");
    80003524:	00007517          	auipc	a0,0x7
    80003528:	c9450513          	addi	a0,a0,-876 # 8000a1b8 <CONSOLE_STATUS+0x1a8>
    8000352c:	00002097          	auipc	ra,0x2
    80003530:	56c080e7          	jalr	1388(ra) # 80005a98 <_Z11printStringPKc>

    printString("\nSad cu da izadjem\n");
    80003534:	00007517          	auipc	a0,0x7
    80003538:	c9c50513          	addi	a0,a0,-868 # 8000a1d0 <CONSOLE_STATUS+0x1c0>
    8000353c:	00002097          	auipc	ra,0x2
    80003540:	55c080e7          	jalr	1372(ra) # 80005a98 <_Z11printStringPKc>
    static void flush() {
    80003544:	04300513          	li	a0,67
        __asm__ volatile("li a0, 0x43");
    80003548:	00000073          	ecall
inline uint64 Riscv::r_sstatus() {
    8000354c:	1004b073          	csrc	sstatus,s1
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);


    return 0;
    80003550:	00000513          	li	a0,0
    80003554:	04813083          	ld	ra,72(sp)
    80003558:	04013403          	ld	s0,64(sp)
    8000355c:	03813483          	ld	s1,56(sp)
    80003560:	05010113          	addi	sp,sp,80
    80003564:	00008067          	ret

0000000080003568 <_ZN3per18periodicActivationEv>:
    void periodicActivation() override {
    80003568:	ff010113          	addi	sp,sp,-16
    8000356c:	00113423          	sd	ra,8(sp)
    80003570:	00813023          	sd	s0,0(sp)
    80003574:	01010413          	addi	s0,sp,16
        printString("Janko\n");
    80003578:	00007517          	auipc	a0,0x7
    8000357c:	c1850513          	addi	a0,a0,-1000 # 8000a190 <CONSOLE_STATUS+0x180>
    80003580:	00002097          	auipc	ra,0x2
    80003584:	518080e7          	jalr	1304(ra) # 80005a98 <_Z11printStringPKc>
    }
    80003588:	00813083          	ld	ra,8(sp)
    8000358c:	00013403          	ld	s0,0(sp)
    80003590:	01010113          	addi	sp,sp,16
    80003594:	00008067          	ret

0000000080003598 <_ZN3perD1Ev>:
class per : public PeriodicThread {
    80003598:	ff010113          	addi	sp,sp,-16
    8000359c:	00113423          	sd	ra,8(sp)
    800035a0:	00813023          	sd	s0,0(sp)
    800035a4:	01010413          	addi	s0,sp,16
    800035a8:	00009797          	auipc	a5,0x9
    800035ac:	6407b783          	ld	a5,1600(a5) # 8000cbe8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800035b0:	01078793          	addi	a5,a5,16
    800035b4:	00f53023          	sd	a5,0(a0)
    800035b8:	fffff097          	auipc	ra,0xfffff
    800035bc:	1d8080e7          	jalr	472(ra) # 80002790 <_ZN6ThreadD1Ev>
    800035c0:	00813083          	ld	ra,8(sp)
    800035c4:	00013403          	ld	s0,0(sp)
    800035c8:	01010113          	addi	sp,sp,16
    800035cc:	00008067          	ret

00000000800035d0 <_ZN3perD0Ev>:
    800035d0:	fe010113          	addi	sp,sp,-32
    800035d4:	00113c23          	sd	ra,24(sp)
    800035d8:	00813823          	sd	s0,16(sp)
    800035dc:	00913423          	sd	s1,8(sp)
    800035e0:	02010413          	addi	s0,sp,32
    800035e4:	00050493          	mv	s1,a0
    800035e8:	00009797          	auipc	a5,0x9
    800035ec:	6007b783          	ld	a5,1536(a5) # 8000cbe8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800035f0:	01078793          	addi	a5,a5,16
    800035f4:	00f53023          	sd	a5,0(a0)
    800035f8:	fffff097          	auipc	ra,0xfffff
    800035fc:	198080e7          	jalr	408(ra) # 80002790 <_ZN6ThreadD1Ev>
    80003600:	00048513          	mv	a0,s1
    80003604:	fffff097          	auipc	ra,0xfffff
    80003608:	2cc080e7          	jalr	716(ra) # 800028d0 <_ZdlPv>
    8000360c:	01813083          	ld	ra,24(sp)
    80003610:	01013403          	ld	s0,16(sp)
    80003614:	00813483          	ld	s1,8(sp)
    80003618:	02010113          	addi	sp,sp,32
    8000361c:	00008067          	ret

0000000080003620 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003620:	fe010113          	addi	sp,sp,-32
    80003624:	00113c23          	sd	ra,24(sp)
    80003628:	00813823          	sd	s0,16(sp)
    8000362c:	00913423          	sd	s1,8(sp)
    80003630:	01213023          	sd	s2,0(sp)
    80003634:	02010413          	addi	s0,sp,32
    80003638:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000363c:	00000913          	li	s2,0
    80003640:	00c0006f          	j	8000364c <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003644:	ffffe097          	auipc	ra,0xffffe
    80003648:	df0080e7          	jalr	-528(ra) # 80001434 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    8000364c:	ffffe097          	auipc	ra,0xffffe
    80003650:	f28080e7          	jalr	-216(ra) # 80001574 <_Z4getcv>
    80003654:	0005059b          	sext.w	a1,a0
    80003658:	02d00793          	li	a5,45
    8000365c:	02f58a63          	beq	a1,a5,80003690 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003660:	0084b503          	ld	a0,8(s1)
    80003664:	00003097          	auipc	ra,0x3
    80003668:	400080e7          	jalr	1024(ra) # 80006a64 <_ZN6Buffer3putEi>
        i++;
    8000366c:	0019071b          	addiw	a4,s2,1
    80003670:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003674:	0004a683          	lw	a3,0(s1)
    80003678:	0026979b          	slliw	a5,a3,0x2
    8000367c:	00d787bb          	addw	a5,a5,a3
    80003680:	0017979b          	slliw	a5,a5,0x1
    80003684:	02f767bb          	remw	a5,a4,a5
    80003688:	fc0792e3          	bnez	a5,8000364c <_ZL16producerKeyboardPv+0x2c>
    8000368c:	fb9ff06f          	j	80003644 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003690:	00100793          	li	a5,1
    80003694:	00009717          	auipc	a4,0x9
    80003698:	70f72623          	sw	a5,1804(a4) # 8000cda0 <_ZL9threadEnd>
    data->buffer->put('!');
    8000369c:	02100593          	li	a1,33
    800036a0:	0084b503          	ld	a0,8(s1)
    800036a4:	00003097          	auipc	ra,0x3
    800036a8:	3c0080e7          	jalr	960(ra) # 80006a64 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800036ac:	0104b503          	ld	a0,16(s1)
    800036b0:	ffffe097          	auipc	ra,0xffffe
    800036b4:	e94080e7          	jalr	-364(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    800036b8:	01813083          	ld	ra,24(sp)
    800036bc:	01013403          	ld	s0,16(sp)
    800036c0:	00813483          	ld	s1,8(sp)
    800036c4:	00013903          	ld	s2,0(sp)
    800036c8:	02010113          	addi	sp,sp,32
    800036cc:	00008067          	ret

00000000800036d0 <_ZL8producerPv>:

static void producer(void *arg) {
    800036d0:	fe010113          	addi	sp,sp,-32
    800036d4:	00113c23          	sd	ra,24(sp)
    800036d8:	00813823          	sd	s0,16(sp)
    800036dc:	00913423          	sd	s1,8(sp)
    800036e0:	01213023          	sd	s2,0(sp)
    800036e4:	02010413          	addi	s0,sp,32
    800036e8:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800036ec:	00000913          	li	s2,0
    800036f0:	00c0006f          	j	800036fc <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800036f4:	ffffe097          	auipc	ra,0xffffe
    800036f8:	d40080e7          	jalr	-704(ra) # 80001434 <_Z15thread_dispatchv>
    while (!threadEnd) {
    800036fc:	00009797          	auipc	a5,0x9
    80003700:	6a47a783          	lw	a5,1700(a5) # 8000cda0 <_ZL9threadEnd>
    80003704:	02079e63          	bnez	a5,80003740 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003708:	0004a583          	lw	a1,0(s1)
    8000370c:	0305859b          	addiw	a1,a1,48
    80003710:	0084b503          	ld	a0,8(s1)
    80003714:	00003097          	auipc	ra,0x3
    80003718:	350080e7          	jalr	848(ra) # 80006a64 <_ZN6Buffer3putEi>
        i++;
    8000371c:	0019071b          	addiw	a4,s2,1
    80003720:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003724:	0004a683          	lw	a3,0(s1)
    80003728:	0026979b          	slliw	a5,a3,0x2
    8000372c:	00d787bb          	addw	a5,a5,a3
    80003730:	0017979b          	slliw	a5,a5,0x1
    80003734:	02f767bb          	remw	a5,a4,a5
    80003738:	fc0792e3          	bnez	a5,800036fc <_ZL8producerPv+0x2c>
    8000373c:	fb9ff06f          	j	800036f4 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003740:	0104b503          	ld	a0,16(s1)
    80003744:	ffffe097          	auipc	ra,0xffffe
    80003748:	e00080e7          	jalr	-512(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    8000374c:	01813083          	ld	ra,24(sp)
    80003750:	01013403          	ld	s0,16(sp)
    80003754:	00813483          	ld	s1,8(sp)
    80003758:	00013903          	ld	s2,0(sp)
    8000375c:	02010113          	addi	sp,sp,32
    80003760:	00008067          	ret

0000000080003764 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003764:	fd010113          	addi	sp,sp,-48
    80003768:	02113423          	sd	ra,40(sp)
    8000376c:	02813023          	sd	s0,32(sp)
    80003770:	00913c23          	sd	s1,24(sp)
    80003774:	01213823          	sd	s2,16(sp)
    80003778:	01313423          	sd	s3,8(sp)
    8000377c:	03010413          	addi	s0,sp,48
    80003780:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003784:	00000993          	li	s3,0
    80003788:	01c0006f          	j	800037a4 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    8000378c:	ffffe097          	auipc	ra,0xffffe
    80003790:	ca8080e7          	jalr	-856(ra) # 80001434 <_Z15thread_dispatchv>
    80003794:	0500006f          	j	800037e4 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003798:	00a00513          	li	a0,10
    8000379c:	ffffe097          	auipc	ra,0xffffe
    800037a0:	e00080e7          	jalr	-512(ra) # 8000159c <_Z4putcc>
    while (!threadEnd) {
    800037a4:	00009797          	auipc	a5,0x9
    800037a8:	5fc7a783          	lw	a5,1532(a5) # 8000cda0 <_ZL9threadEnd>
    800037ac:	06079063          	bnez	a5,8000380c <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800037b0:	00893503          	ld	a0,8(s2)
    800037b4:	00003097          	auipc	ra,0x3
    800037b8:	340080e7          	jalr	832(ra) # 80006af4 <_ZN6Buffer3getEv>
        i++;
    800037bc:	0019849b          	addiw	s1,s3,1
    800037c0:	0004899b          	sext.w	s3,s1
        putc(key);
    800037c4:	0ff57513          	andi	a0,a0,255
    800037c8:	ffffe097          	auipc	ra,0xffffe
    800037cc:	dd4080e7          	jalr	-556(ra) # 8000159c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800037d0:	00092703          	lw	a4,0(s2)
    800037d4:	0027179b          	slliw	a5,a4,0x2
    800037d8:	00e787bb          	addw	a5,a5,a4
    800037dc:	02f4e7bb          	remw	a5,s1,a5
    800037e0:	fa0786e3          	beqz	a5,8000378c <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800037e4:	05000793          	li	a5,80
    800037e8:	02f4e4bb          	remw	s1,s1,a5
    800037ec:	fa049ce3          	bnez	s1,800037a4 <_ZL8consumerPv+0x40>
    800037f0:	fa9ff06f          	j	80003798 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800037f4:	00893503          	ld	a0,8(s2)
    800037f8:	00003097          	auipc	ra,0x3
    800037fc:	2fc080e7          	jalr	764(ra) # 80006af4 <_ZN6Buffer3getEv>
        putc(key);
    80003800:	0ff57513          	andi	a0,a0,255
    80003804:	ffffe097          	auipc	ra,0xffffe
    80003808:	d98080e7          	jalr	-616(ra) # 8000159c <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    8000380c:	00893503          	ld	a0,8(s2)
    80003810:	00003097          	auipc	ra,0x3
    80003814:	370080e7          	jalr	880(ra) # 80006b80 <_ZN6Buffer6getCntEv>
    80003818:	fca04ee3          	bgtz	a0,800037f4 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    8000381c:	01093503          	ld	a0,16(s2)
    80003820:	ffffe097          	auipc	ra,0xffffe
    80003824:	d24080e7          	jalr	-732(ra) # 80001544 <_Z10sem_signalP4KSem>
}
    80003828:	02813083          	ld	ra,40(sp)
    8000382c:	02013403          	ld	s0,32(sp)
    80003830:	01813483          	ld	s1,24(sp)
    80003834:	01013903          	ld	s2,16(sp)
    80003838:	00813983          	ld	s3,8(sp)
    8000383c:	03010113          	addi	sp,sp,48
    80003840:	00008067          	ret

0000000080003844 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003844:	f9010113          	addi	sp,sp,-112
    80003848:	06113423          	sd	ra,104(sp)
    8000384c:	06813023          	sd	s0,96(sp)
    80003850:	04913c23          	sd	s1,88(sp)
    80003854:	05213823          	sd	s2,80(sp)
    80003858:	05313423          	sd	s3,72(sp)
    8000385c:	05413023          	sd	s4,64(sp)
    80003860:	03513c23          	sd	s5,56(sp)
    80003864:	03613823          	sd	s6,48(sp)
    80003868:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    8000386c:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003870:	00007517          	auipc	a0,0x7
    80003874:	97850513          	addi	a0,a0,-1672 # 8000a1e8 <CONSOLE_STATUS+0x1d8>
    80003878:	00002097          	auipc	ra,0x2
    8000387c:	220080e7          	jalr	544(ra) # 80005a98 <_Z11printStringPKc>
    getString(input, 30);
    80003880:	01e00593          	li	a1,30
    80003884:	fa040493          	addi	s1,s0,-96
    80003888:	00048513          	mv	a0,s1
    8000388c:	00002097          	auipc	ra,0x2
    80003890:	294080e7          	jalr	660(ra) # 80005b20 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003894:	00048513          	mv	a0,s1
    80003898:	00002097          	auipc	ra,0x2
    8000389c:	360080e7          	jalr	864(ra) # 80005bf8 <_Z11stringToIntPKc>
    800038a0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800038a4:	00007517          	auipc	a0,0x7
    800038a8:	96450513          	addi	a0,a0,-1692 # 8000a208 <CONSOLE_STATUS+0x1f8>
    800038ac:	00002097          	auipc	ra,0x2
    800038b0:	1ec080e7          	jalr	492(ra) # 80005a98 <_Z11printStringPKc>
    getString(input, 30);
    800038b4:	01e00593          	li	a1,30
    800038b8:	00048513          	mv	a0,s1
    800038bc:	00002097          	auipc	ra,0x2
    800038c0:	264080e7          	jalr	612(ra) # 80005b20 <_Z9getStringPci>
    n = stringToInt(input);
    800038c4:	00048513          	mv	a0,s1
    800038c8:	00002097          	auipc	ra,0x2
    800038cc:	330080e7          	jalr	816(ra) # 80005bf8 <_Z11stringToIntPKc>
    800038d0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    800038d4:	00007517          	auipc	a0,0x7
    800038d8:	95450513          	addi	a0,a0,-1708 # 8000a228 <CONSOLE_STATUS+0x218>
    800038dc:	00002097          	auipc	ra,0x2
    800038e0:	1bc080e7          	jalr	444(ra) # 80005a98 <_Z11printStringPKc>
	printInt(threadNum);
    800038e4:	00000613          	li	a2,0
    800038e8:	00a00593          	li	a1,10
    800038ec:	00090513          	mv	a0,s2
    800038f0:	00002097          	auipc	ra,0x2
    800038f4:	358080e7          	jalr	856(ra) # 80005c48 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800038f8:	00007517          	auipc	a0,0x7
    800038fc:	94850513          	addi	a0,a0,-1720 # 8000a240 <CONSOLE_STATUS+0x230>
    80003900:	00002097          	auipc	ra,0x2
    80003904:	198080e7          	jalr	408(ra) # 80005a98 <_Z11printStringPKc>
	printInt(n);
    80003908:	00000613          	li	a2,0
    8000390c:	00a00593          	li	a1,10
    80003910:	00048513          	mv	a0,s1
    80003914:	00002097          	auipc	ra,0x2
    80003918:	334080e7          	jalr	820(ra) # 80005c48 <_Z8printIntiii>
    printString(".\n");
    8000391c:	00007517          	auipc	a0,0x7
    80003920:	93c50513          	addi	a0,a0,-1732 # 8000a258 <CONSOLE_STATUS+0x248>
    80003924:	00002097          	auipc	ra,0x2
    80003928:	174080e7          	jalr	372(ra) # 80005a98 <_Z11printStringPKc>
    if(threadNum > n) {
    8000392c:	0324c463          	blt	s1,s2,80003954 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003930:	03205c63          	blez	s2,80003968 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003934:	03800513          	li	a0,56
    80003938:	fffff097          	auipc	ra,0xfffff
    8000393c:	f48080e7          	jalr	-184(ra) # 80002880 <_Znwm>
    80003940:	00050a13          	mv	s4,a0
    80003944:	00048593          	mv	a1,s1
    80003948:	00003097          	auipc	ra,0x3
    8000394c:	080080e7          	jalr	128(ra) # 800069c8 <_ZN6BufferC1Ei>
    80003950:	0300006f          	j	80003980 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003954:	00007517          	auipc	a0,0x7
    80003958:	90c50513          	addi	a0,a0,-1780 # 8000a260 <CONSOLE_STATUS+0x250>
    8000395c:	00002097          	auipc	ra,0x2
    80003960:	13c080e7          	jalr	316(ra) # 80005a98 <_Z11printStringPKc>
        return;
    80003964:	0140006f          	j	80003978 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003968:	00007517          	auipc	a0,0x7
    8000396c:	93850513          	addi	a0,a0,-1736 # 8000a2a0 <CONSOLE_STATUS+0x290>
    80003970:	00002097          	auipc	ra,0x2
    80003974:	128080e7          	jalr	296(ra) # 80005a98 <_Z11printStringPKc>
        return;
    80003978:	000b0113          	mv	sp,s6
    8000397c:	1500006f          	j	80003acc <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003980:	00000593          	li	a1,0
    80003984:	00009517          	auipc	a0,0x9
    80003988:	42450513          	addi	a0,a0,1060 # 8000cda8 <_ZL10waitForAll>
    8000398c:	ffffe097          	auipc	ra,0xffffe
    80003990:	b20080e7          	jalr	-1248(ra) # 800014ac <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003994:	00391793          	slli	a5,s2,0x3
    80003998:	00f78793          	addi	a5,a5,15
    8000399c:	ff07f793          	andi	a5,a5,-16
    800039a0:	40f10133          	sub	sp,sp,a5
    800039a4:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800039a8:	0019071b          	addiw	a4,s2,1
    800039ac:	00171793          	slli	a5,a4,0x1
    800039b0:	00e787b3          	add	a5,a5,a4
    800039b4:	00379793          	slli	a5,a5,0x3
    800039b8:	00f78793          	addi	a5,a5,15
    800039bc:	ff07f793          	andi	a5,a5,-16
    800039c0:	40f10133          	sub	sp,sp,a5
    800039c4:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800039c8:	00191613          	slli	a2,s2,0x1
    800039cc:	012607b3          	add	a5,a2,s2
    800039d0:	00379793          	slli	a5,a5,0x3
    800039d4:	00f987b3          	add	a5,s3,a5
    800039d8:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800039dc:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800039e0:	00009717          	auipc	a4,0x9
    800039e4:	3c873703          	ld	a4,968(a4) # 8000cda8 <_ZL10waitForAll>
    800039e8:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800039ec:	00078613          	mv	a2,a5
    800039f0:	00000597          	auipc	a1,0x0
    800039f4:	d7458593          	addi	a1,a1,-652 # 80003764 <_ZL8consumerPv>
    800039f8:	f9840513          	addi	a0,s0,-104
    800039fc:	ffffe097          	auipc	ra,0xffffe
    80003a00:	97c080e7          	jalr	-1668(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003a04:	00000493          	li	s1,0
    80003a08:	0280006f          	j	80003a30 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003a0c:	00000597          	auipc	a1,0x0
    80003a10:	c1458593          	addi	a1,a1,-1004 # 80003620 <_ZL16producerKeyboardPv>
                      data + i);
    80003a14:	00179613          	slli	a2,a5,0x1
    80003a18:	00f60633          	add	a2,a2,a5
    80003a1c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003a20:	00c98633          	add	a2,s3,a2
    80003a24:	ffffe097          	auipc	ra,0xffffe
    80003a28:	954080e7          	jalr	-1708(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003a2c:	0014849b          	addiw	s1,s1,1
    80003a30:	0524d263          	bge	s1,s2,80003a74 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003a34:	00149793          	slli	a5,s1,0x1
    80003a38:	009787b3          	add	a5,a5,s1
    80003a3c:	00379793          	slli	a5,a5,0x3
    80003a40:	00f987b3          	add	a5,s3,a5
    80003a44:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003a48:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003a4c:	00009717          	auipc	a4,0x9
    80003a50:	35c73703          	ld	a4,860(a4) # 8000cda8 <_ZL10waitForAll>
    80003a54:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003a58:	00048793          	mv	a5,s1
    80003a5c:	00349513          	slli	a0,s1,0x3
    80003a60:	00aa8533          	add	a0,s5,a0
    80003a64:	fa9054e3          	blez	s1,80003a0c <_Z22producerConsumer_C_APIv+0x1c8>
    80003a68:	00000597          	auipc	a1,0x0
    80003a6c:	c6858593          	addi	a1,a1,-920 # 800036d0 <_ZL8producerPv>
    80003a70:	fa5ff06f          	j	80003a14 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003a74:	ffffe097          	auipc	ra,0xffffe
    80003a78:	9c0080e7          	jalr	-1600(ra) # 80001434 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003a7c:	00000493          	li	s1,0
    80003a80:	00994e63          	blt	s2,s1,80003a9c <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003a84:	00009517          	auipc	a0,0x9
    80003a88:	32453503          	ld	a0,804(a0) # 8000cda8 <_ZL10waitForAll>
    80003a8c:	ffffe097          	auipc	ra,0xffffe
    80003a90:	a88080e7          	jalr	-1400(ra) # 80001514 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003a94:	0014849b          	addiw	s1,s1,1
    80003a98:	fe9ff06f          	j	80003a80 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003a9c:	00009517          	auipc	a0,0x9
    80003aa0:	30c53503          	ld	a0,780(a0) # 8000cda8 <_ZL10waitForAll>
    80003aa4:	ffffe097          	auipc	ra,0xffffe
    80003aa8:	a40080e7          	jalr	-1472(ra) # 800014e4 <_Z9sem_closeP4KSem>
    delete buffer;
    80003aac:	000a0e63          	beqz	s4,80003ac8 <_Z22producerConsumer_C_APIv+0x284>
    80003ab0:	000a0513          	mv	a0,s4
    80003ab4:	00003097          	auipc	ra,0x3
    80003ab8:	154080e7          	jalr	340(ra) # 80006c08 <_ZN6BufferD1Ev>
    80003abc:	000a0513          	mv	a0,s4
    80003ac0:	fffff097          	auipc	ra,0xfffff
    80003ac4:	e10080e7          	jalr	-496(ra) # 800028d0 <_ZdlPv>
    80003ac8:	000b0113          	mv	sp,s6

}
    80003acc:	f9040113          	addi	sp,s0,-112
    80003ad0:	06813083          	ld	ra,104(sp)
    80003ad4:	06013403          	ld	s0,96(sp)
    80003ad8:	05813483          	ld	s1,88(sp)
    80003adc:	05013903          	ld	s2,80(sp)
    80003ae0:	04813983          	ld	s3,72(sp)
    80003ae4:	04013a03          	ld	s4,64(sp)
    80003ae8:	03813a83          	ld	s5,56(sp)
    80003aec:	03013b03          	ld	s6,48(sp)
    80003af0:	07010113          	addi	sp,sp,112
    80003af4:	00008067          	ret
    80003af8:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003afc:	000a0513          	mv	a0,s4
    80003b00:	fffff097          	auipc	ra,0xfffff
    80003b04:	dd0080e7          	jalr	-560(ra) # 800028d0 <_ZdlPv>
    80003b08:	00048513          	mv	a0,s1
    80003b0c:	0000a097          	auipc	ra,0xa
    80003b10:	3cc080e7          	jalr	972(ra) # 8000ded8 <_Unwind_Resume>

0000000080003b14 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003b14:	fe010113          	addi	sp,sp,-32
    80003b18:	00113c23          	sd	ra,24(sp)
    80003b1c:	00813823          	sd	s0,16(sp)
    80003b20:	00913423          	sd	s1,8(sp)
    80003b24:	01213023          	sd	s2,0(sp)
    80003b28:	02010413          	addi	s0,sp,32
    80003b2c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003b30:	00100793          	li	a5,1
    80003b34:	02a7f863          	bgeu	a5,a0,80003b64 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003b38:	00a00793          	li	a5,10
    80003b3c:	02f577b3          	remu	a5,a0,a5
    80003b40:	02078e63          	beqz	a5,80003b7c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003b44:	fff48513          	addi	a0,s1,-1
    80003b48:	00000097          	auipc	ra,0x0
    80003b4c:	fcc080e7          	jalr	-52(ra) # 80003b14 <_ZL9fibonaccim>
    80003b50:	00050913          	mv	s2,a0
    80003b54:	ffe48513          	addi	a0,s1,-2
    80003b58:	00000097          	auipc	ra,0x0
    80003b5c:	fbc080e7          	jalr	-68(ra) # 80003b14 <_ZL9fibonaccim>
    80003b60:	00a90533          	add	a0,s2,a0
}
    80003b64:	01813083          	ld	ra,24(sp)
    80003b68:	01013403          	ld	s0,16(sp)
    80003b6c:	00813483          	ld	s1,8(sp)
    80003b70:	00013903          	ld	s2,0(sp)
    80003b74:	02010113          	addi	sp,sp,32
    80003b78:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003b7c:	ffffe097          	auipc	ra,0xffffe
    80003b80:	8b8080e7          	jalr	-1864(ra) # 80001434 <_Z15thread_dispatchv>
    80003b84:	fc1ff06f          	j	80003b44 <_ZL9fibonaccim+0x30>

0000000080003b88 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003b88:	fe010113          	addi	sp,sp,-32
    80003b8c:	00113c23          	sd	ra,24(sp)
    80003b90:	00813823          	sd	s0,16(sp)
    80003b94:	00913423          	sd	s1,8(sp)
    80003b98:	01213023          	sd	s2,0(sp)
    80003b9c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003ba0:	00000913          	li	s2,0
    80003ba4:	0380006f          	j	80003bdc <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003ba8:	ffffe097          	auipc	ra,0xffffe
    80003bac:	88c080e7          	jalr	-1908(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003bb0:	00148493          	addi	s1,s1,1
    80003bb4:	000027b7          	lui	a5,0x2
    80003bb8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003bbc:	0097ee63          	bltu	a5,s1,80003bd8 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003bc0:	00000713          	li	a4,0
    80003bc4:	000077b7          	lui	a5,0x7
    80003bc8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003bcc:	fce7eee3          	bltu	a5,a4,80003ba8 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003bd0:	00170713          	addi	a4,a4,1
    80003bd4:	ff1ff06f          	j	80003bc4 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003bd8:	00190913          	addi	s2,s2,1
    80003bdc:	00900793          	li	a5,9
    80003be0:	0527e063          	bltu	a5,s2,80003c20 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003be4:	00006517          	auipc	a0,0x6
    80003be8:	6ec50513          	addi	a0,a0,1772 # 8000a2d0 <CONSOLE_STATUS+0x2c0>
    80003bec:	00002097          	auipc	ra,0x2
    80003bf0:	eac080e7          	jalr	-340(ra) # 80005a98 <_Z11printStringPKc>
    80003bf4:	00000613          	li	a2,0
    80003bf8:	00a00593          	li	a1,10
    80003bfc:	0009051b          	sext.w	a0,s2
    80003c00:	00002097          	auipc	ra,0x2
    80003c04:	048080e7          	jalr	72(ra) # 80005c48 <_Z8printIntiii>
    80003c08:	00007517          	auipc	a0,0x7
    80003c0c:	92850513          	addi	a0,a0,-1752 # 8000a530 <CONSOLE_STATUS+0x520>
    80003c10:	00002097          	auipc	ra,0x2
    80003c14:	e88080e7          	jalr	-376(ra) # 80005a98 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003c18:	00000493          	li	s1,0
    80003c1c:	f99ff06f          	j	80003bb4 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003c20:	00006517          	auipc	a0,0x6
    80003c24:	6b850513          	addi	a0,a0,1720 # 8000a2d8 <CONSOLE_STATUS+0x2c8>
    80003c28:	00002097          	auipc	ra,0x2
    80003c2c:	e70080e7          	jalr	-400(ra) # 80005a98 <_Z11printStringPKc>
    finishedA = true;
    80003c30:	00100793          	li	a5,1
    80003c34:	00009717          	auipc	a4,0x9
    80003c38:	16f70e23          	sb	a5,380(a4) # 8000cdb0 <_ZL9finishedA>
}
    80003c3c:	01813083          	ld	ra,24(sp)
    80003c40:	01013403          	ld	s0,16(sp)
    80003c44:	00813483          	ld	s1,8(sp)
    80003c48:	00013903          	ld	s2,0(sp)
    80003c4c:	02010113          	addi	sp,sp,32
    80003c50:	00008067          	ret

0000000080003c54 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003c54:	fe010113          	addi	sp,sp,-32
    80003c58:	00113c23          	sd	ra,24(sp)
    80003c5c:	00813823          	sd	s0,16(sp)
    80003c60:	00913423          	sd	s1,8(sp)
    80003c64:	01213023          	sd	s2,0(sp)
    80003c68:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003c6c:	00000913          	li	s2,0
    80003c70:	0380006f          	j	80003ca8 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003c74:	ffffd097          	auipc	ra,0xffffd
    80003c78:	7c0080e7          	jalr	1984(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003c7c:	00148493          	addi	s1,s1,1
    80003c80:	000027b7          	lui	a5,0x2
    80003c84:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003c88:	0097ee63          	bltu	a5,s1,80003ca4 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003c8c:	00000713          	li	a4,0
    80003c90:	000077b7          	lui	a5,0x7
    80003c94:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003c98:	fce7eee3          	bltu	a5,a4,80003c74 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003c9c:	00170713          	addi	a4,a4,1
    80003ca0:	ff1ff06f          	j	80003c90 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003ca4:	00190913          	addi	s2,s2,1
    80003ca8:	00f00793          	li	a5,15
    80003cac:	0527e063          	bltu	a5,s2,80003cec <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003cb0:	00006517          	auipc	a0,0x6
    80003cb4:	63850513          	addi	a0,a0,1592 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    80003cb8:	00002097          	auipc	ra,0x2
    80003cbc:	de0080e7          	jalr	-544(ra) # 80005a98 <_Z11printStringPKc>
    80003cc0:	00000613          	li	a2,0
    80003cc4:	00a00593          	li	a1,10
    80003cc8:	0009051b          	sext.w	a0,s2
    80003ccc:	00002097          	auipc	ra,0x2
    80003cd0:	f7c080e7          	jalr	-132(ra) # 80005c48 <_Z8printIntiii>
    80003cd4:	00007517          	auipc	a0,0x7
    80003cd8:	85c50513          	addi	a0,a0,-1956 # 8000a530 <CONSOLE_STATUS+0x520>
    80003cdc:	00002097          	auipc	ra,0x2
    80003ce0:	dbc080e7          	jalr	-580(ra) # 80005a98 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003ce4:	00000493          	li	s1,0
    80003ce8:	f99ff06f          	j	80003c80 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003cec:	00006517          	auipc	a0,0x6
    80003cf0:	60450513          	addi	a0,a0,1540 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    80003cf4:	00002097          	auipc	ra,0x2
    80003cf8:	da4080e7          	jalr	-604(ra) # 80005a98 <_Z11printStringPKc>
    finishedB = true;
    80003cfc:	00100793          	li	a5,1
    80003d00:	00009717          	auipc	a4,0x9
    80003d04:	0af708a3          	sb	a5,177(a4) # 8000cdb1 <_ZL9finishedB>
    thread_dispatch();
    80003d08:	ffffd097          	auipc	ra,0xffffd
    80003d0c:	72c080e7          	jalr	1836(ra) # 80001434 <_Z15thread_dispatchv>
}
    80003d10:	01813083          	ld	ra,24(sp)
    80003d14:	01013403          	ld	s0,16(sp)
    80003d18:	00813483          	ld	s1,8(sp)
    80003d1c:	00013903          	ld	s2,0(sp)
    80003d20:	02010113          	addi	sp,sp,32
    80003d24:	00008067          	ret

0000000080003d28 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003d28:	fe010113          	addi	sp,sp,-32
    80003d2c:	00113c23          	sd	ra,24(sp)
    80003d30:	00813823          	sd	s0,16(sp)
    80003d34:	00913423          	sd	s1,8(sp)
    80003d38:	01213023          	sd	s2,0(sp)
    80003d3c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003d40:	00000493          	li	s1,0
    80003d44:	0400006f          	j	80003d84 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003d48:	00006517          	auipc	a0,0x6
    80003d4c:	5b850513          	addi	a0,a0,1464 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80003d50:	00002097          	auipc	ra,0x2
    80003d54:	d48080e7          	jalr	-696(ra) # 80005a98 <_Z11printStringPKc>
    80003d58:	00000613          	li	a2,0
    80003d5c:	00a00593          	li	a1,10
    80003d60:	00048513          	mv	a0,s1
    80003d64:	00002097          	auipc	ra,0x2
    80003d68:	ee4080e7          	jalr	-284(ra) # 80005c48 <_Z8printIntiii>
    80003d6c:	00006517          	auipc	a0,0x6
    80003d70:	7c450513          	addi	a0,a0,1988 # 8000a530 <CONSOLE_STATUS+0x520>
    80003d74:	00002097          	auipc	ra,0x2
    80003d78:	d24080e7          	jalr	-732(ra) # 80005a98 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003d7c:	0014849b          	addiw	s1,s1,1
    80003d80:	0ff4f493          	andi	s1,s1,255
    80003d84:	00200793          	li	a5,2
    80003d88:	fc97f0e3          	bgeu	a5,s1,80003d48 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003d8c:	00006517          	auipc	a0,0x6
    80003d90:	57c50513          	addi	a0,a0,1404 # 8000a308 <CONSOLE_STATUS+0x2f8>
    80003d94:	00002097          	auipc	ra,0x2
    80003d98:	d04080e7          	jalr	-764(ra) # 80005a98 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003d9c:	00700313          	li	t1,7
    thread_dispatch();
    80003da0:	ffffd097          	auipc	ra,0xffffd
    80003da4:	694080e7          	jalr	1684(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003da8:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003dac:	00006517          	auipc	a0,0x6
    80003db0:	56c50513          	addi	a0,a0,1388 # 8000a318 <CONSOLE_STATUS+0x308>
    80003db4:	00002097          	auipc	ra,0x2
    80003db8:	ce4080e7          	jalr	-796(ra) # 80005a98 <_Z11printStringPKc>
    80003dbc:	00000613          	li	a2,0
    80003dc0:	00a00593          	li	a1,10
    80003dc4:	0009051b          	sext.w	a0,s2
    80003dc8:	00002097          	auipc	ra,0x2
    80003dcc:	e80080e7          	jalr	-384(ra) # 80005c48 <_Z8printIntiii>
    80003dd0:	00006517          	auipc	a0,0x6
    80003dd4:	76050513          	addi	a0,a0,1888 # 8000a530 <CONSOLE_STATUS+0x520>
    80003dd8:	00002097          	auipc	ra,0x2
    80003ddc:	cc0080e7          	jalr	-832(ra) # 80005a98 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003de0:	00c00513          	li	a0,12
    80003de4:	00000097          	auipc	ra,0x0
    80003de8:	d30080e7          	jalr	-720(ra) # 80003b14 <_ZL9fibonaccim>
    80003dec:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003df0:	00006517          	auipc	a0,0x6
    80003df4:	53050513          	addi	a0,a0,1328 # 8000a320 <CONSOLE_STATUS+0x310>
    80003df8:	00002097          	auipc	ra,0x2
    80003dfc:	ca0080e7          	jalr	-864(ra) # 80005a98 <_Z11printStringPKc>
    80003e00:	00000613          	li	a2,0
    80003e04:	00a00593          	li	a1,10
    80003e08:	0009051b          	sext.w	a0,s2
    80003e0c:	00002097          	auipc	ra,0x2
    80003e10:	e3c080e7          	jalr	-452(ra) # 80005c48 <_Z8printIntiii>
    80003e14:	00006517          	auipc	a0,0x6
    80003e18:	71c50513          	addi	a0,a0,1820 # 8000a530 <CONSOLE_STATUS+0x520>
    80003e1c:	00002097          	auipc	ra,0x2
    80003e20:	c7c080e7          	jalr	-900(ra) # 80005a98 <_Z11printStringPKc>
    80003e24:	0400006f          	j	80003e64 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003e28:	00006517          	auipc	a0,0x6
    80003e2c:	4d850513          	addi	a0,a0,1240 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80003e30:	00002097          	auipc	ra,0x2
    80003e34:	c68080e7          	jalr	-920(ra) # 80005a98 <_Z11printStringPKc>
    80003e38:	00000613          	li	a2,0
    80003e3c:	00a00593          	li	a1,10
    80003e40:	00048513          	mv	a0,s1
    80003e44:	00002097          	auipc	ra,0x2
    80003e48:	e04080e7          	jalr	-508(ra) # 80005c48 <_Z8printIntiii>
    80003e4c:	00006517          	auipc	a0,0x6
    80003e50:	6e450513          	addi	a0,a0,1764 # 8000a530 <CONSOLE_STATUS+0x520>
    80003e54:	00002097          	auipc	ra,0x2
    80003e58:	c44080e7          	jalr	-956(ra) # 80005a98 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003e5c:	0014849b          	addiw	s1,s1,1
    80003e60:	0ff4f493          	andi	s1,s1,255
    80003e64:	00500793          	li	a5,5
    80003e68:	fc97f0e3          	bgeu	a5,s1,80003e28 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80003e6c:	00006517          	auipc	a0,0x6
    80003e70:	4c450513          	addi	a0,a0,1220 # 8000a330 <CONSOLE_STATUS+0x320>
    80003e74:	00002097          	auipc	ra,0x2
    80003e78:	c24080e7          	jalr	-988(ra) # 80005a98 <_Z11printStringPKc>
    finishedC = true;
    80003e7c:	00100793          	li	a5,1
    80003e80:	00009717          	auipc	a4,0x9
    80003e84:	f2f70923          	sb	a5,-206(a4) # 8000cdb2 <_ZL9finishedC>
    thread_dispatch();
    80003e88:	ffffd097          	auipc	ra,0xffffd
    80003e8c:	5ac080e7          	jalr	1452(ra) # 80001434 <_Z15thread_dispatchv>
}
    80003e90:	01813083          	ld	ra,24(sp)
    80003e94:	01013403          	ld	s0,16(sp)
    80003e98:	00813483          	ld	s1,8(sp)
    80003e9c:	00013903          	ld	s2,0(sp)
    80003ea0:	02010113          	addi	sp,sp,32
    80003ea4:	00008067          	ret

0000000080003ea8 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003ea8:	fe010113          	addi	sp,sp,-32
    80003eac:	00113c23          	sd	ra,24(sp)
    80003eb0:	00813823          	sd	s0,16(sp)
    80003eb4:	00913423          	sd	s1,8(sp)
    80003eb8:	01213023          	sd	s2,0(sp)
    80003ebc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003ec0:	00a00493          	li	s1,10
    80003ec4:	0400006f          	j	80003f04 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003ec8:	00006517          	auipc	a0,0x6
    80003ecc:	47850513          	addi	a0,a0,1144 # 8000a340 <CONSOLE_STATUS+0x330>
    80003ed0:	00002097          	auipc	ra,0x2
    80003ed4:	bc8080e7          	jalr	-1080(ra) # 80005a98 <_Z11printStringPKc>
    80003ed8:	00000613          	li	a2,0
    80003edc:	00a00593          	li	a1,10
    80003ee0:	00048513          	mv	a0,s1
    80003ee4:	00002097          	auipc	ra,0x2
    80003ee8:	d64080e7          	jalr	-668(ra) # 80005c48 <_Z8printIntiii>
    80003eec:	00006517          	auipc	a0,0x6
    80003ef0:	64450513          	addi	a0,a0,1604 # 8000a530 <CONSOLE_STATUS+0x520>
    80003ef4:	00002097          	auipc	ra,0x2
    80003ef8:	ba4080e7          	jalr	-1116(ra) # 80005a98 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003efc:	0014849b          	addiw	s1,s1,1
    80003f00:	0ff4f493          	andi	s1,s1,255
    80003f04:	00c00793          	li	a5,12
    80003f08:	fc97f0e3          	bgeu	a5,s1,80003ec8 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003f0c:	00006517          	auipc	a0,0x6
    80003f10:	43c50513          	addi	a0,a0,1084 # 8000a348 <CONSOLE_STATUS+0x338>
    80003f14:	00002097          	auipc	ra,0x2
    80003f18:	b84080e7          	jalr	-1148(ra) # 80005a98 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003f1c:	00500313          	li	t1,5
    thread_dispatch();
    80003f20:	ffffd097          	auipc	ra,0xffffd
    80003f24:	514080e7          	jalr	1300(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003f28:	01000513          	li	a0,16
    80003f2c:	00000097          	auipc	ra,0x0
    80003f30:	be8080e7          	jalr	-1048(ra) # 80003b14 <_ZL9fibonaccim>
    80003f34:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003f38:	00006517          	auipc	a0,0x6
    80003f3c:	42050513          	addi	a0,a0,1056 # 8000a358 <CONSOLE_STATUS+0x348>
    80003f40:	00002097          	auipc	ra,0x2
    80003f44:	b58080e7          	jalr	-1192(ra) # 80005a98 <_Z11printStringPKc>
    80003f48:	00000613          	li	a2,0
    80003f4c:	00a00593          	li	a1,10
    80003f50:	0009051b          	sext.w	a0,s2
    80003f54:	00002097          	auipc	ra,0x2
    80003f58:	cf4080e7          	jalr	-780(ra) # 80005c48 <_Z8printIntiii>
    80003f5c:	00006517          	auipc	a0,0x6
    80003f60:	5d450513          	addi	a0,a0,1492 # 8000a530 <CONSOLE_STATUS+0x520>
    80003f64:	00002097          	auipc	ra,0x2
    80003f68:	b34080e7          	jalr	-1228(ra) # 80005a98 <_Z11printStringPKc>
    80003f6c:	0400006f          	j	80003fac <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003f70:	00006517          	auipc	a0,0x6
    80003f74:	3d050513          	addi	a0,a0,976 # 8000a340 <CONSOLE_STATUS+0x330>
    80003f78:	00002097          	auipc	ra,0x2
    80003f7c:	b20080e7          	jalr	-1248(ra) # 80005a98 <_Z11printStringPKc>
    80003f80:	00000613          	li	a2,0
    80003f84:	00a00593          	li	a1,10
    80003f88:	00048513          	mv	a0,s1
    80003f8c:	00002097          	auipc	ra,0x2
    80003f90:	cbc080e7          	jalr	-836(ra) # 80005c48 <_Z8printIntiii>
    80003f94:	00006517          	auipc	a0,0x6
    80003f98:	59c50513          	addi	a0,a0,1436 # 8000a530 <CONSOLE_STATUS+0x520>
    80003f9c:	00002097          	auipc	ra,0x2
    80003fa0:	afc080e7          	jalr	-1284(ra) # 80005a98 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003fa4:	0014849b          	addiw	s1,s1,1
    80003fa8:	0ff4f493          	andi	s1,s1,255
    80003fac:	00f00793          	li	a5,15
    80003fb0:	fc97f0e3          	bgeu	a5,s1,80003f70 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003fb4:	00006517          	auipc	a0,0x6
    80003fb8:	3b450513          	addi	a0,a0,948 # 8000a368 <CONSOLE_STATUS+0x358>
    80003fbc:	00002097          	auipc	ra,0x2
    80003fc0:	adc080e7          	jalr	-1316(ra) # 80005a98 <_Z11printStringPKc>
    finishedD = true;
    80003fc4:	00100793          	li	a5,1
    80003fc8:	00009717          	auipc	a4,0x9
    80003fcc:	def705a3          	sb	a5,-533(a4) # 8000cdb3 <_ZL9finishedD>
    thread_dispatch();
    80003fd0:	ffffd097          	auipc	ra,0xffffd
    80003fd4:	464080e7          	jalr	1124(ra) # 80001434 <_Z15thread_dispatchv>
}
    80003fd8:	01813083          	ld	ra,24(sp)
    80003fdc:	01013403          	ld	s0,16(sp)
    80003fe0:	00813483          	ld	s1,8(sp)
    80003fe4:	00013903          	ld	s2,0(sp)
    80003fe8:	02010113          	addi	sp,sp,32
    80003fec:	00008067          	ret

0000000080003ff0 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003ff0:	fc010113          	addi	sp,sp,-64
    80003ff4:	02113c23          	sd	ra,56(sp)
    80003ff8:	02813823          	sd	s0,48(sp)
    80003ffc:	02913423          	sd	s1,40(sp)
    80004000:	03213023          	sd	s2,32(sp)
    80004004:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80004008:	02000513          	li	a0,32
    8000400c:	fffff097          	auipc	ra,0xfffff
    80004010:	874080e7          	jalr	-1932(ra) # 80002880 <_Znwm>
    80004014:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004018:	fffff097          	auipc	ra,0xfffff
    8000401c:	b50080e7          	jalr	-1200(ra) # 80002b68 <_ZN6ThreadC1Ev>
    80004020:	00009797          	auipc	a5,0x9
    80004024:	a0078793          	addi	a5,a5,-1536 # 8000ca20 <_ZTV7WorkerA+0x10>
    80004028:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    8000402c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004030:	00006517          	auipc	a0,0x6
    80004034:	34850513          	addi	a0,a0,840 # 8000a378 <CONSOLE_STATUS+0x368>
    80004038:	00002097          	auipc	ra,0x2
    8000403c:	a60080e7          	jalr	-1440(ra) # 80005a98 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004040:	02000513          	li	a0,32
    80004044:	fffff097          	auipc	ra,0xfffff
    80004048:	83c080e7          	jalr	-1988(ra) # 80002880 <_Znwm>
    8000404c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004050:	fffff097          	auipc	ra,0xfffff
    80004054:	b18080e7          	jalr	-1256(ra) # 80002b68 <_ZN6ThreadC1Ev>
    80004058:	00009797          	auipc	a5,0x9
    8000405c:	9f078793          	addi	a5,a5,-1552 # 8000ca48 <_ZTV7WorkerB+0x10>
    80004060:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004064:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004068:	00006517          	auipc	a0,0x6
    8000406c:	32850513          	addi	a0,a0,808 # 8000a390 <CONSOLE_STATUS+0x380>
    80004070:	00002097          	auipc	ra,0x2
    80004074:	a28080e7          	jalr	-1496(ra) # 80005a98 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004078:	02000513          	li	a0,32
    8000407c:	fffff097          	auipc	ra,0xfffff
    80004080:	804080e7          	jalr	-2044(ra) # 80002880 <_Znwm>
    80004084:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004088:	fffff097          	auipc	ra,0xfffff
    8000408c:	ae0080e7          	jalr	-1312(ra) # 80002b68 <_ZN6ThreadC1Ev>
    80004090:	00009797          	auipc	a5,0x9
    80004094:	9e078793          	addi	a5,a5,-1568 # 8000ca70 <_ZTV7WorkerC+0x10>
    80004098:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    8000409c:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800040a0:	00006517          	auipc	a0,0x6
    800040a4:	30850513          	addi	a0,a0,776 # 8000a3a8 <CONSOLE_STATUS+0x398>
    800040a8:	00002097          	auipc	ra,0x2
    800040ac:	9f0080e7          	jalr	-1552(ra) # 80005a98 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800040b0:	02000513          	li	a0,32
    800040b4:	ffffe097          	auipc	ra,0xffffe
    800040b8:	7cc080e7          	jalr	1996(ra) # 80002880 <_Znwm>
    800040bc:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800040c0:	fffff097          	auipc	ra,0xfffff
    800040c4:	aa8080e7          	jalr	-1368(ra) # 80002b68 <_ZN6ThreadC1Ev>
    800040c8:	00009797          	auipc	a5,0x9
    800040cc:	9d078793          	addi	a5,a5,-1584 # 8000ca98 <_ZTV7WorkerD+0x10>
    800040d0:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800040d4:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800040d8:	00006517          	auipc	a0,0x6
    800040dc:	2e850513          	addi	a0,a0,744 # 8000a3c0 <CONSOLE_STATUS+0x3b0>
    800040e0:	00002097          	auipc	ra,0x2
    800040e4:	9b8080e7          	jalr	-1608(ra) # 80005a98 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800040e8:	00000493          	li	s1,0
    800040ec:	00300793          	li	a5,3
    800040f0:	0297c663          	blt	a5,s1,8000411c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800040f4:	00349793          	slli	a5,s1,0x3
    800040f8:	fe040713          	addi	a4,s0,-32
    800040fc:	00f707b3          	add	a5,a4,a5
    80004100:	fe07b503          	ld	a0,-32(a5)
    80004104:	fffff097          	auipc	ra,0xfffff
    80004108:	934080e7          	jalr	-1740(ra) # 80002a38 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    8000410c:	0014849b          	addiw	s1,s1,1
    80004110:	fddff06f          	j	800040ec <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004114:	fffff097          	auipc	ra,0xfffff
    80004118:	998080e7          	jalr	-1640(ra) # 80002aac <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000411c:	00009797          	auipc	a5,0x9
    80004120:	c947c783          	lbu	a5,-876(a5) # 8000cdb0 <_ZL9finishedA>
    80004124:	fe0788e3          	beqz	a5,80004114 <_Z20Threads_CPP_API_testv+0x124>
    80004128:	00009797          	auipc	a5,0x9
    8000412c:	c897c783          	lbu	a5,-887(a5) # 8000cdb1 <_ZL9finishedB>
    80004130:	fe0782e3          	beqz	a5,80004114 <_Z20Threads_CPP_API_testv+0x124>
    80004134:	00009797          	auipc	a5,0x9
    80004138:	c7e7c783          	lbu	a5,-898(a5) # 8000cdb2 <_ZL9finishedC>
    8000413c:	fc078ce3          	beqz	a5,80004114 <_Z20Threads_CPP_API_testv+0x124>
    80004140:	00009797          	auipc	a5,0x9
    80004144:	c737c783          	lbu	a5,-909(a5) # 8000cdb3 <_ZL9finishedD>
    80004148:	fc0786e3          	beqz	a5,80004114 <_Z20Threads_CPP_API_testv+0x124>
    8000414c:	fc040493          	addi	s1,s0,-64
    80004150:	0080006f          	j	80004158 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    80004154:	00848493          	addi	s1,s1,8
    80004158:	fe040793          	addi	a5,s0,-32
    8000415c:	08f48663          	beq	s1,a5,800041e8 <_Z20Threads_CPP_API_testv+0x1f8>
    80004160:	0004b503          	ld	a0,0(s1)
		delete thread;
    80004164:	fe0508e3          	beqz	a0,80004154 <_Z20Threads_CPP_API_testv+0x164>
    80004168:	00053783          	ld	a5,0(a0)
    8000416c:	0087b783          	ld	a5,8(a5)
    80004170:	000780e7          	jalr	a5
    80004174:	fe1ff06f          	j	80004154 <_Z20Threads_CPP_API_testv+0x164>
    80004178:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    8000417c:	00048513          	mv	a0,s1
    80004180:	ffffe097          	auipc	ra,0xffffe
    80004184:	750080e7          	jalr	1872(ra) # 800028d0 <_ZdlPv>
    80004188:	00090513          	mv	a0,s2
    8000418c:	0000a097          	auipc	ra,0xa
    80004190:	d4c080e7          	jalr	-692(ra) # 8000ded8 <_Unwind_Resume>
    80004194:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004198:	00048513          	mv	a0,s1
    8000419c:	ffffe097          	auipc	ra,0xffffe
    800041a0:	734080e7          	jalr	1844(ra) # 800028d0 <_ZdlPv>
    800041a4:	00090513          	mv	a0,s2
    800041a8:	0000a097          	auipc	ra,0xa
    800041ac:	d30080e7          	jalr	-720(ra) # 8000ded8 <_Unwind_Resume>
    800041b0:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800041b4:	00048513          	mv	a0,s1
    800041b8:	ffffe097          	auipc	ra,0xffffe
    800041bc:	718080e7          	jalr	1816(ra) # 800028d0 <_ZdlPv>
    800041c0:	00090513          	mv	a0,s2
    800041c4:	0000a097          	auipc	ra,0xa
    800041c8:	d14080e7          	jalr	-748(ra) # 8000ded8 <_Unwind_Resume>
    800041cc:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800041d0:	00048513          	mv	a0,s1
    800041d4:	ffffe097          	auipc	ra,0xffffe
    800041d8:	6fc080e7          	jalr	1788(ra) # 800028d0 <_ZdlPv>
    800041dc:	00090513          	mv	a0,s2
    800041e0:	0000a097          	auipc	ra,0xa
    800041e4:	cf8080e7          	jalr	-776(ra) # 8000ded8 <_Unwind_Resume>
	}
}
    800041e8:	03813083          	ld	ra,56(sp)
    800041ec:	03013403          	ld	s0,48(sp)
    800041f0:	02813483          	ld	s1,40(sp)
    800041f4:	02013903          	ld	s2,32(sp)
    800041f8:	04010113          	addi	sp,sp,64
    800041fc:	00008067          	ret

0000000080004200 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004200:	ff010113          	addi	sp,sp,-16
    80004204:	00113423          	sd	ra,8(sp)
    80004208:	00813023          	sd	s0,0(sp)
    8000420c:	01010413          	addi	s0,sp,16
    80004210:	00009797          	auipc	a5,0x9
    80004214:	81078793          	addi	a5,a5,-2032 # 8000ca20 <_ZTV7WorkerA+0x10>
    80004218:	00f53023          	sd	a5,0(a0)
    8000421c:	ffffe097          	auipc	ra,0xffffe
    80004220:	574080e7          	jalr	1396(ra) # 80002790 <_ZN6ThreadD1Ev>
    80004224:	00813083          	ld	ra,8(sp)
    80004228:	00013403          	ld	s0,0(sp)
    8000422c:	01010113          	addi	sp,sp,16
    80004230:	00008067          	ret

0000000080004234 <_ZN7WorkerAD0Ev>:
    80004234:	fe010113          	addi	sp,sp,-32
    80004238:	00113c23          	sd	ra,24(sp)
    8000423c:	00813823          	sd	s0,16(sp)
    80004240:	00913423          	sd	s1,8(sp)
    80004244:	02010413          	addi	s0,sp,32
    80004248:	00050493          	mv	s1,a0
    8000424c:	00008797          	auipc	a5,0x8
    80004250:	7d478793          	addi	a5,a5,2004 # 8000ca20 <_ZTV7WorkerA+0x10>
    80004254:	00f53023          	sd	a5,0(a0)
    80004258:	ffffe097          	auipc	ra,0xffffe
    8000425c:	538080e7          	jalr	1336(ra) # 80002790 <_ZN6ThreadD1Ev>
    80004260:	00048513          	mv	a0,s1
    80004264:	ffffe097          	auipc	ra,0xffffe
    80004268:	66c080e7          	jalr	1644(ra) # 800028d0 <_ZdlPv>
    8000426c:	01813083          	ld	ra,24(sp)
    80004270:	01013403          	ld	s0,16(sp)
    80004274:	00813483          	ld	s1,8(sp)
    80004278:	02010113          	addi	sp,sp,32
    8000427c:	00008067          	ret

0000000080004280 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80004280:	ff010113          	addi	sp,sp,-16
    80004284:	00113423          	sd	ra,8(sp)
    80004288:	00813023          	sd	s0,0(sp)
    8000428c:	01010413          	addi	s0,sp,16
    80004290:	00008797          	auipc	a5,0x8
    80004294:	7b878793          	addi	a5,a5,1976 # 8000ca48 <_ZTV7WorkerB+0x10>
    80004298:	00f53023          	sd	a5,0(a0)
    8000429c:	ffffe097          	auipc	ra,0xffffe
    800042a0:	4f4080e7          	jalr	1268(ra) # 80002790 <_ZN6ThreadD1Ev>
    800042a4:	00813083          	ld	ra,8(sp)
    800042a8:	00013403          	ld	s0,0(sp)
    800042ac:	01010113          	addi	sp,sp,16
    800042b0:	00008067          	ret

00000000800042b4 <_ZN7WorkerBD0Ev>:
    800042b4:	fe010113          	addi	sp,sp,-32
    800042b8:	00113c23          	sd	ra,24(sp)
    800042bc:	00813823          	sd	s0,16(sp)
    800042c0:	00913423          	sd	s1,8(sp)
    800042c4:	02010413          	addi	s0,sp,32
    800042c8:	00050493          	mv	s1,a0
    800042cc:	00008797          	auipc	a5,0x8
    800042d0:	77c78793          	addi	a5,a5,1916 # 8000ca48 <_ZTV7WorkerB+0x10>
    800042d4:	00f53023          	sd	a5,0(a0)
    800042d8:	ffffe097          	auipc	ra,0xffffe
    800042dc:	4b8080e7          	jalr	1208(ra) # 80002790 <_ZN6ThreadD1Ev>
    800042e0:	00048513          	mv	a0,s1
    800042e4:	ffffe097          	auipc	ra,0xffffe
    800042e8:	5ec080e7          	jalr	1516(ra) # 800028d0 <_ZdlPv>
    800042ec:	01813083          	ld	ra,24(sp)
    800042f0:	01013403          	ld	s0,16(sp)
    800042f4:	00813483          	ld	s1,8(sp)
    800042f8:	02010113          	addi	sp,sp,32
    800042fc:	00008067          	ret

0000000080004300 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004300:	ff010113          	addi	sp,sp,-16
    80004304:	00113423          	sd	ra,8(sp)
    80004308:	00813023          	sd	s0,0(sp)
    8000430c:	01010413          	addi	s0,sp,16
    80004310:	00008797          	auipc	a5,0x8
    80004314:	76078793          	addi	a5,a5,1888 # 8000ca70 <_ZTV7WorkerC+0x10>
    80004318:	00f53023          	sd	a5,0(a0)
    8000431c:	ffffe097          	auipc	ra,0xffffe
    80004320:	474080e7          	jalr	1140(ra) # 80002790 <_ZN6ThreadD1Ev>
    80004324:	00813083          	ld	ra,8(sp)
    80004328:	00013403          	ld	s0,0(sp)
    8000432c:	01010113          	addi	sp,sp,16
    80004330:	00008067          	ret

0000000080004334 <_ZN7WorkerCD0Ev>:
    80004334:	fe010113          	addi	sp,sp,-32
    80004338:	00113c23          	sd	ra,24(sp)
    8000433c:	00813823          	sd	s0,16(sp)
    80004340:	00913423          	sd	s1,8(sp)
    80004344:	02010413          	addi	s0,sp,32
    80004348:	00050493          	mv	s1,a0
    8000434c:	00008797          	auipc	a5,0x8
    80004350:	72478793          	addi	a5,a5,1828 # 8000ca70 <_ZTV7WorkerC+0x10>
    80004354:	00f53023          	sd	a5,0(a0)
    80004358:	ffffe097          	auipc	ra,0xffffe
    8000435c:	438080e7          	jalr	1080(ra) # 80002790 <_ZN6ThreadD1Ev>
    80004360:	00048513          	mv	a0,s1
    80004364:	ffffe097          	auipc	ra,0xffffe
    80004368:	56c080e7          	jalr	1388(ra) # 800028d0 <_ZdlPv>
    8000436c:	01813083          	ld	ra,24(sp)
    80004370:	01013403          	ld	s0,16(sp)
    80004374:	00813483          	ld	s1,8(sp)
    80004378:	02010113          	addi	sp,sp,32
    8000437c:	00008067          	ret

0000000080004380 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004380:	ff010113          	addi	sp,sp,-16
    80004384:	00113423          	sd	ra,8(sp)
    80004388:	00813023          	sd	s0,0(sp)
    8000438c:	01010413          	addi	s0,sp,16
    80004390:	00008797          	auipc	a5,0x8
    80004394:	70878793          	addi	a5,a5,1800 # 8000ca98 <_ZTV7WorkerD+0x10>
    80004398:	00f53023          	sd	a5,0(a0)
    8000439c:	ffffe097          	auipc	ra,0xffffe
    800043a0:	3f4080e7          	jalr	1012(ra) # 80002790 <_ZN6ThreadD1Ev>
    800043a4:	00813083          	ld	ra,8(sp)
    800043a8:	00013403          	ld	s0,0(sp)
    800043ac:	01010113          	addi	sp,sp,16
    800043b0:	00008067          	ret

00000000800043b4 <_ZN7WorkerDD0Ev>:
    800043b4:	fe010113          	addi	sp,sp,-32
    800043b8:	00113c23          	sd	ra,24(sp)
    800043bc:	00813823          	sd	s0,16(sp)
    800043c0:	00913423          	sd	s1,8(sp)
    800043c4:	02010413          	addi	s0,sp,32
    800043c8:	00050493          	mv	s1,a0
    800043cc:	00008797          	auipc	a5,0x8
    800043d0:	6cc78793          	addi	a5,a5,1740 # 8000ca98 <_ZTV7WorkerD+0x10>
    800043d4:	00f53023          	sd	a5,0(a0)
    800043d8:	ffffe097          	auipc	ra,0xffffe
    800043dc:	3b8080e7          	jalr	952(ra) # 80002790 <_ZN6ThreadD1Ev>
    800043e0:	00048513          	mv	a0,s1
    800043e4:	ffffe097          	auipc	ra,0xffffe
    800043e8:	4ec080e7          	jalr	1260(ra) # 800028d0 <_ZdlPv>
    800043ec:	01813083          	ld	ra,24(sp)
    800043f0:	01013403          	ld	s0,16(sp)
    800043f4:	00813483          	ld	s1,8(sp)
    800043f8:	02010113          	addi	sp,sp,32
    800043fc:	00008067          	ret

0000000080004400 <_ZN7WorkerA3runEv>:
    void run() override {
    80004400:	ff010113          	addi	sp,sp,-16
    80004404:	00113423          	sd	ra,8(sp)
    80004408:	00813023          	sd	s0,0(sp)
    8000440c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004410:	00000593          	li	a1,0
    80004414:	fffff097          	auipc	ra,0xfffff
    80004418:	774080e7          	jalr	1908(ra) # 80003b88 <_ZN7WorkerA11workerBodyAEPv>
    }
    8000441c:	00813083          	ld	ra,8(sp)
    80004420:	00013403          	ld	s0,0(sp)
    80004424:	01010113          	addi	sp,sp,16
    80004428:	00008067          	ret

000000008000442c <_ZN7WorkerB3runEv>:
    void run() override {
    8000442c:	ff010113          	addi	sp,sp,-16
    80004430:	00113423          	sd	ra,8(sp)
    80004434:	00813023          	sd	s0,0(sp)
    80004438:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    8000443c:	00000593          	li	a1,0
    80004440:	00000097          	auipc	ra,0x0
    80004444:	814080e7          	jalr	-2028(ra) # 80003c54 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004448:	00813083          	ld	ra,8(sp)
    8000444c:	00013403          	ld	s0,0(sp)
    80004450:	01010113          	addi	sp,sp,16
    80004454:	00008067          	ret

0000000080004458 <_ZN7WorkerC3runEv>:
    void run() override {
    80004458:	ff010113          	addi	sp,sp,-16
    8000445c:	00113423          	sd	ra,8(sp)
    80004460:	00813023          	sd	s0,0(sp)
    80004464:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004468:	00000593          	li	a1,0
    8000446c:	00000097          	auipc	ra,0x0
    80004470:	8bc080e7          	jalr	-1860(ra) # 80003d28 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004474:	00813083          	ld	ra,8(sp)
    80004478:	00013403          	ld	s0,0(sp)
    8000447c:	01010113          	addi	sp,sp,16
    80004480:	00008067          	ret

0000000080004484 <_ZN7WorkerD3runEv>:
    void run() override {
    80004484:	ff010113          	addi	sp,sp,-16
    80004488:	00113423          	sd	ra,8(sp)
    8000448c:	00813023          	sd	s0,0(sp)
    80004490:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004494:	00000593          	li	a1,0
    80004498:	00000097          	auipc	ra,0x0
    8000449c:	a10080e7          	jalr	-1520(ra) # 80003ea8 <_ZN7WorkerD11workerBodyDEPv>
    }
    800044a0:	00813083          	ld	ra,8(sp)
    800044a4:	00013403          	ld	s0,0(sp)
    800044a8:	01010113          	addi	sp,sp,16
    800044ac:	00008067          	ret

00000000800044b0 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800044b0:	f8010113          	addi	sp,sp,-128
    800044b4:	06113c23          	sd	ra,120(sp)
    800044b8:	06813823          	sd	s0,112(sp)
    800044bc:	06913423          	sd	s1,104(sp)
    800044c0:	07213023          	sd	s2,96(sp)
    800044c4:	05313c23          	sd	s3,88(sp)
    800044c8:	05413823          	sd	s4,80(sp)
    800044cc:	05513423          	sd	s5,72(sp)
    800044d0:	05613023          	sd	s6,64(sp)
    800044d4:	03713c23          	sd	s7,56(sp)
    800044d8:	03813823          	sd	s8,48(sp)
    800044dc:	03913423          	sd	s9,40(sp)
    800044e0:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800044e4:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800044e8:	00006517          	auipc	a0,0x6
    800044ec:	d0050513          	addi	a0,a0,-768 # 8000a1e8 <CONSOLE_STATUS+0x1d8>
    800044f0:	00001097          	auipc	ra,0x1
    800044f4:	5a8080e7          	jalr	1448(ra) # 80005a98 <_Z11printStringPKc>
    getString(input, 30);
    800044f8:	01e00593          	li	a1,30
    800044fc:	f8040493          	addi	s1,s0,-128
    80004500:	00048513          	mv	a0,s1
    80004504:	00001097          	auipc	ra,0x1
    80004508:	61c080e7          	jalr	1564(ra) # 80005b20 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000450c:	00048513          	mv	a0,s1
    80004510:	00001097          	auipc	ra,0x1
    80004514:	6e8080e7          	jalr	1768(ra) # 80005bf8 <_Z11stringToIntPKc>
    80004518:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    8000451c:	00006517          	auipc	a0,0x6
    80004520:	cec50513          	addi	a0,a0,-788 # 8000a208 <CONSOLE_STATUS+0x1f8>
    80004524:	00001097          	auipc	ra,0x1
    80004528:	574080e7          	jalr	1396(ra) # 80005a98 <_Z11printStringPKc>
    getString(input, 30);
    8000452c:	01e00593          	li	a1,30
    80004530:	00048513          	mv	a0,s1
    80004534:	00001097          	auipc	ra,0x1
    80004538:	5ec080e7          	jalr	1516(ra) # 80005b20 <_Z9getStringPci>
    n = stringToInt(input);
    8000453c:	00048513          	mv	a0,s1
    80004540:	00001097          	auipc	ra,0x1
    80004544:	6b8080e7          	jalr	1720(ra) # 80005bf8 <_Z11stringToIntPKc>
    80004548:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    8000454c:	00006517          	auipc	a0,0x6
    80004550:	cdc50513          	addi	a0,a0,-804 # 8000a228 <CONSOLE_STATUS+0x218>
    80004554:	00001097          	auipc	ra,0x1
    80004558:	544080e7          	jalr	1348(ra) # 80005a98 <_Z11printStringPKc>
    printInt(threadNum);
    8000455c:	00000613          	li	a2,0
    80004560:	00a00593          	li	a1,10
    80004564:	00098513          	mv	a0,s3
    80004568:	00001097          	auipc	ra,0x1
    8000456c:	6e0080e7          	jalr	1760(ra) # 80005c48 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004570:	00006517          	auipc	a0,0x6
    80004574:	cd050513          	addi	a0,a0,-816 # 8000a240 <CONSOLE_STATUS+0x230>
    80004578:	00001097          	auipc	ra,0x1
    8000457c:	520080e7          	jalr	1312(ra) # 80005a98 <_Z11printStringPKc>
    printInt(n);
    80004580:	00000613          	li	a2,0
    80004584:	00a00593          	li	a1,10
    80004588:	00048513          	mv	a0,s1
    8000458c:	00001097          	auipc	ra,0x1
    80004590:	6bc080e7          	jalr	1724(ra) # 80005c48 <_Z8printIntiii>
    printString(".\n");
    80004594:	00006517          	auipc	a0,0x6
    80004598:	cc450513          	addi	a0,a0,-828 # 8000a258 <CONSOLE_STATUS+0x248>
    8000459c:	00001097          	auipc	ra,0x1
    800045a0:	4fc080e7          	jalr	1276(ra) # 80005a98 <_Z11printStringPKc>
    if (threadNum > n) {
    800045a4:	0334c463          	blt	s1,s3,800045cc <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800045a8:	03305c63          	blez	s3,800045e0 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800045ac:	03800513          	li	a0,56
    800045b0:	ffffe097          	auipc	ra,0xffffe
    800045b4:	2d0080e7          	jalr	720(ra) # 80002880 <_Znwm>
    800045b8:	00050a93          	mv	s5,a0
    800045bc:	00048593          	mv	a1,s1
    800045c0:	00001097          	auipc	ra,0x1
    800045c4:	7a8080e7          	jalr	1960(ra) # 80005d68 <_ZN9BufferCPPC1Ei>
    800045c8:	0300006f          	j	800045f8 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800045cc:	00006517          	auipc	a0,0x6
    800045d0:	c9450513          	addi	a0,a0,-876 # 8000a260 <CONSOLE_STATUS+0x250>
    800045d4:	00001097          	auipc	ra,0x1
    800045d8:	4c4080e7          	jalr	1220(ra) # 80005a98 <_Z11printStringPKc>
        return;
    800045dc:	0140006f          	j	800045f0 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800045e0:	00006517          	auipc	a0,0x6
    800045e4:	cc050513          	addi	a0,a0,-832 # 8000a2a0 <CONSOLE_STATUS+0x290>
    800045e8:	00001097          	auipc	ra,0x1
    800045ec:	4b0080e7          	jalr	1200(ra) # 80005a98 <_Z11printStringPKc>
        return;
    800045f0:	000c0113          	mv	sp,s8
    800045f4:	2140006f          	j	80004808 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    800045f8:	01000513          	li	a0,16
    800045fc:	ffffe097          	auipc	ra,0xffffe
    80004600:	284080e7          	jalr	644(ra) # 80002880 <_Znwm>
    80004604:	00050913          	mv	s2,a0
    80004608:	00000593          	li	a1,0
    8000460c:	ffffe097          	auipc	ra,0xffffe
    80004610:	5d8080e7          	jalr	1496(ra) # 80002be4 <_ZN9SemaphoreC1Ej>
    80004614:	00008797          	auipc	a5,0x8
    80004618:	7b27b623          	sd	s2,1964(a5) # 8000cdc0 <_ZL10waitForAll>
    Thread *producers[threadNum];
    8000461c:	00399793          	slli	a5,s3,0x3
    80004620:	00f78793          	addi	a5,a5,15
    80004624:	ff07f793          	andi	a5,a5,-16
    80004628:	40f10133          	sub	sp,sp,a5
    8000462c:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004630:	0019871b          	addiw	a4,s3,1
    80004634:	00171793          	slli	a5,a4,0x1
    80004638:	00e787b3          	add	a5,a5,a4
    8000463c:	00379793          	slli	a5,a5,0x3
    80004640:	00f78793          	addi	a5,a5,15
    80004644:	ff07f793          	andi	a5,a5,-16
    80004648:	40f10133          	sub	sp,sp,a5
    8000464c:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004650:	00199493          	slli	s1,s3,0x1
    80004654:	013484b3          	add	s1,s1,s3
    80004658:	00349493          	slli	s1,s1,0x3
    8000465c:	009b04b3          	add	s1,s6,s1
    80004660:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004664:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004668:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    8000466c:	02800513          	li	a0,40
    80004670:	ffffe097          	auipc	ra,0xffffe
    80004674:	210080e7          	jalr	528(ra) # 80002880 <_Znwm>
    80004678:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    8000467c:	ffffe097          	auipc	ra,0xffffe
    80004680:	4ec080e7          	jalr	1260(ra) # 80002b68 <_ZN6ThreadC1Ev>
    80004684:	00008797          	auipc	a5,0x8
    80004688:	48c78793          	addi	a5,a5,1164 # 8000cb10 <_ZTV8Consumer+0x10>
    8000468c:	00fbb023          	sd	a5,0(s7)
    80004690:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004694:	000b8513          	mv	a0,s7
    80004698:	ffffe097          	auipc	ra,0xffffe
    8000469c:	3a0080e7          	jalr	928(ra) # 80002a38 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800046a0:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800046a4:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800046a8:	00008797          	auipc	a5,0x8
    800046ac:	7187b783          	ld	a5,1816(a5) # 8000cdc0 <_ZL10waitForAll>
    800046b0:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800046b4:	02800513          	li	a0,40
    800046b8:	ffffe097          	auipc	ra,0xffffe
    800046bc:	1c8080e7          	jalr	456(ra) # 80002880 <_Znwm>
    800046c0:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800046c4:	ffffe097          	auipc	ra,0xffffe
    800046c8:	4a4080e7          	jalr	1188(ra) # 80002b68 <_ZN6ThreadC1Ev>
    800046cc:	00008797          	auipc	a5,0x8
    800046d0:	3f478793          	addi	a5,a5,1012 # 8000cac0 <_ZTV16ProducerKeyborad+0x10>
    800046d4:	00f4b023          	sd	a5,0(s1)
    800046d8:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800046dc:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800046e0:	00048513          	mv	a0,s1
    800046e4:	ffffe097          	auipc	ra,0xffffe
    800046e8:	354080e7          	jalr	852(ra) # 80002a38 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800046ec:	00100913          	li	s2,1
    800046f0:	0300006f          	j	80004720 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800046f4:	00008797          	auipc	a5,0x8
    800046f8:	3f478793          	addi	a5,a5,1012 # 8000cae8 <_ZTV8Producer+0x10>
    800046fc:	00fcb023          	sd	a5,0(s9)
    80004700:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004704:	00391793          	slli	a5,s2,0x3
    80004708:	00fa07b3          	add	a5,s4,a5
    8000470c:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004710:	000c8513          	mv	a0,s9
    80004714:	ffffe097          	auipc	ra,0xffffe
    80004718:	324080e7          	jalr	804(ra) # 80002a38 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000471c:	0019091b          	addiw	s2,s2,1
    80004720:	05395263          	bge	s2,s3,80004764 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004724:	00191493          	slli	s1,s2,0x1
    80004728:	012484b3          	add	s1,s1,s2
    8000472c:	00349493          	slli	s1,s1,0x3
    80004730:	009b04b3          	add	s1,s6,s1
    80004734:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004738:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    8000473c:	00008797          	auipc	a5,0x8
    80004740:	6847b783          	ld	a5,1668(a5) # 8000cdc0 <_ZL10waitForAll>
    80004744:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004748:	02800513          	li	a0,40
    8000474c:	ffffe097          	auipc	ra,0xffffe
    80004750:	134080e7          	jalr	308(ra) # 80002880 <_Znwm>
    80004754:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004758:	ffffe097          	auipc	ra,0xffffe
    8000475c:	410080e7          	jalr	1040(ra) # 80002b68 <_ZN6ThreadC1Ev>
    80004760:	f95ff06f          	j	800046f4 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004764:	ffffe097          	auipc	ra,0xffffe
    80004768:	348080e7          	jalr	840(ra) # 80002aac <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    8000476c:	00000493          	li	s1,0
    80004770:	0099ce63          	blt	s3,s1,8000478c <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004774:	00008517          	auipc	a0,0x8
    80004778:	64c53503          	ld	a0,1612(a0) # 8000cdc0 <_ZL10waitForAll>
    8000477c:	ffffe097          	auipc	ra,0xffffe
    80004780:	4a0080e7          	jalr	1184(ra) # 80002c1c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004784:	0014849b          	addiw	s1,s1,1
    80004788:	fe9ff06f          	j	80004770 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    8000478c:	00008517          	auipc	a0,0x8
    80004790:	63453503          	ld	a0,1588(a0) # 8000cdc0 <_ZL10waitForAll>
    80004794:	00050863          	beqz	a0,800047a4 <_Z20testConsumerProducerv+0x2f4>
    80004798:	00053783          	ld	a5,0(a0)
    8000479c:	0087b783          	ld	a5,8(a5)
    800047a0:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800047a4:	00000493          	li	s1,0
    800047a8:	0080006f          	j	800047b0 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800047ac:	0014849b          	addiw	s1,s1,1
    800047b0:	0334d263          	bge	s1,s3,800047d4 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800047b4:	00349793          	slli	a5,s1,0x3
    800047b8:	00fa07b3          	add	a5,s4,a5
    800047bc:	0007b503          	ld	a0,0(a5)
    800047c0:	fe0506e3          	beqz	a0,800047ac <_Z20testConsumerProducerv+0x2fc>
    800047c4:	00053783          	ld	a5,0(a0)
    800047c8:	0087b783          	ld	a5,8(a5)
    800047cc:	000780e7          	jalr	a5
    800047d0:	fddff06f          	j	800047ac <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    800047d4:	000b8a63          	beqz	s7,800047e8 <_Z20testConsumerProducerv+0x338>
    800047d8:	000bb783          	ld	a5,0(s7)
    800047dc:	0087b783          	ld	a5,8(a5)
    800047e0:	000b8513          	mv	a0,s7
    800047e4:	000780e7          	jalr	a5
    delete buffer;
    800047e8:	000a8e63          	beqz	s5,80004804 <_Z20testConsumerProducerv+0x354>
    800047ec:	000a8513          	mv	a0,s5
    800047f0:	00002097          	auipc	ra,0x2
    800047f4:	870080e7          	jalr	-1936(ra) # 80006060 <_ZN9BufferCPPD1Ev>
    800047f8:	000a8513          	mv	a0,s5
    800047fc:	ffffe097          	auipc	ra,0xffffe
    80004800:	0d4080e7          	jalr	212(ra) # 800028d0 <_ZdlPv>
    80004804:	000c0113          	mv	sp,s8
}
    80004808:	f8040113          	addi	sp,s0,-128
    8000480c:	07813083          	ld	ra,120(sp)
    80004810:	07013403          	ld	s0,112(sp)
    80004814:	06813483          	ld	s1,104(sp)
    80004818:	06013903          	ld	s2,96(sp)
    8000481c:	05813983          	ld	s3,88(sp)
    80004820:	05013a03          	ld	s4,80(sp)
    80004824:	04813a83          	ld	s5,72(sp)
    80004828:	04013b03          	ld	s6,64(sp)
    8000482c:	03813b83          	ld	s7,56(sp)
    80004830:	03013c03          	ld	s8,48(sp)
    80004834:	02813c83          	ld	s9,40(sp)
    80004838:	08010113          	addi	sp,sp,128
    8000483c:	00008067          	ret
    80004840:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004844:	000a8513          	mv	a0,s5
    80004848:	ffffe097          	auipc	ra,0xffffe
    8000484c:	088080e7          	jalr	136(ra) # 800028d0 <_ZdlPv>
    80004850:	00048513          	mv	a0,s1
    80004854:	00009097          	auipc	ra,0x9
    80004858:	684080e7          	jalr	1668(ra) # 8000ded8 <_Unwind_Resume>
    8000485c:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004860:	00090513          	mv	a0,s2
    80004864:	ffffe097          	auipc	ra,0xffffe
    80004868:	06c080e7          	jalr	108(ra) # 800028d0 <_ZdlPv>
    8000486c:	00048513          	mv	a0,s1
    80004870:	00009097          	auipc	ra,0x9
    80004874:	668080e7          	jalr	1640(ra) # 8000ded8 <_Unwind_Resume>
    80004878:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    8000487c:	000b8513          	mv	a0,s7
    80004880:	ffffe097          	auipc	ra,0xffffe
    80004884:	050080e7          	jalr	80(ra) # 800028d0 <_ZdlPv>
    80004888:	00048513          	mv	a0,s1
    8000488c:	00009097          	auipc	ra,0x9
    80004890:	64c080e7          	jalr	1612(ra) # 8000ded8 <_Unwind_Resume>
    80004894:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004898:	00048513          	mv	a0,s1
    8000489c:	ffffe097          	auipc	ra,0xffffe
    800048a0:	034080e7          	jalr	52(ra) # 800028d0 <_ZdlPv>
    800048a4:	00090513          	mv	a0,s2
    800048a8:	00009097          	auipc	ra,0x9
    800048ac:	630080e7          	jalr	1584(ra) # 8000ded8 <_Unwind_Resume>
    800048b0:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800048b4:	000c8513          	mv	a0,s9
    800048b8:	ffffe097          	auipc	ra,0xffffe
    800048bc:	018080e7          	jalr	24(ra) # 800028d0 <_ZdlPv>
    800048c0:	00048513          	mv	a0,s1
    800048c4:	00009097          	auipc	ra,0x9
    800048c8:	614080e7          	jalr	1556(ra) # 8000ded8 <_Unwind_Resume>

00000000800048cc <_ZN8Consumer3runEv>:
    void run() override {
    800048cc:	fd010113          	addi	sp,sp,-48
    800048d0:	02113423          	sd	ra,40(sp)
    800048d4:	02813023          	sd	s0,32(sp)
    800048d8:	00913c23          	sd	s1,24(sp)
    800048dc:	01213823          	sd	s2,16(sp)
    800048e0:	01313423          	sd	s3,8(sp)
    800048e4:	03010413          	addi	s0,sp,48
    800048e8:	00050913          	mv	s2,a0
        int i = 0;
    800048ec:	00000993          	li	s3,0
    800048f0:	0100006f          	j	80004900 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800048f4:	00a00513          	li	a0,10
    800048f8:	ffffe097          	auipc	ra,0xffffe
    800048fc:	414080e7          	jalr	1044(ra) # 80002d0c <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004900:	00008797          	auipc	a5,0x8
    80004904:	4b87a783          	lw	a5,1208(a5) # 8000cdb8 <_ZL9threadEnd>
    80004908:	04079a63          	bnez	a5,8000495c <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    8000490c:	02093783          	ld	a5,32(s2)
    80004910:	0087b503          	ld	a0,8(a5)
    80004914:	00001097          	auipc	ra,0x1
    80004918:	638080e7          	jalr	1592(ra) # 80005f4c <_ZN9BufferCPP3getEv>
            i++;
    8000491c:	0019849b          	addiw	s1,s3,1
    80004920:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004924:	0ff57513          	andi	a0,a0,255
    80004928:	ffffe097          	auipc	ra,0xffffe
    8000492c:	3e4080e7          	jalr	996(ra) # 80002d0c <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004930:	05000793          	li	a5,80
    80004934:	02f4e4bb          	remw	s1,s1,a5
    80004938:	fc0494e3          	bnez	s1,80004900 <_ZN8Consumer3runEv+0x34>
    8000493c:	fb9ff06f          	j	800048f4 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004940:	02093783          	ld	a5,32(s2)
    80004944:	0087b503          	ld	a0,8(a5)
    80004948:	00001097          	auipc	ra,0x1
    8000494c:	604080e7          	jalr	1540(ra) # 80005f4c <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004950:	0ff57513          	andi	a0,a0,255
    80004954:	ffffe097          	auipc	ra,0xffffe
    80004958:	3b8080e7          	jalr	952(ra) # 80002d0c <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    8000495c:	02093783          	ld	a5,32(s2)
    80004960:	0087b503          	ld	a0,8(a5)
    80004964:	00001097          	auipc	ra,0x1
    80004968:	674080e7          	jalr	1652(ra) # 80005fd8 <_ZN9BufferCPP6getCntEv>
    8000496c:	fca04ae3          	bgtz	a0,80004940 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004970:	02093783          	ld	a5,32(s2)
    80004974:	0107b503          	ld	a0,16(a5)
    80004978:	ffffe097          	auipc	ra,0xffffe
    8000497c:	2d0080e7          	jalr	720(ra) # 80002c48 <_ZN9Semaphore6signalEv>
    }
    80004980:	02813083          	ld	ra,40(sp)
    80004984:	02013403          	ld	s0,32(sp)
    80004988:	01813483          	ld	s1,24(sp)
    8000498c:	01013903          	ld	s2,16(sp)
    80004990:	00813983          	ld	s3,8(sp)
    80004994:	03010113          	addi	sp,sp,48
    80004998:	00008067          	ret

000000008000499c <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    8000499c:	ff010113          	addi	sp,sp,-16
    800049a0:	00113423          	sd	ra,8(sp)
    800049a4:	00813023          	sd	s0,0(sp)
    800049a8:	01010413          	addi	s0,sp,16
    800049ac:	00008797          	auipc	a5,0x8
    800049b0:	16478793          	addi	a5,a5,356 # 8000cb10 <_ZTV8Consumer+0x10>
    800049b4:	00f53023          	sd	a5,0(a0)
    800049b8:	ffffe097          	auipc	ra,0xffffe
    800049bc:	dd8080e7          	jalr	-552(ra) # 80002790 <_ZN6ThreadD1Ev>
    800049c0:	00813083          	ld	ra,8(sp)
    800049c4:	00013403          	ld	s0,0(sp)
    800049c8:	01010113          	addi	sp,sp,16
    800049cc:	00008067          	ret

00000000800049d0 <_ZN8ConsumerD0Ev>:
    800049d0:	fe010113          	addi	sp,sp,-32
    800049d4:	00113c23          	sd	ra,24(sp)
    800049d8:	00813823          	sd	s0,16(sp)
    800049dc:	00913423          	sd	s1,8(sp)
    800049e0:	02010413          	addi	s0,sp,32
    800049e4:	00050493          	mv	s1,a0
    800049e8:	00008797          	auipc	a5,0x8
    800049ec:	12878793          	addi	a5,a5,296 # 8000cb10 <_ZTV8Consumer+0x10>
    800049f0:	00f53023          	sd	a5,0(a0)
    800049f4:	ffffe097          	auipc	ra,0xffffe
    800049f8:	d9c080e7          	jalr	-612(ra) # 80002790 <_ZN6ThreadD1Ev>
    800049fc:	00048513          	mv	a0,s1
    80004a00:	ffffe097          	auipc	ra,0xffffe
    80004a04:	ed0080e7          	jalr	-304(ra) # 800028d0 <_ZdlPv>
    80004a08:	01813083          	ld	ra,24(sp)
    80004a0c:	01013403          	ld	s0,16(sp)
    80004a10:	00813483          	ld	s1,8(sp)
    80004a14:	02010113          	addi	sp,sp,32
    80004a18:	00008067          	ret

0000000080004a1c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004a1c:	ff010113          	addi	sp,sp,-16
    80004a20:	00113423          	sd	ra,8(sp)
    80004a24:	00813023          	sd	s0,0(sp)
    80004a28:	01010413          	addi	s0,sp,16
    80004a2c:	00008797          	auipc	a5,0x8
    80004a30:	09478793          	addi	a5,a5,148 # 8000cac0 <_ZTV16ProducerKeyborad+0x10>
    80004a34:	00f53023          	sd	a5,0(a0)
    80004a38:	ffffe097          	auipc	ra,0xffffe
    80004a3c:	d58080e7          	jalr	-680(ra) # 80002790 <_ZN6ThreadD1Ev>
    80004a40:	00813083          	ld	ra,8(sp)
    80004a44:	00013403          	ld	s0,0(sp)
    80004a48:	01010113          	addi	sp,sp,16
    80004a4c:	00008067          	ret

0000000080004a50 <_ZN16ProducerKeyboradD0Ev>:
    80004a50:	fe010113          	addi	sp,sp,-32
    80004a54:	00113c23          	sd	ra,24(sp)
    80004a58:	00813823          	sd	s0,16(sp)
    80004a5c:	00913423          	sd	s1,8(sp)
    80004a60:	02010413          	addi	s0,sp,32
    80004a64:	00050493          	mv	s1,a0
    80004a68:	00008797          	auipc	a5,0x8
    80004a6c:	05878793          	addi	a5,a5,88 # 8000cac0 <_ZTV16ProducerKeyborad+0x10>
    80004a70:	00f53023          	sd	a5,0(a0)
    80004a74:	ffffe097          	auipc	ra,0xffffe
    80004a78:	d1c080e7          	jalr	-740(ra) # 80002790 <_ZN6ThreadD1Ev>
    80004a7c:	00048513          	mv	a0,s1
    80004a80:	ffffe097          	auipc	ra,0xffffe
    80004a84:	e50080e7          	jalr	-432(ra) # 800028d0 <_ZdlPv>
    80004a88:	01813083          	ld	ra,24(sp)
    80004a8c:	01013403          	ld	s0,16(sp)
    80004a90:	00813483          	ld	s1,8(sp)
    80004a94:	02010113          	addi	sp,sp,32
    80004a98:	00008067          	ret

0000000080004a9c <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004a9c:	ff010113          	addi	sp,sp,-16
    80004aa0:	00113423          	sd	ra,8(sp)
    80004aa4:	00813023          	sd	s0,0(sp)
    80004aa8:	01010413          	addi	s0,sp,16
    80004aac:	00008797          	auipc	a5,0x8
    80004ab0:	03c78793          	addi	a5,a5,60 # 8000cae8 <_ZTV8Producer+0x10>
    80004ab4:	00f53023          	sd	a5,0(a0)
    80004ab8:	ffffe097          	auipc	ra,0xffffe
    80004abc:	cd8080e7          	jalr	-808(ra) # 80002790 <_ZN6ThreadD1Ev>
    80004ac0:	00813083          	ld	ra,8(sp)
    80004ac4:	00013403          	ld	s0,0(sp)
    80004ac8:	01010113          	addi	sp,sp,16
    80004acc:	00008067          	ret

0000000080004ad0 <_ZN8ProducerD0Ev>:
    80004ad0:	fe010113          	addi	sp,sp,-32
    80004ad4:	00113c23          	sd	ra,24(sp)
    80004ad8:	00813823          	sd	s0,16(sp)
    80004adc:	00913423          	sd	s1,8(sp)
    80004ae0:	02010413          	addi	s0,sp,32
    80004ae4:	00050493          	mv	s1,a0
    80004ae8:	00008797          	auipc	a5,0x8
    80004aec:	00078793          	mv	a5,a5
    80004af0:	00f53023          	sd	a5,0(a0)
    80004af4:	ffffe097          	auipc	ra,0xffffe
    80004af8:	c9c080e7          	jalr	-868(ra) # 80002790 <_ZN6ThreadD1Ev>
    80004afc:	00048513          	mv	a0,s1
    80004b00:	ffffe097          	auipc	ra,0xffffe
    80004b04:	dd0080e7          	jalr	-560(ra) # 800028d0 <_ZdlPv>
    80004b08:	01813083          	ld	ra,24(sp)
    80004b0c:	01013403          	ld	s0,16(sp)
    80004b10:	00813483          	ld	s1,8(sp)
    80004b14:	02010113          	addi	sp,sp,32
    80004b18:	00008067          	ret

0000000080004b1c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004b1c:	fe010113          	addi	sp,sp,-32
    80004b20:	00113c23          	sd	ra,24(sp)
    80004b24:	00813823          	sd	s0,16(sp)
    80004b28:	00913423          	sd	s1,8(sp)
    80004b2c:	02010413          	addi	s0,sp,32
    80004b30:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004b34:	ffffd097          	auipc	ra,0xffffd
    80004b38:	a40080e7          	jalr	-1472(ra) # 80001574 <_Z4getcv>
    80004b3c:	0005059b          	sext.w	a1,a0
    80004b40:	01b00793          	li	a5,27
    80004b44:	00f58c63          	beq	a1,a5,80004b5c <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004b48:	0204b783          	ld	a5,32(s1)
    80004b4c:	0087b503          	ld	a0,8(a5) # 8000caf0 <_ZTV8Producer+0x18>
    80004b50:	00001097          	auipc	ra,0x1
    80004b54:	36c080e7          	jalr	876(ra) # 80005ebc <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004b58:	fddff06f          	j	80004b34 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004b5c:	00100793          	li	a5,1
    80004b60:	00008717          	auipc	a4,0x8
    80004b64:	24f72c23          	sw	a5,600(a4) # 8000cdb8 <_ZL9threadEnd>
        td->buffer->put('!');
    80004b68:	0204b783          	ld	a5,32(s1)
    80004b6c:	02100593          	li	a1,33
    80004b70:	0087b503          	ld	a0,8(a5)
    80004b74:	00001097          	auipc	ra,0x1
    80004b78:	348080e7          	jalr	840(ra) # 80005ebc <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004b7c:	0204b783          	ld	a5,32(s1)
    80004b80:	0107b503          	ld	a0,16(a5)
    80004b84:	ffffe097          	auipc	ra,0xffffe
    80004b88:	0c4080e7          	jalr	196(ra) # 80002c48 <_ZN9Semaphore6signalEv>
    }
    80004b8c:	01813083          	ld	ra,24(sp)
    80004b90:	01013403          	ld	s0,16(sp)
    80004b94:	00813483          	ld	s1,8(sp)
    80004b98:	02010113          	addi	sp,sp,32
    80004b9c:	00008067          	ret

0000000080004ba0 <_ZN8Producer3runEv>:
    void run() override {
    80004ba0:	fe010113          	addi	sp,sp,-32
    80004ba4:	00113c23          	sd	ra,24(sp)
    80004ba8:	00813823          	sd	s0,16(sp)
    80004bac:	00913423          	sd	s1,8(sp)
    80004bb0:	01213023          	sd	s2,0(sp)
    80004bb4:	02010413          	addi	s0,sp,32
    80004bb8:	00050493          	mv	s1,a0
        int i = 0;
    80004bbc:	00000913          	li	s2,0
        while (!threadEnd) {
    80004bc0:	00008797          	auipc	a5,0x8
    80004bc4:	1f87a783          	lw	a5,504(a5) # 8000cdb8 <_ZL9threadEnd>
    80004bc8:	04079263          	bnez	a5,80004c0c <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004bcc:	0204b783          	ld	a5,32(s1)
    80004bd0:	0007a583          	lw	a1,0(a5)
    80004bd4:	0305859b          	addiw	a1,a1,48
    80004bd8:	0087b503          	ld	a0,8(a5)
    80004bdc:	00001097          	auipc	ra,0x1
    80004be0:	2e0080e7          	jalr	736(ra) # 80005ebc <_ZN9BufferCPP3putEi>
            i++;
    80004be4:	0019071b          	addiw	a4,s2,1
    80004be8:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004bec:	0204b783          	ld	a5,32(s1)
    80004bf0:	0007a783          	lw	a5,0(a5)
    80004bf4:	00e787bb          	addw	a5,a5,a4
    80004bf8:	00500513          	li	a0,5
    80004bfc:	02a7e53b          	remw	a0,a5,a0
    80004c00:	ffffe097          	auipc	ra,0xffffe
    80004c04:	ed4080e7          	jalr	-300(ra) # 80002ad4 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004c08:	fb9ff06f          	j	80004bc0 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004c0c:	0204b783          	ld	a5,32(s1)
    80004c10:	0107b503          	ld	a0,16(a5)
    80004c14:	ffffe097          	auipc	ra,0xffffe
    80004c18:	034080e7          	jalr	52(ra) # 80002c48 <_ZN9Semaphore6signalEv>
    }
    80004c1c:	01813083          	ld	ra,24(sp)
    80004c20:	01013403          	ld	s0,16(sp)
    80004c24:	00813483          	ld	s1,8(sp)
    80004c28:	00013903          	ld	s2,0(sp)
    80004c2c:	02010113          	addi	sp,sp,32
    80004c30:	00008067          	ret

0000000080004c34 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004c34:	fe010113          	addi	sp,sp,-32
    80004c38:	00113c23          	sd	ra,24(sp)
    80004c3c:	00813823          	sd	s0,16(sp)
    80004c40:	00913423          	sd	s1,8(sp)
    80004c44:	01213023          	sd	s2,0(sp)
    80004c48:	02010413          	addi	s0,sp,32
    80004c4c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004c50:	00100793          	li	a5,1
    80004c54:	02a7f863          	bgeu	a5,a0,80004c84 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004c58:	00a00793          	li	a5,10
    80004c5c:	02f577b3          	remu	a5,a0,a5
    80004c60:	02078e63          	beqz	a5,80004c9c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004c64:	fff48513          	addi	a0,s1,-1
    80004c68:	00000097          	auipc	ra,0x0
    80004c6c:	fcc080e7          	jalr	-52(ra) # 80004c34 <_ZL9fibonaccim>
    80004c70:	00050913          	mv	s2,a0
    80004c74:	ffe48513          	addi	a0,s1,-2
    80004c78:	00000097          	auipc	ra,0x0
    80004c7c:	fbc080e7          	jalr	-68(ra) # 80004c34 <_ZL9fibonaccim>
    80004c80:	00a90533          	add	a0,s2,a0
}
    80004c84:	01813083          	ld	ra,24(sp)
    80004c88:	01013403          	ld	s0,16(sp)
    80004c8c:	00813483          	ld	s1,8(sp)
    80004c90:	00013903          	ld	s2,0(sp)
    80004c94:	02010113          	addi	sp,sp,32
    80004c98:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004c9c:	ffffc097          	auipc	ra,0xffffc
    80004ca0:	798080e7          	jalr	1944(ra) # 80001434 <_Z15thread_dispatchv>
    80004ca4:	fc1ff06f          	j	80004c64 <_ZL9fibonaccim+0x30>

0000000080004ca8 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004ca8:	fe010113          	addi	sp,sp,-32
    80004cac:	00113c23          	sd	ra,24(sp)
    80004cb0:	00813823          	sd	s0,16(sp)
    80004cb4:	00913423          	sd	s1,8(sp)
    80004cb8:	01213023          	sd	s2,0(sp)
    80004cbc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004cc0:	00a00493          	li	s1,10
    80004cc4:	0400006f          	j	80004d04 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004cc8:	00005517          	auipc	a0,0x5
    80004ccc:	67850513          	addi	a0,a0,1656 # 8000a340 <CONSOLE_STATUS+0x330>
    80004cd0:	00001097          	auipc	ra,0x1
    80004cd4:	dc8080e7          	jalr	-568(ra) # 80005a98 <_Z11printStringPKc>
    80004cd8:	00000613          	li	a2,0
    80004cdc:	00a00593          	li	a1,10
    80004ce0:	00048513          	mv	a0,s1
    80004ce4:	00001097          	auipc	ra,0x1
    80004ce8:	f64080e7          	jalr	-156(ra) # 80005c48 <_Z8printIntiii>
    80004cec:	00006517          	auipc	a0,0x6
    80004cf0:	84450513          	addi	a0,a0,-1980 # 8000a530 <CONSOLE_STATUS+0x520>
    80004cf4:	00001097          	auipc	ra,0x1
    80004cf8:	da4080e7          	jalr	-604(ra) # 80005a98 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004cfc:	0014849b          	addiw	s1,s1,1
    80004d00:	0ff4f493          	andi	s1,s1,255
    80004d04:	00c00793          	li	a5,12
    80004d08:	fc97f0e3          	bgeu	a5,s1,80004cc8 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004d0c:	00005517          	auipc	a0,0x5
    80004d10:	63c50513          	addi	a0,a0,1596 # 8000a348 <CONSOLE_STATUS+0x338>
    80004d14:	00001097          	auipc	ra,0x1
    80004d18:	d84080e7          	jalr	-636(ra) # 80005a98 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004d1c:	00500313          	li	t1,5
    thread_dispatch();
    80004d20:	ffffc097          	auipc	ra,0xffffc
    80004d24:	714080e7          	jalr	1812(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004d28:	01000513          	li	a0,16
    80004d2c:	00000097          	auipc	ra,0x0
    80004d30:	f08080e7          	jalr	-248(ra) # 80004c34 <_ZL9fibonaccim>
    80004d34:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004d38:	00005517          	auipc	a0,0x5
    80004d3c:	62050513          	addi	a0,a0,1568 # 8000a358 <CONSOLE_STATUS+0x348>
    80004d40:	00001097          	auipc	ra,0x1
    80004d44:	d58080e7          	jalr	-680(ra) # 80005a98 <_Z11printStringPKc>
    80004d48:	00000613          	li	a2,0
    80004d4c:	00a00593          	li	a1,10
    80004d50:	0009051b          	sext.w	a0,s2
    80004d54:	00001097          	auipc	ra,0x1
    80004d58:	ef4080e7          	jalr	-268(ra) # 80005c48 <_Z8printIntiii>
    80004d5c:	00005517          	auipc	a0,0x5
    80004d60:	7d450513          	addi	a0,a0,2004 # 8000a530 <CONSOLE_STATUS+0x520>
    80004d64:	00001097          	auipc	ra,0x1
    80004d68:	d34080e7          	jalr	-716(ra) # 80005a98 <_Z11printStringPKc>
    80004d6c:	0400006f          	j	80004dac <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004d70:	00005517          	auipc	a0,0x5
    80004d74:	5d050513          	addi	a0,a0,1488 # 8000a340 <CONSOLE_STATUS+0x330>
    80004d78:	00001097          	auipc	ra,0x1
    80004d7c:	d20080e7          	jalr	-736(ra) # 80005a98 <_Z11printStringPKc>
    80004d80:	00000613          	li	a2,0
    80004d84:	00a00593          	li	a1,10
    80004d88:	00048513          	mv	a0,s1
    80004d8c:	00001097          	auipc	ra,0x1
    80004d90:	ebc080e7          	jalr	-324(ra) # 80005c48 <_Z8printIntiii>
    80004d94:	00005517          	auipc	a0,0x5
    80004d98:	79c50513          	addi	a0,a0,1948 # 8000a530 <CONSOLE_STATUS+0x520>
    80004d9c:	00001097          	auipc	ra,0x1
    80004da0:	cfc080e7          	jalr	-772(ra) # 80005a98 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004da4:	0014849b          	addiw	s1,s1,1
    80004da8:	0ff4f493          	andi	s1,s1,255
    80004dac:	00f00793          	li	a5,15
    80004db0:	fc97f0e3          	bgeu	a5,s1,80004d70 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004db4:	00005517          	auipc	a0,0x5
    80004db8:	5b450513          	addi	a0,a0,1460 # 8000a368 <CONSOLE_STATUS+0x358>
    80004dbc:	00001097          	auipc	ra,0x1
    80004dc0:	cdc080e7          	jalr	-804(ra) # 80005a98 <_Z11printStringPKc>
    finishedD = true;
    80004dc4:	00100793          	li	a5,1
    80004dc8:	00008717          	auipc	a4,0x8
    80004dcc:	00f70023          	sb	a5,0(a4) # 8000cdc8 <_ZL9finishedD>
    thread_dispatch();
    80004dd0:	ffffc097          	auipc	ra,0xffffc
    80004dd4:	664080e7          	jalr	1636(ra) # 80001434 <_Z15thread_dispatchv>
}
    80004dd8:	01813083          	ld	ra,24(sp)
    80004ddc:	01013403          	ld	s0,16(sp)
    80004de0:	00813483          	ld	s1,8(sp)
    80004de4:	00013903          	ld	s2,0(sp)
    80004de8:	02010113          	addi	sp,sp,32
    80004dec:	00008067          	ret

0000000080004df0 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004df0:	fe010113          	addi	sp,sp,-32
    80004df4:	00113c23          	sd	ra,24(sp)
    80004df8:	00813823          	sd	s0,16(sp)
    80004dfc:	00913423          	sd	s1,8(sp)
    80004e00:	01213023          	sd	s2,0(sp)
    80004e04:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004e08:	00000493          	li	s1,0
    80004e0c:	0400006f          	j	80004e4c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004e10:	00005517          	auipc	a0,0x5
    80004e14:	4f050513          	addi	a0,a0,1264 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80004e18:	00001097          	auipc	ra,0x1
    80004e1c:	c80080e7          	jalr	-896(ra) # 80005a98 <_Z11printStringPKc>
    80004e20:	00000613          	li	a2,0
    80004e24:	00a00593          	li	a1,10
    80004e28:	00048513          	mv	a0,s1
    80004e2c:	00001097          	auipc	ra,0x1
    80004e30:	e1c080e7          	jalr	-484(ra) # 80005c48 <_Z8printIntiii>
    80004e34:	00005517          	auipc	a0,0x5
    80004e38:	6fc50513          	addi	a0,a0,1788 # 8000a530 <CONSOLE_STATUS+0x520>
    80004e3c:	00001097          	auipc	ra,0x1
    80004e40:	c5c080e7          	jalr	-932(ra) # 80005a98 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004e44:	0014849b          	addiw	s1,s1,1
    80004e48:	0ff4f493          	andi	s1,s1,255
    80004e4c:	00200793          	li	a5,2
    80004e50:	fc97f0e3          	bgeu	a5,s1,80004e10 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004e54:	00005517          	auipc	a0,0x5
    80004e58:	4b450513          	addi	a0,a0,1204 # 8000a308 <CONSOLE_STATUS+0x2f8>
    80004e5c:	00001097          	auipc	ra,0x1
    80004e60:	c3c080e7          	jalr	-964(ra) # 80005a98 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004e64:	00700313          	li	t1,7
    thread_dispatch();
    80004e68:	ffffc097          	auipc	ra,0xffffc
    80004e6c:	5cc080e7          	jalr	1484(ra) # 80001434 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004e70:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004e74:	00005517          	auipc	a0,0x5
    80004e78:	4a450513          	addi	a0,a0,1188 # 8000a318 <CONSOLE_STATUS+0x308>
    80004e7c:	00001097          	auipc	ra,0x1
    80004e80:	c1c080e7          	jalr	-996(ra) # 80005a98 <_Z11printStringPKc>
    80004e84:	00000613          	li	a2,0
    80004e88:	00a00593          	li	a1,10
    80004e8c:	0009051b          	sext.w	a0,s2
    80004e90:	00001097          	auipc	ra,0x1
    80004e94:	db8080e7          	jalr	-584(ra) # 80005c48 <_Z8printIntiii>
    80004e98:	00005517          	auipc	a0,0x5
    80004e9c:	69850513          	addi	a0,a0,1688 # 8000a530 <CONSOLE_STATUS+0x520>
    80004ea0:	00001097          	auipc	ra,0x1
    80004ea4:	bf8080e7          	jalr	-1032(ra) # 80005a98 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004ea8:	00c00513          	li	a0,12
    80004eac:	00000097          	auipc	ra,0x0
    80004eb0:	d88080e7          	jalr	-632(ra) # 80004c34 <_ZL9fibonaccim>
    80004eb4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004eb8:	00005517          	auipc	a0,0x5
    80004ebc:	46850513          	addi	a0,a0,1128 # 8000a320 <CONSOLE_STATUS+0x310>
    80004ec0:	00001097          	auipc	ra,0x1
    80004ec4:	bd8080e7          	jalr	-1064(ra) # 80005a98 <_Z11printStringPKc>
    80004ec8:	00000613          	li	a2,0
    80004ecc:	00a00593          	li	a1,10
    80004ed0:	0009051b          	sext.w	a0,s2
    80004ed4:	00001097          	auipc	ra,0x1
    80004ed8:	d74080e7          	jalr	-652(ra) # 80005c48 <_Z8printIntiii>
    80004edc:	00005517          	auipc	a0,0x5
    80004ee0:	65450513          	addi	a0,a0,1620 # 8000a530 <CONSOLE_STATUS+0x520>
    80004ee4:	00001097          	auipc	ra,0x1
    80004ee8:	bb4080e7          	jalr	-1100(ra) # 80005a98 <_Z11printStringPKc>
    80004eec:	0400006f          	j	80004f2c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004ef0:	00005517          	auipc	a0,0x5
    80004ef4:	41050513          	addi	a0,a0,1040 # 8000a300 <CONSOLE_STATUS+0x2f0>
    80004ef8:	00001097          	auipc	ra,0x1
    80004efc:	ba0080e7          	jalr	-1120(ra) # 80005a98 <_Z11printStringPKc>
    80004f00:	00000613          	li	a2,0
    80004f04:	00a00593          	li	a1,10
    80004f08:	00048513          	mv	a0,s1
    80004f0c:	00001097          	auipc	ra,0x1
    80004f10:	d3c080e7          	jalr	-708(ra) # 80005c48 <_Z8printIntiii>
    80004f14:	00005517          	auipc	a0,0x5
    80004f18:	61c50513          	addi	a0,a0,1564 # 8000a530 <CONSOLE_STATUS+0x520>
    80004f1c:	00001097          	auipc	ra,0x1
    80004f20:	b7c080e7          	jalr	-1156(ra) # 80005a98 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004f24:	0014849b          	addiw	s1,s1,1
    80004f28:	0ff4f493          	andi	s1,s1,255
    80004f2c:	00500793          	li	a5,5
    80004f30:	fc97f0e3          	bgeu	a5,s1,80004ef0 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80004f34:	00005517          	auipc	a0,0x5
    80004f38:	3fc50513          	addi	a0,a0,1020 # 8000a330 <CONSOLE_STATUS+0x320>
    80004f3c:	00001097          	auipc	ra,0x1
    80004f40:	b5c080e7          	jalr	-1188(ra) # 80005a98 <_Z11printStringPKc>
    finishedC = true;
    80004f44:	00100793          	li	a5,1
    80004f48:	00008717          	auipc	a4,0x8
    80004f4c:	e8f700a3          	sb	a5,-383(a4) # 8000cdc9 <_ZL9finishedC>
    thread_dispatch();
    80004f50:	ffffc097          	auipc	ra,0xffffc
    80004f54:	4e4080e7          	jalr	1252(ra) # 80001434 <_Z15thread_dispatchv>
}
    80004f58:	01813083          	ld	ra,24(sp)
    80004f5c:	01013403          	ld	s0,16(sp)
    80004f60:	00813483          	ld	s1,8(sp)
    80004f64:	00013903          	ld	s2,0(sp)
    80004f68:	02010113          	addi	sp,sp,32
    80004f6c:	00008067          	ret

0000000080004f70 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004f70:	fe010113          	addi	sp,sp,-32
    80004f74:	00113c23          	sd	ra,24(sp)
    80004f78:	00813823          	sd	s0,16(sp)
    80004f7c:	00913423          	sd	s1,8(sp)
    80004f80:	01213023          	sd	s2,0(sp)
    80004f84:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004f88:	00000913          	li	s2,0
    80004f8c:	0380006f          	j	80004fc4 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004f90:	ffffc097          	auipc	ra,0xffffc
    80004f94:	4a4080e7          	jalr	1188(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004f98:	00148493          	addi	s1,s1,1
    80004f9c:	000027b7          	lui	a5,0x2
    80004fa0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004fa4:	0097ee63          	bltu	a5,s1,80004fc0 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004fa8:	00000713          	li	a4,0
    80004fac:	000077b7          	lui	a5,0x7
    80004fb0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004fb4:	fce7eee3          	bltu	a5,a4,80004f90 <_ZL11workerBodyBPv+0x20>
    80004fb8:	00170713          	addi	a4,a4,1
    80004fbc:	ff1ff06f          	j	80004fac <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004fc0:	00190913          	addi	s2,s2,1
    80004fc4:	00f00793          	li	a5,15
    80004fc8:	0527e063          	bltu	a5,s2,80005008 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004fcc:	00005517          	auipc	a0,0x5
    80004fd0:	31c50513          	addi	a0,a0,796 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    80004fd4:	00001097          	auipc	ra,0x1
    80004fd8:	ac4080e7          	jalr	-1340(ra) # 80005a98 <_Z11printStringPKc>
    80004fdc:	00000613          	li	a2,0
    80004fe0:	00a00593          	li	a1,10
    80004fe4:	0009051b          	sext.w	a0,s2
    80004fe8:	00001097          	auipc	ra,0x1
    80004fec:	c60080e7          	jalr	-928(ra) # 80005c48 <_Z8printIntiii>
    80004ff0:	00005517          	auipc	a0,0x5
    80004ff4:	54050513          	addi	a0,a0,1344 # 8000a530 <CONSOLE_STATUS+0x520>
    80004ff8:	00001097          	auipc	ra,0x1
    80004ffc:	aa0080e7          	jalr	-1376(ra) # 80005a98 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005000:	00000493          	li	s1,0
    80005004:	f99ff06f          	j	80004f9c <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80005008:	00005517          	auipc	a0,0x5
    8000500c:	2e850513          	addi	a0,a0,744 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    80005010:	00001097          	auipc	ra,0x1
    80005014:	a88080e7          	jalr	-1400(ra) # 80005a98 <_Z11printStringPKc>
    finishedB = true;
    80005018:	00100793          	li	a5,1
    8000501c:	00008717          	auipc	a4,0x8
    80005020:	daf70723          	sb	a5,-594(a4) # 8000cdca <_ZL9finishedB>
    thread_dispatch();
    80005024:	ffffc097          	auipc	ra,0xffffc
    80005028:	410080e7          	jalr	1040(ra) # 80001434 <_Z15thread_dispatchv>
}
    8000502c:	01813083          	ld	ra,24(sp)
    80005030:	01013403          	ld	s0,16(sp)
    80005034:	00813483          	ld	s1,8(sp)
    80005038:	00013903          	ld	s2,0(sp)
    8000503c:	02010113          	addi	sp,sp,32
    80005040:	00008067          	ret

0000000080005044 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005044:	fe010113          	addi	sp,sp,-32
    80005048:	00113c23          	sd	ra,24(sp)
    8000504c:	00813823          	sd	s0,16(sp)
    80005050:	00913423          	sd	s1,8(sp)
    80005054:	01213023          	sd	s2,0(sp)
    80005058:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000505c:	00000913          	li	s2,0
    80005060:	0380006f          	j	80005098 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005064:	ffffc097          	auipc	ra,0xffffc
    80005068:	3d0080e7          	jalr	976(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000506c:	00148493          	addi	s1,s1,1
    80005070:	000027b7          	lui	a5,0x2
    80005074:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005078:	0097ee63          	bltu	a5,s1,80005094 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000507c:	00000713          	li	a4,0
    80005080:	000077b7          	lui	a5,0x7
    80005084:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005088:	fce7eee3          	bltu	a5,a4,80005064 <_ZL11workerBodyAPv+0x20>
    8000508c:	00170713          	addi	a4,a4,1
    80005090:	ff1ff06f          	j	80005080 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005094:	00190913          	addi	s2,s2,1
    80005098:	00900793          	li	a5,9
    8000509c:	0527e063          	bltu	a5,s2,800050dc <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800050a0:	00005517          	auipc	a0,0x5
    800050a4:	23050513          	addi	a0,a0,560 # 8000a2d0 <CONSOLE_STATUS+0x2c0>
    800050a8:	00001097          	auipc	ra,0x1
    800050ac:	9f0080e7          	jalr	-1552(ra) # 80005a98 <_Z11printStringPKc>
    800050b0:	00000613          	li	a2,0
    800050b4:	00a00593          	li	a1,10
    800050b8:	0009051b          	sext.w	a0,s2
    800050bc:	00001097          	auipc	ra,0x1
    800050c0:	b8c080e7          	jalr	-1140(ra) # 80005c48 <_Z8printIntiii>
    800050c4:	00005517          	auipc	a0,0x5
    800050c8:	46c50513          	addi	a0,a0,1132 # 8000a530 <CONSOLE_STATUS+0x520>
    800050cc:	00001097          	auipc	ra,0x1
    800050d0:	9cc080e7          	jalr	-1588(ra) # 80005a98 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800050d4:	00000493          	li	s1,0
    800050d8:	f99ff06f          	j	80005070 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800050dc:	00005517          	auipc	a0,0x5
    800050e0:	1fc50513          	addi	a0,a0,508 # 8000a2d8 <CONSOLE_STATUS+0x2c8>
    800050e4:	00001097          	auipc	ra,0x1
    800050e8:	9b4080e7          	jalr	-1612(ra) # 80005a98 <_Z11printStringPKc>
    finishedA = true;
    800050ec:	00100793          	li	a5,1
    800050f0:	00008717          	auipc	a4,0x8
    800050f4:	ccf70da3          	sb	a5,-805(a4) # 8000cdcb <_ZL9finishedA>
}
    800050f8:	01813083          	ld	ra,24(sp)
    800050fc:	01013403          	ld	s0,16(sp)
    80005100:	00813483          	ld	s1,8(sp)
    80005104:	00013903          	ld	s2,0(sp)
    80005108:	02010113          	addi	sp,sp,32
    8000510c:	00008067          	ret

0000000080005110 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005110:	fd010113          	addi	sp,sp,-48
    80005114:	02113423          	sd	ra,40(sp)
    80005118:	02813023          	sd	s0,32(sp)
    8000511c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005120:	00000613          	li	a2,0
    80005124:	00000597          	auipc	a1,0x0
    80005128:	f2058593          	addi	a1,a1,-224 # 80005044 <_ZL11workerBodyAPv>
    8000512c:	fd040513          	addi	a0,s0,-48
    80005130:	ffffc097          	auipc	ra,0xffffc
    80005134:	248080e7          	jalr	584(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005138:	00005517          	auipc	a0,0x5
    8000513c:	24050513          	addi	a0,a0,576 # 8000a378 <CONSOLE_STATUS+0x368>
    80005140:	00001097          	auipc	ra,0x1
    80005144:	958080e7          	jalr	-1704(ra) # 80005a98 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005148:	00000613          	li	a2,0
    8000514c:	00000597          	auipc	a1,0x0
    80005150:	e2458593          	addi	a1,a1,-476 # 80004f70 <_ZL11workerBodyBPv>
    80005154:	fd840513          	addi	a0,s0,-40
    80005158:	ffffc097          	auipc	ra,0xffffc
    8000515c:	220080e7          	jalr	544(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005160:	00005517          	auipc	a0,0x5
    80005164:	23050513          	addi	a0,a0,560 # 8000a390 <CONSOLE_STATUS+0x380>
    80005168:	00001097          	auipc	ra,0x1
    8000516c:	930080e7          	jalr	-1744(ra) # 80005a98 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005170:	00000613          	li	a2,0
    80005174:	00000597          	auipc	a1,0x0
    80005178:	c7c58593          	addi	a1,a1,-900 # 80004df0 <_ZL11workerBodyCPv>
    8000517c:	fe040513          	addi	a0,s0,-32
    80005180:	ffffc097          	auipc	ra,0xffffc
    80005184:	1f8080e7          	jalr	504(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005188:	00005517          	auipc	a0,0x5
    8000518c:	22050513          	addi	a0,a0,544 # 8000a3a8 <CONSOLE_STATUS+0x398>
    80005190:	00001097          	auipc	ra,0x1
    80005194:	908080e7          	jalr	-1784(ra) # 80005a98 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005198:	00000613          	li	a2,0
    8000519c:	00000597          	auipc	a1,0x0
    800051a0:	b0c58593          	addi	a1,a1,-1268 # 80004ca8 <_ZL11workerBodyDPv>
    800051a4:	fe840513          	addi	a0,s0,-24
    800051a8:	ffffc097          	auipc	ra,0xffffc
    800051ac:	1d0080e7          	jalr	464(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800051b0:	00005517          	auipc	a0,0x5
    800051b4:	21050513          	addi	a0,a0,528 # 8000a3c0 <CONSOLE_STATUS+0x3b0>
    800051b8:	00001097          	auipc	ra,0x1
    800051bc:	8e0080e7          	jalr	-1824(ra) # 80005a98 <_Z11printStringPKc>
    800051c0:	00c0006f          	j	800051cc <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800051c4:	ffffc097          	auipc	ra,0xffffc
    800051c8:	270080e7          	jalr	624(ra) # 80001434 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800051cc:	00008797          	auipc	a5,0x8
    800051d0:	bff7c783          	lbu	a5,-1025(a5) # 8000cdcb <_ZL9finishedA>
    800051d4:	fe0788e3          	beqz	a5,800051c4 <_Z18Threads_C_API_testv+0xb4>
    800051d8:	00008797          	auipc	a5,0x8
    800051dc:	bf27c783          	lbu	a5,-1038(a5) # 8000cdca <_ZL9finishedB>
    800051e0:	fe0782e3          	beqz	a5,800051c4 <_Z18Threads_C_API_testv+0xb4>
    800051e4:	00008797          	auipc	a5,0x8
    800051e8:	be57c783          	lbu	a5,-1051(a5) # 8000cdc9 <_ZL9finishedC>
    800051ec:	fc078ce3          	beqz	a5,800051c4 <_Z18Threads_C_API_testv+0xb4>
    800051f0:	00008797          	auipc	a5,0x8
    800051f4:	bd87c783          	lbu	a5,-1064(a5) # 8000cdc8 <_ZL9finishedD>
    800051f8:	fc0786e3          	beqz	a5,800051c4 <_Z18Threads_C_API_testv+0xb4>
    }

}
    800051fc:	02813083          	ld	ra,40(sp)
    80005200:	02013403          	ld	s0,32(sp)
    80005204:	03010113          	addi	sp,sp,48
    80005208:	00008067          	ret

000000008000520c <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    8000520c:	fd010113          	addi	sp,sp,-48
    80005210:	02113423          	sd	ra,40(sp)
    80005214:	02813023          	sd	s0,32(sp)
    80005218:	00913c23          	sd	s1,24(sp)
    8000521c:	01213823          	sd	s2,16(sp)
    80005220:	01313423          	sd	s3,8(sp)
    80005224:	03010413          	addi	s0,sp,48
    80005228:	00050993          	mv	s3,a0
    8000522c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005230:	00000913          	li	s2,0
    80005234:	00c0006f          	j	80005240 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005238:	ffffe097          	auipc	ra,0xffffe
    8000523c:	874080e7          	jalr	-1932(ra) # 80002aac <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005240:	ffffc097          	auipc	ra,0xffffc
    80005244:	334080e7          	jalr	820(ra) # 80001574 <_Z4getcv>
    80005248:	0005059b          	sext.w	a1,a0
    8000524c:	01b00793          	li	a5,27
    80005250:	02f58a63          	beq	a1,a5,80005284 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005254:	0084b503          	ld	a0,8(s1)
    80005258:	00001097          	auipc	ra,0x1
    8000525c:	c64080e7          	jalr	-924(ra) # 80005ebc <_ZN9BufferCPP3putEi>
        i++;
    80005260:	0019071b          	addiw	a4,s2,1
    80005264:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005268:	0004a683          	lw	a3,0(s1)
    8000526c:	0026979b          	slliw	a5,a3,0x2
    80005270:	00d787bb          	addw	a5,a5,a3
    80005274:	0017979b          	slliw	a5,a5,0x1
    80005278:	02f767bb          	remw	a5,a4,a5
    8000527c:	fc0792e3          	bnez	a5,80005240 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80005280:	fb9ff06f          	j	80005238 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005284:	00100793          	li	a5,1
    80005288:	00008717          	auipc	a4,0x8
    8000528c:	b4f72423          	sw	a5,-1208(a4) # 8000cdd0 <_ZL9threadEnd>
    td->buffer->put('!');
    80005290:	0209b783          	ld	a5,32(s3)
    80005294:	02100593          	li	a1,33
    80005298:	0087b503          	ld	a0,8(a5)
    8000529c:	00001097          	auipc	ra,0x1
    800052a0:	c20080e7          	jalr	-992(ra) # 80005ebc <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800052a4:	0104b503          	ld	a0,16(s1)
    800052a8:	ffffe097          	auipc	ra,0xffffe
    800052ac:	9a0080e7          	jalr	-1632(ra) # 80002c48 <_ZN9Semaphore6signalEv>
}
    800052b0:	02813083          	ld	ra,40(sp)
    800052b4:	02013403          	ld	s0,32(sp)
    800052b8:	01813483          	ld	s1,24(sp)
    800052bc:	01013903          	ld	s2,16(sp)
    800052c0:	00813983          	ld	s3,8(sp)
    800052c4:	03010113          	addi	sp,sp,48
    800052c8:	00008067          	ret

00000000800052cc <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800052cc:	fe010113          	addi	sp,sp,-32
    800052d0:	00113c23          	sd	ra,24(sp)
    800052d4:	00813823          	sd	s0,16(sp)
    800052d8:	00913423          	sd	s1,8(sp)
    800052dc:	01213023          	sd	s2,0(sp)
    800052e0:	02010413          	addi	s0,sp,32
    800052e4:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800052e8:	00000913          	li	s2,0
    800052ec:	00c0006f          	j	800052f8 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800052f0:	ffffd097          	auipc	ra,0xffffd
    800052f4:	7bc080e7          	jalr	1980(ra) # 80002aac <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800052f8:	00008797          	auipc	a5,0x8
    800052fc:	ad87a783          	lw	a5,-1320(a5) # 8000cdd0 <_ZL9threadEnd>
    80005300:	02079e63          	bnez	a5,8000533c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005304:	0004a583          	lw	a1,0(s1)
    80005308:	0305859b          	addiw	a1,a1,48
    8000530c:	0084b503          	ld	a0,8(s1)
    80005310:	00001097          	auipc	ra,0x1
    80005314:	bac080e7          	jalr	-1108(ra) # 80005ebc <_ZN9BufferCPP3putEi>
        i++;
    80005318:	0019071b          	addiw	a4,s2,1
    8000531c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005320:	0004a683          	lw	a3,0(s1)
    80005324:	0026979b          	slliw	a5,a3,0x2
    80005328:	00d787bb          	addw	a5,a5,a3
    8000532c:	0017979b          	slliw	a5,a5,0x1
    80005330:	02f767bb          	remw	a5,a4,a5
    80005334:	fc0792e3          	bnez	a5,800052f8 <_ZN12ProducerSync8producerEPv+0x2c>
    80005338:	fb9ff06f          	j	800052f0 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    8000533c:	0104b503          	ld	a0,16(s1)
    80005340:	ffffe097          	auipc	ra,0xffffe
    80005344:	908080e7          	jalr	-1784(ra) # 80002c48 <_ZN9Semaphore6signalEv>
}
    80005348:	01813083          	ld	ra,24(sp)
    8000534c:	01013403          	ld	s0,16(sp)
    80005350:	00813483          	ld	s1,8(sp)
    80005354:	00013903          	ld	s2,0(sp)
    80005358:	02010113          	addi	sp,sp,32
    8000535c:	00008067          	ret

0000000080005360 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005360:	fd010113          	addi	sp,sp,-48
    80005364:	02113423          	sd	ra,40(sp)
    80005368:	02813023          	sd	s0,32(sp)
    8000536c:	00913c23          	sd	s1,24(sp)
    80005370:	01213823          	sd	s2,16(sp)
    80005374:	01313423          	sd	s3,8(sp)
    80005378:	01413023          	sd	s4,0(sp)
    8000537c:	03010413          	addi	s0,sp,48
    80005380:	00050993          	mv	s3,a0
    80005384:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005388:	00000a13          	li	s4,0
    8000538c:	01c0006f          	j	800053a8 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005390:	ffffd097          	auipc	ra,0xffffd
    80005394:	71c080e7          	jalr	1820(ra) # 80002aac <_ZN6Thread8dispatchEv>
    80005398:	0500006f          	j	800053e8 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    8000539c:	00a00513          	li	a0,10
    800053a0:	ffffc097          	auipc	ra,0xffffc
    800053a4:	1fc080e7          	jalr	508(ra) # 8000159c <_Z4putcc>
    while (!threadEnd) {
    800053a8:	00008797          	auipc	a5,0x8
    800053ac:	a287a783          	lw	a5,-1496(a5) # 8000cdd0 <_ZL9threadEnd>
    800053b0:	06079263          	bnez	a5,80005414 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800053b4:	00893503          	ld	a0,8(s2)
    800053b8:	00001097          	auipc	ra,0x1
    800053bc:	b94080e7          	jalr	-1132(ra) # 80005f4c <_ZN9BufferCPP3getEv>
        i++;
    800053c0:	001a049b          	addiw	s1,s4,1
    800053c4:	00048a1b          	sext.w	s4,s1
        putc(key);
    800053c8:	0ff57513          	andi	a0,a0,255
    800053cc:	ffffc097          	auipc	ra,0xffffc
    800053d0:	1d0080e7          	jalr	464(ra) # 8000159c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800053d4:	00092703          	lw	a4,0(s2)
    800053d8:	0027179b          	slliw	a5,a4,0x2
    800053dc:	00e787bb          	addw	a5,a5,a4
    800053e0:	02f4e7bb          	remw	a5,s1,a5
    800053e4:	fa0786e3          	beqz	a5,80005390 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800053e8:	05000793          	li	a5,80
    800053ec:	02f4e4bb          	remw	s1,s1,a5
    800053f0:	fa049ce3          	bnez	s1,800053a8 <_ZN12ConsumerSync8consumerEPv+0x48>
    800053f4:	fa9ff06f          	j	8000539c <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800053f8:	0209b783          	ld	a5,32(s3)
    800053fc:	0087b503          	ld	a0,8(a5)
    80005400:	00001097          	auipc	ra,0x1
    80005404:	b4c080e7          	jalr	-1204(ra) # 80005f4c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005408:	0ff57513          	andi	a0,a0,255
    8000540c:	ffffe097          	auipc	ra,0xffffe
    80005410:	900080e7          	jalr	-1792(ra) # 80002d0c <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005414:	0209b783          	ld	a5,32(s3)
    80005418:	0087b503          	ld	a0,8(a5)
    8000541c:	00001097          	auipc	ra,0x1
    80005420:	bbc080e7          	jalr	-1092(ra) # 80005fd8 <_ZN9BufferCPP6getCntEv>
    80005424:	fca04ae3          	bgtz	a0,800053f8 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005428:	01093503          	ld	a0,16(s2)
    8000542c:	ffffe097          	auipc	ra,0xffffe
    80005430:	81c080e7          	jalr	-2020(ra) # 80002c48 <_ZN9Semaphore6signalEv>
}
    80005434:	02813083          	ld	ra,40(sp)
    80005438:	02013403          	ld	s0,32(sp)
    8000543c:	01813483          	ld	s1,24(sp)
    80005440:	01013903          	ld	s2,16(sp)
    80005444:	00813983          	ld	s3,8(sp)
    80005448:	00013a03          	ld	s4,0(sp)
    8000544c:	03010113          	addi	sp,sp,48
    80005450:	00008067          	ret

0000000080005454 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005454:	f8010113          	addi	sp,sp,-128
    80005458:	06113c23          	sd	ra,120(sp)
    8000545c:	06813823          	sd	s0,112(sp)
    80005460:	06913423          	sd	s1,104(sp)
    80005464:	07213023          	sd	s2,96(sp)
    80005468:	05313c23          	sd	s3,88(sp)
    8000546c:	05413823          	sd	s4,80(sp)
    80005470:	05513423          	sd	s5,72(sp)
    80005474:	05613023          	sd	s6,64(sp)
    80005478:	03713c23          	sd	s7,56(sp)
    8000547c:	03813823          	sd	s8,48(sp)
    80005480:	03913423          	sd	s9,40(sp)
    80005484:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005488:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    8000548c:	00005517          	auipc	a0,0x5
    80005490:	d5c50513          	addi	a0,a0,-676 # 8000a1e8 <CONSOLE_STATUS+0x1d8>
    80005494:	00000097          	auipc	ra,0x0
    80005498:	604080e7          	jalr	1540(ra) # 80005a98 <_Z11printStringPKc>
    getString(input, 30);
    8000549c:	01e00593          	li	a1,30
    800054a0:	f8040493          	addi	s1,s0,-128
    800054a4:	00048513          	mv	a0,s1
    800054a8:	00000097          	auipc	ra,0x0
    800054ac:	678080e7          	jalr	1656(ra) # 80005b20 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800054b0:	00048513          	mv	a0,s1
    800054b4:	00000097          	auipc	ra,0x0
    800054b8:	744080e7          	jalr	1860(ra) # 80005bf8 <_Z11stringToIntPKc>
    800054bc:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800054c0:	00005517          	auipc	a0,0x5
    800054c4:	d4850513          	addi	a0,a0,-696 # 8000a208 <CONSOLE_STATUS+0x1f8>
    800054c8:	00000097          	auipc	ra,0x0
    800054cc:	5d0080e7          	jalr	1488(ra) # 80005a98 <_Z11printStringPKc>
    getString(input, 30);
    800054d0:	01e00593          	li	a1,30
    800054d4:	00048513          	mv	a0,s1
    800054d8:	00000097          	auipc	ra,0x0
    800054dc:	648080e7          	jalr	1608(ra) # 80005b20 <_Z9getStringPci>
    n = stringToInt(input);
    800054e0:	00048513          	mv	a0,s1
    800054e4:	00000097          	auipc	ra,0x0
    800054e8:	714080e7          	jalr	1812(ra) # 80005bf8 <_Z11stringToIntPKc>
    800054ec:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800054f0:	00005517          	auipc	a0,0x5
    800054f4:	d3850513          	addi	a0,a0,-712 # 8000a228 <CONSOLE_STATUS+0x218>
    800054f8:	00000097          	auipc	ra,0x0
    800054fc:	5a0080e7          	jalr	1440(ra) # 80005a98 <_Z11printStringPKc>
    80005500:	00000613          	li	a2,0
    80005504:	00a00593          	li	a1,10
    80005508:	00090513          	mv	a0,s2
    8000550c:	00000097          	auipc	ra,0x0
    80005510:	73c080e7          	jalr	1852(ra) # 80005c48 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005514:	00005517          	auipc	a0,0x5
    80005518:	d2c50513          	addi	a0,a0,-724 # 8000a240 <CONSOLE_STATUS+0x230>
    8000551c:	00000097          	auipc	ra,0x0
    80005520:	57c080e7          	jalr	1404(ra) # 80005a98 <_Z11printStringPKc>
    80005524:	00000613          	li	a2,0
    80005528:	00a00593          	li	a1,10
    8000552c:	00048513          	mv	a0,s1
    80005530:	00000097          	auipc	ra,0x0
    80005534:	718080e7          	jalr	1816(ra) # 80005c48 <_Z8printIntiii>
    printString(".\n");
    80005538:	00005517          	auipc	a0,0x5
    8000553c:	d2050513          	addi	a0,a0,-736 # 8000a258 <CONSOLE_STATUS+0x248>
    80005540:	00000097          	auipc	ra,0x0
    80005544:	558080e7          	jalr	1368(ra) # 80005a98 <_Z11printStringPKc>
    if(threadNum > n) {
    80005548:	0324c463          	blt	s1,s2,80005570 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    8000554c:	03205c63          	blez	s2,80005584 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005550:	03800513          	li	a0,56
    80005554:	ffffd097          	auipc	ra,0xffffd
    80005558:	32c080e7          	jalr	812(ra) # 80002880 <_Znwm>
    8000555c:	00050a93          	mv	s5,a0
    80005560:	00048593          	mv	a1,s1
    80005564:	00001097          	auipc	ra,0x1
    80005568:	804080e7          	jalr	-2044(ra) # 80005d68 <_ZN9BufferCPPC1Ei>
    8000556c:	0300006f          	j	8000559c <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005570:	00005517          	auipc	a0,0x5
    80005574:	cf050513          	addi	a0,a0,-784 # 8000a260 <CONSOLE_STATUS+0x250>
    80005578:	00000097          	auipc	ra,0x0
    8000557c:	520080e7          	jalr	1312(ra) # 80005a98 <_Z11printStringPKc>
        return;
    80005580:	0140006f          	j	80005594 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005584:	00005517          	auipc	a0,0x5
    80005588:	d1c50513          	addi	a0,a0,-740 # 8000a2a0 <CONSOLE_STATUS+0x290>
    8000558c:	00000097          	auipc	ra,0x0
    80005590:	50c080e7          	jalr	1292(ra) # 80005a98 <_Z11printStringPKc>
        return;
    80005594:	000b8113          	mv	sp,s7
    80005598:	2380006f          	j	800057d0 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    8000559c:	01000513          	li	a0,16
    800055a0:	ffffd097          	auipc	ra,0xffffd
    800055a4:	2e0080e7          	jalr	736(ra) # 80002880 <_Znwm>
    800055a8:	00050493          	mv	s1,a0
    800055ac:	00000593          	li	a1,0
    800055b0:	ffffd097          	auipc	ra,0xffffd
    800055b4:	634080e7          	jalr	1588(ra) # 80002be4 <_ZN9SemaphoreC1Ej>
    800055b8:	00008797          	auipc	a5,0x8
    800055bc:	8297b023          	sd	s1,-2016(a5) # 8000cdd8 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800055c0:	00391793          	slli	a5,s2,0x3
    800055c4:	00f78793          	addi	a5,a5,15
    800055c8:	ff07f793          	andi	a5,a5,-16
    800055cc:	40f10133          	sub	sp,sp,a5
    800055d0:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800055d4:	0019071b          	addiw	a4,s2,1
    800055d8:	00171793          	slli	a5,a4,0x1
    800055dc:	00e787b3          	add	a5,a5,a4
    800055e0:	00379793          	slli	a5,a5,0x3
    800055e4:	00f78793          	addi	a5,a5,15
    800055e8:	ff07f793          	andi	a5,a5,-16
    800055ec:	40f10133          	sub	sp,sp,a5
    800055f0:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800055f4:	00191c13          	slli	s8,s2,0x1
    800055f8:	012c07b3          	add	a5,s8,s2
    800055fc:	00379793          	slli	a5,a5,0x3
    80005600:	00fa07b3          	add	a5,s4,a5
    80005604:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005608:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    8000560c:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005610:	02800513          	li	a0,40
    80005614:	ffffd097          	auipc	ra,0xffffd
    80005618:	26c080e7          	jalr	620(ra) # 80002880 <_Znwm>
    8000561c:	00050b13          	mv	s6,a0
    80005620:	012c0c33          	add	s8,s8,s2
    80005624:	003c1c13          	slli	s8,s8,0x3
    80005628:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    8000562c:	ffffd097          	auipc	ra,0xffffd
    80005630:	53c080e7          	jalr	1340(ra) # 80002b68 <_ZN6ThreadC1Ev>
    80005634:	00007797          	auipc	a5,0x7
    80005638:	55478793          	addi	a5,a5,1364 # 8000cb88 <_ZTV12ConsumerSync+0x10>
    8000563c:	00fb3023          	sd	a5,0(s6)
    80005640:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005644:	000b0513          	mv	a0,s6
    80005648:	ffffd097          	auipc	ra,0xffffd
    8000564c:	3f0080e7          	jalr	1008(ra) # 80002a38 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005650:	00000493          	li	s1,0
    80005654:	0380006f          	j	8000568c <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005658:	00007797          	auipc	a5,0x7
    8000565c:	50878793          	addi	a5,a5,1288 # 8000cb60 <_ZTV12ProducerSync+0x10>
    80005660:	00fcb023          	sd	a5,0(s9)
    80005664:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005668:	00349793          	slli	a5,s1,0x3
    8000566c:	00f987b3          	add	a5,s3,a5
    80005670:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005674:	00349793          	slli	a5,s1,0x3
    80005678:	00f987b3          	add	a5,s3,a5
    8000567c:	0007b503          	ld	a0,0(a5)
    80005680:	ffffd097          	auipc	ra,0xffffd
    80005684:	3b8080e7          	jalr	952(ra) # 80002a38 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005688:	0014849b          	addiw	s1,s1,1
    8000568c:	0b24d063          	bge	s1,s2,8000572c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005690:	00149793          	slli	a5,s1,0x1
    80005694:	009787b3          	add	a5,a5,s1
    80005698:	00379793          	slli	a5,a5,0x3
    8000569c:	00fa07b3          	add	a5,s4,a5
    800056a0:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800056a4:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800056a8:	00007717          	auipc	a4,0x7
    800056ac:	73073703          	ld	a4,1840(a4) # 8000cdd8 <_ZL10waitForAll>
    800056b0:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800056b4:	02905863          	blez	s1,800056e4 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800056b8:	02800513          	li	a0,40
    800056bc:	ffffd097          	auipc	ra,0xffffd
    800056c0:	1c4080e7          	jalr	452(ra) # 80002880 <_Znwm>
    800056c4:	00050c93          	mv	s9,a0
    800056c8:	00149c13          	slli	s8,s1,0x1
    800056cc:	009c0c33          	add	s8,s8,s1
    800056d0:	003c1c13          	slli	s8,s8,0x3
    800056d4:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800056d8:	ffffd097          	auipc	ra,0xffffd
    800056dc:	490080e7          	jalr	1168(ra) # 80002b68 <_ZN6ThreadC1Ev>
    800056e0:	f79ff06f          	j	80005658 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800056e4:	02800513          	li	a0,40
    800056e8:	ffffd097          	auipc	ra,0xffffd
    800056ec:	198080e7          	jalr	408(ra) # 80002880 <_Znwm>
    800056f0:	00050c93          	mv	s9,a0
    800056f4:	00149c13          	slli	s8,s1,0x1
    800056f8:	009c0c33          	add	s8,s8,s1
    800056fc:	003c1c13          	slli	s8,s8,0x3
    80005700:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005704:	ffffd097          	auipc	ra,0xffffd
    80005708:	464080e7          	jalr	1124(ra) # 80002b68 <_ZN6ThreadC1Ev>
    8000570c:	00007797          	auipc	a5,0x7
    80005710:	42c78793          	addi	a5,a5,1068 # 8000cb38 <_ZTV16ProducerKeyboard+0x10>
    80005714:	00fcb023          	sd	a5,0(s9)
    80005718:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    8000571c:	00349793          	slli	a5,s1,0x3
    80005720:	00f987b3          	add	a5,s3,a5
    80005724:	0197b023          	sd	s9,0(a5)
    80005728:	f4dff06f          	j	80005674 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    8000572c:	ffffd097          	auipc	ra,0xffffd
    80005730:	380080e7          	jalr	896(ra) # 80002aac <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005734:	00000493          	li	s1,0
    80005738:	00994e63          	blt	s2,s1,80005754 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    8000573c:	00007517          	auipc	a0,0x7
    80005740:	69c53503          	ld	a0,1692(a0) # 8000cdd8 <_ZL10waitForAll>
    80005744:	ffffd097          	auipc	ra,0xffffd
    80005748:	4d8080e7          	jalr	1240(ra) # 80002c1c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000574c:	0014849b          	addiw	s1,s1,1
    80005750:	fe9ff06f          	j	80005738 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005754:	00000493          	li	s1,0
    80005758:	0080006f          	j	80005760 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    8000575c:	0014849b          	addiw	s1,s1,1
    80005760:	0324d263          	bge	s1,s2,80005784 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005764:	00349793          	slli	a5,s1,0x3
    80005768:	00f987b3          	add	a5,s3,a5
    8000576c:	0007b503          	ld	a0,0(a5)
    80005770:	fe0506e3          	beqz	a0,8000575c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005774:	00053783          	ld	a5,0(a0)
    80005778:	0087b783          	ld	a5,8(a5)
    8000577c:	000780e7          	jalr	a5
    80005780:	fddff06f          	j	8000575c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005784:	000b0a63          	beqz	s6,80005798 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005788:	000b3783          	ld	a5,0(s6)
    8000578c:	0087b783          	ld	a5,8(a5)
    80005790:	000b0513          	mv	a0,s6
    80005794:	000780e7          	jalr	a5
    delete waitForAll;
    80005798:	00007517          	auipc	a0,0x7
    8000579c:	64053503          	ld	a0,1600(a0) # 8000cdd8 <_ZL10waitForAll>
    800057a0:	00050863          	beqz	a0,800057b0 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800057a4:	00053783          	ld	a5,0(a0)
    800057a8:	0087b783          	ld	a5,8(a5)
    800057ac:	000780e7          	jalr	a5
    delete buffer;
    800057b0:	000a8e63          	beqz	s5,800057cc <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800057b4:	000a8513          	mv	a0,s5
    800057b8:	00001097          	auipc	ra,0x1
    800057bc:	8a8080e7          	jalr	-1880(ra) # 80006060 <_ZN9BufferCPPD1Ev>
    800057c0:	000a8513          	mv	a0,s5
    800057c4:	ffffd097          	auipc	ra,0xffffd
    800057c8:	10c080e7          	jalr	268(ra) # 800028d0 <_ZdlPv>
    800057cc:	000b8113          	mv	sp,s7

}
    800057d0:	f8040113          	addi	sp,s0,-128
    800057d4:	07813083          	ld	ra,120(sp)
    800057d8:	07013403          	ld	s0,112(sp)
    800057dc:	06813483          	ld	s1,104(sp)
    800057e0:	06013903          	ld	s2,96(sp)
    800057e4:	05813983          	ld	s3,88(sp)
    800057e8:	05013a03          	ld	s4,80(sp)
    800057ec:	04813a83          	ld	s5,72(sp)
    800057f0:	04013b03          	ld	s6,64(sp)
    800057f4:	03813b83          	ld	s7,56(sp)
    800057f8:	03013c03          	ld	s8,48(sp)
    800057fc:	02813c83          	ld	s9,40(sp)
    80005800:	08010113          	addi	sp,sp,128
    80005804:	00008067          	ret
    80005808:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000580c:	000a8513          	mv	a0,s5
    80005810:	ffffd097          	auipc	ra,0xffffd
    80005814:	0c0080e7          	jalr	192(ra) # 800028d0 <_ZdlPv>
    80005818:	00048513          	mv	a0,s1
    8000581c:	00008097          	auipc	ra,0x8
    80005820:	6bc080e7          	jalr	1724(ra) # 8000ded8 <_Unwind_Resume>
    80005824:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005828:	00048513          	mv	a0,s1
    8000582c:	ffffd097          	auipc	ra,0xffffd
    80005830:	0a4080e7          	jalr	164(ra) # 800028d0 <_ZdlPv>
    80005834:	00090513          	mv	a0,s2
    80005838:	00008097          	auipc	ra,0x8
    8000583c:	6a0080e7          	jalr	1696(ra) # 8000ded8 <_Unwind_Resume>
    80005840:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005844:	000b0513          	mv	a0,s6
    80005848:	ffffd097          	auipc	ra,0xffffd
    8000584c:	088080e7          	jalr	136(ra) # 800028d0 <_ZdlPv>
    80005850:	00048513          	mv	a0,s1
    80005854:	00008097          	auipc	ra,0x8
    80005858:	684080e7          	jalr	1668(ra) # 8000ded8 <_Unwind_Resume>
    8000585c:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005860:	000c8513          	mv	a0,s9
    80005864:	ffffd097          	auipc	ra,0xffffd
    80005868:	06c080e7          	jalr	108(ra) # 800028d0 <_ZdlPv>
    8000586c:	00048513          	mv	a0,s1
    80005870:	00008097          	auipc	ra,0x8
    80005874:	668080e7          	jalr	1640(ra) # 8000ded8 <_Unwind_Resume>
    80005878:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    8000587c:	000c8513          	mv	a0,s9
    80005880:	ffffd097          	auipc	ra,0xffffd
    80005884:	050080e7          	jalr	80(ra) # 800028d0 <_ZdlPv>
    80005888:	00048513          	mv	a0,s1
    8000588c:	00008097          	auipc	ra,0x8
    80005890:	64c080e7          	jalr	1612(ra) # 8000ded8 <_Unwind_Resume>

0000000080005894 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005894:	ff010113          	addi	sp,sp,-16
    80005898:	00113423          	sd	ra,8(sp)
    8000589c:	00813023          	sd	s0,0(sp)
    800058a0:	01010413          	addi	s0,sp,16
    800058a4:	00007797          	auipc	a5,0x7
    800058a8:	2e478793          	addi	a5,a5,740 # 8000cb88 <_ZTV12ConsumerSync+0x10>
    800058ac:	00f53023          	sd	a5,0(a0)
    800058b0:	ffffd097          	auipc	ra,0xffffd
    800058b4:	ee0080e7          	jalr	-288(ra) # 80002790 <_ZN6ThreadD1Ev>
    800058b8:	00813083          	ld	ra,8(sp)
    800058bc:	00013403          	ld	s0,0(sp)
    800058c0:	01010113          	addi	sp,sp,16
    800058c4:	00008067          	ret

00000000800058c8 <_ZN12ConsumerSyncD0Ev>:
    800058c8:	fe010113          	addi	sp,sp,-32
    800058cc:	00113c23          	sd	ra,24(sp)
    800058d0:	00813823          	sd	s0,16(sp)
    800058d4:	00913423          	sd	s1,8(sp)
    800058d8:	02010413          	addi	s0,sp,32
    800058dc:	00050493          	mv	s1,a0
    800058e0:	00007797          	auipc	a5,0x7
    800058e4:	2a878793          	addi	a5,a5,680 # 8000cb88 <_ZTV12ConsumerSync+0x10>
    800058e8:	00f53023          	sd	a5,0(a0)
    800058ec:	ffffd097          	auipc	ra,0xffffd
    800058f0:	ea4080e7          	jalr	-348(ra) # 80002790 <_ZN6ThreadD1Ev>
    800058f4:	00048513          	mv	a0,s1
    800058f8:	ffffd097          	auipc	ra,0xffffd
    800058fc:	fd8080e7          	jalr	-40(ra) # 800028d0 <_ZdlPv>
    80005900:	01813083          	ld	ra,24(sp)
    80005904:	01013403          	ld	s0,16(sp)
    80005908:	00813483          	ld	s1,8(sp)
    8000590c:	02010113          	addi	sp,sp,32
    80005910:	00008067          	ret

0000000080005914 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005914:	ff010113          	addi	sp,sp,-16
    80005918:	00113423          	sd	ra,8(sp)
    8000591c:	00813023          	sd	s0,0(sp)
    80005920:	01010413          	addi	s0,sp,16
    80005924:	00007797          	auipc	a5,0x7
    80005928:	23c78793          	addi	a5,a5,572 # 8000cb60 <_ZTV12ProducerSync+0x10>
    8000592c:	00f53023          	sd	a5,0(a0)
    80005930:	ffffd097          	auipc	ra,0xffffd
    80005934:	e60080e7          	jalr	-416(ra) # 80002790 <_ZN6ThreadD1Ev>
    80005938:	00813083          	ld	ra,8(sp)
    8000593c:	00013403          	ld	s0,0(sp)
    80005940:	01010113          	addi	sp,sp,16
    80005944:	00008067          	ret

0000000080005948 <_ZN12ProducerSyncD0Ev>:
    80005948:	fe010113          	addi	sp,sp,-32
    8000594c:	00113c23          	sd	ra,24(sp)
    80005950:	00813823          	sd	s0,16(sp)
    80005954:	00913423          	sd	s1,8(sp)
    80005958:	02010413          	addi	s0,sp,32
    8000595c:	00050493          	mv	s1,a0
    80005960:	00007797          	auipc	a5,0x7
    80005964:	20078793          	addi	a5,a5,512 # 8000cb60 <_ZTV12ProducerSync+0x10>
    80005968:	00f53023          	sd	a5,0(a0)
    8000596c:	ffffd097          	auipc	ra,0xffffd
    80005970:	e24080e7          	jalr	-476(ra) # 80002790 <_ZN6ThreadD1Ev>
    80005974:	00048513          	mv	a0,s1
    80005978:	ffffd097          	auipc	ra,0xffffd
    8000597c:	f58080e7          	jalr	-168(ra) # 800028d0 <_ZdlPv>
    80005980:	01813083          	ld	ra,24(sp)
    80005984:	01013403          	ld	s0,16(sp)
    80005988:	00813483          	ld	s1,8(sp)
    8000598c:	02010113          	addi	sp,sp,32
    80005990:	00008067          	ret

0000000080005994 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005994:	ff010113          	addi	sp,sp,-16
    80005998:	00113423          	sd	ra,8(sp)
    8000599c:	00813023          	sd	s0,0(sp)
    800059a0:	01010413          	addi	s0,sp,16
    800059a4:	00007797          	auipc	a5,0x7
    800059a8:	19478793          	addi	a5,a5,404 # 8000cb38 <_ZTV16ProducerKeyboard+0x10>
    800059ac:	00f53023          	sd	a5,0(a0)
    800059b0:	ffffd097          	auipc	ra,0xffffd
    800059b4:	de0080e7          	jalr	-544(ra) # 80002790 <_ZN6ThreadD1Ev>
    800059b8:	00813083          	ld	ra,8(sp)
    800059bc:	00013403          	ld	s0,0(sp)
    800059c0:	01010113          	addi	sp,sp,16
    800059c4:	00008067          	ret

00000000800059c8 <_ZN16ProducerKeyboardD0Ev>:
    800059c8:	fe010113          	addi	sp,sp,-32
    800059cc:	00113c23          	sd	ra,24(sp)
    800059d0:	00813823          	sd	s0,16(sp)
    800059d4:	00913423          	sd	s1,8(sp)
    800059d8:	02010413          	addi	s0,sp,32
    800059dc:	00050493          	mv	s1,a0
    800059e0:	00007797          	auipc	a5,0x7
    800059e4:	15878793          	addi	a5,a5,344 # 8000cb38 <_ZTV16ProducerKeyboard+0x10>
    800059e8:	00f53023          	sd	a5,0(a0)
    800059ec:	ffffd097          	auipc	ra,0xffffd
    800059f0:	da4080e7          	jalr	-604(ra) # 80002790 <_ZN6ThreadD1Ev>
    800059f4:	00048513          	mv	a0,s1
    800059f8:	ffffd097          	auipc	ra,0xffffd
    800059fc:	ed8080e7          	jalr	-296(ra) # 800028d0 <_ZdlPv>
    80005a00:	01813083          	ld	ra,24(sp)
    80005a04:	01013403          	ld	s0,16(sp)
    80005a08:	00813483          	ld	s1,8(sp)
    80005a0c:	02010113          	addi	sp,sp,32
    80005a10:	00008067          	ret

0000000080005a14 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005a14:	ff010113          	addi	sp,sp,-16
    80005a18:	00113423          	sd	ra,8(sp)
    80005a1c:	00813023          	sd	s0,0(sp)
    80005a20:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005a24:	02053583          	ld	a1,32(a0)
    80005a28:	fffff097          	auipc	ra,0xfffff
    80005a2c:	7e4080e7          	jalr	2020(ra) # 8000520c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005a30:	00813083          	ld	ra,8(sp)
    80005a34:	00013403          	ld	s0,0(sp)
    80005a38:	01010113          	addi	sp,sp,16
    80005a3c:	00008067          	ret

0000000080005a40 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005a40:	ff010113          	addi	sp,sp,-16
    80005a44:	00113423          	sd	ra,8(sp)
    80005a48:	00813023          	sd	s0,0(sp)
    80005a4c:	01010413          	addi	s0,sp,16
        producer(td);
    80005a50:	02053583          	ld	a1,32(a0)
    80005a54:	00000097          	auipc	ra,0x0
    80005a58:	878080e7          	jalr	-1928(ra) # 800052cc <_ZN12ProducerSync8producerEPv>
    }
    80005a5c:	00813083          	ld	ra,8(sp)
    80005a60:	00013403          	ld	s0,0(sp)
    80005a64:	01010113          	addi	sp,sp,16
    80005a68:	00008067          	ret

0000000080005a6c <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005a6c:	ff010113          	addi	sp,sp,-16
    80005a70:	00113423          	sd	ra,8(sp)
    80005a74:	00813023          	sd	s0,0(sp)
    80005a78:	01010413          	addi	s0,sp,16
        consumer(td);
    80005a7c:	02053583          	ld	a1,32(a0)
    80005a80:	00000097          	auipc	ra,0x0
    80005a84:	8e0080e7          	jalr	-1824(ra) # 80005360 <_ZN12ConsumerSync8consumerEPv>
    }
    80005a88:	00813083          	ld	ra,8(sp)
    80005a8c:	00013403          	ld	s0,0(sp)
    80005a90:	01010113          	addi	sp,sp,16
    80005a94:	00008067          	ret

0000000080005a98 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005a98:	fe010113          	addi	sp,sp,-32
    80005a9c:	00113c23          	sd	ra,24(sp)
    80005aa0:	00813823          	sd	s0,16(sp)
    80005aa4:	00913423          	sd	s1,8(sp)
    80005aa8:	02010413          	addi	s0,sp,32
    80005aac:	00050493          	mv	s1,a0
    LOCK();
    80005ab0:	00100613          	li	a2,1
    80005ab4:	00000593          	li	a1,0
    80005ab8:	00007517          	auipc	a0,0x7
    80005abc:	32850513          	addi	a0,a0,808 # 8000cde0 <lockPrint>
    80005ac0:	ffffb097          	auipc	ra,0xffffb
    80005ac4:	664080e7          	jalr	1636(ra) # 80001124 <copy_and_swap>
    80005ac8:	00050863          	beqz	a0,80005ad8 <_Z11printStringPKc+0x40>
    80005acc:	ffffc097          	auipc	ra,0xffffc
    80005ad0:	968080e7          	jalr	-1688(ra) # 80001434 <_Z15thread_dispatchv>
    80005ad4:	fddff06f          	j	80005ab0 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005ad8:	0004c503          	lbu	a0,0(s1)
    80005adc:	00050a63          	beqz	a0,80005af0 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005ae0:	ffffc097          	auipc	ra,0xffffc
    80005ae4:	abc080e7          	jalr	-1348(ra) # 8000159c <_Z4putcc>
        string++;
    80005ae8:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005aec:	fedff06f          	j	80005ad8 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005af0:	00000613          	li	a2,0
    80005af4:	00100593          	li	a1,1
    80005af8:	00007517          	auipc	a0,0x7
    80005afc:	2e850513          	addi	a0,a0,744 # 8000cde0 <lockPrint>
    80005b00:	ffffb097          	auipc	ra,0xffffb
    80005b04:	624080e7          	jalr	1572(ra) # 80001124 <copy_and_swap>
    80005b08:	fe0514e3          	bnez	a0,80005af0 <_Z11printStringPKc+0x58>
}
    80005b0c:	01813083          	ld	ra,24(sp)
    80005b10:	01013403          	ld	s0,16(sp)
    80005b14:	00813483          	ld	s1,8(sp)
    80005b18:	02010113          	addi	sp,sp,32
    80005b1c:	00008067          	ret

0000000080005b20 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005b20:	fd010113          	addi	sp,sp,-48
    80005b24:	02113423          	sd	ra,40(sp)
    80005b28:	02813023          	sd	s0,32(sp)
    80005b2c:	00913c23          	sd	s1,24(sp)
    80005b30:	01213823          	sd	s2,16(sp)
    80005b34:	01313423          	sd	s3,8(sp)
    80005b38:	01413023          	sd	s4,0(sp)
    80005b3c:	03010413          	addi	s0,sp,48
    80005b40:	00050993          	mv	s3,a0
    80005b44:	00058a13          	mv	s4,a1
    LOCK();
    80005b48:	00100613          	li	a2,1
    80005b4c:	00000593          	li	a1,0
    80005b50:	00007517          	auipc	a0,0x7
    80005b54:	29050513          	addi	a0,a0,656 # 8000cde0 <lockPrint>
    80005b58:	ffffb097          	auipc	ra,0xffffb
    80005b5c:	5cc080e7          	jalr	1484(ra) # 80001124 <copy_and_swap>
    80005b60:	00050863          	beqz	a0,80005b70 <_Z9getStringPci+0x50>
    80005b64:	ffffc097          	auipc	ra,0xffffc
    80005b68:	8d0080e7          	jalr	-1840(ra) # 80001434 <_Z15thread_dispatchv>
    80005b6c:	fddff06f          	j	80005b48 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005b70:	00000913          	li	s2,0
    80005b74:	00090493          	mv	s1,s2
    80005b78:	0019091b          	addiw	s2,s2,1
    80005b7c:	03495a63          	bge	s2,s4,80005bb0 <_Z9getStringPci+0x90>
        cc = getc();
    80005b80:	ffffc097          	auipc	ra,0xffffc
    80005b84:	9f4080e7          	jalr	-1548(ra) # 80001574 <_Z4getcv>
        if(cc < 1)
    80005b88:	02050463          	beqz	a0,80005bb0 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005b8c:	009984b3          	add	s1,s3,s1
    80005b90:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005b94:	00a00793          	li	a5,10
    80005b98:	00f50a63          	beq	a0,a5,80005bac <_Z9getStringPci+0x8c>
    80005b9c:	00d00793          	li	a5,13
    80005ba0:	fcf51ae3          	bne	a0,a5,80005b74 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005ba4:	00090493          	mv	s1,s2
    80005ba8:	0080006f          	j	80005bb0 <_Z9getStringPci+0x90>
    80005bac:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005bb0:	009984b3          	add	s1,s3,s1
    80005bb4:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005bb8:	00000613          	li	a2,0
    80005bbc:	00100593          	li	a1,1
    80005bc0:	00007517          	auipc	a0,0x7
    80005bc4:	22050513          	addi	a0,a0,544 # 8000cde0 <lockPrint>
    80005bc8:	ffffb097          	auipc	ra,0xffffb
    80005bcc:	55c080e7          	jalr	1372(ra) # 80001124 <copy_and_swap>
    80005bd0:	fe0514e3          	bnez	a0,80005bb8 <_Z9getStringPci+0x98>
    return buf;
}
    80005bd4:	00098513          	mv	a0,s3
    80005bd8:	02813083          	ld	ra,40(sp)
    80005bdc:	02013403          	ld	s0,32(sp)
    80005be0:	01813483          	ld	s1,24(sp)
    80005be4:	01013903          	ld	s2,16(sp)
    80005be8:	00813983          	ld	s3,8(sp)
    80005bec:	00013a03          	ld	s4,0(sp)
    80005bf0:	03010113          	addi	sp,sp,48
    80005bf4:	00008067          	ret

0000000080005bf8 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005bf8:	ff010113          	addi	sp,sp,-16
    80005bfc:	00813423          	sd	s0,8(sp)
    80005c00:	01010413          	addi	s0,sp,16
    80005c04:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005c08:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005c0c:	0006c603          	lbu	a2,0(a3)
    80005c10:	fd06071b          	addiw	a4,a2,-48
    80005c14:	0ff77713          	andi	a4,a4,255
    80005c18:	00900793          	li	a5,9
    80005c1c:	02e7e063          	bltu	a5,a4,80005c3c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005c20:	0025179b          	slliw	a5,a0,0x2
    80005c24:	00a787bb          	addw	a5,a5,a0
    80005c28:	0017979b          	slliw	a5,a5,0x1
    80005c2c:	00168693          	addi	a3,a3,1
    80005c30:	00c787bb          	addw	a5,a5,a2
    80005c34:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005c38:	fd5ff06f          	j	80005c0c <_Z11stringToIntPKc+0x14>
    return n;
}
    80005c3c:	00813403          	ld	s0,8(sp)
    80005c40:	01010113          	addi	sp,sp,16
    80005c44:	00008067          	ret

0000000080005c48 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005c48:	fc010113          	addi	sp,sp,-64
    80005c4c:	02113c23          	sd	ra,56(sp)
    80005c50:	02813823          	sd	s0,48(sp)
    80005c54:	02913423          	sd	s1,40(sp)
    80005c58:	03213023          	sd	s2,32(sp)
    80005c5c:	01313c23          	sd	s3,24(sp)
    80005c60:	04010413          	addi	s0,sp,64
    80005c64:	00050493          	mv	s1,a0
    80005c68:	00058913          	mv	s2,a1
    80005c6c:	00060993          	mv	s3,a2
    LOCK();
    80005c70:	00100613          	li	a2,1
    80005c74:	00000593          	li	a1,0
    80005c78:	00007517          	auipc	a0,0x7
    80005c7c:	16850513          	addi	a0,a0,360 # 8000cde0 <lockPrint>
    80005c80:	ffffb097          	auipc	ra,0xffffb
    80005c84:	4a4080e7          	jalr	1188(ra) # 80001124 <copy_and_swap>
    80005c88:	00050863          	beqz	a0,80005c98 <_Z8printIntiii+0x50>
    80005c8c:	ffffb097          	auipc	ra,0xffffb
    80005c90:	7a8080e7          	jalr	1960(ra) # 80001434 <_Z15thread_dispatchv>
    80005c94:	fddff06f          	j	80005c70 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005c98:	00098463          	beqz	s3,80005ca0 <_Z8printIntiii+0x58>
    80005c9c:	0804c463          	bltz	s1,80005d24 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005ca0:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005ca4:	00000593          	li	a1,0
    }

    i = 0;
    80005ca8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005cac:	0009079b          	sext.w	a5,s2
    80005cb0:	0325773b          	remuw	a4,a0,s2
    80005cb4:	00048613          	mv	a2,s1
    80005cb8:	0014849b          	addiw	s1,s1,1
    80005cbc:	02071693          	slli	a3,a4,0x20
    80005cc0:	0206d693          	srli	a3,a3,0x20
    80005cc4:	00007717          	auipc	a4,0x7
    80005cc8:	edc70713          	addi	a4,a4,-292 # 8000cba0 <digits>
    80005ccc:	00d70733          	add	a4,a4,a3
    80005cd0:	00074683          	lbu	a3,0(a4)
    80005cd4:	fd040713          	addi	a4,s0,-48
    80005cd8:	00c70733          	add	a4,a4,a2
    80005cdc:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005ce0:	0005071b          	sext.w	a4,a0
    80005ce4:	0325553b          	divuw	a0,a0,s2
    80005ce8:	fcf772e3          	bgeu	a4,a5,80005cac <_Z8printIntiii+0x64>
    if(neg)
    80005cec:	00058c63          	beqz	a1,80005d04 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005cf0:	fd040793          	addi	a5,s0,-48
    80005cf4:	009784b3          	add	s1,a5,s1
    80005cf8:	02d00793          	li	a5,45
    80005cfc:	fef48823          	sb	a5,-16(s1)
    80005d00:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005d04:	fff4849b          	addiw	s1,s1,-1
    80005d08:	0204c463          	bltz	s1,80005d30 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005d0c:	fd040793          	addi	a5,s0,-48
    80005d10:	009787b3          	add	a5,a5,s1
    80005d14:	ff07c503          	lbu	a0,-16(a5)
    80005d18:	ffffc097          	auipc	ra,0xffffc
    80005d1c:	884080e7          	jalr	-1916(ra) # 8000159c <_Z4putcc>
    80005d20:	fe5ff06f          	j	80005d04 <_Z8printIntiii+0xbc>
        x = -xx;
    80005d24:	4090053b          	negw	a0,s1
        neg = 1;
    80005d28:	00100593          	li	a1,1
        x = -xx;
    80005d2c:	f7dff06f          	j	80005ca8 <_Z8printIntiii+0x60>

    UNLOCK();
    80005d30:	00000613          	li	a2,0
    80005d34:	00100593          	li	a1,1
    80005d38:	00007517          	auipc	a0,0x7
    80005d3c:	0a850513          	addi	a0,a0,168 # 8000cde0 <lockPrint>
    80005d40:	ffffb097          	auipc	ra,0xffffb
    80005d44:	3e4080e7          	jalr	996(ra) # 80001124 <copy_and_swap>
    80005d48:	fe0514e3          	bnez	a0,80005d30 <_Z8printIntiii+0xe8>
    80005d4c:	03813083          	ld	ra,56(sp)
    80005d50:	03013403          	ld	s0,48(sp)
    80005d54:	02813483          	ld	s1,40(sp)
    80005d58:	02013903          	ld	s2,32(sp)
    80005d5c:	01813983          	ld	s3,24(sp)
    80005d60:	04010113          	addi	sp,sp,64
    80005d64:	00008067          	ret

0000000080005d68 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005d68:	fd010113          	addi	sp,sp,-48
    80005d6c:	02113423          	sd	ra,40(sp)
    80005d70:	02813023          	sd	s0,32(sp)
    80005d74:	00913c23          	sd	s1,24(sp)
    80005d78:	01213823          	sd	s2,16(sp)
    80005d7c:	01313423          	sd	s3,8(sp)
    80005d80:	03010413          	addi	s0,sp,48
    80005d84:	00050493          	mv	s1,a0
    80005d88:	00058913          	mv	s2,a1
    80005d8c:	0015879b          	addiw	a5,a1,1
    80005d90:	0007851b          	sext.w	a0,a5
    80005d94:	00f4a023          	sw	a5,0(s1)
    80005d98:	0004a823          	sw	zero,16(s1)
    80005d9c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005da0:	00251513          	slli	a0,a0,0x2
    80005da4:	ffffb097          	auipc	ra,0xffffb
    80005da8:	564080e7          	jalr	1380(ra) # 80001308 <_Z9mem_allocm>
    80005dac:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005db0:	01000513          	li	a0,16
    80005db4:	ffffd097          	auipc	ra,0xffffd
    80005db8:	acc080e7          	jalr	-1332(ra) # 80002880 <_Znwm>
    80005dbc:	00050993          	mv	s3,a0
    80005dc0:	00000593          	li	a1,0
    80005dc4:	ffffd097          	auipc	ra,0xffffd
    80005dc8:	e20080e7          	jalr	-480(ra) # 80002be4 <_ZN9SemaphoreC1Ej>
    80005dcc:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005dd0:	01000513          	li	a0,16
    80005dd4:	ffffd097          	auipc	ra,0xffffd
    80005dd8:	aac080e7          	jalr	-1364(ra) # 80002880 <_Znwm>
    80005ddc:	00050993          	mv	s3,a0
    80005de0:	00090593          	mv	a1,s2
    80005de4:	ffffd097          	auipc	ra,0xffffd
    80005de8:	e00080e7          	jalr	-512(ra) # 80002be4 <_ZN9SemaphoreC1Ej>
    80005dec:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005df0:	01000513          	li	a0,16
    80005df4:	ffffd097          	auipc	ra,0xffffd
    80005df8:	a8c080e7          	jalr	-1396(ra) # 80002880 <_Znwm>
    80005dfc:	00050913          	mv	s2,a0
    80005e00:	00100593          	li	a1,1
    80005e04:	ffffd097          	auipc	ra,0xffffd
    80005e08:	de0080e7          	jalr	-544(ra) # 80002be4 <_ZN9SemaphoreC1Ej>
    80005e0c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005e10:	01000513          	li	a0,16
    80005e14:	ffffd097          	auipc	ra,0xffffd
    80005e18:	a6c080e7          	jalr	-1428(ra) # 80002880 <_Znwm>
    80005e1c:	00050913          	mv	s2,a0
    80005e20:	00100593          	li	a1,1
    80005e24:	ffffd097          	auipc	ra,0xffffd
    80005e28:	dc0080e7          	jalr	-576(ra) # 80002be4 <_ZN9SemaphoreC1Ej>
    80005e2c:	0324b823          	sd	s2,48(s1)
}
    80005e30:	02813083          	ld	ra,40(sp)
    80005e34:	02013403          	ld	s0,32(sp)
    80005e38:	01813483          	ld	s1,24(sp)
    80005e3c:	01013903          	ld	s2,16(sp)
    80005e40:	00813983          	ld	s3,8(sp)
    80005e44:	03010113          	addi	sp,sp,48
    80005e48:	00008067          	ret
    80005e4c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005e50:	00098513          	mv	a0,s3
    80005e54:	ffffd097          	auipc	ra,0xffffd
    80005e58:	a7c080e7          	jalr	-1412(ra) # 800028d0 <_ZdlPv>
    80005e5c:	00048513          	mv	a0,s1
    80005e60:	00008097          	auipc	ra,0x8
    80005e64:	078080e7          	jalr	120(ra) # 8000ded8 <_Unwind_Resume>
    80005e68:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005e6c:	00098513          	mv	a0,s3
    80005e70:	ffffd097          	auipc	ra,0xffffd
    80005e74:	a60080e7          	jalr	-1440(ra) # 800028d0 <_ZdlPv>
    80005e78:	00048513          	mv	a0,s1
    80005e7c:	00008097          	auipc	ra,0x8
    80005e80:	05c080e7          	jalr	92(ra) # 8000ded8 <_Unwind_Resume>
    80005e84:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005e88:	00090513          	mv	a0,s2
    80005e8c:	ffffd097          	auipc	ra,0xffffd
    80005e90:	a44080e7          	jalr	-1468(ra) # 800028d0 <_ZdlPv>
    80005e94:	00048513          	mv	a0,s1
    80005e98:	00008097          	auipc	ra,0x8
    80005e9c:	040080e7          	jalr	64(ra) # 8000ded8 <_Unwind_Resume>
    80005ea0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005ea4:	00090513          	mv	a0,s2
    80005ea8:	ffffd097          	auipc	ra,0xffffd
    80005eac:	a28080e7          	jalr	-1496(ra) # 800028d0 <_ZdlPv>
    80005eb0:	00048513          	mv	a0,s1
    80005eb4:	00008097          	auipc	ra,0x8
    80005eb8:	024080e7          	jalr	36(ra) # 8000ded8 <_Unwind_Resume>

0000000080005ebc <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005ebc:	fe010113          	addi	sp,sp,-32
    80005ec0:	00113c23          	sd	ra,24(sp)
    80005ec4:	00813823          	sd	s0,16(sp)
    80005ec8:	00913423          	sd	s1,8(sp)
    80005ecc:	01213023          	sd	s2,0(sp)
    80005ed0:	02010413          	addi	s0,sp,32
    80005ed4:	00050493          	mv	s1,a0
    80005ed8:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005edc:	01853503          	ld	a0,24(a0)
    80005ee0:	ffffd097          	auipc	ra,0xffffd
    80005ee4:	d3c080e7          	jalr	-708(ra) # 80002c1c <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005ee8:	0304b503          	ld	a0,48(s1)
    80005eec:	ffffd097          	auipc	ra,0xffffd
    80005ef0:	d30080e7          	jalr	-720(ra) # 80002c1c <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005ef4:	0084b783          	ld	a5,8(s1)
    80005ef8:	0144a703          	lw	a4,20(s1)
    80005efc:	00271713          	slli	a4,a4,0x2
    80005f00:	00e787b3          	add	a5,a5,a4
    80005f04:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005f08:	0144a783          	lw	a5,20(s1)
    80005f0c:	0017879b          	addiw	a5,a5,1
    80005f10:	0004a703          	lw	a4,0(s1)
    80005f14:	02e7e7bb          	remw	a5,a5,a4
    80005f18:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005f1c:	0304b503          	ld	a0,48(s1)
    80005f20:	ffffd097          	auipc	ra,0xffffd
    80005f24:	d28080e7          	jalr	-728(ra) # 80002c48 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005f28:	0204b503          	ld	a0,32(s1)
    80005f2c:	ffffd097          	auipc	ra,0xffffd
    80005f30:	d1c080e7          	jalr	-740(ra) # 80002c48 <_ZN9Semaphore6signalEv>

}
    80005f34:	01813083          	ld	ra,24(sp)
    80005f38:	01013403          	ld	s0,16(sp)
    80005f3c:	00813483          	ld	s1,8(sp)
    80005f40:	00013903          	ld	s2,0(sp)
    80005f44:	02010113          	addi	sp,sp,32
    80005f48:	00008067          	ret

0000000080005f4c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005f4c:	fe010113          	addi	sp,sp,-32
    80005f50:	00113c23          	sd	ra,24(sp)
    80005f54:	00813823          	sd	s0,16(sp)
    80005f58:	00913423          	sd	s1,8(sp)
    80005f5c:	01213023          	sd	s2,0(sp)
    80005f60:	02010413          	addi	s0,sp,32
    80005f64:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005f68:	02053503          	ld	a0,32(a0)
    80005f6c:	ffffd097          	auipc	ra,0xffffd
    80005f70:	cb0080e7          	jalr	-848(ra) # 80002c1c <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005f74:	0284b503          	ld	a0,40(s1)
    80005f78:	ffffd097          	auipc	ra,0xffffd
    80005f7c:	ca4080e7          	jalr	-860(ra) # 80002c1c <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005f80:	0084b703          	ld	a4,8(s1)
    80005f84:	0104a783          	lw	a5,16(s1)
    80005f88:	00279693          	slli	a3,a5,0x2
    80005f8c:	00d70733          	add	a4,a4,a3
    80005f90:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005f94:	0017879b          	addiw	a5,a5,1
    80005f98:	0004a703          	lw	a4,0(s1)
    80005f9c:	02e7e7bb          	remw	a5,a5,a4
    80005fa0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005fa4:	0284b503          	ld	a0,40(s1)
    80005fa8:	ffffd097          	auipc	ra,0xffffd
    80005fac:	ca0080e7          	jalr	-864(ra) # 80002c48 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005fb0:	0184b503          	ld	a0,24(s1)
    80005fb4:	ffffd097          	auipc	ra,0xffffd
    80005fb8:	c94080e7          	jalr	-876(ra) # 80002c48 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005fbc:	00090513          	mv	a0,s2
    80005fc0:	01813083          	ld	ra,24(sp)
    80005fc4:	01013403          	ld	s0,16(sp)
    80005fc8:	00813483          	ld	s1,8(sp)
    80005fcc:	00013903          	ld	s2,0(sp)
    80005fd0:	02010113          	addi	sp,sp,32
    80005fd4:	00008067          	ret

0000000080005fd8 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005fd8:	fe010113          	addi	sp,sp,-32
    80005fdc:	00113c23          	sd	ra,24(sp)
    80005fe0:	00813823          	sd	s0,16(sp)
    80005fe4:	00913423          	sd	s1,8(sp)
    80005fe8:	01213023          	sd	s2,0(sp)
    80005fec:	02010413          	addi	s0,sp,32
    80005ff0:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005ff4:	02853503          	ld	a0,40(a0)
    80005ff8:	ffffd097          	auipc	ra,0xffffd
    80005ffc:	c24080e7          	jalr	-988(ra) # 80002c1c <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006000:	0304b503          	ld	a0,48(s1)
    80006004:	ffffd097          	auipc	ra,0xffffd
    80006008:	c18080e7          	jalr	-1000(ra) # 80002c1c <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    8000600c:	0144a783          	lw	a5,20(s1)
    80006010:	0104a903          	lw	s2,16(s1)
    80006014:	0327ce63          	blt	a5,s2,80006050 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006018:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    8000601c:	0304b503          	ld	a0,48(s1)
    80006020:	ffffd097          	auipc	ra,0xffffd
    80006024:	c28080e7          	jalr	-984(ra) # 80002c48 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006028:	0284b503          	ld	a0,40(s1)
    8000602c:	ffffd097          	auipc	ra,0xffffd
    80006030:	c1c080e7          	jalr	-996(ra) # 80002c48 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006034:	00090513          	mv	a0,s2
    80006038:	01813083          	ld	ra,24(sp)
    8000603c:	01013403          	ld	s0,16(sp)
    80006040:	00813483          	ld	s1,8(sp)
    80006044:	00013903          	ld	s2,0(sp)
    80006048:	02010113          	addi	sp,sp,32
    8000604c:	00008067          	ret
        ret = cap - head + tail;
    80006050:	0004a703          	lw	a4,0(s1)
    80006054:	4127093b          	subw	s2,a4,s2
    80006058:	00f9093b          	addw	s2,s2,a5
    8000605c:	fc1ff06f          	j	8000601c <_ZN9BufferCPP6getCntEv+0x44>

0000000080006060 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006060:	fe010113          	addi	sp,sp,-32
    80006064:	00113c23          	sd	ra,24(sp)
    80006068:	00813823          	sd	s0,16(sp)
    8000606c:	00913423          	sd	s1,8(sp)
    80006070:	02010413          	addi	s0,sp,32
    80006074:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006078:	00a00513          	li	a0,10
    8000607c:	ffffd097          	auipc	ra,0xffffd
    80006080:	c90080e7          	jalr	-880(ra) # 80002d0c <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006084:	00004517          	auipc	a0,0x4
    80006088:	35450513          	addi	a0,a0,852 # 8000a3d8 <CONSOLE_STATUS+0x3c8>
    8000608c:	00000097          	auipc	ra,0x0
    80006090:	a0c080e7          	jalr	-1524(ra) # 80005a98 <_Z11printStringPKc>
    while (getCnt()) {
    80006094:	00048513          	mv	a0,s1
    80006098:	00000097          	auipc	ra,0x0
    8000609c:	f40080e7          	jalr	-192(ra) # 80005fd8 <_ZN9BufferCPP6getCntEv>
    800060a0:	02050c63          	beqz	a0,800060d8 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800060a4:	0084b783          	ld	a5,8(s1)
    800060a8:	0104a703          	lw	a4,16(s1)
    800060ac:	00271713          	slli	a4,a4,0x2
    800060b0:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800060b4:	0007c503          	lbu	a0,0(a5)
    800060b8:	ffffd097          	auipc	ra,0xffffd
    800060bc:	c54080e7          	jalr	-940(ra) # 80002d0c <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800060c0:	0104a783          	lw	a5,16(s1)
    800060c4:	0017879b          	addiw	a5,a5,1
    800060c8:	0004a703          	lw	a4,0(s1)
    800060cc:	02e7e7bb          	remw	a5,a5,a4
    800060d0:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800060d4:	fc1ff06f          	j	80006094 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800060d8:	02100513          	li	a0,33
    800060dc:	ffffd097          	auipc	ra,0xffffd
    800060e0:	c30080e7          	jalr	-976(ra) # 80002d0c <_ZN7Console4putcEc>
    Console::putc('\n');
    800060e4:	00a00513          	li	a0,10
    800060e8:	ffffd097          	auipc	ra,0xffffd
    800060ec:	c24080e7          	jalr	-988(ra) # 80002d0c <_ZN7Console4putcEc>
    mem_free(buffer);
    800060f0:	0084b503          	ld	a0,8(s1)
    800060f4:	ffffb097          	auipc	ra,0xffffb
    800060f8:	254080e7          	jalr	596(ra) # 80001348 <_Z8mem_freePv>
    delete itemAvailable;
    800060fc:	0204b503          	ld	a0,32(s1)
    80006100:	00050863          	beqz	a0,80006110 <_ZN9BufferCPPD1Ev+0xb0>
    80006104:	00053783          	ld	a5,0(a0)
    80006108:	0087b783          	ld	a5,8(a5)
    8000610c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006110:	0184b503          	ld	a0,24(s1)
    80006114:	00050863          	beqz	a0,80006124 <_ZN9BufferCPPD1Ev+0xc4>
    80006118:	00053783          	ld	a5,0(a0)
    8000611c:	0087b783          	ld	a5,8(a5)
    80006120:	000780e7          	jalr	a5
    delete mutexTail;
    80006124:	0304b503          	ld	a0,48(s1)
    80006128:	00050863          	beqz	a0,80006138 <_ZN9BufferCPPD1Ev+0xd8>
    8000612c:	00053783          	ld	a5,0(a0)
    80006130:	0087b783          	ld	a5,8(a5)
    80006134:	000780e7          	jalr	a5
    delete mutexHead;
    80006138:	0284b503          	ld	a0,40(s1)
    8000613c:	00050863          	beqz	a0,8000614c <_ZN9BufferCPPD1Ev+0xec>
    80006140:	00053783          	ld	a5,0(a0)
    80006144:	0087b783          	ld	a5,8(a5)
    80006148:	000780e7          	jalr	a5
}
    8000614c:	01813083          	ld	ra,24(sp)
    80006150:	01013403          	ld	s0,16(sp)
    80006154:	00813483          	ld	s1,8(sp)
    80006158:	02010113          	addi	sp,sp,32
    8000615c:	00008067          	ret

0000000080006160 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80006160:	fe010113          	addi	sp,sp,-32
    80006164:	00113c23          	sd	ra,24(sp)
    80006168:	00813823          	sd	s0,16(sp)
    8000616c:	00913423          	sd	s1,8(sp)
    80006170:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80006174:	00004517          	auipc	a0,0x4
    80006178:	27c50513          	addi	a0,a0,636 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    8000617c:	00000097          	auipc	ra,0x0
    80006180:	91c080e7          	jalr	-1764(ra) # 80005a98 <_Z11printStringPKc>
    int test = getc() - '0';
    80006184:	ffffb097          	auipc	ra,0xffffb
    80006188:	3f0080e7          	jalr	1008(ra) # 80001574 <_Z4getcv>
    8000618c:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80006190:	ffffb097          	auipc	ra,0xffffb
    80006194:	3e4080e7          	jalr	996(ra) # 80001574 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006198:	00700793          	li	a5,7
    8000619c:	1097e263          	bltu	a5,s1,800062a0 <_Z8userMainv+0x140>
    800061a0:	00249493          	slli	s1,s1,0x2
    800061a4:	00004717          	auipc	a4,0x4
    800061a8:	4a470713          	addi	a4,a4,1188 # 8000a648 <CONSOLE_STATUS+0x638>
    800061ac:	00e484b3          	add	s1,s1,a4
    800061b0:	0004a783          	lw	a5,0(s1)
    800061b4:	00e787b3          	add	a5,a5,a4
    800061b8:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    800061bc:	fffff097          	auipc	ra,0xfffff
    800061c0:	f54080e7          	jalr	-172(ra) # 80005110 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    800061c4:	00004517          	auipc	a0,0x4
    800061c8:	24c50513          	addi	a0,a0,588 # 8000a410 <CONSOLE_STATUS+0x400>
    800061cc:	00000097          	auipc	ra,0x0
    800061d0:	8cc080e7          	jalr	-1844(ra) # 80005a98 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    800061d4:	01813083          	ld	ra,24(sp)
    800061d8:	01013403          	ld	s0,16(sp)
    800061dc:	00813483          	ld	s1,8(sp)
    800061e0:	02010113          	addi	sp,sp,32
    800061e4:	00008067          	ret
            Threads_CPP_API_test();
    800061e8:	ffffe097          	auipc	ra,0xffffe
    800061ec:	e08080e7          	jalr	-504(ra) # 80003ff0 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    800061f0:	00004517          	auipc	a0,0x4
    800061f4:	26050513          	addi	a0,a0,608 # 8000a450 <CONSOLE_STATUS+0x440>
    800061f8:	00000097          	auipc	ra,0x0
    800061fc:	8a0080e7          	jalr	-1888(ra) # 80005a98 <_Z11printStringPKc>
            break;
    80006200:	fd5ff06f          	j	800061d4 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006204:	ffffd097          	auipc	ra,0xffffd
    80006208:	640080e7          	jalr	1600(ra) # 80003844 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    8000620c:	00004517          	auipc	a0,0x4
    80006210:	28450513          	addi	a0,a0,644 # 8000a490 <CONSOLE_STATUS+0x480>
    80006214:	00000097          	auipc	ra,0x0
    80006218:	884080e7          	jalr	-1916(ra) # 80005a98 <_Z11printStringPKc>
            break;
    8000621c:	fb9ff06f          	j	800061d4 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006220:	fffff097          	auipc	ra,0xfffff
    80006224:	234080e7          	jalr	564(ra) # 80005454 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006228:	00004517          	auipc	a0,0x4
    8000622c:	2b850513          	addi	a0,a0,696 # 8000a4e0 <CONSOLE_STATUS+0x4d0>
    80006230:	00000097          	auipc	ra,0x0
    80006234:	868080e7          	jalr	-1944(ra) # 80005a98 <_Z11printStringPKc>
            break;
    80006238:	f9dff06f          	j	800061d4 <_Z8userMainv+0x74>
            testSleeping();
    8000623c:	00000097          	auipc	ra,0x0
    80006240:	11c080e7          	jalr	284(ra) # 80006358 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006244:	00004517          	auipc	a0,0x4
    80006248:	2f450513          	addi	a0,a0,756 # 8000a538 <CONSOLE_STATUS+0x528>
    8000624c:	00000097          	auipc	ra,0x0
    80006250:	84c080e7          	jalr	-1972(ra) # 80005a98 <_Z11printStringPKc>
            break;
    80006254:	f81ff06f          	j	800061d4 <_Z8userMainv+0x74>
            testConsumerProducer();
    80006258:	ffffe097          	auipc	ra,0xffffe
    8000625c:	258080e7          	jalr	600(ra) # 800044b0 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006260:	00004517          	auipc	a0,0x4
    80006264:	30850513          	addi	a0,a0,776 # 8000a568 <CONSOLE_STATUS+0x558>
    80006268:	00000097          	auipc	ra,0x0
    8000626c:	830080e7          	jalr	-2000(ra) # 80005a98 <_Z11printStringPKc>
            break;
    80006270:	f65ff06f          	j	800061d4 <_Z8userMainv+0x74>
            System_Mode_test();
    80006274:	00000097          	auipc	ra,0x0
    80006278:	658080e7          	jalr	1624(ra) # 800068cc <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    8000627c:	00004517          	auipc	a0,0x4
    80006280:	32c50513          	addi	a0,a0,812 # 8000a5a8 <CONSOLE_STATUS+0x598>
    80006284:	00000097          	auipc	ra,0x0
    80006288:	814080e7          	jalr	-2028(ra) # 80005a98 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    8000628c:	00004517          	auipc	a0,0x4
    80006290:	33c50513          	addi	a0,a0,828 # 8000a5c8 <CONSOLE_STATUS+0x5b8>
    80006294:	00000097          	auipc	ra,0x0
    80006298:	804080e7          	jalr	-2044(ra) # 80005a98 <_Z11printStringPKc>
            break;
    8000629c:	f39ff06f          	j	800061d4 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    800062a0:	00004517          	auipc	a0,0x4
    800062a4:	38050513          	addi	a0,a0,896 # 8000a620 <CONSOLE_STATUS+0x610>
    800062a8:	fffff097          	auipc	ra,0xfffff
    800062ac:	7f0080e7          	jalr	2032(ra) # 80005a98 <_Z11printStringPKc>
    800062b0:	f25ff06f          	j	800061d4 <_Z8userMainv+0x74>

00000000800062b4 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800062b4:	fe010113          	addi	sp,sp,-32
    800062b8:	00113c23          	sd	ra,24(sp)
    800062bc:	00813823          	sd	s0,16(sp)
    800062c0:	00913423          	sd	s1,8(sp)
    800062c4:	01213023          	sd	s2,0(sp)
    800062c8:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800062cc:	00053903          	ld	s2,0(a0)
    int i = 6;
    800062d0:	00600493          	li	s1,6
    while (--i > 0) {
    800062d4:	fff4849b          	addiw	s1,s1,-1
    800062d8:	04905463          	blez	s1,80006320 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    800062dc:	00004517          	auipc	a0,0x4
    800062e0:	38c50513          	addi	a0,a0,908 # 8000a668 <CONSOLE_STATUS+0x658>
    800062e4:	fffff097          	auipc	ra,0xfffff
    800062e8:	7b4080e7          	jalr	1972(ra) # 80005a98 <_Z11printStringPKc>
        printInt(sleep_time);
    800062ec:	00000613          	li	a2,0
    800062f0:	00a00593          	li	a1,10
    800062f4:	0009051b          	sext.w	a0,s2
    800062f8:	00000097          	auipc	ra,0x0
    800062fc:	950080e7          	jalr	-1712(ra) # 80005c48 <_Z8printIntiii>
        printString(" !\n");
    80006300:	00004517          	auipc	a0,0x4
    80006304:	37050513          	addi	a0,a0,880 # 8000a670 <CONSOLE_STATUS+0x660>
    80006308:	fffff097          	auipc	ra,0xfffff
    8000630c:	790080e7          	jalr	1936(ra) # 80005a98 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006310:	00090513          	mv	a0,s2
    80006314:	ffffb097          	auipc	ra,0xffffb
    80006318:	168080e7          	jalr	360(ra) # 8000147c <_Z10time_sleepm>
    while (--i > 0) {
    8000631c:	fb9ff06f          	j	800062d4 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006320:	00a00793          	li	a5,10
    80006324:	02f95933          	divu	s2,s2,a5
    80006328:	fff90913          	addi	s2,s2,-1
    8000632c:	00007797          	auipc	a5,0x7
    80006330:	abc78793          	addi	a5,a5,-1348 # 8000cde8 <_ZL8finished>
    80006334:	01278933          	add	s2,a5,s2
    80006338:	00100793          	li	a5,1
    8000633c:	00f90023          	sb	a5,0(s2)
}
    80006340:	01813083          	ld	ra,24(sp)
    80006344:	01013403          	ld	s0,16(sp)
    80006348:	00813483          	ld	s1,8(sp)
    8000634c:	00013903          	ld	s2,0(sp)
    80006350:	02010113          	addi	sp,sp,32
    80006354:	00008067          	ret

0000000080006358 <_Z12testSleepingv>:

void testSleeping() {
    80006358:	fc010113          	addi	sp,sp,-64
    8000635c:	02113c23          	sd	ra,56(sp)
    80006360:	02813823          	sd	s0,48(sp)
    80006364:	02913423          	sd	s1,40(sp)
    80006368:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    8000636c:	00a00793          	li	a5,10
    80006370:	fcf43823          	sd	a5,-48(s0)
    80006374:	01400793          	li	a5,20
    80006378:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    8000637c:	00000493          	li	s1,0
    80006380:	02c0006f          	j	800063ac <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006384:	00349793          	slli	a5,s1,0x3
    80006388:	fd040613          	addi	a2,s0,-48
    8000638c:	00f60633          	add	a2,a2,a5
    80006390:	00000597          	auipc	a1,0x0
    80006394:	f2458593          	addi	a1,a1,-220 # 800062b4 <_ZL9sleepyRunPv>
    80006398:	fc040513          	addi	a0,s0,-64
    8000639c:	00f50533          	add	a0,a0,a5
    800063a0:	ffffb097          	auipc	ra,0xffffb
    800063a4:	fd8080e7          	jalr	-40(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800063a8:	0014849b          	addiw	s1,s1,1
    800063ac:	00100793          	li	a5,1
    800063b0:	fc97dae3          	bge	a5,s1,80006384 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800063b4:	00007797          	auipc	a5,0x7
    800063b8:	a347c783          	lbu	a5,-1484(a5) # 8000cde8 <_ZL8finished>
    800063bc:	fe078ce3          	beqz	a5,800063b4 <_Z12testSleepingv+0x5c>
    800063c0:	00007797          	auipc	a5,0x7
    800063c4:	a297c783          	lbu	a5,-1495(a5) # 8000cde9 <_ZL8finished+0x1>
    800063c8:	fe0786e3          	beqz	a5,800063b4 <_Z12testSleepingv+0x5c>
}
    800063cc:	03813083          	ld	ra,56(sp)
    800063d0:	03013403          	ld	s0,48(sp)
    800063d4:	02813483          	ld	s1,40(sp)
    800063d8:	04010113          	addi	sp,sp,64
    800063dc:	00008067          	ret

00000000800063e0 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800063e0:	fe010113          	addi	sp,sp,-32
    800063e4:	00113c23          	sd	ra,24(sp)
    800063e8:	00813823          	sd	s0,16(sp)
    800063ec:	00913423          	sd	s1,8(sp)
    800063f0:	01213023          	sd	s2,0(sp)
    800063f4:	02010413          	addi	s0,sp,32
    800063f8:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800063fc:	00100793          	li	a5,1
    80006400:	02a7f863          	bgeu	a5,a0,80006430 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006404:	00a00793          	li	a5,10
    80006408:	02f577b3          	remu	a5,a0,a5
    8000640c:	02078e63          	beqz	a5,80006448 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006410:	fff48513          	addi	a0,s1,-1
    80006414:	00000097          	auipc	ra,0x0
    80006418:	fcc080e7          	jalr	-52(ra) # 800063e0 <_ZL9fibonaccim>
    8000641c:	00050913          	mv	s2,a0
    80006420:	ffe48513          	addi	a0,s1,-2
    80006424:	00000097          	auipc	ra,0x0
    80006428:	fbc080e7          	jalr	-68(ra) # 800063e0 <_ZL9fibonaccim>
    8000642c:	00a90533          	add	a0,s2,a0
}
    80006430:	01813083          	ld	ra,24(sp)
    80006434:	01013403          	ld	s0,16(sp)
    80006438:	00813483          	ld	s1,8(sp)
    8000643c:	00013903          	ld	s2,0(sp)
    80006440:	02010113          	addi	sp,sp,32
    80006444:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006448:	ffffb097          	auipc	ra,0xffffb
    8000644c:	fec080e7          	jalr	-20(ra) # 80001434 <_Z15thread_dispatchv>
    80006450:	fc1ff06f          	j	80006410 <_ZL9fibonaccim+0x30>

0000000080006454 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006454:	fe010113          	addi	sp,sp,-32
    80006458:	00113c23          	sd	ra,24(sp)
    8000645c:	00813823          	sd	s0,16(sp)
    80006460:	00913423          	sd	s1,8(sp)
    80006464:	01213023          	sd	s2,0(sp)
    80006468:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000646c:	00a00493          	li	s1,10
    80006470:	0400006f          	j	800064b0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006474:	00004517          	auipc	a0,0x4
    80006478:	ecc50513          	addi	a0,a0,-308 # 8000a340 <CONSOLE_STATUS+0x330>
    8000647c:	fffff097          	auipc	ra,0xfffff
    80006480:	61c080e7          	jalr	1564(ra) # 80005a98 <_Z11printStringPKc>
    80006484:	00000613          	li	a2,0
    80006488:	00a00593          	li	a1,10
    8000648c:	00048513          	mv	a0,s1
    80006490:	fffff097          	auipc	ra,0xfffff
    80006494:	7b8080e7          	jalr	1976(ra) # 80005c48 <_Z8printIntiii>
    80006498:	00004517          	auipc	a0,0x4
    8000649c:	09850513          	addi	a0,a0,152 # 8000a530 <CONSOLE_STATUS+0x520>
    800064a0:	fffff097          	auipc	ra,0xfffff
    800064a4:	5f8080e7          	jalr	1528(ra) # 80005a98 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800064a8:	0014849b          	addiw	s1,s1,1
    800064ac:	0ff4f493          	andi	s1,s1,255
    800064b0:	00c00793          	li	a5,12
    800064b4:	fc97f0e3          	bgeu	a5,s1,80006474 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800064b8:	00004517          	auipc	a0,0x4
    800064bc:	e9050513          	addi	a0,a0,-368 # 8000a348 <CONSOLE_STATUS+0x338>
    800064c0:	fffff097          	auipc	ra,0xfffff
    800064c4:	5d8080e7          	jalr	1496(ra) # 80005a98 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800064c8:	00500313          	li	t1,5
    thread_dispatch();
    800064cc:	ffffb097          	auipc	ra,0xffffb
    800064d0:	f68080e7          	jalr	-152(ra) # 80001434 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800064d4:	01000513          	li	a0,16
    800064d8:	00000097          	auipc	ra,0x0
    800064dc:	f08080e7          	jalr	-248(ra) # 800063e0 <_ZL9fibonaccim>
    800064e0:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800064e4:	00004517          	auipc	a0,0x4
    800064e8:	e7450513          	addi	a0,a0,-396 # 8000a358 <CONSOLE_STATUS+0x348>
    800064ec:	fffff097          	auipc	ra,0xfffff
    800064f0:	5ac080e7          	jalr	1452(ra) # 80005a98 <_Z11printStringPKc>
    800064f4:	00000613          	li	a2,0
    800064f8:	00a00593          	li	a1,10
    800064fc:	0009051b          	sext.w	a0,s2
    80006500:	fffff097          	auipc	ra,0xfffff
    80006504:	748080e7          	jalr	1864(ra) # 80005c48 <_Z8printIntiii>
    80006508:	00004517          	auipc	a0,0x4
    8000650c:	02850513          	addi	a0,a0,40 # 8000a530 <CONSOLE_STATUS+0x520>
    80006510:	fffff097          	auipc	ra,0xfffff
    80006514:	588080e7          	jalr	1416(ra) # 80005a98 <_Z11printStringPKc>
    80006518:	0400006f          	j	80006558 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000651c:	00004517          	auipc	a0,0x4
    80006520:	e2450513          	addi	a0,a0,-476 # 8000a340 <CONSOLE_STATUS+0x330>
    80006524:	fffff097          	auipc	ra,0xfffff
    80006528:	574080e7          	jalr	1396(ra) # 80005a98 <_Z11printStringPKc>
    8000652c:	00000613          	li	a2,0
    80006530:	00a00593          	li	a1,10
    80006534:	00048513          	mv	a0,s1
    80006538:	fffff097          	auipc	ra,0xfffff
    8000653c:	710080e7          	jalr	1808(ra) # 80005c48 <_Z8printIntiii>
    80006540:	00004517          	auipc	a0,0x4
    80006544:	ff050513          	addi	a0,a0,-16 # 8000a530 <CONSOLE_STATUS+0x520>
    80006548:	fffff097          	auipc	ra,0xfffff
    8000654c:	550080e7          	jalr	1360(ra) # 80005a98 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006550:	0014849b          	addiw	s1,s1,1
    80006554:	0ff4f493          	andi	s1,s1,255
    80006558:	00f00793          	li	a5,15
    8000655c:	fc97f0e3          	bgeu	a5,s1,8000651c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006560:	00004517          	auipc	a0,0x4
    80006564:	e0850513          	addi	a0,a0,-504 # 8000a368 <CONSOLE_STATUS+0x358>
    80006568:	fffff097          	auipc	ra,0xfffff
    8000656c:	530080e7          	jalr	1328(ra) # 80005a98 <_Z11printStringPKc>
    finishedD = true;
    80006570:	00100793          	li	a5,1
    80006574:	00007717          	auipc	a4,0x7
    80006578:	86f70b23          	sb	a5,-1930(a4) # 8000cdea <_ZL9finishedD>
    thread_dispatch();
    8000657c:	ffffb097          	auipc	ra,0xffffb
    80006580:	eb8080e7          	jalr	-328(ra) # 80001434 <_Z15thread_dispatchv>
}
    80006584:	01813083          	ld	ra,24(sp)
    80006588:	01013403          	ld	s0,16(sp)
    8000658c:	00813483          	ld	s1,8(sp)
    80006590:	00013903          	ld	s2,0(sp)
    80006594:	02010113          	addi	sp,sp,32
    80006598:	00008067          	ret

000000008000659c <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    8000659c:	fe010113          	addi	sp,sp,-32
    800065a0:	00113c23          	sd	ra,24(sp)
    800065a4:	00813823          	sd	s0,16(sp)
    800065a8:	00913423          	sd	s1,8(sp)
    800065ac:	01213023          	sd	s2,0(sp)
    800065b0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800065b4:	00000493          	li	s1,0
    800065b8:	0400006f          	j	800065f8 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800065bc:	00004517          	auipc	a0,0x4
    800065c0:	d4450513          	addi	a0,a0,-700 # 8000a300 <CONSOLE_STATUS+0x2f0>
    800065c4:	fffff097          	auipc	ra,0xfffff
    800065c8:	4d4080e7          	jalr	1236(ra) # 80005a98 <_Z11printStringPKc>
    800065cc:	00000613          	li	a2,0
    800065d0:	00a00593          	li	a1,10
    800065d4:	00048513          	mv	a0,s1
    800065d8:	fffff097          	auipc	ra,0xfffff
    800065dc:	670080e7          	jalr	1648(ra) # 80005c48 <_Z8printIntiii>
    800065e0:	00004517          	auipc	a0,0x4
    800065e4:	f5050513          	addi	a0,a0,-176 # 8000a530 <CONSOLE_STATUS+0x520>
    800065e8:	fffff097          	auipc	ra,0xfffff
    800065ec:	4b0080e7          	jalr	1200(ra) # 80005a98 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800065f0:	0014849b          	addiw	s1,s1,1
    800065f4:	0ff4f493          	andi	s1,s1,255
    800065f8:	00200793          	li	a5,2
    800065fc:	fc97f0e3          	bgeu	a5,s1,800065bc <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006600:	00004517          	auipc	a0,0x4
    80006604:	d0850513          	addi	a0,a0,-760 # 8000a308 <CONSOLE_STATUS+0x2f8>
    80006608:	fffff097          	auipc	ra,0xfffff
    8000660c:	490080e7          	jalr	1168(ra) # 80005a98 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006610:	00700313          	li	t1,7
    thread_dispatch();
    80006614:	ffffb097          	auipc	ra,0xffffb
    80006618:	e20080e7          	jalr	-480(ra) # 80001434 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000661c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006620:	00004517          	auipc	a0,0x4
    80006624:	cf850513          	addi	a0,a0,-776 # 8000a318 <CONSOLE_STATUS+0x308>
    80006628:	fffff097          	auipc	ra,0xfffff
    8000662c:	470080e7          	jalr	1136(ra) # 80005a98 <_Z11printStringPKc>
    80006630:	00000613          	li	a2,0
    80006634:	00a00593          	li	a1,10
    80006638:	0009051b          	sext.w	a0,s2
    8000663c:	fffff097          	auipc	ra,0xfffff
    80006640:	60c080e7          	jalr	1548(ra) # 80005c48 <_Z8printIntiii>
    80006644:	00004517          	auipc	a0,0x4
    80006648:	eec50513          	addi	a0,a0,-276 # 8000a530 <CONSOLE_STATUS+0x520>
    8000664c:	fffff097          	auipc	ra,0xfffff
    80006650:	44c080e7          	jalr	1100(ra) # 80005a98 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006654:	00c00513          	li	a0,12
    80006658:	00000097          	auipc	ra,0x0
    8000665c:	d88080e7          	jalr	-632(ra) # 800063e0 <_ZL9fibonaccim>
    80006660:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006664:	00004517          	auipc	a0,0x4
    80006668:	cbc50513          	addi	a0,a0,-836 # 8000a320 <CONSOLE_STATUS+0x310>
    8000666c:	fffff097          	auipc	ra,0xfffff
    80006670:	42c080e7          	jalr	1068(ra) # 80005a98 <_Z11printStringPKc>
    80006674:	00000613          	li	a2,0
    80006678:	00a00593          	li	a1,10
    8000667c:	0009051b          	sext.w	a0,s2
    80006680:	fffff097          	auipc	ra,0xfffff
    80006684:	5c8080e7          	jalr	1480(ra) # 80005c48 <_Z8printIntiii>
    80006688:	00004517          	auipc	a0,0x4
    8000668c:	ea850513          	addi	a0,a0,-344 # 8000a530 <CONSOLE_STATUS+0x520>
    80006690:	fffff097          	auipc	ra,0xfffff
    80006694:	408080e7          	jalr	1032(ra) # 80005a98 <_Z11printStringPKc>
    80006698:	0400006f          	j	800066d8 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    8000669c:	00004517          	auipc	a0,0x4
    800066a0:	c6450513          	addi	a0,a0,-924 # 8000a300 <CONSOLE_STATUS+0x2f0>
    800066a4:	fffff097          	auipc	ra,0xfffff
    800066a8:	3f4080e7          	jalr	1012(ra) # 80005a98 <_Z11printStringPKc>
    800066ac:	00000613          	li	a2,0
    800066b0:	00a00593          	li	a1,10
    800066b4:	00048513          	mv	a0,s1
    800066b8:	fffff097          	auipc	ra,0xfffff
    800066bc:	590080e7          	jalr	1424(ra) # 80005c48 <_Z8printIntiii>
    800066c0:	00004517          	auipc	a0,0x4
    800066c4:	e7050513          	addi	a0,a0,-400 # 8000a530 <CONSOLE_STATUS+0x520>
    800066c8:	fffff097          	auipc	ra,0xfffff
    800066cc:	3d0080e7          	jalr	976(ra) # 80005a98 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800066d0:	0014849b          	addiw	s1,s1,1
    800066d4:	0ff4f493          	andi	s1,s1,255
    800066d8:	00500793          	li	a5,5
    800066dc:	fc97f0e3          	bgeu	a5,s1,8000669c <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800066e0:	00004517          	auipc	a0,0x4
    800066e4:	bf850513          	addi	a0,a0,-1032 # 8000a2d8 <CONSOLE_STATUS+0x2c8>
    800066e8:	fffff097          	auipc	ra,0xfffff
    800066ec:	3b0080e7          	jalr	944(ra) # 80005a98 <_Z11printStringPKc>
    finishedC = true;
    800066f0:	00100793          	li	a5,1
    800066f4:	00006717          	auipc	a4,0x6
    800066f8:	6ef70ba3          	sb	a5,1783(a4) # 8000cdeb <_ZL9finishedC>
    thread_dispatch();
    800066fc:	ffffb097          	auipc	ra,0xffffb
    80006700:	d38080e7          	jalr	-712(ra) # 80001434 <_Z15thread_dispatchv>
}
    80006704:	01813083          	ld	ra,24(sp)
    80006708:	01013403          	ld	s0,16(sp)
    8000670c:	00813483          	ld	s1,8(sp)
    80006710:	00013903          	ld	s2,0(sp)
    80006714:	02010113          	addi	sp,sp,32
    80006718:	00008067          	ret

000000008000671c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000671c:	fe010113          	addi	sp,sp,-32
    80006720:	00113c23          	sd	ra,24(sp)
    80006724:	00813823          	sd	s0,16(sp)
    80006728:	00913423          	sd	s1,8(sp)
    8000672c:	01213023          	sd	s2,0(sp)
    80006730:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006734:	00000913          	li	s2,0
    80006738:	0400006f          	j	80006778 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    8000673c:	ffffb097          	auipc	ra,0xffffb
    80006740:	cf8080e7          	jalr	-776(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006744:	00148493          	addi	s1,s1,1
    80006748:	000027b7          	lui	a5,0x2
    8000674c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006750:	0097ee63          	bltu	a5,s1,8000676c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006754:	00000713          	li	a4,0
    80006758:	000077b7          	lui	a5,0x7
    8000675c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006760:	fce7eee3          	bltu	a5,a4,8000673c <_ZL11workerBodyBPv+0x20>
    80006764:	00170713          	addi	a4,a4,1
    80006768:	ff1ff06f          	j	80006758 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    8000676c:	00a00793          	li	a5,10
    80006770:	04f90663          	beq	s2,a5,800067bc <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006774:	00190913          	addi	s2,s2,1
    80006778:	00f00793          	li	a5,15
    8000677c:	0527e463          	bltu	a5,s2,800067c4 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006780:	00004517          	auipc	a0,0x4
    80006784:	b6850513          	addi	a0,a0,-1176 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    80006788:	fffff097          	auipc	ra,0xfffff
    8000678c:	310080e7          	jalr	784(ra) # 80005a98 <_Z11printStringPKc>
    80006790:	00000613          	li	a2,0
    80006794:	00a00593          	li	a1,10
    80006798:	0009051b          	sext.w	a0,s2
    8000679c:	fffff097          	auipc	ra,0xfffff
    800067a0:	4ac080e7          	jalr	1196(ra) # 80005c48 <_Z8printIntiii>
    800067a4:	00004517          	auipc	a0,0x4
    800067a8:	d8c50513          	addi	a0,a0,-628 # 8000a530 <CONSOLE_STATUS+0x520>
    800067ac:	fffff097          	auipc	ra,0xfffff
    800067b0:	2ec080e7          	jalr	748(ra) # 80005a98 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800067b4:	00000493          	li	s1,0
    800067b8:	f91ff06f          	j	80006748 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800067bc:	14102ff3          	csrr	t6,sepc
    800067c0:	fb5ff06f          	j	80006774 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800067c4:	00004517          	auipc	a0,0x4
    800067c8:	b2c50513          	addi	a0,a0,-1236 # 8000a2f0 <CONSOLE_STATUS+0x2e0>
    800067cc:	fffff097          	auipc	ra,0xfffff
    800067d0:	2cc080e7          	jalr	716(ra) # 80005a98 <_Z11printStringPKc>
    finishedB = true;
    800067d4:	00100793          	li	a5,1
    800067d8:	00006717          	auipc	a4,0x6
    800067dc:	60f70a23          	sb	a5,1556(a4) # 8000cdec <_ZL9finishedB>
    thread_dispatch();
    800067e0:	ffffb097          	auipc	ra,0xffffb
    800067e4:	c54080e7          	jalr	-940(ra) # 80001434 <_Z15thread_dispatchv>
}
    800067e8:	01813083          	ld	ra,24(sp)
    800067ec:	01013403          	ld	s0,16(sp)
    800067f0:	00813483          	ld	s1,8(sp)
    800067f4:	00013903          	ld	s2,0(sp)
    800067f8:	02010113          	addi	sp,sp,32
    800067fc:	00008067          	ret

0000000080006800 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006800:	fe010113          	addi	sp,sp,-32
    80006804:	00113c23          	sd	ra,24(sp)
    80006808:	00813823          	sd	s0,16(sp)
    8000680c:	00913423          	sd	s1,8(sp)
    80006810:	01213023          	sd	s2,0(sp)
    80006814:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006818:	00000913          	li	s2,0
    8000681c:	0380006f          	j	80006854 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006820:	ffffb097          	auipc	ra,0xffffb
    80006824:	c14080e7          	jalr	-1004(ra) # 80001434 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006828:	00148493          	addi	s1,s1,1
    8000682c:	000027b7          	lui	a5,0x2
    80006830:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006834:	0097ee63          	bltu	a5,s1,80006850 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006838:	00000713          	li	a4,0
    8000683c:	000077b7          	lui	a5,0x7
    80006840:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006844:	fce7eee3          	bltu	a5,a4,80006820 <_ZL11workerBodyAPv+0x20>
    80006848:	00170713          	addi	a4,a4,1
    8000684c:	ff1ff06f          	j	8000683c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006850:	00190913          	addi	s2,s2,1
    80006854:	00900793          	li	a5,9
    80006858:	0527e063          	bltu	a5,s2,80006898 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000685c:	00004517          	auipc	a0,0x4
    80006860:	a7450513          	addi	a0,a0,-1420 # 8000a2d0 <CONSOLE_STATUS+0x2c0>
    80006864:	fffff097          	auipc	ra,0xfffff
    80006868:	234080e7          	jalr	564(ra) # 80005a98 <_Z11printStringPKc>
    8000686c:	00000613          	li	a2,0
    80006870:	00a00593          	li	a1,10
    80006874:	0009051b          	sext.w	a0,s2
    80006878:	fffff097          	auipc	ra,0xfffff
    8000687c:	3d0080e7          	jalr	976(ra) # 80005c48 <_Z8printIntiii>
    80006880:	00004517          	auipc	a0,0x4
    80006884:	cb050513          	addi	a0,a0,-848 # 8000a530 <CONSOLE_STATUS+0x520>
    80006888:	fffff097          	auipc	ra,0xfffff
    8000688c:	210080e7          	jalr	528(ra) # 80005a98 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006890:	00000493          	li	s1,0
    80006894:	f99ff06f          	j	8000682c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006898:	00004517          	auipc	a0,0x4
    8000689c:	a4050513          	addi	a0,a0,-1472 # 8000a2d8 <CONSOLE_STATUS+0x2c8>
    800068a0:	fffff097          	auipc	ra,0xfffff
    800068a4:	1f8080e7          	jalr	504(ra) # 80005a98 <_Z11printStringPKc>
    finishedA = true;
    800068a8:	00100793          	li	a5,1
    800068ac:	00006717          	auipc	a4,0x6
    800068b0:	54f700a3          	sb	a5,1345(a4) # 8000cded <_ZL9finishedA>
}
    800068b4:	01813083          	ld	ra,24(sp)
    800068b8:	01013403          	ld	s0,16(sp)
    800068bc:	00813483          	ld	s1,8(sp)
    800068c0:	00013903          	ld	s2,0(sp)
    800068c4:	02010113          	addi	sp,sp,32
    800068c8:	00008067          	ret

00000000800068cc <_Z16System_Mode_testv>:


void System_Mode_test() {
    800068cc:	fd010113          	addi	sp,sp,-48
    800068d0:	02113423          	sd	ra,40(sp)
    800068d4:	02813023          	sd	s0,32(sp)
    800068d8:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800068dc:	00000613          	li	a2,0
    800068e0:	00000597          	auipc	a1,0x0
    800068e4:	f2058593          	addi	a1,a1,-224 # 80006800 <_ZL11workerBodyAPv>
    800068e8:	fd040513          	addi	a0,s0,-48
    800068ec:	ffffb097          	auipc	ra,0xffffb
    800068f0:	a8c080e7          	jalr	-1396(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800068f4:	00004517          	auipc	a0,0x4
    800068f8:	a8450513          	addi	a0,a0,-1404 # 8000a378 <CONSOLE_STATUS+0x368>
    800068fc:	fffff097          	auipc	ra,0xfffff
    80006900:	19c080e7          	jalr	412(ra) # 80005a98 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006904:	00000613          	li	a2,0
    80006908:	00000597          	auipc	a1,0x0
    8000690c:	e1458593          	addi	a1,a1,-492 # 8000671c <_ZL11workerBodyBPv>
    80006910:	fd840513          	addi	a0,s0,-40
    80006914:	ffffb097          	auipc	ra,0xffffb
    80006918:	a64080e7          	jalr	-1436(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    8000691c:	00004517          	auipc	a0,0x4
    80006920:	a7450513          	addi	a0,a0,-1420 # 8000a390 <CONSOLE_STATUS+0x380>
    80006924:	fffff097          	auipc	ra,0xfffff
    80006928:	174080e7          	jalr	372(ra) # 80005a98 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000692c:	00000613          	li	a2,0
    80006930:	00000597          	auipc	a1,0x0
    80006934:	c6c58593          	addi	a1,a1,-916 # 8000659c <_ZL11workerBodyCPv>
    80006938:	fe040513          	addi	a0,s0,-32
    8000693c:	ffffb097          	auipc	ra,0xffffb
    80006940:	a3c080e7          	jalr	-1476(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006944:	00004517          	auipc	a0,0x4
    80006948:	a6450513          	addi	a0,a0,-1436 # 8000a3a8 <CONSOLE_STATUS+0x398>
    8000694c:	fffff097          	auipc	ra,0xfffff
    80006950:	14c080e7          	jalr	332(ra) # 80005a98 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006954:	00000613          	li	a2,0
    80006958:	00000597          	auipc	a1,0x0
    8000695c:	afc58593          	addi	a1,a1,-1284 # 80006454 <_ZL11workerBodyDPv>
    80006960:	fe840513          	addi	a0,s0,-24
    80006964:	ffffb097          	auipc	ra,0xffffb
    80006968:	a14080e7          	jalr	-1516(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    8000696c:	00004517          	auipc	a0,0x4
    80006970:	a5450513          	addi	a0,a0,-1452 # 8000a3c0 <CONSOLE_STATUS+0x3b0>
    80006974:	fffff097          	auipc	ra,0xfffff
    80006978:	124080e7          	jalr	292(ra) # 80005a98 <_Z11printStringPKc>
    8000697c:	00c0006f          	j	80006988 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006980:	ffffb097          	auipc	ra,0xffffb
    80006984:	ab4080e7          	jalr	-1356(ra) # 80001434 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006988:	00006797          	auipc	a5,0x6
    8000698c:	4657c783          	lbu	a5,1125(a5) # 8000cded <_ZL9finishedA>
    80006990:	fe0788e3          	beqz	a5,80006980 <_Z16System_Mode_testv+0xb4>
    80006994:	00006797          	auipc	a5,0x6
    80006998:	4587c783          	lbu	a5,1112(a5) # 8000cdec <_ZL9finishedB>
    8000699c:	fe0782e3          	beqz	a5,80006980 <_Z16System_Mode_testv+0xb4>
    800069a0:	00006797          	auipc	a5,0x6
    800069a4:	44b7c783          	lbu	a5,1099(a5) # 8000cdeb <_ZL9finishedC>
    800069a8:	fc078ce3          	beqz	a5,80006980 <_Z16System_Mode_testv+0xb4>
    800069ac:	00006797          	auipc	a5,0x6
    800069b0:	43e7c783          	lbu	a5,1086(a5) # 8000cdea <_ZL9finishedD>
    800069b4:	fc0786e3          	beqz	a5,80006980 <_Z16System_Mode_testv+0xb4>
    }

}
    800069b8:	02813083          	ld	ra,40(sp)
    800069bc:	02013403          	ld	s0,32(sp)
    800069c0:	03010113          	addi	sp,sp,48
    800069c4:	00008067          	ret

00000000800069c8 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800069c8:	fe010113          	addi	sp,sp,-32
    800069cc:	00113c23          	sd	ra,24(sp)
    800069d0:	00813823          	sd	s0,16(sp)
    800069d4:	00913423          	sd	s1,8(sp)
    800069d8:	01213023          	sd	s2,0(sp)
    800069dc:	02010413          	addi	s0,sp,32
    800069e0:	00050493          	mv	s1,a0
    800069e4:	00058913          	mv	s2,a1
    800069e8:	0015879b          	addiw	a5,a1,1
    800069ec:	0007851b          	sext.w	a0,a5
    800069f0:	00f4a023          	sw	a5,0(s1)
    800069f4:	0004a823          	sw	zero,16(s1)
    800069f8:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800069fc:	00251513          	slli	a0,a0,0x2
    80006a00:	ffffb097          	auipc	ra,0xffffb
    80006a04:	908080e7          	jalr	-1784(ra) # 80001308 <_Z9mem_allocm>
    80006a08:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006a0c:	00000593          	li	a1,0
    80006a10:	02048513          	addi	a0,s1,32
    80006a14:	ffffb097          	auipc	ra,0xffffb
    80006a18:	a98080e7          	jalr	-1384(ra) # 800014ac <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006a1c:	00090593          	mv	a1,s2
    80006a20:	01848513          	addi	a0,s1,24
    80006a24:	ffffb097          	auipc	ra,0xffffb
    80006a28:	a88080e7          	jalr	-1400(ra) # 800014ac <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006a2c:	00100593          	li	a1,1
    80006a30:	02848513          	addi	a0,s1,40
    80006a34:	ffffb097          	auipc	ra,0xffffb
    80006a38:	a78080e7          	jalr	-1416(ra) # 800014ac <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006a3c:	00100593          	li	a1,1
    80006a40:	03048513          	addi	a0,s1,48
    80006a44:	ffffb097          	auipc	ra,0xffffb
    80006a48:	a68080e7          	jalr	-1432(ra) # 800014ac <_Z8sem_openPP4KSemj>
}
    80006a4c:	01813083          	ld	ra,24(sp)
    80006a50:	01013403          	ld	s0,16(sp)
    80006a54:	00813483          	ld	s1,8(sp)
    80006a58:	00013903          	ld	s2,0(sp)
    80006a5c:	02010113          	addi	sp,sp,32
    80006a60:	00008067          	ret

0000000080006a64 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006a64:	fe010113          	addi	sp,sp,-32
    80006a68:	00113c23          	sd	ra,24(sp)
    80006a6c:	00813823          	sd	s0,16(sp)
    80006a70:	00913423          	sd	s1,8(sp)
    80006a74:	01213023          	sd	s2,0(sp)
    80006a78:	02010413          	addi	s0,sp,32
    80006a7c:	00050493          	mv	s1,a0
    80006a80:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006a84:	01853503          	ld	a0,24(a0)
    80006a88:	ffffb097          	auipc	ra,0xffffb
    80006a8c:	a8c080e7          	jalr	-1396(ra) # 80001514 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006a90:	0304b503          	ld	a0,48(s1)
    80006a94:	ffffb097          	auipc	ra,0xffffb
    80006a98:	a80080e7          	jalr	-1408(ra) # 80001514 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006a9c:	0084b783          	ld	a5,8(s1)
    80006aa0:	0144a703          	lw	a4,20(s1)
    80006aa4:	00271713          	slli	a4,a4,0x2
    80006aa8:	00e787b3          	add	a5,a5,a4
    80006aac:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006ab0:	0144a783          	lw	a5,20(s1)
    80006ab4:	0017879b          	addiw	a5,a5,1
    80006ab8:	0004a703          	lw	a4,0(s1)
    80006abc:	02e7e7bb          	remw	a5,a5,a4
    80006ac0:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006ac4:	0304b503          	ld	a0,48(s1)
    80006ac8:	ffffb097          	auipc	ra,0xffffb
    80006acc:	a7c080e7          	jalr	-1412(ra) # 80001544 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006ad0:	0204b503          	ld	a0,32(s1)
    80006ad4:	ffffb097          	auipc	ra,0xffffb
    80006ad8:	a70080e7          	jalr	-1424(ra) # 80001544 <_Z10sem_signalP4KSem>

}
    80006adc:	01813083          	ld	ra,24(sp)
    80006ae0:	01013403          	ld	s0,16(sp)
    80006ae4:	00813483          	ld	s1,8(sp)
    80006ae8:	00013903          	ld	s2,0(sp)
    80006aec:	02010113          	addi	sp,sp,32
    80006af0:	00008067          	ret

0000000080006af4 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006af4:	fe010113          	addi	sp,sp,-32
    80006af8:	00113c23          	sd	ra,24(sp)
    80006afc:	00813823          	sd	s0,16(sp)
    80006b00:	00913423          	sd	s1,8(sp)
    80006b04:	01213023          	sd	s2,0(sp)
    80006b08:	02010413          	addi	s0,sp,32
    80006b0c:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006b10:	02053503          	ld	a0,32(a0)
    80006b14:	ffffb097          	auipc	ra,0xffffb
    80006b18:	a00080e7          	jalr	-1536(ra) # 80001514 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006b1c:	0284b503          	ld	a0,40(s1)
    80006b20:	ffffb097          	auipc	ra,0xffffb
    80006b24:	9f4080e7          	jalr	-1548(ra) # 80001514 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006b28:	0084b703          	ld	a4,8(s1)
    80006b2c:	0104a783          	lw	a5,16(s1)
    80006b30:	00279693          	slli	a3,a5,0x2
    80006b34:	00d70733          	add	a4,a4,a3
    80006b38:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006b3c:	0017879b          	addiw	a5,a5,1
    80006b40:	0004a703          	lw	a4,0(s1)
    80006b44:	02e7e7bb          	remw	a5,a5,a4
    80006b48:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006b4c:	0284b503          	ld	a0,40(s1)
    80006b50:	ffffb097          	auipc	ra,0xffffb
    80006b54:	9f4080e7          	jalr	-1548(ra) # 80001544 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006b58:	0184b503          	ld	a0,24(s1)
    80006b5c:	ffffb097          	auipc	ra,0xffffb
    80006b60:	9e8080e7          	jalr	-1560(ra) # 80001544 <_Z10sem_signalP4KSem>

    return ret;
}
    80006b64:	00090513          	mv	a0,s2
    80006b68:	01813083          	ld	ra,24(sp)
    80006b6c:	01013403          	ld	s0,16(sp)
    80006b70:	00813483          	ld	s1,8(sp)
    80006b74:	00013903          	ld	s2,0(sp)
    80006b78:	02010113          	addi	sp,sp,32
    80006b7c:	00008067          	ret

0000000080006b80 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006b80:	fe010113          	addi	sp,sp,-32
    80006b84:	00113c23          	sd	ra,24(sp)
    80006b88:	00813823          	sd	s0,16(sp)
    80006b8c:	00913423          	sd	s1,8(sp)
    80006b90:	01213023          	sd	s2,0(sp)
    80006b94:	02010413          	addi	s0,sp,32
    80006b98:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006b9c:	02853503          	ld	a0,40(a0)
    80006ba0:	ffffb097          	auipc	ra,0xffffb
    80006ba4:	974080e7          	jalr	-1676(ra) # 80001514 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006ba8:	0304b503          	ld	a0,48(s1)
    80006bac:	ffffb097          	auipc	ra,0xffffb
    80006bb0:	968080e7          	jalr	-1688(ra) # 80001514 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006bb4:	0144a783          	lw	a5,20(s1)
    80006bb8:	0104a903          	lw	s2,16(s1)
    80006bbc:	0327ce63          	blt	a5,s2,80006bf8 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006bc0:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006bc4:	0304b503          	ld	a0,48(s1)
    80006bc8:	ffffb097          	auipc	ra,0xffffb
    80006bcc:	97c080e7          	jalr	-1668(ra) # 80001544 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006bd0:	0284b503          	ld	a0,40(s1)
    80006bd4:	ffffb097          	auipc	ra,0xffffb
    80006bd8:	970080e7          	jalr	-1680(ra) # 80001544 <_Z10sem_signalP4KSem>

    return ret;
}
    80006bdc:	00090513          	mv	a0,s2
    80006be0:	01813083          	ld	ra,24(sp)
    80006be4:	01013403          	ld	s0,16(sp)
    80006be8:	00813483          	ld	s1,8(sp)
    80006bec:	00013903          	ld	s2,0(sp)
    80006bf0:	02010113          	addi	sp,sp,32
    80006bf4:	00008067          	ret
        ret = cap - head + tail;
    80006bf8:	0004a703          	lw	a4,0(s1)
    80006bfc:	4127093b          	subw	s2,a4,s2
    80006c00:	00f9093b          	addw	s2,s2,a5
    80006c04:	fc1ff06f          	j	80006bc4 <_ZN6Buffer6getCntEv+0x44>

0000000080006c08 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006c08:	fe010113          	addi	sp,sp,-32
    80006c0c:	00113c23          	sd	ra,24(sp)
    80006c10:	00813823          	sd	s0,16(sp)
    80006c14:	00913423          	sd	s1,8(sp)
    80006c18:	02010413          	addi	s0,sp,32
    80006c1c:	00050493          	mv	s1,a0
    putc('\n');
    80006c20:	00a00513          	li	a0,10
    80006c24:	ffffb097          	auipc	ra,0xffffb
    80006c28:	978080e7          	jalr	-1672(ra) # 8000159c <_Z4putcc>
    printString("Buffer deleted!\n");
    80006c2c:	00003517          	auipc	a0,0x3
    80006c30:	7ac50513          	addi	a0,a0,1964 # 8000a3d8 <CONSOLE_STATUS+0x3c8>
    80006c34:	fffff097          	auipc	ra,0xfffff
    80006c38:	e64080e7          	jalr	-412(ra) # 80005a98 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006c3c:	00048513          	mv	a0,s1
    80006c40:	00000097          	auipc	ra,0x0
    80006c44:	f40080e7          	jalr	-192(ra) # 80006b80 <_ZN6Buffer6getCntEv>
    80006c48:	02a05c63          	blez	a0,80006c80 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006c4c:	0084b783          	ld	a5,8(s1)
    80006c50:	0104a703          	lw	a4,16(s1)
    80006c54:	00271713          	slli	a4,a4,0x2
    80006c58:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006c5c:	0007c503          	lbu	a0,0(a5)
    80006c60:	ffffb097          	auipc	ra,0xffffb
    80006c64:	93c080e7          	jalr	-1732(ra) # 8000159c <_Z4putcc>
        head = (head + 1) % cap;
    80006c68:	0104a783          	lw	a5,16(s1)
    80006c6c:	0017879b          	addiw	a5,a5,1
    80006c70:	0004a703          	lw	a4,0(s1)
    80006c74:	02e7e7bb          	remw	a5,a5,a4
    80006c78:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006c7c:	fc1ff06f          	j	80006c3c <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006c80:	02100513          	li	a0,33
    80006c84:	ffffb097          	auipc	ra,0xffffb
    80006c88:	918080e7          	jalr	-1768(ra) # 8000159c <_Z4putcc>
    putc('\n');
    80006c8c:	00a00513          	li	a0,10
    80006c90:	ffffb097          	auipc	ra,0xffffb
    80006c94:	90c080e7          	jalr	-1780(ra) # 8000159c <_Z4putcc>
    mem_free(buffer);
    80006c98:	0084b503          	ld	a0,8(s1)
    80006c9c:	ffffa097          	auipc	ra,0xffffa
    80006ca0:	6ac080e7          	jalr	1708(ra) # 80001348 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006ca4:	0204b503          	ld	a0,32(s1)
    80006ca8:	ffffb097          	auipc	ra,0xffffb
    80006cac:	83c080e7          	jalr	-1988(ra) # 800014e4 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006cb0:	0184b503          	ld	a0,24(s1)
    80006cb4:	ffffb097          	auipc	ra,0xffffb
    80006cb8:	830080e7          	jalr	-2000(ra) # 800014e4 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006cbc:	0304b503          	ld	a0,48(s1)
    80006cc0:	ffffb097          	auipc	ra,0xffffb
    80006cc4:	824080e7          	jalr	-2012(ra) # 800014e4 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006cc8:	0284b503          	ld	a0,40(s1)
    80006ccc:	ffffb097          	auipc	ra,0xffffb
    80006cd0:	818080e7          	jalr	-2024(ra) # 800014e4 <_Z9sem_closeP4KSem>
}
    80006cd4:	01813083          	ld	ra,24(sp)
    80006cd8:	01013403          	ld	s0,16(sp)
    80006cdc:	00813483          	ld	s1,8(sp)
    80006ce0:	02010113          	addi	sp,sp,32
    80006ce4:	00008067          	ret

0000000080006ce8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80006ce8:	fa010113          	addi	sp,sp,-96
    80006cec:	04813c23          	sd	s0,88(sp)
    80006cf0:	06010413          	addi	s0,sp,96
    80006cf4:	faa43423          	sd	a0,-88(s0)
    80006cf8:	00058793          	mv	a5,a1
    80006cfc:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80006d00:	fa843783          	ld	a5,-88(s0)
    80006d04:	00079663          	bnez	a5,80006d10 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80006d08:	00000793          	li	a5,0
    80006d0c:	2040006f          	j	80006f10 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80006d10:	fa843783          	ld	a5,-88(s0)
    80006d14:	0067d713          	srli	a4,a5,0x6
    80006d18:	fa843783          	ld	a5,-88(s0)
    80006d1c:	03f7f793          	andi	a5,a5,63
    80006d20:	00078663          	beqz	a5,80006d2c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80006d24:	00100793          	li	a5,1
    80006d28:	0080006f          	j	80006d30 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80006d2c:	00000793          	li	a5,0
    80006d30:	00e787b3          	add	a5,a5,a4
    80006d34:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80006d38:	fc843783          	ld	a5,-56(s0)
    80006d3c:	00679793          	slli	a5,a5,0x6
    80006d40:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    80006d44:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80006d48:	00006797          	auipc	a5,0x6
    80006d4c:	0b078793          	addi	a5,a5,176 # 8000cdf8 <_ZN15MemoryAllocator11freeMemHeadE>
    80006d50:	0007b783          	ld	a5,0(a5)
    80006d54:	fef43023          	sd	a5,-32(s0)
    80006d58:	fe043783          	ld	a5,-32(s0)
    80006d5c:	1a078863          	beqz	a5,80006f0c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    80006d60:	fe043783          	ld	a5,-32(s0)
    80006d64:	0087b783          	ld	a5,8(a5)
    80006d68:	fa843703          	ld	a4,-88(s0)
    80006d6c:	18e7e263          	bltu	a5,a4,80006ef0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    80006d70:	fe043703          	ld	a4,-32(s0)
    80006d74:	fa843783          	ld	a5,-88(s0)
    80006d78:	00f707b3          	add	a5,a4,a5
    80006d7c:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    80006d80:	fe043783          	ld	a5,-32(s0)
    80006d84:	0087b703          	ld	a4,8(a5)
    80006d88:	fa843783          	ld	a5,-88(s0)
    80006d8c:	40f707b3          	sub	a5,a4,a5
    80006d90:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80006d94:	fb843703          	ld	a4,-72(s0)
    80006d98:	02000793          	li	a5,32
    80006d9c:	04e7e463          	bltu	a5,a4,80006de4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    80006da0:	fa843703          	ld	a4,-88(s0)
    80006da4:	fb843783          	ld	a5,-72(s0)
    80006da8:	00f707b3          	add	a5,a4,a5
    80006dac:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    80006db0:	fe843783          	ld	a5,-24(s0)
    80006db4:	00078c63          	beqz	a5,80006dcc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    80006db8:	fe043783          	ld	a5,-32(s0)
    80006dbc:	0007b703          	ld	a4,0(a5)
    80006dc0:	fe843783          	ld	a5,-24(s0)
    80006dc4:	00e7b023          	sd	a4,0(a5)
    80006dc8:	0600006f          	j	80006e28 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    80006dcc:	fe043783          	ld	a5,-32(s0)
    80006dd0:	0007b703          	ld	a4,0(a5)
    80006dd4:	00006797          	auipc	a5,0x6
    80006dd8:	02478793          	addi	a5,a5,36 # 8000cdf8 <_ZN15MemoryAllocator11freeMemHeadE>
    80006ddc:	00e7b023          	sd	a4,0(a5)
    80006de0:	0480006f          	j	80006e28 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    80006de4:	fc043783          	ld	a5,-64(s0)
    80006de8:	fb843703          	ld	a4,-72(s0)
    80006dec:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    80006df0:	fe043783          	ld	a5,-32(s0)
    80006df4:	0007b703          	ld	a4,0(a5)
    80006df8:	fc043783          	ld	a5,-64(s0)
    80006dfc:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    80006e00:	fe843783          	ld	a5,-24(s0)
    80006e04:	00078a63          	beqz	a5,80006e18 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    80006e08:	fe843783          	ld	a5,-24(s0)
    80006e0c:	fc043703          	ld	a4,-64(s0)
    80006e10:	00e7b023          	sd	a4,0(a5)
    80006e14:	0140006f          	j	80006e28 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    80006e18:	00006797          	auipc	a5,0x6
    80006e1c:	fe078793          	addi	a5,a5,-32 # 8000cdf8 <_ZN15MemoryAllocator11freeMemHeadE>
    80006e20:	fc043703          	ld	a4,-64(s0)
    80006e24:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    80006e28:	fe043783          	ld	a5,-32(s0)
    80006e2c:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    80006e30:	fb043783          	ld	a5,-80(s0)
    80006e34:	fa843703          	ld	a4,-88(s0)
    80006e38:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    80006e3c:	fb043783          	ld	a5,-80(s0)
    80006e40:	fa442703          	lw	a4,-92(s0)
    80006e44:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    80006e48:	fb043783          	ld	a5,-80(s0)
    80006e4c:	02078713          	addi	a4,a5,32
    80006e50:	fb043783          	ld	a5,-80(s0)
    80006e54:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    80006e58:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80006e5c:	00006797          	auipc	a5,0x6
    80006e60:	f9478793          	addi	a5,a5,-108 # 8000cdf0 <_ZN15MemoryAllocator11usedMemHeadE>
    80006e64:	0007b783          	ld	a5,0(a5)
    80006e68:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80006e6c:	fd043783          	ld	a5,-48(s0)
    80006e70:	02078463          	beqz	a5,80006e98 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    80006e74:	fd043703          	ld	a4,-48(s0)
    80006e78:	fb043783          	ld	a5,-80(s0)
    80006e7c:	00f77e63          	bgeu	a4,a5,80006e98 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    80006e80:	fd043783          	ld	a5,-48(s0)
    80006e84:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80006e88:	fd043783          	ld	a5,-48(s0)
    80006e8c:	0007b783          	ld	a5,0(a5)
    80006e90:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80006e94:	fd9ff06f          	j	80006e6c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    80006e98:	fd843783          	ld	a5,-40(s0)
    80006e9c:	02079663          	bnez	a5,80006ec8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    80006ea0:	00006797          	auipc	a5,0x6
    80006ea4:	f5078793          	addi	a5,a5,-176 # 8000cdf0 <_ZN15MemoryAllocator11usedMemHeadE>
    80006ea8:	0007b703          	ld	a4,0(a5)
    80006eac:	fb043783          	ld	a5,-80(s0)
    80006eb0:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    80006eb4:	00006797          	auipc	a5,0x6
    80006eb8:	f3c78793          	addi	a5,a5,-196 # 8000cdf0 <_ZN15MemoryAllocator11usedMemHeadE>
    80006ebc:	fb043703          	ld	a4,-80(s0)
    80006ec0:	00e7b023          	sd	a4,0(a5)
    80006ec4:	0200006f          	j	80006ee4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    80006ec8:	fd843783          	ld	a5,-40(s0)
    80006ecc:	0007b703          	ld	a4,0(a5)
    80006ed0:	fb043783          	ld	a5,-80(s0)
    80006ed4:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    80006ed8:	fd843783          	ld	a5,-40(s0)
    80006edc:	fb043703          	ld	a4,-80(s0)
    80006ee0:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    80006ee4:	fb043783          	ld	a5,-80(s0)
    80006ee8:	0187b783          	ld	a5,24(a5)
    80006eec:	0240006f          	j	80006f10 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    80006ef0:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80006ef4:	fe043783          	ld	a5,-32(s0)
    80006ef8:	fef43423          	sd	a5,-24(s0)
    80006efc:	fe043783          	ld	a5,-32(s0)
    80006f00:	0007b783          	ld	a5,0(a5)
    80006f04:	fef43023          	sd	a5,-32(s0)
    80006f08:	e51ff06f          	j	80006d58 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    80006f0c:	00000793          	li	a5,0
}
    80006f10:	00078513          	mv	a0,a5
    80006f14:	05813403          	ld	s0,88(sp)
    80006f18:	06010113          	addi	sp,sp,96
    80006f1c:	00008067          	ret

0000000080006f20 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80006f20:	fb010113          	addi	sp,sp,-80
    80006f24:	04113423          	sd	ra,72(sp)
    80006f28:	04813023          	sd	s0,64(sp)
    80006f2c:	05010413          	addi	s0,sp,80
    80006f30:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    80006f34:	fb843783          	ld	a5,-72(s0)
    80006f38:	00079663          	bnez	a5,80006f44 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    80006f3c:	00000793          	li	a5,0
    80006f40:	1740006f          	j	800070b4 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    80006f44:	00006797          	auipc	a5,0x6
    80006f48:	eac78793          	addi	a5,a5,-340 # 8000cdf0 <_ZN15MemoryAllocator11usedMemHeadE>
    80006f4c:	0007b783          	ld	a5,0(a5)
    80006f50:	00079663          	bnez	a5,80006f5c <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    80006f54:	fff00793          	li	a5,-1
    80006f58:	15c0006f          	j	800070b4 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80006f5c:	fb843783          	ld	a5,-72(s0)
    80006f60:	fe078793          	addi	a5,a5,-32
    80006f64:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    80006f68:	00006797          	auipc	a5,0x6
    80006f6c:	e8878793          	addi	a5,a5,-376 # 8000cdf0 <_ZN15MemoryAllocator11usedMemHeadE>
    80006f70:	0007b783          	ld	a5,0(a5)
    80006f74:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    80006f78:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80006f7c:	fe843783          	ld	a5,-24(s0)
    80006f80:	02078463          	beqz	a5,80006fa8 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80006f84:	fe843703          	ld	a4,-24(s0)
    80006f88:	fb843783          	ld	a5,-72(s0)
    80006f8c:	00f70e63          	beq	a4,a5,80006fa8 <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    80006f90:	fe843783          	ld	a5,-24(s0)
    80006f94:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80006f98:	fe843783          	ld	a5,-24(s0)
    80006f9c:	0007b783          	ld	a5,0(a5)
    80006fa0:	fef43423          	sd	a5,-24(s0)
    80006fa4:	fd9ff06f          	j	80006f7c <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80006fa8:	fe843703          	ld	a4,-24(s0)
    80006fac:	fb843783          	ld	a5,-72(s0)
    80006fb0:	00f70663          	beq	a4,a5,80006fbc <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80006fb4:	fff00793          	li	a5,-1
    80006fb8:	0fc0006f          	j	800070b4 <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    80006fbc:	fe043783          	ld	a5,-32(s0)
    80006fc0:	00078c63          	beqz	a5,80006fd8 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80006fc4:	fe843783          	ld	a5,-24(s0)
    80006fc8:	0007b703          	ld	a4,0(a5)
    80006fcc:	fe043783          	ld	a5,-32(s0)
    80006fd0:	00e7b023          	sd	a4,0(a5)
    80006fd4:	0180006f          	j	80006fec <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    80006fd8:	fe843783          	ld	a5,-24(s0)
    80006fdc:	0007b703          	ld	a4,0(a5)
    80006fe0:	00006797          	auipc	a5,0x6
    80006fe4:	e1078793          	addi	a5,a5,-496 # 8000cdf0 <_ZN15MemoryAllocator11usedMemHeadE>
    80006fe8:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    80006fec:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    80006ff0:	00006797          	auipc	a5,0x6
    80006ff4:	e0878793          	addi	a5,a5,-504 # 8000cdf8 <_ZN15MemoryAllocator11freeMemHeadE>
    80006ff8:	0007b783          	ld	a5,0(a5)
    80006ffc:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    80007000:	fd043783          	ld	a5,-48(s0)
    80007004:	02078463          	beqz	a5,8000702c <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80007008:	fd043703          	ld	a4,-48(s0)
    8000700c:	fb843783          	ld	a5,-72(s0)
    80007010:	00f77e63          	bgeu	a4,a5,8000702c <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80007014:	fd043783          	ld	a5,-48(s0)
    80007018:	fcf43c23          	sd	a5,-40(s0)
    8000701c:	fd043783          	ld	a5,-48(s0)
    80007020:	0007b783          	ld	a5,0(a5)
    80007024:	fcf43823          	sd	a5,-48(s0)
    80007028:	fd9ff06f          	j	80007000 <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    8000702c:	fb843783          	ld	a5,-72(s0)
    80007030:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    80007034:	fb843783          	ld	a5,-72(s0)
    80007038:	0087b783          	ld	a5,8(a5)
    8000703c:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    80007040:	fc843783          	ld	a5,-56(s0)
    80007044:	fc043703          	ld	a4,-64(s0)
    80007048:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    8000704c:	fd843783          	ld	a5,-40(s0)
    80007050:	02078263          	beqz	a5,80007074 <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    80007054:	fd843783          	ld	a5,-40(s0)
    80007058:	0007b703          	ld	a4,0(a5)
    8000705c:	fc843783          	ld	a5,-56(s0)
    80007060:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    80007064:	fd843783          	ld	a5,-40(s0)
    80007068:	fc843703          	ld	a4,-56(s0)
    8000706c:	00e7b023          	sd	a4,0(a5)
    80007070:	0280006f          	j	80007098 <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    80007074:	00006797          	auipc	a5,0x6
    80007078:	d8478793          	addi	a5,a5,-636 # 8000cdf8 <_ZN15MemoryAllocator11freeMemHeadE>
    8000707c:	0007b703          	ld	a4,0(a5)
    80007080:	fc843783          	ld	a5,-56(s0)
    80007084:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    80007088:	00006797          	auipc	a5,0x6
    8000708c:	d7078793          	addi	a5,a5,-656 # 8000cdf8 <_ZN15MemoryAllocator11freeMemHeadE>
    80007090:	fc843703          	ld	a4,-56(s0)
    80007094:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    80007098:	fc843503          	ld	a0,-56(s0)
    8000709c:	00000097          	auipc	ra,0x0
    800070a0:	02c080e7          	jalr	44(ra) # 800070c8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    800070a4:	fd843503          	ld	a0,-40(s0)
    800070a8:	00000097          	auipc	ra,0x0
    800070ac:	020080e7          	jalr	32(ra) # 800070c8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    800070b0:	00000793          	li	a5,0
}
    800070b4:	00078513          	mv	a0,a5
    800070b8:	04813083          	ld	ra,72(sp)
    800070bc:	04013403          	ld	s0,64(sp)
    800070c0:	05010113          	addi	sp,sp,80
    800070c4:	00008067          	ret

00000000800070c8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    800070c8:	fc010113          	addi	sp,sp,-64
    800070cc:	02813c23          	sd	s0,56(sp)
    800070d0:	04010413          	addi	s0,sp,64
    800070d4:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    800070d8:	fc843783          	ld	a5,-56(s0)
    800070dc:	00079663          	bnez	a5,800070e8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    800070e0:	00000793          	li	a5,0
    800070e4:	0a00006f          	j	80007184 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    800070e8:	fc843783          	ld	a5,-56(s0)
    800070ec:	0007b783          	ld	a5,0(a5)
    800070f0:	00f037b3          	snez	a5,a5
    800070f4:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    800070f8:	fc843783          	ld	a5,-56(s0)
    800070fc:	0087b783          	ld	a5,8(a5)
    80007100:	fc843703          	ld	a4,-56(s0)
    80007104:	00f707b3          	add	a5,a4,a5
    80007108:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    8000710c:	fc843783          	ld	a5,-56(s0)
    80007110:	0007b783          	ld	a5,0(a5)
    80007114:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    80007118:	fe043703          	ld	a4,-32(s0)
    8000711c:	fd843783          	ld	a5,-40(s0)
    80007120:	40f707b3          	sub	a5,a4,a5
    80007124:	0017b793          	seqz	a5,a5
    80007128:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    8000712c:	fef44783          	lbu	a5,-17(s0)
    80007130:	0ff7f793          	andi	a5,a5,255
    80007134:	04078663          	beqz	a5,80007180 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    80007138:	fd744783          	lbu	a5,-41(s0)
    8000713c:	0ff7f793          	andi	a5,a5,255
    80007140:	04078063          	beqz	a5,80007180 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    80007144:	fc843783          	ld	a5,-56(s0)
    80007148:	0087b703          	ld	a4,8(a5)
    8000714c:	fc843783          	ld	a5,-56(s0)
    80007150:	0007b783          	ld	a5,0(a5)
    80007154:	0087b783          	ld	a5,8(a5)
    80007158:	00f70733          	add	a4,a4,a5
    8000715c:	fc843783          	ld	a5,-56(s0)
    80007160:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    80007164:	fc843783          	ld	a5,-56(s0)
    80007168:	0007b783          	ld	a5,0(a5)
    8000716c:	0007b703          	ld	a4,0(a5)
    80007170:	fc843783          	ld	a5,-56(s0)
    80007174:	00e7b023          	sd	a4,0(a5)
        return 1;
    80007178:	00100793          	li	a5,1
    8000717c:	0080006f          	j	80007184 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    80007180:	00000793          	li	a5,0
}
    80007184:	00078513          	mv	a0,a5
    80007188:	03813403          	ld	s0,56(sp)
    8000718c:	04010113          	addi	sp,sp,64
    80007190:	00008067          	ret

0000000080007194 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80007194:	fe010113          	addi	sp,sp,-32
    80007198:	00813c23          	sd	s0,24(sp)
    8000719c:	02010413          	addi	s0,sp,32
    800071a0:	fea43423          	sd	a0,-24(s0)
    800071a4:	00058793          	mv	a5,a1
    800071a8:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    800071ac:	fe843783          	ld	a5,-24(s0)
    800071b0:	fe078793          	addi	a5,a5,-32
    800071b4:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    800071b8:	fe843783          	ld	a5,-24(s0)
    800071bc:	0107a703          	lw	a4,16(a5)
    800071c0:	fe442783          	lw	a5,-28(s0)
    800071c4:	0007879b          	sext.w	a5,a5
    800071c8:	40e787b3          	sub	a5,a5,a4
    800071cc:	0017b793          	seqz	a5,a5
    800071d0:	0ff7f793          	andi	a5,a5,255
}
    800071d4:	00078513          	mv	a0,a5
    800071d8:	01813403          	ld	s0,24(sp)
    800071dc:	02010113          	addi	sp,sp,32
    800071e0:	00008067          	ret

00000000800071e4 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    800071e4:	ff010113          	addi	sp,sp,-16
    800071e8:	00813423          	sd	s0,8(sp)
    800071ec:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    800071f0:	00006797          	auipc	a5,0x6
    800071f4:	c1078793          	addi	a5,a5,-1008 # 8000ce00 <_ZN15MemoryAllocator11initializedE>
    800071f8:	0007c783          	lbu	a5,0(a5)
    800071fc:	0017c793          	xori	a5,a5,1
    80007200:	0ff7f793          	andi	a5,a5,255
    80007204:	06078a63          	beqz	a5,80007278 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    80007208:	00006797          	auipc	a5,0x6
    8000720c:	9d87b783          	ld	a5,-1576(a5) # 8000cbe0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80007210:	0007b703          	ld	a4,0(a5)
    80007214:	00006797          	auipc	a5,0x6
    80007218:	be478793          	addi	a5,a5,-1052 # 8000cdf8 <_ZN15MemoryAllocator11freeMemHeadE>
    8000721c:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    80007220:	00006797          	auipc	a5,0x6
    80007224:	bd878793          	addi	a5,a5,-1064 # 8000cdf8 <_ZN15MemoryAllocator11freeMemHeadE>
    80007228:	0007b783          	ld	a5,0(a5)
    8000722c:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    80007230:	00006797          	auipc	a5,0x6
    80007234:	9f87b783          	ld	a5,-1544(a5) # 8000cc28 <_GLOBAL_OFFSET_TABLE_+0x70>
    80007238:	0007b703          	ld	a4,0(a5)
    8000723c:	00006797          	auipc	a5,0x6
    80007240:	9a47b783          	ld	a5,-1628(a5) # 8000cbe0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80007244:	0007b783          	ld	a5,0(a5)
    80007248:	40f70733          	sub	a4,a4,a5
    8000724c:	00006797          	auipc	a5,0x6
    80007250:	bac78793          	addi	a5,a5,-1108 # 8000cdf8 <_ZN15MemoryAllocator11freeMemHeadE>
    80007254:	0007b783          	ld	a5,0(a5)
    80007258:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    8000725c:	00006797          	auipc	a5,0x6
    80007260:	b9478793          	addi	a5,a5,-1132 # 8000cdf0 <_ZN15MemoryAllocator11usedMemHeadE>
    80007264:	0007b023          	sd	zero,0(a5)

        initialized = true;
    80007268:	00006797          	auipc	a5,0x6
    8000726c:	b9878793          	addi	a5,a5,-1128 # 8000ce00 <_ZN15MemoryAllocator11initializedE>
    80007270:	00100713          	li	a4,1
    80007274:	00e78023          	sb	a4,0(a5)
    }
}
    80007278:	00000013          	nop
    8000727c:	00813403          	ld	s0,8(sp)
    80007280:	01010113          	addi	sp,sp,16
    80007284:	00008067          	ret

0000000080007288 <start>:
    80007288:	ff010113          	addi	sp,sp,-16
    8000728c:	00813423          	sd	s0,8(sp)
    80007290:	01010413          	addi	s0,sp,16
    80007294:	300027f3          	csrr	a5,mstatus
    80007298:	ffffe737          	lui	a4,0xffffe
    8000729c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff078f>
    800072a0:	00e7f7b3          	and	a5,a5,a4
    800072a4:	00001737          	lui	a4,0x1
    800072a8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800072ac:	00e7e7b3          	or	a5,a5,a4
    800072b0:	30079073          	csrw	mstatus,a5
    800072b4:	00000797          	auipc	a5,0x0
    800072b8:	16078793          	addi	a5,a5,352 # 80007414 <system_main>
    800072bc:	34179073          	csrw	mepc,a5
    800072c0:	00000793          	li	a5,0
    800072c4:	18079073          	csrw	satp,a5
    800072c8:	000107b7          	lui	a5,0x10
    800072cc:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800072d0:	30279073          	csrw	medeleg,a5
    800072d4:	30379073          	csrw	mideleg,a5
    800072d8:	104027f3          	csrr	a5,sie
    800072dc:	2227e793          	ori	a5,a5,546
    800072e0:	10479073          	csrw	sie,a5
    800072e4:	fff00793          	li	a5,-1
    800072e8:	00a7d793          	srli	a5,a5,0xa
    800072ec:	3b079073          	csrw	pmpaddr0,a5
    800072f0:	00f00793          	li	a5,15
    800072f4:	3a079073          	csrw	pmpcfg0,a5
    800072f8:	f14027f3          	csrr	a5,mhartid
    800072fc:	0200c737          	lui	a4,0x200c
    80007300:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007304:	0007869b          	sext.w	a3,a5
    80007308:	00269713          	slli	a4,a3,0x2
    8000730c:	000f4637          	lui	a2,0xf4
    80007310:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007314:	00d70733          	add	a4,a4,a3
    80007318:	0037979b          	slliw	a5,a5,0x3
    8000731c:	020046b7          	lui	a3,0x2004
    80007320:	00d787b3          	add	a5,a5,a3
    80007324:	00c585b3          	add	a1,a1,a2
    80007328:	00371693          	slli	a3,a4,0x3
    8000732c:	00006717          	auipc	a4,0x6
    80007330:	ae470713          	addi	a4,a4,-1308 # 8000ce10 <timer_scratch>
    80007334:	00b7b023          	sd	a1,0(a5)
    80007338:	00d70733          	add	a4,a4,a3
    8000733c:	00f73c23          	sd	a5,24(a4)
    80007340:	02c73023          	sd	a2,32(a4)
    80007344:	34071073          	csrw	mscratch,a4
    80007348:	00000797          	auipc	a5,0x0
    8000734c:	6e878793          	addi	a5,a5,1768 # 80007a30 <timervec>
    80007350:	30579073          	csrw	mtvec,a5
    80007354:	300027f3          	csrr	a5,mstatus
    80007358:	0087e793          	ori	a5,a5,8
    8000735c:	30079073          	csrw	mstatus,a5
    80007360:	304027f3          	csrr	a5,mie
    80007364:	0807e793          	ori	a5,a5,128
    80007368:	30479073          	csrw	mie,a5
    8000736c:	f14027f3          	csrr	a5,mhartid
    80007370:	0007879b          	sext.w	a5,a5
    80007374:	00078213          	mv	tp,a5
    80007378:	30200073          	mret
    8000737c:	00813403          	ld	s0,8(sp)
    80007380:	01010113          	addi	sp,sp,16
    80007384:	00008067          	ret

0000000080007388 <timerinit>:
    80007388:	ff010113          	addi	sp,sp,-16
    8000738c:	00813423          	sd	s0,8(sp)
    80007390:	01010413          	addi	s0,sp,16
    80007394:	f14027f3          	csrr	a5,mhartid
    80007398:	0200c737          	lui	a4,0x200c
    8000739c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800073a0:	0007869b          	sext.w	a3,a5
    800073a4:	00269713          	slli	a4,a3,0x2
    800073a8:	000f4637          	lui	a2,0xf4
    800073ac:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800073b0:	00d70733          	add	a4,a4,a3
    800073b4:	0037979b          	slliw	a5,a5,0x3
    800073b8:	020046b7          	lui	a3,0x2004
    800073bc:	00d787b3          	add	a5,a5,a3
    800073c0:	00c585b3          	add	a1,a1,a2
    800073c4:	00371693          	slli	a3,a4,0x3
    800073c8:	00006717          	auipc	a4,0x6
    800073cc:	a4870713          	addi	a4,a4,-1464 # 8000ce10 <timer_scratch>
    800073d0:	00b7b023          	sd	a1,0(a5)
    800073d4:	00d70733          	add	a4,a4,a3
    800073d8:	00f73c23          	sd	a5,24(a4)
    800073dc:	02c73023          	sd	a2,32(a4)
    800073e0:	34071073          	csrw	mscratch,a4
    800073e4:	00000797          	auipc	a5,0x0
    800073e8:	64c78793          	addi	a5,a5,1612 # 80007a30 <timervec>
    800073ec:	30579073          	csrw	mtvec,a5
    800073f0:	300027f3          	csrr	a5,mstatus
    800073f4:	0087e793          	ori	a5,a5,8
    800073f8:	30079073          	csrw	mstatus,a5
    800073fc:	304027f3          	csrr	a5,mie
    80007400:	0807e793          	ori	a5,a5,128
    80007404:	30479073          	csrw	mie,a5
    80007408:	00813403          	ld	s0,8(sp)
    8000740c:	01010113          	addi	sp,sp,16
    80007410:	00008067          	ret

0000000080007414 <system_main>:
    80007414:	fe010113          	addi	sp,sp,-32
    80007418:	00813823          	sd	s0,16(sp)
    8000741c:	00913423          	sd	s1,8(sp)
    80007420:	00113c23          	sd	ra,24(sp)
    80007424:	02010413          	addi	s0,sp,32
    80007428:	00000097          	auipc	ra,0x0
    8000742c:	0c4080e7          	jalr	196(ra) # 800074ec <cpuid>
    80007430:	00006497          	auipc	s1,0x6
    80007434:	83048493          	addi	s1,s1,-2000 # 8000cc60 <started>
    80007438:	02050263          	beqz	a0,8000745c <system_main+0x48>
    8000743c:	0004a783          	lw	a5,0(s1)
    80007440:	0007879b          	sext.w	a5,a5
    80007444:	fe078ce3          	beqz	a5,8000743c <system_main+0x28>
    80007448:	0ff0000f          	fence
    8000744c:	00003517          	auipc	a0,0x3
    80007450:	25c50513          	addi	a0,a0,604 # 8000a6a8 <CONSOLE_STATUS+0x698>
    80007454:	00001097          	auipc	ra,0x1
    80007458:	a78080e7          	jalr	-1416(ra) # 80007ecc <panic>
    8000745c:	00001097          	auipc	ra,0x1
    80007460:	9cc080e7          	jalr	-1588(ra) # 80007e28 <consoleinit>
    80007464:	00001097          	auipc	ra,0x1
    80007468:	158080e7          	jalr	344(ra) # 800085bc <printfinit>
    8000746c:	00003517          	auipc	a0,0x3
    80007470:	0c450513          	addi	a0,a0,196 # 8000a530 <CONSOLE_STATUS+0x520>
    80007474:	00001097          	auipc	ra,0x1
    80007478:	ab4080e7          	jalr	-1356(ra) # 80007f28 <__printf>
    8000747c:	00003517          	auipc	a0,0x3
    80007480:	1fc50513          	addi	a0,a0,508 # 8000a678 <CONSOLE_STATUS+0x668>
    80007484:	00001097          	auipc	ra,0x1
    80007488:	aa4080e7          	jalr	-1372(ra) # 80007f28 <__printf>
    8000748c:	00003517          	auipc	a0,0x3
    80007490:	0a450513          	addi	a0,a0,164 # 8000a530 <CONSOLE_STATUS+0x520>
    80007494:	00001097          	auipc	ra,0x1
    80007498:	a94080e7          	jalr	-1388(ra) # 80007f28 <__printf>
    8000749c:	00001097          	auipc	ra,0x1
    800074a0:	4ac080e7          	jalr	1196(ra) # 80008948 <kinit>
    800074a4:	00000097          	auipc	ra,0x0
    800074a8:	148080e7          	jalr	328(ra) # 800075ec <trapinit>
    800074ac:	00000097          	auipc	ra,0x0
    800074b0:	16c080e7          	jalr	364(ra) # 80007618 <trapinithart>
    800074b4:	00000097          	auipc	ra,0x0
    800074b8:	5bc080e7          	jalr	1468(ra) # 80007a70 <plicinit>
    800074bc:	00000097          	auipc	ra,0x0
    800074c0:	5dc080e7          	jalr	1500(ra) # 80007a98 <plicinithart>
    800074c4:	00000097          	auipc	ra,0x0
    800074c8:	078080e7          	jalr	120(ra) # 8000753c <userinit>
    800074cc:	0ff0000f          	fence
    800074d0:	00100793          	li	a5,1
    800074d4:	00003517          	auipc	a0,0x3
    800074d8:	1bc50513          	addi	a0,a0,444 # 8000a690 <CONSOLE_STATUS+0x680>
    800074dc:	00f4a023          	sw	a5,0(s1)
    800074e0:	00001097          	auipc	ra,0x1
    800074e4:	a48080e7          	jalr	-1464(ra) # 80007f28 <__printf>
    800074e8:	0000006f          	j	800074e8 <system_main+0xd4>

00000000800074ec <cpuid>:
    800074ec:	ff010113          	addi	sp,sp,-16
    800074f0:	00813423          	sd	s0,8(sp)
    800074f4:	01010413          	addi	s0,sp,16
    800074f8:	00020513          	mv	a0,tp
    800074fc:	00813403          	ld	s0,8(sp)
    80007500:	0005051b          	sext.w	a0,a0
    80007504:	01010113          	addi	sp,sp,16
    80007508:	00008067          	ret

000000008000750c <mycpu>:
    8000750c:	ff010113          	addi	sp,sp,-16
    80007510:	00813423          	sd	s0,8(sp)
    80007514:	01010413          	addi	s0,sp,16
    80007518:	00020793          	mv	a5,tp
    8000751c:	00813403          	ld	s0,8(sp)
    80007520:	0007879b          	sext.w	a5,a5
    80007524:	00779793          	slli	a5,a5,0x7
    80007528:	00007517          	auipc	a0,0x7
    8000752c:	91850513          	addi	a0,a0,-1768 # 8000de40 <cpus>
    80007530:	00f50533          	add	a0,a0,a5
    80007534:	01010113          	addi	sp,sp,16
    80007538:	00008067          	ret

000000008000753c <userinit>:
    8000753c:	ff010113          	addi	sp,sp,-16
    80007540:	00813423          	sd	s0,8(sp)
    80007544:	01010413          	addi	s0,sp,16
    80007548:	00813403          	ld	s0,8(sp)
    8000754c:	01010113          	addi	sp,sp,16
    80007550:	ffffb317          	auipc	t1,0xffffb
    80007554:	8b430067          	jr	-1868(t1) # 80001e04 <main>

0000000080007558 <either_copyout>:
    80007558:	ff010113          	addi	sp,sp,-16
    8000755c:	00813023          	sd	s0,0(sp)
    80007560:	00113423          	sd	ra,8(sp)
    80007564:	01010413          	addi	s0,sp,16
    80007568:	02051663          	bnez	a0,80007594 <either_copyout+0x3c>
    8000756c:	00058513          	mv	a0,a1
    80007570:	00060593          	mv	a1,a2
    80007574:	0006861b          	sext.w	a2,a3
    80007578:	00002097          	auipc	ra,0x2
    8000757c:	c5c080e7          	jalr	-932(ra) # 800091d4 <__memmove>
    80007580:	00813083          	ld	ra,8(sp)
    80007584:	00013403          	ld	s0,0(sp)
    80007588:	00000513          	li	a0,0
    8000758c:	01010113          	addi	sp,sp,16
    80007590:	00008067          	ret
    80007594:	00003517          	auipc	a0,0x3
    80007598:	13c50513          	addi	a0,a0,316 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    8000759c:	00001097          	auipc	ra,0x1
    800075a0:	930080e7          	jalr	-1744(ra) # 80007ecc <panic>

00000000800075a4 <either_copyin>:
    800075a4:	ff010113          	addi	sp,sp,-16
    800075a8:	00813023          	sd	s0,0(sp)
    800075ac:	00113423          	sd	ra,8(sp)
    800075b0:	01010413          	addi	s0,sp,16
    800075b4:	02059463          	bnez	a1,800075dc <either_copyin+0x38>
    800075b8:	00060593          	mv	a1,a2
    800075bc:	0006861b          	sext.w	a2,a3
    800075c0:	00002097          	auipc	ra,0x2
    800075c4:	c14080e7          	jalr	-1004(ra) # 800091d4 <__memmove>
    800075c8:	00813083          	ld	ra,8(sp)
    800075cc:	00013403          	ld	s0,0(sp)
    800075d0:	00000513          	li	a0,0
    800075d4:	01010113          	addi	sp,sp,16
    800075d8:	00008067          	ret
    800075dc:	00003517          	auipc	a0,0x3
    800075e0:	11c50513          	addi	a0,a0,284 # 8000a6f8 <CONSOLE_STATUS+0x6e8>
    800075e4:	00001097          	auipc	ra,0x1
    800075e8:	8e8080e7          	jalr	-1816(ra) # 80007ecc <panic>

00000000800075ec <trapinit>:
    800075ec:	ff010113          	addi	sp,sp,-16
    800075f0:	00813423          	sd	s0,8(sp)
    800075f4:	01010413          	addi	s0,sp,16
    800075f8:	00813403          	ld	s0,8(sp)
    800075fc:	00003597          	auipc	a1,0x3
    80007600:	12458593          	addi	a1,a1,292 # 8000a720 <CONSOLE_STATUS+0x710>
    80007604:	00007517          	auipc	a0,0x7
    80007608:	8bc50513          	addi	a0,a0,-1860 # 8000dec0 <tickslock>
    8000760c:	01010113          	addi	sp,sp,16
    80007610:	00001317          	auipc	t1,0x1
    80007614:	5c830067          	jr	1480(t1) # 80008bd8 <initlock>

0000000080007618 <trapinithart>:
    80007618:	ff010113          	addi	sp,sp,-16
    8000761c:	00813423          	sd	s0,8(sp)
    80007620:	01010413          	addi	s0,sp,16
    80007624:	00000797          	auipc	a5,0x0
    80007628:	2fc78793          	addi	a5,a5,764 # 80007920 <kernelvec>
    8000762c:	10579073          	csrw	stvec,a5
    80007630:	00813403          	ld	s0,8(sp)
    80007634:	01010113          	addi	sp,sp,16
    80007638:	00008067          	ret

000000008000763c <usertrap>:
    8000763c:	ff010113          	addi	sp,sp,-16
    80007640:	00813423          	sd	s0,8(sp)
    80007644:	01010413          	addi	s0,sp,16
    80007648:	00813403          	ld	s0,8(sp)
    8000764c:	01010113          	addi	sp,sp,16
    80007650:	00008067          	ret

0000000080007654 <usertrapret>:
    80007654:	ff010113          	addi	sp,sp,-16
    80007658:	00813423          	sd	s0,8(sp)
    8000765c:	01010413          	addi	s0,sp,16
    80007660:	00813403          	ld	s0,8(sp)
    80007664:	01010113          	addi	sp,sp,16
    80007668:	00008067          	ret

000000008000766c <kerneltrap>:
    8000766c:	fe010113          	addi	sp,sp,-32
    80007670:	00813823          	sd	s0,16(sp)
    80007674:	00113c23          	sd	ra,24(sp)
    80007678:	00913423          	sd	s1,8(sp)
    8000767c:	02010413          	addi	s0,sp,32
    80007680:	142025f3          	csrr	a1,scause
    80007684:	100027f3          	csrr	a5,sstatus
    80007688:	0027f793          	andi	a5,a5,2
    8000768c:	10079c63          	bnez	a5,800077a4 <kerneltrap+0x138>
    80007690:	142027f3          	csrr	a5,scause
    80007694:	0207ce63          	bltz	a5,800076d0 <kerneltrap+0x64>
    80007698:	00003517          	auipc	a0,0x3
    8000769c:	0d050513          	addi	a0,a0,208 # 8000a768 <CONSOLE_STATUS+0x758>
    800076a0:	00001097          	auipc	ra,0x1
    800076a4:	888080e7          	jalr	-1912(ra) # 80007f28 <__printf>
    800076a8:	141025f3          	csrr	a1,sepc
    800076ac:	14302673          	csrr	a2,stval
    800076b0:	00003517          	auipc	a0,0x3
    800076b4:	0c850513          	addi	a0,a0,200 # 8000a778 <CONSOLE_STATUS+0x768>
    800076b8:	00001097          	auipc	ra,0x1
    800076bc:	870080e7          	jalr	-1936(ra) # 80007f28 <__printf>
    800076c0:	00003517          	auipc	a0,0x3
    800076c4:	0d050513          	addi	a0,a0,208 # 8000a790 <CONSOLE_STATUS+0x780>
    800076c8:	00001097          	auipc	ra,0x1
    800076cc:	804080e7          	jalr	-2044(ra) # 80007ecc <panic>
    800076d0:	0ff7f713          	andi	a4,a5,255
    800076d4:	00900693          	li	a3,9
    800076d8:	04d70063          	beq	a4,a3,80007718 <kerneltrap+0xac>
    800076dc:	fff00713          	li	a4,-1
    800076e0:	03f71713          	slli	a4,a4,0x3f
    800076e4:	00170713          	addi	a4,a4,1
    800076e8:	fae798e3          	bne	a5,a4,80007698 <kerneltrap+0x2c>
    800076ec:	00000097          	auipc	ra,0x0
    800076f0:	e00080e7          	jalr	-512(ra) # 800074ec <cpuid>
    800076f4:	06050663          	beqz	a0,80007760 <kerneltrap+0xf4>
    800076f8:	144027f3          	csrr	a5,sip
    800076fc:	ffd7f793          	andi	a5,a5,-3
    80007700:	14479073          	csrw	sip,a5
    80007704:	01813083          	ld	ra,24(sp)
    80007708:	01013403          	ld	s0,16(sp)
    8000770c:	00813483          	ld	s1,8(sp)
    80007710:	02010113          	addi	sp,sp,32
    80007714:	00008067          	ret
    80007718:	00000097          	auipc	ra,0x0
    8000771c:	3cc080e7          	jalr	972(ra) # 80007ae4 <plic_claim>
    80007720:	00a00793          	li	a5,10
    80007724:	00050493          	mv	s1,a0
    80007728:	06f50863          	beq	a0,a5,80007798 <kerneltrap+0x12c>
    8000772c:	fc050ce3          	beqz	a0,80007704 <kerneltrap+0x98>
    80007730:	00050593          	mv	a1,a0
    80007734:	00003517          	auipc	a0,0x3
    80007738:	01450513          	addi	a0,a0,20 # 8000a748 <CONSOLE_STATUS+0x738>
    8000773c:	00000097          	auipc	ra,0x0
    80007740:	7ec080e7          	jalr	2028(ra) # 80007f28 <__printf>
    80007744:	01013403          	ld	s0,16(sp)
    80007748:	01813083          	ld	ra,24(sp)
    8000774c:	00048513          	mv	a0,s1
    80007750:	00813483          	ld	s1,8(sp)
    80007754:	02010113          	addi	sp,sp,32
    80007758:	00000317          	auipc	t1,0x0
    8000775c:	3c430067          	jr	964(t1) # 80007b1c <plic_complete>
    80007760:	00006517          	auipc	a0,0x6
    80007764:	76050513          	addi	a0,a0,1888 # 8000dec0 <tickslock>
    80007768:	00001097          	auipc	ra,0x1
    8000776c:	494080e7          	jalr	1172(ra) # 80008bfc <acquire>
    80007770:	00005717          	auipc	a4,0x5
    80007774:	4f470713          	addi	a4,a4,1268 # 8000cc64 <ticks>
    80007778:	00072783          	lw	a5,0(a4)
    8000777c:	00006517          	auipc	a0,0x6
    80007780:	74450513          	addi	a0,a0,1860 # 8000dec0 <tickslock>
    80007784:	0017879b          	addiw	a5,a5,1
    80007788:	00f72023          	sw	a5,0(a4)
    8000778c:	00001097          	auipc	ra,0x1
    80007790:	53c080e7          	jalr	1340(ra) # 80008cc8 <release>
    80007794:	f65ff06f          	j	800076f8 <kerneltrap+0x8c>
    80007798:	00001097          	auipc	ra,0x1
    8000779c:	098080e7          	jalr	152(ra) # 80008830 <uartintr>
    800077a0:	fa5ff06f          	j	80007744 <kerneltrap+0xd8>
    800077a4:	00003517          	auipc	a0,0x3
    800077a8:	f8450513          	addi	a0,a0,-124 # 8000a728 <CONSOLE_STATUS+0x718>
    800077ac:	00000097          	auipc	ra,0x0
    800077b0:	720080e7          	jalr	1824(ra) # 80007ecc <panic>

00000000800077b4 <clockintr>:
    800077b4:	fe010113          	addi	sp,sp,-32
    800077b8:	00813823          	sd	s0,16(sp)
    800077bc:	00913423          	sd	s1,8(sp)
    800077c0:	00113c23          	sd	ra,24(sp)
    800077c4:	02010413          	addi	s0,sp,32
    800077c8:	00006497          	auipc	s1,0x6
    800077cc:	6f848493          	addi	s1,s1,1784 # 8000dec0 <tickslock>
    800077d0:	00048513          	mv	a0,s1
    800077d4:	00001097          	auipc	ra,0x1
    800077d8:	428080e7          	jalr	1064(ra) # 80008bfc <acquire>
    800077dc:	00005717          	auipc	a4,0x5
    800077e0:	48870713          	addi	a4,a4,1160 # 8000cc64 <ticks>
    800077e4:	00072783          	lw	a5,0(a4)
    800077e8:	01013403          	ld	s0,16(sp)
    800077ec:	01813083          	ld	ra,24(sp)
    800077f0:	00048513          	mv	a0,s1
    800077f4:	0017879b          	addiw	a5,a5,1
    800077f8:	00813483          	ld	s1,8(sp)
    800077fc:	00f72023          	sw	a5,0(a4)
    80007800:	02010113          	addi	sp,sp,32
    80007804:	00001317          	auipc	t1,0x1
    80007808:	4c430067          	jr	1220(t1) # 80008cc8 <release>

000000008000780c <devintr>:
    8000780c:	142027f3          	csrr	a5,scause
    80007810:	00000513          	li	a0,0
    80007814:	0007c463          	bltz	a5,8000781c <devintr+0x10>
    80007818:	00008067          	ret
    8000781c:	fe010113          	addi	sp,sp,-32
    80007820:	00813823          	sd	s0,16(sp)
    80007824:	00113c23          	sd	ra,24(sp)
    80007828:	00913423          	sd	s1,8(sp)
    8000782c:	02010413          	addi	s0,sp,32
    80007830:	0ff7f713          	andi	a4,a5,255
    80007834:	00900693          	li	a3,9
    80007838:	04d70c63          	beq	a4,a3,80007890 <devintr+0x84>
    8000783c:	fff00713          	li	a4,-1
    80007840:	03f71713          	slli	a4,a4,0x3f
    80007844:	00170713          	addi	a4,a4,1
    80007848:	00e78c63          	beq	a5,a4,80007860 <devintr+0x54>
    8000784c:	01813083          	ld	ra,24(sp)
    80007850:	01013403          	ld	s0,16(sp)
    80007854:	00813483          	ld	s1,8(sp)
    80007858:	02010113          	addi	sp,sp,32
    8000785c:	00008067          	ret
    80007860:	00000097          	auipc	ra,0x0
    80007864:	c8c080e7          	jalr	-884(ra) # 800074ec <cpuid>
    80007868:	06050663          	beqz	a0,800078d4 <devintr+0xc8>
    8000786c:	144027f3          	csrr	a5,sip
    80007870:	ffd7f793          	andi	a5,a5,-3
    80007874:	14479073          	csrw	sip,a5
    80007878:	01813083          	ld	ra,24(sp)
    8000787c:	01013403          	ld	s0,16(sp)
    80007880:	00813483          	ld	s1,8(sp)
    80007884:	00200513          	li	a0,2
    80007888:	02010113          	addi	sp,sp,32
    8000788c:	00008067          	ret
    80007890:	00000097          	auipc	ra,0x0
    80007894:	254080e7          	jalr	596(ra) # 80007ae4 <plic_claim>
    80007898:	00a00793          	li	a5,10
    8000789c:	00050493          	mv	s1,a0
    800078a0:	06f50663          	beq	a0,a5,8000790c <devintr+0x100>
    800078a4:	00100513          	li	a0,1
    800078a8:	fa0482e3          	beqz	s1,8000784c <devintr+0x40>
    800078ac:	00048593          	mv	a1,s1
    800078b0:	00003517          	auipc	a0,0x3
    800078b4:	e9850513          	addi	a0,a0,-360 # 8000a748 <CONSOLE_STATUS+0x738>
    800078b8:	00000097          	auipc	ra,0x0
    800078bc:	670080e7          	jalr	1648(ra) # 80007f28 <__printf>
    800078c0:	00048513          	mv	a0,s1
    800078c4:	00000097          	auipc	ra,0x0
    800078c8:	258080e7          	jalr	600(ra) # 80007b1c <plic_complete>
    800078cc:	00100513          	li	a0,1
    800078d0:	f7dff06f          	j	8000784c <devintr+0x40>
    800078d4:	00006517          	auipc	a0,0x6
    800078d8:	5ec50513          	addi	a0,a0,1516 # 8000dec0 <tickslock>
    800078dc:	00001097          	auipc	ra,0x1
    800078e0:	320080e7          	jalr	800(ra) # 80008bfc <acquire>
    800078e4:	00005717          	auipc	a4,0x5
    800078e8:	38070713          	addi	a4,a4,896 # 8000cc64 <ticks>
    800078ec:	00072783          	lw	a5,0(a4)
    800078f0:	00006517          	auipc	a0,0x6
    800078f4:	5d050513          	addi	a0,a0,1488 # 8000dec0 <tickslock>
    800078f8:	0017879b          	addiw	a5,a5,1
    800078fc:	00f72023          	sw	a5,0(a4)
    80007900:	00001097          	auipc	ra,0x1
    80007904:	3c8080e7          	jalr	968(ra) # 80008cc8 <release>
    80007908:	f65ff06f          	j	8000786c <devintr+0x60>
    8000790c:	00001097          	auipc	ra,0x1
    80007910:	f24080e7          	jalr	-220(ra) # 80008830 <uartintr>
    80007914:	fadff06f          	j	800078c0 <devintr+0xb4>
	...

0000000080007920 <kernelvec>:
    80007920:	f0010113          	addi	sp,sp,-256
    80007924:	00113023          	sd	ra,0(sp)
    80007928:	00213423          	sd	sp,8(sp)
    8000792c:	00313823          	sd	gp,16(sp)
    80007930:	00413c23          	sd	tp,24(sp)
    80007934:	02513023          	sd	t0,32(sp)
    80007938:	02613423          	sd	t1,40(sp)
    8000793c:	02713823          	sd	t2,48(sp)
    80007940:	02813c23          	sd	s0,56(sp)
    80007944:	04913023          	sd	s1,64(sp)
    80007948:	04a13423          	sd	a0,72(sp)
    8000794c:	04b13823          	sd	a1,80(sp)
    80007950:	04c13c23          	sd	a2,88(sp)
    80007954:	06d13023          	sd	a3,96(sp)
    80007958:	06e13423          	sd	a4,104(sp)
    8000795c:	06f13823          	sd	a5,112(sp)
    80007960:	07013c23          	sd	a6,120(sp)
    80007964:	09113023          	sd	a7,128(sp)
    80007968:	09213423          	sd	s2,136(sp)
    8000796c:	09313823          	sd	s3,144(sp)
    80007970:	09413c23          	sd	s4,152(sp)
    80007974:	0b513023          	sd	s5,160(sp)
    80007978:	0b613423          	sd	s6,168(sp)
    8000797c:	0b713823          	sd	s7,176(sp)
    80007980:	0b813c23          	sd	s8,184(sp)
    80007984:	0d913023          	sd	s9,192(sp)
    80007988:	0da13423          	sd	s10,200(sp)
    8000798c:	0db13823          	sd	s11,208(sp)
    80007990:	0dc13c23          	sd	t3,216(sp)
    80007994:	0fd13023          	sd	t4,224(sp)
    80007998:	0fe13423          	sd	t5,232(sp)
    8000799c:	0ff13823          	sd	t6,240(sp)
    800079a0:	ccdff0ef          	jal	ra,8000766c <kerneltrap>
    800079a4:	00013083          	ld	ra,0(sp)
    800079a8:	00813103          	ld	sp,8(sp)
    800079ac:	01013183          	ld	gp,16(sp)
    800079b0:	02013283          	ld	t0,32(sp)
    800079b4:	02813303          	ld	t1,40(sp)
    800079b8:	03013383          	ld	t2,48(sp)
    800079bc:	03813403          	ld	s0,56(sp)
    800079c0:	04013483          	ld	s1,64(sp)
    800079c4:	04813503          	ld	a0,72(sp)
    800079c8:	05013583          	ld	a1,80(sp)
    800079cc:	05813603          	ld	a2,88(sp)
    800079d0:	06013683          	ld	a3,96(sp)
    800079d4:	06813703          	ld	a4,104(sp)
    800079d8:	07013783          	ld	a5,112(sp)
    800079dc:	07813803          	ld	a6,120(sp)
    800079e0:	08013883          	ld	a7,128(sp)
    800079e4:	08813903          	ld	s2,136(sp)
    800079e8:	09013983          	ld	s3,144(sp)
    800079ec:	09813a03          	ld	s4,152(sp)
    800079f0:	0a013a83          	ld	s5,160(sp)
    800079f4:	0a813b03          	ld	s6,168(sp)
    800079f8:	0b013b83          	ld	s7,176(sp)
    800079fc:	0b813c03          	ld	s8,184(sp)
    80007a00:	0c013c83          	ld	s9,192(sp)
    80007a04:	0c813d03          	ld	s10,200(sp)
    80007a08:	0d013d83          	ld	s11,208(sp)
    80007a0c:	0d813e03          	ld	t3,216(sp)
    80007a10:	0e013e83          	ld	t4,224(sp)
    80007a14:	0e813f03          	ld	t5,232(sp)
    80007a18:	0f013f83          	ld	t6,240(sp)
    80007a1c:	10010113          	addi	sp,sp,256
    80007a20:	10200073          	sret
    80007a24:	00000013          	nop
    80007a28:	00000013          	nop
    80007a2c:	00000013          	nop

0000000080007a30 <timervec>:
    80007a30:	34051573          	csrrw	a0,mscratch,a0
    80007a34:	00b53023          	sd	a1,0(a0)
    80007a38:	00c53423          	sd	a2,8(a0)
    80007a3c:	00d53823          	sd	a3,16(a0)
    80007a40:	01853583          	ld	a1,24(a0)
    80007a44:	02053603          	ld	a2,32(a0)
    80007a48:	0005b683          	ld	a3,0(a1)
    80007a4c:	00c686b3          	add	a3,a3,a2
    80007a50:	00d5b023          	sd	a3,0(a1)
    80007a54:	00200593          	li	a1,2
    80007a58:	14459073          	csrw	sip,a1
    80007a5c:	01053683          	ld	a3,16(a0)
    80007a60:	00853603          	ld	a2,8(a0)
    80007a64:	00053583          	ld	a1,0(a0)
    80007a68:	34051573          	csrrw	a0,mscratch,a0
    80007a6c:	30200073          	mret

0000000080007a70 <plicinit>:
    80007a70:	ff010113          	addi	sp,sp,-16
    80007a74:	00813423          	sd	s0,8(sp)
    80007a78:	01010413          	addi	s0,sp,16
    80007a7c:	00813403          	ld	s0,8(sp)
    80007a80:	0c0007b7          	lui	a5,0xc000
    80007a84:	00100713          	li	a4,1
    80007a88:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80007a8c:	00e7a223          	sw	a4,4(a5)
    80007a90:	01010113          	addi	sp,sp,16
    80007a94:	00008067          	ret

0000000080007a98 <plicinithart>:
    80007a98:	ff010113          	addi	sp,sp,-16
    80007a9c:	00813023          	sd	s0,0(sp)
    80007aa0:	00113423          	sd	ra,8(sp)
    80007aa4:	01010413          	addi	s0,sp,16
    80007aa8:	00000097          	auipc	ra,0x0
    80007aac:	a44080e7          	jalr	-1468(ra) # 800074ec <cpuid>
    80007ab0:	0085171b          	slliw	a4,a0,0x8
    80007ab4:	0c0027b7          	lui	a5,0xc002
    80007ab8:	00e787b3          	add	a5,a5,a4
    80007abc:	40200713          	li	a4,1026
    80007ac0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007ac4:	00813083          	ld	ra,8(sp)
    80007ac8:	00013403          	ld	s0,0(sp)
    80007acc:	00d5151b          	slliw	a0,a0,0xd
    80007ad0:	0c2017b7          	lui	a5,0xc201
    80007ad4:	00a78533          	add	a0,a5,a0
    80007ad8:	00052023          	sw	zero,0(a0)
    80007adc:	01010113          	addi	sp,sp,16
    80007ae0:	00008067          	ret

0000000080007ae4 <plic_claim>:
    80007ae4:	ff010113          	addi	sp,sp,-16
    80007ae8:	00813023          	sd	s0,0(sp)
    80007aec:	00113423          	sd	ra,8(sp)
    80007af0:	01010413          	addi	s0,sp,16
    80007af4:	00000097          	auipc	ra,0x0
    80007af8:	9f8080e7          	jalr	-1544(ra) # 800074ec <cpuid>
    80007afc:	00813083          	ld	ra,8(sp)
    80007b00:	00013403          	ld	s0,0(sp)
    80007b04:	00d5151b          	slliw	a0,a0,0xd
    80007b08:	0c2017b7          	lui	a5,0xc201
    80007b0c:	00a78533          	add	a0,a5,a0
    80007b10:	00452503          	lw	a0,4(a0)
    80007b14:	01010113          	addi	sp,sp,16
    80007b18:	00008067          	ret

0000000080007b1c <plic_complete>:
    80007b1c:	fe010113          	addi	sp,sp,-32
    80007b20:	00813823          	sd	s0,16(sp)
    80007b24:	00913423          	sd	s1,8(sp)
    80007b28:	00113c23          	sd	ra,24(sp)
    80007b2c:	02010413          	addi	s0,sp,32
    80007b30:	00050493          	mv	s1,a0
    80007b34:	00000097          	auipc	ra,0x0
    80007b38:	9b8080e7          	jalr	-1608(ra) # 800074ec <cpuid>
    80007b3c:	01813083          	ld	ra,24(sp)
    80007b40:	01013403          	ld	s0,16(sp)
    80007b44:	00d5179b          	slliw	a5,a0,0xd
    80007b48:	0c201737          	lui	a4,0xc201
    80007b4c:	00f707b3          	add	a5,a4,a5
    80007b50:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007b54:	00813483          	ld	s1,8(sp)
    80007b58:	02010113          	addi	sp,sp,32
    80007b5c:	00008067          	ret

0000000080007b60 <consolewrite>:
    80007b60:	fb010113          	addi	sp,sp,-80
    80007b64:	04813023          	sd	s0,64(sp)
    80007b68:	04113423          	sd	ra,72(sp)
    80007b6c:	02913c23          	sd	s1,56(sp)
    80007b70:	03213823          	sd	s2,48(sp)
    80007b74:	03313423          	sd	s3,40(sp)
    80007b78:	03413023          	sd	s4,32(sp)
    80007b7c:	01513c23          	sd	s5,24(sp)
    80007b80:	05010413          	addi	s0,sp,80
    80007b84:	06c05c63          	blez	a2,80007bfc <consolewrite+0x9c>
    80007b88:	00060993          	mv	s3,a2
    80007b8c:	00050a13          	mv	s4,a0
    80007b90:	00058493          	mv	s1,a1
    80007b94:	00000913          	li	s2,0
    80007b98:	fff00a93          	li	s5,-1
    80007b9c:	01c0006f          	j	80007bb8 <consolewrite+0x58>
    80007ba0:	fbf44503          	lbu	a0,-65(s0)
    80007ba4:	0019091b          	addiw	s2,s2,1
    80007ba8:	00148493          	addi	s1,s1,1
    80007bac:	00001097          	auipc	ra,0x1
    80007bb0:	a9c080e7          	jalr	-1380(ra) # 80008648 <uartputc>
    80007bb4:	03298063          	beq	s3,s2,80007bd4 <consolewrite+0x74>
    80007bb8:	00048613          	mv	a2,s1
    80007bbc:	00100693          	li	a3,1
    80007bc0:	000a0593          	mv	a1,s4
    80007bc4:	fbf40513          	addi	a0,s0,-65
    80007bc8:	00000097          	auipc	ra,0x0
    80007bcc:	9dc080e7          	jalr	-1572(ra) # 800075a4 <either_copyin>
    80007bd0:	fd5518e3          	bne	a0,s5,80007ba0 <consolewrite+0x40>
    80007bd4:	04813083          	ld	ra,72(sp)
    80007bd8:	04013403          	ld	s0,64(sp)
    80007bdc:	03813483          	ld	s1,56(sp)
    80007be0:	02813983          	ld	s3,40(sp)
    80007be4:	02013a03          	ld	s4,32(sp)
    80007be8:	01813a83          	ld	s5,24(sp)
    80007bec:	00090513          	mv	a0,s2
    80007bf0:	03013903          	ld	s2,48(sp)
    80007bf4:	05010113          	addi	sp,sp,80
    80007bf8:	00008067          	ret
    80007bfc:	00000913          	li	s2,0
    80007c00:	fd5ff06f          	j	80007bd4 <consolewrite+0x74>

0000000080007c04 <consoleread>:
    80007c04:	f9010113          	addi	sp,sp,-112
    80007c08:	06813023          	sd	s0,96(sp)
    80007c0c:	04913c23          	sd	s1,88(sp)
    80007c10:	05213823          	sd	s2,80(sp)
    80007c14:	05313423          	sd	s3,72(sp)
    80007c18:	05413023          	sd	s4,64(sp)
    80007c1c:	03513c23          	sd	s5,56(sp)
    80007c20:	03613823          	sd	s6,48(sp)
    80007c24:	03713423          	sd	s7,40(sp)
    80007c28:	03813023          	sd	s8,32(sp)
    80007c2c:	06113423          	sd	ra,104(sp)
    80007c30:	01913c23          	sd	s9,24(sp)
    80007c34:	07010413          	addi	s0,sp,112
    80007c38:	00060b93          	mv	s7,a2
    80007c3c:	00050913          	mv	s2,a0
    80007c40:	00058c13          	mv	s8,a1
    80007c44:	00060b1b          	sext.w	s6,a2
    80007c48:	00006497          	auipc	s1,0x6
    80007c4c:	2a048493          	addi	s1,s1,672 # 8000dee8 <cons>
    80007c50:	00400993          	li	s3,4
    80007c54:	fff00a13          	li	s4,-1
    80007c58:	00a00a93          	li	s5,10
    80007c5c:	05705e63          	blez	s7,80007cb8 <consoleread+0xb4>
    80007c60:	09c4a703          	lw	a4,156(s1)
    80007c64:	0984a783          	lw	a5,152(s1)
    80007c68:	0007071b          	sext.w	a4,a4
    80007c6c:	08e78463          	beq	a5,a4,80007cf4 <consoleread+0xf0>
    80007c70:	07f7f713          	andi	a4,a5,127
    80007c74:	00e48733          	add	a4,s1,a4
    80007c78:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80007c7c:	0017869b          	addiw	a3,a5,1
    80007c80:	08d4ac23          	sw	a3,152(s1)
    80007c84:	00070c9b          	sext.w	s9,a4
    80007c88:	0b370663          	beq	a4,s3,80007d34 <consoleread+0x130>
    80007c8c:	00100693          	li	a3,1
    80007c90:	f9f40613          	addi	a2,s0,-97
    80007c94:	000c0593          	mv	a1,s8
    80007c98:	00090513          	mv	a0,s2
    80007c9c:	f8e40fa3          	sb	a4,-97(s0)
    80007ca0:	00000097          	auipc	ra,0x0
    80007ca4:	8b8080e7          	jalr	-1864(ra) # 80007558 <either_copyout>
    80007ca8:	01450863          	beq	a0,s4,80007cb8 <consoleread+0xb4>
    80007cac:	001c0c13          	addi	s8,s8,1
    80007cb0:	fffb8b9b          	addiw	s7,s7,-1
    80007cb4:	fb5c94e3          	bne	s9,s5,80007c5c <consoleread+0x58>
    80007cb8:	000b851b          	sext.w	a0,s7
    80007cbc:	06813083          	ld	ra,104(sp)
    80007cc0:	06013403          	ld	s0,96(sp)
    80007cc4:	05813483          	ld	s1,88(sp)
    80007cc8:	05013903          	ld	s2,80(sp)
    80007ccc:	04813983          	ld	s3,72(sp)
    80007cd0:	04013a03          	ld	s4,64(sp)
    80007cd4:	03813a83          	ld	s5,56(sp)
    80007cd8:	02813b83          	ld	s7,40(sp)
    80007cdc:	02013c03          	ld	s8,32(sp)
    80007ce0:	01813c83          	ld	s9,24(sp)
    80007ce4:	40ab053b          	subw	a0,s6,a0
    80007ce8:	03013b03          	ld	s6,48(sp)
    80007cec:	07010113          	addi	sp,sp,112
    80007cf0:	00008067          	ret
    80007cf4:	00001097          	auipc	ra,0x1
    80007cf8:	1d8080e7          	jalr	472(ra) # 80008ecc <push_on>
    80007cfc:	0984a703          	lw	a4,152(s1)
    80007d00:	09c4a783          	lw	a5,156(s1)
    80007d04:	0007879b          	sext.w	a5,a5
    80007d08:	fef70ce3          	beq	a4,a5,80007d00 <consoleread+0xfc>
    80007d0c:	00001097          	auipc	ra,0x1
    80007d10:	234080e7          	jalr	564(ra) # 80008f40 <pop_on>
    80007d14:	0984a783          	lw	a5,152(s1)
    80007d18:	07f7f713          	andi	a4,a5,127
    80007d1c:	00e48733          	add	a4,s1,a4
    80007d20:	01874703          	lbu	a4,24(a4)
    80007d24:	0017869b          	addiw	a3,a5,1
    80007d28:	08d4ac23          	sw	a3,152(s1)
    80007d2c:	00070c9b          	sext.w	s9,a4
    80007d30:	f5371ee3          	bne	a4,s3,80007c8c <consoleread+0x88>
    80007d34:	000b851b          	sext.w	a0,s7
    80007d38:	f96bf2e3          	bgeu	s7,s6,80007cbc <consoleread+0xb8>
    80007d3c:	08f4ac23          	sw	a5,152(s1)
    80007d40:	f7dff06f          	j	80007cbc <consoleread+0xb8>

0000000080007d44 <consputc>:
    80007d44:	10000793          	li	a5,256
    80007d48:	00f50663          	beq	a0,a5,80007d54 <consputc+0x10>
    80007d4c:	00001317          	auipc	t1,0x1
    80007d50:	9f430067          	jr	-1548(t1) # 80008740 <uartputc_sync>
    80007d54:	ff010113          	addi	sp,sp,-16
    80007d58:	00113423          	sd	ra,8(sp)
    80007d5c:	00813023          	sd	s0,0(sp)
    80007d60:	01010413          	addi	s0,sp,16
    80007d64:	00800513          	li	a0,8
    80007d68:	00001097          	auipc	ra,0x1
    80007d6c:	9d8080e7          	jalr	-1576(ra) # 80008740 <uartputc_sync>
    80007d70:	02000513          	li	a0,32
    80007d74:	00001097          	auipc	ra,0x1
    80007d78:	9cc080e7          	jalr	-1588(ra) # 80008740 <uartputc_sync>
    80007d7c:	00013403          	ld	s0,0(sp)
    80007d80:	00813083          	ld	ra,8(sp)
    80007d84:	00800513          	li	a0,8
    80007d88:	01010113          	addi	sp,sp,16
    80007d8c:	00001317          	auipc	t1,0x1
    80007d90:	9b430067          	jr	-1612(t1) # 80008740 <uartputc_sync>

0000000080007d94 <consoleintr>:
    80007d94:	fe010113          	addi	sp,sp,-32
    80007d98:	00813823          	sd	s0,16(sp)
    80007d9c:	00913423          	sd	s1,8(sp)
    80007da0:	01213023          	sd	s2,0(sp)
    80007da4:	00113c23          	sd	ra,24(sp)
    80007da8:	02010413          	addi	s0,sp,32
    80007dac:	00006917          	auipc	s2,0x6
    80007db0:	13c90913          	addi	s2,s2,316 # 8000dee8 <cons>
    80007db4:	00050493          	mv	s1,a0
    80007db8:	00090513          	mv	a0,s2
    80007dbc:	00001097          	auipc	ra,0x1
    80007dc0:	e40080e7          	jalr	-448(ra) # 80008bfc <acquire>
    80007dc4:	02048c63          	beqz	s1,80007dfc <consoleintr+0x68>
    80007dc8:	0a092783          	lw	a5,160(s2)
    80007dcc:	09892703          	lw	a4,152(s2)
    80007dd0:	07f00693          	li	a3,127
    80007dd4:	40e7873b          	subw	a4,a5,a4
    80007dd8:	02e6e263          	bltu	a3,a4,80007dfc <consoleintr+0x68>
    80007ddc:	00d00713          	li	a4,13
    80007de0:	04e48063          	beq	s1,a4,80007e20 <consoleintr+0x8c>
    80007de4:	07f7f713          	andi	a4,a5,127
    80007de8:	00e90733          	add	a4,s2,a4
    80007dec:	0017879b          	addiw	a5,a5,1
    80007df0:	0af92023          	sw	a5,160(s2)
    80007df4:	00970c23          	sb	s1,24(a4)
    80007df8:	08f92e23          	sw	a5,156(s2)
    80007dfc:	01013403          	ld	s0,16(sp)
    80007e00:	01813083          	ld	ra,24(sp)
    80007e04:	00813483          	ld	s1,8(sp)
    80007e08:	00013903          	ld	s2,0(sp)
    80007e0c:	00006517          	auipc	a0,0x6
    80007e10:	0dc50513          	addi	a0,a0,220 # 8000dee8 <cons>
    80007e14:	02010113          	addi	sp,sp,32
    80007e18:	00001317          	auipc	t1,0x1
    80007e1c:	eb030067          	jr	-336(t1) # 80008cc8 <release>
    80007e20:	00a00493          	li	s1,10
    80007e24:	fc1ff06f          	j	80007de4 <consoleintr+0x50>

0000000080007e28 <consoleinit>:
    80007e28:	fe010113          	addi	sp,sp,-32
    80007e2c:	00113c23          	sd	ra,24(sp)
    80007e30:	00813823          	sd	s0,16(sp)
    80007e34:	00913423          	sd	s1,8(sp)
    80007e38:	02010413          	addi	s0,sp,32
    80007e3c:	00006497          	auipc	s1,0x6
    80007e40:	0ac48493          	addi	s1,s1,172 # 8000dee8 <cons>
    80007e44:	00048513          	mv	a0,s1
    80007e48:	00003597          	auipc	a1,0x3
    80007e4c:	95858593          	addi	a1,a1,-1704 # 8000a7a0 <CONSOLE_STATUS+0x790>
    80007e50:	00001097          	auipc	ra,0x1
    80007e54:	d88080e7          	jalr	-632(ra) # 80008bd8 <initlock>
    80007e58:	00000097          	auipc	ra,0x0
    80007e5c:	7ac080e7          	jalr	1964(ra) # 80008604 <uartinit>
    80007e60:	01813083          	ld	ra,24(sp)
    80007e64:	01013403          	ld	s0,16(sp)
    80007e68:	00000797          	auipc	a5,0x0
    80007e6c:	d9c78793          	addi	a5,a5,-612 # 80007c04 <consoleread>
    80007e70:	0af4bc23          	sd	a5,184(s1)
    80007e74:	00000797          	auipc	a5,0x0
    80007e78:	cec78793          	addi	a5,a5,-788 # 80007b60 <consolewrite>
    80007e7c:	0cf4b023          	sd	a5,192(s1)
    80007e80:	00813483          	ld	s1,8(sp)
    80007e84:	02010113          	addi	sp,sp,32
    80007e88:	00008067          	ret

0000000080007e8c <console_read>:
    80007e8c:	ff010113          	addi	sp,sp,-16
    80007e90:	00813423          	sd	s0,8(sp)
    80007e94:	01010413          	addi	s0,sp,16
    80007e98:	00813403          	ld	s0,8(sp)
    80007e9c:	00006317          	auipc	t1,0x6
    80007ea0:	10433303          	ld	t1,260(t1) # 8000dfa0 <devsw+0x10>
    80007ea4:	01010113          	addi	sp,sp,16
    80007ea8:	00030067          	jr	t1

0000000080007eac <console_write>:
    80007eac:	ff010113          	addi	sp,sp,-16
    80007eb0:	00813423          	sd	s0,8(sp)
    80007eb4:	01010413          	addi	s0,sp,16
    80007eb8:	00813403          	ld	s0,8(sp)
    80007ebc:	00006317          	auipc	t1,0x6
    80007ec0:	0ec33303          	ld	t1,236(t1) # 8000dfa8 <devsw+0x18>
    80007ec4:	01010113          	addi	sp,sp,16
    80007ec8:	00030067          	jr	t1

0000000080007ecc <panic>:
    80007ecc:	fe010113          	addi	sp,sp,-32
    80007ed0:	00113c23          	sd	ra,24(sp)
    80007ed4:	00813823          	sd	s0,16(sp)
    80007ed8:	00913423          	sd	s1,8(sp)
    80007edc:	02010413          	addi	s0,sp,32
    80007ee0:	00050493          	mv	s1,a0
    80007ee4:	00003517          	auipc	a0,0x3
    80007ee8:	8c450513          	addi	a0,a0,-1852 # 8000a7a8 <CONSOLE_STATUS+0x798>
    80007eec:	00006797          	auipc	a5,0x6
    80007ef0:	1407ae23          	sw	zero,348(a5) # 8000e048 <pr+0x18>
    80007ef4:	00000097          	auipc	ra,0x0
    80007ef8:	034080e7          	jalr	52(ra) # 80007f28 <__printf>
    80007efc:	00048513          	mv	a0,s1
    80007f00:	00000097          	auipc	ra,0x0
    80007f04:	028080e7          	jalr	40(ra) # 80007f28 <__printf>
    80007f08:	00002517          	auipc	a0,0x2
    80007f0c:	62850513          	addi	a0,a0,1576 # 8000a530 <CONSOLE_STATUS+0x520>
    80007f10:	00000097          	auipc	ra,0x0
    80007f14:	018080e7          	jalr	24(ra) # 80007f28 <__printf>
    80007f18:	00100793          	li	a5,1
    80007f1c:	00005717          	auipc	a4,0x5
    80007f20:	d4f72623          	sw	a5,-692(a4) # 8000cc68 <panicked>
    80007f24:	0000006f          	j	80007f24 <panic+0x58>

0000000080007f28 <__printf>:
    80007f28:	f3010113          	addi	sp,sp,-208
    80007f2c:	08813023          	sd	s0,128(sp)
    80007f30:	07313423          	sd	s3,104(sp)
    80007f34:	09010413          	addi	s0,sp,144
    80007f38:	05813023          	sd	s8,64(sp)
    80007f3c:	08113423          	sd	ra,136(sp)
    80007f40:	06913c23          	sd	s1,120(sp)
    80007f44:	07213823          	sd	s2,112(sp)
    80007f48:	07413023          	sd	s4,96(sp)
    80007f4c:	05513c23          	sd	s5,88(sp)
    80007f50:	05613823          	sd	s6,80(sp)
    80007f54:	05713423          	sd	s7,72(sp)
    80007f58:	03913c23          	sd	s9,56(sp)
    80007f5c:	03a13823          	sd	s10,48(sp)
    80007f60:	03b13423          	sd	s11,40(sp)
    80007f64:	00006317          	auipc	t1,0x6
    80007f68:	0cc30313          	addi	t1,t1,204 # 8000e030 <pr>
    80007f6c:	01832c03          	lw	s8,24(t1)
    80007f70:	00b43423          	sd	a1,8(s0)
    80007f74:	00c43823          	sd	a2,16(s0)
    80007f78:	00d43c23          	sd	a3,24(s0)
    80007f7c:	02e43023          	sd	a4,32(s0)
    80007f80:	02f43423          	sd	a5,40(s0)
    80007f84:	03043823          	sd	a6,48(s0)
    80007f88:	03143c23          	sd	a7,56(s0)
    80007f8c:	00050993          	mv	s3,a0
    80007f90:	4a0c1663          	bnez	s8,8000843c <__printf+0x514>
    80007f94:	60098c63          	beqz	s3,800085ac <__printf+0x684>
    80007f98:	0009c503          	lbu	a0,0(s3)
    80007f9c:	00840793          	addi	a5,s0,8
    80007fa0:	f6f43c23          	sd	a5,-136(s0)
    80007fa4:	00000493          	li	s1,0
    80007fa8:	22050063          	beqz	a0,800081c8 <__printf+0x2a0>
    80007fac:	00002a37          	lui	s4,0x2
    80007fb0:	00018ab7          	lui	s5,0x18
    80007fb4:	000f4b37          	lui	s6,0xf4
    80007fb8:	00989bb7          	lui	s7,0x989
    80007fbc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007fc0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007fc4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007fc8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007fcc:	00148c9b          	addiw	s9,s1,1
    80007fd0:	02500793          	li	a5,37
    80007fd4:	01998933          	add	s2,s3,s9
    80007fd8:	38f51263          	bne	a0,a5,8000835c <__printf+0x434>
    80007fdc:	00094783          	lbu	a5,0(s2)
    80007fe0:	00078c9b          	sext.w	s9,a5
    80007fe4:	1e078263          	beqz	a5,800081c8 <__printf+0x2a0>
    80007fe8:	0024849b          	addiw	s1,s1,2
    80007fec:	07000713          	li	a4,112
    80007ff0:	00998933          	add	s2,s3,s1
    80007ff4:	38e78a63          	beq	a5,a4,80008388 <__printf+0x460>
    80007ff8:	20f76863          	bltu	a4,a5,80008208 <__printf+0x2e0>
    80007ffc:	42a78863          	beq	a5,a0,8000842c <__printf+0x504>
    80008000:	06400713          	li	a4,100
    80008004:	40e79663          	bne	a5,a4,80008410 <__printf+0x4e8>
    80008008:	f7843783          	ld	a5,-136(s0)
    8000800c:	0007a603          	lw	a2,0(a5)
    80008010:	00878793          	addi	a5,a5,8
    80008014:	f6f43c23          	sd	a5,-136(s0)
    80008018:	42064a63          	bltz	a2,8000844c <__printf+0x524>
    8000801c:	00a00713          	li	a4,10
    80008020:	02e677bb          	remuw	a5,a2,a4
    80008024:	00002d97          	auipc	s11,0x2
    80008028:	7acd8d93          	addi	s11,s11,1964 # 8000a7d0 <digits>
    8000802c:	00900593          	li	a1,9
    80008030:	0006051b          	sext.w	a0,a2
    80008034:	00000c93          	li	s9,0
    80008038:	02079793          	slli	a5,a5,0x20
    8000803c:	0207d793          	srli	a5,a5,0x20
    80008040:	00fd87b3          	add	a5,s11,a5
    80008044:	0007c783          	lbu	a5,0(a5)
    80008048:	02e656bb          	divuw	a3,a2,a4
    8000804c:	f8f40023          	sb	a5,-128(s0)
    80008050:	14c5d863          	bge	a1,a2,800081a0 <__printf+0x278>
    80008054:	06300593          	li	a1,99
    80008058:	00100c93          	li	s9,1
    8000805c:	02e6f7bb          	remuw	a5,a3,a4
    80008060:	02079793          	slli	a5,a5,0x20
    80008064:	0207d793          	srli	a5,a5,0x20
    80008068:	00fd87b3          	add	a5,s11,a5
    8000806c:	0007c783          	lbu	a5,0(a5)
    80008070:	02e6d73b          	divuw	a4,a3,a4
    80008074:	f8f400a3          	sb	a5,-127(s0)
    80008078:	12a5f463          	bgeu	a1,a0,800081a0 <__printf+0x278>
    8000807c:	00a00693          	li	a3,10
    80008080:	00900593          	li	a1,9
    80008084:	02d777bb          	remuw	a5,a4,a3
    80008088:	02079793          	slli	a5,a5,0x20
    8000808c:	0207d793          	srli	a5,a5,0x20
    80008090:	00fd87b3          	add	a5,s11,a5
    80008094:	0007c503          	lbu	a0,0(a5)
    80008098:	02d757bb          	divuw	a5,a4,a3
    8000809c:	f8a40123          	sb	a0,-126(s0)
    800080a0:	48e5f263          	bgeu	a1,a4,80008524 <__printf+0x5fc>
    800080a4:	06300513          	li	a0,99
    800080a8:	02d7f5bb          	remuw	a1,a5,a3
    800080ac:	02059593          	slli	a1,a1,0x20
    800080b0:	0205d593          	srli	a1,a1,0x20
    800080b4:	00bd85b3          	add	a1,s11,a1
    800080b8:	0005c583          	lbu	a1,0(a1)
    800080bc:	02d7d7bb          	divuw	a5,a5,a3
    800080c0:	f8b401a3          	sb	a1,-125(s0)
    800080c4:	48e57263          	bgeu	a0,a4,80008548 <__printf+0x620>
    800080c8:	3e700513          	li	a0,999
    800080cc:	02d7f5bb          	remuw	a1,a5,a3
    800080d0:	02059593          	slli	a1,a1,0x20
    800080d4:	0205d593          	srli	a1,a1,0x20
    800080d8:	00bd85b3          	add	a1,s11,a1
    800080dc:	0005c583          	lbu	a1,0(a1)
    800080e0:	02d7d7bb          	divuw	a5,a5,a3
    800080e4:	f8b40223          	sb	a1,-124(s0)
    800080e8:	46e57663          	bgeu	a0,a4,80008554 <__printf+0x62c>
    800080ec:	02d7f5bb          	remuw	a1,a5,a3
    800080f0:	02059593          	slli	a1,a1,0x20
    800080f4:	0205d593          	srli	a1,a1,0x20
    800080f8:	00bd85b3          	add	a1,s11,a1
    800080fc:	0005c583          	lbu	a1,0(a1)
    80008100:	02d7d7bb          	divuw	a5,a5,a3
    80008104:	f8b402a3          	sb	a1,-123(s0)
    80008108:	46ea7863          	bgeu	s4,a4,80008578 <__printf+0x650>
    8000810c:	02d7f5bb          	remuw	a1,a5,a3
    80008110:	02059593          	slli	a1,a1,0x20
    80008114:	0205d593          	srli	a1,a1,0x20
    80008118:	00bd85b3          	add	a1,s11,a1
    8000811c:	0005c583          	lbu	a1,0(a1)
    80008120:	02d7d7bb          	divuw	a5,a5,a3
    80008124:	f8b40323          	sb	a1,-122(s0)
    80008128:	3eeaf863          	bgeu	s5,a4,80008518 <__printf+0x5f0>
    8000812c:	02d7f5bb          	remuw	a1,a5,a3
    80008130:	02059593          	slli	a1,a1,0x20
    80008134:	0205d593          	srli	a1,a1,0x20
    80008138:	00bd85b3          	add	a1,s11,a1
    8000813c:	0005c583          	lbu	a1,0(a1)
    80008140:	02d7d7bb          	divuw	a5,a5,a3
    80008144:	f8b403a3          	sb	a1,-121(s0)
    80008148:	42eb7e63          	bgeu	s6,a4,80008584 <__printf+0x65c>
    8000814c:	02d7f5bb          	remuw	a1,a5,a3
    80008150:	02059593          	slli	a1,a1,0x20
    80008154:	0205d593          	srli	a1,a1,0x20
    80008158:	00bd85b3          	add	a1,s11,a1
    8000815c:	0005c583          	lbu	a1,0(a1)
    80008160:	02d7d7bb          	divuw	a5,a5,a3
    80008164:	f8b40423          	sb	a1,-120(s0)
    80008168:	42ebfc63          	bgeu	s7,a4,800085a0 <__printf+0x678>
    8000816c:	02079793          	slli	a5,a5,0x20
    80008170:	0207d793          	srli	a5,a5,0x20
    80008174:	00fd8db3          	add	s11,s11,a5
    80008178:	000dc703          	lbu	a4,0(s11)
    8000817c:	00a00793          	li	a5,10
    80008180:	00900c93          	li	s9,9
    80008184:	f8e404a3          	sb	a4,-119(s0)
    80008188:	00065c63          	bgez	a2,800081a0 <__printf+0x278>
    8000818c:	f9040713          	addi	a4,s0,-112
    80008190:	00f70733          	add	a4,a4,a5
    80008194:	02d00693          	li	a3,45
    80008198:	fed70823          	sb	a3,-16(a4)
    8000819c:	00078c93          	mv	s9,a5
    800081a0:	f8040793          	addi	a5,s0,-128
    800081a4:	01978cb3          	add	s9,a5,s9
    800081a8:	f7f40d13          	addi	s10,s0,-129
    800081ac:	000cc503          	lbu	a0,0(s9)
    800081b0:	fffc8c93          	addi	s9,s9,-1
    800081b4:	00000097          	auipc	ra,0x0
    800081b8:	b90080e7          	jalr	-1136(ra) # 80007d44 <consputc>
    800081bc:	ffac98e3          	bne	s9,s10,800081ac <__printf+0x284>
    800081c0:	00094503          	lbu	a0,0(s2)
    800081c4:	e00514e3          	bnez	a0,80007fcc <__printf+0xa4>
    800081c8:	1a0c1663          	bnez	s8,80008374 <__printf+0x44c>
    800081cc:	08813083          	ld	ra,136(sp)
    800081d0:	08013403          	ld	s0,128(sp)
    800081d4:	07813483          	ld	s1,120(sp)
    800081d8:	07013903          	ld	s2,112(sp)
    800081dc:	06813983          	ld	s3,104(sp)
    800081e0:	06013a03          	ld	s4,96(sp)
    800081e4:	05813a83          	ld	s5,88(sp)
    800081e8:	05013b03          	ld	s6,80(sp)
    800081ec:	04813b83          	ld	s7,72(sp)
    800081f0:	04013c03          	ld	s8,64(sp)
    800081f4:	03813c83          	ld	s9,56(sp)
    800081f8:	03013d03          	ld	s10,48(sp)
    800081fc:	02813d83          	ld	s11,40(sp)
    80008200:	0d010113          	addi	sp,sp,208
    80008204:	00008067          	ret
    80008208:	07300713          	li	a4,115
    8000820c:	1ce78a63          	beq	a5,a4,800083e0 <__printf+0x4b8>
    80008210:	07800713          	li	a4,120
    80008214:	1ee79e63          	bne	a5,a4,80008410 <__printf+0x4e8>
    80008218:	f7843783          	ld	a5,-136(s0)
    8000821c:	0007a703          	lw	a4,0(a5)
    80008220:	00878793          	addi	a5,a5,8
    80008224:	f6f43c23          	sd	a5,-136(s0)
    80008228:	28074263          	bltz	a4,800084ac <__printf+0x584>
    8000822c:	00002d97          	auipc	s11,0x2
    80008230:	5a4d8d93          	addi	s11,s11,1444 # 8000a7d0 <digits>
    80008234:	00f77793          	andi	a5,a4,15
    80008238:	00fd87b3          	add	a5,s11,a5
    8000823c:	0007c683          	lbu	a3,0(a5)
    80008240:	00f00613          	li	a2,15
    80008244:	0007079b          	sext.w	a5,a4
    80008248:	f8d40023          	sb	a3,-128(s0)
    8000824c:	0047559b          	srliw	a1,a4,0x4
    80008250:	0047569b          	srliw	a3,a4,0x4
    80008254:	00000c93          	li	s9,0
    80008258:	0ee65063          	bge	a2,a4,80008338 <__printf+0x410>
    8000825c:	00f6f693          	andi	a3,a3,15
    80008260:	00dd86b3          	add	a3,s11,a3
    80008264:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80008268:	0087d79b          	srliw	a5,a5,0x8
    8000826c:	00100c93          	li	s9,1
    80008270:	f8d400a3          	sb	a3,-127(s0)
    80008274:	0cb67263          	bgeu	a2,a1,80008338 <__printf+0x410>
    80008278:	00f7f693          	andi	a3,a5,15
    8000827c:	00dd86b3          	add	a3,s11,a3
    80008280:	0006c583          	lbu	a1,0(a3)
    80008284:	00f00613          	li	a2,15
    80008288:	0047d69b          	srliw	a3,a5,0x4
    8000828c:	f8b40123          	sb	a1,-126(s0)
    80008290:	0047d593          	srli	a1,a5,0x4
    80008294:	28f67e63          	bgeu	a2,a5,80008530 <__printf+0x608>
    80008298:	00f6f693          	andi	a3,a3,15
    8000829c:	00dd86b3          	add	a3,s11,a3
    800082a0:	0006c503          	lbu	a0,0(a3)
    800082a4:	0087d813          	srli	a6,a5,0x8
    800082a8:	0087d69b          	srliw	a3,a5,0x8
    800082ac:	f8a401a3          	sb	a0,-125(s0)
    800082b0:	28b67663          	bgeu	a2,a1,8000853c <__printf+0x614>
    800082b4:	00f6f693          	andi	a3,a3,15
    800082b8:	00dd86b3          	add	a3,s11,a3
    800082bc:	0006c583          	lbu	a1,0(a3)
    800082c0:	00c7d513          	srli	a0,a5,0xc
    800082c4:	00c7d69b          	srliw	a3,a5,0xc
    800082c8:	f8b40223          	sb	a1,-124(s0)
    800082cc:	29067a63          	bgeu	a2,a6,80008560 <__printf+0x638>
    800082d0:	00f6f693          	andi	a3,a3,15
    800082d4:	00dd86b3          	add	a3,s11,a3
    800082d8:	0006c583          	lbu	a1,0(a3)
    800082dc:	0107d813          	srli	a6,a5,0x10
    800082e0:	0107d69b          	srliw	a3,a5,0x10
    800082e4:	f8b402a3          	sb	a1,-123(s0)
    800082e8:	28a67263          	bgeu	a2,a0,8000856c <__printf+0x644>
    800082ec:	00f6f693          	andi	a3,a3,15
    800082f0:	00dd86b3          	add	a3,s11,a3
    800082f4:	0006c683          	lbu	a3,0(a3)
    800082f8:	0147d79b          	srliw	a5,a5,0x14
    800082fc:	f8d40323          	sb	a3,-122(s0)
    80008300:	21067663          	bgeu	a2,a6,8000850c <__printf+0x5e4>
    80008304:	02079793          	slli	a5,a5,0x20
    80008308:	0207d793          	srli	a5,a5,0x20
    8000830c:	00fd8db3          	add	s11,s11,a5
    80008310:	000dc683          	lbu	a3,0(s11)
    80008314:	00800793          	li	a5,8
    80008318:	00700c93          	li	s9,7
    8000831c:	f8d403a3          	sb	a3,-121(s0)
    80008320:	00075c63          	bgez	a4,80008338 <__printf+0x410>
    80008324:	f9040713          	addi	a4,s0,-112
    80008328:	00f70733          	add	a4,a4,a5
    8000832c:	02d00693          	li	a3,45
    80008330:	fed70823          	sb	a3,-16(a4)
    80008334:	00078c93          	mv	s9,a5
    80008338:	f8040793          	addi	a5,s0,-128
    8000833c:	01978cb3          	add	s9,a5,s9
    80008340:	f7f40d13          	addi	s10,s0,-129
    80008344:	000cc503          	lbu	a0,0(s9)
    80008348:	fffc8c93          	addi	s9,s9,-1
    8000834c:	00000097          	auipc	ra,0x0
    80008350:	9f8080e7          	jalr	-1544(ra) # 80007d44 <consputc>
    80008354:	ff9d18e3          	bne	s10,s9,80008344 <__printf+0x41c>
    80008358:	0100006f          	j	80008368 <__printf+0x440>
    8000835c:	00000097          	auipc	ra,0x0
    80008360:	9e8080e7          	jalr	-1560(ra) # 80007d44 <consputc>
    80008364:	000c8493          	mv	s1,s9
    80008368:	00094503          	lbu	a0,0(s2)
    8000836c:	c60510e3          	bnez	a0,80007fcc <__printf+0xa4>
    80008370:	e40c0ee3          	beqz	s8,800081cc <__printf+0x2a4>
    80008374:	00006517          	auipc	a0,0x6
    80008378:	cbc50513          	addi	a0,a0,-836 # 8000e030 <pr>
    8000837c:	00001097          	auipc	ra,0x1
    80008380:	94c080e7          	jalr	-1716(ra) # 80008cc8 <release>
    80008384:	e49ff06f          	j	800081cc <__printf+0x2a4>
    80008388:	f7843783          	ld	a5,-136(s0)
    8000838c:	03000513          	li	a0,48
    80008390:	01000d13          	li	s10,16
    80008394:	00878713          	addi	a4,a5,8
    80008398:	0007bc83          	ld	s9,0(a5)
    8000839c:	f6e43c23          	sd	a4,-136(s0)
    800083a0:	00000097          	auipc	ra,0x0
    800083a4:	9a4080e7          	jalr	-1628(ra) # 80007d44 <consputc>
    800083a8:	07800513          	li	a0,120
    800083ac:	00000097          	auipc	ra,0x0
    800083b0:	998080e7          	jalr	-1640(ra) # 80007d44 <consputc>
    800083b4:	00002d97          	auipc	s11,0x2
    800083b8:	41cd8d93          	addi	s11,s11,1052 # 8000a7d0 <digits>
    800083bc:	03ccd793          	srli	a5,s9,0x3c
    800083c0:	00fd87b3          	add	a5,s11,a5
    800083c4:	0007c503          	lbu	a0,0(a5)
    800083c8:	fffd0d1b          	addiw	s10,s10,-1
    800083cc:	004c9c93          	slli	s9,s9,0x4
    800083d0:	00000097          	auipc	ra,0x0
    800083d4:	974080e7          	jalr	-1676(ra) # 80007d44 <consputc>
    800083d8:	fe0d12e3          	bnez	s10,800083bc <__printf+0x494>
    800083dc:	f8dff06f          	j	80008368 <__printf+0x440>
    800083e0:	f7843783          	ld	a5,-136(s0)
    800083e4:	0007bc83          	ld	s9,0(a5)
    800083e8:	00878793          	addi	a5,a5,8
    800083ec:	f6f43c23          	sd	a5,-136(s0)
    800083f0:	000c9a63          	bnez	s9,80008404 <__printf+0x4dc>
    800083f4:	1080006f          	j	800084fc <__printf+0x5d4>
    800083f8:	001c8c93          	addi	s9,s9,1
    800083fc:	00000097          	auipc	ra,0x0
    80008400:	948080e7          	jalr	-1720(ra) # 80007d44 <consputc>
    80008404:	000cc503          	lbu	a0,0(s9)
    80008408:	fe0518e3          	bnez	a0,800083f8 <__printf+0x4d0>
    8000840c:	f5dff06f          	j	80008368 <__printf+0x440>
    80008410:	02500513          	li	a0,37
    80008414:	00000097          	auipc	ra,0x0
    80008418:	930080e7          	jalr	-1744(ra) # 80007d44 <consputc>
    8000841c:	000c8513          	mv	a0,s9
    80008420:	00000097          	auipc	ra,0x0
    80008424:	924080e7          	jalr	-1756(ra) # 80007d44 <consputc>
    80008428:	f41ff06f          	j	80008368 <__printf+0x440>
    8000842c:	02500513          	li	a0,37
    80008430:	00000097          	auipc	ra,0x0
    80008434:	914080e7          	jalr	-1772(ra) # 80007d44 <consputc>
    80008438:	f31ff06f          	j	80008368 <__printf+0x440>
    8000843c:	00030513          	mv	a0,t1
    80008440:	00000097          	auipc	ra,0x0
    80008444:	7bc080e7          	jalr	1980(ra) # 80008bfc <acquire>
    80008448:	b4dff06f          	j	80007f94 <__printf+0x6c>
    8000844c:	40c0053b          	negw	a0,a2
    80008450:	00a00713          	li	a4,10
    80008454:	02e576bb          	remuw	a3,a0,a4
    80008458:	00002d97          	auipc	s11,0x2
    8000845c:	378d8d93          	addi	s11,s11,888 # 8000a7d0 <digits>
    80008460:	ff700593          	li	a1,-9
    80008464:	02069693          	slli	a3,a3,0x20
    80008468:	0206d693          	srli	a3,a3,0x20
    8000846c:	00dd86b3          	add	a3,s11,a3
    80008470:	0006c683          	lbu	a3,0(a3)
    80008474:	02e557bb          	divuw	a5,a0,a4
    80008478:	f8d40023          	sb	a3,-128(s0)
    8000847c:	10b65e63          	bge	a2,a1,80008598 <__printf+0x670>
    80008480:	06300593          	li	a1,99
    80008484:	02e7f6bb          	remuw	a3,a5,a4
    80008488:	02069693          	slli	a3,a3,0x20
    8000848c:	0206d693          	srli	a3,a3,0x20
    80008490:	00dd86b3          	add	a3,s11,a3
    80008494:	0006c683          	lbu	a3,0(a3)
    80008498:	02e7d73b          	divuw	a4,a5,a4
    8000849c:	00200793          	li	a5,2
    800084a0:	f8d400a3          	sb	a3,-127(s0)
    800084a4:	bca5ece3          	bltu	a1,a0,8000807c <__printf+0x154>
    800084a8:	ce5ff06f          	j	8000818c <__printf+0x264>
    800084ac:	40e007bb          	negw	a5,a4
    800084b0:	00002d97          	auipc	s11,0x2
    800084b4:	320d8d93          	addi	s11,s11,800 # 8000a7d0 <digits>
    800084b8:	00f7f693          	andi	a3,a5,15
    800084bc:	00dd86b3          	add	a3,s11,a3
    800084c0:	0006c583          	lbu	a1,0(a3)
    800084c4:	ff100613          	li	a2,-15
    800084c8:	0047d69b          	srliw	a3,a5,0x4
    800084cc:	f8b40023          	sb	a1,-128(s0)
    800084d0:	0047d59b          	srliw	a1,a5,0x4
    800084d4:	0ac75e63          	bge	a4,a2,80008590 <__printf+0x668>
    800084d8:	00f6f693          	andi	a3,a3,15
    800084dc:	00dd86b3          	add	a3,s11,a3
    800084e0:	0006c603          	lbu	a2,0(a3)
    800084e4:	00f00693          	li	a3,15
    800084e8:	0087d79b          	srliw	a5,a5,0x8
    800084ec:	f8c400a3          	sb	a2,-127(s0)
    800084f0:	d8b6e4e3          	bltu	a3,a1,80008278 <__printf+0x350>
    800084f4:	00200793          	li	a5,2
    800084f8:	e2dff06f          	j	80008324 <__printf+0x3fc>
    800084fc:	00002c97          	auipc	s9,0x2
    80008500:	2b4c8c93          	addi	s9,s9,692 # 8000a7b0 <CONSOLE_STATUS+0x7a0>
    80008504:	02800513          	li	a0,40
    80008508:	ef1ff06f          	j	800083f8 <__printf+0x4d0>
    8000850c:	00700793          	li	a5,7
    80008510:	00600c93          	li	s9,6
    80008514:	e0dff06f          	j	80008320 <__printf+0x3f8>
    80008518:	00700793          	li	a5,7
    8000851c:	00600c93          	li	s9,6
    80008520:	c69ff06f          	j	80008188 <__printf+0x260>
    80008524:	00300793          	li	a5,3
    80008528:	00200c93          	li	s9,2
    8000852c:	c5dff06f          	j	80008188 <__printf+0x260>
    80008530:	00300793          	li	a5,3
    80008534:	00200c93          	li	s9,2
    80008538:	de9ff06f          	j	80008320 <__printf+0x3f8>
    8000853c:	00400793          	li	a5,4
    80008540:	00300c93          	li	s9,3
    80008544:	dddff06f          	j	80008320 <__printf+0x3f8>
    80008548:	00400793          	li	a5,4
    8000854c:	00300c93          	li	s9,3
    80008550:	c39ff06f          	j	80008188 <__printf+0x260>
    80008554:	00500793          	li	a5,5
    80008558:	00400c93          	li	s9,4
    8000855c:	c2dff06f          	j	80008188 <__printf+0x260>
    80008560:	00500793          	li	a5,5
    80008564:	00400c93          	li	s9,4
    80008568:	db9ff06f          	j	80008320 <__printf+0x3f8>
    8000856c:	00600793          	li	a5,6
    80008570:	00500c93          	li	s9,5
    80008574:	dadff06f          	j	80008320 <__printf+0x3f8>
    80008578:	00600793          	li	a5,6
    8000857c:	00500c93          	li	s9,5
    80008580:	c09ff06f          	j	80008188 <__printf+0x260>
    80008584:	00800793          	li	a5,8
    80008588:	00700c93          	li	s9,7
    8000858c:	bfdff06f          	j	80008188 <__printf+0x260>
    80008590:	00100793          	li	a5,1
    80008594:	d91ff06f          	j	80008324 <__printf+0x3fc>
    80008598:	00100793          	li	a5,1
    8000859c:	bf1ff06f          	j	8000818c <__printf+0x264>
    800085a0:	00900793          	li	a5,9
    800085a4:	00800c93          	li	s9,8
    800085a8:	be1ff06f          	j	80008188 <__printf+0x260>
    800085ac:	00002517          	auipc	a0,0x2
    800085b0:	20c50513          	addi	a0,a0,524 # 8000a7b8 <CONSOLE_STATUS+0x7a8>
    800085b4:	00000097          	auipc	ra,0x0
    800085b8:	918080e7          	jalr	-1768(ra) # 80007ecc <panic>

00000000800085bc <printfinit>:
    800085bc:	fe010113          	addi	sp,sp,-32
    800085c0:	00813823          	sd	s0,16(sp)
    800085c4:	00913423          	sd	s1,8(sp)
    800085c8:	00113c23          	sd	ra,24(sp)
    800085cc:	02010413          	addi	s0,sp,32
    800085d0:	00006497          	auipc	s1,0x6
    800085d4:	a6048493          	addi	s1,s1,-1440 # 8000e030 <pr>
    800085d8:	00048513          	mv	a0,s1
    800085dc:	00002597          	auipc	a1,0x2
    800085e0:	1ec58593          	addi	a1,a1,492 # 8000a7c8 <CONSOLE_STATUS+0x7b8>
    800085e4:	00000097          	auipc	ra,0x0
    800085e8:	5f4080e7          	jalr	1524(ra) # 80008bd8 <initlock>
    800085ec:	01813083          	ld	ra,24(sp)
    800085f0:	01013403          	ld	s0,16(sp)
    800085f4:	0004ac23          	sw	zero,24(s1)
    800085f8:	00813483          	ld	s1,8(sp)
    800085fc:	02010113          	addi	sp,sp,32
    80008600:	00008067          	ret

0000000080008604 <uartinit>:
    80008604:	ff010113          	addi	sp,sp,-16
    80008608:	00813423          	sd	s0,8(sp)
    8000860c:	01010413          	addi	s0,sp,16
    80008610:	100007b7          	lui	a5,0x10000
    80008614:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008618:	f8000713          	li	a4,-128
    8000861c:	00e781a3          	sb	a4,3(a5)
    80008620:	00300713          	li	a4,3
    80008624:	00e78023          	sb	a4,0(a5)
    80008628:	000780a3          	sb	zero,1(a5)
    8000862c:	00e781a3          	sb	a4,3(a5)
    80008630:	00700693          	li	a3,7
    80008634:	00d78123          	sb	a3,2(a5)
    80008638:	00e780a3          	sb	a4,1(a5)
    8000863c:	00813403          	ld	s0,8(sp)
    80008640:	01010113          	addi	sp,sp,16
    80008644:	00008067          	ret

0000000080008648 <uartputc>:
    80008648:	00004797          	auipc	a5,0x4
    8000864c:	6207a783          	lw	a5,1568(a5) # 8000cc68 <panicked>
    80008650:	00078463          	beqz	a5,80008658 <uartputc+0x10>
    80008654:	0000006f          	j	80008654 <uartputc+0xc>
    80008658:	fd010113          	addi	sp,sp,-48
    8000865c:	02813023          	sd	s0,32(sp)
    80008660:	00913c23          	sd	s1,24(sp)
    80008664:	01213823          	sd	s2,16(sp)
    80008668:	01313423          	sd	s3,8(sp)
    8000866c:	02113423          	sd	ra,40(sp)
    80008670:	03010413          	addi	s0,sp,48
    80008674:	00004917          	auipc	s2,0x4
    80008678:	5fc90913          	addi	s2,s2,1532 # 8000cc70 <uart_tx_r>
    8000867c:	00093783          	ld	a5,0(s2)
    80008680:	00004497          	auipc	s1,0x4
    80008684:	5f848493          	addi	s1,s1,1528 # 8000cc78 <uart_tx_w>
    80008688:	0004b703          	ld	a4,0(s1)
    8000868c:	02078693          	addi	a3,a5,32
    80008690:	00050993          	mv	s3,a0
    80008694:	02e69c63          	bne	a3,a4,800086cc <uartputc+0x84>
    80008698:	00001097          	auipc	ra,0x1
    8000869c:	834080e7          	jalr	-1996(ra) # 80008ecc <push_on>
    800086a0:	00093783          	ld	a5,0(s2)
    800086a4:	0004b703          	ld	a4,0(s1)
    800086a8:	02078793          	addi	a5,a5,32
    800086ac:	00e79463          	bne	a5,a4,800086b4 <uartputc+0x6c>
    800086b0:	0000006f          	j	800086b0 <uartputc+0x68>
    800086b4:	00001097          	auipc	ra,0x1
    800086b8:	88c080e7          	jalr	-1908(ra) # 80008f40 <pop_on>
    800086bc:	00093783          	ld	a5,0(s2)
    800086c0:	0004b703          	ld	a4,0(s1)
    800086c4:	02078693          	addi	a3,a5,32
    800086c8:	fce688e3          	beq	a3,a4,80008698 <uartputc+0x50>
    800086cc:	01f77693          	andi	a3,a4,31
    800086d0:	00006597          	auipc	a1,0x6
    800086d4:	98058593          	addi	a1,a1,-1664 # 8000e050 <uart_tx_buf>
    800086d8:	00d586b3          	add	a3,a1,a3
    800086dc:	00170713          	addi	a4,a4,1
    800086e0:	01368023          	sb	s3,0(a3)
    800086e4:	00e4b023          	sd	a4,0(s1)
    800086e8:	10000637          	lui	a2,0x10000
    800086ec:	02f71063          	bne	a4,a5,8000870c <uartputc+0xc4>
    800086f0:	0340006f          	j	80008724 <uartputc+0xdc>
    800086f4:	00074703          	lbu	a4,0(a4)
    800086f8:	00f93023          	sd	a5,0(s2)
    800086fc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008700:	00093783          	ld	a5,0(s2)
    80008704:	0004b703          	ld	a4,0(s1)
    80008708:	00f70e63          	beq	a4,a5,80008724 <uartputc+0xdc>
    8000870c:	00564683          	lbu	a3,5(a2)
    80008710:	01f7f713          	andi	a4,a5,31
    80008714:	00e58733          	add	a4,a1,a4
    80008718:	0206f693          	andi	a3,a3,32
    8000871c:	00178793          	addi	a5,a5,1
    80008720:	fc069ae3          	bnez	a3,800086f4 <uartputc+0xac>
    80008724:	02813083          	ld	ra,40(sp)
    80008728:	02013403          	ld	s0,32(sp)
    8000872c:	01813483          	ld	s1,24(sp)
    80008730:	01013903          	ld	s2,16(sp)
    80008734:	00813983          	ld	s3,8(sp)
    80008738:	03010113          	addi	sp,sp,48
    8000873c:	00008067          	ret

0000000080008740 <uartputc_sync>:
    80008740:	ff010113          	addi	sp,sp,-16
    80008744:	00813423          	sd	s0,8(sp)
    80008748:	01010413          	addi	s0,sp,16
    8000874c:	00004717          	auipc	a4,0x4
    80008750:	51c72703          	lw	a4,1308(a4) # 8000cc68 <panicked>
    80008754:	02071663          	bnez	a4,80008780 <uartputc_sync+0x40>
    80008758:	00050793          	mv	a5,a0
    8000875c:	100006b7          	lui	a3,0x10000
    80008760:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008764:	02077713          	andi	a4,a4,32
    80008768:	fe070ce3          	beqz	a4,80008760 <uartputc_sync+0x20>
    8000876c:	0ff7f793          	andi	a5,a5,255
    80008770:	00f68023          	sb	a5,0(a3)
    80008774:	00813403          	ld	s0,8(sp)
    80008778:	01010113          	addi	sp,sp,16
    8000877c:	00008067          	ret
    80008780:	0000006f          	j	80008780 <uartputc_sync+0x40>

0000000080008784 <uartstart>:
    80008784:	ff010113          	addi	sp,sp,-16
    80008788:	00813423          	sd	s0,8(sp)
    8000878c:	01010413          	addi	s0,sp,16
    80008790:	00004617          	auipc	a2,0x4
    80008794:	4e060613          	addi	a2,a2,1248 # 8000cc70 <uart_tx_r>
    80008798:	00004517          	auipc	a0,0x4
    8000879c:	4e050513          	addi	a0,a0,1248 # 8000cc78 <uart_tx_w>
    800087a0:	00063783          	ld	a5,0(a2)
    800087a4:	00053703          	ld	a4,0(a0)
    800087a8:	04f70263          	beq	a4,a5,800087ec <uartstart+0x68>
    800087ac:	100005b7          	lui	a1,0x10000
    800087b0:	00006817          	auipc	a6,0x6
    800087b4:	8a080813          	addi	a6,a6,-1888 # 8000e050 <uart_tx_buf>
    800087b8:	01c0006f          	j	800087d4 <uartstart+0x50>
    800087bc:	0006c703          	lbu	a4,0(a3)
    800087c0:	00f63023          	sd	a5,0(a2)
    800087c4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800087c8:	00063783          	ld	a5,0(a2)
    800087cc:	00053703          	ld	a4,0(a0)
    800087d0:	00f70e63          	beq	a4,a5,800087ec <uartstart+0x68>
    800087d4:	01f7f713          	andi	a4,a5,31
    800087d8:	00e806b3          	add	a3,a6,a4
    800087dc:	0055c703          	lbu	a4,5(a1)
    800087e0:	00178793          	addi	a5,a5,1
    800087e4:	02077713          	andi	a4,a4,32
    800087e8:	fc071ae3          	bnez	a4,800087bc <uartstart+0x38>
    800087ec:	00813403          	ld	s0,8(sp)
    800087f0:	01010113          	addi	sp,sp,16
    800087f4:	00008067          	ret

00000000800087f8 <uartgetc>:
    800087f8:	ff010113          	addi	sp,sp,-16
    800087fc:	00813423          	sd	s0,8(sp)
    80008800:	01010413          	addi	s0,sp,16
    80008804:	10000737          	lui	a4,0x10000
    80008808:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000880c:	0017f793          	andi	a5,a5,1
    80008810:	00078c63          	beqz	a5,80008828 <uartgetc+0x30>
    80008814:	00074503          	lbu	a0,0(a4)
    80008818:	0ff57513          	andi	a0,a0,255
    8000881c:	00813403          	ld	s0,8(sp)
    80008820:	01010113          	addi	sp,sp,16
    80008824:	00008067          	ret
    80008828:	fff00513          	li	a0,-1
    8000882c:	ff1ff06f          	j	8000881c <uartgetc+0x24>

0000000080008830 <uartintr>:
    80008830:	100007b7          	lui	a5,0x10000
    80008834:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008838:	0017f793          	andi	a5,a5,1
    8000883c:	0a078463          	beqz	a5,800088e4 <uartintr+0xb4>
    80008840:	fe010113          	addi	sp,sp,-32
    80008844:	00813823          	sd	s0,16(sp)
    80008848:	00913423          	sd	s1,8(sp)
    8000884c:	00113c23          	sd	ra,24(sp)
    80008850:	02010413          	addi	s0,sp,32
    80008854:	100004b7          	lui	s1,0x10000
    80008858:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000885c:	0ff57513          	andi	a0,a0,255
    80008860:	fffff097          	auipc	ra,0xfffff
    80008864:	534080e7          	jalr	1332(ra) # 80007d94 <consoleintr>
    80008868:	0054c783          	lbu	a5,5(s1)
    8000886c:	0017f793          	andi	a5,a5,1
    80008870:	fe0794e3          	bnez	a5,80008858 <uartintr+0x28>
    80008874:	00004617          	auipc	a2,0x4
    80008878:	3fc60613          	addi	a2,a2,1020 # 8000cc70 <uart_tx_r>
    8000887c:	00004517          	auipc	a0,0x4
    80008880:	3fc50513          	addi	a0,a0,1020 # 8000cc78 <uart_tx_w>
    80008884:	00063783          	ld	a5,0(a2)
    80008888:	00053703          	ld	a4,0(a0)
    8000888c:	04f70263          	beq	a4,a5,800088d0 <uartintr+0xa0>
    80008890:	100005b7          	lui	a1,0x10000
    80008894:	00005817          	auipc	a6,0x5
    80008898:	7bc80813          	addi	a6,a6,1980 # 8000e050 <uart_tx_buf>
    8000889c:	01c0006f          	j	800088b8 <uartintr+0x88>
    800088a0:	0006c703          	lbu	a4,0(a3)
    800088a4:	00f63023          	sd	a5,0(a2)
    800088a8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800088ac:	00063783          	ld	a5,0(a2)
    800088b0:	00053703          	ld	a4,0(a0)
    800088b4:	00f70e63          	beq	a4,a5,800088d0 <uartintr+0xa0>
    800088b8:	01f7f713          	andi	a4,a5,31
    800088bc:	00e806b3          	add	a3,a6,a4
    800088c0:	0055c703          	lbu	a4,5(a1)
    800088c4:	00178793          	addi	a5,a5,1
    800088c8:	02077713          	andi	a4,a4,32
    800088cc:	fc071ae3          	bnez	a4,800088a0 <uartintr+0x70>
    800088d0:	01813083          	ld	ra,24(sp)
    800088d4:	01013403          	ld	s0,16(sp)
    800088d8:	00813483          	ld	s1,8(sp)
    800088dc:	02010113          	addi	sp,sp,32
    800088e0:	00008067          	ret
    800088e4:	00004617          	auipc	a2,0x4
    800088e8:	38c60613          	addi	a2,a2,908 # 8000cc70 <uart_tx_r>
    800088ec:	00004517          	auipc	a0,0x4
    800088f0:	38c50513          	addi	a0,a0,908 # 8000cc78 <uart_tx_w>
    800088f4:	00063783          	ld	a5,0(a2)
    800088f8:	00053703          	ld	a4,0(a0)
    800088fc:	04f70263          	beq	a4,a5,80008940 <uartintr+0x110>
    80008900:	100005b7          	lui	a1,0x10000
    80008904:	00005817          	auipc	a6,0x5
    80008908:	74c80813          	addi	a6,a6,1868 # 8000e050 <uart_tx_buf>
    8000890c:	01c0006f          	j	80008928 <uartintr+0xf8>
    80008910:	0006c703          	lbu	a4,0(a3)
    80008914:	00f63023          	sd	a5,0(a2)
    80008918:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000891c:	00063783          	ld	a5,0(a2)
    80008920:	00053703          	ld	a4,0(a0)
    80008924:	02f70063          	beq	a4,a5,80008944 <uartintr+0x114>
    80008928:	01f7f713          	andi	a4,a5,31
    8000892c:	00e806b3          	add	a3,a6,a4
    80008930:	0055c703          	lbu	a4,5(a1)
    80008934:	00178793          	addi	a5,a5,1
    80008938:	02077713          	andi	a4,a4,32
    8000893c:	fc071ae3          	bnez	a4,80008910 <uartintr+0xe0>
    80008940:	00008067          	ret
    80008944:	00008067          	ret

0000000080008948 <kinit>:
    80008948:	fc010113          	addi	sp,sp,-64
    8000894c:	02913423          	sd	s1,40(sp)
    80008950:	fffff7b7          	lui	a5,0xfffff
    80008954:	00006497          	auipc	s1,0x6
    80008958:	71b48493          	addi	s1,s1,1819 # 8000f06f <end+0xfff>
    8000895c:	02813823          	sd	s0,48(sp)
    80008960:	01313c23          	sd	s3,24(sp)
    80008964:	00f4f4b3          	and	s1,s1,a5
    80008968:	02113c23          	sd	ra,56(sp)
    8000896c:	03213023          	sd	s2,32(sp)
    80008970:	01413823          	sd	s4,16(sp)
    80008974:	01513423          	sd	s5,8(sp)
    80008978:	04010413          	addi	s0,sp,64
    8000897c:	000017b7          	lui	a5,0x1
    80008980:	01100993          	li	s3,17
    80008984:	00f487b3          	add	a5,s1,a5
    80008988:	01b99993          	slli	s3,s3,0x1b
    8000898c:	06f9e063          	bltu	s3,a5,800089ec <kinit+0xa4>
    80008990:	00005a97          	auipc	s5,0x5
    80008994:	6e0a8a93          	addi	s5,s5,1760 # 8000e070 <end>
    80008998:	0754ec63          	bltu	s1,s5,80008a10 <kinit+0xc8>
    8000899c:	0734fa63          	bgeu	s1,s3,80008a10 <kinit+0xc8>
    800089a0:	00088a37          	lui	s4,0x88
    800089a4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800089a8:	00004917          	auipc	s2,0x4
    800089ac:	2d890913          	addi	s2,s2,728 # 8000cc80 <kmem>
    800089b0:	00ca1a13          	slli	s4,s4,0xc
    800089b4:	0140006f          	j	800089c8 <kinit+0x80>
    800089b8:	000017b7          	lui	a5,0x1
    800089bc:	00f484b3          	add	s1,s1,a5
    800089c0:	0554e863          	bltu	s1,s5,80008a10 <kinit+0xc8>
    800089c4:	0534f663          	bgeu	s1,s3,80008a10 <kinit+0xc8>
    800089c8:	00001637          	lui	a2,0x1
    800089cc:	00100593          	li	a1,1
    800089d0:	00048513          	mv	a0,s1
    800089d4:	00000097          	auipc	ra,0x0
    800089d8:	5e4080e7          	jalr	1508(ra) # 80008fb8 <__memset>
    800089dc:	00093783          	ld	a5,0(s2)
    800089e0:	00f4b023          	sd	a5,0(s1)
    800089e4:	00993023          	sd	s1,0(s2)
    800089e8:	fd4498e3          	bne	s1,s4,800089b8 <kinit+0x70>
    800089ec:	03813083          	ld	ra,56(sp)
    800089f0:	03013403          	ld	s0,48(sp)
    800089f4:	02813483          	ld	s1,40(sp)
    800089f8:	02013903          	ld	s2,32(sp)
    800089fc:	01813983          	ld	s3,24(sp)
    80008a00:	01013a03          	ld	s4,16(sp)
    80008a04:	00813a83          	ld	s5,8(sp)
    80008a08:	04010113          	addi	sp,sp,64
    80008a0c:	00008067          	ret
    80008a10:	00002517          	auipc	a0,0x2
    80008a14:	dd850513          	addi	a0,a0,-552 # 8000a7e8 <digits+0x18>
    80008a18:	fffff097          	auipc	ra,0xfffff
    80008a1c:	4b4080e7          	jalr	1204(ra) # 80007ecc <panic>

0000000080008a20 <freerange>:
    80008a20:	fc010113          	addi	sp,sp,-64
    80008a24:	000017b7          	lui	a5,0x1
    80008a28:	02913423          	sd	s1,40(sp)
    80008a2c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008a30:	009504b3          	add	s1,a0,s1
    80008a34:	fffff537          	lui	a0,0xfffff
    80008a38:	02813823          	sd	s0,48(sp)
    80008a3c:	02113c23          	sd	ra,56(sp)
    80008a40:	03213023          	sd	s2,32(sp)
    80008a44:	01313c23          	sd	s3,24(sp)
    80008a48:	01413823          	sd	s4,16(sp)
    80008a4c:	01513423          	sd	s5,8(sp)
    80008a50:	01613023          	sd	s6,0(sp)
    80008a54:	04010413          	addi	s0,sp,64
    80008a58:	00a4f4b3          	and	s1,s1,a0
    80008a5c:	00f487b3          	add	a5,s1,a5
    80008a60:	06f5e463          	bltu	a1,a5,80008ac8 <freerange+0xa8>
    80008a64:	00005a97          	auipc	s5,0x5
    80008a68:	60ca8a93          	addi	s5,s5,1548 # 8000e070 <end>
    80008a6c:	0954e263          	bltu	s1,s5,80008af0 <freerange+0xd0>
    80008a70:	01100993          	li	s3,17
    80008a74:	01b99993          	slli	s3,s3,0x1b
    80008a78:	0734fc63          	bgeu	s1,s3,80008af0 <freerange+0xd0>
    80008a7c:	00058a13          	mv	s4,a1
    80008a80:	00004917          	auipc	s2,0x4
    80008a84:	20090913          	addi	s2,s2,512 # 8000cc80 <kmem>
    80008a88:	00002b37          	lui	s6,0x2
    80008a8c:	0140006f          	j	80008aa0 <freerange+0x80>
    80008a90:	000017b7          	lui	a5,0x1
    80008a94:	00f484b3          	add	s1,s1,a5
    80008a98:	0554ec63          	bltu	s1,s5,80008af0 <freerange+0xd0>
    80008a9c:	0534fa63          	bgeu	s1,s3,80008af0 <freerange+0xd0>
    80008aa0:	00001637          	lui	a2,0x1
    80008aa4:	00100593          	li	a1,1
    80008aa8:	00048513          	mv	a0,s1
    80008aac:	00000097          	auipc	ra,0x0
    80008ab0:	50c080e7          	jalr	1292(ra) # 80008fb8 <__memset>
    80008ab4:	00093703          	ld	a4,0(s2)
    80008ab8:	016487b3          	add	a5,s1,s6
    80008abc:	00e4b023          	sd	a4,0(s1)
    80008ac0:	00993023          	sd	s1,0(s2)
    80008ac4:	fcfa76e3          	bgeu	s4,a5,80008a90 <freerange+0x70>
    80008ac8:	03813083          	ld	ra,56(sp)
    80008acc:	03013403          	ld	s0,48(sp)
    80008ad0:	02813483          	ld	s1,40(sp)
    80008ad4:	02013903          	ld	s2,32(sp)
    80008ad8:	01813983          	ld	s3,24(sp)
    80008adc:	01013a03          	ld	s4,16(sp)
    80008ae0:	00813a83          	ld	s5,8(sp)
    80008ae4:	00013b03          	ld	s6,0(sp)
    80008ae8:	04010113          	addi	sp,sp,64
    80008aec:	00008067          	ret
    80008af0:	00002517          	auipc	a0,0x2
    80008af4:	cf850513          	addi	a0,a0,-776 # 8000a7e8 <digits+0x18>
    80008af8:	fffff097          	auipc	ra,0xfffff
    80008afc:	3d4080e7          	jalr	980(ra) # 80007ecc <panic>

0000000080008b00 <kfree>:
    80008b00:	fe010113          	addi	sp,sp,-32
    80008b04:	00813823          	sd	s0,16(sp)
    80008b08:	00113c23          	sd	ra,24(sp)
    80008b0c:	00913423          	sd	s1,8(sp)
    80008b10:	02010413          	addi	s0,sp,32
    80008b14:	03451793          	slli	a5,a0,0x34
    80008b18:	04079c63          	bnez	a5,80008b70 <kfree+0x70>
    80008b1c:	00005797          	auipc	a5,0x5
    80008b20:	55478793          	addi	a5,a5,1364 # 8000e070 <end>
    80008b24:	00050493          	mv	s1,a0
    80008b28:	04f56463          	bltu	a0,a5,80008b70 <kfree+0x70>
    80008b2c:	01100793          	li	a5,17
    80008b30:	01b79793          	slli	a5,a5,0x1b
    80008b34:	02f57e63          	bgeu	a0,a5,80008b70 <kfree+0x70>
    80008b38:	00001637          	lui	a2,0x1
    80008b3c:	00100593          	li	a1,1
    80008b40:	00000097          	auipc	ra,0x0
    80008b44:	478080e7          	jalr	1144(ra) # 80008fb8 <__memset>
    80008b48:	00004797          	auipc	a5,0x4
    80008b4c:	13878793          	addi	a5,a5,312 # 8000cc80 <kmem>
    80008b50:	0007b703          	ld	a4,0(a5)
    80008b54:	01813083          	ld	ra,24(sp)
    80008b58:	01013403          	ld	s0,16(sp)
    80008b5c:	00e4b023          	sd	a4,0(s1)
    80008b60:	0097b023          	sd	s1,0(a5)
    80008b64:	00813483          	ld	s1,8(sp)
    80008b68:	02010113          	addi	sp,sp,32
    80008b6c:	00008067          	ret
    80008b70:	00002517          	auipc	a0,0x2
    80008b74:	c7850513          	addi	a0,a0,-904 # 8000a7e8 <digits+0x18>
    80008b78:	fffff097          	auipc	ra,0xfffff
    80008b7c:	354080e7          	jalr	852(ra) # 80007ecc <panic>

0000000080008b80 <kalloc>:
    80008b80:	fe010113          	addi	sp,sp,-32
    80008b84:	00813823          	sd	s0,16(sp)
    80008b88:	00913423          	sd	s1,8(sp)
    80008b8c:	00113c23          	sd	ra,24(sp)
    80008b90:	02010413          	addi	s0,sp,32
    80008b94:	00004797          	auipc	a5,0x4
    80008b98:	0ec78793          	addi	a5,a5,236 # 8000cc80 <kmem>
    80008b9c:	0007b483          	ld	s1,0(a5)
    80008ba0:	02048063          	beqz	s1,80008bc0 <kalloc+0x40>
    80008ba4:	0004b703          	ld	a4,0(s1)
    80008ba8:	00001637          	lui	a2,0x1
    80008bac:	00500593          	li	a1,5
    80008bb0:	00048513          	mv	a0,s1
    80008bb4:	00e7b023          	sd	a4,0(a5)
    80008bb8:	00000097          	auipc	ra,0x0
    80008bbc:	400080e7          	jalr	1024(ra) # 80008fb8 <__memset>
    80008bc0:	01813083          	ld	ra,24(sp)
    80008bc4:	01013403          	ld	s0,16(sp)
    80008bc8:	00048513          	mv	a0,s1
    80008bcc:	00813483          	ld	s1,8(sp)
    80008bd0:	02010113          	addi	sp,sp,32
    80008bd4:	00008067          	ret

0000000080008bd8 <initlock>:
    80008bd8:	ff010113          	addi	sp,sp,-16
    80008bdc:	00813423          	sd	s0,8(sp)
    80008be0:	01010413          	addi	s0,sp,16
    80008be4:	00813403          	ld	s0,8(sp)
    80008be8:	00b53423          	sd	a1,8(a0)
    80008bec:	00052023          	sw	zero,0(a0)
    80008bf0:	00053823          	sd	zero,16(a0)
    80008bf4:	01010113          	addi	sp,sp,16
    80008bf8:	00008067          	ret

0000000080008bfc <acquire>:
    80008bfc:	fe010113          	addi	sp,sp,-32
    80008c00:	00813823          	sd	s0,16(sp)
    80008c04:	00913423          	sd	s1,8(sp)
    80008c08:	00113c23          	sd	ra,24(sp)
    80008c0c:	01213023          	sd	s2,0(sp)
    80008c10:	02010413          	addi	s0,sp,32
    80008c14:	00050493          	mv	s1,a0
    80008c18:	10002973          	csrr	s2,sstatus
    80008c1c:	100027f3          	csrr	a5,sstatus
    80008c20:	ffd7f793          	andi	a5,a5,-3
    80008c24:	10079073          	csrw	sstatus,a5
    80008c28:	fffff097          	auipc	ra,0xfffff
    80008c2c:	8e4080e7          	jalr	-1820(ra) # 8000750c <mycpu>
    80008c30:	07852783          	lw	a5,120(a0)
    80008c34:	06078e63          	beqz	a5,80008cb0 <acquire+0xb4>
    80008c38:	fffff097          	auipc	ra,0xfffff
    80008c3c:	8d4080e7          	jalr	-1836(ra) # 8000750c <mycpu>
    80008c40:	07852783          	lw	a5,120(a0)
    80008c44:	0004a703          	lw	a4,0(s1)
    80008c48:	0017879b          	addiw	a5,a5,1
    80008c4c:	06f52c23          	sw	a5,120(a0)
    80008c50:	04071063          	bnez	a4,80008c90 <acquire+0x94>
    80008c54:	00100713          	li	a4,1
    80008c58:	00070793          	mv	a5,a4
    80008c5c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008c60:	0007879b          	sext.w	a5,a5
    80008c64:	fe079ae3          	bnez	a5,80008c58 <acquire+0x5c>
    80008c68:	0ff0000f          	fence
    80008c6c:	fffff097          	auipc	ra,0xfffff
    80008c70:	8a0080e7          	jalr	-1888(ra) # 8000750c <mycpu>
    80008c74:	01813083          	ld	ra,24(sp)
    80008c78:	01013403          	ld	s0,16(sp)
    80008c7c:	00a4b823          	sd	a0,16(s1)
    80008c80:	00013903          	ld	s2,0(sp)
    80008c84:	00813483          	ld	s1,8(sp)
    80008c88:	02010113          	addi	sp,sp,32
    80008c8c:	00008067          	ret
    80008c90:	0104b903          	ld	s2,16(s1)
    80008c94:	fffff097          	auipc	ra,0xfffff
    80008c98:	878080e7          	jalr	-1928(ra) # 8000750c <mycpu>
    80008c9c:	faa91ce3          	bne	s2,a0,80008c54 <acquire+0x58>
    80008ca0:	00002517          	auipc	a0,0x2
    80008ca4:	b5050513          	addi	a0,a0,-1200 # 8000a7f0 <digits+0x20>
    80008ca8:	fffff097          	auipc	ra,0xfffff
    80008cac:	224080e7          	jalr	548(ra) # 80007ecc <panic>
    80008cb0:	00195913          	srli	s2,s2,0x1
    80008cb4:	fffff097          	auipc	ra,0xfffff
    80008cb8:	858080e7          	jalr	-1960(ra) # 8000750c <mycpu>
    80008cbc:	00197913          	andi	s2,s2,1
    80008cc0:	07252e23          	sw	s2,124(a0)
    80008cc4:	f75ff06f          	j	80008c38 <acquire+0x3c>

0000000080008cc8 <release>:
    80008cc8:	fe010113          	addi	sp,sp,-32
    80008ccc:	00813823          	sd	s0,16(sp)
    80008cd0:	00113c23          	sd	ra,24(sp)
    80008cd4:	00913423          	sd	s1,8(sp)
    80008cd8:	01213023          	sd	s2,0(sp)
    80008cdc:	02010413          	addi	s0,sp,32
    80008ce0:	00052783          	lw	a5,0(a0)
    80008ce4:	00079a63          	bnez	a5,80008cf8 <release+0x30>
    80008ce8:	00002517          	auipc	a0,0x2
    80008cec:	b1050513          	addi	a0,a0,-1264 # 8000a7f8 <digits+0x28>
    80008cf0:	fffff097          	auipc	ra,0xfffff
    80008cf4:	1dc080e7          	jalr	476(ra) # 80007ecc <panic>
    80008cf8:	01053903          	ld	s2,16(a0)
    80008cfc:	00050493          	mv	s1,a0
    80008d00:	fffff097          	auipc	ra,0xfffff
    80008d04:	80c080e7          	jalr	-2036(ra) # 8000750c <mycpu>
    80008d08:	fea910e3          	bne	s2,a0,80008ce8 <release+0x20>
    80008d0c:	0004b823          	sd	zero,16(s1)
    80008d10:	0ff0000f          	fence
    80008d14:	0f50000f          	fence	iorw,ow
    80008d18:	0804a02f          	amoswap.w	zero,zero,(s1)
    80008d1c:	ffffe097          	auipc	ra,0xffffe
    80008d20:	7f0080e7          	jalr	2032(ra) # 8000750c <mycpu>
    80008d24:	100027f3          	csrr	a5,sstatus
    80008d28:	0027f793          	andi	a5,a5,2
    80008d2c:	04079a63          	bnez	a5,80008d80 <release+0xb8>
    80008d30:	07852783          	lw	a5,120(a0)
    80008d34:	02f05e63          	blez	a5,80008d70 <release+0xa8>
    80008d38:	fff7871b          	addiw	a4,a5,-1
    80008d3c:	06e52c23          	sw	a4,120(a0)
    80008d40:	00071c63          	bnez	a4,80008d58 <release+0x90>
    80008d44:	07c52783          	lw	a5,124(a0)
    80008d48:	00078863          	beqz	a5,80008d58 <release+0x90>
    80008d4c:	100027f3          	csrr	a5,sstatus
    80008d50:	0027e793          	ori	a5,a5,2
    80008d54:	10079073          	csrw	sstatus,a5
    80008d58:	01813083          	ld	ra,24(sp)
    80008d5c:	01013403          	ld	s0,16(sp)
    80008d60:	00813483          	ld	s1,8(sp)
    80008d64:	00013903          	ld	s2,0(sp)
    80008d68:	02010113          	addi	sp,sp,32
    80008d6c:	00008067          	ret
    80008d70:	00002517          	auipc	a0,0x2
    80008d74:	aa850513          	addi	a0,a0,-1368 # 8000a818 <digits+0x48>
    80008d78:	fffff097          	auipc	ra,0xfffff
    80008d7c:	154080e7          	jalr	340(ra) # 80007ecc <panic>
    80008d80:	00002517          	auipc	a0,0x2
    80008d84:	a8050513          	addi	a0,a0,-1408 # 8000a800 <digits+0x30>
    80008d88:	fffff097          	auipc	ra,0xfffff
    80008d8c:	144080e7          	jalr	324(ra) # 80007ecc <panic>

0000000080008d90 <holding>:
    80008d90:	00052783          	lw	a5,0(a0)
    80008d94:	00079663          	bnez	a5,80008da0 <holding+0x10>
    80008d98:	00000513          	li	a0,0
    80008d9c:	00008067          	ret
    80008da0:	fe010113          	addi	sp,sp,-32
    80008da4:	00813823          	sd	s0,16(sp)
    80008da8:	00913423          	sd	s1,8(sp)
    80008dac:	00113c23          	sd	ra,24(sp)
    80008db0:	02010413          	addi	s0,sp,32
    80008db4:	01053483          	ld	s1,16(a0)
    80008db8:	ffffe097          	auipc	ra,0xffffe
    80008dbc:	754080e7          	jalr	1876(ra) # 8000750c <mycpu>
    80008dc0:	01813083          	ld	ra,24(sp)
    80008dc4:	01013403          	ld	s0,16(sp)
    80008dc8:	40a48533          	sub	a0,s1,a0
    80008dcc:	00153513          	seqz	a0,a0
    80008dd0:	00813483          	ld	s1,8(sp)
    80008dd4:	02010113          	addi	sp,sp,32
    80008dd8:	00008067          	ret

0000000080008ddc <push_off>:
    80008ddc:	fe010113          	addi	sp,sp,-32
    80008de0:	00813823          	sd	s0,16(sp)
    80008de4:	00113c23          	sd	ra,24(sp)
    80008de8:	00913423          	sd	s1,8(sp)
    80008dec:	02010413          	addi	s0,sp,32
    80008df0:	100024f3          	csrr	s1,sstatus
    80008df4:	100027f3          	csrr	a5,sstatus
    80008df8:	ffd7f793          	andi	a5,a5,-3
    80008dfc:	10079073          	csrw	sstatus,a5
    80008e00:	ffffe097          	auipc	ra,0xffffe
    80008e04:	70c080e7          	jalr	1804(ra) # 8000750c <mycpu>
    80008e08:	07852783          	lw	a5,120(a0)
    80008e0c:	02078663          	beqz	a5,80008e38 <push_off+0x5c>
    80008e10:	ffffe097          	auipc	ra,0xffffe
    80008e14:	6fc080e7          	jalr	1788(ra) # 8000750c <mycpu>
    80008e18:	07852783          	lw	a5,120(a0)
    80008e1c:	01813083          	ld	ra,24(sp)
    80008e20:	01013403          	ld	s0,16(sp)
    80008e24:	0017879b          	addiw	a5,a5,1
    80008e28:	06f52c23          	sw	a5,120(a0)
    80008e2c:	00813483          	ld	s1,8(sp)
    80008e30:	02010113          	addi	sp,sp,32
    80008e34:	00008067          	ret
    80008e38:	0014d493          	srli	s1,s1,0x1
    80008e3c:	ffffe097          	auipc	ra,0xffffe
    80008e40:	6d0080e7          	jalr	1744(ra) # 8000750c <mycpu>
    80008e44:	0014f493          	andi	s1,s1,1
    80008e48:	06952e23          	sw	s1,124(a0)
    80008e4c:	fc5ff06f          	j	80008e10 <push_off+0x34>

0000000080008e50 <pop_off>:
    80008e50:	ff010113          	addi	sp,sp,-16
    80008e54:	00813023          	sd	s0,0(sp)
    80008e58:	00113423          	sd	ra,8(sp)
    80008e5c:	01010413          	addi	s0,sp,16
    80008e60:	ffffe097          	auipc	ra,0xffffe
    80008e64:	6ac080e7          	jalr	1708(ra) # 8000750c <mycpu>
    80008e68:	100027f3          	csrr	a5,sstatus
    80008e6c:	0027f793          	andi	a5,a5,2
    80008e70:	04079663          	bnez	a5,80008ebc <pop_off+0x6c>
    80008e74:	07852783          	lw	a5,120(a0)
    80008e78:	02f05a63          	blez	a5,80008eac <pop_off+0x5c>
    80008e7c:	fff7871b          	addiw	a4,a5,-1
    80008e80:	06e52c23          	sw	a4,120(a0)
    80008e84:	00071c63          	bnez	a4,80008e9c <pop_off+0x4c>
    80008e88:	07c52783          	lw	a5,124(a0)
    80008e8c:	00078863          	beqz	a5,80008e9c <pop_off+0x4c>
    80008e90:	100027f3          	csrr	a5,sstatus
    80008e94:	0027e793          	ori	a5,a5,2
    80008e98:	10079073          	csrw	sstatus,a5
    80008e9c:	00813083          	ld	ra,8(sp)
    80008ea0:	00013403          	ld	s0,0(sp)
    80008ea4:	01010113          	addi	sp,sp,16
    80008ea8:	00008067          	ret
    80008eac:	00002517          	auipc	a0,0x2
    80008eb0:	96c50513          	addi	a0,a0,-1684 # 8000a818 <digits+0x48>
    80008eb4:	fffff097          	auipc	ra,0xfffff
    80008eb8:	018080e7          	jalr	24(ra) # 80007ecc <panic>
    80008ebc:	00002517          	auipc	a0,0x2
    80008ec0:	94450513          	addi	a0,a0,-1724 # 8000a800 <digits+0x30>
    80008ec4:	fffff097          	auipc	ra,0xfffff
    80008ec8:	008080e7          	jalr	8(ra) # 80007ecc <panic>

0000000080008ecc <push_on>:
    80008ecc:	fe010113          	addi	sp,sp,-32
    80008ed0:	00813823          	sd	s0,16(sp)
    80008ed4:	00113c23          	sd	ra,24(sp)
    80008ed8:	00913423          	sd	s1,8(sp)
    80008edc:	02010413          	addi	s0,sp,32
    80008ee0:	100024f3          	csrr	s1,sstatus
    80008ee4:	100027f3          	csrr	a5,sstatus
    80008ee8:	0027e793          	ori	a5,a5,2
    80008eec:	10079073          	csrw	sstatus,a5
    80008ef0:	ffffe097          	auipc	ra,0xffffe
    80008ef4:	61c080e7          	jalr	1564(ra) # 8000750c <mycpu>
    80008ef8:	07852783          	lw	a5,120(a0)
    80008efc:	02078663          	beqz	a5,80008f28 <push_on+0x5c>
    80008f00:	ffffe097          	auipc	ra,0xffffe
    80008f04:	60c080e7          	jalr	1548(ra) # 8000750c <mycpu>
    80008f08:	07852783          	lw	a5,120(a0)
    80008f0c:	01813083          	ld	ra,24(sp)
    80008f10:	01013403          	ld	s0,16(sp)
    80008f14:	0017879b          	addiw	a5,a5,1
    80008f18:	06f52c23          	sw	a5,120(a0)
    80008f1c:	00813483          	ld	s1,8(sp)
    80008f20:	02010113          	addi	sp,sp,32
    80008f24:	00008067          	ret
    80008f28:	0014d493          	srli	s1,s1,0x1
    80008f2c:	ffffe097          	auipc	ra,0xffffe
    80008f30:	5e0080e7          	jalr	1504(ra) # 8000750c <mycpu>
    80008f34:	0014f493          	andi	s1,s1,1
    80008f38:	06952e23          	sw	s1,124(a0)
    80008f3c:	fc5ff06f          	j	80008f00 <push_on+0x34>

0000000080008f40 <pop_on>:
    80008f40:	ff010113          	addi	sp,sp,-16
    80008f44:	00813023          	sd	s0,0(sp)
    80008f48:	00113423          	sd	ra,8(sp)
    80008f4c:	01010413          	addi	s0,sp,16
    80008f50:	ffffe097          	auipc	ra,0xffffe
    80008f54:	5bc080e7          	jalr	1468(ra) # 8000750c <mycpu>
    80008f58:	100027f3          	csrr	a5,sstatus
    80008f5c:	0027f793          	andi	a5,a5,2
    80008f60:	04078463          	beqz	a5,80008fa8 <pop_on+0x68>
    80008f64:	07852783          	lw	a5,120(a0)
    80008f68:	02f05863          	blez	a5,80008f98 <pop_on+0x58>
    80008f6c:	fff7879b          	addiw	a5,a5,-1
    80008f70:	06f52c23          	sw	a5,120(a0)
    80008f74:	07853783          	ld	a5,120(a0)
    80008f78:	00079863          	bnez	a5,80008f88 <pop_on+0x48>
    80008f7c:	100027f3          	csrr	a5,sstatus
    80008f80:	ffd7f793          	andi	a5,a5,-3
    80008f84:	10079073          	csrw	sstatus,a5
    80008f88:	00813083          	ld	ra,8(sp)
    80008f8c:	00013403          	ld	s0,0(sp)
    80008f90:	01010113          	addi	sp,sp,16
    80008f94:	00008067          	ret
    80008f98:	00002517          	auipc	a0,0x2
    80008f9c:	8a850513          	addi	a0,a0,-1880 # 8000a840 <digits+0x70>
    80008fa0:	fffff097          	auipc	ra,0xfffff
    80008fa4:	f2c080e7          	jalr	-212(ra) # 80007ecc <panic>
    80008fa8:	00002517          	auipc	a0,0x2
    80008fac:	87850513          	addi	a0,a0,-1928 # 8000a820 <digits+0x50>
    80008fb0:	fffff097          	auipc	ra,0xfffff
    80008fb4:	f1c080e7          	jalr	-228(ra) # 80007ecc <panic>

0000000080008fb8 <__memset>:
    80008fb8:	ff010113          	addi	sp,sp,-16
    80008fbc:	00813423          	sd	s0,8(sp)
    80008fc0:	01010413          	addi	s0,sp,16
    80008fc4:	1a060e63          	beqz	a2,80009180 <__memset+0x1c8>
    80008fc8:	40a007b3          	neg	a5,a0
    80008fcc:	0077f793          	andi	a5,a5,7
    80008fd0:	00778693          	addi	a3,a5,7
    80008fd4:	00b00813          	li	a6,11
    80008fd8:	0ff5f593          	andi	a1,a1,255
    80008fdc:	fff6071b          	addiw	a4,a2,-1
    80008fe0:	1b06e663          	bltu	a3,a6,8000918c <__memset+0x1d4>
    80008fe4:	1cd76463          	bltu	a4,a3,800091ac <__memset+0x1f4>
    80008fe8:	1a078e63          	beqz	a5,800091a4 <__memset+0x1ec>
    80008fec:	00b50023          	sb	a1,0(a0)
    80008ff0:	00100713          	li	a4,1
    80008ff4:	1ae78463          	beq	a5,a4,8000919c <__memset+0x1e4>
    80008ff8:	00b500a3          	sb	a1,1(a0)
    80008ffc:	00200713          	li	a4,2
    80009000:	1ae78a63          	beq	a5,a4,800091b4 <__memset+0x1fc>
    80009004:	00b50123          	sb	a1,2(a0)
    80009008:	00300713          	li	a4,3
    8000900c:	18e78463          	beq	a5,a4,80009194 <__memset+0x1dc>
    80009010:	00b501a3          	sb	a1,3(a0)
    80009014:	00400713          	li	a4,4
    80009018:	1ae78263          	beq	a5,a4,800091bc <__memset+0x204>
    8000901c:	00b50223          	sb	a1,4(a0)
    80009020:	00500713          	li	a4,5
    80009024:	1ae78063          	beq	a5,a4,800091c4 <__memset+0x20c>
    80009028:	00b502a3          	sb	a1,5(a0)
    8000902c:	00700713          	li	a4,7
    80009030:	18e79e63          	bne	a5,a4,800091cc <__memset+0x214>
    80009034:	00b50323          	sb	a1,6(a0)
    80009038:	00700e93          	li	t4,7
    8000903c:	00859713          	slli	a4,a1,0x8
    80009040:	00e5e733          	or	a4,a1,a4
    80009044:	01059e13          	slli	t3,a1,0x10
    80009048:	01c76e33          	or	t3,a4,t3
    8000904c:	01859313          	slli	t1,a1,0x18
    80009050:	006e6333          	or	t1,t3,t1
    80009054:	02059893          	slli	a7,a1,0x20
    80009058:	40f60e3b          	subw	t3,a2,a5
    8000905c:	011368b3          	or	a7,t1,a7
    80009060:	02859813          	slli	a6,a1,0x28
    80009064:	0108e833          	or	a6,a7,a6
    80009068:	03059693          	slli	a3,a1,0x30
    8000906c:	003e589b          	srliw	a7,t3,0x3
    80009070:	00d866b3          	or	a3,a6,a3
    80009074:	03859713          	slli	a4,a1,0x38
    80009078:	00389813          	slli	a6,a7,0x3
    8000907c:	00f507b3          	add	a5,a0,a5
    80009080:	00e6e733          	or	a4,a3,a4
    80009084:	000e089b          	sext.w	a7,t3
    80009088:	00f806b3          	add	a3,a6,a5
    8000908c:	00e7b023          	sd	a4,0(a5)
    80009090:	00878793          	addi	a5,a5,8
    80009094:	fed79ce3          	bne	a5,a3,8000908c <__memset+0xd4>
    80009098:	ff8e7793          	andi	a5,t3,-8
    8000909c:	0007871b          	sext.w	a4,a5
    800090a0:	01d787bb          	addw	a5,a5,t4
    800090a4:	0ce88e63          	beq	a7,a4,80009180 <__memset+0x1c8>
    800090a8:	00f50733          	add	a4,a0,a5
    800090ac:	00b70023          	sb	a1,0(a4)
    800090b0:	0017871b          	addiw	a4,a5,1
    800090b4:	0cc77663          	bgeu	a4,a2,80009180 <__memset+0x1c8>
    800090b8:	00e50733          	add	a4,a0,a4
    800090bc:	00b70023          	sb	a1,0(a4)
    800090c0:	0027871b          	addiw	a4,a5,2
    800090c4:	0ac77e63          	bgeu	a4,a2,80009180 <__memset+0x1c8>
    800090c8:	00e50733          	add	a4,a0,a4
    800090cc:	00b70023          	sb	a1,0(a4)
    800090d0:	0037871b          	addiw	a4,a5,3
    800090d4:	0ac77663          	bgeu	a4,a2,80009180 <__memset+0x1c8>
    800090d8:	00e50733          	add	a4,a0,a4
    800090dc:	00b70023          	sb	a1,0(a4)
    800090e0:	0047871b          	addiw	a4,a5,4
    800090e4:	08c77e63          	bgeu	a4,a2,80009180 <__memset+0x1c8>
    800090e8:	00e50733          	add	a4,a0,a4
    800090ec:	00b70023          	sb	a1,0(a4)
    800090f0:	0057871b          	addiw	a4,a5,5
    800090f4:	08c77663          	bgeu	a4,a2,80009180 <__memset+0x1c8>
    800090f8:	00e50733          	add	a4,a0,a4
    800090fc:	00b70023          	sb	a1,0(a4)
    80009100:	0067871b          	addiw	a4,a5,6
    80009104:	06c77e63          	bgeu	a4,a2,80009180 <__memset+0x1c8>
    80009108:	00e50733          	add	a4,a0,a4
    8000910c:	00b70023          	sb	a1,0(a4)
    80009110:	0077871b          	addiw	a4,a5,7
    80009114:	06c77663          	bgeu	a4,a2,80009180 <__memset+0x1c8>
    80009118:	00e50733          	add	a4,a0,a4
    8000911c:	00b70023          	sb	a1,0(a4)
    80009120:	0087871b          	addiw	a4,a5,8
    80009124:	04c77e63          	bgeu	a4,a2,80009180 <__memset+0x1c8>
    80009128:	00e50733          	add	a4,a0,a4
    8000912c:	00b70023          	sb	a1,0(a4)
    80009130:	0097871b          	addiw	a4,a5,9
    80009134:	04c77663          	bgeu	a4,a2,80009180 <__memset+0x1c8>
    80009138:	00e50733          	add	a4,a0,a4
    8000913c:	00b70023          	sb	a1,0(a4)
    80009140:	00a7871b          	addiw	a4,a5,10
    80009144:	02c77e63          	bgeu	a4,a2,80009180 <__memset+0x1c8>
    80009148:	00e50733          	add	a4,a0,a4
    8000914c:	00b70023          	sb	a1,0(a4)
    80009150:	00b7871b          	addiw	a4,a5,11
    80009154:	02c77663          	bgeu	a4,a2,80009180 <__memset+0x1c8>
    80009158:	00e50733          	add	a4,a0,a4
    8000915c:	00b70023          	sb	a1,0(a4)
    80009160:	00c7871b          	addiw	a4,a5,12
    80009164:	00c77e63          	bgeu	a4,a2,80009180 <__memset+0x1c8>
    80009168:	00e50733          	add	a4,a0,a4
    8000916c:	00b70023          	sb	a1,0(a4)
    80009170:	00d7879b          	addiw	a5,a5,13
    80009174:	00c7f663          	bgeu	a5,a2,80009180 <__memset+0x1c8>
    80009178:	00f507b3          	add	a5,a0,a5
    8000917c:	00b78023          	sb	a1,0(a5)
    80009180:	00813403          	ld	s0,8(sp)
    80009184:	01010113          	addi	sp,sp,16
    80009188:	00008067          	ret
    8000918c:	00b00693          	li	a3,11
    80009190:	e55ff06f          	j	80008fe4 <__memset+0x2c>
    80009194:	00300e93          	li	t4,3
    80009198:	ea5ff06f          	j	8000903c <__memset+0x84>
    8000919c:	00100e93          	li	t4,1
    800091a0:	e9dff06f          	j	8000903c <__memset+0x84>
    800091a4:	00000e93          	li	t4,0
    800091a8:	e95ff06f          	j	8000903c <__memset+0x84>
    800091ac:	00000793          	li	a5,0
    800091b0:	ef9ff06f          	j	800090a8 <__memset+0xf0>
    800091b4:	00200e93          	li	t4,2
    800091b8:	e85ff06f          	j	8000903c <__memset+0x84>
    800091bc:	00400e93          	li	t4,4
    800091c0:	e7dff06f          	j	8000903c <__memset+0x84>
    800091c4:	00500e93          	li	t4,5
    800091c8:	e75ff06f          	j	8000903c <__memset+0x84>
    800091cc:	00600e93          	li	t4,6
    800091d0:	e6dff06f          	j	8000903c <__memset+0x84>

00000000800091d4 <__memmove>:
    800091d4:	ff010113          	addi	sp,sp,-16
    800091d8:	00813423          	sd	s0,8(sp)
    800091dc:	01010413          	addi	s0,sp,16
    800091e0:	0e060863          	beqz	a2,800092d0 <__memmove+0xfc>
    800091e4:	fff6069b          	addiw	a3,a2,-1
    800091e8:	0006881b          	sext.w	a6,a3
    800091ec:	0ea5e863          	bltu	a1,a0,800092dc <__memmove+0x108>
    800091f0:	00758713          	addi	a4,a1,7
    800091f4:	00a5e7b3          	or	a5,a1,a0
    800091f8:	40a70733          	sub	a4,a4,a0
    800091fc:	0077f793          	andi	a5,a5,7
    80009200:	00f73713          	sltiu	a4,a4,15
    80009204:	00174713          	xori	a4,a4,1
    80009208:	0017b793          	seqz	a5,a5
    8000920c:	00e7f7b3          	and	a5,a5,a4
    80009210:	10078863          	beqz	a5,80009320 <__memmove+0x14c>
    80009214:	00900793          	li	a5,9
    80009218:	1107f463          	bgeu	a5,a6,80009320 <__memmove+0x14c>
    8000921c:	0036581b          	srliw	a6,a2,0x3
    80009220:	fff8081b          	addiw	a6,a6,-1
    80009224:	02081813          	slli	a6,a6,0x20
    80009228:	01d85893          	srli	a7,a6,0x1d
    8000922c:	00858813          	addi	a6,a1,8
    80009230:	00058793          	mv	a5,a1
    80009234:	00050713          	mv	a4,a0
    80009238:	01088833          	add	a6,a7,a6
    8000923c:	0007b883          	ld	a7,0(a5)
    80009240:	00878793          	addi	a5,a5,8
    80009244:	00870713          	addi	a4,a4,8
    80009248:	ff173c23          	sd	a7,-8(a4)
    8000924c:	ff0798e3          	bne	a5,a6,8000923c <__memmove+0x68>
    80009250:	ff867713          	andi	a4,a2,-8
    80009254:	02071793          	slli	a5,a4,0x20
    80009258:	0207d793          	srli	a5,a5,0x20
    8000925c:	00f585b3          	add	a1,a1,a5
    80009260:	40e686bb          	subw	a3,a3,a4
    80009264:	00f507b3          	add	a5,a0,a5
    80009268:	06e60463          	beq	a2,a4,800092d0 <__memmove+0xfc>
    8000926c:	0005c703          	lbu	a4,0(a1)
    80009270:	00e78023          	sb	a4,0(a5)
    80009274:	04068e63          	beqz	a3,800092d0 <__memmove+0xfc>
    80009278:	0015c603          	lbu	a2,1(a1)
    8000927c:	00100713          	li	a4,1
    80009280:	00c780a3          	sb	a2,1(a5)
    80009284:	04e68663          	beq	a3,a4,800092d0 <__memmove+0xfc>
    80009288:	0025c603          	lbu	a2,2(a1)
    8000928c:	00200713          	li	a4,2
    80009290:	00c78123          	sb	a2,2(a5)
    80009294:	02e68e63          	beq	a3,a4,800092d0 <__memmove+0xfc>
    80009298:	0035c603          	lbu	a2,3(a1)
    8000929c:	00300713          	li	a4,3
    800092a0:	00c781a3          	sb	a2,3(a5)
    800092a4:	02e68663          	beq	a3,a4,800092d0 <__memmove+0xfc>
    800092a8:	0045c603          	lbu	a2,4(a1)
    800092ac:	00400713          	li	a4,4
    800092b0:	00c78223          	sb	a2,4(a5)
    800092b4:	00e68e63          	beq	a3,a4,800092d0 <__memmove+0xfc>
    800092b8:	0055c603          	lbu	a2,5(a1)
    800092bc:	00500713          	li	a4,5
    800092c0:	00c782a3          	sb	a2,5(a5)
    800092c4:	00e68663          	beq	a3,a4,800092d0 <__memmove+0xfc>
    800092c8:	0065c703          	lbu	a4,6(a1)
    800092cc:	00e78323          	sb	a4,6(a5)
    800092d0:	00813403          	ld	s0,8(sp)
    800092d4:	01010113          	addi	sp,sp,16
    800092d8:	00008067          	ret
    800092dc:	02061713          	slli	a4,a2,0x20
    800092e0:	02075713          	srli	a4,a4,0x20
    800092e4:	00e587b3          	add	a5,a1,a4
    800092e8:	f0f574e3          	bgeu	a0,a5,800091f0 <__memmove+0x1c>
    800092ec:	02069613          	slli	a2,a3,0x20
    800092f0:	02065613          	srli	a2,a2,0x20
    800092f4:	fff64613          	not	a2,a2
    800092f8:	00e50733          	add	a4,a0,a4
    800092fc:	00c78633          	add	a2,a5,a2
    80009300:	fff7c683          	lbu	a3,-1(a5)
    80009304:	fff78793          	addi	a5,a5,-1
    80009308:	fff70713          	addi	a4,a4,-1
    8000930c:	00d70023          	sb	a3,0(a4)
    80009310:	fec798e3          	bne	a5,a2,80009300 <__memmove+0x12c>
    80009314:	00813403          	ld	s0,8(sp)
    80009318:	01010113          	addi	sp,sp,16
    8000931c:	00008067          	ret
    80009320:	02069713          	slli	a4,a3,0x20
    80009324:	02075713          	srli	a4,a4,0x20
    80009328:	00170713          	addi	a4,a4,1
    8000932c:	00e50733          	add	a4,a0,a4
    80009330:	00050793          	mv	a5,a0
    80009334:	0005c683          	lbu	a3,0(a1)
    80009338:	00178793          	addi	a5,a5,1
    8000933c:	00158593          	addi	a1,a1,1
    80009340:	fed78fa3          	sb	a3,-1(a5)
    80009344:	fee798e3          	bne	a5,a4,80009334 <__memmove+0x160>
    80009348:	f89ff06f          	j	800092d0 <__memmove+0xfc>
	...
