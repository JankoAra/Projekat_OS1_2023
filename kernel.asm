
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	af813103          	ld	sp,-1288(sp) # 8000caf8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	0f4070ef          	jal	ra,80007110 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5Riscv13pushRegistersEv>:
.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function
_ZN5Riscv13pushRegistersEv:
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001004:	00313c23          	sd	gp,24(sp)
    80001008:	02413023          	sd	tp,32(sp)
    8000100c:	02513423          	sd	t0,40(sp)
    80001010:	02613823          	sd	t1,48(sp)
    80001014:	02713c23          	sd	t2,56(sp)
    80001018:	04813023          	sd	s0,64(sp)
    8000101c:	04913423          	sd	s1,72(sp)
    80001020:	04a13823          	sd	a0,80(sp)
    80001024:	04b13c23          	sd	a1,88(sp)
    80001028:	06c13023          	sd	a2,96(sp)
    8000102c:	06d13423          	sd	a3,104(sp)
    80001030:	06e13823          	sd	a4,112(sp)
    80001034:	06f13c23          	sd	a5,120(sp)
    80001038:	09013023          	sd	a6,128(sp)
    8000103c:	09113423          	sd	a7,136(sp)
    80001040:	09213823          	sd	s2,144(sp)
    80001044:	09313c23          	sd	s3,152(sp)
    80001048:	0b413023          	sd	s4,160(sp)
    8000104c:	0b513423          	sd	s5,168(sp)
    80001050:	0b613823          	sd	s6,176(sp)
    80001054:	0b713c23          	sd	s7,184(sp)
    80001058:	0d813023          	sd	s8,192(sp)
    8000105c:	0d913423          	sd	s9,200(sp)
    80001060:	0da13823          	sd	s10,208(sp)
    80001064:	0db13c23          	sd	s11,216(sp)
    80001068:	0fc13023          	sd	t3,224(sp)
    8000106c:	0fd13423          	sd	t4,232(sp)
    80001070:	0fe13823          	sd	t5,240(sp)
    80001074:	0ff13c23          	sd	t6,248(sp)
    ret
    80001078:	00008067          	ret

000000008000107c <_ZN5Riscv12popRegistersEv>:
.global _ZN5Riscv12popRegistersEv
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    8000107c:	01813183          	ld	gp,24(sp)
    80001080:	02013203          	ld	tp,32(sp)
    80001084:	02813283          	ld	t0,40(sp)
    80001088:	03013303          	ld	t1,48(sp)
    8000108c:	03813383          	ld	t2,56(sp)
    80001090:	04013403          	ld	s0,64(sp)
    80001094:	04813483          	ld	s1,72(sp)
    80001098:	05013503          	ld	a0,80(sp)
    8000109c:	05813583          	ld	a1,88(sp)
    800010a0:	06013603          	ld	a2,96(sp)
    800010a4:	06813683          	ld	a3,104(sp)
    800010a8:	07013703          	ld	a4,112(sp)
    800010ac:	07813783          	ld	a5,120(sp)
    800010b0:	08013803          	ld	a6,128(sp)
    800010b4:	08813883          	ld	a7,136(sp)
    800010b8:	09013903          	ld	s2,144(sp)
    800010bc:	09813983          	ld	s3,152(sp)
    800010c0:	0a013a03          	ld	s4,160(sp)
    800010c4:	0a813a83          	ld	s5,168(sp)
    800010c8:	0b013b03          	ld	s6,176(sp)
    800010cc:	0b813b83          	ld	s7,184(sp)
    800010d0:	0c013c03          	ld	s8,192(sp)
    800010d4:	0c813c83          	ld	s9,200(sp)
    800010d8:	0d013d03          	ld	s10,208(sp)
    800010dc:	0d813d83          	ld	s11,216(sp)
    800010e0:	0e013e03          	ld	t3,224(sp)
    800010e4:	0e813e83          	ld	t4,232(sp)
    800010e8:	0f013f03          	ld	t5,240(sp)
    800010ec:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    800010f0:	10010113          	addi	sp,sp,256
    800010f4:	00008067          	ret
	...

0000000080001100 <interruptHandler>:
.extern interruptRoutine  #deklaracija imena interruptRoutine definisanog negde drugde
.align 4    #poravnanje adrese na 4 bajta, poslednja dva bita adrese su 00
.global interruptHandler #izvozi globalno ime interruptHandler
interruptHandler:
    #cuvanje svih registara na steku running niti
    addi sp, sp, -256
    80001100:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001104:	00013023          	sd	zero,0(sp)
    80001108:	00113423          	sd	ra,8(sp)
    8000110c:	00213823          	sd	sp,16(sp)
    80001110:	00313c23          	sd	gp,24(sp)
    80001114:	02413023          	sd	tp,32(sp)
    80001118:	02513423          	sd	t0,40(sp)
    8000111c:	02613823          	sd	t1,48(sp)
    80001120:	02713c23          	sd	t2,56(sp)
    80001124:	04813023          	sd	s0,64(sp)
    80001128:	04913423          	sd	s1,72(sp)
    8000112c:	04a13823          	sd	a0,80(sp)
    80001130:	04b13c23          	sd	a1,88(sp)
    80001134:	06c13023          	sd	a2,96(sp)
    80001138:	06d13423          	sd	a3,104(sp)
    8000113c:	06e13823          	sd	a4,112(sp)
    80001140:	06f13c23          	sd	a5,120(sp)
    80001144:	09013023          	sd	a6,128(sp)
    80001148:	09113423          	sd	a7,136(sp)
    8000114c:	09213823          	sd	s2,144(sp)
    80001150:	09313c23          	sd	s3,152(sp)
    80001154:	0b413023          	sd	s4,160(sp)
    80001158:	0b513423          	sd	s5,168(sp)
    8000115c:	0b613823          	sd	s6,176(sp)
    80001160:	0b713c23          	sd	s7,184(sp)
    80001164:	0d813023          	sd	s8,192(sp)
    80001168:	0d913423          	sd	s9,200(sp)
    8000116c:	0da13823          	sd	s10,208(sp)
    80001170:	0db13c23          	sd	s11,216(sp)
    80001174:	0fc13023          	sd	t3,224(sp)
    80001178:	0fd13423          	sd	t4,232(sp)
    8000117c:	0fe13823          	sd	t5,240(sp)
    80001180:	0ff13c23          	sd	t6,248(sp)

    call interruptRoutine
    80001184:	6ed000ef          	jal	ra,80002070 <interruptRoutine>

    #ucitavanje svih registara iz running niti (moze biti druga nit od one koja je sacuvana pre call)
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    80001188:	00013003          	ld	zero,0(sp)
    8000118c:	00813083          	ld	ra,8(sp)
    80001190:	01013103          	ld	sp,16(sp)
    80001194:	01813183          	ld	gp,24(sp)
    80001198:	02013203          	ld	tp,32(sp)
    8000119c:	02813283          	ld	t0,40(sp)
    800011a0:	03013303          	ld	t1,48(sp)
    800011a4:	03813383          	ld	t2,56(sp)
    800011a8:	04013403          	ld	s0,64(sp)
    800011ac:	04813483          	ld	s1,72(sp)
    800011b0:	05013503          	ld	a0,80(sp)
    800011b4:	05813583          	ld	a1,88(sp)
    800011b8:	06013603          	ld	a2,96(sp)
    800011bc:	06813683          	ld	a3,104(sp)
    800011c0:	07013703          	ld	a4,112(sp)
    800011c4:	07813783          	ld	a5,120(sp)
    800011c8:	08013803          	ld	a6,128(sp)
    800011cc:	08813883          	ld	a7,136(sp)
    800011d0:	09013903          	ld	s2,144(sp)
    800011d4:	09813983          	ld	s3,152(sp)
    800011d8:	0a013a03          	ld	s4,160(sp)
    800011dc:	0a813a83          	ld	s5,168(sp)
    800011e0:	0b013b03          	ld	s6,176(sp)
    800011e4:	0b813b83          	ld	s7,184(sp)
    800011e8:	0c013c03          	ld	s8,192(sp)
    800011ec:	0c813c83          	ld	s9,200(sp)
    800011f0:	0d013d03          	ld	s10,208(sp)
    800011f4:	0d813d83          	ld	s11,216(sp)
    800011f8:	0e013e03          	ld	t3,224(sp)
    800011fc:	0e813e83          	ld	t4,232(sp)
    80001200:	0f013f03          	ld	t5,240(sp)
    80001204:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001208:	10010113          	addi	sp,sp,256

    8000120c:	10200073          	sret

0000000080001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
	# sp stare niti pokazuje na sacuvane podatke iz dispatch(ra,s0,s1),
	# iznad toga su registri x3-x31 sacuvani u yield-u i ra,s0 iz yielda

	# sp nove niti pokazuje na sacuvane podatke iz dispatch-a i yield-a ako se nit nekad izvrsavala,
	# odnosno adresu vrha steka alociranog za novu nit ako nije
	sd ra, 0 * 8(a0)
    80001210:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
	sd sp, 1 * 8(a0)
    80001214:	00253423          	sd	sp,8(a0)

	ld ra, 0 * 8(a1)
    80001218:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000121c:	0085b103          	ld	sp,8(a1)

    80001220:	00008067          	ret

0000000080001224 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001224:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001228:	00b29a63          	bne	t0,a1,8000123c <fail>
    sc.w t0, a2, (a0)      # Try to update.
    8000122c:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001230:	fe029ae3          	bnez	t0,80001224 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001234:	00000513          	li	a0,0
    jr ra                  # Return.
    80001238:	00008067          	ret

000000008000123c <fail>:
    fail:
    li a0, 1               # Set return to failure.
    8000123c:	00100513          	li	a0,1
    80001240:	00008067          	ret

0000000080001244 <_ZN11ThreadQueue7putLastEP3TCB>:
// Created by os on 6/4/23.
//

#include "../h/ThreadQueue.hpp"

void ThreadQueue::putLast(TCB *tcb) {
    80001244:	fe010113          	addi	sp,sp,-32
    80001248:	00113c23          	sd	ra,24(sp)
    8000124c:	00813823          	sd	s0,16(sp)
    80001250:	00913423          	sd	s1,8(sp)
    80001254:	01213023          	sd	s2,0(sp)
    80001258:	02010413          	addi	s0,sp,32
    8000125c:	00050493          	mv	s1,a0
    80001260:	00058913          	mv	s2,a1
        Node *next;

        Node(TCB *d) : data(d), next(nullptr) {}

        static void *operator new(size_t size) {
            return mem_alloc(size);
    80001264:	01000513          	li	a0,16
    80001268:	00000097          	auipc	ra,0x0
    8000126c:	0a8080e7          	jalr	168(ra) # 80001310 <_Z9mem_allocm>
        Node(TCB *d) : data(d), next(nullptr) {}
    80001270:	01253023          	sd	s2,0(a0)
    80001274:	00053423          	sd	zero,8(a0)
            delete node;
        }
    }

    bool isEmpty() const {
        bool ret = front == nullptr;
    80001278:	0004b783          	ld	a5,0(s1)
    Node *newNode = new Node(tcb);
    if (isEmpty()) {
    8000127c:	02078463          	beqz	a5,800012a4 <_ZN11ThreadQueue7putLastEP3TCB+0x60>
        front = back = newNode;
    } else {
        back->next = newNode;
    80001280:	0084b783          	ld	a5,8(s1)
    80001284:	00a7b423          	sd	a0,8(a5)
        back = newNode;
    80001288:	00a4b423          	sd	a0,8(s1)
    }
}
    8000128c:	01813083          	ld	ra,24(sp)
    80001290:	01013403          	ld	s0,16(sp)
    80001294:	00813483          	ld	s1,8(sp)
    80001298:	00013903          	ld	s2,0(sp)
    8000129c:	02010113          	addi	sp,sp,32
    800012a0:	00008067          	ret
        front = back = newNode;
    800012a4:	00a4b423          	sd	a0,8(s1)
    800012a8:	00a4b023          	sd	a0,0(s1)
    800012ac:	fe1ff06f          	j	8000128c <_ZN11ThreadQueue7putLastEP3TCB+0x48>

00000000800012b0 <_ZN11ThreadQueue8getFirstEv>:

TCB *ThreadQueue::getFirst() {
    800012b0:	fe010113          	addi	sp,sp,-32
    800012b4:	00113c23          	sd	ra,24(sp)
    800012b8:	00813823          	sd	s0,16(sp)
    800012bc:	00913423          	sd	s1,8(sp)
    800012c0:	02010413          	addi	s0,sp,32
    800012c4:	00050793          	mv	a5,a0
    800012c8:	00053503          	ld	a0,0(a0)
    if (isEmpty()) {
    800012cc:	02050e63          	beqz	a0,80001308 <_ZN11ThreadQueue8getFirstEv+0x58>
        return nullptr;
    }
    Node *node = front;
    TCB *tcb = node->data;
    800012d0:	00053483          	ld	s1,0(a0)
    front = front->next;
    800012d4:	00853703          	ld	a4,8(a0)
    800012d8:	00e7b023          	sd	a4,0(a5)
    if (front == nullptr) {
    800012dc:	02070263          	beqz	a4,80001300 <_ZN11ThreadQueue8getFirstEv+0x50>
            mem_free(ptr);
    800012e0:	00000097          	auipc	ra,0x0
    800012e4:	070080e7          	jalr	112(ra) # 80001350 <_Z8mem_freePv>
        back = nullptr;
    }
    delete node;
    return tcb;
    800012e8:	00048513          	mv	a0,s1
    800012ec:	01813083          	ld	ra,24(sp)
    800012f0:	01013403          	ld	s0,16(sp)
    800012f4:	00813483          	ld	s1,8(sp)
    800012f8:	02010113          	addi	sp,sp,32
    800012fc:	00008067          	ret
        back = nullptr;
    80001300:	0007b423          	sd	zero,8(a5)
    80001304:	fddff06f          	j	800012e0 <_ZN11ThreadQueue8getFirstEv+0x30>
        return nullptr;
    80001308:	00050493          	mv	s1,a0
    8000130c:	fddff06f          	j	800012e8 <_ZN11ThreadQueue8getFirstEv+0x38>

0000000080001310 <_Z9mem_allocm>:
//poziv ecall, prelazak u sistemski rezim i odlazak u prekidnu rutinu
inline void scall() {
    __asm__ volatile("ecall");
}

void* mem_alloc(size_t size) {
    80001310:	ff010113          	addi	sp,sp,-16
    80001314:	00813423          	sd	s0,8(sp)
    80001318:	01010413          	addi	s0,sp,16
    //na size se dodaje zaglavlje segmenta
    //size += sizeof(MemoryAllocator::UsedMemSegment);
    size += 2*sizeof(uint64);
    8000131c:	01050513          	addi	a0,a0,16
    //size je u bajtovima, pretvara se u blokove
    size = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001320:	00655313          	srli	t1,a0,0x6
    80001324:	03f57513          	andi	a0,a0,63
    80001328:	00050463          	beqz	a0,80001330 <_Z9mem_allocm+0x20>
    8000132c:	00100513          	li	a0,1
    80001330:	00a30333          	add	t1,t1,a0

    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[size]": :[size] "r"(size):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001334:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x01");
    80001338:	00100513          	li	a0,1
    __asm__ volatile("ecall");
    8000133c:	00000073          	ecall
    scall();

    //vraceni pokazivac pokazuje iza zaglavlja koriscenog segmenta,
    //na prvu adresu u koju korisnik sme nesto upisati
    void* ret;
    __asm__ volatile("mv %[ptr], a0":[ptr] "=r"(ret));
    80001340:	00050513          	mv	a0,a0
    return ret;
}
    80001344:	00813403          	ld	s0,8(sp)
    80001348:	01010113          	addi	sp,sp,16
    8000134c:	00008067          	ret

0000000080001350 <_Z8mem_freePv>:

int mem_free(void* ptr) {
    80001350:	ff010113          	addi	sp,sp,-16
    80001354:	00813423          	sd	s0,8(sp)
    80001358:	01010413          	addi	s0,sp,16
    8000135c:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(ptr):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001360:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x02");
    80001364:	00200513          	li	a0,2
    __asm__ volatile("ecall");
    80001368:	00000073          	ecall
    //a1 = pokazivac na memoriju koju treba dealocirati, dobijen pomocu mem_alloc

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    8000136c:	00050513          	mv	a0,a0
    return status;
}
    80001370:	0005051b          	sext.w	a0,a0
    80001374:	00813403          	ld	s0,8(sp)
    80001378:	01010113          	addi	sp,sp,16
    8000137c:	00008067          	ret

0000000080001380 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void (* start_routine)(void*), void* arg) {
    80001380:	fd010113          	addi	sp,sp,-48
    80001384:	02113423          	sd	ra,40(sp)
    80001388:	02813023          	sd	s0,32(sp)
    8000138c:	00913c23          	sd	s1,24(sp)
    80001390:	01213823          	sd	s2,16(sp)
    80001394:	01313423          	sd	s3,8(sp)
    80001398:	03010413          	addi	s0,sp,48
    8000139c:	00050913          	mv	s2,a0
    800013a0:	00058493          	mv	s1,a1
    800013a4:	00060993          	mv	s3,a2
    //stvaranje steka ako se ne radi o main kernel niti, posto ona automatski ima stek
    uint64* stack = nullptr;
    if (start_routine != nullptr) {
    800013a8:	04058863          	beqz	a1,800013f8 <_Z13thread_createPP3TCBPFvPvES2_+0x78>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800013ac:	00001537          	lui	a0,0x1
    800013b0:	00000097          	auipc	ra,0x0
    800013b4:	f60080e7          	jalr	-160(ra) # 80001310 <_Z9mem_allocm>
    800013b8:	00050313          	mv	t1,a0
    }
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013bc:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013c0:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2, %[function]": :[function] "r"(
            start_routine):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013c4:	00048613          	mv	a2,s1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013c8:	00090593          	mv	a1,s2
    __asm__ volatile("li a0, 0x11");
    800013cc:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    800013d0:	00000073          	ecall
    //a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800013d4:	00050513          	mv	a0,a0
    return status;
}
    800013d8:	0005051b          	sext.w	a0,a0
    800013dc:	02813083          	ld	ra,40(sp)
    800013e0:	02013403          	ld	s0,32(sp)
    800013e4:	01813483          	ld	s1,24(sp)
    800013e8:	01013903          	ld	s2,16(sp)
    800013ec:	00813983          	ld	s3,8(sp)
    800013f0:	03010113          	addi	sp,sp,48
    800013f4:	00008067          	ret
    uint64* stack = nullptr;
    800013f8:	00000313          	li	t1,0
    800013fc:	fc1ff06f          	j	800013bc <_Z13thread_createPP3TCBPFvPvES2_+0x3c>

0000000080001400 <_Z11thread_exitv>:

int thread_exit() {
    80001400:	ff010113          	addi	sp,sp,-16
    80001404:	00813423          	sd	s0,8(sp)
    80001408:	01010413          	addi	s0,sp,16
    //nema argumenata, samo kod sistemskog poziva
    __asm__ volatile("li a0, 0x12");
    8000140c:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    80001410:	00000073          	ecall

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001414:	00050513          	mv	a0,a0
    return status;
}
    80001418:	0005051b          	sext.w	a0,a0
    8000141c:	00813403          	ld	s0,8(sp)
    80001420:	01010113          	addi	sp,sp,16
    80001424:	00008067          	ret

0000000080001428 <_Z15thread_dispatchv>:

void thread_dispatch() {
    80001428:	ff010113          	addi	sp,sp,-16
    8000142c:	00813423          	sd	s0,8(sp)
    80001430:	01010413          	addi	s0,sp,16
    //nema argumenata, samo kod sistemskog poziva
    __asm__ volatile("li a0, 0x13");
    80001434:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    80001438:	00000073          	ecall

    scall();
    //nema povratne vrednosti
}
    8000143c:	00813403          	ld	s0,8(sp)
    80001440:	01010113          	addi	sp,sp,16
    80001444:	00008067          	ret

0000000080001448 <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle) {
    80001448:	ff010113          	addi	sp,sp,-16
    8000144c:	00813423          	sd	s0,8(sp)
    80001450:	01010413          	addi	s0,sp,16
    80001454:	00050313          	mv	t1,a0
//stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001458:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x14");
    8000145c:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    80001460:	00000073          	ecall
    //a0 = 0x14
    //a1 = rucka niti na koju se ceka

    scall();
}
    80001464:	00813403          	ld	s0,8(sp)
    80001468:	01010113          	addi	sp,sp,16
    8000146c:	00008067          	ret

0000000080001470 <_Z10time_sleepm>:

int time_sleep(time_t timerPeriods) {
    80001470:	ff010113          	addi	sp,sp,-16
    80001474:	00813423          	sd	s0,8(sp)
    80001478:	01010413          	addi	s0,sp,16
    8000147c:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[time]": :[time] "r"(timerPeriods):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001480:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x31");
    80001484:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    80001488:	00000073          	ecall
    //a1 = broj perioda tajmera na koji se uspavljuje nit

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    8000148c:	00050513          	mv	a0,a0
    return status;
}
    80001490:	0005051b          	sext.w	a0,a0
    80001494:	00813403          	ld	s0,8(sp)
    80001498:	01010113          	addi	sp,sp,16
    8000149c:	00008067          	ret

00000000800014a0 <_Z8sem_openPP4KSemj>:

int sem_open(sem_t* handle, unsigned int init) {
    800014a0:	ff010113          	addi	sp,sp,-16
    800014a4:	00813423          	sd	s0,8(sp)
    800014a8:	01010413          	addi	s0,sp,16
    800014ac:	00050313          	mv	t1,a0
    800014b0:	00058e13          	mv	t3,a1
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a2, %[val]": :[val] "r"(init):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800014b4:	000e0613          	mv	a2,t3
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800014b8:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x21");
    800014bc:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    800014c0:	00000073          	ecall

    scall();

    //status == 0 ako je uspesno kreiran semafor; status == -1 ako nije
    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800014c4:	00050513          	mv	a0,a0
    return status;
}
    800014c8:	0005051b          	sext.w	a0,a0
    800014cc:	00813403          	ld	s0,8(sp)
    800014d0:	01010113          	addi	sp,sp,16
    800014d4:	00008067          	ret

00000000800014d8 <_Z9sem_closeP4KSem>:

int sem_close(sem_t handle) {
    800014d8:	ff010113          	addi	sp,sp,-16
    800014dc:	00813423          	sd	s0,8(sp)
    800014e0:	01010413          	addi	s0,sp,16
    800014e4:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800014e8:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x22");
    800014ec:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    800014f0:	00000073          	ecall
    //a1 = rucka semafora (pokazivac na semafor u kernelu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800014f4:	00050513          	mv	a0,a0
    return status;
}
    800014f8:	0005051b          	sext.w	a0,a0
    800014fc:	00813403          	ld	s0,8(sp)
    80001500:	01010113          	addi	sp,sp,16
    80001504:	00008067          	ret

0000000080001508 <_Z8sem_waitP4KSem>:

int sem_wait(sem_t id) {
    80001508:	ff010113          	addi	sp,sp,-16
    8000150c:	00813423          	sd	s0,8(sp)
    80001510:	01010413          	addi	s0,sp,16
    80001514:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(id):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001518:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x23");
    8000151c:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    80001520:	00000073          	ecall
    //a1 = rucka semafora (pokazivac na semafor u kernelu)

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

0000000080001538 <_Z10sem_signalP4KSem>:

int sem_signal(sem_t id) {
    80001538:	ff010113          	addi	sp,sp,-16
    8000153c:	00813423          	sd	s0,8(sp)
    80001540:	01010413          	addi	s0,sp,16
    80001544:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(id):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001548:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x24");
    8000154c:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    80001550:	00000073          	ecall
    //a1 = rucka semafora (pokazivac na semafor u kernelu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001554:	00050513          	mv	a0,a0
    return status;
}
    80001558:	0005051b          	sext.w	a0,a0
    8000155c:	00813403          	ld	s0,8(sp)
    80001560:	01010113          	addi	sp,sp,16
    80001564:	00008067          	ret

0000000080001568 <_Z4getcv>:

char getc() {
    80001568:	ff010113          	addi	sp,sp,-16
    8000156c:	00813423          	sd	s0,8(sp)
    80001570:	01010413          	addi	s0,sp,16
    //nema argumenata
    __asm__ volatile("li a0, 0x41");
    80001574:	04100513          	li	a0,65
    __asm__ volatile("ecall");
    80001578:	00000073          	ecall

    scall();

    char character;
    __asm__ volatile("mv %[c], a0":[c] "=r"(character));
    8000157c:	00050513          	mv	a0,a0
    return character;
}
    80001580:	0ff57513          	andi	a0,a0,255
    80001584:	00813403          	ld	s0,8(sp)
    80001588:	01010113          	addi	sp,sp,16
    8000158c:	00008067          	ret

0000000080001590 <_Z4putcc>:

void putc(char c) {
    80001590:	ff010113          	addi	sp,sp,-16
    80001594:	00813423          	sd	s0,8(sp)
    80001598:	01010413          	addi	s0,sp,16
    8000159c:	00050313          	mv	t1,a0
    //stavljanje argumenata
    __asm__ volatile("mv a1, %[c]": :[c] "r"(c):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015a0:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x42");
    800015a4:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    800015a8:	00000073          	ecall

    scall();
    //nema povratne vrednosti
}
    800015ac:	00813403          	ld	s0,8(sp)
    800015b0:	01010113          	addi	sp,sp,16
    800015b4:	00008067          	ret

00000000800015b8 <_Z12thread_allocPP3TCBPFvPvES2_>:

int thread_alloc(thread_t* handle, TCB::Body function, void* arg) {
    800015b8:	fd010113          	addi	sp,sp,-48
    800015bc:	02113423          	sd	ra,40(sp)
    800015c0:	02813023          	sd	s0,32(sp)
    800015c4:	00913c23          	sd	s1,24(sp)
    800015c8:	01213823          	sd	s2,16(sp)
    800015cc:	01313423          	sd	s3,8(sp)
    800015d0:	03010413          	addi	s0,sp,48
    800015d4:	00050913          	mv	s2,a0
    800015d8:	00058493          	mv	s1,a1
    800015dc:	00060993          	mv	s3,a2
    //stvaranje steka ako se ne radi o main kernel niti, posto ona automatski ima stek
    uint64* stack = nullptr;
    if (function != nullptr) {
    800015e0:	04058863          	beqz	a1,80001630 <_Z12thread_allocPP3TCBPFvPvES2_+0x78>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800015e4:	00001537          	lui	a0,0x1
    800015e8:	00000097          	auipc	ra,0x0
    800015ec:	d28080e7          	jalr	-728(ra) # 80001310 <_Z9mem_allocm>
    800015f0:	00050313          	mv	t1,a0
    }
    //uint64* stack = (start_routine != nullptr ? (uint64*)MemoryAllocator::kmalloc(DEFAULT_STACK_SIZE) : nullptr);
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015f4:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015f8:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2, %[function]": :[function] "r"(
            function):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015fc:	00048613          	mv	a2,s1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001600:	00090593          	mv	a1,s2
    __asm__ volatile("li a0, 0x80");
    80001604:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80001608:	00000073          	ecall
    //a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    8000160c:	00050513          	mv	a0,a0
    return status;
}
    80001610:	0005051b          	sext.w	a0,a0
    80001614:	02813083          	ld	ra,40(sp)
    80001618:	02013403          	ld	s0,32(sp)
    8000161c:	01813483          	ld	s1,24(sp)
    80001620:	01013903          	ld	s2,16(sp)
    80001624:	00813983          	ld	s3,8(sp)
    80001628:	03010113          	addi	sp,sp,48
    8000162c:	00008067          	ret
    uint64* stack = nullptr;
    80001630:	00000313          	li	t1,0
    80001634:	fc1ff06f          	j	800015f4 <_Z12thread_allocPP3TCBPFvPvES2_+0x3c>

0000000080001638 <_Z12thread_startP3TCB>:

void thread_start(thread_t handle) {
    80001638:	ff010113          	addi	sp,sp,-16
    8000163c:	00813423          	sd	s0,8(sp)
    80001640:	01010413          	addi	s0,sp,16
    80001644:	00050313          	mv	t1,a0
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001648:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    8000164c:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    80001650:	00000073          	ecall

    scall();
}
    80001654:	00813403          	ld	s0,8(sp)
    80001658:	01010113          	addi	sp,sp,16
    8000165c:	00008067          	ret

0000000080001660 <_ZN8KConsole12initKConsoleEv>:
int KConsole::inputBufferSize = 0;
char KConsole::inputBuffer[];
char KConsole::outputBuffer[];

void KConsole::initKConsole() {
	if (initialized) return;
    80001660:	0000b797          	auipc	a5,0xb
    80001664:	5207c783          	lbu	a5,1312(a5) # 8000cb80 <_ZN8KConsole11initializedE>
    80001668:	00078463          	beqz	a5,80001670 <_ZN8KConsole12initKConsoleEv+0x10>
    8000166c:	00008067          	ret
void KConsole::initKConsole() {
    80001670:	fe010113          	addi	sp,sp,-32
    80001674:	00113c23          	sd	ra,24(sp)
    80001678:	00813823          	sd	s0,16(sp)
    8000167c:	00913423          	sd	s1,8(sp)
    80001680:	02010413          	addi	s0,sp,32
	dr = (char*)CONSOLE_RX_DATA;
    80001684:	0000b497          	auipc	s1,0xb
    80001688:	4fc48493          	addi	s1,s1,1276 # 8000cb80 <_ZN8KConsole11initializedE>
    8000168c:	0000b797          	auipc	a5,0xb
    80001690:	43c7b783          	ld	a5,1084(a5) # 8000cac8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001694:	0007b783          	ld	a5,0(a5)
    80001698:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    8000169c:	0000b797          	auipc	a5,0xb
    800016a0:	43c7b783          	ld	a5,1084(a5) # 8000cad8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016a4:	0007b783          	ld	a5,0(a5)
    800016a8:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    800016ac:	03200593          	li	a1,50
    800016b0:	0000b517          	auipc	a0,0xb
    800016b4:	4e850513          	addi	a0,a0,1256 # 8000cb98 <_ZN8KConsole19inputBufferHasSpaceE>
    800016b8:	00000097          	auipc	ra,0x0
    800016bc:	de8080e7          	jalr	-536(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016c0:	03200593          	li	a1,50
    800016c4:	0000b517          	auipc	a0,0xb
    800016c8:	4dc50513          	addi	a0,a0,1244 # 8000cba0 <_ZN8KConsole20outputBufferHasSpaceE>
    800016cc:	00000097          	auipc	ra,0x0
    800016d0:	dd4080e7          	jalr	-556(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016d4:	00000593          	li	a1,0
    800016d8:	0000b517          	auipc	a0,0xb
    800016dc:	4d050513          	addi	a0,a0,1232 # 8000cba8 <_ZN8KConsole12charsToInputE>
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	dc0080e7          	jalr	-576(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    800016e8:	00000593          	li	a1,0
    800016ec:	0000b517          	auipc	a0,0xb
    800016f0:	4c450513          	addi	a0,a0,1220 # 8000cbb0 <_ZN8KConsole13charsToOutputE>
    800016f4:	00000097          	auipc	ra,0x0
    800016f8:	dac080e7          	jalr	-596(ra) # 800014a0 <_Z8sem_openPP4KSemj>
	initialized = true;
    800016fc:	00100793          	li	a5,1
    80001700:	00f48023          	sb	a5,0(s1)
}
    80001704:	01813083          	ld	ra,24(sp)
    80001708:	01013403          	ld	s0,16(sp)
    8000170c:	00813483          	ld	s1,8(sp)
    80001710:	02010113          	addi	sp,sp,32
    80001714:	00008067          	ret

0000000080001718 <_ZN8KConsole17printConsoleStateEv>:

void KConsole::printConsoleState() {
    80001718:	fe010113          	addi	sp,sp,-32
    8000171c:	00113c23          	sd	ra,24(sp)
    80001720:	00813823          	sd	s0,16(sp)
    80001724:	00913423          	sd	s1,8(sp)
    80001728:	02010413          	addi	s0,sp,32
	printString("CONSOLE_RX = ");
    8000172c:	00009517          	auipc	a0,0x9
    80001730:	8f450513          	addi	a0,a0,-1804 # 8000a020 <CONSOLE_STATUS+0x10>
    80001734:	00004097          	auipc	ra,0x4
    80001738:	78c080e7          	jalr	1932(ra) # 80005ec0 <_Z11printStringPKc>
	printInteger((uint64)dr);
    8000173c:	0000b497          	auipc	s1,0xb
    80001740:	44448493          	addi	s1,s1,1092 # 8000cb80 <_ZN8KConsole11initializedE>
    80001744:	0084b503          	ld	a0,8(s1)
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	250080e7          	jalr	592(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    80001750:	00009517          	auipc	a0,0x9
    80001754:	e3050513          	addi	a0,a0,-464 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80001758:	00004097          	auipc	ra,0x4
    8000175c:	768080e7          	jalr	1896(ra) # 80005ec0 <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001760:	00009517          	auipc	a0,0x9
    80001764:	8d050513          	addi	a0,a0,-1840 # 8000a030 <CONSOLE_STATUS+0x20>
    80001768:	00004097          	auipc	ra,0x4
    8000176c:	758080e7          	jalr	1880(ra) # 80005ec0 <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001770:	0104b503          	ld	a0,16(s1)
    80001774:	00000097          	auipc	ra,0x0
    80001778:	224080e7          	jalr	548(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    8000177c:	00009517          	auipc	a0,0x9
    80001780:	e0450513          	addi	a0,a0,-508 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80001784:	00004097          	auipc	ra,0x4
    80001788:	73c080e7          	jalr	1852(ra) # 80005ec0 <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    8000178c:	00009517          	auipc	a0,0x9
    80001790:	8bc50513          	addi	a0,a0,-1860 # 8000a048 <CONSOLE_STATUS+0x38>
    80001794:	00004097          	auipc	ra,0x4
    80001798:	72c080e7          	jalr	1836(ra) # 80005ec0 <_Z11printStringPKc>
	printInteger(*dr);
    8000179c:	0084b783          	ld	a5,8(s1)
    800017a0:	0007c503          	lbu	a0,0(a5)
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	1f4080e7          	jalr	500(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017ac:	00009517          	auipc	a0,0x9
    800017b0:	dd450513          	addi	a0,a0,-556 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800017b4:	00004097          	auipc	ra,0x4
    800017b8:	70c080e7          	jalr	1804(ra) # 80005ec0 <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017bc:	00009517          	auipc	a0,0x9
    800017c0:	89c50513          	addi	a0,a0,-1892 # 8000a058 <CONSOLE_STATUS+0x48>
    800017c4:	00004097          	auipc	ra,0x4
    800017c8:	6fc080e7          	jalr	1788(ra) # 80005ec0 <_Z11printStringPKc>
	printInteger(*sr);
    800017cc:	0104b783          	ld	a5,16(s1)
    800017d0:	0007c503          	lbu	a0,0(a5)
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	1c4080e7          	jalr	452(ra) # 80001998 <_Z12printIntegerm>
	printString("\n");
    800017dc:	00009517          	auipc	a0,0x9
    800017e0:	da450513          	addi	a0,a0,-604 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800017e4:	00004097          	auipc	ra,0x4
    800017e8:	6dc080e7          	jalr	1756(ra) # 80005ec0 <_Z11printStringPKc>
}
    800017ec:	01813083          	ld	ra,24(sp)
    800017f0:	01013403          	ld	s0,16(sp)
    800017f4:	00813483          	ld	s1,8(sp)
    800017f8:	02010113          	addi	sp,sp,32
    800017fc:	00008067          	ret

0000000080001800 <_ZN8KConsole13getFromOutputEv>:

char KConsole::getFromOutput() {
    80001800:	fe010113          	addi	sp,sp,-32
    80001804:	00113c23          	sd	ra,24(sp)
    80001808:	00813823          	sd	s0,16(sp)
    8000180c:	00913423          	sd	s1,8(sp)
    80001810:	02010413          	addi	s0,sp,32
	sem_wait(charsToOutput);
    80001814:	0000b497          	auipc	s1,0xb
    80001818:	36c48493          	addi	s1,s1,876 # 8000cb80 <_ZN8KConsole11initializedE>
    8000181c:	0304b503          	ld	a0,48(s1)
    80001820:	00000097          	auipc	ra,0x0
    80001824:	ce8080e7          	jalr	-792(ra) # 80001508 <_Z8sem_waitP4KSem>
	char c = outputBuffer[outputHead];
    80001828:	0384a783          	lw	a5,56(s1)
    8000182c:	00f48733          	add	a4,s1,a5
	outputHead = (outputHead + 1) % capacity;
    80001830:	0017879b          	addiw	a5,a5,1
    80001834:	03200693          	li	a3,50
    80001838:	02d7e7bb          	remw	a5,a5,a3
    8000183c:	02f4ac23          	sw	a5,56(s1)
	return c;
}
    80001840:	04074503          	lbu	a0,64(a4)
    80001844:	01813083          	ld	ra,24(sp)
    80001848:	01013403          	ld	s0,16(sp)
    8000184c:	00813483          	ld	s1,8(sp)
    80001850:	02010113          	addi	sp,sp,32
    80001854:	00008067          	ret

0000000080001858 <_ZN8KConsole12placeInInputEc>:

void KConsole::placeInInput(char c) {
	if (inputBufferSize == capacity) return;
    80001858:	0000b717          	auipc	a4,0xb
    8000185c:	39c72703          	lw	a4,924(a4) # 8000cbf4 <_ZN8KConsole15inputBufferSizeE>
    80001860:	03200793          	li	a5,50
    80001864:	04f70e63          	beq	a4,a5,800018c0 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    80001868:	ff010113          	addi	sp,sp,-16
    8000186c:	00113423          	sd	ra,8(sp)
    80001870:	00813023          	sd	s0,0(sp)
    80001874:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    80001878:	0000b697          	auipc	a3,0xb
    8000187c:	30868693          	addi	a3,a3,776 # 8000cb80 <_ZN8KConsole11initializedE>
    80001880:	0786a783          	lw	a5,120(a3)
    80001884:	00f68633          	add	a2,a3,a5
    80001888:	08a60023          	sb	a0,128(a2)
	inputTail = (inputTail + 1) % capacity;
    8000188c:	0017879b          	addiw	a5,a5,1
    80001890:	03200613          	li	a2,50
    80001894:	02c7e7bb          	remw	a5,a5,a2
    80001898:	06f6ac23          	sw	a5,120(a3)
	inputBufferSize++;
    8000189c:	0017071b          	addiw	a4,a4,1
    800018a0:	06e6aa23          	sw	a4,116(a3)
	sem_signal(charsToInput);
    800018a4:	0286b503          	ld	a0,40(a3)
    800018a8:	00000097          	auipc	ra,0x0
    800018ac:	c90080e7          	jalr	-880(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    800018b0:	00813083          	ld	ra,8(sp)
    800018b4:	00013403          	ld	s0,0(sp)
    800018b8:	01010113          	addi	sp,sp,16
    800018bc:	00008067          	ret
    800018c0:	00008067          	ret

00000000800018c4 <_ZN8KConsole5kputcEc>:

void KConsole::kputc(char c) {
    800018c4:	fe010113          	addi	sp,sp,-32
    800018c8:	00113c23          	sd	ra,24(sp)
    800018cc:	00813823          	sd	s0,16(sp)
    800018d0:	00913423          	sd	s1,8(sp)
    800018d4:	01213023          	sd	s2,0(sp)
    800018d8:	02010413          	addi	s0,sp,32
    800018dc:	00050913          	mv	s2,a0
	sem_wait(outputBufferHasSpace);
    800018e0:	0000b497          	auipc	s1,0xb
    800018e4:	2a048493          	addi	s1,s1,672 # 8000cb80 <_ZN8KConsole11initializedE>
    800018e8:	0204b503          	ld	a0,32(s1)
    800018ec:	00000097          	auipc	ra,0x0
    800018f0:	c1c080e7          	jalr	-996(ra) # 80001508 <_Z8sem_waitP4KSem>
	outputBuffer[outputTail] = c;
    800018f4:	0b44a783          	lw	a5,180(s1)
    800018f8:	00f48733          	add	a4,s1,a5
    800018fc:	05270023          	sb	s2,64(a4)
	outputTail = (outputTail + 1) % capacity;
    80001900:	0017879b          	addiw	a5,a5,1
    80001904:	03200713          	li	a4,50
    80001908:	02e7e7bb          	remw	a5,a5,a4
    8000190c:	0af4aa23          	sw	a5,180(s1)
	sem_signal(charsToOutput);
    80001910:	0304b503          	ld	a0,48(s1)
    80001914:	00000097          	auipc	ra,0x0
    80001918:	c24080e7          	jalr	-988(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    8000191c:	01813083          	ld	ra,24(sp)
    80001920:	01013403          	ld	s0,16(sp)
    80001924:	00813483          	ld	s1,8(sp)
    80001928:	00013903          	ld	s2,0(sp)
    8000192c:	02010113          	addi	sp,sp,32
    80001930:	00008067          	ret

0000000080001934 <_ZN8KConsole5kgetcEv>:

char KConsole::kgetc() {
    80001934:	fe010113          	addi	sp,sp,-32
    80001938:	00113c23          	sd	ra,24(sp)
    8000193c:	00813823          	sd	s0,16(sp)
    80001940:	00913423          	sd	s1,8(sp)
    80001944:	02010413          	addi	s0,sp,32
	sem_wait(charsToInput);
    80001948:	0000b497          	auipc	s1,0xb
    8000194c:	23848493          	addi	s1,s1,568 # 8000cb80 <_ZN8KConsole11initializedE>
    80001950:	0284b503          	ld	a0,40(s1)
    80001954:	00000097          	auipc	ra,0x0
    80001958:	bb4080e7          	jalr	-1100(ra) # 80001508 <_Z8sem_waitP4KSem>
	char c = inputBuffer[inputHead];
    8000195c:	0b84a783          	lw	a5,184(s1)
    80001960:	00f48733          	add	a4,s1,a5
	inputHead = (inputHead + 1) % capacity;
    80001964:	0017879b          	addiw	a5,a5,1
    80001968:	03200693          	li	a3,50
    8000196c:	02d7e7bb          	remw	a5,a5,a3
    80001970:	0af4ac23          	sw	a5,184(s1)
	inputBufferSize--;
    80001974:	0744a783          	lw	a5,116(s1)
    80001978:	fff7879b          	addiw	a5,a5,-1
    8000197c:	06f4aa23          	sw	a5,116(s1)
	return c;
}
    80001980:	08074503          	lbu	a0,128(a4)
    80001984:	01813083          	ld	ra,24(sp)
    80001988:	01013403          	ld	s0,16(sp)
    8000198c:	00813483          	ld	s1,8(sp)
    80001990:	02010113          	addi	sp,sp,32
    80001994:	00008067          	ret

0000000080001998 <_Z12printIntegerm>:
//void println(char const *string) {
//    printString(string);
//    __putc('\n');
//}

void printInteger(uint64 integer) {
    80001998:	ff010113          	addi	sp,sp,-16
    8000199c:	00813423          	sd	s0,8(sp)
    800019a0:	01010413          	addi	s0,sp,16
    800019a4:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[i]": :[i] "r"(integer):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800019a8:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x91");
    800019ac:	09100513          	li	a0,145

	__asm__ volatile("ecall");
    800019b0:	00000073          	ecall
}
    800019b4:	00813403          	ld	s0,8(sp)
    800019b8:	01010113          	addi	sp,sp,16
    800019bc:	00008067          	ret

00000000800019c0 <_Z9kPrintIntm>:

void kPrintInt(uint64 integer){
    800019c0:	fd010113          	addi	sp,sp,-48
    800019c4:	02113423          	sd	ra,40(sp)
    800019c8:	02813023          	sd	s0,32(sp)
    800019cc:	00913c23          	sd	s1,24(sp)
    800019d0:	03010413          	addi	s0,sp,48
    neg = 0;
    if (integer < 0) {
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    800019d4:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    800019d8:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    800019dc:	00a00613          	li	a2,10
    800019e0:	02c5773b          	remuw	a4,a0,a2
    800019e4:	02071693          	slli	a3,a4,0x20
    800019e8:	0206d693          	srli	a3,a3,0x20
    800019ec:	00008717          	auipc	a4,0x8
    800019f0:	68470713          	addi	a4,a4,1668 # 8000a070 <_ZZ9kPrintIntmE6digits>
    800019f4:	00d70733          	add	a4,a4,a3
    800019f8:	00074703          	lbu	a4,0(a4)
    800019fc:	fe040693          	addi	a3,s0,-32
    80001a00:	009687b3          	add	a5,a3,s1
    80001a04:	0014849b          	addiw	s1,s1,1
    80001a08:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80001a0c:	0005071b          	sext.w	a4,a0
    80001a10:	02c5553b          	divuw	a0,a0,a2
    80001a14:	00900793          	li	a5,9
    80001a18:	fce7e2e3          	bltu	a5,a4,800019dc <_Z9kPrintIntm+0x1c>
    if (neg) buf[i++] = '-';

    while (--i >= 0) {
    80001a1c:	fff4849b          	addiw	s1,s1,-1
    80001a20:	0004ce63          	bltz	s1,80001a3c <_Z9kPrintIntm+0x7c>
        putc(buf[i]);
    80001a24:	fe040793          	addi	a5,s0,-32
    80001a28:	009787b3          	add	a5,a5,s1
    80001a2c:	ff07c503          	lbu	a0,-16(a5)
    80001a30:	00000097          	auipc	ra,0x0
    80001a34:	b60080e7          	jalr	-1184(ra) # 80001590 <_Z4putcc>
    80001a38:	fe5ff06f          	j	80001a1c <_Z9kPrintIntm+0x5c>
    }
}
    80001a3c:	02813083          	ld	ra,40(sp)
    80001a40:	02013403          	ld	s0,32(sp)
    80001a44:	01813483          	ld	s1,24(sp)
    80001a48:	03010113          	addi	sp,sp,48
    80001a4c:	00008067          	ret

0000000080001a50 <_ZN9Scheduler3putEP3TCB>:

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    80001a50:	ff010113          	addi	sp,sp,-16
    80001a54:	00813423          	sd	s0,8(sp)
    80001a58:	01010413          	addi	s0,sp,16
    if (tail == nullptr) {
    80001a5c:	0000b797          	auipc	a5,0xb
    80001a60:	1e47b783          	ld	a5,484(a5) # 8000cc40 <_ZN9Scheduler4tailE>
    80001a64:	00078e63          	beqz	a5,80001a80 <_ZN9Scheduler3putEP3TCB+0x30>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    80001a68:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    80001a6c:	0000b797          	auipc	a5,0xb
    80001a70:	1ca7ba23          	sd	a0,468(a5) # 8000cc40 <_ZN9Scheduler4tailE>
    }
}
    80001a74:	00813403          	ld	s0,8(sp)
    80001a78:	01010113          	addi	sp,sp,16
    80001a7c:	00008067          	ret
        head = tail = tcb;
    80001a80:	0000b797          	auipc	a5,0xb
    80001a84:	1c078793          	addi	a5,a5,448 # 8000cc40 <_ZN9Scheduler4tailE>
    80001a88:	00a7b023          	sd	a0,0(a5)
    80001a8c:	00a7b423          	sd	a0,8(a5)
    80001a90:	fe5ff06f          	j	80001a74 <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001a94 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001a94:	ff010113          	addi	sp,sp,-16
    80001a98:	00813423          	sd	s0,8(sp)
    80001a9c:	01010413          	addi	s0,sp,16
    TCB* firstThread = head;
    80001aa0:	0000b717          	auipc	a4,0xb
    80001aa4:	1a070713          	addi	a4,a4,416 # 8000cc40 <_ZN9Scheduler4tailE>
    80001aa8:	00873503          	ld	a0,8(a4)
    head = head->nextInScheduler;
    80001aac:	03053783          	ld	a5,48(a0)
    80001ab0:	00f73423          	sd	a5,8(a4)
    if (head == nullptr) {
    80001ab4:	00078a63          	beqz	a5,80001ac8 <_ZN9Scheduler3getEv+0x34>
        tail = head = nullptr;
    }
    firstThread->nextInScheduler = nullptr;
    80001ab8:	02053823          	sd	zero,48(a0)
    return firstThread;
}
    80001abc:	00813403          	ld	s0,8(sp)
    80001ac0:	01010113          	addi	sp,sp,16
    80001ac4:	00008067          	ret
        tail = head = nullptr;
    80001ac8:	00073423          	sd	zero,8(a4)
    80001acc:	00073023          	sd	zero,0(a4)
    80001ad0:	fe9ff06f          	j	80001ab8 <_ZN9Scheduler3getEv+0x24>

0000000080001ad4 <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    80001ad4:	ff010113          	addi	sp,sp,-16
    80001ad8:	00813423          	sd	s0,8(sp)
    80001adc:	01010413          	addi	s0,sp,16
    tcb->status = TCB::SLEEPING;
    80001ae0:	00400793          	li	a5,4
    80001ae4:	04f52c23          	sw	a5,88(a0)
    if (sleepingHead == nullptr) {
    80001ae8:	0000b817          	auipc	a6,0xb
    80001aec:	16883803          	ld	a6,360(a6) # 8000cc50 <_ZN9Scheduler12sleepingHeadE>
    80001af0:	02080863          	beqz	a6,80001b20 <_ZN9Scheduler10putToSleepEP3TCBm+0x4c>
        tcb->timeToSleep = sleepTime;
        return;
    }
    TCB* prevSleeping = nullptr;
    time_t accumulated = 0;
    TCB* current = sleepingHead;
    80001af4:	00080793          	mv	a5,a6
    time_t accumulated = 0;
    80001af8:	00000693          	li	a3,0
    TCB* prevSleeping = nullptr;
    80001afc:	00000613          	li	a2,0
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001b00:	02078863          	beqz	a5,80001b30 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
    80001b04:	0387b703          	ld	a4,56(a5)
    80001b08:	00d70733          	add	a4,a4,a3
    80001b0c:	02b77263          	bgeu	a4,a1,80001b30 <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
        accumulated += current->timeToSleep;
    80001b10:	00070693          	mv	a3,a4
        prevSleeping = current;
    80001b14:	00078613          	mv	a2,a5
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001b18:	0407b783          	ld	a5,64(a5)
    80001b1c:	fe5ff06f          	j	80001b00 <_ZN9Scheduler10putToSleepEP3TCBm+0x2c>
        sleepingHead = tcb;
    80001b20:	0000b797          	auipc	a5,0xb
    80001b24:	12a7b823          	sd	a0,304(a5) # 8000cc50 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80001b28:	02b53c23          	sd	a1,56(a0)
        return;
    80001b2c:	02c0006f          	j	80001b58 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    }
    if (!prevSleeping) {
    80001b30:	02060a63          	beqz	a2,80001b64 <_ZN9Scheduler10putToSleepEP3TCBm+0x90>
        sleepingHead = tcb;
        tcb->timeToSleep = sleepTime;
        tcb->nextSleeping->timeToSleep -= sleepTime;
        return;
    }
    tcb->nextSleeping = current;
    80001b34:	04f53023          	sd	a5,64(a0)
    prevSleeping->nextSleeping = tcb;
    80001b38:	04a63023          	sd	a0,64(a2)
    tcb->timeToSleep = sleepTime - accumulated;
    80001b3c:	40d58733          	sub	a4,a1,a3
    80001b40:	02e53c23          	sd	a4,56(a0)
    if (current) current->timeToSleep -= sleepTime - accumulated;
    80001b44:	00078a63          	beqz	a5,80001b58 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    80001b48:	40b686b3          	sub	a3,a3,a1
    80001b4c:	0387b703          	ld	a4,56(a5)
    80001b50:	00d706b3          	add	a3,a4,a3
    80001b54:	02d7bc23          	sd	a3,56(a5)
}
    80001b58:	00813403          	ld	s0,8(sp)
    80001b5c:	01010113          	addi	sp,sp,16
    80001b60:	00008067          	ret
        tcb->nextSleeping = sleepingHead;
    80001b64:	05053023          	sd	a6,64(a0)
        sleepingHead = tcb;
    80001b68:	0000b797          	auipc	a5,0xb
    80001b6c:	0ea7b423          	sd	a0,232(a5) # 8000cc50 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80001b70:	02b53c23          	sd	a1,56(a0)
        tcb->nextSleeping->timeToSleep -= sleepTime;
    80001b74:	03883683          	ld	a3,56(a6)
    80001b78:	40b686b3          	sub	a3,a3,a1
    80001b7c:	02d83c23          	sd	a3,56(a6)
        return;
    80001b80:	fd9ff06f          	j	80001b58 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>

0000000080001b84 <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
    if (!sleepingHead) return;
    80001b84:	0000b797          	auipc	a5,0xb
    80001b88:	0cc7b783          	ld	a5,204(a5) # 8000cc50 <_ZN9Scheduler12sleepingHeadE>
    80001b8c:	06078e63          	beqz	a5,80001c08 <_ZN9Scheduler4wakeEv+0x84>
    sleepingHead->timeToSleep--;
    80001b90:	0387b703          	ld	a4,56(a5)
    80001b94:	fff70713          	addi	a4,a4,-1
    80001b98:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001b9c:	0000b517          	auipc	a0,0xb
    80001ba0:	0b453503          	ld	a0,180(a0) # 8000cc50 <_ZN9Scheduler12sleepingHeadE>
    80001ba4:	06050263          	beqz	a0,80001c08 <_ZN9Scheduler4wakeEv+0x84>
    80001ba8:	03853783          	ld	a5,56(a0)
    80001bac:	04079e63          	bnez	a5,80001c08 <_ZN9Scheduler4wakeEv+0x84>
void Scheduler::wake() {
    80001bb0:	ff010113          	addi	sp,sp,-16
    80001bb4:	00113423          	sd	ra,8(sp)
    80001bb8:	00813023          	sd	s0,0(sp)
    80001bbc:	01010413          	addi	s0,sp,16
    80001bc0:	00c0006f          	j	80001bcc <_ZN9Scheduler4wakeEv+0x48>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001bc4:	03853783          	ld	a5,56(a0)
    80001bc8:	02079863          	bnez	a5,80001bf8 <_ZN9Scheduler4wakeEv+0x74>
        TCB* thread = sleepingHead;
        sleepingHead = sleepingHead->nextSleeping;
    80001bcc:	04053783          	ld	a5,64(a0)
    80001bd0:	0000b717          	auipc	a4,0xb
    80001bd4:	08f73023          	sd	a5,128(a4) # 8000cc50 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    80001bd8:	04053023          	sd	zero,64(a0)
        thread->status = TCB::ACTIVE;
    80001bdc:	00100793          	li	a5,1
    80001be0:	04f52c23          	sw	a5,88(a0)
        Scheduler::put(thread);
    80001be4:	00000097          	auipc	ra,0x0
    80001be8:	e6c080e7          	jalr	-404(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001bec:	0000b517          	auipc	a0,0xb
    80001bf0:	06453503          	ld	a0,100(a0) # 8000cc50 <_ZN9Scheduler12sleepingHeadE>
    80001bf4:	fc0518e3          	bnez	a0,80001bc4 <_ZN9Scheduler4wakeEv+0x40>
    }
}
    80001bf8:	00813083          	ld	ra,8(sp)
    80001bfc:	00013403          	ld	s0,0(sp)
    80001c00:	01010113          	addi	sp,sp,16
    80001c04:	00008067          	ret
    80001c08:	00008067          	ret

0000000080001c0c <_ZN7KMemory7kmallocEm>:
    kmalloc(blocksForBitVector);

    initialized = true;
}

void* KMemory::kmalloc(size_t size) {
    80001c0c:	ff010113          	addi	sp,sp,-16
    80001c10:	00813423          	sd	s0,8(sp)
    80001c14:	01010413          	addi	s0,sp,16
    if (size <= 0) return nullptr;
    80001c18:	14050a63          	beqz	a0,80001d6c <_ZN7KMemory7kmallocEm+0x160>
    uint64 currentElem = 0;
    uint64 currentBit = 63;
    uint64 firstZeroElem = 0;
    uint64 firstZeroBit = 63;
    uint64 zerosFound = 0;
    bool zeroFound = false;
    80001c1c:	00000313          	li	t1,0
    uint64 zerosFound = 0;
    80001c20:	00000713          	li	a4,0
    uint64 firstZeroBit = 63;
    80001c24:	03f00813          	li	a6,63
    uint64 firstZeroElem = 0;
    80001c28:	00000893          	li	a7,0
    uint64 currentBit = 63;
    80001c2c:	03f00793          	li	a5,63
    uint64 currentElem = 0;
    80001c30:	00000593          	li	a1,0
    80001c34:	0080006f          	j	80001c3c <_ZN7KMemory7kmallocEm+0x30>
            firstZeroElem = currentElem;
        } else {
            zerosFound++;
        }
        if (zerosFound == size) break;
        if (currentBit-- == 0) {
    80001c38:	00068793          	mv	a5,a3
    while (currentElem < sizeOfBitVectorInUint64) {
    80001c3c:	0000b697          	auipc	a3,0xb
    80001c40:	01c6b683          	ld	a3,28(a3) # 8000cc58 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001c44:	08d5fa63          	bgeu	a1,a3,80001cd8 <_ZN7KMemory7kmallocEm+0xcc>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001c48:	03f00693          	li	a3,63
    80001c4c:	02d78a63          	beq	a5,a3,80001c80 <_ZN7KMemory7kmallocEm+0x74>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    80001c50:	00359693          	slli	a3,a1,0x3
    80001c54:	0000b617          	auipc	a2,0xb
    80001c58:	00c63603          	ld	a2,12(a2) # 8000cc60 <_ZN7KMemory9bitVectorE>
    80001c5c:	00d606b3          	add	a3,a2,a3
    80001c60:	0006b683          	ld	a3,0(a3)
    static uint64 firstFreeBlock;
    static uint64 sizeOfBitVectorInUint64;
    static uint64* bitVector;

    inline static uint64 maskBit(uint64 bitPos) {
        return (uint64)1 << bitPos;
    80001c64:	00100613          	li	a2,1
    80001c68:	00f61633          	sll	a2,a2,a5
    80001c6c:	00c6f6b3          	and	a3,a3,a2
        if (bit > 0) {
    80001c70:	02069a63          	bnez	a3,80001ca4 <_ZN7KMemory7kmallocEm+0x98>
        } else if (!zeroFound) {
    80001c74:	04030863          	beqz	t1,80001cc4 <_ZN7KMemory7kmallocEm+0xb8>
            zerosFound++;
    80001c78:	00170713          	addi	a4,a4,1
    80001c7c:	0300006f          	j	80001cac <_ZN7KMemory7kmallocEm+0xa0>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001c80:	00359693          	slli	a3,a1,0x3
    80001c84:	0000b617          	auipc	a2,0xb
    80001c88:	fdc63603          	ld	a2,-36(a2) # 8000cc60 <_ZN7KMemory9bitVectorE>
    80001c8c:	00d606b3          	add	a3,a2,a3
    80001c90:	0006b603          	ld	a2,0(a3)
    80001c94:	fff00693          	li	a3,-1
    80001c98:	fad61ce3          	bne	a2,a3,80001c50 <_ZN7KMemory7kmallocEm+0x44>
            currentElem++;
    80001c9c:	00158593          	addi	a1,a1,1
            continue;
    80001ca0:	f9dff06f          	j	80001c3c <_ZN7KMemory7kmallocEm+0x30>
            zeroFound = false;
    80001ca4:	00000313          	li	t1,0
            zerosFound = 0;
    80001ca8:	00000713          	li	a4,0
        if (zerosFound == size) break;
    80001cac:	02a70663          	beq	a4,a0,80001cd8 <_ZN7KMemory7kmallocEm+0xcc>
        if (currentBit-- == 0) {
    80001cb0:	fff78693          	addi	a3,a5,-1
    80001cb4:	f80792e3          	bnez	a5,80001c38 <_ZN7KMemory7kmallocEm+0x2c>
            currentBit = 63;
            currentElem++;
    80001cb8:	00158593          	addi	a1,a1,1
            currentBit = 63;
    80001cbc:	03f00793          	li	a5,63
    80001cc0:	f7dff06f          	j	80001c3c <_ZN7KMemory7kmallocEm+0x30>
            firstZeroBit = currentBit;
    80001cc4:	00078813          	mv	a6,a5
            firstZeroElem = currentElem;
    80001cc8:	00058893          	mv	a7,a1
            zeroFound = true;
    80001ccc:	00100313          	li	t1,1
            zerosFound = 1;
    80001cd0:	00100713          	li	a4,1
    80001cd4:	fd9ff06f          	j	80001cac <_ZN7KMemory7kmallocEm+0xa0>
        }
    }
    if (zerosFound != size) return nullptr;
    80001cd8:	08a71e63          	bne	a4,a0,80001d74 <_ZN7KMemory7kmallocEm+0x168>

    //alociranje blokova
    uint64 blockNum = firstZeroElem * 64 + (63 - firstZeroBit);
    80001cdc:	00689793          	slli	a5,a7,0x6
    80001ce0:	410787b3          	sub	a5,a5,a6
    80001ce4:	03f78793          	addi	a5,a5,63
    void* addr = (char*)HEAP_START_ADDR + blockNum * MEM_BLOCK_SIZE;
    80001ce8:	0000b697          	auipc	a3,0xb
    80001cec:	df86b683          	ld	a3,-520(a3) # 8000cae0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001cf0:	0006b583          	ld	a1,0(a3)
    80001cf4:	00679793          	slli	a5,a5,0x6
    80001cf8:	00f585b3          	add	a1,a1,a5
    *(uint64*)addr = size;  //da znamo koliko blokova je alocirano zaredom
    80001cfc:	00a5b023          	sd	a0,0(a1)

    //upisivanje 1 u bit vektor
    currentElem = firstZeroElem;
    currentBit = firstZeroBit;
    80001d00:	0080006f          	j	80001d08 <_ZN7KMemory7kmallocEm+0xfc>
    while (zerosFound > 0) {
        bitVector[currentElem] |= maskBit(currentBit);
        zerosFound--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001d04:	00078813          	mv	a6,a5
    while (zerosFound > 0) {
    80001d08:	04070063          	beqz	a4,80001d48 <_ZN7KMemory7kmallocEm+0x13c>
    80001d0c:	00100693          	li	a3,1
    80001d10:	01069633          	sll	a2,a3,a6
        bitVector[currentElem] |= maskBit(currentBit);
    80001d14:	00389793          	slli	a5,a7,0x3
    80001d18:	0000b697          	auipc	a3,0xb
    80001d1c:	f486b683          	ld	a3,-184(a3) # 8000cc60 <_ZN7KMemory9bitVectorE>
    80001d20:	00f687b3          	add	a5,a3,a5
    80001d24:	0007b683          	ld	a3,0(a5)
    80001d28:	00c6e6b3          	or	a3,a3,a2
    80001d2c:	00d7b023          	sd	a3,0(a5)
        zerosFound--;
    80001d30:	fff70713          	addi	a4,a4,-1
        if (currentBit-- == 0) {
    80001d34:	fff80793          	addi	a5,a6,-1
    80001d38:	fc0816e3          	bnez	a6,80001d04 <_ZN7KMemory7kmallocEm+0xf8>
            currentElem++;
    80001d3c:	00188893          	addi	a7,a7,1
            currentBit = 63;
    80001d40:	03f00793          	li	a5,63
    80001d44:	fc1ff06f          	j	80001d04 <_ZN7KMemory7kmallocEm+0xf8>
        }
    }
    freeBlocksLeft -= size;
    80001d48:	0000b717          	auipc	a4,0xb
    80001d4c:	f1070713          	addi	a4,a4,-240 # 8000cc58 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001d50:	01073783          	ld	a5,16(a4)
    80001d54:	40a78533          	sub	a0,a5,a0
    80001d58:	00a73823          	sd	a0,16(a4)
    return (char*)addr + 2 * sizeof(uint64);
    80001d5c:	01058513          	addi	a0,a1,16
}
    80001d60:	00813403          	ld	s0,8(sp)
    80001d64:	01010113          	addi	sp,sp,16
    80001d68:	00008067          	ret
    if (size <= 0) return nullptr;
    80001d6c:	00000513          	li	a0,0
    80001d70:	ff1ff06f          	j	80001d60 <_ZN7KMemory7kmallocEm+0x154>
    if (zerosFound != size) return nullptr;
    80001d74:	00000513          	li	a0,0
    80001d78:	fe9ff06f          	j	80001d60 <_ZN7KMemory7kmallocEm+0x154>

0000000080001d7c <_ZN7KMemory16initializeMemoryEv>:
    if (initialized) return;
    80001d7c:	0000b797          	auipc	a5,0xb
    80001d80:	ef47c783          	lbu	a5,-268(a5) # 8000cc70 <_ZN7KMemory11initializedE>
    80001d84:	0c079263          	bnez	a5,80001e48 <_ZN7KMemory16initializeMemoryEv+0xcc>
void KMemory::initializeMemory() {
    80001d88:	fe010113          	addi	sp,sp,-32
    80001d8c:	00113c23          	sd	ra,24(sp)
    80001d90:	00813823          	sd	s0,16(sp)
    80001d94:	00913423          	sd	s1,8(sp)
    80001d98:	02010413          	addi	s0,sp,32
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001d9c:	0000b797          	auipc	a5,0xb
    80001da0:	d7c7b783          	ld	a5,-644(a5) # 8000cb18 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001da4:	0007b783          	ld	a5,0(a5)
    80001da8:	0000b717          	auipc	a4,0xb
    80001dac:	d3873703          	ld	a4,-712(a4) # 8000cae0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001db0:	00073683          	ld	a3,0(a4)
    80001db4:	40d787b3          	sub	a5,a5,a3
            numOfBlocks / (sizeof(uint64) * 8);    //broj uint64 potrebnih da se smesti ceo bit vektor
    80001db8:	00c7d793          	srli	a5,a5,0xc
    sizeOfBitVectorInUint64 =
    80001dbc:	0000b717          	auipc	a4,0xb
    80001dc0:	e9c70713          	addi	a4,a4,-356 # 8000cc58 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001dc4:	00f73023          	sd	a5,0(a4)
    numOfBlocks = sizeOfBitVectorInUint64 * sizeof(uint64) * 8; //da se zaokruzi broj postojecih blokova na umnozak 64
    80001dc8:	00679613          	slli	a2,a5,0x6
    80001dcc:	02c73023          	sd	a2,32(a4)
    blocksForBitVector = (sizeOfBitVectorInUint64 * sizeof(uint64) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80001dd0:	00878793          	addi	a5,a5,8
    80001dd4:	00379793          	slli	a5,a5,0x3
    80001dd8:	fff78793          	addi	a5,a5,-1
    80001ddc:	0067d793          	srli	a5,a5,0x6
    80001de0:	02f73423          	sd	a5,40(a4)
    freeBlocksLeft = numOfBlocks;
    80001de4:	00c73823          	sd	a2,16(a4)
    bitVector = (uint64*)HEAP_START_ADDR;
    80001de8:	00d73423          	sd	a3,8(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001dec:	00000793          	li	a5,0
    80001df0:	0000b717          	auipc	a4,0xb
    80001df4:	e6873703          	ld	a4,-408(a4) # 8000cc58 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001df8:	02e7f063          	bgeu	a5,a4,80001e18 <_ZN7KMemory16initializeMemoryEv+0x9c>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    80001dfc:	00379693          	slli	a3,a5,0x3
    80001e00:	0000b717          	auipc	a4,0xb
    80001e04:	e6073703          	ld	a4,-416(a4) # 8000cc60 <_ZN7KMemory9bitVectorE>
    80001e08:	00d70733          	add	a4,a4,a3
    80001e0c:	00073023          	sd	zero,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001e10:	00178793          	addi	a5,a5,1
    80001e14:	fddff06f          	j	80001df0 <_ZN7KMemory16initializeMemoryEv+0x74>
    kmalloc(blocksForBitVector);
    80001e18:	0000b497          	auipc	s1,0xb
    80001e1c:	e4048493          	addi	s1,s1,-448 # 8000cc58 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001e20:	0284b503          	ld	a0,40(s1)
    80001e24:	00000097          	auipc	ra,0x0
    80001e28:	de8080e7          	jalr	-536(ra) # 80001c0c <_ZN7KMemory7kmallocEm>
    initialized = true;
    80001e2c:	00100793          	li	a5,1
    80001e30:	00f48c23          	sb	a5,24(s1)
}
    80001e34:	01813083          	ld	ra,24(sp)
    80001e38:	01013403          	ld	s0,16(sp)
    80001e3c:	00813483          	ld	s1,8(sp)
    80001e40:	02010113          	addi	sp,sp,32
    80001e44:	00008067          	ret
    80001e48:	00008067          	ret

0000000080001e4c <_ZN7KMemory5kfreeEPv>:

int KMemory::kfree(void* ptr) {
    80001e4c:	ff010113          	addi	sp,sp,-16
    80001e50:	00813423          	sd	s0,8(sp)
    80001e54:	01010413          	addi	s0,sp,16
    if(!ptr) return 0;
    80001e58:	08050a63          	beqz	a0,80001eec <_ZN7KMemory5kfreeEPv+0xa0>
    ptr = (char*)ptr - 2 * sizeof(uint64);
    80001e5c:	ff050793          	addi	a5,a0,-16
    uint64 blocksToFree = *(uint64*)ptr;
    80001e60:	ff053583          	ld	a1,-16(a0)
    freeBlocksLeft += blocksToFree;
    80001e64:	0000b697          	auipc	a3,0xb
    80001e68:	df468693          	addi	a3,a3,-524 # 8000cc58 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001e6c:	0106b703          	ld	a4,16(a3)
    80001e70:	00b70733          	add	a4,a4,a1
    80001e74:	00e6b823          	sd	a4,16(a3)
    uint64 blockNum = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    80001e78:	0000b717          	auipc	a4,0xb
    80001e7c:	c6873703          	ld	a4,-920(a4) # 8000cae0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001e80:	00073503          	ld	a0,0(a4)
    80001e84:	40a78533          	sub	a0,a5,a0
    80001e88:	00655613          	srli	a2,a0,0x6
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001e8c:	03f57793          	andi	a5,a0,63
    80001e90:	06079263          	bnez	a5,80001ef4 <_ZN7KMemory5kfreeEPv+0xa8>
    uint64 currentElem = blockNum / 64;
    80001e94:	00c55513          	srli	a0,a0,0xc
    uint64 currentBit = 63 - blockNum % 64;
    80001e98:	fff64613          	not	a2,a2
    80001e9c:	03f67613          	andi	a2,a2,63
    80001ea0:	0080006f          	j	80001ea8 <_ZN7KMemory5kfreeEPv+0x5c>
    while (blocksToFree > 0) {
        bitVector[currentElem] &= ~maskBit(currentBit);
        blocksToFree--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001ea4:	00078613          	mv	a2,a5
    while (blocksToFree > 0) {
    80001ea8:	04058a63          	beqz	a1,80001efc <_ZN7KMemory5kfreeEPv+0xb0>
    80001eac:	00100793          	li	a5,1
    80001eb0:	00c797b3          	sll	a5,a5,a2
        bitVector[currentElem] &= ~maskBit(currentBit);
    80001eb4:	fff7c793          	not	a5,a5
    80001eb8:	00351713          	slli	a4,a0,0x3
    80001ebc:	0000b697          	auipc	a3,0xb
    80001ec0:	da46b683          	ld	a3,-604(a3) # 8000cc60 <_ZN7KMemory9bitVectorE>
    80001ec4:	00e68733          	add	a4,a3,a4
    80001ec8:	00073683          	ld	a3,0(a4)
    80001ecc:	00f6f7b3          	and	a5,a3,a5
    80001ed0:	00f73023          	sd	a5,0(a4)
        blocksToFree--;
    80001ed4:	fff58593          	addi	a1,a1,-1
        if (currentBit-- == 0) {
    80001ed8:	fff60793          	addi	a5,a2,-1
    80001edc:	fc0614e3          	bnez	a2,80001ea4 <_ZN7KMemory5kfreeEPv+0x58>
            currentElem++;
    80001ee0:	00150513          	addi	a0,a0,1
            currentBit = 63;
    80001ee4:	03f00793          	li	a5,63
    80001ee8:	fbdff06f          	j	80001ea4 <_ZN7KMemory5kfreeEPv+0x58>
    if(!ptr) return 0;
    80001eec:	00000513          	li	a0,0
    80001ef0:	0100006f          	j	80001f00 <_ZN7KMemory5kfreeEPv+0xb4>
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001ef4:	fff00513          	li	a0,-1
    80001ef8:	0080006f          	j	80001f00 <_ZN7KMemory5kfreeEPv+0xb4>
        }
    }
    return 0;
    80001efc:	00000513          	li	a0,0
}
    80001f00:	00813403          	ld	s0,8(sp)
    80001f04:	01010113          	addi	sp,sp,16
    80001f08:	00008067          	ret

0000000080001f0c <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80001f0c:	ff010113          	addi	sp,sp,-16
    80001f10:	00113423          	sd	ra,8(sp)
    80001f14:	00813023          	sd	s0,0(sp)
    80001f18:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80001f1c:	fffff097          	auipc	ra,0xfffff
    80001f20:	50c080e7          	jalr	1292(ra) # 80001428 <_Z15thread_dispatchv>
    80001f24:	ff9ff06f          	j	80001f1c <_Z4idlePv+0x10>

0000000080001f28 <_Z22kernelConsumerFunctionPv>:
}

void kernelConsumerFunction(void*) {
    80001f28:	ff010113          	addi	sp,sp,-16
    80001f2c:	00113423          	sd	ra,8(sp)
    80001f30:	00813023          	sd	s0,0(sp)
    80001f34:	01010413          	addi	s0,sp,16
    80001f38:	0280006f          	j	80001f60 <_Z22kernelConsumerFunctionPv+0x38>
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
        *KConsole::dr = c;
    80001f3c:	0000b797          	auipc	a5,0xb
    80001f40:	bc47b783          	ld	a5,-1084(a5) # 8000cb00 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001f44:	0007b783          	ld	a5,0(a5)
    80001f48:	00a78023          	sb	a0,0(a5)
        sem_signal(KConsole::outputBufferHasSpace);
    80001f4c:	0000b797          	auipc	a5,0xb
    80001f50:	bbc7b783          	ld	a5,-1092(a5) # 8000cb08 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001f54:	0007b503          	ld	a0,0(a5)
    80001f58:	fffff097          	auipc	ra,0xfffff
    80001f5c:	5e0080e7          	jalr	1504(ra) # 80001538 <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001f60:	00000097          	auipc	ra,0x0
    80001f64:	8a0080e7          	jalr	-1888(ra) # 80001800 <_ZN8KConsole13getFromOutputEv>
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
    80001f68:	0000b797          	auipc	a5,0xb
    80001f6c:	bd07b783          	ld	a5,-1072(a5) # 8000cb38 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001f70:	0007b783          	ld	a5,0(a5)
    80001f74:	0007c783          	lbu	a5,0(a5)
    80001f78:	0207f793          	andi	a5,a5,32
    80001f7c:	fe0786e3          	beqz	a5,80001f68 <_Z22kernelConsumerFunctionPv+0x40>
    80001f80:	fbdff06f          	j	80001f3c <_Z22kernelConsumerFunctionPv+0x14>

0000000080001f84 <main>:
    }

}

int main() {
    80001f84:	fd010113          	addi	sp,sp,-48
    80001f88:	02113423          	sd	ra,40(sp)
    80001f8c:	02813023          	sd	s0,32(sp)
    80001f90:	03010413          	addi	s0,sp,48
    //postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001f94:	0000b797          	auipc	a5,0xb
    80001f98:	b8c7b783          	ld	a5,-1140(a5) # 8000cb20 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001f9c:	10579073          	csrw	stvec,a5

    KMemory::initializeMemory();
    80001fa0:	00000097          	auipc	ra,0x0
    80001fa4:	ddc080e7          	jalr	-548(ra) # 80001d7c <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija alokatora memorije
    //MemoryAllocator::initMemoryAllocator();

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001fa8:	fffff097          	auipc	ra,0xfffff
    80001fac:	6b8080e7          	jalr	1720(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, nullptr, nullptr);
    80001fb0:	00000613          	li	a2,0
    80001fb4:	00000593          	li	a1,0
    80001fb8:	fe840513          	addi	a0,s0,-24
    80001fbc:	fffff097          	auipc	ra,0xfffff
    80001fc0:	3c4080e7          	jalr	964(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = mainHandle;
    80001fc4:	fe843783          	ld	a5,-24(s0)
    80001fc8:	0000b717          	auipc	a4,0xb
    80001fcc:	b4873703          	ld	a4,-1208(a4) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001fd0:	00f73023          	sd	a5,0(a4)

    enum ThreadStatus {
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001fd4:	00100713          	li	a4,1
    80001fd8:	04e7ac23          	sw	a4,88(a5)
    TCB::running->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body) userMain, nullptr);
    80001fdc:	00000613          	li	a2,0
    80001fe0:	0000b597          	auipc	a1,0xb
    80001fe4:	ae05b583          	ld	a1,-1312(a1) # 8000cac0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001fe8:	fe040513          	addi	a0,s0,-32
    80001fec:	fffff097          	auipc	ra,0xfffff
    80001ff0:	394080e7          	jalr	916(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80001ff4:	00000613          	li	a2,0
    80001ff8:	00000597          	auipc	a1,0x0
    80001ffc:	f3058593          	addi	a1,a1,-208 # 80001f28 <_Z22kernelConsumerFunctionPv>
    80002000:	fd040513          	addi	a0,s0,-48
    80002004:	fffff097          	auipc	ra,0xfffff
    80002008:	37c080e7          	jalr	892(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    8000200c:	00000613          	li	a2,0
    80002010:	00000597          	auipc	a1,0x0
    80002014:	efc58593          	addi	a1,a1,-260 # 80001f0c <_Z4idlePv>
    80002018:	fd840513          	addi	a0,s0,-40
    8000201c:	fffff097          	auipc	ra,0xfffff
    80002020:	364080e7          	jalr	868(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002024:	00200793          	li	a5,2
    80002028:	1007a073          	csrs	sstatus,a5

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    8000202c:	fe043503          	ld	a0,-32(s0)
    80002030:	fffff097          	auipc	ra,0xfffff
    80002034:	418080e7          	jalr	1048(ra) # 80001448 <_Z11thread_joinP3TCB>

    //printString("\nSad cu da izadjem\n");

    //flush output bafera za konzolu
    while (KConsole::outputHead != KConsole::outputTail) {}
    80002038:	0000b797          	auipc	a5,0xb
    8000203c:	ab87b783          	ld	a5,-1352(a5) # 8000caf0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002040:	0007a703          	lw	a4,0(a5)
    80002044:	0000b797          	auipc	a5,0xb
    80002048:	aec7b783          	ld	a5,-1300(a5) # 8000cb30 <_GLOBAL_OFFSET_TABLE_+0x78>
    8000204c:	0007a783          	lw	a5,0(a5)
    80002050:	fef714e3          	bne	a4,a5,80002038 <main+0xb4>
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002054:	00200793          	li	a5,2
    80002058:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;


    8000205c:	00000513          	li	a0,0
    80002060:	02813083          	ld	ra,40(sp)
    80002064:	02013403          	ld	s0,32(sp)
    80002068:	03010113          	addi	sp,sp,48
    8000206c:	00008067          	ret

0000000080002070 <interruptRoutine>:
#include "../test/printing.hpp"

//void printInteger(int i);

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80002070:	f8010113          	addi	sp,sp,-128
    80002074:	06113c23          	sd	ra,120(sp)
    80002078:	06813823          	sd	s0,112(sp)
    8000207c:	06913423          	sd	s1,104(sp)
    80002080:	08010413          	addi	s0,sp,128
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002084:	14202373          	csrr	t1,scause
    80002088:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000208c:	14102373          	csrr	t1,sepc
    80002090:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002094:	10002373          	csrr	t1,sstatus
    80002098:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4, a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000209c:	00050313          	mv	t1,a0
    800020a0:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020a4:	00058313          	mv	t1,a1
    800020a8:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020ac:	00060313          	mv	t1,a2
    800020b0:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020b4:	00068313          	mv	t1,a3
    800020b8:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020bc:	00070313          	mv	t1,a4
    800020c0:	fa643023          	sd	t1,-96(s0)
    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020c4:	00078313          	mv	t1,a5
    800020c8:	f8643c23          	sd	t1,-104(s0)
    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020cc:	00080313          	mv	t1,a6
    800020d0:	f8643823          	sd	t1,-112(s0)
    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020d4:	00088313          	mv	t1,a7
    800020d8:	f8643423          	sd	t1,-120(s0)

    if (scause == 0x9 || scause == 0x8) {
    800020dc:	fd843703          	ld	a4,-40(s0)
    800020e0:	00900793          	li	a5,9
    800020e4:	00f70863          	beq	a4,a5,800020f4 <interruptRoutine+0x84>
    800020e8:	fd843703          	ld	a4,-40(s0)
    800020ec:	00800793          	li	a5,8
    800020f0:	38f71663          	bne	a4,a5,8000247c <interruptRoutine+0x40c>
        //prekid zbog poziva ecall
        switch (a0) {
    800020f4:	fc043703          	ld	a4,-64(s0)
    800020f8:	09100793          	li	a5,145
    800020fc:	2ef70a63          	beq	a4,a5,800023f0 <interruptRoutine+0x380>
    80002100:	fc043703          	ld	a4,-64(s0)
    80002104:	09100793          	li	a5,145
    80002108:	2ee7ec63          	bltu	a5,a4,80002400 <interruptRoutine+0x390>
    8000210c:	fc043703          	ld	a4,-64(s0)
    80002110:	08100793          	li	a5,129
    80002114:	2af70a63          	beq	a4,a5,800023c8 <interruptRoutine+0x358>
    80002118:	fc043703          	ld	a4,-64(s0)
    8000211c:	08100793          	li	a5,129
    80002120:	2ee7e063          	bltu	a5,a4,80002400 <interruptRoutine+0x390>
    80002124:	fc043703          	ld	a4,-64(s0)
    80002128:	04200793          	li	a5,66
    8000212c:	04e7e263          	bltu	a5,a4,80002170 <interruptRoutine+0x100>
    80002130:	fc043783          	ld	a5,-64(s0)
    80002134:	2c078663          	beqz	a5,80002400 <interruptRoutine+0x390>
    80002138:	fc043703          	ld	a4,-64(s0)
    8000213c:	04200793          	li	a5,66
    80002140:	2ce7e063          	bltu	a5,a4,80002400 <interruptRoutine+0x390>
    80002144:	fc043783          	ld	a5,-64(s0)
    80002148:	00279713          	slli	a4,a5,0x2
    8000214c:	00008797          	auipc	a5,0x8
    80002150:	fa878793          	addi	a5,a5,-88 # 8000a0f4 <_ZZ9kPrintIntmE6digits+0x84>
    80002154:	00f707b3          	add	a5,a4,a5
    80002158:	0007a783          	lw	a5,0(a5)
    8000215c:	0007871b          	sext.w	a4,a5
    80002160:	00008797          	auipc	a5,0x8
    80002164:	f9478793          	addi	a5,a5,-108 # 8000a0f4 <_ZZ9kPrintIntmE6digits+0x84>
    80002168:	00f707b3          	add	a5,a4,a5
    8000216c:	00078067          	jr	a5
    80002170:	fc043703          	ld	a4,-64(s0)
    80002174:	08000793          	li	a5,128
    80002178:	20f70263          	beq	a4,a5,8000237c <interruptRoutine+0x30c>
    8000217c:	2840006f          	j	80002400 <interruptRoutine+0x390>
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                //MemoryAllocator::kmalloc((size_t)a1 * MEM_BLOCK_SIZE);
                KMemory::kmalloc((size_t)a1);
    80002180:	fb843503          	ld	a0,-72(s0)
    80002184:	00000097          	auipc	ra,0x0
    80002188:	a88080e7          	jalr	-1400(ra) # 80001c0c <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    8000218c:	04a43823          	sd	a0,80(s0)
                break;
    80002190:	2cc0006f          	j	8000245c <interruptRoutine+0x3ec>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                //MemoryAllocator::kfree((void*)a1);
                KMemory::kfree((void*)a1);
    80002194:	fb843783          	ld	a5,-72(s0)
    80002198:	00078513          	mv	a0,a5
    8000219c:	00000097          	auipc	ra,0x0
    800021a0:	cb0080e7          	jalr	-848(ra) # 80001e4c <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    800021a4:	04a43823          	sd	a0,80(s0)
                break;
    800021a8:	2b40006f          	j	8000245c <interruptRoutine+0x3ec>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    800021ac:	fb043783          	ld	a5,-80(s0)
    800021b0:	fa843703          	ld	a4,-88(s0)
    800021b4:	fa043683          	ld	a3,-96(s0)
    800021b8:	fb843483          	ld	s1,-72(s0)
    800021bc:	00068613          	mv	a2,a3
    800021c0:	00070593          	mv	a1,a4
    800021c4:	00078513          	mv	a0,a5
    800021c8:	00001097          	auipc	ra,0x1
    800021cc:	c48080e7          	jalr	-952(ra) # 80002e10 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800021d0:	00050793          	mv	a5,a0
    800021d4:	00f4b023          	sd	a5,0(s1)
                if ((TCB::Body)a2 != nullptr) {
    800021d8:	fb043783          	ld	a5,-80(s0)
    800021dc:	02078863          	beqz	a5,8000220c <interruptRoutine+0x19c>
                    Scheduler::put(*((thread_t*)a1));
    800021e0:	fb843783          	ld	a5,-72(s0)
    800021e4:	0007b783          	ld	a5,0(a5)
    800021e8:	00078513          	mv	a0,a5
    800021ec:	00000097          	auipc	ra,0x0
    800021f0:	864080e7          	jalr	-1948(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
                    (*((thread_t*)a1))->setStatus(TCB::ACTIVE);
    800021f4:	fb843783          	ld	a5,-72(s0)
    800021f8:	0007b783          	ld	a5,0(a5)
    800021fc:	00100593          	li	a1,1
    80002200:	00078513          	mv	a0,a5
    80002204:	00000097          	auipc	ra,0x0
    80002208:	438080e7          	jalr	1080(ra) # 8000263c <_ZN3TCB9setStatusENS_12ThreadStatusE>
                }
                if (*((thread_t*)a1) != nullptr) {
    8000220c:	fb843783          	ld	a5,-72(s0)
    80002210:	0007b783          	ld	a5,0(a5)
    80002214:	00078663          	beqz	a5,80002220 <interruptRoutine+0x1b0>
                    __asm__ volatile("li a0, 0");
    80002218:	00000513          	li	a0,0
    8000221c:	0080006f          	j	80002224 <interruptRoutine+0x1b4>
                } else {
                    __asm__ volatile("li a0, -1");
    80002220:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002224:	04a43823          	sd	a0,80(s0)
                break;
    80002228:	2340006f          	j	8000245c <interruptRoutine+0x3ec>
            case 0x12:
                //thread_exit
                //TCB::running->setFinished(true);
                TCB::running->setStatus(TCB::FINISHED);
    8000222c:	0000b797          	auipc	a5,0xb
    80002230:	8e47b783          	ld	a5,-1820(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002234:	0007b783          	ld	a5,0(a5)
    80002238:	00500593          	li	a1,5
    8000223c:	00078513          	mv	a0,a5
    80002240:	00000097          	auipc	ra,0x0
    80002244:	3fc080e7          	jalr	1020(ra) # 8000263c <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined();
    80002248:	00001097          	auipc	ra,0x1
    8000224c:	ce8080e7          	jalr	-792(ra) # 80002f30 <_ZN3TCB13releaseJoinedEv>
                TCB::yield();
    80002250:	00001097          	auipc	ra,0x1
    80002254:	b70080e7          	jalr	-1168(ra) # 80002dc0 <_ZN3TCB5yieldEv>
                break;
    80002258:	2040006f          	j	8000245c <interruptRoutine+0x3ec>
            case 0x13:
                //thread_dispatch
                TCB::yield();
    8000225c:	00001097          	auipc	ra,0x1
    80002260:	b64080e7          	jalr	-1180(ra) # 80002dc0 <_ZN3TCB5yieldEv>
                //TCB::dispatch();
                break;
    80002264:	1f80006f          	j	8000245c <interruptRoutine+0x3ec>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    80002268:	fb843783          	ld	a5,-72(s0)
    8000226c:	00078513          	mv	a0,a5
    80002270:	00001097          	auipc	ra,0x1
    80002274:	c74080e7          	jalr	-908(ra) # 80002ee4 <_ZN3TCB10threadJoinEPS_>
                TCB::yield();
    80002278:	00001097          	auipc	ra,0x1
    8000227c:	b48080e7          	jalr	-1208(ra) # 80002dc0 <_ZN3TCB5yieldEv>
                break;
    80002280:	1dc0006f          	j	8000245c <interruptRoutine+0x3ec>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    80002284:	fb043783          	ld	a5,-80(s0)
    80002288:	0007879b          	sext.w	a5,a5
    8000228c:	fb843483          	ld	s1,-72(s0)
    80002290:	00078513          	mv	a0,a5
    80002294:	00001097          	auipc	ra,0x1
    80002298:	354080e7          	jalr	852(ra) # 800035e8 <_ZN4KSem7initSemEj>
    8000229c:	00050793          	mv	a5,a0
    800022a0:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    800022a4:	fb843783          	ld	a5,-72(s0)
    800022a8:	0007b783          	ld	a5,0(a5)
    800022ac:	00078663          	beqz	a5,800022b8 <interruptRoutine+0x248>
                    __asm__ volatile("li a0, 0");
    800022b0:	00000513          	li	a0,0
    800022b4:	0080006f          	j	800022bc <interruptRoutine+0x24c>
                } else {
                    __asm__ volatile("li a0, -1");
    800022b8:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800022bc:	04a43823          	sd	a0,80(s0)
                break;
    800022c0:	19c0006f          	j	8000245c <interruptRoutine+0x3ec>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    800022c4:	fb843783          	ld	a5,-72(s0)
    800022c8:	00078513          	mv	a0,a5
    800022cc:	00001097          	auipc	ra,0x1
    800022d0:	498080e7          	jalr	1176(ra) # 80003764 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    800022d4:	04a43823          	sd	a0,80(s0)
                break;
    800022d8:	1840006f          	j	8000245c <interruptRoutine+0x3ec>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    800022dc:	fb843783          	ld	a5,-72(s0)
    800022e0:	00078513          	mv	a0,a5
    800022e4:	00001097          	auipc	ra,0x1
    800022e8:	398080e7          	jalr	920(ra) # 8000367c <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    800022ec:	04a43823          	sd	a0,80(s0)
                break;
    800022f0:	16c0006f          	j	8000245c <interruptRoutine+0x3ec>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    800022f4:	fb843783          	ld	a5,-72(s0)
    800022f8:	00078513          	mv	a0,a5
    800022fc:	00001097          	auipc	ra,0x1
    80002300:	414080e7          	jalr	1044(ra) # 80003710 <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002304:	04a43823          	sd	a0,80(s0)
                break;
    80002308:	1540006f          	j	8000245c <interruptRoutine+0x3ec>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    8000230c:	fb843783          	ld	a5,-72(s0)
    80002310:	00078663          	beqz	a5,8000231c <interruptRoutine+0x2ac>
                    __asm__ volatile("li a0, 0");
    80002314:	00000513          	li	a0,0
    80002318:	0080006f          	j	80002320 <interruptRoutine+0x2b0>
                } else {
                    __asm__ volatile("li a0, -1");
    8000231c:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002320:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    80002324:	fb843783          	ld	a5,-72(s0)
    80002328:	12078863          	beqz	a5,80002458 <interruptRoutine+0x3e8>
                    Scheduler::putToSleep(TCB::running, (time_t)a1);
    8000232c:	0000a797          	auipc	a5,0xa
    80002330:	7e47b783          	ld	a5,2020(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002334:	0007b783          	ld	a5,0(a5)
    80002338:	fb843583          	ld	a1,-72(s0)
    8000233c:	00078513          	mv	a0,a5
    80002340:	fffff097          	auipc	ra,0xfffff
    80002344:	794080e7          	jalr	1940(ra) # 80001ad4 <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::yield();
    80002348:	00001097          	auipc	ra,0x1
    8000234c:	a78080e7          	jalr	-1416(ra) # 80002dc0 <_ZN3TCB5yieldEv>
                }
                break;
    80002350:	1080006f          	j	80002458 <interruptRoutine+0x3e8>
            case 0x41:
                //getc
                KConsole::kgetc();
    80002354:	fffff097          	auipc	ra,0xfffff
    80002358:	5e0080e7          	jalr	1504(ra) # 80001934 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    8000235c:	04a43823          	sd	a0,80(s0)
                break;
    80002360:	0fc0006f          	j	8000245c <interruptRoutine+0x3ec>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    80002364:	fb843783          	ld	a5,-72(s0)
    80002368:	0ff7f793          	andi	a5,a5,255
    8000236c:	00078513          	mv	a0,a5
    80002370:	fffff097          	auipc	ra,0xfffff
    80002374:	554080e7          	jalr	1364(ra) # 800018c4 <_ZN8KConsole5kputcEc>
                break;
    80002378:	0e40006f          	j	8000245c <interruptRoutine+0x3ec>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    8000237c:	fb043783          	ld	a5,-80(s0)
    80002380:	fa843703          	ld	a4,-88(s0)
    80002384:	fa043683          	ld	a3,-96(s0)
    80002388:	fb843483          	ld	s1,-72(s0)
    8000238c:	00068613          	mv	a2,a3
    80002390:	00070593          	mv	a1,a4
    80002394:	00078513          	mv	a0,a5
    80002398:	00001097          	auipc	ra,0x1
    8000239c:	a78080e7          	jalr	-1416(ra) # 80002e10 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800023a0:	00050793          	mv	a5,a0
    800023a4:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    800023a8:	fb843783          	ld	a5,-72(s0)
    800023ac:	0007b783          	ld	a5,0(a5)
    800023b0:	00078663          	beqz	a5,800023bc <interruptRoutine+0x34c>
                    __asm__ volatile("li a0, 0");
    800023b4:	00000513          	li	a0,0
    800023b8:	0080006f          	j	800023c0 <interruptRoutine+0x350>
                } else {
                    __asm__ volatile("li a0, -1");
    800023bc:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800023c0:	04a43823          	sd	a0,80(s0)
                break;
    800023c4:	0980006f          	j	8000245c <interruptRoutine+0x3ec>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                //if (((thread_t)a1)->getBody() != nullptr) {
                    Scheduler::put((thread_t)a1);
    800023c8:	fb843783          	ld	a5,-72(s0)
    800023cc:	00078513          	mv	a0,a5
    800023d0:	fffff097          	auipc	ra,0xfffff
    800023d4:	680080e7          	jalr	1664(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
                    ((thread_t)a1)->setStatus(TCB::ACTIVE);
    800023d8:	fb843783          	ld	a5,-72(s0)
    800023dc:	00100593          	li	a1,1
    800023e0:	00078513          	mv	a0,a5
    800023e4:	00000097          	auipc	ra,0x0
    800023e8:	258080e7          	jalr	600(ra) # 8000263c <_ZN3TCB9setStatusENS_12ThreadStatusE>
                //}
                break;
    800023ec:	0700006f          	j	8000245c <interruptRoutine+0x3ec>
            case 0x91:
                //printInteger
                //a1 = integer za ispis
                kPrintInt(a1);
    800023f0:	fb843503          	ld	a0,-72(s0)
    800023f4:	fffff097          	auipc	ra,0xfffff
    800023f8:	5cc080e7          	jalr	1484(ra) # 800019c0 <_Z9kPrintIntm>
                break;
    800023fc:	0600006f          	j	8000245c <interruptRoutine+0x3ec>
            default:
                printString("\nNepostojeci op code: ");
    80002400:	00008517          	auipc	a0,0x8
    80002404:	c8050513          	addi	a0,a0,-896 # 8000a080 <_ZZ9kPrintIntmE6digits+0x10>
    80002408:	00004097          	auipc	ra,0x4
    8000240c:	ab8080e7          	jalr	-1352(ra) # 80005ec0 <_Z11printStringPKc>
                kPrintInt(a0);
    80002410:	fc043503          	ld	a0,-64(s0)
    80002414:	fffff097          	auipc	ra,0xfffff
    80002418:	5ac080e7          	jalr	1452(ra) # 800019c0 <_Z9kPrintIntm>
                printString("\nscause: ");
    8000241c:	00008517          	auipc	a0,0x8
    80002420:	c7c50513          	addi	a0,a0,-900 # 8000a098 <_ZZ9kPrintIntmE6digits+0x28>
    80002424:	00004097          	auipc	ra,0x4
    80002428:	a9c080e7          	jalr	-1380(ra) # 80005ec0 <_Z11printStringPKc>
                kPrintInt(scause);
    8000242c:	fd843503          	ld	a0,-40(s0)
    80002430:	fffff097          	auipc	ra,0xfffff
    80002434:	590080e7          	jalr	1424(ra) # 800019c0 <_Z9kPrintIntm>
                printString("\nsepc: ");
    80002438:	00008517          	auipc	a0,0x8
    8000243c:	c7050513          	addi	a0,a0,-912 # 8000a0a8 <_ZZ9kPrintIntmE6digits+0x38>
    80002440:	00004097          	auipc	ra,0x4
    80002444:	a80080e7          	jalr	-1408(ra) # 80005ec0 <_Z11printStringPKc>
                kPrintInt(sepc);
    80002448:	fd043503          	ld	a0,-48(s0)
    8000244c:	fffff097          	auipc	ra,0xfffff
    80002450:	574080e7          	jalr	1396(ra) # 800019c0 <_Z9kPrintIntm>
                break;
    80002454:	0080006f          	j	8000245c <interruptRoutine+0x3ec>
                break;
    80002458:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    8000245c:	fd043783          	ld	a5,-48(s0)
    80002460:	00478793          	addi	a5,a5,4
    80002464:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002468:	fd043783          	ld	a5,-48(s0)
    8000246c:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002470:	fc843783          	ld	a5,-56(s0)
    80002474:	10079073          	csrw	sstatus,a5
        printString("scause: ");
        kPrintInt(scause);
        printString("\nsepc: ");
        kPrintInt(sepc);
    }
}
    80002478:	1900006f          	j	80002608 <interruptRoutine+0x598>
    } else if (scause == 0x8000000000000009) {
    8000247c:	fd843703          	ld	a4,-40(s0)
    80002480:	fff00793          	li	a5,-1
    80002484:	03f79793          	slli	a5,a5,0x3f
    80002488:	00978793          	addi	a5,a5,9
    8000248c:	08f71e63          	bne	a4,a5,80002528 <interruptRoutine+0x4b8>
        uint64 irq = plic_claim();
    80002490:	00005097          	auipc	ra,0x5
    80002494:	4d4080e7          	jalr	1236(ra) # 80007964 <plic_claim>
    80002498:	00050793          	mv	a5,a0
    8000249c:	f8f43023          	sd	a5,-128(s0)
        if (irq == CONSOLE_IRQ) {
    800024a0:	f8043703          	ld	a4,-128(s0)
    800024a4:	00a00793          	li	a5,10
    800024a8:	02f71e63          	bne	a4,a5,800024e4 <interruptRoutine+0x474>
            if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    800024ac:	0000a797          	auipc	a5,0xa
    800024b0:	68c7b783          	ld	a5,1676(a5) # 8000cb38 <_GLOBAL_OFFSET_TABLE_+0x80>
    800024b4:	0007b783          	ld	a5,0(a5)
    800024b8:	0007c783          	lbu	a5,0(a5)
    800024bc:	0017f793          	andi	a5,a5,1
    800024c0:	02078a63          	beqz	a5,800024f4 <interruptRoutine+0x484>
                KConsole::placeInInput(*KConsole::dr);
    800024c4:	0000a797          	auipc	a5,0xa
    800024c8:	63c7b783          	ld	a5,1596(a5) # 8000cb00 <_GLOBAL_OFFSET_TABLE_+0x48>
    800024cc:	0007b783          	ld	a5,0(a5)
    800024d0:	0007c783          	lbu	a5,0(a5)
    800024d4:	00078513          	mv	a0,a5
    800024d8:	fffff097          	auipc	ra,0xfffff
    800024dc:	380080e7          	jalr	896(ra) # 80001858 <_ZN8KConsole12placeInInputEc>
    800024e0:	0140006f          	j	800024f4 <interruptRoutine+0x484>
            printString("Neki drugi prekid\n");
    800024e4:	00008517          	auipc	a0,0x8
    800024e8:	bcc50513          	addi	a0,a0,-1076 # 8000a0b0 <_ZZ9kPrintIntmE6digits+0x40>
    800024ec:	00004097          	auipc	ra,0x4
    800024f0:	9d4080e7          	jalr	-1580(ra) # 80005ec0 <_Z11printStringPKc>
        plic_complete(irq);
    800024f4:	f8043783          	ld	a5,-128(s0)
    800024f8:	0007879b          	sext.w	a5,a5
    800024fc:	00078513          	mv	a0,a5
    80002500:	00005097          	auipc	ra,0x5
    80002504:	49c080e7          	jalr	1180(ra) # 8000799c <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002508:	fd043783          	ld	a5,-48(s0)
    8000250c:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002510:	fc843783          	ld	a5,-56(s0)
    80002514:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    80002518:	20000513          	li	a0,512
    8000251c:	00000097          	auipc	ra,0x0
    80002520:	104080e7          	jalr	260(ra) # 80002620 <_ZN5Riscv6mc_sipEm>
}
    80002524:	0e40006f          	j	80002608 <interruptRoutine+0x598>
    } else if (scause == 0x8000000000000001) {
    80002528:	fd843703          	ld	a4,-40(s0)
    8000252c:	fff00793          	li	a5,-1
    80002530:	03f79793          	slli	a5,a5,0x3f
    80002534:	00178793          	addi	a5,a5,1
    80002538:	08f71463          	bne	a4,a5,800025c0 <interruptRoutine+0x550>
        Scheduler::wake();
    8000253c:	fffff097          	auipc	ra,0xfffff
    80002540:	648080e7          	jalr	1608(ra) # 80001b84 <_ZN9Scheduler4wakeEv>
        TCB::runningTimeSlice++;
    80002544:	0000a797          	auipc	a5,0xa
    80002548:	58c7b783          	ld	a5,1420(a5) # 8000cad0 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000254c:	0007b783          	ld	a5,0(a5)
    80002550:	00178713          	addi	a4,a5,1
    80002554:	0000a797          	auipc	a5,0xa
    80002558:	57c7b783          	ld	a5,1404(a5) # 8000cad0 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000255c:	00e7b023          	sd	a4,0(a5)
        if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    80002560:	0000a797          	auipc	a5,0xa
    80002564:	5b07b783          	ld	a5,1456(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002568:	0007b783          	ld	a5,0(a5)
    8000256c:	00078513          	mv	a0,a5
    80002570:	00000097          	auipc	ra,0x0
    80002574:	0e8080e7          	jalr	232(ra) # 80002658 <_ZN3TCB12getTimeSliceEv>
    80002578:	00050713          	mv	a4,a0
    8000257c:	0000a797          	auipc	a5,0xa
    80002580:	5547b783          	ld	a5,1364(a5) # 8000cad0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002584:	0007b783          	ld	a5,0(a5)
    80002588:	00e7b7b3          	sltu	a5,a5,a4
    8000258c:	0017c793          	xori	a5,a5,1
    80002590:	0ff7f793          	andi	a5,a5,255
    80002594:	00078663          	beqz	a5,800025a0 <interruptRoutine+0x530>
            TCB::yield();
    80002598:	00001097          	auipc	ra,0x1
    8000259c:	828080e7          	jalr	-2008(ra) # 80002dc0 <_ZN3TCB5yieldEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800025a0:	fd043783          	ld	a5,-48(s0)
    800025a4:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800025a8:	fc843783          	ld	a5,-56(s0)
    800025ac:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    800025b0:	00200513          	li	a0,2
    800025b4:	00000097          	auipc	ra,0x0
    800025b8:	06c080e7          	jalr	108(ra) # 80002620 <_ZN5Riscv6mc_sipEm>
}
    800025bc:	04c0006f          	j	80002608 <interruptRoutine+0x598>
        printString("\nGreska u prekidnoj rutini\n");
    800025c0:	00008517          	auipc	a0,0x8
    800025c4:	b0850513          	addi	a0,a0,-1272 # 8000a0c8 <_ZZ9kPrintIntmE6digits+0x58>
    800025c8:	00004097          	auipc	ra,0x4
    800025cc:	8f8080e7          	jalr	-1800(ra) # 80005ec0 <_Z11printStringPKc>
        printString("scause: ");
    800025d0:	00008517          	auipc	a0,0x8
    800025d4:	b1850513          	addi	a0,a0,-1256 # 8000a0e8 <_ZZ9kPrintIntmE6digits+0x78>
    800025d8:	00004097          	auipc	ra,0x4
    800025dc:	8e8080e7          	jalr	-1816(ra) # 80005ec0 <_Z11printStringPKc>
        kPrintInt(scause);
    800025e0:	fd843503          	ld	a0,-40(s0)
    800025e4:	fffff097          	auipc	ra,0xfffff
    800025e8:	3dc080e7          	jalr	988(ra) # 800019c0 <_Z9kPrintIntm>
        printString("\nsepc: ");
    800025ec:	00008517          	auipc	a0,0x8
    800025f0:	abc50513          	addi	a0,a0,-1348 # 8000a0a8 <_ZZ9kPrintIntmE6digits+0x38>
    800025f4:	00004097          	auipc	ra,0x4
    800025f8:	8cc080e7          	jalr	-1844(ra) # 80005ec0 <_Z11printStringPKc>
        kPrintInt(sepc);
    800025fc:	fd043503          	ld	a0,-48(s0)
    80002600:	fffff097          	auipc	ra,0xfffff
    80002604:	3c0080e7          	jalr	960(ra) # 800019c0 <_Z9kPrintIntm>
}
    80002608:	00000013          	nop
    8000260c:	07813083          	ld	ra,120(sp)
    80002610:	07013403          	ld	s0,112(sp)
    80002614:	06813483          	ld	s1,104(sp)
    80002618:	08010113          	addi	sp,sp,128
    8000261c:	00008067          	ret

0000000080002620 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80002620:	ff010113          	addi	sp,sp,-16
    80002624:	00813423          	sd	s0,8(sp)
    80002628:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    8000262c:	14453073          	csrc	sip,a0
}
    80002630:	00813403          	ld	s0,8(sp)
    80002634:	01010113          	addi	sp,sp,16
    80002638:	00008067          	ret

000000008000263c <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    8000263c:	ff010113          	addi	sp,sp,-16
    80002640:	00813423          	sd	s0,8(sp)
    80002644:	01010413          	addi	s0,sp,16
    80002648:	04b52c23          	sw	a1,88(a0)
    8000264c:	00813403          	ld	s0,8(sp)
    80002650:	01010113          	addi	sp,sp,16
    80002654:	00008067          	ret

0000000080002658 <_ZN3TCB12getTimeSliceEv>:
//
//    bool isBlocked() { return blocked; }
//
//    void setBlocked(bool block) { this->blocked = block; }

    uint64 getTimeSlice() { return timeSlice; }
    80002658:	ff010113          	addi	sp,sp,-16
    8000265c:	00813423          	sd	s0,8(sp)
    80002660:	01010413          	addi	s0,sp,16
    80002664:	02853503          	ld	a0,40(a0)
    80002668:	00813403          	ld	s0,8(sp)
    8000266c:	01010113          	addi	sp,sp,16
    80002670:	00008067          	ret

0000000080002674 <_ZN6Thread7wrapperEPv>:

	__asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
	if (thread != nullptr) {
    80002674:	02050863          	beqz	a0,800026a4 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80002678:	ff010113          	addi	sp,sp,-16
    8000267c:	00113423          	sd	ra,8(sp)
    80002680:	00813023          	sd	s0,0(sp)
    80002684:	01010413          	addi	s0,sp,16
		((Thread*)thread)->run();
    80002688:	00053783          	ld	a5,0(a0)
    8000268c:	0107b783          	ld	a5,16(a5)
    80002690:	000780e7          	jalr	a5
	}
}
    80002694:	00813083          	ld	ra,8(sp)
    80002698:	00013403          	ld	s0,0(sp)
    8000269c:	01010113          	addi	sp,sp,16
    800026a0:	00008067          	ret
    800026a4:	00008067          	ret

00000000800026a8 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800026a8:	fe010113          	addi	sp,sp,-32
    800026ac:	00113c23          	sd	ra,24(sp)
    800026b0:	00813823          	sd	s0,16(sp)
    800026b4:	00913423          	sd	s1,8(sp)
    800026b8:	02010413          	addi	s0,sp,32
    800026bc:	00050493          	mv	s1,a0
    800026c0:	0000a797          	auipc	a5,0xa
    800026c4:	21078793          	addi	a5,a5,528 # 8000c8d0 <_ZTV6Thread+0x10>
    800026c8:	00f53023          	sd	a5,0(a0)
	thread_join(this->myHandle);
    800026cc:	00853503          	ld	a0,8(a0)
    800026d0:	fffff097          	auipc	ra,0xfffff
    800026d4:	d78080e7          	jalr	-648(ra) # 80001448 <_Z11thread_joinP3TCB>
	delete myHandle;
    800026d8:	0084b483          	ld	s1,8(s1)
    800026dc:	02048863          	beqz	s1,8000270c <_ZN6ThreadD1Ev+0x64>
            delete node;
        }
    }

    bool isEmpty() const {
        bool ret = front == nullptr;
    800026e0:	0484b503          	ld	a0,72(s1)
        while (!isEmpty()) {
    800026e4:	00050e63          	beqz	a0,80002700 <_ZN6ThreadD1Ev+0x58>
            front = front->next;
    800026e8:	00853783          	ld	a5,8(a0)
    800026ec:	04f4b423          	sd	a5,72(s1)
            delete node;
    800026f0:	fe0508e3          	beqz	a0,800026e0 <_ZN6ThreadD1Ev+0x38>
            mem_free(ptr);
    800026f4:	fffff097          	auipc	ra,0xfffff
    800026f8:	c5c080e7          	jalr	-932(ra) # 80001350 <_Z8mem_freePv>
        }
    800026fc:	fe5ff06f          	j	800026e0 <_ZN6ThreadD1Ev+0x38>
    80002700:	00048513          	mv	a0,s1
    80002704:	00000097          	auipc	ra,0x0
    80002708:	7b8080e7          	jalr	1976(ra) # 80002ebc <_ZN3TCBdlEPv>
}
    8000270c:	01813083          	ld	ra,24(sp)
    80002710:	01013403          	ld	s0,16(sp)
    80002714:	00813483          	ld	s1,8(sp)
    80002718:	02010113          	addi	sp,sp,32
    8000271c:	00008067          	ret

0000000080002720 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
	sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002720:	fe010113          	addi	sp,sp,-32
    80002724:	00113c23          	sd	ra,24(sp)
    80002728:	00813823          	sd	s0,16(sp)
    8000272c:	00913423          	sd	s1,8(sp)
    80002730:	02010413          	addi	s0,sp,32
    80002734:	00050493          	mv	s1,a0
    80002738:	0000a797          	auipc	a5,0xa
    8000273c:	1c078793          	addi	a5,a5,448 # 8000c8f8 <_ZTV9Semaphore+0x10>
    80002740:	00f53023          	sd	a5,0(a0)
	sem_close(myHandle);
    80002744:	00853503          	ld	a0,8(a0)
    80002748:	fffff097          	auipc	ra,0xfffff
    8000274c:	d90080e7          	jalr	-624(ra) # 800014d8 <_Z9sem_closeP4KSem>
	delete myHandle;
    80002750:	0084b483          	ld	s1,8(s1)
    80002754:	02048863          	beqz	s1,80002784 <_ZN9SemaphoreD1Ev+0x64>
        bool ret = front == nullptr;
    80002758:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    8000275c:	00050e63          	beqz	a0,80002778 <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    80002760:	00853783          	ld	a5,8(a0)
    80002764:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002768:	fe0508e3          	beqz	a0,80002758 <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    8000276c:	fffff097          	auipc	ra,0xfffff
    80002770:	be4080e7          	jalr	-1052(ra) # 80001350 <_Z8mem_freePv>
        }
    80002774:	fe5ff06f          	j	80002758 <_ZN9SemaphoreD1Ev+0x38>
    80002778:	00048513          	mv	a0,s1
    8000277c:	00001097          	auipc	ra,0x1
    80002780:	e44080e7          	jalr	-444(ra) # 800035c0 <_ZN4KSemdlEPv>
}
    80002784:	01813083          	ld	ra,24(sp)
    80002788:	01013403          	ld	s0,16(sp)
    8000278c:	00813483          	ld	s1,8(sp)
    80002790:	02010113          	addi	sp,sp,32
    80002794:	00008067          	ret

0000000080002798 <_Znwm>:
void* operator new(size_t size) {
    80002798:	ff010113          	addi	sp,sp,-16
    8000279c:	00113423          	sd	ra,8(sp)
    800027a0:	00813023          	sd	s0,0(sp)
    800027a4:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800027a8:	fffff097          	auipc	ra,0xfffff
    800027ac:	b68080e7          	jalr	-1176(ra) # 80001310 <_Z9mem_allocm>
}
    800027b0:	00813083          	ld	ra,8(sp)
    800027b4:	00013403          	ld	s0,0(sp)
    800027b8:	01010113          	addi	sp,sp,16
    800027bc:	00008067          	ret

00000000800027c0 <_Znam>:
void* operator new[](size_t size) {
    800027c0:	ff010113          	addi	sp,sp,-16
    800027c4:	00113423          	sd	ra,8(sp)
    800027c8:	00813023          	sd	s0,0(sp)
    800027cc:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800027d0:	fffff097          	auipc	ra,0xfffff
    800027d4:	b40080e7          	jalr	-1216(ra) # 80001310 <_Z9mem_allocm>
}
    800027d8:	00813083          	ld	ra,8(sp)
    800027dc:	00013403          	ld	s0,0(sp)
    800027e0:	01010113          	addi	sp,sp,16
    800027e4:	00008067          	ret

00000000800027e8 <_ZdlPv>:
noexcept {
    800027e8:	ff010113          	addi	sp,sp,-16
    800027ec:	00113423          	sd	ra,8(sp)
    800027f0:	00813023          	sd	s0,0(sp)
    800027f4:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800027f8:	fffff097          	auipc	ra,0xfffff
    800027fc:	b58080e7          	jalr	-1192(ra) # 80001350 <_Z8mem_freePv>
}
    80002800:	00813083          	ld	ra,8(sp)
    80002804:	00013403          	ld	s0,0(sp)
    80002808:	01010113          	addi	sp,sp,16
    8000280c:	00008067          	ret

0000000080002810 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002810:	fe010113          	addi	sp,sp,-32
    80002814:	00113c23          	sd	ra,24(sp)
    80002818:	00813823          	sd	s0,16(sp)
    8000281c:	00913423          	sd	s1,8(sp)
    80002820:	02010413          	addi	s0,sp,32
    80002824:	00050493          	mv	s1,a0
}
    80002828:	00000097          	auipc	ra,0x0
    8000282c:	e80080e7          	jalr	-384(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80002830:	00048513          	mv	a0,s1
    80002834:	00000097          	auipc	ra,0x0
    80002838:	fb4080e7          	jalr	-76(ra) # 800027e8 <_ZdlPv>
    8000283c:	01813083          	ld	ra,24(sp)
    80002840:	01013403          	ld	s0,16(sp)
    80002844:	00813483          	ld	s1,8(sp)
    80002848:	02010113          	addi	sp,sp,32
    8000284c:	00008067          	ret

0000000080002850 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002850:	fe010113          	addi	sp,sp,-32
    80002854:	00113c23          	sd	ra,24(sp)
    80002858:	00813823          	sd	s0,16(sp)
    8000285c:	00913423          	sd	s1,8(sp)
    80002860:	02010413          	addi	s0,sp,32
    80002864:	00050493          	mv	s1,a0
}
    80002868:	00000097          	auipc	ra,0x0
    8000286c:	eb8080e7          	jalr	-328(ra) # 80002720 <_ZN9SemaphoreD1Ev>
    80002870:	00048513          	mv	a0,s1
    80002874:	00000097          	auipc	ra,0x0
    80002878:	f74080e7          	jalr	-140(ra) # 800027e8 <_ZdlPv>
    8000287c:	01813083          	ld	ra,24(sp)
    80002880:	01013403          	ld	s0,16(sp)
    80002884:	00813483          	ld	s1,8(sp)
    80002888:	02010113          	addi	sp,sp,32
    8000288c:	00008067          	ret

0000000080002890 <_ZdaPv>:
noexcept {
    80002890:	ff010113          	addi	sp,sp,-16
    80002894:	00113423          	sd	ra,8(sp)
    80002898:	00813023          	sd	s0,0(sp)
    8000289c:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800028a0:	fffff097          	auipc	ra,0xfffff
    800028a4:	ab0080e7          	jalr	-1360(ra) # 80001350 <_Z8mem_freePv>
}
    800028a8:	00813083          	ld	ra,8(sp)
    800028ac:	00013403          	ld	s0,0(sp)
    800028b0:	01010113          	addi	sp,sp,16
    800028b4:	00008067          	ret

00000000800028b8 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    800028b8:	fd010113          	addi	sp,sp,-48
    800028bc:	02113423          	sd	ra,40(sp)
    800028c0:	02813023          	sd	s0,32(sp)
    800028c4:	00913c23          	sd	s1,24(sp)
    800028c8:	01213823          	sd	s2,16(sp)
    800028cc:	01313423          	sd	s3,8(sp)
    800028d0:	03010413          	addi	s0,sp,48
    800028d4:	00050493          	mv	s1,a0
    800028d8:	00058913          	mv	s2,a1
    800028dc:	00060993          	mv	s3,a2
    800028e0:	0000a797          	auipc	a5,0xa
    800028e4:	ff078793          	addi	a5,a5,-16 # 8000c8d0 <_ZTV6Thread+0x10>
    800028e8:	00f53023          	sd	a5,0(a0)
	this->body = body;
    800028ec:	00b53823          	sd	a1,16(a0)
	this->arg = arg;
    800028f0:	00c53c23          	sd	a2,24(a0)
	if (body != nullptr) {
    800028f4:	04058663          	beqz	a1,80002940 <_ZN6ThreadC1EPFvPvES0_+0x88>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800028f8:	00001537          	lui	a0,0x1
    800028fc:	fffff097          	auipc	ra,0xfffff
    80002900:	a14080e7          	jalr	-1516(ra) # 80001310 <_Z9mem_allocm>
    80002904:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002908:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000290c:	00098693          	mv	a3,s3
			body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002910:	00090613          	mv	a2,s2
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002914:	00848493          	addi	s1,s1,8
    80002918:	00048593          	mv	a1,s1
	__asm__ volatile("li a0, 0x80");
    8000291c:	08000513          	li	a0,128
	__asm__ volatile("ecall");
    80002920:	00000073          	ecall
}
    80002924:	02813083          	ld	ra,40(sp)
    80002928:	02013403          	ld	s0,32(sp)
    8000292c:	01813483          	ld	s1,24(sp)
    80002930:	01013903          	ld	s2,16(sp)
    80002934:	00813983          	ld	s3,8(sp)
    80002938:	03010113          	addi	sp,sp,48
    8000293c:	00008067          	ret
	uint64* stack = nullptr;
    80002940:	00000313          	li	t1,0
    80002944:	fc5ff06f          	j	80002908 <_ZN6ThreadC1EPFvPvES0_+0x50>

0000000080002948 <_ZN6Thread5startEv>:
int Thread::start() {
    80002948:	ff010113          	addi	sp,sp,-16
    8000294c:	00813423          	sd	s0,8(sp)
    80002950:	01010413          	addi	s0,sp,16
	if (myHandle == nullptr) return -1;
    80002954:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002958:	02030063          	beqz	t1,80002978 <_ZN6Thread5startEv+0x30>
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000295c:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x81");
    80002960:	08100513          	li	a0,129
	__asm__ volatile("ecall");
    80002964:	00000073          	ecall
	return 0;
    80002968:	00000513          	li	a0,0
}
    8000296c:	00813403          	ld	s0,8(sp)
    80002970:	01010113          	addi	sp,sp,16
    80002974:	00008067          	ret
	if (myHandle == nullptr) return -1;
    80002978:	fff00513          	li	a0,-1
    8000297c:	ff1ff06f          	j	8000296c <_ZN6Thread5startEv+0x24>

0000000080002980 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002980:	ff010113          	addi	sp,sp,-16
    80002984:	00113423          	sd	ra,8(sp)
    80002988:	00813023          	sd	s0,0(sp)
    8000298c:	01010413          	addi	s0,sp,16
	thread_join(myHandle);
    80002990:	00853503          	ld	a0,8(a0)
    80002994:	fffff097          	auipc	ra,0xfffff
    80002998:	ab4080e7          	jalr	-1356(ra) # 80001448 <_Z11thread_joinP3TCB>
}
    8000299c:	00813083          	ld	ra,8(sp)
    800029a0:	00013403          	ld	s0,0(sp)
    800029a4:	01010113          	addi	sp,sp,16
    800029a8:	00008067          	ret

00000000800029ac <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800029ac:	ff010113          	addi	sp,sp,-16
    800029b0:	00113423          	sd	ra,8(sp)
    800029b4:	00813023          	sd	s0,0(sp)
    800029b8:	01010413          	addi	s0,sp,16
	thread_dispatch();
    800029bc:	fffff097          	auipc	ra,0xfffff
    800029c0:	a6c080e7          	jalr	-1428(ra) # 80001428 <_Z15thread_dispatchv>
}
    800029c4:	00813083          	ld	ra,8(sp)
    800029c8:	00013403          	ld	s0,0(sp)
    800029cc:	01010113          	addi	sp,sp,16
    800029d0:	00008067          	ret

00000000800029d4 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    800029d4:	ff010113          	addi	sp,sp,-16
    800029d8:	00113423          	sd	ra,8(sp)
    800029dc:	00813023          	sd	s0,0(sp)
    800029e0:	01010413          	addi	s0,sp,16
    time_sleep(t);
    800029e4:	fffff097          	auipc	ra,0xfffff
    800029e8:	a8c080e7          	jalr	-1396(ra) # 80001470 <_Z10time_sleepm>
}
    800029ec:	00000513          	li	a0,0
    800029f0:	00813083          	ld	ra,8(sp)
    800029f4:	00013403          	ld	s0,0(sp)
    800029f8:	01010113          	addi	sp,sp,16
    800029fc:	00008067          	ret

0000000080002a00 <_ZN14PeriodicThread15periodicWrapperEPv>:
}

PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
}

void PeriodicThread::periodicWrapper(void* pThread) {
    80002a00:	fe010113          	addi	sp,sp,-32
    80002a04:	00113c23          	sd	ra,24(sp)
    80002a08:	00813823          	sd	s0,16(sp)
    80002a0c:	00913423          	sd	s1,8(sp)
    80002a10:	02010413          	addi	s0,sp,32
    80002a14:	00050493          	mv	s1,a0
	if (pThread != nullptr) {
    80002a18:	02050263          	beqz	a0,80002a3c <_ZN14PeriodicThread15periodicWrapperEPv+0x3c>
		PeriodicThread* ptr = (PeriodicThread*)pThread;
		while (1) {
			ptr->periodicActivation();
    80002a1c:	0004b783          	ld	a5,0(s1)
    80002a20:	0187b783          	ld	a5,24(a5)
    80002a24:	00048513          	mv	a0,s1
    80002a28:	000780e7          	jalr	a5
			Thread::sleep(ptr->period);
    80002a2c:	0204b503          	ld	a0,32(s1)
    80002a30:	00000097          	auipc	ra,0x0
    80002a34:	fa4080e7          	jalr	-92(ra) # 800029d4 <_ZN6Thread5sleepEm>
		while (1) {
    80002a38:	fe5ff06f          	j	80002a1c <_ZN14PeriodicThread15periodicWrapperEPv+0x1c>
		}
	}
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
    80002a6c:	e6878793          	addi	a5,a5,-408 # 8000c8d0 <_ZTV6Thread+0x10>
    80002a70:	00f53023          	sd	a5,0(a0)
	this->body = wrapper;
    80002a74:	00000797          	auipc	a5,0x0
    80002a78:	c0078793          	addi	a5,a5,-1024 # 80002674 <_ZN6Thread7wrapperEPv>
    80002a7c:	00f53823          	sd	a5,16(a0)
	this->arg = this;
    80002a80:	00a53c23          	sd	a0,24(a0)
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002a84:	00001537          	lui	a0,0x1
    80002a88:	fffff097          	auipc	ra,0xfffff
    80002a8c:	888080e7          	jalr	-1912(ra) # 80001310 <_Z9mem_allocm>
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
    80002ae0:	e1c78793          	addi	a5,a5,-484 # 8000c8f8 <_ZTV9Semaphore+0x10>
    80002ae4:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
	sem_open(&myHandle, init);
    80002ae8:	00850513          	addi	a0,a0,8
    80002aec:	fffff097          	auipc	ra,0xfffff
    80002af0:	9b4080e7          	jalr	-1612(ra) # 800014a0 <_Z8sem_openPP4KSemj>
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
    80002b1c:	9f0080e7          	jalr	-1552(ra) # 80001508 <_Z8sem_waitP4KSem>
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
    80002b48:	9f4080e7          	jalr	-1548(ra) # 80001538 <_Z10sem_signalP4KSem>
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
}
    80002b68:	00813403          	ld	s0,8(sp)
    80002b6c:	01010113          	addi	sp,sp,16
    80002b70:	00008067          	ret

0000000080002b74 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, this), period(period) {
    80002b74:	fe010113          	addi	sp,sp,-32
    80002b78:	00113c23          	sd	ra,24(sp)
    80002b7c:	00813823          	sd	s0,16(sp)
    80002b80:	00913423          	sd	s1,8(sp)
    80002b84:	01213023          	sd	s2,0(sp)
    80002b88:	02010413          	addi	s0,sp,32
    80002b8c:	00050493          	mv	s1,a0
    80002b90:	00058913          	mv	s2,a1
    80002b94:	00050613          	mv	a2,a0
    80002b98:	00000597          	auipc	a1,0x0
    80002b9c:	e6858593          	addi	a1,a1,-408 # 80002a00 <_ZN14PeriodicThread15periodicWrapperEPv>
    80002ba0:	00000097          	auipc	ra,0x0
    80002ba4:	d18080e7          	jalr	-744(ra) # 800028b8 <_ZN6ThreadC1EPFvPvES0_>
    80002ba8:	0000a797          	auipc	a5,0xa
    80002bac:	cf878793          	addi	a5,a5,-776 # 8000c8a0 <_ZTV14PeriodicThread+0x10>
    80002bb0:	00f4b023          	sd	a5,0(s1)
    80002bb4:	0324b023          	sd	s2,32(s1)
}
    80002bb8:	01813083          	ld	ra,24(sp)
    80002bbc:	01013403          	ld	s0,16(sp)
    80002bc0:	00813483          	ld	s1,8(sp)
    80002bc4:	00013903          	ld	s2,0(sp)
    80002bc8:	02010113          	addi	sp,sp,32
    80002bcc:	00008067          	ret

0000000080002bd0 <_ZN7Console4getcEv>:

char Console::getc() {
    80002bd0:	ff010113          	addi	sp,sp,-16
    80002bd4:	00113423          	sd	ra,8(sp)
    80002bd8:	00813023          	sd	s0,0(sp)
    80002bdc:	01010413          	addi	s0,sp,16
	return ::getc();
    80002be0:	fffff097          	auipc	ra,0xfffff
    80002be4:	988080e7          	jalr	-1656(ra) # 80001568 <_Z4getcv>
}
    80002be8:	00813083          	ld	ra,8(sp)
    80002bec:	00013403          	ld	s0,0(sp)
    80002bf0:	01010113          	addi	sp,sp,16
    80002bf4:	00008067          	ret

0000000080002bf8 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002bf8:	ff010113          	addi	sp,sp,-16
    80002bfc:	00113423          	sd	ra,8(sp)
    80002c00:	00813023          	sd	s0,0(sp)
    80002c04:	01010413          	addi	s0,sp,16
	::putc(c);
    80002c08:	fffff097          	auipc	ra,0xfffff
    80002c0c:	988080e7          	jalr	-1656(ra) # 80001590 <_Z4putcc>
}
    80002c10:	00813083          	ld	ra,8(sp)
    80002c14:	00013403          	ld	s0,0(sp)
    80002c18:	01010113          	addi	sp,sp,16
    80002c1c:	00008067          	ret

0000000080002c20 <_ZN6Thread3runEv>:
	static int sleep(time_t);

protected:
	Thread();

	virtual void run() {}
    80002c20:	ff010113          	addi	sp,sp,-16
    80002c24:	00813423          	sd	s0,8(sp)
    80002c28:	01010413          	addi	s0,sp,16
    80002c2c:	00813403          	ld	s0,8(sp)
    80002c30:	01010113          	addi	sp,sp,16
    80002c34:	00008067          	ret

0000000080002c38 <_ZN14PeriodicThread18periodicActivationEv>:
	void terminate();

protected:
	PeriodicThread(time_t period);

	virtual void periodicActivation() {}
    80002c38:	ff010113          	addi	sp,sp,-16
    80002c3c:	00813423          	sd	s0,8(sp)
    80002c40:	01010413          	addi	s0,sp,16
    80002c44:	00813403          	ld	s0,8(sp)
    80002c48:	01010113          	addi	sp,sp,16
    80002c4c:	00008067          	ret

0000000080002c50 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002c50:	ff010113          	addi	sp,sp,-16
    80002c54:	00113423          	sd	ra,8(sp)
    80002c58:	00813023          	sd	s0,0(sp)
    80002c5c:	01010413          	addi	s0,sp,16
    80002c60:	0000a797          	auipc	a5,0xa
    80002c64:	c4078793          	addi	a5,a5,-960 # 8000c8a0 <_ZTV14PeriodicThread+0x10>
    80002c68:	00f53023          	sd	a5,0(a0)
    80002c6c:	00000097          	auipc	ra,0x0
    80002c70:	a3c080e7          	jalr	-1476(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80002c74:	00813083          	ld	ra,8(sp)
    80002c78:	00013403          	ld	s0,0(sp)
    80002c7c:	01010113          	addi	sp,sp,16
    80002c80:	00008067          	ret

0000000080002c84 <_ZN14PeriodicThreadD0Ev>:
    80002c84:	fe010113          	addi	sp,sp,-32
    80002c88:	00113c23          	sd	ra,24(sp)
    80002c8c:	00813823          	sd	s0,16(sp)
    80002c90:	00913423          	sd	s1,8(sp)
    80002c94:	02010413          	addi	s0,sp,32
    80002c98:	00050493          	mv	s1,a0
    80002c9c:	0000a797          	auipc	a5,0xa
    80002ca0:	c0478793          	addi	a5,a5,-1020 # 8000c8a0 <_ZTV14PeriodicThread+0x10>
    80002ca4:	00f53023          	sd	a5,0(a0)
    80002ca8:	00000097          	auipc	ra,0x0
    80002cac:	a00080e7          	jalr	-1536(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80002cb0:	00048513          	mv	a0,s1
    80002cb4:	00000097          	auipc	ra,0x0
    80002cb8:	b34080e7          	jalr	-1228(ra) # 800027e8 <_ZdlPv>
    80002cbc:	01813083          	ld	ra,24(sp)
    80002cc0:	01013403          	ld	s0,16(sp)
    80002cc4:	00813483          	ld	s1,8(sp)
    80002cc8:	02010113          	addi	sp,sp,32
    80002ccc:	00008067          	ret

0000000080002cd0 <_ZN3TCB7wrapperEv>:
    //Riscv::pushRegisters();
    TCB::dispatch();
    //Riscv::popRegisters();
}

void TCB::wrapper() {
    80002cd0:	ff010113          	addi	sp,sp,-16
    80002cd4:	00113423          	sd	ra,8(sp)
    80002cd8:	00813023          	sd	s0,0(sp)
    80002cdc:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
    Riscv::popSppSpie();
    80002ce0:	00000097          	auipc	ra,0x0
    80002ce4:	2f8080e7          	jalr	760(ra) # 80002fd8 <_ZN5Riscv10popSppSpieEv>
    //na dalje se izvrsavamo u user modu
    running->threadFunction(running->args);
    80002ce8:	0000a797          	auipc	a5,0xa
    80002cec:	fa87b783          	ld	a5,-88(a5) # 8000cc90 <_ZN3TCB7runningE>
    80002cf0:	0107b703          	ld	a4,16(a5)
    80002cf4:	0207b503          	ld	a0,32(a5)
    80002cf8:	000700e7          	jalr	a4
    //running->finished = true;
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    80002cfc:	ffffe097          	auipc	ra,0xffffe
    80002d00:	704080e7          	jalr	1796(ra) # 80001400 <_Z11thread_exitv>
}
    80002d04:	00813083          	ld	ra,8(sp)
    80002d08:	00013403          	ld	s0,0(sp)
    80002d0c:	01010113          	addi	sp,sp,16
    80002d10:	00008067          	ret

0000000080002d14 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002d14:	fe010113          	addi	sp,sp,-32
    80002d18:	00113c23          	sd	ra,24(sp)
    80002d1c:	00813823          	sd	s0,16(sp)
    80002d20:	00913423          	sd	s1,8(sp)
    80002d24:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    80002d28:	0000a497          	auipc	s1,0xa
    80002d2c:	f684b483          	ld	s1,-152(s1) # 8000cc90 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    80002d30:	0584a703          	lw	a4,88(s1)
    80002d34:	00100793          	li	a5,1
    80002d38:	04f70663          	beq	a4,a5,80002d84 <_ZN3TCB8dispatchEv+0x70>
    TCB::running = Scheduler::get();
    80002d3c:	fffff097          	auipc	ra,0xfffff
    80002d40:	d58080e7          	jalr	-680(ra) # 80001a94 <_ZN9Scheduler3getEv>
    80002d44:	00050593          	mv	a1,a0
    80002d48:	0000a797          	auipc	a5,0xa
    80002d4c:	f4878793          	addi	a5,a5,-184 # 8000cc90 <_ZN3TCB7runningE>
    80002d50:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80002d54:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == nullptr || TCB::running->threadFunction == kernelConsumerFunction ||
    80002d58:	01053783          	ld	a5,16(a0)
    80002d5c:	02078c63          	beqz	a5,80002d94 <_ZN3TCB8dispatchEv+0x80>
    80002d60:	0000a717          	auipc	a4,0xa
    80002d64:	d8873703          	ld	a4,-632(a4) # 8000cae8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002d68:	02e78663          	beq	a5,a4,80002d94 <_ZN3TCB8dispatchEv+0x80>
    80002d6c:	0000a717          	auipc	a4,0xa
    80002d70:	dbc73703          	ld	a4,-580(a4) # 8000cb28 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002d74:	02e78063          	beq	a5,a4,80002d94 <_ZN3TCB8dispatchEv+0x80>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002d78:	10000793          	li	a5,256
    80002d7c:	1007b073          	csrc	sstatus,a5
}
    80002d80:	01c0006f          	j	80002d9c <_ZN3TCB8dispatchEv+0x88>
        Scheduler::put(old);
    80002d84:	00048513          	mv	a0,s1
    80002d88:	fffff097          	auipc	ra,0xfffff
    80002d8c:	cc8080e7          	jalr	-824(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
    80002d90:	fadff06f          	j	80002d3c <_ZN3TCB8dispatchEv+0x28>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002d94:	10000793          	li	a5,256
    80002d98:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002d9c:	00b48863          	beq	s1,a1,80002dac <_ZN3TCB8dispatchEv+0x98>
    80002da0:	00048513          	mv	a0,s1
    80002da4:	ffffe097          	auipc	ra,0xffffe
    80002da8:	46c080e7          	jalr	1132(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002dac:	01813083          	ld	ra,24(sp)
    80002db0:	01013403          	ld	s0,16(sp)
    80002db4:	00813483          	ld	s1,8(sp)
    80002db8:	02010113          	addi	sp,sp,32
    80002dbc:	00008067          	ret

0000000080002dc0 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002dc0:	ff010113          	addi	sp,sp,-16
    80002dc4:	00113423          	sd	ra,8(sp)
    80002dc8:	00813023          	sd	s0,0(sp)
    80002dcc:	01010413          	addi	s0,sp,16
    TCB::dispatch();
    80002dd0:	00000097          	auipc	ra,0x0
    80002dd4:	f44080e7          	jalr	-188(ra) # 80002d14 <_ZN3TCB8dispatchEv>
}
    80002dd8:	00813083          	ld	ra,8(sp)
    80002ddc:	00013403          	ld	s0,0(sp)
    80002de0:	01010113          	addi	sp,sp,16
    80002de4:	00008067          	ret

0000000080002de8 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002de8:	ff010113          	addi	sp,sp,-16
    80002dec:	00113423          	sd	ra,8(sp)
    80002df0:	00813023          	sd	s0,0(sp)
    80002df4:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002df8:	ffffe097          	auipc	ra,0xffffe
    80002dfc:	518080e7          	jalr	1304(ra) # 80001310 <_Z9mem_allocm>
    //return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
}
    80002e00:	00813083          	ld	ra,8(sp)
    80002e04:	00013403          	ld	s0,0(sp)
    80002e08:	01010113          	addi	sp,sp,16
    80002e0c:	00008067          	ret

0000000080002e10 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002e10:	fd010113          	addi	sp,sp,-48
    80002e14:	02113423          	sd	ra,40(sp)
    80002e18:	02813023          	sd	s0,32(sp)
    80002e1c:	00913c23          	sd	s1,24(sp)
    80002e20:	01213823          	sd	s2,16(sp)
    80002e24:	01313423          	sd	s3,8(sp)
    80002e28:	03010413          	addi	s0,sp,48
    80002e2c:	00050913          	mv	s2,a0
    80002e30:	00058993          	mv	s3,a1
    80002e34:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    80002e38:	06000513          	li	a0,96
    80002e3c:	00000097          	auipc	ra,0x0
    80002e40:	fac080e7          	jalr	-84(ra) # 80002de8 <_ZN3TCBnwEm>


    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED) {
    80002e44:	01253823          	sd	s2,16(a0)
    80002e48:	00953c23          	sd	s1,24(a0)
    80002e4c:	03353023          	sd	s3,32(a0)
    80002e50:	00200793          	li	a5,2
    80002e54:	02f53423          	sd	a5,40(a0)
    80002e58:	02053823          	sd	zero,48(a0)
    80002e5c:	02053c23          	sd	zero,56(a0)
    80002e60:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80002e64:	04053423          	sd	zero,72(a0)
    80002e68:	04053823          	sd	zero,80(a0)
    80002e6c:	04052c23          	sw	zero,88(a0)
        //formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002e70:	02090e63          	beqz	s2,80002eac <_ZN3TCB12createThreadEPFvPvES0_Pm+0x9c>
    80002e74:	00000797          	auipc	a5,0x0
    80002e78:	e5c78793          	addi	a5,a5,-420 # 80002cd0 <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002e7c:	02048c63          	beqz	s1,80002eb4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002e80:	00001637          	lui	a2,0x1
    80002e84:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    80002e88:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    80002e8c:	00953423          	sd	s1,8(a0)
}
    80002e90:	02813083          	ld	ra,40(sp)
    80002e94:	02013403          	ld	s0,32(sp)
    80002e98:	01813483          	ld	s1,24(sp)
    80002e9c:	01013903          	ld	s2,16(sp)
    80002ea0:	00813983          	ld	s3,8(sp)
    80002ea4:	03010113          	addi	sp,sp,48
    80002ea8:	00008067          	ret
        uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002eac:	00000793          	li	a5,0
    80002eb0:	fcdff06f          	j	80002e7c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x6c>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002eb4:	00000493          	li	s1,0
    80002eb8:	fd1ff06f          	j	80002e88 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x78>

0000000080002ebc <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002ebc:	ff010113          	addi	sp,sp,-16
    80002ec0:	00113423          	sd	ra,8(sp)
    80002ec4:	00813023          	sd	s0,0(sp)
    80002ec8:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002ecc:	ffffe097          	auipc	ra,0xffffe
    80002ed0:	484080e7          	jalr	1156(ra) # 80001350 <_Z8mem_freePv>
    //MemoryAllocator::kfree(ptr);
}
    80002ed4:	00813083          	ld	ra,8(sp)
    80002ed8:	00013403          	ld	s0,0(sp)
    80002edc:	01010113          	addi	sp,sp,16
    80002ee0:	00008067          	ret

0000000080002ee4 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED) return;
    80002ee4:	05852703          	lw	a4,88(a0)
    80002ee8:	00500793          	li	a5,5
    80002eec:	04f70063          	beq	a4,a5,80002f2c <_ZN3TCB10threadJoinEPS_+0x48>
void TCB::threadJoin(TCB* handle) {
    80002ef0:	ff010113          	addi	sp,sp,-16
    80002ef4:	00113423          	sd	ra,8(sp)
    80002ef8:	00813023          	sd	s0,0(sp)
    80002efc:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    80002f00:	0000a597          	auipc	a1,0xa
    80002f04:	d905b583          	ld	a1,-624(a1) # 8000cc90 <_ZN3TCB7runningE>
    80002f08:	00300793          	li	a5,3
    80002f0c:	04f5ac23          	sw	a5,88(a1)
    handle->waitingToJoin.putLast(TCB::running);
    80002f10:	04850513          	addi	a0,a0,72
    80002f14:	ffffe097          	auipc	ra,0xffffe
    80002f18:	330080e7          	jalr	816(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002f1c:	00813083          	ld	ra,8(sp)
    80002f20:	00013403          	ld	s0,0(sp)
    80002f24:	01010113          	addi	sp,sp,16
    80002f28:	00008067          	ret
    80002f2c:	00008067          	ret

0000000080002f30 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80002f30:	0000a517          	auipc	a0,0xa
    80002f34:	d6053503          	ld	a0,-672(a0) # 8000cc90 <_ZN3TCB7runningE>
        bool ret = front == nullptr;
    80002f38:	04853783          	ld	a5,72(a0)
    80002f3c:	04078863          	beqz	a5,80002f8c <_ZN3TCB13releaseJoinedEv+0x5c>
void TCB::releaseJoined() {
    80002f40:	ff010113          	addi	sp,sp,-16
    80002f44:	00113423          	sd	ra,8(sp)
    80002f48:	00813023          	sd	s0,0(sp)
    80002f4c:	01010413          	addi	s0,sp,16
        TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002f50:	04850513          	addi	a0,a0,72
    80002f54:	ffffe097          	auipc	ra,0xffffe
    80002f58:	35c080e7          	jalr	860(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
        tcb->status = ACTIVE;
    80002f5c:	00100793          	li	a5,1
    80002f60:	04f52c23          	sw	a5,88(a0)
        Scheduler::put(tcb);
    80002f64:	fffff097          	auipc	ra,0xfffff
    80002f68:	aec080e7          	jalr	-1300(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80002f6c:	0000a517          	auipc	a0,0xa
    80002f70:	d2453503          	ld	a0,-732(a0) # 8000cc90 <_ZN3TCB7runningE>
    80002f74:	04853783          	ld	a5,72(a0)
    80002f78:	fc079ce3          	bnez	a5,80002f50 <_ZN3TCB13releaseJoinedEv+0x20>
    }
}
    80002f7c:	00813083          	ld	ra,8(sp)
    80002f80:	00013403          	ld	s0,0(sp)
    80002f84:	01010113          	addi	sp,sp,16
    80002f88:	00008067          	ret
    80002f8c:	00008067          	ret

0000000080002f90 <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
    //startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
    if (newTcb->threadFunction != nullptr) {
    80002f90:	01053783          	ld	a5,16(a0)
    80002f94:	04078063          	beqz	a5,80002fd4 <_ZN3TCB5startEPS_+0x44>
void TCB::start(TCB* newTcb) {
    80002f98:	fe010113          	addi	sp,sp,-32
    80002f9c:	00113c23          	sd	ra,24(sp)
    80002fa0:	00813823          	sd	s0,16(sp)
    80002fa4:	00913423          	sd	s1,8(sp)
    80002fa8:	02010413          	addi	s0,sp,32
    80002fac:	00050493          	mv	s1,a0
        Scheduler::put(newTcb);
    80002fb0:	fffff097          	auipc	ra,0xfffff
    80002fb4:	aa0080e7          	jalr	-1376(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
        newTcb->status = ACTIVE;
    80002fb8:	00100793          	li	a5,1
    80002fbc:	04f4ac23          	sw	a5,88(s1)
    }
}
    80002fc0:	01813083          	ld	ra,24(sp)
    80002fc4:	01013403          	ld	s0,16(sp)
    80002fc8:	00813483          	ld	s1,8(sp)
    80002fcc:	02010113          	addi	sp,sp,32
    80002fd0:	00008067          	ret
    80002fd4:	00008067          	ret

0000000080002fd8 <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80002fd8:	ff010113          	addi	sp,sp,-16
    80002fdc:	00813423          	sd	s0,8(sp)
    80002fe0:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002fe4:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002fe8:	10200073          	sret
    80002fec:	00813403          	ld	s0,8(sp)
    80002ff0:	01010113          	addi	sp,sp,16
    80002ff4:	00008067          	ret

0000000080002ff8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80002ff8:	fa010113          	addi	sp,sp,-96
    80002ffc:	04813c23          	sd	s0,88(sp)
    80003000:	06010413          	addi	s0,sp,96
    80003004:	faa43423          	sd	a0,-88(s0)
    80003008:	00058793          	mv	a5,a1
    8000300c:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80003010:	fa843783          	ld	a5,-88(s0)
    80003014:	00079663          	bnez	a5,80003020 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80003018:	00000793          	li	a5,0
    8000301c:	2040006f          	j	80003220 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80003020:	fa843783          	ld	a5,-88(s0)
    80003024:	0067d713          	srli	a4,a5,0x6
    80003028:	fa843783          	ld	a5,-88(s0)
    8000302c:	03f7f793          	andi	a5,a5,63
    80003030:	00078663          	beqz	a5,8000303c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80003034:	00100793          	li	a5,1
    80003038:	0080006f          	j	80003040 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    8000303c:	00000793          	li	a5,0
    80003040:	00e787b3          	add	a5,a5,a4
    80003044:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80003048:	fc843783          	ld	a5,-56(s0)
    8000304c:	00679793          	slli	a5,a5,0x6
    80003050:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    80003054:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80003058:	0000a797          	auipc	a5,0xa
    8000305c:	c5078793          	addi	a5,a5,-944 # 8000cca8 <_ZN15MemoryAllocator11freeMemHeadE>
    80003060:	0007b783          	ld	a5,0(a5)
    80003064:	fef43023          	sd	a5,-32(s0)
    80003068:	fe043783          	ld	a5,-32(s0)
    8000306c:	1a078863          	beqz	a5,8000321c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    80003070:	fe043783          	ld	a5,-32(s0)
    80003074:	0087b783          	ld	a5,8(a5)
    80003078:	fa843703          	ld	a4,-88(s0)
    8000307c:	18e7e263          	bltu	a5,a4,80003200 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    80003080:	fe043703          	ld	a4,-32(s0)
    80003084:	fa843783          	ld	a5,-88(s0)
    80003088:	00f707b3          	add	a5,a4,a5
    8000308c:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    80003090:	fe043783          	ld	a5,-32(s0)
    80003094:	0087b703          	ld	a4,8(a5)
    80003098:	fa843783          	ld	a5,-88(s0)
    8000309c:	40f707b3          	sub	a5,a4,a5
    800030a0:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    800030a4:	fb843703          	ld	a4,-72(s0)
    800030a8:	02000793          	li	a5,32
    800030ac:	04e7e463          	bltu	a5,a4,800030f4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    800030b0:	fa843703          	ld	a4,-88(s0)
    800030b4:	fb843783          	ld	a5,-72(s0)
    800030b8:	00f707b3          	add	a5,a4,a5
    800030bc:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    800030c0:	fe843783          	ld	a5,-24(s0)
    800030c4:	00078c63          	beqz	a5,800030dc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    800030c8:	fe043783          	ld	a5,-32(s0)
    800030cc:	0007b703          	ld	a4,0(a5)
    800030d0:	fe843783          	ld	a5,-24(s0)
    800030d4:	00e7b023          	sd	a4,0(a5)
    800030d8:	0600006f          	j	80003138 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    800030dc:	fe043783          	ld	a5,-32(s0)
    800030e0:	0007b703          	ld	a4,0(a5)
    800030e4:	0000a797          	auipc	a5,0xa
    800030e8:	bc478793          	addi	a5,a5,-1084 # 8000cca8 <_ZN15MemoryAllocator11freeMemHeadE>
    800030ec:	00e7b023          	sd	a4,0(a5)
    800030f0:	0480006f          	j	80003138 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    800030f4:	fc043783          	ld	a5,-64(s0)
    800030f8:	fb843703          	ld	a4,-72(s0)
    800030fc:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    80003100:	fe043783          	ld	a5,-32(s0)
    80003104:	0007b703          	ld	a4,0(a5)
    80003108:	fc043783          	ld	a5,-64(s0)
    8000310c:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    80003110:	fe843783          	ld	a5,-24(s0)
    80003114:	00078a63          	beqz	a5,80003128 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    80003118:	fe843783          	ld	a5,-24(s0)
    8000311c:	fc043703          	ld	a4,-64(s0)
    80003120:	00e7b023          	sd	a4,0(a5)
    80003124:	0140006f          	j	80003138 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    80003128:	0000a797          	auipc	a5,0xa
    8000312c:	b8078793          	addi	a5,a5,-1152 # 8000cca8 <_ZN15MemoryAllocator11freeMemHeadE>
    80003130:	fc043703          	ld	a4,-64(s0)
    80003134:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    80003138:	fe043783          	ld	a5,-32(s0)
    8000313c:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    80003140:	fb043783          	ld	a5,-80(s0)
    80003144:	fa843703          	ld	a4,-88(s0)
    80003148:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    8000314c:	fb043783          	ld	a5,-80(s0)
    80003150:	fa442703          	lw	a4,-92(s0)
    80003154:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    80003158:	fb043783          	ld	a5,-80(s0)
    8000315c:	02078713          	addi	a4,a5,32
    80003160:	fb043783          	ld	a5,-80(s0)
    80003164:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    80003168:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    8000316c:	0000a797          	auipc	a5,0xa
    80003170:	b3478793          	addi	a5,a5,-1228 # 8000cca0 <_ZN15MemoryAllocator11usedMemHeadE>
    80003174:	0007b783          	ld	a5,0(a5)
    80003178:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    8000317c:	fd043783          	ld	a5,-48(s0)
    80003180:	02078463          	beqz	a5,800031a8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    80003184:	fd043703          	ld	a4,-48(s0)
    80003188:	fb043783          	ld	a5,-80(s0)
    8000318c:	00f77e63          	bgeu	a4,a5,800031a8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    80003190:	fd043783          	ld	a5,-48(s0)
    80003194:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80003198:	fd043783          	ld	a5,-48(s0)
    8000319c:	0007b783          	ld	a5,0(a5)
    800031a0:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    800031a4:	fd9ff06f          	j	8000317c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    800031a8:	fd843783          	ld	a5,-40(s0)
    800031ac:	02079663          	bnez	a5,800031d8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    800031b0:	0000a797          	auipc	a5,0xa
    800031b4:	af078793          	addi	a5,a5,-1296 # 8000cca0 <_ZN15MemoryAllocator11usedMemHeadE>
    800031b8:	0007b703          	ld	a4,0(a5)
    800031bc:	fb043783          	ld	a5,-80(s0)
    800031c0:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    800031c4:	0000a797          	auipc	a5,0xa
    800031c8:	adc78793          	addi	a5,a5,-1316 # 8000cca0 <_ZN15MemoryAllocator11usedMemHeadE>
    800031cc:	fb043703          	ld	a4,-80(s0)
    800031d0:	00e7b023          	sd	a4,0(a5)
    800031d4:	0200006f          	j	800031f4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    800031d8:	fd843783          	ld	a5,-40(s0)
    800031dc:	0007b703          	ld	a4,0(a5)
    800031e0:	fb043783          	ld	a5,-80(s0)
    800031e4:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    800031e8:	fd843783          	ld	a5,-40(s0)
    800031ec:	fb043703          	ld	a4,-80(s0)
    800031f0:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    800031f4:	fb043783          	ld	a5,-80(s0)
    800031f8:	0187b783          	ld	a5,24(a5)
    800031fc:	0240006f          	j	80003220 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    80003200:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80003204:	fe043783          	ld	a5,-32(s0)
    80003208:	fef43423          	sd	a5,-24(s0)
    8000320c:	fe043783          	ld	a5,-32(s0)
    80003210:	0007b783          	ld	a5,0(a5)
    80003214:	fef43023          	sd	a5,-32(s0)
    80003218:	e51ff06f          	j	80003068 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    8000321c:	00000793          	li	a5,0
}
    80003220:	00078513          	mv	a0,a5
    80003224:	05813403          	ld	s0,88(sp)
    80003228:	06010113          	addi	sp,sp,96
    8000322c:	00008067          	ret

0000000080003230 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80003230:	fb010113          	addi	sp,sp,-80
    80003234:	04113423          	sd	ra,72(sp)
    80003238:	04813023          	sd	s0,64(sp)
    8000323c:	05010413          	addi	s0,sp,80
    80003240:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    80003244:	fb843783          	ld	a5,-72(s0)
    80003248:	00079663          	bnez	a5,80003254 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    8000324c:	00000793          	li	a5,0
    80003250:	1740006f          	j	800033c4 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    80003254:	0000a797          	auipc	a5,0xa
    80003258:	a4c78793          	addi	a5,a5,-1460 # 8000cca0 <_ZN15MemoryAllocator11usedMemHeadE>
    8000325c:	0007b783          	ld	a5,0(a5)
    80003260:	00079663          	bnez	a5,8000326c <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    80003264:	fff00793          	li	a5,-1
    80003268:	15c0006f          	j	800033c4 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    8000326c:	fb843783          	ld	a5,-72(s0)
    80003270:	fe078793          	addi	a5,a5,-32
    80003274:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    80003278:	0000a797          	auipc	a5,0xa
    8000327c:	a2878793          	addi	a5,a5,-1496 # 8000cca0 <_ZN15MemoryAllocator11usedMemHeadE>
    80003280:	0007b783          	ld	a5,0(a5)
    80003284:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    80003288:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    8000328c:	fe843783          	ld	a5,-24(s0)
    80003290:	02078463          	beqz	a5,800032b8 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80003294:	fe843703          	ld	a4,-24(s0)
    80003298:	fb843783          	ld	a5,-72(s0)
    8000329c:	00f70e63          	beq	a4,a5,800032b8 <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    800032a0:	fe843783          	ld	a5,-24(s0)
    800032a4:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    800032a8:	fe843783          	ld	a5,-24(s0)
    800032ac:	0007b783          	ld	a5,0(a5)
    800032b0:	fef43423          	sd	a5,-24(s0)
    800032b4:	fd9ff06f          	j	8000328c <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    800032b8:	fe843703          	ld	a4,-24(s0)
    800032bc:	fb843783          	ld	a5,-72(s0)
    800032c0:	00f70663          	beq	a4,a5,800032cc <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    800032c4:	fff00793          	li	a5,-1
    800032c8:	0fc0006f          	j	800033c4 <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    800032cc:	fe043783          	ld	a5,-32(s0)
    800032d0:	00078c63          	beqz	a5,800032e8 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    800032d4:	fe843783          	ld	a5,-24(s0)
    800032d8:	0007b703          	ld	a4,0(a5)
    800032dc:	fe043783          	ld	a5,-32(s0)
    800032e0:	00e7b023          	sd	a4,0(a5)
    800032e4:	0180006f          	j	800032fc <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    800032e8:	fe843783          	ld	a5,-24(s0)
    800032ec:	0007b703          	ld	a4,0(a5)
    800032f0:	0000a797          	auipc	a5,0xa
    800032f4:	9b078793          	addi	a5,a5,-1616 # 8000cca0 <_ZN15MemoryAllocator11usedMemHeadE>
    800032f8:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    800032fc:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    80003300:	0000a797          	auipc	a5,0xa
    80003304:	9a878793          	addi	a5,a5,-1624 # 8000cca8 <_ZN15MemoryAllocator11freeMemHeadE>
    80003308:	0007b783          	ld	a5,0(a5)
    8000330c:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    80003310:	fd043783          	ld	a5,-48(s0)
    80003314:	02078463          	beqz	a5,8000333c <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80003318:	fd043703          	ld	a4,-48(s0)
    8000331c:	fb843783          	ld	a5,-72(s0)
    80003320:	00f77e63          	bgeu	a4,a5,8000333c <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80003324:	fd043783          	ld	a5,-48(s0)
    80003328:	fcf43c23          	sd	a5,-40(s0)
    8000332c:	fd043783          	ld	a5,-48(s0)
    80003330:	0007b783          	ld	a5,0(a5)
    80003334:	fcf43823          	sd	a5,-48(s0)
    80003338:	fd9ff06f          	j	80003310 <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    8000333c:	fb843783          	ld	a5,-72(s0)
    80003340:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    80003344:	fb843783          	ld	a5,-72(s0)
    80003348:	0087b783          	ld	a5,8(a5)
    8000334c:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    80003350:	fc843783          	ld	a5,-56(s0)
    80003354:	fc043703          	ld	a4,-64(s0)
    80003358:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    8000335c:	fd843783          	ld	a5,-40(s0)
    80003360:	02078263          	beqz	a5,80003384 <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    80003364:	fd843783          	ld	a5,-40(s0)
    80003368:	0007b703          	ld	a4,0(a5)
    8000336c:	fc843783          	ld	a5,-56(s0)
    80003370:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    80003374:	fd843783          	ld	a5,-40(s0)
    80003378:	fc843703          	ld	a4,-56(s0)
    8000337c:	00e7b023          	sd	a4,0(a5)
    80003380:	0280006f          	j	800033a8 <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    80003384:	0000a797          	auipc	a5,0xa
    80003388:	92478793          	addi	a5,a5,-1756 # 8000cca8 <_ZN15MemoryAllocator11freeMemHeadE>
    8000338c:	0007b703          	ld	a4,0(a5)
    80003390:	fc843783          	ld	a5,-56(s0)
    80003394:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    80003398:	0000a797          	auipc	a5,0xa
    8000339c:	91078793          	addi	a5,a5,-1776 # 8000cca8 <_ZN15MemoryAllocator11freeMemHeadE>
    800033a0:	fc843703          	ld	a4,-56(s0)
    800033a4:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    800033a8:	fc843503          	ld	a0,-56(s0)
    800033ac:	00000097          	auipc	ra,0x0
    800033b0:	02c080e7          	jalr	44(ra) # 800033d8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    800033b4:	fd843503          	ld	a0,-40(s0)
    800033b8:	00000097          	auipc	ra,0x0
    800033bc:	020080e7          	jalr	32(ra) # 800033d8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    800033c0:	00000793          	li	a5,0
}
    800033c4:	00078513          	mv	a0,a5
    800033c8:	04813083          	ld	ra,72(sp)
    800033cc:	04013403          	ld	s0,64(sp)
    800033d0:	05010113          	addi	sp,sp,80
    800033d4:	00008067          	ret

00000000800033d8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    800033d8:	fc010113          	addi	sp,sp,-64
    800033dc:	02813c23          	sd	s0,56(sp)
    800033e0:	04010413          	addi	s0,sp,64
    800033e4:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    800033e8:	fc843783          	ld	a5,-56(s0)
    800033ec:	00079663          	bnez	a5,800033f8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    800033f0:	00000793          	li	a5,0
    800033f4:	0a00006f          	j	80003494 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    800033f8:	fc843783          	ld	a5,-56(s0)
    800033fc:	0007b783          	ld	a5,0(a5)
    80003400:	00f037b3          	snez	a5,a5
    80003404:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    80003408:	fc843783          	ld	a5,-56(s0)
    8000340c:	0087b783          	ld	a5,8(a5)
    80003410:	fc843703          	ld	a4,-56(s0)
    80003414:	00f707b3          	add	a5,a4,a5
    80003418:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    8000341c:	fc843783          	ld	a5,-56(s0)
    80003420:	0007b783          	ld	a5,0(a5)
    80003424:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    80003428:	fe043703          	ld	a4,-32(s0)
    8000342c:	fd843783          	ld	a5,-40(s0)
    80003430:	40f707b3          	sub	a5,a4,a5
    80003434:	0017b793          	seqz	a5,a5
    80003438:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    8000343c:	fef44783          	lbu	a5,-17(s0)
    80003440:	0ff7f793          	andi	a5,a5,255
    80003444:	04078663          	beqz	a5,80003490 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    80003448:	fd744783          	lbu	a5,-41(s0)
    8000344c:	0ff7f793          	andi	a5,a5,255
    80003450:	04078063          	beqz	a5,80003490 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    80003454:	fc843783          	ld	a5,-56(s0)
    80003458:	0087b703          	ld	a4,8(a5)
    8000345c:	fc843783          	ld	a5,-56(s0)
    80003460:	0007b783          	ld	a5,0(a5)
    80003464:	0087b783          	ld	a5,8(a5)
    80003468:	00f70733          	add	a4,a4,a5
    8000346c:	fc843783          	ld	a5,-56(s0)
    80003470:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    80003474:	fc843783          	ld	a5,-56(s0)
    80003478:	0007b783          	ld	a5,0(a5)
    8000347c:	0007b703          	ld	a4,0(a5)
    80003480:	fc843783          	ld	a5,-56(s0)
    80003484:	00e7b023          	sd	a4,0(a5)
        return 1;
    80003488:	00100793          	li	a5,1
    8000348c:	0080006f          	j	80003494 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    80003490:	00000793          	li	a5,0
}
    80003494:	00078513          	mv	a0,a5
    80003498:	03813403          	ld	s0,56(sp)
    8000349c:	04010113          	addi	sp,sp,64
    800034a0:	00008067          	ret

00000000800034a4 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    800034a4:	fe010113          	addi	sp,sp,-32
    800034a8:	00813c23          	sd	s0,24(sp)
    800034ac:	02010413          	addi	s0,sp,32
    800034b0:	fea43423          	sd	a0,-24(s0)
    800034b4:	00058793          	mv	a5,a1
    800034b8:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    800034bc:	fe843783          	ld	a5,-24(s0)
    800034c0:	fe078793          	addi	a5,a5,-32
    800034c4:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    800034c8:	fe843783          	ld	a5,-24(s0)
    800034cc:	0107a703          	lw	a4,16(a5)
    800034d0:	fe442783          	lw	a5,-28(s0)
    800034d4:	0007879b          	sext.w	a5,a5
    800034d8:	40e787b3          	sub	a5,a5,a4
    800034dc:	0017b793          	seqz	a5,a5
    800034e0:	0ff7f793          	andi	a5,a5,255
}
    800034e4:	00078513          	mv	a0,a5
    800034e8:	01813403          	ld	s0,24(sp)
    800034ec:	02010113          	addi	sp,sp,32
    800034f0:	00008067          	ret

00000000800034f4 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    800034f4:	ff010113          	addi	sp,sp,-16
    800034f8:	00813423          	sd	s0,8(sp)
    800034fc:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    80003500:	00009797          	auipc	a5,0x9
    80003504:	7b078793          	addi	a5,a5,1968 # 8000ccb0 <_ZN15MemoryAllocator11initializedE>
    80003508:	0007c783          	lbu	a5,0(a5)
    8000350c:	0017c793          	xori	a5,a5,1
    80003510:	0ff7f793          	andi	a5,a5,255
    80003514:	06078a63          	beqz	a5,80003588 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    80003518:	00009797          	auipc	a5,0x9
    8000351c:	5c87b783          	ld	a5,1480(a5) # 8000cae0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003520:	0007b703          	ld	a4,0(a5)
    80003524:	00009797          	auipc	a5,0x9
    80003528:	78478793          	addi	a5,a5,1924 # 8000cca8 <_ZN15MemoryAllocator11freeMemHeadE>
    8000352c:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    80003530:	00009797          	auipc	a5,0x9
    80003534:	77878793          	addi	a5,a5,1912 # 8000cca8 <_ZN15MemoryAllocator11freeMemHeadE>
    80003538:	0007b783          	ld	a5,0(a5)
    8000353c:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    80003540:	00009797          	auipc	a5,0x9
    80003544:	5d87b783          	ld	a5,1496(a5) # 8000cb18 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003548:	0007b703          	ld	a4,0(a5)
    8000354c:	00009797          	auipc	a5,0x9
    80003550:	5947b783          	ld	a5,1428(a5) # 8000cae0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003554:	0007b783          	ld	a5,0(a5)
    80003558:	40f70733          	sub	a4,a4,a5
    8000355c:	00009797          	auipc	a5,0x9
    80003560:	74c78793          	addi	a5,a5,1868 # 8000cca8 <_ZN15MemoryAllocator11freeMemHeadE>
    80003564:	0007b783          	ld	a5,0(a5)
    80003568:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    8000356c:	00009797          	auipc	a5,0x9
    80003570:	73478793          	addi	a5,a5,1844 # 8000cca0 <_ZN15MemoryAllocator11usedMemHeadE>
    80003574:	0007b023          	sd	zero,0(a5)

        initialized = true;
    80003578:	00009797          	auipc	a5,0x9
    8000357c:	73878793          	addi	a5,a5,1848 # 8000ccb0 <_ZN15MemoryAllocator11initializedE>
    80003580:	00100713          	li	a4,1
    80003584:	00e78023          	sb	a4,0(a5)
    }
}
    80003588:	00000013          	nop
    8000358c:	00813403          	ld	s0,8(sp)
    80003590:	01010113          	addi	sp,sp,16
    80003594:	00008067          	ret

0000000080003598 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80003598:	ff010113          	addi	sp,sp,-16
    8000359c:	00113423          	sd	ra,8(sp)
    800035a0:	00813023          	sd	s0,0(sp)
    800035a4:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800035a8:	ffffe097          	auipc	ra,0xffffe
    800035ac:	d68080e7          	jalr	-664(ra) # 80001310 <_Z9mem_allocm>
	//return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
}
    800035b0:	00813083          	ld	ra,8(sp)
    800035b4:	00013403          	ld	s0,0(sp)
    800035b8:	01010113          	addi	sp,sp,16
    800035bc:	00008067          	ret

00000000800035c0 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    800035c0:	ff010113          	addi	sp,sp,-16
    800035c4:	00113423          	sd	ra,8(sp)
    800035c8:	00813023          	sd	s0,0(sp)
    800035cc:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    800035d0:	ffffe097          	auipc	ra,0xffffe
    800035d4:	d80080e7          	jalr	-640(ra) # 80001350 <_Z8mem_freePv>
	//MemoryAllocator::kfree(ptr);
}
    800035d8:	00813083          	ld	ra,8(sp)
    800035dc:	00013403          	ld	s0,0(sp)
    800035e0:	01010113          	addi	sp,sp,16
    800035e4:	00008067          	ret

00000000800035e8 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    800035e8:	fe010113          	addi	sp,sp,-32
    800035ec:	00113c23          	sd	ra,24(sp)
    800035f0:	00813823          	sd	s0,16(sp)
    800035f4:	00913423          	sd	s1,8(sp)
    800035f8:	02010413          	addi	s0,sp,32
    800035fc:	00050493          	mv	s1,a0
	return new KSem(val);
    80003600:	02000513          	li	a0,32
    80003604:	00000097          	auipc	ra,0x0
    80003608:	f94080e7          	jalr	-108(ra) # 80003598 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    8000360c:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003610:	00053423          	sd	zero,8(a0)
    80003614:	00053823          	sd	zero,16(a0)
    80003618:	00100713          	li	a4,1
    8000361c:	00e50c23          	sb	a4,24(a0)
}
    80003620:	01813083          	ld	ra,24(sp)
    80003624:	01013403          	ld	s0,16(sp)
    80003628:	00813483          	ld	s1,8(sp)
    8000362c:	02010113          	addi	sp,sp,32
    80003630:	00008067          	ret

0000000080003634 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003634:	ff010113          	addi	sp,sp,-16
    80003638:	00113423          	sd	ra,8(sp)
    8000363c:	00813023          	sd	s0,0(sp)
    80003640:	01010413          	addi	s0,sp,16
	//TCB::running->setBlocked(true);
    TCB::running->setStatus(TCB::BLOCKED);
    80003644:	00009797          	auipc	a5,0x9
    80003648:	4cc7b783          	ld	a5,1228(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x58>
    8000364c:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80003650:	00200793          	li	a5,2
    80003654:	04f5ac23          	sw	a5,88(a1)
	blocked.putLast(TCB::running);
    80003658:	00850513          	addi	a0,a0,8
    8000365c:	ffffe097          	auipc	ra,0xffffe
    80003660:	be8080e7          	jalr	-1048(ra) # 80001244 <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::yield();
    80003664:	fffff097          	auipc	ra,0xfffff
    80003668:	75c080e7          	jalr	1884(ra) # 80002dc0 <_ZN3TCB5yieldEv>
}
    8000366c:	00813083          	ld	ra,8(sp)
    80003670:	00013403          	ld	s0,0(sp)
    80003674:	01010113          	addi	sp,sp,16
    80003678:	00008067          	ret

000000008000367c <_ZN4KSem4waitEv>:
	if (!working) return -3;
    8000367c:	01854783          	lbu	a5,24(a0)
    80003680:	04078663          	beqz	a5,800036cc <_ZN4KSem4waitEv+0x50>
	if (--val < 0) {
    80003684:	00052783          	lw	a5,0(a0)
    80003688:	fff7879b          	addiw	a5,a5,-1
    8000368c:	00f52023          	sw	a5,0(a0)
    80003690:	02079713          	slli	a4,a5,0x20
    80003694:	00074663          	bltz	a4,800036a0 <_ZN4KSem4waitEv+0x24>
	return 0;
    80003698:	00000513          	li	a0,0
}
    8000369c:	00008067          	ret
int KSem::wait() {
    800036a0:	ff010113          	addi	sp,sp,-16
    800036a4:	00113423          	sd	ra,8(sp)
    800036a8:	00813023          	sd	s0,0(sp)
    800036ac:	01010413          	addi	s0,sp,16
		block();
    800036b0:	00000097          	auipc	ra,0x0
    800036b4:	f84080e7          	jalr	-124(ra) # 80003634 <_ZN4KSem5blockEv>
		return -1;
    800036b8:	fff00513          	li	a0,-1
}
    800036bc:	00813083          	ld	ra,8(sp)
    800036c0:	00013403          	ld	s0,0(sp)
    800036c4:	01010113          	addi	sp,sp,16
    800036c8:	00008067          	ret
	if (!working) return -3;
    800036cc:	ffd00513          	li	a0,-3
    800036d0:	00008067          	ret

00000000800036d4 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    800036d4:	ff010113          	addi	sp,sp,-16
    800036d8:	00113423          	sd	ra,8(sp)
    800036dc:	00813023          	sd	s0,0(sp)
    800036e0:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    800036e4:	00850513          	addi	a0,a0,8
    800036e8:	ffffe097          	auipc	ra,0xffffe
    800036ec:	bc8080e7          	jalr	-1080(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    800036f0:	00100793          	li	a5,1
    800036f4:	04f52c23          	sw	a5,88(a0)
	//tcb->setBlocked(false);
    tcb->setStatus(TCB::ACTIVE);
	Scheduler::put(tcb);
    800036f8:	ffffe097          	auipc	ra,0xffffe
    800036fc:	358080e7          	jalr	856(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
}
    80003700:	00813083          	ld	ra,8(sp)
    80003704:	00013403          	ld	s0,0(sp)
    80003708:	01010113          	addi	sp,sp,16
    8000370c:	00008067          	ret

0000000080003710 <_ZN4KSem6signalEv>:
	if (!working) return -3;
    80003710:	01854783          	lbu	a5,24(a0)
    80003714:	04078463          	beqz	a5,8000375c <_ZN4KSem6signalEv+0x4c>
	if (val++ < 0) {
    80003718:	00052783          	lw	a5,0(a0)
    8000371c:	0017871b          	addiw	a4,a5,1
    80003720:	00e52023          	sw	a4,0(a0)
    80003724:	0007c663          	bltz	a5,80003730 <_ZN4KSem6signalEv+0x20>
	return 0;
    80003728:	00000513          	li	a0,0
}
    8000372c:	00008067          	ret
int KSem::signal() {
    80003730:	ff010113          	addi	sp,sp,-16
    80003734:	00113423          	sd	ra,8(sp)
    80003738:	00813023          	sd	s0,0(sp)
    8000373c:	01010413          	addi	s0,sp,16
		unblock();
    80003740:	00000097          	auipc	ra,0x0
    80003744:	f94080e7          	jalr	-108(ra) # 800036d4 <_ZN4KSem7unblockEv>
	return 0;
    80003748:	00000513          	li	a0,0
}
    8000374c:	00813083          	ld	ra,8(sp)
    80003750:	00013403          	ld	s0,0(sp)
    80003754:	01010113          	addi	sp,sp,16
    80003758:	00008067          	ret
	if (!working) return -3;
    8000375c:	ffd00513          	li	a0,-3
    80003760:	00008067          	ret

0000000080003764 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003764:	fe010113          	addi	sp,sp,-32
    80003768:	00113c23          	sd	ra,24(sp)
    8000376c:	00813823          	sd	s0,16(sp)
    80003770:	00913423          	sd	s1,8(sp)
    80003774:	02010413          	addi	s0,sp,32
    80003778:	00050493          	mv	s1,a0
	//if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
	handle->working = false;
    8000377c:	00050c23          	sb	zero,24(a0)
        bool ret = front == nullptr;
    80003780:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003784:	02078263          	beqz	a5,800037a8 <_ZN4KSem8closeSemEPS_+0x44>
		TCB* tcb = handle->blocked.getFirst();
    80003788:	00848513          	addi	a0,s1,8
    8000378c:	ffffe097          	auipc	ra,0xffffe
    80003790:	b24080e7          	jalr	-1244(ra) # 800012b0 <_ZN11ThreadQueue8getFirstEv>
    80003794:	00100793          	li	a5,1
    80003798:	04f52c23          	sw	a5,88(a0)
		//tcb->setBlocked(false);
        tcb->setStatus(TCB::ACTIVE);
		Scheduler::put(tcb);
    8000379c:	ffffe097          	auipc	ra,0xffffe
    800037a0:	2b4080e7          	jalr	692(ra) # 80001a50 <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    800037a4:	fddff06f          	j	80003780 <_ZN4KSem8closeSemEPS_+0x1c>
	}
	return 0;
}
    800037a8:	00000513          	li	a0,0
    800037ac:	01813083          	ld	ra,24(sp)
    800037b0:	01013403          	ld	s0,16(sp)
    800037b4:	00813483          	ld	s1,8(sp)
    800037b8:	02010113          	addi	sp,sp,32
    800037bc:	00008067          	ret

00000000800037c0 <_Z10testMemoryv>:
    return pok;
}

#pragma GCC optimize("O0")

void testMemory() {
    800037c0:	e6010113          	addi	sp,sp,-416
    800037c4:	18113c23          	sd	ra,408(sp)
    800037c8:	18813823          	sd	s0,400(sp)
    800037cc:	1a010413          	addi	s0,sp,416
    char* pokazivaci[50];
    pokazivaci[0] = nullptr;
    800037d0:	e6043023          	sd	zero,-416(s0)
    pokazivaci[0] = upisi(1024 + 768);
    800037d4:	70000513          	li	a0,1792
    800037d8:	00000097          	auipc	ra,0x0
    800037dc:	1f8080e7          	jalr	504(ra) # 800039d0 <_Z5upisim>
    800037e0:	00050793          	mv	a5,a0
    800037e4:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    800037e8:	e6043783          	ld	a5,-416(s0)
    800037ec:	02078c63          	beqz	a5,80003824 <_Z10testMemoryv+0x64>
        if (pokazivaci[0][0] == '8') {
    800037f0:	e6043783          	ld	a5,-416(s0)
    800037f4:	0007c783          	lbu	a5,0(a5)
    800037f8:	00078713          	mv	a4,a5
    800037fc:	03800793          	li	a5,56
    80003800:	00f71a63          	bne	a4,a5,80003814 <_Z10testMemoryv+0x54>
            printString("nea");
    80003804:	00007517          	auipc	a0,0x7
    80003808:	9fc50513          	addi	a0,a0,-1540 # 8000a200 <_ZZ9kPrintIntmE6digits+0x190>
    8000380c:	00002097          	auipc	ra,0x2
    80003810:	6b4080e7          	jalr	1716(ra) # 80005ec0 <_Z11printStringPKc>
        }
        MemoryAllocator::kfree(pokazivaci[0]);
    80003814:	e6043783          	ld	a5,-416(s0)
    80003818:	00078513          	mv	a0,a5
    8000381c:	00000097          	auipc	ra,0x0
    80003820:	a14080e7          	jalr	-1516(ra) # 80003230 <_ZN15MemoryAllocator5kfreeEPv>
    }


    pokazivaci[0] = upisi(4096);
    80003824:	00001537          	lui	a0,0x1
    80003828:	00000097          	auipc	ra,0x0
    8000382c:	1a8080e7          	jalr	424(ra) # 800039d0 <_Z5upisim>
    80003830:	00050793          	mv	a5,a0
    80003834:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    80003838:	e6043783          	ld	a5,-416(s0)
    8000383c:	00078a63          	beqz	a5,80003850 <_Z10testMemoryv+0x90>
        MemoryAllocator::kfree(pokazivaci[0]);
    80003840:	e6043783          	ld	a5,-416(s0)
    80003844:	00078513          	mv	a0,a5
    80003848:	00000097          	auipc	ra,0x0
    8000384c:	9e8080e7          	jalr	-1560(ra) # 80003230 <_ZN15MemoryAllocator5kfreeEPv>
    }

    pokazivaci[0] = upisi(1024 + 768);
    80003850:	70000513          	li	a0,1792
    80003854:	00000097          	auipc	ra,0x0
    80003858:	17c080e7          	jalr	380(ra) # 800039d0 <_Z5upisim>
    8000385c:	00050793          	mv	a5,a0
    80003860:	e6f43023          	sd	a5,-416(s0)
    MemoryAllocator::kfree(pokazivaci[0]);
    80003864:	e6043783          	ld	a5,-416(s0)
    80003868:	00078513          	mv	a0,a5
    8000386c:	00000097          	auipc	ra,0x0
    80003870:	9c4080e7          	jalr	-1596(ra) # 80003230 <_ZN15MemoryAllocator5kfreeEPv>

}
    80003874:	00000013          	nop
    80003878:	19813083          	ld	ra,408(sp)
    8000387c:	19013403          	ld	s0,400(sp)
    80003880:	1a010113          	addi	sp,sp,416
    80003884:	00008067          	ret

0000000080003888 <_Z5nit1fPv>:

void nit1f(void*) {
    80003888:	fe010113          	addi	sp,sp,-32
    8000388c:	00113c23          	sd	ra,24(sp)
    80003890:	00813823          	sd	s0,16(sp)
    80003894:	02010413          	addi	s0,sp,32
    80003898:	fea43423          	sd	a0,-24(s0)
//		printString("\nsem_wait za nit 1 vratio ");
//		printInteger(res);
//		printString("\n");
//	}

    printString("\nGotova nit 1\n");
    8000389c:	00007517          	auipc	a0,0x7
    800038a0:	96c50513          	addi	a0,a0,-1684 # 8000a208 <_ZZ9kPrintIntmE6digits+0x198>
    800038a4:	00002097          	auipc	ra,0x2
    800038a8:	61c080e7          	jalr	1564(ra) # 80005ec0 <_Z11printStringPKc>
}
    800038ac:	00000013          	nop
    800038b0:	01813083          	ld	ra,24(sp)
    800038b4:	01013403          	ld	s0,16(sp)
    800038b8:	02010113          	addi	sp,sp,32
    800038bc:	00008067          	ret

00000000800038c0 <_Z5nit2fPv>:

void nit2f(void* arg2) {
    800038c0:	fe010113          	addi	sp,sp,-32
    800038c4:	00113c23          	sd	ra,24(sp)
    800038c8:	00813823          	sd	s0,16(sp)
    800038cc:	02010413          	addi	s0,sp,32
    800038d0:	fea43423          	sd	a0,-24(s0)
//		//sem_close(semA);
//		printString("\nNit 2 ubija semafor\n");
//		delete semA;
//
//	}
    printString("\nGotova nit 2\n");
    800038d4:	00007517          	auipc	a0,0x7
    800038d8:	94450513          	addi	a0,a0,-1724 # 8000a218 <_ZZ9kPrintIntmE6digits+0x1a8>
    800038dc:	00002097          	auipc	ra,0x2
    800038e0:	5e4080e7          	jalr	1508(ra) # 80005ec0 <_Z11printStringPKc>
}
    800038e4:	00000013          	nop
    800038e8:	01813083          	ld	ra,24(sp)
    800038ec:	01013403          	ld	s0,16(sp)
    800038f0:	02010113          	addi	sp,sp,32
    800038f4:	00008067          	ret

00000000800038f8 <_Z5nit3fPv>:


void nit3f(void*) {
    800038f8:	fd010113          	addi	sp,sp,-48
    800038fc:	02113423          	sd	ra,40(sp)
    80003900:	02813023          	sd	s0,32(sp)
    80003904:	03010413          	addi	s0,sp,48
    80003908:	fca43c23          	sd	a0,-40(s0)
    char slovo;
    do {
        slovo = getc();
    8000390c:	ffffe097          	auipc	ra,0xffffe
    80003910:	c5c080e7          	jalr	-932(ra) # 80001568 <_Z4getcv>
    80003914:	00050793          	mv	a5,a0
    80003918:	fef407a3          	sb	a5,-17(s0)
        putc(slovo);
    8000391c:	fef44783          	lbu	a5,-17(s0)
    80003920:	00078513          	mv	a0,a5
    80003924:	ffffe097          	auipc	ra,0xffffe
    80003928:	c6c080e7          	jalr	-916(ra) # 80001590 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    8000392c:	fef44783          	lbu	a5,-17(s0)
    80003930:	0ff7f713          	andi	a4,a5,255
    80003934:	00d00793          	li	a5,13
    80003938:	00f71863          	bne	a4,a5,80003948 <_Z5nit3fPv+0x50>
    8000393c:	00a00513          	li	a0,10
    80003940:	ffffe097          	auipc	ra,0xffffe
    80003944:	c50080e7          	jalr	-944(ra) # 80001590 <_Z4putcc>
    } while (slovo != '0');
    80003948:	fef44783          	lbu	a5,-17(s0)
    8000394c:	0ff7f713          	andi	a4,a5,255
    80003950:	03000793          	li	a5,48
    80003954:	00f70463          	beq	a4,a5,8000395c <_Z5nit3fPv+0x64>
    do {
    80003958:	fb5ff06f          	j	8000390c <_Z5nit3fPv+0x14>

    printString("\nGotova nit3\n");
    8000395c:	00007517          	auipc	a0,0x7
    80003960:	8cc50513          	addi	a0,a0,-1844 # 8000a228 <_ZZ9kPrintIntmE6digits+0x1b8>
    80003964:	00002097          	auipc	ra,0x2
    80003968:	55c080e7          	jalr	1372(ra) # 80005ec0 <_Z11printStringPKc>
}
    8000396c:	00000013          	nop
    80003970:	02813083          	ld	ra,40(sp)
    80003974:	02013403          	ld	s0,32(sp)
    80003978:	03010113          	addi	sp,sp,48
    8000397c:	00008067          	ret

0000000080003980 <_Z8testMainv>:

int testMain() {
    80003980:	ff010113          	addi	sp,sp,-16
    80003984:	00113423          	sd	ra,8(sp)
    80003988:	00813023          	sd	s0,0(sp)
    8000398c:	01010413          	addi	s0,sp,16
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80003990:	00009797          	auipc	a5,0x9
    80003994:	1907b783          	ld	a5,400(a5) # 8000cb20 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003998:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    MemoryAllocator::initMemoryAllocator();
    8000399c:	00000097          	auipc	ra,0x0
    800039a0:	b58080e7          	jalr	-1192(ra) # 800034f4 <_ZN15MemoryAllocator19initMemoryAllocatorEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    800039a4:	ffffe097          	auipc	ra,0xffffe
    800039a8:	cbc080e7          	jalr	-836(ra) # 80001660 <_ZN8KConsole12initKConsoleEv>
//	printString("\nGotove user niti\n");
//
//	printString("\nSad cu da izadjem\n");
//	while(KConsole::outputHead!=KConsole::outputTail){}
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    800039ac:	00200513          	li	a0,2
    800039b0:	00000097          	auipc	ra,0x0
    800039b4:	07c080e7          	jalr	124(ra) # 80003a2c <_ZN5Riscv10mc_sstatusEm>


    return 0;
    800039b8:	00000793          	li	a5,0
    800039bc:	00078513          	mv	a0,a5
    800039c0:	00813083          	ld	ra,8(sp)
    800039c4:	00013403          	ld	s0,0(sp)
    800039c8:	01010113          	addi	sp,sp,16
    800039cc:	00008067          	ret

00000000800039d0 <_Z5upisim>:
char* upisi(size_t alociraj) {
    800039d0:	fe010113          	addi	sp,sp,-32
    800039d4:	00113c23          	sd	ra,24(sp)
    800039d8:	00813823          	sd	s0,16(sp)
    800039dc:	00913423          	sd	s1,8(sp)
    800039e0:	02010413          	addi	s0,sp,32
    800039e4:	00050493          	mv	s1,a0
    char* pok = (char*) MemoryAllocator::kmalloc(alociraj);
    800039e8:	00300593          	li	a1,3
    800039ec:	fffff097          	auipc	ra,0xfffff
    800039f0:	60c080e7          	jalr	1548(ra) # 80002ff8 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    if (pok) {
    800039f4:	02050263          	beqz	a0,80003a18 <_Z5upisim+0x48>
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    800039f8:	00000793          	li	a5,0
    800039fc:	0140006f          	j	80003a10 <_Z5upisim+0x40>
            pok[i] = '8';
    80003a00:	00f50733          	add	a4,a0,a5
    80003a04:	03800693          	li	a3,56
    80003a08:	00d70023          	sb	a3,0(a4)
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    80003a0c:	00178793          	addi	a5,a5,1
    80003a10:	fe048713          	addi	a4,s1,-32
    80003a14:	fee7e6e3          	bltu	a5,a4,80003a00 <_Z5upisim+0x30>
}
    80003a18:	01813083          	ld	ra,24(sp)
    80003a1c:	01013403          	ld	s0,16(sp)
    80003a20:	00813483          	ld	s1,8(sp)
    80003a24:	02010113          	addi	sp,sp,32
    80003a28:	00008067          	ret

0000000080003a2c <_ZN5Riscv10mc_sstatusEm>:
inline void Riscv::mc_sstatus(uint64 mask) {
    80003a2c:	ff010113          	addi	sp,sp,-16
    80003a30:	00813423          	sd	s0,8(sp)
    80003a34:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003a38:	10053073          	csrc	sstatus,a0
}
    80003a3c:	00813403          	ld	s0,8(sp)
    80003a40:	01010113          	addi	sp,sp,16
    80003a44:	00008067          	ret

0000000080003a48 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003a48:	fe010113          	addi	sp,sp,-32
    80003a4c:	00113c23          	sd	ra,24(sp)
    80003a50:	00813823          	sd	s0,16(sp)
    80003a54:	00913423          	sd	s1,8(sp)
    80003a58:	01213023          	sd	s2,0(sp)
    80003a5c:	02010413          	addi	s0,sp,32
    80003a60:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003a64:	00000913          	li	s2,0
    80003a68:	00c0006f          	j	80003a74 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003a6c:	ffffe097          	auipc	ra,0xffffe
    80003a70:	9bc080e7          	jalr	-1604(ra) # 80001428 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80003a74:	ffffe097          	auipc	ra,0xffffe
    80003a78:	af4080e7          	jalr	-1292(ra) # 80001568 <_Z4getcv>
    80003a7c:	0005059b          	sext.w	a1,a0
    80003a80:	02d00793          	li	a5,45
    80003a84:	02f58a63          	beq	a1,a5,80003ab8 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003a88:	0084b503          	ld	a0,8(s1)
    80003a8c:	00003097          	auipc	ra,0x3
    80003a90:	400080e7          	jalr	1024(ra) # 80006e8c <_ZN6Buffer3putEi>
        i++;
    80003a94:	0019071b          	addiw	a4,s2,1
    80003a98:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003a9c:	0004a683          	lw	a3,0(s1)
    80003aa0:	0026979b          	slliw	a5,a3,0x2
    80003aa4:	00d787bb          	addw	a5,a5,a3
    80003aa8:	0017979b          	slliw	a5,a5,0x1
    80003aac:	02f767bb          	remw	a5,a4,a5
    80003ab0:	fc0792e3          	bnez	a5,80003a74 <_ZL16producerKeyboardPv+0x2c>
    80003ab4:	fb9ff06f          	j	80003a6c <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003ab8:	00100793          	li	a5,1
    80003abc:	00009717          	auipc	a4,0x9
    80003ac0:	1ef72e23          	sw	a5,508(a4) # 8000ccb8 <_ZL9threadEnd>
    data->buffer->put('!');
    80003ac4:	02100593          	li	a1,33
    80003ac8:	0084b503          	ld	a0,8(s1)
    80003acc:	00003097          	auipc	ra,0x3
    80003ad0:	3c0080e7          	jalr	960(ra) # 80006e8c <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003ad4:	0104b503          	ld	a0,16(s1)
    80003ad8:	ffffe097          	auipc	ra,0xffffe
    80003adc:	a60080e7          	jalr	-1440(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003ae0:	01813083          	ld	ra,24(sp)
    80003ae4:	01013403          	ld	s0,16(sp)
    80003ae8:	00813483          	ld	s1,8(sp)
    80003aec:	00013903          	ld	s2,0(sp)
    80003af0:	02010113          	addi	sp,sp,32
    80003af4:	00008067          	ret

0000000080003af8 <_ZL8producerPv>:

static void producer(void *arg) {
    80003af8:	fe010113          	addi	sp,sp,-32
    80003afc:	00113c23          	sd	ra,24(sp)
    80003b00:	00813823          	sd	s0,16(sp)
    80003b04:	00913423          	sd	s1,8(sp)
    80003b08:	01213023          	sd	s2,0(sp)
    80003b0c:	02010413          	addi	s0,sp,32
    80003b10:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003b14:	00000913          	li	s2,0
    80003b18:	00c0006f          	j	80003b24 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003b1c:	ffffe097          	auipc	ra,0xffffe
    80003b20:	90c080e7          	jalr	-1780(ra) # 80001428 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003b24:	00009797          	auipc	a5,0x9
    80003b28:	1947a783          	lw	a5,404(a5) # 8000ccb8 <_ZL9threadEnd>
    80003b2c:	02079e63          	bnez	a5,80003b68 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003b30:	0004a583          	lw	a1,0(s1)
    80003b34:	0305859b          	addiw	a1,a1,48
    80003b38:	0084b503          	ld	a0,8(s1)
    80003b3c:	00003097          	auipc	ra,0x3
    80003b40:	350080e7          	jalr	848(ra) # 80006e8c <_ZN6Buffer3putEi>
        i++;
    80003b44:	0019071b          	addiw	a4,s2,1
    80003b48:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003b4c:	0004a683          	lw	a3,0(s1)
    80003b50:	0026979b          	slliw	a5,a3,0x2
    80003b54:	00d787bb          	addw	a5,a5,a3
    80003b58:	0017979b          	slliw	a5,a5,0x1
    80003b5c:	02f767bb          	remw	a5,a4,a5
    80003b60:	fc0792e3          	bnez	a5,80003b24 <_ZL8producerPv+0x2c>
    80003b64:	fb9ff06f          	j	80003b1c <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003b68:	0104b503          	ld	a0,16(s1)
    80003b6c:	ffffe097          	auipc	ra,0xffffe
    80003b70:	9cc080e7          	jalr	-1588(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003b74:	01813083          	ld	ra,24(sp)
    80003b78:	01013403          	ld	s0,16(sp)
    80003b7c:	00813483          	ld	s1,8(sp)
    80003b80:	00013903          	ld	s2,0(sp)
    80003b84:	02010113          	addi	sp,sp,32
    80003b88:	00008067          	ret

0000000080003b8c <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003b8c:	fd010113          	addi	sp,sp,-48
    80003b90:	02113423          	sd	ra,40(sp)
    80003b94:	02813023          	sd	s0,32(sp)
    80003b98:	00913c23          	sd	s1,24(sp)
    80003b9c:	01213823          	sd	s2,16(sp)
    80003ba0:	01313423          	sd	s3,8(sp)
    80003ba4:	03010413          	addi	s0,sp,48
    80003ba8:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003bac:	00000993          	li	s3,0
    80003bb0:	01c0006f          	j	80003bcc <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003bb4:	ffffe097          	auipc	ra,0xffffe
    80003bb8:	874080e7          	jalr	-1932(ra) # 80001428 <_Z15thread_dispatchv>
    80003bbc:	0500006f          	j	80003c0c <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003bc0:	00a00513          	li	a0,10
    80003bc4:	ffffe097          	auipc	ra,0xffffe
    80003bc8:	9cc080e7          	jalr	-1588(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    80003bcc:	00009797          	auipc	a5,0x9
    80003bd0:	0ec7a783          	lw	a5,236(a5) # 8000ccb8 <_ZL9threadEnd>
    80003bd4:	06079063          	bnez	a5,80003c34 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003bd8:	00893503          	ld	a0,8(s2)
    80003bdc:	00003097          	auipc	ra,0x3
    80003be0:	340080e7          	jalr	832(ra) # 80006f1c <_ZN6Buffer3getEv>
        i++;
    80003be4:	0019849b          	addiw	s1,s3,1
    80003be8:	0004899b          	sext.w	s3,s1
        putc(key);
    80003bec:	0ff57513          	andi	a0,a0,255
    80003bf0:	ffffe097          	auipc	ra,0xffffe
    80003bf4:	9a0080e7          	jalr	-1632(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003bf8:	00092703          	lw	a4,0(s2)
    80003bfc:	0027179b          	slliw	a5,a4,0x2
    80003c00:	00e787bb          	addw	a5,a5,a4
    80003c04:	02f4e7bb          	remw	a5,s1,a5
    80003c08:	fa0786e3          	beqz	a5,80003bb4 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003c0c:	05000793          	li	a5,80
    80003c10:	02f4e4bb          	remw	s1,s1,a5
    80003c14:	fa049ce3          	bnez	s1,80003bcc <_ZL8consumerPv+0x40>
    80003c18:	fa9ff06f          	j	80003bc0 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003c1c:	00893503          	ld	a0,8(s2)
    80003c20:	00003097          	auipc	ra,0x3
    80003c24:	2fc080e7          	jalr	764(ra) # 80006f1c <_ZN6Buffer3getEv>
        putc(key);
    80003c28:	0ff57513          	andi	a0,a0,255
    80003c2c:	ffffe097          	auipc	ra,0xffffe
    80003c30:	964080e7          	jalr	-1692(ra) # 80001590 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003c34:	00893503          	ld	a0,8(s2)
    80003c38:	00003097          	auipc	ra,0x3
    80003c3c:	370080e7          	jalr	880(ra) # 80006fa8 <_ZN6Buffer6getCntEv>
    80003c40:	fca04ee3          	bgtz	a0,80003c1c <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003c44:	01093503          	ld	a0,16(s2)
    80003c48:	ffffe097          	auipc	ra,0xffffe
    80003c4c:	8f0080e7          	jalr	-1808(ra) # 80001538 <_Z10sem_signalP4KSem>
}
    80003c50:	02813083          	ld	ra,40(sp)
    80003c54:	02013403          	ld	s0,32(sp)
    80003c58:	01813483          	ld	s1,24(sp)
    80003c5c:	01013903          	ld	s2,16(sp)
    80003c60:	00813983          	ld	s3,8(sp)
    80003c64:	03010113          	addi	sp,sp,48
    80003c68:	00008067          	ret

0000000080003c6c <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003c6c:	f9010113          	addi	sp,sp,-112
    80003c70:	06113423          	sd	ra,104(sp)
    80003c74:	06813023          	sd	s0,96(sp)
    80003c78:	04913c23          	sd	s1,88(sp)
    80003c7c:	05213823          	sd	s2,80(sp)
    80003c80:	05313423          	sd	s3,72(sp)
    80003c84:	05413023          	sd	s4,64(sp)
    80003c88:	03513c23          	sd	s5,56(sp)
    80003c8c:	03613823          	sd	s6,48(sp)
    80003c90:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003c94:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003c98:	00006517          	auipc	a0,0x6
    80003c9c:	5a050513          	addi	a0,a0,1440 # 8000a238 <_ZZ9kPrintIntmE6digits+0x1c8>
    80003ca0:	00002097          	auipc	ra,0x2
    80003ca4:	220080e7          	jalr	544(ra) # 80005ec0 <_Z11printStringPKc>
    getString(input, 30);
    80003ca8:	01e00593          	li	a1,30
    80003cac:	fa040493          	addi	s1,s0,-96
    80003cb0:	00048513          	mv	a0,s1
    80003cb4:	00002097          	auipc	ra,0x2
    80003cb8:	294080e7          	jalr	660(ra) # 80005f48 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003cbc:	00048513          	mv	a0,s1
    80003cc0:	00002097          	auipc	ra,0x2
    80003cc4:	360080e7          	jalr	864(ra) # 80006020 <_Z11stringToIntPKc>
    80003cc8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003ccc:	00006517          	auipc	a0,0x6
    80003cd0:	58c50513          	addi	a0,a0,1420 # 8000a258 <_ZZ9kPrintIntmE6digits+0x1e8>
    80003cd4:	00002097          	auipc	ra,0x2
    80003cd8:	1ec080e7          	jalr	492(ra) # 80005ec0 <_Z11printStringPKc>
    getString(input, 30);
    80003cdc:	01e00593          	li	a1,30
    80003ce0:	00048513          	mv	a0,s1
    80003ce4:	00002097          	auipc	ra,0x2
    80003ce8:	264080e7          	jalr	612(ra) # 80005f48 <_Z9getStringPci>
    n = stringToInt(input);
    80003cec:	00048513          	mv	a0,s1
    80003cf0:	00002097          	auipc	ra,0x2
    80003cf4:	330080e7          	jalr	816(ra) # 80006020 <_Z11stringToIntPKc>
    80003cf8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003cfc:	00006517          	auipc	a0,0x6
    80003d00:	57c50513          	addi	a0,a0,1404 # 8000a278 <_ZZ9kPrintIntmE6digits+0x208>
    80003d04:	00002097          	auipc	ra,0x2
    80003d08:	1bc080e7          	jalr	444(ra) # 80005ec0 <_Z11printStringPKc>
	printInt(threadNum);
    80003d0c:	00000613          	li	a2,0
    80003d10:	00a00593          	li	a1,10
    80003d14:	00090513          	mv	a0,s2
    80003d18:	00002097          	auipc	ra,0x2
    80003d1c:	358080e7          	jalr	856(ra) # 80006070 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003d20:	00006517          	auipc	a0,0x6
    80003d24:	57050513          	addi	a0,a0,1392 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    80003d28:	00002097          	auipc	ra,0x2
    80003d2c:	198080e7          	jalr	408(ra) # 80005ec0 <_Z11printStringPKc>
	printInt(n);
    80003d30:	00000613          	li	a2,0
    80003d34:	00a00593          	li	a1,10
    80003d38:	00048513          	mv	a0,s1
    80003d3c:	00002097          	auipc	ra,0x2
    80003d40:	334080e7          	jalr	820(ra) # 80006070 <_Z8printIntiii>
    printString(".\n");
    80003d44:	00006517          	auipc	a0,0x6
    80003d48:	56450513          	addi	a0,a0,1380 # 8000a2a8 <_ZZ9kPrintIntmE6digits+0x238>
    80003d4c:	00002097          	auipc	ra,0x2
    80003d50:	174080e7          	jalr	372(ra) # 80005ec0 <_Z11printStringPKc>
    if(threadNum > n) {
    80003d54:	0324c463          	blt	s1,s2,80003d7c <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003d58:	03205c63          	blez	s2,80003d90 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003d5c:	03800513          	li	a0,56
    80003d60:	fffff097          	auipc	ra,0xfffff
    80003d64:	a38080e7          	jalr	-1480(ra) # 80002798 <_Znwm>
    80003d68:	00050a13          	mv	s4,a0
    80003d6c:	00048593          	mv	a1,s1
    80003d70:	00003097          	auipc	ra,0x3
    80003d74:	080080e7          	jalr	128(ra) # 80006df0 <_ZN6BufferC1Ei>
    80003d78:	0300006f          	j	80003da8 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003d7c:	00006517          	auipc	a0,0x6
    80003d80:	53450513          	addi	a0,a0,1332 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    80003d84:	00002097          	auipc	ra,0x2
    80003d88:	13c080e7          	jalr	316(ra) # 80005ec0 <_Z11printStringPKc>
        return;
    80003d8c:	0140006f          	j	80003da0 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003d90:	00006517          	auipc	a0,0x6
    80003d94:	56050513          	addi	a0,a0,1376 # 8000a2f0 <_ZZ9kPrintIntmE6digits+0x280>
    80003d98:	00002097          	auipc	ra,0x2
    80003d9c:	128080e7          	jalr	296(ra) # 80005ec0 <_Z11printStringPKc>
        return;
    80003da0:	000b0113          	mv	sp,s6
    80003da4:	1500006f          	j	80003ef4 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003da8:	00000593          	li	a1,0
    80003dac:	00009517          	auipc	a0,0x9
    80003db0:	f1450513          	addi	a0,a0,-236 # 8000ccc0 <_ZL10waitForAll>
    80003db4:	ffffd097          	auipc	ra,0xffffd
    80003db8:	6ec080e7          	jalr	1772(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003dbc:	00391793          	slli	a5,s2,0x3
    80003dc0:	00f78793          	addi	a5,a5,15
    80003dc4:	ff07f793          	andi	a5,a5,-16
    80003dc8:	40f10133          	sub	sp,sp,a5
    80003dcc:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003dd0:	0019071b          	addiw	a4,s2,1
    80003dd4:	00171793          	slli	a5,a4,0x1
    80003dd8:	00e787b3          	add	a5,a5,a4
    80003ddc:	00379793          	slli	a5,a5,0x3
    80003de0:	00f78793          	addi	a5,a5,15
    80003de4:	ff07f793          	andi	a5,a5,-16
    80003de8:	40f10133          	sub	sp,sp,a5
    80003dec:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003df0:	00191613          	slli	a2,s2,0x1
    80003df4:	012607b3          	add	a5,a2,s2
    80003df8:	00379793          	slli	a5,a5,0x3
    80003dfc:	00f987b3          	add	a5,s3,a5
    80003e00:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003e04:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003e08:	00009717          	auipc	a4,0x9
    80003e0c:	eb873703          	ld	a4,-328(a4) # 8000ccc0 <_ZL10waitForAll>
    80003e10:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003e14:	00078613          	mv	a2,a5
    80003e18:	00000597          	auipc	a1,0x0
    80003e1c:	d7458593          	addi	a1,a1,-652 # 80003b8c <_ZL8consumerPv>
    80003e20:	f9840513          	addi	a0,s0,-104
    80003e24:	ffffd097          	auipc	ra,0xffffd
    80003e28:	55c080e7          	jalr	1372(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003e2c:	00000493          	li	s1,0
    80003e30:	0280006f          	j	80003e58 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003e34:	00000597          	auipc	a1,0x0
    80003e38:	c1458593          	addi	a1,a1,-1004 # 80003a48 <_ZL16producerKeyboardPv>
                      data + i);
    80003e3c:	00179613          	slli	a2,a5,0x1
    80003e40:	00f60633          	add	a2,a2,a5
    80003e44:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003e48:	00c98633          	add	a2,s3,a2
    80003e4c:	ffffd097          	auipc	ra,0xffffd
    80003e50:	534080e7          	jalr	1332(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003e54:	0014849b          	addiw	s1,s1,1
    80003e58:	0524d263          	bge	s1,s2,80003e9c <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003e5c:	00149793          	slli	a5,s1,0x1
    80003e60:	009787b3          	add	a5,a5,s1
    80003e64:	00379793          	slli	a5,a5,0x3
    80003e68:	00f987b3          	add	a5,s3,a5
    80003e6c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003e70:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003e74:	00009717          	auipc	a4,0x9
    80003e78:	e4c73703          	ld	a4,-436(a4) # 8000ccc0 <_ZL10waitForAll>
    80003e7c:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003e80:	00048793          	mv	a5,s1
    80003e84:	00349513          	slli	a0,s1,0x3
    80003e88:	00aa8533          	add	a0,s5,a0
    80003e8c:	fa9054e3          	blez	s1,80003e34 <_Z22producerConsumer_C_APIv+0x1c8>
    80003e90:	00000597          	auipc	a1,0x0
    80003e94:	c6858593          	addi	a1,a1,-920 # 80003af8 <_ZL8producerPv>
    80003e98:	fa5ff06f          	j	80003e3c <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003e9c:	ffffd097          	auipc	ra,0xffffd
    80003ea0:	58c080e7          	jalr	1420(ra) # 80001428 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003ea4:	00000493          	li	s1,0
    80003ea8:	00994e63          	blt	s2,s1,80003ec4 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003eac:	00009517          	auipc	a0,0x9
    80003eb0:	e1453503          	ld	a0,-492(a0) # 8000ccc0 <_ZL10waitForAll>
    80003eb4:	ffffd097          	auipc	ra,0xffffd
    80003eb8:	654080e7          	jalr	1620(ra) # 80001508 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003ebc:	0014849b          	addiw	s1,s1,1
    80003ec0:	fe9ff06f          	j	80003ea8 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003ec4:	00009517          	auipc	a0,0x9
    80003ec8:	dfc53503          	ld	a0,-516(a0) # 8000ccc0 <_ZL10waitForAll>
    80003ecc:	ffffd097          	auipc	ra,0xffffd
    80003ed0:	60c080e7          	jalr	1548(ra) # 800014d8 <_Z9sem_closeP4KSem>
    delete buffer;
    80003ed4:	000a0e63          	beqz	s4,80003ef0 <_Z22producerConsumer_C_APIv+0x284>
    80003ed8:	000a0513          	mv	a0,s4
    80003edc:	00003097          	auipc	ra,0x3
    80003ee0:	154080e7          	jalr	340(ra) # 80007030 <_ZN6BufferD1Ev>
    80003ee4:	000a0513          	mv	a0,s4
    80003ee8:	fffff097          	auipc	ra,0xfffff
    80003eec:	900080e7          	jalr	-1792(ra) # 800027e8 <_ZdlPv>
    80003ef0:	000b0113          	mv	sp,s6

}
    80003ef4:	f9040113          	addi	sp,s0,-112
    80003ef8:	06813083          	ld	ra,104(sp)
    80003efc:	06013403          	ld	s0,96(sp)
    80003f00:	05813483          	ld	s1,88(sp)
    80003f04:	05013903          	ld	s2,80(sp)
    80003f08:	04813983          	ld	s3,72(sp)
    80003f0c:	04013a03          	ld	s4,64(sp)
    80003f10:	03813a83          	ld	s5,56(sp)
    80003f14:	03013b03          	ld	s6,48(sp)
    80003f18:	07010113          	addi	sp,sp,112
    80003f1c:	00008067          	ret
    80003f20:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003f24:	000a0513          	mv	a0,s4
    80003f28:	fffff097          	auipc	ra,0xfffff
    80003f2c:	8c0080e7          	jalr	-1856(ra) # 800027e8 <_ZdlPv>
    80003f30:	00048513          	mv	a0,s1
    80003f34:	0000a097          	auipc	ra,0xa
    80003f38:	ea4080e7          	jalr	-348(ra) # 8000ddd8 <_Unwind_Resume>

0000000080003f3c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003f3c:	fe010113          	addi	sp,sp,-32
    80003f40:	00113c23          	sd	ra,24(sp)
    80003f44:	00813823          	sd	s0,16(sp)
    80003f48:	00913423          	sd	s1,8(sp)
    80003f4c:	01213023          	sd	s2,0(sp)
    80003f50:	02010413          	addi	s0,sp,32
    80003f54:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003f58:	00100793          	li	a5,1
    80003f5c:	02a7f863          	bgeu	a5,a0,80003f8c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003f60:	00a00793          	li	a5,10
    80003f64:	02f577b3          	remu	a5,a0,a5
    80003f68:	02078e63          	beqz	a5,80003fa4 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003f6c:	fff48513          	addi	a0,s1,-1
    80003f70:	00000097          	auipc	ra,0x0
    80003f74:	fcc080e7          	jalr	-52(ra) # 80003f3c <_ZL9fibonaccim>
    80003f78:	00050913          	mv	s2,a0
    80003f7c:	ffe48513          	addi	a0,s1,-2
    80003f80:	00000097          	auipc	ra,0x0
    80003f84:	fbc080e7          	jalr	-68(ra) # 80003f3c <_ZL9fibonaccim>
    80003f88:	00a90533          	add	a0,s2,a0
}
    80003f8c:	01813083          	ld	ra,24(sp)
    80003f90:	01013403          	ld	s0,16(sp)
    80003f94:	00813483          	ld	s1,8(sp)
    80003f98:	00013903          	ld	s2,0(sp)
    80003f9c:	02010113          	addi	sp,sp,32
    80003fa0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003fa4:	ffffd097          	auipc	ra,0xffffd
    80003fa8:	484080e7          	jalr	1156(ra) # 80001428 <_Z15thread_dispatchv>
    80003fac:	fc1ff06f          	j	80003f6c <_ZL9fibonaccim+0x30>

0000000080003fb0 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003fb0:	fe010113          	addi	sp,sp,-32
    80003fb4:	00113c23          	sd	ra,24(sp)
    80003fb8:	00813823          	sd	s0,16(sp)
    80003fbc:	00913423          	sd	s1,8(sp)
    80003fc0:	01213023          	sd	s2,0(sp)
    80003fc4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003fc8:	00000913          	li	s2,0
    80003fcc:	0380006f          	j	80004004 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003fd0:	ffffd097          	auipc	ra,0xffffd
    80003fd4:	458080e7          	jalr	1112(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003fd8:	00148493          	addi	s1,s1,1
    80003fdc:	000027b7          	lui	a5,0x2
    80003fe0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003fe4:	0097ee63          	bltu	a5,s1,80004000 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003fe8:	00000713          	li	a4,0
    80003fec:	000077b7          	lui	a5,0x7
    80003ff0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003ff4:	fce7eee3          	bltu	a5,a4,80003fd0 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003ff8:	00170713          	addi	a4,a4,1
    80003ffc:	ff1ff06f          	j	80003fec <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004000:	00190913          	addi	s2,s2,1
    80004004:	00900793          	li	a5,9
    80004008:	0527e063          	bltu	a5,s2,80004048 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000400c:	00006517          	auipc	a0,0x6
    80004010:	31450513          	addi	a0,a0,788 # 8000a320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80004014:	00002097          	auipc	ra,0x2
    80004018:	eac080e7          	jalr	-340(ra) # 80005ec0 <_Z11printStringPKc>
    8000401c:	00000613          	li	a2,0
    80004020:	00a00593          	li	a1,10
    80004024:	0009051b          	sext.w	a0,s2
    80004028:	00002097          	auipc	ra,0x2
    8000402c:	048080e7          	jalr	72(ra) # 80006070 <_Z8printIntiii>
    80004030:	00006517          	auipc	a0,0x6
    80004034:	55050513          	addi	a0,a0,1360 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004038:	00002097          	auipc	ra,0x2
    8000403c:	e88080e7          	jalr	-376(ra) # 80005ec0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004040:	00000493          	li	s1,0
    80004044:	f99ff06f          	j	80003fdc <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80004048:	00006517          	auipc	a0,0x6
    8000404c:	2e050513          	addi	a0,a0,736 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80004050:	00002097          	auipc	ra,0x2
    80004054:	e70080e7          	jalr	-400(ra) # 80005ec0 <_Z11printStringPKc>
    finishedA = true;
    80004058:	00100793          	li	a5,1
    8000405c:	00009717          	auipc	a4,0x9
    80004060:	c6f70623          	sb	a5,-916(a4) # 8000ccc8 <_ZL9finishedA>
}
    80004064:	01813083          	ld	ra,24(sp)
    80004068:	01013403          	ld	s0,16(sp)
    8000406c:	00813483          	ld	s1,8(sp)
    80004070:	00013903          	ld	s2,0(sp)
    80004074:	02010113          	addi	sp,sp,32
    80004078:	00008067          	ret

000000008000407c <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    8000407c:	fe010113          	addi	sp,sp,-32
    80004080:	00113c23          	sd	ra,24(sp)
    80004084:	00813823          	sd	s0,16(sp)
    80004088:	00913423          	sd	s1,8(sp)
    8000408c:	01213023          	sd	s2,0(sp)
    80004090:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004094:	00000913          	li	s2,0
    80004098:	0380006f          	j	800040d0 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    8000409c:	ffffd097          	auipc	ra,0xffffd
    800040a0:	38c080e7          	jalr	908(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800040a4:	00148493          	addi	s1,s1,1
    800040a8:	000027b7          	lui	a5,0x2
    800040ac:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800040b0:	0097ee63          	bltu	a5,s1,800040cc <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800040b4:	00000713          	li	a4,0
    800040b8:	000077b7          	lui	a5,0x7
    800040bc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800040c0:	fce7eee3          	bltu	a5,a4,8000409c <_ZN7WorkerB11workerBodyBEPv+0x20>
    800040c4:	00170713          	addi	a4,a4,1
    800040c8:	ff1ff06f          	j	800040b8 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800040cc:	00190913          	addi	s2,s2,1
    800040d0:	00f00793          	li	a5,15
    800040d4:	0527e063          	bltu	a5,s2,80004114 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800040d8:	00006517          	auipc	a0,0x6
    800040dc:	26050513          	addi	a0,a0,608 # 8000a338 <_ZZ9kPrintIntmE6digits+0x2c8>
    800040e0:	00002097          	auipc	ra,0x2
    800040e4:	de0080e7          	jalr	-544(ra) # 80005ec0 <_Z11printStringPKc>
    800040e8:	00000613          	li	a2,0
    800040ec:	00a00593          	li	a1,10
    800040f0:	0009051b          	sext.w	a0,s2
    800040f4:	00002097          	auipc	ra,0x2
    800040f8:	f7c080e7          	jalr	-132(ra) # 80006070 <_Z8printIntiii>
    800040fc:	00006517          	auipc	a0,0x6
    80004100:	48450513          	addi	a0,a0,1156 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004104:	00002097          	auipc	ra,0x2
    80004108:	dbc080e7          	jalr	-580(ra) # 80005ec0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000410c:	00000493          	li	s1,0
    80004110:	f99ff06f          	j	800040a8 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80004114:	00006517          	auipc	a0,0x6
    80004118:	22c50513          	addi	a0,a0,556 # 8000a340 <_ZZ9kPrintIntmE6digits+0x2d0>
    8000411c:	00002097          	auipc	ra,0x2
    80004120:	da4080e7          	jalr	-604(ra) # 80005ec0 <_Z11printStringPKc>
    finishedB = true;
    80004124:	00100793          	li	a5,1
    80004128:	00009717          	auipc	a4,0x9
    8000412c:	baf700a3          	sb	a5,-1119(a4) # 8000ccc9 <_ZL9finishedB>
    thread_dispatch();
    80004130:	ffffd097          	auipc	ra,0xffffd
    80004134:	2f8080e7          	jalr	760(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004138:	01813083          	ld	ra,24(sp)
    8000413c:	01013403          	ld	s0,16(sp)
    80004140:	00813483          	ld	s1,8(sp)
    80004144:	00013903          	ld	s2,0(sp)
    80004148:	02010113          	addi	sp,sp,32
    8000414c:	00008067          	ret

0000000080004150 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80004150:	fe010113          	addi	sp,sp,-32
    80004154:	00113c23          	sd	ra,24(sp)
    80004158:	00813823          	sd	s0,16(sp)
    8000415c:	00913423          	sd	s1,8(sp)
    80004160:	01213023          	sd	s2,0(sp)
    80004164:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004168:	00000493          	li	s1,0
    8000416c:	0400006f          	j	800041ac <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004170:	00006517          	auipc	a0,0x6
    80004174:	1e050513          	addi	a0,a0,480 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80004178:	00002097          	auipc	ra,0x2
    8000417c:	d48080e7          	jalr	-696(ra) # 80005ec0 <_Z11printStringPKc>
    80004180:	00000613          	li	a2,0
    80004184:	00a00593          	li	a1,10
    80004188:	00048513          	mv	a0,s1
    8000418c:	00002097          	auipc	ra,0x2
    80004190:	ee4080e7          	jalr	-284(ra) # 80006070 <_Z8printIntiii>
    80004194:	00006517          	auipc	a0,0x6
    80004198:	3ec50513          	addi	a0,a0,1004 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    8000419c:	00002097          	auipc	ra,0x2
    800041a0:	d24080e7          	jalr	-732(ra) # 80005ec0 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800041a4:	0014849b          	addiw	s1,s1,1
    800041a8:	0ff4f493          	andi	s1,s1,255
    800041ac:	00200793          	li	a5,2
    800041b0:	fc97f0e3          	bgeu	a5,s1,80004170 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    800041b4:	00006517          	auipc	a0,0x6
    800041b8:	1a450513          	addi	a0,a0,420 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    800041bc:	00002097          	auipc	ra,0x2
    800041c0:	d04080e7          	jalr	-764(ra) # 80005ec0 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800041c4:	00700313          	li	t1,7
    thread_dispatch();
    800041c8:	ffffd097          	auipc	ra,0xffffd
    800041cc:	260080e7          	jalr	608(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800041d0:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800041d4:	00006517          	auipc	a0,0x6
    800041d8:	19450513          	addi	a0,a0,404 # 8000a368 <_ZZ9kPrintIntmE6digits+0x2f8>
    800041dc:	00002097          	auipc	ra,0x2
    800041e0:	ce4080e7          	jalr	-796(ra) # 80005ec0 <_Z11printStringPKc>
    800041e4:	00000613          	li	a2,0
    800041e8:	00a00593          	li	a1,10
    800041ec:	0009051b          	sext.w	a0,s2
    800041f0:	00002097          	auipc	ra,0x2
    800041f4:	e80080e7          	jalr	-384(ra) # 80006070 <_Z8printIntiii>
    800041f8:	00006517          	auipc	a0,0x6
    800041fc:	38850513          	addi	a0,a0,904 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004200:	00002097          	auipc	ra,0x2
    80004204:	cc0080e7          	jalr	-832(ra) # 80005ec0 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80004208:	00c00513          	li	a0,12
    8000420c:	00000097          	auipc	ra,0x0
    80004210:	d30080e7          	jalr	-720(ra) # 80003f3c <_ZL9fibonaccim>
    80004214:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004218:	00006517          	auipc	a0,0x6
    8000421c:	15850513          	addi	a0,a0,344 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    80004220:	00002097          	auipc	ra,0x2
    80004224:	ca0080e7          	jalr	-864(ra) # 80005ec0 <_Z11printStringPKc>
    80004228:	00000613          	li	a2,0
    8000422c:	00a00593          	li	a1,10
    80004230:	0009051b          	sext.w	a0,s2
    80004234:	00002097          	auipc	ra,0x2
    80004238:	e3c080e7          	jalr	-452(ra) # 80006070 <_Z8printIntiii>
    8000423c:	00006517          	auipc	a0,0x6
    80004240:	34450513          	addi	a0,a0,836 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004244:	00002097          	auipc	ra,0x2
    80004248:	c7c080e7          	jalr	-900(ra) # 80005ec0 <_Z11printStringPKc>
    8000424c:	0400006f          	j	8000428c <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004250:	00006517          	auipc	a0,0x6
    80004254:	10050513          	addi	a0,a0,256 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80004258:	00002097          	auipc	ra,0x2
    8000425c:	c68080e7          	jalr	-920(ra) # 80005ec0 <_Z11printStringPKc>
    80004260:	00000613          	li	a2,0
    80004264:	00a00593          	li	a1,10
    80004268:	00048513          	mv	a0,s1
    8000426c:	00002097          	auipc	ra,0x2
    80004270:	e04080e7          	jalr	-508(ra) # 80006070 <_Z8printIntiii>
    80004274:	00006517          	auipc	a0,0x6
    80004278:	30c50513          	addi	a0,a0,780 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    8000427c:	00002097          	auipc	ra,0x2
    80004280:	c44080e7          	jalr	-956(ra) # 80005ec0 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004284:	0014849b          	addiw	s1,s1,1
    80004288:	0ff4f493          	andi	s1,s1,255
    8000428c:	00500793          	li	a5,5
    80004290:	fc97f0e3          	bgeu	a5,s1,80004250 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80004294:	00006517          	auipc	a0,0x6
    80004298:	0ec50513          	addi	a0,a0,236 # 8000a380 <_ZZ9kPrintIntmE6digits+0x310>
    8000429c:	00002097          	auipc	ra,0x2
    800042a0:	c24080e7          	jalr	-988(ra) # 80005ec0 <_Z11printStringPKc>
    finishedC = true;
    800042a4:	00100793          	li	a5,1
    800042a8:	00009717          	auipc	a4,0x9
    800042ac:	a2f70123          	sb	a5,-1502(a4) # 8000ccca <_ZL9finishedC>
    thread_dispatch();
    800042b0:	ffffd097          	auipc	ra,0xffffd
    800042b4:	178080e7          	jalr	376(ra) # 80001428 <_Z15thread_dispatchv>
}
    800042b8:	01813083          	ld	ra,24(sp)
    800042bc:	01013403          	ld	s0,16(sp)
    800042c0:	00813483          	ld	s1,8(sp)
    800042c4:	00013903          	ld	s2,0(sp)
    800042c8:	02010113          	addi	sp,sp,32
    800042cc:	00008067          	ret

00000000800042d0 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800042d0:	fe010113          	addi	sp,sp,-32
    800042d4:	00113c23          	sd	ra,24(sp)
    800042d8:	00813823          	sd	s0,16(sp)
    800042dc:	00913423          	sd	s1,8(sp)
    800042e0:	01213023          	sd	s2,0(sp)
    800042e4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800042e8:	00a00493          	li	s1,10
    800042ec:	0400006f          	j	8000432c <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800042f0:	00006517          	auipc	a0,0x6
    800042f4:	0a050513          	addi	a0,a0,160 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    800042f8:	00002097          	auipc	ra,0x2
    800042fc:	bc8080e7          	jalr	-1080(ra) # 80005ec0 <_Z11printStringPKc>
    80004300:	00000613          	li	a2,0
    80004304:	00a00593          	li	a1,10
    80004308:	00048513          	mv	a0,s1
    8000430c:	00002097          	auipc	ra,0x2
    80004310:	d64080e7          	jalr	-668(ra) # 80006070 <_Z8printIntiii>
    80004314:	00006517          	auipc	a0,0x6
    80004318:	26c50513          	addi	a0,a0,620 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    8000431c:	00002097          	auipc	ra,0x2
    80004320:	ba4080e7          	jalr	-1116(ra) # 80005ec0 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004324:	0014849b          	addiw	s1,s1,1
    80004328:	0ff4f493          	andi	s1,s1,255
    8000432c:	00c00793          	li	a5,12
    80004330:	fc97f0e3          	bgeu	a5,s1,800042f0 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80004334:	00006517          	auipc	a0,0x6
    80004338:	06450513          	addi	a0,a0,100 # 8000a398 <_ZZ9kPrintIntmE6digits+0x328>
    8000433c:	00002097          	auipc	ra,0x2
    80004340:	b84080e7          	jalr	-1148(ra) # 80005ec0 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004344:	00500313          	li	t1,5
    thread_dispatch();
    80004348:	ffffd097          	auipc	ra,0xffffd
    8000434c:	0e0080e7          	jalr	224(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004350:	01000513          	li	a0,16
    80004354:	00000097          	auipc	ra,0x0
    80004358:	be8080e7          	jalr	-1048(ra) # 80003f3c <_ZL9fibonaccim>
    8000435c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004360:	00006517          	auipc	a0,0x6
    80004364:	04850513          	addi	a0,a0,72 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    80004368:	00002097          	auipc	ra,0x2
    8000436c:	b58080e7          	jalr	-1192(ra) # 80005ec0 <_Z11printStringPKc>
    80004370:	00000613          	li	a2,0
    80004374:	00a00593          	li	a1,10
    80004378:	0009051b          	sext.w	a0,s2
    8000437c:	00002097          	auipc	ra,0x2
    80004380:	cf4080e7          	jalr	-780(ra) # 80006070 <_Z8printIntiii>
    80004384:	00006517          	auipc	a0,0x6
    80004388:	1fc50513          	addi	a0,a0,508 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    8000438c:	00002097          	auipc	ra,0x2
    80004390:	b34080e7          	jalr	-1228(ra) # 80005ec0 <_Z11printStringPKc>
    80004394:	0400006f          	j	800043d4 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004398:	00006517          	auipc	a0,0x6
    8000439c:	ff850513          	addi	a0,a0,-8 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    800043a0:	00002097          	auipc	ra,0x2
    800043a4:	b20080e7          	jalr	-1248(ra) # 80005ec0 <_Z11printStringPKc>
    800043a8:	00000613          	li	a2,0
    800043ac:	00a00593          	li	a1,10
    800043b0:	00048513          	mv	a0,s1
    800043b4:	00002097          	auipc	ra,0x2
    800043b8:	cbc080e7          	jalr	-836(ra) # 80006070 <_Z8printIntiii>
    800043bc:	00006517          	auipc	a0,0x6
    800043c0:	1c450513          	addi	a0,a0,452 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800043c4:	00002097          	auipc	ra,0x2
    800043c8:	afc080e7          	jalr	-1284(ra) # 80005ec0 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800043cc:	0014849b          	addiw	s1,s1,1
    800043d0:	0ff4f493          	andi	s1,s1,255
    800043d4:	00f00793          	li	a5,15
    800043d8:	fc97f0e3          	bgeu	a5,s1,80004398 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800043dc:	00006517          	auipc	a0,0x6
    800043e0:	fdc50513          	addi	a0,a0,-36 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    800043e4:	00002097          	auipc	ra,0x2
    800043e8:	adc080e7          	jalr	-1316(ra) # 80005ec0 <_Z11printStringPKc>
    finishedD = true;
    800043ec:	00100793          	li	a5,1
    800043f0:	00009717          	auipc	a4,0x9
    800043f4:	8cf70da3          	sb	a5,-1829(a4) # 8000cccb <_ZL9finishedD>
    thread_dispatch();
    800043f8:	ffffd097          	auipc	ra,0xffffd
    800043fc:	030080e7          	jalr	48(ra) # 80001428 <_Z15thread_dispatchv>
}
    80004400:	01813083          	ld	ra,24(sp)
    80004404:	01013403          	ld	s0,16(sp)
    80004408:	00813483          	ld	s1,8(sp)
    8000440c:	00013903          	ld	s2,0(sp)
    80004410:	02010113          	addi	sp,sp,32
    80004414:	00008067          	ret

0000000080004418 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80004418:	fc010113          	addi	sp,sp,-64
    8000441c:	02113c23          	sd	ra,56(sp)
    80004420:	02813823          	sd	s0,48(sp)
    80004424:	02913423          	sd	s1,40(sp)
    80004428:	03213023          	sd	s2,32(sp)
    8000442c:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80004430:	02000513          	li	a0,32
    80004434:	ffffe097          	auipc	ra,0xffffe
    80004438:	364080e7          	jalr	868(ra) # 80002798 <_Znwm>
    8000443c:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004440:	ffffe097          	auipc	ra,0xffffe
    80004444:	610080e7          	jalr	1552(ra) # 80002a50 <_ZN6ThreadC1Ev>
    80004448:	00008797          	auipc	a5,0x8
    8000444c:	4d878793          	addi	a5,a5,1240 # 8000c920 <_ZTV7WorkerA+0x10>
    80004450:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004454:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004458:	00006517          	auipc	a0,0x6
    8000445c:	f7050513          	addi	a0,a0,-144 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80004460:	00002097          	auipc	ra,0x2
    80004464:	a60080e7          	jalr	-1440(ra) # 80005ec0 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004468:	02000513          	li	a0,32
    8000446c:	ffffe097          	auipc	ra,0xffffe
    80004470:	32c080e7          	jalr	812(ra) # 80002798 <_Znwm>
    80004474:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004478:	ffffe097          	auipc	ra,0xffffe
    8000447c:	5d8080e7          	jalr	1496(ra) # 80002a50 <_ZN6ThreadC1Ev>
    80004480:	00008797          	auipc	a5,0x8
    80004484:	4c878793          	addi	a5,a5,1224 # 8000c948 <_ZTV7WorkerB+0x10>
    80004488:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    8000448c:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004490:	00006517          	auipc	a0,0x6
    80004494:	f5050513          	addi	a0,a0,-176 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80004498:	00002097          	auipc	ra,0x2
    8000449c:	a28080e7          	jalr	-1496(ra) # 80005ec0 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800044a0:	02000513          	li	a0,32
    800044a4:	ffffe097          	auipc	ra,0xffffe
    800044a8:	2f4080e7          	jalr	756(ra) # 80002798 <_Znwm>
    800044ac:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800044b0:	ffffe097          	auipc	ra,0xffffe
    800044b4:	5a0080e7          	jalr	1440(ra) # 80002a50 <_ZN6ThreadC1Ev>
    800044b8:	00008797          	auipc	a5,0x8
    800044bc:	4b878793          	addi	a5,a5,1208 # 8000c970 <_ZTV7WorkerC+0x10>
    800044c0:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800044c4:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800044c8:	00006517          	auipc	a0,0x6
    800044cc:	f3050513          	addi	a0,a0,-208 # 8000a3f8 <_ZZ9kPrintIntmE6digits+0x388>
    800044d0:	00002097          	auipc	ra,0x2
    800044d4:	9f0080e7          	jalr	-1552(ra) # 80005ec0 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800044d8:	02000513          	li	a0,32
    800044dc:	ffffe097          	auipc	ra,0xffffe
    800044e0:	2bc080e7          	jalr	700(ra) # 80002798 <_Znwm>
    800044e4:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800044e8:	ffffe097          	auipc	ra,0xffffe
    800044ec:	568080e7          	jalr	1384(ra) # 80002a50 <_ZN6ThreadC1Ev>
    800044f0:	00008797          	auipc	a5,0x8
    800044f4:	4a878793          	addi	a5,a5,1192 # 8000c998 <_ZTV7WorkerD+0x10>
    800044f8:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800044fc:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004500:	00006517          	auipc	a0,0x6
    80004504:	f1050513          	addi	a0,a0,-240 # 8000a410 <_ZZ9kPrintIntmE6digits+0x3a0>
    80004508:	00002097          	auipc	ra,0x2
    8000450c:	9b8080e7          	jalr	-1608(ra) # 80005ec0 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004510:	00000493          	li	s1,0
    80004514:	00300793          	li	a5,3
    80004518:	0297c663          	blt	a5,s1,80004544 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    8000451c:	00349793          	slli	a5,s1,0x3
    80004520:	fe040713          	addi	a4,s0,-32
    80004524:	00f707b3          	add	a5,a4,a5
    80004528:	fe07b503          	ld	a0,-32(a5)
    8000452c:	ffffe097          	auipc	ra,0xffffe
    80004530:	41c080e7          	jalr	1052(ra) # 80002948 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80004534:	0014849b          	addiw	s1,s1,1
    80004538:	fddff06f          	j	80004514 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    8000453c:	ffffe097          	auipc	ra,0xffffe
    80004540:	470080e7          	jalr	1136(ra) # 800029ac <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004544:	00008797          	auipc	a5,0x8
    80004548:	7847c783          	lbu	a5,1924(a5) # 8000ccc8 <_ZL9finishedA>
    8000454c:	fe0788e3          	beqz	a5,8000453c <_Z20Threads_CPP_API_testv+0x124>
    80004550:	00008797          	auipc	a5,0x8
    80004554:	7797c783          	lbu	a5,1913(a5) # 8000ccc9 <_ZL9finishedB>
    80004558:	fe0782e3          	beqz	a5,8000453c <_Z20Threads_CPP_API_testv+0x124>
    8000455c:	00008797          	auipc	a5,0x8
    80004560:	76e7c783          	lbu	a5,1902(a5) # 8000ccca <_ZL9finishedC>
    80004564:	fc078ce3          	beqz	a5,8000453c <_Z20Threads_CPP_API_testv+0x124>
    80004568:	00008797          	auipc	a5,0x8
    8000456c:	7637c783          	lbu	a5,1891(a5) # 8000cccb <_ZL9finishedD>
    80004570:	fc0786e3          	beqz	a5,8000453c <_Z20Threads_CPP_API_testv+0x124>
    80004574:	fc040493          	addi	s1,s0,-64
    80004578:	0080006f          	j	80004580 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    8000457c:	00848493          	addi	s1,s1,8
    80004580:	fe040793          	addi	a5,s0,-32
    80004584:	08f48663          	beq	s1,a5,80004610 <_Z20Threads_CPP_API_testv+0x1f8>
    80004588:	0004b503          	ld	a0,0(s1)
		delete thread;
    8000458c:	fe0508e3          	beqz	a0,8000457c <_Z20Threads_CPP_API_testv+0x164>
    80004590:	00053783          	ld	a5,0(a0)
    80004594:	0087b783          	ld	a5,8(a5)
    80004598:	000780e7          	jalr	a5
    8000459c:	fe1ff06f          	j	8000457c <_Z20Threads_CPP_API_testv+0x164>
    800045a0:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800045a4:	00048513          	mv	a0,s1
    800045a8:	ffffe097          	auipc	ra,0xffffe
    800045ac:	240080e7          	jalr	576(ra) # 800027e8 <_ZdlPv>
    800045b0:	00090513          	mv	a0,s2
    800045b4:	0000a097          	auipc	ra,0xa
    800045b8:	824080e7          	jalr	-2012(ra) # 8000ddd8 <_Unwind_Resume>
    800045bc:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800045c0:	00048513          	mv	a0,s1
    800045c4:	ffffe097          	auipc	ra,0xffffe
    800045c8:	224080e7          	jalr	548(ra) # 800027e8 <_ZdlPv>
    800045cc:	00090513          	mv	a0,s2
    800045d0:	0000a097          	auipc	ra,0xa
    800045d4:	808080e7          	jalr	-2040(ra) # 8000ddd8 <_Unwind_Resume>
    800045d8:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800045dc:	00048513          	mv	a0,s1
    800045e0:	ffffe097          	auipc	ra,0xffffe
    800045e4:	208080e7          	jalr	520(ra) # 800027e8 <_ZdlPv>
    800045e8:	00090513          	mv	a0,s2
    800045ec:	00009097          	auipc	ra,0x9
    800045f0:	7ec080e7          	jalr	2028(ra) # 8000ddd8 <_Unwind_Resume>
    800045f4:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800045f8:	00048513          	mv	a0,s1
    800045fc:	ffffe097          	auipc	ra,0xffffe
    80004600:	1ec080e7          	jalr	492(ra) # 800027e8 <_ZdlPv>
    80004604:	00090513          	mv	a0,s2
    80004608:	00009097          	auipc	ra,0x9
    8000460c:	7d0080e7          	jalr	2000(ra) # 8000ddd8 <_Unwind_Resume>
	}
}
    80004610:	03813083          	ld	ra,56(sp)
    80004614:	03013403          	ld	s0,48(sp)
    80004618:	02813483          	ld	s1,40(sp)
    8000461c:	02013903          	ld	s2,32(sp)
    80004620:	04010113          	addi	sp,sp,64
    80004624:	00008067          	ret

0000000080004628 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004628:	ff010113          	addi	sp,sp,-16
    8000462c:	00113423          	sd	ra,8(sp)
    80004630:	00813023          	sd	s0,0(sp)
    80004634:	01010413          	addi	s0,sp,16
    80004638:	00008797          	auipc	a5,0x8
    8000463c:	2e878793          	addi	a5,a5,744 # 8000c920 <_ZTV7WorkerA+0x10>
    80004640:	00f53023          	sd	a5,0(a0)
    80004644:	ffffe097          	auipc	ra,0xffffe
    80004648:	064080e7          	jalr	100(ra) # 800026a8 <_ZN6ThreadD1Ev>
    8000464c:	00813083          	ld	ra,8(sp)
    80004650:	00013403          	ld	s0,0(sp)
    80004654:	01010113          	addi	sp,sp,16
    80004658:	00008067          	ret

000000008000465c <_ZN7WorkerAD0Ev>:
    8000465c:	fe010113          	addi	sp,sp,-32
    80004660:	00113c23          	sd	ra,24(sp)
    80004664:	00813823          	sd	s0,16(sp)
    80004668:	00913423          	sd	s1,8(sp)
    8000466c:	02010413          	addi	s0,sp,32
    80004670:	00050493          	mv	s1,a0
    80004674:	00008797          	auipc	a5,0x8
    80004678:	2ac78793          	addi	a5,a5,684 # 8000c920 <_ZTV7WorkerA+0x10>
    8000467c:	00f53023          	sd	a5,0(a0)
    80004680:	ffffe097          	auipc	ra,0xffffe
    80004684:	028080e7          	jalr	40(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004688:	00048513          	mv	a0,s1
    8000468c:	ffffe097          	auipc	ra,0xffffe
    80004690:	15c080e7          	jalr	348(ra) # 800027e8 <_ZdlPv>
    80004694:	01813083          	ld	ra,24(sp)
    80004698:	01013403          	ld	s0,16(sp)
    8000469c:	00813483          	ld	s1,8(sp)
    800046a0:	02010113          	addi	sp,sp,32
    800046a4:	00008067          	ret

00000000800046a8 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800046a8:	ff010113          	addi	sp,sp,-16
    800046ac:	00113423          	sd	ra,8(sp)
    800046b0:	00813023          	sd	s0,0(sp)
    800046b4:	01010413          	addi	s0,sp,16
    800046b8:	00008797          	auipc	a5,0x8
    800046bc:	29078793          	addi	a5,a5,656 # 8000c948 <_ZTV7WorkerB+0x10>
    800046c0:	00f53023          	sd	a5,0(a0)
    800046c4:	ffffe097          	auipc	ra,0xffffe
    800046c8:	fe4080e7          	jalr	-28(ra) # 800026a8 <_ZN6ThreadD1Ev>
    800046cc:	00813083          	ld	ra,8(sp)
    800046d0:	00013403          	ld	s0,0(sp)
    800046d4:	01010113          	addi	sp,sp,16
    800046d8:	00008067          	ret

00000000800046dc <_ZN7WorkerBD0Ev>:
    800046dc:	fe010113          	addi	sp,sp,-32
    800046e0:	00113c23          	sd	ra,24(sp)
    800046e4:	00813823          	sd	s0,16(sp)
    800046e8:	00913423          	sd	s1,8(sp)
    800046ec:	02010413          	addi	s0,sp,32
    800046f0:	00050493          	mv	s1,a0
    800046f4:	00008797          	auipc	a5,0x8
    800046f8:	25478793          	addi	a5,a5,596 # 8000c948 <_ZTV7WorkerB+0x10>
    800046fc:	00f53023          	sd	a5,0(a0)
    80004700:	ffffe097          	auipc	ra,0xffffe
    80004704:	fa8080e7          	jalr	-88(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004708:	00048513          	mv	a0,s1
    8000470c:	ffffe097          	auipc	ra,0xffffe
    80004710:	0dc080e7          	jalr	220(ra) # 800027e8 <_ZdlPv>
    80004714:	01813083          	ld	ra,24(sp)
    80004718:	01013403          	ld	s0,16(sp)
    8000471c:	00813483          	ld	s1,8(sp)
    80004720:	02010113          	addi	sp,sp,32
    80004724:	00008067          	ret

0000000080004728 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004728:	ff010113          	addi	sp,sp,-16
    8000472c:	00113423          	sd	ra,8(sp)
    80004730:	00813023          	sd	s0,0(sp)
    80004734:	01010413          	addi	s0,sp,16
    80004738:	00008797          	auipc	a5,0x8
    8000473c:	23878793          	addi	a5,a5,568 # 8000c970 <_ZTV7WorkerC+0x10>
    80004740:	00f53023          	sd	a5,0(a0)
    80004744:	ffffe097          	auipc	ra,0xffffe
    80004748:	f64080e7          	jalr	-156(ra) # 800026a8 <_ZN6ThreadD1Ev>
    8000474c:	00813083          	ld	ra,8(sp)
    80004750:	00013403          	ld	s0,0(sp)
    80004754:	01010113          	addi	sp,sp,16
    80004758:	00008067          	ret

000000008000475c <_ZN7WorkerCD0Ev>:
    8000475c:	fe010113          	addi	sp,sp,-32
    80004760:	00113c23          	sd	ra,24(sp)
    80004764:	00813823          	sd	s0,16(sp)
    80004768:	00913423          	sd	s1,8(sp)
    8000476c:	02010413          	addi	s0,sp,32
    80004770:	00050493          	mv	s1,a0
    80004774:	00008797          	auipc	a5,0x8
    80004778:	1fc78793          	addi	a5,a5,508 # 8000c970 <_ZTV7WorkerC+0x10>
    8000477c:	00f53023          	sd	a5,0(a0)
    80004780:	ffffe097          	auipc	ra,0xffffe
    80004784:	f28080e7          	jalr	-216(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004788:	00048513          	mv	a0,s1
    8000478c:	ffffe097          	auipc	ra,0xffffe
    80004790:	05c080e7          	jalr	92(ra) # 800027e8 <_ZdlPv>
    80004794:	01813083          	ld	ra,24(sp)
    80004798:	01013403          	ld	s0,16(sp)
    8000479c:	00813483          	ld	s1,8(sp)
    800047a0:	02010113          	addi	sp,sp,32
    800047a4:	00008067          	ret

00000000800047a8 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800047a8:	ff010113          	addi	sp,sp,-16
    800047ac:	00113423          	sd	ra,8(sp)
    800047b0:	00813023          	sd	s0,0(sp)
    800047b4:	01010413          	addi	s0,sp,16
    800047b8:	00008797          	auipc	a5,0x8
    800047bc:	1e078793          	addi	a5,a5,480 # 8000c998 <_ZTV7WorkerD+0x10>
    800047c0:	00f53023          	sd	a5,0(a0)
    800047c4:	ffffe097          	auipc	ra,0xffffe
    800047c8:	ee4080e7          	jalr	-284(ra) # 800026a8 <_ZN6ThreadD1Ev>
    800047cc:	00813083          	ld	ra,8(sp)
    800047d0:	00013403          	ld	s0,0(sp)
    800047d4:	01010113          	addi	sp,sp,16
    800047d8:	00008067          	ret

00000000800047dc <_ZN7WorkerDD0Ev>:
    800047dc:	fe010113          	addi	sp,sp,-32
    800047e0:	00113c23          	sd	ra,24(sp)
    800047e4:	00813823          	sd	s0,16(sp)
    800047e8:	00913423          	sd	s1,8(sp)
    800047ec:	02010413          	addi	s0,sp,32
    800047f0:	00050493          	mv	s1,a0
    800047f4:	00008797          	auipc	a5,0x8
    800047f8:	1a478793          	addi	a5,a5,420 # 8000c998 <_ZTV7WorkerD+0x10>
    800047fc:	00f53023          	sd	a5,0(a0)
    80004800:	ffffe097          	auipc	ra,0xffffe
    80004804:	ea8080e7          	jalr	-344(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004808:	00048513          	mv	a0,s1
    8000480c:	ffffe097          	auipc	ra,0xffffe
    80004810:	fdc080e7          	jalr	-36(ra) # 800027e8 <_ZdlPv>
    80004814:	01813083          	ld	ra,24(sp)
    80004818:	01013403          	ld	s0,16(sp)
    8000481c:	00813483          	ld	s1,8(sp)
    80004820:	02010113          	addi	sp,sp,32
    80004824:	00008067          	ret

0000000080004828 <_ZN7WorkerA3runEv>:
    void run() override {
    80004828:	ff010113          	addi	sp,sp,-16
    8000482c:	00113423          	sd	ra,8(sp)
    80004830:	00813023          	sd	s0,0(sp)
    80004834:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004838:	00000593          	li	a1,0
    8000483c:	fffff097          	auipc	ra,0xfffff
    80004840:	774080e7          	jalr	1908(ra) # 80003fb0 <_ZN7WorkerA11workerBodyAEPv>
    }
    80004844:	00813083          	ld	ra,8(sp)
    80004848:	00013403          	ld	s0,0(sp)
    8000484c:	01010113          	addi	sp,sp,16
    80004850:	00008067          	ret

0000000080004854 <_ZN7WorkerB3runEv>:
    void run() override {
    80004854:	ff010113          	addi	sp,sp,-16
    80004858:	00113423          	sd	ra,8(sp)
    8000485c:	00813023          	sd	s0,0(sp)
    80004860:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004864:	00000593          	li	a1,0
    80004868:	00000097          	auipc	ra,0x0
    8000486c:	814080e7          	jalr	-2028(ra) # 8000407c <_ZN7WorkerB11workerBodyBEPv>
    }
    80004870:	00813083          	ld	ra,8(sp)
    80004874:	00013403          	ld	s0,0(sp)
    80004878:	01010113          	addi	sp,sp,16
    8000487c:	00008067          	ret

0000000080004880 <_ZN7WorkerC3runEv>:
    void run() override {
    80004880:	ff010113          	addi	sp,sp,-16
    80004884:	00113423          	sd	ra,8(sp)
    80004888:	00813023          	sd	s0,0(sp)
    8000488c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004890:	00000593          	li	a1,0
    80004894:	00000097          	auipc	ra,0x0
    80004898:	8bc080e7          	jalr	-1860(ra) # 80004150 <_ZN7WorkerC11workerBodyCEPv>
    }
    8000489c:	00813083          	ld	ra,8(sp)
    800048a0:	00013403          	ld	s0,0(sp)
    800048a4:	01010113          	addi	sp,sp,16
    800048a8:	00008067          	ret

00000000800048ac <_ZN7WorkerD3runEv>:
    void run() override {
    800048ac:	ff010113          	addi	sp,sp,-16
    800048b0:	00113423          	sd	ra,8(sp)
    800048b4:	00813023          	sd	s0,0(sp)
    800048b8:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800048bc:	00000593          	li	a1,0
    800048c0:	00000097          	auipc	ra,0x0
    800048c4:	a10080e7          	jalr	-1520(ra) # 800042d0 <_ZN7WorkerD11workerBodyDEPv>
    }
    800048c8:	00813083          	ld	ra,8(sp)
    800048cc:	00013403          	ld	s0,0(sp)
    800048d0:	01010113          	addi	sp,sp,16
    800048d4:	00008067          	ret

00000000800048d8 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800048d8:	f8010113          	addi	sp,sp,-128
    800048dc:	06113c23          	sd	ra,120(sp)
    800048e0:	06813823          	sd	s0,112(sp)
    800048e4:	06913423          	sd	s1,104(sp)
    800048e8:	07213023          	sd	s2,96(sp)
    800048ec:	05313c23          	sd	s3,88(sp)
    800048f0:	05413823          	sd	s4,80(sp)
    800048f4:	05513423          	sd	s5,72(sp)
    800048f8:	05613023          	sd	s6,64(sp)
    800048fc:	03713c23          	sd	s7,56(sp)
    80004900:	03813823          	sd	s8,48(sp)
    80004904:	03913423          	sd	s9,40(sp)
    80004908:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    8000490c:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004910:	00006517          	auipc	a0,0x6
    80004914:	92850513          	addi	a0,a0,-1752 # 8000a238 <_ZZ9kPrintIntmE6digits+0x1c8>
    80004918:	00001097          	auipc	ra,0x1
    8000491c:	5a8080e7          	jalr	1448(ra) # 80005ec0 <_Z11printStringPKc>
    getString(input, 30);
    80004920:	01e00593          	li	a1,30
    80004924:	f8040493          	addi	s1,s0,-128
    80004928:	00048513          	mv	a0,s1
    8000492c:	00001097          	auipc	ra,0x1
    80004930:	61c080e7          	jalr	1564(ra) # 80005f48 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004934:	00048513          	mv	a0,s1
    80004938:	00001097          	auipc	ra,0x1
    8000493c:	6e8080e7          	jalr	1768(ra) # 80006020 <_Z11stringToIntPKc>
    80004940:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004944:	00006517          	auipc	a0,0x6
    80004948:	91450513          	addi	a0,a0,-1772 # 8000a258 <_ZZ9kPrintIntmE6digits+0x1e8>
    8000494c:	00001097          	auipc	ra,0x1
    80004950:	574080e7          	jalr	1396(ra) # 80005ec0 <_Z11printStringPKc>
    getString(input, 30);
    80004954:	01e00593          	li	a1,30
    80004958:	00048513          	mv	a0,s1
    8000495c:	00001097          	auipc	ra,0x1
    80004960:	5ec080e7          	jalr	1516(ra) # 80005f48 <_Z9getStringPci>
    n = stringToInt(input);
    80004964:	00048513          	mv	a0,s1
    80004968:	00001097          	auipc	ra,0x1
    8000496c:	6b8080e7          	jalr	1720(ra) # 80006020 <_Z11stringToIntPKc>
    80004970:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004974:	00006517          	auipc	a0,0x6
    80004978:	90450513          	addi	a0,a0,-1788 # 8000a278 <_ZZ9kPrintIntmE6digits+0x208>
    8000497c:	00001097          	auipc	ra,0x1
    80004980:	544080e7          	jalr	1348(ra) # 80005ec0 <_Z11printStringPKc>
    printInt(threadNum);
    80004984:	00000613          	li	a2,0
    80004988:	00a00593          	li	a1,10
    8000498c:	00098513          	mv	a0,s3
    80004990:	00001097          	auipc	ra,0x1
    80004994:	6e0080e7          	jalr	1760(ra) # 80006070 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004998:	00006517          	auipc	a0,0x6
    8000499c:	8f850513          	addi	a0,a0,-1800 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    800049a0:	00001097          	auipc	ra,0x1
    800049a4:	520080e7          	jalr	1312(ra) # 80005ec0 <_Z11printStringPKc>
    printInt(n);
    800049a8:	00000613          	li	a2,0
    800049ac:	00a00593          	li	a1,10
    800049b0:	00048513          	mv	a0,s1
    800049b4:	00001097          	auipc	ra,0x1
    800049b8:	6bc080e7          	jalr	1724(ra) # 80006070 <_Z8printIntiii>
    printString(".\n");
    800049bc:	00006517          	auipc	a0,0x6
    800049c0:	8ec50513          	addi	a0,a0,-1812 # 8000a2a8 <_ZZ9kPrintIntmE6digits+0x238>
    800049c4:	00001097          	auipc	ra,0x1
    800049c8:	4fc080e7          	jalr	1276(ra) # 80005ec0 <_Z11printStringPKc>
    if (threadNum > n) {
    800049cc:	0334c463          	blt	s1,s3,800049f4 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800049d0:	03305c63          	blez	s3,80004a08 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800049d4:	03800513          	li	a0,56
    800049d8:	ffffe097          	auipc	ra,0xffffe
    800049dc:	dc0080e7          	jalr	-576(ra) # 80002798 <_Znwm>
    800049e0:	00050a93          	mv	s5,a0
    800049e4:	00048593          	mv	a1,s1
    800049e8:	00001097          	auipc	ra,0x1
    800049ec:	7a8080e7          	jalr	1960(ra) # 80006190 <_ZN9BufferCPPC1Ei>
    800049f0:	0300006f          	j	80004a20 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800049f4:	00006517          	auipc	a0,0x6
    800049f8:	8bc50513          	addi	a0,a0,-1860 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    800049fc:	00001097          	auipc	ra,0x1
    80004a00:	4c4080e7          	jalr	1220(ra) # 80005ec0 <_Z11printStringPKc>
        return;
    80004a04:	0140006f          	j	80004a18 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004a08:	00006517          	auipc	a0,0x6
    80004a0c:	8e850513          	addi	a0,a0,-1816 # 8000a2f0 <_ZZ9kPrintIntmE6digits+0x280>
    80004a10:	00001097          	auipc	ra,0x1
    80004a14:	4b0080e7          	jalr	1200(ra) # 80005ec0 <_Z11printStringPKc>
        return;
    80004a18:	000c0113          	mv	sp,s8
    80004a1c:	2140006f          	j	80004c30 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004a20:	01000513          	li	a0,16
    80004a24:	ffffe097          	auipc	ra,0xffffe
    80004a28:	d74080e7          	jalr	-652(ra) # 80002798 <_Znwm>
    80004a2c:	00050913          	mv	s2,a0
    80004a30:	00000593          	li	a1,0
    80004a34:	ffffe097          	auipc	ra,0xffffe
    80004a38:	098080e7          	jalr	152(ra) # 80002acc <_ZN9SemaphoreC1Ej>
    80004a3c:	00008797          	auipc	a5,0x8
    80004a40:	2927be23          	sd	s2,668(a5) # 8000ccd8 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004a44:	00399793          	slli	a5,s3,0x3
    80004a48:	00f78793          	addi	a5,a5,15
    80004a4c:	ff07f793          	andi	a5,a5,-16
    80004a50:	40f10133          	sub	sp,sp,a5
    80004a54:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004a58:	0019871b          	addiw	a4,s3,1
    80004a5c:	00171793          	slli	a5,a4,0x1
    80004a60:	00e787b3          	add	a5,a5,a4
    80004a64:	00379793          	slli	a5,a5,0x3
    80004a68:	00f78793          	addi	a5,a5,15
    80004a6c:	ff07f793          	andi	a5,a5,-16
    80004a70:	40f10133          	sub	sp,sp,a5
    80004a74:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004a78:	00199493          	slli	s1,s3,0x1
    80004a7c:	013484b3          	add	s1,s1,s3
    80004a80:	00349493          	slli	s1,s1,0x3
    80004a84:	009b04b3          	add	s1,s6,s1
    80004a88:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004a8c:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004a90:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004a94:	02800513          	li	a0,40
    80004a98:	ffffe097          	auipc	ra,0xffffe
    80004a9c:	d00080e7          	jalr	-768(ra) # 80002798 <_Znwm>
    80004aa0:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004aa4:	ffffe097          	auipc	ra,0xffffe
    80004aa8:	fac080e7          	jalr	-84(ra) # 80002a50 <_ZN6ThreadC1Ev>
    80004aac:	00008797          	auipc	a5,0x8
    80004ab0:	f6478793          	addi	a5,a5,-156 # 8000ca10 <_ZTV8Consumer+0x10>
    80004ab4:	00fbb023          	sd	a5,0(s7)
    80004ab8:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004abc:	000b8513          	mv	a0,s7
    80004ac0:	ffffe097          	auipc	ra,0xffffe
    80004ac4:	e88080e7          	jalr	-376(ra) # 80002948 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004ac8:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004acc:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004ad0:	00008797          	auipc	a5,0x8
    80004ad4:	2087b783          	ld	a5,520(a5) # 8000ccd8 <_ZL10waitForAll>
    80004ad8:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004adc:	02800513          	li	a0,40
    80004ae0:	ffffe097          	auipc	ra,0xffffe
    80004ae4:	cb8080e7          	jalr	-840(ra) # 80002798 <_Znwm>
    80004ae8:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004aec:	ffffe097          	auipc	ra,0xffffe
    80004af0:	f64080e7          	jalr	-156(ra) # 80002a50 <_ZN6ThreadC1Ev>
    80004af4:	00008797          	auipc	a5,0x8
    80004af8:	ecc78793          	addi	a5,a5,-308 # 8000c9c0 <_ZTV16ProducerKeyborad+0x10>
    80004afc:	00f4b023          	sd	a5,0(s1)
    80004b00:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004b04:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004b08:	00048513          	mv	a0,s1
    80004b0c:	ffffe097          	auipc	ra,0xffffe
    80004b10:	e3c080e7          	jalr	-452(ra) # 80002948 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004b14:	00100913          	li	s2,1
    80004b18:	0300006f          	j	80004b48 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004b1c:	00008797          	auipc	a5,0x8
    80004b20:	ecc78793          	addi	a5,a5,-308 # 8000c9e8 <_ZTV8Producer+0x10>
    80004b24:	00fcb023          	sd	a5,0(s9)
    80004b28:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004b2c:	00391793          	slli	a5,s2,0x3
    80004b30:	00fa07b3          	add	a5,s4,a5
    80004b34:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004b38:	000c8513          	mv	a0,s9
    80004b3c:	ffffe097          	auipc	ra,0xffffe
    80004b40:	e0c080e7          	jalr	-500(ra) # 80002948 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004b44:	0019091b          	addiw	s2,s2,1
    80004b48:	05395263          	bge	s2,s3,80004b8c <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004b4c:	00191493          	slli	s1,s2,0x1
    80004b50:	012484b3          	add	s1,s1,s2
    80004b54:	00349493          	slli	s1,s1,0x3
    80004b58:	009b04b3          	add	s1,s6,s1
    80004b5c:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004b60:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004b64:	00008797          	auipc	a5,0x8
    80004b68:	1747b783          	ld	a5,372(a5) # 8000ccd8 <_ZL10waitForAll>
    80004b6c:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004b70:	02800513          	li	a0,40
    80004b74:	ffffe097          	auipc	ra,0xffffe
    80004b78:	c24080e7          	jalr	-988(ra) # 80002798 <_Znwm>
    80004b7c:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004b80:	ffffe097          	auipc	ra,0xffffe
    80004b84:	ed0080e7          	jalr	-304(ra) # 80002a50 <_ZN6ThreadC1Ev>
    80004b88:	f95ff06f          	j	80004b1c <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004b8c:	ffffe097          	auipc	ra,0xffffe
    80004b90:	e20080e7          	jalr	-480(ra) # 800029ac <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004b94:	00000493          	li	s1,0
    80004b98:	0099ce63          	blt	s3,s1,80004bb4 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004b9c:	00008517          	auipc	a0,0x8
    80004ba0:	13c53503          	ld	a0,316(a0) # 8000ccd8 <_ZL10waitForAll>
    80004ba4:	ffffe097          	auipc	ra,0xffffe
    80004ba8:	f60080e7          	jalr	-160(ra) # 80002b04 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004bac:	0014849b          	addiw	s1,s1,1
    80004bb0:	fe9ff06f          	j	80004b98 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004bb4:	00008517          	auipc	a0,0x8
    80004bb8:	12453503          	ld	a0,292(a0) # 8000ccd8 <_ZL10waitForAll>
    80004bbc:	00050863          	beqz	a0,80004bcc <_Z20testConsumerProducerv+0x2f4>
    80004bc0:	00053783          	ld	a5,0(a0)
    80004bc4:	0087b783          	ld	a5,8(a5)
    80004bc8:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004bcc:	00000493          	li	s1,0
    80004bd0:	0080006f          	j	80004bd8 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004bd4:	0014849b          	addiw	s1,s1,1
    80004bd8:	0334d263          	bge	s1,s3,80004bfc <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004bdc:	00349793          	slli	a5,s1,0x3
    80004be0:	00fa07b3          	add	a5,s4,a5
    80004be4:	0007b503          	ld	a0,0(a5)
    80004be8:	fe0506e3          	beqz	a0,80004bd4 <_Z20testConsumerProducerv+0x2fc>
    80004bec:	00053783          	ld	a5,0(a0)
    80004bf0:	0087b783          	ld	a5,8(a5)
    80004bf4:	000780e7          	jalr	a5
    80004bf8:	fddff06f          	j	80004bd4 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004bfc:	000b8a63          	beqz	s7,80004c10 <_Z20testConsumerProducerv+0x338>
    80004c00:	000bb783          	ld	a5,0(s7)
    80004c04:	0087b783          	ld	a5,8(a5)
    80004c08:	000b8513          	mv	a0,s7
    80004c0c:	000780e7          	jalr	a5
    delete buffer;
    80004c10:	000a8e63          	beqz	s5,80004c2c <_Z20testConsumerProducerv+0x354>
    80004c14:	000a8513          	mv	a0,s5
    80004c18:	00002097          	auipc	ra,0x2
    80004c1c:	870080e7          	jalr	-1936(ra) # 80006488 <_ZN9BufferCPPD1Ev>
    80004c20:	000a8513          	mv	a0,s5
    80004c24:	ffffe097          	auipc	ra,0xffffe
    80004c28:	bc4080e7          	jalr	-1084(ra) # 800027e8 <_ZdlPv>
    80004c2c:	000c0113          	mv	sp,s8
}
    80004c30:	f8040113          	addi	sp,s0,-128
    80004c34:	07813083          	ld	ra,120(sp)
    80004c38:	07013403          	ld	s0,112(sp)
    80004c3c:	06813483          	ld	s1,104(sp)
    80004c40:	06013903          	ld	s2,96(sp)
    80004c44:	05813983          	ld	s3,88(sp)
    80004c48:	05013a03          	ld	s4,80(sp)
    80004c4c:	04813a83          	ld	s5,72(sp)
    80004c50:	04013b03          	ld	s6,64(sp)
    80004c54:	03813b83          	ld	s7,56(sp)
    80004c58:	03013c03          	ld	s8,48(sp)
    80004c5c:	02813c83          	ld	s9,40(sp)
    80004c60:	08010113          	addi	sp,sp,128
    80004c64:	00008067          	ret
    80004c68:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004c6c:	000a8513          	mv	a0,s5
    80004c70:	ffffe097          	auipc	ra,0xffffe
    80004c74:	b78080e7          	jalr	-1160(ra) # 800027e8 <_ZdlPv>
    80004c78:	00048513          	mv	a0,s1
    80004c7c:	00009097          	auipc	ra,0x9
    80004c80:	15c080e7          	jalr	348(ra) # 8000ddd8 <_Unwind_Resume>
    80004c84:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004c88:	00090513          	mv	a0,s2
    80004c8c:	ffffe097          	auipc	ra,0xffffe
    80004c90:	b5c080e7          	jalr	-1188(ra) # 800027e8 <_ZdlPv>
    80004c94:	00048513          	mv	a0,s1
    80004c98:	00009097          	auipc	ra,0x9
    80004c9c:	140080e7          	jalr	320(ra) # 8000ddd8 <_Unwind_Resume>
    80004ca0:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004ca4:	000b8513          	mv	a0,s7
    80004ca8:	ffffe097          	auipc	ra,0xffffe
    80004cac:	b40080e7          	jalr	-1216(ra) # 800027e8 <_ZdlPv>
    80004cb0:	00048513          	mv	a0,s1
    80004cb4:	00009097          	auipc	ra,0x9
    80004cb8:	124080e7          	jalr	292(ra) # 8000ddd8 <_Unwind_Resume>
    80004cbc:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004cc0:	00048513          	mv	a0,s1
    80004cc4:	ffffe097          	auipc	ra,0xffffe
    80004cc8:	b24080e7          	jalr	-1244(ra) # 800027e8 <_ZdlPv>
    80004ccc:	00090513          	mv	a0,s2
    80004cd0:	00009097          	auipc	ra,0x9
    80004cd4:	108080e7          	jalr	264(ra) # 8000ddd8 <_Unwind_Resume>
    80004cd8:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004cdc:	000c8513          	mv	a0,s9
    80004ce0:	ffffe097          	auipc	ra,0xffffe
    80004ce4:	b08080e7          	jalr	-1272(ra) # 800027e8 <_ZdlPv>
    80004ce8:	00048513          	mv	a0,s1
    80004cec:	00009097          	auipc	ra,0x9
    80004cf0:	0ec080e7          	jalr	236(ra) # 8000ddd8 <_Unwind_Resume>

0000000080004cf4 <_ZN8Consumer3runEv>:
    void run() override {
    80004cf4:	fd010113          	addi	sp,sp,-48
    80004cf8:	02113423          	sd	ra,40(sp)
    80004cfc:	02813023          	sd	s0,32(sp)
    80004d00:	00913c23          	sd	s1,24(sp)
    80004d04:	01213823          	sd	s2,16(sp)
    80004d08:	01313423          	sd	s3,8(sp)
    80004d0c:	03010413          	addi	s0,sp,48
    80004d10:	00050913          	mv	s2,a0
        int i = 0;
    80004d14:	00000993          	li	s3,0
    80004d18:	0100006f          	j	80004d28 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004d1c:	00a00513          	li	a0,10
    80004d20:	ffffe097          	auipc	ra,0xffffe
    80004d24:	ed8080e7          	jalr	-296(ra) # 80002bf8 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004d28:	00008797          	auipc	a5,0x8
    80004d2c:	fa87a783          	lw	a5,-88(a5) # 8000ccd0 <_ZL9threadEnd>
    80004d30:	04079a63          	bnez	a5,80004d84 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004d34:	02093783          	ld	a5,32(s2)
    80004d38:	0087b503          	ld	a0,8(a5)
    80004d3c:	00001097          	auipc	ra,0x1
    80004d40:	638080e7          	jalr	1592(ra) # 80006374 <_ZN9BufferCPP3getEv>
            i++;
    80004d44:	0019849b          	addiw	s1,s3,1
    80004d48:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004d4c:	0ff57513          	andi	a0,a0,255
    80004d50:	ffffe097          	auipc	ra,0xffffe
    80004d54:	ea8080e7          	jalr	-344(ra) # 80002bf8 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004d58:	05000793          	li	a5,80
    80004d5c:	02f4e4bb          	remw	s1,s1,a5
    80004d60:	fc0494e3          	bnez	s1,80004d28 <_ZN8Consumer3runEv+0x34>
    80004d64:	fb9ff06f          	j	80004d1c <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004d68:	02093783          	ld	a5,32(s2)
    80004d6c:	0087b503          	ld	a0,8(a5)
    80004d70:	00001097          	auipc	ra,0x1
    80004d74:	604080e7          	jalr	1540(ra) # 80006374 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004d78:	0ff57513          	andi	a0,a0,255
    80004d7c:	ffffe097          	auipc	ra,0xffffe
    80004d80:	e7c080e7          	jalr	-388(ra) # 80002bf8 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004d84:	02093783          	ld	a5,32(s2)
    80004d88:	0087b503          	ld	a0,8(a5)
    80004d8c:	00001097          	auipc	ra,0x1
    80004d90:	674080e7          	jalr	1652(ra) # 80006400 <_ZN9BufferCPP6getCntEv>
    80004d94:	fca04ae3          	bgtz	a0,80004d68 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004d98:	02093783          	ld	a5,32(s2)
    80004d9c:	0107b503          	ld	a0,16(a5)
    80004da0:	ffffe097          	auipc	ra,0xffffe
    80004da4:	d90080e7          	jalr	-624(ra) # 80002b30 <_ZN9Semaphore6signalEv>
    }
    80004da8:	02813083          	ld	ra,40(sp)
    80004dac:	02013403          	ld	s0,32(sp)
    80004db0:	01813483          	ld	s1,24(sp)
    80004db4:	01013903          	ld	s2,16(sp)
    80004db8:	00813983          	ld	s3,8(sp)
    80004dbc:	03010113          	addi	sp,sp,48
    80004dc0:	00008067          	ret

0000000080004dc4 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004dc4:	ff010113          	addi	sp,sp,-16
    80004dc8:	00113423          	sd	ra,8(sp)
    80004dcc:	00813023          	sd	s0,0(sp)
    80004dd0:	01010413          	addi	s0,sp,16
    80004dd4:	00008797          	auipc	a5,0x8
    80004dd8:	c3c78793          	addi	a5,a5,-964 # 8000ca10 <_ZTV8Consumer+0x10>
    80004ddc:	00f53023          	sd	a5,0(a0)
    80004de0:	ffffe097          	auipc	ra,0xffffe
    80004de4:	8c8080e7          	jalr	-1848(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004de8:	00813083          	ld	ra,8(sp)
    80004dec:	00013403          	ld	s0,0(sp)
    80004df0:	01010113          	addi	sp,sp,16
    80004df4:	00008067          	ret

0000000080004df8 <_ZN8ConsumerD0Ev>:
    80004df8:	fe010113          	addi	sp,sp,-32
    80004dfc:	00113c23          	sd	ra,24(sp)
    80004e00:	00813823          	sd	s0,16(sp)
    80004e04:	00913423          	sd	s1,8(sp)
    80004e08:	02010413          	addi	s0,sp,32
    80004e0c:	00050493          	mv	s1,a0
    80004e10:	00008797          	auipc	a5,0x8
    80004e14:	c0078793          	addi	a5,a5,-1024 # 8000ca10 <_ZTV8Consumer+0x10>
    80004e18:	00f53023          	sd	a5,0(a0)
    80004e1c:	ffffe097          	auipc	ra,0xffffe
    80004e20:	88c080e7          	jalr	-1908(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004e24:	00048513          	mv	a0,s1
    80004e28:	ffffe097          	auipc	ra,0xffffe
    80004e2c:	9c0080e7          	jalr	-1600(ra) # 800027e8 <_ZdlPv>
    80004e30:	01813083          	ld	ra,24(sp)
    80004e34:	01013403          	ld	s0,16(sp)
    80004e38:	00813483          	ld	s1,8(sp)
    80004e3c:	02010113          	addi	sp,sp,32
    80004e40:	00008067          	ret

0000000080004e44 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004e44:	ff010113          	addi	sp,sp,-16
    80004e48:	00113423          	sd	ra,8(sp)
    80004e4c:	00813023          	sd	s0,0(sp)
    80004e50:	01010413          	addi	s0,sp,16
    80004e54:	00008797          	auipc	a5,0x8
    80004e58:	b6c78793          	addi	a5,a5,-1172 # 8000c9c0 <_ZTV16ProducerKeyborad+0x10>
    80004e5c:	00f53023          	sd	a5,0(a0)
    80004e60:	ffffe097          	auipc	ra,0xffffe
    80004e64:	848080e7          	jalr	-1976(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004e68:	00813083          	ld	ra,8(sp)
    80004e6c:	00013403          	ld	s0,0(sp)
    80004e70:	01010113          	addi	sp,sp,16
    80004e74:	00008067          	ret

0000000080004e78 <_ZN16ProducerKeyboradD0Ev>:
    80004e78:	fe010113          	addi	sp,sp,-32
    80004e7c:	00113c23          	sd	ra,24(sp)
    80004e80:	00813823          	sd	s0,16(sp)
    80004e84:	00913423          	sd	s1,8(sp)
    80004e88:	02010413          	addi	s0,sp,32
    80004e8c:	00050493          	mv	s1,a0
    80004e90:	00008797          	auipc	a5,0x8
    80004e94:	b3078793          	addi	a5,a5,-1232 # 8000c9c0 <_ZTV16ProducerKeyborad+0x10>
    80004e98:	00f53023          	sd	a5,0(a0)
    80004e9c:	ffffe097          	auipc	ra,0xffffe
    80004ea0:	80c080e7          	jalr	-2036(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004ea4:	00048513          	mv	a0,s1
    80004ea8:	ffffe097          	auipc	ra,0xffffe
    80004eac:	940080e7          	jalr	-1728(ra) # 800027e8 <_ZdlPv>
    80004eb0:	01813083          	ld	ra,24(sp)
    80004eb4:	01013403          	ld	s0,16(sp)
    80004eb8:	00813483          	ld	s1,8(sp)
    80004ebc:	02010113          	addi	sp,sp,32
    80004ec0:	00008067          	ret

0000000080004ec4 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004ec4:	ff010113          	addi	sp,sp,-16
    80004ec8:	00113423          	sd	ra,8(sp)
    80004ecc:	00813023          	sd	s0,0(sp)
    80004ed0:	01010413          	addi	s0,sp,16
    80004ed4:	00008797          	auipc	a5,0x8
    80004ed8:	b1478793          	addi	a5,a5,-1260 # 8000c9e8 <_ZTV8Producer+0x10>
    80004edc:	00f53023          	sd	a5,0(a0)
    80004ee0:	ffffd097          	auipc	ra,0xffffd
    80004ee4:	7c8080e7          	jalr	1992(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004ee8:	00813083          	ld	ra,8(sp)
    80004eec:	00013403          	ld	s0,0(sp)
    80004ef0:	01010113          	addi	sp,sp,16
    80004ef4:	00008067          	ret

0000000080004ef8 <_ZN8ProducerD0Ev>:
    80004ef8:	fe010113          	addi	sp,sp,-32
    80004efc:	00113c23          	sd	ra,24(sp)
    80004f00:	00813823          	sd	s0,16(sp)
    80004f04:	00913423          	sd	s1,8(sp)
    80004f08:	02010413          	addi	s0,sp,32
    80004f0c:	00050493          	mv	s1,a0
    80004f10:	00008797          	auipc	a5,0x8
    80004f14:	ad878793          	addi	a5,a5,-1320 # 8000c9e8 <_ZTV8Producer+0x10>
    80004f18:	00f53023          	sd	a5,0(a0)
    80004f1c:	ffffd097          	auipc	ra,0xffffd
    80004f20:	78c080e7          	jalr	1932(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80004f24:	00048513          	mv	a0,s1
    80004f28:	ffffe097          	auipc	ra,0xffffe
    80004f2c:	8c0080e7          	jalr	-1856(ra) # 800027e8 <_ZdlPv>
    80004f30:	01813083          	ld	ra,24(sp)
    80004f34:	01013403          	ld	s0,16(sp)
    80004f38:	00813483          	ld	s1,8(sp)
    80004f3c:	02010113          	addi	sp,sp,32
    80004f40:	00008067          	ret

0000000080004f44 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004f44:	fe010113          	addi	sp,sp,-32
    80004f48:	00113c23          	sd	ra,24(sp)
    80004f4c:	00813823          	sd	s0,16(sp)
    80004f50:	00913423          	sd	s1,8(sp)
    80004f54:	02010413          	addi	s0,sp,32
    80004f58:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004f5c:	ffffc097          	auipc	ra,0xffffc
    80004f60:	60c080e7          	jalr	1548(ra) # 80001568 <_Z4getcv>
    80004f64:	0005059b          	sext.w	a1,a0
    80004f68:	01b00793          	li	a5,27
    80004f6c:	00f58c63          	beq	a1,a5,80004f84 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004f70:	0204b783          	ld	a5,32(s1)
    80004f74:	0087b503          	ld	a0,8(a5)
    80004f78:	00001097          	auipc	ra,0x1
    80004f7c:	36c080e7          	jalr	876(ra) # 800062e4 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004f80:	fddff06f          	j	80004f5c <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004f84:	00100793          	li	a5,1
    80004f88:	00008717          	auipc	a4,0x8
    80004f8c:	d4f72423          	sw	a5,-696(a4) # 8000ccd0 <_ZL9threadEnd>
        td->buffer->put('!');
    80004f90:	0204b783          	ld	a5,32(s1)
    80004f94:	02100593          	li	a1,33
    80004f98:	0087b503          	ld	a0,8(a5)
    80004f9c:	00001097          	auipc	ra,0x1
    80004fa0:	348080e7          	jalr	840(ra) # 800062e4 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004fa4:	0204b783          	ld	a5,32(s1)
    80004fa8:	0107b503          	ld	a0,16(a5)
    80004fac:	ffffe097          	auipc	ra,0xffffe
    80004fb0:	b84080e7          	jalr	-1148(ra) # 80002b30 <_ZN9Semaphore6signalEv>
    }
    80004fb4:	01813083          	ld	ra,24(sp)
    80004fb8:	01013403          	ld	s0,16(sp)
    80004fbc:	00813483          	ld	s1,8(sp)
    80004fc0:	02010113          	addi	sp,sp,32
    80004fc4:	00008067          	ret

0000000080004fc8 <_ZN8Producer3runEv>:
    void run() override {
    80004fc8:	fe010113          	addi	sp,sp,-32
    80004fcc:	00113c23          	sd	ra,24(sp)
    80004fd0:	00813823          	sd	s0,16(sp)
    80004fd4:	00913423          	sd	s1,8(sp)
    80004fd8:	01213023          	sd	s2,0(sp)
    80004fdc:	02010413          	addi	s0,sp,32
    80004fe0:	00050493          	mv	s1,a0
        int i = 0;
    80004fe4:	00000913          	li	s2,0
        while (!threadEnd) {
    80004fe8:	00008797          	auipc	a5,0x8
    80004fec:	ce87a783          	lw	a5,-792(a5) # 8000ccd0 <_ZL9threadEnd>
    80004ff0:	04079263          	bnez	a5,80005034 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004ff4:	0204b783          	ld	a5,32(s1)
    80004ff8:	0007a583          	lw	a1,0(a5)
    80004ffc:	0305859b          	addiw	a1,a1,48
    80005000:	0087b503          	ld	a0,8(a5)
    80005004:	00001097          	auipc	ra,0x1
    80005008:	2e0080e7          	jalr	736(ra) # 800062e4 <_ZN9BufferCPP3putEi>
            i++;
    8000500c:	0019071b          	addiw	a4,s2,1
    80005010:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80005014:	0204b783          	ld	a5,32(s1)
    80005018:	0007a783          	lw	a5,0(a5)
    8000501c:	00e787bb          	addw	a5,a5,a4
    80005020:	00500513          	li	a0,5
    80005024:	02a7e53b          	remw	a0,a5,a0
    80005028:	ffffe097          	auipc	ra,0xffffe
    8000502c:	9ac080e7          	jalr	-1620(ra) # 800029d4 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80005030:	fb9ff06f          	j	80004fe8 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80005034:	0204b783          	ld	a5,32(s1)
    80005038:	0107b503          	ld	a0,16(a5)
    8000503c:	ffffe097          	auipc	ra,0xffffe
    80005040:	af4080e7          	jalr	-1292(ra) # 80002b30 <_ZN9Semaphore6signalEv>
    }
    80005044:	01813083          	ld	ra,24(sp)
    80005048:	01013403          	ld	s0,16(sp)
    8000504c:	00813483          	ld	s1,8(sp)
    80005050:	00013903          	ld	s2,0(sp)
    80005054:	02010113          	addi	sp,sp,32
    80005058:	00008067          	ret

000000008000505c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000505c:	fe010113          	addi	sp,sp,-32
    80005060:	00113c23          	sd	ra,24(sp)
    80005064:	00813823          	sd	s0,16(sp)
    80005068:	00913423          	sd	s1,8(sp)
    8000506c:	01213023          	sd	s2,0(sp)
    80005070:	02010413          	addi	s0,sp,32
    80005074:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005078:	00100793          	li	a5,1
    8000507c:	02a7f863          	bgeu	a5,a0,800050ac <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005080:	00a00793          	li	a5,10
    80005084:	02f577b3          	remu	a5,a0,a5
    80005088:	02078e63          	beqz	a5,800050c4 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000508c:	fff48513          	addi	a0,s1,-1
    80005090:	00000097          	auipc	ra,0x0
    80005094:	fcc080e7          	jalr	-52(ra) # 8000505c <_ZL9fibonaccim>
    80005098:	00050913          	mv	s2,a0
    8000509c:	ffe48513          	addi	a0,s1,-2
    800050a0:	00000097          	auipc	ra,0x0
    800050a4:	fbc080e7          	jalr	-68(ra) # 8000505c <_ZL9fibonaccim>
    800050a8:	00a90533          	add	a0,s2,a0
}
    800050ac:	01813083          	ld	ra,24(sp)
    800050b0:	01013403          	ld	s0,16(sp)
    800050b4:	00813483          	ld	s1,8(sp)
    800050b8:	00013903          	ld	s2,0(sp)
    800050bc:	02010113          	addi	sp,sp,32
    800050c0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800050c4:	ffffc097          	auipc	ra,0xffffc
    800050c8:	364080e7          	jalr	868(ra) # 80001428 <_Z15thread_dispatchv>
    800050cc:	fc1ff06f          	j	8000508c <_ZL9fibonaccim+0x30>

00000000800050d0 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800050d0:	fe010113          	addi	sp,sp,-32
    800050d4:	00113c23          	sd	ra,24(sp)
    800050d8:	00813823          	sd	s0,16(sp)
    800050dc:	00913423          	sd	s1,8(sp)
    800050e0:	01213023          	sd	s2,0(sp)
    800050e4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800050e8:	00a00493          	li	s1,10
    800050ec:	0400006f          	j	8000512c <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800050f0:	00005517          	auipc	a0,0x5
    800050f4:	2a050513          	addi	a0,a0,672 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    800050f8:	00001097          	auipc	ra,0x1
    800050fc:	dc8080e7          	jalr	-568(ra) # 80005ec0 <_Z11printStringPKc>
    80005100:	00000613          	li	a2,0
    80005104:	00a00593          	li	a1,10
    80005108:	00048513          	mv	a0,s1
    8000510c:	00001097          	auipc	ra,0x1
    80005110:	f64080e7          	jalr	-156(ra) # 80006070 <_Z8printIntiii>
    80005114:	00005517          	auipc	a0,0x5
    80005118:	46c50513          	addi	a0,a0,1132 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    8000511c:	00001097          	auipc	ra,0x1
    80005120:	da4080e7          	jalr	-604(ra) # 80005ec0 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005124:	0014849b          	addiw	s1,s1,1
    80005128:	0ff4f493          	andi	s1,s1,255
    8000512c:	00c00793          	li	a5,12
    80005130:	fc97f0e3          	bgeu	a5,s1,800050f0 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005134:	00005517          	auipc	a0,0x5
    80005138:	26450513          	addi	a0,a0,612 # 8000a398 <_ZZ9kPrintIntmE6digits+0x328>
    8000513c:	00001097          	auipc	ra,0x1
    80005140:	d84080e7          	jalr	-636(ra) # 80005ec0 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005144:	00500313          	li	t1,5
    thread_dispatch();
    80005148:	ffffc097          	auipc	ra,0xffffc
    8000514c:	2e0080e7          	jalr	736(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005150:	01000513          	li	a0,16
    80005154:	00000097          	auipc	ra,0x0
    80005158:	f08080e7          	jalr	-248(ra) # 8000505c <_ZL9fibonaccim>
    8000515c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005160:	00005517          	auipc	a0,0x5
    80005164:	24850513          	addi	a0,a0,584 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    80005168:	00001097          	auipc	ra,0x1
    8000516c:	d58080e7          	jalr	-680(ra) # 80005ec0 <_Z11printStringPKc>
    80005170:	00000613          	li	a2,0
    80005174:	00a00593          	li	a1,10
    80005178:	0009051b          	sext.w	a0,s2
    8000517c:	00001097          	auipc	ra,0x1
    80005180:	ef4080e7          	jalr	-268(ra) # 80006070 <_Z8printIntiii>
    80005184:	00005517          	auipc	a0,0x5
    80005188:	3fc50513          	addi	a0,a0,1020 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    8000518c:	00001097          	auipc	ra,0x1
    80005190:	d34080e7          	jalr	-716(ra) # 80005ec0 <_Z11printStringPKc>
    80005194:	0400006f          	j	800051d4 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005198:	00005517          	auipc	a0,0x5
    8000519c:	1f850513          	addi	a0,a0,504 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    800051a0:	00001097          	auipc	ra,0x1
    800051a4:	d20080e7          	jalr	-736(ra) # 80005ec0 <_Z11printStringPKc>
    800051a8:	00000613          	li	a2,0
    800051ac:	00a00593          	li	a1,10
    800051b0:	00048513          	mv	a0,s1
    800051b4:	00001097          	auipc	ra,0x1
    800051b8:	ebc080e7          	jalr	-324(ra) # 80006070 <_Z8printIntiii>
    800051bc:	00005517          	auipc	a0,0x5
    800051c0:	3c450513          	addi	a0,a0,964 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800051c4:	00001097          	auipc	ra,0x1
    800051c8:	cfc080e7          	jalr	-772(ra) # 80005ec0 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800051cc:	0014849b          	addiw	s1,s1,1
    800051d0:	0ff4f493          	andi	s1,s1,255
    800051d4:	00f00793          	li	a5,15
    800051d8:	fc97f0e3          	bgeu	a5,s1,80005198 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800051dc:	00005517          	auipc	a0,0x5
    800051e0:	1dc50513          	addi	a0,a0,476 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    800051e4:	00001097          	auipc	ra,0x1
    800051e8:	cdc080e7          	jalr	-804(ra) # 80005ec0 <_Z11printStringPKc>
    finishedD = true;
    800051ec:	00100793          	li	a5,1
    800051f0:	00008717          	auipc	a4,0x8
    800051f4:	aef70823          	sb	a5,-1296(a4) # 8000cce0 <_ZL9finishedD>
    thread_dispatch();
    800051f8:	ffffc097          	auipc	ra,0xffffc
    800051fc:	230080e7          	jalr	560(ra) # 80001428 <_Z15thread_dispatchv>
}
    80005200:	01813083          	ld	ra,24(sp)
    80005204:	01013403          	ld	s0,16(sp)
    80005208:	00813483          	ld	s1,8(sp)
    8000520c:	00013903          	ld	s2,0(sp)
    80005210:	02010113          	addi	sp,sp,32
    80005214:	00008067          	ret

0000000080005218 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005218:	fe010113          	addi	sp,sp,-32
    8000521c:	00113c23          	sd	ra,24(sp)
    80005220:	00813823          	sd	s0,16(sp)
    80005224:	00913423          	sd	s1,8(sp)
    80005228:	01213023          	sd	s2,0(sp)
    8000522c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005230:	00000493          	li	s1,0
    80005234:	0400006f          	j	80005274 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005238:	00005517          	auipc	a0,0x5
    8000523c:	11850513          	addi	a0,a0,280 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80005240:	00001097          	auipc	ra,0x1
    80005244:	c80080e7          	jalr	-896(ra) # 80005ec0 <_Z11printStringPKc>
    80005248:	00000613          	li	a2,0
    8000524c:	00a00593          	li	a1,10
    80005250:	00048513          	mv	a0,s1
    80005254:	00001097          	auipc	ra,0x1
    80005258:	e1c080e7          	jalr	-484(ra) # 80006070 <_Z8printIntiii>
    8000525c:	00005517          	auipc	a0,0x5
    80005260:	32450513          	addi	a0,a0,804 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80005264:	00001097          	auipc	ra,0x1
    80005268:	c5c080e7          	jalr	-932(ra) # 80005ec0 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000526c:	0014849b          	addiw	s1,s1,1
    80005270:	0ff4f493          	andi	s1,s1,255
    80005274:	00200793          	li	a5,2
    80005278:	fc97f0e3          	bgeu	a5,s1,80005238 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    8000527c:	00005517          	auipc	a0,0x5
    80005280:	0dc50513          	addi	a0,a0,220 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80005284:	00001097          	auipc	ra,0x1
    80005288:	c3c080e7          	jalr	-964(ra) # 80005ec0 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000528c:	00700313          	li	t1,7
    thread_dispatch();
    80005290:	ffffc097          	auipc	ra,0xffffc
    80005294:	198080e7          	jalr	408(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005298:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    8000529c:	00005517          	auipc	a0,0x5
    800052a0:	0cc50513          	addi	a0,a0,204 # 8000a368 <_ZZ9kPrintIntmE6digits+0x2f8>
    800052a4:	00001097          	auipc	ra,0x1
    800052a8:	c1c080e7          	jalr	-996(ra) # 80005ec0 <_Z11printStringPKc>
    800052ac:	00000613          	li	a2,0
    800052b0:	00a00593          	li	a1,10
    800052b4:	0009051b          	sext.w	a0,s2
    800052b8:	00001097          	auipc	ra,0x1
    800052bc:	db8080e7          	jalr	-584(ra) # 80006070 <_Z8printIntiii>
    800052c0:	00005517          	auipc	a0,0x5
    800052c4:	2c050513          	addi	a0,a0,704 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800052c8:	00001097          	auipc	ra,0x1
    800052cc:	bf8080e7          	jalr	-1032(ra) # 80005ec0 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800052d0:	00c00513          	li	a0,12
    800052d4:	00000097          	auipc	ra,0x0
    800052d8:	d88080e7          	jalr	-632(ra) # 8000505c <_ZL9fibonaccim>
    800052dc:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800052e0:	00005517          	auipc	a0,0x5
    800052e4:	09050513          	addi	a0,a0,144 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    800052e8:	00001097          	auipc	ra,0x1
    800052ec:	bd8080e7          	jalr	-1064(ra) # 80005ec0 <_Z11printStringPKc>
    800052f0:	00000613          	li	a2,0
    800052f4:	00a00593          	li	a1,10
    800052f8:	0009051b          	sext.w	a0,s2
    800052fc:	00001097          	auipc	ra,0x1
    80005300:	d74080e7          	jalr	-652(ra) # 80006070 <_Z8printIntiii>
    80005304:	00005517          	auipc	a0,0x5
    80005308:	27c50513          	addi	a0,a0,636 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    8000530c:	00001097          	auipc	ra,0x1
    80005310:	bb4080e7          	jalr	-1100(ra) # 80005ec0 <_Z11printStringPKc>
    80005314:	0400006f          	j	80005354 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005318:	00005517          	auipc	a0,0x5
    8000531c:	03850513          	addi	a0,a0,56 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80005320:	00001097          	auipc	ra,0x1
    80005324:	ba0080e7          	jalr	-1120(ra) # 80005ec0 <_Z11printStringPKc>
    80005328:	00000613          	li	a2,0
    8000532c:	00a00593          	li	a1,10
    80005330:	00048513          	mv	a0,s1
    80005334:	00001097          	auipc	ra,0x1
    80005338:	d3c080e7          	jalr	-708(ra) # 80006070 <_Z8printIntiii>
    8000533c:	00005517          	auipc	a0,0x5
    80005340:	24450513          	addi	a0,a0,580 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80005344:	00001097          	auipc	ra,0x1
    80005348:	b7c080e7          	jalr	-1156(ra) # 80005ec0 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000534c:	0014849b          	addiw	s1,s1,1
    80005350:	0ff4f493          	andi	s1,s1,255
    80005354:	00500793          	li	a5,5
    80005358:	fc97f0e3          	bgeu	a5,s1,80005318 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    8000535c:	00005517          	auipc	a0,0x5
    80005360:	02450513          	addi	a0,a0,36 # 8000a380 <_ZZ9kPrintIntmE6digits+0x310>
    80005364:	00001097          	auipc	ra,0x1
    80005368:	b5c080e7          	jalr	-1188(ra) # 80005ec0 <_Z11printStringPKc>
    finishedC = true;
    8000536c:	00100793          	li	a5,1
    80005370:	00008717          	auipc	a4,0x8
    80005374:	96f708a3          	sb	a5,-1679(a4) # 8000cce1 <_ZL9finishedC>
    thread_dispatch();
    80005378:	ffffc097          	auipc	ra,0xffffc
    8000537c:	0b0080e7          	jalr	176(ra) # 80001428 <_Z15thread_dispatchv>
}
    80005380:	01813083          	ld	ra,24(sp)
    80005384:	01013403          	ld	s0,16(sp)
    80005388:	00813483          	ld	s1,8(sp)
    8000538c:	00013903          	ld	s2,0(sp)
    80005390:	02010113          	addi	sp,sp,32
    80005394:	00008067          	ret

0000000080005398 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005398:	fe010113          	addi	sp,sp,-32
    8000539c:	00113c23          	sd	ra,24(sp)
    800053a0:	00813823          	sd	s0,16(sp)
    800053a4:	00913423          	sd	s1,8(sp)
    800053a8:	01213023          	sd	s2,0(sp)
    800053ac:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800053b0:	00000913          	li	s2,0
    800053b4:	0380006f          	j	800053ec <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    800053b8:	ffffc097          	auipc	ra,0xffffc
    800053bc:	070080e7          	jalr	112(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800053c0:	00148493          	addi	s1,s1,1
    800053c4:	000027b7          	lui	a5,0x2
    800053c8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800053cc:	0097ee63          	bltu	a5,s1,800053e8 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800053d0:	00000713          	li	a4,0
    800053d4:	000077b7          	lui	a5,0x7
    800053d8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800053dc:	fce7eee3          	bltu	a5,a4,800053b8 <_ZL11workerBodyBPv+0x20>
    800053e0:	00170713          	addi	a4,a4,1
    800053e4:	ff1ff06f          	j	800053d4 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800053e8:	00190913          	addi	s2,s2,1
    800053ec:	00f00793          	li	a5,15
    800053f0:	0527e063          	bltu	a5,s2,80005430 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800053f4:	00005517          	auipc	a0,0x5
    800053f8:	f4450513          	addi	a0,a0,-188 # 8000a338 <_ZZ9kPrintIntmE6digits+0x2c8>
    800053fc:	00001097          	auipc	ra,0x1
    80005400:	ac4080e7          	jalr	-1340(ra) # 80005ec0 <_Z11printStringPKc>
    80005404:	00000613          	li	a2,0
    80005408:	00a00593          	li	a1,10
    8000540c:	0009051b          	sext.w	a0,s2
    80005410:	00001097          	auipc	ra,0x1
    80005414:	c60080e7          	jalr	-928(ra) # 80006070 <_Z8printIntiii>
    80005418:	00005517          	auipc	a0,0x5
    8000541c:	16850513          	addi	a0,a0,360 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80005420:	00001097          	auipc	ra,0x1
    80005424:	aa0080e7          	jalr	-1376(ra) # 80005ec0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005428:	00000493          	li	s1,0
    8000542c:	f99ff06f          	j	800053c4 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80005430:	00005517          	auipc	a0,0x5
    80005434:	f1050513          	addi	a0,a0,-240 # 8000a340 <_ZZ9kPrintIntmE6digits+0x2d0>
    80005438:	00001097          	auipc	ra,0x1
    8000543c:	a88080e7          	jalr	-1400(ra) # 80005ec0 <_Z11printStringPKc>
    finishedB = true;
    80005440:	00100793          	li	a5,1
    80005444:	00008717          	auipc	a4,0x8
    80005448:	88f70f23          	sb	a5,-1890(a4) # 8000cce2 <_ZL9finishedB>
    thread_dispatch();
    8000544c:	ffffc097          	auipc	ra,0xffffc
    80005450:	fdc080e7          	jalr	-36(ra) # 80001428 <_Z15thread_dispatchv>
}
    80005454:	01813083          	ld	ra,24(sp)
    80005458:	01013403          	ld	s0,16(sp)
    8000545c:	00813483          	ld	s1,8(sp)
    80005460:	00013903          	ld	s2,0(sp)
    80005464:	02010113          	addi	sp,sp,32
    80005468:	00008067          	ret

000000008000546c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    8000546c:	fe010113          	addi	sp,sp,-32
    80005470:	00113c23          	sd	ra,24(sp)
    80005474:	00813823          	sd	s0,16(sp)
    80005478:	00913423          	sd	s1,8(sp)
    8000547c:	01213023          	sd	s2,0(sp)
    80005480:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005484:	00000913          	li	s2,0
    80005488:	0380006f          	j	800054c0 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    8000548c:	ffffc097          	auipc	ra,0xffffc
    80005490:	f9c080e7          	jalr	-100(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005494:	00148493          	addi	s1,s1,1
    80005498:	000027b7          	lui	a5,0x2
    8000549c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800054a0:	0097ee63          	bltu	a5,s1,800054bc <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800054a4:	00000713          	li	a4,0
    800054a8:	000077b7          	lui	a5,0x7
    800054ac:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800054b0:	fce7eee3          	bltu	a5,a4,8000548c <_ZL11workerBodyAPv+0x20>
    800054b4:	00170713          	addi	a4,a4,1
    800054b8:	ff1ff06f          	j	800054a8 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800054bc:	00190913          	addi	s2,s2,1
    800054c0:	00900793          	li	a5,9
    800054c4:	0527e063          	bltu	a5,s2,80005504 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800054c8:	00005517          	auipc	a0,0x5
    800054cc:	e5850513          	addi	a0,a0,-424 # 8000a320 <_ZZ9kPrintIntmE6digits+0x2b0>
    800054d0:	00001097          	auipc	ra,0x1
    800054d4:	9f0080e7          	jalr	-1552(ra) # 80005ec0 <_Z11printStringPKc>
    800054d8:	00000613          	li	a2,0
    800054dc:	00a00593          	li	a1,10
    800054e0:	0009051b          	sext.w	a0,s2
    800054e4:	00001097          	auipc	ra,0x1
    800054e8:	b8c080e7          	jalr	-1140(ra) # 80006070 <_Z8printIntiii>
    800054ec:	00005517          	auipc	a0,0x5
    800054f0:	09450513          	addi	a0,a0,148 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800054f4:	00001097          	auipc	ra,0x1
    800054f8:	9cc080e7          	jalr	-1588(ra) # 80005ec0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800054fc:	00000493          	li	s1,0
    80005500:	f99ff06f          	j	80005498 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005504:	00005517          	auipc	a0,0x5
    80005508:	e2450513          	addi	a0,a0,-476 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    8000550c:	00001097          	auipc	ra,0x1
    80005510:	9b4080e7          	jalr	-1612(ra) # 80005ec0 <_Z11printStringPKc>
    finishedA = true;
    80005514:	00100793          	li	a5,1
    80005518:	00007717          	auipc	a4,0x7
    8000551c:	7cf705a3          	sb	a5,1995(a4) # 8000cce3 <_ZL9finishedA>
}
    80005520:	01813083          	ld	ra,24(sp)
    80005524:	01013403          	ld	s0,16(sp)
    80005528:	00813483          	ld	s1,8(sp)
    8000552c:	00013903          	ld	s2,0(sp)
    80005530:	02010113          	addi	sp,sp,32
    80005534:	00008067          	ret

0000000080005538 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005538:	fd010113          	addi	sp,sp,-48
    8000553c:	02113423          	sd	ra,40(sp)
    80005540:	02813023          	sd	s0,32(sp)
    80005544:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005548:	00000613          	li	a2,0
    8000554c:	00000597          	auipc	a1,0x0
    80005550:	f2058593          	addi	a1,a1,-224 # 8000546c <_ZL11workerBodyAPv>
    80005554:	fd040513          	addi	a0,s0,-48
    80005558:	ffffc097          	auipc	ra,0xffffc
    8000555c:	e28080e7          	jalr	-472(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005560:	00005517          	auipc	a0,0x5
    80005564:	e6850513          	addi	a0,a0,-408 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80005568:	00001097          	auipc	ra,0x1
    8000556c:	958080e7          	jalr	-1704(ra) # 80005ec0 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005570:	00000613          	li	a2,0
    80005574:	00000597          	auipc	a1,0x0
    80005578:	e2458593          	addi	a1,a1,-476 # 80005398 <_ZL11workerBodyBPv>
    8000557c:	fd840513          	addi	a0,s0,-40
    80005580:	ffffc097          	auipc	ra,0xffffc
    80005584:	e00080e7          	jalr	-512(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005588:	00005517          	auipc	a0,0x5
    8000558c:	e5850513          	addi	a0,a0,-424 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80005590:	00001097          	auipc	ra,0x1
    80005594:	930080e7          	jalr	-1744(ra) # 80005ec0 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005598:	00000613          	li	a2,0
    8000559c:	00000597          	auipc	a1,0x0
    800055a0:	c7c58593          	addi	a1,a1,-900 # 80005218 <_ZL11workerBodyCPv>
    800055a4:	fe040513          	addi	a0,s0,-32
    800055a8:	ffffc097          	auipc	ra,0xffffc
    800055ac:	dd8080e7          	jalr	-552(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800055b0:	00005517          	auipc	a0,0x5
    800055b4:	e4850513          	addi	a0,a0,-440 # 8000a3f8 <_ZZ9kPrintIntmE6digits+0x388>
    800055b8:	00001097          	auipc	ra,0x1
    800055bc:	908080e7          	jalr	-1784(ra) # 80005ec0 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800055c0:	00000613          	li	a2,0
    800055c4:	00000597          	auipc	a1,0x0
    800055c8:	b0c58593          	addi	a1,a1,-1268 # 800050d0 <_ZL11workerBodyDPv>
    800055cc:	fe840513          	addi	a0,s0,-24
    800055d0:	ffffc097          	auipc	ra,0xffffc
    800055d4:	db0080e7          	jalr	-592(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800055d8:	00005517          	auipc	a0,0x5
    800055dc:	e3850513          	addi	a0,a0,-456 # 8000a410 <_ZZ9kPrintIntmE6digits+0x3a0>
    800055e0:	00001097          	auipc	ra,0x1
    800055e4:	8e0080e7          	jalr	-1824(ra) # 80005ec0 <_Z11printStringPKc>
    800055e8:	00c0006f          	j	800055f4 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800055ec:	ffffc097          	auipc	ra,0xffffc
    800055f0:	e3c080e7          	jalr	-452(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800055f4:	00007797          	auipc	a5,0x7
    800055f8:	6ef7c783          	lbu	a5,1775(a5) # 8000cce3 <_ZL9finishedA>
    800055fc:	fe0788e3          	beqz	a5,800055ec <_Z18Threads_C_API_testv+0xb4>
    80005600:	00007797          	auipc	a5,0x7
    80005604:	6e27c783          	lbu	a5,1762(a5) # 8000cce2 <_ZL9finishedB>
    80005608:	fe0782e3          	beqz	a5,800055ec <_Z18Threads_C_API_testv+0xb4>
    8000560c:	00007797          	auipc	a5,0x7
    80005610:	6d57c783          	lbu	a5,1749(a5) # 8000cce1 <_ZL9finishedC>
    80005614:	fc078ce3          	beqz	a5,800055ec <_Z18Threads_C_API_testv+0xb4>
    80005618:	00007797          	auipc	a5,0x7
    8000561c:	6c87c783          	lbu	a5,1736(a5) # 8000cce0 <_ZL9finishedD>
    80005620:	fc0786e3          	beqz	a5,800055ec <_Z18Threads_C_API_testv+0xb4>
    }

}
    80005624:	02813083          	ld	ra,40(sp)
    80005628:	02013403          	ld	s0,32(sp)
    8000562c:	03010113          	addi	sp,sp,48
    80005630:	00008067          	ret

0000000080005634 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80005634:	fd010113          	addi	sp,sp,-48
    80005638:	02113423          	sd	ra,40(sp)
    8000563c:	02813023          	sd	s0,32(sp)
    80005640:	00913c23          	sd	s1,24(sp)
    80005644:	01213823          	sd	s2,16(sp)
    80005648:	01313423          	sd	s3,8(sp)
    8000564c:	03010413          	addi	s0,sp,48
    80005650:	00050993          	mv	s3,a0
    80005654:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005658:	00000913          	li	s2,0
    8000565c:	00c0006f          	j	80005668 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005660:	ffffd097          	auipc	ra,0xffffd
    80005664:	34c080e7          	jalr	844(ra) # 800029ac <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005668:	ffffc097          	auipc	ra,0xffffc
    8000566c:	f00080e7          	jalr	-256(ra) # 80001568 <_Z4getcv>
    80005670:	0005059b          	sext.w	a1,a0
    80005674:	01b00793          	li	a5,27
    80005678:	02f58a63          	beq	a1,a5,800056ac <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    8000567c:	0084b503          	ld	a0,8(s1)
    80005680:	00001097          	auipc	ra,0x1
    80005684:	c64080e7          	jalr	-924(ra) # 800062e4 <_ZN9BufferCPP3putEi>
        i++;
    80005688:	0019071b          	addiw	a4,s2,1
    8000568c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005690:	0004a683          	lw	a3,0(s1)
    80005694:	0026979b          	slliw	a5,a3,0x2
    80005698:	00d787bb          	addw	a5,a5,a3
    8000569c:	0017979b          	slliw	a5,a5,0x1
    800056a0:	02f767bb          	remw	a5,a4,a5
    800056a4:	fc0792e3          	bnez	a5,80005668 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800056a8:	fb9ff06f          	j	80005660 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800056ac:	00100793          	li	a5,1
    800056b0:	00007717          	auipc	a4,0x7
    800056b4:	62f72c23          	sw	a5,1592(a4) # 8000cce8 <_ZL9threadEnd>
    td->buffer->put('!');
    800056b8:	0209b783          	ld	a5,32(s3)
    800056bc:	02100593          	li	a1,33
    800056c0:	0087b503          	ld	a0,8(a5)
    800056c4:	00001097          	auipc	ra,0x1
    800056c8:	c20080e7          	jalr	-992(ra) # 800062e4 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800056cc:	0104b503          	ld	a0,16(s1)
    800056d0:	ffffd097          	auipc	ra,0xffffd
    800056d4:	460080e7          	jalr	1120(ra) # 80002b30 <_ZN9Semaphore6signalEv>
}
    800056d8:	02813083          	ld	ra,40(sp)
    800056dc:	02013403          	ld	s0,32(sp)
    800056e0:	01813483          	ld	s1,24(sp)
    800056e4:	01013903          	ld	s2,16(sp)
    800056e8:	00813983          	ld	s3,8(sp)
    800056ec:	03010113          	addi	sp,sp,48
    800056f0:	00008067          	ret

00000000800056f4 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800056f4:	fe010113          	addi	sp,sp,-32
    800056f8:	00113c23          	sd	ra,24(sp)
    800056fc:	00813823          	sd	s0,16(sp)
    80005700:	00913423          	sd	s1,8(sp)
    80005704:	01213023          	sd	s2,0(sp)
    80005708:	02010413          	addi	s0,sp,32
    8000570c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005710:	00000913          	li	s2,0
    80005714:	00c0006f          	j	80005720 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005718:	ffffd097          	auipc	ra,0xffffd
    8000571c:	294080e7          	jalr	660(ra) # 800029ac <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005720:	00007797          	auipc	a5,0x7
    80005724:	5c87a783          	lw	a5,1480(a5) # 8000cce8 <_ZL9threadEnd>
    80005728:	02079e63          	bnez	a5,80005764 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    8000572c:	0004a583          	lw	a1,0(s1)
    80005730:	0305859b          	addiw	a1,a1,48
    80005734:	0084b503          	ld	a0,8(s1)
    80005738:	00001097          	auipc	ra,0x1
    8000573c:	bac080e7          	jalr	-1108(ra) # 800062e4 <_ZN9BufferCPP3putEi>
        i++;
    80005740:	0019071b          	addiw	a4,s2,1
    80005744:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005748:	0004a683          	lw	a3,0(s1)
    8000574c:	0026979b          	slliw	a5,a3,0x2
    80005750:	00d787bb          	addw	a5,a5,a3
    80005754:	0017979b          	slliw	a5,a5,0x1
    80005758:	02f767bb          	remw	a5,a4,a5
    8000575c:	fc0792e3          	bnez	a5,80005720 <_ZN12ProducerSync8producerEPv+0x2c>
    80005760:	fb9ff06f          	j	80005718 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005764:	0104b503          	ld	a0,16(s1)
    80005768:	ffffd097          	auipc	ra,0xffffd
    8000576c:	3c8080e7          	jalr	968(ra) # 80002b30 <_ZN9Semaphore6signalEv>
}
    80005770:	01813083          	ld	ra,24(sp)
    80005774:	01013403          	ld	s0,16(sp)
    80005778:	00813483          	ld	s1,8(sp)
    8000577c:	00013903          	ld	s2,0(sp)
    80005780:	02010113          	addi	sp,sp,32
    80005784:	00008067          	ret

0000000080005788 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005788:	fd010113          	addi	sp,sp,-48
    8000578c:	02113423          	sd	ra,40(sp)
    80005790:	02813023          	sd	s0,32(sp)
    80005794:	00913c23          	sd	s1,24(sp)
    80005798:	01213823          	sd	s2,16(sp)
    8000579c:	01313423          	sd	s3,8(sp)
    800057a0:	01413023          	sd	s4,0(sp)
    800057a4:	03010413          	addi	s0,sp,48
    800057a8:	00050993          	mv	s3,a0
    800057ac:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800057b0:	00000a13          	li	s4,0
    800057b4:	01c0006f          	j	800057d0 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800057b8:	ffffd097          	auipc	ra,0xffffd
    800057bc:	1f4080e7          	jalr	500(ra) # 800029ac <_ZN6Thread8dispatchEv>
    800057c0:	0500006f          	j	80005810 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800057c4:	00a00513          	li	a0,10
    800057c8:	ffffc097          	auipc	ra,0xffffc
    800057cc:	dc8080e7          	jalr	-568(ra) # 80001590 <_Z4putcc>
    while (!threadEnd) {
    800057d0:	00007797          	auipc	a5,0x7
    800057d4:	5187a783          	lw	a5,1304(a5) # 8000cce8 <_ZL9threadEnd>
    800057d8:	06079263          	bnez	a5,8000583c <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800057dc:	00893503          	ld	a0,8(s2)
    800057e0:	00001097          	auipc	ra,0x1
    800057e4:	b94080e7          	jalr	-1132(ra) # 80006374 <_ZN9BufferCPP3getEv>
        i++;
    800057e8:	001a049b          	addiw	s1,s4,1
    800057ec:	00048a1b          	sext.w	s4,s1
        putc(key);
    800057f0:	0ff57513          	andi	a0,a0,255
    800057f4:	ffffc097          	auipc	ra,0xffffc
    800057f8:	d9c080e7          	jalr	-612(ra) # 80001590 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800057fc:	00092703          	lw	a4,0(s2)
    80005800:	0027179b          	slliw	a5,a4,0x2
    80005804:	00e787bb          	addw	a5,a5,a4
    80005808:	02f4e7bb          	remw	a5,s1,a5
    8000580c:	fa0786e3          	beqz	a5,800057b8 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005810:	05000793          	li	a5,80
    80005814:	02f4e4bb          	remw	s1,s1,a5
    80005818:	fa049ce3          	bnez	s1,800057d0 <_ZN12ConsumerSync8consumerEPv+0x48>
    8000581c:	fa9ff06f          	j	800057c4 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005820:	0209b783          	ld	a5,32(s3)
    80005824:	0087b503          	ld	a0,8(a5)
    80005828:	00001097          	auipc	ra,0x1
    8000582c:	b4c080e7          	jalr	-1204(ra) # 80006374 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005830:	0ff57513          	andi	a0,a0,255
    80005834:	ffffd097          	auipc	ra,0xffffd
    80005838:	3c4080e7          	jalr	964(ra) # 80002bf8 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    8000583c:	0209b783          	ld	a5,32(s3)
    80005840:	0087b503          	ld	a0,8(a5)
    80005844:	00001097          	auipc	ra,0x1
    80005848:	bbc080e7          	jalr	-1092(ra) # 80006400 <_ZN9BufferCPP6getCntEv>
    8000584c:	fca04ae3          	bgtz	a0,80005820 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005850:	01093503          	ld	a0,16(s2)
    80005854:	ffffd097          	auipc	ra,0xffffd
    80005858:	2dc080e7          	jalr	732(ra) # 80002b30 <_ZN9Semaphore6signalEv>
}
    8000585c:	02813083          	ld	ra,40(sp)
    80005860:	02013403          	ld	s0,32(sp)
    80005864:	01813483          	ld	s1,24(sp)
    80005868:	01013903          	ld	s2,16(sp)
    8000586c:	00813983          	ld	s3,8(sp)
    80005870:	00013a03          	ld	s4,0(sp)
    80005874:	03010113          	addi	sp,sp,48
    80005878:	00008067          	ret

000000008000587c <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    8000587c:	f8010113          	addi	sp,sp,-128
    80005880:	06113c23          	sd	ra,120(sp)
    80005884:	06813823          	sd	s0,112(sp)
    80005888:	06913423          	sd	s1,104(sp)
    8000588c:	07213023          	sd	s2,96(sp)
    80005890:	05313c23          	sd	s3,88(sp)
    80005894:	05413823          	sd	s4,80(sp)
    80005898:	05513423          	sd	s5,72(sp)
    8000589c:	05613023          	sd	s6,64(sp)
    800058a0:	03713c23          	sd	s7,56(sp)
    800058a4:	03813823          	sd	s8,48(sp)
    800058a8:	03913423          	sd	s9,40(sp)
    800058ac:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800058b0:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800058b4:	00005517          	auipc	a0,0x5
    800058b8:	98450513          	addi	a0,a0,-1660 # 8000a238 <_ZZ9kPrintIntmE6digits+0x1c8>
    800058bc:	00000097          	auipc	ra,0x0
    800058c0:	604080e7          	jalr	1540(ra) # 80005ec0 <_Z11printStringPKc>
    getString(input, 30);
    800058c4:	01e00593          	li	a1,30
    800058c8:	f8040493          	addi	s1,s0,-128
    800058cc:	00048513          	mv	a0,s1
    800058d0:	00000097          	auipc	ra,0x0
    800058d4:	678080e7          	jalr	1656(ra) # 80005f48 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800058d8:	00048513          	mv	a0,s1
    800058dc:	00000097          	auipc	ra,0x0
    800058e0:	744080e7          	jalr	1860(ra) # 80006020 <_Z11stringToIntPKc>
    800058e4:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800058e8:	00005517          	auipc	a0,0x5
    800058ec:	97050513          	addi	a0,a0,-1680 # 8000a258 <_ZZ9kPrintIntmE6digits+0x1e8>
    800058f0:	00000097          	auipc	ra,0x0
    800058f4:	5d0080e7          	jalr	1488(ra) # 80005ec0 <_Z11printStringPKc>
    getString(input, 30);
    800058f8:	01e00593          	li	a1,30
    800058fc:	00048513          	mv	a0,s1
    80005900:	00000097          	auipc	ra,0x0
    80005904:	648080e7          	jalr	1608(ra) # 80005f48 <_Z9getStringPci>
    n = stringToInt(input);
    80005908:	00048513          	mv	a0,s1
    8000590c:	00000097          	auipc	ra,0x0
    80005910:	714080e7          	jalr	1812(ra) # 80006020 <_Z11stringToIntPKc>
    80005914:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005918:	00005517          	auipc	a0,0x5
    8000591c:	96050513          	addi	a0,a0,-1696 # 8000a278 <_ZZ9kPrintIntmE6digits+0x208>
    80005920:	00000097          	auipc	ra,0x0
    80005924:	5a0080e7          	jalr	1440(ra) # 80005ec0 <_Z11printStringPKc>
    80005928:	00000613          	li	a2,0
    8000592c:	00a00593          	li	a1,10
    80005930:	00090513          	mv	a0,s2
    80005934:	00000097          	auipc	ra,0x0
    80005938:	73c080e7          	jalr	1852(ra) # 80006070 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    8000593c:	00005517          	auipc	a0,0x5
    80005940:	95450513          	addi	a0,a0,-1708 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    80005944:	00000097          	auipc	ra,0x0
    80005948:	57c080e7          	jalr	1404(ra) # 80005ec0 <_Z11printStringPKc>
    8000594c:	00000613          	li	a2,0
    80005950:	00a00593          	li	a1,10
    80005954:	00048513          	mv	a0,s1
    80005958:	00000097          	auipc	ra,0x0
    8000595c:	718080e7          	jalr	1816(ra) # 80006070 <_Z8printIntiii>
    printString(".\n");
    80005960:	00005517          	auipc	a0,0x5
    80005964:	94850513          	addi	a0,a0,-1720 # 8000a2a8 <_ZZ9kPrintIntmE6digits+0x238>
    80005968:	00000097          	auipc	ra,0x0
    8000596c:	558080e7          	jalr	1368(ra) # 80005ec0 <_Z11printStringPKc>
    if(threadNum > n) {
    80005970:	0324c463          	blt	s1,s2,80005998 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005974:	03205c63          	blez	s2,800059ac <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005978:	03800513          	li	a0,56
    8000597c:	ffffd097          	auipc	ra,0xffffd
    80005980:	e1c080e7          	jalr	-484(ra) # 80002798 <_Znwm>
    80005984:	00050a93          	mv	s5,a0
    80005988:	00048593          	mv	a1,s1
    8000598c:	00001097          	auipc	ra,0x1
    80005990:	804080e7          	jalr	-2044(ra) # 80006190 <_ZN9BufferCPPC1Ei>
    80005994:	0300006f          	j	800059c4 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005998:	00005517          	auipc	a0,0x5
    8000599c:	91850513          	addi	a0,a0,-1768 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    800059a0:	00000097          	auipc	ra,0x0
    800059a4:	520080e7          	jalr	1312(ra) # 80005ec0 <_Z11printStringPKc>
        return;
    800059a8:	0140006f          	j	800059bc <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800059ac:	00005517          	auipc	a0,0x5
    800059b0:	94450513          	addi	a0,a0,-1724 # 8000a2f0 <_ZZ9kPrintIntmE6digits+0x280>
    800059b4:	00000097          	auipc	ra,0x0
    800059b8:	50c080e7          	jalr	1292(ra) # 80005ec0 <_Z11printStringPKc>
        return;
    800059bc:	000b8113          	mv	sp,s7
    800059c0:	2380006f          	j	80005bf8 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800059c4:	01000513          	li	a0,16
    800059c8:	ffffd097          	auipc	ra,0xffffd
    800059cc:	dd0080e7          	jalr	-560(ra) # 80002798 <_Znwm>
    800059d0:	00050493          	mv	s1,a0
    800059d4:	00000593          	li	a1,0
    800059d8:	ffffd097          	auipc	ra,0xffffd
    800059dc:	0f4080e7          	jalr	244(ra) # 80002acc <_ZN9SemaphoreC1Ej>
    800059e0:	00007797          	auipc	a5,0x7
    800059e4:	3097b823          	sd	s1,784(a5) # 8000ccf0 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800059e8:	00391793          	slli	a5,s2,0x3
    800059ec:	00f78793          	addi	a5,a5,15
    800059f0:	ff07f793          	andi	a5,a5,-16
    800059f4:	40f10133          	sub	sp,sp,a5
    800059f8:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800059fc:	0019071b          	addiw	a4,s2,1
    80005a00:	00171793          	slli	a5,a4,0x1
    80005a04:	00e787b3          	add	a5,a5,a4
    80005a08:	00379793          	slli	a5,a5,0x3
    80005a0c:	00f78793          	addi	a5,a5,15
    80005a10:	ff07f793          	andi	a5,a5,-16
    80005a14:	40f10133          	sub	sp,sp,a5
    80005a18:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005a1c:	00191c13          	slli	s8,s2,0x1
    80005a20:	012c07b3          	add	a5,s8,s2
    80005a24:	00379793          	slli	a5,a5,0x3
    80005a28:	00fa07b3          	add	a5,s4,a5
    80005a2c:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005a30:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005a34:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005a38:	02800513          	li	a0,40
    80005a3c:	ffffd097          	auipc	ra,0xffffd
    80005a40:	d5c080e7          	jalr	-676(ra) # 80002798 <_Znwm>
    80005a44:	00050b13          	mv	s6,a0
    80005a48:	012c0c33          	add	s8,s8,s2
    80005a4c:	003c1c13          	slli	s8,s8,0x3
    80005a50:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005a54:	ffffd097          	auipc	ra,0xffffd
    80005a58:	ffc080e7          	jalr	-4(ra) # 80002a50 <_ZN6ThreadC1Ev>
    80005a5c:	00007797          	auipc	a5,0x7
    80005a60:	02c78793          	addi	a5,a5,44 # 8000ca88 <_ZTV12ConsumerSync+0x10>
    80005a64:	00fb3023          	sd	a5,0(s6)
    80005a68:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005a6c:	000b0513          	mv	a0,s6
    80005a70:	ffffd097          	auipc	ra,0xffffd
    80005a74:	ed8080e7          	jalr	-296(ra) # 80002948 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005a78:	00000493          	li	s1,0
    80005a7c:	0380006f          	j	80005ab4 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005a80:	00007797          	auipc	a5,0x7
    80005a84:	fe078793          	addi	a5,a5,-32 # 8000ca60 <_ZTV12ProducerSync+0x10>
    80005a88:	00fcb023          	sd	a5,0(s9)
    80005a8c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005a90:	00349793          	slli	a5,s1,0x3
    80005a94:	00f987b3          	add	a5,s3,a5
    80005a98:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005a9c:	00349793          	slli	a5,s1,0x3
    80005aa0:	00f987b3          	add	a5,s3,a5
    80005aa4:	0007b503          	ld	a0,0(a5)
    80005aa8:	ffffd097          	auipc	ra,0xffffd
    80005aac:	ea0080e7          	jalr	-352(ra) # 80002948 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005ab0:	0014849b          	addiw	s1,s1,1
    80005ab4:	0b24d063          	bge	s1,s2,80005b54 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005ab8:	00149793          	slli	a5,s1,0x1
    80005abc:	009787b3          	add	a5,a5,s1
    80005ac0:	00379793          	slli	a5,a5,0x3
    80005ac4:	00fa07b3          	add	a5,s4,a5
    80005ac8:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005acc:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005ad0:	00007717          	auipc	a4,0x7
    80005ad4:	22073703          	ld	a4,544(a4) # 8000ccf0 <_ZL10waitForAll>
    80005ad8:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005adc:	02905863          	blez	s1,80005b0c <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005ae0:	02800513          	li	a0,40
    80005ae4:	ffffd097          	auipc	ra,0xffffd
    80005ae8:	cb4080e7          	jalr	-844(ra) # 80002798 <_Znwm>
    80005aec:	00050c93          	mv	s9,a0
    80005af0:	00149c13          	slli	s8,s1,0x1
    80005af4:	009c0c33          	add	s8,s8,s1
    80005af8:	003c1c13          	slli	s8,s8,0x3
    80005afc:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005b00:	ffffd097          	auipc	ra,0xffffd
    80005b04:	f50080e7          	jalr	-176(ra) # 80002a50 <_ZN6ThreadC1Ev>
    80005b08:	f79ff06f          	j	80005a80 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005b0c:	02800513          	li	a0,40
    80005b10:	ffffd097          	auipc	ra,0xffffd
    80005b14:	c88080e7          	jalr	-888(ra) # 80002798 <_Znwm>
    80005b18:	00050c93          	mv	s9,a0
    80005b1c:	00149c13          	slli	s8,s1,0x1
    80005b20:	009c0c33          	add	s8,s8,s1
    80005b24:	003c1c13          	slli	s8,s8,0x3
    80005b28:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005b2c:	ffffd097          	auipc	ra,0xffffd
    80005b30:	f24080e7          	jalr	-220(ra) # 80002a50 <_ZN6ThreadC1Ev>
    80005b34:	00007797          	auipc	a5,0x7
    80005b38:	f0478793          	addi	a5,a5,-252 # 8000ca38 <_ZTV16ProducerKeyboard+0x10>
    80005b3c:	00fcb023          	sd	a5,0(s9)
    80005b40:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005b44:	00349793          	slli	a5,s1,0x3
    80005b48:	00f987b3          	add	a5,s3,a5
    80005b4c:	0197b023          	sd	s9,0(a5)
    80005b50:	f4dff06f          	j	80005a9c <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005b54:	ffffd097          	auipc	ra,0xffffd
    80005b58:	e58080e7          	jalr	-424(ra) # 800029ac <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005b5c:	00000493          	li	s1,0
    80005b60:	00994e63          	blt	s2,s1,80005b7c <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005b64:	00007517          	auipc	a0,0x7
    80005b68:	18c53503          	ld	a0,396(a0) # 8000ccf0 <_ZL10waitForAll>
    80005b6c:	ffffd097          	auipc	ra,0xffffd
    80005b70:	f98080e7          	jalr	-104(ra) # 80002b04 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005b74:	0014849b          	addiw	s1,s1,1
    80005b78:	fe9ff06f          	j	80005b60 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005b7c:	00000493          	li	s1,0
    80005b80:	0080006f          	j	80005b88 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005b84:	0014849b          	addiw	s1,s1,1
    80005b88:	0324d263          	bge	s1,s2,80005bac <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005b8c:	00349793          	slli	a5,s1,0x3
    80005b90:	00f987b3          	add	a5,s3,a5
    80005b94:	0007b503          	ld	a0,0(a5)
    80005b98:	fe0506e3          	beqz	a0,80005b84 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005b9c:	00053783          	ld	a5,0(a0)
    80005ba0:	0087b783          	ld	a5,8(a5)
    80005ba4:	000780e7          	jalr	a5
    80005ba8:	fddff06f          	j	80005b84 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005bac:	000b0a63          	beqz	s6,80005bc0 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005bb0:	000b3783          	ld	a5,0(s6)
    80005bb4:	0087b783          	ld	a5,8(a5)
    80005bb8:	000b0513          	mv	a0,s6
    80005bbc:	000780e7          	jalr	a5
    delete waitForAll;
    80005bc0:	00007517          	auipc	a0,0x7
    80005bc4:	13053503          	ld	a0,304(a0) # 8000ccf0 <_ZL10waitForAll>
    80005bc8:	00050863          	beqz	a0,80005bd8 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005bcc:	00053783          	ld	a5,0(a0)
    80005bd0:	0087b783          	ld	a5,8(a5)
    80005bd4:	000780e7          	jalr	a5
    delete buffer;
    80005bd8:	000a8e63          	beqz	s5,80005bf4 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005bdc:	000a8513          	mv	a0,s5
    80005be0:	00001097          	auipc	ra,0x1
    80005be4:	8a8080e7          	jalr	-1880(ra) # 80006488 <_ZN9BufferCPPD1Ev>
    80005be8:	000a8513          	mv	a0,s5
    80005bec:	ffffd097          	auipc	ra,0xffffd
    80005bf0:	bfc080e7          	jalr	-1028(ra) # 800027e8 <_ZdlPv>
    80005bf4:	000b8113          	mv	sp,s7

}
    80005bf8:	f8040113          	addi	sp,s0,-128
    80005bfc:	07813083          	ld	ra,120(sp)
    80005c00:	07013403          	ld	s0,112(sp)
    80005c04:	06813483          	ld	s1,104(sp)
    80005c08:	06013903          	ld	s2,96(sp)
    80005c0c:	05813983          	ld	s3,88(sp)
    80005c10:	05013a03          	ld	s4,80(sp)
    80005c14:	04813a83          	ld	s5,72(sp)
    80005c18:	04013b03          	ld	s6,64(sp)
    80005c1c:	03813b83          	ld	s7,56(sp)
    80005c20:	03013c03          	ld	s8,48(sp)
    80005c24:	02813c83          	ld	s9,40(sp)
    80005c28:	08010113          	addi	sp,sp,128
    80005c2c:	00008067          	ret
    80005c30:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005c34:	000a8513          	mv	a0,s5
    80005c38:	ffffd097          	auipc	ra,0xffffd
    80005c3c:	bb0080e7          	jalr	-1104(ra) # 800027e8 <_ZdlPv>
    80005c40:	00048513          	mv	a0,s1
    80005c44:	00008097          	auipc	ra,0x8
    80005c48:	194080e7          	jalr	404(ra) # 8000ddd8 <_Unwind_Resume>
    80005c4c:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005c50:	00048513          	mv	a0,s1
    80005c54:	ffffd097          	auipc	ra,0xffffd
    80005c58:	b94080e7          	jalr	-1132(ra) # 800027e8 <_ZdlPv>
    80005c5c:	00090513          	mv	a0,s2
    80005c60:	00008097          	auipc	ra,0x8
    80005c64:	178080e7          	jalr	376(ra) # 8000ddd8 <_Unwind_Resume>
    80005c68:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005c6c:	000b0513          	mv	a0,s6
    80005c70:	ffffd097          	auipc	ra,0xffffd
    80005c74:	b78080e7          	jalr	-1160(ra) # 800027e8 <_ZdlPv>
    80005c78:	00048513          	mv	a0,s1
    80005c7c:	00008097          	auipc	ra,0x8
    80005c80:	15c080e7          	jalr	348(ra) # 8000ddd8 <_Unwind_Resume>
    80005c84:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005c88:	000c8513          	mv	a0,s9
    80005c8c:	ffffd097          	auipc	ra,0xffffd
    80005c90:	b5c080e7          	jalr	-1188(ra) # 800027e8 <_ZdlPv>
    80005c94:	00048513          	mv	a0,s1
    80005c98:	00008097          	auipc	ra,0x8
    80005c9c:	140080e7          	jalr	320(ra) # 8000ddd8 <_Unwind_Resume>
    80005ca0:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005ca4:	000c8513          	mv	a0,s9
    80005ca8:	ffffd097          	auipc	ra,0xffffd
    80005cac:	b40080e7          	jalr	-1216(ra) # 800027e8 <_ZdlPv>
    80005cb0:	00048513          	mv	a0,s1
    80005cb4:	00008097          	auipc	ra,0x8
    80005cb8:	124080e7          	jalr	292(ra) # 8000ddd8 <_Unwind_Resume>

0000000080005cbc <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005cbc:	ff010113          	addi	sp,sp,-16
    80005cc0:	00113423          	sd	ra,8(sp)
    80005cc4:	00813023          	sd	s0,0(sp)
    80005cc8:	01010413          	addi	s0,sp,16
    80005ccc:	00007797          	auipc	a5,0x7
    80005cd0:	dbc78793          	addi	a5,a5,-580 # 8000ca88 <_ZTV12ConsumerSync+0x10>
    80005cd4:	00f53023          	sd	a5,0(a0)
    80005cd8:	ffffd097          	auipc	ra,0xffffd
    80005cdc:	9d0080e7          	jalr	-1584(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80005ce0:	00813083          	ld	ra,8(sp)
    80005ce4:	00013403          	ld	s0,0(sp)
    80005ce8:	01010113          	addi	sp,sp,16
    80005cec:	00008067          	ret

0000000080005cf0 <_ZN12ConsumerSyncD0Ev>:
    80005cf0:	fe010113          	addi	sp,sp,-32
    80005cf4:	00113c23          	sd	ra,24(sp)
    80005cf8:	00813823          	sd	s0,16(sp)
    80005cfc:	00913423          	sd	s1,8(sp)
    80005d00:	02010413          	addi	s0,sp,32
    80005d04:	00050493          	mv	s1,a0
    80005d08:	00007797          	auipc	a5,0x7
    80005d0c:	d8078793          	addi	a5,a5,-640 # 8000ca88 <_ZTV12ConsumerSync+0x10>
    80005d10:	00f53023          	sd	a5,0(a0)
    80005d14:	ffffd097          	auipc	ra,0xffffd
    80005d18:	994080e7          	jalr	-1644(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80005d1c:	00048513          	mv	a0,s1
    80005d20:	ffffd097          	auipc	ra,0xffffd
    80005d24:	ac8080e7          	jalr	-1336(ra) # 800027e8 <_ZdlPv>
    80005d28:	01813083          	ld	ra,24(sp)
    80005d2c:	01013403          	ld	s0,16(sp)
    80005d30:	00813483          	ld	s1,8(sp)
    80005d34:	02010113          	addi	sp,sp,32
    80005d38:	00008067          	ret

0000000080005d3c <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005d3c:	ff010113          	addi	sp,sp,-16
    80005d40:	00113423          	sd	ra,8(sp)
    80005d44:	00813023          	sd	s0,0(sp)
    80005d48:	01010413          	addi	s0,sp,16
    80005d4c:	00007797          	auipc	a5,0x7
    80005d50:	d1478793          	addi	a5,a5,-748 # 8000ca60 <_ZTV12ProducerSync+0x10>
    80005d54:	00f53023          	sd	a5,0(a0)
    80005d58:	ffffd097          	auipc	ra,0xffffd
    80005d5c:	950080e7          	jalr	-1712(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80005d60:	00813083          	ld	ra,8(sp)
    80005d64:	00013403          	ld	s0,0(sp)
    80005d68:	01010113          	addi	sp,sp,16
    80005d6c:	00008067          	ret

0000000080005d70 <_ZN12ProducerSyncD0Ev>:
    80005d70:	fe010113          	addi	sp,sp,-32
    80005d74:	00113c23          	sd	ra,24(sp)
    80005d78:	00813823          	sd	s0,16(sp)
    80005d7c:	00913423          	sd	s1,8(sp)
    80005d80:	02010413          	addi	s0,sp,32
    80005d84:	00050493          	mv	s1,a0
    80005d88:	00007797          	auipc	a5,0x7
    80005d8c:	cd878793          	addi	a5,a5,-808 # 8000ca60 <_ZTV12ProducerSync+0x10>
    80005d90:	00f53023          	sd	a5,0(a0)
    80005d94:	ffffd097          	auipc	ra,0xffffd
    80005d98:	914080e7          	jalr	-1772(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80005d9c:	00048513          	mv	a0,s1
    80005da0:	ffffd097          	auipc	ra,0xffffd
    80005da4:	a48080e7          	jalr	-1464(ra) # 800027e8 <_ZdlPv>
    80005da8:	01813083          	ld	ra,24(sp)
    80005dac:	01013403          	ld	s0,16(sp)
    80005db0:	00813483          	ld	s1,8(sp)
    80005db4:	02010113          	addi	sp,sp,32
    80005db8:	00008067          	ret

0000000080005dbc <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005dbc:	ff010113          	addi	sp,sp,-16
    80005dc0:	00113423          	sd	ra,8(sp)
    80005dc4:	00813023          	sd	s0,0(sp)
    80005dc8:	01010413          	addi	s0,sp,16
    80005dcc:	00007797          	auipc	a5,0x7
    80005dd0:	c6c78793          	addi	a5,a5,-916 # 8000ca38 <_ZTV16ProducerKeyboard+0x10>
    80005dd4:	00f53023          	sd	a5,0(a0)
    80005dd8:	ffffd097          	auipc	ra,0xffffd
    80005ddc:	8d0080e7          	jalr	-1840(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80005de0:	00813083          	ld	ra,8(sp)
    80005de4:	00013403          	ld	s0,0(sp)
    80005de8:	01010113          	addi	sp,sp,16
    80005dec:	00008067          	ret

0000000080005df0 <_ZN16ProducerKeyboardD0Ev>:
    80005df0:	fe010113          	addi	sp,sp,-32
    80005df4:	00113c23          	sd	ra,24(sp)
    80005df8:	00813823          	sd	s0,16(sp)
    80005dfc:	00913423          	sd	s1,8(sp)
    80005e00:	02010413          	addi	s0,sp,32
    80005e04:	00050493          	mv	s1,a0
    80005e08:	00007797          	auipc	a5,0x7
    80005e0c:	c3078793          	addi	a5,a5,-976 # 8000ca38 <_ZTV16ProducerKeyboard+0x10>
    80005e10:	00f53023          	sd	a5,0(a0)
    80005e14:	ffffd097          	auipc	ra,0xffffd
    80005e18:	894080e7          	jalr	-1900(ra) # 800026a8 <_ZN6ThreadD1Ev>
    80005e1c:	00048513          	mv	a0,s1
    80005e20:	ffffd097          	auipc	ra,0xffffd
    80005e24:	9c8080e7          	jalr	-1592(ra) # 800027e8 <_ZdlPv>
    80005e28:	01813083          	ld	ra,24(sp)
    80005e2c:	01013403          	ld	s0,16(sp)
    80005e30:	00813483          	ld	s1,8(sp)
    80005e34:	02010113          	addi	sp,sp,32
    80005e38:	00008067          	ret

0000000080005e3c <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005e3c:	ff010113          	addi	sp,sp,-16
    80005e40:	00113423          	sd	ra,8(sp)
    80005e44:	00813023          	sd	s0,0(sp)
    80005e48:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005e4c:	02053583          	ld	a1,32(a0)
    80005e50:	fffff097          	auipc	ra,0xfffff
    80005e54:	7e4080e7          	jalr	2020(ra) # 80005634 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005e58:	00813083          	ld	ra,8(sp)
    80005e5c:	00013403          	ld	s0,0(sp)
    80005e60:	01010113          	addi	sp,sp,16
    80005e64:	00008067          	ret

0000000080005e68 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005e68:	ff010113          	addi	sp,sp,-16
    80005e6c:	00113423          	sd	ra,8(sp)
    80005e70:	00813023          	sd	s0,0(sp)
    80005e74:	01010413          	addi	s0,sp,16
        producer(td);
    80005e78:	02053583          	ld	a1,32(a0)
    80005e7c:	00000097          	auipc	ra,0x0
    80005e80:	878080e7          	jalr	-1928(ra) # 800056f4 <_ZN12ProducerSync8producerEPv>
    }
    80005e84:	00813083          	ld	ra,8(sp)
    80005e88:	00013403          	ld	s0,0(sp)
    80005e8c:	01010113          	addi	sp,sp,16
    80005e90:	00008067          	ret

0000000080005e94 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005e94:	ff010113          	addi	sp,sp,-16
    80005e98:	00113423          	sd	ra,8(sp)
    80005e9c:	00813023          	sd	s0,0(sp)
    80005ea0:	01010413          	addi	s0,sp,16
        consumer(td);
    80005ea4:	02053583          	ld	a1,32(a0)
    80005ea8:	00000097          	auipc	ra,0x0
    80005eac:	8e0080e7          	jalr	-1824(ra) # 80005788 <_ZN12ConsumerSync8consumerEPv>
    }
    80005eb0:	00813083          	ld	ra,8(sp)
    80005eb4:	00013403          	ld	s0,0(sp)
    80005eb8:	01010113          	addi	sp,sp,16
    80005ebc:	00008067          	ret

0000000080005ec0 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005ec0:	fe010113          	addi	sp,sp,-32
    80005ec4:	00113c23          	sd	ra,24(sp)
    80005ec8:	00813823          	sd	s0,16(sp)
    80005ecc:	00913423          	sd	s1,8(sp)
    80005ed0:	02010413          	addi	s0,sp,32
    80005ed4:	00050493          	mv	s1,a0
    LOCK();
    80005ed8:	00100613          	li	a2,1
    80005edc:	00000593          	li	a1,0
    80005ee0:	00007517          	auipc	a0,0x7
    80005ee4:	e1850513          	addi	a0,a0,-488 # 8000ccf8 <lockPrint>
    80005ee8:	ffffb097          	auipc	ra,0xffffb
    80005eec:	33c080e7          	jalr	828(ra) # 80001224 <copy_and_swap>
    80005ef0:	00050863          	beqz	a0,80005f00 <_Z11printStringPKc+0x40>
    80005ef4:	ffffb097          	auipc	ra,0xffffb
    80005ef8:	534080e7          	jalr	1332(ra) # 80001428 <_Z15thread_dispatchv>
    80005efc:	fddff06f          	j	80005ed8 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005f00:	0004c503          	lbu	a0,0(s1)
    80005f04:	00050a63          	beqz	a0,80005f18 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005f08:	ffffb097          	auipc	ra,0xffffb
    80005f0c:	688080e7          	jalr	1672(ra) # 80001590 <_Z4putcc>
        string++;
    80005f10:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005f14:	fedff06f          	j	80005f00 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005f18:	00000613          	li	a2,0
    80005f1c:	00100593          	li	a1,1
    80005f20:	00007517          	auipc	a0,0x7
    80005f24:	dd850513          	addi	a0,a0,-552 # 8000ccf8 <lockPrint>
    80005f28:	ffffb097          	auipc	ra,0xffffb
    80005f2c:	2fc080e7          	jalr	764(ra) # 80001224 <copy_and_swap>
    80005f30:	fe0514e3          	bnez	a0,80005f18 <_Z11printStringPKc+0x58>
}
    80005f34:	01813083          	ld	ra,24(sp)
    80005f38:	01013403          	ld	s0,16(sp)
    80005f3c:	00813483          	ld	s1,8(sp)
    80005f40:	02010113          	addi	sp,sp,32
    80005f44:	00008067          	ret

0000000080005f48 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005f48:	fd010113          	addi	sp,sp,-48
    80005f4c:	02113423          	sd	ra,40(sp)
    80005f50:	02813023          	sd	s0,32(sp)
    80005f54:	00913c23          	sd	s1,24(sp)
    80005f58:	01213823          	sd	s2,16(sp)
    80005f5c:	01313423          	sd	s3,8(sp)
    80005f60:	01413023          	sd	s4,0(sp)
    80005f64:	03010413          	addi	s0,sp,48
    80005f68:	00050993          	mv	s3,a0
    80005f6c:	00058a13          	mv	s4,a1
    LOCK();
    80005f70:	00100613          	li	a2,1
    80005f74:	00000593          	li	a1,0
    80005f78:	00007517          	auipc	a0,0x7
    80005f7c:	d8050513          	addi	a0,a0,-640 # 8000ccf8 <lockPrint>
    80005f80:	ffffb097          	auipc	ra,0xffffb
    80005f84:	2a4080e7          	jalr	676(ra) # 80001224 <copy_and_swap>
    80005f88:	00050863          	beqz	a0,80005f98 <_Z9getStringPci+0x50>
    80005f8c:	ffffb097          	auipc	ra,0xffffb
    80005f90:	49c080e7          	jalr	1180(ra) # 80001428 <_Z15thread_dispatchv>
    80005f94:	fddff06f          	j	80005f70 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005f98:	00000913          	li	s2,0
    80005f9c:	00090493          	mv	s1,s2
    80005fa0:	0019091b          	addiw	s2,s2,1
    80005fa4:	03495a63          	bge	s2,s4,80005fd8 <_Z9getStringPci+0x90>
        cc = getc();
    80005fa8:	ffffb097          	auipc	ra,0xffffb
    80005fac:	5c0080e7          	jalr	1472(ra) # 80001568 <_Z4getcv>
        if(cc < 1)
    80005fb0:	02050463          	beqz	a0,80005fd8 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005fb4:	009984b3          	add	s1,s3,s1
    80005fb8:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005fbc:	00a00793          	li	a5,10
    80005fc0:	00f50a63          	beq	a0,a5,80005fd4 <_Z9getStringPci+0x8c>
    80005fc4:	00d00793          	li	a5,13
    80005fc8:	fcf51ae3          	bne	a0,a5,80005f9c <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005fcc:	00090493          	mv	s1,s2
    80005fd0:	0080006f          	j	80005fd8 <_Z9getStringPci+0x90>
    80005fd4:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005fd8:	009984b3          	add	s1,s3,s1
    80005fdc:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005fe0:	00000613          	li	a2,0
    80005fe4:	00100593          	li	a1,1
    80005fe8:	00007517          	auipc	a0,0x7
    80005fec:	d1050513          	addi	a0,a0,-752 # 8000ccf8 <lockPrint>
    80005ff0:	ffffb097          	auipc	ra,0xffffb
    80005ff4:	234080e7          	jalr	564(ra) # 80001224 <copy_and_swap>
    80005ff8:	fe0514e3          	bnez	a0,80005fe0 <_Z9getStringPci+0x98>
    return buf;
}
    80005ffc:	00098513          	mv	a0,s3
    80006000:	02813083          	ld	ra,40(sp)
    80006004:	02013403          	ld	s0,32(sp)
    80006008:	01813483          	ld	s1,24(sp)
    8000600c:	01013903          	ld	s2,16(sp)
    80006010:	00813983          	ld	s3,8(sp)
    80006014:	00013a03          	ld	s4,0(sp)
    80006018:	03010113          	addi	sp,sp,48
    8000601c:	00008067          	ret

0000000080006020 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80006020:	ff010113          	addi	sp,sp,-16
    80006024:	00813423          	sd	s0,8(sp)
    80006028:	01010413          	addi	s0,sp,16
    8000602c:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80006030:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80006034:	0006c603          	lbu	a2,0(a3)
    80006038:	fd06071b          	addiw	a4,a2,-48
    8000603c:	0ff77713          	andi	a4,a4,255
    80006040:	00900793          	li	a5,9
    80006044:	02e7e063          	bltu	a5,a4,80006064 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80006048:	0025179b          	slliw	a5,a0,0x2
    8000604c:	00a787bb          	addw	a5,a5,a0
    80006050:	0017979b          	slliw	a5,a5,0x1
    80006054:	00168693          	addi	a3,a3,1
    80006058:	00c787bb          	addw	a5,a5,a2
    8000605c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80006060:	fd5ff06f          	j	80006034 <_Z11stringToIntPKc+0x14>
    return n;
}
    80006064:	00813403          	ld	s0,8(sp)
    80006068:	01010113          	addi	sp,sp,16
    8000606c:	00008067          	ret

0000000080006070 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80006070:	fc010113          	addi	sp,sp,-64
    80006074:	02113c23          	sd	ra,56(sp)
    80006078:	02813823          	sd	s0,48(sp)
    8000607c:	02913423          	sd	s1,40(sp)
    80006080:	03213023          	sd	s2,32(sp)
    80006084:	01313c23          	sd	s3,24(sp)
    80006088:	04010413          	addi	s0,sp,64
    8000608c:	00050493          	mv	s1,a0
    80006090:	00058913          	mv	s2,a1
    80006094:	00060993          	mv	s3,a2
    LOCK();
    80006098:	00100613          	li	a2,1
    8000609c:	00000593          	li	a1,0
    800060a0:	00007517          	auipc	a0,0x7
    800060a4:	c5850513          	addi	a0,a0,-936 # 8000ccf8 <lockPrint>
    800060a8:	ffffb097          	auipc	ra,0xffffb
    800060ac:	17c080e7          	jalr	380(ra) # 80001224 <copy_and_swap>
    800060b0:	00050863          	beqz	a0,800060c0 <_Z8printIntiii+0x50>
    800060b4:	ffffb097          	auipc	ra,0xffffb
    800060b8:	374080e7          	jalr	884(ra) # 80001428 <_Z15thread_dispatchv>
    800060bc:	fddff06f          	j	80006098 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800060c0:	00098463          	beqz	s3,800060c8 <_Z8printIntiii+0x58>
    800060c4:	0804c463          	bltz	s1,8000614c <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800060c8:	0004851b          	sext.w	a0,s1
    neg = 0;
    800060cc:	00000593          	li	a1,0
    }

    i = 0;
    800060d0:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800060d4:	0009079b          	sext.w	a5,s2
    800060d8:	0325773b          	remuw	a4,a0,s2
    800060dc:	00048613          	mv	a2,s1
    800060e0:	0014849b          	addiw	s1,s1,1
    800060e4:	02071693          	slli	a3,a4,0x20
    800060e8:	0206d693          	srli	a3,a3,0x20
    800060ec:	00007717          	auipc	a4,0x7
    800060f0:	9b470713          	addi	a4,a4,-1612 # 8000caa0 <digits>
    800060f4:	00d70733          	add	a4,a4,a3
    800060f8:	00074683          	lbu	a3,0(a4)
    800060fc:	fd040713          	addi	a4,s0,-48
    80006100:	00c70733          	add	a4,a4,a2
    80006104:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80006108:	0005071b          	sext.w	a4,a0
    8000610c:	0325553b          	divuw	a0,a0,s2
    80006110:	fcf772e3          	bgeu	a4,a5,800060d4 <_Z8printIntiii+0x64>
    if(neg)
    80006114:	00058c63          	beqz	a1,8000612c <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80006118:	fd040793          	addi	a5,s0,-48
    8000611c:	009784b3          	add	s1,a5,s1
    80006120:	02d00793          	li	a5,45
    80006124:	fef48823          	sb	a5,-16(s1)
    80006128:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    8000612c:	fff4849b          	addiw	s1,s1,-1
    80006130:	0204c463          	bltz	s1,80006158 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80006134:	fd040793          	addi	a5,s0,-48
    80006138:	009787b3          	add	a5,a5,s1
    8000613c:	ff07c503          	lbu	a0,-16(a5)
    80006140:	ffffb097          	auipc	ra,0xffffb
    80006144:	450080e7          	jalr	1104(ra) # 80001590 <_Z4putcc>
    80006148:	fe5ff06f          	j	8000612c <_Z8printIntiii+0xbc>
        x = -xx;
    8000614c:	4090053b          	negw	a0,s1
        neg = 1;
    80006150:	00100593          	li	a1,1
        x = -xx;
    80006154:	f7dff06f          	j	800060d0 <_Z8printIntiii+0x60>

    UNLOCK();
    80006158:	00000613          	li	a2,0
    8000615c:	00100593          	li	a1,1
    80006160:	00007517          	auipc	a0,0x7
    80006164:	b9850513          	addi	a0,a0,-1128 # 8000ccf8 <lockPrint>
    80006168:	ffffb097          	auipc	ra,0xffffb
    8000616c:	0bc080e7          	jalr	188(ra) # 80001224 <copy_and_swap>
    80006170:	fe0514e3          	bnez	a0,80006158 <_Z8printIntiii+0xe8>
    80006174:	03813083          	ld	ra,56(sp)
    80006178:	03013403          	ld	s0,48(sp)
    8000617c:	02813483          	ld	s1,40(sp)
    80006180:	02013903          	ld	s2,32(sp)
    80006184:	01813983          	ld	s3,24(sp)
    80006188:	04010113          	addi	sp,sp,64
    8000618c:	00008067          	ret

0000000080006190 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006190:	fd010113          	addi	sp,sp,-48
    80006194:	02113423          	sd	ra,40(sp)
    80006198:	02813023          	sd	s0,32(sp)
    8000619c:	00913c23          	sd	s1,24(sp)
    800061a0:	01213823          	sd	s2,16(sp)
    800061a4:	01313423          	sd	s3,8(sp)
    800061a8:	03010413          	addi	s0,sp,48
    800061ac:	00050493          	mv	s1,a0
    800061b0:	00058913          	mv	s2,a1
    800061b4:	0015879b          	addiw	a5,a1,1
    800061b8:	0007851b          	sext.w	a0,a5
    800061bc:	00f4a023          	sw	a5,0(s1)
    800061c0:	0004a823          	sw	zero,16(s1)
    800061c4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800061c8:	00251513          	slli	a0,a0,0x2
    800061cc:	ffffb097          	auipc	ra,0xffffb
    800061d0:	144080e7          	jalr	324(ra) # 80001310 <_Z9mem_allocm>
    800061d4:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800061d8:	01000513          	li	a0,16
    800061dc:	ffffc097          	auipc	ra,0xffffc
    800061e0:	5bc080e7          	jalr	1468(ra) # 80002798 <_Znwm>
    800061e4:	00050993          	mv	s3,a0
    800061e8:	00000593          	li	a1,0
    800061ec:	ffffd097          	auipc	ra,0xffffd
    800061f0:	8e0080e7          	jalr	-1824(ra) # 80002acc <_ZN9SemaphoreC1Ej>
    800061f4:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800061f8:	01000513          	li	a0,16
    800061fc:	ffffc097          	auipc	ra,0xffffc
    80006200:	59c080e7          	jalr	1436(ra) # 80002798 <_Znwm>
    80006204:	00050993          	mv	s3,a0
    80006208:	00090593          	mv	a1,s2
    8000620c:	ffffd097          	auipc	ra,0xffffd
    80006210:	8c0080e7          	jalr	-1856(ra) # 80002acc <_ZN9SemaphoreC1Ej>
    80006214:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80006218:	01000513          	li	a0,16
    8000621c:	ffffc097          	auipc	ra,0xffffc
    80006220:	57c080e7          	jalr	1404(ra) # 80002798 <_Znwm>
    80006224:	00050913          	mv	s2,a0
    80006228:	00100593          	li	a1,1
    8000622c:	ffffd097          	auipc	ra,0xffffd
    80006230:	8a0080e7          	jalr	-1888(ra) # 80002acc <_ZN9SemaphoreC1Ej>
    80006234:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006238:	01000513          	li	a0,16
    8000623c:	ffffc097          	auipc	ra,0xffffc
    80006240:	55c080e7          	jalr	1372(ra) # 80002798 <_Znwm>
    80006244:	00050913          	mv	s2,a0
    80006248:	00100593          	li	a1,1
    8000624c:	ffffd097          	auipc	ra,0xffffd
    80006250:	880080e7          	jalr	-1920(ra) # 80002acc <_ZN9SemaphoreC1Ej>
    80006254:	0324b823          	sd	s2,48(s1)
}
    80006258:	02813083          	ld	ra,40(sp)
    8000625c:	02013403          	ld	s0,32(sp)
    80006260:	01813483          	ld	s1,24(sp)
    80006264:	01013903          	ld	s2,16(sp)
    80006268:	00813983          	ld	s3,8(sp)
    8000626c:	03010113          	addi	sp,sp,48
    80006270:	00008067          	ret
    80006274:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006278:	00098513          	mv	a0,s3
    8000627c:	ffffc097          	auipc	ra,0xffffc
    80006280:	56c080e7          	jalr	1388(ra) # 800027e8 <_ZdlPv>
    80006284:	00048513          	mv	a0,s1
    80006288:	00008097          	auipc	ra,0x8
    8000628c:	b50080e7          	jalr	-1200(ra) # 8000ddd8 <_Unwind_Resume>
    80006290:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006294:	00098513          	mv	a0,s3
    80006298:	ffffc097          	auipc	ra,0xffffc
    8000629c:	550080e7          	jalr	1360(ra) # 800027e8 <_ZdlPv>
    800062a0:	00048513          	mv	a0,s1
    800062a4:	00008097          	auipc	ra,0x8
    800062a8:	b34080e7          	jalr	-1228(ra) # 8000ddd8 <_Unwind_Resume>
    800062ac:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800062b0:	00090513          	mv	a0,s2
    800062b4:	ffffc097          	auipc	ra,0xffffc
    800062b8:	534080e7          	jalr	1332(ra) # 800027e8 <_ZdlPv>
    800062bc:	00048513          	mv	a0,s1
    800062c0:	00008097          	auipc	ra,0x8
    800062c4:	b18080e7          	jalr	-1256(ra) # 8000ddd8 <_Unwind_Resume>
    800062c8:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800062cc:	00090513          	mv	a0,s2
    800062d0:	ffffc097          	auipc	ra,0xffffc
    800062d4:	518080e7          	jalr	1304(ra) # 800027e8 <_ZdlPv>
    800062d8:	00048513          	mv	a0,s1
    800062dc:	00008097          	auipc	ra,0x8
    800062e0:	afc080e7          	jalr	-1284(ra) # 8000ddd8 <_Unwind_Resume>

00000000800062e4 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800062e4:	fe010113          	addi	sp,sp,-32
    800062e8:	00113c23          	sd	ra,24(sp)
    800062ec:	00813823          	sd	s0,16(sp)
    800062f0:	00913423          	sd	s1,8(sp)
    800062f4:	01213023          	sd	s2,0(sp)
    800062f8:	02010413          	addi	s0,sp,32
    800062fc:	00050493          	mv	s1,a0
    80006300:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80006304:	01853503          	ld	a0,24(a0)
    80006308:	ffffc097          	auipc	ra,0xffffc
    8000630c:	7fc080e7          	jalr	2044(ra) # 80002b04 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80006310:	0304b503          	ld	a0,48(s1)
    80006314:	ffffc097          	auipc	ra,0xffffc
    80006318:	7f0080e7          	jalr	2032(ra) # 80002b04 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    8000631c:	0084b783          	ld	a5,8(s1)
    80006320:	0144a703          	lw	a4,20(s1)
    80006324:	00271713          	slli	a4,a4,0x2
    80006328:	00e787b3          	add	a5,a5,a4
    8000632c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006330:	0144a783          	lw	a5,20(s1)
    80006334:	0017879b          	addiw	a5,a5,1
    80006338:	0004a703          	lw	a4,0(s1)
    8000633c:	02e7e7bb          	remw	a5,a5,a4
    80006340:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006344:	0304b503          	ld	a0,48(s1)
    80006348:	ffffc097          	auipc	ra,0xffffc
    8000634c:	7e8080e7          	jalr	2024(ra) # 80002b30 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006350:	0204b503          	ld	a0,32(s1)
    80006354:	ffffc097          	auipc	ra,0xffffc
    80006358:	7dc080e7          	jalr	2012(ra) # 80002b30 <_ZN9Semaphore6signalEv>

}
    8000635c:	01813083          	ld	ra,24(sp)
    80006360:	01013403          	ld	s0,16(sp)
    80006364:	00813483          	ld	s1,8(sp)
    80006368:	00013903          	ld	s2,0(sp)
    8000636c:	02010113          	addi	sp,sp,32
    80006370:	00008067          	ret

0000000080006374 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006374:	fe010113          	addi	sp,sp,-32
    80006378:	00113c23          	sd	ra,24(sp)
    8000637c:	00813823          	sd	s0,16(sp)
    80006380:	00913423          	sd	s1,8(sp)
    80006384:	01213023          	sd	s2,0(sp)
    80006388:	02010413          	addi	s0,sp,32
    8000638c:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006390:	02053503          	ld	a0,32(a0)
    80006394:	ffffc097          	auipc	ra,0xffffc
    80006398:	770080e7          	jalr	1904(ra) # 80002b04 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    8000639c:	0284b503          	ld	a0,40(s1)
    800063a0:	ffffc097          	auipc	ra,0xffffc
    800063a4:	764080e7          	jalr	1892(ra) # 80002b04 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    800063a8:	0084b703          	ld	a4,8(s1)
    800063ac:	0104a783          	lw	a5,16(s1)
    800063b0:	00279693          	slli	a3,a5,0x2
    800063b4:	00d70733          	add	a4,a4,a3
    800063b8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800063bc:	0017879b          	addiw	a5,a5,1
    800063c0:	0004a703          	lw	a4,0(s1)
    800063c4:	02e7e7bb          	remw	a5,a5,a4
    800063c8:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800063cc:	0284b503          	ld	a0,40(s1)
    800063d0:	ffffc097          	auipc	ra,0xffffc
    800063d4:	760080e7          	jalr	1888(ra) # 80002b30 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800063d8:	0184b503          	ld	a0,24(s1)
    800063dc:	ffffc097          	auipc	ra,0xffffc
    800063e0:	754080e7          	jalr	1876(ra) # 80002b30 <_ZN9Semaphore6signalEv>

    return ret;
}
    800063e4:	00090513          	mv	a0,s2
    800063e8:	01813083          	ld	ra,24(sp)
    800063ec:	01013403          	ld	s0,16(sp)
    800063f0:	00813483          	ld	s1,8(sp)
    800063f4:	00013903          	ld	s2,0(sp)
    800063f8:	02010113          	addi	sp,sp,32
    800063fc:	00008067          	ret

0000000080006400 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006400:	fe010113          	addi	sp,sp,-32
    80006404:	00113c23          	sd	ra,24(sp)
    80006408:	00813823          	sd	s0,16(sp)
    8000640c:	00913423          	sd	s1,8(sp)
    80006410:	01213023          	sd	s2,0(sp)
    80006414:	02010413          	addi	s0,sp,32
    80006418:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    8000641c:	02853503          	ld	a0,40(a0)
    80006420:	ffffc097          	auipc	ra,0xffffc
    80006424:	6e4080e7          	jalr	1764(ra) # 80002b04 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006428:	0304b503          	ld	a0,48(s1)
    8000642c:	ffffc097          	auipc	ra,0xffffc
    80006430:	6d8080e7          	jalr	1752(ra) # 80002b04 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006434:	0144a783          	lw	a5,20(s1)
    80006438:	0104a903          	lw	s2,16(s1)
    8000643c:	0327ce63          	blt	a5,s2,80006478 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006440:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006444:	0304b503          	ld	a0,48(s1)
    80006448:	ffffc097          	auipc	ra,0xffffc
    8000644c:	6e8080e7          	jalr	1768(ra) # 80002b30 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006450:	0284b503          	ld	a0,40(s1)
    80006454:	ffffc097          	auipc	ra,0xffffc
    80006458:	6dc080e7          	jalr	1756(ra) # 80002b30 <_ZN9Semaphore6signalEv>

    return ret;
}
    8000645c:	00090513          	mv	a0,s2
    80006460:	01813083          	ld	ra,24(sp)
    80006464:	01013403          	ld	s0,16(sp)
    80006468:	00813483          	ld	s1,8(sp)
    8000646c:	00013903          	ld	s2,0(sp)
    80006470:	02010113          	addi	sp,sp,32
    80006474:	00008067          	ret
        ret = cap - head + tail;
    80006478:	0004a703          	lw	a4,0(s1)
    8000647c:	4127093b          	subw	s2,a4,s2
    80006480:	00f9093b          	addw	s2,s2,a5
    80006484:	fc1ff06f          	j	80006444 <_ZN9BufferCPP6getCntEv+0x44>

0000000080006488 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006488:	fe010113          	addi	sp,sp,-32
    8000648c:	00113c23          	sd	ra,24(sp)
    80006490:	00813823          	sd	s0,16(sp)
    80006494:	00913423          	sd	s1,8(sp)
    80006498:	02010413          	addi	s0,sp,32
    8000649c:	00050493          	mv	s1,a0
    Console::putc('\n');
    800064a0:	00a00513          	li	a0,10
    800064a4:	ffffc097          	auipc	ra,0xffffc
    800064a8:	754080e7          	jalr	1876(ra) # 80002bf8 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800064ac:	00004517          	auipc	a0,0x4
    800064b0:	f7c50513          	addi	a0,a0,-132 # 8000a428 <_ZZ9kPrintIntmE6digits+0x3b8>
    800064b4:	00000097          	auipc	ra,0x0
    800064b8:	a0c080e7          	jalr	-1524(ra) # 80005ec0 <_Z11printStringPKc>
    while (getCnt()) {
    800064bc:	00048513          	mv	a0,s1
    800064c0:	00000097          	auipc	ra,0x0
    800064c4:	f40080e7          	jalr	-192(ra) # 80006400 <_ZN9BufferCPP6getCntEv>
    800064c8:	02050c63          	beqz	a0,80006500 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800064cc:	0084b783          	ld	a5,8(s1)
    800064d0:	0104a703          	lw	a4,16(s1)
    800064d4:	00271713          	slli	a4,a4,0x2
    800064d8:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800064dc:	0007c503          	lbu	a0,0(a5)
    800064e0:	ffffc097          	auipc	ra,0xffffc
    800064e4:	718080e7          	jalr	1816(ra) # 80002bf8 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800064e8:	0104a783          	lw	a5,16(s1)
    800064ec:	0017879b          	addiw	a5,a5,1
    800064f0:	0004a703          	lw	a4,0(s1)
    800064f4:	02e7e7bb          	remw	a5,a5,a4
    800064f8:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800064fc:	fc1ff06f          	j	800064bc <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006500:	02100513          	li	a0,33
    80006504:	ffffc097          	auipc	ra,0xffffc
    80006508:	6f4080e7          	jalr	1780(ra) # 80002bf8 <_ZN7Console4putcEc>
    Console::putc('\n');
    8000650c:	00a00513          	li	a0,10
    80006510:	ffffc097          	auipc	ra,0xffffc
    80006514:	6e8080e7          	jalr	1768(ra) # 80002bf8 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006518:	0084b503          	ld	a0,8(s1)
    8000651c:	ffffb097          	auipc	ra,0xffffb
    80006520:	e34080e7          	jalr	-460(ra) # 80001350 <_Z8mem_freePv>
    delete itemAvailable;
    80006524:	0204b503          	ld	a0,32(s1)
    80006528:	00050863          	beqz	a0,80006538 <_ZN9BufferCPPD1Ev+0xb0>
    8000652c:	00053783          	ld	a5,0(a0)
    80006530:	0087b783          	ld	a5,8(a5)
    80006534:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006538:	0184b503          	ld	a0,24(s1)
    8000653c:	00050863          	beqz	a0,8000654c <_ZN9BufferCPPD1Ev+0xc4>
    80006540:	00053783          	ld	a5,0(a0)
    80006544:	0087b783          	ld	a5,8(a5)
    80006548:	000780e7          	jalr	a5
    delete mutexTail;
    8000654c:	0304b503          	ld	a0,48(s1)
    80006550:	00050863          	beqz	a0,80006560 <_ZN9BufferCPPD1Ev+0xd8>
    80006554:	00053783          	ld	a5,0(a0)
    80006558:	0087b783          	ld	a5,8(a5)
    8000655c:	000780e7          	jalr	a5
    delete mutexHead;
    80006560:	0284b503          	ld	a0,40(s1)
    80006564:	00050863          	beqz	a0,80006574 <_ZN9BufferCPPD1Ev+0xec>
    80006568:	00053783          	ld	a5,0(a0)
    8000656c:	0087b783          	ld	a5,8(a5)
    80006570:	000780e7          	jalr	a5
}
    80006574:	01813083          	ld	ra,24(sp)
    80006578:	01013403          	ld	s0,16(sp)
    8000657c:	00813483          	ld	s1,8(sp)
    80006580:	02010113          	addi	sp,sp,32
    80006584:	00008067          	ret

0000000080006588 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80006588:	fe010113          	addi	sp,sp,-32
    8000658c:	00113c23          	sd	ra,24(sp)
    80006590:	00813823          	sd	s0,16(sp)
    80006594:	00913423          	sd	s1,8(sp)
    80006598:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    8000659c:	00004517          	auipc	a0,0x4
    800065a0:	ea450513          	addi	a0,a0,-348 # 8000a440 <_ZZ9kPrintIntmE6digits+0x3d0>
    800065a4:	00000097          	auipc	ra,0x0
    800065a8:	91c080e7          	jalr	-1764(ra) # 80005ec0 <_Z11printStringPKc>
    int test = getc() - '0';
    800065ac:	ffffb097          	auipc	ra,0xffffb
    800065b0:	fbc080e7          	jalr	-68(ra) # 80001568 <_Z4getcv>
    800065b4:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800065b8:	ffffb097          	auipc	ra,0xffffb
    800065bc:	fb0080e7          	jalr	-80(ra) # 80001568 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800065c0:	00700793          	li	a5,7
    800065c4:	1097e263          	bltu	a5,s1,800066c8 <_Z8userMainv+0x140>
    800065c8:	00249493          	slli	s1,s1,0x2
    800065cc:	00004717          	auipc	a4,0x4
    800065d0:	0cc70713          	addi	a4,a4,204 # 8000a698 <_ZZ9kPrintIntmE6digits+0x628>
    800065d4:	00e484b3          	add	s1,s1,a4
    800065d8:	0004a783          	lw	a5,0(s1)
    800065dc:	00e787b3          	add	a5,a5,a4
    800065e0:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    800065e4:	fffff097          	auipc	ra,0xfffff
    800065e8:	f54080e7          	jalr	-172(ra) # 80005538 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    800065ec:	00004517          	auipc	a0,0x4
    800065f0:	e7450513          	addi	a0,a0,-396 # 8000a460 <_ZZ9kPrintIntmE6digits+0x3f0>
    800065f4:	00000097          	auipc	ra,0x0
    800065f8:	8cc080e7          	jalr	-1844(ra) # 80005ec0 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    800065fc:	01813083          	ld	ra,24(sp)
    80006600:	01013403          	ld	s0,16(sp)
    80006604:	00813483          	ld	s1,8(sp)
    80006608:	02010113          	addi	sp,sp,32
    8000660c:	00008067          	ret
            Threads_CPP_API_test();
    80006610:	ffffe097          	auipc	ra,0xffffe
    80006614:	e08080e7          	jalr	-504(ra) # 80004418 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006618:	00004517          	auipc	a0,0x4
    8000661c:	e8850513          	addi	a0,a0,-376 # 8000a4a0 <_ZZ9kPrintIntmE6digits+0x430>
    80006620:	00000097          	auipc	ra,0x0
    80006624:	8a0080e7          	jalr	-1888(ra) # 80005ec0 <_Z11printStringPKc>
            break;
    80006628:	fd5ff06f          	j	800065fc <_Z8userMainv+0x74>
            producerConsumer_C_API();
    8000662c:	ffffd097          	auipc	ra,0xffffd
    80006630:	640080e7          	jalr	1600(ra) # 80003c6c <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006634:	00004517          	auipc	a0,0x4
    80006638:	eac50513          	addi	a0,a0,-340 # 8000a4e0 <_ZZ9kPrintIntmE6digits+0x470>
    8000663c:	00000097          	auipc	ra,0x0
    80006640:	884080e7          	jalr	-1916(ra) # 80005ec0 <_Z11printStringPKc>
            break;
    80006644:	fb9ff06f          	j	800065fc <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006648:	fffff097          	auipc	ra,0xfffff
    8000664c:	234080e7          	jalr	564(ra) # 8000587c <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006650:	00004517          	auipc	a0,0x4
    80006654:	ee050513          	addi	a0,a0,-288 # 8000a530 <_ZZ9kPrintIntmE6digits+0x4c0>
    80006658:	00000097          	auipc	ra,0x0
    8000665c:	868080e7          	jalr	-1944(ra) # 80005ec0 <_Z11printStringPKc>
            break;
    80006660:	f9dff06f          	j	800065fc <_Z8userMainv+0x74>
            testSleeping();
    80006664:	00000097          	auipc	ra,0x0
    80006668:	11c080e7          	jalr	284(ra) # 80006780 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    8000666c:	00004517          	auipc	a0,0x4
    80006670:	f1c50513          	addi	a0,a0,-228 # 8000a588 <_ZZ9kPrintIntmE6digits+0x518>
    80006674:	00000097          	auipc	ra,0x0
    80006678:	84c080e7          	jalr	-1972(ra) # 80005ec0 <_Z11printStringPKc>
            break;
    8000667c:	f81ff06f          	j	800065fc <_Z8userMainv+0x74>
            testConsumerProducer();
    80006680:	ffffe097          	auipc	ra,0xffffe
    80006684:	258080e7          	jalr	600(ra) # 800048d8 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006688:	00004517          	auipc	a0,0x4
    8000668c:	f3050513          	addi	a0,a0,-208 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80006690:	00000097          	auipc	ra,0x0
    80006694:	830080e7          	jalr	-2000(ra) # 80005ec0 <_Z11printStringPKc>
            break;
    80006698:	f65ff06f          	j	800065fc <_Z8userMainv+0x74>
            System_Mode_test();
    8000669c:	00000097          	auipc	ra,0x0
    800066a0:	658080e7          	jalr	1624(ra) # 80006cf4 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    800066a4:	00004517          	auipc	a0,0x4
    800066a8:	f5450513          	addi	a0,a0,-172 # 8000a5f8 <_ZZ9kPrintIntmE6digits+0x588>
    800066ac:	00000097          	auipc	ra,0x0
    800066b0:	814080e7          	jalr	-2028(ra) # 80005ec0 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800066b4:	00004517          	auipc	a0,0x4
    800066b8:	f6450513          	addi	a0,a0,-156 # 8000a618 <_ZZ9kPrintIntmE6digits+0x5a8>
    800066bc:	00000097          	auipc	ra,0x0
    800066c0:	804080e7          	jalr	-2044(ra) # 80005ec0 <_Z11printStringPKc>
            break;
    800066c4:	f39ff06f          	j	800065fc <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    800066c8:	00004517          	auipc	a0,0x4
    800066cc:	fa850513          	addi	a0,a0,-88 # 8000a670 <_ZZ9kPrintIntmE6digits+0x600>
    800066d0:	fffff097          	auipc	ra,0xfffff
    800066d4:	7f0080e7          	jalr	2032(ra) # 80005ec0 <_Z11printStringPKc>
    800066d8:	f25ff06f          	j	800065fc <_Z8userMainv+0x74>

00000000800066dc <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800066dc:	fe010113          	addi	sp,sp,-32
    800066e0:	00113c23          	sd	ra,24(sp)
    800066e4:	00813823          	sd	s0,16(sp)
    800066e8:	00913423          	sd	s1,8(sp)
    800066ec:	01213023          	sd	s2,0(sp)
    800066f0:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800066f4:	00053903          	ld	s2,0(a0)
    int i = 6;
    800066f8:	00600493          	li	s1,6
    while (--i > 0) {
    800066fc:	fff4849b          	addiw	s1,s1,-1
    80006700:	04905463          	blez	s1,80006748 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006704:	00004517          	auipc	a0,0x4
    80006708:	fb450513          	addi	a0,a0,-76 # 8000a6b8 <_ZZ9kPrintIntmE6digits+0x648>
    8000670c:	fffff097          	auipc	ra,0xfffff
    80006710:	7b4080e7          	jalr	1972(ra) # 80005ec0 <_Z11printStringPKc>
        printInt(sleep_time);
    80006714:	00000613          	li	a2,0
    80006718:	00a00593          	li	a1,10
    8000671c:	0009051b          	sext.w	a0,s2
    80006720:	00000097          	auipc	ra,0x0
    80006724:	950080e7          	jalr	-1712(ra) # 80006070 <_Z8printIntiii>
        printString(" !\n");
    80006728:	00004517          	auipc	a0,0x4
    8000672c:	f9850513          	addi	a0,a0,-104 # 8000a6c0 <_ZZ9kPrintIntmE6digits+0x650>
    80006730:	fffff097          	auipc	ra,0xfffff
    80006734:	790080e7          	jalr	1936(ra) # 80005ec0 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006738:	00090513          	mv	a0,s2
    8000673c:	ffffb097          	auipc	ra,0xffffb
    80006740:	d34080e7          	jalr	-716(ra) # 80001470 <_Z10time_sleepm>
    while (--i > 0) {
    80006744:	fb9ff06f          	j	800066fc <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006748:	00a00793          	li	a5,10
    8000674c:	02f95933          	divu	s2,s2,a5
    80006750:	fff90913          	addi	s2,s2,-1
    80006754:	00006797          	auipc	a5,0x6
    80006758:	5ac78793          	addi	a5,a5,1452 # 8000cd00 <_ZL8finished>
    8000675c:	01278933          	add	s2,a5,s2
    80006760:	00100793          	li	a5,1
    80006764:	00f90023          	sb	a5,0(s2)
}
    80006768:	01813083          	ld	ra,24(sp)
    8000676c:	01013403          	ld	s0,16(sp)
    80006770:	00813483          	ld	s1,8(sp)
    80006774:	00013903          	ld	s2,0(sp)
    80006778:	02010113          	addi	sp,sp,32
    8000677c:	00008067          	ret

0000000080006780 <_Z12testSleepingv>:

void testSleeping() {
    80006780:	fc010113          	addi	sp,sp,-64
    80006784:	02113c23          	sd	ra,56(sp)
    80006788:	02813823          	sd	s0,48(sp)
    8000678c:	02913423          	sd	s1,40(sp)
    80006790:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006794:	00a00793          	li	a5,10
    80006798:	fcf43823          	sd	a5,-48(s0)
    8000679c:	01400793          	li	a5,20
    800067a0:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800067a4:	00000493          	li	s1,0
    800067a8:	02c0006f          	j	800067d4 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800067ac:	00349793          	slli	a5,s1,0x3
    800067b0:	fd040613          	addi	a2,s0,-48
    800067b4:	00f60633          	add	a2,a2,a5
    800067b8:	00000597          	auipc	a1,0x0
    800067bc:	f2458593          	addi	a1,a1,-220 # 800066dc <_ZL9sleepyRunPv>
    800067c0:	fc040513          	addi	a0,s0,-64
    800067c4:	00f50533          	add	a0,a0,a5
    800067c8:	ffffb097          	auipc	ra,0xffffb
    800067cc:	bb8080e7          	jalr	-1096(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800067d0:	0014849b          	addiw	s1,s1,1
    800067d4:	00100793          	li	a5,1
    800067d8:	fc97dae3          	bge	a5,s1,800067ac <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800067dc:	00006797          	auipc	a5,0x6
    800067e0:	5247c783          	lbu	a5,1316(a5) # 8000cd00 <_ZL8finished>
    800067e4:	fe078ce3          	beqz	a5,800067dc <_Z12testSleepingv+0x5c>
    800067e8:	00006797          	auipc	a5,0x6
    800067ec:	5197c783          	lbu	a5,1305(a5) # 8000cd01 <_ZL8finished+0x1>
    800067f0:	fe0786e3          	beqz	a5,800067dc <_Z12testSleepingv+0x5c>
}
    800067f4:	03813083          	ld	ra,56(sp)
    800067f8:	03013403          	ld	s0,48(sp)
    800067fc:	02813483          	ld	s1,40(sp)
    80006800:	04010113          	addi	sp,sp,64
    80006804:	00008067          	ret

0000000080006808 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006808:	fe010113          	addi	sp,sp,-32
    8000680c:	00113c23          	sd	ra,24(sp)
    80006810:	00813823          	sd	s0,16(sp)
    80006814:	00913423          	sd	s1,8(sp)
    80006818:	01213023          	sd	s2,0(sp)
    8000681c:	02010413          	addi	s0,sp,32
    80006820:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006824:	00100793          	li	a5,1
    80006828:	02a7f863          	bgeu	a5,a0,80006858 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000682c:	00a00793          	li	a5,10
    80006830:	02f577b3          	remu	a5,a0,a5
    80006834:	02078e63          	beqz	a5,80006870 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006838:	fff48513          	addi	a0,s1,-1
    8000683c:	00000097          	auipc	ra,0x0
    80006840:	fcc080e7          	jalr	-52(ra) # 80006808 <_ZL9fibonaccim>
    80006844:	00050913          	mv	s2,a0
    80006848:	ffe48513          	addi	a0,s1,-2
    8000684c:	00000097          	auipc	ra,0x0
    80006850:	fbc080e7          	jalr	-68(ra) # 80006808 <_ZL9fibonaccim>
    80006854:	00a90533          	add	a0,s2,a0
}
    80006858:	01813083          	ld	ra,24(sp)
    8000685c:	01013403          	ld	s0,16(sp)
    80006860:	00813483          	ld	s1,8(sp)
    80006864:	00013903          	ld	s2,0(sp)
    80006868:	02010113          	addi	sp,sp,32
    8000686c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006870:	ffffb097          	auipc	ra,0xffffb
    80006874:	bb8080e7          	jalr	-1096(ra) # 80001428 <_Z15thread_dispatchv>
    80006878:	fc1ff06f          	j	80006838 <_ZL9fibonaccim+0x30>

000000008000687c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    8000687c:	fe010113          	addi	sp,sp,-32
    80006880:	00113c23          	sd	ra,24(sp)
    80006884:	00813823          	sd	s0,16(sp)
    80006888:	00913423          	sd	s1,8(sp)
    8000688c:	01213023          	sd	s2,0(sp)
    80006890:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006894:	00a00493          	li	s1,10
    80006898:	0400006f          	j	800068d8 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000689c:	00004517          	auipc	a0,0x4
    800068a0:	af450513          	addi	a0,a0,-1292 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    800068a4:	fffff097          	auipc	ra,0xfffff
    800068a8:	61c080e7          	jalr	1564(ra) # 80005ec0 <_Z11printStringPKc>
    800068ac:	00000613          	li	a2,0
    800068b0:	00a00593          	li	a1,10
    800068b4:	00048513          	mv	a0,s1
    800068b8:	fffff097          	auipc	ra,0xfffff
    800068bc:	7b8080e7          	jalr	1976(ra) # 80006070 <_Z8printIntiii>
    800068c0:	00004517          	auipc	a0,0x4
    800068c4:	cc050513          	addi	a0,a0,-832 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800068c8:	fffff097          	auipc	ra,0xfffff
    800068cc:	5f8080e7          	jalr	1528(ra) # 80005ec0 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800068d0:	0014849b          	addiw	s1,s1,1
    800068d4:	0ff4f493          	andi	s1,s1,255
    800068d8:	00c00793          	li	a5,12
    800068dc:	fc97f0e3          	bgeu	a5,s1,8000689c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800068e0:	00004517          	auipc	a0,0x4
    800068e4:	ab850513          	addi	a0,a0,-1352 # 8000a398 <_ZZ9kPrintIntmE6digits+0x328>
    800068e8:	fffff097          	auipc	ra,0xfffff
    800068ec:	5d8080e7          	jalr	1496(ra) # 80005ec0 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800068f0:	00500313          	li	t1,5
    thread_dispatch();
    800068f4:	ffffb097          	auipc	ra,0xffffb
    800068f8:	b34080e7          	jalr	-1228(ra) # 80001428 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800068fc:	01000513          	li	a0,16
    80006900:	00000097          	auipc	ra,0x0
    80006904:	f08080e7          	jalr	-248(ra) # 80006808 <_ZL9fibonaccim>
    80006908:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000690c:	00004517          	auipc	a0,0x4
    80006910:	a9c50513          	addi	a0,a0,-1380 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    80006914:	fffff097          	auipc	ra,0xfffff
    80006918:	5ac080e7          	jalr	1452(ra) # 80005ec0 <_Z11printStringPKc>
    8000691c:	00000613          	li	a2,0
    80006920:	00a00593          	li	a1,10
    80006924:	0009051b          	sext.w	a0,s2
    80006928:	fffff097          	auipc	ra,0xfffff
    8000692c:	748080e7          	jalr	1864(ra) # 80006070 <_Z8printIntiii>
    80006930:	00004517          	auipc	a0,0x4
    80006934:	c5050513          	addi	a0,a0,-944 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006938:	fffff097          	auipc	ra,0xfffff
    8000693c:	588080e7          	jalr	1416(ra) # 80005ec0 <_Z11printStringPKc>
    80006940:	0400006f          	j	80006980 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006944:	00004517          	auipc	a0,0x4
    80006948:	a4c50513          	addi	a0,a0,-1460 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    8000694c:	fffff097          	auipc	ra,0xfffff
    80006950:	574080e7          	jalr	1396(ra) # 80005ec0 <_Z11printStringPKc>
    80006954:	00000613          	li	a2,0
    80006958:	00a00593          	li	a1,10
    8000695c:	00048513          	mv	a0,s1
    80006960:	fffff097          	auipc	ra,0xfffff
    80006964:	710080e7          	jalr	1808(ra) # 80006070 <_Z8printIntiii>
    80006968:	00004517          	auipc	a0,0x4
    8000696c:	c1850513          	addi	a0,a0,-1000 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006970:	fffff097          	auipc	ra,0xfffff
    80006974:	550080e7          	jalr	1360(ra) # 80005ec0 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006978:	0014849b          	addiw	s1,s1,1
    8000697c:	0ff4f493          	andi	s1,s1,255
    80006980:	00f00793          	li	a5,15
    80006984:	fc97f0e3          	bgeu	a5,s1,80006944 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006988:	00004517          	auipc	a0,0x4
    8000698c:	a3050513          	addi	a0,a0,-1488 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    80006990:	fffff097          	auipc	ra,0xfffff
    80006994:	530080e7          	jalr	1328(ra) # 80005ec0 <_Z11printStringPKc>
    finishedD = true;
    80006998:	00100793          	li	a5,1
    8000699c:	00006717          	auipc	a4,0x6
    800069a0:	36f70323          	sb	a5,870(a4) # 8000cd02 <_ZL9finishedD>
    thread_dispatch();
    800069a4:	ffffb097          	auipc	ra,0xffffb
    800069a8:	a84080e7          	jalr	-1404(ra) # 80001428 <_Z15thread_dispatchv>
}
    800069ac:	01813083          	ld	ra,24(sp)
    800069b0:	01013403          	ld	s0,16(sp)
    800069b4:	00813483          	ld	s1,8(sp)
    800069b8:	00013903          	ld	s2,0(sp)
    800069bc:	02010113          	addi	sp,sp,32
    800069c0:	00008067          	ret

00000000800069c4 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800069c4:	fe010113          	addi	sp,sp,-32
    800069c8:	00113c23          	sd	ra,24(sp)
    800069cc:	00813823          	sd	s0,16(sp)
    800069d0:	00913423          	sd	s1,8(sp)
    800069d4:	01213023          	sd	s2,0(sp)
    800069d8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800069dc:	00000493          	li	s1,0
    800069e0:	0400006f          	j	80006a20 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800069e4:	00004517          	auipc	a0,0x4
    800069e8:	96c50513          	addi	a0,a0,-1684 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    800069ec:	fffff097          	auipc	ra,0xfffff
    800069f0:	4d4080e7          	jalr	1236(ra) # 80005ec0 <_Z11printStringPKc>
    800069f4:	00000613          	li	a2,0
    800069f8:	00a00593          	li	a1,10
    800069fc:	00048513          	mv	a0,s1
    80006a00:	fffff097          	auipc	ra,0xfffff
    80006a04:	670080e7          	jalr	1648(ra) # 80006070 <_Z8printIntiii>
    80006a08:	00004517          	auipc	a0,0x4
    80006a0c:	b7850513          	addi	a0,a0,-1160 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006a10:	fffff097          	auipc	ra,0xfffff
    80006a14:	4b0080e7          	jalr	1200(ra) # 80005ec0 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006a18:	0014849b          	addiw	s1,s1,1
    80006a1c:	0ff4f493          	andi	s1,s1,255
    80006a20:	00200793          	li	a5,2
    80006a24:	fc97f0e3          	bgeu	a5,s1,800069e4 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006a28:	00004517          	auipc	a0,0x4
    80006a2c:	93050513          	addi	a0,a0,-1744 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80006a30:	fffff097          	auipc	ra,0xfffff
    80006a34:	490080e7          	jalr	1168(ra) # 80005ec0 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006a38:	00700313          	li	t1,7
    thread_dispatch();
    80006a3c:	ffffb097          	auipc	ra,0xffffb
    80006a40:	9ec080e7          	jalr	-1556(ra) # 80001428 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006a44:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006a48:	00004517          	auipc	a0,0x4
    80006a4c:	92050513          	addi	a0,a0,-1760 # 8000a368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80006a50:	fffff097          	auipc	ra,0xfffff
    80006a54:	470080e7          	jalr	1136(ra) # 80005ec0 <_Z11printStringPKc>
    80006a58:	00000613          	li	a2,0
    80006a5c:	00a00593          	li	a1,10
    80006a60:	0009051b          	sext.w	a0,s2
    80006a64:	fffff097          	auipc	ra,0xfffff
    80006a68:	60c080e7          	jalr	1548(ra) # 80006070 <_Z8printIntiii>
    80006a6c:	00004517          	auipc	a0,0x4
    80006a70:	b1450513          	addi	a0,a0,-1260 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006a74:	fffff097          	auipc	ra,0xfffff
    80006a78:	44c080e7          	jalr	1100(ra) # 80005ec0 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006a7c:	00c00513          	li	a0,12
    80006a80:	00000097          	auipc	ra,0x0
    80006a84:	d88080e7          	jalr	-632(ra) # 80006808 <_ZL9fibonaccim>
    80006a88:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006a8c:	00004517          	auipc	a0,0x4
    80006a90:	8e450513          	addi	a0,a0,-1820 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    80006a94:	fffff097          	auipc	ra,0xfffff
    80006a98:	42c080e7          	jalr	1068(ra) # 80005ec0 <_Z11printStringPKc>
    80006a9c:	00000613          	li	a2,0
    80006aa0:	00a00593          	li	a1,10
    80006aa4:	0009051b          	sext.w	a0,s2
    80006aa8:	fffff097          	auipc	ra,0xfffff
    80006aac:	5c8080e7          	jalr	1480(ra) # 80006070 <_Z8printIntiii>
    80006ab0:	00004517          	auipc	a0,0x4
    80006ab4:	ad050513          	addi	a0,a0,-1328 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006ab8:	fffff097          	auipc	ra,0xfffff
    80006abc:	408080e7          	jalr	1032(ra) # 80005ec0 <_Z11printStringPKc>
    80006ac0:	0400006f          	j	80006b00 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006ac4:	00004517          	auipc	a0,0x4
    80006ac8:	88c50513          	addi	a0,a0,-1908 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80006acc:	fffff097          	auipc	ra,0xfffff
    80006ad0:	3f4080e7          	jalr	1012(ra) # 80005ec0 <_Z11printStringPKc>
    80006ad4:	00000613          	li	a2,0
    80006ad8:	00a00593          	li	a1,10
    80006adc:	00048513          	mv	a0,s1
    80006ae0:	fffff097          	auipc	ra,0xfffff
    80006ae4:	590080e7          	jalr	1424(ra) # 80006070 <_Z8printIntiii>
    80006ae8:	00004517          	auipc	a0,0x4
    80006aec:	a9850513          	addi	a0,a0,-1384 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006af0:	fffff097          	auipc	ra,0xfffff
    80006af4:	3d0080e7          	jalr	976(ra) # 80005ec0 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006af8:	0014849b          	addiw	s1,s1,1
    80006afc:	0ff4f493          	andi	s1,s1,255
    80006b00:	00500793          	li	a5,5
    80006b04:	fc97f0e3          	bgeu	a5,s1,80006ac4 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006b08:	00004517          	auipc	a0,0x4
    80006b0c:	82050513          	addi	a0,a0,-2016 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80006b10:	fffff097          	auipc	ra,0xfffff
    80006b14:	3b0080e7          	jalr	944(ra) # 80005ec0 <_Z11printStringPKc>
    finishedC = true;
    80006b18:	00100793          	li	a5,1
    80006b1c:	00006717          	auipc	a4,0x6
    80006b20:	1ef703a3          	sb	a5,487(a4) # 8000cd03 <_ZL9finishedC>
    thread_dispatch();
    80006b24:	ffffb097          	auipc	ra,0xffffb
    80006b28:	904080e7          	jalr	-1788(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006b2c:	01813083          	ld	ra,24(sp)
    80006b30:	01013403          	ld	s0,16(sp)
    80006b34:	00813483          	ld	s1,8(sp)
    80006b38:	00013903          	ld	s2,0(sp)
    80006b3c:	02010113          	addi	sp,sp,32
    80006b40:	00008067          	ret

0000000080006b44 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006b44:	fe010113          	addi	sp,sp,-32
    80006b48:	00113c23          	sd	ra,24(sp)
    80006b4c:	00813823          	sd	s0,16(sp)
    80006b50:	00913423          	sd	s1,8(sp)
    80006b54:	01213023          	sd	s2,0(sp)
    80006b58:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006b5c:	00000913          	li	s2,0
    80006b60:	0400006f          	j	80006ba0 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006b64:	ffffb097          	auipc	ra,0xffffb
    80006b68:	8c4080e7          	jalr	-1852(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006b6c:	00148493          	addi	s1,s1,1
    80006b70:	000027b7          	lui	a5,0x2
    80006b74:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006b78:	0097ee63          	bltu	a5,s1,80006b94 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006b7c:	00000713          	li	a4,0
    80006b80:	000077b7          	lui	a5,0x7
    80006b84:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006b88:	fce7eee3          	bltu	a5,a4,80006b64 <_ZL11workerBodyBPv+0x20>
    80006b8c:	00170713          	addi	a4,a4,1
    80006b90:	ff1ff06f          	j	80006b80 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006b94:	00a00793          	li	a5,10
    80006b98:	04f90663          	beq	s2,a5,80006be4 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006b9c:	00190913          	addi	s2,s2,1
    80006ba0:	00f00793          	li	a5,15
    80006ba4:	0527e463          	bltu	a5,s2,80006bec <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006ba8:	00003517          	auipc	a0,0x3
    80006bac:	79050513          	addi	a0,a0,1936 # 8000a338 <_ZZ9kPrintIntmE6digits+0x2c8>
    80006bb0:	fffff097          	auipc	ra,0xfffff
    80006bb4:	310080e7          	jalr	784(ra) # 80005ec0 <_Z11printStringPKc>
    80006bb8:	00000613          	li	a2,0
    80006bbc:	00a00593          	li	a1,10
    80006bc0:	0009051b          	sext.w	a0,s2
    80006bc4:	fffff097          	auipc	ra,0xfffff
    80006bc8:	4ac080e7          	jalr	1196(ra) # 80006070 <_Z8printIntiii>
    80006bcc:	00004517          	auipc	a0,0x4
    80006bd0:	9b450513          	addi	a0,a0,-1612 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006bd4:	fffff097          	auipc	ra,0xfffff
    80006bd8:	2ec080e7          	jalr	748(ra) # 80005ec0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006bdc:	00000493          	li	s1,0
    80006be0:	f91ff06f          	j	80006b70 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006be4:	14102ff3          	csrr	t6,sepc
    80006be8:	fb5ff06f          	j	80006b9c <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006bec:	00003517          	auipc	a0,0x3
    80006bf0:	75450513          	addi	a0,a0,1876 # 8000a340 <_ZZ9kPrintIntmE6digits+0x2d0>
    80006bf4:	fffff097          	auipc	ra,0xfffff
    80006bf8:	2cc080e7          	jalr	716(ra) # 80005ec0 <_Z11printStringPKc>
    finishedB = true;
    80006bfc:	00100793          	li	a5,1
    80006c00:	00006717          	auipc	a4,0x6
    80006c04:	10f70223          	sb	a5,260(a4) # 8000cd04 <_ZL9finishedB>
    thread_dispatch();
    80006c08:	ffffb097          	auipc	ra,0xffffb
    80006c0c:	820080e7          	jalr	-2016(ra) # 80001428 <_Z15thread_dispatchv>
}
    80006c10:	01813083          	ld	ra,24(sp)
    80006c14:	01013403          	ld	s0,16(sp)
    80006c18:	00813483          	ld	s1,8(sp)
    80006c1c:	00013903          	ld	s2,0(sp)
    80006c20:	02010113          	addi	sp,sp,32
    80006c24:	00008067          	ret

0000000080006c28 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006c28:	fe010113          	addi	sp,sp,-32
    80006c2c:	00113c23          	sd	ra,24(sp)
    80006c30:	00813823          	sd	s0,16(sp)
    80006c34:	00913423          	sd	s1,8(sp)
    80006c38:	01213023          	sd	s2,0(sp)
    80006c3c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006c40:	00000913          	li	s2,0
    80006c44:	0380006f          	j	80006c7c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006c48:	ffffa097          	auipc	ra,0xffffa
    80006c4c:	7e0080e7          	jalr	2016(ra) # 80001428 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006c50:	00148493          	addi	s1,s1,1
    80006c54:	000027b7          	lui	a5,0x2
    80006c58:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006c5c:	0097ee63          	bltu	a5,s1,80006c78 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006c60:	00000713          	li	a4,0
    80006c64:	000077b7          	lui	a5,0x7
    80006c68:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006c6c:	fce7eee3          	bltu	a5,a4,80006c48 <_ZL11workerBodyAPv+0x20>
    80006c70:	00170713          	addi	a4,a4,1
    80006c74:	ff1ff06f          	j	80006c64 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006c78:	00190913          	addi	s2,s2,1
    80006c7c:	00900793          	li	a5,9
    80006c80:	0527e063          	bltu	a5,s2,80006cc0 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006c84:	00003517          	auipc	a0,0x3
    80006c88:	69c50513          	addi	a0,a0,1692 # 8000a320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80006c8c:	fffff097          	auipc	ra,0xfffff
    80006c90:	234080e7          	jalr	564(ra) # 80005ec0 <_Z11printStringPKc>
    80006c94:	00000613          	li	a2,0
    80006c98:	00a00593          	li	a1,10
    80006c9c:	0009051b          	sext.w	a0,s2
    80006ca0:	fffff097          	auipc	ra,0xfffff
    80006ca4:	3d0080e7          	jalr	976(ra) # 80006070 <_Z8printIntiii>
    80006ca8:	00004517          	auipc	a0,0x4
    80006cac:	8d850513          	addi	a0,a0,-1832 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006cb0:	fffff097          	auipc	ra,0xfffff
    80006cb4:	210080e7          	jalr	528(ra) # 80005ec0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006cb8:	00000493          	li	s1,0
    80006cbc:	f99ff06f          	j	80006c54 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006cc0:	00003517          	auipc	a0,0x3
    80006cc4:	66850513          	addi	a0,a0,1640 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80006cc8:	fffff097          	auipc	ra,0xfffff
    80006ccc:	1f8080e7          	jalr	504(ra) # 80005ec0 <_Z11printStringPKc>
    finishedA = true;
    80006cd0:	00100793          	li	a5,1
    80006cd4:	00006717          	auipc	a4,0x6
    80006cd8:	02f708a3          	sb	a5,49(a4) # 8000cd05 <_ZL9finishedA>
}
    80006cdc:	01813083          	ld	ra,24(sp)
    80006ce0:	01013403          	ld	s0,16(sp)
    80006ce4:	00813483          	ld	s1,8(sp)
    80006ce8:	00013903          	ld	s2,0(sp)
    80006cec:	02010113          	addi	sp,sp,32
    80006cf0:	00008067          	ret

0000000080006cf4 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006cf4:	fd010113          	addi	sp,sp,-48
    80006cf8:	02113423          	sd	ra,40(sp)
    80006cfc:	02813023          	sd	s0,32(sp)
    80006d00:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006d04:	00000613          	li	a2,0
    80006d08:	00000597          	auipc	a1,0x0
    80006d0c:	f2058593          	addi	a1,a1,-224 # 80006c28 <_ZL11workerBodyAPv>
    80006d10:	fd040513          	addi	a0,s0,-48
    80006d14:	ffffa097          	auipc	ra,0xffffa
    80006d18:	66c080e7          	jalr	1644(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006d1c:	00003517          	auipc	a0,0x3
    80006d20:	6ac50513          	addi	a0,a0,1708 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80006d24:	fffff097          	auipc	ra,0xfffff
    80006d28:	19c080e7          	jalr	412(ra) # 80005ec0 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006d2c:	00000613          	li	a2,0
    80006d30:	00000597          	auipc	a1,0x0
    80006d34:	e1458593          	addi	a1,a1,-492 # 80006b44 <_ZL11workerBodyBPv>
    80006d38:	fd840513          	addi	a0,s0,-40
    80006d3c:	ffffa097          	auipc	ra,0xffffa
    80006d40:	644080e7          	jalr	1604(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006d44:	00003517          	auipc	a0,0x3
    80006d48:	69c50513          	addi	a0,a0,1692 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80006d4c:	fffff097          	auipc	ra,0xfffff
    80006d50:	174080e7          	jalr	372(ra) # 80005ec0 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006d54:	00000613          	li	a2,0
    80006d58:	00000597          	auipc	a1,0x0
    80006d5c:	c6c58593          	addi	a1,a1,-916 # 800069c4 <_ZL11workerBodyCPv>
    80006d60:	fe040513          	addi	a0,s0,-32
    80006d64:	ffffa097          	auipc	ra,0xffffa
    80006d68:	61c080e7          	jalr	1564(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006d6c:	00003517          	auipc	a0,0x3
    80006d70:	68c50513          	addi	a0,a0,1676 # 8000a3f8 <_ZZ9kPrintIntmE6digits+0x388>
    80006d74:	fffff097          	auipc	ra,0xfffff
    80006d78:	14c080e7          	jalr	332(ra) # 80005ec0 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006d7c:	00000613          	li	a2,0
    80006d80:	00000597          	auipc	a1,0x0
    80006d84:	afc58593          	addi	a1,a1,-1284 # 8000687c <_ZL11workerBodyDPv>
    80006d88:	fe840513          	addi	a0,s0,-24
    80006d8c:	ffffa097          	auipc	ra,0xffffa
    80006d90:	5f4080e7          	jalr	1524(ra) # 80001380 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006d94:	00003517          	auipc	a0,0x3
    80006d98:	67c50513          	addi	a0,a0,1660 # 8000a410 <_ZZ9kPrintIntmE6digits+0x3a0>
    80006d9c:	fffff097          	auipc	ra,0xfffff
    80006da0:	124080e7          	jalr	292(ra) # 80005ec0 <_Z11printStringPKc>
    80006da4:	00c0006f          	j	80006db0 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006da8:	ffffa097          	auipc	ra,0xffffa
    80006dac:	680080e7          	jalr	1664(ra) # 80001428 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006db0:	00006797          	auipc	a5,0x6
    80006db4:	f557c783          	lbu	a5,-171(a5) # 8000cd05 <_ZL9finishedA>
    80006db8:	fe0788e3          	beqz	a5,80006da8 <_Z16System_Mode_testv+0xb4>
    80006dbc:	00006797          	auipc	a5,0x6
    80006dc0:	f487c783          	lbu	a5,-184(a5) # 8000cd04 <_ZL9finishedB>
    80006dc4:	fe0782e3          	beqz	a5,80006da8 <_Z16System_Mode_testv+0xb4>
    80006dc8:	00006797          	auipc	a5,0x6
    80006dcc:	f3b7c783          	lbu	a5,-197(a5) # 8000cd03 <_ZL9finishedC>
    80006dd0:	fc078ce3          	beqz	a5,80006da8 <_Z16System_Mode_testv+0xb4>
    80006dd4:	00006797          	auipc	a5,0x6
    80006dd8:	f2e7c783          	lbu	a5,-210(a5) # 8000cd02 <_ZL9finishedD>
    80006ddc:	fc0786e3          	beqz	a5,80006da8 <_Z16System_Mode_testv+0xb4>
    }

}
    80006de0:	02813083          	ld	ra,40(sp)
    80006de4:	02013403          	ld	s0,32(sp)
    80006de8:	03010113          	addi	sp,sp,48
    80006dec:	00008067          	ret

0000000080006df0 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006df0:	fe010113          	addi	sp,sp,-32
    80006df4:	00113c23          	sd	ra,24(sp)
    80006df8:	00813823          	sd	s0,16(sp)
    80006dfc:	00913423          	sd	s1,8(sp)
    80006e00:	01213023          	sd	s2,0(sp)
    80006e04:	02010413          	addi	s0,sp,32
    80006e08:	00050493          	mv	s1,a0
    80006e0c:	00058913          	mv	s2,a1
    80006e10:	0015879b          	addiw	a5,a1,1
    80006e14:	0007851b          	sext.w	a0,a5
    80006e18:	00f4a023          	sw	a5,0(s1)
    80006e1c:	0004a823          	sw	zero,16(s1)
    80006e20:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006e24:	00251513          	slli	a0,a0,0x2
    80006e28:	ffffa097          	auipc	ra,0xffffa
    80006e2c:	4e8080e7          	jalr	1256(ra) # 80001310 <_Z9mem_allocm>
    80006e30:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006e34:	00000593          	li	a1,0
    80006e38:	02048513          	addi	a0,s1,32
    80006e3c:	ffffa097          	auipc	ra,0xffffa
    80006e40:	664080e7          	jalr	1636(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006e44:	00090593          	mv	a1,s2
    80006e48:	01848513          	addi	a0,s1,24
    80006e4c:	ffffa097          	auipc	ra,0xffffa
    80006e50:	654080e7          	jalr	1620(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006e54:	00100593          	li	a1,1
    80006e58:	02848513          	addi	a0,s1,40
    80006e5c:	ffffa097          	auipc	ra,0xffffa
    80006e60:	644080e7          	jalr	1604(ra) # 800014a0 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006e64:	00100593          	li	a1,1
    80006e68:	03048513          	addi	a0,s1,48
    80006e6c:	ffffa097          	auipc	ra,0xffffa
    80006e70:	634080e7          	jalr	1588(ra) # 800014a0 <_Z8sem_openPP4KSemj>
}
    80006e74:	01813083          	ld	ra,24(sp)
    80006e78:	01013403          	ld	s0,16(sp)
    80006e7c:	00813483          	ld	s1,8(sp)
    80006e80:	00013903          	ld	s2,0(sp)
    80006e84:	02010113          	addi	sp,sp,32
    80006e88:	00008067          	ret

0000000080006e8c <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006e8c:	fe010113          	addi	sp,sp,-32
    80006e90:	00113c23          	sd	ra,24(sp)
    80006e94:	00813823          	sd	s0,16(sp)
    80006e98:	00913423          	sd	s1,8(sp)
    80006e9c:	01213023          	sd	s2,0(sp)
    80006ea0:	02010413          	addi	s0,sp,32
    80006ea4:	00050493          	mv	s1,a0
    80006ea8:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006eac:	01853503          	ld	a0,24(a0)
    80006eb0:	ffffa097          	auipc	ra,0xffffa
    80006eb4:	658080e7          	jalr	1624(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006eb8:	0304b503          	ld	a0,48(s1)
    80006ebc:	ffffa097          	auipc	ra,0xffffa
    80006ec0:	64c080e7          	jalr	1612(ra) # 80001508 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006ec4:	0084b783          	ld	a5,8(s1)
    80006ec8:	0144a703          	lw	a4,20(s1)
    80006ecc:	00271713          	slli	a4,a4,0x2
    80006ed0:	00e787b3          	add	a5,a5,a4
    80006ed4:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006ed8:	0144a783          	lw	a5,20(s1)
    80006edc:	0017879b          	addiw	a5,a5,1
    80006ee0:	0004a703          	lw	a4,0(s1)
    80006ee4:	02e7e7bb          	remw	a5,a5,a4
    80006ee8:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006eec:	0304b503          	ld	a0,48(s1)
    80006ef0:	ffffa097          	auipc	ra,0xffffa
    80006ef4:	648080e7          	jalr	1608(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006ef8:	0204b503          	ld	a0,32(s1)
    80006efc:	ffffa097          	auipc	ra,0xffffa
    80006f00:	63c080e7          	jalr	1596(ra) # 80001538 <_Z10sem_signalP4KSem>

}
    80006f04:	01813083          	ld	ra,24(sp)
    80006f08:	01013403          	ld	s0,16(sp)
    80006f0c:	00813483          	ld	s1,8(sp)
    80006f10:	00013903          	ld	s2,0(sp)
    80006f14:	02010113          	addi	sp,sp,32
    80006f18:	00008067          	ret

0000000080006f1c <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006f1c:	fe010113          	addi	sp,sp,-32
    80006f20:	00113c23          	sd	ra,24(sp)
    80006f24:	00813823          	sd	s0,16(sp)
    80006f28:	00913423          	sd	s1,8(sp)
    80006f2c:	01213023          	sd	s2,0(sp)
    80006f30:	02010413          	addi	s0,sp,32
    80006f34:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006f38:	02053503          	ld	a0,32(a0)
    80006f3c:	ffffa097          	auipc	ra,0xffffa
    80006f40:	5cc080e7          	jalr	1484(ra) # 80001508 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006f44:	0284b503          	ld	a0,40(s1)
    80006f48:	ffffa097          	auipc	ra,0xffffa
    80006f4c:	5c0080e7          	jalr	1472(ra) # 80001508 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006f50:	0084b703          	ld	a4,8(s1)
    80006f54:	0104a783          	lw	a5,16(s1)
    80006f58:	00279693          	slli	a3,a5,0x2
    80006f5c:	00d70733          	add	a4,a4,a3
    80006f60:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006f64:	0017879b          	addiw	a5,a5,1
    80006f68:	0004a703          	lw	a4,0(s1)
    80006f6c:	02e7e7bb          	remw	a5,a5,a4
    80006f70:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006f74:	0284b503          	ld	a0,40(s1)
    80006f78:	ffffa097          	auipc	ra,0xffffa
    80006f7c:	5c0080e7          	jalr	1472(ra) # 80001538 <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006f80:	0184b503          	ld	a0,24(s1)
    80006f84:	ffffa097          	auipc	ra,0xffffa
    80006f88:	5b4080e7          	jalr	1460(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80006f8c:	00090513          	mv	a0,s2
    80006f90:	01813083          	ld	ra,24(sp)
    80006f94:	01013403          	ld	s0,16(sp)
    80006f98:	00813483          	ld	s1,8(sp)
    80006f9c:	00013903          	ld	s2,0(sp)
    80006fa0:	02010113          	addi	sp,sp,32
    80006fa4:	00008067          	ret

0000000080006fa8 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006fa8:	fe010113          	addi	sp,sp,-32
    80006fac:	00113c23          	sd	ra,24(sp)
    80006fb0:	00813823          	sd	s0,16(sp)
    80006fb4:	00913423          	sd	s1,8(sp)
    80006fb8:	01213023          	sd	s2,0(sp)
    80006fbc:	02010413          	addi	s0,sp,32
    80006fc0:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006fc4:	02853503          	ld	a0,40(a0)
    80006fc8:	ffffa097          	auipc	ra,0xffffa
    80006fcc:	540080e7          	jalr	1344(ra) # 80001508 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006fd0:	0304b503          	ld	a0,48(s1)
    80006fd4:	ffffa097          	auipc	ra,0xffffa
    80006fd8:	534080e7          	jalr	1332(ra) # 80001508 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006fdc:	0144a783          	lw	a5,20(s1)
    80006fe0:	0104a903          	lw	s2,16(s1)
    80006fe4:	0327ce63          	blt	a5,s2,80007020 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006fe8:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006fec:	0304b503          	ld	a0,48(s1)
    80006ff0:	ffffa097          	auipc	ra,0xffffa
    80006ff4:	548080e7          	jalr	1352(ra) # 80001538 <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006ff8:	0284b503          	ld	a0,40(s1)
    80006ffc:	ffffa097          	auipc	ra,0xffffa
    80007000:	53c080e7          	jalr	1340(ra) # 80001538 <_Z10sem_signalP4KSem>

    return ret;
}
    80007004:	00090513          	mv	a0,s2
    80007008:	01813083          	ld	ra,24(sp)
    8000700c:	01013403          	ld	s0,16(sp)
    80007010:	00813483          	ld	s1,8(sp)
    80007014:	00013903          	ld	s2,0(sp)
    80007018:	02010113          	addi	sp,sp,32
    8000701c:	00008067          	ret
        ret = cap - head + tail;
    80007020:	0004a703          	lw	a4,0(s1)
    80007024:	4127093b          	subw	s2,a4,s2
    80007028:	00f9093b          	addw	s2,s2,a5
    8000702c:	fc1ff06f          	j	80006fec <_ZN6Buffer6getCntEv+0x44>

0000000080007030 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80007030:	fe010113          	addi	sp,sp,-32
    80007034:	00113c23          	sd	ra,24(sp)
    80007038:	00813823          	sd	s0,16(sp)
    8000703c:	00913423          	sd	s1,8(sp)
    80007040:	02010413          	addi	s0,sp,32
    80007044:	00050493          	mv	s1,a0
    putc('\n');
    80007048:	00a00513          	li	a0,10
    8000704c:	ffffa097          	auipc	ra,0xffffa
    80007050:	544080e7          	jalr	1348(ra) # 80001590 <_Z4putcc>
    printString("Buffer deleted!\n");
    80007054:	00003517          	auipc	a0,0x3
    80007058:	3d450513          	addi	a0,a0,980 # 8000a428 <_ZZ9kPrintIntmE6digits+0x3b8>
    8000705c:	fffff097          	auipc	ra,0xfffff
    80007060:	e64080e7          	jalr	-412(ra) # 80005ec0 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80007064:	00048513          	mv	a0,s1
    80007068:	00000097          	auipc	ra,0x0
    8000706c:	f40080e7          	jalr	-192(ra) # 80006fa8 <_ZN6Buffer6getCntEv>
    80007070:	02a05c63          	blez	a0,800070a8 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80007074:	0084b783          	ld	a5,8(s1)
    80007078:	0104a703          	lw	a4,16(s1)
    8000707c:	00271713          	slli	a4,a4,0x2
    80007080:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80007084:	0007c503          	lbu	a0,0(a5)
    80007088:	ffffa097          	auipc	ra,0xffffa
    8000708c:	508080e7          	jalr	1288(ra) # 80001590 <_Z4putcc>
        head = (head + 1) % cap;
    80007090:	0104a783          	lw	a5,16(s1)
    80007094:	0017879b          	addiw	a5,a5,1
    80007098:	0004a703          	lw	a4,0(s1)
    8000709c:	02e7e7bb          	remw	a5,a5,a4
    800070a0:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800070a4:	fc1ff06f          	j	80007064 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800070a8:	02100513          	li	a0,33
    800070ac:	ffffa097          	auipc	ra,0xffffa
    800070b0:	4e4080e7          	jalr	1252(ra) # 80001590 <_Z4putcc>
    putc('\n');
    800070b4:	00a00513          	li	a0,10
    800070b8:	ffffa097          	auipc	ra,0xffffa
    800070bc:	4d8080e7          	jalr	1240(ra) # 80001590 <_Z4putcc>
    mem_free(buffer);
    800070c0:	0084b503          	ld	a0,8(s1)
    800070c4:	ffffa097          	auipc	ra,0xffffa
    800070c8:	28c080e7          	jalr	652(ra) # 80001350 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800070cc:	0204b503          	ld	a0,32(s1)
    800070d0:	ffffa097          	auipc	ra,0xffffa
    800070d4:	408080e7          	jalr	1032(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    800070d8:	0184b503          	ld	a0,24(s1)
    800070dc:	ffffa097          	auipc	ra,0xffffa
    800070e0:	3fc080e7          	jalr	1020(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    800070e4:	0304b503          	ld	a0,48(s1)
    800070e8:	ffffa097          	auipc	ra,0xffffa
    800070ec:	3f0080e7          	jalr	1008(ra) # 800014d8 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    800070f0:	0284b503          	ld	a0,40(s1)
    800070f4:	ffffa097          	auipc	ra,0xffffa
    800070f8:	3e4080e7          	jalr	996(ra) # 800014d8 <_Z9sem_closeP4KSem>
}
    800070fc:	01813083          	ld	ra,24(sp)
    80007100:	01013403          	ld	s0,16(sp)
    80007104:	00813483          	ld	s1,8(sp)
    80007108:	02010113          	addi	sp,sp,32
    8000710c:	00008067          	ret

0000000080007110 <start>:
    80007110:	ff010113          	addi	sp,sp,-16
    80007114:	00813423          	sd	s0,8(sp)
    80007118:	01010413          	addi	s0,sp,16
    8000711c:	300027f3          	csrr	a5,mstatus
    80007120:	ffffe737          	lui	a4,0xffffe
    80007124:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff088f>
    80007128:	00e7f7b3          	and	a5,a5,a4
    8000712c:	00001737          	lui	a4,0x1
    80007130:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80007134:	00e7e7b3          	or	a5,a5,a4
    80007138:	30079073          	csrw	mstatus,a5
    8000713c:	00000797          	auipc	a5,0x0
    80007140:	16078793          	addi	a5,a5,352 # 8000729c <system_main>
    80007144:	34179073          	csrw	mepc,a5
    80007148:	00000793          	li	a5,0
    8000714c:	18079073          	csrw	satp,a5
    80007150:	000107b7          	lui	a5,0x10
    80007154:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007158:	30279073          	csrw	medeleg,a5
    8000715c:	30379073          	csrw	mideleg,a5
    80007160:	104027f3          	csrr	a5,sie
    80007164:	2227e793          	ori	a5,a5,546
    80007168:	10479073          	csrw	sie,a5
    8000716c:	fff00793          	li	a5,-1
    80007170:	00a7d793          	srli	a5,a5,0xa
    80007174:	3b079073          	csrw	pmpaddr0,a5
    80007178:	00f00793          	li	a5,15
    8000717c:	3a079073          	csrw	pmpcfg0,a5
    80007180:	f14027f3          	csrr	a5,mhartid
    80007184:	0200c737          	lui	a4,0x200c
    80007188:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000718c:	0007869b          	sext.w	a3,a5
    80007190:	00269713          	slli	a4,a3,0x2
    80007194:	000f4637          	lui	a2,0xf4
    80007198:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000719c:	00d70733          	add	a4,a4,a3
    800071a0:	0037979b          	slliw	a5,a5,0x3
    800071a4:	020046b7          	lui	a3,0x2004
    800071a8:	00d787b3          	add	a5,a5,a3
    800071ac:	00c585b3          	add	a1,a1,a2
    800071b0:	00371693          	slli	a3,a4,0x3
    800071b4:	00006717          	auipc	a4,0x6
    800071b8:	b5c70713          	addi	a4,a4,-1188 # 8000cd10 <timer_scratch>
    800071bc:	00b7b023          	sd	a1,0(a5)
    800071c0:	00d70733          	add	a4,a4,a3
    800071c4:	00f73c23          	sd	a5,24(a4)
    800071c8:	02c73023          	sd	a2,32(a4)
    800071cc:	34071073          	csrw	mscratch,a4
    800071d0:	00000797          	auipc	a5,0x0
    800071d4:	6e078793          	addi	a5,a5,1760 # 800078b0 <timervec>
    800071d8:	30579073          	csrw	mtvec,a5
    800071dc:	300027f3          	csrr	a5,mstatus
    800071e0:	0087e793          	ori	a5,a5,8
    800071e4:	30079073          	csrw	mstatus,a5
    800071e8:	304027f3          	csrr	a5,mie
    800071ec:	0807e793          	ori	a5,a5,128
    800071f0:	30479073          	csrw	mie,a5
    800071f4:	f14027f3          	csrr	a5,mhartid
    800071f8:	0007879b          	sext.w	a5,a5
    800071fc:	00078213          	mv	tp,a5
    80007200:	30200073          	mret
    80007204:	00813403          	ld	s0,8(sp)
    80007208:	01010113          	addi	sp,sp,16
    8000720c:	00008067          	ret

0000000080007210 <timerinit>:
    80007210:	ff010113          	addi	sp,sp,-16
    80007214:	00813423          	sd	s0,8(sp)
    80007218:	01010413          	addi	s0,sp,16
    8000721c:	f14027f3          	csrr	a5,mhartid
    80007220:	0200c737          	lui	a4,0x200c
    80007224:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007228:	0007869b          	sext.w	a3,a5
    8000722c:	00269713          	slli	a4,a3,0x2
    80007230:	000f4637          	lui	a2,0xf4
    80007234:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007238:	00d70733          	add	a4,a4,a3
    8000723c:	0037979b          	slliw	a5,a5,0x3
    80007240:	020046b7          	lui	a3,0x2004
    80007244:	00d787b3          	add	a5,a5,a3
    80007248:	00c585b3          	add	a1,a1,a2
    8000724c:	00371693          	slli	a3,a4,0x3
    80007250:	00006717          	auipc	a4,0x6
    80007254:	ac070713          	addi	a4,a4,-1344 # 8000cd10 <timer_scratch>
    80007258:	00b7b023          	sd	a1,0(a5)
    8000725c:	00d70733          	add	a4,a4,a3
    80007260:	00f73c23          	sd	a5,24(a4)
    80007264:	02c73023          	sd	a2,32(a4)
    80007268:	34071073          	csrw	mscratch,a4
    8000726c:	00000797          	auipc	a5,0x0
    80007270:	64478793          	addi	a5,a5,1604 # 800078b0 <timervec>
    80007274:	30579073          	csrw	mtvec,a5
    80007278:	300027f3          	csrr	a5,mstatus
    8000727c:	0087e793          	ori	a5,a5,8
    80007280:	30079073          	csrw	mstatus,a5
    80007284:	304027f3          	csrr	a5,mie
    80007288:	0807e793          	ori	a5,a5,128
    8000728c:	30479073          	csrw	mie,a5
    80007290:	00813403          	ld	s0,8(sp)
    80007294:	01010113          	addi	sp,sp,16
    80007298:	00008067          	ret

000000008000729c <system_main>:
    8000729c:	fe010113          	addi	sp,sp,-32
    800072a0:	00813823          	sd	s0,16(sp)
    800072a4:	00913423          	sd	s1,8(sp)
    800072a8:	00113c23          	sd	ra,24(sp)
    800072ac:	02010413          	addi	s0,sp,32
    800072b0:	00000097          	auipc	ra,0x0
    800072b4:	0c4080e7          	jalr	196(ra) # 80007374 <cpuid>
    800072b8:	00006497          	auipc	s1,0x6
    800072bc:	89848493          	addi	s1,s1,-1896 # 8000cb50 <started>
    800072c0:	02050263          	beqz	a0,800072e4 <system_main+0x48>
    800072c4:	0004a783          	lw	a5,0(s1)
    800072c8:	0007879b          	sext.w	a5,a5
    800072cc:	fe078ce3          	beqz	a5,800072c4 <system_main+0x28>
    800072d0:	0ff0000f          	fence
    800072d4:	00003517          	auipc	a0,0x3
    800072d8:	42450513          	addi	a0,a0,1060 # 8000a6f8 <_ZZ9kPrintIntmE6digits+0x688>
    800072dc:	00001097          	auipc	ra,0x1
    800072e0:	a70080e7          	jalr	-1424(ra) # 80007d4c <panic>
    800072e4:	00001097          	auipc	ra,0x1
    800072e8:	9c4080e7          	jalr	-1596(ra) # 80007ca8 <consoleinit>
    800072ec:	00001097          	auipc	ra,0x1
    800072f0:	150080e7          	jalr	336(ra) # 8000843c <printfinit>
    800072f4:	00003517          	auipc	a0,0x3
    800072f8:	28c50513          	addi	a0,a0,652 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800072fc:	00001097          	auipc	ra,0x1
    80007300:	aac080e7          	jalr	-1364(ra) # 80007da8 <__printf>
    80007304:	00003517          	auipc	a0,0x3
    80007308:	3c450513          	addi	a0,a0,964 # 8000a6c8 <_ZZ9kPrintIntmE6digits+0x658>
    8000730c:	00001097          	auipc	ra,0x1
    80007310:	a9c080e7          	jalr	-1380(ra) # 80007da8 <__printf>
    80007314:	00003517          	auipc	a0,0x3
    80007318:	26c50513          	addi	a0,a0,620 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    8000731c:	00001097          	auipc	ra,0x1
    80007320:	a8c080e7          	jalr	-1396(ra) # 80007da8 <__printf>
    80007324:	00001097          	auipc	ra,0x1
    80007328:	4a4080e7          	jalr	1188(ra) # 800087c8 <kinit>
    8000732c:	00000097          	auipc	ra,0x0
    80007330:	148080e7          	jalr	328(ra) # 80007474 <trapinit>
    80007334:	00000097          	auipc	ra,0x0
    80007338:	16c080e7          	jalr	364(ra) # 800074a0 <trapinithart>
    8000733c:	00000097          	auipc	ra,0x0
    80007340:	5b4080e7          	jalr	1460(ra) # 800078f0 <plicinit>
    80007344:	00000097          	auipc	ra,0x0
    80007348:	5d4080e7          	jalr	1492(ra) # 80007918 <plicinithart>
    8000734c:	00000097          	auipc	ra,0x0
    80007350:	078080e7          	jalr	120(ra) # 800073c4 <userinit>
    80007354:	0ff0000f          	fence
    80007358:	00100793          	li	a5,1
    8000735c:	00003517          	auipc	a0,0x3
    80007360:	38450513          	addi	a0,a0,900 # 8000a6e0 <_ZZ9kPrintIntmE6digits+0x670>
    80007364:	00f4a023          	sw	a5,0(s1)
    80007368:	00001097          	auipc	ra,0x1
    8000736c:	a40080e7          	jalr	-1472(ra) # 80007da8 <__printf>
    80007370:	0000006f          	j	80007370 <system_main+0xd4>

0000000080007374 <cpuid>:
    80007374:	ff010113          	addi	sp,sp,-16
    80007378:	00813423          	sd	s0,8(sp)
    8000737c:	01010413          	addi	s0,sp,16
    80007380:	00020513          	mv	a0,tp
    80007384:	00813403          	ld	s0,8(sp)
    80007388:	0005051b          	sext.w	a0,a0
    8000738c:	01010113          	addi	sp,sp,16
    80007390:	00008067          	ret

0000000080007394 <mycpu>:
    80007394:	ff010113          	addi	sp,sp,-16
    80007398:	00813423          	sd	s0,8(sp)
    8000739c:	01010413          	addi	s0,sp,16
    800073a0:	00020793          	mv	a5,tp
    800073a4:	00813403          	ld	s0,8(sp)
    800073a8:	0007879b          	sext.w	a5,a5
    800073ac:	00779793          	slli	a5,a5,0x7
    800073b0:	00007517          	auipc	a0,0x7
    800073b4:	99050513          	addi	a0,a0,-1648 # 8000dd40 <cpus>
    800073b8:	00f50533          	add	a0,a0,a5
    800073bc:	01010113          	addi	sp,sp,16
    800073c0:	00008067          	ret

00000000800073c4 <userinit>:
    800073c4:	ff010113          	addi	sp,sp,-16
    800073c8:	00813423          	sd	s0,8(sp)
    800073cc:	01010413          	addi	s0,sp,16
    800073d0:	00813403          	ld	s0,8(sp)
    800073d4:	01010113          	addi	sp,sp,16
    800073d8:	ffffb317          	auipc	t1,0xffffb
    800073dc:	bac30067          	jr	-1108(t1) # 80001f84 <main>

00000000800073e0 <either_copyout>:
    800073e0:	ff010113          	addi	sp,sp,-16
    800073e4:	00813023          	sd	s0,0(sp)
    800073e8:	00113423          	sd	ra,8(sp)
    800073ec:	01010413          	addi	s0,sp,16
    800073f0:	02051663          	bnez	a0,8000741c <either_copyout+0x3c>
    800073f4:	00058513          	mv	a0,a1
    800073f8:	00060593          	mv	a1,a2
    800073fc:	0006861b          	sext.w	a2,a3
    80007400:	00002097          	auipc	ra,0x2
    80007404:	c54080e7          	jalr	-940(ra) # 80009054 <__memmove>
    80007408:	00813083          	ld	ra,8(sp)
    8000740c:	00013403          	ld	s0,0(sp)
    80007410:	00000513          	li	a0,0
    80007414:	01010113          	addi	sp,sp,16
    80007418:	00008067          	ret
    8000741c:	00003517          	auipc	a0,0x3
    80007420:	30450513          	addi	a0,a0,772 # 8000a720 <_ZZ9kPrintIntmE6digits+0x6b0>
    80007424:	00001097          	auipc	ra,0x1
    80007428:	928080e7          	jalr	-1752(ra) # 80007d4c <panic>

000000008000742c <either_copyin>:
    8000742c:	ff010113          	addi	sp,sp,-16
    80007430:	00813023          	sd	s0,0(sp)
    80007434:	00113423          	sd	ra,8(sp)
    80007438:	01010413          	addi	s0,sp,16
    8000743c:	02059463          	bnez	a1,80007464 <either_copyin+0x38>
    80007440:	00060593          	mv	a1,a2
    80007444:	0006861b          	sext.w	a2,a3
    80007448:	00002097          	auipc	ra,0x2
    8000744c:	c0c080e7          	jalr	-1012(ra) # 80009054 <__memmove>
    80007450:	00813083          	ld	ra,8(sp)
    80007454:	00013403          	ld	s0,0(sp)
    80007458:	00000513          	li	a0,0
    8000745c:	01010113          	addi	sp,sp,16
    80007460:	00008067          	ret
    80007464:	00003517          	auipc	a0,0x3
    80007468:	2e450513          	addi	a0,a0,740 # 8000a748 <_ZZ9kPrintIntmE6digits+0x6d8>
    8000746c:	00001097          	auipc	ra,0x1
    80007470:	8e0080e7          	jalr	-1824(ra) # 80007d4c <panic>

0000000080007474 <trapinit>:
    80007474:	ff010113          	addi	sp,sp,-16
    80007478:	00813423          	sd	s0,8(sp)
    8000747c:	01010413          	addi	s0,sp,16
    80007480:	00813403          	ld	s0,8(sp)
    80007484:	00003597          	auipc	a1,0x3
    80007488:	2ec58593          	addi	a1,a1,748 # 8000a770 <_ZZ9kPrintIntmE6digits+0x700>
    8000748c:	00007517          	auipc	a0,0x7
    80007490:	93450513          	addi	a0,a0,-1740 # 8000ddc0 <tickslock>
    80007494:	01010113          	addi	sp,sp,16
    80007498:	00001317          	auipc	t1,0x1
    8000749c:	5c030067          	jr	1472(t1) # 80008a58 <initlock>

00000000800074a0 <trapinithart>:
    800074a0:	ff010113          	addi	sp,sp,-16
    800074a4:	00813423          	sd	s0,8(sp)
    800074a8:	01010413          	addi	s0,sp,16
    800074ac:	00000797          	auipc	a5,0x0
    800074b0:	2f478793          	addi	a5,a5,756 # 800077a0 <kernelvec>
    800074b4:	10579073          	csrw	stvec,a5
    800074b8:	00813403          	ld	s0,8(sp)
    800074bc:	01010113          	addi	sp,sp,16
    800074c0:	00008067          	ret

00000000800074c4 <usertrap>:
    800074c4:	ff010113          	addi	sp,sp,-16
    800074c8:	00813423          	sd	s0,8(sp)
    800074cc:	01010413          	addi	s0,sp,16
    800074d0:	00813403          	ld	s0,8(sp)
    800074d4:	01010113          	addi	sp,sp,16
    800074d8:	00008067          	ret

00000000800074dc <usertrapret>:
    800074dc:	ff010113          	addi	sp,sp,-16
    800074e0:	00813423          	sd	s0,8(sp)
    800074e4:	01010413          	addi	s0,sp,16
    800074e8:	00813403          	ld	s0,8(sp)
    800074ec:	01010113          	addi	sp,sp,16
    800074f0:	00008067          	ret

00000000800074f4 <kerneltrap>:
    800074f4:	fe010113          	addi	sp,sp,-32
    800074f8:	00813823          	sd	s0,16(sp)
    800074fc:	00113c23          	sd	ra,24(sp)
    80007500:	00913423          	sd	s1,8(sp)
    80007504:	02010413          	addi	s0,sp,32
    80007508:	142025f3          	csrr	a1,scause
    8000750c:	100027f3          	csrr	a5,sstatus
    80007510:	0027f793          	andi	a5,a5,2
    80007514:	10079c63          	bnez	a5,8000762c <kerneltrap+0x138>
    80007518:	142027f3          	csrr	a5,scause
    8000751c:	0207ce63          	bltz	a5,80007558 <kerneltrap+0x64>
    80007520:	00003517          	auipc	a0,0x3
    80007524:	29850513          	addi	a0,a0,664 # 8000a7b8 <_ZZ9kPrintIntmE6digits+0x748>
    80007528:	00001097          	auipc	ra,0x1
    8000752c:	880080e7          	jalr	-1920(ra) # 80007da8 <__printf>
    80007530:	141025f3          	csrr	a1,sepc
    80007534:	14302673          	csrr	a2,stval
    80007538:	00003517          	auipc	a0,0x3
    8000753c:	29050513          	addi	a0,a0,656 # 8000a7c8 <_ZZ9kPrintIntmE6digits+0x758>
    80007540:	00001097          	auipc	ra,0x1
    80007544:	868080e7          	jalr	-1944(ra) # 80007da8 <__printf>
    80007548:	00003517          	auipc	a0,0x3
    8000754c:	29850513          	addi	a0,a0,664 # 8000a7e0 <_ZZ9kPrintIntmE6digits+0x770>
    80007550:	00000097          	auipc	ra,0x0
    80007554:	7fc080e7          	jalr	2044(ra) # 80007d4c <panic>
    80007558:	0ff7f713          	andi	a4,a5,255
    8000755c:	00900693          	li	a3,9
    80007560:	04d70063          	beq	a4,a3,800075a0 <kerneltrap+0xac>
    80007564:	fff00713          	li	a4,-1
    80007568:	03f71713          	slli	a4,a4,0x3f
    8000756c:	00170713          	addi	a4,a4,1
    80007570:	fae798e3          	bne	a5,a4,80007520 <kerneltrap+0x2c>
    80007574:	00000097          	auipc	ra,0x0
    80007578:	e00080e7          	jalr	-512(ra) # 80007374 <cpuid>
    8000757c:	06050663          	beqz	a0,800075e8 <kerneltrap+0xf4>
    80007580:	144027f3          	csrr	a5,sip
    80007584:	ffd7f793          	andi	a5,a5,-3
    80007588:	14479073          	csrw	sip,a5
    8000758c:	01813083          	ld	ra,24(sp)
    80007590:	01013403          	ld	s0,16(sp)
    80007594:	00813483          	ld	s1,8(sp)
    80007598:	02010113          	addi	sp,sp,32
    8000759c:	00008067          	ret
    800075a0:	00000097          	auipc	ra,0x0
    800075a4:	3c4080e7          	jalr	964(ra) # 80007964 <plic_claim>
    800075a8:	00a00793          	li	a5,10
    800075ac:	00050493          	mv	s1,a0
    800075b0:	06f50863          	beq	a0,a5,80007620 <kerneltrap+0x12c>
    800075b4:	fc050ce3          	beqz	a0,8000758c <kerneltrap+0x98>
    800075b8:	00050593          	mv	a1,a0
    800075bc:	00003517          	auipc	a0,0x3
    800075c0:	1dc50513          	addi	a0,a0,476 # 8000a798 <_ZZ9kPrintIntmE6digits+0x728>
    800075c4:	00000097          	auipc	ra,0x0
    800075c8:	7e4080e7          	jalr	2020(ra) # 80007da8 <__printf>
    800075cc:	01013403          	ld	s0,16(sp)
    800075d0:	01813083          	ld	ra,24(sp)
    800075d4:	00048513          	mv	a0,s1
    800075d8:	00813483          	ld	s1,8(sp)
    800075dc:	02010113          	addi	sp,sp,32
    800075e0:	00000317          	auipc	t1,0x0
    800075e4:	3bc30067          	jr	956(t1) # 8000799c <plic_complete>
    800075e8:	00006517          	auipc	a0,0x6
    800075ec:	7d850513          	addi	a0,a0,2008 # 8000ddc0 <tickslock>
    800075f0:	00001097          	auipc	ra,0x1
    800075f4:	48c080e7          	jalr	1164(ra) # 80008a7c <acquire>
    800075f8:	00005717          	auipc	a4,0x5
    800075fc:	55c70713          	addi	a4,a4,1372 # 8000cb54 <ticks>
    80007600:	00072783          	lw	a5,0(a4)
    80007604:	00006517          	auipc	a0,0x6
    80007608:	7bc50513          	addi	a0,a0,1980 # 8000ddc0 <tickslock>
    8000760c:	0017879b          	addiw	a5,a5,1
    80007610:	00f72023          	sw	a5,0(a4)
    80007614:	00001097          	auipc	ra,0x1
    80007618:	534080e7          	jalr	1332(ra) # 80008b48 <release>
    8000761c:	f65ff06f          	j	80007580 <kerneltrap+0x8c>
    80007620:	00001097          	auipc	ra,0x1
    80007624:	090080e7          	jalr	144(ra) # 800086b0 <uartintr>
    80007628:	fa5ff06f          	j	800075cc <kerneltrap+0xd8>
    8000762c:	00003517          	auipc	a0,0x3
    80007630:	14c50513          	addi	a0,a0,332 # 8000a778 <_ZZ9kPrintIntmE6digits+0x708>
    80007634:	00000097          	auipc	ra,0x0
    80007638:	718080e7          	jalr	1816(ra) # 80007d4c <panic>

000000008000763c <clockintr>:
    8000763c:	fe010113          	addi	sp,sp,-32
    80007640:	00813823          	sd	s0,16(sp)
    80007644:	00913423          	sd	s1,8(sp)
    80007648:	00113c23          	sd	ra,24(sp)
    8000764c:	02010413          	addi	s0,sp,32
    80007650:	00006497          	auipc	s1,0x6
    80007654:	77048493          	addi	s1,s1,1904 # 8000ddc0 <tickslock>
    80007658:	00048513          	mv	a0,s1
    8000765c:	00001097          	auipc	ra,0x1
    80007660:	420080e7          	jalr	1056(ra) # 80008a7c <acquire>
    80007664:	00005717          	auipc	a4,0x5
    80007668:	4f070713          	addi	a4,a4,1264 # 8000cb54 <ticks>
    8000766c:	00072783          	lw	a5,0(a4)
    80007670:	01013403          	ld	s0,16(sp)
    80007674:	01813083          	ld	ra,24(sp)
    80007678:	00048513          	mv	a0,s1
    8000767c:	0017879b          	addiw	a5,a5,1
    80007680:	00813483          	ld	s1,8(sp)
    80007684:	00f72023          	sw	a5,0(a4)
    80007688:	02010113          	addi	sp,sp,32
    8000768c:	00001317          	auipc	t1,0x1
    80007690:	4bc30067          	jr	1212(t1) # 80008b48 <release>

0000000080007694 <devintr>:
    80007694:	142027f3          	csrr	a5,scause
    80007698:	00000513          	li	a0,0
    8000769c:	0007c463          	bltz	a5,800076a4 <devintr+0x10>
    800076a0:	00008067          	ret
    800076a4:	fe010113          	addi	sp,sp,-32
    800076a8:	00813823          	sd	s0,16(sp)
    800076ac:	00113c23          	sd	ra,24(sp)
    800076b0:	00913423          	sd	s1,8(sp)
    800076b4:	02010413          	addi	s0,sp,32
    800076b8:	0ff7f713          	andi	a4,a5,255
    800076bc:	00900693          	li	a3,9
    800076c0:	04d70c63          	beq	a4,a3,80007718 <devintr+0x84>
    800076c4:	fff00713          	li	a4,-1
    800076c8:	03f71713          	slli	a4,a4,0x3f
    800076cc:	00170713          	addi	a4,a4,1
    800076d0:	00e78c63          	beq	a5,a4,800076e8 <devintr+0x54>
    800076d4:	01813083          	ld	ra,24(sp)
    800076d8:	01013403          	ld	s0,16(sp)
    800076dc:	00813483          	ld	s1,8(sp)
    800076e0:	02010113          	addi	sp,sp,32
    800076e4:	00008067          	ret
    800076e8:	00000097          	auipc	ra,0x0
    800076ec:	c8c080e7          	jalr	-884(ra) # 80007374 <cpuid>
    800076f0:	06050663          	beqz	a0,8000775c <devintr+0xc8>
    800076f4:	144027f3          	csrr	a5,sip
    800076f8:	ffd7f793          	andi	a5,a5,-3
    800076fc:	14479073          	csrw	sip,a5
    80007700:	01813083          	ld	ra,24(sp)
    80007704:	01013403          	ld	s0,16(sp)
    80007708:	00813483          	ld	s1,8(sp)
    8000770c:	00200513          	li	a0,2
    80007710:	02010113          	addi	sp,sp,32
    80007714:	00008067          	ret
    80007718:	00000097          	auipc	ra,0x0
    8000771c:	24c080e7          	jalr	588(ra) # 80007964 <plic_claim>
    80007720:	00a00793          	li	a5,10
    80007724:	00050493          	mv	s1,a0
    80007728:	06f50663          	beq	a0,a5,80007794 <devintr+0x100>
    8000772c:	00100513          	li	a0,1
    80007730:	fa0482e3          	beqz	s1,800076d4 <devintr+0x40>
    80007734:	00048593          	mv	a1,s1
    80007738:	00003517          	auipc	a0,0x3
    8000773c:	06050513          	addi	a0,a0,96 # 8000a798 <_ZZ9kPrintIntmE6digits+0x728>
    80007740:	00000097          	auipc	ra,0x0
    80007744:	668080e7          	jalr	1640(ra) # 80007da8 <__printf>
    80007748:	00048513          	mv	a0,s1
    8000774c:	00000097          	auipc	ra,0x0
    80007750:	250080e7          	jalr	592(ra) # 8000799c <plic_complete>
    80007754:	00100513          	li	a0,1
    80007758:	f7dff06f          	j	800076d4 <devintr+0x40>
    8000775c:	00006517          	auipc	a0,0x6
    80007760:	66450513          	addi	a0,a0,1636 # 8000ddc0 <tickslock>
    80007764:	00001097          	auipc	ra,0x1
    80007768:	318080e7          	jalr	792(ra) # 80008a7c <acquire>
    8000776c:	00005717          	auipc	a4,0x5
    80007770:	3e870713          	addi	a4,a4,1000 # 8000cb54 <ticks>
    80007774:	00072783          	lw	a5,0(a4)
    80007778:	00006517          	auipc	a0,0x6
    8000777c:	64850513          	addi	a0,a0,1608 # 8000ddc0 <tickslock>
    80007780:	0017879b          	addiw	a5,a5,1
    80007784:	00f72023          	sw	a5,0(a4)
    80007788:	00001097          	auipc	ra,0x1
    8000778c:	3c0080e7          	jalr	960(ra) # 80008b48 <release>
    80007790:	f65ff06f          	j	800076f4 <devintr+0x60>
    80007794:	00001097          	auipc	ra,0x1
    80007798:	f1c080e7          	jalr	-228(ra) # 800086b0 <uartintr>
    8000779c:	fadff06f          	j	80007748 <devintr+0xb4>

00000000800077a0 <kernelvec>:
    800077a0:	f0010113          	addi	sp,sp,-256
    800077a4:	00113023          	sd	ra,0(sp)
    800077a8:	00213423          	sd	sp,8(sp)
    800077ac:	00313823          	sd	gp,16(sp)
    800077b0:	00413c23          	sd	tp,24(sp)
    800077b4:	02513023          	sd	t0,32(sp)
    800077b8:	02613423          	sd	t1,40(sp)
    800077bc:	02713823          	sd	t2,48(sp)
    800077c0:	02813c23          	sd	s0,56(sp)
    800077c4:	04913023          	sd	s1,64(sp)
    800077c8:	04a13423          	sd	a0,72(sp)
    800077cc:	04b13823          	sd	a1,80(sp)
    800077d0:	04c13c23          	sd	a2,88(sp)
    800077d4:	06d13023          	sd	a3,96(sp)
    800077d8:	06e13423          	sd	a4,104(sp)
    800077dc:	06f13823          	sd	a5,112(sp)
    800077e0:	07013c23          	sd	a6,120(sp)
    800077e4:	09113023          	sd	a7,128(sp)
    800077e8:	09213423          	sd	s2,136(sp)
    800077ec:	09313823          	sd	s3,144(sp)
    800077f0:	09413c23          	sd	s4,152(sp)
    800077f4:	0b513023          	sd	s5,160(sp)
    800077f8:	0b613423          	sd	s6,168(sp)
    800077fc:	0b713823          	sd	s7,176(sp)
    80007800:	0b813c23          	sd	s8,184(sp)
    80007804:	0d913023          	sd	s9,192(sp)
    80007808:	0da13423          	sd	s10,200(sp)
    8000780c:	0db13823          	sd	s11,208(sp)
    80007810:	0dc13c23          	sd	t3,216(sp)
    80007814:	0fd13023          	sd	t4,224(sp)
    80007818:	0fe13423          	sd	t5,232(sp)
    8000781c:	0ff13823          	sd	t6,240(sp)
    80007820:	cd5ff0ef          	jal	ra,800074f4 <kerneltrap>
    80007824:	00013083          	ld	ra,0(sp)
    80007828:	00813103          	ld	sp,8(sp)
    8000782c:	01013183          	ld	gp,16(sp)
    80007830:	02013283          	ld	t0,32(sp)
    80007834:	02813303          	ld	t1,40(sp)
    80007838:	03013383          	ld	t2,48(sp)
    8000783c:	03813403          	ld	s0,56(sp)
    80007840:	04013483          	ld	s1,64(sp)
    80007844:	04813503          	ld	a0,72(sp)
    80007848:	05013583          	ld	a1,80(sp)
    8000784c:	05813603          	ld	a2,88(sp)
    80007850:	06013683          	ld	a3,96(sp)
    80007854:	06813703          	ld	a4,104(sp)
    80007858:	07013783          	ld	a5,112(sp)
    8000785c:	07813803          	ld	a6,120(sp)
    80007860:	08013883          	ld	a7,128(sp)
    80007864:	08813903          	ld	s2,136(sp)
    80007868:	09013983          	ld	s3,144(sp)
    8000786c:	09813a03          	ld	s4,152(sp)
    80007870:	0a013a83          	ld	s5,160(sp)
    80007874:	0a813b03          	ld	s6,168(sp)
    80007878:	0b013b83          	ld	s7,176(sp)
    8000787c:	0b813c03          	ld	s8,184(sp)
    80007880:	0c013c83          	ld	s9,192(sp)
    80007884:	0c813d03          	ld	s10,200(sp)
    80007888:	0d013d83          	ld	s11,208(sp)
    8000788c:	0d813e03          	ld	t3,216(sp)
    80007890:	0e013e83          	ld	t4,224(sp)
    80007894:	0e813f03          	ld	t5,232(sp)
    80007898:	0f013f83          	ld	t6,240(sp)
    8000789c:	10010113          	addi	sp,sp,256
    800078a0:	10200073          	sret
    800078a4:	00000013          	nop
    800078a8:	00000013          	nop
    800078ac:	00000013          	nop

00000000800078b0 <timervec>:
    800078b0:	34051573          	csrrw	a0,mscratch,a0
    800078b4:	00b53023          	sd	a1,0(a0)
    800078b8:	00c53423          	sd	a2,8(a0)
    800078bc:	00d53823          	sd	a3,16(a0)
    800078c0:	01853583          	ld	a1,24(a0)
    800078c4:	02053603          	ld	a2,32(a0)
    800078c8:	0005b683          	ld	a3,0(a1)
    800078cc:	00c686b3          	add	a3,a3,a2
    800078d0:	00d5b023          	sd	a3,0(a1)
    800078d4:	00200593          	li	a1,2
    800078d8:	14459073          	csrw	sip,a1
    800078dc:	01053683          	ld	a3,16(a0)
    800078e0:	00853603          	ld	a2,8(a0)
    800078e4:	00053583          	ld	a1,0(a0)
    800078e8:	34051573          	csrrw	a0,mscratch,a0
    800078ec:	30200073          	mret

00000000800078f0 <plicinit>:
    800078f0:	ff010113          	addi	sp,sp,-16
    800078f4:	00813423          	sd	s0,8(sp)
    800078f8:	01010413          	addi	s0,sp,16
    800078fc:	00813403          	ld	s0,8(sp)
    80007900:	0c0007b7          	lui	a5,0xc000
    80007904:	00100713          	li	a4,1
    80007908:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000790c:	00e7a223          	sw	a4,4(a5)
    80007910:	01010113          	addi	sp,sp,16
    80007914:	00008067          	ret

0000000080007918 <plicinithart>:
    80007918:	ff010113          	addi	sp,sp,-16
    8000791c:	00813023          	sd	s0,0(sp)
    80007920:	00113423          	sd	ra,8(sp)
    80007924:	01010413          	addi	s0,sp,16
    80007928:	00000097          	auipc	ra,0x0
    8000792c:	a4c080e7          	jalr	-1460(ra) # 80007374 <cpuid>
    80007930:	0085171b          	slliw	a4,a0,0x8
    80007934:	0c0027b7          	lui	a5,0xc002
    80007938:	00e787b3          	add	a5,a5,a4
    8000793c:	40200713          	li	a4,1026
    80007940:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007944:	00813083          	ld	ra,8(sp)
    80007948:	00013403          	ld	s0,0(sp)
    8000794c:	00d5151b          	slliw	a0,a0,0xd
    80007950:	0c2017b7          	lui	a5,0xc201
    80007954:	00a78533          	add	a0,a5,a0
    80007958:	00052023          	sw	zero,0(a0)
    8000795c:	01010113          	addi	sp,sp,16
    80007960:	00008067          	ret

0000000080007964 <plic_claim>:
    80007964:	ff010113          	addi	sp,sp,-16
    80007968:	00813023          	sd	s0,0(sp)
    8000796c:	00113423          	sd	ra,8(sp)
    80007970:	01010413          	addi	s0,sp,16
    80007974:	00000097          	auipc	ra,0x0
    80007978:	a00080e7          	jalr	-1536(ra) # 80007374 <cpuid>
    8000797c:	00813083          	ld	ra,8(sp)
    80007980:	00013403          	ld	s0,0(sp)
    80007984:	00d5151b          	slliw	a0,a0,0xd
    80007988:	0c2017b7          	lui	a5,0xc201
    8000798c:	00a78533          	add	a0,a5,a0
    80007990:	00452503          	lw	a0,4(a0)
    80007994:	01010113          	addi	sp,sp,16
    80007998:	00008067          	ret

000000008000799c <plic_complete>:
    8000799c:	fe010113          	addi	sp,sp,-32
    800079a0:	00813823          	sd	s0,16(sp)
    800079a4:	00913423          	sd	s1,8(sp)
    800079a8:	00113c23          	sd	ra,24(sp)
    800079ac:	02010413          	addi	s0,sp,32
    800079b0:	00050493          	mv	s1,a0
    800079b4:	00000097          	auipc	ra,0x0
    800079b8:	9c0080e7          	jalr	-1600(ra) # 80007374 <cpuid>
    800079bc:	01813083          	ld	ra,24(sp)
    800079c0:	01013403          	ld	s0,16(sp)
    800079c4:	00d5179b          	slliw	a5,a0,0xd
    800079c8:	0c201737          	lui	a4,0xc201
    800079cc:	00f707b3          	add	a5,a4,a5
    800079d0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800079d4:	00813483          	ld	s1,8(sp)
    800079d8:	02010113          	addi	sp,sp,32
    800079dc:	00008067          	ret

00000000800079e0 <consolewrite>:
    800079e0:	fb010113          	addi	sp,sp,-80
    800079e4:	04813023          	sd	s0,64(sp)
    800079e8:	04113423          	sd	ra,72(sp)
    800079ec:	02913c23          	sd	s1,56(sp)
    800079f0:	03213823          	sd	s2,48(sp)
    800079f4:	03313423          	sd	s3,40(sp)
    800079f8:	03413023          	sd	s4,32(sp)
    800079fc:	01513c23          	sd	s5,24(sp)
    80007a00:	05010413          	addi	s0,sp,80
    80007a04:	06c05c63          	blez	a2,80007a7c <consolewrite+0x9c>
    80007a08:	00060993          	mv	s3,a2
    80007a0c:	00050a13          	mv	s4,a0
    80007a10:	00058493          	mv	s1,a1
    80007a14:	00000913          	li	s2,0
    80007a18:	fff00a93          	li	s5,-1
    80007a1c:	01c0006f          	j	80007a38 <consolewrite+0x58>
    80007a20:	fbf44503          	lbu	a0,-65(s0)
    80007a24:	0019091b          	addiw	s2,s2,1
    80007a28:	00148493          	addi	s1,s1,1
    80007a2c:	00001097          	auipc	ra,0x1
    80007a30:	a9c080e7          	jalr	-1380(ra) # 800084c8 <uartputc>
    80007a34:	03298063          	beq	s3,s2,80007a54 <consolewrite+0x74>
    80007a38:	00048613          	mv	a2,s1
    80007a3c:	00100693          	li	a3,1
    80007a40:	000a0593          	mv	a1,s4
    80007a44:	fbf40513          	addi	a0,s0,-65
    80007a48:	00000097          	auipc	ra,0x0
    80007a4c:	9e4080e7          	jalr	-1564(ra) # 8000742c <either_copyin>
    80007a50:	fd5518e3          	bne	a0,s5,80007a20 <consolewrite+0x40>
    80007a54:	04813083          	ld	ra,72(sp)
    80007a58:	04013403          	ld	s0,64(sp)
    80007a5c:	03813483          	ld	s1,56(sp)
    80007a60:	02813983          	ld	s3,40(sp)
    80007a64:	02013a03          	ld	s4,32(sp)
    80007a68:	01813a83          	ld	s5,24(sp)
    80007a6c:	00090513          	mv	a0,s2
    80007a70:	03013903          	ld	s2,48(sp)
    80007a74:	05010113          	addi	sp,sp,80
    80007a78:	00008067          	ret
    80007a7c:	00000913          	li	s2,0
    80007a80:	fd5ff06f          	j	80007a54 <consolewrite+0x74>

0000000080007a84 <consoleread>:
    80007a84:	f9010113          	addi	sp,sp,-112
    80007a88:	06813023          	sd	s0,96(sp)
    80007a8c:	04913c23          	sd	s1,88(sp)
    80007a90:	05213823          	sd	s2,80(sp)
    80007a94:	05313423          	sd	s3,72(sp)
    80007a98:	05413023          	sd	s4,64(sp)
    80007a9c:	03513c23          	sd	s5,56(sp)
    80007aa0:	03613823          	sd	s6,48(sp)
    80007aa4:	03713423          	sd	s7,40(sp)
    80007aa8:	03813023          	sd	s8,32(sp)
    80007aac:	06113423          	sd	ra,104(sp)
    80007ab0:	01913c23          	sd	s9,24(sp)
    80007ab4:	07010413          	addi	s0,sp,112
    80007ab8:	00060b93          	mv	s7,a2
    80007abc:	00050913          	mv	s2,a0
    80007ac0:	00058c13          	mv	s8,a1
    80007ac4:	00060b1b          	sext.w	s6,a2
    80007ac8:	00006497          	auipc	s1,0x6
    80007acc:	32048493          	addi	s1,s1,800 # 8000dde8 <cons>
    80007ad0:	00400993          	li	s3,4
    80007ad4:	fff00a13          	li	s4,-1
    80007ad8:	00a00a93          	li	s5,10
    80007adc:	05705e63          	blez	s7,80007b38 <consoleread+0xb4>
    80007ae0:	09c4a703          	lw	a4,156(s1)
    80007ae4:	0984a783          	lw	a5,152(s1)
    80007ae8:	0007071b          	sext.w	a4,a4
    80007aec:	08e78463          	beq	a5,a4,80007b74 <consoleread+0xf0>
    80007af0:	07f7f713          	andi	a4,a5,127
    80007af4:	00e48733          	add	a4,s1,a4
    80007af8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80007afc:	0017869b          	addiw	a3,a5,1
    80007b00:	08d4ac23          	sw	a3,152(s1)
    80007b04:	00070c9b          	sext.w	s9,a4
    80007b08:	0b370663          	beq	a4,s3,80007bb4 <consoleread+0x130>
    80007b0c:	00100693          	li	a3,1
    80007b10:	f9f40613          	addi	a2,s0,-97
    80007b14:	000c0593          	mv	a1,s8
    80007b18:	00090513          	mv	a0,s2
    80007b1c:	f8e40fa3          	sb	a4,-97(s0)
    80007b20:	00000097          	auipc	ra,0x0
    80007b24:	8c0080e7          	jalr	-1856(ra) # 800073e0 <either_copyout>
    80007b28:	01450863          	beq	a0,s4,80007b38 <consoleread+0xb4>
    80007b2c:	001c0c13          	addi	s8,s8,1
    80007b30:	fffb8b9b          	addiw	s7,s7,-1
    80007b34:	fb5c94e3          	bne	s9,s5,80007adc <consoleread+0x58>
    80007b38:	000b851b          	sext.w	a0,s7
    80007b3c:	06813083          	ld	ra,104(sp)
    80007b40:	06013403          	ld	s0,96(sp)
    80007b44:	05813483          	ld	s1,88(sp)
    80007b48:	05013903          	ld	s2,80(sp)
    80007b4c:	04813983          	ld	s3,72(sp)
    80007b50:	04013a03          	ld	s4,64(sp)
    80007b54:	03813a83          	ld	s5,56(sp)
    80007b58:	02813b83          	ld	s7,40(sp)
    80007b5c:	02013c03          	ld	s8,32(sp)
    80007b60:	01813c83          	ld	s9,24(sp)
    80007b64:	40ab053b          	subw	a0,s6,a0
    80007b68:	03013b03          	ld	s6,48(sp)
    80007b6c:	07010113          	addi	sp,sp,112
    80007b70:	00008067          	ret
    80007b74:	00001097          	auipc	ra,0x1
    80007b78:	1d8080e7          	jalr	472(ra) # 80008d4c <push_on>
    80007b7c:	0984a703          	lw	a4,152(s1)
    80007b80:	09c4a783          	lw	a5,156(s1)
    80007b84:	0007879b          	sext.w	a5,a5
    80007b88:	fef70ce3          	beq	a4,a5,80007b80 <consoleread+0xfc>
    80007b8c:	00001097          	auipc	ra,0x1
    80007b90:	234080e7          	jalr	564(ra) # 80008dc0 <pop_on>
    80007b94:	0984a783          	lw	a5,152(s1)
    80007b98:	07f7f713          	andi	a4,a5,127
    80007b9c:	00e48733          	add	a4,s1,a4
    80007ba0:	01874703          	lbu	a4,24(a4)
    80007ba4:	0017869b          	addiw	a3,a5,1
    80007ba8:	08d4ac23          	sw	a3,152(s1)
    80007bac:	00070c9b          	sext.w	s9,a4
    80007bb0:	f5371ee3          	bne	a4,s3,80007b0c <consoleread+0x88>
    80007bb4:	000b851b          	sext.w	a0,s7
    80007bb8:	f96bf2e3          	bgeu	s7,s6,80007b3c <consoleread+0xb8>
    80007bbc:	08f4ac23          	sw	a5,152(s1)
    80007bc0:	f7dff06f          	j	80007b3c <consoleread+0xb8>

0000000080007bc4 <consputc>:
    80007bc4:	10000793          	li	a5,256
    80007bc8:	00f50663          	beq	a0,a5,80007bd4 <consputc+0x10>
    80007bcc:	00001317          	auipc	t1,0x1
    80007bd0:	9f430067          	jr	-1548(t1) # 800085c0 <uartputc_sync>
    80007bd4:	ff010113          	addi	sp,sp,-16
    80007bd8:	00113423          	sd	ra,8(sp)
    80007bdc:	00813023          	sd	s0,0(sp)
    80007be0:	01010413          	addi	s0,sp,16
    80007be4:	00800513          	li	a0,8
    80007be8:	00001097          	auipc	ra,0x1
    80007bec:	9d8080e7          	jalr	-1576(ra) # 800085c0 <uartputc_sync>
    80007bf0:	02000513          	li	a0,32
    80007bf4:	00001097          	auipc	ra,0x1
    80007bf8:	9cc080e7          	jalr	-1588(ra) # 800085c0 <uartputc_sync>
    80007bfc:	00013403          	ld	s0,0(sp)
    80007c00:	00813083          	ld	ra,8(sp)
    80007c04:	00800513          	li	a0,8
    80007c08:	01010113          	addi	sp,sp,16
    80007c0c:	00001317          	auipc	t1,0x1
    80007c10:	9b430067          	jr	-1612(t1) # 800085c0 <uartputc_sync>

0000000080007c14 <consoleintr>:
    80007c14:	fe010113          	addi	sp,sp,-32
    80007c18:	00813823          	sd	s0,16(sp)
    80007c1c:	00913423          	sd	s1,8(sp)
    80007c20:	01213023          	sd	s2,0(sp)
    80007c24:	00113c23          	sd	ra,24(sp)
    80007c28:	02010413          	addi	s0,sp,32
    80007c2c:	00006917          	auipc	s2,0x6
    80007c30:	1bc90913          	addi	s2,s2,444 # 8000dde8 <cons>
    80007c34:	00050493          	mv	s1,a0
    80007c38:	00090513          	mv	a0,s2
    80007c3c:	00001097          	auipc	ra,0x1
    80007c40:	e40080e7          	jalr	-448(ra) # 80008a7c <acquire>
    80007c44:	02048c63          	beqz	s1,80007c7c <consoleintr+0x68>
    80007c48:	0a092783          	lw	a5,160(s2)
    80007c4c:	09892703          	lw	a4,152(s2)
    80007c50:	07f00693          	li	a3,127
    80007c54:	40e7873b          	subw	a4,a5,a4
    80007c58:	02e6e263          	bltu	a3,a4,80007c7c <consoleintr+0x68>
    80007c5c:	00d00713          	li	a4,13
    80007c60:	04e48063          	beq	s1,a4,80007ca0 <consoleintr+0x8c>
    80007c64:	07f7f713          	andi	a4,a5,127
    80007c68:	00e90733          	add	a4,s2,a4
    80007c6c:	0017879b          	addiw	a5,a5,1
    80007c70:	0af92023          	sw	a5,160(s2)
    80007c74:	00970c23          	sb	s1,24(a4)
    80007c78:	08f92e23          	sw	a5,156(s2)
    80007c7c:	01013403          	ld	s0,16(sp)
    80007c80:	01813083          	ld	ra,24(sp)
    80007c84:	00813483          	ld	s1,8(sp)
    80007c88:	00013903          	ld	s2,0(sp)
    80007c8c:	00006517          	auipc	a0,0x6
    80007c90:	15c50513          	addi	a0,a0,348 # 8000dde8 <cons>
    80007c94:	02010113          	addi	sp,sp,32
    80007c98:	00001317          	auipc	t1,0x1
    80007c9c:	eb030067          	jr	-336(t1) # 80008b48 <release>
    80007ca0:	00a00493          	li	s1,10
    80007ca4:	fc1ff06f          	j	80007c64 <consoleintr+0x50>

0000000080007ca8 <consoleinit>:
    80007ca8:	fe010113          	addi	sp,sp,-32
    80007cac:	00113c23          	sd	ra,24(sp)
    80007cb0:	00813823          	sd	s0,16(sp)
    80007cb4:	00913423          	sd	s1,8(sp)
    80007cb8:	02010413          	addi	s0,sp,32
    80007cbc:	00006497          	auipc	s1,0x6
    80007cc0:	12c48493          	addi	s1,s1,300 # 8000dde8 <cons>
    80007cc4:	00048513          	mv	a0,s1
    80007cc8:	00003597          	auipc	a1,0x3
    80007ccc:	b2858593          	addi	a1,a1,-1240 # 8000a7f0 <_ZZ9kPrintIntmE6digits+0x780>
    80007cd0:	00001097          	auipc	ra,0x1
    80007cd4:	d88080e7          	jalr	-632(ra) # 80008a58 <initlock>
    80007cd8:	00000097          	auipc	ra,0x0
    80007cdc:	7ac080e7          	jalr	1964(ra) # 80008484 <uartinit>
    80007ce0:	01813083          	ld	ra,24(sp)
    80007ce4:	01013403          	ld	s0,16(sp)
    80007ce8:	00000797          	auipc	a5,0x0
    80007cec:	d9c78793          	addi	a5,a5,-612 # 80007a84 <consoleread>
    80007cf0:	0af4bc23          	sd	a5,184(s1)
    80007cf4:	00000797          	auipc	a5,0x0
    80007cf8:	cec78793          	addi	a5,a5,-788 # 800079e0 <consolewrite>
    80007cfc:	0cf4b023          	sd	a5,192(s1)
    80007d00:	00813483          	ld	s1,8(sp)
    80007d04:	02010113          	addi	sp,sp,32
    80007d08:	00008067          	ret

0000000080007d0c <console_read>:
    80007d0c:	ff010113          	addi	sp,sp,-16
    80007d10:	00813423          	sd	s0,8(sp)
    80007d14:	01010413          	addi	s0,sp,16
    80007d18:	00813403          	ld	s0,8(sp)
    80007d1c:	00006317          	auipc	t1,0x6
    80007d20:	18433303          	ld	t1,388(t1) # 8000dea0 <devsw+0x10>
    80007d24:	01010113          	addi	sp,sp,16
    80007d28:	00030067          	jr	t1

0000000080007d2c <console_write>:
    80007d2c:	ff010113          	addi	sp,sp,-16
    80007d30:	00813423          	sd	s0,8(sp)
    80007d34:	01010413          	addi	s0,sp,16
    80007d38:	00813403          	ld	s0,8(sp)
    80007d3c:	00006317          	auipc	t1,0x6
    80007d40:	16c33303          	ld	t1,364(t1) # 8000dea8 <devsw+0x18>
    80007d44:	01010113          	addi	sp,sp,16
    80007d48:	00030067          	jr	t1

0000000080007d4c <panic>:
    80007d4c:	fe010113          	addi	sp,sp,-32
    80007d50:	00113c23          	sd	ra,24(sp)
    80007d54:	00813823          	sd	s0,16(sp)
    80007d58:	00913423          	sd	s1,8(sp)
    80007d5c:	02010413          	addi	s0,sp,32
    80007d60:	00050493          	mv	s1,a0
    80007d64:	00003517          	auipc	a0,0x3
    80007d68:	a9450513          	addi	a0,a0,-1388 # 8000a7f8 <_ZZ9kPrintIntmE6digits+0x788>
    80007d6c:	00006797          	auipc	a5,0x6
    80007d70:	1c07ae23          	sw	zero,476(a5) # 8000df48 <pr+0x18>
    80007d74:	00000097          	auipc	ra,0x0
    80007d78:	034080e7          	jalr	52(ra) # 80007da8 <__printf>
    80007d7c:	00048513          	mv	a0,s1
    80007d80:	00000097          	auipc	ra,0x0
    80007d84:	028080e7          	jalr	40(ra) # 80007da8 <__printf>
    80007d88:	00002517          	auipc	a0,0x2
    80007d8c:	7f850513          	addi	a0,a0,2040 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80007d90:	00000097          	auipc	ra,0x0
    80007d94:	018080e7          	jalr	24(ra) # 80007da8 <__printf>
    80007d98:	00100793          	li	a5,1
    80007d9c:	00005717          	auipc	a4,0x5
    80007da0:	daf72e23          	sw	a5,-580(a4) # 8000cb58 <panicked>
    80007da4:	0000006f          	j	80007da4 <panic+0x58>

0000000080007da8 <__printf>:
    80007da8:	f3010113          	addi	sp,sp,-208
    80007dac:	08813023          	sd	s0,128(sp)
    80007db0:	07313423          	sd	s3,104(sp)
    80007db4:	09010413          	addi	s0,sp,144
    80007db8:	05813023          	sd	s8,64(sp)
    80007dbc:	08113423          	sd	ra,136(sp)
    80007dc0:	06913c23          	sd	s1,120(sp)
    80007dc4:	07213823          	sd	s2,112(sp)
    80007dc8:	07413023          	sd	s4,96(sp)
    80007dcc:	05513c23          	sd	s5,88(sp)
    80007dd0:	05613823          	sd	s6,80(sp)
    80007dd4:	05713423          	sd	s7,72(sp)
    80007dd8:	03913c23          	sd	s9,56(sp)
    80007ddc:	03a13823          	sd	s10,48(sp)
    80007de0:	03b13423          	sd	s11,40(sp)
    80007de4:	00006317          	auipc	t1,0x6
    80007de8:	14c30313          	addi	t1,t1,332 # 8000df30 <pr>
    80007dec:	01832c03          	lw	s8,24(t1)
    80007df0:	00b43423          	sd	a1,8(s0)
    80007df4:	00c43823          	sd	a2,16(s0)
    80007df8:	00d43c23          	sd	a3,24(s0)
    80007dfc:	02e43023          	sd	a4,32(s0)
    80007e00:	02f43423          	sd	a5,40(s0)
    80007e04:	03043823          	sd	a6,48(s0)
    80007e08:	03143c23          	sd	a7,56(s0)
    80007e0c:	00050993          	mv	s3,a0
    80007e10:	4a0c1663          	bnez	s8,800082bc <__printf+0x514>
    80007e14:	60098c63          	beqz	s3,8000842c <__printf+0x684>
    80007e18:	0009c503          	lbu	a0,0(s3)
    80007e1c:	00840793          	addi	a5,s0,8
    80007e20:	f6f43c23          	sd	a5,-136(s0)
    80007e24:	00000493          	li	s1,0
    80007e28:	22050063          	beqz	a0,80008048 <__printf+0x2a0>
    80007e2c:	00002a37          	lui	s4,0x2
    80007e30:	00018ab7          	lui	s5,0x18
    80007e34:	000f4b37          	lui	s6,0xf4
    80007e38:	00989bb7          	lui	s7,0x989
    80007e3c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007e40:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007e44:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007e48:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007e4c:	00148c9b          	addiw	s9,s1,1
    80007e50:	02500793          	li	a5,37
    80007e54:	01998933          	add	s2,s3,s9
    80007e58:	38f51263          	bne	a0,a5,800081dc <__printf+0x434>
    80007e5c:	00094783          	lbu	a5,0(s2)
    80007e60:	00078c9b          	sext.w	s9,a5
    80007e64:	1e078263          	beqz	a5,80008048 <__printf+0x2a0>
    80007e68:	0024849b          	addiw	s1,s1,2
    80007e6c:	07000713          	li	a4,112
    80007e70:	00998933          	add	s2,s3,s1
    80007e74:	38e78a63          	beq	a5,a4,80008208 <__printf+0x460>
    80007e78:	20f76863          	bltu	a4,a5,80008088 <__printf+0x2e0>
    80007e7c:	42a78863          	beq	a5,a0,800082ac <__printf+0x504>
    80007e80:	06400713          	li	a4,100
    80007e84:	40e79663          	bne	a5,a4,80008290 <__printf+0x4e8>
    80007e88:	f7843783          	ld	a5,-136(s0)
    80007e8c:	0007a603          	lw	a2,0(a5)
    80007e90:	00878793          	addi	a5,a5,8
    80007e94:	f6f43c23          	sd	a5,-136(s0)
    80007e98:	42064a63          	bltz	a2,800082cc <__printf+0x524>
    80007e9c:	00a00713          	li	a4,10
    80007ea0:	02e677bb          	remuw	a5,a2,a4
    80007ea4:	00003d97          	auipc	s11,0x3
    80007ea8:	97cd8d93          	addi	s11,s11,-1668 # 8000a820 <digits>
    80007eac:	00900593          	li	a1,9
    80007eb0:	0006051b          	sext.w	a0,a2
    80007eb4:	00000c93          	li	s9,0
    80007eb8:	02079793          	slli	a5,a5,0x20
    80007ebc:	0207d793          	srli	a5,a5,0x20
    80007ec0:	00fd87b3          	add	a5,s11,a5
    80007ec4:	0007c783          	lbu	a5,0(a5)
    80007ec8:	02e656bb          	divuw	a3,a2,a4
    80007ecc:	f8f40023          	sb	a5,-128(s0)
    80007ed0:	14c5d863          	bge	a1,a2,80008020 <__printf+0x278>
    80007ed4:	06300593          	li	a1,99
    80007ed8:	00100c93          	li	s9,1
    80007edc:	02e6f7bb          	remuw	a5,a3,a4
    80007ee0:	02079793          	slli	a5,a5,0x20
    80007ee4:	0207d793          	srli	a5,a5,0x20
    80007ee8:	00fd87b3          	add	a5,s11,a5
    80007eec:	0007c783          	lbu	a5,0(a5)
    80007ef0:	02e6d73b          	divuw	a4,a3,a4
    80007ef4:	f8f400a3          	sb	a5,-127(s0)
    80007ef8:	12a5f463          	bgeu	a1,a0,80008020 <__printf+0x278>
    80007efc:	00a00693          	li	a3,10
    80007f00:	00900593          	li	a1,9
    80007f04:	02d777bb          	remuw	a5,a4,a3
    80007f08:	02079793          	slli	a5,a5,0x20
    80007f0c:	0207d793          	srli	a5,a5,0x20
    80007f10:	00fd87b3          	add	a5,s11,a5
    80007f14:	0007c503          	lbu	a0,0(a5)
    80007f18:	02d757bb          	divuw	a5,a4,a3
    80007f1c:	f8a40123          	sb	a0,-126(s0)
    80007f20:	48e5f263          	bgeu	a1,a4,800083a4 <__printf+0x5fc>
    80007f24:	06300513          	li	a0,99
    80007f28:	02d7f5bb          	remuw	a1,a5,a3
    80007f2c:	02059593          	slli	a1,a1,0x20
    80007f30:	0205d593          	srli	a1,a1,0x20
    80007f34:	00bd85b3          	add	a1,s11,a1
    80007f38:	0005c583          	lbu	a1,0(a1)
    80007f3c:	02d7d7bb          	divuw	a5,a5,a3
    80007f40:	f8b401a3          	sb	a1,-125(s0)
    80007f44:	48e57263          	bgeu	a0,a4,800083c8 <__printf+0x620>
    80007f48:	3e700513          	li	a0,999
    80007f4c:	02d7f5bb          	remuw	a1,a5,a3
    80007f50:	02059593          	slli	a1,a1,0x20
    80007f54:	0205d593          	srli	a1,a1,0x20
    80007f58:	00bd85b3          	add	a1,s11,a1
    80007f5c:	0005c583          	lbu	a1,0(a1)
    80007f60:	02d7d7bb          	divuw	a5,a5,a3
    80007f64:	f8b40223          	sb	a1,-124(s0)
    80007f68:	46e57663          	bgeu	a0,a4,800083d4 <__printf+0x62c>
    80007f6c:	02d7f5bb          	remuw	a1,a5,a3
    80007f70:	02059593          	slli	a1,a1,0x20
    80007f74:	0205d593          	srli	a1,a1,0x20
    80007f78:	00bd85b3          	add	a1,s11,a1
    80007f7c:	0005c583          	lbu	a1,0(a1)
    80007f80:	02d7d7bb          	divuw	a5,a5,a3
    80007f84:	f8b402a3          	sb	a1,-123(s0)
    80007f88:	46ea7863          	bgeu	s4,a4,800083f8 <__printf+0x650>
    80007f8c:	02d7f5bb          	remuw	a1,a5,a3
    80007f90:	02059593          	slli	a1,a1,0x20
    80007f94:	0205d593          	srli	a1,a1,0x20
    80007f98:	00bd85b3          	add	a1,s11,a1
    80007f9c:	0005c583          	lbu	a1,0(a1)
    80007fa0:	02d7d7bb          	divuw	a5,a5,a3
    80007fa4:	f8b40323          	sb	a1,-122(s0)
    80007fa8:	3eeaf863          	bgeu	s5,a4,80008398 <__printf+0x5f0>
    80007fac:	02d7f5bb          	remuw	a1,a5,a3
    80007fb0:	02059593          	slli	a1,a1,0x20
    80007fb4:	0205d593          	srli	a1,a1,0x20
    80007fb8:	00bd85b3          	add	a1,s11,a1
    80007fbc:	0005c583          	lbu	a1,0(a1)
    80007fc0:	02d7d7bb          	divuw	a5,a5,a3
    80007fc4:	f8b403a3          	sb	a1,-121(s0)
    80007fc8:	42eb7e63          	bgeu	s6,a4,80008404 <__printf+0x65c>
    80007fcc:	02d7f5bb          	remuw	a1,a5,a3
    80007fd0:	02059593          	slli	a1,a1,0x20
    80007fd4:	0205d593          	srli	a1,a1,0x20
    80007fd8:	00bd85b3          	add	a1,s11,a1
    80007fdc:	0005c583          	lbu	a1,0(a1)
    80007fe0:	02d7d7bb          	divuw	a5,a5,a3
    80007fe4:	f8b40423          	sb	a1,-120(s0)
    80007fe8:	42ebfc63          	bgeu	s7,a4,80008420 <__printf+0x678>
    80007fec:	02079793          	slli	a5,a5,0x20
    80007ff0:	0207d793          	srli	a5,a5,0x20
    80007ff4:	00fd8db3          	add	s11,s11,a5
    80007ff8:	000dc703          	lbu	a4,0(s11)
    80007ffc:	00a00793          	li	a5,10
    80008000:	00900c93          	li	s9,9
    80008004:	f8e404a3          	sb	a4,-119(s0)
    80008008:	00065c63          	bgez	a2,80008020 <__printf+0x278>
    8000800c:	f9040713          	addi	a4,s0,-112
    80008010:	00f70733          	add	a4,a4,a5
    80008014:	02d00693          	li	a3,45
    80008018:	fed70823          	sb	a3,-16(a4)
    8000801c:	00078c93          	mv	s9,a5
    80008020:	f8040793          	addi	a5,s0,-128
    80008024:	01978cb3          	add	s9,a5,s9
    80008028:	f7f40d13          	addi	s10,s0,-129
    8000802c:	000cc503          	lbu	a0,0(s9)
    80008030:	fffc8c93          	addi	s9,s9,-1
    80008034:	00000097          	auipc	ra,0x0
    80008038:	b90080e7          	jalr	-1136(ra) # 80007bc4 <consputc>
    8000803c:	ffac98e3          	bne	s9,s10,8000802c <__printf+0x284>
    80008040:	00094503          	lbu	a0,0(s2)
    80008044:	e00514e3          	bnez	a0,80007e4c <__printf+0xa4>
    80008048:	1a0c1663          	bnez	s8,800081f4 <__printf+0x44c>
    8000804c:	08813083          	ld	ra,136(sp)
    80008050:	08013403          	ld	s0,128(sp)
    80008054:	07813483          	ld	s1,120(sp)
    80008058:	07013903          	ld	s2,112(sp)
    8000805c:	06813983          	ld	s3,104(sp)
    80008060:	06013a03          	ld	s4,96(sp)
    80008064:	05813a83          	ld	s5,88(sp)
    80008068:	05013b03          	ld	s6,80(sp)
    8000806c:	04813b83          	ld	s7,72(sp)
    80008070:	04013c03          	ld	s8,64(sp)
    80008074:	03813c83          	ld	s9,56(sp)
    80008078:	03013d03          	ld	s10,48(sp)
    8000807c:	02813d83          	ld	s11,40(sp)
    80008080:	0d010113          	addi	sp,sp,208
    80008084:	00008067          	ret
    80008088:	07300713          	li	a4,115
    8000808c:	1ce78a63          	beq	a5,a4,80008260 <__printf+0x4b8>
    80008090:	07800713          	li	a4,120
    80008094:	1ee79e63          	bne	a5,a4,80008290 <__printf+0x4e8>
    80008098:	f7843783          	ld	a5,-136(s0)
    8000809c:	0007a703          	lw	a4,0(a5)
    800080a0:	00878793          	addi	a5,a5,8
    800080a4:	f6f43c23          	sd	a5,-136(s0)
    800080a8:	28074263          	bltz	a4,8000832c <__printf+0x584>
    800080ac:	00002d97          	auipc	s11,0x2
    800080b0:	774d8d93          	addi	s11,s11,1908 # 8000a820 <digits>
    800080b4:	00f77793          	andi	a5,a4,15
    800080b8:	00fd87b3          	add	a5,s11,a5
    800080bc:	0007c683          	lbu	a3,0(a5)
    800080c0:	00f00613          	li	a2,15
    800080c4:	0007079b          	sext.w	a5,a4
    800080c8:	f8d40023          	sb	a3,-128(s0)
    800080cc:	0047559b          	srliw	a1,a4,0x4
    800080d0:	0047569b          	srliw	a3,a4,0x4
    800080d4:	00000c93          	li	s9,0
    800080d8:	0ee65063          	bge	a2,a4,800081b8 <__printf+0x410>
    800080dc:	00f6f693          	andi	a3,a3,15
    800080e0:	00dd86b3          	add	a3,s11,a3
    800080e4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800080e8:	0087d79b          	srliw	a5,a5,0x8
    800080ec:	00100c93          	li	s9,1
    800080f0:	f8d400a3          	sb	a3,-127(s0)
    800080f4:	0cb67263          	bgeu	a2,a1,800081b8 <__printf+0x410>
    800080f8:	00f7f693          	andi	a3,a5,15
    800080fc:	00dd86b3          	add	a3,s11,a3
    80008100:	0006c583          	lbu	a1,0(a3)
    80008104:	00f00613          	li	a2,15
    80008108:	0047d69b          	srliw	a3,a5,0x4
    8000810c:	f8b40123          	sb	a1,-126(s0)
    80008110:	0047d593          	srli	a1,a5,0x4
    80008114:	28f67e63          	bgeu	a2,a5,800083b0 <__printf+0x608>
    80008118:	00f6f693          	andi	a3,a3,15
    8000811c:	00dd86b3          	add	a3,s11,a3
    80008120:	0006c503          	lbu	a0,0(a3)
    80008124:	0087d813          	srli	a6,a5,0x8
    80008128:	0087d69b          	srliw	a3,a5,0x8
    8000812c:	f8a401a3          	sb	a0,-125(s0)
    80008130:	28b67663          	bgeu	a2,a1,800083bc <__printf+0x614>
    80008134:	00f6f693          	andi	a3,a3,15
    80008138:	00dd86b3          	add	a3,s11,a3
    8000813c:	0006c583          	lbu	a1,0(a3)
    80008140:	00c7d513          	srli	a0,a5,0xc
    80008144:	00c7d69b          	srliw	a3,a5,0xc
    80008148:	f8b40223          	sb	a1,-124(s0)
    8000814c:	29067a63          	bgeu	a2,a6,800083e0 <__printf+0x638>
    80008150:	00f6f693          	andi	a3,a3,15
    80008154:	00dd86b3          	add	a3,s11,a3
    80008158:	0006c583          	lbu	a1,0(a3)
    8000815c:	0107d813          	srli	a6,a5,0x10
    80008160:	0107d69b          	srliw	a3,a5,0x10
    80008164:	f8b402a3          	sb	a1,-123(s0)
    80008168:	28a67263          	bgeu	a2,a0,800083ec <__printf+0x644>
    8000816c:	00f6f693          	andi	a3,a3,15
    80008170:	00dd86b3          	add	a3,s11,a3
    80008174:	0006c683          	lbu	a3,0(a3)
    80008178:	0147d79b          	srliw	a5,a5,0x14
    8000817c:	f8d40323          	sb	a3,-122(s0)
    80008180:	21067663          	bgeu	a2,a6,8000838c <__printf+0x5e4>
    80008184:	02079793          	slli	a5,a5,0x20
    80008188:	0207d793          	srli	a5,a5,0x20
    8000818c:	00fd8db3          	add	s11,s11,a5
    80008190:	000dc683          	lbu	a3,0(s11)
    80008194:	00800793          	li	a5,8
    80008198:	00700c93          	li	s9,7
    8000819c:	f8d403a3          	sb	a3,-121(s0)
    800081a0:	00075c63          	bgez	a4,800081b8 <__printf+0x410>
    800081a4:	f9040713          	addi	a4,s0,-112
    800081a8:	00f70733          	add	a4,a4,a5
    800081ac:	02d00693          	li	a3,45
    800081b0:	fed70823          	sb	a3,-16(a4)
    800081b4:	00078c93          	mv	s9,a5
    800081b8:	f8040793          	addi	a5,s0,-128
    800081bc:	01978cb3          	add	s9,a5,s9
    800081c0:	f7f40d13          	addi	s10,s0,-129
    800081c4:	000cc503          	lbu	a0,0(s9)
    800081c8:	fffc8c93          	addi	s9,s9,-1
    800081cc:	00000097          	auipc	ra,0x0
    800081d0:	9f8080e7          	jalr	-1544(ra) # 80007bc4 <consputc>
    800081d4:	ff9d18e3          	bne	s10,s9,800081c4 <__printf+0x41c>
    800081d8:	0100006f          	j	800081e8 <__printf+0x440>
    800081dc:	00000097          	auipc	ra,0x0
    800081e0:	9e8080e7          	jalr	-1560(ra) # 80007bc4 <consputc>
    800081e4:	000c8493          	mv	s1,s9
    800081e8:	00094503          	lbu	a0,0(s2)
    800081ec:	c60510e3          	bnez	a0,80007e4c <__printf+0xa4>
    800081f0:	e40c0ee3          	beqz	s8,8000804c <__printf+0x2a4>
    800081f4:	00006517          	auipc	a0,0x6
    800081f8:	d3c50513          	addi	a0,a0,-708 # 8000df30 <pr>
    800081fc:	00001097          	auipc	ra,0x1
    80008200:	94c080e7          	jalr	-1716(ra) # 80008b48 <release>
    80008204:	e49ff06f          	j	8000804c <__printf+0x2a4>
    80008208:	f7843783          	ld	a5,-136(s0)
    8000820c:	03000513          	li	a0,48
    80008210:	01000d13          	li	s10,16
    80008214:	00878713          	addi	a4,a5,8
    80008218:	0007bc83          	ld	s9,0(a5)
    8000821c:	f6e43c23          	sd	a4,-136(s0)
    80008220:	00000097          	auipc	ra,0x0
    80008224:	9a4080e7          	jalr	-1628(ra) # 80007bc4 <consputc>
    80008228:	07800513          	li	a0,120
    8000822c:	00000097          	auipc	ra,0x0
    80008230:	998080e7          	jalr	-1640(ra) # 80007bc4 <consputc>
    80008234:	00002d97          	auipc	s11,0x2
    80008238:	5ecd8d93          	addi	s11,s11,1516 # 8000a820 <digits>
    8000823c:	03ccd793          	srli	a5,s9,0x3c
    80008240:	00fd87b3          	add	a5,s11,a5
    80008244:	0007c503          	lbu	a0,0(a5)
    80008248:	fffd0d1b          	addiw	s10,s10,-1
    8000824c:	004c9c93          	slli	s9,s9,0x4
    80008250:	00000097          	auipc	ra,0x0
    80008254:	974080e7          	jalr	-1676(ra) # 80007bc4 <consputc>
    80008258:	fe0d12e3          	bnez	s10,8000823c <__printf+0x494>
    8000825c:	f8dff06f          	j	800081e8 <__printf+0x440>
    80008260:	f7843783          	ld	a5,-136(s0)
    80008264:	0007bc83          	ld	s9,0(a5)
    80008268:	00878793          	addi	a5,a5,8
    8000826c:	f6f43c23          	sd	a5,-136(s0)
    80008270:	000c9a63          	bnez	s9,80008284 <__printf+0x4dc>
    80008274:	1080006f          	j	8000837c <__printf+0x5d4>
    80008278:	001c8c93          	addi	s9,s9,1
    8000827c:	00000097          	auipc	ra,0x0
    80008280:	948080e7          	jalr	-1720(ra) # 80007bc4 <consputc>
    80008284:	000cc503          	lbu	a0,0(s9)
    80008288:	fe0518e3          	bnez	a0,80008278 <__printf+0x4d0>
    8000828c:	f5dff06f          	j	800081e8 <__printf+0x440>
    80008290:	02500513          	li	a0,37
    80008294:	00000097          	auipc	ra,0x0
    80008298:	930080e7          	jalr	-1744(ra) # 80007bc4 <consputc>
    8000829c:	000c8513          	mv	a0,s9
    800082a0:	00000097          	auipc	ra,0x0
    800082a4:	924080e7          	jalr	-1756(ra) # 80007bc4 <consputc>
    800082a8:	f41ff06f          	j	800081e8 <__printf+0x440>
    800082ac:	02500513          	li	a0,37
    800082b0:	00000097          	auipc	ra,0x0
    800082b4:	914080e7          	jalr	-1772(ra) # 80007bc4 <consputc>
    800082b8:	f31ff06f          	j	800081e8 <__printf+0x440>
    800082bc:	00030513          	mv	a0,t1
    800082c0:	00000097          	auipc	ra,0x0
    800082c4:	7bc080e7          	jalr	1980(ra) # 80008a7c <acquire>
    800082c8:	b4dff06f          	j	80007e14 <__printf+0x6c>
    800082cc:	40c0053b          	negw	a0,a2
    800082d0:	00a00713          	li	a4,10
    800082d4:	02e576bb          	remuw	a3,a0,a4
    800082d8:	00002d97          	auipc	s11,0x2
    800082dc:	548d8d93          	addi	s11,s11,1352 # 8000a820 <digits>
    800082e0:	ff700593          	li	a1,-9
    800082e4:	02069693          	slli	a3,a3,0x20
    800082e8:	0206d693          	srli	a3,a3,0x20
    800082ec:	00dd86b3          	add	a3,s11,a3
    800082f0:	0006c683          	lbu	a3,0(a3)
    800082f4:	02e557bb          	divuw	a5,a0,a4
    800082f8:	f8d40023          	sb	a3,-128(s0)
    800082fc:	10b65e63          	bge	a2,a1,80008418 <__printf+0x670>
    80008300:	06300593          	li	a1,99
    80008304:	02e7f6bb          	remuw	a3,a5,a4
    80008308:	02069693          	slli	a3,a3,0x20
    8000830c:	0206d693          	srli	a3,a3,0x20
    80008310:	00dd86b3          	add	a3,s11,a3
    80008314:	0006c683          	lbu	a3,0(a3)
    80008318:	02e7d73b          	divuw	a4,a5,a4
    8000831c:	00200793          	li	a5,2
    80008320:	f8d400a3          	sb	a3,-127(s0)
    80008324:	bca5ece3          	bltu	a1,a0,80007efc <__printf+0x154>
    80008328:	ce5ff06f          	j	8000800c <__printf+0x264>
    8000832c:	40e007bb          	negw	a5,a4
    80008330:	00002d97          	auipc	s11,0x2
    80008334:	4f0d8d93          	addi	s11,s11,1264 # 8000a820 <digits>
    80008338:	00f7f693          	andi	a3,a5,15
    8000833c:	00dd86b3          	add	a3,s11,a3
    80008340:	0006c583          	lbu	a1,0(a3)
    80008344:	ff100613          	li	a2,-15
    80008348:	0047d69b          	srliw	a3,a5,0x4
    8000834c:	f8b40023          	sb	a1,-128(s0)
    80008350:	0047d59b          	srliw	a1,a5,0x4
    80008354:	0ac75e63          	bge	a4,a2,80008410 <__printf+0x668>
    80008358:	00f6f693          	andi	a3,a3,15
    8000835c:	00dd86b3          	add	a3,s11,a3
    80008360:	0006c603          	lbu	a2,0(a3)
    80008364:	00f00693          	li	a3,15
    80008368:	0087d79b          	srliw	a5,a5,0x8
    8000836c:	f8c400a3          	sb	a2,-127(s0)
    80008370:	d8b6e4e3          	bltu	a3,a1,800080f8 <__printf+0x350>
    80008374:	00200793          	li	a5,2
    80008378:	e2dff06f          	j	800081a4 <__printf+0x3fc>
    8000837c:	00002c97          	auipc	s9,0x2
    80008380:	484c8c93          	addi	s9,s9,1156 # 8000a800 <_ZZ9kPrintIntmE6digits+0x790>
    80008384:	02800513          	li	a0,40
    80008388:	ef1ff06f          	j	80008278 <__printf+0x4d0>
    8000838c:	00700793          	li	a5,7
    80008390:	00600c93          	li	s9,6
    80008394:	e0dff06f          	j	800081a0 <__printf+0x3f8>
    80008398:	00700793          	li	a5,7
    8000839c:	00600c93          	li	s9,6
    800083a0:	c69ff06f          	j	80008008 <__printf+0x260>
    800083a4:	00300793          	li	a5,3
    800083a8:	00200c93          	li	s9,2
    800083ac:	c5dff06f          	j	80008008 <__printf+0x260>
    800083b0:	00300793          	li	a5,3
    800083b4:	00200c93          	li	s9,2
    800083b8:	de9ff06f          	j	800081a0 <__printf+0x3f8>
    800083bc:	00400793          	li	a5,4
    800083c0:	00300c93          	li	s9,3
    800083c4:	dddff06f          	j	800081a0 <__printf+0x3f8>
    800083c8:	00400793          	li	a5,4
    800083cc:	00300c93          	li	s9,3
    800083d0:	c39ff06f          	j	80008008 <__printf+0x260>
    800083d4:	00500793          	li	a5,5
    800083d8:	00400c93          	li	s9,4
    800083dc:	c2dff06f          	j	80008008 <__printf+0x260>
    800083e0:	00500793          	li	a5,5
    800083e4:	00400c93          	li	s9,4
    800083e8:	db9ff06f          	j	800081a0 <__printf+0x3f8>
    800083ec:	00600793          	li	a5,6
    800083f0:	00500c93          	li	s9,5
    800083f4:	dadff06f          	j	800081a0 <__printf+0x3f8>
    800083f8:	00600793          	li	a5,6
    800083fc:	00500c93          	li	s9,5
    80008400:	c09ff06f          	j	80008008 <__printf+0x260>
    80008404:	00800793          	li	a5,8
    80008408:	00700c93          	li	s9,7
    8000840c:	bfdff06f          	j	80008008 <__printf+0x260>
    80008410:	00100793          	li	a5,1
    80008414:	d91ff06f          	j	800081a4 <__printf+0x3fc>
    80008418:	00100793          	li	a5,1
    8000841c:	bf1ff06f          	j	8000800c <__printf+0x264>
    80008420:	00900793          	li	a5,9
    80008424:	00800c93          	li	s9,8
    80008428:	be1ff06f          	j	80008008 <__printf+0x260>
    8000842c:	00002517          	auipc	a0,0x2
    80008430:	3dc50513          	addi	a0,a0,988 # 8000a808 <_ZZ9kPrintIntmE6digits+0x798>
    80008434:	00000097          	auipc	ra,0x0
    80008438:	918080e7          	jalr	-1768(ra) # 80007d4c <panic>

000000008000843c <printfinit>:
    8000843c:	fe010113          	addi	sp,sp,-32
    80008440:	00813823          	sd	s0,16(sp)
    80008444:	00913423          	sd	s1,8(sp)
    80008448:	00113c23          	sd	ra,24(sp)
    8000844c:	02010413          	addi	s0,sp,32
    80008450:	00006497          	auipc	s1,0x6
    80008454:	ae048493          	addi	s1,s1,-1312 # 8000df30 <pr>
    80008458:	00048513          	mv	a0,s1
    8000845c:	00002597          	auipc	a1,0x2
    80008460:	3bc58593          	addi	a1,a1,956 # 8000a818 <_ZZ9kPrintIntmE6digits+0x7a8>
    80008464:	00000097          	auipc	ra,0x0
    80008468:	5f4080e7          	jalr	1524(ra) # 80008a58 <initlock>
    8000846c:	01813083          	ld	ra,24(sp)
    80008470:	01013403          	ld	s0,16(sp)
    80008474:	0004ac23          	sw	zero,24(s1)
    80008478:	00813483          	ld	s1,8(sp)
    8000847c:	02010113          	addi	sp,sp,32
    80008480:	00008067          	ret

0000000080008484 <uartinit>:
    80008484:	ff010113          	addi	sp,sp,-16
    80008488:	00813423          	sd	s0,8(sp)
    8000848c:	01010413          	addi	s0,sp,16
    80008490:	100007b7          	lui	a5,0x10000
    80008494:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008498:	f8000713          	li	a4,-128
    8000849c:	00e781a3          	sb	a4,3(a5)
    800084a0:	00300713          	li	a4,3
    800084a4:	00e78023          	sb	a4,0(a5)
    800084a8:	000780a3          	sb	zero,1(a5)
    800084ac:	00e781a3          	sb	a4,3(a5)
    800084b0:	00700693          	li	a3,7
    800084b4:	00d78123          	sb	a3,2(a5)
    800084b8:	00e780a3          	sb	a4,1(a5)
    800084bc:	00813403          	ld	s0,8(sp)
    800084c0:	01010113          	addi	sp,sp,16
    800084c4:	00008067          	ret

00000000800084c8 <uartputc>:
    800084c8:	00004797          	auipc	a5,0x4
    800084cc:	6907a783          	lw	a5,1680(a5) # 8000cb58 <panicked>
    800084d0:	00078463          	beqz	a5,800084d8 <uartputc+0x10>
    800084d4:	0000006f          	j	800084d4 <uartputc+0xc>
    800084d8:	fd010113          	addi	sp,sp,-48
    800084dc:	02813023          	sd	s0,32(sp)
    800084e0:	00913c23          	sd	s1,24(sp)
    800084e4:	01213823          	sd	s2,16(sp)
    800084e8:	01313423          	sd	s3,8(sp)
    800084ec:	02113423          	sd	ra,40(sp)
    800084f0:	03010413          	addi	s0,sp,48
    800084f4:	00004917          	auipc	s2,0x4
    800084f8:	66c90913          	addi	s2,s2,1644 # 8000cb60 <uart_tx_r>
    800084fc:	00093783          	ld	a5,0(s2)
    80008500:	00004497          	auipc	s1,0x4
    80008504:	66848493          	addi	s1,s1,1640 # 8000cb68 <uart_tx_w>
    80008508:	0004b703          	ld	a4,0(s1)
    8000850c:	02078693          	addi	a3,a5,32
    80008510:	00050993          	mv	s3,a0
    80008514:	02e69c63          	bne	a3,a4,8000854c <uartputc+0x84>
    80008518:	00001097          	auipc	ra,0x1
    8000851c:	834080e7          	jalr	-1996(ra) # 80008d4c <push_on>
    80008520:	00093783          	ld	a5,0(s2)
    80008524:	0004b703          	ld	a4,0(s1)
    80008528:	02078793          	addi	a5,a5,32
    8000852c:	00e79463          	bne	a5,a4,80008534 <uartputc+0x6c>
    80008530:	0000006f          	j	80008530 <uartputc+0x68>
    80008534:	00001097          	auipc	ra,0x1
    80008538:	88c080e7          	jalr	-1908(ra) # 80008dc0 <pop_on>
    8000853c:	00093783          	ld	a5,0(s2)
    80008540:	0004b703          	ld	a4,0(s1)
    80008544:	02078693          	addi	a3,a5,32
    80008548:	fce688e3          	beq	a3,a4,80008518 <uartputc+0x50>
    8000854c:	01f77693          	andi	a3,a4,31
    80008550:	00006597          	auipc	a1,0x6
    80008554:	a0058593          	addi	a1,a1,-1536 # 8000df50 <uart_tx_buf>
    80008558:	00d586b3          	add	a3,a1,a3
    8000855c:	00170713          	addi	a4,a4,1
    80008560:	01368023          	sb	s3,0(a3)
    80008564:	00e4b023          	sd	a4,0(s1)
    80008568:	10000637          	lui	a2,0x10000
    8000856c:	02f71063          	bne	a4,a5,8000858c <uartputc+0xc4>
    80008570:	0340006f          	j	800085a4 <uartputc+0xdc>
    80008574:	00074703          	lbu	a4,0(a4)
    80008578:	00f93023          	sd	a5,0(s2)
    8000857c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008580:	00093783          	ld	a5,0(s2)
    80008584:	0004b703          	ld	a4,0(s1)
    80008588:	00f70e63          	beq	a4,a5,800085a4 <uartputc+0xdc>
    8000858c:	00564683          	lbu	a3,5(a2)
    80008590:	01f7f713          	andi	a4,a5,31
    80008594:	00e58733          	add	a4,a1,a4
    80008598:	0206f693          	andi	a3,a3,32
    8000859c:	00178793          	addi	a5,a5,1
    800085a0:	fc069ae3          	bnez	a3,80008574 <uartputc+0xac>
    800085a4:	02813083          	ld	ra,40(sp)
    800085a8:	02013403          	ld	s0,32(sp)
    800085ac:	01813483          	ld	s1,24(sp)
    800085b0:	01013903          	ld	s2,16(sp)
    800085b4:	00813983          	ld	s3,8(sp)
    800085b8:	03010113          	addi	sp,sp,48
    800085bc:	00008067          	ret

00000000800085c0 <uartputc_sync>:
    800085c0:	ff010113          	addi	sp,sp,-16
    800085c4:	00813423          	sd	s0,8(sp)
    800085c8:	01010413          	addi	s0,sp,16
    800085cc:	00004717          	auipc	a4,0x4
    800085d0:	58c72703          	lw	a4,1420(a4) # 8000cb58 <panicked>
    800085d4:	02071663          	bnez	a4,80008600 <uartputc_sync+0x40>
    800085d8:	00050793          	mv	a5,a0
    800085dc:	100006b7          	lui	a3,0x10000
    800085e0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800085e4:	02077713          	andi	a4,a4,32
    800085e8:	fe070ce3          	beqz	a4,800085e0 <uartputc_sync+0x20>
    800085ec:	0ff7f793          	andi	a5,a5,255
    800085f0:	00f68023          	sb	a5,0(a3)
    800085f4:	00813403          	ld	s0,8(sp)
    800085f8:	01010113          	addi	sp,sp,16
    800085fc:	00008067          	ret
    80008600:	0000006f          	j	80008600 <uartputc_sync+0x40>

0000000080008604 <uartstart>:
    80008604:	ff010113          	addi	sp,sp,-16
    80008608:	00813423          	sd	s0,8(sp)
    8000860c:	01010413          	addi	s0,sp,16
    80008610:	00004617          	auipc	a2,0x4
    80008614:	55060613          	addi	a2,a2,1360 # 8000cb60 <uart_tx_r>
    80008618:	00004517          	auipc	a0,0x4
    8000861c:	55050513          	addi	a0,a0,1360 # 8000cb68 <uart_tx_w>
    80008620:	00063783          	ld	a5,0(a2)
    80008624:	00053703          	ld	a4,0(a0)
    80008628:	04f70263          	beq	a4,a5,8000866c <uartstart+0x68>
    8000862c:	100005b7          	lui	a1,0x10000
    80008630:	00006817          	auipc	a6,0x6
    80008634:	92080813          	addi	a6,a6,-1760 # 8000df50 <uart_tx_buf>
    80008638:	01c0006f          	j	80008654 <uartstart+0x50>
    8000863c:	0006c703          	lbu	a4,0(a3)
    80008640:	00f63023          	sd	a5,0(a2)
    80008644:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008648:	00063783          	ld	a5,0(a2)
    8000864c:	00053703          	ld	a4,0(a0)
    80008650:	00f70e63          	beq	a4,a5,8000866c <uartstart+0x68>
    80008654:	01f7f713          	andi	a4,a5,31
    80008658:	00e806b3          	add	a3,a6,a4
    8000865c:	0055c703          	lbu	a4,5(a1)
    80008660:	00178793          	addi	a5,a5,1
    80008664:	02077713          	andi	a4,a4,32
    80008668:	fc071ae3          	bnez	a4,8000863c <uartstart+0x38>
    8000866c:	00813403          	ld	s0,8(sp)
    80008670:	01010113          	addi	sp,sp,16
    80008674:	00008067          	ret

0000000080008678 <uartgetc>:
    80008678:	ff010113          	addi	sp,sp,-16
    8000867c:	00813423          	sd	s0,8(sp)
    80008680:	01010413          	addi	s0,sp,16
    80008684:	10000737          	lui	a4,0x10000
    80008688:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000868c:	0017f793          	andi	a5,a5,1
    80008690:	00078c63          	beqz	a5,800086a8 <uartgetc+0x30>
    80008694:	00074503          	lbu	a0,0(a4)
    80008698:	0ff57513          	andi	a0,a0,255
    8000869c:	00813403          	ld	s0,8(sp)
    800086a0:	01010113          	addi	sp,sp,16
    800086a4:	00008067          	ret
    800086a8:	fff00513          	li	a0,-1
    800086ac:	ff1ff06f          	j	8000869c <uartgetc+0x24>

00000000800086b0 <uartintr>:
    800086b0:	100007b7          	lui	a5,0x10000
    800086b4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800086b8:	0017f793          	andi	a5,a5,1
    800086bc:	0a078463          	beqz	a5,80008764 <uartintr+0xb4>
    800086c0:	fe010113          	addi	sp,sp,-32
    800086c4:	00813823          	sd	s0,16(sp)
    800086c8:	00913423          	sd	s1,8(sp)
    800086cc:	00113c23          	sd	ra,24(sp)
    800086d0:	02010413          	addi	s0,sp,32
    800086d4:	100004b7          	lui	s1,0x10000
    800086d8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800086dc:	0ff57513          	andi	a0,a0,255
    800086e0:	fffff097          	auipc	ra,0xfffff
    800086e4:	534080e7          	jalr	1332(ra) # 80007c14 <consoleintr>
    800086e8:	0054c783          	lbu	a5,5(s1)
    800086ec:	0017f793          	andi	a5,a5,1
    800086f0:	fe0794e3          	bnez	a5,800086d8 <uartintr+0x28>
    800086f4:	00004617          	auipc	a2,0x4
    800086f8:	46c60613          	addi	a2,a2,1132 # 8000cb60 <uart_tx_r>
    800086fc:	00004517          	auipc	a0,0x4
    80008700:	46c50513          	addi	a0,a0,1132 # 8000cb68 <uart_tx_w>
    80008704:	00063783          	ld	a5,0(a2)
    80008708:	00053703          	ld	a4,0(a0)
    8000870c:	04f70263          	beq	a4,a5,80008750 <uartintr+0xa0>
    80008710:	100005b7          	lui	a1,0x10000
    80008714:	00006817          	auipc	a6,0x6
    80008718:	83c80813          	addi	a6,a6,-1988 # 8000df50 <uart_tx_buf>
    8000871c:	01c0006f          	j	80008738 <uartintr+0x88>
    80008720:	0006c703          	lbu	a4,0(a3)
    80008724:	00f63023          	sd	a5,0(a2)
    80008728:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000872c:	00063783          	ld	a5,0(a2)
    80008730:	00053703          	ld	a4,0(a0)
    80008734:	00f70e63          	beq	a4,a5,80008750 <uartintr+0xa0>
    80008738:	01f7f713          	andi	a4,a5,31
    8000873c:	00e806b3          	add	a3,a6,a4
    80008740:	0055c703          	lbu	a4,5(a1)
    80008744:	00178793          	addi	a5,a5,1
    80008748:	02077713          	andi	a4,a4,32
    8000874c:	fc071ae3          	bnez	a4,80008720 <uartintr+0x70>
    80008750:	01813083          	ld	ra,24(sp)
    80008754:	01013403          	ld	s0,16(sp)
    80008758:	00813483          	ld	s1,8(sp)
    8000875c:	02010113          	addi	sp,sp,32
    80008760:	00008067          	ret
    80008764:	00004617          	auipc	a2,0x4
    80008768:	3fc60613          	addi	a2,a2,1020 # 8000cb60 <uart_tx_r>
    8000876c:	00004517          	auipc	a0,0x4
    80008770:	3fc50513          	addi	a0,a0,1020 # 8000cb68 <uart_tx_w>
    80008774:	00063783          	ld	a5,0(a2)
    80008778:	00053703          	ld	a4,0(a0)
    8000877c:	04f70263          	beq	a4,a5,800087c0 <uartintr+0x110>
    80008780:	100005b7          	lui	a1,0x10000
    80008784:	00005817          	auipc	a6,0x5
    80008788:	7cc80813          	addi	a6,a6,1996 # 8000df50 <uart_tx_buf>
    8000878c:	01c0006f          	j	800087a8 <uartintr+0xf8>
    80008790:	0006c703          	lbu	a4,0(a3)
    80008794:	00f63023          	sd	a5,0(a2)
    80008798:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000879c:	00063783          	ld	a5,0(a2)
    800087a0:	00053703          	ld	a4,0(a0)
    800087a4:	02f70063          	beq	a4,a5,800087c4 <uartintr+0x114>
    800087a8:	01f7f713          	andi	a4,a5,31
    800087ac:	00e806b3          	add	a3,a6,a4
    800087b0:	0055c703          	lbu	a4,5(a1)
    800087b4:	00178793          	addi	a5,a5,1
    800087b8:	02077713          	andi	a4,a4,32
    800087bc:	fc071ae3          	bnez	a4,80008790 <uartintr+0xe0>
    800087c0:	00008067          	ret
    800087c4:	00008067          	ret

00000000800087c8 <kinit>:
    800087c8:	fc010113          	addi	sp,sp,-64
    800087cc:	02913423          	sd	s1,40(sp)
    800087d0:	fffff7b7          	lui	a5,0xfffff
    800087d4:	00006497          	auipc	s1,0x6
    800087d8:	79b48493          	addi	s1,s1,1947 # 8000ef6f <end+0xfff>
    800087dc:	02813823          	sd	s0,48(sp)
    800087e0:	01313c23          	sd	s3,24(sp)
    800087e4:	00f4f4b3          	and	s1,s1,a5
    800087e8:	02113c23          	sd	ra,56(sp)
    800087ec:	03213023          	sd	s2,32(sp)
    800087f0:	01413823          	sd	s4,16(sp)
    800087f4:	01513423          	sd	s5,8(sp)
    800087f8:	04010413          	addi	s0,sp,64
    800087fc:	000017b7          	lui	a5,0x1
    80008800:	01100993          	li	s3,17
    80008804:	00f487b3          	add	a5,s1,a5
    80008808:	01b99993          	slli	s3,s3,0x1b
    8000880c:	06f9e063          	bltu	s3,a5,8000886c <kinit+0xa4>
    80008810:	00005a97          	auipc	s5,0x5
    80008814:	760a8a93          	addi	s5,s5,1888 # 8000df70 <end>
    80008818:	0754ec63          	bltu	s1,s5,80008890 <kinit+0xc8>
    8000881c:	0734fa63          	bgeu	s1,s3,80008890 <kinit+0xc8>
    80008820:	00088a37          	lui	s4,0x88
    80008824:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008828:	00004917          	auipc	s2,0x4
    8000882c:	34890913          	addi	s2,s2,840 # 8000cb70 <kmem>
    80008830:	00ca1a13          	slli	s4,s4,0xc
    80008834:	0140006f          	j	80008848 <kinit+0x80>
    80008838:	000017b7          	lui	a5,0x1
    8000883c:	00f484b3          	add	s1,s1,a5
    80008840:	0554e863          	bltu	s1,s5,80008890 <kinit+0xc8>
    80008844:	0534f663          	bgeu	s1,s3,80008890 <kinit+0xc8>
    80008848:	00001637          	lui	a2,0x1
    8000884c:	00100593          	li	a1,1
    80008850:	00048513          	mv	a0,s1
    80008854:	00000097          	auipc	ra,0x0
    80008858:	5e4080e7          	jalr	1508(ra) # 80008e38 <__memset>
    8000885c:	00093783          	ld	a5,0(s2)
    80008860:	00f4b023          	sd	a5,0(s1)
    80008864:	00993023          	sd	s1,0(s2)
    80008868:	fd4498e3          	bne	s1,s4,80008838 <kinit+0x70>
    8000886c:	03813083          	ld	ra,56(sp)
    80008870:	03013403          	ld	s0,48(sp)
    80008874:	02813483          	ld	s1,40(sp)
    80008878:	02013903          	ld	s2,32(sp)
    8000887c:	01813983          	ld	s3,24(sp)
    80008880:	01013a03          	ld	s4,16(sp)
    80008884:	00813a83          	ld	s5,8(sp)
    80008888:	04010113          	addi	sp,sp,64
    8000888c:	00008067          	ret
    80008890:	00002517          	auipc	a0,0x2
    80008894:	fa850513          	addi	a0,a0,-88 # 8000a838 <digits+0x18>
    80008898:	fffff097          	auipc	ra,0xfffff
    8000889c:	4b4080e7          	jalr	1204(ra) # 80007d4c <panic>

00000000800088a0 <freerange>:
    800088a0:	fc010113          	addi	sp,sp,-64
    800088a4:	000017b7          	lui	a5,0x1
    800088a8:	02913423          	sd	s1,40(sp)
    800088ac:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800088b0:	009504b3          	add	s1,a0,s1
    800088b4:	fffff537          	lui	a0,0xfffff
    800088b8:	02813823          	sd	s0,48(sp)
    800088bc:	02113c23          	sd	ra,56(sp)
    800088c0:	03213023          	sd	s2,32(sp)
    800088c4:	01313c23          	sd	s3,24(sp)
    800088c8:	01413823          	sd	s4,16(sp)
    800088cc:	01513423          	sd	s5,8(sp)
    800088d0:	01613023          	sd	s6,0(sp)
    800088d4:	04010413          	addi	s0,sp,64
    800088d8:	00a4f4b3          	and	s1,s1,a0
    800088dc:	00f487b3          	add	a5,s1,a5
    800088e0:	06f5e463          	bltu	a1,a5,80008948 <freerange+0xa8>
    800088e4:	00005a97          	auipc	s5,0x5
    800088e8:	68ca8a93          	addi	s5,s5,1676 # 8000df70 <end>
    800088ec:	0954e263          	bltu	s1,s5,80008970 <freerange+0xd0>
    800088f0:	01100993          	li	s3,17
    800088f4:	01b99993          	slli	s3,s3,0x1b
    800088f8:	0734fc63          	bgeu	s1,s3,80008970 <freerange+0xd0>
    800088fc:	00058a13          	mv	s4,a1
    80008900:	00004917          	auipc	s2,0x4
    80008904:	27090913          	addi	s2,s2,624 # 8000cb70 <kmem>
    80008908:	00002b37          	lui	s6,0x2
    8000890c:	0140006f          	j	80008920 <freerange+0x80>
    80008910:	000017b7          	lui	a5,0x1
    80008914:	00f484b3          	add	s1,s1,a5
    80008918:	0554ec63          	bltu	s1,s5,80008970 <freerange+0xd0>
    8000891c:	0534fa63          	bgeu	s1,s3,80008970 <freerange+0xd0>
    80008920:	00001637          	lui	a2,0x1
    80008924:	00100593          	li	a1,1
    80008928:	00048513          	mv	a0,s1
    8000892c:	00000097          	auipc	ra,0x0
    80008930:	50c080e7          	jalr	1292(ra) # 80008e38 <__memset>
    80008934:	00093703          	ld	a4,0(s2)
    80008938:	016487b3          	add	a5,s1,s6
    8000893c:	00e4b023          	sd	a4,0(s1)
    80008940:	00993023          	sd	s1,0(s2)
    80008944:	fcfa76e3          	bgeu	s4,a5,80008910 <freerange+0x70>
    80008948:	03813083          	ld	ra,56(sp)
    8000894c:	03013403          	ld	s0,48(sp)
    80008950:	02813483          	ld	s1,40(sp)
    80008954:	02013903          	ld	s2,32(sp)
    80008958:	01813983          	ld	s3,24(sp)
    8000895c:	01013a03          	ld	s4,16(sp)
    80008960:	00813a83          	ld	s5,8(sp)
    80008964:	00013b03          	ld	s6,0(sp)
    80008968:	04010113          	addi	sp,sp,64
    8000896c:	00008067          	ret
    80008970:	00002517          	auipc	a0,0x2
    80008974:	ec850513          	addi	a0,a0,-312 # 8000a838 <digits+0x18>
    80008978:	fffff097          	auipc	ra,0xfffff
    8000897c:	3d4080e7          	jalr	980(ra) # 80007d4c <panic>

0000000080008980 <kfree>:
    80008980:	fe010113          	addi	sp,sp,-32
    80008984:	00813823          	sd	s0,16(sp)
    80008988:	00113c23          	sd	ra,24(sp)
    8000898c:	00913423          	sd	s1,8(sp)
    80008990:	02010413          	addi	s0,sp,32
    80008994:	03451793          	slli	a5,a0,0x34
    80008998:	04079c63          	bnez	a5,800089f0 <kfree+0x70>
    8000899c:	00005797          	auipc	a5,0x5
    800089a0:	5d478793          	addi	a5,a5,1492 # 8000df70 <end>
    800089a4:	00050493          	mv	s1,a0
    800089a8:	04f56463          	bltu	a0,a5,800089f0 <kfree+0x70>
    800089ac:	01100793          	li	a5,17
    800089b0:	01b79793          	slli	a5,a5,0x1b
    800089b4:	02f57e63          	bgeu	a0,a5,800089f0 <kfree+0x70>
    800089b8:	00001637          	lui	a2,0x1
    800089bc:	00100593          	li	a1,1
    800089c0:	00000097          	auipc	ra,0x0
    800089c4:	478080e7          	jalr	1144(ra) # 80008e38 <__memset>
    800089c8:	00004797          	auipc	a5,0x4
    800089cc:	1a878793          	addi	a5,a5,424 # 8000cb70 <kmem>
    800089d0:	0007b703          	ld	a4,0(a5)
    800089d4:	01813083          	ld	ra,24(sp)
    800089d8:	01013403          	ld	s0,16(sp)
    800089dc:	00e4b023          	sd	a4,0(s1)
    800089e0:	0097b023          	sd	s1,0(a5)
    800089e4:	00813483          	ld	s1,8(sp)
    800089e8:	02010113          	addi	sp,sp,32
    800089ec:	00008067          	ret
    800089f0:	00002517          	auipc	a0,0x2
    800089f4:	e4850513          	addi	a0,a0,-440 # 8000a838 <digits+0x18>
    800089f8:	fffff097          	auipc	ra,0xfffff
    800089fc:	354080e7          	jalr	852(ra) # 80007d4c <panic>

0000000080008a00 <kalloc>:
    80008a00:	fe010113          	addi	sp,sp,-32
    80008a04:	00813823          	sd	s0,16(sp)
    80008a08:	00913423          	sd	s1,8(sp)
    80008a0c:	00113c23          	sd	ra,24(sp)
    80008a10:	02010413          	addi	s0,sp,32
    80008a14:	00004797          	auipc	a5,0x4
    80008a18:	15c78793          	addi	a5,a5,348 # 8000cb70 <kmem>
    80008a1c:	0007b483          	ld	s1,0(a5)
    80008a20:	02048063          	beqz	s1,80008a40 <kalloc+0x40>
    80008a24:	0004b703          	ld	a4,0(s1)
    80008a28:	00001637          	lui	a2,0x1
    80008a2c:	00500593          	li	a1,5
    80008a30:	00048513          	mv	a0,s1
    80008a34:	00e7b023          	sd	a4,0(a5)
    80008a38:	00000097          	auipc	ra,0x0
    80008a3c:	400080e7          	jalr	1024(ra) # 80008e38 <__memset>
    80008a40:	01813083          	ld	ra,24(sp)
    80008a44:	01013403          	ld	s0,16(sp)
    80008a48:	00048513          	mv	a0,s1
    80008a4c:	00813483          	ld	s1,8(sp)
    80008a50:	02010113          	addi	sp,sp,32
    80008a54:	00008067          	ret

0000000080008a58 <initlock>:
    80008a58:	ff010113          	addi	sp,sp,-16
    80008a5c:	00813423          	sd	s0,8(sp)
    80008a60:	01010413          	addi	s0,sp,16
    80008a64:	00813403          	ld	s0,8(sp)
    80008a68:	00b53423          	sd	a1,8(a0)
    80008a6c:	00052023          	sw	zero,0(a0)
    80008a70:	00053823          	sd	zero,16(a0)
    80008a74:	01010113          	addi	sp,sp,16
    80008a78:	00008067          	ret

0000000080008a7c <acquire>:
    80008a7c:	fe010113          	addi	sp,sp,-32
    80008a80:	00813823          	sd	s0,16(sp)
    80008a84:	00913423          	sd	s1,8(sp)
    80008a88:	00113c23          	sd	ra,24(sp)
    80008a8c:	01213023          	sd	s2,0(sp)
    80008a90:	02010413          	addi	s0,sp,32
    80008a94:	00050493          	mv	s1,a0
    80008a98:	10002973          	csrr	s2,sstatus
    80008a9c:	100027f3          	csrr	a5,sstatus
    80008aa0:	ffd7f793          	andi	a5,a5,-3
    80008aa4:	10079073          	csrw	sstatus,a5
    80008aa8:	fffff097          	auipc	ra,0xfffff
    80008aac:	8ec080e7          	jalr	-1812(ra) # 80007394 <mycpu>
    80008ab0:	07852783          	lw	a5,120(a0)
    80008ab4:	06078e63          	beqz	a5,80008b30 <acquire+0xb4>
    80008ab8:	fffff097          	auipc	ra,0xfffff
    80008abc:	8dc080e7          	jalr	-1828(ra) # 80007394 <mycpu>
    80008ac0:	07852783          	lw	a5,120(a0)
    80008ac4:	0004a703          	lw	a4,0(s1)
    80008ac8:	0017879b          	addiw	a5,a5,1
    80008acc:	06f52c23          	sw	a5,120(a0)
    80008ad0:	04071063          	bnez	a4,80008b10 <acquire+0x94>
    80008ad4:	00100713          	li	a4,1
    80008ad8:	00070793          	mv	a5,a4
    80008adc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008ae0:	0007879b          	sext.w	a5,a5
    80008ae4:	fe079ae3          	bnez	a5,80008ad8 <acquire+0x5c>
    80008ae8:	0ff0000f          	fence
    80008aec:	fffff097          	auipc	ra,0xfffff
    80008af0:	8a8080e7          	jalr	-1880(ra) # 80007394 <mycpu>
    80008af4:	01813083          	ld	ra,24(sp)
    80008af8:	01013403          	ld	s0,16(sp)
    80008afc:	00a4b823          	sd	a0,16(s1)
    80008b00:	00013903          	ld	s2,0(sp)
    80008b04:	00813483          	ld	s1,8(sp)
    80008b08:	02010113          	addi	sp,sp,32
    80008b0c:	00008067          	ret
    80008b10:	0104b903          	ld	s2,16(s1)
    80008b14:	fffff097          	auipc	ra,0xfffff
    80008b18:	880080e7          	jalr	-1920(ra) # 80007394 <mycpu>
    80008b1c:	faa91ce3          	bne	s2,a0,80008ad4 <acquire+0x58>
    80008b20:	00002517          	auipc	a0,0x2
    80008b24:	d2050513          	addi	a0,a0,-736 # 8000a840 <digits+0x20>
    80008b28:	fffff097          	auipc	ra,0xfffff
    80008b2c:	224080e7          	jalr	548(ra) # 80007d4c <panic>
    80008b30:	00195913          	srli	s2,s2,0x1
    80008b34:	fffff097          	auipc	ra,0xfffff
    80008b38:	860080e7          	jalr	-1952(ra) # 80007394 <mycpu>
    80008b3c:	00197913          	andi	s2,s2,1
    80008b40:	07252e23          	sw	s2,124(a0)
    80008b44:	f75ff06f          	j	80008ab8 <acquire+0x3c>

0000000080008b48 <release>:
    80008b48:	fe010113          	addi	sp,sp,-32
    80008b4c:	00813823          	sd	s0,16(sp)
    80008b50:	00113c23          	sd	ra,24(sp)
    80008b54:	00913423          	sd	s1,8(sp)
    80008b58:	01213023          	sd	s2,0(sp)
    80008b5c:	02010413          	addi	s0,sp,32
    80008b60:	00052783          	lw	a5,0(a0)
    80008b64:	00079a63          	bnez	a5,80008b78 <release+0x30>
    80008b68:	00002517          	auipc	a0,0x2
    80008b6c:	ce050513          	addi	a0,a0,-800 # 8000a848 <digits+0x28>
    80008b70:	fffff097          	auipc	ra,0xfffff
    80008b74:	1dc080e7          	jalr	476(ra) # 80007d4c <panic>
    80008b78:	01053903          	ld	s2,16(a0)
    80008b7c:	00050493          	mv	s1,a0
    80008b80:	fffff097          	auipc	ra,0xfffff
    80008b84:	814080e7          	jalr	-2028(ra) # 80007394 <mycpu>
    80008b88:	fea910e3          	bne	s2,a0,80008b68 <release+0x20>
    80008b8c:	0004b823          	sd	zero,16(s1)
    80008b90:	0ff0000f          	fence
    80008b94:	0f50000f          	fence	iorw,ow
    80008b98:	0804a02f          	amoswap.w	zero,zero,(s1)
    80008b9c:	ffffe097          	auipc	ra,0xffffe
    80008ba0:	7f8080e7          	jalr	2040(ra) # 80007394 <mycpu>
    80008ba4:	100027f3          	csrr	a5,sstatus
    80008ba8:	0027f793          	andi	a5,a5,2
    80008bac:	04079a63          	bnez	a5,80008c00 <release+0xb8>
    80008bb0:	07852783          	lw	a5,120(a0)
    80008bb4:	02f05e63          	blez	a5,80008bf0 <release+0xa8>
    80008bb8:	fff7871b          	addiw	a4,a5,-1
    80008bbc:	06e52c23          	sw	a4,120(a0)
    80008bc0:	00071c63          	bnez	a4,80008bd8 <release+0x90>
    80008bc4:	07c52783          	lw	a5,124(a0)
    80008bc8:	00078863          	beqz	a5,80008bd8 <release+0x90>
    80008bcc:	100027f3          	csrr	a5,sstatus
    80008bd0:	0027e793          	ori	a5,a5,2
    80008bd4:	10079073          	csrw	sstatus,a5
    80008bd8:	01813083          	ld	ra,24(sp)
    80008bdc:	01013403          	ld	s0,16(sp)
    80008be0:	00813483          	ld	s1,8(sp)
    80008be4:	00013903          	ld	s2,0(sp)
    80008be8:	02010113          	addi	sp,sp,32
    80008bec:	00008067          	ret
    80008bf0:	00002517          	auipc	a0,0x2
    80008bf4:	c7850513          	addi	a0,a0,-904 # 8000a868 <digits+0x48>
    80008bf8:	fffff097          	auipc	ra,0xfffff
    80008bfc:	154080e7          	jalr	340(ra) # 80007d4c <panic>
    80008c00:	00002517          	auipc	a0,0x2
    80008c04:	c5050513          	addi	a0,a0,-944 # 8000a850 <digits+0x30>
    80008c08:	fffff097          	auipc	ra,0xfffff
    80008c0c:	144080e7          	jalr	324(ra) # 80007d4c <panic>

0000000080008c10 <holding>:
    80008c10:	00052783          	lw	a5,0(a0)
    80008c14:	00079663          	bnez	a5,80008c20 <holding+0x10>
    80008c18:	00000513          	li	a0,0
    80008c1c:	00008067          	ret
    80008c20:	fe010113          	addi	sp,sp,-32
    80008c24:	00813823          	sd	s0,16(sp)
    80008c28:	00913423          	sd	s1,8(sp)
    80008c2c:	00113c23          	sd	ra,24(sp)
    80008c30:	02010413          	addi	s0,sp,32
    80008c34:	01053483          	ld	s1,16(a0)
    80008c38:	ffffe097          	auipc	ra,0xffffe
    80008c3c:	75c080e7          	jalr	1884(ra) # 80007394 <mycpu>
    80008c40:	01813083          	ld	ra,24(sp)
    80008c44:	01013403          	ld	s0,16(sp)
    80008c48:	40a48533          	sub	a0,s1,a0
    80008c4c:	00153513          	seqz	a0,a0
    80008c50:	00813483          	ld	s1,8(sp)
    80008c54:	02010113          	addi	sp,sp,32
    80008c58:	00008067          	ret

0000000080008c5c <push_off>:
    80008c5c:	fe010113          	addi	sp,sp,-32
    80008c60:	00813823          	sd	s0,16(sp)
    80008c64:	00113c23          	sd	ra,24(sp)
    80008c68:	00913423          	sd	s1,8(sp)
    80008c6c:	02010413          	addi	s0,sp,32
    80008c70:	100024f3          	csrr	s1,sstatus
    80008c74:	100027f3          	csrr	a5,sstatus
    80008c78:	ffd7f793          	andi	a5,a5,-3
    80008c7c:	10079073          	csrw	sstatus,a5
    80008c80:	ffffe097          	auipc	ra,0xffffe
    80008c84:	714080e7          	jalr	1812(ra) # 80007394 <mycpu>
    80008c88:	07852783          	lw	a5,120(a0)
    80008c8c:	02078663          	beqz	a5,80008cb8 <push_off+0x5c>
    80008c90:	ffffe097          	auipc	ra,0xffffe
    80008c94:	704080e7          	jalr	1796(ra) # 80007394 <mycpu>
    80008c98:	07852783          	lw	a5,120(a0)
    80008c9c:	01813083          	ld	ra,24(sp)
    80008ca0:	01013403          	ld	s0,16(sp)
    80008ca4:	0017879b          	addiw	a5,a5,1
    80008ca8:	06f52c23          	sw	a5,120(a0)
    80008cac:	00813483          	ld	s1,8(sp)
    80008cb0:	02010113          	addi	sp,sp,32
    80008cb4:	00008067          	ret
    80008cb8:	0014d493          	srli	s1,s1,0x1
    80008cbc:	ffffe097          	auipc	ra,0xffffe
    80008cc0:	6d8080e7          	jalr	1752(ra) # 80007394 <mycpu>
    80008cc4:	0014f493          	andi	s1,s1,1
    80008cc8:	06952e23          	sw	s1,124(a0)
    80008ccc:	fc5ff06f          	j	80008c90 <push_off+0x34>

0000000080008cd0 <pop_off>:
    80008cd0:	ff010113          	addi	sp,sp,-16
    80008cd4:	00813023          	sd	s0,0(sp)
    80008cd8:	00113423          	sd	ra,8(sp)
    80008cdc:	01010413          	addi	s0,sp,16
    80008ce0:	ffffe097          	auipc	ra,0xffffe
    80008ce4:	6b4080e7          	jalr	1716(ra) # 80007394 <mycpu>
    80008ce8:	100027f3          	csrr	a5,sstatus
    80008cec:	0027f793          	andi	a5,a5,2
    80008cf0:	04079663          	bnez	a5,80008d3c <pop_off+0x6c>
    80008cf4:	07852783          	lw	a5,120(a0)
    80008cf8:	02f05a63          	blez	a5,80008d2c <pop_off+0x5c>
    80008cfc:	fff7871b          	addiw	a4,a5,-1
    80008d00:	06e52c23          	sw	a4,120(a0)
    80008d04:	00071c63          	bnez	a4,80008d1c <pop_off+0x4c>
    80008d08:	07c52783          	lw	a5,124(a0)
    80008d0c:	00078863          	beqz	a5,80008d1c <pop_off+0x4c>
    80008d10:	100027f3          	csrr	a5,sstatus
    80008d14:	0027e793          	ori	a5,a5,2
    80008d18:	10079073          	csrw	sstatus,a5
    80008d1c:	00813083          	ld	ra,8(sp)
    80008d20:	00013403          	ld	s0,0(sp)
    80008d24:	01010113          	addi	sp,sp,16
    80008d28:	00008067          	ret
    80008d2c:	00002517          	auipc	a0,0x2
    80008d30:	b3c50513          	addi	a0,a0,-1220 # 8000a868 <digits+0x48>
    80008d34:	fffff097          	auipc	ra,0xfffff
    80008d38:	018080e7          	jalr	24(ra) # 80007d4c <panic>
    80008d3c:	00002517          	auipc	a0,0x2
    80008d40:	b1450513          	addi	a0,a0,-1260 # 8000a850 <digits+0x30>
    80008d44:	fffff097          	auipc	ra,0xfffff
    80008d48:	008080e7          	jalr	8(ra) # 80007d4c <panic>

0000000080008d4c <push_on>:
    80008d4c:	fe010113          	addi	sp,sp,-32
    80008d50:	00813823          	sd	s0,16(sp)
    80008d54:	00113c23          	sd	ra,24(sp)
    80008d58:	00913423          	sd	s1,8(sp)
    80008d5c:	02010413          	addi	s0,sp,32
    80008d60:	100024f3          	csrr	s1,sstatus
    80008d64:	100027f3          	csrr	a5,sstatus
    80008d68:	0027e793          	ori	a5,a5,2
    80008d6c:	10079073          	csrw	sstatus,a5
    80008d70:	ffffe097          	auipc	ra,0xffffe
    80008d74:	624080e7          	jalr	1572(ra) # 80007394 <mycpu>
    80008d78:	07852783          	lw	a5,120(a0)
    80008d7c:	02078663          	beqz	a5,80008da8 <push_on+0x5c>
    80008d80:	ffffe097          	auipc	ra,0xffffe
    80008d84:	614080e7          	jalr	1556(ra) # 80007394 <mycpu>
    80008d88:	07852783          	lw	a5,120(a0)
    80008d8c:	01813083          	ld	ra,24(sp)
    80008d90:	01013403          	ld	s0,16(sp)
    80008d94:	0017879b          	addiw	a5,a5,1
    80008d98:	06f52c23          	sw	a5,120(a0)
    80008d9c:	00813483          	ld	s1,8(sp)
    80008da0:	02010113          	addi	sp,sp,32
    80008da4:	00008067          	ret
    80008da8:	0014d493          	srli	s1,s1,0x1
    80008dac:	ffffe097          	auipc	ra,0xffffe
    80008db0:	5e8080e7          	jalr	1512(ra) # 80007394 <mycpu>
    80008db4:	0014f493          	andi	s1,s1,1
    80008db8:	06952e23          	sw	s1,124(a0)
    80008dbc:	fc5ff06f          	j	80008d80 <push_on+0x34>

0000000080008dc0 <pop_on>:
    80008dc0:	ff010113          	addi	sp,sp,-16
    80008dc4:	00813023          	sd	s0,0(sp)
    80008dc8:	00113423          	sd	ra,8(sp)
    80008dcc:	01010413          	addi	s0,sp,16
    80008dd0:	ffffe097          	auipc	ra,0xffffe
    80008dd4:	5c4080e7          	jalr	1476(ra) # 80007394 <mycpu>
    80008dd8:	100027f3          	csrr	a5,sstatus
    80008ddc:	0027f793          	andi	a5,a5,2
    80008de0:	04078463          	beqz	a5,80008e28 <pop_on+0x68>
    80008de4:	07852783          	lw	a5,120(a0)
    80008de8:	02f05863          	blez	a5,80008e18 <pop_on+0x58>
    80008dec:	fff7879b          	addiw	a5,a5,-1
    80008df0:	06f52c23          	sw	a5,120(a0)
    80008df4:	07853783          	ld	a5,120(a0)
    80008df8:	00079863          	bnez	a5,80008e08 <pop_on+0x48>
    80008dfc:	100027f3          	csrr	a5,sstatus
    80008e00:	ffd7f793          	andi	a5,a5,-3
    80008e04:	10079073          	csrw	sstatus,a5
    80008e08:	00813083          	ld	ra,8(sp)
    80008e0c:	00013403          	ld	s0,0(sp)
    80008e10:	01010113          	addi	sp,sp,16
    80008e14:	00008067          	ret
    80008e18:	00002517          	auipc	a0,0x2
    80008e1c:	a7850513          	addi	a0,a0,-1416 # 8000a890 <digits+0x70>
    80008e20:	fffff097          	auipc	ra,0xfffff
    80008e24:	f2c080e7          	jalr	-212(ra) # 80007d4c <panic>
    80008e28:	00002517          	auipc	a0,0x2
    80008e2c:	a4850513          	addi	a0,a0,-1464 # 8000a870 <digits+0x50>
    80008e30:	fffff097          	auipc	ra,0xfffff
    80008e34:	f1c080e7          	jalr	-228(ra) # 80007d4c <panic>

0000000080008e38 <__memset>:
    80008e38:	ff010113          	addi	sp,sp,-16
    80008e3c:	00813423          	sd	s0,8(sp)
    80008e40:	01010413          	addi	s0,sp,16
    80008e44:	1a060e63          	beqz	a2,80009000 <__memset+0x1c8>
    80008e48:	40a007b3          	neg	a5,a0
    80008e4c:	0077f793          	andi	a5,a5,7
    80008e50:	00778693          	addi	a3,a5,7
    80008e54:	00b00813          	li	a6,11
    80008e58:	0ff5f593          	andi	a1,a1,255
    80008e5c:	fff6071b          	addiw	a4,a2,-1
    80008e60:	1b06e663          	bltu	a3,a6,8000900c <__memset+0x1d4>
    80008e64:	1cd76463          	bltu	a4,a3,8000902c <__memset+0x1f4>
    80008e68:	1a078e63          	beqz	a5,80009024 <__memset+0x1ec>
    80008e6c:	00b50023          	sb	a1,0(a0)
    80008e70:	00100713          	li	a4,1
    80008e74:	1ae78463          	beq	a5,a4,8000901c <__memset+0x1e4>
    80008e78:	00b500a3          	sb	a1,1(a0)
    80008e7c:	00200713          	li	a4,2
    80008e80:	1ae78a63          	beq	a5,a4,80009034 <__memset+0x1fc>
    80008e84:	00b50123          	sb	a1,2(a0)
    80008e88:	00300713          	li	a4,3
    80008e8c:	18e78463          	beq	a5,a4,80009014 <__memset+0x1dc>
    80008e90:	00b501a3          	sb	a1,3(a0)
    80008e94:	00400713          	li	a4,4
    80008e98:	1ae78263          	beq	a5,a4,8000903c <__memset+0x204>
    80008e9c:	00b50223          	sb	a1,4(a0)
    80008ea0:	00500713          	li	a4,5
    80008ea4:	1ae78063          	beq	a5,a4,80009044 <__memset+0x20c>
    80008ea8:	00b502a3          	sb	a1,5(a0)
    80008eac:	00700713          	li	a4,7
    80008eb0:	18e79e63          	bne	a5,a4,8000904c <__memset+0x214>
    80008eb4:	00b50323          	sb	a1,6(a0)
    80008eb8:	00700e93          	li	t4,7
    80008ebc:	00859713          	slli	a4,a1,0x8
    80008ec0:	00e5e733          	or	a4,a1,a4
    80008ec4:	01059e13          	slli	t3,a1,0x10
    80008ec8:	01c76e33          	or	t3,a4,t3
    80008ecc:	01859313          	slli	t1,a1,0x18
    80008ed0:	006e6333          	or	t1,t3,t1
    80008ed4:	02059893          	slli	a7,a1,0x20
    80008ed8:	40f60e3b          	subw	t3,a2,a5
    80008edc:	011368b3          	or	a7,t1,a7
    80008ee0:	02859813          	slli	a6,a1,0x28
    80008ee4:	0108e833          	or	a6,a7,a6
    80008ee8:	03059693          	slli	a3,a1,0x30
    80008eec:	003e589b          	srliw	a7,t3,0x3
    80008ef0:	00d866b3          	or	a3,a6,a3
    80008ef4:	03859713          	slli	a4,a1,0x38
    80008ef8:	00389813          	slli	a6,a7,0x3
    80008efc:	00f507b3          	add	a5,a0,a5
    80008f00:	00e6e733          	or	a4,a3,a4
    80008f04:	000e089b          	sext.w	a7,t3
    80008f08:	00f806b3          	add	a3,a6,a5
    80008f0c:	00e7b023          	sd	a4,0(a5)
    80008f10:	00878793          	addi	a5,a5,8
    80008f14:	fed79ce3          	bne	a5,a3,80008f0c <__memset+0xd4>
    80008f18:	ff8e7793          	andi	a5,t3,-8
    80008f1c:	0007871b          	sext.w	a4,a5
    80008f20:	01d787bb          	addw	a5,a5,t4
    80008f24:	0ce88e63          	beq	a7,a4,80009000 <__memset+0x1c8>
    80008f28:	00f50733          	add	a4,a0,a5
    80008f2c:	00b70023          	sb	a1,0(a4)
    80008f30:	0017871b          	addiw	a4,a5,1
    80008f34:	0cc77663          	bgeu	a4,a2,80009000 <__memset+0x1c8>
    80008f38:	00e50733          	add	a4,a0,a4
    80008f3c:	00b70023          	sb	a1,0(a4)
    80008f40:	0027871b          	addiw	a4,a5,2
    80008f44:	0ac77e63          	bgeu	a4,a2,80009000 <__memset+0x1c8>
    80008f48:	00e50733          	add	a4,a0,a4
    80008f4c:	00b70023          	sb	a1,0(a4)
    80008f50:	0037871b          	addiw	a4,a5,3
    80008f54:	0ac77663          	bgeu	a4,a2,80009000 <__memset+0x1c8>
    80008f58:	00e50733          	add	a4,a0,a4
    80008f5c:	00b70023          	sb	a1,0(a4)
    80008f60:	0047871b          	addiw	a4,a5,4
    80008f64:	08c77e63          	bgeu	a4,a2,80009000 <__memset+0x1c8>
    80008f68:	00e50733          	add	a4,a0,a4
    80008f6c:	00b70023          	sb	a1,0(a4)
    80008f70:	0057871b          	addiw	a4,a5,5
    80008f74:	08c77663          	bgeu	a4,a2,80009000 <__memset+0x1c8>
    80008f78:	00e50733          	add	a4,a0,a4
    80008f7c:	00b70023          	sb	a1,0(a4)
    80008f80:	0067871b          	addiw	a4,a5,6
    80008f84:	06c77e63          	bgeu	a4,a2,80009000 <__memset+0x1c8>
    80008f88:	00e50733          	add	a4,a0,a4
    80008f8c:	00b70023          	sb	a1,0(a4)
    80008f90:	0077871b          	addiw	a4,a5,7
    80008f94:	06c77663          	bgeu	a4,a2,80009000 <__memset+0x1c8>
    80008f98:	00e50733          	add	a4,a0,a4
    80008f9c:	00b70023          	sb	a1,0(a4)
    80008fa0:	0087871b          	addiw	a4,a5,8
    80008fa4:	04c77e63          	bgeu	a4,a2,80009000 <__memset+0x1c8>
    80008fa8:	00e50733          	add	a4,a0,a4
    80008fac:	00b70023          	sb	a1,0(a4)
    80008fb0:	0097871b          	addiw	a4,a5,9
    80008fb4:	04c77663          	bgeu	a4,a2,80009000 <__memset+0x1c8>
    80008fb8:	00e50733          	add	a4,a0,a4
    80008fbc:	00b70023          	sb	a1,0(a4)
    80008fc0:	00a7871b          	addiw	a4,a5,10
    80008fc4:	02c77e63          	bgeu	a4,a2,80009000 <__memset+0x1c8>
    80008fc8:	00e50733          	add	a4,a0,a4
    80008fcc:	00b70023          	sb	a1,0(a4)
    80008fd0:	00b7871b          	addiw	a4,a5,11
    80008fd4:	02c77663          	bgeu	a4,a2,80009000 <__memset+0x1c8>
    80008fd8:	00e50733          	add	a4,a0,a4
    80008fdc:	00b70023          	sb	a1,0(a4)
    80008fe0:	00c7871b          	addiw	a4,a5,12
    80008fe4:	00c77e63          	bgeu	a4,a2,80009000 <__memset+0x1c8>
    80008fe8:	00e50733          	add	a4,a0,a4
    80008fec:	00b70023          	sb	a1,0(a4)
    80008ff0:	00d7879b          	addiw	a5,a5,13
    80008ff4:	00c7f663          	bgeu	a5,a2,80009000 <__memset+0x1c8>
    80008ff8:	00f507b3          	add	a5,a0,a5
    80008ffc:	00b78023          	sb	a1,0(a5)
    80009000:	00813403          	ld	s0,8(sp)
    80009004:	01010113          	addi	sp,sp,16
    80009008:	00008067          	ret
    8000900c:	00b00693          	li	a3,11
    80009010:	e55ff06f          	j	80008e64 <__memset+0x2c>
    80009014:	00300e93          	li	t4,3
    80009018:	ea5ff06f          	j	80008ebc <__memset+0x84>
    8000901c:	00100e93          	li	t4,1
    80009020:	e9dff06f          	j	80008ebc <__memset+0x84>
    80009024:	00000e93          	li	t4,0
    80009028:	e95ff06f          	j	80008ebc <__memset+0x84>
    8000902c:	00000793          	li	a5,0
    80009030:	ef9ff06f          	j	80008f28 <__memset+0xf0>
    80009034:	00200e93          	li	t4,2
    80009038:	e85ff06f          	j	80008ebc <__memset+0x84>
    8000903c:	00400e93          	li	t4,4
    80009040:	e7dff06f          	j	80008ebc <__memset+0x84>
    80009044:	00500e93          	li	t4,5
    80009048:	e75ff06f          	j	80008ebc <__memset+0x84>
    8000904c:	00600e93          	li	t4,6
    80009050:	e6dff06f          	j	80008ebc <__memset+0x84>

0000000080009054 <__memmove>:
    80009054:	ff010113          	addi	sp,sp,-16
    80009058:	00813423          	sd	s0,8(sp)
    8000905c:	01010413          	addi	s0,sp,16
    80009060:	0e060863          	beqz	a2,80009150 <__memmove+0xfc>
    80009064:	fff6069b          	addiw	a3,a2,-1
    80009068:	0006881b          	sext.w	a6,a3
    8000906c:	0ea5e863          	bltu	a1,a0,8000915c <__memmove+0x108>
    80009070:	00758713          	addi	a4,a1,7
    80009074:	00a5e7b3          	or	a5,a1,a0
    80009078:	40a70733          	sub	a4,a4,a0
    8000907c:	0077f793          	andi	a5,a5,7
    80009080:	00f73713          	sltiu	a4,a4,15
    80009084:	00174713          	xori	a4,a4,1
    80009088:	0017b793          	seqz	a5,a5
    8000908c:	00e7f7b3          	and	a5,a5,a4
    80009090:	10078863          	beqz	a5,800091a0 <__memmove+0x14c>
    80009094:	00900793          	li	a5,9
    80009098:	1107f463          	bgeu	a5,a6,800091a0 <__memmove+0x14c>
    8000909c:	0036581b          	srliw	a6,a2,0x3
    800090a0:	fff8081b          	addiw	a6,a6,-1
    800090a4:	02081813          	slli	a6,a6,0x20
    800090a8:	01d85893          	srli	a7,a6,0x1d
    800090ac:	00858813          	addi	a6,a1,8
    800090b0:	00058793          	mv	a5,a1
    800090b4:	00050713          	mv	a4,a0
    800090b8:	01088833          	add	a6,a7,a6
    800090bc:	0007b883          	ld	a7,0(a5)
    800090c0:	00878793          	addi	a5,a5,8
    800090c4:	00870713          	addi	a4,a4,8
    800090c8:	ff173c23          	sd	a7,-8(a4)
    800090cc:	ff0798e3          	bne	a5,a6,800090bc <__memmove+0x68>
    800090d0:	ff867713          	andi	a4,a2,-8
    800090d4:	02071793          	slli	a5,a4,0x20
    800090d8:	0207d793          	srli	a5,a5,0x20
    800090dc:	00f585b3          	add	a1,a1,a5
    800090e0:	40e686bb          	subw	a3,a3,a4
    800090e4:	00f507b3          	add	a5,a0,a5
    800090e8:	06e60463          	beq	a2,a4,80009150 <__memmove+0xfc>
    800090ec:	0005c703          	lbu	a4,0(a1)
    800090f0:	00e78023          	sb	a4,0(a5)
    800090f4:	04068e63          	beqz	a3,80009150 <__memmove+0xfc>
    800090f8:	0015c603          	lbu	a2,1(a1)
    800090fc:	00100713          	li	a4,1
    80009100:	00c780a3          	sb	a2,1(a5)
    80009104:	04e68663          	beq	a3,a4,80009150 <__memmove+0xfc>
    80009108:	0025c603          	lbu	a2,2(a1)
    8000910c:	00200713          	li	a4,2
    80009110:	00c78123          	sb	a2,2(a5)
    80009114:	02e68e63          	beq	a3,a4,80009150 <__memmove+0xfc>
    80009118:	0035c603          	lbu	a2,3(a1)
    8000911c:	00300713          	li	a4,3
    80009120:	00c781a3          	sb	a2,3(a5)
    80009124:	02e68663          	beq	a3,a4,80009150 <__memmove+0xfc>
    80009128:	0045c603          	lbu	a2,4(a1)
    8000912c:	00400713          	li	a4,4
    80009130:	00c78223          	sb	a2,4(a5)
    80009134:	00e68e63          	beq	a3,a4,80009150 <__memmove+0xfc>
    80009138:	0055c603          	lbu	a2,5(a1)
    8000913c:	00500713          	li	a4,5
    80009140:	00c782a3          	sb	a2,5(a5)
    80009144:	00e68663          	beq	a3,a4,80009150 <__memmove+0xfc>
    80009148:	0065c703          	lbu	a4,6(a1)
    8000914c:	00e78323          	sb	a4,6(a5)
    80009150:	00813403          	ld	s0,8(sp)
    80009154:	01010113          	addi	sp,sp,16
    80009158:	00008067          	ret
    8000915c:	02061713          	slli	a4,a2,0x20
    80009160:	02075713          	srli	a4,a4,0x20
    80009164:	00e587b3          	add	a5,a1,a4
    80009168:	f0f574e3          	bgeu	a0,a5,80009070 <__memmove+0x1c>
    8000916c:	02069613          	slli	a2,a3,0x20
    80009170:	02065613          	srli	a2,a2,0x20
    80009174:	fff64613          	not	a2,a2
    80009178:	00e50733          	add	a4,a0,a4
    8000917c:	00c78633          	add	a2,a5,a2
    80009180:	fff7c683          	lbu	a3,-1(a5)
    80009184:	fff78793          	addi	a5,a5,-1
    80009188:	fff70713          	addi	a4,a4,-1
    8000918c:	00d70023          	sb	a3,0(a4)
    80009190:	fec798e3          	bne	a5,a2,80009180 <__memmove+0x12c>
    80009194:	00813403          	ld	s0,8(sp)
    80009198:	01010113          	addi	sp,sp,16
    8000919c:	00008067          	ret
    800091a0:	02069713          	slli	a4,a3,0x20
    800091a4:	02075713          	srli	a4,a4,0x20
    800091a8:	00170713          	addi	a4,a4,1
    800091ac:	00e50733          	add	a4,a0,a4
    800091b0:	00050793          	mv	a5,a0
    800091b4:	0005c683          	lbu	a3,0(a1)
    800091b8:	00178793          	addi	a5,a5,1
    800091bc:	00158593          	addi	a1,a1,1
    800091c0:	fed78fa3          	sb	a3,-1(a5)
    800091c4:	fee798e3          	bne	a5,a4,800091b4 <__memmove+0x160>
    800091c8:	f89ff06f          	j	80009150 <__memmove+0xfc>
	...
