
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	cb013103          	ld	sp,-848(sp) # 8000ccb0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	3b4070ef          	jal	ra,800073d0 <start>

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
    80001084:	7b1000ef          	jal	ra,80002034 <interruptRoutine>

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

        Node(TCB* d) : data(d), next(nullptr) {}

        static void* operator new(size_t size) {
            return mem_alloc(size);
        }
    8000125c:	01000513          	li	a0,16
    80001260:	00000097          	auipc	ra,0x0
    80001264:	0a8080e7          	jalr	168(ra) # 80001308 <_Z9mem_allocm>

    80001268:	01253023          	sd	s2,0(a0)
    8000126c:	00053423          	sd	zero,8(a0)
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    }
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
        }
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
    80001668:	6dc7c783          	lbu	a5,1756(a5) # 8000cd40 <_ZN8KConsole11initializedE>
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
    8000168c:	6b848493          	addi	s1,s1,1720 # 8000cd40 <_ZN8KConsole11initializedE>
    80001690:	0000b797          	auipc	a5,0xb
    80001694:	5e87b783          	ld	a5,1512(a5) # 8000cc78 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001698:	0007b783          	ld	a5,0(a5)
    8000169c:	00f4b423          	sd	a5,8(s1)
	sr = (uint8*)CONSOLE_STATUS;
    800016a0:	0000b797          	auipc	a5,0xb
    800016a4:	5e87b783          	ld	a5,1512(a5) # 8000cc88 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016a8:	0007b783          	ld	a5,0(a5)
    800016ac:	00f4b823          	sd	a5,16(s1)
	sem_open(&inputBufferHasSpace, capacity);
    800016b0:	03200593          	li	a1,50
    800016b4:	0000b517          	auipc	a0,0xb
    800016b8:	6a450513          	addi	a0,a0,1700 # 8000cd58 <_ZN8KConsole19inputBufferHasSpaceE>
    800016bc:	00000097          	auipc	ra,0x0
    800016c0:	de8080e7          	jalr	-536(ra) # 800014a4 <_Z8sem_openPP4KSemj>
	sem_open(&outputBufferHasSpace, capacity);
    800016c4:	03200593          	li	a1,50
    800016c8:	0000b517          	auipc	a0,0xb
    800016cc:	69850513          	addi	a0,a0,1688 # 8000cd60 <_ZN8KConsole20outputBufferHasSpaceE>
    800016d0:	00000097          	auipc	ra,0x0
    800016d4:	dd4080e7          	jalr	-556(ra) # 800014a4 <_Z8sem_openPP4KSemj>
	sem_open(&charsToInput, 0);
    800016d8:	00000593          	li	a1,0
    800016dc:	0000b517          	auipc	a0,0xb
    800016e0:	68c50513          	addi	a0,a0,1676 # 8000cd68 <_ZN8KConsole12charsToInputE>
    800016e4:	00000097          	auipc	ra,0x0
    800016e8:	dc0080e7          	jalr	-576(ra) # 800014a4 <_Z8sem_openPP4KSemj>
	sem_open(&charsToOutput, 0);
    800016ec:	00000593          	li	a1,0
    800016f0:	0000b517          	auipc	a0,0xb
    800016f4:	68050513          	addi	a0,a0,1664 # 8000cd70 <_ZN8KConsole13charsToOutputE>
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
    8000173c:	4a8080e7          	jalr	1192(ra) # 80005be0 <_Z11printStringPKc>
	printInteger((uint64)dr);
    80001740:	0000b497          	auipc	s1,0xb
    80001744:	60048493          	addi	s1,s1,1536 # 8000cd40 <_ZN8KConsole11initializedE>
    80001748:	0084b503          	ld	a0,8(s1)
    8000174c:	00000097          	auipc	ra,0x0
    80001750:	250080e7          	jalr	592(ra) # 8000199c <_Z12printIntegerm>
	printString("\n");
    80001754:	00009517          	auipc	a0,0x9
    80001758:	e6450513          	addi	a0,a0,-412 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    8000175c:	00004097          	auipc	ra,0x4
    80001760:	484080e7          	jalr	1156(ra) # 80005be0 <_Z11printStringPKc>
	printString("CONSOLE_STATUS = ");
    80001764:	00009517          	auipc	a0,0x9
    80001768:	8cc50513          	addi	a0,a0,-1844 # 8000a030 <CONSOLE_STATUS+0x20>
    8000176c:	00004097          	auipc	ra,0x4
    80001770:	474080e7          	jalr	1140(ra) # 80005be0 <_Z11printStringPKc>
	printInteger((uint64)sr);
    80001774:	0104b503          	ld	a0,16(s1)
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	224080e7          	jalr	548(ra) # 8000199c <_Z12printIntegerm>
	printString("\n");
    80001780:	00009517          	auipc	a0,0x9
    80001784:	e3850513          	addi	a0,a0,-456 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80001788:	00004097          	auipc	ra,0x4
    8000178c:	458080e7          	jalr	1112(ra) # 80005be0 <_Z11printStringPKc>
	printString("*CONSOLE_RX = ");
    80001790:	00009517          	auipc	a0,0x9
    80001794:	8b850513          	addi	a0,a0,-1864 # 8000a048 <CONSOLE_STATUS+0x38>
    80001798:	00004097          	auipc	ra,0x4
    8000179c:	448080e7          	jalr	1096(ra) # 80005be0 <_Z11printStringPKc>
	printInteger(*dr);
    800017a0:	0084b783          	ld	a5,8(s1)
    800017a4:	0007c503          	lbu	a0,0(a5)
    800017a8:	00000097          	auipc	ra,0x0
    800017ac:	1f4080e7          	jalr	500(ra) # 8000199c <_Z12printIntegerm>
	printString("\n");
    800017b0:	00009517          	auipc	a0,0x9
    800017b4:	e0850513          	addi	a0,a0,-504 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800017b8:	00004097          	auipc	ra,0x4
    800017bc:	428080e7          	jalr	1064(ra) # 80005be0 <_Z11printStringPKc>
	printString("*CONSOLE_STATUS = ");
    800017c0:	00009517          	auipc	a0,0x9
    800017c4:	89850513          	addi	a0,a0,-1896 # 8000a058 <CONSOLE_STATUS+0x48>
    800017c8:	00004097          	auipc	ra,0x4
    800017cc:	418080e7          	jalr	1048(ra) # 80005be0 <_Z11printStringPKc>
	printInteger(*sr);
    800017d0:	0104b783          	ld	a5,16(s1)
    800017d4:	0007c503          	lbu	a0,0(a5)
    800017d8:	00000097          	auipc	ra,0x0
    800017dc:	1c4080e7          	jalr	452(ra) # 8000199c <_Z12printIntegerm>
	printString("\n");
    800017e0:	00009517          	auipc	a0,0x9
    800017e4:	dd850513          	addi	a0,a0,-552 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800017e8:	00004097          	auipc	ra,0x4
    800017ec:	3f8080e7          	jalr	1016(ra) # 80005be0 <_Z11printStringPKc>
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
    8000181c:	52848493          	addi	s1,s1,1320 # 8000cd40 <_ZN8KConsole11initializedE>
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
    80001860:	55872703          	lw	a4,1368(a4) # 8000cdb4 <_ZN8KConsole15inputBufferSizeE>
    80001864:	03200793          	li	a5,50
    80001868:	04f70e63          	beq	a4,a5,800018c4 <_ZN8KConsole12placeInInputEc+0x68>
void KConsole::placeInInput(char c) {
    8000186c:	ff010113          	addi	sp,sp,-16
    80001870:	00113423          	sd	ra,8(sp)
    80001874:	00813023          	sd	s0,0(sp)
    80001878:	01010413          	addi	s0,sp,16
	inputBuffer[inputTail] = c;
    8000187c:	0000b697          	auipc	a3,0xb
    80001880:	4c468693          	addi	a3,a3,1220 # 8000cd40 <_ZN8KConsole11initializedE>
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
    800018e8:	45c48493          	addi	s1,s1,1116 # 8000cd40 <_ZN8KConsole11initializedE>
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
    80001950:	3f448493          	addi	s1,s1,1012 # 8000cd40 <_ZN8KConsole11initializedE>
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
    80001a64:	3a07b783          	ld	a5,928(a5) # 8000ce00 <_ZN9Scheduler4tailE>
    80001a68:	02078263          	beqz	a5,80001a8c <_ZN9Scheduler3putEP3TCB+0x38>
        head = tail = tcb;
    } else {
        tail->nextInScheduler = tcb;
    80001a6c:	02a7b823          	sd	a0,48(a5)
        tail = tcb;
    80001a70:	0000b797          	auipc	a5,0xb
    80001a74:	38a7b823          	sd	a0,912(a5) # 8000ce00 <_ZN9Scheduler4tailE>

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
    80001a90:	37478793          	addi	a5,a5,884 # 8000ce00 <_ZN9Scheduler4tailE>
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
    80001ab0:	35470713          	addi	a4,a4,852 # 8000ce00 <_ZN9Scheduler4tailE>
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
    80001af8:	31c83803          	ld	a6,796(a6) # 8000ce10 <_ZN9Scheduler12sleepingHeadE>
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
    80001b30:	2ea7b223          	sd	a0,740(a5) # 8000ce10 <_ZN9Scheduler12sleepingHeadE>
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
    80001b78:	28a7be23          	sd	a0,668(a5) # 8000ce10 <_ZN9Scheduler12sleepingHeadE>
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
    80001b94:	2807b783          	ld	a5,640(a5) # 8000ce10 <_ZN9Scheduler12sleepingHeadE>
    80001b98:	06078a63          	beqz	a5,80001c0c <_ZN9Scheduler4wakeEv+0x7c>
    sleepingHead->timeToSleep--;
    80001b9c:	0387b703          	ld	a4,56(a5)
    80001ba0:	fff70713          	addi	a4,a4,-1
    80001ba4:	02e7bc23          	sd	a4,56(a5)
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001ba8:	0000b517          	auipc	a0,0xb
    80001bac:	26853503          	ld	a0,616(a0) # 8000ce10 <_ZN9Scheduler12sleepingHeadE>
    80001bb0:	04050e63          	beqz	a0,80001c0c <_ZN9Scheduler4wakeEv+0x7c>
    80001bb4:	03853783          	ld	a5,56(a0)
    80001bb8:	04079a63          	bnez	a5,80001c0c <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    80001bbc:	ff010113          	addi	sp,sp,-16
    80001bc0:	00113423          	sd	ra,8(sp)
    80001bc4:	00813023          	sd	s0,0(sp)
    80001bc8:	01010413          	addi	s0,sp,16
    80001bcc:	00c0006f          	j	80001bd8 <_ZN9Scheduler4wakeEv+0x48>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001bd0:	03853783          	ld	a5,56(a0)
    80001bd4:	02079463          	bnez	a5,80001bfc <_ZN9Scheduler4wakeEv+0x6c>
        TCB* thread = sleepingHead;
        sleepingHead = sleepingHead->nextSleeping;
    80001bd8:	04053783          	ld	a5,64(a0)
    80001bdc:	0000b717          	auipc	a4,0xb
    80001be0:	22f73a23          	sd	a5,564(a4) # 8000ce10 <_ZN9Scheduler12sleepingHeadE>
        thread->nextSleeping = nullptr;
    80001be4:	04053023          	sd	zero,64(a0)
        Scheduler::put(thread);
    80001be8:	00000097          	auipc	ra,0x0
    80001bec:	e6c080e7          	jalr	-404(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
    while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001bf0:	0000b517          	auipc	a0,0xb
    80001bf4:	22053503          	ld	a0,544(a0) # 8000ce10 <_ZN9Scheduler12sleepingHeadE>
    80001bf8:	fc051ce3          	bnez	a0,80001bd0 <_ZN9Scheduler4wakeEv+0x40>
    }
}
    80001bfc:	00813083          	ld	ra,8(sp)
    80001c00:	00013403          	ld	s0,0(sp)
    80001c04:	01010113          	addi	sp,sp,16
    80001c08:	00008067          	ret
    80001c0c:	00008067          	ret

0000000080001c10 <_ZN7KMemory7kmallocEm>:
    kmalloc(blocksForBitVector);

    initialized = true;
}

void* KMemory::kmalloc(size_t size) {
    80001c10:	ff010113          	addi	sp,sp,-16
    80001c14:	00813423          	sd	s0,8(sp)
    80001c18:	01010413          	addi	s0,sp,16
    if (size <= 0) return nullptr;
    80001c1c:	14050063          	beqz	a0,80001d5c <_ZN7KMemory7kmallocEm+0x14c>
    uint64 currentElem = 0;
    uint64 currentBit = 63;
    uint64 firstZeroElem = 0;
    uint64 firstZeroBit = 63;
    uint64 zerosFound = 0;
    bool zeroFound = false;
    80001c20:	00000313          	li	t1,0
    uint64 zerosFound = 0;
    80001c24:	00000713          	li	a4,0
    uint64 firstZeroBit = 63;
    80001c28:	03f00813          	li	a6,63
    uint64 firstZeroElem = 0;
    80001c2c:	00000893          	li	a7,0
    uint64 currentBit = 63;
    80001c30:	03f00793          	li	a5,63
    uint64 currentElem = 0;
    80001c34:	00000593          	li	a1,0
    80001c38:	0080006f          	j	80001c40 <_ZN7KMemory7kmallocEm+0x30>
            firstZeroElem = currentElem;
        } else {
            zerosFound++;
        }
        if (zerosFound == size) break;
        if (currentBit-- == 0) {
    80001c3c:	00068793          	mv	a5,a3
    while (currentElem < sizeOfBitVectorInUint64) {
    80001c40:	0000b697          	auipc	a3,0xb
    80001c44:	1d86b683          	ld	a3,472(a3) # 8000ce18 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001c48:	08d5fa63          	bgeu	a1,a3,80001cdc <_ZN7KMemory7kmallocEm+0xcc>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001c4c:	03f00693          	li	a3,63
    80001c50:	02d78a63          	beq	a5,a3,80001c84 <_ZN7KMemory7kmallocEm+0x74>
        uint64 bit = bitVector[currentElem] & maskBit(currentBit);
    80001c54:	00359693          	slli	a3,a1,0x3
    80001c58:	0000b617          	auipc	a2,0xb
    80001c5c:	1c863603          	ld	a2,456(a2) # 8000ce20 <_ZN7KMemory9bitVectorE>
    80001c60:	00d606b3          	add	a3,a2,a3
    80001c64:	0006b683          	ld	a3,0(a3)
    //adresa pocetka bit vektora (HEAP_START_ADDR)
    static uint64* bitVector;

    //maska sa 1 na mestu bitPos i ostalim nulama (bitPos=0..63)
    inline static uint64 maskBit(uint64 bitPos) {
        return (uint64)1 << bitPos;
    80001c68:	00100613          	li	a2,1
    80001c6c:	00f61633          	sll	a2,a2,a5
    80001c70:	00c6f6b3          	and	a3,a3,a2
        if (bit > 0) {
    80001c74:	02069a63          	bnez	a3,80001ca8 <_ZN7KMemory7kmallocEm+0x98>
        } else if (!zeroFound) {
    80001c78:	04030863          	beqz	t1,80001cc8 <_ZN7KMemory7kmallocEm+0xb8>
            zerosFound++;
    80001c7c:	00170713          	addi	a4,a4,1
    80001c80:	0300006f          	j	80001cb0 <_ZN7KMemory7kmallocEm+0xa0>
        if (currentBit == 63 && bitVector[currentElem] == 0xffffffffffffffff) {
    80001c84:	00359693          	slli	a3,a1,0x3
    80001c88:	0000b617          	auipc	a2,0xb
    80001c8c:	19863603          	ld	a2,408(a2) # 8000ce20 <_ZN7KMemory9bitVectorE>
    80001c90:	00d606b3          	add	a3,a2,a3
    80001c94:	0006b603          	ld	a2,0(a3)
    80001c98:	fff00693          	li	a3,-1
    80001c9c:	fad61ce3          	bne	a2,a3,80001c54 <_ZN7KMemory7kmallocEm+0x44>
            currentElem++;
    80001ca0:	00158593          	addi	a1,a1,1
            continue;
    80001ca4:	f9dff06f          	j	80001c40 <_ZN7KMemory7kmallocEm+0x30>
            zeroFound = false;
    80001ca8:	00000313          	li	t1,0
            zerosFound = 0;
    80001cac:	00000713          	li	a4,0
        if (zerosFound == size) break;
    80001cb0:	02a70663          	beq	a4,a0,80001cdc <_ZN7KMemory7kmallocEm+0xcc>
        if (currentBit-- == 0) {
    80001cb4:	fff78693          	addi	a3,a5,-1
    80001cb8:	f80792e3          	bnez	a5,80001c3c <_ZN7KMemory7kmallocEm+0x2c>
            currentBit = 63;
            currentElem++;
    80001cbc:	00158593          	addi	a1,a1,1
            currentBit = 63;
    80001cc0:	03f00793          	li	a5,63
    80001cc4:	f7dff06f          	j	80001c40 <_ZN7KMemory7kmallocEm+0x30>
            firstZeroBit = currentBit;
    80001cc8:	00078813          	mv	a6,a5
            firstZeroElem = currentElem;
    80001ccc:	00058893          	mv	a7,a1
            zeroFound = true;
    80001cd0:	00100313          	li	t1,1
            zerosFound = 1;
    80001cd4:	00100713          	li	a4,1
    80001cd8:	fd9ff06f          	j	80001cb0 <_ZN7KMemory7kmallocEm+0xa0>
        }
    }
    if (zerosFound != size) return nullptr;
    80001cdc:	08a71463          	bne	a4,a0,80001d64 <_ZN7KMemory7kmallocEm+0x154>

    //alociranje blokova
    uint64 blockNum = firstZeroElem * 64 + (63 - firstZeroBit);
    80001ce0:	00689793          	slli	a5,a7,0x6
    80001ce4:	410787b3          	sub	a5,a5,a6
    80001ce8:	03f78793          	addi	a5,a5,63
    void* addr = (char*)HEAP_START_ADDR + blockNum * MEM_BLOCK_SIZE;
    80001cec:	0000b697          	auipc	a3,0xb
    80001cf0:	fa46b683          	ld	a3,-92(a3) # 8000cc90 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001cf4:	0006b583          	ld	a1,0(a3)
    80001cf8:	00679793          	slli	a5,a5,0x6
    80001cfc:	00f585b3          	add	a1,a1,a5
    *(uint64*)addr = size;  //da znamo koliko blokova je alocirano zaredom
    80001d00:	00a5b023          	sd	a0,0(a1)

    //upisivanje 1 u bit vektor
    currentElem = firstZeroElem;
    currentBit = firstZeroBit;
    80001d04:	0080006f          	j	80001d0c <_ZN7KMemory7kmallocEm+0xfc>
    while (zerosFound > 0) {
        bitVector[currentElem] |= maskBit(currentBit);
        zerosFound--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001d08:	00078813          	mv	a6,a5
    while (zerosFound > 0) {
    80001d0c:	04070063          	beqz	a4,80001d4c <_ZN7KMemory7kmallocEm+0x13c>
    80001d10:	00100693          	li	a3,1
    80001d14:	01069633          	sll	a2,a3,a6
        bitVector[currentElem] |= maskBit(currentBit);
    80001d18:	00389793          	slli	a5,a7,0x3
    80001d1c:	0000b697          	auipc	a3,0xb
    80001d20:	1046b683          	ld	a3,260(a3) # 8000ce20 <_ZN7KMemory9bitVectorE>
    80001d24:	00f687b3          	add	a5,a3,a5
    80001d28:	0007b683          	ld	a3,0(a5)
    80001d2c:	00c6e6b3          	or	a3,a3,a2
    80001d30:	00d7b023          	sd	a3,0(a5)
        zerosFound--;
    80001d34:	fff70713          	addi	a4,a4,-1
        if (currentBit-- == 0) {
    80001d38:	fff80793          	addi	a5,a6,-1
    80001d3c:	fc0816e3          	bnez	a6,80001d08 <_ZN7KMemory7kmallocEm+0xf8>
            currentElem++;
    80001d40:	00188893          	addi	a7,a7,1
            currentBit = 63;
    80001d44:	03f00793          	li	a5,63
    80001d48:	fc1ff06f          	j	80001d08 <_ZN7KMemory7kmallocEm+0xf8>
        }
    }
    return (char*)addr + 2 * sizeof(uint64);    //offset 2 da bi bilo zaokruzeno na 16 zbog steka
    80001d4c:	01058513          	addi	a0,a1,16
}
    80001d50:	00813403          	ld	s0,8(sp)
    80001d54:	01010113          	addi	sp,sp,16
    80001d58:	00008067          	ret
    if (size <= 0) return nullptr;
    80001d5c:	00000513          	li	a0,0
    80001d60:	ff1ff06f          	j	80001d50 <_ZN7KMemory7kmallocEm+0x140>
    if (zerosFound != size) return nullptr;
    80001d64:	00000513          	li	a0,0
    80001d68:	fe9ff06f          	j	80001d50 <_ZN7KMemory7kmallocEm+0x140>

0000000080001d6c <_ZN7KMemory16initializeMemoryEv>:
    if (initialized) return;
    80001d6c:	0000b797          	auipc	a5,0xb
    80001d70:	0bc7c783          	lbu	a5,188(a5) # 8000ce28 <_ZN7KMemory11initializedE>
    80001d74:	0a079663          	bnez	a5,80001e20 <_ZN7KMemory16initializeMemoryEv+0xb4>
void KMemory::initializeMemory() {
    80001d78:	ff010113          	addi	sp,sp,-16
    80001d7c:	00113423          	sd	ra,8(sp)
    80001d80:	00813023          	sd	s0,0(sp)
    80001d84:	01010413          	addi	s0,sp,16
    uint64 sizeInBytes = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001d88:	0000b797          	auipc	a5,0xb
    80001d8c:	f487b783          	ld	a5,-184(a5) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001d90:	0007b783          	ld	a5,0(a5)
    80001d94:	0000b717          	auipc	a4,0xb
    80001d98:	efc73703          	ld	a4,-260(a4) # 8000cc90 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001d9c:	00073683          	ld	a3,0(a4)
    80001da0:	40d787b3          	sub	a5,a5,a3
    sizeOfBitVectorInUint64 = numOfBlocks / (sizeof(uint64) * 8);
    80001da4:	00c7d793          	srli	a5,a5,0xc
    80001da8:	0000b717          	auipc	a4,0xb
    80001dac:	07070713          	addi	a4,a4,112 # 8000ce18 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001db0:	00f73023          	sd	a5,0(a4)
    numOfBlocks = sizeOfBitVectorInUint64 * sizeof(uint64) * 8; //da se zaokruzi broj postojecih blokova na umnozak 64
    80001db4:	00679613          	slli	a2,a5,0x6
    80001db8:	00c73c23          	sd	a2,24(a4)
    uint64 blocksForBitVector = (sizeOfBitVectorInUint64 * sizeof(uint64) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80001dbc:	00878513          	addi	a0,a5,8
    80001dc0:	00351513          	slli	a0,a0,0x3
    80001dc4:	fff50513          	addi	a0,a0,-1
    80001dc8:	00655513          	srli	a0,a0,0x6
    bitVector = (uint64*)HEAP_START_ADDR;
    80001dcc:	00d73423          	sd	a3,8(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001dd0:	00000793          	li	a5,0
    80001dd4:	0000b717          	auipc	a4,0xb
    80001dd8:	04473703          	ld	a4,68(a4) # 8000ce18 <_ZN7KMemory23sizeOfBitVectorInUint64E>
    80001ddc:	02e7f063          	bgeu	a5,a4,80001dfc <_ZN7KMemory16initializeMemoryEv+0x90>
        bitVector[i] = 0;   //ni jedan blok nije zauzet, svi bitovi su 0
    80001de0:	00379693          	slli	a3,a5,0x3
    80001de4:	0000b717          	auipc	a4,0xb
    80001de8:	03c73703          	ld	a4,60(a4) # 8000ce20 <_ZN7KMemory9bitVectorE>
    80001dec:	00d70733          	add	a4,a4,a3
    80001df0:	00073023          	sd	zero,0(a4)
    for (uint64 i = 0; i < sizeOfBitVectorInUint64; i++) {
    80001df4:	00178793          	addi	a5,a5,1
    80001df8:	fddff06f          	j	80001dd4 <_ZN7KMemory16initializeMemoryEv+0x68>
    kmalloc(blocksForBitVector);
    80001dfc:	00000097          	auipc	ra,0x0
    80001e00:	e14080e7          	jalr	-492(ra) # 80001c10 <_ZN7KMemory7kmallocEm>
    initialized = true;
    80001e04:	00100793          	li	a5,1
    80001e08:	0000b717          	auipc	a4,0xb
    80001e0c:	02f70023          	sb	a5,32(a4) # 8000ce28 <_ZN7KMemory11initializedE>
}
    80001e10:	00813083          	ld	ra,8(sp)
    80001e14:	00013403          	ld	s0,0(sp)
    80001e18:	01010113          	addi	sp,sp,16
    80001e1c:	00008067          	ret
    80001e20:	00008067          	ret

0000000080001e24 <_ZN7KMemory5kfreeEPv>:

int KMemory::kfree(void* ptr) {
    80001e24:	ff010113          	addi	sp,sp,-16
    80001e28:	00813423          	sd	s0,8(sp)
    80001e2c:	01010413          	addi	s0,sp,16
    if (!ptr) return 0;
    80001e30:	08050063          	beqz	a0,80001eb0 <_ZN7KMemory5kfreeEPv+0x8c>
    ptr = (char*)ptr - 2 * sizeof(uint64);
    80001e34:	ff050793          	addi	a5,a0,-16
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001e38:	0000b717          	auipc	a4,0xb
    80001e3c:	e5873703          	ld	a4,-424(a4) # 8000cc90 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001e40:	00073703          	ld	a4,0(a4)
    80001e44:	40e787b3          	sub	a5,a5,a4
    80001e48:	03f7f713          	andi	a4,a5,63
    80001e4c:	06071663          	bnez	a4,80001eb8 <_ZN7KMemory5kfreeEPv+0x94>
    uint64 blocksToFree = *(uint64*)ptr;
    80001e50:	ff053583          	ld	a1,-16(a0)
    uint64 blockNum = ((char*)ptr - (char*)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    80001e54:	0067d613          	srli	a2,a5,0x6
    uint64 currentElem = blockNum / 64;
    80001e58:	00c7d513          	srli	a0,a5,0xc
    uint64 currentBit = 63 - blockNum % 64;
    80001e5c:	fff64613          	not	a2,a2
    80001e60:	03f67613          	andi	a2,a2,63
    80001e64:	0080006f          	j	80001e6c <_ZN7KMemory5kfreeEPv+0x48>
    while (blocksToFree > 0) {
        bitVector[currentElem] &= ~maskBit(currentBit);
        blocksToFree--;
        if (currentBit-- == 0) {
            currentBit = 63;
    80001e68:	00078613          	mv	a2,a5
    while (blocksToFree > 0) {
    80001e6c:	04058a63          	beqz	a1,80001ec0 <_ZN7KMemory5kfreeEPv+0x9c>
    80001e70:	00100793          	li	a5,1
    80001e74:	00c797b3          	sll	a5,a5,a2
        bitVector[currentElem] &= ~maskBit(currentBit);
    80001e78:	fff7c793          	not	a5,a5
    80001e7c:	00351713          	slli	a4,a0,0x3
    80001e80:	0000b697          	auipc	a3,0xb
    80001e84:	fa06b683          	ld	a3,-96(a3) # 8000ce20 <_ZN7KMemory9bitVectorE>
    80001e88:	00e68733          	add	a4,a3,a4
    80001e8c:	00073683          	ld	a3,0(a4)
    80001e90:	00f6f7b3          	and	a5,a3,a5
    80001e94:	00f73023          	sd	a5,0(a4)
        blocksToFree--;
    80001e98:	fff58593          	addi	a1,a1,-1
        if (currentBit-- == 0) {
    80001e9c:	fff60793          	addi	a5,a2,-1
    80001ea0:	fc0614e3          	bnez	a2,80001e68 <_ZN7KMemory5kfreeEPv+0x44>
            currentElem++;
    80001ea4:	00150513          	addi	a0,a0,1
            currentBit = 63;
    80001ea8:	03f00793          	li	a5,63
    80001eac:	fbdff06f          	j	80001e68 <_ZN7KMemory5kfreeEPv+0x44>
    if (!ptr) return 0;
    80001eb0:	00000513          	li	a0,0
    80001eb4:	0100006f          	j	80001ec4 <_ZN7KMemory5kfreeEPv+0xa0>
    if (((char*)ptr - (char*)HEAP_START_ADDR) % MEM_BLOCK_SIZE > 0) return -1;
    80001eb8:	fff00513          	li	a0,-1
    80001ebc:	0080006f          	j	80001ec4 <_ZN7KMemory5kfreeEPv+0xa0>
        }
    }
    return 0;
    80001ec0:	00000513          	li	a0,0
}
    80001ec4:	00813403          	ld	s0,8(sp)
    80001ec8:	01010113          	addi	sp,sp,16
    80001ecc:	00008067          	ret

0000000080001ed0 <_Z4idlePv>:

extern "C" void interruptHandler();

void userMain();

void idle(void*) {
    80001ed0:	ff010113          	addi	sp,sp,-16
    80001ed4:	00113423          	sd	ra,8(sp)
    80001ed8:	00813023          	sd	s0,0(sp)
    80001edc:	01010413          	addi	s0,sp,16
    while (1) { thread_dispatch(); }
    80001ee0:	fffff097          	auipc	ra,0xfffff
    80001ee4:	54c080e7          	jalr	1356(ra) # 8000142c <_Z15thread_dispatchv>
    80001ee8:	ff9ff06f          	j	80001ee0 <_Z4idlePv+0x10>

0000000080001eec <_Z22kernelConsumerFunctionPv>:
}

void kernelConsumerFunction(void*) {
    80001eec:	ff010113          	addi	sp,sp,-16
    80001ef0:	00113423          	sd	ra,8(sp)
    80001ef4:	00813023          	sd	s0,0(sp)
    80001ef8:	01010413          	addi	s0,sp,16
    80001efc:	0280006f          	j	80001f24 <_Z22kernelConsumerFunctionPv+0x38>
    while (1) {
        char c = KConsole::getFromOutput();
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
        *KConsole::dr = c;
    80001f00:	0000b797          	auipc	a5,0xb
    80001f04:	db87b783          	ld	a5,-584(a5) # 8000ccb8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001f08:	0007b783          	ld	a5,0(a5)
    80001f0c:	00a78023          	sb	a0,0(a5)
        sem_signal(KConsole::outputBufferHasSpace);
    80001f10:	0000b797          	auipc	a5,0xb
    80001f14:	db07b783          	ld	a5,-592(a5) # 8000ccc0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001f18:	0007b503          	ld	a0,0(a5)
    80001f1c:	fffff097          	auipc	ra,0xfffff
    80001f20:	620080e7          	jalr	1568(ra) # 8000153c <_Z10sem_signalP4KSem>
        char c = KConsole::getFromOutput();
    80001f24:	00000097          	auipc	ra,0x0
    80001f28:	8e0080e7          	jalr	-1824(ra) # 80001804 <_ZN8KConsole13getFromOutputEv>
        while (!(*KConsole::sr & CONSOLE_TX_STATUS_BIT)) {}
    80001f2c:	0000b797          	auipc	a5,0xb
    80001f30:	dc47b783          	ld	a5,-572(a5) # 8000ccf0 <_GLOBAL_OFFSET_TABLE_+0x88>
    80001f34:	0007b783          	ld	a5,0(a5)
    80001f38:	0007c783          	lbu	a5,0(a5)
    80001f3c:	0207f793          	andi	a5,a5,32
    80001f40:	fe0786e3          	beqz	a5,80001f2c <_Z22kernelConsumerFunctionPv+0x40>
    80001f44:	fbdff06f          	j	80001f00 <_Z22kernelConsumerFunctionPv+0x14>

0000000080001f48 <_Z5main2v>:
    }

}

int main2() {
    80001f48:	fd010113          	addi	sp,sp,-48
    80001f4c:	02113423          	sd	ra,40(sp)
    80001f50:	02813023          	sd	s0,32(sp)
    80001f54:	03010413          	addi	s0,sp,48
    //postavljanje adrese prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80001f58:	0000b797          	auipc	a5,0xb
    80001f5c:	d807b783          	ld	a5,-640(a5) # 8000ccd8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001f60:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80001f64:	00000097          	auipc	ra,0x0
    80001f68:	e08080e7          	jalr	-504(ra) # 80001d6c <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    80001f6c:	fffff097          	auipc	ra,0xfffff
    80001f70:	6f8080e7          	jalr	1784(ra) # 80001664 <_ZN8KConsole12initKConsoleEv>
    //pravljenje niti
    thread_t mainHandle;
    thread_t userHandle;
    thread_t idleHandle;
    thread_t consoleOutputHandle;
    thread_create(&mainHandle, nullptr, nullptr);
    80001f74:	00000613          	li	a2,0
    80001f78:	00000593          	li	a1,0
    80001f7c:	fe840513          	addi	a0,s0,-24
    80001f80:	fffff097          	auipc	ra,0xfffff
    80001f84:	3f8080e7          	jalr	1016(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::setRunning(mainHandle);
    80001f88:	fe843783          	ld	a5,-24(s0)

    Body getBody() { return threadFunction; }

    static TCB* getRunning() { return running; }

    static void setRunning(TCB* newRunning) { running = newRunning; }
    80001f8c:	0000b717          	auipc	a4,0xb
    80001f90:	d3c73703          	ld	a4,-708(a4) # 8000ccc8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001f94:	00f73023          	sd	a5,0(a4)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80001f98:	00100713          	li	a4,1
    80001f9c:	04e7ac23          	sw	a4,88(a5)
    mainHandle->setStatus(TCB::ACTIVE);
    thread_create(&userHandle, (TCB::Body) userMain, nullptr);
    80001fa0:	00000613          	li	a2,0
    80001fa4:	0000b597          	auipc	a1,0xb
    80001fa8:	ccc5b583          	ld	a1,-820(a1) # 8000cc70 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001fac:	fe040513          	addi	a0,s0,-32
    80001fb0:	fffff097          	auipc	ra,0xfffff
    80001fb4:	3c8080e7          	jalr	968(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&consoleOutputHandle, kernelConsumerFunction, nullptr);
    80001fb8:	00000613          	li	a2,0
    80001fbc:	00000597          	auipc	a1,0x0
    80001fc0:	f3058593          	addi	a1,a1,-208 # 80001eec <_Z22kernelConsumerFunctionPv>
    80001fc4:	fd040513          	addi	a0,s0,-48
    80001fc8:	fffff097          	auipc	ra,0xfffff
    80001fcc:	3b0080e7          	jalr	944(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&idleHandle, idle, nullptr);
    80001fd0:	00000613          	li	a2,0
    80001fd4:	00000597          	auipc	a1,0x0
    80001fd8:	efc58593          	addi	a1,a1,-260 # 80001ed0 <_Z4idlePv>
    80001fdc:	fd840513          	addi	a0,s0,-40
    80001fe0:	fffff097          	auipc	ra,0xfffff
    80001fe4:	398080e7          	jalr	920(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001fe8:	00200793          	li	a5,2
    80001fec:	1007a073          	csrs	sstatus,a5

    //omogucavanje prekida
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //cekanje da se userMain zavrsi
    thread_join(userHandle);
    80001ff0:	fe043503          	ld	a0,-32(s0)
    80001ff4:	fffff097          	auipc	ra,0xfffff
    80001ff8:	458080e7          	jalr	1112(ra) # 8000144c <_Z11thread_joinP3TCB>

    //flush output bafera za konzolu
    while (KConsole::outputHead != KConsole::outputTail) {}
    80001ffc:	0000b797          	auipc	a5,0xb
    80002000:	cac7b783          	ld	a5,-852(a5) # 8000cca8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002004:	0007a703          	lw	a4,0(a5)
    80002008:	0000b797          	auipc	a5,0xb
    8000200c:	ce07b783          	ld	a5,-800(a5) # 8000cce8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002010:	0007a783          	lw	a5,0(a5)
    80002014:	fef714e3          	bne	a4,a5,80001ffc <_Z5main2v+0xb4>
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002018:	00200793          	li	a5,2
    8000201c:	1007b073          	csrc	sstatus,a5

    //maskiranje svih prekida
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    return 0;
    80002020:	00000513          	li	a0,0
    80002024:	02813083          	ld	ra,40(sp)
    80002028:	02013403          	ld	s0,32(sp)
    8000202c:	03010113          	addi	sp,sp,48
    80002030:	00008067          	ret

0000000080002034 <interruptRoutine>:
#include "../test/printing.hpp"

//void printInteger(int i);

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80002034:	f8010113          	addi	sp,sp,-128
    80002038:	06113c23          	sd	ra,120(sp)
    8000203c:	06813823          	sd	s0,112(sp)
    80002040:	06913423          	sd	s1,104(sp)
    80002044:	08010413          	addi	s0,sp,128
    //bitni sistemski registri
    uint64 scause, sepc, sstatus;
    __asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002048:	14202373          	csrr	t1,scause
    8000204c:	fc643c23          	sd	t1,-40(s0)
    __asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002050:	14102373          	csrr	t1,sepc
    80002054:	fc643823          	sd	t1,-48(s0)
    __asm__ volatile("csrr %[stat], sstatus":[stat] "=r"(sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002058:	10002373          	csrr	t1,sstatus
    8000205c:	fc643423          	sd	t1,-56(s0)

    //argumenti preneti sistemskom pozivu
    uint64 a0, a1, a2, a3, a4, a5, a6, a7;
    __asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002060:	00050313          	mv	t1,a0
    80002064:	fc643023          	sd	t1,-64(s0)
    __asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002068:	00058313          	mv	t1,a1
    8000206c:	fa643c23          	sd	t1,-72(s0)
    __asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002070:	00060313          	mv	t1,a2
    80002074:	fa643823          	sd	t1,-80(s0)
    __asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002078:	00068313          	mv	t1,a3
    8000207c:	fa643423          	sd	t1,-88(s0)
    __asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002080:	00070313          	mv	t1,a4
    80002084:	fa643023          	sd	t1,-96(s0)
    __asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002088:	00078313          	mv	t1,a5
    8000208c:	f8643c23          	sd	t1,-104(s0)
    __asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002090:	00080313          	mv	t1,a6
    80002094:	f8643823          	sd	t1,-112(s0)
    __asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002098:	00088313          	mv	t1,a7
    8000209c:	f8643423          	sd	t1,-120(s0)

    if (scause == 0x9 || scause == 0x8) {
    800020a0:	fd843703          	ld	a4,-40(s0)
    800020a4:	00900793          	li	a5,9
    800020a8:	00f70863          	beq	a4,a5,800020b8 <interruptRoutine+0x84>
    800020ac:	fd843703          	ld	a4,-40(s0)
    800020b0:	00800793          	li	a5,8
    800020b4:	36f71463          	bne	a4,a5,8000241c <interruptRoutine+0x3e8>
        //prekid zbog poziva ecall
        switch (a0) {
    800020b8:	fc043703          	ld	a4,-64(s0)
    800020bc:	09100793          	li	a5,145
    800020c0:	2cf70863          	beq	a4,a5,80002390 <interruptRoutine+0x35c>
    800020c4:	fc043703          	ld	a4,-64(s0)
    800020c8:	09100793          	li	a5,145
    800020cc:	2ce7ea63          	bltu	a5,a4,800023a0 <interruptRoutine+0x36c>
    800020d0:	fc043703          	ld	a4,-64(s0)
    800020d4:	08100793          	li	a5,129
    800020d8:	2af70263          	beq	a4,a5,8000237c <interruptRoutine+0x348>
    800020dc:	fc043703          	ld	a4,-64(s0)
    800020e0:	08100793          	li	a5,129
    800020e4:	2ae7ee63          	bltu	a5,a4,800023a0 <interruptRoutine+0x36c>
    800020e8:	fc043703          	ld	a4,-64(s0)
    800020ec:	04200793          	li	a5,66
    800020f0:	04e7e263          	bltu	a5,a4,80002134 <interruptRoutine+0x100>
    800020f4:	fc043783          	ld	a5,-64(s0)
    800020f8:	2a078463          	beqz	a5,800023a0 <interruptRoutine+0x36c>
    800020fc:	fc043703          	ld	a4,-64(s0)
    80002100:	04200793          	li	a5,66
    80002104:	28e7ee63          	bltu	a5,a4,800023a0 <interruptRoutine+0x36c>
    80002108:	fc043783          	ld	a5,-64(s0)
    8000210c:	00279713          	slli	a4,a5,0x2
    80002110:	00008797          	auipc	a5,0x8
    80002114:	fe478793          	addi	a5,a5,-28 # 8000a0f4 <_ZZ9kPrintIntmE6digits+0x84>
    80002118:	00f707b3          	add	a5,a4,a5
    8000211c:	0007a783          	lw	a5,0(a5)
    80002120:	0007871b          	sext.w	a4,a5
    80002124:	00008797          	auipc	a5,0x8
    80002128:	fd078793          	addi	a5,a5,-48 # 8000a0f4 <_ZZ9kPrintIntmE6digits+0x84>
    8000212c:	00f707b3          	add	a5,a4,a5
    80002130:	00078067          	jr	a5
    80002134:	fc043703          	ld	a4,-64(s0)
    80002138:	08000793          	li	a5,128
    8000213c:	1ef70a63          	beq	a4,a5,80002330 <interruptRoutine+0x2fc>
    80002140:	2600006f          	j	800023a0 <interruptRoutine+0x36c>
            case 0x01:
                //mem_alloc
                //a1 = broj blokova koje treba alocirati
                KMemory::kmalloc((size_t)a1);
    80002144:	fb843503          	ld	a0,-72(s0)
    80002148:	00000097          	auipc	ra,0x0
    8000214c:	ac8080e7          	jalr	-1336(ra) # 80001c10 <_ZN7KMemory7kmallocEm>
                __asm__ volatile("sd a0, 80(s0)");
    80002150:	04a43823          	sd	a0,80(s0)
                break;
    80002154:	2a80006f          	j	800023fc <interruptRoutine+0x3c8>
            case 0x02:
                //mem_free
                //a1 = pokazivac na memoriju koju dealociramo, dobijen sa mem_alloc
                KMemory::kfree((void*)a1);
    80002158:	fb843783          	ld	a5,-72(s0)
    8000215c:	00078513          	mv	a0,a5
    80002160:	00000097          	auipc	ra,0x0
    80002164:	cc4080e7          	jalr	-828(ra) # 80001e24 <_ZN7KMemory5kfreeEPv>
                __asm__ volatile("sd a0, 80(s0)");
    80002168:	04a43823          	sd	a0,80(s0)
                break;
    8000216c:	2900006f          	j	800023fc <interruptRoutine+0x3c8>
                //thread_create
                //a1 = pokazivac na rucku u koju upisujemo identifikator niti(adresa u memoriji)
                //a2 = pokazivac na funkciju koju nit treba da izvrsava
                //a3 = argumenti funkcije koju nit treba da izvrsava
                //a4 = poslednja lokacija alociranog steka(najniza adresa)
                *((thread_t*)a1) = TCB::createThread((TCB::Body)a2, (void*)a3, (uint64*)a4);
    80002170:	fb043783          	ld	a5,-80(s0)
    80002174:	fa843703          	ld	a4,-88(s0)
    80002178:	fa043683          	ld	a3,-96(s0)
    8000217c:	fb843483          	ld	s1,-72(s0)
    80002180:	00068613          	mv	a2,a3
    80002184:	00070593          	mv	a1,a4
    80002188:	00078513          	mv	a0,a5
    8000218c:	00001097          	auipc	ra,0x1
    80002190:	c54080e7          	jalr	-940(ra) # 80002de0 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002194:	00050793          	mv	a5,a0
    80002198:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    8000219c:	fb843783          	ld	a5,-72(s0)
    800021a0:	0007b783          	ld	a5,0(a5)
    800021a4:	02078463          	beqz	a5,800021cc <interruptRoutine+0x198>
                    if ((TCB::Body)a2 != nullptr) {
    800021a8:	fb043783          	ld	a5,-80(s0)
    800021ac:	00078c63          	beqz	a5,800021c4 <interruptRoutine+0x190>
                        Scheduler::put(*((thread_t*)a1));
    800021b0:	fb843783          	ld	a5,-72(s0)
    800021b4:	0007b783          	ld	a5,0(a5)
    800021b8:	00078513          	mv	a0,a5
    800021bc:	00000097          	auipc	ra,0x0
    800021c0:	898080e7          	jalr	-1896(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
                    }
                    __asm__ volatile("li a0, 0");
    800021c4:	00000513          	li	a0,0
    800021c8:	0080006f          	j	800021d0 <interruptRoutine+0x19c>
                } else {
                    __asm__ volatile("li a0, -1");
    800021cc:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800021d0:	04a43823          	sd	a0,80(s0)
                break;
    800021d4:	2280006f          	j	800023fc <interruptRoutine+0x3c8>
            case 0x12:
                //thread_exit
                TCB::getRunning()->setStatus(TCB::FINISHED);
    800021d8:	00000097          	auipc	ra,0x0
    800021dc:	43c080e7          	jalr	1084(ra) # 80002614 <_ZN3TCB10getRunningEv>
    800021e0:	00050793          	mv	a5,a0
    800021e4:	00500593          	li	a1,5
    800021e8:	00078513          	mv	a0,a5
    800021ec:	00000097          	auipc	ra,0x0
    800021f0:	3f0080e7          	jalr	1008(ra) # 800025dc <_ZN3TCB9setStatusENS_12ThreadStatusE>
                TCB::releaseJoined();
    800021f4:	00001097          	auipc	ra,0x1
    800021f8:	d10080e7          	jalr	-752(ra) # 80002f04 <_ZN3TCB13releaseJoinedEv>
                __asm__ volatile("li a0, 0");
    800021fc:	00000513          	li	a0,0
                __asm__ volatile("sd a0, 80(s0)");
    80002200:	04a43823          	sd	a0,80(s0)
                TCB::dispatch();
    80002204:	00001097          	auipc	ra,0x1
    80002208:	b08080e7          	jalr	-1272(ra) # 80002d0c <_ZN3TCB8dispatchEv>
                break;
    8000220c:	1f00006f          	j	800023fc <interruptRoutine+0x3c8>
            case 0x13:
                //thread_dispatch
                TCB::dispatch();
    80002210:	00001097          	auipc	ra,0x1
    80002214:	afc080e7          	jalr	-1284(ra) # 80002d0c <_ZN3TCB8dispatchEv>
                break;
    80002218:	1e40006f          	j	800023fc <interruptRoutine+0x3c8>
            case 0x14:
                //thread_join
                //a1 = rucka niti na koju tekuca nit treba da ceka
                TCB::threadJoin((thread_t)a1);
    8000221c:	fb843783          	ld	a5,-72(s0)
    80002220:	00078513          	mv	a0,a5
    80002224:	00001097          	auipc	ra,0x1
    80002228:	c90080e7          	jalr	-880(ra) # 80002eb4 <_ZN3TCB10threadJoinEPS_>
                TCB::dispatch();
    8000222c:	00001097          	auipc	ra,0x1
    80002230:	ae0080e7          	jalr	-1312(ra) # 80002d0c <_ZN3TCB8dispatchEv>
                break;
    80002234:	1c80006f          	j	800023fc <interruptRoutine+0x3c8>
            case 0x21:
                //sem_open
                //a1 = pokazivac na rucku semafora, u koju se upisuje adresa semafora u memoriji
                *((sem_t*)a1) = KSem::initSem((uint)a2);
    80002238:	fb043783          	ld	a5,-80(s0)
    8000223c:	0007879b          	sext.w	a5,a5
    80002240:	fb843483          	ld	s1,-72(s0)
    80002244:	00078513          	mv	a0,a5
    80002248:	00001097          	auipc	ra,0x1
    8000224c:	db8080e7          	jalr	-584(ra) # 80003000 <_ZN4KSem7initSemEj>
    80002250:	00050793          	mv	a5,a0
    80002254:	00f4b023          	sd	a5,0(s1)
                if (*((sem_t*)a1) != nullptr) {
    80002258:	fb843783          	ld	a5,-72(s0)
    8000225c:	0007b783          	ld	a5,0(a5)
    80002260:	00078663          	beqz	a5,8000226c <interruptRoutine+0x238>
                    __asm__ volatile("li a0, 0");
    80002264:	00000513          	li	a0,0
    80002268:	0080006f          	j	80002270 <interruptRoutine+0x23c>
                } else {
                    __asm__ volatile("li a0, -1");
    8000226c:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002270:	04a43823          	sd	a0,80(s0)
                break;
    80002274:	1880006f          	j	800023fc <interruptRoutine+0x3c8>
            case 0x22:
                //sem_close
                //a1 = rucka semafora
                KSem::closeSem((sem_t)a1);
    80002278:	fb843783          	ld	a5,-72(s0)
    8000227c:	00078513          	mv	a0,a5
    80002280:	00001097          	auipc	ra,0x1
    80002284:	ef4080e7          	jalr	-268(ra) # 80003174 <_ZN4KSem8closeSemEPS_>
                __asm__ volatile("sd a0, 80(s0)");
    80002288:	04a43823          	sd	a0,80(s0)
                break;
    8000228c:	1700006f          	j	800023fc <interruptRoutine+0x3c8>
            case 0x23:
                //sem_wait
                //a1 = rucka semafora
                ((sem_t)a1)->wait();
    80002290:	fb843783          	ld	a5,-72(s0)
    80002294:	00078513          	mv	a0,a5
    80002298:	00001097          	auipc	ra,0x1
    8000229c:	dfc080e7          	jalr	-516(ra) # 80003094 <_ZN4KSem4waitEv>
                __asm__ volatile("sd a0, 80(s0)");
    800022a0:	04a43823          	sd	a0,80(s0)
                break;
    800022a4:	1580006f          	j	800023fc <interruptRoutine+0x3c8>
            case 0x24:
                //sem_signal
                //a1 = rucka semafora
                ((sem_t)a1)->signal();
    800022a8:	fb843783          	ld	a5,-72(s0)
    800022ac:	00078513          	mv	a0,a5
    800022b0:	00001097          	auipc	ra,0x1
    800022b4:	e70080e7          	jalr	-400(ra) # 80003120 <_ZN4KSem6signalEv>
                __asm__ volatile("sd a0, 80(s0)");
    800022b8:	04a43823          	sd	a0,80(s0)
                break;
    800022bc:	1400006f          	j	800023fc <interruptRoutine+0x3c8>
            case 0x31:
                //time_sleep
                //a1 = broj perioda tajmera na koji se uspavljuje tekuca nit
                if ((time_t)a1 > 0) {
    800022c0:	fb843783          	ld	a5,-72(s0)
    800022c4:	00078663          	beqz	a5,800022d0 <interruptRoutine+0x29c>
                    __asm__ volatile("li a0, 0");
    800022c8:	00000513          	li	a0,0
    800022cc:	0080006f          	j	800022d4 <interruptRoutine+0x2a0>
                } else {
                    __asm__ volatile("li a0, -1");
    800022d0:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    800022d4:	04a43823          	sd	a0,80(s0)
                if ((time_t)a1 > 0) {
    800022d8:	fb843783          	ld	a5,-72(s0)
    800022dc:	10078e63          	beqz	a5,800023f8 <interruptRoutine+0x3c4>
                    Scheduler::putToSleep(TCB::getRunning(), (time_t)a1);
    800022e0:	00000097          	auipc	ra,0x0
    800022e4:	334080e7          	jalr	820(ra) # 80002614 <_ZN3TCB10getRunningEv>
    800022e8:	00050793          	mv	a5,a0
    800022ec:	fb843583          	ld	a1,-72(s0)
    800022f0:	00078513          	mv	a0,a5
    800022f4:	fffff097          	auipc	ra,0xfffff
    800022f8:	7ec080e7          	jalr	2028(ra) # 80001ae0 <_ZN9Scheduler10putToSleepEP3TCBm>
                    TCB::dispatch();
    800022fc:	00001097          	auipc	ra,0x1
    80002300:	a10080e7          	jalr	-1520(ra) # 80002d0c <_ZN3TCB8dispatchEv>
                }
                break;
    80002304:	0f40006f          	j	800023f8 <interruptRoutine+0x3c4>
            case 0x41:
                //getc
                KConsole::kgetc();
    80002308:	fffff097          	auipc	ra,0xfffff
    8000230c:	630080e7          	jalr	1584(ra) # 80001938 <_ZN8KConsole5kgetcEv>
                __asm__ volatile("sd a0, 80(s0)");
    80002310:	04a43823          	sd	a0,80(s0)
                break;
    80002314:	0e80006f          	j	800023fc <interruptRoutine+0x3c8>
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
    8000232c:	0d00006f          	j	800023fc <interruptRoutine+0x3c8>
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
    80002350:	a94080e7          	jalr	-1388(ra) # 80002de0 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80002354:	00050793          	mv	a5,a0
    80002358:	00f4b023          	sd	a5,0(s1)
                if (*((thread_t*)a1) != nullptr) {
    8000235c:	fb843783          	ld	a5,-72(s0)
    80002360:	0007b783          	ld	a5,0(a5)
    80002364:	00078663          	beqz	a5,80002370 <interruptRoutine+0x33c>
                    __asm__ volatile("li a0, 0");
    80002368:	00000513          	li	a0,0
    8000236c:	0080006f          	j	80002374 <interruptRoutine+0x340>
                } else {
                    __asm__ volatile("li a0, -1");
    80002370:	fff00513          	li	a0,-1
                }
                __asm__ volatile("sd a0, 80(s0)");
    80002374:	04a43823          	sd	a0,80(s0)
                break;
    80002378:	0840006f          	j	800023fc <interruptRoutine+0x3c8>
            case 0x81:
                //start thread
                //a1 = rucka niti koja se stavlja u scheduler
                Scheduler::put((thread_t)a1);
    8000237c:	fb843783          	ld	a5,-72(s0)
    80002380:	00078513          	mv	a0,a5
    80002384:	fffff097          	auipc	ra,0xfffff
    80002388:	6d0080e7          	jalr	1744(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
                break;
    8000238c:	0700006f          	j	800023fc <interruptRoutine+0x3c8>
            case 0x91:
                //printInteger
                //a1 = integer za ispis
                kPrintInt(a1);
    80002390:	fb843503          	ld	a0,-72(s0)
    80002394:	fffff097          	auipc	ra,0xfffff
    80002398:	630080e7          	jalr	1584(ra) # 800019c4 <_Z9kPrintIntm>
                break;
    8000239c:	0600006f          	j	800023fc <interruptRoutine+0x3c8>
            default:
                printString("\nNepostojeci op code: ");
    800023a0:	00008517          	auipc	a0,0x8
    800023a4:	ce050513          	addi	a0,a0,-800 # 8000a080 <_ZZ9kPrintIntmE6digits+0x10>
    800023a8:	00004097          	auipc	ra,0x4
    800023ac:	838080e7          	jalr	-1992(ra) # 80005be0 <_Z11printStringPKc>
                kPrintInt(a0);
    800023b0:	fc043503          	ld	a0,-64(s0)
    800023b4:	fffff097          	auipc	ra,0xfffff
    800023b8:	610080e7          	jalr	1552(ra) # 800019c4 <_Z9kPrintIntm>
                printString("\nscause: ");
    800023bc:	00008517          	auipc	a0,0x8
    800023c0:	cdc50513          	addi	a0,a0,-804 # 8000a098 <_ZZ9kPrintIntmE6digits+0x28>
    800023c4:	00004097          	auipc	ra,0x4
    800023c8:	81c080e7          	jalr	-2020(ra) # 80005be0 <_Z11printStringPKc>
                kPrintInt(scause);
    800023cc:	fd843503          	ld	a0,-40(s0)
    800023d0:	fffff097          	auipc	ra,0xfffff
    800023d4:	5f4080e7          	jalr	1524(ra) # 800019c4 <_Z9kPrintIntm>
                printString("\nsepc: ");
    800023d8:	00008517          	auipc	a0,0x8
    800023dc:	cd050513          	addi	a0,a0,-816 # 8000a0a8 <_ZZ9kPrintIntmE6digits+0x38>
    800023e0:	00004097          	auipc	ra,0x4
    800023e4:	800080e7          	jalr	-2048(ra) # 80005be0 <_Z11printStringPKc>
                kPrintInt(sepc);
    800023e8:	fd043503          	ld	a0,-48(s0)
    800023ec:	fffff097          	auipc	ra,0xfffff
    800023f0:	5d8080e7          	jalr	1496(ra) # 800019c4 <_Z9kPrintIntm>
                break;
    800023f4:	0080006f          	j	800023fc <interruptRoutine+0x3c8>
                break;
    800023f8:	00000013          	nop
        }
        //sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
        sepc += 4;
    800023fc:	fd043783          	ld	a5,-48(s0)
    80002400:	00478793          	addi	a5,a5,4
    80002404:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002408:	fd043783          	ld	a5,-48(s0)
    8000240c:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002410:	fc843783          	ld	a5,-56(s0)
    80002414:	10079073          	csrw	sstatus,a5
        printString("scause: ");
        kPrintInt(scause);
        printString("\nsepc: ");
        kPrintInt(sepc);
    }
    80002418:	1900006f          	j	800025a8 <interruptRoutine+0x574>
    } else if (scause == 0x8000000000000009) {
    8000241c:	fd843703          	ld	a4,-40(s0)
    80002420:	fff00793          	li	a5,-1
    80002424:	03f79793          	slli	a5,a5,0x3f
    80002428:	00978793          	addi	a5,a5,9
    8000242c:	08f71e63          	bne	a4,a5,800024c8 <interruptRoutine+0x494>
        uint64 irq = plic_claim();
    80002430:	00005097          	auipc	ra,0x5
    80002434:	7f4080e7          	jalr	2036(ra) # 80007c24 <plic_claim>
    80002438:	00050793          	mv	a5,a0
    8000243c:	f8f43023          	sd	a5,-128(s0)
        if (irq == CONSOLE_IRQ) {
    80002440:	f8043703          	ld	a4,-128(s0)
    80002444:	00a00793          	li	a5,10
    80002448:	02f71e63          	bne	a4,a5,80002484 <interruptRoutine+0x450>
            if (*KConsole::sr & CONSOLE_RX_STATUS_BIT) {
    8000244c:	0000b797          	auipc	a5,0xb
    80002450:	8a47b783          	ld	a5,-1884(a5) # 8000ccf0 <_GLOBAL_OFFSET_TABLE_+0x88>
    80002454:	0007b783          	ld	a5,0(a5)
    80002458:	0007c783          	lbu	a5,0(a5)
    8000245c:	0017f793          	andi	a5,a5,1
    80002460:	02078a63          	beqz	a5,80002494 <interruptRoutine+0x460>
                KConsole::placeInInput(*KConsole::dr);
    80002464:	0000b797          	auipc	a5,0xb
    80002468:	8547b783          	ld	a5,-1964(a5) # 8000ccb8 <_GLOBAL_OFFSET_TABLE_+0x50>
    8000246c:	0007b783          	ld	a5,0(a5)
    80002470:	0007c783          	lbu	a5,0(a5)
    80002474:	00078513          	mv	a0,a5
    80002478:	fffff097          	auipc	ra,0xfffff
    8000247c:	3e4080e7          	jalr	996(ra) # 8000185c <_ZN8KConsole12placeInInputEc>
    80002480:	0140006f          	j	80002494 <interruptRoutine+0x460>
            printString("Neki drugi prekid\n");
    80002484:	00008517          	auipc	a0,0x8
    80002488:	c2c50513          	addi	a0,a0,-980 # 8000a0b0 <_ZZ9kPrintIntmE6digits+0x40>
    8000248c:	00003097          	auipc	ra,0x3
    80002490:	754080e7          	jalr	1876(ra) # 80005be0 <_Z11printStringPKc>
        plic_complete(irq);
    80002494:	f8043783          	ld	a5,-128(s0)
    80002498:	0007879b          	sext.w	a5,a5
    8000249c:	00078513          	mv	a0,a5
    800024a0:	00005097          	auipc	ra,0x5
    800024a4:	7bc080e7          	jalr	1980(ra) # 80007c5c <plic_complete>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800024a8:	fd043783          	ld	a5,-48(s0)
    800024ac:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    800024b0:	fc843783          	ld	a5,-56(s0)
    800024b4:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SEIP);
    800024b8:	20000513          	li	a0,512
    800024bc:	00000097          	auipc	ra,0x0
    800024c0:	104080e7          	jalr	260(ra) # 800025c0 <_ZN5Riscv6mc_sipEm>
    800024c4:	0e40006f          	j	800025a8 <interruptRoutine+0x574>
    } else if (scause == 0x8000000000000001) {
    800024c8:	fd843703          	ld	a4,-40(s0)
    800024cc:	fff00793          	li	a5,-1
    800024d0:	03f79793          	slli	a5,a5,0x3f
    800024d4:	00178793          	addi	a5,a5,1
    800024d8:	08f71463          	bne	a4,a5,80002560 <interruptRoutine+0x52c>
        Scheduler::wake();
    800024dc:	fffff097          	auipc	ra,0xfffff
    800024e0:	6b4080e7          	jalr	1716(ra) # 80001b90 <_ZN9Scheduler4wakeEv>
        TCB::getRunningTimeSlice()++;
    800024e4:	00000097          	auipc	ra,0x0
    800024e8:	154080e7          	jalr	340(ra) # 80002638 <_ZN3TCB19getRunningTimeSliceEv>
    800024ec:	00050793          	mv	a5,a0
    800024f0:	0007b703          	ld	a4,0(a5)
    800024f4:	00170713          	addi	a4,a4,1
    800024f8:	00e7b023          	sd	a4,0(a5)
        if (TCB::getRunningTimeSlice() >= TCB::getRunning()->getTimeSlice()) {
    800024fc:	00000097          	auipc	ra,0x0
    80002500:	13c080e7          	jalr	316(ra) # 80002638 <_ZN3TCB19getRunningTimeSliceEv>
    80002504:	00050793          	mv	a5,a0
    80002508:	0007b483          	ld	s1,0(a5)
    8000250c:	00000097          	auipc	ra,0x0
    80002510:	108080e7          	jalr	264(ra) # 80002614 <_ZN3TCB10getRunningEv>
    80002514:	00050793          	mv	a5,a0
    80002518:	00078513          	mv	a0,a5
    8000251c:	00000097          	auipc	ra,0x0
    80002520:	0dc080e7          	jalr	220(ra) # 800025f8 <_ZN3TCB12getTimeSliceEv>
    80002524:	00050793          	mv	a5,a0
    80002528:	00f4b7b3          	sltu	a5,s1,a5
    8000252c:	0017c793          	xori	a5,a5,1
    80002530:	0ff7f793          	andi	a5,a5,255
    80002534:	00078663          	beqz	a5,80002540 <interruptRoutine+0x50c>
            TCB::dispatch();
    80002538:	00000097          	auipc	ra,0x0
    8000253c:	7d4080e7          	jalr	2004(ra) # 80002d0c <_ZN3TCB8dispatchEv>
        __asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80002540:	fd043783          	ld	a5,-48(s0)
    80002544:	14179073          	csrw	sepc,a5
        __asm__ volatile("csrw sstatus, %[stat]": :[stat]"r"(sstatus));
    80002548:	fc843783          	ld	a5,-56(s0)
    8000254c:	10079073          	csrw	sstatus,a5
        Riscv::mc_sip(Riscv::SIP_SSIP);
    80002550:	00200513          	li	a0,2
    80002554:	00000097          	auipc	ra,0x0
    80002558:	06c080e7          	jalr	108(ra) # 800025c0 <_ZN5Riscv6mc_sipEm>
    8000255c:	04c0006f          	j	800025a8 <interruptRoutine+0x574>
        printString("\nGreska u prekidnoj rutini\n");
    80002560:	00008517          	auipc	a0,0x8
    80002564:	b6850513          	addi	a0,a0,-1176 # 8000a0c8 <_ZZ9kPrintIntmE6digits+0x58>
    80002568:	00003097          	auipc	ra,0x3
    8000256c:	678080e7          	jalr	1656(ra) # 80005be0 <_Z11printStringPKc>
        printString("scause: ");
    80002570:	00008517          	auipc	a0,0x8
    80002574:	b7850513          	addi	a0,a0,-1160 # 8000a0e8 <_ZZ9kPrintIntmE6digits+0x78>
    80002578:	00003097          	auipc	ra,0x3
    8000257c:	668080e7          	jalr	1640(ra) # 80005be0 <_Z11printStringPKc>
        kPrintInt(scause);
    80002580:	fd843503          	ld	a0,-40(s0)
    80002584:	fffff097          	auipc	ra,0xfffff
    80002588:	440080e7          	jalr	1088(ra) # 800019c4 <_Z9kPrintIntm>
        printString("\nsepc: ");
    8000258c:	00008517          	auipc	a0,0x8
    80002590:	b1c50513          	addi	a0,a0,-1252 # 8000a0a8 <_ZZ9kPrintIntmE6digits+0x38>
    80002594:	00003097          	auipc	ra,0x3
    80002598:	64c080e7          	jalr	1612(ra) # 80005be0 <_Z11printStringPKc>
        kPrintInt(sepc);
    8000259c:	fd043503          	ld	a0,-48(s0)
    800025a0:	fffff097          	auipc	ra,0xfffff
    800025a4:	424080e7          	jalr	1060(ra) # 800019c4 <_Z9kPrintIntm>
    800025a8:	00000013          	nop
    800025ac:	07813083          	ld	ra,120(sp)
    800025b0:	07013403          	ld	s0,112(sp)
    800025b4:	06813483          	ld	s1,104(sp)
    800025b8:	08010113          	addi	sp,sp,128
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

00000000800025dc <_ZN3TCB9setStatusENS_12ThreadStatusE>:
    800025dc:	ff010113          	addi	sp,sp,-16
    800025e0:	00813423          	sd	s0,8(sp)
    800025e4:	01010413          	addi	s0,sp,16
    800025e8:	04b52c23          	sw	a1,88(a0)
    800025ec:	00813403          	ld	s0,8(sp)
    800025f0:	01010113          	addi	sp,sp,16
    800025f4:	00008067          	ret

00000000800025f8 <_ZN3TCB12getTimeSliceEv>:
    uint64 getTimeSlice() { return timeSlice; }
    800025f8:	ff010113          	addi	sp,sp,-16
    800025fc:	00813423          	sd	s0,8(sp)
    80002600:	01010413          	addi	s0,sp,16
    80002604:	02853503          	ld	a0,40(a0)
    80002608:	00813403          	ld	s0,8(sp)
    8000260c:	01010113          	addi	sp,sp,16
    80002610:	00008067          	ret

0000000080002614 <_ZN3TCB10getRunningEv>:
    static void setRunning(TCB* newRunning) { running = newRunning; }
    80002614:	ff010113          	addi	sp,sp,-16
    80002618:	00813423          	sd	s0,8(sp)
    8000261c:	01010413          	addi	s0,sp,16
    80002620:	0000a797          	auipc	a5,0xa
    80002624:	6a87b783          	ld	a5,1704(a5) # 8000ccc8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002628:	0007b503          	ld	a0,0(a5)
    8000262c:	00813403          	ld	s0,8(sp)
    80002630:	01010113          	addi	sp,sp,16
    80002634:	00008067          	ret

0000000080002638 <_ZN3TCB19getRunningTimeSliceEv>:

    static uint64 &getRunningTimeSlice() { return runningTimeSlice; }

    static void threadJoin(TCB* handle);
    80002638:	ff010113          	addi	sp,sp,-16
    8000263c:	00813423          	sd	s0,8(sp)
    80002640:	01010413          	addi	s0,sp,16
    80002644:	0000a517          	auipc	a0,0xa
    80002648:	63c53503          	ld	a0,1596(a0) # 8000cc80 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000264c:	00813403          	ld	s0,8(sp)
    80002650:	01010113          	addi	sp,sp,16
    80002654:	00008067          	ret

0000000080002658 <_ZN6Thread7wrapperEPv>:

    __asm__ volatile("ecall");
}

void Thread::wrapper(void* thread) {
    if (thread != nullptr) {
    80002658:	02050863          	beqz	a0,80002688 <_ZN6Thread7wrapperEPv+0x30>
void Thread::wrapper(void* thread) {
    8000265c:	ff010113          	addi	sp,sp,-16
    80002660:	00113423          	sd	ra,8(sp)
    80002664:	00813023          	sd	s0,0(sp)
    80002668:	01010413          	addi	s0,sp,16
        ((Thread*)thread)->run();
    8000266c:	00053783          	ld	a5,0(a0)
    80002670:	0107b783          	ld	a5,16(a5)
    80002674:	000780e7          	jalr	a5
    }
}
    80002678:	00813083          	ld	ra,8(sp)
    8000267c:	00013403          	ld	s0,0(sp)
    80002680:	01010113          	addi	sp,sp,16
    80002684:	00008067          	ret
    80002688:	00008067          	ret

000000008000268c <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    8000268c:	fe010113          	addi	sp,sp,-32
    80002690:	00113c23          	sd	ra,24(sp)
    80002694:	00813823          	sd	s0,16(sp)
    80002698:	00913423          	sd	s1,8(sp)
    8000269c:	02010413          	addi	s0,sp,32
    800026a0:	00050493          	mv	s1,a0
    800026a4:	0000a797          	auipc	a5,0xa
    800026a8:	37c78793          	addi	a5,a5,892 # 8000ca20 <_ZTV6Thread+0x10>
    800026ac:	00f53023          	sd	a5,0(a0)
    thread_join(this->myHandle);
    800026b0:	00853503          	ld	a0,8(a0)
    800026b4:	fffff097          	auipc	ra,0xfffff
    800026b8:	d98080e7          	jalr	-616(ra) # 8000144c <_Z11thread_joinP3TCB>
    delete myHandle;
    800026bc:	0084b483          	ld	s1,8(s1)
    800026c0:	02048863          	beqz	s1,800026f0 <_ZN6ThreadD1Ev+0x64>
            delete node;
        }
    }

    bool isEmpty() const {
        return front == nullptr;
    800026c4:	0484b503          	ld	a0,72(s1)
        while (!isEmpty()) {
    800026c8:	00050e63          	beqz	a0,800026e4 <_ZN6ThreadD1Ev+0x58>
            front = front->next;
    800026cc:	00853783          	ld	a5,8(a0)
    800026d0:	04f4b423          	sd	a5,72(s1)
            delete node;
    800026d4:	fe0508e3          	beqz	a0,800026c4 <_ZN6ThreadD1Ev+0x38>
            mem_free(ptr);
    800026d8:	fffff097          	auipc	ra,0xfffff
    800026dc:	c70080e7          	jalr	-912(ra) # 80001348 <_Z8mem_freePv>
        }
    800026e0:	fe5ff06f          	j	800026c4 <_ZN6ThreadD1Ev+0x38>
    800026e4:	00048513          	mv	a0,s1
    800026e8:	00000097          	auipc	ra,0x0
    800026ec:	7a4080e7          	jalr	1956(ra) # 80002e8c <_ZN3TCBdlEPv>
}
    800026f0:	01813083          	ld	ra,24(sp)
    800026f4:	01013403          	ld	s0,16(sp)
    800026f8:	00813483          	ld	s1,8(sp)
    800026fc:	02010113          	addi	sp,sp,32
    80002700:	00008067          	ret

0000000080002704 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002704:	fe010113          	addi	sp,sp,-32
    80002708:	00113c23          	sd	ra,24(sp)
    8000270c:	00813823          	sd	s0,16(sp)
    80002710:	00913423          	sd	s1,8(sp)
    80002714:	02010413          	addi	s0,sp,32
    80002718:	00050493          	mv	s1,a0
    8000271c:	0000a797          	auipc	a5,0xa
    80002720:	32c78793          	addi	a5,a5,812 # 8000ca48 <_ZTV9Semaphore+0x10>
    80002724:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80002728:	00853503          	ld	a0,8(a0)
    8000272c:	fffff097          	auipc	ra,0xfffff
    80002730:	db0080e7          	jalr	-592(ra) # 800014dc <_Z9sem_closeP4KSem>
    delete myHandle;
    80002734:	0084b483          	ld	s1,8(s1)
    80002738:	02048863          	beqz	s1,80002768 <_ZN9SemaphoreD1Ev+0x64>
        return front == nullptr;
    8000273c:	0084b503          	ld	a0,8(s1)
        while (!isEmpty()) {
    80002740:	00050e63          	beqz	a0,8000275c <_ZN9SemaphoreD1Ev+0x58>
            front = front->next;
    80002744:	00853783          	ld	a5,8(a0)
    80002748:	00f4b423          	sd	a5,8(s1)
            delete node;
    8000274c:	fe0508e3          	beqz	a0,8000273c <_ZN9SemaphoreD1Ev+0x38>
            mem_free(ptr);
    80002750:	fffff097          	auipc	ra,0xfffff
    80002754:	bf8080e7          	jalr	-1032(ra) # 80001348 <_Z8mem_freePv>
        }
    80002758:	fe5ff06f          	j	8000273c <_ZN9SemaphoreD1Ev+0x38>
    8000275c:	00048513          	mv	a0,s1
    80002760:	00001097          	auipc	ra,0x1
    80002764:	878080e7          	jalr	-1928(ra) # 80002fd8 <_ZN4KSemdlEPv>
}
    80002768:	01813083          	ld	ra,24(sp)
    8000276c:	01013403          	ld	s0,16(sp)
    80002770:	00813483          	ld	s1,8(sp)
    80002774:	02010113          	addi	sp,sp,32
    80002778:	00008067          	ret

000000008000277c <_Znwm>:
void* operator new(size_t size) {
    8000277c:	ff010113          	addi	sp,sp,-16
    80002780:	00113423          	sd	ra,8(sp)
    80002784:	00813023          	sd	s0,0(sp)
    80002788:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    8000278c:	fffff097          	auipc	ra,0xfffff
    80002790:	b7c080e7          	jalr	-1156(ra) # 80001308 <_Z9mem_allocm>
}
    80002794:	00813083          	ld	ra,8(sp)
    80002798:	00013403          	ld	s0,0(sp)
    8000279c:	01010113          	addi	sp,sp,16
    800027a0:	00008067          	ret

00000000800027a4 <_Znam>:
void* operator new[](size_t size) {
    800027a4:	ff010113          	addi	sp,sp,-16
    800027a8:	00113423          	sd	ra,8(sp)
    800027ac:	00813023          	sd	s0,0(sp)
    800027b0:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800027b4:	fffff097          	auipc	ra,0xfffff
    800027b8:	b54080e7          	jalr	-1196(ra) # 80001308 <_Z9mem_allocm>
}
    800027bc:	00813083          	ld	ra,8(sp)
    800027c0:	00013403          	ld	s0,0(sp)
    800027c4:	01010113          	addi	sp,sp,16
    800027c8:	00008067          	ret

00000000800027cc <_ZdlPv>:
noexcept {
    800027cc:	ff010113          	addi	sp,sp,-16
    800027d0:	00113423          	sd	ra,8(sp)
    800027d4:	00813023          	sd	s0,0(sp)
    800027d8:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800027dc:	fffff097          	auipc	ra,0xfffff
    800027e0:	b6c080e7          	jalr	-1172(ra) # 80001348 <_Z8mem_freePv>
}
    800027e4:	00813083          	ld	ra,8(sp)
    800027e8:	00013403          	ld	s0,0(sp)
    800027ec:	01010113          	addi	sp,sp,16
    800027f0:	00008067          	ret

00000000800027f4 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800027f4:	fe010113          	addi	sp,sp,-32
    800027f8:	00113c23          	sd	ra,24(sp)
    800027fc:	00813823          	sd	s0,16(sp)
    80002800:	00913423          	sd	s1,8(sp)
    80002804:	02010413          	addi	s0,sp,32
    80002808:	00050493          	mv	s1,a0
}
    8000280c:	00000097          	auipc	ra,0x0
    80002810:	e80080e7          	jalr	-384(ra) # 8000268c <_ZN6ThreadD1Ev>
    80002814:	00048513          	mv	a0,s1
    80002818:	00000097          	auipc	ra,0x0
    8000281c:	fb4080e7          	jalr	-76(ra) # 800027cc <_ZdlPv>
    80002820:	01813083          	ld	ra,24(sp)
    80002824:	01013403          	ld	s0,16(sp)
    80002828:	00813483          	ld	s1,8(sp)
    8000282c:	02010113          	addi	sp,sp,32
    80002830:	00008067          	ret

0000000080002834 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002834:	fe010113          	addi	sp,sp,-32
    80002838:	00113c23          	sd	ra,24(sp)
    8000283c:	00813823          	sd	s0,16(sp)
    80002840:	00913423          	sd	s1,8(sp)
    80002844:	02010413          	addi	s0,sp,32
    80002848:	00050493          	mv	s1,a0
}
    8000284c:	00000097          	auipc	ra,0x0
    80002850:	eb8080e7          	jalr	-328(ra) # 80002704 <_ZN9SemaphoreD1Ev>
    80002854:	00048513          	mv	a0,s1
    80002858:	00000097          	auipc	ra,0x0
    8000285c:	f74080e7          	jalr	-140(ra) # 800027cc <_ZdlPv>
    80002860:	01813083          	ld	ra,24(sp)
    80002864:	01013403          	ld	s0,16(sp)
    80002868:	00813483          	ld	s1,8(sp)
    8000286c:	02010113          	addi	sp,sp,32
    80002870:	00008067          	ret

0000000080002874 <_ZdaPv>:
noexcept {
    80002874:	ff010113          	addi	sp,sp,-16
    80002878:	00113423          	sd	ra,8(sp)
    8000287c:	00813023          	sd	s0,0(sp)
    80002880:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002884:	fffff097          	auipc	ra,0xfffff
    80002888:	ac4080e7          	jalr	-1340(ra) # 80001348 <_Z8mem_freePv>
}
    8000288c:	00813083          	ld	ra,8(sp)
    80002890:	00013403          	ld	s0,0(sp)
    80002894:	01010113          	addi	sp,sp,16
    80002898:	00008067          	ret

000000008000289c <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    8000289c:	fd010113          	addi	sp,sp,-48
    800028a0:	02113423          	sd	ra,40(sp)
    800028a4:	02813023          	sd	s0,32(sp)
    800028a8:	00913c23          	sd	s1,24(sp)
    800028ac:	01213823          	sd	s2,16(sp)
    800028b0:	01313423          	sd	s3,8(sp)
    800028b4:	03010413          	addi	s0,sp,48
    800028b8:	00050493          	mv	s1,a0
    800028bc:	00058913          	mv	s2,a1
    800028c0:	00060993          	mv	s3,a2
    800028c4:	0000a797          	auipc	a5,0xa
    800028c8:	15c78793          	addi	a5,a5,348 # 8000ca20 <_ZTV6Thread+0x10>
    800028cc:	00f53023          	sd	a5,0(a0)
    this->body = body;
    800028d0:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    800028d4:	00c53c23          	sd	a2,24(a0)
    if (body != nullptr) {
    800028d8:	04058663          	beqz	a1,80002924 <_ZN6ThreadC1EPFvPvES0_+0x88>
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800028dc:	00001537          	lui	a0,0x1
    800028e0:	fffff097          	auipc	ra,0xfffff
    800028e4:	a28080e7          	jalr	-1496(ra) # 80001308 <_Z9mem_allocm>
    800028e8:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028ec:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028f0:	00098693          	mv	a3,s3
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028f4:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800028f8:	00848493          	addi	s1,s1,8
    800028fc:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002900:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002904:	00000073          	ecall
}
    80002908:	02813083          	ld	ra,40(sp)
    8000290c:	02013403          	ld	s0,32(sp)
    80002910:	01813483          	ld	s1,24(sp)
    80002914:	01013903          	ld	s2,16(sp)
    80002918:	00813983          	ld	s3,8(sp)
    8000291c:	03010113          	addi	sp,sp,48
    80002920:	00008067          	ret
    uint64* stack = nullptr;
    80002924:	00000313          	li	t1,0
    80002928:	fc5ff06f          	j	800028ec <_ZN6ThreadC1EPFvPvES0_+0x50>

000000008000292c <_ZN6Thread5startEv>:
int Thread::start() {
    8000292c:	ff010113          	addi	sp,sp,-16
    80002930:	00813423          	sd	s0,8(sp)
    80002934:	01010413          	addi	s0,sp,16
    if (myHandle == nullptr) return -1;
    80002938:	00853303          	ld	t1,8(a0) # 1008 <_entry-0x7fffeff8>
    8000293c:	02030063          	beqz	t1,8000295c <_ZN6Thread5startEv+0x30>
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002940:	00030593          	mv	a1,t1
    __asm__ volatile("li a0, 0x81");
    80002944:	08100513          	li	a0,129
    __asm__ volatile("ecall");
    80002948:	00000073          	ecall
    return 0;
    8000294c:	00000513          	li	a0,0
}
    80002950:	00813403          	ld	s0,8(sp)
    80002954:	01010113          	addi	sp,sp,16
    80002958:	00008067          	ret
    if (myHandle == nullptr) return -1;
    8000295c:	fff00513          	li	a0,-1
    80002960:	ff1ff06f          	j	80002950 <_ZN6Thread5startEv+0x24>

0000000080002964 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002964:	ff010113          	addi	sp,sp,-16
    80002968:	00113423          	sd	ra,8(sp)
    8000296c:	00813023          	sd	s0,0(sp)
    80002970:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80002974:	00853503          	ld	a0,8(a0)
    80002978:	fffff097          	auipc	ra,0xfffff
    8000297c:	ad4080e7          	jalr	-1324(ra) # 8000144c <_Z11thread_joinP3TCB>
}
    80002980:	00813083          	ld	ra,8(sp)
    80002984:	00013403          	ld	s0,0(sp)
    80002988:	01010113          	addi	sp,sp,16
    8000298c:	00008067          	ret

0000000080002990 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002990:	ff010113          	addi	sp,sp,-16
    80002994:	00113423          	sd	ra,8(sp)
    80002998:	00813023          	sd	s0,0(sp)
    8000299c:	01010413          	addi	s0,sp,16
    thread_dispatch();
    800029a0:	fffff097          	auipc	ra,0xfffff
    800029a4:	a8c080e7          	jalr	-1396(ra) # 8000142c <_Z15thread_dispatchv>
}
    800029a8:	00813083          	ld	ra,8(sp)
    800029ac:	00013403          	ld	s0,0(sp)
    800029b0:	01010113          	addi	sp,sp,16
    800029b4:	00008067          	ret

00000000800029b8 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    800029b8:	ff010113          	addi	sp,sp,-16
    800029bc:	00113423          	sd	ra,8(sp)
    800029c0:	00813023          	sd	s0,0(sp)
    800029c4:	01010413          	addi	s0,sp,16
    time_sleep(t);
    800029c8:	fffff097          	auipc	ra,0xfffff
    800029cc:	aac080e7          	jalr	-1364(ra) # 80001474 <_Z10time_sleepm>
}
    800029d0:	00000513          	li	a0,0
    800029d4:	00813083          	ld	ra,8(sp)
    800029d8:	00013403          	ld	s0,0(sp)
    800029dc:	01010113          	addi	sp,sp,16
    800029e0:	00008067          	ret

00000000800029e4 <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    if (this->period < 0) this->period = 2;
}

void PeriodicThread::run() {
    800029e4:	fe010113          	addi	sp,sp,-32
    800029e8:	00113c23          	sd	ra,24(sp)
    800029ec:	00813823          	sd	s0,16(sp)
    800029f0:	00913423          	sd	s1,8(sp)
    800029f4:	02010413          	addi	s0,sp,32
    800029f8:	00050493          	mv	s1,a0
    while (period != -1UL) {
    800029fc:	0204b703          	ld	a4,32(s1)
    80002a00:	fff00793          	li	a5,-1
    80002a04:	02f70663          	beq	a4,a5,80002a30 <_ZN14PeriodicThread3runEv+0x4c>
        periodicActivation();
    80002a08:	0004b783          	ld	a5,0(s1)
    80002a0c:	0187b783          	ld	a5,24(a5)
    80002a10:	00048513          	mv	a0,s1
    80002a14:	000780e7          	jalr	a5
        if (period == -1UL) break;
    80002a18:	0204b503          	ld	a0,32(s1)
    80002a1c:	fff00793          	li	a5,-1
    80002a20:	00f50863          	beq	a0,a5,80002a30 <_ZN14PeriodicThread3runEv+0x4c>
        sleep(period);
    80002a24:	00000097          	auipc	ra,0x0
    80002a28:	f94080e7          	jalr	-108(ra) # 800029b8 <_ZN6Thread5sleepEm>
    while (period != -1UL) {
    80002a2c:	fd1ff06f          	j	800029fc <_ZN14PeriodicThread3runEv+0x18>
    }
    thread_exit();
    80002a30:	fffff097          	auipc	ra,0xfffff
    80002a34:	9d4080e7          	jalr	-1580(ra) # 80001404 <_Z11thread_exitv>
}
    80002a38:	01813083          	ld	ra,24(sp)
    80002a3c:	01013403          	ld	s0,16(sp)
    80002a40:	00813483          	ld	s1,8(sp)
    80002a44:	02010113          	addi	sp,sp,32
    80002a48:	00008067          	ret

0000000080002a4c <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002a4c:	fe010113          	addi	sp,sp,-32
    80002a50:	00113c23          	sd	ra,24(sp)
    80002a54:	00813823          	sd	s0,16(sp)
    80002a58:	00913423          	sd	s1,8(sp)
    80002a5c:	02010413          	addi	s0,sp,32
    80002a60:	00050493          	mv	s1,a0
    80002a64:	0000a797          	auipc	a5,0xa
    80002a68:	fbc78793          	addi	a5,a5,-68 # 8000ca20 <_ZTV6Thread+0x10>
    80002a6c:	00f53023          	sd	a5,0(a0)
    this->body = wrapper;
    80002a70:	00000797          	auipc	a5,0x0
    80002a74:	be878793          	addi	a5,a5,-1048 # 80002658 <_ZN6Thread7wrapperEPv>
    80002a78:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80002a7c:	00a53c23          	sd	a0,24(a0)
        stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    80002a80:	00001537          	lui	a0,0x1
    80002a84:	fffff097          	auipc	ra,0xfffff
    80002a88:	884080e7          	jalr	-1916(ra) # 80001308 <_Z9mem_allocm>
    80002a8c:	00050313          	mv	t1,a0
    __asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a90:	00030713          	mv	a4,t1
    __asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a94:	0184b303          	ld	t1,24(s1)
    80002a98:	00030693          	mv	a3,t1
            body):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002a9c:	0104b303          	ld	t1,16(s1)
    80002aa0:	00030613          	mv	a2,t1
    __asm__ volatile("mv a1, %[handle]": :[handle] "r"(&myHandle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80002aa4:	00848493          	addi	s1,s1,8
    80002aa8:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x80");
    80002aac:	08000513          	li	a0,128
    __asm__ volatile("ecall");
    80002ab0:	00000073          	ecall
}
    80002ab4:	01813083          	ld	ra,24(sp)
    80002ab8:	01013403          	ld	s0,16(sp)
    80002abc:	00813483          	ld	s1,8(sp)
    80002ac0:	02010113          	addi	sp,sp,32
    80002ac4:	00008067          	ret

0000000080002ac8 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002ac8:	ff010113          	addi	sp,sp,-16
    80002acc:	00113423          	sd	ra,8(sp)
    80002ad0:	00813023          	sd	s0,0(sp)
    80002ad4:	01010413          	addi	s0,sp,16
    80002ad8:	0000a797          	auipc	a5,0xa
    80002adc:	f7078793          	addi	a5,a5,-144 # 8000ca48 <_ZTV9Semaphore+0x10>
    80002ae0:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle, init);
    80002ae4:	00850513          	addi	a0,a0,8
    80002ae8:	fffff097          	auipc	ra,0xfffff
    80002aec:	9bc080e7          	jalr	-1604(ra) # 800014a4 <_Z8sem_openPP4KSemj>
}
    80002af0:	00813083          	ld	ra,8(sp)
    80002af4:	00013403          	ld	s0,0(sp)
    80002af8:	01010113          	addi	sp,sp,16
    80002afc:	00008067          	ret

0000000080002b00 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002b00:	ff010113          	addi	sp,sp,-16
    80002b04:	00113423          	sd	ra,8(sp)
    80002b08:	00813023          	sd	s0,0(sp)
    80002b0c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002b10:	00853503          	ld	a0,8(a0)
    80002b14:	fffff097          	auipc	ra,0xfffff
    80002b18:	9f8080e7          	jalr	-1544(ra) # 8000150c <_Z8sem_waitP4KSem>
}
    80002b1c:	00813083          	ld	ra,8(sp)
    80002b20:	00013403          	ld	s0,0(sp)
    80002b24:	01010113          	addi	sp,sp,16
    80002b28:	00008067          	ret

0000000080002b2c <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002b2c:	ff010113          	addi	sp,sp,-16
    80002b30:	00113423          	sd	ra,8(sp)
    80002b34:	00813023          	sd	s0,0(sp)
    80002b38:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80002b3c:	00853503          	ld	a0,8(a0)
    80002b40:	fffff097          	auipc	ra,0xfffff
    80002b44:	9fc080e7          	jalr	-1540(ra) # 8000153c <_Z10sem_signalP4KSem>
}
    80002b48:	00813083          	ld	ra,8(sp)
    80002b4c:	00013403          	ld	s0,0(sp)
    80002b50:	01010113          	addi	sp,sp,16
    80002b54:	00008067          	ret

0000000080002b58 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002b58:	ff010113          	addi	sp,sp,-16
    80002b5c:	00813423          	sd	s0,8(sp)
    80002b60:	01010413          	addi	s0,sp,16
    this->period = -1;
    80002b64:	fff00793          	li	a5,-1
    80002b68:	02f53023          	sd	a5,32(a0)
}
    80002b6c:	00813403          	ld	s0,8(sp)
    80002b70:	01010113          	addi	sp,sp,16
    80002b74:	00008067          	ret

0000000080002b78 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(), period(period) {
    80002b78:	fe010113          	addi	sp,sp,-32
    80002b7c:	00113c23          	sd	ra,24(sp)
    80002b80:	00813823          	sd	s0,16(sp)
    80002b84:	00913423          	sd	s1,8(sp)
    80002b88:	01213023          	sd	s2,0(sp)
    80002b8c:	02010413          	addi	s0,sp,32
    80002b90:	00050493          	mv	s1,a0
    80002b94:	00058913          	mv	s2,a1
    80002b98:	00000097          	auipc	ra,0x0
    80002b9c:	eb4080e7          	jalr	-332(ra) # 80002a4c <_ZN6ThreadC1Ev>
    80002ba0:	0000a797          	auipc	a5,0xa
    80002ba4:	ec878793          	addi	a5,a5,-312 # 8000ca68 <_ZTV14PeriodicThread+0x10>
    80002ba8:	00f4b023          	sd	a5,0(s1)
    80002bac:	0324b023          	sd	s2,32(s1)
}
    80002bb0:	01813083          	ld	ra,24(sp)
    80002bb4:	01013403          	ld	s0,16(sp)
    80002bb8:	00813483          	ld	s1,8(sp)
    80002bbc:	00013903          	ld	s2,0(sp)
    80002bc0:	02010113          	addi	sp,sp,32
    80002bc4:	00008067          	ret

0000000080002bc8 <_ZN7Console4getcEv>:

char Console::getc() {
    80002bc8:	ff010113          	addi	sp,sp,-16
    80002bcc:	00113423          	sd	ra,8(sp)
    80002bd0:	00813023          	sd	s0,0(sp)
    80002bd4:	01010413          	addi	s0,sp,16
    return ::getc();
    80002bd8:	fffff097          	auipc	ra,0xfffff
    80002bdc:	994080e7          	jalr	-1644(ra) # 8000156c <_Z4getcv>
}
    80002be0:	00813083          	ld	ra,8(sp)
    80002be4:	00013403          	ld	s0,0(sp)
    80002be8:	01010113          	addi	sp,sp,16
    80002bec:	00008067          	ret

0000000080002bf0 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002bf0:	ff010113          	addi	sp,sp,-16
    80002bf4:	00113423          	sd	ra,8(sp)
    80002bf8:	00813023          	sd	s0,0(sp)
    80002bfc:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002c00:	fffff097          	auipc	ra,0xfffff
    80002c04:	994080e7          	jalr	-1644(ra) # 80001594 <_Z4putcc>
}
    80002c08:	00813083          	ld	ra,8(sp)
    80002c0c:	00013403          	ld	s0,0(sp)
    80002c10:	01010113          	addi	sp,sp,16
    80002c14:	00008067          	ret

0000000080002c18 <_ZN6Thread3runEv>:
protected:
    //konstruktor koji pravi nit koja izvrsava run metodu, ne stavlja je u Scheduler
    Thread();

    //funkcija koju nit izvrsava, samo ako je nit napravljena podrazumevanim konstruktorom
    virtual void run() {}
    80002c18:	ff010113          	addi	sp,sp,-16
    80002c1c:	00813423          	sd	s0,8(sp)
    80002c20:	01010413          	addi	s0,sp,16
    80002c24:	00813403          	ld	s0,8(sp)
    80002c28:	01010113          	addi	sp,sp,16
    80002c2c:	00008067          	ret

0000000080002c30 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    80002c30:	ff010113          	addi	sp,sp,-16
    80002c34:	00813423          	sd	s0,8(sp)
    80002c38:	01010413          	addi	s0,sp,16
    80002c3c:	00813403          	ld	s0,8(sp)
    80002c40:	01010113          	addi	sp,sp,16
    80002c44:	00008067          	ret

0000000080002c48 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002c48:	ff010113          	addi	sp,sp,-16
    80002c4c:	00113423          	sd	ra,8(sp)
    80002c50:	00813023          	sd	s0,0(sp)
    80002c54:	01010413          	addi	s0,sp,16
    80002c58:	0000a797          	auipc	a5,0xa
    80002c5c:	e1078793          	addi	a5,a5,-496 # 8000ca68 <_ZTV14PeriodicThread+0x10>
    80002c60:	00f53023          	sd	a5,0(a0)
    80002c64:	00000097          	auipc	ra,0x0
    80002c68:	a28080e7          	jalr	-1496(ra) # 8000268c <_ZN6ThreadD1Ev>
    80002c6c:	00813083          	ld	ra,8(sp)
    80002c70:	00013403          	ld	s0,0(sp)
    80002c74:	01010113          	addi	sp,sp,16
    80002c78:	00008067          	ret

0000000080002c7c <_ZN14PeriodicThreadD0Ev>:
    80002c7c:	fe010113          	addi	sp,sp,-32
    80002c80:	00113c23          	sd	ra,24(sp)
    80002c84:	00813823          	sd	s0,16(sp)
    80002c88:	00913423          	sd	s1,8(sp)
    80002c8c:	02010413          	addi	s0,sp,32
    80002c90:	00050493          	mv	s1,a0
    80002c94:	0000a797          	auipc	a5,0xa
    80002c98:	dd478793          	addi	a5,a5,-556 # 8000ca68 <_ZTV14PeriodicThread+0x10>
    80002c9c:	00f53023          	sd	a5,0(a0)
    80002ca0:	00000097          	auipc	ra,0x0
    80002ca4:	9ec080e7          	jalr	-1556(ra) # 8000268c <_ZN6ThreadD1Ev>
    80002ca8:	00048513          	mv	a0,s1
    80002cac:	00000097          	auipc	ra,0x0
    80002cb0:	b20080e7          	jalr	-1248(ra) # 800027cc <_ZdlPv>
    80002cb4:	01813083          	ld	ra,24(sp)
    80002cb8:	01013403          	ld	s0,16(sp)
    80002cbc:	00813483          	ld	s1,8(sp)
    80002cc0:	02010113          	addi	sp,sp,32
    80002cc4:	00008067          	ret

0000000080002cc8 <_ZN3TCB7wrapperEv>:
    }

    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
}

void TCB::wrapper() {
    80002cc8:	ff010113          	addi	sp,sp,-16
    80002ccc:	00113423          	sd	ra,8(sp)
    80002cd0:	00813023          	sd	s0,0(sp)
    80002cd4:	01010413          	addi	s0,sp,16
    //pocetak wrappera se izvrsava u supervisor modu,
    //jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch)
    Riscv::returnFromInterrupt();
    80002cd8:	00000097          	auipc	ra,0x0
    80002cdc:	2b8080e7          	jalr	696(ra) # 80002f90 <_ZN5Riscv19returnFromInterruptEv>
    //na dalje se izvrsavamo u user modu (osim za kernel funkcije)
    running->threadFunction(running->args);
    80002ce0:	0000a797          	auipc	a5,0xa
    80002ce4:	1587b783          	ld	a5,344(a5) # 8000ce38 <_ZN3TCB7runningE>
    80002ce8:	0107b703          	ld	a4,16(a5)
    80002cec:	0207b503          	ld	a0,32(a5)
    80002cf0:	000700e7          	jalr	a4
    //i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
    thread_exit();
    80002cf4:	ffffe097          	auipc	ra,0xffffe
    80002cf8:	710080e7          	jalr	1808(ra) # 80001404 <_Z11thread_exitv>
}
    80002cfc:	00813083          	ld	ra,8(sp)
    80002d00:	00013403          	ld	s0,0(sp)
    80002d04:	01010113          	addi	sp,sp,16
    80002d08:	00008067          	ret

0000000080002d0c <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002d0c:	fe010113          	addi	sp,sp,-32
    80002d10:	00113c23          	sd	ra,24(sp)
    80002d14:	00813823          	sd	s0,16(sp)
    80002d18:	00913423          	sd	s1,8(sp)
    80002d1c:	02010413          	addi	s0,sp,32
    TCB* old = TCB::running;
    80002d20:	0000a497          	auipc	s1,0xa
    80002d24:	1184b483          	ld	s1,280(s1) # 8000ce38 <_ZN3TCB7runningE>
    if (old->status == ACTIVE) {
    80002d28:	0584a703          	lw	a4,88(s1)
    80002d2c:	00100793          	li	a5,1
    80002d30:	04f70663          	beq	a4,a5,80002d7c <_ZN3TCB8dispatchEv+0x70>
    TCB::running = Scheduler::get();
    80002d34:	fffff097          	auipc	ra,0xfffff
    80002d38:	d6c080e7          	jalr	-660(ra) # 80001aa0 <_ZN9Scheduler3getEv>
    80002d3c:	00050593          	mv	a1,a0
    80002d40:	0000a797          	auipc	a5,0xa
    80002d44:	0f878793          	addi	a5,a5,248 # 8000ce38 <_ZN3TCB7runningE>
    80002d48:	00a7b023          	sd	a0,0(a5)
    TCB::runningTimeSlice = 0;
    80002d4c:	0007b423          	sd	zero,8(a5)
    if (TCB::running->threadFunction == nullptr || TCB::running->threadFunction == kernelConsumerFunction ||
    80002d50:	01053783          	ld	a5,16(a0)
    80002d54:	02078c63          	beqz	a5,80002d8c <_ZN3TCB8dispatchEv+0x80>
    80002d58:	0000a717          	auipc	a4,0xa
    80002d5c:	f4873703          	ld	a4,-184(a4) # 8000cca0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002d60:	02e78663          	beq	a5,a4,80002d8c <_ZN3TCB8dispatchEv+0x80>
    80002d64:	0000a717          	auipc	a4,0xa
    80002d68:	f7c73703          	ld	a4,-132(a4) # 8000cce0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80002d6c:	02e78063          	beq	a5,a4,80002d8c <_ZN3TCB8dispatchEv+0x80>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002d70:	10000793          	li	a5,256
    80002d74:	1007b073          	csrc	sstatus,a5
}
    80002d78:	01c0006f          	j	80002d94 <_ZN3TCB8dispatchEv+0x88>
        Scheduler::put(old);
    80002d7c:	00048513          	mv	a0,s1
    80002d80:	fffff097          	auipc	ra,0xfffff
    80002d84:	cd4080e7          	jalr	-812(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
    80002d88:	fadff06f          	j	80002d34 <_ZN3TCB8dispatchEv+0x28>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80002d8c:	10000793          	li	a5,256
    80002d90:	1007a073          	csrs	sstatus,a5
    if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002d94:	00b48863          	beq	s1,a1,80002da4 <_ZN3TCB8dispatchEv+0x98>
    80002d98:	00048513          	mv	a0,s1
    80002d9c:	ffffe097          	auipc	ra,0xffffe
    80002da0:	374080e7          	jalr	884(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002da4:	01813083          	ld	ra,24(sp)
    80002da8:	01013403          	ld	s0,16(sp)
    80002dac:	00813483          	ld	s1,8(sp)
    80002db0:	02010113          	addi	sp,sp,32
    80002db4:	00008067          	ret

0000000080002db8 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002db8:	ff010113          	addi	sp,sp,-16
    80002dbc:	00113423          	sd	ra,8(sp)
    80002dc0:	00813023          	sd	s0,0(sp)
    80002dc4:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002dc8:	ffffe097          	auipc	ra,0xffffe
    80002dcc:	540080e7          	jalr	1344(ra) # 80001308 <_Z9mem_allocm>
}
    80002dd0:	00813083          	ld	ra,8(sp)
    80002dd4:	00013403          	ld	s0,0(sp)
    80002dd8:	01010113          	addi	sp,sp,16
    80002ddc:	00008067          	ret

0000000080002de0 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002de0:	fd010113          	addi	sp,sp,-48
    80002de4:	02113423          	sd	ra,40(sp)
    80002de8:	02813023          	sd	s0,32(sp)
    80002dec:	00913c23          	sd	s1,24(sp)
    80002df0:	01213823          	sd	s2,16(sp)
    80002df4:	01313423          	sd	s3,8(sp)
    80002df8:	03010413          	addi	s0,sp,48
    80002dfc:	00050913          	mv	s2,a0
    80002e00:	00058993          	mv	s3,a1
    80002e04:	00060493          	mv	s1,a2
    TCB* newThread = new TCB(function, args, stack);
    80002e08:	06000513          	li	a0,96
    80002e0c:	00000097          	auipc	ra,0x0
    80002e10:	fac080e7          	jalr	-84(ra) # 80002db8 <_ZN3TCBnwEm>

private:
    TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
                                                    timeSlice(DEFAULT_TIME_SLICE), nextInScheduler(nullptr),
                                                    timeToSleep(0),
                                                    nextSleeping(nullptr), status(CREATED) {
    80002e14:	01253823          	sd	s2,16(a0)
    80002e18:	00953c23          	sd	s1,24(a0)
    80002e1c:	03353023          	sd	s3,32(a0)
    80002e20:	00200793          	li	a5,2
    80002e24:	02f53423          	sd	a5,40(a0)
    80002e28:	02053823          	sd	zero,48(a0)
    80002e2c:	02053c23          	sd	zero,56(a0)
    80002e30:	04053023          	sd	zero,64(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80002e34:	04053423          	sd	zero,72(a0)
    80002e38:	04053823          	sd	zero,80(a0)
    80002e3c:	04052c23          	sw	zero,88(a0)
        //formiranje pocetnog konteksta;
        //specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
        uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002e40:	02090e63          	beqz	s2,80002e7c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x9c>
    80002e44:	00000797          	auipc	a5,0x0
    80002e48:	e8478793          	addi	a5,a5,-380 # 80002cc8 <_ZN3TCB7wrapperEv>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002e4c:	02048c63          	beqz	s1,80002e84 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa4>
    80002e50:	00001637          	lui	a2,0x1
    80002e54:	00c484b3          	add	s1,s1,a2
        this->context.ra = startRa;
    80002e58:	00f53023          	sd	a5,0(a0)
        this->context.sp = startSp;
    80002e5c:	00953423          	sd	s1,8(a0)
}
    80002e60:	02813083          	ld	ra,40(sp)
    80002e64:	02013403          	ld	s0,32(sp)
    80002e68:	01813483          	ld	s1,24(sp)
    80002e6c:	01013903          	ld	s2,16(sp)
    80002e70:	00813983          	ld	s3,8(sp)
    80002e74:	03010113          	addi	sp,sp,48
    80002e78:	00008067          	ret
        uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002e7c:	00000793          	li	a5,0
    80002e80:	fcdff06f          	j	80002e4c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x6c>
        uint64 startSp = stack != nullptr ? (uint64)((char*)stack + DEFAULT_STACK_SIZE) : 0;
    80002e84:	00000493          	li	s1,0
    80002e88:	fd1ff06f          	j	80002e58 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x78>

0000000080002e8c <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002e8c:	ff010113          	addi	sp,sp,-16
    80002e90:	00113423          	sd	ra,8(sp)
    80002e94:	00813023          	sd	s0,0(sp)
    80002e98:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002e9c:	ffffe097          	auipc	ra,0xffffe
    80002ea0:	4ac080e7          	jalr	1196(ra) # 80001348 <_Z8mem_freePv>
}
    80002ea4:	00813083          	ld	ra,8(sp)
    80002ea8:	00013403          	ld	s0,0(sp)
    80002eac:	01010113          	addi	sp,sp,16
    80002eb0:	00008067          	ret

0000000080002eb4 <_ZN3TCB10threadJoinEPS_>:

void TCB::threadJoin(TCB* handle) {
    if (handle->status == FINISHED || TCB::running == handle) return;
    80002eb4:	05852703          	lw	a4,88(a0)
    80002eb8:	00500793          	li	a5,5
    80002ebc:	04f70263          	beq	a4,a5,80002f00 <_ZN3TCB10threadJoinEPS_+0x4c>
    80002ec0:	0000a597          	auipc	a1,0xa
    80002ec4:	f785b583          	ld	a1,-136(a1) # 8000ce38 <_ZN3TCB7runningE>
    80002ec8:	02a58c63          	beq	a1,a0,80002f00 <_ZN3TCB10threadJoinEPS_+0x4c>
void TCB::threadJoin(TCB* handle) {
    80002ecc:	ff010113          	addi	sp,sp,-16
    80002ed0:	00113423          	sd	ra,8(sp)
    80002ed4:	00813023          	sd	s0,0(sp)
    80002ed8:	01010413          	addi	s0,sp,16
    TCB::running->status = JOINING;
    80002edc:	00300793          	li	a5,3
    80002ee0:	04f5ac23          	sw	a5,88(a1)
    handle->waitingToJoin.putLast(TCB::running);
    80002ee4:	04850513          	addi	a0,a0,72
    80002ee8:	ffffe097          	auipc	ra,0xffffe
    80002eec:	354080e7          	jalr	852(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
}
    80002ef0:	00813083          	ld	ra,8(sp)
    80002ef4:	00013403          	ld	s0,0(sp)
    80002ef8:	01010113          	addi	sp,sp,16
    80002efc:	00008067          	ret
    80002f00:	00008067          	ret

0000000080002f04 <_ZN3TCB13releaseJoinedEv>:

void TCB::releaseJoined() {
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80002f04:	0000a517          	auipc	a0,0xa
    80002f08:	f3453503          	ld	a0,-204(a0) # 8000ce38 <_ZN3TCB7runningE>
        return front == nullptr;
    80002f0c:	04853783          	ld	a5,72(a0)
    80002f10:	04078463          	beqz	a5,80002f58 <_ZN3TCB13releaseJoinedEv+0x54>
void TCB::releaseJoined() {
    80002f14:	ff010113          	addi	sp,sp,-16
    80002f18:	00113423          	sd	ra,8(sp)
    80002f1c:	00813023          	sd	s0,0(sp)
    80002f20:	01010413          	addi	s0,sp,16
        TCB* tcb = TCB::running->waitingToJoin.getFirst();
    80002f24:	04850513          	addi	a0,a0,72
    80002f28:	ffffe097          	auipc	ra,0xffffe
    80002f2c:	380080e7          	jalr	896(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
        Scheduler::put(tcb);
    80002f30:	fffff097          	auipc	ra,0xfffff
    80002f34:	b24080e7          	jalr	-1244(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
    while (!TCB::running->waitingToJoin.isEmpty()) {
    80002f38:	0000a517          	auipc	a0,0xa
    80002f3c:	f0053503          	ld	a0,-256(a0) # 8000ce38 <_ZN3TCB7runningE>
    80002f40:	04853783          	ld	a5,72(a0)
    80002f44:	fe0790e3          	bnez	a5,80002f24 <_ZN3TCB13releaseJoinedEv+0x20>
    }
}
    80002f48:	00813083          	ld	ra,8(sp)
    80002f4c:	00013403          	ld	s0,0(sp)
    80002f50:	01010113          	addi	sp,sp,16
    80002f54:	00008067          	ret
    80002f58:	00008067          	ret

0000000080002f5c <_ZN3TCB5startEPS_>:

void TCB::start(TCB* newTcb) {
    //startovanje niti(stavljanje u Scheduler); main nit je vec aktivna, ne stavlja se u Scheduler
    if (newTcb->threadFunction != nullptr) {
    80002f5c:	01053783          	ld	a5,16(a0)
    80002f60:	02078663          	beqz	a5,80002f8c <_ZN3TCB5startEPS_+0x30>
void TCB::start(TCB* newTcb) {
    80002f64:	ff010113          	addi	sp,sp,-16
    80002f68:	00113423          	sd	ra,8(sp)
    80002f6c:	00813023          	sd	s0,0(sp)
    80002f70:	01010413          	addi	s0,sp,16
        Scheduler::put(newTcb);
    80002f74:	fffff097          	auipc	ra,0xfffff
    80002f78:	ae0080e7          	jalr	-1312(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
    }
}
    80002f7c:	00813083          	ld	ra,8(sp)
    80002f80:	00013403          	ld	s0,0(sp)
    80002f84:	01010113          	addi	sp,sp,16
    80002f88:	00008067          	ret
    80002f8c:	00008067          	ret

0000000080002f90 <_ZN5Riscv19returnFromInterruptEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::returnFromInterrupt() {
    80002f90:	ff010113          	addi	sp,sp,-16
    80002f94:	00813423          	sd	s0,8(sp)
    80002f98:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002f9c:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80002fa0:	10200073          	sret
    80002fa4:	00813403          	ld	s0,8(sp)
    80002fa8:	01010113          	addi	sp,sp,16
    80002fac:	00008067          	ret

0000000080002fb0 <_ZN4KSemnwEm>:

#include "../h/KSem.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void* KSem::operator new(size_t size) {
    80002fb0:	ff010113          	addi	sp,sp,-16
    80002fb4:	00113423          	sd	ra,8(sp)
    80002fb8:	00813023          	sd	s0,0(sp)
    80002fbc:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002fc0:	ffffe097          	auipc	ra,0xffffe
    80002fc4:	348080e7          	jalr	840(ra) # 80001308 <_Z9mem_allocm>
}
    80002fc8:	00813083          	ld	ra,8(sp)
    80002fcc:	00013403          	ld	s0,0(sp)
    80002fd0:	01010113          	addi	sp,sp,16
    80002fd4:	00008067          	ret

0000000080002fd8 <_ZN4KSemdlEPv>:

void KSem::operator delete(void* ptr) {
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

0000000080003000 <_ZN4KSem7initSemEj>:

KSem* KSem::initSem(uint val) {
    80003000:	fe010113          	addi	sp,sp,-32
    80003004:	00113c23          	sd	ra,24(sp)
    80003008:	00813823          	sd	s0,16(sp)
    8000300c:	00913423          	sd	s1,8(sp)
    80003010:	02010413          	addi	s0,sp,32
    80003014:	00050493          	mv	s1,a0
	return new KSem(val);
    80003018:	02000513          	li	a0,32
    8000301c:	00000097          	auipc	ra,0x0
    80003020:	f94080e7          	jalr	-108(ra) # 80002fb0 <_ZN4KSemnwEm>
	void block();

	void unblock();

private:
	KSem(uint val) : val(val), working(true) {}
    80003024:	00952023          	sw	s1,0(a0)
    ThreadQueue() : front(nullptr), back(nullptr) {}
    80003028:	00053423          	sd	zero,8(a0)
    8000302c:	00053823          	sd	zero,16(a0)
    80003030:	00100713          	li	a4,1
    80003034:	00e50c23          	sb	a4,24(a0)
}
    80003038:	01813083          	ld	ra,24(sp)
    8000303c:	01013403          	ld	s0,16(sp)
    80003040:	00813483          	ld	s1,8(sp)
    80003044:	02010113          	addi	sp,sp,32
    80003048:	00008067          	ret

000000008000304c <_ZN4KSem5blockEv>:
		unblock();
	}
	return 0;
}

void KSem::block() {
    8000304c:	ff010113          	addi	sp,sp,-16
    80003050:	00113423          	sd	ra,8(sp)
    80003054:	00813023          	sd	s0,0(sp)
    80003058:	01010413          	addi	s0,sp,16
    static TCB* getRunning() { return running; }
    8000305c:	0000a797          	auipc	a5,0xa
    80003060:	c6c7b783          	ld	a5,-916(a5) # 8000ccc8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003064:	0007b583          	ld	a1,0(a5)
    void setStatus(ThreadStatus stat) { this->status = stat; }
    80003068:	00200793          	li	a5,2
    8000306c:	04f5ac23          	sw	a5,88(a1)
    TCB::getRunning()->setStatus(TCB::BLOCKED);
	blocked.putLast(TCB::getRunning());
    80003070:	00850513          	addi	a0,a0,8
    80003074:	ffffe097          	auipc	ra,0xffffe
    80003078:	1c8080e7          	jalr	456(ra) # 8000123c <_ZN11ThreadQueue7putLastEP3TCB>
	TCB::dispatch();
    8000307c:	00000097          	auipc	ra,0x0
    80003080:	c90080e7          	jalr	-880(ra) # 80002d0c <_ZN3TCB8dispatchEv>
}
    80003084:	00813083          	ld	ra,8(sp)
    80003088:	00013403          	ld	s0,0(sp)
    8000308c:	01010113          	addi	sp,sp,16
    80003090:	00008067          	ret

0000000080003094 <_ZN4KSem4waitEv>:
	if (!working) return -3;
    80003094:	01854783          	lbu	a5,24(a0)
    80003098:	04078663          	beqz	a5,800030e4 <_ZN4KSem4waitEv+0x50>
	if (--val < 0) {
    8000309c:	00052783          	lw	a5,0(a0)
    800030a0:	fff7879b          	addiw	a5,a5,-1
    800030a4:	00f52023          	sw	a5,0(a0)
    800030a8:	02079713          	slli	a4,a5,0x20
    800030ac:	00074663          	bltz	a4,800030b8 <_ZN4KSem4waitEv+0x24>
	return 0;
    800030b0:	00000513          	li	a0,0
}
    800030b4:	00008067          	ret
int KSem::wait() {
    800030b8:	ff010113          	addi	sp,sp,-16
    800030bc:	00113423          	sd	ra,8(sp)
    800030c0:	00813023          	sd	s0,0(sp)
    800030c4:	01010413          	addi	s0,sp,16
		block();
    800030c8:	00000097          	auipc	ra,0x0
    800030cc:	f84080e7          	jalr	-124(ra) # 8000304c <_ZN4KSem5blockEv>
		return -1;
    800030d0:	fff00513          	li	a0,-1
}
    800030d4:	00813083          	ld	ra,8(sp)
    800030d8:	00013403          	ld	s0,0(sp)
    800030dc:	01010113          	addi	sp,sp,16
    800030e0:	00008067          	ret
	if (!working) return -3;
    800030e4:	ffd00513          	li	a0,-3
    800030e8:	00008067          	ret

00000000800030ec <_ZN4KSem7unblockEv>:

void KSem::unblock() {
    800030ec:	ff010113          	addi	sp,sp,-16
    800030f0:	00113423          	sd	ra,8(sp)
    800030f4:	00813023          	sd	s0,0(sp)
    800030f8:	01010413          	addi	s0,sp,16
	TCB* tcb = blocked.getFirst();
    800030fc:	00850513          	addi	a0,a0,8
    80003100:	ffffe097          	auipc	ra,0xffffe
    80003104:	1a8080e7          	jalr	424(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
	Scheduler::put(tcb);
    80003108:	fffff097          	auipc	ra,0xfffff
    8000310c:	94c080e7          	jalr	-1716(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
}
    80003110:	00813083          	ld	ra,8(sp)
    80003114:	00013403          	ld	s0,0(sp)
    80003118:	01010113          	addi	sp,sp,16
    8000311c:	00008067          	ret

0000000080003120 <_ZN4KSem6signalEv>:
	if (!working) return -3;
    80003120:	01854783          	lbu	a5,24(a0)
    80003124:	04078463          	beqz	a5,8000316c <_ZN4KSem6signalEv+0x4c>
	if (val++ < 0) {
    80003128:	00052783          	lw	a5,0(a0)
    8000312c:	0017871b          	addiw	a4,a5,1
    80003130:	00e52023          	sw	a4,0(a0)
    80003134:	0007c663          	bltz	a5,80003140 <_ZN4KSem6signalEv+0x20>
	return 0;
    80003138:	00000513          	li	a0,0
}
    8000313c:	00008067          	ret
int KSem::signal() {
    80003140:	ff010113          	addi	sp,sp,-16
    80003144:	00113423          	sd	ra,8(sp)
    80003148:	00813023          	sd	s0,0(sp)
    8000314c:	01010413          	addi	s0,sp,16
		unblock();
    80003150:	00000097          	auipc	ra,0x0
    80003154:	f9c080e7          	jalr	-100(ra) # 800030ec <_ZN4KSem7unblockEv>
	return 0;
    80003158:	00000513          	li	a0,0
}
    8000315c:	00813083          	ld	ra,8(sp)
    80003160:	00013403          	ld	s0,0(sp)
    80003164:	01010113          	addi	sp,sp,16
    80003168:	00008067          	ret
	if (!working) return -3;
    8000316c:	ffd00513          	li	a0,-3
    80003170:	00008067          	ret

0000000080003174 <_ZN4KSem8closeSemEPS_>:

int KSem::closeSem(sem_t handle) {
    80003174:	fe010113          	addi	sp,sp,-32
    80003178:	00113c23          	sd	ra,24(sp)
    8000317c:	00813823          	sd	s0,16(sp)
    80003180:	00913423          	sd	s1,8(sp)
    80003184:	02010413          	addi	s0,sp,32
    80003188:	00050493          	mv	s1,a0
	handle->working = false;
    8000318c:	00050c23          	sb	zero,24(a0)
        return front == nullptr;
    80003190:	0084b783          	ld	a5,8(s1)
	while (!handle->blocked.isEmpty()) {
    80003194:	00078e63          	beqz	a5,800031b0 <_ZN4KSem8closeSemEPS_+0x3c>
		TCB* tcb = handle->blocked.getFirst();
    80003198:	00848513          	addi	a0,s1,8
    8000319c:	ffffe097          	auipc	ra,0xffffe
    800031a0:	10c080e7          	jalr	268(ra) # 800012a8 <_ZN11ThreadQueue8getFirstEv>
		Scheduler::put(tcb);
    800031a4:	fffff097          	auipc	ra,0xfffff
    800031a8:	8b0080e7          	jalr	-1872(ra) # 80001a54 <_ZN9Scheduler3putEP3TCB>
	while (!handle->blocked.isEmpty()) {
    800031ac:	fe5ff06f          	j	80003190 <_ZN4KSem8closeSemEPS_+0x1c>
	}
	return 0;
}
    800031b0:	00000513          	li	a0,0
    800031b4:	01813083          	ld	ra,24(sp)
    800031b8:	01013403          	ld	s0,16(sp)
    800031bc:	00813483          	ld	s1,8(sp)
    800031c0:	02010113          	addi	sp,sp,32
    800031c4:	00008067          	ret

00000000800031c8 <_Z10testMemoryv>:
    return pok;
}

#pragma GCC optimize("O0")

void testMemory() {
    800031c8:	e6010113          	addi	sp,sp,-416
    800031cc:	18113c23          	sd	ra,408(sp)
    800031d0:	18813823          	sd	s0,400(sp)
    800031d4:	1a010413          	addi	s0,sp,416
    char* pokazivaci[50];
    pokazivaci[0] = nullptr;
    800031d8:	e6043023          	sd	zero,-416(s0)
    pokazivaci[0] = upisi(1024 + 768);
    800031dc:	70000513          	li	a0,1792
    800031e0:	00000097          	auipc	ra,0x0
    800031e4:	3c0080e7          	jalr	960(ra) # 800035a0 <_Z5upisim>
    800031e8:	00050793          	mv	a5,a0
    800031ec:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    800031f0:	e6043783          	ld	a5,-416(s0)
    800031f4:	02078c63          	beqz	a5,8000322c <_Z10testMemoryv+0x64>
        if (pokazivaci[0][0] == '8') {
    800031f8:	e6043783          	ld	a5,-416(s0)
    800031fc:	0007c783          	lbu	a5,0(a5)
    80003200:	00078713          	mv	a4,a5
    80003204:	03800793          	li	a5,56
    80003208:	00f71a63          	bne	a4,a5,8000321c <_Z10testMemoryv+0x54>
            printString("nea");
    8000320c:	00007517          	auipc	a0,0x7
    80003210:	ff450513          	addi	a0,a0,-12 # 8000a200 <_ZZ9kPrintIntmE6digits+0x190>
    80003214:	00003097          	auipc	ra,0x3
    80003218:	9cc080e7          	jalr	-1588(ra) # 80005be0 <_Z11printStringPKc>
        }
        MemoryAllocator::kfree(pokazivaci[0]);
    8000321c:	e6043783          	ld	a5,-416(s0)
    80003220:	00078513          	mv	a0,a5
    80003224:	00004097          	auipc	ra,0x4
    80003228:	e44080e7          	jalr	-444(ra) # 80007068 <_ZN15MemoryAllocator5kfreeEPv>
    }


    pokazivaci[0] = upisi(4096);
    8000322c:	00001537          	lui	a0,0x1
    80003230:	00000097          	auipc	ra,0x0
    80003234:	370080e7          	jalr	880(ra) # 800035a0 <_Z5upisim>
    80003238:	00050793          	mv	a5,a0
    8000323c:	e6f43023          	sd	a5,-416(s0)
    if (pokazivaci[0]) {
    80003240:	e6043783          	ld	a5,-416(s0)
    80003244:	00078a63          	beqz	a5,80003258 <_Z10testMemoryv+0x90>
        MemoryAllocator::kfree(pokazivaci[0]);
    80003248:	e6043783          	ld	a5,-416(s0)
    8000324c:	00078513          	mv	a0,a5
    80003250:	00004097          	auipc	ra,0x4
    80003254:	e18080e7          	jalr	-488(ra) # 80007068 <_ZN15MemoryAllocator5kfreeEPv>
    }

    pokazivaci[0] = upisi(1024 + 768);
    80003258:	70000513          	li	a0,1792
    8000325c:	00000097          	auipc	ra,0x0
    80003260:	344080e7          	jalr	836(ra) # 800035a0 <_Z5upisim>
    80003264:	00050793          	mv	a5,a0
    80003268:	e6f43023          	sd	a5,-416(s0)
    MemoryAllocator::kfree(pokazivaci[0]);
    8000326c:	e6043783          	ld	a5,-416(s0)
    80003270:	00078513          	mv	a0,a5
    80003274:	00004097          	auipc	ra,0x4
    80003278:	df4080e7          	jalr	-524(ra) # 80007068 <_ZN15MemoryAllocator5kfreeEPv>

}
    8000327c:	00000013          	nop
    80003280:	19813083          	ld	ra,408(sp)
    80003284:	19013403          	ld	s0,400(sp)
    80003288:	1a010113          	addi	sp,sp,416
    8000328c:	00008067          	ret

0000000080003290 <_Z5nit1fPv>:

void nit1f(void*) {
    80003290:	fe010113          	addi	sp,sp,-32
    80003294:	00113c23          	sd	ra,24(sp)
    80003298:	00813823          	sd	s0,16(sp)
    8000329c:	02010413          	addi	s0,sp,32
    800032a0:	fea43423          	sd	a0,-24(s0)
//		printString("\nsem_wait za nit 1 vratio ");
//		printInteger(res);
//		printString("\n");
//	}

    printString("\nGotova nit 1\n");
    800032a4:	00007517          	auipc	a0,0x7
    800032a8:	f6450513          	addi	a0,a0,-156 # 8000a208 <_ZZ9kPrintIntmE6digits+0x198>
    800032ac:	00003097          	auipc	ra,0x3
    800032b0:	934080e7          	jalr	-1740(ra) # 80005be0 <_Z11printStringPKc>
}
    800032b4:	00000013          	nop
    800032b8:	01813083          	ld	ra,24(sp)
    800032bc:	01013403          	ld	s0,16(sp)
    800032c0:	02010113          	addi	sp,sp,32
    800032c4:	00008067          	ret

00000000800032c8 <_Z5nit2fPv>:
    per(time_t period): PeriodicThread(period){}
    void periodicActivation() override{
        printString("Janko\n");
    }
};
void nit2f(void* arg2) {
    800032c8:	fc010113          	addi	sp,sp,-64
    800032cc:	02113c23          	sd	ra,56(sp)
    800032d0:	02813823          	sd	s0,48(sp)
    800032d4:	02913423          	sd	s1,40(sp)
    800032d8:	03213023          	sd	s2,32(sp)
    800032dc:	04010413          	addi	s0,sp,64
    800032e0:	fca43423          	sd	a0,-56(s0)
    PeriodicThread* pt = new per(10);
    800032e4:	02800513          	li	a0,40
    800032e8:	fffff097          	auipc	ra,0xfffff
    800032ec:	494080e7          	jalr	1172(ra) # 8000277c <_Znwm>
    800032f0:	00050793          	mv	a5,a0
    800032f4:	00078493          	mv	s1,a5
    800032f8:	00a00593          	li	a1,10
    800032fc:	00048513          	mv	a0,s1
    80003300:	00000097          	auipc	ra,0x0
    80003304:	2fc080e7          	jalr	764(ra) # 800035fc <_ZN3perC1Em>
    80003308:	fc943c23          	sd	s1,-40(s0)
    pt->start();
    8000330c:	fd843783          	ld	a5,-40(s0)
    80003310:	00078513          	mv	a0,a5
    80003314:	fffff097          	auipc	ra,0xfffff
    80003318:	618080e7          	jalr	1560(ra) # 8000292c <_ZN6Thread5startEv>
    time_sleep(15);
    8000331c:	00f00513          	li	a0,15
    80003320:	ffffe097          	auipc	ra,0xffffe
    80003324:	154080e7          	jalr	340(ra) # 80001474 <_Z10time_sleepm>
    pt->terminate();
    80003328:	fd843503          	ld	a0,-40(s0)
    8000332c:	00000097          	auipc	ra,0x0
    80003330:	82c080e7          	jalr	-2004(ra) # 80002b58 <_ZN14PeriodicThread9terminateEv>
    printString("\nGotova nit 2\n");
    80003334:	00007517          	auipc	a0,0x7
    80003338:	eec50513          	addi	a0,a0,-276 # 8000a220 <_ZZ9kPrintIntmE6digits+0x1b0>
    8000333c:	00003097          	auipc	ra,0x3
    80003340:	8a4080e7          	jalr	-1884(ra) # 80005be0 <_Z11printStringPKc>
}
    80003344:	0240006f          	j	80003368 <_Z5nit2fPv+0xa0>
    80003348:	00050913          	mv	s2,a0
    PeriodicThread* pt = new per(10);
    8000334c:	00048513          	mv	a0,s1
    80003350:	fffff097          	auipc	ra,0xfffff
    80003354:	47c080e7          	jalr	1148(ra) # 800027cc <_ZdlPv>
    80003358:	00090793          	mv	a5,s2
    8000335c:	00078513          	mv	a0,a5
    80003360:	0000b097          	auipc	ra,0xb
    80003364:	c18080e7          	jalr	-1000(ra) # 8000df78 <_Unwind_Resume>
}
    80003368:	03813083          	ld	ra,56(sp)
    8000336c:	03013403          	ld	s0,48(sp)
    80003370:	02813483          	ld	s1,40(sp)
    80003374:	02013903          	ld	s2,32(sp)
    80003378:	04010113          	addi	sp,sp,64
    8000337c:	00008067          	ret

0000000080003380 <_Z5nit3fPv>:


void nit3f(void*) {
    80003380:	fd010113          	addi	sp,sp,-48
    80003384:	02113423          	sd	ra,40(sp)
    80003388:	02813023          	sd	s0,32(sp)
    8000338c:	03010413          	addi	s0,sp,48
    80003390:	fca43c23          	sd	a0,-40(s0)
    char slovo;
    do {
        slovo = getc();
    80003394:	ffffe097          	auipc	ra,0xffffe
    80003398:	1d8080e7          	jalr	472(ra) # 8000156c <_Z4getcv>
    8000339c:	00050793          	mv	a5,a0
    800033a0:	fef407a3          	sb	a5,-17(s0)
        putc(slovo);
    800033a4:	fef44783          	lbu	a5,-17(s0)
    800033a8:	00078513          	mv	a0,a5
    800033ac:	ffffe097          	auipc	ra,0xffffe
    800033b0:	1e8080e7          	jalr	488(ra) # 80001594 <_Z4putcc>
        if (slovo == '\r') putc('\n');
    800033b4:	fef44783          	lbu	a5,-17(s0)
    800033b8:	0ff7f713          	andi	a4,a5,255
    800033bc:	00d00793          	li	a5,13
    800033c0:	00f71863          	bne	a4,a5,800033d0 <_Z5nit3fPv+0x50>
    800033c4:	00a00513          	li	a0,10
    800033c8:	ffffe097          	auipc	ra,0xffffe
    800033cc:	1cc080e7          	jalr	460(ra) # 80001594 <_Z4putcc>
    } while (slovo != '0');
    800033d0:	fef44783          	lbu	a5,-17(s0)
    800033d4:	0ff7f713          	andi	a4,a5,255
    800033d8:	03000793          	li	a5,48
    800033dc:	00f70463          	beq	a4,a5,800033e4 <_Z5nit3fPv+0x64>
    do {
    800033e0:	fb5ff06f          	j	80003394 <_Z5nit3fPv+0x14>

    printString("\nGotova nit3\n");
    800033e4:	00007517          	auipc	a0,0x7
    800033e8:	e4c50513          	addi	a0,a0,-436 # 8000a230 <_ZZ9kPrintIntmE6digits+0x1c0>
    800033ec:	00002097          	auipc	ra,0x2
    800033f0:	7f4080e7          	jalr	2036(ra) # 80005be0 <_Z11printStringPKc>
}
    800033f4:	00000013          	nop
    800033f8:	02813083          	ld	ra,40(sp)
    800033fc:	02013403          	ld	s0,32(sp)
    80003400:	03010113          	addi	sp,sp,48
    80003404:	00008067          	ret

0000000080003408 <main>:

int main() {
    80003408:	fc010113          	addi	sp,sp,-64
    8000340c:	02113c23          	sd	ra,56(sp)
    80003410:	02813823          	sd	s0,48(sp)
    80003414:	04010413          	addi	s0,sp,64
//postavi adresu prekidne rutine u stvec
    __asm__ volatile("csrw stvec, %[handler]": :[handler] "r"(&interruptHandler));
    80003418:	0000a797          	auipc	a5,0xa
    8000341c:	8c07b783          	ld	a5,-1856(a5) # 8000ccd8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003420:	10579073          	csrw	stvec,a5

    //inicijalizacija alokatora memorije
    KMemory::initializeMemory();
    80003424:	fffff097          	auipc	ra,0xfffff
    80003428:	948080e7          	jalr	-1720(ra) # 80001d6c <_ZN7KMemory16initializeMemoryEv>

    //inicijalizacija komunikacije sa konzolom
    KConsole::initKConsole();
    8000342c:	ffffe097          	auipc	ra,0xffffe
    80003430:	238080e7          	jalr	568(ra) # 80001664 <_ZN8KConsole12initKConsoleEv>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

    //testiranje kreiranja niti
	thread_t glavnaNit = nullptr;
    80003434:	fe043423          	sd	zero,-24(s0)
	thread_t nit1 = nullptr;
    80003438:	fe043023          	sd	zero,-32(s0)
	thread_t nit2 = nullptr;
    8000343c:	fc043c23          	sd	zero,-40(s0)
	thread_t nit3 = nullptr;
    80003440:	fc043823          	sd	zero,-48(s0)
	thread_t idleNit = nullptr;
    80003444:	fc043423          	sd	zero,-56(s0)
	thread_t kernelConsumerThread = nullptr;
    80003448:	fc043023          	sd	zero,-64(s0)
	thread_create(&glavnaNit, nullptr, nullptr);
    8000344c:	fe840793          	addi	a5,s0,-24
    80003450:	00000613          	li	a2,0
    80003454:	00000593          	li	a1,0
    80003458:	00078513          	mv	a0,a5
    8000345c:	ffffe097          	auipc	ra,0xffffe
    80003460:	f1c080e7          	jalr	-228(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::setRunning(glavnaNit);
    80003464:	fe843783          	ld	a5,-24(s0)
    80003468:	00078513          	mv	a0,a5
    8000346c:	00000097          	auipc	ra,0x0
    80003470:	2d8080e7          	jalr	728(ra) # 80003744 <_ZN3TCB10setRunningEPS_>
	thread_create(&idleNit, idle, nullptr);
    80003474:	fc840793          	addi	a5,s0,-56
    80003478:	00000613          	li	a2,0
    8000347c:	0000a597          	auipc	a1,0xa
    80003480:	8645b583          	ld	a1,-1948(a1) # 8000cce0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80003484:	00078513          	mv	a0,a5
    80003488:	ffffe097          	auipc	ra,0xffffe
    8000348c:	ef0080e7          	jalr	-272(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&kernelConsumerThread, kernelConsumerFunction, nullptr);
    80003490:	fc040793          	addi	a5,s0,-64
    80003494:	00000613          	li	a2,0
    80003498:	0000a597          	auipc	a1,0xa
    8000349c:	8085b583          	ld	a1,-2040(a1) # 8000cca0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800034a0:	00078513          	mv	a0,a5
    800034a4:	ffffe097          	auipc	ra,0xffffe
    800034a8:	ed4080e7          	jalr	-300(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>


	thread_create(&nit1, nit1f, nullptr);
    800034ac:	fe040793          	addi	a5,s0,-32
    800034b0:	00000613          	li	a2,0
    800034b4:	00000597          	auipc	a1,0x0
    800034b8:	ddc58593          	addi	a1,a1,-548 # 80003290 <_Z5nit1fPv>
    800034bc:	00078513          	mv	a0,a5
    800034c0:	ffffe097          	auipc	ra,0xffffe
    800034c4:	eb8080e7          	jalr	-328(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nit2, nit2f, nullptr);
    800034c8:	fd840793          	addi	a5,s0,-40
    800034cc:	00000613          	li	a2,0
    800034d0:	00000597          	auipc	a1,0x0
    800034d4:	df858593          	addi	a1,a1,-520 # 800032c8 <_Z5nit2fPv>
    800034d8:	00078513          	mv	a0,a5
    800034dc:	ffffe097          	auipc	ra,0xffffe
    800034e0:	e9c080e7          	jalr	-356(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nit3, nit3f, nullptr);
    800034e4:	fd040793          	addi	a5,s0,-48
    800034e8:	00000613          	li	a2,0
    800034ec:	00000597          	auipc	a1,0x0
    800034f0:	e9458593          	addi	a1,a1,-364 # 80003380 <_Z5nit3fPv>
    800034f4:	00078513          	mv	a0,a5
    800034f8:	ffffe097          	auipc	ra,0xffffe
    800034fc:	e80080e7          	jalr	-384(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    80003500:	00200513          	li	a0,2
    80003504:	00000097          	auipc	ra,0x0
    80003508:	208080e7          	jalr	520(ra) # 8000370c <_ZN5Riscv10ms_sstatusEm>

	thread_join(nit1);
    8000350c:	fe043783          	ld	a5,-32(s0)
    80003510:	00078513          	mv	a0,a5
    80003514:	ffffe097          	auipc	ra,0xffffe
    80003518:	f38080e7          	jalr	-200(ra) # 8000144c <_Z11thread_joinP3TCB>
	thread_join(nit2);
    8000351c:	fd843783          	ld	a5,-40(s0)
    80003520:	00078513          	mv	a0,a5
    80003524:	ffffe097          	auipc	ra,0xffffe
    80003528:	f28080e7          	jalr	-216(ra) # 8000144c <_Z11thread_joinP3TCB>
	thread_join(nit3);
    8000352c:	fd043783          	ld	a5,-48(s0)
    80003530:	00078513          	mv	a0,a5
    80003534:	ffffe097          	auipc	ra,0xffffe
    80003538:	f18080e7          	jalr	-232(ra) # 8000144c <_Z11thread_joinP3TCB>
	//thread_join(idleNit);

	printString("\nGotove user niti\n");
    8000353c:	00007517          	auipc	a0,0x7
    80003540:	d0450513          	addi	a0,a0,-764 # 8000a240 <_ZZ9kPrintIntmE6digits+0x1d0>
    80003544:	00002097          	auipc	ra,0x2
    80003548:	69c080e7          	jalr	1692(ra) # 80005be0 <_Z11printStringPKc>

	printString("\nSad cu da izadjem\n");
    8000354c:	00007517          	auipc	a0,0x7
    80003550:	d0c50513          	addi	a0,a0,-756 # 8000a258 <_ZZ9kPrintIntmE6digits+0x1e8>
    80003554:	00002097          	auipc	ra,0x2
    80003558:	68c080e7          	jalr	1676(ra) # 80005be0 <_Z11printStringPKc>
	while(KConsole::outputHead!=KConsole::outputTail){}
    8000355c:	00009797          	auipc	a5,0x9
    80003560:	74c7b783          	ld	a5,1868(a5) # 8000cca8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003564:	0007a703          	lw	a4,0(a5)
    80003568:	00009797          	auipc	a5,0x9
    8000356c:	7807b783          	ld	a5,1920(a5) # 8000cce8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80003570:	0007a783          	lw	a5,0(a5)
    80003574:	00f70463          	beq	a4,a5,8000357c <main+0x174>
    80003578:	fe5ff06f          	j	8000355c <main+0x154>
//	//zabrani prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    8000357c:	00200513          	li	a0,2
    80003580:	00000097          	auipc	ra,0x0
    80003584:	1a8080e7          	jalr	424(ra) # 80003728 <_ZN5Riscv10mc_sstatusEm>


    return 0;
    80003588:	00000793          	li	a5,0
    8000358c:	00078513          	mv	a0,a5
    80003590:	03813083          	ld	ra,56(sp)
    80003594:	03013403          	ld	s0,48(sp)
    80003598:	04010113          	addi	sp,sp,64
    8000359c:	00008067          	ret

00000000800035a0 <_Z5upisim>:
char* upisi(size_t alociraj) {
    800035a0:	fe010113          	addi	sp,sp,-32
    800035a4:	00113c23          	sd	ra,24(sp)
    800035a8:	00813823          	sd	s0,16(sp)
    800035ac:	00913423          	sd	s1,8(sp)
    800035b0:	02010413          	addi	s0,sp,32
    800035b4:	00050493          	mv	s1,a0
    char* pok = (char*) MemoryAllocator::kmalloc(alociraj);
    800035b8:	00300593          	li	a1,3
    800035bc:	00004097          	auipc	ra,0x4
    800035c0:	874080e7          	jalr	-1932(ra) # 80006e30 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>
    if (pok) {
    800035c4:	02050263          	beqz	a0,800035e8 <_Z5upisim+0x48>
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    800035c8:	00000793          	li	a5,0
    800035cc:	0140006f          	j	800035e0 <_Z5upisim+0x40>
            pok[i] = '8';
    800035d0:	00f50733          	add	a4,a0,a5
    800035d4:	03800693          	li	a3,56
    800035d8:	00d70023          	sb	a3,0(a4)
        for (uint64 i = 0; i < alociraj - sizeof(MemoryAllocator::UsedMemSegment); i++) {
    800035dc:	00178793          	addi	a5,a5,1
    800035e0:	fe048713          	addi	a4,s1,-32
    800035e4:	fee7e6e3          	bltu	a5,a4,800035d0 <_Z5upisim+0x30>
}
    800035e8:	01813083          	ld	ra,24(sp)
    800035ec:	01013403          	ld	s0,16(sp)
    800035f0:	00813483          	ld	s1,8(sp)
    800035f4:	02010113          	addi	sp,sp,32
    800035f8:	00008067          	ret

00000000800035fc <_ZN3perC1Em>:
    per(time_t period): PeriodicThread(period){}
    800035fc:	fe010113          	addi	sp,sp,-32
    80003600:	00113c23          	sd	ra,24(sp)
    80003604:	00813823          	sd	s0,16(sp)
    80003608:	02010413          	addi	s0,sp,32
    8000360c:	fea43423          	sd	a0,-24(s0)
    80003610:	feb43023          	sd	a1,-32(s0)
    80003614:	fe843783          	ld	a5,-24(s0)
    80003618:	fe043583          	ld	a1,-32(s0)
    8000361c:	00078513          	mv	a0,a5
    80003620:	fffff097          	auipc	ra,0xfffff
    80003624:	558080e7          	jalr	1368(ra) # 80002b78 <_ZN14PeriodicThreadC1Em>
    80003628:	00009717          	auipc	a4,0x9
    8000362c:	47870713          	addi	a4,a4,1144 # 8000caa0 <_ZTV3per+0x10>
    80003630:	fe843783          	ld	a5,-24(s0)
    80003634:	00e7b023          	sd	a4,0(a5)
    80003638:	00000013          	nop
    8000363c:	01813083          	ld	ra,24(sp)
    80003640:	01013403          	ld	s0,16(sp)
    80003644:	02010113          	addi	sp,sp,32
    80003648:	00008067          	ret

000000008000364c <_ZN3per18periodicActivationEv>:
    void periodicActivation() override{
    8000364c:	fe010113          	addi	sp,sp,-32
    80003650:	00113c23          	sd	ra,24(sp)
    80003654:	00813823          	sd	s0,16(sp)
    80003658:	02010413          	addi	s0,sp,32
    8000365c:	fea43423          	sd	a0,-24(s0)
        printString("Janko\n");
    80003660:	00007517          	auipc	a0,0x7
    80003664:	bb850513          	addi	a0,a0,-1096 # 8000a218 <_ZZ9kPrintIntmE6digits+0x1a8>
    80003668:	00002097          	auipc	ra,0x2
    8000366c:	578080e7          	jalr	1400(ra) # 80005be0 <_Z11printStringPKc>
    }
    80003670:	00000013          	nop
    80003674:	01813083          	ld	ra,24(sp)
    80003678:	01013403          	ld	s0,16(sp)
    8000367c:	02010113          	addi	sp,sp,32
    80003680:	00008067          	ret

0000000080003684 <_ZN3perD1Ev>:
class per:public PeriodicThread{
    80003684:	ff010113          	addi	sp,sp,-16
    80003688:	00113423          	sd	ra,8(sp)
    8000368c:	00813023          	sd	s0,0(sp)
    80003690:	01010413          	addi	s0,sp,16
    80003694:	00009797          	auipc	a5,0x9
    80003698:	6047b783          	ld	a5,1540(a5) # 8000cc98 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000369c:	01078793          	addi	a5,a5,16
    800036a0:	00f53023          	sd	a5,0(a0)
    800036a4:	fffff097          	auipc	ra,0xfffff
    800036a8:	fe8080e7          	jalr	-24(ra) # 8000268c <_ZN6ThreadD1Ev>
    800036ac:	00813083          	ld	ra,8(sp)
    800036b0:	00013403          	ld	s0,0(sp)
    800036b4:	01010113          	addi	sp,sp,16
    800036b8:	00008067          	ret

00000000800036bc <_ZN3perD0Ev>:
    800036bc:	fe010113          	addi	sp,sp,-32
    800036c0:	00113c23          	sd	ra,24(sp)
    800036c4:	00813823          	sd	s0,16(sp)
    800036c8:	00913423          	sd	s1,8(sp)
    800036cc:	02010413          	addi	s0,sp,32
    800036d0:	00050493          	mv	s1,a0
    800036d4:	00009797          	auipc	a5,0x9
    800036d8:	5c47b783          	ld	a5,1476(a5) # 8000cc98 <_GLOBAL_OFFSET_TABLE_+0x30>
    800036dc:	01078793          	addi	a5,a5,16
    800036e0:	00f53023          	sd	a5,0(a0)
    800036e4:	fffff097          	auipc	ra,0xfffff
    800036e8:	fa8080e7          	jalr	-88(ra) # 8000268c <_ZN6ThreadD1Ev>
    800036ec:	00048513          	mv	a0,s1
    800036f0:	fffff097          	auipc	ra,0xfffff
    800036f4:	0dc080e7          	jalr	220(ra) # 800027cc <_ZdlPv>
    800036f8:	01813083          	ld	ra,24(sp)
    800036fc:	01013403          	ld	s0,16(sp)
    80003700:	00813483          	ld	s1,8(sp)
    80003704:	02010113          	addi	sp,sp,32
    80003708:	00008067          	ret

000000008000370c <_ZN5Riscv10ms_sstatusEm>:
inline void Riscv::ms_sstatus(uint64 mask) {
    8000370c:	ff010113          	addi	sp,sp,-16
    80003710:	00813423          	sd	s0,8(sp)
    80003714:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80003718:	10052073          	csrs	sstatus,a0
}
    8000371c:	00813403          	ld	s0,8(sp)
    80003720:	01010113          	addi	sp,sp,16
    80003724:	00008067          	ret

0000000080003728 <_ZN5Riscv10mc_sstatusEm>:
inline void Riscv::mc_sstatus(uint64 mask) {
    80003728:	ff010113          	addi	sp,sp,-16
    8000372c:	00813423          	sd	s0,8(sp)
    80003730:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80003734:	10053073          	csrc	sstatus,a0
}
    80003738:	00813403          	ld	s0,8(sp)
    8000373c:	01010113          	addi	sp,sp,16
    80003740:	00008067          	ret

0000000080003744 <_ZN3TCB10setRunningEPS_>:
    static void setRunning(TCB* newRunning) { running = newRunning; }
    80003744:	ff010113          	addi	sp,sp,-16
    80003748:	00813423          	sd	s0,8(sp)
    8000374c:	01010413          	addi	s0,sp,16
    80003750:	00009797          	auipc	a5,0x9
    80003754:	5787b783          	ld	a5,1400(a5) # 8000ccc8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003758:	00a7b023          	sd	a0,0(a5)
    8000375c:	00813403          	ld	s0,8(sp)
    80003760:	01010113          	addi	sp,sp,16
    80003764:	00008067          	ret

0000000080003768 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003768:	fe010113          	addi	sp,sp,-32
    8000376c:	00113c23          	sd	ra,24(sp)
    80003770:	00813823          	sd	s0,16(sp)
    80003774:	00913423          	sd	s1,8(sp)
    80003778:	01213023          	sd	s2,0(sp)
    8000377c:	02010413          	addi	s0,sp,32
    80003780:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003784:	00000913          	li	s2,0
    80003788:	00c0006f          	j	80003794 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    8000378c:	ffffe097          	auipc	ra,0xffffe
    80003790:	ca0080e7          	jalr	-864(ra) # 8000142c <_Z15thread_dispatchv>
    while ((key = getc()) != 0x2d) {//1b po originalu - ESC, meni je -
    80003794:	ffffe097          	auipc	ra,0xffffe
    80003798:	dd8080e7          	jalr	-552(ra) # 8000156c <_Z4getcv>
    8000379c:	0005059b          	sext.w	a1,a0
    800037a0:	02d00793          	li	a5,45
    800037a4:	02f58a63          	beq	a1,a5,800037d8 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800037a8:	0084b503          	ld	a0,8(s1)
    800037ac:	00003097          	auipc	ra,0x3
    800037b0:	400080e7          	jalr	1024(ra) # 80006bac <_ZN6Buffer3putEi>
        i++;
    800037b4:	0019071b          	addiw	a4,s2,1
    800037b8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800037bc:	0004a683          	lw	a3,0(s1)
    800037c0:	0026979b          	slliw	a5,a3,0x2
    800037c4:	00d787bb          	addw	a5,a5,a3
    800037c8:	0017979b          	slliw	a5,a5,0x1
    800037cc:	02f767bb          	remw	a5,a4,a5
    800037d0:	fc0792e3          	bnez	a5,80003794 <_ZL16producerKeyboardPv+0x2c>
    800037d4:	fb9ff06f          	j	8000378c <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800037d8:	00100793          	li	a5,1
    800037dc:	00009717          	auipc	a4,0x9
    800037e0:	66f72623          	sw	a5,1644(a4) # 8000ce48 <_ZL9threadEnd>
    data->buffer->put('!');
    800037e4:	02100593          	li	a1,33
    800037e8:	0084b503          	ld	a0,8(s1)
    800037ec:	00003097          	auipc	ra,0x3
    800037f0:	3c0080e7          	jalr	960(ra) # 80006bac <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800037f4:	0104b503          	ld	a0,16(s1)
    800037f8:	ffffe097          	auipc	ra,0xffffe
    800037fc:	d44080e7          	jalr	-700(ra) # 8000153c <_Z10sem_signalP4KSem>
}
    80003800:	01813083          	ld	ra,24(sp)
    80003804:	01013403          	ld	s0,16(sp)
    80003808:	00813483          	ld	s1,8(sp)
    8000380c:	00013903          	ld	s2,0(sp)
    80003810:	02010113          	addi	sp,sp,32
    80003814:	00008067          	ret

0000000080003818 <_ZL8producerPv>:

static void producer(void *arg) {
    80003818:	fe010113          	addi	sp,sp,-32
    8000381c:	00113c23          	sd	ra,24(sp)
    80003820:	00813823          	sd	s0,16(sp)
    80003824:	00913423          	sd	s1,8(sp)
    80003828:	01213023          	sd	s2,0(sp)
    8000382c:	02010413          	addi	s0,sp,32
    80003830:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003834:	00000913          	li	s2,0
    80003838:	00c0006f          	j	80003844 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    8000383c:	ffffe097          	auipc	ra,0xffffe
    80003840:	bf0080e7          	jalr	-1040(ra) # 8000142c <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003844:	00009797          	auipc	a5,0x9
    80003848:	6047a783          	lw	a5,1540(a5) # 8000ce48 <_ZL9threadEnd>
    8000384c:	02079e63          	bnez	a5,80003888 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003850:	0004a583          	lw	a1,0(s1)
    80003854:	0305859b          	addiw	a1,a1,48
    80003858:	0084b503          	ld	a0,8(s1)
    8000385c:	00003097          	auipc	ra,0x3
    80003860:	350080e7          	jalr	848(ra) # 80006bac <_ZN6Buffer3putEi>
        i++;
    80003864:	0019071b          	addiw	a4,s2,1
    80003868:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000386c:	0004a683          	lw	a3,0(s1)
    80003870:	0026979b          	slliw	a5,a3,0x2
    80003874:	00d787bb          	addw	a5,a5,a3
    80003878:	0017979b          	slliw	a5,a5,0x1
    8000387c:	02f767bb          	remw	a5,a4,a5
    80003880:	fc0792e3          	bnez	a5,80003844 <_ZL8producerPv+0x2c>
    80003884:	fb9ff06f          	j	8000383c <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003888:	0104b503          	ld	a0,16(s1)
    8000388c:	ffffe097          	auipc	ra,0xffffe
    80003890:	cb0080e7          	jalr	-848(ra) # 8000153c <_Z10sem_signalP4KSem>
}
    80003894:	01813083          	ld	ra,24(sp)
    80003898:	01013403          	ld	s0,16(sp)
    8000389c:	00813483          	ld	s1,8(sp)
    800038a0:	00013903          	ld	s2,0(sp)
    800038a4:	02010113          	addi	sp,sp,32
    800038a8:	00008067          	ret

00000000800038ac <_ZL8consumerPv>:

static void consumer(void *arg) {
    800038ac:	fd010113          	addi	sp,sp,-48
    800038b0:	02113423          	sd	ra,40(sp)
    800038b4:	02813023          	sd	s0,32(sp)
    800038b8:	00913c23          	sd	s1,24(sp)
    800038bc:	01213823          	sd	s2,16(sp)
    800038c0:	01313423          	sd	s3,8(sp)
    800038c4:	03010413          	addi	s0,sp,48
    800038c8:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800038cc:	00000993          	li	s3,0
    800038d0:	01c0006f          	j	800038ec <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800038d4:	ffffe097          	auipc	ra,0xffffe
    800038d8:	b58080e7          	jalr	-1192(ra) # 8000142c <_Z15thread_dispatchv>
    800038dc:	0500006f          	j	8000392c <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800038e0:	00a00513          	li	a0,10
    800038e4:	ffffe097          	auipc	ra,0xffffe
    800038e8:	cb0080e7          	jalr	-848(ra) # 80001594 <_Z4putcc>
    while (!threadEnd) {
    800038ec:	00009797          	auipc	a5,0x9
    800038f0:	55c7a783          	lw	a5,1372(a5) # 8000ce48 <_ZL9threadEnd>
    800038f4:	06079063          	bnez	a5,80003954 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800038f8:	00893503          	ld	a0,8(s2)
    800038fc:	00003097          	auipc	ra,0x3
    80003900:	340080e7          	jalr	832(ra) # 80006c3c <_ZN6Buffer3getEv>
        i++;
    80003904:	0019849b          	addiw	s1,s3,1
    80003908:	0004899b          	sext.w	s3,s1
        putc(key);
    8000390c:	0ff57513          	andi	a0,a0,255
    80003910:	ffffe097          	auipc	ra,0xffffe
    80003914:	c84080e7          	jalr	-892(ra) # 80001594 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003918:	00092703          	lw	a4,0(s2)
    8000391c:	0027179b          	slliw	a5,a4,0x2
    80003920:	00e787bb          	addw	a5,a5,a4
    80003924:	02f4e7bb          	remw	a5,s1,a5
    80003928:	fa0786e3          	beqz	a5,800038d4 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    8000392c:	05000793          	li	a5,80
    80003930:	02f4e4bb          	remw	s1,s1,a5
    80003934:	fa049ce3          	bnez	s1,800038ec <_ZL8consumerPv+0x40>
    80003938:	fa9ff06f          	j	800038e0 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    8000393c:	00893503          	ld	a0,8(s2)
    80003940:	00003097          	auipc	ra,0x3
    80003944:	2fc080e7          	jalr	764(ra) # 80006c3c <_ZN6Buffer3getEv>
        putc(key);
    80003948:	0ff57513          	andi	a0,a0,255
    8000394c:	ffffe097          	auipc	ra,0xffffe
    80003950:	c48080e7          	jalr	-952(ra) # 80001594 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003954:	00893503          	ld	a0,8(s2)
    80003958:	00003097          	auipc	ra,0x3
    8000395c:	370080e7          	jalr	880(ra) # 80006cc8 <_ZN6Buffer6getCntEv>
    80003960:	fca04ee3          	bgtz	a0,8000393c <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003964:	01093503          	ld	a0,16(s2)
    80003968:	ffffe097          	auipc	ra,0xffffe
    8000396c:	bd4080e7          	jalr	-1068(ra) # 8000153c <_Z10sem_signalP4KSem>
}
    80003970:	02813083          	ld	ra,40(sp)
    80003974:	02013403          	ld	s0,32(sp)
    80003978:	01813483          	ld	s1,24(sp)
    8000397c:	01013903          	ld	s2,16(sp)
    80003980:	00813983          	ld	s3,8(sp)
    80003984:	03010113          	addi	sp,sp,48
    80003988:	00008067          	ret

000000008000398c <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    8000398c:	f9010113          	addi	sp,sp,-112
    80003990:	06113423          	sd	ra,104(sp)
    80003994:	06813023          	sd	s0,96(sp)
    80003998:	04913c23          	sd	s1,88(sp)
    8000399c:	05213823          	sd	s2,80(sp)
    800039a0:	05313423          	sd	s3,72(sp)
    800039a4:	05413023          	sd	s4,64(sp)
    800039a8:	03513c23          	sd	s5,56(sp)
    800039ac:	03613823          	sd	s6,48(sp)
    800039b0:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800039b4:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800039b8:	00007517          	auipc	a0,0x7
    800039bc:	8b850513          	addi	a0,a0,-1864 # 8000a270 <_ZZ9kPrintIntmE6digits+0x200>
    800039c0:	00002097          	auipc	ra,0x2
    800039c4:	220080e7          	jalr	544(ra) # 80005be0 <_Z11printStringPKc>
    getString(input, 30);
    800039c8:	01e00593          	li	a1,30
    800039cc:	fa040493          	addi	s1,s0,-96
    800039d0:	00048513          	mv	a0,s1
    800039d4:	00002097          	auipc	ra,0x2
    800039d8:	294080e7          	jalr	660(ra) # 80005c68 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800039dc:	00048513          	mv	a0,s1
    800039e0:	00002097          	auipc	ra,0x2
    800039e4:	360080e7          	jalr	864(ra) # 80005d40 <_Z11stringToIntPKc>
    800039e8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800039ec:	00007517          	auipc	a0,0x7
    800039f0:	8a450513          	addi	a0,a0,-1884 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    800039f4:	00002097          	auipc	ra,0x2
    800039f8:	1ec080e7          	jalr	492(ra) # 80005be0 <_Z11printStringPKc>
    getString(input, 30);
    800039fc:	01e00593          	li	a1,30
    80003a00:	00048513          	mv	a0,s1
    80003a04:	00002097          	auipc	ra,0x2
    80003a08:	264080e7          	jalr	612(ra) # 80005c68 <_Z9getStringPci>
    n = stringToInt(input);
    80003a0c:	00048513          	mv	a0,s1
    80003a10:	00002097          	auipc	ra,0x2
    80003a14:	330080e7          	jalr	816(ra) # 80005d40 <_Z11stringToIntPKc>
    80003a18:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003a1c:	00007517          	auipc	a0,0x7
    80003a20:	89450513          	addi	a0,a0,-1900 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    80003a24:	00002097          	auipc	ra,0x2
    80003a28:	1bc080e7          	jalr	444(ra) # 80005be0 <_Z11printStringPKc>
	printInt(threadNum);
    80003a2c:	00000613          	li	a2,0
    80003a30:	00a00593          	li	a1,10
    80003a34:	00090513          	mv	a0,s2
    80003a38:	00002097          	auipc	ra,0x2
    80003a3c:	358080e7          	jalr	856(ra) # 80005d90 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003a40:	00007517          	auipc	a0,0x7
    80003a44:	88850513          	addi	a0,a0,-1912 # 8000a2c8 <_ZZ9kPrintIntmE6digits+0x258>
    80003a48:	00002097          	auipc	ra,0x2
    80003a4c:	198080e7          	jalr	408(ra) # 80005be0 <_Z11printStringPKc>
	printInt(n);
    80003a50:	00000613          	li	a2,0
    80003a54:	00a00593          	li	a1,10
    80003a58:	00048513          	mv	a0,s1
    80003a5c:	00002097          	auipc	ra,0x2
    80003a60:	334080e7          	jalr	820(ra) # 80005d90 <_Z8printIntiii>
    printString(".\n");
    80003a64:	00007517          	auipc	a0,0x7
    80003a68:	87c50513          	addi	a0,a0,-1924 # 8000a2e0 <_ZZ9kPrintIntmE6digits+0x270>
    80003a6c:	00002097          	auipc	ra,0x2
    80003a70:	174080e7          	jalr	372(ra) # 80005be0 <_Z11printStringPKc>
    if(threadNum > n) {
    80003a74:	0324c463          	blt	s1,s2,80003a9c <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003a78:	03205c63          	blez	s2,80003ab0 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003a7c:	03800513          	li	a0,56
    80003a80:	fffff097          	auipc	ra,0xfffff
    80003a84:	cfc080e7          	jalr	-772(ra) # 8000277c <_Znwm>
    80003a88:	00050a13          	mv	s4,a0
    80003a8c:	00048593          	mv	a1,s1
    80003a90:	00003097          	auipc	ra,0x3
    80003a94:	080080e7          	jalr	128(ra) # 80006b10 <_ZN6BufferC1Ei>
    80003a98:	0300006f          	j	80003ac8 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003a9c:	00007517          	auipc	a0,0x7
    80003aa0:	84c50513          	addi	a0,a0,-1972 # 8000a2e8 <_ZZ9kPrintIntmE6digits+0x278>
    80003aa4:	00002097          	auipc	ra,0x2
    80003aa8:	13c080e7          	jalr	316(ra) # 80005be0 <_Z11printStringPKc>
        return;
    80003aac:	0140006f          	j	80003ac0 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003ab0:	00007517          	auipc	a0,0x7
    80003ab4:	87850513          	addi	a0,a0,-1928 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80003ab8:	00002097          	auipc	ra,0x2
    80003abc:	128080e7          	jalr	296(ra) # 80005be0 <_Z11printStringPKc>
        return;
    80003ac0:	000b0113          	mv	sp,s6
    80003ac4:	1500006f          	j	80003c14 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003ac8:	00000593          	li	a1,0
    80003acc:	00009517          	auipc	a0,0x9
    80003ad0:	38450513          	addi	a0,a0,900 # 8000ce50 <_ZL10waitForAll>
    80003ad4:	ffffe097          	auipc	ra,0xffffe
    80003ad8:	9d0080e7          	jalr	-1584(ra) # 800014a4 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80003adc:	00391793          	slli	a5,s2,0x3
    80003ae0:	00f78793          	addi	a5,a5,15
    80003ae4:	ff07f793          	andi	a5,a5,-16
    80003ae8:	40f10133          	sub	sp,sp,a5
    80003aec:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003af0:	0019071b          	addiw	a4,s2,1
    80003af4:	00171793          	slli	a5,a4,0x1
    80003af8:	00e787b3          	add	a5,a5,a4
    80003afc:	00379793          	slli	a5,a5,0x3
    80003b00:	00f78793          	addi	a5,a5,15
    80003b04:	ff07f793          	andi	a5,a5,-16
    80003b08:	40f10133          	sub	sp,sp,a5
    80003b0c:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003b10:	00191613          	slli	a2,s2,0x1
    80003b14:	012607b3          	add	a5,a2,s2
    80003b18:	00379793          	slli	a5,a5,0x3
    80003b1c:	00f987b3          	add	a5,s3,a5
    80003b20:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003b24:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003b28:	00009717          	auipc	a4,0x9
    80003b2c:	32873703          	ld	a4,808(a4) # 8000ce50 <_ZL10waitForAll>
    80003b30:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003b34:	00078613          	mv	a2,a5
    80003b38:	00000597          	auipc	a1,0x0
    80003b3c:	d7458593          	addi	a1,a1,-652 # 800038ac <_ZL8consumerPv>
    80003b40:	f9840513          	addi	a0,s0,-104
    80003b44:	ffffe097          	auipc	ra,0xffffe
    80003b48:	834080e7          	jalr	-1996(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003b4c:	00000493          	li	s1,0
    80003b50:	0280006f          	j	80003b78 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003b54:	00000597          	auipc	a1,0x0
    80003b58:	c1458593          	addi	a1,a1,-1004 # 80003768 <_ZL16producerKeyboardPv>
                      data + i);
    80003b5c:	00179613          	slli	a2,a5,0x1
    80003b60:	00f60633          	add	a2,a2,a5
    80003b64:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003b68:	00c98633          	add	a2,s3,a2
    80003b6c:	ffffe097          	auipc	ra,0xffffe
    80003b70:	80c080e7          	jalr	-2036(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003b74:	0014849b          	addiw	s1,s1,1
    80003b78:	0524d263          	bge	s1,s2,80003bbc <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003b7c:	00149793          	slli	a5,s1,0x1
    80003b80:	009787b3          	add	a5,a5,s1
    80003b84:	00379793          	slli	a5,a5,0x3
    80003b88:	00f987b3          	add	a5,s3,a5
    80003b8c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003b90:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003b94:	00009717          	auipc	a4,0x9
    80003b98:	2bc73703          	ld	a4,700(a4) # 8000ce50 <_ZL10waitForAll>
    80003b9c:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003ba0:	00048793          	mv	a5,s1
    80003ba4:	00349513          	slli	a0,s1,0x3
    80003ba8:	00aa8533          	add	a0,s5,a0
    80003bac:	fa9054e3          	blez	s1,80003b54 <_Z22producerConsumer_C_APIv+0x1c8>
    80003bb0:	00000597          	auipc	a1,0x0
    80003bb4:	c6858593          	addi	a1,a1,-920 # 80003818 <_ZL8producerPv>
    80003bb8:	fa5ff06f          	j	80003b5c <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003bbc:	ffffe097          	auipc	ra,0xffffe
    80003bc0:	870080e7          	jalr	-1936(ra) # 8000142c <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003bc4:	00000493          	li	s1,0
    80003bc8:	00994e63          	blt	s2,s1,80003be4 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003bcc:	00009517          	auipc	a0,0x9
    80003bd0:	28453503          	ld	a0,644(a0) # 8000ce50 <_ZL10waitForAll>
    80003bd4:	ffffe097          	auipc	ra,0xffffe
    80003bd8:	938080e7          	jalr	-1736(ra) # 8000150c <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80003bdc:	0014849b          	addiw	s1,s1,1
    80003be0:	fe9ff06f          	j	80003bc8 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003be4:	00009517          	auipc	a0,0x9
    80003be8:	26c53503          	ld	a0,620(a0) # 8000ce50 <_ZL10waitForAll>
    80003bec:	ffffe097          	auipc	ra,0xffffe
    80003bf0:	8f0080e7          	jalr	-1808(ra) # 800014dc <_Z9sem_closeP4KSem>
    delete buffer;
    80003bf4:	000a0e63          	beqz	s4,80003c10 <_Z22producerConsumer_C_APIv+0x284>
    80003bf8:	000a0513          	mv	a0,s4
    80003bfc:	00003097          	auipc	ra,0x3
    80003c00:	154080e7          	jalr	340(ra) # 80006d50 <_ZN6BufferD1Ev>
    80003c04:	000a0513          	mv	a0,s4
    80003c08:	fffff097          	auipc	ra,0xfffff
    80003c0c:	bc4080e7          	jalr	-1084(ra) # 800027cc <_ZdlPv>
    80003c10:	000b0113          	mv	sp,s6

}
    80003c14:	f9040113          	addi	sp,s0,-112
    80003c18:	06813083          	ld	ra,104(sp)
    80003c1c:	06013403          	ld	s0,96(sp)
    80003c20:	05813483          	ld	s1,88(sp)
    80003c24:	05013903          	ld	s2,80(sp)
    80003c28:	04813983          	ld	s3,72(sp)
    80003c2c:	04013a03          	ld	s4,64(sp)
    80003c30:	03813a83          	ld	s5,56(sp)
    80003c34:	03013b03          	ld	s6,48(sp)
    80003c38:	07010113          	addi	sp,sp,112
    80003c3c:	00008067          	ret
    80003c40:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003c44:	000a0513          	mv	a0,s4
    80003c48:	fffff097          	auipc	ra,0xfffff
    80003c4c:	b84080e7          	jalr	-1148(ra) # 800027cc <_ZdlPv>
    80003c50:	00048513          	mv	a0,s1
    80003c54:	0000a097          	auipc	ra,0xa
    80003c58:	324080e7          	jalr	804(ra) # 8000df78 <_Unwind_Resume>

0000000080003c5c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003c5c:	fe010113          	addi	sp,sp,-32
    80003c60:	00113c23          	sd	ra,24(sp)
    80003c64:	00813823          	sd	s0,16(sp)
    80003c68:	00913423          	sd	s1,8(sp)
    80003c6c:	01213023          	sd	s2,0(sp)
    80003c70:	02010413          	addi	s0,sp,32
    80003c74:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003c78:	00100793          	li	a5,1
    80003c7c:	02a7f863          	bgeu	a5,a0,80003cac <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003c80:	00a00793          	li	a5,10
    80003c84:	02f577b3          	remu	a5,a0,a5
    80003c88:	02078e63          	beqz	a5,80003cc4 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003c8c:	fff48513          	addi	a0,s1,-1
    80003c90:	00000097          	auipc	ra,0x0
    80003c94:	fcc080e7          	jalr	-52(ra) # 80003c5c <_ZL9fibonaccim>
    80003c98:	00050913          	mv	s2,a0
    80003c9c:	ffe48513          	addi	a0,s1,-2
    80003ca0:	00000097          	auipc	ra,0x0
    80003ca4:	fbc080e7          	jalr	-68(ra) # 80003c5c <_ZL9fibonaccim>
    80003ca8:	00a90533          	add	a0,s2,a0
}
    80003cac:	01813083          	ld	ra,24(sp)
    80003cb0:	01013403          	ld	s0,16(sp)
    80003cb4:	00813483          	ld	s1,8(sp)
    80003cb8:	00013903          	ld	s2,0(sp)
    80003cbc:	02010113          	addi	sp,sp,32
    80003cc0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003cc4:	ffffd097          	auipc	ra,0xffffd
    80003cc8:	768080e7          	jalr	1896(ra) # 8000142c <_Z15thread_dispatchv>
    80003ccc:	fc1ff06f          	j	80003c8c <_ZL9fibonaccim+0x30>

0000000080003cd0 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003cd0:	fe010113          	addi	sp,sp,-32
    80003cd4:	00113c23          	sd	ra,24(sp)
    80003cd8:	00813823          	sd	s0,16(sp)
    80003cdc:	00913423          	sd	s1,8(sp)
    80003ce0:	01213023          	sd	s2,0(sp)
    80003ce4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003ce8:	00000913          	li	s2,0
    80003cec:	0380006f          	j	80003d24 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003cf0:	ffffd097          	auipc	ra,0xffffd
    80003cf4:	73c080e7          	jalr	1852(ra) # 8000142c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003cf8:	00148493          	addi	s1,s1,1
    80003cfc:	000027b7          	lui	a5,0x2
    80003d00:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003d04:	0097ee63          	bltu	a5,s1,80003d20 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003d08:	00000713          	li	a4,0
    80003d0c:	000077b7          	lui	a5,0x7
    80003d10:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003d14:	fce7eee3          	bltu	a5,a4,80003cf0 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003d18:	00170713          	addi	a4,a4,1
    80003d1c:	ff1ff06f          	j	80003d0c <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003d20:	00190913          	addi	s2,s2,1
    80003d24:	00900793          	li	a5,9
    80003d28:	0527e063          	bltu	a5,s2,80003d68 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003d2c:	00006517          	auipc	a0,0x6
    80003d30:	62c50513          	addi	a0,a0,1580 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    80003d34:	00002097          	auipc	ra,0x2
    80003d38:	eac080e7          	jalr	-340(ra) # 80005be0 <_Z11printStringPKc>
    80003d3c:	00000613          	li	a2,0
    80003d40:	00a00593          	li	a1,10
    80003d44:	0009051b          	sext.w	a0,s2
    80003d48:	00002097          	auipc	ra,0x2
    80003d4c:	048080e7          	jalr	72(ra) # 80005d90 <_Z8printIntiii>
    80003d50:	00007517          	auipc	a0,0x7
    80003d54:	86850513          	addi	a0,a0,-1944 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80003d58:	00002097          	auipc	ra,0x2
    80003d5c:	e88080e7          	jalr	-376(ra) # 80005be0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003d60:	00000493          	li	s1,0
    80003d64:	f99ff06f          	j	80003cfc <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003d68:	00006517          	auipc	a0,0x6
    80003d6c:	5f850513          	addi	a0,a0,1528 # 8000a360 <_ZZ9kPrintIntmE6digits+0x2f0>
    80003d70:	00002097          	auipc	ra,0x2
    80003d74:	e70080e7          	jalr	-400(ra) # 80005be0 <_Z11printStringPKc>
    finishedA = true;
    80003d78:	00100793          	li	a5,1
    80003d7c:	00009717          	auipc	a4,0x9
    80003d80:	0cf70e23          	sb	a5,220(a4) # 8000ce58 <_ZL9finishedA>
}
    80003d84:	01813083          	ld	ra,24(sp)
    80003d88:	01013403          	ld	s0,16(sp)
    80003d8c:	00813483          	ld	s1,8(sp)
    80003d90:	00013903          	ld	s2,0(sp)
    80003d94:	02010113          	addi	sp,sp,32
    80003d98:	00008067          	ret

0000000080003d9c <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003d9c:	fe010113          	addi	sp,sp,-32
    80003da0:	00113c23          	sd	ra,24(sp)
    80003da4:	00813823          	sd	s0,16(sp)
    80003da8:	00913423          	sd	s1,8(sp)
    80003dac:	01213023          	sd	s2,0(sp)
    80003db0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003db4:	00000913          	li	s2,0
    80003db8:	0380006f          	j	80003df0 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003dbc:	ffffd097          	auipc	ra,0xffffd
    80003dc0:	670080e7          	jalr	1648(ra) # 8000142c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003dc4:	00148493          	addi	s1,s1,1
    80003dc8:	000027b7          	lui	a5,0x2
    80003dcc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003dd0:	0097ee63          	bltu	a5,s1,80003dec <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003dd4:	00000713          	li	a4,0
    80003dd8:	000077b7          	lui	a5,0x7
    80003ddc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003de0:	fce7eee3          	bltu	a5,a4,80003dbc <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003de4:	00170713          	addi	a4,a4,1
    80003de8:	ff1ff06f          	j	80003dd8 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003dec:	00190913          	addi	s2,s2,1
    80003df0:	00f00793          	li	a5,15
    80003df4:	0527e063          	bltu	a5,s2,80003e34 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003df8:	00006517          	auipc	a0,0x6
    80003dfc:	57850513          	addi	a0,a0,1400 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    80003e00:	00002097          	auipc	ra,0x2
    80003e04:	de0080e7          	jalr	-544(ra) # 80005be0 <_Z11printStringPKc>
    80003e08:	00000613          	li	a2,0
    80003e0c:	00a00593          	li	a1,10
    80003e10:	0009051b          	sext.w	a0,s2
    80003e14:	00002097          	auipc	ra,0x2
    80003e18:	f7c080e7          	jalr	-132(ra) # 80005d90 <_Z8printIntiii>
    80003e1c:	00006517          	auipc	a0,0x6
    80003e20:	79c50513          	addi	a0,a0,1948 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80003e24:	00002097          	auipc	ra,0x2
    80003e28:	dbc080e7          	jalr	-580(ra) # 80005be0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003e2c:	00000493          	li	s1,0
    80003e30:	f99ff06f          	j	80003dc8 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003e34:	00006517          	auipc	a0,0x6
    80003e38:	54450513          	addi	a0,a0,1348 # 8000a378 <_ZZ9kPrintIntmE6digits+0x308>
    80003e3c:	00002097          	auipc	ra,0x2
    80003e40:	da4080e7          	jalr	-604(ra) # 80005be0 <_Z11printStringPKc>
    finishedB = true;
    80003e44:	00100793          	li	a5,1
    80003e48:	00009717          	auipc	a4,0x9
    80003e4c:	00f708a3          	sb	a5,17(a4) # 8000ce59 <_ZL9finishedB>
    thread_dispatch();
    80003e50:	ffffd097          	auipc	ra,0xffffd
    80003e54:	5dc080e7          	jalr	1500(ra) # 8000142c <_Z15thread_dispatchv>
}
    80003e58:	01813083          	ld	ra,24(sp)
    80003e5c:	01013403          	ld	s0,16(sp)
    80003e60:	00813483          	ld	s1,8(sp)
    80003e64:	00013903          	ld	s2,0(sp)
    80003e68:	02010113          	addi	sp,sp,32
    80003e6c:	00008067          	ret

0000000080003e70 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003e70:	fe010113          	addi	sp,sp,-32
    80003e74:	00113c23          	sd	ra,24(sp)
    80003e78:	00813823          	sd	s0,16(sp)
    80003e7c:	00913423          	sd	s1,8(sp)
    80003e80:	01213023          	sd	s2,0(sp)
    80003e84:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003e88:	00000493          	li	s1,0
    80003e8c:	0400006f          	j	80003ecc <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003e90:	00006517          	auipc	a0,0x6
    80003e94:	4f850513          	addi	a0,a0,1272 # 8000a388 <_ZZ9kPrintIntmE6digits+0x318>
    80003e98:	00002097          	auipc	ra,0x2
    80003e9c:	d48080e7          	jalr	-696(ra) # 80005be0 <_Z11printStringPKc>
    80003ea0:	00000613          	li	a2,0
    80003ea4:	00a00593          	li	a1,10
    80003ea8:	00048513          	mv	a0,s1
    80003eac:	00002097          	auipc	ra,0x2
    80003eb0:	ee4080e7          	jalr	-284(ra) # 80005d90 <_Z8printIntiii>
    80003eb4:	00006517          	auipc	a0,0x6
    80003eb8:	70450513          	addi	a0,a0,1796 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80003ebc:	00002097          	auipc	ra,0x2
    80003ec0:	d24080e7          	jalr	-732(ra) # 80005be0 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003ec4:	0014849b          	addiw	s1,s1,1
    80003ec8:	0ff4f493          	andi	s1,s1,255
    80003ecc:	00200793          	li	a5,2
    80003ed0:	fc97f0e3          	bgeu	a5,s1,80003e90 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003ed4:	00006517          	auipc	a0,0x6
    80003ed8:	4bc50513          	addi	a0,a0,1212 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80003edc:	00002097          	auipc	ra,0x2
    80003ee0:	d04080e7          	jalr	-764(ra) # 80005be0 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003ee4:	00700313          	li	t1,7
    thread_dispatch();
    80003ee8:	ffffd097          	auipc	ra,0xffffd
    80003eec:	544080e7          	jalr	1348(ra) # 8000142c <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003ef0:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003ef4:	00006517          	auipc	a0,0x6
    80003ef8:	4ac50513          	addi	a0,a0,1196 # 8000a3a0 <_ZZ9kPrintIntmE6digits+0x330>
    80003efc:	00002097          	auipc	ra,0x2
    80003f00:	ce4080e7          	jalr	-796(ra) # 80005be0 <_Z11printStringPKc>
    80003f04:	00000613          	li	a2,0
    80003f08:	00a00593          	li	a1,10
    80003f0c:	0009051b          	sext.w	a0,s2
    80003f10:	00002097          	auipc	ra,0x2
    80003f14:	e80080e7          	jalr	-384(ra) # 80005d90 <_Z8printIntiii>
    80003f18:	00006517          	auipc	a0,0x6
    80003f1c:	6a050513          	addi	a0,a0,1696 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80003f20:	00002097          	auipc	ra,0x2
    80003f24:	cc0080e7          	jalr	-832(ra) # 80005be0 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003f28:	00c00513          	li	a0,12
    80003f2c:	00000097          	auipc	ra,0x0
    80003f30:	d30080e7          	jalr	-720(ra) # 80003c5c <_ZL9fibonaccim>
    80003f34:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003f38:	00006517          	auipc	a0,0x6
    80003f3c:	47050513          	addi	a0,a0,1136 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    80003f40:	00002097          	auipc	ra,0x2
    80003f44:	ca0080e7          	jalr	-864(ra) # 80005be0 <_Z11printStringPKc>
    80003f48:	00000613          	li	a2,0
    80003f4c:	00a00593          	li	a1,10
    80003f50:	0009051b          	sext.w	a0,s2
    80003f54:	00002097          	auipc	ra,0x2
    80003f58:	e3c080e7          	jalr	-452(ra) # 80005d90 <_Z8printIntiii>
    80003f5c:	00006517          	auipc	a0,0x6
    80003f60:	65c50513          	addi	a0,a0,1628 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80003f64:	00002097          	auipc	ra,0x2
    80003f68:	c7c080e7          	jalr	-900(ra) # 80005be0 <_Z11printStringPKc>
    80003f6c:	0400006f          	j	80003fac <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003f70:	00006517          	auipc	a0,0x6
    80003f74:	41850513          	addi	a0,a0,1048 # 8000a388 <_ZZ9kPrintIntmE6digits+0x318>
    80003f78:	00002097          	auipc	ra,0x2
    80003f7c:	c68080e7          	jalr	-920(ra) # 80005be0 <_Z11printStringPKc>
    80003f80:	00000613          	li	a2,0
    80003f84:	00a00593          	li	a1,10
    80003f88:	00048513          	mv	a0,s1
    80003f8c:	00002097          	auipc	ra,0x2
    80003f90:	e04080e7          	jalr	-508(ra) # 80005d90 <_Z8printIntiii>
    80003f94:	00006517          	auipc	a0,0x6
    80003f98:	62450513          	addi	a0,a0,1572 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80003f9c:	00002097          	auipc	ra,0x2
    80003fa0:	c44080e7          	jalr	-956(ra) # 80005be0 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003fa4:	0014849b          	addiw	s1,s1,1
    80003fa8:	0ff4f493          	andi	s1,s1,255
    80003fac:	00500793          	li	a5,5
    80003fb0:	fc97f0e3          	bgeu	a5,s1,80003f70 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80003fb4:	00006517          	auipc	a0,0x6
    80003fb8:	40450513          	addi	a0,a0,1028 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    80003fbc:	00002097          	auipc	ra,0x2
    80003fc0:	c24080e7          	jalr	-988(ra) # 80005be0 <_Z11printStringPKc>
    finishedC = true;
    80003fc4:	00100793          	li	a5,1
    80003fc8:	00009717          	auipc	a4,0x9
    80003fcc:	e8f70923          	sb	a5,-366(a4) # 8000ce5a <_ZL9finishedC>
    thread_dispatch();
    80003fd0:	ffffd097          	auipc	ra,0xffffd
    80003fd4:	45c080e7          	jalr	1116(ra) # 8000142c <_Z15thread_dispatchv>
}
    80003fd8:	01813083          	ld	ra,24(sp)
    80003fdc:	01013403          	ld	s0,16(sp)
    80003fe0:	00813483          	ld	s1,8(sp)
    80003fe4:	00013903          	ld	s2,0(sp)
    80003fe8:	02010113          	addi	sp,sp,32
    80003fec:	00008067          	ret

0000000080003ff0 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003ff0:	fe010113          	addi	sp,sp,-32
    80003ff4:	00113c23          	sd	ra,24(sp)
    80003ff8:	00813823          	sd	s0,16(sp)
    80003ffc:	00913423          	sd	s1,8(sp)
    80004000:	01213023          	sd	s2,0(sp)
    80004004:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004008:	00a00493          	li	s1,10
    8000400c:	0400006f          	j	8000404c <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004010:	00006517          	auipc	a0,0x6
    80004014:	3b850513          	addi	a0,a0,952 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80004018:	00002097          	auipc	ra,0x2
    8000401c:	bc8080e7          	jalr	-1080(ra) # 80005be0 <_Z11printStringPKc>
    80004020:	00000613          	li	a2,0
    80004024:	00a00593          	li	a1,10
    80004028:	00048513          	mv	a0,s1
    8000402c:	00002097          	auipc	ra,0x2
    80004030:	d64080e7          	jalr	-668(ra) # 80005d90 <_Z8printIntiii>
    80004034:	00006517          	auipc	a0,0x6
    80004038:	58450513          	addi	a0,a0,1412 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    8000403c:	00002097          	auipc	ra,0x2
    80004040:	ba4080e7          	jalr	-1116(ra) # 80005be0 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004044:	0014849b          	addiw	s1,s1,1
    80004048:	0ff4f493          	andi	s1,s1,255
    8000404c:	00c00793          	li	a5,12
    80004050:	fc97f0e3          	bgeu	a5,s1,80004010 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80004054:	00006517          	auipc	a0,0x6
    80004058:	37c50513          	addi	a0,a0,892 # 8000a3d0 <_ZZ9kPrintIntmE6digits+0x360>
    8000405c:	00002097          	auipc	ra,0x2
    80004060:	b84080e7          	jalr	-1148(ra) # 80005be0 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004064:	00500313          	li	t1,5
    thread_dispatch();
    80004068:	ffffd097          	auipc	ra,0xffffd
    8000406c:	3c4080e7          	jalr	964(ra) # 8000142c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004070:	01000513          	li	a0,16
    80004074:	00000097          	auipc	ra,0x0
    80004078:	be8080e7          	jalr	-1048(ra) # 80003c5c <_ZL9fibonaccim>
    8000407c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004080:	00006517          	auipc	a0,0x6
    80004084:	36050513          	addi	a0,a0,864 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80004088:	00002097          	auipc	ra,0x2
    8000408c:	b58080e7          	jalr	-1192(ra) # 80005be0 <_Z11printStringPKc>
    80004090:	00000613          	li	a2,0
    80004094:	00a00593          	li	a1,10
    80004098:	0009051b          	sext.w	a0,s2
    8000409c:	00002097          	auipc	ra,0x2
    800040a0:	cf4080e7          	jalr	-780(ra) # 80005d90 <_Z8printIntiii>
    800040a4:	00006517          	auipc	a0,0x6
    800040a8:	51450513          	addi	a0,a0,1300 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800040ac:	00002097          	auipc	ra,0x2
    800040b0:	b34080e7          	jalr	-1228(ra) # 80005be0 <_Z11printStringPKc>
    800040b4:	0400006f          	j	800040f4 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800040b8:	00006517          	auipc	a0,0x6
    800040bc:	31050513          	addi	a0,a0,784 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    800040c0:	00002097          	auipc	ra,0x2
    800040c4:	b20080e7          	jalr	-1248(ra) # 80005be0 <_Z11printStringPKc>
    800040c8:	00000613          	li	a2,0
    800040cc:	00a00593          	li	a1,10
    800040d0:	00048513          	mv	a0,s1
    800040d4:	00002097          	auipc	ra,0x2
    800040d8:	cbc080e7          	jalr	-836(ra) # 80005d90 <_Z8printIntiii>
    800040dc:	00006517          	auipc	a0,0x6
    800040e0:	4dc50513          	addi	a0,a0,1244 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800040e4:	00002097          	auipc	ra,0x2
    800040e8:	afc080e7          	jalr	-1284(ra) # 80005be0 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800040ec:	0014849b          	addiw	s1,s1,1
    800040f0:	0ff4f493          	andi	s1,s1,255
    800040f4:	00f00793          	li	a5,15
    800040f8:	fc97f0e3          	bgeu	a5,s1,800040b8 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800040fc:	00006517          	auipc	a0,0x6
    80004100:	2f450513          	addi	a0,a0,756 # 8000a3f0 <_ZZ9kPrintIntmE6digits+0x380>
    80004104:	00002097          	auipc	ra,0x2
    80004108:	adc080e7          	jalr	-1316(ra) # 80005be0 <_Z11printStringPKc>
    finishedD = true;
    8000410c:	00100793          	li	a5,1
    80004110:	00009717          	auipc	a4,0x9
    80004114:	d4f705a3          	sb	a5,-693(a4) # 8000ce5b <_ZL9finishedD>
    thread_dispatch();
    80004118:	ffffd097          	auipc	ra,0xffffd
    8000411c:	314080e7          	jalr	788(ra) # 8000142c <_Z15thread_dispatchv>
}
    80004120:	01813083          	ld	ra,24(sp)
    80004124:	01013403          	ld	s0,16(sp)
    80004128:	00813483          	ld	s1,8(sp)
    8000412c:	00013903          	ld	s2,0(sp)
    80004130:	02010113          	addi	sp,sp,32
    80004134:	00008067          	ret

0000000080004138 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80004138:	fc010113          	addi	sp,sp,-64
    8000413c:	02113c23          	sd	ra,56(sp)
    80004140:	02813823          	sd	s0,48(sp)
    80004144:	02913423          	sd	s1,40(sp)
    80004148:	03213023          	sd	s2,32(sp)
    8000414c:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80004150:	02000513          	li	a0,32
    80004154:	ffffe097          	auipc	ra,0xffffe
    80004158:	628080e7          	jalr	1576(ra) # 8000277c <_Znwm>
    8000415c:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004160:	fffff097          	auipc	ra,0xfffff
    80004164:	8ec080e7          	jalr	-1812(ra) # 80002a4c <_ZN6ThreadC1Ev>
    80004168:	00009797          	auipc	a5,0x9
    8000416c:	96878793          	addi	a5,a5,-1688 # 8000cad0 <_ZTV7WorkerA+0x10>
    80004170:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004174:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004178:	00006517          	auipc	a0,0x6
    8000417c:	28850513          	addi	a0,a0,648 # 8000a400 <_ZZ9kPrintIntmE6digits+0x390>
    80004180:	00002097          	auipc	ra,0x2
    80004184:	a60080e7          	jalr	-1440(ra) # 80005be0 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004188:	02000513          	li	a0,32
    8000418c:	ffffe097          	auipc	ra,0xffffe
    80004190:	5f0080e7          	jalr	1520(ra) # 8000277c <_Znwm>
    80004194:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004198:	fffff097          	auipc	ra,0xfffff
    8000419c:	8b4080e7          	jalr	-1868(ra) # 80002a4c <_ZN6ThreadC1Ev>
    800041a0:	00009797          	auipc	a5,0x9
    800041a4:	95878793          	addi	a5,a5,-1704 # 8000caf8 <_ZTV7WorkerB+0x10>
    800041a8:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    800041ac:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800041b0:	00006517          	auipc	a0,0x6
    800041b4:	26850513          	addi	a0,a0,616 # 8000a418 <_ZZ9kPrintIntmE6digits+0x3a8>
    800041b8:	00002097          	auipc	ra,0x2
    800041bc:	a28080e7          	jalr	-1496(ra) # 80005be0 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800041c0:	02000513          	li	a0,32
    800041c4:	ffffe097          	auipc	ra,0xffffe
    800041c8:	5b8080e7          	jalr	1464(ra) # 8000277c <_Znwm>
    800041cc:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800041d0:	fffff097          	auipc	ra,0xfffff
    800041d4:	87c080e7          	jalr	-1924(ra) # 80002a4c <_ZN6ThreadC1Ev>
    800041d8:	00009797          	auipc	a5,0x9
    800041dc:	94878793          	addi	a5,a5,-1720 # 8000cb20 <_ZTV7WorkerC+0x10>
    800041e0:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800041e4:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800041e8:	00006517          	auipc	a0,0x6
    800041ec:	24850513          	addi	a0,a0,584 # 8000a430 <_ZZ9kPrintIntmE6digits+0x3c0>
    800041f0:	00002097          	auipc	ra,0x2
    800041f4:	9f0080e7          	jalr	-1552(ra) # 80005be0 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800041f8:	02000513          	li	a0,32
    800041fc:	ffffe097          	auipc	ra,0xffffe
    80004200:	580080e7          	jalr	1408(ra) # 8000277c <_Znwm>
    80004204:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004208:	fffff097          	auipc	ra,0xfffff
    8000420c:	844080e7          	jalr	-1980(ra) # 80002a4c <_ZN6ThreadC1Ev>
    80004210:	00009797          	auipc	a5,0x9
    80004214:	93878793          	addi	a5,a5,-1736 # 8000cb48 <_ZTV7WorkerD+0x10>
    80004218:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    8000421c:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004220:	00006517          	auipc	a0,0x6
    80004224:	22850513          	addi	a0,a0,552 # 8000a448 <_ZZ9kPrintIntmE6digits+0x3d8>
    80004228:	00002097          	auipc	ra,0x2
    8000422c:	9b8080e7          	jalr	-1608(ra) # 80005be0 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004230:	00000493          	li	s1,0
    80004234:	00300793          	li	a5,3
    80004238:	0297c663          	blt	a5,s1,80004264 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    8000423c:	00349793          	slli	a5,s1,0x3
    80004240:	fe040713          	addi	a4,s0,-32
    80004244:	00f707b3          	add	a5,a4,a5
    80004248:	fe07b503          	ld	a0,-32(a5)
    8000424c:	ffffe097          	auipc	ra,0xffffe
    80004250:	6e0080e7          	jalr	1760(ra) # 8000292c <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80004254:	0014849b          	addiw	s1,s1,1
    80004258:	fddff06f          	j	80004234 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    8000425c:	ffffe097          	auipc	ra,0xffffe
    80004260:	734080e7          	jalr	1844(ra) # 80002990 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004264:	00009797          	auipc	a5,0x9
    80004268:	bf47c783          	lbu	a5,-1036(a5) # 8000ce58 <_ZL9finishedA>
    8000426c:	fe0788e3          	beqz	a5,8000425c <_Z20Threads_CPP_API_testv+0x124>
    80004270:	00009797          	auipc	a5,0x9
    80004274:	be97c783          	lbu	a5,-1047(a5) # 8000ce59 <_ZL9finishedB>
    80004278:	fe0782e3          	beqz	a5,8000425c <_Z20Threads_CPP_API_testv+0x124>
    8000427c:	00009797          	auipc	a5,0x9
    80004280:	bde7c783          	lbu	a5,-1058(a5) # 8000ce5a <_ZL9finishedC>
    80004284:	fc078ce3          	beqz	a5,8000425c <_Z20Threads_CPP_API_testv+0x124>
    80004288:	00009797          	auipc	a5,0x9
    8000428c:	bd37c783          	lbu	a5,-1069(a5) # 8000ce5b <_ZL9finishedD>
    80004290:	fc0786e3          	beqz	a5,8000425c <_Z20Threads_CPP_API_testv+0x124>
    80004294:	fc040493          	addi	s1,s0,-64
    80004298:	0080006f          	j	800042a0 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) {
    8000429c:	00848493          	addi	s1,s1,8
    800042a0:	fe040793          	addi	a5,s0,-32
    800042a4:	08f48663          	beq	s1,a5,80004330 <_Z20Threads_CPP_API_testv+0x1f8>
    800042a8:	0004b503          	ld	a0,0(s1)
		delete thread;
    800042ac:	fe0508e3          	beqz	a0,8000429c <_Z20Threads_CPP_API_testv+0x164>
    800042b0:	00053783          	ld	a5,0(a0)
    800042b4:	0087b783          	ld	a5,8(a5)
    800042b8:	000780e7          	jalr	a5
    800042bc:	fe1ff06f          	j	8000429c <_Z20Threads_CPP_API_testv+0x164>
    800042c0:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800042c4:	00048513          	mv	a0,s1
    800042c8:	ffffe097          	auipc	ra,0xffffe
    800042cc:	504080e7          	jalr	1284(ra) # 800027cc <_ZdlPv>
    800042d0:	00090513          	mv	a0,s2
    800042d4:	0000a097          	auipc	ra,0xa
    800042d8:	ca4080e7          	jalr	-860(ra) # 8000df78 <_Unwind_Resume>
    800042dc:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800042e0:	00048513          	mv	a0,s1
    800042e4:	ffffe097          	auipc	ra,0xffffe
    800042e8:	4e8080e7          	jalr	1256(ra) # 800027cc <_ZdlPv>
    800042ec:	00090513          	mv	a0,s2
    800042f0:	0000a097          	auipc	ra,0xa
    800042f4:	c88080e7          	jalr	-888(ra) # 8000df78 <_Unwind_Resume>
    800042f8:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800042fc:	00048513          	mv	a0,s1
    80004300:	ffffe097          	auipc	ra,0xffffe
    80004304:	4cc080e7          	jalr	1228(ra) # 800027cc <_ZdlPv>
    80004308:	00090513          	mv	a0,s2
    8000430c:	0000a097          	auipc	ra,0xa
    80004310:	c6c080e7          	jalr	-916(ra) # 8000df78 <_Unwind_Resume>
    80004314:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004318:	00048513          	mv	a0,s1
    8000431c:	ffffe097          	auipc	ra,0xffffe
    80004320:	4b0080e7          	jalr	1200(ra) # 800027cc <_ZdlPv>
    80004324:	00090513          	mv	a0,s2
    80004328:	0000a097          	auipc	ra,0xa
    8000432c:	c50080e7          	jalr	-944(ra) # 8000df78 <_Unwind_Resume>
	}
}
    80004330:	03813083          	ld	ra,56(sp)
    80004334:	03013403          	ld	s0,48(sp)
    80004338:	02813483          	ld	s1,40(sp)
    8000433c:	02013903          	ld	s2,32(sp)
    80004340:	04010113          	addi	sp,sp,64
    80004344:	00008067          	ret

0000000080004348 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004348:	ff010113          	addi	sp,sp,-16
    8000434c:	00113423          	sd	ra,8(sp)
    80004350:	00813023          	sd	s0,0(sp)
    80004354:	01010413          	addi	s0,sp,16
    80004358:	00008797          	auipc	a5,0x8
    8000435c:	77878793          	addi	a5,a5,1912 # 8000cad0 <_ZTV7WorkerA+0x10>
    80004360:	00f53023          	sd	a5,0(a0)
    80004364:	ffffe097          	auipc	ra,0xffffe
    80004368:	328080e7          	jalr	808(ra) # 8000268c <_ZN6ThreadD1Ev>
    8000436c:	00813083          	ld	ra,8(sp)
    80004370:	00013403          	ld	s0,0(sp)
    80004374:	01010113          	addi	sp,sp,16
    80004378:	00008067          	ret

000000008000437c <_ZN7WorkerAD0Ev>:
    8000437c:	fe010113          	addi	sp,sp,-32
    80004380:	00113c23          	sd	ra,24(sp)
    80004384:	00813823          	sd	s0,16(sp)
    80004388:	00913423          	sd	s1,8(sp)
    8000438c:	02010413          	addi	s0,sp,32
    80004390:	00050493          	mv	s1,a0
    80004394:	00008797          	auipc	a5,0x8
    80004398:	73c78793          	addi	a5,a5,1852 # 8000cad0 <_ZTV7WorkerA+0x10>
    8000439c:	00f53023          	sd	a5,0(a0)
    800043a0:	ffffe097          	auipc	ra,0xffffe
    800043a4:	2ec080e7          	jalr	748(ra) # 8000268c <_ZN6ThreadD1Ev>
    800043a8:	00048513          	mv	a0,s1
    800043ac:	ffffe097          	auipc	ra,0xffffe
    800043b0:	420080e7          	jalr	1056(ra) # 800027cc <_ZdlPv>
    800043b4:	01813083          	ld	ra,24(sp)
    800043b8:	01013403          	ld	s0,16(sp)
    800043bc:	00813483          	ld	s1,8(sp)
    800043c0:	02010113          	addi	sp,sp,32
    800043c4:	00008067          	ret

00000000800043c8 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800043c8:	ff010113          	addi	sp,sp,-16
    800043cc:	00113423          	sd	ra,8(sp)
    800043d0:	00813023          	sd	s0,0(sp)
    800043d4:	01010413          	addi	s0,sp,16
    800043d8:	00008797          	auipc	a5,0x8
    800043dc:	72078793          	addi	a5,a5,1824 # 8000caf8 <_ZTV7WorkerB+0x10>
    800043e0:	00f53023          	sd	a5,0(a0)
    800043e4:	ffffe097          	auipc	ra,0xffffe
    800043e8:	2a8080e7          	jalr	680(ra) # 8000268c <_ZN6ThreadD1Ev>
    800043ec:	00813083          	ld	ra,8(sp)
    800043f0:	00013403          	ld	s0,0(sp)
    800043f4:	01010113          	addi	sp,sp,16
    800043f8:	00008067          	ret

00000000800043fc <_ZN7WorkerBD0Ev>:
    800043fc:	fe010113          	addi	sp,sp,-32
    80004400:	00113c23          	sd	ra,24(sp)
    80004404:	00813823          	sd	s0,16(sp)
    80004408:	00913423          	sd	s1,8(sp)
    8000440c:	02010413          	addi	s0,sp,32
    80004410:	00050493          	mv	s1,a0
    80004414:	00008797          	auipc	a5,0x8
    80004418:	6e478793          	addi	a5,a5,1764 # 8000caf8 <_ZTV7WorkerB+0x10>
    8000441c:	00f53023          	sd	a5,0(a0)
    80004420:	ffffe097          	auipc	ra,0xffffe
    80004424:	26c080e7          	jalr	620(ra) # 8000268c <_ZN6ThreadD1Ev>
    80004428:	00048513          	mv	a0,s1
    8000442c:	ffffe097          	auipc	ra,0xffffe
    80004430:	3a0080e7          	jalr	928(ra) # 800027cc <_ZdlPv>
    80004434:	01813083          	ld	ra,24(sp)
    80004438:	01013403          	ld	s0,16(sp)
    8000443c:	00813483          	ld	s1,8(sp)
    80004440:	02010113          	addi	sp,sp,32
    80004444:	00008067          	ret

0000000080004448 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004448:	ff010113          	addi	sp,sp,-16
    8000444c:	00113423          	sd	ra,8(sp)
    80004450:	00813023          	sd	s0,0(sp)
    80004454:	01010413          	addi	s0,sp,16
    80004458:	00008797          	auipc	a5,0x8
    8000445c:	6c878793          	addi	a5,a5,1736 # 8000cb20 <_ZTV7WorkerC+0x10>
    80004460:	00f53023          	sd	a5,0(a0)
    80004464:	ffffe097          	auipc	ra,0xffffe
    80004468:	228080e7          	jalr	552(ra) # 8000268c <_ZN6ThreadD1Ev>
    8000446c:	00813083          	ld	ra,8(sp)
    80004470:	00013403          	ld	s0,0(sp)
    80004474:	01010113          	addi	sp,sp,16
    80004478:	00008067          	ret

000000008000447c <_ZN7WorkerCD0Ev>:
    8000447c:	fe010113          	addi	sp,sp,-32
    80004480:	00113c23          	sd	ra,24(sp)
    80004484:	00813823          	sd	s0,16(sp)
    80004488:	00913423          	sd	s1,8(sp)
    8000448c:	02010413          	addi	s0,sp,32
    80004490:	00050493          	mv	s1,a0
    80004494:	00008797          	auipc	a5,0x8
    80004498:	68c78793          	addi	a5,a5,1676 # 8000cb20 <_ZTV7WorkerC+0x10>
    8000449c:	00f53023          	sd	a5,0(a0)
    800044a0:	ffffe097          	auipc	ra,0xffffe
    800044a4:	1ec080e7          	jalr	492(ra) # 8000268c <_ZN6ThreadD1Ev>
    800044a8:	00048513          	mv	a0,s1
    800044ac:	ffffe097          	auipc	ra,0xffffe
    800044b0:	320080e7          	jalr	800(ra) # 800027cc <_ZdlPv>
    800044b4:	01813083          	ld	ra,24(sp)
    800044b8:	01013403          	ld	s0,16(sp)
    800044bc:	00813483          	ld	s1,8(sp)
    800044c0:	02010113          	addi	sp,sp,32
    800044c4:	00008067          	ret

00000000800044c8 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800044c8:	ff010113          	addi	sp,sp,-16
    800044cc:	00113423          	sd	ra,8(sp)
    800044d0:	00813023          	sd	s0,0(sp)
    800044d4:	01010413          	addi	s0,sp,16
    800044d8:	00008797          	auipc	a5,0x8
    800044dc:	67078793          	addi	a5,a5,1648 # 8000cb48 <_ZTV7WorkerD+0x10>
    800044e0:	00f53023          	sd	a5,0(a0)
    800044e4:	ffffe097          	auipc	ra,0xffffe
    800044e8:	1a8080e7          	jalr	424(ra) # 8000268c <_ZN6ThreadD1Ev>
    800044ec:	00813083          	ld	ra,8(sp)
    800044f0:	00013403          	ld	s0,0(sp)
    800044f4:	01010113          	addi	sp,sp,16
    800044f8:	00008067          	ret

00000000800044fc <_ZN7WorkerDD0Ev>:
    800044fc:	fe010113          	addi	sp,sp,-32
    80004500:	00113c23          	sd	ra,24(sp)
    80004504:	00813823          	sd	s0,16(sp)
    80004508:	00913423          	sd	s1,8(sp)
    8000450c:	02010413          	addi	s0,sp,32
    80004510:	00050493          	mv	s1,a0
    80004514:	00008797          	auipc	a5,0x8
    80004518:	63478793          	addi	a5,a5,1588 # 8000cb48 <_ZTV7WorkerD+0x10>
    8000451c:	00f53023          	sd	a5,0(a0)
    80004520:	ffffe097          	auipc	ra,0xffffe
    80004524:	16c080e7          	jalr	364(ra) # 8000268c <_ZN6ThreadD1Ev>
    80004528:	00048513          	mv	a0,s1
    8000452c:	ffffe097          	auipc	ra,0xffffe
    80004530:	2a0080e7          	jalr	672(ra) # 800027cc <_ZdlPv>
    80004534:	01813083          	ld	ra,24(sp)
    80004538:	01013403          	ld	s0,16(sp)
    8000453c:	00813483          	ld	s1,8(sp)
    80004540:	02010113          	addi	sp,sp,32
    80004544:	00008067          	ret

0000000080004548 <_ZN7WorkerA3runEv>:
    void run() override {
    80004548:	ff010113          	addi	sp,sp,-16
    8000454c:	00113423          	sd	ra,8(sp)
    80004550:	00813023          	sd	s0,0(sp)
    80004554:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004558:	00000593          	li	a1,0
    8000455c:	fffff097          	auipc	ra,0xfffff
    80004560:	774080e7          	jalr	1908(ra) # 80003cd0 <_ZN7WorkerA11workerBodyAEPv>
    }
    80004564:	00813083          	ld	ra,8(sp)
    80004568:	00013403          	ld	s0,0(sp)
    8000456c:	01010113          	addi	sp,sp,16
    80004570:	00008067          	ret

0000000080004574 <_ZN7WorkerB3runEv>:
    void run() override {
    80004574:	ff010113          	addi	sp,sp,-16
    80004578:	00113423          	sd	ra,8(sp)
    8000457c:	00813023          	sd	s0,0(sp)
    80004580:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004584:	00000593          	li	a1,0
    80004588:	00000097          	auipc	ra,0x0
    8000458c:	814080e7          	jalr	-2028(ra) # 80003d9c <_ZN7WorkerB11workerBodyBEPv>
    }
    80004590:	00813083          	ld	ra,8(sp)
    80004594:	00013403          	ld	s0,0(sp)
    80004598:	01010113          	addi	sp,sp,16
    8000459c:	00008067          	ret

00000000800045a0 <_ZN7WorkerC3runEv>:
    void run() override {
    800045a0:	ff010113          	addi	sp,sp,-16
    800045a4:	00113423          	sd	ra,8(sp)
    800045a8:	00813023          	sd	s0,0(sp)
    800045ac:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800045b0:	00000593          	li	a1,0
    800045b4:	00000097          	auipc	ra,0x0
    800045b8:	8bc080e7          	jalr	-1860(ra) # 80003e70 <_ZN7WorkerC11workerBodyCEPv>
    }
    800045bc:	00813083          	ld	ra,8(sp)
    800045c0:	00013403          	ld	s0,0(sp)
    800045c4:	01010113          	addi	sp,sp,16
    800045c8:	00008067          	ret

00000000800045cc <_ZN7WorkerD3runEv>:
    void run() override {
    800045cc:	ff010113          	addi	sp,sp,-16
    800045d0:	00113423          	sd	ra,8(sp)
    800045d4:	00813023          	sd	s0,0(sp)
    800045d8:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800045dc:	00000593          	li	a1,0
    800045e0:	00000097          	auipc	ra,0x0
    800045e4:	a10080e7          	jalr	-1520(ra) # 80003ff0 <_ZN7WorkerD11workerBodyDEPv>
    }
    800045e8:	00813083          	ld	ra,8(sp)
    800045ec:	00013403          	ld	s0,0(sp)
    800045f0:	01010113          	addi	sp,sp,16
    800045f4:	00008067          	ret

00000000800045f8 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800045f8:	f8010113          	addi	sp,sp,-128
    800045fc:	06113c23          	sd	ra,120(sp)
    80004600:	06813823          	sd	s0,112(sp)
    80004604:	06913423          	sd	s1,104(sp)
    80004608:	07213023          	sd	s2,96(sp)
    8000460c:	05313c23          	sd	s3,88(sp)
    80004610:	05413823          	sd	s4,80(sp)
    80004614:	05513423          	sd	s5,72(sp)
    80004618:	05613023          	sd	s6,64(sp)
    8000461c:	03713c23          	sd	s7,56(sp)
    80004620:	03813823          	sd	s8,48(sp)
    80004624:	03913423          	sd	s9,40(sp)
    80004628:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    8000462c:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004630:	00006517          	auipc	a0,0x6
    80004634:	c4050513          	addi	a0,a0,-960 # 8000a270 <_ZZ9kPrintIntmE6digits+0x200>
    80004638:	00001097          	auipc	ra,0x1
    8000463c:	5a8080e7          	jalr	1448(ra) # 80005be0 <_Z11printStringPKc>
    getString(input, 30);
    80004640:	01e00593          	li	a1,30
    80004644:	f8040493          	addi	s1,s0,-128
    80004648:	00048513          	mv	a0,s1
    8000464c:	00001097          	auipc	ra,0x1
    80004650:	61c080e7          	jalr	1564(ra) # 80005c68 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004654:	00048513          	mv	a0,s1
    80004658:	00001097          	auipc	ra,0x1
    8000465c:	6e8080e7          	jalr	1768(ra) # 80005d40 <_Z11stringToIntPKc>
    80004660:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004664:	00006517          	auipc	a0,0x6
    80004668:	c2c50513          	addi	a0,a0,-980 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    8000466c:	00001097          	auipc	ra,0x1
    80004670:	574080e7          	jalr	1396(ra) # 80005be0 <_Z11printStringPKc>
    getString(input, 30);
    80004674:	01e00593          	li	a1,30
    80004678:	00048513          	mv	a0,s1
    8000467c:	00001097          	auipc	ra,0x1
    80004680:	5ec080e7          	jalr	1516(ra) # 80005c68 <_Z9getStringPci>
    n = stringToInt(input);
    80004684:	00048513          	mv	a0,s1
    80004688:	00001097          	auipc	ra,0x1
    8000468c:	6b8080e7          	jalr	1720(ra) # 80005d40 <_Z11stringToIntPKc>
    80004690:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004694:	00006517          	auipc	a0,0x6
    80004698:	c1c50513          	addi	a0,a0,-996 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    8000469c:	00001097          	auipc	ra,0x1
    800046a0:	544080e7          	jalr	1348(ra) # 80005be0 <_Z11printStringPKc>
    printInt(threadNum);
    800046a4:	00000613          	li	a2,0
    800046a8:	00a00593          	li	a1,10
    800046ac:	00098513          	mv	a0,s3
    800046b0:	00001097          	auipc	ra,0x1
    800046b4:	6e0080e7          	jalr	1760(ra) # 80005d90 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800046b8:	00006517          	auipc	a0,0x6
    800046bc:	c1050513          	addi	a0,a0,-1008 # 8000a2c8 <_ZZ9kPrintIntmE6digits+0x258>
    800046c0:	00001097          	auipc	ra,0x1
    800046c4:	520080e7          	jalr	1312(ra) # 80005be0 <_Z11printStringPKc>
    printInt(n);
    800046c8:	00000613          	li	a2,0
    800046cc:	00a00593          	li	a1,10
    800046d0:	00048513          	mv	a0,s1
    800046d4:	00001097          	auipc	ra,0x1
    800046d8:	6bc080e7          	jalr	1724(ra) # 80005d90 <_Z8printIntiii>
    printString(".\n");
    800046dc:	00006517          	auipc	a0,0x6
    800046e0:	c0450513          	addi	a0,a0,-1020 # 8000a2e0 <_ZZ9kPrintIntmE6digits+0x270>
    800046e4:	00001097          	auipc	ra,0x1
    800046e8:	4fc080e7          	jalr	1276(ra) # 80005be0 <_Z11printStringPKc>
    if (threadNum > n) {
    800046ec:	0334c463          	blt	s1,s3,80004714 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800046f0:	03305c63          	blez	s3,80004728 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800046f4:	03800513          	li	a0,56
    800046f8:	ffffe097          	auipc	ra,0xffffe
    800046fc:	084080e7          	jalr	132(ra) # 8000277c <_Znwm>
    80004700:	00050a93          	mv	s5,a0
    80004704:	00048593          	mv	a1,s1
    80004708:	00001097          	auipc	ra,0x1
    8000470c:	7a8080e7          	jalr	1960(ra) # 80005eb0 <_ZN9BufferCPPC1Ei>
    80004710:	0300006f          	j	80004740 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004714:	00006517          	auipc	a0,0x6
    80004718:	bd450513          	addi	a0,a0,-1068 # 8000a2e8 <_ZZ9kPrintIntmE6digits+0x278>
    8000471c:	00001097          	auipc	ra,0x1
    80004720:	4c4080e7          	jalr	1220(ra) # 80005be0 <_Z11printStringPKc>
        return;
    80004724:	0140006f          	j	80004738 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004728:	00006517          	auipc	a0,0x6
    8000472c:	c0050513          	addi	a0,a0,-1024 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    80004730:	00001097          	auipc	ra,0x1
    80004734:	4b0080e7          	jalr	1200(ra) # 80005be0 <_Z11printStringPKc>
        return;
    80004738:	000c0113          	mv	sp,s8
    8000473c:	2140006f          	j	80004950 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004740:	01000513          	li	a0,16
    80004744:	ffffe097          	auipc	ra,0xffffe
    80004748:	038080e7          	jalr	56(ra) # 8000277c <_Znwm>
    8000474c:	00050913          	mv	s2,a0
    80004750:	00000593          	li	a1,0
    80004754:	ffffe097          	auipc	ra,0xffffe
    80004758:	374080e7          	jalr	884(ra) # 80002ac8 <_ZN9SemaphoreC1Ej>
    8000475c:	00008797          	auipc	a5,0x8
    80004760:	7127b623          	sd	s2,1804(a5) # 8000ce68 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004764:	00399793          	slli	a5,s3,0x3
    80004768:	00f78793          	addi	a5,a5,15
    8000476c:	ff07f793          	andi	a5,a5,-16
    80004770:	40f10133          	sub	sp,sp,a5
    80004774:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004778:	0019871b          	addiw	a4,s3,1
    8000477c:	00171793          	slli	a5,a4,0x1
    80004780:	00e787b3          	add	a5,a5,a4
    80004784:	00379793          	slli	a5,a5,0x3
    80004788:	00f78793          	addi	a5,a5,15
    8000478c:	ff07f793          	andi	a5,a5,-16
    80004790:	40f10133          	sub	sp,sp,a5
    80004794:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004798:	00199493          	slli	s1,s3,0x1
    8000479c:	013484b3          	add	s1,s1,s3
    800047a0:	00349493          	slli	s1,s1,0x3
    800047a4:	009b04b3          	add	s1,s6,s1
    800047a8:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    800047ac:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    800047b0:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800047b4:	02800513          	li	a0,40
    800047b8:	ffffe097          	auipc	ra,0xffffe
    800047bc:	fc4080e7          	jalr	-60(ra) # 8000277c <_Znwm>
    800047c0:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    800047c4:	ffffe097          	auipc	ra,0xffffe
    800047c8:	288080e7          	jalr	648(ra) # 80002a4c <_ZN6ThreadC1Ev>
    800047cc:	00008797          	auipc	a5,0x8
    800047d0:	3f478793          	addi	a5,a5,1012 # 8000cbc0 <_ZTV8Consumer+0x10>
    800047d4:	00fbb023          	sd	a5,0(s7)
    800047d8:	029bb023          	sd	s1,32(s7)
    consumer->start();
    800047dc:	000b8513          	mv	a0,s7
    800047e0:	ffffe097          	auipc	ra,0xffffe
    800047e4:	14c080e7          	jalr	332(ra) # 8000292c <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800047e8:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800047ec:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800047f0:	00008797          	auipc	a5,0x8
    800047f4:	6787b783          	ld	a5,1656(a5) # 8000ce68 <_ZL10waitForAll>
    800047f8:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800047fc:	02800513          	li	a0,40
    80004800:	ffffe097          	auipc	ra,0xffffe
    80004804:	f7c080e7          	jalr	-132(ra) # 8000277c <_Znwm>
    80004808:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    8000480c:	ffffe097          	auipc	ra,0xffffe
    80004810:	240080e7          	jalr	576(ra) # 80002a4c <_ZN6ThreadC1Ev>
    80004814:	00008797          	auipc	a5,0x8
    80004818:	35c78793          	addi	a5,a5,860 # 8000cb70 <_ZTV16ProducerKeyborad+0x10>
    8000481c:	00f4b023          	sd	a5,0(s1)
    80004820:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004824:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004828:	00048513          	mv	a0,s1
    8000482c:	ffffe097          	auipc	ra,0xffffe
    80004830:	100080e7          	jalr	256(ra) # 8000292c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004834:	00100913          	li	s2,1
    80004838:	0300006f          	j	80004868 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    8000483c:	00008797          	auipc	a5,0x8
    80004840:	35c78793          	addi	a5,a5,860 # 8000cb98 <_ZTV8Producer+0x10>
    80004844:	00fcb023          	sd	a5,0(s9)
    80004848:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    8000484c:	00391793          	slli	a5,s2,0x3
    80004850:	00fa07b3          	add	a5,s4,a5
    80004854:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004858:	000c8513          	mv	a0,s9
    8000485c:	ffffe097          	auipc	ra,0xffffe
    80004860:	0d0080e7          	jalr	208(ra) # 8000292c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004864:	0019091b          	addiw	s2,s2,1
    80004868:	05395263          	bge	s2,s3,800048ac <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    8000486c:	00191493          	slli	s1,s2,0x1
    80004870:	012484b3          	add	s1,s1,s2
    80004874:	00349493          	slli	s1,s1,0x3
    80004878:	009b04b3          	add	s1,s6,s1
    8000487c:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004880:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004884:	00008797          	auipc	a5,0x8
    80004888:	5e47b783          	ld	a5,1508(a5) # 8000ce68 <_ZL10waitForAll>
    8000488c:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004890:	02800513          	li	a0,40
    80004894:	ffffe097          	auipc	ra,0xffffe
    80004898:	ee8080e7          	jalr	-280(ra) # 8000277c <_Znwm>
    8000489c:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800048a0:	ffffe097          	auipc	ra,0xffffe
    800048a4:	1ac080e7          	jalr	428(ra) # 80002a4c <_ZN6ThreadC1Ev>
    800048a8:	f95ff06f          	j	8000483c <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    800048ac:	ffffe097          	auipc	ra,0xffffe
    800048b0:	0e4080e7          	jalr	228(ra) # 80002990 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800048b4:	00000493          	li	s1,0
    800048b8:	0099ce63          	blt	s3,s1,800048d4 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    800048bc:	00008517          	auipc	a0,0x8
    800048c0:	5ac53503          	ld	a0,1452(a0) # 8000ce68 <_ZL10waitForAll>
    800048c4:	ffffe097          	auipc	ra,0xffffe
    800048c8:	23c080e7          	jalr	572(ra) # 80002b00 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800048cc:	0014849b          	addiw	s1,s1,1
    800048d0:	fe9ff06f          	j	800048b8 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    800048d4:	00008517          	auipc	a0,0x8
    800048d8:	59453503          	ld	a0,1428(a0) # 8000ce68 <_ZL10waitForAll>
    800048dc:	00050863          	beqz	a0,800048ec <_Z20testConsumerProducerv+0x2f4>
    800048e0:	00053783          	ld	a5,0(a0)
    800048e4:	0087b783          	ld	a5,8(a5)
    800048e8:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800048ec:	00000493          	li	s1,0
    800048f0:	0080006f          	j	800048f8 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800048f4:	0014849b          	addiw	s1,s1,1
    800048f8:	0334d263          	bge	s1,s3,8000491c <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800048fc:	00349793          	slli	a5,s1,0x3
    80004900:	00fa07b3          	add	a5,s4,a5
    80004904:	0007b503          	ld	a0,0(a5)
    80004908:	fe0506e3          	beqz	a0,800048f4 <_Z20testConsumerProducerv+0x2fc>
    8000490c:	00053783          	ld	a5,0(a0)
    80004910:	0087b783          	ld	a5,8(a5)
    80004914:	000780e7          	jalr	a5
    80004918:	fddff06f          	j	800048f4 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    8000491c:	000b8a63          	beqz	s7,80004930 <_Z20testConsumerProducerv+0x338>
    80004920:	000bb783          	ld	a5,0(s7)
    80004924:	0087b783          	ld	a5,8(a5)
    80004928:	000b8513          	mv	a0,s7
    8000492c:	000780e7          	jalr	a5
    delete buffer;
    80004930:	000a8e63          	beqz	s5,8000494c <_Z20testConsumerProducerv+0x354>
    80004934:	000a8513          	mv	a0,s5
    80004938:	00002097          	auipc	ra,0x2
    8000493c:	870080e7          	jalr	-1936(ra) # 800061a8 <_ZN9BufferCPPD1Ev>
    80004940:	000a8513          	mv	a0,s5
    80004944:	ffffe097          	auipc	ra,0xffffe
    80004948:	e88080e7          	jalr	-376(ra) # 800027cc <_ZdlPv>
    8000494c:	000c0113          	mv	sp,s8
}
    80004950:	f8040113          	addi	sp,s0,-128
    80004954:	07813083          	ld	ra,120(sp)
    80004958:	07013403          	ld	s0,112(sp)
    8000495c:	06813483          	ld	s1,104(sp)
    80004960:	06013903          	ld	s2,96(sp)
    80004964:	05813983          	ld	s3,88(sp)
    80004968:	05013a03          	ld	s4,80(sp)
    8000496c:	04813a83          	ld	s5,72(sp)
    80004970:	04013b03          	ld	s6,64(sp)
    80004974:	03813b83          	ld	s7,56(sp)
    80004978:	03013c03          	ld	s8,48(sp)
    8000497c:	02813c83          	ld	s9,40(sp)
    80004980:	08010113          	addi	sp,sp,128
    80004984:	00008067          	ret
    80004988:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000498c:	000a8513          	mv	a0,s5
    80004990:	ffffe097          	auipc	ra,0xffffe
    80004994:	e3c080e7          	jalr	-452(ra) # 800027cc <_ZdlPv>
    80004998:	00048513          	mv	a0,s1
    8000499c:	00009097          	auipc	ra,0x9
    800049a0:	5dc080e7          	jalr	1500(ra) # 8000df78 <_Unwind_Resume>
    800049a4:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    800049a8:	00090513          	mv	a0,s2
    800049ac:	ffffe097          	auipc	ra,0xffffe
    800049b0:	e20080e7          	jalr	-480(ra) # 800027cc <_ZdlPv>
    800049b4:	00048513          	mv	a0,s1
    800049b8:	00009097          	auipc	ra,0x9
    800049bc:	5c0080e7          	jalr	1472(ra) # 8000df78 <_Unwind_Resume>
    800049c0:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800049c4:	000b8513          	mv	a0,s7
    800049c8:	ffffe097          	auipc	ra,0xffffe
    800049cc:	e04080e7          	jalr	-508(ra) # 800027cc <_ZdlPv>
    800049d0:	00048513          	mv	a0,s1
    800049d4:	00009097          	auipc	ra,0x9
    800049d8:	5a4080e7          	jalr	1444(ra) # 8000df78 <_Unwind_Resume>
    800049dc:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800049e0:	00048513          	mv	a0,s1
    800049e4:	ffffe097          	auipc	ra,0xffffe
    800049e8:	de8080e7          	jalr	-536(ra) # 800027cc <_ZdlPv>
    800049ec:	00090513          	mv	a0,s2
    800049f0:	00009097          	auipc	ra,0x9
    800049f4:	588080e7          	jalr	1416(ra) # 8000df78 <_Unwind_Resume>
    800049f8:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800049fc:	000c8513          	mv	a0,s9
    80004a00:	ffffe097          	auipc	ra,0xffffe
    80004a04:	dcc080e7          	jalr	-564(ra) # 800027cc <_ZdlPv>
    80004a08:	00048513          	mv	a0,s1
    80004a0c:	00009097          	auipc	ra,0x9
    80004a10:	56c080e7          	jalr	1388(ra) # 8000df78 <_Unwind_Resume>

0000000080004a14 <_ZN8Consumer3runEv>:
    void run() override {
    80004a14:	fd010113          	addi	sp,sp,-48
    80004a18:	02113423          	sd	ra,40(sp)
    80004a1c:	02813023          	sd	s0,32(sp)
    80004a20:	00913c23          	sd	s1,24(sp)
    80004a24:	01213823          	sd	s2,16(sp)
    80004a28:	01313423          	sd	s3,8(sp)
    80004a2c:	03010413          	addi	s0,sp,48
    80004a30:	00050913          	mv	s2,a0
        int i = 0;
    80004a34:	00000993          	li	s3,0
    80004a38:	0100006f          	j	80004a48 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004a3c:	00a00513          	li	a0,10
    80004a40:	ffffe097          	auipc	ra,0xffffe
    80004a44:	1b0080e7          	jalr	432(ra) # 80002bf0 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004a48:	00008797          	auipc	a5,0x8
    80004a4c:	4187a783          	lw	a5,1048(a5) # 8000ce60 <_ZL9threadEnd>
    80004a50:	04079a63          	bnez	a5,80004aa4 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004a54:	02093783          	ld	a5,32(s2)
    80004a58:	0087b503          	ld	a0,8(a5)
    80004a5c:	00001097          	auipc	ra,0x1
    80004a60:	638080e7          	jalr	1592(ra) # 80006094 <_ZN9BufferCPP3getEv>
            i++;
    80004a64:	0019849b          	addiw	s1,s3,1
    80004a68:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004a6c:	0ff57513          	andi	a0,a0,255
    80004a70:	ffffe097          	auipc	ra,0xffffe
    80004a74:	180080e7          	jalr	384(ra) # 80002bf0 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004a78:	05000793          	li	a5,80
    80004a7c:	02f4e4bb          	remw	s1,s1,a5
    80004a80:	fc0494e3          	bnez	s1,80004a48 <_ZN8Consumer3runEv+0x34>
    80004a84:	fb9ff06f          	j	80004a3c <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004a88:	02093783          	ld	a5,32(s2)
    80004a8c:	0087b503          	ld	a0,8(a5)
    80004a90:	00001097          	auipc	ra,0x1
    80004a94:	604080e7          	jalr	1540(ra) # 80006094 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004a98:	0ff57513          	andi	a0,a0,255
    80004a9c:	ffffe097          	auipc	ra,0xffffe
    80004aa0:	154080e7          	jalr	340(ra) # 80002bf0 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004aa4:	02093783          	ld	a5,32(s2)
    80004aa8:	0087b503          	ld	a0,8(a5)
    80004aac:	00001097          	auipc	ra,0x1
    80004ab0:	674080e7          	jalr	1652(ra) # 80006120 <_ZN9BufferCPP6getCntEv>
    80004ab4:	fca04ae3          	bgtz	a0,80004a88 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004ab8:	02093783          	ld	a5,32(s2)
    80004abc:	0107b503          	ld	a0,16(a5)
    80004ac0:	ffffe097          	auipc	ra,0xffffe
    80004ac4:	06c080e7          	jalr	108(ra) # 80002b2c <_ZN9Semaphore6signalEv>
    }
    80004ac8:	02813083          	ld	ra,40(sp)
    80004acc:	02013403          	ld	s0,32(sp)
    80004ad0:	01813483          	ld	s1,24(sp)
    80004ad4:	01013903          	ld	s2,16(sp)
    80004ad8:	00813983          	ld	s3,8(sp)
    80004adc:	03010113          	addi	sp,sp,48
    80004ae0:	00008067          	ret

0000000080004ae4 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004ae4:	ff010113          	addi	sp,sp,-16
    80004ae8:	00113423          	sd	ra,8(sp)
    80004aec:	00813023          	sd	s0,0(sp)
    80004af0:	01010413          	addi	s0,sp,16
    80004af4:	00008797          	auipc	a5,0x8
    80004af8:	0cc78793          	addi	a5,a5,204 # 8000cbc0 <_ZTV8Consumer+0x10>
    80004afc:	00f53023          	sd	a5,0(a0)
    80004b00:	ffffe097          	auipc	ra,0xffffe
    80004b04:	b8c080e7          	jalr	-1140(ra) # 8000268c <_ZN6ThreadD1Ev>
    80004b08:	00813083          	ld	ra,8(sp)
    80004b0c:	00013403          	ld	s0,0(sp)
    80004b10:	01010113          	addi	sp,sp,16
    80004b14:	00008067          	ret

0000000080004b18 <_ZN8ConsumerD0Ev>:
    80004b18:	fe010113          	addi	sp,sp,-32
    80004b1c:	00113c23          	sd	ra,24(sp)
    80004b20:	00813823          	sd	s0,16(sp)
    80004b24:	00913423          	sd	s1,8(sp)
    80004b28:	02010413          	addi	s0,sp,32
    80004b2c:	00050493          	mv	s1,a0
    80004b30:	00008797          	auipc	a5,0x8
    80004b34:	09078793          	addi	a5,a5,144 # 8000cbc0 <_ZTV8Consumer+0x10>
    80004b38:	00f53023          	sd	a5,0(a0)
    80004b3c:	ffffe097          	auipc	ra,0xffffe
    80004b40:	b50080e7          	jalr	-1200(ra) # 8000268c <_ZN6ThreadD1Ev>
    80004b44:	00048513          	mv	a0,s1
    80004b48:	ffffe097          	auipc	ra,0xffffe
    80004b4c:	c84080e7          	jalr	-892(ra) # 800027cc <_ZdlPv>
    80004b50:	01813083          	ld	ra,24(sp)
    80004b54:	01013403          	ld	s0,16(sp)
    80004b58:	00813483          	ld	s1,8(sp)
    80004b5c:	02010113          	addi	sp,sp,32
    80004b60:	00008067          	ret

0000000080004b64 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004b64:	ff010113          	addi	sp,sp,-16
    80004b68:	00113423          	sd	ra,8(sp)
    80004b6c:	00813023          	sd	s0,0(sp)
    80004b70:	01010413          	addi	s0,sp,16
    80004b74:	00008797          	auipc	a5,0x8
    80004b78:	ffc78793          	addi	a5,a5,-4 # 8000cb70 <_ZTV16ProducerKeyborad+0x10>
    80004b7c:	00f53023          	sd	a5,0(a0)
    80004b80:	ffffe097          	auipc	ra,0xffffe
    80004b84:	b0c080e7          	jalr	-1268(ra) # 8000268c <_ZN6ThreadD1Ev>
    80004b88:	00813083          	ld	ra,8(sp)
    80004b8c:	00013403          	ld	s0,0(sp)
    80004b90:	01010113          	addi	sp,sp,16
    80004b94:	00008067          	ret

0000000080004b98 <_ZN16ProducerKeyboradD0Ev>:
    80004b98:	fe010113          	addi	sp,sp,-32
    80004b9c:	00113c23          	sd	ra,24(sp)
    80004ba0:	00813823          	sd	s0,16(sp)
    80004ba4:	00913423          	sd	s1,8(sp)
    80004ba8:	02010413          	addi	s0,sp,32
    80004bac:	00050493          	mv	s1,a0
    80004bb0:	00008797          	auipc	a5,0x8
    80004bb4:	fc078793          	addi	a5,a5,-64 # 8000cb70 <_ZTV16ProducerKeyborad+0x10>
    80004bb8:	00f53023          	sd	a5,0(a0)
    80004bbc:	ffffe097          	auipc	ra,0xffffe
    80004bc0:	ad0080e7          	jalr	-1328(ra) # 8000268c <_ZN6ThreadD1Ev>
    80004bc4:	00048513          	mv	a0,s1
    80004bc8:	ffffe097          	auipc	ra,0xffffe
    80004bcc:	c04080e7          	jalr	-1020(ra) # 800027cc <_ZdlPv>
    80004bd0:	01813083          	ld	ra,24(sp)
    80004bd4:	01013403          	ld	s0,16(sp)
    80004bd8:	00813483          	ld	s1,8(sp)
    80004bdc:	02010113          	addi	sp,sp,32
    80004be0:	00008067          	ret

0000000080004be4 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004be4:	ff010113          	addi	sp,sp,-16
    80004be8:	00113423          	sd	ra,8(sp)
    80004bec:	00813023          	sd	s0,0(sp)
    80004bf0:	01010413          	addi	s0,sp,16
    80004bf4:	00008797          	auipc	a5,0x8
    80004bf8:	fa478793          	addi	a5,a5,-92 # 8000cb98 <_ZTV8Producer+0x10>
    80004bfc:	00f53023          	sd	a5,0(a0)
    80004c00:	ffffe097          	auipc	ra,0xffffe
    80004c04:	a8c080e7          	jalr	-1396(ra) # 8000268c <_ZN6ThreadD1Ev>
    80004c08:	00813083          	ld	ra,8(sp)
    80004c0c:	00013403          	ld	s0,0(sp)
    80004c10:	01010113          	addi	sp,sp,16
    80004c14:	00008067          	ret

0000000080004c18 <_ZN8ProducerD0Ev>:
    80004c18:	fe010113          	addi	sp,sp,-32
    80004c1c:	00113c23          	sd	ra,24(sp)
    80004c20:	00813823          	sd	s0,16(sp)
    80004c24:	00913423          	sd	s1,8(sp)
    80004c28:	02010413          	addi	s0,sp,32
    80004c2c:	00050493          	mv	s1,a0
    80004c30:	00008797          	auipc	a5,0x8
    80004c34:	f6878793          	addi	a5,a5,-152 # 8000cb98 <_ZTV8Producer+0x10>
    80004c38:	00f53023          	sd	a5,0(a0)
    80004c3c:	ffffe097          	auipc	ra,0xffffe
    80004c40:	a50080e7          	jalr	-1456(ra) # 8000268c <_ZN6ThreadD1Ev>
    80004c44:	00048513          	mv	a0,s1
    80004c48:	ffffe097          	auipc	ra,0xffffe
    80004c4c:	b84080e7          	jalr	-1148(ra) # 800027cc <_ZdlPv>
    80004c50:	01813083          	ld	ra,24(sp)
    80004c54:	01013403          	ld	s0,16(sp)
    80004c58:	00813483          	ld	s1,8(sp)
    80004c5c:	02010113          	addi	sp,sp,32
    80004c60:	00008067          	ret

0000000080004c64 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004c64:	fe010113          	addi	sp,sp,-32
    80004c68:	00113c23          	sd	ra,24(sp)
    80004c6c:	00813823          	sd	s0,16(sp)
    80004c70:	00913423          	sd	s1,8(sp)
    80004c74:	02010413          	addi	s0,sp,32
    80004c78:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004c7c:	ffffd097          	auipc	ra,0xffffd
    80004c80:	8f0080e7          	jalr	-1808(ra) # 8000156c <_Z4getcv>
    80004c84:	0005059b          	sext.w	a1,a0
    80004c88:	01b00793          	li	a5,27
    80004c8c:	00f58c63          	beq	a1,a5,80004ca4 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004c90:	0204b783          	ld	a5,32(s1)
    80004c94:	0087b503          	ld	a0,8(a5)
    80004c98:	00001097          	auipc	ra,0x1
    80004c9c:	36c080e7          	jalr	876(ra) # 80006004 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004ca0:	fddff06f          	j	80004c7c <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004ca4:	00100793          	li	a5,1
    80004ca8:	00008717          	auipc	a4,0x8
    80004cac:	1af72c23          	sw	a5,440(a4) # 8000ce60 <_ZL9threadEnd>
        td->buffer->put('!');
    80004cb0:	0204b783          	ld	a5,32(s1)
    80004cb4:	02100593          	li	a1,33
    80004cb8:	0087b503          	ld	a0,8(a5)
    80004cbc:	00001097          	auipc	ra,0x1
    80004cc0:	348080e7          	jalr	840(ra) # 80006004 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004cc4:	0204b783          	ld	a5,32(s1)
    80004cc8:	0107b503          	ld	a0,16(a5)
    80004ccc:	ffffe097          	auipc	ra,0xffffe
    80004cd0:	e60080e7          	jalr	-416(ra) # 80002b2c <_ZN9Semaphore6signalEv>
    }
    80004cd4:	01813083          	ld	ra,24(sp)
    80004cd8:	01013403          	ld	s0,16(sp)
    80004cdc:	00813483          	ld	s1,8(sp)
    80004ce0:	02010113          	addi	sp,sp,32
    80004ce4:	00008067          	ret

0000000080004ce8 <_ZN8Producer3runEv>:
    void run() override {
    80004ce8:	fe010113          	addi	sp,sp,-32
    80004cec:	00113c23          	sd	ra,24(sp)
    80004cf0:	00813823          	sd	s0,16(sp)
    80004cf4:	00913423          	sd	s1,8(sp)
    80004cf8:	01213023          	sd	s2,0(sp)
    80004cfc:	02010413          	addi	s0,sp,32
    80004d00:	00050493          	mv	s1,a0
        int i = 0;
    80004d04:	00000913          	li	s2,0
        while (!threadEnd) {
    80004d08:	00008797          	auipc	a5,0x8
    80004d0c:	1587a783          	lw	a5,344(a5) # 8000ce60 <_ZL9threadEnd>
    80004d10:	04079263          	bnez	a5,80004d54 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004d14:	0204b783          	ld	a5,32(s1)
    80004d18:	0007a583          	lw	a1,0(a5)
    80004d1c:	0305859b          	addiw	a1,a1,48
    80004d20:	0087b503          	ld	a0,8(a5)
    80004d24:	00001097          	auipc	ra,0x1
    80004d28:	2e0080e7          	jalr	736(ra) # 80006004 <_ZN9BufferCPP3putEi>
            i++;
    80004d2c:	0019071b          	addiw	a4,s2,1
    80004d30:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004d34:	0204b783          	ld	a5,32(s1)
    80004d38:	0007a783          	lw	a5,0(a5)
    80004d3c:	00e787bb          	addw	a5,a5,a4
    80004d40:	00500513          	li	a0,5
    80004d44:	02a7e53b          	remw	a0,a5,a0
    80004d48:	ffffe097          	auipc	ra,0xffffe
    80004d4c:	c70080e7          	jalr	-912(ra) # 800029b8 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004d50:	fb9ff06f          	j	80004d08 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004d54:	0204b783          	ld	a5,32(s1)
    80004d58:	0107b503          	ld	a0,16(a5)
    80004d5c:	ffffe097          	auipc	ra,0xffffe
    80004d60:	dd0080e7          	jalr	-560(ra) # 80002b2c <_ZN9Semaphore6signalEv>
    }
    80004d64:	01813083          	ld	ra,24(sp)
    80004d68:	01013403          	ld	s0,16(sp)
    80004d6c:	00813483          	ld	s1,8(sp)
    80004d70:	00013903          	ld	s2,0(sp)
    80004d74:	02010113          	addi	sp,sp,32
    80004d78:	00008067          	ret

0000000080004d7c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004d7c:	fe010113          	addi	sp,sp,-32
    80004d80:	00113c23          	sd	ra,24(sp)
    80004d84:	00813823          	sd	s0,16(sp)
    80004d88:	00913423          	sd	s1,8(sp)
    80004d8c:	01213023          	sd	s2,0(sp)
    80004d90:	02010413          	addi	s0,sp,32
    80004d94:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004d98:	00100793          	li	a5,1
    80004d9c:	02a7f863          	bgeu	a5,a0,80004dcc <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004da0:	00a00793          	li	a5,10
    80004da4:	02f577b3          	remu	a5,a0,a5
    80004da8:	02078e63          	beqz	a5,80004de4 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004dac:	fff48513          	addi	a0,s1,-1
    80004db0:	00000097          	auipc	ra,0x0
    80004db4:	fcc080e7          	jalr	-52(ra) # 80004d7c <_ZL9fibonaccim>
    80004db8:	00050913          	mv	s2,a0
    80004dbc:	ffe48513          	addi	a0,s1,-2
    80004dc0:	00000097          	auipc	ra,0x0
    80004dc4:	fbc080e7          	jalr	-68(ra) # 80004d7c <_ZL9fibonaccim>
    80004dc8:	00a90533          	add	a0,s2,a0
}
    80004dcc:	01813083          	ld	ra,24(sp)
    80004dd0:	01013403          	ld	s0,16(sp)
    80004dd4:	00813483          	ld	s1,8(sp)
    80004dd8:	00013903          	ld	s2,0(sp)
    80004ddc:	02010113          	addi	sp,sp,32
    80004de0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004de4:	ffffc097          	auipc	ra,0xffffc
    80004de8:	648080e7          	jalr	1608(ra) # 8000142c <_Z15thread_dispatchv>
    80004dec:	fc1ff06f          	j	80004dac <_ZL9fibonaccim+0x30>

0000000080004df0 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004df0:	fe010113          	addi	sp,sp,-32
    80004df4:	00113c23          	sd	ra,24(sp)
    80004df8:	00813823          	sd	s0,16(sp)
    80004dfc:	00913423          	sd	s1,8(sp)
    80004e00:	01213023          	sd	s2,0(sp)
    80004e04:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004e08:	00a00493          	li	s1,10
    80004e0c:	0400006f          	j	80004e4c <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004e10:	00005517          	auipc	a0,0x5
    80004e14:	5b850513          	addi	a0,a0,1464 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80004e18:	00001097          	auipc	ra,0x1
    80004e1c:	dc8080e7          	jalr	-568(ra) # 80005be0 <_Z11printStringPKc>
    80004e20:	00000613          	li	a2,0
    80004e24:	00a00593          	li	a1,10
    80004e28:	00048513          	mv	a0,s1
    80004e2c:	00001097          	auipc	ra,0x1
    80004e30:	f64080e7          	jalr	-156(ra) # 80005d90 <_Z8printIntiii>
    80004e34:	00005517          	auipc	a0,0x5
    80004e38:	78450513          	addi	a0,a0,1924 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80004e3c:	00001097          	auipc	ra,0x1
    80004e40:	da4080e7          	jalr	-604(ra) # 80005be0 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004e44:	0014849b          	addiw	s1,s1,1
    80004e48:	0ff4f493          	andi	s1,s1,255
    80004e4c:	00c00793          	li	a5,12
    80004e50:	fc97f0e3          	bgeu	a5,s1,80004e10 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004e54:	00005517          	auipc	a0,0x5
    80004e58:	57c50513          	addi	a0,a0,1404 # 8000a3d0 <_ZZ9kPrintIntmE6digits+0x360>
    80004e5c:	00001097          	auipc	ra,0x1
    80004e60:	d84080e7          	jalr	-636(ra) # 80005be0 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004e64:	00500313          	li	t1,5
    thread_dispatch();
    80004e68:	ffffc097          	auipc	ra,0xffffc
    80004e6c:	5c4080e7          	jalr	1476(ra) # 8000142c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004e70:	01000513          	li	a0,16
    80004e74:	00000097          	auipc	ra,0x0
    80004e78:	f08080e7          	jalr	-248(ra) # 80004d7c <_ZL9fibonaccim>
    80004e7c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004e80:	00005517          	auipc	a0,0x5
    80004e84:	56050513          	addi	a0,a0,1376 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80004e88:	00001097          	auipc	ra,0x1
    80004e8c:	d58080e7          	jalr	-680(ra) # 80005be0 <_Z11printStringPKc>
    80004e90:	00000613          	li	a2,0
    80004e94:	00a00593          	li	a1,10
    80004e98:	0009051b          	sext.w	a0,s2
    80004e9c:	00001097          	auipc	ra,0x1
    80004ea0:	ef4080e7          	jalr	-268(ra) # 80005d90 <_Z8printIntiii>
    80004ea4:	00005517          	auipc	a0,0x5
    80004ea8:	71450513          	addi	a0,a0,1812 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80004eac:	00001097          	auipc	ra,0x1
    80004eb0:	d34080e7          	jalr	-716(ra) # 80005be0 <_Z11printStringPKc>
    80004eb4:	0400006f          	j	80004ef4 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004eb8:	00005517          	auipc	a0,0x5
    80004ebc:	51050513          	addi	a0,a0,1296 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    80004ec0:	00001097          	auipc	ra,0x1
    80004ec4:	d20080e7          	jalr	-736(ra) # 80005be0 <_Z11printStringPKc>
    80004ec8:	00000613          	li	a2,0
    80004ecc:	00a00593          	li	a1,10
    80004ed0:	00048513          	mv	a0,s1
    80004ed4:	00001097          	auipc	ra,0x1
    80004ed8:	ebc080e7          	jalr	-324(ra) # 80005d90 <_Z8printIntiii>
    80004edc:	00005517          	auipc	a0,0x5
    80004ee0:	6dc50513          	addi	a0,a0,1756 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80004ee4:	00001097          	auipc	ra,0x1
    80004ee8:	cfc080e7          	jalr	-772(ra) # 80005be0 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004eec:	0014849b          	addiw	s1,s1,1
    80004ef0:	0ff4f493          	andi	s1,s1,255
    80004ef4:	00f00793          	li	a5,15
    80004ef8:	fc97f0e3          	bgeu	a5,s1,80004eb8 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004efc:	00005517          	auipc	a0,0x5
    80004f00:	4f450513          	addi	a0,a0,1268 # 8000a3f0 <_ZZ9kPrintIntmE6digits+0x380>
    80004f04:	00001097          	auipc	ra,0x1
    80004f08:	cdc080e7          	jalr	-804(ra) # 80005be0 <_Z11printStringPKc>
    finishedD = true;
    80004f0c:	00100793          	li	a5,1
    80004f10:	00008717          	auipc	a4,0x8
    80004f14:	f6f70023          	sb	a5,-160(a4) # 8000ce70 <_ZL9finishedD>
    thread_dispatch();
    80004f18:	ffffc097          	auipc	ra,0xffffc
    80004f1c:	514080e7          	jalr	1300(ra) # 8000142c <_Z15thread_dispatchv>
}
    80004f20:	01813083          	ld	ra,24(sp)
    80004f24:	01013403          	ld	s0,16(sp)
    80004f28:	00813483          	ld	s1,8(sp)
    80004f2c:	00013903          	ld	s2,0(sp)
    80004f30:	02010113          	addi	sp,sp,32
    80004f34:	00008067          	ret

0000000080004f38 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004f38:	fe010113          	addi	sp,sp,-32
    80004f3c:	00113c23          	sd	ra,24(sp)
    80004f40:	00813823          	sd	s0,16(sp)
    80004f44:	00913423          	sd	s1,8(sp)
    80004f48:	01213023          	sd	s2,0(sp)
    80004f4c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004f50:	00000493          	li	s1,0
    80004f54:	0400006f          	j	80004f94 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004f58:	00005517          	auipc	a0,0x5
    80004f5c:	43050513          	addi	a0,a0,1072 # 8000a388 <_ZZ9kPrintIntmE6digits+0x318>
    80004f60:	00001097          	auipc	ra,0x1
    80004f64:	c80080e7          	jalr	-896(ra) # 80005be0 <_Z11printStringPKc>
    80004f68:	00000613          	li	a2,0
    80004f6c:	00a00593          	li	a1,10
    80004f70:	00048513          	mv	a0,s1
    80004f74:	00001097          	auipc	ra,0x1
    80004f78:	e1c080e7          	jalr	-484(ra) # 80005d90 <_Z8printIntiii>
    80004f7c:	00005517          	auipc	a0,0x5
    80004f80:	63c50513          	addi	a0,a0,1596 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80004f84:	00001097          	auipc	ra,0x1
    80004f88:	c5c080e7          	jalr	-932(ra) # 80005be0 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004f8c:	0014849b          	addiw	s1,s1,1
    80004f90:	0ff4f493          	andi	s1,s1,255
    80004f94:	00200793          	li	a5,2
    80004f98:	fc97f0e3          	bgeu	a5,s1,80004f58 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004f9c:	00005517          	auipc	a0,0x5
    80004fa0:	3f450513          	addi	a0,a0,1012 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80004fa4:	00001097          	auipc	ra,0x1
    80004fa8:	c3c080e7          	jalr	-964(ra) # 80005be0 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004fac:	00700313          	li	t1,7
    thread_dispatch();
    80004fb0:	ffffc097          	auipc	ra,0xffffc
    80004fb4:	47c080e7          	jalr	1148(ra) # 8000142c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004fb8:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004fbc:	00005517          	auipc	a0,0x5
    80004fc0:	3e450513          	addi	a0,a0,996 # 8000a3a0 <_ZZ9kPrintIntmE6digits+0x330>
    80004fc4:	00001097          	auipc	ra,0x1
    80004fc8:	c1c080e7          	jalr	-996(ra) # 80005be0 <_Z11printStringPKc>
    80004fcc:	00000613          	li	a2,0
    80004fd0:	00a00593          	li	a1,10
    80004fd4:	0009051b          	sext.w	a0,s2
    80004fd8:	00001097          	auipc	ra,0x1
    80004fdc:	db8080e7          	jalr	-584(ra) # 80005d90 <_Z8printIntiii>
    80004fe0:	00005517          	auipc	a0,0x5
    80004fe4:	5d850513          	addi	a0,a0,1496 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80004fe8:	00001097          	auipc	ra,0x1
    80004fec:	bf8080e7          	jalr	-1032(ra) # 80005be0 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004ff0:	00c00513          	li	a0,12
    80004ff4:	00000097          	auipc	ra,0x0
    80004ff8:	d88080e7          	jalr	-632(ra) # 80004d7c <_ZL9fibonaccim>
    80004ffc:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005000:	00005517          	auipc	a0,0x5
    80005004:	3a850513          	addi	a0,a0,936 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    80005008:	00001097          	auipc	ra,0x1
    8000500c:	bd8080e7          	jalr	-1064(ra) # 80005be0 <_Z11printStringPKc>
    80005010:	00000613          	li	a2,0
    80005014:	00a00593          	li	a1,10
    80005018:	0009051b          	sext.w	a0,s2
    8000501c:	00001097          	auipc	ra,0x1
    80005020:	d74080e7          	jalr	-652(ra) # 80005d90 <_Z8printIntiii>
    80005024:	00005517          	auipc	a0,0x5
    80005028:	59450513          	addi	a0,a0,1428 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    8000502c:	00001097          	auipc	ra,0x1
    80005030:	bb4080e7          	jalr	-1100(ra) # 80005be0 <_Z11printStringPKc>
    80005034:	0400006f          	j	80005074 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005038:	00005517          	auipc	a0,0x5
    8000503c:	35050513          	addi	a0,a0,848 # 8000a388 <_ZZ9kPrintIntmE6digits+0x318>
    80005040:	00001097          	auipc	ra,0x1
    80005044:	ba0080e7          	jalr	-1120(ra) # 80005be0 <_Z11printStringPKc>
    80005048:	00000613          	li	a2,0
    8000504c:	00a00593          	li	a1,10
    80005050:	00048513          	mv	a0,s1
    80005054:	00001097          	auipc	ra,0x1
    80005058:	d3c080e7          	jalr	-708(ra) # 80005d90 <_Z8printIntiii>
    8000505c:	00005517          	auipc	a0,0x5
    80005060:	55c50513          	addi	a0,a0,1372 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80005064:	00001097          	auipc	ra,0x1
    80005068:	b7c080e7          	jalr	-1156(ra) # 80005be0 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000506c:	0014849b          	addiw	s1,s1,1
    80005070:	0ff4f493          	andi	s1,s1,255
    80005074:	00500793          	li	a5,5
    80005078:	fc97f0e3          	bgeu	a5,s1,80005038 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    8000507c:	00005517          	auipc	a0,0x5
    80005080:	33c50513          	addi	a0,a0,828 # 8000a3b8 <_ZZ9kPrintIntmE6digits+0x348>
    80005084:	00001097          	auipc	ra,0x1
    80005088:	b5c080e7          	jalr	-1188(ra) # 80005be0 <_Z11printStringPKc>
    finishedC = true;
    8000508c:	00100793          	li	a5,1
    80005090:	00008717          	auipc	a4,0x8
    80005094:	def700a3          	sb	a5,-543(a4) # 8000ce71 <_ZL9finishedC>
    thread_dispatch();
    80005098:	ffffc097          	auipc	ra,0xffffc
    8000509c:	394080e7          	jalr	916(ra) # 8000142c <_Z15thread_dispatchv>
}
    800050a0:	01813083          	ld	ra,24(sp)
    800050a4:	01013403          	ld	s0,16(sp)
    800050a8:	00813483          	ld	s1,8(sp)
    800050ac:	00013903          	ld	s2,0(sp)
    800050b0:	02010113          	addi	sp,sp,32
    800050b4:	00008067          	ret

00000000800050b8 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800050b8:	fe010113          	addi	sp,sp,-32
    800050bc:	00113c23          	sd	ra,24(sp)
    800050c0:	00813823          	sd	s0,16(sp)
    800050c4:	00913423          	sd	s1,8(sp)
    800050c8:	01213023          	sd	s2,0(sp)
    800050cc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800050d0:	00000913          	li	s2,0
    800050d4:	0380006f          	j	8000510c <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    800050d8:	ffffc097          	auipc	ra,0xffffc
    800050dc:	354080e7          	jalr	852(ra) # 8000142c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800050e0:	00148493          	addi	s1,s1,1
    800050e4:	000027b7          	lui	a5,0x2
    800050e8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800050ec:	0097ee63          	bltu	a5,s1,80005108 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800050f0:	00000713          	li	a4,0
    800050f4:	000077b7          	lui	a5,0x7
    800050f8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800050fc:	fce7eee3          	bltu	a5,a4,800050d8 <_ZL11workerBodyBPv+0x20>
    80005100:	00170713          	addi	a4,a4,1
    80005104:	ff1ff06f          	j	800050f4 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80005108:	00190913          	addi	s2,s2,1
    8000510c:	00f00793          	li	a5,15
    80005110:	0527e063          	bltu	a5,s2,80005150 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80005114:	00005517          	auipc	a0,0x5
    80005118:	25c50513          	addi	a0,a0,604 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    8000511c:	00001097          	auipc	ra,0x1
    80005120:	ac4080e7          	jalr	-1340(ra) # 80005be0 <_Z11printStringPKc>
    80005124:	00000613          	li	a2,0
    80005128:	00a00593          	li	a1,10
    8000512c:	0009051b          	sext.w	a0,s2
    80005130:	00001097          	auipc	ra,0x1
    80005134:	c60080e7          	jalr	-928(ra) # 80005d90 <_Z8printIntiii>
    80005138:	00005517          	auipc	a0,0x5
    8000513c:	48050513          	addi	a0,a0,1152 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80005140:	00001097          	auipc	ra,0x1
    80005144:	aa0080e7          	jalr	-1376(ra) # 80005be0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005148:	00000493          	li	s1,0
    8000514c:	f99ff06f          	j	800050e4 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80005150:	00005517          	auipc	a0,0x5
    80005154:	22850513          	addi	a0,a0,552 # 8000a378 <_ZZ9kPrintIntmE6digits+0x308>
    80005158:	00001097          	auipc	ra,0x1
    8000515c:	a88080e7          	jalr	-1400(ra) # 80005be0 <_Z11printStringPKc>
    finishedB = true;
    80005160:	00100793          	li	a5,1
    80005164:	00008717          	auipc	a4,0x8
    80005168:	d0f70723          	sb	a5,-754(a4) # 8000ce72 <_ZL9finishedB>
    thread_dispatch();
    8000516c:	ffffc097          	auipc	ra,0xffffc
    80005170:	2c0080e7          	jalr	704(ra) # 8000142c <_Z15thread_dispatchv>
}
    80005174:	01813083          	ld	ra,24(sp)
    80005178:	01013403          	ld	s0,16(sp)
    8000517c:	00813483          	ld	s1,8(sp)
    80005180:	00013903          	ld	s2,0(sp)
    80005184:	02010113          	addi	sp,sp,32
    80005188:	00008067          	ret

000000008000518c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    8000518c:	fe010113          	addi	sp,sp,-32
    80005190:	00113c23          	sd	ra,24(sp)
    80005194:	00813823          	sd	s0,16(sp)
    80005198:	00913423          	sd	s1,8(sp)
    8000519c:	01213023          	sd	s2,0(sp)
    800051a0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800051a4:	00000913          	li	s2,0
    800051a8:	0380006f          	j	800051e0 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800051ac:	ffffc097          	auipc	ra,0xffffc
    800051b0:	280080e7          	jalr	640(ra) # 8000142c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800051b4:	00148493          	addi	s1,s1,1
    800051b8:	000027b7          	lui	a5,0x2
    800051bc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800051c0:	0097ee63          	bltu	a5,s1,800051dc <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800051c4:	00000713          	li	a4,0
    800051c8:	000077b7          	lui	a5,0x7
    800051cc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800051d0:	fce7eee3          	bltu	a5,a4,800051ac <_ZL11workerBodyAPv+0x20>
    800051d4:	00170713          	addi	a4,a4,1
    800051d8:	ff1ff06f          	j	800051c8 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800051dc:	00190913          	addi	s2,s2,1
    800051e0:	00900793          	li	a5,9
    800051e4:	0527e063          	bltu	a5,s2,80005224 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800051e8:	00005517          	auipc	a0,0x5
    800051ec:	17050513          	addi	a0,a0,368 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    800051f0:	00001097          	auipc	ra,0x1
    800051f4:	9f0080e7          	jalr	-1552(ra) # 80005be0 <_Z11printStringPKc>
    800051f8:	00000613          	li	a2,0
    800051fc:	00a00593          	li	a1,10
    80005200:	0009051b          	sext.w	a0,s2
    80005204:	00001097          	auipc	ra,0x1
    80005208:	b8c080e7          	jalr	-1140(ra) # 80005d90 <_Z8printIntiii>
    8000520c:	00005517          	auipc	a0,0x5
    80005210:	3ac50513          	addi	a0,a0,940 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80005214:	00001097          	auipc	ra,0x1
    80005218:	9cc080e7          	jalr	-1588(ra) # 80005be0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000521c:	00000493          	li	s1,0
    80005220:	f99ff06f          	j	800051b8 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005224:	00005517          	auipc	a0,0x5
    80005228:	13c50513          	addi	a0,a0,316 # 8000a360 <_ZZ9kPrintIntmE6digits+0x2f0>
    8000522c:	00001097          	auipc	ra,0x1
    80005230:	9b4080e7          	jalr	-1612(ra) # 80005be0 <_Z11printStringPKc>
    finishedA = true;
    80005234:	00100793          	li	a5,1
    80005238:	00008717          	auipc	a4,0x8
    8000523c:	c2f70da3          	sb	a5,-965(a4) # 8000ce73 <_ZL9finishedA>
}
    80005240:	01813083          	ld	ra,24(sp)
    80005244:	01013403          	ld	s0,16(sp)
    80005248:	00813483          	ld	s1,8(sp)
    8000524c:	00013903          	ld	s2,0(sp)
    80005250:	02010113          	addi	sp,sp,32
    80005254:	00008067          	ret

0000000080005258 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005258:	fd010113          	addi	sp,sp,-48
    8000525c:	02113423          	sd	ra,40(sp)
    80005260:	02813023          	sd	s0,32(sp)
    80005264:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005268:	00000613          	li	a2,0
    8000526c:	00000597          	auipc	a1,0x0
    80005270:	f2058593          	addi	a1,a1,-224 # 8000518c <_ZL11workerBodyAPv>
    80005274:	fd040513          	addi	a0,s0,-48
    80005278:	ffffc097          	auipc	ra,0xffffc
    8000527c:	100080e7          	jalr	256(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005280:	00005517          	auipc	a0,0x5
    80005284:	18050513          	addi	a0,a0,384 # 8000a400 <_ZZ9kPrintIntmE6digits+0x390>
    80005288:	00001097          	auipc	ra,0x1
    8000528c:	958080e7          	jalr	-1704(ra) # 80005be0 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005290:	00000613          	li	a2,0
    80005294:	00000597          	auipc	a1,0x0
    80005298:	e2458593          	addi	a1,a1,-476 # 800050b8 <_ZL11workerBodyBPv>
    8000529c:	fd840513          	addi	a0,s0,-40
    800052a0:	ffffc097          	auipc	ra,0xffffc
    800052a4:	0d8080e7          	jalr	216(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800052a8:	00005517          	auipc	a0,0x5
    800052ac:	17050513          	addi	a0,a0,368 # 8000a418 <_ZZ9kPrintIntmE6digits+0x3a8>
    800052b0:	00001097          	auipc	ra,0x1
    800052b4:	930080e7          	jalr	-1744(ra) # 80005be0 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800052b8:	00000613          	li	a2,0
    800052bc:	00000597          	auipc	a1,0x0
    800052c0:	c7c58593          	addi	a1,a1,-900 # 80004f38 <_ZL11workerBodyCPv>
    800052c4:	fe040513          	addi	a0,s0,-32
    800052c8:	ffffc097          	auipc	ra,0xffffc
    800052cc:	0b0080e7          	jalr	176(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800052d0:	00005517          	auipc	a0,0x5
    800052d4:	16050513          	addi	a0,a0,352 # 8000a430 <_ZZ9kPrintIntmE6digits+0x3c0>
    800052d8:	00001097          	auipc	ra,0x1
    800052dc:	908080e7          	jalr	-1784(ra) # 80005be0 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800052e0:	00000613          	li	a2,0
    800052e4:	00000597          	auipc	a1,0x0
    800052e8:	b0c58593          	addi	a1,a1,-1268 # 80004df0 <_ZL11workerBodyDPv>
    800052ec:	fe840513          	addi	a0,s0,-24
    800052f0:	ffffc097          	auipc	ra,0xffffc
    800052f4:	088080e7          	jalr	136(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800052f8:	00005517          	auipc	a0,0x5
    800052fc:	15050513          	addi	a0,a0,336 # 8000a448 <_ZZ9kPrintIntmE6digits+0x3d8>
    80005300:	00001097          	auipc	ra,0x1
    80005304:	8e0080e7          	jalr	-1824(ra) # 80005be0 <_Z11printStringPKc>
    80005308:	00c0006f          	j	80005314 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    8000530c:	ffffc097          	auipc	ra,0xffffc
    80005310:	120080e7          	jalr	288(ra) # 8000142c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005314:	00008797          	auipc	a5,0x8
    80005318:	b5f7c783          	lbu	a5,-1185(a5) # 8000ce73 <_ZL9finishedA>
    8000531c:	fe0788e3          	beqz	a5,8000530c <_Z18Threads_C_API_testv+0xb4>
    80005320:	00008797          	auipc	a5,0x8
    80005324:	b527c783          	lbu	a5,-1198(a5) # 8000ce72 <_ZL9finishedB>
    80005328:	fe0782e3          	beqz	a5,8000530c <_Z18Threads_C_API_testv+0xb4>
    8000532c:	00008797          	auipc	a5,0x8
    80005330:	b457c783          	lbu	a5,-1211(a5) # 8000ce71 <_ZL9finishedC>
    80005334:	fc078ce3          	beqz	a5,8000530c <_Z18Threads_C_API_testv+0xb4>
    80005338:	00008797          	auipc	a5,0x8
    8000533c:	b387c783          	lbu	a5,-1224(a5) # 8000ce70 <_ZL9finishedD>
    80005340:	fc0786e3          	beqz	a5,8000530c <_Z18Threads_C_API_testv+0xb4>
    }

}
    80005344:	02813083          	ld	ra,40(sp)
    80005348:	02013403          	ld	s0,32(sp)
    8000534c:	03010113          	addi	sp,sp,48
    80005350:	00008067          	ret

0000000080005354 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80005354:	fd010113          	addi	sp,sp,-48
    80005358:	02113423          	sd	ra,40(sp)
    8000535c:	02813023          	sd	s0,32(sp)
    80005360:	00913c23          	sd	s1,24(sp)
    80005364:	01213823          	sd	s2,16(sp)
    80005368:	01313423          	sd	s3,8(sp)
    8000536c:	03010413          	addi	s0,sp,48
    80005370:	00050993          	mv	s3,a0
    80005374:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005378:	00000913          	li	s2,0
    8000537c:	00c0006f          	j	80005388 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005380:	ffffd097          	auipc	ra,0xffffd
    80005384:	610080e7          	jalr	1552(ra) # 80002990 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005388:	ffffc097          	auipc	ra,0xffffc
    8000538c:	1e4080e7          	jalr	484(ra) # 8000156c <_Z4getcv>
    80005390:	0005059b          	sext.w	a1,a0
    80005394:	01b00793          	li	a5,27
    80005398:	02f58a63          	beq	a1,a5,800053cc <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    8000539c:	0084b503          	ld	a0,8(s1)
    800053a0:	00001097          	auipc	ra,0x1
    800053a4:	c64080e7          	jalr	-924(ra) # 80006004 <_ZN9BufferCPP3putEi>
        i++;
    800053a8:	0019071b          	addiw	a4,s2,1
    800053ac:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800053b0:	0004a683          	lw	a3,0(s1)
    800053b4:	0026979b          	slliw	a5,a3,0x2
    800053b8:	00d787bb          	addw	a5,a5,a3
    800053bc:	0017979b          	slliw	a5,a5,0x1
    800053c0:	02f767bb          	remw	a5,a4,a5
    800053c4:	fc0792e3          	bnez	a5,80005388 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800053c8:	fb9ff06f          	j	80005380 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800053cc:	00100793          	li	a5,1
    800053d0:	00008717          	auipc	a4,0x8
    800053d4:	aaf72423          	sw	a5,-1368(a4) # 8000ce78 <_ZL9threadEnd>
    td->buffer->put('!');
    800053d8:	0209b783          	ld	a5,32(s3)
    800053dc:	02100593          	li	a1,33
    800053e0:	0087b503          	ld	a0,8(a5)
    800053e4:	00001097          	auipc	ra,0x1
    800053e8:	c20080e7          	jalr	-992(ra) # 80006004 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800053ec:	0104b503          	ld	a0,16(s1)
    800053f0:	ffffd097          	auipc	ra,0xffffd
    800053f4:	73c080e7          	jalr	1852(ra) # 80002b2c <_ZN9Semaphore6signalEv>
}
    800053f8:	02813083          	ld	ra,40(sp)
    800053fc:	02013403          	ld	s0,32(sp)
    80005400:	01813483          	ld	s1,24(sp)
    80005404:	01013903          	ld	s2,16(sp)
    80005408:	00813983          	ld	s3,8(sp)
    8000540c:	03010113          	addi	sp,sp,48
    80005410:	00008067          	ret

0000000080005414 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80005414:	fe010113          	addi	sp,sp,-32
    80005418:	00113c23          	sd	ra,24(sp)
    8000541c:	00813823          	sd	s0,16(sp)
    80005420:	00913423          	sd	s1,8(sp)
    80005424:	01213023          	sd	s2,0(sp)
    80005428:	02010413          	addi	s0,sp,32
    8000542c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005430:	00000913          	li	s2,0
    80005434:	00c0006f          	j	80005440 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005438:	ffffd097          	auipc	ra,0xffffd
    8000543c:	558080e7          	jalr	1368(ra) # 80002990 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005440:	00008797          	auipc	a5,0x8
    80005444:	a387a783          	lw	a5,-1480(a5) # 8000ce78 <_ZL9threadEnd>
    80005448:	02079e63          	bnez	a5,80005484 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    8000544c:	0004a583          	lw	a1,0(s1)
    80005450:	0305859b          	addiw	a1,a1,48
    80005454:	0084b503          	ld	a0,8(s1)
    80005458:	00001097          	auipc	ra,0x1
    8000545c:	bac080e7          	jalr	-1108(ra) # 80006004 <_ZN9BufferCPP3putEi>
        i++;
    80005460:	0019071b          	addiw	a4,s2,1
    80005464:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005468:	0004a683          	lw	a3,0(s1)
    8000546c:	0026979b          	slliw	a5,a3,0x2
    80005470:	00d787bb          	addw	a5,a5,a3
    80005474:	0017979b          	slliw	a5,a5,0x1
    80005478:	02f767bb          	remw	a5,a4,a5
    8000547c:	fc0792e3          	bnez	a5,80005440 <_ZN12ProducerSync8producerEPv+0x2c>
    80005480:	fb9ff06f          	j	80005438 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005484:	0104b503          	ld	a0,16(s1)
    80005488:	ffffd097          	auipc	ra,0xffffd
    8000548c:	6a4080e7          	jalr	1700(ra) # 80002b2c <_ZN9Semaphore6signalEv>
}
    80005490:	01813083          	ld	ra,24(sp)
    80005494:	01013403          	ld	s0,16(sp)
    80005498:	00813483          	ld	s1,8(sp)
    8000549c:	00013903          	ld	s2,0(sp)
    800054a0:	02010113          	addi	sp,sp,32
    800054a4:	00008067          	ret

00000000800054a8 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    800054a8:	fd010113          	addi	sp,sp,-48
    800054ac:	02113423          	sd	ra,40(sp)
    800054b0:	02813023          	sd	s0,32(sp)
    800054b4:	00913c23          	sd	s1,24(sp)
    800054b8:	01213823          	sd	s2,16(sp)
    800054bc:	01313423          	sd	s3,8(sp)
    800054c0:	01413023          	sd	s4,0(sp)
    800054c4:	03010413          	addi	s0,sp,48
    800054c8:	00050993          	mv	s3,a0
    800054cc:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800054d0:	00000a13          	li	s4,0
    800054d4:	01c0006f          	j	800054f0 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800054d8:	ffffd097          	auipc	ra,0xffffd
    800054dc:	4b8080e7          	jalr	1208(ra) # 80002990 <_ZN6Thread8dispatchEv>
    800054e0:	0500006f          	j	80005530 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800054e4:	00a00513          	li	a0,10
    800054e8:	ffffc097          	auipc	ra,0xffffc
    800054ec:	0ac080e7          	jalr	172(ra) # 80001594 <_Z4putcc>
    while (!threadEnd) {
    800054f0:	00008797          	auipc	a5,0x8
    800054f4:	9887a783          	lw	a5,-1656(a5) # 8000ce78 <_ZL9threadEnd>
    800054f8:	06079263          	bnez	a5,8000555c <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800054fc:	00893503          	ld	a0,8(s2)
    80005500:	00001097          	auipc	ra,0x1
    80005504:	b94080e7          	jalr	-1132(ra) # 80006094 <_ZN9BufferCPP3getEv>
        i++;
    80005508:	001a049b          	addiw	s1,s4,1
    8000550c:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005510:	0ff57513          	andi	a0,a0,255
    80005514:	ffffc097          	auipc	ra,0xffffc
    80005518:	080080e7          	jalr	128(ra) # 80001594 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    8000551c:	00092703          	lw	a4,0(s2)
    80005520:	0027179b          	slliw	a5,a4,0x2
    80005524:	00e787bb          	addw	a5,a5,a4
    80005528:	02f4e7bb          	remw	a5,s1,a5
    8000552c:	fa0786e3          	beqz	a5,800054d8 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005530:	05000793          	li	a5,80
    80005534:	02f4e4bb          	remw	s1,s1,a5
    80005538:	fa049ce3          	bnez	s1,800054f0 <_ZN12ConsumerSync8consumerEPv+0x48>
    8000553c:	fa9ff06f          	j	800054e4 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005540:	0209b783          	ld	a5,32(s3)
    80005544:	0087b503          	ld	a0,8(a5)
    80005548:	00001097          	auipc	ra,0x1
    8000554c:	b4c080e7          	jalr	-1204(ra) # 80006094 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005550:	0ff57513          	andi	a0,a0,255
    80005554:	ffffd097          	auipc	ra,0xffffd
    80005558:	69c080e7          	jalr	1692(ra) # 80002bf0 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    8000555c:	0209b783          	ld	a5,32(s3)
    80005560:	0087b503          	ld	a0,8(a5)
    80005564:	00001097          	auipc	ra,0x1
    80005568:	bbc080e7          	jalr	-1092(ra) # 80006120 <_ZN9BufferCPP6getCntEv>
    8000556c:	fca04ae3          	bgtz	a0,80005540 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005570:	01093503          	ld	a0,16(s2)
    80005574:	ffffd097          	auipc	ra,0xffffd
    80005578:	5b8080e7          	jalr	1464(ra) # 80002b2c <_ZN9Semaphore6signalEv>
}
    8000557c:	02813083          	ld	ra,40(sp)
    80005580:	02013403          	ld	s0,32(sp)
    80005584:	01813483          	ld	s1,24(sp)
    80005588:	01013903          	ld	s2,16(sp)
    8000558c:	00813983          	ld	s3,8(sp)
    80005590:	00013a03          	ld	s4,0(sp)
    80005594:	03010113          	addi	sp,sp,48
    80005598:	00008067          	ret

000000008000559c <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    8000559c:	f8010113          	addi	sp,sp,-128
    800055a0:	06113c23          	sd	ra,120(sp)
    800055a4:	06813823          	sd	s0,112(sp)
    800055a8:	06913423          	sd	s1,104(sp)
    800055ac:	07213023          	sd	s2,96(sp)
    800055b0:	05313c23          	sd	s3,88(sp)
    800055b4:	05413823          	sd	s4,80(sp)
    800055b8:	05513423          	sd	s5,72(sp)
    800055bc:	05613023          	sd	s6,64(sp)
    800055c0:	03713c23          	sd	s7,56(sp)
    800055c4:	03813823          	sd	s8,48(sp)
    800055c8:	03913423          	sd	s9,40(sp)
    800055cc:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800055d0:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800055d4:	00005517          	auipc	a0,0x5
    800055d8:	c9c50513          	addi	a0,a0,-868 # 8000a270 <_ZZ9kPrintIntmE6digits+0x200>
    800055dc:	00000097          	auipc	ra,0x0
    800055e0:	604080e7          	jalr	1540(ra) # 80005be0 <_Z11printStringPKc>
    getString(input, 30);
    800055e4:	01e00593          	li	a1,30
    800055e8:	f8040493          	addi	s1,s0,-128
    800055ec:	00048513          	mv	a0,s1
    800055f0:	00000097          	auipc	ra,0x0
    800055f4:	678080e7          	jalr	1656(ra) # 80005c68 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800055f8:	00048513          	mv	a0,s1
    800055fc:	00000097          	auipc	ra,0x0
    80005600:	744080e7          	jalr	1860(ra) # 80005d40 <_Z11stringToIntPKc>
    80005604:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005608:	00005517          	auipc	a0,0x5
    8000560c:	c8850513          	addi	a0,a0,-888 # 8000a290 <_ZZ9kPrintIntmE6digits+0x220>
    80005610:	00000097          	auipc	ra,0x0
    80005614:	5d0080e7          	jalr	1488(ra) # 80005be0 <_Z11printStringPKc>
    getString(input, 30);
    80005618:	01e00593          	li	a1,30
    8000561c:	00048513          	mv	a0,s1
    80005620:	00000097          	auipc	ra,0x0
    80005624:	648080e7          	jalr	1608(ra) # 80005c68 <_Z9getStringPci>
    n = stringToInt(input);
    80005628:	00048513          	mv	a0,s1
    8000562c:	00000097          	auipc	ra,0x0
    80005630:	714080e7          	jalr	1812(ra) # 80005d40 <_Z11stringToIntPKc>
    80005634:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005638:	00005517          	auipc	a0,0x5
    8000563c:	c7850513          	addi	a0,a0,-904 # 8000a2b0 <_ZZ9kPrintIntmE6digits+0x240>
    80005640:	00000097          	auipc	ra,0x0
    80005644:	5a0080e7          	jalr	1440(ra) # 80005be0 <_Z11printStringPKc>
    80005648:	00000613          	li	a2,0
    8000564c:	00a00593          	li	a1,10
    80005650:	00090513          	mv	a0,s2
    80005654:	00000097          	auipc	ra,0x0
    80005658:	73c080e7          	jalr	1852(ra) # 80005d90 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    8000565c:	00005517          	auipc	a0,0x5
    80005660:	c6c50513          	addi	a0,a0,-916 # 8000a2c8 <_ZZ9kPrintIntmE6digits+0x258>
    80005664:	00000097          	auipc	ra,0x0
    80005668:	57c080e7          	jalr	1404(ra) # 80005be0 <_Z11printStringPKc>
    8000566c:	00000613          	li	a2,0
    80005670:	00a00593          	li	a1,10
    80005674:	00048513          	mv	a0,s1
    80005678:	00000097          	auipc	ra,0x0
    8000567c:	718080e7          	jalr	1816(ra) # 80005d90 <_Z8printIntiii>
    printString(".\n");
    80005680:	00005517          	auipc	a0,0x5
    80005684:	c6050513          	addi	a0,a0,-928 # 8000a2e0 <_ZZ9kPrintIntmE6digits+0x270>
    80005688:	00000097          	auipc	ra,0x0
    8000568c:	558080e7          	jalr	1368(ra) # 80005be0 <_Z11printStringPKc>
    if(threadNum > n) {
    80005690:	0324c463          	blt	s1,s2,800056b8 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005694:	03205c63          	blez	s2,800056cc <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005698:	03800513          	li	a0,56
    8000569c:	ffffd097          	auipc	ra,0xffffd
    800056a0:	0e0080e7          	jalr	224(ra) # 8000277c <_Znwm>
    800056a4:	00050a93          	mv	s5,a0
    800056a8:	00048593          	mv	a1,s1
    800056ac:	00001097          	auipc	ra,0x1
    800056b0:	804080e7          	jalr	-2044(ra) # 80005eb0 <_ZN9BufferCPPC1Ei>
    800056b4:	0300006f          	j	800056e4 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800056b8:	00005517          	auipc	a0,0x5
    800056bc:	c3050513          	addi	a0,a0,-976 # 8000a2e8 <_ZZ9kPrintIntmE6digits+0x278>
    800056c0:	00000097          	auipc	ra,0x0
    800056c4:	520080e7          	jalr	1312(ra) # 80005be0 <_Z11printStringPKc>
        return;
    800056c8:	0140006f          	j	800056dc <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800056cc:	00005517          	auipc	a0,0x5
    800056d0:	c5c50513          	addi	a0,a0,-932 # 8000a328 <_ZZ9kPrintIntmE6digits+0x2b8>
    800056d4:	00000097          	auipc	ra,0x0
    800056d8:	50c080e7          	jalr	1292(ra) # 80005be0 <_Z11printStringPKc>
        return;
    800056dc:	000b8113          	mv	sp,s7
    800056e0:	2380006f          	j	80005918 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800056e4:	01000513          	li	a0,16
    800056e8:	ffffd097          	auipc	ra,0xffffd
    800056ec:	094080e7          	jalr	148(ra) # 8000277c <_Znwm>
    800056f0:	00050493          	mv	s1,a0
    800056f4:	00000593          	li	a1,0
    800056f8:	ffffd097          	auipc	ra,0xffffd
    800056fc:	3d0080e7          	jalr	976(ra) # 80002ac8 <_ZN9SemaphoreC1Ej>
    80005700:	00007797          	auipc	a5,0x7
    80005704:	7897b023          	sd	s1,1920(a5) # 8000ce80 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005708:	00391793          	slli	a5,s2,0x3
    8000570c:	00f78793          	addi	a5,a5,15
    80005710:	ff07f793          	andi	a5,a5,-16
    80005714:	40f10133          	sub	sp,sp,a5
    80005718:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    8000571c:	0019071b          	addiw	a4,s2,1
    80005720:	00171793          	slli	a5,a4,0x1
    80005724:	00e787b3          	add	a5,a5,a4
    80005728:	00379793          	slli	a5,a5,0x3
    8000572c:	00f78793          	addi	a5,a5,15
    80005730:	ff07f793          	andi	a5,a5,-16
    80005734:	40f10133          	sub	sp,sp,a5
    80005738:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    8000573c:	00191c13          	slli	s8,s2,0x1
    80005740:	012c07b3          	add	a5,s8,s2
    80005744:	00379793          	slli	a5,a5,0x3
    80005748:	00fa07b3          	add	a5,s4,a5
    8000574c:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005750:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005754:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005758:	02800513          	li	a0,40
    8000575c:	ffffd097          	auipc	ra,0xffffd
    80005760:	020080e7          	jalr	32(ra) # 8000277c <_Znwm>
    80005764:	00050b13          	mv	s6,a0
    80005768:	012c0c33          	add	s8,s8,s2
    8000576c:	003c1c13          	slli	s8,s8,0x3
    80005770:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005774:	ffffd097          	auipc	ra,0xffffd
    80005778:	2d8080e7          	jalr	728(ra) # 80002a4c <_ZN6ThreadC1Ev>
    8000577c:	00007797          	auipc	a5,0x7
    80005780:	4bc78793          	addi	a5,a5,1212 # 8000cc38 <_ZTV12ConsumerSync+0x10>
    80005784:	00fb3023          	sd	a5,0(s6)
    80005788:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    8000578c:	000b0513          	mv	a0,s6
    80005790:	ffffd097          	auipc	ra,0xffffd
    80005794:	19c080e7          	jalr	412(ra) # 8000292c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005798:	00000493          	li	s1,0
    8000579c:	0380006f          	j	800057d4 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800057a0:	00007797          	auipc	a5,0x7
    800057a4:	47078793          	addi	a5,a5,1136 # 8000cc10 <_ZTV12ProducerSync+0x10>
    800057a8:	00fcb023          	sd	a5,0(s9)
    800057ac:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    800057b0:	00349793          	slli	a5,s1,0x3
    800057b4:	00f987b3          	add	a5,s3,a5
    800057b8:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800057bc:	00349793          	slli	a5,s1,0x3
    800057c0:	00f987b3          	add	a5,s3,a5
    800057c4:	0007b503          	ld	a0,0(a5)
    800057c8:	ffffd097          	auipc	ra,0xffffd
    800057cc:	164080e7          	jalr	356(ra) # 8000292c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800057d0:	0014849b          	addiw	s1,s1,1
    800057d4:	0b24d063          	bge	s1,s2,80005874 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800057d8:	00149793          	slli	a5,s1,0x1
    800057dc:	009787b3          	add	a5,a5,s1
    800057e0:	00379793          	slli	a5,a5,0x3
    800057e4:	00fa07b3          	add	a5,s4,a5
    800057e8:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800057ec:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800057f0:	00007717          	auipc	a4,0x7
    800057f4:	69073703          	ld	a4,1680(a4) # 8000ce80 <_ZL10waitForAll>
    800057f8:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800057fc:	02905863          	blez	s1,8000582c <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005800:	02800513          	li	a0,40
    80005804:	ffffd097          	auipc	ra,0xffffd
    80005808:	f78080e7          	jalr	-136(ra) # 8000277c <_Znwm>
    8000580c:	00050c93          	mv	s9,a0
    80005810:	00149c13          	slli	s8,s1,0x1
    80005814:	009c0c33          	add	s8,s8,s1
    80005818:	003c1c13          	slli	s8,s8,0x3
    8000581c:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005820:	ffffd097          	auipc	ra,0xffffd
    80005824:	22c080e7          	jalr	556(ra) # 80002a4c <_ZN6ThreadC1Ev>
    80005828:	f79ff06f          	j	800057a0 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    8000582c:	02800513          	li	a0,40
    80005830:	ffffd097          	auipc	ra,0xffffd
    80005834:	f4c080e7          	jalr	-180(ra) # 8000277c <_Znwm>
    80005838:	00050c93          	mv	s9,a0
    8000583c:	00149c13          	slli	s8,s1,0x1
    80005840:	009c0c33          	add	s8,s8,s1
    80005844:	003c1c13          	slli	s8,s8,0x3
    80005848:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    8000584c:	ffffd097          	auipc	ra,0xffffd
    80005850:	200080e7          	jalr	512(ra) # 80002a4c <_ZN6ThreadC1Ev>
    80005854:	00007797          	auipc	a5,0x7
    80005858:	39478793          	addi	a5,a5,916 # 8000cbe8 <_ZTV16ProducerKeyboard+0x10>
    8000585c:	00fcb023          	sd	a5,0(s9)
    80005860:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005864:	00349793          	slli	a5,s1,0x3
    80005868:	00f987b3          	add	a5,s3,a5
    8000586c:	0197b023          	sd	s9,0(a5)
    80005870:	f4dff06f          	j	800057bc <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005874:	ffffd097          	auipc	ra,0xffffd
    80005878:	11c080e7          	jalr	284(ra) # 80002990 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    8000587c:	00000493          	li	s1,0
    80005880:	00994e63          	blt	s2,s1,8000589c <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005884:	00007517          	auipc	a0,0x7
    80005888:	5fc53503          	ld	a0,1532(a0) # 8000ce80 <_ZL10waitForAll>
    8000588c:	ffffd097          	auipc	ra,0xffffd
    80005890:	274080e7          	jalr	628(ra) # 80002b00 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005894:	0014849b          	addiw	s1,s1,1
    80005898:	fe9ff06f          	j	80005880 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    8000589c:	00000493          	li	s1,0
    800058a0:	0080006f          	j	800058a8 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    800058a4:	0014849b          	addiw	s1,s1,1
    800058a8:	0324d263          	bge	s1,s2,800058cc <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    800058ac:	00349793          	slli	a5,s1,0x3
    800058b0:	00f987b3          	add	a5,s3,a5
    800058b4:	0007b503          	ld	a0,0(a5)
    800058b8:	fe0506e3          	beqz	a0,800058a4 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800058bc:	00053783          	ld	a5,0(a0)
    800058c0:	0087b783          	ld	a5,8(a5)
    800058c4:	000780e7          	jalr	a5
    800058c8:	fddff06f          	j	800058a4 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800058cc:	000b0a63          	beqz	s6,800058e0 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800058d0:	000b3783          	ld	a5,0(s6)
    800058d4:	0087b783          	ld	a5,8(a5)
    800058d8:	000b0513          	mv	a0,s6
    800058dc:	000780e7          	jalr	a5
    delete waitForAll;
    800058e0:	00007517          	auipc	a0,0x7
    800058e4:	5a053503          	ld	a0,1440(a0) # 8000ce80 <_ZL10waitForAll>
    800058e8:	00050863          	beqz	a0,800058f8 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800058ec:	00053783          	ld	a5,0(a0)
    800058f0:	0087b783          	ld	a5,8(a5)
    800058f4:	000780e7          	jalr	a5
    delete buffer;
    800058f8:	000a8e63          	beqz	s5,80005914 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800058fc:	000a8513          	mv	a0,s5
    80005900:	00001097          	auipc	ra,0x1
    80005904:	8a8080e7          	jalr	-1880(ra) # 800061a8 <_ZN9BufferCPPD1Ev>
    80005908:	000a8513          	mv	a0,s5
    8000590c:	ffffd097          	auipc	ra,0xffffd
    80005910:	ec0080e7          	jalr	-320(ra) # 800027cc <_ZdlPv>
    80005914:	000b8113          	mv	sp,s7

}
    80005918:	f8040113          	addi	sp,s0,-128
    8000591c:	07813083          	ld	ra,120(sp)
    80005920:	07013403          	ld	s0,112(sp)
    80005924:	06813483          	ld	s1,104(sp)
    80005928:	06013903          	ld	s2,96(sp)
    8000592c:	05813983          	ld	s3,88(sp)
    80005930:	05013a03          	ld	s4,80(sp)
    80005934:	04813a83          	ld	s5,72(sp)
    80005938:	04013b03          	ld	s6,64(sp)
    8000593c:	03813b83          	ld	s7,56(sp)
    80005940:	03013c03          	ld	s8,48(sp)
    80005944:	02813c83          	ld	s9,40(sp)
    80005948:	08010113          	addi	sp,sp,128
    8000594c:	00008067          	ret
    80005950:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005954:	000a8513          	mv	a0,s5
    80005958:	ffffd097          	auipc	ra,0xffffd
    8000595c:	e74080e7          	jalr	-396(ra) # 800027cc <_ZdlPv>
    80005960:	00048513          	mv	a0,s1
    80005964:	00008097          	auipc	ra,0x8
    80005968:	614080e7          	jalr	1556(ra) # 8000df78 <_Unwind_Resume>
    8000596c:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005970:	00048513          	mv	a0,s1
    80005974:	ffffd097          	auipc	ra,0xffffd
    80005978:	e58080e7          	jalr	-424(ra) # 800027cc <_ZdlPv>
    8000597c:	00090513          	mv	a0,s2
    80005980:	00008097          	auipc	ra,0x8
    80005984:	5f8080e7          	jalr	1528(ra) # 8000df78 <_Unwind_Resume>
    80005988:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    8000598c:	000b0513          	mv	a0,s6
    80005990:	ffffd097          	auipc	ra,0xffffd
    80005994:	e3c080e7          	jalr	-452(ra) # 800027cc <_ZdlPv>
    80005998:	00048513          	mv	a0,s1
    8000599c:	00008097          	auipc	ra,0x8
    800059a0:	5dc080e7          	jalr	1500(ra) # 8000df78 <_Unwind_Resume>
    800059a4:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    800059a8:	000c8513          	mv	a0,s9
    800059ac:	ffffd097          	auipc	ra,0xffffd
    800059b0:	e20080e7          	jalr	-480(ra) # 800027cc <_ZdlPv>
    800059b4:	00048513          	mv	a0,s1
    800059b8:	00008097          	auipc	ra,0x8
    800059bc:	5c0080e7          	jalr	1472(ra) # 8000df78 <_Unwind_Resume>
    800059c0:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800059c4:	000c8513          	mv	a0,s9
    800059c8:	ffffd097          	auipc	ra,0xffffd
    800059cc:	e04080e7          	jalr	-508(ra) # 800027cc <_ZdlPv>
    800059d0:	00048513          	mv	a0,s1
    800059d4:	00008097          	auipc	ra,0x8
    800059d8:	5a4080e7          	jalr	1444(ra) # 8000df78 <_Unwind_Resume>

00000000800059dc <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800059dc:	ff010113          	addi	sp,sp,-16
    800059e0:	00113423          	sd	ra,8(sp)
    800059e4:	00813023          	sd	s0,0(sp)
    800059e8:	01010413          	addi	s0,sp,16
    800059ec:	00007797          	auipc	a5,0x7
    800059f0:	24c78793          	addi	a5,a5,588 # 8000cc38 <_ZTV12ConsumerSync+0x10>
    800059f4:	00f53023          	sd	a5,0(a0)
    800059f8:	ffffd097          	auipc	ra,0xffffd
    800059fc:	c94080e7          	jalr	-876(ra) # 8000268c <_ZN6ThreadD1Ev>
    80005a00:	00813083          	ld	ra,8(sp)
    80005a04:	00013403          	ld	s0,0(sp)
    80005a08:	01010113          	addi	sp,sp,16
    80005a0c:	00008067          	ret

0000000080005a10 <_ZN12ConsumerSyncD0Ev>:
    80005a10:	fe010113          	addi	sp,sp,-32
    80005a14:	00113c23          	sd	ra,24(sp)
    80005a18:	00813823          	sd	s0,16(sp)
    80005a1c:	00913423          	sd	s1,8(sp)
    80005a20:	02010413          	addi	s0,sp,32
    80005a24:	00050493          	mv	s1,a0
    80005a28:	00007797          	auipc	a5,0x7
    80005a2c:	21078793          	addi	a5,a5,528 # 8000cc38 <_ZTV12ConsumerSync+0x10>
    80005a30:	00f53023          	sd	a5,0(a0)
    80005a34:	ffffd097          	auipc	ra,0xffffd
    80005a38:	c58080e7          	jalr	-936(ra) # 8000268c <_ZN6ThreadD1Ev>
    80005a3c:	00048513          	mv	a0,s1
    80005a40:	ffffd097          	auipc	ra,0xffffd
    80005a44:	d8c080e7          	jalr	-628(ra) # 800027cc <_ZdlPv>
    80005a48:	01813083          	ld	ra,24(sp)
    80005a4c:	01013403          	ld	s0,16(sp)
    80005a50:	00813483          	ld	s1,8(sp)
    80005a54:	02010113          	addi	sp,sp,32
    80005a58:	00008067          	ret

0000000080005a5c <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005a5c:	ff010113          	addi	sp,sp,-16
    80005a60:	00113423          	sd	ra,8(sp)
    80005a64:	00813023          	sd	s0,0(sp)
    80005a68:	01010413          	addi	s0,sp,16
    80005a6c:	00007797          	auipc	a5,0x7
    80005a70:	1a478793          	addi	a5,a5,420 # 8000cc10 <_ZTV12ProducerSync+0x10>
    80005a74:	00f53023          	sd	a5,0(a0)
    80005a78:	ffffd097          	auipc	ra,0xffffd
    80005a7c:	c14080e7          	jalr	-1004(ra) # 8000268c <_ZN6ThreadD1Ev>
    80005a80:	00813083          	ld	ra,8(sp)
    80005a84:	00013403          	ld	s0,0(sp)
    80005a88:	01010113          	addi	sp,sp,16
    80005a8c:	00008067          	ret

0000000080005a90 <_ZN12ProducerSyncD0Ev>:
    80005a90:	fe010113          	addi	sp,sp,-32
    80005a94:	00113c23          	sd	ra,24(sp)
    80005a98:	00813823          	sd	s0,16(sp)
    80005a9c:	00913423          	sd	s1,8(sp)
    80005aa0:	02010413          	addi	s0,sp,32
    80005aa4:	00050493          	mv	s1,a0
    80005aa8:	00007797          	auipc	a5,0x7
    80005aac:	16878793          	addi	a5,a5,360 # 8000cc10 <_ZTV12ProducerSync+0x10>
    80005ab0:	00f53023          	sd	a5,0(a0)
    80005ab4:	ffffd097          	auipc	ra,0xffffd
    80005ab8:	bd8080e7          	jalr	-1064(ra) # 8000268c <_ZN6ThreadD1Ev>
    80005abc:	00048513          	mv	a0,s1
    80005ac0:	ffffd097          	auipc	ra,0xffffd
    80005ac4:	d0c080e7          	jalr	-756(ra) # 800027cc <_ZdlPv>
    80005ac8:	01813083          	ld	ra,24(sp)
    80005acc:	01013403          	ld	s0,16(sp)
    80005ad0:	00813483          	ld	s1,8(sp)
    80005ad4:	02010113          	addi	sp,sp,32
    80005ad8:	00008067          	ret

0000000080005adc <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005adc:	ff010113          	addi	sp,sp,-16
    80005ae0:	00113423          	sd	ra,8(sp)
    80005ae4:	00813023          	sd	s0,0(sp)
    80005ae8:	01010413          	addi	s0,sp,16
    80005aec:	00007797          	auipc	a5,0x7
    80005af0:	0fc78793          	addi	a5,a5,252 # 8000cbe8 <_ZTV16ProducerKeyboard+0x10>
    80005af4:	00f53023          	sd	a5,0(a0)
    80005af8:	ffffd097          	auipc	ra,0xffffd
    80005afc:	b94080e7          	jalr	-1132(ra) # 8000268c <_ZN6ThreadD1Ev>
    80005b00:	00813083          	ld	ra,8(sp)
    80005b04:	00013403          	ld	s0,0(sp)
    80005b08:	01010113          	addi	sp,sp,16
    80005b0c:	00008067          	ret

0000000080005b10 <_ZN16ProducerKeyboardD0Ev>:
    80005b10:	fe010113          	addi	sp,sp,-32
    80005b14:	00113c23          	sd	ra,24(sp)
    80005b18:	00813823          	sd	s0,16(sp)
    80005b1c:	00913423          	sd	s1,8(sp)
    80005b20:	02010413          	addi	s0,sp,32
    80005b24:	00050493          	mv	s1,a0
    80005b28:	00007797          	auipc	a5,0x7
    80005b2c:	0c078793          	addi	a5,a5,192 # 8000cbe8 <_ZTV16ProducerKeyboard+0x10>
    80005b30:	00f53023          	sd	a5,0(a0)
    80005b34:	ffffd097          	auipc	ra,0xffffd
    80005b38:	b58080e7          	jalr	-1192(ra) # 8000268c <_ZN6ThreadD1Ev>
    80005b3c:	00048513          	mv	a0,s1
    80005b40:	ffffd097          	auipc	ra,0xffffd
    80005b44:	c8c080e7          	jalr	-884(ra) # 800027cc <_ZdlPv>
    80005b48:	01813083          	ld	ra,24(sp)
    80005b4c:	01013403          	ld	s0,16(sp)
    80005b50:	00813483          	ld	s1,8(sp)
    80005b54:	02010113          	addi	sp,sp,32
    80005b58:	00008067          	ret

0000000080005b5c <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005b5c:	ff010113          	addi	sp,sp,-16
    80005b60:	00113423          	sd	ra,8(sp)
    80005b64:	00813023          	sd	s0,0(sp)
    80005b68:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005b6c:	02053583          	ld	a1,32(a0)
    80005b70:	fffff097          	auipc	ra,0xfffff
    80005b74:	7e4080e7          	jalr	2020(ra) # 80005354 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005b78:	00813083          	ld	ra,8(sp)
    80005b7c:	00013403          	ld	s0,0(sp)
    80005b80:	01010113          	addi	sp,sp,16
    80005b84:	00008067          	ret

0000000080005b88 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005b88:	ff010113          	addi	sp,sp,-16
    80005b8c:	00113423          	sd	ra,8(sp)
    80005b90:	00813023          	sd	s0,0(sp)
    80005b94:	01010413          	addi	s0,sp,16
        producer(td);
    80005b98:	02053583          	ld	a1,32(a0)
    80005b9c:	00000097          	auipc	ra,0x0
    80005ba0:	878080e7          	jalr	-1928(ra) # 80005414 <_ZN12ProducerSync8producerEPv>
    }
    80005ba4:	00813083          	ld	ra,8(sp)
    80005ba8:	00013403          	ld	s0,0(sp)
    80005bac:	01010113          	addi	sp,sp,16
    80005bb0:	00008067          	ret

0000000080005bb4 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005bb4:	ff010113          	addi	sp,sp,-16
    80005bb8:	00113423          	sd	ra,8(sp)
    80005bbc:	00813023          	sd	s0,0(sp)
    80005bc0:	01010413          	addi	s0,sp,16
        consumer(td);
    80005bc4:	02053583          	ld	a1,32(a0)
    80005bc8:	00000097          	auipc	ra,0x0
    80005bcc:	8e0080e7          	jalr	-1824(ra) # 800054a8 <_ZN12ConsumerSync8consumerEPv>
    }
    80005bd0:	00813083          	ld	ra,8(sp)
    80005bd4:	00013403          	ld	s0,0(sp)
    80005bd8:	01010113          	addi	sp,sp,16
    80005bdc:	00008067          	ret

0000000080005be0 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005be0:	fe010113          	addi	sp,sp,-32
    80005be4:	00113c23          	sd	ra,24(sp)
    80005be8:	00813823          	sd	s0,16(sp)
    80005bec:	00913423          	sd	s1,8(sp)
    80005bf0:	02010413          	addi	s0,sp,32
    80005bf4:	00050493          	mv	s1,a0
    LOCK();
    80005bf8:	00100613          	li	a2,1
    80005bfc:	00000593          	li	a1,0
    80005c00:	00007517          	auipc	a0,0x7
    80005c04:	28850513          	addi	a0,a0,648 # 8000ce88 <lockPrint>
    80005c08:	ffffb097          	auipc	ra,0xffffb
    80005c0c:	51c080e7          	jalr	1308(ra) # 80001124 <copy_and_swap>
    80005c10:	00050863          	beqz	a0,80005c20 <_Z11printStringPKc+0x40>
    80005c14:	ffffc097          	auipc	ra,0xffffc
    80005c18:	818080e7          	jalr	-2024(ra) # 8000142c <_Z15thread_dispatchv>
    80005c1c:	fddff06f          	j	80005bf8 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005c20:	0004c503          	lbu	a0,0(s1)
    80005c24:	00050a63          	beqz	a0,80005c38 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005c28:	ffffc097          	auipc	ra,0xffffc
    80005c2c:	96c080e7          	jalr	-1684(ra) # 80001594 <_Z4putcc>
        string++;
    80005c30:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005c34:	fedff06f          	j	80005c20 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005c38:	00000613          	li	a2,0
    80005c3c:	00100593          	li	a1,1
    80005c40:	00007517          	auipc	a0,0x7
    80005c44:	24850513          	addi	a0,a0,584 # 8000ce88 <lockPrint>
    80005c48:	ffffb097          	auipc	ra,0xffffb
    80005c4c:	4dc080e7          	jalr	1244(ra) # 80001124 <copy_and_swap>
    80005c50:	fe0514e3          	bnez	a0,80005c38 <_Z11printStringPKc+0x58>
}
    80005c54:	01813083          	ld	ra,24(sp)
    80005c58:	01013403          	ld	s0,16(sp)
    80005c5c:	00813483          	ld	s1,8(sp)
    80005c60:	02010113          	addi	sp,sp,32
    80005c64:	00008067          	ret

0000000080005c68 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005c68:	fd010113          	addi	sp,sp,-48
    80005c6c:	02113423          	sd	ra,40(sp)
    80005c70:	02813023          	sd	s0,32(sp)
    80005c74:	00913c23          	sd	s1,24(sp)
    80005c78:	01213823          	sd	s2,16(sp)
    80005c7c:	01313423          	sd	s3,8(sp)
    80005c80:	01413023          	sd	s4,0(sp)
    80005c84:	03010413          	addi	s0,sp,48
    80005c88:	00050993          	mv	s3,a0
    80005c8c:	00058a13          	mv	s4,a1
    LOCK();
    80005c90:	00100613          	li	a2,1
    80005c94:	00000593          	li	a1,0
    80005c98:	00007517          	auipc	a0,0x7
    80005c9c:	1f050513          	addi	a0,a0,496 # 8000ce88 <lockPrint>
    80005ca0:	ffffb097          	auipc	ra,0xffffb
    80005ca4:	484080e7          	jalr	1156(ra) # 80001124 <copy_and_swap>
    80005ca8:	00050863          	beqz	a0,80005cb8 <_Z9getStringPci+0x50>
    80005cac:	ffffb097          	auipc	ra,0xffffb
    80005cb0:	780080e7          	jalr	1920(ra) # 8000142c <_Z15thread_dispatchv>
    80005cb4:	fddff06f          	j	80005c90 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005cb8:	00000913          	li	s2,0
    80005cbc:	00090493          	mv	s1,s2
    80005cc0:	0019091b          	addiw	s2,s2,1
    80005cc4:	03495a63          	bge	s2,s4,80005cf8 <_Z9getStringPci+0x90>
        cc = getc();
    80005cc8:	ffffc097          	auipc	ra,0xffffc
    80005ccc:	8a4080e7          	jalr	-1884(ra) # 8000156c <_Z4getcv>
        if(cc < 1)
    80005cd0:	02050463          	beqz	a0,80005cf8 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005cd4:	009984b3          	add	s1,s3,s1
    80005cd8:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005cdc:	00a00793          	li	a5,10
    80005ce0:	00f50a63          	beq	a0,a5,80005cf4 <_Z9getStringPci+0x8c>
    80005ce4:	00d00793          	li	a5,13
    80005ce8:	fcf51ae3          	bne	a0,a5,80005cbc <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005cec:	00090493          	mv	s1,s2
    80005cf0:	0080006f          	j	80005cf8 <_Z9getStringPci+0x90>
    80005cf4:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005cf8:	009984b3          	add	s1,s3,s1
    80005cfc:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005d00:	00000613          	li	a2,0
    80005d04:	00100593          	li	a1,1
    80005d08:	00007517          	auipc	a0,0x7
    80005d0c:	18050513          	addi	a0,a0,384 # 8000ce88 <lockPrint>
    80005d10:	ffffb097          	auipc	ra,0xffffb
    80005d14:	414080e7          	jalr	1044(ra) # 80001124 <copy_and_swap>
    80005d18:	fe0514e3          	bnez	a0,80005d00 <_Z9getStringPci+0x98>
    return buf;
}
    80005d1c:	00098513          	mv	a0,s3
    80005d20:	02813083          	ld	ra,40(sp)
    80005d24:	02013403          	ld	s0,32(sp)
    80005d28:	01813483          	ld	s1,24(sp)
    80005d2c:	01013903          	ld	s2,16(sp)
    80005d30:	00813983          	ld	s3,8(sp)
    80005d34:	00013a03          	ld	s4,0(sp)
    80005d38:	03010113          	addi	sp,sp,48
    80005d3c:	00008067          	ret

0000000080005d40 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005d40:	ff010113          	addi	sp,sp,-16
    80005d44:	00813423          	sd	s0,8(sp)
    80005d48:	01010413          	addi	s0,sp,16
    80005d4c:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005d50:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005d54:	0006c603          	lbu	a2,0(a3)
    80005d58:	fd06071b          	addiw	a4,a2,-48
    80005d5c:	0ff77713          	andi	a4,a4,255
    80005d60:	00900793          	li	a5,9
    80005d64:	02e7e063          	bltu	a5,a4,80005d84 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005d68:	0025179b          	slliw	a5,a0,0x2
    80005d6c:	00a787bb          	addw	a5,a5,a0
    80005d70:	0017979b          	slliw	a5,a5,0x1
    80005d74:	00168693          	addi	a3,a3,1
    80005d78:	00c787bb          	addw	a5,a5,a2
    80005d7c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005d80:	fd5ff06f          	j	80005d54 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005d84:	00813403          	ld	s0,8(sp)
    80005d88:	01010113          	addi	sp,sp,16
    80005d8c:	00008067          	ret

0000000080005d90 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005d90:	fc010113          	addi	sp,sp,-64
    80005d94:	02113c23          	sd	ra,56(sp)
    80005d98:	02813823          	sd	s0,48(sp)
    80005d9c:	02913423          	sd	s1,40(sp)
    80005da0:	03213023          	sd	s2,32(sp)
    80005da4:	01313c23          	sd	s3,24(sp)
    80005da8:	04010413          	addi	s0,sp,64
    80005dac:	00050493          	mv	s1,a0
    80005db0:	00058913          	mv	s2,a1
    80005db4:	00060993          	mv	s3,a2
    LOCK();
    80005db8:	00100613          	li	a2,1
    80005dbc:	00000593          	li	a1,0
    80005dc0:	00007517          	auipc	a0,0x7
    80005dc4:	0c850513          	addi	a0,a0,200 # 8000ce88 <lockPrint>
    80005dc8:	ffffb097          	auipc	ra,0xffffb
    80005dcc:	35c080e7          	jalr	860(ra) # 80001124 <copy_and_swap>
    80005dd0:	00050863          	beqz	a0,80005de0 <_Z8printIntiii+0x50>
    80005dd4:	ffffb097          	auipc	ra,0xffffb
    80005dd8:	658080e7          	jalr	1624(ra) # 8000142c <_Z15thread_dispatchv>
    80005ddc:	fddff06f          	j	80005db8 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005de0:	00098463          	beqz	s3,80005de8 <_Z8printIntiii+0x58>
    80005de4:	0804c463          	bltz	s1,80005e6c <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005de8:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005dec:	00000593          	li	a1,0
    }

    i = 0;
    80005df0:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005df4:	0009079b          	sext.w	a5,s2
    80005df8:	0325773b          	remuw	a4,a0,s2
    80005dfc:	00048613          	mv	a2,s1
    80005e00:	0014849b          	addiw	s1,s1,1
    80005e04:	02071693          	slli	a3,a4,0x20
    80005e08:	0206d693          	srli	a3,a3,0x20
    80005e0c:	00007717          	auipc	a4,0x7
    80005e10:	e4470713          	addi	a4,a4,-444 # 8000cc50 <digits>
    80005e14:	00d70733          	add	a4,a4,a3
    80005e18:	00074683          	lbu	a3,0(a4)
    80005e1c:	fd040713          	addi	a4,s0,-48
    80005e20:	00c70733          	add	a4,a4,a2
    80005e24:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005e28:	0005071b          	sext.w	a4,a0
    80005e2c:	0325553b          	divuw	a0,a0,s2
    80005e30:	fcf772e3          	bgeu	a4,a5,80005df4 <_Z8printIntiii+0x64>
    if(neg)
    80005e34:	00058c63          	beqz	a1,80005e4c <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005e38:	fd040793          	addi	a5,s0,-48
    80005e3c:	009784b3          	add	s1,a5,s1
    80005e40:	02d00793          	li	a5,45
    80005e44:	fef48823          	sb	a5,-16(s1)
    80005e48:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005e4c:	fff4849b          	addiw	s1,s1,-1
    80005e50:	0204c463          	bltz	s1,80005e78 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005e54:	fd040793          	addi	a5,s0,-48
    80005e58:	009787b3          	add	a5,a5,s1
    80005e5c:	ff07c503          	lbu	a0,-16(a5)
    80005e60:	ffffb097          	auipc	ra,0xffffb
    80005e64:	734080e7          	jalr	1844(ra) # 80001594 <_Z4putcc>
    80005e68:	fe5ff06f          	j	80005e4c <_Z8printIntiii+0xbc>
        x = -xx;
    80005e6c:	4090053b          	negw	a0,s1
        neg = 1;
    80005e70:	00100593          	li	a1,1
        x = -xx;
    80005e74:	f7dff06f          	j	80005df0 <_Z8printIntiii+0x60>

    UNLOCK();
    80005e78:	00000613          	li	a2,0
    80005e7c:	00100593          	li	a1,1
    80005e80:	00007517          	auipc	a0,0x7
    80005e84:	00850513          	addi	a0,a0,8 # 8000ce88 <lockPrint>
    80005e88:	ffffb097          	auipc	ra,0xffffb
    80005e8c:	29c080e7          	jalr	668(ra) # 80001124 <copy_and_swap>
    80005e90:	fe0514e3          	bnez	a0,80005e78 <_Z8printIntiii+0xe8>
    80005e94:	03813083          	ld	ra,56(sp)
    80005e98:	03013403          	ld	s0,48(sp)
    80005e9c:	02813483          	ld	s1,40(sp)
    80005ea0:	02013903          	ld	s2,32(sp)
    80005ea4:	01813983          	ld	s3,24(sp)
    80005ea8:	04010113          	addi	sp,sp,64
    80005eac:	00008067          	ret

0000000080005eb0 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005eb0:	fd010113          	addi	sp,sp,-48
    80005eb4:	02113423          	sd	ra,40(sp)
    80005eb8:	02813023          	sd	s0,32(sp)
    80005ebc:	00913c23          	sd	s1,24(sp)
    80005ec0:	01213823          	sd	s2,16(sp)
    80005ec4:	01313423          	sd	s3,8(sp)
    80005ec8:	03010413          	addi	s0,sp,48
    80005ecc:	00050493          	mv	s1,a0
    80005ed0:	00058913          	mv	s2,a1
    80005ed4:	0015879b          	addiw	a5,a1,1
    80005ed8:	0007851b          	sext.w	a0,a5
    80005edc:	00f4a023          	sw	a5,0(s1)
    80005ee0:	0004a823          	sw	zero,16(s1)
    80005ee4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005ee8:	00251513          	slli	a0,a0,0x2
    80005eec:	ffffb097          	auipc	ra,0xffffb
    80005ef0:	41c080e7          	jalr	1052(ra) # 80001308 <_Z9mem_allocm>
    80005ef4:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005ef8:	01000513          	li	a0,16
    80005efc:	ffffd097          	auipc	ra,0xffffd
    80005f00:	880080e7          	jalr	-1920(ra) # 8000277c <_Znwm>
    80005f04:	00050993          	mv	s3,a0
    80005f08:	00000593          	li	a1,0
    80005f0c:	ffffd097          	auipc	ra,0xffffd
    80005f10:	bbc080e7          	jalr	-1092(ra) # 80002ac8 <_ZN9SemaphoreC1Ej>
    80005f14:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005f18:	01000513          	li	a0,16
    80005f1c:	ffffd097          	auipc	ra,0xffffd
    80005f20:	860080e7          	jalr	-1952(ra) # 8000277c <_Znwm>
    80005f24:	00050993          	mv	s3,a0
    80005f28:	00090593          	mv	a1,s2
    80005f2c:	ffffd097          	auipc	ra,0xffffd
    80005f30:	b9c080e7          	jalr	-1124(ra) # 80002ac8 <_ZN9SemaphoreC1Ej>
    80005f34:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005f38:	01000513          	li	a0,16
    80005f3c:	ffffd097          	auipc	ra,0xffffd
    80005f40:	840080e7          	jalr	-1984(ra) # 8000277c <_Znwm>
    80005f44:	00050913          	mv	s2,a0
    80005f48:	00100593          	li	a1,1
    80005f4c:	ffffd097          	auipc	ra,0xffffd
    80005f50:	b7c080e7          	jalr	-1156(ra) # 80002ac8 <_ZN9SemaphoreC1Ej>
    80005f54:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005f58:	01000513          	li	a0,16
    80005f5c:	ffffd097          	auipc	ra,0xffffd
    80005f60:	820080e7          	jalr	-2016(ra) # 8000277c <_Znwm>
    80005f64:	00050913          	mv	s2,a0
    80005f68:	00100593          	li	a1,1
    80005f6c:	ffffd097          	auipc	ra,0xffffd
    80005f70:	b5c080e7          	jalr	-1188(ra) # 80002ac8 <_ZN9SemaphoreC1Ej>
    80005f74:	0324b823          	sd	s2,48(s1)
}
    80005f78:	02813083          	ld	ra,40(sp)
    80005f7c:	02013403          	ld	s0,32(sp)
    80005f80:	01813483          	ld	s1,24(sp)
    80005f84:	01013903          	ld	s2,16(sp)
    80005f88:	00813983          	ld	s3,8(sp)
    80005f8c:	03010113          	addi	sp,sp,48
    80005f90:	00008067          	ret
    80005f94:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005f98:	00098513          	mv	a0,s3
    80005f9c:	ffffd097          	auipc	ra,0xffffd
    80005fa0:	830080e7          	jalr	-2000(ra) # 800027cc <_ZdlPv>
    80005fa4:	00048513          	mv	a0,s1
    80005fa8:	00008097          	auipc	ra,0x8
    80005fac:	fd0080e7          	jalr	-48(ra) # 8000df78 <_Unwind_Resume>
    80005fb0:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005fb4:	00098513          	mv	a0,s3
    80005fb8:	ffffd097          	auipc	ra,0xffffd
    80005fbc:	814080e7          	jalr	-2028(ra) # 800027cc <_ZdlPv>
    80005fc0:	00048513          	mv	a0,s1
    80005fc4:	00008097          	auipc	ra,0x8
    80005fc8:	fb4080e7          	jalr	-76(ra) # 8000df78 <_Unwind_Resume>
    80005fcc:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005fd0:	00090513          	mv	a0,s2
    80005fd4:	ffffc097          	auipc	ra,0xffffc
    80005fd8:	7f8080e7          	jalr	2040(ra) # 800027cc <_ZdlPv>
    80005fdc:	00048513          	mv	a0,s1
    80005fe0:	00008097          	auipc	ra,0x8
    80005fe4:	f98080e7          	jalr	-104(ra) # 8000df78 <_Unwind_Resume>
    80005fe8:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005fec:	00090513          	mv	a0,s2
    80005ff0:	ffffc097          	auipc	ra,0xffffc
    80005ff4:	7dc080e7          	jalr	2012(ra) # 800027cc <_ZdlPv>
    80005ff8:	00048513          	mv	a0,s1
    80005ffc:	00008097          	auipc	ra,0x8
    80006000:	f7c080e7          	jalr	-132(ra) # 8000df78 <_Unwind_Resume>

0000000080006004 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80006004:	fe010113          	addi	sp,sp,-32
    80006008:	00113c23          	sd	ra,24(sp)
    8000600c:	00813823          	sd	s0,16(sp)
    80006010:	00913423          	sd	s1,8(sp)
    80006014:	01213023          	sd	s2,0(sp)
    80006018:	02010413          	addi	s0,sp,32
    8000601c:	00050493          	mv	s1,a0
    80006020:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80006024:	01853503          	ld	a0,24(a0)
    80006028:	ffffd097          	auipc	ra,0xffffd
    8000602c:	ad8080e7          	jalr	-1320(ra) # 80002b00 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80006030:	0304b503          	ld	a0,48(s1)
    80006034:	ffffd097          	auipc	ra,0xffffd
    80006038:	acc080e7          	jalr	-1332(ra) # 80002b00 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    8000603c:	0084b783          	ld	a5,8(s1)
    80006040:	0144a703          	lw	a4,20(s1)
    80006044:	00271713          	slli	a4,a4,0x2
    80006048:	00e787b3          	add	a5,a5,a4
    8000604c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006050:	0144a783          	lw	a5,20(s1)
    80006054:	0017879b          	addiw	a5,a5,1
    80006058:	0004a703          	lw	a4,0(s1)
    8000605c:	02e7e7bb          	remw	a5,a5,a4
    80006060:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006064:	0304b503          	ld	a0,48(s1)
    80006068:	ffffd097          	auipc	ra,0xffffd
    8000606c:	ac4080e7          	jalr	-1340(ra) # 80002b2c <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006070:	0204b503          	ld	a0,32(s1)
    80006074:	ffffd097          	auipc	ra,0xffffd
    80006078:	ab8080e7          	jalr	-1352(ra) # 80002b2c <_ZN9Semaphore6signalEv>

}
    8000607c:	01813083          	ld	ra,24(sp)
    80006080:	01013403          	ld	s0,16(sp)
    80006084:	00813483          	ld	s1,8(sp)
    80006088:	00013903          	ld	s2,0(sp)
    8000608c:	02010113          	addi	sp,sp,32
    80006090:	00008067          	ret

0000000080006094 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006094:	fe010113          	addi	sp,sp,-32
    80006098:	00113c23          	sd	ra,24(sp)
    8000609c:	00813823          	sd	s0,16(sp)
    800060a0:	00913423          	sd	s1,8(sp)
    800060a4:	01213023          	sd	s2,0(sp)
    800060a8:	02010413          	addi	s0,sp,32
    800060ac:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800060b0:	02053503          	ld	a0,32(a0)
    800060b4:	ffffd097          	auipc	ra,0xffffd
    800060b8:	a4c080e7          	jalr	-1460(ra) # 80002b00 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    800060bc:	0284b503          	ld	a0,40(s1)
    800060c0:	ffffd097          	auipc	ra,0xffffd
    800060c4:	a40080e7          	jalr	-1472(ra) # 80002b00 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    800060c8:	0084b703          	ld	a4,8(s1)
    800060cc:	0104a783          	lw	a5,16(s1)
    800060d0:	00279693          	slli	a3,a5,0x2
    800060d4:	00d70733          	add	a4,a4,a3
    800060d8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800060dc:	0017879b          	addiw	a5,a5,1
    800060e0:	0004a703          	lw	a4,0(s1)
    800060e4:	02e7e7bb          	remw	a5,a5,a4
    800060e8:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800060ec:	0284b503          	ld	a0,40(s1)
    800060f0:	ffffd097          	auipc	ra,0xffffd
    800060f4:	a3c080e7          	jalr	-1476(ra) # 80002b2c <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800060f8:	0184b503          	ld	a0,24(s1)
    800060fc:	ffffd097          	auipc	ra,0xffffd
    80006100:	a30080e7          	jalr	-1488(ra) # 80002b2c <_ZN9Semaphore6signalEv>

    return ret;
}
    80006104:	00090513          	mv	a0,s2
    80006108:	01813083          	ld	ra,24(sp)
    8000610c:	01013403          	ld	s0,16(sp)
    80006110:	00813483          	ld	s1,8(sp)
    80006114:	00013903          	ld	s2,0(sp)
    80006118:	02010113          	addi	sp,sp,32
    8000611c:	00008067          	ret

0000000080006120 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006120:	fe010113          	addi	sp,sp,-32
    80006124:	00113c23          	sd	ra,24(sp)
    80006128:	00813823          	sd	s0,16(sp)
    8000612c:	00913423          	sd	s1,8(sp)
    80006130:	01213023          	sd	s2,0(sp)
    80006134:	02010413          	addi	s0,sp,32
    80006138:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    8000613c:	02853503          	ld	a0,40(a0)
    80006140:	ffffd097          	auipc	ra,0xffffd
    80006144:	9c0080e7          	jalr	-1600(ra) # 80002b00 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006148:	0304b503          	ld	a0,48(s1)
    8000614c:	ffffd097          	auipc	ra,0xffffd
    80006150:	9b4080e7          	jalr	-1612(ra) # 80002b00 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006154:	0144a783          	lw	a5,20(s1)
    80006158:	0104a903          	lw	s2,16(s1)
    8000615c:	0327ce63          	blt	a5,s2,80006198 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006160:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006164:	0304b503          	ld	a0,48(s1)
    80006168:	ffffd097          	auipc	ra,0xffffd
    8000616c:	9c4080e7          	jalr	-1596(ra) # 80002b2c <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006170:	0284b503          	ld	a0,40(s1)
    80006174:	ffffd097          	auipc	ra,0xffffd
    80006178:	9b8080e7          	jalr	-1608(ra) # 80002b2c <_ZN9Semaphore6signalEv>

    return ret;
}
    8000617c:	00090513          	mv	a0,s2
    80006180:	01813083          	ld	ra,24(sp)
    80006184:	01013403          	ld	s0,16(sp)
    80006188:	00813483          	ld	s1,8(sp)
    8000618c:	00013903          	ld	s2,0(sp)
    80006190:	02010113          	addi	sp,sp,32
    80006194:	00008067          	ret
        ret = cap - head + tail;
    80006198:	0004a703          	lw	a4,0(s1)
    8000619c:	4127093b          	subw	s2,a4,s2
    800061a0:	00f9093b          	addw	s2,s2,a5
    800061a4:	fc1ff06f          	j	80006164 <_ZN9BufferCPP6getCntEv+0x44>

00000000800061a8 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800061a8:	fe010113          	addi	sp,sp,-32
    800061ac:	00113c23          	sd	ra,24(sp)
    800061b0:	00813823          	sd	s0,16(sp)
    800061b4:	00913423          	sd	s1,8(sp)
    800061b8:	02010413          	addi	s0,sp,32
    800061bc:	00050493          	mv	s1,a0
    Console::putc('\n');
    800061c0:	00a00513          	li	a0,10
    800061c4:	ffffd097          	auipc	ra,0xffffd
    800061c8:	a2c080e7          	jalr	-1492(ra) # 80002bf0 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800061cc:	00004517          	auipc	a0,0x4
    800061d0:	29450513          	addi	a0,a0,660 # 8000a460 <_ZZ9kPrintIntmE6digits+0x3f0>
    800061d4:	00000097          	auipc	ra,0x0
    800061d8:	a0c080e7          	jalr	-1524(ra) # 80005be0 <_Z11printStringPKc>
    while (getCnt()) {
    800061dc:	00048513          	mv	a0,s1
    800061e0:	00000097          	auipc	ra,0x0
    800061e4:	f40080e7          	jalr	-192(ra) # 80006120 <_ZN9BufferCPP6getCntEv>
    800061e8:	02050c63          	beqz	a0,80006220 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800061ec:	0084b783          	ld	a5,8(s1)
    800061f0:	0104a703          	lw	a4,16(s1)
    800061f4:	00271713          	slli	a4,a4,0x2
    800061f8:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800061fc:	0007c503          	lbu	a0,0(a5)
    80006200:	ffffd097          	auipc	ra,0xffffd
    80006204:	9f0080e7          	jalr	-1552(ra) # 80002bf0 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006208:	0104a783          	lw	a5,16(s1)
    8000620c:	0017879b          	addiw	a5,a5,1
    80006210:	0004a703          	lw	a4,0(s1)
    80006214:	02e7e7bb          	remw	a5,a5,a4
    80006218:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    8000621c:	fc1ff06f          	j	800061dc <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006220:	02100513          	li	a0,33
    80006224:	ffffd097          	auipc	ra,0xffffd
    80006228:	9cc080e7          	jalr	-1588(ra) # 80002bf0 <_ZN7Console4putcEc>
    Console::putc('\n');
    8000622c:	00a00513          	li	a0,10
    80006230:	ffffd097          	auipc	ra,0xffffd
    80006234:	9c0080e7          	jalr	-1600(ra) # 80002bf0 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006238:	0084b503          	ld	a0,8(s1)
    8000623c:	ffffb097          	auipc	ra,0xffffb
    80006240:	10c080e7          	jalr	268(ra) # 80001348 <_Z8mem_freePv>
    delete itemAvailable;
    80006244:	0204b503          	ld	a0,32(s1)
    80006248:	00050863          	beqz	a0,80006258 <_ZN9BufferCPPD1Ev+0xb0>
    8000624c:	00053783          	ld	a5,0(a0)
    80006250:	0087b783          	ld	a5,8(a5)
    80006254:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006258:	0184b503          	ld	a0,24(s1)
    8000625c:	00050863          	beqz	a0,8000626c <_ZN9BufferCPPD1Ev+0xc4>
    80006260:	00053783          	ld	a5,0(a0)
    80006264:	0087b783          	ld	a5,8(a5)
    80006268:	000780e7          	jalr	a5
    delete mutexTail;
    8000626c:	0304b503          	ld	a0,48(s1)
    80006270:	00050863          	beqz	a0,80006280 <_ZN9BufferCPPD1Ev+0xd8>
    80006274:	00053783          	ld	a5,0(a0)
    80006278:	0087b783          	ld	a5,8(a5)
    8000627c:	000780e7          	jalr	a5
    delete mutexHead;
    80006280:	0284b503          	ld	a0,40(s1)
    80006284:	00050863          	beqz	a0,80006294 <_ZN9BufferCPPD1Ev+0xec>
    80006288:	00053783          	ld	a5,0(a0)
    8000628c:	0087b783          	ld	a5,8(a5)
    80006290:	000780e7          	jalr	a5
}
    80006294:	01813083          	ld	ra,24(sp)
    80006298:	01013403          	ld	s0,16(sp)
    8000629c:	00813483          	ld	s1,8(sp)
    800062a0:	02010113          	addi	sp,sp,32
    800062a4:	00008067          	ret

00000000800062a8 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    800062a8:	fe010113          	addi	sp,sp,-32
    800062ac:	00113c23          	sd	ra,24(sp)
    800062b0:	00813823          	sd	s0,16(sp)
    800062b4:	00913423          	sd	s1,8(sp)
    800062b8:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    800062bc:	00004517          	auipc	a0,0x4
    800062c0:	1bc50513          	addi	a0,a0,444 # 8000a478 <_ZZ9kPrintIntmE6digits+0x408>
    800062c4:	00000097          	auipc	ra,0x0
    800062c8:	91c080e7          	jalr	-1764(ra) # 80005be0 <_Z11printStringPKc>
    int test = getc() - '0';
    800062cc:	ffffb097          	auipc	ra,0xffffb
    800062d0:	2a0080e7          	jalr	672(ra) # 8000156c <_Z4getcv>
    800062d4:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800062d8:	ffffb097          	auipc	ra,0xffffb
    800062dc:	294080e7          	jalr	660(ra) # 8000156c <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800062e0:	00700793          	li	a5,7
    800062e4:	1097e263          	bltu	a5,s1,800063e8 <_Z8userMainv+0x140>
    800062e8:	00249493          	slli	s1,s1,0x2
    800062ec:	00004717          	auipc	a4,0x4
    800062f0:	3e470713          	addi	a4,a4,996 # 8000a6d0 <_ZZ9kPrintIntmE6digits+0x660>
    800062f4:	00e484b3          	add	s1,s1,a4
    800062f8:	0004a783          	lw	a5,0(s1)
    800062fc:	00e787b3          	add	a5,a5,a4
    80006300:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80006304:	fffff097          	auipc	ra,0xfffff
    80006308:	f54080e7          	jalr	-172(ra) # 80005258 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    8000630c:	00004517          	auipc	a0,0x4
    80006310:	18c50513          	addi	a0,a0,396 # 8000a498 <_ZZ9kPrintIntmE6digits+0x428>
    80006314:	00000097          	auipc	ra,0x0
    80006318:	8cc080e7          	jalr	-1844(ra) # 80005be0 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    8000631c:	01813083          	ld	ra,24(sp)
    80006320:	01013403          	ld	s0,16(sp)
    80006324:	00813483          	ld	s1,8(sp)
    80006328:	02010113          	addi	sp,sp,32
    8000632c:	00008067          	ret
            Threads_CPP_API_test();
    80006330:	ffffe097          	auipc	ra,0xffffe
    80006334:	e08080e7          	jalr	-504(ra) # 80004138 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006338:	00004517          	auipc	a0,0x4
    8000633c:	1a050513          	addi	a0,a0,416 # 8000a4d8 <_ZZ9kPrintIntmE6digits+0x468>
    80006340:	00000097          	auipc	ra,0x0
    80006344:	8a0080e7          	jalr	-1888(ra) # 80005be0 <_Z11printStringPKc>
            break;
    80006348:	fd5ff06f          	j	8000631c <_Z8userMainv+0x74>
            producerConsumer_C_API();
    8000634c:	ffffd097          	auipc	ra,0xffffd
    80006350:	640080e7          	jalr	1600(ra) # 8000398c <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006354:	00004517          	auipc	a0,0x4
    80006358:	1c450513          	addi	a0,a0,452 # 8000a518 <_ZZ9kPrintIntmE6digits+0x4a8>
    8000635c:	00000097          	auipc	ra,0x0
    80006360:	884080e7          	jalr	-1916(ra) # 80005be0 <_Z11printStringPKc>
            break;
    80006364:	fb9ff06f          	j	8000631c <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006368:	fffff097          	auipc	ra,0xfffff
    8000636c:	234080e7          	jalr	564(ra) # 8000559c <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006370:	00004517          	auipc	a0,0x4
    80006374:	1f850513          	addi	a0,a0,504 # 8000a568 <_ZZ9kPrintIntmE6digits+0x4f8>
    80006378:	00000097          	auipc	ra,0x0
    8000637c:	868080e7          	jalr	-1944(ra) # 80005be0 <_Z11printStringPKc>
            break;
    80006380:	f9dff06f          	j	8000631c <_Z8userMainv+0x74>
            testSleeping();
    80006384:	00000097          	auipc	ra,0x0
    80006388:	11c080e7          	jalr	284(ra) # 800064a0 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    8000638c:	00004517          	auipc	a0,0x4
    80006390:	23450513          	addi	a0,a0,564 # 8000a5c0 <_ZZ9kPrintIntmE6digits+0x550>
    80006394:	00000097          	auipc	ra,0x0
    80006398:	84c080e7          	jalr	-1972(ra) # 80005be0 <_Z11printStringPKc>
            break;
    8000639c:	f81ff06f          	j	8000631c <_Z8userMainv+0x74>
            testConsumerProducer();
    800063a0:	ffffe097          	auipc	ra,0xffffe
    800063a4:	258080e7          	jalr	600(ra) # 800045f8 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    800063a8:	00004517          	auipc	a0,0x4
    800063ac:	24850513          	addi	a0,a0,584 # 8000a5f0 <_ZZ9kPrintIntmE6digits+0x580>
    800063b0:	00000097          	auipc	ra,0x0
    800063b4:	830080e7          	jalr	-2000(ra) # 80005be0 <_Z11printStringPKc>
            break;
    800063b8:	f65ff06f          	j	8000631c <_Z8userMainv+0x74>
            System_Mode_test();
    800063bc:	00000097          	auipc	ra,0x0
    800063c0:	658080e7          	jalr	1624(ra) # 80006a14 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    800063c4:	00004517          	auipc	a0,0x4
    800063c8:	26c50513          	addi	a0,a0,620 # 8000a630 <_ZZ9kPrintIntmE6digits+0x5c0>
    800063cc:	00000097          	auipc	ra,0x0
    800063d0:	814080e7          	jalr	-2028(ra) # 80005be0 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800063d4:	00004517          	auipc	a0,0x4
    800063d8:	27c50513          	addi	a0,a0,636 # 8000a650 <_ZZ9kPrintIntmE6digits+0x5e0>
    800063dc:	00000097          	auipc	ra,0x0
    800063e0:	804080e7          	jalr	-2044(ra) # 80005be0 <_Z11printStringPKc>
            break;
    800063e4:	f39ff06f          	j	8000631c <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    800063e8:	00004517          	auipc	a0,0x4
    800063ec:	2c050513          	addi	a0,a0,704 # 8000a6a8 <_ZZ9kPrintIntmE6digits+0x638>
    800063f0:	fffff097          	auipc	ra,0xfffff
    800063f4:	7f0080e7          	jalr	2032(ra) # 80005be0 <_Z11printStringPKc>
    800063f8:	f25ff06f          	j	8000631c <_Z8userMainv+0x74>

00000000800063fc <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800063fc:	fe010113          	addi	sp,sp,-32
    80006400:	00113c23          	sd	ra,24(sp)
    80006404:	00813823          	sd	s0,16(sp)
    80006408:	00913423          	sd	s1,8(sp)
    8000640c:	01213023          	sd	s2,0(sp)
    80006410:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006414:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006418:	00600493          	li	s1,6
    while (--i > 0) {
    8000641c:	fff4849b          	addiw	s1,s1,-1
    80006420:	04905463          	blez	s1,80006468 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006424:	00004517          	auipc	a0,0x4
    80006428:	2cc50513          	addi	a0,a0,716 # 8000a6f0 <_ZZ9kPrintIntmE6digits+0x680>
    8000642c:	fffff097          	auipc	ra,0xfffff
    80006430:	7b4080e7          	jalr	1972(ra) # 80005be0 <_Z11printStringPKc>
        printInt(sleep_time);
    80006434:	00000613          	li	a2,0
    80006438:	00a00593          	li	a1,10
    8000643c:	0009051b          	sext.w	a0,s2
    80006440:	00000097          	auipc	ra,0x0
    80006444:	950080e7          	jalr	-1712(ra) # 80005d90 <_Z8printIntiii>
        printString(" !\n");
    80006448:	00004517          	auipc	a0,0x4
    8000644c:	2b050513          	addi	a0,a0,688 # 8000a6f8 <_ZZ9kPrintIntmE6digits+0x688>
    80006450:	fffff097          	auipc	ra,0xfffff
    80006454:	790080e7          	jalr	1936(ra) # 80005be0 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006458:	00090513          	mv	a0,s2
    8000645c:	ffffb097          	auipc	ra,0xffffb
    80006460:	018080e7          	jalr	24(ra) # 80001474 <_Z10time_sleepm>
    while (--i > 0) {
    80006464:	fb9ff06f          	j	8000641c <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006468:	00a00793          	li	a5,10
    8000646c:	02f95933          	divu	s2,s2,a5
    80006470:	fff90913          	addi	s2,s2,-1
    80006474:	00007797          	auipc	a5,0x7
    80006478:	a1c78793          	addi	a5,a5,-1508 # 8000ce90 <_ZL8finished>
    8000647c:	01278933          	add	s2,a5,s2
    80006480:	00100793          	li	a5,1
    80006484:	00f90023          	sb	a5,0(s2)
}
    80006488:	01813083          	ld	ra,24(sp)
    8000648c:	01013403          	ld	s0,16(sp)
    80006490:	00813483          	ld	s1,8(sp)
    80006494:	00013903          	ld	s2,0(sp)
    80006498:	02010113          	addi	sp,sp,32
    8000649c:	00008067          	ret

00000000800064a0 <_Z12testSleepingv>:

void testSleeping() {
    800064a0:	fc010113          	addi	sp,sp,-64
    800064a4:	02113c23          	sd	ra,56(sp)
    800064a8:	02813823          	sd	s0,48(sp)
    800064ac:	02913423          	sd	s1,40(sp)
    800064b0:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800064b4:	00a00793          	li	a5,10
    800064b8:	fcf43823          	sd	a5,-48(s0)
    800064bc:	01400793          	li	a5,20
    800064c0:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800064c4:	00000493          	li	s1,0
    800064c8:	02c0006f          	j	800064f4 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800064cc:	00349793          	slli	a5,s1,0x3
    800064d0:	fd040613          	addi	a2,s0,-48
    800064d4:	00f60633          	add	a2,a2,a5
    800064d8:	00000597          	auipc	a1,0x0
    800064dc:	f2458593          	addi	a1,a1,-220 # 800063fc <_ZL9sleepyRunPv>
    800064e0:	fc040513          	addi	a0,s0,-64
    800064e4:	00f50533          	add	a0,a0,a5
    800064e8:	ffffb097          	auipc	ra,0xffffb
    800064ec:	e90080e7          	jalr	-368(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800064f0:	0014849b          	addiw	s1,s1,1
    800064f4:	00100793          	li	a5,1
    800064f8:	fc97dae3          	bge	a5,s1,800064cc <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800064fc:	00007797          	auipc	a5,0x7
    80006500:	9947c783          	lbu	a5,-1644(a5) # 8000ce90 <_ZL8finished>
    80006504:	fe078ce3          	beqz	a5,800064fc <_Z12testSleepingv+0x5c>
    80006508:	00007797          	auipc	a5,0x7
    8000650c:	9897c783          	lbu	a5,-1655(a5) # 8000ce91 <_ZL8finished+0x1>
    80006510:	fe0786e3          	beqz	a5,800064fc <_Z12testSleepingv+0x5c>
}
    80006514:	03813083          	ld	ra,56(sp)
    80006518:	03013403          	ld	s0,48(sp)
    8000651c:	02813483          	ld	s1,40(sp)
    80006520:	04010113          	addi	sp,sp,64
    80006524:	00008067          	ret

0000000080006528 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006528:	fe010113          	addi	sp,sp,-32
    8000652c:	00113c23          	sd	ra,24(sp)
    80006530:	00813823          	sd	s0,16(sp)
    80006534:	00913423          	sd	s1,8(sp)
    80006538:	01213023          	sd	s2,0(sp)
    8000653c:	02010413          	addi	s0,sp,32
    80006540:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006544:	00100793          	li	a5,1
    80006548:	02a7f863          	bgeu	a5,a0,80006578 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000654c:	00a00793          	li	a5,10
    80006550:	02f577b3          	remu	a5,a0,a5
    80006554:	02078e63          	beqz	a5,80006590 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006558:	fff48513          	addi	a0,s1,-1
    8000655c:	00000097          	auipc	ra,0x0
    80006560:	fcc080e7          	jalr	-52(ra) # 80006528 <_ZL9fibonaccim>
    80006564:	00050913          	mv	s2,a0
    80006568:	ffe48513          	addi	a0,s1,-2
    8000656c:	00000097          	auipc	ra,0x0
    80006570:	fbc080e7          	jalr	-68(ra) # 80006528 <_ZL9fibonaccim>
    80006574:	00a90533          	add	a0,s2,a0
}
    80006578:	01813083          	ld	ra,24(sp)
    8000657c:	01013403          	ld	s0,16(sp)
    80006580:	00813483          	ld	s1,8(sp)
    80006584:	00013903          	ld	s2,0(sp)
    80006588:	02010113          	addi	sp,sp,32
    8000658c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006590:	ffffb097          	auipc	ra,0xffffb
    80006594:	e9c080e7          	jalr	-356(ra) # 8000142c <_Z15thread_dispatchv>
    80006598:	fc1ff06f          	j	80006558 <_ZL9fibonaccim+0x30>

000000008000659c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    8000659c:	fe010113          	addi	sp,sp,-32
    800065a0:	00113c23          	sd	ra,24(sp)
    800065a4:	00813823          	sd	s0,16(sp)
    800065a8:	00913423          	sd	s1,8(sp)
    800065ac:	01213023          	sd	s2,0(sp)
    800065b0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800065b4:	00a00493          	li	s1,10
    800065b8:	0400006f          	j	800065f8 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800065bc:	00004517          	auipc	a0,0x4
    800065c0:	e0c50513          	addi	a0,a0,-500 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    800065c4:	fffff097          	auipc	ra,0xfffff
    800065c8:	61c080e7          	jalr	1564(ra) # 80005be0 <_Z11printStringPKc>
    800065cc:	00000613          	li	a2,0
    800065d0:	00a00593          	li	a1,10
    800065d4:	00048513          	mv	a0,s1
    800065d8:	fffff097          	auipc	ra,0xfffff
    800065dc:	7b8080e7          	jalr	1976(ra) # 80005d90 <_Z8printIntiii>
    800065e0:	00004517          	auipc	a0,0x4
    800065e4:	fd850513          	addi	a0,a0,-40 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800065e8:	fffff097          	auipc	ra,0xfffff
    800065ec:	5f8080e7          	jalr	1528(ra) # 80005be0 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800065f0:	0014849b          	addiw	s1,s1,1
    800065f4:	0ff4f493          	andi	s1,s1,255
    800065f8:	00c00793          	li	a5,12
    800065fc:	fc97f0e3          	bgeu	a5,s1,800065bc <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006600:	00004517          	auipc	a0,0x4
    80006604:	dd050513          	addi	a0,a0,-560 # 8000a3d0 <_ZZ9kPrintIntmE6digits+0x360>
    80006608:	fffff097          	auipc	ra,0xfffff
    8000660c:	5d8080e7          	jalr	1496(ra) # 80005be0 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006610:	00500313          	li	t1,5
    thread_dispatch();
    80006614:	ffffb097          	auipc	ra,0xffffb
    80006618:	e18080e7          	jalr	-488(ra) # 8000142c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000661c:	01000513          	li	a0,16
    80006620:	00000097          	auipc	ra,0x0
    80006624:	f08080e7          	jalr	-248(ra) # 80006528 <_ZL9fibonaccim>
    80006628:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000662c:	00004517          	auipc	a0,0x4
    80006630:	db450513          	addi	a0,a0,-588 # 8000a3e0 <_ZZ9kPrintIntmE6digits+0x370>
    80006634:	fffff097          	auipc	ra,0xfffff
    80006638:	5ac080e7          	jalr	1452(ra) # 80005be0 <_Z11printStringPKc>
    8000663c:	00000613          	li	a2,0
    80006640:	00a00593          	li	a1,10
    80006644:	0009051b          	sext.w	a0,s2
    80006648:	fffff097          	auipc	ra,0xfffff
    8000664c:	748080e7          	jalr	1864(ra) # 80005d90 <_Z8printIntiii>
    80006650:	00004517          	auipc	a0,0x4
    80006654:	f6850513          	addi	a0,a0,-152 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80006658:	fffff097          	auipc	ra,0xfffff
    8000665c:	588080e7          	jalr	1416(ra) # 80005be0 <_Z11printStringPKc>
    80006660:	0400006f          	j	800066a0 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006664:	00004517          	auipc	a0,0x4
    80006668:	d6450513          	addi	a0,a0,-668 # 8000a3c8 <_ZZ9kPrintIntmE6digits+0x358>
    8000666c:	fffff097          	auipc	ra,0xfffff
    80006670:	574080e7          	jalr	1396(ra) # 80005be0 <_Z11printStringPKc>
    80006674:	00000613          	li	a2,0
    80006678:	00a00593          	li	a1,10
    8000667c:	00048513          	mv	a0,s1
    80006680:	fffff097          	auipc	ra,0xfffff
    80006684:	710080e7          	jalr	1808(ra) # 80005d90 <_Z8printIntiii>
    80006688:	00004517          	auipc	a0,0x4
    8000668c:	f3050513          	addi	a0,a0,-208 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80006690:	fffff097          	auipc	ra,0xfffff
    80006694:	550080e7          	jalr	1360(ra) # 80005be0 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006698:	0014849b          	addiw	s1,s1,1
    8000669c:	0ff4f493          	andi	s1,s1,255
    800066a0:	00f00793          	li	a5,15
    800066a4:	fc97f0e3          	bgeu	a5,s1,80006664 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800066a8:	00004517          	auipc	a0,0x4
    800066ac:	d4850513          	addi	a0,a0,-696 # 8000a3f0 <_ZZ9kPrintIntmE6digits+0x380>
    800066b0:	fffff097          	auipc	ra,0xfffff
    800066b4:	530080e7          	jalr	1328(ra) # 80005be0 <_Z11printStringPKc>
    finishedD = true;
    800066b8:	00100793          	li	a5,1
    800066bc:	00006717          	auipc	a4,0x6
    800066c0:	7cf70b23          	sb	a5,2006(a4) # 8000ce92 <_ZL9finishedD>
    thread_dispatch();
    800066c4:	ffffb097          	auipc	ra,0xffffb
    800066c8:	d68080e7          	jalr	-664(ra) # 8000142c <_Z15thread_dispatchv>
}
    800066cc:	01813083          	ld	ra,24(sp)
    800066d0:	01013403          	ld	s0,16(sp)
    800066d4:	00813483          	ld	s1,8(sp)
    800066d8:	00013903          	ld	s2,0(sp)
    800066dc:	02010113          	addi	sp,sp,32
    800066e0:	00008067          	ret

00000000800066e4 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800066e4:	fe010113          	addi	sp,sp,-32
    800066e8:	00113c23          	sd	ra,24(sp)
    800066ec:	00813823          	sd	s0,16(sp)
    800066f0:	00913423          	sd	s1,8(sp)
    800066f4:	01213023          	sd	s2,0(sp)
    800066f8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800066fc:	00000493          	li	s1,0
    80006700:	0400006f          	j	80006740 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006704:	00004517          	auipc	a0,0x4
    80006708:	c8450513          	addi	a0,a0,-892 # 8000a388 <_ZZ9kPrintIntmE6digits+0x318>
    8000670c:	fffff097          	auipc	ra,0xfffff
    80006710:	4d4080e7          	jalr	1236(ra) # 80005be0 <_Z11printStringPKc>
    80006714:	00000613          	li	a2,0
    80006718:	00a00593          	li	a1,10
    8000671c:	00048513          	mv	a0,s1
    80006720:	fffff097          	auipc	ra,0xfffff
    80006724:	670080e7          	jalr	1648(ra) # 80005d90 <_Z8printIntiii>
    80006728:	00004517          	auipc	a0,0x4
    8000672c:	e9050513          	addi	a0,a0,-368 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80006730:	fffff097          	auipc	ra,0xfffff
    80006734:	4b0080e7          	jalr	1200(ra) # 80005be0 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006738:	0014849b          	addiw	s1,s1,1
    8000673c:	0ff4f493          	andi	s1,s1,255
    80006740:	00200793          	li	a5,2
    80006744:	fc97f0e3          	bgeu	a5,s1,80006704 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006748:	00004517          	auipc	a0,0x4
    8000674c:	c4850513          	addi	a0,a0,-952 # 8000a390 <_ZZ9kPrintIntmE6digits+0x320>
    80006750:	fffff097          	auipc	ra,0xfffff
    80006754:	490080e7          	jalr	1168(ra) # 80005be0 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006758:	00700313          	li	t1,7
    thread_dispatch();
    8000675c:	ffffb097          	auipc	ra,0xffffb
    80006760:	cd0080e7          	jalr	-816(ra) # 8000142c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006764:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006768:	00004517          	auipc	a0,0x4
    8000676c:	c3850513          	addi	a0,a0,-968 # 8000a3a0 <_ZZ9kPrintIntmE6digits+0x330>
    80006770:	fffff097          	auipc	ra,0xfffff
    80006774:	470080e7          	jalr	1136(ra) # 80005be0 <_Z11printStringPKc>
    80006778:	00000613          	li	a2,0
    8000677c:	00a00593          	li	a1,10
    80006780:	0009051b          	sext.w	a0,s2
    80006784:	fffff097          	auipc	ra,0xfffff
    80006788:	60c080e7          	jalr	1548(ra) # 80005d90 <_Z8printIntiii>
    8000678c:	00004517          	auipc	a0,0x4
    80006790:	e2c50513          	addi	a0,a0,-468 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80006794:	fffff097          	auipc	ra,0xfffff
    80006798:	44c080e7          	jalr	1100(ra) # 80005be0 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    8000679c:	00c00513          	li	a0,12
    800067a0:	00000097          	auipc	ra,0x0
    800067a4:	d88080e7          	jalr	-632(ra) # 80006528 <_ZL9fibonaccim>
    800067a8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800067ac:	00004517          	auipc	a0,0x4
    800067b0:	bfc50513          	addi	a0,a0,-1028 # 8000a3a8 <_ZZ9kPrintIntmE6digits+0x338>
    800067b4:	fffff097          	auipc	ra,0xfffff
    800067b8:	42c080e7          	jalr	1068(ra) # 80005be0 <_Z11printStringPKc>
    800067bc:	00000613          	li	a2,0
    800067c0:	00a00593          	li	a1,10
    800067c4:	0009051b          	sext.w	a0,s2
    800067c8:	fffff097          	auipc	ra,0xfffff
    800067cc:	5c8080e7          	jalr	1480(ra) # 80005d90 <_Z8printIntiii>
    800067d0:	00004517          	auipc	a0,0x4
    800067d4:	de850513          	addi	a0,a0,-536 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800067d8:	fffff097          	auipc	ra,0xfffff
    800067dc:	408080e7          	jalr	1032(ra) # 80005be0 <_Z11printStringPKc>
    800067e0:	0400006f          	j	80006820 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800067e4:	00004517          	auipc	a0,0x4
    800067e8:	ba450513          	addi	a0,a0,-1116 # 8000a388 <_ZZ9kPrintIntmE6digits+0x318>
    800067ec:	fffff097          	auipc	ra,0xfffff
    800067f0:	3f4080e7          	jalr	1012(ra) # 80005be0 <_Z11printStringPKc>
    800067f4:	00000613          	li	a2,0
    800067f8:	00a00593          	li	a1,10
    800067fc:	00048513          	mv	a0,s1
    80006800:	fffff097          	auipc	ra,0xfffff
    80006804:	590080e7          	jalr	1424(ra) # 80005d90 <_Z8printIntiii>
    80006808:	00004517          	auipc	a0,0x4
    8000680c:	db050513          	addi	a0,a0,-592 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80006810:	fffff097          	auipc	ra,0xfffff
    80006814:	3d0080e7          	jalr	976(ra) # 80005be0 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006818:	0014849b          	addiw	s1,s1,1
    8000681c:	0ff4f493          	andi	s1,s1,255
    80006820:	00500793          	li	a5,5
    80006824:	fc97f0e3          	bgeu	a5,s1,800067e4 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006828:	00004517          	auipc	a0,0x4
    8000682c:	b3850513          	addi	a0,a0,-1224 # 8000a360 <_ZZ9kPrintIntmE6digits+0x2f0>
    80006830:	fffff097          	auipc	ra,0xfffff
    80006834:	3b0080e7          	jalr	944(ra) # 80005be0 <_Z11printStringPKc>
    finishedC = true;
    80006838:	00100793          	li	a5,1
    8000683c:	00006717          	auipc	a4,0x6
    80006840:	64f70ba3          	sb	a5,1623(a4) # 8000ce93 <_ZL9finishedC>
    thread_dispatch();
    80006844:	ffffb097          	auipc	ra,0xffffb
    80006848:	be8080e7          	jalr	-1048(ra) # 8000142c <_Z15thread_dispatchv>
}
    8000684c:	01813083          	ld	ra,24(sp)
    80006850:	01013403          	ld	s0,16(sp)
    80006854:	00813483          	ld	s1,8(sp)
    80006858:	00013903          	ld	s2,0(sp)
    8000685c:	02010113          	addi	sp,sp,32
    80006860:	00008067          	ret

0000000080006864 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006864:	fe010113          	addi	sp,sp,-32
    80006868:	00113c23          	sd	ra,24(sp)
    8000686c:	00813823          	sd	s0,16(sp)
    80006870:	00913423          	sd	s1,8(sp)
    80006874:	01213023          	sd	s2,0(sp)
    80006878:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000687c:	00000913          	li	s2,0
    80006880:	0400006f          	j	800068c0 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006884:	ffffb097          	auipc	ra,0xffffb
    80006888:	ba8080e7          	jalr	-1112(ra) # 8000142c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000688c:	00148493          	addi	s1,s1,1
    80006890:	000027b7          	lui	a5,0x2
    80006894:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006898:	0097ee63          	bltu	a5,s1,800068b4 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000689c:	00000713          	li	a4,0
    800068a0:	000077b7          	lui	a5,0x7
    800068a4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800068a8:	fce7eee3          	bltu	a5,a4,80006884 <_ZL11workerBodyBPv+0x20>
    800068ac:	00170713          	addi	a4,a4,1
    800068b0:	ff1ff06f          	j	800068a0 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    800068b4:	00a00793          	li	a5,10
    800068b8:	04f90663          	beq	s2,a5,80006904 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    800068bc:	00190913          	addi	s2,s2,1
    800068c0:	00f00793          	li	a5,15
    800068c4:	0527e463          	bltu	a5,s2,8000690c <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    800068c8:	00004517          	auipc	a0,0x4
    800068cc:	aa850513          	addi	a0,a0,-1368 # 8000a370 <_ZZ9kPrintIntmE6digits+0x300>
    800068d0:	fffff097          	auipc	ra,0xfffff
    800068d4:	310080e7          	jalr	784(ra) # 80005be0 <_Z11printStringPKc>
    800068d8:	00000613          	li	a2,0
    800068dc:	00a00593          	li	a1,10
    800068e0:	0009051b          	sext.w	a0,s2
    800068e4:	fffff097          	auipc	ra,0xfffff
    800068e8:	4ac080e7          	jalr	1196(ra) # 80005d90 <_Z8printIntiii>
    800068ec:	00004517          	auipc	a0,0x4
    800068f0:	ccc50513          	addi	a0,a0,-820 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800068f4:	fffff097          	auipc	ra,0xfffff
    800068f8:	2ec080e7          	jalr	748(ra) # 80005be0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800068fc:	00000493          	li	s1,0
    80006900:	f91ff06f          	j	80006890 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006904:	14102ff3          	csrr	t6,sepc
    80006908:	fb5ff06f          	j	800068bc <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    8000690c:	00004517          	auipc	a0,0x4
    80006910:	a6c50513          	addi	a0,a0,-1428 # 8000a378 <_ZZ9kPrintIntmE6digits+0x308>
    80006914:	fffff097          	auipc	ra,0xfffff
    80006918:	2cc080e7          	jalr	716(ra) # 80005be0 <_Z11printStringPKc>
    finishedB = true;
    8000691c:	00100793          	li	a5,1
    80006920:	00006717          	auipc	a4,0x6
    80006924:	56f70a23          	sb	a5,1396(a4) # 8000ce94 <_ZL9finishedB>
    thread_dispatch();
    80006928:	ffffb097          	auipc	ra,0xffffb
    8000692c:	b04080e7          	jalr	-1276(ra) # 8000142c <_Z15thread_dispatchv>
}
    80006930:	01813083          	ld	ra,24(sp)
    80006934:	01013403          	ld	s0,16(sp)
    80006938:	00813483          	ld	s1,8(sp)
    8000693c:	00013903          	ld	s2,0(sp)
    80006940:	02010113          	addi	sp,sp,32
    80006944:	00008067          	ret

0000000080006948 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006948:	fe010113          	addi	sp,sp,-32
    8000694c:	00113c23          	sd	ra,24(sp)
    80006950:	00813823          	sd	s0,16(sp)
    80006954:	00913423          	sd	s1,8(sp)
    80006958:	01213023          	sd	s2,0(sp)
    8000695c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006960:	00000913          	li	s2,0
    80006964:	0380006f          	j	8000699c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006968:	ffffb097          	auipc	ra,0xffffb
    8000696c:	ac4080e7          	jalr	-1340(ra) # 8000142c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006970:	00148493          	addi	s1,s1,1
    80006974:	000027b7          	lui	a5,0x2
    80006978:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000697c:	0097ee63          	bltu	a5,s1,80006998 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006980:	00000713          	li	a4,0
    80006984:	000077b7          	lui	a5,0x7
    80006988:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000698c:	fce7eee3          	bltu	a5,a4,80006968 <_ZL11workerBodyAPv+0x20>
    80006990:	00170713          	addi	a4,a4,1
    80006994:	ff1ff06f          	j	80006984 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006998:	00190913          	addi	s2,s2,1
    8000699c:	00900793          	li	a5,9
    800069a0:	0527e063          	bltu	a5,s2,800069e0 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800069a4:	00004517          	auipc	a0,0x4
    800069a8:	9b450513          	addi	a0,a0,-1612 # 8000a358 <_ZZ9kPrintIntmE6digits+0x2e8>
    800069ac:	fffff097          	auipc	ra,0xfffff
    800069b0:	234080e7          	jalr	564(ra) # 80005be0 <_Z11printStringPKc>
    800069b4:	00000613          	li	a2,0
    800069b8:	00a00593          	li	a1,10
    800069bc:	0009051b          	sext.w	a0,s2
    800069c0:	fffff097          	auipc	ra,0xfffff
    800069c4:	3d0080e7          	jalr	976(ra) # 80005d90 <_Z8printIntiii>
    800069c8:	00004517          	auipc	a0,0x4
    800069cc:	bf050513          	addi	a0,a0,-1040 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800069d0:	fffff097          	auipc	ra,0xfffff
    800069d4:	210080e7          	jalr	528(ra) # 80005be0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800069d8:	00000493          	li	s1,0
    800069dc:	f99ff06f          	j	80006974 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800069e0:	00004517          	auipc	a0,0x4
    800069e4:	98050513          	addi	a0,a0,-1664 # 8000a360 <_ZZ9kPrintIntmE6digits+0x2f0>
    800069e8:	fffff097          	auipc	ra,0xfffff
    800069ec:	1f8080e7          	jalr	504(ra) # 80005be0 <_Z11printStringPKc>
    finishedA = true;
    800069f0:	00100793          	li	a5,1
    800069f4:	00006717          	auipc	a4,0x6
    800069f8:	4af700a3          	sb	a5,1185(a4) # 8000ce95 <_ZL9finishedA>
}
    800069fc:	01813083          	ld	ra,24(sp)
    80006a00:	01013403          	ld	s0,16(sp)
    80006a04:	00813483          	ld	s1,8(sp)
    80006a08:	00013903          	ld	s2,0(sp)
    80006a0c:	02010113          	addi	sp,sp,32
    80006a10:	00008067          	ret

0000000080006a14 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006a14:	fd010113          	addi	sp,sp,-48
    80006a18:	02113423          	sd	ra,40(sp)
    80006a1c:	02813023          	sd	s0,32(sp)
    80006a20:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006a24:	00000613          	li	a2,0
    80006a28:	00000597          	auipc	a1,0x0
    80006a2c:	f2058593          	addi	a1,a1,-224 # 80006948 <_ZL11workerBodyAPv>
    80006a30:	fd040513          	addi	a0,s0,-48
    80006a34:	ffffb097          	auipc	ra,0xffffb
    80006a38:	944080e7          	jalr	-1724(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006a3c:	00004517          	auipc	a0,0x4
    80006a40:	9c450513          	addi	a0,a0,-1596 # 8000a400 <_ZZ9kPrintIntmE6digits+0x390>
    80006a44:	fffff097          	auipc	ra,0xfffff
    80006a48:	19c080e7          	jalr	412(ra) # 80005be0 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006a4c:	00000613          	li	a2,0
    80006a50:	00000597          	auipc	a1,0x0
    80006a54:	e1458593          	addi	a1,a1,-492 # 80006864 <_ZL11workerBodyBPv>
    80006a58:	fd840513          	addi	a0,s0,-40
    80006a5c:	ffffb097          	auipc	ra,0xffffb
    80006a60:	91c080e7          	jalr	-1764(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006a64:	00004517          	auipc	a0,0x4
    80006a68:	9b450513          	addi	a0,a0,-1612 # 8000a418 <_ZZ9kPrintIntmE6digits+0x3a8>
    80006a6c:	fffff097          	auipc	ra,0xfffff
    80006a70:	174080e7          	jalr	372(ra) # 80005be0 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006a74:	00000613          	li	a2,0
    80006a78:	00000597          	auipc	a1,0x0
    80006a7c:	c6c58593          	addi	a1,a1,-916 # 800066e4 <_ZL11workerBodyCPv>
    80006a80:	fe040513          	addi	a0,s0,-32
    80006a84:	ffffb097          	auipc	ra,0xffffb
    80006a88:	8f4080e7          	jalr	-1804(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006a8c:	00004517          	auipc	a0,0x4
    80006a90:	9a450513          	addi	a0,a0,-1628 # 8000a430 <_ZZ9kPrintIntmE6digits+0x3c0>
    80006a94:	fffff097          	auipc	ra,0xfffff
    80006a98:	14c080e7          	jalr	332(ra) # 80005be0 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006a9c:	00000613          	li	a2,0
    80006aa0:	00000597          	auipc	a1,0x0
    80006aa4:	afc58593          	addi	a1,a1,-1284 # 8000659c <_ZL11workerBodyDPv>
    80006aa8:	fe840513          	addi	a0,s0,-24
    80006aac:	ffffb097          	auipc	ra,0xffffb
    80006ab0:	8cc080e7          	jalr	-1844(ra) # 80001378 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006ab4:	00004517          	auipc	a0,0x4
    80006ab8:	99450513          	addi	a0,a0,-1644 # 8000a448 <_ZZ9kPrintIntmE6digits+0x3d8>
    80006abc:	fffff097          	auipc	ra,0xfffff
    80006ac0:	124080e7          	jalr	292(ra) # 80005be0 <_Z11printStringPKc>
    80006ac4:	00c0006f          	j	80006ad0 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006ac8:	ffffb097          	auipc	ra,0xffffb
    80006acc:	964080e7          	jalr	-1692(ra) # 8000142c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006ad0:	00006797          	auipc	a5,0x6
    80006ad4:	3c57c783          	lbu	a5,965(a5) # 8000ce95 <_ZL9finishedA>
    80006ad8:	fe0788e3          	beqz	a5,80006ac8 <_Z16System_Mode_testv+0xb4>
    80006adc:	00006797          	auipc	a5,0x6
    80006ae0:	3b87c783          	lbu	a5,952(a5) # 8000ce94 <_ZL9finishedB>
    80006ae4:	fe0782e3          	beqz	a5,80006ac8 <_Z16System_Mode_testv+0xb4>
    80006ae8:	00006797          	auipc	a5,0x6
    80006aec:	3ab7c783          	lbu	a5,939(a5) # 8000ce93 <_ZL9finishedC>
    80006af0:	fc078ce3          	beqz	a5,80006ac8 <_Z16System_Mode_testv+0xb4>
    80006af4:	00006797          	auipc	a5,0x6
    80006af8:	39e7c783          	lbu	a5,926(a5) # 8000ce92 <_ZL9finishedD>
    80006afc:	fc0786e3          	beqz	a5,80006ac8 <_Z16System_Mode_testv+0xb4>
    }

}
    80006b00:	02813083          	ld	ra,40(sp)
    80006b04:	02013403          	ld	s0,32(sp)
    80006b08:	03010113          	addi	sp,sp,48
    80006b0c:	00008067          	ret

0000000080006b10 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006b10:	fe010113          	addi	sp,sp,-32
    80006b14:	00113c23          	sd	ra,24(sp)
    80006b18:	00813823          	sd	s0,16(sp)
    80006b1c:	00913423          	sd	s1,8(sp)
    80006b20:	01213023          	sd	s2,0(sp)
    80006b24:	02010413          	addi	s0,sp,32
    80006b28:	00050493          	mv	s1,a0
    80006b2c:	00058913          	mv	s2,a1
    80006b30:	0015879b          	addiw	a5,a1,1
    80006b34:	0007851b          	sext.w	a0,a5
    80006b38:	00f4a023          	sw	a5,0(s1)
    80006b3c:	0004a823          	sw	zero,16(s1)
    80006b40:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006b44:	00251513          	slli	a0,a0,0x2
    80006b48:	ffffa097          	auipc	ra,0xffffa
    80006b4c:	7c0080e7          	jalr	1984(ra) # 80001308 <_Z9mem_allocm>
    80006b50:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006b54:	00000593          	li	a1,0
    80006b58:	02048513          	addi	a0,s1,32
    80006b5c:	ffffb097          	auipc	ra,0xffffb
    80006b60:	948080e7          	jalr	-1720(ra) # 800014a4 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    80006b64:	00090593          	mv	a1,s2
    80006b68:	01848513          	addi	a0,s1,24
    80006b6c:	ffffb097          	auipc	ra,0xffffb
    80006b70:	938080e7          	jalr	-1736(ra) # 800014a4 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    80006b74:	00100593          	li	a1,1
    80006b78:	02848513          	addi	a0,s1,40
    80006b7c:	ffffb097          	auipc	ra,0xffffb
    80006b80:	928080e7          	jalr	-1752(ra) # 800014a4 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    80006b84:	00100593          	li	a1,1
    80006b88:	03048513          	addi	a0,s1,48
    80006b8c:	ffffb097          	auipc	ra,0xffffb
    80006b90:	918080e7          	jalr	-1768(ra) # 800014a4 <_Z8sem_openPP4KSemj>
}
    80006b94:	01813083          	ld	ra,24(sp)
    80006b98:	01013403          	ld	s0,16(sp)
    80006b9c:	00813483          	ld	s1,8(sp)
    80006ba0:	00013903          	ld	s2,0(sp)
    80006ba4:	02010113          	addi	sp,sp,32
    80006ba8:	00008067          	ret

0000000080006bac <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006bac:	fe010113          	addi	sp,sp,-32
    80006bb0:	00113c23          	sd	ra,24(sp)
    80006bb4:	00813823          	sd	s0,16(sp)
    80006bb8:	00913423          	sd	s1,8(sp)
    80006bbc:	01213023          	sd	s2,0(sp)
    80006bc0:	02010413          	addi	s0,sp,32
    80006bc4:	00050493          	mv	s1,a0
    80006bc8:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006bcc:	01853503          	ld	a0,24(a0)
    80006bd0:	ffffb097          	auipc	ra,0xffffb
    80006bd4:	93c080e7          	jalr	-1732(ra) # 8000150c <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    80006bd8:	0304b503          	ld	a0,48(s1)
    80006bdc:	ffffb097          	auipc	ra,0xffffb
    80006be0:	930080e7          	jalr	-1744(ra) # 8000150c <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80006be4:	0084b783          	ld	a5,8(s1)
    80006be8:	0144a703          	lw	a4,20(s1)
    80006bec:	00271713          	slli	a4,a4,0x2
    80006bf0:	00e787b3          	add	a5,a5,a4
    80006bf4:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006bf8:	0144a783          	lw	a5,20(s1)
    80006bfc:	0017879b          	addiw	a5,a5,1
    80006c00:	0004a703          	lw	a4,0(s1)
    80006c04:	02e7e7bb          	remw	a5,a5,a4
    80006c08:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006c0c:	0304b503          	ld	a0,48(s1)
    80006c10:	ffffb097          	auipc	ra,0xffffb
    80006c14:	92c080e7          	jalr	-1748(ra) # 8000153c <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    80006c18:	0204b503          	ld	a0,32(s1)
    80006c1c:	ffffb097          	auipc	ra,0xffffb
    80006c20:	920080e7          	jalr	-1760(ra) # 8000153c <_Z10sem_signalP4KSem>

}
    80006c24:	01813083          	ld	ra,24(sp)
    80006c28:	01013403          	ld	s0,16(sp)
    80006c2c:	00813483          	ld	s1,8(sp)
    80006c30:	00013903          	ld	s2,0(sp)
    80006c34:	02010113          	addi	sp,sp,32
    80006c38:	00008067          	ret

0000000080006c3c <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006c3c:	fe010113          	addi	sp,sp,-32
    80006c40:	00113c23          	sd	ra,24(sp)
    80006c44:	00813823          	sd	s0,16(sp)
    80006c48:	00913423          	sd	s1,8(sp)
    80006c4c:	01213023          	sd	s2,0(sp)
    80006c50:	02010413          	addi	s0,sp,32
    80006c54:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006c58:	02053503          	ld	a0,32(a0)
    80006c5c:	ffffb097          	auipc	ra,0xffffb
    80006c60:	8b0080e7          	jalr	-1872(ra) # 8000150c <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    80006c64:	0284b503          	ld	a0,40(s1)
    80006c68:	ffffb097          	auipc	ra,0xffffb
    80006c6c:	8a4080e7          	jalr	-1884(ra) # 8000150c <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    80006c70:	0084b703          	ld	a4,8(s1)
    80006c74:	0104a783          	lw	a5,16(s1)
    80006c78:	00279693          	slli	a3,a5,0x2
    80006c7c:	00d70733          	add	a4,a4,a3
    80006c80:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006c84:	0017879b          	addiw	a5,a5,1
    80006c88:	0004a703          	lw	a4,0(s1)
    80006c8c:	02e7e7bb          	remw	a5,a5,a4
    80006c90:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006c94:	0284b503          	ld	a0,40(s1)
    80006c98:	ffffb097          	auipc	ra,0xffffb
    80006c9c:	8a4080e7          	jalr	-1884(ra) # 8000153c <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    80006ca0:	0184b503          	ld	a0,24(s1)
    80006ca4:	ffffb097          	auipc	ra,0xffffb
    80006ca8:	898080e7          	jalr	-1896(ra) # 8000153c <_Z10sem_signalP4KSem>

    return ret;
}
    80006cac:	00090513          	mv	a0,s2
    80006cb0:	01813083          	ld	ra,24(sp)
    80006cb4:	01013403          	ld	s0,16(sp)
    80006cb8:	00813483          	ld	s1,8(sp)
    80006cbc:	00013903          	ld	s2,0(sp)
    80006cc0:	02010113          	addi	sp,sp,32
    80006cc4:	00008067          	ret

0000000080006cc8 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006cc8:	fe010113          	addi	sp,sp,-32
    80006ccc:	00113c23          	sd	ra,24(sp)
    80006cd0:	00813823          	sd	s0,16(sp)
    80006cd4:	00913423          	sd	s1,8(sp)
    80006cd8:	01213023          	sd	s2,0(sp)
    80006cdc:	02010413          	addi	s0,sp,32
    80006ce0:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006ce4:	02853503          	ld	a0,40(a0)
    80006ce8:	ffffb097          	auipc	ra,0xffffb
    80006cec:	824080e7          	jalr	-2012(ra) # 8000150c <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80006cf0:	0304b503          	ld	a0,48(s1)
    80006cf4:	ffffb097          	auipc	ra,0xffffb
    80006cf8:	818080e7          	jalr	-2024(ra) # 8000150c <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80006cfc:	0144a783          	lw	a5,20(s1)
    80006d00:	0104a903          	lw	s2,16(s1)
    80006d04:	0327ce63          	blt	a5,s2,80006d40 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006d08:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006d0c:	0304b503          	ld	a0,48(s1)
    80006d10:	ffffb097          	auipc	ra,0xffffb
    80006d14:	82c080e7          	jalr	-2004(ra) # 8000153c <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    80006d18:	0284b503          	ld	a0,40(s1)
    80006d1c:	ffffb097          	auipc	ra,0xffffb
    80006d20:	820080e7          	jalr	-2016(ra) # 8000153c <_Z10sem_signalP4KSem>

    return ret;
}
    80006d24:	00090513          	mv	a0,s2
    80006d28:	01813083          	ld	ra,24(sp)
    80006d2c:	01013403          	ld	s0,16(sp)
    80006d30:	00813483          	ld	s1,8(sp)
    80006d34:	00013903          	ld	s2,0(sp)
    80006d38:	02010113          	addi	sp,sp,32
    80006d3c:	00008067          	ret
        ret = cap - head + tail;
    80006d40:	0004a703          	lw	a4,0(s1)
    80006d44:	4127093b          	subw	s2,a4,s2
    80006d48:	00f9093b          	addw	s2,s2,a5
    80006d4c:	fc1ff06f          	j	80006d0c <_ZN6Buffer6getCntEv+0x44>

0000000080006d50 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006d50:	fe010113          	addi	sp,sp,-32
    80006d54:	00113c23          	sd	ra,24(sp)
    80006d58:	00813823          	sd	s0,16(sp)
    80006d5c:	00913423          	sd	s1,8(sp)
    80006d60:	02010413          	addi	s0,sp,32
    80006d64:	00050493          	mv	s1,a0
    putc('\n');
    80006d68:	00a00513          	li	a0,10
    80006d6c:	ffffb097          	auipc	ra,0xffffb
    80006d70:	828080e7          	jalr	-2008(ra) # 80001594 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006d74:	00003517          	auipc	a0,0x3
    80006d78:	6ec50513          	addi	a0,a0,1772 # 8000a460 <_ZZ9kPrintIntmE6digits+0x3f0>
    80006d7c:	fffff097          	auipc	ra,0xfffff
    80006d80:	e64080e7          	jalr	-412(ra) # 80005be0 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006d84:	00048513          	mv	a0,s1
    80006d88:	00000097          	auipc	ra,0x0
    80006d8c:	f40080e7          	jalr	-192(ra) # 80006cc8 <_ZN6Buffer6getCntEv>
    80006d90:	02a05c63          	blez	a0,80006dc8 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006d94:	0084b783          	ld	a5,8(s1)
    80006d98:	0104a703          	lw	a4,16(s1)
    80006d9c:	00271713          	slli	a4,a4,0x2
    80006da0:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006da4:	0007c503          	lbu	a0,0(a5)
    80006da8:	ffffa097          	auipc	ra,0xffffa
    80006dac:	7ec080e7          	jalr	2028(ra) # 80001594 <_Z4putcc>
        head = (head + 1) % cap;
    80006db0:	0104a783          	lw	a5,16(s1)
    80006db4:	0017879b          	addiw	a5,a5,1
    80006db8:	0004a703          	lw	a4,0(s1)
    80006dbc:	02e7e7bb          	remw	a5,a5,a4
    80006dc0:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006dc4:	fc1ff06f          	j	80006d84 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006dc8:	02100513          	li	a0,33
    80006dcc:	ffffa097          	auipc	ra,0xffffa
    80006dd0:	7c8080e7          	jalr	1992(ra) # 80001594 <_Z4putcc>
    putc('\n');
    80006dd4:	00a00513          	li	a0,10
    80006dd8:	ffffa097          	auipc	ra,0xffffa
    80006ddc:	7bc080e7          	jalr	1980(ra) # 80001594 <_Z4putcc>
    mem_free(buffer);
    80006de0:	0084b503          	ld	a0,8(s1)
    80006de4:	ffffa097          	auipc	ra,0xffffa
    80006de8:	564080e7          	jalr	1380(ra) # 80001348 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006dec:	0204b503          	ld	a0,32(s1)
    80006df0:	ffffa097          	auipc	ra,0xffffa
    80006df4:	6ec080e7          	jalr	1772(ra) # 800014dc <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    80006df8:	0184b503          	ld	a0,24(s1)
    80006dfc:	ffffa097          	auipc	ra,0xffffa
    80006e00:	6e0080e7          	jalr	1760(ra) # 800014dc <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80006e04:	0304b503          	ld	a0,48(s1)
    80006e08:	ffffa097          	auipc	ra,0xffffa
    80006e0c:	6d4080e7          	jalr	1748(ra) # 800014dc <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80006e10:	0284b503          	ld	a0,40(s1)
    80006e14:	ffffa097          	auipc	ra,0xffffa
    80006e18:	6c8080e7          	jalr	1736(ra) # 800014dc <_Z9sem_closeP4KSem>
}
    80006e1c:	01813083          	ld	ra,24(sp)
    80006e20:	01013403          	ld	s0,16(sp)
    80006e24:	00813483          	ld	s1,8(sp)
    80006e28:	02010113          	addi	sp,sp,32
    80006e2c:	00008067          	ret

0000000080006e30 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE>:
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

#pragma GCC optimize("O0")

void* MemoryAllocator::kmalloc(size_t size, Purpose pur) {
    80006e30:	fa010113          	addi	sp,sp,-96
    80006e34:	04813c23          	sd	s0,88(sp)
    80006e38:	06010413          	addi	s0,sp,96
    80006e3c:	faa43423          	sd	a0,-88(s0)
    80006e40:	00058793          	mv	a5,a1
    80006e44:	faf42223          	sw	a5,-92(s0)
    //size je u broju bajtova, ukljucuje i mesto potrebno za zaglavlje UsedMemSegment
    if (size <= 0) return nullptr;
    80006e48:	fa843783          	ld	a5,-88(s0)
    80006e4c:	00079663          	bnez	a5,80006e58 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x28>
    80006e50:	00000793          	li	a5,0
    80006e54:	2040006f          	j	80007058 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
    //alokacija uvek zaokruzena na blokove
    //size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
    size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80006e58:	fa843783          	ld	a5,-88(s0)
    80006e5c:	0067d713          	srli	a4,a5,0x6
    80006e60:	fa843783          	ld	a5,-88(s0)
    80006e64:	03f7f793          	andi	a5,a5,63
    80006e68:	00078663          	beqz	a5,80006e74 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x44>
    80006e6c:	00100793          	li	a5,1
    80006e70:	0080006f          	j	80006e78 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x48>
    80006e74:	00000793          	li	a5,0
    80006e78:	00e787b3          	add	a5,a5,a4
    80006e7c:	fcf43423          	sd	a5,-56(s0)
    size = blocks * MEM_BLOCK_SIZE;
    80006e80:	fc843783          	ld	a5,-56(s0)
    80006e84:	00679793          	slli	a5,a5,0x6
    80006e88:	faf43423          	sd	a5,-88(s0)

    //trazenje slobodnog segmenta po first-fit algoritmu
    FreeMemSegment* prevFree = nullptr;
    80006e8c:	fe043423          	sd	zero,-24(s0)
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    80006e90:	00006797          	auipc	a5,0x6
    80006e94:	01078793          	addi	a5,a5,16 # 8000cea0 <_ZN15MemoryAllocator11freeMemHeadE>
    80006e98:	0007b783          	ld	a5,0(a5)
    80006e9c:	fef43023          	sd	a5,-32(s0)
    80006ea0:	fe043783          	ld	a5,-32(s0)
    80006ea4:	1a078863          	beqz	a5,80007054 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x224>
        if (firstFit->size < size) continue;
    80006ea8:	fe043783          	ld	a5,-32(s0)
    80006eac:	0087b783          	ld	a5,8(a5)
    80006eb0:	fa843703          	ld	a4,-88(s0)
    80006eb4:	18e7e263          	bltu	a5,a4,80007038 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x208>

        //pravljenje novog slobodnog fragmenta od ostatka fragmenta
        FreeMemSegment* remainderFree = (FreeMemSegment*) ((char*) firstFit + size);
    80006eb8:	fe043703          	ld	a4,-32(s0)
    80006ebc:	fa843783          	ld	a5,-88(s0)
    80006ec0:	00f707b3          	add	a5,a4,a5
    80006ec4:	fcf43023          	sd	a5,-64(s0)
        size_t remainingSize = firstFit->size - size;
    80006ec8:	fe043783          	ld	a5,-32(s0)
    80006ecc:	0087b703          	ld	a4,8(a5)
    80006ed0:	fa843783          	ld	a5,-88(s0)
    80006ed4:	40f707b3          	sub	a5,a4,a5
    80006ed8:	faf43c23          	sd	a5,-72(s0)
        if (remainingSize <= sizeof(UsedMemSegment)) {
    80006edc:	fb843703          	ld	a4,-72(s0)
    80006ee0:	02000793          	li	a5,32
    80006ee4:	04e7e463          	bltu	a5,a4,80006f2c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xfc>
            //ne preostaje dovoljno veliki slobodni segment;dodeljujemo ceo trenutno alociranom;remainderFree ne postoji
            size += remainingSize;
    80006ee8:	fa843703          	ld	a4,-88(s0)
    80006eec:	fb843783          	ld	a5,-72(s0)
    80006ef0:	00f707b3          	add	a5,a4,a5
    80006ef4:	faf43423          	sd	a5,-88(s0)
            if (prevFree) {
    80006ef8:	fe843783          	ld	a5,-24(s0)
    80006efc:	00078c63          	beqz	a5,80006f14 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0xe4>
                prevFree->next = firstFit->next;
    80006f00:	fe043783          	ld	a5,-32(s0)
    80006f04:	0007b703          	ld	a4,0(a5)
    80006f08:	fe843783          	ld	a5,-24(s0)
    80006f0c:	00e7b023          	sd	a4,0(a5)
    80006f10:	0600006f          	j	80006f70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = firstFit->next;
    80006f14:	fe043783          	ld	a5,-32(s0)
    80006f18:	0007b703          	ld	a4,0(a5)
    80006f1c:	00006797          	auipc	a5,0x6
    80006f20:	f8478793          	addi	a5,a5,-124 # 8000cea0 <_ZN15MemoryAllocator11freeMemHeadE>
    80006f24:	00e7b023          	sd	a4,0(a5)
    80006f28:	0480006f          	j	80006f70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            }
        } else {
            remainderFree->size = remainingSize;
    80006f2c:	fc043783          	ld	a5,-64(s0)
    80006f30:	fb843703          	ld	a4,-72(s0)
    80006f34:	00e7b423          	sd	a4,8(a5)
            remainderFree->next = firstFit->next;
    80006f38:	fe043783          	ld	a5,-32(s0)
    80006f3c:	0007b703          	ld	a4,0(a5)
    80006f40:	fc043783          	ld	a5,-64(s0)
    80006f44:	00e7b023          	sd	a4,0(a5)
            if (prevFree) {
    80006f48:	fe843783          	ld	a5,-24(s0)
    80006f4c:	00078a63          	beqz	a5,80006f60 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x130>
                prevFree->next = remainderFree;
    80006f50:	fe843783          	ld	a5,-24(s0)
    80006f54:	fc043703          	ld	a4,-64(s0)
    80006f58:	00e7b023          	sd	a4,0(a5)
    80006f5c:	0140006f          	j	80006f70 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x140>
            } else {
                freeMemHead = remainderFree;
    80006f60:	00006797          	auipc	a5,0x6
    80006f64:	f4078793          	addi	a5,a5,-192 # 8000cea0 <_ZN15MemoryAllocator11freeMemHeadE>
    80006f68:	fc043703          	ld	a4,-64(s0)
    80006f6c:	00e7b023          	sd	a4,0(a5)
            }
        }
        //ubacivanje novog fragmenta u listu zauzetih fragmenata
        UsedMemSegment* newUsed = (UsedMemSegment*) firstFit;
    80006f70:	fe043783          	ld	a5,-32(s0)
    80006f74:	faf43823          	sd	a5,-80(s0)
        newUsed->size = size;
    80006f78:	fb043783          	ld	a5,-80(s0)
    80006f7c:	fa843703          	ld	a4,-88(s0)
    80006f80:	00e7b423          	sd	a4,8(a5)
        newUsed->purpose = pur;
    80006f84:	fb043783          	ld	a5,-80(s0)
    80006f88:	fa442703          	lw	a4,-92(s0)
    80006f8c:	00e7a823          	sw	a4,16(a5)
        newUsed->usableFirstAddress = (char*) newUsed + sizeof(UsedMemSegment);
    80006f90:	fb043783          	ld	a5,-80(s0)
    80006f94:	02078713          	addi	a4,a5,32
    80006f98:	fb043783          	ld	a5,-80(s0)
    80006f9c:	00e7bc23          	sd	a4,24(a5)
        UsedMemSegment* prevUsed = nullptr;
    80006fa0:	fc043c23          	sd	zero,-40(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80006fa4:	00006797          	auipc	a5,0x6
    80006fa8:	ef478793          	addi	a5,a5,-268 # 8000ce98 <_ZN15MemoryAllocator11usedMemHeadE>
    80006fac:	0007b783          	ld	a5,0(a5)
    80006fb0:	fcf43823          	sd	a5,-48(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80006fb4:	fd043783          	ld	a5,-48(s0)
    80006fb8:	02078463          	beqz	a5,80006fe0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
    80006fbc:	fd043703          	ld	a4,-48(s0)
    80006fc0:	fb043783          	ld	a5,-80(s0)
    80006fc4:	00f77e63          	bgeu	a4,a5,80006fe0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1b0>
            prevUsed = cur;
    80006fc8:	fd043783          	ld	a5,-48(s0)
    80006fcc:	fcf43c23          	sd	a5,-40(s0)
             cur && ((char*) cur < (char*) newUsed); cur = cur->next) {
    80006fd0:	fd043783          	ld	a5,-48(s0)
    80006fd4:	0007b783          	ld	a5,0(a5)
    80006fd8:	fcf43823          	sd	a5,-48(s0)
        for (UsedMemSegment* cur = usedMemHead;
    80006fdc:	fd9ff06f          	j	80006fb4 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x184>
        }
        if (!prevUsed) {
    80006fe0:	fd843783          	ld	a5,-40(s0)
    80006fe4:	02079663          	bnez	a5,80007010 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1e0>
            newUsed->next = usedMemHead;
    80006fe8:	00006797          	auipc	a5,0x6
    80006fec:	eb078793          	addi	a5,a5,-336 # 8000ce98 <_ZN15MemoryAllocator11usedMemHeadE>
    80006ff0:	0007b703          	ld	a4,0(a5)
    80006ff4:	fb043783          	ld	a5,-80(s0)
    80006ff8:	00e7b023          	sd	a4,0(a5)
            usedMemHead = newUsed;
    80006ffc:	00006797          	auipc	a5,0x6
    80007000:	e9c78793          	addi	a5,a5,-356 # 8000ce98 <_ZN15MemoryAllocator11usedMemHeadE>
    80007004:	fb043703          	ld	a4,-80(s0)
    80007008:	00e7b023          	sd	a4,0(a5)
    8000700c:	0200006f          	j	8000702c <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x1fc>
        } else {
            newUsed->next = prevUsed->next;
    80007010:	fd843783          	ld	a5,-40(s0)
    80007014:	0007b703          	ld	a4,0(a5)
    80007018:	fb043783          	ld	a5,-80(s0)
    8000701c:	00e7b023          	sd	a4,0(a5)
            prevUsed->next = newUsed;
    80007020:	fd843783          	ld	a5,-40(s0)
    80007024:	fb043703          	ld	a4,-80(s0)
    80007028:	00e7b023          	sd	a4,0(a5)
        }
        //return (char*)newUsed + sizeof(UsedMemSegment);
        return newUsed->usableFirstAddress;
    8000702c:	fb043783          	ld	a5,-80(s0)
    80007030:	0187b783          	ld	a5,24(a5)
    80007034:	0240006f          	j	80007058 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x228>
        if (firstFit->size < size) continue;
    80007038:	00000013          	nop
    for (FreeMemSegment* firstFit = freeMemHead; firstFit; prevFree = firstFit, firstFit = firstFit->next) {
    8000703c:	fe043783          	ld	a5,-32(s0)
    80007040:	fef43423          	sd	a5,-24(s0)
    80007044:	fe043783          	ld	a5,-32(s0)
    80007048:	0007b783          	ld	a5,0(a5)
    8000704c:	fef43023          	sd	a5,-32(s0)
    80007050:	e51ff06f          	j	80006ea0 <_ZN15MemoryAllocator7kmallocEmNS_7PurposeE+0x70>
    }
    return nullptr;
    80007054:	00000793          	li	a5,0
}
    80007058:	00078513          	mv	a0,a5
    8000705c:	05813403          	ld	s0,88(sp)
    80007060:	06010113          	addi	sp,sp,96
    80007064:	00008067          	ret

0000000080007068 <_ZN15MemoryAllocator5kfreeEPv>:

#pragma GCC optimize("O0")

int MemoryAllocator::kfree(void* ptr) {
    80007068:	fb010113          	addi	sp,sp,-80
    8000706c:	04113423          	sd	ra,72(sp)
    80007070:	04813023          	sd	s0,64(sp)
    80007074:	05010413          	addi	s0,sp,80
    80007078:	faa43c23          	sd	a0,-72(s0)
    if (!ptr) return 0;
    8000707c:	fb843783          	ld	a5,-72(s0)
    80007080:	00079663          	bnez	a5,8000708c <_ZN15MemoryAllocator5kfreeEPv+0x24>
    80007084:	00000793          	li	a5,0
    80007088:	1740006f          	j	800071fc <_ZN15MemoryAllocator5kfreeEPv+0x194>
    if (!usedMemHead) return -1;
    8000708c:	00006797          	auipc	a5,0x6
    80007090:	e0c78793          	addi	a5,a5,-500 # 8000ce98 <_ZN15MemoryAllocator11usedMemHeadE>
    80007094:	0007b783          	ld	a5,0(a5)
    80007098:	00079663          	bnez	a5,800070a4 <_ZN15MemoryAllocator5kfreeEPv+0x3c>
    8000709c:	fff00793          	li	a5,-1
    800070a0:	15c0006f          	j	800071fc <_ZN15MemoryAllocator5kfreeEPv+0x194>
    //ptr pokazuje na usableFirstAddress, pre toga je zaglavlje segmenta
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    800070a4:	fb843783          	ld	a5,-72(s0)
    800070a8:	fe078793          	addi	a5,a5,-32
    800070ac:	faf43c23          	sd	a5,-72(s0)

    //trazenje adrese ptr u listi zauzetih segmenata
    UsedMemSegment* currentUsed = usedMemHead;
    800070b0:	00006797          	auipc	a5,0x6
    800070b4:	de878793          	addi	a5,a5,-536 # 8000ce98 <_ZN15MemoryAllocator11usedMemHeadE>
    800070b8:	0007b783          	ld	a5,0(a5)
    800070bc:	fef43423          	sd	a5,-24(s0)
    UsedMemSegment* prevUsed = nullptr;
    800070c0:	fe043023          	sd	zero,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    800070c4:	fe843783          	ld	a5,-24(s0)
    800070c8:	02078463          	beqz	a5,800070f0 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    800070cc:	fe843703          	ld	a4,-24(s0)
    800070d0:	fb843783          	ld	a5,-72(s0)
    800070d4:	00f70e63          	beq	a4,a5,800070f0 <_ZN15MemoryAllocator5kfreeEPv+0x88>
        prevUsed = currentUsed;
    800070d8:	fe843783          	ld	a5,-24(s0)
    800070dc:	fef43023          	sd	a5,-32(s0)
    for (; currentUsed && ((char*) currentUsed != (char*) ptr); currentUsed = currentUsed->next) {
    800070e0:	fe843783          	ld	a5,-24(s0)
    800070e4:	0007b783          	ld	a5,0(a5)
    800070e8:	fef43423          	sd	a5,-24(s0)
    800070ec:	fd9ff06f          	j	800070c4 <_ZN15MemoryAllocator5kfreeEPv+0x5c>
    }
    if ((char*) currentUsed != (char*) ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    800070f0:	fe843703          	ld	a4,-24(s0)
    800070f4:	fb843783          	ld	a5,-72(s0)
    800070f8:	00f70663          	beq	a4,a5,80007104 <_ZN15MemoryAllocator5kfreeEPv+0x9c>
    800070fc:	fff00793          	li	a5,-1
    80007100:	0fc0006f          	j	800071fc <_ZN15MemoryAllocator5kfreeEPv+0x194>

    //izbacivanje iz liste zauzetih segmenata
    if (prevUsed) prevUsed->next = currentUsed->next;
    80007104:	fe043783          	ld	a5,-32(s0)
    80007108:	00078c63          	beqz	a5,80007120 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    8000710c:	fe843783          	ld	a5,-24(s0)
    80007110:	0007b703          	ld	a4,0(a5)
    80007114:	fe043783          	ld	a5,-32(s0)
    80007118:	00e7b023          	sd	a4,0(a5)
    8000711c:	0180006f          	j	80007134 <_ZN15MemoryAllocator5kfreeEPv+0xcc>
    else usedMemHead = currentUsed->next;
    80007120:	fe843783          	ld	a5,-24(s0)
    80007124:	0007b703          	ld	a4,0(a5)
    80007128:	00006797          	auipc	a5,0x6
    8000712c:	d7078793          	addi	a5,a5,-656 # 8000ce98 <_ZN15MemoryAllocator11usedMemHeadE>
    80007130:	00e7b023          	sd	a4,0(a5)

    //oslobadjanje segmenta i ubacivanje u listu slobodnih
    FreeMemSegment* prevFree = nullptr;
    80007134:	fc043c23          	sd	zero,-40(s0)
    FreeMemSegment* nextFree = freeMemHead;
    80007138:	00006797          	auipc	a5,0x6
    8000713c:	d6878793          	addi	a5,a5,-664 # 8000cea0 <_ZN15MemoryAllocator11freeMemHeadE>
    80007140:	0007b783          	ld	a5,0(a5)
    80007144:	fcf43823          	sd	a5,-48(s0)
    for (; nextFree && (char*) nextFree < (char*) ptr; prevFree = nextFree, nextFree = nextFree->next);
    80007148:	fd043783          	ld	a5,-48(s0)
    8000714c:	02078463          	beqz	a5,80007174 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    80007150:	fd043703          	ld	a4,-48(s0)
    80007154:	fb843783          	ld	a5,-72(s0)
    80007158:	00f77e63          	bgeu	a4,a5,80007174 <_ZN15MemoryAllocator5kfreeEPv+0x10c>
    8000715c:	fd043783          	ld	a5,-48(s0)
    80007160:	fcf43c23          	sd	a5,-40(s0)
    80007164:	fd043783          	ld	a5,-48(s0)
    80007168:	0007b783          	ld	a5,0(a5)
    8000716c:	fcf43823          	sd	a5,-48(s0)
    80007170:	fd9ff06f          	j	80007148 <_ZN15MemoryAllocator5kfreeEPv+0xe0>
    FreeMemSegment* newFree = (FreeMemSegment*) ptr;
    80007174:	fb843783          	ld	a5,-72(s0)
    80007178:	fcf43423          	sd	a5,-56(s0)
    size_t segmentSize = ((UsedMemSegment*) ptr)->size;
    8000717c:	fb843783          	ld	a5,-72(s0)
    80007180:	0087b783          	ld	a5,8(a5)
    80007184:	fcf43023          	sd	a5,-64(s0)
    newFree->size = segmentSize;
    80007188:	fc843783          	ld	a5,-56(s0)
    8000718c:	fc043703          	ld	a4,-64(s0)
    80007190:	00e7b423          	sd	a4,8(a5)
    if (prevFree) {
    80007194:	fd843783          	ld	a5,-40(s0)
    80007198:	02078263          	beqz	a5,800071bc <_ZN15MemoryAllocator5kfreeEPv+0x154>
        newFree->next = prevFree->next;
    8000719c:	fd843783          	ld	a5,-40(s0)
    800071a0:	0007b703          	ld	a4,0(a5)
    800071a4:	fc843783          	ld	a5,-56(s0)
    800071a8:	00e7b023          	sd	a4,0(a5)
        prevFree->next = newFree;
    800071ac:	fd843783          	ld	a5,-40(s0)
    800071b0:	fc843703          	ld	a4,-56(s0)
    800071b4:	00e7b023          	sd	a4,0(a5)
    800071b8:	0280006f          	j	800071e0 <_ZN15MemoryAllocator5kfreeEPv+0x178>
    } else {
        newFree->next = freeMemHead;
    800071bc:	00006797          	auipc	a5,0x6
    800071c0:	ce478793          	addi	a5,a5,-796 # 8000cea0 <_ZN15MemoryAllocator11freeMemHeadE>
    800071c4:	0007b703          	ld	a4,0(a5)
    800071c8:	fc843783          	ld	a5,-56(s0)
    800071cc:	00e7b023          	sd	a4,0(a5)
        freeMemHead = newFree;
    800071d0:	00006797          	auipc	a5,0x6
    800071d4:	cd078793          	addi	a5,a5,-816 # 8000cea0 <_ZN15MemoryAllocator11freeMemHeadE>
    800071d8:	fc843703          	ld	a4,-56(s0)
    800071dc:	00e7b023          	sd	a4,0(a5)
    }

    //spajanje uzastopnih slobodnih segmenata
    tryToJoin(newFree);
    800071e0:	fc843503          	ld	a0,-56(s0)
    800071e4:	00000097          	auipc	ra,0x0
    800071e8:	02c080e7          	jalr	44(ra) # 80007210 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    tryToJoin(prevFree);
    800071ec:	fd843503          	ld	a0,-40(s0)
    800071f0:	00000097          	auipc	ra,0x0
    800071f4:	020080e7          	jalr	32(ra) # 80007210 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
    return 0;
    800071f8:	00000793          	li	a5,0
}
    800071fc:	00078513          	mv	a0,a5
    80007200:	04813083          	ld	ra,72(sp)
    80007204:	04013403          	ld	s0,64(sp)
    80007208:	05010113          	addi	sp,sp,80
    8000720c:	00008067          	ret

0000000080007210 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:

#pragma GCC optimize("O0")

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80007210:	fc010113          	addi	sp,sp,-64
    80007214:	02813c23          	sd	s0,56(sp)
    80007218:	04010413          	addi	s0,sp,64
    8000721c:	fca43423          	sd	a0,-56(s0)
    if (!current) return 0;
    80007220:	fc843783          	ld	a5,-56(s0)
    80007224:	00079663          	bnez	a5,80007230 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x20>
    80007228:	00000793          	li	a5,0
    8000722c:	0a00006f          	j	800072cc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    bool nextExists = current->next != nullptr;
    80007230:	fc843783          	ld	a5,-56(s0)
    80007234:	0007b783          	ld	a5,0(a5)
    80007238:	00f037b3          	snez	a5,a5
    8000723c:	fef407a3          	sb	a5,-17(s0)
    char* nextAddr = (char*) current + current->size;
    80007240:	fc843783          	ld	a5,-56(s0)
    80007244:	0087b783          	ld	a5,8(a5)
    80007248:	fc843703          	ld	a4,-56(s0)
    8000724c:	00f707b3          	add	a5,a4,a5
    80007250:	fef43023          	sd	a5,-32(s0)
    char* cnext = (char*) current->next;
    80007254:	fc843783          	ld	a5,-56(s0)
    80007258:	0007b783          	ld	a5,0(a5)
    8000725c:	fcf43c23          	sd	a5,-40(s0)
    bool nextIsConnected = (nextAddr == cnext);
    80007260:	fe043703          	ld	a4,-32(s0)
    80007264:	fd843783          	ld	a5,-40(s0)
    80007268:	40f707b3          	sub	a5,a4,a5
    8000726c:	0017b793          	seqz	a5,a5
    80007270:	fcf40ba3          	sb	a5,-41(s0)
    if (nextExists && nextIsConnected) {
    80007274:	fef44783          	lbu	a5,-17(s0)
    80007278:	0ff7f793          	andi	a5,a5,255
    8000727c:	04078663          	beqz	a5,800072c8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
    80007280:	fd744783          	lbu	a5,-41(s0)
    80007284:	0ff7f793          	andi	a5,a5,255
    80007288:	04078063          	beqz	a5,800072c8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xb8>
        current->size += current->next->size;
    8000728c:	fc843783          	ld	a5,-56(s0)
    80007290:	0087b703          	ld	a4,8(a5)
    80007294:	fc843783          	ld	a5,-56(s0)
    80007298:	0007b783          	ld	a5,0(a5)
    8000729c:	0087b783          	ld	a5,8(a5)
    800072a0:	00f70733          	add	a4,a4,a5
    800072a4:	fc843783          	ld	a5,-56(s0)
    800072a8:	00e7b423          	sd	a4,8(a5)
        current->next = current->next->next;
    800072ac:	fc843783          	ld	a5,-56(s0)
    800072b0:	0007b783          	ld	a5,0(a5)
    800072b4:	0007b703          	ld	a4,0(a5)
    800072b8:	fc843783          	ld	a5,-56(s0)
    800072bc:	00e7b023          	sd	a4,0(a5)
        return 1;
    800072c0:	00100793          	li	a5,1
    800072c4:	0080006f          	j	800072cc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0xbc>
    } else return 0;
    800072c8:	00000793          	li	a5,0
}
    800072cc:	00078513          	mv	a0,a5
    800072d0:	03813403          	ld	s0,56(sp)
    800072d4:	04010113          	addi	sp,sp,64
    800072d8:	00008067          	ret

00000000800072dc <_ZN15MemoryAllocator12checkPurposeEPvNS_7PurposeE>:

bool MemoryAllocator::checkPurpose(void* ptr, MemoryAllocator::Purpose p) {
    800072dc:	fe010113          	addi	sp,sp,-32
    800072e0:	00813c23          	sd	s0,24(sp)
    800072e4:	02010413          	addi	s0,sp,32
    800072e8:	fea43423          	sd	a0,-24(s0)
    800072ec:	00058793          	mv	a5,a1
    800072f0:	fef42223          	sw	a5,-28(s0)
    ptr = (char*) ptr - sizeof(UsedMemSegment);
    800072f4:	fe843783          	ld	a5,-24(s0)
    800072f8:	fe078793          	addi	a5,a5,-32
    800072fc:	fef43423          	sd	a5,-24(s0)
    return ((UsedMemSegment*) ptr)->purpose == p;
    80007300:	fe843783          	ld	a5,-24(s0)
    80007304:	0107a703          	lw	a4,16(a5)
    80007308:	fe442783          	lw	a5,-28(s0)
    8000730c:	0007879b          	sext.w	a5,a5
    80007310:	40e787b3          	sub	a5,a5,a4
    80007314:	0017b793          	seqz	a5,a5
    80007318:	0ff7f793          	andi	a5,a5,255
}
    8000731c:	00078513          	mv	a0,a5
    80007320:	01813403          	ld	s0,24(sp)
    80007324:	02010113          	addi	sp,sp,32
    80007328:	00008067          	ret

000000008000732c <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

void MemoryAllocator::initMemoryAllocator() {
    8000732c:	ff010113          	addi	sp,sp,-16
    80007330:	00813423          	sd	s0,8(sp)
    80007334:	01010413          	addi	s0,sp,16
//pocetna inicijalizacija
    if (!initialized) {
    80007338:	00006797          	auipc	a5,0x6
    8000733c:	b7078793          	addi	a5,a5,-1168 # 8000cea8 <_ZN15MemoryAllocator11initializedE>
    80007340:	0007c783          	lbu	a5,0(a5)
    80007344:	0017c793          	xori	a5,a5,1
    80007348:	0ff7f793          	andi	a5,a5,255
    8000734c:	06078a63          	beqz	a5,800073c0 <_ZN15MemoryAllocator19initMemoryAllocatorEv+0x94>
        freeMemHead = (FreeMemSegment*) HEAP_START_ADDR;
    80007350:	00006797          	auipc	a5,0x6
    80007354:	9407b783          	ld	a5,-1728(a5) # 8000cc90 <_GLOBAL_OFFSET_TABLE_+0x28>
    80007358:	0007b703          	ld	a4,0(a5)
    8000735c:	00006797          	auipc	a5,0x6
    80007360:	b4478793          	addi	a5,a5,-1212 # 8000cea0 <_ZN15MemoryAllocator11freeMemHeadE>
    80007364:	00e7b023          	sd	a4,0(a5)
        freeMemHead->next = nullptr;
    80007368:	00006797          	auipc	a5,0x6
    8000736c:	b3878793          	addi	a5,a5,-1224 # 8000cea0 <_ZN15MemoryAllocator11freeMemHeadE>
    80007370:	0007b783          	ld	a5,0(a5)
    80007374:	0007b023          	sd	zero,0(a5)
        //freeMemHead->prev = nullptr;
        freeMemHead->size = (char*) HEAP_END_ADDR - (char*) HEAP_START_ADDR;//- sizeof(FreeMemSegment);
    80007378:	00006797          	auipc	a5,0x6
    8000737c:	9587b783          	ld	a5,-1704(a5) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80007380:	0007b703          	ld	a4,0(a5)
    80007384:	00006797          	auipc	a5,0x6
    80007388:	90c7b783          	ld	a5,-1780(a5) # 8000cc90 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000738c:	0007b783          	ld	a5,0(a5)
    80007390:	40f70733          	sub	a4,a4,a5
    80007394:	00006797          	auipc	a5,0x6
    80007398:	b0c78793          	addi	a5,a5,-1268 # 8000cea0 <_ZN15MemoryAllocator11freeMemHeadE>
    8000739c:	0007b783          	ld	a5,0(a5)
    800073a0:	00e7b423          	sd	a4,8(a5)
        usedMemHead = nullptr;
    800073a4:	00006797          	auipc	a5,0x6
    800073a8:	af478793          	addi	a5,a5,-1292 # 8000ce98 <_ZN15MemoryAllocator11usedMemHeadE>
    800073ac:	0007b023          	sd	zero,0(a5)

        initialized = true;
    800073b0:	00006797          	auipc	a5,0x6
    800073b4:	af878793          	addi	a5,a5,-1288 # 8000cea8 <_ZN15MemoryAllocator11initializedE>
    800073b8:	00100713          	li	a4,1
    800073bc:	00e78023          	sb	a4,0(a5)
    }
}
    800073c0:	00000013          	nop
    800073c4:	00813403          	ld	s0,8(sp)
    800073c8:	01010113          	addi	sp,sp,16
    800073cc:	00008067          	ret

00000000800073d0 <start>:
    800073d0:	ff010113          	addi	sp,sp,-16
    800073d4:	00813423          	sd	s0,8(sp)
    800073d8:	01010413          	addi	s0,sp,16
    800073dc:	300027f3          	csrr	a5,mstatus
    800073e0:	ffffe737          	lui	a4,0xffffe
    800073e4:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff06ef>
    800073e8:	00e7f7b3          	and	a5,a5,a4
    800073ec:	00001737          	lui	a4,0x1
    800073f0:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800073f4:	00e7e7b3          	or	a5,a5,a4
    800073f8:	30079073          	csrw	mstatus,a5
    800073fc:	00000797          	auipc	a5,0x0
    80007400:	16078793          	addi	a5,a5,352 # 8000755c <system_main>
    80007404:	34179073          	csrw	mepc,a5
    80007408:	00000793          	li	a5,0
    8000740c:	18079073          	csrw	satp,a5
    80007410:	000107b7          	lui	a5,0x10
    80007414:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80007418:	30279073          	csrw	medeleg,a5
    8000741c:	30379073          	csrw	mideleg,a5
    80007420:	104027f3          	csrr	a5,sie
    80007424:	2227e793          	ori	a5,a5,546
    80007428:	10479073          	csrw	sie,a5
    8000742c:	fff00793          	li	a5,-1
    80007430:	00a7d793          	srli	a5,a5,0xa
    80007434:	3b079073          	csrw	pmpaddr0,a5
    80007438:	00f00793          	li	a5,15
    8000743c:	3a079073          	csrw	pmpcfg0,a5
    80007440:	f14027f3          	csrr	a5,mhartid
    80007444:	0200c737          	lui	a4,0x200c
    80007448:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000744c:	0007869b          	sext.w	a3,a5
    80007450:	00269713          	slli	a4,a3,0x2
    80007454:	000f4637          	lui	a2,0xf4
    80007458:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000745c:	00d70733          	add	a4,a4,a3
    80007460:	0037979b          	slliw	a5,a5,0x3
    80007464:	020046b7          	lui	a3,0x2004
    80007468:	00d787b3          	add	a5,a5,a3
    8000746c:	00c585b3          	add	a1,a1,a2
    80007470:	00371693          	slli	a3,a4,0x3
    80007474:	00006717          	auipc	a4,0x6
    80007478:	a3c70713          	addi	a4,a4,-1476 # 8000ceb0 <timer_scratch>
    8000747c:	00b7b023          	sd	a1,0(a5)
    80007480:	00d70733          	add	a4,a4,a3
    80007484:	00f73c23          	sd	a5,24(a4)
    80007488:	02c73023          	sd	a2,32(a4)
    8000748c:	34071073          	csrw	mscratch,a4
    80007490:	00000797          	auipc	a5,0x0
    80007494:	6e078793          	addi	a5,a5,1760 # 80007b70 <timervec>
    80007498:	30579073          	csrw	mtvec,a5
    8000749c:	300027f3          	csrr	a5,mstatus
    800074a0:	0087e793          	ori	a5,a5,8
    800074a4:	30079073          	csrw	mstatus,a5
    800074a8:	304027f3          	csrr	a5,mie
    800074ac:	0807e793          	ori	a5,a5,128
    800074b0:	30479073          	csrw	mie,a5
    800074b4:	f14027f3          	csrr	a5,mhartid
    800074b8:	0007879b          	sext.w	a5,a5
    800074bc:	00078213          	mv	tp,a5
    800074c0:	30200073          	mret
    800074c4:	00813403          	ld	s0,8(sp)
    800074c8:	01010113          	addi	sp,sp,16
    800074cc:	00008067          	ret

00000000800074d0 <timerinit>:
    800074d0:	ff010113          	addi	sp,sp,-16
    800074d4:	00813423          	sd	s0,8(sp)
    800074d8:	01010413          	addi	s0,sp,16
    800074dc:	f14027f3          	csrr	a5,mhartid
    800074e0:	0200c737          	lui	a4,0x200c
    800074e4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800074e8:	0007869b          	sext.w	a3,a5
    800074ec:	00269713          	slli	a4,a3,0x2
    800074f0:	000f4637          	lui	a2,0xf4
    800074f4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800074f8:	00d70733          	add	a4,a4,a3
    800074fc:	0037979b          	slliw	a5,a5,0x3
    80007500:	020046b7          	lui	a3,0x2004
    80007504:	00d787b3          	add	a5,a5,a3
    80007508:	00c585b3          	add	a1,a1,a2
    8000750c:	00371693          	slli	a3,a4,0x3
    80007510:	00006717          	auipc	a4,0x6
    80007514:	9a070713          	addi	a4,a4,-1632 # 8000ceb0 <timer_scratch>
    80007518:	00b7b023          	sd	a1,0(a5)
    8000751c:	00d70733          	add	a4,a4,a3
    80007520:	00f73c23          	sd	a5,24(a4)
    80007524:	02c73023          	sd	a2,32(a4)
    80007528:	34071073          	csrw	mscratch,a4
    8000752c:	00000797          	auipc	a5,0x0
    80007530:	64478793          	addi	a5,a5,1604 # 80007b70 <timervec>
    80007534:	30579073          	csrw	mtvec,a5
    80007538:	300027f3          	csrr	a5,mstatus
    8000753c:	0087e793          	ori	a5,a5,8
    80007540:	30079073          	csrw	mstatus,a5
    80007544:	304027f3          	csrr	a5,mie
    80007548:	0807e793          	ori	a5,a5,128
    8000754c:	30479073          	csrw	mie,a5
    80007550:	00813403          	ld	s0,8(sp)
    80007554:	01010113          	addi	sp,sp,16
    80007558:	00008067          	ret

000000008000755c <system_main>:
    8000755c:	fe010113          	addi	sp,sp,-32
    80007560:	00813823          	sd	s0,16(sp)
    80007564:	00913423          	sd	s1,8(sp)
    80007568:	00113c23          	sd	ra,24(sp)
    8000756c:	02010413          	addi	s0,sp,32
    80007570:	00000097          	auipc	ra,0x0
    80007574:	0c4080e7          	jalr	196(ra) # 80007634 <cpuid>
    80007578:	00005497          	auipc	s1,0x5
    8000757c:	79848493          	addi	s1,s1,1944 # 8000cd10 <started>
    80007580:	02050263          	beqz	a0,800075a4 <system_main+0x48>
    80007584:	0004a783          	lw	a5,0(s1)
    80007588:	0007879b          	sext.w	a5,a5
    8000758c:	fe078ce3          	beqz	a5,80007584 <system_main+0x28>
    80007590:	0ff0000f          	fence
    80007594:	00003517          	auipc	a0,0x3
    80007598:	19c50513          	addi	a0,a0,412 # 8000a730 <_ZZ9kPrintIntmE6digits+0x6c0>
    8000759c:	00001097          	auipc	ra,0x1
    800075a0:	a70080e7          	jalr	-1424(ra) # 8000800c <panic>
    800075a4:	00001097          	auipc	ra,0x1
    800075a8:	9c4080e7          	jalr	-1596(ra) # 80007f68 <consoleinit>
    800075ac:	00001097          	auipc	ra,0x1
    800075b0:	150080e7          	jalr	336(ra) # 800086fc <printfinit>
    800075b4:	00003517          	auipc	a0,0x3
    800075b8:	00450513          	addi	a0,a0,4 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800075bc:	00001097          	auipc	ra,0x1
    800075c0:	aac080e7          	jalr	-1364(ra) # 80008068 <__printf>
    800075c4:	00003517          	auipc	a0,0x3
    800075c8:	13c50513          	addi	a0,a0,316 # 8000a700 <_ZZ9kPrintIntmE6digits+0x690>
    800075cc:	00001097          	auipc	ra,0x1
    800075d0:	a9c080e7          	jalr	-1380(ra) # 80008068 <__printf>
    800075d4:	00003517          	auipc	a0,0x3
    800075d8:	fe450513          	addi	a0,a0,-28 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    800075dc:	00001097          	auipc	ra,0x1
    800075e0:	a8c080e7          	jalr	-1396(ra) # 80008068 <__printf>
    800075e4:	00001097          	auipc	ra,0x1
    800075e8:	4a4080e7          	jalr	1188(ra) # 80008a88 <kinit>
    800075ec:	00000097          	auipc	ra,0x0
    800075f0:	148080e7          	jalr	328(ra) # 80007734 <trapinit>
    800075f4:	00000097          	auipc	ra,0x0
    800075f8:	16c080e7          	jalr	364(ra) # 80007760 <trapinithart>
    800075fc:	00000097          	auipc	ra,0x0
    80007600:	5b4080e7          	jalr	1460(ra) # 80007bb0 <plicinit>
    80007604:	00000097          	auipc	ra,0x0
    80007608:	5d4080e7          	jalr	1492(ra) # 80007bd8 <plicinithart>
    8000760c:	00000097          	auipc	ra,0x0
    80007610:	078080e7          	jalr	120(ra) # 80007684 <userinit>
    80007614:	0ff0000f          	fence
    80007618:	00100793          	li	a5,1
    8000761c:	00003517          	auipc	a0,0x3
    80007620:	0fc50513          	addi	a0,a0,252 # 8000a718 <_ZZ9kPrintIntmE6digits+0x6a8>
    80007624:	00f4a023          	sw	a5,0(s1)
    80007628:	00001097          	auipc	ra,0x1
    8000762c:	a40080e7          	jalr	-1472(ra) # 80008068 <__printf>
    80007630:	0000006f          	j	80007630 <system_main+0xd4>

0000000080007634 <cpuid>:
    80007634:	ff010113          	addi	sp,sp,-16
    80007638:	00813423          	sd	s0,8(sp)
    8000763c:	01010413          	addi	s0,sp,16
    80007640:	00020513          	mv	a0,tp
    80007644:	00813403          	ld	s0,8(sp)
    80007648:	0005051b          	sext.w	a0,a0
    8000764c:	01010113          	addi	sp,sp,16
    80007650:	00008067          	ret

0000000080007654 <mycpu>:
    80007654:	ff010113          	addi	sp,sp,-16
    80007658:	00813423          	sd	s0,8(sp)
    8000765c:	01010413          	addi	s0,sp,16
    80007660:	00020793          	mv	a5,tp
    80007664:	00813403          	ld	s0,8(sp)
    80007668:	0007879b          	sext.w	a5,a5
    8000766c:	00779793          	slli	a5,a5,0x7
    80007670:	00007517          	auipc	a0,0x7
    80007674:	87050513          	addi	a0,a0,-1936 # 8000dee0 <cpus>
    80007678:	00f50533          	add	a0,a0,a5
    8000767c:	01010113          	addi	sp,sp,16
    80007680:	00008067          	ret

0000000080007684 <userinit>:
    80007684:	ff010113          	addi	sp,sp,-16
    80007688:	00813423          	sd	s0,8(sp)
    8000768c:	01010413          	addi	s0,sp,16
    80007690:	00813403          	ld	s0,8(sp)
    80007694:	01010113          	addi	sp,sp,16
    80007698:	ffffc317          	auipc	t1,0xffffc
    8000769c:	d7030067          	jr	-656(t1) # 80003408 <main>

00000000800076a0 <either_copyout>:
    800076a0:	ff010113          	addi	sp,sp,-16
    800076a4:	00813023          	sd	s0,0(sp)
    800076a8:	00113423          	sd	ra,8(sp)
    800076ac:	01010413          	addi	s0,sp,16
    800076b0:	02051663          	bnez	a0,800076dc <either_copyout+0x3c>
    800076b4:	00058513          	mv	a0,a1
    800076b8:	00060593          	mv	a1,a2
    800076bc:	0006861b          	sext.w	a2,a3
    800076c0:	00002097          	auipc	ra,0x2
    800076c4:	c54080e7          	jalr	-940(ra) # 80009314 <__memmove>
    800076c8:	00813083          	ld	ra,8(sp)
    800076cc:	00013403          	ld	s0,0(sp)
    800076d0:	00000513          	li	a0,0
    800076d4:	01010113          	addi	sp,sp,16
    800076d8:	00008067          	ret
    800076dc:	00003517          	auipc	a0,0x3
    800076e0:	07c50513          	addi	a0,a0,124 # 8000a758 <_ZZ9kPrintIntmE6digits+0x6e8>
    800076e4:	00001097          	auipc	ra,0x1
    800076e8:	928080e7          	jalr	-1752(ra) # 8000800c <panic>

00000000800076ec <either_copyin>:
    800076ec:	ff010113          	addi	sp,sp,-16
    800076f0:	00813023          	sd	s0,0(sp)
    800076f4:	00113423          	sd	ra,8(sp)
    800076f8:	01010413          	addi	s0,sp,16
    800076fc:	02059463          	bnez	a1,80007724 <either_copyin+0x38>
    80007700:	00060593          	mv	a1,a2
    80007704:	0006861b          	sext.w	a2,a3
    80007708:	00002097          	auipc	ra,0x2
    8000770c:	c0c080e7          	jalr	-1012(ra) # 80009314 <__memmove>
    80007710:	00813083          	ld	ra,8(sp)
    80007714:	00013403          	ld	s0,0(sp)
    80007718:	00000513          	li	a0,0
    8000771c:	01010113          	addi	sp,sp,16
    80007720:	00008067          	ret
    80007724:	00003517          	auipc	a0,0x3
    80007728:	05c50513          	addi	a0,a0,92 # 8000a780 <_ZZ9kPrintIntmE6digits+0x710>
    8000772c:	00001097          	auipc	ra,0x1
    80007730:	8e0080e7          	jalr	-1824(ra) # 8000800c <panic>

0000000080007734 <trapinit>:
    80007734:	ff010113          	addi	sp,sp,-16
    80007738:	00813423          	sd	s0,8(sp)
    8000773c:	01010413          	addi	s0,sp,16
    80007740:	00813403          	ld	s0,8(sp)
    80007744:	00003597          	auipc	a1,0x3
    80007748:	06458593          	addi	a1,a1,100 # 8000a7a8 <_ZZ9kPrintIntmE6digits+0x738>
    8000774c:	00007517          	auipc	a0,0x7
    80007750:	81450513          	addi	a0,a0,-2028 # 8000df60 <tickslock>
    80007754:	01010113          	addi	sp,sp,16
    80007758:	00001317          	auipc	t1,0x1
    8000775c:	5c030067          	jr	1472(t1) # 80008d18 <initlock>

0000000080007760 <trapinithart>:
    80007760:	ff010113          	addi	sp,sp,-16
    80007764:	00813423          	sd	s0,8(sp)
    80007768:	01010413          	addi	s0,sp,16
    8000776c:	00000797          	auipc	a5,0x0
    80007770:	2f478793          	addi	a5,a5,756 # 80007a60 <kernelvec>
    80007774:	10579073          	csrw	stvec,a5
    80007778:	00813403          	ld	s0,8(sp)
    8000777c:	01010113          	addi	sp,sp,16
    80007780:	00008067          	ret

0000000080007784 <usertrap>:
    80007784:	ff010113          	addi	sp,sp,-16
    80007788:	00813423          	sd	s0,8(sp)
    8000778c:	01010413          	addi	s0,sp,16
    80007790:	00813403          	ld	s0,8(sp)
    80007794:	01010113          	addi	sp,sp,16
    80007798:	00008067          	ret

000000008000779c <usertrapret>:
    8000779c:	ff010113          	addi	sp,sp,-16
    800077a0:	00813423          	sd	s0,8(sp)
    800077a4:	01010413          	addi	s0,sp,16
    800077a8:	00813403          	ld	s0,8(sp)
    800077ac:	01010113          	addi	sp,sp,16
    800077b0:	00008067          	ret

00000000800077b4 <kerneltrap>:
    800077b4:	fe010113          	addi	sp,sp,-32
    800077b8:	00813823          	sd	s0,16(sp)
    800077bc:	00113c23          	sd	ra,24(sp)
    800077c0:	00913423          	sd	s1,8(sp)
    800077c4:	02010413          	addi	s0,sp,32
    800077c8:	142025f3          	csrr	a1,scause
    800077cc:	100027f3          	csrr	a5,sstatus
    800077d0:	0027f793          	andi	a5,a5,2
    800077d4:	10079c63          	bnez	a5,800078ec <kerneltrap+0x138>
    800077d8:	142027f3          	csrr	a5,scause
    800077dc:	0207ce63          	bltz	a5,80007818 <kerneltrap+0x64>
    800077e0:	00003517          	auipc	a0,0x3
    800077e4:	01050513          	addi	a0,a0,16 # 8000a7f0 <_ZZ9kPrintIntmE6digits+0x780>
    800077e8:	00001097          	auipc	ra,0x1
    800077ec:	880080e7          	jalr	-1920(ra) # 80008068 <__printf>
    800077f0:	141025f3          	csrr	a1,sepc
    800077f4:	14302673          	csrr	a2,stval
    800077f8:	00003517          	auipc	a0,0x3
    800077fc:	00850513          	addi	a0,a0,8 # 8000a800 <_ZZ9kPrintIntmE6digits+0x790>
    80007800:	00001097          	auipc	ra,0x1
    80007804:	868080e7          	jalr	-1944(ra) # 80008068 <__printf>
    80007808:	00003517          	auipc	a0,0x3
    8000780c:	01050513          	addi	a0,a0,16 # 8000a818 <_ZZ9kPrintIntmE6digits+0x7a8>
    80007810:	00000097          	auipc	ra,0x0
    80007814:	7fc080e7          	jalr	2044(ra) # 8000800c <panic>
    80007818:	0ff7f713          	andi	a4,a5,255
    8000781c:	00900693          	li	a3,9
    80007820:	04d70063          	beq	a4,a3,80007860 <kerneltrap+0xac>
    80007824:	fff00713          	li	a4,-1
    80007828:	03f71713          	slli	a4,a4,0x3f
    8000782c:	00170713          	addi	a4,a4,1
    80007830:	fae798e3          	bne	a5,a4,800077e0 <kerneltrap+0x2c>
    80007834:	00000097          	auipc	ra,0x0
    80007838:	e00080e7          	jalr	-512(ra) # 80007634 <cpuid>
    8000783c:	06050663          	beqz	a0,800078a8 <kerneltrap+0xf4>
    80007840:	144027f3          	csrr	a5,sip
    80007844:	ffd7f793          	andi	a5,a5,-3
    80007848:	14479073          	csrw	sip,a5
    8000784c:	01813083          	ld	ra,24(sp)
    80007850:	01013403          	ld	s0,16(sp)
    80007854:	00813483          	ld	s1,8(sp)
    80007858:	02010113          	addi	sp,sp,32
    8000785c:	00008067          	ret
    80007860:	00000097          	auipc	ra,0x0
    80007864:	3c4080e7          	jalr	964(ra) # 80007c24 <plic_claim>
    80007868:	00a00793          	li	a5,10
    8000786c:	00050493          	mv	s1,a0
    80007870:	06f50863          	beq	a0,a5,800078e0 <kerneltrap+0x12c>
    80007874:	fc050ce3          	beqz	a0,8000784c <kerneltrap+0x98>
    80007878:	00050593          	mv	a1,a0
    8000787c:	00003517          	auipc	a0,0x3
    80007880:	f5450513          	addi	a0,a0,-172 # 8000a7d0 <_ZZ9kPrintIntmE6digits+0x760>
    80007884:	00000097          	auipc	ra,0x0
    80007888:	7e4080e7          	jalr	2020(ra) # 80008068 <__printf>
    8000788c:	01013403          	ld	s0,16(sp)
    80007890:	01813083          	ld	ra,24(sp)
    80007894:	00048513          	mv	a0,s1
    80007898:	00813483          	ld	s1,8(sp)
    8000789c:	02010113          	addi	sp,sp,32
    800078a0:	00000317          	auipc	t1,0x0
    800078a4:	3bc30067          	jr	956(t1) # 80007c5c <plic_complete>
    800078a8:	00006517          	auipc	a0,0x6
    800078ac:	6b850513          	addi	a0,a0,1720 # 8000df60 <tickslock>
    800078b0:	00001097          	auipc	ra,0x1
    800078b4:	48c080e7          	jalr	1164(ra) # 80008d3c <acquire>
    800078b8:	00005717          	auipc	a4,0x5
    800078bc:	45c70713          	addi	a4,a4,1116 # 8000cd14 <ticks>
    800078c0:	00072783          	lw	a5,0(a4)
    800078c4:	00006517          	auipc	a0,0x6
    800078c8:	69c50513          	addi	a0,a0,1692 # 8000df60 <tickslock>
    800078cc:	0017879b          	addiw	a5,a5,1
    800078d0:	00f72023          	sw	a5,0(a4)
    800078d4:	00001097          	auipc	ra,0x1
    800078d8:	534080e7          	jalr	1332(ra) # 80008e08 <release>
    800078dc:	f65ff06f          	j	80007840 <kerneltrap+0x8c>
    800078e0:	00001097          	auipc	ra,0x1
    800078e4:	090080e7          	jalr	144(ra) # 80008970 <uartintr>
    800078e8:	fa5ff06f          	j	8000788c <kerneltrap+0xd8>
    800078ec:	00003517          	auipc	a0,0x3
    800078f0:	ec450513          	addi	a0,a0,-316 # 8000a7b0 <_ZZ9kPrintIntmE6digits+0x740>
    800078f4:	00000097          	auipc	ra,0x0
    800078f8:	718080e7          	jalr	1816(ra) # 8000800c <panic>

00000000800078fc <clockintr>:
    800078fc:	fe010113          	addi	sp,sp,-32
    80007900:	00813823          	sd	s0,16(sp)
    80007904:	00913423          	sd	s1,8(sp)
    80007908:	00113c23          	sd	ra,24(sp)
    8000790c:	02010413          	addi	s0,sp,32
    80007910:	00006497          	auipc	s1,0x6
    80007914:	65048493          	addi	s1,s1,1616 # 8000df60 <tickslock>
    80007918:	00048513          	mv	a0,s1
    8000791c:	00001097          	auipc	ra,0x1
    80007920:	420080e7          	jalr	1056(ra) # 80008d3c <acquire>
    80007924:	00005717          	auipc	a4,0x5
    80007928:	3f070713          	addi	a4,a4,1008 # 8000cd14 <ticks>
    8000792c:	00072783          	lw	a5,0(a4)
    80007930:	01013403          	ld	s0,16(sp)
    80007934:	01813083          	ld	ra,24(sp)
    80007938:	00048513          	mv	a0,s1
    8000793c:	0017879b          	addiw	a5,a5,1
    80007940:	00813483          	ld	s1,8(sp)
    80007944:	00f72023          	sw	a5,0(a4)
    80007948:	02010113          	addi	sp,sp,32
    8000794c:	00001317          	auipc	t1,0x1
    80007950:	4bc30067          	jr	1212(t1) # 80008e08 <release>

0000000080007954 <devintr>:
    80007954:	142027f3          	csrr	a5,scause
    80007958:	00000513          	li	a0,0
    8000795c:	0007c463          	bltz	a5,80007964 <devintr+0x10>
    80007960:	00008067          	ret
    80007964:	fe010113          	addi	sp,sp,-32
    80007968:	00813823          	sd	s0,16(sp)
    8000796c:	00113c23          	sd	ra,24(sp)
    80007970:	00913423          	sd	s1,8(sp)
    80007974:	02010413          	addi	s0,sp,32
    80007978:	0ff7f713          	andi	a4,a5,255
    8000797c:	00900693          	li	a3,9
    80007980:	04d70c63          	beq	a4,a3,800079d8 <devintr+0x84>
    80007984:	fff00713          	li	a4,-1
    80007988:	03f71713          	slli	a4,a4,0x3f
    8000798c:	00170713          	addi	a4,a4,1
    80007990:	00e78c63          	beq	a5,a4,800079a8 <devintr+0x54>
    80007994:	01813083          	ld	ra,24(sp)
    80007998:	01013403          	ld	s0,16(sp)
    8000799c:	00813483          	ld	s1,8(sp)
    800079a0:	02010113          	addi	sp,sp,32
    800079a4:	00008067          	ret
    800079a8:	00000097          	auipc	ra,0x0
    800079ac:	c8c080e7          	jalr	-884(ra) # 80007634 <cpuid>
    800079b0:	06050663          	beqz	a0,80007a1c <devintr+0xc8>
    800079b4:	144027f3          	csrr	a5,sip
    800079b8:	ffd7f793          	andi	a5,a5,-3
    800079bc:	14479073          	csrw	sip,a5
    800079c0:	01813083          	ld	ra,24(sp)
    800079c4:	01013403          	ld	s0,16(sp)
    800079c8:	00813483          	ld	s1,8(sp)
    800079cc:	00200513          	li	a0,2
    800079d0:	02010113          	addi	sp,sp,32
    800079d4:	00008067          	ret
    800079d8:	00000097          	auipc	ra,0x0
    800079dc:	24c080e7          	jalr	588(ra) # 80007c24 <plic_claim>
    800079e0:	00a00793          	li	a5,10
    800079e4:	00050493          	mv	s1,a0
    800079e8:	06f50663          	beq	a0,a5,80007a54 <devintr+0x100>
    800079ec:	00100513          	li	a0,1
    800079f0:	fa0482e3          	beqz	s1,80007994 <devintr+0x40>
    800079f4:	00048593          	mv	a1,s1
    800079f8:	00003517          	auipc	a0,0x3
    800079fc:	dd850513          	addi	a0,a0,-552 # 8000a7d0 <_ZZ9kPrintIntmE6digits+0x760>
    80007a00:	00000097          	auipc	ra,0x0
    80007a04:	668080e7          	jalr	1640(ra) # 80008068 <__printf>
    80007a08:	00048513          	mv	a0,s1
    80007a0c:	00000097          	auipc	ra,0x0
    80007a10:	250080e7          	jalr	592(ra) # 80007c5c <plic_complete>
    80007a14:	00100513          	li	a0,1
    80007a18:	f7dff06f          	j	80007994 <devintr+0x40>
    80007a1c:	00006517          	auipc	a0,0x6
    80007a20:	54450513          	addi	a0,a0,1348 # 8000df60 <tickslock>
    80007a24:	00001097          	auipc	ra,0x1
    80007a28:	318080e7          	jalr	792(ra) # 80008d3c <acquire>
    80007a2c:	00005717          	auipc	a4,0x5
    80007a30:	2e870713          	addi	a4,a4,744 # 8000cd14 <ticks>
    80007a34:	00072783          	lw	a5,0(a4)
    80007a38:	00006517          	auipc	a0,0x6
    80007a3c:	52850513          	addi	a0,a0,1320 # 8000df60 <tickslock>
    80007a40:	0017879b          	addiw	a5,a5,1
    80007a44:	00f72023          	sw	a5,0(a4)
    80007a48:	00001097          	auipc	ra,0x1
    80007a4c:	3c0080e7          	jalr	960(ra) # 80008e08 <release>
    80007a50:	f65ff06f          	j	800079b4 <devintr+0x60>
    80007a54:	00001097          	auipc	ra,0x1
    80007a58:	f1c080e7          	jalr	-228(ra) # 80008970 <uartintr>
    80007a5c:	fadff06f          	j	80007a08 <devintr+0xb4>

0000000080007a60 <kernelvec>:
    80007a60:	f0010113          	addi	sp,sp,-256
    80007a64:	00113023          	sd	ra,0(sp)
    80007a68:	00213423          	sd	sp,8(sp)
    80007a6c:	00313823          	sd	gp,16(sp)
    80007a70:	00413c23          	sd	tp,24(sp)
    80007a74:	02513023          	sd	t0,32(sp)
    80007a78:	02613423          	sd	t1,40(sp)
    80007a7c:	02713823          	sd	t2,48(sp)
    80007a80:	02813c23          	sd	s0,56(sp)
    80007a84:	04913023          	sd	s1,64(sp)
    80007a88:	04a13423          	sd	a0,72(sp)
    80007a8c:	04b13823          	sd	a1,80(sp)
    80007a90:	04c13c23          	sd	a2,88(sp)
    80007a94:	06d13023          	sd	a3,96(sp)
    80007a98:	06e13423          	sd	a4,104(sp)
    80007a9c:	06f13823          	sd	a5,112(sp)
    80007aa0:	07013c23          	sd	a6,120(sp)
    80007aa4:	09113023          	sd	a7,128(sp)
    80007aa8:	09213423          	sd	s2,136(sp)
    80007aac:	09313823          	sd	s3,144(sp)
    80007ab0:	09413c23          	sd	s4,152(sp)
    80007ab4:	0b513023          	sd	s5,160(sp)
    80007ab8:	0b613423          	sd	s6,168(sp)
    80007abc:	0b713823          	sd	s7,176(sp)
    80007ac0:	0b813c23          	sd	s8,184(sp)
    80007ac4:	0d913023          	sd	s9,192(sp)
    80007ac8:	0da13423          	sd	s10,200(sp)
    80007acc:	0db13823          	sd	s11,208(sp)
    80007ad0:	0dc13c23          	sd	t3,216(sp)
    80007ad4:	0fd13023          	sd	t4,224(sp)
    80007ad8:	0fe13423          	sd	t5,232(sp)
    80007adc:	0ff13823          	sd	t6,240(sp)
    80007ae0:	cd5ff0ef          	jal	ra,800077b4 <kerneltrap>
    80007ae4:	00013083          	ld	ra,0(sp)
    80007ae8:	00813103          	ld	sp,8(sp)
    80007aec:	01013183          	ld	gp,16(sp)
    80007af0:	02013283          	ld	t0,32(sp)
    80007af4:	02813303          	ld	t1,40(sp)
    80007af8:	03013383          	ld	t2,48(sp)
    80007afc:	03813403          	ld	s0,56(sp)
    80007b00:	04013483          	ld	s1,64(sp)
    80007b04:	04813503          	ld	a0,72(sp)
    80007b08:	05013583          	ld	a1,80(sp)
    80007b0c:	05813603          	ld	a2,88(sp)
    80007b10:	06013683          	ld	a3,96(sp)
    80007b14:	06813703          	ld	a4,104(sp)
    80007b18:	07013783          	ld	a5,112(sp)
    80007b1c:	07813803          	ld	a6,120(sp)
    80007b20:	08013883          	ld	a7,128(sp)
    80007b24:	08813903          	ld	s2,136(sp)
    80007b28:	09013983          	ld	s3,144(sp)
    80007b2c:	09813a03          	ld	s4,152(sp)
    80007b30:	0a013a83          	ld	s5,160(sp)
    80007b34:	0a813b03          	ld	s6,168(sp)
    80007b38:	0b013b83          	ld	s7,176(sp)
    80007b3c:	0b813c03          	ld	s8,184(sp)
    80007b40:	0c013c83          	ld	s9,192(sp)
    80007b44:	0c813d03          	ld	s10,200(sp)
    80007b48:	0d013d83          	ld	s11,208(sp)
    80007b4c:	0d813e03          	ld	t3,216(sp)
    80007b50:	0e013e83          	ld	t4,224(sp)
    80007b54:	0e813f03          	ld	t5,232(sp)
    80007b58:	0f013f83          	ld	t6,240(sp)
    80007b5c:	10010113          	addi	sp,sp,256
    80007b60:	10200073          	sret
    80007b64:	00000013          	nop
    80007b68:	00000013          	nop
    80007b6c:	00000013          	nop

0000000080007b70 <timervec>:
    80007b70:	34051573          	csrrw	a0,mscratch,a0
    80007b74:	00b53023          	sd	a1,0(a0)
    80007b78:	00c53423          	sd	a2,8(a0)
    80007b7c:	00d53823          	sd	a3,16(a0)
    80007b80:	01853583          	ld	a1,24(a0)
    80007b84:	02053603          	ld	a2,32(a0)
    80007b88:	0005b683          	ld	a3,0(a1)
    80007b8c:	00c686b3          	add	a3,a3,a2
    80007b90:	00d5b023          	sd	a3,0(a1)
    80007b94:	00200593          	li	a1,2
    80007b98:	14459073          	csrw	sip,a1
    80007b9c:	01053683          	ld	a3,16(a0)
    80007ba0:	00853603          	ld	a2,8(a0)
    80007ba4:	00053583          	ld	a1,0(a0)
    80007ba8:	34051573          	csrrw	a0,mscratch,a0
    80007bac:	30200073          	mret

0000000080007bb0 <plicinit>:
    80007bb0:	ff010113          	addi	sp,sp,-16
    80007bb4:	00813423          	sd	s0,8(sp)
    80007bb8:	01010413          	addi	s0,sp,16
    80007bbc:	00813403          	ld	s0,8(sp)
    80007bc0:	0c0007b7          	lui	a5,0xc000
    80007bc4:	00100713          	li	a4,1
    80007bc8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80007bcc:	00e7a223          	sw	a4,4(a5)
    80007bd0:	01010113          	addi	sp,sp,16
    80007bd4:	00008067          	ret

0000000080007bd8 <plicinithart>:
    80007bd8:	ff010113          	addi	sp,sp,-16
    80007bdc:	00813023          	sd	s0,0(sp)
    80007be0:	00113423          	sd	ra,8(sp)
    80007be4:	01010413          	addi	s0,sp,16
    80007be8:	00000097          	auipc	ra,0x0
    80007bec:	a4c080e7          	jalr	-1460(ra) # 80007634 <cpuid>
    80007bf0:	0085171b          	slliw	a4,a0,0x8
    80007bf4:	0c0027b7          	lui	a5,0xc002
    80007bf8:	00e787b3          	add	a5,a5,a4
    80007bfc:	40200713          	li	a4,1026
    80007c00:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007c04:	00813083          	ld	ra,8(sp)
    80007c08:	00013403          	ld	s0,0(sp)
    80007c0c:	00d5151b          	slliw	a0,a0,0xd
    80007c10:	0c2017b7          	lui	a5,0xc201
    80007c14:	00a78533          	add	a0,a5,a0
    80007c18:	00052023          	sw	zero,0(a0)
    80007c1c:	01010113          	addi	sp,sp,16
    80007c20:	00008067          	ret

0000000080007c24 <plic_claim>:
    80007c24:	ff010113          	addi	sp,sp,-16
    80007c28:	00813023          	sd	s0,0(sp)
    80007c2c:	00113423          	sd	ra,8(sp)
    80007c30:	01010413          	addi	s0,sp,16
    80007c34:	00000097          	auipc	ra,0x0
    80007c38:	a00080e7          	jalr	-1536(ra) # 80007634 <cpuid>
    80007c3c:	00813083          	ld	ra,8(sp)
    80007c40:	00013403          	ld	s0,0(sp)
    80007c44:	00d5151b          	slliw	a0,a0,0xd
    80007c48:	0c2017b7          	lui	a5,0xc201
    80007c4c:	00a78533          	add	a0,a5,a0
    80007c50:	00452503          	lw	a0,4(a0)
    80007c54:	01010113          	addi	sp,sp,16
    80007c58:	00008067          	ret

0000000080007c5c <plic_complete>:
    80007c5c:	fe010113          	addi	sp,sp,-32
    80007c60:	00813823          	sd	s0,16(sp)
    80007c64:	00913423          	sd	s1,8(sp)
    80007c68:	00113c23          	sd	ra,24(sp)
    80007c6c:	02010413          	addi	s0,sp,32
    80007c70:	00050493          	mv	s1,a0
    80007c74:	00000097          	auipc	ra,0x0
    80007c78:	9c0080e7          	jalr	-1600(ra) # 80007634 <cpuid>
    80007c7c:	01813083          	ld	ra,24(sp)
    80007c80:	01013403          	ld	s0,16(sp)
    80007c84:	00d5179b          	slliw	a5,a0,0xd
    80007c88:	0c201737          	lui	a4,0xc201
    80007c8c:	00f707b3          	add	a5,a4,a5
    80007c90:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007c94:	00813483          	ld	s1,8(sp)
    80007c98:	02010113          	addi	sp,sp,32
    80007c9c:	00008067          	ret

0000000080007ca0 <consolewrite>:
    80007ca0:	fb010113          	addi	sp,sp,-80
    80007ca4:	04813023          	sd	s0,64(sp)
    80007ca8:	04113423          	sd	ra,72(sp)
    80007cac:	02913c23          	sd	s1,56(sp)
    80007cb0:	03213823          	sd	s2,48(sp)
    80007cb4:	03313423          	sd	s3,40(sp)
    80007cb8:	03413023          	sd	s4,32(sp)
    80007cbc:	01513c23          	sd	s5,24(sp)
    80007cc0:	05010413          	addi	s0,sp,80
    80007cc4:	06c05c63          	blez	a2,80007d3c <consolewrite+0x9c>
    80007cc8:	00060993          	mv	s3,a2
    80007ccc:	00050a13          	mv	s4,a0
    80007cd0:	00058493          	mv	s1,a1
    80007cd4:	00000913          	li	s2,0
    80007cd8:	fff00a93          	li	s5,-1
    80007cdc:	01c0006f          	j	80007cf8 <consolewrite+0x58>
    80007ce0:	fbf44503          	lbu	a0,-65(s0)
    80007ce4:	0019091b          	addiw	s2,s2,1
    80007ce8:	00148493          	addi	s1,s1,1
    80007cec:	00001097          	auipc	ra,0x1
    80007cf0:	a9c080e7          	jalr	-1380(ra) # 80008788 <uartputc>
    80007cf4:	03298063          	beq	s3,s2,80007d14 <consolewrite+0x74>
    80007cf8:	00048613          	mv	a2,s1
    80007cfc:	00100693          	li	a3,1
    80007d00:	000a0593          	mv	a1,s4
    80007d04:	fbf40513          	addi	a0,s0,-65
    80007d08:	00000097          	auipc	ra,0x0
    80007d0c:	9e4080e7          	jalr	-1564(ra) # 800076ec <either_copyin>
    80007d10:	fd5518e3          	bne	a0,s5,80007ce0 <consolewrite+0x40>
    80007d14:	04813083          	ld	ra,72(sp)
    80007d18:	04013403          	ld	s0,64(sp)
    80007d1c:	03813483          	ld	s1,56(sp)
    80007d20:	02813983          	ld	s3,40(sp)
    80007d24:	02013a03          	ld	s4,32(sp)
    80007d28:	01813a83          	ld	s5,24(sp)
    80007d2c:	00090513          	mv	a0,s2
    80007d30:	03013903          	ld	s2,48(sp)
    80007d34:	05010113          	addi	sp,sp,80
    80007d38:	00008067          	ret
    80007d3c:	00000913          	li	s2,0
    80007d40:	fd5ff06f          	j	80007d14 <consolewrite+0x74>

0000000080007d44 <consoleread>:
    80007d44:	f9010113          	addi	sp,sp,-112
    80007d48:	06813023          	sd	s0,96(sp)
    80007d4c:	04913c23          	sd	s1,88(sp)
    80007d50:	05213823          	sd	s2,80(sp)
    80007d54:	05313423          	sd	s3,72(sp)
    80007d58:	05413023          	sd	s4,64(sp)
    80007d5c:	03513c23          	sd	s5,56(sp)
    80007d60:	03613823          	sd	s6,48(sp)
    80007d64:	03713423          	sd	s7,40(sp)
    80007d68:	03813023          	sd	s8,32(sp)
    80007d6c:	06113423          	sd	ra,104(sp)
    80007d70:	01913c23          	sd	s9,24(sp)
    80007d74:	07010413          	addi	s0,sp,112
    80007d78:	00060b93          	mv	s7,a2
    80007d7c:	00050913          	mv	s2,a0
    80007d80:	00058c13          	mv	s8,a1
    80007d84:	00060b1b          	sext.w	s6,a2
    80007d88:	00006497          	auipc	s1,0x6
    80007d8c:	20048493          	addi	s1,s1,512 # 8000df88 <cons>
    80007d90:	00400993          	li	s3,4
    80007d94:	fff00a13          	li	s4,-1
    80007d98:	00a00a93          	li	s5,10
    80007d9c:	05705e63          	blez	s7,80007df8 <consoleread+0xb4>
    80007da0:	09c4a703          	lw	a4,156(s1)
    80007da4:	0984a783          	lw	a5,152(s1)
    80007da8:	0007071b          	sext.w	a4,a4
    80007dac:	08e78463          	beq	a5,a4,80007e34 <consoleread+0xf0>
    80007db0:	07f7f713          	andi	a4,a5,127
    80007db4:	00e48733          	add	a4,s1,a4
    80007db8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80007dbc:	0017869b          	addiw	a3,a5,1
    80007dc0:	08d4ac23          	sw	a3,152(s1)
    80007dc4:	00070c9b          	sext.w	s9,a4
    80007dc8:	0b370663          	beq	a4,s3,80007e74 <consoleread+0x130>
    80007dcc:	00100693          	li	a3,1
    80007dd0:	f9f40613          	addi	a2,s0,-97
    80007dd4:	000c0593          	mv	a1,s8
    80007dd8:	00090513          	mv	a0,s2
    80007ddc:	f8e40fa3          	sb	a4,-97(s0)
    80007de0:	00000097          	auipc	ra,0x0
    80007de4:	8c0080e7          	jalr	-1856(ra) # 800076a0 <either_copyout>
    80007de8:	01450863          	beq	a0,s4,80007df8 <consoleread+0xb4>
    80007dec:	001c0c13          	addi	s8,s8,1
    80007df0:	fffb8b9b          	addiw	s7,s7,-1
    80007df4:	fb5c94e3          	bne	s9,s5,80007d9c <consoleread+0x58>
    80007df8:	000b851b          	sext.w	a0,s7
    80007dfc:	06813083          	ld	ra,104(sp)
    80007e00:	06013403          	ld	s0,96(sp)
    80007e04:	05813483          	ld	s1,88(sp)
    80007e08:	05013903          	ld	s2,80(sp)
    80007e0c:	04813983          	ld	s3,72(sp)
    80007e10:	04013a03          	ld	s4,64(sp)
    80007e14:	03813a83          	ld	s5,56(sp)
    80007e18:	02813b83          	ld	s7,40(sp)
    80007e1c:	02013c03          	ld	s8,32(sp)
    80007e20:	01813c83          	ld	s9,24(sp)
    80007e24:	40ab053b          	subw	a0,s6,a0
    80007e28:	03013b03          	ld	s6,48(sp)
    80007e2c:	07010113          	addi	sp,sp,112
    80007e30:	00008067          	ret
    80007e34:	00001097          	auipc	ra,0x1
    80007e38:	1d8080e7          	jalr	472(ra) # 8000900c <push_on>
    80007e3c:	0984a703          	lw	a4,152(s1)
    80007e40:	09c4a783          	lw	a5,156(s1)
    80007e44:	0007879b          	sext.w	a5,a5
    80007e48:	fef70ce3          	beq	a4,a5,80007e40 <consoleread+0xfc>
    80007e4c:	00001097          	auipc	ra,0x1
    80007e50:	234080e7          	jalr	564(ra) # 80009080 <pop_on>
    80007e54:	0984a783          	lw	a5,152(s1)
    80007e58:	07f7f713          	andi	a4,a5,127
    80007e5c:	00e48733          	add	a4,s1,a4
    80007e60:	01874703          	lbu	a4,24(a4)
    80007e64:	0017869b          	addiw	a3,a5,1
    80007e68:	08d4ac23          	sw	a3,152(s1)
    80007e6c:	00070c9b          	sext.w	s9,a4
    80007e70:	f5371ee3          	bne	a4,s3,80007dcc <consoleread+0x88>
    80007e74:	000b851b          	sext.w	a0,s7
    80007e78:	f96bf2e3          	bgeu	s7,s6,80007dfc <consoleread+0xb8>
    80007e7c:	08f4ac23          	sw	a5,152(s1)
    80007e80:	f7dff06f          	j	80007dfc <consoleread+0xb8>

0000000080007e84 <consputc>:
    80007e84:	10000793          	li	a5,256
    80007e88:	00f50663          	beq	a0,a5,80007e94 <consputc+0x10>
    80007e8c:	00001317          	auipc	t1,0x1
    80007e90:	9f430067          	jr	-1548(t1) # 80008880 <uartputc_sync>
    80007e94:	ff010113          	addi	sp,sp,-16
    80007e98:	00113423          	sd	ra,8(sp)
    80007e9c:	00813023          	sd	s0,0(sp)
    80007ea0:	01010413          	addi	s0,sp,16
    80007ea4:	00800513          	li	a0,8
    80007ea8:	00001097          	auipc	ra,0x1
    80007eac:	9d8080e7          	jalr	-1576(ra) # 80008880 <uartputc_sync>
    80007eb0:	02000513          	li	a0,32
    80007eb4:	00001097          	auipc	ra,0x1
    80007eb8:	9cc080e7          	jalr	-1588(ra) # 80008880 <uartputc_sync>
    80007ebc:	00013403          	ld	s0,0(sp)
    80007ec0:	00813083          	ld	ra,8(sp)
    80007ec4:	00800513          	li	a0,8
    80007ec8:	01010113          	addi	sp,sp,16
    80007ecc:	00001317          	auipc	t1,0x1
    80007ed0:	9b430067          	jr	-1612(t1) # 80008880 <uartputc_sync>

0000000080007ed4 <consoleintr>:
    80007ed4:	fe010113          	addi	sp,sp,-32
    80007ed8:	00813823          	sd	s0,16(sp)
    80007edc:	00913423          	sd	s1,8(sp)
    80007ee0:	01213023          	sd	s2,0(sp)
    80007ee4:	00113c23          	sd	ra,24(sp)
    80007ee8:	02010413          	addi	s0,sp,32
    80007eec:	00006917          	auipc	s2,0x6
    80007ef0:	09c90913          	addi	s2,s2,156 # 8000df88 <cons>
    80007ef4:	00050493          	mv	s1,a0
    80007ef8:	00090513          	mv	a0,s2
    80007efc:	00001097          	auipc	ra,0x1
    80007f00:	e40080e7          	jalr	-448(ra) # 80008d3c <acquire>
    80007f04:	02048c63          	beqz	s1,80007f3c <consoleintr+0x68>
    80007f08:	0a092783          	lw	a5,160(s2)
    80007f0c:	09892703          	lw	a4,152(s2)
    80007f10:	07f00693          	li	a3,127
    80007f14:	40e7873b          	subw	a4,a5,a4
    80007f18:	02e6e263          	bltu	a3,a4,80007f3c <consoleintr+0x68>
    80007f1c:	00d00713          	li	a4,13
    80007f20:	04e48063          	beq	s1,a4,80007f60 <consoleintr+0x8c>
    80007f24:	07f7f713          	andi	a4,a5,127
    80007f28:	00e90733          	add	a4,s2,a4
    80007f2c:	0017879b          	addiw	a5,a5,1
    80007f30:	0af92023          	sw	a5,160(s2)
    80007f34:	00970c23          	sb	s1,24(a4)
    80007f38:	08f92e23          	sw	a5,156(s2)
    80007f3c:	01013403          	ld	s0,16(sp)
    80007f40:	01813083          	ld	ra,24(sp)
    80007f44:	00813483          	ld	s1,8(sp)
    80007f48:	00013903          	ld	s2,0(sp)
    80007f4c:	00006517          	auipc	a0,0x6
    80007f50:	03c50513          	addi	a0,a0,60 # 8000df88 <cons>
    80007f54:	02010113          	addi	sp,sp,32
    80007f58:	00001317          	auipc	t1,0x1
    80007f5c:	eb030067          	jr	-336(t1) # 80008e08 <release>
    80007f60:	00a00493          	li	s1,10
    80007f64:	fc1ff06f          	j	80007f24 <consoleintr+0x50>

0000000080007f68 <consoleinit>:
    80007f68:	fe010113          	addi	sp,sp,-32
    80007f6c:	00113c23          	sd	ra,24(sp)
    80007f70:	00813823          	sd	s0,16(sp)
    80007f74:	00913423          	sd	s1,8(sp)
    80007f78:	02010413          	addi	s0,sp,32
    80007f7c:	00006497          	auipc	s1,0x6
    80007f80:	00c48493          	addi	s1,s1,12 # 8000df88 <cons>
    80007f84:	00048513          	mv	a0,s1
    80007f88:	00003597          	auipc	a1,0x3
    80007f8c:	8a058593          	addi	a1,a1,-1888 # 8000a828 <_ZZ9kPrintIntmE6digits+0x7b8>
    80007f90:	00001097          	auipc	ra,0x1
    80007f94:	d88080e7          	jalr	-632(ra) # 80008d18 <initlock>
    80007f98:	00000097          	auipc	ra,0x0
    80007f9c:	7ac080e7          	jalr	1964(ra) # 80008744 <uartinit>
    80007fa0:	01813083          	ld	ra,24(sp)
    80007fa4:	01013403          	ld	s0,16(sp)
    80007fa8:	00000797          	auipc	a5,0x0
    80007fac:	d9c78793          	addi	a5,a5,-612 # 80007d44 <consoleread>
    80007fb0:	0af4bc23          	sd	a5,184(s1)
    80007fb4:	00000797          	auipc	a5,0x0
    80007fb8:	cec78793          	addi	a5,a5,-788 # 80007ca0 <consolewrite>
    80007fbc:	0cf4b023          	sd	a5,192(s1)
    80007fc0:	00813483          	ld	s1,8(sp)
    80007fc4:	02010113          	addi	sp,sp,32
    80007fc8:	00008067          	ret

0000000080007fcc <console_read>:
    80007fcc:	ff010113          	addi	sp,sp,-16
    80007fd0:	00813423          	sd	s0,8(sp)
    80007fd4:	01010413          	addi	s0,sp,16
    80007fd8:	00813403          	ld	s0,8(sp)
    80007fdc:	00006317          	auipc	t1,0x6
    80007fe0:	06433303          	ld	t1,100(t1) # 8000e040 <devsw+0x10>
    80007fe4:	01010113          	addi	sp,sp,16
    80007fe8:	00030067          	jr	t1

0000000080007fec <console_write>:
    80007fec:	ff010113          	addi	sp,sp,-16
    80007ff0:	00813423          	sd	s0,8(sp)
    80007ff4:	01010413          	addi	s0,sp,16
    80007ff8:	00813403          	ld	s0,8(sp)
    80007ffc:	00006317          	auipc	t1,0x6
    80008000:	04c33303          	ld	t1,76(t1) # 8000e048 <devsw+0x18>
    80008004:	01010113          	addi	sp,sp,16
    80008008:	00030067          	jr	t1

000000008000800c <panic>:
    8000800c:	fe010113          	addi	sp,sp,-32
    80008010:	00113c23          	sd	ra,24(sp)
    80008014:	00813823          	sd	s0,16(sp)
    80008018:	00913423          	sd	s1,8(sp)
    8000801c:	02010413          	addi	s0,sp,32
    80008020:	00050493          	mv	s1,a0
    80008024:	00003517          	auipc	a0,0x3
    80008028:	80c50513          	addi	a0,a0,-2036 # 8000a830 <_ZZ9kPrintIntmE6digits+0x7c0>
    8000802c:	00006797          	auipc	a5,0x6
    80008030:	0a07ae23          	sw	zero,188(a5) # 8000e0e8 <pr+0x18>
    80008034:	00000097          	auipc	ra,0x0
    80008038:	034080e7          	jalr	52(ra) # 80008068 <__printf>
    8000803c:	00048513          	mv	a0,s1
    80008040:	00000097          	auipc	ra,0x0
    80008044:	028080e7          	jalr	40(ra) # 80008068 <__printf>
    80008048:	00002517          	auipc	a0,0x2
    8000804c:	57050513          	addi	a0,a0,1392 # 8000a5b8 <_ZZ9kPrintIntmE6digits+0x548>
    80008050:	00000097          	auipc	ra,0x0
    80008054:	018080e7          	jalr	24(ra) # 80008068 <__printf>
    80008058:	00100793          	li	a5,1
    8000805c:	00005717          	auipc	a4,0x5
    80008060:	caf72e23          	sw	a5,-836(a4) # 8000cd18 <panicked>
    80008064:	0000006f          	j	80008064 <panic+0x58>

0000000080008068 <__printf>:
    80008068:	f3010113          	addi	sp,sp,-208
    8000806c:	08813023          	sd	s0,128(sp)
    80008070:	07313423          	sd	s3,104(sp)
    80008074:	09010413          	addi	s0,sp,144
    80008078:	05813023          	sd	s8,64(sp)
    8000807c:	08113423          	sd	ra,136(sp)
    80008080:	06913c23          	sd	s1,120(sp)
    80008084:	07213823          	sd	s2,112(sp)
    80008088:	07413023          	sd	s4,96(sp)
    8000808c:	05513c23          	sd	s5,88(sp)
    80008090:	05613823          	sd	s6,80(sp)
    80008094:	05713423          	sd	s7,72(sp)
    80008098:	03913c23          	sd	s9,56(sp)
    8000809c:	03a13823          	sd	s10,48(sp)
    800080a0:	03b13423          	sd	s11,40(sp)
    800080a4:	00006317          	auipc	t1,0x6
    800080a8:	02c30313          	addi	t1,t1,44 # 8000e0d0 <pr>
    800080ac:	01832c03          	lw	s8,24(t1)
    800080b0:	00b43423          	sd	a1,8(s0)
    800080b4:	00c43823          	sd	a2,16(s0)
    800080b8:	00d43c23          	sd	a3,24(s0)
    800080bc:	02e43023          	sd	a4,32(s0)
    800080c0:	02f43423          	sd	a5,40(s0)
    800080c4:	03043823          	sd	a6,48(s0)
    800080c8:	03143c23          	sd	a7,56(s0)
    800080cc:	00050993          	mv	s3,a0
    800080d0:	4a0c1663          	bnez	s8,8000857c <__printf+0x514>
    800080d4:	60098c63          	beqz	s3,800086ec <__printf+0x684>
    800080d8:	0009c503          	lbu	a0,0(s3)
    800080dc:	00840793          	addi	a5,s0,8
    800080e0:	f6f43c23          	sd	a5,-136(s0)
    800080e4:	00000493          	li	s1,0
    800080e8:	22050063          	beqz	a0,80008308 <__printf+0x2a0>
    800080ec:	00002a37          	lui	s4,0x2
    800080f0:	00018ab7          	lui	s5,0x18
    800080f4:	000f4b37          	lui	s6,0xf4
    800080f8:	00989bb7          	lui	s7,0x989
    800080fc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80008100:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80008104:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80008108:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000810c:	00148c9b          	addiw	s9,s1,1
    80008110:	02500793          	li	a5,37
    80008114:	01998933          	add	s2,s3,s9
    80008118:	38f51263          	bne	a0,a5,8000849c <__printf+0x434>
    8000811c:	00094783          	lbu	a5,0(s2)
    80008120:	00078c9b          	sext.w	s9,a5
    80008124:	1e078263          	beqz	a5,80008308 <__printf+0x2a0>
    80008128:	0024849b          	addiw	s1,s1,2
    8000812c:	07000713          	li	a4,112
    80008130:	00998933          	add	s2,s3,s1
    80008134:	38e78a63          	beq	a5,a4,800084c8 <__printf+0x460>
    80008138:	20f76863          	bltu	a4,a5,80008348 <__printf+0x2e0>
    8000813c:	42a78863          	beq	a5,a0,8000856c <__printf+0x504>
    80008140:	06400713          	li	a4,100
    80008144:	40e79663          	bne	a5,a4,80008550 <__printf+0x4e8>
    80008148:	f7843783          	ld	a5,-136(s0)
    8000814c:	0007a603          	lw	a2,0(a5)
    80008150:	00878793          	addi	a5,a5,8
    80008154:	f6f43c23          	sd	a5,-136(s0)
    80008158:	42064a63          	bltz	a2,8000858c <__printf+0x524>
    8000815c:	00a00713          	li	a4,10
    80008160:	02e677bb          	remuw	a5,a2,a4
    80008164:	00002d97          	auipc	s11,0x2
    80008168:	6f4d8d93          	addi	s11,s11,1780 # 8000a858 <digits>
    8000816c:	00900593          	li	a1,9
    80008170:	0006051b          	sext.w	a0,a2
    80008174:	00000c93          	li	s9,0
    80008178:	02079793          	slli	a5,a5,0x20
    8000817c:	0207d793          	srli	a5,a5,0x20
    80008180:	00fd87b3          	add	a5,s11,a5
    80008184:	0007c783          	lbu	a5,0(a5)
    80008188:	02e656bb          	divuw	a3,a2,a4
    8000818c:	f8f40023          	sb	a5,-128(s0)
    80008190:	14c5d863          	bge	a1,a2,800082e0 <__printf+0x278>
    80008194:	06300593          	li	a1,99
    80008198:	00100c93          	li	s9,1
    8000819c:	02e6f7bb          	remuw	a5,a3,a4
    800081a0:	02079793          	slli	a5,a5,0x20
    800081a4:	0207d793          	srli	a5,a5,0x20
    800081a8:	00fd87b3          	add	a5,s11,a5
    800081ac:	0007c783          	lbu	a5,0(a5)
    800081b0:	02e6d73b          	divuw	a4,a3,a4
    800081b4:	f8f400a3          	sb	a5,-127(s0)
    800081b8:	12a5f463          	bgeu	a1,a0,800082e0 <__printf+0x278>
    800081bc:	00a00693          	li	a3,10
    800081c0:	00900593          	li	a1,9
    800081c4:	02d777bb          	remuw	a5,a4,a3
    800081c8:	02079793          	slli	a5,a5,0x20
    800081cc:	0207d793          	srli	a5,a5,0x20
    800081d0:	00fd87b3          	add	a5,s11,a5
    800081d4:	0007c503          	lbu	a0,0(a5)
    800081d8:	02d757bb          	divuw	a5,a4,a3
    800081dc:	f8a40123          	sb	a0,-126(s0)
    800081e0:	48e5f263          	bgeu	a1,a4,80008664 <__printf+0x5fc>
    800081e4:	06300513          	li	a0,99
    800081e8:	02d7f5bb          	remuw	a1,a5,a3
    800081ec:	02059593          	slli	a1,a1,0x20
    800081f0:	0205d593          	srli	a1,a1,0x20
    800081f4:	00bd85b3          	add	a1,s11,a1
    800081f8:	0005c583          	lbu	a1,0(a1)
    800081fc:	02d7d7bb          	divuw	a5,a5,a3
    80008200:	f8b401a3          	sb	a1,-125(s0)
    80008204:	48e57263          	bgeu	a0,a4,80008688 <__printf+0x620>
    80008208:	3e700513          	li	a0,999
    8000820c:	02d7f5bb          	remuw	a1,a5,a3
    80008210:	02059593          	slli	a1,a1,0x20
    80008214:	0205d593          	srli	a1,a1,0x20
    80008218:	00bd85b3          	add	a1,s11,a1
    8000821c:	0005c583          	lbu	a1,0(a1)
    80008220:	02d7d7bb          	divuw	a5,a5,a3
    80008224:	f8b40223          	sb	a1,-124(s0)
    80008228:	46e57663          	bgeu	a0,a4,80008694 <__printf+0x62c>
    8000822c:	02d7f5bb          	remuw	a1,a5,a3
    80008230:	02059593          	slli	a1,a1,0x20
    80008234:	0205d593          	srli	a1,a1,0x20
    80008238:	00bd85b3          	add	a1,s11,a1
    8000823c:	0005c583          	lbu	a1,0(a1)
    80008240:	02d7d7bb          	divuw	a5,a5,a3
    80008244:	f8b402a3          	sb	a1,-123(s0)
    80008248:	46ea7863          	bgeu	s4,a4,800086b8 <__printf+0x650>
    8000824c:	02d7f5bb          	remuw	a1,a5,a3
    80008250:	02059593          	slli	a1,a1,0x20
    80008254:	0205d593          	srli	a1,a1,0x20
    80008258:	00bd85b3          	add	a1,s11,a1
    8000825c:	0005c583          	lbu	a1,0(a1)
    80008260:	02d7d7bb          	divuw	a5,a5,a3
    80008264:	f8b40323          	sb	a1,-122(s0)
    80008268:	3eeaf863          	bgeu	s5,a4,80008658 <__printf+0x5f0>
    8000826c:	02d7f5bb          	remuw	a1,a5,a3
    80008270:	02059593          	slli	a1,a1,0x20
    80008274:	0205d593          	srli	a1,a1,0x20
    80008278:	00bd85b3          	add	a1,s11,a1
    8000827c:	0005c583          	lbu	a1,0(a1)
    80008280:	02d7d7bb          	divuw	a5,a5,a3
    80008284:	f8b403a3          	sb	a1,-121(s0)
    80008288:	42eb7e63          	bgeu	s6,a4,800086c4 <__printf+0x65c>
    8000828c:	02d7f5bb          	remuw	a1,a5,a3
    80008290:	02059593          	slli	a1,a1,0x20
    80008294:	0205d593          	srli	a1,a1,0x20
    80008298:	00bd85b3          	add	a1,s11,a1
    8000829c:	0005c583          	lbu	a1,0(a1)
    800082a0:	02d7d7bb          	divuw	a5,a5,a3
    800082a4:	f8b40423          	sb	a1,-120(s0)
    800082a8:	42ebfc63          	bgeu	s7,a4,800086e0 <__printf+0x678>
    800082ac:	02079793          	slli	a5,a5,0x20
    800082b0:	0207d793          	srli	a5,a5,0x20
    800082b4:	00fd8db3          	add	s11,s11,a5
    800082b8:	000dc703          	lbu	a4,0(s11)
    800082bc:	00a00793          	li	a5,10
    800082c0:	00900c93          	li	s9,9
    800082c4:	f8e404a3          	sb	a4,-119(s0)
    800082c8:	00065c63          	bgez	a2,800082e0 <__printf+0x278>
    800082cc:	f9040713          	addi	a4,s0,-112
    800082d0:	00f70733          	add	a4,a4,a5
    800082d4:	02d00693          	li	a3,45
    800082d8:	fed70823          	sb	a3,-16(a4)
    800082dc:	00078c93          	mv	s9,a5
    800082e0:	f8040793          	addi	a5,s0,-128
    800082e4:	01978cb3          	add	s9,a5,s9
    800082e8:	f7f40d13          	addi	s10,s0,-129
    800082ec:	000cc503          	lbu	a0,0(s9)
    800082f0:	fffc8c93          	addi	s9,s9,-1
    800082f4:	00000097          	auipc	ra,0x0
    800082f8:	b90080e7          	jalr	-1136(ra) # 80007e84 <consputc>
    800082fc:	ffac98e3          	bne	s9,s10,800082ec <__printf+0x284>
    80008300:	00094503          	lbu	a0,0(s2)
    80008304:	e00514e3          	bnez	a0,8000810c <__printf+0xa4>
    80008308:	1a0c1663          	bnez	s8,800084b4 <__printf+0x44c>
    8000830c:	08813083          	ld	ra,136(sp)
    80008310:	08013403          	ld	s0,128(sp)
    80008314:	07813483          	ld	s1,120(sp)
    80008318:	07013903          	ld	s2,112(sp)
    8000831c:	06813983          	ld	s3,104(sp)
    80008320:	06013a03          	ld	s4,96(sp)
    80008324:	05813a83          	ld	s5,88(sp)
    80008328:	05013b03          	ld	s6,80(sp)
    8000832c:	04813b83          	ld	s7,72(sp)
    80008330:	04013c03          	ld	s8,64(sp)
    80008334:	03813c83          	ld	s9,56(sp)
    80008338:	03013d03          	ld	s10,48(sp)
    8000833c:	02813d83          	ld	s11,40(sp)
    80008340:	0d010113          	addi	sp,sp,208
    80008344:	00008067          	ret
    80008348:	07300713          	li	a4,115
    8000834c:	1ce78a63          	beq	a5,a4,80008520 <__printf+0x4b8>
    80008350:	07800713          	li	a4,120
    80008354:	1ee79e63          	bne	a5,a4,80008550 <__printf+0x4e8>
    80008358:	f7843783          	ld	a5,-136(s0)
    8000835c:	0007a703          	lw	a4,0(a5)
    80008360:	00878793          	addi	a5,a5,8
    80008364:	f6f43c23          	sd	a5,-136(s0)
    80008368:	28074263          	bltz	a4,800085ec <__printf+0x584>
    8000836c:	00002d97          	auipc	s11,0x2
    80008370:	4ecd8d93          	addi	s11,s11,1260 # 8000a858 <digits>
    80008374:	00f77793          	andi	a5,a4,15
    80008378:	00fd87b3          	add	a5,s11,a5
    8000837c:	0007c683          	lbu	a3,0(a5)
    80008380:	00f00613          	li	a2,15
    80008384:	0007079b          	sext.w	a5,a4
    80008388:	f8d40023          	sb	a3,-128(s0)
    8000838c:	0047559b          	srliw	a1,a4,0x4
    80008390:	0047569b          	srliw	a3,a4,0x4
    80008394:	00000c93          	li	s9,0
    80008398:	0ee65063          	bge	a2,a4,80008478 <__printf+0x410>
    8000839c:	00f6f693          	andi	a3,a3,15
    800083a0:	00dd86b3          	add	a3,s11,a3
    800083a4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800083a8:	0087d79b          	srliw	a5,a5,0x8
    800083ac:	00100c93          	li	s9,1
    800083b0:	f8d400a3          	sb	a3,-127(s0)
    800083b4:	0cb67263          	bgeu	a2,a1,80008478 <__printf+0x410>
    800083b8:	00f7f693          	andi	a3,a5,15
    800083bc:	00dd86b3          	add	a3,s11,a3
    800083c0:	0006c583          	lbu	a1,0(a3)
    800083c4:	00f00613          	li	a2,15
    800083c8:	0047d69b          	srliw	a3,a5,0x4
    800083cc:	f8b40123          	sb	a1,-126(s0)
    800083d0:	0047d593          	srli	a1,a5,0x4
    800083d4:	28f67e63          	bgeu	a2,a5,80008670 <__printf+0x608>
    800083d8:	00f6f693          	andi	a3,a3,15
    800083dc:	00dd86b3          	add	a3,s11,a3
    800083e0:	0006c503          	lbu	a0,0(a3)
    800083e4:	0087d813          	srli	a6,a5,0x8
    800083e8:	0087d69b          	srliw	a3,a5,0x8
    800083ec:	f8a401a3          	sb	a0,-125(s0)
    800083f0:	28b67663          	bgeu	a2,a1,8000867c <__printf+0x614>
    800083f4:	00f6f693          	andi	a3,a3,15
    800083f8:	00dd86b3          	add	a3,s11,a3
    800083fc:	0006c583          	lbu	a1,0(a3)
    80008400:	00c7d513          	srli	a0,a5,0xc
    80008404:	00c7d69b          	srliw	a3,a5,0xc
    80008408:	f8b40223          	sb	a1,-124(s0)
    8000840c:	29067a63          	bgeu	a2,a6,800086a0 <__printf+0x638>
    80008410:	00f6f693          	andi	a3,a3,15
    80008414:	00dd86b3          	add	a3,s11,a3
    80008418:	0006c583          	lbu	a1,0(a3)
    8000841c:	0107d813          	srli	a6,a5,0x10
    80008420:	0107d69b          	srliw	a3,a5,0x10
    80008424:	f8b402a3          	sb	a1,-123(s0)
    80008428:	28a67263          	bgeu	a2,a0,800086ac <__printf+0x644>
    8000842c:	00f6f693          	andi	a3,a3,15
    80008430:	00dd86b3          	add	a3,s11,a3
    80008434:	0006c683          	lbu	a3,0(a3)
    80008438:	0147d79b          	srliw	a5,a5,0x14
    8000843c:	f8d40323          	sb	a3,-122(s0)
    80008440:	21067663          	bgeu	a2,a6,8000864c <__printf+0x5e4>
    80008444:	02079793          	slli	a5,a5,0x20
    80008448:	0207d793          	srli	a5,a5,0x20
    8000844c:	00fd8db3          	add	s11,s11,a5
    80008450:	000dc683          	lbu	a3,0(s11)
    80008454:	00800793          	li	a5,8
    80008458:	00700c93          	li	s9,7
    8000845c:	f8d403a3          	sb	a3,-121(s0)
    80008460:	00075c63          	bgez	a4,80008478 <__printf+0x410>
    80008464:	f9040713          	addi	a4,s0,-112
    80008468:	00f70733          	add	a4,a4,a5
    8000846c:	02d00693          	li	a3,45
    80008470:	fed70823          	sb	a3,-16(a4)
    80008474:	00078c93          	mv	s9,a5
    80008478:	f8040793          	addi	a5,s0,-128
    8000847c:	01978cb3          	add	s9,a5,s9
    80008480:	f7f40d13          	addi	s10,s0,-129
    80008484:	000cc503          	lbu	a0,0(s9)
    80008488:	fffc8c93          	addi	s9,s9,-1
    8000848c:	00000097          	auipc	ra,0x0
    80008490:	9f8080e7          	jalr	-1544(ra) # 80007e84 <consputc>
    80008494:	ff9d18e3          	bne	s10,s9,80008484 <__printf+0x41c>
    80008498:	0100006f          	j	800084a8 <__printf+0x440>
    8000849c:	00000097          	auipc	ra,0x0
    800084a0:	9e8080e7          	jalr	-1560(ra) # 80007e84 <consputc>
    800084a4:	000c8493          	mv	s1,s9
    800084a8:	00094503          	lbu	a0,0(s2)
    800084ac:	c60510e3          	bnez	a0,8000810c <__printf+0xa4>
    800084b0:	e40c0ee3          	beqz	s8,8000830c <__printf+0x2a4>
    800084b4:	00006517          	auipc	a0,0x6
    800084b8:	c1c50513          	addi	a0,a0,-996 # 8000e0d0 <pr>
    800084bc:	00001097          	auipc	ra,0x1
    800084c0:	94c080e7          	jalr	-1716(ra) # 80008e08 <release>
    800084c4:	e49ff06f          	j	8000830c <__printf+0x2a4>
    800084c8:	f7843783          	ld	a5,-136(s0)
    800084cc:	03000513          	li	a0,48
    800084d0:	01000d13          	li	s10,16
    800084d4:	00878713          	addi	a4,a5,8
    800084d8:	0007bc83          	ld	s9,0(a5)
    800084dc:	f6e43c23          	sd	a4,-136(s0)
    800084e0:	00000097          	auipc	ra,0x0
    800084e4:	9a4080e7          	jalr	-1628(ra) # 80007e84 <consputc>
    800084e8:	07800513          	li	a0,120
    800084ec:	00000097          	auipc	ra,0x0
    800084f0:	998080e7          	jalr	-1640(ra) # 80007e84 <consputc>
    800084f4:	00002d97          	auipc	s11,0x2
    800084f8:	364d8d93          	addi	s11,s11,868 # 8000a858 <digits>
    800084fc:	03ccd793          	srli	a5,s9,0x3c
    80008500:	00fd87b3          	add	a5,s11,a5
    80008504:	0007c503          	lbu	a0,0(a5)
    80008508:	fffd0d1b          	addiw	s10,s10,-1
    8000850c:	004c9c93          	slli	s9,s9,0x4
    80008510:	00000097          	auipc	ra,0x0
    80008514:	974080e7          	jalr	-1676(ra) # 80007e84 <consputc>
    80008518:	fe0d12e3          	bnez	s10,800084fc <__printf+0x494>
    8000851c:	f8dff06f          	j	800084a8 <__printf+0x440>
    80008520:	f7843783          	ld	a5,-136(s0)
    80008524:	0007bc83          	ld	s9,0(a5)
    80008528:	00878793          	addi	a5,a5,8
    8000852c:	f6f43c23          	sd	a5,-136(s0)
    80008530:	000c9a63          	bnez	s9,80008544 <__printf+0x4dc>
    80008534:	1080006f          	j	8000863c <__printf+0x5d4>
    80008538:	001c8c93          	addi	s9,s9,1
    8000853c:	00000097          	auipc	ra,0x0
    80008540:	948080e7          	jalr	-1720(ra) # 80007e84 <consputc>
    80008544:	000cc503          	lbu	a0,0(s9)
    80008548:	fe0518e3          	bnez	a0,80008538 <__printf+0x4d0>
    8000854c:	f5dff06f          	j	800084a8 <__printf+0x440>
    80008550:	02500513          	li	a0,37
    80008554:	00000097          	auipc	ra,0x0
    80008558:	930080e7          	jalr	-1744(ra) # 80007e84 <consputc>
    8000855c:	000c8513          	mv	a0,s9
    80008560:	00000097          	auipc	ra,0x0
    80008564:	924080e7          	jalr	-1756(ra) # 80007e84 <consputc>
    80008568:	f41ff06f          	j	800084a8 <__printf+0x440>
    8000856c:	02500513          	li	a0,37
    80008570:	00000097          	auipc	ra,0x0
    80008574:	914080e7          	jalr	-1772(ra) # 80007e84 <consputc>
    80008578:	f31ff06f          	j	800084a8 <__printf+0x440>
    8000857c:	00030513          	mv	a0,t1
    80008580:	00000097          	auipc	ra,0x0
    80008584:	7bc080e7          	jalr	1980(ra) # 80008d3c <acquire>
    80008588:	b4dff06f          	j	800080d4 <__printf+0x6c>
    8000858c:	40c0053b          	negw	a0,a2
    80008590:	00a00713          	li	a4,10
    80008594:	02e576bb          	remuw	a3,a0,a4
    80008598:	00002d97          	auipc	s11,0x2
    8000859c:	2c0d8d93          	addi	s11,s11,704 # 8000a858 <digits>
    800085a0:	ff700593          	li	a1,-9
    800085a4:	02069693          	slli	a3,a3,0x20
    800085a8:	0206d693          	srli	a3,a3,0x20
    800085ac:	00dd86b3          	add	a3,s11,a3
    800085b0:	0006c683          	lbu	a3,0(a3)
    800085b4:	02e557bb          	divuw	a5,a0,a4
    800085b8:	f8d40023          	sb	a3,-128(s0)
    800085bc:	10b65e63          	bge	a2,a1,800086d8 <__printf+0x670>
    800085c0:	06300593          	li	a1,99
    800085c4:	02e7f6bb          	remuw	a3,a5,a4
    800085c8:	02069693          	slli	a3,a3,0x20
    800085cc:	0206d693          	srli	a3,a3,0x20
    800085d0:	00dd86b3          	add	a3,s11,a3
    800085d4:	0006c683          	lbu	a3,0(a3)
    800085d8:	02e7d73b          	divuw	a4,a5,a4
    800085dc:	00200793          	li	a5,2
    800085e0:	f8d400a3          	sb	a3,-127(s0)
    800085e4:	bca5ece3          	bltu	a1,a0,800081bc <__printf+0x154>
    800085e8:	ce5ff06f          	j	800082cc <__printf+0x264>
    800085ec:	40e007bb          	negw	a5,a4
    800085f0:	00002d97          	auipc	s11,0x2
    800085f4:	268d8d93          	addi	s11,s11,616 # 8000a858 <digits>
    800085f8:	00f7f693          	andi	a3,a5,15
    800085fc:	00dd86b3          	add	a3,s11,a3
    80008600:	0006c583          	lbu	a1,0(a3)
    80008604:	ff100613          	li	a2,-15
    80008608:	0047d69b          	srliw	a3,a5,0x4
    8000860c:	f8b40023          	sb	a1,-128(s0)
    80008610:	0047d59b          	srliw	a1,a5,0x4
    80008614:	0ac75e63          	bge	a4,a2,800086d0 <__printf+0x668>
    80008618:	00f6f693          	andi	a3,a3,15
    8000861c:	00dd86b3          	add	a3,s11,a3
    80008620:	0006c603          	lbu	a2,0(a3)
    80008624:	00f00693          	li	a3,15
    80008628:	0087d79b          	srliw	a5,a5,0x8
    8000862c:	f8c400a3          	sb	a2,-127(s0)
    80008630:	d8b6e4e3          	bltu	a3,a1,800083b8 <__printf+0x350>
    80008634:	00200793          	li	a5,2
    80008638:	e2dff06f          	j	80008464 <__printf+0x3fc>
    8000863c:	00002c97          	auipc	s9,0x2
    80008640:	1fcc8c93          	addi	s9,s9,508 # 8000a838 <_ZZ9kPrintIntmE6digits+0x7c8>
    80008644:	02800513          	li	a0,40
    80008648:	ef1ff06f          	j	80008538 <__printf+0x4d0>
    8000864c:	00700793          	li	a5,7
    80008650:	00600c93          	li	s9,6
    80008654:	e0dff06f          	j	80008460 <__printf+0x3f8>
    80008658:	00700793          	li	a5,7
    8000865c:	00600c93          	li	s9,6
    80008660:	c69ff06f          	j	800082c8 <__printf+0x260>
    80008664:	00300793          	li	a5,3
    80008668:	00200c93          	li	s9,2
    8000866c:	c5dff06f          	j	800082c8 <__printf+0x260>
    80008670:	00300793          	li	a5,3
    80008674:	00200c93          	li	s9,2
    80008678:	de9ff06f          	j	80008460 <__printf+0x3f8>
    8000867c:	00400793          	li	a5,4
    80008680:	00300c93          	li	s9,3
    80008684:	dddff06f          	j	80008460 <__printf+0x3f8>
    80008688:	00400793          	li	a5,4
    8000868c:	00300c93          	li	s9,3
    80008690:	c39ff06f          	j	800082c8 <__printf+0x260>
    80008694:	00500793          	li	a5,5
    80008698:	00400c93          	li	s9,4
    8000869c:	c2dff06f          	j	800082c8 <__printf+0x260>
    800086a0:	00500793          	li	a5,5
    800086a4:	00400c93          	li	s9,4
    800086a8:	db9ff06f          	j	80008460 <__printf+0x3f8>
    800086ac:	00600793          	li	a5,6
    800086b0:	00500c93          	li	s9,5
    800086b4:	dadff06f          	j	80008460 <__printf+0x3f8>
    800086b8:	00600793          	li	a5,6
    800086bc:	00500c93          	li	s9,5
    800086c0:	c09ff06f          	j	800082c8 <__printf+0x260>
    800086c4:	00800793          	li	a5,8
    800086c8:	00700c93          	li	s9,7
    800086cc:	bfdff06f          	j	800082c8 <__printf+0x260>
    800086d0:	00100793          	li	a5,1
    800086d4:	d91ff06f          	j	80008464 <__printf+0x3fc>
    800086d8:	00100793          	li	a5,1
    800086dc:	bf1ff06f          	j	800082cc <__printf+0x264>
    800086e0:	00900793          	li	a5,9
    800086e4:	00800c93          	li	s9,8
    800086e8:	be1ff06f          	j	800082c8 <__printf+0x260>
    800086ec:	00002517          	auipc	a0,0x2
    800086f0:	15450513          	addi	a0,a0,340 # 8000a840 <_ZZ9kPrintIntmE6digits+0x7d0>
    800086f4:	00000097          	auipc	ra,0x0
    800086f8:	918080e7          	jalr	-1768(ra) # 8000800c <panic>

00000000800086fc <printfinit>:
    800086fc:	fe010113          	addi	sp,sp,-32
    80008700:	00813823          	sd	s0,16(sp)
    80008704:	00913423          	sd	s1,8(sp)
    80008708:	00113c23          	sd	ra,24(sp)
    8000870c:	02010413          	addi	s0,sp,32
    80008710:	00006497          	auipc	s1,0x6
    80008714:	9c048493          	addi	s1,s1,-1600 # 8000e0d0 <pr>
    80008718:	00048513          	mv	a0,s1
    8000871c:	00002597          	auipc	a1,0x2
    80008720:	13458593          	addi	a1,a1,308 # 8000a850 <_ZZ9kPrintIntmE6digits+0x7e0>
    80008724:	00000097          	auipc	ra,0x0
    80008728:	5f4080e7          	jalr	1524(ra) # 80008d18 <initlock>
    8000872c:	01813083          	ld	ra,24(sp)
    80008730:	01013403          	ld	s0,16(sp)
    80008734:	0004ac23          	sw	zero,24(s1)
    80008738:	00813483          	ld	s1,8(sp)
    8000873c:	02010113          	addi	sp,sp,32
    80008740:	00008067          	ret

0000000080008744 <uartinit>:
    80008744:	ff010113          	addi	sp,sp,-16
    80008748:	00813423          	sd	s0,8(sp)
    8000874c:	01010413          	addi	s0,sp,16
    80008750:	100007b7          	lui	a5,0x10000
    80008754:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008758:	f8000713          	li	a4,-128
    8000875c:	00e781a3          	sb	a4,3(a5)
    80008760:	00300713          	li	a4,3
    80008764:	00e78023          	sb	a4,0(a5)
    80008768:	000780a3          	sb	zero,1(a5)
    8000876c:	00e781a3          	sb	a4,3(a5)
    80008770:	00700693          	li	a3,7
    80008774:	00d78123          	sb	a3,2(a5)
    80008778:	00e780a3          	sb	a4,1(a5)
    8000877c:	00813403          	ld	s0,8(sp)
    80008780:	01010113          	addi	sp,sp,16
    80008784:	00008067          	ret

0000000080008788 <uartputc>:
    80008788:	00004797          	auipc	a5,0x4
    8000878c:	5907a783          	lw	a5,1424(a5) # 8000cd18 <panicked>
    80008790:	00078463          	beqz	a5,80008798 <uartputc+0x10>
    80008794:	0000006f          	j	80008794 <uartputc+0xc>
    80008798:	fd010113          	addi	sp,sp,-48
    8000879c:	02813023          	sd	s0,32(sp)
    800087a0:	00913c23          	sd	s1,24(sp)
    800087a4:	01213823          	sd	s2,16(sp)
    800087a8:	01313423          	sd	s3,8(sp)
    800087ac:	02113423          	sd	ra,40(sp)
    800087b0:	03010413          	addi	s0,sp,48
    800087b4:	00004917          	auipc	s2,0x4
    800087b8:	56c90913          	addi	s2,s2,1388 # 8000cd20 <uart_tx_r>
    800087bc:	00093783          	ld	a5,0(s2)
    800087c0:	00004497          	auipc	s1,0x4
    800087c4:	56848493          	addi	s1,s1,1384 # 8000cd28 <uart_tx_w>
    800087c8:	0004b703          	ld	a4,0(s1)
    800087cc:	02078693          	addi	a3,a5,32
    800087d0:	00050993          	mv	s3,a0
    800087d4:	02e69c63          	bne	a3,a4,8000880c <uartputc+0x84>
    800087d8:	00001097          	auipc	ra,0x1
    800087dc:	834080e7          	jalr	-1996(ra) # 8000900c <push_on>
    800087e0:	00093783          	ld	a5,0(s2)
    800087e4:	0004b703          	ld	a4,0(s1)
    800087e8:	02078793          	addi	a5,a5,32
    800087ec:	00e79463          	bne	a5,a4,800087f4 <uartputc+0x6c>
    800087f0:	0000006f          	j	800087f0 <uartputc+0x68>
    800087f4:	00001097          	auipc	ra,0x1
    800087f8:	88c080e7          	jalr	-1908(ra) # 80009080 <pop_on>
    800087fc:	00093783          	ld	a5,0(s2)
    80008800:	0004b703          	ld	a4,0(s1)
    80008804:	02078693          	addi	a3,a5,32
    80008808:	fce688e3          	beq	a3,a4,800087d8 <uartputc+0x50>
    8000880c:	01f77693          	andi	a3,a4,31
    80008810:	00006597          	auipc	a1,0x6
    80008814:	8e058593          	addi	a1,a1,-1824 # 8000e0f0 <uart_tx_buf>
    80008818:	00d586b3          	add	a3,a1,a3
    8000881c:	00170713          	addi	a4,a4,1
    80008820:	01368023          	sb	s3,0(a3)
    80008824:	00e4b023          	sd	a4,0(s1)
    80008828:	10000637          	lui	a2,0x10000
    8000882c:	02f71063          	bne	a4,a5,8000884c <uartputc+0xc4>
    80008830:	0340006f          	j	80008864 <uartputc+0xdc>
    80008834:	00074703          	lbu	a4,0(a4)
    80008838:	00f93023          	sd	a5,0(s2)
    8000883c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008840:	00093783          	ld	a5,0(s2)
    80008844:	0004b703          	ld	a4,0(s1)
    80008848:	00f70e63          	beq	a4,a5,80008864 <uartputc+0xdc>
    8000884c:	00564683          	lbu	a3,5(a2)
    80008850:	01f7f713          	andi	a4,a5,31
    80008854:	00e58733          	add	a4,a1,a4
    80008858:	0206f693          	andi	a3,a3,32
    8000885c:	00178793          	addi	a5,a5,1
    80008860:	fc069ae3          	bnez	a3,80008834 <uartputc+0xac>
    80008864:	02813083          	ld	ra,40(sp)
    80008868:	02013403          	ld	s0,32(sp)
    8000886c:	01813483          	ld	s1,24(sp)
    80008870:	01013903          	ld	s2,16(sp)
    80008874:	00813983          	ld	s3,8(sp)
    80008878:	03010113          	addi	sp,sp,48
    8000887c:	00008067          	ret

0000000080008880 <uartputc_sync>:
    80008880:	ff010113          	addi	sp,sp,-16
    80008884:	00813423          	sd	s0,8(sp)
    80008888:	01010413          	addi	s0,sp,16
    8000888c:	00004717          	auipc	a4,0x4
    80008890:	48c72703          	lw	a4,1164(a4) # 8000cd18 <panicked>
    80008894:	02071663          	bnez	a4,800088c0 <uartputc_sync+0x40>
    80008898:	00050793          	mv	a5,a0
    8000889c:	100006b7          	lui	a3,0x10000
    800088a0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800088a4:	02077713          	andi	a4,a4,32
    800088a8:	fe070ce3          	beqz	a4,800088a0 <uartputc_sync+0x20>
    800088ac:	0ff7f793          	andi	a5,a5,255
    800088b0:	00f68023          	sb	a5,0(a3)
    800088b4:	00813403          	ld	s0,8(sp)
    800088b8:	01010113          	addi	sp,sp,16
    800088bc:	00008067          	ret
    800088c0:	0000006f          	j	800088c0 <uartputc_sync+0x40>

00000000800088c4 <uartstart>:
    800088c4:	ff010113          	addi	sp,sp,-16
    800088c8:	00813423          	sd	s0,8(sp)
    800088cc:	01010413          	addi	s0,sp,16
    800088d0:	00004617          	auipc	a2,0x4
    800088d4:	45060613          	addi	a2,a2,1104 # 8000cd20 <uart_tx_r>
    800088d8:	00004517          	auipc	a0,0x4
    800088dc:	45050513          	addi	a0,a0,1104 # 8000cd28 <uart_tx_w>
    800088e0:	00063783          	ld	a5,0(a2)
    800088e4:	00053703          	ld	a4,0(a0)
    800088e8:	04f70263          	beq	a4,a5,8000892c <uartstart+0x68>
    800088ec:	100005b7          	lui	a1,0x10000
    800088f0:	00006817          	auipc	a6,0x6
    800088f4:	80080813          	addi	a6,a6,-2048 # 8000e0f0 <uart_tx_buf>
    800088f8:	01c0006f          	j	80008914 <uartstart+0x50>
    800088fc:	0006c703          	lbu	a4,0(a3)
    80008900:	00f63023          	sd	a5,0(a2)
    80008904:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008908:	00063783          	ld	a5,0(a2)
    8000890c:	00053703          	ld	a4,0(a0)
    80008910:	00f70e63          	beq	a4,a5,8000892c <uartstart+0x68>
    80008914:	01f7f713          	andi	a4,a5,31
    80008918:	00e806b3          	add	a3,a6,a4
    8000891c:	0055c703          	lbu	a4,5(a1)
    80008920:	00178793          	addi	a5,a5,1
    80008924:	02077713          	andi	a4,a4,32
    80008928:	fc071ae3          	bnez	a4,800088fc <uartstart+0x38>
    8000892c:	00813403          	ld	s0,8(sp)
    80008930:	01010113          	addi	sp,sp,16
    80008934:	00008067          	ret

0000000080008938 <uartgetc>:
    80008938:	ff010113          	addi	sp,sp,-16
    8000893c:	00813423          	sd	s0,8(sp)
    80008940:	01010413          	addi	s0,sp,16
    80008944:	10000737          	lui	a4,0x10000
    80008948:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000894c:	0017f793          	andi	a5,a5,1
    80008950:	00078c63          	beqz	a5,80008968 <uartgetc+0x30>
    80008954:	00074503          	lbu	a0,0(a4)
    80008958:	0ff57513          	andi	a0,a0,255
    8000895c:	00813403          	ld	s0,8(sp)
    80008960:	01010113          	addi	sp,sp,16
    80008964:	00008067          	ret
    80008968:	fff00513          	li	a0,-1
    8000896c:	ff1ff06f          	j	8000895c <uartgetc+0x24>

0000000080008970 <uartintr>:
    80008970:	100007b7          	lui	a5,0x10000
    80008974:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008978:	0017f793          	andi	a5,a5,1
    8000897c:	0a078463          	beqz	a5,80008a24 <uartintr+0xb4>
    80008980:	fe010113          	addi	sp,sp,-32
    80008984:	00813823          	sd	s0,16(sp)
    80008988:	00913423          	sd	s1,8(sp)
    8000898c:	00113c23          	sd	ra,24(sp)
    80008990:	02010413          	addi	s0,sp,32
    80008994:	100004b7          	lui	s1,0x10000
    80008998:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000899c:	0ff57513          	andi	a0,a0,255
    800089a0:	fffff097          	auipc	ra,0xfffff
    800089a4:	534080e7          	jalr	1332(ra) # 80007ed4 <consoleintr>
    800089a8:	0054c783          	lbu	a5,5(s1)
    800089ac:	0017f793          	andi	a5,a5,1
    800089b0:	fe0794e3          	bnez	a5,80008998 <uartintr+0x28>
    800089b4:	00004617          	auipc	a2,0x4
    800089b8:	36c60613          	addi	a2,a2,876 # 8000cd20 <uart_tx_r>
    800089bc:	00004517          	auipc	a0,0x4
    800089c0:	36c50513          	addi	a0,a0,876 # 8000cd28 <uart_tx_w>
    800089c4:	00063783          	ld	a5,0(a2)
    800089c8:	00053703          	ld	a4,0(a0)
    800089cc:	04f70263          	beq	a4,a5,80008a10 <uartintr+0xa0>
    800089d0:	100005b7          	lui	a1,0x10000
    800089d4:	00005817          	auipc	a6,0x5
    800089d8:	71c80813          	addi	a6,a6,1820 # 8000e0f0 <uart_tx_buf>
    800089dc:	01c0006f          	j	800089f8 <uartintr+0x88>
    800089e0:	0006c703          	lbu	a4,0(a3)
    800089e4:	00f63023          	sd	a5,0(a2)
    800089e8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800089ec:	00063783          	ld	a5,0(a2)
    800089f0:	00053703          	ld	a4,0(a0)
    800089f4:	00f70e63          	beq	a4,a5,80008a10 <uartintr+0xa0>
    800089f8:	01f7f713          	andi	a4,a5,31
    800089fc:	00e806b3          	add	a3,a6,a4
    80008a00:	0055c703          	lbu	a4,5(a1)
    80008a04:	00178793          	addi	a5,a5,1
    80008a08:	02077713          	andi	a4,a4,32
    80008a0c:	fc071ae3          	bnez	a4,800089e0 <uartintr+0x70>
    80008a10:	01813083          	ld	ra,24(sp)
    80008a14:	01013403          	ld	s0,16(sp)
    80008a18:	00813483          	ld	s1,8(sp)
    80008a1c:	02010113          	addi	sp,sp,32
    80008a20:	00008067          	ret
    80008a24:	00004617          	auipc	a2,0x4
    80008a28:	2fc60613          	addi	a2,a2,764 # 8000cd20 <uart_tx_r>
    80008a2c:	00004517          	auipc	a0,0x4
    80008a30:	2fc50513          	addi	a0,a0,764 # 8000cd28 <uart_tx_w>
    80008a34:	00063783          	ld	a5,0(a2)
    80008a38:	00053703          	ld	a4,0(a0)
    80008a3c:	04f70263          	beq	a4,a5,80008a80 <uartintr+0x110>
    80008a40:	100005b7          	lui	a1,0x10000
    80008a44:	00005817          	auipc	a6,0x5
    80008a48:	6ac80813          	addi	a6,a6,1708 # 8000e0f0 <uart_tx_buf>
    80008a4c:	01c0006f          	j	80008a68 <uartintr+0xf8>
    80008a50:	0006c703          	lbu	a4,0(a3)
    80008a54:	00f63023          	sd	a5,0(a2)
    80008a58:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008a5c:	00063783          	ld	a5,0(a2)
    80008a60:	00053703          	ld	a4,0(a0)
    80008a64:	02f70063          	beq	a4,a5,80008a84 <uartintr+0x114>
    80008a68:	01f7f713          	andi	a4,a5,31
    80008a6c:	00e806b3          	add	a3,a6,a4
    80008a70:	0055c703          	lbu	a4,5(a1)
    80008a74:	00178793          	addi	a5,a5,1
    80008a78:	02077713          	andi	a4,a4,32
    80008a7c:	fc071ae3          	bnez	a4,80008a50 <uartintr+0xe0>
    80008a80:	00008067          	ret
    80008a84:	00008067          	ret

0000000080008a88 <kinit>:
    80008a88:	fc010113          	addi	sp,sp,-64
    80008a8c:	02913423          	sd	s1,40(sp)
    80008a90:	fffff7b7          	lui	a5,0xfffff
    80008a94:	00006497          	auipc	s1,0x6
    80008a98:	67b48493          	addi	s1,s1,1659 # 8000f10f <end+0xfff>
    80008a9c:	02813823          	sd	s0,48(sp)
    80008aa0:	01313c23          	sd	s3,24(sp)
    80008aa4:	00f4f4b3          	and	s1,s1,a5
    80008aa8:	02113c23          	sd	ra,56(sp)
    80008aac:	03213023          	sd	s2,32(sp)
    80008ab0:	01413823          	sd	s4,16(sp)
    80008ab4:	01513423          	sd	s5,8(sp)
    80008ab8:	04010413          	addi	s0,sp,64
    80008abc:	000017b7          	lui	a5,0x1
    80008ac0:	01100993          	li	s3,17
    80008ac4:	00f487b3          	add	a5,s1,a5
    80008ac8:	01b99993          	slli	s3,s3,0x1b
    80008acc:	06f9e063          	bltu	s3,a5,80008b2c <kinit+0xa4>
    80008ad0:	00005a97          	auipc	s5,0x5
    80008ad4:	640a8a93          	addi	s5,s5,1600 # 8000e110 <end>
    80008ad8:	0754ec63          	bltu	s1,s5,80008b50 <kinit+0xc8>
    80008adc:	0734fa63          	bgeu	s1,s3,80008b50 <kinit+0xc8>
    80008ae0:	00088a37          	lui	s4,0x88
    80008ae4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008ae8:	00004917          	auipc	s2,0x4
    80008aec:	24890913          	addi	s2,s2,584 # 8000cd30 <kmem>
    80008af0:	00ca1a13          	slli	s4,s4,0xc
    80008af4:	0140006f          	j	80008b08 <kinit+0x80>
    80008af8:	000017b7          	lui	a5,0x1
    80008afc:	00f484b3          	add	s1,s1,a5
    80008b00:	0554e863          	bltu	s1,s5,80008b50 <kinit+0xc8>
    80008b04:	0534f663          	bgeu	s1,s3,80008b50 <kinit+0xc8>
    80008b08:	00001637          	lui	a2,0x1
    80008b0c:	00100593          	li	a1,1
    80008b10:	00048513          	mv	a0,s1
    80008b14:	00000097          	auipc	ra,0x0
    80008b18:	5e4080e7          	jalr	1508(ra) # 800090f8 <__memset>
    80008b1c:	00093783          	ld	a5,0(s2)
    80008b20:	00f4b023          	sd	a5,0(s1)
    80008b24:	00993023          	sd	s1,0(s2)
    80008b28:	fd4498e3          	bne	s1,s4,80008af8 <kinit+0x70>
    80008b2c:	03813083          	ld	ra,56(sp)
    80008b30:	03013403          	ld	s0,48(sp)
    80008b34:	02813483          	ld	s1,40(sp)
    80008b38:	02013903          	ld	s2,32(sp)
    80008b3c:	01813983          	ld	s3,24(sp)
    80008b40:	01013a03          	ld	s4,16(sp)
    80008b44:	00813a83          	ld	s5,8(sp)
    80008b48:	04010113          	addi	sp,sp,64
    80008b4c:	00008067          	ret
    80008b50:	00002517          	auipc	a0,0x2
    80008b54:	d2050513          	addi	a0,a0,-736 # 8000a870 <digits+0x18>
    80008b58:	fffff097          	auipc	ra,0xfffff
    80008b5c:	4b4080e7          	jalr	1204(ra) # 8000800c <panic>

0000000080008b60 <freerange>:
    80008b60:	fc010113          	addi	sp,sp,-64
    80008b64:	000017b7          	lui	a5,0x1
    80008b68:	02913423          	sd	s1,40(sp)
    80008b6c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008b70:	009504b3          	add	s1,a0,s1
    80008b74:	fffff537          	lui	a0,0xfffff
    80008b78:	02813823          	sd	s0,48(sp)
    80008b7c:	02113c23          	sd	ra,56(sp)
    80008b80:	03213023          	sd	s2,32(sp)
    80008b84:	01313c23          	sd	s3,24(sp)
    80008b88:	01413823          	sd	s4,16(sp)
    80008b8c:	01513423          	sd	s5,8(sp)
    80008b90:	01613023          	sd	s6,0(sp)
    80008b94:	04010413          	addi	s0,sp,64
    80008b98:	00a4f4b3          	and	s1,s1,a0
    80008b9c:	00f487b3          	add	a5,s1,a5
    80008ba0:	06f5e463          	bltu	a1,a5,80008c08 <freerange+0xa8>
    80008ba4:	00005a97          	auipc	s5,0x5
    80008ba8:	56ca8a93          	addi	s5,s5,1388 # 8000e110 <end>
    80008bac:	0954e263          	bltu	s1,s5,80008c30 <freerange+0xd0>
    80008bb0:	01100993          	li	s3,17
    80008bb4:	01b99993          	slli	s3,s3,0x1b
    80008bb8:	0734fc63          	bgeu	s1,s3,80008c30 <freerange+0xd0>
    80008bbc:	00058a13          	mv	s4,a1
    80008bc0:	00004917          	auipc	s2,0x4
    80008bc4:	17090913          	addi	s2,s2,368 # 8000cd30 <kmem>
    80008bc8:	00002b37          	lui	s6,0x2
    80008bcc:	0140006f          	j	80008be0 <freerange+0x80>
    80008bd0:	000017b7          	lui	a5,0x1
    80008bd4:	00f484b3          	add	s1,s1,a5
    80008bd8:	0554ec63          	bltu	s1,s5,80008c30 <freerange+0xd0>
    80008bdc:	0534fa63          	bgeu	s1,s3,80008c30 <freerange+0xd0>
    80008be0:	00001637          	lui	a2,0x1
    80008be4:	00100593          	li	a1,1
    80008be8:	00048513          	mv	a0,s1
    80008bec:	00000097          	auipc	ra,0x0
    80008bf0:	50c080e7          	jalr	1292(ra) # 800090f8 <__memset>
    80008bf4:	00093703          	ld	a4,0(s2)
    80008bf8:	016487b3          	add	a5,s1,s6
    80008bfc:	00e4b023          	sd	a4,0(s1)
    80008c00:	00993023          	sd	s1,0(s2)
    80008c04:	fcfa76e3          	bgeu	s4,a5,80008bd0 <freerange+0x70>
    80008c08:	03813083          	ld	ra,56(sp)
    80008c0c:	03013403          	ld	s0,48(sp)
    80008c10:	02813483          	ld	s1,40(sp)
    80008c14:	02013903          	ld	s2,32(sp)
    80008c18:	01813983          	ld	s3,24(sp)
    80008c1c:	01013a03          	ld	s4,16(sp)
    80008c20:	00813a83          	ld	s5,8(sp)
    80008c24:	00013b03          	ld	s6,0(sp)
    80008c28:	04010113          	addi	sp,sp,64
    80008c2c:	00008067          	ret
    80008c30:	00002517          	auipc	a0,0x2
    80008c34:	c4050513          	addi	a0,a0,-960 # 8000a870 <digits+0x18>
    80008c38:	fffff097          	auipc	ra,0xfffff
    80008c3c:	3d4080e7          	jalr	980(ra) # 8000800c <panic>

0000000080008c40 <kfree>:
    80008c40:	fe010113          	addi	sp,sp,-32
    80008c44:	00813823          	sd	s0,16(sp)
    80008c48:	00113c23          	sd	ra,24(sp)
    80008c4c:	00913423          	sd	s1,8(sp)
    80008c50:	02010413          	addi	s0,sp,32
    80008c54:	03451793          	slli	a5,a0,0x34
    80008c58:	04079c63          	bnez	a5,80008cb0 <kfree+0x70>
    80008c5c:	00005797          	auipc	a5,0x5
    80008c60:	4b478793          	addi	a5,a5,1204 # 8000e110 <end>
    80008c64:	00050493          	mv	s1,a0
    80008c68:	04f56463          	bltu	a0,a5,80008cb0 <kfree+0x70>
    80008c6c:	01100793          	li	a5,17
    80008c70:	01b79793          	slli	a5,a5,0x1b
    80008c74:	02f57e63          	bgeu	a0,a5,80008cb0 <kfree+0x70>
    80008c78:	00001637          	lui	a2,0x1
    80008c7c:	00100593          	li	a1,1
    80008c80:	00000097          	auipc	ra,0x0
    80008c84:	478080e7          	jalr	1144(ra) # 800090f8 <__memset>
    80008c88:	00004797          	auipc	a5,0x4
    80008c8c:	0a878793          	addi	a5,a5,168 # 8000cd30 <kmem>
    80008c90:	0007b703          	ld	a4,0(a5)
    80008c94:	01813083          	ld	ra,24(sp)
    80008c98:	01013403          	ld	s0,16(sp)
    80008c9c:	00e4b023          	sd	a4,0(s1)
    80008ca0:	0097b023          	sd	s1,0(a5)
    80008ca4:	00813483          	ld	s1,8(sp)
    80008ca8:	02010113          	addi	sp,sp,32
    80008cac:	00008067          	ret
    80008cb0:	00002517          	auipc	a0,0x2
    80008cb4:	bc050513          	addi	a0,a0,-1088 # 8000a870 <digits+0x18>
    80008cb8:	fffff097          	auipc	ra,0xfffff
    80008cbc:	354080e7          	jalr	852(ra) # 8000800c <panic>

0000000080008cc0 <kalloc>:
    80008cc0:	fe010113          	addi	sp,sp,-32
    80008cc4:	00813823          	sd	s0,16(sp)
    80008cc8:	00913423          	sd	s1,8(sp)
    80008ccc:	00113c23          	sd	ra,24(sp)
    80008cd0:	02010413          	addi	s0,sp,32
    80008cd4:	00004797          	auipc	a5,0x4
    80008cd8:	05c78793          	addi	a5,a5,92 # 8000cd30 <kmem>
    80008cdc:	0007b483          	ld	s1,0(a5)
    80008ce0:	02048063          	beqz	s1,80008d00 <kalloc+0x40>
    80008ce4:	0004b703          	ld	a4,0(s1)
    80008ce8:	00001637          	lui	a2,0x1
    80008cec:	00500593          	li	a1,5
    80008cf0:	00048513          	mv	a0,s1
    80008cf4:	00e7b023          	sd	a4,0(a5)
    80008cf8:	00000097          	auipc	ra,0x0
    80008cfc:	400080e7          	jalr	1024(ra) # 800090f8 <__memset>
    80008d00:	01813083          	ld	ra,24(sp)
    80008d04:	01013403          	ld	s0,16(sp)
    80008d08:	00048513          	mv	a0,s1
    80008d0c:	00813483          	ld	s1,8(sp)
    80008d10:	02010113          	addi	sp,sp,32
    80008d14:	00008067          	ret

0000000080008d18 <initlock>:
    80008d18:	ff010113          	addi	sp,sp,-16
    80008d1c:	00813423          	sd	s0,8(sp)
    80008d20:	01010413          	addi	s0,sp,16
    80008d24:	00813403          	ld	s0,8(sp)
    80008d28:	00b53423          	sd	a1,8(a0)
    80008d2c:	00052023          	sw	zero,0(a0)
    80008d30:	00053823          	sd	zero,16(a0)
    80008d34:	01010113          	addi	sp,sp,16
    80008d38:	00008067          	ret

0000000080008d3c <acquire>:
    80008d3c:	fe010113          	addi	sp,sp,-32
    80008d40:	00813823          	sd	s0,16(sp)
    80008d44:	00913423          	sd	s1,8(sp)
    80008d48:	00113c23          	sd	ra,24(sp)
    80008d4c:	01213023          	sd	s2,0(sp)
    80008d50:	02010413          	addi	s0,sp,32
    80008d54:	00050493          	mv	s1,a0
    80008d58:	10002973          	csrr	s2,sstatus
    80008d5c:	100027f3          	csrr	a5,sstatus
    80008d60:	ffd7f793          	andi	a5,a5,-3
    80008d64:	10079073          	csrw	sstatus,a5
    80008d68:	fffff097          	auipc	ra,0xfffff
    80008d6c:	8ec080e7          	jalr	-1812(ra) # 80007654 <mycpu>
    80008d70:	07852783          	lw	a5,120(a0)
    80008d74:	06078e63          	beqz	a5,80008df0 <acquire+0xb4>
    80008d78:	fffff097          	auipc	ra,0xfffff
    80008d7c:	8dc080e7          	jalr	-1828(ra) # 80007654 <mycpu>
    80008d80:	07852783          	lw	a5,120(a0)
    80008d84:	0004a703          	lw	a4,0(s1)
    80008d88:	0017879b          	addiw	a5,a5,1
    80008d8c:	06f52c23          	sw	a5,120(a0)
    80008d90:	04071063          	bnez	a4,80008dd0 <acquire+0x94>
    80008d94:	00100713          	li	a4,1
    80008d98:	00070793          	mv	a5,a4
    80008d9c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008da0:	0007879b          	sext.w	a5,a5
    80008da4:	fe079ae3          	bnez	a5,80008d98 <acquire+0x5c>
    80008da8:	0ff0000f          	fence
    80008dac:	fffff097          	auipc	ra,0xfffff
    80008db0:	8a8080e7          	jalr	-1880(ra) # 80007654 <mycpu>
    80008db4:	01813083          	ld	ra,24(sp)
    80008db8:	01013403          	ld	s0,16(sp)
    80008dbc:	00a4b823          	sd	a0,16(s1)
    80008dc0:	00013903          	ld	s2,0(sp)
    80008dc4:	00813483          	ld	s1,8(sp)
    80008dc8:	02010113          	addi	sp,sp,32
    80008dcc:	00008067          	ret
    80008dd0:	0104b903          	ld	s2,16(s1)
    80008dd4:	fffff097          	auipc	ra,0xfffff
    80008dd8:	880080e7          	jalr	-1920(ra) # 80007654 <mycpu>
    80008ddc:	faa91ce3          	bne	s2,a0,80008d94 <acquire+0x58>
    80008de0:	00002517          	auipc	a0,0x2
    80008de4:	a9850513          	addi	a0,a0,-1384 # 8000a878 <digits+0x20>
    80008de8:	fffff097          	auipc	ra,0xfffff
    80008dec:	224080e7          	jalr	548(ra) # 8000800c <panic>
    80008df0:	00195913          	srli	s2,s2,0x1
    80008df4:	fffff097          	auipc	ra,0xfffff
    80008df8:	860080e7          	jalr	-1952(ra) # 80007654 <mycpu>
    80008dfc:	00197913          	andi	s2,s2,1
    80008e00:	07252e23          	sw	s2,124(a0)
    80008e04:	f75ff06f          	j	80008d78 <acquire+0x3c>

0000000080008e08 <release>:
    80008e08:	fe010113          	addi	sp,sp,-32
    80008e0c:	00813823          	sd	s0,16(sp)
    80008e10:	00113c23          	sd	ra,24(sp)
    80008e14:	00913423          	sd	s1,8(sp)
    80008e18:	01213023          	sd	s2,0(sp)
    80008e1c:	02010413          	addi	s0,sp,32
    80008e20:	00052783          	lw	a5,0(a0)
    80008e24:	00079a63          	bnez	a5,80008e38 <release+0x30>
    80008e28:	00002517          	auipc	a0,0x2
    80008e2c:	a5850513          	addi	a0,a0,-1448 # 8000a880 <digits+0x28>
    80008e30:	fffff097          	auipc	ra,0xfffff
    80008e34:	1dc080e7          	jalr	476(ra) # 8000800c <panic>
    80008e38:	01053903          	ld	s2,16(a0)
    80008e3c:	00050493          	mv	s1,a0
    80008e40:	fffff097          	auipc	ra,0xfffff
    80008e44:	814080e7          	jalr	-2028(ra) # 80007654 <mycpu>
    80008e48:	fea910e3          	bne	s2,a0,80008e28 <release+0x20>
    80008e4c:	0004b823          	sd	zero,16(s1)
    80008e50:	0ff0000f          	fence
    80008e54:	0f50000f          	fence	iorw,ow
    80008e58:	0804a02f          	amoswap.w	zero,zero,(s1)
    80008e5c:	ffffe097          	auipc	ra,0xffffe
    80008e60:	7f8080e7          	jalr	2040(ra) # 80007654 <mycpu>
    80008e64:	100027f3          	csrr	a5,sstatus
    80008e68:	0027f793          	andi	a5,a5,2
    80008e6c:	04079a63          	bnez	a5,80008ec0 <release+0xb8>
    80008e70:	07852783          	lw	a5,120(a0)
    80008e74:	02f05e63          	blez	a5,80008eb0 <release+0xa8>
    80008e78:	fff7871b          	addiw	a4,a5,-1
    80008e7c:	06e52c23          	sw	a4,120(a0)
    80008e80:	00071c63          	bnez	a4,80008e98 <release+0x90>
    80008e84:	07c52783          	lw	a5,124(a0)
    80008e88:	00078863          	beqz	a5,80008e98 <release+0x90>
    80008e8c:	100027f3          	csrr	a5,sstatus
    80008e90:	0027e793          	ori	a5,a5,2
    80008e94:	10079073          	csrw	sstatus,a5
    80008e98:	01813083          	ld	ra,24(sp)
    80008e9c:	01013403          	ld	s0,16(sp)
    80008ea0:	00813483          	ld	s1,8(sp)
    80008ea4:	00013903          	ld	s2,0(sp)
    80008ea8:	02010113          	addi	sp,sp,32
    80008eac:	00008067          	ret
    80008eb0:	00002517          	auipc	a0,0x2
    80008eb4:	9f050513          	addi	a0,a0,-1552 # 8000a8a0 <digits+0x48>
    80008eb8:	fffff097          	auipc	ra,0xfffff
    80008ebc:	154080e7          	jalr	340(ra) # 8000800c <panic>
    80008ec0:	00002517          	auipc	a0,0x2
    80008ec4:	9c850513          	addi	a0,a0,-1592 # 8000a888 <digits+0x30>
    80008ec8:	fffff097          	auipc	ra,0xfffff
    80008ecc:	144080e7          	jalr	324(ra) # 8000800c <panic>

0000000080008ed0 <holding>:
    80008ed0:	00052783          	lw	a5,0(a0)
    80008ed4:	00079663          	bnez	a5,80008ee0 <holding+0x10>
    80008ed8:	00000513          	li	a0,0
    80008edc:	00008067          	ret
    80008ee0:	fe010113          	addi	sp,sp,-32
    80008ee4:	00813823          	sd	s0,16(sp)
    80008ee8:	00913423          	sd	s1,8(sp)
    80008eec:	00113c23          	sd	ra,24(sp)
    80008ef0:	02010413          	addi	s0,sp,32
    80008ef4:	01053483          	ld	s1,16(a0)
    80008ef8:	ffffe097          	auipc	ra,0xffffe
    80008efc:	75c080e7          	jalr	1884(ra) # 80007654 <mycpu>
    80008f00:	01813083          	ld	ra,24(sp)
    80008f04:	01013403          	ld	s0,16(sp)
    80008f08:	40a48533          	sub	a0,s1,a0
    80008f0c:	00153513          	seqz	a0,a0
    80008f10:	00813483          	ld	s1,8(sp)
    80008f14:	02010113          	addi	sp,sp,32
    80008f18:	00008067          	ret

0000000080008f1c <push_off>:
    80008f1c:	fe010113          	addi	sp,sp,-32
    80008f20:	00813823          	sd	s0,16(sp)
    80008f24:	00113c23          	sd	ra,24(sp)
    80008f28:	00913423          	sd	s1,8(sp)
    80008f2c:	02010413          	addi	s0,sp,32
    80008f30:	100024f3          	csrr	s1,sstatus
    80008f34:	100027f3          	csrr	a5,sstatus
    80008f38:	ffd7f793          	andi	a5,a5,-3
    80008f3c:	10079073          	csrw	sstatus,a5
    80008f40:	ffffe097          	auipc	ra,0xffffe
    80008f44:	714080e7          	jalr	1812(ra) # 80007654 <mycpu>
    80008f48:	07852783          	lw	a5,120(a0)
    80008f4c:	02078663          	beqz	a5,80008f78 <push_off+0x5c>
    80008f50:	ffffe097          	auipc	ra,0xffffe
    80008f54:	704080e7          	jalr	1796(ra) # 80007654 <mycpu>
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
    80008f80:	6d8080e7          	jalr	1752(ra) # 80007654 <mycpu>
    80008f84:	0014f493          	andi	s1,s1,1
    80008f88:	06952e23          	sw	s1,124(a0)
    80008f8c:	fc5ff06f          	j	80008f50 <push_off+0x34>

0000000080008f90 <pop_off>:
    80008f90:	ff010113          	addi	sp,sp,-16
    80008f94:	00813023          	sd	s0,0(sp)
    80008f98:	00113423          	sd	ra,8(sp)
    80008f9c:	01010413          	addi	s0,sp,16
    80008fa0:	ffffe097          	auipc	ra,0xffffe
    80008fa4:	6b4080e7          	jalr	1716(ra) # 80007654 <mycpu>
    80008fa8:	100027f3          	csrr	a5,sstatus
    80008fac:	0027f793          	andi	a5,a5,2
    80008fb0:	04079663          	bnez	a5,80008ffc <pop_off+0x6c>
    80008fb4:	07852783          	lw	a5,120(a0)
    80008fb8:	02f05a63          	blez	a5,80008fec <pop_off+0x5c>
    80008fbc:	fff7871b          	addiw	a4,a5,-1
    80008fc0:	06e52c23          	sw	a4,120(a0)
    80008fc4:	00071c63          	bnez	a4,80008fdc <pop_off+0x4c>
    80008fc8:	07c52783          	lw	a5,124(a0)
    80008fcc:	00078863          	beqz	a5,80008fdc <pop_off+0x4c>
    80008fd0:	100027f3          	csrr	a5,sstatus
    80008fd4:	0027e793          	ori	a5,a5,2
    80008fd8:	10079073          	csrw	sstatus,a5
    80008fdc:	00813083          	ld	ra,8(sp)
    80008fe0:	00013403          	ld	s0,0(sp)
    80008fe4:	01010113          	addi	sp,sp,16
    80008fe8:	00008067          	ret
    80008fec:	00002517          	auipc	a0,0x2
    80008ff0:	8b450513          	addi	a0,a0,-1868 # 8000a8a0 <digits+0x48>
    80008ff4:	fffff097          	auipc	ra,0xfffff
    80008ff8:	018080e7          	jalr	24(ra) # 8000800c <panic>
    80008ffc:	00002517          	auipc	a0,0x2
    80009000:	88c50513          	addi	a0,a0,-1908 # 8000a888 <digits+0x30>
    80009004:	fffff097          	auipc	ra,0xfffff
    80009008:	008080e7          	jalr	8(ra) # 8000800c <panic>

000000008000900c <push_on>:
    8000900c:	fe010113          	addi	sp,sp,-32
    80009010:	00813823          	sd	s0,16(sp)
    80009014:	00113c23          	sd	ra,24(sp)
    80009018:	00913423          	sd	s1,8(sp)
    8000901c:	02010413          	addi	s0,sp,32
    80009020:	100024f3          	csrr	s1,sstatus
    80009024:	100027f3          	csrr	a5,sstatus
    80009028:	0027e793          	ori	a5,a5,2
    8000902c:	10079073          	csrw	sstatus,a5
    80009030:	ffffe097          	auipc	ra,0xffffe
    80009034:	624080e7          	jalr	1572(ra) # 80007654 <mycpu>
    80009038:	07852783          	lw	a5,120(a0)
    8000903c:	02078663          	beqz	a5,80009068 <push_on+0x5c>
    80009040:	ffffe097          	auipc	ra,0xffffe
    80009044:	614080e7          	jalr	1556(ra) # 80007654 <mycpu>
    80009048:	07852783          	lw	a5,120(a0)
    8000904c:	01813083          	ld	ra,24(sp)
    80009050:	01013403          	ld	s0,16(sp)
    80009054:	0017879b          	addiw	a5,a5,1
    80009058:	06f52c23          	sw	a5,120(a0)
    8000905c:	00813483          	ld	s1,8(sp)
    80009060:	02010113          	addi	sp,sp,32
    80009064:	00008067          	ret
    80009068:	0014d493          	srli	s1,s1,0x1
    8000906c:	ffffe097          	auipc	ra,0xffffe
    80009070:	5e8080e7          	jalr	1512(ra) # 80007654 <mycpu>
    80009074:	0014f493          	andi	s1,s1,1
    80009078:	06952e23          	sw	s1,124(a0)
    8000907c:	fc5ff06f          	j	80009040 <push_on+0x34>

0000000080009080 <pop_on>:
    80009080:	ff010113          	addi	sp,sp,-16
    80009084:	00813023          	sd	s0,0(sp)
    80009088:	00113423          	sd	ra,8(sp)
    8000908c:	01010413          	addi	s0,sp,16
    80009090:	ffffe097          	auipc	ra,0xffffe
    80009094:	5c4080e7          	jalr	1476(ra) # 80007654 <mycpu>
    80009098:	100027f3          	csrr	a5,sstatus
    8000909c:	0027f793          	andi	a5,a5,2
    800090a0:	04078463          	beqz	a5,800090e8 <pop_on+0x68>
    800090a4:	07852783          	lw	a5,120(a0)
    800090a8:	02f05863          	blez	a5,800090d8 <pop_on+0x58>
    800090ac:	fff7879b          	addiw	a5,a5,-1
    800090b0:	06f52c23          	sw	a5,120(a0)
    800090b4:	07853783          	ld	a5,120(a0)
    800090b8:	00079863          	bnez	a5,800090c8 <pop_on+0x48>
    800090bc:	100027f3          	csrr	a5,sstatus
    800090c0:	ffd7f793          	andi	a5,a5,-3
    800090c4:	10079073          	csrw	sstatus,a5
    800090c8:	00813083          	ld	ra,8(sp)
    800090cc:	00013403          	ld	s0,0(sp)
    800090d0:	01010113          	addi	sp,sp,16
    800090d4:	00008067          	ret
    800090d8:	00001517          	auipc	a0,0x1
    800090dc:	7f050513          	addi	a0,a0,2032 # 8000a8c8 <digits+0x70>
    800090e0:	fffff097          	auipc	ra,0xfffff
    800090e4:	f2c080e7          	jalr	-212(ra) # 8000800c <panic>
    800090e8:	00001517          	auipc	a0,0x1
    800090ec:	7c050513          	addi	a0,a0,1984 # 8000a8a8 <digits+0x50>
    800090f0:	fffff097          	auipc	ra,0xfffff
    800090f4:	f1c080e7          	jalr	-228(ra) # 8000800c <panic>

00000000800090f8 <__memset>:
    800090f8:	ff010113          	addi	sp,sp,-16
    800090fc:	00813423          	sd	s0,8(sp)
    80009100:	01010413          	addi	s0,sp,16
    80009104:	1a060e63          	beqz	a2,800092c0 <__memset+0x1c8>
    80009108:	40a007b3          	neg	a5,a0
    8000910c:	0077f793          	andi	a5,a5,7
    80009110:	00778693          	addi	a3,a5,7
    80009114:	00b00813          	li	a6,11
    80009118:	0ff5f593          	andi	a1,a1,255
    8000911c:	fff6071b          	addiw	a4,a2,-1
    80009120:	1b06e663          	bltu	a3,a6,800092cc <__memset+0x1d4>
    80009124:	1cd76463          	bltu	a4,a3,800092ec <__memset+0x1f4>
    80009128:	1a078e63          	beqz	a5,800092e4 <__memset+0x1ec>
    8000912c:	00b50023          	sb	a1,0(a0)
    80009130:	00100713          	li	a4,1
    80009134:	1ae78463          	beq	a5,a4,800092dc <__memset+0x1e4>
    80009138:	00b500a3          	sb	a1,1(a0)
    8000913c:	00200713          	li	a4,2
    80009140:	1ae78a63          	beq	a5,a4,800092f4 <__memset+0x1fc>
    80009144:	00b50123          	sb	a1,2(a0)
    80009148:	00300713          	li	a4,3
    8000914c:	18e78463          	beq	a5,a4,800092d4 <__memset+0x1dc>
    80009150:	00b501a3          	sb	a1,3(a0)
    80009154:	00400713          	li	a4,4
    80009158:	1ae78263          	beq	a5,a4,800092fc <__memset+0x204>
    8000915c:	00b50223          	sb	a1,4(a0)
    80009160:	00500713          	li	a4,5
    80009164:	1ae78063          	beq	a5,a4,80009304 <__memset+0x20c>
    80009168:	00b502a3          	sb	a1,5(a0)
    8000916c:	00700713          	li	a4,7
    80009170:	18e79e63          	bne	a5,a4,8000930c <__memset+0x214>
    80009174:	00b50323          	sb	a1,6(a0)
    80009178:	00700e93          	li	t4,7
    8000917c:	00859713          	slli	a4,a1,0x8
    80009180:	00e5e733          	or	a4,a1,a4
    80009184:	01059e13          	slli	t3,a1,0x10
    80009188:	01c76e33          	or	t3,a4,t3
    8000918c:	01859313          	slli	t1,a1,0x18
    80009190:	006e6333          	or	t1,t3,t1
    80009194:	02059893          	slli	a7,a1,0x20
    80009198:	40f60e3b          	subw	t3,a2,a5
    8000919c:	011368b3          	or	a7,t1,a7
    800091a0:	02859813          	slli	a6,a1,0x28
    800091a4:	0108e833          	or	a6,a7,a6
    800091a8:	03059693          	slli	a3,a1,0x30
    800091ac:	003e589b          	srliw	a7,t3,0x3
    800091b0:	00d866b3          	or	a3,a6,a3
    800091b4:	03859713          	slli	a4,a1,0x38
    800091b8:	00389813          	slli	a6,a7,0x3
    800091bc:	00f507b3          	add	a5,a0,a5
    800091c0:	00e6e733          	or	a4,a3,a4
    800091c4:	000e089b          	sext.w	a7,t3
    800091c8:	00f806b3          	add	a3,a6,a5
    800091cc:	00e7b023          	sd	a4,0(a5)
    800091d0:	00878793          	addi	a5,a5,8
    800091d4:	fed79ce3          	bne	a5,a3,800091cc <__memset+0xd4>
    800091d8:	ff8e7793          	andi	a5,t3,-8
    800091dc:	0007871b          	sext.w	a4,a5
    800091e0:	01d787bb          	addw	a5,a5,t4
    800091e4:	0ce88e63          	beq	a7,a4,800092c0 <__memset+0x1c8>
    800091e8:	00f50733          	add	a4,a0,a5
    800091ec:	00b70023          	sb	a1,0(a4)
    800091f0:	0017871b          	addiw	a4,a5,1
    800091f4:	0cc77663          	bgeu	a4,a2,800092c0 <__memset+0x1c8>
    800091f8:	00e50733          	add	a4,a0,a4
    800091fc:	00b70023          	sb	a1,0(a4)
    80009200:	0027871b          	addiw	a4,a5,2
    80009204:	0ac77e63          	bgeu	a4,a2,800092c0 <__memset+0x1c8>
    80009208:	00e50733          	add	a4,a0,a4
    8000920c:	00b70023          	sb	a1,0(a4)
    80009210:	0037871b          	addiw	a4,a5,3
    80009214:	0ac77663          	bgeu	a4,a2,800092c0 <__memset+0x1c8>
    80009218:	00e50733          	add	a4,a0,a4
    8000921c:	00b70023          	sb	a1,0(a4)
    80009220:	0047871b          	addiw	a4,a5,4
    80009224:	08c77e63          	bgeu	a4,a2,800092c0 <__memset+0x1c8>
    80009228:	00e50733          	add	a4,a0,a4
    8000922c:	00b70023          	sb	a1,0(a4)
    80009230:	0057871b          	addiw	a4,a5,5
    80009234:	08c77663          	bgeu	a4,a2,800092c0 <__memset+0x1c8>
    80009238:	00e50733          	add	a4,a0,a4
    8000923c:	00b70023          	sb	a1,0(a4)
    80009240:	0067871b          	addiw	a4,a5,6
    80009244:	06c77e63          	bgeu	a4,a2,800092c0 <__memset+0x1c8>
    80009248:	00e50733          	add	a4,a0,a4
    8000924c:	00b70023          	sb	a1,0(a4)
    80009250:	0077871b          	addiw	a4,a5,7
    80009254:	06c77663          	bgeu	a4,a2,800092c0 <__memset+0x1c8>
    80009258:	00e50733          	add	a4,a0,a4
    8000925c:	00b70023          	sb	a1,0(a4)
    80009260:	0087871b          	addiw	a4,a5,8
    80009264:	04c77e63          	bgeu	a4,a2,800092c0 <__memset+0x1c8>
    80009268:	00e50733          	add	a4,a0,a4
    8000926c:	00b70023          	sb	a1,0(a4)
    80009270:	0097871b          	addiw	a4,a5,9
    80009274:	04c77663          	bgeu	a4,a2,800092c0 <__memset+0x1c8>
    80009278:	00e50733          	add	a4,a0,a4
    8000927c:	00b70023          	sb	a1,0(a4)
    80009280:	00a7871b          	addiw	a4,a5,10
    80009284:	02c77e63          	bgeu	a4,a2,800092c0 <__memset+0x1c8>
    80009288:	00e50733          	add	a4,a0,a4
    8000928c:	00b70023          	sb	a1,0(a4)
    80009290:	00b7871b          	addiw	a4,a5,11
    80009294:	02c77663          	bgeu	a4,a2,800092c0 <__memset+0x1c8>
    80009298:	00e50733          	add	a4,a0,a4
    8000929c:	00b70023          	sb	a1,0(a4)
    800092a0:	00c7871b          	addiw	a4,a5,12
    800092a4:	00c77e63          	bgeu	a4,a2,800092c0 <__memset+0x1c8>
    800092a8:	00e50733          	add	a4,a0,a4
    800092ac:	00b70023          	sb	a1,0(a4)
    800092b0:	00d7879b          	addiw	a5,a5,13
    800092b4:	00c7f663          	bgeu	a5,a2,800092c0 <__memset+0x1c8>
    800092b8:	00f507b3          	add	a5,a0,a5
    800092bc:	00b78023          	sb	a1,0(a5)
    800092c0:	00813403          	ld	s0,8(sp)
    800092c4:	01010113          	addi	sp,sp,16
    800092c8:	00008067          	ret
    800092cc:	00b00693          	li	a3,11
    800092d0:	e55ff06f          	j	80009124 <__memset+0x2c>
    800092d4:	00300e93          	li	t4,3
    800092d8:	ea5ff06f          	j	8000917c <__memset+0x84>
    800092dc:	00100e93          	li	t4,1
    800092e0:	e9dff06f          	j	8000917c <__memset+0x84>
    800092e4:	00000e93          	li	t4,0
    800092e8:	e95ff06f          	j	8000917c <__memset+0x84>
    800092ec:	00000793          	li	a5,0
    800092f0:	ef9ff06f          	j	800091e8 <__memset+0xf0>
    800092f4:	00200e93          	li	t4,2
    800092f8:	e85ff06f          	j	8000917c <__memset+0x84>
    800092fc:	00400e93          	li	t4,4
    80009300:	e7dff06f          	j	8000917c <__memset+0x84>
    80009304:	00500e93          	li	t4,5
    80009308:	e75ff06f          	j	8000917c <__memset+0x84>
    8000930c:	00600e93          	li	t4,6
    80009310:	e6dff06f          	j	8000917c <__memset+0x84>

0000000080009314 <__memmove>:
    80009314:	ff010113          	addi	sp,sp,-16
    80009318:	00813423          	sd	s0,8(sp)
    8000931c:	01010413          	addi	s0,sp,16
    80009320:	0e060863          	beqz	a2,80009410 <__memmove+0xfc>
    80009324:	fff6069b          	addiw	a3,a2,-1
    80009328:	0006881b          	sext.w	a6,a3
    8000932c:	0ea5e863          	bltu	a1,a0,8000941c <__memmove+0x108>
    80009330:	00758713          	addi	a4,a1,7
    80009334:	00a5e7b3          	or	a5,a1,a0
    80009338:	40a70733          	sub	a4,a4,a0
    8000933c:	0077f793          	andi	a5,a5,7
    80009340:	00f73713          	sltiu	a4,a4,15
    80009344:	00174713          	xori	a4,a4,1
    80009348:	0017b793          	seqz	a5,a5
    8000934c:	00e7f7b3          	and	a5,a5,a4
    80009350:	10078863          	beqz	a5,80009460 <__memmove+0x14c>
    80009354:	00900793          	li	a5,9
    80009358:	1107f463          	bgeu	a5,a6,80009460 <__memmove+0x14c>
    8000935c:	0036581b          	srliw	a6,a2,0x3
    80009360:	fff8081b          	addiw	a6,a6,-1
    80009364:	02081813          	slli	a6,a6,0x20
    80009368:	01d85893          	srli	a7,a6,0x1d
    8000936c:	00858813          	addi	a6,a1,8
    80009370:	00058793          	mv	a5,a1
    80009374:	00050713          	mv	a4,a0
    80009378:	01088833          	add	a6,a7,a6
    8000937c:	0007b883          	ld	a7,0(a5)
    80009380:	00878793          	addi	a5,a5,8
    80009384:	00870713          	addi	a4,a4,8
    80009388:	ff173c23          	sd	a7,-8(a4)
    8000938c:	ff0798e3          	bne	a5,a6,8000937c <__memmove+0x68>
    80009390:	ff867713          	andi	a4,a2,-8
    80009394:	02071793          	slli	a5,a4,0x20
    80009398:	0207d793          	srli	a5,a5,0x20
    8000939c:	00f585b3          	add	a1,a1,a5
    800093a0:	40e686bb          	subw	a3,a3,a4
    800093a4:	00f507b3          	add	a5,a0,a5
    800093a8:	06e60463          	beq	a2,a4,80009410 <__memmove+0xfc>
    800093ac:	0005c703          	lbu	a4,0(a1)
    800093b0:	00e78023          	sb	a4,0(a5)
    800093b4:	04068e63          	beqz	a3,80009410 <__memmove+0xfc>
    800093b8:	0015c603          	lbu	a2,1(a1)
    800093bc:	00100713          	li	a4,1
    800093c0:	00c780a3          	sb	a2,1(a5)
    800093c4:	04e68663          	beq	a3,a4,80009410 <__memmove+0xfc>
    800093c8:	0025c603          	lbu	a2,2(a1)
    800093cc:	00200713          	li	a4,2
    800093d0:	00c78123          	sb	a2,2(a5)
    800093d4:	02e68e63          	beq	a3,a4,80009410 <__memmove+0xfc>
    800093d8:	0035c603          	lbu	a2,3(a1)
    800093dc:	00300713          	li	a4,3
    800093e0:	00c781a3          	sb	a2,3(a5)
    800093e4:	02e68663          	beq	a3,a4,80009410 <__memmove+0xfc>
    800093e8:	0045c603          	lbu	a2,4(a1)
    800093ec:	00400713          	li	a4,4
    800093f0:	00c78223          	sb	a2,4(a5)
    800093f4:	00e68e63          	beq	a3,a4,80009410 <__memmove+0xfc>
    800093f8:	0055c603          	lbu	a2,5(a1)
    800093fc:	00500713          	li	a4,5
    80009400:	00c782a3          	sb	a2,5(a5)
    80009404:	00e68663          	beq	a3,a4,80009410 <__memmove+0xfc>
    80009408:	0065c703          	lbu	a4,6(a1)
    8000940c:	00e78323          	sb	a4,6(a5)
    80009410:	00813403          	ld	s0,8(sp)
    80009414:	01010113          	addi	sp,sp,16
    80009418:	00008067          	ret
    8000941c:	02061713          	slli	a4,a2,0x20
    80009420:	02075713          	srli	a4,a4,0x20
    80009424:	00e587b3          	add	a5,a1,a4
    80009428:	f0f574e3          	bgeu	a0,a5,80009330 <__memmove+0x1c>
    8000942c:	02069613          	slli	a2,a3,0x20
    80009430:	02065613          	srli	a2,a2,0x20
    80009434:	fff64613          	not	a2,a2
    80009438:	00e50733          	add	a4,a0,a4
    8000943c:	00c78633          	add	a2,a5,a2
    80009440:	fff7c683          	lbu	a3,-1(a5)
    80009444:	fff78793          	addi	a5,a5,-1
    80009448:	fff70713          	addi	a4,a4,-1
    8000944c:	00d70023          	sb	a3,0(a4)
    80009450:	fec798e3          	bne	a5,a2,80009440 <__memmove+0x12c>
    80009454:	00813403          	ld	s0,8(sp)
    80009458:	01010113          	addi	sp,sp,16
    8000945c:	00008067          	ret
    80009460:	02069713          	slli	a4,a3,0x20
    80009464:	02075713          	srli	a4,a4,0x20
    80009468:	00170713          	addi	a4,a4,1
    8000946c:	00e50733          	add	a4,a0,a4
    80009470:	00050793          	mv	a5,a0
    80009474:	0005c683          	lbu	a3,0(a1)
    80009478:	00178793          	addi	a5,a5,1
    8000947c:	00158593          	addi	a1,a1,1
    80009480:	fed78fa3          	sb	a3,-1(a5)
    80009484:	fee798e3          	bne	a5,a4,80009474 <__memmove+0x160>
    80009488:	f89ff06f          	j	80009410 <__memmove+0xfc>
	...
