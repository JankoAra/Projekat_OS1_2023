
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	b0813103          	ld	sp,-1272(sp) # 8000cb08 <_GLOBAL_OFFSET_TABLE_+0x40>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	0a0070ef          	jal	ra,800070bc <start>

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
    80001084:	7b9000ef          	jal	ra,8000203c <interruptRoutine>

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
        Node *next;

        Node(TCB *d) : data(d), next(nullptr) {}

        static void *operator new(size_t size) {
            return mem_alloc(size);
    8000125c:	01000513          	li	a0,16
    80001260:	00000097          	auipc	ra,0x0
    80001264:	0a8080e7          	jalr	168(ra) # 80001308 <_Z9mem_allocm>
        Node(TCB *d) : data(d), next(nullptr) {}
    80001268:	01253023          	sd	s2,0(a0)
    8000126c:	00053423          	sd	zero,8(a0)
            delete node;
        }
    }

    bool isEmpty() const {
        bool ret = front == nullptr;
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
    if (start_routine != nullptr) {
    800013a0:	04058a63          	beqz	a1,800013f4 <_Z13thread_createPP3TCBPFvPvES2_+0x7c>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800013a4:	00001537          	lui	a0,0x1
    800013a8:	00000097          	auipc	ra,0x0
    800013ac:	f60080e7          	jalr	-160(ra) # 80001308 <_Z9mem_allocm>
    800013b0:	00050313          	mv	t1,a0
        if(!stack) return -1;
    800013b4:	04050463          	beqz	a0,800013fc <_Z13thread_createPP3TCBPFvPvES2_+0x84>
    }
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013b8:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013bc:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2, %[function]": :[function] "r"(
            start_routine):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013c0:	00048613          	mv	a2,s1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800013c4:	00090593          	mv	a1,s2
    __asm__ volatile("li a0, 0x11");
    800013c8:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    800013cc:	00000073          	ecall
    //a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800013d0:	00050513          	mv	a0,a0
    800013d4:	0005051b          	sext.w	a0,a0
    return status;
}
    800013d8:	02813083          	ld	ra,40(sp)
    800013dc:	02013403          	ld	s0,32(sp)
    800013e0:	01813483          	ld	s1,24(sp)
    800013e4:	01013903          	ld	s2,16(sp)
    800013e8:	00813983          	ld	s3,8(sp)
    800013ec:	03010113          	addi	sp,sp,48
    800013f0:	00008067          	ret
    uint64* stack = nullptr;
    800013f4:	00000313          	li	t1,0
    800013f8:	fc1ff06f          	j	800013b8 <_Z13thread_createPP3TCBPFvPvES2_+0x40>
        if(!stack) return -1;
    800013fc:	fff00513          	li	a0,-1
    80001400:	fd9ff06f          	j	800013d8 <_Z13thread_createPP3TCBPFvPvES2_+0x60>

0000000080001404 <_Z11thread_exitv>:

int thread_exit() {
    80001404:	ff010113          	addi	sp,sp,-16
    80001408:	00813423          	sd	s0,8(sp)
    8000140c:	01010413          	addi	s0,sp,16
    //nema argumenata, samo kod sistemskog poziva
    __asm__ volatile("li a0, 0x12");
    80001410:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    80001414:	00000073          	ecall

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001418:	00050513          	mv	a0,a0
    return status;
}
    8000141c:	0005051b          	sext.w	a0,a0
    80001420:	00813403          	ld	s0,8(sp)
    80001424:	01010113          	addi	sp,sp,16
    80001428:	00008067          	ret

000000008000142c <_Z15thread_dispatchv>:

void thread_dispatch() {
    8000142c:	ff010113          	addi	sp,sp,-16
    80001430:	00813423          	sd	s0,8(sp)
    80001434:	01010413          	addi	s0,sp,16
    //nema argumenata, samo kod sistemskog poziva
    __asm__ volatile("li a0, 0x13");
    80001438:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    8000143c:	00000073          	ecall

    scall();
    //nema povratne vrednosti
}
    80001440:	00813403          	ld	s0,8(sp)
    80001444:	01010113          	addi	sp,sp,16
    80001448:	00008067          	ret

000000008000144c <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle) {
    8000144c:	ff010113          	addi	sp,sp,-16
    80001450:	00813423          	sd	s0,8(sp)
    80001454:	01010413          	addi	s0,sp,16
    80001458:	00050313          	mv	t1,a0
//stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000145c:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x14");
    80001460:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    80001464:	00000073          	ecall
    //a0 = 0x14
    //a1 = rucka niti na koju se ceka

    scall();
}
    80001468:	00813403          	ld	s0,8(sp)
    8000146c:	01010113          	addi	sp,sp,16
    80001470:	00008067          	ret

0000000080001474 <_Z10time_sleepm>:

int time_sleep(time_t timerPeriods) {
    80001474:	ff010113          	addi	sp,sp,-16
    80001478:	00813423          	sd	s0,8(sp)
    8000147c:	01010413          	addi	s0,sp,16
    80001480:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[time]": :[time] "r"(timerPeriods):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001484:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x31");
    80001488:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    8000148c:	00000073          	ecall
    //a1 = broj perioda tajmera na koji se uspavljuje nit

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001490:	00050513          	mv	a0,a0
    return status;
}
    80001494:	0005051b          	sext.w	a0,a0
    80001498:	00813403          	ld	s0,8(sp)
    8000149c:	01010113          	addi	sp,sp,16
    800014a0:	00008067          	ret

00000000800014a4 <_Z8sem_openPP4KSemj>:

int sem_open(sem_t* handle, unsigned int init) {
    800014a4:	ff010113          	addi	sp,sp,-16
    800014a8:	00813423          	sd	s0,8(sp)
    800014ac:	01010413          	addi	s0,sp,16
    800014b0:	00050313          	mv	t1,a0
    800014b4:	00058e13          	mv	t3,a1
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a2, %[val]": :[val] "r"(init):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800014b8:	000e0613          	mv	a2,t3
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800014bc:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x21");
    800014c0:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    800014c4:	00000073          	ecall

    scall();

    //status == 0 ako je uspesno kreiran semafor; status == -1 ako nije
    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800014c8:	00050513          	mv	a0,a0
    return status;
}
    800014cc:	0005051b          	sext.w	a0,a0
    800014d0:	00813403          	ld	s0,8(sp)
    800014d4:	01010113          	addi	sp,sp,16
    800014d8:	00008067          	ret

00000000800014dc <_Z9sem_closeP4KSem>:

int sem_close(sem_t handle) {
    800014dc:	ff010113          	addi	sp,sp,-16
    800014e0:	00813423          	sd	s0,8(sp)
    800014e4:	01010413          	addi	s0,sp,16
    800014e8:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800014ec:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x22");
    800014f0:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    800014f4:	00000073          	ecall
    //a1 = rucka semafora (pokazivac na semafor u kernelu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800014f8:	00050513          	mv	a0,a0
    return status;
}
    800014fc:	0005051b          	sext.w	a0,a0
    80001500:	00813403          	ld	s0,8(sp)
    80001504:	01010113          	addi	sp,sp,16
    80001508:	00008067          	ret

000000008000150c <_Z8sem_waitP4KSem>:

int sem_wait(sem_t id) {
    8000150c:	ff010113          	addi	sp,sp,-16
    80001510:	00813423          	sd	s0,8(sp)
    80001514:	01010413          	addi	s0,sp,16
    80001518:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(id):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000151c:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x23");
    80001520:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    80001524:	00000073          	ecall
    //a1 = rucka semafora (pokazivac na semafor u kernelu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001528:	00050513          	mv	a0,a0
    return status;
}
    8000152c:	0005051b          	sext.w	a0,a0
    80001530:	00813403          	ld	s0,8(sp)
    80001534:	01010113          	addi	sp,sp,16
    80001538:	00008067          	ret

000000008000153c <_Z10sem_signalP4KSem>:

int sem_signal(sem_t id) {
    8000153c:	ff010113          	addi	sp,sp,-16
    80001540:	00813423          	sd	s0,8(sp)
    80001544:	01010413          	addi	s0,sp,16
    80001548:	00050313          	mv	t1,a0
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(id):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000154c:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x24");
    80001550:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    80001554:	00000073          	ecall
    //a1 = rucka semafora (pokazivac na semafor u kernelu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001558:	00050513          	mv	a0,a0
    return status;
}
    8000155c:	0005051b          	sext.w	a0,a0
    80001560:	00813403          	ld	s0,8(sp)
    80001564:	01010113          	addi	sp,sp,16
    80001568:	00008067          	ret

000000008000156c <_Z4getcv>:

char getc() {
    8000156c:	ff010113          	addi	sp,sp,-16
    80001570:	00813423          	sd	s0,8(sp)
    80001574:	01010413          	addi	s0,sp,16
    //nema argumenata
    __asm__ volatile("li a0, 0x41");
    80001578:	04100513          	li	a0,65
    __asm__ volatile("ecall");
    8000157c:	00000073          	ecall

    scall();

    char character;
    __asm__ volatile("mv %[c], a0":[c] "=r"(character));
    80001580:	00050513          	mv	a0,a0
    return character;
}
    80001584:	0ff57513          	andi	a0,a0,255
    80001588:	00813403          	ld	s0,8(sp)
    8000158c:	01010113          	addi	sp,sp,16
    80001590:	00008067          	ret

0000000080001594 <_Z4putcc>:

void putc(char c) {
    80001594:	ff010113          	addi	sp,sp,-16
    80001598:	00813423          	sd	s0,8(sp)
    8000159c:	01010413          	addi	s0,sp,16
    800015a0:	00050313          	mv	t1,a0
    //stavljanje argumenata
    __asm__ volatile("mv a1, %[c]": :[c] "r"(c):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015a4:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x42");
    800015a8:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    800015ac:	00000073          	ecall

    scall();
    //nema povratne vrednosti
}
    800015b0:	00813403          	ld	s0,8(sp)
    800015b4:	01010113          	addi	sp,sp,16
    800015b8:	00008067          	ret

00000000800015bc <_Z12thread_allocPP3TCBPFvPvES2_>:

int thread_alloc(thread_t* handle, TCB::Body function, void* arg) {
    800015bc:	fd010113          	addi	sp,sp,-48
    800015c0:	02113423          	sd	ra,40(sp)
    800015c4:	02813023          	sd	s0,32(sp)
    800015c8:	00913c23          	sd	s1,24(sp)
    800015cc:	01213823          	sd	s2,16(sp)
    800015d0:	01313423          	sd	s3,8(sp)
    800015d4:	03010413          	addi	s0,sp,48
    800015d8:	00050913          	mv	s2,a0
    800015dc:	00058493          	mv	s1,a1
    800015e0:	00060993          	mv	s3,a2
    //stvaranje steka ako se ne radi o main kernel niti, posto ona automatski ima stek
    uint64* stack = nullptr;
    if (function != nullptr) {
    800015e4:	04058863          	beqz	a1,80001634 <_Z12thread_allocPP3TCBPFvPvES2_+0x78>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800015e8:	00001537          	lui	a0,0x1
    800015ec:	00000097          	auipc	ra,0x0
    800015f0:	d1c080e7          	jalr	-740(ra) # 80001308 <_Z9mem_allocm>
    800015f4:	00050313          	mv	t1,a0
    }
    //uint64* stack = (start_routine != nullptr ? (uint64*)MemoryAllocator::kmalloc(DEFAULT_STACK_SIZE) : nullptr);
    //stavljanje argumenata za sistemski poziv
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015f8:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015fc:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2, %[function]": :[function] "r"(
            function):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001600:	00048613          	mv	a2,s1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001604:	00090593          	mv	a1,s2
    __asm__ volatile("li a0, 0x80");
    80001608:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    8000160c:	00000073          	ecall
    //a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

    scall();

    int status;
    __asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001610:	00050513          	mv	a0,a0
    return status;
}
    80001614:	0005051b          	sext.w	a0,a0
    80001618:	02813083          	ld	ra,40(sp)
    8000161c:	02013403          	ld	s0,32(sp)
    80001620:	01813483          	ld	s1,24(sp)
    80001624:	01013903          	ld	s2,16(sp)
    80001628:	00813983          	ld	s3,8(sp)
    8000162c:	03010113          	addi	sp,sp,48
    80001630:	00008067          	ret
    uint64* stack = nullptr;
    80001634:	00000313          	li	t1,0
    80001638:	fc1ff06f          	j	800015f8 <_Z12thread_allocPP3TCBPFvPvES2_+0x3c>

000000008000163c <_Z12thread_startP3TCB>:

void thread_start(thread_t handle) {
    8000163c:	ff010113          	addi	sp,sp,-16
    80001640:	00813423          	sd	s0,8(sp)
    80001644:	01010413          	addi	s0,sp,16
    80001648:	00050313          	mv	t1,a0
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000164c:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    80001650:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    80001654:	00000073          	ecall

    scall();
}
    80001658:	00813403          	ld	s0,8(sp)
    8000165c:	01010113          	addi	sp,sp,16
    80001660:	00008067          	ret

0000000080001664 <_ZN8KConsole12initKConsoleEv>:
int KConsole::inputBufferSize = 0;
char KConsole::inputBuffer[];
char KConsole::outputBuffer[];

void KConsole::initKConsole() {
	if (initialized) return;
    80001664:	0000b797          	auipc	a5,0xb
    80001668:	52c7c783          	lbu	a5,1324(a5) # 8000cb90 <_ZN8KConsole11initializedE>
    8000166c:	00078463          	beqz	a5,80001674 <_ZN8KConsole12initKConsoleEv+0x10>
    80001670:	00008067          	ret
void KConsole::initKConsole() {
    80001674:	fe010113          	addi	sp,sp,-32
    80001678:	00113c23          	sd	ra,24(sp)
    8000167c:	00813823          	sd	s0,16(sp)
    80001680:	00913423          	sd	s1,8(sp)
    80001684:	02010413          	addi	s0,sp,32
	dr = (char*)CONSOLE_RX_DATA;
    80001688:	0000b497          	auipc	s1,0xb
    8000168c:	50848493          	addi	s1,s1,1288 # 8000cb90 <_ZN8KConsole11initializedE>
    80001690:	0000b797          	auipc	a5,0xb
    80001694:	4487b783          	ld	a5,1096(a5) # 8000cad8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001698:	0007b783          	ld	a5,0(a5)
    8000169c:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    800016a0:	0000b797          	auipc	a5,0xb
    800016a4:	4487b783          	ld	a5,1096(a5) # 8000cae8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016a8:	0007b783          	ld	a5,0(a5)
    800016ac:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    800016b0:	03200593          	li	a1,50
    800016b4:	0000b517          	auipc	a0,0xb
    800016b8:	4f450513          	addi	a0,a0,1268 # 8000cba8 <_ZN8KConsole19inputBufferHasSpaceE>
    800016bc:	00000097          	auipc	ra,0x0
    800016c0:	de8080e7          	jalr	-536(ra) # 800014a4 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016c4:	03200593          	li	a1,50
    800016c8:	0000b517          	auipc	a0,0xb
    800016cc:	4e850513          	addi	a0,a0,1256 # 8000cbb0 <_ZN8KConsole20outputBufferHasSpaceE>
    800016d0:	00000097          	auipc	ra,0x0
    800016d4:	dd4080e7          	jalr	-556(ra) # 800014a4 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016d8:	00000593          	li	a1,0
    800016dc:	0000b517          	auipc	a0,0xb
    800016e0:	4dc50513          	addi	a0,a0,1244 # 8000cbb8 <_ZN8KConsole12charsToInputE>
    800016e4:	00000097          	auipc	ra,0x0
    800016e8:	dc0080e7          	jalr	-576(ra) # 800014a4 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    800016ec:	00000593          	li	a1,0
    800016f0:	0000b517          	auipc	a0,0xb
    800016f4:	4d050513          	addi	a0,a0,1232 # 8000cbc0 <_ZN8KConsole13charsToOutputE>
    800016f8:	00000097          	auipc	ra,0x0
    800016fc:	dac080e7          	jalr	-596(ra) # 800014a4 <_Z8sem_openPP4KSemj>
	initialized = true;
    80001700:	00100793          	li	a5,1
    80001704:	00f48023          	sb	a5,0(s1)
}
    80001708:	01813083          	ld	ra,24(sp)
    8000170c:	01013403          	ld	s0,16(sp)
    80001710:	00813483          	ld	s1,8(sp)
    80001714:	02010113          	addi	sp,sp,32
    80001718:	00008067          	ret

000000008000171c <_ZN8KConsole17printConsoleStateEv>:

void KConsole::printConsoleState() {
    8000171c:	fe010113          	addi	sp,sp,-32
    80001720:	00113c23          	sd	ra,24(sp)
    80001724:	00813823          	sd	s0,16(sp)
    80001728:	00913423          	sd	s1,8(sp)
    8000172c:	02010413          	addi	s0,sp,32
	printString("CONSOLE_RX = ");
    80001730:	00009517          	auipc	a0,0x9
    80001734:	8f050513          	addi	a0,a0,-1808 # 8000a020 <CONSOLE_STATUS+0x10>
    80001738:	00004097          	auipc	ra,0x4
    8000173c:	194080e7          	jalr	404(ra) # 800058cc <_Z11printStringPKc>
	printInteger((uint64)dr);
    80001740:	0000b497          	auipc	s1,0xb
    80001744:	45048493          	addi	s1,s1,1104 # 8000cb90 <_ZN8KConsole11initializedE>
    80001748:	0084b503          	ld	a0,8(s1)
    8000174c:	00000097          	auipc	ra,0x0
    80001750:	250080e7          	jalr	592(ra) # 8000199c <_Z12printIntegerm>
	printString("\n");
    80001754:	00009517          	auipc	a0,0x9
    80001758:	e2c50513          	addi	a0,a0,-468 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    8000175c:	00004097          	auipc	ra,0x4
    80001760:	170080e7          	jalr	368(ra) # 800058cc <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001764:	00009517          	auipc	a0,0x9
    80001768:	8cc50513          	addi	a0,a0,-1844 # 8000a030 <CONSOLE_STATUS+0x20>
    8000176c:	00004097          	auipc	ra,0x4
    80001770:	160080e7          	jalr	352(ra) # 800058cc <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001774:	0104b503          	ld	a0,16(s1)
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	224080e7          	jalr	548(ra) # 8000199c <_Z12printIntegerm>
	printString("\n");
    80001780:	00009517          	auipc	a0,0x9
    80001784:	e0050513          	addi	a0,a0,-512 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80001788:	00004097          	auipc	ra,0x4
    8000178c:	144080e7          	jalr	324(ra) # 800058cc <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    80001790:	00009517          	auipc	a0,0x9
    80001794:	8b850513          	addi	a0,a0,-1864 # 8000a048 <CONSOLE_STATUS+0x38>
    80001798:	00004097          	auipc	ra,0x4
    8000179c:	134080e7          	jalr	308(ra) # 800058cc <_Z11printStringPKc>
	printInteger(*dr);
    800017a0:	0084b783          	ld	a5,8(s1)
    800017a4:	0007c503          	lbu	a0,0(a5)
    800017a8:	00000097          	auipc	ra,0x0
    800017ac:	1f4080e7          	jalr	500(ra) # 8000199c <_Z12printIntegerm>
	printString("\n");
    800017b0:	00009517          	auipc	a0,0x9
    800017b4:	dd050513          	addi	a0,a0,-560 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800017b8:	00004097          	auipc	ra,0x4
    800017bc:	114080e7          	jalr	276(ra) # 800058cc <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017c0:	00009517          	auipc	a0,0x9
    800017c4:	89850513          	addi	a0,a0,-1896 # 8000a058 <CONSOLE_STATUS+0x48>
    800017c8:	00004097          	auipc	ra,0x4
    800017cc:	104080e7          	jalr	260(ra) # 800058cc <_Z11printStringPKc>
	printInteger(*sr);
    800017d0:	0104b783          	ld	a5,16(s1)
    800017d4:	0007c503          	lbu	a0,0(a5)
    800017d8:	00000097          	auipc	ra,0x0
    800017dc:	1c4080e7          	jalr	452(ra) # 8000199c <_Z12printIntegerm>
	printString("\n");
    800017e0:	00009517          	auipc	a0,0x9
    800017e4:	da050513          	addi	a0,a0,-608 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800017e8:	00004097          	auipc	ra,0x4
    800017ec:	0e4080e7          	jalr	228(ra) # 800058cc <_Z11printStringPKc>
}
    800017f0:	01813083          	ld	ra,24(sp)
    800017f4:	01013403          	ld	s0,16(sp)
    800017f8:	00813483          	ld	s1,8(sp)
    800017fc:	02010113          	addi	sp,sp,32
    80001800:	00008067          	ret

0000000080001804 <_ZN8KConsole13getFromOutputEv>:

char KConsole::getFromOutput() {
    80001804:	fe010113          	addi	sp,sp,-32
    80001808:	00113c23          	sd	ra,24(sp)
    8000180c:	00813823          	sd	s0,16(sp)
    80001810:	00913423          	sd	s1,8(sp)
    80001814:	02010413          	addi	s0,sp,32
	sem_wait(charsToOutput);
    80001818:	0000b497          	auipc	s1,0xb
    8000181c:	37848493          	addi	s1,s1,888 # 8000cb90 <_ZN8KConsole11initializedE>
    80001820:	0304b503          	ld	a0,48(s1)
    80001824:	00000097          	auipc	ra,0x0
    80001828:	ce8080e7          	jalr	-792(ra) # 8000150c <_Z8sem_waitP4KSem>
	char c = outputBuffer[outputHead];
    8000182c:	0384a783          	lw	a5,56(s1)
    80001830:	00f48733          	add	a4,s1,a5
	outputHead = (outputHead + 1) % capacity;
    80001834:	0017879b          	addiw	a5,a5,1
    80001838:	03200693          	li	a3,50
    8000183c:	02d7e7bb          	remw	a5,a5,a3
    80001840:	02f4ac23          	sw	a5,56(s1)
	return c;
}
    80001844:	04074503          	lbu	a0,64(a4)
    80001848:	01813083          	ld	ra,24(sp)
    8000184c:	01013403          	ld	s0,16(sp)
    80001850:	00813483          	ld	s1,8(sp)
    80001854:	02010113          	addi	sp,sp,32
    80001858:	00008067          	ret

000000008000185c <_ZN8KConsole12placeInInputEc>:

void KConsole::placeInInput(char c) {
	if (inputBufferSize == capacity) return;
    8000185c:	0000b717          	auipc	a4,0xb
    80001860:	3a872703          	lw	a4,936(a4) # 8000cc04 <_ZN8KConsole15inputBufferSizeE>
    80001864:	03200793          	li	a5,50
    80001868:	04f70e63          	beq	a4,a5,800018c4 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    8000186c:	ff010113          	addi	sp,sp,-16
    80001870:	00113423          	sd	ra,8(sp)
    80001874:	00813023          	sd	s0,0(sp)
    80001878:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    8000187c:	0000b697          	auipc	a3,0xb
    80001880:	31468693          	addi	a3,a3,788 # 8000cb90 <_ZN8KConsole11initializedE>
    80001884:	0786a783          	lw	a5,120(a3)
    80001888:	00f68633          	add	a2,a3,a5
    8000188c:	08a60023          	sb	a0,128(a2)
	inputTail = (inputTail + 1) % capacity;
    80001890:	0017879b          	addiw	a5,a5,1
    80001894:	03200613          	li	a2,50
    80001898:	02c7e7bb          	remw	a5,a5,a2
    8000189c:	06f6ac23          	sw	a5,120(a3)
	inputBufferSize++;
    800018a0:	0017071b          	addiw	a4,a4,1
    800018a4:	06e6aa23          	sw	a4,116(a3)
	sem_signal(charsToInput);
    800018a8:	0286b503          	ld	a0,40(a3)
    800018ac:	00000097          	auipc	ra,0x0
    800018b0:	c90080e7          	jalr	-880(ra) # 8000153c <_Z10sem_signalP4KSem>
}
    800018b4:	00813083          	ld	ra,8(sp)
    800018b8:	00013403          	ld	s0,0(sp)
    800018bc:	01010113          	addi	sp,sp,16
    800018c0:	00008067          	ret
    800018c4:	00008067          	ret

00000000800018c8 <_ZN8KConsole5kputcEc>:

void KConsole::kputc(char c) {
    800018c8:	fe010113          	addi	sp,sp,-32
    800018cc:	00113c23          	sd	ra,24(sp)
    800018d0:	00813823          	sd	s0,16(sp)
    800018d4:	00913423          	sd	s1,8(sp)
    800018d8:	01213023          	sd	s2,0(sp)
    800018dc:	02010413          	addi	s0,sp,32
    800018e0:	00050913          	mv	s2,a0
	sem_wait(outputBufferHasSpace);
    800018e4:	0000b497          	auipc	s1,0xb
    800018e8:	2ac48493          	addi	s1,s1,684 # 8000cb90 <_ZN8KConsole11initializedE>
    800018ec:	0204b503          	ld	a0,32(s1)
    800018f0:	00000097          	auipc	ra,0x0
    800018f4:	c1c080e7          	jalr	-996(ra) # 8000150c <_Z8sem_waitP4KSem>
	outputBuffer[outputTail] = c;
    800018f8:	0b44a783          	lw	a5,180(s1)
    800018fc:	00f48733          	add	a4,s1,a5
    80001900:	05270023          	sb	s2,64(a4)
	outputTail = (outputTail + 1) % capacity;
    80001904:	0017879b          	addiw	a5,a5,1
    80001908:	03200713          	li	a4,50
    8000190c:	02e7e7bb          	remw	a5,a5,a4
    80001910:	0af4aa23          	sw	a5,180(s1)
	sem_signal(charsToOutput);
    80001914:	0304b503          	ld	a0,48(s1)
    80001918:	00000097          	auipc	ra,0x0
    8000191c:	c24080e7          	jalr	-988(ra) # 8000153c <_Z10sem_signalP4KSem>
}
    80001920:	01813083          	ld	ra,24(sp)
    80001924:	01013403          	ld	s0,16(sp)
    80001928:	00813483          	ld	s1,8(sp)
    8000192c:	00013903          	ld	s2,0(sp)
    80001930:	02010113          	addi	sp,sp,32
    80001934:	00008067          	ret

0000000080001938 <_ZN8KConsole5kgetcEv>:

char KConsole::kgetc() {
    80001938:	fe010113          	addi	sp,sp,-32
    8000193c:	00113c23          	sd	ra,24(sp)
    80001940:	00813823          	sd	s0,16(sp)
    80001944:	00913423          	sd	s1,8(sp)
    80001948:	02010413          	addi	s0,sp,32
	sem_wait(charsToInput);
    8000194c:	0000b497          	auipc	s1,0xb
    80001950:	24448493          	addi	s1,s1,580 # 8000cb90 <_ZN8KConsole11initializedE>
    80001954:	0284b503          	ld	a0,40(s1)
    80001958:	00000097          	auipc	ra,0x0
    8000195c:	bb4080e7          	jalr	-1100(ra) # 8000150c <_Z8sem_waitP4KSem>
	char c = inputBuffer[inputHead];
    80001960:	0b84a783          	lw	a5,184(s1)
    80001964:	00f48733          	add	a4,s1,a5
	inputHead = (inputHead + 1) % capacity;
    80001968:	0017879b          	addiw	a5,a5,1
    8000196c:	03200693          	li	a3,50
    80001970:	02d7e7bb          	remw	a5,a5,a3
    80001974:	0af4ac23          	sw	a5,184(s1)
	inputBufferSize--;
    80001978:	0744a783          	lw	a5,116(s1)
    8000197c:	fff7879b          	addiw	a5,a5,-1
    80001980:	06f4aa23          	sw	a5,116(s1)
	return c;
}
    80001984:	08074503          	lbu	a0,128(a4)
    80001988:	01813083          	ld	ra,24(sp)
    8000198c:	01013403          	ld	s0,16(sp)
    80001990:	00813483          	ld	s1,8(sp)
    80001994:	02010113          	addi	sp,sp,32
    80001998:	00008067          	ret

000000008000199c <_Z12printIntegerm>:
//void println(char const *string) {
//    printString(string);
//    __putc('\n');
//}

void printInteger(uint64 integer) {
    8000199c:	ff010113          	addi	sp,sp,-16
    800019a0:	00813423          	sd	s0,8(sp)
    800019a4:	01010413          	addi	s0,sp,16
    800019a8:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[i]": :[i] "r"(integer):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800019ac:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x91");
    800019b0:	09100513          	li	a0,145

	__asm__ volatile("ecall");
    800019b4:	00000073          	ecall
}
    800019b8:	00813403          	ld	s0,8(sp)
    800019bc:	01010113          	addi	sp,sp,16
    800019c0:	00008067          	ret

00000000800019c4 <_Z9kPrintIntm>:

void kPrintInt(uint64 integer){
    800019c4:	fd010113          	addi	sp,sp,-48
    800019c8:	02113423          	sd	ra,40(sp)
    800019cc:	02813023          	sd	s0,32(sp)
    800019d0:	00913c23          	sd	s1,24(sp)
    800019d4:	03010413          	addi	s0,sp,48
    neg = 0;
    if (integer < 0) {
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    800019d8:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    800019dc:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    800019e0:	00a00613          	li	a2,10
    800019e4:	02c5773b          	remuw	a4,a0,a2
    800019e8:	02071693          	slli	a3,a4,0x20
    800019ec:	0206d693          	srli	a3,a3,0x20
    800019f0:	00008717          	auipc	a4,0x8
    800019f4:	68070713          	addi	a4,a4,1664 # 8000a070 <_ZZ9kPrintIntmE6digits>
    800019f8:	00d70733          	add	a4,a4,a3
    800019fc:	00074703          	lbu	a4,0(a4)
    80001a00:	fe040693          	addi	a3,s0,-32
    80001a04:	009687b3          	add	a5,a3,s1
    80001a08:	0014849b          	addiw	s1,s1,1
    80001a0c:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80001a10:	0005071b          	sext.w	a4,a0
    80001a14:	02c5553b          	divuw	a0,a0,a2
    80001a18:	00900793          	li	a5,9
    80001a1c:	fce7e2e3          	bltu	a5,a4,800019e0 <_Z9kPrintIntm+0x1c>
    if (neg) buf[i++] = '-';

    while (--i >= 0) {
    80001a20:	fff4849b          	addiw	s1,s1,-1
    80001a24:	0004ce63          	bltz	s1,80001a40 <_Z9kPrintIntm+0x7c>
        putc(buf[i]);
    80001a28:	fe040793          	addi	a5,s0,-32
    80001a2c:	009787b3          	add	a5,a5,s1
    80001a30:	ff07c503          	lbu	a0,-16(a5)
    80001a34:	00000097          	auipc	ra,0x0
    80001a38:	b60080e7          	jalr	-1184(ra) # 80001594 <_Z4putcc>
    80001a3c:	fe5ff06f          	j	80001a20 <_Z9kPrintIntm+0x5c>
    }
}
    80001a40:	02813083          	ld	ra,40(sp)
    80001a44:	02013403          	ld	s0,32(sp)
    80001a48:	01813483          	ld	s1,24(sp)
    80001a4c:	03010113          	addi	sp,sp,48
    80001a50:	00008067          	ret

0000000080001a54 <_ZN9Scheduler3putEP3TCB>:

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    80001a54:	ff010113          	addi	sp,sp,-16
    80001a58:	00813423          	sd	s0,8(sp)
    80001a5c:	01010413          	addi	s0,sp,16
    if (tail == nullptr) {
    80001a60:	0000b797          	auipc	a5,0xb
    80001a64:	1f07b783          	ld	a5,496(a5) # 8000cc50 <_ZN9Scheduler4tailE>
    80001a68:	02078263          	beqz	a5,80001a8c <_ZN9Scheduler3putEP3TCB+0x38>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    80001a6c:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    80001a70:	0000b797          	auipc	a5,0xb
    80001a74:	1ea7b023          	sd	a0,480(a5) # 8000cc50 <_ZN9Scheduler4tailE>

    enum ThreadStatus {
        CREATED, ACTIVE, BLOCKED, JOINING, SLEEPING, FINISHED
    };

    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001a78:	00100793          	li	a5,1
    80001a7c:	04f52c23          	sw	a5,88(a0)
    }
    tcb->setStatus(TCB::ACTIVE);
}
    80001a80:	00813403          	ld	s0,8(sp)
    80001a84:	01010113          	addi	sp,sp,16
    80001a88:	00008067          	ret
        head = tail = tcb;
    80001a8c:	0000b797          	auipc	a5,0xb
    80001a90:	1c478793          	addi	a5,a5,452 # 8000cc50 <_ZN9Scheduler4tailE>
    80001a94:	00a7b023          	sd	a0,0(a5)
    80001a98:	00a7b423          	sd	a0,8(a5)
    80001a9c:	fddff06f          	j	80001a78 <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001aa0 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001aa0:	ff010113          	addi	sp,sp,-16
    80001aa4:	00813423          	sd	s0,8(sp)
    80001aa8:	01010413          	addi	s0,sp,16
    TCB* firstThread = head;
    80001aac:	0000b717          	auipc	a4,0xb
    80001ab0:	1a470713          	addi	a4,a4,420 # 8000cc50 <_ZN9Scheduler4tailE>
    80001ab4:	00873503          	ld	a0,8(a4)
    head = head->nextInScheduler;
    80001ab8:	03053783          	ld	a5,48(a0)
    80001abc:	00f73423          	sd	a5,8(a4)
    if (head == nullptr) {
    80001ac0:	00078a63          	beqz	a5,80001ad4 <_ZN9Scheduler3getEv+0x34>
        tail = head = nullptr;
    }
    firstThread->nextInScheduler = nullptr;
    80001ac4:	02053823          	sd	zero,48(a0)
    return firstThread;
}
    80001ac8:	00813403          	ld	s0,8(sp)
    80001acc:	01010113          	addi	sp,sp,16
    80001ad0:	00008067          	ret
        tail = head = nullptr;
    80001ad4:	00073423          	sd	zero,8(a4)
    80001ad8:	00073023          	sd	zero,0(a4)
    80001adc:	fe9ff06f          	j	80001ac4 <_ZN9Scheduler3getEv+0x24>

0000000080001ae0 <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    80001ae0:	ff010113          	addi	sp,sp,-16
    80001ae4:	00813423          	sd	s0,8(sp)
    80001ae8:	01010413          	addi	s0,sp,16
    tcb->status = TCB::SLEEPING;
    80001aec:	00400793          	li	a5,4
    80001af0:	04f52c23          	sw	a5,88(a0)
    if (sleepingHead == nullptr) {
    80001af4:	0000b817          	auipc	a6,0xb
    80001af8:	16c83803          	ld	a6,364(a6) # 8000cc60 <_ZN9Scheduler12sleepingHeadE>
    80001afc:	02080863          	beqz	a6,80001b2c <_ZN9Scheduler10putToSleepEP3TCBm+0x4c>
        tcb->timeToSleep = sleepTime;
        return;
    }
    TCB* prevSleeping = nullptr;
    time_t accumulated = 0;
    TCB* current = sleepingHead;
    80001b00:	00080793          	mv	a5,a6
    time_t accumulated = 0;
    80001b04:	00000693          	li	a3,0
    TCB* prevSleeping = nullptr;
    80001b08:	00000613          	li	a2,0
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001b0c:	02078863          	beqz	a5,80001b3c <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
    80001b10:	0387b703          	ld	a4,56(a5)
    80001b14:	00d70733          	add	a4,a4,a3
    80001b18:	02b77263          	bgeu	a4,a1,80001b3c <_ZN9Scheduler10putToSleepEP3TCBm+0x5c>
        accumulated += current->timeToSleep;
    80001b1c:	00070693          	mv	a3,a4
        prevSleeping = current;
    80001b20:	00078613          	mv	a2,a5
    for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001b24:	0407b783          	ld	a5,64(a5)
    80001b28:	fe5ff06f          	j	80001b0c <_ZN9Scheduler10putToSleepEP3TCBm+0x2c>
        sleepingHead = tcb;
    80001b2c:	0000b797          	auipc	a5,0xb
    80001b30:	12a7ba23          	sd	a0,308(a5) # 8000cc60 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80001b34:	02b53c23          	sd	a1,56(a0)
        return;
    80001b38:	02c0006f          	j	80001b64 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    }
    if (!prevSleeping) {
    80001b3c:	02060a63          	beqz	a2,80001b70 <_ZN9Scheduler10putToSleepEP3TCBm+0x90>
        sleepingHead = tcb;
        tcb->timeToSleep = sleepTime;
        tcb->nextSleeping->timeToSleep -= sleepTime;
        return;
    }
    tcb->nextSleeping = current;
    80001b40:	04f53023          	sd	a5,64(a0)
    prevSleeping->nextSleeping = tcb;
    80001b44:	04a63023          	sd	a0,64(a2)
    tcb->timeToSleep = sleepTime - accumulated;
    80001b48:	40d58733          	sub	a4,a1,a3
    80001b4c:	02e53c23          	sd	a4,56(a0)
    if (current) current->timeToSleep -= sleepTime - accumulated;
    80001b50:	00078a63          	beqz	a5,80001b64 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>
    80001b54:	40b686b3          	sub	a3,a3,a1
    80001b58:	0387b703          	ld	a4,56(a5)
    80001b5c:	00d706b3          	add	a3,a4,a3
    80001b60:	02d7bc23          	sd	a3,56(a5)
}
    80001b64:	00813403          	ld	s0,8(sp)
    80001b68:	01010113          	addi	sp,sp,16
    80001b6c:	00008067          	ret
        tcb->nextSleeping = sleepingHead;
    80001b70:	05053023          	sd	a6,64(a0)
        sleepingHead = tcb;
    80001b74:	0000b797          	auipc	a5,0xb
    80001b78:	0ea7b623          	sd	a0,236(a5) # 8000cc60 <_ZN9Scheduler12sleepingHeadE>
        tcb->timeToSleep = sleepTime;
    80001b7c:	02b53c23          	sd	a1,56(a0)
        tcb->nextSleeping->timeToSleep -= sleepTime;
    80001b80:	03883683          	ld	a3,56(a6)
    80001b84:	40b686b3          	sub	a3,a3,a1
    80001b88:	02d83c23          	sd	a3,56(a6)
        return;
    80001b8c:	fd9ff06f          	j	80001b64 <_ZN9Scheduler10putToSleepEP3TCBm+0x84>

0000000080001b90 <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
    if (!sleepingHead) return;
    80001b90:	0000b797          	auipc	a5,0xb
    80001b94:	0d07b783          	ld	a5,208(a5) # 8000cc60 <_ZN9Scheduler12sleepingHeadE>
    80001b98:	06078e63          	beqz	a5,80001c14 <_ZN9Scheduler4wakeEv+0x84>
    sleepingHead->timeToSleep--;
    80001b9c:	0387b703          	ld	a4,56(a5)
    80001ba0:	fff70713          	addi	a4,a4,-1
    80001ba4:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001ba8:	0000b517          	auipc	a0,0xb
    80001bac:	0b853503          	ld	a0,184(a0) # 8000cc60 <_ZN9Scheduler12sleepingHeadE>
    80001bb0:	06050263          	beqz	a0,80001c14 <_ZN9Scheduler4wakeEv+0x84>
    80001bb4:	03853783          	ld	a5,56(a0)
    80001bb8:	04079e63          	bnez	a5,80001c14 <_ZN9Scheduler4wakeEv+0x84>
void Scheduler::wake() {
    80001bbc:	ff010113          	addi	sp,sp,-16
    80001bc0:	00113423          	sd	ra,8(sp)
    80001bc4:	00813023          	sd	s0,0(sp)
    80001bc8:	01010413          	addi	s0,sp,16
    80001bcc:	00c0006f          	j	80001bd8 <_ZN9Scheduler4wakeEv+0x48>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001bd0:	03853783          	ld	a5,56(a0)
    80001bd4:	02079863          	bnez	a5,80001c04 <_ZN9Scheduler4wakeEv+0x74>
        TCB* thread = sleepingHead;
        sleepingHead = sleepingHead->nextSleeping;
    80001bd8:	04053783          	ld	a5,64(a0)
    80001bdc:	0000b717          	auipc	a4,0xb
    80001be0:	08f73223          	sd	a5,132(a4) # 8000cc60 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    80001be4:	04053023          	sd	zero,64(a0)
        thread->status = TCB::ACTIVE;
    80001be8:	00100793          	li	a5,1
    80001bec:	04f52c23          	sw	a5,88(a0)
        Scheduler::put(thread);
    80001bf0:	00000097          	auipc	ra,0x0
    80001bf4:	e64080e7          	jalr	-412(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001bf8:	0000b517          	auipc	a0,0xb
    80001bfc:	06853503          	ld	a0,104(a0) # 8000cc60 <_ZN9Scheduler12sleepingHeadE>
    80001c00:	fc0518e3          	bnez	a0,80001bd0 <_ZN9Scheduler4wakeEv+0x40>
    }
}
    80001c04:	00813083          	ld	ra,8(sp)
    80001c08:	00013403          	ld	s0,0(sp)
    80001c0c:	01010113          	addi	sp,sp,16
    80001c10:	00008067          	ret
    80001c14:	00008067          	ret

0000000080001c18 <_ZN7KMemory7kmallocEm>:
    kmalloc(blocksForBitVector);

    initialized = true;
}

void* KMemory::kmalloc(size_t size) {
    80001c18:	ff010113          	addi	sp,sp,-16
    80001c1c:	00813423          	sd	s0,8(sp)
    80001c20:	01010413          	addi	s0,sp,16
    if (size <= 0) return nullptr;
    80001c24:	14050063          	beqz	a0,80001d64 <_ZN7KMemory7kmallocEm+0x14c>
    uint64 currentElem = 0;
    uint64 currentBit = 63;
    uint64 firstZeroElem = 0;
    uint64 firstZeroBit = 63;
    uint64 zerosFound = 0;
    bool zeroFound = false;
    80001c28:	00000313          	li	t1,0
    uint64 zerosFound = 0;
    80001c2c:	00000713          	li	a4,0
    uint64 firstZeroBit = 63;
    80001c30:	03f00813          	li	a6,63
    uint64 firstZeroElem = 0;
    80001c34:	00000893          	li	a7,0
    uint64 currentBit = 63;
    80001c38:	03f00793          	li	a5,63
    uint64 currentElem = 0;
    80001c3c:	00000593          	li	a1,0
    80001c40:	0080006f          	j	80001c48 <_ZN7KMemory7kmallocEm+0x30>
            firstZeroElem = currentElem;
        } else {
            zerosFound++;
        }
        if (zerosFound == size) break;
        if (currentBit-- == 0) {
    80001c44:	00068793          	mv	a5,a3
    while (currentElem < sizeOfBitVectorInUint64) {
    80001c48:	0000b697          	auipc	a3,0xb
    80001c4c:	0206b683          	ld	a3,32(a3) # 8000cc68 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001c50:	08d5fa63          	bgeu	a1,a3,80001ce4 <_ZN7KMemory7kmallocEm+0xcc>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001c54:	03f00693          	li	a3,63
    80001c58:	02d78a63          	beq	a5,a3,80001c8c <_ZN7KMemory7kmallocEm+0x74>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    80001c5c:	00359693          	slli	a3,a1,0x3
    80001c60:	0000b617          	auipc	a2,0xb
    80001c64:	01063603          	ld	a2,16(a2) # 8000cc70 <_ZN7KMemory9bitVectorE>
    80001c68:	00d606b3          	add	a3,a2,a3
    80001c6c:	0006b683          	ld	a3,0(a3)
    //adresa pocetka bit vektora (HEAP_START_ADDR)
    static uint64* bitVector;

    //maska sa 1 na mestu bitPos i ostalim nulama (bitPos=0..63)
    inline static uint64 maskBit(uint64 bitPos) {
        return (uint64)1 << bitPos;
    80001c70:	00100613          	li	a2,1
    80001c74:	00f61633          	sll	a2,a2,a5
    80001c78:	00c6f6b3          	and	a3,a3,a2
        if (bit > 0) {
    80001c7c:	02069a63          	bnez	a3,80001cb0 <_ZN7KMemory7kmallocEm+0x98>
        } else if (!zeroFound) {
    80001c80:	04030863          	beqz	t1,80001cd0 <_ZN7KMemory7kmallocEm+0xb8>
            zerosFound++;
    80001c84:	00170713          	addi	a4,a4,1
    80001c88:	0300006f          	j	80001cb8 <_ZN7KMemory7kmallocEm+0xa0>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001c8c:	00359693          	slli	a3,a1,0x3
    80001c90:	0000b617          	auipc	a2,0xb
    80001c94:	fe063603          	ld	a2,-32(a2) # 8000cc70 <_ZN7KMemory9bitVectorE>
    80001c98:	00d606b3          	add	a3,a2,a3
    80001c9c:	0006b603          	ld	a2,0(a3)
    80001ca0:	fff00693          	li	a3,-1
    80001ca4:	fad61ce3          	bne	a2,a3,80001c5c <_ZN7KMemory7kmallocEm+0x44>
            currentElem++;
    80001ca8:	00158593          	addi	a1,a1,1
            continue;
    80001cac:	f9dff06f          	j	80001c48 <_ZN7KMemory7kmallocEm+0x30>
            zeroFound = false;
    80001cb0:	00000313          	li	t1,0
            zerosFound = 0;
    80001cb4:	00000713          	li	a4,0
        if (zerosFound == size) break;
    80001cb8:	02a70663          	beq	a4,a0,80001ce4 <_ZN7KMemory7kmallocEm+0xcc>
        if (currentBit-- == 0) {
    80001cbc:	fff78693          	addi	a3,a5,-1
    80001cc0:	f80792e3          	bnez	a5,80001c44 <_ZN7KMemory7kmallocEm+0x2c>
            currentBit = 63;
            currentElem++;
    80001cc4:	00158593          	addi	a1,a1,1
            currentBit = 63;
    80001cc8:	03f00793          	li	a5,63
    80001ccc:	f7dff06f          	j	80001c48 <_ZN7KMemory7kmallocEm+0x30>
            firstZeroBit = currentBit;
    80001cd0:	00078813          	mv	a6,a5
            firstZeroElem = currentElem;
    80001cd4:	00058893          	mv	a7,a1
            zeroFound = true;
    80001cd8:	00100313          	li	t1,1
            zerosFound = 1;
    80001cdc:	00100713          	li	a4,1
    80001ce0:	fd9ff06f          	j	80001cb8 <_ZN7KMemory7kmallocEm+0xa0>
        }
    }
    if (zerosFound != size) return nullptr;
    80001ce4:	08a71463          	bne	a4,a0,80001d6c <_ZN7KMemory7kmallocEm+0x154>

    //alociranje blokova
    uint64 blockNum = firstZeroElem * 64 + (63 - firstZeroBit);
    80001ce8:	00689793          	slli	a5,a7,0x6
    80001cec:	410787b3          	sub	a5,a5,a6
    80001cf0:	03f78793          	addi	a5,a5,63
    void* addr = (char*)HEAP_START_ADDR + blockNum * MEM_BLOCK_SIZE;
    80001cf4:	0000b697          	auipc	a3,0xb
    80001cf8:	dfc6b683          	ld	a3,-516(a3) # 8000caf0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001cfc:	0006b583          	ld	a1,0(a3)
    80001d00:	00679793          	slli	a5,a5,0x6
    80001d04:	00f585b3          	add	a1,a1,a5
    *(uint64*)addr = size;  //da znamo koliko blokova je alocirano zaredom
    80001d08:	00a5b023          	sd	a0,0(a1)

    //upisivanje 1 u bit vektor
    currentElem = firstZeroElem;
    currentBit = firstZeroBit;
    80001d0c:	0080006f          	j	80001d14 <_ZN7KMemory7kmallocEm+0xfc>
    while (zerosFound > 0) {
        bitVector[currentElem] |= maskBit(currentBit);
        zerosFound--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001d10:	00078813          	mv	a6,a5
    while (zerosFound > 0) {
    80001d14:	04070063          	beqz	a4,80001d54 <_ZN7KMemory7kmallocEm+0x13c>
    80001d18:	00100693          	li	a3,1
    80001d1c:	01069633          	sll	a2,a3,a6
        bitVector[currentElem] |= maskBit(currentBit);
    80001d20:	00389793          	slli	a5,a7,0x3
    80001d24:	0000b697          	auipc	a3,0xb
    80001d28:	f4c6b683          	ld	a3,-180(a3) # 8000cc70 <_ZN7KMemory9bitVectorE>
    80001d2c:	00f687b3          	add	a5,a3,a5
    80001d30:	0007b683          	ld	a3,0(a5)
    80001d34:	00c6e6b3          	or	a3,a3,a2
    80001d38:	00d7b023          	sd	a3,0(a5)
        zerosFound--;
    80001d3c:	fff70713          	addi	a4,a4,-1
        if (currentBit-- == 0) {
    80001d40:	fff80793          	addi	a5,a6,-1
    80001d44:	fc0816e3          	bnez	a6,80001d10 <_ZN7KMemory7kmallocEm+0xf8>
            currentElem++;
    80001d48:	00188893          	addi	a7,a7,1
            currentBit = 63;
    80001d4c:	03f00793          	li	a5,63
    80001d50:	fc1ff06f          	j	80001d10 <_ZN7KMemory7kmallocEm+0xf8>
        }
    }
    return (char*)addr + 2 * sizeof(uint64);    //offset 2 da bi bilo zaokruzeno na 16 zbog steka
    80001d54:	01058513          	addi	a0,a1,16
}
    80001d58:	00813403          	ld	s0,8(sp)
    80001d5c:	01010113          	addi	sp,sp,16
    80001d60:	00008067          	ret
    if (size <= 0) return nullptr;
    80001d64:	00000513          	li	a0,0
    80001d68:	ff1ff06f          	j	80001d58 <_ZN7KMemory7kmallocEm+0x140>
    if (zerosFound != size) return nullptr;
    80001d6c:	00000513          	li	a0,0
    80001d70:	fe9ff06f          	j	80001d58 <_ZN7KMemory7kmallocEm+0x140>

0000000080001d74 <_ZN7KMemory16initializeMemoryEv>:
    if (initialized) return;
    80001d74:	0000b797          	auipc	a5,0xb
    80001d78:	f047c783          	lbu	a5,-252(a5) # 8000cc78 <_ZN7KMemory11initializedE>
    80001d7c:	0a079663          	bnez	a5,80001e28 <_ZN7KMemory16initializeMemoryEv+0xb4>
void KMemory::initializeMemory() {
    80001d80:	ff010113          	addi	sp,sp,-16
    80001d84:	00113423          	sd	ra,8(sp)
    80001d88:	00813023          	sd	s0,0(sp)
    80001d8c:	01010413          	addi	s0,sp,16
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001d90:	0000b797          	auipc	a5,0xb
    80001d94:	d987b783          	ld	a5,-616(a5) # 8000cb28 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001d98:	0007b783          	ld	a5,0(a5)
    80001d9c:	0000b717          	auipc	a4,0xb
    80001da0:	d5473703          	ld	a4,-684(a4) # 8000caf0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001da4:	00073683          	ld	a3,0(a4)
    80001da8:	40d787b3          	sub	a5,a5,a3
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    80001dac:	00c7d793          	srli	a5,a5,0xc
    80001db0:	0000b717          	auipc	a4,0xb
    80001db4:	eb870713          	addi	a4,a4,-328 # 8000cc68 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001db8:	00f73023          	sd	a5,0(a4)
    numOfBlocks = sizeOfBitVectorInUint64 * sizeof(uint64) * 8; //da se zaokruzi broj postojecih blokova na umnozak 64
    80001dbc:	00679613          	slli	a2,a5,0x6
    80001dc0:	00c73c23          	sd	a2,24(a4)
    uint64 blocksForBitVector = (sizeOfBitVectorInUint64 * sizeof(uint64) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80001dc4:	00878513          	addi	a0,a5,8
    80001dc8:	00351513          	slli	a0,a0,0x3
    80001dcc:	fff50513          	addi	a0,a0,-1
    80001dd0:	00655513          	srli	a0,a0,0x6
    bitVector = (uint64*)HEAP_START_ADDR;
    80001dd4:	00d73423          	sd	a3,8(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001dd8:	00000793          	li	a5,0
    80001ddc:	0000b717          	auipc	a4,0xb
    80001de0:	e8c73703          	ld	a4,-372(a4) # 8000cc68 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001de4:	02e7f063          	bgeu	a5,a4,80001e04 <_ZN7KMemory16initializeMemoryEv+0x90>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    80001de8:	00379693          	slli	a3,a5,0x3
    80001dec:	0000b717          	auipc	a4,0xb
    80001df0:	e8473703          	ld	a4,-380(a4) # 8000cc70 <_ZN7KMemory9bitVectorE>
    80001df4:	00d70733          	add	a4,a4,a3
    80001df8:	00073023          	sd	zero,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001dfc:	00178793          	addi	a5,a5,1
    80001e00:	fddff06f          	j	80001ddc <_ZN7KMemory16initializeMemoryEv+0x68>
    kmalloc(blocksForBitVector);
    80001e04:	00000097          	auipc	ra,0x0
    80001e08:	e14080e7          	jalr	-492(ra) # 80001c18 <_ZN7KMemory7kmallocEm>
    initialized = true;
    80001e0c:	00100793          	li	a5,1
    80001e10:	0000b717          	auipc	a4,0xb
    80001e14:	e6f70423          	sb	a5,-408(a4) # 8000cc78 <_ZN7KMemory11initializedE>
}
    80001e18:	00813083          	ld	ra,8(sp)
    80001e1c:	00013403          	ld	s0,0(sp)
    80001e20:	01010113          	addi	sp,sp,16
    80001e24:	00008067          	ret
    80001e28:	00008067          	ret

0000000080001e2c <_ZN7KMemory5kfreeEPv>:

int KMemory::kfree(void* ptr) {
    80001e2c:	ff010113          	addi	sp,sp,-16
    80001e30:	00813423          	sd	s0,8(sp)
    80001e34:	01010413          	addi	s0,sp,16
    if (!ptr) return 0;
    80001e38:	08050063          	beqz	a0,80001eb8 <_ZN7KMemory5kfreeEPv+0x8c>
    ptr = (char*)ptr - 2 * sizeof(uint64);
    80001e3c:	ff050793          	addi	a5,a0,-16
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001e40:	0000b717          	auipc	a4,0xb
    80001e44:	cb073703          	ld	a4,-848(a4) # 8000caf0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001e48:	00073703          	ld	a4,0(a4)
    80001e4c:	40e787b3          	sub	a5,a5,a4
    80001e50:	03f7f713          	andi	a4,a5,63
    80001e54:	06071663          	bnez	a4,80001ec0 <_ZN7KMemory5kfreeEPv+0x94>
    uint64 blocksToFree = *(uint64*)ptr;
    80001e58:	ff053583          	ld	a1,-16(a0)
    uint64 blockNum = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    80001e5c:	0067d613          	srli	a2,a5,0x6
    uint64 currentElem = blockNum / 64;
    80001e60:	00c7d513          	srli	a0,a5,0xc
    uint64 currentBit = 63 - blockNum % 64;
    80001e64:	fff64613          	not	a2,a2
    80001e68:	03f67613          	andi	a2,a2,63
    80001e6c:	0080006f          	j	80001e74 <_ZN7KMemory5kfreeEPv+0x48>
    while (blocksToFree > 0) {
        bitVector[currentElem] &= ~maskBit(currentBit);
        blocksToFree--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001e70:	00078613          	mv	a2,a5
    while (blocksToFree > 0) {
    80001e74:	04058a63          	beqz	a1,80001ec8 <_ZN7KMemory5kfreeEPv+0x9c>
    80001e78:	00100793          	li	a5,1
    80001e7c:	00c797b3          	sll	a5,a5,a2
        bitVector[currentElem] &= ~maskBit(currentBit);
    80001e80:	fff7c793          	not	a5,a5
    80001e84:	00351713          	slli	a4,a0,0x3
    80001e88:	0000b697          	auipc	a3,0xb
    80001e8c:	de86b683          	ld	a3,-536(a3) # 8000cc70 <_ZN7KMemory9bitVectorE>
    80001e90:	00e68733          	add	a4,a3,a4
    80001e94:	00073683          	ld	a3,0(a4)
    80001e98:	00f6f7b3          	and	a5,a3,a5
    80001e9c:	00f73023          	sd	a5,0(a4)
        blocksToFree--;
    80001ea0:	fff58593          	addi	a1,a1,-1
        if (currentBit-- == 0) {
    80001ea4:	fff60793          	addi	a5,a2,-1
    80001ea8:	fc0614e3          	bnez	a2,80001e70 <_ZN7KMemory5kfreeEPv+0x44>
            currentElem++;
    80001eac:	00150513          	addi	a0,a0,1
            currentBit = 63;
    80001eb0:	03f00793          	li	a5,63
    80001eb4:	fbdff06f          	j	80001e70 <_ZN7KMemory5kfreeEPv+0x44>
    if (!ptr) return 0;
    80001eb8:	00000513          	li	a0,0
    80001ebc:	0100006f          	j	80001ecc <_ZN7KMemory5kfreeEPv+0xa0>
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001ec0:	fff00513          	li	a0,-1
    80001ec4:	0080006f          	j	80001ecc <_ZN7KMemory5kfreeEPv+0xa0>
        }
    }
    return 0;
    80001ec8:	00000513          	li	a0,0
}
    80001ecc:	00813403          	ld	s0,8(sp)
    80001ed0:	01010113          	addi	sp,sp,16
    80001ed4:	00008067          	ret

0000000080001ed8 <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80001ed8:	ff010113          	addi	sp,sp,-16
    80001edc:	00113423          	sd	ra,8(sp)
    80001ee0:	00813023          	sd	s0,0(sp)
    80001ee4:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80001ee8:	fffff097          	auipc	ra,0xfffff
    80001eec:	544080e7          	jalr	1348(ra) # 8000142c <_Z15thread_dispatchv>
    80001ef0:	ff9ff06f          	j	80001ee8 <_Z4idlePv+0x10>

0000000080001ef4 <_Z22kernelConsumerFunctionPv>:
}

void kernelConsumerFunction(void*) {
    80001ef4:	ff010113          	addi	sp,sp,-16
    80001ef8:	00113423          	sd	ra,8(sp)
    80001efc:	00813023          	sd	s0,0(sp)
    80001f00:	01010413          	addi	s0,sp,16
    80001f04:	0280006f          	j	80001f2c <_Z22kernelConsumerFunctionPv+0x38>
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
        *KConsole::dr = c;
    80001f08:	0000b797          	auipc	a5,0xb
    80001f0c:	c087b783          	ld	a5,-1016(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001f10:	0007b783          	ld	a5,0(a5)
    80001f14:	00a78023          	sb	a0,0(a5)
        sem_signal(KConsole::outputBufferHasSpace);
    80001f18:	0000b797          	auipc	a5,0xb
    80001f1c:	c007b783          	ld	a5,-1024(a5) # 8000cb18 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001f20:	0007b503          	ld	a0,0(a5)
    80001f24:	fffff097          	auipc	ra,0xfffff
    80001f28:	618080e7          	jalr	1560(ra) # 8000153c <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001f2c:	00000097          	auipc	ra,0x0
    80001f30:	8d8080e7          	jalr	-1832(ra) # 80001804 <_ZN8KConsole13getFromOutputEv>
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
    80001f34:	0000b797          	auipc	a5,0xb
    80001f38:	c147b783          	ld	a5,-1004(a5) # 8000cb48 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001f3c:	0007b783          	ld	a5,0(a5)
    80001f40:	0007c783          	lbu	a5,0(a5)
    80001f44:	0207f793          	andi	a5,a5,32
    80001f48:	fe0786e3          	beqz	a5,80001f34 <_Z22kernelConsumerFunctionPv+0x40>
    80001f4c:	fbdff06f          	j	80001f08 <_Z22kernelConsumerFunctionPv+0x14>

0000000080001f50 <main>:
    }

}

int main() {
    80001f50:	fd010113          	addi	sp,sp,-48
    80001f54:	02113423          	sd	ra,40(sp)
    80001f58:	02813023          	sd	s0,32(sp)
    80001f5c:	03010413          	addi	s0,sp,48
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001f60:	0000b797          	auipc	a5,0xb
    80001f64:	bd07b783          	ld	a5,-1072(a5) # 8000cb30 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001f68:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80001f6c:	00000097          	auipc	ra,0x0
    80001f70:	e08080e7          	jalr	-504(ra) # 80001d74 <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001f74:	fffff097          	auipc	ra,0xfffff
    80001f78:	6f0080e7          	jalr	1776(ra) # 80001664 <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, nullptr, nullptr);
    80001f7c:	00000613          	li	a2,0
    80001f80:	00000593          	li	a1,0
    80001f84:	fe840513          	addi	a0,s0,-24
    80001f88:	fffff097          	auipc	ra,0xfffff
    80001f8c:	3f0080e7          	jalr	1008(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80001f90:	fe843783          	ld	a5,-24(s0)

    //static void threadSleep(time_t sleepTime);

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }
    80001f94:	0000b717          	auipc	a4,0xb
    80001f98:	b8c73703          	ld	a4,-1140(a4) # 8000cb20 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001f9c:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001fa0:	00100713          	li	a4,1
    80001fa4:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body) userMain, nullptr);
    80001fa8:	00000613          	li	a2,0
    80001fac:	0000b597          	auipc	a1,0xb
    80001fb0:	b245b583          	ld	a1,-1244(a1) # 8000cad0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001fb4:	fe040513          	addi	a0,s0,-32
    80001fb8:	fffff097          	auipc	ra,0xfffff
    80001fbc:	3c0080e7          	jalr	960(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80001fc0:	00000613          	li	a2,0
    80001fc4:	00000597          	auipc	a1,0x0
    80001fc8:	f3058593          	addi	a1,a1,-208 # 80001ef4 <_Z22kernelConsumerFunctionPv>
    80001fcc:	fd040513          	addi	a0,s0,-48
    80001fd0:	fffff097          	auipc	ra,0xfffff
    80001fd4:	3a8080e7          	jalr	936(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80001fd8:	00000613          	li	a2,0
    80001fdc:	00000597          	auipc	a1,0x0
    80001fe0:	efc58593          	addi	a1,a1,-260 # 80001ed8 <_Z4idlePv>
    80001fe4:	fd840513          	addi	a0,s0,-40
    80001fe8:	fffff097          	auipc	ra,0xfffff
    80001fec:	390080e7          	jalr	912(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001ff0:	00200793          	li	a5,2
    80001ff4:	1007a073          	csrs	sstatus,a5

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80001ff8:	fe043503          	ld	a0,-32(s0)
    80001ffc:	fffff097          	auipc	ra,0xfffff
    80002000:	450080e7          	jalr	1104(ra) # 8000144c <_Z11thread_joinP3TCB>

    //flush output bafera za konzolu
    while (KConsole::outputHead != KConsole::outputTail) {}
    80002004:	0000b797          	auipc	a5,0xb
    80002008:	afc7b783          	ld	a5,-1284(a5) # 8000cb00 <_GLOBAL_OFFSET_TABLE_+0x38>
    8000200c:	0007a703          	lw	a4,0(a5)
    80002010:	0000b797          	auipc	a5,0xb
    80002014:	b307b783          	ld	a5,-1232(a5) # 8000cb40 <_GLOBAL_OFFSET_TABLE_+0x78>
    80002018:	0007a783          	lw	a5,0(a5)
    8000201c:	fef714e3          	bne	a4,a5,80002004 <main+0xb4>
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002020:	00200793          	li	a5,2
    80002024:	1007b073          	csrc	sstatus,a5

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80002028:	00000513          	li	a0,0
    8000202c:	02813083          	ld	ra,40(sp)
    80002030:	02013403          	ld	s0,32(sp)
    80002034:	03010113          	addi	sp,sp,48
    80002038:	00008067          	ret

000000008000203c <interruptRoutine>:
#include "../test/printing.hpp"

//void printInteger(int i);

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    8000203c:	f8010113          	addi	sp,sp,-128
    80002040:	06113c23          	sd	ra,120(sp)
    80002044:	06813823          	sd	s0,112(sp)
    80002048:	06913423          	sd	s1,104(sp)
    8000204c:	08010413          	addi	s0,sp,128
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002050:	14202373          	csrr	t1,scause
    80002054:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002058:	14102373          	csrr	t1,sepc
    8000205c:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002060:	10002373          	csrr	t1,sstatus
    80002064:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4, a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002068:	00050313          	mv	t1,a0
    8000206c:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002070:	00058313          	mv	t1,a1
    80002074:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002078:	00060313          	mv	t1,a2
    8000207c:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002080:	00068313          	mv	t1,a3
    80002084:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002088:	00070313          	mv	t1,a4
    8000208c:	fa643023          	sd	t1,-96(s0)
    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002090:	00078313          	mv	t1,a5
    80002094:	f8643c23          	sd	t1,-104(s0)
    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002098:	00080313          	mv	t1,a6
    8000209c:	f8643823          	sd	t1,-112(s0)
    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800020a0:	00088313          	mv	t1,a7
    800020a4:	f8643423          	sd	t1,-120(s0)

    if (scause == 0x9 || scause == 0x8) {
    800020a8:	fd843703          	ld	a4,-40(s0)
    800020ac:	00900793          	li	a5,9
    800020b0:	00f70863          	beq	a4,a5,800020c0 <interruptRoutine+0x84>
    800020b4:	fd843703          	ld	a4,-40(s0)
    800020b8:	00800793          	li	a5,8
    800020bc:	36f71a63          	bne	a4,a5,80002430 <interruptRoutine+0x3f4>
        //prekid zbog poziva ecall
        switch (a0) {
    800020c0:	fc043703          	ld	a4,-64(s0)
    800020c4:	09100793          	li	a5,145
    800020c8:	2cf70e63          	beq	a4,a5,800023a4 <interruptRoutine+0x368>
    800020cc:	fc043703          	ld	a4,-64(s0)
    800020d0:	09100793          	li	a5,145
    800020d4:	2ee7e063          	bltu	a5,a4,800023b4 <interruptRoutine+0x378>
    800020d8:	fc043703          	ld	a4,-64(s0)
    800020dc:	08100793          	li	a5,129
    800020e0:	28f70e63          	beq	a4,a5,8000237c <interruptRoutine+0x340>
    800020e4:	fc043703          	ld	a4,-64(s0)
    800020e8:	08100793          	li	a5,129
    800020ec:	2ce7e463          	bltu	a5,a4,800023b4 <interruptRoutine+0x378>
    800020f0:	fc043703          	ld	a4,-64(s0)
    800020f4:	04200793          	li	a5,66
    800020f8:	04e7e263          	bltu	a5,a4,8000213c <interruptRoutine+0x100>
    800020fc:	fc043783          	ld	a5,-64(s0)
    80002100:	2a078a63          	beqz	a5,800023b4 <interruptRoutine+0x378>
    80002104:	fc043703          	ld	a4,-64(s0)
    80002108:	04200793          	li	a5,66
    8000210c:	2ae7e463          	bltu	a5,a4,800023b4 <interruptRoutine+0x378>
    80002110:	fc043783          	ld	a5,-64(s0)
    80002114:	00279713          	slli	a4,a5,0x2
    80002118:	00008797          	auipc	a5,0x8
    8000211c:	fdc78793          	addi	a5,a5,-36 # 8000a0f4 <_ZZ9kPrintIntmE6digits+0x84>
    80002120:	00f707b3          	add	a5,a4,a5
    80002124:	0007a783          	lw	a5,0(a5)
    80002128:	0007871b          	sext.w	a4,a5
    8000212c:	00008797          	auipc	a5,0x8
    80002130:	fc878793          	addi	a5,a5,-56 # 8000a0f4 <_ZZ9kPrintIntmE6digits+0x84>
    80002134:	00f707b3          	add	a5,a4,a5
    80002138:	00078067          	jr	a5
    8000213c:	fc043703          	ld	a4,-64(s0)
    80002140:	08000793          	li	a5,128
    80002144:	1ef70663          	beq	a4,a5,80002330 <interruptRoutine+0x2f4>
    80002148:	26c0006f          	j	800023b4 <interruptRoutine+0x378>
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                KMemory::kmalloc((size_t)a1);
    8000214c:	fb843503          	ld	a0,-72(s0)
    80002150:	00000097          	auipc	ra,0x0
    80002154:	ac8080e7          	jalr	-1336(ra) # 80001c18 <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    80002158:	04a43823          	sd	a0,80(s0)
                break;
    8000215c:	2b40006f          	j	80002410 <interruptRoutine+0x3d4>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                KMemory::kfree((void*)a1);
    80002160:	fb843783          	ld	a5,-72(s0)
    80002164:	00078513          	mv	a0,a5
    80002168:	00000097          	auipc	ra,0x0
    8000216c:	cc4080e7          	jalr	-828(ra) # 80001e2c <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    80002170:	04a43823          	sd	a0,80(s0)
                break;
    80002174:	29c0006f          	j	80002410 <interruptRoutine+0x3d4>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002178:	fb043783          	ld	a5,-80(s0)
    8000217c:	fa843703          	ld	a4,-88(s0)
    80002180:	fa043683          	ld	a3,-96(s0)
    80002184:	fb843483          	ld	s1,-72(s0)
    80002188:	00068613          	mv	a2,a3
    8000218c:	00070593          	mv	a1,a4
    80002190:	00078513          	mv	a0,a5
    80002194:	00001097          	auipc	ra,0x1
    80002198:	c28080e7          	jalr	-984(ra) # 80002dbc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    8000219c:	00050793          	mv	a5,a0
    800021a0:	00f4b023          	sd	a5,0(s1)
                if ((TCB::Body)a2 != nullptr) {
    800021a4:	fb043783          	ld	a5,-80(s0)
    800021a8:	00078c63          	beqz	a5,800021c0 <interruptRoutine+0x184>
                    Scheduler::put(*((thread_t*)a1));
    800021ac:	fb843783          	ld	a5,-72(s0)
    800021b0:	0007b783          	ld	a5,0(a5)
    800021b4:	00078513          	mv	a0,a5
    800021b8:	00000097          	auipc	ra,0x0
    800021bc:	89c080e7          	jalr	-1892(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
                }
                if (*((thread_t*)a1) != nullptr) {
    800021c0:	fb843783          	ld	a5,-72(s0)
    800021c4:	0007b783          	ld	a5,0(a5)
    800021c8:	00078663          	beqz	a5,800021d4 <interruptRoutine+0x198>
                    __asm__ volatile("li a0, 0");
    800021cc:	00000513          	li	a0,0
    800021d0:	0080006f          	j	800021d8 <interruptRoutine+0x19c>
                } else {
                    __asm__ volatile("li a0, -1");
    800021d4:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800021d8:	04a43823          	sd	a0,80(s0)
                break;
    800021dc:	2340006f          	j	80002410 <interruptRoutine+0x3d4>
            case 0x12:
                //thread_exit
                TCB::getRunning()->setStatus(TCB::FINISHED);
    800021e0:	00000097          	auipc	ra,0x0
    800021e4:	448080e7          	jalr	1096(ra) # 80002628 <_ZN3TCB10getRunningEv>
    800021e8:	00050793          	mv	a5,a0
    800021ec:	00500593          	li	a1,5
    800021f0:	00078513          	mv	a0,a5
    800021f4:	00000097          	auipc	ra,0x0
    800021f8:	3fc080e7          	jalr	1020(ra) # 800025f0 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined();
    800021fc:	00001097          	auipc	ra,0x1
    80002200:	ce0080e7          	jalr	-800(ra) # 80002edc <_ZN3TCB13releaseJoinedEv>
                TCB::dispatch();
    80002204:	00001097          	auipc	ra,0x1
    80002208:	ae4080e7          	jalr	-1308(ra) # 80002ce8 <_ZN3TCB8dispatchEv>
                break;
    8000220c:	2040006f          	j	80002410 <interruptRoutine+0x3d4>
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
    80002210:	00001097          	auipc	ra,0x1
    80002214:	ad8080e7          	jalr	-1320(ra) # 80002ce8 <_ZN3TCB8dispatchEv>
                //TCB::dispatch();
                break;
    80002218:	1f80006f          	j	80002410 <interruptRoutine+0x3d4>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    8000221c:	fb843783          	ld	a5,-72(s0)
    80002220:	00078513          	mv	a0,a5
    80002224:	00001097          	auipc	ra,0x1
    80002228:	c6c080e7          	jalr	-916(ra) # 80002e90 <_ZN3TCB10threadJoinEPS_>
                TCB::dispatch();
    8000222c:	00001097          	auipc	ra,0x1
    80002230:	abc080e7          	jalr	-1348(ra) # 80002ce8 <_ZN3TCB8dispatchEv>
                break;
    80002234:	1dc0006f          	j	80002410 <interruptRoutine+0x3d4>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    80002238:	fb043783          	ld	a5,-80(s0)
    8000223c:	0007879b          	sext.w	a5,a5
    80002240:	fb843483          	ld	s1,-72(s0)
    80002244:	00078513          	mv	a0,a5
    80002248:	00001097          	auipc	ra,0x1
    8000224c:	dac080e7          	jalr	-596(ra) # 80002ff4 <_ZN4KSem7initSemEj>
    80002250:	00050793          	mv	a5,a0
    80002254:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    80002258:	fb843783          	ld	a5,-72(s0)
    8000225c:	0007b783          	ld	a5,0(a5)
    80002260:	00078663          	beqz	a5,8000226c <interruptRoutine+0x230>
                    __asm__ volatile("li a0, 0");
    80002264:	00000513          	li	a0,0
    80002268:	0080006f          	j	80002270 <interruptRoutine+0x234>
                } else {
                    __asm__ volatile("li a0, -1");
    8000226c:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002270:	04a43823          	sd	a0,80(s0)
                break;
    80002274:	19c0006f          	j	80002410 <interruptRoutine+0x3d4>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    80002278:	fb843783          	ld	a5,-72(s0)
    8000227c:	00078513          	mv	a0,a5
    80002280:	00001097          	auipc	ra,0x1
    80002284:	ef0080e7          	jalr	-272(ra) # 80003170 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    80002288:	04a43823          	sd	a0,80(s0)
                break;
    8000228c:	1840006f          	j	80002410 <interruptRoutine+0x3d4>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80002290:	fb843783          	ld	a5,-72(s0)
    80002294:	00078513          	mv	a0,a5
    80002298:	00001097          	auipc	ra,0x1
    8000229c:	df0080e7          	jalr	-528(ra) # 80003088 <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    800022a0:	04a43823          	sd	a0,80(s0)
                break;
    800022a4:	16c0006f          	j	80002410 <interruptRoutine+0x3d4>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    800022a8:	fb843783          	ld	a5,-72(s0)
    800022ac:	00078513          	mv	a0,a5
    800022b0:	00001097          	auipc	ra,0x1
    800022b4:	e6c080e7          	jalr	-404(ra) # 8000311c <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    800022b8:	04a43823          	sd	a0,80(s0)
                break;
    800022bc:	1540006f          	j	80002410 <interruptRoutine+0x3d4>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    800022c0:	fb843783          	ld	a5,-72(s0)
    800022c4:	00078663          	beqz	a5,800022d0 <interruptRoutine+0x294>
                    __asm__ volatile("li a0, 0");
    800022c8:	00000513          	li	a0,0
    800022cc:	0080006f          	j	800022d4 <interruptRoutine+0x298>
                } else {
                    __asm__ volatile("li a0, -1");
    800022d0:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800022d4:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    800022d8:	fb843783          	ld	a5,-72(s0)
    800022dc:	12078863          	beqz	a5,8000240c <interruptRoutine+0x3d0>
                    Scheduler::putToSleep(TCB::getRunning(), (time_t)a1);
    800022e0:	00000097          	auipc	ra,0x0
    800022e4:	348080e7          	jalr	840(ra) # 80002628 <_ZN3TCB10getRunningEv>
    800022e8:	00050793          	mv	a5,a0
    800022ec:	fb843583          	ld	a1,-72(s0)
    800022f0:	00078513          	mv	a0,a5
    800022f4:	fffff097          	auipc	ra,0xfffff
    800022f8:	7ec080e7          	jalr	2028(ra) # 80001ae0 <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::dispatch();
    800022fc:	00001097          	auipc	ra,0x1
    80002300:	9ec080e7          	jalr	-1556(ra) # 80002ce8 <_ZN3TCB8dispatchEv>
                }
                break;
    80002304:	1080006f          	j	8000240c <interruptRoutine+0x3d0>
            case 0x41:
                //getc
                KConsole::kgetc();
    80002308:	fffff097          	auipc	ra,0xfffff
    8000230c:	630080e7          	jalr	1584(ra) # 80001938 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002310:	04a43823          	sd	a0,80(s0)
                break;
    80002314:	0fc0006f          	j	80002410 <interruptRoutine+0x3d4>
            case 0x42:
                //putc
                //a1 = karakter koji se upisuje u bafer za ispis na konzolu
                KConsole::kputc((char)a1);
    80002318:	fb843783          	ld	a5,-72(s0)
    8000231c:	0ff7f793          	andi	a5,a5,255
    80002320:	00078513          	mv	a0,a5
    80002324:	fffff097          	auipc	ra,0xfffff
    80002328:	5a4080e7          	jalr	1444(ra) # 800018c8 <_ZN8KConsole5kputcEc>
                break;
    8000232c:	0e40006f          	j	80002410 <interruptRoutine+0x3d4>
                //alloc thread
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002330:	fb043783          	ld	a5,-80(s0)
    80002334:	fa843703          	ld	a4,-88(s0)
    80002338:	fa043683          	ld	a3,-96(s0)
    8000233c:	fb843483          	ld	s1,-72(s0)
    80002340:	00068613          	mv	a2,a3
    80002344:	00070593          	mv	a1,a4
    80002348:	00078513          	mv	a0,a5
    8000234c:	00001097          	auipc	ra,0x1
    80002350:	a70080e7          	jalr	-1424(ra) # 80002dbc <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002354:	00050793          	mv	a5,a0
    80002358:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    8000235c:	fb843783          	ld	a5,-72(s0)
    80002360:	0007b783          	ld	a5,0(a5)
    80002364:	00078663          	beqz	a5,80002370 <interruptRoutine+0x334>
                    __asm__ volatile("li a0, 0");
    80002368:	00000513          	li	a0,0
    8000236c:	0080006f          	j	80002374 <interruptRoutine+0x338>
                } else {
                    __asm__ volatile("li a0, -1");
    80002370:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002374:	04a43823          	sd	a0,80(s0)
                break;
    80002378:	0980006f          	j	80002410 <interruptRoutine+0x3d4>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                //if (((thread_t)a1)->getBody() != nullptr) {
                    Scheduler::put((thread_t)a1);
    8000237c:	fb843783          	ld	a5,-72(s0)
    80002380:	00078513          	mv	a0,a5
    80002384:	fffff097          	auipc	ra,0xfffff
    80002388:	6d0080e7          	jalr	1744(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
                    ((thread_t)a1)->setStatus(TCB::ACTIVE);
    8000238c:	fb843783          	ld	a5,-72(s0)
    80002390:	00100593          	li	a1,1
    80002394:	00078513          	mv	a0,a5
    80002398:	00000097          	auipc	ra,0x0
    8000239c:	258080e7          	jalr	600(ra) # 800025f0 <_ZN3TCB9setStatusENS_12ThreadStatusE>
                //}
                break;
    800023a0:	0700006f          	j	80002410 <interruptRoutine+0x3d4>
            case 0x91:
                //printInteger
                //a1 = integer za ispis
                kPrintInt(a1);
    800023a4:	fb843503          	ld	a0,-72(s0)
    800023a8:	fffff097          	auipc	ra,0xfffff
    800023ac:	61c080e7          	jalr	1564(ra) # 800019c4 <_Z9kPrintIntm>
                break;
    800023b0:	0600006f          	j	80002410 <interruptRoutine+0x3d4>
            default:
                printString("\nNepostojeci op code: ");
    800023b4:	00008517          	auipc	a0,0x8
    800023b8:	ccc50513          	addi	a0,a0,-820 # 8000a080 <_ZZ9kPrintIntmE6digits+0x10>
    800023bc:	00003097          	auipc	ra,0x3
    800023c0:	510080e7          	jalr	1296(ra) # 800058cc <_Z11printStringPKc>
                kPrintInt(a0);
    800023c4:	fc043503          	ld	a0,-64(s0)
    800023c8:	fffff097          	auipc	ra,0xfffff
    800023cc:	5fc080e7          	jalr	1532(ra) # 800019c4 <_Z9kPrintIntm>
                printString("\nscause: ");
    800023d0:	00008517          	auipc	a0,0x8
    800023d4:	cc850513          	addi	a0,a0,-824 # 8000a098 <_ZZ9kPrintIntmE6digits+0x28>
    800023d8:	00003097          	auipc	ra,0x3
    800023dc:	4f4080e7          	jalr	1268(ra) # 800058cc <_Z11printStringPKc>
                kPrintInt(scause);
    800023e0:	fd843503          	ld	a0,-40(s0)
    800023e4:	fffff097          	auipc	ra,0xfffff
    800023e8:	5e0080e7          	jalr	1504(ra) # 800019c4 <_Z9kPrintIntm>
                printString("\nsepc: ");
    800023ec:	00008517          	auipc	a0,0x8
    800023f0:	cbc50513          	addi	a0,a0,-836 # 8000a0a8 <_ZZ9kPrintIntmE6digits+0x38>
    800023f4:	00003097          	auipc	ra,0x3
    800023f8:	4d8080e7          	jalr	1240(ra) # 800058cc <_Z11printStringPKc>
                kPrintInt(sepc);
    800023fc:	fd043503          	ld	a0,-48(s0)
    80002400:	fffff097          	auipc	ra,0xfffff
    80002404:	5c4080e7          	jalr	1476(ra) # 800019c4 <_Z9kPrintIntm>
                break;
    80002408:	0080006f          	j	80002410 <interruptRoutine+0x3d4>
                break;
    8000240c:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    80002410:	fd043783          	ld	a5,-48(s0)
    80002414:	00478793          	addi	a5,a5,4
    80002418:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    8000241c:	fd043783          	ld	a5,-48(s0)
    80002420:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002424:	fc843783          	ld	a5,-56(s0)
    80002428:	10079073          	csrw	sstatus,a5
        printString("scause: ");
        kPrintInt(scause);
        printString("\nsepc: ");
        kPrintInt(sepc);
    }
    8000242c:	1900006f          	j	800025bc <interruptRoutine+0x580>
    } else if (scause == 0x8000000000000009) {
    80002430:	fd843703          	ld	a4,-40(s0)
    80002434:	fff00793          	li	a5,-1
    80002438:	03f79793          	slli	a5,a5,0x3f
    8000243c:	00978793          	addi	a5,a5,9
    80002440:	08f71e63          	bne	a4,a5,800024dc <interruptRoutine+0x4a0>
        uint64 irq = plic_claim();
    80002444:	00005097          	auipc	ra,0x5
    80002448:	4d0080e7          	jalr	1232(ra) # 80007914 <plic_claim>
    8000244c:	00050793          	mv	a5,a0
    80002450:	f8f43023          	sd	a5,-128(s0)
        if (irq == CONSOLE_IRQ) {
    80002454:	f8043703          	ld	a4,-128(s0)
    80002458:	00a00793          	li	a5,10
    8000245c:	02f71e63          	bne	a4,a5,80002498 <interruptRoutine+0x45c>
            if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    80002460:	0000a797          	auipc	a5,0xa
    80002464:	6e87b783          	ld	a5,1768(a5) # 8000cb48 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002468:	0007b783          	ld	a5,0(a5)
    8000246c:	0007c783          	lbu	a5,0(a5)
    80002470:	0017f793          	andi	a5,a5,1
    80002474:	02078a63          	beqz	a5,800024a8 <interruptRoutine+0x46c>
                KConsole::placeInInput(*KConsole::dr);
    80002478:	0000a797          	auipc	a5,0xa
    8000247c:	6987b783          	ld	a5,1688(a5) # 8000cb10 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002480:	0007b783          	ld	a5,0(a5)
    80002484:	0007c783          	lbu	a5,0(a5)
    80002488:	00078513          	mv	a0,a5
    8000248c:	fffff097          	auipc	ra,0xfffff
    80002490:	3d0080e7          	jalr	976(ra) # 8000185c <_ZN8KConsole12placeInInputEc>
    80002494:	0140006f          	j	800024a8 <interruptRoutine+0x46c>
            printString("Neki drugi prekid\n");
    80002498:	00008517          	auipc	a0,0x8
    8000249c:	c1850513          	addi	a0,a0,-1000 # 8000a0b0 <_ZZ9kPrintIntmE6digits+0x40>
    800024a0:	00003097          	auipc	ra,0x3
    800024a4:	42c080e7          	jalr	1068(ra) # 800058cc <_Z11printStringPKc>
        plic_complete(irq);
    800024a8:	f8043783          	ld	a5,-128(s0)
    800024ac:	0007879b          	sext.w	a5,a5
    800024b0:	00078513          	mv	a0,a5
    800024b4:	00005097          	auipc	ra,0x5
    800024b8:	498080e7          	jalr	1176(ra) # 8000794c <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800024bc:	fd043783          	ld	a5,-48(s0)
    800024c0:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800024c4:	fc843783          	ld	a5,-56(s0)
    800024c8:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    800024cc:	20000513          	li	a0,512
    800024d0:	00000097          	auipc	ra,0x0
    800024d4:	104080e7          	jalr	260(ra) # 800025d4 <_ZN5Riscv6mc_sipEm>
    800024d8:	0e40006f          	j	800025bc <interruptRoutine+0x580>
    } else if (scause == 0x8000000000000001) {
    800024dc:	fd843703          	ld	a4,-40(s0)
    800024e0:	fff00793          	li	a5,-1
    800024e4:	03f79793          	slli	a5,a5,0x3f
    800024e8:	00178793          	addi	a5,a5,1
    800024ec:	08f71463          	bne	a4,a5,80002574 <interruptRoutine+0x538>
        Scheduler::wake();
    800024f0:	fffff097          	auipc	ra,0xfffff
    800024f4:	6a0080e7          	jalr	1696(ra) # 80001b90 <_ZN9Scheduler4wakeEv>
        TCB::getRunningTimeSlice()++;
    800024f8:	00000097          	auipc	ra,0x0
    800024fc:	154080e7          	jalr	340(ra) # 8000264c <_ZN3TCB19getRunningTimeSliceEv>
    80002500:	00050793          	mv	a5,a0
    80002504:	0007b703          	ld	a4,0(a5)
    80002508:	00170713          	addi	a4,a4,1
    8000250c:	00e7b023          	sd	a4,0(a5)
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
    80002510:	00000097          	auipc	ra,0x0
    80002514:	13c080e7          	jalr	316(ra) # 8000264c <_ZN3TCB19getRunningTimeSliceEv>
    80002518:	00050793          	mv	a5,a0
    8000251c:	0007b483          	ld	s1,0(a5)
    80002520:	00000097          	auipc	ra,0x0
    80002524:	108080e7          	jalr	264(ra) # 80002628 <_ZN3TCB10getRunningEv>
    80002528:	00050793          	mv	a5,a0
    8000252c:	00078513          	mv	a0,a5
    80002530:	00000097          	auipc	ra,0x0
    80002534:	0dc080e7          	jalr	220(ra) # 8000260c <_ZN3TCB12getTimeSliceEv>
    80002538:	00050793          	mv	a5,a0
    8000253c:	00f4b7b3          	sltu	a5,s1,a5
    80002540:	0017c793          	xori	a5,a5,1
    80002544:	0ff7f793          	andi	a5,a5,255
    80002548:	00078663          	beqz	a5,80002554 <interruptRoutine+0x518>
            TCB::dispatch();
    8000254c:	00000097          	auipc	ra,0x0
    80002550:	79c080e7          	jalr	1948(ra) # 80002ce8 <_ZN3TCB8dispatchEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002554:	fd043783          	ld	a5,-48(s0)
    80002558:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    8000255c:	fc843783          	ld	a5,-56(s0)
    80002560:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    80002564:	00200513          	li	a0,2
    80002568:	00000097          	auipc	ra,0x0
    8000256c:	06c080e7          	jalr	108(ra) # 800025d4 <_ZN5Riscv6mc_sipEm>
    80002570:	04c0006f          	j	800025bc <interruptRoutine+0x580>
        printString("\nGreska u prekidnoj rutini\n");
    80002574:	00008517          	auipc	a0,0x8
    80002578:	b5450513          	addi	a0,a0,-1196 # 8000a0c8 <_ZZ9kPrintIntmE6digits+0x58>
    8000257c:	00003097          	auipc	ra,0x3
    80002580:	350080e7          	jalr	848(ra) # 800058cc <_Z11printStringPKc>
        printString("scause: ");
    80002584:	00008517          	auipc	a0,0x8
    80002588:	b6450513          	addi	a0,a0,-1180 # 8000a0e8 <_ZZ9kPrintIntmE6digits+0x78>
    8000258c:	00003097          	auipc	ra,0x3
    80002590:	340080e7          	jalr	832(ra) # 800058cc <_Z11printStringPKc>
        kPrintInt(scause);
    80002594:	fd843503          	ld	a0,-40(s0)
    80002598:	fffff097          	auipc	ra,0xfffff
    8000259c:	42c080e7          	jalr	1068(ra) # 800019c4 <_Z9kPrintIntm>
        printString("\nsepc: ");
    800025a0:	00008517          	auipc	a0,0x8
    800025a4:	b0850513          	addi	a0,a0,-1272 # 8000a0a8 <_ZZ9kPrintIntmE6digits+0x38>
    800025a8:	00003097          	auipc	ra,0x3
    800025ac:	324080e7          	jalr	804(ra) # 800058cc <_Z11printStringPKc>
        kPrintInt(sepc);
    800025b0:	fd043503          	ld	a0,-48(s0)
    800025b4:	fffff097          	auipc	ra,0xfffff
    800025b8:	410080e7          	jalr	1040(ra) # 800019c4 <_Z9kPrintIntm>
    800025bc:	00000013          	nop
    800025c0:	07813083          	ld	ra,120(sp)
    800025c4:	07013403          	ld	s0,112(sp)
    800025c8:	06813483          	ld	s1,104(sp)
    800025cc:	08010113          	addi	sp,sp,128
    800025d0:	00008067          	ret

00000000800025d4 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    800025d4:	ff010113          	addi	sp,sp,-16
    800025d8:	00813423          	sd	s0,8(sp)
    800025dc:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    800025e0:	14453073          	csrc	sip,a0
}
    800025e4:	00813403          	ld	s0,8(sp)
    800025e8:	01010113          	addi	sp,sp,16
    800025ec:	00008067          	ret

00000000800025f0 <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    800025f0:	ff010113          	addi	sp,sp,-16
    800025f4:	00813423          	sd	s0,8(sp)
    800025f8:	01010413          	addi	s0,sp,16
    800025fc:	04b52c23          	sw	a1,88(a0)
    80002600:	00813403          	ld	s0,8(sp)
    80002604:	01010113          	addi	sp,sp,16
    80002608:	00008067          	ret

000000008000260c <_ZN3TCB12getTimeSliceEv>:
    uint64 getTimeSlice() { return timeSlice; }
    8000260c:	ff010113          	addi	sp,sp,-16
    80002610:	00813423          	sd	s0,8(sp)
    80002614:	01010413          	addi	s0,sp,16
    80002618:	02853503          	ld	a0,40(a0)
    8000261c:	00813403          	ld	s0,8(sp)
    80002620:	01010113          	addi	sp,sp,16
    80002624:	00008067          	ret

0000000080002628 <_ZN3TCB10getRunningEv>:
    static TCB* getRunning() { return running; }
    80002628:	ff010113          	addi	sp,sp,-16
    8000262c:	00813423          	sd	s0,8(sp)
    80002630:	01010413          	addi	s0,sp,16
    80002634:	0000a797          	auipc	a5,0xa
    80002638:	4ec7b783          	ld	a5,1260(a5) # 8000cb20 <_GLOBAL_OFFSET_TABLE_+0x58>
    8000263c:	0007b503          	ld	a0,0(a5)
    80002640:	00813403          	ld	s0,8(sp)
    80002644:	01010113          	addi	sp,sp,16
    80002648:	00008067          	ret

000000008000264c <_ZN3TCB19getRunningTimeSliceEv>:

    static uint64 &getRunningTimeSlice() { return runningTimeSlice; }
    8000264c:	ff010113          	addi	sp,sp,-16
    80002650:	00813423          	sd	s0,8(sp)
    80002654:	01010413          	addi	s0,sp,16
    80002658:	0000a517          	auipc	a0,0xa
    8000265c:	48853503          	ld	a0,1160(a0) # 8000cae0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002660:	00813403          	ld	s0,8(sp)
    80002664:	01010113          	addi	sp,sp,16
    80002668:	00008067          	ret

000000008000266c <_ZN6Thread7wrapperEPv>:

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
    8000266c:	02050863          	beqz	a0,8000269c <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    80002670:	ff010113          	addi	sp,sp,-16
    80002674:	00113423          	sd	ra,8(sp)
    80002678:	00813023          	sd	s0,0(sp)
    8000267c:	01010413          	addi	s0,sp,16
        ((Thread*)thread)->run();
    80002680:	00053783          	ld	a5,0(a0)
    80002684:	0107b783          	ld	a5,16(a5)
    80002688:	000780e7          	jalr	a5
    }
}
    8000268c:	00813083          	ld	ra,8(sp)
    80002690:	00013403          	ld	s0,0(sp)
    80002694:	01010113          	addi	sp,sp,16
    80002698:	00008067          	ret
    8000269c:	00008067          	ret

00000000800026a0 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800026a0:	fe010113          	addi	sp,sp,-32
    800026a4:	00113c23          	sd	ra,24(sp)
    800026a8:	00813823          	sd	s0,16(sp)
    800026ac:	00913423          	sd	s1,8(sp)
    800026b0:	02010413          	addi	s0,sp,32
    800026b4:	00050493          	mv	s1,a0
    800026b8:	0000a797          	auipc	a5,0xa
    800026bc:	1f878793          	addi	a5,a5,504 # 8000c8b0 <_ZTV6Thread+0x10>
    800026c0:	00f53023          	sd	a5,0(a0)
    thread_join(this->myHandle);
    800026c4:	00853503          	ld	a0,8(a0)
    800026c8:	fffff097          	auipc	ra,0xfffff
    800026cc:	d84080e7          	jalr	-636(ra) # 8000144c <_Z11thread_joinP3TCB>
    delete myHandle;
    800026d0:	0084b483          	ld	s1,8(s1)
    800026d4:	02048863          	beqz	s1,80002704 <_ZN6ThreadD1Ev+0x64>
            delete node;
        }
    }

    bool isEmpty() const {
        bool ret = front == nullptr;
    800026d8:	0484b503          	ld	a0,72(s1)
        while (!isEmpty()) {
    800026dc:	00050e63          	beqz	a0,800026f8 <_ZN6ThreadD1Ev+0x58>
            front = front->next;
    800026e0:	00853783          	ld	a5,8(a0)
    800026e4:	04f4b423          	sd	a5,72(s1)
            delete node;
    800026e8:	fe0508e3          	beqz	a0,800026d8 <_ZN6ThreadD1Ev+0x38>
            mem_free(ptr);
    800026ec:	fffff097          	auipc	ra,0xfffff
    800026f0:	c5c080e7          	jalr	-932(ra) # 80001348 <_Z8mem_freePv>
        }
    800026f4:	fe5ff06f          	j	800026d8 <_ZN6ThreadD1Ev+0x38>
    800026f8:	00048513          	mv	a0,s1
    800026fc:	00000097          	auipc	ra,0x0
    80002700:	76c080e7          	jalr	1900(ra) # 80002e68 <_ZN3TCBdlEPv>
}
    80002704:	01813083          	ld	ra,24(sp)
    80002708:	01013403          	ld	s0,16(sp)
    8000270c:	00813483          	ld	s1,8(sp)
    80002710:	02010113          	addi	sp,sp,32
    80002714:	00008067          	ret

0000000080002718 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002718:	fe010113          	addi	sp,sp,-32
    8000271c:	00113c23          	sd	ra,24(sp)
    80002720:	00813823          	sd	s0,16(sp)
    80002724:	00913423          	sd	s1,8(sp)
    80002728:	02010413          	addi	s0,sp,32
    8000272c:	00050493          	mv	s1,a0
    80002730:	0000a797          	auipc	a5,0xa
    80002734:	1a878793          	addi	a5,a5,424 # 8000c8d8 <_ZTV9Semaphore+0x10>
    80002738:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    8000273c:	00853503          	ld	a0,8(a0)
    80002740:	fffff097          	auipc	ra,0xfffff
    80002744:	d9c080e7          	jalr	-612(ra) # 800014dc <_Z9sem_closeP4KSem>
    delete myHandle;
    80002748:	0084b483          	ld	s1,8(s1)
    8000274c:	02048863          	beqz	s1,8000277c <_ZN9SemaphoreD1Ev+0x64>
        bool ret = front == nullptr;
    80002750:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002754:	00050e63          	beqz	a0,80002770 <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    80002758:	00853783          	ld	a5,8(a0)
    8000275c:	00f4b423          	sd	a5,8(s1)
            delete node;
    80002760:	fe0508e3          	beqz	a0,80002750 <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    80002764:	fffff097          	auipc	ra,0xfffff
    80002768:	be4080e7          	jalr	-1052(ra) # 80001348 <_Z8mem_freePv>
        }
    8000276c:	fe5ff06f          	j	80002750 <_ZN9SemaphoreD1Ev+0x38>
    80002770:	00048513          	mv	a0,s1
    80002774:	00001097          	auipc	ra,0x1
    80002778:	858080e7          	jalr	-1960(ra) # 80002fcc <_ZN4KSemdlEPv>
}
    8000277c:	01813083          	ld	ra,24(sp)
    80002780:	01013403          	ld	s0,16(sp)
    80002784:	00813483          	ld	s1,8(sp)
    80002788:	02010113          	addi	sp,sp,32
    8000278c:	00008067          	ret

0000000080002790 <_Znwm>:
void* operator new(size_t size) {
    80002790:	ff010113          	addi	sp,sp,-16
    80002794:	00113423          	sd	ra,8(sp)
    80002798:	00813023          	sd	s0,0(sp)
    8000279c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800027a0:	fffff097          	auipc	ra,0xfffff
    800027a4:	b68080e7          	jalr	-1176(ra) # 80001308 <_Z9mem_allocm>
}
    800027a8:	00813083          	ld	ra,8(sp)
    800027ac:	00013403          	ld	s0,0(sp)
    800027b0:	01010113          	addi	sp,sp,16
    800027b4:	00008067          	ret

00000000800027b8 <_Znam>:
void* operator new[](size_t size) {
    800027b8:	ff010113          	addi	sp,sp,-16
    800027bc:	00113423          	sd	ra,8(sp)
    800027c0:	00813023          	sd	s0,0(sp)
    800027c4:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800027c8:	fffff097          	auipc	ra,0xfffff
    800027cc:	b40080e7          	jalr	-1216(ra) # 80001308 <_Z9mem_allocm>
}
    800027d0:	00813083          	ld	ra,8(sp)
    800027d4:	00013403          	ld	s0,0(sp)
    800027d8:	01010113          	addi	sp,sp,16
    800027dc:	00008067          	ret

00000000800027e0 <_ZdlPv>:
noexcept {
    800027e0:	ff010113          	addi	sp,sp,-16
    800027e4:	00113423          	sd	ra,8(sp)
    800027e8:	00813023          	sd	s0,0(sp)
    800027ec:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800027f0:	fffff097          	auipc	ra,0xfffff
    800027f4:	b58080e7          	jalr	-1192(ra) # 80001348 <_Z8mem_freePv>
}
    800027f8:	00813083          	ld	ra,8(sp)
    800027fc:	00013403          	ld	s0,0(sp)
    80002800:	01010113          	addi	sp,sp,16
    80002804:	00008067          	ret

0000000080002808 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002808:	fe010113          	addi	sp,sp,-32
    8000280c:	00113c23          	sd	ra,24(sp)
    80002810:	00813823          	sd	s0,16(sp)
    80002814:	00913423          	sd	s1,8(sp)
    80002818:	02010413          	addi	s0,sp,32
    8000281c:	00050493          	mv	s1,a0
}
    80002820:	00000097          	auipc	ra,0x0
    80002824:	e80080e7          	jalr	-384(ra) # 800026a0 <_ZN6ThreadD1Ev>
    80002828:	00048513          	mv	a0,s1
    8000282c:	00000097          	auipc	ra,0x0
    80002830:	fb4080e7          	jalr	-76(ra) # 800027e0 <_ZdlPv>
    80002834:	01813083          	ld	ra,24(sp)
    80002838:	01013403          	ld	s0,16(sp)
    8000283c:	00813483          	ld	s1,8(sp)
    80002840:	02010113          	addi	sp,sp,32
    80002844:	00008067          	ret

0000000080002848 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002848:	fe010113          	addi	sp,sp,-32
    8000284c:	00113c23          	sd	ra,24(sp)
    80002850:	00813823          	sd	s0,16(sp)
    80002854:	00913423          	sd	s1,8(sp)
    80002858:	02010413          	addi	s0,sp,32
    8000285c:	00050493          	mv	s1,a0
}
    80002860:	00000097          	auipc	ra,0x0
    80002864:	eb8080e7          	jalr	-328(ra) # 80002718 <_ZN9SemaphoreD1Ev>
    80002868:	00048513          	mv	a0,s1
    8000286c:	00000097          	auipc	ra,0x0
    80002870:	f74080e7          	jalr	-140(ra) # 800027e0 <_ZdlPv>
    80002874:	01813083          	ld	ra,24(sp)
    80002878:	01013403          	ld	s0,16(sp)
    8000287c:	00813483          	ld	s1,8(sp)
    80002880:	02010113          	addi	sp,sp,32
    80002884:	00008067          	ret

0000000080002888 <_ZdaPv>:
noexcept {
    80002888:	ff010113          	addi	sp,sp,-16
    8000288c:	00113423          	sd	ra,8(sp)
    80002890:	00813023          	sd	s0,0(sp)
    80002894:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002898:	fffff097          	auipc	ra,0xfffff
    8000289c:	ab0080e7          	jalr	-1360(ra) # 80001348 <_Z8mem_freePv>
}
    800028a0:	00813083          	ld	ra,8(sp)
    800028a4:	00013403          	ld	s0,0(sp)
    800028a8:	01010113          	addi	sp,sp,16
    800028ac:	00008067          	ret

00000000800028b0 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    800028b0:	fd010113          	addi	sp,sp,-48
    800028b4:	02113423          	sd	ra,40(sp)
    800028b8:	02813023          	sd	s0,32(sp)
    800028bc:	00913c23          	sd	s1,24(sp)
    800028c0:	01213823          	sd	s2,16(sp)
    800028c4:	01313423          	sd	s3,8(sp)
    800028c8:	03010413          	addi	s0,sp,48
    800028cc:	00050493          	mv	s1,a0
    800028d0:	00058913          	mv	s2,a1
    800028d4:	00060993          	mv	s3,a2
    800028d8:	0000a797          	auipc	a5,0xa
    800028dc:	fd878793          	addi	a5,a5,-40 # 8000c8b0 <_ZTV6Thread+0x10>
    800028e0:	00f53023          	sd	a5,0(a0)
    this->body = body;
    800028e4:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    800028e8:	00c53c23          	sd	a2,24(a0)
    if (body != nullptr) {
    800028ec:	04058663          	beqz	a1,80002938 <_ZN6ThreadC1EPFvPvES0_+0x88>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800028f0:	00001537          	lui	a0,0x1
    800028f4:	fffff097          	auipc	ra,0xfffff
    800028f8:	a14080e7          	jalr	-1516(ra) # 80001308 <_Z9mem_allocm>
    800028fc:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002900:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002904:	00098693          	mv	a3,s3
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002908:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000290c:	00848493          	addi	s1,s1,8
    80002910:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002914:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002918:	00000073          	ecall
}
    8000291c:	02813083          	ld	ra,40(sp)
    80002920:	02013403          	ld	s0,32(sp)
    80002924:	01813483          	ld	s1,24(sp)
    80002928:	01013903          	ld	s2,16(sp)
    8000292c:	00813983          	ld	s3,8(sp)
    80002930:	03010113          	addi	sp,sp,48
    80002934:	00008067          	ret
    uint64* stack = nullptr;
    80002938:	00000313          	li	t1,0
    8000293c:	fc5ff06f          	j	80002900 <_ZN6ThreadC1EPFvPvES0_+0x50>

0000000080002940 <_ZN6Thread5startEv>:
int Thread::start() {
    80002940:	ff010113          	addi	sp,sp,-16
    80002944:	00813423          	sd	s0,8(sp)
    80002948:	01010413          	addi	s0,sp,16
    if (myHandle == nullptr) return -1;
    8000294c:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    80002950:	02030063          	beqz	t1,80002970 <_ZN6Thread5startEv+0x30>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002954:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    80002958:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    8000295c:	00000073          	ecall
    return 0;
    80002960:	00000513          	li	a0,0
}
    80002964:	00813403          	ld	s0,8(sp)
    80002968:	01010113          	addi	sp,sp,16
    8000296c:	00008067          	ret
    if (myHandle == nullptr) return -1;
    80002970:	fff00513          	li	a0,-1
    80002974:	ff1ff06f          	j	80002964 <_ZN6Thread5startEv+0x24>

0000000080002978 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002978:	ff010113          	addi	sp,sp,-16
    8000297c:	00113423          	sd	ra,8(sp)
    80002980:	00813023          	sd	s0,0(sp)
    80002984:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80002988:	00853503          	ld	a0,8(a0)
    8000298c:	fffff097          	auipc	ra,0xfffff
    80002990:	ac0080e7          	jalr	-1344(ra) # 8000144c <_Z11thread_joinP3TCB>
}
    80002994:	00813083          	ld	ra,8(sp)
    80002998:	00013403          	ld	s0,0(sp)
    8000299c:	01010113          	addi	sp,sp,16
    800029a0:	00008067          	ret

00000000800029a4 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800029a4:	ff010113          	addi	sp,sp,-16
    800029a8:	00113423          	sd	ra,8(sp)
    800029ac:	00813023          	sd	s0,0(sp)
    800029b0:	01010413          	addi	s0,sp,16
    thread_dispatch();
    800029b4:	fffff097          	auipc	ra,0xfffff
    800029b8:	a78080e7          	jalr	-1416(ra) # 8000142c <_Z15thread_dispatchv>
}
    800029bc:	00813083          	ld	ra,8(sp)
    800029c0:	00013403          	ld	s0,0(sp)
    800029c4:	01010113          	addi	sp,sp,16
    800029c8:	00008067          	ret

00000000800029cc <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    800029cc:	ff010113          	addi	sp,sp,-16
    800029d0:	00113423          	sd	ra,8(sp)
    800029d4:	00813023          	sd	s0,0(sp)
    800029d8:	01010413          	addi	s0,sp,16
    time_sleep(t);
    800029dc:	fffff097          	auipc	ra,0xfffff
    800029e0:	a98080e7          	jalr	-1384(ra) # 80001474 <_Z10time_sleepm>
}
    800029e4:	00000513          	li	a0,0
    800029e8:	00813083          	ld	ra,8(sp)
    800029ec:	00013403          	ld	s0,0(sp)
    800029f0:	01010113          	addi	sp,sp,16
    800029f4:	00008067          	ret

00000000800029f8 <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    800029f8:	fe010113          	addi	sp,sp,-32
    800029fc:	00113c23          	sd	ra,24(sp)
    80002a00:	00813823          	sd	s0,16(sp)
    80002a04:	00913423          	sd	s1,8(sp)
    80002a08:	02010413          	addi	s0,sp,32
    80002a0c:	00050493          	mv	s1,a0
    while (1) {
        periodicActivation();
    80002a10:	0004b783          	ld	a5,0(s1)
    80002a14:	0187b783          	ld	a5,24(a5)
    80002a18:	00048513          	mv	a0,s1
    80002a1c:	000780e7          	jalr	a5
        sleep(period);
    80002a20:	0204b503          	ld	a0,32(s1)
    80002a24:	00000097          	auipc	ra,0x0
    80002a28:	fa8080e7          	jalr	-88(ra) # 800029cc <_ZN6Thread5sleepEm>
    while (1) {
    80002a2c:	fe5ff06f          	j	80002a10 <_ZN14PeriodicThread3runEv+0x18>

0000000080002a30 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002a30:	fe010113          	addi	sp,sp,-32
    80002a34:	00113c23          	sd	ra,24(sp)
    80002a38:	00813823          	sd	s0,16(sp)
    80002a3c:	00913423          	sd	s1,8(sp)
    80002a40:	02010413          	addi	s0,sp,32
    80002a44:	00050493          	mv	s1,a0
    80002a48:	0000a797          	auipc	a5,0xa
    80002a4c:	e6878793          	addi	a5,a5,-408 # 8000c8b0 <_ZTV6Thread+0x10>
    80002a50:	00f53023          	sd	a5,0(a0)
    this->body = wrapper;
    80002a54:	00000797          	auipc	a5,0x0
    80002a58:	c1878793          	addi	a5,a5,-1000 # 8000266c <_ZN6Thread7wrapperEPv>
    80002a5c:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80002a60:	00a53c23          	sd	a0,24(a0)
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002a64:	00001537          	lui	a0,0x1
    80002a68:	fffff097          	auipc	ra,0xfffff
    80002a6c:	8a0080e7          	jalr	-1888(ra) # 80001308 <_Z9mem_allocm>
    80002a70:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a74:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a78:	0184b303          	ld	t1,24(s1)
    80002a7c:	00030693          	mv	a3,t1
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a80:	0104b303          	ld	t1,16(s1)
    80002a84:	00030613          	mv	a2,t1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a88:	00848493          	addi	s1,s1,8
    80002a8c:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002a90:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002a94:	00000073          	ecall
}
    80002a98:	01813083          	ld	ra,24(sp)
    80002a9c:	01013403          	ld	s0,16(sp)
    80002aa0:	00813483          	ld	s1,8(sp)
    80002aa4:	02010113          	addi	sp,sp,32
    80002aa8:	00008067          	ret

0000000080002aac <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002aac:	ff010113          	addi	sp,sp,-16
    80002ab0:	00113423          	sd	ra,8(sp)
    80002ab4:	00813023          	sd	s0,0(sp)
    80002ab8:	01010413          	addi	s0,sp,16
    80002abc:	0000a797          	auipc	a5,0xa
    80002ac0:	e1c78793          	addi	a5,a5,-484 # 8000c8d8 <_ZTV9Semaphore+0x10>
    80002ac4:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle, init);
    80002ac8:	00850513          	addi	a0,a0,8
    80002acc:	fffff097          	auipc	ra,0xfffff
    80002ad0:	9d8080e7          	jalr	-1576(ra) # 800014a4 <_Z8sem_openPP4KSemj>
}
    80002ad4:	00813083          	ld	ra,8(sp)
    80002ad8:	00013403          	ld	s0,0(sp)
    80002adc:	01010113          	addi	sp,sp,16
    80002ae0:	00008067          	ret

0000000080002ae4 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002ae4:	ff010113          	addi	sp,sp,-16
    80002ae8:	00113423          	sd	ra,8(sp)
    80002aec:	00813023          	sd	s0,0(sp)
    80002af0:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002af4:	00853503          	ld	a0,8(a0)
    80002af8:	fffff097          	auipc	ra,0xfffff
    80002afc:	a14080e7          	jalr	-1516(ra) # 8000150c <_Z8sem_waitP4KSem>
}
    80002b00:	00813083          	ld	ra,8(sp)
    80002b04:	00013403          	ld	s0,0(sp)
    80002b08:	01010113          	addi	sp,sp,16
    80002b0c:	00008067          	ret

0000000080002b10 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002b10:	ff010113          	addi	sp,sp,-16
    80002b14:	00113423          	sd	ra,8(sp)
    80002b18:	00813023          	sd	s0,0(sp)
    80002b1c:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80002b20:	00853503          	ld	a0,8(a0)
    80002b24:	fffff097          	auipc	ra,0xfffff
    80002b28:	a18080e7          	jalr	-1512(ra) # 8000153c <_Z10sem_signalP4KSem>
}
    80002b2c:	00813083          	ld	ra,8(sp)
    80002b30:	00013403          	ld	s0,0(sp)
    80002b34:	01010113          	addi	sp,sp,16
    80002b38:	00008067          	ret

0000000080002b3c <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002b3c:	ff010113          	addi	sp,sp,-16
    80002b40:	00813423          	sd	s0,8(sp)
    80002b44:	01010413          	addi	s0,sp,16
}
    80002b48:	00813403          	ld	s0,8(sp)
    80002b4c:	01010113          	addi	sp,sp,16
    80002b50:	00008067          	ret

0000000080002b54 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    80002b54:	fe010113          	addi	sp,sp,-32
    80002b58:	00113c23          	sd	ra,24(sp)
    80002b5c:	00813823          	sd	s0,16(sp)
    80002b60:	00913423          	sd	s1,8(sp)
    80002b64:	01213023          	sd	s2,0(sp)
    80002b68:	02010413          	addi	s0,sp,32
    80002b6c:	00050493          	mv	s1,a0
    80002b70:	00058913          	mv	s2,a1
    80002b74:	00000097          	auipc	ra,0x0
    80002b78:	ebc080e7          	jalr	-324(ra) # 80002a30 <_ZN6ThreadC1Ev>
    80002b7c:	0000a797          	auipc	a5,0xa
    80002b80:	d7c78793          	addi	a5,a5,-644 # 8000c8f8 <_ZTV14PeriodicThread+0x10>
    80002b84:	00f4b023          	sd	a5,0(s1)
    80002b88:	0324b023          	sd	s2,32(s1)
}
    80002b8c:	01813083          	ld	ra,24(sp)
    80002b90:	01013403          	ld	s0,16(sp)
    80002b94:	00813483          	ld	s1,8(sp)
    80002b98:	00013903          	ld	s2,0(sp)
    80002b9c:	02010113          	addi	sp,sp,32
    80002ba0:	00008067          	ret

0000000080002ba4 <_ZN7Console4getcEv>:
    }
}

char Console::getc() {
    80002ba4:	ff010113          	addi	sp,sp,-16
    80002ba8:	00113423          	sd	ra,8(sp)
    80002bac:	00813023          	sd	s0,0(sp)
    80002bb0:	01010413          	addi	s0,sp,16
    return ::getc();
    80002bb4:	fffff097          	auipc	ra,0xfffff
    80002bb8:	9b8080e7          	jalr	-1608(ra) # 8000156c <_Z4getcv>
}
    80002bbc:	00813083          	ld	ra,8(sp)
    80002bc0:	00013403          	ld	s0,0(sp)
    80002bc4:	01010113          	addi	sp,sp,16
    80002bc8:	00008067          	ret

0000000080002bcc <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002bcc:	ff010113          	addi	sp,sp,-16
    80002bd0:	00113423          	sd	ra,8(sp)
    80002bd4:	00813023          	sd	s0,0(sp)
    80002bd8:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002bdc:	fffff097          	auipc	ra,0xfffff
    80002be0:	9b8080e7          	jalr	-1608(ra) # 80001594 <_Z4putcc>
}
    80002be4:	00813083          	ld	ra,8(sp)
    80002be8:	00013403          	ld	s0,0(sp)
    80002bec:	01010113          	addi	sp,sp,16
    80002bf0:	00008067          	ret

0000000080002bf4 <_ZN6Thread3runEv>:
protected:
    //konstruktor koji pravi nit koja izvrsava run metodu, ne stavlja je u Scheduler
    Thread();

    //funkcija koju nit izvrsava, samo ako je nit napravljena podrazumevanim konstruktorom
    virtual void run() {}
    80002bf4:	ff010113          	addi	sp,sp,-16
    80002bf8:	00813423          	sd	s0,8(sp)
    80002bfc:	01010413          	addi	s0,sp,16
    80002c00:	00813403          	ld	s0,8(sp)
    80002c04:	01010113          	addi	sp,sp,16
    80002c08:	00008067          	ret

0000000080002c0c <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    80002c0c:	ff010113          	addi	sp,sp,-16
    80002c10:	00813423          	sd	s0,8(sp)
    80002c14:	01010413          	addi	s0,sp,16
    80002c18:	00813403          	ld	s0,8(sp)
    80002c1c:	01010113          	addi	sp,sp,16
    80002c20:	00008067          	ret

0000000080002c24 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002c24:	ff010113          	addi	sp,sp,-16
    80002c28:	00113423          	sd	ra,8(sp)
    80002c2c:	00813023          	sd	s0,0(sp)
    80002c30:	01010413          	addi	s0,sp,16
    80002c34:	0000a797          	auipc	a5,0xa
    80002c38:	cc478793          	addi	a5,a5,-828 # 8000c8f8 <_ZTV14PeriodicThread+0x10>
    80002c3c:	00f53023          	sd	a5,0(a0)
    80002c40:	00000097          	auipc	ra,0x0
    80002c44:	a60080e7          	jalr	-1440(ra) # 800026a0 <_ZN6ThreadD1Ev>
    80002c48:	00813083          	ld	ra,8(sp)
    80002c4c:	00013403          	ld	s0,0(sp)
    80002c50:	01010113          	addi	sp,sp,16
    80002c54:	00008067          	ret

0000000080002c58 <_ZN14PeriodicThreadD0Ev>:
    80002c58:	fe010113          	addi	sp,sp,-32
    80002c5c:	00113c23          	sd	ra,24(sp)
    80002c60:	00813823          	sd	s0,16(sp)
    80002c64:	00913423          	sd	s1,8(sp)
    80002c68:	02010413          	addi	s0,sp,32
    80002c6c:	00050493          	mv	s1,a0
    80002c70:	0000a797          	auipc	a5,0xa
    80002c74:	c8878793          	addi	a5,a5,-888 # 8000c8f8 <_ZTV14PeriodicThread+0x10>
    80002c78:	00f53023          	sd	a5,0(a0)
    80002c7c:	00000097          	auipc	ra,0x0
    80002c80:	a24080e7          	jalr	-1500(ra) # 800026a0 <_ZN6ThreadD1Ev>
    80002c84:	00048513          	mv	a0,s1
    80002c88:	00000097          	auipc	ra,0x0
    80002c8c:	b58080e7          	jalr	-1192(ra) # 800027e0 <_ZdlPv>
    80002c90:	01813083          	ld	ra,24(sp)
    80002c94:	01013403          	ld	s0,16(sp)
    80002c98:	00813483          	ld	s1,8(sp)
    80002c9c:	02010113          	addi	sp,sp,32
    80002ca0:	00008067          	ret

0000000080002ca4 <_ZN3TCB7wrapperEv>:
//    //Riscv::pushRegisters();
//    TCB::dispatch();
//    //Riscv::popRegisters();
//}

void TCB::wrapper() {
    80002ca4:	ff010113          	addi	sp,sp,-16
    80002ca8:	00113423          	sd	ra,8(sp)
    80002cac:	00813023          	sd	s0,0(sp)
    80002cb0:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
    Riscv::returnFromInterrupt();
    80002cb4:	00000097          	auipc	ra,0x0
    80002cb8:	2d0080e7          	jalr	720(ra) # 80002f84 <_ZN5Riscv10popSppSpieEv>
    //na dalje se izvrsavamo u user modu
    running->threadFunction(running->args);
    80002cbc:	0000a797          	auipc	a5,0xa
    80002cc0:	fcc7b783          	ld	a5,-52(a5) # 8000cc88 <_ZN3TCB7runningE>
    80002cc4:	0107b703          	ld	a4,16(a5)
    80002cc8:	0207b503          	ld	a0,32(a5)
    80002ccc:	000700e7          	jalr	a4
    //running->finished = true;
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    80002cd0:	ffffe097          	auipc	ra,0xffffe
    80002cd4:	734080e7          	jalr	1844(ra) # 80001404 <_Z11thread_exitv>
}
    80002cd8:	00813083          	ld	ra,8(sp)
    80002cdc:	00013403          	ld	s0,0(sp)
    80002ce0:	01010113          	addi	sp,sp,16
    80002ce4:	00008067          	ret

0000000080002ce8 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002ce8:	fe010113          	addi	sp,sp,-32
    80002cec:	00113c23          	sd	ra,24(sp)
    80002cf0:	00813823          	sd	s0,16(sp)
    80002cf4:	00913423          	sd	s1,8(sp)
    80002cf8:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    80002cfc:	0000a497          	auipc	s1,0xa
    80002d00:	f8c4b483          	ld	s1,-116(s1) # 8000cc88 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    80002d04:	0584a703          	lw	a4,88(s1)
    80002d08:	00100793          	li	a5,1
    80002d0c:	04f70663          	beq	a4,a5,80002d58 <_ZN3TCB8dispatchEv+0x70>
    TCB::running = Scheduler::get();
    80002d10:	fffff097          	auipc	ra,0xfffff
    80002d14:	d90080e7          	jalr	-624(ra) # 80001aa0 <_ZN9Scheduler3getEv>
    80002d18:	00050593          	mv	a1,a0
    80002d1c:	0000a797          	auipc	a5,0xa
    80002d20:	f6c78793          	addi	a5,a5,-148 # 8000cc88 <_ZN3TCB7runningE>
    80002d24:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80002d28:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == nullptr || TCB::running->threadFunction == kernelConsumerFunction ||
    80002d2c:	01053783          	ld	a5,16(a0)
    80002d30:	02078c63          	beqz	a5,80002d68 <_ZN3TCB8dispatchEv+0x80>
    80002d34:	0000a717          	auipc	a4,0xa
    80002d38:	dc473703          	ld	a4,-572(a4) # 8000caf8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002d3c:	02e78663          	beq	a5,a4,80002d68 <_ZN3TCB8dispatchEv+0x80>
    80002d40:	0000a717          	auipc	a4,0xa
    80002d44:	df873703          	ld	a4,-520(a4) # 8000cb38 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002d48:	02e78063          	beq	a5,a4,80002d68 <_ZN3TCB8dispatchEv+0x80>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002d4c:	10000793          	li	a5,256
    80002d50:	1007b073          	csrc	sstatus,a5
}
    80002d54:	01c0006f          	j	80002d70 <_ZN3TCB8dispatchEv+0x88>
        Scheduler::put(old);
    80002d58:	00048513          	mv	a0,s1
    80002d5c:	fffff097          	auipc	ra,0xfffff
    80002d60:	cf8080e7          	jalr	-776(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
    80002d64:	fadff06f          	j	80002d10 <_ZN3TCB8dispatchEv+0x28>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002d68:	10000793          	li	a5,256
    80002d6c:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002d70:	00b48863          	beq	s1,a1,80002d80 <_ZN3TCB8dispatchEv+0x98>
    80002d74:	00048513          	mv	a0,s1
    80002d78:	ffffe097          	auipc	ra,0xffffe
    80002d7c:	398080e7          	jalr	920(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002d80:	01813083          	ld	ra,24(sp)
    80002d84:	01013403          	ld	s0,16(sp)
    80002d88:	00813483          	ld	s1,8(sp)
    80002d8c:	02010113          	addi	sp,sp,32
    80002d90:	00008067          	ret

0000000080002d94 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002d94:	ff010113          	addi	sp,sp,-16
    80002d98:	00113423          	sd	ra,8(sp)
    80002d9c:	00813023          	sd	s0,0(sp)
    80002da0:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002da4:	ffffe097          	auipc	ra,0xffffe
    80002da8:	564080e7          	jalr	1380(ra) # 80001308 <_Z9mem_allocm>
    //return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::THREAD);
}
    80002dac:	00813083          	ld	ra,8(sp)
    80002db0:	00013403          	ld	s0,0(sp)
    80002db4:	01010113          	addi	sp,sp,16
    80002db8:	00008067          	ret

0000000080002dbc <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002dbc:	fd010113          	addi	sp,sp,-48
    80002dc0:	02113423          	sd	ra,40(sp)
    80002dc4:	02813023          	sd	s0,32(sp)
    80002dc8:	00913c23          	sd	s1,24(sp)
    80002dcc:	01213823          	sd	s2,16(sp)
    80002dd0:	01313423          	sd	s3,8(sp)
    80002dd4:	03010413          	addi	s0,sp,48
    80002dd8:	00050913          	mv	s2,a0
    80002ddc:	00058993          	mv	s3,a1
    80002de0:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    80002de4:	06000513          	li	a0,96
    80002de8:	00000097          	auipc	ra,0x0
    80002dec:	fac080e7          	jalr	-84(ra) # 80002d94 <_ZN3TCBnwEm>


    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED) {
    80002df0:	01253823          	sd	s2,16(a0)
    80002df4:	00953c23          	sd	s1,24(a0)
    80002df8:	03353023          	sd	s3,32(a0)
    80002dfc:	00200793          	li	a5,2
    80002e00:	02f53423          	sd	a5,40(a0)
    80002e04:	02053823          	sd	zero,48(a0)
    80002e08:	02053c23          	sd	zero,56(a0)
    80002e0c:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80002e10:	04053423          	sd	zero,72(a0)
    80002e14:	04053823          	sd	zero,80(a0)
    80002e18:	04052c23          	sw	zero,88(a0)
        //formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002e1c:	02090e63          	beqz	s2,80002e58 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x9c>
    80002e20:	00000797          	auipc	a5,0x0
    80002e24:	e8478793          	addi	a5,a5,-380 # 80002ca4 <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002e28:	02048c63          	beqz	s1,80002e60 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002e2c:	00001637          	lui	a2,0x1
    80002e30:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    80002e34:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    80002e38:	00953423          	sd	s1,8(a0)
}
    80002e3c:	02813083          	ld	ra,40(sp)
    80002e40:	02013403          	ld	s0,32(sp)
    80002e44:	01813483          	ld	s1,24(sp)
    80002e48:	01013903          	ld	s2,16(sp)
    80002e4c:	00813983          	ld	s3,8(sp)
    80002e50:	03010113          	addi	sp,sp,48
    80002e54:	00008067          	ret
        uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002e58:	00000793          	li	a5,0
    80002e5c:	fcdff06f          	j	80002e28 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x6c>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002e60:	00000493          	li	s1,0
    80002e64:	fd1ff06f          	j	80002e34 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x78>

0000000080002e68 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002e68:	ff010113          	addi	sp,sp,-16
    80002e6c:	00113423          	sd	ra,8(sp)
    80002e70:	00813023          	sd	s0,0(sp)
    80002e74:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002e78:	ffffe097          	auipc	ra,0xffffe
    80002e7c:	4d0080e7          	jalr	1232(ra) # 80001348 <_Z8mem_freePv>
    //MemoryAllocator::kfree(ptr);
}
    80002e80:	00813083          	ld	ra,8(sp)
    80002e84:	00013403          	ld	s0,0(sp)
    80002e88:	01010113          	addi	sp,sp,16
    80002e8c:	00008067          	ret

0000000080002e90 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED) return;
    80002e90:	05852703          	lw	a4,88(a0)
    80002e94:	00500793          	li	a5,5
    80002e98:	04f70063          	beq	a4,a5,80002ed8 <_ZN3TCB10threadJoinEPS_+0x48>
void TCB::threadJoin(TCB* handle) {
    80002e9c:	ff010113          	addi	sp,sp,-16
    80002ea0:	00113423          	sd	ra,8(sp)
    80002ea4:	00813023          	sd	s0,0(sp)
    80002ea8:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    80002eac:	0000a597          	auipc	a1,0xa
    80002eb0:	ddc5b583          	ld	a1,-548(a1) # 8000cc88 <_ZN3TCB7runningE>
    80002eb4:	00300793          	li	a5,3
    80002eb8:	04f5ac23          	sw	a5,88(a1)
    handle->waitingToJoin.putLast(TCB::running);
    80002ebc:	04850513          	addi	a0,a0,72
    80002ec0:	ffffe097          	auipc	ra,0xffffe
    80002ec4:	37c080e7          	jalr	892(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002ec8:	00813083          	ld	ra,8(sp)
    80002ecc:	00013403          	ld	s0,0(sp)
    80002ed0:	01010113          	addi	sp,sp,16
    80002ed4:	00008067          	ret
    80002ed8:	00008067          	ret

0000000080002edc <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80002edc:	0000a517          	auipc	a0,0xa
    80002ee0:	dac53503          	ld	a0,-596(a0) # 8000cc88 <_ZN3TCB7runningE>
        bool ret = front == nullptr;
    80002ee4:	04853783          	ld	a5,72(a0)
    80002ee8:	04078863          	beqz	a5,80002f38 <_ZN3TCB13releaseJoinedEv+0x5c>
void TCB::releaseJoined() {
    80002eec:	ff010113          	addi	sp,sp,-16
    80002ef0:	00113423          	sd	ra,8(sp)
    80002ef4:	00813023          	sd	s0,0(sp)
    80002ef8:	01010413          	addi	s0,sp,16
        TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002efc:	04850513          	addi	a0,a0,72
    80002f00:	ffffe097          	auipc	ra,0xffffe
    80002f04:	3a8080e7          	jalr	936(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
        tcb->status = ACTIVE;
    80002f08:	00100793          	li	a5,1
    80002f0c:	04f52c23          	sw	a5,88(a0)
        Scheduler::put(tcb);
    80002f10:	fffff097          	auipc	ra,0xfffff
    80002f14:	b44080e7          	jalr	-1212(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80002f18:	0000a517          	auipc	a0,0xa
    80002f1c:	d7053503          	ld	a0,-656(a0) # 8000cc88 <_ZN3TCB7runningE>
    80002f20:	04853783          	ld	a5,72(a0)
    80002f24:	fc079ce3          	bnez	a5,80002efc <_ZN3TCB13releaseJoinedEv+0x20>
    }
}
    80002f28:	00813083          	ld	ra,8(sp)
    80002f2c:	00013403          	ld	s0,0(sp)
    80002f30:	01010113          	addi	sp,sp,16
    80002f34:	00008067          	ret
    80002f38:	00008067          	ret

0000000080002f3c <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
    //startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
    if (newTcb->threadFunction != nullptr) {
    80002f3c:	01053783          	ld	a5,16(a0)
    80002f40:	04078063          	beqz	a5,80002f80 <_ZN3TCB5startEPS_+0x44>
void TCB::start(TCB* newTcb) {
    80002f44:	fe010113          	addi	sp,sp,-32
    80002f48:	00113c23          	sd	ra,24(sp)
    80002f4c:	00813823          	sd	s0,16(sp)
    80002f50:	00913423          	sd	s1,8(sp)
    80002f54:	02010413          	addi	s0,sp,32
    80002f58:	00050493          	mv	s1,a0
        Scheduler::put(newTcb);
    80002f5c:	fffff097          	auipc	ra,0xfffff
    80002f60:	af8080e7          	jalr	-1288(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
        newTcb->status = ACTIVE;
    80002f64:	00100793          	li	a5,1
    80002f68:	04f4ac23          	sw	a5,88(s1)
    }
}
    80002f6c:	01813083          	ld	ra,24(sp)
    80002f70:	01013403          	ld	s0,16(sp)
    80002f74:	00813483          	ld	s1,8(sp)
    80002f78:	02010113          	addi	sp,sp,32
    80002f7c:	00008067          	ret
    80002f80:	00008067          	ret

0000000080002f84 <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::returnFromInterrupt() {
    80002f84:	ff010113          	addi	sp,sp,-16
    80002f88:	00813423          	sd	s0,8(sp)
    80002f8c:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002f90:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002f94:	10200073          	sret
    80002f98:	00813403          	ld	s0,8(sp)
    80002f9c:	01010113          	addi	sp,sp,16
    80002fa0:	00008067          	ret

0000000080002fa4 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80002fa4:	ff010113          	addi	sp,sp,-16
    80002fa8:	00113423          	sd	ra,8(sp)
    80002fac:	00813023          	sd	s0,0(sp)
    80002fb0:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002fb4:	ffffe097          	auipc	ra,0xffffe
    80002fb8:	354080e7          	jalr	852(ra) # 80001308 <_Z9mem_allocm>
	//return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment), MemoryAllocator::SEMAPHORE);
}
    80002fbc:	00813083          	ld	ra,8(sp)
    80002fc0:	00013403          	ld	s0,0(sp)
    80002fc4:	01010113          	addi	sp,sp,16
    80002fc8:	00008067          	ret

0000000080002fcc <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
    80002fcc:	ff010113          	addi	sp,sp,-16
    80002fd0:	00113423          	sd	ra,8(sp)
    80002fd4:	00813023          	sd	s0,0(sp)
    80002fd8:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002fdc:	ffffe097          	auipc	ra,0xffffe
    80002fe0:	36c080e7          	jalr	876(ra) # 80001348 <_Z8mem_freePv>
	//MemoryAllocator::kfree(ptr);
}
    80002fe4:	00813083          	ld	ra,8(sp)
    80002fe8:	00013403          	ld	s0,0(sp)
    80002fec:	01010113          	addi	sp,sp,16
    80002ff0:	00008067          	ret

0000000080002ff4 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80002ff4:	fe010113          	addi	sp,sp,-32
    80002ff8:	00113c23          	sd	ra,24(sp)
    80002ffc:	00813823          	sd	s0,16(sp)
    80003000:	00913423          	sd	s1,8(sp)
    80003004:	02010413          	addi	s0,sp,32
    80003008:	00050493          	mv	s1,a0
	return new KSem(val);
    8000300c:	02000513          	li	a0,32
    80003010:	00000097          	auipc	ra,0x0
    80003014:	f94080e7          	jalr	-108(ra) # 80002fa4 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    80003018:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    8000301c:	00053423          	sd	zero,8(a0)
    80003020:	00053823          	sd	zero,16(a0)
    80003024:	00100713          	li	a4,1
    80003028:	00e50c23          	sb	a4,24(a0)
}
    8000302c:	01813083          	ld	ra,24(sp)
    80003030:	01013403          	ld	s0,16(sp)
    80003034:	00813483          	ld	s1,8(sp)
    80003038:	02010113          	addi	sp,sp,32
    8000303c:	00008067          	ret

0000000080003040 <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    80003040:	ff010113          	addi	sp,sp,-16
    80003044:	00113423          	sd	ra,8(sp)
    80003048:	00813023          	sd	s0,0(sp)
    8000304c:	01010413          	addi	s0,sp,16
    static TCB* getRunning() { return running; }
    80003050:	0000a797          	auipc	a5,0xa
    80003054:	ad07b783          	ld	a5,-1328(a5) # 8000cb20 <_GLOBAL_OFFSET_TABLE_+0x58>
    80003058:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    8000305c:	00200793          	li	a5,2
    80003060:	04f5ac23          	sw	a5,88(a1)
	//TCB::running->setBlocked(true);
    TCB::getRunning()->setStatus(TCB::BLOCKED);
	blocked.putLast(TCB::getRunning());
    80003064:	00850513          	addi	a0,a0,8
    80003068:	ffffe097          	auipc	ra,0xffffe
    8000306c:	1d4080e7          	jalr	468(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::dispatch();
    80003070:	00000097          	auipc	ra,0x0
    80003074:	c78080e7          	jalr	-904(ra) # 80002ce8 <_ZN3TCB8dispatchEv>
}
    80003078:	00813083          	ld	ra,8(sp)
    8000307c:	00013403          	ld	s0,0(sp)
    80003080:	01010113          	addi	sp,sp,16
    80003084:	00008067          	ret

0000000080003088 <_ZN4KSem4waitEv>:
	if (!working) return -3;
    80003088:	01854783          	lbu	a5,24(a0)
    8000308c:	04078663          	beqz	a5,800030d8 <_ZN4KSem4waitEv+0x50>
	if (--val < 0) {
    80003090:	00052783          	lw	a5,0(a0)
    80003094:	fff7879b          	addiw	a5,a5,-1
    80003098:	00f52023          	sw	a5,0(a0)
    8000309c:	02079713          	slli	a4,a5,0x20
    800030a0:	00074663          	bltz	a4,800030ac <_ZN4KSem4waitEv+0x24>
	return 0;
    800030a4:	00000513          	li	a0,0
}
    800030a8:	00008067          	ret
int KSem::wait() {
    800030ac:	ff010113          	addi	sp,sp,-16
    800030b0:	00113423          	sd	ra,8(sp)
    800030b4:	00813023          	sd	s0,0(sp)
    800030b8:	01010413          	addi	s0,sp,16
		block();
    800030bc:	00000097          	auipc	ra,0x0
    800030c0:	f84080e7          	jalr	-124(ra) # 80003040 <_ZN4KSem5blockEv>
		return -1;
    800030c4:	fff00513          	li	a0,-1
}
    800030c8:	00813083          	ld	ra,8(sp)
    800030cc:	00013403          	ld	s0,0(sp)
    800030d0:	01010113          	addi	sp,sp,16
    800030d4:	00008067          	ret
	if (!working) return -3;
    800030d8:	ffd00513          	li	a0,-3
    800030dc:	00008067          	ret

00000000800030e0 <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    800030e0:	ff010113          	addi	sp,sp,-16
    800030e4:	00113423          	sd	ra,8(sp)
    800030e8:	00813023          	sd	s0,0(sp)
    800030ec:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    800030f0:	00850513          	addi	a0,a0,8
    800030f4:	ffffe097          	auipc	ra,0xffffe
    800030f8:	1b4080e7          	jalr	436(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
    800030fc:	00100793          	li	a5,1
    80003100:	04f52c23          	sw	a5,88(a0)
	//tcb->setBlocked(false);
    tcb->setStatus(TCB::ACTIVE);
	Scheduler::put(tcb);
    80003104:	fffff097          	auipc	ra,0xfffff
    80003108:	950080e7          	jalr	-1712(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
}
    8000310c:	00813083          	ld	ra,8(sp)
    80003110:	00013403          	ld	s0,0(sp)
    80003114:	01010113          	addi	sp,sp,16
    80003118:	00008067          	ret

000000008000311c <_ZN4KSem6signalEv>:
	if (!working) return -3;
    8000311c:	01854783          	lbu	a5,24(a0)
    80003120:	04078463          	beqz	a5,80003168 <_ZN4KSem6signalEv+0x4c>
	if (val++ < 0) {
    80003124:	00052783          	lw	a5,0(a0)
    80003128:	0017871b          	addiw	a4,a5,1
    8000312c:	00e52023          	sw	a4,0(a0)
    80003130:	0007c663          	bltz	a5,8000313c <_ZN4KSem6signalEv+0x20>
	return 0;
    80003134:	00000513          	li	a0,0
}
    80003138:	00008067          	ret
int KSem::signal() {
    8000313c:	ff010113          	addi	sp,sp,-16
    80003140:	00113423          	sd	ra,8(sp)
    80003144:	00813023          	sd	s0,0(sp)
    80003148:	01010413          	addi	s0,sp,16
		unblock();
    8000314c:	00000097          	auipc	ra,0x0
    80003150:	f94080e7          	jalr	-108(ra) # 800030e0 <_ZN4KSem7unblockEv>
	return 0;
    80003154:	00000513          	li	a0,0
}
    80003158:	00813083          	ld	ra,8(sp)
    8000315c:	00013403          	ld	s0,0(sp)
    80003160:	01010113          	addi	sp,sp,16
    80003164:	00008067          	ret
	if (!working) return -3;
    80003168:	ffd00513          	li	a0,-3
    8000316c:	00008067          	ret

0000000080003170 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003170:	fe010113          	addi	sp,sp,-32
    80003174:	00113c23          	sd	ra,24(sp)
    80003178:	00813823          	sd	s0,16(sp)
    8000317c:	00913423          	sd	s1,8(sp)
    80003180:	02010413          	addi	s0,sp,32
    80003184:	00050493          	mv	s1,a0
	//if (!MemoryAllocator::checkPurpose(handle, MemoryAllocator::SEMAPHORE)) return -2;
	handle->working = false;
    80003188:	00050c23          	sb	zero,24(a0)
        bool ret = front == nullptr;
    8000318c:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003190:	02078263          	beqz	a5,800031b4 <_ZN4KSem8closeSemEPS_+0x44>
		TCB* tcb = handle->blocked.getFirst();
    80003194:	00848513          	addi	a0,s1,8
    80003198:	ffffe097          	auipc	ra,0xffffe
    8000319c:	110080e7          	jalr	272(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
    800031a0:	00100793          	li	a5,1
    800031a4:	04f52c23          	sw	a5,88(a0)
		//tcb->setBlocked(false);
        tcb->setStatus(TCB::ACTIVE);
		Scheduler::put(tcb);
    800031a8:	fffff097          	auipc	ra,0xfffff
    800031ac:	8ac080e7          	jalr	-1876(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    800031b0:	fddff06f          	j	8000318c <_ZN4KSem8closeSemEPS_+0x1c>
	}
	return 0;
}
    800031b4:	00000513          	li	a0,0
    800031b8:	01813083          	ld	ra,24(sp)
    800031bc:	01013403          	ld	s0,16(sp)
    800031c0:	00813483          	ld	s1,8(sp)
    800031c4:	02010113          	addi	sp,sp,32
    800031c8:	00008067          	ret

00000000800031cc <_Z10testMemoryv>:
    return pok;
}

#pragma GCC optimize("O0")

void testMemory() {
    800031cc:	e6010113          	addi	sp,sp,-416
    800031d0:	18113c23          	sd	ra,408(sp)
    800031d4:	18813823          	sd	s0,400(sp)
    800031d8:	1a010413          	addi	s0,sp,416
    char* pokazivaci[50];
    pokazivaci[0] = nullptr;
    800031dc:	e6043023          	sd	zero,-416(s0)
    pokazivaci[0] = upisi(1024 + 768);
    800031e0:	70000513          	li	a0,1792
    800031e4:	00000097          	auipc	ra,0x0
    800031e8:	1f8080e7          	jalr	504(ra) # 800033dc <_Z5upisim>
    800031ec:	00050793          	mv	a5,a0
    800031f0:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    800031f4:	e6043783          	ld	a5,-416(s0)
    800031f8:	02078c63          	beqz	a5,80003230 <_Z10testMemoryv+0x64>
        if (pokazivaci[0][0] == '8') {
    800031fc:	e6043783          	ld	a5,-416(s0)
    80003200:	0007c783          	lbu	a5,0(a5)
    80003204:	00078713          	mv	a4,a5
    80003208:	03800793          	li	a5,56
    8000320c:	00f71a63          	bne	a4,a5,80003220 <_Z10testMemoryv+0x54>
            printString("nea");
    80003210:	00007517          	auipc	a0,0x7
    80003214:	ff050513          	addi	a0,a0,-16 # 8000a200 <_ZZ9kPrintIntmE6digits+0x190>
    80003218:	00002097          	auipc	ra,0x2
    8000321c:	6b4080e7          	jalr	1716(ra) # 800058cc <_Z11printStringPKc>
        }
        MemoryAllocator::kfree(pokazivaci[0]);
    80003220:	e6043783          	ld	a5,-416(s0)
    80003224:	00078513          	mv	a0,a5
    80003228:	00004097          	auipc	ra,0x4
    8000322c:	b2c080e7          	jalr	-1236(ra) # 80006d54 <_ZN15MemoryAllocator5kfreeEPv>
    }


    pokazivaci[0] = upisi(4096);
    80003230:	00001537          	lui	a0,0x1
    80003234:	00000097          	auipc	ra,0x0
    80003238:	1a8080e7          	jalr	424(ra) # 800033dc <_Z5upisim>
    8000323c:	00050793          	mv	a5,a0
    80003240:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    80003244:	e6043783          	ld	a5,-416(s0)
    80003248:	00078a63          	beqz	a5,8000325c <_Z10testMemoryv+0x90>
        MemoryAllocator::kfree(pokazivaci[0]);
    8000324c:	e6043783          	ld	a5,-416(s0)
    80003250:	00078513          	mv	a0,a5
    80003254:	00004097          	auipc	ra,0x4
    80003258:	b00080e7          	jalr	-1280(ra) # 80006d54 <_ZN15MemoryAllocator5kfreeEPv>
    }

    pokazivaci[0] = upisi(1024 + 768);
    8000325c:	70000513          	li	a0,1792
    80003260:	00000097          	auipc	ra,0x0
    80003264:	17c080e7          	jalr	380(ra) # 800033dc <_Z5upisim>
    80003268:	00050793          	mv	a5,a0
    8000326c:	e6f43023          	sd	a5,-416(s0)
    MemoryAllocator::kfree(pokazivaci[0]);
    80003270:	e6043783          	ld	a5,-416(s0)
    80003274:	00078513          	mv	a0,a5
    80003278:	00004097          	auipc	ra,0x4
    8000327c:	adc080e7          	jalr	-1316(ra) # 80006d54 <_ZN15MemoryAllocator5kfreeEPv>

}
    80003280:	00000013          	nop
    80003284:	19813083          	ld	ra,408(sp)
    80003288:	19013403          	ld	s0,400(sp)
    8000328c:	1a010113          	addi	sp,sp,416
    80003290:	00008067          	ret

0000000080003294 <_Z5nit1fPv>:

void nit1f(void*) {
    80003294:	fe010113          	addi	sp,sp,-32
    80003298:	00113c23          	sd	ra,24(sp)
    8000329c:	00813823          	sd	s0,16(sp)
    800032a0:	02010413          	addi	s0,sp,32
    800032a4:	fea43423          	sd	a0,-24(s0)
//		printString("\nsem_wait za nit 1 vratio ");
//		printInteger(res);
//		printString("\n");
//	}

    printString("\nGotova nit 1\n");
    800032a8:	00007517          	auipc	a0,0x7
    800032ac:	f6050513          	addi	a0,a0,-160 # 8000a208 <_ZZ9kPrintIntmE6digits+0x198>
    800032b0:	00002097          	auipc	ra,0x2
    800032b4:	61c080e7          	jalr	1564(ra) # 800058cc <_Z11printStringPKc>
}
    800032b8:	00000013          	nop
    800032bc:	01813083          	ld	ra,24(sp)
    800032c0:	01013403          	ld	s0,16(sp)
    800032c4:	02010113          	addi	sp,sp,32
    800032c8:	00008067          	ret

00000000800032cc <_Z5nit2fPv>:

void nit2f(void* arg2) {
    800032cc:	fe010113          	addi	sp,sp,-32
    800032d0:	00113c23          	sd	ra,24(sp)
    800032d4:	00813823          	sd	s0,16(sp)
    800032d8:	02010413          	addi	s0,sp,32
    800032dc:	fea43423          	sd	a0,-24(s0)
//		//sem_close(semA);
//		printString("\nNit 2 ubija semafor\n");
//		delete semA;
//
//	}
    printString("\nGotova nit 2\n");
    800032e0:	00007517          	auipc	a0,0x7
    800032e4:	f3850513          	addi	a0,a0,-200 # 8000a218 <_ZZ9kPrintIntmE6digits+0x1a8>
    800032e8:	00002097          	auipc	ra,0x2
    800032ec:	5e4080e7          	jalr	1508(ra) # 800058cc <_Z11printStringPKc>
}
    800032f0:	00000013          	nop
    800032f4:	01813083          	ld	ra,24(sp)
    800032f8:	01013403          	ld	s0,16(sp)
    800032fc:	02010113          	addi	sp,sp,32
    80003300:	00008067          	ret

0000000080003304 <_Z5nit3fPv>:


void nit3f(void*) {
    80003304:	fd010113          	addi	sp,sp,-48
    80003308:	02113423          	sd	ra,40(sp)
    8000330c:	02813023          	sd	s0,32(sp)
    80003310:	03010413          	addi	s0,sp,48
    80003314:	fca43c23          	sd	a0,-40(s0)
    char slovo;
    do {
        slovo = getc();
    80003318:	ffffe097          	auipc	ra,0xffffe
    8000331c:	254080e7          	jalr	596(ra) # 8000156c <_Z4getcv>
    80003320:	00050793          	mv	a5,a0
    80003324:	fef407a3          	sb	a5,-17(s0)
        putc(slovo);
    80003328:	fef44783          	lbu	a5,-17(s0)
    8000332c:	00078513          	mv	a0,a5
    80003330:	ffffe097          	auipc	ra,0xffffe
    80003334:	264080e7          	jalr	612(ra) # 80001594 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    80003338:	fef44783          	lbu	a5,-17(s0)
    8000333c:	0ff7f713          	andi	a4,a5,255
    80003340:	00d00793          	li	a5,13
    80003344:	00f71863          	bne	a4,a5,80003354 <_Z5nit3fPv+0x50>
    80003348:	00a00513          	li	a0,10
    8000334c:	ffffe097          	auipc	ra,0xffffe
    80003350:	248080e7          	jalr	584(ra) # 80001594 <_Z4putcc>
    } while (slovo != '0');
    80003354:	fef44783          	lbu	a5,-17(s0)
    80003358:	0ff7f713          	andi	a4,a5,255
    8000335c:	03000793          	li	a5,48
    80003360:	00f70463          	beq	a4,a5,80003368 <_Z5nit3fPv+0x64>
    do {
    80003364:	fb5ff06f          	j	80003318 <_Z5nit3fPv+0x14>

    printString("\nGotova nit3\n");
    80003368:	00007517          	auipc	a0,0x7
    8000336c:	ec050513          	addi	a0,a0,-320 # 8000a228 <_ZZ9kPrintIntmE6digits+0x1b8>
    80003370:	00002097          	auipc	ra,0x2
    80003374:	55c080e7          	jalr	1372(ra) # 800058cc <_Z11printStringPKc>
}
    80003378:	00000013          	nop
    8000337c:	02813083          	ld	ra,40(sp)
    80003380:	02013403          	ld	s0,32(sp)
    80003384:	03010113          	addi	sp,sp,48
    80003388:	00008067          	ret

000000008000338c <_Z8testMainv>:

int testMain() {
    8000338c:	ff010113          	addi	sp,sp,-16
    80003390:	00113423          	sd	ra,8(sp)
    80003394:	00813023          	sd	s0,0(sp)
    80003398:	01010413          	addi	s0,sp,16
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    8000339c:	00009797          	auipc	a5,0x9
    800033a0:	7947b783          	ld	a5,1940(a5) # 8000cb30 <_GLOBAL_OFFSET_TABLE_+0x68>
    800033a4:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    MemoryAllocator::initMemoryAllocator();
    800033a8:	00004097          	auipc	ra,0x4
    800033ac:	c70080e7          	jalr	-912(ra) # 80007018 <_ZN15MemoryAllocator19initMemoryAllocatorEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    800033b0:	ffffe097          	auipc	ra,0xffffe
    800033b4:	2b4080e7          	jalr	692(ra) # 80001664 <_ZN8KConsole12initKConsoleEv>
//	printString("\nGotove user niti\n");
//
//	printString("\nSad cu da izadjem\n");
//	while(KConsole::outputHead!=KConsole::outputTail){}
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    800033b8:	00200513          	li	a0,2
    800033bc:	00000097          	auipc	ra,0x0
    800033c0:	07c080e7          	jalr	124(ra) # 80003438 <_ZN5Riscv10mc_sstatusEm>


    return 0;
    800033c4:	00000793          	li	a5,0
    800033c8:	00078513          	mv	a0,a5
    800033cc:	00813083          	ld	ra,8(sp)
    800033d0:	00013403          	ld	s0,0(sp)
    800033d4:	01010113          	addi	sp,sp,16
    800033d8:	00008067          	ret

00000000800033dc <_Z5upisim>:
char* upisi(size_t alociraj) {
    800033dc:	fe010113          	addi	sp,sp,-32
    800033e0:	00113c23          	sd	ra,24(sp)
    800033e4:	00813823          	sd	s0,16(sp)
    800033e8:	00913423          	sd	s1,8(sp)
    800033ec:	02010413          	addi	s0,sp,32
    800033f0:	00050493          	mv	s1,a0
    char* pok = (char*) MemoryAllocator::kmalloc(alociraj);
    800033f4:	00300593          	li	a1,3
    800033f8:	00003097          	auipc	ra,0x3
    800033fc:	724080e7          	jalr	1828(ra) # 80006b1c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    if (pok) {
    80003400:	02050263          	beqz	a0,80003424 <_Z5upisim+0x48>
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    80003404:	00000793          	li	a5,0
    80003408:	0140006f          	j	8000341c <_Z5upisim+0x40>
            pok[i] = '8';
    8000340c:	00f50733          	add	a4,a0,a5
    80003410:	03800693          	li	a3,56
    80003414:	00d70023          	sb	a3,0(a4)
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    80003418:	00178793          	addi	a5,a5,1
    8000341c:	fe048713          	addi	a4,s1,-32
    80003420:	fee7e6e3          	bltu	a5,a4,8000340c <_Z5upisim+0x30>
}
    80003424:	01813083          	ld	ra,24(sp)
    80003428:	01013403          	ld	s0,16(sp)
    8000342c:	00813483          	ld	s1,8(sp)
    80003430:	02010113          	addi	sp,sp,32
    80003434:	00008067          	ret

0000000080003438 <_ZN5Riscv10mc_sstatusEm>:
inline void Riscv::mc_sstatus(uint64 mask) {
    80003438:	ff010113          	addi	sp,sp,-16
    8000343c:	00813423          	sd	s0,8(sp)
    80003440:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003444:	10053073          	csrc	sstatus,a0
}
    80003448:	00813403          	ld	s0,8(sp)
    8000344c:	01010113          	addi	sp,sp,16
    80003450:	00008067          	ret

0000000080003454 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003454:	fe010113          	addi	sp,sp,-32
    80003458:	00113c23          	sd	ra,24(sp)
    8000345c:	00813823          	sd	s0,16(sp)
    80003460:	00913423          	sd	s1,8(sp)
    80003464:	01213023          	sd	s2,0(sp)
    80003468:	02010413          	addi	s0,sp,32
    8000346c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003470:	00000913          	li	s2,0
    80003474:	00c0006f          	j	80003480 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003478:	ffffe097          	auipc	ra,0xffffe
    8000347c:	fb4080e7          	jalr	-76(ra) # 8000142c <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80003480:	ffffe097          	auipc	ra,0xffffe
    80003484:	0ec080e7          	jalr	236(ra) # 8000156c <_Z4getcv>
    80003488:	0005059b          	sext.w	a1,a0
    8000348c:	02d00793          	li	a5,45
    80003490:	02f58a63          	beq	a1,a5,800034c4 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003494:	0084b503          	ld	a0,8(s1)
    80003498:	00003097          	auipc	ra,0x3
    8000349c:	400080e7          	jalr	1024(ra) # 80006898 <_ZN6Buffer3putEi>
        i++;
    800034a0:	0019071b          	addiw	a4,s2,1
    800034a4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800034a8:	0004a683          	lw	a3,0(s1)
    800034ac:	0026979b          	slliw	a5,a3,0x2
    800034b0:	00d787bb          	addw	a5,a5,a3
    800034b4:	0017979b          	slliw	a5,a5,0x1
    800034b8:	02f767bb          	remw	a5,a4,a5
    800034bc:	fc0792e3          	bnez	a5,80003480 <_ZL16producerKeyboardPv+0x2c>
    800034c0:	fb9ff06f          	j	80003478 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800034c4:	00100793          	li	a5,1
    800034c8:	00009717          	auipc	a4,0x9
    800034cc:	7cf72823          	sw	a5,2000(a4) # 8000cc98 <_ZL9threadEnd>
    data->buffer->put('!');
    800034d0:	02100593          	li	a1,33
    800034d4:	0084b503          	ld	a0,8(s1)
    800034d8:	00003097          	auipc	ra,0x3
    800034dc:	3c0080e7          	jalr	960(ra) # 80006898 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800034e0:	0104b503          	ld	a0,16(s1)
    800034e4:	ffffe097          	auipc	ra,0xffffe
    800034e8:	058080e7          	jalr	88(ra) # 8000153c <_Z10sem_signalP4KSem>
}
    800034ec:	01813083          	ld	ra,24(sp)
    800034f0:	01013403          	ld	s0,16(sp)
    800034f4:	00813483          	ld	s1,8(sp)
    800034f8:	00013903          	ld	s2,0(sp)
    800034fc:	02010113          	addi	sp,sp,32
    80003500:	00008067          	ret

0000000080003504 <_ZL8producerPv>:

static void producer(void *arg) {
    80003504:	fe010113          	addi	sp,sp,-32
    80003508:	00113c23          	sd	ra,24(sp)
    8000350c:	00813823          	sd	s0,16(sp)
    80003510:	00913423          	sd	s1,8(sp)
    80003514:	01213023          	sd	s2,0(sp)
    80003518:	02010413          	addi	s0,sp,32
    8000351c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003520:	00000913          	li	s2,0
    80003524:	00c0006f          	j	80003530 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003528:	ffffe097          	auipc	ra,0xffffe
    8000352c:	f04080e7          	jalr	-252(ra) # 8000142c <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003530:	00009797          	auipc	a5,0x9
    80003534:	7687a783          	lw	a5,1896(a5) # 8000cc98 <_ZL9threadEnd>
    80003538:	02079e63          	bnez	a5,80003574 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    8000353c:	0004a583          	lw	a1,0(s1)
    80003540:	0305859b          	addiw	a1,a1,48
    80003544:	0084b503          	ld	a0,8(s1)
    80003548:	00003097          	auipc	ra,0x3
    8000354c:	350080e7          	jalr	848(ra) # 80006898 <_ZN6Buffer3putEi>
        i++;
    80003550:	0019071b          	addiw	a4,s2,1
    80003554:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003558:	0004a683          	lw	a3,0(s1)
    8000355c:	0026979b          	slliw	a5,a3,0x2
    80003560:	00d787bb          	addw	a5,a5,a3
    80003564:	0017979b          	slliw	a5,a5,0x1
    80003568:	02f767bb          	remw	a5,a4,a5
    8000356c:	fc0792e3          	bnez	a5,80003530 <_ZL8producerPv+0x2c>
    80003570:	fb9ff06f          	j	80003528 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003574:	0104b503          	ld	a0,16(s1)
    80003578:	ffffe097          	auipc	ra,0xffffe
    8000357c:	fc4080e7          	jalr	-60(ra) # 8000153c <_Z10sem_signalP4KSem>
}
    80003580:	01813083          	ld	ra,24(sp)
    80003584:	01013403          	ld	s0,16(sp)
    80003588:	00813483          	ld	s1,8(sp)
    8000358c:	00013903          	ld	s2,0(sp)
    80003590:	02010113          	addi	sp,sp,32
    80003594:	00008067          	ret

0000000080003598 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003598:	fd010113          	addi	sp,sp,-48
    8000359c:	02113423          	sd	ra,40(sp)
    800035a0:	02813023          	sd	s0,32(sp)
    800035a4:	00913c23          	sd	s1,24(sp)
    800035a8:	01213823          	sd	s2,16(sp)
    800035ac:	01313423          	sd	s3,8(sp)
    800035b0:	03010413          	addi	s0,sp,48
    800035b4:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800035b8:	00000993          	li	s3,0
    800035bc:	01c0006f          	j	800035d8 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800035c0:	ffffe097          	auipc	ra,0xffffe
    800035c4:	e6c080e7          	jalr	-404(ra) # 8000142c <_Z15thread_dispatchv>
    800035c8:	0500006f          	j	80003618 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800035cc:	00a00513          	li	a0,10
    800035d0:	ffffe097          	auipc	ra,0xffffe
    800035d4:	fc4080e7          	jalr	-60(ra) # 80001594 <_Z4putcc>
    while (!threadEnd) {
    800035d8:	00009797          	auipc	a5,0x9
    800035dc:	6c07a783          	lw	a5,1728(a5) # 8000cc98 <_ZL9threadEnd>
    800035e0:	06079063          	bnez	a5,80003640 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800035e4:	00893503          	ld	a0,8(s2)
    800035e8:	00003097          	auipc	ra,0x3
    800035ec:	340080e7          	jalr	832(ra) # 80006928 <_ZN6Buffer3getEv>
        i++;
    800035f0:	0019849b          	addiw	s1,s3,1
    800035f4:	0004899b          	sext.w	s3,s1
        putc(key);
    800035f8:	0ff57513          	andi	a0,a0,255
    800035fc:	ffffe097          	auipc	ra,0xffffe
    80003600:	f98080e7          	jalr	-104(ra) # 80001594 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003604:	00092703          	lw	a4,0(s2)
    80003608:	0027179b          	slliw	a5,a4,0x2
    8000360c:	00e787bb          	addw	a5,a5,a4
    80003610:	02f4e7bb          	remw	a5,s1,a5
    80003614:	fa0786e3          	beqz	a5,800035c0 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003618:	05000793          	li	a5,80
    8000361c:	02f4e4bb          	remw	s1,s1,a5
    80003620:	fa049ce3          	bnez	s1,800035d8 <_ZL8consumerPv+0x40>
    80003624:	fa9ff06f          	j	800035cc <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003628:	00893503          	ld	a0,8(s2)
    8000362c:	00003097          	auipc	ra,0x3
    80003630:	2fc080e7          	jalr	764(ra) # 80006928 <_ZN6Buffer3getEv>
        putc(key);
    80003634:	0ff57513          	andi	a0,a0,255
    80003638:	ffffe097          	auipc	ra,0xffffe
    8000363c:	f5c080e7          	jalr	-164(ra) # 80001594 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003640:	00893503          	ld	a0,8(s2)
    80003644:	00003097          	auipc	ra,0x3
    80003648:	370080e7          	jalr	880(ra) # 800069b4 <_ZN6Buffer6getCntEv>
    8000364c:	fca04ee3          	bgtz	a0,80003628 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003650:	01093503          	ld	a0,16(s2)
    80003654:	ffffe097          	auipc	ra,0xffffe
    80003658:	ee8080e7          	jalr	-280(ra) # 8000153c <_Z10sem_signalP4KSem>
}
    8000365c:	02813083          	ld	ra,40(sp)
    80003660:	02013403          	ld	s0,32(sp)
    80003664:	01813483          	ld	s1,24(sp)
    80003668:	01013903          	ld	s2,16(sp)
    8000366c:	00813983          	ld	s3,8(sp)
    80003670:	03010113          	addi	sp,sp,48
    80003674:	00008067          	ret

0000000080003678 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003678:	f9010113          	addi	sp,sp,-112
    8000367c:	06113423          	sd	ra,104(sp)
    80003680:	06813023          	sd	s0,96(sp)
    80003684:	04913c23          	sd	s1,88(sp)
    80003688:	05213823          	sd	s2,80(sp)
    8000368c:	05313423          	sd	s3,72(sp)
    80003690:	05413023          	sd	s4,64(sp)
    80003694:	03513c23          	sd	s5,56(sp)
    80003698:	03613823          	sd	s6,48(sp)
    8000369c:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800036a0:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800036a4:	00007517          	auipc	a0,0x7
    800036a8:	b9450513          	addi	a0,a0,-1132 # 8000a238 <_ZZ9kPrintIntmE6digits+0x1c8>
    800036ac:	00002097          	auipc	ra,0x2
    800036b0:	220080e7          	jalr	544(ra) # 800058cc <_Z11printStringPKc>
    getString(input, 30);
    800036b4:	01e00593          	li	a1,30
    800036b8:	fa040493          	addi	s1,s0,-96
    800036bc:	00048513          	mv	a0,s1
    800036c0:	00002097          	auipc	ra,0x2
    800036c4:	294080e7          	jalr	660(ra) # 80005954 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800036c8:	00048513          	mv	a0,s1
    800036cc:	00002097          	auipc	ra,0x2
    800036d0:	360080e7          	jalr	864(ra) # 80005a2c <_Z11stringToIntPKc>
    800036d4:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800036d8:	00007517          	auipc	a0,0x7
    800036dc:	b8050513          	addi	a0,a0,-1152 # 8000a258 <_ZZ9kPrintIntmE6digits+0x1e8>
    800036e0:	00002097          	auipc	ra,0x2
    800036e4:	1ec080e7          	jalr	492(ra) # 800058cc <_Z11printStringPKc>
    getString(input, 30);
    800036e8:	01e00593          	li	a1,30
    800036ec:	00048513          	mv	a0,s1
    800036f0:	00002097          	auipc	ra,0x2
    800036f4:	264080e7          	jalr	612(ra) # 80005954 <_Z9getStringPci>
    n = stringToInt(input);
    800036f8:	00048513          	mv	a0,s1
    800036fc:	00002097          	auipc	ra,0x2
    80003700:	330080e7          	jalr	816(ra) # 80005a2c <_Z11stringToIntPKc>
    80003704:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003708:	00007517          	auipc	a0,0x7
    8000370c:	b7050513          	addi	a0,a0,-1168 # 8000a278 <_ZZ9kPrintIntmE6digits+0x208>
    80003710:	00002097          	auipc	ra,0x2
    80003714:	1bc080e7          	jalr	444(ra) # 800058cc <_Z11printStringPKc>
	printInt(threadNum);
    80003718:	00000613          	li	a2,0
    8000371c:	00a00593          	li	a1,10
    80003720:	00090513          	mv	a0,s2
    80003724:	00002097          	auipc	ra,0x2
    80003728:	358080e7          	jalr	856(ra) # 80005a7c <_Z8printIntiii>
    printString(" i velicina bafera ");
    8000372c:	00007517          	auipc	a0,0x7
    80003730:	b6450513          	addi	a0,a0,-1180 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    80003734:	00002097          	auipc	ra,0x2
    80003738:	198080e7          	jalr	408(ra) # 800058cc <_Z11printStringPKc>
	printInt(n);
    8000373c:	00000613          	li	a2,0
    80003740:	00a00593          	li	a1,10
    80003744:	00048513          	mv	a0,s1
    80003748:	00002097          	auipc	ra,0x2
    8000374c:	334080e7          	jalr	820(ra) # 80005a7c <_Z8printIntiii>
    printString(".\n");
    80003750:	00007517          	auipc	a0,0x7
    80003754:	b5850513          	addi	a0,a0,-1192 # 8000a2a8 <_ZZ9kPrintIntmE6digits+0x238>
    80003758:	00002097          	auipc	ra,0x2
    8000375c:	174080e7          	jalr	372(ra) # 800058cc <_Z11printStringPKc>
    if(threadNum > n) {
    80003760:	0324c463          	blt	s1,s2,80003788 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003764:	03205c63          	blez	s2,8000379c <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003768:	03800513          	li	a0,56
    8000376c:	fffff097          	auipc	ra,0xfffff
    80003770:	024080e7          	jalr	36(ra) # 80002790 <_Znwm>
    80003774:	00050a13          	mv	s4,a0
    80003778:	00048593          	mv	a1,s1
    8000377c:	00003097          	auipc	ra,0x3
    80003780:	080080e7          	jalr	128(ra) # 800067fc <_ZN6BufferC1Ei>
    80003784:	0300006f          	j	800037b4 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003788:	00007517          	auipc	a0,0x7
    8000378c:	b2850513          	addi	a0,a0,-1240 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    80003790:	00002097          	auipc	ra,0x2
    80003794:	13c080e7          	jalr	316(ra) # 800058cc <_Z11printStringPKc>
        return;
    80003798:	0140006f          	j	800037ac <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    8000379c:	00007517          	auipc	a0,0x7
    800037a0:	b5450513          	addi	a0,a0,-1196 # 8000a2f0 <_ZZ9kPrintIntmE6digits+0x280>
    800037a4:	00002097          	auipc	ra,0x2
    800037a8:	128080e7          	jalr	296(ra) # 800058cc <_Z11printStringPKc>
        return;
    800037ac:	000b0113          	mv	sp,s6
    800037b0:	1500006f          	j	80003900 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    800037b4:	00000593          	li	a1,0
    800037b8:	00009517          	auipc	a0,0x9
    800037bc:	4e850513          	addi	a0,a0,1256 # 8000cca0 <_ZL10waitForAll>
    800037c0:	ffffe097          	auipc	ra,0xffffe
    800037c4:	ce4080e7          	jalr	-796(ra) # 800014a4 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    800037c8:	00391793          	slli	a5,s2,0x3
    800037cc:	00f78793          	addi	a5,a5,15
    800037d0:	ff07f793          	andi	a5,a5,-16
    800037d4:	40f10133          	sub	sp,sp,a5
    800037d8:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800037dc:	0019071b          	addiw	a4,s2,1
    800037e0:	00171793          	slli	a5,a4,0x1
    800037e4:	00e787b3          	add	a5,a5,a4
    800037e8:	00379793          	slli	a5,a5,0x3
    800037ec:	00f78793          	addi	a5,a5,15
    800037f0:	ff07f793          	andi	a5,a5,-16
    800037f4:	40f10133          	sub	sp,sp,a5
    800037f8:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800037fc:	00191613          	slli	a2,s2,0x1
    80003800:	012607b3          	add	a5,a2,s2
    80003804:	00379793          	slli	a5,a5,0x3
    80003808:	00f987b3          	add	a5,s3,a5
    8000380c:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003810:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003814:	00009717          	auipc	a4,0x9
    80003818:	48c73703          	ld	a4,1164(a4) # 8000cca0 <_ZL10waitForAll>
    8000381c:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003820:	00078613          	mv	a2,a5
    80003824:	00000597          	auipc	a1,0x0
    80003828:	d7458593          	addi	a1,a1,-652 # 80003598 <_ZL8consumerPv>
    8000382c:	f9840513          	addi	a0,s0,-104
    80003830:	ffffe097          	auipc	ra,0xffffe
    80003834:	b48080e7          	jalr	-1208(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003838:	00000493          	li	s1,0
    8000383c:	0280006f          	j	80003864 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003840:	00000597          	auipc	a1,0x0
    80003844:	c1458593          	addi	a1,a1,-1004 # 80003454 <_ZL16producerKeyboardPv>
                      data + i);
    80003848:	00179613          	slli	a2,a5,0x1
    8000384c:	00f60633          	add	a2,a2,a5
    80003850:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003854:	00c98633          	add	a2,s3,a2
    80003858:	ffffe097          	auipc	ra,0xffffe
    8000385c:	b20080e7          	jalr	-1248(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003860:	0014849b          	addiw	s1,s1,1
    80003864:	0524d263          	bge	s1,s2,800038a8 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003868:	00149793          	slli	a5,s1,0x1
    8000386c:	009787b3          	add	a5,a5,s1
    80003870:	00379793          	slli	a5,a5,0x3
    80003874:	00f987b3          	add	a5,s3,a5
    80003878:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    8000387c:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003880:	00009717          	auipc	a4,0x9
    80003884:	42073703          	ld	a4,1056(a4) # 8000cca0 <_ZL10waitForAll>
    80003888:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    8000388c:	00048793          	mv	a5,s1
    80003890:	00349513          	slli	a0,s1,0x3
    80003894:	00aa8533          	add	a0,s5,a0
    80003898:	fa9054e3          	blez	s1,80003840 <_Z22producerConsumer_C_APIv+0x1c8>
    8000389c:	00000597          	auipc	a1,0x0
    800038a0:	c6858593          	addi	a1,a1,-920 # 80003504 <_ZL8producerPv>
    800038a4:	fa5ff06f          	j	80003848 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800038a8:	ffffe097          	auipc	ra,0xffffe
    800038ac:	b84080e7          	jalr	-1148(ra) # 8000142c <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    800038b0:	00000493          	li	s1,0
    800038b4:	00994e63          	blt	s2,s1,800038d0 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    800038b8:	00009517          	auipc	a0,0x9
    800038bc:	3e853503          	ld	a0,1000(a0) # 8000cca0 <_ZL10waitForAll>
    800038c0:	ffffe097          	auipc	ra,0xffffe
    800038c4:	c4c080e7          	jalr	-948(ra) # 8000150c <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    800038c8:	0014849b          	addiw	s1,s1,1
    800038cc:	fe9ff06f          	j	800038b4 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    800038d0:	00009517          	auipc	a0,0x9
    800038d4:	3d053503          	ld	a0,976(a0) # 8000cca0 <_ZL10waitForAll>
    800038d8:	ffffe097          	auipc	ra,0xffffe
    800038dc:	c04080e7          	jalr	-1020(ra) # 800014dc <_Z9sem_closeP4KSem>
    delete buffer;
    800038e0:	000a0e63          	beqz	s4,800038fc <_Z22producerConsumer_C_APIv+0x284>
    800038e4:	000a0513          	mv	a0,s4
    800038e8:	00003097          	auipc	ra,0x3
    800038ec:	154080e7          	jalr	340(ra) # 80006a3c <_ZN6BufferD1Ev>
    800038f0:	000a0513          	mv	a0,s4
    800038f4:	fffff097          	auipc	ra,0xfffff
    800038f8:	eec080e7          	jalr	-276(ra) # 800027e0 <_ZdlPv>
    800038fc:	000b0113          	mv	sp,s6

}
    80003900:	f9040113          	addi	sp,s0,-112
    80003904:	06813083          	ld	ra,104(sp)
    80003908:	06013403          	ld	s0,96(sp)
    8000390c:	05813483          	ld	s1,88(sp)
    80003910:	05013903          	ld	s2,80(sp)
    80003914:	04813983          	ld	s3,72(sp)
    80003918:	04013a03          	ld	s4,64(sp)
    8000391c:	03813a83          	ld	s5,56(sp)
    80003920:	03013b03          	ld	s6,48(sp)
    80003924:	07010113          	addi	sp,sp,112
    80003928:	00008067          	ret
    8000392c:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003930:	000a0513          	mv	a0,s4
    80003934:	fffff097          	auipc	ra,0xfffff
    80003938:	eac080e7          	jalr	-340(ra) # 800027e0 <_ZdlPv>
    8000393c:	00048513          	mv	a0,s1
    80003940:	0000a097          	auipc	ra,0xa
    80003944:	488080e7          	jalr	1160(ra) # 8000ddc8 <_Unwind_Resume>

0000000080003948 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003948:	fe010113          	addi	sp,sp,-32
    8000394c:	00113c23          	sd	ra,24(sp)
    80003950:	00813823          	sd	s0,16(sp)
    80003954:	00913423          	sd	s1,8(sp)
    80003958:	01213023          	sd	s2,0(sp)
    8000395c:	02010413          	addi	s0,sp,32
    80003960:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003964:	00100793          	li	a5,1
    80003968:	02a7f863          	bgeu	a5,a0,80003998 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000396c:	00a00793          	li	a5,10
    80003970:	02f577b3          	remu	a5,a0,a5
    80003974:	02078e63          	beqz	a5,800039b0 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003978:	fff48513          	addi	a0,s1,-1
    8000397c:	00000097          	auipc	ra,0x0
    80003980:	fcc080e7          	jalr	-52(ra) # 80003948 <_ZL9fibonaccim>
    80003984:	00050913          	mv	s2,a0
    80003988:	ffe48513          	addi	a0,s1,-2
    8000398c:	00000097          	auipc	ra,0x0
    80003990:	fbc080e7          	jalr	-68(ra) # 80003948 <_ZL9fibonaccim>
    80003994:	00a90533          	add	a0,s2,a0
}
    80003998:	01813083          	ld	ra,24(sp)
    8000399c:	01013403          	ld	s0,16(sp)
    800039a0:	00813483          	ld	s1,8(sp)
    800039a4:	00013903          	ld	s2,0(sp)
    800039a8:	02010113          	addi	sp,sp,32
    800039ac:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800039b0:	ffffe097          	auipc	ra,0xffffe
    800039b4:	a7c080e7          	jalr	-1412(ra) # 8000142c <_Z15thread_dispatchv>
    800039b8:	fc1ff06f          	j	80003978 <_ZL9fibonaccim+0x30>

00000000800039bc <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    800039bc:	fe010113          	addi	sp,sp,-32
    800039c0:	00113c23          	sd	ra,24(sp)
    800039c4:	00813823          	sd	s0,16(sp)
    800039c8:	00913423          	sd	s1,8(sp)
    800039cc:	01213023          	sd	s2,0(sp)
    800039d0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800039d4:	00000913          	li	s2,0
    800039d8:	0380006f          	j	80003a10 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800039dc:	ffffe097          	auipc	ra,0xffffe
    800039e0:	a50080e7          	jalr	-1456(ra) # 8000142c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800039e4:	00148493          	addi	s1,s1,1
    800039e8:	000027b7          	lui	a5,0x2
    800039ec:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800039f0:	0097ee63          	bltu	a5,s1,80003a0c <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800039f4:	00000713          	li	a4,0
    800039f8:	000077b7          	lui	a5,0x7
    800039fc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003a00:	fce7eee3          	bltu	a5,a4,800039dc <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003a04:	00170713          	addi	a4,a4,1
    80003a08:	ff1ff06f          	j	800039f8 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003a0c:	00190913          	addi	s2,s2,1
    80003a10:	00900793          	li	a5,9
    80003a14:	0527e063          	bltu	a5,s2,80003a54 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003a18:	00007517          	auipc	a0,0x7
    80003a1c:	90850513          	addi	a0,a0,-1784 # 8000a320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80003a20:	00002097          	auipc	ra,0x2
    80003a24:	eac080e7          	jalr	-340(ra) # 800058cc <_Z11printStringPKc>
    80003a28:	00000613          	li	a2,0
    80003a2c:	00a00593          	li	a1,10
    80003a30:	0009051b          	sext.w	a0,s2
    80003a34:	00002097          	auipc	ra,0x2
    80003a38:	048080e7          	jalr	72(ra) # 80005a7c <_Z8printIntiii>
    80003a3c:	00007517          	auipc	a0,0x7
    80003a40:	b4450513          	addi	a0,a0,-1212 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80003a44:	00002097          	auipc	ra,0x2
    80003a48:	e88080e7          	jalr	-376(ra) # 800058cc <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003a4c:	00000493          	li	s1,0
    80003a50:	f99ff06f          	j	800039e8 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003a54:	00007517          	auipc	a0,0x7
    80003a58:	8d450513          	addi	a0,a0,-1836 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80003a5c:	00002097          	auipc	ra,0x2
    80003a60:	e70080e7          	jalr	-400(ra) # 800058cc <_Z11printStringPKc>
    finishedA = true;
    80003a64:	00100793          	li	a5,1
    80003a68:	00009717          	auipc	a4,0x9
    80003a6c:	24f70023          	sb	a5,576(a4) # 8000cca8 <_ZL9finishedA>
}
    80003a70:	01813083          	ld	ra,24(sp)
    80003a74:	01013403          	ld	s0,16(sp)
    80003a78:	00813483          	ld	s1,8(sp)
    80003a7c:	00013903          	ld	s2,0(sp)
    80003a80:	02010113          	addi	sp,sp,32
    80003a84:	00008067          	ret

0000000080003a88 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003a88:	fe010113          	addi	sp,sp,-32
    80003a8c:	00113c23          	sd	ra,24(sp)
    80003a90:	00813823          	sd	s0,16(sp)
    80003a94:	00913423          	sd	s1,8(sp)
    80003a98:	01213023          	sd	s2,0(sp)
    80003a9c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003aa0:	00000913          	li	s2,0
    80003aa4:	0380006f          	j	80003adc <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003aa8:	ffffe097          	auipc	ra,0xffffe
    80003aac:	984080e7          	jalr	-1660(ra) # 8000142c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003ab0:	00148493          	addi	s1,s1,1
    80003ab4:	000027b7          	lui	a5,0x2
    80003ab8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003abc:	0097ee63          	bltu	a5,s1,80003ad8 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003ac0:	00000713          	li	a4,0
    80003ac4:	000077b7          	lui	a5,0x7
    80003ac8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003acc:	fce7eee3          	bltu	a5,a4,80003aa8 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003ad0:	00170713          	addi	a4,a4,1
    80003ad4:	ff1ff06f          	j	80003ac4 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003ad8:	00190913          	addi	s2,s2,1
    80003adc:	00f00793          	li	a5,15
    80003ae0:	0527e063          	bltu	a5,s2,80003b20 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003ae4:	00007517          	auipc	a0,0x7
    80003ae8:	85450513          	addi	a0,a0,-1964 # 8000a338 <_ZZ9kPrintIntmE6digits+0x2c8>
    80003aec:	00002097          	auipc	ra,0x2
    80003af0:	de0080e7          	jalr	-544(ra) # 800058cc <_Z11printStringPKc>
    80003af4:	00000613          	li	a2,0
    80003af8:	00a00593          	li	a1,10
    80003afc:	0009051b          	sext.w	a0,s2
    80003b00:	00002097          	auipc	ra,0x2
    80003b04:	f7c080e7          	jalr	-132(ra) # 80005a7c <_Z8printIntiii>
    80003b08:	00007517          	auipc	a0,0x7
    80003b0c:	a7850513          	addi	a0,a0,-1416 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80003b10:	00002097          	auipc	ra,0x2
    80003b14:	dbc080e7          	jalr	-580(ra) # 800058cc <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003b18:	00000493          	li	s1,0
    80003b1c:	f99ff06f          	j	80003ab4 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003b20:	00007517          	auipc	a0,0x7
    80003b24:	82050513          	addi	a0,a0,-2016 # 8000a340 <_ZZ9kPrintIntmE6digits+0x2d0>
    80003b28:	00002097          	auipc	ra,0x2
    80003b2c:	da4080e7          	jalr	-604(ra) # 800058cc <_Z11printStringPKc>
    finishedB = true;
    80003b30:	00100793          	li	a5,1
    80003b34:	00009717          	auipc	a4,0x9
    80003b38:	16f70aa3          	sb	a5,373(a4) # 8000cca9 <_ZL9finishedB>
    thread_dispatch();
    80003b3c:	ffffe097          	auipc	ra,0xffffe
    80003b40:	8f0080e7          	jalr	-1808(ra) # 8000142c <_Z15thread_dispatchv>
}
    80003b44:	01813083          	ld	ra,24(sp)
    80003b48:	01013403          	ld	s0,16(sp)
    80003b4c:	00813483          	ld	s1,8(sp)
    80003b50:	00013903          	ld	s2,0(sp)
    80003b54:	02010113          	addi	sp,sp,32
    80003b58:	00008067          	ret

0000000080003b5c <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003b5c:	fe010113          	addi	sp,sp,-32
    80003b60:	00113c23          	sd	ra,24(sp)
    80003b64:	00813823          	sd	s0,16(sp)
    80003b68:	00913423          	sd	s1,8(sp)
    80003b6c:	01213023          	sd	s2,0(sp)
    80003b70:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003b74:	00000493          	li	s1,0
    80003b78:	0400006f          	j	80003bb8 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003b7c:	00006517          	auipc	a0,0x6
    80003b80:	7d450513          	addi	a0,a0,2004 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80003b84:	00002097          	auipc	ra,0x2
    80003b88:	d48080e7          	jalr	-696(ra) # 800058cc <_Z11printStringPKc>
    80003b8c:	00000613          	li	a2,0
    80003b90:	00a00593          	li	a1,10
    80003b94:	00048513          	mv	a0,s1
    80003b98:	00002097          	auipc	ra,0x2
    80003b9c:	ee4080e7          	jalr	-284(ra) # 80005a7c <_Z8printIntiii>
    80003ba0:	00007517          	auipc	a0,0x7
    80003ba4:	9e050513          	addi	a0,a0,-1568 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80003ba8:	00002097          	auipc	ra,0x2
    80003bac:	d24080e7          	jalr	-732(ra) # 800058cc <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003bb0:	0014849b          	addiw	s1,s1,1
    80003bb4:	0ff4f493          	andi	s1,s1,255
    80003bb8:	00200793          	li	a5,2
    80003bbc:	fc97f0e3          	bgeu	a5,s1,80003b7c <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003bc0:	00006517          	auipc	a0,0x6
    80003bc4:	79850513          	addi	a0,a0,1944 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80003bc8:	00002097          	auipc	ra,0x2
    80003bcc:	d04080e7          	jalr	-764(ra) # 800058cc <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003bd0:	00700313          	li	t1,7
    thread_dispatch();
    80003bd4:	ffffe097          	auipc	ra,0xffffe
    80003bd8:	858080e7          	jalr	-1960(ra) # 8000142c <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003bdc:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003be0:	00006517          	auipc	a0,0x6
    80003be4:	78850513          	addi	a0,a0,1928 # 8000a368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80003be8:	00002097          	auipc	ra,0x2
    80003bec:	ce4080e7          	jalr	-796(ra) # 800058cc <_Z11printStringPKc>
    80003bf0:	00000613          	li	a2,0
    80003bf4:	00a00593          	li	a1,10
    80003bf8:	0009051b          	sext.w	a0,s2
    80003bfc:	00002097          	auipc	ra,0x2
    80003c00:	e80080e7          	jalr	-384(ra) # 80005a7c <_Z8printIntiii>
    80003c04:	00007517          	auipc	a0,0x7
    80003c08:	97c50513          	addi	a0,a0,-1668 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80003c0c:	00002097          	auipc	ra,0x2
    80003c10:	cc0080e7          	jalr	-832(ra) # 800058cc <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003c14:	00c00513          	li	a0,12
    80003c18:	00000097          	auipc	ra,0x0
    80003c1c:	d30080e7          	jalr	-720(ra) # 80003948 <_ZL9fibonaccim>
    80003c20:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003c24:	00006517          	auipc	a0,0x6
    80003c28:	74c50513          	addi	a0,a0,1868 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    80003c2c:	00002097          	auipc	ra,0x2
    80003c30:	ca0080e7          	jalr	-864(ra) # 800058cc <_Z11printStringPKc>
    80003c34:	00000613          	li	a2,0
    80003c38:	00a00593          	li	a1,10
    80003c3c:	0009051b          	sext.w	a0,s2
    80003c40:	00002097          	auipc	ra,0x2
    80003c44:	e3c080e7          	jalr	-452(ra) # 80005a7c <_Z8printIntiii>
    80003c48:	00007517          	auipc	a0,0x7
    80003c4c:	93850513          	addi	a0,a0,-1736 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80003c50:	00002097          	auipc	ra,0x2
    80003c54:	c7c080e7          	jalr	-900(ra) # 800058cc <_Z11printStringPKc>
    80003c58:	0400006f          	j	80003c98 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003c5c:	00006517          	auipc	a0,0x6
    80003c60:	6f450513          	addi	a0,a0,1780 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80003c64:	00002097          	auipc	ra,0x2
    80003c68:	c68080e7          	jalr	-920(ra) # 800058cc <_Z11printStringPKc>
    80003c6c:	00000613          	li	a2,0
    80003c70:	00a00593          	li	a1,10
    80003c74:	00048513          	mv	a0,s1
    80003c78:	00002097          	auipc	ra,0x2
    80003c7c:	e04080e7          	jalr	-508(ra) # 80005a7c <_Z8printIntiii>
    80003c80:	00007517          	auipc	a0,0x7
    80003c84:	90050513          	addi	a0,a0,-1792 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80003c88:	00002097          	auipc	ra,0x2
    80003c8c:	c44080e7          	jalr	-956(ra) # 800058cc <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003c90:	0014849b          	addiw	s1,s1,1
    80003c94:	0ff4f493          	andi	s1,s1,255
    80003c98:	00500793          	li	a5,5
    80003c9c:	fc97f0e3          	bgeu	a5,s1,80003c5c <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80003ca0:	00006517          	auipc	a0,0x6
    80003ca4:	6e050513          	addi	a0,a0,1760 # 8000a380 <_ZZ9kPrintIntmE6digits+0x310>
    80003ca8:	00002097          	auipc	ra,0x2
    80003cac:	c24080e7          	jalr	-988(ra) # 800058cc <_Z11printStringPKc>
    finishedC = true;
    80003cb0:	00100793          	li	a5,1
    80003cb4:	00009717          	auipc	a4,0x9
    80003cb8:	fef70b23          	sb	a5,-10(a4) # 8000ccaa <_ZL9finishedC>
    thread_dispatch();
    80003cbc:	ffffd097          	auipc	ra,0xffffd
    80003cc0:	770080e7          	jalr	1904(ra) # 8000142c <_Z15thread_dispatchv>
}
    80003cc4:	01813083          	ld	ra,24(sp)
    80003cc8:	01013403          	ld	s0,16(sp)
    80003ccc:	00813483          	ld	s1,8(sp)
    80003cd0:	00013903          	ld	s2,0(sp)
    80003cd4:	02010113          	addi	sp,sp,32
    80003cd8:	00008067          	ret

0000000080003cdc <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003cdc:	fe010113          	addi	sp,sp,-32
    80003ce0:	00113c23          	sd	ra,24(sp)
    80003ce4:	00813823          	sd	s0,16(sp)
    80003ce8:	00913423          	sd	s1,8(sp)
    80003cec:	01213023          	sd	s2,0(sp)
    80003cf0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003cf4:	00a00493          	li	s1,10
    80003cf8:	0400006f          	j	80003d38 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003cfc:	00006517          	auipc	a0,0x6
    80003d00:	69450513          	addi	a0,a0,1684 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80003d04:	00002097          	auipc	ra,0x2
    80003d08:	bc8080e7          	jalr	-1080(ra) # 800058cc <_Z11printStringPKc>
    80003d0c:	00000613          	li	a2,0
    80003d10:	00a00593          	li	a1,10
    80003d14:	00048513          	mv	a0,s1
    80003d18:	00002097          	auipc	ra,0x2
    80003d1c:	d64080e7          	jalr	-668(ra) # 80005a7c <_Z8printIntiii>
    80003d20:	00007517          	auipc	a0,0x7
    80003d24:	86050513          	addi	a0,a0,-1952 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80003d28:	00002097          	auipc	ra,0x2
    80003d2c:	ba4080e7          	jalr	-1116(ra) # 800058cc <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003d30:	0014849b          	addiw	s1,s1,1
    80003d34:	0ff4f493          	andi	s1,s1,255
    80003d38:	00c00793          	li	a5,12
    80003d3c:	fc97f0e3          	bgeu	a5,s1,80003cfc <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003d40:	00006517          	auipc	a0,0x6
    80003d44:	65850513          	addi	a0,a0,1624 # 8000a398 <_ZZ9kPrintIntmE6digits+0x328>
    80003d48:	00002097          	auipc	ra,0x2
    80003d4c:	b84080e7          	jalr	-1148(ra) # 800058cc <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003d50:	00500313          	li	t1,5
    thread_dispatch();
    80003d54:	ffffd097          	auipc	ra,0xffffd
    80003d58:	6d8080e7          	jalr	1752(ra) # 8000142c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003d5c:	01000513          	li	a0,16
    80003d60:	00000097          	auipc	ra,0x0
    80003d64:	be8080e7          	jalr	-1048(ra) # 80003948 <_ZL9fibonaccim>
    80003d68:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003d6c:	00006517          	auipc	a0,0x6
    80003d70:	63c50513          	addi	a0,a0,1596 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    80003d74:	00002097          	auipc	ra,0x2
    80003d78:	b58080e7          	jalr	-1192(ra) # 800058cc <_Z11printStringPKc>
    80003d7c:	00000613          	li	a2,0
    80003d80:	00a00593          	li	a1,10
    80003d84:	0009051b          	sext.w	a0,s2
    80003d88:	00002097          	auipc	ra,0x2
    80003d8c:	cf4080e7          	jalr	-780(ra) # 80005a7c <_Z8printIntiii>
    80003d90:	00006517          	auipc	a0,0x6
    80003d94:	7f050513          	addi	a0,a0,2032 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80003d98:	00002097          	auipc	ra,0x2
    80003d9c:	b34080e7          	jalr	-1228(ra) # 800058cc <_Z11printStringPKc>
    80003da0:	0400006f          	j	80003de0 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003da4:	00006517          	auipc	a0,0x6
    80003da8:	5ec50513          	addi	a0,a0,1516 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80003dac:	00002097          	auipc	ra,0x2
    80003db0:	b20080e7          	jalr	-1248(ra) # 800058cc <_Z11printStringPKc>
    80003db4:	00000613          	li	a2,0
    80003db8:	00a00593          	li	a1,10
    80003dbc:	00048513          	mv	a0,s1
    80003dc0:	00002097          	auipc	ra,0x2
    80003dc4:	cbc080e7          	jalr	-836(ra) # 80005a7c <_Z8printIntiii>
    80003dc8:	00006517          	auipc	a0,0x6
    80003dcc:	7b850513          	addi	a0,a0,1976 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80003dd0:	00002097          	auipc	ra,0x2
    80003dd4:	afc080e7          	jalr	-1284(ra) # 800058cc <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003dd8:	0014849b          	addiw	s1,s1,1
    80003ddc:	0ff4f493          	andi	s1,s1,255
    80003de0:	00f00793          	li	a5,15
    80003de4:	fc97f0e3          	bgeu	a5,s1,80003da4 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003de8:	00006517          	auipc	a0,0x6
    80003dec:	5d050513          	addi	a0,a0,1488 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    80003df0:	00002097          	auipc	ra,0x2
    80003df4:	adc080e7          	jalr	-1316(ra) # 800058cc <_Z11printStringPKc>
    finishedD = true;
    80003df8:	00100793          	li	a5,1
    80003dfc:	00009717          	auipc	a4,0x9
    80003e00:	eaf707a3          	sb	a5,-337(a4) # 8000ccab <_ZL9finishedD>
    thread_dispatch();
    80003e04:	ffffd097          	auipc	ra,0xffffd
    80003e08:	628080e7          	jalr	1576(ra) # 8000142c <_Z15thread_dispatchv>
}
    80003e0c:	01813083          	ld	ra,24(sp)
    80003e10:	01013403          	ld	s0,16(sp)
    80003e14:	00813483          	ld	s1,8(sp)
    80003e18:	00013903          	ld	s2,0(sp)
    80003e1c:	02010113          	addi	sp,sp,32
    80003e20:	00008067          	ret

0000000080003e24 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003e24:	fc010113          	addi	sp,sp,-64
    80003e28:	02113c23          	sd	ra,56(sp)
    80003e2c:	02813823          	sd	s0,48(sp)
    80003e30:	02913423          	sd	s1,40(sp)
    80003e34:	03213023          	sd	s2,32(sp)
    80003e38:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003e3c:	02000513          	li	a0,32
    80003e40:	fffff097          	auipc	ra,0xfffff
    80003e44:	950080e7          	jalr	-1712(ra) # 80002790 <_Znwm>
    80003e48:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003e4c:	fffff097          	auipc	ra,0xfffff
    80003e50:	be4080e7          	jalr	-1052(ra) # 80002a30 <_ZN6ThreadC1Ev>
    80003e54:	00009797          	auipc	a5,0x9
    80003e58:	adc78793          	addi	a5,a5,-1316 # 8000c930 <_ZTV7WorkerA+0x10>
    80003e5c:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003e60:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003e64:	00006517          	auipc	a0,0x6
    80003e68:	56450513          	addi	a0,a0,1380 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80003e6c:	00002097          	auipc	ra,0x2
    80003e70:	a60080e7          	jalr	-1440(ra) # 800058cc <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003e74:	02000513          	li	a0,32
    80003e78:	fffff097          	auipc	ra,0xfffff
    80003e7c:	918080e7          	jalr	-1768(ra) # 80002790 <_Znwm>
    80003e80:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003e84:	fffff097          	auipc	ra,0xfffff
    80003e88:	bac080e7          	jalr	-1108(ra) # 80002a30 <_ZN6ThreadC1Ev>
    80003e8c:	00009797          	auipc	a5,0x9
    80003e90:	acc78793          	addi	a5,a5,-1332 # 8000c958 <_ZTV7WorkerB+0x10>
    80003e94:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003e98:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003e9c:	00006517          	auipc	a0,0x6
    80003ea0:	54450513          	addi	a0,a0,1348 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80003ea4:	00002097          	auipc	ra,0x2
    80003ea8:	a28080e7          	jalr	-1496(ra) # 800058cc <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003eac:	02000513          	li	a0,32
    80003eb0:	fffff097          	auipc	ra,0xfffff
    80003eb4:	8e0080e7          	jalr	-1824(ra) # 80002790 <_Znwm>
    80003eb8:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003ebc:	fffff097          	auipc	ra,0xfffff
    80003ec0:	b74080e7          	jalr	-1164(ra) # 80002a30 <_ZN6ThreadC1Ev>
    80003ec4:	00009797          	auipc	a5,0x9
    80003ec8:	abc78793          	addi	a5,a5,-1348 # 8000c980 <_ZTV7WorkerC+0x10>
    80003ecc:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003ed0:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003ed4:	00006517          	auipc	a0,0x6
    80003ed8:	52450513          	addi	a0,a0,1316 # 8000a3f8 <_ZZ9kPrintIntmE6digits+0x388>
    80003edc:	00002097          	auipc	ra,0x2
    80003ee0:	9f0080e7          	jalr	-1552(ra) # 800058cc <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80003ee4:	02000513          	li	a0,32
    80003ee8:	fffff097          	auipc	ra,0xfffff
    80003eec:	8a8080e7          	jalr	-1880(ra) # 80002790 <_Znwm>
    80003ef0:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80003ef4:	fffff097          	auipc	ra,0xfffff
    80003ef8:	b3c080e7          	jalr	-1220(ra) # 80002a30 <_ZN6ThreadC1Ev>
    80003efc:	00009797          	auipc	a5,0x9
    80003f00:	aac78793          	addi	a5,a5,-1364 # 8000c9a8 <_ZTV7WorkerD+0x10>
    80003f04:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80003f08:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80003f0c:	00006517          	auipc	a0,0x6
    80003f10:	50450513          	addi	a0,a0,1284 # 8000a410 <_ZZ9kPrintIntmE6digits+0x3a0>
    80003f14:	00002097          	auipc	ra,0x2
    80003f18:	9b8080e7          	jalr	-1608(ra) # 800058cc <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80003f1c:	00000493          	li	s1,0
    80003f20:	00300793          	li	a5,3
    80003f24:	0297c663          	blt	a5,s1,80003f50 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80003f28:	00349793          	slli	a5,s1,0x3
    80003f2c:	fe040713          	addi	a4,s0,-32
    80003f30:	00f707b3          	add	a5,a4,a5
    80003f34:	fe07b503          	ld	a0,-32(a5)
    80003f38:	fffff097          	auipc	ra,0xfffff
    80003f3c:	a08080e7          	jalr	-1528(ra) # 80002940 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80003f40:	0014849b          	addiw	s1,s1,1
    80003f44:	fddff06f          	j	80003f20 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80003f48:	fffff097          	auipc	ra,0xfffff
    80003f4c:	a5c080e7          	jalr	-1444(ra) # 800029a4 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003f50:	00009797          	auipc	a5,0x9
    80003f54:	d587c783          	lbu	a5,-680(a5) # 8000cca8 <_ZL9finishedA>
    80003f58:	fe0788e3          	beqz	a5,80003f48 <_Z20Threads_CPP_API_testv+0x124>
    80003f5c:	00009797          	auipc	a5,0x9
    80003f60:	d4d7c783          	lbu	a5,-691(a5) # 8000cca9 <_ZL9finishedB>
    80003f64:	fe0782e3          	beqz	a5,80003f48 <_Z20Threads_CPP_API_testv+0x124>
    80003f68:	00009797          	auipc	a5,0x9
    80003f6c:	d427c783          	lbu	a5,-702(a5) # 8000ccaa <_ZL9finishedC>
    80003f70:	fc078ce3          	beqz	a5,80003f48 <_Z20Threads_CPP_API_testv+0x124>
    80003f74:	00009797          	auipc	a5,0x9
    80003f78:	d377c783          	lbu	a5,-713(a5) # 8000ccab <_ZL9finishedD>
    80003f7c:	fc0786e3          	beqz	a5,80003f48 <_Z20Threads_CPP_API_testv+0x124>
    80003f80:	fc040493          	addi	s1,s0,-64
    80003f84:	0080006f          	j	80003f8c <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    80003f88:	00848493          	addi	s1,s1,8
    80003f8c:	fe040793          	addi	a5,s0,-32
    80003f90:	08f48663          	beq	s1,a5,8000401c <_Z20Threads_CPP_API_testv+0x1f8>
    80003f94:	0004b503          	ld	a0,0(s1)
		delete thread;
    80003f98:	fe0508e3          	beqz	a0,80003f88 <_Z20Threads_CPP_API_testv+0x164>
    80003f9c:	00053783          	ld	a5,0(a0)
    80003fa0:	0087b783          	ld	a5,8(a5)
    80003fa4:	000780e7          	jalr	a5
    80003fa8:	fe1ff06f          	j	80003f88 <_Z20Threads_CPP_API_testv+0x164>
    80003fac:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003fb0:	00048513          	mv	a0,s1
    80003fb4:	fffff097          	auipc	ra,0xfffff
    80003fb8:	82c080e7          	jalr	-2004(ra) # 800027e0 <_ZdlPv>
    80003fbc:	00090513          	mv	a0,s2
    80003fc0:	0000a097          	auipc	ra,0xa
    80003fc4:	e08080e7          	jalr	-504(ra) # 8000ddc8 <_Unwind_Resume>
    80003fc8:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003fcc:	00048513          	mv	a0,s1
    80003fd0:	fffff097          	auipc	ra,0xfffff
    80003fd4:	810080e7          	jalr	-2032(ra) # 800027e0 <_ZdlPv>
    80003fd8:	00090513          	mv	a0,s2
    80003fdc:	0000a097          	auipc	ra,0xa
    80003fe0:	dec080e7          	jalr	-532(ra) # 8000ddc8 <_Unwind_Resume>
    80003fe4:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80003fe8:	00048513          	mv	a0,s1
    80003fec:	ffffe097          	auipc	ra,0xffffe
    80003ff0:	7f4080e7          	jalr	2036(ra) # 800027e0 <_ZdlPv>
    80003ff4:	00090513          	mv	a0,s2
    80003ff8:	0000a097          	auipc	ra,0xa
    80003ffc:	dd0080e7          	jalr	-560(ra) # 8000ddc8 <_Unwind_Resume>
    80004000:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004004:	00048513          	mv	a0,s1
    80004008:	ffffe097          	auipc	ra,0xffffe
    8000400c:	7d8080e7          	jalr	2008(ra) # 800027e0 <_ZdlPv>
    80004010:	00090513          	mv	a0,s2
    80004014:	0000a097          	auipc	ra,0xa
    80004018:	db4080e7          	jalr	-588(ra) # 8000ddc8 <_Unwind_Resume>
	}
}
    8000401c:	03813083          	ld	ra,56(sp)
    80004020:	03013403          	ld	s0,48(sp)
    80004024:	02813483          	ld	s1,40(sp)
    80004028:	02013903          	ld	s2,32(sp)
    8000402c:	04010113          	addi	sp,sp,64
    80004030:	00008067          	ret

0000000080004034 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004034:	ff010113          	addi	sp,sp,-16
    80004038:	00113423          	sd	ra,8(sp)
    8000403c:	00813023          	sd	s0,0(sp)
    80004040:	01010413          	addi	s0,sp,16
    80004044:	00009797          	auipc	a5,0x9
    80004048:	8ec78793          	addi	a5,a5,-1812 # 8000c930 <_ZTV7WorkerA+0x10>
    8000404c:	00f53023          	sd	a5,0(a0)
    80004050:	ffffe097          	auipc	ra,0xffffe
    80004054:	650080e7          	jalr	1616(ra) # 800026a0 <_ZN6ThreadD1Ev>
    80004058:	00813083          	ld	ra,8(sp)
    8000405c:	00013403          	ld	s0,0(sp)
    80004060:	01010113          	addi	sp,sp,16
    80004064:	00008067          	ret

0000000080004068 <_ZN7WorkerAD0Ev>:
    80004068:	fe010113          	addi	sp,sp,-32
    8000406c:	00113c23          	sd	ra,24(sp)
    80004070:	00813823          	sd	s0,16(sp)
    80004074:	00913423          	sd	s1,8(sp)
    80004078:	02010413          	addi	s0,sp,32
    8000407c:	00050493          	mv	s1,a0
    80004080:	00009797          	auipc	a5,0x9
    80004084:	8b078793          	addi	a5,a5,-1872 # 8000c930 <_ZTV7WorkerA+0x10>
    80004088:	00f53023          	sd	a5,0(a0)
    8000408c:	ffffe097          	auipc	ra,0xffffe
    80004090:	614080e7          	jalr	1556(ra) # 800026a0 <_ZN6ThreadD1Ev>
    80004094:	00048513          	mv	a0,s1
    80004098:	ffffe097          	auipc	ra,0xffffe
    8000409c:	748080e7          	jalr	1864(ra) # 800027e0 <_ZdlPv>
    800040a0:	01813083          	ld	ra,24(sp)
    800040a4:	01013403          	ld	s0,16(sp)
    800040a8:	00813483          	ld	s1,8(sp)
    800040ac:	02010113          	addi	sp,sp,32
    800040b0:	00008067          	ret

00000000800040b4 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800040b4:	ff010113          	addi	sp,sp,-16
    800040b8:	00113423          	sd	ra,8(sp)
    800040bc:	00813023          	sd	s0,0(sp)
    800040c0:	01010413          	addi	s0,sp,16
    800040c4:	00009797          	auipc	a5,0x9
    800040c8:	89478793          	addi	a5,a5,-1900 # 8000c958 <_ZTV7WorkerB+0x10>
    800040cc:	00f53023          	sd	a5,0(a0)
    800040d0:	ffffe097          	auipc	ra,0xffffe
    800040d4:	5d0080e7          	jalr	1488(ra) # 800026a0 <_ZN6ThreadD1Ev>
    800040d8:	00813083          	ld	ra,8(sp)
    800040dc:	00013403          	ld	s0,0(sp)
    800040e0:	01010113          	addi	sp,sp,16
    800040e4:	00008067          	ret

00000000800040e8 <_ZN7WorkerBD0Ev>:
    800040e8:	fe010113          	addi	sp,sp,-32
    800040ec:	00113c23          	sd	ra,24(sp)
    800040f0:	00813823          	sd	s0,16(sp)
    800040f4:	00913423          	sd	s1,8(sp)
    800040f8:	02010413          	addi	s0,sp,32
    800040fc:	00050493          	mv	s1,a0
    80004100:	00009797          	auipc	a5,0x9
    80004104:	85878793          	addi	a5,a5,-1960 # 8000c958 <_ZTV7WorkerB+0x10>
    80004108:	00f53023          	sd	a5,0(a0)
    8000410c:	ffffe097          	auipc	ra,0xffffe
    80004110:	594080e7          	jalr	1428(ra) # 800026a0 <_ZN6ThreadD1Ev>
    80004114:	00048513          	mv	a0,s1
    80004118:	ffffe097          	auipc	ra,0xffffe
    8000411c:	6c8080e7          	jalr	1736(ra) # 800027e0 <_ZdlPv>
    80004120:	01813083          	ld	ra,24(sp)
    80004124:	01013403          	ld	s0,16(sp)
    80004128:	00813483          	ld	s1,8(sp)
    8000412c:	02010113          	addi	sp,sp,32
    80004130:	00008067          	ret

0000000080004134 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004134:	ff010113          	addi	sp,sp,-16
    80004138:	00113423          	sd	ra,8(sp)
    8000413c:	00813023          	sd	s0,0(sp)
    80004140:	01010413          	addi	s0,sp,16
    80004144:	00009797          	auipc	a5,0x9
    80004148:	83c78793          	addi	a5,a5,-1988 # 8000c980 <_ZTV7WorkerC+0x10>
    8000414c:	00f53023          	sd	a5,0(a0)
    80004150:	ffffe097          	auipc	ra,0xffffe
    80004154:	550080e7          	jalr	1360(ra) # 800026a0 <_ZN6ThreadD1Ev>
    80004158:	00813083          	ld	ra,8(sp)
    8000415c:	00013403          	ld	s0,0(sp)
    80004160:	01010113          	addi	sp,sp,16
    80004164:	00008067          	ret

0000000080004168 <_ZN7WorkerCD0Ev>:
    80004168:	fe010113          	addi	sp,sp,-32
    8000416c:	00113c23          	sd	ra,24(sp)
    80004170:	00813823          	sd	s0,16(sp)
    80004174:	00913423          	sd	s1,8(sp)
    80004178:	02010413          	addi	s0,sp,32
    8000417c:	00050493          	mv	s1,a0
    80004180:	00009797          	auipc	a5,0x9
    80004184:	80078793          	addi	a5,a5,-2048 # 8000c980 <_ZTV7WorkerC+0x10>
    80004188:	00f53023          	sd	a5,0(a0)
    8000418c:	ffffe097          	auipc	ra,0xffffe
    80004190:	514080e7          	jalr	1300(ra) # 800026a0 <_ZN6ThreadD1Ev>
    80004194:	00048513          	mv	a0,s1
    80004198:	ffffe097          	auipc	ra,0xffffe
    8000419c:	648080e7          	jalr	1608(ra) # 800027e0 <_ZdlPv>
    800041a0:	01813083          	ld	ra,24(sp)
    800041a4:	01013403          	ld	s0,16(sp)
    800041a8:	00813483          	ld	s1,8(sp)
    800041ac:	02010113          	addi	sp,sp,32
    800041b0:	00008067          	ret

00000000800041b4 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800041b4:	ff010113          	addi	sp,sp,-16
    800041b8:	00113423          	sd	ra,8(sp)
    800041bc:	00813023          	sd	s0,0(sp)
    800041c0:	01010413          	addi	s0,sp,16
    800041c4:	00008797          	auipc	a5,0x8
    800041c8:	7e478793          	addi	a5,a5,2020 # 8000c9a8 <_ZTV7WorkerD+0x10>
    800041cc:	00f53023          	sd	a5,0(a0)
    800041d0:	ffffe097          	auipc	ra,0xffffe
    800041d4:	4d0080e7          	jalr	1232(ra) # 800026a0 <_ZN6ThreadD1Ev>
    800041d8:	00813083          	ld	ra,8(sp)
    800041dc:	00013403          	ld	s0,0(sp)
    800041e0:	01010113          	addi	sp,sp,16
    800041e4:	00008067          	ret

00000000800041e8 <_ZN7WorkerDD0Ev>:
    800041e8:	fe010113          	addi	sp,sp,-32
    800041ec:	00113c23          	sd	ra,24(sp)
    800041f0:	00813823          	sd	s0,16(sp)
    800041f4:	00913423          	sd	s1,8(sp)
    800041f8:	02010413          	addi	s0,sp,32
    800041fc:	00050493          	mv	s1,a0
    80004200:	00008797          	auipc	a5,0x8
    80004204:	7a878793          	addi	a5,a5,1960 # 8000c9a8 <_ZTV7WorkerD+0x10>
    80004208:	00f53023          	sd	a5,0(a0)
    8000420c:	ffffe097          	auipc	ra,0xffffe
    80004210:	494080e7          	jalr	1172(ra) # 800026a0 <_ZN6ThreadD1Ev>
    80004214:	00048513          	mv	a0,s1
    80004218:	ffffe097          	auipc	ra,0xffffe
    8000421c:	5c8080e7          	jalr	1480(ra) # 800027e0 <_ZdlPv>
    80004220:	01813083          	ld	ra,24(sp)
    80004224:	01013403          	ld	s0,16(sp)
    80004228:	00813483          	ld	s1,8(sp)
    8000422c:	02010113          	addi	sp,sp,32
    80004230:	00008067          	ret

0000000080004234 <_ZN7WorkerA3runEv>:
    void run() override {
    80004234:	ff010113          	addi	sp,sp,-16
    80004238:	00113423          	sd	ra,8(sp)
    8000423c:	00813023          	sd	s0,0(sp)
    80004240:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004244:	00000593          	li	a1,0
    80004248:	fffff097          	auipc	ra,0xfffff
    8000424c:	774080e7          	jalr	1908(ra) # 800039bc <_ZN7WorkerA11workerBodyAEPv>
    }
    80004250:	00813083          	ld	ra,8(sp)
    80004254:	00013403          	ld	s0,0(sp)
    80004258:	01010113          	addi	sp,sp,16
    8000425c:	00008067          	ret

0000000080004260 <_ZN7WorkerB3runEv>:
    void run() override {
    80004260:	ff010113          	addi	sp,sp,-16
    80004264:	00113423          	sd	ra,8(sp)
    80004268:	00813023          	sd	s0,0(sp)
    8000426c:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004270:	00000593          	li	a1,0
    80004274:	00000097          	auipc	ra,0x0
    80004278:	814080e7          	jalr	-2028(ra) # 80003a88 <_ZN7WorkerB11workerBodyBEPv>
    }
    8000427c:	00813083          	ld	ra,8(sp)
    80004280:	00013403          	ld	s0,0(sp)
    80004284:	01010113          	addi	sp,sp,16
    80004288:	00008067          	ret

000000008000428c <_ZN7WorkerC3runEv>:
    void run() override {
    8000428c:	ff010113          	addi	sp,sp,-16
    80004290:	00113423          	sd	ra,8(sp)
    80004294:	00813023          	sd	s0,0(sp)
    80004298:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    8000429c:	00000593          	li	a1,0
    800042a0:	00000097          	auipc	ra,0x0
    800042a4:	8bc080e7          	jalr	-1860(ra) # 80003b5c <_ZN7WorkerC11workerBodyCEPv>
    }
    800042a8:	00813083          	ld	ra,8(sp)
    800042ac:	00013403          	ld	s0,0(sp)
    800042b0:	01010113          	addi	sp,sp,16
    800042b4:	00008067          	ret

00000000800042b8 <_ZN7WorkerD3runEv>:
    void run() override {
    800042b8:	ff010113          	addi	sp,sp,-16
    800042bc:	00113423          	sd	ra,8(sp)
    800042c0:	00813023          	sd	s0,0(sp)
    800042c4:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800042c8:	00000593          	li	a1,0
    800042cc:	00000097          	auipc	ra,0x0
    800042d0:	a10080e7          	jalr	-1520(ra) # 80003cdc <_ZN7WorkerD11workerBodyDEPv>
    }
    800042d4:	00813083          	ld	ra,8(sp)
    800042d8:	00013403          	ld	s0,0(sp)
    800042dc:	01010113          	addi	sp,sp,16
    800042e0:	00008067          	ret

00000000800042e4 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800042e4:	f8010113          	addi	sp,sp,-128
    800042e8:	06113c23          	sd	ra,120(sp)
    800042ec:	06813823          	sd	s0,112(sp)
    800042f0:	06913423          	sd	s1,104(sp)
    800042f4:	07213023          	sd	s2,96(sp)
    800042f8:	05313c23          	sd	s3,88(sp)
    800042fc:	05413823          	sd	s4,80(sp)
    80004300:	05513423          	sd	s5,72(sp)
    80004304:	05613023          	sd	s6,64(sp)
    80004308:	03713c23          	sd	s7,56(sp)
    8000430c:	03813823          	sd	s8,48(sp)
    80004310:	03913423          	sd	s9,40(sp)
    80004314:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004318:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    8000431c:	00006517          	auipc	a0,0x6
    80004320:	f1c50513          	addi	a0,a0,-228 # 8000a238 <_ZZ9kPrintIntmE6digits+0x1c8>
    80004324:	00001097          	auipc	ra,0x1
    80004328:	5a8080e7          	jalr	1448(ra) # 800058cc <_Z11printStringPKc>
    getString(input, 30);
    8000432c:	01e00593          	li	a1,30
    80004330:	f8040493          	addi	s1,s0,-128
    80004334:	00048513          	mv	a0,s1
    80004338:	00001097          	auipc	ra,0x1
    8000433c:	61c080e7          	jalr	1564(ra) # 80005954 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004340:	00048513          	mv	a0,s1
    80004344:	00001097          	auipc	ra,0x1
    80004348:	6e8080e7          	jalr	1768(ra) # 80005a2c <_Z11stringToIntPKc>
    8000434c:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004350:	00006517          	auipc	a0,0x6
    80004354:	f0850513          	addi	a0,a0,-248 # 8000a258 <_ZZ9kPrintIntmE6digits+0x1e8>
    80004358:	00001097          	auipc	ra,0x1
    8000435c:	574080e7          	jalr	1396(ra) # 800058cc <_Z11printStringPKc>
    getString(input, 30);
    80004360:	01e00593          	li	a1,30
    80004364:	00048513          	mv	a0,s1
    80004368:	00001097          	auipc	ra,0x1
    8000436c:	5ec080e7          	jalr	1516(ra) # 80005954 <_Z9getStringPci>
    n = stringToInt(input);
    80004370:	00048513          	mv	a0,s1
    80004374:	00001097          	auipc	ra,0x1
    80004378:	6b8080e7          	jalr	1720(ra) # 80005a2c <_Z11stringToIntPKc>
    8000437c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004380:	00006517          	auipc	a0,0x6
    80004384:	ef850513          	addi	a0,a0,-264 # 8000a278 <_ZZ9kPrintIntmE6digits+0x208>
    80004388:	00001097          	auipc	ra,0x1
    8000438c:	544080e7          	jalr	1348(ra) # 800058cc <_Z11printStringPKc>
    printInt(threadNum);
    80004390:	00000613          	li	a2,0
    80004394:	00a00593          	li	a1,10
    80004398:	00098513          	mv	a0,s3
    8000439c:	00001097          	auipc	ra,0x1
    800043a0:	6e0080e7          	jalr	1760(ra) # 80005a7c <_Z8printIntiii>
    printString(" i velicina bafera ");
    800043a4:	00006517          	auipc	a0,0x6
    800043a8:	eec50513          	addi	a0,a0,-276 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    800043ac:	00001097          	auipc	ra,0x1
    800043b0:	520080e7          	jalr	1312(ra) # 800058cc <_Z11printStringPKc>
    printInt(n);
    800043b4:	00000613          	li	a2,0
    800043b8:	00a00593          	li	a1,10
    800043bc:	00048513          	mv	a0,s1
    800043c0:	00001097          	auipc	ra,0x1
    800043c4:	6bc080e7          	jalr	1724(ra) # 80005a7c <_Z8printIntiii>
    printString(".\n");
    800043c8:	00006517          	auipc	a0,0x6
    800043cc:	ee050513          	addi	a0,a0,-288 # 8000a2a8 <_ZZ9kPrintIntmE6digits+0x238>
    800043d0:	00001097          	auipc	ra,0x1
    800043d4:	4fc080e7          	jalr	1276(ra) # 800058cc <_Z11printStringPKc>
    if (threadNum > n) {
    800043d8:	0334c463          	blt	s1,s3,80004400 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800043dc:	03305c63          	blez	s3,80004414 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800043e0:	03800513          	li	a0,56
    800043e4:	ffffe097          	auipc	ra,0xffffe
    800043e8:	3ac080e7          	jalr	940(ra) # 80002790 <_Znwm>
    800043ec:	00050a93          	mv	s5,a0
    800043f0:	00048593          	mv	a1,s1
    800043f4:	00001097          	auipc	ra,0x1
    800043f8:	7a8080e7          	jalr	1960(ra) # 80005b9c <_ZN9BufferCPPC1Ei>
    800043fc:	0300006f          	j	8000442c <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004400:	00006517          	auipc	a0,0x6
    80004404:	eb050513          	addi	a0,a0,-336 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    80004408:	00001097          	auipc	ra,0x1
    8000440c:	4c4080e7          	jalr	1220(ra) # 800058cc <_Z11printStringPKc>
        return;
    80004410:	0140006f          	j	80004424 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004414:	00006517          	auipc	a0,0x6
    80004418:	edc50513          	addi	a0,a0,-292 # 8000a2f0 <_ZZ9kPrintIntmE6digits+0x280>
    8000441c:	00001097          	auipc	ra,0x1
    80004420:	4b0080e7          	jalr	1200(ra) # 800058cc <_Z11printStringPKc>
        return;
    80004424:	000c0113          	mv	sp,s8
    80004428:	2140006f          	j	8000463c <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    8000442c:	01000513          	li	a0,16
    80004430:	ffffe097          	auipc	ra,0xffffe
    80004434:	360080e7          	jalr	864(ra) # 80002790 <_Znwm>
    80004438:	00050913          	mv	s2,a0
    8000443c:	00000593          	li	a1,0
    80004440:	ffffe097          	auipc	ra,0xffffe
    80004444:	66c080e7          	jalr	1644(ra) # 80002aac <_ZN9SemaphoreC1Ej>
    80004448:	00009797          	auipc	a5,0x9
    8000444c:	8727b823          	sd	s2,-1936(a5) # 8000ccb8 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004450:	00399793          	slli	a5,s3,0x3
    80004454:	00f78793          	addi	a5,a5,15
    80004458:	ff07f793          	andi	a5,a5,-16
    8000445c:	40f10133          	sub	sp,sp,a5
    80004460:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004464:	0019871b          	addiw	a4,s3,1
    80004468:	00171793          	slli	a5,a4,0x1
    8000446c:	00e787b3          	add	a5,a5,a4
    80004470:	00379793          	slli	a5,a5,0x3
    80004474:	00f78793          	addi	a5,a5,15
    80004478:	ff07f793          	andi	a5,a5,-16
    8000447c:	40f10133          	sub	sp,sp,a5
    80004480:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004484:	00199493          	slli	s1,s3,0x1
    80004488:	013484b3          	add	s1,s1,s3
    8000448c:	00349493          	slli	s1,s1,0x3
    80004490:	009b04b3          	add	s1,s6,s1
    80004494:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004498:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    8000449c:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800044a0:	02800513          	li	a0,40
    800044a4:	ffffe097          	auipc	ra,0xffffe
    800044a8:	2ec080e7          	jalr	748(ra) # 80002790 <_Znwm>
    800044ac:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    800044b0:	ffffe097          	auipc	ra,0xffffe
    800044b4:	580080e7          	jalr	1408(ra) # 80002a30 <_ZN6ThreadC1Ev>
    800044b8:	00008797          	auipc	a5,0x8
    800044bc:	56878793          	addi	a5,a5,1384 # 8000ca20 <_ZTV8Consumer+0x10>
    800044c0:	00fbb023          	sd	a5,0(s7)
    800044c4:	029bb023          	sd	s1,32(s7)
    consumer->start();
    800044c8:	000b8513          	mv	a0,s7
    800044cc:	ffffe097          	auipc	ra,0xffffe
    800044d0:	474080e7          	jalr	1140(ra) # 80002940 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800044d4:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800044d8:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800044dc:	00008797          	auipc	a5,0x8
    800044e0:	7dc7b783          	ld	a5,2012(a5) # 8000ccb8 <_ZL10waitForAll>
    800044e4:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800044e8:	02800513          	li	a0,40
    800044ec:	ffffe097          	auipc	ra,0xffffe
    800044f0:	2a4080e7          	jalr	676(ra) # 80002790 <_Znwm>
    800044f4:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800044f8:	ffffe097          	auipc	ra,0xffffe
    800044fc:	538080e7          	jalr	1336(ra) # 80002a30 <_ZN6ThreadC1Ev>
    80004500:	00008797          	auipc	a5,0x8
    80004504:	4d078793          	addi	a5,a5,1232 # 8000c9d0 <_ZTV16ProducerKeyborad+0x10>
    80004508:	00f4b023          	sd	a5,0(s1)
    8000450c:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004510:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004514:	00048513          	mv	a0,s1
    80004518:	ffffe097          	auipc	ra,0xffffe
    8000451c:	428080e7          	jalr	1064(ra) # 80002940 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004520:	00100913          	li	s2,1
    80004524:	0300006f          	j	80004554 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004528:	00008797          	auipc	a5,0x8
    8000452c:	4d078793          	addi	a5,a5,1232 # 8000c9f8 <_ZTV8Producer+0x10>
    80004530:	00fcb023          	sd	a5,0(s9)
    80004534:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004538:	00391793          	slli	a5,s2,0x3
    8000453c:	00fa07b3          	add	a5,s4,a5
    80004540:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004544:	000c8513          	mv	a0,s9
    80004548:	ffffe097          	auipc	ra,0xffffe
    8000454c:	3f8080e7          	jalr	1016(ra) # 80002940 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004550:	0019091b          	addiw	s2,s2,1
    80004554:	05395263          	bge	s2,s3,80004598 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004558:	00191493          	slli	s1,s2,0x1
    8000455c:	012484b3          	add	s1,s1,s2
    80004560:	00349493          	slli	s1,s1,0x3
    80004564:	009b04b3          	add	s1,s6,s1
    80004568:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    8000456c:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004570:	00008797          	auipc	a5,0x8
    80004574:	7487b783          	ld	a5,1864(a5) # 8000ccb8 <_ZL10waitForAll>
    80004578:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    8000457c:	02800513          	li	a0,40
    80004580:	ffffe097          	auipc	ra,0xffffe
    80004584:	210080e7          	jalr	528(ra) # 80002790 <_Znwm>
    80004588:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    8000458c:	ffffe097          	auipc	ra,0xffffe
    80004590:	4a4080e7          	jalr	1188(ra) # 80002a30 <_ZN6ThreadC1Ev>
    80004594:	f95ff06f          	j	80004528 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004598:	ffffe097          	auipc	ra,0xffffe
    8000459c:	40c080e7          	jalr	1036(ra) # 800029a4 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800045a0:	00000493          	li	s1,0
    800045a4:	0099ce63          	blt	s3,s1,800045c0 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    800045a8:	00008517          	auipc	a0,0x8
    800045ac:	71053503          	ld	a0,1808(a0) # 8000ccb8 <_ZL10waitForAll>
    800045b0:	ffffe097          	auipc	ra,0xffffe
    800045b4:	534080e7          	jalr	1332(ra) # 80002ae4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800045b8:	0014849b          	addiw	s1,s1,1
    800045bc:	fe9ff06f          	j	800045a4 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    800045c0:	00008517          	auipc	a0,0x8
    800045c4:	6f853503          	ld	a0,1784(a0) # 8000ccb8 <_ZL10waitForAll>
    800045c8:	00050863          	beqz	a0,800045d8 <_Z20testConsumerProducerv+0x2f4>
    800045cc:	00053783          	ld	a5,0(a0)
    800045d0:	0087b783          	ld	a5,8(a5)
    800045d4:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800045d8:	00000493          	li	s1,0
    800045dc:	0080006f          	j	800045e4 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800045e0:	0014849b          	addiw	s1,s1,1
    800045e4:	0334d263          	bge	s1,s3,80004608 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800045e8:	00349793          	slli	a5,s1,0x3
    800045ec:	00fa07b3          	add	a5,s4,a5
    800045f0:	0007b503          	ld	a0,0(a5)
    800045f4:	fe0506e3          	beqz	a0,800045e0 <_Z20testConsumerProducerv+0x2fc>
    800045f8:	00053783          	ld	a5,0(a0)
    800045fc:	0087b783          	ld	a5,8(a5)
    80004600:	000780e7          	jalr	a5
    80004604:	fddff06f          	j	800045e0 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004608:	000b8a63          	beqz	s7,8000461c <_Z20testConsumerProducerv+0x338>
    8000460c:	000bb783          	ld	a5,0(s7)
    80004610:	0087b783          	ld	a5,8(a5)
    80004614:	000b8513          	mv	a0,s7
    80004618:	000780e7          	jalr	a5
    delete buffer;
    8000461c:	000a8e63          	beqz	s5,80004638 <_Z20testConsumerProducerv+0x354>
    80004620:	000a8513          	mv	a0,s5
    80004624:	00002097          	auipc	ra,0x2
    80004628:	870080e7          	jalr	-1936(ra) # 80005e94 <_ZN9BufferCPPD1Ev>
    8000462c:	000a8513          	mv	a0,s5
    80004630:	ffffe097          	auipc	ra,0xffffe
    80004634:	1b0080e7          	jalr	432(ra) # 800027e0 <_ZdlPv>
    80004638:	000c0113          	mv	sp,s8
}
    8000463c:	f8040113          	addi	sp,s0,-128
    80004640:	07813083          	ld	ra,120(sp)
    80004644:	07013403          	ld	s0,112(sp)
    80004648:	06813483          	ld	s1,104(sp)
    8000464c:	06013903          	ld	s2,96(sp)
    80004650:	05813983          	ld	s3,88(sp)
    80004654:	05013a03          	ld	s4,80(sp)
    80004658:	04813a83          	ld	s5,72(sp)
    8000465c:	04013b03          	ld	s6,64(sp)
    80004660:	03813b83          	ld	s7,56(sp)
    80004664:	03013c03          	ld	s8,48(sp)
    80004668:	02813c83          	ld	s9,40(sp)
    8000466c:	08010113          	addi	sp,sp,128
    80004670:	00008067          	ret
    80004674:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004678:	000a8513          	mv	a0,s5
    8000467c:	ffffe097          	auipc	ra,0xffffe
    80004680:	164080e7          	jalr	356(ra) # 800027e0 <_ZdlPv>
    80004684:	00048513          	mv	a0,s1
    80004688:	00009097          	auipc	ra,0x9
    8000468c:	740080e7          	jalr	1856(ra) # 8000ddc8 <_Unwind_Resume>
    80004690:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004694:	00090513          	mv	a0,s2
    80004698:	ffffe097          	auipc	ra,0xffffe
    8000469c:	148080e7          	jalr	328(ra) # 800027e0 <_ZdlPv>
    800046a0:	00048513          	mv	a0,s1
    800046a4:	00009097          	auipc	ra,0x9
    800046a8:	724080e7          	jalr	1828(ra) # 8000ddc8 <_Unwind_Resume>
    800046ac:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800046b0:	000b8513          	mv	a0,s7
    800046b4:	ffffe097          	auipc	ra,0xffffe
    800046b8:	12c080e7          	jalr	300(ra) # 800027e0 <_ZdlPv>
    800046bc:	00048513          	mv	a0,s1
    800046c0:	00009097          	auipc	ra,0x9
    800046c4:	708080e7          	jalr	1800(ra) # 8000ddc8 <_Unwind_Resume>
    800046c8:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800046cc:	00048513          	mv	a0,s1
    800046d0:	ffffe097          	auipc	ra,0xffffe
    800046d4:	110080e7          	jalr	272(ra) # 800027e0 <_ZdlPv>
    800046d8:	00090513          	mv	a0,s2
    800046dc:	00009097          	auipc	ra,0x9
    800046e0:	6ec080e7          	jalr	1772(ra) # 8000ddc8 <_Unwind_Resume>
    800046e4:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800046e8:	000c8513          	mv	a0,s9
    800046ec:	ffffe097          	auipc	ra,0xffffe
    800046f0:	0f4080e7          	jalr	244(ra) # 800027e0 <_ZdlPv>
    800046f4:	00048513          	mv	a0,s1
    800046f8:	00009097          	auipc	ra,0x9
    800046fc:	6d0080e7          	jalr	1744(ra) # 8000ddc8 <_Unwind_Resume>

0000000080004700 <_ZN8Consumer3runEv>:
    void run() override {
    80004700:	fd010113          	addi	sp,sp,-48
    80004704:	02113423          	sd	ra,40(sp)
    80004708:	02813023          	sd	s0,32(sp)
    8000470c:	00913c23          	sd	s1,24(sp)
    80004710:	01213823          	sd	s2,16(sp)
    80004714:	01313423          	sd	s3,8(sp)
    80004718:	03010413          	addi	s0,sp,48
    8000471c:	00050913          	mv	s2,a0
        int i = 0;
    80004720:	00000993          	li	s3,0
    80004724:	0100006f          	j	80004734 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004728:	00a00513          	li	a0,10
    8000472c:	ffffe097          	auipc	ra,0xffffe
    80004730:	4a0080e7          	jalr	1184(ra) # 80002bcc <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004734:	00008797          	auipc	a5,0x8
    80004738:	57c7a783          	lw	a5,1404(a5) # 8000ccb0 <_ZL9threadEnd>
    8000473c:	04079a63          	bnez	a5,80004790 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004740:	02093783          	ld	a5,32(s2)
    80004744:	0087b503          	ld	a0,8(a5)
    80004748:	00001097          	auipc	ra,0x1
    8000474c:	638080e7          	jalr	1592(ra) # 80005d80 <_ZN9BufferCPP3getEv>
            i++;
    80004750:	0019849b          	addiw	s1,s3,1
    80004754:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004758:	0ff57513          	andi	a0,a0,255
    8000475c:	ffffe097          	auipc	ra,0xffffe
    80004760:	470080e7          	jalr	1136(ra) # 80002bcc <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004764:	05000793          	li	a5,80
    80004768:	02f4e4bb          	remw	s1,s1,a5
    8000476c:	fc0494e3          	bnez	s1,80004734 <_ZN8Consumer3runEv+0x34>
    80004770:	fb9ff06f          	j	80004728 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004774:	02093783          	ld	a5,32(s2)
    80004778:	0087b503          	ld	a0,8(a5)
    8000477c:	00001097          	auipc	ra,0x1
    80004780:	604080e7          	jalr	1540(ra) # 80005d80 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004784:	0ff57513          	andi	a0,a0,255
    80004788:	ffffe097          	auipc	ra,0xffffe
    8000478c:	444080e7          	jalr	1092(ra) # 80002bcc <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004790:	02093783          	ld	a5,32(s2)
    80004794:	0087b503          	ld	a0,8(a5)
    80004798:	00001097          	auipc	ra,0x1
    8000479c:	674080e7          	jalr	1652(ra) # 80005e0c <_ZN9BufferCPP6getCntEv>
    800047a0:	fca04ae3          	bgtz	a0,80004774 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    800047a4:	02093783          	ld	a5,32(s2)
    800047a8:	0107b503          	ld	a0,16(a5)
    800047ac:	ffffe097          	auipc	ra,0xffffe
    800047b0:	364080e7          	jalr	868(ra) # 80002b10 <_ZN9Semaphore6signalEv>
    }
    800047b4:	02813083          	ld	ra,40(sp)
    800047b8:	02013403          	ld	s0,32(sp)
    800047bc:	01813483          	ld	s1,24(sp)
    800047c0:	01013903          	ld	s2,16(sp)
    800047c4:	00813983          	ld	s3,8(sp)
    800047c8:	03010113          	addi	sp,sp,48
    800047cc:	00008067          	ret

00000000800047d0 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    800047d0:	ff010113          	addi	sp,sp,-16
    800047d4:	00113423          	sd	ra,8(sp)
    800047d8:	00813023          	sd	s0,0(sp)
    800047dc:	01010413          	addi	s0,sp,16
    800047e0:	00008797          	auipc	a5,0x8
    800047e4:	24078793          	addi	a5,a5,576 # 8000ca20 <_ZTV8Consumer+0x10>
    800047e8:	00f53023          	sd	a5,0(a0)
    800047ec:	ffffe097          	auipc	ra,0xffffe
    800047f0:	eb4080e7          	jalr	-332(ra) # 800026a0 <_ZN6ThreadD1Ev>
    800047f4:	00813083          	ld	ra,8(sp)
    800047f8:	00013403          	ld	s0,0(sp)
    800047fc:	01010113          	addi	sp,sp,16
    80004800:	00008067          	ret

0000000080004804 <_ZN8ConsumerD0Ev>:
    80004804:	fe010113          	addi	sp,sp,-32
    80004808:	00113c23          	sd	ra,24(sp)
    8000480c:	00813823          	sd	s0,16(sp)
    80004810:	00913423          	sd	s1,8(sp)
    80004814:	02010413          	addi	s0,sp,32
    80004818:	00050493          	mv	s1,a0
    8000481c:	00008797          	auipc	a5,0x8
    80004820:	20478793          	addi	a5,a5,516 # 8000ca20 <_ZTV8Consumer+0x10>
    80004824:	00f53023          	sd	a5,0(a0)
    80004828:	ffffe097          	auipc	ra,0xffffe
    8000482c:	e78080e7          	jalr	-392(ra) # 800026a0 <_ZN6ThreadD1Ev>
    80004830:	00048513          	mv	a0,s1
    80004834:	ffffe097          	auipc	ra,0xffffe
    80004838:	fac080e7          	jalr	-84(ra) # 800027e0 <_ZdlPv>
    8000483c:	01813083          	ld	ra,24(sp)
    80004840:	01013403          	ld	s0,16(sp)
    80004844:	00813483          	ld	s1,8(sp)
    80004848:	02010113          	addi	sp,sp,32
    8000484c:	00008067          	ret

0000000080004850 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004850:	ff010113          	addi	sp,sp,-16
    80004854:	00113423          	sd	ra,8(sp)
    80004858:	00813023          	sd	s0,0(sp)
    8000485c:	01010413          	addi	s0,sp,16
    80004860:	00008797          	auipc	a5,0x8
    80004864:	17078793          	addi	a5,a5,368 # 8000c9d0 <_ZTV16ProducerKeyborad+0x10>
    80004868:	00f53023          	sd	a5,0(a0)
    8000486c:	ffffe097          	auipc	ra,0xffffe
    80004870:	e34080e7          	jalr	-460(ra) # 800026a0 <_ZN6ThreadD1Ev>
    80004874:	00813083          	ld	ra,8(sp)
    80004878:	00013403          	ld	s0,0(sp)
    8000487c:	01010113          	addi	sp,sp,16
    80004880:	00008067          	ret

0000000080004884 <_ZN16ProducerKeyboradD0Ev>:
    80004884:	fe010113          	addi	sp,sp,-32
    80004888:	00113c23          	sd	ra,24(sp)
    8000488c:	00813823          	sd	s0,16(sp)
    80004890:	00913423          	sd	s1,8(sp)
    80004894:	02010413          	addi	s0,sp,32
    80004898:	00050493          	mv	s1,a0
    8000489c:	00008797          	auipc	a5,0x8
    800048a0:	13478793          	addi	a5,a5,308 # 8000c9d0 <_ZTV16ProducerKeyborad+0x10>
    800048a4:	00f53023          	sd	a5,0(a0)
    800048a8:	ffffe097          	auipc	ra,0xffffe
    800048ac:	df8080e7          	jalr	-520(ra) # 800026a0 <_ZN6ThreadD1Ev>
    800048b0:	00048513          	mv	a0,s1
    800048b4:	ffffe097          	auipc	ra,0xffffe
    800048b8:	f2c080e7          	jalr	-212(ra) # 800027e0 <_ZdlPv>
    800048bc:	01813083          	ld	ra,24(sp)
    800048c0:	01013403          	ld	s0,16(sp)
    800048c4:	00813483          	ld	s1,8(sp)
    800048c8:	02010113          	addi	sp,sp,32
    800048cc:	00008067          	ret

00000000800048d0 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    800048d0:	ff010113          	addi	sp,sp,-16
    800048d4:	00113423          	sd	ra,8(sp)
    800048d8:	00813023          	sd	s0,0(sp)
    800048dc:	01010413          	addi	s0,sp,16
    800048e0:	00008797          	auipc	a5,0x8
    800048e4:	11878793          	addi	a5,a5,280 # 8000c9f8 <_ZTV8Producer+0x10>
    800048e8:	00f53023          	sd	a5,0(a0)
    800048ec:	ffffe097          	auipc	ra,0xffffe
    800048f0:	db4080e7          	jalr	-588(ra) # 800026a0 <_ZN6ThreadD1Ev>
    800048f4:	00813083          	ld	ra,8(sp)
    800048f8:	00013403          	ld	s0,0(sp)
    800048fc:	01010113          	addi	sp,sp,16
    80004900:	00008067          	ret

0000000080004904 <_ZN8ProducerD0Ev>:
    80004904:	fe010113          	addi	sp,sp,-32
    80004908:	00113c23          	sd	ra,24(sp)
    8000490c:	00813823          	sd	s0,16(sp)
    80004910:	00913423          	sd	s1,8(sp)
    80004914:	02010413          	addi	s0,sp,32
    80004918:	00050493          	mv	s1,a0
    8000491c:	00008797          	auipc	a5,0x8
    80004920:	0dc78793          	addi	a5,a5,220 # 8000c9f8 <_ZTV8Producer+0x10>
    80004924:	00f53023          	sd	a5,0(a0)
    80004928:	ffffe097          	auipc	ra,0xffffe
    8000492c:	d78080e7          	jalr	-648(ra) # 800026a0 <_ZN6ThreadD1Ev>
    80004930:	00048513          	mv	a0,s1
    80004934:	ffffe097          	auipc	ra,0xffffe
    80004938:	eac080e7          	jalr	-340(ra) # 800027e0 <_ZdlPv>
    8000493c:	01813083          	ld	ra,24(sp)
    80004940:	01013403          	ld	s0,16(sp)
    80004944:	00813483          	ld	s1,8(sp)
    80004948:	02010113          	addi	sp,sp,32
    8000494c:	00008067          	ret

0000000080004950 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004950:	fe010113          	addi	sp,sp,-32
    80004954:	00113c23          	sd	ra,24(sp)
    80004958:	00813823          	sd	s0,16(sp)
    8000495c:	00913423          	sd	s1,8(sp)
    80004960:	02010413          	addi	s0,sp,32
    80004964:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004968:	ffffd097          	auipc	ra,0xffffd
    8000496c:	c04080e7          	jalr	-1020(ra) # 8000156c <_Z4getcv>
    80004970:	0005059b          	sext.w	a1,a0
    80004974:	01b00793          	li	a5,27
    80004978:	00f58c63          	beq	a1,a5,80004990 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    8000497c:	0204b783          	ld	a5,32(s1)
    80004980:	0087b503          	ld	a0,8(a5)
    80004984:	00001097          	auipc	ra,0x1
    80004988:	36c080e7          	jalr	876(ra) # 80005cf0 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    8000498c:	fddff06f          	j	80004968 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004990:	00100793          	li	a5,1
    80004994:	00008717          	auipc	a4,0x8
    80004998:	30f72e23          	sw	a5,796(a4) # 8000ccb0 <_ZL9threadEnd>
        td->buffer->put('!');
    8000499c:	0204b783          	ld	a5,32(s1)
    800049a0:	02100593          	li	a1,33
    800049a4:	0087b503          	ld	a0,8(a5)
    800049a8:	00001097          	auipc	ra,0x1
    800049ac:	348080e7          	jalr	840(ra) # 80005cf0 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    800049b0:	0204b783          	ld	a5,32(s1)
    800049b4:	0107b503          	ld	a0,16(a5)
    800049b8:	ffffe097          	auipc	ra,0xffffe
    800049bc:	158080e7          	jalr	344(ra) # 80002b10 <_ZN9Semaphore6signalEv>
    }
    800049c0:	01813083          	ld	ra,24(sp)
    800049c4:	01013403          	ld	s0,16(sp)
    800049c8:	00813483          	ld	s1,8(sp)
    800049cc:	02010113          	addi	sp,sp,32
    800049d0:	00008067          	ret

00000000800049d4 <_ZN8Producer3runEv>:
    void run() override {
    800049d4:	fe010113          	addi	sp,sp,-32
    800049d8:	00113c23          	sd	ra,24(sp)
    800049dc:	00813823          	sd	s0,16(sp)
    800049e0:	00913423          	sd	s1,8(sp)
    800049e4:	01213023          	sd	s2,0(sp)
    800049e8:	02010413          	addi	s0,sp,32
    800049ec:	00050493          	mv	s1,a0
        int i = 0;
    800049f0:	00000913          	li	s2,0
        while (!threadEnd) {
    800049f4:	00008797          	auipc	a5,0x8
    800049f8:	2bc7a783          	lw	a5,700(a5) # 8000ccb0 <_ZL9threadEnd>
    800049fc:	04079263          	bnez	a5,80004a40 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004a00:	0204b783          	ld	a5,32(s1)
    80004a04:	0007a583          	lw	a1,0(a5)
    80004a08:	0305859b          	addiw	a1,a1,48
    80004a0c:	0087b503          	ld	a0,8(a5)
    80004a10:	00001097          	auipc	ra,0x1
    80004a14:	2e0080e7          	jalr	736(ra) # 80005cf0 <_ZN9BufferCPP3putEi>
            i++;
    80004a18:	0019071b          	addiw	a4,s2,1
    80004a1c:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004a20:	0204b783          	ld	a5,32(s1)
    80004a24:	0007a783          	lw	a5,0(a5)
    80004a28:	00e787bb          	addw	a5,a5,a4
    80004a2c:	00500513          	li	a0,5
    80004a30:	02a7e53b          	remw	a0,a5,a0
    80004a34:	ffffe097          	auipc	ra,0xffffe
    80004a38:	f98080e7          	jalr	-104(ra) # 800029cc <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004a3c:	fb9ff06f          	j	800049f4 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004a40:	0204b783          	ld	a5,32(s1)
    80004a44:	0107b503          	ld	a0,16(a5)
    80004a48:	ffffe097          	auipc	ra,0xffffe
    80004a4c:	0c8080e7          	jalr	200(ra) # 80002b10 <_ZN9Semaphore6signalEv>
    }
    80004a50:	01813083          	ld	ra,24(sp)
    80004a54:	01013403          	ld	s0,16(sp)
    80004a58:	00813483          	ld	s1,8(sp)
    80004a5c:	00013903          	ld	s2,0(sp)
    80004a60:	02010113          	addi	sp,sp,32
    80004a64:	00008067          	ret

0000000080004a68 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004a68:	fe010113          	addi	sp,sp,-32
    80004a6c:	00113c23          	sd	ra,24(sp)
    80004a70:	00813823          	sd	s0,16(sp)
    80004a74:	00913423          	sd	s1,8(sp)
    80004a78:	01213023          	sd	s2,0(sp)
    80004a7c:	02010413          	addi	s0,sp,32
    80004a80:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004a84:	00100793          	li	a5,1
    80004a88:	02a7f863          	bgeu	a5,a0,80004ab8 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004a8c:	00a00793          	li	a5,10
    80004a90:	02f577b3          	remu	a5,a0,a5
    80004a94:	02078e63          	beqz	a5,80004ad0 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004a98:	fff48513          	addi	a0,s1,-1
    80004a9c:	00000097          	auipc	ra,0x0
    80004aa0:	fcc080e7          	jalr	-52(ra) # 80004a68 <_ZL9fibonaccim>
    80004aa4:	00050913          	mv	s2,a0
    80004aa8:	ffe48513          	addi	a0,s1,-2
    80004aac:	00000097          	auipc	ra,0x0
    80004ab0:	fbc080e7          	jalr	-68(ra) # 80004a68 <_ZL9fibonaccim>
    80004ab4:	00a90533          	add	a0,s2,a0
}
    80004ab8:	01813083          	ld	ra,24(sp)
    80004abc:	01013403          	ld	s0,16(sp)
    80004ac0:	00813483          	ld	s1,8(sp)
    80004ac4:	00013903          	ld	s2,0(sp)
    80004ac8:	02010113          	addi	sp,sp,32
    80004acc:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004ad0:	ffffd097          	auipc	ra,0xffffd
    80004ad4:	95c080e7          	jalr	-1700(ra) # 8000142c <_Z15thread_dispatchv>
    80004ad8:	fc1ff06f          	j	80004a98 <_ZL9fibonaccim+0x30>

0000000080004adc <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004adc:	fe010113          	addi	sp,sp,-32
    80004ae0:	00113c23          	sd	ra,24(sp)
    80004ae4:	00813823          	sd	s0,16(sp)
    80004ae8:	00913423          	sd	s1,8(sp)
    80004aec:	01213023          	sd	s2,0(sp)
    80004af0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004af4:	00a00493          	li	s1,10
    80004af8:	0400006f          	j	80004b38 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004afc:	00006517          	auipc	a0,0x6
    80004b00:	89450513          	addi	a0,a0,-1900 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80004b04:	00001097          	auipc	ra,0x1
    80004b08:	dc8080e7          	jalr	-568(ra) # 800058cc <_Z11printStringPKc>
    80004b0c:	00000613          	li	a2,0
    80004b10:	00a00593          	li	a1,10
    80004b14:	00048513          	mv	a0,s1
    80004b18:	00001097          	auipc	ra,0x1
    80004b1c:	f64080e7          	jalr	-156(ra) # 80005a7c <_Z8printIntiii>
    80004b20:	00006517          	auipc	a0,0x6
    80004b24:	a6050513          	addi	a0,a0,-1440 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004b28:	00001097          	auipc	ra,0x1
    80004b2c:	da4080e7          	jalr	-604(ra) # 800058cc <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004b30:	0014849b          	addiw	s1,s1,1
    80004b34:	0ff4f493          	andi	s1,s1,255
    80004b38:	00c00793          	li	a5,12
    80004b3c:	fc97f0e3          	bgeu	a5,s1,80004afc <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004b40:	00006517          	auipc	a0,0x6
    80004b44:	85850513          	addi	a0,a0,-1960 # 8000a398 <_ZZ9kPrintIntmE6digits+0x328>
    80004b48:	00001097          	auipc	ra,0x1
    80004b4c:	d84080e7          	jalr	-636(ra) # 800058cc <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004b50:	00500313          	li	t1,5
    thread_dispatch();
    80004b54:	ffffd097          	auipc	ra,0xffffd
    80004b58:	8d8080e7          	jalr	-1832(ra) # 8000142c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004b5c:	01000513          	li	a0,16
    80004b60:	00000097          	auipc	ra,0x0
    80004b64:	f08080e7          	jalr	-248(ra) # 80004a68 <_ZL9fibonaccim>
    80004b68:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004b6c:	00006517          	auipc	a0,0x6
    80004b70:	83c50513          	addi	a0,a0,-1988 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    80004b74:	00001097          	auipc	ra,0x1
    80004b78:	d58080e7          	jalr	-680(ra) # 800058cc <_Z11printStringPKc>
    80004b7c:	00000613          	li	a2,0
    80004b80:	00a00593          	li	a1,10
    80004b84:	0009051b          	sext.w	a0,s2
    80004b88:	00001097          	auipc	ra,0x1
    80004b8c:	ef4080e7          	jalr	-268(ra) # 80005a7c <_Z8printIntiii>
    80004b90:	00006517          	auipc	a0,0x6
    80004b94:	9f050513          	addi	a0,a0,-1552 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004b98:	00001097          	auipc	ra,0x1
    80004b9c:	d34080e7          	jalr	-716(ra) # 800058cc <_Z11printStringPKc>
    80004ba0:	0400006f          	j	80004be0 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004ba4:	00005517          	auipc	a0,0x5
    80004ba8:	7ec50513          	addi	a0,a0,2028 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80004bac:	00001097          	auipc	ra,0x1
    80004bb0:	d20080e7          	jalr	-736(ra) # 800058cc <_Z11printStringPKc>
    80004bb4:	00000613          	li	a2,0
    80004bb8:	00a00593          	li	a1,10
    80004bbc:	00048513          	mv	a0,s1
    80004bc0:	00001097          	auipc	ra,0x1
    80004bc4:	ebc080e7          	jalr	-324(ra) # 80005a7c <_Z8printIntiii>
    80004bc8:	00006517          	auipc	a0,0x6
    80004bcc:	9b850513          	addi	a0,a0,-1608 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004bd0:	00001097          	auipc	ra,0x1
    80004bd4:	cfc080e7          	jalr	-772(ra) # 800058cc <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004bd8:	0014849b          	addiw	s1,s1,1
    80004bdc:	0ff4f493          	andi	s1,s1,255
    80004be0:	00f00793          	li	a5,15
    80004be4:	fc97f0e3          	bgeu	a5,s1,80004ba4 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004be8:	00005517          	auipc	a0,0x5
    80004bec:	7d050513          	addi	a0,a0,2000 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    80004bf0:	00001097          	auipc	ra,0x1
    80004bf4:	cdc080e7          	jalr	-804(ra) # 800058cc <_Z11printStringPKc>
    finishedD = true;
    80004bf8:	00100793          	li	a5,1
    80004bfc:	00008717          	auipc	a4,0x8
    80004c00:	0cf70223          	sb	a5,196(a4) # 8000ccc0 <_ZL9finishedD>
    thread_dispatch();
    80004c04:	ffffd097          	auipc	ra,0xffffd
    80004c08:	828080e7          	jalr	-2008(ra) # 8000142c <_Z15thread_dispatchv>
}
    80004c0c:	01813083          	ld	ra,24(sp)
    80004c10:	01013403          	ld	s0,16(sp)
    80004c14:	00813483          	ld	s1,8(sp)
    80004c18:	00013903          	ld	s2,0(sp)
    80004c1c:	02010113          	addi	sp,sp,32
    80004c20:	00008067          	ret

0000000080004c24 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004c24:	fe010113          	addi	sp,sp,-32
    80004c28:	00113c23          	sd	ra,24(sp)
    80004c2c:	00813823          	sd	s0,16(sp)
    80004c30:	00913423          	sd	s1,8(sp)
    80004c34:	01213023          	sd	s2,0(sp)
    80004c38:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004c3c:	00000493          	li	s1,0
    80004c40:	0400006f          	j	80004c80 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004c44:	00005517          	auipc	a0,0x5
    80004c48:	70c50513          	addi	a0,a0,1804 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80004c4c:	00001097          	auipc	ra,0x1
    80004c50:	c80080e7          	jalr	-896(ra) # 800058cc <_Z11printStringPKc>
    80004c54:	00000613          	li	a2,0
    80004c58:	00a00593          	li	a1,10
    80004c5c:	00048513          	mv	a0,s1
    80004c60:	00001097          	auipc	ra,0x1
    80004c64:	e1c080e7          	jalr	-484(ra) # 80005a7c <_Z8printIntiii>
    80004c68:	00006517          	auipc	a0,0x6
    80004c6c:	91850513          	addi	a0,a0,-1768 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004c70:	00001097          	auipc	ra,0x1
    80004c74:	c5c080e7          	jalr	-932(ra) # 800058cc <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004c78:	0014849b          	addiw	s1,s1,1
    80004c7c:	0ff4f493          	andi	s1,s1,255
    80004c80:	00200793          	li	a5,2
    80004c84:	fc97f0e3          	bgeu	a5,s1,80004c44 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004c88:	00005517          	auipc	a0,0x5
    80004c8c:	6d050513          	addi	a0,a0,1744 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80004c90:	00001097          	auipc	ra,0x1
    80004c94:	c3c080e7          	jalr	-964(ra) # 800058cc <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004c98:	00700313          	li	t1,7
    thread_dispatch();
    80004c9c:	ffffc097          	auipc	ra,0xffffc
    80004ca0:	790080e7          	jalr	1936(ra) # 8000142c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004ca4:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004ca8:	00005517          	auipc	a0,0x5
    80004cac:	6c050513          	addi	a0,a0,1728 # 8000a368 <_ZZ9kPrintIntmE6digits+0x2f8>
    80004cb0:	00001097          	auipc	ra,0x1
    80004cb4:	c1c080e7          	jalr	-996(ra) # 800058cc <_Z11printStringPKc>
    80004cb8:	00000613          	li	a2,0
    80004cbc:	00a00593          	li	a1,10
    80004cc0:	0009051b          	sext.w	a0,s2
    80004cc4:	00001097          	auipc	ra,0x1
    80004cc8:	db8080e7          	jalr	-584(ra) # 80005a7c <_Z8printIntiii>
    80004ccc:	00006517          	auipc	a0,0x6
    80004cd0:	8b450513          	addi	a0,a0,-1868 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004cd4:	00001097          	auipc	ra,0x1
    80004cd8:	bf8080e7          	jalr	-1032(ra) # 800058cc <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004cdc:	00c00513          	li	a0,12
    80004ce0:	00000097          	auipc	ra,0x0
    80004ce4:	d88080e7          	jalr	-632(ra) # 80004a68 <_ZL9fibonaccim>
    80004ce8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004cec:	00005517          	auipc	a0,0x5
    80004cf0:	68450513          	addi	a0,a0,1668 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    80004cf4:	00001097          	auipc	ra,0x1
    80004cf8:	bd8080e7          	jalr	-1064(ra) # 800058cc <_Z11printStringPKc>
    80004cfc:	00000613          	li	a2,0
    80004d00:	00a00593          	li	a1,10
    80004d04:	0009051b          	sext.w	a0,s2
    80004d08:	00001097          	auipc	ra,0x1
    80004d0c:	d74080e7          	jalr	-652(ra) # 80005a7c <_Z8printIntiii>
    80004d10:	00006517          	auipc	a0,0x6
    80004d14:	87050513          	addi	a0,a0,-1936 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004d18:	00001097          	auipc	ra,0x1
    80004d1c:	bb4080e7          	jalr	-1100(ra) # 800058cc <_Z11printStringPKc>
    80004d20:	0400006f          	j	80004d60 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004d24:	00005517          	auipc	a0,0x5
    80004d28:	62c50513          	addi	a0,a0,1580 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    80004d2c:	00001097          	auipc	ra,0x1
    80004d30:	ba0080e7          	jalr	-1120(ra) # 800058cc <_Z11printStringPKc>
    80004d34:	00000613          	li	a2,0
    80004d38:	00a00593          	li	a1,10
    80004d3c:	00048513          	mv	a0,s1
    80004d40:	00001097          	auipc	ra,0x1
    80004d44:	d3c080e7          	jalr	-708(ra) # 80005a7c <_Z8printIntiii>
    80004d48:	00006517          	auipc	a0,0x6
    80004d4c:	83850513          	addi	a0,a0,-1992 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004d50:	00001097          	auipc	ra,0x1
    80004d54:	b7c080e7          	jalr	-1156(ra) # 800058cc <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004d58:	0014849b          	addiw	s1,s1,1
    80004d5c:	0ff4f493          	andi	s1,s1,255
    80004d60:	00500793          	li	a5,5
    80004d64:	fc97f0e3          	bgeu	a5,s1,80004d24 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80004d68:	00005517          	auipc	a0,0x5
    80004d6c:	61850513          	addi	a0,a0,1560 # 8000a380 <_ZZ9kPrintIntmE6digits+0x310>
    80004d70:	00001097          	auipc	ra,0x1
    80004d74:	b5c080e7          	jalr	-1188(ra) # 800058cc <_Z11printStringPKc>
    finishedC = true;
    80004d78:	00100793          	li	a5,1
    80004d7c:	00008717          	auipc	a4,0x8
    80004d80:	f4f702a3          	sb	a5,-187(a4) # 8000ccc1 <_ZL9finishedC>
    thread_dispatch();
    80004d84:	ffffc097          	auipc	ra,0xffffc
    80004d88:	6a8080e7          	jalr	1704(ra) # 8000142c <_Z15thread_dispatchv>
}
    80004d8c:	01813083          	ld	ra,24(sp)
    80004d90:	01013403          	ld	s0,16(sp)
    80004d94:	00813483          	ld	s1,8(sp)
    80004d98:	00013903          	ld	s2,0(sp)
    80004d9c:	02010113          	addi	sp,sp,32
    80004da0:	00008067          	ret

0000000080004da4 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004da4:	fe010113          	addi	sp,sp,-32
    80004da8:	00113c23          	sd	ra,24(sp)
    80004dac:	00813823          	sd	s0,16(sp)
    80004db0:	00913423          	sd	s1,8(sp)
    80004db4:	01213023          	sd	s2,0(sp)
    80004db8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004dbc:	00000913          	li	s2,0
    80004dc0:	0380006f          	j	80004df8 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004dc4:	ffffc097          	auipc	ra,0xffffc
    80004dc8:	668080e7          	jalr	1640(ra) # 8000142c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004dcc:	00148493          	addi	s1,s1,1
    80004dd0:	000027b7          	lui	a5,0x2
    80004dd4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004dd8:	0097ee63          	bltu	a5,s1,80004df4 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004ddc:	00000713          	li	a4,0
    80004de0:	000077b7          	lui	a5,0x7
    80004de4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004de8:	fce7eee3          	bltu	a5,a4,80004dc4 <_ZL11workerBodyBPv+0x20>
    80004dec:	00170713          	addi	a4,a4,1
    80004df0:	ff1ff06f          	j	80004de0 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004df4:	00190913          	addi	s2,s2,1
    80004df8:	00f00793          	li	a5,15
    80004dfc:	0527e063          	bltu	a5,s2,80004e3c <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004e00:	00005517          	auipc	a0,0x5
    80004e04:	53850513          	addi	a0,a0,1336 # 8000a338 <_ZZ9kPrintIntmE6digits+0x2c8>
    80004e08:	00001097          	auipc	ra,0x1
    80004e0c:	ac4080e7          	jalr	-1340(ra) # 800058cc <_Z11printStringPKc>
    80004e10:	00000613          	li	a2,0
    80004e14:	00a00593          	li	a1,10
    80004e18:	0009051b          	sext.w	a0,s2
    80004e1c:	00001097          	auipc	ra,0x1
    80004e20:	c60080e7          	jalr	-928(ra) # 80005a7c <_Z8printIntiii>
    80004e24:	00005517          	auipc	a0,0x5
    80004e28:	75c50513          	addi	a0,a0,1884 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004e2c:	00001097          	auipc	ra,0x1
    80004e30:	aa0080e7          	jalr	-1376(ra) # 800058cc <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004e34:	00000493          	li	s1,0
    80004e38:	f99ff06f          	j	80004dd0 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004e3c:	00005517          	auipc	a0,0x5
    80004e40:	50450513          	addi	a0,a0,1284 # 8000a340 <_ZZ9kPrintIntmE6digits+0x2d0>
    80004e44:	00001097          	auipc	ra,0x1
    80004e48:	a88080e7          	jalr	-1400(ra) # 800058cc <_Z11printStringPKc>
    finishedB = true;
    80004e4c:	00100793          	li	a5,1
    80004e50:	00008717          	auipc	a4,0x8
    80004e54:	e6f70923          	sb	a5,-398(a4) # 8000ccc2 <_ZL9finishedB>
    thread_dispatch();
    80004e58:	ffffc097          	auipc	ra,0xffffc
    80004e5c:	5d4080e7          	jalr	1492(ra) # 8000142c <_Z15thread_dispatchv>
}
    80004e60:	01813083          	ld	ra,24(sp)
    80004e64:	01013403          	ld	s0,16(sp)
    80004e68:	00813483          	ld	s1,8(sp)
    80004e6c:	00013903          	ld	s2,0(sp)
    80004e70:	02010113          	addi	sp,sp,32
    80004e74:	00008067          	ret

0000000080004e78 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004e78:	fe010113          	addi	sp,sp,-32
    80004e7c:	00113c23          	sd	ra,24(sp)
    80004e80:	00813823          	sd	s0,16(sp)
    80004e84:	00913423          	sd	s1,8(sp)
    80004e88:	01213023          	sd	s2,0(sp)
    80004e8c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004e90:	00000913          	li	s2,0
    80004e94:	0380006f          	j	80004ecc <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004e98:	ffffc097          	auipc	ra,0xffffc
    80004e9c:	594080e7          	jalr	1428(ra) # 8000142c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004ea0:	00148493          	addi	s1,s1,1
    80004ea4:	000027b7          	lui	a5,0x2
    80004ea8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004eac:	0097ee63          	bltu	a5,s1,80004ec8 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004eb0:	00000713          	li	a4,0
    80004eb4:	000077b7          	lui	a5,0x7
    80004eb8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004ebc:	fce7eee3          	bltu	a5,a4,80004e98 <_ZL11workerBodyAPv+0x20>
    80004ec0:	00170713          	addi	a4,a4,1
    80004ec4:	ff1ff06f          	j	80004eb4 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004ec8:	00190913          	addi	s2,s2,1
    80004ecc:	00900793          	li	a5,9
    80004ed0:	0527e063          	bltu	a5,s2,80004f10 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004ed4:	00005517          	auipc	a0,0x5
    80004ed8:	44c50513          	addi	a0,a0,1100 # 8000a320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80004edc:	00001097          	auipc	ra,0x1
    80004ee0:	9f0080e7          	jalr	-1552(ra) # 800058cc <_Z11printStringPKc>
    80004ee4:	00000613          	li	a2,0
    80004ee8:	00a00593          	li	a1,10
    80004eec:	0009051b          	sext.w	a0,s2
    80004ef0:	00001097          	auipc	ra,0x1
    80004ef4:	b8c080e7          	jalr	-1140(ra) # 80005a7c <_Z8printIntiii>
    80004ef8:	00005517          	auipc	a0,0x5
    80004efc:	68850513          	addi	a0,a0,1672 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80004f00:	00001097          	auipc	ra,0x1
    80004f04:	9cc080e7          	jalr	-1588(ra) # 800058cc <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004f08:	00000493          	li	s1,0
    80004f0c:	f99ff06f          	j	80004ea4 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80004f10:	00005517          	auipc	a0,0x5
    80004f14:	41850513          	addi	a0,a0,1048 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80004f18:	00001097          	auipc	ra,0x1
    80004f1c:	9b4080e7          	jalr	-1612(ra) # 800058cc <_Z11printStringPKc>
    finishedA = true;
    80004f20:	00100793          	li	a5,1
    80004f24:	00008717          	auipc	a4,0x8
    80004f28:	d8f70fa3          	sb	a5,-609(a4) # 8000ccc3 <_ZL9finishedA>
}
    80004f2c:	01813083          	ld	ra,24(sp)
    80004f30:	01013403          	ld	s0,16(sp)
    80004f34:	00813483          	ld	s1,8(sp)
    80004f38:	00013903          	ld	s2,0(sp)
    80004f3c:	02010113          	addi	sp,sp,32
    80004f40:	00008067          	ret

0000000080004f44 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004f44:	fd010113          	addi	sp,sp,-48
    80004f48:	02113423          	sd	ra,40(sp)
    80004f4c:	02813023          	sd	s0,32(sp)
    80004f50:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004f54:	00000613          	li	a2,0
    80004f58:	00000597          	auipc	a1,0x0
    80004f5c:	f2058593          	addi	a1,a1,-224 # 80004e78 <_ZL11workerBodyAPv>
    80004f60:	fd040513          	addi	a0,s0,-48
    80004f64:	ffffc097          	auipc	ra,0xffffc
    80004f68:	414080e7          	jalr	1044(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80004f6c:	00005517          	auipc	a0,0x5
    80004f70:	45c50513          	addi	a0,a0,1116 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80004f74:	00001097          	auipc	ra,0x1
    80004f78:	958080e7          	jalr	-1704(ra) # 800058cc <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80004f7c:	00000613          	li	a2,0
    80004f80:	00000597          	auipc	a1,0x0
    80004f84:	e2458593          	addi	a1,a1,-476 # 80004da4 <_ZL11workerBodyBPv>
    80004f88:	fd840513          	addi	a0,s0,-40
    80004f8c:	ffffc097          	auipc	ra,0xffffc
    80004f90:	3ec080e7          	jalr	1004(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80004f94:	00005517          	auipc	a0,0x5
    80004f98:	44c50513          	addi	a0,a0,1100 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80004f9c:	00001097          	auipc	ra,0x1
    80004fa0:	930080e7          	jalr	-1744(ra) # 800058cc <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004fa4:	00000613          	li	a2,0
    80004fa8:	00000597          	auipc	a1,0x0
    80004fac:	c7c58593          	addi	a1,a1,-900 # 80004c24 <_ZL11workerBodyCPv>
    80004fb0:	fe040513          	addi	a0,s0,-32
    80004fb4:	ffffc097          	auipc	ra,0xffffc
    80004fb8:	3c4080e7          	jalr	964(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80004fbc:	00005517          	auipc	a0,0x5
    80004fc0:	43c50513          	addi	a0,a0,1084 # 8000a3f8 <_ZZ9kPrintIntmE6digits+0x388>
    80004fc4:	00001097          	auipc	ra,0x1
    80004fc8:	908080e7          	jalr	-1784(ra) # 800058cc <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80004fcc:	00000613          	li	a2,0
    80004fd0:	00000597          	auipc	a1,0x0
    80004fd4:	b0c58593          	addi	a1,a1,-1268 # 80004adc <_ZL11workerBodyDPv>
    80004fd8:	fe840513          	addi	a0,s0,-24
    80004fdc:	ffffc097          	auipc	ra,0xffffc
    80004fe0:	39c080e7          	jalr	924(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80004fe4:	00005517          	auipc	a0,0x5
    80004fe8:	42c50513          	addi	a0,a0,1068 # 8000a410 <_ZZ9kPrintIntmE6digits+0x3a0>
    80004fec:	00001097          	auipc	ra,0x1
    80004ff0:	8e0080e7          	jalr	-1824(ra) # 800058cc <_Z11printStringPKc>
    80004ff4:	00c0006f          	j	80005000 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004ff8:	ffffc097          	auipc	ra,0xffffc
    80004ffc:	434080e7          	jalr	1076(ra) # 8000142c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005000:	00008797          	auipc	a5,0x8
    80005004:	cc37c783          	lbu	a5,-829(a5) # 8000ccc3 <_ZL9finishedA>
    80005008:	fe0788e3          	beqz	a5,80004ff8 <_Z18Threads_C_API_testv+0xb4>
    8000500c:	00008797          	auipc	a5,0x8
    80005010:	cb67c783          	lbu	a5,-842(a5) # 8000ccc2 <_ZL9finishedB>
    80005014:	fe0782e3          	beqz	a5,80004ff8 <_Z18Threads_C_API_testv+0xb4>
    80005018:	00008797          	auipc	a5,0x8
    8000501c:	ca97c783          	lbu	a5,-855(a5) # 8000ccc1 <_ZL9finishedC>
    80005020:	fc078ce3          	beqz	a5,80004ff8 <_Z18Threads_C_API_testv+0xb4>
    80005024:	00008797          	auipc	a5,0x8
    80005028:	c9c7c783          	lbu	a5,-868(a5) # 8000ccc0 <_ZL9finishedD>
    8000502c:	fc0786e3          	beqz	a5,80004ff8 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80005030:	02813083          	ld	ra,40(sp)
    80005034:	02013403          	ld	s0,32(sp)
    80005038:	03010113          	addi	sp,sp,48
    8000503c:	00008067          	ret

0000000080005040 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80005040:	fd010113          	addi	sp,sp,-48
    80005044:	02113423          	sd	ra,40(sp)
    80005048:	02813023          	sd	s0,32(sp)
    8000504c:	00913c23          	sd	s1,24(sp)
    80005050:	01213823          	sd	s2,16(sp)
    80005054:	01313423          	sd	s3,8(sp)
    80005058:	03010413          	addi	s0,sp,48
    8000505c:	00050993          	mv	s3,a0
    80005060:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005064:	00000913          	li	s2,0
    80005068:	00c0006f          	j	80005074 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    8000506c:	ffffe097          	auipc	ra,0xffffe
    80005070:	938080e7          	jalr	-1736(ra) # 800029a4 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005074:	ffffc097          	auipc	ra,0xffffc
    80005078:	4f8080e7          	jalr	1272(ra) # 8000156c <_Z4getcv>
    8000507c:	0005059b          	sext.w	a1,a0
    80005080:	01b00793          	li	a5,27
    80005084:	02f58a63          	beq	a1,a5,800050b8 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005088:	0084b503          	ld	a0,8(s1)
    8000508c:	00001097          	auipc	ra,0x1
    80005090:	c64080e7          	jalr	-924(ra) # 80005cf0 <_ZN9BufferCPP3putEi>
        i++;
    80005094:	0019071b          	addiw	a4,s2,1
    80005098:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000509c:	0004a683          	lw	a3,0(s1)
    800050a0:	0026979b          	slliw	a5,a3,0x2
    800050a4:	00d787bb          	addw	a5,a5,a3
    800050a8:	0017979b          	slliw	a5,a5,0x1
    800050ac:	02f767bb          	remw	a5,a4,a5
    800050b0:	fc0792e3          	bnez	a5,80005074 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800050b4:	fb9ff06f          	j	8000506c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800050b8:	00100793          	li	a5,1
    800050bc:	00008717          	auipc	a4,0x8
    800050c0:	c0f72623          	sw	a5,-1012(a4) # 8000ccc8 <_ZL9threadEnd>
    td->buffer->put('!');
    800050c4:	0209b783          	ld	a5,32(s3)
    800050c8:	02100593          	li	a1,33
    800050cc:	0087b503          	ld	a0,8(a5)
    800050d0:	00001097          	auipc	ra,0x1
    800050d4:	c20080e7          	jalr	-992(ra) # 80005cf0 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800050d8:	0104b503          	ld	a0,16(s1)
    800050dc:	ffffe097          	auipc	ra,0xffffe
    800050e0:	a34080e7          	jalr	-1484(ra) # 80002b10 <_ZN9Semaphore6signalEv>
}
    800050e4:	02813083          	ld	ra,40(sp)
    800050e8:	02013403          	ld	s0,32(sp)
    800050ec:	01813483          	ld	s1,24(sp)
    800050f0:	01013903          	ld	s2,16(sp)
    800050f4:	00813983          	ld	s3,8(sp)
    800050f8:	03010113          	addi	sp,sp,48
    800050fc:	00008067          	ret

0000000080005100 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80005100:	fe010113          	addi	sp,sp,-32
    80005104:	00113c23          	sd	ra,24(sp)
    80005108:	00813823          	sd	s0,16(sp)
    8000510c:	00913423          	sd	s1,8(sp)
    80005110:	01213023          	sd	s2,0(sp)
    80005114:	02010413          	addi	s0,sp,32
    80005118:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000511c:	00000913          	li	s2,0
    80005120:	00c0006f          	j	8000512c <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005124:	ffffe097          	auipc	ra,0xffffe
    80005128:	880080e7          	jalr	-1920(ra) # 800029a4 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    8000512c:	00008797          	auipc	a5,0x8
    80005130:	b9c7a783          	lw	a5,-1124(a5) # 8000ccc8 <_ZL9threadEnd>
    80005134:	02079e63          	bnez	a5,80005170 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005138:	0004a583          	lw	a1,0(s1)
    8000513c:	0305859b          	addiw	a1,a1,48
    80005140:	0084b503          	ld	a0,8(s1)
    80005144:	00001097          	auipc	ra,0x1
    80005148:	bac080e7          	jalr	-1108(ra) # 80005cf0 <_ZN9BufferCPP3putEi>
        i++;
    8000514c:	0019071b          	addiw	a4,s2,1
    80005150:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005154:	0004a683          	lw	a3,0(s1)
    80005158:	0026979b          	slliw	a5,a3,0x2
    8000515c:	00d787bb          	addw	a5,a5,a3
    80005160:	0017979b          	slliw	a5,a5,0x1
    80005164:	02f767bb          	remw	a5,a4,a5
    80005168:	fc0792e3          	bnez	a5,8000512c <_ZN12ProducerSync8producerEPv+0x2c>
    8000516c:	fb9ff06f          	j	80005124 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005170:	0104b503          	ld	a0,16(s1)
    80005174:	ffffe097          	auipc	ra,0xffffe
    80005178:	99c080e7          	jalr	-1636(ra) # 80002b10 <_ZN9Semaphore6signalEv>
}
    8000517c:	01813083          	ld	ra,24(sp)
    80005180:	01013403          	ld	s0,16(sp)
    80005184:	00813483          	ld	s1,8(sp)
    80005188:	00013903          	ld	s2,0(sp)
    8000518c:	02010113          	addi	sp,sp,32
    80005190:	00008067          	ret

0000000080005194 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005194:	fd010113          	addi	sp,sp,-48
    80005198:	02113423          	sd	ra,40(sp)
    8000519c:	02813023          	sd	s0,32(sp)
    800051a0:	00913c23          	sd	s1,24(sp)
    800051a4:	01213823          	sd	s2,16(sp)
    800051a8:	01313423          	sd	s3,8(sp)
    800051ac:	01413023          	sd	s4,0(sp)
    800051b0:	03010413          	addi	s0,sp,48
    800051b4:	00050993          	mv	s3,a0
    800051b8:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800051bc:	00000a13          	li	s4,0
    800051c0:	01c0006f          	j	800051dc <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800051c4:	ffffd097          	auipc	ra,0xffffd
    800051c8:	7e0080e7          	jalr	2016(ra) # 800029a4 <_ZN6Thread8dispatchEv>
    800051cc:	0500006f          	j	8000521c <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800051d0:	00a00513          	li	a0,10
    800051d4:	ffffc097          	auipc	ra,0xffffc
    800051d8:	3c0080e7          	jalr	960(ra) # 80001594 <_Z4putcc>
    while (!threadEnd) {
    800051dc:	00008797          	auipc	a5,0x8
    800051e0:	aec7a783          	lw	a5,-1300(a5) # 8000ccc8 <_ZL9threadEnd>
    800051e4:	06079263          	bnez	a5,80005248 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800051e8:	00893503          	ld	a0,8(s2)
    800051ec:	00001097          	auipc	ra,0x1
    800051f0:	b94080e7          	jalr	-1132(ra) # 80005d80 <_ZN9BufferCPP3getEv>
        i++;
    800051f4:	001a049b          	addiw	s1,s4,1
    800051f8:	00048a1b          	sext.w	s4,s1
        putc(key);
    800051fc:	0ff57513          	andi	a0,a0,255
    80005200:	ffffc097          	auipc	ra,0xffffc
    80005204:	394080e7          	jalr	916(ra) # 80001594 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005208:	00092703          	lw	a4,0(s2)
    8000520c:	0027179b          	slliw	a5,a4,0x2
    80005210:	00e787bb          	addw	a5,a5,a4
    80005214:	02f4e7bb          	remw	a5,s1,a5
    80005218:	fa0786e3          	beqz	a5,800051c4 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    8000521c:	05000793          	li	a5,80
    80005220:	02f4e4bb          	remw	s1,s1,a5
    80005224:	fa049ce3          	bnez	s1,800051dc <_ZN12ConsumerSync8consumerEPv+0x48>
    80005228:	fa9ff06f          	j	800051d0 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    8000522c:	0209b783          	ld	a5,32(s3)
    80005230:	0087b503          	ld	a0,8(a5)
    80005234:	00001097          	auipc	ra,0x1
    80005238:	b4c080e7          	jalr	-1204(ra) # 80005d80 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    8000523c:	0ff57513          	andi	a0,a0,255
    80005240:	ffffe097          	auipc	ra,0xffffe
    80005244:	98c080e7          	jalr	-1652(ra) # 80002bcc <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005248:	0209b783          	ld	a5,32(s3)
    8000524c:	0087b503          	ld	a0,8(a5)
    80005250:	00001097          	auipc	ra,0x1
    80005254:	bbc080e7          	jalr	-1092(ra) # 80005e0c <_ZN9BufferCPP6getCntEv>
    80005258:	fca04ae3          	bgtz	a0,8000522c <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    8000525c:	01093503          	ld	a0,16(s2)
    80005260:	ffffe097          	auipc	ra,0xffffe
    80005264:	8b0080e7          	jalr	-1872(ra) # 80002b10 <_ZN9Semaphore6signalEv>
}
    80005268:	02813083          	ld	ra,40(sp)
    8000526c:	02013403          	ld	s0,32(sp)
    80005270:	01813483          	ld	s1,24(sp)
    80005274:	01013903          	ld	s2,16(sp)
    80005278:	00813983          	ld	s3,8(sp)
    8000527c:	00013a03          	ld	s4,0(sp)
    80005280:	03010113          	addi	sp,sp,48
    80005284:	00008067          	ret

0000000080005288 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005288:	f8010113          	addi	sp,sp,-128
    8000528c:	06113c23          	sd	ra,120(sp)
    80005290:	06813823          	sd	s0,112(sp)
    80005294:	06913423          	sd	s1,104(sp)
    80005298:	07213023          	sd	s2,96(sp)
    8000529c:	05313c23          	sd	s3,88(sp)
    800052a0:	05413823          	sd	s4,80(sp)
    800052a4:	05513423          	sd	s5,72(sp)
    800052a8:	05613023          	sd	s6,64(sp)
    800052ac:	03713c23          	sd	s7,56(sp)
    800052b0:	03813823          	sd	s8,48(sp)
    800052b4:	03913423          	sd	s9,40(sp)
    800052b8:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800052bc:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800052c0:	00005517          	auipc	a0,0x5
    800052c4:	f7850513          	addi	a0,a0,-136 # 8000a238 <_ZZ9kPrintIntmE6digits+0x1c8>
    800052c8:	00000097          	auipc	ra,0x0
    800052cc:	604080e7          	jalr	1540(ra) # 800058cc <_Z11printStringPKc>
    getString(input, 30);
    800052d0:	01e00593          	li	a1,30
    800052d4:	f8040493          	addi	s1,s0,-128
    800052d8:	00048513          	mv	a0,s1
    800052dc:	00000097          	auipc	ra,0x0
    800052e0:	678080e7          	jalr	1656(ra) # 80005954 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800052e4:	00048513          	mv	a0,s1
    800052e8:	00000097          	auipc	ra,0x0
    800052ec:	744080e7          	jalr	1860(ra) # 80005a2c <_Z11stringToIntPKc>
    800052f0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800052f4:	00005517          	auipc	a0,0x5
    800052f8:	f6450513          	addi	a0,a0,-156 # 8000a258 <_ZZ9kPrintIntmE6digits+0x1e8>
    800052fc:	00000097          	auipc	ra,0x0
    80005300:	5d0080e7          	jalr	1488(ra) # 800058cc <_Z11printStringPKc>
    getString(input, 30);
    80005304:	01e00593          	li	a1,30
    80005308:	00048513          	mv	a0,s1
    8000530c:	00000097          	auipc	ra,0x0
    80005310:	648080e7          	jalr	1608(ra) # 80005954 <_Z9getStringPci>
    n = stringToInt(input);
    80005314:	00048513          	mv	a0,s1
    80005318:	00000097          	auipc	ra,0x0
    8000531c:	714080e7          	jalr	1812(ra) # 80005a2c <_Z11stringToIntPKc>
    80005320:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005324:	00005517          	auipc	a0,0x5
    80005328:	f5450513          	addi	a0,a0,-172 # 8000a278 <_ZZ9kPrintIntmE6digits+0x208>
    8000532c:	00000097          	auipc	ra,0x0
    80005330:	5a0080e7          	jalr	1440(ra) # 800058cc <_Z11printStringPKc>
    80005334:	00000613          	li	a2,0
    80005338:	00a00593          	li	a1,10
    8000533c:	00090513          	mv	a0,s2
    80005340:	00000097          	auipc	ra,0x0
    80005344:	73c080e7          	jalr	1852(ra) # 80005a7c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005348:	00005517          	auipc	a0,0x5
    8000534c:	f4850513          	addi	a0,a0,-184 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    80005350:	00000097          	auipc	ra,0x0
    80005354:	57c080e7          	jalr	1404(ra) # 800058cc <_Z11printStringPKc>
    80005358:	00000613          	li	a2,0
    8000535c:	00a00593          	li	a1,10
    80005360:	00048513          	mv	a0,s1
    80005364:	00000097          	auipc	ra,0x0
    80005368:	718080e7          	jalr	1816(ra) # 80005a7c <_Z8printIntiii>
    printString(".\n");
    8000536c:	00005517          	auipc	a0,0x5
    80005370:	f3c50513          	addi	a0,a0,-196 # 8000a2a8 <_ZZ9kPrintIntmE6digits+0x238>
    80005374:	00000097          	auipc	ra,0x0
    80005378:	558080e7          	jalr	1368(ra) # 800058cc <_Z11printStringPKc>
    if(threadNum > n) {
    8000537c:	0324c463          	blt	s1,s2,800053a4 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005380:	03205c63          	blez	s2,800053b8 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005384:	03800513          	li	a0,56
    80005388:	ffffd097          	auipc	ra,0xffffd
    8000538c:	408080e7          	jalr	1032(ra) # 80002790 <_Znwm>
    80005390:	00050a93          	mv	s5,a0
    80005394:	00048593          	mv	a1,s1
    80005398:	00001097          	auipc	ra,0x1
    8000539c:	804080e7          	jalr	-2044(ra) # 80005b9c <_ZN9BufferCPPC1Ei>
    800053a0:	0300006f          	j	800053d0 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800053a4:	00005517          	auipc	a0,0x5
    800053a8:	f0c50513          	addi	a0,a0,-244 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    800053ac:	00000097          	auipc	ra,0x0
    800053b0:	520080e7          	jalr	1312(ra) # 800058cc <_Z11printStringPKc>
        return;
    800053b4:	0140006f          	j	800053c8 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800053b8:	00005517          	auipc	a0,0x5
    800053bc:	f3850513          	addi	a0,a0,-200 # 8000a2f0 <_ZZ9kPrintIntmE6digits+0x280>
    800053c0:	00000097          	auipc	ra,0x0
    800053c4:	50c080e7          	jalr	1292(ra) # 800058cc <_Z11printStringPKc>
        return;
    800053c8:	000b8113          	mv	sp,s7
    800053cc:	2380006f          	j	80005604 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800053d0:	01000513          	li	a0,16
    800053d4:	ffffd097          	auipc	ra,0xffffd
    800053d8:	3bc080e7          	jalr	956(ra) # 80002790 <_Znwm>
    800053dc:	00050493          	mv	s1,a0
    800053e0:	00000593          	li	a1,0
    800053e4:	ffffd097          	auipc	ra,0xffffd
    800053e8:	6c8080e7          	jalr	1736(ra) # 80002aac <_ZN9SemaphoreC1Ej>
    800053ec:	00008797          	auipc	a5,0x8
    800053f0:	8e97b223          	sd	s1,-1820(a5) # 8000ccd0 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800053f4:	00391793          	slli	a5,s2,0x3
    800053f8:	00f78793          	addi	a5,a5,15
    800053fc:	ff07f793          	andi	a5,a5,-16
    80005400:	40f10133          	sub	sp,sp,a5
    80005404:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005408:	0019071b          	addiw	a4,s2,1
    8000540c:	00171793          	slli	a5,a4,0x1
    80005410:	00e787b3          	add	a5,a5,a4
    80005414:	00379793          	slli	a5,a5,0x3
    80005418:	00f78793          	addi	a5,a5,15
    8000541c:	ff07f793          	andi	a5,a5,-16
    80005420:	40f10133          	sub	sp,sp,a5
    80005424:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005428:	00191c13          	slli	s8,s2,0x1
    8000542c:	012c07b3          	add	a5,s8,s2
    80005430:	00379793          	slli	a5,a5,0x3
    80005434:	00fa07b3          	add	a5,s4,a5
    80005438:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    8000543c:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005440:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005444:	02800513          	li	a0,40
    80005448:	ffffd097          	auipc	ra,0xffffd
    8000544c:	348080e7          	jalr	840(ra) # 80002790 <_Znwm>
    80005450:	00050b13          	mv	s6,a0
    80005454:	012c0c33          	add	s8,s8,s2
    80005458:	003c1c13          	slli	s8,s8,0x3
    8000545c:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005460:	ffffd097          	auipc	ra,0xffffd
    80005464:	5d0080e7          	jalr	1488(ra) # 80002a30 <_ZN6ThreadC1Ev>
    80005468:	00007797          	auipc	a5,0x7
    8000546c:	63078793          	addi	a5,a5,1584 # 8000ca98 <_ZTV12ConsumerSync+0x10>
    80005470:	00fb3023          	sd	a5,0(s6)
    80005474:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005478:	000b0513          	mv	a0,s6
    8000547c:	ffffd097          	auipc	ra,0xffffd
    80005480:	4c4080e7          	jalr	1220(ra) # 80002940 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005484:	00000493          	li	s1,0
    80005488:	0380006f          	j	800054c0 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    8000548c:	00007797          	auipc	a5,0x7
    80005490:	5e478793          	addi	a5,a5,1508 # 8000ca70 <_ZTV12ProducerSync+0x10>
    80005494:	00fcb023          	sd	a5,0(s9)
    80005498:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    8000549c:	00349793          	slli	a5,s1,0x3
    800054a0:	00f987b3          	add	a5,s3,a5
    800054a4:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800054a8:	00349793          	slli	a5,s1,0x3
    800054ac:	00f987b3          	add	a5,s3,a5
    800054b0:	0007b503          	ld	a0,0(a5)
    800054b4:	ffffd097          	auipc	ra,0xffffd
    800054b8:	48c080e7          	jalr	1164(ra) # 80002940 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800054bc:	0014849b          	addiw	s1,s1,1
    800054c0:	0b24d063          	bge	s1,s2,80005560 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800054c4:	00149793          	slli	a5,s1,0x1
    800054c8:	009787b3          	add	a5,a5,s1
    800054cc:	00379793          	slli	a5,a5,0x3
    800054d0:	00fa07b3          	add	a5,s4,a5
    800054d4:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800054d8:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800054dc:	00007717          	auipc	a4,0x7
    800054e0:	7f473703          	ld	a4,2036(a4) # 8000ccd0 <_ZL10waitForAll>
    800054e4:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800054e8:	02905863          	blez	s1,80005518 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800054ec:	02800513          	li	a0,40
    800054f0:	ffffd097          	auipc	ra,0xffffd
    800054f4:	2a0080e7          	jalr	672(ra) # 80002790 <_Znwm>
    800054f8:	00050c93          	mv	s9,a0
    800054fc:	00149c13          	slli	s8,s1,0x1
    80005500:	009c0c33          	add	s8,s8,s1
    80005504:	003c1c13          	slli	s8,s8,0x3
    80005508:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    8000550c:	ffffd097          	auipc	ra,0xffffd
    80005510:	524080e7          	jalr	1316(ra) # 80002a30 <_ZN6ThreadC1Ev>
    80005514:	f79ff06f          	j	8000548c <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005518:	02800513          	li	a0,40
    8000551c:	ffffd097          	auipc	ra,0xffffd
    80005520:	274080e7          	jalr	628(ra) # 80002790 <_Znwm>
    80005524:	00050c93          	mv	s9,a0
    80005528:	00149c13          	slli	s8,s1,0x1
    8000552c:	009c0c33          	add	s8,s8,s1
    80005530:	003c1c13          	slli	s8,s8,0x3
    80005534:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005538:	ffffd097          	auipc	ra,0xffffd
    8000553c:	4f8080e7          	jalr	1272(ra) # 80002a30 <_ZN6ThreadC1Ev>
    80005540:	00007797          	auipc	a5,0x7
    80005544:	50878793          	addi	a5,a5,1288 # 8000ca48 <_ZTV16ProducerKeyboard+0x10>
    80005548:	00fcb023          	sd	a5,0(s9)
    8000554c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005550:	00349793          	slli	a5,s1,0x3
    80005554:	00f987b3          	add	a5,s3,a5
    80005558:	0197b023          	sd	s9,0(a5)
    8000555c:	f4dff06f          	j	800054a8 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005560:	ffffd097          	auipc	ra,0xffffd
    80005564:	444080e7          	jalr	1092(ra) # 800029a4 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005568:	00000493          	li	s1,0
    8000556c:	00994e63          	blt	s2,s1,80005588 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005570:	00007517          	auipc	a0,0x7
    80005574:	76053503          	ld	a0,1888(a0) # 8000ccd0 <_ZL10waitForAll>
    80005578:	ffffd097          	auipc	ra,0xffffd
    8000557c:	56c080e7          	jalr	1388(ra) # 80002ae4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005580:	0014849b          	addiw	s1,s1,1
    80005584:	fe9ff06f          	j	8000556c <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005588:	00000493          	li	s1,0
    8000558c:	0080006f          	j	80005594 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005590:	0014849b          	addiw	s1,s1,1
    80005594:	0324d263          	bge	s1,s2,800055b8 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005598:	00349793          	slli	a5,s1,0x3
    8000559c:	00f987b3          	add	a5,s3,a5
    800055a0:	0007b503          	ld	a0,0(a5)
    800055a4:	fe0506e3          	beqz	a0,80005590 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800055a8:	00053783          	ld	a5,0(a0)
    800055ac:	0087b783          	ld	a5,8(a5)
    800055b0:	000780e7          	jalr	a5
    800055b4:	fddff06f          	j	80005590 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800055b8:	000b0a63          	beqz	s6,800055cc <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800055bc:	000b3783          	ld	a5,0(s6)
    800055c0:	0087b783          	ld	a5,8(a5)
    800055c4:	000b0513          	mv	a0,s6
    800055c8:	000780e7          	jalr	a5
    delete waitForAll;
    800055cc:	00007517          	auipc	a0,0x7
    800055d0:	70453503          	ld	a0,1796(a0) # 8000ccd0 <_ZL10waitForAll>
    800055d4:	00050863          	beqz	a0,800055e4 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800055d8:	00053783          	ld	a5,0(a0)
    800055dc:	0087b783          	ld	a5,8(a5)
    800055e0:	000780e7          	jalr	a5
    delete buffer;
    800055e4:	000a8e63          	beqz	s5,80005600 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800055e8:	000a8513          	mv	a0,s5
    800055ec:	00001097          	auipc	ra,0x1
    800055f0:	8a8080e7          	jalr	-1880(ra) # 80005e94 <_ZN9BufferCPPD1Ev>
    800055f4:	000a8513          	mv	a0,s5
    800055f8:	ffffd097          	auipc	ra,0xffffd
    800055fc:	1e8080e7          	jalr	488(ra) # 800027e0 <_ZdlPv>
    80005600:	000b8113          	mv	sp,s7

}
    80005604:	f8040113          	addi	sp,s0,-128
    80005608:	07813083          	ld	ra,120(sp)
    8000560c:	07013403          	ld	s0,112(sp)
    80005610:	06813483          	ld	s1,104(sp)
    80005614:	06013903          	ld	s2,96(sp)
    80005618:	05813983          	ld	s3,88(sp)
    8000561c:	05013a03          	ld	s4,80(sp)
    80005620:	04813a83          	ld	s5,72(sp)
    80005624:	04013b03          	ld	s6,64(sp)
    80005628:	03813b83          	ld	s7,56(sp)
    8000562c:	03013c03          	ld	s8,48(sp)
    80005630:	02813c83          	ld	s9,40(sp)
    80005634:	08010113          	addi	sp,sp,128
    80005638:	00008067          	ret
    8000563c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005640:	000a8513          	mv	a0,s5
    80005644:	ffffd097          	auipc	ra,0xffffd
    80005648:	19c080e7          	jalr	412(ra) # 800027e0 <_ZdlPv>
    8000564c:	00048513          	mv	a0,s1
    80005650:	00008097          	auipc	ra,0x8
    80005654:	778080e7          	jalr	1912(ra) # 8000ddc8 <_Unwind_Resume>
    80005658:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    8000565c:	00048513          	mv	a0,s1
    80005660:	ffffd097          	auipc	ra,0xffffd
    80005664:	180080e7          	jalr	384(ra) # 800027e0 <_ZdlPv>
    80005668:	00090513          	mv	a0,s2
    8000566c:	00008097          	auipc	ra,0x8
    80005670:	75c080e7          	jalr	1884(ra) # 8000ddc8 <_Unwind_Resume>
    80005674:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005678:	000b0513          	mv	a0,s6
    8000567c:	ffffd097          	auipc	ra,0xffffd
    80005680:	164080e7          	jalr	356(ra) # 800027e0 <_ZdlPv>
    80005684:	00048513          	mv	a0,s1
    80005688:	00008097          	auipc	ra,0x8
    8000568c:	740080e7          	jalr	1856(ra) # 8000ddc8 <_Unwind_Resume>
    80005690:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005694:	000c8513          	mv	a0,s9
    80005698:	ffffd097          	auipc	ra,0xffffd
    8000569c:	148080e7          	jalr	328(ra) # 800027e0 <_ZdlPv>
    800056a0:	00048513          	mv	a0,s1
    800056a4:	00008097          	auipc	ra,0x8
    800056a8:	724080e7          	jalr	1828(ra) # 8000ddc8 <_Unwind_Resume>
    800056ac:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800056b0:	000c8513          	mv	a0,s9
    800056b4:	ffffd097          	auipc	ra,0xffffd
    800056b8:	12c080e7          	jalr	300(ra) # 800027e0 <_ZdlPv>
    800056bc:	00048513          	mv	a0,s1
    800056c0:	00008097          	auipc	ra,0x8
    800056c4:	708080e7          	jalr	1800(ra) # 8000ddc8 <_Unwind_Resume>

00000000800056c8 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800056c8:	ff010113          	addi	sp,sp,-16
    800056cc:	00113423          	sd	ra,8(sp)
    800056d0:	00813023          	sd	s0,0(sp)
    800056d4:	01010413          	addi	s0,sp,16
    800056d8:	00007797          	auipc	a5,0x7
    800056dc:	3c078793          	addi	a5,a5,960 # 8000ca98 <_ZTV12ConsumerSync+0x10>
    800056e0:	00f53023          	sd	a5,0(a0)
    800056e4:	ffffd097          	auipc	ra,0xffffd
    800056e8:	fbc080e7          	jalr	-68(ra) # 800026a0 <_ZN6ThreadD1Ev>
    800056ec:	00813083          	ld	ra,8(sp)
    800056f0:	00013403          	ld	s0,0(sp)
    800056f4:	01010113          	addi	sp,sp,16
    800056f8:	00008067          	ret

00000000800056fc <_ZN12ConsumerSyncD0Ev>:
    800056fc:	fe010113          	addi	sp,sp,-32
    80005700:	00113c23          	sd	ra,24(sp)
    80005704:	00813823          	sd	s0,16(sp)
    80005708:	00913423          	sd	s1,8(sp)
    8000570c:	02010413          	addi	s0,sp,32
    80005710:	00050493          	mv	s1,a0
    80005714:	00007797          	auipc	a5,0x7
    80005718:	38478793          	addi	a5,a5,900 # 8000ca98 <_ZTV12ConsumerSync+0x10>
    8000571c:	00f53023          	sd	a5,0(a0)
    80005720:	ffffd097          	auipc	ra,0xffffd
    80005724:	f80080e7          	jalr	-128(ra) # 800026a0 <_ZN6ThreadD1Ev>
    80005728:	00048513          	mv	a0,s1
    8000572c:	ffffd097          	auipc	ra,0xffffd
    80005730:	0b4080e7          	jalr	180(ra) # 800027e0 <_ZdlPv>
    80005734:	01813083          	ld	ra,24(sp)
    80005738:	01013403          	ld	s0,16(sp)
    8000573c:	00813483          	ld	s1,8(sp)
    80005740:	02010113          	addi	sp,sp,32
    80005744:	00008067          	ret

0000000080005748 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005748:	ff010113          	addi	sp,sp,-16
    8000574c:	00113423          	sd	ra,8(sp)
    80005750:	00813023          	sd	s0,0(sp)
    80005754:	01010413          	addi	s0,sp,16
    80005758:	00007797          	auipc	a5,0x7
    8000575c:	31878793          	addi	a5,a5,792 # 8000ca70 <_ZTV12ProducerSync+0x10>
    80005760:	00f53023          	sd	a5,0(a0)
    80005764:	ffffd097          	auipc	ra,0xffffd
    80005768:	f3c080e7          	jalr	-196(ra) # 800026a0 <_ZN6ThreadD1Ev>
    8000576c:	00813083          	ld	ra,8(sp)
    80005770:	00013403          	ld	s0,0(sp)
    80005774:	01010113          	addi	sp,sp,16
    80005778:	00008067          	ret

000000008000577c <_ZN12ProducerSyncD0Ev>:
    8000577c:	fe010113          	addi	sp,sp,-32
    80005780:	00113c23          	sd	ra,24(sp)
    80005784:	00813823          	sd	s0,16(sp)
    80005788:	00913423          	sd	s1,8(sp)
    8000578c:	02010413          	addi	s0,sp,32
    80005790:	00050493          	mv	s1,a0
    80005794:	00007797          	auipc	a5,0x7
    80005798:	2dc78793          	addi	a5,a5,732 # 8000ca70 <_ZTV12ProducerSync+0x10>
    8000579c:	00f53023          	sd	a5,0(a0)
    800057a0:	ffffd097          	auipc	ra,0xffffd
    800057a4:	f00080e7          	jalr	-256(ra) # 800026a0 <_ZN6ThreadD1Ev>
    800057a8:	00048513          	mv	a0,s1
    800057ac:	ffffd097          	auipc	ra,0xffffd
    800057b0:	034080e7          	jalr	52(ra) # 800027e0 <_ZdlPv>
    800057b4:	01813083          	ld	ra,24(sp)
    800057b8:	01013403          	ld	s0,16(sp)
    800057bc:	00813483          	ld	s1,8(sp)
    800057c0:	02010113          	addi	sp,sp,32
    800057c4:	00008067          	ret

00000000800057c8 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800057c8:	ff010113          	addi	sp,sp,-16
    800057cc:	00113423          	sd	ra,8(sp)
    800057d0:	00813023          	sd	s0,0(sp)
    800057d4:	01010413          	addi	s0,sp,16
    800057d8:	00007797          	auipc	a5,0x7
    800057dc:	27078793          	addi	a5,a5,624 # 8000ca48 <_ZTV16ProducerKeyboard+0x10>
    800057e0:	00f53023          	sd	a5,0(a0)
    800057e4:	ffffd097          	auipc	ra,0xffffd
    800057e8:	ebc080e7          	jalr	-324(ra) # 800026a0 <_ZN6ThreadD1Ev>
    800057ec:	00813083          	ld	ra,8(sp)
    800057f0:	00013403          	ld	s0,0(sp)
    800057f4:	01010113          	addi	sp,sp,16
    800057f8:	00008067          	ret

00000000800057fc <_ZN16ProducerKeyboardD0Ev>:
    800057fc:	fe010113          	addi	sp,sp,-32
    80005800:	00113c23          	sd	ra,24(sp)
    80005804:	00813823          	sd	s0,16(sp)
    80005808:	00913423          	sd	s1,8(sp)
    8000580c:	02010413          	addi	s0,sp,32
    80005810:	00050493          	mv	s1,a0
    80005814:	00007797          	auipc	a5,0x7
    80005818:	23478793          	addi	a5,a5,564 # 8000ca48 <_ZTV16ProducerKeyboard+0x10>
    8000581c:	00f53023          	sd	a5,0(a0)
    80005820:	ffffd097          	auipc	ra,0xffffd
    80005824:	e80080e7          	jalr	-384(ra) # 800026a0 <_ZN6ThreadD1Ev>
    80005828:	00048513          	mv	a0,s1
    8000582c:	ffffd097          	auipc	ra,0xffffd
    80005830:	fb4080e7          	jalr	-76(ra) # 800027e0 <_ZdlPv>
    80005834:	01813083          	ld	ra,24(sp)
    80005838:	01013403          	ld	s0,16(sp)
    8000583c:	00813483          	ld	s1,8(sp)
    80005840:	02010113          	addi	sp,sp,32
    80005844:	00008067          	ret

0000000080005848 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005848:	ff010113          	addi	sp,sp,-16
    8000584c:	00113423          	sd	ra,8(sp)
    80005850:	00813023          	sd	s0,0(sp)
    80005854:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005858:	02053583          	ld	a1,32(a0)
    8000585c:	fffff097          	auipc	ra,0xfffff
    80005860:	7e4080e7          	jalr	2020(ra) # 80005040 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005864:	00813083          	ld	ra,8(sp)
    80005868:	00013403          	ld	s0,0(sp)
    8000586c:	01010113          	addi	sp,sp,16
    80005870:	00008067          	ret

0000000080005874 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005874:	ff010113          	addi	sp,sp,-16
    80005878:	00113423          	sd	ra,8(sp)
    8000587c:	00813023          	sd	s0,0(sp)
    80005880:	01010413          	addi	s0,sp,16
        producer(td);
    80005884:	02053583          	ld	a1,32(a0)
    80005888:	00000097          	auipc	ra,0x0
    8000588c:	878080e7          	jalr	-1928(ra) # 80005100 <_ZN12ProducerSync8producerEPv>
    }
    80005890:	00813083          	ld	ra,8(sp)
    80005894:	00013403          	ld	s0,0(sp)
    80005898:	01010113          	addi	sp,sp,16
    8000589c:	00008067          	ret

00000000800058a0 <_ZN12ConsumerSync3runEv>:
    void run() override {
    800058a0:	ff010113          	addi	sp,sp,-16
    800058a4:	00113423          	sd	ra,8(sp)
    800058a8:	00813023          	sd	s0,0(sp)
    800058ac:	01010413          	addi	s0,sp,16
        consumer(td);
    800058b0:	02053583          	ld	a1,32(a0)
    800058b4:	00000097          	auipc	ra,0x0
    800058b8:	8e0080e7          	jalr	-1824(ra) # 80005194 <_ZN12ConsumerSync8consumerEPv>
    }
    800058bc:	00813083          	ld	ra,8(sp)
    800058c0:	00013403          	ld	s0,0(sp)
    800058c4:	01010113          	addi	sp,sp,16
    800058c8:	00008067          	ret

00000000800058cc <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800058cc:	fe010113          	addi	sp,sp,-32
    800058d0:	00113c23          	sd	ra,24(sp)
    800058d4:	00813823          	sd	s0,16(sp)
    800058d8:	00913423          	sd	s1,8(sp)
    800058dc:	02010413          	addi	s0,sp,32
    800058e0:	00050493          	mv	s1,a0
    LOCK();
    800058e4:	00100613          	li	a2,1
    800058e8:	00000593          	li	a1,0
    800058ec:	00007517          	auipc	a0,0x7
    800058f0:	3ec50513          	addi	a0,a0,1004 # 8000ccd8 <lockPrint>
    800058f4:	ffffc097          	auipc	ra,0xffffc
    800058f8:	830080e7          	jalr	-2000(ra) # 80001124 <copy_and_swap>
    800058fc:	00050863          	beqz	a0,8000590c <_Z11printStringPKc+0x40>
    80005900:	ffffc097          	auipc	ra,0xffffc
    80005904:	b2c080e7          	jalr	-1236(ra) # 8000142c <_Z15thread_dispatchv>
    80005908:	fddff06f          	j	800058e4 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    8000590c:	0004c503          	lbu	a0,0(s1)
    80005910:	00050a63          	beqz	a0,80005924 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005914:	ffffc097          	auipc	ra,0xffffc
    80005918:	c80080e7          	jalr	-896(ra) # 80001594 <_Z4putcc>
        string++;
    8000591c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005920:	fedff06f          	j	8000590c <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005924:	00000613          	li	a2,0
    80005928:	00100593          	li	a1,1
    8000592c:	00007517          	auipc	a0,0x7
    80005930:	3ac50513          	addi	a0,a0,940 # 8000ccd8 <lockPrint>
    80005934:	ffffb097          	auipc	ra,0xffffb
    80005938:	7f0080e7          	jalr	2032(ra) # 80001124 <copy_and_swap>
    8000593c:	fe0514e3          	bnez	a0,80005924 <_Z11printStringPKc+0x58>
}
    80005940:	01813083          	ld	ra,24(sp)
    80005944:	01013403          	ld	s0,16(sp)
    80005948:	00813483          	ld	s1,8(sp)
    8000594c:	02010113          	addi	sp,sp,32
    80005950:	00008067          	ret

0000000080005954 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005954:	fd010113          	addi	sp,sp,-48
    80005958:	02113423          	sd	ra,40(sp)
    8000595c:	02813023          	sd	s0,32(sp)
    80005960:	00913c23          	sd	s1,24(sp)
    80005964:	01213823          	sd	s2,16(sp)
    80005968:	01313423          	sd	s3,8(sp)
    8000596c:	01413023          	sd	s4,0(sp)
    80005970:	03010413          	addi	s0,sp,48
    80005974:	00050993          	mv	s3,a0
    80005978:	00058a13          	mv	s4,a1
    LOCK();
    8000597c:	00100613          	li	a2,1
    80005980:	00000593          	li	a1,0
    80005984:	00007517          	auipc	a0,0x7
    80005988:	35450513          	addi	a0,a0,852 # 8000ccd8 <lockPrint>
    8000598c:	ffffb097          	auipc	ra,0xffffb
    80005990:	798080e7          	jalr	1944(ra) # 80001124 <copy_and_swap>
    80005994:	00050863          	beqz	a0,800059a4 <_Z9getStringPci+0x50>
    80005998:	ffffc097          	auipc	ra,0xffffc
    8000599c:	a94080e7          	jalr	-1388(ra) # 8000142c <_Z15thread_dispatchv>
    800059a0:	fddff06f          	j	8000597c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800059a4:	00000913          	li	s2,0
    800059a8:	00090493          	mv	s1,s2
    800059ac:	0019091b          	addiw	s2,s2,1
    800059b0:	03495a63          	bge	s2,s4,800059e4 <_Z9getStringPci+0x90>
        cc = getc();
    800059b4:	ffffc097          	auipc	ra,0xffffc
    800059b8:	bb8080e7          	jalr	-1096(ra) # 8000156c <_Z4getcv>
        if(cc < 1)
    800059bc:	02050463          	beqz	a0,800059e4 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    800059c0:	009984b3          	add	s1,s3,s1
    800059c4:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800059c8:	00a00793          	li	a5,10
    800059cc:	00f50a63          	beq	a0,a5,800059e0 <_Z9getStringPci+0x8c>
    800059d0:	00d00793          	li	a5,13
    800059d4:	fcf51ae3          	bne	a0,a5,800059a8 <_Z9getStringPci+0x54>
        buf[i++] = c;
    800059d8:	00090493          	mv	s1,s2
    800059dc:	0080006f          	j	800059e4 <_Z9getStringPci+0x90>
    800059e0:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800059e4:	009984b3          	add	s1,s3,s1
    800059e8:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800059ec:	00000613          	li	a2,0
    800059f0:	00100593          	li	a1,1
    800059f4:	00007517          	auipc	a0,0x7
    800059f8:	2e450513          	addi	a0,a0,740 # 8000ccd8 <lockPrint>
    800059fc:	ffffb097          	auipc	ra,0xffffb
    80005a00:	728080e7          	jalr	1832(ra) # 80001124 <copy_and_swap>
    80005a04:	fe0514e3          	bnez	a0,800059ec <_Z9getStringPci+0x98>
    return buf;
}
    80005a08:	00098513          	mv	a0,s3
    80005a0c:	02813083          	ld	ra,40(sp)
    80005a10:	02013403          	ld	s0,32(sp)
    80005a14:	01813483          	ld	s1,24(sp)
    80005a18:	01013903          	ld	s2,16(sp)
    80005a1c:	00813983          	ld	s3,8(sp)
    80005a20:	00013a03          	ld	s4,0(sp)
    80005a24:	03010113          	addi	sp,sp,48
    80005a28:	00008067          	ret

0000000080005a2c <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005a2c:	ff010113          	addi	sp,sp,-16
    80005a30:	00813423          	sd	s0,8(sp)
    80005a34:	01010413          	addi	s0,sp,16
    80005a38:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005a3c:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005a40:	0006c603          	lbu	a2,0(a3)
    80005a44:	fd06071b          	addiw	a4,a2,-48
    80005a48:	0ff77713          	andi	a4,a4,255
    80005a4c:	00900793          	li	a5,9
    80005a50:	02e7e063          	bltu	a5,a4,80005a70 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005a54:	0025179b          	slliw	a5,a0,0x2
    80005a58:	00a787bb          	addw	a5,a5,a0
    80005a5c:	0017979b          	slliw	a5,a5,0x1
    80005a60:	00168693          	addi	a3,a3,1
    80005a64:	00c787bb          	addw	a5,a5,a2
    80005a68:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005a6c:	fd5ff06f          	j	80005a40 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005a70:	00813403          	ld	s0,8(sp)
    80005a74:	01010113          	addi	sp,sp,16
    80005a78:	00008067          	ret

0000000080005a7c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005a7c:	fc010113          	addi	sp,sp,-64
    80005a80:	02113c23          	sd	ra,56(sp)
    80005a84:	02813823          	sd	s0,48(sp)
    80005a88:	02913423          	sd	s1,40(sp)
    80005a8c:	03213023          	sd	s2,32(sp)
    80005a90:	01313c23          	sd	s3,24(sp)
    80005a94:	04010413          	addi	s0,sp,64
    80005a98:	00050493          	mv	s1,a0
    80005a9c:	00058913          	mv	s2,a1
    80005aa0:	00060993          	mv	s3,a2
    LOCK();
    80005aa4:	00100613          	li	a2,1
    80005aa8:	00000593          	li	a1,0
    80005aac:	00007517          	auipc	a0,0x7
    80005ab0:	22c50513          	addi	a0,a0,556 # 8000ccd8 <lockPrint>
    80005ab4:	ffffb097          	auipc	ra,0xffffb
    80005ab8:	670080e7          	jalr	1648(ra) # 80001124 <copy_and_swap>
    80005abc:	00050863          	beqz	a0,80005acc <_Z8printIntiii+0x50>
    80005ac0:	ffffc097          	auipc	ra,0xffffc
    80005ac4:	96c080e7          	jalr	-1684(ra) # 8000142c <_Z15thread_dispatchv>
    80005ac8:	fddff06f          	j	80005aa4 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005acc:	00098463          	beqz	s3,80005ad4 <_Z8printIntiii+0x58>
    80005ad0:	0804c463          	bltz	s1,80005b58 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005ad4:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005ad8:	00000593          	li	a1,0
    }

    i = 0;
    80005adc:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005ae0:	0009079b          	sext.w	a5,s2
    80005ae4:	0325773b          	remuw	a4,a0,s2
    80005ae8:	00048613          	mv	a2,s1
    80005aec:	0014849b          	addiw	s1,s1,1
    80005af0:	02071693          	slli	a3,a4,0x20
    80005af4:	0206d693          	srli	a3,a3,0x20
    80005af8:	00007717          	auipc	a4,0x7
    80005afc:	fb870713          	addi	a4,a4,-72 # 8000cab0 <digits>
    80005b00:	00d70733          	add	a4,a4,a3
    80005b04:	00074683          	lbu	a3,0(a4)
    80005b08:	fd040713          	addi	a4,s0,-48
    80005b0c:	00c70733          	add	a4,a4,a2
    80005b10:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005b14:	0005071b          	sext.w	a4,a0
    80005b18:	0325553b          	divuw	a0,a0,s2
    80005b1c:	fcf772e3          	bgeu	a4,a5,80005ae0 <_Z8printIntiii+0x64>
    if(neg)
    80005b20:	00058c63          	beqz	a1,80005b38 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005b24:	fd040793          	addi	a5,s0,-48
    80005b28:	009784b3          	add	s1,a5,s1
    80005b2c:	02d00793          	li	a5,45
    80005b30:	fef48823          	sb	a5,-16(s1)
    80005b34:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005b38:	fff4849b          	addiw	s1,s1,-1
    80005b3c:	0204c463          	bltz	s1,80005b64 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005b40:	fd040793          	addi	a5,s0,-48
    80005b44:	009787b3          	add	a5,a5,s1
    80005b48:	ff07c503          	lbu	a0,-16(a5)
    80005b4c:	ffffc097          	auipc	ra,0xffffc
    80005b50:	a48080e7          	jalr	-1464(ra) # 80001594 <_Z4putcc>
    80005b54:	fe5ff06f          	j	80005b38 <_Z8printIntiii+0xbc>
        x = -xx;
    80005b58:	4090053b          	negw	a0,s1
        neg = 1;
    80005b5c:	00100593          	li	a1,1
        x = -xx;
    80005b60:	f7dff06f          	j	80005adc <_Z8printIntiii+0x60>

    UNLOCK();
    80005b64:	00000613          	li	a2,0
    80005b68:	00100593          	li	a1,1
    80005b6c:	00007517          	auipc	a0,0x7
    80005b70:	16c50513          	addi	a0,a0,364 # 8000ccd8 <lockPrint>
    80005b74:	ffffb097          	auipc	ra,0xffffb
    80005b78:	5b0080e7          	jalr	1456(ra) # 80001124 <copy_and_swap>
    80005b7c:	fe0514e3          	bnez	a0,80005b64 <_Z8printIntiii+0xe8>
    80005b80:	03813083          	ld	ra,56(sp)
    80005b84:	03013403          	ld	s0,48(sp)
    80005b88:	02813483          	ld	s1,40(sp)
    80005b8c:	02013903          	ld	s2,32(sp)
    80005b90:	01813983          	ld	s3,24(sp)
    80005b94:	04010113          	addi	sp,sp,64
    80005b98:	00008067          	ret

0000000080005b9c <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005b9c:	fd010113          	addi	sp,sp,-48
    80005ba0:	02113423          	sd	ra,40(sp)
    80005ba4:	02813023          	sd	s0,32(sp)
    80005ba8:	00913c23          	sd	s1,24(sp)
    80005bac:	01213823          	sd	s2,16(sp)
    80005bb0:	01313423          	sd	s3,8(sp)
    80005bb4:	03010413          	addi	s0,sp,48
    80005bb8:	00050493          	mv	s1,a0
    80005bbc:	00058913          	mv	s2,a1
    80005bc0:	0015879b          	addiw	a5,a1,1
    80005bc4:	0007851b          	sext.w	a0,a5
    80005bc8:	00f4a023          	sw	a5,0(s1)
    80005bcc:	0004a823          	sw	zero,16(s1)
    80005bd0:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005bd4:	00251513          	slli	a0,a0,0x2
    80005bd8:	ffffb097          	auipc	ra,0xffffb
    80005bdc:	730080e7          	jalr	1840(ra) # 80001308 <_Z9mem_allocm>
    80005be0:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005be4:	01000513          	li	a0,16
    80005be8:	ffffd097          	auipc	ra,0xffffd
    80005bec:	ba8080e7          	jalr	-1112(ra) # 80002790 <_Znwm>
    80005bf0:	00050993          	mv	s3,a0
    80005bf4:	00000593          	li	a1,0
    80005bf8:	ffffd097          	auipc	ra,0xffffd
    80005bfc:	eb4080e7          	jalr	-332(ra) # 80002aac <_ZN9SemaphoreC1Ej>
    80005c00:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005c04:	01000513          	li	a0,16
    80005c08:	ffffd097          	auipc	ra,0xffffd
    80005c0c:	b88080e7          	jalr	-1144(ra) # 80002790 <_Znwm>
    80005c10:	00050993          	mv	s3,a0
    80005c14:	00090593          	mv	a1,s2
    80005c18:	ffffd097          	auipc	ra,0xffffd
    80005c1c:	e94080e7          	jalr	-364(ra) # 80002aac <_ZN9SemaphoreC1Ej>
    80005c20:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005c24:	01000513          	li	a0,16
    80005c28:	ffffd097          	auipc	ra,0xffffd
    80005c2c:	b68080e7          	jalr	-1176(ra) # 80002790 <_Znwm>
    80005c30:	00050913          	mv	s2,a0
    80005c34:	00100593          	li	a1,1
    80005c38:	ffffd097          	auipc	ra,0xffffd
    80005c3c:	e74080e7          	jalr	-396(ra) # 80002aac <_ZN9SemaphoreC1Ej>
    80005c40:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005c44:	01000513          	li	a0,16
    80005c48:	ffffd097          	auipc	ra,0xffffd
    80005c4c:	b48080e7          	jalr	-1208(ra) # 80002790 <_Znwm>
    80005c50:	00050913          	mv	s2,a0
    80005c54:	00100593          	li	a1,1
    80005c58:	ffffd097          	auipc	ra,0xffffd
    80005c5c:	e54080e7          	jalr	-428(ra) # 80002aac <_ZN9SemaphoreC1Ej>
    80005c60:	0324b823          	sd	s2,48(s1)
}
    80005c64:	02813083          	ld	ra,40(sp)
    80005c68:	02013403          	ld	s0,32(sp)
    80005c6c:	01813483          	ld	s1,24(sp)
    80005c70:	01013903          	ld	s2,16(sp)
    80005c74:	00813983          	ld	s3,8(sp)
    80005c78:	03010113          	addi	sp,sp,48
    80005c7c:	00008067          	ret
    80005c80:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005c84:	00098513          	mv	a0,s3
    80005c88:	ffffd097          	auipc	ra,0xffffd
    80005c8c:	b58080e7          	jalr	-1192(ra) # 800027e0 <_ZdlPv>
    80005c90:	00048513          	mv	a0,s1
    80005c94:	00008097          	auipc	ra,0x8
    80005c98:	134080e7          	jalr	308(ra) # 8000ddc8 <_Unwind_Resume>
    80005c9c:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005ca0:	00098513          	mv	a0,s3
    80005ca4:	ffffd097          	auipc	ra,0xffffd
    80005ca8:	b3c080e7          	jalr	-1220(ra) # 800027e0 <_ZdlPv>
    80005cac:	00048513          	mv	a0,s1
    80005cb0:	00008097          	auipc	ra,0x8
    80005cb4:	118080e7          	jalr	280(ra) # 8000ddc8 <_Unwind_Resume>
    80005cb8:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005cbc:	00090513          	mv	a0,s2
    80005cc0:	ffffd097          	auipc	ra,0xffffd
    80005cc4:	b20080e7          	jalr	-1248(ra) # 800027e0 <_ZdlPv>
    80005cc8:	00048513          	mv	a0,s1
    80005ccc:	00008097          	auipc	ra,0x8
    80005cd0:	0fc080e7          	jalr	252(ra) # 8000ddc8 <_Unwind_Resume>
    80005cd4:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005cd8:	00090513          	mv	a0,s2
    80005cdc:	ffffd097          	auipc	ra,0xffffd
    80005ce0:	b04080e7          	jalr	-1276(ra) # 800027e0 <_ZdlPv>
    80005ce4:	00048513          	mv	a0,s1
    80005ce8:	00008097          	auipc	ra,0x8
    80005cec:	0e0080e7          	jalr	224(ra) # 8000ddc8 <_Unwind_Resume>

0000000080005cf0 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005cf0:	fe010113          	addi	sp,sp,-32
    80005cf4:	00113c23          	sd	ra,24(sp)
    80005cf8:	00813823          	sd	s0,16(sp)
    80005cfc:	00913423          	sd	s1,8(sp)
    80005d00:	01213023          	sd	s2,0(sp)
    80005d04:	02010413          	addi	s0,sp,32
    80005d08:	00050493          	mv	s1,a0
    80005d0c:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005d10:	01853503          	ld	a0,24(a0)
    80005d14:	ffffd097          	auipc	ra,0xffffd
    80005d18:	dd0080e7          	jalr	-560(ra) # 80002ae4 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005d1c:	0304b503          	ld	a0,48(s1)
    80005d20:	ffffd097          	auipc	ra,0xffffd
    80005d24:	dc4080e7          	jalr	-572(ra) # 80002ae4 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005d28:	0084b783          	ld	a5,8(s1)
    80005d2c:	0144a703          	lw	a4,20(s1)
    80005d30:	00271713          	slli	a4,a4,0x2
    80005d34:	00e787b3          	add	a5,a5,a4
    80005d38:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005d3c:	0144a783          	lw	a5,20(s1)
    80005d40:	0017879b          	addiw	a5,a5,1
    80005d44:	0004a703          	lw	a4,0(s1)
    80005d48:	02e7e7bb          	remw	a5,a5,a4
    80005d4c:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005d50:	0304b503          	ld	a0,48(s1)
    80005d54:	ffffd097          	auipc	ra,0xffffd
    80005d58:	dbc080e7          	jalr	-580(ra) # 80002b10 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005d5c:	0204b503          	ld	a0,32(s1)
    80005d60:	ffffd097          	auipc	ra,0xffffd
    80005d64:	db0080e7          	jalr	-592(ra) # 80002b10 <_ZN9Semaphore6signalEv>

}
    80005d68:	01813083          	ld	ra,24(sp)
    80005d6c:	01013403          	ld	s0,16(sp)
    80005d70:	00813483          	ld	s1,8(sp)
    80005d74:	00013903          	ld	s2,0(sp)
    80005d78:	02010113          	addi	sp,sp,32
    80005d7c:	00008067          	ret

0000000080005d80 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005d80:	fe010113          	addi	sp,sp,-32
    80005d84:	00113c23          	sd	ra,24(sp)
    80005d88:	00813823          	sd	s0,16(sp)
    80005d8c:	00913423          	sd	s1,8(sp)
    80005d90:	01213023          	sd	s2,0(sp)
    80005d94:	02010413          	addi	s0,sp,32
    80005d98:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005d9c:	02053503          	ld	a0,32(a0)
    80005da0:	ffffd097          	auipc	ra,0xffffd
    80005da4:	d44080e7          	jalr	-700(ra) # 80002ae4 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005da8:	0284b503          	ld	a0,40(s1)
    80005dac:	ffffd097          	auipc	ra,0xffffd
    80005db0:	d38080e7          	jalr	-712(ra) # 80002ae4 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005db4:	0084b703          	ld	a4,8(s1)
    80005db8:	0104a783          	lw	a5,16(s1)
    80005dbc:	00279693          	slli	a3,a5,0x2
    80005dc0:	00d70733          	add	a4,a4,a3
    80005dc4:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005dc8:	0017879b          	addiw	a5,a5,1
    80005dcc:	0004a703          	lw	a4,0(s1)
    80005dd0:	02e7e7bb          	remw	a5,a5,a4
    80005dd4:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005dd8:	0284b503          	ld	a0,40(s1)
    80005ddc:	ffffd097          	auipc	ra,0xffffd
    80005de0:	d34080e7          	jalr	-716(ra) # 80002b10 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005de4:	0184b503          	ld	a0,24(s1)
    80005de8:	ffffd097          	auipc	ra,0xffffd
    80005dec:	d28080e7          	jalr	-728(ra) # 80002b10 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005df0:	00090513          	mv	a0,s2
    80005df4:	01813083          	ld	ra,24(sp)
    80005df8:	01013403          	ld	s0,16(sp)
    80005dfc:	00813483          	ld	s1,8(sp)
    80005e00:	00013903          	ld	s2,0(sp)
    80005e04:	02010113          	addi	sp,sp,32
    80005e08:	00008067          	ret

0000000080005e0c <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005e0c:	fe010113          	addi	sp,sp,-32
    80005e10:	00113c23          	sd	ra,24(sp)
    80005e14:	00813823          	sd	s0,16(sp)
    80005e18:	00913423          	sd	s1,8(sp)
    80005e1c:	01213023          	sd	s2,0(sp)
    80005e20:	02010413          	addi	s0,sp,32
    80005e24:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005e28:	02853503          	ld	a0,40(a0)
    80005e2c:	ffffd097          	auipc	ra,0xffffd
    80005e30:	cb8080e7          	jalr	-840(ra) # 80002ae4 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005e34:	0304b503          	ld	a0,48(s1)
    80005e38:	ffffd097          	auipc	ra,0xffffd
    80005e3c:	cac080e7          	jalr	-852(ra) # 80002ae4 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005e40:	0144a783          	lw	a5,20(s1)
    80005e44:	0104a903          	lw	s2,16(s1)
    80005e48:	0327ce63          	blt	a5,s2,80005e84 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80005e4c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005e50:	0304b503          	ld	a0,48(s1)
    80005e54:	ffffd097          	auipc	ra,0xffffd
    80005e58:	cbc080e7          	jalr	-836(ra) # 80002b10 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80005e5c:	0284b503          	ld	a0,40(s1)
    80005e60:	ffffd097          	auipc	ra,0xffffd
    80005e64:	cb0080e7          	jalr	-848(ra) # 80002b10 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005e68:	00090513          	mv	a0,s2
    80005e6c:	01813083          	ld	ra,24(sp)
    80005e70:	01013403          	ld	s0,16(sp)
    80005e74:	00813483          	ld	s1,8(sp)
    80005e78:	00013903          	ld	s2,0(sp)
    80005e7c:	02010113          	addi	sp,sp,32
    80005e80:	00008067          	ret
        ret = cap - head + tail;
    80005e84:	0004a703          	lw	a4,0(s1)
    80005e88:	4127093b          	subw	s2,a4,s2
    80005e8c:	00f9093b          	addw	s2,s2,a5
    80005e90:	fc1ff06f          	j	80005e50 <_ZN9BufferCPP6getCntEv+0x44>

0000000080005e94 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80005e94:	fe010113          	addi	sp,sp,-32
    80005e98:	00113c23          	sd	ra,24(sp)
    80005e9c:	00813823          	sd	s0,16(sp)
    80005ea0:	00913423          	sd	s1,8(sp)
    80005ea4:	02010413          	addi	s0,sp,32
    80005ea8:	00050493          	mv	s1,a0
    Console::putc('\n');
    80005eac:	00a00513          	li	a0,10
    80005eb0:	ffffd097          	auipc	ra,0xffffd
    80005eb4:	d1c080e7          	jalr	-740(ra) # 80002bcc <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80005eb8:	00004517          	auipc	a0,0x4
    80005ebc:	57050513          	addi	a0,a0,1392 # 8000a428 <_ZZ9kPrintIntmE6digits+0x3b8>
    80005ec0:	00000097          	auipc	ra,0x0
    80005ec4:	a0c080e7          	jalr	-1524(ra) # 800058cc <_Z11printStringPKc>
    while (getCnt()) {
    80005ec8:	00048513          	mv	a0,s1
    80005ecc:	00000097          	auipc	ra,0x0
    80005ed0:	f40080e7          	jalr	-192(ra) # 80005e0c <_ZN9BufferCPP6getCntEv>
    80005ed4:	02050c63          	beqz	a0,80005f0c <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80005ed8:	0084b783          	ld	a5,8(s1)
    80005edc:	0104a703          	lw	a4,16(s1)
    80005ee0:	00271713          	slli	a4,a4,0x2
    80005ee4:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80005ee8:	0007c503          	lbu	a0,0(a5)
    80005eec:	ffffd097          	auipc	ra,0xffffd
    80005ef0:	ce0080e7          	jalr	-800(ra) # 80002bcc <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80005ef4:	0104a783          	lw	a5,16(s1)
    80005ef8:	0017879b          	addiw	a5,a5,1
    80005efc:	0004a703          	lw	a4,0(s1)
    80005f00:	02e7e7bb          	remw	a5,a5,a4
    80005f04:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80005f08:	fc1ff06f          	j	80005ec8 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80005f0c:	02100513          	li	a0,33
    80005f10:	ffffd097          	auipc	ra,0xffffd
    80005f14:	cbc080e7          	jalr	-836(ra) # 80002bcc <_ZN7Console4putcEc>
    Console::putc('\n');
    80005f18:	00a00513          	li	a0,10
    80005f1c:	ffffd097          	auipc	ra,0xffffd
    80005f20:	cb0080e7          	jalr	-848(ra) # 80002bcc <_ZN7Console4putcEc>
    mem_free(buffer);
    80005f24:	0084b503          	ld	a0,8(s1)
    80005f28:	ffffb097          	auipc	ra,0xffffb
    80005f2c:	420080e7          	jalr	1056(ra) # 80001348 <_Z8mem_freePv>
    delete itemAvailable;
    80005f30:	0204b503          	ld	a0,32(s1)
    80005f34:	00050863          	beqz	a0,80005f44 <_ZN9BufferCPPD1Ev+0xb0>
    80005f38:	00053783          	ld	a5,0(a0)
    80005f3c:	0087b783          	ld	a5,8(a5)
    80005f40:	000780e7          	jalr	a5
    delete spaceAvailable;
    80005f44:	0184b503          	ld	a0,24(s1)
    80005f48:	00050863          	beqz	a0,80005f58 <_ZN9BufferCPPD1Ev+0xc4>
    80005f4c:	00053783          	ld	a5,0(a0)
    80005f50:	0087b783          	ld	a5,8(a5)
    80005f54:	000780e7          	jalr	a5
    delete mutexTail;
    80005f58:	0304b503          	ld	a0,48(s1)
    80005f5c:	00050863          	beqz	a0,80005f6c <_ZN9BufferCPPD1Ev+0xd8>
    80005f60:	00053783          	ld	a5,0(a0)
    80005f64:	0087b783          	ld	a5,8(a5)
    80005f68:	000780e7          	jalr	a5
    delete mutexHead;
    80005f6c:	0284b503          	ld	a0,40(s1)
    80005f70:	00050863          	beqz	a0,80005f80 <_ZN9BufferCPPD1Ev+0xec>
    80005f74:	00053783          	ld	a5,0(a0)
    80005f78:	0087b783          	ld	a5,8(a5)
    80005f7c:	000780e7          	jalr	a5
}
    80005f80:	01813083          	ld	ra,24(sp)
    80005f84:	01013403          	ld	s0,16(sp)
    80005f88:	00813483          	ld	s1,8(sp)
    80005f8c:	02010113          	addi	sp,sp,32
    80005f90:	00008067          	ret

0000000080005f94 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80005f94:	fe010113          	addi	sp,sp,-32
    80005f98:	00113c23          	sd	ra,24(sp)
    80005f9c:	00813823          	sd	s0,16(sp)
    80005fa0:	00913423          	sd	s1,8(sp)
    80005fa4:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80005fa8:	00004517          	auipc	a0,0x4
    80005fac:	49850513          	addi	a0,a0,1176 # 8000a440 <_ZZ9kPrintIntmE6digits+0x3d0>
    80005fb0:	00000097          	auipc	ra,0x0
    80005fb4:	91c080e7          	jalr	-1764(ra) # 800058cc <_Z11printStringPKc>
    int test = getc() - '0';
    80005fb8:	ffffb097          	auipc	ra,0xffffb
    80005fbc:	5b4080e7          	jalr	1460(ra) # 8000156c <_Z4getcv>
    80005fc0:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80005fc4:	ffffb097          	auipc	ra,0xffffb
    80005fc8:	5a8080e7          	jalr	1448(ra) # 8000156c <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80005fcc:	00700793          	li	a5,7
    80005fd0:	1097e263          	bltu	a5,s1,800060d4 <_Z8userMainv+0x140>
    80005fd4:	00249493          	slli	s1,s1,0x2
    80005fd8:	00004717          	auipc	a4,0x4
    80005fdc:	6c070713          	addi	a4,a4,1728 # 8000a698 <_ZZ9kPrintIntmE6digits+0x628>
    80005fe0:	00e484b3          	add	s1,s1,a4
    80005fe4:	0004a783          	lw	a5,0(s1)
    80005fe8:	00e787b3          	add	a5,a5,a4
    80005fec:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80005ff0:	fffff097          	auipc	ra,0xfffff
    80005ff4:	f54080e7          	jalr	-172(ra) # 80004f44 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80005ff8:	00004517          	auipc	a0,0x4
    80005ffc:	46850513          	addi	a0,a0,1128 # 8000a460 <_ZZ9kPrintIntmE6digits+0x3f0>
    80006000:	00000097          	auipc	ra,0x0
    80006004:	8cc080e7          	jalr	-1844(ra) # 800058cc <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006008:	01813083          	ld	ra,24(sp)
    8000600c:	01013403          	ld	s0,16(sp)
    80006010:	00813483          	ld	s1,8(sp)
    80006014:	02010113          	addi	sp,sp,32
    80006018:	00008067          	ret
            Threads_CPP_API_test();
    8000601c:	ffffe097          	auipc	ra,0xffffe
    80006020:	e08080e7          	jalr	-504(ra) # 80003e24 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006024:	00004517          	auipc	a0,0x4
    80006028:	47c50513          	addi	a0,a0,1148 # 8000a4a0 <_ZZ9kPrintIntmE6digits+0x430>
    8000602c:	00000097          	auipc	ra,0x0
    80006030:	8a0080e7          	jalr	-1888(ra) # 800058cc <_Z11printStringPKc>
            break;
    80006034:	fd5ff06f          	j	80006008 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006038:	ffffd097          	auipc	ra,0xffffd
    8000603c:	640080e7          	jalr	1600(ra) # 80003678 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006040:	00004517          	auipc	a0,0x4
    80006044:	4a050513          	addi	a0,a0,1184 # 8000a4e0 <_ZZ9kPrintIntmE6digits+0x470>
    80006048:	00000097          	auipc	ra,0x0
    8000604c:	884080e7          	jalr	-1916(ra) # 800058cc <_Z11printStringPKc>
            break;
    80006050:	fb9ff06f          	j	80006008 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006054:	fffff097          	auipc	ra,0xfffff
    80006058:	234080e7          	jalr	564(ra) # 80005288 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    8000605c:	00004517          	auipc	a0,0x4
    80006060:	4d450513          	addi	a0,a0,1236 # 8000a530 <_ZZ9kPrintIntmE6digits+0x4c0>
    80006064:	00000097          	auipc	ra,0x0
    80006068:	868080e7          	jalr	-1944(ra) # 800058cc <_Z11printStringPKc>
            break;
    8000606c:	f9dff06f          	j	80006008 <_Z8userMainv+0x74>
            testSleeping();
    80006070:	00000097          	auipc	ra,0x0
    80006074:	11c080e7          	jalr	284(ra) # 8000618c <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006078:	00004517          	auipc	a0,0x4
    8000607c:	51050513          	addi	a0,a0,1296 # 8000a588 <_ZZ9kPrintIntmE6digits+0x518>
    80006080:	00000097          	auipc	ra,0x0
    80006084:	84c080e7          	jalr	-1972(ra) # 800058cc <_Z11printStringPKc>
            break;
    80006088:	f81ff06f          	j	80006008 <_Z8userMainv+0x74>
            testConsumerProducer();
    8000608c:	ffffe097          	auipc	ra,0xffffe
    80006090:	258080e7          	jalr	600(ra) # 800042e4 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006094:	00004517          	auipc	a0,0x4
    80006098:	52450513          	addi	a0,a0,1316 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    8000609c:	00000097          	auipc	ra,0x0
    800060a0:	830080e7          	jalr	-2000(ra) # 800058cc <_Z11printStringPKc>
            break;
    800060a4:	f65ff06f          	j	80006008 <_Z8userMainv+0x74>
            System_Mode_test();
    800060a8:	00000097          	auipc	ra,0x0
    800060ac:	658080e7          	jalr	1624(ra) # 80006700 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    800060b0:	00004517          	auipc	a0,0x4
    800060b4:	54850513          	addi	a0,a0,1352 # 8000a5f8 <_ZZ9kPrintIntmE6digits+0x588>
    800060b8:	00000097          	auipc	ra,0x0
    800060bc:	814080e7          	jalr	-2028(ra) # 800058cc <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800060c0:	00004517          	auipc	a0,0x4
    800060c4:	55850513          	addi	a0,a0,1368 # 8000a618 <_ZZ9kPrintIntmE6digits+0x5a8>
    800060c8:	00000097          	auipc	ra,0x0
    800060cc:	804080e7          	jalr	-2044(ra) # 800058cc <_Z11printStringPKc>
            break;
    800060d0:	f39ff06f          	j	80006008 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    800060d4:	00004517          	auipc	a0,0x4
    800060d8:	59c50513          	addi	a0,a0,1436 # 8000a670 <_ZZ9kPrintIntmE6digits+0x600>
    800060dc:	fffff097          	auipc	ra,0xfffff
    800060e0:	7f0080e7          	jalr	2032(ra) # 800058cc <_Z11printStringPKc>
    800060e4:	f25ff06f          	j	80006008 <_Z8userMainv+0x74>

00000000800060e8 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800060e8:	fe010113          	addi	sp,sp,-32
    800060ec:	00113c23          	sd	ra,24(sp)
    800060f0:	00813823          	sd	s0,16(sp)
    800060f4:	00913423          	sd	s1,8(sp)
    800060f8:	01213023          	sd	s2,0(sp)
    800060fc:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006100:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006104:	00600493          	li	s1,6
    while (--i > 0) {
    80006108:	fff4849b          	addiw	s1,s1,-1
    8000610c:	04905463          	blez	s1,80006154 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006110:	00004517          	auipc	a0,0x4
    80006114:	5a850513          	addi	a0,a0,1448 # 8000a6b8 <_ZZ9kPrintIntmE6digits+0x648>
    80006118:	fffff097          	auipc	ra,0xfffff
    8000611c:	7b4080e7          	jalr	1972(ra) # 800058cc <_Z11printStringPKc>
        printInt(sleep_time);
    80006120:	00000613          	li	a2,0
    80006124:	00a00593          	li	a1,10
    80006128:	0009051b          	sext.w	a0,s2
    8000612c:	00000097          	auipc	ra,0x0
    80006130:	950080e7          	jalr	-1712(ra) # 80005a7c <_Z8printIntiii>
        printString(" !\n");
    80006134:	00004517          	auipc	a0,0x4
    80006138:	58c50513          	addi	a0,a0,1420 # 8000a6c0 <_ZZ9kPrintIntmE6digits+0x650>
    8000613c:	fffff097          	auipc	ra,0xfffff
    80006140:	790080e7          	jalr	1936(ra) # 800058cc <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006144:	00090513          	mv	a0,s2
    80006148:	ffffb097          	auipc	ra,0xffffb
    8000614c:	32c080e7          	jalr	812(ra) # 80001474 <_Z10time_sleepm>
    while (--i > 0) {
    80006150:	fb9ff06f          	j	80006108 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006154:	00a00793          	li	a5,10
    80006158:	02f95933          	divu	s2,s2,a5
    8000615c:	fff90913          	addi	s2,s2,-1
    80006160:	00007797          	auipc	a5,0x7
    80006164:	b8078793          	addi	a5,a5,-1152 # 8000cce0 <_ZL8finished>
    80006168:	01278933          	add	s2,a5,s2
    8000616c:	00100793          	li	a5,1
    80006170:	00f90023          	sb	a5,0(s2)
}
    80006174:	01813083          	ld	ra,24(sp)
    80006178:	01013403          	ld	s0,16(sp)
    8000617c:	00813483          	ld	s1,8(sp)
    80006180:	00013903          	ld	s2,0(sp)
    80006184:	02010113          	addi	sp,sp,32
    80006188:	00008067          	ret

000000008000618c <_Z12testSleepingv>:

void testSleeping() {
    8000618c:	fc010113          	addi	sp,sp,-64
    80006190:	02113c23          	sd	ra,56(sp)
    80006194:	02813823          	sd	s0,48(sp)
    80006198:	02913423          	sd	s1,40(sp)
    8000619c:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800061a0:	00a00793          	li	a5,10
    800061a4:	fcf43823          	sd	a5,-48(s0)
    800061a8:	01400793          	li	a5,20
    800061ac:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800061b0:	00000493          	li	s1,0
    800061b4:	02c0006f          	j	800061e0 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800061b8:	00349793          	slli	a5,s1,0x3
    800061bc:	fd040613          	addi	a2,s0,-48
    800061c0:	00f60633          	add	a2,a2,a5
    800061c4:	00000597          	auipc	a1,0x0
    800061c8:	f2458593          	addi	a1,a1,-220 # 800060e8 <_ZL9sleepyRunPv>
    800061cc:	fc040513          	addi	a0,s0,-64
    800061d0:	00f50533          	add	a0,a0,a5
    800061d4:	ffffb097          	auipc	ra,0xffffb
    800061d8:	1a4080e7          	jalr	420(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800061dc:	0014849b          	addiw	s1,s1,1
    800061e0:	00100793          	li	a5,1
    800061e4:	fc97dae3          	bge	a5,s1,800061b8 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800061e8:	00007797          	auipc	a5,0x7
    800061ec:	af87c783          	lbu	a5,-1288(a5) # 8000cce0 <_ZL8finished>
    800061f0:	fe078ce3          	beqz	a5,800061e8 <_Z12testSleepingv+0x5c>
    800061f4:	00007797          	auipc	a5,0x7
    800061f8:	aed7c783          	lbu	a5,-1299(a5) # 8000cce1 <_ZL8finished+0x1>
    800061fc:	fe0786e3          	beqz	a5,800061e8 <_Z12testSleepingv+0x5c>
}
    80006200:	03813083          	ld	ra,56(sp)
    80006204:	03013403          	ld	s0,48(sp)
    80006208:	02813483          	ld	s1,40(sp)
    8000620c:	04010113          	addi	sp,sp,64
    80006210:	00008067          	ret

0000000080006214 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006214:	fe010113          	addi	sp,sp,-32
    80006218:	00113c23          	sd	ra,24(sp)
    8000621c:	00813823          	sd	s0,16(sp)
    80006220:	00913423          	sd	s1,8(sp)
    80006224:	01213023          	sd	s2,0(sp)
    80006228:	02010413          	addi	s0,sp,32
    8000622c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006230:	00100793          	li	a5,1
    80006234:	02a7f863          	bgeu	a5,a0,80006264 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006238:	00a00793          	li	a5,10
    8000623c:	02f577b3          	remu	a5,a0,a5
    80006240:	02078e63          	beqz	a5,8000627c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006244:	fff48513          	addi	a0,s1,-1
    80006248:	00000097          	auipc	ra,0x0
    8000624c:	fcc080e7          	jalr	-52(ra) # 80006214 <_ZL9fibonaccim>
    80006250:	00050913          	mv	s2,a0
    80006254:	ffe48513          	addi	a0,s1,-2
    80006258:	00000097          	auipc	ra,0x0
    8000625c:	fbc080e7          	jalr	-68(ra) # 80006214 <_ZL9fibonaccim>
    80006260:	00a90533          	add	a0,s2,a0
}
    80006264:	01813083          	ld	ra,24(sp)
    80006268:	01013403          	ld	s0,16(sp)
    8000626c:	00813483          	ld	s1,8(sp)
    80006270:	00013903          	ld	s2,0(sp)
    80006274:	02010113          	addi	sp,sp,32
    80006278:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000627c:	ffffb097          	auipc	ra,0xffffb
    80006280:	1b0080e7          	jalr	432(ra) # 8000142c <_Z15thread_dispatchv>
    80006284:	fc1ff06f          	j	80006244 <_ZL9fibonaccim+0x30>

0000000080006288 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006288:	fe010113          	addi	sp,sp,-32
    8000628c:	00113c23          	sd	ra,24(sp)
    80006290:	00813823          	sd	s0,16(sp)
    80006294:	00913423          	sd	s1,8(sp)
    80006298:	01213023          	sd	s2,0(sp)
    8000629c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800062a0:	00a00493          	li	s1,10
    800062a4:	0400006f          	j	800062e4 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800062a8:	00004517          	auipc	a0,0x4
    800062ac:	0e850513          	addi	a0,a0,232 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    800062b0:	fffff097          	auipc	ra,0xfffff
    800062b4:	61c080e7          	jalr	1564(ra) # 800058cc <_Z11printStringPKc>
    800062b8:	00000613          	li	a2,0
    800062bc:	00a00593          	li	a1,10
    800062c0:	00048513          	mv	a0,s1
    800062c4:	fffff097          	auipc	ra,0xfffff
    800062c8:	7b8080e7          	jalr	1976(ra) # 80005a7c <_Z8printIntiii>
    800062cc:	00004517          	auipc	a0,0x4
    800062d0:	2b450513          	addi	a0,a0,692 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800062d4:	fffff097          	auipc	ra,0xfffff
    800062d8:	5f8080e7          	jalr	1528(ra) # 800058cc <_Z11printStringPKc>
    for (; i < 13; i++) {
    800062dc:	0014849b          	addiw	s1,s1,1
    800062e0:	0ff4f493          	andi	s1,s1,255
    800062e4:	00c00793          	li	a5,12
    800062e8:	fc97f0e3          	bgeu	a5,s1,800062a8 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800062ec:	00004517          	auipc	a0,0x4
    800062f0:	0ac50513          	addi	a0,a0,172 # 8000a398 <_ZZ9kPrintIntmE6digits+0x328>
    800062f4:	fffff097          	auipc	ra,0xfffff
    800062f8:	5d8080e7          	jalr	1496(ra) # 800058cc <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800062fc:	00500313          	li	t1,5
    thread_dispatch();
    80006300:	ffffb097          	auipc	ra,0xffffb
    80006304:	12c080e7          	jalr	300(ra) # 8000142c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006308:	01000513          	li	a0,16
    8000630c:	00000097          	auipc	ra,0x0
    80006310:	f08080e7          	jalr	-248(ra) # 80006214 <_ZL9fibonaccim>
    80006314:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006318:	00004517          	auipc	a0,0x4
    8000631c:	09050513          	addi	a0,a0,144 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    80006320:	fffff097          	auipc	ra,0xfffff
    80006324:	5ac080e7          	jalr	1452(ra) # 800058cc <_Z11printStringPKc>
    80006328:	00000613          	li	a2,0
    8000632c:	00a00593          	li	a1,10
    80006330:	0009051b          	sext.w	a0,s2
    80006334:	fffff097          	auipc	ra,0xfffff
    80006338:	748080e7          	jalr	1864(ra) # 80005a7c <_Z8printIntiii>
    8000633c:	00004517          	auipc	a0,0x4
    80006340:	24450513          	addi	a0,a0,580 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006344:	fffff097          	auipc	ra,0xfffff
    80006348:	588080e7          	jalr	1416(ra) # 800058cc <_Z11printStringPKc>
    8000634c:	0400006f          	j	8000638c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006350:	00004517          	auipc	a0,0x4
    80006354:	04050513          	addi	a0,a0,64 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80006358:	fffff097          	auipc	ra,0xfffff
    8000635c:	574080e7          	jalr	1396(ra) # 800058cc <_Z11printStringPKc>
    80006360:	00000613          	li	a2,0
    80006364:	00a00593          	li	a1,10
    80006368:	00048513          	mv	a0,s1
    8000636c:	fffff097          	auipc	ra,0xfffff
    80006370:	710080e7          	jalr	1808(ra) # 80005a7c <_Z8printIntiii>
    80006374:	00004517          	auipc	a0,0x4
    80006378:	20c50513          	addi	a0,a0,524 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    8000637c:	fffff097          	auipc	ra,0xfffff
    80006380:	550080e7          	jalr	1360(ra) # 800058cc <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006384:	0014849b          	addiw	s1,s1,1
    80006388:	0ff4f493          	andi	s1,s1,255
    8000638c:	00f00793          	li	a5,15
    80006390:	fc97f0e3          	bgeu	a5,s1,80006350 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006394:	00004517          	auipc	a0,0x4
    80006398:	02450513          	addi	a0,a0,36 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    8000639c:	fffff097          	auipc	ra,0xfffff
    800063a0:	530080e7          	jalr	1328(ra) # 800058cc <_Z11printStringPKc>
    finishedD = true;
    800063a4:	00100793          	li	a5,1
    800063a8:	00007717          	auipc	a4,0x7
    800063ac:	92f70d23          	sb	a5,-1734(a4) # 8000cce2 <_ZL9finishedD>
    thread_dispatch();
    800063b0:	ffffb097          	auipc	ra,0xffffb
    800063b4:	07c080e7          	jalr	124(ra) # 8000142c <_Z15thread_dispatchv>
}
    800063b8:	01813083          	ld	ra,24(sp)
    800063bc:	01013403          	ld	s0,16(sp)
    800063c0:	00813483          	ld	s1,8(sp)
    800063c4:	00013903          	ld	s2,0(sp)
    800063c8:	02010113          	addi	sp,sp,32
    800063cc:	00008067          	ret

00000000800063d0 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800063d0:	fe010113          	addi	sp,sp,-32
    800063d4:	00113c23          	sd	ra,24(sp)
    800063d8:	00813823          	sd	s0,16(sp)
    800063dc:	00913423          	sd	s1,8(sp)
    800063e0:	01213023          	sd	s2,0(sp)
    800063e4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800063e8:	00000493          	li	s1,0
    800063ec:	0400006f          	j	8000642c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800063f0:	00004517          	auipc	a0,0x4
    800063f4:	f6050513          	addi	a0,a0,-160 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    800063f8:	fffff097          	auipc	ra,0xfffff
    800063fc:	4d4080e7          	jalr	1236(ra) # 800058cc <_Z11printStringPKc>
    80006400:	00000613          	li	a2,0
    80006404:	00a00593          	li	a1,10
    80006408:	00048513          	mv	a0,s1
    8000640c:	fffff097          	auipc	ra,0xfffff
    80006410:	670080e7          	jalr	1648(ra) # 80005a7c <_Z8printIntiii>
    80006414:	00004517          	auipc	a0,0x4
    80006418:	16c50513          	addi	a0,a0,364 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    8000641c:	fffff097          	auipc	ra,0xfffff
    80006420:	4b0080e7          	jalr	1200(ra) # 800058cc <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006424:	0014849b          	addiw	s1,s1,1
    80006428:	0ff4f493          	andi	s1,s1,255
    8000642c:	00200793          	li	a5,2
    80006430:	fc97f0e3          	bgeu	a5,s1,800063f0 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006434:	00004517          	auipc	a0,0x4
    80006438:	f2450513          	addi	a0,a0,-220 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    8000643c:	fffff097          	auipc	ra,0xfffff
    80006440:	490080e7          	jalr	1168(ra) # 800058cc <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006444:	00700313          	li	t1,7
    thread_dispatch();
    80006448:	ffffb097          	auipc	ra,0xffffb
    8000644c:	fe4080e7          	jalr	-28(ra) # 8000142c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006450:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006454:	00004517          	auipc	a0,0x4
    80006458:	f1450513          	addi	a0,a0,-236 # 8000a368 <_ZZ9kPrintIntmE6digits+0x2f8>
    8000645c:	fffff097          	auipc	ra,0xfffff
    80006460:	470080e7          	jalr	1136(ra) # 800058cc <_Z11printStringPKc>
    80006464:	00000613          	li	a2,0
    80006468:	00a00593          	li	a1,10
    8000646c:	0009051b          	sext.w	a0,s2
    80006470:	fffff097          	auipc	ra,0xfffff
    80006474:	60c080e7          	jalr	1548(ra) # 80005a7c <_Z8printIntiii>
    80006478:	00004517          	auipc	a0,0x4
    8000647c:	10850513          	addi	a0,a0,264 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80006480:	fffff097          	auipc	ra,0xfffff
    80006484:	44c080e7          	jalr	1100(ra) # 800058cc <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006488:	00c00513          	li	a0,12
    8000648c:	00000097          	auipc	ra,0x0
    80006490:	d88080e7          	jalr	-632(ra) # 80006214 <_ZL9fibonaccim>
    80006494:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006498:	00004517          	auipc	a0,0x4
    8000649c:	ed850513          	addi	a0,a0,-296 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    800064a0:	fffff097          	auipc	ra,0xfffff
    800064a4:	42c080e7          	jalr	1068(ra) # 800058cc <_Z11printStringPKc>
    800064a8:	00000613          	li	a2,0
    800064ac:	00a00593          	li	a1,10
    800064b0:	0009051b          	sext.w	a0,s2
    800064b4:	fffff097          	auipc	ra,0xfffff
    800064b8:	5c8080e7          	jalr	1480(ra) # 80005a7c <_Z8printIntiii>
    800064bc:	00004517          	auipc	a0,0x4
    800064c0:	0c450513          	addi	a0,a0,196 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800064c4:	fffff097          	auipc	ra,0xfffff
    800064c8:	408080e7          	jalr	1032(ra) # 800058cc <_Z11printStringPKc>
    800064cc:	0400006f          	j	8000650c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800064d0:	00004517          	auipc	a0,0x4
    800064d4:	e8050513          	addi	a0,a0,-384 # 8000a350 <_ZZ9kPrintIntmE6digits+0x2e0>
    800064d8:	fffff097          	auipc	ra,0xfffff
    800064dc:	3f4080e7          	jalr	1012(ra) # 800058cc <_Z11printStringPKc>
    800064e0:	00000613          	li	a2,0
    800064e4:	00a00593          	li	a1,10
    800064e8:	00048513          	mv	a0,s1
    800064ec:	fffff097          	auipc	ra,0xfffff
    800064f0:	590080e7          	jalr	1424(ra) # 80005a7c <_Z8printIntiii>
    800064f4:	00004517          	auipc	a0,0x4
    800064f8:	08c50513          	addi	a0,a0,140 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800064fc:	fffff097          	auipc	ra,0xfffff
    80006500:	3d0080e7          	jalr	976(ra) # 800058cc <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006504:	0014849b          	addiw	s1,s1,1
    80006508:	0ff4f493          	andi	s1,s1,255
    8000650c:	00500793          	li	a5,5
    80006510:	fc97f0e3          	bgeu	a5,s1,800064d0 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006514:	00004517          	auipc	a0,0x4
    80006518:	e1450513          	addi	a0,a0,-492 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    8000651c:	fffff097          	auipc	ra,0xfffff
    80006520:	3b0080e7          	jalr	944(ra) # 800058cc <_Z11printStringPKc>
    finishedC = true;
    80006524:	00100793          	li	a5,1
    80006528:	00006717          	auipc	a4,0x6
    8000652c:	7af70da3          	sb	a5,1979(a4) # 8000cce3 <_ZL9finishedC>
    thread_dispatch();
    80006530:	ffffb097          	auipc	ra,0xffffb
    80006534:	efc080e7          	jalr	-260(ra) # 8000142c <_Z15thread_dispatchv>
}
    80006538:	01813083          	ld	ra,24(sp)
    8000653c:	01013403          	ld	s0,16(sp)
    80006540:	00813483          	ld	s1,8(sp)
    80006544:	00013903          	ld	s2,0(sp)
    80006548:	02010113          	addi	sp,sp,32
    8000654c:	00008067          	ret

0000000080006550 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006550:	fe010113          	addi	sp,sp,-32
    80006554:	00113c23          	sd	ra,24(sp)
    80006558:	00813823          	sd	s0,16(sp)
    8000655c:	00913423          	sd	s1,8(sp)
    80006560:	01213023          	sd	s2,0(sp)
    80006564:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006568:	00000913          	li	s2,0
    8000656c:	0400006f          	j	800065ac <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006570:	ffffb097          	auipc	ra,0xffffb
    80006574:	ebc080e7          	jalr	-324(ra) # 8000142c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006578:	00148493          	addi	s1,s1,1
    8000657c:	000027b7          	lui	a5,0x2
    80006580:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006584:	0097ee63          	bltu	a5,s1,800065a0 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006588:	00000713          	li	a4,0
    8000658c:	000077b7          	lui	a5,0x7
    80006590:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006594:	fce7eee3          	bltu	a5,a4,80006570 <_ZL11workerBodyBPv+0x20>
    80006598:	00170713          	addi	a4,a4,1
    8000659c:	ff1ff06f          	j	8000658c <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    800065a0:	00a00793          	li	a5,10
    800065a4:	04f90663          	beq	s2,a5,800065f0 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    800065a8:	00190913          	addi	s2,s2,1
    800065ac:	00f00793          	li	a5,15
    800065b0:	0527e463          	bltu	a5,s2,800065f8 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    800065b4:	00004517          	auipc	a0,0x4
    800065b8:	d8450513          	addi	a0,a0,-636 # 8000a338 <_ZZ9kPrintIntmE6digits+0x2c8>
    800065bc:	fffff097          	auipc	ra,0xfffff
    800065c0:	310080e7          	jalr	784(ra) # 800058cc <_Z11printStringPKc>
    800065c4:	00000613          	li	a2,0
    800065c8:	00a00593          	li	a1,10
    800065cc:	0009051b          	sext.w	a0,s2
    800065d0:	fffff097          	auipc	ra,0xfffff
    800065d4:	4ac080e7          	jalr	1196(ra) # 80005a7c <_Z8printIntiii>
    800065d8:	00004517          	auipc	a0,0x4
    800065dc:	fa850513          	addi	a0,a0,-88 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800065e0:	fffff097          	auipc	ra,0xfffff
    800065e4:	2ec080e7          	jalr	748(ra) # 800058cc <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800065e8:	00000493          	li	s1,0
    800065ec:	f91ff06f          	j	8000657c <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800065f0:	14102ff3          	csrr	t6,sepc
    800065f4:	fb5ff06f          	j	800065a8 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800065f8:	00004517          	auipc	a0,0x4
    800065fc:	d4850513          	addi	a0,a0,-696 # 8000a340 <_ZZ9kPrintIntmE6digits+0x2d0>
    80006600:	fffff097          	auipc	ra,0xfffff
    80006604:	2cc080e7          	jalr	716(ra) # 800058cc <_Z11printStringPKc>
    finishedB = true;
    80006608:	00100793          	li	a5,1
    8000660c:	00006717          	auipc	a4,0x6
    80006610:	6cf70c23          	sb	a5,1752(a4) # 8000cce4 <_ZL9finishedB>
    thread_dispatch();
    80006614:	ffffb097          	auipc	ra,0xffffb
    80006618:	e18080e7          	jalr	-488(ra) # 8000142c <_Z15thread_dispatchv>
}
    8000661c:	01813083          	ld	ra,24(sp)
    80006620:	01013403          	ld	s0,16(sp)
    80006624:	00813483          	ld	s1,8(sp)
    80006628:	00013903          	ld	s2,0(sp)
    8000662c:	02010113          	addi	sp,sp,32
    80006630:	00008067          	ret

0000000080006634 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006634:	fe010113          	addi	sp,sp,-32
    80006638:	00113c23          	sd	ra,24(sp)
    8000663c:	00813823          	sd	s0,16(sp)
    80006640:	00913423          	sd	s1,8(sp)
    80006644:	01213023          	sd	s2,0(sp)
    80006648:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000664c:	00000913          	li	s2,0
    80006650:	0380006f          	j	80006688 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006654:	ffffb097          	auipc	ra,0xffffb
    80006658:	dd8080e7          	jalr	-552(ra) # 8000142c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000665c:	00148493          	addi	s1,s1,1
    80006660:	000027b7          	lui	a5,0x2
    80006664:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006668:	0097ee63          	bltu	a5,s1,80006684 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000666c:	00000713          	li	a4,0
    80006670:	000077b7          	lui	a5,0x7
    80006674:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006678:	fce7eee3          	bltu	a5,a4,80006654 <_ZL11workerBodyAPv+0x20>
    8000667c:	00170713          	addi	a4,a4,1
    80006680:	ff1ff06f          	j	80006670 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006684:	00190913          	addi	s2,s2,1
    80006688:	00900793          	li	a5,9
    8000668c:	0527e063          	bltu	a5,s2,800066cc <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006690:	00004517          	auipc	a0,0x4
    80006694:	c9050513          	addi	a0,a0,-880 # 8000a320 <_ZZ9kPrintIntmE6digits+0x2b0>
    80006698:	fffff097          	auipc	ra,0xfffff
    8000669c:	234080e7          	jalr	564(ra) # 800058cc <_Z11printStringPKc>
    800066a0:	00000613          	li	a2,0
    800066a4:	00a00593          	li	a1,10
    800066a8:	0009051b          	sext.w	a0,s2
    800066ac:	fffff097          	auipc	ra,0xfffff
    800066b0:	3d0080e7          	jalr	976(ra) # 80005a7c <_Z8printIntiii>
    800066b4:	00004517          	auipc	a0,0x4
    800066b8:	ecc50513          	addi	a0,a0,-308 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800066bc:	fffff097          	auipc	ra,0xfffff
    800066c0:	210080e7          	jalr	528(ra) # 800058cc <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800066c4:	00000493          	li	s1,0
    800066c8:	f99ff06f          	j	80006660 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800066cc:	00004517          	auipc	a0,0x4
    800066d0:	c5c50513          	addi	a0,a0,-932 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    800066d4:	fffff097          	auipc	ra,0xfffff
    800066d8:	1f8080e7          	jalr	504(ra) # 800058cc <_Z11printStringPKc>
    finishedA = true;
    800066dc:	00100793          	li	a5,1
    800066e0:	00006717          	auipc	a4,0x6
    800066e4:	60f702a3          	sb	a5,1541(a4) # 8000cce5 <_ZL9finishedA>
}
    800066e8:	01813083          	ld	ra,24(sp)
    800066ec:	01013403          	ld	s0,16(sp)
    800066f0:	00813483          	ld	s1,8(sp)
    800066f4:	00013903          	ld	s2,0(sp)
    800066f8:	02010113          	addi	sp,sp,32
    800066fc:	00008067          	ret

0000000080006700 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006700:	fd010113          	addi	sp,sp,-48
    80006704:	02113423          	sd	ra,40(sp)
    80006708:	02813023          	sd	s0,32(sp)
    8000670c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006710:	00000613          	li	a2,0
    80006714:	00000597          	auipc	a1,0x0
    80006718:	f2058593          	addi	a1,a1,-224 # 80006634 <_ZL11workerBodyAPv>
    8000671c:	fd040513          	addi	a0,s0,-48
    80006720:	ffffb097          	auipc	ra,0xffffb
    80006724:	c58080e7          	jalr	-936(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006728:	00004517          	auipc	a0,0x4
    8000672c:	ca050513          	addi	a0,a0,-864 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80006730:	fffff097          	auipc	ra,0xfffff
    80006734:	19c080e7          	jalr	412(ra) # 800058cc <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006738:	00000613          	li	a2,0
    8000673c:	00000597          	auipc	a1,0x0
    80006740:	e1458593          	addi	a1,a1,-492 # 80006550 <_ZL11workerBodyBPv>
    80006744:	fd840513          	addi	a0,s0,-40
    80006748:	ffffb097          	auipc	ra,0xffffb
    8000674c:	c30080e7          	jalr	-976(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006750:	00004517          	auipc	a0,0x4
    80006754:	c9050513          	addi	a0,a0,-880 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80006758:	fffff097          	auipc	ra,0xfffff
    8000675c:	174080e7          	jalr	372(ra) # 800058cc <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006760:	00000613          	li	a2,0
    80006764:	00000597          	auipc	a1,0x0
    80006768:	c6c58593          	addi	a1,a1,-916 # 800063d0 <_ZL11workerBodyCPv>
    8000676c:	fe040513          	addi	a0,s0,-32
    80006770:	ffffb097          	auipc	ra,0xffffb
    80006774:	c08080e7          	jalr	-1016(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006778:	00004517          	auipc	a0,0x4
    8000677c:	c8050513          	addi	a0,a0,-896 # 8000a3f8 <_ZZ9kPrintIntmE6digits+0x388>
    80006780:	fffff097          	auipc	ra,0xfffff
    80006784:	14c080e7          	jalr	332(ra) # 800058cc <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006788:	00000613          	li	a2,0
    8000678c:	00000597          	auipc	a1,0x0
    80006790:	afc58593          	addi	a1,a1,-1284 # 80006288 <_ZL11workerBodyDPv>
    80006794:	fe840513          	addi	a0,s0,-24
    80006798:	ffffb097          	auipc	ra,0xffffb
    8000679c:	be0080e7          	jalr	-1056(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800067a0:	00004517          	auipc	a0,0x4
    800067a4:	c7050513          	addi	a0,a0,-912 # 8000a410 <_ZZ9kPrintIntmE6digits+0x3a0>
    800067a8:	fffff097          	auipc	ra,0xfffff
    800067ac:	124080e7          	jalr	292(ra) # 800058cc <_Z11printStringPKc>
    800067b0:	00c0006f          	j	800067bc <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800067b4:	ffffb097          	auipc	ra,0xffffb
    800067b8:	c78080e7          	jalr	-904(ra) # 8000142c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800067bc:	00006797          	auipc	a5,0x6
    800067c0:	5297c783          	lbu	a5,1321(a5) # 8000cce5 <_ZL9finishedA>
    800067c4:	fe0788e3          	beqz	a5,800067b4 <_Z16System_Mode_testv+0xb4>
    800067c8:	00006797          	auipc	a5,0x6
    800067cc:	51c7c783          	lbu	a5,1308(a5) # 8000cce4 <_ZL9finishedB>
    800067d0:	fe0782e3          	beqz	a5,800067b4 <_Z16System_Mode_testv+0xb4>
    800067d4:	00006797          	auipc	a5,0x6
    800067d8:	50f7c783          	lbu	a5,1295(a5) # 8000cce3 <_ZL9finishedC>
    800067dc:	fc078ce3          	beqz	a5,800067b4 <_Z16System_Mode_testv+0xb4>
    800067e0:	00006797          	auipc	a5,0x6
    800067e4:	5027c783          	lbu	a5,1282(a5) # 8000cce2 <_ZL9finishedD>
    800067e8:	fc0786e3          	beqz	a5,800067b4 <_Z16System_Mode_testv+0xb4>
    }

}
    800067ec:	02813083          	ld	ra,40(sp)
    800067f0:	02013403          	ld	s0,32(sp)
    800067f4:	03010113          	addi	sp,sp,48
    800067f8:	00008067          	ret

00000000800067fc <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800067fc:	fe010113          	addi	sp,sp,-32
    80006800:	00113c23          	sd	ra,24(sp)
    80006804:	00813823          	sd	s0,16(sp)
    80006808:	00913423          	sd	s1,8(sp)
    8000680c:	01213023          	sd	s2,0(sp)
    80006810:	02010413          	addi	s0,sp,32
    80006814:	00050493          	mv	s1,a0
    80006818:	00058913          	mv	s2,a1
    8000681c:	0015879b          	addiw	a5,a1,1
    80006820:	0007851b          	sext.w	a0,a5
    80006824:	00f4a023          	sw	a5,0(s1)
    80006828:	0004a823          	sw	zero,16(s1)
    8000682c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006830:	00251513          	slli	a0,a0,0x2
    80006834:	ffffb097          	auipc	ra,0xffffb
    80006838:	ad4080e7          	jalr	-1324(ra) # 80001308 <_Z9mem_allocm>
    8000683c:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006840:	00000593          	li	a1,0
    80006844:	02048513          	addi	a0,s1,32
    80006848:	ffffb097          	auipc	ra,0xffffb
    8000684c:	c5c080e7          	jalr	-932(ra) # 800014a4 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006850:	00090593          	mv	a1,s2
    80006854:	01848513          	addi	a0,s1,24
    80006858:	ffffb097          	auipc	ra,0xffffb
    8000685c:	c4c080e7          	jalr	-948(ra) # 800014a4 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006860:	00100593          	li	a1,1
    80006864:	02848513          	addi	a0,s1,40
    80006868:	ffffb097          	auipc	ra,0xffffb
    8000686c:	c3c080e7          	jalr	-964(ra) # 800014a4 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006870:	00100593          	li	a1,1
    80006874:	03048513          	addi	a0,s1,48
    80006878:	ffffb097          	auipc	ra,0xffffb
    8000687c:	c2c080e7          	jalr	-980(ra) # 800014a4 <_Z8sem_openPP4KSemj>
}
    80006880:	01813083          	ld	ra,24(sp)
    80006884:	01013403          	ld	s0,16(sp)
    80006888:	00813483          	ld	s1,8(sp)
    8000688c:	00013903          	ld	s2,0(sp)
    80006890:	02010113          	addi	sp,sp,32
    80006894:	00008067          	ret

0000000080006898 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006898:	fe010113          	addi	sp,sp,-32
    8000689c:	00113c23          	sd	ra,24(sp)
    800068a0:	00813823          	sd	s0,16(sp)
    800068a4:	00913423          	sd	s1,8(sp)
    800068a8:	01213023          	sd	s2,0(sp)
    800068ac:	02010413          	addi	s0,sp,32
    800068b0:	00050493          	mv	s1,a0
    800068b4:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800068b8:	01853503          	ld	a0,24(a0)
    800068bc:	ffffb097          	auipc	ra,0xffffb
    800068c0:	c50080e7          	jalr	-944(ra) # 8000150c <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    800068c4:	0304b503          	ld	a0,48(s1)
    800068c8:	ffffb097          	auipc	ra,0xffffb
    800068cc:	c44080e7          	jalr	-956(ra) # 8000150c <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    800068d0:	0084b783          	ld	a5,8(s1)
    800068d4:	0144a703          	lw	a4,20(s1)
    800068d8:	00271713          	slli	a4,a4,0x2
    800068dc:	00e787b3          	add	a5,a5,a4
    800068e0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800068e4:	0144a783          	lw	a5,20(s1)
    800068e8:	0017879b          	addiw	a5,a5,1
    800068ec:	0004a703          	lw	a4,0(s1)
    800068f0:	02e7e7bb          	remw	a5,a5,a4
    800068f4:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800068f8:	0304b503          	ld	a0,48(s1)
    800068fc:	ffffb097          	auipc	ra,0xffffb
    80006900:	c40080e7          	jalr	-960(ra) # 8000153c <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006904:	0204b503          	ld	a0,32(s1)
    80006908:	ffffb097          	auipc	ra,0xffffb
    8000690c:	c34080e7          	jalr	-972(ra) # 8000153c <_Z10sem_signalP4KSem>

}
    80006910:	01813083          	ld	ra,24(sp)
    80006914:	01013403          	ld	s0,16(sp)
    80006918:	00813483          	ld	s1,8(sp)
    8000691c:	00013903          	ld	s2,0(sp)
    80006920:	02010113          	addi	sp,sp,32
    80006924:	00008067          	ret

0000000080006928 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006928:	fe010113          	addi	sp,sp,-32
    8000692c:	00113c23          	sd	ra,24(sp)
    80006930:	00813823          	sd	s0,16(sp)
    80006934:	00913423          	sd	s1,8(sp)
    80006938:	01213023          	sd	s2,0(sp)
    8000693c:	02010413          	addi	s0,sp,32
    80006940:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006944:	02053503          	ld	a0,32(a0)
    80006948:	ffffb097          	auipc	ra,0xffffb
    8000694c:	bc4080e7          	jalr	-1084(ra) # 8000150c <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006950:	0284b503          	ld	a0,40(s1)
    80006954:	ffffb097          	auipc	ra,0xffffb
    80006958:	bb8080e7          	jalr	-1096(ra) # 8000150c <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    8000695c:	0084b703          	ld	a4,8(s1)
    80006960:	0104a783          	lw	a5,16(s1)
    80006964:	00279693          	slli	a3,a5,0x2
    80006968:	00d70733          	add	a4,a4,a3
    8000696c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006970:	0017879b          	addiw	a5,a5,1
    80006974:	0004a703          	lw	a4,0(s1)
    80006978:	02e7e7bb          	remw	a5,a5,a4
    8000697c:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006980:	0284b503          	ld	a0,40(s1)
    80006984:	ffffb097          	auipc	ra,0xffffb
    80006988:	bb8080e7          	jalr	-1096(ra) # 8000153c <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    8000698c:	0184b503          	ld	a0,24(s1)
    80006990:	ffffb097          	auipc	ra,0xffffb
    80006994:	bac080e7          	jalr	-1108(ra) # 8000153c <_Z10sem_signalP4KSem>

    return ret;
}
    80006998:	00090513          	mv	a0,s2
    8000699c:	01813083          	ld	ra,24(sp)
    800069a0:	01013403          	ld	s0,16(sp)
    800069a4:	00813483          	ld	s1,8(sp)
    800069a8:	00013903          	ld	s2,0(sp)
    800069ac:	02010113          	addi	sp,sp,32
    800069b0:	00008067          	ret

00000000800069b4 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800069b4:	fe010113          	addi	sp,sp,-32
    800069b8:	00113c23          	sd	ra,24(sp)
    800069bc:	00813823          	sd	s0,16(sp)
    800069c0:	00913423          	sd	s1,8(sp)
    800069c4:	01213023          	sd	s2,0(sp)
    800069c8:	02010413          	addi	s0,sp,32
    800069cc:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800069d0:	02853503          	ld	a0,40(a0)
    800069d4:	ffffb097          	auipc	ra,0xffffb
    800069d8:	b38080e7          	jalr	-1224(ra) # 8000150c <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    800069dc:	0304b503          	ld	a0,48(s1)
    800069e0:	ffffb097          	auipc	ra,0xffffb
    800069e4:	b2c080e7          	jalr	-1236(ra) # 8000150c <_Z8sem_waitP4KSem>

    if (tail >= head) {
    800069e8:	0144a783          	lw	a5,20(s1)
    800069ec:	0104a903          	lw	s2,16(s1)
    800069f0:	0327ce63          	blt	a5,s2,80006a2c <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800069f4:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800069f8:	0304b503          	ld	a0,48(s1)
    800069fc:	ffffb097          	auipc	ra,0xffffb
    80006a00:	b40080e7          	jalr	-1216(ra) # 8000153c <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006a04:	0284b503          	ld	a0,40(s1)
    80006a08:	ffffb097          	auipc	ra,0xffffb
    80006a0c:	b34080e7          	jalr	-1228(ra) # 8000153c <_Z10sem_signalP4KSem>

    return ret;
}
    80006a10:	00090513          	mv	a0,s2
    80006a14:	01813083          	ld	ra,24(sp)
    80006a18:	01013403          	ld	s0,16(sp)
    80006a1c:	00813483          	ld	s1,8(sp)
    80006a20:	00013903          	ld	s2,0(sp)
    80006a24:	02010113          	addi	sp,sp,32
    80006a28:	00008067          	ret
        ret = cap - head + tail;
    80006a2c:	0004a703          	lw	a4,0(s1)
    80006a30:	4127093b          	subw	s2,a4,s2
    80006a34:	00f9093b          	addw	s2,s2,a5
    80006a38:	fc1ff06f          	j	800069f8 <_ZN6Buffer6getCntEv+0x44>

0000000080006a3c <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006a3c:	fe010113          	addi	sp,sp,-32
    80006a40:	00113c23          	sd	ra,24(sp)
    80006a44:	00813823          	sd	s0,16(sp)
    80006a48:	00913423          	sd	s1,8(sp)
    80006a4c:	02010413          	addi	s0,sp,32
    80006a50:	00050493          	mv	s1,a0
    putc('\n');
    80006a54:	00a00513          	li	a0,10
    80006a58:	ffffb097          	auipc	ra,0xffffb
    80006a5c:	b3c080e7          	jalr	-1220(ra) # 80001594 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006a60:	00004517          	auipc	a0,0x4
    80006a64:	9c850513          	addi	a0,a0,-1592 # 8000a428 <_ZZ9kPrintIntmE6digits+0x3b8>
    80006a68:	fffff097          	auipc	ra,0xfffff
    80006a6c:	e64080e7          	jalr	-412(ra) # 800058cc <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006a70:	00048513          	mv	a0,s1
    80006a74:	00000097          	auipc	ra,0x0
    80006a78:	f40080e7          	jalr	-192(ra) # 800069b4 <_ZN6Buffer6getCntEv>
    80006a7c:	02a05c63          	blez	a0,80006ab4 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006a80:	0084b783          	ld	a5,8(s1)
    80006a84:	0104a703          	lw	a4,16(s1)
    80006a88:	00271713          	slli	a4,a4,0x2
    80006a8c:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006a90:	0007c503          	lbu	a0,0(a5)
    80006a94:	ffffb097          	auipc	ra,0xffffb
    80006a98:	b00080e7          	jalr	-1280(ra) # 80001594 <_Z4putcc>
        head = (head + 1) % cap;
    80006a9c:	0104a783          	lw	a5,16(s1)
    80006aa0:	0017879b          	addiw	a5,a5,1
    80006aa4:	0004a703          	lw	a4,0(s1)
    80006aa8:	02e7e7bb          	remw	a5,a5,a4
    80006aac:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006ab0:	fc1ff06f          	j	80006a70 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006ab4:	02100513          	li	a0,33
    80006ab8:	ffffb097          	auipc	ra,0xffffb
    80006abc:	adc080e7          	jalr	-1316(ra) # 80001594 <_Z4putcc>
    putc('\n');
    80006ac0:	00a00513          	li	a0,10
    80006ac4:	ffffb097          	auipc	ra,0xffffb
    80006ac8:	ad0080e7          	jalr	-1328(ra) # 80001594 <_Z4putcc>
    mem_free(buffer);
    80006acc:	0084b503          	ld	a0,8(s1)
    80006ad0:	ffffb097          	auipc	ra,0xffffb
    80006ad4:	878080e7          	jalr	-1928(ra) # 80001348 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006ad8:	0204b503          	ld	a0,32(s1)
    80006adc:	ffffb097          	auipc	ra,0xffffb
    80006ae0:	a00080e7          	jalr	-1536(ra) # 800014dc <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006ae4:	0184b503          	ld	a0,24(s1)
    80006ae8:	ffffb097          	auipc	ra,0xffffb
    80006aec:	9f4080e7          	jalr	-1548(ra) # 800014dc <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006af0:	0304b503          	ld	a0,48(s1)
    80006af4:	ffffb097          	auipc	ra,0xffffb
    80006af8:	9e8080e7          	jalr	-1560(ra) # 800014dc <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006afc:	0284b503          	ld	a0,40(s1)
    80006b00:	ffffb097          	auipc	ra,0xffffb
    80006b04:	9dc080e7          	jalr	-1572(ra) # 800014dc <_Z9sem_closeP4KSem>
}
    80006b08:	01813083          	ld	ra,24(sp)
    80006b0c:	01013403          	ld	s0,16(sp)
    80006b10:	00813483          	ld	s1,8(sp)
    80006b14:	02010113          	addi	sp,sp,32
    80006b18:	00008067          	ret

0000000080006b1c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80006b1c:	fa010113          	addi	sp,sp,-96
    80006b20:	04813c23          	sd	s0,88(sp)
    80006b24:	06010413          	addi	s0,sp,96
    80006b28:	faa43423          	sd	a0,-88(s0)
    80006b2c:	00058793          	mv	a5,a1
    80006b30:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80006b34:	fa843783          	ld	a5,-88(s0)
    80006b38:	00079663          	bnez	a5,80006b44 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80006b3c:	00000793          	li	a5,0
    80006b40:	2040006f          	j	80006d44 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80006b44:	fa843783          	ld	a5,-88(s0)
    80006b48:	0067d713          	srli	a4,a5,0x6
    80006b4c:	fa843783          	ld	a5,-88(s0)
    80006b50:	03f7f793          	andi	a5,a5,63
    80006b54:	00078663          	beqz	a5,80006b60 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80006b58:	00100793          	li	a5,1
    80006b5c:	0080006f          	j	80006b64 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80006b60:	00000793          	li	a5,0
    80006b64:	00e787b3          	add	a5,a5,a4
    80006b68:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80006b6c:	fc843783          	ld	a5,-56(s0)
    80006b70:	00679793          	slli	a5,a5,0x6
    80006b74:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    80006b78:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80006b7c:	00006797          	auipc	a5,0x6
    80006b80:	17478793          	addi	a5,a5,372 # 8000ccf0 <_ZN15MemoryAllocator11freeMemHeadE>
    80006b84:	0007b783          	ld	a5,0(a5)
    80006b88:	fef43023          	sd	a5,-32(s0)
    80006b8c:	fe043783          	ld	a5,-32(s0)
    80006b90:	1a078863          	beqz	a5,80006d40 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    80006b94:	fe043783          	ld	a5,-32(s0)
    80006b98:	0087b783          	ld	a5,8(a5)
    80006b9c:	fa843703          	ld	a4,-88(s0)
    80006ba0:	18e7e263          	bltu	a5,a4,80006d24 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    80006ba4:	fe043703          	ld	a4,-32(s0)
    80006ba8:	fa843783          	ld	a5,-88(s0)
    80006bac:	00f707b3          	add	a5,a4,a5
    80006bb0:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    80006bb4:	fe043783          	ld	a5,-32(s0)
    80006bb8:	0087b703          	ld	a4,8(a5)
    80006bbc:	fa843783          	ld	a5,-88(s0)
    80006bc0:	40f707b3          	sub	a5,a4,a5
    80006bc4:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80006bc8:	fb843703          	ld	a4,-72(s0)
    80006bcc:	02000793          	li	a5,32
    80006bd0:	04e7e463          	bltu	a5,a4,80006c18 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    80006bd4:	fa843703          	ld	a4,-88(s0)
    80006bd8:	fb843783          	ld	a5,-72(s0)
    80006bdc:	00f707b3          	add	a5,a4,a5
    80006be0:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    80006be4:	fe843783          	ld	a5,-24(s0)
    80006be8:	00078c63          	beqz	a5,80006c00 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    80006bec:	fe043783          	ld	a5,-32(s0)
    80006bf0:	0007b703          	ld	a4,0(a5)
    80006bf4:	fe843783          	ld	a5,-24(s0)
    80006bf8:	00e7b023          	sd	a4,0(a5)
    80006bfc:	0600006f          	j	80006c5c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    80006c00:	fe043783          	ld	a5,-32(s0)
    80006c04:	0007b703          	ld	a4,0(a5)
    80006c08:	00006797          	auipc	a5,0x6
    80006c0c:	0e878793          	addi	a5,a5,232 # 8000ccf0 <_ZN15MemoryAllocator11freeMemHeadE>
    80006c10:	00e7b023          	sd	a4,0(a5)
    80006c14:	0480006f          	j	80006c5c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    80006c18:	fc043783          	ld	a5,-64(s0)
    80006c1c:	fb843703          	ld	a4,-72(s0)
    80006c20:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    80006c24:	fe043783          	ld	a5,-32(s0)
    80006c28:	0007b703          	ld	a4,0(a5)
    80006c2c:	fc043783          	ld	a5,-64(s0)
    80006c30:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    80006c34:	fe843783          	ld	a5,-24(s0)
    80006c38:	00078a63          	beqz	a5,80006c4c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    80006c3c:	fe843783          	ld	a5,-24(s0)
    80006c40:	fc043703          	ld	a4,-64(s0)
    80006c44:	00e7b023          	sd	a4,0(a5)
    80006c48:	0140006f          	j	80006c5c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    80006c4c:	00006797          	auipc	a5,0x6
    80006c50:	0a478793          	addi	a5,a5,164 # 8000ccf0 <_ZN15MemoryAllocator11freeMemHeadE>
    80006c54:	fc043703          	ld	a4,-64(s0)
    80006c58:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    80006c5c:	fe043783          	ld	a5,-32(s0)
    80006c60:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    80006c64:	fb043783          	ld	a5,-80(s0)
    80006c68:	fa843703          	ld	a4,-88(s0)
    80006c6c:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    80006c70:	fb043783          	ld	a5,-80(s0)
    80006c74:	fa442703          	lw	a4,-92(s0)
    80006c78:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    80006c7c:	fb043783          	ld	a5,-80(s0)
    80006c80:	02078713          	addi	a4,a5,32
    80006c84:	fb043783          	ld	a5,-80(s0)
    80006c88:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    80006c8c:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80006c90:	00006797          	auipc	a5,0x6
    80006c94:	05878793          	addi	a5,a5,88 # 8000cce8 <_ZN15MemoryAllocator11usedMemHeadE>
    80006c98:	0007b783          	ld	a5,0(a5)
    80006c9c:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80006ca0:	fd043783          	ld	a5,-48(s0)
    80006ca4:	02078463          	beqz	a5,80006ccc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    80006ca8:	fd043703          	ld	a4,-48(s0)
    80006cac:	fb043783          	ld	a5,-80(s0)
    80006cb0:	00f77e63          	bgeu	a4,a5,80006ccc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    80006cb4:	fd043783          	ld	a5,-48(s0)
    80006cb8:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80006cbc:	fd043783          	ld	a5,-48(s0)
    80006cc0:	0007b783          	ld	a5,0(a5)
    80006cc4:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80006cc8:	fd9ff06f          	j	80006ca0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    80006ccc:	fd843783          	ld	a5,-40(s0)
    80006cd0:	02079663          	bnez	a5,80006cfc <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    80006cd4:	00006797          	auipc	a5,0x6
    80006cd8:	01478793          	addi	a5,a5,20 # 8000cce8 <_ZN15MemoryAllocator11usedMemHeadE>
    80006cdc:	0007b703          	ld	a4,0(a5)
    80006ce0:	fb043783          	ld	a5,-80(s0)
    80006ce4:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    80006ce8:	00006797          	auipc	a5,0x6
    80006cec:	00078793          	mv	a5,a5
    80006cf0:	fb043703          	ld	a4,-80(s0)
    80006cf4:	00e7b023          	sd	a4,0(a5) # 8000cce8 <_ZN15MemoryAllocator11usedMemHeadE>
    80006cf8:	0200006f          	j	80006d18 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    80006cfc:	fd843783          	ld	a5,-40(s0)
    80006d00:	0007b703          	ld	a4,0(a5)
    80006d04:	fb043783          	ld	a5,-80(s0)
    80006d08:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    80006d0c:	fd843783          	ld	a5,-40(s0)
    80006d10:	fb043703          	ld	a4,-80(s0)
    80006d14:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    80006d18:	fb043783          	ld	a5,-80(s0)
    80006d1c:	0187b783          	ld	a5,24(a5)
    80006d20:	0240006f          	j	80006d44 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    80006d24:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80006d28:	fe043783          	ld	a5,-32(s0)
    80006d2c:	fef43423          	sd	a5,-24(s0)
    80006d30:	fe043783          	ld	a5,-32(s0)
    80006d34:	0007b783          	ld	a5,0(a5)
    80006d38:	fef43023          	sd	a5,-32(s0)
    80006d3c:	e51ff06f          	j	80006b8c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    80006d40:	00000793          	li	a5,0
}
    80006d44:	00078513          	mv	a0,a5
    80006d48:	05813403          	ld	s0,88(sp)
    80006d4c:	06010113          	addi	sp,sp,96
    80006d50:	00008067          	ret

0000000080006d54 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80006d54:	fb010113          	addi	sp,sp,-80
    80006d58:	04113423          	sd	ra,72(sp)
    80006d5c:	04813023          	sd	s0,64(sp)
    80006d60:	05010413          	addi	s0,sp,80
    80006d64:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    80006d68:	fb843783          	ld	a5,-72(s0)
    80006d6c:	00079663          	bnez	a5,80006d78 <_ZN15MemoryAllocator5kfreeEPv+0x24>
    80006d70:	00000793          	li	a5,0
    80006d74:	1740006f          	j	80006ee8 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    80006d78:	00006797          	auipc	a5,0x6
    80006d7c:	f7078793          	addi	a5,a5,-144 # 8000cce8 <_ZN15MemoryAllocator11usedMemHeadE>
    80006d80:	0007b783          	ld	a5,0(a5)
    80006d84:	00079663          	bnez	a5,80006d90 <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    80006d88:	fff00793          	li	a5,-1
    80006d8c:	15c0006f          	j	80006ee8 <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80006d90:	fb843783          	ld	a5,-72(s0)
    80006d94:	fe078793          	addi	a5,a5,-32
    80006d98:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    80006d9c:	00006797          	auipc	a5,0x6
    80006da0:	f4c78793          	addi	a5,a5,-180 # 8000cce8 <_ZN15MemoryAllocator11usedMemHeadE>
    80006da4:	0007b783          	ld	a5,0(a5)
    80006da8:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    80006dac:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80006db0:	fe843783          	ld	a5,-24(s0)
    80006db4:	02078463          	beqz	a5,80006ddc <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80006db8:	fe843703          	ld	a4,-24(s0)
    80006dbc:	fb843783          	ld	a5,-72(s0)
    80006dc0:	00f70e63          	beq	a4,a5,80006ddc <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    80006dc4:	fe843783          	ld	a5,-24(s0)
    80006dc8:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    80006dcc:	fe843783          	ld	a5,-24(s0)
    80006dd0:	0007b783          	ld	a5,0(a5)
    80006dd4:	fef43423          	sd	a5,-24(s0)
    80006dd8:	fd9ff06f          	j	80006db0 <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80006ddc:	fe843703          	ld	a4,-24(s0)
    80006de0:	fb843783          	ld	a5,-72(s0)
    80006de4:	00f70663          	beq	a4,a5,80006df0 <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    80006de8:	fff00793          	li	a5,-1
    80006dec:	0fc0006f          	j	80006ee8 <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    80006df0:	fe043783          	ld	a5,-32(s0)
    80006df4:	00078c63          	beqz	a5,80006e0c <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80006df8:	fe843783          	ld	a5,-24(s0)
    80006dfc:	0007b703          	ld	a4,0(a5)
    80006e00:	fe043783          	ld	a5,-32(s0)
    80006e04:	00e7b023          	sd	a4,0(a5)
    80006e08:	0180006f          	j	80006e20 <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    80006e0c:	fe843783          	ld	a5,-24(s0)
    80006e10:	0007b703          	ld	a4,0(a5)
    80006e14:	00006797          	auipc	a5,0x6
    80006e18:	ed478793          	addi	a5,a5,-300 # 8000cce8 <_ZN15MemoryAllocator11usedMemHeadE>
    80006e1c:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    80006e20:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    80006e24:	00006797          	auipc	a5,0x6
    80006e28:	ecc78793          	addi	a5,a5,-308 # 8000ccf0 <_ZN15MemoryAllocator11freeMemHeadE>
    80006e2c:	0007b783          	ld	a5,0(a5)
    80006e30:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    80006e34:	fd043783          	ld	a5,-48(s0)
    80006e38:	02078463          	beqz	a5,80006e60 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80006e3c:	fd043703          	ld	a4,-48(s0)
    80006e40:	fb843783          	ld	a5,-72(s0)
    80006e44:	00f77e63          	bgeu	a4,a5,80006e60 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80006e48:	fd043783          	ld	a5,-48(s0)
    80006e4c:	fcf43c23          	sd	a5,-40(s0)
    80006e50:	fd043783          	ld	a5,-48(s0)
    80006e54:	0007b783          	ld	a5,0(a5)
    80006e58:	fcf43823          	sd	a5,-48(s0)
    80006e5c:	fd9ff06f          	j	80006e34 <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    80006e60:	fb843783          	ld	a5,-72(s0)
    80006e64:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    80006e68:	fb843783          	ld	a5,-72(s0)
    80006e6c:	0087b783          	ld	a5,8(a5)
    80006e70:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    80006e74:	fc843783          	ld	a5,-56(s0)
    80006e78:	fc043703          	ld	a4,-64(s0)
    80006e7c:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    80006e80:	fd843783          	ld	a5,-40(s0)
    80006e84:	02078263          	beqz	a5,80006ea8 <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    80006e88:	fd843783          	ld	a5,-40(s0)
    80006e8c:	0007b703          	ld	a4,0(a5)
    80006e90:	fc843783          	ld	a5,-56(s0)
    80006e94:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    80006e98:	fd843783          	ld	a5,-40(s0)
    80006e9c:	fc843703          	ld	a4,-56(s0)
    80006ea0:	00e7b023          	sd	a4,0(a5)
    80006ea4:	0280006f          	j	80006ecc <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    80006ea8:	00006797          	auipc	a5,0x6
    80006eac:	e4878793          	addi	a5,a5,-440 # 8000ccf0 <_ZN15MemoryAllocator11freeMemHeadE>
    80006eb0:	0007b703          	ld	a4,0(a5)
    80006eb4:	fc843783          	ld	a5,-56(s0)
    80006eb8:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    80006ebc:	00006797          	auipc	a5,0x6
    80006ec0:	e3478793          	addi	a5,a5,-460 # 8000ccf0 <_ZN15MemoryAllocator11freeMemHeadE>
    80006ec4:	fc843703          	ld	a4,-56(s0)
    80006ec8:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    80006ecc:	fc843503          	ld	a0,-56(s0)
    80006ed0:	00000097          	auipc	ra,0x0
    80006ed4:	02c080e7          	jalr	44(ra) # 80006efc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    80006ed8:	fd843503          	ld	a0,-40(s0)
    80006edc:	00000097          	auipc	ra,0x0
    80006ee0:	020080e7          	jalr	32(ra) # 80006efc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    80006ee4:	00000793          	li	a5,0
}
    80006ee8:	00078513          	mv	a0,a5
    80006eec:	04813083          	ld	ra,72(sp)
    80006ef0:	04013403          	ld	s0,64(sp)
    80006ef4:	05010113          	addi	sp,sp,80
    80006ef8:	00008067          	ret

0000000080006efc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80006efc:	fc010113          	addi	sp,sp,-64
    80006f00:	02813c23          	sd	s0,56(sp)
    80006f04:	04010413          	addi	s0,sp,64
    80006f08:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    80006f0c:	fc843783          	ld	a5,-56(s0)
    80006f10:	00079663          	bnez	a5,80006f1c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    80006f14:	00000793          	li	a5,0
    80006f18:	0a00006f          	j	80006fb8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    80006f1c:	fc843783          	ld	a5,-56(s0)
    80006f20:	0007b783          	ld	a5,0(a5)
    80006f24:	00f037b3          	snez	a5,a5
    80006f28:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    80006f2c:	fc843783          	ld	a5,-56(s0)
    80006f30:	0087b783          	ld	a5,8(a5)
    80006f34:	fc843703          	ld	a4,-56(s0)
    80006f38:	00f707b3          	add	a5,a4,a5
    80006f3c:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    80006f40:	fc843783          	ld	a5,-56(s0)
    80006f44:	0007b783          	ld	a5,0(a5)
    80006f48:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    80006f4c:	fe043703          	ld	a4,-32(s0)
    80006f50:	fd843783          	ld	a5,-40(s0)
    80006f54:	40f707b3          	sub	a5,a4,a5
    80006f58:	0017b793          	seqz	a5,a5
    80006f5c:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    80006f60:	fef44783          	lbu	a5,-17(s0)
    80006f64:	0ff7f793          	andi	a5,a5,255
    80006f68:	04078663          	beqz	a5,80006fb4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    80006f6c:	fd744783          	lbu	a5,-41(s0)
    80006f70:	0ff7f793          	andi	a5,a5,255
    80006f74:	04078063          	beqz	a5,80006fb4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    80006f78:	fc843783          	ld	a5,-56(s0)
    80006f7c:	0087b703          	ld	a4,8(a5)
    80006f80:	fc843783          	ld	a5,-56(s0)
    80006f84:	0007b783          	ld	a5,0(a5)
    80006f88:	0087b783          	ld	a5,8(a5)
    80006f8c:	00f70733          	add	a4,a4,a5
    80006f90:	fc843783          	ld	a5,-56(s0)
    80006f94:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    80006f98:	fc843783          	ld	a5,-56(s0)
    80006f9c:	0007b783          	ld	a5,0(a5)
    80006fa0:	0007b703          	ld	a4,0(a5)
    80006fa4:	fc843783          	ld	a5,-56(s0)
    80006fa8:	00e7b023          	sd	a4,0(a5)
        return 1;
    80006fac:	00100793          	li	a5,1
    80006fb0:	0080006f          	j	80006fb8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    80006fb4:	00000793          	li	a5,0
}
    80006fb8:	00078513          	mv	a0,a5
    80006fbc:	03813403          	ld	s0,56(sp)
    80006fc0:	04010113          	addi	sp,sp,64
    80006fc4:	00008067          	ret

0000000080006fc8 <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    80006fc8:	fe010113          	addi	sp,sp,-32
    80006fcc:	00813c23          	sd	s0,24(sp)
    80006fd0:	02010413          	addi	s0,sp,32
    80006fd4:	fea43423          	sd	a0,-24(s0)
    80006fd8:	00058793          	mv	a5,a1
    80006fdc:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    80006fe0:	fe843783          	ld	a5,-24(s0)
    80006fe4:	fe078793          	addi	a5,a5,-32
    80006fe8:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    80006fec:	fe843783          	ld	a5,-24(s0)
    80006ff0:	0107a703          	lw	a4,16(a5)
    80006ff4:	fe442783          	lw	a5,-28(s0)
    80006ff8:	0007879b          	sext.w	a5,a5
    80006ffc:	40e787b3          	sub	a5,a5,a4
    80007000:	0017b793          	seqz	a5,a5
    80007004:	0ff7f793          	andi	a5,a5,255
}
    80007008:	00078513          	mv	a0,a5
    8000700c:	01813403          	ld	s0,24(sp)
    80007010:	02010113          	addi	sp,sp,32
    80007014:	00008067          	ret

0000000080007018 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    80007018:	ff010113          	addi	sp,sp,-16
    8000701c:	00813423          	sd	s0,8(sp)
    80007020:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    80007024:	00006797          	auipc	a5,0x6
    80007028:	cd478793          	addi	a5,a5,-812 # 8000ccf8 <_ZN15MemoryAllocator11initializedE>
    8000702c:	0007c783          	lbu	a5,0(a5)
    80007030:	0017c793          	xori	a5,a5,1
    80007034:	0ff7f793          	andi	a5,a5,255
    80007038:	06078a63          	beqz	a5,800070ac <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    8000703c:	00006797          	auipc	a5,0x6
    80007040:	ab47b783          	ld	a5,-1356(a5) # 8000caf0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80007044:	0007b703          	ld	a4,0(a5)
    80007048:	00006797          	auipc	a5,0x6
    8000704c:	ca878793          	addi	a5,a5,-856 # 8000ccf0 <_ZN15MemoryAllocator11freeMemHeadE>
    80007050:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    80007054:	00006797          	auipc	a5,0x6
    80007058:	c9c78793          	addi	a5,a5,-868 # 8000ccf0 <_ZN15MemoryAllocator11freeMemHeadE>
    8000705c:	0007b783          	ld	a5,0(a5)
    80007060:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    80007064:	00006797          	auipc	a5,0x6
    80007068:	ac47b783          	ld	a5,-1340(a5) # 8000cb28 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000706c:	0007b703          	ld	a4,0(a5)
    80007070:	00006797          	auipc	a5,0x6
    80007074:	a807b783          	ld	a5,-1408(a5) # 8000caf0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80007078:	0007b783          	ld	a5,0(a5)
    8000707c:	40f70733          	sub	a4,a4,a5
    80007080:	00006797          	auipc	a5,0x6
    80007084:	c7078793          	addi	a5,a5,-912 # 8000ccf0 <_ZN15MemoryAllocator11freeMemHeadE>
    80007088:	0007b783          	ld	a5,0(a5)
    8000708c:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    80007090:	00006797          	auipc	a5,0x6
    80007094:	c5878793          	addi	a5,a5,-936 # 8000cce8 <_ZN15MemoryAllocator11usedMemHeadE>
    80007098:	0007b023          	sd	zero,0(a5)

        initialized = true;
    8000709c:	00006797          	auipc	a5,0x6
    800070a0:	c5c78793          	addi	a5,a5,-932 # 8000ccf8 <_ZN15MemoryAllocator11initializedE>
    800070a4:	00100713          	li	a4,1
    800070a8:	00e78023          	sb	a4,0(a5)
    }
}
    800070ac:	00000013          	nop
    800070b0:	00813403          	ld	s0,8(sp)
    800070b4:	01010113          	addi	sp,sp,16
    800070b8:	00008067          	ret

00000000800070bc <start>:
    800070bc:	ff010113          	addi	sp,sp,-16
    800070c0:	00813423          	sd	s0,8(sp)
    800070c4:	01010413          	addi	s0,sp,16
    800070c8:	300027f3          	csrr	a5,mstatus
    800070cc:	ffffe737          	lui	a4,0xffffe
    800070d0:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff089f>
    800070d4:	00e7f7b3          	and	a5,a5,a4
    800070d8:	00001737          	lui	a4,0x1
    800070dc:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800070e0:	00e7e7b3          	or	a5,a5,a4
    800070e4:	30079073          	csrw	mstatus,a5
    800070e8:	00000797          	auipc	a5,0x0
    800070ec:	16078793          	addi	a5,a5,352 # 80007248 <system_main>
    800070f0:	34179073          	csrw	mepc,a5
    800070f4:	00000793          	li	a5,0
    800070f8:	18079073          	csrw	satp,a5
    800070fc:	000107b7          	lui	a5,0x10
    80007100:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007104:	30279073          	csrw	medeleg,a5
    80007108:	30379073          	csrw	mideleg,a5
    8000710c:	104027f3          	csrr	a5,sie
    80007110:	2227e793          	ori	a5,a5,546
    80007114:	10479073          	csrw	sie,a5
    80007118:	fff00793          	li	a5,-1
    8000711c:	00a7d793          	srli	a5,a5,0xa
    80007120:	3b079073          	csrw	pmpaddr0,a5
    80007124:	00f00793          	li	a5,15
    80007128:	3a079073          	csrw	pmpcfg0,a5
    8000712c:	f14027f3          	csrr	a5,mhartid
    80007130:	0200c737          	lui	a4,0x200c
    80007134:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007138:	0007869b          	sext.w	a3,a5
    8000713c:	00269713          	slli	a4,a3,0x2
    80007140:	000f4637          	lui	a2,0xf4
    80007144:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007148:	00d70733          	add	a4,a4,a3
    8000714c:	0037979b          	slliw	a5,a5,0x3
    80007150:	020046b7          	lui	a3,0x2004
    80007154:	00d787b3          	add	a5,a5,a3
    80007158:	00c585b3          	add	a1,a1,a2
    8000715c:	00371693          	slli	a3,a4,0x3
    80007160:	00006717          	auipc	a4,0x6
    80007164:	ba070713          	addi	a4,a4,-1120 # 8000cd00 <timer_scratch>
    80007168:	00b7b023          	sd	a1,0(a5)
    8000716c:	00d70733          	add	a4,a4,a3
    80007170:	00f73c23          	sd	a5,24(a4)
    80007174:	02c73023          	sd	a2,32(a4)
    80007178:	34071073          	csrw	mscratch,a4
    8000717c:	00000797          	auipc	a5,0x0
    80007180:	6e478793          	addi	a5,a5,1764 # 80007860 <timervec>
    80007184:	30579073          	csrw	mtvec,a5
    80007188:	300027f3          	csrr	a5,mstatus
    8000718c:	0087e793          	ori	a5,a5,8
    80007190:	30079073          	csrw	mstatus,a5
    80007194:	304027f3          	csrr	a5,mie
    80007198:	0807e793          	ori	a5,a5,128
    8000719c:	30479073          	csrw	mie,a5
    800071a0:	f14027f3          	csrr	a5,mhartid
    800071a4:	0007879b          	sext.w	a5,a5
    800071a8:	00078213          	mv	tp,a5
    800071ac:	30200073          	mret
    800071b0:	00813403          	ld	s0,8(sp)
    800071b4:	01010113          	addi	sp,sp,16
    800071b8:	00008067          	ret

00000000800071bc <timerinit>:
    800071bc:	ff010113          	addi	sp,sp,-16
    800071c0:	00813423          	sd	s0,8(sp)
    800071c4:	01010413          	addi	s0,sp,16
    800071c8:	f14027f3          	csrr	a5,mhartid
    800071cc:	0200c737          	lui	a4,0x200c
    800071d0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800071d4:	0007869b          	sext.w	a3,a5
    800071d8:	00269713          	slli	a4,a3,0x2
    800071dc:	000f4637          	lui	a2,0xf4
    800071e0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800071e4:	00d70733          	add	a4,a4,a3
    800071e8:	0037979b          	slliw	a5,a5,0x3
    800071ec:	020046b7          	lui	a3,0x2004
    800071f0:	00d787b3          	add	a5,a5,a3
    800071f4:	00c585b3          	add	a1,a1,a2
    800071f8:	00371693          	slli	a3,a4,0x3
    800071fc:	00006717          	auipc	a4,0x6
    80007200:	b0470713          	addi	a4,a4,-1276 # 8000cd00 <timer_scratch>
    80007204:	00b7b023          	sd	a1,0(a5)
    80007208:	00d70733          	add	a4,a4,a3
    8000720c:	00f73c23          	sd	a5,24(a4)
    80007210:	02c73023          	sd	a2,32(a4)
    80007214:	34071073          	csrw	mscratch,a4
    80007218:	00000797          	auipc	a5,0x0
    8000721c:	64878793          	addi	a5,a5,1608 # 80007860 <timervec>
    80007220:	30579073          	csrw	mtvec,a5
    80007224:	300027f3          	csrr	a5,mstatus
    80007228:	0087e793          	ori	a5,a5,8
    8000722c:	30079073          	csrw	mstatus,a5
    80007230:	304027f3          	csrr	a5,mie
    80007234:	0807e793          	ori	a5,a5,128
    80007238:	30479073          	csrw	mie,a5
    8000723c:	00813403          	ld	s0,8(sp)
    80007240:	01010113          	addi	sp,sp,16
    80007244:	00008067          	ret

0000000080007248 <system_main>:
    80007248:	fe010113          	addi	sp,sp,-32
    8000724c:	00813823          	sd	s0,16(sp)
    80007250:	00913423          	sd	s1,8(sp)
    80007254:	00113c23          	sd	ra,24(sp)
    80007258:	02010413          	addi	s0,sp,32
    8000725c:	00000097          	auipc	ra,0x0
    80007260:	0c4080e7          	jalr	196(ra) # 80007320 <cpuid>
    80007264:	00006497          	auipc	s1,0x6
    80007268:	8fc48493          	addi	s1,s1,-1796 # 8000cb60 <started>
    8000726c:	02050263          	beqz	a0,80007290 <system_main+0x48>
    80007270:	0004a783          	lw	a5,0(s1)
    80007274:	0007879b          	sext.w	a5,a5
    80007278:	fe078ce3          	beqz	a5,80007270 <system_main+0x28>
    8000727c:	0ff0000f          	fence
    80007280:	00003517          	auipc	a0,0x3
    80007284:	47850513          	addi	a0,a0,1144 # 8000a6f8 <_ZZ9kPrintIntmE6digits+0x688>
    80007288:	00001097          	auipc	ra,0x1
    8000728c:	a74080e7          	jalr	-1420(ra) # 80007cfc <panic>
    80007290:	00001097          	auipc	ra,0x1
    80007294:	9c8080e7          	jalr	-1592(ra) # 80007c58 <consoleinit>
    80007298:	00001097          	auipc	ra,0x1
    8000729c:	154080e7          	jalr	340(ra) # 800083ec <printfinit>
    800072a0:	00003517          	auipc	a0,0x3
    800072a4:	2e050513          	addi	a0,a0,736 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800072a8:	00001097          	auipc	ra,0x1
    800072ac:	ab0080e7          	jalr	-1360(ra) # 80007d58 <__printf>
    800072b0:	00003517          	auipc	a0,0x3
    800072b4:	41850513          	addi	a0,a0,1048 # 8000a6c8 <_ZZ9kPrintIntmE6digits+0x658>
    800072b8:	00001097          	auipc	ra,0x1
    800072bc:	aa0080e7          	jalr	-1376(ra) # 80007d58 <__printf>
    800072c0:	00003517          	auipc	a0,0x3
    800072c4:	2c050513          	addi	a0,a0,704 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    800072c8:	00001097          	auipc	ra,0x1
    800072cc:	a90080e7          	jalr	-1392(ra) # 80007d58 <__printf>
    800072d0:	00001097          	auipc	ra,0x1
    800072d4:	4a8080e7          	jalr	1192(ra) # 80008778 <kinit>
    800072d8:	00000097          	auipc	ra,0x0
    800072dc:	148080e7          	jalr	328(ra) # 80007420 <trapinit>
    800072e0:	00000097          	auipc	ra,0x0
    800072e4:	16c080e7          	jalr	364(ra) # 8000744c <trapinithart>
    800072e8:	00000097          	auipc	ra,0x0
    800072ec:	5b8080e7          	jalr	1464(ra) # 800078a0 <plicinit>
    800072f0:	00000097          	auipc	ra,0x0
    800072f4:	5d8080e7          	jalr	1496(ra) # 800078c8 <plicinithart>
    800072f8:	00000097          	auipc	ra,0x0
    800072fc:	078080e7          	jalr	120(ra) # 80007370 <userinit>
    80007300:	0ff0000f          	fence
    80007304:	00100793          	li	a5,1
    80007308:	00003517          	auipc	a0,0x3
    8000730c:	3d850513          	addi	a0,a0,984 # 8000a6e0 <_ZZ9kPrintIntmE6digits+0x670>
    80007310:	00f4a023          	sw	a5,0(s1)
    80007314:	00001097          	auipc	ra,0x1
    80007318:	a44080e7          	jalr	-1468(ra) # 80007d58 <__printf>
    8000731c:	0000006f          	j	8000731c <system_main+0xd4>

0000000080007320 <cpuid>:
    80007320:	ff010113          	addi	sp,sp,-16
    80007324:	00813423          	sd	s0,8(sp)
    80007328:	01010413          	addi	s0,sp,16
    8000732c:	00020513          	mv	a0,tp
    80007330:	00813403          	ld	s0,8(sp)
    80007334:	0005051b          	sext.w	a0,a0
    80007338:	01010113          	addi	sp,sp,16
    8000733c:	00008067          	ret

0000000080007340 <mycpu>:
    80007340:	ff010113          	addi	sp,sp,-16
    80007344:	00813423          	sd	s0,8(sp)
    80007348:	01010413          	addi	s0,sp,16
    8000734c:	00020793          	mv	a5,tp
    80007350:	00813403          	ld	s0,8(sp)
    80007354:	0007879b          	sext.w	a5,a5
    80007358:	00779793          	slli	a5,a5,0x7
    8000735c:	00007517          	auipc	a0,0x7
    80007360:	9d450513          	addi	a0,a0,-1580 # 8000dd30 <cpus>
    80007364:	00f50533          	add	a0,a0,a5
    80007368:	01010113          	addi	sp,sp,16
    8000736c:	00008067          	ret

0000000080007370 <userinit>:
    80007370:	ff010113          	addi	sp,sp,-16
    80007374:	00813423          	sd	s0,8(sp)
    80007378:	01010413          	addi	s0,sp,16
    8000737c:	00813403          	ld	s0,8(sp)
    80007380:	01010113          	addi	sp,sp,16
    80007384:	ffffb317          	auipc	t1,0xffffb
    80007388:	bcc30067          	jr	-1076(t1) # 80001f50 <main>

000000008000738c <either_copyout>:
    8000738c:	ff010113          	addi	sp,sp,-16
    80007390:	00813023          	sd	s0,0(sp)
    80007394:	00113423          	sd	ra,8(sp)
    80007398:	01010413          	addi	s0,sp,16
    8000739c:	02051663          	bnez	a0,800073c8 <either_copyout+0x3c>
    800073a0:	00058513          	mv	a0,a1
    800073a4:	00060593          	mv	a1,a2
    800073a8:	0006861b          	sext.w	a2,a3
    800073ac:	00002097          	auipc	ra,0x2
    800073b0:	c58080e7          	jalr	-936(ra) # 80009004 <__memmove>
    800073b4:	00813083          	ld	ra,8(sp)
    800073b8:	00013403          	ld	s0,0(sp)
    800073bc:	00000513          	li	a0,0
    800073c0:	01010113          	addi	sp,sp,16
    800073c4:	00008067          	ret
    800073c8:	00003517          	auipc	a0,0x3
    800073cc:	35850513          	addi	a0,a0,856 # 8000a720 <_ZZ9kPrintIntmE6digits+0x6b0>
    800073d0:	00001097          	auipc	ra,0x1
    800073d4:	92c080e7          	jalr	-1748(ra) # 80007cfc <panic>

00000000800073d8 <either_copyin>:
    800073d8:	ff010113          	addi	sp,sp,-16
    800073dc:	00813023          	sd	s0,0(sp)
    800073e0:	00113423          	sd	ra,8(sp)
    800073e4:	01010413          	addi	s0,sp,16
    800073e8:	02059463          	bnez	a1,80007410 <either_copyin+0x38>
    800073ec:	00060593          	mv	a1,a2
    800073f0:	0006861b          	sext.w	a2,a3
    800073f4:	00002097          	auipc	ra,0x2
    800073f8:	c10080e7          	jalr	-1008(ra) # 80009004 <__memmove>
    800073fc:	00813083          	ld	ra,8(sp)
    80007400:	00013403          	ld	s0,0(sp)
    80007404:	00000513          	li	a0,0
    80007408:	01010113          	addi	sp,sp,16
    8000740c:	00008067          	ret
    80007410:	00003517          	auipc	a0,0x3
    80007414:	33850513          	addi	a0,a0,824 # 8000a748 <_ZZ9kPrintIntmE6digits+0x6d8>
    80007418:	00001097          	auipc	ra,0x1
    8000741c:	8e4080e7          	jalr	-1820(ra) # 80007cfc <panic>

0000000080007420 <trapinit>:
    80007420:	ff010113          	addi	sp,sp,-16
    80007424:	00813423          	sd	s0,8(sp)
    80007428:	01010413          	addi	s0,sp,16
    8000742c:	00813403          	ld	s0,8(sp)
    80007430:	00003597          	auipc	a1,0x3
    80007434:	34058593          	addi	a1,a1,832 # 8000a770 <_ZZ9kPrintIntmE6digits+0x700>
    80007438:	00007517          	auipc	a0,0x7
    8000743c:	97850513          	addi	a0,a0,-1672 # 8000ddb0 <tickslock>
    80007440:	01010113          	addi	sp,sp,16
    80007444:	00001317          	auipc	t1,0x1
    80007448:	5c430067          	jr	1476(t1) # 80008a08 <initlock>

000000008000744c <trapinithart>:
    8000744c:	ff010113          	addi	sp,sp,-16
    80007450:	00813423          	sd	s0,8(sp)
    80007454:	01010413          	addi	s0,sp,16
    80007458:	00000797          	auipc	a5,0x0
    8000745c:	2f878793          	addi	a5,a5,760 # 80007750 <kernelvec>
    80007460:	10579073          	csrw	stvec,a5
    80007464:	00813403          	ld	s0,8(sp)
    80007468:	01010113          	addi	sp,sp,16
    8000746c:	00008067          	ret

0000000080007470 <usertrap>:
    80007470:	ff010113          	addi	sp,sp,-16
    80007474:	00813423          	sd	s0,8(sp)
    80007478:	01010413          	addi	s0,sp,16
    8000747c:	00813403          	ld	s0,8(sp)
    80007480:	01010113          	addi	sp,sp,16
    80007484:	00008067          	ret

0000000080007488 <usertrapret>:
    80007488:	ff010113          	addi	sp,sp,-16
    8000748c:	00813423          	sd	s0,8(sp)
    80007490:	01010413          	addi	s0,sp,16
    80007494:	00813403          	ld	s0,8(sp)
    80007498:	01010113          	addi	sp,sp,16
    8000749c:	00008067          	ret

00000000800074a0 <kerneltrap>:
    800074a0:	fe010113          	addi	sp,sp,-32
    800074a4:	00813823          	sd	s0,16(sp)
    800074a8:	00113c23          	sd	ra,24(sp)
    800074ac:	00913423          	sd	s1,8(sp)
    800074b0:	02010413          	addi	s0,sp,32
    800074b4:	142025f3          	csrr	a1,scause
    800074b8:	100027f3          	csrr	a5,sstatus
    800074bc:	0027f793          	andi	a5,a5,2
    800074c0:	10079c63          	bnez	a5,800075d8 <kerneltrap+0x138>
    800074c4:	142027f3          	csrr	a5,scause
    800074c8:	0207ce63          	bltz	a5,80007504 <kerneltrap+0x64>
    800074cc:	00003517          	auipc	a0,0x3
    800074d0:	2ec50513          	addi	a0,a0,748 # 8000a7b8 <_ZZ9kPrintIntmE6digits+0x748>
    800074d4:	00001097          	auipc	ra,0x1
    800074d8:	884080e7          	jalr	-1916(ra) # 80007d58 <__printf>
    800074dc:	141025f3          	csrr	a1,sepc
    800074e0:	14302673          	csrr	a2,stval
    800074e4:	00003517          	auipc	a0,0x3
    800074e8:	2e450513          	addi	a0,a0,740 # 8000a7c8 <_ZZ9kPrintIntmE6digits+0x758>
    800074ec:	00001097          	auipc	ra,0x1
    800074f0:	86c080e7          	jalr	-1940(ra) # 80007d58 <__printf>
    800074f4:	00003517          	auipc	a0,0x3
    800074f8:	2ec50513          	addi	a0,a0,748 # 8000a7e0 <_ZZ9kPrintIntmE6digits+0x770>
    800074fc:	00001097          	auipc	ra,0x1
    80007500:	800080e7          	jalr	-2048(ra) # 80007cfc <panic>
    80007504:	0ff7f713          	andi	a4,a5,255
    80007508:	00900693          	li	a3,9
    8000750c:	04d70063          	beq	a4,a3,8000754c <kerneltrap+0xac>
    80007510:	fff00713          	li	a4,-1
    80007514:	03f71713          	slli	a4,a4,0x3f
    80007518:	00170713          	addi	a4,a4,1
    8000751c:	fae798e3          	bne	a5,a4,800074cc <kerneltrap+0x2c>
    80007520:	00000097          	auipc	ra,0x0
    80007524:	e00080e7          	jalr	-512(ra) # 80007320 <cpuid>
    80007528:	06050663          	beqz	a0,80007594 <kerneltrap+0xf4>
    8000752c:	144027f3          	csrr	a5,sip
    80007530:	ffd7f793          	andi	a5,a5,-3
    80007534:	14479073          	csrw	sip,a5
    80007538:	01813083          	ld	ra,24(sp)
    8000753c:	01013403          	ld	s0,16(sp)
    80007540:	00813483          	ld	s1,8(sp)
    80007544:	02010113          	addi	sp,sp,32
    80007548:	00008067          	ret
    8000754c:	00000097          	auipc	ra,0x0
    80007550:	3c8080e7          	jalr	968(ra) # 80007914 <plic_claim>
    80007554:	00a00793          	li	a5,10
    80007558:	00050493          	mv	s1,a0
    8000755c:	06f50863          	beq	a0,a5,800075cc <kerneltrap+0x12c>
    80007560:	fc050ce3          	beqz	a0,80007538 <kerneltrap+0x98>
    80007564:	00050593          	mv	a1,a0
    80007568:	00003517          	auipc	a0,0x3
    8000756c:	23050513          	addi	a0,a0,560 # 8000a798 <_ZZ9kPrintIntmE6digits+0x728>
    80007570:	00000097          	auipc	ra,0x0
    80007574:	7e8080e7          	jalr	2024(ra) # 80007d58 <__printf>
    80007578:	01013403          	ld	s0,16(sp)
    8000757c:	01813083          	ld	ra,24(sp)
    80007580:	00048513          	mv	a0,s1
    80007584:	00813483          	ld	s1,8(sp)
    80007588:	02010113          	addi	sp,sp,32
    8000758c:	00000317          	auipc	t1,0x0
    80007590:	3c030067          	jr	960(t1) # 8000794c <plic_complete>
    80007594:	00007517          	auipc	a0,0x7
    80007598:	81c50513          	addi	a0,a0,-2020 # 8000ddb0 <tickslock>
    8000759c:	00001097          	auipc	ra,0x1
    800075a0:	490080e7          	jalr	1168(ra) # 80008a2c <acquire>
    800075a4:	00005717          	auipc	a4,0x5
    800075a8:	5c070713          	addi	a4,a4,1472 # 8000cb64 <ticks>
    800075ac:	00072783          	lw	a5,0(a4)
    800075b0:	00007517          	auipc	a0,0x7
    800075b4:	80050513          	addi	a0,a0,-2048 # 8000ddb0 <tickslock>
    800075b8:	0017879b          	addiw	a5,a5,1
    800075bc:	00f72023          	sw	a5,0(a4)
    800075c0:	00001097          	auipc	ra,0x1
    800075c4:	538080e7          	jalr	1336(ra) # 80008af8 <release>
    800075c8:	f65ff06f          	j	8000752c <kerneltrap+0x8c>
    800075cc:	00001097          	auipc	ra,0x1
    800075d0:	094080e7          	jalr	148(ra) # 80008660 <uartintr>
    800075d4:	fa5ff06f          	j	80007578 <kerneltrap+0xd8>
    800075d8:	00003517          	auipc	a0,0x3
    800075dc:	1a050513          	addi	a0,a0,416 # 8000a778 <_ZZ9kPrintIntmE6digits+0x708>
    800075e0:	00000097          	auipc	ra,0x0
    800075e4:	71c080e7          	jalr	1820(ra) # 80007cfc <panic>

00000000800075e8 <clockintr>:
    800075e8:	fe010113          	addi	sp,sp,-32
    800075ec:	00813823          	sd	s0,16(sp)
    800075f0:	00913423          	sd	s1,8(sp)
    800075f4:	00113c23          	sd	ra,24(sp)
    800075f8:	02010413          	addi	s0,sp,32
    800075fc:	00006497          	auipc	s1,0x6
    80007600:	7b448493          	addi	s1,s1,1972 # 8000ddb0 <tickslock>
    80007604:	00048513          	mv	a0,s1
    80007608:	00001097          	auipc	ra,0x1
    8000760c:	424080e7          	jalr	1060(ra) # 80008a2c <acquire>
    80007610:	00005717          	auipc	a4,0x5
    80007614:	55470713          	addi	a4,a4,1364 # 8000cb64 <ticks>
    80007618:	00072783          	lw	a5,0(a4)
    8000761c:	01013403          	ld	s0,16(sp)
    80007620:	01813083          	ld	ra,24(sp)
    80007624:	00048513          	mv	a0,s1
    80007628:	0017879b          	addiw	a5,a5,1
    8000762c:	00813483          	ld	s1,8(sp)
    80007630:	00f72023          	sw	a5,0(a4)
    80007634:	02010113          	addi	sp,sp,32
    80007638:	00001317          	auipc	t1,0x1
    8000763c:	4c030067          	jr	1216(t1) # 80008af8 <release>

0000000080007640 <devintr>:
    80007640:	142027f3          	csrr	a5,scause
    80007644:	00000513          	li	a0,0
    80007648:	0007c463          	bltz	a5,80007650 <devintr+0x10>
    8000764c:	00008067          	ret
    80007650:	fe010113          	addi	sp,sp,-32
    80007654:	00813823          	sd	s0,16(sp)
    80007658:	00113c23          	sd	ra,24(sp)
    8000765c:	00913423          	sd	s1,8(sp)
    80007660:	02010413          	addi	s0,sp,32
    80007664:	0ff7f713          	andi	a4,a5,255
    80007668:	00900693          	li	a3,9
    8000766c:	04d70c63          	beq	a4,a3,800076c4 <devintr+0x84>
    80007670:	fff00713          	li	a4,-1
    80007674:	03f71713          	slli	a4,a4,0x3f
    80007678:	00170713          	addi	a4,a4,1
    8000767c:	00e78c63          	beq	a5,a4,80007694 <devintr+0x54>
    80007680:	01813083          	ld	ra,24(sp)
    80007684:	01013403          	ld	s0,16(sp)
    80007688:	00813483          	ld	s1,8(sp)
    8000768c:	02010113          	addi	sp,sp,32
    80007690:	00008067          	ret
    80007694:	00000097          	auipc	ra,0x0
    80007698:	c8c080e7          	jalr	-884(ra) # 80007320 <cpuid>
    8000769c:	06050663          	beqz	a0,80007708 <devintr+0xc8>
    800076a0:	144027f3          	csrr	a5,sip
    800076a4:	ffd7f793          	andi	a5,a5,-3
    800076a8:	14479073          	csrw	sip,a5
    800076ac:	01813083          	ld	ra,24(sp)
    800076b0:	01013403          	ld	s0,16(sp)
    800076b4:	00813483          	ld	s1,8(sp)
    800076b8:	00200513          	li	a0,2
    800076bc:	02010113          	addi	sp,sp,32
    800076c0:	00008067          	ret
    800076c4:	00000097          	auipc	ra,0x0
    800076c8:	250080e7          	jalr	592(ra) # 80007914 <plic_claim>
    800076cc:	00a00793          	li	a5,10
    800076d0:	00050493          	mv	s1,a0
    800076d4:	06f50663          	beq	a0,a5,80007740 <devintr+0x100>
    800076d8:	00100513          	li	a0,1
    800076dc:	fa0482e3          	beqz	s1,80007680 <devintr+0x40>
    800076e0:	00048593          	mv	a1,s1
    800076e4:	00003517          	auipc	a0,0x3
    800076e8:	0b450513          	addi	a0,a0,180 # 8000a798 <_ZZ9kPrintIntmE6digits+0x728>
    800076ec:	00000097          	auipc	ra,0x0
    800076f0:	66c080e7          	jalr	1644(ra) # 80007d58 <__printf>
    800076f4:	00048513          	mv	a0,s1
    800076f8:	00000097          	auipc	ra,0x0
    800076fc:	254080e7          	jalr	596(ra) # 8000794c <plic_complete>
    80007700:	00100513          	li	a0,1
    80007704:	f7dff06f          	j	80007680 <devintr+0x40>
    80007708:	00006517          	auipc	a0,0x6
    8000770c:	6a850513          	addi	a0,a0,1704 # 8000ddb0 <tickslock>
    80007710:	00001097          	auipc	ra,0x1
    80007714:	31c080e7          	jalr	796(ra) # 80008a2c <acquire>
    80007718:	00005717          	auipc	a4,0x5
    8000771c:	44c70713          	addi	a4,a4,1100 # 8000cb64 <ticks>
    80007720:	00072783          	lw	a5,0(a4)
    80007724:	00006517          	auipc	a0,0x6
    80007728:	68c50513          	addi	a0,a0,1676 # 8000ddb0 <tickslock>
    8000772c:	0017879b          	addiw	a5,a5,1
    80007730:	00f72023          	sw	a5,0(a4)
    80007734:	00001097          	auipc	ra,0x1
    80007738:	3c4080e7          	jalr	964(ra) # 80008af8 <release>
    8000773c:	f65ff06f          	j	800076a0 <devintr+0x60>
    80007740:	00001097          	auipc	ra,0x1
    80007744:	f20080e7          	jalr	-224(ra) # 80008660 <uartintr>
    80007748:	fadff06f          	j	800076f4 <devintr+0xb4>
    8000774c:	0000                	unimp
	...

0000000080007750 <kernelvec>:
    80007750:	f0010113          	addi	sp,sp,-256
    80007754:	00113023          	sd	ra,0(sp)
    80007758:	00213423          	sd	sp,8(sp)
    8000775c:	00313823          	sd	gp,16(sp)
    80007760:	00413c23          	sd	tp,24(sp)
    80007764:	02513023          	sd	t0,32(sp)
    80007768:	02613423          	sd	t1,40(sp)
    8000776c:	02713823          	sd	t2,48(sp)
    80007770:	02813c23          	sd	s0,56(sp)
    80007774:	04913023          	sd	s1,64(sp)
    80007778:	04a13423          	sd	a0,72(sp)
    8000777c:	04b13823          	sd	a1,80(sp)
    80007780:	04c13c23          	sd	a2,88(sp)
    80007784:	06d13023          	sd	a3,96(sp)
    80007788:	06e13423          	sd	a4,104(sp)
    8000778c:	06f13823          	sd	a5,112(sp)
    80007790:	07013c23          	sd	a6,120(sp)
    80007794:	09113023          	sd	a7,128(sp)
    80007798:	09213423          	sd	s2,136(sp)
    8000779c:	09313823          	sd	s3,144(sp)
    800077a0:	09413c23          	sd	s4,152(sp)
    800077a4:	0b513023          	sd	s5,160(sp)
    800077a8:	0b613423          	sd	s6,168(sp)
    800077ac:	0b713823          	sd	s7,176(sp)
    800077b0:	0b813c23          	sd	s8,184(sp)
    800077b4:	0d913023          	sd	s9,192(sp)
    800077b8:	0da13423          	sd	s10,200(sp)
    800077bc:	0db13823          	sd	s11,208(sp)
    800077c0:	0dc13c23          	sd	t3,216(sp)
    800077c4:	0fd13023          	sd	t4,224(sp)
    800077c8:	0fe13423          	sd	t5,232(sp)
    800077cc:	0ff13823          	sd	t6,240(sp)
    800077d0:	cd1ff0ef          	jal	ra,800074a0 <kerneltrap>
    800077d4:	00013083          	ld	ra,0(sp)
    800077d8:	00813103          	ld	sp,8(sp)
    800077dc:	01013183          	ld	gp,16(sp)
    800077e0:	02013283          	ld	t0,32(sp)
    800077e4:	02813303          	ld	t1,40(sp)
    800077e8:	03013383          	ld	t2,48(sp)
    800077ec:	03813403          	ld	s0,56(sp)
    800077f0:	04013483          	ld	s1,64(sp)
    800077f4:	04813503          	ld	a0,72(sp)
    800077f8:	05013583          	ld	a1,80(sp)
    800077fc:	05813603          	ld	a2,88(sp)
    80007800:	06013683          	ld	a3,96(sp)
    80007804:	06813703          	ld	a4,104(sp)
    80007808:	07013783          	ld	a5,112(sp)
    8000780c:	07813803          	ld	a6,120(sp)
    80007810:	08013883          	ld	a7,128(sp)
    80007814:	08813903          	ld	s2,136(sp)
    80007818:	09013983          	ld	s3,144(sp)
    8000781c:	09813a03          	ld	s4,152(sp)
    80007820:	0a013a83          	ld	s5,160(sp)
    80007824:	0a813b03          	ld	s6,168(sp)
    80007828:	0b013b83          	ld	s7,176(sp)
    8000782c:	0b813c03          	ld	s8,184(sp)
    80007830:	0c013c83          	ld	s9,192(sp)
    80007834:	0c813d03          	ld	s10,200(sp)
    80007838:	0d013d83          	ld	s11,208(sp)
    8000783c:	0d813e03          	ld	t3,216(sp)
    80007840:	0e013e83          	ld	t4,224(sp)
    80007844:	0e813f03          	ld	t5,232(sp)
    80007848:	0f013f83          	ld	t6,240(sp)
    8000784c:	10010113          	addi	sp,sp,256
    80007850:	10200073          	sret
    80007854:	00000013          	nop
    80007858:	00000013          	nop
    8000785c:	00000013          	nop

0000000080007860 <timervec>:
    80007860:	34051573          	csrrw	a0,mscratch,a0
    80007864:	00b53023          	sd	a1,0(a0)
    80007868:	00c53423          	sd	a2,8(a0)
    8000786c:	00d53823          	sd	a3,16(a0)
    80007870:	01853583          	ld	a1,24(a0)
    80007874:	02053603          	ld	a2,32(a0)
    80007878:	0005b683          	ld	a3,0(a1)
    8000787c:	00c686b3          	add	a3,a3,a2
    80007880:	00d5b023          	sd	a3,0(a1)
    80007884:	00200593          	li	a1,2
    80007888:	14459073          	csrw	sip,a1
    8000788c:	01053683          	ld	a3,16(a0)
    80007890:	00853603          	ld	a2,8(a0)
    80007894:	00053583          	ld	a1,0(a0)
    80007898:	34051573          	csrrw	a0,mscratch,a0
    8000789c:	30200073          	mret

00000000800078a0 <plicinit>:
    800078a0:	ff010113          	addi	sp,sp,-16
    800078a4:	00813423          	sd	s0,8(sp)
    800078a8:	01010413          	addi	s0,sp,16
    800078ac:	00813403          	ld	s0,8(sp)
    800078b0:	0c0007b7          	lui	a5,0xc000
    800078b4:	00100713          	li	a4,1
    800078b8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800078bc:	00e7a223          	sw	a4,4(a5)
    800078c0:	01010113          	addi	sp,sp,16
    800078c4:	00008067          	ret

00000000800078c8 <plicinithart>:
    800078c8:	ff010113          	addi	sp,sp,-16
    800078cc:	00813023          	sd	s0,0(sp)
    800078d0:	00113423          	sd	ra,8(sp)
    800078d4:	01010413          	addi	s0,sp,16
    800078d8:	00000097          	auipc	ra,0x0
    800078dc:	a48080e7          	jalr	-1464(ra) # 80007320 <cpuid>
    800078e0:	0085171b          	slliw	a4,a0,0x8
    800078e4:	0c0027b7          	lui	a5,0xc002
    800078e8:	00e787b3          	add	a5,a5,a4
    800078ec:	40200713          	li	a4,1026
    800078f0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800078f4:	00813083          	ld	ra,8(sp)
    800078f8:	00013403          	ld	s0,0(sp)
    800078fc:	00d5151b          	slliw	a0,a0,0xd
    80007900:	0c2017b7          	lui	a5,0xc201
    80007904:	00a78533          	add	a0,a5,a0
    80007908:	00052023          	sw	zero,0(a0)
    8000790c:	01010113          	addi	sp,sp,16
    80007910:	00008067          	ret

0000000080007914 <plic_claim>:
    80007914:	ff010113          	addi	sp,sp,-16
    80007918:	00813023          	sd	s0,0(sp)
    8000791c:	00113423          	sd	ra,8(sp)
    80007920:	01010413          	addi	s0,sp,16
    80007924:	00000097          	auipc	ra,0x0
    80007928:	9fc080e7          	jalr	-1540(ra) # 80007320 <cpuid>
    8000792c:	00813083          	ld	ra,8(sp)
    80007930:	00013403          	ld	s0,0(sp)
    80007934:	00d5151b          	slliw	a0,a0,0xd
    80007938:	0c2017b7          	lui	a5,0xc201
    8000793c:	00a78533          	add	a0,a5,a0
    80007940:	00452503          	lw	a0,4(a0)
    80007944:	01010113          	addi	sp,sp,16
    80007948:	00008067          	ret

000000008000794c <plic_complete>:
    8000794c:	fe010113          	addi	sp,sp,-32
    80007950:	00813823          	sd	s0,16(sp)
    80007954:	00913423          	sd	s1,8(sp)
    80007958:	00113c23          	sd	ra,24(sp)
    8000795c:	02010413          	addi	s0,sp,32
    80007960:	00050493          	mv	s1,a0
    80007964:	00000097          	auipc	ra,0x0
    80007968:	9bc080e7          	jalr	-1604(ra) # 80007320 <cpuid>
    8000796c:	01813083          	ld	ra,24(sp)
    80007970:	01013403          	ld	s0,16(sp)
    80007974:	00d5179b          	slliw	a5,a0,0xd
    80007978:	0c201737          	lui	a4,0xc201
    8000797c:	00f707b3          	add	a5,a4,a5
    80007980:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007984:	00813483          	ld	s1,8(sp)
    80007988:	02010113          	addi	sp,sp,32
    8000798c:	00008067          	ret

0000000080007990 <consolewrite>:
    80007990:	fb010113          	addi	sp,sp,-80
    80007994:	04813023          	sd	s0,64(sp)
    80007998:	04113423          	sd	ra,72(sp)
    8000799c:	02913c23          	sd	s1,56(sp)
    800079a0:	03213823          	sd	s2,48(sp)
    800079a4:	03313423          	sd	s3,40(sp)
    800079a8:	03413023          	sd	s4,32(sp)
    800079ac:	01513c23          	sd	s5,24(sp)
    800079b0:	05010413          	addi	s0,sp,80
    800079b4:	06c05c63          	blez	a2,80007a2c <consolewrite+0x9c>
    800079b8:	00060993          	mv	s3,a2
    800079bc:	00050a13          	mv	s4,a0
    800079c0:	00058493          	mv	s1,a1
    800079c4:	00000913          	li	s2,0
    800079c8:	fff00a93          	li	s5,-1
    800079cc:	01c0006f          	j	800079e8 <consolewrite+0x58>
    800079d0:	fbf44503          	lbu	a0,-65(s0)
    800079d4:	0019091b          	addiw	s2,s2,1
    800079d8:	00148493          	addi	s1,s1,1
    800079dc:	00001097          	auipc	ra,0x1
    800079e0:	a9c080e7          	jalr	-1380(ra) # 80008478 <uartputc>
    800079e4:	03298063          	beq	s3,s2,80007a04 <consolewrite+0x74>
    800079e8:	00048613          	mv	a2,s1
    800079ec:	00100693          	li	a3,1
    800079f0:	000a0593          	mv	a1,s4
    800079f4:	fbf40513          	addi	a0,s0,-65
    800079f8:	00000097          	auipc	ra,0x0
    800079fc:	9e0080e7          	jalr	-1568(ra) # 800073d8 <either_copyin>
    80007a00:	fd5518e3          	bne	a0,s5,800079d0 <consolewrite+0x40>
    80007a04:	04813083          	ld	ra,72(sp)
    80007a08:	04013403          	ld	s0,64(sp)
    80007a0c:	03813483          	ld	s1,56(sp)
    80007a10:	02813983          	ld	s3,40(sp)
    80007a14:	02013a03          	ld	s4,32(sp)
    80007a18:	01813a83          	ld	s5,24(sp)
    80007a1c:	00090513          	mv	a0,s2
    80007a20:	03013903          	ld	s2,48(sp)
    80007a24:	05010113          	addi	sp,sp,80
    80007a28:	00008067          	ret
    80007a2c:	00000913          	li	s2,0
    80007a30:	fd5ff06f          	j	80007a04 <consolewrite+0x74>

0000000080007a34 <consoleread>:
    80007a34:	f9010113          	addi	sp,sp,-112
    80007a38:	06813023          	sd	s0,96(sp)
    80007a3c:	04913c23          	sd	s1,88(sp)
    80007a40:	05213823          	sd	s2,80(sp)
    80007a44:	05313423          	sd	s3,72(sp)
    80007a48:	05413023          	sd	s4,64(sp)
    80007a4c:	03513c23          	sd	s5,56(sp)
    80007a50:	03613823          	sd	s6,48(sp)
    80007a54:	03713423          	sd	s7,40(sp)
    80007a58:	03813023          	sd	s8,32(sp)
    80007a5c:	06113423          	sd	ra,104(sp)
    80007a60:	01913c23          	sd	s9,24(sp)
    80007a64:	07010413          	addi	s0,sp,112
    80007a68:	00060b93          	mv	s7,a2
    80007a6c:	00050913          	mv	s2,a0
    80007a70:	00058c13          	mv	s8,a1
    80007a74:	00060b1b          	sext.w	s6,a2
    80007a78:	00006497          	auipc	s1,0x6
    80007a7c:	36048493          	addi	s1,s1,864 # 8000ddd8 <cons>
    80007a80:	00400993          	li	s3,4
    80007a84:	fff00a13          	li	s4,-1
    80007a88:	00a00a93          	li	s5,10
    80007a8c:	05705e63          	blez	s7,80007ae8 <consoleread+0xb4>
    80007a90:	09c4a703          	lw	a4,156(s1)
    80007a94:	0984a783          	lw	a5,152(s1)
    80007a98:	0007071b          	sext.w	a4,a4
    80007a9c:	08e78463          	beq	a5,a4,80007b24 <consoleread+0xf0>
    80007aa0:	07f7f713          	andi	a4,a5,127
    80007aa4:	00e48733          	add	a4,s1,a4
    80007aa8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80007aac:	0017869b          	addiw	a3,a5,1
    80007ab0:	08d4ac23          	sw	a3,152(s1)
    80007ab4:	00070c9b          	sext.w	s9,a4
    80007ab8:	0b370663          	beq	a4,s3,80007b64 <consoleread+0x130>
    80007abc:	00100693          	li	a3,1
    80007ac0:	f9f40613          	addi	a2,s0,-97
    80007ac4:	000c0593          	mv	a1,s8
    80007ac8:	00090513          	mv	a0,s2
    80007acc:	f8e40fa3          	sb	a4,-97(s0)
    80007ad0:	00000097          	auipc	ra,0x0
    80007ad4:	8bc080e7          	jalr	-1860(ra) # 8000738c <either_copyout>
    80007ad8:	01450863          	beq	a0,s4,80007ae8 <consoleread+0xb4>
    80007adc:	001c0c13          	addi	s8,s8,1
    80007ae0:	fffb8b9b          	addiw	s7,s7,-1
    80007ae4:	fb5c94e3          	bne	s9,s5,80007a8c <consoleread+0x58>
    80007ae8:	000b851b          	sext.w	a0,s7
    80007aec:	06813083          	ld	ra,104(sp)
    80007af0:	06013403          	ld	s0,96(sp)
    80007af4:	05813483          	ld	s1,88(sp)
    80007af8:	05013903          	ld	s2,80(sp)
    80007afc:	04813983          	ld	s3,72(sp)
    80007b00:	04013a03          	ld	s4,64(sp)
    80007b04:	03813a83          	ld	s5,56(sp)
    80007b08:	02813b83          	ld	s7,40(sp)
    80007b0c:	02013c03          	ld	s8,32(sp)
    80007b10:	01813c83          	ld	s9,24(sp)
    80007b14:	40ab053b          	subw	a0,s6,a0
    80007b18:	03013b03          	ld	s6,48(sp)
    80007b1c:	07010113          	addi	sp,sp,112
    80007b20:	00008067          	ret
    80007b24:	00001097          	auipc	ra,0x1
    80007b28:	1d8080e7          	jalr	472(ra) # 80008cfc <push_on>
    80007b2c:	0984a703          	lw	a4,152(s1)
    80007b30:	09c4a783          	lw	a5,156(s1)
    80007b34:	0007879b          	sext.w	a5,a5
    80007b38:	fef70ce3          	beq	a4,a5,80007b30 <consoleread+0xfc>
    80007b3c:	00001097          	auipc	ra,0x1
    80007b40:	234080e7          	jalr	564(ra) # 80008d70 <pop_on>
    80007b44:	0984a783          	lw	a5,152(s1)
    80007b48:	07f7f713          	andi	a4,a5,127
    80007b4c:	00e48733          	add	a4,s1,a4
    80007b50:	01874703          	lbu	a4,24(a4)
    80007b54:	0017869b          	addiw	a3,a5,1
    80007b58:	08d4ac23          	sw	a3,152(s1)
    80007b5c:	00070c9b          	sext.w	s9,a4
    80007b60:	f5371ee3          	bne	a4,s3,80007abc <consoleread+0x88>
    80007b64:	000b851b          	sext.w	a0,s7
    80007b68:	f96bf2e3          	bgeu	s7,s6,80007aec <consoleread+0xb8>
    80007b6c:	08f4ac23          	sw	a5,152(s1)
    80007b70:	f7dff06f          	j	80007aec <consoleread+0xb8>

0000000080007b74 <consputc>:
    80007b74:	10000793          	li	a5,256
    80007b78:	00f50663          	beq	a0,a5,80007b84 <consputc+0x10>
    80007b7c:	00001317          	auipc	t1,0x1
    80007b80:	9f430067          	jr	-1548(t1) # 80008570 <uartputc_sync>
    80007b84:	ff010113          	addi	sp,sp,-16
    80007b88:	00113423          	sd	ra,8(sp)
    80007b8c:	00813023          	sd	s0,0(sp)
    80007b90:	01010413          	addi	s0,sp,16
    80007b94:	00800513          	li	a0,8
    80007b98:	00001097          	auipc	ra,0x1
    80007b9c:	9d8080e7          	jalr	-1576(ra) # 80008570 <uartputc_sync>
    80007ba0:	02000513          	li	a0,32
    80007ba4:	00001097          	auipc	ra,0x1
    80007ba8:	9cc080e7          	jalr	-1588(ra) # 80008570 <uartputc_sync>
    80007bac:	00013403          	ld	s0,0(sp)
    80007bb0:	00813083          	ld	ra,8(sp)
    80007bb4:	00800513          	li	a0,8
    80007bb8:	01010113          	addi	sp,sp,16
    80007bbc:	00001317          	auipc	t1,0x1
    80007bc0:	9b430067          	jr	-1612(t1) # 80008570 <uartputc_sync>

0000000080007bc4 <consoleintr>:
    80007bc4:	fe010113          	addi	sp,sp,-32
    80007bc8:	00813823          	sd	s0,16(sp)
    80007bcc:	00913423          	sd	s1,8(sp)
    80007bd0:	01213023          	sd	s2,0(sp)
    80007bd4:	00113c23          	sd	ra,24(sp)
    80007bd8:	02010413          	addi	s0,sp,32
    80007bdc:	00006917          	auipc	s2,0x6
    80007be0:	1fc90913          	addi	s2,s2,508 # 8000ddd8 <cons>
    80007be4:	00050493          	mv	s1,a0
    80007be8:	00090513          	mv	a0,s2
    80007bec:	00001097          	auipc	ra,0x1
    80007bf0:	e40080e7          	jalr	-448(ra) # 80008a2c <acquire>
    80007bf4:	02048c63          	beqz	s1,80007c2c <consoleintr+0x68>
    80007bf8:	0a092783          	lw	a5,160(s2)
    80007bfc:	09892703          	lw	a4,152(s2)
    80007c00:	07f00693          	li	a3,127
    80007c04:	40e7873b          	subw	a4,a5,a4
    80007c08:	02e6e263          	bltu	a3,a4,80007c2c <consoleintr+0x68>
    80007c0c:	00d00713          	li	a4,13
    80007c10:	04e48063          	beq	s1,a4,80007c50 <consoleintr+0x8c>
    80007c14:	07f7f713          	andi	a4,a5,127
    80007c18:	00e90733          	add	a4,s2,a4
    80007c1c:	0017879b          	addiw	a5,a5,1
    80007c20:	0af92023          	sw	a5,160(s2)
    80007c24:	00970c23          	sb	s1,24(a4)
    80007c28:	08f92e23          	sw	a5,156(s2)
    80007c2c:	01013403          	ld	s0,16(sp)
    80007c30:	01813083          	ld	ra,24(sp)
    80007c34:	00813483          	ld	s1,8(sp)
    80007c38:	00013903          	ld	s2,0(sp)
    80007c3c:	00006517          	auipc	a0,0x6
    80007c40:	19c50513          	addi	a0,a0,412 # 8000ddd8 <cons>
    80007c44:	02010113          	addi	sp,sp,32
    80007c48:	00001317          	auipc	t1,0x1
    80007c4c:	eb030067          	jr	-336(t1) # 80008af8 <release>
    80007c50:	00a00493          	li	s1,10
    80007c54:	fc1ff06f          	j	80007c14 <consoleintr+0x50>

0000000080007c58 <consoleinit>:
    80007c58:	fe010113          	addi	sp,sp,-32
    80007c5c:	00113c23          	sd	ra,24(sp)
    80007c60:	00813823          	sd	s0,16(sp)
    80007c64:	00913423          	sd	s1,8(sp)
    80007c68:	02010413          	addi	s0,sp,32
    80007c6c:	00006497          	auipc	s1,0x6
    80007c70:	16c48493          	addi	s1,s1,364 # 8000ddd8 <cons>
    80007c74:	00048513          	mv	a0,s1
    80007c78:	00003597          	auipc	a1,0x3
    80007c7c:	b7858593          	addi	a1,a1,-1160 # 8000a7f0 <_ZZ9kPrintIntmE6digits+0x780>
    80007c80:	00001097          	auipc	ra,0x1
    80007c84:	d88080e7          	jalr	-632(ra) # 80008a08 <initlock>
    80007c88:	00000097          	auipc	ra,0x0
    80007c8c:	7ac080e7          	jalr	1964(ra) # 80008434 <uartinit>
    80007c90:	01813083          	ld	ra,24(sp)
    80007c94:	01013403          	ld	s0,16(sp)
    80007c98:	00000797          	auipc	a5,0x0
    80007c9c:	d9c78793          	addi	a5,a5,-612 # 80007a34 <consoleread>
    80007ca0:	0af4bc23          	sd	a5,184(s1)
    80007ca4:	00000797          	auipc	a5,0x0
    80007ca8:	cec78793          	addi	a5,a5,-788 # 80007990 <consolewrite>
    80007cac:	0cf4b023          	sd	a5,192(s1)
    80007cb0:	00813483          	ld	s1,8(sp)
    80007cb4:	02010113          	addi	sp,sp,32
    80007cb8:	00008067          	ret

0000000080007cbc <console_read>:
    80007cbc:	ff010113          	addi	sp,sp,-16
    80007cc0:	00813423          	sd	s0,8(sp)
    80007cc4:	01010413          	addi	s0,sp,16
    80007cc8:	00813403          	ld	s0,8(sp)
    80007ccc:	00006317          	auipc	t1,0x6
    80007cd0:	1c433303          	ld	t1,452(t1) # 8000de90 <devsw+0x10>
    80007cd4:	01010113          	addi	sp,sp,16
    80007cd8:	00030067          	jr	t1

0000000080007cdc <console_write>:
    80007cdc:	ff010113          	addi	sp,sp,-16
    80007ce0:	00813423          	sd	s0,8(sp)
    80007ce4:	01010413          	addi	s0,sp,16
    80007ce8:	00813403          	ld	s0,8(sp)
    80007cec:	00006317          	auipc	t1,0x6
    80007cf0:	1ac33303          	ld	t1,428(t1) # 8000de98 <devsw+0x18>
    80007cf4:	01010113          	addi	sp,sp,16
    80007cf8:	00030067          	jr	t1

0000000080007cfc <panic>:
    80007cfc:	fe010113          	addi	sp,sp,-32
    80007d00:	00113c23          	sd	ra,24(sp)
    80007d04:	00813823          	sd	s0,16(sp)
    80007d08:	00913423          	sd	s1,8(sp)
    80007d0c:	02010413          	addi	s0,sp,32
    80007d10:	00050493          	mv	s1,a0
    80007d14:	00003517          	auipc	a0,0x3
    80007d18:	ae450513          	addi	a0,a0,-1308 # 8000a7f8 <_ZZ9kPrintIntmE6digits+0x788>
    80007d1c:	00006797          	auipc	a5,0x6
    80007d20:	2007ae23          	sw	zero,540(a5) # 8000df38 <pr+0x18>
    80007d24:	00000097          	auipc	ra,0x0
    80007d28:	034080e7          	jalr	52(ra) # 80007d58 <__printf>
    80007d2c:	00048513          	mv	a0,s1
    80007d30:	00000097          	auipc	ra,0x0
    80007d34:	028080e7          	jalr	40(ra) # 80007d58 <__printf>
    80007d38:	00003517          	auipc	a0,0x3
    80007d3c:	84850513          	addi	a0,a0,-1976 # 8000a580 <_ZZ9kPrintIntmE6digits+0x510>
    80007d40:	00000097          	auipc	ra,0x0
    80007d44:	018080e7          	jalr	24(ra) # 80007d58 <__printf>
    80007d48:	00100793          	li	a5,1
    80007d4c:	00005717          	auipc	a4,0x5
    80007d50:	e0f72e23          	sw	a5,-484(a4) # 8000cb68 <panicked>
    80007d54:	0000006f          	j	80007d54 <panic+0x58>

0000000080007d58 <__printf>:
    80007d58:	f3010113          	addi	sp,sp,-208
    80007d5c:	08813023          	sd	s0,128(sp)
    80007d60:	07313423          	sd	s3,104(sp)
    80007d64:	09010413          	addi	s0,sp,144
    80007d68:	05813023          	sd	s8,64(sp)
    80007d6c:	08113423          	sd	ra,136(sp)
    80007d70:	06913c23          	sd	s1,120(sp)
    80007d74:	07213823          	sd	s2,112(sp)
    80007d78:	07413023          	sd	s4,96(sp)
    80007d7c:	05513c23          	sd	s5,88(sp)
    80007d80:	05613823          	sd	s6,80(sp)
    80007d84:	05713423          	sd	s7,72(sp)
    80007d88:	03913c23          	sd	s9,56(sp)
    80007d8c:	03a13823          	sd	s10,48(sp)
    80007d90:	03b13423          	sd	s11,40(sp)
    80007d94:	00006317          	auipc	t1,0x6
    80007d98:	18c30313          	addi	t1,t1,396 # 8000df20 <pr>
    80007d9c:	01832c03          	lw	s8,24(t1)
    80007da0:	00b43423          	sd	a1,8(s0)
    80007da4:	00c43823          	sd	a2,16(s0)
    80007da8:	00d43c23          	sd	a3,24(s0)
    80007dac:	02e43023          	sd	a4,32(s0)
    80007db0:	02f43423          	sd	a5,40(s0)
    80007db4:	03043823          	sd	a6,48(s0)
    80007db8:	03143c23          	sd	a7,56(s0)
    80007dbc:	00050993          	mv	s3,a0
    80007dc0:	4a0c1663          	bnez	s8,8000826c <__printf+0x514>
    80007dc4:	60098c63          	beqz	s3,800083dc <__printf+0x684>
    80007dc8:	0009c503          	lbu	a0,0(s3)
    80007dcc:	00840793          	addi	a5,s0,8
    80007dd0:	f6f43c23          	sd	a5,-136(s0)
    80007dd4:	00000493          	li	s1,0
    80007dd8:	22050063          	beqz	a0,80007ff8 <__printf+0x2a0>
    80007ddc:	00002a37          	lui	s4,0x2
    80007de0:	00018ab7          	lui	s5,0x18
    80007de4:	000f4b37          	lui	s6,0xf4
    80007de8:	00989bb7          	lui	s7,0x989
    80007dec:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007df0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007df4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007df8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007dfc:	00148c9b          	addiw	s9,s1,1
    80007e00:	02500793          	li	a5,37
    80007e04:	01998933          	add	s2,s3,s9
    80007e08:	38f51263          	bne	a0,a5,8000818c <__printf+0x434>
    80007e0c:	00094783          	lbu	a5,0(s2)
    80007e10:	00078c9b          	sext.w	s9,a5
    80007e14:	1e078263          	beqz	a5,80007ff8 <__printf+0x2a0>
    80007e18:	0024849b          	addiw	s1,s1,2
    80007e1c:	07000713          	li	a4,112
    80007e20:	00998933          	add	s2,s3,s1
    80007e24:	38e78a63          	beq	a5,a4,800081b8 <__printf+0x460>
    80007e28:	20f76863          	bltu	a4,a5,80008038 <__printf+0x2e0>
    80007e2c:	42a78863          	beq	a5,a0,8000825c <__printf+0x504>
    80007e30:	06400713          	li	a4,100
    80007e34:	40e79663          	bne	a5,a4,80008240 <__printf+0x4e8>
    80007e38:	f7843783          	ld	a5,-136(s0)
    80007e3c:	0007a603          	lw	a2,0(a5)
    80007e40:	00878793          	addi	a5,a5,8
    80007e44:	f6f43c23          	sd	a5,-136(s0)
    80007e48:	42064a63          	bltz	a2,8000827c <__printf+0x524>
    80007e4c:	00a00713          	li	a4,10
    80007e50:	02e677bb          	remuw	a5,a2,a4
    80007e54:	00003d97          	auipc	s11,0x3
    80007e58:	9ccd8d93          	addi	s11,s11,-1588 # 8000a820 <digits>
    80007e5c:	00900593          	li	a1,9
    80007e60:	0006051b          	sext.w	a0,a2
    80007e64:	00000c93          	li	s9,0
    80007e68:	02079793          	slli	a5,a5,0x20
    80007e6c:	0207d793          	srli	a5,a5,0x20
    80007e70:	00fd87b3          	add	a5,s11,a5
    80007e74:	0007c783          	lbu	a5,0(a5)
    80007e78:	02e656bb          	divuw	a3,a2,a4
    80007e7c:	f8f40023          	sb	a5,-128(s0)
    80007e80:	14c5d863          	bge	a1,a2,80007fd0 <__printf+0x278>
    80007e84:	06300593          	li	a1,99
    80007e88:	00100c93          	li	s9,1
    80007e8c:	02e6f7bb          	remuw	a5,a3,a4
    80007e90:	02079793          	slli	a5,a5,0x20
    80007e94:	0207d793          	srli	a5,a5,0x20
    80007e98:	00fd87b3          	add	a5,s11,a5
    80007e9c:	0007c783          	lbu	a5,0(a5)
    80007ea0:	02e6d73b          	divuw	a4,a3,a4
    80007ea4:	f8f400a3          	sb	a5,-127(s0)
    80007ea8:	12a5f463          	bgeu	a1,a0,80007fd0 <__printf+0x278>
    80007eac:	00a00693          	li	a3,10
    80007eb0:	00900593          	li	a1,9
    80007eb4:	02d777bb          	remuw	a5,a4,a3
    80007eb8:	02079793          	slli	a5,a5,0x20
    80007ebc:	0207d793          	srli	a5,a5,0x20
    80007ec0:	00fd87b3          	add	a5,s11,a5
    80007ec4:	0007c503          	lbu	a0,0(a5)
    80007ec8:	02d757bb          	divuw	a5,a4,a3
    80007ecc:	f8a40123          	sb	a0,-126(s0)
    80007ed0:	48e5f263          	bgeu	a1,a4,80008354 <__printf+0x5fc>
    80007ed4:	06300513          	li	a0,99
    80007ed8:	02d7f5bb          	remuw	a1,a5,a3
    80007edc:	02059593          	slli	a1,a1,0x20
    80007ee0:	0205d593          	srli	a1,a1,0x20
    80007ee4:	00bd85b3          	add	a1,s11,a1
    80007ee8:	0005c583          	lbu	a1,0(a1)
    80007eec:	02d7d7bb          	divuw	a5,a5,a3
    80007ef0:	f8b401a3          	sb	a1,-125(s0)
    80007ef4:	48e57263          	bgeu	a0,a4,80008378 <__printf+0x620>
    80007ef8:	3e700513          	li	a0,999
    80007efc:	02d7f5bb          	remuw	a1,a5,a3
    80007f00:	02059593          	slli	a1,a1,0x20
    80007f04:	0205d593          	srli	a1,a1,0x20
    80007f08:	00bd85b3          	add	a1,s11,a1
    80007f0c:	0005c583          	lbu	a1,0(a1)
    80007f10:	02d7d7bb          	divuw	a5,a5,a3
    80007f14:	f8b40223          	sb	a1,-124(s0)
    80007f18:	46e57663          	bgeu	a0,a4,80008384 <__printf+0x62c>
    80007f1c:	02d7f5bb          	remuw	a1,a5,a3
    80007f20:	02059593          	slli	a1,a1,0x20
    80007f24:	0205d593          	srli	a1,a1,0x20
    80007f28:	00bd85b3          	add	a1,s11,a1
    80007f2c:	0005c583          	lbu	a1,0(a1)
    80007f30:	02d7d7bb          	divuw	a5,a5,a3
    80007f34:	f8b402a3          	sb	a1,-123(s0)
    80007f38:	46ea7863          	bgeu	s4,a4,800083a8 <__printf+0x650>
    80007f3c:	02d7f5bb          	remuw	a1,a5,a3
    80007f40:	02059593          	slli	a1,a1,0x20
    80007f44:	0205d593          	srli	a1,a1,0x20
    80007f48:	00bd85b3          	add	a1,s11,a1
    80007f4c:	0005c583          	lbu	a1,0(a1)
    80007f50:	02d7d7bb          	divuw	a5,a5,a3
    80007f54:	f8b40323          	sb	a1,-122(s0)
    80007f58:	3eeaf863          	bgeu	s5,a4,80008348 <__printf+0x5f0>
    80007f5c:	02d7f5bb          	remuw	a1,a5,a3
    80007f60:	02059593          	slli	a1,a1,0x20
    80007f64:	0205d593          	srli	a1,a1,0x20
    80007f68:	00bd85b3          	add	a1,s11,a1
    80007f6c:	0005c583          	lbu	a1,0(a1)
    80007f70:	02d7d7bb          	divuw	a5,a5,a3
    80007f74:	f8b403a3          	sb	a1,-121(s0)
    80007f78:	42eb7e63          	bgeu	s6,a4,800083b4 <__printf+0x65c>
    80007f7c:	02d7f5bb          	remuw	a1,a5,a3
    80007f80:	02059593          	slli	a1,a1,0x20
    80007f84:	0205d593          	srli	a1,a1,0x20
    80007f88:	00bd85b3          	add	a1,s11,a1
    80007f8c:	0005c583          	lbu	a1,0(a1)
    80007f90:	02d7d7bb          	divuw	a5,a5,a3
    80007f94:	f8b40423          	sb	a1,-120(s0)
    80007f98:	42ebfc63          	bgeu	s7,a4,800083d0 <__printf+0x678>
    80007f9c:	02079793          	slli	a5,a5,0x20
    80007fa0:	0207d793          	srli	a5,a5,0x20
    80007fa4:	00fd8db3          	add	s11,s11,a5
    80007fa8:	000dc703          	lbu	a4,0(s11)
    80007fac:	00a00793          	li	a5,10
    80007fb0:	00900c93          	li	s9,9
    80007fb4:	f8e404a3          	sb	a4,-119(s0)
    80007fb8:	00065c63          	bgez	a2,80007fd0 <__printf+0x278>
    80007fbc:	f9040713          	addi	a4,s0,-112
    80007fc0:	00f70733          	add	a4,a4,a5
    80007fc4:	02d00693          	li	a3,45
    80007fc8:	fed70823          	sb	a3,-16(a4)
    80007fcc:	00078c93          	mv	s9,a5
    80007fd0:	f8040793          	addi	a5,s0,-128
    80007fd4:	01978cb3          	add	s9,a5,s9
    80007fd8:	f7f40d13          	addi	s10,s0,-129
    80007fdc:	000cc503          	lbu	a0,0(s9)
    80007fe0:	fffc8c93          	addi	s9,s9,-1
    80007fe4:	00000097          	auipc	ra,0x0
    80007fe8:	b90080e7          	jalr	-1136(ra) # 80007b74 <consputc>
    80007fec:	ffac98e3          	bne	s9,s10,80007fdc <__printf+0x284>
    80007ff0:	00094503          	lbu	a0,0(s2)
    80007ff4:	e00514e3          	bnez	a0,80007dfc <__printf+0xa4>
    80007ff8:	1a0c1663          	bnez	s8,800081a4 <__printf+0x44c>
    80007ffc:	08813083          	ld	ra,136(sp)
    80008000:	08013403          	ld	s0,128(sp)
    80008004:	07813483          	ld	s1,120(sp)
    80008008:	07013903          	ld	s2,112(sp)
    8000800c:	06813983          	ld	s3,104(sp)
    80008010:	06013a03          	ld	s4,96(sp)
    80008014:	05813a83          	ld	s5,88(sp)
    80008018:	05013b03          	ld	s6,80(sp)
    8000801c:	04813b83          	ld	s7,72(sp)
    80008020:	04013c03          	ld	s8,64(sp)
    80008024:	03813c83          	ld	s9,56(sp)
    80008028:	03013d03          	ld	s10,48(sp)
    8000802c:	02813d83          	ld	s11,40(sp)
    80008030:	0d010113          	addi	sp,sp,208
    80008034:	00008067          	ret
    80008038:	07300713          	li	a4,115
    8000803c:	1ce78a63          	beq	a5,a4,80008210 <__printf+0x4b8>
    80008040:	07800713          	li	a4,120
    80008044:	1ee79e63          	bne	a5,a4,80008240 <__printf+0x4e8>
    80008048:	f7843783          	ld	a5,-136(s0)
    8000804c:	0007a703          	lw	a4,0(a5)
    80008050:	00878793          	addi	a5,a5,8
    80008054:	f6f43c23          	sd	a5,-136(s0)
    80008058:	28074263          	bltz	a4,800082dc <__printf+0x584>
    8000805c:	00002d97          	auipc	s11,0x2
    80008060:	7c4d8d93          	addi	s11,s11,1988 # 8000a820 <digits>
    80008064:	00f77793          	andi	a5,a4,15
    80008068:	00fd87b3          	add	a5,s11,a5
    8000806c:	0007c683          	lbu	a3,0(a5)
    80008070:	00f00613          	li	a2,15
    80008074:	0007079b          	sext.w	a5,a4
    80008078:	f8d40023          	sb	a3,-128(s0)
    8000807c:	0047559b          	srliw	a1,a4,0x4
    80008080:	0047569b          	srliw	a3,a4,0x4
    80008084:	00000c93          	li	s9,0
    80008088:	0ee65063          	bge	a2,a4,80008168 <__printf+0x410>
    8000808c:	00f6f693          	andi	a3,a3,15
    80008090:	00dd86b3          	add	a3,s11,a3
    80008094:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80008098:	0087d79b          	srliw	a5,a5,0x8
    8000809c:	00100c93          	li	s9,1
    800080a0:	f8d400a3          	sb	a3,-127(s0)
    800080a4:	0cb67263          	bgeu	a2,a1,80008168 <__printf+0x410>
    800080a8:	00f7f693          	andi	a3,a5,15
    800080ac:	00dd86b3          	add	a3,s11,a3
    800080b0:	0006c583          	lbu	a1,0(a3)
    800080b4:	00f00613          	li	a2,15
    800080b8:	0047d69b          	srliw	a3,a5,0x4
    800080bc:	f8b40123          	sb	a1,-126(s0)
    800080c0:	0047d593          	srli	a1,a5,0x4
    800080c4:	28f67e63          	bgeu	a2,a5,80008360 <__printf+0x608>
    800080c8:	00f6f693          	andi	a3,a3,15
    800080cc:	00dd86b3          	add	a3,s11,a3
    800080d0:	0006c503          	lbu	a0,0(a3)
    800080d4:	0087d813          	srli	a6,a5,0x8
    800080d8:	0087d69b          	srliw	a3,a5,0x8
    800080dc:	f8a401a3          	sb	a0,-125(s0)
    800080e0:	28b67663          	bgeu	a2,a1,8000836c <__printf+0x614>
    800080e4:	00f6f693          	andi	a3,a3,15
    800080e8:	00dd86b3          	add	a3,s11,a3
    800080ec:	0006c583          	lbu	a1,0(a3)
    800080f0:	00c7d513          	srli	a0,a5,0xc
    800080f4:	00c7d69b          	srliw	a3,a5,0xc
    800080f8:	f8b40223          	sb	a1,-124(s0)
    800080fc:	29067a63          	bgeu	a2,a6,80008390 <__printf+0x638>
    80008100:	00f6f693          	andi	a3,a3,15
    80008104:	00dd86b3          	add	a3,s11,a3
    80008108:	0006c583          	lbu	a1,0(a3)
    8000810c:	0107d813          	srli	a6,a5,0x10
    80008110:	0107d69b          	srliw	a3,a5,0x10
    80008114:	f8b402a3          	sb	a1,-123(s0)
    80008118:	28a67263          	bgeu	a2,a0,8000839c <__printf+0x644>
    8000811c:	00f6f693          	andi	a3,a3,15
    80008120:	00dd86b3          	add	a3,s11,a3
    80008124:	0006c683          	lbu	a3,0(a3)
    80008128:	0147d79b          	srliw	a5,a5,0x14
    8000812c:	f8d40323          	sb	a3,-122(s0)
    80008130:	21067663          	bgeu	a2,a6,8000833c <__printf+0x5e4>
    80008134:	02079793          	slli	a5,a5,0x20
    80008138:	0207d793          	srli	a5,a5,0x20
    8000813c:	00fd8db3          	add	s11,s11,a5
    80008140:	000dc683          	lbu	a3,0(s11)
    80008144:	00800793          	li	a5,8
    80008148:	00700c93          	li	s9,7
    8000814c:	f8d403a3          	sb	a3,-121(s0)
    80008150:	00075c63          	bgez	a4,80008168 <__printf+0x410>
    80008154:	f9040713          	addi	a4,s0,-112
    80008158:	00f70733          	add	a4,a4,a5
    8000815c:	02d00693          	li	a3,45
    80008160:	fed70823          	sb	a3,-16(a4)
    80008164:	00078c93          	mv	s9,a5
    80008168:	f8040793          	addi	a5,s0,-128
    8000816c:	01978cb3          	add	s9,a5,s9
    80008170:	f7f40d13          	addi	s10,s0,-129
    80008174:	000cc503          	lbu	a0,0(s9)
    80008178:	fffc8c93          	addi	s9,s9,-1
    8000817c:	00000097          	auipc	ra,0x0
    80008180:	9f8080e7          	jalr	-1544(ra) # 80007b74 <consputc>
    80008184:	ff9d18e3          	bne	s10,s9,80008174 <__printf+0x41c>
    80008188:	0100006f          	j	80008198 <__printf+0x440>
    8000818c:	00000097          	auipc	ra,0x0
    80008190:	9e8080e7          	jalr	-1560(ra) # 80007b74 <consputc>
    80008194:	000c8493          	mv	s1,s9
    80008198:	00094503          	lbu	a0,0(s2)
    8000819c:	c60510e3          	bnez	a0,80007dfc <__printf+0xa4>
    800081a0:	e40c0ee3          	beqz	s8,80007ffc <__printf+0x2a4>
    800081a4:	00006517          	auipc	a0,0x6
    800081a8:	d7c50513          	addi	a0,a0,-644 # 8000df20 <pr>
    800081ac:	00001097          	auipc	ra,0x1
    800081b0:	94c080e7          	jalr	-1716(ra) # 80008af8 <release>
    800081b4:	e49ff06f          	j	80007ffc <__printf+0x2a4>
    800081b8:	f7843783          	ld	a5,-136(s0)
    800081bc:	03000513          	li	a0,48
    800081c0:	01000d13          	li	s10,16
    800081c4:	00878713          	addi	a4,a5,8
    800081c8:	0007bc83          	ld	s9,0(a5)
    800081cc:	f6e43c23          	sd	a4,-136(s0)
    800081d0:	00000097          	auipc	ra,0x0
    800081d4:	9a4080e7          	jalr	-1628(ra) # 80007b74 <consputc>
    800081d8:	07800513          	li	a0,120
    800081dc:	00000097          	auipc	ra,0x0
    800081e0:	998080e7          	jalr	-1640(ra) # 80007b74 <consputc>
    800081e4:	00002d97          	auipc	s11,0x2
    800081e8:	63cd8d93          	addi	s11,s11,1596 # 8000a820 <digits>
    800081ec:	03ccd793          	srli	a5,s9,0x3c
    800081f0:	00fd87b3          	add	a5,s11,a5
    800081f4:	0007c503          	lbu	a0,0(a5)
    800081f8:	fffd0d1b          	addiw	s10,s10,-1
    800081fc:	004c9c93          	slli	s9,s9,0x4
    80008200:	00000097          	auipc	ra,0x0
    80008204:	974080e7          	jalr	-1676(ra) # 80007b74 <consputc>
    80008208:	fe0d12e3          	bnez	s10,800081ec <__printf+0x494>
    8000820c:	f8dff06f          	j	80008198 <__printf+0x440>
    80008210:	f7843783          	ld	a5,-136(s0)
    80008214:	0007bc83          	ld	s9,0(a5)
    80008218:	00878793          	addi	a5,a5,8
    8000821c:	f6f43c23          	sd	a5,-136(s0)
    80008220:	000c9a63          	bnez	s9,80008234 <__printf+0x4dc>
    80008224:	1080006f          	j	8000832c <__printf+0x5d4>
    80008228:	001c8c93          	addi	s9,s9,1
    8000822c:	00000097          	auipc	ra,0x0
    80008230:	948080e7          	jalr	-1720(ra) # 80007b74 <consputc>
    80008234:	000cc503          	lbu	a0,0(s9)
    80008238:	fe0518e3          	bnez	a0,80008228 <__printf+0x4d0>
    8000823c:	f5dff06f          	j	80008198 <__printf+0x440>
    80008240:	02500513          	li	a0,37
    80008244:	00000097          	auipc	ra,0x0
    80008248:	930080e7          	jalr	-1744(ra) # 80007b74 <consputc>
    8000824c:	000c8513          	mv	a0,s9
    80008250:	00000097          	auipc	ra,0x0
    80008254:	924080e7          	jalr	-1756(ra) # 80007b74 <consputc>
    80008258:	f41ff06f          	j	80008198 <__printf+0x440>
    8000825c:	02500513          	li	a0,37
    80008260:	00000097          	auipc	ra,0x0
    80008264:	914080e7          	jalr	-1772(ra) # 80007b74 <consputc>
    80008268:	f31ff06f          	j	80008198 <__printf+0x440>
    8000826c:	00030513          	mv	a0,t1
    80008270:	00000097          	auipc	ra,0x0
    80008274:	7bc080e7          	jalr	1980(ra) # 80008a2c <acquire>
    80008278:	b4dff06f          	j	80007dc4 <__printf+0x6c>
    8000827c:	40c0053b          	negw	a0,a2
    80008280:	00a00713          	li	a4,10
    80008284:	02e576bb          	remuw	a3,a0,a4
    80008288:	00002d97          	auipc	s11,0x2
    8000828c:	598d8d93          	addi	s11,s11,1432 # 8000a820 <digits>
    80008290:	ff700593          	li	a1,-9
    80008294:	02069693          	slli	a3,a3,0x20
    80008298:	0206d693          	srli	a3,a3,0x20
    8000829c:	00dd86b3          	add	a3,s11,a3
    800082a0:	0006c683          	lbu	a3,0(a3)
    800082a4:	02e557bb          	divuw	a5,a0,a4
    800082a8:	f8d40023          	sb	a3,-128(s0)
    800082ac:	10b65e63          	bge	a2,a1,800083c8 <__printf+0x670>
    800082b0:	06300593          	li	a1,99
    800082b4:	02e7f6bb          	remuw	a3,a5,a4
    800082b8:	02069693          	slli	a3,a3,0x20
    800082bc:	0206d693          	srli	a3,a3,0x20
    800082c0:	00dd86b3          	add	a3,s11,a3
    800082c4:	0006c683          	lbu	a3,0(a3)
    800082c8:	02e7d73b          	divuw	a4,a5,a4
    800082cc:	00200793          	li	a5,2
    800082d0:	f8d400a3          	sb	a3,-127(s0)
    800082d4:	bca5ece3          	bltu	a1,a0,80007eac <__printf+0x154>
    800082d8:	ce5ff06f          	j	80007fbc <__printf+0x264>
    800082dc:	40e007bb          	negw	a5,a4
    800082e0:	00002d97          	auipc	s11,0x2
    800082e4:	540d8d93          	addi	s11,s11,1344 # 8000a820 <digits>
    800082e8:	00f7f693          	andi	a3,a5,15
    800082ec:	00dd86b3          	add	a3,s11,a3
    800082f0:	0006c583          	lbu	a1,0(a3)
    800082f4:	ff100613          	li	a2,-15
    800082f8:	0047d69b          	srliw	a3,a5,0x4
    800082fc:	f8b40023          	sb	a1,-128(s0)
    80008300:	0047d59b          	srliw	a1,a5,0x4
    80008304:	0ac75e63          	bge	a4,a2,800083c0 <__printf+0x668>
    80008308:	00f6f693          	andi	a3,a3,15
    8000830c:	00dd86b3          	add	a3,s11,a3
    80008310:	0006c603          	lbu	a2,0(a3)
    80008314:	00f00693          	li	a3,15
    80008318:	0087d79b          	srliw	a5,a5,0x8
    8000831c:	f8c400a3          	sb	a2,-127(s0)
    80008320:	d8b6e4e3          	bltu	a3,a1,800080a8 <__printf+0x350>
    80008324:	00200793          	li	a5,2
    80008328:	e2dff06f          	j	80008154 <__printf+0x3fc>
    8000832c:	00002c97          	auipc	s9,0x2
    80008330:	4d4c8c93          	addi	s9,s9,1236 # 8000a800 <_ZZ9kPrintIntmE6digits+0x790>
    80008334:	02800513          	li	a0,40
    80008338:	ef1ff06f          	j	80008228 <__printf+0x4d0>
    8000833c:	00700793          	li	a5,7
    80008340:	00600c93          	li	s9,6
    80008344:	e0dff06f          	j	80008150 <__printf+0x3f8>
    80008348:	00700793          	li	a5,7
    8000834c:	00600c93          	li	s9,6
    80008350:	c69ff06f          	j	80007fb8 <__printf+0x260>
    80008354:	00300793          	li	a5,3
    80008358:	00200c93          	li	s9,2
    8000835c:	c5dff06f          	j	80007fb8 <__printf+0x260>
    80008360:	00300793          	li	a5,3
    80008364:	00200c93          	li	s9,2
    80008368:	de9ff06f          	j	80008150 <__printf+0x3f8>
    8000836c:	00400793          	li	a5,4
    80008370:	00300c93          	li	s9,3
    80008374:	dddff06f          	j	80008150 <__printf+0x3f8>
    80008378:	00400793          	li	a5,4
    8000837c:	00300c93          	li	s9,3
    80008380:	c39ff06f          	j	80007fb8 <__printf+0x260>
    80008384:	00500793          	li	a5,5
    80008388:	00400c93          	li	s9,4
    8000838c:	c2dff06f          	j	80007fb8 <__printf+0x260>
    80008390:	00500793          	li	a5,5
    80008394:	00400c93          	li	s9,4
    80008398:	db9ff06f          	j	80008150 <__printf+0x3f8>
    8000839c:	00600793          	li	a5,6
    800083a0:	00500c93          	li	s9,5
    800083a4:	dadff06f          	j	80008150 <__printf+0x3f8>
    800083a8:	00600793          	li	a5,6
    800083ac:	00500c93          	li	s9,5
    800083b0:	c09ff06f          	j	80007fb8 <__printf+0x260>
    800083b4:	00800793          	li	a5,8
    800083b8:	00700c93          	li	s9,7
    800083bc:	bfdff06f          	j	80007fb8 <__printf+0x260>
    800083c0:	00100793          	li	a5,1
    800083c4:	d91ff06f          	j	80008154 <__printf+0x3fc>
    800083c8:	00100793          	li	a5,1
    800083cc:	bf1ff06f          	j	80007fbc <__printf+0x264>
    800083d0:	00900793          	li	a5,9
    800083d4:	00800c93          	li	s9,8
    800083d8:	be1ff06f          	j	80007fb8 <__printf+0x260>
    800083dc:	00002517          	auipc	a0,0x2
    800083e0:	42c50513          	addi	a0,a0,1068 # 8000a808 <_ZZ9kPrintIntmE6digits+0x798>
    800083e4:	00000097          	auipc	ra,0x0
    800083e8:	918080e7          	jalr	-1768(ra) # 80007cfc <panic>

00000000800083ec <printfinit>:
    800083ec:	fe010113          	addi	sp,sp,-32
    800083f0:	00813823          	sd	s0,16(sp)
    800083f4:	00913423          	sd	s1,8(sp)
    800083f8:	00113c23          	sd	ra,24(sp)
    800083fc:	02010413          	addi	s0,sp,32
    80008400:	00006497          	auipc	s1,0x6
    80008404:	b2048493          	addi	s1,s1,-1248 # 8000df20 <pr>
    80008408:	00048513          	mv	a0,s1
    8000840c:	00002597          	auipc	a1,0x2
    80008410:	40c58593          	addi	a1,a1,1036 # 8000a818 <_ZZ9kPrintIntmE6digits+0x7a8>
    80008414:	00000097          	auipc	ra,0x0
    80008418:	5f4080e7          	jalr	1524(ra) # 80008a08 <initlock>
    8000841c:	01813083          	ld	ra,24(sp)
    80008420:	01013403          	ld	s0,16(sp)
    80008424:	0004ac23          	sw	zero,24(s1)
    80008428:	00813483          	ld	s1,8(sp)
    8000842c:	02010113          	addi	sp,sp,32
    80008430:	00008067          	ret

0000000080008434 <uartinit>:
    80008434:	ff010113          	addi	sp,sp,-16
    80008438:	00813423          	sd	s0,8(sp)
    8000843c:	01010413          	addi	s0,sp,16
    80008440:	100007b7          	lui	a5,0x10000
    80008444:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008448:	f8000713          	li	a4,-128
    8000844c:	00e781a3          	sb	a4,3(a5)
    80008450:	00300713          	li	a4,3
    80008454:	00e78023          	sb	a4,0(a5)
    80008458:	000780a3          	sb	zero,1(a5)
    8000845c:	00e781a3          	sb	a4,3(a5)
    80008460:	00700693          	li	a3,7
    80008464:	00d78123          	sb	a3,2(a5)
    80008468:	00e780a3          	sb	a4,1(a5)
    8000846c:	00813403          	ld	s0,8(sp)
    80008470:	01010113          	addi	sp,sp,16
    80008474:	00008067          	ret

0000000080008478 <uartputc>:
    80008478:	00004797          	auipc	a5,0x4
    8000847c:	6f07a783          	lw	a5,1776(a5) # 8000cb68 <panicked>
    80008480:	00078463          	beqz	a5,80008488 <uartputc+0x10>
    80008484:	0000006f          	j	80008484 <uartputc+0xc>
    80008488:	fd010113          	addi	sp,sp,-48
    8000848c:	02813023          	sd	s0,32(sp)
    80008490:	00913c23          	sd	s1,24(sp)
    80008494:	01213823          	sd	s2,16(sp)
    80008498:	01313423          	sd	s3,8(sp)
    8000849c:	02113423          	sd	ra,40(sp)
    800084a0:	03010413          	addi	s0,sp,48
    800084a4:	00004917          	auipc	s2,0x4
    800084a8:	6cc90913          	addi	s2,s2,1740 # 8000cb70 <uart_tx_r>
    800084ac:	00093783          	ld	a5,0(s2)
    800084b0:	00004497          	auipc	s1,0x4
    800084b4:	6c848493          	addi	s1,s1,1736 # 8000cb78 <uart_tx_w>
    800084b8:	0004b703          	ld	a4,0(s1)
    800084bc:	02078693          	addi	a3,a5,32
    800084c0:	00050993          	mv	s3,a0
    800084c4:	02e69c63          	bne	a3,a4,800084fc <uartputc+0x84>
    800084c8:	00001097          	auipc	ra,0x1
    800084cc:	834080e7          	jalr	-1996(ra) # 80008cfc <push_on>
    800084d0:	00093783          	ld	a5,0(s2)
    800084d4:	0004b703          	ld	a4,0(s1)
    800084d8:	02078793          	addi	a5,a5,32
    800084dc:	00e79463          	bne	a5,a4,800084e4 <uartputc+0x6c>
    800084e0:	0000006f          	j	800084e0 <uartputc+0x68>
    800084e4:	00001097          	auipc	ra,0x1
    800084e8:	88c080e7          	jalr	-1908(ra) # 80008d70 <pop_on>
    800084ec:	00093783          	ld	a5,0(s2)
    800084f0:	0004b703          	ld	a4,0(s1)
    800084f4:	02078693          	addi	a3,a5,32
    800084f8:	fce688e3          	beq	a3,a4,800084c8 <uartputc+0x50>
    800084fc:	01f77693          	andi	a3,a4,31
    80008500:	00006597          	auipc	a1,0x6
    80008504:	a4058593          	addi	a1,a1,-1472 # 8000df40 <uart_tx_buf>
    80008508:	00d586b3          	add	a3,a1,a3
    8000850c:	00170713          	addi	a4,a4,1
    80008510:	01368023          	sb	s3,0(a3)
    80008514:	00e4b023          	sd	a4,0(s1)
    80008518:	10000637          	lui	a2,0x10000
    8000851c:	02f71063          	bne	a4,a5,8000853c <uartputc+0xc4>
    80008520:	0340006f          	j	80008554 <uartputc+0xdc>
    80008524:	00074703          	lbu	a4,0(a4)
    80008528:	00f93023          	sd	a5,0(s2)
    8000852c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008530:	00093783          	ld	a5,0(s2)
    80008534:	0004b703          	ld	a4,0(s1)
    80008538:	00f70e63          	beq	a4,a5,80008554 <uartputc+0xdc>
    8000853c:	00564683          	lbu	a3,5(a2)
    80008540:	01f7f713          	andi	a4,a5,31
    80008544:	00e58733          	add	a4,a1,a4
    80008548:	0206f693          	andi	a3,a3,32
    8000854c:	00178793          	addi	a5,a5,1
    80008550:	fc069ae3          	bnez	a3,80008524 <uartputc+0xac>
    80008554:	02813083          	ld	ra,40(sp)
    80008558:	02013403          	ld	s0,32(sp)
    8000855c:	01813483          	ld	s1,24(sp)
    80008560:	01013903          	ld	s2,16(sp)
    80008564:	00813983          	ld	s3,8(sp)
    80008568:	03010113          	addi	sp,sp,48
    8000856c:	00008067          	ret

0000000080008570 <uartputc_sync>:
    80008570:	ff010113          	addi	sp,sp,-16
    80008574:	00813423          	sd	s0,8(sp)
    80008578:	01010413          	addi	s0,sp,16
    8000857c:	00004717          	auipc	a4,0x4
    80008580:	5ec72703          	lw	a4,1516(a4) # 8000cb68 <panicked>
    80008584:	02071663          	bnez	a4,800085b0 <uartputc_sync+0x40>
    80008588:	00050793          	mv	a5,a0
    8000858c:	100006b7          	lui	a3,0x10000
    80008590:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008594:	02077713          	andi	a4,a4,32
    80008598:	fe070ce3          	beqz	a4,80008590 <uartputc_sync+0x20>
    8000859c:	0ff7f793          	andi	a5,a5,255
    800085a0:	00f68023          	sb	a5,0(a3)
    800085a4:	00813403          	ld	s0,8(sp)
    800085a8:	01010113          	addi	sp,sp,16
    800085ac:	00008067          	ret
    800085b0:	0000006f          	j	800085b0 <uartputc_sync+0x40>

00000000800085b4 <uartstart>:
    800085b4:	ff010113          	addi	sp,sp,-16
    800085b8:	00813423          	sd	s0,8(sp)
    800085bc:	01010413          	addi	s0,sp,16
    800085c0:	00004617          	auipc	a2,0x4
    800085c4:	5b060613          	addi	a2,a2,1456 # 8000cb70 <uart_tx_r>
    800085c8:	00004517          	auipc	a0,0x4
    800085cc:	5b050513          	addi	a0,a0,1456 # 8000cb78 <uart_tx_w>
    800085d0:	00063783          	ld	a5,0(a2)
    800085d4:	00053703          	ld	a4,0(a0)
    800085d8:	04f70263          	beq	a4,a5,8000861c <uartstart+0x68>
    800085dc:	100005b7          	lui	a1,0x10000
    800085e0:	00006817          	auipc	a6,0x6
    800085e4:	96080813          	addi	a6,a6,-1696 # 8000df40 <uart_tx_buf>
    800085e8:	01c0006f          	j	80008604 <uartstart+0x50>
    800085ec:	0006c703          	lbu	a4,0(a3)
    800085f0:	00f63023          	sd	a5,0(a2)
    800085f4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800085f8:	00063783          	ld	a5,0(a2)
    800085fc:	00053703          	ld	a4,0(a0)
    80008600:	00f70e63          	beq	a4,a5,8000861c <uartstart+0x68>
    80008604:	01f7f713          	andi	a4,a5,31
    80008608:	00e806b3          	add	a3,a6,a4
    8000860c:	0055c703          	lbu	a4,5(a1)
    80008610:	00178793          	addi	a5,a5,1
    80008614:	02077713          	andi	a4,a4,32
    80008618:	fc071ae3          	bnez	a4,800085ec <uartstart+0x38>
    8000861c:	00813403          	ld	s0,8(sp)
    80008620:	01010113          	addi	sp,sp,16
    80008624:	00008067          	ret

0000000080008628 <uartgetc>:
    80008628:	ff010113          	addi	sp,sp,-16
    8000862c:	00813423          	sd	s0,8(sp)
    80008630:	01010413          	addi	s0,sp,16
    80008634:	10000737          	lui	a4,0x10000
    80008638:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000863c:	0017f793          	andi	a5,a5,1
    80008640:	00078c63          	beqz	a5,80008658 <uartgetc+0x30>
    80008644:	00074503          	lbu	a0,0(a4)
    80008648:	0ff57513          	andi	a0,a0,255
    8000864c:	00813403          	ld	s0,8(sp)
    80008650:	01010113          	addi	sp,sp,16
    80008654:	00008067          	ret
    80008658:	fff00513          	li	a0,-1
    8000865c:	ff1ff06f          	j	8000864c <uartgetc+0x24>

0000000080008660 <uartintr>:
    80008660:	100007b7          	lui	a5,0x10000
    80008664:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008668:	0017f793          	andi	a5,a5,1
    8000866c:	0a078463          	beqz	a5,80008714 <uartintr+0xb4>
    80008670:	fe010113          	addi	sp,sp,-32
    80008674:	00813823          	sd	s0,16(sp)
    80008678:	00913423          	sd	s1,8(sp)
    8000867c:	00113c23          	sd	ra,24(sp)
    80008680:	02010413          	addi	s0,sp,32
    80008684:	100004b7          	lui	s1,0x10000
    80008688:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000868c:	0ff57513          	andi	a0,a0,255
    80008690:	fffff097          	auipc	ra,0xfffff
    80008694:	534080e7          	jalr	1332(ra) # 80007bc4 <consoleintr>
    80008698:	0054c783          	lbu	a5,5(s1)
    8000869c:	0017f793          	andi	a5,a5,1
    800086a0:	fe0794e3          	bnez	a5,80008688 <uartintr+0x28>
    800086a4:	00004617          	auipc	a2,0x4
    800086a8:	4cc60613          	addi	a2,a2,1228 # 8000cb70 <uart_tx_r>
    800086ac:	00004517          	auipc	a0,0x4
    800086b0:	4cc50513          	addi	a0,a0,1228 # 8000cb78 <uart_tx_w>
    800086b4:	00063783          	ld	a5,0(a2)
    800086b8:	00053703          	ld	a4,0(a0)
    800086bc:	04f70263          	beq	a4,a5,80008700 <uartintr+0xa0>
    800086c0:	100005b7          	lui	a1,0x10000
    800086c4:	00006817          	auipc	a6,0x6
    800086c8:	87c80813          	addi	a6,a6,-1924 # 8000df40 <uart_tx_buf>
    800086cc:	01c0006f          	j	800086e8 <uartintr+0x88>
    800086d0:	0006c703          	lbu	a4,0(a3)
    800086d4:	00f63023          	sd	a5,0(a2)
    800086d8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800086dc:	00063783          	ld	a5,0(a2)
    800086e0:	00053703          	ld	a4,0(a0)
    800086e4:	00f70e63          	beq	a4,a5,80008700 <uartintr+0xa0>
    800086e8:	01f7f713          	andi	a4,a5,31
    800086ec:	00e806b3          	add	a3,a6,a4
    800086f0:	0055c703          	lbu	a4,5(a1)
    800086f4:	00178793          	addi	a5,a5,1
    800086f8:	02077713          	andi	a4,a4,32
    800086fc:	fc071ae3          	bnez	a4,800086d0 <uartintr+0x70>
    80008700:	01813083          	ld	ra,24(sp)
    80008704:	01013403          	ld	s0,16(sp)
    80008708:	00813483          	ld	s1,8(sp)
    8000870c:	02010113          	addi	sp,sp,32
    80008710:	00008067          	ret
    80008714:	00004617          	auipc	a2,0x4
    80008718:	45c60613          	addi	a2,a2,1116 # 8000cb70 <uart_tx_r>
    8000871c:	00004517          	auipc	a0,0x4
    80008720:	45c50513          	addi	a0,a0,1116 # 8000cb78 <uart_tx_w>
    80008724:	00063783          	ld	a5,0(a2)
    80008728:	00053703          	ld	a4,0(a0)
    8000872c:	04f70263          	beq	a4,a5,80008770 <uartintr+0x110>
    80008730:	100005b7          	lui	a1,0x10000
    80008734:	00006817          	auipc	a6,0x6
    80008738:	80c80813          	addi	a6,a6,-2036 # 8000df40 <uart_tx_buf>
    8000873c:	01c0006f          	j	80008758 <uartintr+0xf8>
    80008740:	0006c703          	lbu	a4,0(a3)
    80008744:	00f63023          	sd	a5,0(a2)
    80008748:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000874c:	00063783          	ld	a5,0(a2)
    80008750:	00053703          	ld	a4,0(a0)
    80008754:	02f70063          	beq	a4,a5,80008774 <uartintr+0x114>
    80008758:	01f7f713          	andi	a4,a5,31
    8000875c:	00e806b3          	add	a3,a6,a4
    80008760:	0055c703          	lbu	a4,5(a1)
    80008764:	00178793          	addi	a5,a5,1
    80008768:	02077713          	andi	a4,a4,32
    8000876c:	fc071ae3          	bnez	a4,80008740 <uartintr+0xe0>
    80008770:	00008067          	ret
    80008774:	00008067          	ret

0000000080008778 <kinit>:
    80008778:	fc010113          	addi	sp,sp,-64
    8000877c:	02913423          	sd	s1,40(sp)
    80008780:	fffff7b7          	lui	a5,0xfffff
    80008784:	00006497          	auipc	s1,0x6
    80008788:	7db48493          	addi	s1,s1,2011 # 8000ef5f <end+0xfff>
    8000878c:	02813823          	sd	s0,48(sp)
    80008790:	01313c23          	sd	s3,24(sp)
    80008794:	00f4f4b3          	and	s1,s1,a5
    80008798:	02113c23          	sd	ra,56(sp)
    8000879c:	03213023          	sd	s2,32(sp)
    800087a0:	01413823          	sd	s4,16(sp)
    800087a4:	01513423          	sd	s5,8(sp)
    800087a8:	04010413          	addi	s0,sp,64
    800087ac:	000017b7          	lui	a5,0x1
    800087b0:	01100993          	li	s3,17
    800087b4:	00f487b3          	add	a5,s1,a5
    800087b8:	01b99993          	slli	s3,s3,0x1b
    800087bc:	06f9e063          	bltu	s3,a5,8000881c <kinit+0xa4>
    800087c0:	00005a97          	auipc	s5,0x5
    800087c4:	7a0a8a93          	addi	s5,s5,1952 # 8000df60 <end>
    800087c8:	0754ec63          	bltu	s1,s5,80008840 <kinit+0xc8>
    800087cc:	0734fa63          	bgeu	s1,s3,80008840 <kinit+0xc8>
    800087d0:	00088a37          	lui	s4,0x88
    800087d4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800087d8:	00004917          	auipc	s2,0x4
    800087dc:	3a890913          	addi	s2,s2,936 # 8000cb80 <kmem>
    800087e0:	00ca1a13          	slli	s4,s4,0xc
    800087e4:	0140006f          	j	800087f8 <kinit+0x80>
    800087e8:	000017b7          	lui	a5,0x1
    800087ec:	00f484b3          	add	s1,s1,a5
    800087f0:	0554e863          	bltu	s1,s5,80008840 <kinit+0xc8>
    800087f4:	0534f663          	bgeu	s1,s3,80008840 <kinit+0xc8>
    800087f8:	00001637          	lui	a2,0x1
    800087fc:	00100593          	li	a1,1
    80008800:	00048513          	mv	a0,s1
    80008804:	00000097          	auipc	ra,0x0
    80008808:	5e4080e7          	jalr	1508(ra) # 80008de8 <__memset>
    8000880c:	00093783          	ld	a5,0(s2)
    80008810:	00f4b023          	sd	a5,0(s1)
    80008814:	00993023          	sd	s1,0(s2)
    80008818:	fd4498e3          	bne	s1,s4,800087e8 <kinit+0x70>
    8000881c:	03813083          	ld	ra,56(sp)
    80008820:	03013403          	ld	s0,48(sp)
    80008824:	02813483          	ld	s1,40(sp)
    80008828:	02013903          	ld	s2,32(sp)
    8000882c:	01813983          	ld	s3,24(sp)
    80008830:	01013a03          	ld	s4,16(sp)
    80008834:	00813a83          	ld	s5,8(sp)
    80008838:	04010113          	addi	sp,sp,64
    8000883c:	00008067          	ret
    80008840:	00002517          	auipc	a0,0x2
    80008844:	ff850513          	addi	a0,a0,-8 # 8000a838 <digits+0x18>
    80008848:	fffff097          	auipc	ra,0xfffff
    8000884c:	4b4080e7          	jalr	1204(ra) # 80007cfc <panic>

0000000080008850 <freerange>:
    80008850:	fc010113          	addi	sp,sp,-64
    80008854:	000017b7          	lui	a5,0x1
    80008858:	02913423          	sd	s1,40(sp)
    8000885c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008860:	009504b3          	add	s1,a0,s1
    80008864:	fffff537          	lui	a0,0xfffff
    80008868:	02813823          	sd	s0,48(sp)
    8000886c:	02113c23          	sd	ra,56(sp)
    80008870:	03213023          	sd	s2,32(sp)
    80008874:	01313c23          	sd	s3,24(sp)
    80008878:	01413823          	sd	s4,16(sp)
    8000887c:	01513423          	sd	s5,8(sp)
    80008880:	01613023          	sd	s6,0(sp)
    80008884:	04010413          	addi	s0,sp,64
    80008888:	00a4f4b3          	and	s1,s1,a0
    8000888c:	00f487b3          	add	a5,s1,a5
    80008890:	06f5e463          	bltu	a1,a5,800088f8 <freerange+0xa8>
    80008894:	00005a97          	auipc	s5,0x5
    80008898:	6cca8a93          	addi	s5,s5,1740 # 8000df60 <end>
    8000889c:	0954e263          	bltu	s1,s5,80008920 <freerange+0xd0>
    800088a0:	01100993          	li	s3,17
    800088a4:	01b99993          	slli	s3,s3,0x1b
    800088a8:	0734fc63          	bgeu	s1,s3,80008920 <freerange+0xd0>
    800088ac:	00058a13          	mv	s4,a1
    800088b0:	00004917          	auipc	s2,0x4
    800088b4:	2d090913          	addi	s2,s2,720 # 8000cb80 <kmem>
    800088b8:	00002b37          	lui	s6,0x2
    800088bc:	0140006f          	j	800088d0 <freerange+0x80>
    800088c0:	000017b7          	lui	a5,0x1
    800088c4:	00f484b3          	add	s1,s1,a5
    800088c8:	0554ec63          	bltu	s1,s5,80008920 <freerange+0xd0>
    800088cc:	0534fa63          	bgeu	s1,s3,80008920 <freerange+0xd0>
    800088d0:	00001637          	lui	a2,0x1
    800088d4:	00100593          	li	a1,1
    800088d8:	00048513          	mv	a0,s1
    800088dc:	00000097          	auipc	ra,0x0
    800088e0:	50c080e7          	jalr	1292(ra) # 80008de8 <__memset>
    800088e4:	00093703          	ld	a4,0(s2)
    800088e8:	016487b3          	add	a5,s1,s6
    800088ec:	00e4b023          	sd	a4,0(s1)
    800088f0:	00993023          	sd	s1,0(s2)
    800088f4:	fcfa76e3          	bgeu	s4,a5,800088c0 <freerange+0x70>
    800088f8:	03813083          	ld	ra,56(sp)
    800088fc:	03013403          	ld	s0,48(sp)
    80008900:	02813483          	ld	s1,40(sp)
    80008904:	02013903          	ld	s2,32(sp)
    80008908:	01813983          	ld	s3,24(sp)
    8000890c:	01013a03          	ld	s4,16(sp)
    80008910:	00813a83          	ld	s5,8(sp)
    80008914:	00013b03          	ld	s6,0(sp)
    80008918:	04010113          	addi	sp,sp,64
    8000891c:	00008067          	ret
    80008920:	00002517          	auipc	a0,0x2
    80008924:	f1850513          	addi	a0,a0,-232 # 8000a838 <digits+0x18>
    80008928:	fffff097          	auipc	ra,0xfffff
    8000892c:	3d4080e7          	jalr	980(ra) # 80007cfc <panic>

0000000080008930 <kfree>:
    80008930:	fe010113          	addi	sp,sp,-32
    80008934:	00813823          	sd	s0,16(sp)
    80008938:	00113c23          	sd	ra,24(sp)
    8000893c:	00913423          	sd	s1,8(sp)
    80008940:	02010413          	addi	s0,sp,32
    80008944:	03451793          	slli	a5,a0,0x34
    80008948:	04079c63          	bnez	a5,800089a0 <kfree+0x70>
    8000894c:	00005797          	auipc	a5,0x5
    80008950:	61478793          	addi	a5,a5,1556 # 8000df60 <end>
    80008954:	00050493          	mv	s1,a0
    80008958:	04f56463          	bltu	a0,a5,800089a0 <kfree+0x70>
    8000895c:	01100793          	li	a5,17
    80008960:	01b79793          	slli	a5,a5,0x1b
    80008964:	02f57e63          	bgeu	a0,a5,800089a0 <kfree+0x70>
    80008968:	00001637          	lui	a2,0x1
    8000896c:	00100593          	li	a1,1
    80008970:	00000097          	auipc	ra,0x0
    80008974:	478080e7          	jalr	1144(ra) # 80008de8 <__memset>
    80008978:	00004797          	auipc	a5,0x4
    8000897c:	20878793          	addi	a5,a5,520 # 8000cb80 <kmem>
    80008980:	0007b703          	ld	a4,0(a5)
    80008984:	01813083          	ld	ra,24(sp)
    80008988:	01013403          	ld	s0,16(sp)
    8000898c:	00e4b023          	sd	a4,0(s1)
    80008990:	0097b023          	sd	s1,0(a5)
    80008994:	00813483          	ld	s1,8(sp)
    80008998:	02010113          	addi	sp,sp,32
    8000899c:	00008067          	ret
    800089a0:	00002517          	auipc	a0,0x2
    800089a4:	e9850513          	addi	a0,a0,-360 # 8000a838 <digits+0x18>
    800089a8:	fffff097          	auipc	ra,0xfffff
    800089ac:	354080e7          	jalr	852(ra) # 80007cfc <panic>

00000000800089b0 <kalloc>:
    800089b0:	fe010113          	addi	sp,sp,-32
    800089b4:	00813823          	sd	s0,16(sp)
    800089b8:	00913423          	sd	s1,8(sp)
    800089bc:	00113c23          	sd	ra,24(sp)
    800089c0:	02010413          	addi	s0,sp,32
    800089c4:	00004797          	auipc	a5,0x4
    800089c8:	1bc78793          	addi	a5,a5,444 # 8000cb80 <kmem>
    800089cc:	0007b483          	ld	s1,0(a5)
    800089d0:	02048063          	beqz	s1,800089f0 <kalloc+0x40>
    800089d4:	0004b703          	ld	a4,0(s1)
    800089d8:	00001637          	lui	a2,0x1
    800089dc:	00500593          	li	a1,5
    800089e0:	00048513          	mv	a0,s1
    800089e4:	00e7b023          	sd	a4,0(a5)
    800089e8:	00000097          	auipc	ra,0x0
    800089ec:	400080e7          	jalr	1024(ra) # 80008de8 <__memset>
    800089f0:	01813083          	ld	ra,24(sp)
    800089f4:	01013403          	ld	s0,16(sp)
    800089f8:	00048513          	mv	a0,s1
    800089fc:	00813483          	ld	s1,8(sp)
    80008a00:	02010113          	addi	sp,sp,32
    80008a04:	00008067          	ret

0000000080008a08 <initlock>:
    80008a08:	ff010113          	addi	sp,sp,-16
    80008a0c:	00813423          	sd	s0,8(sp)
    80008a10:	01010413          	addi	s0,sp,16
    80008a14:	00813403          	ld	s0,8(sp)
    80008a18:	00b53423          	sd	a1,8(a0)
    80008a1c:	00052023          	sw	zero,0(a0)
    80008a20:	00053823          	sd	zero,16(a0)
    80008a24:	01010113          	addi	sp,sp,16
    80008a28:	00008067          	ret

0000000080008a2c <acquire>:
    80008a2c:	fe010113          	addi	sp,sp,-32
    80008a30:	00813823          	sd	s0,16(sp)
    80008a34:	00913423          	sd	s1,8(sp)
    80008a38:	00113c23          	sd	ra,24(sp)
    80008a3c:	01213023          	sd	s2,0(sp)
    80008a40:	02010413          	addi	s0,sp,32
    80008a44:	00050493          	mv	s1,a0
    80008a48:	10002973          	csrr	s2,sstatus
    80008a4c:	100027f3          	csrr	a5,sstatus
    80008a50:	ffd7f793          	andi	a5,a5,-3
    80008a54:	10079073          	csrw	sstatus,a5
    80008a58:	fffff097          	auipc	ra,0xfffff
    80008a5c:	8e8080e7          	jalr	-1816(ra) # 80007340 <mycpu>
    80008a60:	07852783          	lw	a5,120(a0)
    80008a64:	06078e63          	beqz	a5,80008ae0 <acquire+0xb4>
    80008a68:	fffff097          	auipc	ra,0xfffff
    80008a6c:	8d8080e7          	jalr	-1832(ra) # 80007340 <mycpu>
    80008a70:	07852783          	lw	a5,120(a0)
    80008a74:	0004a703          	lw	a4,0(s1)
    80008a78:	0017879b          	addiw	a5,a5,1
    80008a7c:	06f52c23          	sw	a5,120(a0)
    80008a80:	04071063          	bnez	a4,80008ac0 <acquire+0x94>
    80008a84:	00100713          	li	a4,1
    80008a88:	00070793          	mv	a5,a4
    80008a8c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008a90:	0007879b          	sext.w	a5,a5
    80008a94:	fe079ae3          	bnez	a5,80008a88 <acquire+0x5c>
    80008a98:	0ff0000f          	fence
    80008a9c:	fffff097          	auipc	ra,0xfffff
    80008aa0:	8a4080e7          	jalr	-1884(ra) # 80007340 <mycpu>
    80008aa4:	01813083          	ld	ra,24(sp)
    80008aa8:	01013403          	ld	s0,16(sp)
    80008aac:	00a4b823          	sd	a0,16(s1)
    80008ab0:	00013903          	ld	s2,0(sp)
    80008ab4:	00813483          	ld	s1,8(sp)
    80008ab8:	02010113          	addi	sp,sp,32
    80008abc:	00008067          	ret
    80008ac0:	0104b903          	ld	s2,16(s1)
    80008ac4:	fffff097          	auipc	ra,0xfffff
    80008ac8:	87c080e7          	jalr	-1924(ra) # 80007340 <mycpu>
    80008acc:	faa91ce3          	bne	s2,a0,80008a84 <acquire+0x58>
    80008ad0:	00002517          	auipc	a0,0x2
    80008ad4:	d7050513          	addi	a0,a0,-656 # 8000a840 <digits+0x20>
    80008ad8:	fffff097          	auipc	ra,0xfffff
    80008adc:	224080e7          	jalr	548(ra) # 80007cfc <panic>
    80008ae0:	00195913          	srli	s2,s2,0x1
    80008ae4:	fffff097          	auipc	ra,0xfffff
    80008ae8:	85c080e7          	jalr	-1956(ra) # 80007340 <mycpu>
    80008aec:	00197913          	andi	s2,s2,1
    80008af0:	07252e23          	sw	s2,124(a0)
    80008af4:	f75ff06f          	j	80008a68 <acquire+0x3c>

0000000080008af8 <release>:
    80008af8:	fe010113          	addi	sp,sp,-32
    80008afc:	00813823          	sd	s0,16(sp)
    80008b00:	00113c23          	sd	ra,24(sp)
    80008b04:	00913423          	sd	s1,8(sp)
    80008b08:	01213023          	sd	s2,0(sp)
    80008b0c:	02010413          	addi	s0,sp,32
    80008b10:	00052783          	lw	a5,0(a0)
    80008b14:	00079a63          	bnez	a5,80008b28 <release+0x30>
    80008b18:	00002517          	auipc	a0,0x2
    80008b1c:	d3050513          	addi	a0,a0,-720 # 8000a848 <digits+0x28>
    80008b20:	fffff097          	auipc	ra,0xfffff
    80008b24:	1dc080e7          	jalr	476(ra) # 80007cfc <panic>
    80008b28:	01053903          	ld	s2,16(a0)
    80008b2c:	00050493          	mv	s1,a0
    80008b30:	fffff097          	auipc	ra,0xfffff
    80008b34:	810080e7          	jalr	-2032(ra) # 80007340 <mycpu>
    80008b38:	fea910e3          	bne	s2,a0,80008b18 <release+0x20>
    80008b3c:	0004b823          	sd	zero,16(s1)
    80008b40:	0ff0000f          	fence
    80008b44:	0f50000f          	fence	iorw,ow
    80008b48:	0804a02f          	amoswap.w	zero,zero,(s1)
    80008b4c:	ffffe097          	auipc	ra,0xffffe
    80008b50:	7f4080e7          	jalr	2036(ra) # 80007340 <mycpu>
    80008b54:	100027f3          	csrr	a5,sstatus
    80008b58:	0027f793          	andi	a5,a5,2
    80008b5c:	04079a63          	bnez	a5,80008bb0 <release+0xb8>
    80008b60:	07852783          	lw	a5,120(a0)
    80008b64:	02f05e63          	blez	a5,80008ba0 <release+0xa8>
    80008b68:	fff7871b          	addiw	a4,a5,-1
    80008b6c:	06e52c23          	sw	a4,120(a0)
    80008b70:	00071c63          	bnez	a4,80008b88 <release+0x90>
    80008b74:	07c52783          	lw	a5,124(a0)
    80008b78:	00078863          	beqz	a5,80008b88 <release+0x90>
    80008b7c:	100027f3          	csrr	a5,sstatus
    80008b80:	0027e793          	ori	a5,a5,2
    80008b84:	10079073          	csrw	sstatus,a5
    80008b88:	01813083          	ld	ra,24(sp)
    80008b8c:	01013403          	ld	s0,16(sp)
    80008b90:	00813483          	ld	s1,8(sp)
    80008b94:	00013903          	ld	s2,0(sp)
    80008b98:	02010113          	addi	sp,sp,32
    80008b9c:	00008067          	ret
    80008ba0:	00002517          	auipc	a0,0x2
    80008ba4:	cc850513          	addi	a0,a0,-824 # 8000a868 <digits+0x48>
    80008ba8:	fffff097          	auipc	ra,0xfffff
    80008bac:	154080e7          	jalr	340(ra) # 80007cfc <panic>
    80008bb0:	00002517          	auipc	a0,0x2
    80008bb4:	ca050513          	addi	a0,a0,-864 # 8000a850 <digits+0x30>
    80008bb8:	fffff097          	auipc	ra,0xfffff
    80008bbc:	144080e7          	jalr	324(ra) # 80007cfc <panic>

0000000080008bc0 <holding>:
    80008bc0:	00052783          	lw	a5,0(a0)
    80008bc4:	00079663          	bnez	a5,80008bd0 <holding+0x10>
    80008bc8:	00000513          	li	a0,0
    80008bcc:	00008067          	ret
    80008bd0:	fe010113          	addi	sp,sp,-32
    80008bd4:	00813823          	sd	s0,16(sp)
    80008bd8:	00913423          	sd	s1,8(sp)
    80008bdc:	00113c23          	sd	ra,24(sp)
    80008be0:	02010413          	addi	s0,sp,32
    80008be4:	01053483          	ld	s1,16(a0)
    80008be8:	ffffe097          	auipc	ra,0xffffe
    80008bec:	758080e7          	jalr	1880(ra) # 80007340 <mycpu>
    80008bf0:	01813083          	ld	ra,24(sp)
    80008bf4:	01013403          	ld	s0,16(sp)
    80008bf8:	40a48533          	sub	a0,s1,a0
    80008bfc:	00153513          	seqz	a0,a0
    80008c00:	00813483          	ld	s1,8(sp)
    80008c04:	02010113          	addi	sp,sp,32
    80008c08:	00008067          	ret

0000000080008c0c <push_off>:
    80008c0c:	fe010113          	addi	sp,sp,-32
    80008c10:	00813823          	sd	s0,16(sp)
    80008c14:	00113c23          	sd	ra,24(sp)
    80008c18:	00913423          	sd	s1,8(sp)
    80008c1c:	02010413          	addi	s0,sp,32
    80008c20:	100024f3          	csrr	s1,sstatus
    80008c24:	100027f3          	csrr	a5,sstatus
    80008c28:	ffd7f793          	andi	a5,a5,-3
    80008c2c:	10079073          	csrw	sstatus,a5
    80008c30:	ffffe097          	auipc	ra,0xffffe
    80008c34:	710080e7          	jalr	1808(ra) # 80007340 <mycpu>
    80008c38:	07852783          	lw	a5,120(a0)
    80008c3c:	02078663          	beqz	a5,80008c68 <push_off+0x5c>
    80008c40:	ffffe097          	auipc	ra,0xffffe
    80008c44:	700080e7          	jalr	1792(ra) # 80007340 <mycpu>
    80008c48:	07852783          	lw	a5,120(a0)
    80008c4c:	01813083          	ld	ra,24(sp)
    80008c50:	01013403          	ld	s0,16(sp)
    80008c54:	0017879b          	addiw	a5,a5,1
    80008c58:	06f52c23          	sw	a5,120(a0)
    80008c5c:	00813483          	ld	s1,8(sp)
    80008c60:	02010113          	addi	sp,sp,32
    80008c64:	00008067          	ret
    80008c68:	0014d493          	srli	s1,s1,0x1
    80008c6c:	ffffe097          	auipc	ra,0xffffe
    80008c70:	6d4080e7          	jalr	1748(ra) # 80007340 <mycpu>
    80008c74:	0014f493          	andi	s1,s1,1
    80008c78:	06952e23          	sw	s1,124(a0)
    80008c7c:	fc5ff06f          	j	80008c40 <push_off+0x34>

0000000080008c80 <pop_off>:
    80008c80:	ff010113          	addi	sp,sp,-16
    80008c84:	00813023          	sd	s0,0(sp)
    80008c88:	00113423          	sd	ra,8(sp)
    80008c8c:	01010413          	addi	s0,sp,16
    80008c90:	ffffe097          	auipc	ra,0xffffe
    80008c94:	6b0080e7          	jalr	1712(ra) # 80007340 <mycpu>
    80008c98:	100027f3          	csrr	a5,sstatus
    80008c9c:	0027f793          	andi	a5,a5,2
    80008ca0:	04079663          	bnez	a5,80008cec <pop_off+0x6c>
    80008ca4:	07852783          	lw	a5,120(a0)
    80008ca8:	02f05a63          	blez	a5,80008cdc <pop_off+0x5c>
    80008cac:	fff7871b          	addiw	a4,a5,-1
    80008cb0:	06e52c23          	sw	a4,120(a0)
    80008cb4:	00071c63          	bnez	a4,80008ccc <pop_off+0x4c>
    80008cb8:	07c52783          	lw	a5,124(a0)
    80008cbc:	00078863          	beqz	a5,80008ccc <pop_off+0x4c>
    80008cc0:	100027f3          	csrr	a5,sstatus
    80008cc4:	0027e793          	ori	a5,a5,2
    80008cc8:	10079073          	csrw	sstatus,a5
    80008ccc:	00813083          	ld	ra,8(sp)
    80008cd0:	00013403          	ld	s0,0(sp)
    80008cd4:	01010113          	addi	sp,sp,16
    80008cd8:	00008067          	ret
    80008cdc:	00002517          	auipc	a0,0x2
    80008ce0:	b8c50513          	addi	a0,a0,-1140 # 8000a868 <digits+0x48>
    80008ce4:	fffff097          	auipc	ra,0xfffff
    80008ce8:	018080e7          	jalr	24(ra) # 80007cfc <panic>
    80008cec:	00002517          	auipc	a0,0x2
    80008cf0:	b6450513          	addi	a0,a0,-1180 # 8000a850 <digits+0x30>
    80008cf4:	fffff097          	auipc	ra,0xfffff
    80008cf8:	008080e7          	jalr	8(ra) # 80007cfc <panic>

0000000080008cfc <push_on>:
    80008cfc:	fe010113          	addi	sp,sp,-32
    80008d00:	00813823          	sd	s0,16(sp)
    80008d04:	00113c23          	sd	ra,24(sp)
    80008d08:	00913423          	sd	s1,8(sp)
    80008d0c:	02010413          	addi	s0,sp,32
    80008d10:	100024f3          	csrr	s1,sstatus
    80008d14:	100027f3          	csrr	a5,sstatus
    80008d18:	0027e793          	ori	a5,a5,2
    80008d1c:	10079073          	csrw	sstatus,a5
    80008d20:	ffffe097          	auipc	ra,0xffffe
    80008d24:	620080e7          	jalr	1568(ra) # 80007340 <mycpu>
    80008d28:	07852783          	lw	a5,120(a0)
    80008d2c:	02078663          	beqz	a5,80008d58 <push_on+0x5c>
    80008d30:	ffffe097          	auipc	ra,0xffffe
    80008d34:	610080e7          	jalr	1552(ra) # 80007340 <mycpu>
    80008d38:	07852783          	lw	a5,120(a0)
    80008d3c:	01813083          	ld	ra,24(sp)
    80008d40:	01013403          	ld	s0,16(sp)
    80008d44:	0017879b          	addiw	a5,a5,1
    80008d48:	06f52c23          	sw	a5,120(a0)
    80008d4c:	00813483          	ld	s1,8(sp)
    80008d50:	02010113          	addi	sp,sp,32
    80008d54:	00008067          	ret
    80008d58:	0014d493          	srli	s1,s1,0x1
    80008d5c:	ffffe097          	auipc	ra,0xffffe
    80008d60:	5e4080e7          	jalr	1508(ra) # 80007340 <mycpu>
    80008d64:	0014f493          	andi	s1,s1,1
    80008d68:	06952e23          	sw	s1,124(a0)
    80008d6c:	fc5ff06f          	j	80008d30 <push_on+0x34>

0000000080008d70 <pop_on>:
    80008d70:	ff010113          	addi	sp,sp,-16
    80008d74:	00813023          	sd	s0,0(sp)
    80008d78:	00113423          	sd	ra,8(sp)
    80008d7c:	01010413          	addi	s0,sp,16
    80008d80:	ffffe097          	auipc	ra,0xffffe
    80008d84:	5c0080e7          	jalr	1472(ra) # 80007340 <mycpu>
    80008d88:	100027f3          	csrr	a5,sstatus
    80008d8c:	0027f793          	andi	a5,a5,2
    80008d90:	04078463          	beqz	a5,80008dd8 <pop_on+0x68>
    80008d94:	07852783          	lw	a5,120(a0)
    80008d98:	02f05863          	blez	a5,80008dc8 <pop_on+0x58>
    80008d9c:	fff7879b          	addiw	a5,a5,-1
    80008da0:	06f52c23          	sw	a5,120(a0)
    80008da4:	07853783          	ld	a5,120(a0)
    80008da8:	00079863          	bnez	a5,80008db8 <pop_on+0x48>
    80008dac:	100027f3          	csrr	a5,sstatus
    80008db0:	ffd7f793          	andi	a5,a5,-3
    80008db4:	10079073          	csrw	sstatus,a5
    80008db8:	00813083          	ld	ra,8(sp)
    80008dbc:	00013403          	ld	s0,0(sp)
    80008dc0:	01010113          	addi	sp,sp,16
    80008dc4:	00008067          	ret
    80008dc8:	00002517          	auipc	a0,0x2
    80008dcc:	ac850513          	addi	a0,a0,-1336 # 8000a890 <digits+0x70>
    80008dd0:	fffff097          	auipc	ra,0xfffff
    80008dd4:	f2c080e7          	jalr	-212(ra) # 80007cfc <panic>
    80008dd8:	00002517          	auipc	a0,0x2
    80008ddc:	a9850513          	addi	a0,a0,-1384 # 8000a870 <digits+0x50>
    80008de0:	fffff097          	auipc	ra,0xfffff
    80008de4:	f1c080e7          	jalr	-228(ra) # 80007cfc <panic>

0000000080008de8 <__memset>:
    80008de8:	ff010113          	addi	sp,sp,-16
    80008dec:	00813423          	sd	s0,8(sp)
    80008df0:	01010413          	addi	s0,sp,16
    80008df4:	1a060e63          	beqz	a2,80008fb0 <__memset+0x1c8>
    80008df8:	40a007b3          	neg	a5,a0
    80008dfc:	0077f793          	andi	a5,a5,7
    80008e00:	00778693          	addi	a3,a5,7
    80008e04:	00b00813          	li	a6,11
    80008e08:	0ff5f593          	andi	a1,a1,255
    80008e0c:	fff6071b          	addiw	a4,a2,-1
    80008e10:	1b06e663          	bltu	a3,a6,80008fbc <__memset+0x1d4>
    80008e14:	1cd76463          	bltu	a4,a3,80008fdc <__memset+0x1f4>
    80008e18:	1a078e63          	beqz	a5,80008fd4 <__memset+0x1ec>
    80008e1c:	00b50023          	sb	a1,0(a0)
    80008e20:	00100713          	li	a4,1
    80008e24:	1ae78463          	beq	a5,a4,80008fcc <__memset+0x1e4>
    80008e28:	00b500a3          	sb	a1,1(a0)
    80008e2c:	00200713          	li	a4,2
    80008e30:	1ae78a63          	beq	a5,a4,80008fe4 <__memset+0x1fc>
    80008e34:	00b50123          	sb	a1,2(a0)
    80008e38:	00300713          	li	a4,3
    80008e3c:	18e78463          	beq	a5,a4,80008fc4 <__memset+0x1dc>
    80008e40:	00b501a3          	sb	a1,3(a0)
    80008e44:	00400713          	li	a4,4
    80008e48:	1ae78263          	beq	a5,a4,80008fec <__memset+0x204>
    80008e4c:	00b50223          	sb	a1,4(a0)
    80008e50:	00500713          	li	a4,5
    80008e54:	1ae78063          	beq	a5,a4,80008ff4 <__memset+0x20c>
    80008e58:	00b502a3          	sb	a1,5(a0)
    80008e5c:	00700713          	li	a4,7
    80008e60:	18e79e63          	bne	a5,a4,80008ffc <__memset+0x214>
    80008e64:	00b50323          	sb	a1,6(a0)
    80008e68:	00700e93          	li	t4,7
    80008e6c:	00859713          	slli	a4,a1,0x8
    80008e70:	00e5e733          	or	a4,a1,a4
    80008e74:	01059e13          	slli	t3,a1,0x10
    80008e78:	01c76e33          	or	t3,a4,t3
    80008e7c:	01859313          	slli	t1,a1,0x18
    80008e80:	006e6333          	or	t1,t3,t1
    80008e84:	02059893          	slli	a7,a1,0x20
    80008e88:	40f60e3b          	subw	t3,a2,a5
    80008e8c:	011368b3          	or	a7,t1,a7
    80008e90:	02859813          	slli	a6,a1,0x28
    80008e94:	0108e833          	or	a6,a7,a6
    80008e98:	03059693          	slli	a3,a1,0x30
    80008e9c:	003e589b          	srliw	a7,t3,0x3
    80008ea0:	00d866b3          	or	a3,a6,a3
    80008ea4:	03859713          	slli	a4,a1,0x38
    80008ea8:	00389813          	slli	a6,a7,0x3
    80008eac:	00f507b3          	add	a5,a0,a5
    80008eb0:	00e6e733          	or	a4,a3,a4
    80008eb4:	000e089b          	sext.w	a7,t3
    80008eb8:	00f806b3          	add	a3,a6,a5
    80008ebc:	00e7b023          	sd	a4,0(a5)
    80008ec0:	00878793          	addi	a5,a5,8
    80008ec4:	fed79ce3          	bne	a5,a3,80008ebc <__memset+0xd4>
    80008ec8:	ff8e7793          	andi	a5,t3,-8
    80008ecc:	0007871b          	sext.w	a4,a5
    80008ed0:	01d787bb          	addw	a5,a5,t4
    80008ed4:	0ce88e63          	beq	a7,a4,80008fb0 <__memset+0x1c8>
    80008ed8:	00f50733          	add	a4,a0,a5
    80008edc:	00b70023          	sb	a1,0(a4)
    80008ee0:	0017871b          	addiw	a4,a5,1
    80008ee4:	0cc77663          	bgeu	a4,a2,80008fb0 <__memset+0x1c8>
    80008ee8:	00e50733          	add	a4,a0,a4
    80008eec:	00b70023          	sb	a1,0(a4)
    80008ef0:	0027871b          	addiw	a4,a5,2
    80008ef4:	0ac77e63          	bgeu	a4,a2,80008fb0 <__memset+0x1c8>
    80008ef8:	00e50733          	add	a4,a0,a4
    80008efc:	00b70023          	sb	a1,0(a4)
    80008f00:	0037871b          	addiw	a4,a5,3
    80008f04:	0ac77663          	bgeu	a4,a2,80008fb0 <__memset+0x1c8>
    80008f08:	00e50733          	add	a4,a0,a4
    80008f0c:	00b70023          	sb	a1,0(a4)
    80008f10:	0047871b          	addiw	a4,a5,4
    80008f14:	08c77e63          	bgeu	a4,a2,80008fb0 <__memset+0x1c8>
    80008f18:	00e50733          	add	a4,a0,a4
    80008f1c:	00b70023          	sb	a1,0(a4)
    80008f20:	0057871b          	addiw	a4,a5,5
    80008f24:	08c77663          	bgeu	a4,a2,80008fb0 <__memset+0x1c8>
    80008f28:	00e50733          	add	a4,a0,a4
    80008f2c:	00b70023          	sb	a1,0(a4)
    80008f30:	0067871b          	addiw	a4,a5,6
    80008f34:	06c77e63          	bgeu	a4,a2,80008fb0 <__memset+0x1c8>
    80008f38:	00e50733          	add	a4,a0,a4
    80008f3c:	00b70023          	sb	a1,0(a4)
    80008f40:	0077871b          	addiw	a4,a5,7
    80008f44:	06c77663          	bgeu	a4,a2,80008fb0 <__memset+0x1c8>
    80008f48:	00e50733          	add	a4,a0,a4
    80008f4c:	00b70023          	sb	a1,0(a4)
    80008f50:	0087871b          	addiw	a4,a5,8
    80008f54:	04c77e63          	bgeu	a4,a2,80008fb0 <__memset+0x1c8>
    80008f58:	00e50733          	add	a4,a0,a4
    80008f5c:	00b70023          	sb	a1,0(a4)
    80008f60:	0097871b          	addiw	a4,a5,9
    80008f64:	04c77663          	bgeu	a4,a2,80008fb0 <__memset+0x1c8>
    80008f68:	00e50733          	add	a4,a0,a4
    80008f6c:	00b70023          	sb	a1,0(a4)
    80008f70:	00a7871b          	addiw	a4,a5,10
    80008f74:	02c77e63          	bgeu	a4,a2,80008fb0 <__memset+0x1c8>
    80008f78:	00e50733          	add	a4,a0,a4
    80008f7c:	00b70023          	sb	a1,0(a4)
    80008f80:	00b7871b          	addiw	a4,a5,11
    80008f84:	02c77663          	bgeu	a4,a2,80008fb0 <__memset+0x1c8>
    80008f88:	00e50733          	add	a4,a0,a4
    80008f8c:	00b70023          	sb	a1,0(a4)
    80008f90:	00c7871b          	addiw	a4,a5,12
    80008f94:	00c77e63          	bgeu	a4,a2,80008fb0 <__memset+0x1c8>
    80008f98:	00e50733          	add	a4,a0,a4
    80008f9c:	00b70023          	sb	a1,0(a4)
    80008fa0:	00d7879b          	addiw	a5,a5,13
    80008fa4:	00c7f663          	bgeu	a5,a2,80008fb0 <__memset+0x1c8>
    80008fa8:	00f507b3          	add	a5,a0,a5
    80008fac:	00b78023          	sb	a1,0(a5)
    80008fb0:	00813403          	ld	s0,8(sp)
    80008fb4:	01010113          	addi	sp,sp,16
    80008fb8:	00008067          	ret
    80008fbc:	00b00693          	li	a3,11
    80008fc0:	e55ff06f          	j	80008e14 <__memset+0x2c>
    80008fc4:	00300e93          	li	t4,3
    80008fc8:	ea5ff06f          	j	80008e6c <__memset+0x84>
    80008fcc:	00100e93          	li	t4,1
    80008fd0:	e9dff06f          	j	80008e6c <__memset+0x84>
    80008fd4:	00000e93          	li	t4,0
    80008fd8:	e95ff06f          	j	80008e6c <__memset+0x84>
    80008fdc:	00000793          	li	a5,0
    80008fe0:	ef9ff06f          	j	80008ed8 <__memset+0xf0>
    80008fe4:	00200e93          	li	t4,2
    80008fe8:	e85ff06f          	j	80008e6c <__memset+0x84>
    80008fec:	00400e93          	li	t4,4
    80008ff0:	e7dff06f          	j	80008e6c <__memset+0x84>
    80008ff4:	00500e93          	li	t4,5
    80008ff8:	e75ff06f          	j	80008e6c <__memset+0x84>
    80008ffc:	00600e93          	li	t4,6
    80009000:	e6dff06f          	j	80008e6c <__memset+0x84>

0000000080009004 <__memmove>:
    80009004:	ff010113          	addi	sp,sp,-16
    80009008:	00813423          	sd	s0,8(sp)
    8000900c:	01010413          	addi	s0,sp,16
    80009010:	0e060863          	beqz	a2,80009100 <__memmove+0xfc>
    80009014:	fff6069b          	addiw	a3,a2,-1
    80009018:	0006881b          	sext.w	a6,a3
    8000901c:	0ea5e863          	bltu	a1,a0,8000910c <__memmove+0x108>
    80009020:	00758713          	addi	a4,a1,7
    80009024:	00a5e7b3          	or	a5,a1,a0
    80009028:	40a70733          	sub	a4,a4,a0
    8000902c:	0077f793          	andi	a5,a5,7
    80009030:	00f73713          	sltiu	a4,a4,15
    80009034:	00174713          	xori	a4,a4,1
    80009038:	0017b793          	seqz	a5,a5
    8000903c:	00e7f7b3          	and	a5,a5,a4
    80009040:	10078863          	beqz	a5,80009150 <__memmove+0x14c>
    80009044:	00900793          	li	a5,9
    80009048:	1107f463          	bgeu	a5,a6,80009150 <__memmove+0x14c>
    8000904c:	0036581b          	srliw	a6,a2,0x3
    80009050:	fff8081b          	addiw	a6,a6,-1
    80009054:	02081813          	slli	a6,a6,0x20
    80009058:	01d85893          	srli	a7,a6,0x1d
    8000905c:	00858813          	addi	a6,a1,8
    80009060:	00058793          	mv	a5,a1
    80009064:	00050713          	mv	a4,a0
    80009068:	01088833          	add	a6,a7,a6
    8000906c:	0007b883          	ld	a7,0(a5)
    80009070:	00878793          	addi	a5,a5,8
    80009074:	00870713          	addi	a4,a4,8
    80009078:	ff173c23          	sd	a7,-8(a4)
    8000907c:	ff0798e3          	bne	a5,a6,8000906c <__memmove+0x68>
    80009080:	ff867713          	andi	a4,a2,-8
    80009084:	02071793          	slli	a5,a4,0x20
    80009088:	0207d793          	srli	a5,a5,0x20
    8000908c:	00f585b3          	add	a1,a1,a5
    80009090:	40e686bb          	subw	a3,a3,a4
    80009094:	00f507b3          	add	a5,a0,a5
    80009098:	06e60463          	beq	a2,a4,80009100 <__memmove+0xfc>
    8000909c:	0005c703          	lbu	a4,0(a1)
    800090a0:	00e78023          	sb	a4,0(a5)
    800090a4:	04068e63          	beqz	a3,80009100 <__memmove+0xfc>
    800090a8:	0015c603          	lbu	a2,1(a1)
    800090ac:	00100713          	li	a4,1
    800090b0:	00c780a3          	sb	a2,1(a5)
    800090b4:	04e68663          	beq	a3,a4,80009100 <__memmove+0xfc>
    800090b8:	0025c603          	lbu	a2,2(a1)
    800090bc:	00200713          	li	a4,2
    800090c0:	00c78123          	sb	a2,2(a5)
    800090c4:	02e68e63          	beq	a3,a4,80009100 <__memmove+0xfc>
    800090c8:	0035c603          	lbu	a2,3(a1)
    800090cc:	00300713          	li	a4,3
    800090d0:	00c781a3          	sb	a2,3(a5)
    800090d4:	02e68663          	beq	a3,a4,80009100 <__memmove+0xfc>
    800090d8:	0045c603          	lbu	a2,4(a1)
    800090dc:	00400713          	li	a4,4
    800090e0:	00c78223          	sb	a2,4(a5)
    800090e4:	00e68e63          	beq	a3,a4,80009100 <__memmove+0xfc>
    800090e8:	0055c603          	lbu	a2,5(a1)
    800090ec:	00500713          	li	a4,5
    800090f0:	00c782a3          	sb	a2,5(a5)
    800090f4:	00e68663          	beq	a3,a4,80009100 <__memmove+0xfc>
    800090f8:	0065c703          	lbu	a4,6(a1)
    800090fc:	00e78323          	sb	a4,6(a5)
    80009100:	00813403          	ld	s0,8(sp)
    80009104:	01010113          	addi	sp,sp,16
    80009108:	00008067          	ret
    8000910c:	02061713          	slli	a4,a2,0x20
    80009110:	02075713          	srli	a4,a4,0x20
    80009114:	00e587b3          	add	a5,a1,a4
    80009118:	f0f574e3          	bgeu	a0,a5,80009020 <__memmove+0x1c>
    8000911c:	02069613          	slli	a2,a3,0x20
    80009120:	02065613          	srli	a2,a2,0x20
    80009124:	fff64613          	not	a2,a2
    80009128:	00e50733          	add	a4,a0,a4
    8000912c:	00c78633          	add	a2,a5,a2
    80009130:	fff7c683          	lbu	a3,-1(a5)
    80009134:	fff78793          	addi	a5,a5,-1
    80009138:	fff70713          	addi	a4,a4,-1
    8000913c:	00d70023          	sb	a3,0(a4)
    80009140:	fec798e3          	bne	a5,a2,80009130 <__memmove+0x12c>
    80009144:	00813403          	ld	s0,8(sp)
    80009148:	01010113          	addi	sp,sp,16
    8000914c:	00008067          	ret
    80009150:	02069713          	slli	a4,a3,0x20
    80009154:	02075713          	srli	a4,a4,0x20
    80009158:	00170713          	addi	a4,a4,1
    8000915c:	00e50733          	add	a4,a0,a4
    80009160:	00050793          	mv	a5,a0
    80009164:	0005c683          	lbu	a3,0(a1)
    80009168:	00178793          	addi	a5,a5,1
    8000916c:	00158593          	addi	a1,a1,1
    80009170:	fed78fa3          	sb	a3,-1(a5)
    80009174:	fee798e3          	bne	a5,a4,80009164 <__memmove+0x160>
    80009178:	f89ff06f          	j	80009100 <__memmove+0xfc>
	...
